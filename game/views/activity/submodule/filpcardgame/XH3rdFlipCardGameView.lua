local var_0_0 = class("XH3rdFlipCardGameView", ReduxView)

GameStatus = {
	GameOver = 4,
	MidPaused = 3,
	Paused = 0,
	Observing = 1,
	Flipping = 2
}

function var_0_0.UIName(arg_1_0)
	return XH3rdFlipCardTool:GetGameUI()
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0.lastGameStatu = nil
	arg_3_0.statusController = ControllerUtil.GetController(arg_3_0.transform_, "status")
	arg_3_0.endController = ControllerUtil.GetController(arg_3_0.transform_, "end")

	arg_3_0:InitUI()
	arg_3_0:AddUIListener()
end

function var_0_0.InitUI(arg_4_0)
	arg_4_0:BindCfgUI()
end

function var_0_0.AddUIListener(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.backBtn_, nil, function()
		local var_6_0 = XH3rdFlipCardTool:GetGameState()

		if var_6_0 == GameStatus.Paused then
			arg_5_0:Back()
			arg_5_0:UnLoadFlipCardScene()
		else
			XH3rdFlipCardTool:ChangeStatus(GameStatus.MidPaused)
			ShowMessageBox({
				title = GetTips("PROMPT"),
				content = GetTips("ACTIVITY_FLIP_CARD_ABANDON"),
				OkCallback = function()
					arg_5_0:Back()

					local var_7_0 = XH3rdFlipCardTool:GetUseTime()
					local var_7_1 = XH3rdFlipCardTool:GetFlipCardCount()

					XH3rdFlipCardAction:sendSettleFlipCardGameRequest(arg_5_0.activityId, false, var_7_0, var_7_1)
					arg_5_0:UnLoadFlipCardScene()
				end,
				CancelCallback = function()
					XH3rdFlipCardTool:ChangeStatus(var_6_0)
				end,
				MaskCallback = function()
					XH3rdFlipCardTool:ChangeStatus(var_6_0)
				end
			})
		end
	end)
	arg_5_0:AddBtnListener(arg_5_0.fastStartBtn_, nil, function()
		XH3rdFlipCardTool:StopObservingCard()
	end)
	arg_5_0:AddBtnListener(arg_5_0.startBtn_, nil, function()
		if arg_5_0.hasSendStartRequest then
			return
		end

		arg_5_0.hasSendStartRequest = true

		XH3rdFlipCardAction:sendStartFlipCardGameRequest(arg_5_0.activityId)
	end)
	arg_5_0:AddBtnListener(arg_5_0.giveUpBtn_, nil, function()
		local var_12_0 = XH3rdFlipCardTool:GetGameState()

		if var_12_0 == GameStatus.GameOver then
			return
		end

		XH3rdFlipCardTool:ChangeStatus(GameStatus.MidPaused)
		ShowMessageBox({
			title = GetTips("PROMPT"),
			content = GetTips("ACTIVITY_FLIP_CARD_ABANDON"),
			OkCallback = function()
				XH3rdFlipCardTool:GiveUp()
			end,
			CancelCallback = function()
				XH3rdFlipCardTool:ChangeStatus(var_12_0)
			end,
			MaskCallback = function()
				XH3rdFlipCardTool:ChangeStatus(var_12_0)
			end
		})
	end)
	arg_5_0:AddBtnListener(arg_5_0.clueBtn_, nil, function()
		JumpTools.OpenPageByJump("xH3rdFlipCardClue", {
			activityID = arg_5_0.activityId
		})
	end)
	arg_5_0:AddBtnListener(arg_5_0.rewardBtn_, nil, function()
		JumpTools.OpenPageByJump("xH3rdFlipCardReward", {
			activityID = arg_5_0.activityId
		})
	end)
	arg_5_0:AddBtnListener(arg_5_0.mask_, nil, function()
		local var_18_0 = XH3rdFlipCardTool:GetIsSuccess()

		XH3rdFlipCardTool:ResetGame()

		if var_18_0 then
			arg_5_0:ResetAnimator(arg_5_0.successAni_, "Fx_success_cx")
		else
			arg_5_0:ResetAnimator(arg_5_0.failAni_, "Fx_fail_cx")
		end
	end)
	arg_5_0:AddBtnListener(arg_5_0.tokenBtn_, nil, function()
		ShowPopItem(POP_SOURCE_ITEM, {
			FlipCardCfg[arg_5_0.activityId].cost_id,
			0
		})
	end)
end

