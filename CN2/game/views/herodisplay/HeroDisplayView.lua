local var_0_0 = class("HeroDisplayView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/System/Hero/HeroDisplayUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:BindCfgUI()
	arg_3_0:AddListeners()

	arg_3_0.weaponController_ = ControllerUtil.GetController(arg_3_0.transformWeapon_, "weaponState")
	arg_3_0.scaleController_ = ControllerUtil.GetController(arg_3_0.buttonScale_.transform, "select")
	arg_3_0.touchView_ = TouchView.New()
	arg_3_0.settingView_ = HeroDisplaySettingView.New(arg_3_0.goSettingPanel_)
	arg_3_0.snapView_ = HeroDisplaySnapView.New(arg_3_0.goSnapPanel_)
	arg_3_0.shareView_ = HeroDisplayShareView.New(arg_3_0.goSharePanel_)
	arg_3_0.expressionView_ = HeroDisplayExpressionView.New(arg_3_0.goHeroExpressionPanel_)
	arg_3_0.heroPoseView_ = HeroDisplayPoseView.New(arg_3_0.goSelectPose_)
	arg_3_0.clickHandler_ = handler(arg_3_0, arg_3_0.ClickTrigger)
	arg_3_0.heroPoseSelectHandler_ = handler(arg_3_0, arg_3_0.HeroPoseSelect)
	arg_3_0.scaleTable_ = GameSetting.model_scale_rate.value
	arg_3_0.camera_ = manager.ui.mainCameraCom_
	arg_3_0.rotateHandler_ = handler(arg_3_0, arg_3_0.RotateModel)
	arg_3_0.upDownHandler_ = handler(arg_3_0, arg_3_0.UpDownModel)
	arg_3_0.scaleHandler_ = handler(arg_3_0, arg_3_0.ScaleModel)
end

function var_0_0.OnEnter(arg_4_0)
	arg_4_0:ScreenAdapt()

	arg_4_0.scaleIndex_ = 0
	arg_4_0.scaleText_.text = GetI18NText(arg_4_0.scaleTable_[arg_4_0.scaleIndex_ + 1][1])

	arg_4_0.scaleController_:SetSelectedState("false")
	manager.ui:SetMainCamera("heroDisplay")
	ScreenRotationAction.RotateToPortrait(function()
		return
	end)

	arg_4_0.isFirstShowTips_ = true
	arg_4_0.heroID_ = arg_4_0.params_.heroID
	arg_4_0.skinID_ = HeroTools.HeroUsingSkinInfo(arg_4_0.heroID_).id

	local var_4_0 = OperationData:IsOperationOpen(OperationConst.SHARE_FLAG)

	SetActive(arg_4_0.buttonSnap_.gameObject, var_4_0)
	SetActive(arg_4_0.buttonSetting_.gameObject, var_4_0)
	arg_4_0:LoadModel()

	arg_4_0.isShowPosePanel_ = false

	SetActive(arg_4_0.goSelectPose_, arg_4_0.isShowPosePanel_)
	SetActive(arg_4_0.goSelect_, arg_4_0.isShowPosePanel_)
	arg_4_0.touchView_:OnEnter()
	arg_4_0.expressionView_:OnEnter(arg_4_0.heroID_)
	arg_4_0.heroPoseView_:OnEnter(arg_4_0.heroID_)
	arg_4_0.shareView_:OnEnter()
	arg_4_0:HeroPoseSelect(1)
	manager.notify:RegistListener(HERO_POSE_SELECT, arg_4_0.heroPoseSelectHandler_)
	manager.notify:RegistListener(CLICK_TRIGGER, arg_4_0.clickHandler_)
	manager.notify:RegistListener(TOUCH_HORIZONTAL, arg_4_0.rotateHandler_)
	manager.notify:RegistListener(TOUCH_VERTICAL, arg_4_0.upDownHandler_)
	manager.notify:RegistListener(MULTI_TOUCH_SCALE, arg_4_0.scaleHandler_)
end

function var_0_0.OnBehind(arg_6_0)
	arg_6_0.expressionView_:OnBehind()
end

function var_0_0.OnTop(arg_7_0)
	arg_7_0.expressionView_:OnTop()
end

function var_0_0.OnExit(arg_8_0)
	manager.notify:RemoveListener(HERO_POSE_SELECT, arg_8_0.heroPoseSelectHandler_)
	manager.notify:RemoveListener(CLICK_TRIGGER, arg_8_0.clickHandler_)
	manager.notify:RemoveListener(TOUCH_HORIZONTAL, arg_8_0.rotateHandler_)
	manager.notify:RemoveListener(TOUCH_VERTICAL, arg_8_0.upDownHandler_)
	manager.notify:RemoveListener(MULTI_TOUCH_SCALE, arg_8_0.scaleHandler_)
	ScreenRotationAction.RotateToLandscape(function()
		manager.notify:Invoke(HERO_DISPLAY_EXIT)
	end)
	arg_8_0:ClickTrigger()
	arg_8_0.touchView_:OnExit()
	arg_8_0.expressionView_:OnExit()
	arg_8_0.heroPoseView_:OnExit()
	arg_8_0.shareView_:OnExit()
	arg_8_0:UnloadModel()

	if arg_8_0.hideTimer_ then
		arg_8_0.hideTimer_:Stop()

		arg_8_0.hideTimer_ = nil
	end
end

function var_0_0.AddListeners(arg_10_0)
	arg_10_0:AddBtnListener(arg_10_0.buttonBack_, nil, function()
		arg_10_0.expressionView_:TryExitSaveData()
	end)
	arg_10_0:AddBtnListener(arg_10_0.buttonHide_, nil, function()
		SetActive(arg_10_0.goUIPanel_, false)
		arg_10_0:HidePosePanel()

		if arg_10_0.isFirstShowTips_ then
			SetActive(arg_10_0.goClickTips_, true)

			arg_10_0.hideTimer_ = Timer.New(function()
				arg_10_0.hideTimer_ = nil

				SetActive(arg_10_0.goClickTips_, false)
			end, 2, 1)

			arg_10_0.hideTimer_:Start()

			arg_10_0.isFirstShowTips_ = false
		end

		arg_10_0.touchView_:HideUI()
	end)
	arg_10_0:AddBtnListener(arg_10_0.buttonWeapon_, nil, function()
		if HeroDisplayData:GetHeroPoseList(arg_10_0.heroID_)[arg_10_0.poseIndex_].weaponState ~= HeroDisplayConst.WEAPON_STATE.CAN_SWITCH_WEAPON then
			ShowTips("CANNOT_SWITCH_WEAPON_STATE")

			return
		end

		arg_10_0.showWeapon_ = not arg_10_0.showWeapon_

		if arg_10_0.showWeapon_ then
			arg_10_0.weaponController_:SetSelectedState("1")
		else
			arg_10_0.weaponController_:SetSelectedState("0")
		end

		HeroTools.SetHeroModelWeaponActivity(arg_10_0.uiTpose_, arg_10_0.showWeapon_)
	end)
	arg_10_0:AddBtnListener(arg_10_0.buttonPose_, nil, function()
		arg_10_0.isShowPosePanel_ = not arg_10_0.isShowPosePanel_

		arg_10_0.heroPoseView_:Show(arg_10_0.isShowPosePanel_)
		SetActive(arg_10_0.goSelect_, arg_10_0.isShowPosePanel_)

		if arg_10_0.isShowPosePanel_ then
			arg_10_0.touchView_:HideUI()
		end

		arg_10_0:HideScalePanel()
	end)
	arg_10_0:AddBtnListener(arg_10_0.buttonSnap_, nil, function()
		if arg_10_0.isShowPosePanel_ then
			arg_10_0:HidePosePanel()
		end

		arg_10_0:HideScalePanel()
		SetActive(arg_10_0.goUIPanel_, false)
		arg_10_0.snapView_:Snap(function()
			SetActive(arg_10_0.goUIPanel_, true)
			arg_10_0.shareView_:SetData(arg_10_0.heroID_, arg_10_0.showWeapon_, arg_10_0.poseIndex_)
			arg_10_0.shareView_:OnSnape()

			local var_17_0 = HeroDisplayData:GetHeroPoseList(arg_10_0.heroID_)[arg_10_0.poseIndex_]
			local var_17_1 = 0

			if arg_10_0.showWeapon_ and var_17_0.weaponState ~= HeroDisplayConst.WEAPON_STATE.HIDE_WEAPON then
				var_17_1 = 1
			end

			SDKTools.SendMessageToSDK("screenshot", {
				screenshot_oper = 1,
				share_channel = 0,
				hero_id = arg_10_0.heroID_,
				weapon_on = var_17_1,
				posture_id = arg_10_0.poseIndex_,
				logo_location = HeroDisplayData.settingProfile_.logoPos == 0 and 2 or HeroDisplayData.settingProfile_.logoPos,
				card_show = HeroDisplayData.settingProfile_.cardShow and 1 or 0,
				card_location = HeroDisplayData.settingProfile_.cardPos == 0 and 1 or HeroDisplayData.settingProfile_.cardPos,
				lv_show = HeroDisplayData.settingProfile_.cardShowLv and 1 or 0,
				uid_show = HeroDisplayData.settingProfile_.cardShowUID and 1 or 0
			})
		end)
	end)
	arg_10_0:AddBtnListener(arg_10_0.buttonExpression_, nil, function()
		arg_10_0.expressionView_:OnShow(arg_10_0.uiTpose_)
	end)
	arg_10_0:AddBtnListener(arg_10_0.buttonSetting_, nil, function()
		SetActive(arg_10_0.goSettingPanel_, true)
		arg_10_0.settingView_:OnEnter()
		arg_10_0:HideScalePanel()
	end)
	arg_10_0:AddBtnListener(arg_10_0.buttonScale_, nil, function()
		arg_10_0.touchView_:HideUI()
		arg_10_0:HidePosePanel()
		arg_10_0.scaleController_:SetSelectedState("true")

		arg_10_0.scaleIndex_ = (arg_10_0.scaleIndex_ + 1) % #arg_10_0.scaleTable_
		arg_10_0.scaleText_.text = GetI18NText(arg_10_0.scaleTable_[arg_10_0.scaleIndex_ + 1][1])

		local var_20_0 = arg_10_0.camera_.fieldOfView
		local var_20_1 = arg_10_0.scaleTable_[arg_10_0.scaleIndex_ + 1][2]
		local var_20_2 = LeanTween.value(var_20_0, var_20_1, 0.35)

		var_20_2:setOnUpdate(LuaHelper.FloatAction(function(arg_21_0)
			arg_10_0.camera_.fieldOfView = arg_21_0
		end))
		var_20_2:setOnComplete(System.Action(function()
			var_20_2:setOnUpdate(nil):setOnComplete(nil)
		end))
	end)
end

function var_0_0.Dispose(arg_23_0)
	var_0_0.super.Dispose(arg_23_0)

	arg_23_0.heroPoseSelectHandler_ = nil
	arg_23_0.clickHandler_ = nil

	arg_23_0.touchView_:Dispose()

	arg_23_0.touchView_ = nil

	arg_23_0.settingView_:Dispose()

	arg_23_0.settingView_ = nil

	arg_23_0.snapView_:Dispose()

	arg_23_0.snapView_ = nil

	arg_23_0.shareView_:Dispose()

	arg_23_0.shareView_ = nil

	arg_23_0.expressionView_:Dispose()

	arg_23_0.expressionView_ = nil

	arg_23_0.heroPoseView_:Dispose()

	arg_23_0.heroPoseView_ = nil
	arg_23_0.rotateHandler_ = nil
	arg_23_0.upDownHandler_ = nil
	arg_23_0.scaleHandler_ = nil
end

function var_0_0.LoadModel(arg_24_0)
	local var_24_0 = HeroTools.HeroUsingSkinInfo(arg_24_0.heroID_)
	local var_24_1 = var_24_0.id

	if arg_24_0.heroModel_ then
		arg_24_0:DestroyCurrentModel()

		arg_24_0.heroModel_ = nil
	end

	arg_24_0.modelPath_ = "Char/" .. var_24_0.display_model_id
	arg_24_0.heroModel_ = Asset.Instantiate(arg_24_0.modelPath_)

	local var_24_2 = HeroDisplayCfg[arg_24_0.skinID_] or HeroDisplayCfg[arg_24_0.heroID_]
	local var_24_3 = var_24_2.position
	local var_24_4 = var_24_2.rotation
	local var_24_5 = var_24_2.scale
	local var_24_6 = arg_24_0.heroModel_.transform

	arg_24_0.heroTransform_ = arg_24_0:FindTrs(string.format("%sui", var_24_1), var_24_6)
	var_24_6.localPosition = Vector3.New(var_24_3[1], var_24_3[2], var_24_3[3])
	var_24_6.localEulerAngles = Vector3.New(var_24_4[1], var_24_4[2], var_24_4[3])
	var_24_6.localScale = Vector3.New(var_24_5[1], var_24_5[2], var_24_5[3])

	local var_24_7 = arg_24_0:FindTrs(var_24_1 .. "ui", var_24_6)

	if var_24_7 then
		var_24_7.localEulerAngles = Vector3.zero
	end

	arg_24_0.uiTpose_ = arg_24_0:FindTrs(string.format("%dui/%dui_tpose", var_24_1, var_24_1), var_24_6)

	if arg_24_0.uiTpose_ then
		arg_24_0.animator_ = arg_24_0:FindCom(typeof(Animator), "", arg_24_0.uiTpose_)
	end

	arg_24_0:InitHeroExpressionParams()
end

function var_0_0.DestroyCurrentModel(arg_25_0)
	if arg_25_0.heroModel_ and arg_25_0.modelPath_ then
		Object.DestroyImmediate(arg_25_0.heroModel_)
		manager.gc:Collect()
		Resources.UnloadUnusedAssets()

		arg_25_0.heroModel_ = nil
		arg_25_0.modelPath_ = nil
	end
end

function var_0_0.UnloadModel(arg_26_0)
	if arg_26_0.heroModel_ then
		arg_26_0:DestroyCurrentModel()

		arg_26_0.posterGirlId_ = nil
		arg_26_0.heroTransform_ = nil
	end
end

function var_0_0.ResetHeroExpressionParams(arg_27_0)
	local var_27_0 = arg_27_0.heroID_
	local var_27_1 = HeroDisplayData:GetHeroExpressionParams(var_27_0)[1]

	for iter_27_0, iter_27_1 in ipairs(var_27_1.values) do
		arg_27_0.skinnedMeshRenderer_:SetBlendShapeWeight(iter_27_0 - 1, iter_27_1 / 100)
	end
end

function var_0_0.InitHeroExpressionParams(arg_28_0)
	local var_28_0 = arg_28_0.heroID_
	local var_28_1

	if arg_28_0:FindTrs("Face", arg_28_0.uiTpose_.transform) then
		var_28_1 = arg_28_0:FindCom(typeof(UnityEngine.SkinnedMeshRenderer), "Face", arg_28_0.uiTpose_.transform)
	else
		var_28_1 = arg_28_0:FindCom(typeof(UnityEngine.SkinnedMeshRenderer), "face", arg_28_0.uiTpose_.transform)
	end

	if HeroDisplayData:GetHeroExpressionParams(var_28_0) == nil then
		local var_28_2 = {}

		for iter_28_0, iter_28_1 in ipairs(HeroDisplayCfg[var_28_0].skinMeshIDList) do
			table.insert(var_28_2, var_28_1:GetBlendShapeWeight(iter_28_0 - 1) * 100)
		end

		HeroDisplayAction.SetDefaultHeroExpression(var_28_0, var_28_2)
	end

	HeroDisplayData:InitCacheExpressionParams(var_28_0)
	HeroDisplayData:InitHeroPose(var_28_0, arg_28_0.skinID_)

	arg_28_0.skinnedMeshRenderer_ = var_28_1
end

function var_0_0.RotateModel(arg_29_0, arg_29_1)
	if arg_29_0.heroTransform_ == nil then
		return
	end

	arg_29_0.heroTransform_:Rotate(0, arg_29_1, 0, Space.World)
end

function var_0_0.UpDownModel(arg_30_0, arg_30_1)
	local var_30_0 = GameSetting.camera_y_range.value[1]
	local var_30_1 = GameSetting.camera_y_range.value[2]
	local var_30_2 = manager.ui.mainCamera.transform
	local var_30_3 = arg_30_1
	local var_30_4 = var_30_2.position.y + var_30_3

	if var_30_4 < var_30_0 then
		var_30_3 = var_30_0 - var_30_2.position.y
	elseif var_30_1 < var_30_4 then
		var_30_3 = var_30_1 - var_30_2.position.y
	end

	var_30_2:Translate(0, var_30_3, 0)
end

function var_0_0.ScaleModel(arg_31_0, arg_31_1)
	local var_31_0 = GameSetting.camera_field_range.value[1]
	local var_31_1 = GameSetting.camera_field_range.value[2]
	local var_31_2 = manager.ui.mainCameraCom_.fieldOfView + arg_31_1

	if var_31_2 < var_31_0 then
		manager.ui.mainCameraCom_.fieldOfView = var_31_0
	elseif var_31_1 < var_31_2 then
		manager.ui.mainCameraCom_.fieldOfView = var_31_1
	else
		manager.ui.mainCameraCom_.fieldOfView = var_31_2
	end
end

function var_0_0.HeroPoseSelect(arg_32_0, arg_32_1)
	if HeroDisplayData:GetHeroPoseList(arg_32_0.heroID_) == nil then
		return
	end

	if arg_32_0.heroModel_ == nil then
		return
	end

	local var_32_0 = HeroDisplayData:GetHeroPoseList(arg_32_0.heroID_)[arg_32_1]

	if arg_32_0.uiTpose_ then
		manager.resourcePool:ResetBlendShapes(arg_32_0.heroModel_)
		arg_32_0.animator_:Play(HeroDisplayPoseCfg[var_32_0.id].poseName)
	end

	arg_32_0.heroPoseView_:SetData(arg_32_1)

	arg_32_0.poseIndex_ = arg_32_1
	arg_32_0.showWeapon_ = var_32_0.weaponState ~= HeroDisplayConst.WEAPON_STATE.HIDE_WEAPON

	HeroTools.SetHeroModelWeaponActivity(arg_32_0.uiTpose_, arg_32_0.showWeapon_)
	arg_32_0:RefreshWeaponBtn()
end

function var_0_0.ClickTrigger(arg_33_0)
	SetActive(arg_33_0.goUIPanel_, true)

	if arg_33_0.hideTimer_ then
		arg_33_0.hideTimer_:Stop()

		arg_33_0.hideTimer_ = nil
	end

	SetActive(arg_33_0.goClickTips_, false)
	arg_33_0:HidePosePanel()
	arg_33_0:HideScalePanel()
end

function var_0_0.HidePosePanel(arg_34_0)
	arg_34_0.isShowPosePanel_ = false

	arg_34_0.heroPoseView_:Show(false)
	SetActive(arg_34_0.goSelect_, false)
end

function var_0_0.HideScalePanel(arg_35_0)
	arg_35_0.scaleController_:SetSelectedState("false")
end

function var_0_0.RefreshWeaponBtn(arg_36_0)
	local var_36_0 = HeroDisplayData:GetHeroPoseList(arg_36_0.heroID_)[arg_36_0.poseIndex_]

	if arg_36_0.showWeapon_ and var_36_0.weaponState == HeroDisplayConst.WEAPON_STATE.CAN_SWITCH_WEAPON then
		arg_36_0.weaponController_:SetSelectedState("1")
	else
		arg_36_0.weaponController_:SetSelectedState("0")
	end
end

function var_0_0.ScreenAdapt(arg_37_0)
	if _G.SCREEN_WIDTH / _G.SCREEN_HEIGHT > arg_37_0.ADAPT_RAITO then
		arg_37_0.goUIPanel_.transform.offsetMax = Vector2(0, -1 * arg_37_0.VIEW_ADAPT_DISTANCE)
	end
end

function var_0_0.OnExitInput(arg_38_0)
	arg_38_0.expressionView_:TryExitSaveData()

	return true
end

return var_0_0
