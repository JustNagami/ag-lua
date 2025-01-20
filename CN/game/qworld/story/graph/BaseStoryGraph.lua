local var_0_0 = class("BaseStoryGraph")

function var_0_0.Ctor(arg_1_0)
	arg_1_0:Init()
end

function var_0_0.Identify(arg_2_0)
	return ""
end

function var_0_0.ConfigPath(arg_3_0)
	return ""
end

function var_0_0.BuildContext(arg_4_0)
	arg_4_0.nextCallback = nil
	arg_4_0.blackboardObj = GameObject.Instantiate(Asset.Load(arg_4_0:ConfigPath()))

	if isNil(arg_4_0.blackboardObj) then
		Debug.LogError("错误,不存在的剧情蓝图路径: " .. arg_4_0:ConfigPath())
	end

	arg_4_0.blackboardObj.transform.position = Vector3.zero
	arg_4_0.blackboardObj.transform.rotation = Quaternion.identity
	arg_4_0.blackboardObj.transform.localScale = Vector3.one
	arg_4_0.blackboard = arg_4_0.blackboardObj:GetComponent(typeof(QWorld.Story.Runtime.QWStoryGraphBlackboard))

	if isNil(arg_4_0.blackboard) then
		Debug.LogError("故事是空的?")
	end

	if arg_4_0.blackboard.GraphIdentify ~= arg_4_0:Identify() then
		Debug.LogError("错误,剧情配置与剧情蓝图不匹配，配置Identify: " .. arg_4_0.blackboard.GraphIdentify .. " 蓝图Identify: " .. arg_4_0:Identify())
	end

	arg_4_0.updateIdentity = 1
	arg_4_0.updateDelegate = {}
	arg_4_0.delayIdentity = 1
	arg_4_0.delayDelegate = {}
	arg_4_0.delayDirty = {}
	arg_4_0.funcMap = {}
	arg_4_0.startTimer = Time.time
	arg_4_0.lastTimer = Time.time
	arg_4_0.timer = FrameTimer.New(function()
		local var_5_0 = Time.time - arg_4_0.lastTimer

		arg_4_0:Update(var_5_0)
	end, 1, -1)

	arg_4_0.timer:Start()

	arg_4_0.context = {}
end

function var_0_0.Init(arg_6_0)
	arg_6_0:BuildContext()
	arg_6_0:InjectInterface()
end

function var_0_0.InjectInterface(arg_7_0)
	local var_7_0 = "game.qworld.story.graph.interface."

	import(var_7_0 .. "TalkInterface"):Inject(arg_7_0)
	import(var_7_0 .. "ActionInterface"):Inject(arg_7_0)
	import(var_7_0 .. "EventInterface"):Inject(arg_7_0)
	import(var_7_0 .. "ActorRoleInterface"):Inject(arg_7_0)
	import(var_7_0 .. "EffectInterface"):Inject(arg_7_0)
	import(var_7_0 .. "OutStoryInterface"):Inject(arg_7_0)
end

function var_0_0.Update(arg_8_0, arg_8_1)
	for iter_8_0, iter_8_1 in pairs(arg_8_0.updateDelegate) do
		iter_8_1(arg_8_1)
	end

	arg_8_0.delayDirty = {}

	for iter_8_2, iter_8_3 in pairs(arg_8_0.delayDelegate) do
		if Time.time - iter_8_3.startTime >= iter_8_3.duration then
			iter_8_3.action()

			arg_8_0.delayDirty[iter_8_2] = true
		end
	end

	for iter_8_4, iter_8_5 in pairs(arg_8_0.delayDirty) do
		arg_8_0.delayDelegate[iter_8_4] = nil
	end

	arg_8_0:OnUpdate(arg_8_1)
end

function var_0_0.OnUpdate(arg_9_0, arg_9_1)
	return
end

function var_0_0.OnNext(arg_10_0, arg_10_1)
	if arg_10_0.context.immediateNextFlag ~= nil then
		local var_10_0 = arg_10_0.context.immediateNextFlag

		arg_10_0.context.immediateNextFlag = nil

		arg_10_1(var_10_0)
	else
		arg_10_0.nextCallback = arg_10_1
	end
end

function var_0_0.Next(arg_11_0, arg_11_1)
	if arg_11_0.nextCallback then
		arg_11_0.nextCallback(arg_11_1)
	end
end

