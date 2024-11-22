local var_0_0 = class("FreeSkinBuyCheckView", ReduxView)
local var_0_1 = {
	ViewDlc = 1,
	notViewDlc = 2
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
	arg_5_0:AddBtnListener(arg_5_0.checkBtn_, nil, function()
		local var_8_0, var_8_1, var_8_2 = ShopTools.GetPrice(arg_5_0.goodID)
		local var_8_3 = var_8_0
		local var_8_4 = {
			arg_5_0.goodID,
			arg_5_0.dlcID
		}

		local function var_8_5()
			if ShopTools.IsRMB(arg_5_0.goodID) == false and ShopTools.GetCostCount(arg_5_0.goodID) < var_8_3 then
				if ShopTools.IsSkin(arg_5_0.goodID) then
					arg_5_0:SkinIsdeficiency()
				else
					ShopTools.ConfirmBuySkin(var_8_4, {
						1,
						1
					})
				end
			else
				ShopTools.ConfirmBuySkin(var_8_4, {
					1,
					1
				})
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
				OkCallback = var_8_5,
				CancelCallback = function()
					SDKTools.SendPaymentMessageToSDK("payment_touch", {
						payment_skin_buy_unlock = 1
					})
				end
			})
		else
			var_8_5()
		end
	end)
	arg_5_0:AddBtnListener(arg_5_0.freeViewBtn_, nil, function()
		arg_5_0.showModel = var_0_1.ViewDlc

		arg_5_0:UpdateView()
	end)
	arg_5_0:AddBtnListener(arg_5_0.freeViewBackBtn_, nil, function()
		arg_5_0.showModel = var_0_1.notViewDlc

		arg_5_0:UpdateView()
	end)
	arg_5_0:AddBtnListener(arg_5_0.btnView_, nil, function()
		JumpTools.OpenPageByJump("/skinDlcShow", {
			goodId = arg_5_0.goodID
		})
	end)
end

function var_0_0.SkinIsdeficiency(arg_14_0)
	ShowMessageBox({
		content = string.format(GetTips("ERROR_ITEM_NOT_SKIN_TICKET_C")),
		OkCallback = function()
			JumpTools.GoToSystem("/rechargeMain", {
				childShopIndex = 4,
				page = 2
			}, ViewConst.SYSTEM_ID.RECHARGE_MAIN)
		end,
		CancelCallback = function()
			arg_14_0:Back()
		end
	})
end

function var_0_0.OnShopBuyResult(arg_17_0, arg_17_1, arg_17_2, arg_17_3, arg_17_4)
	if arg_17_1 == 0 then
		arg_17_0:Back()
	else
		arg_17_0:Back()
	end
end

function var_0_0.UpdateBar(arg_18_0)
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

function var_0_0.OnTop(arg_19_0)
	arg_19_0:UpdateBar()
	manager.windowBar:SetAsLastSibling()
end

function var_0_0.UpdateData(arg_20_0)
	arg_20_0.shopCfg = getShopCfg(arg_20_0.goodID)
	arg_20_0.shopID = arg_20_0.shopCfg.shop_id
	arg_20_0.skinCfg = SkinCfg[arg_20_0.skinID]
	arg_20_0.heroCfg = HeroCfg[arg_20_0.skinCfg.hero]
	arg_20_0.desCfg = RechargeShopDescriptionCfg[arg_20_0.shopCfg.description]
	arg_20_0.descID = arg_20_0.desCfg.id
	arg_20_0.dlcID = arg_20_0.shopCfg.dlc or nil
	arg_20_0.shopDlcCfg = getShopCfg(arg_20_0.dlcID)
	arg_20_0.itemDlcCfg = RechargeShopDescriptionCfg[arg_20_0.shopDlcCfg.description]
	arg_20_0.showModel = var_0_1.ViewDlc
end

