local var_0_0 = class("ReserveSingleTeamDataTemplate")

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.team_type = arg_1_1 or ReserveConst.RESERVE_TYPE.DEFAULT
	arg_1_0.team_index = arg_1_2 or ReserveConst.DEFAULT_TEAM_INDEX
	arg_1_0.hero_list = {}
	arg_1_0.cooperate_unique_skill_id = ReserveConst.DEFAULT_COMBO_SKILL_ID
	arg_1_0.mimir_info = arg_1_0:GetMimirDataClass().New()

	for iter_1_0 = 1, ReserveConst.MAX_HERO_POS_COUNT do
		arg_1_0.hero_list[iter_1_0] = arg_1_0:GetHeroPosClass().New(iter_1_0)
	end
end

function var_0_0.UpdateServerData(arg_2_0, arg_2_1)
	arg_2_0.team_index = arg_2_1.team_index
	arg_2_0.hero_list = arg_2_0.hero_list or {}

	for iter_2_0, iter_2_1 in ipairs(arg_2_1.hero_list) do
		arg_2_0.hero_list[iter_2_0]:UpdateServerData(iter_2_1, iter_2_0)
	end

	arg_2_0.cooperate_unique_skill_id = arg_2_1.cooperate_unique_skill_id

	arg_2_0.mimir_info:UpdateServerData(arg_2_1.mimir_info)
end

function var_0_0.GetTeamIndex(arg_3_0)
	return arg_3_0.team_index
end

function var_0_0.SetTeamIndex(arg_4_0, arg_4_1)
	arg_4_0.team_index = arg_4_1 or ReserveConst.DEFAULT_TEAM_INDEX
end

function var_0_0.SetTeamType(arg_5_0, arg_5_1)
	arg_5_0.team_type = arg_5_1
end

function var_0_0.GetTeamType(arg_6_0)
	return arg_6_0.team_type
end

function var_0_0.SetHeroList(arg_7_0, arg_7_1, arg_7_2)
	arg_7_1 = arg_7_1 or {}
	arg_7_2 = arg_7_2 or {}

	local var_7_0 = {}

	for iter_7_0, iter_7_1 in ipairs(arg_7_0:GetHeroList()) do
		var_7_0[iter_7_1:GetHeroID()] = true

		arg_7_0:SetHeroPosData(iter_7_0, arg_7_1[iter_7_0], arg_7_2[iter_7_0])
	end

	arg_7_0:TryUpdateComboSkillID(arg_7_1, var_7_0)
end

function var_0_0.GetHeroList(arg_8_0)
	return arg_8_0.hero_list
end

function var_0_0.GetHeroPosData(arg_9_0, arg_9_1)
	if not arg_9_0.hero_list[arg_9_1] then
		arg_9_0.hero_list[arg_9_1] = arg_9_0:GetHeroPosClass().New(arg_9_1)
	end

	return arg_9_0.hero_list[arg_9_1]
end

function var_0_0.SetHeroPosData(arg_10_0, arg_10_1, arg_10_2, arg_10_3)
	local var_10_0 = arg_10_0:GetHeroPosData(arg_10_1)

	var_10_0:SetHeroID(arg_10_2)
	var_10_0:SetTrialID(arg_10_3)
end

function var_0_0.TryUpdateComboSkillID(arg_11_0, arg_11_1, arg_11_2)
	local var_11_0 = true

	for iter_11_0, iter_11_1 in ipairs(arg_11_1) do
		if not arg_11_2[iter_11_1] then
			var_11_0 = false
		end
	end

	if not var_11_0 then
		arg_11_0:UpdateComboSkillID()
	end
end

function var_0_0.GetComboSkillID(arg_12_0)
	return arg_12_0.cooperate_unique_skill_id
end

function var_0_0.SetComboSkillID(arg_13_0, arg_13_1)
	arg_13_1 = arg_13_1 or ReserveConst.DEFAULT_COMBO_SKILL_ID
	arg_13_0.cooperate_unique_skill_id = arg_13_1
end

function var_0_0.UpdateComboSkillID(arg_14_0)
	local var_14_0 = {}

	for iter_14_0, iter_14_1 in ipairs(arg_14_0:GetHeroList()) do
		var_14_0[iter_14_0] = iter_14_1:GetHeroID()
	end

	arg_14_0:SetComboSkillID(ComboSkillTools.GetRecommendSkillID(var_14_0, true))
end

function var_0_0.GetMimirInfo(arg_15_0)
	return arg_15_0.mimir_info
end

function var_0_0.GetMimirID(arg_16_0)
	return arg_16_0.mimir_info.mimir_id
end

function var_0_0.SetMimirID(arg_17_0, arg_17_1)
	arg_17_1 = arg_17_1 or 0
	arg_17_0.mimir_info.mimir_id = arg_17_1
end

function var_0_0.GetMimirChipList(arg_18_0)
	return clone(arg_18_0.mimir_info.chip_list)
end

function var_0_0.SetMimirChipList(arg_19_0, arg_19_1)
	if not arg_19_1 then
		arg_19_1 = {}
	else
		arg_19_1 = clone(arg_19_1)
	end

	arg_19_0.mimir_info.chip_list = arg_19_1
end

function var_0_0.ResetMimirChipList(arg_20_0)
	arg_20_0.mimir_info.chip_list = {}
end

function var_0_0.GetHeroPosClass(arg_21_0)
	return ReserveTools.GetHeroPosDataClass(arg_21_0:GetTeamType())
end

function var_0_0.GetMimirDataClass(arg_22_0)
	return ReserveTools.GetMimirDataClass(arg_22_0:GetTeamType())
end

function var_0_0.Clone(arg_23_0)
	return deepClone(arg_23_0)
end

function var_0_0.ConvertToSendData(arg_24_0)
	local var_24_0 = {
		team_index = arg_24_0:GetTeamIndex(),
		hero_list = {}
	}

	for iter_24_0, iter_24_1 in ipairs(arg_24_0:GetHeroList()) do
		var_24_0.hero_list[iter_24_0] = iter_24_1:ConvertToSendData()
	end

	var_24_0.cooperate_unique_skill_id = arg_24_0:GetComboSkillID()
	var_24_0.mimir_info = arg_24_0:GetMimirInfo():ConvertToSendData()

	return var_24_0
end

function var_0_0.Reset(arg_25_0)
	for iter_25_0, iter_25_1 in ipairs(arg_25_0.hero_list) do
		iter_25_1:Reset()
	end

	arg_25_0.cooperate_unique_skill_id = ReserveConst.DEFAULT_COMBO_SKILL_ID

	arg_25_0.mimir_info:Reset()
end

return var_0_0
