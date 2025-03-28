local var_0_0 = singletonClass("MusicData")
local var_0_1 = {}
local var_0_2 = 0
local var_0_3 = 0
local var_0_4 = {}
local var_0_5 = 0
local var_0_6 = 0
local var_0_7
local var_0_8
local var_0_9
local var_0_10
local var_0_11
local var_0_12
local var_0_13
local var_0_14 = false
local var_0_15
local var_0_16 = {}
local var_0_17 = {}
local var_0_18 = {}
local var_0_19 = false
local var_0_20 = 0
local var_0_21 = false

function var_0_0.Init(arg_1_0)
	var_0_1 = {}
	var_0_2 = 0
	var_0_3 = 0
	var_0_4 = {}
	var_0_5 = 0
	var_0_6 = 0
	var_0_7 = nil
	var_0_8 = nil
	var_0_15 = nil
	var_0_9 = nil
	var_0_10 = nil
	var_0_11 = nil
	var_0_16 = {}
	var_0_17 = {}
	var_0_18 = {}
	var_0_20 = 0
	var_0_21 = false
end

function var_0_0.InitMusicData(arg_2_0, arg_2_1)
	local var_2_0 = arg_2_1.activity_id
	local var_2_1 = arg_2_1.challenge_info
	local var_2_2 = {}

	for iter_2_0, iter_2_1 in ipairs(var_2_1) do
		var_2_2[iter_2_1.difficulty] = {
			score = iter_2_1.score,
			reward_state = iter_2_1.reward_state,
			sign = iter_2_1.sign
		}
	end

	var_0_1[var_2_0] = var_2_2
end

function var_0_0.CheckIsHaveNewMusicData(arg_3_0, arg_3_1)
	if var_0_1[arg_3_1.activity_id] then
		return false
	end

	local var_3_0 = arg_3_1.challenge_info
	local var_3_1 = true

	for iter_3_0, iter_3_1 in ipairs(var_3_0) do
		if iter_3_1.sign == 1 then
			var_3_1 = false
		end
	end

	return var_3_1
end

function var_0_0.SetRewardState(arg_4_0, arg_4_1, arg_4_2)
	if var_0_1[arg_4_1] and var_0_1[arg_4_1][arg_4_2] then
		var_0_1[arg_4_1][arg_4_2].reward_state = 1
	end
end

function var_0_0.GetScore(arg_5_0, arg_5_1, arg_5_2)
	if var_0_1[arg_5_1] and var_0_1[arg_5_1][arg_5_2] then
		return var_0_1[arg_5_1][arg_5_2].score
	end

	return 0
end

function var_0_0.GetIsComplete(arg_6_0, arg_6_1, arg_6_2)
	if var_0_1[arg_6_1] and var_0_1[arg_6_1][arg_6_2] then
		return var_0_1[arg_6_1][arg_6_2].sign
	end

	return 0
end

