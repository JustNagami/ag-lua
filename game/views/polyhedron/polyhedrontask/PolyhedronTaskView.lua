local var_0_0 = class("PolyhedronTaskView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/System/Polyhedron/PolyhedronTaskUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:InitUI()
	arg_3_0:AddUIListener()
end

function var_0_0.InitUI(arg_4_0)
	arg_4_0:BindCfgUI()

	arg_4_0.typeController_ = ControllerUtil.GetController(arg_4_0.transform_, "type")
	arg_4_0.taskList_ = {}
	arg_4_0.tipsList_ = {}
end

function var_0_0.AddUIListener(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.seasonBtn_, nil, function()
		arg_5_0:RefreshUI(1)
	end)
	arg_5_0:AddBtnListener(arg_5_0.achievmentBtn_, nil, function()
		arg_5_0:RefreshUI(2)
	end)
end

function var_0_0.OnTop(arg_8_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR
	})
end

function var_0_0.OnEnter(arg_9_0)
	arg_9_0.activityID_ = PolyhedronData:GetActivityID()

	arg_9_0:RegistEventListener(ACTIVITY_UPDATE, function(arg_10_0)
		local var_10_0 = ActivityTools.GetActivityType(arg_10_0)

		if ActivityTemplateConst.POLYHEDRON_ACTIVITY == var_10_0 then
			arg_9_0.activityID_ = arg_10_0

			arg_9_0:OnTaskListChange()
		end
	end)
	arg_9_0:RefreshTaskActivityIDList()
	arg_9_0:BindRedPoint()

	arg_9_0.curType_ = nil

	arg_9_0:RefreshUI(1)
end

function var_0_0.OnExit(arg_11_0)
	arg_11_0.curType_ = nil

	arg_11_0:UnbindRedPoint()
	arg_11_0:RemoveAllEventListener()
	manager.windowBar:HideBar()
end

function var_0_0.Dispose(arg_12_0)
	for iter_12_0, iter_12_1 in ipairs(arg_12_0.taskList_) do
		iter_12_1:Dispose()
	end

	arg_12_0.taskList_ = nil

	for iter_12_2, iter_12_3 in ipairs(arg_12_0.tipsList_) do
		iter_12_3:Dispose()
	end

	arg_12_0.tipsList_ = nil

	var_0_0.super.Dispose(arg_12_0)
end

function var_0_0.RefreshUI(arg_13_0, arg_13_1)
	if arg_13_1 == arg_13_0.curType_ then
		return
	end

	arg_13_0.curType_ = arg_13_1

	arg_13_0.typeController_:SetSelectedIndex(arg_13_0.curType_ - 1)
	arg_13_0:RefreshTaskList(arg_13_1)
	arg_13_0:RefreshTipsList(arg_13_1)
end

function var_0_0.RefreshTaskList(arg_14_0, arg_14_1)
	local var_14_0 = arg_14_0:GetSortedTask(arg_14_1)
	local var_14_1 = 0

	for iter_14_0, iter_14_1 in ipairs(var_14_0) do
		local var_14_2 = #AssignmentCfg[iter_14_1].reward

		var_14_1 = var_14_1 < var_14_2 and var_14_2 or var_14_1
	end

	for iter_14_2, iter_14_3 in ipairs(var_14_0) do
		if not arg_14_0.taskList_[iter_14_2] then
			arg_14_0.taskList_[iter_14_2] = PolyhedronTaskItem.New(arg_14_0.taskPanelTrans_, arg_14_0.taskItemGo_)
		end

		arg_14_0.taskList_[iter_14_2]:SetData(iter_14_3, var_14_1)
	end

	for iter_14_4 = #var_14_0 + 1, #arg_14_0.taskList_ do
		arg_14_0.taskList_[iter_14_4]:Show(false)
	end
end

function var_0_0.RefreshTipsList(arg_15_0, arg_15_1)
	local var_15_0 = {}
	local var_15_1 = {}

	if arg_15_1 == 1 then
		var_15_1 = arg_15_0.curSeasonActivityList_
	else
		var_15_1 = arg_15_0.curAchievementActivityList_
	end

	for iter_15_0, iter_15_1 in ipairs(var_15_1) do
		if not ActivityData:GetActivityIsOpen(iter_15_1) then
			var_15_0[#var_15_0 + 1] = iter_15_1
		end
	end

	for iter_15_2, iter_15_3 in ipairs(var_15_0) do
		if not arg_15_0.tipsList_[iter_15_2] then
			arg_15_0.tipsList_[iter_15_2] = PolyhedronTaskTipsItem.New(arg_15_0.tipsPanelTrans_, arg_15_0.tipsItemGo_)
		end

		arg_15_0.tipsList_[iter_15_2]:SetData(iter_15_3)
	end

	for iter_15_4 = #var_15_0 + 1, #arg_15_0.tipsList_ do
		arg_15_0.tipsList_[iter_15_4]:Show(false)
	end

	arg_15_0:RefreshTipsPosition(arg_15_1)
end

function var_0_0.RefreshTipsPosition(arg_16_0, arg_16_1)
	if arg_16_0:IsAllReceived(arg_16_1) == true then
		arg_16_0.tipsPanelTrans_:SetAsFirstSibling()
	else
		arg_16_0.tipsPanelTrans_:SetAsLastSibling()
	end

	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_16_0.taskPanelTrans_)
