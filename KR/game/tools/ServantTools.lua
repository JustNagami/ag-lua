local var_0_0 = {
	GetServantMap = function()
		local var_1_0 = {}
		local var_1_1 = HeroData:GetHeroList()

		for iter_1_0, iter_1_1 in pairs(var_1_1) do
			if iter_1_1.servant_uid ~= 0 then
				var_1_0[iter_1_1.servant_uid] = iter_1_0
			end
		end

		return var_1_0
	end,
	GetServantLimited = function(arg_2_0, arg_2_1)
		local var_2_0 = HeroData:GetHeroList()
		local var_2_1 = {}
		local var_2_2 = {}
		local var_2_3 = WeaponServantData:GetWeaponServantList()

		if arg_2_1 then
			for iter_2_0, iter_2_1 in pairs(var_2_0) do
				var_2_2[iter_2_1.servant_uid] = 1
			end
		end

		if arg_2_0 then
			for iter_2_2, iter_2_3 in pairs(var_2_3) do
				if iter_2_3.locked == 0 and not var_2_2[iter_2_2] then
					table.insert(var_2_1, iter_2_3)
				end
			end
		else
			for iter_2_4, iter_2_5 in pairs(var_2_3) do
				table.insert(var_2_1, iter_2_5)
			end
		end

		return var_2_1
	end,
	GetServantByIDLimited = function(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
		local var_3_0 = HeroData:GetHeroList()
		local var_3_1 = {}
		local var_3_2 = {}
		local var_3_3 = WeaponServantData:GetServantSByID(arg_3_0)

		if arg_3_2 then
			for iter_3_0, iter_3_1 in pairs(var_3_0) do
				var_3_2[iter_3_1.servant_uid] = 1
			end
		end

		if arg_3_1 then
			for iter_3_2, iter_3_3 in pairs(var_3_3) do
				if WeaponServantData:GetServantDataByUID(iter_3_2).locked == 0 and not var_3_2[iter_3_2] and iter_3_2 ~= arg_3_3 then
					table.insert(var_3_1, iter_3_2)
				end
			end
		else
			for iter_3_4, iter_3_5 in pairs(var_3_3) do
				table.insert(var_3_1, iter_3_4)
			end
		end

		return var_3_1
	end,
	ServantBreakCost = function(arg_4_0, arg_4_1)
		if arg_4_1 > GameSetting.weapon_promote_max.value[arg_4_0] then
			print("已超过最大突破次数")

			return false
		end

		return GameSetting.weapon_servant_gold_cost.value[arg_4_0][arg_4_1]
	end
}

function var_0_0.ServantBreakMaterialCost(arg_5_0, arg_5_1)
	if var_0_0.GetServantSpecHero(arg_5_0) then
		return GameSetting.weapon_promote_cost_exclusive.value
	else
		return GameSetting.weapon_promote_cost.value[arg_5_1 - 3]
	end
end

function var_0_0.GetServantSpecHero(arg_6_0)
	local var_6_0 = WeaponServantCfg[arg_6_0].effect[1]
	local var_6_1

	if var_6_0 > 0 then
		var_6_1 = WeaponEffectCfg[var_6_0].spec_char[1]
	end

	return var_6_1
end

function var_0_0.IsSleepServant(arg_7_0)
	local var_7_0 = WeaponServantCfg[arg_7_0]

	if var_7_0 and var_7_0.type == 3 then
		return true
	end

	return false
end

function var_0_0.GetSleepyServantByServant(arg_8_0)
	if var_0_0.GetServantSpecHero(arg_8_0) then
		local var_8_0 = WeaponServantCfg[arg_8_0].race

		for iter_8_0, iter_8_1 in ipairs(WeaponServantCfg.get_id_list_by_race[var_8_0]) do
			if WeaponServantCfg[iter_8_1].type == 3 then
				return iter_8_1
			end
		end
	end

	return false
end

function var_0_0.GetSleepyServantNum(arg_9_0)
	if not WeaponServantCfg.get_id_list_by_race[arg_9_0] then
		error("错误的race:" .. arg_9_0)
	end

	local var_9_0

	for iter_9_0, iter_9_1 in ipairs(WeaponServantCfg.get_id_list_by_race[arg_9_0]) do
		if WeaponServantCfg[iter_9_1].type == 3 then
			var_9_0 = iter_9_1
		end
	end

	return table.length(WeaponServantData:GetServantSByID(var_9_0))
end

function var_0_0.GetServantDecomposeRewardItem(arg_10_0)
	local var_10_0 = {}

	for iter_10_0, iter_10_1 in pairs(arg_10_0) do
		local var_10_1 = WeaponServantCfg[iter_10_1.id].starlevel
		local var_10_2 = GameSetting.weapon_servant_break_cost_return.value[var_10_1]
		local var_10_3 = var_10_2[1][1]

		var_10_0[var_10_3] = (var_10_0[var_10_3] and var_10_0[var_10_3] or 0) + var_10_2[1][2]
	end

	local var_10_4 = {}
	local var_10_5 = 1

	for iter_10_2, iter_10_3 in pairs(var_10_0) do
		var_10_4[var_10_5] = {
			id = iter_10_2,
			number = iter_10_3
		}
		var_10_5 = var_10_5 + 1
	end

	return var_10_4
end

function var_0_0.GetIsHide(arg_11_0)
	return HideInfoData:GetWeaponServantHideList()[arg_11_0] or false
end

function var_0_0.GetServantShowCount()
	local var_12_0 = 0
	local var_12_1 = WeaponServantData:GetWeaponServantList()

	for iter_12_0, iter_12_1 in pairs(var_12_1) do
		if not var_0_0.GetIsHide(iter_12_1.id) then
			var_12_0 = var_12_0 + 1
		end
	end

	return var_12_0
end

function var_0_0.GetWeaponShowData(arg_13_0, arg_13_1)
	local var_13_0 = arg_13_0 or Filter_Root_Define.Servant_Filter_List.filter_id
	local var_13_1 = {}
	local var_13_2 = ServantTools.GetServantMap()
	local var_13_3 = WeaponServantData:GetWeaponServantList()
	local var_13_4 = CommonFilterData:IsAll(var_13_0)
	local var_13_5 = ItemTools.getItemNum(CurrencyConst.CURRENCY_TYPE_GOLD)

	local function var_13_6(arg_14_0, arg_14_1)
		if arg_14_1.hideStar then
			local var_14_0 = WeaponServantCfg[arg_14_0.id].starlevel

			for iter_14_0, iter_14_1 in pairs(arg_14_1.hideStar) do
				if var_14_0 == iter_14_1 then
					return true
				end
			end
		end

		if arg_14_1.hideEquip and var_13_2[arg_14_0.uid] then
			return true
		end

		if arg_14_1.hideLock and WeaponServantData:GetServantDataByUID(arg_14_0.uid).locked == 1 then
			return true
		end

		return false
	end

	for iter_13_0, iter_13_1 in pairs(var_13_3) do
		local var_13_7 = not var_0_0.GetIsHide(iter_13_1.id)
		local var_13_8 = arg_13_1 and var_13_6(iter_13_1, arg_13_1) or false

		if var_13_7 and not var_13_4 and not var_13_8 then
			local var_13_9 = WeaponServantCfg[iter_13_1.id]
			local var_13_10 = {}
			local var_13_11 = var_0_0.ServantBreakCost(var_13_9.starlevel, iter_13_1.stage)

			if var_13_11 and var_13_11 < var_13_5 and var_13_9.type ~= 3 then
				table.insert(var_13_10, Filter_Tags_Define.Beyond)
			end

			if var_13_2[iter_13_1.uid] then
				table.insert(var_13_10, Filter_Tags_Define.Equip)
			end

			if var_13_9.type == 3 then
				table.insert(var_13_10, Filter_Tags_Define.CallName)
			end

			var_13_7 = var_0_0.FilterCheck(var_13_9, var_13_0, var_13_10)
		end

		if var_13_7 and not var_13_8 then
			table.insert(var_13_1, iter_13_1)
		end
	end

	return var_13_1
end

function var_0_0.FilterCheck(arg_15_0, arg_15_1, arg_15_2)
	local var_15_0 = false

	if arg_15_1 == Filter_Root_Define.Servant_Filter_List.filter_id then
		local var_15_1 = CommonFilterData:SpecificHasFlag(Filter_Root_Define.Servant_Filter_List.filter_id, Filter_Group_Define.RACE.groupID, {
			Filter_Tags_Define["Race" .. arg_15_0.race]
		})
		local var_15_2 = CommonFilterData:SpecificHasFlag(Filter_Root_Define.Servant_Filter_List.filter_id, Filter_Group_Define.SERVANT_ADD.groupID, arg_15_2)
		local var_15_3 = CommonFilterData:SpecificHasFlag(Filter_Root_Define.Servant_Filter_List.filter_id, Filter_Group_Define.RARITY.groupID, {
			Filter_Tags_Define["Star" .. arg_15_0.starlevel]
		})

		return var_15_1 and var_15_2 and var_15_3
	elseif arg_15_1 == Filter_Root_Define.Decompose_Servant_Filter_List.filter_id then
		local var_15_4 = CommonFilterData:SpecificHasFlag(Filter_Root_Define.Decompose_Servant_Filter_List.filter_id, Filter_Group_Define.RACE.groupID, {
			Filter_Tags_Define["Race" .. arg_15_0.race]
		})
		local var_15_5 = CommonFilterData:SpecificHasFlag(Filter_Root_Define.Decompose_Servant_Filter_List.filter_id, Filter_Group_Define.DECOMPOSE_RARITY.groupID, {
			Filter_Tags_Define["Star" .. arg_15_0.starlevel]
		})
		local var_15_6 = CommonFilterData:SpecificHasFlag(Filter_Root_Define.Decompose_Servant_Filter_List.filter_id, Filter_Group_Define.DECOMPOSE_SERVANT_ADD.groupID, arg_15_2)

		return var_15_4 and var_15_5 and var_15_6
	end
end

function var_0_0.ServantSort(arg_16_0, arg_16_1)
	local var_16_0 = WeaponServantCfg[arg_16_0.id].starlevel
	local var_16_1 = WeaponServantCfg[arg_16_1.id].starlevel
	local var_16_2 = arg_16_0.stage
	local var_16_3 = arg_16_1.stage
	local var_16_4 = WeaponServantCfg[arg_16_0.id].race
	local var_16_5 = WeaponServantCfg[arg_16_1.id].race
	local var_16_6 = arg_16_0.id
	local var_16_7 = arg_16_1.id
	local var_16_8 = arg_16_0.uid
	local var_16_9 = arg_16_1.uid

	if var_16_0 ~= var_16_1 then
		return var_16_1 < var_16_0
	end

	if var_16_2 ~= var_16_3 then
		return var_16_3 < var_16_2
	end

	if var_16_4 ~= var_16_5 then
		return var_16_5 < var_16_4
	end

	if var_16_6 ~= var_16_7 then
		return var_16_7 < var_16_6
	end

	return var_16_9 < var_16_8
end

function var_0_0.GetServantList(arg_17_0, arg_17_1, arg_17_2, arg_17_3, arg_17_4, arg_17_5, arg_17_6)
	local function var_17_0(arg_18_0, arg_18_1)
		local var_18_0 = ServantTools.GetServantSpecHero(arg_18_0.id)
		local var_18_1 = ServantTools.GetServantSpecHero(arg_18_1.id)

		if arg_18_0.id == arg_18_1.id then
			local var_18_2 = WeaponServantCfg[arg_18_0.id].starlevel
			local var_18_3 = WeaponServantCfg[arg_18_1.id].starlevel
			local var_18_4 = arg_18_0.stage
			local var_18_5 = arg_18_1.stage
			local var_18_6 = WeaponServantCfg[arg_18_0.id].race
			local var_18_7 = WeaponServantCfg[arg_18_1.id].race
			local var_18_8 = arg_18_0.id
			local var_18_9 = arg_18_1.id
			local var_18_10 = arg_18_0.uid
			local var_18_11 = arg_18_1.uid

			if var_18_4 ~= var_18_5 then
				return var_18_5 < var_18_4
			end

			if var_18_2 ~= var_18_3 then
				return var_18_3 < var_18_2
			end

			if var_18_6 ~= var_18_7 then
				return var_18_7 < var_18_6
			end

			if var_18_8 ~= var_18_9 then
				return var_18_9 < var_18_8
			end

			return var_18_11 < var_18_10
		else
			if arg_17_1 then
				if arg_17_1 == var_18_0 then
					return true
				elseif arg_17_1 == var_18_1 then
					return false
				end
			end

			local var_18_12 = WeaponServantCfg[arg_18_0.id].starlevel
			local var_18_13 = WeaponServantCfg[arg_18_1.id].starlevel
			local var_18_14 = arg_18_0.stage
			local var_18_15 = arg_18_1.stage
			local var_18_16 = WeaponServantCfg[arg_18_0.id].race
			local var_18_17 = WeaponServantCfg[arg_18_1.id].race
			local var_18_18 = arg_18_0.id
			local var_18_19 = arg_18_1.id
			local var_18_20 = arg_18_0.uid
			local var_18_21 = arg_18_1.uid

			if var_18_14 ~= var_18_15 then
				return var_18_15 < var_18_14
			end

			if var_18_12 ~= var_18_13 then
				return var_18_13 < var_18_12
			end

			if var_18_16 ~= var_18_17 then
				return var_18_17 < var_18_16
			end

			if var_18_18 ~= var_18_19 then
				return var_18_19 < var_18_18
			end

			return var_18_21 < var_18_20
		end
	end

	local function var_17_1(arg_19_0, arg_19_1)
		local var_19_0 = ServantTools.GetServantSpecHero(arg_19_0.id)
		local var_19_1 = ServantTools.GetServantSpecHero(arg_19_1.id)

		if arg_19_0.id == arg_19_1.id then
			local var_19_2 = WeaponServantCfg[arg_19_0.id].starlevel
			local var_19_3 = WeaponServantCfg[arg_19_1.id].starlevel
			local var_19_4 = arg_19_0.stage
			local var_19_5 = arg_19_1.stage
			local var_19_6 = WeaponServantCfg[arg_19_0.id].race
			local var_19_7 = WeaponServantCfg[arg_19_1.id].race
			local var_19_8 = arg_19_0.id
			local var_19_9 = arg_19_1.id
			local var_19_10 = arg_19_0.uid
			local var_19_11 = arg_19_1.uid

			if var_19_2 ~= var_19_3 then
				return var_19_3 < var_19_2
			end

			if var_19_4 ~= var_19_5 then
				return var_19_5 < var_19_4
			end

			if var_19_6 ~= var_19_7 then
				return var_19_7 < var_19_6
			end

			if var_19_8 ~= var_19_9 then
				return var_19_9 < var_19_8
			end

			return var_19_11 < var_19_10
		else
			if arg_17_1 then
				if arg_17_1 == var_19_0 then
					return true
				elseif arg_17_1 == var_19_1 then
					return false
				end
			end

			local var_19_12 = WeaponServantCfg[arg_19_0.id].starlevel
			local var_19_13 = WeaponServantCfg[arg_19_1.id].starlevel
			local var_19_14 = arg_19_0.stage
			local var_19_15 = arg_19_1.stage
			local var_19_16 = WeaponServantCfg[arg_19_0.id].race
			local var_19_17 = WeaponServantCfg[arg_19_1.id].race
			local var_19_18 = arg_19_0.id
			local var_19_19 = arg_19_1.id
			local var_19_20 = arg_19_0.uid
			local var_19_21 = arg_19_1.uid

			if var_19_12 ~= var_19_13 then
				return var_19_13 < var_19_12
			end

			if var_19_14 ~= var_19_15 then
				return var_19_15 < var_19_14
			end

			if var_19_16 ~= var_19_17 then
				return var_19_17 < var_19_16
			end

			if var_19_18 ~= var_19_19 then
				return var_19_19 < var_19_18
			end

			return var_19_21 < var_19_20
		end
	end

	local var_17_2

	if arg_17_1 then
		local var_17_3 = HeroTools.GetHeroServantInfo(arg_17_1)

		var_17_2 = var_17_3 and var_17_3.uid
	end

	local function var_17_4(arg_20_0, arg_20_1)
		if var_17_2 then
			if var_17_2 == arg_20_0.uid then
				return true
			elseif var_17_2 == arg_20_1.uid then
				return false
			end
		end

		return 1
	end

	local var_17_5 = 0
	local var_17_6 = false

	if arg_17_1 and arg_17_1 ~= 0 then
		var_17_5 = HeroTools.GetHeroSpecServant(arg_17_1)
	end

	local var_17_7 = WeaponServantData:GetSortConfig()
	local var_17_8 = arg_17_4 or var_17_7[1]
	local var_17_9 = arg_17_5 or var_17_7[2]
	local var_17_10

	if arg_17_1 then
		var_17_10 = HeroCfg[arg_17_1].race
	end

	local var_17_11 = {}
	local var_17_12 = {}
	local var_17_13 = {}
	local var_17_14 = arg_17_2 or WeaponServantData:GetWeaponServantList()

	for iter_17_0, iter_17_1 in pairs(var_17_14) do
		if arg_17_1 then
			if WeaponServantCfg[iter_17_1.id].race == var_17_10 then
				local var_17_15 = WeaponServantCfg[iter_17_1.id].race

				if not table.indexof(var_17_11, var_17_15) then
					table.insert(var_17_11, var_17_15)
				end

				if not var_17_12[var_17_15] then
					var_17_12[var_17_15] = 0
				end

				var_17_12[var_17_15] = var_17_12[var_17_15] + 1

				table.insert(var_17_13, iter_17_1)
			end
		else
			local var_17_16 = WeaponServantCfg[iter_17_1.id].race

			if not table.indexof(var_17_11, var_17_16) then
				table.insert(var_17_11, var_17_16)
			end

			if not var_17_12[var_17_16] then
				var_17_12[var_17_16] = 0
			end

			var_17_12[var_17_16] = var_17_12[var_17_16] + 1

			table.insert(var_17_13, iter_17_1)
		end

		if var_17_5 ~= 0 and iter_17_1.id == var_17_5 then
			var_17_6 = true
		end
	end

	var_17_12[0] = #var_17_13

	if arg_17_3 and var_17_5 ~= 0 and not var_17_6 then
		if arg_17_6 then
			if var_0_0.FilterCheck(WeaponServantCfg[var_17_5], arg_17_6) then
				local var_17_17 = WeaponServantData:GetDefaultData(var_17_5)

				var_17_17.isRecommend = true

				table.insert(var_17_13, var_17_17)
			end
		else
			local var_17_18 = WeaponServantData:GetDefaultData(var_17_5)

			var_17_18.isRecommend = true

			table.insert(var_17_13, var_17_18)
		end
	end

	table.sort(var_17_13, function(arg_21_0, arg_21_1)
		if arg_21_0.isRecommend then
			return true
		end

		if arg_21_1.isRecommend then
			return false
		end

		local var_21_0 = var_17_4(arg_21_0, arg_21_1)

		if var_21_0 == 1 then
			if var_17_8 == 0 then
				if var_17_9 == 0 then
					return var_17_0(arg_21_0, arg_21_1)
				else
					return var_17_0(arg_21_1, arg_21_0)
				end
			elseif var_17_8 == 1 then
				if var_17_9 == 0 then
					return var_17_1(arg_21_0, arg_21_1)
				else
					return var_17_1(arg_21_1, arg_21_0)
				end
			end
		else
			return var_21_0
		end
	end)

	return var_17_13
end

function var_0_0.GetAwakeServantList(arg_22_0, arg_22_1)
	local var_22_0 = WeaponServantData:GetAllPrivateWeaponServantIdList()
	local var_22_1 = {}

	for iter_22_0, iter_22_1 in ipairs(var_22_0) do
		if not ServantTools.GetIsHide(iter_22_1) and WeaponServantCfg[iter_22_1].race == arg_22_1 then
			table.insert(var_22_1, {
				locked = 0,
				stage = 1,
				uid = 0,
				id = iter_22_1
			})
		end
	end

	local function var_22_2(arg_23_0, arg_23_1)
		local var_23_0 = arg_22_0:MaterialEnoughById(arg_23_0.id) and 1 or 0
		local var_23_1 = arg_22_0:MaterialEnoughById(arg_23_1.id) and 1 or 0
		local var_23_2 = arg_23_0.id
		local var_23_3 = arg_23_1.id

		if var_23_0 ~= var_23_1 then
			return var_23_1 < var_23_0
		end

		return var_23_2 < var_23_3
	end

	table.sort(var_22_1, var_22_2)

	return var_22_1
end

function var_0_0.MaterialEnoughById(arg_24_0, arg_24_1)
	local var_24_0 = WeaponServantCfg[arg_24_1]
	local var_24_1 = {}

	for iter_24_0, iter_24_1 in ipairs(GameSetting.exclusive_weapon_servant_cost.value) do
		if iter_24_1[1] == var_24_0.race then
			var_24_1 = iter_24_1[2]
		end
	end

	local var_24_2 = WeaponServantData:GetWeaponServantById(var_24_1[1][1])
	local var_24_3 = 0

	if var_24_2 then
		var_24_3 = #var_24_2
	end

	return ItemTools.getItemNum(var_24_1[2][1]) >= var_24_1[2][2] and var_24_3 >= var_24_1[1][2]
end

function var_0_0.JumpToCallName(arg_25_0, arg_25_1)
	local var_25_0 = WeaponServantCfg[arg_25_1].race
	local var_25_1 = {
		openTab = "callName",
		guideForce = true,
		race = var_25_0,
		servantID = arg_25_1,
		HeroID = arg_25_0
	}

	manager.notify:Invoke(SERVANT_SWITCH_TO_CALLNAME, var_25_1)
end

function var_0_0.JumpToNormalList(arg_26_0, arg_26_1)
	local var_26_0 = {
		openTab = "hold",
		servantUID = arg_26_1,
		HeroID = arg_26_0
	}

	manager.notify:Invoke(SERVANT_SWITCH_TO_CALLNAME, var_26_0)
end

function var_0_0.ServantIsHeroRecom(arg_27_0, arg_27_1)
	if not arg_27_1 or not arg_27_0 then
		return false
	end

	if arg_27_1 == 0 or arg_27_0 == 0 then
		return false
	end

	local var_27_0 = WeaponServantCfg[arg_27_0]

	if not var_27_0 then
		return false
	end

	local var_27_1 = var_27_0.effect[1]
	local var_27_2 = 0

	if var_27_1 > 0 then
		var_27_2 = WeaponEffectCfg[var_27_1].spec_char[1]
	end

	if var_27_2 and var_27_2 > 0 and var_27_2 == arg_27_1 then
		return true
	end

	return false
end

return var_0_0
