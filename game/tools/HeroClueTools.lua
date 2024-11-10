return {
	GetEnterViewUIName = function(arg_1_0)
		if ActivityTools.GetActivityTheme(arg_1_0) == ActivityConst.THEME.ACTIVITY_2_6 then
			return "UI/VersionUI/JapanRegionUI_2_6/JapanRegionPreheatUI/JapanRegionPreheatMainUI"
		else
			return "UI/VersionUI/JapanRegionUI_2_6/JapanRegionPreheatUI/JapanRegionPreheatMainUI"
		end
	end,
	GetMainViewUIName = function(arg_2_0)
		if ActivityTools.GetActivityTheme(arg_2_0) == ActivityConst.THEME.ACTIVITY_2_6 then
			return "UI/VersionUI/JapanRegionUI_2_6/JapanRegionPreheatUI/JapanRegionPreheatRoleUI"
		else
			return "UI/VersionUI/JapanRegionUI_2_6/JapanRegionPreheatUI/JapanRegionPreheatRoleUI"
		end
	end,
	GetTaskViewUIName = function(arg_3_0)
		if ActivityTools.GetActivityTheme(arg_3_0) == ActivityConst.THEME.ACTIVITY_2_6 then
			return "UI/VersionUI/JapanRegionUI_2_6/JapanRegionPreheatUI/JapanRegionPreheatRewardUI"
		else
			return "UI/VersionUI/JapanRegionUI_2_6/JapanRegionPreheatUI/JapanRegionPreheatRewardUI"
		end
	end,
	GetDrawResultViewUIName = function(arg_4_0)
		if ActivityTools.GetActivityTheme(arg_4_0) == ActivityConst.THEME.ACTIVITY_2_6 then
			return "UI/VersionUI/JapanRegionUI_2_6/JapanRegionPreheatUI/JapanRegionPreheatPopUI"
		else
			return "UI/VersionUI/JapanRegionUI_2_6/JapanRegionPreheatUI/JapanRegionPreheatPopUI"
		end
	end,
	GetClueDetailViewUIName = function(arg_5_0)
		if ActivityTools.GetActivityTheme(arg_5_0) == ActivityConst.THEME.ACTIVITY_2_6 then
			return "UI/VersionUI/JapanRegionUI_2_6/JapanRegionPreheatUI/JapanRegionPreheaDetailsUI"
		else
			return "UI/VersionUI/JapanRegionUI_2_6/JapanRegionPreheatUI/JapanRegionPreheaDetailsUI"
		end
	end,
	GetTaskActivityID = function(arg_6_0)
		return ActivityCfg[arg_6_0].sub_activity_list[1]
	end,
	GetPlayTaskActivityID = function(arg_7_0)
		return ActivityCfg[arg_7_0].sub_activity_list[2]
	end
}
