return {
	InitRedUpdater = function(arg_1_0)
		if not arg_1_0.redUpdater then
			arg_1_0.redUpdater = {
				[TaskConst.TASK_TYPE.ALPHA] = handler(arg_1_0, arg_1_0.UpdateNewbieTaskRedPoint),
				[TaskConst.TASK_TYPE.DAILY_OFFER] = handler(arg_1_0, arg_1_0.UpdateNewbieDailyTaskRedTip),
				[TaskConst.TASK_TYPE.NOOB] = handler(arg_1_0, arg_1_0.UpdateNoobTaskRedPoint),
				[TaskConst.TASK_TYPE.NOOB_ADVANCE] = handler(arg_1_0, arg_1_0.UpdateNoobAdvanceTaskRedPoint),
				[TaskConst.TASK_TYPE.NOOB_3_0] = handler(arg_1_0, arg_1_0.UpdateNoobTaskRedPoint),
				[TaskConst.TASK_TYPE.NOOB_ADVANCE_3_0_1] = handler(arg_1_0, arg_1_0.UpdateNoobAdvanceTaskRedPoint),
				[TaskConst.TASK_TYPE.NOOB_ADVANCE_3_0_2] = handler(arg_1_0, arg_1_0.UpdateNoobAdvanceTaskRedPoint),
				[TaskConst.TASK_TYPE.NOOB_ADVANCE_3_0_3] = handler(arg_1_0, arg_1_0.UpdateNoobAdvanceTaskRedPoint),
				[TaskConst.TASK_TYPE.DAILY] = handler(arg_1_0, arg_1_0.UpdateDailyTaskRedTip),
				[TaskConst.TASK_TYPE.PLOT] = handler(arg_1_0, arg_1_0.UpdatePlotTaskRedTip),
				[TaskConst.TASK_TYPE.CLUB_TASK] = handler(arg_1_0, arg_1_0.UpdateClubTaskRedTip),
				[TaskConst.TASK_TYPE.WEEK] = handler(arg_1_0, arg_1_0.UpdateWeekTaskRedTip),
				[TaskConst.TASK_TYPE.CHAPTER_PLOT_19] = handler(arg_1_0, arg_1_0.UpdateChapterPlot19RedTip),
				[TaskConst.TASK_TYPE.IDOL_TRAINEE_DAILY] = handler(arg_1_0, arg_1_0.UpdateIdolTraineeDayAndWeekRedTip),
				[TaskConst.TASK_TYPE.IDOL_TRAINEE_WEEKLY] = handler(arg_1_0, arg_1_0.UpdateIdolTraineeDayAndWeekRedTip),
				[TaskConst.TASK_TYPE.IDOL_TRAINEE_CHAPTER] = handler(arg_1_0, arg_1_0.UpdateIdolTraineeChapterRedTip)
			}
		end
	end,
	StartUpdateRedPointPhase = function(arg_2_0, arg_2_1)
		arg_2_0:InitRedUpdater()

		local var_2_0 = {}
		local var_2_1 = {}

		for iter_2_0, iter_2_1 in ipairs(arg_2_1) do
			local var_2_2 = AssignmentCfg[iter_2_1.id]

			if var_2_2 == nil then
				Debug.LogError("TaskCfg没有对应ID:" .. iter_2_1.id)
			elseif var_2_2.activity_id and var_2_2.activity_id ~= 0 then
				var_2_1[var_2_2.activity_id] = var_2_1[var_2_2.activity_id] or {}

				table.insert(var_2_1[var_2_2.activity_id], iter_2_1.id)
			else
				var_2_0[var_2_2.type] = var_2_0[var_2_2.type] or {}

				table.insert(var_2_0[var_2_2.type], iter_2_1.id)
			end
		end

		for iter_2_2, iter_2_3 in pairs(var_2_0) do
			local var_2_3 = arg_2_0.redUpdater[iter_2_2]

			if var_2_3 then
				var_2_3(iter_2_3)
			end
		end

		arg_2_0:UpdateActivityRed(var_2_1)
		arg_2_0:UpdatePassportTaskRedTip()
	end,
	UpdateActivityRed = function(arg_3_0, arg_3_1)
		for iter_3_0, iter_3_1 in pairs(arg_3_1) do
			local var_3_0 = TaskData2:GetActivityTaskSortList(iter_3_0)
			local var_3_1 = string.format("%s_%s", RedPointConst.ACTIVITY_TASK, iter_3_0)
			local var_3_2 = 0

			for iter_3_2, iter_3_3 in pairs(var_3_0) do
				if iter_3_3.progress >= AssignmentCfg[iter_3_3.id].need and iter_3_3.complete_flag < 1 then
					var_3_2 = 1

					break
				end
			end

			manager.redPoint:setTip(var_3_1, var_3_2)
		end
	end,
	UpdatePassportTaskRedTip = function(arg_4_0)
		if not (PassportData:IsOpen() and PassportData:IsUnlock()) then
			manager.redPoint:setTip(RedPointConst.PASSPORT_TASK_BONUS_7, 0)
			manager.redPoint:setTip(RedPointConst.PASSPORT_TASK_BONUS_8, 0)
			manager.redPoint:setTip(RedPointConst.PASSPORT_TASK_BONUS_9, 0)
		else
			local var_4_0 = PassportData:GetExpWeekly() >= GameSetting.battlepass_exp_limit_weekly.value[1]
			local var_4_1 = BattlePassCfg.get_id_list_by_type[BattlePassListCfg[PassportData:GetId()].battlepass_type]
			local var_4_2 = PassportData:GetLevel() >= #var_4_1
			local var_4_3 = {
				TaskConst.TASK_TYPE.PASSPORT_DAILY,
				TaskConst.TASK_TYPE.PASSPORT_WEEKLY
			}
			local var_4_4 = manager.time:GetServerTime()

			for iter_4_0, iter_4_1 in ipairs(var_4_3) do
				local var_4_5 = 0
				local var_4_6 = TaskTools:GetFinishTaskIds(iter_4_1)

				for iter_4_2, iter_4_3 in ipairs(var_4_6) do
					local var_4_7 = TaskData2:GetTask(iter_4_3).expired_timestamp or 0

					if var_4_7 > 0 and var_4_7 - var_4_4 > 0 or var_4_7 == 0 then
						var_4_5 = var_4_5 + 1
					end
				end

				local var_4_8 = var_4_5 > 0 and not var_4_0 and not var_4_2 and 1 or 0

				manager.redPoint:setTip(RedPointConst["PASSPORT_TASK_BONUS_" .. iter_4_1], var_4_8)
			end

			local var_4_9 = {
				TaskConst.TASK_TYPE.PASSPORT_CHALLENGE
			}

			for iter_4_4, iter_4_5 in ipairs(var_4_9) do
				local var_4_10 = 0
				local var_4_11 = TaskTools:GetFinishTaskIds(iter_4_5)

				for iter_4_6, iter_4_7 in ipairs(var_4_11) do
					local var_4_12 = TaskData2:GetTask(iter_4_7).expired_timestamp or 0

					if var_4_12 > 0 and var_4_12 - var_4_4 > 0 or var_4_12 == 0 then
						var_4_10 = var_4_10 + 1
					end
				end

				manager.redPoint:setTip(RedPointConst["PASSPORT_TASK_BONUS_" .. iter_4_5], var_4_10 > 0 and not var_4_2 and 1 or 0)
			end
		end
	end,
	UpdateWeekTaskRedTip = function(arg_5_0)
		if JumpTools.IsSystemLocked(ViewConst.SYSTEM_ID.TASK_WEEK) then
			manager.redPoint:setTip(RedPointConst.TASK_WEEK, 0)

			return false
		end

		local var_5_0 = TaskData2:GetTaskIDListByType(TaskConst.TASK_TYPE.WEEK)

		for iter_5_0, iter_5_1 in pairs(var_5_0) do
			local var_5_1 = TaskData2:GetTask(iter_5_0)

			if var_5_1.progress >= AssignmentCfg[var_5_1.id].need and var_5_1.complete_flag < 1 then
				manager.redPoint:setTip(RedPointConst.TASK_WEEK, 1)

				return true
			end
		end

		local var_5_2 = ActivityPtCfg[ActivityPtConst.TASK_WEEK_ACTIVITY_PT]

		for iter_5_2 = 1, #var_5_2.target do
			if var_5_2.target[iter_5_2] <= ActivityPtData:GetCurrentActivityPt(ActivityPtConst.TASK_WEEK_ACTIVITY_PT) and not ActivityPtData:GetDailyGetRewardList()[ActivityPtConst.TASK_WEEK_ACTIVITY_PT][var_5_2.target[iter_5_2]] then
				manager.redPoint:setTip(RedPointConst.TASK_WEEK, 1)

				return true
			end
		end

		manager.redPoint:setTip(RedPointConst.TASK_WEEK, 0)

		return false
	end,
	UpdateClubTaskRedTip = function(arg_6_0)
		local var_6_0 = GuildData:GetGuildInfo()

		if JumpTools.IsSystemLocked(ViewConst.SYSTEM_ID.CLUB_TASK) or var_6_0 == nil or var_6_0.id == nil then
			manager.redPoint:setTip(RedPointConst.CLUB_TASK, 0)

			return false
		end

		local var_6_1 = TaskData2:GetTaskIDListByType(TaskConst.TASK_TYPE.CLUB_TASK)

		for iter_6_0, iter_6_1 in pairs(var_6_1) do
			local var_6_2 = TaskData2:GetTask(iter_6_0)

			if var_6_2.progress >= AssignmentCfg[var_6_2.id].need and var_6_2.complete_flag < 1 then
				manager.redPoint:setTip(RedPointConst.CLUB_TASK, 1)

				return true
			end
		end

		manager.redPoint:setTip(RedPointConst.CLUB_TASK, 0)

		return false
	end,
	UpdatePlotTaskRedTip = function(arg_7_0)
		if JumpTools.IsSystemLocked(ViewConst.SYSTEM_ID.TASK_PLOT) then
			manager.redPoint:setTip(RedPointConst.TASK_PLOT, 0)

			return false
		end

		local var_7_0 = TaskData2:GetTaskIDListByType(TaskConst.TASK_TYPE.PLOT)

		for iter_7_0, iter_7_1 in pairs(var_7_0) do
			local var_7_1 = TaskData2:GetTask(iter_7_0)

			if var_7_1.progress >= AssignmentCfg[var_7_1.id].need and var_7_1.complete_flag < 1 then
				manager.redPoint:setTip(RedPointConst.TASK_PLOT, 1)

				return true
			end
		end

		manager.redPoint:setTip(RedPointConst.TASK_PLOT, 0)

		return false
	end,
	UpdateDailyTaskRedTip = function(arg_8_0)
		if JumpTools.IsSystemLocked(ViewConst.SYSTEM_ID.TASK_DAILY) then
			manager.redPoint:setTip(RedPointConst.TASK_DAILY, 0)

			return false
		end

		local var_8_0 = TaskData2:GetTaskIDListByType(TaskConst.TASK_TYPE.DAILY)

		for iter_8_0, iter_8_1 in pairs(var_8_0) do
			local var_8_1 = TaskData2:GetTask(iter_8_0)

			if var_8_1 and var_8_1.progress >= AssignmentCfg[var_8_1.id].need and var_8_1.complete_flag < 1 then
				manager.redPoint:setTip(RedPointConst.TASK_DAILY, 1)

				return true
			end
		end

		local var_8_2 = ActivityPtCfg[ActivityPtConst.TASK_DAILY_ACTIVITY_PT]

		for iter_8_2 = 1, #var_8_2.target do
			if var_8_2.target[iter_8_2] <= ActivityPtData:GetCurrentActivityPt(ActivityPtConst.TASK_DAILY_ACTIVITY_PT) and not ActivityPtData:GetDailyGetRewardList()[ActivityPtConst.TASK_DAILY_ACTIVITY_PT][var_8_2.target[iter_8_2]] then
				manager.redPoint:setTip(RedPointConst.TASK_DAILY, 1)

				return true
			end
		end

		manager.redPoint:setTip(RedPointConst.TASK_DAILY, 0)

		return false
	end,
	UpdateNewbieTaskRedPoint = function(arg_9_0)
		local var_9_0 = TaskData2:GetAssignmentPhase()
		local var_9_1 = TaskTools:GetNewbieTaskSortList(var_9_0)

		for iter_9_0, iter_9_1 in pairs(var_9_1) do
			if iter_9_1.progress >= AssignmentCfg[iter_9_1.id].need and iter_9_1.complete_flag < 1 then
				manager.redPoint:setTip(RedPointConst.NEWBIE_TASK, 1)

				return
			end
		end

		local var_9_2 = TaskTools:GetNewbiePhaseTask()[var_9_0]

		if var_9_2 then
			local var_9_3 = AssignmentCfg[var_9_2.id]

			if var_9_3 and var_9_2.progress >= var_9_3.need and var_9_2.complete_flag < 1 then
				manager.redPoint:setTip(RedPointConst.NEWBIE_TASK, 1)

				return
			end
		end

		manager.redPoint:setTip(RedPointConst.NEWBIE_TASK, 0)
	end,
	UpdateNewbieDailyTaskRedTip = function(arg_10_0)
		local var_10_0 = TaskData2:GetTypedTaskSortList(TaskConst.TASK_TYPE.DAILY_OFFER)

		for iter_10_0, iter_10_1 in pairs(var_10_0) do
			if iter_10_1.progress >= AssignmentCfg[iter_10_1.id].need and iter_10_1.complete_flag < 1 then
				manager.redPoint:setTip(RedPointConst.NEWBIE_DAILY_TASK, 1)

				return
			end
		end

		manager.redPoint:setTip(RedPointConst.NEWBIE_DAILY_TASK, 0)
	end,
	UpdateNoobTaskRedPoint = function(arg_11_0, arg_11_1)
		local var_11_0
		local var_11_1 = {}

		for iter_11_0, iter_11_1 in ipairs(arg_11_1) do
			local var_11_2 = AssignmentCfg[iter_11_1]

			if var_11_2 == nil then
				print("TaskCfg没有对应ID:" .. iter_11_1)
			else
				var_11_0 = var_11_2.type
				var_11_1[var_11_2.phase] = true
			end
		end

		for iter_11_2, iter_11_3 in pairs(var_11_1) do
			arg_11_0:UpdateNoobTaskRed(var_11_0, iter_11_2)
		end
	end,
	UpdateNoobTaskRed = function(arg_12_0, arg_12_1, arg_12_2)
		local var_12_0 = ActivityNoobData:GetUnlockPhase()
		local var_12_1 = TaskTools:GetNoobTaskSortList(arg_12_1, arg_12_2)

		for iter_12_0, iter_12_1 in pairs(var_12_1) do
			if var_12_0 >= AssignmentCfg[iter_12_1.id].phase and iter_12_1.progress >= AssignmentCfg[iter_12_1.id].need and iter_12_1.complete_flag < 1 then
				manager.redPoint:setTip(string.format("%s_%d", RedPointConst.NEWBIE_TASK, arg_12_2), 1)

				return
			end
		end

		manager.redPoint:setTip(string.format("%s_%d", RedPointConst.NEWBIE_TASK, arg_12_2), 0)
	end,
	UpdateNoobTaskRedFull = function(arg_13_0, arg_13_1)
		local var_13_0 = ActivityNoobData:GetUnlockPhase()

		for iter_13_0 = 1, var_13_0 do
			arg_13_0:UpdateNoobTaskRed(arg_13_1, iter_13_0)
		end
	end,
	UpdateNoobAdvanceTaskRedPoint = function(arg_14_0, arg_14_1)
		local var_14_0 = {}

		for iter_14_0, iter_14_1 in ipairs(arg_14_1) do
			local var_14_1 = AssignmentCfg[iter_14_1]

			if var_14_1 == nil then
				print("TaskCfg没有对应ID:" .. iter_14_1)
			else
				var_14_0[var_14_1.type] = var_14_0[var_14_1.type] or {}
				var_14_0[var_14_1.type][var_14_1.phase] = true
			end
		end

		for iter_14_2, iter_14_3 in pairs(var_14_0) do
			if ActivityNewbieTools.IsDataInited() and ActivityNewbieTools.CheckAdvanceTaskTypeOpen(iter_14_2) then
				for iter_14_4, iter_14_5 in pairs(iter_14_3) do
					arg_14_0:UpdateNoobAdvanceTaskRed(iter_14_2, iter_14_4)
				end
			end
		end
	end,
	UpdateNoobAdvanceTaskRed = function(arg_15_0, arg_15_1, arg_15_2)
		local var_15_0 = ActivityNewbieTools.GetAdvanceTaskCfg(arg_15_1)
		local var_15_1 = NoobVersionCfg[var_15_0.versionID].noob_advance_task_phase[var_15_0.index]
		local var_15_2 = NoobAdvanceTaskPhaseListCfg[var_15_1].phase_list

		for iter_15_0, iter_15_1 in ipairs(var_15_2) do
			for iter_15_2, iter_15_3 in ipairs(iter_15_1[2]) do
				if iter_15_3[1] == arg_15_2 then
					local var_15_3 = iter_15_0
					local var_15_4 = TaskTools:GetNoobAdvanceTaskSortList(arg_15_1, arg_15_2)

					for iter_15_4, iter_15_5 in pairs(var_15_4) do
						if AssignmentCfg[iter_15_5.id].need <= iter_15_5.progress and iter_15_5.complete_flag == 0 then
							manager.redPoint:setTip(string.format("%s_%d_%d_%d", RedPointConst.NOOB_ADVANCE, arg_15_1, var_15_3, arg_15_2), 1)

							return
						end
					end

					manager.redPoint:setTip(string.format("%s_%d_%d_%d", RedPointConst.NOOB_ADVANCE, arg_15_1, var_15_3, arg_15_2), 0)

					return
				end
			end
		end
	end,
	UpdateChapterPlot19RedTip = function(arg_16_0)
		return
	end,
	UpdateIdolTraineeDayAndWeekRedTip = function(arg_17_0)
		for iter_17_0, iter_17_1 in ipairs(AssignmentCfg.get_id_list_by_type[TaskConst.TASK_TYPE.IDOL_TRAINEE_DAILY] or {}) do
			local var_17_0 = TaskData2:GetTaskProgress(iter_17_1)

			if not TaskData2:GetTaskComplete(iter_17_1) and var_17_0 >= AssignmentCfg[iter_17_1].need then
				manager.redPoint:setTip(RedPointConst.IDOL_TRAINEE_DAY_AND_WEEK_TASK, 1)

				return
			end
		end

		for iter_17_2, iter_17_3 in ipairs(AssignmentCfg.get_id_list_by_type[TaskConst.TASK_TYPE.IDOL_TRAINEE_WEEKLY] or {}) do
			local var_17_1 = TaskData2:GetTaskProgress(iter_17_3)

			if not TaskData2:GetTaskComplete(iter_17_3) and var_17_1 >= AssignmentCfg[iter_17_3].need then
				manager.redPoint:setTip(RedPointConst.IDOL_TRAINEE_DAY_AND_WEEK_TASK, 1)

				return
			end
		end

		manager.redPoint:setTip(RedPointConst.IDOL_TRAINEE_DAY_AND_WEEK_TASK, 0)
	end,
	UpdateIdolTraineeChapterRedTip = function(arg_18_0)
		local var_18_0 = false

		for iter_18_0, iter_18_1 in ipairs(IdolTraineeChapterCfg.all) do
			local var_18_1 = false
			local var_18_2 = IdolTraineeChapterCfg[iter_18_1].section_id_list

			for iter_18_2, iter_18_3 in ipairs(var_18_2) do
				if var_18_1 then
					break
				end

				local var_18_3 = IdolTraineePveBattleCfg[iter_18_3].taskIDList

				for iter_18_4, iter_18_5 in ipairs(var_18_3) do
					if var_18_1 then
						break
					end

					local var_18_4 = TaskData2:GetTaskProgress(iter_18_5)

					if not TaskData2:GetTaskComplete(iter_18_5) and var_18_4 >= AssignmentCfg[iter_18_5].need then
						manager.redPoint:setTip(string.format("%s_%s", RedPointConst.IDOL_TRAINEE_CHAPTER_TASK, iter_18_1), 1)

						var_18_1 = true
					end
				end
			end

			if not var_18_1 then
				manager.redPoint:setTip(string.format("%s_%s", RedPointConst.IDOL_TRAINEE_CHAPTER_TASK, iter_18_1), 0)
			end
		end
	end
}
