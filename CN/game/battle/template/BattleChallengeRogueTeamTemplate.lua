local var_0_0 = class("BattleChallengeRogueTeamTemplate", BattleBaseStageTemplate)

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	var_0_0.super.Ctor(arg_1_0, arg_1_1)

	arg_1_0.id = arg_1_1
	arg_1_0.nodeID = arg_1_2
	arg_1_0.cfg = BattleStageTools.GetStageCfg(arg_1_0:GetType(), arg_1_1)
end

function var_0_0.Init(arg_2_0)
	arg_2_0:InitHeroList()
	arg_2_0:InitComboSkillID()
	arg_2_0:InitChipData()
end

function var_0_0.GetDest(arg_3_0)
	return arg_3_0.nodeID
end

function var_0_0.GetStageId(arg_4_0)
	return arg_4_0.id
end

function var_0_0.GetType(arg_5_0)
	return BattleConst.STAGE_TYPE_NEW.CHALLENGE_ROGUE_TEAM
end

function var_0_0.GetMap(arg_6_0)
	return arg_6_0.cfg.map, false
end

function var_0_0.GetAILevel(arg_7_0)
	return arg_7_0.cfg.ai_level
end

function var_0_0.GetEnemyLevel(arg_8_0)
	return arg_8_0.cfg.monster_level
end

function var_0_0.GetHeroTeam(arg_9_0)
	return arg_9_0.heroList_, arg_9_0.heroTrialList_
end

function var_0_0.GetActivityID(arg_10_0)
	return arg_10_0.activityID_
end

function var_0_0.UpdateRoleDatas(arg_11_0, arg_11_1)
	arg_11_0.serverTeamPlayer = arg_11_1
	arg_11_0.roleDataInLua = {}

	local var_11_0 = arg_11_0:GetSystemHeroTeam()

	for iter_11_0, iter_11_1 in ipairs(arg_11_1.heroList) do
		local var_11_1 = iter_11_1.trialID ~= 0 and iter_11_1.trialID or var_11_0[iter_11_0] or 0
		local var_11_2 = BattleController.GetInstance():SetChallengeRogueTeamHeroData(iter_11_1, var_11_1, arg_11_1.playerID, arg_11_1.level)

		table.insert(arg_11_0.roleDataInLua, var_11_2)
	end

	arg_11_0:SetMaxRaceData()
end

function var_0_0.GetStageAffix(arg_12_0)
	local var_12_0 = {}
	local var_12_1 = {}
	local var_12_2 = {}
	local var_12_3 = ChallengeRogueTeamData:TreasureGetList()

	for iter_12_0, iter_12_1 in pairs(var_12_3) do
		local var_12_4 = iter_12_1.id
		local var_12_5 = ChallengeRogueTeamTools.GetTreasureAffix(var_12_4, iter_12_1.rare)

		table.insert(var_12_0, var_12_5[1])
		table.insert(var_12_1, var_12_5[2])
		table.insert(var_12_2, var_12_5[3])
	end

	local var_12_6 = ChallengeRogueTeamData:SuitSkillGetID()

	if var_12_6 ~= 0 then
		local var_12_7 = ChallengeRogueTeamTools.GetItemIDByCampID(var_12_6)
		local var_12_8 = ChallengeRogueTeamTools.GetTreasureAffix(var_12_7)

		table.insert(var_12_0, var_12_8[1])
		table.insert(var_12_1, var_12_8[2])
		table.insert(var_12_2, var_12_8[3])
	end

	local var_12_9, var_12_10 = ChallengeRogueTeamData:GetTeamBuffAffixList(arg_12_0.roleDataInLua)

	for iter_12_2, iter_12_3 in pairs(var_12_9) do
		table.insert(var_12_0, iter_12_3)

		if ChallengeRogueTeamTools.HasTeamEffectMaxLevel() then
			table.insert(var_12_1, 3)
		else
			table.insert(var_12_1, var_12_10[iter_12_3])
		end

		table.insert(var_12_2, 3)
	end

	local var_12_11 = ChallengeRogueTeamData:EffectItemGetDataList(ChallengeRogueTeamConst.ITEM_TYPE.RELIC)

	for iter_12_4, iter_12_5 in ipairs(var_12_11) do
		local var_12_12 = ChallengeRogueTeamTools.GetRelicAffix(iter_12_5.id)

		for iter_12_6, iter_12_7 in ipairs(var_12_12) do
			table.insert(var_12_0, iter_12_7[1])
			table.insert(var_12_1, iter_12_7[2])
			table.insert(var_12_2, iter_12_7[3])
		end
	end

	local var_12_13 = ChallengeRogueTeamData:EffectItemGetDataList(ChallengeRogueTeamConst.ITEM_TYPE.SKILL)

	for iter_12_8, iter_12_9 in ipairs(var_12_13) do
		local var_12_14 = ChallengeRogueTeamTools.GetSkillTreeAffix(iter_12_9.id)

		for iter_12_10, iter_12_11 in ipairs(var_12_14) do
			table.insert(var_12_0, iter_12_11[1])
			table.insert(var_12_1, iter_12_11[2])
			table.insert(var_12_2, iter_12_11[3])
		end
	end

	local var_12_15 = ChallengeRogueTeamData:GetCacheTemplateID()
	local var_12_16 = ChallengeRogueTeamData:GetSelectDifficultyID(var_12_15)

	for iter_12_12, iter_12_13 in ipairs(RogueTeamDifficultyCfg[var_12_16].affix) do
		table.insert(var_12_0, iter_12_13[1])
		table.insert(var_12_1, iter_12_13[2])
		table.insert(var_12_2, iter_12_13[3])
	end

	local var_12_17 = ChallengeRogueTeamData:GetLastDifficultyID(var_12_15) or 1
	local var_12_18 = RogueTeamDifficultyCfg[var_12_17].params[1]
	local var_12_19 = ChallengeRogueTeamData:PathGetRogueTeamMapID(var_12_15)
	local var_12_20 = RogueTeamMapCfg[var_12_19].monster_level_coefficient[1]
	local var_12_21 = ChallengeRogueTeamTools.GetRougeTeamSettingList(ChallengeRogueTeamConst.SETTING_VALUE.ATTACK_AFIX, var_12_15)

	table.insert(var_12_0, var_12_21[1])
	table.insert(var_12_1, var_12_21[2] * var_12_20 * var_12_18 / 1000)
	table.insert(var_12_2, var_12_21[3])

	return var_12_0, var_12_1, var_12_2
