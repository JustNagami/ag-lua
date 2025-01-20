local var_0_0 = singletonClass("QWorldData")
local var_0_1
local var_0_2
local var_0_3
local var_0_4
local var_0_5
local var_0_6
local var_0_7

function var_0_0.Init(arg_1_0)
	var_0_1 = false
	var_0_2 = {}
	var_0_3 = 0
	var_0_2[var_0_3] = {
		position = {},
		rotation = {},
		cameraPosition = {},
		cameraRotation = {}
	}
	var_0_6 = {
		hintsQueue = {},
		displayDuration = SandplaySettingCfg.pop_hint_display.value[1],
		intervalDuration = SandplaySettingCfg.pop_hint_interval.value[1]
	}
	var_0_7 = {}
end

function var_0_0.InitData(arg_2_0, arg_2_1)
	for iter_2_0, iter_2_1 in ipairs(arg_2_1.stage_list) do
		local var_2_0 = iter_2_1.stage_id
		local var_2_1 = clone(var_0_2[0])

		var_2_1.position = Vector3.New(iter_2_1.position_x, iter_2_1.position_y, iter_2_1.position_z)
		var_2_1.rotation = Quaternion.New(iter_2_1.rotation_x, iter_2_1.rotation_y, iter_2_1.rotation_z, iter_2_1.rotation_w)
		var_0_2[var_2_0] = var_2_1
	end
end

function var_0_0.InitUnlockFunction(arg_3_0, arg_3_1)
	arg_3_0.unLockFunctionIdList_ = arg_3_1.sys_id_list or {}
end

function var_0_0.GetQWorldContext(arg_4_0)
	return var_0_2[var_0_3]
end

function var_0_0.SetQWorldContext(arg_5_0, ...)
	local var_5_0 = arg_5_0:GetQWorldContext()

	if not var_5_0 then
		var_5_0 = clone(var_0_2[0])
		var_0_2[var_0_3] = var_5_0
	end

	local var_5_1 = ...

	var_5_0.position = var_5_1.position or var_5_0.position
	var_5_0.rotation = var_5_1.rotation or var_5_0.rotation
	var_5_0.cameraPosition = var_5_1.cameraPosition or var_5_0.cameraPosition
	var_5_0.cameraRotation = var_5_1.cameraRotation or var_5_0.cameraRotation
	var_5_0.cacheTag = var_5_1.cacheTag or var_5_0.cacheTag
end

function var_0_0.GetCachedPosition(arg_6_0)
	if not arg_6_0:GetQWorldContext() then
		return {
			0,
			0,
			0
		}
	end

	local var_6_0 = arg_6_0:GetQWorldContext().position

	if var_6_0 and var_6_0.x then
		return {
			var_6_0.x,
			var_6_0.y,
			var_6_0.z
		}
	end

	return {
		0,
		0,
		0
	}
end

function var_0_0.GetCurMapId(arg_7_0)
	return var_0_3
end

function var_0_0.SetCurMapId(arg_8_0, arg_8_1)
	var_0_3 = arg_8_1
end

function var_0_0.SetCurSceneName(arg_9_0, arg_9_1)
	var_0_4 = arg_9_1
end

function var_0_0.GetCurSceneName(arg_10_0)
	return var_0_4
end

function var_0_0.SetCurHomeBgmId(arg_11_0, arg_11_1)
	var_0_5 = arg_11_1
end

function var_0_0.GetCurHomeBgmId(arg_12_0)
	return var_0_5 or 0
end

function var_0_0.SetIsBackQWorld(arg_13_0, arg_13_1)
	var_0_1 = arg_13_1
end

function var_0_0.GetIsBackQWorld(arg_14_0)
	return var_0_1
end

function var_0_0.SetCacheTag(arg_15_0, arg_15_1)
	local var_15_0 = arg_15_0:GetQWorldContext()

	if not var_15_0 then
		return
	end

	var_15_0.cacheTag = arg_15_1
end

function var_0_0.GetCacheTag(arg_16_0)
	local var_16_0 = arg_16_0:GetQWorldContext()

	if not var_16_0 then
		return
	end

	return var_16_0.cacheTag
end

function var_0_0.ClearIsBack(arg_17_0)
	local var_17_0 = arg_17_0:GetQWorldContext()

	if var_17_0 then
		var_17_0.cacheTag = nil
	end

	var_0_1 = false
end

function var_0_0.GetHintData(arg_18_0)
	return var_0_6
end

function var_0_0.AddHint(arg_19_0, arg_19_1)
	table.insert(var_0_6.hintsQueue, arg_19_1)
	manager.notify:Invoke(QWORLD_HINT_UPDATE)
end

function var_0_0.PopHint(arg_20_0)
	return table.remove(var_0_6.hintsQueue, 1)
end

function var_0_0.HasHints(arg_21_0)
	return #var_0_6.hintsQueue > 0
end

function var_0_0.AddItemHint(arg_22_0, arg_22_1)
	table.insert(var_0_7, arg_22_1)
	manager.notify:Invoke(QWORLD_HINT_UPDATE)
end

function var_0_0.GetItemHintList(arg_23_0)
	if #var_0_7 < 1 then
		return nil
	else
		local var_23_0 = var_0_7

		var_0_7 = {}

		return var_23_0
	end
end

function var_0_0.HasItemHints(arg_24_0)
	return #var_0_7 > 0
end

function var_0_0.CleanHintDataQuque(arg_25_0)
	var_0_6.hintsQueue = {}
	var_0_7 = {}
end

function var_0_0.AddUnlockFunction(arg_26_0, arg_26_1)
	table.insert(arg_26_0.unLockFunctionIdList_, arg_26_1)
end

function var_0_0.IsUnlockFunction(arg_27_0, arg_27_1)
	return table.indexof(arg_27_0.unLockFunctionIdList_, arg_27_1)
end

return var_0_0
