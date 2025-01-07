local var_0_0 = {}
local var_0_1 = import("bit")

function var_0_0.GetAllSuits()
	local var_1_0 = {}

	for iter_1_0, iter_1_1 in pairs(EquipSuitCfg.get_id_list_by_suit) do
		table.insert(var_1_0, iter_1_0)
	end

	return var_1_0
end

function var_0_0.GetEquipNum()
	local var_2_0 = 0
	local var_2_1 = EquipData:GetEquipList()

	for iter_2_0, iter_2_1 in pairs(var_2_1) do
		var_2_0 = var_2_0 + 1
	end

	return var_2_0
end

function var_0_0.GetEquipListByPrefabId(arg_3_0)
	local var_3_0 = {}
	local var_3_1 = EquipData:GetEquipList()

	for iter_3_0, iter_3_1 in pairs(var_3_1) do
		if iter_3_1.prefab_id == arg_3_0 then
			table.insert(var_3_0, iter_3_1)
		end
	end

	return var_3_0
end

function var_0_0.GetEquipListByEquipid(arg_4_0)
	local var_4_0 = {}
	local var_4_1 = EquipData:GetEquipList()

	for iter_4_0, iter_4_1 in pairs(var_4_1) do
		local var_4_2 = EquipCfg[arg_4_0]
		local var_4_3 = EquipCfg[iter_4_1.prefab_id]

		if var_4_3.pos == var_4_2.pos and var_4_3.suit == var_4_2.suit and var_4_3.starlevel == var_4_2.starlevel then
			table.insert(var_4_0, iter_4_1)
		end
	end

	return var_4_0
end

function var_0_0.GetHaveSuitList(arg_5_0)
	local var_5_0 = EquipData:GetEquipList()
	local var_5_1 = {}
	local var_5_2 = HideInfoData:GetEquipSuitHideList()

	for iter_5_0, iter_5_1 in pairs(var_5_0) do
		local var_5_3 = EquipCfg[iter_5_1.prefab_id]

		if not var_5_2[var_5_3.suit] then
			var_5_1[var_5_3.suit] = true
		end
	end

	local var_5_4 = {}

	for iter_5_2, iter_5_3 in pairs(var_5_1) do
		table.insert(var_5_4, tonumber(iter_5_2))
	end

	if arg_5_0 then
		for iter_5_4, iter_5_5 in ipairs(EquipSuitCfg.all) do
			if not var_5_1[iter_5_5] and not var_5_2[iter_5_5] then
				table.insert(var_5_4, iter_5_5)
			end
		end
	end

	return var_5_4, var_5_1
end

function var_0_0.GetIsHaveExEquip()
	local var_6_0 = EquipData:GetEquipList()

	for iter_6_0, iter_6_1 in pairs(var_6_0) do
		if EquipCfg[iter_6_1.prefab_id].suit >= EquipConst.EX_EQUIP_SUIT_ID then
			return true
		end
	end

	return false
end

function var_0_0.IsHaveEquip(arg_7_0)
	local var_7_0 = EquipData:GetEquipList()
	local var_7_1 = {}
	local var_7_2 = {}

	for iter_7_0, iter_7_1 in ipairs(arg_7_0) do
		var_7_2[iter_7_1] = false
	end

	for iter_7_2, iter_7_3 in pairs(var_7_0) do
		if table.indexof(arg_7_0, iter_7_3.prefab_id) then
			var_7_2[iter_7_3.prefab_id] = true
		end
	end

	return var_7_2
end

function var_0_0.GetFreeEquipByEquipId(arg_8_0, arg_8_1)
	local var_8_0 = HeroTools.GetEquipMap(HeroData:GetHeroList())
	local var_8_1 = {}
	local var_8_2 = {}
	local var_8_3 = false
	local var_8_4 = false

	for iter_8_0, iter_8_1 in pairs(EquipData:GetEquipList()) do
		local var_8_5 = iter_8_1.prefab_id
		local var_8_6 = iter_8_1.equip_id
		local var_8_7 = false
		local var_8_8

		for iter_8_2, iter_8_3 in ipairs(arg_8_0) do
			if EquipTools.IsSameEquip(iter_8_3, var_8_5) then
				var_8_7 = true
				var_8_8 = iter_8_3

				break
			end
		end

		if var_8_7 then
			if not var_8_2[var_8_8] then
				var_8_2[var_8_8] = {}
			end

			table.insert(var_8_2[var_8_8], iter_8_1)

			var_8_4 = true

			if var_8_0[var_8_6] == nil or var_8_0[var_8_6] == arg_8_1 then
				if not var_8_1[var_8_8] then
					var_8_1[var_8_8] = {}
				end

				table.insert(var_8_1[var_8_8], iter_8_1)

				var_8_3 = true
			end
		end
	end

	return var_8_1, var_8_2, var_8_3, var_8_4, var_8_0
end

function var_0_0.IsSameEquip(arg_9_0, arg_9_1)
	local var_9_0 = EquipCfg[arg_9_0]
	local var_9_1 = EquipCfg[arg_9_1]

	if var_9_0.pos == var_9_1.pos and var_9_0.starlevel == var_9_1.starlevel and var_9_0.suit == var_9_1.suit then
		return true
	end

	return false
end

function var_0_0.GetHaveSkillList(arg_10_0)
	local var_10_0 = EquipData:GetEquipList()
	local var_10_1 = {}

	for iter_10_0, iter_10_1 in pairs(var_10_0) do
		local var_10_2 = EquipCfg[iter_10_1.prefab_id]

		for iter_10_2, iter_10_3 in ipairs(var_10_2.effect) do
			if iter_10_3[1] then
				var_10_1[iter_10_3[1]] = true
			end
		end

		for iter_10_4, iter_10_5 in pairs(iter_10_1.enchant) do
			for iter_10_6, iter_10_7 in ipairs(iter_10_5) do
				if iter_10_7 and iter_10_7.id then
					var_10_1[iter_10_7.id] = true
				end
			end
		end
	end

	local var_10_3 = {}

	for iter_10_8, iter_10_9 in pairs(var_10_1) do
		table.insert(var_10_3, tonumber(iter_10_8))
	end

	if arg_10_0 then
		for iter_10_10, iter_10_11 in ipairs(EquipSkillCfg.get_id_list_by_skill_type[EquipConst.EQUIP_ATTRIBUTE_TYPE.ENCHANT]) do
			if not var_10_1[iter_10_11] then
				table.insert(var_10_3, iter_10_11)
			end
		end
	end

	return var_10_3
end

