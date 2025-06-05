local var_0_0 = class("PassportBuyView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/System/Passport/PassportBuyUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:InitUI()
	arg_3_0:AddUIListener()
end

function var_0_0.InitUI(arg_4_0)
	arg_4_0:BindCfgUI()

	arg_4_0.item68_ = {}

	for iter_4_0 = 1, 10 do
		if arg_4_0["item68_" .. iter_4_0] then
			local var_4_0 = CommonItemView.New(arg_4_0["item68_" .. iter_4_0])
			local var_4_1 = clone(ItemTemplateData)

			function var_4_1.clickFun(arg_5_0)
				ShowPopItem(POP_ITEM, {
					arg_5_0.id,
					arg_5_0.number
				})
			end

			table.insert(arg_4_0.item68_, {
				item = var_4_0,
				data = var_4_1
			})
		end
	end

	arg_4_0.item128_ = {}

	for iter_4_1 = 1, 10 do
		if arg_4_0["item128_" .. iter_4_1] then
			local var_4_2 = CommonItemView.New(arg_4_0["item128_" .. iter_4_1])
			local var_4_3 = clone(ItemTemplateData)

			function var_4_3.clickFun(arg_6_0)
				ShowPopItem(POP_ITEM, {
					arg_6_0.id,
					arg_6_0.number
				})
			end

			table.insert(arg_4_0.item128_, {
				item = var_4_2,
				data = var_4_3
			})
		end
	end

	local var_4_4 = Asset.Load(BattlePassListCfg[PassportData:GetId()].prefab_path)

	arg_4_0.controller = Object.Instantiate(var_4_4, arg_4_0.container_.transform):GetComponent("ControllerExCollection"):GetController("default")

	arg_4_0.controller:SetSelectedState("PassportBuyUI")

	arg_4_0.grey = Object.Instantiate(Asset.Load("UI/Materials")).transform:Find("grey"):GetComponent("SpriteRenderer").material
	arg_4_0.leftReturnController_ = arg_4_0.leftController_:GetController("isReturn")
	arg_4_0.rightReturnController_ = arg_4_0.rightController_:GetController("isReturn")
	arg_4_0.returnController_ = arg_4_0.controller_:GetController("isReturn")
	arg_4_0.bpNewController_ = arg_4_0.controller_:GetController("isNewPBRecharge")
	arg_4_0.leftBtnStateController = arg_4_0.leftController_:GetController("state")
	arg_4_0.rightBtnStateController = arg_4_0.rightController_:GetController("state")
end

function var_0_0.cheepButListener(arg_7_0)
	if ShopTools.IsLimitRecharge() then
		ShowTips("PC_SHOP_TIPS2")

		return
	end

	SendMessageManagerToSDK("purchase_click_montlycard")
	SDKTools.SendPaymentMessageToSDK("payment_touch", {
		payment_bp_buy = 68
	})

	if PassportData:GetEndTimestamp() - TimeMgr.GetInstance():GetServerTime() < 1200 then
		ShowTips("NOT_ENOUGH_TIME_TO_BUY")

		return
	end

	if PassportData:GetPayLevel() == PassportConst.PASSPORT_USER_LEVEL.BASE_LEVEL then
		ShowTips("BATTLEPASS_HAS_BUYED")

		return
	end

	if ShopTools.IsPC() then
		ShopTools.OpenWebRecharge()

		return
	end

	local var_7_0 = arg_7_0:GetPassportType()
	local var_7_1 = PassportConst.PASSPORT_ALL_PAY_ID[var_7_0][PassportConst.PASSPORT_USER_TYPE.NORMAL]
	local var_7_2 = PassportConst.PASSPORT_ALL_PAY_ID[var_7_0][PassportConst.PASSPORT_USER_TYPE.RETURN]

	if RegressionDataNew:CheckIsCanBuyPassportPayID(var_7_2[1]) then
		arg_7_0:BuyRegressPay(var_7_2[1])
	else
		PayAction.RequestGSPay(var_7_1[1], 1)
	end
end

function var_0_0.expensiveBtnListener(arg_8_0)
	if ShopTools.IsLimitRecharge() then
		ShowTips("PC_SHOP_TIPS2")

		return
	end

	SendMessageManagerToSDK("purchase_click_montlycard")

	if PassportData:GetEndTimestamp() - TimeMgr.GetInstance():GetServerTime() < 1200 then
		ShowTips("NOT_ENOUGH_TIME_TO_BUY")

		return
	end

	if PassportData:GetPayLevel() == PassportConst.PASSPORT_USER_LEVEL.FULL_LEVEL then
		ShowTips("BATTLEPASS_HAS_BUYED")

		return
	end

	if ShopTools.IsPC() then
		ShopTools.OpenWebRecharge()

		return
	end

	local var_8_0 = arg_8_0:GetPassportType()
	local var_8_1 = PassportConst.PASSPORT_ALL_PAY_ID[var_8_0][PassportConst.PASSPORT_USER_TYPE.NORMAL]
	local var_8_2 = PassportConst.PASSPORT_ALL_PAY_ID[var_8_0][PassportConst.PASSPORT_USER_TYPE.RETURN]

	if RegressionDataNew:CheckIsCanBuyPassportPayID(var_8_2[3]) then
		if PassportData:GetPayLevel() == PassportConst.PASSPORT_USER_LEVEL.BASE_LEVEL then
			arg_8_0:BuyRegressPay(var_8_2[3])
		else
			arg_8_0:BuyRegressPay(var_8_2[2])
		end
	elseif PassportData:GetPayLevel() == PassportConst.PASSPORT_USER_LEVEL.BASE_LEVEL then
		PayAction.RequestGSPay(var_8_1[3], 1)
	else
		PayAction.RequestGSPay(var_8_1[2], 1)
	end
end

function var_0_0.AddUIListener(arg_9_0)
	arg_9_0:AddBtnListener(arg_9_0.cheepBtn_, nil, function()
		arg_9_0:cheepButListener()
	end)
	arg_9_0:AddBtnListener(arg_9_0.expensiveBtn_, nil, function()
		arg_9_0:expensiveBtnListener()
	end)

	if arg_9_0.fundsettlementmethodBtn_ and arg_9_0.commercialBtn_ then
		arg_9_0:AddBtnListener(arg_9_0.fundsettlementmethodBtn_, nil, function()
			GameToSDK.SendMessage(string.format("{\"messageType\" : \"ShowAgreement\" , \"type\" : \"%s\"}", fund_settlement_algorithm))
		end)
		arg_9_0:AddBtnListener(arg_9_0.commercialBtn_, nil, function()
			GameToSDK.SendMessage(string.format("{\"messageType\" : \"ShowAgreement\" , \"type\" : \"%s\"}", specific_commercial_transaction_act))
		end)
	end

	if arg_9_0.checkBtn_ then
		arg_9_0:AddBtnListener(arg_9_0.checkBtn_, nil, function()
			JumpTools.OpenPageByJump("passportShow", {
				isPassPortBuy = true,
				type = 2
			})
		end)
	end

	arg_9_0:AddBtnListener(arg_9_0.viewBtn_, nil, function()
		local var_15_0 = PassportData:GetId()
		local var_15_1 = BattlePassListCfg[var_15_0]

		if var_15_1.battlepass_type >= 17 then
			JumpTools.OpenPageByJump("/weaponServant", {
				customServant = var_15_1.servant_list
			})
		end
	end)
end

function var_0_0.UpdateBar(arg_16_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR
	})
