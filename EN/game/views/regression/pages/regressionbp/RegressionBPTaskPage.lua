local var_0_0 = class("RegressionBPTaskPage", ReduxView)

function var_0_0.OnCtor(arg_1_0, arg_1_1)
	local var_1_0 = Asset.Load("Widget/System/ReturnTwo/RT2stBPUI")
	local var_1_1 = Object.Instantiate(var_1_0, arg_1_1)

	arg_1_0.gameObject_ = var_1_1
	arg_1_0.transform_ = var_1_1.transform

	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	arg_2_0:InitUI()
	arg_2_0:AddUIListener()

	arg_2_0.taskItemList_ = LuaList.New(handler(arg_2_0, arg_2_0.IndexItem), arg_2_0.uiList_, RegressionBPTaskItem)
	arg_2_0.gsPayCallback_ = handler(arg_2_0, arg_2_0.OnPaySuccess)
end

function var_0_0.AddUIListener(arg_3_0)
	arg_3_0:AddBtnListener(arg_3_0.ReceiveBtn_, nil, function()
		if not RegressionData:IsRegressionOpen() then
			ShowTips("TIME_OVER")

			return
		end

		RegressionAction.ReceiveBPReward(arg_3_0:GetCanReceiveTaskList(), handler(arg_3_0, arg_3_0.OnRegressionBPTaskReceive))
	end)
	arg_3_0:AddBtnListener(arg_3_0.UpgradeBtn_, nil, function()
		if not RegressionData:IsRegressionOpen() then
			ShowTips("TIME_OVER")

			return
		end

		SDKTools.SendPaymentMessageToSDK("payment_touch", {
			payment_regression_bp_buy = 0
		})
		PayAction.RequestGSPay(601, 1)
	end)
	arg_3_0:AddBtnListener(arg_3_0.fundsettlementmethodBtn_, nil, function()
		local var_6_0 = "Payment_Services_Act_Url"
		local var_6_1 = OperationAction.GetOperationUrl(var_6_0)
		local var_6_2 = EncodeURL(var_6_1)

		print("url : ", var_6_2)

		local var_6_3 = OperationConst.URL_OPEN_WAY.NORMAL

		OperationAction.OpenUrl(var_6_2, var_6_3, nil)
	end)
	arg_3_0:AddBtnListener(arg_3_0.commercialBtn_, nil, function()
		local var_7_0 = "Specified_Commercial_Transactions_Url"
		local var_7_1 = OperationAction.GetOperationUrl(var_7_0)
		local var_7_2 = EncodeURL(var_7_1)

		print("url : ", var_7_2)

		local var_7_3 = OperationConst.URL_OPEN_WAY.NORMAL

		OperationAction.OpenUrl(var_7_2, var_7_3, nil)
	end)
end

function var_0_0.InitUI(arg_8_0)
	arg_8_0:BindCfgUI()
end

function var_0_0.Dispose(arg_9_0)
	var_0_0.super.Dispose(arg_9_0)

	if arg_9_0.taskItemList_ then
		arg_9_0.taskItemList_:Dispose()

		arg_9_0.taskItemList_ = nil
	end

	arg_9_0.gsPayCallback_ = nil

	Object.Destroy(arg_9_0.gameObject_)

	arg_9_0.transform_ = nil
	arg_9_0.gameObject_ = nil
end

function var_0_0.SetData(arg_10_0)
	SetActive(arg_10_0.btnsGo_, SDKTools.GetIsJapan())

	local var_10_0 = RegressionData:GetRegressionVersion()

	arg_10_0.taskList_ = RegressionCfg[var_10_0].regression_bp

	local var_10_1 = RegressionData:GetBPTaskStatus()
	local var_10_2 = RegressionData:GetBPTaskIsRecharge()
	local var_10_3 = RegressionData:GetAccumulateCurrency()
	local var_10_4 = 1
	local var_10_5 = false

	for iter_10_0, iter_10_1 in ipairs(arg_10_0.taskList_) do
		if var_10_3 >= RegressionBPTaskCfg[iter_10_1].need then
			if var_10_1[iter_10_1] == nil then
				var_10_5 = true
			elseif var_10_1[iter_10_1].is_receive_reward < 1 or var_10_2 >= 1 and var_10_1[iter_10_1].is_receive_recharge_reward < 1 then
				var_10_5 = true
			end
		end

		if var_10_5 == true then
			var_10_4 = iter_10_0

			break
		end
	end

	arg_10_0.ReceiveBtn_.interactable = var_10_5

	arg_10_0.taskItemList_:StartScroll(#arg_10_0.taskList_, var_10_4)
	SetActive(arg_10_0.UpgradeGo_, var_10_2 < 1)
end

function var_0_0.IndexItem(arg_11_0, arg_11_1, arg_11_2)
	arg_11_2:SetData(arg_11_0.taskList_[arg_11_1])
	arg_11_2:SetReceiveHandler(handler(arg_11_0, arg_11_0.OnRegressionBPTaskReceive))
end

function var_0_0.SetActive(arg_12_0, arg_12_1)
	SetActive(arg_12_0.gameObject_, arg_12_1)

	if arg_12_1 == true then
		manager.redPoint:bindUIandKey(arg_12_0.ReceiveBtn_.transform, RedPointConst.REGRESSION_BP)
		manager.notify:RegistListener(RECHARGE_SUCCESS, arg_12_0.gsPayCallback_)
	else
		manager.redPoint:unbindUIandKey(arg_12_0.ReceiveBtn_.transform, RedPointConst.REGRESSION_BP)
		manager.notify:RemoveListener(RECHARGE_SUCCESS, arg_12_0.gsPayCallback_)
	end
end

function var_0_0.OnPaySuccess(arg_13_0)
	RegressionAction.SetBPTaskIsRecharge()
	arg_13_0:SetData()
end

function var_0_0.OnRegressionBPTaskReceive(arg_14_0)
	arg_14_0:SetData()
end

function var_0_0.UpdateBar(arg_15_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR
	})
end

function var_0_0.GetCanReceiveTaskList(arg_16_0)
	local var_16_0 = {}
	local var_16_1 = RegressionData:GetRegressionVersion()
	local var_16_2 = RegressionCfg[var_16_1].regression_bp
	local var_16_3 = RegressionData:GetBPTaskStatus()
	local var_16_4 = RegressionData:GetBPTaskIsRecharge()
	local var_16_5 = RegressionData:GetAccumulateCurrency()

	for iter_16_0, iter_16_1 in ipairs(var_16_2) do
		if var_16_5 >= RegressionBPTaskCfg[iter_16_1].need then
			if var_16_3[iter_16_1] then
				if var_16_3[iter_16_1].is_receive_reward < 1 then
					var_16_0[#var_16_0 + 1] = {
						receive_type = 1,
						id = iter_16_1
					}
				end

				if var_16_4 >= 1 and var_16_3[iter_16_1].is_receive_recharge_reward < 1 then
					var_16_0[#var_16_0 + 1] = {
						receive_type = 2,
						id = iter_16_1
					}
				end
			else
				var_16_0[#var_16_0 + 1] = {
					receive_type = 1,
					id = iter_16_1
				}

				if var_16_4 >= 1 then
					var_16_0[#var_16_0 + 1] = {
						receive_type = 2,
						id = iter_16_1
					}
				end
			end
		end
	end

	return var_16_0
end

return var_0_0
