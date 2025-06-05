local var_0_0 = class("ChapterSelectSubChapterView", ReduxView)

var_0_0.MAX_DRAG_LENGTH = 1500
var_0_0.MIN_DRAG_LENGTH = 200
var_0_0.SWITCH_STAGE_TIME = 0.8

function var_0_0.UIName(arg_1_0)
	return "Widget/System/Operation/OperationSideUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:BindCfgUI()

	arg_3_0.chapterBehindImage_.immediate = true
	arg_3_0.chapterFrontImage_.immediate = true

	arg_3_0:AddListeners()

	arg_3_0.tempVector2_ = Vector2.New(0, 0, 0)
	arg_3_0.chapterSelectTitleView_ = ChapterSelectTitleView.New(arg_3_0.titleGo_)
	arg_3_0.changeSelectChapterHandler_ = handler(arg_3_0, arg_3_0.ChangeSelectChapterID)
	arg_3_0.lockController_ = arg_3_0.controllerEx_:GetController("lock")
	arg_3_0.chapterToggleItemList_ = {}
	arg_3_0.positionList_ = {}
end

function var_0_0.OnTop(arg_4_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR,
		INVITE_BAR
	})
end

function var_0_0.RefeshGroupData(arg_5_0)
	arg_5_0.groupDataList_ = ChapterTools.GetChapterGroupList(BattleFieldData:GetCacheChapterClient(BattleConst.TOGGLE.SUB_PLOT))

	table.sort(arg_5_0.groupDataList_, function(arg_6_0, arg_6_1)
		local var_6_0 = arg_6_0[2]
		local var_6_1 = arg_6_1[2]
		local var_6_2 = ChapterClientCfg[var_6_0]
		local var_6_3 = ChapterClientCfg[var_6_1]

		if var_6_2.sort < var_6_3.sort then
			return true
		else
			return false
		end
	end)
end

function var_0_0.OnEnter(arg_7_0)
	arg_7_0:RefeshGroupData()
	arg_7_0:RefreshViewContent()
	arg_7_0:RefreshData()
	arg_7_0:InitImage()
	arg_7_0:RefreshUI()
	arg_7_0.chapterSelectTitleView_:OnEnter(arg_7_0.selectChapterClientID_)
	manager.notify:RegistListener(CHANGE_PLOT_SELECT_CHAPTER, arg_7_0.changeSelectChapterHandler_)

	for iter_7_0, iter_7_1 in ipairs(arg_7_0.chapterToggleItemList_) do
		iter_7_1:OnEnter()
	end

	arg_7_0:RefreshItemPosition()
end

function var_0_0.OnExit(arg_8_0)
	manager.windowBar:HideBar()
	arg_8_0.chapterSelectTitleView_:OnExit()
	manager.notify:RemoveListener(CHANGE_PLOT_SELECT_CHAPTER, arg_8_0.changeSelectChapterHandler_)
	arg_8_0:StopAllTimer()
	arg_8_0:StopLeanTween()

	for iter_8_0, iter_8_1 in ipairs(arg_8_0.chapterToggleItemList_) do
		iter_8_1:OnExit()
	end
end

function var_0_0.Dispose(arg_9_0)
	arg_9_0.scrollView_.onValueChanged:RemoveAllListeners()

	arg_9_0.changeSelectChapterHandler_ = nil
	arg_9_0.chapterBehindImage_ = nil

	for iter_9_0, iter_9_1 in ipairs(arg_9_0.chapterToggleItemList_) do
		iter_9_1:Dispose()
	end

	arg_9_0.chapterToggleItemList_ = nil

	arg_9_0.chapterSelectTitleView_:Dispose()

	arg_9_0.chapterSelectTitleView_ = nil

	arg_9_0:RemoveListeners()
	var_0_0.super.Dispose(arg_9_0)
end

