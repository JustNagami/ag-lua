local var_0_0 = singletonClass("CanteenEntrustData")
local var_0_1
local var_0_2 = {}

function var_0_0.InitSimpleCanteenEntrustData(arg_1_0, arg_1_1)
	arg_1_0:Init(arg_1_1.canteens[1].entrust)
end

function var_0_0.InitDetailCanteenEntrustData(arg_2_0, arg_2_1)
	arg_2_0:Init(arg_2_1.canteens[1].entrust)
	arg_2_0:InitTaskTimeLevel()
end

function var_0_0.DisposeDetailData(arg_3_0)
	saveData("Dorm", "taskTimeLevel", var_0_2)
end

function var_0_0.Init(arg_4_0, arg_4_1)
	var_0_1 = {}

	for iter_4_0, iter_4_1 in ipairs(arg_4_1) do
		arg_4_0:InitEntrustData(iter_4_1)
	end

	local var_4_0 = #GameSetting.dorm_canteen_task_unlock.value

	for iter_4_2 = 1, var_4_0 do
		if not var_0_1[iter_4_2] then
			local var_4_1 = {
				id = -1,
				pos = iter_4_2
			}

			arg_4_0:InitEntrustData(var_4_1)
		end
	end
end

function var_0_0.InitTaskTimeLevel(arg_5_0)
	var_0_2 = {}

	local var_5_0 = getData("Dorm", "taskTimeLevel")

	if not var_5_0 or type(var_5_0) ~= "table" or tostring(var_5_0) == "userdata: NULL" then
		var_5_0 = {}
		var_5_0 = {
			1,
			1,
			1,
			1
		}
	end

	var_0_2 = var_5_0
end

function var_0_0.InitEntrustData(arg_6_0, arg_6_1)
	if not var_0_1 then
		var_0_1 = {}
	end

	local var_6_0 = {
		pos = arg_6_1.pos,
		id = arg_6_1.id,
		hero_list = {},
		tags = {}
	}

	if var_6_0.id > 0 then
		if arg_6_1.hero_list then
			for iter_6_0, iter_6_1 in ipairs(arg_6_1.hero_list) do
				table.insert(var_6_0.hero_list, iter_6_1)
			end
		end

		for iter_6_2, iter_6_3 in ipairs(arg_6_1.tags) do
			local var_6_1 = {
				type = iter_6_3.type,
				tag = iter_6_3.tag
			}

			table.insert(var_6_0.tags, var_6_1)
		end

		var_6_0.num_max = arg_6_1.num_max
		var_6_0.refresh_times = arg_6_1.refresh_times
		var_6_0.start_time = arg_6_1.start_time

		if arg_6_1.duration == 0 then
			var_6_0.timeLevel = 0
		else
			for iter_6_4, iter_6_5 in ipairs(BackHomeCanteenTaskCfg[arg_6_1.id].time) do
				if iter_6_5[1] == arg_6_1.duration then
					var_6_0.timeLevel = iter_6_4
				end
			end
		end
	end

	var_0_1[arg_6_1.pos] = var_6_0
end

function var_0_0.CalcEntrustLastTime(arg_7_0, arg_7_1)
	local var_7_0 = arg_7_1.id
	local var_7_1 = arg_7_1.start_time
	local var_7_2 = arg_7_1.timeLevel
	local var_7_3 = var_7_1 + BackHomeCanteenTaskCfg[var_7_0].time[var_7_2][1] * 60 - manager.time:GetServerTime()

	if var_7_3 > 0 then
		arg_7_1.lastTime = var_7_3

		return manager.time:DescCDTime(var_7_3)
	else
		arg_7_1.lastTime = 0

		return 0
	end
end

function var_0_0.GetEntrustLastTime(arg_8_0, arg_8_1)
	local var_8_0 = var_0_1[arg_8_1]

	if var_8_0 and var_0_0:IsEntrustStarted(var_8_0) then
		return var_0_0:CalcEntrustLastTime(var_8_0)
	end
end

function var_0_0.GetEntrustList(arg_9_0)
	return var_0_1
end

function var_0_0.GetEntrustByPos(arg_10_0, arg_10_1)
	return var_0_1[arg_10_1]
end

function var_0_0.CheckHasTimeOverEntrust(arg_11_0)
	local var_11_0 = {}

	for iter_11_0, iter_11_1 in pairs(var_0_1) do
		if iter_11_1.id > 0 and #iter_11_1.hero_list > 0 and var_0_0:CalcEntrustLastTime(iter_11_1) == 0 then
			table.insert(var_11_0, iter_11_0)
		end
	end

	return var_11_0
end

local var_0_3

function var_0_0.GetDispatchCharacterList(arg_12_0)
	if not var_0_3 then
		var_0_3 = {}
	end

	return var_0_3
end

function var_0_0.ClearDispatchCharacterList(arg_13_0)
	var_0_3 = {}
end

local var_0_4

function var_0_0.SetCurDispatchTask(arg_14_0, arg_14_1, arg_14_2, arg_14_3)
	if not var_0_4 then
		var_0_4 = {}
	end

	var_0_4.id = arg_14_1
	var_0_4.pos = arg_14_2
	var_0_4.timeLevel = arg_14_3
