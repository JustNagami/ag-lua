local var_0_0 = singletonClass("GodEaterData")

function var_0_0.Init(arg_1_0)
	arg_1_0.activityID = 0
	arg_1_0.rewardTime = 0
	arg_1_0.rewardNum = 0
	arg_1_0.hubLv = 0
	arg_1_0.nowExp = 0
	arg_1_0.totalExp = 0
	arg_1_0.init = false
	arg_1_0.initRed = false
	arg_1_0.stageData_ = {}
	arg_1_0.curHeroID_ = 0
	arg_1_0.heroGiftGetIDList_ = {}
end

function var_0_0.InitData(arg_2_0, arg_2_1)
	return
end

function var_0_0.UpdateData(arg_3_0, arg_3_1)
	arg_3_0.init = true
	arg_3_0.rewardTime = arg_3_1.start_time or 0
	arg_3_0.activityID = arg_3_1.activity_id or 0

	arg_3_0:UpdateHudLevel()
	arg_3_0:UpdateRedPoint(arg_3_0.activityID)
end

function var_0_0.UpdateHudLevel(arg_4_0)
	local var_4_0 = ItemTools.getItemNum(CurrencyConst.ACTIVITY_GOD_EATER_HUB_EXP)

	arg_4_0.hubLv = GodEaterTool.HubExpToLevel(var_4_0)
	arg_4_0.totalExp = var_4_0

	arg_4_0:UpdateRedPoint(arg_4_0.activityID)
	WeekBossAction.UpdateRedPoint()
end

function var_0_0.UpdateRedPoint(arg_5_0, arg_5_1)
	local var_5_0 = ActivityCfg.get_id_list_by_sub_activity_list[arg_5_1] and ActivityCfg.get_id_list_by_sub_activity_list[arg_5_1][1] or 0
	local var_5_1 = TaskTools:GetTaskIDList(TaskConst.TASK_TYPE.ACTIVITY_GOD_EATER_1)
	local var_5_2 = TaskTools:GetFinishTaskIDList(var_5_1)
	local var_5_3 = TaskTools:GetTaskIDList(TaskConst.TASK_TYPE.ACTIVITY_GOD_EATER_3)
	local var_5_4 = TaskTools:GetFinishTaskIDList(var_5_3)
	local var_5_5 = TaskTools:GetCanGetActivityTaskList(ActivityConst.ACTIVITY_GODEATER_MAIN_KEY)

	if not arg_5_0.initRed then
		local var_5_6 = ActivityTools.GetRedPointKey(var_5_0) .. var_5_0
		local var_5_7 = ActivityTools.GetRedPointKey(arg_5_1) .. arg_5_1

		manager.redPoint:addGroup(RedPointConst.ACTIVITY_GODEATER_HUB_REWARD_ALL, {
			RedPointConst.ACTIVITY_GODEATER_HUB_REWARD,
			RedPointConst.ACTIVITY_GODEATER_HUB_FULL_REWARD
		})

		local var_5_8 = {
			RedPointConst.ACTIVITY_GODEATER_HUB_REWARD_ALL,
			RedPointConst.ACTIVITY_GODEATER_TASK_REWARD_1,
			RedPointConst.ACTIVITY_GODEATER_TASK_REWARD_2
		}
		local var_5_9 = ActivityCfg[var_5_0].sub_activity_list or {}

		for iter_5_0, iter_5_1 in ipairs(var_5_9) do
			local var_5_10 = ActivityTools.GetRedPointKey(var_5_0) .. iter_5_1

			table.insert(var_5_8, var_5_10)
		end

		manager.redPoint:addGroup(var_5_7, var_5_8)
		manager.redPoint:addGroup(var_5_6, {
			var_5_7
		})
	end

	if #var_5_2 > 0 or #var_5_4 > 0 then
		manager.redPoint:setTip(RedPointConst.ACTIVITY_GODEATER_TASK_REWARD_1, 1)
	else
		manager.redPoint:setTip(RedPointConst.ACTIVITY_GODEATER_TASK_REWARD_1, 0)
	end

	if #var_5_5 > 0 then
		manager.redPoint:setTip(RedPointConst.ACTIVITY_GODEATER_TASK_REWARD_2, 1)
	else
		manager.redPoint:setTip(RedPointConst.ACTIVITY_GODEATER_TASK_REWARD_2, 0)
	end

	arg_5_0.initRed = true
end

function var_0_0.InitGoldMinerData(arg_6_0, arg_6_1)
	arg_6_0.curHeroID_ = arg_6_1.data.role

	for iter_6_0, iter_6_1 in ipairs(arg_6_1.data.info) do
		arg_6_0.stageData_[iter_6_1.stage_id] = iter_6_1.star
	end
end

function var_0_0.GetStageStar(arg_7_0, arg_7_1)
	if arg_7_0.stageData_[arg_7_1] then
		return arg_7_0.stageData_[arg_7_1]
	else
		return 0
	end
end

function var_0_0.SetStageStar(arg_8_0, arg_8_1, arg_8_2)
	arg_8_0.stageData_[arg_8_1] = arg_8_0.stageData_[arg_8_1] and math.max(arg_8_0.stageData_[arg_8_1], arg_8_2) or arg_8_2
end

function var_0_0.SetGoldActivityId(arg_9_0, arg_9_1)
	arg_9_0.goldStageActivityId_ = arg_9_1
end

function var_0_0.GetGoldActivityId(arg_10_0)
	return arg_10_0.goldStageActivityId_
end

function var_0_0.SetCurHeroID(arg_11_0, arg_11_1)
	arg_11_0.curHeroID_ = arg_11_1
end

function var_0_0.GetCurHeroID(arg_12_0)
	return arg_12_0.curHeroID_
end

function var_0_0.SetHeroGiftData(arg_13_0, arg_13_1)
	if arg_13_1.activity_id == ActivityConst.ACTIVITY_GODEATER_HERO_GIFT then
		arg_13_0.heroGiftGetIDList_ = {}

		for iter_13_0, iter_13_1 in ipairs(arg_13_1.id_list) do
			table.insert(arg_13_0.heroGiftGetIDList_, iter_13_1)
		end
	end
end

function var_0_0.GetHeroGiftIsGet(arg_14_0, arg_14_1)
	return table.indexof(arg_14_0.heroGiftGetIDList_, arg_14_1)
end

function var_0_0.SetHeroGiftIsGet(arg_15_0, arg_15_1)
	table.insert(arg_15_0.heroGiftGetIDList_, arg_15_1)
end

return var_0_0
