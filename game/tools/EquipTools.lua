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

function var_0_0.CountEquipLevel(arg_18_0)
	local var_18_0 = arg_18_0.exp or 0
	local var_18_1 = var_0_0.CountEquipMaxLv(arg_18_0)
	local var_18_2 = EquipCfg[arg_18_0.prefab_id]
	local var_18_3 = "exp" .. var_18_2.starlevel

	for iter_18_0 = 1, var_18_1 - 1 do
		local var_18_4 = EquipExpCfg[iter_18_0][var_18_3]

		if var_18_0 < var_18_4 then
			return iter_18_0
		end

		var_18_0 = var_18_0 - var_18_4
	end

	return var_18_1
end

function var_0_0.CountSingleEquipAttribute(arg_19_0, arg_19_1)
	local var_19_0 = EquipCfg[arg_19_0.prefab_id]
	local var_19_1 = var_0_0.CountEquipLevel(arg_19_0)
	local var_19_2 = arg_19_0.now_break_level + 1
	local var_19_3 = var_19_0.fixed_attributes[var_19_2]

	for iter_19_0, iter_19_1 in ipairs(var_19_3) do
		if iter_19_1[1] == arg_19_1 then
			return iter_19_1[2] + iter_19_1[3] * (var_19_1 - 1)
		end
	end

	return 0
end

function var_0_0.CalHeroVirtualEquipAttribute(arg_20_0, arg_20_1, arg_20_2)
	local var_20_0 = {
		0,
		0,
		0,
		0
	}

	for iter_20_0, iter_20_1 in pairs(arg_20_0) do
		if iter_20_1.prefab_id ~= 0 then
			for iter_20_2, iter_20_3 in pairs(var_0_0.CountEquipAttribute(iter_20_1, false, arg_20_1.id)) do
				if var_20_0[iter_20_2] == nil then
					var_20_0[iter_20_2] = 0
				end

				var_20_0[iter_20_2] = var_20_0[iter_20_2] + iter_20_3
			end
		end
	end

	if not arg_20_2 then
		local var_20_1 = var_0_0.CountHeroTotalSkill(arg_20_0, arg_20_1)

		for iter_20_4, iter_20_5 in pairs(var_20_1) do
			local var_20_2 = EquipSkillCfg[iter_20_4]
			local var_20_3 = var_20_2.upgrade * iter_20_5
			local var_20_4 = var_20_2.attribute

			var_20_0[var_20_4] = (var_20_0[var_20_4] or 0) + var_20_3
		end
	end

	return var_20_0
end

function var_0_0.GetHeroEquipS(arg_21_0)
	local var_21_0 = HeroData:GetHeroList()[arg_21_0]
	local var_21_1 = {}

	for iter_21_0, iter_21_1 in pairs(var_21_0.equip) do
		var_21_1[iter_21_1.pos] = EquipData:GetEquipList()[iter_21_1.equip_id]
	end

	return var_21_1
end

function var_0_0.GetEquipDataList(arg_22_0)
	local var_22_0 = {}

	for iter_22_0 = 1, 6 do
		local var_22_1

		if arg_22_0[iter_22_0].equip_id ~= 0 then
			var_22_1 = EquipData:GetEquipData(arg_22_0[iter_22_0].equip_id)
		end

		var_22_0[iter_22_0] = var_22_1
	end

	return var_22_0
end

