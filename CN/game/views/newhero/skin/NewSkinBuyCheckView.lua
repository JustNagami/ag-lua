local var_0_0 = class("NewSkinBuyCheckView", ReduxView)
local var_0_1 = {
	OnlySkin = 1,
	OnlyDlc = 2,
	SpecialShow = 3,
	FakeData = 5,
	BuyDlcAndSkin = 4
}

function var_0_0.UIName(arg_1_0)
	return "Widget/System/Recharge/RechargeSkinPopUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiPop.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:InitUI()
	arg_3_0:AddUIListener()
end

function var_0_0.InitUI(arg_4_0)
	arg_4_0:BindCfgUI()

	arg_4_0.dlcselController = arg_4_0.controller_:GetController("dlcsel")
	arg_4_0.dlcbtnController = arg_4_0.controller_:GetController("dlcbtn")
	arg_4_0.dlcbgController = arg_4_0.controller_:GetController("dlcbg")
	arg_4_0.dlcIconController = arg_4_0.controller_:GetController("dlcIcon")
	arg_4_0.discountController = arg_4_0.controller_:GetController("discount")
end

function var_0_0.AddUIListener(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.maskBtn_, nil, function()
		arg_5_0:Back()
	end)
	arg_5_0:AddBtnListener(arg_5_0.calcelBtn_, nil, function()
		arg_5_0:Back()
	end)
	arg_5_0:AddBtnListener(arg_5_0.jumpBtn_, nil, function()
		local var_8_0 = getShopCfg(arg_5_0.dlcID)

		ShowMessageBox({
			content = string.format(GetTips("SHOP_DLC_LINK"), ItemTools.getItemName(arg_5_0.itemDlcCfg.id)),
			OkCallback = function()
				JumpTools.GoToSystem("/shop", {
					shopId = var_8_0.shop_id,
					goodId = arg_5_0.dlcID
				}, ViewConst.SYSTEM_ID.SHOP)
			end
		})
	end)
	arg_5_0:AddBtnListener(arg_5_0.checkBtn_, nil, function()
		local var_10_0, var_10_1, var_10_2 = ShopTools.GetPrice(arg_5_0.goodID)
		local var_10_3 = var_10_0
		local var_10_4 = {
			arg_5_0.goodID
		}

		if arg_5_0.showModel == var_0_1.BuyDlcAndSkin then
			local var_10_5, var_10_6, var_10_7 = ShopTools.GetPrice(arg_5_0.dlcID)

			var_10_3 = var_10_3 + var_10_5

			table.insert(var_10_4, arg_5_0.dlcID)
		elseif arg_5_0.showModel == var_0_1.OnlyDlc then
			local var_10_8, var_10_9, var_10_10 = ShopTools.GetPrice(arg_5_0.dlcID)

			var_10_3 = var_10_8
		elseif arg_5_0.showModel == var_0_1.FakeData then
			var_10_4 = {
				arg_5_0.dlcID
			}
		end

		local function var_10_11(arg_11_0)
			if ShopTools.IsRMB(arg_11_0[1]) then
				PayAction.RequestGSPay(ShopTools.GetCostId(arg_5_0.goodID), 1, arg_5_0.shopID, arg_11_0[1])
			elseif arg_5_0.showModel == var_0_1.BuyDlcAndSkin then
				ShopTools.ConfirmBuySkin(arg_11_0, {
					1,
					1
				})
			elseif arg_5_0.showModel == var_0_1.FakeData then
				ShopTools.ConfirmBuySkin(arg_11_0, {
					1,
					1
				})
			else
				ShopTools.ConfirmBuyItem(arg_11_0[1], 1)
			end
		end

		local function var_10_12()
			if ShopTools.IsRMB(arg_5_0.goodID) == false and ShopTools.GetCostCount(arg_5_0.goodID) < var_10_3 then
				if ShopTools.IsSkin(arg_5_0.goodID) then
					arg_5_0:SkinIsdeficiency()
				else
					var_10_11(var_10_4)
				end
			else
				var_10_11(var_10_4)
				SDKTools.SendPaymentMessageToSDK("payment_touch", {
					payment_skin_buy_unlock = 0
				})
			end
		end

		SDKTools.SendPaymentMessageToSDK("payment_touch", {
			payment_skin_buy_check = arg_5_0.skinID
		})

		if ShopData.IsGoodOutOfDate(arg_5_0.goodID) then
			ShowTips("SKIN_SALE_FINISH")
			arg_5_0:Back()

			return
		end

		if HeroData:GetHeroData(arg_5_0.heroID).unlock == 0 then
			ShowMessageBox({
				title = GetTips("PROMPT"),
				content = string.format(GetTips("NOT_HAVE_HERO_SKIN_CONFIRM"), GetI18NText(arg_5_0.heroCfg.name)),
				OkCallback = var_10_12,
				CancelCallback = function()
					SDKTools.SendPaymentMessageToSDK("payment_touch", {
						payment_skin_buy_unlock = 1
					})
				end
			})
		else
			var_10_12()
		end
	end)
	arg_5_0:AddBtnListener(arg_5_0.dlcBtn_, nil, function()
		if ShopTools.CheckDlcCanBuy(arg_5_0.dlcID) and ShopTools.CheckDlcPurchased(arg_5_0.dlcID) == false then
			if arg_5_0.params_.selectDlc == true then
				arg_5_0.dlcselController:SetSelectedState("false")

				arg_5_0.params_.selectDlc = false
			else
				arg_5_0.params_.selectDlc = true

				arg_5_0.dlcselController:SetSelectedState("true")

				arg_5_0.dlcIcon_.sprite = getSpriteWithoutAtlas("TextureConfig/Character/Portrait/" .. arg_5_0.skinCfg.id)
			end
		end
	end)
	arg_5_0:AddBtnListener(arg_5_0.addDlcBtn_, nil, function()
		arg_5_0.showModel = var_0_1.BuyDlcAndSkin

		arg_5_0:UpdateView()
		arg_5_0.dlcbtnController:SetSelectedState("buy")

		if arg_5_0.dlcID then
			local var_15_0 = getShopCfg(arg_5_0.dlcID)

			if var_15_0 then
				local var_15_1 = var_15_0.give_id or var_15_0.description

				if var_15_1 then
					OperationRecorder.RecordButtonTouch("skin_buy_add_" .. var_15_1)
				end
			end
		end
	end)
	arg_5_0:AddBtnListener(arg_5_0.cancelDlcBtn_, nil, function()
		arg_5_0.showModel = var_0_1.OnlySkin

		arg_5_0:UpdateView()
	end)
	arg_5_0:AddBtnListener(arg_5_0.btnView_, nil, function()
		JumpTools.OpenPageByJump("/skinDlcShow", {
			goodId = arg_5_0.goodID
		})
	end)
