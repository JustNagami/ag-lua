local var_0_0 = {}

manager.net:Bind(24009, function(arg_1_0)
	BattleStageData:InitPlotData(arg_1_0.user_chapter_list)

	for iter_1_0, iter_1_1 in ipairs(arg_1_0.user_chapter_list) do
		local var_1_0 = iter_1_1.id
		local var_1_1 = getChapterIDByStageID(var_1_0)
		local var_1_2 = ChapterCfg[var_1_1]
		local var_1_3 = BattleStageTools.GetStageCfg(ChapterCfg[var_1_1].type, var_1_0)

		if iter_1_1.clear_times > 0 then
			local var_1_4 = StageTools.GetStageArchiveID(var_1_0)

			if var_1_4 and var_1_4 ~= 0 and not RedPointData:GetIsRedPointOpen(RedPointConst.CHAPTER_STAGE_ARCHIVE_RANGE + var_1_4) then
				manager.redPoint:setTip(string.format("%s_%s", RedPointConst.COMBAT_CHAPTER_ARCHIVE, var_1_4), 1)
			end
		end

		var_0_0.CheckStageRedPoint(var_1_0)
	end

	TaskRedPoint:UpdateDailyTaskRedTip()
	var_0_0.UpdateRedPoint()
	var_0_0.UpdateSubPlotRedPoint()
end)
manager.net:Bind(24017, function(arg_2_0)
	BattleStageData:InitChapterStarReward(arg_2_0.gain_list)
	var_0_0.UpdateRedPoint()
end)

function var_0_0.GetChapterStarReward(arg_3_0, arg_3_1, arg_3_2)
	manager.net:SendWithLoadingNew(24014, {
		id = arg_3_0,
		treasure_id = arg_3_1
	}, 24015, function(arg_4_0)
		arg_3_2(arg_4_0)
		var_0_0.UpdateChapterRedPoint(arg_3_0)
	end)
end

function var_0_0.ClientModifyThreeStar(arg_5_0, arg_5_1)
	if GameSetting.newbie_unlock_level_id.value[1] == arg_5_0 and BattleStageData:GetStageData()[arg_5_0].clear_times <= 1 then
		ActivityNewbieData:SetNewbieOpenTime(manager.time:GetServerTime())
	end

	BattleStageData:ClientModifyThreeStar(arg_5_0, arg_5_1)

	local var_5_0 = getChapterAndSectionID(arg_5_0)

	var_0_0.UpdateChapterRedPoint(var_5_0)
end

function var_0_0.ClickChapterArchive(arg_6_0)
	manager.redPoint:setTip(string.format("%s_%s", RedPointConst.COMBAT_CHAPTER_ARCHIVE, arg_6_0), 0)

	if not RedPointData:GetIsRedPointOpen(RedPointConst.CHAPTER_STAGE_ARCHIVE_RANGE + arg_6_0) then
		RedPointAction.HandleRedPoint(RedPointConst.CHAPTER_STAGE_ARCHIVE_RANGE + arg_6_0)
	end
end

function var_0_0.UpdateRedPoint()
	for iter_7_0, iter_7_1 in pairs(BattleStageData:GetChapterStarList()) do
		var_0_0.UpdateChapterRedPoint(iter_7_0)
	end

	TaskRedPoint:UpdateChapterPlot19RedTip()
end

function var_0_0.UpdateActivityRedPoint()
	for iter_8_0, iter_8_1 in pairs(BattleStageData:GetStageData()) do
		var_0_0.CheckStageRedPoint(iter_8_0)
	end
end

function var_0_0.CheckStageRedPoint(arg_9_0)
	if BattleStageData:GetStageData()[arg_9_0].clear_times <= 0 then
		local var_9_0 = getChapterIDByStageID(arg_9_0)
		local var_9_1 = ChapterCfg[var_9_0]
		local var_9_2

		if var_9_1.unlock_activity_id ~= 0 then
			var_9_2 = var_9_1.unlock_activity_id
		else
			var_9_2 = var_9_1.activity_id
		end

		local var_9_3 = true

		if var_9_2 == 0 or ActivityTools.GetActivityStatus(var_9_2) ~= 1 then
			var_9_3 = false
		end

		if table.keyof(var_9_1.section_id_list, arg_9_0) == 1 and var_9_3 and var_9_2 and not RedPointData:GetIsRedPointOpen(RedPointConst.ACTIVITY_RANGE + var_9_2) and ChapterTools.IsFinishPreChapter(var_9_0) then
			manager.redPoint:setTip(string.format("%s%s", ActivityTools.GetRedPointKey(var_9_1.activity_id), var_9_2), 1)
		else
			manager.redPoint:setTip(string.format("%s%s", ActivityTools.GetRedPointKey(var_9_1.activity_id), var_9_2), 0)
		end
	end
