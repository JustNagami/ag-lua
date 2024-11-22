local var_0_0 = singletonClass("BlisterGameData")

function var_0_0.Init(arg_1_0)
	arg_1_0.activityID = 0
	arg_1_0.drawNum = 0
	arg_1_0.taskList = {}
	arg_1_0.pointList = {}
	arg_1_0.pointData = {}
	arg_1_0.touchList = {}
	arg_1_0.selectIndex = 0
	arg_1_0.pointIndex = 0
end

function var_0_0.InitData(arg_2_0, arg_2_1)
	arg_2_0.activityID = arg_2_1.activity_id
	arg_2_0.pointList = arg_2_1.finish_list or {}

	for iter_2_0, iter_2_1 in ipairs(arg_2_0.pointList) do
		arg_2_0.pointData[iter_2_1.stage_id] = iter_2_1
	end

	arg_2_0:InitRedPoint()
	arg_2_0:UpdateRedPoint(arg_2_0.activityID)
end

function var_0_0.RefreshTaskData(arg_3_0, arg_3_1)
	var_0_0:UpdateRedPoint(arg_3_0.activityID)
end

function var_0_0.UpdatePointData(arg_4_0, arg_4_1)
	local var_4_0 = arg_4_1 and arg_4_1.star or 0
	local var_4_1 = arg_4_1 and arg_4_1.value or 0
	local var_4_2 = arg_4_0.pointData[arg_4_1.stage_id] and arg_4_0.pointData[arg_4_1.stage_id].star or 0
	local var_4_3 = arg_4_0.pointData[arg_4_1.stage_id] and arg_4_0.pointData[arg_4_1.stage_id].value or 0

	if var_4_2 < var_4_0 or var_4_3 < var_4_1 then
		arg_4_0.pointData[arg_4_1.stage_id] = arg_4_1
	end

	arg_4_0:UpdateRedPoint(arg_4_0.acitvityID)
end

function var_0_0.GetShowPointList(arg_5_0, arg_5_1)
	local var_5_0 = ActivityBubbleCfg.get_id_list_by_activity_id[arg_5_1]
	local var_5_1 = {}

	for iter_5_0, iter_5_1 in ipairs(var_5_0 or {}) do
		local var_5_2 = arg_5_0.pointData[iter_5_1]
		local var_5_3 = {
			id = iter_5_1,
			isPass = var_5_2,
			star = var_5_2 and var_5_2.star or 0
		}

		table.insert(var_5_1, var_5_3)
	end

	table.sort(var_5_1, function(arg_6_0, arg_6_1)
		return arg_6_0.id < arg_6_1.id
	end)

	return var_5_1
end

function var_0_0.InitRedPoint(arg_7_0)
	local var_7_0 = BlisterGameTool.GetSubActiveID(arg_7_0.activityID)
	local var_7_1 = {}

	for iter_7_0, iter_7_1 in ipairs(var_7_0 or {}) do
		local var_7_2 = {}
		local var_7_3 = ActivityBubbleCfg.get_id_list_by_activity_id[iter_7_1] or {}

		for iter_7_2, iter_7_3 in ipairs(var_7_3) do
			local var_7_4 = string.format("%s_%s", RedPointConst.BLISTER_GAME_PLAY, iter_7_3)

			table.insert(var_7_2, var_7_4)
		end

		local var_7_5 = string.format("%s_%s", RedPointConst.BLISTER_GAME, iter_7_1)

		manager.redPoint:addGroup(var_7_5, var_7_2)
		table.insert(var_7_1, var_7_5)
	end

	local var_7_6 = ActivityCfg.get_id_list_by_sub_activity_list[arg_7_0.activityID] and ActivityCfg.get_id_list_by_sub_activity_list[arg_7_0.activityID][1]

	if var_7_6 then
		local var_7_7 = ActivityTools.GetRedPointKey(var_7_6) .. var_7_6

		manager.redPoint:addGroup(var_7_7, var_7_1)
	end

	local var_7_8 = {}
	local var_7_9 = BlisterGameTool.GetSubActiveID(ActivityConst.ACTIVITY_3_4_BLISTER_TASK)

	for iter_7_4, iter_7_5 in ipairs(var_7_9 or {}) do
		local var_7_10 = string.format("%s_%s", RedPointConst.ACTIVITY_TASK, iter_7_5)

		table.insert(var_7_8, var_7_10)
	end

	local var_7_11 = string.format("%s_%s", RedPointConst.ACTIVITY_TASK, ActivityConst.ACTIVITY_3_4_BLISTER_TASK)

	manager.redPoint:addGroup(var_7_11, var_7_8)
end

function var_0_0.UpdateRedPoint(arg_8_0, arg_8_1)
	local var_8_0 = BlisterGameTool.GetSubActiveID(arg_8_1)

	for iter_8_0, iter_8_1 in ipairs(var_8_0 or {}) do
		local var_8_1 = 0
		local var_8_2 = ActivityBubbleCfg.get_id_list_by_activity_id[iter_8_1] or {}
		local var_8_3 = ActivityData:GetActivityIsOpen(iter_8_1)

		for iter_8_2, iter_8_3 in ipairs(var_8_2) do
			local var_8_4 = not BlisterGameTool.GetSessionIsLockByID(ActivityBubbleCfg[iter_8_3].session)

			if arg_8_0:GetStageIdIsOpen(iter_8_3) and var_8_3 and not arg_8_0:GetStageInfo(iter_8_3) and var_8_4 then
				manager.redPoint:setTip(string.format("%s_%s", RedPointConst.BLISTER_GAME_PLAY, iter_8_3), 1)
			else
				manager.redPoint:setTip(string.format("%s_%s", RedPointConst.BLISTER_GAME_PLAY, iter_8_3), 0)
			end
		end
	end
end

function var_0_0.GetStarByScore(arg_9_0, arg_9_1, arg_9_2)
	local var_9_0 = ActivityBubbleCfg[arg_9_1]
	local var_9_1 = 0

	if var_9_0 then
		for iter_9_0, iter_9_1 in ipairs(var_9_0.score_level) do
			if iter_9_1 <= arg_9_2 then
				var_9_1 = iter_9_0
			end
		end
	end

	return var_9_1
end

function var_0_0.GetStageInfo(arg_10_0, arg_10_1)
	return arg_10_0.pointData[arg_10_1]
end

function var_0_0.SavePassId(arg_11_0, arg_11_1)
	var_0_0.passId = arg_11_1
end

function var_0_0.GetStageIdIsOpen(arg_12_0, arg_12_1)
	local var_12_0 = ActivityBubbleCfg[arg_12_1].pre

	if var_12_0 and ActivityBubbleCfg[var_12_0] then
		return (arg_12_0:GetStageInfo(var_12_0))
	end

	return true
end

function var_0_0.SaveSetlectIndx(arg_13_0, arg_13_1, arg_13_2)
	arg_13_0.selectIndex = arg_13_1
end

function var_0_0.SavePointIndx(arg_14_0, arg_14_1)
	arg_14_0.pointIndex = arg_14_1
end

return var_0_0
