﻿local var_0_0 = class("QWPerformMgr")
local var_0_1
local var_0_2
local var_0_3

function var_0_0.Ctor(arg_1_0)
	var_0_1 = import("game.qworld.perform.backhome.QWDormPerformAdaptor")
	var_0_2 = import("game.qworld.perform.backhome.QWDormInteractBehaviourAdaptor")
end

function var_0_0.Init(arg_2_0)
	var_0_1:Init()

	arg_2_0.context = {
		needBackHome = false,
		activeThing = -1,
		luaInterrupt = false
	}
end

function var_0_0.GetCManager(arg_3_0)
	if isNil(var_0_3) then
		var_0_3 = QWPerformManager.Instance
	end

	return var_0_3
end

function var_0_0.SetActivityPerformDirty(arg_4_0)
	arg_4_0.activityPerformDirty = true
end

function var_0_0.IsInActivityPerform(arg_5_0)
	return arg_5_0.activityPerformDirty
end

function var_0_0.TryClearPerformDirty(arg_6_0)
	if arg_6_0.activityPerformDirty then
		arg_6_0.activityPerformDirty = false

		arg_6_0:ForceStopPlayerPerform()

		return true
	end

	return false
end

function var_0_0.TryClearPerformWithBlackFade(arg_7_0, arg_7_1)
	if arg_7_0.activityPerformDirty then
		arg_7_0.activityPerformDirty = false

		arg_7_0:ForceStopPlayerPerform(arg_7_1)
	elseif arg_7_1 then
		arg_7_1()
	end
end

function var_0_0.IsInPerform(arg_8_0)
	return arg_8_0.isInPerform
end

function var_0_0.StartPerform(arg_9_0, arg_9_1, arg_9_2, arg_9_3)
	local var_9_0 = arg_9_1:GetId()

	arg_9_0.isInPerform = true
	arg_9_0.context.luaInterrupt = false
	arg_9_0.context.activeThing = var_9_0
	arg_9_0.context.onFinish = arg_9_3

	manager.notify:Invoke(QWORLD_ENTER_PERFORM, true, QWorldLuaBridge.GetFurnitureCanAutoExit(arg_9_1.entity))
	arg_9_0:GetCManager():StartFurniturInteract(arg_9_1.entity, function()
		arg_9_0:NextPerform(arg_9_1, arg_9_2, function()
			if arg_9_3 then
				arg_9_3()
			end

			arg_9_0.context.activeThing = -1

			manager.notify:Invoke(QWORLD_ENTER_PERFORM, false)

			arg_9_0.isInPerform = false
		end)
	end)
end

function var_0_0.NextPerform(arg_12_0, arg_12_1, arg_12_2, arg_12_3)
	local var_12_0 = arg_12_1:GetId()

	var_0_1:StartPerformTask(function(arg_13_0)
		var_0_2.SetupInteractTask(var_12_0, arg_12_2, arg_13_0, function(arg_14_0)
			if arg_14_0.nextAction then
				local var_14_0 = QWorldLuaBridge.GetFuniturePerformExitAction(arg_12_1.entity)

				if not var_14_0 or var_14_0 == -1 or var_14_0 == 0 then
					arg_12_0:NextPerform(arg_12_1, arg_14_0.nextAction, arg_12_3)

					return
				else
					if arg_12_0.context.luaInterrupt then
						arg_12_0:NextPerform(arg_12_1, var_14_0, arg_12_3)

						return
					end

					if arg_12_0:GetCManager():CheckFuniturePerformInterrupt(arg_12_1.entity) then
						arg_12_0:NextPerform(arg_12_1, var_14_0, arg_12_3)

						return
					else
						arg_12_0:GetCManager():MarkFuniturePerformWaitInterrupt(arg_12_1.entity)
					end
				end

				arg_12_0:NextPerform(arg_12_1, arg_14_0.nextAction, arg_12_3)
			else
				arg_12_0:GetCManager():EndFurniturInteract(arg_12_1.entity)

				if arg_12_3 then
					arg_12_3()
				end

				arg_12_0.context.activeThing = -1
			end
		end)
	end)
end

function var_0_0.ForceStopPlayerPerform(arg_15_0, arg_15_1, arg_15_2)
	if arg_15_0.context.activeThing ~= -1 then
		if arg_15_2 then
			var_0_1:StopRunner()

			local var_15_0 = QWorldMgr:GetQWorldEntityMgr():GetEnt(arg_15_0.context.activeThing)

			arg_15_0:GetCManager():EndFurniturInteract(var_15_0.entity)
			arg_15_0:ForceStopAllTask(true, arg_15_1)
		else
			QWorldMgr:StartBlackFade(0.3, 0.3, 0.2, function()
				var_0_1:StopRunner()

				local var_16_0 = QWorldMgr:GetQWorldEntityMgr():GetEnt(arg_15_0.context.activeThing)

				arg_15_0:GetCManager():EndFurniturInteract(var_16_0.entity)
				arg_15_0:ForceStopAllTask(true, arg_15_1)
			end)
		end
	elseif arg_15_1 then
		arg_15_1()
	end
end

function var_0_0.ForceStopAllTask(arg_17_0, arg_17_1, arg_17_2)
	if arg_17_0.context.activeThing ~= -1 then
		if not arg_17_1 then
			var_0_1:StopRunner()
		end

		if arg_17_0.context.onFinish then
			arg_17_0.context.onFinish()
		end

		manager.notify:Invoke(QWORLD_ENTER_PERFORM, false)

		arg_17_0.isInPerform = false

		if arg_17_2 then
			arg_17_2()
		end

		arg_17_0.context.activeThing = -1
	end
end

function var_0_0.MarkFuniturePerformWaitInterrupt(arg_18_0)
	if arg_18_0.context.activeThing ~= -1 then
		local var_18_0 = QWorldMgr:GetQWorldEntityMgr():GetEnt(arg_18_0.context.activeThing)

		arg_18_0.context.luaInterrupt = true
	else
		manager.notify:Invoke(QWORLD_ENTER_PERFORM, false)
	end
end

function var_0_0.Dispose(arg_19_0)
	var_0_3 = nil

	var_0_1:Dispose()

	var_0_1 = nil
	var_0_2 = nil
end

return var_0_0
