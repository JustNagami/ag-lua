local var_0_0 = {}

manager.net:Bind(13009, function(arg_1_0)
	EquipData:EquipInit(arg_1_0.equip_list)
end)

function var_0_0.ModifyEquipList(arg_2_0)
	for iter_2_0, iter_2_1 in ipairs(arg_2_0) do
		if iter_2_1.num > 0 then
			EquipData:AddEquip(iter_2_1)
			IllustratedAction.ModifyEquipInfo(EquipCfg[iter_2_1.prefab_id].suit, EquipCfg[iter_2_1.prefab_id].pos)
		else
			EquipData:RemoveEquip(iter_2_1)
		end
	end

	EquipData:ResetEquipSort()

	if #arg_2_0 > 0 then
		manager.notify:Invoke(EQUIP_LIST_UPDATE)
	end
end

function var_0_0.EquipDecompose(arg_3_0)
	local var_3_0 = {}

	for iter_3_0, iter_3_1 in pairs(arg_3_0) do
		table.insert(var_3_0, iter_3_1.equip_id)
	end

	manager.net:SendWithLoadingNew(13024, {
		equip_id_list = var_3_0
	}, 13025, var_0_0.OnEquipDecompose)
end

function var_0_0.OnEquipDecompose(arg_4_0, arg_4_1)
	manager.notify:CallUpdateFunc(EQUIP_DECOMPOSE_CALLBACK, arg_4_0, arg_4_1)
end

function var_0_0.ApplyLockEquip(arg_5_0, arg_5_1)
	if arg_5_1 == EquipData:GetEquipData(arg_5_0).is_lock then
		return
	end

	local var_5_0 = arg_5_1 and 1 or 0

	manager.net:SendWithLoadingNew(13016, {
		equip_id = arg_5_0,
		is_lock = var_5_0
	}, 13017, var_0_0.OnApplyLockEquipCallBack)
end

function var_0_0.OnApplyLockEquipCallBack(arg_6_0, arg_6_1)
	if isSuccess(arg_6_0.result) then
		local var_6_0 = arg_6_1.is_lock == 1

		EquipData:ApplyLockEquipSuccess(arg_6_1.equip_id, var_6_0)
		manager.notify:CallUpdateFunc(EQUIP_LOCK, var_6_0)
		manager.notify:Invoke(EQUIP_LOCK, {
			equipID = arg_6_1.equip_id,
			lock = var_6_0
		})
	else
		ShowTips(arg_6_0.result)
	end
end

function var_0_0.ApplyStrengthEquip(arg_7_0, arg_7_1, arg_7_2, arg_7_3, arg_7_4)
	if not checkGold(arg_7_3) then
		return
	end

	local var_7_0, var_7_1 = var_0_0.TurnMatList(arg_7_1, arg_7_2)

	return manager.net:SendWithLoading(13014, {
		equip_id = arg_7_0,
		equip_list = var_7_0,
		mat_list = var_7_1
	}, 13015):next(function(arg_8_0)
		if isSuccess(arg_8_0.result) then
			var_0_0.OnStrengthEquip(arg_8_0, arg_7_0, arg_7_3, arg_7_1, arg_7_2)
		else
			ShowTips(arg_8_0.result)
		end
	end)
end

function var_0_0.OnStrengthEquip(arg_9_0, arg_9_1, arg_9_2, arg_9_3, arg_9_4)
	local var_9_0 = EquipData:GetEquipData(arg_9_1)
	local var_9_1 = deepClone(var_9_0)
	local var_9_2 = math.floor(arg_9_2 / GameSetting.equip_strengthen_gold_cost.value[1])

	EquipData:ApplyEquipStrengthSuccess(tonumber(arg_9_1), arg_9_3, arg_9_4, var_9_2)

	local var_9_3 = var_9_0:GetLevel()
	local var_9_4 = var_9_0:GetMaxLv()
	local var_9_5 = EquipCfg[var_9_0.prefab_id]
	local var_9_6 = var_9_1:GetLevel() ~= var_9_0:GetLevel()
	local var_9_7 = {
		type = "levelup",
		equipId = arg_9_1,
		equip = var_9_0,
		oldEquip = var_9_1,
		newEquip = var_9_0,
		callback = function()
			getReward2(mergeReward2(arg_9_0.mat_list))
		end
	}

	manager.notify:Invoke(EQUIP_STRENGTH_SUCCESS, var_9_4 <= var_9_3, var_9_6, var_9_7)
