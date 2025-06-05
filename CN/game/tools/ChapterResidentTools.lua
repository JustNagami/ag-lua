local var_0_0 = {}
local var_0_1 = false

function var_0_0.InitRedPoint()
	local var_1_0 = {}
	local var_1_1 = ChapterResidentTools.GetResidentChapterOpenList()

	for iter_1_0, iter_1_1 in pairs(var_1_1) do
		local var_1_2 = ChapterClientCfg[iter_1_1].activity_id
		local var_1_3 = RedPointConst.RESIDENT_ACT .. var_1_2

		manager.redPoint:addGroup(var_1_3, {
			ActivityTools.GetRedPointKey(var_1_2) .. var_1_2,
			RedPointConst.RESIDENT_ACT_NEW_TAG .. var_1_2
		})
		table.insert(var_1_0, var_1_3)
	end

	manager.redPoint:addGroup(RedPointConst.RESIDENT_ACT, var_1_0)
	ChapterResidentTools.SetNewTag()
end

function var_0_0.SetNewTag()
	if JumpTools.IsSystemLocked(ViewConst.SYSTEM_ID.RESIDENT_ACT) then
		return
	end

	if var_0_1 then
		return
	end

	var_0_1 = true

	local var_2_0 = var_0_0.GetResidentChapterOpenList()

	for iter_2_0, iter_2_1 in pairs(var_2_0 or {}) do
		local var_2_1 = ChapterClientCfg[iter_2_1].activity_id

		if not getData("ResidentAct", "NewTag_" .. var_2_1) then
			manager.redPoint:setTip(RedPointConst.RESIDENT_ACT_NEW_TAG .. var_2_1, 1, RedPointStyle.SHOW_NEW_TAG)
		else
			manager.redPoint:setTip(RedPointConst.RESIDENT_ACT_NEW_TAG .. var_2_1, 0, RedPointStyle.SHOW_NEW_TAG)
		end
	end
end

function var_0_0.GetOpenResidentActChapterID()
	local var_3_0 = ChapterResidentTools.GetResidentChapterList()
	local var_3_1

	for iter_3_0, iter_3_1 in pairs(var_3_0) do
		local var_3_2 = ChapterClientCfg[iter_3_1].activity_id
		local var_3_3 = ChapterResidentTools.GetResidentActMainID(var_3_2)

		if ActivityData:GetActivityData(var_3_3).stopTime <= manager.time:GetServerTime() then
			var_3_1 = iter_3_1

			break
		end
	end

	return var_3_1
end

function var_0_0.GetResidentChapterList()
	return ChapterClientCfg.get_id_list_by_toggle[BattleConst.TOGGLE.RESIDENT_ACT]
end

function var_0_0.GetResidentChapterOpenList()
	local var_5_0 = ChapterResidentTools.GetResidentChapterList()
	local var_5_1 = {}

	for iter_5_0, iter_5_1 in pairs(var_5_0) do
		local var_5_2 = ChapterClientCfg[iter_5_1].activity_id
		local var_5_3 = ChapterResidentTools.GetResidentActMainID(var_5_2)

		if ActivityData:GetActivityData(var_5_3).stopTime <= manager.time:GetServerTime() then
			table.insert(var_5_1, iter_5_1)
		end
	end

	return var_5_1
end

function var_0_0.GetResidentActMainID(arg_6_0)
	if ChapterResidentTools.IsResidentActList(arg_6_0) then
		return ActivityCfg.get_id_list_by_sub_activity_list[arg_6_0][1]
	else
		return nil
	end
end

function var_0_0.IsResidentActList(arg_7_0)
	local var_7_0 = ChapterResidentTools.GetResidentChapterList()

	for iter_7_0, iter_7_1 in pairs(var_7_0) do
		if ChapterClientCfg[iter_7_1].activity_id == arg_7_0 then
			return true
		end
	end

	return false
end

function var_0_0.GetResidentMainActTime(arg_8_0)
	local var_8_0 = ChapterResidentTools.GetResidentActMainID(arg_8_0)

	if var_8_0 then
		local var_8_1 = ActivityData:GetActivityData(var_8_0)

		return var_8_1.startTime, var_8_1.stopTime
	else
		return nil, nil
	end
end

