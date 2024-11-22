local var_0_0 = class("UIManager")
local var_0_1 = "adv"

function var_0_0.Ctor(arg_1_0)
	arg_1_0.uiMain = GameObject.Find("UICamera/Canvas/UIMain")
	arg_1_0.uiStory = GameObject.Find("UICamera/Canvas/UIStory/Canvas")
	arg_1_0.uiPop = GameObject.Find("UICamera/Canvas/UIPop/Canvas")
	arg_1_0.uiMessage = GameObject.Find("UICamera/Canvas/UIMessage/Canvas")
	arg_1_0.uiTips = GameObject.Find("UICamera/Canvas/UITips/Canvas")
	arg_1_0.uiLoad = GameObject.Find("UICamera/Canvas/UILoad/Canvas")
	arg_1_0.uiHPPanel = GameObject.Find("UICamera/Canvas/UIMain/HPPanel")
	arg_1_0.mainCamera = GameObject.Find("MainCamera")
	arg_1_0.canvas = GameObject.Find("UICamera/Canvas")
	arg_1_0.dontDestroyCanvas = GameObject.Find("UICamera_DontDestroy/Canvas")
	arg_1_0.uiCanvasGroup = arg_1_0.canvas:GetComponent("CanvasGroup")
	arg_1_0.canvasSize_ = arg_1_0.canvas:GetComponent("RectTransform").sizeDelta

	local var_1_0 = arg_1_0.mainCamera.transform

	var_1_0.localPosition = Vector3(0, 0, 2)
	var_1_0.localEulerAngles = Vector3(0, 180, 0)
	arg_1_0.mainCameraPos_ = Vector3(0, 0, 2)
	arg_1_0.mainCameraRot_ = Vector3(0, 180, 0)
	arg_1_0.mainCameraCom_ = arg_1_0.mainCamera:GetComponent("Camera")
	arg_1_0.cameraExtension = arg_1_0.mainCamera:GetComponent(typeof(UnityEngine.Pipelines.SimPipeline.CameraExtension))
	arg_1_0.sceneObject_ = {}
	arg_1_0.canvasRate = arg_1_0.canvas:GetComponent("RectTransform").sizeDelta.x / Screen.width
	arg_1_0.UIDGo_ = GameObject.Find("UICamera_DontDestroy/Canvas/UIMessage/UIDText")
	arg_1_0.UIDText_ = arg_1_0.UIDGo_:GetComponent(typeof(Text))
	arg_1_0.tipImageRect_ = GameObject.Find("UICamera_DontDestroy/Canvas/UIMessage/TipImage"):GetComponent(typeof(RectTransform))
end

local var_0_2 = 175

function var_0_0.SetUIDText(arg_2_0, arg_2_1, arg_2_2)
	if arg_2_0.UIDText_ then
		arg_2_0.UIDText_.text = arg_2_1
	end

	if arg_2_0.UIDMarkText_ and GameToSDK.clientInfo.env == var_0_1 then
		if arg_2_1 == "" then
			arg_2_0.UIDMarkText_.text = ""
		else
			local var_2_0 = arg_2_1
			local var_2_1 = "                        " .. arg_2_1

			for iter_2_0 = 1, var_0_2 do
				var_2_0 = var_2_0 .. var_2_1
			end

			arg_2_0.UIDMarkText_.text = var_2_0
		end
	end

	if arg_2_0.UIDEncodeText_ and GameToSDK.clientInfo.env == var_0_1 then
		if arg_2_0.encodePosTimer_ then
			arg_2_0.encodePosTimer_:Stop()
		end

		if arg_2_1 == "" then
			arg_2_0.UIDEncodeText_.text = ""
		else
			print("userId", arg_2_2)

			arg_2_0.UIDEncodeText_.text = encodeUID(arg_2_2)
			arg_2_0.encodePosTimer_ = Timer.New(function()
				if arg_2_0.UIDEncodeTrs_ then
					math.randomseed(os.time())

					arg_2_0.UIDEncodeTrs_.anchoredPosition = Vector3(math.random(250, _G.SCREEN_WIDTH - 250), math.random(40, _G.SCREEN_HEIGHT - 40), 0)
				end
			end, 1, -1)

			arg_2_0.encodePosTimer_:Start()
		end
	end

	CustomLog.SetUserID(arg_2_1)
