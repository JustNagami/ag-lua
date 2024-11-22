local var_0_0 = {
	GetTaskList = function(arg_1_0, arg_1_1, arg_1_2)
		local var_1_0 = {}

		for iter_1_0, iter_1_1 in pairs(arg_1_0) do
			if AssignmentCfg[iter_1_1.id] == nil then
				print("没有对应的任务ID:", iter_1_1.id)
			elseif AssignmentCfg[iter_1_1.id].type == arg_1_1 then
				if arg_1_2 then
					if AssignmentCfg[iter_1_1.id].phase == arg_1_2 then
						table.insert(var_1_0, iter_1_1.id)
					end
				else
					table.insert(var_1_0, iter_1_1.id)
				end
			end
		end

		table.sort(var_1_0)

		return var_1_0
	end,
	ActivityPtCanReceive = function(arg_2_0, arg_2_1)
		return ActivityPtCfg[arg_2_0].target[arg_2_1] <= ActivityPtData:GetCurrentActivityPt(arg_2_0)
	end,
	ActivityPtIsReceived = function(arg_3_0, arg_3_1)
		local var_3_0 = ActivityPtCfg[arg_3_0]

		if ActivityPtData:GetDailyGetRewardList()[arg_3_0][var_3_0.target[arg_3_1]] then
			return true
		end

		return false
	end,
	GetCanGetActivityTaskList = function(arg_4_0, arg_4_1)
		local var_4_0 = TaskData2:GetTaskIDListByActivity(arg_4_1)
		local var_4_1 = {}

		for iter_4_0, iter_4_1 in pairs(var_4_0) do
			if iter_4_0 then
				local var_4_2 = TaskData2:GetTask(iter_4_0)

				if var_4_2 then
					local var_4_3 = AssignmentCfg[iter_4_0]
					local var_4_4 = var_4_2.progress

					if not TaskData2:GetTaskComplete(iter_4_0) and var_4_4 >= var_4_3.need then
						table.insert(var_4_1, var_4_2)
					end
				end
			end
		end

		return var_4_1
	end,
	GetActivityTaskList = function(arg_5_0, arg_5_1)
		local var_5_0 = TaskData2:GetActivityTaskSortList(arg_5_1)
		local var_5_1 = {}

		for iter_5_0, iter_5_1 in pairs(var_5_0) do
			if iter_5_1 then
				var_5_1[iter_5_1.id] = iter_5_1
			end
		end

		return var_5_1
	end
}

function var_0_0.GetAllCanReciveTaskByActivityID(arg_6_0, arg_6_1, arg_6_2)
	if arg_6_1 then
		local var_6_0 = {}
		local var_6_1 = var_0_0:GetActivityTaskList(arg_6_1)

		for iter_6_0, iter_6_1 in pairs(var_6_1) do
			if iter_6_1 then
				local var_6_2 = TaskData2:GetTaskComplete(iter_6_0)

				if TaskData2:GetTaskProgress(iter_6_0) >= AssignmentCfg[iter_6_0].need and not var_6_2 then
					table.insert(var_6_0, iter_6_0)
				end
			end
		end

		if next(var_6_0) then
			TaskAction:SubmitTaskList(var_6_0)
		end

		if arg_6_2 then
			arg_6_2()
		end
	end
end

