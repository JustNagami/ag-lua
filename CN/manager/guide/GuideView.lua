local var_0_0 = class("GuideView")
local var_0_1 = Vector2(50, 40)

function var_0_0.Ctor(arg_1_0)
	arg_1_0._isInit = false
end

function var_0_0.Init(arg_2_0)
	if arg_2_0._isInit then
		return
	end

	arg_2_0.gameObject_ = GameObject.Instantiate(Asset.Load("Widget/System/GuideNewUI/GuideNewUI"), manager.ui.uiTips.transform)
	arg_2_0.transform_ = arg_2_0.gameObject_.transform

	arg_2_0:InitUI()
	arg_2_0:AddUIListener()

	arg_2_0._isInit = true
	arg_2_0.isInDrag_ = false

	SetActive(arg_2_0.gameObject_, false)
	arg_2_0:CheckQworldGuide(false)
end

function var_0_0.InitUI(arg_3_0)
	ComponentBinder.GetInstance():BindCfgUI(arg_3_0, arg_3_0.gameObject_)

	arg_3_0.breakGuideTrs_ = arg_3_0.btnBreakGuide_.gameObject:GetComponent(typeof(RectTransform))

	if arg_3_0.btnSkipGo_ then
		SetActive(arg_3_0.btnSkipGo_, false)
	end

	arg_3_0.imgRectList_ = {}

	for iter_3_0 = 1, 4 do
		table.insert(arg_3_0.imgRectList_, arg_3_0["maskImage" .. iter_3_0 .. "_"].gameObject:GetComponent(typeof(RectTransform)))
	end

	arg_3_0.dragController_ = arg_3_0.transCon_:GetController("showDrag")
end

function var_0_0.AddUIListener(arg_4_0)
	arg_4_0.btnMaskBtn_.onClick:AddListener(function()
		manager.guide:OnComponentClick()
	end)
	arg_4_0.btnBreakGuide_.onClick:AddListener(function()
		local var_6_0 = {
			content = GetTips("SKIP_GUIDE"),
			OkCallback = function()
				manager.guide:SkipGuide(arg_4_0.skipGuide_)
				manager.guide.view:Hide()
			end
		}

		JumpTools.OpenPageByJump("guideStuckPopView", var_6_0)
	end)
	arg_4_0.eventTrigger_:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.PointerClick, LuaHelper.EventTriggerAction1(function(arg_8_0, arg_8_1)
		if arg_4_0.isInDrag_ then
			return
		end

		manager.guide:OnEventTrigger("pointerClick", arg_8_1)
	end))
	arg_4_0.eventTrigger_:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.PointerUp, LuaHelper.EventTriggerAction1(function(arg_9_0, arg_9_1)
		if arg_4_0.isInDrag_ then
			return
		end

		manager.guide:OnEventTrigger("pointerUp", arg_9_1)
	end))
	arg_4_0.eventTrigger_:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.PointerDown, LuaHelper.EventTriggerAction1(function(arg_10_0, arg_10_1)
		if arg_4_0.isInDrag_ then
			return
		end

		manager.guide:OnEventTrigger("pointerDown", arg_10_1)
	end))
	arg_4_0.eventTrigger_:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.BeginDrag, LuaHelper.EventTriggerAction1(function(arg_11_0, arg_11_1)
		if arg_4_0.isInDrag_ then
			return
		end

		manager.guide:OnEventTrigger("beginDrag", arg_11_1)
	end))
	arg_4_0.eventTrigger_:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.Drag, LuaHelper.EventTriggerAction1(function(arg_12_0, arg_12_1)
		if arg_4_0.isInDrag_ then
			return
		end

		manager.guide:OnEventTrigger("drag", arg_12_1)
	end))
	arg_4_0.eventTrigger_:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.EndDrag, LuaHelper.EventTriggerAction1(function(arg_13_0, arg_13_1)
		if arg_4_0.isInDrag_ then
			return
		end

		manager.guide:OnEventTrigger("endDrag", arg_13_1)
	end))
	arg_4_0.eventTrigger2_:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.BeginDrag, LuaHelper.EventTriggerAction1(function(arg_14_0, arg_14_1)
		manager.guide:OnEventTrigger("beginDrag", arg_14_1)
	end))
	arg_4_0.eventTrigger2_:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.Drag, LuaHelper.EventTriggerAction1(function(arg_15_0, arg_15_1)
		manager.guide:OnEventTrigger("drag", arg_15_1)
	end))
	arg_4_0.eventTrigger2_:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.EndDrag, LuaHelper.EventTriggerAction1(function(arg_16_0, arg_16_1)
		manager.guide:OnEventTrigger("endDrag", arg_16_1)
	end))