function var_0_0.UpdatePrice(arg_21_0)
	local var_21_0, var_21_1, var_21_2 = ShopTools.GetPrice(arg_21_0.goodID)
	local var_21_3, var_21_4, var_21_5 = ShopTools.GetPrice(arg_21_0.dlcID)
	local var_21_6 = ItemCfg[arg_21_0.skinCfg.hero]

	SetActive(arg_21_0.oriOriceTxt_.gameObject, false)
	SetActive(arg_21_0.skinOriginTxt_.gameObject, false)
	SetActive(arg_21_0.dlcPrice_.gameObject, false)
	arg_21_0.dlcbgController:SetSelectedState("false")

	local var_21_7, var_21_8, var_21_9 = ShopTools.IsOnDiscountArea(arg_21_0.goodID)

	arg_21_0.buyDesc_.text = string.format(GetTips("BUY_SKIN_FREE_DLC_TIPS"), ItemTools.getItemName(arg_21_0.shopCfg.cost_id), var_21_0, ItemTools.getItemName(var_21_6.id), ItemTools.getItemName(arg_21_0.shopCfg.description), ItemTools.getItemName(arg_21_0.itemDlcCfg.id))

	SetActive(arg_21_0.costiconImg_.gameObject, true)

	if var_21_7 and var_21_9 then
		SetActive(arg_21_0.skinOriginTxt_.gameObject, var_21_0 ~= var_21_1)

		if var_21_0 ~= var_21_1 then
			arg_21_0.skinOriginTxt_.text = var_21_1
		end
	end

	arg_21_0.costiconImg_.sprite = ItemTools.getItemLittleSprite(arg_21_0.shopCfg.cost_id)
	arg_21_0.priceText_.text = var_21_0 + var_21_3

	if var_21_0 > ItemTools.getItemNum(arg_21_0.shopCfg.cost_id) then
		arg_21_0.priceText_.text = "<color=#FF000B>" .. var_21_0 .. "</color>"
	end

	if #arg_21_0.shopCfg.give_back_list ~= 0 then
		arg_21_0.rebackSkinTicketText_.text = arg_21_0.shopCfg.give_back_list[1].num
		arg_21_0.allrebackTxt_.text = ""
	end

	if arg_21_0.showModel == var_0_1.notViewDlc then
		arg_21_0.allPriceTxt_.text = ""

		SetActive(arg_21_0.kuoGo_, false)
	else
		SetActive(arg_21_0.oriOriceTxt_.gameObject, true)

		arg_21_0.oriOriceTxt_.text = var_21_4

		SetActive(arg_21_0.dlcPrice_.gameObject, true)

		arg_21_0.allPriceTxt_.text = string.format("( %d", var_21_0)
		arg_21_0.dlcPrice_.text = "+0"

		SetActive(arg_21_0.kuoGo_, true)
	end
end

function var_0_0.UpdateTitle(arg_22_0)
	if arg_22_0.showModel == var_0_1.ViewDlc then
		arg_22_0.textnameText_.text = ItemTools.getItemName(arg_22_0.itemDlcCfg.id)
		arg_22_0.textinfoText_.text = string.format(GetTips("BUY_SKIN_CHANGE"), ItemTools.getItemName(arg_22_0.itemDlcCfg.id)) .. ItemTools.getItemDesc(arg_22_0.itemDlcCfg.id)
	else
		arg_22_0.textnameText_.text = ItemTools.getItemName(arg_22_0.shopCfg.description)
		arg_22_0.textinfoText_.text = string.format(GetTips("BUY_SKIN_CHANGE"), ItemTools.getItemName(arg_22_0.shopCfg.description)) .. ItemTools.getItemDesc(arg_22_0.descID)
	end
end

