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

	SetActive(arg_2_0.gameObject_, false)
	arg_2_0:CheckQworldGuide(false)
end

function var_0_0.InitUI(arg_3_0)
	ComponentBinder.GetInstance():BindCfgUI(arg_3_0, arg_3_0.gameObject_)

	arg_3_0.breakGuideTrs_ = arg_3_0.btnBreakGuide_.gameObject:GetComponent(typeof(RectTransform))

	if arg_3_0.btnSkipGo_ then
		SetActive(arg_3_0.btnSkipGo_, false)
	end
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
		manager.guide:OnEventTrigger("pointerClick", arg_8_1)
	end))
	arg_4_0.eventTrigger_:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.PointerUp, LuaHelper.EventTriggerAction1(function(arg_9_0, arg_9_1)
		manager.guide:OnEventTrigger("pointerUp", arg_9_1)
	end))
	arg_4_0.eventTrigger_:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.PointerDown, LuaHelper.EventTriggerAction1(function(arg_10_0, arg_10_1)
		manager.guide:OnEventTrigger("pointerDown", arg_10_1)
	end))
	arg_4_0.eventTrigger_:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.BeginDrag, LuaHelper.EventTriggerAction1(function(arg_11_0, arg_11_1)
		manager.guide:OnEventTrigger("beginDrag", arg_11_1)
	end))
	arg_4_0.eventTrigger_:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.Drag, LuaHelper.EventTriggerAction1(function(arg_12_0, arg_12_1)
		manager.guide:OnEventTrigger("drag", arg_12_1)
	end))
	arg_4_0.eventTrigger_:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.EndDrag, LuaHelper.EventTriggerAction1(function(arg_13_0, arg_13_1)
		manager.guide:OnEventTrigger("endDrag", arg_13_1)
	end))
end

function var_0_0.RemoveUIListener(arg_14_0)
	arg_14_0.btnMaskBtn_.onClick:RemoveAllListeners()
	arg_14_0.eventTrigger_:RemoveAllListeners()
end

function var_0_0.ShowTalk(arg_15_0, arg_15_1, arg_15_2, arg_15_3, arg_15_4, arg_15_5, arg_15_6)
	if not arg_15_1 or arg_15_1 == "" then
		SetActive(arg_15_0.textPanel_, false)

		return
	end

	arg_15_0.scrollrect_.normalizedPosition = Vector2(0, 1)

	SetActive(arg_15_0.textPanel_, true)

	arg_15_0.textCom_.text = arg_15_1
	arg_15_0.dialogNameText_.text = arg_15_4
	arg_15_0.dialogHeadImg_.sprite = getSpriteViaConfig("StoryHeadIcon", string.format("story_%s", arg_15_5))

	if arg_15_2 == 1 then
		arg_15_0.textRect_.anchorMax = Vector2.New(0, 1)
		arg_15_0.textRect_.anchorMin = Vector2.New(0, 1)
	elseif arg_15_2 == 2 then
		arg_15_0.textRect_.anchorMax = Vector2.New(1, 1)
		arg_15_0.textRect_.anchorMin = Vector2.New(1, 1)
	elseif arg_15_2 == 3 then
		arg_15_0.textRect_.anchorMax = Vector2.New(1, 0)
		arg_15_0.textRect_.anchorMin = Vector2.New(1, 0)
	elseif arg_15_2 == 4 then
		arg_15_0.textRect_.anchorMax = Vector2.New(0, 0)
		arg_15_0.textRect_.anchorMin = Vector2.New(0, 0)
	else
		arg_15_0.textRect_.anchorMax = Vector2.New(0.5, 0.5)
		arg_15_0.textRect_.anchorMin = Vector2.New(0.5, 0.5)
	end

	if arg_15_6 == 1 then
		arg_15_0.textRect_.anchoredPosition = Vector2.New((arg_15_3[1] or 0) + ReduxView.VIEW_ADAPT_DISTANCE, arg_15_3[2] or 0)
	elseif arg_15_6 == 2 then
		arg_15_0.textRect_.anchoredPosition = Vector2.New((arg_15_3[1] or 0) - ReduxView.VIEW_ADAPT_DISTANCE, arg_15_3[2] or 0)
	else
		arg_15_0.textRect_.anchoredPosition = Vector2.New(arg_15_3[1] or 0, arg_15_3[2] or 0)
	end
