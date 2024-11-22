local var_0_0 = {
	reserveTemplateClassDic = {
		[ReserveConst.RESERVE_TYPE.DEFAULT] = "ReserveBaseTemplate",
		[ReserveConst.RESERVE_TYPE.PROPOSAL] = "ReserveProposalTemplate",
		[ReserveConst.RESERVE_TYPE.ABYSS] = "ReserveAbyssTemplate",
		[ReserveConst.RESERVE_TYPE.BOSS_CHALLENGE] = "ReserveBossChallengeTemplate",
		[ReserveConst.RESERVE_TYPE.SOLO_CHALLENGE] = "ReserveSoloChallengeTemplate",
		[ReserveConst.RESERVE_TYPE.SEQUENTIAL_BATTLE] = "ReserveSequentialBattleTemplate",
		[ReserveConst.RESERVE_TYPE.ATTRIBUTE_ARENA] = "ReserveAttributeArenaTemplate",
		[ReserveConst.RESERVE_TYPE.GUILD_BOSS] = "ReserveGuildBossTemplate",
		[ReserveConst.RESERVE_TYPE.CORE_VERIFICATION] = "ReserveCoreVerificationTemplate",
		[ReserveConst.RESERVE_TYPE.GUILD_ACTIVITY] = "ReserveGuildActivityTemplate",
		[ReserveConst.RESERVE_TYPE.WATER] = "ReserveSummerWaterTemplate",
		[ReserveConst.RESERVE_TYPE.CHALLENGE_ROGUE_TEAM] = "ReserveChallengeRogueTeamTemplate",
		[ReserveConst.RESERVE_TYPE.SWIMSUIT_BATTLE] = "ReserveSwimsuitBattleTemplate",
		[ReserveConst.RESERVE_TYPE.AREA_BATTLE] = "ReserveAreaBattleTemplate"
	},
	contDataClassDic = {
		[ReserveConst.RESERVE_TYPE.DEFAULT] = "ReserveContDataTemplate",
		[ReserveConst.RESERVE_TYPE.PROPOSAL] = "ReserveProposalContDataTemplate",
		[ReserveConst.RESERVE_TYPE.SOLO_CHALLENGE] = "ReserveSoloChallengeContDataTemplate",
		[ReserveConst.RESERVE_TYPE.SEQUENTIAL_BATTLE] = "ReserveSequentialContDataTemplate",
		[ReserveConst.RESERVE_TYPE.MULTI_CHESS] = "ReserveMultiChessContDataTemplate",
		[ReserveConst.RESERVE_TYPE.CHALLENGE_ROGUE_TEAM] = "ReserveChallengeRogueTeamContDataTemplate"
	},
	singleTeamDataClassDic = {
		[ReserveConst.RESERVE_TYPE.DEFAULT] = "ReserveSingleTeamDataTemplate",
		[ReserveConst.RESERVE_TYPE.SOLO_CHALLENGE] = "ReserveSoloChallengeSingleTeamDataTemplate",
		[ReserveConst.RESERVE_TYPE.SEQUENTIAL_BATTLE] = "ReserveSequentialSingleTeamDataTemplate",
		[ReserveConst.RESERVE_TYPE.MULTI_CHESS] = "ReserveMultiChessSingleTeamDataTemplate",
		[ReserveConst.RESERVE_TYPE.CHALLENGE_ROGUE_TEAM] = "ReserveChangeRogueTeamSingleTeamDataTemplate"
	},
	heroPosDataClassDic = {
		[ReserveConst.RESERVE_TYPE.DEFAULT] = "ReserveHeroPosTemplate",
		[ReserveConst.RESERVE_TYPE.GUILD_BOSS] = "ReserveGuildBossHeroPosTemplate",
		[ReserveConst.RESERVE_TYPE.CHALLENGE_ROGUE_TEAM] = "ReserveChangeRogueTeamHeroPosTemplate"
	},
	mimirDataClassDic = {
		[ReserveConst.RESERVE_TYPE.DEFAULT] = "ReserveMimirDataTemplate"
	},
	GetReserveType = function(arg_1_0, arg_1_1)
		local var_1_0 = ReserveConst.RESERVE_TYPE.NOT_NEED_RESERVE

		if arg_1_0 and arg_1_1 and arg_1_1 ~= 0 then
			local var_1_1 = BattleStageTools.GetStageCfg(arg_1_0, arg_1_1)

			if var_1_1.team_type and var_1_1.team_type[1] then
				var_1_0 = var_1_1.team_type[1]
			end
		end

		return var_1_0
	end,
	GetContID = function(arg_2_0, arg_2_1)
		local var_2_0 = ReserveConst.DETAULT_CONT_ID

		if arg_2_0 and arg_2_1 and arg_2_1 ~= 0 then
			local var_2_1 = BattleStageTools.GetStageCfg(arg_2_0, arg_2_1)

			if var_2_1.team_type and var_2_1.team_type[2] then
				var_2_0 = var_2_1.team_type[2]
			end
		end

		return var_2_0
	end,
	NeedDefaultTeam = function(arg_3_0, arg_3_1)
		if not arg_3_0 or not arg_3_1 or arg_3_1 == 0 then
			return false
		end

		local var_3_0 = BattleStageTools.GetStageCfg(arg_3_0, arg_3_1)

		if var_3_0.need_default_team then
			return var_3_0.need_default_team == ReserveConst.NEED_DEFAULT_TEAM
		end

		return false
	end,
	NeedCacheTeam = function(arg_4_0, arg_4_1)
		local var_4_0

		if arg_4_0 and arg_4_1 and arg_4_1 ~= 0 then
			local var_4_1 = BattleStageTools.GetStageCfg(arg_4_0, arg_4_1)

			if var_4_1.team_type and var_4_1.team_type[2] then
				return var_4_1.team_type[2] ~= ReserveConst.NOT_NEED_CACHE_CONT_ID
			end
		end

		return false
	end,
	GetReserveParams = function(arg_5_0, arg_5_1, arg_5_2)
		local var_5_0 = ReserveTools.GetReserveType(arg_5_0, arg_5_1)
		local var_5_1 = ReserveTools.GetContID(arg_5_0, arg_5_1)
		local var_5_2 = {
			stageType = arg_5_0,
			stageID = arg_5_1,
			activityID = arg_5_2 or 0
		}

		return ReserveParams.New(var_5_0, var_5_1, nil, var_5_2)
	end,
	GetReserveTemplateByReserveType = function(arg_6_0, arg_6_1)
		local var_6_0

		if not arg_6_1 then
			var_6_0 = ReserveData:GetTeamTemplate(arg_6_0)
		else
			var_6_0 = ReserveData:GetServerTeamTemplate(arg_6_0)
		end

		return var_6_0
	end,
	GetReserveTemplate = function(arg_7_0, arg_7_1)
		local var_7_0 = ReserveTools.GetReserveType(arg_7_0, arg_7_1)

		return (ReserveData:GetTeamTemplate(var_7_0))
	end,
	SetTeam = function(arg_8_0, arg_8_1, arg_8_2, arg_8_3, arg_8_4, arg_8_5)
		ReserveTools.SetHeroList(arg_8_0, arg_8_1, arg_8_2)
		ReserveTools.SetComboSkillID(arg_8_0, arg_8_3)
		ReserveTools.SetMimirID(arg_8_0, arg_8_4)
		ReserveTools.SetMimirChipList(arg_8_0, arg_8_5)
	end,
	CleanCacheData = function(arg_9_0)
		ReserveTools.GetReserveTemplateByReserveType(arg_9_0):CleanCacheData()
	end
}