function var_0_0.AddListeners(arg_10_0)
	arg_10_0.eventTriggerListener_:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.BeginDrag, LuaHelper.EventTriggerAction1(handler(arg_10_0, arg_10_0.BeginDragFun)))
	arg_10_0.eventTriggerListener_:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.Drag, LuaHelper.EventTriggerAction1(handler(arg_10_0, arg_10_0.DragFun)))
	arg_10_0.eventTriggerListener_:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.EndDrag, LuaHelper.EventTriggerAction1(handler(arg_10_0, arg_10_0.EndDragFun)))
	arg_10_0.eventTriggerListener_:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.PointerUp, LuaHelper.EventTriggerAction1(handler(arg_10_0, arg_10_0.PointerUpFun)))
	arg_10_0.toggleEventTriggerListener_:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.BeginDrag, LuaHelper.EventTriggerAction1(handler(arg_10_0, arg_10_0.BeginToggleDragFun)))
	arg_10_0.scrollView_.onValueChanged:AddListener(function()
		arg_10_0:RefreshItemPosition()
	end)
end

function var_0_0.BeginDragFun(arg_12_0, arg_12_1, arg_12_2)
	arg_12_0:StopLeanTween()
end

function var_0_0.GetNeighborClientID(arg_13_0, arg_13_1, arg_13_2)
	local var_13_0 = -1

	for iter_13_0, iter_13_1 in ipairs(arg_13_0.groupDataList_) do
		if iter_13_1[2] == arg_13_1 then
			var_13_0 = iter_13_0

			break
		end
	end

	if arg_13_2 and var_13_0 < #arg_13_0.groupDataList_ then
		var_13_0 = var_13_0 + 1
	elseif not arg_13_2 and var_13_0 > 1 then
		var_13_0 = var_13_0 - 1
	end

	if var_13_0 > 0 then
		return arg_13_0.groupDataList_[var_13_0][2]
	else
		return arg_13_1
	end
end

function var_0_0.DragFun(arg_14_0, arg_14_1, arg_14_2)
	local var_14_0 = arg_14_2.position.x - arg_14_2.pressPosition.x
	local var_14_1 = arg_14_0:GetNeighborClientID(arg_14_0.selectChapterClientID_, var_14_0 < 0)

	if var_14_1 == arg_14_0.selectChapterClientID_ then
		return
	end

	if arg_14_0.nextChapterClientID_ ~= var_14_1 then
		local var_14_2 = ChapterClientCfg[var_14_1]
		local var_14_3 = SpritePathCfg.ChapterPaint.path .. var_14_2.chapter_paint

		arg_14_0.chapterBehindImage_.spriteAsync = var_14_3
		arg_14_0.nextChapterClientID_ = var_14_1
	end

	local var_14_4 = math.min(math.max(0, math.abs(var_14_0)), var_0_0.MAX_DRAG_LENGTH) / var_0_0.MAX_DRAG_LENGTH

	arg_14_0.chapterFrontCanvasGroup_.alpha = 1 - var_14_4
	arg_14_0.chapterBehindCanvasGroup_.alpha = var_14_4
end

