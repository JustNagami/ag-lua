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
		[BattleConst.STAGE_TYPE_NEW.ACTIVITY_SUMMER_WATER] = SummerWaterSelectHeroProxy,
		[BattleConst.STAGE_TYPE_NEW.ACTIVITY_SWIMSUIT_BATTLE] = ActivitySwimsuitSelectHeroProxy,
		[BattleConst.STAGE_TYPE_NEW.DESTROY_BOX_GAME] = DestroyBoxSelectHeroProxy,
		[BattleConst.STAGE_TYPE_NEW.ACTIVITY_INDIA_NIAN] = IndiaNianSelectHeroProxy,
		[BattleConst.STAGE_TYPE_NEW.ACTIVITY_SUMMER_WATER] = SummerWaterSelectHeroProxy,
		[BattleConst.STAGE_TYPE_NEW.CHALLENGE_ROGUE_TEAM] = ChallengeRogueTeamSelectHeroProxy,
		[BattleConst.STAGE_TYPE_NEW.ACTIVITY_WATER_COOPERATION] = CooperationSelectHeroProxy,
		[BattleConst.STAGE_TYPE_NEW.AREA_BATTLE] = AreaBattleSelectHeroProxy,
		[BattleConst.STAGE_TYPE_NEW.RACE_TRIAL] = ActivityRaceTrialSelectHeroProxy,
		[BattleConst.STAGE_TYPE_NEW.GOD_EATER_BATTLE] = GodEaterBattleSelectHeroProxy
	}
end