function var_0_0.GetHeroList(arg_10_0)
	arg_10_0 = var_0_0.CheckReserveParams(arg_10_0)

	local var_10_0 = {
		0,
		0,
		0
	}
	local var_10_1 = {
		false,
		false,
		false
	}
	local var_10_2 = {}
	local var_10_3 = {
		0,
		0,
		0
	}
	local var_10_4 = false
	local var_10_5, var_10_6, var_10_7, var_10_8, var_10_9 = ReserveTools.GetReserveTemplateByReserveType(arg_10_0.reserveType):GetHeroList(arg_10_0)
	local var_10_10 = var_10_9
	local var_10_11 = var_10_8
	local var_10_12 = var_10_7
	local var_10_13 = var_10_6

	return var_10_5, var_10_13, var_10_12, var_10_11, var_10_10
end

function var_0_0.SetHeroList(arg_11_0, arg_11_1, arg_11_2)
	arg_11_0 = var_0_0.CheckReserveParams(arg_11_0)

	ReserveTools.GetReserveTemplateByReserveType(arg_11_0.reserveType):SetHeroList(arg_11_0, arg_11_1, arg_11_2)
end

function var_0_0.GetComboSkillID(arg_12_0)
	arg_12_0 = var_0_0.CheckReserveParams(arg_12_0)

	return ReserveTools.GetReserveTemplateByReserveType(arg_12_0.reserveType):GetComboSkillID(arg_12_0)
end

function var_0_0.SetComboSkillID(arg_13_0, arg_13_1)
	arg_13_0 = var_0_0.CheckReserveParams(arg_13_0)

	ReserveTools.GetReserveTemplateByReserveType(arg_13_0.reserveType):SetComboSkillID(arg_13_0, arg_13_1)
end

function var_0_0.GetMimirData(arg_14_0)
	arg_14_0 = var_0_0.CheckReserveParams(arg_14_0)

	local var_14_0, var_14_1 = ReserveTools.GetReserveTemplateByReserveType(arg_14_0.reserveType):GetMimirData(arg_14_0)

	return var_14_0, var_14_1
end

