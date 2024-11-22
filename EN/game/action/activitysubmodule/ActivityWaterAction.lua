local var_0_0 = {}

function var_0_0.Init(arg_1_0)
	var_0_0.activityId_ = arg_1_0

	manager.redPoint:addGroup(string.format("%s%s", ActivityTools.GetRedPointKey(arg_1_0), arg_1_0), {
		RedPointConst.ACTIVITY_WATER_OPENED,
		RedPointConst.ACTIVITY_WATER_ASSIGNMENT,
		RedPointConst.ACTIVITY_WATER_SELF_ASSISTANT,
		RedPointConst.ACTIVITY_WATER_TOTAL_ASSISTANT,
		RedPointConst.ACTIVITY_WATER_WIN_REWARD,
		RedPointConst.ACTIVITY_WATER_NEW_SCHEDULE,
		RedPointConst.ACTIVITY_WATER_MULTIPLE_OPEN
	})
	manager.redPoint:addGroup(RedPointConst.ACTIVITY_WATER_ENTER_GROUP, {
		RedPointConst.ACTIVITY_WATER_SELF_ASSISTANT,
		RedPointConst.ACTIVITY_WATER_TOTAL_ASSISTANT,
		RedPointConst.ACTIVITY_WATER_NEW_SCHEDULE,
		RedPointConst.ACTIVITY_WATER_MULTIPLE_OPEN
	})
	var_0_0.UpdateRedPoint()
	var_0_0.StartTimer()
	manager.notify:RegistListener(OSIRIS_TASK_UPDATE, function()
		var_0_0.UpdateAssignmentRedPoint()
	end)
end

function var_0_0.StartTimer()
	if var_0_0.timer_ == nil then
		var_0_0.timer_ = Timer.New(function()
			return
		end, 1, -1)
	end

	var_0_0.timer_:Start()
end

function var_0_0.StopTimer()
	if var_0_0.timer_ then
		var_0_0.timer_:Stop()

		var_0_0.timer_ = nil
	end
end

function var_0_0.ReadActivityOpen()
	local var_6_0 = ActivityData:GetActivityData(var_0_0.activityId_)

	saveData("activity_water_" .. var_0_0.activityId_, tostring(var_6_0.startTime), true)
	var_0_0.UpdateOpenRedPoint()
end

function var_0_0.UpdateRedPoint()
	var_0_0.UpdateOpenRedPoint()
	var_0_0.UpdateAssignmentRedPoint()
	var_0_0.UpdateSelfContributeRedPoint()
	var_0_0.UpdateTotalContributeRedPoint()
	var_0_0.UpdateWinRedPoint()
	var_0_0.UpdateNewScheduleRedPoint()
end

function var_0_0.UpdateOpenRedPoint()
	if not var_0_0.activityId_ then
		return
	end

	if not ActivityData:GetActivityIsOpen(var_0_0.activityId_) then
		return
	end

	local var_8_0 = ActivityData:GetActivityData(var_0_0.activityId_)
	local var_8_1 = false

	if var_8_0 and not getData("activity_water_" .. var_0_0.activityId_, tostring(var_8_0.startTime)) then
		var_8_1 = true
	end

	manager.redPoint:setTip(RedPointConst.ACTIVITY_WATER_OPENED, var_8_1 and 1 or 0)
end

function var_0_0.UpdateAssignmentRedPoint()
	local var_9_0 = false
	local var_9_1 = var_0_0.GetTaskActivityId()
	local var_9_2 = AssignmentCfg.get_id_list_by_activity_id[var_9_1]

	for iter_9_0, iter_9_1 in ipairs(var_9_2) do
		local var_9_3 = AssignmentCfg[iter_9_1]

		if TaskData2:GetTask(iter_9_1) then
			local var_9_4 = TaskData2:GetTask(iter_9_1).progress

			if var_9_4 > var_9_3.need then
				var_9_4 = var_9_3.need
			end

			if TaskData2:GetTaskComplete(iter_9_1) then
				-- block empty
			elseif var_9_4 >= var_9_3.need then
				var_9_0 = true

				break
			end
		end
	end

	manager.redPoint:setTip(RedPointConst.ACTIVITY_WATER_ASSIGNMENT, var_9_0 and 1 or 0)
end

function var_0_0.UpdateSelfContributeRedPoint()
	local var_10_0 = false
	local var_10_1, var_10_2 = ActivityWaterData:GetCurrentContributeCfg(var_0_0.activityId_)

	if not var_10_2 and ActivityWaterData:GetCurrentSelfProgress(var_0_0.activityId_) >= ActivityPointRewardCfg[var_10_1].need then
		var_10_0 = true
	end

	manager.redPoint:setTip(RedPointConst.ACTIVITY_WATER_SELF_ASSISTANT, var_10_0 and 1 or 0)
