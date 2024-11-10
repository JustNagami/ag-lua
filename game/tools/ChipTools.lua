local var_0_0 = {
	SortChipManager = function(arg_1_0)
		local var_1_0 = ChipData:GetChipManagerList()
		local var_1_1 = {}
		local var_1_2 = {}
		local var_1_3 = {}
		local var_1_4 = ChipData:GetUnlockChipManagerIDList()

		for iter_1_0, iter_1_1 in pairs(var_1_0) do
			if iter_1_0 ~= arg_1_0 then
				if table.keyof(var_1_4, iter_1_0) then
					table.insert(var_1_1, iter_1_0)
				elseif IsConditionAchieved(ChipCfg[iter_1_0].new_condition) then
					table.insert(var_1_2, iter_1_0)
				else
					table.insert(var_1_3, iter_1_0)
				end
			end
		end

		table.sort(var_1_1, function(arg_2_0, arg_2_1)
			return arg_2_0 < arg_2_1
		end)
		table.sort(var_1_2, function(arg_3_0, arg_3_1)
			return arg_3_0 < arg_3_1
		end)
		table.sort(var_1_3, function(arg_4_0, arg_4_1)
			return arg_4_0 < arg_4_1
		end)
		table.insertto(var_1_1, var_1_2)
		table.insertto(var_1_1, var_1_3)

		if arg_1_0 ~= 0 then
			table.insert(var_1_1, 1, arg_1_0)
		end

		if manager.guide:IsPlaying() then
			local var_1_5 = table.indexof(var_1_1, 6)

			if var_1_5 then
				table.remove(var_1_1, var_1_5)
				table.insert(var_1_1, 1, 6)
			end
		end

		return var_1_1
	end
}

function var_0_0.SortChip(arg_5_0, arg_5_1)
	local var_5_0 = ChipData:GetChipManagerList()[arg_5_1]

	return var_0_0.SortChipList(var_5_0, arg_5_0, arg_5_1)
end

