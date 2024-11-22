local var_0_0 = class("ReserveBaseTemplate")

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
			arg_5_0:GetDefaultTeam(arg_5_1, var_5_0)
		end
	end

	arg_5_0:FilterInvalidTeamData(arg_5_1, var_5_0)
	arg_5_0:GetLockHero(arg_5_1, var_5_0)
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

function var_0_0.GetLockHero(arg_8_0, arg_8_1, arg_8_2)
	local var_8_0 = {}
	local var_8_1 = {}
	local var_8_2
	local var_8_3
	local var_8_4, var_8_5 = SectionSelectHeroTools.GetRestrictHeroList(arg_8_1.stageType, arg_8_1.stageID)
	local var_8_6

	if arg_8_1.stageType and arg_8_1.stageID and arg_8_1.stageID ~= 0 then
		local var_8_7 = BattleStageTools.GetStageCfg(arg_8_1.stageType, arg_8_1.stageID)

		var_8_6 = var_8_7.auto_next_stage_group and var_8_7.auto_next_stage_group > 0
	end

	local var_8_8 = SectionSelectHeroTools.GetRestrictHeroPosDic(arg_8_1.stageType, arg_8_1.stageID)

	for iter_8_0 = 1, 3 do
		local var_8_9 = var_8_4[iter_8_0][1]
		local var_8_10 = var_8_4[iter_8_0][2]

		if var_8_9 then
			if var_8_9 ~= 0 then
				if not var_8_6 and var_8_5[iter_8_0] and var_8_5[iter_8_0] == ReserveConst.CAN_SWITCH_RESTRICT_HERO then
					local var_8_11 = arg_8_2.resultHeroList[iter_8_0]

					if var_8_11 == 0 or not var_8_8[var_8_11] or var_8_8[var_8_11] ~= iter_8_0 then
						var_8_0[iter_8_0] = var_8_9
						var_8_1[iter_8_0] = var_8_10
					else
						var_8_0[iter_8_0] = arg_8_2.resultHeroList[iter_8_0]
						var_8_1[iter_8_0] = arg_8_2.resultTrialList[iter_8_0]
					end
				else
					var_8_0[iter_8_0] = var_8_9
					var_8_1[iter_8_0] = var_8_10
					arg_8_2.lockStateList[iter_8_0] = true
				end
			else
				var_8_0[iter_8_0] = 0
				var_8_1[iter_8_0] = 0
				arg_8_2.lockStateList[iter_8_0] = true
			end
		else
			local var_8_12 = arg_8_2.resultHeroList[iter_8_0]

			if var_8_8[var_8_12] and var_8_8[var_8_12] ~= iter_8_0 then
				var_8_0[iter_8_0] = 0
				var_8_1[iter_8_0] = 0
			else
				var_8_0[iter_8_0] = arg_8_2.resultHeroList[iter_8_0]
				var_8_1[iter_8_0] = arg_8_2.resultTrialList[iter_8_0]
			end
		end
	end

	arg_8_2.resultHeroList = var_8_0
	arg_8_2.resultTrialList = var_8_1
end

function var_0_0.FilterInvalidTeamData(arg_9_0, arg_9_1, arg_9_2)
	local var_9_0, var_9_1 = SectionSelectHeroTools.GetRestrictHeroList(arg_9_1.stageType, arg_9_1.stageID)
	local var_9_2, var_9_3 = SectionSelectHeroTools.GetRestrictHeroPosDic(arg_9_1.stageType, arg_9_1.stageID)
	local var_9_4 = clone(arg_9_2.resultTrialList)

	for iter_9_0, iter_9_1 in ipairs(var_9_4) do
		if iter_9_1 ~= 0 then
			if var_9_0[iter_9_0][1] ~= nil then
				if var_9_1[iter_9_0] ~= ReserveConst.RESTRICT_HERO_SWITCH_MODE.FORBID and (not var_9_3[iter_9_1] or var_9_3[iter_9_1] ~= iter_9_0) then
					arg_9_2.resultTrialList[iter_9_0] = 0
					arg_9_2.resultHeroList[iter_9_0] = 0
					arg_9_2.isInVaild = true
				end
			else
				local var_9_5 = arg_9_0:GetTrialHeroList(arg_9_1)

				if not table.keyof(var_9_5, iter_9_1) then
					arg_9_2.resultTrialList[iter_9_0] = 0
					arg_9_2.resultHeroList[iter_9_0] = 0
					arg_9_2.isInVaild = true
				end
			end
		end
	end
end

function var_0_0.ReorderHeroList(arg_10_0, arg_10_1, arg_10_2)
	if arg_10_2.isInVaild then
		local var_10_0, var_10_1 = SectionSelectHeroTools.GetRestrictHeroList(arg_10_1.stageType, arg_10_1.stageID)

		SectionSelectHeroTools.ReorderHeroTeam(arg_10_2.resultHeroList, arg_10_2.resultTrialList, var_10_1)
	end
end

