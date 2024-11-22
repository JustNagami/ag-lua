local var_0_0 = {
	GetEnterUI = function(arg_1_0)
		if ActivityTools.GetActivityTheme(arg_1_0) == ActivityConst.THEME.ACTIVITY_3_0 then
			return "Widget/Version/NorseUI_3_0/NorseUI_3_0_HeroEnhanceUI/NorseUI_3_0_HeroEnhanceMainUI"
		end

		Debug.LogError("HeroEnhance: activity " .. arg_1_0 .. " has no EnterUI")

		return "Widget/Version/NorseUI_3_0/NorseUI_3_0_HeroEnhanceUI/NorseUI_3_0_HeroEnhanceMainUI"
	end,
	GetHeroUIName = function(arg_2_0)
		if ActivityTools.GetActivityTheme(arg_2_0) == ActivityConst.THEME.ACTIVITY_3_0 then
			return "Widget/Version/NorseUI_3_0/NorseUI_3_0_HeroEnhanceUI/NorseUI_3_0_HeroEnhanceHeroUI"
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
		if ActivityTools.GetActivityTheme(arg_5_0) == ActivityConst.THEME.ACTIVITY_3_0 then
			return "Widget/Version/NorseUI_3_0/NorseUI_3_0_HeroEnhanceUI/NorseUI_3_0_HeroEnhanceStageAttachUI"
		end

		Debug.LogError("HeroEnhance: activity " .. arg_5_0 .. " has no StageAttachUI")

		return "Widget/Version/NorseUI_3_0/NorseUI_3_0_HeroEnhanceUI/NorseUI_3_0_HeroEnhanceStageAttachUI"
	end
}

local function var_0_1()
	return ActivityHeroEnhanceCfg[ActivityHeroEnhanceCfg.all[1]]
end

local var_0_2 = {}

