local var_0_0 = class("PinballTurnBasedGameView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/Version/BaichaoUI_3_9/BaichaoUI_3_9_PinballUI/BaichaoUI_3_9_PinballSettlementPopUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiPop.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:InitUI()
end

function var_0_0.InitUI(arg_4_0)
	arg_4_0:BindCfgUI()

	arg_4_0.waitingForServer_ = true

	arg_4_0:AddBtnListener(arg_4_0.restartBtn_, nil, function()
		if arg_4_0.waitingForServer_ then
			return
		end

		arg_4_0:Back()
		PinballLuaBridge.GameRestart()
		PinballAction.RecordStartTime()
	end)
	arg_4_0:AddBtnListener(arg_4_0.exitBtn_, nil, function()
		if arg_4_0.waitingForServer_ then
			return
		end

		DestroyLua()
		LuaExchangeHelper.GoToMain()
		OpenPageUntilLoaded("/pinballStage")
	end)

	arg_4_0.winStateController_ = arg_4_0.mainControllerEx_:GetController("state")
	arg_4_0.star1Controller_ = arg_4_0.mainControllerEx_:GetController("star1")
	arg_4_0.star2Controller_ = arg_4_0.mainControllerEx_:GetController("star2")
	arg_4_0.star3Controller_ = arg_4_0.mainControllerEx_:GetController("star3")
	arg_4_0.starControllerList_ = {
		arg_4_0.star1Controller_,
		arg_4_0.star2Controller_,
		arg_4_0.star3Controller_
	}
end

function var_0_0.OnEnter(arg_7_0)
	arg_7_0.winStateController_:SetSelectedState(arg_7_0.params_.remainHp > 0 and "win" or "lose")

	arg_7_0.stageCfg = PinballStageCfg[PinballAction.PlayingStageID]
	arg_7_0.titleText_.text = arg_7_0.stageCfg.name
	arg_7_0.iconImg_.spriteSync = PinballTools.GetRoleIconPath(PinballAction.PlayingRoleID)

	if arg_7_0.params_.remainHp > 0 then
		arg_7_0.tipsText_.text = GetTips("PINBALL_WIN_TIPS")

		manager.audio:PlayEffect("minigame_activity_3_9", "minigame_activity_3_9_xinmo_win", "")
	else
		if PinballTools.CheckRoleCanUpgrade(PinballAction.PlayingRoleID) then
			arg_7_0.tipsText_.text = GetTips("PINBALL_LOSE_TIPS_1")
		else
			arg_7_0.tipsText_.text = GetTips("PINBALL_LOSE_TIPS_2")
		end

		manager.audio:PlayEffect("minigame_activity_3_9", "minigame_activity_3_9_xinmo_lose", "")
	end

	for iter_7_0 = 1, 3 do
		local var_7_0 = arg_7_0.stageCfg.target_list[iter_7_0]
		local var_7_1 = nullable(ConditionCfg, var_7_0)

		arg_7_0["star" .. iter_7_0 .. "Text_"].text = var_7_1.desc

		arg_7_0.starControllerList_[iter_7_0]:SetSelectedState(PinballData:GetStageTargetClear(arg_7_0.stageCfg.id, var_7_0) and "true" or "false")
	end

	if arg_7_0.params_.remainHp > 0 then
		PinballAction.SendLevelFinish(arg_7_0.params_.remainHp, arg_7_0.params_.allRound)

		arg_7_0.waitingForServer_ = true
		arg_7_0.sendTimer_ = Timer.New(function()
			PinballAction.CheckRewardPop()

			arg_7_0.waitingForServer_ = false

			if arg_7_0.sendTimer_ then
				arg_7_0.sendTimer_:Stop()

				arg_7_0.sendTimer_ = nil
			end
		end, 1.5, 1)

		arg_7_0.sendTimer_:Start()
	else
		arg_7_0.waitingForServer_ = false

		PinballAction.SendResultToSdk(2, arg_7_0.params_.allRound, arg_7_0.params_.SC, arg_7_0.params_.BH, arg_7_0.params_.EH, arg_7_0.params_.remainEHp, arg_7_0.params_.remainHp)
	end
end

function var_0_0.OnPinballTargetUpdate(arg_9_0)
	for iter_9_0 = 1, 3 do
		local var_9_0 = arg_9_0.stageCfg.target_list[iter_9_0]

		arg_9_0.starControllerList_[iter_9_0]:SetSelectedState(PinballData:GetStageTargetClear(arg_9_0.stageCfg.id, var_9_0) and "true" or "false")
	end

	if arg_9_0.params_.remainHp > 0 then
		PinballAction.SendResultToSdk(1, arg_9_0.params_.allRound, arg_9_0.params_.SC, arg_9_0.params_.BH, arg_9_0.params_.EH, arg_9_0.params_.remainEHp, arg_9_0.params_.remainHp)
	end
end

function var_0_0.OnExit(arg_10_0)
	if arg_10_0.sendTimer_ then
		arg_10_0.sendTimer_:Stop()

		arg_10_0.sendTimer_ = nil
	end
end

function var_0_0.Dispose(arg_11_0)
	var_0_0.super.Dispose(arg_11_0)
end

return var_0_0
