local var_0_0 = class("PosterGirlDlcActor", PosterGirlBaseActor)

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	var_0_0.super.Ctor(arg_1_0, arg_1_1, arg_1_2)
	manager.ui:AddMainCameraCom(typeof(CinemachineBrain))

	arg_1_0.playable_list = {}

	arg_1_0:Init()
	arg_1_0:InitSceneEffect()
	arg_1_0:UpdateCameraParams()
	arg_1_0:InitCameraParams()
end

function var_0_0.Init(arg_2_0)
	arg_2_0.view_direct = PosterGirlConst.ViewDirect.center
end

function var_0_0.InitCameraParams(arg_3_0)
	local var_3_0 = manager.ui.mainCamera:GetComponent("CameraExtension")

	if var_3_0 then
		arg_3_0.originShadowRotationImmediately = var_3_0.shadowRotationImmediately
		var_3_0.shadowRotationImmediately = true
	end
end

function var_0_0.RevertCameraParams(arg_4_0)
	local var_4_0 = manager.ui.mainCamera:GetComponent("CameraExtension")

	if var_4_0 then
		var_4_0.shadowRotationImmediately = arg_4_0.originShadowRotationImmediately or true
	end
end

function var_0_0.LoadModel(arg_5_0)
	var_0_0.super.LoadModel(arg_5_0)

	local var_5_0 = arg_5_0.tpose.transform:Find("camera")

	if var_5_0 then
		arg_5_0.cameraManager_ = var_5_0:GetComponent("CharacterCameraManager")
	else
		arg_5_0.cameraManager_ = nil
	end

	manager.heroUiTimeline:BindHero(arg_5_0:GetSkinId(), arg_5_0:GetModelId(), arg_5_0.tpose)
end

function var_0_0.GetHeroPosAndRotCfg(arg_6_0)
	local var_6_0 = arg_6_0.skinId * 100

	return HeroPosAndRotCfg[var_6_0]
end

function var_0_0.GetTag(arg_7_0)
	return PosterGirlConst.PosterGirlTag.t0
end

function var_0_0.CheckDebut(arg_8_0)
	if PlayerData:IsRandomHero() and PlayerData:GetRandomHeroMode() == HomeSceneSettingConst.RANDOM_MODE.EACH_ENTER and not PlayerData:IsRandomHeroShowEachDebutAnim() then
		return false
	end

	if HomeSceneSettingData:GetIsPlay(arg_8_0.skinId) and (not PlayerData:IsRandomHero() or PlayerData:GetRandomHeroMode() ~= HomeSceneSettingConst.RANDOM_MODE.EACH_ENTER or not PlayerData:IsRandomHeroShowEachDebutAnim()) then
		return false
	end

	arg_8_0:ChangeState(PosterGirlConst.StateKay.debut)

	return true
end

function var_0_0.SkipDebut(arg_9_0)
	local var_9_0 = arg_9_0:GetCurrentState()

	if not var_9_0 or var_9_0:GetStateKey() ~= PosterGirlConst.StateKay.debut then
		return false
	end

	arg_9_0:ChangeState(PosterGirlConst.StateKay.init, true)
	arg_9_0:AddInteractionsTimes()

	return true
end

function var_0_0.CheckInitState(arg_10_0)
	local var_10_0 = arg_10_0:GetCurrentState()

	return var_10_0 and var_10_0:GetStateKey() == PosterGirlConst.StateKay.init or false
end

function var_0_0.InitTouchHelp(arg_11_0, arg_11_1)
	arg_11_0.cameraManager_.touchHelper = arg_11_1
end

function var_0_0.TouchHelpIdle(arg_12_0)
	arg_12_0.cameraManager_:TweenToDefaultCameraPos()
end

function var_0_0.TouchHelpSingleDrag(arg_13_0, arg_13_1, arg_13_2)
	if not arg_13_0:CheckInitState() then
		return
	end

	arg_13_0.cameraManager_:RotateCamera(arg_13_1, arg_13_2)
end

function var_0_0.TouchHelpMutiDrag(arg_14_0, arg_14_1)
	local var_14_0 = GameSetting.delta_to_zoom and GameSetting.delta_to_zoom.value[1] or 10

	if var_14_0 < arg_14_1 then
		arg_14_0.cameraManager_:SetActiveCamera(1)
	elseif arg_14_1 < -1 * var_14_0 then
		arg_14_0.cameraManager_:SetActiveCamera(0)
	end