end

function var_0_0.GetAttributeFactor(arg_13_0)
	local var_13_0 = ChallengeRogueTeamData:GetCacheTemplateID()
	local var_13_1 = ChallengeRogueTeamData:GetSelectDifficultyID(var_13_0)
	local var_13_2 = RogueTeamDifficultyCfg[var_13_1].params
	local var_13_3 = var_13_2[1] / 1000
	local var_13_4 = var_13_2[2] / 1000
	local var_13_5 = var_13_2[3] / 1000
	local var_13_6 = arg_13_0.cfg

	if var_13_6.attribute_factor and type(var_13_6.attribute_factor) == "table" and var_13_6.attribute_factor[3] then
		var_13_3 = var_13_6.attribute_factor[1] / 1000 * var_13_3
		var_13_4 = var_13_6.attribute_factor[2] / 1000 * var_13_4
		var_13_5 = var_13_6.attribute_factor[3] / 1000 * var_13_5
	end

	local var_13_7 = ChallengeRogueTeamData:GetActiveTemplateID()
	local var_13_8 = ChallengeRogueTeamData:PathGetRogueTeamMapID(var_13_7)
	local var_13_9 = RogueTeamMapCfg[var_13_8]

	if var_13_9.monster_level_coefficient and type(var_13_9.monster_level_coefficient) == "table" and var_13_9.monster_level_coefficient[3] then
		var_13_3 = var_13_9.monster_level_coefficient[1] / 1000 * var_13_3
		var_13_4 = var_13_9.monster_level_coefficient[2] / 1000 * var_13_4
		var_13_5 = var_13_9.monster_level_coefficient[3] / 1000 * var_13_5
	end

	return Vector3.New(var_13_3, var_13_4, var_13_5)
end

function var_0_0.GetBattleParams(arg_14_0)
	return ChallengeRogueTeamData:SuitSkillGetEnergyValue()
end

function var_0_0.GetRevive(arg_15_0)
	local var_15_0 = ChallengeRogueTeamData:AttributeGetValue(ChallengeRogueTeamConst.ATTRIBUTE_ENUM.REVIVE_CNT)
	local var_15_1 = ChallengeRogueTeamData:AttributeGetValue(ChallengeRogueTeamConst.ATTRIBUTE_ENUM.REVIVE_LIMIT_CNT)

	return true, 0, var_15_0, 1, var_15_1
end

function var_0_0.GetResurrectHP(arg_16_0)
	return 0
end

function var_0_0.GetResurrectImmediately(arg_17_0)
	return true
end

function var_0_0.InitComboSkillID(arg_18_0)
	reserveParams = ReserveTools.CheckReserveParams(arg_18_0:GetReserveParams())
	arg_18_0.comboSkillID_ = ReserveTools.GetReserveTemplateByReserveType(reserveParams.reserveType):GetComboSkillID(reserveParams, arg_18_0.heroList_)
end

return var_0_0
