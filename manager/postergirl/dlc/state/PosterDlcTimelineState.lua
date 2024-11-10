local var_0_0 = class("PosterDlcTimelineState", PosterGirlBaseState)

function var_0_0.Ctor(arg_1_0, arg_1_1)
	var_0_0.super.Ctor(arg_1_0, arg_1_1)

	arg_1_0.playableStopped = handler(arg_1_0, arg_1_0.TimelineStopCallback)
end

function var_0_0.Enter(arg_2_0)
	manager.ui:SetMainCameraCom("CinemachineBrain", true)
end

function var_0_0.PlayAni(arg_3_0, arg_3_1)
	arg_3_0.playable, arg_3_0.timeLintGo = arg_3_0.actor:GetPlayable(arg_3_1)

	SetActive(arg_3_0.timeLintGo, true)

	if arg_3_0.playable == nil then
		print("PosterDlcTimelineState error find clipName:" .. arg_3_1)
	end

	arg_3_0.playable.stopped = arg_3_0.playable.stopped + arg_3_0.playableStopped

	arg_3_0.playable:RebuildGraph()
	arg_3_0.playable:Play()
end

function var_0_0.TimelineStopCallback(arg_4_0)
	arg_4_0.actor:ChangeState(PosterGirlConst.StateKay.init)
end

function var_0_0.Exit(arg_5_0, arg_5_1)
	manager.ui:SetMainCameraCom("CinemachineBrain", false)

	arg_5_0.playable.stopped = arg_5_0.playable.stopped - arg_5_0.playableStopped

	if arg_5_1 then
		arg_5_0.playable.time = arg_5_0.playable.duration

		arg_5_0.playable:Evaluate()
	end

	arg_5_0.playable:Stop()
	SetActive(arg_5_0.timeLintGo, false)
end

return var_0_0
