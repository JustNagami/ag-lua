local var_0_0 = {}

function var_0_0.GetConditionStatus(arg_1_0, arg_1_1)
	local var_1_0 = {}

	for iter_1_0, iter_1_1 in ipairs(arg_1_1) do
		if iter_1_1[1] == 1 then
			table.insert(var_1_0, var_0_0.GetRaceConditionStatus(arg_1_0, iter_1_1[2]))
		elseif iter_1_1[1] == 2 then
			table.insert(var_1_0, var_0_0.GetMechanismConditionStatus(arg_1_0, iter_1_1[2]))
		elseif iter_1_1[1] == 3 then
			table.insert(var_1_0, var_0_0.GetAttackAttributeConditionStatus(arg_1_0, iter_1_1[2]))
		end
	end

	return var_1_0
end

function var_0_0.GetRaceConditionStatus(arg_2_0, arg_2_1)
	local var_2_0 = 0

	for iter_2_0, iter_2_1 in pairs(arg_2_0) do
		if HeroCfg[iter_2_1].race == arg_2_1 then
			var_2_0 = var_2_0 + 1
		end
	end

	return var_2_0
end

function var_0_0.GetMechanismConditionStatus(arg_3_0, arg_3_1)
	local var_3_0 = 0

	for iter_3_0, iter_3_1 in pairs(arg_3_0) do
		if table.keyof(HeroCfg[iter_3_1].mechanism_type, arg_3_1) then
			var_3_0 = var_3_0 + 1
		end
	end

	return var_3_0
end

function var_0_0.GetAttackAttributeConditionStatus(arg_4_0, arg_4_1)
	local var_4_0 = 0

	for iter_4_0, iter_4_1 in pairs(arg_4_0) do
		if table.keyof(HeroCfg[iter_4_1].ATK_attribute, arg_4_1) then
			var_4_0 = var_4_0 + 1
		end
	end

	return var_4_0
end

function var_0_0.CheckHeroTeam(arg_5_0, arg_5_1)
	ReserveTools.GetReserveTemplateByReserveType(ReserveConst.RESERVE_TYPE.SEQUENTIAL_BATTLE):CheckHeroTeam(arg_5_0, arg_5_1)
end

function var_0_0.SaveEnabledBuff(arg_6_0, arg_6_1)
	ReserveTools.GetReserveTemplateByReserveType(ReserveConst.RESERVE_TYPE.SEQUENTIAL_BATTLE):SaveEnabledBuff(arg_6_0, arg_6_1)
end

function var_0_0.GetEnabledBuff(arg_7_0, arg_7_1)
	return ReserveTools.GetReserveTemplateByReserveType(ReserveConst.RESERVE_TYPE.SEQUENTIAL_BATTLE):GetContDataTemplateById(arg_7_0):GetAffixList(arg_7_1)
end

return var_0_0
