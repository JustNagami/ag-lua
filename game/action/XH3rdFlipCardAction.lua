local var_0_0 = {}

manager.net:Bind(68001, function(arg_1_0)
	XH3rdFlipCardData:OnReceiveFlipCardData(arg_1_0)
end)

function var_0_0.sendStartFlipCardGameRequest(arg_2_0, arg_2_1)
	local var_2_0 = {
		activity_id = arg_2_1
	}

	manager.net:SendWithLoadingNew(68002, var_2_0, 68003, handler(var_0_0, var_0_0.handleStartFlipCardGameResult))
end

function var_0_0.handleStartFlipCardGameResult(arg_3_0, arg_3_1, arg_3_2)
	if isSuccess(arg_3_1.result) then
		XH3rdFlipCardTool:StartGame()
		manager.audio:PlayEffect("minigame_activity_2_2", "minigame_activity_2_2_flip_start", "")
	else
		local var_3_0 = XH3rdFlipCardData:GetActivityID()
		local var_3_1 = ItemCfg[FlipCardCfg[var_3_0].cost_id].name

		ShowTips(string.format(GetTips("ACTIVITY_FLIP_CARD_COIN_NOT_ENOUGH"), GetI18NText(var_3_1)))
	end

	manager.notify:Invoke(FLIP_CARD_START_GAME_RESULT)
end

function var_0_0.sendSettleFlipCardGameRequest(arg_4_0, arg_4_1, arg_4_2, arg_4_3, arg_4_4)
	local var_4_0 = {
		activity_id = arg_4_1,
		is_success = arg_4_2,
		use_seconds = arg_4_3,
		pairing_times = arg_4_4
	}

	manager.net:SendWithLoadingNew(68004, var_4_0, 68005, handler(var_0_0, var_0_0.handleSettleFlipCardGameResult))
end

function var_0_0.handleSettleFlipCardGameResult(arg_5_0, arg_5_1, arg_5_2)
	if arg_5_2.is_success then
		XH3rdFlipCardAction.UpdateTokenRedPoint()
	end

	if arg_5_1.clue_id ~= 0 then
		XH3rdFlipCardData:UpdateClueData(arg_5_1.clue_id)
	end

	manager.notify:Invoke(FLIP_CARD_GAME_RESULT, arg_5_1.clue_id)
end