function var_0_0.EndDragFun(arg_15_0, arg_15_1, arg_15_2)
	local var_15_0 = arg_15_2.position.x - arg_15_2.pressPosition.x

	if arg_15_0:GetNeighborClientID(arg_15_0.selectChapterClientID_, var_15_0 < 0) == arg_15_0.selectChapterClientID_ then
		return
	end

	if math.abs(var_15_0) > var_0_0.MIN_DRAG_LENGTH then
		if arg_15_0.selectChapterClientID_ == arg_15_0.nextChapterClientID_ then
			return
		end

		arg_15_0.selectChapterClientID_ = arg_15_0.nextChapterClientID_
		arg_15_0.nextChapterClientID_ = nil

		BattleFieldData:SetCacheChapterClient(BattleConst.TOGGLE.SUB_PLOT, arg_15_0.selectChapterClientID_)
		arg_15_0:RefreshData()

		if math.abs(var_15_0) > var_0_0.MAX_DRAG_LENGTH then
			arg_15_0:RefreshChapterUI()
			arg_15_0:SwitchImageOver()
		else
			local var_15_1 = (var_0_0.MAX_DRAG_LENGTH - math.abs(var_15_0)) / var_0_0.MAX_DRAG_LENGTH * var_0_0.SWITCH_STAGE_TIME

			arg_15_0.leanTweenHandler_ = LeanTween.value(arg_15_0.chapterFrontImage_.gameObject, arg_15_0.chapterFrontCanvasGroup_.alpha, 0, var_15_1)

			arg_15_0.leanTweenHandler_:setOnUpdate(LuaHelper.FloatAction(function(arg_16_0)
				arg_15_0.chapterFrontCanvasGroup_.alpha = arg_16_0
				arg_15_0.chapterBehindCanvasGroup_.alpha = 1 - arg_16_0
			end))
			arg_15_0.leanTweenHandler_:setOnComplete(System.Action(function()
				arg_15_0:RefreshChapterUI()
				arg_15_0:SwitchImageOver()
				LeanTween.cancel(arg_15_0.chapterFrontImage_.gameObject)
				arg_15_0.leanTweenHandler_:setOnUpdate(nil):setOnComplete(nil)

				arg_15_0.leanTweenHandler_ = nil
			end))
		end
	else
		local var_15_2 = (1 - (var_0_0.MIN_DRAG_LENGTH - math.abs(var_15_0)) / var_0_0.MIN_DRAG_LENGTH) * 0.8

		arg_15_0.leanTweenHandler_ = LeanTween.value(arg_15_0.chapterFrontImage_.gameObject, arg_15_0.chapterFrontCanvasGroup_.alpha, 1, var_15_2)

		arg_15_0.leanTweenHandler_:setOnUpdate(LuaHelper.FloatAction(function(arg_18_0)
			arg_15_0.chapterFrontCanvasGroup_.alpha = arg_18_0
			arg_15_0.chapterBehindCanvasGroup_.alpha = 1 - arg_18_0
		end))
		arg_15_0.leanTweenHandler_:setOnComplete(System.Action(function()
			LeanTween.cancel(arg_15_0.chapterFrontImage_.gameObject)
			arg_15_0.leanTweenHandler_:setOnUpdate(nil):setOnComplete(nil)

			arg_15_0.leanTweenHandler_ = nil
		end))
	end
end

function var_0_0.PointerUpFun(arg_20_0, arg_20_1, arg_20_2)
	if arg_20_2.dragging then
		return
	end

	JumpTools.Jump2SubPlot(arg_20_0.selectChapterClientID_, false, true)
end

function var_0_0.BeginToggleDragFun(arg_21_0, arg_21_1, arg_21_2)
	arg_21_0:StopMoveTimer()
	arg_21_0.scrollView_:OnBeginDrag(arg_21_2)
end

function var_0_0.RemoveListeners(arg_22_0)
	arg_22_0.eventTriggerListener_:RemoveListenerType(UnityEngine.EventSystems.EventTriggerType.BeginDrag)
	arg_22_0.eventTriggerListener_:RemoveListenerType(UnityEngine.EventSystems.EventTriggerType.Drag)
	arg_22_0.eventTriggerListener_:RemoveListenerType(UnityEngine.EventSystems.EventTriggerType.EndDrag)
	arg_22_0.eventTriggerListener_:RemoveListenerType(UnityEngine.EventSystems.EventTriggerType.PointerUp)
	arg_22_0.toggleEventTriggerListener_:RemoveListenerType(UnityEngine.EventSystems.EventTriggerType.BeginDrag)
end

function var_0_0.SwitchImageOver(arg_23_0)
	arg_23_0.chapterBehindImage_, arg_23_0.chapterFrontImage_ = arg_23_0.chapterFrontImage_, arg_23_0.chapterBehindImage_
	arg_23_0.chapterBehindCanvasGroup_, arg_23_0.chapterFrontCanvasGroup_ = arg_23_0.chapterFrontCanvasGroup_, arg_23_0.chapterBehindCanvasGroup_
	arg_23_0.chapterFrontCanvasGroup_.alpha = 1
	arg_23_0.chapterBehindCanvasGroup_.alpha = 0
end

