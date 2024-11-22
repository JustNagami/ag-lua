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
		CanteenEntrustData:ConfirmEntrustListCallBack(arg_3_1)
	else
		ShowTips(arg_3_0.result)
		CanteenEntrustData:ClearDispatchCharacterList()
	end
end

function var_0_0.SetCharacterJob(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0 = DormConst.CANTEEN_ID
	local var_4_1 = arg_4_2[1]

	manager.net:SendWithLoadingNew(58104, {
		architecture_id = var_4_0,
		type = arg_4_1,
		hero_id = var_4_1
	}, 58105, var_0_0.OnSetCharacterJobCallBack)
end

function var_0_0.OnSetCharacterJobCallBack(arg_5_0, arg_5_1)
	if isSuccess(arg_5_0.result) then
		local var_5_0 = CanteenHeroTools:GetCurWorkIDListByJobType(arg_5_1.type)

		for iter_5_0, iter_5_1 in ipairs(var_5_0) do
			if DormNpcTools:CheckIDIsNpc(iter_5_1) then
				BackHomeNpcData:GetNpcInfoById(iter_5_1):SetJob(nil)
			else
				DormData:GetHeroInfo(iter_5_1):BackToDorm()
			end
		end

		if arg_5_1.hero_id > 0 then
			local var_5_1 = arg_5_1.hero_id

			if DormNpcTools:CheckIDIsNpc(var_5_1) then
				BackHomeNpcData:GetNpcInfoById(var_5_1):SetJob(arg_5_1.type)
			else
				local var_5_2 = DormData:GetHeroTemplateInfo(var_5_1)

				var_5_2:SetCurHeroID(var_5_1)
				var_5_2:SetJob(arg_5_1.type)
				var_5_2:GoToCanteen()
			end
		elseif arg_5_1.hero_id == 0 and not DormNpcTools:CheckIDIsNpc(var_5_0[1]) then
			local var_5_3 = DormNpcTools:GetNpcInfoListByConstJobType(arg_5_1.type)[1]

			BackHomeNpcData:GetNpcInfoById(var_5_3):SetJob(arg_5_1.type)
		end

		CanteenHeroTools:RefreshCanteenJobList()

		local var_5_4 = DormEnum.RestaurantJobToClientMap[arg_5_1.type]

		if CanteenData:GetCanteenState() == DormEnum.RestaurantMode.Close then
			manager.notify:Invoke(DORM_RESTAURANT_UPDATE_CHARACTER_BY_TYPE, var_5_4)
		elseif CanteenData:GetCanteenState() == DormEnum.RestaurantMode.RestaurantAuto then
			manager.notify:Invoke(DORM_RESTAURANT_START_AUTO)
		end

		manager.notify:Invoke(CANTEEN_SET_JOG_SUCCESS)
	else
		ShowTips(arg_5_0.result)
	end
end

function var_0_0.ReceiveCanteenAutoAward(arg_6_0, arg_6_1)
	manager.net:SendWithLoadingNew(58106, {
		architecture_id = arg_6_1
	}, 58107, var_0_0.OnCanteenAutoAwardCallBack)
end

function var_0_0.OnCanteenAutoAwardCallBack(arg_7_0, arg_7_1)
	if isSuccess(arg_7_0.result) then
		local var_7_0 = arg_7_0.earnings

		CanteenData:ReceiveCurPenEarSuccess(var_7_0, DormEnum.RestaurantMode.RestaurantAuto)
	else
		ShowTips(arg_7_0.result)
	end
end

local var_0_2

function var_0_0.ChangeCanteenMode(arg_8_0, arg_8_1, arg_8_2, arg_8_3)
	local var_8_0

	var_0_2 = arg_8_3

	if arg_8_2 == DormEnum.RestaurantMode.RestaurantAuto then
		var_8_0 = 0
	elseif arg_8_2 == DormEnum.RestaurantMode.RestaurantManual then
		var_8_0 = 1
	end

	if var_8_0 then
		manager.net:SendWithLoadingNew(58108, {
			architecture_id = arg_8_1,
			cmd = var_8_0
		}, 58109, var_0_0.ChangeCanteenModeCallBack)
	end
end

function var_0_0.ChangeCanteenModeCallBack(arg_9_0, arg_9_1)
	if isSuccess(arg_9_0.result) then
		local var_9_0 = {}

		if arg_9_1.cmd == 0 then
			var_9_0 = DormEnum.RestaurantMode.RestaurantAuto
		elseif arg_9_1.cmd == 1 then
			var_9_0 = DormEnum.RestaurantMode.RestaurantManual
		end

		CanteenData:ChangeCanteenStateSusscee(var_9_0, var_0_2)

		var_0_2 = nil
	else
		ShowTips(arg_9_0.result)
	end
end

function var_0_0.RefreshEntrust(arg_10_0, arg_10_1, arg_10_2)
	manager.net:SendWithLoadingNew(58012, {
		architecture_id = arg_10_1,
		pos = arg_10_2
	}, 58013, var_0_0.RefreshEntrustCallBack)
end

function var_0_0.RefreshEntrustCallBack(arg_11_0, arg_11_1)
	if isSuccess(arg_11_0.result) then
		CanteenEntrustData:InitEntrustData(arg_11_0.entrust)
		manager.notify:Invoke(CANTEEN_REFRESH_ENTRUST_CALLBACK, arg_11_0.entrust.pos)
	else
		ShowTips(arg_11_0.result)
	end
end

function var_0_0.SendSignFoodInfo(arg_12_0, arg_12_1, arg_12_2)
	local var_12_0 = DormConst.CANTEEN_ID

	manager.net:SendWithLoadingNew(58114, {
		architecture_id = var_12_0,
		food_id = arg_12_1,
		sell_num = arg_12_2
	}, 58115, var_0_0.SetSignFoodCallBack)
end

function var_0_0.SetSignFoodCallBack(arg_13_0, arg_13_1)
	if isSuccess(arg_13_0.result) then
		if arg_13_1.sell_num > 0 then
			CanteenFoodData:PushFoodToSignList(arg_13_1.food_id, arg_13_1.sell_num)
		else
			CanteenFoodData:PushFoodToSignList(arg_13_1.food_id)
		end

		manager.notify:Invoke(CANTEEN_SET_SIGNFOOD_SUCCESS)
	else
		ShowTips(arg_13_0.result)
	end
end

function var_0_0.CanteenFurnitureUpgrade(arg_14_0, arg_14_1)
	manager.net:SendWithLoadingNew(58116, {
		uid = arg_14_1
	}, 58117, var_0_0.CanteenFurnitureUpgradeCallBack)
end

function var_0_0.CanteenFurnitureUpgradeCallBack(arg_15_0, arg_15_1)
	if isSuccess(arg_15_0.result) then
		CanteenData:FurLevelUpCallBack(arg_15_1.uid)
		DormSkillData:CalCanSignFoodNum()
		DormSkillData:CalInComeStorageMaxNum()
		DormRedPointTools:CheckUnLockFoodRedPoint()
		manager.notify:Invoke(CANTEEN_FUR_LEVEL_UP)
	else
		ShowTips(arg_15_0.result)
	end
end

function var_0_0.ReceiveEntrustAward(arg_16_0, arg_16_1, arg_16_2)
	local var_16_0 = {}

	for iter_16_0, iter_16_1 in ipairs(arg_16_2) do
		table.insert(var_16_0, iter_16_1)
	end

	manager.net:SendWithLoadingNew(58018, {
		architecture_id = arg_16_1,
		pos = var_16_0
	}, 58019, var_0_0.ReceiveEntrustAwardCallBack)
end

function var_0_0.ReceiveEntrustAwardCallBack(arg_17_0, arg_17_1)
	if isSuccess(arg_17_0.result) then
		local var_17_0 = {}

		for iter_17_0, iter_17_1 in ipairs(arg_17_0.extra_reward) do
			local var_17_1 = CanteenEntrustData:GetEntrustByPos(iter_17_1.pos).id
			local var_17_2 = var_0_1(iter_17_1)

			table.insert(var_17_0, var_17_2)
		end

		for iter_17_2, iter_17_3 in ipairs(arg_17_0.fatigue_list) do
			local var_17_3 = DormData:GetHeroInfo(iter_17_3.archives_id)

			var_17_3:SetFatigue(iter_17_3.fatigue)
			var_17_3:BackToDorm()
		end

		manager.notify:Invoke(BACKHOME_HERO_FATIGUR_REFRESH)
		CanteenEntrustData:EntrustFinish(var_17_0, arg_17_0.entrust)
	else
		ShowTips(arg_17_0.result)
	end
end

function var_0_0.CanteenManualSettlement(arg_18_0, arg_18_1, arg_18_2)
	local var_18_0 = {}

	for iter_18_0, iter_18_1 in pairs(arg_18_2) do
		local var_18_1 = {
			food_id = iter_18_1.food_id,
			quality = iter_18_1.quality,
			guest_uid = iter_18_1.guest_uid,
			guest_id = iter_18_1.guest_id,
			special_event = iter_18_1.special_event,
			evaluate = iter_18_1.evaluate
		}

		table.insert(var_18_0, var_18_1)
	end

	manager.net:SendWithLoadingNew(58120, {
		architecture_id = arg_18_1,
		oper_list = var_18_0
	}, 58121, var_0_0.CanteenManualSettlementCallBack)
end

function var_0_0.CanteenManualSettlementCallBack(arg_19_0, arg_19_1)
	if isSuccess(arg_19_0.result) then
		CanteenFoodData:GetManualAward(arg_19_1)
		manager.notify:Invoke(CANTEEN_MANUAL_REWARD_CALLBACK)
	else
		ShowTips(arg_19_0.result)
	end
end

manager.net:Bind(58023, function(arg_20_0)
	CanteenData:RefreshAutoAwardInfo(arg_20_0)

	for iter_20_0, iter_20_1 in ipairs(arg_20_0.fatigue_list) do
		if iter_20_1 then
			local var_20_0 = DormData:GetHeroInfo(iter_20_1.archives_id)

			if var_20_0 then
				var_20_0:SetFatigue(iter_20_1.fatigue)
			end
		end
	end

	manager.notify:Invoke(BACKHOME_HERO_FATIGUR_REFRESH)

	for iter_20_2, iter_20_3 in ipairs(arg_20_0.signature_dish) do
		if iter_20_3 then
			CanteenFoodData:ReviseSignFoodInfo(iter_20_3)
		end
	end

	for iter_20_4, iter_20_5 in ipairs(arg_20_0.food) do
		if iter_20_5 then
			CanteenFoodData:UpdataFoodProficiency(iter_20_5)
		end
	end

	local var_20_1

	for iter_20_6, iter_20_7 in ipairs(arg_20_0.npc_change) do
		if iter_20_7 then
			local var_20_2 = BackHomeNpcData:GetNpcInfoById(iter_20_7)
			local var_20_3 = var_20_2.constJobType

			var_20_2:SetJob(var_20_3)

			var_20_1 = true
		end
	end

	if var_20_1 then
		CanteenHeroTools:RefreshCanteenJobList()
		manager.notify:Invoke(DORM_RESTAURANT_START_AUTO)
	end

	DormRedPointTools:UpdateCanteenNotify()
end)

function var_0_0.UnLockEntrust(arg_21_0, arg_21_1)
	manager.net:SendWithLoadingNew(58024, {
		pos = arg_21_1
	}, 58025, var_0_0.UnLockEntrustCallBack)
end

function var_0_0.UnLockEntrustCallBack(arg_22_0, arg_22_1)
	if isSuccess(arg_22_0.result) then
		local var_22_0 = arg_22_0.entrust

		CanteenEntrustData:InitEntrustData(var_22_0)
		DormRedPointTools:CheckUnLockEntrustRedPoint()
		manager.notify:Invoke(CANTEEN_REFRESH_ENTRUST_CALLBACK, var_22_0.pos)
	else
		ShowTips(arg_22_0.result)
	end
end

manager.net:Bind(58027, function(arg_23_0)
	for iter_23_0, iter_23_1 in ipairs(arg_23_0.fatigue_list) do
		local var_23_0 = iter_23_1.archives_id
		local var_23_1 = DormData:GetHeroInfo(var_23_0)

		if var_23_1 then
			var_23_1:SetFatigue(iter_23_1.fatigue)
		end

		for iter_23_2, iter_23_3 in ipairs(DormConst.DORM_RESTAURANT_SET_JOB_TYPE) do
			if not CanteenHeroTools:HasJobAssignedToHero(iter_23_3) then
				manager.notify:Invoke(CANTEEN_UPDATE_STATE)

				break
			end
		end
	end

	manager.notify:Invoke(BACKHOME_HERO_FATIGUR_REFRESH)
end)

return var_0_0
