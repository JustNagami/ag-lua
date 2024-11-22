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

	arg_4_0.grey = arg_4_0.image68_.material
end

function var_0_0.AddUIListener(arg_7_0)
	arg_7_0:AddBtnListener(arg_7_0.cheepBtn_, nil, function()
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

		if PassportData:GetPayLevel() == 201 then
			ShowTips("BATTLEPASS_HAS_BUYED")

			return
		end

		PayAction.RequestGSPay(201, 1)
	end)
	arg_7_0:AddBtnListener(arg_7_0.expensiveBtn_, nil, function()
		if ShopTools.IsLimitRecharge() then
			ShowTips("PC_SHOP_TIPS2")

			return
		end

		SendMessageManagerToSDK("purchase_click_montlycard")

		if PassportData:GetEndTimestamp() - TimeMgr.GetInstance():GetServerTime() < 1200 then
			ShowTips("NOT_ENOUGH_TIME_TO_BUY")

			return
		end

		if PassportData:GetPayLevel() == 202 then
			ShowTips("BATTLEPASS_HAS_BUYED")

			return
		end

		if PassportData:GetPayLevel() == 201 then
			PayAction.RequestGSPay(203, 1)
		else
			PayAction.RequestGSPay(202, 1)
		end
	end)

	if arg_7_0.fundsettlementmethodBtn_ and arg_7_0.commercialBtn_ then
		arg_7_0:AddBtnListener(arg_7_0.fundsettlementmethodBtn_, nil, function()
			GameToSDK.SendMessage(string.format("{\"messageType\" : \"ShowAgreement\" , \"type\" : \"%s\"}", fund_settlement_algorithm))
		end)
		arg_7_0:AddBtnListener(arg_7_0.commercialBtn_, nil, function()
			GameToSDK.SendMessage(string.format("{\"messageType\" : \"ShowAgreement\" , \"type\" : \"%s\"}", specific_commercial_transaction_act))
		end)
	end

	if arg_7_0.checkBtn_ then
		arg_7_0:AddBtnListener(arg_7_0.checkBtn_, nil, function()
			JumpTools.OpenPageByJump("passportShow", {
				isPassPortBuy = true,
				type = 2
			})
		end)
	end

	arg_7_0:AddBtnListener(arg_7_0.viewBtn_, nil, function()
		local var_13_0 = PassportData:GetId()
		local var_13_1 = BattlePassListCfg[var_13_0]

		if var_13_1.battlepass_type >= 17 then
			JumpTools.OpenPageByJump("/weaponServant", {
				customServant = var_13_1.servant_list
			})
		end
	end)
end

function var_0_0.UpdateBar(arg_14_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR
	})
end

function var_0_0.OnEnter(arg_15_0)
	if not arg_15_0.timer_ then
		arg_15_0.timer_ = Timer.New(function()
			arg_15_0:UpdateTimer()
		end, 1, -1)
	end

	arg_15_0.timer_:Start()

	arg_15_0.dataList1_ = BattlePassListCfg[PassportData:GetId()].display_reward_01
	arg_15_0.dataList2_ = BattlePassListCfg[PassportData:GetId()].display_reward_02

	arg_15_0:UpdateView()
	arg_15_0:UpdateTimer()
	arg_15_0:RegisterEventListeners()
	SetActive(arg_15_0.btnsGo_, GameToSDK.CURRENT_SERVER == SERVER_REGION.JAPAN)
end

function var_0_0.RegisterEventListeners(arg_17_0)
	arg_17_0:RegistEventListener(RECHARGE_SUCCESS, function(arg_18_0)
		arg_17_0:UpdateView()
	end)
end

