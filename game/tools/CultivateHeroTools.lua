return {
	GetMainUIName = function(arg_1_0)
		local var_1_0 = ActivityTools.GetActivityTheme(arg_1_0)

		if ActivityCultivateHeroUICfg[var_1_0] then
			return ActivityCultivateHeroUICfg[var_1_0].main_ui_path
		else
			Debug.Log(string.format("<color=ff0000>ActivityCultivateHeroUICfg has no theme(%d)</color>", var_1_0))

			return "UI/VersionUI/XuHeng1stUI/XH1stReceivedUI/XH1stReceivedUI"
		end
	end,
	GetRewardUIName = function(arg_2_0)
		local var_2_0 = ActivityTools.GetActivityTheme(arg_2_0)

		if ActivityCultivateHeroUICfg[var_2_0] then
			return ActivityCultivateHeroUICfg[var_2_0].reward_ui_path
		else
			Debug.Log(string.format("<color=ff0000>ActivityCultivateHeroUICfg has no theme(%d)</color>", var_2_0))

			return "UI/VersionUI/XuHeng1stUI/XH1stReceivedUI/XH1stRewardPopUI"
		end
	end,
	GetSwitchItemClass = function(arg_3_0)
		if ActivityTools.GetActivityTheme(arg_3_0) == ActivityConst.THEME.ACTIVITY_2_0 then
			return CultivateHeroSwitchItem
		else
			return CultivateHeroSwitchItem_2_1
		end
	end
}
