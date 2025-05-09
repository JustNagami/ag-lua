local var_0_0 = class("DanceGameView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/System/Main_T0SceneGame/102003/102003_DanceMachineUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.OnCtor(arg_3_0)
	return
end

local var_0_1 = {
	ToFrontCamPos = 4,
	ToBackCamPos = 5
}

function var_0_0.Init(arg_4_0)
	arg_4_0:InitUI()
	arg_4_0:AddUIListener()

	arg_4_0.btnControll = arg_4_0.btnmodControllerexcollection_:GetController("sel")
end

function var_0_0.InitUI(arg_5_0)
	arg_5_0:BindCfgUI()

	arg_5_0.cutsceneSubView = TZeroGameChangeView.BaseView.New(arg_5_0.cutsceneSubView_)
end

function var_0_0.OnEnter(arg_6_0)
	manager.windowBar:HideBar()
	arg_6_0:RegisterEvents()

	arg_6_0.gameInst = arg_6_0.params_.gameInst
	arg_6_0.modeIndex = 3

	arg_6_0:RefreshMode()
	arg_6_0:ShowRotateTips()
	arg_6_0:StartViewHideTimer()
	arg_6_0:SetVisible(false)
	arg_6_0:GotoFront()
end

function var_0_0.SetVisible(arg_7_0, arg_7_1)
	SetActive(arg_7_0.panel_, arg_7_1)
end

function var_0_0.GetVisible(arg_8_0)
	return arg_8_0.panel_.activeInHierarchy
end

function var_0_0.OnTop(arg_9_0)
	if not arg_9_0.cutsceneSubView:IsDuringCutscene() then
		arg_9_0:ChangeBar()
	end

	arg_9_0:StopBubbleTimer()
end

function var_0_0.OnBehind(arg_10_0)
	manager.windowBar:HideBar()
end

function var_0_0.OnExit(arg_11_0)
	var_0_0.super.OnExit(arg_11_0)
	arg_11_0:SetCameraInputMode(1)

	local var_11_0 = manager.posterGirl.actor

	arg_11_0:StopTime()
	arg_11_0:StopBubbleTimer()
	arg_11_0.cutsceneSubView:OnExit()
	arg_11_0:RemoveAllEventListener()
end

function var_0_0.RegisterEvents(arg_12_0)
	arg_12_0:RegistEventListener(HOME_POSTER_TALK, handler(arg_12_0, arg_12_0.OnHomePosterTalk))
	arg_12_0:RegistEventListener("POSTERGIRL_T0_MINIGAME_ENTER_STATE", function(...)
		arg_12_0:OnMinigameEnterState(...)
	end)
end

function var_0_0.HideRotateTips(arg_14_0)
	SetActive(arg_14_0.arrowAni_.gameObject, false)
end

function var_0_0.ShowRotateTips(arg_15_0)
	SetActive(arg_15_0.arrowAni_.gameObject, true)
	arg_15_0.arrowAni_:Play("DanceMachineUI_arrow", 0, 0)
end

function var_0_0.OnMinigameEnterState(arg_16_0, arg_16_1, arg_16_2)
	local var_16_0 = require("manager.posterGirl.tgame.DanceGame.States.Include")

	if isa(arg_16_1, var_16_0.PlayState) then
		arg_16_0:SetVisible(true)
		arg_16_0:StartViewHideTimer()
	else
		arg_16_0:SetVisible(false)
	end
end

function var_0_0.OnEnterAnimationFinish(arg_17_0, arg_17_1)
	arg_17_0.cutsceneSubView:StartCutscene(arg_17_1, function()
		arg_17_0:ChangeBar()
	end)

	return true
end

function var_0_0.StartViewHideTimer(arg_19_0)
	arg_19_0:StopTime()
	arg_19_0:HideRotateTips()

	arg_19_0.gameInst.lastInput = Time.time
	arg_19_0.viewHideTimer_ = Timer.New(function()
		arg_19_0:ShowRotateTips()
		arg_19_0:StopTime()
	end, 5, 1)

	arg_19_0.viewHideTimer_:Start()
end

function var_0_0.AddUIListener(arg_21_0)
	arg_21_0:AddBtnListener(arg_21_0.btnresetBtn_, nil, function()
		arg_21_0:GotoFront()

		local var_22_0 = arg_21_0.gameInst.recordData[arg_21_0.gameInst.lastAction]

		if var_22_0 then
			var_22_0[var_0_1.ToFrontCamPos] = var_22_0[var_0_1.ToFrontCamPos] + 1
		end
	end)
	arg_21_0:AddBtnListener(arg_21_0.btnconvertBtn_, nil, function()
		arg_21_0:GotoBack()

		local var_23_0 = arg_21_0.gameInst.recordData[arg_21_0.gameInst.lastAction]

		if var_23_0 then
			var_23_0[var_0_1.ToBackCamPos] = var_23_0[var_0_1.ToBackCamPos] + 1
		end
	end)

	local var_21_0 = arg_21_0.trigger_

	var_21_0:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.PointerDown, LuaHelper.EventTriggerAction1(function(arg_24_0, arg_24_1)
		arg_21_0:StartViewHideTimer()
	end))
	var_21_0:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.Drag, LuaHelper.EventTriggerAction1(function(arg_25_0, arg_25_1)
		arg_21_0:RotateCamera(arg_25_1)
	end))
	arg_21_0:SetListener(var_21_0)
	arg_21_0:AddBtnListener(arg_21_0.btnmodBtn_, nil, function()
		arg_21_0.modeIndex = arg_21_0.modeIndex == 2 and 3 or 2

		arg_21_0:RefreshMode()
		manager.posterGirl.actor.cameraManager_:TweenCamComposerToCenter(nil)
	end)
