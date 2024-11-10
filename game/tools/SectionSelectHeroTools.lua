local var_0_0 = {}

function var_0_0.CreateClassDic()
	var_0_0.classDicCreatedFlag = true
	var_0_0.proxyClassDic = {
		[BattleConst.STAGE_TYPE_NEW.ABYSS] = AbyssSelectHeroProxy,
		[BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_MATRIX] = ActivityMatrixSelectHeroProxy,
		[BattleConst.STAGE_TYPE_NEW.ACTIVITY_RACE] = ActivityRaceSelectHeroProxy,
		[BattleConst.STAGE_TYPE_NEW.ACTIVITY_WORLD_BOSS] = ActivityWorldBossSelectHeroProxy,
		[BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_ADVANCE_TEST] = AdvanceTestSelectHeroProxy,
		[BattleConst.STAGE_TYPE_NEW.ACTIVITY_ATTRIBUTE_ARENA] = AttributeArenaSelectHeroProxy,
		[BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_BOSS_CHALLENGE] = BossChallengeSelectHeroProxy,
		[BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_BOSS_CHALLENGE_ADVANCE] = BossChallengeSelectHeroProxy,
		[BattleConst.STAGE_TYPE_NEW.GUILD_ACTIVITY] = GuildActivitySelectHeroProxy,
		[BattleConst.STAGE_TYPE_NEW.GUILD_ACTIVITY_SP] = GuildActivitySPSelectHeroProxy,
		[BattleConst.STAGE_TYPE_NEW.GUILD_BOSS_PREPARE] = GuildBossSelectHeroProxy,
		[BattleConst.STAGE_TYPE_NEW.GUILD_BOSS_CHALLENGE] = GuildBossSelectHeroProxy,
		[BattleConst.STAGE_TYPE_NEW.ACTIVITY_JJT_MAP_GAME] = KagutsuchiSelectHeroProxy,
		[BattleConst.STAGE_TYPE_NEW.MYTHIC_FINAL] = MythicFinalSelectHeroProxy,
		[BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_MYTHIC] = MythicSelectHeroProxy,
		[BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_NEWWARCHESS] = NewWarChessSelectHeroProxy,
		[BattleConst.STAGE_TYPE_NEW.PUSH_BOX_BATTLE] = PushBoxSelectHeroProxy,
		[BattleConst.STAGE_TYPE_NEW.SLAYER] = SlayerSelectHeroProxy,
		[BattleConst.STAGE_TYPE_NEW.SOLO_CHALLENGE] = SoloChallengeSelectHeroProxy,
		[BattleConst.STAGE_TYPE_NEW.STRATEGY_MATRIX] = StrategyMatrixSelectHeroProxy,
		[BattleConst.STAGE_TYPE_NEW.ACTIVITY_WATER] = XH3rdWaterSelectHeroProxy,
		[BattleConst.STAGE_TYPE_NEW.ACTIVITY_HERO_ENHANCE] = ActivityHeroEnhanceSelectHeroProxy,
		[BattleConst.STAGE_TYPE_NEW.CORE_VERIFICATION] = CoreVerificationSelectHeroProxy,
		[BattleConst.STAGE_TYPE_NEW.DESTROY_BOX_GAME] = DestroyBoxSelectHeroProxy,
		[BattleConst.STAGE_TYPE_NEW.ACTIVITY_INDIA_NIAN] = IndiaNianSelectHeroProxy
	}
end

