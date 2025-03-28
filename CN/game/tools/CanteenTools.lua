local var_0_0 = {
	GetFoodSprite = function(arg_1_0)
		return getSpriteWithoutAtlas(DormConst.CANTEEN_FOOD_PATH .. BackHomeCanteenFoodCfg[arg_1_0].icon)
	end,
	GetCanteenSkillSprite = function(arg_2_0)
		local var_2_0 = BackHomeHeroSkillCfg[arg_2_0].icon

		return getSpriteViaConfig("DormHeroSkill", var_2_0)
	end,
	CheckSignFoodNumCanOpen = function(arg_3_0)
		local var_3_0 = CanteenFoodData:GetCanOrderFoodList()

		if var_3_0 then
			if #var_3_0 < DormConst.ORDER_FOOD_AUTO_NUM then
				return false
			else
				return true
			end
		end
	end,
	CheckCanteenJobCanOpen = function(arg_4_0)
		local var_4_0 = CanteenHeroTools:GetCanteenJobList()

		for iter_4_0, iter_4_1 in pairs(var_4_0) do
			if not iter_4_1.heroID then
				return false
			end

			local var_4_1 = iter_4_1.heroID

			if not DormNpcTools:CheckIDIsNpc(var_4_1) then
				local var_4_2 = DormData:GetHeroFatigue(var_4_1)
				local var_4_3 = GameSetting.dorm_canteen_work_fatigue.value[1] / 100

				if var_4_2 < var_4_3 - var_4_3 % 0.1 then
					return false
				end
			end
		end

		return true
	end,
	CheckFoodUnLock = function(arg_5_0, arg_5_1)
		local var_5_0 = BackHomeCanteenFoodCfg[arg_5_1].unlock

		if var_5_0 ~= 0 then
			return BackHomeTools:CheckBackHomeConditionAccord(var_5_0)
		end

		return true
	end,
	GetFoodUnLockLevel = function(arg_6_0, arg_6_1)
		local var_6_0 = BackHomeCanteenFoodCfg[arg_6_1].unlock

		if var_6_0 ~= 0 then
			return ConditionCfg[var_6_0].params[2]
		else
			return 0
		end
	end,
	CheckFurCanLevelUp = function(arg_7_0, arg_7_1)
		local var_7_0 = BackHomeCanteenFurnitureIDCfg[arg_7_1].type_id
		local var_7_1 = CanteenData:GetFurnitureLevel(arg_7_1)
		local var_7_2 = BackHomeCanteenFurnitureCfg[var_7_0].condition[var_7_1 + 1]

		if not var_7_2 then
			return false
		end

		for iter_7_0, iter_7_1 in ipairs(var_7_2) do
			if ConditionCfg[iter_7_1] and not BackHomeTools:CheckBackHomeConditionAccord(iter_7_1) then
				return false
			end
		end

		local var_7_3 = BackHomeCanteenFurnitureCfg[var_7_0].cost_material[var_7_1 + 1]

		if not var_7_3 then
			return true
		end

		for iter_7_2, iter_7_3 in ipairs(var_7_3) do
			if ItemTools.getItemNum(iter_7_3[1]) < iter_7_3[2] then
				return false
			end
		end

		return true
	end,
	CheckAllFurCanLevelUp = function(arg_8_0, arg_8_1)
		local var_8_0 = BackHomeCanteenFurnitureIDCfg.all

		for iter_8_0, iter_8_1 in ipairs(var_8_0) do
			local var_8_1 = BackHomeCanteenFurnitureIDCfg[iter_8_1].type_id

			if BackHomeCanteenFurnitureCfg[var_8_1].type == arg_8_1 and arg_8_0:CheckFurCanLevelUp(iter_8_1) then
				return true
			end
		end

		return false
	end,
	GetCookCfgName = function(arg_9_0, arg_9_1)
		local var_9_0 = CanteenConst.COOK_TYPE_NAME[arg_9_1]
		local var_9_1 = GetTips(var_9_0)

		if string.isNullOrEmpty(var_9_1) then
			print("未获取到厨具名字")
		end

		return var_9_1
	end,
	GetCookCfgNameByEid = function(arg_10_0, arg_10_1)
		if BackHomeCanteenFurnitureIDCfg[arg_10_1] then
			local var_10_0 = BackHomeCanteenFurnitureIDCfg[arg_10_1].type_id
			local var_10_1 = BackHomeCanteenFurnitureCfg[var_10_0].name

			if var_10_1 then
				return var_10_1
			else
				print("未找到家具名字")
			end
		end
	end,
	GetJobName = function(arg_11_0, arg_11_1)
		if arg_11_1 == 1 then
			return GetTips("DORM_CANTEEN_COOK")
		elseif arg_11_1 == 2 then
			return GetTips("DORM_CANTEEN_WAITER")
		elseif arg_11_1 == 3 then
			return GetTips("DORM_CANTEEN_CASHIER")
		end
	end,
	GetFootTypeName = function(arg_12_0, arg_12_1)
		local var_12_0 = DormEnum.FoodType[arg_12_1]

		if type(var_12_0) == "string" then
			return var_12_0
		elseif type(var_12_0) == "number" then
			return GetTips(var_12_0)
		end
	end,
	GetFurEidByType = function(arg_13_0, arg_13_1)
		for iter_13_0, iter_13_1 in ipairs(BackHomeFurniture.all) do
			if BackHomeFurniture[iter_13_1].type == arg_13_1 then
				for iter_13_2, iter_13_3 in ipairs(BackHomeCanteenFurnitureIDCfg.all) do
					if BackHomeCanteenFurnitureIDCfg[iter_13_3].type_id == iter_13_1 then
						return iter_13_3
					end
				end
			end
		end
	end,
	GetCanteenEIDByFurCfgID = function(arg_14_0, arg_14_1)
		for iter_14_0, iter_14_1 in ipairs(BackHomeCanteenFurnitureIDCfg.all) do
			if BackHomeCanteenFurnitureIDCfg[iter_14_1].type_id == arg_14_1 then
				return iter_14_1
			end
		end
	end,
	AnyJobAvailable = function(arg_15_0)
		local var_15_0 = CanteenHeroTools:GetCanteenJobList()

		for iter_15_0, iter_15_1 in pairs(var_15_0) do
			if iter_15_1.heroID == nil then
				return true
			end
		end

		return false
	end,
	AutoModeReadyForBusiness = function(arg_16_0)
		return arg_16_0:CheckSignFoodNumCanOpen() and arg_16_0:CheckCanteenJobCanOpen()
	end,
	SwitchCanteenBgm = function(arg_17_0, arg_17_1)
		if arg_17_1 == DormEnum.RestaurantMode.Start then
			local var_17_0 = MusicReference[1]

			manager.audio:PlayBGM(var_17_0.cuesheet, var_17_0.cueName, var_17_0.awbName)

			local var_17_1 = MusicReference[3]

			manager.audio:PlayBGM(var_17_1.cuesheet, var_17_1.cueName, var_17_1.awbName)
		elseif arg_17_1 == DormEnum.RestaurantMode.RestaurantAuto or arg_17_1 == DormEnum.RestaurantMode.Close then
			local var_17_2 = MusicReference[3]

			manager.audio:PlayBGM(var_17_2.cuesheet, var_17_2.cueName, var_17_2.awbName)
		elseif arg_17_1 == DormEnum.RestaurantMode.RestaurantManual then
			local var_17_3 = MusicReference[2]

			manager.audio:PlayBGM(var_17_3.cuesheet, var_17_3.cueName, var_17_3.awbName)
		end
	end,
	GetIndexByTaskDuring = function(arg_18_0, arg_18_1, arg_18_2)
		local var_18_0 = BackHomeCanteenTaskCfg[arg_18_1]

		if var_18_0 then
			for iter_18_0, iter_18_1 in ipairs(var_18_0.time) do
				if arg_18_2 == iter_18_1[1] then
					return iter_18_0
				end
			end
		end
	end,
	ShowTipsGetCookCfgName = function(arg_19_0, arg_19_1)
		local var_19_0 = CanteenConst.COOK_TYPE_NAME[arg_19_1]

		if var_19_0 then
			return GetTips(var_19_0)
		else
			return ""
		end
	end
}

