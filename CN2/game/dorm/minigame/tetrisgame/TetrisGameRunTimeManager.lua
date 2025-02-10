local var_0_0 = singletonClass("TetrisGameRunTimeManager")
local var_0_1
local var_0_2
local var_0_3
local var_0_4
local var_0_5 = 0.1

local function var_0_6(arg_1_0)
	var_0_1 = {}
	var_0_1.stageID = arg_1_0.stageID
	var_0_1.usedTime = 0
	var_0_1.totalTime = ActivityTetrisGameStageCfg[arg_1_0.stageID].time
	var_0_1.detlaTime = 0
	var_0_1.usedLogicRound = 0
	var_0_1.usedRound = 0
	var_0_1.totalRound = ActivityTetrisGameStageCfg[arg_1_0.stageID].round_max
	var_0_1.disposeNum = 0
	var_0_1.totalScore = 0
	var_0_1.pauseGameFlag = false
	var_0_1.isGameEnd = false
	var_0_1.chargeNum = 0
	var_0_1.chargeNumMax = 0
	var_0_1.specialChipList = nil
	var_0_1.resultFlag = false
	var_0_1.specifyChipRound = 0
	var_0_1.scoreMaxFlag = false
	var_0_1.comboCount = 0
	var_0_1.comboTime = 0

	return var_0_1
end

local function var_0_7()
	var_0_2 = {}
	var_0_2.curRoundDisposeNum = 0
	var_0_2.placeCellNum = 0
	var_0_2.isDisposeTile = false
	var_0_2.chargeAddNum = 0
	var_0_2.addScore = 0
end

local function var_0_8()
	local var_3_0 = var_0_3[TetrisGameConst.skillType.combom].params1

	for iter_3_0 = #var_3_0, 1, -1 do
		if var_0_1.comboCount >= var_3_0[iter_3_0][1] - 1 then
			var_0_4.comboScoreRate = 1 + var_3_0[iter_3_0][2]

			break
		end
	end
end

local function var_0_9()
	local var_4_0 = var_0_3[TetrisGameConst.skillType.charge].params1

	for iter_4_0 = #var_4_0, 1, -1 do
		local var_4_1 = var_4_0[iter_4_0][1]

		if var_0_1.chargeNum >= var_4_1 - 1 then
			var_0_4.accumulateScoreRate = 1 + var_4_0[iter_4_0][2]

			break
		end
	end
end

local function var_0_10(arg_5_0)
	local var_5_0 = var_0_4 and var_0_4.needSpecifyChip or false

	var_0_4 = {}
	var_0_4 = {
		accumulateScoreRate = 1,
		canRotate = false,
		comboScoreRate = 1,
		scoreRateMax = 1,
		needSpecifyChip = false,
		chargeFlag = false,
		quickScoreRate = 1,
		chargeTimer = false,
		forceChangeChip = false
	}

	local var_5_1 = TetrisGameExchange.New()

	var_5_1.canRotate = false
	var_5_1.canCombom = false
	var_5_1.canCharge = false

	for iter_5_0, iter_5_1 in pairs(var_0_3) do
		if iter_5_0 == TetrisGameConst.skillType.rotate then
			var_5_1.canRotate = true
			var_0_4.canRotate = true
		elseif iter_5_0 == TetrisGameConst.skillType.placeRefreshChip then
			var_0_4.forceChangeChip = true
		elseif iter_5_0 == TetrisGameConst.skillType.constRefreshChip then
			local var_5_2 = var_0_3[iter_5_0].params1[1]

			if var_5_0 == true then
				TetrisGameBridge.RefreshAllWaitChip(true)
			end

			if var_0_1.usedRound > var_0_1.specifyChipRound and var_0_1.usedRound % var_5_2 == 0 then
				var_0_4.needSpecifyChip = true
				var_0_1.specialChipList = var_0_3[iter_5_0].params2
				var_0_1.specifyChipRound = var_0_1.usedRound
			else
				var_0_4.needSpecifyChip = false
				var_0_1.specialChipList = nil
			end
		elseif iter_5_0 == TetrisGameConst.skillType.scoreMax then
			var_0_4.quickScoreRate = var_0_4.quickScoreRate + var_0_3[iter_5_0].params1[2]

			if var_0_1.scoreMaxFlag == false and var_0_1.usedRound == 0 and var_0_1.usedLogicRound == 0 then
				var_0_1.usedTime = var_0_1.usedTime + var_0_3[iter_5_0].params1[1]
				var_0_1.scoreMaxFlag = true
			end
		elseif iter_5_0 == TetrisGameConst.skillType.charge then
			var_0_4.chargeFlag = true
			var_0_1.chargeNumMax = ActivityTetrisGameSkillCfg[iter_5_0].Params_3[1]

			local var_5_3 = #var_0_3[iter_5_0].params1
			local var_5_4 = math.min(var_0_1.chargeNumMax + 1, var_5_3)

			var_0_4.scoreRateMax = var_0_4.scoreRateMax + var_0_3[iter_5_0].params1[var_5_4][2]

			if var_0_2 then
				var_0_2.chargeAddNum = 1
			end

			var_5_1.canCharge = true

			var_0_9()
		elseif iter_5_0 == TetrisGameConst.skillType.combom then
			var_5_1.canCombom = true
			var_0_4.chargeFlag = true
			var_0_4.chargeTimer = true
			var_0_1.chargeNumMax = ActivityTetrisGameSkillCfg[iter_5_0].Params_3[1]

			local var_5_5 = #var_0_3[iter_5_0].params1
			local var_5_6 = math.min(var_0_1.chargeNumMax + 1, var_5_5)

			var_0_4.scoreRateMax = var_0_4.scoreRateMax + var_0_3[iter_5_0].params1[var_5_6][2]

			var_0_8()
		end
	end

	TetrisGameBridge.SetSkillInfo(var_5_1)