function var_0_0.GetMimirID(arg_15_0)
	arg_15_0 = var_0_0.CheckReserveParams(arg_15_0)

	return ReserveTools.GetReserveTemplateByReserveType(arg_15_0.reserveType):GetMimirID(arg_15_0)
end

function var_0_0.SetMimirID(arg_16_0, arg_16_1)
	arg_16_0 = var_0_0.CheckReserveParams(arg_16_0)

	ReserveTools.GetReserveTemplateByReserveType(arg_16_0.reserveType):SetMimirID(arg_16_0, arg_16_1)
end

function var_0_0.GetMimirChipList(arg_17_0)
	arg_17_0 = var_0_0.CheckReserveParams(arg_17_0)

	return ReserveTools.GetReserveTemplateByReserveType(arg_17_0.reserveType):GetMimirChipList(arg_17_0)
end

function var_0_0.SetMimirChipList(arg_18_0, arg_18_1)
	arg_18_0 = var_0_0.CheckReserveParams(arg_18_0)

	ReserveTools.GetReserveTemplateByReserveType(arg_18_0.reserveType):SetMimirChipList(arg_18_0, arg_18_1)
end

function var_0_0.InsertMimirChip(arg_19_0, arg_19_1)
	arg_19_0 = var_0_0.CheckReserveParams(arg_19_0)

	local var_19_0 = ReserveTools.GetReserveTemplateByReserveType(arg_19_0.reserveType)
	local var_19_1 = var_19_0:GetMimirChipList(arg_19_0)

	ChipTools.InsertChip(var_19_1, arg_19_1, function(arg_20_0)
		var_19_0:SetMimirChipList(arg_19_0, arg_20_0)
	end)
end

function var_0_0.RemoveMimirChip(arg_21_0, arg_21_1)
	arg_21_0 = var_0_0.CheckReserveParams(arg_21_0)

	local var_21_0 = ReserveTools.GetReserveTemplateByReserveType(arg_21_0.reserveType)
	local var_21_1 = var_21_0:GetMimirChipList(arg_21_0)

	ChipTools.RemoveChip(var_21_1, arg_21_1, function(arg_22_0)
		var_21_0:SetMimirChipList(arg_21_0, arg_22_0)
	end)
end

function var_0_0.ResetMimirChipList(arg_23_0)
	arg_23_0 = var_0_0.CheckReserveParams(arg_23_0)

	ReserveTools.GetReserveTemplateByReserveType(arg_23_0.reserveType):ResetMimirChipList(arg_23_0)
end

function var_0_0.ResetContData(arg_24_0, arg_24_1)
	ReserveTools.GetReserveTemplateByReserveType(arg_24_0):GetContDataTemplateById(arg_24_1):Reset()
end

function var_0_0.SwapTeam(arg_25_0, arg_25_1, arg_25_2, arg_25_3)
	ReserveTools.GetReserveTemplateByReserveType(arg_25_0):GetContDataTemplateById(arg_25_1):SwapTeam(arg_25_2, arg_25_3)
end

function var_0_0.GetReserveTemplateClass(arg_26_0)
	local var_26_0 = var_0_0.reserveTemplateClassDic[arg_26_0] or var_0_0.reserveTemplateClassDic[ReserveConst.RESERVE_TYPE.DEFAULT]

	return _G[var_26_0]
end

function var_0_0.GetContDataClass(arg_27_0)
	local var_27_0 = var_0_0.contDataClassDic[arg_27_0] or var_0_0.contDataClassDic[ReserveConst.RESERVE_TYPE.DEFAULT]

	return _G[var_27_0]
end

function var_0_0.GetSingleTeamDataClass(arg_28_0)
	local var_28_0 = var_0_0.singleTeamDataClassDic[arg_28_0] or var_0_0.singleTeamDataClassDic[ReserveConst.RESERVE_TYPE.DEFAULT]

	return _G[var_28_0]
end

function var_0_0.GetHeroPosDataClass(arg_29_0)
	local var_29_0 = var_0_0.heroPosDataClassDic[arg_29_0] or var_0_0.heroPosDataClassDic[ReserveConst.RESERVE_TYPE.DEFAULT]

	return _G[var_29_0]
end

function var_0_0.GetMimirDataClass(arg_30_0)
	local var_30_0 = var_0_0.mimirDataClassDic[arg_30_0] or var_0_0.mimirDataClassDic[ReserveConst.RESERVE_TYPE.DEFAULT]

	return _G[var_30_0]
end

function var_0_0.CheckReserveParams(arg_31_0)
	if not arg_31_0 then
		arg_31_0 = ReserveParams.New(ReserveConst.RESERVE_TYPE.DEFAULT)

		Debug.LogError("编队参数为空，使用默认编队参数")
	end

	if not arg_31_0.reserveType then
		arg_31_0.reserveType = ReserveConst.RESERVE_TYPE.DEFAULT

		Debug.LogError("编队类型为空，使用默认编队类型")
	end

	return arg_31_0
end

return var_0_0