function var_0_0.GetHeroEquipSuitPos(arg_11_0, arg_11_1, arg_11_2)
	local var_11_0 = {}
	local var_11_1 = 0

	if arg_11_0 and arg_11_0 ~= 0 then
		local var_11_2 = HeroData:GetHeroList()[arg_11_0]
		local var_11_3 = EquipData:GetEquipList()

		for iter_11_0, iter_11_1 in pairs(var_11_2.equip) do
			local var_11_4 = iter_11_1.equip_id

			if var_11_4 and var_11_4 ~= 0 then
				local var_11_5 = var_11_3[var_11_4].prefab_id
				local var_11_6 = EquipCfg[var_11_5]

				if var_11_6.suit == arg_11_1 then
					var_11_0[var_11_6.pos] = true
					var_11_1 = var_11_1 + 1
				end
			end
		end
	elseif arg_11_2 then
		var_11_0[arg_11_2] = true
		var_11_1 = var_11_1 + 1
	end

	return var_11_0, var_11_1
end

function var_0_0.GetEquipedHeroId(arg_12_0)
	local var_12_0 = HeroData:GetHeroList()

	for iter_12_0, iter_12_1 in pairs(var_12_0) do
		for iter_12_2, iter_12_3 in pairs(iter_12_1.equip) do
			if iter_12_3.equip_id == arg_12_0 then
				return iter_12_0
			end
		end
	end

	return 0
end

function var_0_0.CountActiveSuit(arg_13_0)
	local var_13_0 = EquipData:GetEquipList()
	local var_13_1 = {}

	for iter_13_0, iter_13_1 in pairs(arg_13_0) do
		if iter_13_1.equip_id ~= 0 then
			local var_13_2

			if iter_13_1.prefab_id then
				var_13_2 = iter_13_1.prefab_id
			else
				var_13_2 = var_13_0[iter_13_1.equip_id].prefab_id
			end

			local var_13_3 = EquipCfg[var_13_2]

			if var_13_1[var_13_3.suit] then
				var_13_1[var_13_3.suit].num = var_13_1[var_13_3.suit].num + 1
				var_13_1[var_13_3.suit].pos[var_13_3.pos] = true
			else
				var_13_1[var_13_3.suit] = {
					num = 1,
					id = var_13_3.suit,
					pos = {
						[var_13_3.pos] = true
					}
				}
			end
		end
	end

	local var_13_4 = {}

	for iter_13_2, iter_13_3 in pairs(var_13_1) do
		table.insert(var_13_4, iter_13_3)
	end

	return var_13_4
end

function var_0_0.GetSuitNeedNum(arg_14_0, arg_14_1)
	local var_14_0 = EquipSuitCfg[arg_14_0]

	if var_14_0.need < 3 or not arg_14_1 then
		return var_14_0.need
	else
		return var_14_0.need - 1
	end
end

function var_0_0.CountHeroTotalSkill(arg_15_0, arg_15_1, arg_15_2)
	local var_15_0 = {}
	local var_15_1 = {}

	for iter_15_0, iter_15_1 in pairs(arg_15_0) do
		if iter_15_1.equip_id and iter_15_1.equip_id ~= 0 then
			local var_15_2 = EquipCfg[iter_15_1.prefab_id]
			local var_15_3 = var_0_0.CountEquipLevel(iter_15_1)
			local var_15_4 = {}

			for iter_15_2 = 1, #var_15_2.effect do
				local var_15_5 = var_15_2.effect[iter_15_2]

				if var_15_5 and var_15_3 >= var_15_2.effect_unlock_level[iter_15_2] then
					local var_15_6 = var_15_5[1]

					var_15_0[var_15_6] = (var_15_0[var_15_6] or 0) + var_15_5[2]
					var_15_4[var_15_6] = (var_15_4[var_15_6] or 0) + var_15_5[2]
				end
			end

			for iter_15_3, iter_15_4 in pairs(iter_15_1.enchant) do
				for iter_15_5, iter_15_6 in ipairs(iter_15_4) do
					if iter_15_6 and iter_15_6.id then
						local var_15_7 = iter_15_6.id

						var_15_0[var_15_7] = (var_15_0[var_15_7] or 0) + iter_15_6.num
						var_15_4[var_15_7] = (var_15_4[var_15_7] or 0) + iter_15_6.num
					end
				end
			end

			for iter_15_7, iter_15_8 in pairs(var_15_4) do
				var_15_1[iter_15_7] = var_15_1[iter_15_7] or {}

				local var_15_8 = {
					isEquip = true,
					id = iter_15_1.equip_id,
					level = iter_15_8,
					prefab_id = iter_15_1.prefab_id
				}

				table.insert(var_15_1[iter_15_7], var_15_8)
			end
		end
	end

	local var_15_9 = HeroTools.GetHeroEquipSkillAddLevel(arg_15_1)

	for iter_15_9, iter_15_10 in pairs(var_15_0) do
		var_15_0[iter_15_9] = iter_15_10 + var_15_9

		if var_15_9 ~= 0 then
			table.insert(var_15_1[iter_15_9], {
				isEquip = false,
				level = var_15_9
			})
		end
	end

	if not arg_15_2 then
		for iter_15_11, iter_15_12 in pairs(var_15_0) do
			local var_15_10 = EquipSkillCfg[iter_15_11]

			if iter_15_12 > var_15_10.lvmax then
				var_15_0[iter_15_11] = var_15_10.lvmax
			end
		end
	end

	return var_15_0, var_15_9 > 0, var_15_1
end

function var_0_0.CountEquipAttribute(arg_16_0, arg_16_1, arg_16_2)
	local var_16_0 = {}
	local var_16_1 = EquipCfg[arg_16_0.prefab_id]
	local var_16_2 = var_0_0.CountEquipLevel(arg_16_0)
	local var_16_3 = arg_16_0.now_break_level + 1
	local var_16_4 = false
	local var_16_5 = false

	if arg_16_2 and arg_16_0.race ~= 0 then
		local var_16_6 = HeroCfg[arg_16_2]

		if arg_16_0.race == var_16_6.race then
			var_16_4 = true
		end

		if arg_16_0.race == arg_16_2 then
			var_16_5 = true
		end
	end

	local var_16_7 = var_16_1.fixed_attributes[var_16_3]

	for iter_16_0, iter_16_1 in pairs(var_16_7) do
		local var_16_8 = iter_16_1[1]

		var_16_0[var_16_8] = iter_16_1[2] + iter_16_1[3] * (var_16_2 - 1)

		if var_16_4 then
			var_16_0[var_16_8] = var_16_0[var_16_8] * 1.2
		end

		if var_16_5 then
			local var_16_9 = GameSetting.equip_hero_strengthen_num.value[1]

			var_16_0[var_16_8] = var_16_0[var_16_8] * var_16_9
		end
	end

	if arg_16_1 then
		for iter_16_2 = 1, #var_16_1.effect do
			local var_16_10 = var_16_1.effect[iter_16_2]

			if var_16_10 and var_16_2 >= var_16_1.effect_unlock_level[iter_16_2] then
				local var_16_11 = EquipSkillCfg[var_16_10[1]]
				local var_16_12 = var_16_11.upgrade * var_16_10[2]
				local var_16_13 = var_16_11.attribute

				var_16_0[var_16_13] = (var_16_0[var_16_13] or 0) + var_16_12
			end
		end

		if arg_16_0.enchant then
			for iter_16_3, iter_16_4 in pairs(arg_16_0.enchant) do
				for iter_16_5, iter_16_6 in ipairs(iter_16_4) do
					if iter_16_6 and iter_16_6.id then
						local var_16_14 = EquipSkillCfg[iter_16_6.id]
						local var_16_15 = var_16_14.upgrade * iter_16_6.num
						local var_16_16 = var_16_14.attribute

						var_16_0[var_16_16] = (var_16_0[var_16_16] or 0) + var_16_15
					end
				end
			end
		end
	end

	return var_16_0