function var_0_0.sendViewClueRequest(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = {
		activity_id = arg_6_1,
		clue_id = arg_6_2
	}

	manager.net:SendWithLoadingNew(68006, var_6_0, 68007, handler(var_0_0, var_0_0.handleViewClueResult))
end

function var_0_0.handleViewClueResult(arg_7_0, arg_7_1, arg_7_2)
	if isSuccess(arg_7_1.result) then
		XH3rdFlipCardData:UpdateClueData(arg_7_2.clue_id)
		manager.notify:Invoke(FLIP_CARD_VIEW_CLUE_RESULT, arg_7_2.clue_id)
	else
		ShowTips(GetTips(arg_7_1.result))
	end
end

function var_0_0.InitRedPointKey(arg_8_0, arg_8_1)
	var_0_0.mainActivityId = arg_8_1
	var_0_0.hasEnterGame = false

	local var_8_0 = string.format
	local var_8_1 = RedPointConst.ACTIVITY_2_2_FLIP_CARD
	local var_8_2 = var_8_0("%s_%s", var_8_1, arg_8_1)
	local var_8_3 = var_8_0("%s_%s_subTask", var_8_1, arg_8_1)
	local var_8_4 = var_8_0("%s_%s_mainTask", var_8_1, arg_8_1)
	local var_8_5 = var_8_0("%s_%s_challenge", var_8_1, arg_8_1)
	local var_8_6 = var_8_0("%s_%s_token", var_8_1, arg_8_1)
	local var_8_7 = var_8_0("%s_%s_clue", var_8_1, arg_8_1)

	manager.redPoint:addGroup(var_8_5, {
		var_8_4,
		var_8_6,
		var_8_7
	})
	manager.redPoint:addGroup(var_8_2, {
		var_8_3,
		var_8_5
	})

	local var_8_8 = FlipCardCfg[arg_8_1].details
	local var_8_9 = {}

	for iter_8_0, iter_8_1 in pairs(var_8_8) do
		local var_8_10 = string.format("%s_%s_%s_clue", RedPointConst.ACTIVITY_2_2_FLIP_CARD, arg_8_1, iter_8_1)

		var_8_9[#var_8_9 + 1] = var_8_10
	end

	manager.redPoint:addGroup(string.format("%s_%s_clue", RedPointConst.ACTIVITY_2_2_FLIP_CARD, arg_8_1), var_8_9)
	manager.notify:RegistListener(OSIRIS_TASK_UPDATE, function()
		var_0_0.UpdateRedPoint()
	end)
	manager.notify:RegistListener(CURRENCY_UPDATE, function()
		var_0_0.UpdateTokenRedPoint()
	end)
	var_0_0.UpdateSubTaskRedPoint()
	var_0_0.UpdateMainTaskRedPoint()
	var_0_0.UpdateTokenRedPoint()
end

function var_0_0.UpdateRedPoint()
	var_0_0.UpdateSubTaskRedPoint()
	var_0_0.UpdateMainTaskRedPoint()
end

function var_0_0.UpdateSubTaskRedPoint()
	local var_12_0 = var_0_0.mainActivityId
	local var_12_1 = ActivityCfg[var_12_0].sub_activity_list[1]
	local var_12_2 = TaskData2:GetActivityTaskSortList(var_12_1)

	for iter_12_0, iter_12_1 in ipairs(var_12_2) do
		local var_12_3 = AssignmentCfg[iter_12_1.id]

		if iter_12_1.progress >= var_12_3.need and iter_12_1.complete_flag < 1 then
			manager.redPoint:setTip(string.format("%s_%s_subTask", RedPointConst.ACTIVITY_2_2_FLIP_CARD, var_12_0), 1)

			return
		end
	end

	manager.redPoint:setTip(string.format("%s_%s_subTask", RedPointConst.ACTIVITY_2_2_FLIP_CARD, var_12_0), 0)
end

function var_0_0.UpdateClueRedPoint()
	local var_13_0 = var_0_0.mainActivityId
	local var_13_1 = FlipCardCfg[var_13_0].details

	for iter_13_0, iter_13_1 in pairs(var_13_1) do
		local var_13_2 = XH3rdFlipCardData:CheckClueIsGetted(iter_13_1)
		local var_13_3 = XH3rdFlipCardData:CheckClueIsViewed(iter_13_1)

		if var_13_2 and not var_13_3 then
			manager.redPoint:setTip(string.format("%s_%s_%s_clue", RedPointConst.ACTIVITY_2_2_FLIP_CARD, var_13_0, iter_13_1), 1)
		else
			manager.redPoint:setTip(string.format("%s_%s_%s_clue", RedPointConst.ACTIVITY_2_2_FLIP_CARD, var_13_0, iter_13_1), 0)
		end
	end
end

function var_0_0.UpdateMainTaskRedPoint()
	local var_14_0 = var_0_0.mainActivityId
	local var_14_1 = TaskData2:GetActivityTaskSortList(var_14_0)

	for iter_14_0, iter_14_1 in ipairs(var_14_1) do
		local var_14_2 = AssignmentCfg[iter_14_1.id]

		if iter_14_1.progress >= var_14_2.need and iter_14_1.complete_flag < 1 then
			manager.redPoint:setTip(string.format("%s_%s_mainTask", RedPointConst.ACTIVITY_2_2_FLIP_CARD, var_14_0), 1)

			return
		end
	end

	manager.redPoint:setTip(string.format("%s_%s_mainTask", RedPointConst.ACTIVITY_2_2_FLIP_CARD, var_14_0), 0)
end

function var_0_0.UpdateTokenRedPoint()
	local var_15_0 = var_0_0.mainActivityId
	local var_15_1 = FlipCardCfg[var_15_0].cost_id

	if ItemTools.getItemNum(var_15_1) > 0 and not var_0_0.hasEnterGame then
		manager.redPoint:setTip(string.format("%s_%s_token", RedPointConst.ACTIVITY_2_2_FLIP_CARD, var_15_0), 1)
	else
		manager.redPoint:setTip(string.format("%s_%s_token", RedPointConst.ACTIVITY_2_2_FLIP_CARD, var_15_0), 0)
	end
end

return var_0_0