function var_0_0.GetTrialHeroList(arg_11_0, arg_11_1)
	local var_11_0 = 0

	if arg_11_1.customData and arg_11_1.customData.activityID then
		var_11_0 = arg_11_1.customData.activityID
	end

	return GetTrialHeroList(arg_11_1.stageType, arg_11_1.stageID, var_11_0)
end

function var_0_0.GetDefaultTeam(arg_12_0, arg_12_1, arg_12_2)
	arg_12_2.resultHeroList, arg_12_2.lockStateList, arg_12_2.lockHeroList, arg_12_2.resultTrialList, arg_12_2.isInVaild = ReserveTools.GetHeroList(ReserveParams.New(ReserveConst.RESERVE_TYPE.DEFAULT))
end

function var_0_0.GetComboSkillID(arg_13_0, arg_13_1)
	if arg_13_1.stageID and arg_13_1.stageID ~= 0 then
		local var_13_0 = BattleStageTools.GetStageCfg(arg_13_1.stageType, arg_13_1.stageID)

		if var_13_0 and var_13_0.combo_skill_id and var_13_0.combo_skill_id ~= 0 then
			return var_13_0.combo_skill_id
		end

		if SectionSelectHeroTools.IsAllPosFullLock(arg_13_1.stageType, arg_13_1.stageID) then
			return ReserveConst.DEFAULT_COMBO_SKILL_ID
		end
	end

	local var_13_1 = arg_13_0:GetContDataTemplateById(arg_13_1.contID):GetComboSkillID(arg_13_1.teamIndex)
	local var_13_2 = ReserveTools.GetHeroList(arg_13_1)

	if var_13_1 ~= 0 and not ComboSkillTools.IsAllMatch(var_13_1, var_13_2) then
		return ComboSkillTools.GetRecommendSkillID(var_13_2, true)
	end

	return var_13_1
end

function var_0_0.SetComboSkillID(arg_14_0, arg_14_1, arg_14_2)
	arg_14_0:GetContDataTemplateById(arg_14_1.contID):SetComboSkillID(arg_14_2, arg_14_1.teamIndex)
end

function var_0_0.GetMimirData(arg_15_0, arg_15_1)
	local var_15_0 = arg_15_0:GetMimirID(arg_15_1)
	local var_15_1 = arg_15_0:GetMimirChipList(arg_15_1)

	return var_15_0, var_15_1
end

function var_0_0.GetMimirID(arg_16_0, arg_16_1)
	return arg_16_0:GetContDataTemplateById(arg_16_1.contID):GetMimirID(arg_16_1.teamIndex)
end

function var_0_0.SetMimirID(arg_17_0, arg_17_1, arg_17_2)
	arg_17_0:GetContDataTemplateById(arg_17_1.contID):SetMimirID(arg_17_2, arg_17_1.teamIndex)
end

function var_0_0.GetMimirChipList(arg_18_0, arg_18_1)
	return arg_18_0:GetContDataTemplateById(arg_18_1.contID):GetMimirChipList(arg_18_1.teamIndex)
end

function var_0_0.SetMimirChipList(arg_19_0, arg_19_1, arg_19_2)
	return arg_19_0:GetContDataTemplateById(arg_19_1.contID):SetMimirChipList(arg_19_2, arg_19_1.teamIndex)
end

function var_0_0.ResetMimirChipList(arg_20_0, arg_20_1)
	arg_20_0:GetContDataTemplateById(arg_20_1.contID):ResetMimirChipList(arg_20_1.teamIndex)
end

function var_0_0.GetContDataTemplateById(arg_21_0, arg_21_1)
	arg_21_1 = arg_21_1 or ReserveConst.DETAULT_CONT_ID

	if not arg_21_0.cont_dic[arg_21_1] then
		arg_21_0.cont_dic[arg_21_1] = arg_21_0:GetContDataTemplateClass().New(arg_21_0:GetTeamType(), arg_21_1)
		arg_21_0.cont_teams[#arg_21_0.cont_teams + 1] = arg_21_0.cont_dic[arg_21_1]
	end

	return arg_21_0.cont_dic[arg_21_1]
end

function var_0_0.GetSingleTeamData(arg_22_0, arg_22_1)
	local var_22_0 = arg_22_1.contID or ReserveTools.GetContID(arg_22_1.stageType, arg_22_1.stageID)
	local var_22_1 = arg_22_1.teamIndex or arg_22_0:GetTeamIndex(arg_22_1)

	return (arg_22_0:GetContDataTemplateById(var_22_0):GetSingleTeamData(var_22_1))
end

function var_0_0.CleanCacheData(arg_23_0)
	for iter_23_0, iter_23_1 in ipairs(arg_23_0.cont_teams) do
		iter_23_1:CleanCacheData()
	end
end

function var_0_0.GetTeamIndex(arg_24_0, arg_24_1)
	return ReserveConst.DEFAULT_TEAM_INDEX
end

function var_0_0.GetContDataTemplateClass(arg_25_0)
	return ReserveTools.GetContDataClass(arg_25_0:GetTeamType())
end

function var_0_0.Clone(arg_26_0)
	return deepClone(arg_26_0)
end

return var_0_0
