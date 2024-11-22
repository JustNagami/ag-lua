local var_0_0 = class("PosterDlcInitState", PosterDlcTimelineState)

function var_0_0.Ctor(arg_1_0, arg_1_1)
	var_0_0.super.Ctor(arg_1_0, arg_1_1)
end

function var_0_0.Enter(arg_2_0)
	var_0_0.super.Enter(arg_2_0)
	arg_2_0.actor:EnableEyeController(true)

	local var_2_0 = arg_2_0.actor:GetViewDirect()
	local var_2_1 = var_2_0 + 1
	local var_2_2 = "action1_" .. var_2_1

	arg_2_0:PlayAni(var_2_2)

	if #arg_2_0.actor:GetInteractionCfg()[PosterGirlConst.InteractionKey.idle] ~= 0 and PosterGirlConst.ViewDirect.center == var_2_0 then
		arg_2_0.idleTimer = Timer.New(function()
			arg_2_0.actor:ChangeState(PosterGirlConst.StateKay.idle)
		end, 60, -1)

		arg_2_0.idleTimer:Start()
	end
end

function var_0_0.TimelineStopCallback(arg_4_0)
	return
end

function var_0_0.Exit(arg_5_0, arg_5_1)
	var_0_0.super.Exit(arg_5_0, arg_5_1)

	if arg_5_0.idleTimer then
		arg_5_0.idleTimer:Stop()

		arg_5_0.idleTimer = nil
	end
end

return var_0_0