end

function var_0_0.RemoveUIListener(arg_17_0)
	arg_17_0.btnMaskBtn_.onClick:RemoveAllListeners()
	arg_17_0.eventTrigger_:RemoveAllListeners()
end

function var_0_0.ShowTalk(arg_18_0, arg_18_1, arg_18_2, arg_18_3, arg_18_4, arg_18_5, arg_18_6)
	if not arg_18_1 or arg_18_1 == "" then
		SetActive(arg_18_0.textPanel_, false)

		return
	end

	arg_18_0.scrollrect_.normalizedPosition = Vector2(0, 1)

	SetActive(arg_18_0.textPanel_, true)

	arg_18_0.textCom_.text = arg_18_1
	arg_18_0.dialogNameText_.text = arg_18_4
	arg_18_0.dialogHeadImg_.sprite = getSpriteViaConfig("StoryHeadIcon", string.format("story_%s", arg_18_5))

	if arg_18_2 == 1 then
		arg_18_0.textRect_.anchorMax = Vector2.New(0, 1)
		arg_18_0.textRect_.anchorMin = Vector2.New(0, 1)
	elseif arg_18_2 == 2 then
		arg_18_0.textRect_.anchorMax = Vector2.New(1, 1)
		arg_18_0.textRect_.anchorMin = Vector2.New(1, 1)
	elseif arg_18_2 == 3 then
		arg_18_0.textRect_.anchorMax = Vector2.New(1, 0)
		arg_18_0.textRect_.anchorMin = Vector2.New(1, 0)
	elseif arg_18_2 == 4 then
		arg_18_0.textRect_.anchorMax = Vector2.New(0, 0)
		arg_18_0.textRect_.anchorMin = Vector2.New(0, 0)
	else
		arg_18_0.textRect_.anchorMax = Vector2.New(0.5, 0.5)
		arg_18_0.textRect_.anchorMin = Vector2.New(0.5, 0.5)
	end

	if arg_18_6 == 1 then
		arg_18_0.textRect_.anchoredPosition = Vector2.New((arg_18_3[1] or 0) + ReduxView.VIEW_ADAPT_DISTANCE, arg_18_3[2] or 0)
	elseif arg_18_6 == 2 then
		arg_18_0.textRect_.anchoredPosition = Vector2.New((arg_18_3[1] or 0) - ReduxView.VIEW_ADAPT_DISTANCE, arg_18_3[2] or 0)
	else
		arg_18_0.textRect_.anchoredPosition = Vector2.New(arg_18_3[1] or 0, arg_18_3[2] or 0)
	end
end