local function var_0_1(arg_20_0, arg_20_1)
	if CanteenEntrustData:CheckHasChooseEntrustCharacter(arg_20_0) then
		return false
	end

	if BackHomeTools.CheckHeroIsLockForAnyFeatureByHeroID(arg_20_0) then
		return false
	end

	local var_20_0 = DormData:GetHeroArchiveID(arg_20_0)

	if nullable(arg_20_1, var_20_0) then
		return false
	end

	return true
end

local function var_0_2(arg_21_0, arg_21_1)
	if GameSetting.dorm_canteen_work_fatigue.value[1] / 100 > DormData:GetHeroFatigue(arg_21_0) then
		return false
	end

	local var_21_0 = DormData:GetHeroTemplateInfo(arg_21_0)

	if CanteenEntrustData:CheckHasChooseEntrustCharacter(arg_21_0) or var_21_0.jobType then
		return false
	end

	if BackHomeTools.CheckHeroIsLockForAnyFeatureByHeroID(arg_21_0) then
		return false
	end

	local var_21_1 = DormData:GetHeroArchiveID(arg_21_0)

	if nullable(arg_21_1, var_21_1) then
		return false
	end

	return true
end

local function var_0_3(arg_22_0, arg_22_1)
	return not nullable(arg_22_1, arg_22_0)
end

