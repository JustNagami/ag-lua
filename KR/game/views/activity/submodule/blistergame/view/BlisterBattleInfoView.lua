local var_0_0 = class("BlisterBattleInfoView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/System/Summer2024/Summer2024_BlisterGame/BlisterGame02"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.OnCtor(arg_3_0)
	return
end

function var_0_0.Init(arg_4_0)
	arg_4_0.waterEffectList = {}

	arg_4_0:InitUI()
	arg_4_0:AddListeners()
end

function var_0_0.InitUI(arg_5_0)
	arg_5_0:BindCfgUI()

	arg_5_0.nodeList = {}
	arg_5_0.waterDic = {}
	arg_5_0.score = 0
	arg_5_0.leftNum = 0
	arg_5_0.hitNum = 0
	arg_5_0.pointlist = {}
end

function var_0_0.AddListeners(arg_6_0)
	return
end

function var_0_0.ChangeBar(arg_7_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		INFO_BAR
	})
	manager.windowBar:RegistBackCallBack(function()
		if arg_7_0.isEnded then
			return
		end

		BlisterGameLuaBridge.PauseGame()
		JumpTools.OpenPageByJump("BlisterMessageView", {
			state = "onlydetail",
			OkCallback = function()
				if manager.ChessBoardManager and manager.ChessBoardManager:IsBattleBack() then
					ChessBoardAction.GoBackFromSmallGame(1, 0)

					return
				end

				local var_9_0 = BlisterGameData:GetStarByScore(BlisterGameData.passId, arg_7_0.score)

				if isWin then
					BlisterGameAction.SendBlisterGameResult(ActivityConst.ACTIVITY_3_4_BLISTER_GAME, BlisterGameData.passId, arg_7_0.score, var_9_0)
				end

				SDKTools.SendMessageToSDK("activity_combat_over", {
					result = 3,
					activity_id = BlisterGameData.activityID,
					stage_id = BlisterGameData.passId,
					score = arg_7_0.score,
					hit_num = arg_7_0.hitNum,
					remain = arg_7_0.leftNum,
					combat_star = var_9_0
				})
				BlisterGameTool.ExitGame()
			end,
			selfP = arg_7_0
		})
	end)
	manager.windowBar:RegistInfoCallBack(function()
		arg_7_0:GotoHelp()
	end)
end

function var_0_0.GotoHelp(arg_11_0)
	local var_11_0 = ActivityBubbleCfg[BlisterGameData.passId]
	local var_11_1 = BlisterGameTool.GetSession(ActivityConst.SUMMER_CHESS_BOARD_BUBBLE, 1)
	local var_11_2 = "blister_game_describe" .. (var_11_1 == var_11_0.session and 1 or 2)
	local var_11_3 = GameSetting[var_11_2] and GameSetting[var_11_2].value or {}

	JumpTools.OpenPageByJump("gameHelpPro", {
		isPrefab = true,
		pages = var_11_3
	})
end

function var_0_0.UpdateLeftNum(arg_12_0, arg_12_1)
	arg_12_0.textText_.text = arg_12_1
	arg_12_0.isReset = false
end

