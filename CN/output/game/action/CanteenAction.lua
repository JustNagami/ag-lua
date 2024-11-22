local var_0_0 = {}

local function var_0_1(arg_1_0)
	local var_1_0 = {
		pos = arg_1_0.pos,
		extra_reward = arg_1_0.extra_reward,
		entrustID = CanteenEntrustData:GetEntrustByPos(arg_1_0.pos).id
	}
	local var_1_1 = DormSkillData:GetSkillEffect(CanteenConst.HeroSkillType.EntrustExternAwardAdd, nil, arg_1_0.pos)
	local var_1_2 = {}

	for iter_1_0, iter_1_1 in ipairs(arg_1_0.reward_list) do
		local var_1_3 = {
			id = iter_1_1.id,
			num = iter_1_1.num
		}

		if arg_1_0.extra_reward == 1 then
			var_1_3.extraNum = iter_1_1.num - math.ceil(iter_1_1.num / ((100 + GameSetting.canteen_task_success.value[1]) / 100))
		end

		table.insert(var_1_2, var_1_3)
	end

	var_1_0.rewardList = var_1_2

	return var_1_0
end

function var_0_0.SendTaskDispatchInfo(arg_2_0, arg_2_1)
	local var_2_0 = {}

	if arg_2_1.heroList == nil then
		var_2_0 = nil
	else
		for iter_2_0, iter_2_1 in ipairs(arg_2_1.heroList) do
			table.insert(var_2_0, iter_2_1)
		end
	end

	local var_2_1 = CanteenEntrustData:GetEntrustByPos(arg_2_1.pos)
	local var_2_2

	if arg_2_1.timeLevel then
		var_2_2 = BackHomeCanteenTaskCfg[var_2_1.id].time[arg_2_1.timeLevel][1]
	end

	manager.net:SendWithLoadingNew(58102, {
		architecture_id = arg_2_1.sceneID,
		pos = arg_2_1.pos,
		hero_list = var_2_0,
		duration = var_2_2
	}, 58103, var_0_0.OnSolveTaskDispatchCallBack)
end

function var_0_0.OnSolveTaskDispatchCallBack(arg_3_0, arg_3_1)
	if isSuccess(arg_3_0.result) then
		ShowTips("CANTEEN_TASK_DISPATCH")
		CanteenEntrustData:ConfirmEntrustListCallBack(arg_3_1)
	else
		ShowTips(arg_3_0.result)
		CanteenEntrustData:ClearDispatchCharacterList()
	end
end

