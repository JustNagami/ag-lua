local var_0_0 = {}
local var_0_1

function var_0_0.InitComboList()
	var_0_1 = {}

	for iter_1_0, iter_1_1 in ipairs(ComboSkillCfg.all) do
		local var_1_0 = ComboSkillCfg[iter_1_1]

		if not var_0_0.GetIsHide(iter_1_1) then
			for iter_1_2, iter_1_3 in ipairs(var_1_0.cooperate_role_ids) do
				var_0_1[iter_1_3] = var_0_1[iter_1_3] or {}

				table.insert(var_0_1[iter_1_3], var_1_0.id)
			end
		end
	end

	for iter_1_4, iter_1_5 in ipairs(var_0_1) do
		table.sort(iter_1_5, var_0_0.RuleSort)
	end
end

function var_0_0.GetIsHide(arg_2_0)
	local var_2_0 = ComboSkillCfg[arg_2_0]

	for iter_2_0, iter_2_1 in ipairs(var_2_0.cooperate_role_ids) do
		if HeroTools.GetIsHide(iter_2_1) then
			return true
		end
	end

	return false
end

function var_0_0.GetHeroComboSkill(arg_3_0)
	if var_0_1 == nil then
		var_0_0.InitComboList()
	end

	return var_0_1[arg_3_0]
end

function var_0_0.GetComboSkillLevel(arg_4_0)
	local var_4_0 = ComboSkillCfg[arg_4_0]
	local var_4_1 = GameSetting.hero_combo_skill_relate.value[1]
	local var_4_2 = 0

	for iter_4_0, iter_4_1 in ipairs(var_4_0.cooperate_role_ids) do
		if HeroData:GetHeroList()[iter_4_1].unlock == 0 then
			break
		end

		var_4_2 = var_4_2 + HeroTools.GetTotalSkillLv(iter_4_1, HeroCfg[iter_4_1].skills[var_4_1])
	end

	local var_4_3 = math.floor(var_4_2 / #var_4_0.cooperate_role_ids)

	return var_4_3 > 0 and var_4_3 or 1
end

function var_0_0.GetMatrixComboSkillLevel(arg_5_0, arg_5_1)
	local var_5_0 = ComboSkillCfg[arg_5_0]
	local var_5_1 = GameSetting.hero_combo_skill_relate.value[1]
	local var_5_2 = 0

	for iter_5_0, iter_5_1 in ipairs(var_5_0.cooperate_role_ids) do
		local var_5_3 = MatrixData:GetHeroData(iter_5_1)

		var_5_2 = var_5_2 + HeroStandardSystemCfg[var_5_3:GetStandardId()].skill_lv
	end

	local var_5_4 = math.floor(var_5_2 / #var_5_0.cooperate_role_ids)

	return var_5_4 > 0 and var_5_4 or 1
end

function var_0_0.GetComboSkillList(arg_6_0, arg_6_1)
	local var_6_0 = {}
	local var_6_1 = {}
	local var_6_2 = {}

	for iter_6_0, iter_6_1 in ipairs(arg_6_0) do
		local var_6_3 = var_0_0.GetHeroComboSkill(iter_6_1) or {}

		for iter_6_2, iter_6_3 in ipairs(var_6_3) do
			if var_0_0.IsAllMatch(iter_6_3, arg_6_0) then
				if not table.keyof(var_6_1, iter_6_3) then
					table.insert(var_6_1, iter_6_3)
				end
			elseif arg_6_1 and not table.keyof(var_6_2, iter_6_3) then
				table.insert(var_6_2, iter_6_3)
			end
		end
	end

	table.sort(var_6_1, function(arg_7_0, arg_7_1)
		if arg_7_0 == arg_7_1 then
			return false
		end

		local var_7_0 = #ComboSkillCfg[arg_7_0].cooperate_role_ids
		local var_7_1 = #ComboSkillCfg[arg_7_1].cooperate_role_ids

		if var_7_0 == var_7_1 then
			if table.keyof(ComboSkillCfg[arg_7_0].cooperate_role_ids, arg_6_0[1]) then
				if table.keyof(ComboSkillCfg[arg_7_0].cooperate_role_ids, arg_6_0[2]) then
					return true
				end

				return false
			else
				return false
			end
		end

		return var_7_1 < var_7_0
	end)
	table.insertto(var_6_0, var_6_1)
	table.insertto(var_6_0, var_6_2)
	table.insert(var_6_0, 0)

	return var_6_0, var_6_1
end

function var_0_0.RuleSort(arg_8_0, arg_8_1)
	return #ComboSkillCfg[arg_8_0].cooperate_role_ids > #ComboSkillCfg[arg_8_1].cooperate_role_ids
end

function var_0_0.IsAllMatch(arg_9_0, arg_9_1)
	local var_9_0 = ComboSkillCfg[arg_9_0]

	for iter_9_0, iter_9_1 in ipairs(var_9_0.cooperate_role_ids) do
		if not table.keyof(arg_9_1, iter_9_1) then
			return false
		end
	end

	return true
end

function var_0_0.GetRecommendSkillID(arg_10_0, arg_10_1)
	local var_10_0, var_10_1 = var_0_0.GetComboSkillList(arg_10_0, arg_10_1)

	return var_10_1[1] or 0
end

function var_0_0.CheckError(arg_11_0, arg_11_1, arg_11_2)
	if arg_11_0 == 0 then
		return 0
	end

	if not arg_11_0 or not var_0_0.IsAllMatch(arg_11_0, arg_11_1) then
		return var_0_0.GetRecommendSkillID(arg_11_1, arg_11_2)
	end

	return arg_11_0
end

function var_0_0.GetMaxComboSkillLevel(arg_12_0)
	return 3
end

function var_0_0.CheckComboSkillUpContion(arg_13_0, arg_13_1)
	local var_13_0 = ComboSkillLevelCfg[arg_13_0]
	local var_13_1 = var_13_0.target

	if var_13_0.condition_type == 1 then
		local var_13_2 = ComboSkillCfg[arg_13_1]
		local var_13_3

		for iter_13_0, iter_13_1 in ipairs(var_13_2.cooperate_role_ids) do
			local var_13_4 = GameSetting.hero_combo_skill_relate.value[1]
			local var_13_5 = HeroTools.GetTotalSkillLv(iter_13_1, HeroCfg[iter_13_1].skills[var_13_4])

			if var_13_3 == nil or var_13_5 < var_13_3 then
				var_13_3 = var_13_5
			end
		end

		return var_13_1 <= var_13_3, math.min(var_13_3, var_13_1), var_13_1
	else
		local var_13_6 = ComboSkillData:GetComboSkillUpConditionProcess(arg_13_1, arg_13_0)
		local var_13_7 = math.min(var_13_6, var_13_1)

		return var_13_1 <= var_13_6, var_13_7, var_13_1
	end
end

return var_0_0