end

function var_0_0.ApplyUpgradeEquip(arg_11_0)
	local var_11_0 = EquipData:GetEquipData(arg_11_0)
	local var_11_1 = var_11_0:GetUpgradeCost()

	if GameSetting.equip_break_user_level.value[var_11_0.now_break_level + 1] > PlayerData:GetPlayerInfo().userLevel then
		ShowTips("ERROR_USER_LEVEL_LIMIT")

		return
	end

	if not checkGold(var_11_1.money) then
		return
	end

	for iter_11_0 = 1, #var_11_1.item_list do
		if ItemTools.getItemNum(var_11_1.item_list[iter_11_0][1]) < var_11_1.item_list[iter_11_0][2] then
			ShowTips("ERROR_ITEM_NOT_ENOUGH_MATERIAL")

			return
		end
	end

	return manager.net:SendWithLoading(13022, {
		equip_id = arg_11_0
	}, 13023):next(function(arg_12_0)
		if isSuccess(arg_12_0.result) then
			var_0_0.OnUpgrateEquip(arg_11_0)
		else
			ShowTips(arg_12_0.result)
		end
	end, function(arg_13_0)
		print(arg_13_0)
	end)
end

function var_0_0.OnUpgrateEquip(arg_14_0)
	local var_14_0 = EquipData:GetEquipData(arg_14_0)
	local var_14_1 = deepClone(var_14_0)

	EquipData:ApplyUpgradeEquipSuccess(tonumber(arg_14_0))

	local var_14_2 = {
		pageIndex = 2,
		type = "upgrade",
		equipId = arg_14_0,
		oldEquip = var_14_1,
		newEquip = var_14_0
	}

	manager.notify:Invoke(EQUIP_UPGRADE_SUCCESS, var_14_2)
end

function var_0_0.OneKeyStrength(arg_15_0, arg_15_1, arg_15_2, arg_15_3, arg_15_4, arg_15_5)
	if not checkGold(arg_15_3) then
		return
	end

	local var_15_0, var_15_1 = var_0_0.TurnMatList(arg_15_1, arg_15_2)

	return manager.net:SendWithLoading(13058, {
		equip_id = arg_15_0,
		equip_list = var_15_0,
		mat_list = var_15_1,
		target_level = arg_15_4,
		break_times = arg_15_5
	}, 13059):next(function(arg_16_0)
		if isSuccess(arg_16_0.result) then
			local var_16_0 = deepClone(EquipData:GetEquipData(arg_15_0))

			if arg_15_5 >= 1 then
				EquipData:ApplyUpgradeEquipSuccess(tonumber(arg_15_0), arg_15_5)
			end

			local var_16_1 = math.floor(arg_15_3 / GameSetting.equip_strengthen_gold_cost.value[1])

			EquipData:ApplyEquipStrengthSuccess(tonumber(arg_15_0), arg_15_1, arg_15_2, var_16_1)

			local var_16_2 = EquipData:GetEquipData(arg_15_0)
			local var_16_3 = var_16_2:GetLevel() >= var_16_2:GetMaxLv()
			local var_16_4 = EquipCfg[var_16_2.prefab_id]
			local var_16_5 = var_16_0:GetLevel() ~= var_16_2:GetLevel()
			local var_16_6 = {
				type = "levelup",
				equipId = arg_15_0,
				equip = var_16_2,
				oldEquip = var_16_0,
				newEquip = var_16_2,
				callback = function()
					getReward2(mergeReward2(arg_16_0.mat_list))
				end
			}

			if arg_15_5 >= 1 then
				local var_16_7 = {
					pageIndex = 2,
					type = "upgrade",
					equipId = arg_15_0,
					oldEquip = var_16_0,
					newEquip = var_16_2,
					callback = function()
						manager.notify:Invoke(EQUIP_STRENGTH_SUCCESS, var_16_3, var_16_5, var_16_6)
					end
				}

				manager.notify:Invoke(EQUIP_UPGRADE_SUCCESS, var_16_7)
			else
				manager.notify:Invoke(EQUIP_STRENGTH_SUCCESS, var_16_3, var_16_5, var_16_6)
			end
		else
			ShowTips(arg_16_0.result)
		end
	end)
end