function var_0_0.OnEnter(arg_13_0)
	arg_13_0.isEnded = false
	arg_13_0.animatorNumList = {}
	arg_13_0.delayTimeList = {}

	SetActive(arg_13_0.effect, false)
	arg_13_0:ChangeBar()
	arg_13_0:UpdateScore(arg_13_0.score)

	local var_13_0 = ActivityBubbleCfg[BlisterGameData.passId]

	arg_13_0:RegistEventListener(BLISTERGAME_UpdateteNum, function(arg_14_0)
		arg_13_0:UpdateLeftNum(arg_14_0)
	end)
	arg_13_0:RegistEventListener(BLISTERGAME_UpdateteScore, function(arg_15_0, arg_15_1)
		local var_15_0 = false
		local var_15_1 = 0
		local var_15_2 = true

		if arg_15_0 == 1 then
			arg_13_0.score = arg_13_0.score + arg_15_1 * GameSetting.activity_bubble_left_point.value[1]
			arg_13_0.leftNum = arg_15_1
			var_15_0 = true
			var_15_1 = 0.6
		elseif arg_15_0 == 2 then
			arg_13_0.score = arg_13_0.score + arg_15_1 * GameSetting.activity_bubble_splash_point.value[1]

			manager.audio:PlayEffect("minigame_activity_3_4", "minigame_activity_3_4_bubble_break", "")

			var_15_0 = true
			var_15_1 = 0.1
		elseif arg_15_0 == 3 then
			arg_13_0.hitNum = math.max(arg_13_0.hitNum, arg_15_1)
			arg_13_0.scoretextText_.text = arg_13_0.score
		elseif arg_15_0 == 4 then
			arg_13_0.score = arg_15_1
			arg_13_0.isReset = true
			var_15_0 = false
			var_15_2 = false
		elseif arg_15_0 == 5 then
			local var_15_3 = math.max(arg_15_1 - 1, 0)

			arg_13_0.score = arg_13_0.score + GameSetting.activity_bubble_combo_point.value[1] * var_15_3
			var_15_0 = true
			var_15_1 = arg_13_0.isEnded and 0.8 or 0.1
		end

		if arg_15_0 ~= 3 then
			arg_13_0:UpdateScore(arg_13_0.score, var_15_0, var_15_1, var_15_2)
		end

		arg_13_0:RefreshScoreState()
	end)
	arg_13_0:RegistEventListener(BLISTERGAME_GAMEEND, function(arg_16_0)
		arg_13_0.isEnded = true

		local var_16_0 = BlisterGameData:GetStarByScore(BlisterGameData.passId, arg_13_0.score)

		if arg_16_0 then
			BlisterGameAction.SendBlisterGameResult(ActivityConst.ACTIVITY_3_4_BLISTER_GAME, BlisterGameData.passId, arg_13_0.score, var_16_0)
		end

		SDKTools.SendMessageToSDK("activity_combat_over", {
			activity_id = BlisterGameData.activityID,
			stage_id = BlisterGameData.passId,
			result = arg_16_0 and 1 or 2,
			score = arg_13_0.score,
			hit_num = arg_13_0.hitNum,
			remain = arg_13_0.leftNum,
			combat_star = var_16_0
		})
		arg_13_0:PlayEndEffect(arg_13_0.leftNum)

		local var_16_1 = TimeTools.StartAfterSeconds(1.2, function()
			JumpTools.OpenPageByJump("blisterResult", {
				id = BlisterGameData.passId,
				score = arg_13_0.score,
				star = var_16_0,
				isWin = arg_16_0
			})
		end, {})

		table.insert(arg_13_0.delayTimeList, var_16_1)
	end)
	arg_13_0:RegistEventListener(BLISTERGAME_UpdateCombo, function(arg_18_0)
		arg_13_0:UpdateCombo(math.max(arg_18_0 - 1, 0))
	end)
	arg_13_0:RegistEventListener(BLISTERGAME_ONWATERRING, function(arg_19_0, arg_19_1, arg_19_2, arg_19_3)
		arg_13_0:AddWaterEffect(arg_19_0, arg_19_1, arg_19_2, arg_19_3)
	end)
	arg_13_0:RegistEventListener(BLISTERGAME_BIGNODE, function()
		manager.audio:PlayEffect("minigame_activity_3_4", "minigame_activity_3_4_bubble_big", "")
	end)
	SetActive(arg_13_0.comboattackGo_, false)
	arg_13_0:RefreshScoreState()
	var_0_0.super.OnEnter(arg_13_0)
	arg_13_0:ResetAnimate()

	if var_13_0.pre == 0 and not getData("BlisterGame3", "showHelp" .. BlisterGameData.passId) then
		arg_13_0:GotoHelp()
		saveData("BlisterGame3", "showHelp" .. BlisterGameData.passId, 1)
	end
end

function var_0_0.RefreshScoreState(arg_21_0)
	local var_21_0 = ActivityBubbleCfg[BlisterGameData.passId]

	for iter_21_0 = 1, 3 do
		if not arg_21_0.nodeList[iter_21_0] then
			arg_21_0.nodeList[iter_21_0] = BlisterGoalItem.New(arg_21_0[string.format("ndnum0%sGo_", iter_21_0)])
		end

		local var_21_1 = arg_21_0.score >= var_21_0.score_level[iter_21_0]

		arg_21_0.nodeList[iter_21_0]:SetData(var_21_1, var_21_0.score_level[iter_21_0] or 0)
	end
