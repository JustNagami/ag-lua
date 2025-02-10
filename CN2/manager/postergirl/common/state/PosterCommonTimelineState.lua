local var_0_0 = class("PosterCommonTimelineState", PosterGirlBaseState)

function var_0_0.Ctor(arg_1_0, arg_1_1)
	var_0_0.super.Ctor(arg_1_0, arg_1_1)
end

function var_0_0.Enter(arg_2_0)
	var_0_0.super.Enter(arg_2_0)
end

local var_0_1 = 0.4

function var_0_0.PlayAni(arg_3_0, arg_3_1)
	manager.heroUiTimeline:PlayAction(arg_3_1, {
		fadeSecond = var_0_1,
		talking = arg_3_0.talking_
	})
	manager.heroUiTimeline:SetCallbackBlendSignal(function(arg_4_0)
		arg_3_0:TimelineStopCallback()
	end)
end

function var_0_0.TimelineStopCallback(arg_5_0)
	arg_5_0.actor:ChangeState(PosterGirlConst.StateKay.init)
end

function var_0_0.Exit(arg_6_0, arg_6_1)
	manager.heroUiTimeline:SetCallbackBlendSignal(nil)
	arg_6_0.actor:ResetBlendShapes()
	var_0_0.super.Exit(arg_6_0, arg_6_1)
end

return var_0_0