function var_0_0.GetProxy(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0 = var_0_0.GetProxyClass(arg_2_0.sectionType)

	if arg_2_0.sectionType == BattleConst.STAGE_TYPE_NEW.MYTHIC_FINAL then
		if arg_2_1.contID == 2 then
			var_2_0 = MythicFinalMutiSelectHeroProxy
		else
			var_2_0 = var_0_0.GetProxyClass(arg_2_0.sectionType)
		end
	end

	arg_2_1 = arg_2_1 or ReserveTools.GetReserveParams(arg_2_0.sectionType, arg_2_0.section, arg_2_0.activityID)
	arg_2_2 = arg_2_2 or HeroConst.HERO_DATA_TYPE.DEFAULT

	return var_2_0.New(arg_2_0, arg_2_1, arg_2_2)
end

function var_0_0.GetProxyClass(arg_3_0)
	if not var_0_0.classDicCreatedFlag then
		var_0_0.CreateClassDic()
	end

	if not arg_3_0 then
		return SelectHeroBaseProxy
	end

	return var_0_0.proxyClassDic[arg_3_0] or SelectHeroBaseProxy
end

function var_0_0.ReloadView(arg_4_0, arg_4_1)
	if arg_4_0.__cname ~= arg_4_1.__cname then
		local var_4_0 = arg_4_0.gameObject_
		local var_4_1 = arg_4_0.transform_.parent
		local var_4_2 = Object.Instantiate(var_4_0, var_4_1)
		local var_4_3 = arg_4_1.New(var_4_2, var_4_1)

		arg_4_0:Dispose()

		return var_4_3
	else
		return arg_4_0
	end
end

function var_0_0.GetRestrictHeroList(arg_5_0, arg_5_1)
	local var_5_0 = {
		{},
		{},
		{}
	}
	local var_5_1 = var_0_0.GetDefaultCanSwitchResctrictHeroList()

	if arg_5_0 and arg_5_1 and arg_5_1 ~= 0 then
		local var_5_2, var_5_3 = BattleStageTools.GetRestrictHeroList(arg_5_0, arg_5_1)

		if type(var_5_3) == "table" then
			var_5_1 = var_5_3
		end

		if type(var_5_2) == "table" then
			var_5_0 = var_5_2
		end
	end

	return var_5_0, var_5_1
end

function var_0_0.GetRestrictHeroPosDic(arg_6_0, arg_6_1)
	local var_6_0 = var_0_0.GetRestrictHeroList(arg_6_0, arg_6_1)
	local var_6_1 = {}
	local var_6_2 = {}

	for iter_6_0, iter_6_1 in ipairs(var_6_0) do
		local var_6_3 = 1
		local var_6_4 = 2

		while var_6_3 <= #iter_6_1 and var_6_4 <= #iter_6_1 do
			local var_6_5 = iter_6_1[var_6_3]
			local var_6_6 = iter_6_1[var_6_4]

			if var_6_5 ~= 0 and HeroCfg[var_6_5] and HeroCfg[var_6_5].private == 0 then
				var_6_1[var_6_5] = iter_6_0
				var_6_2[var_6_6] = iter_6_0
			end

			var_6_3 = var_6_3 + 2
			var_6_4 = var_6_4 + 2
		end
	end

	return var_6_1, var_6_2
end

function var_0_0.IsInTeam(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
	local var_7_0 = false
	local var_7_1 = false
	local var_7_2 = -1

	arg_7_2 = arg_7_2 or {}
	arg_7_3 = arg_7_3 or {}

	for iter_7_0, iter_7_1 in pairs(arg_7_2) do
		if arg_7_0 == iter_7_1 and arg_7_1 == arg_7_3[iter_7_0] then
			var_7_0 = true
			var_7_1 = iter_7_0 == 1
			var_7_2 = iter_7_0

			break
		end
	end

	return var_7_0, var_7_1, var_7_2
end

function var_0_0.IsSameHeroInTeam(arg_8_0, arg_8_1)
	arg_8_1 = arg_8_1 or {}

	for iter_8_0, iter_8_1 in pairs(arg_8_1) do
		if arg_8_0 == iter_8_1 then
			return true
		end
	end

	return false
end

function var_0_0.IsEmptyTeam(arg_9_0)
	arg_9_0 = arg_9_0 or {}

	for iter_9_0, iter_9_1 in ipairs(arg_9_0) do
		if iter_9_1 ~= 0 then
			return false
		end
	end

	return true
end

function var_0_0.IsAllPosFullLock(arg_10_0, arg_10_1)
	if not arg_10_1 or arg_10_1 == 0 then
		return false
	end

	if not BattleStageTools.GetStageCfg(arg_10_0, arg_10_1) then
		return false
	end

	local var_10_0 = true
	local var_10_1, var_10_2 = SectionSelectHeroTools.GetRestrictHeroList(arg_10_0, arg_10_1)

	for iter_10_0, iter_10_1 in ipairs(var_10_1) do
		if not iter_10_1[1] or var_10_2[iter_10_0] ~= ReserveConst.RESTRICT_HERO_SWITCH_MODE.FORBID then
			var_10_0 = false

			break
		end
	end

	return var_10_0
end

function var_0_0.ReorderHeroTeam(arg_11_0, arg_11_1, arg_11_2)
	arg_11_2 = arg_11_2 or var_0_0.GetDefaultCanSwitchResctrictHeroList()

	local var_11_0 = 1
	local var_11_1 = 2

	while var_11_0 <= 3 and var_11_1 <= 3 do
		if arg_11_0[var_11_0] == 0 then
			if arg_11_2[var_11_1] == ReserveConst.RESTRICT_HERO_SWITCH_MODE.FORBID and arg_11_0[var_11_1] ~= 0 then
				arg_11_0[var_11_0] = arg_11_0[var_11_1]
				arg_11_1[var_11_0] = arg_11_1[var_11_1]
				arg_11_0[var_11_1] = 0
				arg_11_1[var_11_1] = 0
				var_11_0 = var_11_1
			end
		else
			var_11_0 = var_11_0 + 1
		end

		var_11_1 = var_11_1 + 1
	end
end

function var_0_0.GetDefaultCanSwitchResctrictHeroList()
	local var_12_0 = {}
	local var_12_1 = ReserveConst.RESTRICT_HERO_SWITCH_MODE.FORBID

	return {
		var_12_1,
		var_12_1,
		var_12_1
	}
end

var_0_0.HeroTransform = {
	{
		position = Vector3(500, 0, 0),
		rotation = Vector3(0, 0, 0),
		scale = Vector3(1, 1, 1)
	},
	{
		position = Vector3(501.5, 0, -2.9),
		rotation = Vector3(0, -16.419, 0),
		scale = Vector3(1, 1, 1)
	},
	{
		position = Vector3(498.5, 0, -2.9),
		rotation = Vector3(0, 9.932, 0),
		scale = Vector3(1, 1, 1)
	}
}

local var_0_1 = 400
local var_0_2 = var_0_0.HeroTransform[2].position.z - var_0_0.HeroTransform[1].position.z
local var_0_3 = var_0_0.HeroTransform[2].position.x - var_0_0.HeroTransform[1].position.x

function var_0_0.GetModelOffesetPosition(arg_13_0, arg_13_1)
	local var_13_0 = Vector3(0, 0, 0)
	local var_13_1 = arg_13_1.x - arg_13_0.x

	if var_13_1 > 0 then
		var_13_0.x = -var_13_1 * var_0_3 / var_0_1
		var_13_0.z = var_13_1 * var_0_2 / var_0_1
	else
		var_13_0.x = -var_13_1 * var_0_3 / var_0_1
		var_13_0.z = -var_13_1 * var_0_2 / var_0_1
	end

	return var_13_0
end

function var_0_0.SetCurSelectHeroData(arg_14_0)
	var_0_0.curSelectHeroData = arg_14_0
end

function var_0_0.GetCurSelectHeroData()
	return var_0_0.curSelectHeroData
end

return var_0_0
