SPHeroChallengeActivityTemplate = class("SPHeroChallengeActivityTemplate")

function SPHeroChallengeActivityTemplate.Ctor(arg_1_0, arg_1_1)
	arg_1_0.activityID = arg_1_1.activity_id
	arg_1_0.entrustTime = arg_1_1.entrust_refresh_times or 0
	arg_1_0.entrustFreeTime = math.min(arg_1_0.entrustTime, SPHeroChallengeData.activityCfg[arg_1_0.activityID].freeRefreshEntrustTime)
	arg_1_0.getAwardFlag = arg_1_1.is_got_schedule_reward or false

	arg_1_0:InitCurScheduleList(arg_1_1.save_schedule_list, true)
	arg_1_0:InitCurEntrustList(arg_1_1.begin_entrust_list)
	arg_1_0:InitWaiteEntrustList(arg_1_1.entrust_id_list)
	arg_1_0:InitFinStoryList(arg_1_1.passed_chapter_level_list)
	arg_1_0:InitTrainInfo(arg_1_1.train_list)
end

function SPHeroChallengeActivityTemplate.InitTrainInfo(arg_2_0, arg_2_1)
	arg_2_0.trainInfo = {}

	if arg_2_1 then
		for iter_2_0, iter_2_1 in ipairs(arg_2_1) do
			local var_2_0 = SPHeroChallengeAction:ParseTrainInfo(iter_2_1)

			arg_2_0.trainInfo[var_2_0.type] = var_2_0
		end
	end

	for iter_2_2 = SpHeroChallengeConst.BattleSubType.train1, SpHeroChallengeConst.BattleSubType.train3 do
		if not arg_2_0.trainInfo[iter_2_2] then
			arg_2_0.trainInfo[iter_2_2] = SPHeroChallengeAction:ParseTrainInfo(nil, iter_2_2)
		end
	end
end

function SPHeroChallengeActivityTemplate.InitCurScheduleList(arg_3_0, arg_3_1, arg_3_2)
	if arg_3_0.curScheduleList then
		for iter_3_0, iter_3_1 in ipairs(arg_3_1) do
			local var_3_0 = SPHeroChallengeAction:ParseScheduleInfo(iter_3_1)

			if var_3_0 and var_3_0.isFinish and arg_3_0.curScheduleList[var_3_0.index].isFinish ~= var_3_0.isFinish then
				SDKTools.SendMessageToSDK("task_accept", {
					opt = 4,
					type = 2,
					activity_id = arg_3_0.activityID,
					task_id = var_3_0.scheduleID
				})
			end
		end
	end

	if not arg_3_0:CheckCurScheduleStart() then
		arg_3_0.curScheduleList = {}
		arg_3_0.dailyList = {}
	end

	if arg_3_1 then
		for iter_3_2, iter_3_3 in ipairs(arg_3_1) do
			local var_3_1 = SPHeroChallengeAction:ParseScheduleInfo(iter_3_3)

			if var_3_1 then
				arg_3_0.curScheduleList[var_3_1.index] = var_3_1
				arg_3_0.dailyList[var_3_1.index] = var_3_1.scheduleID
				arg_3_0.dailyList[var_3_1.index] = var_3_1.scheduleID
			end
		end
	end

	if not arg_3_2 then
		manager.notify:Invoke(SP_HERO_CHALLENGE_SCHEDULE_CONFIRM)
	end
end

function SPHeroChallengeActivityTemplate.InitCurEntrustList(arg_4_0, arg_4_1)
	arg_4_0.beganEntrustList = {}

	if arg_4_1 then
		for iter_4_0, iter_4_1 in ipairs(arg_4_1) do
			local var_4_0 = SPHeroChallengeAction:ParseEntrustInfo(iter_4_1)

			if var_4_0 then
				arg_4_0.beganEntrustList[var_4_0.index] = var_4_0
			end
		end
	end
end

