local var_0_0 = singletonClass("DanceGame")
local var_0_1 = 1
local var_0_2 = 2
local var_0_3 = DormCharacterInteractBehaviour
local var_0_4 = Dorm.DormEntityManager

local function var_0_5(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1.round

	print("Round:", var_1_0, "Start")
	manager.notify:Invoke(BACKHOME_CRICKET_ROUND_START, var_1_0)
end

local function var_0_6(arg_2_0, arg_2_1)
	local var_2_0 = arg_2_1.round

	print("Round:", var_2_0, "End")
	manager.notify:Invoke(BACKHOME_CRICKET_ROUND_END, var_2_0)
end

local function var_0_7(arg_3_0)
	if arg_3_0 == nil then
		return nil
	end

	local var_3_0 = arg_3_0[1]

	for iter_3_0 = 2, #arg_3_0 do
		var_3_0 = var_3_0 .. arg_3_0[iter_3_0]
	end

	return var_3_0
end

local function var_0_8()
	DormMinigame.Launch("WT_RK")
end

local function var_0_9(arg_5_0, arg_5_1)
	manager.notify:Invoke(BACKHOME_CRICKET_REFRESH_BUFF, arg_5_1.round)
end

local function var_0_10(arg_6_0)
	return arg_6_0 ~= nil and arg_6_0 ~= 0
end

local function var_0_11(arg_7_0)
	local var_7_0 = arg_7_0.myAction.skillID
	local var_7_1 = arg_7_0.enemyAction.skillID
	local var_7_2 = math.random()
	local var_7_3 = var_0_10(var_7_0)
	local var_7_4 = var_0_10(var_7_1)
	local var_7_5
	local var_7_6

	if var_7_3 and var_7_4 then
		var_7_6 = BOTH_USING_SKILL_CHANCE
	elseif var_7_3 then
		var_7_5 = var_0_1
		var_7_6 = ONE_USING_SKILL_CHANCE
	elseif var_7_4 then
		var_7_5 = var_0_2
		var_7_6 = ONE_USING_SKILL_CHANCE
	else
		var_7_5 = var_0_1
		var_7_6 = ADVANCE_NORMAL_ACTION_CHANCE
	end

	var_7_6 = var_7_6 or 0

	if var_7_2 < var_7_6 then
		return nil
	end

	return var_7_5
end

local function var_0_12(arg_8_0, arg_8_1, arg_8_2, arg_8_3)
	local var_8_0 = {}
	local var_8_1 = nullable(DormUtils.GetEntityData(arg_8_0), "cfgID")
	local var_8_2 = nullable(DormUtils.GetEntityData(arg_8_1), "cfgID")

	var_8_0.entityCfg, var_8_0.targetCfg = var_8_1, var_8_2

	local var_8_3

	if arg_8_3 == nil then
		var_8_3 = var_0_3.GetSequence(var_8_1, var_8_2, arg_8_2, "game.dorm.interacts.dance")
	else
		local var_8_4 = var_0_3.GetSequenceGroup(var_8_1, var_8_2, arg_8_2, "game.dorm.interacts.dance")

		arg_8_3 = (arg_8_3 - 1) % #var_8_4 + 1
		var_8_3 = var_8_4[arg_8_3]
	end

	return var_0_3.MakeCtx(arg_8_0, arg_8_1, var_8_0), var_8_3
end

local function var_0_13(arg_9_0, arg_9_1)
	if arg_9_1 == nil then
		return arg_9_0
	end

	local var_9_0 = arg_9_0.duration / arg_9_1
	local var_9_1 = {
		duration = arg_9_1,
		sequence = {
			[0] = {
				function(arg_10_0)
					DanceGameController.SetEntityAnimeSpeed(arg_10_0.entityID, var_9_0)
				end
			}
		}
	}

	for iter_9_0, iter_9_1 in pairs(arg_9_0.sequence) do
		local var_9_2 = iter_9_0 / var_9_0
		local var_9_3 = var_9_1.sequence[var_9_2] or {}

		if type(iter_9_1) == "function" then
			table.insert(var_9_3, iter_9_1)
		elseif type(iter_9_1) == "table" then
			for iter_9_2, iter_9_3 in ipairs(iter_9_1) do
				table.insert(var_9_3, iter_9_3)
			end
		end

		var_9_1.sequence[var_9_2] = var_9_3
	end

	return var_9_1
end

local function var_0_14(arg_11_0, arg_11_1, arg_11_2, arg_11_3, arg_11_4)
	if arg_11_2 == nil then
		print("No action, no wait", arg_11_0)

		return nil
	end

	local var_11_0, var_11_1 = var_0_12(arg_11_0, arg_11_1, arg_11_2, arg_11_3)

	if var_11_1 then
		local var_11_2 = var_0_13(var_11_1, arg_11_4)

		var_11_0.curActionTask = var_0_3.MakeInteractTask(var_11_2, var_11_0)
	else
		var_11_0.curActionTask = var_0_0.DebugAction(arg_11_2, var_11_0)
	end

	var_0_4.StopAllCmd(arg_11_0)
	DormUtils.SetEntityInteractContext(arg_11_0, var_11_0)
	var_0_4.SendInteractToEntityCMD(arg_11_0, arg_11_1, true)

	return var_11_0.curActionTask
end

local function var_0_15(arg_12_0, arg_12_1, arg_12_2, ...)
	local var_12_0 = {
		...
	}
	local var_12_1 = var_0_0.StartActionTurn
	local var_12_2 = var_0_0.TurnSettlement
	local var_12_3 = arg_12_0.actionRound[arg_12_1]
	local var_12_4 = var_12_3.start
	local var_12_5 = var_12_3.finish
	local var_12_6 = {
		round = arg_12_1,
		player = arg_12_0:GetPlayerCharaEID(),
		opponent = arg_12_0:GetOpponentCharaEID(),
		roundMusicInfo = var_12_3,
		duration = var_12_5 - var_12_4,
		removedBuff = {}
	}
	local var_12_7 = var_0_11(arg_12_2)
	local var_12_8 = arg_12_0.taskRunner:NewTask()

	var_12_8:WaitUntil(function()
		return arg_12_0.bgmPlayback and arg_12_0.taskRunner:Now() >= var_12_4
	end):Then(function()
		if var_12_7 then
			arg_12_0:ActiveShootToCharaCam(var_12_7)
		end

		arg_12_0.curRound = arg_12_1

		var_0_5(arg_12_0, var_12_6)

		var_12_6.playerTask, var_12_6.opponentTask = var_12_1(arg_12_0, var_12_6, arg_12_2, unpack(var_12_0))
	end):WaitUntil(function()
		return arg_12_0.taskRunner:Now() >= var_12_5
	end):Then(function()
		if var_12_7 then
			arg_12_0:RestoreCam()
		end

		var_12_2(arg_12_0, var_12_6, arg_12_2, unpack(var_12_0))
		var_0_6(arg_12_0, var_12_6)
		DanceGameController.SetEntityAnimeSpeed(var_12_6.player, 1)
		DanceGameController.SetEntityAnimeSpeed(var_12_6.opponent, 1)
	end)
	var_12_8:Start(true)

	return var_12_8
end

local function var_0_16(arg_17_0, arg_17_1)
	local var_17_0 = var_0_0.StartPrepareTurn

	local function var_17_1(arg_18_0, arg_18_1)
		var_0_9(arg_18_0, arg_18_1)
	end

	local var_17_2 = DormCharacterActionManager.frameTaskRunner:NewTask()
	local var_17_3 = 0
	local var_17_4 = {
		round = var_17_3,
		player = arg_17_0:GetPlayerCharaEID(),
		opponent = arg_17_0:GetOpponentCharaEID(),
		removedBuff = {}
	}

	Dorm.storage:RecordData("dance.flags", "start", false)
	var_17_2:Then(function()
		manager.notify:CallUpdateFunc("OnDanceGameStart")
	end):WaitUntil(function()
		return Dorm.storage:GetData("dance.flags", "start")
	end):Then(function()
		arg_17_0.curRound = var_17_3

		var_0_5(arg_17_0, var_17_4)

		var_17_4.playerTask, var_17_4.opponentTask = var_17_0(arg_17_0, var_17_4, arg_17_1)
	end):WaitUntil(function()
		if var_17_4.playerTask and not var_17_4.playerTask:IsFinished() then
			return false
		end

		if var_17_4.opponentTask and not var_17_4.opponentTask:IsFinished() then
			return false
		end

		return true
	end):Then(function()
		var_17_1(arg_17_0, var_17_4, arg_17_1)
		var_0_6(arg_17_0, var_17_4)
		print("准备阶段结束")

		arg_17_0.bgmPlayback = arg_17_0.bgmPlayer:Play()

		arg_17_0.taskRunner:SetPlayback(arg_17_0.bgmPlayback)
		arg_17_0:StartMainCamDirector()
		manager.notify:CallUpdateFunc("OnStartCountDownTimer")
	end)
	var_17_2:Start(true)

	return var_17_2
end

local function var_0_17(arg_24_0, arg_24_1, arg_24_2)
	local var_24_0 = DormCharacterActionManager.frameTaskRunner:NewTask()
	local var_24_1 = {
		player = arg_24_0:GetPlayerCharaEID(),
		opponent = arg_24_0:GetOpponentCharaEID(),
		removedBuff = {}
	}
	local var_24_2 = "curtain_call_"
	local var_24_3 = 1.25

	var_24_0:WaitTask(arg_24_1):Then(function()
		manager.notify:CallUpdateFunc("OnDanceGameFinish")
		manager.audio:PlayEffect("ui_battle", "ui_battle_stopbgm")
	end):WaitUntil(function(arg_26_0)
		if arg_26_0.startTime == nil then
			arg_26_0.startTime = var_24_0.taskRunner:Now()
		end

		local var_26_0 = var_24_0.taskRunner:Now()

		if not arg_26_0.alreadyShowResult and var_26_0 - arg_26_0.startTime >= var_24_3 then
			arg_26_0.alreadyShowResult = true

			if arg_24_2 then
				arg_24_2()
			end
		end

		local var_26_1 = arg_26_0.player
		local var_26_2 = arg_26_0.opponent

		if arg_26_0.playerTask == nil or arg_26_0.playerTask:IsFinished() then
			arg_26_0.playerTask = var_0_14(var_26_1, var_26_2, var_24_2)
		end

		if arg_26_0.opponentTask == nil or arg_26_0.opponentTask:IsFinished() then
			arg_26_0.opponentTask = var_0_14(var_26_2, var_26_1, var_24_2)
		end

		return false
	end, false, var_24_1)
	var_24_0:Start(true)
end

function var_0_0.GotoResultView(arg_27_0)
	if not arg_27_0.isGotoResult then
		arg_27_0.isGotoResult = true

		local var_27_0 = BackHomeCricketBattleData:GetSingleBattleData()

		if var_27_0.settleType == BackHomeCricketConst.ROOM_TYPE.Video then
			JumpTools.OpenPageByJump("/backHomeCricketBattleResuleView", {
				data = var_27_0
			})
		else
			BackHomeCricketAction.SendBattleComplete(arg_27_0.battleType, function(arg_28_0, arg_28_1)
				JumpTools.OpenPageByJump("/backHomeCricketBattleResuleView", {
					data = arg_28_1
				})
			end)
		end
	end
end

function var_0_0.ProcessDanceSeq(arg_29_0, arg_29_1, arg_29_2, arg_29_3)
	local var_29_0 = arg_29_0:GetPlayerCharaEID()
	local var_29_1 = arg_29_0:GetOpponentCharaEID()

	DanceGameController.SetEntityAnimeSpeed(var_29_0, 1)
	DanceGameController.SetEntityAnimeSpeed(var_29_1, 1)

	if arg_29_0.prepareRoundTask then
		arg_29_0.prepareRoundTask:Abort()
	end

	arg_29_0.prepareRoundTask = var_0_16(arg_29_0, arg_29_1)

	arg_29_0.prepareRoundTask:SetOnComplete(function()
		arg_29_0.prepareRoundTask = nil
	end)

	local var_29_2

	arg_29_0.totalRound = arg_29_3

	for iter_29_0 = 1, arg_29_3 do
		local var_29_3 = arg_29_2[iter_29_0]

		var_29_2 = var_0_15(arg_29_0, iter_29_0, var_29_3)
	end

	var_0_17(arg_29_0, var_29_2, function()
		arg_29_0:GotoResultView()
	end)
end

function var_0_0.SkipShow(arg_32_0)
	arg_32_0:GotoResultView()
end

function var_0_0.DebugAction(arg_33_0, arg_33_1)
	return var_0_3.MakeInteractTask({
		duration = 1,
		sequence = {
			[0] = function()
				print("普通动作", arg_33_0, 0)
			end,
			[0.5] = function()
				print("普通动作", arg_33_0, 0.5, "InProgress")
			end,
			function()
				print("普通动作", arg_33_0, 1, "Finish")
			end
		}
	}, arg_33_1)
end

local function var_0_18(arg_37_0)
	return arg_37_0 and arg_37_0 ~= "" and not IsAllSpace(arg_37_0)
end

local function var_0_19(arg_38_0)
	local var_38_0 = IdolTraineeSkillCfg[arg_38_0].action

	return var_0_18(var_38_0)
end

local function var_0_20(arg_39_0)
	local var_39_0 = IdolTraineeSkillCfg[arg_39_0].counter_action

	return var_0_18(var_39_0)
end

local var_0_21 = 0
local var_0_22 = 1
local var_0_23 = {
	"type1",
	"type2",
	"type3",
	"type4",
	"type5"
}
local var_0_24 = {
	"b8",
	"b16"
}

local function var_0_25(arg_40_0, arg_40_1)
	local var_40_0 = nullable(DormUtils.GetEntityData(arg_40_0), "cfgID")
	local var_40_1

	for iter_40_0, iter_40_1 in ipairs(arg_40_1) do
		if (var_40_1 == nil or iter_40_1 < var_40_1) and var_0_19(iter_40_1) then
			var_40_1 = iter_40_1
		end
	end

	return nullable(IdolTraineeSkillCfg, var_40_1, "action")
end

local function var_0_26(arg_41_0, arg_41_1, arg_41_2, arg_41_3)
	local var_41_0 = nullable(DormUtils.GetEntityData(arg_41_0), "cfgID")
	local var_41_1
	local var_41_2

	if arg_41_2 and var_0_10(arg_41_2.skillID) then
		var_41_1 = arg_41_2.skillID
	end

	if arg_41_3 and var_0_10(arg_41_3.skillID) then
		var_41_2 = arg_41_3.skillID
	end

	local var_41_3

	if var_41_1 then
		var_41_3 = IdolTraineeSkillCfg[var_41_1].action
	elseif var_41_2 then
		var_41_3 = IdolTraineeSkillCfg[var_41_2].counter_action
	end

	local var_41_4 = true

	if not var_0_18(var_41_3) then
		var_41_3 = var_0_23[arg_41_2.actionID]
		var_41_4 = false
	end

	local var_41_5 = var_0_24[arg_41_1.roundMusicInfo.type]

	return string.format("%s_%s_", var_41_3, var_41_5), var_41_4
end

local var_0_27 = 1
local var_0_28 = 2

local function var_0_29(arg_42_0, arg_42_1, arg_42_2, arg_42_3, arg_42_4, arg_42_5, arg_42_6)
	local var_42_0 = IdolTraineeSkillEffectCfg[arg_42_0]
	local var_42_1
	local var_42_2

	if var_42_0.object == var_0_27 then
		local var_42_3 = arg_42_2

		var_42_2 = arg_42_3
	elseif var_42_0.object == var_0_28 then
		local var_42_4 = arg_42_4

		var_42_2 = arg_42_5
	end

	local var_42_5 = arg_42_6.round

	if var_42_5 == 0 then
		var_42_5 = 1
	end

	table.insert(var_42_2.buff, {
		id = arg_42_0,
		skill = arg_42_1,
		duration = var_42_0.round,
		triggerRound = var_42_0.trigger_time + var_42_5
	})
end

local function var_0_30(arg_43_0, arg_43_1, arg_43_2, arg_43_3)
	local var_43_0 = DormUtils.GetEntityData(arg_43_0)
	local var_43_1 = DormUtils.GetEntityData(arg_43_1)

	if arg_43_3.action then
		local var_43_2 = arg_43_3.action

		for iter_43_0, iter_43_1 in ipairs(var_43_2.effectList) do
			local var_43_3 = nullable(IdolTraineeSkillCfg, var_43_2.skillID, "skill_effect", iter_43_1)

			if var_43_3 then
				var_0_29(var_43_3, var_43_2.skillID, arg_43_0, var_43_0, arg_43_1, var_43_1, arg_43_2)
			end
		end
	else
		for iter_43_2, iter_43_3 in ipairs(arg_43_3.passive) do
			var_0_29(iter_43_3, nil, arg_43_0, var_43_0, arg_43_1, var_43_1, arg_43_2)
		end
	end
end

local function var_0_31(arg_44_0)
	local var_44_0 = {}
	local var_44_1 = nullable(BackHomeHeroCfg, arg_44_0, "idol_passive_skill_list")

	if var_44_1 then
		for iter_44_0, iter_44_1 in ipairs(var_44_1) do
			table.insert(var_44_0, iter_44_1[1])
		end
	else
		local var_44_2 = nullable(IdolPveNpcCfg, arg_44_0, "idol_passive_skill_list")

		if var_44_2 then
			for iter_44_2, iter_44_3 in ipairs(var_44_2) do
				table.insert(var_44_0, iter_44_3)
			end
		end
	end

	return var_44_0
end

function var_0_0.StartPrepareTurn(arg_45_0, arg_45_1, arg_45_2)
	local var_45_0 = arg_45_1.player
	local var_45_1 = arg_45_1.opponent
	local var_45_2 = DormUtils.GetEntityData(var_45_0).heroID
	local var_45_3 = DormUtils.GetEntityData(var_45_1).heroID
	local var_45_4 = var_0_31(var_45_2)
	local var_45_5 = var_0_31(var_45_3)
	local var_45_6 = {
		passive = arg_45_2.myActiveBuffList
	}
	local var_45_7 = {
		passive = arg_45_2.enemyActiveBuffList
	}

	var_0_30(var_45_0, var_45_1, arg_45_1, var_45_6)
	var_0_30(var_45_1, var_45_0, arg_45_1, var_45_7)
	var_0_9(arg_45_0, arg_45_1)

	return var_0_14(var_45_0, var_45_1, var_0_25(var_45_0, arg_45_1, var_45_4)), var_0_14(var_45_1, var_45_0, var_0_25(var_45_1, arg_45_1, var_45_5))
end

function var_0_0.StartActionTurn(arg_46_0, arg_46_1, arg_46_2)
	print("回合开始：", arg_46_1.round)

	local var_46_0 = arg_46_1.player
	local var_46_1 = arg_46_1.opponent
	local var_46_2 = {
		action = arg_46_2.myAction,
		score = arg_46_2.myScore
	}
	local var_46_3 = {
		action = arg_46_2.enemyAction,
		score = arg_46_2.enemyScore
	}

	var_0_30(var_46_0, var_46_1, arg_46_1, var_46_2)
	var_0_30(var_46_1, var_46_0, arg_46_1, var_46_3)
	var_0_9(arg_46_0, arg_46_1)

	local var_46_4 = nullable(DormUtils.GetEntityData(var_46_0), "cfgID")
	local var_46_5 = nullable(DormUtils.GetEntityData(var_46_1), "cfgID")
	local var_46_6
	local var_46_7
	local var_46_8
	local var_46_9

	if arg_46_1.round == 1 then
		local var_46_10
		local var_46_11
		local var_46_12

		var_46_6, var_46_12 = var_0_26(var_46_0, arg_46_1, var_46_2.action, var_46_3.action)

		local var_46_13

		var_46_7, var_46_13 = var_0_26(var_46_1, arg_46_1, var_46_3.action, var_46_2.action)

		if not var_46_12 and not var_46_13 then
			var_46_7 = var_46_6

			local var_46_14 = var_0_3.GetSequenceGroup(var_46_4, var_46_5, var_46_6, "game.dorm.interacts.dance")
			local var_46_15 = math.random(#var_46_14)

			var_46_8, var_46_9 = var_46_15, var_46_15
		end
	elseif arg_46_1.round == arg_46_0.totalRound then
		local var_46_16
		local var_46_17
		local var_46_18

		var_46_6, var_46_18 = var_0_26(var_46_0, arg_46_1, var_46_2.action, var_46_3.action)

		local var_46_19

		var_46_7, var_46_19 = var_0_26(var_46_1, arg_46_1, var_46_3.action, var_46_2.action)

		if not var_46_18 and not var_46_19 then
			var_46_6 = var_46_7

			local var_46_20 = var_0_3.GetSequenceGroup(var_46_5, var_46_4, var_46_7, "game.dorm.interacts.dance")
			local var_46_21 = math.random(#var_46_20)

			var_46_8, var_46_9 = var_46_21, var_46_21
		end
	else
		var_46_6 = var_0_26(var_46_0, arg_46_1, var_46_2.action, var_46_3.action)
		var_46_7 = var_0_26(var_46_1, arg_46_1, var_46_3.action, var_46_2.action)
	end

	return var_0_14(var_46_0, var_46_1, var_46_6, var_46_8, arg_46_1.duration), var_0_14(var_46_1, var_46_0, var_46_7, var_46_9, arg_46_1.duration)
end

local function var_0_32(arg_47_0, arg_47_1)
	local var_47_0 = DormUtils.GetEntityData(arg_47_0)
	local var_47_1 = {}

	for iter_47_0, iter_47_1 in pairs(var_47_0.buff) do
		local var_47_2 = iter_47_1.id
		local var_47_3 = iter_47_1.duration

		if iter_47_1.triggerRound <= arg_47_1.round then
			if var_47_3 > 0 then
				if not iter_47_1.activated then
					iter_47_1.activated = true
				end

				iter_47_1.duration = var_47_3 - 1
			end

			if iter_47_1.duration <= 0 then
				table.insert(var_47_1, iter_47_0)
			end
		end
	end

	for iter_47_2 = #var_47_1, 1, -1 do
		var_47_1[iter_47_2] = table.remove(var_47_0.buff, var_47_1[iter_47_2]).id
	end

	arg_47_1.removedBuff[arg_47_0] = var_47_1
end

function var_0_0.TurnSettlement(arg_48_0, arg_48_1, arg_48_2)
	local var_48_0 = arg_48_1.player
	local var_48_1 = arg_48_1.opponent

	var_0_32(var_48_0, arg_48_1)
	var_0_32(var_48_1, arg_48_1)
	var_0_9(arg_48_0, arg_48_1)
end

local function var_0_33(arg_49_0)
	return "CharDorm/dance/" .. arg_49_0.model
end

local function var_0_34(arg_50_0)
	local var_50_0 = "dance.pos." .. arg_50_0.spawnAt

	return Dorm.storage:GetData(var_50_0, 1).transform
end

function var_0_0.Ctor(arg_51_0)
	local var_51_0 = EntityManager.CreateModel.New(var_0_33, var_0_34)

	arg_51_0.charaMgr = EntityManager.New(var_51_0)
	arg_51_0.taskRunner = DanceGameTaskRunner.New()
end

function var_0_0.Init(arg_52_0, arg_52_1)
	arg_52_0:InitGame(arg_52_1)

	local var_52_0 = arg_52_1.stageID
	local var_52_1 = arg_52_1.battleType == BackHomeCricketConst.ROOM_TYPE.PVE_STAGE and IdolTraineePveBattleCfg[var_52_0] or IdolTraineePvpBattleCfg[var_52_0]

	arg_52_0:InitScene(var_52_1)
	DormCharacterActionManager:RegisterTaskRunner(arg_52_0.taskRunner, 2, 1)
	arg_52_0:ProcessDanceSeq(arg_52_1.prepareInfo, arg_52_1.roundList, arg_52_1.lastRound)
end

var_0_0.actionCountNamespace = "dance.action.cnt"

function var_0_0.InitGame(arg_53_0, arg_53_1)
	local var_53_0 = arg_53_1.mySkinID
	local var_53_1 = arg_53_1.enemySkinID

	arg_53_0.battleType = arg_53_1.battleType

	arg_53_0:SetCharacter(var_0_1, var_53_0)
	arg_53_0:SetCharacter(var_0_2, var_53_1)

	arg_53_0.isGotoResult = nil

	Dorm.storage:ClearData(var_0_0.actionCountNamespace)
end

function var_0_0.SetCharacter(arg_54_0, arg_54_1, arg_54_2)
	local var_54_0 = BackHomeHeroSkinCfg[arg_54_2] or IdolPveNpcCfg[arg_54_2]
	local var_54_1 = nullable(var_54_0, "model")
	local var_54_2 = nullable(var_54_0, "hero_id") or arg_54_2
	local var_54_3 = {
		complex = true,
		model = var_54_1,
		spawnAt = arg_54_1
	}

	arg_54_0.charaMgr:Update(arg_54_1, var_54_3, {
		cfgID = arg_54_2,
		heroID = var_54_2,
		buff = {}
	})
end

function var_0_0.GetPlayerCharaEID(arg_55_0)
	return arg_55_0.charaMgr:GetEntityID(var_0_1)
end

function var_0_0.GetOpponentCharaEID(arg_56_0)
	return arg_56_0.charaMgr:GetEntityID(var_0_2)
end

function var_0_0.Reset(arg_57_0, arg_57_1, arg_57_2)
	arg_57_0.charaMgr:Clear(true)
	arg_57_0.taskRunner:Reset()

	arg_57_0.bgmPlayback = nil
	arg_57_0.totalRound = nil

	if not arg_57_2 then
		arg_57_0.actionRound = nil
	end

	if arg_57_1 then
		arg_57_0.danceGameController = nil
		arg_57_0.shootCam = nil
		arg_57_0.cinemachineBrain = nil
	end
end

function var_0_0.InitBgmPlayer(arg_58_0, arg_58_1, arg_58_2, arg_58_3)
	local var_58_0 = GameObject.Find("bgmPlayer"):GetComponent("CriAtomSource")

	DanceGameController.AddCue(arg_58_1, arg_58_3)

	var_58_0.cueSheet = arg_58_1
	var_58_0.cueName = arg_58_2
	arg_58_0.bgmPlayer = var_58_0
end

local var_0_35 = 2

function var_0_0.InitScene(arg_59_0, arg_59_1)
	if arg_59_0.danceGameController == nil then
		local var_59_0 = arg_59_1.cam_director_prefab

		arg_59_0.danceGameController = DanceGameController.Load("IdolTrainee/Stage/" .. var_59_0)

		arg_59_0:InitCam()
	end

	local var_59_1 = arg_59_1.scene_name
	local var_59_2 = IdolStageMusicCfg[arg_59_1.bgm]

	if arg_59_0.actionRound == nil then
		local var_59_3 = var_59_2.music_json
		local var_59_4 = AssetEx.LoadText(var_59_3)
		local var_59_5 = require("cjson").decode(var_59_4)
		local var_59_6 = {}

		for iter_59_0 = 1, var_0_35 do
			local var_59_7 = var_59_5["track" .. iter_59_0]

			for iter_59_1, iter_59_2 in pairs(var_59_7) do
				table.insert(var_59_6, {
					type = iter_59_0,
					start = iter_59_2[1] / 1000,
					finish = iter_59_2[2] / 1000
				})
			end
		end

		table.sort(var_59_6, function(arg_60_0, arg_60_1)
			return arg_60_0.start < arg_60_1.start
		end)

		arg_59_0.actionRound = var_59_6
	end

	arg_59_0:InitBgmPlayer(var_59_2.cue_sheet, var_59_2.cue_name, var_59_2.awb_name)
end

function var_0_0.InitCam(arg_61_0)
	arg_61_0.danceGameController:InitCinemachineBrain()

	arg_61_0.cinemachineBrain = arg_61_0.danceGameController.brain
	arg_61_0.cinemachineBrain.m_DefaultBlend = DanceGameController.cut
	arg_61_0.shootCam = GameObject.Find("shoot"):GetComponent("CinemachineVirtualCamera")

	local var_61_0 = arg_61_0:GetPlayerCharaEID()
	local var_61_1 = arg_61_0:GetOpponentCharaEID()

	arg_61_0.danceGameController:SetDummyFollowEntity("player1", var_61_0)
	arg_61_0.danceGameController:SetDummyFollowEntity("player2", var_61_1)

	arg_61_0.cinemachineBrain.enabled = true

	local var_61_2 = var_0_34({
		spawnAt = var_0_1
	})
	local var_61_3 = var_0_34({
		spawnAt = var_0_2
	})

	arg_61_0.shootCamCfg = {
		[var_0_1] = {
			lookAt = arg_61_0.danceGameController:GetDummy("player1") or var_61_2,
			pos = var_61_2:Find("shootPos")
		},
		[var_0_2] = {
			lookAt = arg_61_0.danceGameController:GetDummy("player2") or var_61_3,
			pos = var_61_3:Find("shootPos")
		}
	}
end

function var_0_0.ActiveShootToCharaCam(arg_62_0, arg_62_1)
	local var_62_0 = arg_62_0.shootCamCfg[arg_62_1]

	if var_62_0 then
		arg_62_0.shootCam.Follow = var_62_0.pos
		arg_62_0.shootCam.LookAt = var_62_0.lookAt
		arg_62_0.shootCam.enabled = true
	end
end

function var_0_0.RestoreCam(arg_63_0)
	arg_63_0.shootCam.enabled = false
end

function var_0_0.StartMainCamDirector(arg_64_0)
	local var_64_0 = arg_64_0.danceGameController.director

	if var_64_0 then
		var_64_0:Play()
	end
end

function var_0_0.StopMainCamDirector(arg_65_0)
	local var_65_0 = arg_65_0.danceGameController.director

	if var_65_0 then
		var_65_0:Stop()

		var_65_0.time = var_65_0.initialTime

		var_65_0:Evaluate()
	end
end

function var_0_0.Restart(arg_66_0, arg_66_1)
	arg_66_0:Reset(false, true)
	arg_66_0:InitGame(arg_66_1)
	arg_66_0.bgmPlayer:Stop()
	DormCharacterActionManager:RegisterTaskRunner(arg_66_0.taskRunner, 2, 1)
	arg_66_0:ProcessDanceSeq(arg_66_1.prepareInfo, arg_66_1.roundList, arg_66_1.lastRound)
end

return var_0_0
