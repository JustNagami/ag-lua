local var_0_0 = import("game.views.sectionSelectHero.SelectHeroProxy.SelectHeroBaseProxy")
local var_0_1 = class("ChallengeRogueTeamSelectHeroProxy", var_0_0)

function var_0_1.GetHeroTeamInfoRoute(arg_1_0)
	return "/challengeRogueTeamTeamInfo"
end

function var_0_1.InitCustomParams(arg_2_0, arg_2_1)
	arg_2_0.nodeID = arg_2_1.nodeID
	arg_2_0.needMimirPanel = false
	arg_2_0.canChangeMimir = false
	arg_2_0.needHeroHP = true

	local var_2_0 = ChallengeRogueTeamData:HeroGetLockState()

	arg_2_0.needReserveProposalPanel = not var_2_0
	arg_2_0.canChangeReserveProposal = not var_2_0

	local var_2_1, var_2_2, var_2_3, var_2_4 = ReserveTools.GetHeroList(arg_2_0.reserveParams)

	arg_2_0.uiCacheHeroIDList = var_2_1
	arg_2_0.uiCacheTrialIDList = var_2_4
end

function var_0_1.CustomGetHeroHP(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	local var_3_0 = math.ceil((ChallengeRogueTeamData:GetHeroData(arg_3_2, nil, true).hpPercent or 10000) / 100)
	local var_3_1 = arg_3_0:GetHeroViewProxy():GetHeroAllAttribute(arg_3_2)

	return math.ceil(var_3_1[HeroConst.HERO_ATTRIBUTE.STA] * var_3_0 / 10000), var_3_0
end

function var_0_1.GreateHeroViewProxy(arg_4_0, arg_4_1)
	if not arg_4_0.heroViewProxyDic[arg_4_1] then
		arg_4_0.heroViewProxyDic[arg_4_1] = HeroViewDataProxy.New(arg_4_1)
	end

	if arg_4_1 == HeroConst.HERO_DATA_TYPE.TRIAL then
		arg_4_0.heroViewProxyDic[arg_4_1].isChallengeRogue = true
	end

	return arg_4_0.heroViewProxyDic[arg_4_1]
end

function var_0_1.GetStageData(arg_5_0)
	return BattleStageFactory.Produce(arg_5_0.stageType, arg_5_0.stageID, arg_5_0.nodeID, arg_5_0.reserveParams)
end

function var_0_1.GetSelectHeroViewClass(arg_6_0)
	return ChallengeRogueTeamSelectHeroView
end

function var_0_1.CustomChangeHeroTeam(arg_7_0, arg_7_1, arg_7_2)
	arg_7_0.uiCacheHeroIDList = arg_7_1
	arg_7_0.uiCacheTrialIDList = arg_7_2
end

function var_0_1.CustomGetTeamData(arg_8_0)
	local var_8_0, var_8_1, var_8_2, var_8_3 = ReserveTools.GetHeroList(arg_8_0.reserveParams)

	return arg_8_0.uiCacheHeroIDList, var_8_1, var_8_2, arg_8_0.uiCacheTrialIDList
end

function var_0_1.UpdateBar(arg_9_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR,
		INFO_BAR
	})
	manager.windowBar:SetGameHelpKey("ROGUE_TEAM_HERO_DESC")
end

function var_0_1.CustomRefreshHeroInfoList(arg_10_0, arg_10_1, arg_10_2, arg_10_3, arg_10_4)
	arg_10_0.uiCacheHeroIDList = arg_10_1 or {
		0,
		0,
		0
	}
	arg_10_0.uiCacheTrialIDList = arg_10_2 or {
		0,
		0,
		0
	}
end

function var_0_1.CustomGetComboSkillID(arg_11_0)
	reserveParams = ReserveTools.CheckReserveParams(arg_11_0.reserveParams)

	return ReserveTools.GetReserveTemplateByReserveType(reserveParams.reserveType):GetComboSkillID(reserveParams, arg_11_0.uiCacheHeroIDList)
end

function var_0_1.GetHeroIDList(arg_12_0)
	local var_12_0 = {}

	for iter_12_0 = 1, arg_12_0.heroPosMaxCount do
		var_12_0[iter_12_0] = arg_12_0.uiCacheHeroIDList[iter_12_0]
	end

	return var_12_0
end

function var_0_1.GetTrialIDList(arg_13_0)
	local var_13_0 = {}

	for iter_13_0 = 1, arg_13_0.heroPosMaxCount do
		var_13_0[iter_13_0] = arg_13_0.uiCacheTrialIDList[iter_13_0]
	end

	return var_13_0
end

return var_0_1
