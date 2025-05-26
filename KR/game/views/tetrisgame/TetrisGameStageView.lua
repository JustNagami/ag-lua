local var_0_0 = class("TetrisGameStageView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/BackHouseUI/TetrisGame/TetrisGamePlayUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:InitUI()
end

function var_0_0.InitUI(arg_4_0)
	arg_4_0:BindCfgUI()
	arg_4_0:AddUIListener()

	arg_4_0.rotateController = arg_4_0.controller:GetController("canRotate")
	arg_4_0.skillController = arg_4_0.controller:GetController("skill")
	arg_4_0.roundController = arg_4_0.controller:GetController("round")
	arg_4_0.machineController = arg_4_0.controller:GetController("machine")
	arg_4_0.machineLiziController = arg_4_0.controller:GetController("machineLizi")
	arg_4_0.countController = arg_4_0.controller:GetController("count")
	arg_4_0.addNumController = arg_4_0.controller:GetController("score")
	arg_4_0.comboController = arg_4_0.controller:GetController("combo")
	arg_4_0.overController = arg_4_0.controller:GetController("gameOver")
	arg_4_0.gameDescController = arg_4_0.controller:GetController("GameObjective")
	arg_4_0.skillList = LuaList.New(handler(arg_4_0, arg_4_0.indexSkill), arg_4_0.uilistGo_, TetrisGameSkillIconItem)
	arg_4_0.effectList = {}
	arg_4_0.effectPosList = {}

	for iter_4_0 = 1, arg_4_0.effectposnodeTrs_.childCount do
		arg_4_0.effectPosList[iter_4_0] = arg_4_0.effectposnodeTrs_:GetChild(iter_4_0 - 1)
	end

	arg_4_0.scoreItemIndex = 1
	arg_4_0.tilespacePos = arg_4_0.tilespaceTrs_.localPosition
end

function var_0_0.OnEnter(arg_5_0)
	arg_5_0.stageID = arg_5_0.params_.stageID
	arg_5_0.activityID = TetrisGameData:GetCurActivityID()
	arg_5_0.callBack = arg_5_0.params_.callBack

	arg_5_0:RegisterEvents()

	if arg_5_0.callBack then
		arg_5_0.callBack(arg_5_0.stageGo)
	end

	arg_5_0.callBack = nil

	arg_5_0:RefreshView()
end

function var_0_0.AddUIListener(arg_6_0)
	for iter_6_0 = 1, 3 do
		arg_6_0:AddBtnListener(arg_6_0["btn" .. iter_6_0 .. "Btn_"], nil, function()
			TetrisGameRunTimeManager:RotateChip(iter_6_0)
		end)
	end
end

function var_0_0.RemoveScoreTween(arg_8_0, arg_8_1)
	if arg_8_1.tween then
		arg_8_1.tween:setOnComplete(nil):setOnUpdate(nil):setEase(nil)
		LeanTween.cancel(arg_8_1.tween.id)

		arg_8_1.tween = nil
	end
end

function var_0_0.CreateEffectItem(arg_9_0, arg_9_1)
	local var_9_0 = {
		gameObject = Object.Instantiate(arg_9_1 and arg_9_0.ui_trail_yellowGo_ or arg_9_0.ui_trail_blueGo_, arg_9_0.effectnodeTrs_)
	}

	SetActive(var_9_0.gameObject, false)

	var_9_0.transform = var_9_0.gameObject.transform
	var_9_0.isCanUse = true
	var_9_0.isHighScore = arg_9_1
	var_9_0.index = arg_9_0.scoreItemIndex

	table.insert(arg_9_0.effectList, var_9_0)

	arg_9_0.scoreItemIndex = arg_9_0.scoreItemIndex + 1

	return var_9_0
end

function var_0_0.ShowScoreTween(arg_10_0, arg_10_1, arg_10_2)
	if arg_10_1 <= 10 then
		return
	end

	local var_10_0 = arg_10_1 >= 50
	local var_10_1

	if var_10_0 then
		var_10_1 = 7 + math.floor((arg_10_1 - 50) / 20)
		var_10_1 = math.min(var_10_1, 11)
	else
		var_10_1 = 2 + math.floor(arg_10_1 / 10)
	end

	local var_10_2 = {}

	for iter_10_0, iter_10_1 in pairs(arg_10_0.effectList or {}) do
		if iter_10_1.isCanUse == true and iter_10_1.isHighScore == var_10_0 then
			table.insert(var_10_2, iter_10_1)
		end

		if var_10_1 <= #var_10_2 then
			break
		end
	end

	local var_10_3 = var_10_1 - #var_10_2

	for iter_10_2 = 1, var_10_3 do
		table.insert(var_10_2, arg_10_0:CreateEffectItem(var_10_0))
	end

	arg_10_0:PlayScoreTween(var_10_2, arg_10_2)
end

function var_0_0.PlayScoreTween(arg_11_0, arg_11_1, arg_11_2)
	local var_11_0 = arg_11_0.effectnodeTrs_:InverseTransformPoint(arg_11_0.scoreText.transform.position)

	for iter_11_0, iter_11_1 in ipairs(arg_11_1) do
		local var_11_1 = math.random(1, arg_11_2)
		local var_11_2 = arg_11_0.effectPosList[var_11_1].transform.localPosition
		local var_11_3 = math.random(-20, 20)
		local var_11_4 = math.random(-20, 20)
		local var_11_5 = var_11_2 + Vector3(var_11_3, var_11_4, 0)
		local var_11_6 = Mathf.Abs(var_11_2.y)
		local var_11_7 = Mathf.Max(var_11_6, 200)
		local var_11_8 = math.random(var_11_7, var_11_7 + var_11_7 / 2)

		if var_11_2.y > 0 then
			var_11_8 = -var_11_8
		end

		local var_11_9 = math.random(20, 50)
		local var_11_10 = Mathf.Lerp(var_11_5.x, var_11_0.x, math.random(50, 100) / 100)
		local var_11_11 = var_11_5 + Vector3(var_11_9, var_11_8, 0)
		local var_11_12 = var_11_5 + Vector3(var_11_10, var_11_8, 0)
		local var_11_13 = math.random(0.2, 0.4) + 0.1 * iter_11_0
		local var_11_14 = iter_11_0 * -0.05

		iter_11_1.isCanUse = false
		iter_11_1.tween = LeanTween.value(iter_11_0 * -0.05, 1, var_11_13):setOnUpdate(LuaHelper.FloatAction(function(arg_12_0)
			if arg_12_0 > 0 then
				local var_12_0 = (1 - arg_12_0) * (1 - arg_12_0) * (1 - arg_12_0)
				local var_12_1 = 3 * (1 - arg_12_0) * (1 - arg_12_0) * arg_12_0
				local var_12_2 = 3 * (1 - arg_12_0) * arg_12_0 * arg_12_0
				local var_12_3 = arg_12_0 * arg_12_0 * arg_12_0
				local var_12_4 = var_12_0 * var_11_5.x + var_12_1 * var_11_11.x + var_12_2 * var_11_12.x + var_12_3 * var_11_0.x
				local var_12_5 = var_12_0 * var_11_5.y + var_12_1 * var_11_11.y + var_12_2 * var_11_12.y + var_12_3 * var_11_0.y
				local var_12_6 = Vector2(var_12_4, var_12_5)

				iter_11_1.transform.localPosition = var_12_6

				if var_11_14 <= 0 then
					SetActive(iter_11_1.gameObject, true)
				end
			end

			var_11_14 = arg_12_0
		end)):setOnComplete(LuaHelper.VoidAction(function()
			if iter_11_0 == 1 then
				arg_11_0.scorenumAni_:Play("UI_TetrisGameMachineUI_special", 0, 0)
			end

			SetActive(iter_11_1.gameObject, false)

			iter_11_1.isCanUse = true
		end)):setEase(LeanTweenType.easeOutCubic)
	end
end

function var_0_0.RemoveShakeTween(arg_14_0)
	if arg_14_0.shakeTween then
		arg_14_0.shakeTween:setOnComplete(nil):setOnUpdate(nil):setEase(nil)
		LeanTween.cancel(arg_14_0.shakeTween.id)

		arg_14_0.shakeTween = nil
	end
end

function var_0_0.PlayShakeTween(arg_15_0, arg_15_1)
	if arg_15_1 <= 10 then
		return
	end

	local var_15_0 = {
		x = {
			1,
			0,
			-1,
			-1,
			1,
			0,
			1,
			1,
			-1,
			0
		},
		y = {
			1,
			-2,
			2,
			-1,
			1,
			0,
			-1,
			0,
			1,
			0
		}
	}
	local var_15_1
	local var_15_2
	local var_15_3

	if arg_15_1 >= 100 then
		var_15_1 = 5
		var_15_3 = 1.5
	elseif arg_15_1 >= 50 then
		var_15_1 = 3
		var_15_3 = 1
	else
		var_15_1 = 2
		var_15_3 = 0.8
	end

	local var_15_4 = #var_15_0.x

	arg_15_0.shakeTween = LeanTween.value(1, var_15_4 - 1, var_15_3):setOnUpdate(LuaHelper.FloatAction(function(arg_16_0)
		local var_16_0 = math.floor(arg_16_0)
		local var_16_1 = Mathf.Lerp(var_15_0.x[var_16_0 - 1] or 0, var_15_0.x[var_16_0], arg_16_0 - var_16_0) * var_15_1
		local var_16_2 = Mathf.Lerp(var_15_0.y[var_16_0 - 1] or 0, var_15_0.y[var_16_0], arg_16_0 - var_16_0) * var_15_1

		arg_15_0.tilespaceTrs_.localPosition = arg_15_0.tilespacePos + Vector3(var_16_1, var_16_2, 0)
	end)):setOnComplete(LuaHelper.VoidAction(function()
		arg_15_0.tilespaceTrs_.localPosition = arg_15_0.tilespacePos
	end)):setEase(LeanTweenType.easeOutCubic)
end

function var_0_0.UpdateScore(arg_18_0)
	local var_18_0 = TetrisGameRunTimeManager:GetCurRoundBoard()
	local var_18_1 = TetrisGameRunTimeManager:GetSkillEffectBlackBoard()
	local var_18_2 = var_18_0.addScore

	arg_18_0:ShowScoreTween(var_18_0.addScore, var_18_0.curRoundDisposeNum)
	arg_18_0:PlayShakeTween(var_18_0.addScore)
	arg_18_0:DelScoreTimer()
	SetActive(arg_18_0.addmarksGo_, true)

	arg_18_0.textaddmarksText_.text = var_18_2
	arg_18_0.textcombo01Text_.text = placeScore
	arg_18_0.scoreTimer = Timer.New(function()
		SetActive(arg_18_0.comboGo_, false)
		SetActive(arg_18_0.addmarksGo_, false)
	end, 1.5)

	arg_18_0.scoreTimer:Start()
end

function var_0_0.DelScoreTimer(arg_20_0)
	SetActive(arg_20_0.comboGo_, false)
	SetActive(arg_20_0.addmarksGo_, false)

	if arg_20_0.scoreTimer then
		arg_20_0.scoreTimer:Stop()

		arg_20_0.scoreTimer = nil
	end
end

function var_0_0.RegisterEvents(arg_21_0)
	arg_21_0:RegistEventListener(TETRIS_GAME_ROUND_END, function()
		arg_21_0:RefreshBlackBoardData()
	end)
	arg_21_0:RegistEventListener(TETRIS_GAME_TIMER_UPDATE, function(arg_23_0)
		local var_23_0 = TetrisGameRunTimeManager:GetBlackBoard()

		if var_23_0.totalTime > 0 then
			local var_23_1 = math.ceil(var_23_0.totalTime - var_23_0.usedTime)
			local var_23_2 = math.max(0, var_23_1)

			arg_21_0.roundText.text = GetTips("REMAINING_TIME") .. var_23_2
		end
	end)
	arg_21_0:RegistEventListener(TETRIS_GAME_START_GAME, function()
		arg_21_0:OnStartGame()
	end)
end

function var_0_0.CheckIsLose(arg_25_0)
	local var_25_0 = TetrisGameRunTimeManager:GetBlackBoard()
	local var_25_1 = false
	local var_25_2 = ActivityTetrisGameStageCfg[var_25_0.stageID].time

	if ActivityTetrisGameStageCfg[arg_25_0.stageID].type == TetrisGameConst.stageType.endLess and var_25_2 > 0 and var_25_2 - var_25_0.usedTime > 0 then
		var_25_1 = true
	end

	if var_25_0.resultFlag == false or var_25_1 == true then
		return true
	else
		return false
	end
end

function var_0_0.OnGameEndUpdate(arg_26_0)
	arg_26_0:DisposeComboTimer()
	arg_26_0:DelOverTimer()

	if arg_26_0:CheckIsLose() then
		arg_26_0.overController:SetSelectedState("true")

		arg_26_0.gameOverTimer = Timer.New(function()
			JumpTools.OpenPageByJump("tetrisGameScorePopView", {
				stageID = arg_26_0.stageID
			})
		end, 2.2)

		arg_26_0.gameOverTimer:Start()
		TetrisGameBridge.OverGameEnd()
	else
		JumpTools.OpenPageByJump("tetrisGameScorePopView", {
			stageID = arg_26_0.stageID
		})
	end
end

function var_0_0.DelOverTimer(arg_28_0)
	if arg_28_0.gameOverTimer then
		arg_28_0.gameOverTimer:Stop()

		arg_28_0.gameOverTimer = nil
	end
end

function var_0_0.OnExit(arg_29_0)
	manager.windowBar:HideBar()
	arg_29_0:RemoveAllEventListener()
	arg_29_0:StopTimer()
	arg_29_0:DelOverTimer()
	arg_29_0:DelScoreTimer()
end

function var_0_0.OnTop(arg_30_0)
	arg_30_0:RefreshBar()
end

function var_0_0.SendCancelSDK(arg_31_0)
	local var_31_0 = TetrisGameRunTimeManager:GetBlackBoard()

	if not var_31_0 then
		return
	end

	local var_31_1 = TetrisGameRunTimeManager:GetSkillBlackBoard()
	local var_31_2 = {}

	for iter_31_0, iter_31_1 in pairs(var_31_1 or {}) do
		table.insert(var_31_2, iter_31_0)
	end

	SDKTools.SendMessageToSDK("activity_combat_over", {
		result = 3,
		activity_id = TetrisGameData:GetCurActivityID(),
		stage_id = var_31_0.stageID,
		score = var_31_0.totalScore,
		use_seconds = var_31_0.usedTime,
		battle_times = var_31_0.usedRound,
		skill_list = var_31_2
	})
end

function var_0_0.RefreshBar(arg_32_0)
	manager.windowBar:SwitchBar({
		BACK_BAR
	})
	manager.windowBar:RegistBackCallBack(function()
		if arg_32_0.startTimer then
			return
		end

		if TetrisGameBridge.CheckIsHaveDragging() then
			return
		end

		local var_33_0 = TetrisGameRunTimeManager:GetBlackBoard()

		if var_33_0 and var_33_0.isGameEnd then
			return
		end

		TetrisGameRunTimeManager:PauseGame(true)

		if ActivityTetrisGameStageCfg[arg_32_0.stageID].type == TetrisGameConst.stageType.endLess then
			ShowMessageBox({
				content = GetTips("ACTIVITY_TETRIS_GAME_SPECIAL_END"),
				OkCallback = function()
					TetrisGameRunTimeManager:EndGame(false, true)
					TetrisGameRunTimeManager:ExitGame()
					arg_32_0:Back()
				end,
				CancelCallback = function()
					TetrisGameRunTimeManager:PauseGame(false)
				end
			})
		else
			ShowMessageBox({
				content = GetTips("ACTIVITY_TETRIS_GAME_NOEMAL_END"),
				OkCallback = function()
					arg_32_0:SendCancelSDK()
					TetrisGameRunTimeManager:EndGame(true)
					TetrisGameRunTimeManager:ExitGame()
					JumpTools.OpenPageByJump("/tetrisGameChooseStageView", {
						chapterID = ActivityTetrisGameChapterCfg.get_id_list_by_tetris_stage_list[arg_32_0.stageID][1],
						stageID = arg_32_0.stageID
					})
				end,
				CancelCallback = function()
					TetrisGameRunTimeManager:PauseGame(false)
				end
			})
		end
	end)
end

function var_0_0.OnStartGame(arg_38_0)
	arg_38_0:StopTimer()
	arg_38_0:DisposeComboTimer()
	arg_38_0:DelScoreTimer()

	arg_38_0.machineSlider.value = 0

	TetrisGameRunTimeManager:SetMachineInfoState(arg_38_0.machineSlider.value >= 1)
	arg_38_0:RefreshView()
	arg_38_0.machinenodeAni_:Play("UI_TetrisGameMachineUI_normal", 0, 0)
	arg_38_0.machineLiziController:SetSelectedState("hide")
	arg_38_0.countController:SetSelectedState("true")
	arg_38_0.overController:SetSelectedState("false")

	local var_38_0 = 3

	arg_38_0.startTime.text = var_38_0

	local var_38_1 = Time.realtimeSinceStartup

	arg_38_0.startTimer = FrameTimer.New(function()
		local var_39_0 = Time.realtimeSinceStartup
		local var_39_1 = var_39_0 - var_38_1

		var_38_0 = var_38_0 - var_39_1
		arg_38_0.startTime.text = math.ceil(var_38_0)

		if var_38_0 <= 0 then
			arg_38_0:StopTimer()
			TetrisGameRunTimeManager:StartGame()
			arg_38_0.countController:SetSelectedState("false")
		end

		var_38_1 = var_39_0
	end, 0.1, -1)

	arg_38_0.startTimer:Start()
end

function var_0_0.RefreshView(arg_40_0)
	arg_40_0:UpdataViewState()
	arg_40_0:RefreshBlackBoardData()
end

function var_0_0.RefreshMachineSlider(arg_41_0, arg_41_1)
	arg_41_0:RemoveTween()

	local var_41_0 = 0.5
	local var_41_1 = arg_41_0.machineSlider.value
	local var_41_2 = var_41_1
	local var_41_3 = 0.14

	arg_41_0.machineTween = LeanTween.value(arg_41_0.machineGo_, 0, 1, var_41_0):setOnUpdate(LuaHelper.FloatAction(function(arg_42_0)
		local var_42_0 = Mathf.Lerp(var_41_1, arg_41_1, arg_42_0)

		arg_41_0.machineSlider.value = var_42_0

		if var_41_2 > var_41_3 and var_42_0 < var_41_3 then
			arg_41_0.machineLiziController:SetSelectedState("hide")
		end

		if var_41_2 < var_41_3 and var_42_0 > var_41_3 then
			arg_41_0.machineLiziController:SetSelectedState("show")
		end

		var_41_2 = var_42_0
	end)):setOnComplete(LuaHelper.VoidAction(function()
		arg_41_0:RemoveTween()

		arg_41_0.machineSlider.value = arg_41_1
	end)):setEase(LeanTweenType.linear)

	TetrisGameRunTimeManager:SetMachineInfoState(arg_41_1 >= 1)
end

function var_0_0.RefreshMachineText(arg_44_0)
	local var_44_0 = TetrisGameRunTimeManager:GetSkillEffectBlackBoard()
	local var_44_1, var_44_2 = TetrisGameRunTimeManager:GetCurScoreRate()

	if ActivityTetrisGameChapterCfg.get_id_list_by_tetris_stage_list[arg_44_0.stageID][1] == 2 then
		arg_44_0.machineText.text = ""
	else
		arg_44_0.machineText.text = "x" .. var_44_1
	end

	if var_44_2 <= var_44_1 and var_44_2 > 1 then
		local var_44_3 = arg_44_0.machinenodeAni_:GetCurrentAnimatorClipInfo(0)

		if var_44_3 and var_44_3[0].clip.name ~= "UI_TetrisGameMachineUI_special" then
			arg_44_0.machinenodeAni_:Play("UI_TetrisGameMachineUI_special", 0, 0)
		end
	else
		arg_44_0.machinenodeAni_:Play("UI_TetrisGameMachineUI_normal", 0, 0)
	end
end

function var_0_0.RemoveTween(arg_45_0)
	if arg_45_0.machineTween then
		arg_45_0.machineTween:setOnComplete(nil):setOnUpdate(nil):setEase(nil)
		LeanTween.cancel(arg_45_0.machineGo_)

		arg_45_0.machineTween = nil
	end
end

function var_0_0.RefreshBlackBoardData(arg_46_0)
	local var_46_0 = TetrisGameRunTimeManager:GetBlackBoard()
	local var_46_1 = TetrisGameRunTimeManager:GetCurRoundBoard()
	local var_46_2 = TetrisGameRunTimeManager:GetSkillEffectBlackBoard()

	if var_46_0 then
		arg_46_0.scoreText.text = var_46_0.totalScore

		arg_46_0.roundController:SetSelectedState("blue")

		if var_46_0.totalTime > 0 then
			arg_46_0.roundController:SetSelectedState("red")
			arg_46_0.gameDescController:SetSelectedState("infinite")
		else
			arg_46_0.gameDescController:SetSelectedState("normal")
		end

		if var_46_0.totalTime > 0 then
			local var_46_3 = math.ceil(var_46_0.totalTime - var_46_0.usedTime)
			local var_46_4 = math.max(0, var_46_3)

			arg_46_0.roundText.text = GetTips("REMAINING_TIME") .. var_46_4
		else
			arg_46_0.roundText.text = string.format(GetTips("ACTIVITY_COMBINE_GAME_TURN"), var_46_0.usedRound, var_46_0.totalRound)
		end

		if var_46_1 and var_46_1.addScore > 0 then
			arg_46_0:UpdateScore()
		end

		arg_46_0:RefreshMachineText()

		if not var_46_2.chargeTimer and var_46_2.chargeFlag then
			if arg_46_0.machineSlider.value ~= 1 and var_46_0.chargeNum == var_46_0.chargeNumMax then
				manager.audio:PlayEffect("minigame_activity_3_6", "minigame_activity_3_6_block_ratio_up", "")
			end

			if arg_46_0.machineSlider.value > 0 and var_46_0.chargeNum == 0 then
				manager.audio:PlayEffect("minigame_activity_3_6", "minigame_activity_3_6_block_ratio_down", "")
			end

			arg_46_0:RefreshMachineSlider(var_46_0.chargeNumMax == 0 and 0 or var_46_0.chargeNum / var_46_0.chargeNumMax)
		end
	end
end

function var_0_0.OnComboTimerUpdate(arg_47_0)
	arg_47_0:DisposeComboTimer()

	local var_47_0 = ActivityTetrisGameSkillCfg[TetrisGameConst.skillType.combom].params_2[1]
	local var_47_1 = var_47_0
	local var_47_2 = TetrisGameRunTimeManager:GetBlackBoard()
	local var_47_3 = TetrisGameRunTimeManager:GetCurRoundBoard()

	var_47_2.comboTime = var_47_1
	arg_47_0.comboTimer = Timer.New(function()
		if not var_47_2.pauseGameFlag then
			var_47_1 = var_47_1 - 0.1
			var_47_2.comboTime = var_47_1

			arg_47_0:RefreshMachineSlider(math.max(var_47_1 / var_47_0, 0))

			if var_47_1 <= 0 then
				arg_47_0:DisposeComboTimer()

				var_47_2.comboCount = 0
				var_47_2.chargeNum = 0

				TetrisGameRunTimeManager:UpdateComboScoreRateCompute()
				arg_47_0:RefreshMachineText()
			end
		end
	end, 0.1, -1)

	arg_47_0.comboTimer:Start()
	SetActive(arg_47_0.machinenEffectObj_, true)
end

function var_0_0.DisposeComboTimer(arg_49_0)
	if arg_49_0.comboTimer then
		arg_49_0.comboTimer:Stop()

		arg_49_0.comboTimer = nil
	end

	SetActive(arg_49_0.machinenEffectObj_, false)

	if arg_49_0.comboEffectTimer then
		arg_49_0.comboEffectTimer:Stop()

		arg_49_0.comboEffectTimer = nil
	end
end

function var_0_0.UpdataViewState(arg_50_0)
	local var_50_0 = TetrisGameRunTimeManager:GetBlackBoard()
	local var_50_1 = TetrisGameRunTimeManager:GetSkillEffectBlackBoard()

	if var_50_0 then
		arg_50_0.machineController:SetSelectedState("off")

		if var_50_1.chargeFlag then
			arg_50_0.machineController:SetSelectedState("on")
		end

		local var_50_2 = TetrisGameRunTimeManager:GetSkillBlackBoard()

		if next(var_50_2) == nil then
			arg_50_0.skillController:SetSelectedState("off")
		else
			arg_50_0.skillController:SetSelectedState("on")
			arg_50_0:RefreshSkillList()
		end

		if TetrisGameRunTimeManager:GetSkillEffectBlackBoard().canRotate then
			arg_50_0.rotateController:SetSelectedState("true")
		else
			arg_50_0.rotateController:SetSelectedState("false")
		end

		if var_50_0.totalTime <= 0 then
			arg_50_0.roundText.text = GetTips("TETRIS_GAME_UNLIMITE_TIME")
		end
	end
end

function var_0_0.StopTimer(arg_51_0)
	if arg_51_0.startTimer then
		arg_51_0.startTimer:Stop()

		arg_51_0.startTimer = nil
	end
end

function var_0_0.RefreshSkillList(arg_52_0)
	arg_52_0.skillIDList = {}

	if ActivityTetrisGameStageCfg[arg_52_0.stageID].type == TetrisGameConst.stageType.endLess then
		arg_52_0.skillIDList = TetrisGameData:GetSkillList()
	else
		arg_52_0.skillIDList = ActivityTetrisGameStageCfg[arg_52_0.stageID].skill_list
	end

	arg_52_0.skillList:StartScroll(#arg_52_0.skillIDList)
end

function var_0_0.indexSkill(arg_53_0, arg_53_1, arg_53_2)
	arg_53_2:RefreshUI(arg_53_0.skillIDList[arg_53_1])
	arg_53_2:RegisterClickFunc(handler(arg_53_0, arg_53_0.ClickSkillItem))
end

function var_0_0.ClickSkillItem(arg_54_0, arg_54_1)
	if TetrisGameBridge.CheckIsHaveDragging() then
		return
	end

	JumpTools.OpenPageByJump("tetrisGameGetSkillView", {
		stageID = arg_54_0.stageID,
		skillID = arg_54_1
	})
end

function var_0_0.Dispose(arg_55_0)
	arg_55_0:StopTimer()
	arg_55_0:DisposeComboTimer()
	arg_55_0:DelScoreTimer()
	arg_55_0:RemoveTween()
	arg_55_0:RemoveShakeTween()

	for iter_55_0, iter_55_1 in ipairs(arg_55_0.effectList) do
		arg_55_0:RemoveScoreTween(iter_55_1)
	end

	if arg_55_0.skillList then
		arg_55_0.skillList:Dispose()

		arg_55_0.skillList = nil
	end

	var_0_0.super.Dispose(arg_55_0)
end

return var_0_0
