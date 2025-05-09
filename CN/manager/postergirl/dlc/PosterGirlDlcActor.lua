local var_0_0 = class("PosterGirlDlcActor", PosterGirlBaseActor)

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	var_0_0.super.Ctor(arg_1_0, arg_1_1, arg_1_2)
	manager.ui:AddMainCameraCom(typeof(CinemachineBrain))

	arg_1_0.playable_list = {}

	arg_1_0:Init()
	arg_1_0:InitSceneEffect()
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

	arg_5_0:UpdateCameraParams()
	arg_5_0:GetHeroTimelineMgr():BindHero(arg_5_0:GetSkinId(), arg_5_0:GetModelId(), arg_5_0.tpose)
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

function var_0_0.AfterDebut(arg_10_0)
	return
end

local var_0_1 = {
	[PosterGirlConst.StateKay.init] = true,
	[PosterGirlConst.StateKay.init_spec] = true,
	[PosterGirlConst.StateKay.init_no_blend] = true
}

function var_0_0.CheckInitState(arg_11_0)
	local var_11_0 = arg_11_0:GetCurrentState()

	return var_11_0 and var_0_1[var_11_0:GetStateKey()]
end

function var_0_0.InitTouchHelp(arg_12_0, arg_12_1)
	arg_12_0.cameraManager_.touchHelper = arg_12_1
end

function var_0_0.TouchHelpIdle(arg_13_0)
	if arg_13_0:CheckInitState() or arg_13_0:CheckOpenDrag() then
		arg_13_0.cameraManager_:TweenToDefaultCameraPos()
	end
end

function var_0_0.CheckOpenDrag(arg_14_0)
	local var_14_0 = arg_14_0:GetCurrentState()

	return var_14_0 and PosterGirlTools.IsStateOpenDrag(var_14_0:GetStateKey()) or false
end

function var_0_0.TouchHelpSingleDrag(arg_15_0, arg_15_1, arg_15_2)
	if arg_15_0:CheckInitState() or arg_15_0:CheckOpenDrag() then
		arg_15_0.cameraManager_:RotateCamera(arg_15_1, arg_15_2)
	end
end

function var_0_0.TouchHelpMutiDrag(arg_16_0, arg_16_1)
	local var_16_0 = GameSetting.delta_to_zoom and GameSetting.delta_to_zoom.value[1] or 10

	if var_16_0 < arg_16_1 then
		arg_16_0.cameraManager_:SetActiveCamera(1)
	elseif arg_16_1 < -1 * var_16_0 then
		arg_16_0.cameraManager_:SetActiveCamera(0)
	end
end

function var_0_0.SetSelfCamera(arg_17_0, arg_17_1, arg_17_2)
	if arg_17_1 == -1 then
		arg_17_0.cameraManager_:RemoveActiveCamera()
	else
		arg_17_0.cameraManager_:SetActiveCamera(arg_17_1, arg_17_2 or false)
	end

	arg_17_0:ResetCameraPos()
end

function var_0_0.SetCameraInputMode(arg_18_0, arg_18_1)
	if arg_18_0.cameraManager_ then
		arg_18_0.cameraManager_:SwitchCamearInputmode(arg_18_1)
	end
end

function var_0_0.ResetCameraPos(arg_19_0)
	arg_19_0.cameraManager_:ResetCameraDefaultCfg()
end

function var_0_0.UpdateCameraParams(arg_20_0)
	if not arg_20_0.cameraManager_ then
		return
	end

	arg_20_0.cameraManager_:SetCameraParams(0)
	arg_20_0:SetSelfCamera(0)
end

function var_0_0.MuteCamera(arg_21_0, arg_21_1)
	SetActive(arg_21_0.cameraManager_.gameObject, not arg_21_1)
end

function var_0_0.SetCameraParams(arg_22_0, arg_22_1)
	if arg_22_0.cameraManager_ then
		arg_22_0.cameraManager_:SetCameraParams(arg_22_1)
	end
end

