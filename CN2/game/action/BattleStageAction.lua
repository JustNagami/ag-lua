local var_0_0 = {}

manager.net:Bind(24043, function(arg_1_0)
	BattleStageData:InitStageArchiveData(arg_1_0.plot_list)
end)

function var_0_0.SetStageArchiveRead(arg_2_0)
	manager.net:SendWithLoadingNew(24040, {
		archive_id = arg_2_0
	}, 24041)
end

manager.net:Bind(24009, function(arg_3_0)
	BattleStageData:InitPlotData(arg_3_0.user_chapter_list)

	for iter_3_0, iter_3_1 in ipairs(arg_3_0.user_chapter_list) do
		local var_3_0 = iter_3_1.id
		local var_3_1 = getChapterIDByStageID(var_3_0)
		local var_3_2 = ChapterCfg[var_3_1]
		local var_3_3 = BattleStageTools.GetStageCfg(ChapterCfg[var_3_1].type, var_3_0)

		if iter_3_1.clear_times > 0 then
			local var_3_4 = StageTools.GetStageArchiveID(var_3_0)

			if var_3_4 and var_3_4 ~= 0 and not RedPointData:GetIsRedPointOpen(RedPointConst.CHAPTER_STAGE_ARCHIVE_RANGE + var_3_4) then
				manager.redPoint:setTip(string.format("%s_%s", RedPointConst.COMBAT_CHAPTER_ARCHIVE, var_3_4), 1)
			end
		end

		var_0_0.CheckStageRedPoint(var_3_0)
	end

	TaskRedPoint:UpdateDailyTaskRedTip()
	var_0_0.UpdateRedPoint()
	var_0_0.UpdateSubPlotRedPoint()
end)
manager.net:Bind(24017, function(arg_4_0)
	BattleStageData:InitChapterStarReward(arg_4_0.gain_list)
	var_0_0.UpdateRedPoint()
end)

function var_0_0.GetChapterStarReward(arg_5_0, arg_5_1, arg_5_2)
	manager.net:SendWithLoadingNew(24014, {
		id = arg_5_0,
		treasure_id = arg_5_1
	}, 24015, function(arg_6_0)
		arg_5_2(arg_6_0)
		var_0_0.UpdateChapterRedPoint(arg_5_0)
	end)
end

function var_0_0.ClientModifyThreeStar(arg_7_0, arg_7_1)
	if GameSetting.newbie_unlock_level_id.value[1] == arg_7_0 and BattleStageData:GetStageData()[arg_7_0].clear_times <= 1 then
		ActivityNewbieData:SetNewbieOpenTime(manager.time:GetServerTime())
	end

	BattleStageData:ClientModifyThreeStar(arg_7_0, arg_7_1)

	local var_7_0 = getChapterAndSectionID(arg_7_0)

	var_0_0.UpdateChapterRedPoint(var_7_0)
end

function var_0_0.ClickChapterArchive(arg_8_0)
	manager.redPoint:setTip(string.format("%s_%s", RedPointConst.COMBAT_CHAPTER_ARCHIVE, arg_8_0), 0)

	if not RedPointData:GetIsRedPointOpen(RedPointConst.CHAPTER_STAGE_ARCHIVE_RANGE + arg_8_0) then
		RedPointAction.HandleRedPoint(RedPointConst.CHAPTER_STAGE_ARCHIVE_RANGE + arg_8_0)
	end
end

function var_0_0.UpdateRedPoint()
	for iter_9_0, iter_9_1 in pairs(BattleStageData:GetChapterStarList()) do
		var_0_0.UpdateChapterRedPoint(iter_9_0)
	end

	TaskRedPoint:UpdateChapterPlot19RedTip()
end

function var_0_0.UpdateActivityRedPoint()
	for iter_10_0, iter_10_1 in pairs(BattleStageData:GetStageData()) do
		var_0_0.CheckStageRedPoint(iter_10_0)
	end
end