end

function var_0_0.RefreshMode(arg_27_0)
	arg_27_0.btnControll:SetSelectedState(arg_27_0.modeIndex == 2 and "mod2" or "mod1")
	arg_27_0:SetCameraInputMode(arg_27_0.modeIndex)
end

function var_0_0.RotateCamera(arg_28_0, arg_28_1)
	local var_28_0 = arg_28_1.delta / Time.deltaTime / 1000

	manager.posterGirl.actor.cameraManager_:RotateCamera(var_28_0.x, var_28_0.y)
end

function var_0_0.GotoFront(arg_29_0)
	local var_29_0 = manager.posterGirl.actor

	arg_29_0:SetCameraUseCfg(var_29_0, 3)
end

function var_0_0.GotoBack(arg_30_0)
	local var_30_0 = manager.posterGirl.actor

	arg_30_0:SetCameraUseCfg(var_30_0, 4)
end

function var_0_0.SetCameraUseCfg(arg_31_0, arg_31_1, arg_31_2)
	arg_31_1.cameraManager_:TweenAllCamToCameraPosByCfgID(arg_31_2, 2, 3)
end

function var_0_0.SetCameraInputMode(arg_32_0, arg_32_1)
	manager.posterGirl.actor:SetCameraInputMode(arg_32_1)
end

function var_0_0.ChangeBar(arg_33_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		INFO_BAR
	})
	manager.windowBar:RegistBackCallBack(function()
		manager.windowBar:HideBar()
		arg_33_0:Back()
	end)
	manager.windowBar:SetGameHelpKey({
		view = "gameHelpPro",
		type = "jump",
		params = {
			isPrefab = true,
			pages = GameSetting.brahma_t0_desc2.value
		}
	})
end

function var_0_0.StopTime(arg_35_0)
	if arg_35_0.viewHideTimer_ then
		arg_35_0.viewHideTimer_:Stop()

		arg_35_0.viewHideTimer_ = nil
	end
end

function var_0_0.Dispose(arg_36_0)
	var_0_0.super.Dispose(arg_36_0)
	arg_36_0.cutsceneSubView:Dispose()
end

function var_0_0.GetPlayBackwardsAnimator(arg_37_0)
	return arg_37_0.cutsceneSubView:GetPlayBackwardsAnimator(DanceGameManager.ExitGame)
end

function var_0_0.StartBubbleTimer(arg_38_0, arg_38_1, arg_38_2)
	arg_38_0:StopBubbleTimer()

	arg_38_0.talking = true

	if not isNil(arg_38_0.talkBubbleGo_) then
		SetActive(arg_38_0.talkBubbleGo_, true)
	end

	if not isNil(arg_38_0.talkLabel_) then
		arg_38_0.talkLabel_.text = arg_38_2
	end

	arg_38_0.talkBubbleTimer = Timer.New(function()
		arg_38_0:StopBubbleTimer()
	end, arg_38_1, 1)

	arg_38_0.talkBubbleTimer:Start()
end

function var_0_0.StopBubbleTimer(arg_40_0)
	if arg_40_0.talkBubbleTimer ~= nil then
		arg_40_0.talkBubbleTimer:Stop()

		arg_40_0.talkBubbleTimer = nil
	end

	arg_40_0.talking = false

	if not isNil(arg_40_0.talkBubbleGo_) then
		SetActive(arg_40_0.talkBubbleGo_, false)
	end
end

function var_0_0.OnHomePosterTalk(arg_41_0, arg_41_1, arg_41_2, arg_41_3)
	local var_41_0 = tonumber(arg_41_1)
	local var_41_1 = HeroVoiceDescCfg.Get(var_41_0, arg_41_2[1])

	if var_41_1 then
		arg_41_0:StartBubbleTimer(arg_41_3 / 1000, var_41_1)
	end
end

return var_0_0