end

function var_0_0.UpdateSubPlotRedPoint()
	if PlayerData:GetPlayerInfo().userLevel < GameSetting.sub_plot_unlock_level.value[1] then
		return
	end

	for iter_10_0, iter_10_1 in pairs(ChapterClientCfg.get_id_list_by_toggle[BattleConst.TOGGLE.SUB_PLOT] or {}) do
		local var_10_0 = ChapterClientCfg[iter_10_1].chapter_list

		for iter_10_2, iter_10_3 in pairs(var_10_0) do
			if not ChapterTools.IsClearChapter(iter_10_3) then
				local var_10_1 = ChapterCfg[iter_10_3].section_id_list[1]

				if not ChapterTools.IsClearFirstStage(iter_10_3) and BattleStageData:GetSubPlotRedPointFlag(iter_10_3) ~= 1 and BattleStageData:GetStageData()[var_10_1] then
					manager.redPoint:setTip(string.format("%s_%s", RedPointConst.COMBAT_SUB_PLOT_CHAPTER, iter_10_3), 1)

					local var_10_2 = ChapterCfg[iter_10_3].activity_id
					local var_10_3 = ActivityData:GetActivityRefreshTime(var_10_2)

					if var_10_2 ~= 0 and ActivityTools.GetActivityStatus(var_10_2) == 1 and (var_10_3 == 0 or var_10_3 >= manager.time:GetServerTime()) and not RedPointData:GetIsRedPointOpen(RedPointConst.ACTIVITY_RANGE + var_10_2) then
						manager.redPoint:setTip(ActivityTools.GetRedPointKey(var_10_2) .. var_10_2, 1)

						break
					end

					if var_10_2 ~= 0 then
						manager.redPoint:setTip(ActivityTools.GetRedPointKey(var_10_2) .. var_10_2, 0)
					end
				end

				break
			end
		end

		var_0_0.UpdateExtraStoryRedPoint(iter_10_1)
	end
end

function var_0_0.UpdateExtraStoryRedPoint(arg_11_0)
	local var_11_0 = ChapterClientCfg[arg_11_0]

	if var_11_0.extra_story_unlock_condition ~= "" and isMeetAllCondition(var_11_0.extra_story_unlock_condition) and not RedPointData:GetIsRedPointOpen(RedPointConst.CHAPTER_EXTRA_STORY_RANGE + arg_11_0) then
		manager.redPoint:setTip(string.format("%s_%s", RedPointConst.COMBAT_SUB_PLOT_EXTRA_STORY, arg_11_0), 1)
	end
end

function var_0_0.ClickSubPlot(arg_12_0)
	local var_12_0 = string.format("%s_%s", RedPointConst.COMBAT_SUB_PLOT_CHAPTER, arg_12_0)

	manager.redPoint:setTip(var_12_0, 0)

	local var_12_1 = ChapterCfg[arg_12_0].activity_id

	if var_12_1 ~= 0 then
		RedPointAction.HandleRedPoint(RedPointConst.ACTIVITY_RANGE + var_12_1)
		manager.redPoint:setTip(ActivityTools.GetRedPointKey(var_12_1) .. var_12_1, 0)
	end

	BattleStageData:SetSubPlotRedPointFlag(arg_12_0)
end

function var_0_0.ClickSubPlotExtraStory(arg_13_0)
	local var_13_0 = string.format("%s_%s", RedPointConst.COMBAT_SUB_PLOT_EXTRA_STORY, arg_13_0)

	manager.redPoint:setTip(var_13_0, 0)

	local var_13_1 = ChapterClientCfg[arg_13_0]

	if var_13_1.extra_story_unlock_condition ~= "" and isMeetAllCondition(var_13_1.extra_story_unlock_condition) and not RedPointData:GetIsRedPointOpen(RedPointConst.CHAPTER_EXTRA_STORY_RANGE + arg_13_0) then
		RedPointAction.HandleRedPoint(RedPointConst.CHAPTER_EXTRA_STORY_RANGE + arg_13_0)
	end
end

