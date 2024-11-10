local var_0_0 = {
	WeaponAtk = function(arg_1_0, arg_1_1)
		local var_1_0 = GameSetting.weapon_fixed_attributes.value[arg_1_1 + 1]

		return var_1_0[1] + var_1_0[2] * (arg_1_0 - 1)
	end,
	ExpToLv = function(arg_2_0)
		local var_2_0
		local var_2_1
		local var_2_2 = 0

		for iter_2_0 = HeroConst.WEAPON_LV_MAX, 1, -1 do
			local var_2_3 = GameLevelSetting[iter_2_0].weapon_lv_exp_sum

			if var_2_3 <= arg_2_0 then
				var_2_0 = iter_2_0
				var_2_1 = arg_2_0 - var_2_3

				break
			end
		end

		return var_2_0, var_2_1
	end,
	CurMaxExp = function(arg_3_0)
		local var_3_0
		local var_3_1 = GameSetting.weapon_exp_limit.value[arg_3_0 + 1]

		return GameLevelSetting[var_3_1].weapon_lv_exp_sum
	end
}

function var_0_0.AddWeaponExp(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0 = 0
	local var_4_1 = 0
	local var_4_2 = 0
	local var_4_3 = false
	local var_4_4 = var_0_0.CurMaxExp(arg_4_1)
	local var_4_5 = arg_4_0 + arg_4_2

	if var_4_4 <= var_4_5 then
		var_4_2 = var_4_5 - var_4_4
		var_4_5 = var_4_4
		var_4_3 = true
	end

	local var_4_6, var_4_7 = WeaponTools.ExpToLv(var_4_5)

	return var_4_7, var_4_6, var_4_2, var_4_3
end

function var_0_0.BreakMaterial(arg_5_0)
	if arg_5_0 >= 4 then
		return 0, {}
	end

	local var_5_0 = GameSetting.weapon_break_cost.value[arg_5_0 + 1]

	if not var_5_0 then
		print()
	end

	local var_5_1 = EquipMaterialCfg[var_5_0].item_list
	local var_5_2 = 1
	local var_5_3 = {}

	if var_5_1[1][1] == 2 then
		var_5_2 = var_5_1[1][2]
	end

	for iter_5_0 = 2, #var_5_1 do
		var_5_3[iter_5_0 - 1] = deepClone(var_5_1[iter_5_0])
	end

	return var_5_2, var_5_3
end

function var_0_0.CalWeaponAttribute(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = {}
	local var_6_1 = var_0_0.ExpToLv(arg_6_1.exp)
	local var_6_2 = GameSetting.weapon_fixed_attributes.value[arg_6_1.breakthrough + 1]
	local var_6_3 = 1

	if arg_6_2 and arg_6_2.id and arg_6_2.id ~= 0 then
		local var_6_4 = WeaponServantCfg[arg_6_2.id]

		if var_6_4 then
			var_6_3 = var_6_4.attrib_addition * 0.01 + 1
			var_6_0[var_6_4.attribute[1]] = var_6_4.attribute[2]
		end
	end

	var_6_0[1] = (var_6_2[1] + var_6_2[2] * (var_6_1 - 1)) * var_6_3 + (var_6_0[1] or 0)

	local var_6_5 = HeroCfg[arg_6_0].weapon_break_attribute[arg_6_1.breakthrough + 1]

	var_6_0[var_6_5[1]] = var_6_5[2] + (var_6_0[var_6_5[1]] or 0)

	return var_6_0
end

function var_0_0.GetWeaponModuleDes(arg_7_0, arg_7_1)
	local var_7_0 = getSkillIDOrServantID(arg_7_0)
	local var_7_1 = GetTips("WEAPON_MODULE_SKILL_TIP_TEMPLATE_4")
	local var_7_2 = WeaponServantCfg[var_7_0].effect[1]

	return string.format(var_7_1, ItemTools.getItemName(var_7_0), GetCfgDescription(WeaponEffectCfg[var_7_2].strengthen_description[2], 1, nil, nil, arg_7_1))
end

return var_0_0