function var_0_0.ShowHoldMask(arg_19_0, arg_19_1, arg_19_2, arg_19_3)
	SetActive(arg_19_0.gameObject_, true)
	SetActive(arg_19_0.btnMaskGo_, true)
	arg_19_0:CheckQworldGuide(true)

	local var_19_0 = arg_19_1:GetComponent("RectTransform")

	if var_19_0 ~= nil then
		arg_19_0:ShowUIMask(arg_19_1, var_19_0, arg_19_2)
	else
		local var_19_1 = manager.ui.mainCameraCom_
		local var_19_2 = manager.ui.canvas:GetComponent(typeof(Canvas)).worldCamera

		if arg_19_0.timer2_ then
			arg_19_0.timer2_:Stop()
		end

		arg_19_0.maskImage1_.sprite = nil
		arg_19_0.maskImage2_.sprite = nil
		arg_19_0.imgRectList_[1].pivot = Vector2(0.5, 0.5)
		arg_19_0.imgRectList_[2].pivot = Vector2(0.5, 0.5)
		arg_19_0.timer2_ = Timer.New(function()
			local var_20_0 = arg_19_1.transform.position
			local var_20_1 = UnityEngine.RectTransformUtility.WorldToScreenPoint(var_19_1, var_20_0)
			local var_20_2, var_20_3 = UnityEngine.RectTransformUtility.ScreenPointToLocalPointInRectangle(arg_19_0.transform_, var_20_1, var_19_2, nil)

			arg_19_0.imgRectList_[1].sizeDelta = Vector2(arg_19_3[1][1], arg_19_3[1][2])
			arg_19_0.imgRectList_[2].sizeDelta = Vector2(arg_19_3[1][1], arg_19_3[1][2])
			arg_19_0.imgRectList_[1].anchoredPosition = var_20_3
			arg_19_0.imgRectList_[2].anchoredPosition = var_20_3
			arg_19_0.btnMaskCom_.sizeDelta = Vector2(arg_19_3[1][1], arg_19_3[1][2]) + var_0_1
			arg_19_0.btnMaskCom_.anchoredPosition = var_20_3
		end, 0.033, -1)

		arg_19_0.timer2_:Start()
	end
end

function var_0_0.ShowHoldMask2(arg_21_0, arg_21_1, arg_21_2, arg_21_3, arg_21_4)
	arg_21_0.isInDrag_ = true

	arg_21_0:CheckQworldGuide(true)

	local var_21_0 = arg_21_1:GetComponent("RectTransform")

	if var_21_0 ~= nil then
		arg_21_0:ShowUIMask2(arg_21_1, var_21_0, arg_21_2)
	else
		local var_21_1 = manager.ui.mainCameraCom_
		local var_21_2 = manager.ui.canvas:GetComponent(typeof(Canvas)).worldCamera

		if arg_21_0.timer3_ then
			arg_21_0.timer3_:Stop()
		end

		arg_21_0.maskImage3_.sprite = nil
		arg_21_0.maskImage4_.sprite = nil
		arg_21_0.imgRectList_[3].pivot = Vector2(0.5, 0.5)
		arg_21_0.imgRectList_[4].pivot = Vector2(0.5, 0.5)
		arg_21_0.timer3_ = Timer.New(function()
			local var_22_0 = arg_21_1.transform.position
			local var_22_1 = UnityEngine.RectTransformUtility.WorldToScreenPoint(var_21_1, var_22_0)
			local var_22_2, var_22_3 = UnityEngine.RectTransformUtility.ScreenPointToLocalPointInRectangle(arg_21_0.transform_, var_22_1, var_21_2, nil)

			arg_21_0.imgRectList_[3].sizeDelta = Vector2(arg_21_3[1][1], arg_21_3[1][2])
			arg_21_0.imgRectList_[4].sizeDelta = Vector2(arg_21_3[1][1], arg_21_3[1][2])
			arg_21_0.imgRectList_[3].anchoredPosition = var_22_3
			arg_21_0.imgRectList_[4].anchoredPosition = var_22_3
		end, 0.033, -1)

		arg_21_0.timer3_:Start()
	end

	arg_21_0.dragController_:SetSelectedState("show")
	SetActive(arg_21_0.btnMaskGo2_, true)
end

local function var_0_2(arg_23_0, arg_23_1)
	return Vector3(arg_23_0.lossyScale.x / arg_23_1.lossyScale.x, arg_23_0.lossyScale.y / arg_23_1.lossyScale.y, arg_23_0.lossyScale.z / arg_23_1.lossyScale.z)
end