end

function var_0_0.SetDispatchCharacterList(arg_15_0, arg_15_1)
	local var_15_0 = BackHomeCanteenTaskCfg[var_0_4.id].need[2]

	if not var_0_3 then
		var_0_3 = {}
	end

	if var_15_0 >= #var_0_3 then
		local var_15_1 = DormData:GetHeroArchiveID(arg_15_1)

		for iter_15_0, iter_15_1 in ipairs(var_0_3) do
			if DormData:GetHeroArchiveID(iter_15_1) == var_15_1 then
				table.remove(var_0_3, iter_15_0)

				break
			end
		end

		table.insert(var_0_3, arg_15_1)
	else
		error("选人列表已满")
	end
end

function var_0_0.RemoveDispatchCharacterList(arg_16_0, arg_16_1)
	if var_0_3 then
		for iter_16_0 = 1, #var_0_3 do
			if var_0_3[iter_16_0] == arg_16_1 then
				table.remove(var_0_3, iter_16_0)

				return
			end
		end

		error("没找到需要去处的选择角色")
	end
end

function var_0_0.CheckDispatchCharacterList(arg_17_0, arg_17_1)
	if var_0_3 then
		for iter_17_0, iter_17_1 in ipairs(var_0_3) do
			if iter_17_1 == arg_17_1 then
				return true
			end
		end

		return false
	end
end

function var_0_0.CheckDispatchCharacterArchiveList(arg_18_0, arg_18_1)
	local var_18_0 = HeroRecordCfg.get_id_list_by_hero_id[arg_18_1][1]

	if var_0_3 then
		for iter_18_0, iter_18_1 in ipairs(var_0_3) do
			if HeroRecordCfg.get_id_list_by_hero_id[iter_18_1][1] == var_18_0 then
				return true
			end
		end

		return false
	end
end

function var_0_0.CheckHasChooseEntrustCharacter(arg_19_0, arg_19_1)
	local var_19_0 = HeroRecordCfg.get_id_list_by_hero_id[arg_19_1][1]

	for iter_19_0, iter_19_1 in pairs(var_0_1) do
		if iter_19_1.hero_list then
			for iter_19_2, iter_19_3 in ipairs(iter_19_1.hero_list) do
				if var_19_0 == HeroRecordCfg.get_id_list_by_hero_id[iter_19_3][1] then
					return true
				end
			end
		end
	end

	return false
end

function var_0_0.GetCurDispatchTask(arg_20_0)
	return var_0_4
end

function var_0_0.CalculateEntrustSuccess(arg_21_0)
	if #var_0_3 == 0 then
		return 0
	end

	local var_21_0 = var_0_1[var_0_4.pos].tags
	local var_21_1 = 0

	for iter_21_0, iter_21_1 in ipairs(var_0_3) do
		var_21_1 = var_21_1 + arg_21_0:CalHeroMatchNum(iter_21_1, var_21_0)
	end

	local var_21_2 = BackHomeCanteenTaskCfg[var_0_4.id].base_success
	local var_21_3 = var_21_1 * BackHomeCanteenTaskCfg[var_0_4.id].tag_success

	for iter_21_2, iter_21_3 in ipairs(var_0_3) do
		var_21_3 = var_21_3 + DormSkillData:GetSkillEffect(CanteenConst.HeroSkillType.EntrustExternSucceedAdd, iter_21_3)
	end

	local var_21_4 = var_21_2 + var_21_3

	if var_21_4 > 100 then
		var_21_4 = 100
	end

	return var_21_4
end

function var_0_0.CalHeroMatchNum(arg_22_0, arg_22_1, arg_22_2)
	local var_22_0 = 0

	for iter_22_0, iter_22_1 in ipairs(arg_22_2) do
		local var_22_1 = iter_22_1.type

		if var_22_1 == 1 then
			if CharactorParamCfg[arg_22_1].RangeType == iter_22_1.tag then
				var_22_0 = var_22_0 + 1
			end
		elseif var_22_1 == 2 then
			if HeroCfg[arg_22_1].race == iter_22_1.tag then
				var_22_0 = var_22_0 + 1
			end
		elseif var_22_1 == 3 then
			if HeroCfg[arg_22_1].ATK_attribute[1] == iter_22_1.tag then
				var_22_0 = var_22_0 + 1
			end
		elseif var_22_1 == 4 and HeroCfg[arg_22_1].mechanism_type[1] == iter_22_1.tag then
			var_22_0 = var_22_0 + 1
		end
	end

	return var_22_0
end

function var_0_0.ConfirmEntrustList(arg_23_0)
	local var_23_0 = DormData:GetCurrectSceneID()
	local var_23_1 = {
		sceneID = var_23_0,
		pos = var_0_4.pos,
		heroList = var_0_3,
		timeLevel = var_0_4.timeLevel
	}

	CanteenAction:SendTaskDispatchInfo(var_23_1)
end

