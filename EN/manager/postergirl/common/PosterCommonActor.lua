local var_0_0 = class("PosterCommonActor", PosterGirlBaseActor)

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	var_0_0.super.Ctor(arg_1_0, arg_1_1, arg_1_2)

	local var_1_0, var_1_1 = PosterGirlTools.GetLoadLightEffect(PosterGirlConst.ViewDirect.center, PosterGirlConst.ViewDirect.center)

	if var_1_0 then
		manager.ui:SetSceneLightEffect(var_1_1)
	end
end

function var_0_0.LoadModel(arg_2_0)
	var_0_0.super.LoadModel(arg_2_0)

	arg_2_0.animator = arg_2_0.ui_topse:GetComponent(typeof(Animator))
end

function var_0_0.GetTag(arg_3_0)
	return PosterGirlConst.PosterGirlTag.common
end

function var_0_0.GetAnimator(arg_4_0)
	return arg_4_0.animator
end

function var_0_0.GetState(arg_5_0, arg_5_1)
	if arg_5_0._states[arg_5_1] then
		return arg_5_0._states[arg_5_1]
	end

	local var_5_0 = PosterGirlTools.ProduceCommonState(arg_5_1, arg_5_0)

	if var_5_0 ~= nil then
		var_5_0:SetStateKey(arg_5_1)

		arg_5_0._states[arg_5_1] = var_5_0

		return var_5_0
	end
end

function var_0_0.GetInteractionCfg(arg_6_0)
	local var_6_0 = arg_6_0.skinId
	local var_6_1 = SkinCfg[var_6_0].hero

	return HeroTools:GetUnlockInteractionCfg(var_6_1)
end

function var_0_0.DoShacking(arg_7_0)
	if not arg_7_0:CheckInitState() then
		return
	end

	arg_7_0:ChangeState(PosterGirlConst.StateKay.shake)
end

function var_0_0.DoTouch(arg_8_0)
	if not arg_8_0:CheckInitState() then
		return
	end

	arg_8_0:ChangeState(PosterGirlConst.StateKay.touch)
end

function var_0_0.DoQuickTouch(arg_9_0)
	if not arg_9_0:CheckInitState() then
		return
	end

	arg_9_0:ChangeState(PosterGirlConst.StateKay.quickclick)
end

function var_0_0.DoShowing(arg_10_0)
	if not arg_10_0:CheckInitState() then
		return
	end

	arg_10_0:ChangeState(PosterGirlConst.StateKay.show)
end

function var_0_0.DoGreeting(arg_11_0)
	if not arg_11_0:CheckInitState() then
		return
	end

	arg_11_0:ChangeState(PosterGirlConst.StateKay.greet)
end

function var_0_0.DoIdle(arg_12_0)
	if not arg_12_0:CheckInitState() then
		return
	end

	arg_12_0:ChangeState(PosterGirlConst.StateKay.idle)
end

function var_0_0.DoInit(arg_13_0, arg_13_1)
	arg_13_0:ChangeState(PosterGirlConst.StateKay.init)
end

return var_0_0