function var_0_0.GetEffectS(arg_23_0, arg_23_1)
	local var_23_0 = {}
	local var_23_1 = false

	if arg_23_1 then
		var_23_1 = HeroTools.GetIsSuitNumCut(arg_23_1)
	end

	local var_23_2 = {}

	for iter_23_0, iter_23_1 in pairs(arg_23_0) do
		local var_23_3 = EquipCfg[iter_23_1.prefab_id].suit

		if var_23_2[var_23_3] == nil then
			var_23_2[var_23_3] = 0
		end

		var_23_2[var_23_3] = var_23_2[var_23_3] + 1
	end

	for iter_23_2, iter_23_3 in pairs(var_23_2) do
		local var_23_4 = EquipSuitCfg.get_id_list_by_suit[iter_23_2]

		for iter_23_4, iter_23_5 in ipairs(var_23_4) do
			local var_23_5 = EquipSuitCfg[iter_23_5]

			if iter_23_3 >= var_0_0.GetSuitNeedNum(iter_23_5, var_23_1) and var_23_5.suit_effect then
				for iter_23_6, iter_23_7 in pairs(var_23_5.suit_effect) do
					var_23_0[iter_23_7] = true
				end
			end
		end
	end

	return var_23_0
end

function var_0_0.GetDecomposeRewardItem(arg_24_0)
	local var_24_0 = {}
	local var_24_1 = {}

	for iter_24_0, iter_24_1 in pairs(arg_24_0) do
		local var_24_2 = EquipCfg[iter_24_1.prefab_id].starlevel
		local var_24_3 = (iter_24_1.exp * 0.8 or 0) + var_0_0.CountBreakExp(iter_24_1) + GameSetting.base_exp_equip_star.value[var_24_2]
		local var_24_4 = GameSetting.equip_exp_props_id_list.value
		local var_24_5 = {
			var_24_4[3],
			var_24_4[2],
			var_24_4[1]
		}

		for iter_24_2 = 1, #var_24_5 do
			local var_24_6 = var_24_5[iter_24_2]
			local var_24_7 = ItemCfg[var_24_6].param[1]

			if var_24_7 <= var_24_3 then
				local var_24_8 = math.floor(var_24_3 / var_24_7)

				var_24_0[var_24_6] = (var_24_0[var_24_6] or 0) + var_24_8
				var_24_3 = var_24_3 - var_24_7 * var_24_8
			end
		end

		local var_24_9 = EquipData:GetEquipData(iter_24_0):GetBreakCostReturn()

		for iter_24_3, iter_24_4 in pairs(var_24_9) do
			local var_24_10 = iter_24_4[1] or 0
			local var_24_11 = iter_24_4[2] or 0

			var_24_0[var_24_10] = (var_24_0[var_24_10] or 0) + var_24_11
		end
	end

	for iter_24_5, iter_24_6 in pairs(var_24_0) do
		if iter_24_6 > 0 then
			table.insert(var_24_1, {
				id = iter_24_5,
				number = iter_24_6
			})
		end
	end

	return var_24_1
end

function var_0_0.CountNeedExp(arg_25_0, arg_25_1, arg_25_2)
	local var_25_0 = 0
	local var_25_1 = EquipCfg[arg_25_0.prefab_id]
	local var_25_2 = "exp" .. var_25_1.starlevel

	for iter_25_0 = 1, arg_25_1 - 1 do
		var_25_0 = var_25_0 + EquipExpCfg[iter_25_0][var_25_2]
	end

	return var_25_0
end

function var_0_0.GetLockedEquipS()
	local var_26_0 = {}
	local var_26_1 = EquipData:GetEquipList()

	for iter_26_0, iter_26_1 in pairs(var_26_1) do
		if iter_26_1.is_lock and iter_26_1.is_lock == 1 then
			table.insert(var_26_0, iter_26_1.equip_id)
		end
	end

	return var_26_0
end

function var_0_0.GetHeroUsedEquipS()
	local var_27_0 = {}
	local var_27_1 = HeroData:GetHeroList()

	for iter_27_0, iter_27_1 in pairs(var_27_1) do
		if iter_27_1.equip then
			for iter_27_2, iter_27_3 in pairs(iter_27_1.equip) do
				if iter_27_3.equip_id ~= 0 then
					table.insert(var_27_0, iter_27_3.equip_id)
				end
			end
		end
	end

	return var_27_0
end

