﻿local var_0_0 = class("ReserveBaseTemplate")

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.team_type = arg_1_1 or ReserveConst.RESERVE_TYPE.DEFAULT
	arg_1_0.cont_teams = {}
	arg_1_0.cont_dic = {}
end

function var_0_0.UpdateServerData(arg_2_0, arg_2_1)
	arg_2_0.team_type = arg_2_1.team_type

	for iter_2_0, iter_2_1 in ipairs(arg_2_1.cont_teams) do
		local var_2_0 = iter_2_1.cont_id

		arg_2_0:GetContDataTemplateById(var_2_0):UpdateServerData(iter_2_1)
	end
end

function var_0_0.GetTeamType(arg_3_0)
	return arg_3_0.team_type
end

function var_0_0.SetHeroList(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
	arg_4_0:GetContDataTemplateById(arg_4_1.contID):SetHeroList(arg_4_2, arg_4_3, arg_4_1.teamIndex)
end

function var_0_0.GetHeroList(arg_5_0, arg_5_1)
	local var_5_0 = {
		isInVaild = false,
		resultHeroList = {
			0,
			0,
			0
		},
		lockStateList = {
			false,
			false,
			false
		},
		lockHeroList = {},
		resultTrialList = {
			0,
			0,
			0
		}
	}

	if arg_5_1.reserveType ~= ReserveConst.RESERVE_TYPE.NOT_NEED_RESERVE then
		local var_5_1 = arg_5_0:GetContDataTemplateById(arg_5_1.contID):GetHeroList(arg_5_1.teamIndex)

		arg_5_0:FormatHeroList(arg_5_1, var_5_0, var_5_1)

		if arg_5_1.needDefaultTeam and arg_5_0:IsEmptyTeam(var_5_0) then
			arg_5_0:FillDefaultTeam(arg_5_1, var_5_0)
		end
	end

	arg_5_0:FilterInvalidTeamData(arg_5_1, var_5_0)
	arg_5_0:GetLockHero(arg_5_1, var_5_0)
	arg_5_0:FilterLockHero(arg_5_1, var_5_0)
	arg_5_0:ReorderHeroList(arg_5_1, var_5_0)

	return var_5_0.resultHeroList, var_5_0.lockStateList, var_5_0.lockHeroList, var_5_0.resultTrialList, var_5_0.isInVaild
end

function var_0_0.FormatHeroList(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
	for iter_6_0, iter_6_1 in ipairs(arg_6_3) do
		arg_6_2.resultHeroList[iter_6_0] = iter_6_1:GetHeroID()
		arg_6_2.resultTrialList[iter_6_0] = iter_6_1:GetTrialID()
	end
end

function var_0_0.IsEmptyTeam(arg_7_0, arg_7_1)
	return SectionSelectHeroTools.IsEmptyTeam(arg_7_1.resultHeroList)
end

function var_0_0.FilterInvalidTeamData(arg_8_0, arg_8_1, arg_8_2)
	local var_8_0, var_8_1 = SectionSelectHeroTools.GetRestrictHeroList(arg_8_1.stageType, arg_8_1.stageID)
	local var_8_2, var_8_3 = SectionSelectHeroTools.GetRestrictHeroPosDic(arg_8_1.stageType, arg_8_1.stageID)
	local var_8_4 = clone(arg_8_2.resultTrialList)

	for iter_8_0, iter_8_1 in ipairs(var_8_4) do
		if iter_8_1 ~= 0 then
			if var_8_0[iter_8_0][1] ~= nil then
				if var_8_1[iter_8_0] ~= ReserveConst.RESTRICT_HERO_SWITCH_MODE.FORBID and (not var_8_3[iter_8_1] or var_8_3[iter_8_1] ~= iter_8_0) then
					arg_8_2.resultTrialList[iter_8_0] = 0
					arg_8_2.resultHeroList[iter_8_0] = 0
					arg_8_2.isInVaild = true
				end
			else
				local var_8_5 = arg_8_0:GetTrialHeroList(arg_8_1)

				if not table.keyof(var_8_5, iter_8_1) then
					arg_8_2.resultTrialList[iter_8_0] = 0
					arg_8_2.resultHeroList[iter_8_0] = 0
					arg_8_2.isInVaild = true
				end
			end
		end
	end
end

function var_0_0.GetLockHero(arg_9_0, arg_9_1, arg_9_2)
	local var_9_0 = {}
	local var_9_1 = {}
	local var_9_2
	local var_9_3
	local var_9_4, var_9_5 = SectionSelectHeroTools.GetRestrictHeroList(arg_9_1.stageType, arg_9_1.stageID)
	local var_9_6

	if arg_9_1.stageType and arg_9_1.stageID and arg_9_1.stageID ~= 0 then
		local var_9_7 = BattleStageTools.GetStageCfg(arg_9_1.stageType, arg_9_1.stageID)

		var_9_6 = var_9_7.auto_next_stage_group and var_9_7.auto_next_stage_group > 0
	end

	local var_9_8 = SectionSelectHeroTools.GetRestrictHeroPosDic(arg_9_1.stageType, arg_9_1.stageID)

	for iter_9_0 = 1, 3 do
		local var_9_9 = var_9_4[iter_9_0][1]
		local var_9_10 = var_9_4[iter_9_0][2]

		if var_9_9 then
			if var_9_9 ~= 0 then
				if not var_9_6 and var_9_5[iter_9_0] and var_9_5[iter_9_0] == ReserveConst.CAN_SWITCH_RESTRICT_HERO then
					local var_9_11 = arg_9_2.resultHeroList[iter_9_0]

					if var_9_11 == 0 or not var_9_8[var_9_11] or var_9_8[var_9_11] ~= iter_9_0 then
						var_9_0[iter_9_0] = var_9_9
						var_9_1[iter_9_0] = var_9_10
					else
						var_9_0[iter_9_0] = arg_9_2.resultHeroList[iter_9_0]
						var_9_1[iter_9_0] = arg_9_2.resultTrialList[iter_9_0]
					end
				else
					var_9_0[iter_9_0] = var_9_9
					var_9_1[iter_9_0] = var_9_10
					arg_9_2.lockStateList[iter_9_0] = true
				end
			else
				var_9_0[iter_9_0] = 0
				var_9_1[iter_9_0] = 0
				arg_9_2.lockStateList[iter_9_0] = true
			end
		else
			local var_9_12 = arg_9_2.resultHeroList[iter_9_0]

			if var_9_8[var_9_12] and var_9_8[var_9_12] ~= iter_9_0 then
				var_9_0[iter_9_0] = 0
				var_9_1[iter_9_0] = 0
			else
				var_9_0[iter_9_0] = arg_9_2.resultHeroList[iter_9_0]
				var_9_1[iter_9_0] = arg_9_2.resultTrialList[iter_9_0]
			end
		end
	end

	arg_9_2.resultHeroList = var_9_0
	arg_9_2.resultTrialList = var_9_1
end

function var_0_0.FilterLockHero(arg_10_0, arg_10_1, arg_10_2)
	arg_10_1.filterLockHeroList = {}

	for iter_10_0, iter_10_1 in ipairs(arg_10_2.resultTrialList) do
		if iter_10_1 ~= 0 and table.keyof(arg_10_2.lockHeroList, iter_10_1) then
			table.insert(arg_10_1.filterLockHeroList, iter_10_1)

			arg_10_2.resultTrialList[iter_10_0] = 0
			arg_10_2.resultHeroList[iter_10_0] = 0
			arg_10_2.isInVaild = true
		end
	end

	for iter_10_2, iter_10_3 in ipairs(arg_10_2.resultHeroList) do
		if iter_10_3 ~= 0 and table.keyof(arg_10_2.lockHeroList, iter_10_3) then
			table.insert(arg_10_1.filterLockHeroList, iter_10_3)

			arg_10_2.resultHeroList[iter_10_2] = 0
			arg_10_2.isInVaild = true
		end
	end
end

function var_0_0.ReorderHeroList(arg_11_0, arg_11_1, arg_11_2)
	if arg_11_2.isInVaild then
		local var_11_0, var_11_1 = SectionSelectHeroTools.GetRestrictHeroList(arg_11_1.stageType, arg_11_1.stageID)

		SectionSelectHeroTools.ReorderHeroTeam(arg_11_2.resultHeroList, arg_11_2.resultTrialList, var_11_1)
	end
end

function var_0_0.GetTrialHeroList(arg_12_0, arg_12_1)
	local var_12_0 = 0

	if arg_12_1.customData and arg_12_1.customData.activityID then
		var_12_0 = arg_12_1.customData.activityID
	end

	return GetTrialHeroList(arg_12_1.stageType, arg_12_1.stageID, var_12_0)
end

function var_0_0.FillDefaultTeam(arg_13_0, arg_13_1, arg_13_2)
	local var_13_0 = ReserveParams.New(ReserveConst.RESERVE_TYPE.DEFAULT)

	arg_13_0:GetDefaultTeam(arg_13_1, arg_13_2)

	local var_13_1 = ReserveTools.GetComboSkillID(var_13_0)
	local var_13_2 = ReserveTools.GetMimirID(var_13_0)
	local var_13_3 = ReserveTools.GetMimirChipList(var_13_0)

	ReserveTools.SetHeroList(arg_13_1, arg_13_2.resultHeroList, arg_13_2.resultTrialList)
	ReserveTools.SetComboSkillID(arg_13_1, var_13_1)
	ReserveTools.SetMimirID(arg_13_1, var_13_2)
	ReserveTools.SetMimirChipList(arg_13_1, var_13_3)
end

function var_0_0.GetDefaultTeam(arg_14_0, arg_14_1, arg_14_2)
	arg_14_2.resultHeroList, arg_14_2.lockStateList, arg_14_2.lockHeroList, arg_14_2.resultTrialList, arg_14_2.isInVaild = ReserveTools.GetHeroList(ReserveParams.New(ReserveConst.RESERVE_TYPE.DEFAULT))
end

function var_0_0.GetAddedHeroIDList(arg_15_0, arg_15_1)
	return arg_15_0:GetContDataTemplateById(arg_15_1.contID):GetAddedHeroIDList(arg_15_1.teamIndex)
end

function var_0_0.GetComboSkillID(arg_16_0, arg_16_1)
	local var_16_0 = arg_16_0:GetConfigComboSkillID(arg_16_1)

	if var_16_0 then
		return var_16_0
	end

	return arg_16_0:GetValidComboSkillID(arg_16_1)
end

function var_0_0.GetRawComboSkillID(arg_17_0, arg_17_1)
	return arg_17_0:GetContDataTemplateById(arg_17_1.contID):GetComboSkillID(arg_17_1.teamIndex)
end

function var_0_0.SetComboSkillID(arg_18_0, arg_18_1, arg_18_2)
	arg_18_0:GetContDataTemplateById(arg_18_1.contID):SetComboSkillID(arg_18_2, arg_18_1.teamIndex)
end

function var_0_0.GetValidComboSkillID(arg_19_0, arg_19_1, arg_19_2)
	local var_19_0 = ReserveTools.GetRawComboSkillID(arg_19_1)
	local var_19_1 = arg_19_2 or ReserveTools.GetHeroList(arg_19_1)

	if not arg_19_0:IsValidComboSKillID(var_19_0, var_19_1) then
		return ComboSkillTools.GetRecommendSkillID(var_19_1, true)
	end

	return var_19_0
end

function var_0_0.IsValidComboSKillID(arg_20_0, arg_20_1, arg_20_2)
	local var_20_0 = arg_20_2 or {}

	if arg_20_1 ~= 0 and not ComboSkillTools.IsAllMatch(arg_20_1, var_20_0) then
		return false
	end

	return true
end

function var_0_0.GetConfigComboSkillID(arg_21_0, arg_21_1)
	if arg_21_1.stageID and arg_21_1.stageID ~= 0 then
		local var_21_0 = BattleStageTools.GetStageCfg(arg_21_1.stageType, arg_21_1.stageID)

		if var_21_0 and var_21_0.combo_skill_id and var_21_0.combo_skill_id ~= 0 then
			return var_21_0.combo_skill_id
		end

		if SectionSelectHeroTools.IsAllPosFullLock(arg_21_1.stageType, arg_21_1.stageID) then
			return ReserveConst.DEFAULT_COMBO_SKILL_ID
		end
	end

	return nil
end

function var_0_0.GetMimirData(arg_22_0, arg_22_1)
	local var_22_0 = arg_22_0:GetMimirID(arg_22_1)
	local var_22_1 = arg_22_0:GetMimirChipList(arg_22_1)

	return var_22_0, var_22_1
end

function var_0_0.GetMimirID(arg_23_0, arg_23_1)
	return arg_23_0:GetContDataTemplateById(arg_23_1.contID):GetMimirID(arg_23_1.teamIndex)
end

function var_0_0.SetMimirID(arg_24_0, arg_24_1, arg_24_2)
	arg_24_0:GetContDataTemplateById(arg_24_1.contID):SetMimirID(arg_24_2, arg_24_1.teamIndex)
end

function var_0_0.GetMimirChipList(arg_25_0, arg_25_1)
	return arg_25_0:GetContDataTemplateById(arg_25_1.contID):GetMimirChipList(arg_25_1.teamIndex)
end

function var_0_0.SetMimirChipList(arg_26_0, arg_26_1, arg_26_2)
	return arg_26_0:GetContDataTemplateById(arg_26_1.contID):SetMimirChipList(arg_26_2, arg_26_1.teamIndex)
end

function var_0_0.ResetMimirChipList(arg_27_0, arg_27_1)
	arg_27_0:GetContDataTemplateById(arg_27_1.contID):ResetMimirChipList(arg_27_1.teamIndex)
end

function var_0_0.GetContDataTemplateById(arg_28_0, arg_28_1)
	arg_28_1 = arg_28_1 or ReserveConst.DETAULT_CONT_ID

	if not arg_28_0.cont_dic[arg_28_1] then
		arg_28_0.cont_dic[arg_28_1] = arg_28_0:GetContDataTemplateClass().New(arg_28_0:GetTeamType(), arg_28_1)
		arg_28_0.cont_teams[#arg_28_0.cont_teams + 1] = arg_28_0.cont_dic[arg_28_1]
	end

	return arg_28_0.cont_dic[arg_28_1]
end

function var_0_0.GetSingleTeamData(arg_29_0, arg_29_1)
	local var_29_0 = arg_29_1.contID or ReserveTools.GetContID(arg_29_1.stageType, arg_29_1.stageID)
	local var_29_1 = arg_29_1.teamIndex or arg_29_0:GetTeamIndex(arg_29_1)

	return (arg_29_0:GetContDataTemplateById(var_29_0):GetSingleTeamData(var_29_1))
end

function var_0_0.CopyContData(arg_30_0, arg_30_1, arg_30_2)
	local var_30_0 = arg_30_2:Clone()

	var_30_0:SetContID(arg_30_1)

	for iter_30_0, iter_30_1 in ipairs(arg_30_0.cont_teams) do
		if iter_30_1:GetContID() == arg_30_1 then
			arg_30_0.cont_teams[iter_30_0] = var_30_0

			break
		end
	end

	arg_30_0.cont_dic[arg_30_1] = var_30_0
end

function var_0_0.CleanCacheData(arg_31_0)
	for iter_31_0, iter_31_1 in ipairs(arg_31_0.cont_teams) do
		iter_31_1:CleanCacheData()
	end
end

function var_0_0.GetTeamIndex(arg_32_0, arg_32_1)
	return ReserveConst.DEFAULT_TEAM_INDEX
end

function var_0_0.GetContDataTemplateClass(arg_33_0)
	return ReserveTools.GetContDataClass(arg_33_0:GetTeamType())
end

function var_0_0.Clone(arg_34_0)
	return deepClone(arg_34_0)
end

return var_0_0