end

function var_0_0.ResetAnimate(arg_22_0)
	SetActive(arg_22_0.comboattackGo_, false)

	if arg_22_0.scorebigAni_ then
		arg_22_0.scorebigAni_:Play("Fx_scoretext_idle")
	end

	for iter_22_0, iter_22_1 in pairs(arg_22_0.waterEffectList or {}) do
		if iter_22_1 and iter_22_1.ResetAnimate then
			iter_22_1:ResetAnimate(1)
		end
	end

	if arg_22_0.scoretextAni_ then
		arg_22_0.scoretextAni_:Play("Fx_scoretext_cx", 0, 1)
	end
end

function var_0_0.ChangeTab(arg_23_0, arg_23_1)
	arg_23_0.tabController_:SetSelectedState("state" .. arg_23_1 - 1)
end

function var_0_0.PlayEndEffect(arg_24_0, arg_24_1)
	arg_24_0.textText1_.text = "+" .. arg_24_1 * GameSetting.activity_bubble_left_point.value[1]

	if arg_24_0.scorebigAni_ then
		print(" PlayEndEffect ")
		arg_24_0.scorebigAni_:Play("Fx_scorebig_blow")
	end
end

function var_0_0.OnTop(arg_25_0)
	arg_25_0:ResetAnimate()
	arg_25_0:ChangeBar()

	arg_25_0.isEnded = false
end

function var_0_0.PlayAddWaterEffect(arg_26_0, arg_26_1)
	if arg_26_0.effect then
		arg_26_0.effect.transform.position = arg_26_0.startpositionTrs_.position

		SetActive(arg_26_0.effect, true)
		arg_26_0:RemoveTween()

		arg_26_0.tween_ = LeanTween.move(arg_26_0.effect, arg_26_0.endpositionTrs_.position, 0.5):setEase(LeanTweenType.easeOutCubic):setOnComplete(LuaHelper.VoidAction(function()
			SetActive(arg_26_0.effect, false)

			if not arg_26_0.isEnded and not arg_26_0.isReset then
				arg_26_0.scorebigAni_:Play("Fx_scorebig_cx", 0, 0)
			end

			arg_26_0.textText_.text = arg_26_1
		end))
	end

	arg_26_0:ChangeBar()
end

function var_0_0.RemoveTween(arg_28_0)
	if arg_28_0.tween_ then
		arg_28_0.tween_:setOnComplete(nil)
		LeanTween.cancel(arg_28_0.tween_.id)

		arg_28_0.tween_ = nil
	end
end

function var_0_0.OnTask(arg_29_0)
	return
end

function var_0_0.UpdateCombo(arg_30_0, arg_30_1)
	arg_30_0:AddNumAnimator(arg_30_1)
	arg_30_0:CheckNumAnimator()
end

function var_0_0.AddNumAnimator(arg_31_0, arg_31_1)
	table.insert(arg_31_0.animatorNumList, arg_31_1)
end

function var_0_0.CheckNumAnimator(arg_32_0)
	if not arg_32_0.isNumAni then
		local var_32_0 = table.remove(arg_32_0.animatorNumList, 1)

		if var_32_0 then
			arg_32_0.isNumAni = true

			arg_32_0:DoComboAniamtion(var_32_0)
		else
			arg_32_0.isNumAni = false
		end
	end
end

function var_0_0.DoComboAniamtion(arg_33_0, arg_33_1)
	SetActive(arg_33_0.comboattackGo_, true)

	if arg_33_0.comboattackAni_ then
		arg_33_0.comboattackAni_:Play("Fx_comboattack_cx", 0, 0)
	end

	if arg_33_1 ~= 0 then
		manager.audio:PlayEffect("minigame_activity_3_4", "minigame_activity_3_4_bubble_breakui", "")

		arg_33_0.combotextText_.text = arg_33_1

		local var_33_0 = TimeTools.StartAfterSeconds(0.12, function()
			arg_33_0.isNumAni = false

			arg_33_0:CheckNumAnimator()
		end, {})

		table.insert(arg_33_0.delayTimeList, var_33_0)
	else
		arg_33_0.isNumAni = false

		SetActive(arg_33_0.comboattackGo_, false)
	end
