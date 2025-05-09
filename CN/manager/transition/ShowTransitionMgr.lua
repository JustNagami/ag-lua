local var_0_0 = class("ShowTransitionMgr", import("game.extend.BaseView"))

function var_0_0.Ctor(arg_1_0)
	if not arg_1_0.gameObject_ then
		arg_1_0.gameObject_ = Object.Instantiate(Asset.Load("UI/Common/switch"), manager.ui.uiMessage.transform)

		SetActive(arg_1_0.gameObject_, false)

		arg_1_0.image_ = arg_1_0.gameObject_.transform:GetComponentInChildren(typeof(Image))
		arg_1_0.color_ = arg_1_0.image_.color
		arg_1_0.color_.a = 0
		arg_1_0.image_.color = arg_1_0.color_
		arg_1_0.animator_ = arg_1_0.gameObject_:GetComponent("Animator")
	end

	gameContext:SetActions(handler(arg_1_0, arg_1_0.Show), handler(arg_1_0, arg_1_0.Hide))
end

function var_0_0.RegistCanEndFunc(arg_2_0, arg_2_1)
	arg_2_0.canEndFunc_ = arg_2_1
end

local var_0_1 = {
	menuPop = true,
	GuelGameSeclectView = true,
	DanceGameView = true,
	TZeroGameChangeView = true,
	DrawCardT0GameView = true,
	GuelGameView = true,
	setting = true
}

function var_0_0.CheckGoHome(arg_3_0, arg_3_1, arg_3_2)
	return arg_3_2 and gameContext:IsOpenRoute("home")
end

function var_0_0.OverrideIgnoreTrainsition(arg_4_0, arg_4_1)
	if gameContext:IsRouteBack() and arg_4_1 == "menuPop" then
		return false
	end

	return var_0_1[arg_4_1]
end