end

function var_0_0.ShowUID(arg_4_0, arg_4_1)
	SetActive(arg_4_0.UIDGo_, arg_4_1)

	if arg_4_1 then
		arg_4_0.tipImageRect_.localPosition = arg_4_0.tipImageRect_.localPosition - Vector3(0, 20, 0)
	else
		arg_4_0.tipImageRect_.localPosition = arg_4_0.tipImageRect_.localPosition + Vector3(0, 20, 0)
	end
end

function var_0_0.SetMainActive(arg_5_0, arg_5_1)
	SetActive(arg_5_0.uiMain, arg_5_1)
end

function var_0_0.SetMainCameraPos(arg_6_0, arg_6_1)
	arg_6_0.mainCamera.transform.localPosition = arg_6_1 or arg_6_0.mainCameraPos_
end

function var_0_0.SetMainCameraRot(arg_7_0, arg_7_1)
	arg_7_0.mainCamera.transform.localEulerAngles = arg_7_1 or arg_7_0.mainCameraRot_
end

function var_0_0.SetMainCameraFieldOfView(arg_8_0, arg_8_1)
	arg_8_0.mainCameraCom_.fieldOfView = arg_8_1
end

function var_0_0.SetMainCamera(arg_9_0, arg_9_1, arg_9_2, arg_9_3)
	local var_9_0 = CameraCfg[arg_9_1]

	if not arg_9_2 and var_9_0 == nil then
		print("没有配置对应的相机位置:", arg_9_1)

		return
	end

	if not arg_9_2 then
		arg_9_0.mainCamera.transform.localPosition = Vector3(var_9_0.position[1], var_9_0.position[2], var_9_0.position[3])
		arg_9_0.mainCamera:GetComponent("Camera").orthographic = false
		arg_9_0.mainCamera.transform.localEulerAngles = Vector3(var_9_0.rotate[1], var_9_0.rotate[2], var_9_0.rotate[3])
		arg_9_0.mainCameraCom_.fieldOfView = var_9_0.fieldOfView
	end

	if arg_9_0.sceneGo_ then
		LuaForUtil.SetSceneSetting(arg_9_0.sceneGo_, false)
		SetActive(arg_9_0.sceneGo_, false)

		arg_9_0.sceneGo_ = nil
	end

	local var_9_1 = arg_9_1

	if not arg_9_2 then
		if var_9_0.multiscene == 1 then
			if var_9_0.type == "home" or var_9_0.type == "chat" or var_9_0.type == "playerInfo" or var_9_0.type == "clubBoss" then
				var_9_1 = manager.loadScene:GetHomeShouldLoadSceneName()
			elseif var_9_0.type == "homePreview" then
				var_9_1 = manager.loadScene:GetPreviewHomeShouldLoadSceneName()
			end
		else
			var_9_1 = var_9_0.sceneName
		end
	end

	if var_9_1 and var_9_1 ~= "" then
		arg_9_0.sceneGo_ = arg_9_0:GetSceneByName(var_9_1)

		if arg_9_0.sceneGo_ then
			LuaForUtil.SetSceneSetting(arg_9_0.sceneGo_, true)
			SetActive(arg_9_0.sceneGo_, not arg_9_3)
		end
	end
end

