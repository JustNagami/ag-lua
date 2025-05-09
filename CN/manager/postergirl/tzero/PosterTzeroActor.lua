local var_0_0 = class("PosterGirlDlcActor", PosterGirlDlcActor)
local var_0_1 = PosterGirlConst.ViewDirect.center

function var_0_0.Init(arg_1_0)
	arg_1_0:SetViewDirect(var_0_1 or PosterGirlConst.ViewDirect.center)
	arg_1_0:InitSceneInfo()
end

function var_0_0.GetTag(arg_2_0)
	return PosterGirlConst.PosterGirlTag.t0
end

function var_0_0.GetViewDirect(arg_3_0)
	return var_0_1
end

function var_0_0.SetViewDirect(arg_4_0, arg_4_1)
	var_0_1 = arg_4_1
end

function var_0_0.GetHeroPosAndRotCfg(arg_5_0)
	local var_5_0 = 0
	local var_5_1 = SkinSceneActionCfg[arg_5_0.skinId]
	local var_5_2 = arg_5_0:GetSceneID()

	if var_5_1.special_scene_id_2 == var_5_2 then
		var_5_0 = 1
	end

	local var_5_3 = arg_5_0.skinId * 100 + arg_5_0:GetViewDirect() + var_5_0 * 10

	return HeroPosAndRotCfg[var_5_3]
end

function var_0_0.AfterDebut(arg_6_0)
	return
end

function var_0_0.SwipeToLeft(arg_7_0)
	arg_7_0.curSwipeDir = var_0_0.SwipeDir.Left

	local var_7_0 = arg_7_0:GetViewDirect()

	if PosterGirlConst.ViewDirect.center == var_7_0 then
		arg_7_0:SetViewDirect(PosterGirlConst.ViewDirect.left)
		arg_7_0:ChangeState(PosterGirlConst.StateKay.mid2left)
	elseif PosterGirlConst.ViewDirect.right == var_7_0 then
		arg_7_0:SetViewDirect(PosterGirlConst.ViewDirect.center)
		arg_7_0:ChangeState(PosterGirlConst.StateKay.right2mid)
	end

	arg_7_0:OnViewDirectChange()
end

function var_0_0.SwipeToRight(arg_8_0)
	arg_8_0.curSwipeDir = var_0_0.SwipeDir.Right

	local var_8_0 = arg_8_0:GetViewDirect()

	if PosterGirlConst.ViewDirect.center == var_8_0 then
		arg_8_0:SetViewDirect(PosterGirlConst.ViewDirect.right)
		arg_8_0:ChangeState(PosterGirlConst.StateKay.mid2right)
	elseif PosterGirlConst.ViewDirect.left == var_8_0 then
		arg_8_0:SetViewDirect(PosterGirlConst.ViewDirect.center)
		arg_8_0:ChangeState(PosterGirlConst.StateKay.left2mid)
	end

	arg_8_0:OnViewDirectChange()
end

function var_0_0.OnViewDirectChange(arg_9_0)
	local var_9_0 = HomeSceneSettingData:GetCurScene()

	if PosterGirlTools.IsInterruptCurAni(var_9_0) then
		manager.notify:CallUpdateFunc("ClearHomePosterTalk")
		manager.audio:StopVoice()
	end
end

var_0_0.SwipeDir = {
	Right = 1,
	Left = -1,
	None = 0
}

function var_0_0.TouchHelpSingleDrag(arg_10_0, arg_10_1, arg_10_2)
	local var_10_0 = GameSetting.drag_to_move_speed and GameSetting.drag_to_move_speed.value[1] or 200
	local var_10_1 = PosterGirlTools.CanInterruptCurAni()
	local var_10_2 = PosterGirlTools.IsDlcBtn()

	if not var_10_1 then
		return
	end

	local var_10_3 = arg_10_0.cameraManager_.lastCameraIndex

	if arg_10_1 < -1 * var_10_0 and var_10_3 == 0 and not var_10_2 then
		arg_10_0:SwipeToLeft()
	elseif var_10_0 < arg_10_1 and var_10_3 == 0 and not var_10_2 then
		arg_10_0:SwipeToRight()
	elseif not arg_10_0.cameraManager_.IsTweening then
		arg_10_0.curSwipeDir = var_0_0.SwipeDir.None

		arg_10_0.cameraManager_:RotateCamera(arg_10_1, arg_10_2)
	end
end

function var_0_0.UpdateCameraParams(arg_11_0)
	if not arg_11_0.cameraManager_ then
		return
	end

	arg_11_0.cameraManager_:SetCameraParams(arg_11_0:GetViewDirect())
	arg_11_0:SetSelfCamera(0)
end

local function var_0_2(arg_12_0)
	local var_12_0 = tonumber(arg_12_0)
	local var_12_1 = HomeSceneCfg.get_id_list_by_type[SceneConst.HOME_SCENE_IMPACT.TIME]

	for iter_12_0, iter_12_1 in ipairs(var_12_1) do
		local var_12_2 = HomeSceneCfg[iter_12_1]
		local var_12_3 = var_12_2.start_time
		local var_12_4 = var_12_2.end_time

		if var_12_3 <= var_12_0 and var_12_0 <= var_12_4 then
			return var_12_2.action_suffix
		end
	end

	return nil
end

function var_0_0.InitSceneInfo(arg_13_0)
	local var_13_0 = arg_13_0:GetSceneID()
	local var_13_1 = HomeSceneSettingCfg[var_13_0]
	local var_13_2 = manager.time:GetServerTime()

	for iter_13_0, iter_13_1 in ipairs(var_13_1.impact) do
		if iter_13_1 == SceneConst.HOME_SCENE_IMPACT.WEATHER then
			-- block empty
		elseif iter_13_1 == SceneConst.HOME_SCENE_IMPACT.DATA then
			-- block empty
		elseif iter_13_1 == SceneConst.HOME_SCENE_IMPACT.TIME then
			local var_13_3 = manager.time:STimeDescS(var_13_2, "!%H")

			arg_13_0.time_param = var_0_2(var_13_3)
		end
	end
end

function var_0_0.GetTimeParam(arg_14_0)
	return arg_14_0.time_param
end

function var_0_0.GetTimeParam(arg_15_0)
	return arg_15_0.time_param
end

function var_0_0.DOEndDrag(arg_16_0)
	arg_16_0:AddInteractionsTimes()
end

return var_0_0