function var_0_0.SortChipList(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
	local var_6_0 = {}
	local var_6_1 = {}
	local var_6_2 = {}
	local var_6_3 = {}
	local var_6_4

	if arg_6_3 then
		var_6_4 = ChipData:GetUnlockHeroChipIDList()
	else
		var_6_4 = ChipData:GetUnlockChipIDList()
	end

	for iter_6_0, iter_6_1 in pairs(arg_6_1) do
		if not table.keyof(arg_6_0, iter_6_1) then
			if table.keyof(var_6_4, iter_6_1) then
				table.insert(var_6_1, iter_6_1)
			else
				local var_6_5

				if ChipCfg[iter_6_1].new_condition > 0 then
					if ChipCfg[iter_6_1].spec_char > 0 then
						var_6_5 = IsConditionAchieved(ChipCfg[iter_6_1].new_condition, {
							heroId = ChipCfg[iter_6_1].spec_char
						})
					else
						var_6_5 = IsConditionAchieved(ChipCfg[iter_6_1].new_condition)
					end
				else
					var_6_5 = ItemTools.getItemNum(ChipCfg[iter_6_1].cost_condition[1][1]) >= ChipCfg[iter_6_1].cost_condition[1][1] and true or false
				end

				if var_6_5 then
					table.insert(var_6_2, iter_6_1)
				else
					table.insert(var_6_3, iter_6_1)
				end
			end
		else
			table.insert(var_6_0, iter_6_1)
		end
	end

	var_0_0.SortRegular(var_6_1)
	var_0_0.SortRegular(var_6_2)
	var_0_0.SortRegular(var_6_3)
	table.insertto(var_6_0, var_6_1)
	table.insertto(var_6_0, var_6_2)
	table.insertto(var_6_0, var_6_3)

	return var_6_0
end

function var_0_0.GetChipCanLocked(arg_7_0)
	if not ChipCfg[arg_7_0] then
		return false
	end

	local var_7_0 = ChipCfg[arg_7_0].new_condition

	return (IsConditionAchieved(var_7_0))
end

function var_0_0.SortRegular(arg_8_0)
	table.sort(arg_8_0, function(arg_9_0, arg_9_1)
		local var_9_0 = ChipCfg[arg_9_0].spec_char
		local var_9_1 = ChipCfg[arg_9_1].spec_char

		if var_9_0 ~= 0 and var_9_1 == 0 then
			return false
		end

		return arg_9_0 < arg_9_1
	end)
end

function var_0_0.FormatChipByRoleType(arg_10_0)
	local var_10_0 = {}

	if type(arg_10_0) ~= "table" then
		return var_10_0
	end

	for iter_10_0, iter_10_1 in ipairs(arg_10_0) do
		var_10_0[ChipCfg[iter_10_1].role_type_id] = iter_10_1
	end

	return var_10_0
end

function var_0_0.GetChipTypeList(arg_11_0)
	local var_11_0 = {
		-1,
		0
	}
	local var_11_1 = {}

	for iter_11_0, iter_11_1 in ipairs(arg_11_0) do
		local var_11_2 = ChipCfg[iter_11_1].spec_char

		if not table.keyof(var_11_1, var_11_2) and var_11_2 ~= 0 then
			table.insert(var_11_1, var_11_2)
		end
	end

	local var_11_3 = HeroTools.SortHero(var_11_1)

	table.insertto(var_11_0, var_11_3)

	return var_11_0
end

function var_0_0.GetChipTypeCntList(arg_12_0)
	local var_12_0 = {
		[-1] = {}
	}

	for iter_12_0, iter_12_1 in ipairs(arg_12_0) do
		local var_12_1 = ChipCfg[iter_12_1].spec_char

		var_12_0[var_12_1] = var_12_0[var_12_1] or {}

		table.insert(var_12_0[var_12_1], iter_12_1)
		table.insert(var_12_0[-1], iter_12_1)
	end

	return var_12_0
end

function var_0_0.SortScheme(arg_13_0)
	local var_13_0 = ChipData:GetChipManagerList()[arg_13_0]
	local var_13_1 = ChipData:GetSchemeList()
	local var_13_2 = {
		{
			id = 0,
			name = GetTips("CURRENT_SCHEME"),
			chipList = var_13_0
		}
	}

	for iter_13_0, iter_13_1 in pairs(var_13_1) do
		local var_13_3 = #var_13_0 == #iter_13_1.chipList

		for iter_13_2, iter_13_3 in ipairs(iter_13_1.chipList) do
			if not table.keyof(var_13_0, iter_13_3) then
				var_13_3 = false

				break
			end
		end

		if var_13_3 then
			var_13_2[1] = clone(iter_13_1)
		else
			table.insert(var_13_2, clone(iter_13_1))
		end
	end

	local var_13_4 = GameSetting.ai_chip_proposal_num_max.value[1] + (var_13_2[1].id == 0 and 1 or 0)

	for iter_13_4 = #var_13_2 + 1, var_13_4 do
		table.insert(var_13_2, {
			id = -1
		})
	end

	return var_13_2
end

function var_0_0.InsertChip(arg_14_0, arg_14_1, arg_14_2)
	local var_14_0, var_14_1 = var_0_0.InternalInsertChip(arg_14_0, arg_14_1)

	if var_14_0 == true then
		if arg_14_2 then
			arg_14_2(arg_14_0)
		end

		ShowTips("CHIP_USE_SUCCESS")
		manager.notify:Invoke(ENABLED_CHIP)
	elseif var_14_1 then
		ShowTips(var_14_1)
	end
end

function var_0_0.RemoveChip(arg_15_0, arg_15_1, arg_15_2)
	local var_15_0, var_15_1 = var_0_0.InternalRemoveChip(arg_15_0, arg_15_1)

	if var_15_0 == true then
		if arg_15_2 then
			arg_15_2(arg_15_0)
		end

		ShowTips("CHIP_UNLOAD_SUCCESS")
		manager.notify:Invoke(ENABLED_CHIP)
	elseif var_15_1 then
		ShowTips(var_15_1)
	end
end

function var_0_0.InternalInsertChip(arg_16_0, arg_16_1)
	local var_16_0 = true
	local var_16_1
	local var_16_2 = false
	local var_16_3 = 0
	local var_16_4 = ChipCfg[arg_16_1].spec_char
	local var_16_5 = ChipCfg.get_id_list_by_spec_char[var_16_4]

	for iter_16_0, iter_16_1 in ipairs(arg_16_0) do
		if ChipCfg[iter_16_1].spec_char ~= 0 and table.keyof(var_16_5, iter_16_1) and iter_16_1 ~= arg_16_1 then
			var_16_2 = true
			var_16_3 = iter_16_1

			break
		end
	end

	if not table.indexof(arg_16_0, arg_16_1) and not var_16_2 and #arg_16_0 >= GameSetting.ai_secondary_chip_equip_num.value[1] then
		var_16_0 = false
		var_16_1 = "CHIP_CNT_MORE_THEN_MAX"

		return var_16_0, var_16_1
	end

	if var_16_2 then
		local var_16_6 = table.indexof(arg_16_0, var_16_3)

		if var_16_6 then
			table.remove(arg_16_0, var_16_6)
		end
	end

	table.insert(arg_16_0, arg_16_1)

	return var_16_0, var_16_1
end

function var_0_0.InternalRemoveChip(arg_17_0, arg_17_1)
	local var_17_0 = table.indexof(arg_17_0, arg_17_1)

	if var_17_0 then
		table.remove(arg_17_0, var_17_0)
	end

	return true
end

function var_0_0.GetChipManagerIcon(arg_18_0)
	local var_18_0 = ChipCfg[arg_18_0]

	if not var_18_0 then
		Debug.Log(string.format("<color=ff0000>ChipCfg has no ID(%d)</color>", arg_18_0))

		return
	end

	return getSpriteWithoutAtlas("TextureConfig/Managecat_l/" .. var_18_0.picture_id)
end

return var_0_0