function var_0_0.CancelEntrust(arg_24_0, arg_24_1)
	local var_24_0 = DormData:GetCurrectSceneID()
	local var_24_1 = {
		sceneID = var_24_0,
		pos = arg_24_1
	}

	CanteenAction:SendTaskDispatchInfo(var_24_1)
end

function var_0_0.ConfirmEntrustListCallBack(arg_25_0, arg_25_1)
	if arg_25_1.hero_list ~= nil then
		for iter_25_0, iter_25_1 in ipairs(arg_25_1.hero_list) do
			table.insert(var_0_1[arg_25_1.pos].hero_list, iter_25_1)

			local var_25_0 = DormData:GetHeroTemplateInfo(iter_25_1)

			var_25_0:SetCurHeroID(iter_25_1)
			var_25_0:GoToCanteen()
		end

		var_0_1[arg_25_1.pos].start_time = manager.time:GetServerTime()
		var_0_1[arg_25_1.pos].timeLevel = CanteenTools:GetIndexByTaskDuring(var_0_1[arg_25_1.pos].id, arg_25_1.duration)
	else
		for iter_25_2, iter_25_3 in ipairs(var_0_1[arg_25_1.pos].hero_list) do
			local var_25_1 = DormData:GetHeroTemplateInfo(iter_25_3)

			var_25_1:SetCurHeroID(iter_25_3)
			var_25_1:BackToDorm()
		end

		var_0_1[arg_25_1.pos].hero_list = {}
		var_0_1[arg_25_1.pos].start_time = nil
		var_0_1[arg_25_1.pos].timeLevel = 0
	end

	manager.notify:Invoke(CANTEEN_DISPATCH_ENTRUST_SUCCESS, arg_25_1.pos)

	var_0_3 = {}
	var_0_4 = {}
end

function var_0_0.RefreshEntrustData(arg_26_0, arg_26_1)
	if var_0_1[arg_26_1].refresh_times >= DormConst.DISPATCH_REFRESH_TIME then
		return
	end

	local var_26_0 = DormData:GetCurrectSceneID()

	CanteenAction:RefreshEntrust(var_26_0, arg_26_1)
end

function var_0_0.EntrustFinish(arg_27_0, arg_27_1, arg_27_2)
	arg_27_0:CalEntrustAward(arg_27_1)

	if arg_27_2 then
		for iter_27_0, iter_27_1 in ipairs(arg_27_2) do
			arg_27_0:InitEntrustData(iter_27_1)
		end
	end

	manager.notify:Invoke(CANTEEN_DISPATCH_REWARD_VIEW)
	DormRedPointTools:ConsumeNotification(RedPointConst.CANTEEN_DISPATCH_FINISHED)
end

local var_0_5

function var_0_0.CalEntrustAward(arg_28_0, arg_28_1)
	var_0_5 = {}

	if arg_28_1 then
		for iter_28_0, iter_28_1 in ipairs(arg_28_1) do
			local var_28_0 = {
				id = iter_28_1.entrustID,
				award = iter_28_1.rewardList,
				extra_reward = iter_28_1.extra_reward
			}

			table.insert(var_0_5, var_28_0)
		end
	end
end

function var_0_0.GetEntrustFinishAwardList(arg_29_0)
	return var_0_5
end

function var_0_0.RefreshDailyZero(arg_30_0)
	if var_0_1 then
		for iter_30_0, iter_30_1 in pairs(var_0_1) do
			if iter_30_1.refresh_times then
				iter_30_1.refresh_times = 0
			end
		end
	end
end

function var_0_0.GetUiPosByEntrustPos(arg_31_0, arg_31_1)
	for iter_31_0, iter_31_1 in ipairs(GameDisplayCfg.canteen_task_id_pos.value) do
		if iter_31_1[2] == arg_31_1 then
			return iter_31_1[1]
		end
	end
end

function var_0_0.NoEntrustDispatched()
	for iter_32_0, iter_32_1 in pairs(var_0_1) do
		if var_0_0:IsEntrustStarted(iter_32_1) then
			return false
		end
	end

	return true
end

function var_0_0.AnyEntrustFinished()
	for iter_33_0, iter_33_1 in pairs(var_0_1) do
		if var_0_0:IsEntrustStarted(iter_33_1) and var_0_0:CalcEntrustLastTime(iter_33_1) == 0 then
			return true
		end
	end

	return false
end

function var_0_0.IsEntrustStarted(arg_34_0, arg_34_1)
	return arg_34_1.id ~= -1 and arg_34_1.start_time and arg_34_1.start_time > 0
end

function var_0_0.SetTaskTimeLevel(arg_35_0, arg_35_1, arg_35_2)
	if var_0_2 then
		var_0_2[arg_35_1] = arg_35_2
	end
end

function var_0_0.GetTaskTimeLevel(arg_36_0, arg_36_1)
	if var_0_2 then
		if var_0_2[arg_36_1] and tostring(var_0_2[arg_36_1]) ~= "userdata: NULL" then
			return tonumber(var_0_2[arg_36_1])
		else
			return 1
		end
	else
		return 1
	end
end

return var_0_0