function var_0_0.AutoSwitchImage(arg_24_0)
	local var_24_0 = arg_24_0.selectChapterClientID_
	local var_24_1 = ChapterClientCfg[var_24_0]
	local var_24_2 = SpritePathCfg.ChapterPaint.path .. var_24_1.chapter_paint

	arg_24_0.chapterBehindImage_.spriteAsync = var_24_2

	local var_24_3 = var_0_0.SWITCH_STAGE_TIME

	arg_24_0.leanTweenHandler_ = LeanTween.value(arg_24_0.chapterFrontImage_.gameObject, arg_24_0.chapterFrontCanvasGroup_.alpha, 0, var_24_3)

	arg_24_0.leanTweenHandler_:setOnUpdate(LuaHelper.FloatAction(function(arg_25_0)
		arg_24_0.chapterFrontCanvasGroup_.alpha = arg_25_0
		arg_24_0.chapterBehindCanvasGroup_.alpha = 1 - arg_25_0
	end))
	arg_24_0.leanTweenHandler_:setOnComplete(System.Action(function()
		arg_24_0:SwitchImageOver()
		LeanTween.cancel(arg_24_0.chapterFrontImage_.gameObject)
		arg_24_0.leanTweenHandler_:setOnUpdate(nil):setOnComplete(nil)

		arg_24_0.leanTweenHandler_ = nil
	end))
end

function var_0_0.RefreshData(arg_27_0)
	arg_27_0.selectChapterClientID_ = BattleFieldData:GetCacheChapterClient(BattleConst.TOGGLE.SUB_PLOT)

	local var_27_0 = ChapterClientCfg[arg_27_0.selectChapterClientID_].chapter_list[1]

	arg_27_0.isLock_ = not ChapterTools.IsUnlockSubPlotClient(var_27_0)
end

function var_0_0.InitImage(arg_28_0)
	local var_28_0 = ChapterClientCfg[arg_28_0.selectChapterClientID_]
	local var_28_1 = SpritePathCfg.ChapterPaint.path .. var_28_0.chapter_paint

	arg_28_0.chapterBehindImage_.spriteAsync = var_28_1
	arg_28_0.chapterFrontImage_.spriteAsync = var_28_1
end

function var_0_0.RefreshUI(arg_29_0)
	arg_29_0:RefreshChapterUI()
	arg_29_0:AutoSwitchImage()
end

function var_0_0.RefreshChapterUI(arg_30_0)
	arg_30_0.chapterSelectTitleView_:OnEnter(arg_30_0.selectChapterClientID_)
	arg_30_0:RefreshGroupToggle()
	arg_30_0:AddActivityTimer()
	arg_30_0:RefreshActivity()
	arg_30_0:RefreshLock()
	arg_30_0:RefreshSelectToggle()
end

function var_0_0.RefreshGroupToggle(arg_31_0)
	arg_31_0:AddMoveTimer(arg_31_0:GetItemPositionX(arg_31_0.selectChapterClientID_))
end

function var_0_0.RefreshActivity(arg_32_0)
	return
end

function var_0_0.RefreshLock(arg_33_0)
	local var_33_0 = ChapterClientCfg[arg_33_0.selectChapterClientID_].asset_pend_key

	if not manager.assetPend:CheckAssetPend(var_33_0) then
		arg_33_0.lockController_:SetSelectedState("assetpend")
	end
end

function var_0_0.ChangeSelectChapterID(arg_34_0)
	arg_34_0:StopLeanTween()
	arg_34_0:RefreshData()
	arg_34_0:RefreshUI()
end

function var_0_0.GetActivityID(arg_35_0)
	local var_35_0 = arg_35_0.selectChapterClientID_
	local var_35_1 = ChapterClientCfg[var_35_0].chapter_list[1]

	return ChapterCfg[var_35_1].activity_id or 0
end

function var_0_0.AddActivityTimer(arg_36_0)
	arg_36_0:RemoveActivityTimer()

	local var_36_0 = arg_36_0.selectChapterClientID_
	local var_36_1 = ChapterClientCfg[var_36_0].chapter_list[1]
	local var_36_2 = arg_36_0:GetActivityID()

	if var_36_2 == 0 then
		return
	end

	local var_36_3 = ActivityData:GetActivityData(var_36_2):IsActivitying()

	arg_36_0.activityTimer_ = Timer.New(function()
		local var_37_0 = ActivityData:GetActivityData(var_36_2):IsActivitying()

		if var_37_0 ~= var_36_3 then
			var_36_3 = var_37_0
			arg_36_0.isLock_ = not ChapterTools.IsUnlockSubPlotClient(var_36_1)

			arg_36_0:RefreshLock()
			arg_36_0:RefreshActivity()
		end
	end, 1, -1)

	arg_36_0.activityTimer_:Start()