function var_0_0.GetSuitEquipNum(arg_28_0, arg_28_1, arg_28_2, arg_28_3)
	local var_28_0 = EquipData:GetEquipList()
	local var_28_1 = 0

	for iter_28_0, iter_28_1 in pairs(var_28_0) do
		local var_28_2 = EquipCfg[iter_28_1.prefab_id]
		local var_28_3 = arg_28_3 and HeroData:GetEquipMap()[iter_28_1.equip_id]
		local var_28_4 = arg_28_2 == 0 or arg_28_2 == nil or var_28_2.pos == arg_28_2

		if not var_28_3 and var_28_4 and (not arg_28_1 or not table.keyof(arg_28_1, iter_28_1.equip_id)) and var_28_2.suit == arg_28_0 then
			var_28_1 = var_28_1 + 1
		end
	end

	return var_28_1
end

function var_0_0.GetEquipSkillNum(arg_29_0, arg_29_1, arg_29_2, arg_29_3)
	local var_29_0 = EquipData:GetEquipList()
	local var_29_1 = 0

	for iter_29_0, iter_29_1 in pairs(var_29_0) do
		local var_29_2 = EquipCfg[iter_29_1.prefab_id]
		local var_29_3 = arg_29_3 and HeroData:GetEquipMap()[iter_29_1.equip_id]
		local var_29_4 = arg_29_2 == 0 or arg_29_2 == nil or var_29_2.pos == arg_29_2
		local var_29_5 = false

		if not var_29_3 and var_29_4 and (not arg_29_1 or not table.keyof(arg_29_1, iter_29_1.equip_id)) then
			for iter_29_2, iter_29_3 in ipairs(var_29_2.effect) do
				if iter_29_3 and iter_29_3[1] and iter_29_3[1] == arg_29_0 then
					var_29_5 = true

					break
				end
			end

			if not var_29_5 then
				for iter_29_4, iter_29_5 in pairs(iter_29_1.enchant) do
					for iter_29_6, iter_29_7 in ipairs(iter_29_5) do
						if iter_29_7 and iter_29_7.id and iter_29_7.id == arg_29_0 then
							var_29_5 = true

							break
						end
					end
				end
			end

			if var_29_5 then
				var_29_1 = var_29_1 + 1
			end
		end
	end

	return var_29_1
end

function var_0_0.GetEquipInfoById(arg_30_0)
	return EquipData:GetEquipList()[arg_30_0]
end

function var_0_0.CountAddExp(arg_31_0, arg_31_1)
	local var_31_0 = 0

	for iter_31_0, iter_31_1 in pairs(arg_31_0) do
		var_31_0 = var_31_0 + ItemCfg[iter_31_0].param[1] * iter_31_1
	end

	for iter_31_2, iter_31_3 in pairs(arg_31_1) do
		local var_31_1 = EquipCfg[iter_31_3.id].starlevel

		var_31_0 = var_31_0 + (iter_31_3.equip_info.exp * 0.8 or 0) + var_0_0.CountBreakExp(iter_31_3) + GameSetting.base_exp_equip_star.value[var_31_1]
	end

	return var_31_0
end

function var_0_0.CountBreakExp(arg_32_0)
	return 0
end

