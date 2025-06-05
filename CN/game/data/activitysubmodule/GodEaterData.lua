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

	trace("LHL%o", var_5_5)

	local var_5_6 = {}

	for iter_5_0, iter_5_1 in ipairs(var_5_5) do
		if AssignmentCfg[iter_5_1.id].type == 3002 then
			table.insert(var_5_6, iter_5_1)
		end
	end

	if not arg_5_0.initRed then
		local var_5_7 = ActivityTools.GetRedPointKey(var_5_0) .. var_5_0
		local var_5_8 = ActivityTools.GetRedPointKey(arg_5_1) .. arg_5_1

		manager.redPoint:addGroup(RedPointConst.ACTIVITY_GODEATER_HUB_REWARD_ALL, {
			RedPointConst.ACTIVITY_GODEATER_HUB_REWARD,
			RedPointConst.ACTIVITY_GODEATER_HUB_FULL_REWARD
		})

		local var_5_9 = {
			RedPointConst.ACTIVITY_GODEATER_HUB_REWARD_ALL,
			RedPointConst.ACTIVITY_GODEATER_TASK_REWARD_1,
			RedPointConst.ACTIVITY_GODEATER_TASK_REWARD_2,
			RedPointConst.ACTIVITY_GODEATER_HERO_GIFT
		}
		local var_5_10 = ActivityCfg[var_5_0].sub_activity_list or {}

		for iter_5_2, iter_5_3 in ipairs(var_5_10) do
			local var_5_11 = ActivityTools.GetRedPointKey(var_5_0) .. iter_5_3

			table.insert(var_5_9, var_5_11)
		end

		manager.redPoint:addGroup(var_5_8, var_5_9)
		manager.redPoint:addGroup(var_5_7, {
			var_5_8
		})

		local var_5_12 = RedPointConst.ACTIVITY_GODEATER_TASK_REWARD_ALL

		manager.redPoint:addGroup(var_5_12, {
			RedPointConst.ACTIVITY_GODEATER_TASK_REWARD_1,
			RedPointConst.ACTIVITY_GODEATER_TASK_REWARD_2
		})
	end

	local var_5_13 = {}
	local var_5_14 = {}

	for iter_5_4, iter_5_5 in ipairs(var_5_2) do
		if AssignmentCfg[iter_5_5].phase <= arg_5_0.hubLv then
			table.insert(var_5_13, iter_5_5)
		end
	end

	for iter_5_6, iter_5_7 in ipairs(var_5_4) do
		if AssignmentCfg[iter_5_7].phase <= arg_5_0.hubLv then
			table.insert(var_5_14, iter_5_7)
		end
	end

	if #var_5_13 > 0 or #var_5_14 > 0 then
		manager.redPoint:setTip(RedPointConst.ACTIVITY_GODEATER_TASK_REWARD_1, 1)
	else
		manager.redPoint:setTip(RedPointConst.ACTIVITY_GODEATER_TASK_REWARD_1, 0)
	end

	if #var_5_6 > 0 then
		manager.redPoint:setTip(RedPointConst.ACTIVITY_GODEATER_TASK_REWARD_2, 1)
	else
		manager.redPoint:setTip(RedPointConst.ACTIVITY_GODEATER_TASK_REWARD_2, 0)
	end

	if #TaskTools:GetCanGetActivityTaskList(ActivityConst.ACTIVITY_CIVILIZATION) > 0 then
		manager.redPoint:setTip(RedPointConst.ACTIVITY_CODEATER_CIVILIZATION, 1)
	else
		manager.redPoint:setTip(RedPointConst.ACTIVITY_CODEATER_CIVILIZATION, 0)
	end

	local var_5_15 = ActivityPointRewardCfg.get_id_list_by_activity_id[ActivityConst.ACTIVITY_GODEATER_HERO_GIFT][1]

	if ActivityData:GetActivityIsOpen(ActivityConst.ACTIVITY_GODEATER_HERO_GIFT) and not GodEaterData:GetHeroGiftIsGet(var_5_15) then
		manager.redPoint:setTip(RedPointConst.ACTIVITY_GODEATER_HERO_GIFT, 1)
	else
		manager.redPoint:setTip(RedPointConst.ACTIVITY_GODEATER_HERO_GIFT, 0)
	end

	arg_5_0.initRed = true
end

function var_0_0.InitGoldMinerData(arg_6_0, arg_6_1)
	manager.redPoint:appendGroup(ActivityTools.GetRedPointKey(340001) .. 340001, RedPointConst.ACTIVITY_GODEATER_GOLD_MINER_STAGE)

	arg_6_0.curHeroID_ = arg_6_1.data.role

	for iter_6_0, iter_6_1 in ipairs(arg_6_1.data.info) do
		print(iter_6_1.stage_id)

		arg_6_0.stageData_[iter_6_1.stage_id] = iter_6_1.star
	end

	arg_6_0:CheckGoldMinerStage()
end

function var_0_0.CheckGoldMinerStage(arg_7_0)
	local var_7_0 = false

	for iter_7_0, iter_7_1 in ipairs(ActivityGodEaterGoldminerStageCfg.all) do
		if iter_7_0 == 1 and arg_7_0:GetStageStar(iter_7_1) <= 0 then
			var_7_0 = true
		else
			local var_7_1 = ActivityGodEaterGoldminerStageCfg.all[iter_7_0 - 1]

			if ActivityData:GetActivityIsOpen(iter_7_1) and arg_7_0:GetStageStar(var_7_1) > 0 and arg_7_0:GetStageStar(iter_7_1) <= 0 then
				var_7_0 = true
			end
		end
	end

	manager.redPoint:setTip(RedPointConst.ACTIVITY_GODEATER_GOLD_MINER_STAGE, var_7_0 and 1 or 0)
end

function var_0_0.GetStageStar(arg_8_0, arg_8_1)
	if arg_8_0.stageData_[arg_8_1] then
		return arg_8_0.stageData_[arg_8_1]
	else
		return 0
	end
end

function var_0_0.SetStageStar(arg_9_0, arg_9_1, arg_9_2)
	arg_9_0.stageData_[arg_9_1] = arg_9_0.stageData_[arg_9_1] and math.max(arg_9_0.stageData_[arg_9_1], arg_9_2) or arg_9_2

	arg_9_0:CheckGoldMinerStage()
end

function var_0_0.SetGoldActivityId(arg_10_0, arg_10_1)
	arg_10_0.goldStageActivityId_ = arg_10_1
end

function var_0_0.GetGoldActivityId(arg_11_0)
	return arg_11_0.goldStageActivityId_
end

function var_0_0.SetCurHeroID(arg_12_0, arg_12_1)
	arg_12_0.curHeroID_ = arg_12_1
end

function var_0_0.GetCurHeroID(arg_13_0)
	return arg_13_0.curHeroID_
end

function var_0_0.SetHeroGiftData(arg_14_0, arg_14_1)
	if arg_14_1.activity_id == ActivityConst.ACTIVITY_GODEATER_HERO_GIFT then
		arg_14_0.heroGiftGetIDList_ = {}

		for iter_14_0, iter_14_1 in ipairs(arg_14_1.id_list) do
			table.insert(arg_14_0.heroGiftGetIDList_, iter_14_1)
		end
	end
end

function var_0_0.GetHeroGiftIsGet(arg_15_0, arg_15_1)
	return table.indexof(arg_15_0.heroGiftGetIDList_, arg_15_1)
end

function var_0_0.SetHeroGiftIsGet(arg_16_0, arg_16_1)
	table.insert(arg_16_0.heroGiftGetIDList_, arg_16_1)
end

return var_0_0
