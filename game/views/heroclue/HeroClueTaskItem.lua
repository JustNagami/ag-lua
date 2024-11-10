local var_0_0 = class("HeroClueTaskItem", ReduxView)

function var_0_0.OnCtor(arg_1_0, arg_1_1)
	arg_1_0.rewardItems_ = {}
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_0.gameObject_.transform

	arg_1_0:InitUI()
	arg_1_0:AddListeners()
end

function var_0_0.InitUI(arg_2_0)
	arg_2_0:BindCfgUI()

	arg_2_0.statusController_ = ControllerUtil.GetController(arg_2_0.transform_, "status")
	arg_2_0.typeController_ = ControllerUtil.GetController(arg_2_0.transform_, "type")
end

function var_0_0.AddListeners(arg_3_0)
	arg_3_0:AddBtnListener(arg_3_0.receiveBtn_, nil, function()
		if not ActivityData:GetActivityIsOpen(arg_3_0.activityID_) then
			ShowTips("TIME_OVER")

			return
		end

		TaskAction:SubmitTaskList({
			arg_3_0.taskID_
		})
	end)
end

function var_0_0.SetData(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0.activityID_ = arg_5_2
	arg_5_0.taskID_ = arg_5_1
	arg_5_0.taskProgress_ = TaskData2:GetTask(arg_5_1).progress
	arg_5_0.taskComplete_ = TaskData2:GetTaskComplete(arg_5_1)

	arg_5_0:RefreshUI()
end

function var_0_0.Dispose(arg_6_0)
	for iter_6_0, iter_6_1 in pairs(arg_6_0.rewardItems_) do
		iter_6_1:Dispose()
	end

	arg_6_0.rewardItems_ = nil

	var_0_0.super.Dispose(arg_6_0)
end

function var_0_0.RefreshUI(arg_7_0)
	arg_7_0:RefreshReward()
	arg_7_0:RefreshProgress()
	arg_7_0:RefreshType()
	arg_7_0:RefreshDesc()
end

function var_0_0.RefreshReward(arg_8_0)
	local var_8_0 = AssignmentCfg[arg_8_0.taskID_].reward or {}

	for iter_8_0, iter_8_1 in ipairs(var_8_0) do
		if not arg_8_0.rewardItems_[iter_8_0] then
			local var_8_1 = Object.Instantiate(arg_8_0.rewardItem_, arg_8_0.rewardParent_)

			SetActive(var_8_1, true)

			arg_8_0.rewardItems_[iter_8_0] = CommonItem.New(var_8_1)

			arg_8_0.rewardItems_[iter_8_0]:RegistCallBack(function(arg_9_0)
				ShowPopItem(POP_ITEM, {
					arg_9_0.id,
					arg_9_0.number
				})
			end)
		end

		arg_8_0.rewardItems_[iter_8_0]:RefreshData(formatReward(iter_8_1))
	end

	for iter_8_2 = #var_8_0 + 1, #arg_8_0.rewardItems_ do
		arg_8_0.rewardItems_[iter_8_2]:Show(false)
	end
end

function var_0_0.RefreshProgress(arg_10_0)
	local var_10_0 = AssignmentCfg[arg_10_0.taskID_]
	local var_10_1 = arg_10_0.taskProgress_

	if arg_10_0.taskProgress_ > var_10_0.need then
		var_10_1 = var_10_0.need
	end

	if arg_10_0.progressBar_ then
		arg_10_0.progressBar_.value = var_10_1 / var_10_0.need
	end

	if arg_10_0.progressText_ then
		arg_10_0.progressText_.text = string.format("%s/%s", var_10_1, var_10_0.need)
	end

	local var_10_2 = arg_10_0.taskProgress_ >= var_10_0.need

	if arg_10_0.taskComplete_ == true then
		arg_10_0.statusController_:SetSelectedState("received")
	elseif var_10_2 then
		arg_10_0.statusController_:SetSelectedState("completed")
	else
		arg_10_0.statusController_:SetSelectedState("uncomplete")
	end
end

function var_0_0.RefreshType(arg_11_0)
	if arg_11_0.typeController_ then
		if AssignmentCfg[arg_11_0.taskID_].type == TaskConst.TASK_TYPE.OSIRIS_TASK_DAILY then
			arg_11_0.typeController_:SetSelectedState("daily")
		else
			arg_11_0.typeController_:SetSelectedState("challenge")
		end
	end
end

function var_0_0.RefreshDesc(arg_12_0)
	local var_12_0 = AssignmentCfg[arg_12_0.taskID_]

	arg_12_0.descText_.text = var_12_0.desc
end

return var_0_0
