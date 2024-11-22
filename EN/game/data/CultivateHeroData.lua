local var_0_0 = singletonClass("CultivateHeroData")

function var_0_0.Init(arg_1_0)
	arg_1_0.dailyTaskStatus_ = {}
	arg_1_0.heroTaskInfoList_ = {}
	arg_1_0.accumulateTaskInfoList_ = {}
	arg_1_0.accumulateTaskAllReceivedList_ = {}
end

function var_0_0.SetData(arg_2_0, arg_2_1)
	local var_2_0 = arg_2_1.activity_id

	arg_2_0.heroTaskInfoList_[var_2_0] = {}
	arg_2_0.accumulateTaskInfoList_[var_2_0] = {}

	for iter_2_0, iter_2_1 in ipairs(arg_2_1.task_info_list) do
		arg_2_0.heroTaskInfoList_[var_2_0][iter_2_1.id] = {
			progress = iter_2_1.progress
		}

		if CultivateHeroTaskCfg[iter_2_1.id].condition <= iter_2_1.progress then
			arg_2_0.heroTaskInfoList_[var_2_0][iter_2_1.id].isCompleted = true
		end
	end

	for iter_2_2, iter_2_3 in ipairs(arg_2_1.got_reward_task_id_list) do
		arg_2_0.heroTaskInfoList_[var_2_0][iter_2_3] = arg_2_0.heroTaskInfoList_[var_2_0][iter_2_3] or {}
		arg_2_0.heroTaskInfoList_[var_2_0][iter_2_3].isCompleted = true
		arg_2_0.heroTaskInfoList_[var_2_0][iter_2_3].isReceived = true
	end

	if arg_2_1.daily_pt_task_got_flag == true then
		arg_2_0.dailyTaskStatus_[var_2_0] = true
	else
		arg_2_0.dailyTaskStatus_[var_2_0] = nil
	end

	for iter_2_4, iter_2_5 in ipairs(arg_2_1.got_point_id_list) do
		arg_2_0.accumulateTaskInfoList_[var_2_0][iter_2_5] = {
			isReceived = true
		}
	end

	arg_2_0.accumulateTaskAllReceivedList_[var_2_0] = nil

	arg_2_0:RefreshDailyRedPoint(var_2_0)
	arg_2_0:RefreshAccumulateRedPoint(var_2_0)
	arg_2_0:RefreshHeroTaskRedPoint(var_2_0)
	arg_2_0:RefreshSelectRedPoint(var_2_0)
end

function var_0_0.UpdateDailyTask(arg_3_0, arg_3_1)
	local var_3_0 = arg_3_1.activity_id

	if arg_3_1.daily_pt_task_got_flag == true then
		arg_3_0.dailyTaskStatus_[var_3_0] = true
	else
		arg_3_0.dailyTaskStatus_[var_3_0] = nil
	end

	arg_3_0:RefreshDailyRedPoint(var_3_0)
end

function var_0_0.UpdateHeroTask(arg_4_0, arg_4_1)
	local var_4_0 = {}

	for iter_4_0, iter_4_1 in ipairs(arg_4_1.task_info_list) do
		local var_4_1 = CultivateHeroTaskCfg[iter_4_1.id].activity_id

		var_4_0[var_4_1] = true
		arg_4_0.heroTaskInfoList_[var_4_1][iter_4_1.id] = {
			progress = iter_4_1.progress
		}

		if CultivateHeroTaskCfg[iter_4_1.id].condition <= iter_4_1.progress then
			arg_4_0.heroTaskInfoList_[var_4_1][iter_4_1.id].isCompleted = true
		end
	end

	for iter_4_2, iter_4_3 in pairs(var_4_0) do
		arg_4_0:RefreshHeroTaskRedPoint(iter_4_2)
	end
end