function var_0_0.TurnMatList(arg_19_0, arg_19_1)
	local var_19_0 = {}

	for iter_19_0, iter_19_1 in pairs(arg_19_0) do
		table.insert(var_19_0, iter_19_1.equip_id)
	end

	local var_19_1 = {}

	for iter_19_2, iter_19_3 in pairs(arg_19_1) do
		table.insert(var_19_1, {
			id = iter_19_2,
			num = iter_19_3
		})
	end

	return var_19_0, var_19_1
end

function var_0_0.EquipQuickDressOn(arg_20_0, arg_20_1)
	return manager.net:SendWithLoadingNew(13026, {
		hero_id = arg_20_0,
		use_equip_list = arg_20_1
	}, 13027, var_0_0.OnEquipQuickDressOn)
end

function var_0_0.OnEquipQuickDressOn(arg_21_0, arg_21_1)
	local var_21_0 = true

	for iter_21_0, iter_21_1 in ipairs(arg_21_0.result) do
		if not isSuccess(iter_21_1.result) then
			var_21_0 = false
		end
	end

	if not var_21_0 then
		ShowTips(GetTips("EQUIP_DRESS_FAIL"))
	else
		manager.notify:CallUpdateFunc(EQUIP_QUICK_DRESS_ON, arg_21_0, arg_21_1)
	end
end

function var_0_0.QueryEquipEnchant(arg_22_0, arg_22_1, arg_22_2, arg_22_3)
	local var_22_0 = arg_22_2.id
	local var_22_1 = arg_22_2.money
	local var_22_2 = arg_22_2.number

	if not checkGold(var_22_1) then
		return
	end

	if var_22_2 > ItemTools.getItemNum(var_22_0) then
		ShowPopItem(POP_SOURCE_ITEM, {
			var_22_0,
			var_22_2
		})

		return
	end

	local var_22_3 = ItemCfg[var_22_0] and ItemCfg[var_22_0].param and ItemCfg[var_22_0].param[1]

	if not var_22_3 and var_22_3 ~= "" then
		return
	end

	manager.net:SendWithLoading(13028, {
		equip_id = arg_22_0,
		enchant_slot_id = arg_22_1,
		pool_id = var_22_3,
		lock_type = arg_22_3
	}, 13029):next(function(arg_23_0)
		if isSuccess(arg_23_0.result) then
			EquipData:AddPreEnchant(arg_22_0, arg_22_1, arg_23_0.enchant_preview)
			manager.notify:CallUpdateFunc(EQUIP_ENCHANT)
		else
			ShowTips(arg_23_0.result)
		end
	end)
end

function var_0_0.QueryEquipEnchantConfirm(arg_24_0, arg_24_1, arg_24_2, arg_24_3)
	return manager.net:SendWithLoading(13030, {
		equip_id = arg_24_0,
		enchant_slot_id = arg_24_1,
		confirm = arg_24_2,
		preview_index = arg_24_3
	}, 13031):next(function(arg_25_0)
		if isSuccess(arg_25_0.result) then
			EquipData:ConfirmEnchant(arg_24_0, arg_24_1, arg_24_2, arg_24_3)
			manager.notify:CallUpdateFunc(EQUIP_ENCHANT_CONFIRM, arg_24_2)
		else
			ShowTips(arg_25_0.result)
		end
	end)
end

function var_0_0.QueryEquipGiveUpAllEnchant(arg_26_0, arg_26_1)
	return manager.net:SendWithLoading(13044, {
		equip_id = arg_26_0,
		enchant_slot_id = arg_26_1
	}, 13045):next(function(arg_27_0)
		if isSuccess(arg_27_0.result) then
			EquipData:GiveUpAllEnchant(arg_26_0, arg_26_1)
			manager.notify:CallUpdateFunc(EQUIP_ENCHANT_GIVE_UP)
		else
			ShowTips(arg_27_0.result)
		end
	end)
end

