local var_0_0 = class("ReserveContDataTemplate")

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.team_type = arg_1_1 or ReserveConst.RESERVE_TYPE.DEFAULT
	arg_1_0.cont_id = arg_1_2 or ReserveConst.DETAULT_CONT_ID
	arg_1_0.teams = {}
	arg_1_0.team_dic = {}
	arg_1_0.is_dirty = false
end

function var_0_0.UpdateServerData(arg_2_0, arg_2_1)
	arg_2_0.cont_id = arg_2_1.cont_id

	for iter_2_0, iter_2_1 in ipairs(arg_2_1.teams) do
		local var_2_0 = iter_2_1.team_index

		arg_2_0:GetSingleTeamData(var_2_0):UpdateServerData(iter_2_1)
	end
end

function var_0_0.SetTeamType(arg_3_0, arg_3_1)
	arg_3_0.team_type = arg_3_1
end

function var_0_0.GetTeamType(arg_4_0)
	return arg_4_0.team_type
end

function var_0_0.GetContID(arg_5_0)
	return arg_5_0.cont_id
end

function var_0_0.GetIsDirty(arg_6_0)
	return arg_6_0.is_dirty
end

function var_0_0.SetIsDirty(arg_7_0, arg_7_1)
	arg_7_0.is_dirty = arg_7_1
end

function var_0_0.GetHeroList(arg_8_0, arg_8_1)
	return arg_8_0:GetSingleTeamData(arg_8_1):GetHeroList()
end

function var_0_0.SetHeroList(arg_9_0, arg_9_1, arg_9_2, arg_9_3)
	arg_9_0:SetIsDirty(true)
	arg_9_0:GetSingleTeamData(arg_9_3):SetHeroList(arg_9_1, arg_9_2)
end

function var_0_0.GetComboSkillID(arg_10_0, arg_10_1)
	return arg_10_0:GetSingleTeamData(arg_10_1):GetComboSkillID()
end

function var_0_0.SetComboSkillID(arg_11_0, arg_11_1, arg_11_2)
	arg_11_0:SetIsDirty(true)
	arg_11_0:GetSingleTeamData(arg_11_2):SetComboSkillID(arg_11_1)
end

function var_0_0.GetMimirID(arg_12_0, arg_12_1)
	return arg_12_0:GetSingleTeamData(arg_12_1):GetMimirID()
end

function var_0_0.SetMimirID(arg_13_0, arg_13_1, arg_13_2)
	arg_13_0:SetIsDirty(true)
	arg_13_0:GetSingleTeamData(arg_13_2):SetMimirID(arg_13_1)
end

function var_0_0.GetMimirChipList(arg_14_0, arg_14_1)
	return arg_14_0:GetSingleTeamData(arg_14_1):GetMimirChipList()
end

function var_0_0.SetMimirChipList(arg_15_0, arg_15_1, arg_15_2)
	arg_15_0:SetIsDirty(true)
	arg_15_0:GetSingleTeamData(arg_15_2):SetMimirChipList(arg_15_1)
end

function var_0_0.ResetMimirChipList(arg_16_0, arg_16_1)
	arg_16_0:GetSingleTeamData(arg_16_1):ResetMimirChipList()
end

function var_0_0.GetTeamDataList(arg_17_0)
	return arg_17_0.teams
end

function var_0_0.GetSingleTeamData(arg_18_0, arg_18_1)
	arg_18_1 = arg_18_1 or arg_18_0:GetTeamIndex()

	if not arg_18_0.team_dic[arg_18_1] then
		arg_18_0.team_dic[arg_18_1] = arg_18_0:GetSingleTeamDataTemplateClass().New(arg_18_0:GetTeamType(), arg_18_1)
		arg_18_0.teams[#arg_18_0.teams + 1] = arg_18_0.team_dic[arg_18_1]
	end

	return arg_18_0.team_dic[arg_18_1]
end

function var_0_0.SwapTeam(arg_19_0, arg_19_1, arg_19_2)
	local var_19_0 = arg_19_0:GetSingleTeamData(arg_19_1)
	local var_19_1 = arg_19_0:GetSingleTeamData(arg_19_2)

	var_19_0:SetTeamIndex(arg_19_2)

	arg_19_0.team_dic[arg_19_2] = var_19_0

	var_19_1:SetTeamIndex(arg_19_1)

	arg_19_0.team_dic[arg_19_1] = var_19_1
end

function var_0_0.GetTeamIndex(arg_20_0)
	return ReserveConst.DEFAULT_TEAM_INDEX
end

function var_0_0.GetTeamCount(arg_21_0)
	return #arg_21_0.teams
end

function var_0_0.CleanCacheData(arg_22_0)
	if not arg_22_0:GetIsDirty() then
		return
	end

	local var_22_0 = ReserveTools.GetReserveTemplateByReserveType(arg_22_0:GetTeamType(), true):GetContDataTemplateById(arg_22_0:GetContID())

	for iter_22_0, iter_22_1 in pairs(arg_22_0.team_dic) do
		iter_22_1:UpdateServerData(var_22_0:GetSingleTeamData(iter_22_0))
	end

	arg_22_0:SetIsDirty(false)
end

function var_0_0.Clone(arg_23_0)
	return deepClone(arg_23_0)
end

function var_0_0.GetSingleTeamDataTemplateClass(arg_24_0)
	return ReserveTools.GetSingleTeamDataClass(arg_24_0:GetTeamType())
end

function var_0_0.ConvertToSendData(arg_25_0)
	local var_25_0 = {
		cont_id = arg_25_0:GetContID(),
		teams = {}
	}

	for iter_25_0, iter_25_1 in ipairs(arg_25_0.team_dic) do
		var_25_0.teams[iter_25_0] = iter_25_1:ConvertToSendData()
	end

	return var_25_0
end

function var_0_0.ConverAllTeamToSendData(arg_26_0)
	local var_26_0 = {
		cont_id = arg_26_0:GetContID(),
		teams = {}
	}

	for iter_26_0, iter_26_1 in ipairs(arg_26_0.teams) do
		var_26_0.teams[iter_26_0] = iter_26_1:ConvertToSendData()
	end

	return var_26_0
end

function var_0_0.Reset(arg_27_0)
	for iter_27_0, iter_27_1 in pairs(arg_27_0.team_dic) do
		iter_27_1:Reset()
	end

	arg_27_0.teams = {}
	arg_27_0.team_dic = {}
	arg_27_0.is_dirty = false
end

return var_0_0