function var_0_0.SetCharacterJob(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
	local var_4_0 = DormConst.CANTEEN_ID
	local var_4_1 = arg_4_2[1]

	manager.net:SendWithLoadingNew(58104, {
		architecture_id = var_4_0,
		type = arg_4_1,
		hero_id = var_4_1
	}, 58105, function(arg_5_0, arg_5_1)
		var_0_0.OnSetCharacterJobCallBack(arg_5_0, arg_5_1)

		if arg_4_3 then
			arg_4_3()
		end
	end)
end

function var_0_0.OnSetCharacterJobCallBack(arg_6_0, arg_6_1)
	if isSuccess(arg_6_0.result) then
		local var_6_0 = CanteenHeroTools:GetCurWorkIDListByJobType(arg_6_1.type)

		for iter_6_0, iter_6_1 in ipairs(var_6_0) do
			if DormNpcTools:CheckIDIsNpc(iter_6_1) then
				BackHomeNpcData:GetNpcInfoById(iter_6_1):SetJob(nil)
			else
				DormData:GetHeroInfo(iter_6_1):BackToDorm()
			end
		end

		if arg_6_1.hero_id > 0 then
			local var_6_1 = arg_6_1.hero_id

			if DormNpcTools:CheckIDIsNpc(var_6_1) then
				BackHomeNpcData:GetNpcInfoById(var_6_1):SetJob(arg_6_1.type)
			else
				local var_6_2 = DormData:GetHeroTemplateInfo(var_6_1)

				var_6_2:SetCurHeroID(var_6_1)
				var_6_2:SetJob(arg_6_1.type)
				var_6_2:GoToCanteen()
			end
		elseif arg_6_1.hero_id == 0 and not DormNpcTools:CheckIDIsNpc(var_6_0[1]) then
			local var_6_3 = DormNpcTools:GetNpcInfoListByConstJobType(arg_6_1.type)[1]

			BackHomeNpcData:GetNpcInfoById(var_6_3):SetJob(arg_6_1.type)
		end

		CanteenHeroTools:RefreshCanteenJobList()

		local var_6_4 = DormEnum.RestaurantJobToClientMap[arg_6_1.type]

		if CanteenData:GetCanteenState() == DormEnum.RestaurantMode.Close then
			manager.notify:Invoke(DORM_RESTAURANT_UPDATE_CHARACTER_BY_TYPE, var_6_4)
		elseif CanteenData:GetCanteenState() == DormEnum.RestaurantMode.RestaurantAuto then
			manager.notify:Invoke(DORM_RESTAURANT_START_AUTO)
		end

		manager.notify:Invoke(CANTEEN_SET_JOG_SUCCESS)
	else
		ShowTips(arg_6_0.result)
	end
end

function var_0_0.ReceiveCanteenAutoAward(arg_7_0, arg_7_1)
	manager.net:SendWithLoadingNew(58106, {
		architecture_id = arg_7_1
	}, 58107, var_0_0.OnCanteenAutoAwardCallBack)
end

function var_0_0.OnCanteenAutoAwardCallBack(arg_8_0, arg_8_1)
	if isSuccess(arg_8_0.result) then
		local var_8_0 = arg_8_0.earnings

		CanteenData:ReceiveCurPenEarSuccess(var_8_0, DormEnum.RestaurantMode.RestaurantAuto)
		manager.notify:Invoke(BACKHOME_CATEEN_AWARD_UPDATE)
	else
		ShowTips(arg_8_0.result)
	end
end

local var_0_2

function var_0_0.ChangeCanteenMode(arg_9_0, arg_9_1, arg_9_2, arg_9_3)
	local var_9_0

	var_0_2 = arg_9_3

	if arg_9_2 == DormEnum.RestaurantMode.RestaurantAuto then
		var_9_0 = 0
	elseif arg_9_2 == DormEnum.RestaurantMode.RestaurantManual then
		var_9_0 = 1
	end

	if var_9_0 then
		manager.net:SendWithLoadingNew(58108, {
			architecture_id = arg_9_1,
			cmd = var_9_0
		}, 58109, var_0_0.ChangeCanteenModeCallBack)
	end
end

function var_0_0.ChangeCanteenModeCallBack(arg_10_0, arg_10_1)
	if isSuccess(arg_10_0.result) then
		local var_10_0 = {}

		if arg_10_1.cmd == 0 then
			var_10_0 = DormEnum.RestaurantMode.RestaurantAuto
		elseif arg_10_1.cmd == 1 then
			var_10_0 = DormEnum.RestaurantMode.RestaurantManual
		end

		CanteenData:ChangeCanteenStateSusscee(var_10_0, var_0_2)

		var_0_2 = nil
	else
		ShowTips(arg_10_0.result)
	end
end

function var_0_0.RefreshEntrust(arg_11_0, arg_11_1, arg_11_2)
	manager.net:SendWithLoadingNew(58012, {
		architecture_id = arg_11_1,
		pos = arg_11_2
	}, 58013, var_0_0.RefreshEntrustCallBack)
end

function var_0_0.RefreshEntrustCallBack(arg_12_0, arg_12_1)
	if isSuccess(arg_12_0.result) then
		CanteenEntrustData:InitEntrustData(arg_12_0.entrust)
		manager.notify:Invoke(CANTEEN_REFRESH_ENTRUST_CALLBACK, arg_12_0.entrust.pos)
	else
		ShowTips(arg_12_0.result)
	end
end

function var_0_0.SendSignFoodInfo(arg_13_0, arg_13_1, arg_13_2)
	local var_13_0 = DormConst.CANTEEN_ID

	manager.net:SendWithLoadingNew(58114, {
		architecture_id = var_13_0,
		food_id = arg_13_1,
		sell_num = arg_13_2
	}, 58115, var_0_0.SetSignFoodCallBack)
end

function var_0_0.SetSignFoodCallBack(arg_14_0, arg_14_1)
	if isSuccess(arg_14_0.result) then
		if arg_14_1.sell_num > 0 then
			CanteenFoodData:PushFoodToSignList(arg_14_1.food_id, arg_14_1.sell_num)
		else
			CanteenFoodData:PushFoodToSignList(arg_14_1.food_id)
		end

		manager.notify:Invoke(CANTEEN_SET_SIGNFOOD_SUCCESS)
	else
		ShowTips(arg_14_0.result)
	end
end

function var_0_0.CanteenFurnitureUpgrade(arg_15_0, arg_15_1)
	manager.net:SendWithLoadingNew(58116, {
		uid = arg_15_1
	}, 58117, var_0_0.CanteenFurnitureUpgradeCallBack)
end

function var_0_0.CanteenFurnitureUpgradeCallBack(arg_16_0, arg_16_1)
	if isSuccess(arg_16_0.result) then
		CanteenData:FurLevelUpCallBack(arg_16_1.uid)
		DormSkillData:CalCanSignFoodNum()
		DormSkillData:CalInComeStorageMaxNum()
		DormRedPointTools:CheckUnLockFoodRedPoint()
		manager.notify:Invoke(CANTEEN_FUR_LEVEL_UP)
	else
		ShowTips(arg_16_0.result)
	end
end

function var_0_0.ReceiveEntrustAward(arg_17_0, arg_17_1, arg_17_2)
	local var_17_0 = {}

	for iter_17_0, iter_17_1 in ipairs(arg_17_2) do
		table.insert(var_17_0, iter_17_1)
	end

	manager.net:SendWithLoadingNew(58018, {
		architecture_id = arg_17_1,
		pos = var_17_0
	}, 58019, var_0_0.ReceiveEntrustAwardCallBack)
end

function var_0_0.ReceiveEntrustAwardCallBack(arg_18_0, arg_18_1)
	if isSuccess(arg_18_0.result) then
		local var_18_0 = {}

		for iter_18_0, iter_18_1 in ipairs(arg_18_0.extra_reward) do
			local var_18_1 = CanteenEntrustData:GetEntrustByPos(iter_18_1.pos).id
			local var_18_2 = var_0_1(iter_18_1)

			table.insert(var_18_0, var_18_2)
		end

		for iter_18_2, iter_18_3 in ipairs(arg_18_0.fatigue_list) do
			local var_18_3 = DormData:GetHeroInfo(iter_18_3.archives_id)

			var_18_3:SetFatigue(iter_18_3.fatigue)
			var_18_3:BackToDorm()
		end

		manager.notify:Invoke(BACKHOME_HERO_FATIGUR_REFRESH)
		CanteenEntrustData:EntrustFinish(var_18_0, arg_18_0.entrust)
	else
		ShowTips(arg_18_0.result)
	end
end

function var_0_0.CanteenManualSettlement(arg_19_0, arg_19_1, arg_19_2)
	local var_19_0 = {}

	for iter_19_0, iter_19_1 in pairs(arg_19_2) do
		local var_19_1 = {
			food_id = iter_19_1.food_id,
			quality = iter_19_1.quality,
			guest_uid = iter_19_1.guest_uid,
			guest_id = iter_19_1.guest_id,
			special_event = iter_19_1.special_event,
			evaluate = iter_19_1.evaluate
		}

		table.insert(var_19_0, var_19_1)
	end

	manager.net:SendWithLoadingNew(58120, {
		architecture_id = arg_19_1,
		oper_list = var_19_0
	}, 58121, var_0_0.CanteenManualSettlementCallBack)
end

function var_0_0.CanteenManualSettlementCallBack(arg_20_0, arg_20_1)
	if isSuccess(arg_20_0.result) then
		CanteenFoodData:GetManualAward(arg_20_1)
		manager.notify:Invoke(CANTEEN_MANUAL_REWARD_CALLBACK)
	else
		ShowTips(arg_20_0.result)
	end
end

manager.net:Bind(58023, function(arg_21_0)
	CanteenData:RefreshAutoAwardInfo(arg_21_0)

	for iter_21_0, iter_21_1 in ipairs(arg_21_0.fatigue_list) do
		if iter_21_1 then
			local var_21_0 = DormData:GetHeroInfo(iter_21_1.archives_id)

			if var_21_0 then
				var_21_0:SetFatigue(iter_21_1.fatigue)
			end
		end
	end

	manager.notify:Invoke(BACKHOME_HERO_FATIGUR_REFRESH)

	for iter_21_2, iter_21_3 in ipairs(arg_21_0.signature_dish) do
		if iter_21_3 then
			CanteenFoodData:ReviseSignFoodInfo(iter_21_3)
		end
	end

	for iter_21_4, iter_21_5 in ipairs(arg_21_0.food) do
		if iter_21_5 then
			CanteenFoodData:UpdataFoodProficiency(iter_21_5)
		end
	end

	local var_21_1

	for iter_21_6, iter_21_7 in ipairs(arg_21_0.npc_change) do
		if iter_21_7 then
			local var_21_2 = BackHomeNpcData:GetNpcInfoById(iter_21_7)
			local var_21_3 = var_21_2.constJobType

			var_21_2:SetJob(var_21_3)

			var_21_1 = true
		end
	end

	if var_21_1 then
		CanteenHeroTools:RefreshCanteenJobList()
		manager.notify:Invoke(DORM_RESTAURANT_START_AUTO)
	end

	DormRedPointTools:UpdateCanteenNotify()
	manager.notify:Invoke(DORM_RESTAURANT_UPDATE_FINISH)
end)

function var_0_0.UnLockEntrust(arg_22_0, arg_22_1)
	manager.net:SendWithLoadingNew(58024, {
		pos = arg_22_1
	}, 58025, var_0_0.UnLockEntrustCallBack)
end

function var_0_0.UnLockEntrustCallBack(arg_23_0, arg_23_1)
	if isSuccess(arg_23_0.result) then
		local var_23_0 = arg_23_0.entrust

		CanteenEntrustData:InitEntrustData(var_23_0)
		DormRedPointTools:CheckUnLockEntrustRedPoint()
		manager.notify:Invoke(CANTEEN_REFRESH_ENTRUST_CALLBACK, var_23_0.pos)
	else
		ShowTips(arg_23_0.result)
	end
end

manager.net:Bind(58027, function(arg_24_0)
	for iter_24_0, iter_24_1 in ipairs(arg_24_0.fatigue_list) do
		local var_24_0 = iter_24_1.archives_id
		local var_24_1 = DormData:GetHeroInfo(var_24_0)

		if var_24_1 then
			var_24_1:SetFatigue(iter_24_1.fatigue)
		end

		for iter_24_2, iter_24_3 in ipairs(DormConst.DORM_RESTAURANT_SET_JOB_TYPE) do
			if not CanteenHeroTools:HasJobAssignedToHero(iter_24_3) then
				manager.notify:Invoke(CANTEEN_UPDATE_STATE)

				break
			end
		end
	end

	manager.notify:Invoke(BACKHOME_HERO_FATIGUR_REFRESH)
end)

return var_0_0