end

function var_0_0.SkinIsdeficiency(arg_18_0)
	ShowMessageBox({
		content = string.format(GetTips("ERROR_ITEM_NOT_SKIN_TICKET_C")),
		OkCallback = function()
			JumpTools.GoToSystem("/rechargeMain", {
				childShopIndex = 4,
				page = 2
			}, ViewConst.SYSTEM_ID.RECHARGE_MAIN)
		end,
		CancelCallback = function()
			arg_18_0:Back()
		end
	})
end

function var_0_0.OnShopBuyResult(arg_21_0, arg_21_1, arg_21_2, arg_21_3, arg_21_4)
	if arg_21_1 == 0 then
		arg_21_0:Back()
	else
		arg_21_0:Back()
	end
end

function var_0_0.UpdateBar(arg_22_0)
	manager.windowBar:SwitchBar({
		CurrencyConst.CURRENCY_TYPE_DIAMOND,
		CurrencyConst.GetPlatformDiamondId(),
		CurrencyConst.CURRENCY_TYPE_SKIN
	})
	manager.windowBar:SetBarCanAdd(CurrencyConst.CURRENCY_TYPE_DIAMOND, true)
	manager.windowBar:SetBarCanAdd(CurrencyConst.GetPlatformDiamondId(), true)
	manager.windowBar:SetBarCanAdd(CurrencyConst.CURRENCY_TYPE_SKIN, true)
	manager.windowBar:SetBarCanClick(CurrencyConst.CURRENCY_TYPE_SKIN, true)
