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

	local var_7_0 = {}

	for iter_7_0, iter_7_1 in pairs(arg_7_1) do
		table.insert(var_7_0, iter_7_1.equip_id)
	end

	local var_7_1 = {}

	for iter_7_2, iter_7_3 in pairs(arg_7_2) do
		table.insert(var_7_1, {
			id = iter_7_2,
			num = iter_7_3
		})
	end

	return manager.net:SendWithLoading(13014, {
		equip_id = arg_7_0,
		equip_list = var_7_0,
		mat_list = var_7_1
	}, 13015):next(function(arg_8_0)
		if isSuccess(arg_8_0.result) then
			local var_8_0 = EquipData:GetEquipData(arg_7_0)
			local var_8_1 = deepClone(var_8_0)
			local var_8_2 = math.floor(arg_7_3 / GameSetting.equip_strengthen_gold_cost.value[1])

			EquipData:ApplyEquipStrengthSuccess(tonumber(arg_7_0), arg_7_1, arg_7_2, var_8_2)

			local var_8_3 = var_8_0:GetLevel()
			local var_8_4 = var_8_0:GetMaxLv()
			local var_8_5 = EquipCfg[var_8_0.prefab_id]
			local var_8_6 = var_8_1:GetLevel() ~= var_8_0:GetLevel()
			local var_8_7 = {
				type = "levelup",
				equipId = arg_7_0,
				equip = var_8_0,
				oldEquip = var_8_1,
				newEquip = var_8_0,
				callback = function()
					getReward2(mergeReward2(arg_8_0.mat_list))
				end
			}

			manager.notify:Invoke(EQUIP_STRENGTH_SUCCESS, var_8_4 <= var_8_3, var_8_6, var_8_7)
		else
			ShowTips(arg_8_0.result)
		end
	end)
end

function var_0_0.ApplyUpgradeEquip(arg_10_0)
	local var_10_0 = EquipData:GetEquipData(arg_10_0)
	local var_10_1 = var_10_0:GetUpgradeCost()

	if GameSetting.equip_break_user_level.value[var_10_0.now_break_level + 1] > PlayerData:GetPlayerInfo().userLevel then
		ShowTips("ERROR_USER_LEVEL_LIMIT")

		return
	end

	if not checkGold(var_10_1.money) then
		return
	end

	for iter_10_0 = 1, #var_10_1.item_list do
		if ItemTools.getItemNum(var_10_1.item_list[iter_10_0][1]) < var_10_1.item_list[iter_10_0][2] then
			ShowTips("ERROR_ITEM_NOT_ENOUGH_MATERIAL")

			return
		end
	end

	return manager.net:SendWithLoading(13022, {
		equip_id = arg_10_0
	}, 13023):next(function(arg_11_0)
		if isSuccess(arg_11_0.result) then
			local var_11_0 = EquipData:GetEquipData(arg_10_0)
			local var_11_1 = deepClone(var_11_0)

			EquipData:ApplyUpgradeEquipSuccess(tonumber(arg_10_0))

			local var_11_2 = {
				pageIndex = 2,
				type = "upgrade",
				equipId = arg_10_0,
				oldEquip = var_11_1,
				newEquip = var_11_0
			}

			manager.notify:Invoke(EQUIP_UPGRADE_SUCCESS, var_11_2)
		else
			ShowTips(arg_11_0.result)
		end
	end, function(arg_12_0)
		print(arg_12_0)
	end)
end

function var_0_0.EquipQuickDressOn(arg_13_0, arg_13_1)
	return manager.net:SendWithLoadingNew(13026, {
		hero_id = arg_13_0,
		use_equip_list = arg_13_1
	}, 13027, var_0_0.OnEquipQuickDressOn)
end

function var_0_0.OnEquipQuickDressOn(arg_14_0, arg_14_1)
	local var_14_0 = true

	for iter_14_0, iter_14_1 in ipairs(arg_14_0.result) do
		if not isSuccess(iter_14_1.result) then
			var_14_0 = false
		end
	end

	if not var_14_0 then
		ShowTips(GetTips("EQUIP_DRESS_FAIL"))
	else
		manager.notify:CallUpdateFunc(EQUIP_QUICK_DRESS_ON, arg_14_0, arg_14_1)
	end
end

function var_0_0.QueryEquipEnchant(arg_15_0, arg_15_1, arg_15_2, arg_15_3)
	local var_15_0 = arg_15_2.id
	local var_15_1 = arg_15_2.money
	local var_15_2 = arg_15_2.number

	if not checkGold(var_15_1) then
		return
	end

	if var_15_2 > ItemTools.getItemNum(var_15_0) then
		ShowPopItem(POP_SOURCE_ITEM, {
			var_15_0,
			var_15_2
		})

		return
	end

	local var_15_3 = ItemCfg[var_15_0] and ItemCfg[var_15_0].param and ItemCfg[var_15_0].param[1]

	if not var_15_3 and var_15_3 ~= "" then
		return
	end

	manager.net:SendWithLoading(13028, {
		equip_id = arg_15_0,
		enchant_slot_id = arg_15_1,
		pool_id = var_15_3,
		lock_type = arg_15_3
	}, 13029):next(function(arg_16_0)
		if isSuccess(arg_16_0.result) then
			EquipData:AddPreEnchant(arg_15_0, arg_15_1, arg_16_0.enchant_preview)
			manager.notify:CallUpdateFunc(EQUIP_ENCHANT)
		else
			ShowTips(arg_16_0.result)
		end
	end)