function SPHeroChallengeActivityTemplate.InitWaiteEntrustList(arg_5_0, arg_5_1)
	arg_5_0.waitEntrustList = {}

	if arg_5_1 then
		for iter_5_0, iter_5_1 in ipairs(arg_5_1) do
			table.insert(arg_5_0.waitEntrustList, iter_5_1)
		end
	end
end

function SPHeroChallengeActivityTemplate.InitFinStoryList(arg_6_0, arg_6_1)
	arg_6_0.storyFinStageList = {}

	if arg_6_1 then
		for iter_6_0, iter_6_1 in ipairs(arg_6_1) do
			table.insert(arg_6_0.storyFinStageList, iter_6_1)
		end
	end

	if #arg_6_0.storyFinStageList > 0 then
		CommonTools.UniversalSortEx(arg_6_0.storyFinStageList, {
			ascend = true,
			map = function(arg_7_0)
				return arg_7_0
			end
		})
	end
end

function SPHeroChallengeActivityTemplate.Dispose(arg_8_0)
	arg_8_0.activityID = nil
	arg_8_0.entrustFreeTime = nil
	arg_8_0.getAwardFlag = nil
	arg_8_0.storyFinStageList = nil
	arg_8_0.waitEntrustList = nil
	arg_8_0.beganEntrustList = nil
	arg_8_0.curScheduleList = nil
	arg_8_0.trainInfo = nil
end

function SPHeroChallengeActivityTemplate.RefreshDormDailyZero(arg_9_0)
	arg_9_0.entrustFreeTime = 0
	arg_9_0.entrustTime = 0
end

function SPHeroChallengeActivityTemplate.GetRefreshFreeEntrustTime(arg_10_0)
	return GameSetting.activity_hero_challenge_task_free_refresh_num.value[1] - arg_10_0.entrustFreeTime
end

function SPHeroChallengeActivityTemplate.GetRefreshTotalEntrustTime(arg_11_0)
	return GameSetting.activity_hero_challenge_task_refresh_num.value[1] - arg_11_0.entrustTime
end

