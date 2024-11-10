local var_0_0 = class("ScrollMoveView", ReduxView)

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	arg_1_0.parentView_ = arg_1_1
	arg_1_0.gameObject_ = arg_1_2
	arg_1_0.transform_ = arg_1_2.transform
	arg_1_0.fixWidth = arg_1_3

	arg_1_0:InitUI()
	arg_1_0:AddListeners()

	arg_1_0.needInitScroll_ = true
end

function var_0_0.OnExit(arg_2_0)
	arg_2_0.scrollView_.enabled = true
	arg_2_0.needInitScroll_ = true
end

function var_0_0.Dispose(arg_3_0)
	arg_3_0:RemoveListeners()

	arg_3_0.gameObject_ = nil
	arg_3_0.transform_ = nil

	var_0_0.super.Dispose(arg_3_0)
end

function var_0_0.InitUI(arg_4_0)
	arg_4_0:BindCfgUI()
end

function var_0_0.AddListeners(arg_5_0)
	arg_5_0.scrollViewEvent_:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.BeginDrag, LuaHelper.EventTriggerAction1(function(arg_6_0, arg_6_1)
		arg_5_0.drag_ = true
	end))
	arg_5_0.scrollViewEvent_:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.EndDrag, LuaHelper.EventTriggerAction1(function(arg_7_0, arg_7_1)
		arg_5_0.drag_ = false
	end))
	arg_5_0.scrollViewEvent_:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.PointerDown, LuaHelper.EventTriggerAction1(function(arg_8_0, arg_8_1)
		arg_5_0.scrollView_.enabled = true
	end))
	arg_5_0.scrollViewEvent_:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.PointerUp, LuaHelper.EventTriggerAction1(function(arg_9_0, arg_9_1)
		if not arg_9_1.dragging and arg_5_0.parentView_:IsOpenSectionInfo() then
			arg_5_0.isOpenInfoView_ = false

			JumpTools.Back()
		end

		arg_5_0.scrollView_.enabled = true
	end))
	arg_5_0.scrollView_.onValueChanged:AddListener(function(arg_10_0)
		if arg_5_0.isOpenInfoView_ and math.abs(arg_5_0.horizontalNormalizedPosition_ - arg_5_0.scrollView_.horizontalNormalizedPosition) >= 0.001 then
			arg_5_0.isOpenInfoView_ = false
			arg_5_0.scrollView_.horizontalNormalizedPosition = arg_5_0.horizontalNormalizedPosition_

			if arg_5_0.parentView_:IsOpenSectionInfo() then
				LeanTween.cancel(arg_5_0.gameObject_)
				JumpTools.Back()
			end
		end
	end)
end

function var_0_0.RemoveListeners(arg_11_0)
	arg_11_0.scrollViewEvent_:RemoveListenerType(UnityEngine.EventSystems.EventTriggerType.BeginDrag)
	arg_11_0.scrollViewEvent_:RemoveListenerType(UnityEngine.EventSystems.EventTriggerType.EndDrag)
	arg_11_0.scrollViewEvent_:RemoveListenerType(UnityEngine.EventSystems.EventTriggerType.PointerDown)
	arg_11_0.scrollViewEvent_:RemoveListenerType(UnityEngine.EventSystems.EventTriggerType.PointerUp)
	arg_11_0.scrollView_.onValueChanged:RemoveAllListeners()
end

function var_0_0.InitScrollPosition(arg_12_0, arg_12_1, arg_12_2)
	local var_12_0 = BattleFieldData:GetStoryBackFlag()

	if arg_12_0.needInitScroll_ and arg_12_0.contentRect_.rect.width < arg_12_0.viewportRect_.rect.width then
		arg_12_0:RemoveTween()

		if var_12_0 == true then
			arg_12_0:StopMove(0)

			return
		end

		if arg_12_2 then
			local var_12_1 = arg_12_0.contentRect_.localPosition

			arg_12_0.contentRect_.localPosition = Vector3(0, var_12_1.y, var_12_1.z)
		else
			arg_12_0.tween_ = LeanTween.value(arg_12_0.gameObject_, arg_12_0.viewportRect_.rect.width, 0, 0.5):setOnUpdate(LuaHelper.FloatAction(function(arg_13_0)
				if arg_12_0.drag_ then
					arg_12_0:RemoveTween()

					return
				end

				local var_13_0 = arg_12_0.contentRect_.localPosition

				arg_12_0.contentRect_.localPosition = Vector3(arg_13_0, var_13_0.y, var_13_0.z)
			end)):setOnComplete(System.Action(function()
				arg_12_0:RemoveTween()
			end)):setEase(LeanTweenType.easeOutSine)
		end

		arg_12_0.needInitScroll_ = false

		return
	end

	if arg_12_0.needInitScroll_ then
		arg_12_0.scrollView_.horizontalNormalizedPosition = 0
	end

	local var_12_2 = (arg_12_1 - arg_12_0.viewportRect_.rect.width / 2 + 200) / (arg_12_0.contentRect_.rect.width - arg_12_0.viewportRect_.rect.width)

	if var_12_2 < 0 then
		var_12_2 = 0

		if arg_12_0.needInitScroll_ then
			arg_12_0.scrollView_.horizontalNormalizedPosition = -1
		end
	elseif var_12_2 > 1 then
		var_12_2 = 1
	end

	arg_12_0:RemoveTween()

	if var_12_0 == true then
		arg_12_0:StopMove(var_12_2)

		return
	end

	if arg_12_2 then
		arg_12_0.horizontalNormalizedPosition_ = var_12_2
		arg_12_0.scrollView_.horizontalNormalizedPosition = var_12_2
	else
		arg_12_0.tween_ = LeanTween.value(arg_12_0.gameObject_, arg_12_0.scrollView_.horizontalNormalizedPosition, var_12_2, 0.5):setOnUpdate(LuaHelper.FloatAction(function(arg_15_0)
			if arg_12_0.drag_ then
				arg_12_0:RemoveTween()

				return
			end

			arg_12_0.horizontalNormalizedPosition_ = arg_15_0
			arg_12_0.scrollView_.horizontalNormalizedPosition = arg_15_0
		end)):setOnComplete(System.Action(function()
			arg_12_0:RemoveTween()
		end)):setEase(LeanTweenType.easeOutSine)
	end

	arg_12_0.needInitScroll_ = false