function var_0_0.GetSceneSetting(arg_10_0)
	local var_10_0 = SceneManager.GetActiveScene()
	local var_10_1 = var_10_0:GetRootGameObjects()
	local var_10_2
	local var_10_3

	if var_10_1 ~= nil then
		for iter_10_0 = 0, var_10_1.Length - 1 do
			if var_10_1[iter_10_0].name == var_10_0.name then
				var_10_2 = var_10_1[iter_10_0]

				break
			end
		end
	end

	if var_10_2 then
		local var_10_4 = var_10_2:GetComponent("SceneSetting")

		if var_10_4.enabled == true then
			return var_10_4
		end
	end
end

function var_0_0.GetSceneSettingBySceneName(arg_11_0, arg_11_1)
	local var_11_0 = SceneManager.GetSceneByName(arg_11_1)
	local var_11_1 = var_11_0:GetRootGameObjects()
	local var_11_2
	local var_11_3

	if var_11_1 ~= nil then
		for iter_11_0 = 0, var_11_1.Length - 1 do
			if var_11_1[iter_11_0].name == var_11_0.name then
				var_11_2 = var_11_1[iter_11_0]

				break
			end
		end
	end

	if var_11_2 then
		return (var_11_2:GetComponent("SceneSetting"))
	end
end

function var_0_0.SetSceneLightEffect(arg_12_0, arg_12_1)
	if isNil(arg_12_0.sceneGo_) then
		return
	end

	if arg_12_0.lastPath_ == arg_12_1 and not isNil(arg_12_0.sceneLightEffectGo_) then
		return
	end

	if not isNil(arg_12_0.sceneLightEffectGo_) then
		Object.Destroy(arg_12_0.sceneLightEffectGo_)
	end

	arg_12_0.lastPath_ = arg_12_1

	local var_12_0 = Asset.Load(arg_12_1)

	arg_12_0.sceneLightEffectGo_ = Object.Instantiate(var_12_0, arg_12_0.sceneGo_.transform)
end

function var_0_0.GetSceneByName(arg_13_0, arg_13_1)
	local var_13_0

	if SceneManager.GetSceneByName(arg_13_1).rootCount > 0 then
		var_13_0 = SceneManager.GetSceneByName(arg_13_1):GetRootGameObjects()
	end

	if var_13_0 ~= nil then
		for iter_13_0 = 0, var_13_0.Length - 1 do
			if var_13_0[iter_13_0].name == arg_13_1 then
				return var_13_0[iter_13_0]
			end
		end
	end

	return nil
end

function var_0_0.ResetMainCamera(arg_14_0)
	arg_14_0:SetMainCamera("null")

	if arg_14_0.sceneGo_ then
		LuaForUtil.SetSceneSetting(arg_14_0.sceneGo_, false)
		SetActive(arg_14_0.sceneGo_, false)

		arg_14_0.sceneGo_ = nil
	end
end

function var_0_0.SetMainCameraCom(arg_15_0, arg_15_1, arg_15_2)
	local var_15_0 = arg_15_0.mainCamera:GetComponent(arg_15_1)

	if var_15_0 then
		var_15_0.enabled = arg_15_2
	end
end

function var_0_0.AddMainCameraCom(arg_16_0, arg_16_1)
	return GameObjectTools.GetOrAddComponent(arg_16_0.mainCamera, arg_16_1)
end

function var_0_0.SetUISeparateRender(arg_17_0, arg_17_1)
	if arg_17_0.cameraExtension then
		arg_17_0.cameraExtension.uiSeparateRender = arg_17_1
	end
end

function var_0_0.GetUISeparateRender(arg_18_0)
	if arg_18_0.cameraExtension then
		return arg_18_0.cameraExtension.uiSeparateRender
	end

	return false
end

function var_0_0.GetCanvasSize(arg_19_0)
	return arg_19_0.canvasSize_
end

function var_0_0.SetSceneObject(arg_20_0, arg_20_1, arg_20_2)
	arg_20_0.sceneObject_[arg_20_1] = arg_20_2
end

function var_0_0.GetSceneObject(arg_21_0, arg_21_1)
	if arg_21_0.sceneObject_[arg_21_1] == nil then
		arg_21_0.sceneObject_[arg_21_1] = GameObject.Find(arg_21_1)
	end

	return arg_21_0.sceneObject_[arg_21_1]