function var_0_0.UpdateView(arg_23_0)
	arg_23_0:UpdatePrice()
	arg_23_0:UpdateTitle()
	SetActive(arg_23_0.dlcItemLimit_, false)
	SetActive(arg_23_0.freeGiveGo_, true)
	arg_23_0.dlcselController:SetSelectedState(arg_23_0.showModel == var_0_1.ViewDlc and "true" or "false")
	SetActive(arg_23_0.giveBackGo_, #arg_23_0.shopCfg.give_back_list ~= 0)
	SetActive(arg_23_0.skinRemainGo_, false)

	arg_23_0.skinImg_.sprite = getSpriteViaConfig("HeroIcon", arg_23_0.skinCfg.picture_id)

	arg_23_0.skinImg_:SetNativeSize()
	arg_23_0.dlcIconController:SetSelectedState(arg_23_0.shopDlcCfg and "true" or "false")

	if arg_23_0.dlcID and ShopTools.CheckDlcCanBuy(arg_23_0.dlcID) and ShopTools.CheckDlcPurchased(arg_23_0.dlcID) == false and arg_23_0.shopDlcCfg.shop_id == arg_23_0.shopID then
		if arg_23_0.showModel == var_0_1.ViewDlc then
			arg_23_0.dlcbtnController:SetSelectedState("gift2")
		else
			arg_23_0.dlcbtnController:SetSelectedState("gift1")
		end

		arg_23_0.dlcIcon_.sprite = getSpriteWithoutAtlas("TextureConfig/Character/Portrait/" .. arg_23_0.skinCfg.id .. "_character")
		arg_23_0.dlcLittleIcon_.sprite = ItemTools.getItemSprite(arg_23_0.itemDlcCfg.id)
		arg_23_0.dlcBgImg_.sprite = getSpriteWithoutAtlas("TextureConfig/BackgroundQuad/" .. HomeSceneSettingCfg[arg_23_0.itemDlcCfg.id].prefix)
		arg_23_0.dlcbuyTxt_.text = string.format(GetTips("BUY_SKIN_DLC_TIPS"), ItemTools.getItemName(arg_23_0.itemDlcCfg.id))
		arg_23_0.dlcItemNameTxt_.text = string.format(ItemTools.getItemName(arg_23_0.itemDlcCfg.id))
	end

	arg_23_0:UpdateTimeView()
end

function var_0_0.UpdateTimer(arg_24_0)
	arg_24_0:UpdateTimeView()

	if arg_24_0.timer_ == nil then
		arg_24_0.timer_ = Timer.New(function()
			arg_24_0:UpdateTimeView()
		end, 1, -1, -1)

		arg_24_0.timer_:Start()
	end
end

function var_0_0.UpdateTimeView(arg_26_0)
	if arg_26_0.shopDlcCfg then
		local var_26_0, var_26_1, var_26_2 = ShopTools.IsOnDiscountArea(arg_26_0.dlcID)

		if var_26_0 and var_26_2 then
			SetActive(arg_26_0.dlcItemLimit_, arg_26_0.shopDlcCfg.is_limit_time_discount == 1)

			arg_26_0.dlcItemLimitTxt_.text = manager.time:GetLostTimeStr(TimeMgr.GetInstance():parseTimeFromConfig(arg_26_0.shopDlcCfg.cheap_close_time))
		else
			SetActive(arg_26_0.dlcItemLimit_, false)
		end
	end

	arg_26_0.freeRemainTxt_.text = manager.time:GetLostTimeStr(TimeMgr.GetInstance():parseTimeFromConfig(arg_26_0.shopDlcCfg.cheap_close_time))

	local var_26_3 = arg_26_0.shopCfg.close_time
	local var_26_4 = arg_26_0.shopCfg

	SetActive(arg_26_0.timeGo_, #var_26_3 > 0)

	if #var_26_3 <= 0 then
		arg_26_0.discountController:SetSelectedState("none")
	end

	if #var_26_3 > 0 then
		local var_26_5 = TimeMgr.GetInstance():GetServerTime()
		local var_26_6 = TimeMgr.GetInstance():parseTimeFromConfig(var_26_3)

		if var_26_6 <= var_26_5 then
			arg_26_0.remainTxt_.text = GetTips("TIP_EXPIRED")
		else
			arg_26_0.remainTxt_.text = string.format("%s", manager.time:GetLostTimeStr(var_26_6))
		end
	end

	if #var_26_4.cheap_close_time > 0 then
		local var_26_7, var_26_8, var_26_9 = ShopTools.IsOnDiscountArea(var_26_4.goods_id)

		if var_26_7 and var_26_9 then
			arg_26_0.discountController:SetSelectedState("none")
			SetActive(arg_26_0.skinRemainGo_, var_26_4.is_limit_time_discount == 1)

			arg_26_0.skinRemianTxt_.text = manager.time:GetLostTimeStr(TimeMgr.GetInstance():parseTimeFromConfig(var_26_4.cheap_close_time))
		else
			arg_26_0.discountController:SetSelectedState("none")
			SetActive(arg_26_0.skinRemainGo_, false)
		end
	end

	arg_26_0:UpdatePrice()
end

function var_0_0.OnEnter(arg_27_0)
	arg_27_0.goodID = arg_27_0.params_.goodID
	arg_27_0.heroID = arg_27_0.params_.heroID
	arg_27_0.skinID = arg_27_0.params_.skinID

	arg_27_0:UpdateData()
	arg_27_0:UpdateView()
	arg_27_0:UpdateTimer()
	arg_27_0:RegistEventListener(RECHARGE_SUCCESS, function(arg_28_0)
		local var_28_0 = HeroTools.GetSkinChangeItem(arg_27_0.skinID)

		arg_27_0:Back()
		ShowMessageBox({
			title = GetTips("PROMPT"),
			content = string.format(GetTips("USE_SKIN_CHANGE"), ItemTools.getItemName(var_28_0)),
			OkCallback = function()
				CommonAction.TryToUseItem({
					{
						item_info = {
							num = 1,
							id = var_28_0
						},
						use_list = {}
					}
				})
			end
		})
	end)
end

function var_0_0.OnExit(arg_30_0)
	if arg_30_0.timer_ ~= nil then
		arg_30_0.timer_:Stop()

		arg_30_0.timer_ = nil
	end

	manager.windowBar:HideBar()
	arg_30_0:RemoveAllEventListener()
end

function var_0_0.Dispose(arg_31_0)
	var_0_0.super.Dispose(arg_31_0)
end

return var_0_0
