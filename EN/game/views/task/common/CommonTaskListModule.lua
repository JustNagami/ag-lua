local var_0_0 = class("CommonTaskListModule", ReduxView)

function var_0_0.OnCtor(arg_1_0, arg_1_1)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_1.transform

	arg_1_0:Init()
end

function var_0_0.InitContext(arg_2_0)
	arg_2_0.constVar = {
		taskList = {},
		scrollHelper = LuaList.New(handler(arg_2_0, arg_2_0.OnRenderTask), arg_2_0.m_list, CommonTaskItemModule)
	}
	arg_2_0.RenderType = {
		Type = 2,
		Activity = 1,
		OriginTask = 3,
		None = 0
	}
end

function var_0_0.BuildContext(arg_3_0)
	arg_3_0.renderContext = {
		taskCount = 0,
		activityId = 0,
		taskType = 0,
		renderType = arg_3_0.RenderType.None
	}
	arg_3_0.constVar.taskList = {}
end

function var_0_0.Init(arg_4_0)
	arg_4_0:BindCfgUI()
	arg_4_0:InitContext()
end

function var_0_0.RegisterTaskListChangedEvent(arg_5_0, arg_5_1)
	arg_5_0.constVar.changeEvent = arg_5_1
end

function var_0_0.RenderActivityTaskList(arg_6_0, arg_6_1)
	arg_6_0:BuildContext()

	arg_6_0.renderContext.renderType = arg_6_0.RenderType.Activity
	arg_6_0.renderContext.activityId = arg_6_1

	local var_6_0 = TaskData2:GetActivityTaskSortList(arg_6_1)

	arg_6_0.constVar.taskList = var_6_0
	arg_6_0.renderContext.taskCount = #var_6_0

	arg_6_0:RenderView()
end

function var_0_0.RenderTypeTaskList(arg_7_0, arg_7_1)
	arg_7_0:BuildContext()

	arg_7_0.renderContext.renderType = arg_7_0.RenderType.Type
	arg_7_0.renderContext.taskType = arg_7_1

	local var_7_0 = TaskData2:GetTypedTaskSortList(arg_7_1)

	arg_7_0.constVar.taskList = var_7_0
	arg_7_0.renderContext.taskCount = #var_7_0

	arg_7_0:RenderView()
end

function var_0_0.RenderView(arg_8_0)
	arg_8_0.constVar.scrollHelper:StartScroll(arg_8_0.renderContext.taskCount, 1)
end

function var_0_0.RefreshView(arg_9_0)
	if arg_9_0.renderContext.renderType == arg_9_0.RenderType.Type then
		arg_9_0:RenderTypeTaskList(arg_9_0.renderContext.taskType)
	elseif arg_9_0.renderContext.renderType == arg_9_0.RenderType.Activity then
		arg_9_0:RenderActivityTaskList(arg_9_0.renderContext.activityId)
	end
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
	arg_13_0:RemoveAllEventListener()
end

function var_0_0.Dispose(arg_14_0)
	arg_14_0:RemoveAllEventListener()
	arg_14_0.constVar.scrollHelper:Dispose()
	var_0_0.super.Dispose(arg_14_0)
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

return var_0_0
