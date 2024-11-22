local var_0_0 = {
	GetEnterUI = function(arg_1_0)
		local var_1_0 = ActivityTools.GetActivityTheme(arg_1_0)

		if var_1_0 == ActivityConst.THEME.ACTIVITY_3_0 then
			return "Widget/Version/NorseUI_3_0/NorseUI_3_0_HeroEnhanceUI/NorseUI_3_0_HeroEnhanceMainUI"
		elseif var_1_0 == ActivityConst.THEME.ACTIVITY_3_5 then
			return "Widget/Version/SummerUI_3_5/SummerUI_3_5_HeroEnhanceUI/SummerUI_3_5_HeroEnhanceMainUI"
		end

		Debug.LogError("HeroEnhance: activity " .. arg_1_0 .. " has no EnterUI")

		return "Widget/Version/NorseUI_3_0/NorseUI_3_0_HeroEnhanceUI/NorseUI_3_0_HeroEnhanceMainUI"
	end,
	GetHeroUIName = function(arg_2_0)
		local var_2_0 = ActivityTools.GetActivityTheme(arg_2_0)

		if var_2_0 == ActivityConst.THEME.ACTIVITY_3_0 then
			return "Widget/Version/NorseUI_3_0/NorseUI_3_0_HeroEnhanceUI/NorseUI_3_0_HeroEnhanceHeroUI"
		elseif var_2_0 == ActivityConst.THEME.ACTIVITY_3_5 then
			return "Widget/Version/SummerUI_3_5/SummerUI_3_5_HeroEnhanceUI/SummerUI_3_5_HeroEnhanceHeroUI"
		end

		Debug.LogError("HeroEnhance: activity " .. arg_2_0 .. " has no HeroUI")

		return "Widget/Version/NorseUI_3_0/NorseUI_3_0_HeroEnhanceUI/NorseUI_3_0_HeroEnhanceHeroUI"
	end,
	GetStageUIName = function(arg_3_0)
		if ActivityTools.GetActivityTheme(arg_3_0) == ActivityConst.THEME.ACTIVITY_3_0 then
			-- block empty
		end

		return "Widget/System/Operation/OperationStageUI"
	end,
	GetStageInfoUIName = function(arg_4_0)
		if ActivityTools.GetActivityTheme(arg_4_0) == ActivityConst.THEME.ACTIVITY_3_0 then
			-- block empty
		end

		return "Widget/System/Operation/ChapterSectionInfoUI"
	end,
	GetStageAttachUIName = function(arg_5_0)
		local var_5_0 = ActivityTools.GetActivityTheme(arg_5_0)

		if var_5_0 == ActivityConst.THEME.ACTIVITY_3_0 then
			return "Widget/Version/NorseUI_3_0/NorseUI_3_0_HeroEnhanceUI/NorseUI_3_0_HeroEnhanceStageAttachUI"
		elseif var_5_0 == ActivityConst.THEME.ACTIVITY_3_5 then
			return "Widget/Version/SummerUI_3_5/SummerUI_3_5_HeroEnhanceUI/SummerUI_3_5_HeroEnhanceStageAttachUI"
		end

		Debug.LogError("HeroEnhance: activity " .. arg_5_0 .. " has no StageAttachUI")

		return "Widget/Version/NorseUI_3_0/NorseUI_3_0_HeroEnhanceUI/NorseUI_3_0_HeroEnhanceStageAttachUI"
	end,
	GetBattleResultContentUIName = function(arg_6_0)
		local var_6_0 = ActivityTools.GetActivityTheme(arg_6_0)

		if var_6_0 == ActivityConst.THEME.ACTIVITY_3_0 then
			return "Widget/Version/NorseUI_3_0/NorseUI_3_0_HeroEnhanceUI/NorseUI_3_0_HeroEnhanceBattleResultContent"
		elseif var_6_0 == ActivityConst.THEME.ACTIVITY_3_5 then
			return "Widget/Version/SummerUI_3_5/SummerUI_3_5_HeroEnhanceUI/SummerUI_3_5_HeroEnhanceBattleResultContent"
		end

		Debug.LogError("HeroEnhance: activity " .. arg_6_0 .. " has no StageAttachUI")

		return "Widget/Version/NorseUI_3_0/NorseUI_3_0_HeroEnhanceUI/NorseUI_3_0_HeroEnhanceBattleResultContent"
	end
}

local function var_0_1()
	return ActivityHeroEnhanceCfg[ActivityHeroEnhanceCfg.all[1]]
end

local var_0_2 = {}

local function var_0_3(arg_8_0, arg_8_1, arg_8_2)
	local var_8_0 = var_0_2[arg_8_0]

	if var_8_0 == nil then
		return nil
	end

	local var_8_1 = var_8_0[arg_8_1]

	if var_8_1 == nil then
		return nil
	end

	return var_8_1[arg_8_2]
end