end

function var_0_0.UpdateTotalContributeRedPoint()
	local var_11_0 = false
	local var_11_1 = ActivityWaterData:GetCurrentAssistantRole(var_0_0.activityId_)

	if var_11_1 > 0 then
		local var_11_2 = ActivityWaterCompetitionCfg[var_11_1]

		if var_11_2 then
			local var_11_3 = var_11_2.process_reward
			local var_11_4 = ActivityWaterData:GetCurrentAssistantRoleProcess(var_0_0.activityId_)

			for iter_11_0, iter_11_1 in ipairs(var_11_3) do
				if not ActivityWaterData:HaveGetTotalProgressReward(var_0_0.activityId_, iter_11_1[1]) and var_11_4 >= iter_11_1[1] then
					var_11_0 = true
				end
			end
		end
	end

	manager.redPoint:setTip(RedPointConst.ACTIVITY_WATER_TOTAL_ASSISTANT, var_11_0 and 1 or 0)
end

function var_0_0.UpdateWinRedPoint()
	local var_12_0 = false
	local var_12_1 = ActivityWaterData:GetHistoryList(var_0_0.activityId_)

	for iter_12_0, iter_12_1 in ipairs(var_12_1) do
		if iter_12_1.is_success > 0 and not ActivityWaterData:HaveGotHistoryReward(iter_12_1.schedule_id) then
			var_12_0 = true
		end
	end

	manager.redPoint:setTip(RedPointConst.ACTIVITY_WATER_WIN_REWARD, var_12_0 and 1 or 0)
end

function var_0_0.UpdateNewScheduleRedPoint()
	if not var_0_0.activityId_ then
		return
	end

	if not ActivityData:GetActivityIsOpen(var_0_0.activityId_) then
		return
	end

	local var_13_0 = false
	local var_13_1 = ActivityWaterData:GetHistoryList(var_0_0.activityId_)
	local var_13_2 = ActivityWaterData:IsFirstEnter(var_0_0.activityId_)
	local var_13_3 = #var_13_1 > 0 and var_13_2

	if var_13_3 then
		CustomLog.Log(debug.traceback(string.format("needRedPoint = true")))
	end

	manager.redPoint:setTip(RedPointConst.ACTIVITY_WATER_NEW_SCHEDULE, var_13_3 and 1 or 0)
end

manager.net:Bind(68011, function(arg_14_0)
	ActivityWaterData:InitFromServerData(arg_14_0)

	if ActivityWaterData:HaveSelectAssistantRole(arg_14_0.activity_id) then
		local var_14_0 = ActivityWaterData:GetCurrentSchedule(arg_14_0.activity_id).schedule_id
		local var_14_1 = ActivityWaterCfg[var_14_0].activity_id
		local var_14_2 = ActivityCfg.get_id_list_by_sub_activity_list[var_14_1][1]
		local var_14_3, var_14_4 = ActivityWaterData:GetCanUseTrialList(var_14_2)

		BattleTeamData:SetHeroTrial(var_14_1, var_14_4)
		CooperationTools.RegisterInvitationValidation(var_14_1, function(arg_15_0, arg_15_1)
			local var_15_0 = ActivityWaterData:GetCurrentAssistantRole(var_14_2)

			if var_15_0 == 0 then
				return false
			end

			if #arg_15_1 > 0 and var_15_0 == arg_15_1[1].data then
				return true
			end

			return false
		end)
	end

	var_0_0.UpdateRedPoint()
end)
manager.net:Bind(68023, function(arg_16_0)
	ActivityWaterData:OnChallengeSuccess(arg_16_0.main_activity_id, arg_16_0.settle_player_list)
end)
manager.net:Bind(65041, function(arg_17_0)
	ActivityWaterData:OnVoteUpdate(arg_17_0)
end)
manager.net:Bind(68025, function(arg_18_0)
	manager.notify:CallUpdateFunc(XH3RD_WATER_RESULT, arg_18_0.main_activity_id)
end)
manager.net:Bind(68027, function(arg_19_0)
	ActivityWaterData:OnStageRefresh(arg_19_0.activity_id, arg_19_0.open_stage_id, arg_19_0.open_online_stage_id)
end)

function var_0_0.RequestCurrentSchedule(arg_20_0)
	local var_20_0 = {
		schedule_id = arg_20_0
	}

	manager.net:SendWithLoadingNew(68012, var_20_0, 68013, var_0_0.OnRequestCurrentScheduleCallback)