end

function var_0_0.OnEnter(arg_17_0)
	if not arg_17_0.timer_ then
		arg_17_0.timer_ = Timer.New(function()
			arg_17_0:UpdateTimer()
		end, 1, -1)
	end

	arg_17_0.timer_:Start()

	arg_17_0.dataList1_ = BattlePassListCfg[PassportData:GetId()].display_reward_01
	arg_17_0.dataList2_ = BattlePassListCfg[PassportData:GetId()].display_reward_02

	arg_17_0:UpdateView()
	arg_17_0:UpdateTimer()
	arg_17_0:RegisterEventListeners()
	SetActive(arg_17_0.btnsGo_, GameToSDK.CURRENT_SERVER == SERVER_REGION.JAPAN)
end

function var_0_0.RegisterEventListeners(arg_19_0)
	arg_19_0:RegistEventListener(RECHARGE_SUCCESS, function(arg_20_0)
		arg_19_0:UpdateView()
	end)
end

function var_0_0.UpdateView(arg_21_0)
	local var_21_0 = arg_21_0:GetPassportType()
	local var_21_1 = PassportConst.PASSPORT_ALL_PAY_ID[var_21_0][PassportConst.PASSPORT_USER_TYPE.NORMAL]

	if ShopTools.IsLimitRecharge() then
		arg_21_0.image68_.material = arg_21_0.grey
		arg_21_0.image128_.material = arg_21_0.grey
	else
		arg_21_0.image68_.material = nil
		arg_21_0.image128_.material = nil
	end

	if PassportData:GetPayLevel() == PassportConst.PASSPORT_USER_LEVEL.FULL_LEVEL then
		arg_21_0.leftBtnStateController:SetSelectedState("purchased")
		arg_21_0.rightBtnStateController:SetSelectedState("purchased")
	elseif PassportData:GetPayLevel() == PassportConst.PASSPORT_USER_LEVEL.BASE_LEVEL then
		arg_21_0.leftBtnStateController:SetSelectedState("purchased")
		arg_21_0.rightBtnStateController:SetSelectedState("normal")

		arg_21_0.priceLabel2_.text = arg_21_0:GetPriceText(var_21_1[3])
	else
		arg_21_0.leftBtnStateController:SetSelectedState("normal")
		arg_21_0.rightBtnStateController:SetSelectedState("normal")

		arg_21_0.priceLabel1_.text = arg_21_0:GetPriceText(var_21_1[1])
		arg_21_0.priceLabel2_.text = arg_21_0:GetPriceText(var_21_1[2])
	end

	for iter_21_0, iter_21_1 in ipairs(arg_21_0.item68_) do
		CommonTools.SetCommonData(iter_21_1.item, {
			id = arg_21_0.dataList1_[iter_21_0][1],
			number = arg_21_0.dataList1_[iter_21_0][2]
		}, iter_21_1.data)
	end

	for iter_21_2, iter_21_3 in ipairs(arg_21_0.item128_) do
		CommonTools.SetCommonData(iter_21_3.item, {
			id = arg_21_0.dataList2_[iter_21_2][1],
			number = arg_21_0.dataList2_[iter_21_2][2]
		}, iter_21_3.data)
	end

	local var_21_2 = PassportData:GetId()
	local var_21_3 = BattlePassListCfg[var_21_2].battlepass_type

	if var_21_3 >= 17 then
		arg_21_0.rewardTxt_.text = GetTips("BATTLEPASS_REWARD_TIPS_MAIN")
	end

	SetActive(arg_21_0.viewBtn_.gameObject, var_21_3 >= 17)
	arg_21_0:UpdateDiscountInfo()
	ActivityNewbieTools.RefreshNewBPRecharge(arg_21_0.bpNewController_)
