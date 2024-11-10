local var_0_0 = class("HeroClueTaskView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return HeroClueTools.GetTaskViewUIName(arg_1_0.params_.activtiyID)
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiPop.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:InitUI()
	arg_3_0:AddUIListener()
end

function var_0_0.InitUI(arg_4_0)
	arg_4_0:BindCfgUI()

	arg_4_0.scrollHelper_ = LuaList.New(handler(arg_4_0, arg_4_0.IndexItem), arg_4_0.scrollView_, HeroClueTaskItem)
	arg_4_0.taskUpdateHandler_ = handler(arg_4_0, arg_4_0.UpdateData)
end

function var_0_0.AddUIListener(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.backMask_, nil, function()
		arg_5_0:Back()
	end)
end

function var_0_0.OnEnter(arg_7_0)
	arg_7_0.taskActivityID_ = arg_7_0.params_.activityID
	arg_7_0.mainActivityID_ = arg_7_0.params_.mainActivityID

	arg_7_0:RefreshUI()
	arg_7_0:RegistEventListener(OSIRIS_TASK_UPDATE, arg_7_0.taskUpdateHandler_)
end

function var_0_0.OnExit(arg_8_0)
	arg_8_0:RemoveAllEventListener()
end

function var_0_0.Dispose(arg_9_0)
	if arg_9_0.scrollHelper_ then
		arg_9_0.scrollHelper_:Dispose()

		arg_9_0.scrollHelper_ = nil
	end

	var_0_0.super.Dispose(arg_9_0)
end

function var_0_0.RefreshUI(arg_10_0)
	arg_10_0.taskDataList_ = TaskData2:GetActivityTaskSortList(arg_10_0.taskActivityID_)

	arg_10_0.scrollHelper_:StartScroll(#arg_10_0.taskDataList_)

	local var_10_0 = #arg_10_0.taskDataList_
	local var_10_1 = 0

	for iter_10_0, iter_10_1 in ipairs(arg_10_0.taskDataList_) do
		local var_10_2 = iter_10_1.id
		local var_10_3 = AssignmentCfg[var_10_2]

		if iter_10_1.progress >= var_10_3.need and TaskData2:GetTaskComplete(var_10_2) then
			var_10_1 = var_10_1 + 1
		end
	end

	arg_10_0.progressText_.text = string.format("%s/%s", var_10_1, var_10_0)
end

function var_0_0.IndexItem(arg_11_0, arg_11_1, arg_11_2)
	local var_11_0 = arg_11_0.taskDataList_[arg_11_1].id

	arg_11_2:SetData(var_11_0, arg_11_0.taskActivityID_)
end

function var_0_0.UpdateData(arg_12_0)
	arg_12_0:RefreshUI()
	HeroClueAction.UpdateDrawRedPoint(arg_12_0.mainActivityID_)
end

return var_0_0