end

local function var_0_11()
	local var_6_0

	if ActivityTetrisGameStageCfg[var_0_1.stageID].type == TetrisGameConst.stageType.endLess then
		var_6_0 = TetrisGameData:GetSkillList()
	else
		var_6_0 = ActivityTetrisGameStageCfg[var_0_1.stageID].skill_list
	end

	var_0_3 = {}

	for iter_6_0, iter_6_1 in ipairs(var_6_0) do
		var_0_3[iter_6_1] = {
			active = true,
			params1 = ActivityTetrisGameSkillCfg[iter_6_1].params_1,
			params2 = ActivityTetrisGameSkillCfg[iter_6_1].params_2
		}
	end

	var_0_10()

	return var_0_3, var_0_4
end

local function var_0_12()
	return var_0_4.quickScoreRate * (1 + (var_0_4.comboScoreRate - 1) + (var_0_4.accumulateScoreRate - 1)), var_0_4.scoreRateMax
end

local function var_0_13(arg_8_0)
	return arg_8_0 * (arg_8_0 * 0.5 + 0.5) * 10 * var_0_12()
end

local function var_0_14()
	local var_9_0 = 0

	if var_0_2.curRoundDisposeNum > 0 then
		var_9_0 = var_0_13(var_0_2.curRoundDisposeNum)
	end

	local var_9_1 = var_0_2.placeCellNum * var_0_4.quickScoreRate + var_9_0

	var_0_2.addScore = var_9_1
	var_0_1.totalScore = var_0_1.totalScore + var_9_1
end

local function var_0_15()
	for iter_10_0, iter_10_1 in pairs(var_0_3) do
		if iter_10_0 == TetrisGameConst.skillType.combom and var_0_2.isDisposeTile then
			var_0_1.comboCount = var_0_1.comboCount + 1

			var_0_8()
			manager.notify:CallUpdateFunc(TETRIS_GAME_COMBO_TIME_UPDATE)
		end
	end
end

local function var_0_16()
	if var_0_4.chargeFlag and not var_0_4.chargeTimer then
		var_0_1.chargeNum = math.min(var_0_1.chargeNum + var_0_2.chargeAddNum, var_0_1.chargeNumMax)

		var_0_9()
	end

	if var_0_2.curRoundDisposeNum > 0 then
		var_0_1.chargeNum = 0

		if var_0_4.chargeFlag and not var_0_4.chargeTimer then
			var_0_9()
		end
	end

	var_0_15()
end

local function var_0_17(arg_12_0, arg_12_1)
	if arg_12_0 > 0 then
		var_0_2.isDisposeTile = true
	end

	var_0_1.disposeNum = var_0_1.disposeNum + arg_12_0
	var_0_2.placeCellNum = arg_12_1
	var_0_2.curRoundDisposeNum = arg_12_0
	var_0_1.usedLogicRound = var_0_1.usedLogicRound + 1

	if TetrisGameBridge.CheckNeedRefreshAllWaitChip() or var_0_4.forceChangeChip then
		var_0_1.usedRound = var_0_1.usedRound + 1
	end
end

local function var_0_18()
	var_0_2 = nil
end

local function var_0_19()
	if var_0_4.needSpecifyChip and var_0_1.specialChipList then
		TetrisGameBridge.RefreshSpecificChip(var_0_1.specialChipList)
	else
		TetrisGameBridge.RefreshAllWaitChip(var_0_4.forceChangeChip)
	end
end

function var_0_0.Init(arg_15_0, arg_15_1, arg_15_2)
	var_0_1 = var_0_6(arg_15_1)

	TetrisGameBridge.StartGame(var_0_1.stageID, arg_15_2, 3)

	arg_15_0.stageCfg = ActivityTetrisGameStageCfg[var_0_1.stageID]
	var_0_3, var_0_4 = var_0_11()

	var_0_0:PauseGame(true)
	manager.notify:Invoke(TETRIS_GAME_START_GAME)
end

function var_0_0.StartGame(arg_16_0)
	if var_0_1.stageID then
		var_0_0:PauseGame(false)
		var_0_0:StartGameTimeTimer()
		var_0_0:StartLogicRound()
	end