end

function var_0_0.UpdateScore(arg_35_0, arg_35_1, arg_35_2, arg_35_3, arg_35_4)
	local var_35_0 = arg_35_3 or 0

	arg_35_0.now = arg_35_0.scoretextText_.text

	if arg_35_2 and tonumber(arg_35_0.now) < arg_35_0.score - 600 then
		if not arg_35_0.timer_ and tonumber(arg_35_0.now) < arg_35_0.score then
			local var_35_1 = math.floor((arg_35_0.score - arg_35_0.now) / 5)

			arg_35_0.timer_ = Timer.New(function()
				arg_35_0.now = math.min(arg_35_0.now + var_35_1, arg_35_0.score)
				arg_35_0.scoretextText_.text = arg_35_0.now

				if arg_35_0.now >= arg_35_0.score then
					arg_35_0:StopTime()
				end

				if arg_35_0.scoretextAni_ and arg_35_0.scoretextAni_:GetCurrentAnimatorStateInfo(0).normalizedTime >= 1 then
					arg_35_0.scoretextAni_:Play("Fx_scoretext_cx", 0, 0)
				end
			end, 0.01, -1)

			local var_35_2 = TimeTools.StartAfterSeconds(var_35_0, function()
				if arg_35_0.timer_ then
					arg_35_0.timer_:Start()
				end
			end, {})

			table.insert(arg_35_0.delayTimeList, var_35_2)
		end
	else
		if arg_35_0.scoretextAni_ and arg_35_4 then
			arg_35_0.scoretextAni_:Play("Fx_scoretext_cx", 0, 0)
		end

		arg_35_0.scoretextText_.text = arg_35_1
	end
end

function var_0_0.StopTime(arg_38_0)
	if arg_38_0.timer_ ~= nil then
		arg_38_0.timer_:Stop()

		arg_38_0.timer_ = nil
	end
end

function var_0_0.AddWaterEffect(arg_39_0, arg_39_1, arg_39_2, arg_39_3, arg_39_4)
	if not arg_39_0.waterDic[arg_39_1] then
		arg_39_0.waterDic[arg_39_1] = {}
	end

	local var_39_0 = arg_39_0.waterDic[arg_39_1][arg_39_2]

	if not var_39_0 then
		local var_39_1 = Object.Instantiate(arg_39_0.waterGo_, arg_39_0.bubleanimatorTrs_)

		item = BlisterScoreItem.New(var_39_1)

		table.insert(arg_39_0.waterEffectList, item)

		arg_39_0.waterDic[arg_39_1][arg_39_2] = #arg_39_0.waterEffectList
		var_39_0 = #arg_39_0.waterEffectList
	end

	item = arg_39_0.waterEffectList[var_39_0]

	item:SetPosition(arg_39_1, arg_39_2, arg_39_3, arg_39_4, function()
		return
	end)
end

function var_0_0.OnExit(arg_41_0)
	var_0_0.super.OnExit(arg_41_0)
	manager.windowBar:HideBar()
	arg_41_0:StopTime()

	for iter_41_0, iter_41_1 in pairs(arg_41_0.delayTimeList) do
		if iter_41_1 and iter_41_1.Stop then
			iter_41_1:Stop()
		end
	end

	arg_41_0.delayTimeList = {}

	arg_41_0:RemoveTween()
end

function var_0_0.Dispose(arg_42_0)
	var_0_0.super.Dispose(arg_42_0)

	for iter_42_0, iter_42_1 in ipairs(arg_42_0.waterEffectList) do
		iter_42_1:Dispose()
	end

	for iter_42_2, iter_42_3 in ipairs(arg_42_0.nodeList) do
		iter_42_3:Dispose()
	end

	arg_42_0.nodeList = {}
	arg_42_0.waterEffectList = {}
end

return var_0_0
