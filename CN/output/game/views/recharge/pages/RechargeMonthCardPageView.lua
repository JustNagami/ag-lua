local var_0_0 = import("game.views.recharge.pages.RechargePageBase")
local var_0_1 = class("RechargeMonthCardPageView", var_0_0)

function var_0_1.OnCtor(arg_1_0, arg_1_1)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_1.transform

	arg_1_0:Init()
end

function var_0_1.InitUI(arg_2_0)
	arg_2_0:BindCfgUI()

	arg_2_0.statusController_ = ControllerUtil.GetController(arg_2_0.gameObject_.transform, "status")
	arg_2_0.firstRewardController_ = ControllerUtil.GetController(arg_2_0.gameObject_.transform, "firstRecharge")

	if SDKTools.GetIsOverSea() then
		SetActive(arg_2_0.rewardContainer_.gameObject, true)

		arg_2_0.priceText_.text = GetTips("MONTHLY_CARD_PRICE")
		arg_2_0.immeLabelText_.text = GetTips("MONTHLY_CARD_ONCE_GET_1")
		arg_2_0.dailyLabelText_.text = GetTips("MONTHLY_CARD_DAILY_GET_1")
		arg_2_0.immeNumText_.text = GetTips("MONTHLY_CARD_ONCE_GET_2")
		arg_2_0.dailyNumText_.text = GetTips("MONTHLY_CARD_DAILY_GET_2")

		local var_2_0 = GetTips("MONTHLY_CARD_PRICE")
		local var_2_1 = string.gsub(var_2_0, "<.->", "")

		arg_2_0.buyText_.text = var_2_1
	end

	arg_2_0.rechargeUpdateHandler_ = handler(arg_2_0, arg_2_0.OnRechargeUpdate)
end

function var_0_1.AddUIListener(arg_3_0)
	arg_3_0:AddBtnListener(arg_3_0.helpBtn_, nil, function()
		JumpTools.OpenPageByJump("rechargeMonthCardDesc")
	end)
	arg_3_0:AddBtnListener(arg_3_0.buyBtn_, nil, function()
		if ShopTools.IsLimitRecharge() then
			ShowTips("PC_SHOP_TIPS2")

			return
		end

		if ShopTools.IsPC() then
			ShopTools.OpenWebRecharge()

			return
		end

		SendMessageManagerToSDK("purchase_click_montlycard")
		arg_3_0:BuyMonthCard()
		SDKTools.SendPaymentMessageToSDK("payment_touch", {
			payment_monthcard = 0
		})
	end)
	arg_3_0:AddBtnListener(arg_3_0.pcBtn_, nil, function()
		ShowTips("PC_SHOP_TIPS2")
	end)
	arg_3_0:AddBtnListener(arg_3_0.rebuyBtn_, nil, function()
		if ShopTools.IsPC() then
			ShopTools.OpenWebRecharge()

			return
		end

		SendMessageManagerToSDK("purchase_click_montlycard")
		arg_3_0:BuyMonthCard()
		SDKTools.SendPaymentMessageToSDK("payment_touch", {
			payment_monthcard = 1
		})
	end)

	if SDKTools.GetIsInputServer("kr") then
		arg_3_0:AddBtnListener(arg_3_0.refundbtn_, nil, function()
			JumpTools.OpenPageByJump("gameHelpPro", {
				pages = {
					"TextureConfig/RechargeUI/RefundPolicy@kr"
				}
			})
		end)
	end

	if arg_3_0.newbieBtn_ then
		arg_3_0:AddBtnListener(arg_3_0.newbieBtn_, nil, function()
			ActivityNewbieTools.ReceiveRechargeReward(2, 1, function()
				arg_3_0:RefreshNewbie(true)
			end)
		end)
	end

	if arg_3_0.newbieRewardBtn_ then
		arg_3_0:AddBtnListener(arg_3_0.newbieRewardBtn_, nil, function()
			local var_11_0 = GameSetting.newbie_first_monthly_card_cumulative.value

			ShowPopItem(POP_ITEM, var_11_0[2])
		end)
	end

	if arg_3_0.fundsettlementmethodBtn_ and arg_3_0.commercialBtn_ then
		arg_3_0:AddBtnListener(arg_3_0.fundsettlementmethodBtn_, nil, function()
			GameToSDK.SendMessage(string.format("{\"messageType\" : \"ShowAgreement\" , \"type\" : \"%s\"}", fund_settlement_algorithm))
		end)
		arg_3_0:AddBtnListener(arg_3_0.commercialBtn_, nil, function()
			GameToSDK.SendMessage(string.format("{\"messageType\" : \"ShowAgreement\" , \"type\" : \"%s\"}", specific_commercial_transaction_act))
		end)
	end
