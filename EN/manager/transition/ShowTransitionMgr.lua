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

function var_0_0.Show(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	local var_3_0
	local var_3_1
	local var_3_2

	if arg_3_3 then
		local var_3_3 = gameContext:GetAllOpenRoute()
		local var_3_4

		var_3_1, var_3_4 = manager.loadScene:GetNeedLoadSceneName(var_3_3)

		if not var_3_4 then
			manager.loadScene:StopSceneSoundEffect()
		else
			manager.loadScene:TryStopSceneSoundEffect(var_3_4)
		end
	end

	arg_3_0:DoCallBack()
	arg_3_0:ClearTimer()

	arg_3_0.callBackFun_ = arg_3_1

	if gameContext ~= nil then
		var_3_0 = gameContext:GetLastOpenPage()

		if ViewConst.PLAY_TRANSITION_URL_LIST[var_3_0] and arg_3_2 or arg_3_3 and var_3_1 or arg_3_3 and gameContext:IsOpenRoute("home") then
			-- block empty
		else
			arg_3_0:ClearTimer()
			arg_3_0:DoCallBack()

			return
		end
	end

	SetActive(arg_3_0.gameObject_, true)
	arg_3_0:PlayAnimator("enter")

	if arg_3_3 and var_3_1 then
		var_3_0 = var_3_1
	end

	if var_3_0 then
		manager.loadScene:SetShouldLoadSceneName(var_3_0)
	end

	arg_3_0.waitNextFrameToCallback = false
	arg_3_0.timer_ = FrameTimer.New(function()
		local var_4_0 = true

		if arg_3_0.canEndFunc_ then
			var_4_0 = arg_3_0.canEndFunc_() and manager.loadScene:CanEnd()
		end

		local var_4_1 = arg_3_0.animator_:GetCurrentAnimatorStateInfo(0)

		if not var_4_1:IsName("enter") then
			arg_3_0:PlayAnimator("enter")
		end

		if var_4_1.normalizedTime > 1 and var_4_1:IsName("enter") and var_4_0 then
			if not arg_3_0.waitNextFrameToCallback then
				arg_3_0.waitNextFrameToCallback = true
			else
				LoadingUIManager.inst:CloseLoadUI()
				arg_3_0:ClearTimer()
				arg_3_0:DoCallBack()

				arg_3_0.waitNextFrameToCallback = false
			end
		end
	end, 1, -1)

	arg_3_0.timer_:Start()
end

function var_0_0.Hide(arg_5_0, arg_5_1, arg_5_2)
	if gameContext ~= nil then
		local var_5_0 = gameContext:GetLastOpenPage()

		if (not ViewConst.PLAY_TRANSITION_URL_LIST[var_5_0] or not arg_5_2) and not gameContext:IsOpenRoute("home") then
			arg_5_0:DoCallBack()
			arg_5_0:ClearTimer()
			SetActive(arg_5_0.gameObject_, false)

			if arg_5_1 then
				arg_5_1()
			end

			return
		end
	end

	arg_5_0:DoCallBack()
	arg_5_0:ClearTimer()

	arg_5_0.callBackFun_ = arg_5_1
	arg_5_0.waitNextFrameToHide = false
	arg_5_0.timer_ = FrameTimer.New(function()
		if not arg_5_0.waitNextFrameToHide then
			arg_5_0:PlayAnimator("out")

			arg_5_0.waitNextFrameToHide = true

			return
		end

		local var_6_0 = arg_5_0.animator_:GetCurrentAnimatorStateInfo(0)

		if not var_6_0:IsName("out") then
			arg_5_0:PlayAnimator("out")
		end

		if var_6_0.normalizedTime > 1 and var_6_0:IsName("out") then
			arg_5_0:ClearTimer()
			arg_5_0:DoCallBack()

			arg_5_0.waitNextFrameToHide = false
		end
	end, 1, -1)

	arg_5_0.timer_:Start()
end

function var_0_0.OnlyShowEffect(arg_7_0, arg_7_1, arg_7_2)
	if isNil(arg_7_0.animator_) then
		return
	end

	arg_7_0:DoCallBack()
	arg_7_0:ClearTimer()

	arg_7_0.callBackFun_ = arg_7_2

	if arg_7_1 then
		arg_7_0.color_.a = 0
		arg_7_0.image_.color = arg_7_0.color_
	else
		arg_7_0.color_.a = 1
		arg_7_0.image_.color = arg_7_0.color_
	end

	SetActive(arg_7_0.gameObject_, true)

	local var_7_0 = arg_7_1 and "enter" or "out"

	if not arg_7_0.animator_:GetCurrentAnimatorStateInfo(0):IsName(var_7_0) then
		arg_7_0:PlayAnimator(var_7_0)
	end

	arg_7_0.timer_ = FrameTimer.New(function()
		local var_8_0 = arg_7_0.animator_:GetCurrentAnimatorStateInfo(0)

		if not var_8_0:IsName(var_7_0) then
			arg_7_0:PlayAnimator(var_7_0)
		end

		if var_8_0.normalizedTime > 1 and var_8_0:IsName(var_7_0) then
			arg_7_0:ClearTimer()
			arg_7_0:DoCallBack()
		end
	end, 1, -1)

	arg_7_0.timer_:Start()
end

function var_0_0.Dispose(arg_9_0)
	gameContext:SetActions(nil, nil)

	if arg_9_0.gameObject_ ~= nil then
		Object.Destroy(arg_9_0.gameObject_)

		arg_9_0.gameObject_ = nil
	end

	arg_9_0:ClearTimer()

	arg_9_0.image_ = nil
	arg_9_0.canEndFunc_ = nil
	arg_9_0.animator_ = nil

	var_0_0.super.Dispose(arg_9_0)
end

function var_0_0.ClearTimer(arg_10_0)
	if arg_10_0.timer_ then
		arg_10_0.timer_:Stop()

		arg_10_0.timer_ = nil
	end
end

function var_0_0.DoCallBack(arg_11_0)
	if arg_11_0.callBackFun_ then
		arg_11_0.callBackFun_()

		arg_11_0.callBackFun_ = nil
	end
end

function var_0_0.PlayAnimator(arg_12_0, arg_12_1)
	if arg_12_0.gameObject_.activeSelf then
		arg_12_0.animator_:Play(arg_12_1, -1, 0)
		arg_12_0.animator_:Update(0)
	end
end

return var_0_0