local function var_0_4(arg_9_0, arg_9_1, arg_9_2, arg_9_3)
	local var_9_0 = var_0_2[arg_9_0]

	if var_9_0 == nil then
		var_9_0 = {}
		var_0_2[arg_9_0] = var_9_0
	end

	local var_9_1 = var_9_0[arg_9_1]

	if var_9_1 == nil then
		var_9_1 = {}
		var_9_0[arg_9_1] = var_9_1
	end

	var_9_1[arg_9_2] = arg_9_3
end

function var_0_0.GetAllRewardList(arg_10_0)
	local var_10_0 = ActivityHeroEnhanceCfg.get_id_list_by_activity_id[arg_10_0]

	if var_10_0 == nil then
		Debug.LogError("hero enhance config empty for activity: " .. arg_10_0)

		return {}
	end

	local var_10_1 = {}

	for iter_10_0, iter_10_1 in ipairs(var_10_0) do
		local var_10_2 = ActivityHeroEnhanceCfg[iter_10_1]

		for iter_10_2, iter_10_3 in ipairs(var_10_2.stage_list) do
			local var_10_3 = var_0_0.GetStageRewardList(arg_10_0, iter_10_3, true)

			var_10_1 = mergeRewardList(var_10_1, var_10_3)
		end
	end

	return var_10_1
end

function var_0_0.GetStageRewardList(arg_11_0, arg_11_1, arg_11_2)
	local var_11_0 = BattleHeroEnhanceCfg[arg_11_1]

	if var_11_0 == nil then
		Debug.LogError("battle hero enhance config empty for activity(" .. arg_11_0 .. "), stageId(" .. arg_11_1 .. ")")

		return {}
	end

	if arg_11_2 == nil then
		arg_11_2 = not ActivityHeroEnhanceData:IsStageClear(arg_11_0, arg_11_1)
	end

	return (getRewardFromDropCfg(var_11_0.drop_lib_id, arg_11_2))
end

function var_0_0.GetCfgIdList(arg_12_0)
	local var_12_0 = ActivityHeroEnhanceCfg.get_id_list_by_activity_id[arg_12_0]

	if var_12_0 == nil then
		return {
			var_0_1().id
		}
	end

	return var_12_0
end

local var_0_5 = {}

function var_0_0.GetCfgTalentDict(arg_13_0)
	local var_13_0 = var_0_5[arg_13_0.id]

	if var_13_0 then
		return var_13_0
	end

	local var_13_1 = {}

	for iter_13_0, iter_13_1 in ipairs(arg_13_0.talent_list) do
		local var_13_2 = TalentTreeCfg[iter_13_1]

		var_13_1[var_13_2.stage] = var_13_1[var_13_2.stage] or {}

		table.insert(var_13_1[var_13_2.stage], iter_13_1)
	end

	var_0_5[arg_13_0.id] = var_13_1

	return var_13_1
end

function var_0_0.GetCfgTalentListByStage(arg_14_0, arg_14_1)
	return var_0_0.GetCfgTalentDict(arg_14_0)[arg_14_1]
end

function var_0_0.GetCfgActivatedTalentList(arg_15_0)
	local var_15_0 = {}

	for iter_15_0, iter_15_1 in ipairs(arg_15_0.talent_list) do
		local var_15_1 = TalentTreeCfg[iter_15_1]

		if ActivityHeroEnhanceData:IsTalentActivated(arg_15_0.activity_id, iter_15_1) then
			table.insert(var_15_0, iter_15_1)
		end
	end

	return var_15_0
end

function var_0_0.GetCfgActivatedTalentDict(arg_16_0)
	local var_16_0 = {}

	for iter_16_0, iter_16_1 in ipairs(arg_16_0.talent_list) do
		local var_16_1 = TalentTreeCfg[iter_16_1]

		if ActivityHeroEnhanceData:IsTalentActivated(arg_16_0.activity_id, iter_16_1) then
			var_16_0[var_16_1.stage] = iter_16_1
		end
	end

	return var_16_0
end

function var_0_0.GetTutorialCfg(arg_17_0)
	local var_17_0 = ActivityHeroEnhanceCfg.get_id_list_by_activity_id[arg_17_0]

	if var_17_0 == nil then
		return var_0_1()
	end

	return ActivityHeroEnhanceCfg[var_17_0[1]]
end

function var_0_0.GetTutorialHeroId(arg_18_0)
	return var_0_0.GetTutorialCfg(arg_18_0).hero_id
end

function var_0_0.GetCfgByTalentId(arg_19_0, arg_19_1)
	local var_19_0 = var_0_3(arg_19_0, "GetCfgByTalentId", arg_19_1)

	if var_19_0 then
		return var_19_0
	end

	local var_19_1 = ActivityHeroEnhanceCfg.get_id_list_by_activity_id[arg_19_0]

	if var_19_1 == nil then
		return var_0_1()
	end

	for iter_19_0, iter_19_1 in ipairs(var_19_1) do
		local var_19_2 = ActivityHeroEnhanceCfg[iter_19_1]

		if table.indexof(var_19_2.talent_list, arg_19_1) then
			var_0_4(arg_19_0, "GetCfgByTalentId", arg_19_1, var_19_2)

			return var_19_2
		end
	end

	return var_0_1()