function var_0_0.CheckStageRedPoint(arg_11_0)
	if BattleStageData:GetStageData()[arg_11_0].clear_times <= 0 then
		local var_11_0 = getChapterIDByStageID(arg_11_0)
		local var_11_1 = ChapterCfg[var_11_0]
		local var_11_2

		if var_11_1.unlock_activity_id ~= 0 then
			var_11_2 = var_11_1.unlock_activity_id
		else
			var_11_2 = var_11_1.activity_id
		end

		local var_11_3 = true

		if var_11_2 == 0 or ActivityTools.GetActivityStatus(var_11_2) ~= 1 then
			var_11_3 = false
		end

		if table.keyof(var_11_1.section_id_list, arg_11_0) == 1 and var_11_3 and var_11_2 and not RedPointData:GetIsRedPointOpen(RedPointConst.ACTIVITY_RANGE + var_11_2) and ChapterTools.IsFinishPreChapter(var_11_0) then
			manager.redPoint:setTip(string.format("%s%s", ActivityTools.GetRedPointKey(var_11_1.activity_id), var_11_2), 1)
		else
			manager.redPoint:setTip(string.format("%s%s", ActivityTools.GetRedPointKey(var_11_1.activity_id), var_11_2), 0)
		end
	end
end

function var_0_0.UpdateSubPlotRedPoint()
	if PlayerData:GetPlayerInfo().userLevel < GameSetting.sub_plot_unlock_level.value[1] then
		return
	end

	for iter_12_0, iter_12_1 in pairs(ChapterClientCfg.get_id_list_by_toggle[BattleConst.TOGGLE.SUB_PLOT] or {}) do
		local var_12_0 = ChapterClientCfg[iter_12_1].chapter_list

		for iter_12_2, iter_12_3 in pairs(var_12_0) do
			if not ChapterTools.IsClearChapter(iter_12_3) then
				local var_12_1 = ChapterCfg[iter_12_3].section_id_list[1]

				if not ChapterTools.IsClearFirstStage(iter_12_3) and BattleStageData:GetSubPlotRedPointFlag(iter_12_3) ~= 1 and BattleStageData:GetStageData()[var_12_1] then
					manager.redPoint:setTip(string.format("%s_%s", RedPointConst.COMBAT_SUB_PLOT_CHAPTER, iter_12_3), 1)

					local var_12_2 = ChapterCfg[iter_12_3].activity_id
					local var_12_3 = ActivityData:GetActivityRefreshTime(var_12_2)

					if var_12_2 ~= 0 and ActivityTools.GetActivityStatus(var_12_2) == 1 and (var_12_3 == 0 or var_12_3 >= manager.time:GetServerTime()) and not RedPointData:GetIsRedPointOpen(RedPointConst.ACTIVITY_RANGE + var_12_2) then
						manager.redPoint:setTip(ActivityTools.GetRedPointKey(var_12_2) .. var_12_2, 1)

						break
					end

					if var_12_2 ~= 0 then
						manager.redPoint:setTip(ActivityTools.GetRedPointKey(var_12_2) .. var_12_2, 0)
					end
				end

				break
			end
		end

		var_0_0.UpdateExtraStoryRedPoint(iter_12_1)
	end
end

function var_0_0.UpdateExtraStoryRedPoint(arg_13_0)
	local var_13_0 = ChapterClientCfg[arg_13_0]

	if var_13_0.extra_story_unlock_condition ~= "" and isMeetAllCondition(var_13_0.extra_story_unlock_condition) and not RedPointData:GetIsRedPointOpen(RedPointConst.CHAPTER_EXTRA_STORY_RANGE + arg_13_0) then
		manager.redPoint:setTip(string.format("%s_%s", RedPointConst.COMBAT_SUB_PLOT_EXTRA_STORY, arg_13_0), 1)
	end
end

function var_0_0.ClickSubPlot(arg_14_0)
	local var_14_0 = string.format("%s_%s", RedPointConst.COMBAT_SUB_PLOT_CHAPTER, arg_14_0)

	manager.redPoint:setTip(var_14_0, 0)

	local var_14_1 = ChapterCfg[arg_14_0].activity_id

	if var_14_1 ~= 0 then
		RedPointAction.HandleRedPoint(RedPointConst.ACTIVITY_RANGE + var_14_1)
		manager.redPoint:setTip(ActivityTools.GetRedPointKey(var_14_1) .. var_14_1, 0)
	end

	BattleStageData:SetSubPlotRedPointFlag(arg_14_0)
end

function var_0_0.ClickSubPlotExtraStory(arg_15_0)
	local var_15_0 = string.format("%s_%s", RedPointConst.COMBAT_SUB_PLOT_EXTRA_STORY, arg_15_0)

	manager.redPoint:setTip(var_15_0, 0)

	local var_15_1 = ChapterClientCfg[arg_15_0]

	if var_15_1.extra_story_unlock_condition ~= "" and isMeetAllCondition(var_15_1.extra_story_unlock_condition) and not RedPointData:GetIsRedPointOpen(RedPointConst.CHAPTER_EXTRA_STORY_RANGE + arg_15_0) then
		RedPointAction.HandleRedPoint(RedPointConst.CHAPTER_EXTRA_STORY_RANGE + arg_15_0)
	end
