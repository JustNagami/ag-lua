local var_0_0 = class("DrawCardT0GameView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/System/Main_T0SceneGame/102003/102003_JokerGameUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.OnCtor(arg_3_0)
	return
end

function var_0_0.Init(arg_4_0)
	arg_4_0:InitUI()
	arg_4_0:AddUIListener()
end

function var_0_0.InitUI(arg_5_0)
	arg_5_0:BindCfgUI()

	arg_5_0.selfHpController = arg_5_0.controllers_:GetController("self")
	arg_5_0.enemyHpController = arg_5_0.controllers_:GetController("enemy")
	arg_5_0.selfAniMaskController = arg_5_0.controllers_:GetController("selfAniMask")
	arg_5_0.enemyAniMaskController = arg_5_0.controllers_:GetController("enemyAniMask")
	arg_5_0.hideControlelr = arg_5_0.controllers_:GetController("hide")
end

local var_0_1 = 3

function var_0_0.OnEnter(arg_6_0)
	arg_6_0:RegisterEvents()
	arg_6_0.hideControlelr:SetSelectedState("true")
	SetActive(arg_6_0.tipsGo_, false)
	arg_6_0.jokergameuiAni_:Play("enter", 0, 0)

	arg_6_0.winData = 0
	arg_6_0.loseData = 0

	arg_6_0:UpdateHP(0, 0)
end

function var_0_0.UpdateHP(arg_7_0, arg_7_1, arg_7_2)
	if arg_7_2 then
		arg_7_0.selfHpController:SetSelectedState(var_0_1 - arg_7_2)
	end

	if arg_7_1 then
		arg_7_0.enemyHpController:SetSelectedState(var_0_1 - arg_7_1)
	end
end

function var_0_0.GetPlayBackwardsAnimator(arg_8_0)
	return {
		{
			arg_8_0.jokergameuiAni_,
			"extra",
			false
		}
	}, handler(arg_8_0, arg_8_0.PlayBackwardsAnimatorFun)
end

function var_0_0.PlayBackwardsAnimatorFun(arg_9_0)
	return
end

function var_0_0.SetTipsValue(arg_10_0, arg_10_1, arg_10_2)
	local var_10_0 = {
		[1] = "legTips",
		[2] = "bodyTips"
	}

	SetActive(arg_10_0.tipsGo_, arg_10_1)
	arg_10_0.clickpromptAni_:Play(var_10_0[arg_10_2] or var_10_0[1], 0, 0)
end

function var_0_0.OnTop(arg_11_0)
	arg_11_0:ChangeBar()
	arg_11_0:StopBubbleTimer()
end

function var_0_0.OnBehind(arg_12_0)
	manager.windowBar:HideBar()
end

function var_0_0.OnExit(arg_13_0)
	var_0_0.super.OnExit(arg_13_0)
	arg_13_0:StopBubbleTimer()
	SetActive(arg_13_0.tipsGo_, false)
	AnimatorTools.Stop()
	arg_13_0:RemoveAllEventListener()
end

function var_0_0.RegisterEvents(arg_14_0)
	arg_14_0:RegistEventListener(REFRESH_DRAW_CARD_INFO, function(...)
		arg_14_0:OnUpdateDrawCardInfo(...)
	end)
	arg_14_0:RegistEventListener(DRAW_CARD_TIPS, handler(arg_14_0, arg_14_0.SetTipsValue))
	arg_14_0:RegistEventListener(HOME_POSTER_TALK, handler(arg_14_0, arg_14_0.OnHomePosterTalk))
	arg_14_0:RegistEventListener("POSTERGIRL_T0_MINIGAME_ENTER_STATE", function(arg_16_0)
		arg_14_0:OnMinigameEnterState(arg_16_0)
	end)
end

function var_0_0.AddUIListener(arg_17_0)
	return
end

function var_0_0.OnMinigameEnterState(arg_18_0, arg_18_1)
	local var_18_0 = require("manager.posterGirl.tgame.DrawCardGame.States.Include")

	if isa(arg_18_1, var_18_0.DrawCardState) then
		arg_18_0.hideControlelr:SetSelectedState("false")
	end
end

function var_0_0.ChangeBar(arg_19_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		INFO_BAR
	})
	manager.windowBar:RegistBackCallBack(function()
		manager.transition:OnlyShowEffect(true, function()
			manager.windowBar:HideBar()
			manager.transition:OnlyShowEffect(false)
			manager.posterGirl:SetStateCanChange(true)
			manager.notify:Invoke(HOME_BTN_VISIBE, true)
			DrawCardGameManager.ExitGame(PosterGirlConst.StateKay.init_no_blend)
			JumpTools.Back()
		end)
	end)
	manager.windowBar:SetGameHelpKey({
		view = "gameHelpPro",
		type = "jump",
		params = {
			isPrefab = true,
			pages = GameSetting.brahma_t0_desc1.value
		}
	})
