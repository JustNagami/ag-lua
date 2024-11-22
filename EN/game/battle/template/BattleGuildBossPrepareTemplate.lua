local var_0_0 = class("BattleGuildBossPrepareTemplate", BattleBaseStageTemplate)

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.cfg = BattleClubBossPreposeCfg[arg_1_1]

	var_0_0.super.Ctor(arg_1_0, arg_1_1)
end

function var_0_0.Init(arg_2_0)
	arg_2_0:InitComboSkillID()
end

function var_0_0.GetDest(arg_3_0)
	return arg_3_0.dest_
end

function var_0_0.SetDest(arg_4_0, arg_4_1)
	arg_4_0.dest_ = arg_4_1
end

function var_0_0.GetStageId(arg_5_0)
	return arg_5_0.cfg.id
end

function var_0_0.GetType(arg_6_0)
	return BattleConst.STAGE_TYPE_NEW.GUILD_BOSS_PREPARE
end

function var_0_0.GetMap(arg_7_0)
	return arg_7_0.cfg.map, false
end

function var_0_0.GetHeroTeam(arg_8_0)
	return arg_8_0.heroDataList_, {}
end

function var_0_0.Get(arg_9_0)
	return
end

function var_0_0.GetActivityID(arg_10_0)
	return BattleConst.STAGE_TYPE_NEW.GUILD_BOSS_PREPARE
end

function var_0_0.GetThreeStar(arg_11_0)
	return {}
end

function var_0_0.GetAddUserExp(arg_12_0)
	return arg_12_0.cfg.user_exp or 0
end

function var_0_0.GetAddHeroExp(arg_13_0)
	return arg_13_0.cfg.hero_exp or 0
end

function var_0_0.GetAILevel(arg_14_0)
	return arg_14_0.cfg.ai_level
end

function var_0_0.GetEnemyLevel(arg_15_0)
	return arg_15_0.cfg.monster_level or 0
end

function var_0_0.SetGuildBossTeam(arg_16_0, arg_16_1, arg_16_2)
	arg_16_0.heroDataList_ = arg_16_1
	arg_16_0.ownerList_ = arg_16_2
end

function var_0_0.GetAssistHeroOwnerList(arg_17_0)
	return arg_17_0.ownerList_
end

function var_0_0.SetChipDic(arg_18_0, arg_18_1)
	arg_18_0.chipOfHeroDic_ = arg_18_1
end

function var_0_0.GetChipOfHeroDic(arg_19_0)
	return arg_19_0.chipOfHeroDic_ or {}
end

return var_0_0