end

function var_0_0.OnTop(arg_23_0)
	arg_23_0:UpdateBar()
	manager.windowBar:SetAsLastSibling()
end

function var_0_0.UpdateData(arg_24_0)
	arg_24_0.shopCfg = getShopCfg(arg_24_0.goodID)
	arg_24_0.shopID = arg_24_0.shopCfg.shop_id
	arg_24_0.skinCfg = SkinCfg[arg_24_0.skinID]
	arg_24_0.heroCfg = HeroCfg[arg_24_0.skinCfg.hero]
	arg_24_0.desCfg = RechargeShopDescriptionCfg[arg_24_0.shopCfg.description]
	arg_24_0.descID = arg_24_0.desCfg.id
	arg_24_0.dlcID = arg_24_0.shopCfg.dlc or nil
	arg_24_0.shopDlcCfg = getShopCfg(arg_24_0.dlcID)
	arg_24_0.showModel = arg_24_0.params_.onlySkin and var_0_1.OnlySkin or var_0_1.BuyDlcAndSkin

	if arg_24_0.shopDlcCfg and arg_24_0.shopDlcCfg.shop_id == arg_24_0.shopID or arg_24_0.shopDlcCfg and arg_24_0.shopDlcCfg.shop_id == ShopConst.SHOP_ID.PASSPORT_SHOP then
		arg_24_0.itemDlcCfg = RechargeShopDescriptionCfg[arg_24_0.shopDlcCfg.description]

		if arg_24_0.itemDlcCfg == nil then
			arg_24_0.itemDlcCfg = ItemCfg[arg_24_0.shopDlcCfg.give_id]
			arg_24_0.showModel = var_0_1.OnlySkin
		end
	end

	if arg_24_0.goodID <= 0 then
		arg_24_0.showModel = var_0_1.FakeData
	elseif ShopTools.HaveSkin(arg_24_0.skinID) then
		arg_24_0.showModel = var_0_1.OnlyDlc
		arg_24_0.goodID = arg_24_0.dlcID
	end
end

