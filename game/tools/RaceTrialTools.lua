local var_0_0 = {}

function var_0_0.InitConst(arg_1_0)
	var_0_0.mainActivityIdDic_ = var_0_0.mainActivityIdDic_ or {}

	local var_1_0 = ActivityData:GetActivityData(arg_1_0).subActivityIdList

	for iter_1_0, iter_1_1 in ipairs(var_1_0) do
		var_0_0.mainActivityIdDic_[iter_1_1] = arg_1_0
	end
end

function var_0_0.GetMainActivityID(arg_2_0)
	return var_0_0.mainActivityIdDic_[arg_2_0]
end

function var_0_0.GetMainUIName(arg_3_0)
	local var_3_0 = ActivityTools.GetActivityTheme(arg_3_0)

	if ActivityRaceTrialUICfg[var_3_0] then
		return ActivityRaceTrialUICfg[var_3_0].main_ui_path
	else
		Debug.Log(string.format("<color=ff0000>ActivityRaceTrialUICfg has no theme(%d)</color>", var_3_0))

		return "UI/VersionUI/OsirisUI/OsirisUITrialUI"
	end
end

function var_0_0.GetFirstRewardPopUIName(arg_4_0)
	local var_4_0 = ActivityTools.GetActivityTheme(arg_4_0)

	if ActivityRaceTrialUICfg[var_4_0] then
		return ActivityRaceTrialUICfg[var_4_0].first_reward_pop_ui_path
	else
		Debug.Log(string.format("<color=ff0000>ActivityRaceTrialUICfg has no theme(%d)</color>", var_4_0))

		return "UI/VolumeIIIDownUI/RaceTrial/VolumeIIIRaceTrialFirstRewardUI"
	end
end

function var_0_0.GetScoreRewardUIName(arg_5_0)
	local var_5_0 = ActivityTools.GetActivityTheme(arg_5_0)

	if ActivityRaceTrialUICfg[var_5_0] then
		return ActivityRaceTrialUICfg[var_5_0].score_reward_ui_path
	else
		Debug.Log(string.format("<color=ff0000>ActivityRaceTrialUICfg has no theme(%d)</color>", var_5_0))

		return "UI/VolumeIIIDownUI/RaceTrial/VolumeIIIRaceTrialScoreRewardUI"
	end
end

function var_0_0.GetReadyUIName(arg_6_0)
	local var_6_0 = ActivityTools.GetActivityTheme(arg_6_0)

	if ActivityRaceTrialUICfg[var_6_0] then
		return ActivityRaceTrialUICfg[var_6_0].ready_ui_path
	else
		Debug.Log(string.format("<color=ff0000>ActivityRaceTrialUICfg has no theme(%d)</color>", var_6_0))

		return "UI/VolumeIIIDownUI/RaceTrial/VolumeIIIDownRaceTrialSelectAffixUI"
	end
end

function var_0_0.GetBattleItemClass(arg_7_0)
	local var_7_0 = ActivityTools.GetActivityTheme(arg_7_0)

	if var_7_0 == ActivityConst.THEME.OSIRIS then
		return RaceTrialBattleItem
	elseif var_7_0 == ActivityConst.THEME.VOLUME_DOWN then
		return VolumeDownRaceTrialBattleItem
	elseif var_7_0 == ActivityConst.THEME.ACTIVITY_2_1 then
		return RaceTrialBattleItem_2_1
	elseif var_7_0 == ActivityConst.THEME.ACTIVITY_2_6 then
		return RaceTrialBattleItem_2_6
	elseif var_7_0 == ActivityConst.THEME.ACTIVITY_2_10 then
		return RaceTrialBattleItem_2_10
	else
		return RaceTrialBattleItem
	end
end

return var_0_0
