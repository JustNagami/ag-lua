local var_0_0 = {
	GetBossChallengeNextIndex = function(arg_1_0)
		local var_1_0 = BattleBossChallengeNormalData:GetFinishIndex(arg_1_0)
		local var_1_1 = BattleBossChallengeNormalData:GetBossChallengeCfg()

		if var_1_0 > var_1_1.level_amount then
			return var_1_1.level_amount
		end

		return var_1_0
	end
}

function var_0_0.GetAutoChapter(arg_2_0, arg_2_1)
	if BattleStageData:GetStageData()[arg_2_1].clear_times == 1 then
		return var_0_0.GetNextChapter(arg_2_0, arg_2_1)
	end

	return arg_2_0
end

function var_0_0.GetNextChapter(arg_3_0, arg_3_1)
	local var_3_0 = ChapterCfg[arg_3_0]
	local var_3_1 = var_3_0.section_id_list

	if var_3_1[#var_3_1] == arg_3_1 then
		local var_3_2 = getChapterListByDifficulty(var_3_0.type, var_3_0.difficulty)
		local var_3_3 = table.keyof(var_3_2, arg_3_0)

		if var_3_3 < #var_3_2 then
			local var_3_4 = var_3_2[var_3_3 + 1]

			if ChapterTools.IsFinishPreChapter(var_3_4) and ChapterTools.IsUnlockChapter(var_3_4) then
				return var_3_4
			end
		end
	end

	return arg_3_0
end

function var_0_0.GetChapterNextStageID(arg_4_0, arg_4_1)
	local var_4_0 = ChapterCfg[arg_4_0].section_id_list
	local var_4_1 = table.keyof(var_4_0, arg_4_1)

	if var_4_1 < #var_4_0 then
		local var_4_2 = var_4_0[var_4_1 + 1]

		if var_4_2 == GameSetting.travel_skuld_new_ending_stage_id.value[1] and BattleStageData:GetStageData()[var_4_2].clear_times < 1 then
			return
		end

		return var_4_2
	end
end

function var_0_0.GetActivityStoryNextStageID(arg_5_0, arg_5_1)
	local var_5_0 = ActivityStoryChapterCfg[arg_5_0].activity_id
	local var_5_1 = ActivityData:GetActivityData(var_5_0)
	local var_5_2 = manager.time:GetServerTime()

	if var_5_2 < var_5_1.startTime or var_5_2 > var_5_1.stopTime then
		return
	end

	if var_5_0 == ActivityConst.OSIRIS_STROY then
		return var_0_0.GetOsirisNextStage(arg_5_0, arg_5_1)
	end
end

function var_0_0.GetOsirisNextStage(arg_6_0, arg_6_1, arg_6_2)
	if StoryStageActivityData:GetStageData(arg_6_1)[arg_6_2] then
		local var_6_0

		for iter_6_0, iter_6_1 in pairs(GameSetting.activity_plot_unlock.value) do
			if iter_6_1[1][1] == arg_6_1 and iter_6_1[1][2] == arg_6_2 then
				var_6_0 = iter_6_1[2][1]
			end
		end

		local var_6_1 = 100

		if var_6_0 then
			var_6_1 = ChessTools.GetChapterProgress(var_6_0)
		end

		if var_6_1 < 100 then
			return
		end

		local var_6_2 = ActivityStoryChapterCfg[arg_6_1].stage_list
		local var_6_3 = table.keyof(var_6_2, arg_6_2)

		if var_6_3 < #var_6_2 then
			return var_6_2[var_6_3 + 1]
		end
	end
end

function var_0_0.CalcBossChallengeStar()
	local var_7_0 = 0

	for iter_7_0, iter_7_1 in pairs(BattleBossChallengeNormalData:GetThreeStarList()) do
		for iter_7_2, iter_7_3 in ipairs(iter_7_1) do
			if iter_7_3 == 1 then
				var_7_0 = var_7_0 + 1
			end
		end
	end

	return var_7_0
end

function var_0_0.NeedShowContinueBattleWindow(arg_8_0, arg_8_1)
	local var_8_0 = BattleStageTools.GetStageCfg(arg_8_0, arg_8_1)

	if var_8_0.auto_next_stage_group == 0 then
		return false
	end

	local var_8_1, var_8_2 = var_0_0.GetContinueBattleCost(arg_8_0, arg_8_1)

	if var_8_2 <= 1 then
		return false
	end

	if var_8_0.auto_next_stage_group <= 10 then
		return true
	else
		local var_8_3 = var_8_1[1].id

		if ItemTools.getItemNum(var_8_3) < var_8_1[1].num then
			return true
		end
	end

	return false
end

function var_0_0.GetContinueBattleCost(arg_9_0, arg_9_1)
	local var_9_0 = var_0_0.GetContinueBattleStageList(arg_9_0, arg_9_1)
	local var_9_1 = {}
	local var_9_2 = BattleStageTools.GetStageCfg(arg_9_0, arg_9_1)

	if type(var_9_2.extra_cost) == "table" and var_9_2.extra_cost[1] then
		table.insert(var_9_1, {
			var_9_2.extra_cost[1],
			0
		})
	else
		table.insert(var_9_1, {
			CurrencyConst.CURRENCY_TYPE_VITALITY,
			0
		})
	end

	for iter_9_0, iter_9_1 in ipairs(var_9_0) do
		local var_9_3 = BattleStageData:GetStageData()[iter_9_1]
		local var_9_4 = BattleStageTools.GetStageCfg(arg_9_0, iter_9_1)

		if not var_9_3 or not (var_9_3.clear_times > 0) then
			if type(var_9_4.extra_cost) == "table" and var_9_4.extra_cost[1] then
				table.insert(var_9_1, clone(var_9_4.extra_cost))
			else
				table.insert(var_9_1, {
					CurrencyConst.CURRENCY_TYPE_VITALITY,
					var_9_4.cost
				})
			end
		end
	end

	local var_9_5 = formatRewardCfgList(var_9_1)

	return mergeReward(var_9_5), #var_9_0
end

function var_0_0.GetContinueBattleStageList(arg_10_0, arg_10_1)
	local var_10_0 = BattleStageTools.GetStageCfg(arg_10_0, arg_10_1)
	local var_10_1 = arg_10_1
	local var_10_2 = {}
	local var_10_3 = var_10_0.auto_next_stage_group

	while var_10_3 ~= 0 and var_10_0.auto_next_stage_group == var_10_3 do
		table.insert(var_10_2, var_10_1)

		local var_10_4 = getChapterIDByStageID(var_10_1)

		var_10_1 = var_0_0.GetChapterNextStageID(var_10_4, var_10_1)

		if var_10_1 then
			var_10_0 = BattleStageTools.GetStageCfg(arg_10_0, var_10_1)
		else
			break
		end
	end

	return var_10_2
end

function var_0_0.HasStageCost(arg_11_0, arg_11_1)
	local var_11_0 = BattleStageTools.GetStageCfg(arg_11_0, arg_11_1)
	local var_11_1 = BattleStageData:GetStageData()[arg_11_1]
	local var_11_2 = 0
	local var_11_3 = ItemTools.getItemNum(CurrencyConst.CURRENCY_TYPE_VITALITY)

	if not var_11_1 or not (var_11_1.clear_times > 0) then
		if type(var_11_0.extra_cost) == "table" and var_11_0.extra_cost[1] then
			return ItemTools.getItemNum(var_11_0.extra_cost[1]) >= var_11_0.extra_cost[2]
		else
			return var_11_3 >= var_11_0.cost
		end
	end

	return true
end

function var_0_0.IsLockStage(arg_12_0, arg_12_1)
	if not ChapterTools.IsFinishPreChapter(arg_12_0) then
		return true
	end

	if arg_12_1 then
		local var_12_0 = BattleStageTools.GetStageCfg(ChapterCfg[arg_12_0].type, arg_12_1)

		if not ActivityData:GetActivityIsOpen(ChapterCfg[arg_12_0].activity_id) then
			return PlayerData:GetPlayerInfo().userLevel < var_12_0.level
		end
	end

	return false
end

function var_0_0.IsLockSubChapterStage(arg_13_0, arg_13_1)
	local var_13_0 = false

	for iter_13_0, iter_13_1 in pairs(GameSetting.sub_plot_unlock.value) do
		if iter_13_1[1][1] == arg_13_0 and iter_13_1[1][2] == arg_13_1 then
			for iter_13_2, iter_13_3 in ipairs(iter_13_1[2]) do
				if ChessTools.GetChapterProgress(iter_13_3) < 100 then
					return true
				end
			end

			return false
		end
	end

	return false
end

function var_0_0.GetStageArchiveID(arg_14_0)
	local var_14_0 = StageArchiveCfg.get_id_list_by_unlock_by_stage_id[arg_14_0]

	if var_14_0 then
		return var_14_0[1]
	else
		return 0
	end
end

return var_0_0