function var_0_0.UpdatePrice(arg_25_0)
	local var_25_0, var_25_1, var_25_2 = ShopTools.GetPrice(arg_25_0.goodID)
	local var_25_3 = ItemCfg[arg_25_0.skinCfg.hero]

	SetActive(arg_25_0.oriOriceTxt_.gameObject, false)
	SetActive(arg_25_0.skinOriginTxt_.gameObject, false)
	SetActive(arg_25_0.dlcPrice_.gameObject, false)
	arg_25_0.dlcbgController:SetSelectedState(arg_25_0.showModel == var_0_1.OnlyDlc and "true" or "false")

	local var_25_4, var_25_5, var_25_6 = ShopTools.IsOnDiscountArea(arg_25_0.goodID)

	if arg_25_0.showModel == var_0_1.BuyDlcAndSkin then
		local var_25_7, var_25_8, var_25_9 = ShopTools.GetPrice(arg_25_0.dlcID)
		local var_25_10, var_25_11, var_25_12 = ShopTools.IsOnDiscountArea(arg_25_0.dlcID)

		if ShopTools.IsRMB(arg_25_0.goodID) then
			SetActive(arg_25_0.costiconImg_.gameObject, false)

			arg_25_0.priceText_.text = ShopTools.GetMoneySymbol(arg_25_0.goodID) .. var_25_0 + var_25_7
		else
			arg_25_0.buyDesc_.text = string.format(GetTips("BUY_SKIN_TIPS_TICKET"), ItemTools.getItemName(arg_25_0.shopCfg.cost_id), var_25_0 + var_25_7, ItemTools.getItemName(var_25_3.id), ItemTools.getItemName(arg_25_0.shopCfg.description)) .. string.format("+ <color=#E78300>「%s」</color>", ItemTools.getItemName(arg_25_0.itemDlcCfg.id))

			SetActive(arg_25_0.costiconImg_.gameObject, true)

			if var_25_4 and var_25_6 then
				SetActive(arg_25_0.skinOriginTxt_.gameObject, var_25_0 ~= var_25_1)

				if var_25_0 ~= var_25_1 then
					arg_25_0.skinOriginTxt_.text = var_25_1
				end
			end

			if var_25_10 and var_25_12 then
				SetActive(arg_25_0.oriOriceTxt_.gameObject, var_25_7 ~= var_25_8)

				if var_25_7 ~= var_25_8 then
					arg_25_0.oriOriceTxt_.text = var_25_8
				end
			else
				SetActive(arg_25_0.oriOriceTxt_.gameObject, false)
			end

			arg_25_0.costiconImg_.sprite = ItemTools.getItemLittleSprite(arg_25_0.shopCfg.cost_id)
			arg_25_0.priceText_.text = var_25_0 + var_25_7

			if ItemTools.getItemNum(arg_25_0.shopCfg.cost_id) < var_25_0 + var_25_7 then
				arg_25_0.priceText_.text = "<color=#FF000B>" .. var_25_0 + var_25_7 .. "</color>"
			end
		end

		if #arg_25_0.shopCfg.give_back_list ~= 0 then
			arg_25_0.rebackSkinTicketText_.text = arg_25_0.shopCfg.give_back_list[1].num
			arg_25_0.allrebackTxt_.text = ""
		end

		SetActive(arg_25_0.dlcPrice_.gameObject, true)

		arg_25_0.allPriceTxt_.text = string.format("( %d", var_25_0)
		arg_25_0.dlcPrice_.text = "+" .. var_25_7

		SetActive(arg_25_0.kuoGo_, true)
	else
		if arg_25_0.showModel == var_0_1.OnlyDlc or arg_25_0.showModel == var_0_1.FakeData then
			local var_25_13

			var_25_0, var_25_1, var_25_13 = ShopTools.GetPrice(arg_25_0.dlcID)
			arg_25_0.dlcItemIcon_.sprite = ItemTools.getItemSprite(arg_25_0.itemDlcCfg.id)

			SetActive(arg_25_0.oriOriceTxt_.gameObject, var_25_0 ~= var_25_1)

			if var_25_0 ~= var_25_1 then
				arg_25_0.oriOriceTxt_.text = var_25_1
			end
		end

		if ShopTools.IsRMB(arg_25_0.goodID) then
			SetActive(arg_25_0.costiconImg_.gameObject, false)

			arg_25_0.priceText_.text = ShopTools.GetMoneySymbol(arg_25_0.goodID) .. var_25_0
			arg_25_0.buyDesc_.text = string.format(GetTips("BUY_SKIN_TIPS"), ShopTools.GetMoneySymbol(arg_25_0.goodID) .. var_25_0, "", ItemTools.getItemName(var_25_3.id), ItemTools.getItemName(arg_25_0.shopCfg.description))

			if var_25_4 and var_25_6 then
				SetActive(arg_25_0.skinOriginTxt_.gameObject, var_25_0 ~= var_25_1)

				if var_25_0 ~= var_25_1 then
					arg_25_0.skinOriginTxt_.text = var_25_1
				end
			end
		else
			if arg_25_0.showModel == var_0_1.OnlyDlc then
				arg_25_0.buyDesc_.text = string.format(GetTips("BUY_SKIN_TIPS_TICKET"), ItemTools.getItemName(arg_25_0.shopDlcCfg.cost_id), var_25_0, ItemTools.getItemName(var_25_3.id), ItemTools.getItemName(arg_25_0.itemDlcCfg.id))
			elseif arg_25_0.showModel == var_0_1.FakeData then
				arg_25_0.buyDesc_.text = string.format(GetTips("BUY_SKIN_DLC_SINGLE_TIPS"), ItemTools.getItemName(arg_25_0.shopDlcCfg.cost_id), var_25_0, ItemTools.getItemName(var_25_3.id), ItemTools.getItemName(arg_25_0.itemDlcCfg.id))
			else
				arg_25_0.buyDesc_.text = string.format(GetTips("BUY_SKIN_TIPS_TICKET"), ItemTools.getItemName(arg_25_0.shopCfg.cost_id), var_25_0, ItemTools.getItemName(var_25_3.id), ItemTools.getItemName(arg_25_0.shopCfg.description))
			end

			if var_25_4 and var_25_6 then
				SetActive(arg_25_0.skinOriginTxt_.gameObject, var_25_0 ~= var_25_1 and arg_25_0.showModel ~= var_0_1.OnlyDlc)

				if var_25_0 ~= var_25_1 then
					arg_25_0.skinOriginTxt_.text = var_25_1
				end
			end

			SetActive(arg_25_0.costiconImg_.gameObject, true)

			arg_25_0.costiconImg_.sprite = ItemTools.getItemLittleSprite(arg_25_0.shopCfg.cost_id)
			arg_25_0.priceText_.text = var_25_0

			if var_25_0 > ItemTools.getItemNum(arg_25_0.shopCfg.cost_id) then
				arg_25_0.priceText_.text = "<color=#FF000B>" .. var_25_0 .. "</color>"
			end
		end

		if #arg_25_0.shopCfg.give_back_list ~= 0 then
			arg_25_0.rebackSkinTicketText_.text = arg_25_0.shopCfg.give_back_list[1].num
			arg_25_0.allrebackTxt_.text = ""
		end

		arg_25_0.allrebackTxt_.text = ""
		arg_25_0.allPriceTxt_.text = ""

		SetActive(arg_25_0.kuoGo_, false)
	end