function var_0_0.QuickSelectList(arg_33_0, arg_33_1)
	local var_33_0 = EquipData:GetEquipList()
	local var_33_1 = {}

	for iter_33_0, iter_33_1 in ipairs(ItemCfg.get_id_list_by_type[ItemConst.ITEM_TYPE.MATERIAL]) do
		local var_33_2 = ItemTools.getItemNum(iter_33_1)
		local var_33_3 = ItemCfg[iter_33_1]

		if var_33_3.sub_type == MaterialConst.MATERIAL_TYPE.EQUIP_LEVEL_UP and var_33_2 > 0 then
			table.insert(var_33_1, {
				id = iter_33_1,
				add = var_33_3.param[1],
				num = var_33_2
			})
		end
	end

	local var_33_4 = 0
	local var_33_5 = {}
	local var_33_6 = {}
	local var_33_7 = arg_33_0 - var_33_4
	local var_33_8 = {}

	for iter_33_2 = 1, #var_33_1 do
		local var_33_9 = var_33_1[iter_33_2].add

		var_33_8[iter_33_2] = math.max(math.min(math.ceil(var_33_7 / var_33_9), var_33_1[iter_33_2].num), 0)
		var_33_7 = var_33_7 - var_33_8[iter_33_2] * var_33_9

		if var_33_7 < 0 and iter_33_2 > 1 then
			local var_33_10 = -var_33_7

			for iter_33_3 = iter_33_2 - 1, 1, -1 do
				local var_33_11 = var_33_1[iter_33_3].add
				local var_33_12 = math.modf(var_33_10 / var_33_11)
				local var_33_13 = var_33_8[iter_33_3]

				var_33_8[iter_33_3] = math.max(0, var_33_8[iter_33_3] - var_33_12)

				local var_33_14 = math.min(var_33_13, var_33_12)

				var_33_10 = var_33_10 - var_33_11 * var_33_14
				var_33_7 = var_33_7 + var_33_11 * var_33_14
			end
		end

		if var_33_7 <= 0 then
			break
		end
	end

	for iter_33_4 = 1, #var_33_1 do
		if var_33_8[iter_33_4] == nil then
			var_33_8[iter_33_4] = 0
		end

		var_33_4 = var_33_4 + var_33_8[iter_33_4] * var_33_1[iter_33_4].add
		var_33_5[var_33_1[iter_33_4].id] = var_33_8[iter_33_4]
	end

	if var_33_7 > 0 then
		local var_33_15 = EquipData:GetEquipListComplex(ItemConst.SORT_TYPE.UP, EquipConst.EQUIP_SORT.RARE)
		local var_33_16 = HeroTools.GetEquipMap(HeroData:GetHeroList())
		local var_33_17 = ProposalData:GetEquipMap()
		local var_33_18 = #var_33_15

		for iter_33_5 = 1, var_33_18 do
			local var_33_19 = arg_33_0 - var_33_4
			local var_33_20 = var_33_15[iter_33_5].equip_id
			local var_33_21 = var_33_0[var_33_20]

			if var_33_19 <= 0 then
				break
			end

			local var_33_22 = EquipCfg[var_33_21.prefab_id]

			if var_33_16[var_33_20] == nil and var_33_21.exp == 0 and var_33_21.now_break_level == 0 and var_33_21.star < 5 and not var_33_21.is_lock and not var_33_17[var_33_21.equip_id] and not table.indexof(arg_33_1, var_33_21.equip_id) then
				var_33_6[var_33_20] = {
					isEquiped = false,
					number = 1,
					type = ItemConst.ITEM_TYPE.EQUIP,
					id = var_33_21.prefab_id,
					equip_id = var_33_21.equip_id,
					equip_info = var_33_21,
					equip_star = getItemStar(var_33_21.prefab_id),
					equip_lv = var_0_0.CountEquipLevel(var_33_21)
				}
				var_33_4 = var_33_4 + GameSetting.base_exp_equip_star.value[var_33_21.star]
			end
		end
	end

	return var_33_5, var_33_6
end

function var_0_0.CountRestAddExp(arg_34_0, arg_34_1)
	local var_34_0 = 0

	for iter_34_0 = arg_34_1, 1, -1 do
		var_34_0 = var_34_0 + arg_34_0[iter_34_0].add * arg_34_0[iter_34_0].num
	end

	return var_34_0
end

function var_0_0.QuickMaterialList(arg_35_0, arg_35_1)
	local var_35_0 = {}
	local var_35_1 = {}
	local var_35_2 = 0

	for iter_35_0, iter_35_1 in ipairs(arg_35_1) do
		local var_35_3 = arg_35_0 - var_35_2

		if var_35_3 > 0 then
			local var_35_4 = ItemCfg[iter_35_1.id].param[1]
			local var_35_5 = math.min(math.ceil(var_35_3 / var_35_4), iter_35_1.num)

			var_35_0[iter_35_1.id] = var_35_5
			var_35_1[iter_35_0] = var_35_5
			var_35_2 = var_35_2 + var_35_5 * var_35_4
		else
			var_35_1[iter_35_0] = 0
		end
	end

	return var_35_0, var_35_1
