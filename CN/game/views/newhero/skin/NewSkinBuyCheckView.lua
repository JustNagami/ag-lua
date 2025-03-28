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
	arg_4_0.skinDiscountController = arg_4_0.controller_:GetController("skinEvent")
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

				arg_5_0.dlcIcon_.sprite = pureGetSpriteWithoutAtlas("TextureConfig/Character/Portrait/" .. arg_5_0.skinCfg.id)
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
	arg_5_0:AddBtnListener(arg_5_0.skinDiscountBtn_, nil, function()
		SkinDiscountGiftAction.JumpToSkinDiscountGiftWindow(arg_5_0.goodID)
	end)
end

function var_0_0.SkinIsdeficiency(arg_19_0)
	ShowMessageBox({
		content = string.format(GetTips("ERROR_ITEM_NOT_SKIN_TICKET_C")),
		OkCallback = function()
			JumpTools.GoToSystem("/rechargeMain", {
				childShopIndex = 4,
				page = 2
			}, ViewConst.SYSTEM_ID.RECHARGE_MAIN)
		end,
		CancelCallback = function()
			arg_19_0:Back()
		end
	})
end

function var_0_0.OnShopBuyResult(arg_22_0, arg_22_1, arg_22_2, arg_22_3, arg_22_4)
	if arg_22_1 == 0 then
		arg_22_0:Back()
	else
		arg_22_0:Back()
	end
end

function var_0_0.UpdateBar(arg_23_0)
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

function var_0_0.OnTop(arg_24_0)
	arg_24_0:UpdateBar()
	manager.windowBar:SetAsLastSibling()
end

function var_0_0.UpdateData(arg_25_0)
	arg_25_0.shopCfg = getShopCfg(arg_25_0.goodID)
	arg_25_0.shopID = arg_25_0.shopCfg.shop_id
	arg_25_0.skinCfg = SkinCfg[arg_25_0.skinID]
	arg_25_0.heroCfg = HeroCfg[arg_25_0.skinCfg.hero]
	arg_25_0.desCfg = RechargeShopDescriptionCfg[arg_25_0.shopCfg.description]
	arg_25_0.descID = arg_25_0.desCfg.id
	arg_25_0.dlcID = arg_25_0.shopCfg.dlc or nil
	arg_25_0.shopDlcCfg = getShopCfg(arg_25_0.dlcID)
	arg_25_0.showModel = arg_25_0.params_.onlySkin and var_0_1.OnlySkin or var_0_1.BuyDlcAndSkin

	if arg_25_0.shopDlcCfg and arg_25_0.shopDlcCfg.shop_id == arg_25_0.shopID or arg_25_0.shopDlcCfg and arg_25_0.shopDlcCfg.shop_id == ShopConst.SHOP_ID.PASSPORT_SHOP then
		arg_25_0.itemDlcCfg = RechargeShopDescriptionCfg[arg_25_0.shopDlcCfg.description]

		if arg_25_0.itemDlcCfg == nil then
			arg_25_0.itemDlcCfg = ItemCfg[arg_25_0.shopDlcCfg.give_id]
			arg_25_0.showModel = var_0_1.OnlySkin
		end
	end

	if arg_25_0.goodID <= 0 then
		arg_25_0.showModel = var_0_1.FakeData
	elseif ShopTools.HaveSkin(arg_25_0.skinID) then
		arg_25_0.showModel = var_0_1.OnlyDlc
		arg_25_0.goodID = arg_25_0.dlcID
	end
end