end

function var_0_1.BuyMonthCard(arg_14_0)
	if not RechargeData:HaveMonthCard() then
		RechargeData:ResetSign()
	end

	PayAction.RequestGSPay(101, 1)
end

function var_0_1.OnTop(arg_15_0)
	return
end

function var_0_1.UpdateView(arg_16_0)
	local var_16_0 = GameSetting.monthly_card_num_max.value[1]

	if RechargeData:HaveMonthCard() then
		local var_16_1 = RechargeData:GetCardNum()

		SetActive(arg_16_0.lastDayGo_, true)

		arg_16_0.lastDayLabel_.text = string.format(GetTips("TIME_DISPLAY_5"), manager.time:GetLostTimeStr(RechargeData:GetMonthCardDeadTime(), true))

		if var_16_0 <= var_16_1 then
			arg_16_0.statusController_:SetSelectedState("limit")
		else
			arg_16_0.statusController_:SetSelectedState("notFirst")
		end
	else
		SetActive(arg_16_0.lastDayGo_, false)
		arg_16_0.statusController_:SetSelectedState("first")
	end

	if ShopTools.IsLimitRecharge() then
		arg_16_0.statusController_:SetSelectedState("pc")
	end

	SetActive(arg_16_0.refundGo_, not SDKTools.GetIsInputServer("kr"))
end

function var_0_1.RefreshNewbie(arg_17_0, arg_17_1)
	SetActive(arg_17_0.getGo_, false)

	local var_17_0 = ActivityNewbieTools.GetFirstMonthlyCardStatus()

	if var_17_0 then
		local var_17_1 = var_17_0.isRecharged
		local var_17_2 = var_17_0.signTimes
		local var_17_3 = GameSetting.newbie_first_monthly_card_cumulative.value[1]

		arg_17_0.progreeeText_.text = string.format("<color=#FA962E>%d</color>/%d", var_17_2, var_17_3)
		arg_17_0.status_ = 0

		if var_17_2 == 0 and not var_17_1 then
			arg_17_0.status_ = 1
		elseif var_17_2 < var_17_3 then
			arg_17_0.status_ = 2
		elseif var_17_0.signRewardFlag == false then
			arg_17_0.status_ = 3

			SetActive(arg_17_0.getGo_, true)
		elseif not arg_17_1 then
			arg_17_0.status_ = 4
		else
			arg_17_0.status_ = 0
		end

		arg_17_0.firstRewardController_:SetSelectedIndex(arg_17_0.status_)
	else
		arg_17_0.firstRewardController_:SetSelectedIndex(0)
	end
end

function var_0_1.OnEnter(arg_18_0)
	arg_18_0:UpdateView()

	if arg_18_0.timer_ == nil then
		arg_18_0.timer_ = Timer.New(function()
			arg_18_0:UpdateView()
		end, 1, -1)
	end

	arg_18_0:RefreshNewbie(true)
	arg_18_0.timer_:Start()
	SetActive(arg_18_0.btnsGo_, GameToSDK.CURRENT_SERVER == SERVER_REGION.JAPAN)
	SetActive(arg_18_0.refundGo_, not SDKTools.GetIsKorea())
	SetActive(arg_18_0.refundbtn_.gameObject, false)

	if SDKTools.GetIsInputServer("kr") then
		SetActive(arg_18_0.refundbtn_.gameObject, arg_18_0.curPageIndex_ ~= 4 and arg_18_0.curPageIndex_ ~= 6)
	end

	manager.notify:RegistListener(NEWBIE_RECHARGE_UPDATE, arg_18_0.rechargeUpdateHandler_)
end

function var_0_1.OnExit(arg_20_0)
	if arg_20_0.timer_ then
		arg_20_0.timer_:Stop()

		arg_20_0.timer_ = nil
	end

	manager.notify:RemoveListener(NEWBIE_RECHARGE_UPDATE, arg_20_0.rechargeUpdateHandler_)
end

function var_0_1.Hide(arg_21_0)
	var_0_1.super.Hide(arg_21_0)
end

function var_0_1.Dispose(arg_22_0)
	arg_22_0.rechargeUpdateHandler_ = nil

	var_0_1.super.Dispose(arg_22_0)
end

function var_0_1.OnRechargeUpdate(arg_23_0, arg_23_1)
	arg_23_0:RefreshNewbie(true)
end

return var_0_1