end

function var_0_0.ScrollPosition(arg_17_0, arg_17_1, arg_17_2)
	if arg_17_0.parentView_:IsOpenSectionInfo() then
		if arg_17_0.contentRect_.rect.width < arg_17_0.viewportRect_.rect.width then
			arg_17_0.contentRect_.sizeDelta = Vector2(arg_17_0.viewportRect_.rect.width, 648)
		end

		local var_17_0 = arg_17_1 - arg_17_0.viewportRect_.rect.width / 2 + 200

		arg_17_0:RemoveTween()

		arg_17_0.scrollView_.enabled = false

		if arg_17_2 then
			local var_17_1 = var_17_0 / (arg_17_0.contentRect_.rect.width - arg_17_0.viewportRect_.rect.width)

			arg_17_0.horizontalNormalizedPosition_ = var_17_1
			arg_17_0.scrollView_.horizontalNormalizedPosition = var_17_1

			if arg_17_0.parentView_:IsOpenSectionInfo() then
				arg_17_0.isOpenInfoView_ = true
			end
		else
			arg_17_0.tween_ = LeanTween.value(arg_17_0.gameObject_, arg_17_0.scrollView_.horizontalNormalizedPosition, var_17_0 / (arg_17_0.contentRect_.rect.width - arg_17_0.viewportRect_.rect.width), 0.5):setOnUpdate(LuaHelper.FloatAction(function(arg_18_0)
				arg_17_0.horizontalNormalizedPosition_ = arg_18_0
				arg_17_0.scrollView_.horizontalNormalizedPosition = arg_18_0
			end)):setOnComplete(System.Action(function()
				if arg_17_0.parentView_:IsOpenSectionInfo() then
					arg_17_0.isOpenInfoView_ = true
				end

				arg_17_0:RemoveTween()
			end)):setEase(LeanTweenType.easeOutSine)
		end
	else
		if not arg_17_0.fixWidth then
			arg_17_0:CalcuteScrollWidth()
		end

		arg_17_0.scrollView_.enabled = true
	end
end

function var_0_0.StopMove(arg_20_0, arg_20_1)
	BattleFieldData:SetStoryBackFlag(false)

	arg_20_0.horizontalNormalizedPosition_ = arg_20_1
	arg_20_0.scrollView_.horizontalNormalizedPosition = arg_20_1
end

function var_0_0.RemoveTween(arg_21_0)
	if arg_21_0.tween_ then
		arg_21_0.tween_:setOnUpdate(nil):setOnComplete(nil):setEase(nil)
		LeanTween.cancel(arg_21_0.tween_.id)

		arg_21_0.tween_ = nil
	end
end

function var_0_0.CalcuteScrollWidth(arg_22_0)
	arg_22_0.contentRect_.sizeDelta = Vector2(arg_22_0.scrollWidth_ - arg_22_0.viewportRect_.rect.width + arg_22_0.viewportRect_.rect.width / 4, 648)
end

function var_0_0.RefreshUI(arg_23_0, arg_23_1, arg_23_2, arg_23_3)
	arg_23_0.scrollWidth_ = arg_23_2

	arg_23_0:CalcuteScrollWidth()
	arg_23_0:InitScrollPosition(arg_23_1, arg_23_3)
	arg_23_0:ScrollPosition(arg_23_1, arg_23_3)
end

function var_0_0.SetHorizontalNormalizedPosition(arg_24_0, arg_24_1, arg_24_2)
	arg_24_0.needInitScroll_ = false
	arg_24_0.scrollWidth_ = arg_24_2

	arg_24_0:CalcuteScrollWidth()

	arg_24_0.scrollView_.horizontalNormalizedPosition = arg_24_1
end

function var_0_0.GetHorizontalNormalizedPosition(arg_25_0)
	return arg_25_0.scrollView_.horizontalNormalizedPosition
end

return var_0_0
