return {
	JumpToLimitTimeTaskView = function(arg_1_0)
		JumpTools.OpenPageByJump("/limitTimeTaskBaseView", {
			activityID = arg_1_0
		})
	end,
	GetLimitTimeTaskUIName = function(arg_2_0)
		if arg_2_0 == ActivityConst.QUANZHOU_LIMIT_TASK then
			return "Widget/System/SandPlay_QuanZhou/QuanZhou_Com/QuanZhou_QuestUI"
		elseif arg_2_0 == ActivityConst.ACTIVITY_OSIRIS_PLAY_GAME_ACCUMULATE_TASK then
			return "Widget/System/Activity_Osiris/Activity_Osiris_QuestUI"
		else
			return "Widget/Common/Com_Prefab/Com_Activity_QuestUI"
		end
	end,
	GetLimitTimeTabView = function(arg_3_0)
		return LimitTimeTaskBaseTabItem
	end,
	GetLimitTimeTaskScheduleItemView = function(arg_4_0)
		return LimitTimeTaskBaseScheduleItem
	end
}
