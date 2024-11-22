local var_0_0 = singletonClass("SequentialBattleData")
local var_0_1 = require("cjson")

function var_0_0.Init(arg_1_0)
	arg_1_0.selectChapterID_ = {}
	arg_1_0.chapterData_ = {}
	arg_1_0.cacheChapterData_ = {}
	arg_1_0.sortRewardList_ = {}
end

function var_0_0.InitData(arg_2_0, arg_2_1)
	local var_2_0 = arg_2_1.activity_id

	if arg_2_0.chapterData_[var_2_0] == nil then
		arg_2_0:InitChapterData(var_2_0)
	end

	arg_2_0.chapterData_[var_2_0].historyFinishStage = {}

	for iter_2_0, iter_2_1 in ipairs(arg_2_1.activity_info.finished_stage_list) do
		table.insert(arg_2_0.chapterData_[var_2_0].historyFinishStage, iter_2_1)
	end

	arg_2_0.chapterData_[var_2_0].rewardList = {}

	for iter_2_2, iter_2_3 in ipairs(arg_2_1.activity_info.admitted_reward_list) do
		table.insert(arg_2_0.chapterData_[var_2_0].rewardList, iter_2_3)
	end

	arg_2_0:LoadHeroTeam(var_2_0)
	arg_2_0:SortReward(var_2_0)
end

function var_0_0.InitChapterData(arg_3_0, arg_3_1)
	arg_3_0.chapterData_[arg_3_1] = {
		curFinishStageIndex = 0,
		historyFinishStage = {},
		rewardList = {},
		enabledBuff = {}
	}

	arg_3_0:InitChapteTeamData(arg_3_1)
end

function var_0_0.InitChapteTeamData(arg_4_0, arg_4_1)
	arg_4_0.chapterData_[arg_4_1].team = {}

	for iter_4_0 = 1, #SequentialBattleChapterCfg[arg_4_1].stage_id do
		arg_4_0.chapterData_[arg_4_1].team[iter_4_0] = {
			chipID = 0,
			comboSkillID = 0,
			needRefreshComboSkill = false,
			id = iter_4_0,
			heroList = {},
			chipList = {},
			enabledBuff = {}
		}
	end
end

function var_0_0.GetSelectChapterID(arg_5_0, arg_5_1)
	if arg_5_0.selectChapterID_[arg_5_1] == nil then
		arg_5_0.selectChapterID_[arg_5_1] = getData("SequentialBattle", "activityID" .. arg_5_1) or SequentialBattleChapterCfg.get_id_list_by_main_id[arg_5_1][1]
	end

	return arg_5_0.selectChapterID_[arg_5_1]
end

