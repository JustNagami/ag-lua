local var_0_0 = class("CommonTaskPopView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/Common/Pop/CommonTask"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiPop.transform
end

function var_0_0.InitContext(arg_3_0)
	arg_3_0.constVar = {
		taskIdList = {},
		taskListModule = CommonTaskListModule.New(arg_3_0.m_taskList)
	}
end

function var_0_0.BuildContext(arg_4_0)
	arg_4_0.data = {
		activityId = arg_4_0.params_.activityId,
		taskType = arg_4_0.params_.taskType
	}
end

function var_0_0.Init(arg_5_0)
	arg_5_0:BindCfgUI()
	arg_5_0:InitContext()
	arg_5_0:AddUIListener()
end

function var_0_0.OnEnter(arg_6_0)
	arg_6_0:BuildContext()
	arg_6_0.constVar.taskListModule:OnEnter()

	if arg_6_0.data.activityId then
		arg_6_0.constVar.taskListModule:RenderActivityTaskList(arg_6_0.data.activityId)
	elseif arg_6_0.data.taskType then
		arg_6_0.constVar.taskListModule:RenderTypeTaskList(arg_6_0.data.taskType)
	end
end

function var_0_0.OnExit(arg_7_0)
	arg_7_0.constVar.taskListModule:OnExit()
end

function var_0_0.Dispose(arg_8_0)
	arg_8_0.constVar.taskListModule:Dispose()
end

function var_0_0.AddUIListener(arg_9_0)
	arg_9_0:AddBtnListener(arg_9_0.m_mask, nil, function()
		arg_9_0:Back()
	end)
end

return var_0_0