function var_0_0.GetResidentActPrafabPath(arg_9_0)
	local var_9_0 = ChapterClientCfg[arg_9_0]

	return "Widget/System/Activity_Theme/Theme_" .. var_9_0.activity_id
end

function var_0_0.GetResidentActProgress(arg_10_0)
	local var_10_0 = 0
	local var_10_1 = 0
	local var_10_2

	if arg_10_0 == ActivityConst.SUMMER_CHESS_BOARD_ENTRY then
		var_10_0 = SummerChessBoardTools.GetChessExploreFinishCnt()
		var_10_1 = GameSetting.summer_chess_board_collect_cnt.value[1]
	elseif arg_10_0 == ActivityConst.ACTIVITY_SKULD_MAIN then
		var_10_0 = ItemTools.getItemNum(CurrencyIdMapCfg.CURRENCY_SKULD_COIN_4_0.item_id)
		var_10_1 = GameSetting.skuld_trust_max.value[1]
	elseif arg_10_0 == ActivityConst.ACTIVITY_QUANZHOU_ENTRY then
		var_10_0, var_10_1 = QWorldBookletTools.GetNdLevelInfo()
		var_10_2 = string.format("%s<size=60>/%s</size>", var_10_0, var_10_1)
	elseif arg_10_0 == ActivityConst.ACTIVITY_OSIRIS_PLAY_GAME then
		var_10_1 = #ActivityPointRewardCfg.get_id_list_by_activity_id[arg_10_0]
		var_10_0 = OsirisPlayGameData:GetNum()
	end

	return var_10_0, var_10_1, var_10_2
end

function var_0_0.GotoResidentActView(arg_11_0)
	if arg_11_0 == ActivityConst.SUMMER_CHESS_BOARD_ENTRY then
		JumpTools.GoToSystem("/summerChessBoardMainEntry")
	elseif arg_11_0 == ActivityConst.ACTIVITY_SKULD_MAIN then
		JumpTools.OpenPageByJump("/skuldSystemEnterView")
	elseif arg_11_0 == ActivityConst.ACTIVITY_QUANZHOU_ENTRY then
		local var_11_0 = QWorldMgr:GetActivityMap(arg_11_0)
		local var_11_1 = SandPlayMapCfg[var_11_0]
		local var_11_2 = var_11_1 and var_11_1.story_id

		if not var_11_2 or var_11_2 == 0 or manager.story:IsStoryPlayed(var_11_2) then
			LaunchQWorld(false, arg_11_0)
		else
			manager.story:StartStoryById(var_11_2, function()
				LaunchQWorld(false, arg_11_0)
			end)
		end
	elseif arg_11_0 == ActivityConst.ACTIVITY_OSIRIS_PLAY_GAME then
		JumpTools.OpenPageByJump("/osirisPlayGameEnterView", {
			activityID_ = arg_11_0
		})
	end
end

function var_0_0.GetResidentActDescTips(arg_13_0)
	local var_13_0

	if arg_13_0 == ActivityConst.SUMMER_CHESS_BOARD_ENTRY then
		var_13_0 = GetTips("ACTIVITY_CHESS_BOARD_DESC")
	elseif arg_13_0 == ActivityConst.ACTIVITY_SKULD_MAIN then
		var_13_0 = GetTips("SKULD_SYSTEM_TIPS_1")
	elseif arg_13_0 == ActivityConst.ACTIVITY_QUANZHOU_ENTRY then
		var_13_0 = GetTips("QUANZHOU_DESC")
	elseif arg_13_0 == ActivityConst.ACTIVITY_OSIRIS_PLAY_GAME then
		var_13_0 = GetTips("ACTIVITY_GENERALITY_DESC")
	end

	return var_13_0
end

function var_0_0.GetResidentActViewClass(arg_14_0)
	if arg_14_0 == ActivityConst.ACTIVITY_SKULD_MAIN then
		return ChapterResidentActSkuldView
	elseif arg_14_0 == ActivityConst.ACTIVITY_QUANZHOU_ENTRY then
		return ChapterResidentActQuanZhouView
	elseif arg_14_0 == ActivityConst.ACTIVITY_OSIRIS_PLAY_GAME then
		return ChapterResidentActOsirisView
	else
		return ChapterResidentActBaseView
	end
end

return var_0_0
