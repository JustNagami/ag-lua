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

function var_0_0.SetContID(arg_6_0, arg_6_1)
	arg_6_0.cont_id = arg_6_1
end

function var_0_0.GetIsDirty(arg_7_0)
	return arg_7_0.is_dirty
end

function var_0_0.SetIsDirty(arg_8_0, arg_8_1)
	arg_8_0.is_dirty = arg_8_1
end

function var_0_0.GetHeroList(arg_9_0, arg_9_1)
	return arg_9_0:GetSingleTeamData(arg_9_1):GetHeroList()
end

function var_0_0.SetHeroList(arg_10_0, arg_10_1, arg_10_2, arg_10_3)
	arg_10_0:SetIsDirty(true)
	arg_10_0:GetSingleTeamData(arg_10_3):SetHeroList(arg_10_1, arg_10_2)
end

function var_0_0.GetAddedHeroIDList(arg_11_0, arg_11_1)
	return arg_11_0:GetSingleTeamData(arg_11_1):GetAddedHeroIDList()
end

function var_0_0.GetComboSkillID(arg_12_0, arg_12_1)
	return arg_12_0:GetSingleTeamData(arg_12_1):GetComboSkillID()
end

function var_0_0.SetComboSkillID(arg_13_0, arg_13_1, arg_13_2)
	arg_13_0:SetIsDirty(true)
	arg_13_0:GetSingleTeamData(arg_13_2):SetComboSkillID(arg_13_1)
end

function var_0_0.GetMimirID(arg_14_0, arg_14_1)
	return arg_14_0:GetSingleTeamData(arg_14_1):GetMimirID()
end

function var_0_0.SetMimirID(arg_15_0, arg_15_1, arg_15_2)
	arg_15_0:SetIsDirty(true)
	arg_15_0:GetSingleTeamData(arg_15_2):SetMimirID(arg_15_1)
end

function var_0_0.GetMimirChipList(arg_16_0, arg_16_1)
	return arg_16_0:GetSingleTeamData(arg_16_1):GetMimirChipList()
end

function var_0_0.SetMimirChipList(arg_17_0, arg_17_1, arg_17_2)
	arg_17_0:SetIsDirty(true)
	arg_17_0:GetSingleTeamData(arg_17_2):SetMimirChipList(arg_17_1)
end

function var_0_0.ResetMimirChipList(arg_18_0, arg_18_1)
	arg_18_0:GetSingleTeamData(arg_18_1):ResetMimirChipList()
end

function var_0_0.GetTeamDataList(arg_19_0)
	return arg_19_0.teams
end

function var_0_0.GetSingleTeamData(arg_20_0, arg_20_1)
	arg_20_1 = arg_20_1 or arg_20_0:GetTeamIndex()

	if not arg_20_0.team_dic[arg_20_1] then
		arg_20_0.team_dic[arg_20_1] = arg_20_0:GetSingleTeamDataTemplateClass().New(arg_20_0:GetTeamType(), arg_20_1)
		arg_20_0.teams[#arg_20_0.teams + 1] = arg_20_0.team_dic[arg_20_1]
	end

	return arg_20_0.team_dic[arg_20_1]
end

function var_0_0.SwapTeam(arg_21_0, arg_21_1, arg_21_2)
	local var_21_0 = arg_21_0:GetSingleTeamData(arg_21_1)
	local var_21_1 = arg_21_0:GetSingleTeamData(arg_21_2)

	var_21_0:SetTeamIndex(arg_21_2)

	arg_21_0.team_dic[arg_21_2] = var_21_0

	var_21_1:SetTeamIndex(arg_21_1)

	arg_21_0.team_dic[arg_21_1] = var_21_1
end

function var_0_0.GetTeamIndex(arg_22_0)
	return ReserveConst.DEFAULT_TEAM_INDEX
end

function var_0_0.GetTeamCount(arg_23_0)
	return #arg_23_0.teams
end

function var_0_0.CleanCacheData(arg_24_0)
	if not arg_24_0:GetIsDirty() then
		return
	end

	local var_24_0 = ReserveTools.GetReserveTemplateByReserveType(arg_24_0:GetTeamType(), true):GetContDataTemplateById(arg_24_0:GetContID())

	for iter_24_0, iter_24_1 in pairs(arg_24_0.team_dic) do
		iter_24_1:UpdateServerData(var_24_0:GetSingleTeamData(iter_24_0))
	end

	arg_24_0:SetIsDirty(false)
end

function var_0_0.Clone(arg_25_0)
	return deepClone(arg_25_0)
end

function var_0_0.GetSingleTeamDataTemplateClass(arg_26_0)
	return ReserveTools.GetSingleTeamDataClass(arg_26_0:GetTeamType())
end

function var_0_0.ConvertToSendData(arg_27_0)
	local var_27_0 = {
		cont_id = arg_27_0:GetContID(),
		teams = {}
	}

	for iter_27_0, iter_27_1 in ipairs(arg_27_0.team_dic) do
		var_27_0.teams[iter_27_0] = iter_27_1:ConvertToSendData()
	end

	return var_27_0
end

function var_0_0.ConverAllTeamToSendData(arg_28_0)
	local var_28_0 = {
		cont_id = arg_28_0:GetContID(),
		teams = {}
	}

	for iter_28_0, iter_28_1 in ipairs(arg_28_0.teams) do
		var_28_0.teams[iter_28_0] = iter_28_1:ConvertToSendData()
	end

	return var_28_0
end

function var_0_0.Reset(arg_29_0)
	for iter_29_0, iter_29_1 in pairs(arg_29_0.team_dic) do
		iter_29_1:Reset()
	end

	arg_29_0.teams = {}
	arg_29_0.team_dic = {}
	arg_29_0.is_dirty = false
end

return var_0_0