function var_0_0.GetSortHeroTaskList(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = CultivateHeroTaskCfg.get_id_list_by_group_id[arg_5_1]
	local var_5_1 = {}
	local var_5_2 = {}
	local var_5_3 = {}
	local var_5_4 = {}

	for iter_5_0, iter_5_1 in pairs(var_5_0) do
		if arg_5_0.heroTaskInfoList_[arg_5_2][iter_5_1].isReceived == true then
			table.insert(var_5_4, iter_5_1)
		elseif arg_5_0.heroTaskInfoList_[arg_5_2][iter_5_1].isCompleted == true then
			table.insert(var_5_2, iter_5_1)
		else
			table.insert(var_5_3, iter_5_1)
		end
	end

	local var_5_5 = handler(arg_5_0, arg_5_0.Compare)

	table.sort(var_5_2, var_5_5)
	table.sort(var_5_3, var_5_5)
	table.sort(var_5_4, var_5_5)
	table.insertto(var_5_1, var_5_2)
	table.insertto(var_5_1, var_5_3)
	table.insertto(var_5_1, var_5_4)

	local var_5_6 = #var_5_2 > 0

	return var_5_1, var_5_6
end

function var_0_0.Compare(arg_6_0, arg_6_1, arg_6_2)
	return CultivateHeroTaskCfg[arg_6_1].id < CultivateHeroTaskCfg[arg_6_2].id
end

function var_0_0.GetDailyTaskStatus(arg_7_0)
	return arg_7_0.dailyTaskStatus_
end

function var_0_0.GetCompletedTaskList(arg_8_0)
	return arg_8_0.completedTaskList_ or {}
end

function var_0_0.GetReceivedTaskList(arg_9_0)
	return arg_9_0.receivedTaskList_ or {}
end

function var_0_0.GetHeroTaskInfoList(arg_10_0, arg_10_1)
	if arg_10_1 ~= nil then
		return arg_10_0.heroTaskInfoList_[arg_10_1] or {}
	end

	return arg_10_0.heroTaskInfoList_
end

function var_0_0.GetAccumulateTaskInfoList(arg_11_0, arg_11_1)
	if arg_11_1 ~= nil then
		return arg_11_0.accumulateTaskInfoList_[arg_11_1] or {}
	end

	return arg_11_0.accumulateTaskInfoList_
end

function var_0_0.SetReceivedHeroTaskList(arg_12_0, arg_12_1, arg_12_2)
	for iter_12_0, iter_12_1 in ipairs(arg_12_1) do
		arg_12_0.heroTaskInfoList_[arg_12_2][iter_12_1].isReceived = true
	end

	arg_12_0:RefreshAccumulateRedPoint(arg_12_2)
	arg_12_0:RefreshHeroTaskRedPoint(arg_12_2)
end

function var_0_0.SetReceivedAccumulateTask(arg_13_0, arg_13_1, arg_13_2)
	arg_13_0.accumulateTaskInfoList_[arg_13_2][arg_13_1] = arg_13_0.accumulateTaskInfoList_[arg_13_2][arg_13_1] or {}
	arg_13_0.accumulateTaskInfoList_[arg_13_2][arg_13_1].isReceived = true

	arg_13_0:RefreshAccumulateRedPoint(arg_13_2)
end

function var_0_0.SetReceivedDailyTask(arg_14_0, arg_14_1)
	arg_14_0.dailyTaskStatus_[arg_14_1] = true

	arg_14_0:RefreshDailyRedPoint(arg_14_1)
	arg_14_0:RefreshAccumulateRedPoint(arg_14_1)
end

function var_0_0.GetSelectHeroID(arg_15_0, arg_15_1)
	return getData(string.format("CultivateHero_%d", arg_15_1), "selectHeroID")
end

function var_0_0.SetSelectHeroID(arg_16_0, arg_16_1, arg_16_2)
	saveData(string.format("CultivateHero_%d", arg_16_1), "selectHeroID", arg_16_2)
	manager.redPoint:setTip(string.format("%s_%s_Select", RedPointConst.CULTIVATE_HERO, arg_16_1), 0)
end

function var_0_0.RefreshSelectRedPoint(arg_17_0, arg_17_1)
	local var_17_0 = arg_17_0:GetSelectHeroID(arg_17_1) == nil and 1 or 0

	manager.redPoint:setTip(string.format("%s_%s_Select", RedPointConst.CULTIVATE_HERO, arg_17_1), var_17_0)
end

function var_0_0.RefreshDailyRedPoint(arg_18_0, arg_18_1)
	if arg_18_0:IsAllReceived(arg_18_1) == true then
		return
	end

	local var_18_0 = 100
	local var_18_1 = ActivityPtData:GetCurrentActivityPt(ActivityPtConst.TASK_DAILY_ACTIVITY_PT)
	local var_18_2 = CultivateHeroData:GetDailyTaskStatus()[arg_18_1]
	local var_18_3 = 0

	if var_18_0 <= var_18_1 and var_18_2 ~= true then
		var_18_3 = 1
	end

	manager.redPoint:setTip(string.format("%s_%s_Daily_Reward", RedPointConst.CULTIVATE_HERO, arg_18_1), var_18_3)
end

function var_0_0.RefreshAccumulateRedPoint(arg_19_0, arg_19_1)
	if arg_19_0:IsAllReceived(arg_19_1) == true then
		return
	end

	local var_19_0 = ItemTools.getItemNum(ActivityCultivateHeroCfg[arg_19_1].coin_id)
	local var_19_1 = ActivityPointRewardCfg.get_id_list_by_activity_id[arg_19_1]
	local var_19_2 = 0

	for iter_19_0, iter_19_1 in ipairs(var_19_1) do
		local var_19_3 = ActivityPointRewardCfg[iter_19_1]
		local var_19_4 = arg_19_0.accumulateTaskInfoList_[arg_19_1][iter_19_1] and arg_19_0.accumulateTaskInfoList_[arg_19_1][iter_19_1].isReceived

		if var_19_0 >= var_19_3.need and var_19_4 ~= true then
			var_19_2 = 1

			break
		end
	end

	manager.redPoint:setTip(string.format("%s_%s_Accumulate_Reward", RedPointConst.CULTIVATE_HERO, arg_19_1), var_19_2)
end

function var_0_0.RefreshHeroTaskRedPoint(arg_20_0, arg_20_1)
	if arg_20_0:IsAllReceived(arg_20_1) == true then
		return
	end

	local var_20_0 = ActivityCultivateHeroCfg[arg_20_1].group

	for iter_20_0, iter_20_1 in ipairs(var_20_0) do
		local var_20_1 = CultivateHeroTaskCfg.get_id_list_by_group_id[iter_20_1]
		local var_20_2 = 0

		for iter_20_2, iter_20_3 in ipairs(var_20_1) do
			local var_20_3 = arg_20_0.heroTaskInfoList_[arg_20_1][iter_20_3].isCompleted
			local var_20_4 = arg_20_0.heroTaskInfoList_[arg_20_1][iter_20_3].isReceived

			if var_20_3 == true and not var_20_4 then
				var_20_2 = 1

				break
			end
		end

		manager.redPoint:setTip(string.format("%s_%s_%s_Task_Reward", RedPointConst.CULTIVATE_HERO, arg_20_1, iter_20_1), var_20_2)
	end
end

function var_0_0.IsAllReceived(arg_21_0, arg_21_1)
	if arg_21_0.accumulateTaskAllReceivedList_[arg_21_1] == true or arg_21_0.accumulateTaskInfoList_[arg_21_1] == nil then
		return true
	end

	local var_21_0 = ActivityPointRewardCfg.get_id_list_by_activity_id[arg_21_1]
	local var_21_1 = true

	for iter_21_0, iter_21_1 in ipairs(var_21_0) do
		if not (arg_21_0.accumulateTaskInfoList_[arg_21_1][iter_21_1] and arg_21_0.accumulateTaskInfoList_[arg_21_1][iter_21_1].isReceived) then
			var_21_1 = false

			break
		end
	end

	arg_21_0.accumulateTaskAllReceivedList_[arg_21_1] = var_21_1

	if var_21_1 == true then
		manager.redPoint:setTip(string.format("%s_%s_Daily_Reward", RedPointConst.CULTIVATE_HERO, arg_21_1), 0)
		manager.redPoint:setTip(string.format("%s_%s_Accumulate_Reward", RedPointConst.CULTIVATE_HERO, arg_21_1), 0)

		local var_21_2 = ActivityCultivateHeroCfg[arg_21_1].group

		for iter_21_2, iter_21_3 in ipairs(var_21_2) do
			manager.redPoint:setTip(string.format("%s_%s_%s_Task_Reward", RedPointConst.CULTIVATE_HERO, arg_21_1, iter_21_3), 0)
		end
	end

	return var_21_1
end

return var_0_0