function var_0_0.UpdateChapterRedPoint(arg_14_0)
	if not ChapterTools.IsFinishPreChapter(arg_14_0) then
		manager.redPoint:setTip(string.format("%s_%s", RedPointConst.COMBAT_PLOT_CHAPTER_STAR, arg_14_0), 0)

		return
	end

	local var_14_0 = getChapterClientCfgByChapterID(arg_14_0)

	if var_14_0 == nil then
		return
	end

	local var_14_1 = var_14_0.id

	if getChapterToggle(var_14_1) == BattleConst.TOGGLE.PLOT then
		manager.redPoint:setTip(string.format("%s_%s", RedPointConst.COMBAT_PLOT_CHAPTER_STAR, arg_14_0), BattleStageData:GetChapterRedPointNotice(arg_14_0) and 1 or 0)
	end
end

local var_0_1

function var_0_0.AddActivityTimer()
	var_0_0.UpdateRedPoint()

	local var_15_0 = ChapterCfg.get_id_list_by_type[BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_PLOT]
	local var_15_1 = {}

	for iter_15_0, iter_15_1 in ipairs(var_15_0) do
		local var_15_2 = ChapterCfg[iter_15_1].activity_id

		if var_15_2 ~= 0 then
			var_15_1[var_15_2] = ActivityData:GetActivityData(var_15_2):IsActivitying()
		end
	end

	var_0_1 = Timer.New(function()
		local var_16_0 = false

		for iter_16_0, iter_16_1 in pairs(var_15_1) do
			local var_16_1 = ActivityData:GetActivityData(iter_16_0):IsActivitying()

			if iter_16_1 ~= var_16_1 then
				var_15_1[iter_16_0] = var_16_1
				var_16_0 = true
			end
		end

		if var_16_0 then
			var_0_0.UpdateRedPoint()
		end
	end, 1, -1)

	var_0_1:Start()
end

function var_0_0.RemoveActivityTimer()
	if var_0_1 then
		var_0_1:Stop()

		var_0_1 = nil
	end
end

manager.net:Bind(24029, function(arg_18_0)
	BattleStageData:InitMapLocation(arg_18_0)
end)

function var_0_0.ScanClueLocation(arg_19_0, arg_19_1)
	manager.net:SendWithLoadingNew(24030, {
		map_id = arg_19_0
	}, 24031, function(arg_20_0)
		if isSuccess(arg_20_0.result) then
			for iter_20_0, iter_20_1 in ipairs(arg_20_0.location_id_list) do
				BattleStageData:ScanClueLocationData(arg_19_0, iter_20_1)
			end

			arg_19_1(arg_20_0)
		else
			ShowTips(arg_20_0.result)
		end
	end)
end

function var_0_0.GetClueLocation(arg_21_0)
	manager.net:Push(24032, {
		location_id = arg_21_0
	})
end

manager.net:Bind(24033, function(arg_22_0)
	if isSuccess(arg_22_0.result) then
		local var_22_0 = arg_22_0.clue_location.location_id
		local var_22_1 = arg_22_0.clue_location.clue_id
		local var_22_2 = arg_22_0.map_id

		BattleStageData:UpdateClueLocationData(var_22_2, var_22_0, var_22_1)
		manager.notify:Invoke(CHAPTER_GET_CLUE, var_22_0)
	else
		ShowTips(arg_22_0.result)
	end
end)

function var_0_0.UpdateLocationEvent(arg_23_0)
	if BattleStageData:HasReadLocationEvent(arg_23_0) then
		return
	end

	manager.net:Push(24034, {
		event_id = arg_23_0
	})
	BattleStageData:UpdateLocationEvent(arg_23_0)
end

function var_0_0.OperateChapterDay(arg_24_0, arg_24_1, arg_24_2)
	manager.net:Push(24036, {
		detector_info = {
			status = 1,
			chapter_id = arg_24_0,
			day = arg_24_1
		}
	})
	BattleStageData:SetOperateChapterDay(arg_24_0, arg_24_1)
	arg_24_2()
end

function var_0_0.ReadLoacationClue(arg_25_0, arg_25_1, arg_25_2)
	if ChapterTools.IsReadClue(arg_25_0, arg_25_1) then
		return
	end

	manager.net:Push(24038, {
		clue_id = arg_25_2
	})
	BattleStageData:UpdateClueLocationData(arg_25_0, arg_25_1, arg_25_2)
end

return var_0_0