end

function var_0_0.GetPassportType(arg_22_0)
	if PassportData:GetId() == PassportConst.VSN_42_PASSPORT_ID then
		return PassportConst.PASSPORT_ALL_TYPE.VSN_42
	end

	return PassportConst.PASSPORT_ALL_TYPE.DEFAULT
end

function var_0_0.UpdateDiscountInfo(arg_23_0)
	local var_23_0 = false
	local var_23_1 = PassportData:GetPayLevel()
	local var_23_2 = arg_23_0:GetPassportType()
	local var_23_3 = PassportConst.PASSPORT_ALL_PAY_ID[var_23_2][PassportConst.PASSPORT_USER_TYPE.NORMAL]
	local var_23_4 = PassportConst.PASSPORT_ALL_PAY_ID[var_23_2][PassportConst.PASSPORT_USER_TYPE.RETURN]

	if var_23_1 == PassportConst.PASSPORT_USER_LEVEL.NOT_BUY and RegressionDataNew:CheckIsCanBuyPassportPayID(var_23_4[1]) then
		arg_23_0.priceLabel1_.text = arg_23_0:GetPriceText(var_23_4[1])
		arg_23_0.cheapOriginTxt_.text = arg_23_0:GetPriceText(var_23_3[1], true)
		var_23_0 = true

		arg_23_0.leftReturnController_:SetSelectedState("true")
	else
		arg_23_0.leftReturnController_:SetSelectedState("false")
	end

	if var_23_1 < PassportConst.PASSPORT_USER_LEVEL.FULL_LEVEL and RegressionDataNew:CheckIsCanBuyPassportPayID(var_23_4[2]) then
		if PassportData:GetPayLevel() == PassportConst.PASSPORT_USER_LEVEL.BASE_LEVEL then
			arg_23_0.priceLabel2_.text = arg_23_0:GetPriceText(var_23_4[3])
			arg_23_0.heavyOriginTxt_.text = arg_23_0:GetPriceText(var_23_3[3], true)
		else
			arg_23_0.priceLabel2_.text = arg_23_0:GetPriceText(var_23_4[2])
			arg_23_0.heavyOriginTxt_.text = arg_23_0:GetPriceText(var_23_3[2], true)
		end

		var_23_0 = true

		arg_23_0.rightReturnController_:SetSelectedState("true")
	else
		arg_23_0.rightReturnController_:SetSelectedState("false")
	end

	arg_23_0:AddRegressionTimer(var_23_0)

	if var_23_0 then
		arg_23_0.returnController_:SetSelectedState("true")
	else
		arg_23_0.returnController_:SetSelectedState("false")
	end

	local var_23_5, var_23_6 = PassportData:HasDiscount()

	if var_23_5 and var_23_6 then
		SetActive(arg_23_0.discountInfoObj_, true)

		arg_23_0.discountInfoText_.text = GetTips(var_23_6)
	else
		SetActive(arg_23_0.discountInfoObj_, false)

		arg_23_0.discountInfoText_.text = ""
	end