end

function var_0_0.StartLogicRound(arg_17_0)
	if arg_17_0.stageCfg.round_max > 0 and var_0_1.usedRound >= arg_17_0.stageCfg.round_max then
		var_0_0:EndGame()

		return
	end

	var_0_7()
	var_0_11()
	var_0_19()

	if not TetrisGameBridge.CheckCanPlaceWaitChip() then
		var_0_0:EndGame()
		ShowTips("ACTIVITY_TETRIS_GAME_CHIP_END")
	end
end

function var_0_0.EndLogicRound(arg_18_0, arg_18_1, arg_18_2)
	var_0_17(arg_18_1, arg_18_2)
	var_0_14()
	var_0_16()
	manager.notify:Invoke(TETRIS_GAME_ROUND_END, var_0_1)
	var_0_18()
	var_0_0:StartLogicRound()
end

function var_0_0.PauseGame(arg_19_0, arg_19_1)
	var_0_1.pauseGameFlag = arg_19_1

	TetrisGameBridge.PauseGame(arg_19_1)
end

function var_0_0.Updata(arg_20_0)
	local var_20_0 = Time.realtimeSinceStartup

	if arg_20_0.startTime == nil then
		arg_20_0.startTime = var_20_0
	end

	if not var_0_1.pauseGameFlag then
		local var_20_1 = var_20_0 - arg_20_0.startTime

		var_0_1.detlaTime = var_0_1.detlaTime + var_20_1

		if var_0_1.detlaTime >= 1 then
			var_0_1.usedTime = var_0_1.usedTime + var_0_1.detlaTime
			var_0_1.detlaTime = 0

			manager.notify:Invoke(TETRIS_GAME_TIMER_UPDATE, var_0_1.usedTime)

			local var_20_2 = ActivityTetrisGameStageCfg[var_0_1.stageID].time

			if var_20_2 > 0 and var_20_2 - var_0_1.usedTime <= 0 then
				var_0_0:EndGame()
			end
		end
	end

	arg_20_0.startTime = var_20_0
end

function var_0_0.EndGame(arg_21_0, arg_21_1, arg_21_2)
	var_0_0:PauseGame(true)
	var_0_0:StopTimer()

	local var_21_0 = TetrisGameData:GetCurActivityID()
	local var_21_1 = ActivityTetrisGameStageCfg[var_0_1.stageID].round_max
	local var_21_2

	if var_21_1 <= var_0_1.usedRound then
		var_21_2 = 1
		var_0_1.resultFlag = true
	else
		var_21_2 = 0
		var_0_1.resultFlag = false
	end

	local var_21_3 = {
		stageID = var_0_1.stageID,
		score = var_0_1.totalScore,
		useTime = var_0_1.usedTime,
		result = var_21_2,
		battle_times = var_0_1.usedRound
	}

	var_0_1.isGameEnd = true

	if not arg_21_1 then
		TetrisGameAction:AskClearStage(var_21_0, var_21_3, function()
			manager.notify:CallUpdateFunc(TETRIS_GAME_GAME_END)
		end, arg_21_2 and not arg_21_1)
	end
end

function var_0_0.ExitGame(arg_23_0)
	var_0_0:StopTimer()
	var_0_0:Dispose()
end

function var_0_0.Dispose(arg_24_0)
	var_0_1 = nil
	var_0_4 = nil

	TetrisGameBridge.ExitGame()
	var_0_0:StopTimer()
end

function var_0_0.StartGameTimeTimer(arg_25_0)
	arg_25_0:StopTimer()

	arg_25_0.startTime = Time.realtimeSinceStartup
	arg_25_0.timer = FrameTimer.New(function()
		var_0_0:Updata()
	end, 1, -1)

	arg_25_0.timer:Start()
end

function var_0_0.StopTimer(arg_27_0)
	if arg_27_0.timer then
		arg_27_0.timer:Stop()

		arg_27_0.timer = nil
	end
end

function var_0_0.RotateChip(arg_28_0, arg_28_1)
	if arg_28_1 then
		TetrisGameBridge.RotateChip(arg_28_1)
	end
end

function var_0_0.SetMachineInfoState(arg_29_0, arg_29_1)
	TetrisGameBridge.SetMachineInfoState(arg_29_1)
end

function var_0_0.UpdateComboScoreRateCompute(arg_30_0)
	var_0_8()
end

function var_0_0.GetBlackBoard(arg_31_0)
	return var_0_1
end

function var_0_0.GetSkillEffectBlackBoard(arg_32_0)
	return var_0_4
end

function var_0_0.GetSkillBlackBoard(arg_33_0)
	return var_0_3
end

function var_0_0.GetCurRoundBoard(arg_34_0)
	return var_0_2
end

function var_0_0.GetCurScoreRate(arg_35_0)
	return var_0_12()
end

function var_0_0.CalculateDisposeScore(arg_36_0, arg_36_1)
	return var_0_13(arg_36_1)
end

return var_0_0