end

function var_0_0.CountEquipMaxLv(arg_17_0)
	return EquipCfg[arg_17_0.prefab_id].max_level[arg_17_0.now_break_level + 1]
end

function var_0_0.CountEquipMaxLvWitnoutBreak(arg_18_0)
	local var_18_0 = EquipCfg[arg_18_0.prefab_id]

	return var_18_0.max_level[#var_18_0.max_level]
end

function var_0_0.CountEquipLevel(arg_19_0)
	local var_19_0 = arg_19_0.exp or 0
	local var_19_1 = var_0_0.CountEquipMaxLv(arg_19_0)
	local var_19_2 = EquipCfg[arg_19_0.prefab_id]
	local var_19_3 = "exp" .. var_19_2.starlevel

	for iter_19_0 = 1, var_19_1 - 1 do
		local var_19_4 = EquipExpCfg[iter_19_0][var_19_3]

		if var_19_0 < var_19_4 then
			return iter_19_0
		end

		var_19_0 = var_19_0 - var_19_4
	end

	return var_19_1
end

function var_0_0.CountSingleEquipAttribute(arg_20_0, arg_20_1)
	local var_20_0 = EquipCfg[arg_20_0.prefab_id]
	local var_20_1 = var_0_0.CountEquipLevel(arg_20_0)
	local var_20_2 = arg_20_0.now_break_level + 1
	local var_20_3 = var_20_0.fixed_attributes[var_20_2]

	for iter_20_0, iter_20_1 in ipairs(var_20_3) do
		if iter_20_1[1] == arg_20_1 then
			return iter_20_1[2] + iter_20_1[3] * (var_20_1 - 1)
		end
	end

	return 0
end

function var_0_0.CalHeroVirtualEquipAttribute(arg_21_0, arg_21_1, arg_21_2)
	local var_21_0 = {
		0,
		0,
		0,
		0
	}

	for iter_21_0, iter_21_1 in pairs(arg_21_0) do
		if iter_21_1.prefab_id ~= 0 then
			for iter_21_2, iter_21_3 in pairs(var_0_0.CountEquipAttribute(iter_21_1, false, arg_21_1.id)) do
				if var_21_0[iter_21_2] == nil then
					var_21_0[iter_21_2] = 0
				end

				var_21_0[iter_21_2] = var_21_0[iter_21_2] + iter_21_3
			end
		end
	end

	if not arg_21_2 then
		local var_21_1 = var_0_0.CountHeroTotalSkill(arg_21_0, arg_21_1)

		for iter_21_4, iter_21_5 in pairs(var_21_1) do
			local var_21_2 = EquipSkillCfg[iter_21_4]
			local var_21_3 = var_21_2.upgrade * iter_21_5
			local var_21_4 = var_21_2.attribute

			var_21_0[var_21_4] = (var_21_0[var_21_4] or 0) + var_21_3
		end
	end

	return var_21_0
end

function var_0_0.GetHeroEquipS(arg_22_0)
	local var_22_0 = HeroData:GetHeroList()[arg_22_0]
	local var_22_1 = {}

	for iter_22_0, iter_22_1 in pairs(var_22_0.equip) do
		var_22_1[iter_22_1.pos] = EquipData:GetEquipList()[iter_22_1.equip_id]
	end

	return var_22_1
end

function var_0_0.GetEquipDataList(arg_23_0)
	local var_23_0 = {}

	for iter_23_0 = 1, 6 do
		local var_23_1

		if arg_23_0[iter_23_0].equip_id ~= 0 then
			var_23_1 = EquipData:GetEquipData(arg_23_0[iter_23_0].equip_id)
		end

		var_23_0[iter_23_0] = var_23_1
	end

	return var_23_0
end

function var_0_0.GetEffectS(arg_24_0, arg_24_1)
	local var_24_0 = {}
	local var_24_1 = false

	if arg_24_1 then
		var_24_1 = HeroTools.GetIsSuitNumCut(arg_24_1)
	end

	local var_24_2 = {}

	for iter_24_0, iter_24_1 in pairs(arg_24_0) do
		local var_24_3 = EquipCfg[iter_24_1.prefab_id].suit

		if var_24_2[var_24_3] == nil then
			var_24_2[var_24_3] = 0
		end

		var_24_2[var_24_3] = var_24_2[var_24_3] + 1
	end

	for iter_24_2, iter_24_3 in pairs(var_24_2) do
		local var_24_4 = EquipSuitCfg.get_id_list_by_suit[iter_24_2]

		for iter_24_4, iter_24_5 in ipairs(var_24_4) do
			local var_24_5 = EquipSuitCfg[iter_24_5]

			if iter_24_3 >= var_0_0.GetSuitNeedNum(iter_24_5, var_24_1) and var_24_5.suit_effect then
				for iter_24_6, iter_24_7 in pairs(var_24_5.suit_effect) do
					var_24_0[iter_24_7] = true
				end
			end
		end
	end

	return var_24_0
end

function var_0_0.GetDecomposeRewardItem(arg_25_0)
	local var_25_0 = {}
	local var_25_1 = {}

	for iter_25_0, iter_25_1 in pairs(arg_25_0) do
		local var_25_2 = EquipCfg[iter_25_1.prefab_id].starlevel
		local var_25_3 = (iter_25_1.exp * 0.8 or 0) + var_0_0.CountBreakExp(iter_25_1) + GameSetting.base_exp_equip_star.value[var_25_2]
		local var_25_4 = GameSetting.equip_exp_props_id_list.value
		local var_25_5 = {
			var_25_4[3],
			var_25_4[2],
			var_25_4[1]
		}

		for iter_25_2 = 1, #var_25_5 do
			local var_25_6 = var_25_5[iter_25_2]
			local var_25_7 = ItemCfg[var_25_6].param[1]

			if var_25_7 <= var_25_3 then
				local var_25_8 = math.floor(var_25_3 / var_25_7)

				var_25_0[var_25_6] = (var_25_0[var_25_6] or 0) + var_25_8
				var_25_3 = var_25_3 - var_25_7 * var_25_8
			end
		end

		local var_25_9 = EquipData:GetEquipData(iter_25_0):GetBreakCostReturn()

		for iter_25_3, iter_25_4 in pairs(var_25_9) do
			local var_25_10 = iter_25_4[1] or 0
			local var_25_11 = iter_25_4[2] or 0

			var_25_0[var_25_10] = (var_25_0[var_25_10] or 0) + var_25_11
		end
	end

	for iter_25_5, iter_25_6 in pairs(var_25_0) do
		if iter_25_6 > 0 then
			table.insert(var_25_1, {
				id = iter_25_5,
				number = iter_25_6
			})
		end
	end

	return var_25_1
end

function var_0_0.CountNeedExp(arg_26_0, arg_26_1, arg_26_2)
	local var_26_0 = 0
	local var_26_1 = EquipCfg[arg_26_0.prefab_id]
	local var_26_2 = "exp" .. var_26_1.starlevel

	for iter_26_0 = 1, arg_26_1 - 1 do
		var_26_0 = var_26_0 + EquipExpCfg[iter_26_0][var_26_2]
	end

	return var_26_0
end

function var_0_0.CountMinAddLevel(arg_27_0, arg_27_1)
	local var_27_0 = arg_27_0.exp + arg_27_1
	local var_27_1 = EquipCfg[arg_27_0.prefab_id]
	local var_27_2 = var_0_0.CountEquipMaxLvWitnoutBreak(arg_27_0)
	local var_27_3 = "exp_sum_" .. arg_27_0.star

	for iter_27_0 = 2, var_27_2 do
		if var_27_0 < EquipExpCfg[iter_27_0][var_27_3] then
			return iter_27_0 - 1
		end
	end

	return 1
end

function var_0_0.CalculateCultueLevel(arg_28_0, arg_28_1, arg_28_2, arg_28_3)
	local var_28_0 = arg_28_0:GetLevel()
	local var_28_1 = arg_28_0.now_break_level
	local var_28_2 = EquipCfg[arg_28_0.prefab_id]
	local var_28_3 = var_0_0.CountEquipMaxLvWitnoutBreak(arg_28_0)
	local var_28_4 = arg_28_2 or var_28_3
	local var_28_5 = arg_28_0.exp - EquipExpCfg[var_28_0]["exp_sum_" .. var_28_2.starlevel]
	local var_28_6 = "exp" .. var_28_2.starlevel

	arg_28_1 = arg_28_1 + var_28_5

	local var_28_7 = var_28_0
	local var_28_8 = 0
	local var_28_9 = 0
	local var_28_10 = var_28_0 + 1
	local var_28_11 = {}
	local var_28_12 = false
	local var_28_13 = false
	local var_28_14

	for iter_28_0 = var_28_0 + 1, var_28_4 do
		local var_28_15 = false

		if iter_28_0 % 10 == 0 and var_28_1 <= var_28_2.break_times_max or arg_28_3 then
			if iter_28_0 >= 40 and (arg_28_0.race == 0 or table.keyof(RaceEffectCfg.all, arg_28_0.race) ~= nil) then
				var_28_15 = true
			end

			var_28_1 = var_28_1 + 1

			local var_28_16 = var_28_2.break_cost[var_28_1]

			if var_28_16 then
				local var_28_17 = EquipMaterialCfg[var_28_16]
				local var_28_18 = false

				for iter_28_1 = 2, #var_28_17.item_list do
					local var_28_19 = var_28_17.item_list[iter_28_1]
					local var_28_20 = var_28_19[1]
					local var_28_21 = var_28_19[2]

					var_28_11[var_28_20] = (var_28_11[var_28_20] and var_28_11[var_28_20] or 0) + var_28_21

					if var_28_11[var_28_20] > ItemTools.getItemNum(var_28_20) then
						var_28_18 = true
					end
				end

				if var_28_18 then
					var_28_15 = true
				else
					var_28_9 = var_28_9 + var_28_17.item_list[1][2]
					var_28_10 = arg_28_3 and iter_28_0 - 1 or iter_28_0
				end
			end

			arg_28_3 = false
		end

		local var_28_22 = EquipExpCfg[iter_28_0 - 1][var_28_6]

		if var_28_5 > 0 then
			var_28_22 = var_28_22 - var_28_5
			var_28_5 = 0
		end

		if arg_28_1 < var_28_22 then
			var_28_12 = true
			var_28_14 = var_28_14 or iter_28_0 - 1
			var_28_15 = true
		else
			var_28_8 = var_28_8 + math.floor(var_28_22 * GameSetting.equip_strengthen_gold_cost.value[1])
			arg_28_1 = arg_28_1 - var_28_22
			var_28_14 = iter_28_0
		end

		if not arg_28_2 then
			if var_28_10 < iter_28_0 then
				var_28_8 = var_28_8 + var_28_9
				var_28_9 = 0
			end

			if var_28_8 > ItemTools.getItemNum(CurrencyConst.CURRENCY_TYPE_GOLD) then
				var_28_13 = true
				var_28_15 = true
			end

			if var_28_15 then
				var_28_7 = (var_28_12 or var_28_13) and iter_28_0 - 1 or iter_28_0

				break
			end
		end

		var_28_7 = iter_28_0
	end

	local var_28_23 = math.max(var_28_0 + 1, var_28_7)

	return {
		maxLevel = var_28_23,
		expMaxLevel = var_28_14
	}
end

function var_0_0.GetLockedEquipS()
	local var_29_0 = {}
	local var_29_1 = EquipData:GetEquipList()

	for iter_29_0, iter_29_1 in pairs(var_29_1) do
		if iter_29_1.is_lock and iter_29_1.is_lock == 1 then
			table.insert(var_29_0, iter_29_1.equip_id)
		end
	end

	return var_29_0
end

function var_0_0.GetHeroUsedEquipS()
	local var_30_0 = {}
	local var_30_1 = HeroData:GetHeroList()

	for iter_30_0, iter_30_1 in pairs(var_30_1) do
		if iter_30_1.equip then
			for iter_30_2, iter_30_3 in pairs(iter_30_1.equip) do
				if iter_30_3.equip_id ~= 0 then
					table.insert(var_30_0, iter_30_3.equip_id)
				end
			end
		end
	end

	return var_30_0
end

function var_0_0.GetSuitEquipNum(arg_31_0, arg_31_1, arg_31_2, arg_31_3)
	local var_31_0 = EquipData:GetEquipList()
	local var_31_1 = 0

	for iter_31_0, iter_31_1 in pairs(var_31_0) do
		local var_31_2 = EquipCfg[iter_31_1.prefab_id]
		local var_31_3 = arg_31_3 and HeroData:GetEquipMap()[iter_31_1.equip_id]
		local var_31_4 = arg_31_2 == 0 or arg_31_2 == nil or var_31_2.pos == arg_31_2

		if not var_31_3 and var_31_4 and (not arg_31_1 or not table.keyof(arg_31_1, iter_31_1.equip_id)) and var_31_2.suit == arg_31_0 then
			var_31_1 = var_31_1 + 1
		end
	end

	return var_31_1
end

function var_0_0.GetEquipSkillNum(arg_32_0, arg_32_1, arg_32_2, arg_32_3)
	local var_32_0 = EquipData:GetEquipList()
	local var_32_1 = 0

	for iter_32_0, iter_32_1 in pairs(var_32_0) do
		local var_32_2 = EquipCfg[iter_32_1.prefab_id]
		local var_32_3 = arg_32_3 and HeroData:GetEquipMap()[iter_32_1.equip_id]
		local var_32_4 = arg_32_2 == 0 or arg_32_2 == nil or var_32_2.pos == arg_32_2
		local var_32_5 = false

		if not var_32_3 and var_32_4 and (not arg_32_1 or not table.keyof(arg_32_1, iter_32_1.equip_id)) then
			for iter_32_2, iter_32_3 in ipairs(var_32_2.effect) do
				if iter_32_3 and iter_32_3[1] and iter_32_3[1] == arg_32_0 then
					var_32_5 = true

					break
				end
			end

			if not var_32_5 then
				for iter_32_4, iter_32_5 in pairs(iter_32_1.enchant) do
					for iter_32_6, iter_32_7 in ipairs(iter_32_5) do
						if iter_32_7 and iter_32_7.id and iter_32_7.id == arg_32_0 then
							var_32_5 = true

							break
						end
					end
				end
			end

			if var_32_5 then
				var_32_1 = var_32_1 + 1
			end
		end
	end

	return var_32_1
end

function var_0_0.GetEquipInfoById(arg_33_0)
	return EquipData:GetEquipList()[arg_33_0]
end

function var_0_0.CountAddExp(arg_34_0, arg_34_1, arg_34_2)
	local var_34_0 = 0
	local var_34_1 = 9999999

	for iter_34_0, iter_34_1 in pairs(arg_34_0) do
		var_34_0 = var_34_0 + ItemCfg[iter_34_0].param[1] * iter_34_1
		var_34_1 = math.min(var_34_1, ItemCfg[iter_34_0].param[1])
	end

	for iter_34_2, iter_34_3 in pairs(arg_34_1) do
		local var_34_2 = iter_34_3.id or iter_34_3.prefab_id
		local var_34_3 = iter_34_3.equip_info and iter_34_3.equip_info.exp or iter_34_3.exp

		if not arg_34_2 or iter_34_3.exp <= 0 then
			local var_34_4 = EquipCfg[var_34_2].starlevel
			local var_34_5 = (var_34_3 * 0.8 or 0) + var_0_0.CountBreakExp(iter_34_3) + GameSetting.base_exp_equip_star.value[var_34_4]

			var_34_0 = var_34_0 + var_34_5
			var_34_1 = math.min(var_34_1, var_34_5)
		end
	end

	if var_34_1 == 9999999 then
		var_34_1 = 0
	end

	return var_34_0, var_34_1
end

function var_0_0.CountBreakExp(arg_35_0)
	return 0
end

function var_0_0.QuickSelectList(arg_36_0, arg_36_1)
	local var_36_0 = EquipData:GetEquipList()
	local var_36_1 = {}

	for iter_36_0, iter_36_1 in ipairs(ItemCfg.get_id_list_by_type[ItemConst.ITEM_TYPE.MATERIAL]) do
		local var_36_2 = ItemTools.getItemNum(iter_36_1)
		local var_36_3 = ItemCfg[iter_36_1]

		if var_36_3.sub_type == MaterialConst.MATERIAL_TYPE.EQUIP_LEVEL_UP and var_36_2 > 0 then
			table.insert(var_36_1, {
				id = iter_36_1,
				add = var_36_3.param[1],
				num = var_36_2
			})
		end
	end

	local var_36_4 = 0
	local var_36_5 = {}
	local var_36_6 = {}
	local var_36_7 = arg_36_0 - var_36_4
	local var_36_8 = {}

	for iter_36_2 = 1, #var_36_1 do
		local var_36_9 = var_36_1[iter_36_2].add

		var_36_8[iter_36_2] = math.max(math.min(math.ceil(var_36_7 / var_36_9), var_36_1[iter_36_2].num), 0)
		var_36_7 = var_36_7 - var_36_8[iter_36_2] * var_36_9

		if var_36_7 < 0 and iter_36_2 > 1 then
			local var_36_10 = -var_36_7

			for iter_36_3 = iter_36_2 - 1, 1, -1 do
				local var_36_11 = var_36_1[iter_36_3].add
				local var_36_12 = math.modf(var_36_10 / var_36_11)
				local var_36_13 = var_36_8[iter_36_3]

				var_36_8[iter_36_3] = math.max(0, var_36_8[iter_36_3] - var_36_12)

				local var_36_14 = math.min(var_36_13, var_36_12)

				var_36_10 = var_36_10 - var_36_11 * var_36_14
				var_36_7 = var_36_7 + var_36_11 * var_36_14
			end
		end

		if var_36_7 <= 0 then
			break
		end
	end

	for iter_36_4 = 1, #var_36_1 do
		if var_36_8[iter_36_4] == nil then
			var_36_8[iter_36_4] = 0
		end

		var_36_4 = var_36_4 + var_36_8[iter_36_4] * var_36_1[iter_36_4].add
		var_36_5[var_36_1[iter_36_4].id] = var_36_8[iter_36_4]
	end

	if var_36_7 > 0 then
		local var_36_15 = EquipData:GetEquipListComplex(ItemConst.SORT_TYPE.UP, EquipConst.EQUIP_SORT.RARE)
		local var_36_16 = HeroTools.GetEquipMap(HeroData:GetHeroList())
		local var_36_17 = ProposalData:GetEquipMap()
		local var_36_18 = #var_36_15

		for iter_36_5 = 1, var_36_18 do
			local var_36_19 = arg_36_0 - var_36_4
			local var_36_20 = var_36_15[iter_36_5].equip_id
			local var_36_21 = var_36_0[var_36_20]

			if var_36_19 <= 0 then
				break
			end

			local var_36_22 = EquipCfg[var_36_21.prefab_id]

			if var_36_16[var_36_20] == nil and var_36_21.exp == 0 and var_36_21.now_break_level == 0 and var_36_21.star < 5 and not var_36_21.is_lock and not var_36_17[var_36_21.equip_id] and not table.indexof(arg_36_1, var_36_21.equip_id) then
				var_36_6[var_36_20] = {
					isEquiped = false,
					number = 1,
					type = ItemConst.ITEM_TYPE.EQUIP,
					id = var_36_21.prefab_id,
					equip_id = var_36_21.equip_id,
					equip_info = var_36_21,
					equip_star = getItemStar(var_36_21.prefab_id),
					equip_lv = var_0_0.CountEquipLevel(var_36_21)
				}
				var_36_4 = var_36_4 + GameSetting.base_exp_equip_star.value[var_36_21.star]
			end
		end
	end

	return var_36_5, var_36_6
end

function var_0_0.GetEquipLevelUpMaterial(arg_37_0, arg_37_1, arg_37_2, arg_37_3)
	local var_37_0 = EquipData:GetEquipListComplex(arg_37_0, arg_37_1)
	local var_37_1 = {}
	local var_37_2 = {}
	local var_37_3 = {}

	for iter_37_0, iter_37_1 in ipairs(ItemCfg.get_id_list_by_type[ItemConst.ITEM_TYPE.MATERIAL]) do
		local var_37_4 = ItemTools.getItemNum(iter_37_1)

		if ItemCfg[iter_37_1].sub_type == MaterialConst.MATERIAL_TYPE.EQUIP_LEVEL_UP and var_37_4 > 0 then
			table.insert(var_37_1, {
				type = ItemCfg[iter_37_1].type,
				id = iter_37_1,
				number = var_37_4
			})

			var_37_2[iter_37_1] = var_37_4
		end
	end

	local var_37_5 = HeroData:GetEquipMap()
	local var_37_6 = ProposalData:GetEquipMap()

	for iter_37_2 = #var_37_0, 1, -1 do
		if var_37_5[var_37_0[iter_37_2].equip_id] or table.indexof(arg_37_2, var_37_0[iter_37_2].equip_id) or arg_37_3 and arg_37_3 <= var_37_0[iter_37_2].star then
			table.remove(var_37_0, iter_37_2)
		end
	end

	for iter_37_3, iter_37_4 in ipairs(var_37_0) do
		if not iter_37_4.is_lock and not var_37_6[iter_37_4.equip_id] then
			iter_37_4.type = ItemCfg[iter_37_4.prefab_id].type

			table.insert(var_37_1, iter_37_4)

			var_37_3[iter_37_4.equip_id] = iter_37_4
		end
	end

	return var_37_1, var_37_2, var_37_3
end

function var_0_0.CountRestAddExp(arg_38_0, arg_38_1)
	local var_38_0 = 0

	for iter_38_0 = arg_38_1, 1, -1 do
		var_38_0 = var_38_0 + arg_38_0[iter_38_0].add * arg_38_0[iter_38_0].num
	end

	return var_38_0
end

function var_0_0.QuickMaterialList(arg_39_0, arg_39_1)
	local var_39_0 = {}
	local var_39_1 = {}
	local var_39_2 = 0

	for iter_39_0, iter_39_1 in ipairs(arg_39_1) do
		local var_39_3 = arg_39_0 - var_39_2

		if var_39_3 > 0 then
			local var_39_4 = ItemCfg[iter_39_1.id].param[1]
			local var_39_5 = math.min(math.ceil(var_39_3 / var_39_4), iter_39_1.num)

			var_39_0[iter_39_1.id] = var_39_5
			var_39_1[iter_39_0] = var_39_5
			var_39_2 = var_39_2 + var_39_5 * var_39_4
		else
			var_39_1[iter_39_0] = 0
		end
	end

	return var_39_0, var_39_1
end

function var_0_0.QuickEquipList(arg_40_0, arg_40_1, arg_40_2)
	local var_40_0 = {}
	local var_40_1 = 0

	for iter_40_0, iter_40_1 in ipairs(arg_40_1) do
		local var_40_2 = arg_40_0 - var_40_1
		local var_40_3 = var_0_0.GetEquipInfoById(iter_40_1)
		local var_40_4 = EquipCfg[equip.prefab_id].starlevel

		if var_40_2 > 0 and var_40_4 <= arg_40_2 then
			var_40_0[iter_40_1] = var_40_3
			var_40_1 = var_40_1 + var_40_3.exp + GameSetting.base_exp_equip_star.value[var_40_4]
		end
	end

	return var_40_0
end

function var_0_0.GetEquipSuitEffect(arg_41_0)
	local var_41_0 = {}
	local var_41_1 = deepClone(EquipSuitCfg.get_id_list_by_suit[EquipCfg[arg_41_0.prefab_id].suit])

	table.sort(var_41_1, function(arg_42_0, arg_42_1)
		return EquipSuitCfg[arg_42_0].need < EquipSuitCfg[arg_42_1].need
	end)

	return var_41_1
end

function var_0_0.CountSuitEffect(arg_43_0)
	local var_43_0 = {}

	for iter_43_0, iter_43_1 in pairs(arg_43_0) do
		local var_43_1 = EquipCfg[iter_43_1.prefab_id].suit

		var_43_0[var_43_1] = 1 + (var_43_0[var_43_1] or 0)
	end

	local var_43_2 = {}

	for iter_43_2, iter_43_3 in pairs(var_43_0) do
		local var_43_3 = EquipSuitCfg.get_id_list_by_suit[iter_43_2]

		for iter_43_4, iter_43_5 in ipairs(var_43_3) do
			if iter_43_3 >= EquipSuitCfg[iter_43_5].need then
				table.insert(var_43_2, iter_43_5)
			end
		end
	end

	return var_43_2
end

function var_0_0.Filt(arg_44_0, arg_44_1)
	local var_44_0 = deepClone(arg_44_0)

	for iter_44_0, iter_44_1 in pairs(var_44_0) do
		if not arg_44_1[EquipCfg[iter_44_1.prefab_id].pos] then
			var_44_0[iter_44_0] = nil
		end
	end

	return var_44_0
end

function var_0_0.MutiFilt(arg_45_0, arg_45_1)
	local var_45_0 = deepClone(arg_45_0)

	for iter_45_0, iter_45_1 in pairs(var_45_0) do
		for iter_45_2, iter_45_3 in pairs(arg_45_1) do
			if not iter_45_3[EquipCfg[iter_45_1.prefab_id][iter_45_2]] then
				var_45_0[iter_45_0] = nil
			end
		end
	end

	return var_45_0
end

function var_0_0.FiltByPos(arg_46_0, arg_46_1)
	local var_46_0 = deepClone(arg_46_0)

	for iter_46_0, iter_46_1 in pairs(var_46_0) do
		if not arg_46_1[EquipCfg[iter_46_1.prefab_id].pos] then
			var_46_0[iter_46_0] = nil
		end
	end

	return var_46_0
end

function var_0_0.FiltBySuit(arg_47_0, arg_47_1)
	local var_47_0 = deepClone(arg_47_0)

	for iter_47_0, iter_47_1 in pairs(var_47_0) do
		if not arg_47_1[EquipCfg[iter_47_1.prefab_id].suit] then
			var_47_0[iter_47_0] = nil
		end
	end

	return var_47_0
end

function var_0_0.EquipSort(arg_48_0, arg_48_1, arg_48_2)
	local var_48_0 = {}

	for iter_48_0, iter_48_1 in pairs(arg_48_0) do
		table.insert(var_48_0, iter_48_1)
	end

	local var_48_1 = arg_48_2 or 0
	local var_48_2 = arg_48_1 or 0

	local function var_48_3(arg_49_0, arg_49_1)
		if var_48_2 == ItemConst.SORT_TYPE.DOWN then
			return arg_49_1 < arg_49_0
		else
			return arg_49_0 < arg_49_1
		end
	end

	if var_48_1 == EquipConst.EQUIP_SORT.LEVEL then
		local function var_48_4(arg_50_0, arg_50_1)
			if arg_50_0:GetLevel() ~= arg_50_1:GetLevel() then
				return var_48_3(arg_50_0:GetLevel(), arg_50_1:GetLevel())
			elseif arg_50_0.now_break_level ~= arg_50_1.now_break_level then
				return var_48_3(arg_50_0.now_break_level, arg_50_1.now_break_level)
			elseif arg_50_0.star ~= arg_50_1.star then
				return var_48_3(arg_50_0.star, arg_50_1.star)
			elseif arg_50_0:GetSuit() ~= arg_50_1:GetSuit() then
				return arg_50_0:GetSuit() < arg_50_1:GetSuit()
			elseif arg_50_0.prefab_id and arg_50_1.prefab_id and arg_50_0.prefab_id ~= arg_50_1.prefab_id then
				return arg_50_0.prefab_id < arg_50_1.prefab_id
			elseif arg_50_0.equip_id ~= arg_50_1.equip_id then
				return var_48_3(arg_50_0.equip_id, arg_50_1.equip_id)
			end

			return false
		end

		table.sort(var_48_0, var_48_4)
	elseif var_48_1 == EquipConst.EQUIP_SORT.RARE then
		local function var_48_5(arg_51_0, arg_51_1)
			if arg_51_0.star ~= arg_51_1.star then
				return var_48_3(arg_51_0.star, arg_51_1.star)
			elseif arg_51_0:GetLevel() ~= arg_51_1:GetLevel() then
				return var_48_3(arg_51_0:GetLevel(), arg_51_1:GetLevel())
			elseif arg_51_0.now_break_level ~= arg_51_1.now_break_level then
				return var_48_3(arg_51_0.now_break_level, arg_51_1.now_break_level)
			elseif arg_51_0:GetSuit() ~= arg_51_1:GetSuit() then
				return arg_51_0:GetSuit() < arg_51_1:GetSuit()
			elseif arg_51_0.prefab_id and arg_51_1.prefab_id and arg_51_0.prefab_id ~= arg_51_1.prefab_id then
				return arg_51_0.prefab_id < arg_51_1.prefab_id
			elseif arg_51_0.equip_id ~= arg_51_1.equip_id then
				return var_48_3(arg_51_0.equip_id, arg_51_1.equip_id)
			end

			return false
		end

		table.sort(var_48_0, var_48_5)
	else
		local function var_48_6(arg_52_0, arg_52_1)
			if arg_52_0.equip_id ~= arg_52_1.equip_id then
				return var_48_3(arg_52_0.equip_id, arg_52_1.equip_id)
			end

			return false
		end

		table.sort(var_48_0, var_48_6)
		print("EquipSort Fucntion cant find current sort Type")
	end

	return var_48_0
end

function var_0_0.GetEffectDesc(arg_53_0)
	local var_53_0 = EquipEffectCfg[arg_53_0]

	if not var_53_0 then
		print("装备效果 id" .. arg_53_0 .. "没有配置")
	end

	if var_53_0.desc and var_53_0.desc ~= "" then
		return GetCfgDescription(var_53_0.desc[1], 1)
	end

	return ""
end

function var_0_0.GetEffectDescOld(arg_54_0)
	if arg_54_0 == nil then
		return ""
	end

	local var_54_0 = EquipEffectCfg[arg_54_0]
	local var_54_1 = var_54_0.desc
	local var_54_2 = {}

	for iter_54_0 in string.gmatch(var_54_0.desc, "@{.-}") do
		local var_54_3 = 0
		local var_54_4 = string.sub(iter_54_0, 3, -2)
		local var_54_5 = string.split(var_54_4, "_")
		local var_54_6 = EquipEffectCfg[tonumber(var_54_5[1])]
		local var_54_7 = var_54_3 + tonumber(var_54_6.param[tonumber(var_54_5[2])])

		var_54_2[#var_54_2 + 1] = var_54_7
	end

	for iter_54_1 = 1, #var_54_2 do
		var_54_1 = string.gsub(var_54_1, "@{.-}", var_54_2[iter_54_1], 1)
	end

	return var_54_1
end

function var_0_0.GetSkillDescWithoutHero(arg_55_0, arg_55_1, arg_55_2)
	local var_55_0 = EquipSkillCfg[arg_55_0]
	local var_55_1 = ""
	local var_55_2 = GameSetting.exclusive_skill_cd_type.value
	local var_55_3 = GameSetting.exclusive_skill_level_up_type.value
	local var_55_4 = GameSetting.exclusive_skill_damage_type.value
	local var_55_5 = false

	if not var_55_5 then
		for iter_55_0, iter_55_1 in ipairs(var_55_2) do
			if arg_55_0 == iter_55_1[1] then
				var_55_5 = iter_55_1[2]
			end
		end
	end

	if not var_55_5 then
		for iter_55_2, iter_55_3 in ipairs(var_55_3) do
			if arg_55_0 == iter_55_3[1] then
				var_55_5 = iter_55_3[2]
			end
		end
	end

	if not var_55_5 then
		for iter_55_4, iter_55_5 in ipairs(var_55_4) do
			if arg_55_0 == iter_55_5[1] then
				local var_55_6 = iter_55_5[2]
			end
		end
	end

	local var_55_7 = ""

	if arg_55_1 == 0 then
		var_55_7 = EquipTools.Calculate(var_55_0.upgrade / var_55_0.percent * 1, arg_55_0)
	elseif arg_55_1 < var_55_0.lvmax then
		if arg_55_2 then
			var_55_7 = EquipTools.Calculate(var_55_0.upgrade / var_55_0.percent * arg_55_1, arg_55_0)
		else
			var_55_7 = EquipTools.Calculate(var_55_0.upgrade / var_55_0.percent * arg_55_1, arg_55_0) .. string.format(GetTips("EQUIP_HERO_SKILL_NEXT_LEVEL"), EquipTools.Calculate(var_55_0.upgrade / var_55_0.percent * (arg_55_1 + 1), arg_55_0))
		end
	else
		var_55_7 = EquipTools.Calculate(var_55_0.upgrade / var_55_0.percent * arg_55_1, arg_55_0)
	end

	return GetCfgDescriptionWithValue(var_55_0.desc[1], var_55_7)
end

function var_0_0.GetSkillDesc(arg_56_0, arg_56_1, arg_56_2)
	local var_56_0 = EquipSkillCfg[arg_56_0]
	local var_56_1 = HeroCfg[arg_56_2]
	local var_56_2 = ""
	local var_56_3 = GameSetting.exclusive_skill_cd_type.value
	local var_56_4 = GameSetting.exclusive_skill_level_up_type.value
	local var_56_5 = GameSetting.exclusive_skill_damage_type.value
	local var_56_6 = false

	if not var_56_6 then
		for iter_56_0, iter_56_1 in ipairs(var_56_3) do
			if arg_56_0 == iter_56_1[1] then
				var_56_6 = iter_56_1[2]
			end
		end
	end

	if not var_56_6 then
		for iter_56_2, iter_56_3 in ipairs(var_56_4) do
			if arg_56_0 == iter_56_3[1] then
				var_56_6 = iter_56_3[2]
			end
		end
	end

	if not var_56_6 then
		for iter_56_4, iter_56_5 in ipairs(var_56_5) do
			if arg_56_0 == iter_56_5[1] then
				var_56_6 = iter_56_5[2]
			end
		end
	end

	if var_56_6 then
		local var_56_7 = var_56_1.skills[var_56_6]
		local var_56_8 = HeroSkillCfg[var_56_7].name
	end

	local var_56_9 = ""

	if arg_56_1 == 0 then
		var_56_9 = EquipTools.Calculate(var_56_0.upgrade / var_56_0.percent * 1, arg_56_0)
	elseif arg_56_1 < var_56_0.lvmax then
		var_56_9 = EquipTools.Calculate(var_56_0.upgrade / var_56_0.percent * arg_56_1, arg_56_0) .. string.format(GetTips("EQUIP_HERO_SKILL_NEXT_LEVEL"), EquipTools.Calculate(var_56_0.upgrade / var_56_0.percent * (arg_56_1 + 1), arg_56_0))
	else
		var_56_9 = EquipTools.Calculate(var_56_0.upgrade / var_56_0.percent * arg_56_1, arg_56_0)
	end

	return GetCfgDescriptionWithValue(var_56_0.desc[1], var_56_9)
end

function var_0_0.GetSkillDescWithoutNext(arg_57_0, arg_57_1, arg_57_2)
	local var_57_0 = EquipSkillCfg[arg_57_0]
	local var_57_1 = HeroCfg[arg_57_2]
	local var_57_2 = ""
	local var_57_3 = GameSetting.exclusive_skill_cd_type.value
	local var_57_4 = GameSetting.exclusive_skill_level_up_type.value
	local var_57_5 = GameSetting.exclusive_skill_damage_type.value
	local var_57_6 = false

	if not var_57_6 then
		for iter_57_0, iter_57_1 in ipairs(var_57_3) do
			if arg_57_0 == iter_57_1[1] then
				var_57_6 = iter_57_1[2]
			end
		end
	end

	if not var_57_6 then
		for iter_57_2, iter_57_3 in ipairs(var_57_4) do
			if arg_57_0 == iter_57_3[1] then
				var_57_6 = iter_57_3[2]
			end
		end
	end

	if not var_57_6 then
		for iter_57_4, iter_57_5 in ipairs(var_57_5) do
			if arg_57_0 == iter_57_5[1] then
				var_57_6 = iter_57_5[2]
			end
		end
	end

	if var_57_6 then
		local var_57_7 = var_57_1.skills[var_57_6]
		local var_57_8 = HeroSkillCfg[var_57_7].name
	end

	local var_57_9 = ""

	if arg_57_1 == 0 then
		var_57_9 = EquipTools.Calculate(var_57_0.upgrade / var_57_0.percent * 1, arg_57_0)
	else
		var_57_9 = EquipTools.Calculate(var_57_0.upgrade / var_57_0.percent * arg_57_1, arg_57_0)
	end

	return GetCfgDescriptionWithValue(var_57_0.desc[1], var_57_9)
end

function var_0_0.Calculate(arg_58_0, arg_58_1)
	local var_58_0 = GameDisplayCfg.equip_hero_skill_int.value

	if table.indexof(var_58_0, arg_58_1) then
		return arg_58_0
	else
		return string.format("%.1f%%", arg_58_0)
	end
end

function var_0_0.GetIsHide(arg_59_0)
	local var_59_0 = EquipCfg[arg_59_0].suit

	hideList = HideInfoData:GetEquipSuitHideList()

	return hideList[var_59_0] or false
end

function var_0_0.GetSuitTotalNum()
	local var_60_0 = HideInfoData:GetEquipSuitHideList()
	local var_60_1 = 0

	for iter_60_0, iter_60_1 in ipairs(EquipSuitCfg.all) do
		if not var_60_0[iter_60_1] then
			var_60_1 = var_60_1 + 1
		end
	end

	return var_60_1
end

function var_0_0.RefreshSkillData(arg_61_0, arg_61_1, arg_61_2)
	local var_61_0 = {}

	if arg_61_1 and arg_61_2 then
		local var_61_1 = arg_61_2:GetEquipDataList(arg_61_1)
		local var_61_2 = HeroData:GetHeroData(arg_61_1)
		local var_61_3, var_61_4, var_61_5 = EquipTools.CountHeroTotalSkill(var_61_1, var_61_2, true)

		for iter_61_0, iter_61_1 in pairs(var_61_3) do
			var_61_0[iter_61_0] = {
				id = iter_61_0,
				num = iter_61_1,
				isAdd = var_61_4,
				location = var_61_5[iter_61_0]
			}
		end
	else
		local var_61_6 = arg_61_0:GetTotalSkill()

		for iter_61_2, iter_61_3 in ipairs(var_61_6) do
			var_61_0[iter_61_3.id] = {
				id = iter_61_3.id,
				num = iter_61_3.num,
				location = {
					{
						isEquip = true,
						id = arg_61_0.equip_id,
						level = iter_61_3.num,
						prefab_id = arg_61_0.prefab_id
					}
				}
			}
		end
	end

	return var_61_0
end

return var_0_0
