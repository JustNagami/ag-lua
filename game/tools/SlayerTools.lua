return {
	GetMainUIName = function(arg_1_0)
		local var_1_0 = ActivityTools.GetActivityTheme(arg_1_0)

		if var_1_0 == ActivityConst.THEME.TYR then
			return "UI/VersionUI/DarkFlameUI/DFCutGrassUI/DFCutGrassMainUI"
		elseif var_1_0 == ActivityConst.THEME.ACTIVITY_2_4 then
			return "UI/VersionUI/JapanRegionUI_2_4/JapanRegionHuntingUI/JapanRegionHtMainUI"
		else
			return "UI/VolumeIIIUI/VolumeCutgrassMainUI"
		end
	end,
	GetSelectUIName = function(arg_2_0)
		local var_2_0 = ActivityTools.GetActivityTheme(arg_2_0)

		if var_2_0 == ActivityConst.THEME.TYR then
			return "UI/VersionUI/DarkFlameUI/DFCutGrassUI/DFCutGrassStageUI"
		elseif var_2_0 == ActivityConst.THEME.ACTIVITY_2_4 then
			return "UI/VersionUI/JapanRegionUI_2_4/JapanRegionHuntingUI/JapanRegionHtStageUI"
		else
			return "UI/VolumeIIIUI/VolumeCutgrassSelectUI"
		end
	end,
	GetRewardUIName = function(arg_3_0)
		local var_3_0 = ActivityTools.GetActivityTheme(arg_3_0)

		if var_3_0 == ActivityConst.THEME.TYR then
			return "UI/VersionUI/DarkFlameUI/DFCutGrassUI/DFCutGrassRewardUI"
		elseif var_3_0 == ActivityConst.THEME.ACTIVITY_2_4 then
			return "UI/VersionUI/JapanRegionUI_2_4/JapanRegionHuntingUI/JapanRegionHtRewardUI"
		else
			return "UI/VersionUI/HellaUI/Slayer/HellaSlayerRewardUI"
		end
	end,
	GetRewardItemClass = function(arg_4_0)
		local var_4_0 = ActivityTools.GetActivityTheme(arg_4_0)

		if var_4_0 == ActivityConst.THEME.TYR then
			return SlayerRewardItem_1_7
		elseif var_4_0 == ActivityConst.THEME.ACTIVITY_2_4 then
			return SlayerRewardItem_1_7
		else
			return HellaSlayerRewardItem
		end
	end
}
