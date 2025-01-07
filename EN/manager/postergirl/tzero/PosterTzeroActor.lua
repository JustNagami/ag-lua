local var_0_0 = class("PosterGirlDlcActor", PosterGirlDlcActor)
local var_0_1 = 0

function var_0_0.Init(arg_1_0)
	arg_1_0.view_direct = var_0_1 or PosterGirlConst.ViewDirect.center

	arg_1_0:InitSceneInfo()
end

function var_0_0.GetTag(arg_2_0)
	return PosterGirlConst.PosterGirlTag.t0
end

function var_0_0.GetViewDirect(arg_3_0)
	return arg_3_0.view_direct
end

function var_0_0.GetHeroPosAndRotCfg(arg_4_0)
	local var_4_0 = 0
	local var_4_1 = SkinSceneActionCfg[arg_4_0.skinId]
	local var_4_2 = arg_4_0:GetSceneID()

	if var_4_1.special_scene_id_2 == var_4_2 then
		var_4_0 = 1
	end

	local var_4_3 = arg_4_0.skinId * 100 + arg_4_0.view_direct + var_4_0 * 10

	return HeroPosAndRotCfg[var_4_3]
end

function var_0_0.SwipeToLeft(arg_5_0)
	if PosterGirlConst.ViewDirect.center == arg_5_0.view_direct then
		arg_5_0.view_direct = PosterGirlConst.ViewDirect.left

		arg_5_0:ChangeState(PosterGirlConst.StateKay.mid2left)
	elseif PosterGirlConst.ViewDirect.right == arg_5_0.view_direct then
		arg_5_0.view_direct = PosterGirlConst.ViewDirect.center

		arg_5_0:ChangeState(PosterGirlConst.StateKay.right2mid)
	end

	var_0_1 = arg_5_0.view_direct
end

function var_0_0.SwipeToRight(arg_6_0)
	if PosterGirlConst.ViewDirect.center == arg_6_0.view_direct then
		arg_6_0.view_direct = PosterGirlConst.ViewDirect.right

		arg_6_0:ChangeState(PosterGirlConst.StateKay.mid2right)
	elseif PosterGirlConst.ViewDirect.left == arg_6_0.view_direct then
		arg_6_0.view_direct = PosterGirlConst.ViewDirect.center

		arg_6_0:ChangeState(PosterGirlConst.StateKay.left2mid)
	end

	var_0_1 = arg_6_0.view_direct
end

function var_0_0.TouchHelpSingleDrag(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = GameSetting.drag_to_move_speed and GameSetting.drag_to_move_speed.value[1] or 200

	if not arg_7_0:CheckInitState() then
		return
	end

	local var_7_1 = arg_7_0.cameraManager_.lastCameraIndex

	if var_7_0 < arg_7_1 and var_7_1 == 0 then
		arg_7_0:SwipeToRight()
	elseif arg_7_1 < -1 * var_7_0 and var_7_1 == 0 then
		arg_7_0:SwipeToLeft()
	else
		arg_7_0.cameraManager_:RotateCamera(arg_7_1, arg_7_2)
	end
end

function var_0_0.UpdateCameraParams(arg_8_0)
	if not arg_8_0.cameraManager_ then
		return
	end

	if PosterGirlConst.ViewDirect.left == arg_8_0.view_direct then
		arg_8_0.cameraManager_:SetCameraParams(1)
	elseif PosterGirlConst.ViewDirect.right == arg_8_0.view_direct then
		arg_8_0.cameraManager_:SetCameraParams(2)
	else
		arg_8_0.cameraManager_:SetCameraParams(0)
	end

	arg_8_0:SetSelfCamera(0)
end

local function var_0_2(arg_9_0)
	local var_9_0 = tonumber(arg_9_0)
	local var_9_1 = HomeSceneCfg.get_id_list_by_type[SceneConst.HOME_SCENE_IMPACT.TIME]

	for iter_9_0, iter_9_1 in ipairs(var_9_1) do
		local var_9_2 = HomeSceneCfg[iter_9_1]
		local var_9_3 = var_9_2.start_time
		local var_9_4 = var_9_2.end_time

		if var_9_3 <= var_9_0 and var_9_0 <= var_9_4 then
			return var_9_2.action_suffix
		end
	end

	return nil
end

function var_0_0.InitSceneInfo(arg_10_0)
	local var_10_0 = arg_10_0:GetSceneID()
	local var_10_1 = HomeSceneSettingCfg[var_10_0]
	local var_10_2 = manager.time:GetServerTime()

	for iter_10_0, iter_10_1 in ipairs(var_10_1.impact) do
		if iter_10_1 == SceneConst.HOME_SCENE_IMPACT.WEATHER then
			-- block empty
		elseif iter_10_1 == SceneConst.HOME_SCENE_IMPACT.DATA then
			-- block empty
		elseif iter_10_1 == SceneConst.HOME_SCENE_IMPACT.TIME then
			local var_10_3 = manager.time:STimeDescS(var_10_2, "!%H")

			arg_10_0.time_param = var_0_2(var_10_3)
		end
	end
end

function var_0_0.GetTimeParam(arg_11_0)
	return arg_11_0.time_param
end

return var_0_0