function var_0_0.OnEnter(arg_20_0)
	arg_20_0.activityId = arg_20_0.params_.activityId
	arg_20_0.hasSendStartRequest = false

	local var_20_0 = ActivityData:GetActivityData(arg_20_0.activityId)

	arg_20_0.startTime_ = var_20_0.startTime
	arg_20_0.stopTime_ = var_20_0.stopTime

	XH3rdFlipCardTool:LoadScene(arg_20_0.activityId, var_0_0:OnSceneLoaded())
	arg_20_0:RefreshPausedStateUI()
	arg_20_0:AddTimer()

	arg_20_0.refreshHandler_ = handler(arg_20_0, arg_20_0.RefreshGameOverStateUI)

	arg_20_0:SetUIText()
	manager.notify:RegistListener(FLIP_CARD_GAME_RESULT, arg_20_0.refreshHandler_)
	manager.notify:RegistListener(FLIP_CARD_START_GAME_RESULT, function()
		arg_20_0.hasSendStartRequest = false
	end)
	manager.redPoint:bindUIandKey(arg_20_0.rewardBtnTrans_, string.format("%s_%s_mainTask", RedPointConst.ACTIVITY_2_2_FLIP_CARD, arg_20_0.activityId))
	manager.redPoint:bindUIandKey(arg_20_0.clueBtnTrans_, string.format("%s_%s_clue", RedPointConst.ACTIVITY_2_2_FLIP_CARD, arg_20_0.activityId))
end

function var_0_0.AddTimer(arg_22_0)
	arg_22_0:StopTimer()

	arg_22_0.stateTimer_ = Timer.New(function()
		arg_22_0:CheckGameStatus()
	end, 0.1, -1, true)

	arg_22_0.stateTimer_:Start()

	arg_22_0.remainTimeText_.text = GetTips("REMAINING_TIME") .. manager.time:GetLostTimeStr2(arg_22_0.stopTime_, nil, true)
	arg_22_0.timer_ = Timer.New(function()
		if manager.time:GetServerTime() > arg_22_0.stopTime_ then
			return
		end

		arg_22_0.remainTimeText_.text = GetTips("REMAINING_TIME") .. manager.time:GetLostTimeStr2(arg_22_0.stopTime_, nil, true)
	end, 1, -1)

	arg_22_0.timer_:Start()
end

function var_0_0.StopTimer(arg_25_0)
	if arg_25_0.timer_ then
		arg_25_0.timer_:Stop()

		arg_25_0.timer_ = nil
	end

	if arg_25_0.stateTimer_ then
		arg_25_0.stateTimer_:Stop()

		arg_25_0.stateTimer_ = nil
	end
end

function var_0_0.ResetAnimator(arg_26_0, arg_26_1, arg_26_2)
	arg_26_1:Play(arg_26_2, 0, 0)
	arg_26_1:Update(0)

	arg_26_1.enabled = false
end

function var_0_0.OnSceneLoaded(arg_27_0)
	arg_27_0.sceneLoaded_ = true
end

function var_0_0.SetUIText(arg_28_0)
	local var_28_0 = XH3rdFlipCardTool:GetGameState()

	if var_28_0 == GameStatus.Observing then
		arg_28_0.timeTitleText_.text = GetTips("ACTIVITY_FLIP_CARD_TIME_NAME_1")
	elseif var_28_0 == GameStatus.Flipping then
		arg_28_0.timeTitleText_.text = GetTips("ACTIVITY_FLIP_CARD_TIME_NAME_2")
	end
end

function var_0_0.CheckGameStatus(arg_29_0)
	local var_29_0 = XH3rdFlipCardTool:GetGameState()

	if var_29_0 ~= GameStatus.Observing and arg_29_0.startTimeTimer then
		arg_29_0.startTimeTimer:Stop()

		arg_29_0.startTimeTimer = nil
	end

	if var_29_0 == GameStatus.Observing then
		arg_29_0.leftTimeText_.text = XH3rdFlipCardTool:GetObservingLeftTime()
	elseif var_29_0 == GameStatus.Flipping then
		if not arg_29_0.isShowStartTips then
			SetActive(arg_29_0.startPopImg_, true)
			manager.audio.PlayEffect("minigame_activity_2_2", "minigame_activity_2_2_flip_start_auto")

			arg_29_0.isShowStartTips = true
			arg_29_0.showTimer = Timer.New(function()
				SetActive(arg_29_0.startPopImg_, false)

				arg_29_0.showTimer = nil
			end, 0.6, 1, true)

			arg_29_0.showTimer:Start()
		end

		arg_29_0.leftTimeText_.text = XH3rdFlipCardTool:GetFlippingLeftTime()
	end

	if arg_29_0.lastGameStatu ~= var_29_0 then
		if var_29_0 == GameStatus.GameOver then
			local var_29_1 = XH3rdFlipCardTool.GetIsSuccess()
			local var_29_2 = XH3rdFlipCardTool:GetUseTime()
			local var_29_3 = XH3rdFlipCardTool:GetFlipCardCount()

			XH3rdFlipCardAction:sendSettleFlipCardGameRequest(arg_29_0.activityId, var_29_1, var_29_2, var_29_3)
		elseif var_29_0 == GameStatus.Observing then
			arg_29_0.startTimeTimer = Timer.New(function()
				local var_31_0 = XH3rdFlipCardTool:GetObservingLeftTime()

				if XH3rdFlipCardTool:GetGameState() ~= GameStatus.Observing then
					arg_29_0.startTimeTimer:Stop()

					arg_29_0.startTimeTimer = nil

					return
				end

				if var_31_0 >= 1 then
					manager.audio:PlayEffect("minigame_activity_2_2", "minigame_activity_2_2_flip_time01")
				elseif var_31_0 < 1 then
					manager.audio:PlayEffect("minigame_activity_2_2", "minigame_activity_2_2_flip_time02")
					arg_29_0.startTimeTimer:Stop()

					arg_29_0.startTimeTimer = nil
				end
			end, 1, -1, true)

			arg_29_0.startTimeTimer:Start()
		elseif var_29_0 == GameStatus.Paused then
			manager.audio:PlayEffect("minigame_activity_2_2", "minigame_activity_2_2_flip_enter", "")
			arg_29_0:RefreshPausedStateUI()

			arg_29_0.isShowStartTips = false
		elseif var_29_0 == GameStatus.Flipping then
			-- block empty
		end

		arg_29_0:SetUIText()
		arg_29_0.statusController:SetSelectedIndex(var_29_0)

		arg_29_0.lastGameStatu = var_29_0
	end
