local var_0_0 = class("CommonActivityTaskItem", ReduxView)

function var_0_0.OnCtor(arg_1_0, arg_1_1)
	arg_1_0.rewardItems_ = {}
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

	arg_4_0:StopTimer()
	var_0_0.super.Dispose(arg_4_0)
end

local var_0_1 = {
	"awardItem1Obj_",
	"awardItem2Obj_",
	"awardItem3Obj_",
	"rewardItem_"
}

local function var_0_2(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	if not arg_5_0 then
		return nil
	end

	arg_5_3 = arg_5_3 or arg_5_2

	return arg_5_0:GetController(arg_5_2) or ControllerUtil.GetController(arg_5_1, arg_5_2)
end

function var_0_0.InitUI(arg_6_0)
	arg_6_0:BindCfgUI()

	arg_6_0.controller_ = ControllerUtil.GetController(arg_6_0.transform_, "state")
	arg_6_0.buttonController = arg_6_0.allBtnController_:GetController("all")
	arg_6_0.progressBar_ = arg_6_0.progressBar_ or arg_6_0.slider_
	arg_6_0.progress_ = arg_6_0.progress_ or arg_6_0.progressText_
	arg_6_0.desc_ = arg_6_0.desc_ or arg_6_0.titleText_ or arg_6_0.descText_
	arg_6_0.receiveBtn_ = arg_6_0.receiveBtn_ or arg_6_0.btn_
	arg_6_0.typeController = var_0_2(arg_6_0.controllers_, arg_6_0.transform_, "type")
	arg_6_0.timeController = var_0_2(arg_6_0.controllers_, arg_6_0.transform_, "time")

	for iter_6_0, iter_6_1 in ipairs(var_0_1) do
		local var_6_0 = arg_6_0[iter_6_1]

		if not isNil(var_6_0) then
			table.insert(arg_6_0.rewardItems_, CommonItemView.New(var_6_0.gameObject))
		end
	end
end

function var_0_0.AddListeners(arg_7_0)
	arg_7_0:AddBtnListener(arg_7_0.receiveBtn_, nil, function()
		TaskAction:SubmitTask(arg_7_0.taskID_)
	end)
end

function var_0_0.RemoveListeners(arg_9_0)
	arg_9_0.receiveBtn_.onClick:RemoveAllListeners()
end

local function var_0_3(arg_10_0)
	local var_10_0 = TaskData2:GetTask(arg_10_0).expired_timestamp

	if var_10_0 and var_10_0 > 0 then
		return var_10_0
	end

	return nil
end

function var_0_0.StopTimer(arg_11_0)
	if arg_11_0.timer then
		arg_11_0.timer:Stop()

		arg_11_0.timer = nil
	end
end

function var_0_0.StartTimer(arg_12_0, arg_12_1)
	arg_12_0:StopTimer()

	arg_12_0.timer = Timer.New(function()
		if manager.time:GetServerTime() > arg_12_1 then
			arg_12_0:StopTimer()

			return
		end

		arg_12_0:UpdateLimitTime(arg_12_1)
	end, 1, -1)

	arg_12_0.timer:Start()
end

function var_0_0.UpdateTaskRewards(arg_14_0, arg_14_1)
	for iter_14_0, iter_14_1 in ipairs(arg_14_0.rewardItems_) do
		local var_14_0 = cfgToItemTemplate(arg_14_1[iter_14_0])

		if var_14_0 then
			var_14_0.grayFlag = arg_14_0.taskComplete_
			var_14_0.clickFun = handler(arg_14_0, arg_14_0.OnClickCommonItem)
		end

		iter_14_1:SetData(var_14_0)
	end
end

local function var_0_4(arg_15_0, arg_15_1, arg_15_2)
	if arg_15_0 and not isNil(arg_15_1) then
		arg_15_1.text = manager.time:GetLostTimeStrWith2Unit(arg_15_0, true)
	end

	if arg_15_2 then
		arg_15_2:SetSelectedState(arg_15_0 and "true" or "false")
	end
end

function var_0_0.UpdateTaskLimitTime(arg_16_0, arg_16_1)
	if not arg_16_1 then
		arg_16_0:StopTimer()
		var_0_4(nil, arg_16_0.timeText_, arg_16_0.timeController)
	else
		arg_16_0:StartTimer(arg_16_1)
		var_0_4(arg_16_1, arg_16_0.timeText_, arg_16_0.timeController)
	end
end

function var_0_0.UpdateTaskType(arg_17_0, arg_17_1)
	if arg_17_0.typeController ~= nil then
		if arg_17_1 == TaskConst.TASK_TYPE.OSIRIS_TASK_DAILY then
			arg_17_0.typeController:SetSelectedState("normal")
		elseif AssignmentCfg[arg_17_0.taskID_].activity_id == ActivityConst.AUTO_COOK or AssignmentCfg[arg_17_0.taskID_].activity_id == ActivityConst.ACTIVITY_BLOOD_CARD_TASK or AssignmentCfg[arg_17_0.taskID_].activity_id == ActivityConst.ACTIVITY_SPRING_QUIZ_TASK then
			arg_17_0.typeController:SetSelectedState("nolabels")
		else
			arg_17_0.typeController:SetSelectedState("challenge")
		end
	end
end

function var_0_0.RefreshUI(arg_18_0)
	local var_18_0 = AssignmentCfg[arg_18_0.taskID_]
	local var_18_1 = var_18_0.type

	arg_18_0.desc_.text = GetI18NText(var_18_0.desc)

	local var_18_2 = var_18_0.reward or {}

	arg_18_0:UpdateTaskRewards(var_18_2)

	local var_18_3

	if var_18_1 ~= TaskConst.TASK_TYPE.OSIRIS_TASK_CHALLENGE then
		var_18_3 = var_0_3(arg_18_0.taskID_)
	end

	arg_18_0:UpdateTaskLimitTime(var_18_3)
	arg_18_0:UpdateTaskType(var_18_1)
end

local var_0_5 = {
	received = "complete",
	unfinish = "lock",
	complete = "receive"
}

local function var_0_6(arg_19_0, arg_19_1, arg_19_2)
	if arg_19_0 then
		arg_19_0:SetSelectedState(var_0_5[arg_19_2])
	else
		arg_19_1:SetSelectedState(arg_19_2)
	end
end

function var_0_0.RefreshProgress(arg_20_0)
	local var_20_0 = AssignmentCfg[arg_20_0.taskID_]
	local var_20_1 = arg_20_0.taskProgress

	if arg_20_0.taskProgress > var_20_0.need then
		var_20_1 = var_20_0.need
	end

	arg_20_0.progressBar_.value = var_20_1 / var_20_0.need
	arg_20_0.progress_.text = string.format("%s/%s", var_20_1, var_20_0.need)

	local var_20_2 = arg_20_0.taskProgress >= var_20_0.need

	if arg_20_0.taskComplete_ then
		var_0_6(arg_20_0.buttonController, arg_20_0.controller_, "received")
	elseif var_20_2 then
		var_0_6(arg_20_0.buttonController, arg_20_0.controller_, "complete")
	else
		var_0_6(arg_20_0.buttonController, arg_20_0.controller_, "unfinish")
	end
end

function var_0_0.OnClickCommonItem(arg_21_0, arg_21_1)
	ShowPopItem(POP_ITEM, {
		arg_21_1.id,
		arg_21_1.number
	})
	OperationRecorder.Record("task", "task_item")
end

return var_0_0
