local var_0_0 = class("HeroUITimeline")

local function var_0_1(arg_1_0)
	if arg_1_0 == nil or HeroUITimelineBrain == nil then
		return nil
	end

	local var_1_0 = typeof(HeroUITimelineBrain)
	local var_1_1 = arg_1_0:GetComponent(var_1_0)

	if var_1_1 == nil then
		var_1_1 = arg_1_0:AddComponent(var_1_0)
	end

	return var_1_1
end

local function var_0_2(arg_2_0)
	if arg_2_0 == nil then
		return nil
	end

	return arg_2_0:GetComponentInChildren(typeof(Animator))
end

local var_0_3 = {
	fadeSecond = 0.5,
	isUniqueBlending = true
}

function var_0_0.Ctor(arg_3_0)
	arg_3_0.stopped_ = handler(arg_3_0, arg_3_0._OnTimelineStopped)
	arg_3_0.stoppedCallbacks_ = {}
	arg_3_0.blendSignalCallbacks_ = {}
	arg_3_0.playInfo_ = var_0_3
end

function var_0_0.BindHero(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
	arg_4_0.skinId_ = arg_4_1
	arg_4_0.modelId_ = arg_4_2
	arg_4_0.modelGo_ = arg_4_3

	if not isNil(arg_4_0.animator_) then
		arg_4_0.animator_.runtimeAnimatorController = arg_4_0.controller_
	end

	arg_4_0.animator_ = var_0_2(arg_4_3)

	if arg_4_0.animator_ then
		arg_4_0.controller_ = arg_4_0.animator_.runtimeAnimatorController
	end
end

function var_0_0.Unbind(arg_5_0)
	arg_5_0:Stop()
	arg_5_0:BindHero(nil, nil, nil)
end

function var_0_0.AddCallback(arg_6_0, arg_6_1, arg_6_2)
	if arg_6_1 then
		table.insert(arg_6_0.stoppedCallbacks_, arg_6_1)
	end

	if arg_6_2 then
		table.insert(arg_6_0.blendSignalCallbacks_, arg_6_2)
	end
end

function var_0_0.RemoveCallback(arg_7_0, arg_7_1, arg_7_2)
	if arg_7_1 then
		table.removebyvalue(arg_7_0.stoppedCallbacks_, arg_7_1)
	end

	if arg_7_2 then
		table.removebyvalue(arg_7_0.blendSignalCallbacks_, arg_7_2)
	end
end

function var_0_0.PlayAction(arg_8_0, arg_8_1, arg_8_2)
	if arg_8_0.skinId_ == nil or arg_8_0.modelId_ == nil then
		return
	end

	local var_8_0 = var_0_1(arg_8_0.modelGo_)

	if var_8_0 == nil then
		Debug.LogError(string.format("无法播放Timeline %s, 找不到brain", arg_8_1))

		return
	end

	arg_8_0.brain_ = var_8_0

	if arg_8_2 then
		arg_8_0.playInfo_ = clone(var_0_3)

		table.merge(arg_8_0.playInfo_, arg_8_2)
	else
		arg_8_0.playInfo_ = var_0_3
	end

	arg_8_0.needSignal_ = not arg_8_0.playInfo_.isLoop

	local var_8_1, var_8_2 = manager.heroUiTimeline.pool:GetTimelineAction(arg_8_0.skinId_, arg_8_0.modelId_, arg_8_1)

	if isNil(var_8_1) or isNil(var_8_2) then
		return
	end

	SetActive(var_8_2, true)
	var_8_2.transform:SetParent(arg_8_0.modelGo_.transform)

	var_8_2.transform.localPosition = Vector3.zero
	var_8_2.transform.localRotation = Quaternion.Euler(0, 0, 0)
	var_8_2.transform.localScale = Vector3.one

	arg_8_0:_BindPlayable(var_8_1)

	if arg_8_0.playInfo_.isLoop ~= nil then
		var_8_1.extrapolationMode = arg_8_0.playInfo_.isLoop and UnityEngine.Playables.DirectorWrapMode.Loop or UnityEngine.Playables.DirectorWrapMode.None
	end

	if arg_8_0.animator_ then
		arg_8_0.animator_.runtimeAnimatorController = nil
	end

	arg_8_0.brain_:RebuildPlayableDirector(var_8_1)
	arg_8_0:_TransitionTimeline(arg_8_1, var_8_2, var_8_1)
end

function var_0_0.Stop(arg_9_0)
	arg_9_0:_StopTimer()

	if not isNil(arg_9_0.playableDirector_) then
		arg_9_0.playableDirector_:Stop()

		arg_9_0.playableDirector_.stopped = arg_9_0.playableDirector_.stopped - arg_9_0.stopped_
		arg_9_0.playableDirector_ = nil
		arg_9_0.directorTime_ = 0
	end

	if arg_9_0.timelineGo_ then
		arg_9_0:_SwitchGroup(nil)

		arg_9_0.timelineGo_ = nil
	end

	if arg_9_0.animator_ then
		arg_9_0.animator_.runtimeAnimatorController = arg_9_0.controller_

		local var_9_0 = arg_9_0.animator_:GetCurrentAnimatorClipInfo(0)

		if var_9_0.Length > 0 then
			local var_9_1 = var_9_0[0].clip.name

			arg_9_0.animator_:Play(var_9_1, -1, 0)
		end
	end

	arg_9_0.actionName_ = nil
	arg_9_0.lastBlendTime_ = nil
	arg_9_0.needSignal_ = nil
end

function var_0_0.PrepareAction(arg_10_0, arg_10_1)
	if arg_10_0.skinId_ == nil or arg_10_0.modelId_ == nil then
		return
	end

	local var_10_0, var_10_1 = manager.heroUiTimeline.pool:GetTimelineAction(arg_10_0.skinId_, arg_10_0.modelId_, arg_10_1)

	if not isNil(var_10_1) then
		var_10_1.transform:SetParent(arg_10_0.modelGo_.transform)
		manager.heroUiTimeline.pool:ReturnTimelineAction(var_10_1)
	end
end

function var_0_0._TransitionTimeline(arg_11_0, arg_11_1, arg_11_2, arg_11_3)
	arg_11_0:_StartTimer()

	if arg_11_0.playableDirector_ ~= arg_11_3 then
		arg_11_0.isTransitioning = true

		if not isNil(arg_11_0.playableDirector_) then
			arg_11_0.playableDirector_:Stop()

			arg_11_0.playableDirector_.stopped = arg_11_0.playableDirector_.stopped - arg_11_0.stopped_
			arg_11_0.playableDirector_ = nil
			arg_11_0.directorTime_ = 0

			if arg_11_3 then
				arg_11_0.lastBlendTime_ = arg_11_0.playInfo_.fadeSecond
			end
		end

		if arg_11_3 then
			arg_11_0.playableDirector_ = arg_11_3
			arg_11_0.playableDirector_.stopped = arg_11_0.playableDirector_.stopped + arg_11_0.stopped_

			arg_11_3:Play()
		end

		arg_11_0.isTransitioning = false
	end

	if arg_11_0.timelineGo_ ~= arg_11_2 then
		if arg_11_0.timelineGo_ then
			arg_11_0:_SwitchGroup(arg_11_0.playInfo_.group)

			arg_11_0.timelineGo_ = nil
		end

		arg_11_0.timelineGo_ = arg_11_2
	end

	arg_11_0.actionName_ = arg_11_1
end

function var_0_0._SwitchGroup(arg_12_0, arg_12_1)
	if arg_12_1 then
		if arg_12_1 ~= arg_12_0.lastGroup_ then
			arg_12_0:_ReleaseGroup()
		else
			arg_12_0.groupList_ = arg_12_0.groupList_ or {}

			table.insert(arg_12_0.groupList_, arg_12_0.timelineGo_)
		end
	else
		arg_12_0:_ReleaseGroup()
	end

	arg_12_0.lastGroup_ = arg_12_1
end

function var_0_0._ReleaseGroup(arg_13_0)
	if arg_13_0.groupList_ then
		for iter_13_0, iter_13_1 in ipairs(arg_13_0.groupList_) do
			manager.heroUiTimeline.pool:ReturnTimelineAction(iter_13_1)
		end
	end

	arg_13_0.groupList_ = nil

	manager.heroUiTimeline.pool:ReturnTimelineAction(arg_13_0.timelineGo_)
end

function var_0_0._BindPlayable(arg_14_0, arg_14_1)
	arg_14_0.brain_.talking = arg_14_0.playInfo_.talking

	arg_14_0.brain_:BindPlayableDirector(arg_14_1)
end

function var_0_0._OnTimelineStopped(arg_15_0, arg_15_1)
	if not arg_15_0.isTransitioning and arg_15_0.needSignal_ then
		local var_15_0 = arg_15_0.playableDirector_.duration
		local var_15_1 = arg_15_0.directorTime_ or arg_15_0.playableDirector_.time

		if var_15_0 < var_15_1 + arg_15_0.playInfo_.fadeSecond and arg_15_0.playInfo_.isUniqueBlending and arg_15_0.lastBlendTime_ and var_15_1 < arg_15_0.lastBlendTime_ then
			arg_15_0.needSignal_ = false

			arg_15_0:_OnTimelineBlendSignal()
		end
	end

	for iter_15_0, iter_15_1 in ipairs(arg_15_0.stoppedCallbacks_) do
		iter_15_1(arg_15_1)
	end
end

function var_0_0._OnTimelineBlendSignal(arg_16_0)
	for iter_16_0, iter_16_1 in ipairs(arg_16_0.blendSignalCallbacks_) do
		iter_16_1()
	end
end

function var_0_0._Tick(arg_17_0)
	if isNil(arg_17_0.playableDirector_) then
		return
	end

	if arg_17_0.needSignal_ then
		local var_17_0 = arg_17_0.playableDirector_.duration
		local var_17_1 = arg_17_0.playableDirector_.time

		arg_17_0.directorTime_ = var_17_1

		if var_17_0 < var_17_1 + arg_17_0.playInfo_.fadeSecond then
			local var_17_2 = true

			if arg_17_0.playInfo_.isUniqueBlending and arg_17_0.lastBlendTime_ and var_17_1 < arg_17_0.lastBlendTime_ then
				var_17_2 = false
			end

			if var_17_2 then
				arg_17_0.needSignal_ = false

				arg_17_0:_OnTimelineBlendSignal()
			end
		end
	end
end

function var_0_0._StartTimer(arg_18_0)
	if arg_18_0.timer_ == nil then
		arg_18_0.timer_ = Timer.New(function()
			arg_18_0:_Tick()
		end, 0.033, -1)

		arg_18_0.timer_:Start()
	end
end

function var_0_0._StopTimer(arg_20_0)
	if arg_20_0.timer_ ~= nil then
		arg_20_0.timer_:Stop()

		arg_20_0.timer_ = nil
	end
end

function var_0_0.Dispose(arg_21_0)
	arg_21_0:Stop()

	arg_21_0.skinId_ = nil
	arg_21_0.modelGo_ = nil
	arg_21_0.animator_ = nil
	arg_21_0.stoppedCallbacks_ = nil
	arg_21_0.blendSignalCallbacks_ = nil
	arg_21_0.stopped_ = nil
end

return var_0_0
