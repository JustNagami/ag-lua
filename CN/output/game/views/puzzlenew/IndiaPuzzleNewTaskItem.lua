local var_0_0 = class("IndiaPuzzleNewTaskItem", ReduxView)
local var_0_1 = import("game.tools.JumpTools")

function var_0_0.OnCtor(arg_1_0, arg_1_1)
	arg_1_0.rewardItems_ = {}
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_0.gameObject_.transform

	arg_1_0:InitUI()
	arg_1_0:AddListeners()
end

function var_0_0.SetData(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.activityID_ = arg_2_2
	arg_2_0.taskID_ = arg_2_1
	arg_2_0.taskProgress = TaskData2:GetTaskProgress(arg_2_1)
	arg_2_0.taskComplete_ = TaskData2:GetTaskComplete(arg_2_1)

	arg_2_0:RefreshUI()
end

function var_0_0.Dispose(arg_3_0)
	arg_3_0.commonItem_:Dispose()

	arg_3_0.commonItem_ = nil

	var_0_0.super.Dispose(arg_3_0)
end

function var_0_0.InitUI(arg_4_0)
	arg_4_0:BindCfgUI()

	arg_4_0.controller_ = ControllerUtil.GetController(arg_4_0.transform_, "state")
	arg_4_0.typeController_ = ControllerUtil.GetController(arg_4_0.transform_, "type")
end

function var_0_0.AddListeners(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.btn_, nil, function()
		if not ActivityData:GetActivityIsOpen(arg_5_0.activityID_) then
			ShowTips("TIME_OVER")

			return
		end

		TaskAction:SubmitTaskList({
			arg_5_0.taskID_
		})
	end)
end

function var_0_0.RefreshUI(arg_7_0)
	local var_7_0 = AssignmentCfg[arg_7_0.taskID_]

	arg_7_0.desc_.text = var_7_0.desc

	arg_7_0:RefreshReward()
	arg_7_0:RefreshType()
	arg_7_0:RefreshProgress()
end

function var_0_0.RefreshReward(arg_8_0)
	arg_8_0.rewardCfg_ = AssignmentCfg[arg_8_0.taskID_].reward[1]

	if arg_8_0.commonItem_ == nil then
		go = Object.Instantiate(arg_8_0.rewardItem_, arg_8_0.rewardParent_)
		arg_8_0.commonItem_ = CommonItem.New(go)
	end

	arg_8_0.commonItem_:RefreshData(formatReward(arg_8_0.rewardCfg_))
	arg_8_0.commonItem_:RegistCallBack(function()
		ShowPopItem(POP_ITEM, arg_8_0.rewardCfg_)
	end)
	arg_8_0.commonItem_:Show(true)
end

function var_0_0.RefreshProgress(arg_10_0)
	local var_10_0 = AssignmentCfg[arg_10_0.taskID_]
	local var_10_1 = arg_10_0.taskProgress

	if arg_10_0.taskProgress > var_10_0.need then
		var_10_1 = var_10_0.need
	end

	arg_10_0.slider_.value = var_10_1 / var_10_0.need
	arg_10_0.progress_.text = string.format("%s/%s", var_10_1, var_10_0.need)

	local var_10_2 = arg_10_0.taskProgress >= var_10_0.need

	if arg_10_0.taskComplete_ == true then
		arg_10_0.controller_:SetSelectedState("received")
	elseif var_10_2 then
		arg_10_0.controller_:SetSelectedState("complete")
	else
		arg_10_0.controller_:SetSelectedState("unfinish")
	end
end

function var_0_0.RefreshType(arg_11_0)
	if AssignmentCfg[arg_11_0.taskID_].type == TaskConst.TASK_TYPE.OSIRIS_TASK_DAILY then
		arg_11_0.typeController_:SetSelectedState("normal")
	else
		arg_11_0.typeController_:SetSelectedState("challenge")
	end
end

return var_0_0