function var_0_0.UpdateMask(arg_24_0, arg_24_1, arg_24_2)
	local var_24_0 = arg_24_2.com1
	local var_24_1 = arg_24_2.com2
	local var_24_2 = arg_24_2.maskCom

	var_24_0.pivot = arg_24_1.pivot
	var_24_1.pivot = arg_24_1.pivot
	var_24_0.sizeDelta = Vector2(arg_24_1.rect.width, arg_24_1.rect.height) + arg_24_2.highLightOffSize
	var_24_1.sizeDelta = Vector2(arg_24_1.rect.width, arg_24_1.rect.height) + arg_24_2.highLightOffSize
	var_24_0.position = arg_24_1.position
	var_24_1.position = arg_24_1.position
	var_24_0.eulerAngles = arg_24_1.eulerAngles
	var_24_1.eulerAngles = arg_24_1.eulerAngles
	var_24_0.localScale = arg_24_2.scale
	var_24_1.localScale = arg_24_2.scale
	var_24_2.sizeDelta = Vector2(arg_24_1.rect.width, arg_24_1.rect.height) + var_0_1 + arg_24_2.offSize
	var_24_2.position = arg_24_1.position
	var_24_2.anchoredPosition = var_24_2.anchoredPosition + Vector2.Scale(arg_24_2.scale, arg_24_2.pivotOffset)
	var_24_2.eulerAngles = arg_24_1.eulerAngles
	var_24_2.localScale = arg_24_2.scale
end

function var_0_0.ShowUIMask(arg_25_0, arg_25_1, arg_25_2, arg_25_3)
	local var_25_0 = Vector3(0, 0, 0)
	local var_25_1 = Vector3(0, 0, 0)
	local var_25_2 = Vector2(0, 0)
	local var_25_3 = Vector2(0, 0)

	LayoutRebuilder.ForceRebuildLayoutImmediate(arg_25_2)

	local var_25_4 = Vector3((0.5 - arg_25_2.pivot.x) * arg_25_2.rect.width, (0.5 - arg_25_2.pivot.y) * arg_25_2.rect.height, 0)
	local var_25_5 = arg_25_1:GetComponent(typeof(Image))

	if var_25_5 and var_25_5.enabled then
		arg_25_0.maskImage1_.sprite = var_25_5.sprite
		arg_25_0.maskImage2_.sprite = var_25_5.sprite
	else
		arg_25_0.maskImage1_.sprite = nil
		arg_25_0.maskImage2_.sprite = nil
	end

	if arg_25_0.timer_ then
		arg_25_0.timer_:Stop()
	end

	local var_25_6 = {
		isDrag = true,
		highLightOffSize = var_25_3,
		pivotOffset = var_25_4,
		offSize = var_25_2,
		scale = arg_25_3,
		com1 = arg_25_0.imgRectList_[1],
		com2 = arg_25_0.imgRectList_[2],
		maskCom = arg_25_0.btnMaskCom_
	}

	arg_25_0.timer_ = Timer.New(function()
		if isNil(arg_25_1) then
			arg_25_0.timer_:Stop()

			arg_25_0.timer_ = nil

			return
		end

		arg_25_0:UpdateMask(arg_25_2, var_25_6)
	end, 0.033, -1)

	arg_25_0.timer_:Start()
end

function var_0_0.ShowUIMask2(arg_27_0, arg_27_1, arg_27_2, arg_27_3)
	local var_27_0 = Vector3(0, 0, 0)
	local var_27_1 = Vector3(0, 0, 0)
	local var_27_2 = Vector2(0, 0)
	local var_27_3 = Vector2(0, 0)

	LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_2)

	local var_27_4 = Vector3((0.5 - arg_27_2.pivot.x) * arg_27_2.rect.width, (0.5 - arg_27_2.pivot.y) * arg_27_2.rect.height, 0)
	local var_27_5 = arg_27_1:GetComponent(typeof(Image))

	if var_27_5 and var_27_5.enabled then
		arg_27_0.maskImage3_.sprite = var_27_5.sprite
		arg_27_0.maskImage4_.sprite = var_27_5.sprite
	else
		arg_27_0.maskImage3_.sprite = nil
		arg_27_0.maskImage4_.sprite = nil
	end

	if arg_27_0.timer4_ then
		arg_27_0.timer4_:Stop()
	end

	local var_27_6 = {
		isDrag = true,
		highLightOffSize = var_27_3,
		pivotOffset = var_27_4,
		offSize = var_27_2,
		scale = arg_27_3,
		com1 = arg_27_0.imgRectList_[3],
		com2 = arg_27_0.imgRectList_[4],
		maskCom = arg_27_0.btnMaskCom2_
	}

	arg_27_0.timer4_ = Timer.New(function()
		if isNil(arg_27_1) then
			arg_27_0.timer4_:Stop()

			arg_27_0.timer4_ = nil

			return
		end

		arg_27_0:UpdateMask(arg_27_2, var_27_6)
	end, 0.033, -1)

	arg_27_0.timer4_:Start()
