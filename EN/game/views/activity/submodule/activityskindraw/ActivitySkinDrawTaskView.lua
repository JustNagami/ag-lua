local var_0_0 = class("ActivitySkinDrawTaskView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return ActivitySkinDrawTools.GetTaskUIName(arg_1_0.params_.activityID)
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:InitUI()
	arg_3_0:AddUIListeners()
end

function var_0_0.InitUI(arg_4_0)
	arg_4_0:BindCfgUI()

	arg_4_0.typeCon_ = ControllerUtil.GetController(arg_4_0.transform_, "type")
	arg_4_0.scrollHelper_ = LuaList.New(handler(arg_4_0, arg_4_0.IndexItem), arg_4_0.listGo_, ActivitySkinDrawTaskItem)
end

function var_0_0.IndexItem(arg_5_0, arg_5_1, arg_5_2)
	arg_5_2:Refresh(arg_5_0.list_[arg_5_1], arg_5_0.activityID_)
end

function var_0_0.AddUIListeners(arg_6_0)
	arg_6_0:AddBtnListener(arg_6_0.allReceiveBtn_, nil, function()
		local var_7_0 = {}
		local var_7_1 = ActivitySkinDrawTools.GetTaskActivityID(arg_6_0.activityID_)

		for iter_7_0, iter_7_1 in ipairs(arg_6_0.list_) do
			local var_7_2 = AssignmentCfg[iter_7_1]
			local var_7_3 = TaskData2:GetTask(iter_7_1)

			if var_7_3.complete_flag < 1 and var_7_3.progress >= var_7_2.need then
				table.insert(var_7_0, iter_7_1)
			end
		end

		TaskAction:SubmitTaskList(var_7_0)
	end)
end

function var_0_0.OnEnter(arg_8_0)
	arg_8_0:RefreshUI()
	arg_8_0:RegistEventListener(OSIRIS_TASK_UPDATE, handler(arg_8_0, arg_8_0.RefreshTask))
end

function var_0_0.RefreshUI(arg_9_0)
	arg_9_0:RefreshTask()
end

function var_0_0.RefreshTask(arg_10_0)
	arg_10_0.activityID_ = arg_10_0.params_.activityID
	arg_10_0.taskActivityID_ = arg_10_0.params_.taskActivityID
	arg_10_0.list_ = {}

	local var_10_0 = TaskTools:GetActivityTaskList(arg_10_0.taskActivityID_) or {}

	local function var_10_1(arg_11_0, arg_11_1)
		local var_11_0 = AssignmentCfg[arg_11_0]
		local var_11_1 = AssignmentCfg[arg_11_1]

		if var_11_0.type ~= var_11_1.type then
			return var_11_0.type < var_11_1.type
		end

		return arg_11_0 < arg_11_1
	end

	local var_10_2 = {}
	local var_10_3 = {}
	local var_10_4 = {}

	for iter_10_0, iter_10_1 in pairs(var_10_0) do
		taskID = iter_10_1.id

		local var_10_5 = AssignmentCfg[taskID]

		if var_10_5.activity_id == arg_10_0.taskActivityID_ then
			if iter_10_1.complete_flag >= 1 then
				table.insert(var_10_4, taskID)
			elseif iter_10_1.progress >= var_10_5.need then
				table.insert(var_10_2, taskID)
			else
				table.insert(var_10_3, taskID)
			end
		end
	end

	table.sort(var_10_2, var_10_1)
	table.sort(var_10_3, var_10_1)
	table.sort(var_10_4, var_10_1)
	table.insertto(arg_10_0.list_, var_10_2)
	table.insertto(arg_10_0.list_, var_10_3)
	table.insertto(arg_10_0.list_, var_10_4)
	arg_10_0.scrollHelper_:StartScroll(#arg_10_0.list_)

	if #var_10_2 > 0 then
		arg_10_0.typeCon_:SetSelectedState("true")
	else
		arg_10_0.typeCon_:SetSelectedState("false")
	end
end

function var_0_0.OnTop(arg_12_0)
	local var_12_0 = {
		BACK_BAR,
		HOME_BAR
	}
	local var_12_1 = ActivitySkinDrawTools.GetTaskCurrency(arg_12_0.activityID_)

	table.insertto(var_12_0, var_12_1)
	manager.windowBar:SwitchBar(var_12_0)

	for iter_12_0, iter_12_1 in ipairs(var_12_1) do
		manager.windowBar:SetBarCanAdd(iter_12_1, true)
	end
end

function var_0_0.OnExit(arg_13_0)
	manager.windowBar:HideBar()
	arg_13_0:RemoveAllEventListener()
end

function var_0_0.Dispose(arg_14_0)
	arg_14_0:RemoveAllListeners()
	arg_14_0.scrollHelper_:Dispose()
	arg_14_0.super.Dispose(arg_14_0)
end

return var_0_0
