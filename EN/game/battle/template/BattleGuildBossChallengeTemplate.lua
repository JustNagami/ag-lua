local var_0_0 = class("BattleGuildBossChallengeTemplate", BattleBaseStageTemplate)

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.cfg = BattleClubBossCfg[arg_1_1]

	var_0_0.super.Ctor(arg_1_0, arg_1_1)
end

function var_0_0.Init(arg_2_0)
	arg_2_0:InitComboSkillID()
end

function var_0_0.GetStageId(arg_3_0)
	return arg_3_0.cfg.id
end

function var_0_0.GetType(arg_4_0)
	return BattleConst.STAGE_TYPE_NEW.GUILD_BOSS_CHALLENGE
end

function var_0_0.GetMap(arg_5_0)
	return arg_5_0.cfg.map, false
end

function var_0_0.GetHeroTeam(arg_6_0)
	return arg_6_0.heroDataList_, {}
end

function var_0_0.GetActivityID(arg_7_0)
	return BattleConst.STAGE_TYPE_NEW.GUILD_BOSS_CHALLENGE
end

function var_0_0.GetThreeStar(arg_8_0)
	return {}
end

function var_0_0.GetStageAffix(arg_9_0)
	local var_9_0 = {}
	local var_9_1 = {}
	local var_9_2 = {}
	local var_9_3 = GuildData:GetHaveGetBossBuffList() or {}

	for iter_9_0, iter_9_1 in pairs(var_9_3 or {}) do
		table.insert(var_9_0, iter_9_1[1])
		table.insert(var_9_1, iter_9_1[2])
		table.insert(var_9_2, iter_9_1[3])
	end

	return var_9_0, var_9_1, var_9_2
end

function var_0_0.GetAttributeFactor(arg_10_0)
	local var_10_0 = ClubBossCfg[GuildData:GetBossDifficulty()]

	if var_10_0.attribute_factor and var_10_0.attribute_factor[3] then
		local var_10_1 = var_10_0.attribute_factor[1] / 1000
		local var_10_2 = var_10_0.attribute_factor[2] / 1000
		local var_10_3 = var_10_0.attribute_factor[3] / 1000

		return Vector3.New(var_10_1, var_10_2, var_10_3)
	end

	return Vector3.New(1, 1, 1)
end

function var_0_0.GetAddUserExp(arg_11_0)
	return arg_11_0.cfg.user_exp or 0
end

function var_0_0.GetAddHeroExp(arg_12_0)
	return arg_12_0.cfg.hero_exp or 0
end

function var_0_0.GetAILevel(arg_13_0)
	return arg_13_0.cfg.ai_level
end

function var_0_0.GetDest(arg_14_0)
	return arg_14_0.dest_
end

function var_0_0.SetDest(arg_15_0, arg_15_1)
	arg_15_0.dest_ = arg_15_1
end

function var_0_0.GetEnemyLevel(arg_16_0)
	return ClubBossCfg[GuildData:GetBossDifficulty()].monster_level
end

function var_0_0.SetGuildBossTeam(arg_17_0, arg_17_1, arg_17_2)
	arg_17_0.heroDataList_ = arg_17_1
	arg_17_0.ownerList_ = arg_17_2
end

function var_0_0.GetAssistHeroOwnerList(arg_18_0)
	return arg_18_0.ownerList_
end

function var_0_0.SetChipDic(arg_19_0, arg_19_1)
	arg_19_0.chipOfHeroDic_ = arg_19_1
end

function var_0_0.GetChipOfHeroDic(arg_20_0)
	return arg_20_0.chipOfHeroDic_ or {}
end

return var_0_0