function var_0_0.GetFinishTaskIds(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = manager.time:GetServerTime()

	local function var_7_1(arg_8_0)
		local var_8_0 = AssignmentCfg[arg_8_0]
		local var_8_1 = TaskData2:GetTask(arg_8_0)

		if var_8_1.progress >= var_8_0.need and var_8_1.complete_flag == 0 and (var_8_1.expired_timestamp == 0 or var_8_1.expired_timestamp >= var_7_0) then
			return true
		end

		return false
	end

	return (arg_7_0:GetTaskListByPredict(arg_7_1, arg_7_2, var_7_1))
end

function var_0_0.GetTaskListByPredict(arg_9_0, arg_9_1, arg_9_2, arg_9_3)
	local var_9_0 = {}

	if arg_9_1 then
		local var_9_1 = TaskData2:GetTaskIDListByType(arg_9_1)

		if var_9_1 then
			for iter_9_0, iter_9_1 in pairs(var_9_1) do
				local var_9_2 = AssignmentCfg[iter_9_0]

				if var_9_2 == nil then
					print("没有对应的任务ID:", iter_9_0)

					break
				end

				local var_9_3

				if arg_9_2 then
					if var_9_2.phase == arg_9_2 then
						var_9_3 = iter_9_0
					end
				else
					var_9_3 = iter_9_0
				end

				if var_9_3 then
					if arg_9_3 then
						if arg_9_3(var_9_3) then
							table.insert(var_9_0, var_9_3)
						end
					else
						table.insert(var_9_0, var_9_3)
					end
				end
			end
		end
	end

	return var_9_0
end

function var_0_0.GetTaskCountByType(arg_10_0, arg_10_1)
	local var_10_0 = TaskData2:GetTypedTaskSortList(arg_10_1)
	local var_10_1 = 0

	for iter_10_0, iter_10_1 in pairs(var_10_0) do
		if iter_10_1 and TaskData2:GetTask(iter_10_1.id) then
			var_10_1 = var_10_1 + 1
		end
	end

	return var_10_1
end

function var_0_0.GetPlotPhaseID(arg_11_0)
	arg_11_0:GetTaskCountByType(TaskConst.TASK_TYPE.PLOT)

	local var_11_0 = TaskData2:GetTaskIDListByType(TaskConst.TASK_TYPE.PLOT)

	for iter_11_0, iter_11_1 in pairs(var_11_0) do
		if iter_11_0 and TaskData2:GetTask(iter_11_0) then
			local var_11_1 = AssignmentCfg[iter_11_0]

			if var_11_1.condition == GameSetting.task_top_type.value[1] and var_11_1.type == TaskConst.TASK_TYPE.PLOT and TaskData2:GetPlotPhase() <= var_11_1.phase then
				return iter_11_0
			end
		end
	end
end

function var_0_0.GetNewbiePhaseTask(arg_12_0)
	local var_12_0 = {}
	local var_12_1 = TaskData2:GetTaskIDListByType(TaskConst.TASK_TYPE.ALPHA)

	for iter_12_0, iter_12_1 in pairs(var_12_1) do
		local var_12_2 = TaskData2:GetTask(iter_12_0)

		if iter_12_0 and var_12_2 then
			local var_12_3 = AssignmentCfg[iter_12_0]

			if var_12_3.condition == TaskConst.STAGE_TASK_ID and var_12_3.additional_parameter[1] == TaskConst.TASK_TYPE.ALPHA then
				var_12_0[var_12_3.phase] = var_12_2
			end
		end
	end

	return var_12_0
end

function var_0_0.GetNoobPhaseTask(arg_13_0, arg_13_1)
	local var_13_0 = {}
	local var_13_1 = TaskData2:GetTaskIDListByType(arg_13_1)

	for iter_13_0, iter_13_1 in pairs(var_13_1) do
		local var_13_2 = TaskData2:GetTask(iter_13_0)

		if iter_13_1 and var_13_2 then
			local var_13_3 = AssignmentCfg[iter_13_0]

			var_13_0[var_13_3.phase] = var_13_0[var_13_3.phase] or {}
			var_13_0[var_13_3.phase][iter_13_0] = var_13_2
		end
	end

	return var_13_0
end

function var_0_0.GetNoobReadyList(arg_14_0, arg_14_1, arg_14_2)
	local var_14_0 = {}
	local var_14_1 = TaskTools:GetNoobTaskSortList(arg_14_1, arg_14_2)

	for iter_14_0, iter_14_1 in pairs(var_14_1) do
		local var_14_2 = AssignmentCfg[iter_14_1.id]

		if ActivityNoobData:GetUnlockPhase() >= var_14_2.phase and iter_14_1.progress >= var_14_2.need and iter_14_1.complete_flag < 1 then
			table.insert(var_14_0, iter_14_1.id)
		end
	end

	return var_14_0
end

function var_0_0.GetNoobCompletedList(arg_15_0, arg_15_1)
	local var_15_0 = {}
	local var_15_1 = TaskData2:GetTaskIDListByType(arg_15_1)

	for iter_15_0, iter_15_1 in pairs(var_15_1) do
		local var_15_2 = TaskData2:GetTask(iter_15_0)

		if iter_15_1 and var_15_2 then
			local var_15_3 = AssignmentCfg[iter_15_0]

			if var_15_2.complete_flag >= 1 then
				var_15_0[var_15_3.phase] = (var_15_0[var_15_3.phase] or 0) + 1
			end
		end
	end

	return var_15_0
end

function var_0_0.IsCompletedAllNoobAdvanceTask(arg_16_0, arg_16_1)
	local var_16_0 = TaskData2:GetTaskIDListByType(arg_16_1)

	for iter_16_0, iter_16_1 in pairs(var_16_0) do
		local var_16_1 = TaskData2:GetTask(iter_16_0)

		if iter_16_1 and var_16_1 and (AssignmentCfg[iter_16_0].need > var_16_1.progress or var_16_1.complete_flag == 0) then
			return false
		end
	end

	return true
end

function var_0_0.GetNewbieDailyTaskFinishCnt(arg_17_0)
	local var_17_0 = TaskData2:GetTaskIDListByType(TaskConst.TASK_TYPE.DAILY_OFFER)
	local var_17_1 = 0

	for iter_17_0, iter_17_1 in pairs(var_17_0) do
		local var_17_2 = TaskData2:GetTask(iter_17_0)

		if iter_17_1 and var_17_2 and var_17_2.complete_flag == 1 then
			local var_17_3 = AssignmentCfg[iter_17_0]

			var_17_1 = var_17_1 + 1
		end
	end

	return var_17_1
end

function var_0_0.GetTaskIDList(arg_18_0, arg_18_1)
	local var_18_0 = TaskData2:GetTaskIDListByType(arg_18_1)
	local var_18_1 = {}

	for iter_18_0, iter_18_1 in pairs(var_18_0) do
		if iter_18_1 and TaskData2:GetTask(iter_18_0) then
			table.insert(var_18_1, iter_18_0)
		end
	end

	return var_18_1
end

function var_0_0.GetNoobAdvanceTaskSortList(arg_19_0, arg_19_1, arg_19_2)
	return TaskData2:GetSortedPhaseTaskList(arg_19_1, arg_19_2)
end

function var_0_0.GetNoobTaskSortList(arg_20_0, arg_20_1, arg_20_2)
	return TaskData2:GetSortedPhaseTaskList(arg_20_1, arg_20_2)
end

function var_0_0.GetNewbieTaskSortList(arg_21_0, arg_21_1)
	return TaskData2:GetSortedPhaseTaskList(TaskConst.TASK_TYPE.ALPHA, arg_21_1)
end

function var_0_0.GetIdolTraineeTaskSortList(arg_22_0)
	local var_22_0 = TaskData2:GetTaskIDListByType(TaskConst.TASK_TYPE.IDOL_TRAINEE_DAILY)
	local var_22_1 = TaskData2:GetTaskIDListByType(TaskConst.TASK_TYPE.IDOL_TRAINEE_WEEKLY)
	local var_22_2 = {}

	for iter_22_0, iter_22_1 in pairs(var_22_0) do
		table.insert(var_22_2, iter_22_0)
	end

	for iter_22_2, iter_22_3 in pairs(var_22_1) do
		table.insert(var_22_2, iter_22_2)
	end

	table.sort(var_22_2, function(arg_23_0, arg_23_1)
		local var_23_0 = TaskData2:GetTaskComplete(arg_23_0)
		local var_23_1 = TaskData2:GetTaskComplete(arg_23_1)
		local var_23_2 = TaskData2:GetTaskProgress(arg_23_0) >= AssignmentCfg[arg_23_0].need
		local var_23_3 = TaskData2:GetTaskProgress(arg_23_1) >= AssignmentCfg[arg_23_1].need

		if var_23_0 ~= var_23_1 then
			return var_23_1
		end

		if var_23_2 ~= var_23_3 then
			return var_23_2
		end

		return arg_23_0 < arg_23_1
	end)

	return var_22_2
end

function var_0_0.ShowActivityTaskPop(arg_24_0, arg_24_1)
	JumpTools.OpenPageByJump("commonTaskPop", {
		activityId = arg_24_1
	})
end

function var_0_0.ShowTypeTaskPop(arg_25_0, arg_25_1)
	JumpTools.OpenPageByJump("commonTaskPop", {
		taskType = arg_25_1
	})
end

return var_0_0