function var_0_0.Skip(arg_12_0, arg_12_1)
	local var_12_0 = false

	if arg_12_1 and arg_12_1 ~= "" and arg_12_0.funcMap[arg_12_1] then
		var_12_0 = true

		arg_12_0:ClearOnNext()
		QWorldMgr:StartBlackFade(0.2, 0.3, 0.5, function()
			arg_12_0.funcMap[arg_12_1](arg_12_0)
		end)
	end

	if not var_12_0 then
		arg_12_0:EndStory()
	end
end

function var_0_0.ClearOnNext(arg_14_0)
	QWorldMgr:GetQWorldStoryMgr():GetTalkView():OnAllBtnClick()
	arg_14_0.blackboard:StopCameraShake()
	arg_14_0.blackboard:ClearOnNext()

	arg_14_0.updateIdentity = 1
	arg_14_0.updateDelegate = {}
	arg_14_0.nextCallback = nil
end

function var_0_0.Start(arg_15_0)
	local var_15_0

	if QWorldMgr:GetQWorldStoryMgr():GetTarget() ~= nil then
		var_15_0 = QWorldMgr:GetQWorldStoryMgr():GetTarget().entity
	end

	local var_15_1 = tonumber(arg_15_0:Identify())

	if var_15_1 and SandplayStoryCfg[var_15_1] and SandplayStoryCfg[var_15_1].story_type == 2 then
		QWorldMgr:EnableCamera(QWorldCameraFlag.Story)
	end

	local var_15_2 = true

	if SandplayStoryCfg[var_15_1].story_orientation == 1 then
		var_15_2 = false
	end

	arg_15_0.blackboard:PreStart(var_15_0, SandplayStoryCfg[var_15_1].story_type, var_15_2)
	QWorldMgr:GetQWorldStoryMgr():GetTalkView():Show()
	arg_15_0:StartStory()
end

function var_0_0.StartStory(arg_16_0)
	return
end

function var_0_0.EndStory(arg_17_0)
	QWorldMgr:GetQWorldStoryMgr():StopStory()
end

function var_0_0.OnStopStory(arg_18_0)
	QWorldMgr:GetQWorldStoryMgr():GetTalkView():SetCanShow(true)
	arg_18_0:DisposeEvent()
	arg_18_0:DisposeEffect()
	arg_18_0.blackboard:PreStop()
	arg_18_0:Dispose()
end

function var_0_0.PreContinueStop(arg_19_0)
	arg_19_0:DisposeEvent()
	arg_19_0:DisposeEffect()
	arg_19_0:Dispose()
end

function var_0_0.SetImmediateNextFlag(arg_20_0, arg_20_1)
	if arg_20_0.nextCallback then
		arg_20_0:Next(arg_20_1)
	else
		arg_20_0.context.immediateNextFlag = arg_20_1
	end
end

function var_0_0.RegisterUpdateAction(arg_21_0, arg_21_1)
	arg_21_0.updateIdentity = arg_21_0.updateIdentity + 1
	arg_21_0.updateDelegate[arg_21_0.updateIdentity] = arg_21_1

	return arg_21_0.updateIdentity
end

function var_0_0.RemoveUpdateAction(arg_22_0, arg_22_1)
	arg_22_0.updateDelegate[arg_22_1] = nil
end

function var_0_0.RegisterDelayAction(arg_23_0, arg_23_1, arg_23_2)
	arg_23_0.delayIdentity = arg_23_0.delayIdentity + 1
	arg_23_0.delayDelegate[arg_23_0.delayIdentity] = {
		startTime = Time.time,
		action = arg_23_1,
		duration = arg_23_2
	}

	return arg_23_0.delayIdentity
end

function var_0_0.RemoveDelayAction(arg_24_0, arg_24_1)
	arg_24_0.delayDelegate[arg_24_1] = nil
end

function var_0_0.RegisterTalkFunction(arg_25_0, arg_25_1, arg_25_2)
	arg_25_0.funcMap[arg_25_1] = arg_25_2
end

function var_0_0.Dispose(arg_26_0)
	if arg_26_0.timer then
		arg_26_0.timer:Stop()

		arg_26_0.timer = nil
	end

	arg_26_0.blackboard:Dispose()

	arg_26_0.blackboard = nil

	GameObject.Destroy(arg_26_0.blackboardObj)
	Asset.Unload(arg_26_0:ConfigPath())
end

return var_0_0