function var_0_0.SetScore(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
	if not var_0_1[arg_7_1] then
		var_0_1[arg_7_1] = {}
	end

	if not var_0_1[arg_7_1][arg_7_2] then
		var_0_1[arg_7_1][arg_7_2] = {
			sign = 1,
			reward_state = 0,
			score = arg_7_3
		}
	end

	if var_0_1[arg_7_1] and var_0_1[arg_7_1][arg_7_2] then
		var_0_1[arg_7_1][arg_7_2].score = arg_7_3
		var_0_1[arg_7_1][arg_7_2].sign = 1
	end
end

function var_0_0.GetRewardState(arg_8_0, arg_8_1)
	local var_8_0 = ActivityMusicCfg[arg_8_1]
	local var_8_1 = var_8_0.activity_id
	local var_8_2 = var_8_0.difficult
	local var_8_3 = var_0_1[var_8_1] and var_0_1[var_8_1][var_8_2]
	local var_8_4 = var_8_3 and var_8_3.reward_state or 0

	if var_8_0.reward and #var_8_0.reward == 0 then
		return 0
	end

	if var_8_4 == 1 then
		return 2
	elseif var_8_0.target == 0 then
		for iter_8_0, iter_8_1 in pairs(var_0_1[var_8_1] or {}) do
			if iter_8_1.sign == 1 then
				return 1
			end
		end
	else
		local var_8_5 = arg_8_0:GetTargetAccuracy(var_8_0.target)
		local var_8_6 = ActivityMusicCfg.get_id_list_by_activity_id[var_8_1]

		for iter_8_2, iter_8_3 in ipairs(var_8_6) do
			local var_8_7 = ActivityMusicCfg[iter_8_3]

			if var_8_2 <= var_8_7.difficult and var_8_5 <= arg_8_0:GetScore(var_8_1, var_8_7.difficult) / var_8_7.total_score * 100 then
				return 1
			end
		end
	end

	return 0
end

function var_0_0.GetTargetAccuracy(arg_9_0, arg_9_1)
	return GameSetting.attach_music_grade.value[arg_9_1] or 0
end

function var_0_0.GetTargetAccuracyDes(arg_10_0, arg_10_1)
	return ({
		"S+",
		"S",
		"A",
		"B",
		"C",
		"F"
	})[arg_10_1] or ""
end

function var_0_0.ResetGameData(arg_11_0)
	var_0_3 = 0
	var_0_4 = {}
	var_0_5 = 0
	var_0_6 = 0
end

function var_0_0.ModifGameData(arg_12_0, arg_12_1)
	if MusicConst.MusicNodeHitRating.PerfectPlus == arg_12_1 then
		var_0_3 = var_0_3 + 101
		var_0_6 = var_0_6 + 1
	elseif MusicConst.MusicNodeHitRating.Perfect == arg_12_1 then
		var_0_3 = var_0_3 + 100
		var_0_6 = var_0_6 + 1
	elseif MusicConst.MusicNodeHitRating.Good == arg_12_1 then
		var_0_3 = var_0_3 + 70
		var_0_6 = var_0_6 + 1
	else
		var_0_6 = 0
	end

	if var_0_6 > var_0_5 then
		var_0_5 = var_0_6
	end

	var_0_4[arg_12_1] = var_0_4[arg_12_1] and var_0_4[arg_12_1] + 1 or 1
end

function var_0_0.GetGameScore(arg_13_0)
	return var_0_3
end

function var_0_0.SetLookBackState(arg_14_0, arg_14_1)
	var_0_19 = arg_14_1
end

function var_0_0.GetLookBackState(arg_15_0)
	return var_0_19
end

function var_0_0.SetGameId(arg_16_0, arg_16_1)
	var_0_2 = arg_16_1
end

function var_0_0.GetGameId(arg_17_0)
	return var_0_2
end

function var_0_0.GetGameRecord(arg_18_0, arg_18_1)
	return var_0_4[arg_18_1] or 0
end

function var_0_0.GetComboHit(arg_19_0)
	return var_0_6
end

function var_0_0.GetMaxComboHit(arg_20_0)
	return var_0_5
end

function var_0_0.SetPageActivityId(arg_21_0, arg_21_1)
	var_0_20 = arg_21_1
end

function var_0_0.GetPageActivityID(arg_22_0)
	return var_0_20
end

function var_0_0.GetSpeedValue(arg_23_0, arg_23_1)
	if arg_23_1 then
		if not var_0_8 then
			var_0_8 = getData("Music", "VerticalSpeed")
		end

		if type(var_0_8) ~= "number" then
			var_0_8 = 3
		else
			var_0_8 = math.max(var_0_8, 1)
			var_0_8 = math.min(var_0_8, 5)
		end

		return var_0_8
	else
		if not var_0_7 then
			var_0_7 = getData("Music", "Speed")
		end

		if type(var_0_7) ~= "number" then
			var_0_7 = 3
		else
			var_0_7 = math.max(var_0_7, 1)
			var_0_7 = math.min(var_0_7, 5)
		end

		return var_0_7
	end
end

function var_0_0.SetSpeedValue(arg_24_0, arg_24_1, arg_24_2)
	if arg_24_2 then
		saveData("Music", "VerticalSpeed", arg_24_1)

		var_0_8 = arg_24_1
	else
		saveData("Music", "Speed", arg_24_1)

		var_0_7 = arg_24_1
	end
end

function var_0_0.GetSpeedData(arg_25_0, arg_25_1)
	local var_25_0 = 5 - arg_25_0:GetSpeedValue(arg_25_1)
	local var_25_1 = 1500
	local var_25_2 = 350

	return var_25_2 + var_25_0 * (var_25_1 - var_25_2) / 4
end

function var_0_0.GetJudgeValue(arg_26_0)
	if not var_0_9 then
		var_0_9 = getData("Music", "Judge")
	end

	if type(var_0_9) ~= "number" then
		var_0_9 = 0
	else
		var_0_9 = math.max(var_0_9, -50)
		var_0_9 = math.min(var_0_9, 50)
	end

	return var_0_9
end

function var_0_0.SetJudgeValue(arg_27_0, arg_27_1)
	var_0_9 = arg_27_1

	saveData("Music", "Judge", arg_27_1)
end

function var_0_0.GetJudgeData(arg_28_0)
	local var_28_0 = arg_28_0:GetJudgeValue()
	local var_28_1 = math.abs(var_28_0) / 50 * 300

	if var_28_0 < 0 then
		return -1 * var_28_1
	end

	return var_28_1
end

function var_0_0.GetScreanValue(arg_29_0)
	if not var_0_10 then
		var_0_10 = getData("Music", "Screan")
	end

	if type(var_0_10) ~= "number" then
		var_0_10 = 0
	else
		var_0_10 = math.max(var_0_10, -50)
		var_0_10 = math.min(var_0_10, 50)
	end

	return var_0_10
end

function var_0_0.SetScreanValue(arg_30_0, arg_30_1)
	var_0_10 = arg_30_1

	saveData("Music", "Screan", var_0_10)
end

function var_0_0.GetScreanData(arg_31_0)
	local var_31_0 = arg_31_0:GetScreanValue()
	local var_31_1 = math.abs(var_31_0) / 50 * 300

	if var_31_0 < 0 then
		return -1 * var_31_1
	end

	return var_31_1
end

function var_0_0.GetVolumeValue(arg_32_0)
	if not var_0_11 then
		var_0_11 = getData("Music", "Volume")
	end

	if type(var_0_11) ~= "number" then
		var_0_11 = 50
	else
		var_0_11 = math.max(var_0_11, 0)
		var_0_11 = math.min(var_0_11, 100)
	end

	return var_0_11
end

function var_0_0.SetVolumeValue(arg_33_0, arg_33_1)
	var_0_11 = arg_33_1

	saveData("Music", "Volume", var_0_11)
end

function var_0_0.GetVolumeData(arg_34_0)
	local var_34_0 = arg_34_0:GetVolumeValue()

	return math.abs(var_34_0) / 100
end

function var_0_0.GetShowMovie(arg_35_0)
	if not var_0_12 then
		var_0_12 = getData("Music", "ShowMovie")
	end

	if type(var_0_12) ~= "number" then
		var_0_12 = 1
	end

	return var_0_12 ~= 0
end

function var_0_0.SetShoMovie(arg_36_0, arg_36_1)
	var_0_12 = arg_36_1 and 1 or 0

	saveData("Music", "ShowMovie", var_0_12)
end

function var_0_0.GetVerical(arg_37_0)
	if not var_0_14 then
		var_0_14 = getData("Music", "isVertical")
	end

	if type(var_0_14) ~= "number" then
		var_0_14 = 0
	end

	return var_0_14 ~= 0
end

function var_0_0.SetVerical(arg_38_0, arg_38_1)
	var_0_14 = arg_38_1 and 1 or 0

	saveData("Music", "isVertical", var_0_14)
end

function var_0_0.GetSpectralType(arg_39_0)
	if not var_0_15 then
		var_0_15 = getData("Music", "SpectralType")
	end

	if type(var_0_15) ~= "number" then
		var_0_15 = 0
	end

	return var_0_15
end

function var_0_0.SetSpectralType(arg_40_0, arg_40_1)
	var_0_15 = arg_40_1

	saveData("Music", "SpectralType", var_0_15)
end

function var_0_0.GetSpectralAndVercialSDKKey(arg_41_0)
	local var_41_0 = "[" .. arg_41_0:GetSpectralType() + 1 .. ","

	if arg_41_0:GetVerical() then
		var_41_0 = var_41_0 .. 1
	else
		var_41_0 = var_41_0 .. 2
	end

	return var_41_0 .. "]"
end

function var_0_0.GetSpectralSendData(arg_42_0)
	local var_42_0 = {}

	table.insert(var_42_0, arg_42_0:GetSpectralType() + 1)

	if arg_42_0:GetVerical() then
		table.insert(var_42_0, 1)
	else
		table.insert(var_42_0, 2)
	end

	return var_42_0
end

function var_0_0.GetPlayKeyEffectSound(arg_43_0)
	if not var_0_13 then
		var_0_13 = getData("Music", "PlayKeyEffectSound")
	end

	if type(var_0_13) ~= "number" then
		var_0_13 = 1
	end

	return var_0_13 ~= 0
end

function var_0_0.SetPlayKeyEffectSound(arg_44_0, arg_44_1)
	var_0_13 = arg_44_1 and 1 or 0

	saveData("Music", "PlayKeyEffectSound", var_0_13)
end

function var_0_0.GetDifficultyIndex(arg_45_0, arg_45_1)
	if var_0_16 == nil then
		var_0_16 = {}
	end

	if not var_0_16[arg_45_1] then
		var_0_16[arg_45_1] = getData("MusicSelectDiffcult", tostring(arg_45_1))
	end

	if type(var_0_16[arg_45_1]) ~= "number" then
		var_0_16[arg_45_1] = 0
	end

	return var_0_16[arg_45_1]
end

function var_0_0.SetDifficultIndex(arg_46_0, arg_46_1, arg_46_2)
	var_0_16[arg_46_1] = arg_46_2

	saveData("MusicSelectDiffcult", tostring(arg_46_1), arg_46_2)
end

function var_0_0.GetRead(arg_47_0, arg_47_1)
	return table.indexof(var_0_17, arg_47_1)
end

function var_0_0.SetRead(arg_48_0, arg_48_1)
	if not table.indexof(var_0_17, arg_48_1) then
		table.insert(var_0_17, arg_48_1)
	end
end

function var_0_0.SetSelectIndex(arg_49_0, arg_49_1)
	var_0_18[arg_49_0] = arg_49_1

	saveData("MusicSelect", tostring(arg_49_0), arg_49_1)
end

function var_0_0.GetSelectIndex(arg_50_0)
	if not var_0_18[arg_50_0] then
		var_0_18[arg_50_0] = getData("MusicSelect", tostring(arg_50_0))
	end

	if type(var_0_18[arg_50_0]) ~= "number" then
		var_0_18[arg_50_0] = 1
	end

	return var_0_18[arg_50_0]
end

function var_0_0.GetAisacSet(arg_51_0, arg_51_1)
	local var_51_0 = {}
	local var_51_1 = MusicRecordCfg[arg_51_1]

	if var_51_1 and var_51_1.initAISAC ~= "" then
		for iter_51_0, iter_51_1 in ipairs(var_51_1.initAISAC) do
			var_51_0[iter_51_1[1]] = iter_51_1[2]
		end
	end

	return var_51_0
end

function var_0_0.GetNowMusicUINameList(arg_52_0)
	return arg_52_0:GetMusicUINameList(var_0_20)
end

function var_0_0.GetMusicUINameList(arg_53_0, arg_53_1)
	local var_53_0 = arg_53_0:GetMusicViewType(arg_53_1)

	return MusicConst.MusicViewUIName[var_53_0]
end

function var_0_0.GetMusicViewPathList(arg_54_0, arg_54_1, arg_54_2)
	local var_54_0 = arg_54_0:GetMusicViewType(arg_54_1, arg_54_2)

	return MusicConst.MusicViewRoutesName[var_54_0]
end

function var_0_0.GetMusicViewType(arg_55_0, arg_55_1, arg_55_2)
	local var_55_0

	if arg_55_0:GetLookBackState() and not arg_55_2 then
		var_55_0 = ActivityTools.GetActivityTheme(var_0_20)
	else
		var_55_0 = ActivityTools.GetActivityTheme(arg_55_1)
	end

	if var_55_0 == ActivityConst.THEME.ACTIVITY_2_0 then
		return MusicConst.MusicViewType.Enternal
	elseif var_55_0 == ActivityConst.THEME.VOLUME_DOWN then
		return MusicConst.MusicViewType.Volume
	elseif var_55_0 == ActivityConst.THEME.ACTIVITY_2_10 then
		return MusicConst.MusicViewType.V210
	else
		return MusicConst.MusicViewType.Resident
	end
end

function var_0_0.GetMusicdifficultLab(arg_56_0, arg_56_1)
	if arg_56_1 == 1 then
		return GetTips("ACTIVITY_MUSIC_LEVEL_1")
	elseif arg_56_1 == 2 then
		return GetTips("ACTIVITY_MUSIC_LEVEL_2")
	elseif arg_56_1 == 9 then
		return GetTips("ACTIVITY_MUSIC_LEVEL_3")
	else
		return GetTips("ACTIVITY_MUSIC_LEVEL_4")
	end
end

function var_0_0.SetSpecialEffectState(arg_57_0, arg_57_1)
	var_0_21 = arg_57_1
end

function var_0_0.GetSpecialEffectState(arg_58_0)
	return var_0_21
end

return var_0_0