end

function var_0_0.IsAllReceived(arg_17_0, arg_17_1)
	local var_17_0 = {}

	if arg_17_1 == 1 then
		var_17_0 = arg_17_0.curSeasonActivityList_
	else
		var_17_0 = arg_17_0.curAchievementActivityList_
	end

	for iter_17_0, iter_17_1 in ipairs(var_17_0) do
		if ActivityData:GetActivityIsOpen(iter_17_1) == true then
			local var_17_1 = AssignmentCfg.get_id_list_by_activity_id[iter_17_1]

			for iter_17_2, iter_17_3 in ipairs(var_17_1) do
				if TaskData2:GetTask(iter_17_3) and not TaskData2:GetTaskComplete(iter_17_3) then
					return false
				end
			end
		end
	end

	return true
end

function var_0_0.OnTaskListChange(arg_18_0)
	local var_18_0 = arg_18_0.curType_

	arg_18_0.curType_ = nil

	arg_18_0:RefreshTaskActivityIDList()
	arg_18_0:RefreshUI(var_18_0)
end

function var_0_0.RefreshTaskActivityIDList(arg_19_0)
	arg_19_0.curSeasonActivityList_ = ActivityCfg[arg_19_0.activityID_].season_task_activity_list
	arg_19_0.curAchievementActivityList_ = ActivityCfg[arg_19_0.activityID_].achievement_task_activity_list
end

function var_0_0.GetSortedTask(arg_20_0, arg_20_1)
	local var_20_0 = {}

	if arg_20_1 == 1 then
		var_20_0 = arg_20_0.curSeasonActivityList_
	else
		var_20_0 = arg_20_0.curAchievementActivityList_
	end

	local var_20_1 = {}

	for iter_20_0, iter_20_1 in ipairs(var_20_0) do
		if ActivityData:GetActivityIsOpen(iter_20_1) == true then
			table.insertto(var_20_1, AssignmentCfg.get_id_list_by_activity_id[iter_20_1])
		end
	end

	local var_20_2 = {}
	local var_20_3 = {}
	local var_20_4 = {}
	local var_20_5 = {}
	local var_20_6 = {}
	local var_20_7
	local var_20_8 = {}

	for iter_20_2, iter_20_3 in pairs(var_20_1) do
		local var_20_9 = AssignmentCfg[iter_20_3]
		local var_20_10 = var_20_9.activity_id
		local var_20_11 = TaskData2:GetTask(iter_20_3)

		if var_20_11 then
			if var_20_11.complete_flag == 0 then
				if var_20_11.progress < var_20_9.need then
					table.insert(var_20_4, iter_20_3)
				else
					table.insert(var_20_3, iter_20_3)
				end
			elseif var_20_11.complete_flag >= 1 then
				table.insert(var_20_5, iter_20_3)
			end
		end
	end

	table.sort(var_20_3, function(arg_21_0, arg_21_1)
		return AssignmentCfg[arg_21_0].id < AssignmentCfg[arg_21_1].id
	end)
	table.sort(var_20_4, function(arg_22_0, arg_22_1)
		return AssignmentCfg[arg_22_0].id < AssignmentCfg[arg_22_1].id
	end)
	table.sort(var_20_5, function(arg_23_0, arg_23_1)
		return AssignmentCfg[arg_23_0].id < AssignmentCfg[arg_23_1].id
	end)
	table.insertto(var_20_2, var_20_3)
	table.insertto(var_20_2, var_20_4)
	table.insertto(var_20_2, var_20_5)

	return var_20_2
end

function var_0_0.BindRedPoint(arg_24_0)
	manager.redPoint:bindUIandKey(arg_24_0.seasonBtn_.transform, RedPointConst.POLYHEDRON_TASK_SEASON)
	manager.redPoint:bindUIandKey(arg_24_0.achievmentBtn_.transform, RedPointConst.POLYHEDRON_TASK_ACHIEVEMENT)
end

function var_0_0.UnbindRedPoint(arg_25_0)
	manager.redPoint:unbindUIandKey(arg_25_0.seasonBtn_.transform, RedPointConst.POLYHEDRON_TASK_SEASON)
	manager.redPoint:unbindUIandKey(arg_25_0.achievmentBtn_.transform, RedPointConst.POLYHEDRON_TASK_ACHIEVEMENT)
end

return var_0_0