end

function var_0_0.QueryEquipEnchantConfirm(arg_17_0, arg_17_1, arg_17_2, arg_17_3)
	return manager.net:SendWithLoading(13030, {
		equip_id = arg_17_0,
		enchant_slot_id = arg_17_1,
		confirm = arg_17_2,
		preview_index = arg_17_3
	}, 13031):next(function(arg_18_0)
		if isSuccess(arg_18_0.result) then
			EquipData:ConfirmEnchant(arg_17_0, arg_17_1, arg_17_2, arg_17_3)
			manager.notify:CallUpdateFunc(EQUIP_ENCHANT_CONFIRM, arg_17_2)
		else
			ShowTips(arg_18_0.result)
		end
	end)
end

function var_0_0.QueryEquipGiveUpAllEnchant(arg_19_0, arg_19_1)
	return manager.net:SendWithLoading(13044, {
		equip_id = arg_19_0,
		enchant_slot_id = arg_19_1
	}, 13045):next(function(arg_20_0)
		if isSuccess(arg_20_0.result) then
			EquipData:GiveUpAllEnchant(arg_19_0, arg_19_1)
			manager.notify:CallUpdateFunc(EQUIP_ENCHANT_GIVE_UP)
		else
			ShowTips(arg_20_0.result)
		end
	end)
end

function var_0_0.QueryEquipRace(arg_21_0, arg_21_1, arg_21_2)
	local var_21_0 = EquipData:GetRaceMaterial(arg_21_1)
	local var_21_1 = var_21_0.id
	local var_21_2 = var_21_0.money
	local var_21_3 = var_21_0.number

	if not checkGold(var_21_2) then
		return
	end

	if var_21_3 > ItemTools.getItemNum(var_21_1) then
		ShowPopItem(POP_SOURCE_ITEM, {
			var_21_1,
			var_21_3
		})

		return
	end

	local var_21_4
	local var_21_5
	local var_21_6 = {
		equip_id = arg_21_0
	}

	if arg_21_1 == 1 then
		var_21_4 = 13032
		var_21_5 = 13033
	else
		var_21_4 = 13046
		var_21_5 = 13047
		var_21_6.hero_id = arg_21_2
	end

	manager.net:SendWithLoading(var_21_4, var_21_6, var_21_5):next(function(arg_22_0)
		if isSuccess(arg_22_0.result) then
			if arg_21_1 == 2 then
				EquipData:SetPreRace(arg_21_0, arg_21_2)
				EquipData:ConfirmRace(arg_21_0, true)

				if not EquipData:GetEquipData(arg_21_0).is_lock then
					EquipAction.ApplyLockEquip(arg_21_0, true)
				end

				ShowTips("EQUIP_HERO_SUCCESS")
				JumpTools.OpenPageByJump("equipCulturePopView", {
					type = "reset",
					heroId = arg_21_2,
					callback = function()
						manager.notify:CallUpdateFunc(EQUIP_RACE)
					end
				})
			else
				EquipData:SetPreRace(arg_21_0, arg_22_0.race_preview)
				JumpTools.OpenPageByJump("/equipRaceConfirmView", {
					equipId = arg_21_0,
					heroId = arg_21_2
				})
				manager.notify:CallUpdateFunc(EQUIP_RACE)
			end
		else
			ShowTips(arg_22_0.result)
		end
	end)
end

function var_0_0.QueryEquipRaceConfirm(arg_24_0, arg_24_1)
	manager.net:SendWithLoading(13034, {
		equip_id = arg_24_0,
		confirm = arg_24_1
	}, 13035):next(function(arg_25_0)
		if isSuccess(arg_25_0.result) then
			EquipData:ConfirmRace(arg_24_0, arg_24_1)
			manager.notify:CallUpdateFunc(EQUIP_RACE_CONFIRM)
		else
			ShowTips(arg_25_0.result)
		end
	end)
end

function var_0_0.EquipBagFull(arg_26_0)
	EquipData:EquipBagFull(arg_26_0)
end

local var_0_1

function var_0_0.InheritEquip(arg_27_0, arg_27_1)
	var_0_1 = arg_27_1

	manager.net:SendWithLoadingNew(13052, {
		inherit_equip_prefab_id = arg_27_1,
		new_equip_id = arg_27_0
	}, 13053, var_0_0.OnInheritEquip)
end

function var_0_0.OnInheritEquip(arg_28_0, arg_28_1)
	if isSuccess(arg_28_0.result) then
		ShowTips("EQUIP_INHERIT_SUCCESS")
		manager.notify:CallUpdateFunc(EQUIP_INHERIT_SUCCESS, arg_28_1.new_equip_id)
	else
		ShowTips(arg_28_0.result)
	end
end

manager.net:Bind(13057, function(arg_29_0)
	EquipData:InitAutoDecompose(arg_29_0)
end)

function var_0_0.SetAutoDecomposeState(arg_30_0, arg_30_1, arg_30_2)
	manager.net:SendWithLoadingNew(13054, {
		type = arg_30_0,
		sign = arg_30_1 and 1 or 0
	}, 13055, function(arg_31_0)
		if isSuccess(arg_31_0.result) then
			EquipData:UpdateAutoDecompose(arg_30_0, arg_30_1)
			arg_30_2(arg_31_0)
		else
			ShowTips(arg_31_0.result)
		end
	end)
end

return var_0_0
