return {
	GetEnterUI = function(arg_1_0)
		if ActivityTools.GetActivityTheme(arg_1_0) == ActivityConst.THEME.ACTIVITY_2_8 then
			return "Widget/System/Challenge_ArenaUI/IndiaArenaMainUI"
		else
			return "Widget/Version/NorseUI_3_0/NorseUI_3_0_ArenaUI/NorseUI_3_0_ArenaMainUI"
		end
	end,
	GetMainUIName = function(arg_2_0)
		if ActivityTools.GetActivityTheme(arg_2_0) == ActivityConst.THEME.ACTIVITY_2_8 then
			return "Widget/System/Challenge_ArenaUI/IndiaInletUI"
		else
			return "Widget/Version/NorseUI_3_0/NorseUI_3_0_ArenaUI/NorseUI_3_0_InletUI"
		end
	end,
	GetRankUI = function(arg_3_0)
		if ActivityTools.GetActivityTheme(arg_3_0) == ActivityConst.THEME.ACTIVITY_2_8 then
			return "Widget/System/Challenge_ArenaUI/IndiaPTRankUI"
		else
			return "Widget/Version/NorseUI_3_0/NorseUI_3_0_ArenaUI/NorseUI_3_0_PTRankUI"
		end
	end,
	GetRewardUI = function(arg_4_0)
		if ActivityTools.GetActivityTheme(arg_4_0) == ActivityConst.THEME.ACTIVITY_2_8 then
			return "Widget/System/Challenge_ArenaUI/IndiaRewardUI"
		else
			return "Widget/Version/NorseUI_3_0/NorseUI_3_0_ArenaUI/NorseUI_3_0_RewardUI"
		end
	end,
	GetRoundUI = function(arg_5_0)
		if ActivityTools.GetActivityTheme(arg_5_0) == ActivityConst.THEME.ACTIVITY_2_8 then
			return "Widget/System/Challenge_ArenaUI/IndiaRewardtimeUI"
		else
			return "Widget/Version/NorseUI_3_0/NorseUI_3_0_ArenaUI/NorseUI_3_0_RewardtimeUI"
		end
	end,
	GetTrialHeroList = function(arg_6_0)
		return ActivityAttributeArenaCfg[arg_6_0].trial_hero_list
	end
}