function var_0_0.Show(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	local var_5_0
	local var_5_1
	local var_5_2

	if arg_5_3 then
		local var_5_3 = gameContext:GetAllOpenRoute()

		if var_5_3[1] == "home" then
			local var_5_4 = gameContext.oldRoutes_[1]
			local var_5_5 = gameContext.oldRoutes_

			if var_5_4 ~= "chat" and var_5_4 ~= "clubBoss" and not table.indexof(var_5_5, "DrawCardT0GameView") then
				PlayerTools.UpdateRandomData(HomeSceneSettingConst.RANDOM_MODE.EACH_ENTER)
			end
		end

		local var_5_6

		var_5_1, var_5_6 = manager.loadScene:GetNeedLoadSceneName(var_5_3)

		if not var_5_6 then
			manager.loadScene:StopSceneSoundEffect()
		else
			manager.loadScene:TryStopSceneSoundEffect(var_5_6)
		end
	end

	manager.loadScene:HideLastSceneList()
	arg_5_0:DoCallBack()
	arg_5_0:ClearTimer()

	arg_5_0.callBackFun_ = arg_5_1

	if gameContext ~= nil then
		var_5_0 = gameContext:GetLastOpenPage()

		if (not ViewConst.PLAY_TRANSITION_URL_LIST[var_5_0] or not arg_5_2) and (not arg_5_3 or not var_5_1) and (arg_5_0:OverrideIgnoreTrainsition(var_5_0) or not arg_5_0:CheckGoHome(var_5_0, arg_5_3)) then
			arg_5_0:ClearTimer()
			arg_5_0:DoCallBack()

			return
		end
	end

	SetActive(arg_5_0.gameObject_, true)
	arg_5_0:PlayAnimator("enter")

	if arg_5_3 and var_5_1 then
		var_5_0 = var_5_1
	end

	if var_5_0 and var_5_0 ~= "home" then
		manager.loadScene:SetShouldLoadSceneName(var_5_0)
	end

	arg_5_0.waitNextFrameToCallback = false

	local var_5_7 = false

	arg_5_0.timer_ = FrameTimer.New(function()
		local var_6_0 = true

		if arg_5_0.canEndFunc_ then
			var_6_0 = arg_5_0.canEndFunc_() and manager.loadScene:CanEnd()
		end

		local var_6_1 = arg_5_0.animator_:GetCurrentAnimatorStateInfo(0)

		if not var_6_1:IsName("enter") then
			arg_5_0:PlayAnimator("enter")
		end

		if var_6_1.normalizedTime > 1 and var_6_1:IsName("enter") and var_6_0 then
			if not arg_5_0.waitNextFrameToCallback then
				arg_5_0.waitNextFrameToCallback = true
			else
				LoadingUIManager.inst:CloseLoadUI()
				arg_5_0:ClearTimer()
				arg_5_0:DoCallBack()

				arg_5_0.waitNextFrameToCallback = false
			end
		end

		if var_6_1.normalizedTime > 0.5 and var_6_1:IsName("enter") and not var_5_7 then
			if var_5_0 and var_5_0 == "home" then
				manager.loadScene:SetShouldLoadSceneName(var_5_0)
			end

			var_5_7 = true
		end
	end, 1, -1)

	arg_5_0.timer_:Start()
end

function var_0_0.Hide(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
	if gameContext ~= nil then
		local var_7_0 = gameContext:GetLastOpenPage()

		if (not ViewConst.PLAY_TRANSITION_URL_LIST[var_7_0] or not arg_7_2) and (arg_7_0:OverrideIgnoreTrainsition(var_7_0) or not arg_7_0:CheckGoHome(var_7_0, arg_7_3)) then
			arg_7_0:DoCallBack()
			arg_7_0:ClearTimer()
			SetActive(arg_7_0.gameObject_, false)

			if arg_7_1 then
				arg_7_1()
			end

			return
		end
	end

	arg_7_0:DoCallBack()
	arg_7_0:ClearTimer()

	arg_7_0.callBackFun_ = arg_7_1

	SetActive(arg_7_0.gameObject_, true)

	arg_7_0.waitNextFrameToHide = false
	arg_7_0.timer_ = FrameTimer.New(function()
		if not arg_7_0.waitNextFrameToHide then
			arg_7_0:PlayAnimator("out")

			arg_7_0.waitNextFrameToHide = true

			return
		end

		local var_8_0 = arg_7_0.animator_:GetCurrentAnimatorStateInfo(0)

		if not var_8_0:IsName("out") then
			arg_7_0:PlayAnimator("out", true)
		end

		if var_8_0.normalizedTime > 1 and var_8_0:IsName("out") then
			arg_7_0:ClearTimer()
			SetActive(arg_7_0.gameObject_, false)
			arg_7_0:DoCallBack()

			arg_7_0.waitNextFrameToHide = false
		end
	end, 1, -1)

	arg_7_0.timer_:Start()
end

function var_0_0.OnlyShowEffect(arg_9_0, arg_9_1, arg_9_2)
	if isNil(arg_9_0.animator_) then
		return
	end

	arg_9_0:DoCallBack()
	arg_9_0:ClearTimer()

	arg_9_0.callBackFun_ = arg_9_2

	if arg_9_1 then
		arg_9_0.color_.a = 0
		arg_9_0.image_.color = arg_9_0.color_
	else
		arg_9_0.color_.a = 1
		arg_9_0.image_.color = arg_9_0.color_
	end

	SetActive(arg_9_0.gameObject_, true)

	local var_9_0 = arg_9_1 and "enter" or "out"

	if not arg_9_0.animator_:GetCurrentAnimatorStateInfo(0):IsName(var_9_0) then
		arg_9_0:PlayAnimator(var_9_0)
	end

	arg_9_0.timer_ = FrameTimer.New(function()
		local var_10_0 = arg_9_0.animator_:GetCurrentAnimatorStateInfo(0)

		if not var_10_0:IsName(var_9_0) then
			arg_9_0:PlayAnimator(var_9_0)
		end

		if var_10_0.normalizedTime > 1 and var_10_0:IsName(var_9_0) then
			arg_9_0:ClearTimer()
			arg_9_0:DoCallBack()
		end
	end, 1, -1)

	arg_9_0.timer_:Start()
end

function var_0_0.Dispose(arg_11_0)
	gameContext:SetActions(nil, nil)

	if arg_11_0.gameObject_ ~= nil then
		Object.Destroy(arg_11_0.gameObject_)

		arg_11_0.gameObject_ = nil
	end

	arg_11_0:ClearTimer()

	arg_11_0.image_ = nil
	arg_11_0.canEndFunc_ = nil
	arg_11_0.animator_ = nil

	var_0_0.super.Dispose(arg_11_0)
end

function var_0_0.ClearTimer(arg_12_0)
	if arg_12_0.timer_ then
		manager.loadScene:AddCachePage()
		arg_12_0.timer_:Stop()

		arg_12_0.timer_ = nil
	end
end

function var_0_0.DoCallBack(arg_13_0)
	if arg_13_0.callBackFun_ then
		local var_13_0 = arg_13_0.callBackFun_

		arg_13_0.callBackFun_ = nil

		var_13_0()
	end
end

function var_0_0.AnimatorWillPlay(arg_14_0)
	return gameContext ~= nil and not var_0_1[gameContext:GetLastOpenPage()]
end

function var_0_0.PlayAnimator(arg_15_0, arg_15_1, arg_15_2)
	local var_15_0 = arg_15_0:AnimatorWillPlay() and arg_15_0.animator_.isActiveAndEnabled

	if arg_15_2 then
		var_15_0 = true

		SetActive(arg_15_0.gameObject_, true)
	end

	if var_15_0 then
		arg_15_0.animator_:Play(arg_15_1, -1, 0)
		arg_15_0.animator_:Update(0)
	end
end

return var_0_0