end

function var_0_0.UIEventEnabled(arg_22_0, arg_22_1)
	if arg_22_0.isForce_ then
		return
	end

	arg_22_0:EventEnabled(arg_22_1)
end

function var_0_0.UIEventEnabledByUI(arg_23_0, arg_23_1, arg_23_2)
	arg_23_0.isForce_ = arg_23_2

	arg_23_0:EventEnabled(arg_23_1)
end

function var_0_0.EventEnabled(arg_24_0, arg_24_1)
	if arg_24_0.uiCanvasGroup then
		arg_24_0.uiCanvasGroup.blocksRaycasts = arg_24_1
	end
end

function var_0_0.GetIsUIEventEnabled(arg_25_0)
	if arg_25_0.uiCanvasGroup then
		return arg_25_0.uiCanvasGroup.blocksRaycasts
	end
end

function var_0_0.Dispose(arg_26_0)
	if arg_26_0.guideUI_ then
		Object.Destroy(arg_26_0.guideUI_)

		arg_26_0.guideUI_ = nil
	end

	if arg_26_0.encodePosTimer_ then
		arg_26_0.encodePosTimer_:Stop()
	end

	if arg_26_0.sceneGo_ then
		LuaForUtil.SetSceneSetting(arg_26_0.sceneGo_, false)
		SetActive(arg_26_0.sceneGo_, false)

		arg_26_0.sceneGo_ = nil
	end

	arg_26_0.uiCanvasGroup = nil
	arg_26_0.uiMain = nil
	arg_26_0.uiPop = nil
	arg_26_0.uiMessage = nil
	arg_26_0.uiTips = nil
	arg_26_0.uiLoad = nil
	arg_26_0.uiHPPanel = nil
	arg_26_0.uiCamera = nil
	arg_26_0.sceneObject_ = {}
	arg_26_0.lastPath_ = nil
	arg_26_0.sceneLightEffectGo_ = nil
end

function var_0_0.AdaptUIByFOV(arg_27_0)
	local var_27_0 = 1000000
	local var_27_1 = 2 * var_27_0 * math.tan(math.rad(arg_27_0.mainCameraCom_.fieldOfView * 0.5)) * arg_27_0.mainCameraCom_.aspect
	local var_27_2 = math.deg(2 * math.atan(var_27_1 * 0.5 / var_27_0))

	print("该界面的水平FOV为：", var_27_2)

	if var_27_2 < 46 then
		local var_27_3 = 46
		local var_27_4 = 2 * var_27_0 * math.tan(math.rad(var_27_3 * 0.5)) / arg_27_0.mainCameraCom_.aspect

		arg_27_0.mainCameraCom_.fieldOfView = math.deg(2 * math.atan(var_27_4 * 0.5 / var_27_0))
	end
end

function var_0_0.ScreenToWorldPoint(arg_28_0, arg_28_1, arg_28_2, arg_28_3)
	local var_28_0 = arg_28_0.mainCameraCom_:ScreenToWorldPoint(Vector3(arg_28_1, arg_28_2, arg_28_3))

	return var_28_0.x, var_28_0.z
end

function var_0_0.ShowScreenTap(arg_29_0, arg_29_1)
	if arg_29_0.screenTapCanvas == nil then
		arg_29_0.screenTap = GameObject.Find("UICamera/Canvas/UIScreenTap/ScreenTapUI")

		if arg_29_0.screenTap then
			arg_29_0.screenTapCanvas = arg_29_0.screenTap:GetComponent("CanvasGroup")
		end
	end

	if arg_29_0.screenTapCanvas then
		if arg_29_1 then
			arg_29_0.screenTapCanvas.alpha = 1
		else
			arg_29_0.screenTapCanvas.alpha = 0
		end
	end

	arg_29_0:ShowUID(arg_29_1)
end

return var_0_0
