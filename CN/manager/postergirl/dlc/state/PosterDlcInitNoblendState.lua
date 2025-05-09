local var_0_0 = class("PosterDlcInitNoblendState", PosterDlcTimelineState)

function var_0_0.Ctor(arg_1_0, arg_1_1)
	var_0_0.super.Ctor(arg_1_0, arg_1_1)
end

function var_0_0.Enter(arg_2_0)
	var_0_0.super.Enter(arg_2_0)

	LuaForUtil.IsManualAnimatorBlend = false

	arg_2_0.actor:EnableEyeController(true)
	arg_2_0:PlayInitAni()

	local var_2_0 = arg_2_0.actor:GetInteractionCfg()
	local var_2_1
	local var_2_2 = arg_2_0.actor:GetViewDirect()

	if PosterGirlConst.ViewDirect.center == var_2_2 then
		var_2_1 = var_2_0[PosterGirlConst.InteractionKey.idle]
	elseif PosterGirlConst.ViewDirect.left == var_2_2 then
		var_2_1 = var_2_0[PosterGirlConst.InteractionKey.idle2]
	elseif PosterGirlConst.ViewDirect.right == var_2_2 then
		var_2_1 = var_2_0[PosterGirlConst.InteractionKey.idle3]
	end

	if type(var_2_1) == "table" and #var_2_1 > 0 then
		arg_2_0.idleTimer = Timer.New(function()
			arg_2_0.actor:DoIdle()
		end, 60, -1)

		arg_2_0.idleTimer:Start()
	end
end

function var_0_0.Update(arg_4_0)
	var_0_0.super.Update(arg_4_0)
	arg_4_0:PlayInitAni()
end

function var_0_0.PlayInitAni(arg_5_0)
	local var_5_0 = arg_5_0.actor:GetViewDirect() + 1
	local var_5_1 = "action1_" .. var_5_0

	arg_5_0:PlayAniWithParams(var_5_1)
end

function var_0_0.PlayNextAni(arg_6_0)
	return
end

function var_0_0.Exit(arg_7_0, arg_7_1)
	var_0_0.super.Exit(arg_7_0, arg_7_1)

	LuaForUtil.IsManualAnimatorBlend = true

	if arg_7_0.idleTimer then
		arg_7_0.idleTimer:Stop()

		arg_7_0.idleTimer = nil
	end
end

return var_0_0