function var_0_0.QueryEquipRace(arg_28_0, arg_28_1, arg_28_2)
	local var_28_0 = EquipData:GetRaceMaterial(arg_28_1)
	local var_28_1 = var_28_0.id
	local var_28_2 = var_28_0.money
	local var_28_3 = var_28_0.number

	if not checkGold(var_28_2) then
		return
	end

	if var_28_3 > ItemTools.getItemNum(var_28_1) then
		ShowPopItem(POP_SOURCE_ITEM, {
			var_28_1,
			var_28_3
		})

		return
	end

	local var_28_4
	local var_28_5
	local var_28_6 = {
		equip_id = arg_28_0
	}

	if arg_28_1 == 1 then
		var_28_4 = 13032
		var_28_5 = 13033
	else
		var_28_4 = 13046
		var_28_5 = 13047
		var_28_6.hero_id = arg_28_2
	end

	manager.net:SendWithLoading(var_28_4, var_28_6, var_28_5):next(function(arg_29_0)
		if isSuccess(arg_29_0.result) then
			if arg_28_1 == 2 then
				EquipData:SetPreRace(arg_28_0, arg_28_2)
				EquipData:ConfirmRace(arg_28_0, true)

				if not EquipData:GetEquipData(arg_28_0).is_lock then
					EquipAction.ApplyLockEquip(arg_28_0, true)
				end

				ShowTips("EQUIP_HERO_SUCCESS")
				JumpTools.OpenPageByJump("equipCulturePopView", {
					type = "reset",
					heroId = arg_28_2,
					callback = function()
						manager.notify:CallUpdateFunc(EQUIP_RACE)
					end
				})
			else
				EquipData:SetPreRace(arg_28_0, arg_29_0.race_preview)
				JumpTools.OpenPageByJump("/equipRaceConfirmView", {
					equipId = arg_28_0,
					heroId = arg_28_2
				})
				manager.notify:CallUpdateFunc(EQUIP_RACE)
			end
		else
			ShowTips(arg_29_0.result)
		end
	end)
end

function var_0_0.QueryEquipRaceConfirm(arg_31_0, arg_31_1)
	manager.net:SendWithLoading(13034, {
		equip_id = arg_31_0,
		confirm = arg_31_1
	}, 13035):next(function(arg_32_0)
		if isSuccess(arg_32_0.result) then
			EquipData:ConfirmRace(arg_31_0, arg_31_1)
			manager.notify:CallUpdateFunc(EQUIP_RACE_CONFIRM)
		else
			ShowTips(arg_32_0.result)
		end
	end)
end

function var_0_0.EquipBagFull(arg_33_0)
	EquipData:EquipBagFull(arg_33_0)
end

local var_0_1

function var_0_0.InheritEquip(arg_34_0, arg_34_1)
	var_0_1 = arg_34_1

	manager.net:SendWithLoadingNew(13052, {
		inherit_equip_prefab_id = arg_34_1,
		new_equip_id = arg_34_0
	}, 13053, var_0_0.OnInheritEquip)
end

function var_0_0.OnInheritEquip(arg_35_0, arg_35_1)
	if isSuccess(arg_35_0.result) then
		ShowTips("EQUIP_INHERIT_SUCCESS")
		manager.notify:CallUpdateFunc(EQUIP_INHERIT_SUCCESS, arg_35_1.new_equip_id)
	else
		ShowTips(arg_35_0.result)
	end
end

manager.net:Bind(13057, function(arg_36_0)
	EquipData:InitAutoDecompose(arg_36_0)
end)

function var_0_0.SetAutoDecomposeState(arg_37_0, arg_37_1, arg_37_2)
	manager.net:SendWithLoadingNew(13054, {
		type = arg_37_0,
		sign = arg_37_1 and 1 or 0
	}, 13055, function(arg_38_0)
		if isSuccess(arg_38_0.result) then
			EquipData:UpdateAutoDecompose(arg_37_0, arg_37_1)
			arg_37_2(arg_38_0)
		else
			ShowTips(arg_38_0.result)
		end
	end)
end

function var_0_0.DirectionalEnchant(arg_39_0, arg_39_1, arg_39_2, arg_39_3)
	manager.net:SendWithLoadingNew(13060, {
		equip_id = arg_39_0,
		enchant_slot_id = arg_39_1,
		seq = arg_39_2,
		id = arg_39_3
	}, 13061, function(arg_40_0)
		if isSuccess(arg_40_0.result) then
			local var_40_0 = EquipData:GetEquipData(arg_39_0):GetLevel()
			local var_40_1 = {
				num = 1,
				id = arg_39_3,
				equipLevel = var_40_0
			}

			EquipData:DirectionalEnchant(arg_39_0, arg_39_1, arg_39_2, var_40_1)
			manager.notify:Invoke(DIRECTIONAL_ENCHANT_SUCCESS)
		else
			ShowTips(arg_40_0.result)
		end
	end)
end

return var_0_0
