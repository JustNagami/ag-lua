local var_0_0 = class("SelectHeroBaseProxy")

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	arg_1_1 = arg_1_1 or {}
	arg_1_2 = arg_1_2 or {}

	arg_1_0:Init(arg_1_1, arg_1_2, arg_1_3)
end

function var_0_0.Init(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	arg_2_0:InitBaseParams(arg_2_1)
	arg_2_0:InitReserveParams(arg_2_2, arg_2_3)
	arg_2_0:InitUIParams(arg_2_1)
	arg_2_0:InitHeroTeamInfoViewParams(arg_2_1)
	arg_2_0:InitCustomParams(arg_2_1)
	arg_2_0:GetHeroTeam()
end

function var_0_0.InitBaseParams(arg_3_0, arg_3_1)
	arg_3_0.stageID = arg_3_1.section or 0
	arg_3_0.stageType = arg_3_1.sectionType or BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_UNDEFINED
	arg_3_0.activityID = arg_3_1.activityID
	arg_3_0.multiple = arg_3_1.multiple or 1
end

function var_0_0.InitReserveParams(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.reserveParams = arg_4_1 or ReserveTools.GetReserveParams(arg_4_0.stageType, arg_4_0.stageID, arg_4_0.activityID)
	arg_4_0.heroDataType = arg_4_2 or HeroConst.HERO_DATA_TYPE.DEFAULT
	arg_4_0.heroViewProxy = HeroViewDataProxy.New(arg_4_0.heroDataType)
	arg_4_0.heroViewProxyDic = {}
	arg_4_0.heroViewProxyDic[arg_4_0.heroDataType] = arg_4_0.heroViewProxy
	arg_4_0.heroPosMaxCount = 3
	arg_4_0.heroInfoList = {}
	arg_4_0.lockHeroList = {}
	arg_4_0.comboSkillID = 0
	arg_4_0.mimirID = 0
	arg_4_0.chipList = {}
end

function var_0_0.InitUIParams(arg_5_0, arg_5_1)
	arg_5_0.barList = arg_5_1.customBarList or {
		BACK_BAR,
		HOME_BAR,
		NAVI_BAR
	}
	arg_5_0.canChangeTeam = true
	arg_5_0.needHeroPower = true
	arg_5_0.needRacePanel = true
	arg_5_0.forceRace = -1
	arg_5_0.needComboSkillPanel = true
	arg_5_0.canChangeComboSkill = true
	arg_5_0.needMimirPanel = true
	arg_5_0.canChangeMimir = true
	arg_5_0.needReserveProposalPanel = true
	arg_5_0.canChangeReserveProposal = true
	arg_5_0.needHeroHP = false
	arg_5_0.needHeroAssistant = false
	arg_5_0.needHeroEnergy = false

	arg_5_0:CheckComboSkill()
	arg_5_0:CheckMimirInfo()
end

function var_0_0.InitHeroTeamInfoViewParams(arg_6_0, arg_6_1)
	arg_6_0.needReorderTeam = true
	arg_6_0.needHideInfoBtn = false
	arg_6_0.canCleanTeam = false
	arg_6_0.canUseOwnHero = true
end

function var_0_0.InitCustomParams(arg_7_0, arg_7_1)
	return
end

function var_0_0.UpdateBar(arg_8_0)
	manager.windowBar:SwitchBar(arg_8_0.barList)
end

function var_0_0.OnSectionSelectEnter(arg_9_0)
	return
end

function var_0_0.OnSectionSelectExit(arg_10_0)
	return
end

function var_0_0.CustomCheckBeforeGotoHeroInfoUI(arg_11_0, arg_11_1)
	local var_11_0 = true
	local var_11_1 = ""

	return var_11_0, var_11_1
end

function var_0_0.GetHeroTeamInfoRoute(arg_12_0)
	return "/newHeroTeamInfo"
end

function var_0_0.GetCustomeTeamInfoParams(arg_13_0, arg_13_1)
	return {}
end

function var_0_0.GetHeroReserveProposalRoute(arg_14_0)
	return "/reservesUI"
end

function var_0_0.GetCustomeReserveProposalParams(arg_15_0)
	return {}
end

function var_0_0.CustomCheckBeforeBattle(arg_16_0)
	local var_16_0 = true
	local var_16_1 = ""

	return var_16_0, var_16_1
end

function var_0_0.GetStageData(arg_17_0)
	return BattleStageFactory.Produce(arg_17_0.stageType, arg_17_0.stageID, arg_17_0.activityID)
end

function var_0_0.LaunchBattle(arg_18_0, arg_18_1)
	BattleController.GetInstance():LaunchBattle(arg_18_1)
end

function var_0_0.CustomSaveTeam(arg_19_0)
	if ReserveTools.NeedCacheTeam(arg_19_0.stageType, arg_19_0.stageID) then
		local var_19_0 = arg_19_0:GetHeroIDList()
		local var_19_1 = arg_19_0:GetTrialIDList()

		ReserveTools.SetTeam(arg_19_0.reserveParams, var_19_0, var_19_1, arg_19_0.comboSkillID, arg_19_0.mimirID, arg_19_0.chipList)
	end
end

function var_0_0.CustomResetTeam(arg_20_0)
	ReserveAction.ResetContData(arg_20_0.reserveParams.reserveType, arg_20_0.reserveParams.contID, function()
		for iter_21_0 = 1, arg_20_0.heroPosMaxCount do
			arg_20_0.heroInfoList[iter_21_0]:SetData(0, 0, false)
		end

		arg_20_0.lockHeroList = {}
		arg_20_0.comboSkillID = 0
		arg_20_0.mimirID = 0
		arg_20_0.chipList = {}
	end)
end

function var_0_0.CustomGetTeamData(arg_22_0)
	local var_22_0, var_22_1, var_22_2, var_22_3 = ReserveTools.GetHeroList(arg_22_0.reserveParams)

	return var_22_0, var_22_1, var_22_2, var_22_3
end

function var_0_0.CustomChangeHeroTeam(arg_23_0, arg_23_1, arg_23_2)
	ReserveTools.SetHeroList(arg_23_0.reserveParams, arg_23_1, arg_23_2)
end

function var_0_0.CustomApplyRroposalHeroTeam(arg_24_0, arg_24_1, arg_24_2)
	ReserveTools.SetHeroList(arg_24_0.reserveParams, arg_24_1, arg_24_2)
end

function var_0_0.CustomRefreshHeroInfoList(arg_25_0, arg_25_1, arg_25_2, arg_25_3, arg_25_4)
	return
end

function var_0_0.CustomGetSkinCfg(arg_26_0, arg_26_1, arg_26_2, arg_26_3)
	return arg_26_0.heroInfoList[arg_26_1].heroViewProxy:GetHeroUsingSkinInfo(arg_26_2, {
		arg_26_3
	})
end

function var_0_0.CustomGetHeroPower(arg_27_0, arg_27_1, arg_27_2, arg_27_3)
	return arg_27_0.heroInfoList[arg_27_1].heroViewProxy:GetBattlePower(arg_27_2, arg_27_3)
end

function var_0_0.CustomGetHeroHP(arg_28_0, arg_28_1, arg_28_2, arg_28_3)
	local var_28_0 = 1
	local var_28_1 = 100

	return var_28_0, var_28_1
end

function var_0_0.CustomGetHeroEnergy(arg_29_0, arg_29_1, arg_29_2, arg_29_3)
	return 0
end

function var_0_0.CustomHeroBindRedPoint(arg_30_0, arg_30_1, arg_30_2)
	return
end

function var_0_0.CustomHeroUnBindRedPoint(arg_31_0, arg_31_1, arg_31_2)
	return
end

function var_0_0.CustomCheckComboSkill(arg_32_0)
	return
end

function var_0_0.CustomGetComboSkillID(arg_33_0)
	return ReserveTools.GetComboSkillID(arg_33_0.reserveParams)
end

function var_0_0.CustomSetComboSkillID(arg_34_0, arg_34_1)
	ReserveTools.SetComboSkillID(arg_34_0.reserveParams, arg_34_1)
end

function var_0_0.CustomMimirID(arg_35_0)
	return ReserveTools.GetMimirID(arg_35_0.reserveParams)
end

function var_0_0.CustomSetMimirID(arg_36_0, arg_36_1)
	ReserveTools.SetMimirID(arg_36_0.reserveParams, arg_36_1)
end

function var_0_0.CustomGetMimirChipList(arg_37_0)
	return ReserveTools.GetMimirChipList(arg_37_0.reserveParams)
end

function var_0_0.CustomInsertMimirChip(arg_38_0, arg_38_1)
	ReserveTools.InsertMimirChip(arg_38_0.reserveParams, arg_38_1)
end

function var_0_0.CustomRemoveMimirChip(arg_39_0, arg_39_1)
	ReserveTools.RemoveMimirChip(arg_39_0.reserveParams, arg_39_1)
end

function var_0_0.CustomSetMimirChipList(arg_40_0, arg_40_1)
	ReserveTools.SetMimirChipList(arg_40_0.reserveParams, arg_40_1)
end

function var_0_0.GetRaceEffect(arg_41_0)
	local var_41_0 = arg_41_0:GetHeroIDList()

	return BattleTools.GetMaxRaceData(var_41_0)
end

function var_0_0.GetStageInfoClass(arg_42_0)
	return SectionStageInfoView
end

function var_0_0.GetSelectHeroViewClass(arg_43_0)
	return SelectHeroBaseView
end

function var_0_0.GetHeroInfoItemClass(arg_44_0)
	return SectionSelectHeroInfoItem
end

function var_0_0.GetMimirInfoViewClass(arg_45_0)
	return NewSectionMimirView
end

function var_0_0.GetComboSkillViewClass(arg_46_0)
	return NewSectionComboSkillView
end

function var_0_0.GetSectionSelectHeroInfoClass(arg_47_0)
	return SectionSelectHeroInfo
end

function var_0_0.GotoHeroInfoUI(arg_48_0, arg_48_1)
	local var_48_0, var_48_1 = arg_48_0:CheckBeforeGotoHeroInfoUI(arg_48_1)

	if not var_48_0 then
		if var_48_1 then
			ShowTips(var_48_1)
		end

		return
	end

	local var_48_2 = arg_48_0:GetDefaultTeamInfoParams(arg_48_1)
	local var_48_3 = arg_48_0:GetCustomeTeamInfoParams(arg_48_1)

	for iter_48_0, iter_48_1 in pairs(var_48_3) do
		var_48_2[iter_48_0] = iter_48_1
	end

	JumpTools.OpenPageByJump(arg_48_0:GetHeroTeamInfoRoute(), var_48_2)
end

function var_0_0.CheckBeforeGotoHeroInfoUI(arg_49_0, arg_49_1)
	if not arg_49_0.canChangeTeam then
		return false, "CAN_NOT_CHANGE_HERO"
	end

	if arg_49_0.stageID and arg_49_0.stageID ~= 0 then
		local var_49_0, var_49_1 = BattleStageTools.GetRestrictHeroList(arg_49_0.stageType, arg_49_0.stageID)

		if type(var_49_0) == "table" then
			local var_49_2 = var_49_0[arg_49_1]

			if var_49_2[1] == 0 then
				return false, "CAN_NOT_CHANGE_HERO"
			end

			if HeroCfg[var_49_2[1]] and HeroTools.IsNPC(var_49_2[1]) and (type(var_49_1) ~= "table" or var_49_1[arg_49_1] == ReserveConst.RESTRICT_HERO_SWITCH_MODE.FORBID) then
				return false, "CAN_NOT_CHANGE_HERO"
			end
		end
	end

	return arg_49_0:CustomCheckBeforeGotoHeroInfoUI(arg_49_1)
end

function var_0_0.GetDefaultTeamInfoParams(arg_50_0, arg_50_1)
	return {
		isEnter = true,
		selectHeroPos = arg_50_1,
		stageID = arg_50_0.stageID,
		activityID = arg_50_0.activityID,
		stageType = arg_50_0.stageType,
		reserveParams = arg_50_0.reserveParams,
		heroDataType = arg_50_0.heroDataType,
		sectionProxy = arg_50_0,
		reorder = arg_50_0.needReorderTeam,
		hideInfoBtn = arg_50_0.needHideInfoBtn,
		canCleanTeam = arg_50_0.canCleanTeam,
		canUseOwnHero = arg_50_0.canUseOwnHero
	}
end

function var_0_0.GotoReservesProposalUI(arg_51_0)
	local var_51_0 = arg_51_0:GetDefaultReserveProposalParams()
	local var_51_1 = arg_51_0:GetCustomeReserveProposalParams()

	for iter_51_0, iter_51_1 in pairs(var_51_1) do
		var_51_0[iter_51_0] = iter_51_1
	end

	JumpTools.OpenPageByJump(arg_51_0:GetHeroReserveProposalRoute(), var_51_0)
end

function var_0_0.GetDefaultReserveProposalParams(arg_52_0)
	local var_52_0 = arg_52_0:GetHeroIDList()
	local var_52_1 = arg_52_0:GetTrialIDList()

	return {
		isEnter = true,
		stageType = arg_52_0.stageType,
		stageID = arg_52_0.stageID,
		sectionProxy = arg_52_0,
		heroList = var_52_0,
		trialList = var_52_1,
		lockHeroList = arg_52_0.lockHeroList,
		comboSkillID = arg_52_0.comboSkillID,
		mimirID = arg_52_0.mimirID,
		chipList = arg_52_0.chipList
	}
end

function var_0_0.CheckBeforeBattle(arg_53_0)
	if arg_53_0.heroInfoList[1].heroID == 0 then
		return false, "TEAM_ERROR_LEADER"
	end

	local var_53_0, var_53_1 = BattleStageTools.GetRestrictHeroList(arg_53_0.stageType, arg_53_0.stageID)

	if type(var_53_1) == "table" and var_53_1[arg_53_0.heroPosMaxCount] ~= ReserveConst.RESTRICT_HERO_SWITCH_MODE.FORBID then
		for iter_53_0 = 2, arg_53_0.heroPosMaxCount - 1 do
			if arg_53_0.heroInfoList[iter_53_0].heroID == 0 then
				return false, "TEAM_ERROR_NEED_MAX"
			end
		end
	end

	return arg_53_0:CustomCheckBeforeBattle()
end

function var_0_0.StartBattle(arg_54_0)
	local var_54_0, var_54_1 = arg_54_0:CheckBeforeBattle()

	if not var_54_0 then
		if var_54_1 then
			ShowTips(var_54_1)
		end

		return
	end

	arg_54_0:SaveTeam()

	local var_54_2 = arg_54_0:GetStageData()

	var_54_2:SetMultiple(arg_54_0.multiple)
	var_54_2:SetReserveParams(arg_54_0.reserveParams)
	var_54_2:Init()
	arg_54_0:LaunchBattle(var_54_2)
end

function var_0_0.SetReserveParams(arg_55_0, arg_55_1)
	arg_55_0.reserveParams = arg_55_1
end

function var_0_0.GetReserveParams(arg_56_0)
	return arg_56_0.reserveParams
end

function var_0_0.SaveTeam(arg_57_0)
	arg_57_0:CustomSaveTeam()
end

function var_0_0.ResetTeam(arg_58_0)
	arg_58_0:CustomResetTeam()
end

function var_0_0.GetHeroTeam(arg_59_0)
	local var_59_0, var_59_1, var_59_2, var_59_3 = arg_59_0:CustomGetTeamData()

	arg_59_0:RefreshHeroInfoList(var_59_0, var_59_3, var_59_1, var_59_2)

	local var_59_4 = {}

	for iter_59_0, iter_59_1 in ipairs(var_59_3) do
		if iter_59_1 ~= 0 then
			var_59_4[#var_59_4 + 1] = iter_59_1
		end
	end

	for iter_59_2, iter_59_3 in ipairs(arg_59_0.heroViewProxyDic) do
		iter_59_3:SetTempHeroList(var_59_4)
	end

	return var_59_0, var_59_1, var_59_2, var_59_3
end

function var_0_0.GetHeroIDList(arg_60_0)
	local var_60_0 = {}

	for iter_60_0 = 1, arg_60_0.heroPosMaxCount do
		var_60_0[iter_60_0] = arg_60_0.heroInfoList[iter_60_0].heroID
	end

	return var_60_0
end

function var_0_0.GetTrialIDList(arg_61_0)
	local var_61_0 = {}

	for iter_61_0 = 1, arg_61_0.heroPosMaxCount do
		var_61_0[iter_61_0] = arg_61_0.heroInfoList[iter_61_0].trialID
	end

	return var_61_0
end

function var_0_0.GetLockStateList(arg_62_0)
	local var_62_0 = {}

	for iter_62_0 = 1, arg_62_0.heroPosMaxCount do
		var_62_0[iter_62_0] = arg_62_0.heroInfoList[iter_62_0].isPosLock
	end

	return var_62_0
end

function var_0_0.GetLockHeroList(arg_63_0)
	return arg_63_0.lockHeroList
end

function var_0_0.ChangeHeroTeam(arg_64_0, arg_64_1, arg_64_2)
	arg_64_2 = arg_64_2 or {
		0,
		0,
		0
	}

	arg_64_0:CustomChangeHeroTeam(arg_64_1, arg_64_2)

	local var_64_0 = arg_64_0:GetLockStateList()

	arg_64_0:RefreshHeroInfoList(arg_64_1, arg_64_2, var_64_0, arg_64_0.lockHeroList)
end

function var_0_0.ApplyReserveProposal(arg_65_0, arg_65_1, arg_65_2, arg_65_3, arg_65_4, arg_65_5)
	arg_65_0:ApplyRroposalHeroTeam(arg_65_1, arg_65_2)
	arg_65_0:SetComboSkillID(arg_65_3)
	arg_65_0:SetMimirID(arg_65_4)
	arg_65_0:SetMimirChipList(arg_65_5)
end

function var_0_0.ApplyRroposalHeroTeam(arg_66_0, arg_66_1, arg_66_2)
	arg_66_0:CustomApplyRroposalHeroTeam(arg_66_1, arg_66_2)

	local var_66_0 = arg_66_0:GetLockStateList()

	arg_66_0:RefreshHeroInfoList(arg_66_1, arg_66_2, var_66_0, arg_66_0.lockHeroList)
end

function var_0_0.RefreshHeroInfoList(arg_67_0, arg_67_1, arg_67_2, arg_67_3, arg_67_4)
	for iter_67_0 = 1, arg_67_0.heroPosMaxCount do
		if not arg_67_0.heroInfoList[iter_67_0] then
			arg_67_0.heroInfoList[iter_67_0] = arg_67_0:GetSectionSelectHeroInfoClass().New()
		end

		local var_67_0 = arg_67_1[iter_67_0] or 0
		local var_67_1 = arg_67_2[iter_67_0] or 0
		local var_67_2
		local var_67_3

		if var_67_1 ~= 0 then
			var_67_2 = HeroConst.HERO_DATA_TYPE.TRIAL
		else
			var_67_2 = arg_67_0.heroDataType
		end

		local var_67_4 = arg_67_0:GreateHeroViewProxy(var_67_2)

		arg_67_0.heroInfoList[iter_67_0]:SetData(var_67_0, var_67_1, arg_67_3[iter_67_0])
		arg_67_0.heroInfoList[iter_67_0]:SetHeroDataType(var_67_2, var_67_4)
	end

	local var_67_5 = {}

	for iter_67_1, iter_67_2 in ipairs(arg_67_2) do
		if iter_67_2 ~= 0 then
			var_67_5[#var_67_5 + 1] = iter_67_2
		end
	end

	for iter_67_3, iter_67_4 in pairs(arg_67_0.heroViewProxyDic) do
		iter_67_4:SetTempHeroList(var_67_5)
	end

	arg_67_0.lockHeroList = arg_67_4

	arg_67_0:CustomRefreshHeroInfoList(arg_67_1, arg_67_2, arg_67_3, arg_67_4)
end

function var_0_0.SetHeroDataType(arg_68_0, arg_68_1)
	arg_68_0.heroDataType = arg_68_1

	arg_68_0:GreateHeroViewProxy(arg_68_1)
end

function var_0_0.GreateHeroViewProxy(arg_69_0, arg_69_1)
	if not arg_69_0.heroViewProxyDic[arg_69_1] then
		arg_69_0.heroViewProxyDic[arg_69_1] = HeroViewDataProxy.New(arg_69_1)
	end

	return arg_69_0.heroViewProxyDic[arg_69_1]
end

function var_0_0.GetHeroViewProxy(arg_70_0)
	return arg_70_0:GreateHeroViewProxy(arg_70_0.heroDataType)
end

function var_0_0.CheckComboSkill(arg_71_0)
	if arg_71_0.stageID and arg_71_0.stageID ~= 0 then
		local var_71_0 = BattleStageTools.GetStageCfg(arg_71_0.stageType, arg_71_0.stageID)

		if var_71_0 and var_71_0.combo_skill_id and var_71_0.combo_skill_id ~= 0 then
			arg_71_0.customComboSkill = var_71_0.combo_skill_id
			arg_71_0.needComboSkillPanel = true
			arg_71_0.canChangeComboSkill = true

			return
		end

		if SectionSelectHeroTools.IsAllPosFullLock(arg_71_0.stageType, arg_71_0.stageID) then
			arg_71_0.needComboSkillPanel = false
			arg_71_0.canChangeComboSkill = false
		end
	end

	arg_71_0:CustomCheckComboSkill()
end

function var_0_0.GetComboSkillID(arg_72_0)
	arg_72_0.comboSkillID = arg_72_0:CustomGetComboSkillID()

	return arg_72_0.comboSkillID
end

function var_0_0.SetComboSkillID(arg_73_0, arg_73_1)
	arg_73_0.comboSkillID = arg_73_1

	arg_73_0:CustomSetComboSkillID(arg_73_1)
end

function var_0_0.CheckMimirInfo(arg_74_0)
	if arg_74_0.stageID and arg_74_0.stageID ~= 0 then
		local var_74_0 = BattleStageTools.GetStageCfg(arg_74_0.stageType, arg_74_0.stageID)

		if var_74_0 and type(var_74_0.chip_list) == "table" then
			arg_74_0.canChangeMimir = false
		end
	end
end

function var_0_0.GetMimirID(arg_75_0)
	local var_75_0

	if arg_75_0.stageID and arg_75_0.stageID ~= 0 then
		local var_75_1 = BattleStageTools.GetStageCfg(arg_75_0.stageType, arg_75_0.stageID)

		if var_75_1 and type(var_75_1.chip_list) == "table" then
			var_75_0 = var_75_1.chip_list[1]
			arg_75_0.chipList = {}

			for iter_75_0 = 2, 3 do
				arg_75_0.chipList[iter_75_0 - 1] = var_75_1.chip_list[iter_75_0]
			end
		else
			var_75_0 = arg_75_0:CustomMimirID()
		end
	else
		var_75_0 = arg_75_0:CustomMimirID()
	end

	arg_75_0.mimirID = var_75_0

	return arg_75_0.mimirID
end

function var_0_0.SetMimirID(arg_76_0, arg_76_1)
	arg_76_0.mimirID = arg_76_1

	arg_76_0:CustomSetMimirID(arg_76_1)
end

function var_0_0.GetMimirChipList(arg_77_0)
	local var_77_0

	if arg_77_0.stageID and arg_77_0.stageID ~= 0 then
		local var_77_1 = BattleStageTools.GetStageCfg(arg_77_0.stageType, arg_77_0.stageID)

		if var_77_1 and type(var_77_1.chip_list) == "table" then
			var_77_0 = {}

			for iter_77_0 = 2, 3 do
				var_77_0[iter_77_0 - 1] = var_77_1.chip_list[iter_77_0]
			end
		else
			var_77_0 = arg_77_0:CustomGetMimirChipList()
		end
	else
		var_77_0 = arg_77_0:CustomGetMimirChipList()
	end

	arg_77_0.chipList = var_77_0

	return arg_77_0.chipList
end

function var_0_0.InsertMimirChip(arg_78_0, arg_78_1)
	arg_78_0:CustomInsertMimirChip(arg_78_1)
	arg_78_0:GetMimirChipList()
end

function var_0_0.RemoveMimirChip(arg_79_0, arg_79_1)
	arg_79_0:CustomRemoveMimirChip(arg_79_1)
	arg_79_0:GetMimirChipList()
end

function var_0_0.SetMimirChipList(arg_80_0, arg_80_1)
	arg_80_0:CustomSetMimirChipList(arg_80_1)
	arg_80_0:GetMimirChipList()
end

return var_0_0