end

function var_0_0.UpdateChapterRedPoint(arg_16_0)
	if not ChapterTools.IsFinishPreChapter(arg_16_0) then
		manager.redPoint:setTip(string.format("%s_%s", RedPointConst.COMBAT_PLOT_CHAPTER_STAR, arg_16_0), 0)

		return
	end

	local var_16_0 = getChapterClientCfgByChapterID(arg_16_0)

	if var_16_0 == nil then
		return
	end

	local var_16_1 = var_16_0.id

	if getChapterToggle(var_16_1) == BattleConst.TOGGLE.PLOT then
		manager.redPoint:setTip(string.format("%s_%s", RedPointConst.COMBAT_PLOT_CHAPTER_STAR, arg_16_0), BattleStageData:GetChapterRedPointNotice(arg_16_0) and 1 or 0)
	end
end

local var_0_1

function var_0_0.AddActivityTimer()
	var_0_0.UpdateRedPoint()

	local var_17_0 = ChapterCfg.get_id_list_by_type[BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_PLOT]
	local var_17_1 = {}

	for iter_17_0, iter_17_1 in ipairs(var_17_0) do
		local var_17_2 = ChapterCfg[iter_17_1].activity_id

		if var_17_2 ~= 0 then
			var_17_1[var_17_2] = ActivityData:GetActivityData(var_17_2):IsActivitying()
		end
	end

	var_0_1 = Timer.New(function()
		local var_18_0 = false

		for iter_18_0, iter_18_1 in pairs(var_17_1) do
			local var_18_1 = ActivityData:GetActivityData(iter_18_0):IsActivitying()

			if iter_18_1 ~= var_18_1 then
				var_17_1[iter_18_0] = var_18_1
				var_18_0 = true
			end
		end

		if var_18_0 then
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

manager.net:Bind(24029, function(arg_20_0)
	BattleStageData:InitMapLocation(arg_20_0)
end)

function var_0_0.ScanClueLocation(arg_21_0, arg_21_1)
	manager.net:SendWithLoadingNew(24030, {
		map_id = arg_21_0
	}, 24031, function(arg_22_0)
		if isSuccess(arg_22_0.result) then
			for iter_22_0, iter_22_1 in ipairs(arg_22_0.location_id_list) do
				BattleStageData:ScanClueLocationData(arg_21_0, iter_22_1)
			end

			arg_21_1(arg_22_0)
		else
			ShowTips(arg_22_0.result)
		end
	end)
end

function var_0_0.GetClueLocation(arg_23_0)
	manager.net:Push(24032, {
		location_id = arg_23_0
	})
end

manager.net:Bind(24033, function(arg_24_0)
	if isSuccess(arg_24_0.result) then
		local var_24_0 = arg_24_0.clue_location.location_id
		local var_24_1 = arg_24_0.clue_location.clue_id
		local var_24_2 = arg_24_0.map_id

		BattleStageData:UpdateClueLocationData(var_24_2, var_24_0, var_24_1)
		manager.notify:Invoke(CHAPTER_GET_CLUE, var_24_0)
	else
		ShowTips(arg_24_0.result)
	end
end)

function var_0_0.UpdateLocationEvent(arg_25_0)
	if BattleStageData:HasReadLocationEvent(arg_25_0) then
		return
	end

	manager.net:Push(24034, {
		event_id = arg_25_0
	})
	BattleStageData:UpdateLocationEvent(arg_25_0)
end

function var_0_0.OperateChapterDay(arg_26_0, arg_26_1, arg_26_2)
	manager.net:Push(24036, {
		detector_info = {
			status = 1,
			chapter_id = arg_26_0,
			day = arg_26_1
		}
	})
	BattleStageData:SetOperateChapterDay(arg_26_0, arg_26_1)
	arg_26_2()
end

function var_0_0.ReadLoacationClue(arg_27_0, arg_27_1, arg_27_2)
	if ChapterTools.IsReadClue(arg_27_0, arg_27_1) then
		return
	end

	manager.net:Push(24038, {
		clue_id = arg_27_2
	})
	BattleStageData:UpdateClueLocationData(arg_27_0, arg_27_1, arg_27_2)
end

function var_0_0.OperationRush(arg_28_0, arg_28_1, arg_28_2, arg_28_3, arg_28_4, arg_28_5)
	local var_28_0 = BattleStageFactory.Produce(arg_28_2, arg_28_1, arg_28_4)

	var_28_0:SetMultiple(arg_28_3)

	local var_28_1 = var_28_0:GetType()
	local var_28_2 = var_28_0:GetDest()
	local var_28_3 = var_28_0:GetMultiple()
	local var_28_4 = var_28_0:GetType()
	local var_28_5, var_28_6 = var_28_0:GetHeroTeam()
	local var_28_7 = var_28_0:GetAssistHeroOwnerList()
	local var_28_8 = clone(var_28_5)
	local var_28_9 = clone(var_28_6)

	for iter_28_0 = #var_28_8, 1, -1 do
		if var_28_8[iter_28_0] == 0 then
			table.remove(var_28_8, iter_28_0)
			table.remove(var_28_9, iter_28_0)
		end
	end

	for iter_28_1 = 1, 2 do
		for iter_28_2 = iter_28_1 + 1, 3 do
			if var_28_8[iter_28_1] and var_28_8[iter_28_2] and var_28_8[iter_28_1] ~= 0 and var_28_8[iter_28_1] == var_28_8[iter_28_2] then
				ShowTips("TEAM_REPEAT_HERO")

				return
			end
		end
	end

	if BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_MATRIX == var_28_4 or BattleConst.STAGE_TYPE_NEW.ACTIVITY_MATRIX == var_28_4 then
		var_28_8 = var_28_0:GetSystemHeroTeam()

		local var_28_10 = var_28_8
	end

	local var_28_11 = var_28_0:GetComboSkillID() or 0
	local var_28_12 = var_28_0:GetComboSkillLevel() or 0
	local var_28_13 = var_28_0:GetSystemHeroTeam()
	local var_28_14 = {}

	for iter_28_3, iter_28_4 in ipairs(var_28_8) do
		var_28_14[iter_28_3] = {}

		if var_28_6[iter_28_3] ~= 0 and var_28_6[iter_28_3] ~= nil then
			var_28_14[iter_28_3].hero_type = 2
			var_28_14[iter_28_3].owner_id = BattleTeamData.NO_OWNER
			var_28_14[iter_28_3].hero_id = var_28_6[iter_28_3]
		elseif var_28_13[iter_28_3] ~= 0 and var_28_13[iter_28_3] ~= nil then
			var_28_14[iter_28_3].hero_type = 2
			var_28_14[iter_28_3].owner_id = BattleTeamData.NO_OWNER
			var_28_14[iter_28_3].hero_id = var_28_13[iter_28_3]
		else
			var_28_14[iter_28_3].hero_id = var_28_8[iter_28_3]
			var_28_14[iter_28_3].owner_id = var_28_7[iter_28_3] or BattleTeamData.NO_OWNER
			var_28_14[iter_28_3].hero_type = not BattleTeamData.IsValidOwner(var_28_14[iter_28_3].owner_id) and 1 or 3
		end
	end

	local var_28_15 = {
		common_info = {
			hero_list = var_28_14,
			dest = var_28_2,
			activity_id = var_28_0:GetActivityID() or 0,
			battle_times = var_28_3,
			type = var_28_4,
			index = var_28_0:GetServerExtant(),
			cooperate_unique_skill_id = var_28_11,
			cooperate_unique_skill_level = var_28_12,
			battle_vs = LuaForUtil.GetBattleVersion(),
			mimir_info = {
				{
					mimir_id = var_28_0:GetChipManagerID(),
					chip_list = var_28_0:GetChipList()
				}
			}
		},
		chapter_id = arg_28_0
	}
	local var_28_16 = GetOldPlayerExp()

	manager.net:SendWithLoadingNew(54038, var_28_15, 54039, function(arg_29_0, arg_29_1)
		if isSuccess(arg_29_0.result) then
			if arg_28_5 then
				arg_28_5()
			end

			BattleController.GetInstance():SetBattleStageData(var_28_0)
			BattleFieldData:FinishBattle(arg_29_0)

			local var_29_0 = BattleTeamPlayerTemplate.New(arg_29_0.player_info)

			BattleController.GetInstance():UpdateHeroTeam(var_29_0)

			local var_29_1, var_29_2 = CollectHeroExpChange(var_28_0)
			local var_29_3, var_29_4 = var_28_0:GetHeroTeam()
			local var_29_5 = var_28_0:GetSystemHeroTeam()
			local var_29_6 = var_28_0:GetAssistHeroOwnerList()
			local var_29_7 = var_28_0:GetMultiple()
			local var_29_8 = arg_29_0.battle_result
			local var_29_9 = var_29_8.clear_times * GameSetting.mastery_gain.value[1]

			for iter_29_0 = 1, #var_29_3 do
				local var_29_10 = var_28_0:GetHeroDataByPos(iter_29_0)
				local var_29_11 = not var_29_5[iter_29_0] and (var_29_4[iter_29_0] == 0 or table.isEmpty(var_29_4)) and (var_29_6 and (var_29_6[iter_29_0] == "0" or var_29_6[iter_29_0] ~= "0" and var_29_6[iter_29_0] == PlayerData:GetPlayerInfo().userID) or table.isEmpty(var_29_6))

				if var_29_10 and var_29_11 then
					HeroData:HeroClearTimesModify(var_29_3[iter_29_0], var_29_9)

					local var_29_12 = HeroTools.GetHeroOntologyID(var_29_3[iter_29_0])

					ArchiveData:AddExp(var_29_12, GameSetting.hero_love_exp_gain.value[1] * var_29_7)
				end
			end

			HeroAction.UpdateHeartRedPoint()
			HeroAction.UpdateStoryRedPoint()
			HeroAction.UpdateSuperStoryRedPoint()

			local var_29_13 = {}
			local var_29_14 = {}
			local var_29_15 = {}

			for iter_29_1, iter_29_2 in ipairs(arg_29_0.battle_result.all_drop_list) do
				local var_29_16 = {}
				local var_29_17 = {}

				for iter_29_3, iter_29_4 in ipairs(iter_29_2.gain_list) do
					var_29_16[iter_29_3] = {
						id = iter_29_4.id,
						num = iter_29_4.num
					}
				end

				if iter_29_2.extra_list then
					for iter_29_5, iter_29_6 in ipairs(iter_29_2.extra_list) do
						var_29_17[iter_29_5] = {
							id = iter_29_6.id,
							num = iter_29_6.num
						}
					end
				end

				var_29_15[iter_29_1] = {
					battleTimes = iter_29_2.battle_times,
					rewardItems = var_29_16,
					extraReward = var_29_17
				}
			end

			for iter_29_7, iter_29_8 in ipairs(var_29_15) do
				var_29_13[iter_29_8.battleTimes] = {}
				var_29_14[iter_29_8.battleTimes] = {}

				for iter_29_9, iter_29_10 in ipairs(iter_29_8.rewardItems) do
					table.insert(var_29_13[iter_29_8.battleTimes], {
						iter_29_10.id,
						iter_29_10.num
					})
				end

				for iter_29_11, iter_29_12 in ipairs(iter_29_8.extraReward) do
					table.insert(var_29_14[iter_29_8.battleTimes], {
						iter_29_12.id,
						iter_29_12.num
					})
				end
			end

			if var_28_4 == BattleConst.STAGE_TYPE_NEW.ACTIVITY_PT_SCROLL then
				local var_29_18 = ActivityPtRouletteStageCfg[var_28_2].cost[1]

				if var_29_18 and var_29_18 ~= CurrencyConst.CURRENCY_TYPE_VITALITY then
					-- block empty
				else
					ActivityPtScrollData:AddClearTime(var_28_0:GetActivityID(), var_28_0:GetMultiple())
				end

				ActivityPtScrollData:SetClearList(var_28_0:GetActivityID(), var_28_0:GetStageId())
			end

			JumpTools.OpenPageByJump("operationRushAniView", {
				callBack = function()
					JumpTools.Back()
					JumpTools.OpenPageByJump("operationRushResultView", {
						chapterID = arg_28_0,
						destID = var_28_2,
						stageID = arg_28_1,
						rewardList = var_29_13,
						extraReward = var_29_14,
						stageData = var_28_0,
						multiple = var_29_7,
						activityID = arg_28_4,
						battleResult = {
							challengedNumber = var_29_8.clear_times,
							clear_times = var_29_8.clear_times,
							oldPlayerEXPInfo = var_28_16,
							heroDataCollect = var_29_1
						}
					})
				end
			})
			CheckBattleResultNeedAddHeroExp()
		else
			ShowTips(arg_29_0.result)
		end
	end)
end

return var_0_0