local function var_0_4(arg_23_0)
	local var_23_0 = {
		need = 0,
		result = {},
		filter = {},
		reduce = {}
	}

	if arg_23_0 then
		for iter_23_0, iter_23_1 in ipairs(arg_23_0) do
			local var_23_1 = DormData:GetHeroArchiveID(iter_23_1)
			local var_23_2 = DormData:GetHeroFatigue(iter_23_1)
			local var_23_3 = DormSkillData:GetSkillEffect(CanteenConst.HeroSkillType.EntrustTotalFatigueReduce, iter_23_1)

			var_23_0.filter[var_23_1] = true

			table.insert(var_23_0.result, iter_23_1)

			var_23_0.need = var_23_0.need + var_23_2

			table.insert(var_23_0.reduce, var_23_3)
		end
	end

	return var_23_0
end

local function var_0_5(arg_24_0, arg_24_1, arg_24_2, arg_24_3, arg_24_4, arg_24_5)
	arg_24_5 = arg_24_5 or var_0_4(nil)

	if arg_24_4 > 0 then
		for iter_24_0, iter_24_1 in ipairs(arg_24_1) do
			local var_24_0 = arg_24_0[iter_24_1]

			for iter_24_2, iter_24_3 in ipairs(var_24_0) do
				local var_24_1 = DormData:GetHeroArchiveID(iter_24_3)

				if var_0_3(var_24_1, arg_24_5.filter) then
					local var_24_2 = DormData:GetHeroFatigue(iter_24_3)
					local var_24_3 = DormSkillData:GetSkillEffect(CanteenConst.HeroSkillType.EntrustTotalFatigueReduce, iter_24_3)

					table.insert(arg_24_5.result, iter_24_3)
					table.insert(arg_24_5.reduce, var_24_3)

					arg_24_5.need = arg_24_5.need + var_24_2
					arg_24_5.filter[var_24_1] = true

					local var_24_4 = 0

					for iter_24_4, iter_24_5 in ipairs(arg_24_5.reduce) do
						var_24_4 = math.min(100, var_24_4 + iter_24_5)
					end

					local var_24_5 = arg_24_2 - math.floor(arg_24_2 * var_24_3 / 100)

					if var_0_5(arg_24_0, arg_24_1, var_24_5, arg_24_3, arg_24_4 - 1, arg_24_5) then
						return true, arg_24_5.result
					end

					arg_24_5.need = arg_24_5.need - var_24_2
					arg_24_5.filter[var_24_1] = nil

					table.remove(arg_24_5.reduce)
					table.remove(arg_24_5.result)
				end
			end
		end
	end

	return arg_24_2 <= arg_24_5.need and arg_24_3 <= #arg_24_5.result, arg_24_5.result
end

function var_0_0.AnyAvailableEntrustHero()
	local var_25_0 = DormHeroTools:GetUnLockBackHomeHeroIDList()

	for iter_25_0, iter_25_1 in ipairs(var_25_0) do
		if var_0_2(iter_25_1) then
			return true
		end
	end

	return false
end

function var_0_0.AutoSelectEntrustHero(arg_26_0, arg_26_1, arg_26_2)
	local var_26_0 = {}
	local var_26_1 = {}
	local var_26_2 = DormHeroTools:GetUnLockBackHomeHeroIDList()
	local var_26_3 = arg_26_0.id
	local var_26_4 = arg_26_0.tags

	for iter_26_0, iter_26_1 in ipairs(var_26_2) do
		if var_0_2(iter_26_1, arg_26_2) then
			local var_26_5 = CanteenEntrustData:CalHeroMatchNum(iter_26_1, var_26_4)
			local var_26_6 = DormSkillData:GetSkillEffect(CanteenConst.HeroSkillType.EntrustExternSucceedAdd, iter_26_1) / BackHomeCanteenTaskCfg[var_26_3].tag_success
			local var_26_7 = math.min(var_26_5 + var_26_6, DormConst.DORM_HERO_TAG_MAX)
			local var_26_8 = var_26_0[var_26_7]

			if var_26_8 == nil then
				var_26_8 = {}
				var_26_0[var_26_7] = var_26_8

				table.insert(var_26_1, var_26_7)
			end

			table.insert(var_26_8, iter_26_1)
		end
	end

	for iter_26_2, iter_26_3 in pairs(var_26_0) do
		CommonTools.UniversalSortEx(iter_26_3, {
			map = function(arg_27_0)
				return DormData:GetHeroFatigue(arg_27_0)
			end
		})
	end

	table.sort(var_26_1, function(arg_28_0, arg_28_1)
		return arg_28_1 < arg_28_0
	end)

	local var_26_9 = BackHomeCanteenTaskCfg[var_26_3].need
	local var_26_10 = var_26_9[1]
	local var_26_11, var_26_12 = var_26_9[2], BackHomeCanteenTaskCfg[var_26_3].cost

	if arg_26_1 then
		var_26_11 = var_26_11 - #arg_26_1
	end

	local var_26_13, var_26_14 = var_0_5(var_26_0, var_26_1, var_26_12, var_26_10, var_26_11, var_0_4(arg_26_1))

	if var_26_13 then
		return var_26_14
	end
end

function var_0_0.GetAvailableJobHeroList()
	return DormHeroTools:GetFilteredUnlockBackHomeHeroIDList(var_0_1)
end

return var_0_0