function var_0_0.GetProxy(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0 = var_0_0.GetProxyClass(arg_2_0.sectionType or arg_2_0.stageType)

	if arg_2_0.sectionType == BattleConst.STAGE_TYPE_NEW.MYTHIC_FINAL then
		if arg_2_1.contID == 2 then
			var_2_0 = MythicFinalMutiSelectHeroProxy
		else
			var_2_0 = var_0_0.GetProxyClass(arg_2_0.sectionType)
		end
	end

	arg_2_1 = arg_2_1 or ReserveTools.GetReserveParams(arg_2_0.sectionType or arg_2_0.stageType, arg_2_0.section, arg_2_0.activityID)
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

function var_0_0.IsDiffViewClass(arg_4_0, arg_4_1)
	local var_4_0 = false

	if arg_4_0.__cname ~= arg_4_1.__cname then
		var_4_0 = true
	end

	return var_4_0
end

function var_0_0.ReloadView(arg_5_0, arg_5_1)
	local var_5_0 = arg_5_0.gameObject_
	local var_5_1 = arg_5_0.transform_.parent
	local var_5_2 = Object.Instantiate(var_5_0, var_5_1)
	local var_5_3 = arg_5_1.New(var_5_2, var_5_1)

	arg_5_0:Dispose()

	return var_5_3
end

function var_0_0.GetRestrictHeroList(arg_6_0, arg_6_1)
	local var_6_0 = {
		{},
		{},
		{}
	}
	local var_6_1 = var_0_0.GetDefaultCanSwitchResctrictHeroList()

	if arg_6_0 and arg_6_1 and arg_6_1 ~= 0 then
		local var_6_2, var_6_3 = BattleStageTools.GetRestrictHeroList(arg_6_0, arg_6_1)

		if type(var_6_3) == "table" then
			var_6_1 = var_6_3
		end

		if type(var_6_2) == "table" then
			var_6_0 = var_6_2
		end
	end

	return var_6_0, var_6_1
end

function var_0_0.GetRestrictHeroPosDic(arg_7_0, arg_7_1)
	local var_7_0 = var_0_0.GetRestrictHeroList(arg_7_0, arg_7_1)
	local var_7_1 = {}
	local var_7_2 = {}

	for iter_7_0, iter_7_1 in ipairs(var_7_0) do
		local var_7_3 = 1
		local var_7_4 = 2

		while var_7_3 <= #iter_7_1 and var_7_4 <= #iter_7_1 do
			local var_7_5 = iter_7_1[var_7_3]
			local var_7_6 = iter_7_1[var_7_4]

			if var_7_5 ~= 0 and HeroCfg[var_7_5] and HeroCfg[var_7_5].private == 0 then
				var_7_1[var_7_5] = iter_7_0
				var_7_2[var_7_6] = iter_7_0
			end

			var_7_3 = var_7_3 + 2
			var_7_4 = var_7_4 + 2
		end
	end

	return var_7_1, var_7_2
end

function var_0_0.IsInTeam(arg_8_0, arg_8_1, arg_8_2, arg_8_3)
	local var_8_0 = false
	local var_8_1 = false
	local var_8_2 = -1

	arg_8_2 = arg_8_2 or {}
	arg_8_3 = arg_8_3 or {}

	for iter_8_0, iter_8_1 in pairs(arg_8_2) do
		if arg_8_0 == iter_8_1 and arg_8_1 == arg_8_3[iter_8_0] then
			var_8_0 = true
			var_8_1 = iter_8_0 == 1
			var_8_2 = iter_8_0

			break
		end
	end

	return var_8_0, var_8_1, var_8_2
end

function var_0_0.IsSameHeroInTeam(arg_9_0, arg_9_1)
	arg_9_1 = arg_9_1 or {}

	for iter_9_0, iter_9_1 in pairs(arg_9_1) do
		if arg_9_0 == iter_9_1 then
			return true
		end
	end

	return false
end

function var_0_0.IsEmptyTeam(arg_10_0)
	arg_10_0 = arg_10_0 or {}

	for iter_10_0, iter_10_1 in ipairs(arg_10_0) do
		if iter_10_1 ~= 0 then
			return false
		end
	end

	return true
end

function var_0_0.IsAllPosFullLock(arg_11_0, arg_11_1)
	if not arg_11_1 or arg_11_1 == 0 then
		return false
	end

	if not BattleStageTools.GetStageCfg(arg_11_0, arg_11_1) then
		return false
	end

	local var_11_0 = true
	local var_11_1, var_11_2 = SectionSelectHeroTools.GetRestrictHeroList(arg_11_0, arg_11_1)

	for iter_11_0, iter_11_1 in ipairs(var_11_1) do
		if not iter_11_1[1] or var_11_2[iter_11_0] ~= ReserveConst.RESTRICT_HERO_SWITCH_MODE.FORBID then
			var_11_0 = false

			break
		end
	end

	return var_11_0
end

function var_0_0.ReorderHeroTeam(arg_12_0, arg_12_1, arg_12_2)
	arg_12_2 = arg_12_2 or var_0_0.GetDefaultCanSwitchResctrictHeroList()

	local var_12_0 = 1
	local var_12_1 = 2

	while var_12_0 <= 3 and var_12_1 <= 3 do
		if arg_12_0[var_12_0] == 0 then
			if arg_12_2[var_12_1] == ReserveConst.RESTRICT_HERO_SWITCH_MODE.FORBID and arg_12_0[var_12_1] ~= 0 then
				arg_12_0[var_12_0] = arg_12_0[var_12_1]
				arg_12_1[var_12_0] = arg_12_1[var_12_1]
				arg_12_0[var_12_1] = 0
				arg_12_1[var_12_1] = 0
				var_12_0 = var_12_1
			end
		else
			var_12_0 = var_12_0 + 1
		end

		var_12_1 = var_12_1 + 1
	end
end

function var_0_0.GetDefaultCanSwitchResctrictHeroList()
	local var_13_0 = {}
	local var_13_1 = ReserveConst.RESTRICT_HERO_SWITCH_MODE.FORBID

	return {
		var_13_1,
		var_13_1,
		var_13_1
	}
end

function var_0_0.IsReserveProposalEqual(arg_14_0, arg_14_1, arg_14_2, arg_14_3, arg_14_4)
	local var_14_0 = ReserveParams.New(ReserveConst.RESERVE_TYPE.PROPOSAL, arg_14_0)
	local var_14_1 = ReserveTools.GetReserveTemplateByReserveType(ReserveConst.RESERVE_TYPE.PROPOSAL, true)
	local var_14_2 = var_14_1:GetHeroList(var_14_0)

	for iter_14_0, iter_14_1 in ipairs(arg_14_1) do
		if iter_14_1 ~= var_14_2[iter_14_0] then
			return false
		end
	end

	if arg_14_2 ~= var_14_1:GetComboSkillID(var_14_0) then
		return false
	end

	local var_14_3, var_14_4 = var_14_1:GetMimirData(var_14_0)

	if arg_14_3 ~= var_14_3 then
		return false
	end

	if #arg_14_4 ~= #var_14_4 then
		return false
	end

	local var_14_5 = {}

	for iter_14_2, iter_14_3 in ipairs(var_14_4) do
		var_14_5[iter_14_3] = true
	end

	for iter_14_4, iter_14_5 in ipairs(arg_14_4) do
		if not var_14_5[iter_14_5] then
			return false
		end
	end

	return true
end

function var_0_0.IsNeedDisplayFilterLockHero(arg_15_0, arg_15_1)
	if not arg_15_0.needDisplayFilterLocalHero then
		return false
	end

	if #arg_15_1.filterLockHeroList == 0 then
		return false
	end

	if manager.time:IsToday(var_0_0.GetSkipDisplayFilterLockHeroTime()) then
		return false
	end

	return true
end

function var_0_0.SetSkipDisplayFilterLockHeroTime(arg_16_0)
	saveData("section_select_hero", "SkipDisplayFilterLockHeroTime", arg_16_0)
end

function var_0_0.GetSkipDisplayFilterLockHeroTime()
	return getData("section_select_hero", "SkipDisplayFilterLockHeroTime") or 0
end

function var_0_0.GetModelOffesetPosition(arg_18_0, arg_18_1, arg_18_2)
	local var_18_0 = Vector3(0, 0, 0)
	local var_18_1 = (arg_18_1.x - arg_18_0.x) / arg_18_2

	var_18_0.x = var_18_1 * SectionSelectHeroConst.ModelDistanceX

	if var_18_1 > 0 then
		var_18_0.z = -var_18_1 * SectionSelectHeroConst.ModelDistanceZ
	else
		var_18_0.z = var_18_1 * SectionSelectHeroConst.ModelDistanceZ
	end

	return var_18_0
end

function var_0_0.SetCurSelectHeroData(arg_19_0)
	var_0_0.curSelectHeroData = arg_19_0
end

function var_0_0.GetCurSelectHeroData()
	return var_0_0.curSelectHeroData
end

return var_0_0
