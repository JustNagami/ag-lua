local var_0_0 = class("CommonActivityTaskListModule", ReduxView)

function var_0_0.OnCtor(arg_1_0, arg_1_1)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_1.transform

	arg_1_0:Init()
end

function var_0_0.InitContext(arg_2_0)
	arg_2_0.constVar = {
		taskList = {},
		scrollHelper = LuaList.New(handler(arg_2_0, arg_2_0.OnRenderTask), arg_2_0.taskList_, CommonActivityTaskItem)
	}
end

function var_0_0.BuildContext(arg_3_0)
	arg_3_0.renderContext = {
		activityId = 0
	}
	arg_3_0.constVar.taskList = {}
end

function var_0_0.Init(arg_4_0)
	arg_4_0:BindCfgUI()
	arg_4_0:InitContext()
end

function var_0_0.AddUIListener(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.oneKeyBtn_, nil, function()
		arg_5_0:OnOnceBtnClick()
	end)
end

function var_0_0.RegisterTaskListChangedEvent(arg_7_0, arg_7_1)
	arg_7_0.constVar.changeEvent = arg_7_1
end

function var_0_0.RenderView(arg_8_0, arg_8_1)
	arg_8_0:BuildContext()

	arg_8_0.renderContext.activityId = arg_8_1

	local var_8_0 = TaskData2:GetActivityTaskSortList(arg_8_1)

	arg_8_0.constVar.taskList = var_8_0
	arg_8_0.renderContext.taskCount = #var_8_0

	arg_8_0.constVar.scrollHelper:StartScroll(arg_8_0.renderContext.taskCount, 1)
	arg_8_0:ShowOnce()
end

function var_0_0.RefreshView(arg_9_0)
	arg_9_0:RenderView(arg_9_0.renderContext.activityId)
end

function var_0_0.OnEnter(arg_10_0)
	arg_10_0:RegistEventListener(ON_TASK_SUBMIT_RESPONSE, function()
		arg_10_0:RefreshView()
		arg_10_0:OnTaskListChanged()
	end)
	arg_10_0:RegistEventListener(ON_TASK_SUBMIT_LIST_RESPONSE, function()
		arg_10_0:RefreshView()
		arg_10_0:OnTaskListChanged()
	end)
end

function var_0_0.OnExit(arg_13_0)
	arg_13_0:RemoveAllListeners()
	arg_13_0:RemoveAllEventListener()
end

function var_0_0.Dispose(arg_14_0)
	arg_14_0:RemoveAllListeners()
	arg_14_0:RemoveAllEventListener()
	arg_14_0.constVar.scrollHelper:Dispose()
end

function var_0_0.OnRenderTask(arg_15_0, arg_15_1, arg_15_2)
	local var_15_0 = arg_15_0.constVar.taskList[arg_15_1].id

	arg_15_2:RefreshTaskItem(var_15_0)
end

function var_0_0.OnTaskListChanged(arg_16_0)
	local var_16_0 = arg_16_0.constVar.changeEvent

	if var_16_0 then
		var_16_0()
	end
end

function var_0_0.ShowOnce(arg_17_0)
	local var_17_0 = 0

	for iter_17_0, iter_17_1 in ipairs(arg_17_0.constVar.taskList) do
		local var_17_1 = AssignmentCfg[iter_17_1.id]
		local var_17_2 = TaskData2:GetTaskComplete(iter_17_1.id)

		if TaskData2:GetTaskProgress(iter_17_1.id) >= var_17_1.need and not var_17_2 then
			var_17_0 = var_17_0 + 1
		end
	end

	SetActive(arg_17_0.oneKeyObj_, var_17_0 > 0)
end

function var_0_0.OnOnceBtnClick(arg_18_0)
	local var_18_0 = {}

	for iter_18_0, iter_18_1 in ipairs(arg_18_0.constVar.taskList) do
		local var_18_1 = AssignmentCfg[iter_18_1.id]
		local var_18_2 = TaskData2:GetTaskComplete(iter_18_1.id)

		if TaskData2:GetTaskProgress(iter_18_1.id) >= var_18_1.need and not var_18_2 then
			table.insert(var_18_0, iter_18_1.id)
		end
	end

	if #var_18_0 > 0 then
		TaskAction:SubmitTaskList(var_18_0)
	end
end

return var_0_0
