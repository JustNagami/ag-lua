return {
	GetEnterViewUIName = function(arg_1_0)
		local var_1_0 = ActivityTools.GetActivityTheme(arg_1_0)

		if var_1_0 == ActivityConst.THEME.ACTIVITY_2_6 then
			return "UI/VersionUI/JapanRegionUI_2_6/JapanRegionPreheatUI/JapanRegionPreheatMainUI"
		elseif var_1_0 == ActivityConst.THEME.ACTIVITY_3_6 then
			return "Widget/Version/ShashwatUI_3_7/ShashwatUI_3_7_PreheatUI/ShashwatPreheatMainUI"
		else
			return "UI/VersionUI/JapanRegionUI_2_6/JapanRegionPreheatUI/JapanRegionPreheatMainUI"
		end
	end,
	GetMainViewUIName = function(arg_2_0)
		local var_2_0 = ActivityTools.GetActivityTheme(arg_2_0)

		if var_2_0 == ActivityConst.THEME.ACTIVITY_2_6 then
			return "UI/VersionUI/JapanRegionUI_2_6/JapanRegionPreheatUI/JapanRegionPreheatRoleUI"
		elseif var_2_0 == ActivityConst.THEME.ACTIVITY_3_6 then
			return "Widget/Version/ShashwatUI_3_7/ShashwatUI_3_7_PreheatUI/ShashwatPreheatRoleUI"
		else
			return "UI/VersionUI/JapanRegionUI_2_6/JapanRegionPreheatUI/JapanRegionPreheatRoleUI"
		end
	end,
	GetTaskViewUIName = function(arg_3_0)
		local var_3_0 = ActivityTools.GetActivityTheme(arg_3_0)

		if var_3_0 == ActivityConst.THEME.ACTIVITY_2_6 then
			return "UI/VersionUI/JapanRegionUI_2_6/JapanRegionPreheatUI/JapanRegionPreheatRewardUI"
		elseif var_3_0 == ActivityConst.THEME.ACTIVITY_3_6 then
			return "Widget/Version/ShashwatUI_3_7/ShashwatUI_3_7_PreheatUI/ShashwatPreheatRewardUI"
		else
			return "UI/VersionUI/JapanRegionUI_2_6/JapanRegionPreheatUI/JapanRegionPreheatRewardUI"
		end
	end,
	GetDrawResultViewUIName = function(arg_4_0)
		local var_4_0 = ActivityTools.GetActivityTheme(arg_4_0)

		if var_4_0 == ActivityConst.THEME.ACTIVITY_2_6 then
			return "UI/VersionUI/JapanRegionUI_2_6/JapanRegionPreheatUI/JapanRegionPreheatPopUI"
		elseif var_4_0 == ActivityConst.THEME.ACTIVITY_3_6 then
			return "Widget/Version/ShashwatUI_3_7/ShashwatUI_3_7_PreheatUI/ShashwatPreheatPopUI"
		else
			return "UI/VersionUI/JapanRegionUI_2_6/JapanRegionPreheatUI/JapanRegionPreheatPopUI"
		end
	end,
	GetClueDetailViewUIName = function(arg_5_0)
		local var_5_0 = ActivityTools.GetActivityTheme(arg_5_0)

		if var_5_0 == ActivityConst.THEME.ACTIVITY_2_6 then
			return "UI/VersionUI/JapanRegionUI_2_6/JapanRegionPreheatUI/JapanRegionPreheaDetailsUI"
		elseif var_5_0 == ActivityConst.THEME.ACTIVITY_3_6 then
			return "Widget/Version/ShashwatUI_3_7/ShashwatUI_3_7_PreheatUI/ShashwatPreheatPop2UI"
		else
			return "UI/VersionUI/JapanRegionUI_2_6/JapanRegionPreheatUI/JapanRegionPreheaDetailsUI"
		end
	end,
	GetGamePlayDesc = function(arg_6_0)
		if ActivityTools.GetActivityTheme(arg_6_0) < ActivityConst.THEME.ACTIVITY_3_6 then
			return GetTips("ACTIVITY_HERO_CLUE_3_7_GAMEPLAY_DESC")
		else
			return GetTips("ACTIVITY_HERO_CLUE_3_7_GAMEPLAY_DESC")
		end
	end,
	GetActivityDesc = function(arg_7_0)
		if ActivityTools.GetActivityTheme(arg_7_0) < ActivityConst.THEME.ACTIVITY_3_6 then
			return GetTips("ACTIVITY_HERO_CLUE_DESC")
		else
			return GetTips("ACTIVITY_HERO_CLUE_3_7_DESC")
		end
	end,
	GetActivityTitle = function(arg_8_0)
		local var_8_0 = ActivityToggleCfg.get_id_list_by_activity_id[arg_8_0]

		if var_8_0 then
			return ActivityToggleCfg[var_8_0[1]].name
		end
	end,
	GetCostOfOneDraw = function()
		return 1
	end,
	GetClueItemClass = function(arg_10_0)
		if ActivityTools.GetActivityTheme(arg_10_0) < ActivityConst.THEME.ACTIVITY_3_6 then
			return HeroClueItem
		else
			return HeroClueItem_3_6
		end
	end,
	GetTaskItemClass = function(arg_11_0)
		if ActivityTools.GetActivityTheme(arg_11_0) < ActivityConst.THEME.ACTIVITY_3_6 then
			return HeroClueEnterTaskItem
		else
			return HeroClueEnterTaskItem_3_6
		end
	end,
	GoToClueMainView = function(arg_12_0)
		if ActivityTools.GetActivityTheme(arg_12_0) < ActivityConst.THEME.ACTIVITY_3_6 then
			JumpTools.OpenPageByJump("/heroClueMain", {
				activityID = arg_12_0
			})
		else
			JumpTools.OpenPageByJump("/heroClueMainView_3_6", {
				activityID = arg_12_0
			})
		end
	end,
	GoToClueDetailView = function(arg_13_0, arg_13_1)
		if ActivityTools.GetActivityTheme(arg_13_0) < ActivityConst.THEME.ACTIVITY_3_6 then
			JumpTools.OpenPageByJump("heroClueDetail", {
				activityID = arg_13_0,
				clueID = arg_13_1
			})
		else
			JumpTools.OpenPageByJump("heroClueDetailView_3_6", {
				activityID = arg_13_0,
				clueID = arg_13_1
			})
		end
	end,
	GetTaskActivityID = function(arg_14_0)
		return ActivityCfg[arg_14_0].sub_activity_list[1]
	end,
	GetPlayTaskActivityID = function(arg_15_0)
		return ActivityCfg[arg_15_0].sub_activity_list[2]
	end
}