end

function var_0_0.ShowBreakStuck(arg_29_0, arg_29_1, arg_29_2)
	arg_29_0:AdaptBreakGuide()

	arg_29_0.skipGuide_ = arg_29_1

	SetActive(arg_29_0.btnBreakGuide_, arg_29_2)
end

function var_0_0.AdaptBreakGuide(arg_30_0)
	if not isNil(arg_30_0.breakGuideTrs_) then
		arg_30_0.breakGuideTrs_.anchoredPosition = Vector3(-ReduxView.VIEW_ADAPT_DISTANCE, -53.7, 0)
	end
end

function var_0_0.Hide(arg_31_0)
	if arg_31_0.timer_ then
		arg_31_0.timer_:Stop()
	end

	if arg_31_0.timer2_ then
		arg_31_0.timer2_:Stop()
	end

	if arg_31_0.timer3_ then
		arg_31_0.timer3_:Stop()
	end

	if arg_31_0.timer4_ then
		arg_31_0.timer4_:Stop()
	end

	SetActive(arg_31_0.gameObject_, false)
	SetActive(arg_31_0.btnMaskGo_, false)
	SetActive(arg_31_0.btnMaskGo2_, false)

	if arg_31_0.dragController_ then
		arg_31_0.dragController_:SetSelectedState("hide")
	end

	arg_31_0.isInDrag_ = false

	arg_31_0:CheckQworldGuide(false)
end

function var_0_0.HideButton(arg_32_0)
	if arg_32_0.timer_ then
		arg_32_0.timer_:Stop()
	end

	if arg_32_0.timer2_ then
		arg_32_0.timer2_:Stop()
	end

	if arg_32_0.timer3_ then
		arg_32_0.timer3_:Stop()
	end

	if arg_32_0.timer4_ then
		arg_32_0.timer4_:Stop()
	end

	SetActive(arg_32_0.btnMaskGo_, false)
	SetActive(arg_32_0.btnMaskGo2_, false)

	if arg_32_0.dragController_ then
		arg_32_0.dragController_:SetSelectedState("hide")
	end

	arg_32_0.isInDrag_ = false
end

function var_0_0.CheckQworldGuide(arg_33_0, arg_33_1)
	if QWorldMgr.isQWorldLoaded_ then
		QWorldLuaBridge.StopControl(arg_33_1)
	end
end

function var_0_0.Dispose(arg_34_0)
	if arg_34_0.timer_ then
		arg_34_0.timer_:Stop()
	end

	arg_34_0.timer_ = nil

	if arg_34_0.timer2_ then
		arg_34_0.timer2_:Stop()
	end

	arg_34_0.timer2_ = nil

	if arg_34_0.timer3_ then
		arg_34_0.timer3_:Stop()
	end

	arg_34_0.timer3_ = nil

	if arg_34_0.timer4_ then
		arg_34_0.timer4_:Stop()
	end

	arg_34_0.timer4_ = nil

	if arg_34_0._isInit then
		arg_34_0:RemoveUIListener()
		Object.Destroy(arg_34_0.gameObject_)
	end

	arg_34_0._isInit = false
end

return var_0_0