end

function var_0_0.QuickEquipList(arg_36_0, arg_36_1, arg_36_2)
	local var_36_0 = {}
	local var_36_1 = 0

	for iter_36_0, iter_36_1 in ipairs(arg_36_1) do
		local var_36_2 = arg_36_0 - var_36_1
		local var_36_3 = var_0_0.GetEquipInfoById(iter_36_1)
		local var_36_4 = EquipCfg[equip.prefab_id].starlevel

		if var_36_2 > 0 and var_36_4 <= arg_36_2 then
			var_36_0[iter_36_1] = var_36_3
			var_36_1 = var_36_1 + var_36_3.exp + GameSetting.base_exp_equip_star.value[var_36_4]
		end
	end

	return var_36_0
end

function var_0_0.GetEquipSuitEffect(arg_37_0)
	local var_37_0 = {}
	local var_37_1 = deepClone(EquipSuitCfg.get_id_list_by_suit[EquipCfg[arg_37_0.prefab_id].suit])

	table.sort(var_37_1, function(arg_38_0, arg_38_1)
		return EquipSuitCfg[arg_38_0].need < EquipSuitCfg[arg_38_1].need
	end)

	return var_37_1
end

function var_0_0.CountSuitEffect(arg_39_0)
	local var_39_0 = {}

	for iter_39_0, iter_39_1 in pairs(arg_39_0) do
		local var_39_1 = EquipCfg[iter_39_1.prefab_id].suit

		var_39_0[var_39_1] = 1 + (var_39_0[var_39_1] or 0)
	end

	local var_39_2 = {}

	for iter_39_2, iter_39_3 in pairs(var_39_0) do
		local var_39_3 = EquipSuitCfg.get_id_list_by_suit[iter_39_2]

		for iter_39_4, iter_39_5 in ipairs(var_39_3) do
			if iter_39_3 >= EquipSuitCfg[iter_39_5].need then
				table.insert(var_39_2, iter_39_5)
			end
		end
	end

	return var_39_2
end

function var_0_0.Filt(arg_40_0, arg_40_1)
	local var_40_0 = deepClone(arg_40_0)

	for iter_40_0, iter_40_1 in pairs(var_40_0) do
		if not arg_40_1[EquipCfg[iter_40_1.prefab_id].pos] then
			var_40_0[iter_40_0] = nil
		end
	end

	return var_40_0
end

function var_0_0.MutiFilt(arg_41_0, arg_41_1)
	local var_41_0 = deepClone(arg_41_0)

	for iter_41_0, iter_41_1 in pairs(var_41_0) do
		for iter_41_2, iter_41_3 in pairs(arg_41_1) do
			if not iter_41_3[EquipCfg[iter_41_1.prefab_id][iter_41_2]] then
				var_41_0[iter_41_0] = nil
			end
		end
	end

	return var_41_0
end

function var_0_0.FiltByPos(arg_42_0, arg_42_1)
	local var_42_0 = deepClone(arg_42_0)

	for iter_42_0, iter_42_1 in pairs(var_42_0) do
		if not arg_42_1[EquipCfg[iter_42_1.prefab_id].pos] then
			var_42_0[iter_42_0] = nil
		end
	end

	return var_42_0
end

function var_0_0.FiltBySuit(arg_43_0, arg_43_1)
	local var_43_0 = deepClone(arg_43_0)

	for iter_43_0, iter_43_1 in pairs(var_43_0) do
		if not arg_43_1[EquipCfg[iter_43_1.prefab_id].suit] then
			var_43_0[iter_43_0] = nil
		end
	end

	return var_43_0
end

