local var_0_0 = {
	GotoBackHomeRoom = function(arg_1_0, arg_1_1, arg_1_2)
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
		else
			function var_1_1(arg_3_0)
				BackHomeDataManager:GotoBackHomeScene(arg_1_1)
			end
		end

		BackHomeDataManager:EnterBackHomeSystem(var_1_1)
	end,
	BackHomeGotoMain = function(arg_4_0)
		BackHomeDataManager:ExitBackHomeSystem()
		LuaExchangeHelper.GoToMain()
		OpenPageUntilLoaded("/home")
	end,
	OtherSystemVisitExit = function(arg_5_0)
		BackHomeDataManager:OtherSystemVisitBack()
		LuaExchangeHelper.GoToMain()
	end,
	CheckBackHomeConditionAccord = function(arg_6_0, arg_6_1, arg_6_2)
		local var_6_0 = ConditionCfg[arg_6_1]

		if var_6_0 == nil then
			return true, 0, 0
		end

		local var_6_1 = 0

		if var_6_0 then
			local var_6_2 = var_6_0.type

			if var_6_2 == CanteenConst.UnLockCon.CookLevel then
				local var_6_3 = CanteenData:GetFurnitureLevel(var_6_0.params[1])

				return var_6_3 >= var_6_0.params[2], var_6_3, var_6_0.params[2]
			elseif var_6_2 == CanteenConst.UnLockCon.TotleIncome then
				local var_6_4 = CanteenData:GetCurEarning()

				return var_6_4 >= var_6_0.params[1], var_6_4, var_6_0.params[1]
			elseif var_6_2 == CanteenConst.UnLockCon.FoodProficiency then
				local var_6_5 = CanteenFoodData:GetFoodProficiency(var_6_0.params[1])

				return var_6_5 >= var_6_0.params[2], var_6_5, var_6_0.params[2]
			elseif var_6_2 == CanteenConst.UnLockCon.FoodComplateNum then
				local var_6_6 = CanteenFoodData:GetFoodCookNum(var_6_0.params[1])

				return var_6_6 >= var_6_0.params[2], var_6_6, var_6_0.params[2]
			elseif var_6_2 == CanteenConst.UnLockCon.FoodTypeComplateNum then
				local var_6_7 = CanteenFoodData:GetFoodTypeCookNum(var_6_0.params[1])

				return var_6_7 >= var_6_0.params[2], var_6_7, var_6_0.params[2]
			elseif var_6_2 == CanteenConst.UnLockCon.RoomunLockNum then
				local var_6_8 = DormRoomTools:GetUnlockRoomNum()

				return var_6_8 >= var_6_0.params[1], var_6_8, var_6_0.params[1]
			end
		else
			print("不存在该解锁条件")
		end
	end
}

function var_0_0.GetBackHomeConditionDes(arg_7_0, arg_7_1)
	local var_7_0 = ConditionCfg[arg_7_1]

	if var_7_0 then
		local var_7_1 = GetI18NText(var_7_0.desc)
		local var_7_2 = var_7_0.type

		if var_7_2 == CanteenConst.UnLockCon.CookLevel then
			local var_7_3 = CanteenTools:GetCookCfgNameByEid(var_7_0.params[1])
			local var_7_4 = var_7_0.params[2]

			return string.format(var_7_1, GetI18NText(var_7_3), var_7_4)
		elseif var_7_2 == CanteenConst.UnLockCon.TotleIncome then
			local var_7_5 = CanteenData:GetCurEarning()

			if var_7_5 < var_7_0.params[1] then
				var_7_5 = var_0_0:ChangeStrColor(var_7_5)
			end

			return string.format(var_7_1, var_7_5)
		elseif var_7_2 == CanteenConst.UnLockCon.FoodProficiency then
			local var_7_6 = var_7_0.params[1]
			local var_7_7 = CanteenFoodData:GetFoodProficiency(var_7_6)

			if var_7_7 < var_7_0.params[2] then
				var_7_7 = var_0_0:ChangeStrColor(var_7_7)
			end

			return (string.format(var_7_1, GetI18NText(BackHomeCanteenFoodCfg[var_7_6].name), var_7_7))
		elseif var_7_2 == CanteenConst.UnLockCon.FoodComplateNum then
			local var_7_8 = var_7_0.params[1]
			local var_7_9 = CanteenFoodData:GetFoodCookNum(var_7_8)

			if var_7_9 < var_7_0.params[2] then
				var_7_9 = var_0_0:ChangeStrColor(var_7_9)
			end

			return (string.format(var_7_1, GetI18NText(BackHomeCanteenFoodCfg[var_7_8].name), var_7_9))
		elseif var_7_2 == CanteenConst.UnLockCon.FoodTypeComplateNum then
			local var_7_10 = var_7_0.params[1]
			local var_7_11 = CanteenFoodData:GetFoodTypeCookNum(var_7_10)

			if var_7_11 < var_7_0.params[2] then
				var_7_11 = var_0_0:ChangeStrColor(var_7_11)
			end

			return (string.format(var_7_1, CanteenTools:ShowTipsGetCookCfgName(var_7_10), var_7_11))
		elseif var_7_2 == CanteenConst.UnLockCon.RoomunLockNum then
			return var_7_1
		end
	else
		print("不存在该解锁条件")
	end
end

function var_0_0.ChangeStrColor(arg_8_0, arg_8_1)
	return "<color=#FF000B>" .. arg_8_1 .. "</color>"
end

return var_0_0
