local var_0_0 = {}
local var_0_1 = false

function var_0_0.Init()
	if var_0_1 then
		return
	end

	var_0_1 = true

	manager.net:Bind(77001, function(arg_2_0)
		if arg_2_0.phase == 1 then
			manager.notify:CallUpdateFunc(ACTIVITY_QUIZ_START_GAME)
			QuizSetGameStartArgs(arg_2_0)
			QuizPendingAddPlayers(arg_2_0.player_list)
			LoadQuizScene()
		elseif arg_2_0.phase == 2 then
			QuizGameManager:OnShowPrologue(arg_2_0)
		elseif arg_2_0.phase == 3 then
			QuizGameManager:OnShowQuestion(arg_2_0)
		elseif arg_2_0.phase == 4 then
			QuizGameManager:OnQuestionResult(arg_2_0)
		elseif arg_2_0.phase == 5 then
			QuizGameManager:OnGameEnd(arg_2_0)
		end
	end)
	manager.net:Bind(77003, function(arg_3_0)
		for iter_3_0, iter_3_1 in ipairs(arg_3_0.player_list) do
			if iter_3_1.gesture_id ~= 0 then
				QuizGameManager:SyncRemoteGesture(iter_3_1.uid, iter_3_1.gesture_id)
			end

			if iter_3_1.role_id ~= 0 then
				QuizGameManager:SyncRemoteRole(iter_3_1.uid, iter_3_1.role_id)
			end

			if iter_3_1.emoji_id ~= 0 then
				QuizGameManager:SyncRemoteEmoji(iter_3_1.uid, iter_3_1.emoji_id)
			end

			QuizGameManager:SyncRemotePlayerPos(iter_3_1.uid, iter_3_1.pos)
		end
	end)
	manager.net:Bind(77005, function(arg_4_0)
		if GetQuizSceneLoaded() ~= 2 then
			QuizPendingAddPlayers(arg_4_0.infos)
		else
			QuizGameManager:AddPlayers(arg_4_0.infos)
		end
	end)
	manager.net:Bind(77007, function(arg_5_0)
		QuizGameManager:RemovePlayers(arg_5_0.uids)
	end)
end

function var_0_0.InitRedPointKey(arg_6_0)
	local var_6_0 = {}
	local var_6_1 = ActivityQuizTools.GetTaskActivityID(arg_6_0)
	local var_6_2 = ActivityCfg[var_6_1].sub_activity_list

	for iter_6_0, iter_6_1 in ipairs(var_6_2) do
		table.insert(var_6_0, RedPointConst.ACTIVITY_TASK .. "_" .. iter_6_1)
	end

	local var_6_3 = ActivityTools.GetRedPointKey(arg_6_0) .. arg_6_0

	manager.redPoint:addGroup(RedPointConst.ACTIVITY_TASK .. "_" .. var_6_1, var_6_0)
	manager.redPoint:addGroup(var_6_3, {
		RedPointConst.ACTIVITY_TASK .. "_" .. var_6_1
	})
	ActivityQuizAction.RefreshRedPoint(arg_6_0)
end

function var_0_0.StartMarch()
	manager.net:SendWithLoadingNew(77100, {}, 77101, var_0_0.OnStartMarch)
end

function var_0_0.OnStartMarch(arg_8_0, arg_8_1)
	if isSuccess(arg_8_0.result) then
		manager.notify:CallUpdateFunc(ACTIVITY_QUIZ_START_MATCH)
	else
		ShowTips(arg_8_0.result)
	end
end

function var_0_0.CancelMarch()
	manager.net:SendWithLoadingNew(77102, {}, 77103, var_0_0.OnCancelMarch)
end

function var_0_0.OnCancelMarch(arg_10_0, arg_10_1)
	if isSuccess(arg_10_0.result) then
		manager.notify:CallUpdateFunc(ACTIVITY_QUIZ_CANCEL_MATCH)
	else
		ShowTips(arg_10_0.result)
	end
end

function var_0_0.ExitRoom()
	manager.net:SendWithLoadingNew(77104, {}, 77105, var_0_0.OnExitRoom)
end

function var_0_0.OnExitRoom(arg_12_0, arg_12_1)
	if isSuccess(arg_12_0.result) then
		QuitQuizScene()
	else
		ShowTips(arg_12_0.result)
	end
end

function var_0_0.ChangeHero(arg_13_0)
	manager.net:SendWithLoadingNew(77106, {
		role_id = arg_13_0
	}, 77107, var_0_0.OnChangeHero)
end

function var_0_0.OnChangeHero(arg_14_0, arg_14_1)
	if isSuccess(arg_14_0.result) then
		local var_14_0 = QuizGameManager.localPlayerId

		QuizGameManager:ChangePlayerModel(var_14_0, arg_14_1.role_id)
		manager.notify:CallUpdateFunc(ACTIVITY_QUIZ_CHANGE_HERO)
	else
		ShowTips(arg_14_0.result)
	end
end

function var_0_0.PushPosition(arg_15_0, arg_15_1, arg_15_2)
	local var_15_0 = {
		x = arg_15_0,
		z = arg_15_1,
		choose = arg_15_2
	}

	manager.net:Push(77108, {
		pos = var_15_0
	})
end

function var_0_0.OnPushPosition(arg_16_0, arg_16_1)
	if isSuccess(arg_16_0.result) then
		-- block empty
	else
		ShowTips(arg_16_0.result)
	end
end

function var_0_0.RefreshRedPoint(arg_17_0)
	local var_17_0 = ActivityData:GetActivityData(arg_17_0)

	if not var_17_0 or not var_17_0:IsActivitying() then
		return
	end

	local var_17_1 = getData("activity_quiz_enter", tostring(arg_17_0)) or 0

	if manager.time:IsToday(var_17_1) then
		return
	end

	ActivityTools.ClearActivityTimer(arg_17_0)
	ActivityTools.CreateActivityTimer(arg_17_0, function()
		local var_18_0 = getData("activity_quiz_enter", tostring(arg_17_0)) or 0
		local var_18_1 = manager.time:IsToday(var_18_0)

		if ActivityTools.GetActivityStatus(arg_17_0) == ActivityConst.ACTIVITY_STATE.OVER then
			return
		end

		if var_18_1 then
			ActivityTools.ClearActivityTimer(arg_17_0)

			return
		end

		if ActivityQuizTools.IsInOpenTimeSpan(arg_17_0) and gameContext:GetLastOpenPage() == "qworldMainHome" then
			ActivityQuizTools.HintActivityOpen(arg_17_0)
		end
	end)
end

return var_0_0