local function var_0_3(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = var_0_2[arg_7_0]

	if var_7_0 == nil then
		return nil
	end

	local var_7_1 = var_7_0[arg_7_1]

	if var_7_1 == nil then
		return nil
	end

	return var_7_1[arg_7_2]
end

local function var_0_4(arg_8_0, arg_8_1, arg_8_2, arg_8_3)
	local var_8_0 = var_0_2[arg_8_0]

	if var_8_0 == nil then
		var_8_0 = {}
		var_0_2[arg_8_0] = var_8_0
	end

	local var_8_1 = var_8_0[arg_8_1]

	if var_8_1 == nil then
		var_8_1 = {}
		var_8_0[arg_8_1] = var_8_1
	end

	var_8_1[arg_8_2] = arg_8_3
end

function var_0_0.GetAllRewardList(arg_9_0)
	local var_9_0 = ActivityHeroEnhanceCfg.get_id_list_by_activity_id[arg_9_0]

	if var_9_0 == nil then
		Debug.LogError("hero enhance config empty for activity: " .. arg_9_0)

		return {}
	end

	local var_9_1 = {}

	for iter_9_0, iter_9_1 in ipairs(var_9_0) do
		local var_9_2 = ActivityHeroEnhanceCfg[iter_9_1]

		for iter_9_2, iter_9_3 in ipairs(var_9_2.stage_list) do
			local var_9_3 = var_0_0.GetStageRewardList(arg_9_0, iter_9_3, true)

			var_9_1 = mergeRewardList(var_9_1, var_9_3)
		end
	end

	return var_9_1
end

function var_0_0.GetStageRewardList(arg_10_0, arg_10_1, arg_10_2)
	local var_10_0 = BattleHeroEnhanceCfg[arg_10_1]

	if var_10_0 == nil then
		Debug.LogError("battle hero enhance config empty for activity(" .. arg_10_0 .. "), stageId(" .. arg_10_1 .. ")")

		return {}
	end

	if arg_10_2 == nil then
		arg_10_2 = not ActivityHeroEnhanceData:IsStageClear(arg_10_0, arg_10_1)
	end

	return (getRewardFromDropCfg(var_10_0.drop_lib_id, arg_10_2))
end

function var_0_0.GetCfgIdList(arg_11_0)
	local var_11_0 = ActivityHeroEnhanceCfg.get_id_list_by_activity_id[arg_11_0]

	if var_11_0 == nil then
		return {
			var_0_1().id
		}
	end

	return var_11_0
end

local var_0_5 = {}

function var_0_0.GetCfgTalentDict(arg_12_0)
	local var_12_0 = var_0_5[arg_12_0.id]

	if var_12_0 then
		return var_12_0
	end

	local var_12_1 = {}

	for iter_12_0, iter_12_1 in ipairs(arg_12_0.talent_list) do
		local var_12_2 = TalentTreeCfg[iter_12_1]

		var_12_1[var_12_2.stage] = var_12_1[var_12_2.stage] or {}

		table.insert(var_12_1[var_12_2.stage], iter_12_1)
	end

	var_0_5[arg_12_0.id] = var_12_1

	return var_12_1
end

function var_0_0.GetCfgTalentListByStage(arg_13_0, arg_13_1)
	return var_0_0.GetCfgTalentDict(arg_13_0)[arg_13_1]
end

function var_0_0.GetCfgActivatedTalentList(arg_14_0)
	local var_14_0 = {}

	for iter_14_0, iter_14_1 in ipairs(arg_14_0.talent_list) do
		local var_14_1 = TalentTreeCfg[iter_14_1]

		if ActivityHeroEnhanceData:IsTalentActivated(arg_14_0.activity_id, iter_14_1) then
			table.insert(var_14_0, iter_14_1)
		end
	end

	return var_14_0
end

function var_0_0.GetCfgActivatedTalentDict(arg_15_0)
	local var_15_0 = {}

	for iter_15_0, iter_15_1 in ipairs(arg_15_0.talent_list) do
		local var_15_1 = TalentTreeCfg[iter_15_1]

		if ActivityHeroEnhanceData:IsTalentActivated(arg_15_0.activity_id, iter_15_1) then
			var_15_0[var_15_1.stage] = iter_15_1
		end
	end

	return var_15_0
end

function var_0_0.GetTutorialCfg(arg_16_0)
	local var_16_0 = ActivityHeroEnhanceCfg.get_id_list_by_activity_id[arg_16_0]

	if var_16_0 == nil then
		return var_0_1()
	end

	return ActivityHeroEnhanceCfg[var_16_0[1]]
end

function var_0_0.GetTutorialHeroId(arg_17_0)
	return var_0_0.GetTutorialCfg(arg_17_0).hero_id
end

function var_0_0.GetCfgByTalentId(arg_18_0, arg_18_1)
	local var_18_0 = var_0_3(arg_18_0, "GetCfgByTalentId", arg_18_1)

	if var_18_0 then
		return var_18_0
	end

	local var_18_1 = ActivityHeroEnhanceCfg.get_id_list_by_activity_id[arg_18_0]

	if var_18_1 == nil then
		return var_0_1()
	end

	for iter_18_0, iter_18_1 in ipairs(var_18_1) do
		local var_18_2 = ActivityHeroEnhanceCfg[iter_18_1]

		if table.indexof(var_18_2.talent_list, arg_18_1) then
			var_0_4(arg_18_0, "GetCfgByTalentId", arg_18_1, var_18_2)

			return var_18_2
		end
	end

	return var_0_1()
end

function var_0_0.IsCfgHeroPass(arg_19_0)
	for iter_19_0, iter_19_1 in ipairs(arg_19_0.stage_list) do
		if not ActivityHeroEnhanceData:IsStageClear(arg_19_0.activity_id, iter_19_1) then
			return false
		end
	end

	return true
end

function var_0_0.IsCfgHeroLock(arg_20_0)
	local var_20_0 = ActivityHeroEnhanceData:GetDay(arg_20_0.activity_id)

	if var_20_0 < arg_20_0.start_day then
		return true, {
			isBeforeStartDay = true,
			curDay = var_20_0,
			startDay = arg_20_0.start_day
		}
	end

	local var_20_1 = var_0_0.GetTutorialCfg(arg_20_0.activity_id)

	if var_20_1.id == arg_20_0.id then
		return false
	end

	if not var_0_0.IsCfgHeroPass(var_20_1) then
		return true, {
			isTutorialNotPass = true
		}
	end

	return false
end

local function var_0_6(arg_21_0, arg_21_1, arg_21_2)
	if arg_21_2 == nil then
		arg_21_2 = TalentTreeCfg[arg_21_1].stage - 1
	end

	if arg_21_2 <= 0 then
		return false
	end

	local var_21_0 = var_0_0.GetCfgByTalentId(arg_21_0, arg_21_1)
	local var_21_1 = var_0_0.GetCfgTalentListByStage(var_21_0, arg_21_2)

	if var_0_0.GetTalentListActivatedIdx(arg_21_0, var_21_1) < 0 then
		return true
	end

	return false
end

function var_0_0.GetTalentLockConditionId(arg_22_0, arg_22_1, arg_22_2)
	local var_22_0 = TalentTreeCfg[arg_22_1]

	for iter_22_0, iter_22_1 in ipairs(var_22_0.unlock_condition) do
		local var_22_1 = ConditionCfg[iter_22_1]
		local var_22_2 = var_22_1.type

		if var_22_2 == 11401 then
			local var_22_3 = var_22_1.params[1]

			if not ActivityHeroEnhanceData:IsStageClear(arg_22_0, var_22_3) then
				return iter_22_1
			end
		elseif var_22_2 == 11400 and not arg_22_2 then
			local var_22_4 = var_22_1.params[1]

			if var_0_6(arg_22_0, arg_22_1, var_22_4) then
				return iter_22_1
			end
		end
	end

	return nil
end

function var_0_0.IsTalentLock(arg_23_0, arg_23_1, arg_23_2)
	if var_0_0.GetTalentLockConditionId(arg_23_0, arg_23_1, arg_23_2) ~= nil then
		return true
	end

	local var_23_0 = TalentTreeCfg[arg_23_1]

	if not arg_23_2 and var_0_6(arg_23_0, arg_23_1, var_23_0.stage - 1) then
		return true
	end

	return false
end

function var_0_0.IsCfgTalentStageLock(arg_24_0, arg_24_1, arg_24_2)
	local var_24_0 = var_0_0.GetCfgTalentListByStage(arg_24_0, arg_24_1)

	for iter_24_0, iter_24_1 in ipairs(var_24_0) do
		if not var_0_0.IsTalentLock(arg_24_0.activity_id, iter_24_1, arg_24_2) then
			return false
		end
	end

	return true
end

function var_0_0.IsCfgTalentStageFirstCanAdd(arg_25_0, arg_25_1)
	local var_25_0 = ActivityHeroEnhanceTools.GetCfgActivatedTalentDict(arg_25_0)

	if var_25_0[arg_25_1] then
		return false
	end

	local var_25_1 = var_0_0.IsCfgTalentStageLock(arg_25_0, arg_25_1, true)

	if arg_25_1 == 1 then
		return not var_25_1
	end

	return not var_25_1 and var_25_0[arg_25_1 - 1] ~= nil
end

function var_0_0.GetTalentListActivatedIdx(arg_26_0, arg_26_1)
	if arg_26_1 == nil then
		return -1
	end

	for iter_26_0, iter_26_1 in ipairs(arg_26_1) do
		if ActivityHeroEnhanceData:IsTalentActivated(arg_26_0, iter_26_1) then
			return iter_26_0
		end
	end

	return -1
end

function var_0_0.IsCfgStageUnlock(arg_27_0, arg_27_1)
	local var_27_0

	for iter_27_0, iter_27_1 in ipairs(arg_27_0.stage_list) do
		local var_27_1 = BattleHeroEnhanceCfg[iter_27_1]

		if table.indexof(var_27_1.next_unlock_id_list, arg_27_1) then
			if ActivityHeroEnhanceData:IsStageClear(arg_27_0.activity_id, iter_27_1) then
				return true
			end

			var_27_0 = iter_27_1
		end
	end

	if var_27_0 == nil then
		return true
	end

	return false
end

function var_0_0.GetCfgTalentMaxStage(arg_28_0)
	return 4
end

return var_0_0