function var_0_0.SetSelectChapterID(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0.selectChapterID_[arg_6_1] = arg_6_2

	saveData("SequentialBattle", "activityID" .. arg_6_1, arg_6_2)
end

function var_0_0.GetChapterData(arg_7_0, arg_7_1)
	return arg_7_0.chapterData_[arg_7_1]
end

function var_0_0.GetHeroTeam(arg_8_0, arg_8_1, arg_8_2)
	if arg_8_0.chapterData_[arg_8_1] and arg_8_0.chapterData_[arg_8_1].team and arg_8_0.chapterData_[arg_8_1].team[arg_8_2] then
		return arg_8_0.chapterData_[arg_8_1].team[arg_8_2].heroList
	else
		return {}
	end
end

function var_0_0.SaveHeroTeam(arg_9_0, arg_9_1, arg_9_2, arg_9_3, arg_9_4)
	for iter_9_0, iter_9_1 in ipairs(arg_9_3) do
		arg_9_0.chapterData_[arg_9_1].team[arg_9_2].heroList[iter_9_0] = arg_9_0.chapterData_[arg_9_1].team[arg_9_2].heroList[iter_9_0] or {}
		arg_9_0.chapterData_[arg_9_1].team[arg_9_2].heroList[iter_9_0].heroID = iter_9_1
		arg_9_0.chapterData_[arg_9_1].team[arg_9_2].heroList[iter_9_0].trialID = arg_9_4[iter_9_0]
	end
end

function var_0_0.GetHeroTeamData(arg_10_0, arg_10_1)
	return arg_10_0.chapterData_[arg_10_1].team
end

function var_0_0.SetComboSkillID(arg_11_0, arg_11_1, arg_11_2, arg_11_3, arg_11_4)
	arg_11_0.chapterData_[arg_11_1].team[arg_11_2].comboSkillID = arg_11_3
	arg_11_0.chapterData_[arg_11_1].team[arg_11_2].needRefreshComboSkill = arg_11_4
end

function var_0_0.CacheChapterData(arg_12_0, arg_12_1)
	arg_12_0.cacheChapterData_[arg_12_1] = clone(arg_12_0.chapterData_[arg_12_1])
end

function var_0_0.RevertChapterData(arg_13_0, arg_13_1)
	arg_13_0.chapterData_[arg_13_1] = arg_13_0.cacheChapterData_[arg_13_1]
end

function var_0_0.ResetChapterTeamData(arg_14_0, arg_14_1)
	arg_14_0.chapterData_[arg_14_1].curFinishStageIndex = 0
end

function var_0_0.ResetChapterCacheTeamData(arg_15_0, arg_15_1)
	arg_15_0:InitChapteTeamData(arg_15_1)
	arg_15_0:SaveLocalAllTeam(arg_15_1)
end

function var_0_0.IsSameTeamData(arg_16_0, arg_16_1, arg_16_2)
	return table.equal(arg_16_0.chapterData_[arg_16_1].team[arg_16_2], arg_16_0.cacheChapterData_[arg_16_1].team[arg_16_2], "all")
end

function var_0_0.SetChipManagerID(arg_17_0, arg_17_1, arg_17_2, arg_17_3)
	arg_17_0.chapterData_[arg_17_1].team[arg_17_2].chipID = arg_17_3
end

function var_0_0.SetChipList(arg_18_0, arg_18_1, arg_18_2, arg_18_3)
	for iter_18_0, iter_18_1 in ipairs(arg_18_3) do
		if not arg_18_0:InsertChipList(arg_18_1, arg_18_2, iter_18_1) then
			return false
		end
	end

	return true
end

function var_0_0.InsertChipList(arg_19_0, arg_19_1, arg_19_2, arg_19_3)
	local var_19_0 = true
	local var_19_1 = arg_19_0.chapterData_[arg_19_1].team[arg_19_2].chipList
	local var_19_2 = false
	local var_19_3 = 0
	local var_19_4 = ChipCfg[arg_19_3].spec_char
	local var_19_5 = ChipCfg.get_id_list_by_spec_char[var_19_4]

	for iter_19_0, iter_19_1 in ipairs(var_19_1) do
		if ChipCfg[iter_19_1].spec_char ~= 0 and table.keyof(var_19_5, iter_19_1) and iter_19_1 ~= arg_19_3 then
			var_19_2 = true
			var_19_3 = iter_19_1

			break
		end
	end

	local var_19_6 = table.keyof(var_19_1, arg_19_3)

	if not var_19_6 and not var_19_2 and #var_19_1 >= GameSetting.ai_secondary_chip_equip_num.value[1] then
		ShowTips("CHIP_CNT_MORE_THEN_MAX")

		return
	end

	if var_19_2 then
		var_19_0 = false

		local var_19_7 = table.indexof(var_19_1, var_19_3)

		table.remove(var_19_1, var_19_7)
		ShowTips("CHIP_USE_SUCCESS")
		table.insert(var_19_1, arg_19_3)
	elseif var_19_6 then
		ShowTips("CHIP_UNLOAD_SUCCESS")

		local var_19_8 = table.indexof(var_19_1, arg_19_3)

		table.remove(var_19_1, var_19_8)
	else
		table.insert(var_19_1, arg_19_3)
	end

	arg_19_0.chapterData_[arg_19_1].team[arg_19_2].chipList = var_19_1

	manager.notify:Invoke(ENABLED_CHIP)

	return var_19_0
end

function var_0_0.ResetChipManager(arg_20_0, arg_20_1, arg_20_2)
	arg_20_0.chapterData_[arg_20_1].team[arg_20_2].chipList = {}
end

function var_0_0.GetCurrentFinishStageIndex(arg_21_0, arg_21_1)
	return arg_21_0.chapterData_[arg_21_1].curFinishStageIndex
end

function var_0_0.ClearStage(arg_22_0, arg_22_1)
	arg_22_0.chapterData_[arg_22_1].curFinishStageIndex = arg_22_0.chapterData_[arg_22_1].curFinishStageIndex + 1

	local var_22_0 = SequentialBattleChapterCfg[arg_22_1].stage_id[arg_22_0.chapterData_[arg_22_1].curFinishStageIndex]

	if table.keyof(arg_22_0.chapterData_[arg_22_1].historyFinishStage, var_22_0) == nil then
		table.insert(arg_22_0.chapterData_[arg_22_1].historyFinishStage, var_22_0)
	end

	arg_22_0:SortReward(arg_22_1)
end

function var_0_0.SortReward(arg_23_0, arg_23_1)
	local var_23_0 = table.length(arg_23_0.chapterData_[arg_23_1].historyFinishStage)
	local var_23_1 = SequentialBattleChapterCfg[arg_23_1]
	local var_23_2 = {}
	local var_23_3 = {}
	local var_23_4 = {}

	for iter_23_0, iter_23_1 in ipairs(var_23_1.reward_item_list) do
		if table.keyof(arg_23_0.chapterData_[arg_23_1].rewardList, iter_23_0) then
			table.insert(var_23_3, iter_23_0)
		elseif var_23_0 >= iter_23_1[1] then
			table.insert(var_23_2, iter_23_0)
		else
			table.insert(var_23_4, iter_23_0)
		end
	end

	if #var_23_2 > 0 then
		manager.redPoint:setTip(string.format("%s_%s", RedPointConst.SEQUENTIAL_BATTLE_REWARD, arg_23_1), 1)
	else
		manager.redPoint:setTip(string.format("%s_%s", RedPointConst.SEQUENTIAL_BATTLE_REWARD, arg_23_1), 0)
	end

	table.insertto(var_23_2, var_23_4)
	table.insertto(var_23_2, var_23_3)

	arg_23_0.sortRewardList_[arg_23_1] = var_23_2
end

function var_0_0.GetSortRewardList(arg_24_0, arg_24_1)
	if arg_24_0.sortRewardList_[arg_24_1] == nil then
		arg_24_0:SortReward(arg_24_1)
	end

	return arg_24_0.sortRewardList_[arg_24_1]
end

function var_0_0.GetRewadList(arg_25_0, arg_25_1)
	return arg_25_0.chapterData_[arg_25_1].rewardList or {}
end

function var_0_0.ReceiveReward(arg_26_0, arg_26_1, arg_26_2)
	table.insert(arg_26_0.chapterData_[arg_26_1].rewardList, arg_26_2)
	arg_26_0:SortReward(arg_26_1)
end

function var_0_0.GetFinishStageList(arg_27_0, arg_27_1)
	return arg_27_0.chapterData_[arg_27_1].historyFinishStage or {}
end

function var_0_0.LoadHeroTeam(arg_28_0, arg_28_1)
	return
end

function var_0_0.SaveLocalAllTeam(arg_29_0, arg_29_1)
	for iter_29_0 = 1, #SequentialBattleChapterCfg[arg_29_1].stage_id do
		arg_29_0:SaveLocalHeroTeam(arg_29_1, iter_29_0)
	end
end

function var_0_0.SaveLocalHeroTeam(arg_30_0, arg_30_1, arg_30_2)
	return
end

return var_0_0