end

function var_0_0.OnRequestCurrentScheduleCallback(arg_21_0, arg_21_1)
	if isSuccess(arg_21_0.result) then
		local var_21_0 = ActivityWaterCfg[arg_21_1.schedule_id].activity_id
		local var_21_1 = ActivityCfg.get_id_list_by_sub_activity_list[var_21_0][1]

		ActivityWaterData:OnClickEnd(var_21_1)
		var_0_0.UpdateNewScheduleRedPoint()
	else
		ShowTips(GetTips(arg_21_0.result))
	end
end

function var_0_0.SelectAssistantRole(arg_22_0, arg_22_1)
	local var_22_0 = {
		schedule_id = arg_22_0,
		competition_id = arg_22_1
	}

	manager.net:SendWithLoadingNew(68014, var_22_0, 68015, var_0_0.OnSelectAssistantRoleCallback)
end

function var_0_0.OnSelectAssistantRoleCallback(arg_23_0, arg_23_1)
	if isSuccess(arg_23_0.result) then
		ActivityWaterData:OnSelectAssistantRole(arg_23_1.schedule_id, arg_23_1.competition_id)

		local var_23_0 = ActivityWaterCfg[arg_23_1.schedule_id].activity_id
		local var_23_1 = ActivityCfg.get_id_list_by_sub_activity_list[var_23_0][1]
		local var_23_2, var_23_3 = ActivityWaterData:GetCanUseTrialList(var_23_1)

		BattleTeamData:SetHeroTrial(var_23_0, var_23_3)
	else
		ShowTips(GetTips(arg_23_0.result))
	end
end

local var_0_1

function var_0_0.GetSelfAssistantReward(arg_24_0, arg_24_1, arg_24_2)
	var_0_1 = arg_24_2

	local var_24_0 = {
		activity_id = arg_24_0,
		reward_id_list = arg_24_1
	}

	manager.net:SendWithLoadingNew(68016, var_24_0, 68017, var_0_0.OnGetSelfAssistantRewardCallback)
end

function var_0_0.OnGetSelfAssistantRewardCallback(arg_25_0, arg_25_1)
	if isSuccess(arg_25_0.result) then
		ActivityWaterData:OnGetSelfAssistantReward(arg_25_1.activity_id, arg_25_1.reward_id_list)
		getReward2(arg_25_0.reward_list)
		var_0_0.UpdateSelfContributeRedPoint()
	else
		ShowTips(GetTips(arg_25_0.result))
	end

	var_0_1 = nil
end

function var_0_0.GetTotalAssistantReward(arg_26_0, arg_26_1, arg_26_2, arg_26_3)
	var_0_1 = arg_26_3

	local var_26_0 = {
		schedule_id = arg_26_0,
		competition_id = arg_26_1,
		reward_id_list = arg_26_2
	}

	manager.net:SendWithLoadingNew(68018, var_26_0, 68019, var_0_0.OnGetTotalAssistantRewardCallback)
end

function var_0_0.OnGetTotalAssistantRewardCallback(arg_27_0, arg_27_1)
	if isSuccess(arg_27_0.result) then
		ActivityWaterData:OnGetTotalAssistantReward(arg_27_1.schedule_id, arg_27_1.competition_id, arg_27_1.reward_id_list)
		getReward2(arg_27_0.reward_list)
		var_0_0.UpdateTotalContributeRedPoint()
	else
		ShowTips(GetTips(arg_27_0.result))
	end

	var_0_1 = nil
end

function var_0_0.GetWinReward(arg_28_0)
	local var_28_0 = {
		schedule_id = arg_28_0
	}

	manager.net:SendWithLoadingNew(68020, var_28_0, 68021, var_0_0.OnCallback)
end

function var_0_0.OnCallback(arg_29_0, arg_29_1)
	if isSuccess(arg_29_0.result) then
		ActivityWaterData:OnGetWinReward(arg_29_1.schedule_id)
		getReward2(arg_29_0.reward_list)
		var_0_0.UpdateWinRedPoint()
	else
		ShowTips(GetTips(arg_29_0.result))
	end
end

function var_0_0.GetTaskActivityId()
	local var_30_0

	for iter_30_0, iter_30_1 in ipairs(ActivityCfg[var_0_0.activityId_].sub_activity_list) do
		if ActivityCfg[iter_30_1].activity_template == ActivityTemplateConst.TASK then
			var_30_0 = iter_30_1

			break
		end
	end

	return var_30_0
end

return var_0_0
