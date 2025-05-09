local var_0_0 = {}

function var_0_0.GetStageName(arg_1_0, arg_1_1)
	if BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_MATRIX == arg_1_0 then
		local var_1_0 = MatrixData:GetTierID()
		local var_1_1 = MatrixTierCfg[var_1_0]

		return ""
	end

	local var_1_2 = var_0_0.GetStageCfg(arg_1_0, arg_1_1)

	if var_1_2 then
		return GetI18NText(var_1_2.name) or ""
	else
		return ""
	end
end

function var_0_0.GetChapterByStageId(arg_2_0, arg_2_1)
	local var_2_0 = ChapterCfg.get_id_list_by_type[arg_2_0]

	for iter_2_0, iter_2_1 in pairs(var_2_0) do
		local var_2_1 = ChapterCfg[iter_2_1]

		if table.keyof(var_2_1.section_id_list, arg_2_1) then
			return iter_2_1
		end
	end

	return 0
end

function var_0_0.GetChapterSectionIndex(arg_3_0, arg_3_1)
	if BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_EQUIP == arg_3_0 then
		local var_3_0 = BattleInstance.GetEquipStageShowIndex(arg_3_1)
		local var_3_1 = BattleInstance.GetHardLevel(arg_3_1)
		local var_3_2 = ChapterCfg.get_id_list_by_type[arg_3_0][1]

		return ChapterCfg[var_3_2].english, string.format("%d-%d", var_3_0, var_3_1)
	elseif BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_ENCHANTMENT == arg_3_0 then
		local var_3_3 = BattleInstance.GetEquipStageShowIndex(arg_3_1)
		local var_3_4 = ChapterCfg.get_id_list_by_type[arg_3_0][1]

		return ChapterCfg[var_3_4].english, var_3_3
	elseif BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_DAILY == arg_3_0 then
		local var_3_5 = ChapterCfg.get_id_list_by_type[arg_3_0]

		for iter_3_0, iter_3_1 in pairs(var_3_5) do
			local var_3_6 = ChapterCfg[iter_3_1]
			local var_3_7 = table.keyof(var_3_6.section_id_list, arg_3_1)

			if var_3_7 then
				return var_3_6.english, var_3_7
			end
		end
	elseif BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_PLOT == arg_3_0 then
		local var_3_8 = BattleChapterStageCfg[arg_3_1]

		if var_3_8.stage_num ~= "" then
			local var_3_9 = var_3_8.stage_num
			local var_3_10 = string.split(var_3_9, "-")
			local var_3_11 = ""

			for iter_3_2 = 1, #var_3_10 - 1 do
				if iter_3_2 == 1 then
					var_3_11 = var_3_10[iter_3_2]
				else
					var_3_11 = var_3_11 .. "-" .. var_3_10[iter_3_2]
				end
			end

			return var_3_11, var_3_10[#var_3_10]
		end

		local var_3_12 = getChapterIDByStageID(arg_3_1)
		local var_3_13 = ChapterCfg[var_3_12]
		local var_3_14 = table.keyof(var_3_13.section_id_list, arg_3_1)

		return var_3_13.english, var_3_14
	elseif BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_SUB_PLOT == arg_3_0 then
		local var_3_15 = ChapterCfg.get_id_list_by_type[arg_3_0]

		for iter_3_3, iter_3_4 in pairs(var_3_15) do
			local var_3_16 = ChapterCfg[iter_3_4]
			local var_3_17 = table.keyof(var_3_16.section_id_list, arg_3_1)

			if var_3_17 then
				return var_3_16.english, var_3_17
			end
		end
	end

	return "", ""
end

function var_0_0.GetRestrictHeroList(arg_4_0, arg_4_1)
	if BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_MATRIX == arg_4_0 or BattleConst.STAGE_TYPE_NEW.SOLO_CHALLENGE == arg_4_0 then
		return nil
	end

	local var_4_0 = var_0_0.GetStageCfg(arg_4_0, arg_4_1)

	if var_4_0 then
		return var_4_0.hero_list, var_4_0.can_switch_restrict_hero_list
	end

	return nil
end

function var_0_0.GetStageCfg(arg_5_0, arg_5_1)
	local var_5_0

	if BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_PLOT == arg_5_0 then
		var_5_0 = BattleChapterStageCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_SUB_PLOT == arg_5_0 then
		var_5_0 = BattleActivityStoryStageCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_DAILY == arg_5_0 then
		var_5_0 = BattleDailyStageCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_TOWER == arg_5_0 then
		var_5_0 = BattleTowerStageCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_ENCHANTMENT == arg_5_0 then
		var_5_0 = BattleEnchantmentStageCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_EQUIP == arg_5_0 then
		var_5_0 = BattleEquipStageCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.EQUIP_BREAK_THROUGH_MATERIAL == arg_5_0 then
		var_5_0 = BattleEquipBreakThroughMaterialStageCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.EQUIP_SEIZURE == arg_5_0 then
		var_5_0 = BattleEquipSeizureStageCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_BOSS_CHALLENGE == arg_5_0 then
		var_5_0 = BattleBossStageCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_BOSS_CHALLENGE_ADVANCE == arg_5_0 then
		var_5_0 = BattleBossStageCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_MYTHIC == arg_5_0 then
		var_5_0 = BattleMythicStageCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_BASE_TEACHING == arg_5_0 then
		var_5_0 = BattleBaseTeachStageCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_HERO_TEACHING == arg_5_0 then
		var_5_0 = BattleHeroTeachStageCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_MATRIX == arg_5_0 then
		var_5_0 = BattleMatrixStageCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_CHESS == arg_5_0 then
		var_5_0 = BattleChessStageCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.ACTIVITY_STORY == arg_5_0 then
		var_5_0 = BattleActivityStoryStageCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.OSIRIS_DEMON == arg_5_0 then
		var_5_0 = BattleHeartDemonStageCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.NEW_DEMON == arg_5_0 then
		var_5_0 = BattleNewHeartDemonStageCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.RACE_TRIAL == arg_5_0 then
		var_5_0 = BattleRaceTrialStageCfg[ActivityRaceTrialCfg[arg_5_1].stage_id]
	elseif BattleConst.STAGE_TYPE_NEW.HERO_TRIAL == arg_5_0 then
		var_5_0 = BattleHeroTrialStageCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.RESIDENT_HERO_TRIAL == arg_5_0 then
		var_5_0 = BattleResidentHeroTrialStageCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.SKIN_TRIAL == arg_5_0 then
		var_5_0 = BattleSkinTrialStageCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.SLAYER == arg_5_0 then
		var_5_0 = BattleSlayerStageCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.PARKOUR == arg_5_0 then
		var_5_0 = BattleParkourStageCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.TOWER_DEFENCE == arg_5_0 then
		var_5_0 = BattleShotStageCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.SOLO_CHALLENGE == arg_5_0 then
		var_5_0 = BattleSoloChallengeStageCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.ARTIFACT == arg_5_0 then
		var_5_0 = BattleArtifactCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.LIMITED_CALCULATION == arg_5_0 then
		var_5_0 = BattleLimitedCalculationStageCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.LEVIATHAN_GAME == arg_5_0 then
		var_5_0 = BattleLeviathanGamesCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.SKADI_GAME == arg_5_0 then
		var_5_0 = BattleCrosswaveCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.ACTIVITY_PT_GAME == arg_5_0 then
		var_5_0 = BattleActivityPtStageCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.ACTIVITY_MATRIX == arg_5_0 then
		var_5_0 = BattleActivityMatrixCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.GUILD_BOSS_PREPARE == arg_5_0 then
		var_5_0 = BattleClubBossPreposeCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.GUILD_BOSS_CHALLENGE == arg_5_0 then
		var_5_0 = BattleClubBossCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.ACTIVITY_RACE == arg_5_0 then
		var_5_0 = BattleActivityRaceStageCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.STRATEGY_MATRIX == arg_5_0 then
		var_5_0 = BattleStrategyMatrixCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.MYTHIC_FINAL == arg_5_0 then
		var_5_0 = BattleMythicFinalCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.GUILD_ACTIVITY == arg_5_0 then
		var_5_0 = BattleClubActivityCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.GUILD_ACTIVITY_SP == arg_5_0 then
		var_5_0 = BattleClubActivitySPCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.COOPERATION_DEMO == arg_5_0 then
		var_5_0 = BattleCooperationDemoCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.SEQUENTIAL_BATTLE == arg_5_0 then
		var_5_0 = BattleSequentialBattleStageCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.MARDUK_GAME == arg_5_0 then
		var_5_0 = BattleTowerGameCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.SURVIVE_SOLO == arg_5_0 then
		var_5_0 = BattleSoloSlayerCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.MARDUK_SPECIAL == arg_5_0 then
		var_5_0 = BattleQuickTrainingCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.ACTIVITY_WORLD_BOSS == arg_5_0 then
		var_5_0 = BattleActivityWorldBossCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.AFFIX_SELECT == arg_5_0 then
		var_5_0 = BattleActivityAffixSelectCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.DAMAGE_TEST == arg_5_0 then
		var_5_0 = BattleDamageTestCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.ACTIVITY_PT2_GAME_NORMAL == arg_5_0 then
		var_5_0 = BattleActivityPtStageV2NormalCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.ACTIVITY_PT2_GAME_CHALLENGE == arg_5_0 then
		var_5_0 = BattleActivityPtStageV2ChallengeCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.ACTIVITY_PT2_GAME_HARD == arg_5_0 then
		var_5_0 = BattleActivityPtStageV2HardCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.ABYSS == arg_5_0 then
		var_5_0 = BattleAbyssCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.POLYHEDRON == arg_5_0 then
		var_5_0 = BattlePolyhedronStageCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.ACTIVITY_WATER == arg_5_0 then
		var_5_0 = BattleActivityWaterCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.SAIL_GAME == arg_5_0 then
		var_5_0 = BattleSailGameStageCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.ACTIVITY_WATER_COOPERATION == arg_5_0 then
		var_5_0 = BattleActivityWaterCooperationCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.STRONGHOLD == arg_5_0 then
		var_5_0 = BattleStrongholdStageCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_ADVANCE_TEST == arg_5_0 then
		var_5_0 = BattleAdvanceTestStageCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.SOLO_HEART_DEMON == arg_5_0 then
		var_5_0 = BattleSoloHeartDemonCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.AREA_BATTLE == arg_5_0 then
		var_5_0 = BattleAreaBattleCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.DESTROY_BOX_GAME == arg_5_0 then
		var_5_0 = BattleDestroyBoxGameCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.ACTIVITY_JJT_MAP_GAME == arg_5_0 then
		var_5_0 = BattleKagutsuchiStageCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.ACTIVITY_PT_SCROLL == arg_5_0 then
		var_5_0 = BattleActivityRouletteCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_NEWWARCHESS == arg_5_0 then
		var_5_0 = BattleNewWarChessStageCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.ACTIVITY_ATTRIBUTE_ARENA == arg_5_0 then
		var_5_0 = BattleAttributeArenaCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.ACTIVITY_INDIA_NIAN == arg_5_0 then
		var_5_0 = BattleIndiaNianCfg[arg_5_1]
		var_5_0.extra_cost = IndiaNianData:GetSelectedStageCost()
	elseif BattleConst.STAGE_TYPE_NEW.PUSH_BOX_BATTLE == arg_5_0 then
		var_5_0 = BattleActivityCelebrationCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.CORE_VERIFICATION == arg_5_0 then
		var_5_0 = BattleCoreVerificationCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.SP_HERO_CHALLENGE_BATTLE_3_1 == arg_5_0 then
		var_5_0 = BattleVerthandiExclusiveCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.ACTIVITY_HERO_ENHANCE == arg_5_0 then
		var_5_0 = BattleHeroEnhanceCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.ACTIVITY_REFORGE == arg_5_0 then
		var_5_0 = BattleActivityReforgeCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.ACTIVITY_CATCH_DUCK == arg_5_0 then
		var_5_0 = BattleCatchDuckStageCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.ACTIVITY_MONSTER_COSPLAY == arg_5_0 then
		var_5_0 = BattleActivityMonsterCosplayCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.ACTIVITY_RHYTHM_GAME == arg_5_0 then
		var_5_0 = BattleRhythmGameStageCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.ACTIVITY_WHACK_MOLE == arg_5_0 then
		var_5_0 = BattleWhackMoleStageCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.ACTIVITY_SUMMER_WATER == arg_5_0 then
		var_5_0 = BattleActivityWaterGunnerCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.ACTIVITY_SWIMSUIT_BATTLE == arg_5_0 then
		var_5_0 = BattleSwimsuitCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.CHESS_BOARD == arg_5_0 then
		var_5_0 = BattleChessBoardCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.ADVANCE_MONSTER_TEST == arg_5_0 then
		var_5_0 = BattleActivityAdvanceMonsterTestCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.ACTIVITY_SPKALI_CHALLENGE == arg_5_0 then
		var_5_0 = BattleCoreKaliCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.CHALLENGE_ROGUE_TEAM == arg_5_0 then
		var_5_0 = BattleRogueTeamStageCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.ACTIVITY_DODGE_BARRAGE == arg_5_0 then
		var_5_0 = BattleDodgeBarrageCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.SEA_WARFARE == arg_5_0 then
		var_5_0 = BattleSeaWarfareStageCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.SKULD == arg_5_0 then
		var_5_0 = BattleSkuldStageCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.SAND_PLAY == arg_5_0 then
		var_5_0 = BattleSandPlayStageCfg[arg_5_1]
	elseif BattleConst.STAGE_TYPE_NEW.OSIRIS_PLAY_GAME == arg_5_0 then
		var_5_0 = BattleOsirisGameStageCfg[arg_5_1]
	end

	if var_5_0 == nil then
		print(string.format("配置表中没有关卡<color=#ff0000>%s</color>", arg_5_1))
	end

	return var_5_0 or {}
end

return var_0_0
