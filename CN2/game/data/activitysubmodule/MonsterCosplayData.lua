local var_0_0 = singletonClass("MonsterCosplayData")
local var_0_1 = {}

function var_0_0.Init(arg_1_0)
	var_0_1.activityID = nil
	var_0_1.monsterData = {}
	var_0_1.viewCoreSkillTable = {}
	var_0_1.firstView = true

	for iter_1_0, iter_1_1 in ipairs(ActivityMonsterCosplayCfg.all) do
		var_0_1.monsterData[iter_1_1] = {
			finishedStage = {},
			enhancedSkill = {}
		}
		var_0_1.viewCoreSkillTable[iter_1_1] = {}
	end
end

function var_0_0.UpdateServerData(arg_2_0)
	var_0_1:UpdateServerData(arg_2_0)
end

function var_0_0.GetAffixSprite(arg_3_0)
	local var_3_0 = TalentTreeCfg[arg_3_0]
	local var_3_1 = PublicBuffCfg[var_3_0.affix_id]

	return getSpriteWithoutAtlas("TextureConfig/BuffIcon/" .. var_3_1.icon)
end

function var_0_0.UpdateMonsterSkill(arg_4_0, arg_4_1)
	var_0_1:UpdateMonsterSkill(arg_4_0, arg_4_1)
end

function var_0_0.SetFirstView()
	var_0_1.firstView = false
end

function var_0_0.GetDataByPara(arg_6_0, arg_6_1)
	return var_0_1[arg_6_1]
end

function var_0_0.UpdateMonsterCoreSkillData(arg_7_0, arg_7_1)
	var_0_1:UpdateMonsterCoreSkillData(arg_7_0, arg_7_1)
end

function var_0_0.CheckCanSkillEnhance(arg_8_0)
	for iter_8_0, iter_8_1 in pairs(var_0_1.monsterData) do
		if iter_8_1.skillEnhanceTimes > 0 then
			return true, iter_8_0
		end
	end

	return false
end

function var_0_1.UpdateMonsterCoreSkillData(arg_9_0, arg_9_1, arg_9_2)
	for iter_9_0, iter_9_1 in ipairs(arg_9_1.kernel_affix_list) do
		arg_9_0.viewCoreSkillTable[arg_9_2.monster_id][iter_9_1.affix_id] = iter_9_1.is_activate == 1
	end
end

function var_0_1.UpdateMonsterSkill(arg_10_0, arg_10_1, arg_10_2)
	local var_10_0 = arg_10_0.monsterData[arg_10_2.monster_id]

	for iter_10_0, iter_10_1 in ipairs(arg_10_1) do
		var_10_0.enhancedSkill[iter_10_1.affix_id] = {}
		var_10_0.enhancedSkill[iter_10_1.affix_id].affixID = iter_10_1.affix_id
		var_10_0.enhancedSkill[iter_10_1.affix_id].stageID = iter_10_1.stage_id
	end

	var_10_0.skillEnhanceTimes = var_10_0.skillEnhanceTimes - 1
end

function var_0_1.UpdateServerData(arg_11_0, arg_11_1)
	arg_11_0.activityID = arg_11_1.activity_id

	for iter_11_0, iter_11_1 in ipairs(arg_11_1.monster_list) do
		arg_11_0.monsterData[iter_11_1.id] = {}

		arg_11_0:DetailMonsterData(iter_11_1)
	end

	arg_11_0.mainActivity = ActivityCfg.get_id_list_by_sub_activity_list[arg_11_0.activityID][1]

	arg_11_0:UpdateOpenStage()
	arg_11_0:UpdateSkillToAffix()
end

function var_0_1.UpdateSkillToAffix(arg_12_0)
	arg_12_0.skillToAffixTable = {}

	for iter_12_0, iter_12_1 in pairs(TalentTreeCfg.get_id_list_by_activity_id[arg_12_0.mainActivity]) do
		local var_12_0 = TalentTreeCfg[iter_12_1]

		if arg_12_0.skillToAffixTable[var_12_0.stage] == nil then
			arg_12_0.skillToAffixTable[var_12_0.stage] = {}
		end

		table.insert(arg_12_0.skillToAffixTable[var_12_0.stage], var_12_0.id)
	end

	for iter_12_2, iter_12_3 in pairs(arg_12_0.skillToAffixTable) do
		table.sort(iter_12_3, function(arg_13_0, arg_13_1)
			return TalentTreeCfg[arg_13_0].type == 2
		end)
	end
end

function var_0_1.UpdateOpenStage(arg_14_0)
	arg_14_0.openStage = {}

	for iter_14_0, iter_14_1 in ipairs(ActivityMonsterCosplayCfg.all) do
		local var_14_0 = ActivityMonsterCosplayCfg[iter_14_1]

		for iter_14_2, iter_14_3 in ipairs(var_14_0.stage_list) do
			if arg_14_0.monsterData[var_14_0.id].finishedStage[iter_14_3] then
				iter_14_2 = math.min(iter_14_2 + 1, #var_14_0.stage_list)
				arg_14_0.openStage[var_14_0.id] = var_14_0.stage_list[iter_14_2]
			end
		end

		if arg_14_0.openStage[var_14_0.id] == nil then
			arg_14_0.openStage[var_14_0.id] = var_14_0.stage_list[1]
		end
	end
end

function var_0_1.DetailMonsterData(arg_15_0, arg_15_1)
	local var_15_0 = arg_15_0.monsterData[arg_15_1.id]

	var_15_0.id = arg_15_1.id
	var_15_0.enhancedSkill = {}
	var_15_0.skillEnhanceTimes = arg_15_1.skill_enhance_times

	for iter_15_0, iter_15_1 in ipairs(arg_15_1.affix_list) do
		var_15_0.enhancedSkill[iter_15_1.affix_id] = {
			affixID = iter_15_1.affix_id,
			stageID = iter_15_1.stage_id
		}
	end

	var_15_0.finishedStage = {}

	for iter_15_2, iter_15_3 in ipairs(arg_15_1.finished_stage) do
		var_15_0.finishedStage[iter_15_3] = true
	end

	var_15_0.finishedPointStage = {}

	for iter_15_4, iter_15_5 in ipairs(arg_15_1.finished_point_stage) do
		var_15_0.finishedPointStage[iter_15_5.id] = {}
		var_15_0.finishedPointStage[iter_15_5.id].id = iter_15_5.id
		var_15_0.finishedPointStage[iter_15_5.id].lastScore = iter_15_5.last_score
		var_15_0.finishedPointStage[iter_15_5.id].maxScore = iter_15_5.max_score
	end
end

return var_0_0
