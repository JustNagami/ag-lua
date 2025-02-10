local var_0_0 = class("HeroUITimelineMgr")

function var_0_0.Ctor(arg_1_0)
	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	if arg_2_0.inited_ then
		return
	end

	arg_2_0.inited_ = true
	arg_2_0.pool = HeroUITimelinePool.New()
	arg_2_0.timelineStopped_ = handler(arg_2_0, arg_2_0._OnHeroTimelineStopped)
	arg_2_0.timelineBlendSignal_ = handler(arg_2_0, arg_2_0._OnTimelineBlendSignal)
	arg_2_0.timeline_ = HeroUITimeline.New()

	arg_2_0.timeline_:AddCallback(arg_2_0.timelineStopped_, arg_2_0.timelineBlendSignal_)
end

function var_0_0.GetModelPath(arg_3_0, arg_3_1, arg_3_2)
	local var_3_0 = SkinCfg[arg_3_1]

	if string.sub(arg_3_2, 1, 1) ~= "1" and var_3_0.ui_has_timeline ~= 1 then
		return string.format("Char/%s", arg_3_2)
	end

	return string.format("UICharTimeline/%s/%s", arg_3_2, arg_3_2)
end

function var_0_0.BindHero(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
	arg_4_0:_GetTimeline():BindHero(arg_4_1, arg_4_2, arg_4_3)
end

function var_0_0.Unbind(arg_5_0)
	arg_5_0:_GetTimeline():Unbind()

	if arg_5_0.pool then
		arg_5_0.pool:Cleanup()
	end
end

function var_0_0.PlayAction(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0:_GetTimeline():PlayAction(arg_6_1, arg_6_2)
end

function var_0_0.PrepareAction(arg_7_0, arg_7_1)
	arg_7_0:_GetTimeline():PrepareAction(arg_7_1)
end

function var_0_0.SetCallbackStopped(arg_8_0, arg_8_1)
	arg_8_0.curStoppedCallback_ = arg_8_1
end

function var_0_0.SetCallbackBlendSignal(arg_9_0, arg_9_1)
	arg_9_0.curBlendSignalCallback_ = arg_9_1
end

function var_0_0._OnHeroTimelineStopped(arg_10_0, arg_10_1)
	if arg_10_0.curStoppedCallback_ then
		arg_10_0.curStoppedCallback_(arg_10_1)
	end
end

function var_0_0._OnTimelineBlendSignal(arg_11_0)
	if arg_11_0.curBlendSignalCallback_ then
		arg_11_0.curBlendSignalCallback_()
	end
end

function var_0_0._GetTimeline(arg_12_0)
	if not arg_12_0.timeline_ then
		arg_12_0:Init()
	end

	return arg_12_0.timeline_
end

function var_0_0.Dispose(arg_13_0)
	if arg_13_0.timeline_ then
		arg_13_0.timeline_:RemoveCallback(arg_13_0.timelineStopped_, arg_13_0.timelineBlendSignal_)
		arg_13_0.timeline_:Dispose()

		arg_13_0.timeline_ = nil
	end

	arg_13_0.curStoppedCallback_ = nil
	arg_13_0.curBlendSignalCallback_ = nil
	arg_13_0.timelineStopped_ = nil
	arg_13_0.timelineBlendSignal_ = nil

	if arg_13_0.pool then
		arg_13_0.pool:Dispose()

		arg_13_0.pool = nil
	end

	arg_13_0.inited_ = false
end

return var_0_0
