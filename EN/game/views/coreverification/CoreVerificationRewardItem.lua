local var_0_0 = class("CoreVerificationRewardItem", ReduxView)

function var_0_0.OnCtor(arg_1_0, arg_1_1)
	arg_1_0.gameObject_ = arg_1_1

	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	arg_2_0:InitUI()
	arg_2_0:AddUIListener()
end

function var_0_0.AddUIListener(arg_3_0)
	arg_3_0:AddBtnListener(arg_3_0.receiveBtn_, nil, function()
		if CoreVerificationRewardCfg[arg_3_0.data_].reward_type ~= 4 and CoreVerificationData:GetCanReset() then
			ShowMessageBox({
				title = GetTips("PROMPT"),
				content = GetTips("CORE_VERIFICATION_RESETTIPS3"),
				OkCallback = function()
					arg_3_0:GetReward()
				end
			})
		else
			arg_3_0:GetReward()
		end
	end)
end

function var_0_0.GetReward(arg_6_0)
	CoreVerificationAction.GetReward({
		reward_list = {
			arg_6_0.data_
		}
	})
	arg_6_0.controller_:SetSelectedState("complete")
end

function var_0_0.InitUI(arg_7_0)
	arg_7_0:BindCfgUI()

	arg_7_0.rewardItems_ = {}
	arg_7_0.controller_ = arg_7_0.allBtnController_:GetController("all")
end

function var_0_0.SetData(arg_8_0, arg_8_1, arg_8_2)
	arg_8_0.data_ = arg_8_1
	arg_8_0.type_ = arg_8_2

	arg_8_0:UpdateView()
end

function var_0_0.UpdateView(arg_9_0)
	local var_9_0 = CoreVerificationRewardCfg[arg_9_0.data_]
	local var_9_1 = ConditionCfg[var_9_0.condition]

	arg_9_0.titleText_.text = string.format(GetI18NText(var_9_1.desc), var_9_1.params[1])

	local var_9_2, var_9_3, var_9_4, var_9_5 = CoreVerificationData:GetTaskProcess(arg_9_0.data_)

	arg_9_0.progressBar_.value = var_9_2 / var_9_3
	arg_9_0.progressText_.text = string.format("%s/%s", var_9_2, var_9_3)

	if var_9_5 then
		arg_9_0.controller_:SetSelectedState("complete")
	elseif var_9_4 then
		arg_9_0.controller_:SetSelectedState("receive")
	else
		arg_9_0.controller_:SetSelectedState("lock")
	end

	local var_9_6 = var_9_0.reward or {}

	for iter_9_0, iter_9_1 in ipairs(var_9_6) do
		local var_9_7 = formatReward(iter_9_1)
		local var_9_8 = clone(ItemTemplateData)

		if arg_9_0.rewardItems_[iter_9_0] == nil then
			arg_9_0.rewardItems_[iter_9_0] = CommonItemView.New(arg_9_0[string.format("awardItem%dObj_", iter_9_0)])
			arg_9_0.rewardItems_[iter_9_0].ResetTransform = function()
				return
			end
		end

		var_9_8.id = var_9_7.id
		var_9_8.number = var_9_7.num
		var_9_8.timeValid = iter_9_1.timeValid or 0
		var_9_8.completedFlag = arg_9_0.taskComplete_
		var_9_8.clickFun = handler(arg_9_0, arg_9_0.OnClickCommonItem)

		arg_9_0.rewardItems_[iter_9_0]:SetData(var_9_8)
	end

	for iter_9_2 = #var_9_0.reward + 1, #arg_9_0.rewardItems_ do
		arg_9_0.rewardItems_[iter_9_2]:SetData(nil)
	end
end

function var_0_0.OnClickCommonItem(arg_11_0, arg_11_1)
	ShowPopItem(POP_ITEM, {
		arg_11_1.id,
		arg_11_1.number
	})
	OperationRecorder.Record("task", "task_item")
end

function var_0_0.OnEnter(arg_12_0)
	arg_12_0:UpdateView()
end

function var_0_0.Dispose(arg_13_0)
	for iter_13_0, iter_13_1 in pairs(arg_13_0.rewardItems_) do
		iter_13_1:Dispose()
	end

	arg_13_0.rewardItems_ = {}

	var_0_0.super.Dispose(arg_13_0)
end

return var_0_0