end

function var_0_0.AddRegressionTimer(arg_24_0, arg_24_1)
	if arg_24_0.regressTimer then
		arg_24_0.regressTimer:Stop()

		arg_24_0.regressTimer = nil
	end

	if not arg_24_1 then
		return
	end

	arg_24_0:UpdateRegressionTimeShow()

	arg_24_0.regressTimer = Timer.New(function()
		arg_24_0:UpdateRegressionTimeShow()
	end, 1, -1)

	arg_24_0.regressTimer:Start()
end

function var_0_0.UpdateRegressionTimeShow(arg_26_0)
	local var_26_0 = RegressionDataNew:GetPassDiscountEndTimes()
	local var_26_1 = manager.time:GetLostTimeStrWith2Unit(var_26_0)

	arg_26_0.heavyReturnTimeTxt_.text = var_26_1
	arg_26_0.cheapReturnTimeTxt_.text = var_26_1
	arg_26_0.returnTimeTxt_.text = string.format(GetTips("NEW_REGRESSION_PASSPORT_TIME"), os.date("%Y/%m/%d %H:%M", var_26_0))
end

function var_0_0.GetPriceText(arg_27_0, arg_27_1, arg_27_2)
	local var_27_0 = PaymentCfg[arg_27_1].cost / 100

	if SDKTools.GetIsKorea() then
		return var_27_0 .. GetTips("CURRENCY_TEXT")
	else
		local var_27_1

		if arg_27_2 then
			var_27_1 = GetTips("NEW_REGRESSION_MONTH_PRICE_1")
		else
			var_27_1 = GetTips("PASSPORT_BUY_BUTTON_1")
		end

		return string.format(var_27_1, PaymentCfg[arg_27_1].currency_symbol, var_27_0)
	end
end

function var_0_0.BuyRegressPay(arg_28_0, arg_28_1)
	local var_28_0 = RegressionDataNew:GetPassDiscountEndTimes()
	local var_28_1 = PassportData:GetEndTimestamp() - 1200

	if RegressionDataNew:CheckIsFirstBuyPassport() and var_28_1 < var_28_0 then
		ShowMessageBox({
			content = string.format(GetTips("NEW_REGRESSION_AGREEMENT_BUY"), manager.time:GetLostTimeStrWith2Unit(var_28_0)),
			OkCallback = function()
				PayAction.RequestGSPay(arg_28_1, 1)
			end,
			CancelCallback = function()
				return
			end
		})
	else
		PayAction.RequestGSPay(arg_28_1, 1)
	end
end

function var_0_0.UpdateTimer(arg_31_0)
	local var_31_0 = PassportData:GetEndTimestamp() - 1200
	local var_31_1 = PassportData:GetStartTimestamp()

	arg_31_0.timeLabel_.text = manager.time:STimeDescS(var_31_1, "!%Y/%m/%d %H:%M") .. "  -  " .. manager.time:STimeDescS(var_31_0, "!%Y/%m/%d %H:%M")
end

function var_0_0.OnExit(arg_32_0)
	arg_32_0:RemoveAllEventListener()
	manager.windowBar:HideBar()

	if arg_32_0.regressTimer then
		arg_32_0.regressTimer:Stop()

		arg_32_0.regressTimer = nil
	end

	if arg_32_0.timer_ then
		arg_32_0.timer_:Stop()

		arg_32_0.timer_ = nil
	end
end

function var_0_0.OnTop(arg_33_0)
	arg_33_0:UpdateBar()
end

function var_0_0.Dispose(arg_34_0)
	if arg_34_0.item68_ then
		for iter_34_0, iter_34_1 in pairs(arg_34_0.item68_) do
			iter_34_1.item:Dispose()
		end

		arg_34_0.item68_ = nil
	end

	if arg_34_0.item128_ then
		for iter_34_2, iter_34_3 in pairs(arg_34_0.item128_) do
			iter_34_3.item:Dispose()
		end

		arg_34_0.item128_ = nil
	end

	var_0_0.super.Dispose(arg_34_0)
end

return var_0_0