end

function var_0_0.ShowHoldMask(arg_16_0, arg_16_1, arg_16_2, arg_16_3)
	SetActive(arg_16_0.gameObject_, true)
	SetActive(arg_16_0.btnMaskGo_, true)
	arg_16_0:CheckQworldGuide(true)

	local var_16_0 = arg_16_1:GetComponent("RectTransform")

	if var_16_0 ~= nil then
		arg_16_0:ShowUIMask(arg_16_1, var_16_0, arg_16_2)
	else
		local var_16_1 = manager.ui.mainCameraCom_
		local var_16_2 = manager.ui.canvas:GetComponent(typeof(Canvas)).worldCamera

		trace("pos%o", arg_16_1.transform.position)

		if arg_16_0.timer2_ then
			arg_16_0.timer2_:Stop()
		end

		arg_16_0.maskImage1_.sprite = nil
		arg_16_0.maskImage2_.sprite = nil
		arg_16_0.maskImgCom1_.pivot = Vector2(0.5, 0.5)
		arg_16_0.maskImgCom2_.pivot = Vector2(0.5, 0.5)
		arg_16_0.timer2_ = Timer.New(function()
			local var_17_0 = arg_16_1.transform.position
			local var_17_1 = UnityEngine.RectTransformUtility.WorldToScreenPoint(var_16_1, var_17_0)
			local var_17_2, var_17_3 = UnityEngine.RectTransformUtility.ScreenPointToLocalPointInRectangle(arg_16_0.transform_, var_17_1, var_16_2, nil)

			arg_16_0.maskImgCom1_.sizeDelta = Vector2(arg_16_3[1][1], arg_16_3[1][2])
			arg_16_0.maskImgCom2_.sizeDelta = Vector2(arg_16_3[1][1], arg_16_3[1][2])
			arg_16_0.maskImgCom1_.anchoredPosition = var_17_3
			arg_16_0.maskImgCom2_.anchoredPosition = var_17_3
			arg_16_0.btnMaskCom_.sizeDelta = Vector2(arg_16_3[1][1], arg_16_3[1][2]) + var_0_1
			arg_16_0.btnMaskCom_.anchoredPosition = var_17_3
		end, 0.033, -1)

		arg_16_0.timer2_:Start()
	end
end

local function var_0_2(arg_18_0, arg_18_1)
	return Vector3(arg_18_0.lossyScale.x / arg_18_1.lossyScale.x, arg_18_0.lossyScale.y / arg_18_1.lossyScale.y, arg_18_0.lossyScale.z / arg_18_1.lossyScale.z)
end

function var_0_0.UpdateMask(arg_19_0, arg_19_1, arg_19_2, arg_19_3, arg_19_4, arg_19_5)
	arg_19_0.maskImgCom1_.sizeDelta = Vector2(arg_19_1.rect.width, arg_19_1.rect.height) + arg_19_2
	arg_19_0.maskImgCom2_.sizeDelta = Vector2(arg_19_1.rect.width, arg_19_1.rect.height) + arg_19_2
	arg_19_0.maskImgCom1_.position = arg_19_1.position
	arg_19_0.maskImgCom2_.position = arg_19_1.position
	arg_19_0.maskImgCom1_.eulerAngles = arg_19_1.eulerAngles
	arg_19_0.maskImgCom2_.eulerAngles = arg_19_1.eulerAngles
	arg_19_0.maskImgCom1_.localScale = arg_19_5
	arg_19_0.maskImgCom2_.localScale = arg_19_5
	arg_19_0.btnMaskCom_.sizeDelta = Vector2(arg_19_1.rect.width, arg_19_1.rect.height) + var_0_1 + arg_19_4
	arg_19_0.btnMaskCom_.position = arg_19_1.position
	arg_19_0.btnMaskCom_.anchoredPosition = arg_19_0.btnMaskCom_.anchoredPosition + Vector2.Scale(arg_19_5, arg_19_3)
	arg_19_0.btnMaskCom_.eulerAngles = arg_19_1.eulerAngles
	arg_19_0.btnMaskCom_.localScale = arg_19_5
