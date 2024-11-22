local var_0_0 = class("CommonActivityTaskItem", ReduxView)

function var_0_0.OnCtor(arg_1_0, arg_1_1)
	arg_1_0.rewardItems_ = {}
	arg_1_0.rewardItemGos_ = {}
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_0.gameObject_.transform
	arg_1_0.isShow_ = true

	arg_1_0:InitUI()
	arg_1_0:AddListeners()
end

function var_0_0.RefreshTaskItem(arg_2_0, arg_2_1)
	if not arg_2_1 then
		return
	end

	arg_2_0.taskID_ = arg_2_1
	arg_2_0.taskProgress = TaskData2:GetTaskProgress(arg_2_1)
	arg_2_0.taskComplete_ = TaskData2:GetTaskComplete(arg_2_1)

	arg_2_0:RefreshProgress()
	arg_2_0:RefreshUI()

	arg_2_0.isShow_ = true
end

function var_0_0.OnExit(arg_3_0)
	arg_3_0.isShow_ = false
end

function var_0_0.Dispose(arg_4_0)
	arg_4_0:RemoveListeners()

	for iter_4_0, iter_4_1 in pairs(arg_4_0.rewardItems_) do
		if iter_4_1 then
			iter_4_1:Dispose()
		end
	end

	arg_4_0.rewardItems_ = nil

	var_0_0.super.Dispose(arg_4_0)
end

function var_0_0.InitUI(arg_5_0)
	arg_5_0:BindCfgUI()

	arg_5_0.itemData = {
		clone(ItemTemplateData)
	}
	arg_5_0.controller_ = ControllerUtil.GetController(arg_5_0.transform_, "state")
	arg_5_0.typeCon_ = ControllerUtil.GetController(arg_5_0.transform_, "type")
	arg_5_0.rewardModule = CommonItemView.New(arg_5_0.rewardItem_)
end

function var_0_0.AddListeners(arg_6_0)
	arg_6_0:AddBtnListener(arg_6_0.btn_, nil, function()
		TaskAction:SubmitTask(arg_6_0.taskID_)
	end)
end

function var_0_0.RemoveListeners(arg_8_0)
	arg_8_0.btn_.onClick:RemoveAllListeners()
end

function var_0_0.RefreshUI(arg_9_0)
	local var_9_0 = AssignmentCfg[arg_9_0.taskID_]

	arg_9_0.desc_.text = GetI18NText(var_9_0.desc)

	local var_9_1 = (var_9_0.reward or {})[1]

	if var_9_1 then
		local var_9_2 = formatReward(var_9_1)
		local var_9_3 = arg_9_0.itemData[1]
		local var_9_4 = false

		var_9_3.id = var_9_2.id
		var_9_3.number = var_9_2.number
		var_9_3.timeValid = var_9_1.time_valid or 0
		var_9_3.completedFlag = arg_9_0.taskComplete_
		var_9_3.clickFun = handler(arg_9_0, arg_9_0.OnClickCommonItem)

		arg_9_0.rewardModule:SetData(var_9_3)
	end

	if var_9_0.type == TaskConst.TASK_TYPE.OSIRIS_TASK_DAILY then
		arg_9_0.typeCon_:SetSelectedState("normal")
	else
		arg_9_0.typeCon_:SetSelectedState("challenge")
	end
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

	if arg_10_0.taskComplete_ then
		arg_10_0.controller_:SetSelectedState("received")
	elseif var_10_2 then
		arg_10_0.controller_:SetSelectedState("complete")
	else
		arg_10_0.controller_:SetSelectedState("unfinish")
	end
end

function var_0_0.OnClickCommonItem(arg_11_0, arg_11_1)
	ShowPopItem(POP_ITEM, {
		arg_11_1.id,
		arg_11_1.number
	})
	OperationRecorder.Record("task", "task_item")
end

return var_0_0