end

function var_0_0.OnUpdateDrawCardInfo(arg_22_0, arg_22_1, arg_22_2)
	local var_22_0 = arg_22_1.win or 3
	local var_22_1 = arg_22_1.lose or 3

	if arg_22_2 then
		local var_22_2 = var_22_1 ~= arg_22_0.loseData
		local var_22_3 = var_22_0 ~= arg_22_0.winData

		if var_22_2 then
			arg_22_0.selfAniMaskController:SetSelectedState(var_0_1 - arg_22_1.lose + 1)
			AnimatorTools.PlayAnimationWithCallback(arg_22_0.selfitemAni_, "Shake", function()
				arg_22_0:UpdateHP(nil, var_22_1)
			end, 0, 0)
		end

		if var_22_3 then
			arg_22_0.enemyAniMaskController:SetSelectedState(var_0_1 - arg_22_1.win + 1)
			AnimatorTools.PlayAnimationWithCallback(arg_22_0.enemyitemAni_, "Shake", function()
				arg_22_0:UpdateHP(var_22_0, nil)
			end, 0, 0)
		end
	else
		arg_22_0:UpdateHP(var_22_0, var_22_1)
	end

	arg_22_0.winData = var_22_0
	arg_22_0.loseData = var_22_1
end

function var_0_0.StartBubbleTimer(arg_25_0, arg_25_1, arg_25_2)
	arg_25_0:StopBubbleTimer()

	arg_25_0.talking = true

	if not isNil(arg_25_0.talkBubbleGo_) then
		SetActive(arg_25_0.talkBubbleGo_, true)
	end

	if not isNil(arg_25_0.talkLabel_) then
		arg_25_0.talkLabel_.text = arg_25_2
	end

	arg_25_0.talkBubbleTimer = Timer.New(function()
		arg_25_0:StopBubbleTimer()
	end, arg_25_1, 1)

	arg_25_0.talkBubbleTimer:Start()
end

function var_0_0.StopBubbleTimer(arg_27_0)
	if arg_27_0.talkBubbleTimer ~= nil then
		arg_27_0.talkBubbleTimer:Stop()

		arg_27_0.talkBubbleTimer = nil
	end

	arg_27_0.talking = false

	if not isNil(arg_27_0.talkBubbleGo_) then
		SetActive(arg_27_0.talkBubbleGo_, false)
	end
end

function var_0_0.OnHomePosterTalk(arg_28_0, arg_28_1, arg_28_2, arg_28_3)
	local var_28_0 = tonumber(arg_28_1)
	local var_28_1 = HeroVoiceDescCfg.Get(var_28_0, arg_28_2[1])

	if var_28_1 then
		arg_28_0:StartBubbleTimer(arg_28_3 / 1000, var_28_1)
	end
end

function var_0_0.Dispose(arg_29_0)
	var_0_0.super.Dispose(arg_29_0)
end

return var_0_0