end

function var_0_0.ShowUIMask(arg_20_0, arg_20_1, arg_20_2, arg_20_3)
	local var_20_0 = Vector3(0, 0, 0)
	local var_20_1 = Vector3(0, 0, 0)
	local var_20_2 = Vector2(0, 0)
	local var_20_3 = Vector2(0, 0)

	LayoutRebuilder.ForceRebuildLayoutImmediate(arg_20_2)

	local var_20_4 = Vector3((0.5 - arg_20_2.pivot.x) * arg_20_2.rect.width, (0.5 - arg_20_2.pivot.y) * arg_20_2.rect.height, 0)

	arg_20_0.maskImgCom1_.pivot = arg_20_2.pivot
	arg_20_0.maskImgCom2_.pivot = arg_20_2.pivot

	local var_20_5 = arg_20_1:GetComponent(typeof(Image))

	if var_20_5 and var_20_5.enabled then
		arg_20_0.maskImage1_.sprite = var_20_5.sprite
		arg_20_0.maskImage2_.sprite = var_20_5.sprite
	else
		arg_20_0.maskImage1_.sprite = nil
		arg_20_0.maskImage2_.sprite = nil
	end

	if arg_20_0.timer_ then
		arg_20_0.timer_:Stop()
	end

	arg_20_0.timer_ = Timer.New(function()
		if isNil(arg_20_1) then
			arg_20_0.timer_:Stop()

			arg_20_0.timer_ = nil

			return
		end

		arg_20_0:UpdateMask(arg_20_2, var_20_3, var_20_4, var_20_2, arg_20_3)
	end, 0.033, -1)

	arg_20_0.timer_:Start()
end

function var_0_0.ShowBreakStuck(arg_22_0, arg_22_1, arg_22_2)
	arg_22_0:AdaptBreakGuide()

	arg_22_0.skipGuide_ = arg_22_1

	SetActive(arg_22_0.btnBreakGuide_, arg_22_2)
end

function var_0_0.AdaptBreakGuide(arg_23_0)
	if not isNil(arg_23_0.breakGuideTrs_) then
		arg_23_0.breakGuideTrs_.anchoredPosition = Vector3(-ReduxView.VIEW_ADAPT_DISTANCE, -53.7, 0)
	end
end

function var_0_0.Hide(arg_24_0)
	if arg_24_0.timer_ then
		arg_24_0.timer_:Stop()
	end

	if arg_24_0.timer2_ then
		arg_24_0.timer2_:Stop()
	end

	SetActive(arg_24_0.gameObject_, false)
	arg_24_0:CheckQworldGuide(false)
end

function var_0_0.HideButton(arg_25_0)
	if arg_25_0.timer_ then
		arg_25_0.timer_:Stop()
	end

	if arg_25_0.timer2_ then
		arg_25_0.timer2_:Stop()
	end

	SetActive(arg_25_0.btnMaskGo_, false)
end

function var_0_0.CheckQworldGuide(arg_26_0, arg_26_1)
	if QWorldMgr.isQWorldLoaded_ then
		QWorldLuaBridge.StopControl(arg_26_1)
	end
end

function var_0_0.Dispose(arg_27_0)
	if arg_27_0.timer_ then
		arg_27_0.timer_:Stop()
	end

	arg_27_0.timer_ = nil

	if arg_27_0.timer2_ then
		arg_27_0.timer2_:Stop()
	end

	arg_27_0.timer2_ = nil

	if arg_27_0._isInit then
		arg_27_0:RemoveUIListener()
		Object.Destroy(arg_27_0.gameObject_)
	end

	arg_27_0._isInit = false
end

return var_0_0