function var_0_0.GetState(arg_23_0, arg_23_1)
	local var_23_0 = PosterGirlTools.DlcStateShouldCache(arg_23_1)
	local var_23_1 = nullable(arg_23_0._states, var_23_0)

	;({}).isViewPointChange = PosterGirlTools.IsTZeroViewPointCanLoopSwitch()

	if var_23_1 == nil then
		var_23_1 = PosterGirlTools.ProduceDlcState(arg_23_1, arg_23_0)

		if var_23_1 ~= nil and var_23_0 then
			arg_23_0._states[var_23_0] = var_23_1
		end
	end

	if arg_23_1.key ~= nil then
		var_23_1:SetStateKey(arg_23_1.key)
	else
		var_23_1:SetStateKey(arg_23_1)
	end

	return var_23_1
end

function var_0_0.DoShacking(arg_24_0)
	if not arg_24_0:CheckInitState() or PosterGirlConst.ViewDirect.center ~= arg_24_0.view_direct then
		return
	end

	arg_24_0:ChangeState(PosterGirlConst.StateKay.shake)
	var_0_0.super.DoShacking(arg_24_0)
end

function var_0_0.AcceptTouch(arg_25_0)
	local var_25_0 = arg_25_0:GetCurrentState()

	if var_25_0 and var_25_0:AcceptTouch() then
		return true
	end

	return var_0_0.super.AcceptTouch(arg_25_0)
end

function var_0_0.DoTouch(arg_26_0)
	local var_26_0 = arg_26_0:GetCurrentState()

	if var_26_0 and var_26_0:CanPlayNextAni() then
		var_26_0:PlayNextAni()

		return
	end

	if not arg_26_0:CheckInitState() then
		return
	end

	arg_26_0:ChangeState(PosterGirlConst.StateKay.touch)
	var_0_0.super.DoTouch(arg_26_0)
end

function var_0_0.DoQuickTouch(arg_27_0)
	local var_27_0 = arg_27_0:GetCurrentState()

	if var_27_0 and var_27_0:CanPlayNextAni() then
		var_27_0:PlayNextAni()

		return
	end

	if not arg_27_0:CheckInitState() or PosterGirlConst.ViewDirect.center ~= arg_27_0.view_direct then
		return
	end

	arg_27_0:ChangeState(PosterGirlConst.StateKay.quickclick)
	var_0_0.super.DoQuickTouch(arg_27_0)
end

function var_0_0.DoShowing(arg_28_0)
	if not arg_28_0:CheckInitState() or PosterGirlConst.ViewDirect.center ~= arg_28_0.view_direct then
		return
	end

	arg_28_0:ChangeState(PosterGirlConst.StateKay.show)
	var_0_0.super.DoShowing(arg_28_0)
end

function var_0_0.DoInit(arg_29_0, arg_29_1)
	if arg_29_1 == PosterGirlConst.ViewTag.home then
		arg_29_0:ChangeState(PosterGirlConst.StateKay.init)
	else
		arg_29_0:ChangeState(PosterGirlConst.StateKay.init_spec, true)
	end
end

function var_0_0.DoIdle(arg_30_0)
	if not arg_30_0:CheckIdle() then
		return
	end

	arg_30_0:ChangeState(PosterGirlConst.StateKay.idle)
end

function var_0_0.GetMiniGameKey(arg_31_0, arg_31_1)
	return PosterGirlTools.GetMiniGameAction(arg_31_1, arg_31_0)
end

function var_0_0.Dispose(arg_32_0)
	local var_32_0 = arg_32_0:GetHeroTimelineMgr()

	if var_32_0 then
		var_32_0:Unbind()
	end

	arg_32_0:RevertCameraParams()
	var_0_0.super.Dispose(arg_32_0)
end

function var_0_0.ResetBlendShapes(arg_33_0)
	return
end

function var_0_0.PlayEffect(arg_34_0, arg_34_1, arg_34_2, arg_34_3)
	return arg_34_0:GetHeroTimelineMgr():_GetTimeline():GetTimelineBrain():PlayEffect(arg_34_1, arg_34_2, arg_34_3)
end

function var_0_0.StopEffect(arg_35_0, arg_35_1)
	arg_35_0:GetHeroTimelineMgr():_GetTimeline():GetTimelineBrain():StopEffect(arg_35_1)
end

function var_0_0.SwipeToLeft(arg_36_0)
	return
end

function var_0_0.SwipeToRight(arg_37_0)
	return
end

function var_0_0.DOEndDrag(arg_38_0)
	arg_38_0:AddInteractionsTimes()
end

return var_0_0