end

function var_0_0.UpdateTitle(arg_26_0)
	if arg_26_0.showModel == var_0_1.OnlyDlc or arg_26_0.showModel == var_0_1.BuyDlcAndSkin or arg_26_0.showModel == var_0_1.FakeData then
		arg_26_0.textnameText_.text = ItemTools.getItemName(arg_26_0.itemDlcCfg.id)
		arg_26_0.textinfoText_.text = string.format(GetTips("BUY_SKIN_CHANGE"), ItemTools.getItemName(arg_26_0.itemDlcCfg.id)) .. ItemTools.getItemDesc(arg_26_0.itemDlcCfg.id)
	else
		arg_26_0.textnameText_.text = ItemTools.getItemName(arg_26_0.shopCfg.description)
		arg_26_0.textinfoText_.text = string.format(GetTips("BUY_SKIN_CHANGE"), ItemTools.getItemName(arg_26_0.shopCfg.description)) .. ItemTools.getItemDesc(arg_26_0.descID)
	end
end

function var_0_0.UpdateView(arg_27_0)
	arg_27_0:UpdatePrice()
	arg_27_0:UpdateTitle()
	SetActive(arg_27_0.dlcItemLimit_, false)
	SetActive(arg_27_0.freeGiveGo_, false)
	arg_27_0.dlcselController:SetSelectedState((arg_27_0.showModel == var_0_1.OnlyDlc or arg_27_0.showModel == var_0_1.BuyDlcAndSkin or arg_27_0.showModel == var_0_1.FakeData) and "true" or "false")
	SetActive(arg_27_0.giveBackGo_, #arg_27_0.shopCfg.give_back_list ~= 0 and arg_27_0.showModel ~= var_0_1.OnlyDlc)
	SetActive(arg_27_0.skinRemainGo_, false)

	arg_27_0.skinImg_.sprite = getSpriteViaConfig("HeroIcon", arg_27_0.skinCfg.picture_id)

	arg_27_0.skinImg_:SetNativeSize()
	arg_27_0.dlcIconController:SetSelectedState(arg_27_0.shopDlcCfg and "true" or "false")

	if arg_27_0.showModel == var_0_1.OnlyDlc then
		arg_27_0.dlcIconController:SetSelectedState("false")
	end

	if arg_27_0.showModel == var_0_1.FakeData then
		arg_27_0.littleSkinIcon_.sprite = getSpriteViaConfig("HeroLittleIcon", arg_27_0.skinCfg.picture_id)
		arg_27_0.dlcItemNameTxt_.text = string.format(ItemTools.getItemName(arg_27_0.desCfg.id))
		arg_27_0.dlcIcon_.sprite = getSpriteWithoutAtlas("TextureConfig/Character/Portrait/" .. arg_27_0.skinCfg.id .. "_character")

		arg_27_0.dlcbtnController:SetSelectedState("Events")
	elseif arg_27_0.dlcID and ShopTools.CheckDlcCanBuy(arg_27_0.dlcID) and ShopTools.CheckDlcPurchased(arg_27_0.dlcID) == false and arg_27_0.shopDlcCfg.shop_id == arg_27_0.shopID then
		if arg_27_0.showModel == var_0_1.BuyDlcAndSkin then
			arg_27_0.dlcbtnController:SetSelectedState("buy")
		else
			arg_27_0.dlcbtnController:SetSelectedState("notBuy")
		end

		arg_27_0.dlcIcon_.sprite = getSpriteWithoutAtlas("TextureConfig/Character/Portrait/" .. arg_27_0.skinCfg.id .. "_character")
		arg_27_0.dlcLittleIcon_.sprite = ItemTools.getItemSprite(arg_27_0.itemDlcCfg.id)
		arg_27_0.dlcBgImg_.sprite = getSpriteWithoutAtlas("TextureConfig/BackgroundQuad/" .. HomeSceneSettingCfg[arg_27_0.itemDlcCfg.id].prefix)
		arg_27_0.dlcbuyTxt_.text = string.format(GetTips("BUY_SKIN_DLC_TIPS"), ItemTools.getItemName(arg_27_0.itemDlcCfg.id))
		arg_27_0.dlcItemNameTxt_.text = string.format(ItemTools.getItemName(arg_27_0.itemDlcCfg.id))
	elseif arg_27_0.shopDlcCfg and ShopConst.SHOP_ID.DLC_SHOP ~= arg_27_0.shopDlcCfg.shop_id then
		arg_27_0.dlcbtnController:SetSelectedState(ShopTools.CheckDlcPurchased(arg_27_0.dlcID) == false and "cannotBuy" or "get")

		arg_27_0.dlcLittleIcon_.sprite = ItemTools.getItemSprite(arg_27_0.itemDlcCfg.id)
		arg_27_0.dlcItemNameTxt_.text = string.format(ItemTools.getItemName(arg_27_0.itemDlcCfg.id))
	else
		arg_27_0.dlcbtnController:SetSelectedState("none")
	end

	arg_27_0:UpdateTimeView()
end

function var_0_0.UpdateTimer(arg_28_0)
	arg_28_0:UpdateTimeView()

	if arg_28_0.timer_ == nil then
		arg_28_0.timer_ = Timer.New(function()
			arg_28_0:UpdateTimeView()
		end, 1, -1, -1)

		arg_28_0.timer_:Start()
	end
end

function var_0_0.UpdateTimeView(arg_30_0)
	if arg_30_0.showModel ~= var_0_1.OnlyDlc and arg_30_0.shopDlcCfg then
		local var_30_0, var_30_1, var_30_2 = ShopTools.IsOnDiscountArea(arg_30_0.dlcID)

		if var_30_0 and var_30_2 then
			SetActive(arg_30_0.dlcItemLimit_, arg_30_0.shopDlcCfg.is_limit_time_discount == 1)

			arg_30_0.dlcItemLimitTxt_.text = manager.time:GetLostTimeStr(TimeMgr.GetInstance():parseTimeFromConfig(arg_30_0.shopDlcCfg.cheap_close_time))
		else
			SetActive(arg_30_0.dlcItemLimit_, false)
		end
	end

	local var_30_3 = arg_30_0.shopCfg.close_time
	local var_30_4 = arg_30_0.shopCfg

	if arg_30_0.showModel == var_0_1.OnlyDlc then
		var_30_3 = arg_30_0.shopDlcCfg.close_time
		var_30_4 = arg_30_0.shopDlcCfg
	end

	SetActive(arg_30_0.timeGo_, #var_30_3 > 0)

	if #var_30_3 <= 0 then
		arg_30_0.discountController:SetSelectedState("none")
	end

	if #var_30_3 > 0 then
		local var_30_5 = TimeMgr.GetInstance():GetServerTime()
		local var_30_6 = TimeMgr.GetInstance():parseTimeFromConfig(var_30_3)

		if var_30_6 <= var_30_5 then
			arg_30_0.remainTxt_.text = GetTips("TIP_EXPIRED")
		else
			arg_30_0.remainTxt_.text = string.format("%s", manager.time:GetLostTimeStr(var_30_6))
		end
	end

	if #var_30_4.cheap_close_time > 0 then
		local var_30_7, var_30_8, var_30_9 = ShopTools.IsOnDiscountArea(var_30_4.goods_id)

		if var_30_7 and var_30_9 then
			arg_30_0.discountController:SetSelectedState("none")
			SetActive(arg_30_0.skinRemainGo_, var_30_4.is_limit_time_discount == 1)

			arg_30_0.skinRemianTxt_.text = manager.time:GetLostTimeStr(TimeMgr.GetInstance():parseTimeFromConfig(var_30_4.cheap_close_time))
		else
			arg_30_0.discountController:SetSelectedState("none")
			SetActive(arg_30_0.skinRemainGo_, false)
		end
	end

	arg_30_0:UpdatePrice()
end

function var_0_0.OnEnter(arg_31_0)
	arg_31_0.goodID = arg_31_0.params_.goodID
	arg_31_0.heroID = arg_31_0.params_.heroID
	arg_31_0.skinID = arg_31_0.params_.skinID

	arg_31_0:UpdateData()
	arg_31_0:UpdateView()
	arg_31_0:UpdateTimer()
	arg_31_0:RegistEventListener(RECHARGE_SUCCESS, function(arg_32_0)
		local var_32_0 = HeroTools.GetSkinChangeItem(arg_31_0.skinID)

		arg_31_0:Back()
		ShowMessageBox({
			title = GetTips("PROMPT"),
			content = string.format(GetTips("USE_SKIN_CHANGE"), ItemTools.getItemName(var_32_0)),
			OkCallback = function()
				CommonAction.TryToUseItem({
					{
						item_info = {
							num = 1,
							id = var_32_0
						},
						use_list = {}
					}
				})
			end
		})
	end)
end

function var_0_0.OnExit(arg_34_0)
	if arg_34_0.timer_ ~= nil then
		arg_34_0.timer_:Stop()

		arg_34_0.timer_ = nil
	end

	manager.windowBar:HideBar()
	arg_34_0:RemoveAllEventListener()
end

function var_0_0.Dispose(arg_35_0)
	var_0_0.super.Dispose(arg_35_0)
end

return var_0_0