end

function var_0_0.RemoveActivityTimer(arg_38_0)
	if arg_38_0.activityTimer_ then
		arg_38_0.activityTimer_:Stop()

		arg_38_0.activityTimer_ = nil
	end
end

function var_0_0.AddMoveTimer(arg_39_0, arg_39_1)
	arg_39_0:StopMoveTimer()

	arg_39_0.moveTimer_ = FrameTimer.New(function()
		local var_40_0 = arg_39_0.chapterParentTf_.rect.width / 2
		local var_40_1 = arg_39_0.scrollTf_.rect.width / 2
		local var_40_2 = arg_39_0.chapterParentTf_.anchoredPosition
		local var_40_3 = arg_39_1 * -1

		if var_40_1 >= var_40_0 + var_40_3 then
			var_40_3 = var_40_1 - var_40_0
		elseif var_40_1 >= var_40_0 - var_40_3 then
			var_40_3 = var_40_0 - var_40_1
		end

		local var_40_4 = 3 * math.pow(arg_39_0.scrollView_.decelerationRate, UnityEngine.Time.unscaledDeltaTime) * UnityEngine.Time.unscaledDeltaTime

		arg_39_0.tempVector2_.x = var_40_3
		arg_39_0.tempVector2_.y = var_40_2.y
		arg_39_0.chapterParentTf_.anchoredPosition = Vector2.Lerp(var_40_2, arg_39_0.tempVector2_, var_40_4)

		if math.abs(var_40_2.x - var_40_3) <= 1 then
			arg_39_0.chapterParentTf_.anchoredPosition = arg_39_0.tempVector2_

			arg_39_0:StopMoveTimer()
		end
	end, 1, -1)

	arg_39_0.moveTimer_:Start()
end

function var_0_0.StopMoveTimer(arg_41_0)
	if arg_41_0.moveTimer_ then
		arg_41_0.moveTimer_:Stop()

		arg_41_0.moveTimer_ = nil
	end
end

function var_0_0.StopLeanTween(arg_42_0)
	if arg_42_0.leanTweenHandler_ then
		LeanTween.cancel(arg_42_0.chapterFrontImage_.gameObject)
		arg_42_0.leanTweenHandler_:callOnCompletes()
	end
end

function var_0_0.StopAllTimer(arg_43_0)
	arg_43_0:StopMoveTimer()
	arg_43_0:RemoveActivityTimer()
end

function var_0_0.RefreshViewContent(arg_44_0)
	local var_44_0 = arg_44_0.chapterItemTf_.rect.width
	local var_44_1 = arg_44_0.layoutGroup_.spacing
	local var_44_2 = arg_44_0.layoutGroup_.padding.left
	local var_44_3 = arg_44_0.layoutGroup_.padding.right
	local var_44_4 = 0

	for iter_44_0, iter_44_1 in ipairs(arg_44_0.groupDataList_) do
		var_44_4 = var_44_4 + 1
	end

	local var_44_5 = var_44_2 + var_44_0 * var_44_4 + var_44_1 * (var_44_4 - 1) + var_44_3

	arg_44_0.chapterParentTf_.sizeDelta = Vector2(var_44_5, arg_44_0.chapterParentTf_.sizeDelta.y)

	for iter_44_2, iter_44_3 in ipairs(arg_44_0.groupDataList_) do
		arg_44_0.positionList_[iter_44_2] = Vector3(var_44_2 + (var_44_0 + var_44_1) * (iter_44_2 - 1) + var_44_0 / 2 - var_44_5 / 2, 0, 0)
	end

	local var_44_6 = arg_44_0.viewportTransform_.rect.width / (var_44_0 + var_44_1) + 2

	for iter_44_4 = 1, var_44_6 do
		if arg_44_0.chapterToggleItemList_[iter_44_4] == nil then
			arg_44_0.chapterToggleItemList_[iter_44_4] = ChapterSelectSubChapterToggleItem.New(arg_44_0.chapterToggleItem_, arg_44_0.chapterParentTf_)
		end
	end
