local var_0_0 = {
	WeaponStr = function(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
		manager.net:SendWithLoadingNew(46016, {
			hero_id = arg_1_0,
			material_list = arg_1_1,
			servant_list = arg_1_2
		}, 46017, function(arg_2_0, arg_2_1)
			WeaponAction.OnWeaponStr(arg_2_0, arg_2_1, arg_1_3)
		end)
	end,
	OnWeaponStr = function(arg_3_0, arg_3_1, arg_3_2)
		if isSuccess(arg_3_0.result) then
			WeaponAction.OnWeaponStrResponse(arg_3_0, arg_3_1, arg_3_2)
			manager.notify:Invoke(WEAPON_STR, arg_3_0, arg_3_1)
			manager.notify:Invoke(WEAPON_DATA_MODIFY, arg_3_1.hero_id)
		else
			ShowTips(arg_3_0.result)
		end
	end,
	OnWeaponStrResponse = function(arg_4_0, arg_4_1, arg_4_2)
		local var_4_0 = arg_4_1.hero_id
		local var_4_1 = HeroData:GetHeroList()[var_4_0].weapon_info
		local var_4_2, var_4_3, var_4_4 = WeaponTools.AddWeaponExp(var_4_1.exp, var_4_1.breakthrough, arg_4_2)
		local var_4_5 = arg_4_2 - var_4_4

		HeroAction.WeaponStr(arg_4_1.hero_id, var_4_3, var_4_1.exp + var_4_5)
	end,
	WeaponBreak = function(arg_5_0)
		manager.net:SendWithLoadingNew(46018, {
			hero_id = arg_5_0
		}, 46019, function(arg_6_0, arg_6_1)
			WeaponAction.OnWeaponBreak(arg_6_0, arg_6_1)
		end)
	end,
	OnWeaponBreak = function(arg_7_0, arg_7_1)
		if isSuccess(arg_7_0.result) then
			WeaponAction.OnWeaponBreakResponse(arg_7_0, arg_7_1)
			manager.notify:Invoke(WEAPON_BREAK, arg_7_0, arg_7_1)
			manager.notify:Invoke(WEAPON_DATA_MODIFY, arg_7_1.hero_id)
		else
			ShowTips(arg_7_0.result)
		end
	end,
	OnWeaponBreakResponse = function(arg_8_0, arg_8_1)
		local var_8_0 = arg_8_1.hero_id
		local var_8_1 = HeroData:GetHeroList()[var_8_0].weapon_info

		HeroAction.WeaponBreak(var_8_0, var_8_1.breakthrough + 1)
	end,
	CheckLvUp = function(arg_9_0)
		local var_9_0 = {}
		local var_9_1 = ItemTools.getItemNum(CurrencyConst.CURRENCY_TYPE_GOLD)
		local var_9_2 = deepClone(HeroData:GetHeroList()[arg_9_0].weapon_info)
		local var_9_3 = GameSetting.weapon_exp_limit.value[var_9_2.breakthrough + 1]

		if var_9_3 <= var_9_2.level then
			return false
		end

		for iter_9_0, iter_9_1 in ipairs(ItemCfg.get_id_list_by_type[ItemConst.ITEM_TYPE.MATERIAL]) do
			local var_9_4 = ItemTools.getItemNum(iter_9_1)

			if ItemCfg[iter_9_1].sub_type == MaterialConst.MATERIAL_TYPE.WEAPON_LEVEL_UP and var_9_4 > 0 then
				table.insert(var_9_0, {
					index = 0,
					select = 0,
					type = ItemConst.ITEM_TYPE.MATERIAL,
					id = iter_9_1,
					number = var_9_4
				})
			end
		end

		table.sort(var_9_0, function(arg_10_0, arg_10_1)
			return ItemCfg[arg_10_0.id].rare < ItemCfg[arg_10_1.id].rare
		end)

		local var_9_5 = GameLevelSetting[var_9_2.level + 1].weapon_lv_exp_sum - var_9_2.exp
		local var_9_6 = var_9_5

		for iter_9_2 = #var_9_0, 1, -1 do
			local var_9_7 = var_9_0[iter_9_2]
			local var_9_8 = ItemCfg[var_9_7.id].param[1]
			local var_9_9 = 0

			while var_9_6 > 0 and var_9_9 < var_9_7.number do
				var_9_6 = var_9_6 - var_9_8
				var_9_9 = var_9_9 + 1
			end

			if var_9_6 < 0 and iter_9_2 > 1 then
				local var_9_10 = var_9_9 - 1

				var_9_6 = var_9_6 + var_9_8
			end
		end

		if var_9_6 > 0 then
			return false
		end

		local var_9_11

		if var_9_2.level + 1 == var_9_3 then
			var_9_11 = var_9_5 * GameSetting.weapon_strengthen_gold_cost.value[1]
		else
			var_9_11 = (var_9_5 - var_9_6) * GameSetting.weapon_strengthen_gold_cost.value[1]
		end

		if var_9_1 < var_9_11 then
			return false
		end

		return true
	end,
	CheckBreak = function(arg_11_0, arg_11_1)
		local var_11_0 = ItemTools.getItemNum(CurrencyConst.CURRENCY_TYPE_GOLD)
		local var_11_1 = deepClone(HeroData:GetHeroList()[arg_11_0].weapon_info)
		local var_11_2 = GameSetting.weapon_user_limit.value[var_11_1.breakthrough + 1]
		local var_11_3 = PlayerData:GetPlayerInfo().userLevel
		local var_11_4 = GameSetting.weapon_exp_limit.value[var_11_1.breakthrough + 1]

		if var_11_4 > var_11_1.level or var_11_4 == HeroConst.WEAPON_LV_MAX then
			if arg_11_1 then
				ShowTips("ERROR_HERO_WEAPON_LEVEL_LIMIT")
			end

			return false
		end

		if var_11_3 < var_11_2 then
			if arg_11_1 then
				ShowTips("ERROR_USER_LEVEL_LIMIT")
			end

			return false
		end

		local var_11_5, var_11_6 = WeaponTools.BreakMaterial(var_11_1.breakthrough)

		for iter_11_0, iter_11_1 in pairs(var_11_6) do
			if ItemTools.getItemNum(iter_11_1[1]) < iter_11_1[2] then
				if arg_11_1 then
					ShowTips("ERROR_ITEM_NOT_ENOUGH_MATERIAL")
				end

				return false
			end
		end

		if var_11_0 < var_11_5 then
			if arg_11_1 then
				checkGold(var_11_5)
			end

			return false
		end

		return true
	end
}

manager.notify:RegistListener(MATERIAL_INIT, function()
	var_0_0.UpdateWeaponBreakRedPoint()
end)
manager.notify:RegistListener(HERO_DATA_INIT, function()
	var_0_0.UpdateWeaponBreakRedPoint()
end)
manager.notify:RegistListener(PLAYER_LEVEL_UP, function()
	var_0_0.UpdateWeaponBreakRedPoint()
end)
manager.notify:RegistListener(CURRENCY_UPDATE, function()
	var_0_0.UpdateWeaponBreakRedPoint()
end)
manager.notify:RegistListener(MATERIAL_MODIFY, function()
	var_0_0.UpdateWeaponBreakRedPoint()
end)
manager.notify:RegistListener(PLAYER_MODIFIED, function()
	var_0_0.UpdateWeaponBreakRedPoint()
end)
manager.notify:RegistListener(WEAPON_DATA_MODIFY, function()
	var_0_0.UpdateWeaponBreakRedPoint()
end)

function var_0_0.UpdateWeaponBreakRedPoint()
	local var_19_0 = HeroData:GetHeroList()

	if not var_19_0 then
		return
	end

	for iter_19_0, iter_19_1 in pairs(var_19_0) do
		local var_19_1 = RedPointConst.HERO_WEAPON_BREAK_ID .. iter_19_0

		if var_0_0.CheckBreak(iter_19_0, false) or var_0_0.CheckLvUp(iter_19_0) then
			manager.redPoint:setTip(var_19_1, 1)
		else
			manager.redPoint:setTip(var_19_1, 0)
		end
	end
end

return var_0_0
