local var_0_0 = {}
local var_0_1

function var_0_0.SetUpZuma()
	local var_1_0 = SceneManager.GetSceneByName("X108")

	SceneManager.SetActiveScene(var_1_0)
	manager.uiInit()
	gameContext:SetSystemLayer("battle")
	manager.ui:SetMainCamera("zuma")
	JumpTools.OpenPageByJump("ZumaGameView")
	ZumaToLuaBridge.CameraAdaptive()
end

function var_0_0.CameraAdaptive()
	local var_2_0 = manager.ui.canvas:GetComponent(typeof(Canvas)).worldCamera
	local var_2_1 = UnityEngine.Camera.main
	local var_2_2 = manager.ui:GetCanvasSize()
	local var_2_3 = _G.SCREEN_WIDTH / _G.SCREEN_HEIGHT
	local var_2_4 = 1.8888888888888888
	local var_2_5 = CameraCfg.zuma.fieldOfView

	manager.ui:SetMainCameraFieldOfView(var_2_5)

	local var_2_6 = GameObject.Find("ZumaPlayEnter/Bg")
	local var_2_7 = var_2_6.transform:GetComponent("SpriteRenderer").sprite.bounds
	local var_2_8 = var_2_6.transform.position
	local var_2_9 = var_2_1.transform:InverseTransformPoint(var_2_8)
	local var_2_10 = math.abs(var_2_9.z)
	local var_2_11 = Mathf.Tan(var_2_1.fieldOfView * 0.5 * Mathf.Deg2Rad)
	local var_2_12 = 2 * var_2_10 * var_2_11
	local var_2_13 = var_2_12 * var_2_1.aspect
	local var_2_14 = var_2_7.max - var_2_7.min
	local var_2_15 = var_2_14.x
	local var_2_16 = var_2_14.y
	local var_2_17 = var_2_15 - var_2_13
	local var_2_18 = var_2_16 - var_2_12
	local var_2_19 = var_2_10

	if var_2_17 < var_2_18 then
		var_2_19 = 0.5 * var_2_16 / var_2_11
	else
		var_2_19 = 0.5 * var_2_15 / var_2_11 / var_2_1.aspect
	end

	var_2_1.transform.position = Vector3(0, 0, -var_2_19)

	manager.notify:CallUpdateFunc(ZUMA_CAMERA_UPDATE)
end

function var_0_0.OnZumaSceneLoaded()
	var_0_1 = GameLocalData:GetCommonModule("userSetting").frame or PictureQualitySettingCfg[5].frame

	if var_0_1 ~= 1 then
		SettingAction.ChangePicSetting("frame", 1)
	end
end

function var_0_0.OnZumaSceneExit()
	if var_0_1 ~= 1 then
		SettingAction.ChangePicSetting("frame", var_0_1)
	end

	gameContext:SetSystemLayer("home")
end

function var_0_0.OnZumaOver(arg_5_0)
	JumpTools.OpenPageByJump("ZumaGameSettle", {
		isWin = arg_5_0
	})
end

function var_0_0.ZumaballHit(arg_6_0)
	ZumaData:SetZumaScore(arg_6_0)
	manager.notify:CallUpdateFunc(ZUMA_BALL_HIT)
end

function var_0_0.ZumaBallCountsUpdate(arg_7_0)
	ZumaData:SetZumaBallCount(arg_7_0)
	manager.notify:CallUpdateFunc(ZUMA_BALL_COUNT_UPDATE)
end

function var_0_0.ZumaCombo(arg_8_0)
	manager.notify:CallUpdateFunc(ZUMA_COMBO_UPDATE, arg_8_0)
end

function var_0_0.ZumaStop(arg_9_0)
	manager.notify:CallUpdateFunc(ZUMA_STOP_SHOW, arg_9_0)
end

function var_0_0.GetZumaGamePlayTime()
	local var_10_0 = ZumaLuaBridge.GetCurTime()

	return math.floor(var_10_0)
end

return var_0_0