function var_0_0.EquipSort(arg_44_0, arg_44_1, arg_44_2)
	local var_44_0 = {}

	for iter_44_0, iter_44_1 in pairs(arg_44_0) do
		table.insert(var_44_0, iter_44_1)
	end

	local var_44_1 = arg_44_2 or 0
	local var_44_2 = arg_44_1 or 0

	local function var_44_3(arg_45_0, arg_45_1)
		if var_44_2 == ItemConst.SORT_TYPE.DOWN then
			return arg_45_1 < arg_45_0
		else
			return arg_45_0 < arg_45_1
		end
	end

	if var_44_1 == EquipConst.EQUIP_SORT.LEVEL then
		local function var_44_4(arg_46_0, arg_46_1)
			if arg_46_0:GetLevel() ~= arg_46_1:GetLevel() then
				return var_44_3(arg_46_0:GetLevel(), arg_46_1:GetLevel())
			elseif arg_46_0.now_break_level ~= arg_46_1.now_break_level then
				return var_44_3(arg_46_0.now_break_level, arg_46_1.now_break_level)
			elseif arg_46_0.star ~= arg_46_1.star then
				return var_44_3(arg_46_0.star, arg_46_1.star)
			elseif arg_46_0:GetSuit() ~= arg_46_1:GetSuit() then
				return arg_46_0:GetSuit() < arg_46_1:GetSuit()
			elseif arg_46_0.prefab_id and arg_46_1.prefab_id and arg_46_0.prefab_id ~= arg_46_1.prefab_id then
				return arg_46_0.prefab_id < arg_46_1.prefab_id
			elseif arg_46_0.equip_id ~= arg_46_1.equip_id then
				return var_44_3(arg_46_0.equip_id, arg_46_1.equip_id)
			end

			return false
		end

		table.sort(var_44_0, var_44_4)
	elseif var_44_1 == EquipConst.EQUIP_SORT.RARE then
		local function var_44_5(arg_47_0, arg_47_1)
			if arg_47_0.star ~= arg_47_1.star then
				return var_44_3(arg_47_0.star, arg_47_1.star)
			elseif arg_47_0:GetLevel() ~= arg_47_1:GetLevel() then
				return var_44_3(arg_47_0:GetLevel(), arg_47_1:GetLevel())
			elseif arg_47_0.now_break_level ~= arg_47_1.now_break_level then
				return var_44_3(arg_47_0.now_break_level, arg_47_1.now_break_level)
			elseif arg_47_0:GetSuit() ~= arg_47_1:GetSuit() then
				return arg_47_0:GetSuit() < arg_47_1:GetSuit()
			elseif arg_47_0.prefab_id and arg_47_1.prefab_id and arg_47_0.prefab_id ~= arg_47_1.prefab_id then
				return arg_47_0.prefab_id < arg_47_1.prefab_id
			elseif arg_47_0.equip_id ~= arg_47_1.equip_id then
				return var_44_3(arg_47_0.equip_id, arg_47_1.equip_id)
			end

			return false
		end

		table.sort(var_44_0, var_44_5)
	else
		local function var_44_6(arg_48_0, arg_48_1)
			if arg_48_0.equip_id ~= arg_48_1.equip_id then
				return var_44_3(arg_48_0.equip_id, arg_48_1.equip_id)
			end

			return false
		end

		table.sort(var_44_0, var_44_6)
		print("EquipSort Fucntion cant find current sort Type")
	end

	return var_44_0
end

function var_0_0.GetEffectDesc(arg_49_0)
	local var_49_0 = EquipEffectCfg[arg_49_0]

	if not var_49_0 then
		print("装备效果 id" .. arg_49_0 .. "没有配置")
	end

	if var_49_0.desc and var_49_0.desc ~= "" then
		return GetCfgDescription(var_49_0.desc[1], 1)
	end

	return ""
end

