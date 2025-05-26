local var_0_0 = class("ActivityGodEaterGameTaskView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/Version/V4_2_GodEaterUI/V4_2_GodEaterUI_Bounty/V4_2_GodEaterUI_Bounty_MainUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:InitUI()

	arg_3_0.list_ = {}

	arg_3_0:AddUIListeners()
end

function var_0_0.InitUI(arg_4_0)
	arg_4_0:BindCfgUI()

	arg_4_0.uiList_ = LuaList.New(handler(arg_4_0, arg_4_0.RefreshItem), arg_4_0.uilistUilist_, GodEaterTaskItem)
end

function var_0_0.OnEnter(arg_5_0)
	arg_5_0.activityID_ = arg_5_0.param_ and arg_5_0.param_.activity_id or 343671

	local var_5_0 = ActivityData:GetActivityData(arg_5_0.activityID_)

	arg_5_0.startTime_ = var_5_0.startTime
	arg_5_0.stopTime_ = var_5_0.stopTime

	manager.redPoint:bindUIandKey(arg_5_0.rewardbtnBtn_.transform, RedPointConst.ACTIVITY_GODEATER_TASK_REWARD_2)
	arg_5_0:StopTimer()
	arg_5_0:RefreshTaskList()
	arg_5_0:RefreshTimeText()

	arg_5_0.timer = Timer.New(function()
		if manager.time:GetServerTime() > arg_5_0.stopTime_ then
			return
		end

		arg_5_0:RefreshTimeText()
	end, 1)

	arg_5_0.timer:Start()
end

function var_0_0.StopTimer(arg_7_0)
	if arg_7_0.timer_ then
		arg_7_0.timer_:Stop()

		arg_7_0.timer_ = nil
	end
end

function var_0_0.RefreshTaskList(arg_8_0)
	arg_8_0.list_ = {}

	local var_8_0 = TaskTools:GetTaskIDList(TaskConst.TASK_TYPE.ACTIVITY_GOD_EATER_1) or {}
	local var_8_1 = TaskTools:GetTaskIDList(TaskConst.TASK_TYPE.ACTIVITY_GOD_EATER_3)

	for iter_8_0, iter_8_1 in ipairs(var_8_1) do
		table.insert(var_8_0, iter_8_1)
	end

	arg_8_0.list_ = TaskTools:SortTaskList(var_8_0)

	arg_8_0.uiList_:StartScroll(#arg_8_0.list_)
end

function var_0_0.OnTop(arg_9_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR,
		INFO_BAR
	})
	manager.windowBar:SetGameHelpKey("GOD_EATER_GAME_TIPS_2")
	arg_9_0:RefreshTaskList()
end

function var_0_0.RefreshItem(arg_10_0, arg_10_1, arg_10_2)
	local var_10_0 = arg_10_0.list_[arg_10_1]

	arg_10_2:SetData(var_10_0)
end

function var_0_0.RefreshTimeText(arg_11_0)
	arg_11_0.textimeText_.text = manager.time.WrapTimeStrWithTips(manager.time:GetLostTimeStrWith2Unit(arg_11_0.stopTime_))
end

function var_0_0.AddUIListeners(arg_12_0)
	arg_12_0:AddBtnListener(arg_12_0.rewardbtnBtn_, nil, function()
		GodEaterTool.GotoMilestone(ActivityConst.ACTIVITY_GODEATER_MAIN_KEY)
	end)
end

function var_0_0.OnBehind(arg_14_0)
	manager.windowBar:HideBar()
end

function var_0_0.OnExit(arg_15_0)
	manager.windowBar:HideBar()
	arg_15_0:StopTimer()
	arg_15_0:RemoveTween()
	manager.redPoint:unbindUIandKey(arg_15_0.rewardbtnBtn_.transform, RedPointConst.ACTIVITY_GODEATER_TASK_REWARD_2)
end

function var_0_0.RemoveTween(arg_16_0)
	return
end

function var_0_0.StopTimer(arg_17_0)
	if arg_17_0.timer_ then
		arg_17_0.timer_:Stop()

		arg_17_0.timer_ = nil
	end
end

function var_0_0.Dispose(arg_18_0)
	var_0_0.super.Dispose(arg_18_0)

	if arg_18_0.uiList_ then
		arg_18_0.uiList_:Dispose()

		arg_18_0.uiList_ = nil
	end
end

return var_0_0