end

function var_0_0.SetSelfCamera(arg_15_0, arg_15_1)
	if arg_15_1 == -1 then
		arg_15_0.cameraManager_:RemoveActiveCamera()
	else
		arg_15_0.cameraManager_:SetActiveCamera(arg_15_1)
	end

	arg_15_0:ResetCameraPos()
end

function var_0_0.ResetCameraPos(arg_16_0)
	arg_16_0.cameraManager_:ResetCameraDefaultCfg()
end

function var_0_0.UpdateCameraParams(arg_17_0)
	arg_17_0.cameraManager_:SetCameraParams(0)
	arg_17_0:SetSelfCamera(0)
end

function var_0_0.MuteCamera(arg_18_0, arg_18_1)
	SetActive(arg_18_0.cameraManager_.gameObject, not arg_18_1)
end

function var_0_0.GetState(arg_19_0, arg_19_1)
	if arg_19_0._states[arg_19_1] then
		return arg_19_0._states[arg_19_1]
	end

	local var_19_0 = PosterGirlTools.ProduceDlcState(arg_19_1, arg_19_0)

	if var_19_0 ~= nil then
		var_19_0:SetStateKey(arg_19_1)

		arg_19_0._states[arg_19_1] = var_19_0

		return var_19_0
	end
end

function var_0_0.DoShacking(arg_20_0)
	if not arg_20_0:CheckInitState() or PosterGirlConst.ViewDirect.center ~= arg_20_0.view_direct then
		return
	end

	arg_20_0:ChangeState(PosterGirlConst.StateKay.shake)
	var_0_0.super.DoShacking(arg_20_0)
end

function var_0_0.DoTouch(arg_21_0)
	local var_21_0 = arg_21_0:GetCurrentState()

	if var_21_0 and var_21_0:CanPlayNextAni() then
		var_21_0:PlayNextAni()

		return
	end

	if not arg_21_0:CheckInitState() then
		return
	end

	arg_21_0:ChangeState(PosterGirlConst.StateKay.touch)
	var_0_0.super.DoTouch(arg_21_0)
end

function var_0_0.DoQuickTouch(arg_22_0)
	local var_22_0 = arg_22_0:GetCurrentState()

	if var_22_0 and var_22_0:CanPlayNextAni() then
		var_22_0:PlayNextAni()

		return
	end

	if not arg_22_0:CheckInitState() or PosterGirlConst.ViewDirect.center ~= arg_22_0.view_direct then
		return
	end

	arg_22_0:ChangeState(PosterGirlConst.StateKay.quickclick)
	var_0_0.super.DoQuickTouch(arg_22_0)
end

function var_0_0.DoShowing(arg_23_0)
	if not arg_23_0:CheckInitState() or PosterGirlConst.ViewDirect.center ~= arg_23_0.view_direct then
		return
	end

	arg_23_0:ChangeState(PosterGirlConst.StateKay.show)
	var_0_0.super.DoShowing(arg_23_0)
end

function var_0_0.DoInit(arg_24_0, arg_24_1)
	if arg_24_1 == PosterGirlConst.ViewTag.home then
		arg_24_0:ChangeState(PosterGirlConst.StateKay.init)
	else
		arg_24_0:ChangeState(PosterGirlConst.StateKay.init_spec, true)
	end
end

function var_0_0.DoIdle(arg_25_0)
	if not arg_25_0:CheckInitState() then
		return
	end

	arg_25_0:ChangeState(PosterGirlConst.StateKay.idle)
end

function var_0_0.Dispose(arg_26_0)
	if arg_26_0._currentState then
		arg_26_0._currentState:Exit(true)
	end

	arg_26_0._currentState = nil

	manager.heroUiTimeline:Unbind()
	arg_26_0:RevertCameraParams()
	var_0_0.super.Dispose(arg_26_0)
end

function var_0_0.ResetBlendShapes(arg_27_0)
	return
end

function var_0_0.DOEndDrag(arg_28_0)
	arg_28_0:AddInteractionsTimes()
end

return var_0_0