end

function var_0_0.RefreshPausedStateUI(arg_32_0)
	local var_32_0 = #XH3rdFlipCardData:GetClueList(arg_32_0.activityId)
	local var_32_1 = #FlipCardCfg[arg_32_0.activityId].details

	arg_32_0.clueText_.text = string.format(GetTips("ACTIVITY_FLIP_CARD_CLUE_COLLECTION_PROGRESS"), var_32_0, var_32_1)

	local var_32_2 = FlipCardCfg[arg_32_0.activityId].cost_id

	arg_32_0.tokenImg_.sprite = ItemTools.getItemSprite(var_32_2)
	arg_32_0.startItemImg_.sprite = ItemTools.getItemSprite(var_32_2)
	arg_32_0.tokenNumberText_.text = ItemTools.getItemNum(var_32_2)

	SetActive(arg_32_0.successGo_, false)
	SetActive(arg_32_0.failGo_, false)
end

function var_0_0.RefreshGameOverStateUI(arg_33_0, arg_33_1)
	if XH3rdFlipCardTool.GetIsSuccess() then
		arg_33_0.successContentText_.text = GetTips("ACTIVITY_FLIP_CARD_SUCCESS_TIPS_1")
		arg_33_0.successClueText_.text = GetTips("ACTIVITY_FLIP_CARD_SUCCESS_TIPS_2")
		arg_33_0.useTimeText_.text = string.format(GetTips("ACTIVITY_FLIP_CARD_TIME_COST"), XH3rdFlipCardTool:GetUseTime())
		arg_33_0.successAni_.enabled = true

		manager.audio:PlayEffect("minigame_activity_2_2", "minigame_activity_2_2_flip_success")

		if arg_33_1 ~= 0 then
			SetActive(arg_33_0.successGo_, true)
			SetActive(arg_33_0.successClueGo_, true)
		else
			SetActive(arg_33_0.successGo_, true)
			SetActive(arg_33_0.successClueGo_, false)
		end
	else
		manager.audio:PlayEffect("minigame_activity_2_2", "minigame_activity_2_2_flip_fail")

		arg_33_0.loseContentText_.text = GetTips("ACTIVITY_FLIP_CARD_FAIL_TIPS")
		arg_33_0.failAni_.enabled = true

		SetActive(arg_33_0.failGo_, true)
	end
end

function var_0_0.UnLoadFlipCardScene(arg_34_0)
	arg_34_0.sceneLoaded_ = false

	manager.ui:ResetMainCamera()

	manager.ui.mainCameraCom_.orthographic = false

	XH3rdFlipCardTool:UnLoadScene()
end

function var_0_0.OnExit(arg_35_0)
	arg_35_0:StopTimer()
	manager.notify:RemoveListener(FLIP_CARD_GAME_RESULT, arg_35_0.refreshHandler_)
	manager.notify:RemoveListener(FLIP_CARD_START_GAME_RESULT, function()
		arg_35_0.hasSendStartRequest = false
	end)

	if arg_35_0.startTimeTimer then
		arg_35_0.startTimeTimer:Stop()

		arg_35_0.startTimeTimer = nil
	end

	arg_35_0.refreshHandler_ = nil

	manager.redPoint:unbindUIandKey(arg_35_0.rewardBtnTrans_, string.format("%s_%s_mainTask", RedPointConst.ACTIVITY_2_2_FLIP_CARD, arg_35_0.activityId))
	manager.redPoint:unbindUIandKey(arg_35_0.clueBtnTrans_, string.format("%s_%s_clue", RedPointConst.ACTIVITY_2_2_FLIP_CARD, arg_35_0.activityId))
end

return var_0_0