end

function var_0_0.RefreshItemPosition(arg_45_0)
	local var_45_0, var_45_1 = arg_45_0:CalcStartToEndIndex()
	local var_45_2 = {}
	local var_45_3 = {}

	for iter_45_0 = #arg_45_0.chapterToggleItemList_ + 1, var_45_1 - var_45_0 + 1 do
		arg_45_0.chapterToggleItemList_[iter_45_0] = ChapterSelectSubChapterToggleItem.New(arg_45_0.chapterToggleItem_, arg_45_0.chapterParentTf_)
	end

	for iter_45_1 = var_45_0, var_45_1 do
		local var_45_4 = arg_45_0.groupDataList_[iter_45_1][2]
		local var_45_5 = arg_45_0:IsDisplayItem(var_45_4)

		if var_45_5 then
			arg_45_0.chapterToggleItemList_[var_45_5]:SetData(var_45_4)
			arg_45_0.chapterToggleItemList_[var_45_5]:SetLocalPosition(arg_45_0.positionList_[iter_45_1])
			arg_45_0.chapterToggleItemList_[var_45_5]:SetSelect(var_45_4 == arg_45_0.selectChapterClientID_)
			table.insert(var_45_2, var_45_5)
		else
			table.insert(var_45_3, iter_45_1)
		end
	end

	for iter_45_2, iter_45_3 in ipairs(var_45_3) do
		for iter_45_4, iter_45_5 in ipairs(arg_45_0.chapterToggleItemList_) do
			if not table.keyof(var_45_2, iter_45_4) then
				table.insert(var_45_2, iter_45_4)

				local var_45_6 = arg_45_0.groupDataList_[iter_45_3][2]

				iter_45_5:SetData(var_45_6)
				iter_45_5:SetLocalPosition(arg_45_0.positionList_[iter_45_3])
				iter_45_5:SetSelect(var_45_6 == arg_45_0.selectChapterClientID_)

				break
			end
		end
	end

	for iter_45_6 = 1, #arg_45_0.chapterToggleItemList_ do
		if not table.keyof(var_45_2, iter_45_6) then
			arg_45_0.chapterToggleItemList_[iter_45_6]:Show(false)
		end
	end
end

function var_0_0.CalcStartToEndIndex(arg_46_0)
	local var_46_0 = arg_46_0.viewportTransform_.rect.width
	local var_46_1 = arg_46_0.chapterItemTf_.rect.width / 2
	local var_46_2 = 1
	local var_46_3 = 1
	local var_46_4 = arg_46_0.chapterParentTf_.localPosition.x

	for iter_46_0, iter_46_1 in ipairs(arg_46_0.groupDataList_) do
		local var_46_5 = arg_46_0.positionList_[iter_46_0].x + var_46_4

		if var_46_5 - var_46_1 < 0 then
			var_46_2 = iter_46_0
		end

		if var_46_5 + var_46_1 >= 0 and var_46_0 >= var_46_5 - var_46_1 then
			var_46_3 = iter_46_0
		end
	end

	if var_46_3 < var_46_2 then
		var_46_3 = var_46_2
	end

	return var_46_2, var_46_3
end

function var_0_0.IsDisplayItem(arg_47_0, arg_47_1)
	for iter_47_0, iter_47_1 in ipairs(arg_47_0.chapterToggleItemList_) do
		if arg_47_1 == iter_47_1:GetChapterClientID() then
			return iter_47_0
		end
	end
end

function var_0_0.GetItemPositionX(arg_48_0, arg_48_1)
	for iter_48_0, iter_48_1 in ipairs(arg_48_0.groupDataList_) do
		if iter_48_1[2] == arg_48_1 then
			return arg_48_0.positionList_[iter_48_0].x
		end
	end

	return 0
end

function var_0_0.RefreshSelectToggle(arg_49_0)
	for iter_49_0, iter_49_1 in ipairs(arg_49_0.chapterToggleItemList_) do
		local var_49_0 = iter_49_1:GetChapterClientID()

		iter_49_1:SetSelect(var_49_0 == arg_49_0.selectChapterClientID_)
	end
end

return var_0_0
