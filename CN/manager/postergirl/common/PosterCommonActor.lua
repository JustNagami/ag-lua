local var_0_0 = class("PosterCommonActor", PosterGirlBaseActor)

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	var_0_0.super.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0:InitSceneEffect()
end

function var_0_0.GetModelPath(arg_2_0)
	return manager.heroUiTimeline:GetModelPath(arg_2_0:GetSkinId(), arg_2_0:GetModelId())
end

function var_0_0.LoadModel(arg_3_0)
	var_0_0.super.LoadModel(arg_3_0)

	arg_3_0.animator = arg_3_0.ui_topse:GetComponent(typeof(Animator))

	manager.heroUiTimeline:BindHero(arg_3_0:GetSkinId(), arg_3_0:GetModelId(), arg_3_0.tpose)
end

function var_0_0.GetTag(arg_4_0)
	return PosterGirlConst.PosterGirlTag.common
end

function var_0_0.GetAnimator(arg_5_0)
	return arg_5_0.animator
end

function var_0_0.GetState(arg_6_0, arg_6_1)
	if arg_6_0._states[arg_6_1] then
		return arg_6_0._states[arg_6_1]
	end

	local var_6_0 = PosterGirlTools.ProduceCommonState(arg_6_1, arg_6_0)

	if var_6_0 ~= nil then
		var_6_0:SetStateKey(arg_6_1)

		arg_6_0._states[arg_6_1] = var_6_0

		return var_6_0
	end
end

function var_0_0.GetInteractionCfg(arg_7_0)
	local var_7_0 = arg_7_0.skinId
	local var_7_1 = tonumber("99" .. var_7_0)

	if HeroInteractionCfg[var_7_1] then
		return arg_7_0:_GetInteractionCfg(var_7_1)
	end

	local var_7_2 = SkinCfg[var_7_0].hero

	return arg_7_0:_GetInteractionCfg(var_7_2)
end

function var_0_0.DoShacking(arg_8_0)
	if not arg_8_0:CheckInitState() then
		return
	end

	arg_8_0:ChangeState(PosterGirlConst.StateKay.shake)
	arg_8_0.super.DoShacking(arg_8_0)
end

function var_0_0.DoTouch(arg_9_0)
	if not arg_9_0:CheckInitState() then
		return
	end

	arg_9_0:ChangeState(PosterGirlConst.StateKay.touch)
	arg_9_0.super.DoTouch(arg_9_0)
end

function var_0_0.DoQuickTouch(arg_10_0)
	if not arg_10_0:CheckInitState() then
		return
	end

	arg_10_0:ChangeState(PosterGirlConst.StateKay.quickclick)
	arg_10_0.super.DoQuickTouch(arg_10_0)
end

function var_0_0.DoShowing(arg_11_0)
	if not arg_11_0:CheckInitState() then
		return
	end

	arg_11_0:ChangeState(PosterGirlConst.StateKay.show)
	arg_11_0.super.DoShowing(arg_11_0)
end

function var_0_0.DoGreeting(arg_12_0)
	if not arg_12_0:CheckInitState() then
		return
	end

	arg_12_0:ChangeState(PosterGirlConst.StateKay.greet)
	arg_12_0.super.DoGreeting(arg_12_0)
end

function var_0_0.DoIdle(arg_13_0)
	if not arg_13_0:CheckInitState() then
		return
	end

	arg_13_0:ChangeState(PosterGirlConst.StateKay.idle)
	arg_13_0.super.DoIdle(arg_13_0)
end

function var_0_0.DoInit(arg_14_0, arg_14_1)
	arg_14_0:ChangeState(PosterGirlConst.StateKay.init)
end

function var_0_0.Dispose(arg_15_0)
	manager.heroUiTimeline:Unbind()
	var_0_0.super.Dispose(arg_15_0)
end

return var_0_0
