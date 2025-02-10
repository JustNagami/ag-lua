local var_0_0 = {
	GotoBackHomeRoom = function(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
		local var_1_0 = JumpTools.IsSystemLocked(ViewConst.SYSTEM_ID.DORM)

		if var_1_0 then
			ShowTips(JumpTools.GetSystemLockedTip(ViewConst.SYSTEM_ID.DORM, var_1_0))

			return nil
		end

		local var_1_1

		if arg_1_2 then
			function var_1_1(arg_2_0)
				BackHomeDataManager:GotoBackHomeCricketStage(BackHomeCricketConst.ROOM_TYPE.TRAIN)
			end
		elseif arg_1_3 then
			function var_1_1(arg_3_0)
				BackHomeDataManager:GotoBackHomeIlluScene()
			end
		else
			function var_1_1(arg_4_0)
				BackHomeDataManager:GotoBackHomeScene(arg_1_1)
			end
		end

		BackHomeDataManager:EnterBackHomeSystem(var_1_1)
	end,
	BackHomeGotoMain = function(arg_5_0)
		BackHomeDataManager:ExitBackHomeSystem()
		LuaExchangeHelper.GoToMain()
		OpenPageUntilLoaded("/home")
	end,
	OtherSystemVisitExit = function(arg_6_0)
		BackHomeDataManager:OtherSystemVisitBack()
		LuaExchangeHelper.GoToMain()
	end,
	CheckBackHomeConditionAccord = function(arg_7_0, arg_7_1, arg_7_2)
		local var_7_0 = ConditionCfg[arg_7_1]

		if var_7_0 == nil then
			return true, 0, 0
		end

		local var_7_1 = 0

		if var_7_0 then
			local var_7_2 = var_7_0.type

			if var_7_2 == CanteenConst.UnLockCon.CookLevel then
				local var_7_3 = CanteenData:GetFurnitureLevel(var_7_0.params[1])

				return var_7_3 >= var_7_0.params[2], var_7_3, var_7_0.params[2]
			elseif var_7_2 == CanteenConst.UnLockCon.TotleIncome then
				local var_7_4 = CanteenData:GetCurEarning()

				return var_7_4 >= var_7_0.params[1], var_7_4, var_7_0.params[1]
			elseif var_7_2 == CanteenConst.UnLockCon.FoodProficiency then
				local var_7_5 = CanteenFoodData:GetFoodProficiency(var_7_0.params[1])

				return var_7_5 >= var_7_0.params[2], var_7_5, var_7_0.params[2]
			elseif var_7_2 == CanteenConst.UnLockCon.FoodComplateNum then
				local var_7_6 = CanteenFoodData:GetFoodCookNum(var_7_0.params[1])

				return var_7_6 >= var_7_0.params[2], var_7_6, var_7_0.params[2]
			elseif var_7_2 == CanteenConst.UnLockCon.FoodTypeComplateNum then
				local var_7_7 = CanteenFoodData:GetFoodTypeCookNum(var_7_0.params[1])

				return var_7_7 >= var_7_0.params[2], var_7_7, var_7_0.params[2]
			elseif var_7_2 == CanteenConst.UnLockCon.RoomunLockNum then
				local var_7_8 = DormRoomTools:GetUnlockRoomNum()

				return var_7_8 >= var_7_0.params[1], var_7_8, var_7_0.params[1]
			end
		else
			print("不存在该解锁条件")
		end
	end
}

function var_0_0.GetBackHomeConditionDes(arg_8_0, arg_8_1)
	local var_8_0 = ConditionCfg[arg_8_1]

	if var_8_0 then
		local var_8_1 = GetI18NText(var_8_0.desc)
		local var_8_2 = var_8_0.type

		if var_8_2 == CanteenConst.UnLockCon.CookLevel then
			local var_8_3 = CanteenTools:GetCookCfgNameByEid(var_8_0.params[1])
			local var_8_4 = var_8_0.params[2]

			return string.format(var_8_1, var_8_3, var_8_4)
		elseif var_8_2 == CanteenConst.UnLockCon.TotleIncome then
			local var_8_5 = CanteenData:GetCurEarning()

			if var_8_5 < var_8_0.params[1] then
				var_8_5 = var_0_0:ChangeStrColor(var_8_5)
			end

			return string.format(var_8_1, var_8_5)
		elseif var_8_2 == CanteenConst.UnLockCon.FoodProficiency then
			local var_8_6 = var_8_0.params[1]
			local var_8_7 = CanteenFoodData:GetFoodProficiency(var_8_6)

			if var_8_7 < var_8_0.params[2] then
				var_8_7 = var_0_0:ChangeStrColor(var_8_7)
			end

			return (string.format(var_8_1, BackHomeCanteenFoodCfg[var_8_6].name, var_8_7))
		elseif var_8_2 == CanteenConst.UnLockCon.FoodComplateNum then
			local var_8_8 = var_8_0.params[1]
			local var_8_9 = CanteenFoodData:GetFoodCookNum(var_8_8)

			if var_8_9 < var_8_0.params[2] then
				var_8_9 = var_0_0:ChangeStrColor(var_8_9)
			end

			return (string.format(var_8_1, BackHomeCanteenFoodCfg[var_8_8].name, var_8_9))
		elseif var_8_2 == CanteenConst.UnLockCon.FoodTypeComplateNum then
			local var_8_10 = var_8_0.params[1]
			local var_8_11 = CanteenFoodData:GetFoodTypeCookNum(var_8_10)

			if var_8_11 < var_8_0.params[2] then
				var_8_11 = var_0_0:ChangeStrColor(var_8_11)
			end

			return (string.format(var_8_1, CanteenTools:ShowTipsGetCookCfgName(var_8_10), var_8_11))
		elseif var_8_2 == CanteenConst.UnLockCon.RoomunLockNum then
			return var_8_1
		end
	else
		print("不存在该解锁条件")
	end
end

function var_0_0.ChangeStrColor(arg_9_0, arg_9_1)
	return "<color=#FF000B>" .. arg_9_1 .. "</color>"
end

function var_0_0.OnceDeploy(arg_10_0)
	local var_10_0 = {}
	local var_10_1 = {}
	local var_10_2 = {}
	local var_10_3 = {}
	local var_10_4 = CanteenHeroTools:GetCanteenJobList()

	for iter_10_0, iter_10_1 in ipairs(var_10_4) do
		if iter_10_1 then
			local var_10_5 = iter_10_1.heroID

			if var_10_5 then
				table.insert(var_10_3, var_10_5)
			end
		end
	end

	for iter_10_2, iter_10_3 in ipairs(DormConst.DORM_RESTAURANT_SET_JOB_TYPE) do
		local var_10_6 = DormEnum.RestaurantJobToServerMap[iter_10_3]
		local var_10_7 = DormHeroTools:GetUnLockBackHomeHeroIDList()
		local var_10_8 = DormNpcTools:GetNpcInfoListByConstJobType(var_10_6)

		for iter_10_4, iter_10_5 in ipairs(var_10_8) do
			table.insert(var_10_7, iter_10_5)
		end

		for iter_10_6, iter_10_7 in ipairs(var_10_3) do
			table.insert(var_10_7, iter_10_7)
		end

		CommonTools.UniversalSortEx(var_10_7, {
			ascend = true,
			map = function(arg_11_0)
				if not DormNpcTools:CheckIDIsNpc(arg_11_0) then
					local var_11_0 = DormData:GetCharacterInfo(arg_11_0)

					if not CanteenEntrustData:CheckHasChooseEntrustCharacter(arg_11_0) then
						return 1
					end

					return 3
				else
					return 2
				end
			end
		}, {
			map = function(arg_12_0)
				if not DormNpcTools:CheckIDIsNpc(arg_12_0) then
					return #DormSkillData:CheckSkillCanOpen(var_10_6, arg_12_0)
				end
			end
		}, {
			map = function(arg_13_0)
				if not DormNpcTools:CheckIDIsNpc(arg_13_0) then
					return DormData:GetHeroFatigue(arg_13_0)
				end
			end
		}, {
			map = function(arg_14_0)
				return (DormData:GetHeroArchiveID(arg_14_0))
			end
		}, {
			map = function(arg_15_0)
				return arg_15_0
			end
		})

		for iter_10_8 = 1, #var_10_7 do
			if var_10_7[iter_10_8] and not var_10_1[var_10_7[iter_10_8]] and not var_10_2[DormData:GetHeroArchiveID(var_10_7[iter_10_8])] then
				if DormHeroTools.GetCanteenFatigueLevel(DormData:GetHeroFatigue(var_10_7[iter_10_8])) < 2 then
					break
				end

				var_10_1[var_10_7[iter_10_8]] = var_10_6
				var_10_2[DormData:GetHeroArchiveID(var_10_7[iter_10_8])] = true

				break
			end
		end
	end

	local var_10_9 = DormData:GetHeroInfoList()
	local var_10_10 = IdolTraineeData:GetIdolHeroList()
	local var_10_11 = {}

	for iter_10_9, iter_10_10 in ipairs(var_10_10) do
		var_10_11[iter_10_10] = true
	end

	for iter_10_11, iter_10_12 in pairs(var_10_9) do
		local var_10_12 = iter_10_12:GetHeroState()

		if not (var_10_12 == DormEnum.DormHeroState.InCanteenEntrust or var_10_12 == DormEnum.DormHeroState.InCanteenJob or var_10_1[iter_10_12.hero_id] or var_10_2[DormData:GetHeroArchiveID(iter_10_12.hero_id)]) and not iter_10_12:GetRoomID() then
			table.insert(var_10_0, iter_10_12)
		end
	end

	table.sort(var_10_0, function(arg_16_0, arg_16_1)
		local var_16_0 = arg_16_0:GetFatigue()
		local var_16_1 = arg_16_1:GetFatigue()

		if var_16_0 == var_16_1 then
			return arg_16_0.hero_id < arg_16_1.hero_id
		end

		return var_16_1 < var_16_0
	end)

	local var_10_13 = {}
	local var_10_14 = #var_10_0
	local var_10_15 = 1

	for iter_10_13 = 1, var_10_14 do
		if var_10_0[iter_10_13] and var_10_11[var_10_0[iter_10_13].hero_id] then
			table.insert(var_10_13, {
				hero_id = var_10_0[iter_10_13].hero_id,
				pos = var_10_15
			})

			var_10_15 = var_10_15 + 1
			var_10_0[iter_10_13] = false

			if var_10_15 == 6 then
				break
			end
		end
	end

	table.sort(var_10_0, function(arg_17_0, arg_17_1)
		if arg_17_0 == false then
			return false
		end

		if arg_17_1 == false then
			return false
		end

		local var_17_0 = arg_17_0:GetFatigue()
		local var_17_1 = arg_17_1:GetFatigue()

		if var_17_0 == var_17_1 then
			return arg_17_0.hero_id < arg_17_1.hero_id
		end

		return var_17_0 < var_17_1
	end)

	local var_10_16 = {}
	local var_10_17 = 0

	for iter_10_14 = 1, var_10_14 do
		if var_10_0[iter_10_14] then
			table.insert(var_10_16, var_10_0[iter_10_14].hero_id)

			var_10_17 = var_10_17 + 1
		end

		if var_10_17 == 5 then
			break
		end
	end

	local var_10_18 = {}

	for iter_10_15, iter_10_16 in pairs(var_10_1) do
		table.insert(var_10_18, {
			jobType = iter_10_16,
			id = iter_10_15
		})
	end

	if var_10_18[1] then
		CanteenAction:SetCharacterJob(var_10_18[1].jobType, {
			var_10_18[1].id
		}, function()
			if var_10_18[2] then
				CanteenAction:SetCharacterJob(var_10_18[2].jobType, {
					var_10_18[2].id
				}, function()
					if var_10_18[3] then
						CanteenAction:SetCharacterJob(var_10_18[3].jobType, {
							var_10_18[3].id
						}, function()
							arg_10_0:OnceDeploy_Stage2(var_10_13, var_10_16)
						end)
					else
						arg_10_0:OnceDeploy_Stage2(var_10_13, var_10_16)
					end
				end)
			else
				arg_10_0:OnceDeploy_Stage2(var_10_13, var_10_16)
			end
		end)
	else
		arg_10_0:OnceDeploy_Stage2(var_10_13, var_10_16)
	end
end

function var_0_0.OnceDeploy_Stage2(arg_21_0, arg_21_1, arg_21_2)
	deferred.all({
		IdolTraineeAction.RequestSetHeroPosPromise(arg_21_1),
		DormAction:DeployHeroInRoomPromise(DormConst.PUBLIC_DORM_ID, arg_21_2, DormEnum.DormDeployType.Place)
	}):next(function(arg_22_0)
		for iter_22_0, iter_22_1 in ipairs(arg_22_0) do
			if not isSuccess(iter_22_1.result) then
				return
			end
		end

		ShowTips("BACKHOME_HERO_AUTO_PLACE")
	end)
end

return var_0_0