function SPHeroChallengeActivityTemplate.GetNextStoryStageIDList(arg_12_0)
	local var_12_0 = SpHeroChallengeConst.ScheduleSubType.story
	local var_12_1 = BattleVerthandiExclusiveCfg.get_id_list_by_sub_type[var_12_0][1]

	if arg_12_0.storyFinStageList and #arg_12_0.storyFinStageList > 0 then
		local var_12_2 = arg_12_0.storyFinStageList[#arg_12_0.storyFinStageList]

		var_12_1 = BattleVerthandiExclusiveCfg[var_12_2].next_unlock_id_list[1]

		if not var_12_1 or var_12_1 == "" then
			var_12_1 = var_12_2
		end
	end

	return var_12_1
end

function SPHeroChallengeActivityTemplate.GetBossErosiveness(arg_13_0)
	local var_13_0 = 0

	if arg_13_0.trainInfo then
		for iter_13_0, iter_13_1 in pairs(arg_13_0.trainInfo) do
			var_13_0 = var_13_0 + iter_13_1.value
		end
	end

	return math.ceil(var_13_0 / (3 * GameSetting.activity_hero_challenge_erosion_num.value[1]))
end

function SPHeroChallengeActivityTemplate.GetTrainNumBySchedule(arg_14_0, arg_14_1)
	local var_14_0 = ActivityHeroChallengeScheduleCfg[arg_14_1].server_type

	return arg_14_0:GetTrainNumByType(var_14_0)
end

function SPHeroChallengeActivityTemplate.GetTrainNumByType(arg_15_0, arg_15_1)
	local var_15_0 = ActivityHeroChallengeCfg[arg_15_0.activityID]["affix_group_" .. tostring(arg_15_1 - 1)][3][1]
	local var_15_1 = 0

	if arg_15_0.trainInfo[arg_15_1] then
		var_15_1 = arg_15_0.trainInfo[arg_15_1].value
	end

	return var_15_1 or 0, var_15_0
end

function SPHeroChallengeActivityTemplate.FinishTrainStage(arg_16_0, arg_16_1)
	local var_16_0 = BattleVerthandiExclusiveCfg[arg_16_1]

	if var_16_0 then
		local var_16_1 = var_16_0.sub_type

		if not table.indexof(arg_16_0.trainInfo[var_16_1].passStageList, arg_16_1) then
			table.insert(arg_16_0.trainInfo[var_16_1].passStageList, arg_16_1)
		end
	end
end

function SPHeroChallengeActivityTemplate.GetEntrustEndTime(arg_17_0, arg_17_1)
	if arg_17_0.beganEntrustList and arg_17_0.beganEntrustList[arg_17_1] then
		local var_17_0 = arg_17_0.beganEntrustList[arg_17_1]

		if var_17_0.startTime > 0 then
			local var_17_1 = ActivityHeroChallengeTaskCfg[var_17_0.entrustID]
			local var_17_2 = manager.time:GetServerTime()

			if var_17_2 - var_17_0.startTime >= var_17_1.time * 60 then
				return true, 0
			else
				return false, var_17_1.time * 60 - (var_17_2 - var_17_0.startTime)
			end
		end
	else
		Debug.LogError("未获取到已开始委托数据" .. arg_17_1)
	end
end

function SPHeroChallengeActivityTemplate.ModefyEntrustStartTime(arg_18_0, arg_18_1)
	local var_18_0 = arg_18_1.index
	local var_18_1 = SPHeroChallengeData.activityCfg[arg_18_0.activityID].acceleratorTime
	local var_18_2 = arg_18_0.beganEntrustList[var_18_0]

	if var_18_2 then
		var_18_2.startTime = var_18_2.startTime - arg_18_1.use_cnt * var_18_1 * 60
	end

	manager.notify:Invoke(SP_HERO_CHALLENGE_START_ENTRUST)
end

function SPHeroChallengeActivityTemplate.GetCanGetRewardEntrustIndexList(arg_19_0)
	local var_19_0 = {}

	if arg_19_0.beganEntrustList then
		for iter_19_0, iter_19_1 in pairs(arg_19_0.beganEntrustList) do
			if arg_19_0:GetEntrustEndTime(iter_19_0) then
				table.insert(var_19_0, iter_19_0)
			end
		end
	end

	return var_19_0
end

function SPHeroChallengeActivityTemplate.GetCurRunEntrustInfo(arg_20_0)
	local var_20_0 = {}

	if arg_20_0.beganEntrustList then
		for iter_20_0, iter_20_1 in pairs(arg_20_0.beganEntrustList) do
			if iter_20_1.start > 0 then
				var_20_0[iter_20_0] = iter_20_1
			end
		end
	end

	return var_20_0
end

function SPHeroChallengeActivityTemplate.StartEntrust(arg_21_0, arg_21_1, arg_21_2)
	if not arg_21_0.beganEntrustList then
		arg_21_0.beganEntrustList = {}
	end

	if arg_21_0.waitEntrustList then
		for iter_21_0, iter_21_1 in ipairs(arg_21_0.waitEntrustList) do
			if iter_21_1 == arg_21_2 then
				table.remove(arg_21_0.waitEntrustList, iter_21_0)

				break
			end
		end
	end
end

function SPHeroChallengeActivityTemplate.CancelEntrust(arg_22_0, arg_22_1)
	arg_22_0.beganEntrustList[arg_22_1] = nil
end

function SPHeroChallengeActivityTemplate.GetReceiveEntrustNum(arg_23_0)
	local var_23_0 = 0

	if arg_23_0.beganEntrustList then
		for iter_23_0, iter_23_1 in pairs(arg_23_0.beganEntrustList) do
			var_23_0 = var_23_0 + 1
		end
	end

	return var_23_0
end

function SPHeroChallengeActivityTemplate.GetEntrustInfoByIndex(arg_24_0, arg_24_1)
	if arg_24_0.beganEntrustList then
		return arg_24_0.beganEntrustList[arg_24_1]
	end
end

function SPHeroChallengeActivityTemplate.GetNextExtrustIndex(arg_25_0)
	if arg_25_0.beganEntrustList then
		local var_25_0 = SPHeroChallengeTools:GetMaxTotleEntrustPosNum(arg_25_0.activityID)

		for iter_25_0 = 1, var_25_0 do
			if SPHeroChallengeTools:GetEntrustPosState(arg_25_0.activityID, iter_25_0) == SpHeroChallengeConst.EntrustPosState.empty then
				return iter_25_0
			end
		end
	end
end

function SPHeroChallengeActivityTemplate.GetPrepareEntrustList(arg_26_0)
	local var_26_0 = {}

	if arg_26_0.beganEntrustList then
		local var_26_1 = {}

		for iter_26_0, iter_26_1 in ipairs(arg_26_0.beganEntrustList) do
			if iter_26_1.start == 0 or arg_26_0:GetEntrustEndTime(iter_26_1.index) then
				talbe.insert(var_26_1, iter_26_1.showIndex)
			end
		end
	end

	return var_26_0
end

function SPHeroChallengeActivityTemplate.GetShowIndexEntrustInfo(arg_27_0, arg_27_1)
	if arg_27_0.beganEntrustList then
		for iter_27_0, iter_27_1 in pairs(arg_27_0.beganEntrustList) do
			if iter_27_1.showIndex == arg_27_1 then
				return iter_27_1
			end
		end
	end
end

function SPHeroChallengeActivityTemplate.EntrustFinish(arg_28_0, arg_28_1)
	if arg_28_0.beganEntrustList then
		for iter_28_0, iter_28_1 in pairs(arg_28_0.beganEntrustList) do
			if iter_28_1.showIndex == arg_28_1 then
				local var_28_0 = SPHeroChallengeTools:GetMaxStartEntrustPosNum(arg_28_0.activityID)
				local var_28_1 = arg_28_0:GetShowIndexEntrustInfo(var_28_0 + 1)

				if var_28_1 and var_28_1.startTime == 0 then
					local var_28_2 = var_28_1.showIndex
					local var_28_3 = var_28_1.showIndex

					var_28_1.showIndex = arg_28_1
					var_28_1.startTime = manager.time:GetServerTime()

					for iter_28_2, iter_28_3 in pairs(arg_28_0.beganEntrustList) do
						if iter_28_3.startTime == 0 then
							var_28_3 = math.max(var_28_3, iter_28_3.showIndex)
							iter_28_3.showIndex = iter_28_3.showIndex - 1
						end
					end

					iter_28_1.showIndex = var_28_3
				end

				break
			end
		end

		local var_28_4 = SPHeroChallengeData:GetActivityID()

		SPHeroChallengeRedPointTools:UpdataCanGetEntrustRewardRedPoint(var_28_4)
		manager.notify:Invoke(SP_HERO_CHALLENGE_FIN_ENTRUST)
	end
end

function SPHeroChallengeActivityTemplate.FinishSchedule(arg_29_0, arg_29_1)
	if arg_29_0.curScheduleList and arg_29_0.curScheduleList[arg_29_1] then
		arg_29_0.curScheduleList[arg_29_1].isFinish = true
	end
end

function SPHeroChallengeActivityTemplate.GetStartListScheduleInfoByList(arg_30_0, arg_30_1)
	if arg_30_0.curScheduleList then
		return arg_30_0.curScheduleList[arg_30_1]
	end
end

function SPHeroChallengeActivityTemplate.GetFinScheduleScore(arg_31_0)
	local var_31_0 = 0

	if arg_31_0.curScheduleList then
		for iter_31_0, iter_31_1 in pairs(arg_31_0.curScheduleList) do
			if iter_31_1.isFinish then
				local var_31_1 = ActivityHeroChallengeScheduleCfg[iter_31_1.scheduleID]

				if var_31_1 then
					var_31_0 = var_31_0 + var_31_1.score
				else
					Debug.LogError("未获取日程任务配置" .. iter_31_1.scheduleID)
				end
			end
		end
	end

	return var_31_0
end

function SPHeroChallengeActivityTemplate.CheckCurScheduleFinish(arg_32_0)
	local var_32_0 = true

	if arg_32_0.curScheduleList and next(arg_32_0.curScheduleList) ~= nil then
		for iter_32_0, iter_32_1 in pairs(arg_32_0.curScheduleList) do
			if not iter_32_1.isFinish then
				var_32_0 = false

				break
			end
		end
	else
		var_32_0 = false
	end

	return var_32_0
end

function SPHeroChallengeActivityTemplate.CheckDailyScheduleAwardReceived(arg_33_0)
	return arg_33_0.getAwardFlag
end

function SPHeroChallengeActivityTemplate.CheckCurScheduleStart(arg_34_0)
	if arg_34_0.curScheduleList and next(arg_34_0.curScheduleList) then
		return true
	else
		return false
	end
end

function SPHeroChallengeActivityTemplate.GetStartBattelScheduleByType(arg_35_0, arg_35_1)
	local var_35_0 = 0
	local var_35_1 = 0

	if arg_35_0.curScheduleList then
		for iter_35_0, iter_35_1 in pairs(arg_35_0.curScheduleList) do
			local var_35_2 = iter_35_1.scheduleID

			if ActivityHeroChallengeScheduleCfg[var_35_2].server_type == arg_35_1 then
				var_35_0 = var_35_0 + 1

				if iter_35_1.isFinish then
					var_35_1 = var_35_1 + 1
				end
			end
		end
	end

	return var_35_0, var_35_1
end

function SPHeroChallengeActivityTemplate.GetSaveScheudlList(arg_36_0)
	if arg_36_0.localSaveSchedule then
		arg_36_0.localSaveSchedule = getData("SPHeroChallenge" .. arg_36_0.activityID, "localSchedule") or {}
	end

	return arg_36_0.localSaveSchedule
end

function SPHeroChallengeActivityTemplate.SetSaveScheudlList(arg_37_0)
	if arg_37_0.localSaveSchedule then
		saveData("SPHeroChallenge" .. arg_37_0.activityID, "localSchedule", arg_37_0.localSaveSchedule)
	end

	arg_37_0.localSaveSchedule = nil
end

function SPHeroChallengeActivityTemplate.AddScheduleInDailyList(arg_38_0, arg_38_1)
	if not arg_38_0.dailyList then
		arg_38_0.dailyList = {}
	end

	local var_38_0

	for iter_38_0 = 1, SpHeroChallengeConst.scheduleNum do
		if not arg_38_0.dailyList[iter_38_0] or arg_38_0.dailyList[iter_38_0] == 0 then
			arg_38_0.dailyList[iter_38_0] = arg_38_1
			var_38_0 = iter_38_0

			break
		end
	end

	if var_38_0 then
		manager.notify:Invoke(SP_HERO_CHALLENGE_SCHEDULE_CHANGE, var_38_0)
	end
end

function SPHeroChallengeActivityTemplate.RemoveScheduleInDailyList(arg_39_0, arg_39_1, arg_39_2)
	if not arg_39_0.dailyList then
		return
	end

	arg_39_0.dailyList[arg_39_2] = 0

	manager.notify:Invoke(SP_HERO_CHALLENGE_SCHEDULE_CHANGE, arg_39_2)
end

function SPHeroChallengeActivityTemplate.GetScheduleDailyList(arg_40_0)
	return arg_40_0.dailyList or {}
end

function SPHeroChallengeActivityTemplate.ClearScheduleDailyList(arg_41_0)
	arg_41_0.dailyList = {}

	for iter_41_0, iter_41_1 in ipairs(arg_41_0.curScheduleList) do
		local var_41_0 = arg_41_0.curScheduleList[iter_41_0]

		if var_41_0 and var_41_0.isFinish then
			arg_41_0.dailyList[var_41_0.index] = var_41_0.scheduleID
		end
	end
end

function SPHeroChallengeActivityTemplate.InitBossInfo(arg_42_0, arg_42_1)
	if arg_42_1 then
		arg_42_0.bossHadFightDailyList = {}

		local var_42_0 = {}

		for iter_42_0, iter_42_1 in ipairs(arg_42_1.stage_id_list) do
			table.insert(var_42_0, iter_42_1)
		end

		arg_42_0.bossHadFightDailyList.dailyChallenge = var_42_0
		arg_42_0.bossHadFightDailyList.time = arg_42_1.fight_cnt
		arg_42_0.bossStageScore = {}

		for iter_42_2, iter_42_3 in ipairs(arg_42_1.score_info_list) do
			local var_42_1 = SPHeroChallengeAction:ParseScoreInfo(iter_42_3)

			arg_42_0.bossStageScore[var_42_1.stageID] = var_42_1.score
		end

		arg_42_0.bossStart = arg_42_1.is_start
		arg_42_0.equipList = {}

		if arg_42_1.got_award_cfg_list then
			for iter_42_4, iter_42_5 in ipairs(arg_42_1.got_award_cfg_list) do
				table.insert(arg_42_0.equipList, iter_42_5)
			end
		end

		manager.notify:Invoke(SP_HERO_CHALLENGE_UPDATE_BOSS)
	end
end

function SPHeroChallengeActivityTemplate.GetBossScoreInfo(arg_43_0, arg_43_1)
	if arg_43_0.bossStageScore then
		return arg_43_0.bossStageScore[arg_43_1] or 0
	end

	return 0
end

function SPHeroChallengeActivityTemplate.FinishStoryStage(arg_44_0, arg_44_1)
	if not arg_44_0.storyFinStageList then
		arg_44_0.storyFinStageList = {}
	end

	if not table.indexof(arg_44_0.storyFinStageList, arg_44_1) then
		table.insert(arg_44_0.storyFinStageList, arg_44_1)
	end
end

function SPHeroChallengeActivityTemplate.CheckStoryFinState(arg_45_0, arg_45_1)
	if not arg_45_0.storyFinStageList then
		arg_45_0.storyFinStageList = {}
	end

	if not table.indexof(arg_45_0.storyFinStageList, arg_45_1) then
		return false
	else
		return true
	end
end

function SPHeroChallengeActivityTemplate.GetNextStageName(arg_46_0)
	if arg_46_0.storyFinStageList then
		local var_46_0 = #arg_46_0.storyFinStageList
		local var_46_1 = BattleVerthandiExclusiveCfg.get_id_list_by_sub_type[SpHeroChallengeConst.BattleSubType.story][1 + var_46_0]

		if var_46_1 then
			return BattleVerthandiExclusiveCfg[var_46_1].name
		end
	end
end

function SPHeroChallengeActivityTemplate.CheckCanGetHeroChipTaskAward(arg_47_0)
	local var_47_0 = SPHeroChallengeData.activityCfg[arg_47_0.activityID].HeroChipTask

	if var_47_0 then
		local var_47_1 = TaskData2:GetTaskComplete(var_47_0)
		local var_47_2 = TaskData2:GetTaskProgress(var_47_0)
		local var_47_3 = AssignmentCfg[var_47_0].need

		if var_47_1 or var_47_2 < var_47_3 then
			return false, var_47_1, var_47_3, var_47_2
		else
			return true, nil, var_47_3, var_47_2
		end
	end
end

function SPHeroChallengeActivityTemplate.CheckHasReceiveHeroAward(arg_48_0)
	local var_48_0 = SPHeroChallengeData.activityCfg[arg_48_0.activityID].HeroChipTask
	local var_48_1 = TaskData2:GetTask(var_48_0)

	return var_48_1 and var_48_1.complete_flag > 0
end

function SPHeroChallengeActivityTemplate.CheckHasReceiveWeaponAward(arg_49_0)
	local var_49_0 = SPHeroChallengeData.activityCfg[arg_49_0.activityID].shopItemID

	return ShopTools.CheckSoldOut(var_49_0)
end