function var_0_0.UpdateView(arg_19_0)
	if ShopTools.IsLimitRecharge() then
		arg_19_0.image68_.material = arg_19_0.grey
		arg_19_0.image128_.material = arg_19_0.grey
	else
		arg_19_0.image68_.material = nil
		arg_19_0.image128_.material = nil
	end

	SetActive(arg_19_0.cheapBuy_, false)
	SetActive(arg_19_0.cheapNot_, false)
	SetActive(arg_19_0.heavyBuy_, false)
	SetActive(arg_19_0.heavyNot_, false)

	if PassportData:GetPayLevel() >= 202 then
		SetActive(arg_19_0.heavyNot_, true)
		SetActive(arg_19_0.cheapNot_, true)
	elseif PassportData:GetPayLevel() >= 201 then
		SetActive(arg_19_0.cheapNot_, true)
		SetActive(arg_19_0.heavyBuy_, true)

		arg_19_0.priceLabel2_.text = arg_19_0:GetPriceText(203)
	else
		SetActive(arg_19_0.heavyBuy_, true)
		SetActive(arg_19_0.cheapBuy_, true)

		arg_19_0.priceLabel1_.text = arg_19_0:GetPriceText(201)
		arg_19_0.priceLabel2_.text = arg_19_0:GetPriceText(202)
	end

	for iter_19_0, iter_19_1 in ipairs(arg_19_0.item68_) do
		CommonTools.SetCommonData(iter_19_1.item, {
			id = arg_19_0.dataList1_[iter_19_0][1],
			number = arg_19_0.dataList1_[iter_19_0][2]
		}, iter_19_1.data)
	end

	for iter_19_2, iter_19_3 in ipairs(arg_19_0.item128_) do
		CommonTools.SetCommonData(iter_19_3.item, {
			id = arg_19_0.dataList2_[iter_19_2][1],
			number = arg_19_0.dataList2_[iter_19_2][2]
		}, iter_19_3.data)
	end

	local var_19_0 = PassportData:GetId()
	local var_19_1 = BattlePassListCfg[var_19_0].battlepass_type

	if var_19_1 >= 17 then
		arg_19_0.rewardTxt_.text = GetTips("BATTLEPASS_REWARD_TIPS_MAIN")
	end

	SetActive(arg_19_0.viewBtn_.gameObject, var_19_1 >= 17)
end

function var_0_0.GetPriceText(arg_20_0, arg_20_1)
	local var_20_0 = PaymentCfg[arg_20_1].cost / 100

	if SDKTools.GetIsKorea() then
		return var_20_0 .. GetTips("CURRENCY_TEXT")
	else
		return string.format(GetTips("PASSPORT_BUY_BUTTON_1"), PaymentCfg[arg_20_1].currency_symbol, var_20_0)
	end
end

function var_0_0.UpdateTimer(arg_21_0)
	local var_21_0 = PassportData:GetEndTimestamp() - 1200
	local var_21_1 = PassportData:GetStartTimestamp()

	arg_21_0.timeLabel_.text = manager.time:STimeDescS(var_21_1, "!%Y/%m/%d %H:%M") .. "  -  " .. manager.time:STimeDescS(var_21_0, "!%Y/%m/%d %H:%M")
end

function var_0_0.OnExit(arg_22_0)
	arg_22_0:RemoveAllEventListener()

	if arg_22_0.timer_ then
		arg_22_0.timer_:Stop()

		arg_22_0.timer_ = nil
	end
end

function var_0_0.OnTop(arg_23_0)
	arg_23_0:UpdateBar()
end

function var_0_0.Dispose(arg_24_0)
	if arg_24_0.item68_ then
		for iter_24_0, iter_24_1 in pairs(arg_24_0.item68_) do
			iter_24_1.item:Dispose()
		end

		arg_24_0.item68_ = nil
	end

	if arg_24_0.item128_ then
		for iter_24_2, iter_24_3 in pairs(arg_24_0.item128_) do
			iter_24_3.item:Dispose()
		end

		arg_24_0.item128_ = nil
	end

	var_0_0.super.Dispose(arg_24_0)
end

return var_0_0