function var_0_0.UpdatePrice(arg_26_0)
	local var_26_0, var_26_1, var_26_2 = ShopTools.GetPrice(arg_26_0.goodID)
	local var_26_3 = ItemCfg[arg_26_0.skinCfg.hero]

	SetActive(arg_26_0.oriOriceTxt_.gameObject, false)
	SetActive(arg_26_0.skinOriginTxt_.gameObject, false)
	SetActive(arg_26_0.dlcPrice_.gameObject, false)
	arg_26_0.dlcbgController:SetSelectedState(arg_26_0.showModel == var_0_1.OnlyDlc and "true" or "false")

	local var_26_4, var_26_5, var_26_6 = ShopTools.IsOnDiscountArea(arg_26_0.goodID)

	if arg_26_0.showModel == var_0_1.BuyDlcAndSkin then
		local var_26_7, var_26_8, var_26_9 = ShopTools.GetPrice(arg_26_0.dlcID)
		local var_26_10, var_26_11, var_26_12 = ShopTools.IsOnDiscountArea(arg_26_0.dlcID)

		if ShopTools.IsRMB(arg_26_0.goodID) then
			SetActive(arg_26_0.costiconImg_.gameObject, false)

			arg_26_0.priceText_.text = ShopTools.GetMoneySymbol(arg_26_0.goodID) .. var_26_0 + var_26_7
		else
			arg_26_0.buyDesc_.text = string.format(GetTips("BUY_SKIN_TIPS_TICKET"), ItemTools.getItemName(arg_26_0.shopCfg.cost_id), var_26_0 + var_26_7, ItemTools.getItemName(var_26_3.id), ItemTools.getItemName(arg_26_0.shopCfg.description)) .. string.format("+ <color=#E78300>「%s」</color>", ItemTools.getItemName(arg_26_0.itemDlcCfg.id))

			SetActive(arg_26_0.costiconImg_.gameObject, true)

			if var_26_4 and var_26_6 then
				SetActive(arg_26_0.skinOriginTxt_.gameObject, var_26_0 ~= var_26_1)

				if var_26_0 ~= var_26_1 then
					arg_26_0.skinOriginTxt_.text = var_26_1
				end
			end

			if var_26_10 and var_26_12 then
				SetActive(arg_26_0.oriOriceTxt_.gameObject, var_26_7 ~= var_26_8)

				if var_26_7 ~= var_26_8 then
					arg_26_0.oriOriceTxt_.text = var_26_8
				end
			else
				SetActive(arg_26_0.oriOriceTxt_.gameObject, false)
			end

			arg_26_0.costiconImg_.sprite = ItemTools.getItemLittleSprite(arg_26_0.shopCfg.cost_id)
			arg_26_0.priceText_.text = var_26_0 + var_26_7

			if ItemTools.getItemNum(arg_26_0.shopCfg.cost_id) < var_26_0 + var_26_7 then
				arg_26_0.priceText_.text = "<color=#FF000B>" .. var_26_0 + var_26_7 .. "</color>"
			end
		end

		if #arg_26_0.shopCfg.give_back_list ~= 0 then
			arg_26_0.rebackSkinTicketText_.text = arg_26_0.shopCfg.give_back_list[1].num
			arg_26_0.allrebackTxt_.text = ""
		end

		SetActive(arg_26_0.dlcPrice_.gameObject, true)

		arg_26_0.allPriceTxt_.text = string.format("( %d", var_26_0)
		arg_26_0.dlcPrice_.text = "+" .. var_26_7

		SetActive(arg_26_0.kuoGo_, true)
	else
		if arg_26_0.showModel == var_0_1.OnlyDlc or arg_26_0.showModel == var_0_1.FakeData then
			local var_26_13

			var_26_0, var_26_1, var_26_13 = ShopTools.GetPrice(arg_26_0.dlcID)
			arg_26_0.dlcItemIcon_.sprite = ItemTools.getItemSprite(arg_26_0.itemDlcCfg.id)

			SetActive(arg_26_0.oriOriceTxt_.gameObject, var_26_0 ~= var_26_1)

			if var_26_0 ~= var_26_1 then
				arg_26_0.oriOriceTxt_.text = var_26_1
			end
		end

		if ShopTools.IsRMB(arg_26_0.goodID) then
			SetActive(arg_26_0.costiconImg_.gameObject, false)

			arg_26_0.priceText_.text = ShopTools.GetMoneySymbol(arg_26_0.goodID) .. var_26_0
			arg_26_0.buyDesc_.text = string.format(GetTips("BUY_SKIN_TIPS"), ShopTools.GetMoneySymbol(arg_26_0.goodID) .. var_26_0, "", ItemTools.getItemName(var_26_3.id), ItemTools.getItemName(arg_26_0.shopCfg.description))

			if var_26_4 and var_26_6 then
				SetActive(arg_26_0.skinOriginTxt_.gameObject, var_26_0 ~= var_26_1)

				if var_26_0 ~= var_26_1 then
					arg_26_0.skinOriginTxt_.text = var_26_1
				end
			end
		else
			if arg_26_0.showModel == var_0_1.OnlyDlc then
				arg_26_0.buyDesc_.text = string.format(GetTips("BUY_SKIN_TIPS_TICKET"), ItemTools.getItemName(arg_26_0.shopDlcCfg.cost_id), var_26_0, ItemTools.getItemName(var_26_3.id), ItemTools.getItemName(arg_26_0.itemDlcCfg.id))
			elseif arg_26_0.showModel == var_0_1.FakeData then
				arg_26_0.buyDesc_.text = string.format(GetTips("BUY_SKIN_DLC_SINGLE_TIPS"), ItemTools.getItemName(arg_26_0.shopDlcCfg.cost_id), var_26_0, ItemTools.getItemName(var_26_3.id), ItemTools.getItemName(arg_26_0.itemDlcCfg.id))
			else
				arg_26_0.buyDesc_.text = string.format(GetTips("BUY_SKIN_TIPS_TICKET"), ItemTools.getItemName(arg_26_0.shopCfg.cost_id), var_26_0, ItemTools.getItemName(var_26_3.id), ItemTools.getItemName(arg_26_0.shopCfg.description))
			end

			if var_26_4 and var_26_6 then
				SetActive(arg_26_0.skinOriginTxt_.gameObject, var_26_0 ~= var_26_1 and arg_26_0.showModel ~= var_0_1.OnlyDlc)

				if var_26_0 ~= var_26_1 then
					arg_26_0.skinOriginTxt_.text = var_26_1
				end
			end

			SetActive(arg_26_0.costiconImg_.gameObject, true)

			arg_26_0.costiconImg_.sprite = ItemTools.getItemLittleSprite(arg_26_0.shopCfg.cost_id)
			arg_26_0.priceText_.text = var_26_0

			if var_26_0 > ItemTools.getItemNum(arg_26_0.shopCfg.cost_id) then
				arg_26_0.priceText_.text = "<color=#FF000B>" .. var_26_0 .. "</color>"
			end
		end

		if #arg_26_0.shopCfg.give_back_list ~= 0 then
			arg_26_0.rebackSkinTicketText_.text = arg_26_0.shopCfg.give_back_list[1].num
			arg_26_0.allrebackTxt_.text = ""
		end

		arg_26_0.allrebackTxt_.text = ""
		arg_26_0.allPriceTxt_.text = ""

		SetActive(arg_26_0.kuoGo_, false)
	end