end

function var_0_0.IsCfgHeroPass(arg_20_0)
	for iter_20_0, iter_20_1 in ipairs(arg_20_0.stage_list) do
		if not ActivityHeroEnhanceData:IsStageClear(arg_20_0.activity_id, iter_20_1) then
			return false
		end
	end

	return true
end

function var_0_0.IsCfgHeroLock(arg_21_0)
	local var_21_0 = ActivityHeroEnhanceData:GetDay(arg_21_0.activity_id)

	if var_21_0 < arg_21_0.start_day then
		return true, {
			isBeforeStartDay = true,
			curDay = var_21_0,
			startDay = arg_21_0.start_day
		}
	end

	local var_21_1 = var_0_0.GetTutorialCfg(arg_21_0.activity_id)

	if var_21_1.id == arg_21_0.id then
		return false
	end

	if not var_0_0.IsCfgHeroPass(var_21_1) then
		return true, {
			isTutorialNotPass = true
		}
	end

	return false
end

local function var_0_6(arg_22_0, arg_22_1, arg_22_2)
	if arg_22_2 == nil then
		arg_22_2 = TalentTreeCfg[arg_22_1].stage - 1
	end

	if arg_22_2 <= 0 then
		return false
	end

	local var_22_0 = var_0_0.GetCfgByTalentId(arg_22_0, arg_22_1)
	local var_22_1 = var_0_0.GetCfgTalentListByStage(var_22_0, arg_22_2)

	if var_0_0.GetTalentListActivatedIdx(arg_22_0, var_22_1) < 0 then
		return true
	end

	return false
end

function var_0_0.GetTalentLockConditionId(arg_23_0, arg_23_1, arg_23_2)
	local var_23_0 = TalentTreeCfg[arg_23_1]

	for iter_23_0, iter_23_1 in ipairs(var_23_0.unlock_condition) do
		local var_23_1 = ConditionCfg[iter_23_1]
		local var_23_2 = var_23_1.type

		if var_23_2 == 11401 then
			local var_23_3 = var_23_1.params[1]

			if not ActivityHeroEnhanceData:IsStageClear(arg_23_0, var_23_3) then
				return iter_23_1
			end
		elseif var_23_2 == 11400 and not arg_23_2 then
			local var_23_4 = var_23_1.params[1]

			if var_0_6(arg_23_0, arg_23_1, var_23_4) then
				return iter_23_1
			end
		end
	end

	return nil
end

function var_0_0.IsTalentLock(arg_24_0, arg_24_1, arg_24_2)
	if var_0_0.GetTalentLockConditionId(arg_24_0, arg_24_1, arg_24_2) ~= nil then
		return true
	end

	local var_24_0 = TalentTreeCfg[arg_24_1]

	if not arg_24_2 and var_0_6(arg_24_0, arg_24_1, var_24_0.stage - 1) then
		return true
	end

	return false
end

function var_0_0.IsCfgTalentStageLock(arg_25_0, arg_25_1, arg_25_2)
	local var_25_0 = var_0_0.GetCfgTalentListByStage(arg_25_0, arg_25_1)

	for iter_25_0, iter_25_1 in ipairs(var_25_0) do
		if not var_0_0.IsTalentLock(arg_25_0.activity_id, iter_25_1, arg_25_2) then
			return false
		end
	end

	return true
end

function var_0_0.IsCfgTalentStageFirstCanAdd(arg_26_0, arg_26_1)
	local var_26_0 = ActivityHeroEnhanceTools.GetCfgActivatedTalentDict(arg_26_0)

	if var_26_0[arg_26_1] then
		return false
	end

	local var_26_1 = var_0_0.IsCfgTalentStageLock(arg_26_0, arg_26_1, true)

	if arg_26_1 == 1 then
		return not var_26_1
	end

	return not var_26_1 and var_26_0[arg_26_1 - 1] ~= nil
end

function var_0_0.GetTalentListActivatedIdx(arg_27_0, arg_27_1)
	if arg_27_1 == nil then
		return -1
	end

	for iter_27_0, iter_27_1 in ipairs(arg_27_1) do
		if ActivityHeroEnhanceData:IsTalentActivated(arg_27_0, iter_27_1) then
			return iter_27_0
		end
	end

	return -1
end

function var_0_0.IsCfgStageUnlock(arg_28_0, arg_28_1)
	local var_28_0

	for iter_28_0, iter_28_1 in ipairs(arg_28_0.stage_list) do
		local var_28_1 = BattleHeroEnhanceCfg[iter_28_1]

		if table.indexof(var_28_1.next_unlock_id_list, arg_28_1) then
			if ActivityHeroEnhanceData:IsStageClear(arg_28_0.activity_id, iter_28_1) then
				return true
			end

			var_28_0 = iter_28_1
		end
	end

	if var_28_0 == nil then
		return true
	end

	return false
end

function var_0_0.GetCfgTalentMaxStage(arg_29_0)
	return 4
end

return var_0_0