function var_0_0.GetEffectDescOld(arg_50_0)
	if arg_50_0 == nil then
		return ""
	end

	local var_50_0 = EquipEffectCfg[arg_50_0]
	local var_50_1 = var_50_0.desc
	local var_50_2 = {}

	for iter_50_0 in string.gmatch(var_50_0.desc, "@{.-}") do
		local var_50_3 = 0
		local var_50_4 = string.sub(iter_50_0, 3, -2)
		local var_50_5 = string.split(var_50_4, "_")
		local var_50_6 = EquipEffectCfg[tonumber(var_50_5[1])]
		local var_50_7 = var_50_3 + tonumber(var_50_6.param[tonumber(var_50_5[2])])

		var_50_2[#var_50_2 + 1] = var_50_7
	end

	for iter_50_1 = 1, #var_50_2 do
		var_50_1 = string.gsub(var_50_1, "@{.-}", var_50_2[iter_50_1], 1)
	end

	return var_50_1
end

function var_0_0.GetSkillDescWithoutHero(arg_51_0, arg_51_1, arg_51_2)
	local var_51_0 = EquipSkillCfg[arg_51_0]
	local var_51_1 = ""
	local var_51_2 = GameSetting.exclusive_skill_cd_type.value
	local var_51_3 = GameSetting.exclusive_skill_level_up_type.value
	local var_51_4 = GameSetting.exclusive_skill_damage_type.value
	local var_51_5 = false

	if not var_51_5 then
		for iter_51_0, iter_51_1 in ipairs(var_51_2) do
			if arg_51_0 == iter_51_1[1] then
				var_51_5 = iter_51_1[2]
			end
		end
	end

	if not var_51_5 then
		for iter_51_2, iter_51_3 in ipairs(var_51_3) do
			if arg_51_0 == iter_51_3[1] then
				var_51_5 = iter_51_3[2]
			end
		end
	end

	if not var_51_5 then
		for iter_51_4, iter_51_5 in ipairs(var_51_4) do
			if arg_51_0 == iter_51_5[1] then
				local var_51_6 = iter_51_5[2]
			end
		end
	end

	local var_51_7 = ""

	if arg_51_1 == 0 then
		var_51_7 = EquipTools.Calculate(var_51_0.upgrade / var_51_0.percent * 1, arg_51_0)
	elseif arg_51_1 < var_51_0.lvmax then
		if arg_51_2 then
			var_51_7 = EquipTools.Calculate(var_51_0.upgrade / var_51_0.percent * arg_51_1, arg_51_0)
		else
			var_51_7 = EquipTools.Calculate(var_51_0.upgrade / var_51_0.percent * arg_51_1, arg_51_0) .. string.format(GetTips("EQUIP_HERO_SKILL_NEXT_LEVEL"), EquipTools.Calculate(var_51_0.upgrade / var_51_0.percent * (arg_51_1 + 1), arg_51_0))
		end
	else
		var_51_7 = EquipTools.Calculate(var_51_0.upgrade / var_51_0.percent * arg_51_1, arg_51_0)
	end

	return GetCfgDescriptionWithValue(var_51_0.desc[1], var_51_7)
end

function var_0_0.GetSkillDesc(arg_52_0, arg_52_1, arg_52_2)
	local var_52_0 = EquipSkillCfg[arg_52_0]
	local var_52_1 = HeroCfg[arg_52_2]
	local var_52_2 = ""
	local var_52_3 = GameSetting.exclusive_skill_cd_type.value
	local var_52_4 = GameSetting.exclusive_skill_level_up_type.value
	local var_52_5 = GameSetting.exclusive_skill_damage_type.value
	local var_52_6 = false

	if not var_52_6 then
		for iter_52_0, iter_52_1 in ipairs(var_52_3) do
			if arg_52_0 == iter_52_1[1] then
				var_52_6 = iter_52_1[2]
			end
		end
	end

	if not var_52_6 then
		for iter_52_2, iter_52_3 in ipairs(var_52_4) do
			if arg_52_0 == iter_52_3[1] then
				var_52_6 = iter_52_3[2]
			end
		end
	end

	if not var_52_6 then
		for iter_52_4, iter_52_5 in ipairs(var_52_5) do
			if arg_52_0 == iter_52_5[1] then
				var_52_6 = iter_52_5[2]
			end
		end
	end

	if var_52_6 then
		local var_52_7 = var_52_1.skills[var_52_6]
		local var_52_8 = HeroSkillCfg[var_52_7].name
	end

	local var_52_9 = ""

	if arg_52_1 == 0 then
		var_52_9 = EquipTools.Calculate(var_52_0.upgrade / var_52_0.percent * 1, arg_52_0)
	elseif arg_52_1 < var_52_0.lvmax then
		var_52_9 = EquipTools.Calculate(var_52_0.upgrade / var_52_0.percent * arg_52_1, arg_52_0) .. string.format(GetTips("EQUIP_HERO_SKILL_NEXT_LEVEL"), EquipTools.Calculate(var_52_0.upgrade / var_52_0.percent * (arg_52_1 + 1), arg_52_0))
	else
		var_52_9 = EquipTools.Calculate(var_52_0.upgrade / var_52_0.percent * arg_52_1, arg_52_0)
	end

	return GetCfgDescriptionWithValue(var_52_0.desc[1], var_52_9)
end

function var_0_0.GetSkillDescWithoutNext(arg_53_0, arg_53_1, arg_53_2)
	local var_53_0 = EquipSkillCfg[arg_53_0]
	local var_53_1 = HeroCfg[arg_53_2]
	local var_53_2 = ""
	local var_53_3 = GameSetting.exclusive_skill_cd_type.value
	local var_53_4 = GameSetting.exclusive_skill_level_up_type.value
	local var_53_5 = GameSetting.exclusive_skill_damage_type.value
	local var_53_6 = false

	if not var_53_6 then
		for iter_53_0, iter_53_1 in ipairs(var_53_3) do
			if arg_53_0 == iter_53_1[1] then
				var_53_6 = iter_53_1[2]
			end
		end
	end

	if not var_53_6 then
		for iter_53_2, iter_53_3 in ipairs(var_53_4) do
			if arg_53_0 == iter_53_3[1] then
				var_53_6 = iter_53_3[2]
			end
		end
	end

	if not var_53_6 then
		for iter_53_4, iter_53_5 in ipairs(var_53_5) do
			if arg_53_0 == iter_53_5[1] then
				var_53_6 = iter_53_5[2]
			end
		end
	end

	if var_53_6 then
		local var_53_7 = var_53_1.skills[var_53_6]
		local var_53_8 = HeroSkillCfg[var_53_7].name
	end

	local var_53_9 = ""

	if arg_53_1 == 0 then
		var_53_9 = EquipTools.Calculate(var_53_0.upgrade / var_53_0.percent * 1, arg_53_0)
	else
		var_53_9 = EquipTools.Calculate(var_53_0.upgrade / var_53_0.percent * arg_53_1, arg_53_0)
	end

	return GetCfgDescriptionWithValue(var_53_0.desc[1], var_53_9)
end

function var_0_0.Calculate(arg_54_0, arg_54_1)
	local var_54_0 = GameDisplayCfg.equip_hero_skill_int.value

	if table.indexof(var_54_0, arg_54_1) then
		return arg_54_0
	else
		return string.format("%.1f%%", arg_54_0)
	end
end

function var_0_0.GetIsHide(arg_55_0)
	local var_55_0 = EquipCfg[arg_55_0].suit

	hideList = HideInfoData:GetEquipSuitHideList()

	return hideList[var_55_0] or false
end

function var_0_0.GetSuitTotalNum()
	local var_56_0 = HideInfoData:GetEquipSuitHideList()
	local var_56_1 = 0

	for iter_56_0, iter_56_1 in ipairs(EquipSuitCfg.all) do
		if not var_56_0[iter_56_1] then
			var_56_1 = var_56_1 + 1
		end
	end

	return var_56_1
end

return var_0_0