end

function var_0_0.UpdateTitle(arg_27_0)
	if arg_27_0.showModel == var_0_1.OnlyDlc or arg_27_0.showModel == var_0_1.BuyDlcAndSkin or arg_27_0.showModel == var_0_1.FakeData then
		arg_27_0.textnameText_.text = ItemTools.getItemName(arg_27_0.itemDlcCfg.id)
		arg_27_0.textinfoText_.text = string.format(GetTips("BUY_SKIN_CHANGE"), ItemTools.getItemName(arg_27_0.itemDlcCfg.id)) .. ItemTools.getItemDesc(arg_27_0.itemDlcCfg.id)
	else
		arg_27_0.textnameText_.text = ItemTools.getItemName(arg_27_0.shopCfg.description)
		arg_27_0.textinfoText_.text = string.format(GetTips("BUY_SKIN_CHANGE"), ItemTools.getItemName(arg_27_0.shopCfg.description)) .. ItemTools.getItemDesc(arg_27_0.descID)
	end
end

function var_0_0.UpdateView(arg_28_0)
	arg_28_0:UpdatePrice()
	arg_28_0:UpdateTitle()
	SetActive(arg_28_0.dlcItemLimit_, false)
	SetActive(arg_28_0.freeGiveGo_, false)
	arg_28_0.dlcselController:SetSelectedState((arg_28_0.showModel == var_0_1.OnlyDlc or arg_28_0.showModel == var_0_1.BuyDlcAndSkin or arg_28_0.showModel == var_0_1.FakeData) and "true" or "false")
	SetActive(arg_28_0.giveBackGo_, #arg_28_0.shopCfg.give_back_list ~= 0 and arg_28_0.showModel ~= var_0_1.OnlyDlc)
	SetActive(arg_28_0.skinRemainGo_, false)

	arg_28_0.skinImg_.sprite = getSpriteViaConfig("HeroIcon", arg_28_0.skinCfg.picture_id)

	arg_28_0.skinImg_:SetNativeSize()
	arg_28_0.dlcIconController:SetSelectedState(arg_28_0.shopDlcCfg and "true" or "false")

	if arg_28_0.showModel == var_0_1.OnlyDlc then
		arg_28_0.dlcIconController:SetSelectedState("false")
	end

	if arg_28_0.showModel == var_0_1.FakeData then
		arg_28_0.littleSkinIcon_.sprite = getSpriteViaConfig("HeroLittleIcon", arg_28_0.skinCfg.picture_id)
		arg_28_0.dlcItemNameTxt_.text = string.format(ItemTools.getItemName(arg_28_0.desCfg.id))
		arg_28_0.dlcIcon_.sprite = pureGetSpriteWithoutAtlas("TextureConfig/Character/Portrait/" .. arg_28_0.skinCfg.id .. "_character")

		arg_28_0.dlcbtnController:SetSelectedState("Events")
	elseif arg_28_0.dlcID and ShopTools.CheckDlcCanBuy(arg_28_0.dlcID) and ShopTools.CheckDlcPurchased(arg_28_0.dlcID) == false and arg_28_0.shopDlcCfg.shop_id == arg_28_0.shopID then
		if arg_28_0.showModel == var_0_1.BuyDlcAndSkin then
			arg_28_0.dlcbtnController:SetSelectedState("buy")
		else
			arg_28_0.dlcbtnController:SetSelectedState("notBuy")
		end

		arg_28_0.dlcIcon_.sprite = pureGetSpriteWithoutAtlas("TextureConfig/Character/Portrait/" .. arg_28_0.skinCfg.id .. "_character")
		arg_28_0.dlcLittleIcon_.sprite = ItemTools.getItemSprite(arg_28_0.itemDlcCfg.id)
		arg_28_0.dlcBgImg_.sprite = pureGetSpriteWithoutAtlas("TextureConfig/BackgroundQuad/" .. HomeSceneSettingCfg[arg_28_0.itemDlcCfg.id].prefix)
		arg_28_0.dlcbuyTxt_.text = string.format(GetTips("BUY_SKIN_DLC_TIPS"), ItemTools.getItemName(arg_28_0.itemDlcCfg.id))
		arg_28_0.dlcItemNameTxt_.text = string.format(ItemTools.getItemName(arg_28_0.itemDlcCfg.id))
	elseif arg_28_0.shopDlcCfg and ShopConst.SHOP_ID.DLC_SHOP ~= arg_28_0.shopDlcCfg.shop_id then
		arg_28_0.dlcbtnController:SetSelectedState(ShopTools.CheckDlcPurchased(arg_28_0.dlcID) == false and "cannotBuy" or "get")

		arg_28_0.dlcLittleIcon_.sprite = ItemTools.getItemSprite(arg_28_0.itemDlcCfg.id)
		arg_28_0.dlcItemNameTxt_.text = string.format(ItemTools.getItemName(arg_28_0.itemDlcCfg.id))
	else
		arg_28_0.dlcbtnController:SetSelectedState("none")
	end

	arg_28_0:UpdateTimeView()
	arg_28_0:UpdateSkinDiscountGift()
end

function var_0_0.UpdateTimer(arg_29_0)
	arg_29_0:UpdateTimeView()

	if arg_29_0.timer_ == nil then
		arg_29_0.timer_ = Timer.New(function()
			arg_29_0:UpdateTimeView()
		end, 1, -1, -1)

		arg_29_0.timer_:Start()
	end
end

function var_0_0.UpdateTimeView(arg_31_0)
	if arg_31_0.showModel ~= var_0_1.OnlyDlc and arg_31_0.shopDlcCfg then
		local var_31_0, var_31_1, var_31_2 = ShopTools.IsOnDiscountArea(arg_31_0.dlcID)

		if var_31_0 and var_31_2 then
			SetActive(arg_31_0.dlcItemLimit_, arg_31_0.shopDlcCfg.is_limit_time_discount == 1)

			arg_31_0.dlcItemLimitTxt_.text = manager.time:GetLostTimeStr(TimeMgr.GetInstance():parseTimeFromConfig(arg_31_0.shopDlcCfg.cheap_close_time))
		else
			SetActive(arg_31_0.dlcItemLimit_, false)
		end
	end

	local var_31_3 = arg_31_0.shopCfg.close_time
	local var_31_4 = arg_31_0.shopCfg

	if arg_31_0.showModel == var_0_1.OnlyDlc then
		var_31_3 = arg_31_0.shopDlcCfg.close_time
		var_31_4 = arg_31_0.shopDlcCfg
	end

	SetActive(arg_31_0.timeGo_, #var_31_3 > 0)

	if #var_31_3 <= 0 then
		arg_31_0.discountController:SetSelectedState("none")
	end

	if #var_31_3 > 0 then
		local var_31_5 = TimeMgr.GetInstance():GetServerTime()
		local var_31_6 = TimeMgr.GetInstance():parseTimeFromConfig(var_31_3)

		if var_31_6 <= var_31_5 then
			arg_31_0.remainTxt_.text = GetTips("TIP_EXPIRED")
		else
			arg_31_0.remainTxt_.text = string.format("%s", manager.time:GetLostTimeStr(var_31_6))
		end
	end

	if #var_31_4.cheap_close_time > 0 then
		local var_31_7, var_31_8, var_31_9 = ShopTools.IsOnDiscountArea(var_31_4.goods_id)

		if var_31_7 and var_31_9 then
			arg_31_0.discountController:SetSelectedState("none")
			SetActive(arg_31_0.skinRemainGo_, var_31_4.is_limit_time_discount == 1)

			arg_31_0.skinRemianTxt_.text = manager.time:GetLostTimeStr(TimeMgr.GetInstance():parseTimeFromConfig(var_31_4.cheap_close_time))
		else
			arg_31_0.discountController:SetSelectedState("none")
			SetActive(arg_31_0.skinRemainGo_, false)
		end
	end

	arg_31_0:UpdatePrice()
end

function var_0_0.UpdateSkinDiscountGift(arg_32_0)
	if SkinDiscountGiftTools.HasDiscountGoodsID(arg_32_0.goodID) then
		arg_32_0.skinDiscountController:SetSelectedState("state1")
	else
		arg_32_0.skinDiscountController:SetSelectedState("state0")
	end
end

function var_0_0.OnEnter(arg_33_0)
	arg_33_0.goodID = arg_33_0.params_.goodID
	arg_33_0.heroID = arg_33_0.params_.heroID
	arg_33_0.skinID = arg_33_0.params_.skinID

	arg_33_0:UpdateData()
	arg_33_0:UpdateView()
	arg_33_0:UpdateTimer()
	arg_33_0:RegistEventListener(RECHARGE_SUCCESS, function(arg_34_0)
		local var_34_0 = HeroTools.GetSkinChangeItem(arg_33_0.skinID)

		arg_33_0:Back()
		ShowMessageBox({
			title = GetTips("PROMPT"),
			content = string.format(GetTips("USE_SKIN_CHANGE"), ItemTools.getItemName(var_34_0)),
			OkCallback = function()
				CommonAction.TryToUseItem({
					{
						item_info = {
							num = 1,
							id = var_34_0
						},
						use_list = {}
					}
				})
			end
		})
	end)
end

function var_0_0.OnExit(arg_36_0)
	if arg_36_0.timer_ ~= nil then
		arg_36_0.timer_:Stop()

		arg_36_0.timer_ = nil
	end

	manager.windowBar:HideBar()
	arg_36_0:RemoveAllEventListener()
end

function var_0_0.Dispose(arg_37_0)
	var_0_0.super.Dispose(arg_37_0)
end

return var_0_0
