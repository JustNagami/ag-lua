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
	arg_3_0:AddListeners()

	arg_3_0.tempVector2_ = Vector2.New(0, 0, 0)
	arg_3_0.chapterSelectTitleView_ = ChapterSelectTitleView.New(arg_3_0.titleGo_)
	arg_3_0.changeSelectChapterHandler_ = handler(arg_3_0, arg_3_0.ChangeSelectChapterID)
	arg_3_0.lockController_ = arg_3_0.controllerEx_:GetController("lock")
	arg_3_0.chapterToggleItemList_ = {}
	arg_3_0.positionList_ = {}
	arg_3_0.groupDataList_ = ChapterTools.GetChapterGroupList(BattleFieldData:GetCacheChapterClient(BattleConst.TOGGLE.SUB_PLOT))
end

function var_0_0.OnEnter(arg_4_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR,
		INVITE_BAR
	})
	arg_4_0:RefreshViewContent()
	arg_4_0:RefreshData()
	arg_4_0:InitImage()
	arg_4_0:RefreshUI()
	arg_4_0.chapterSelectTitleView_:OnEnter(arg_4_0.selectChapterClientID_)
	manager.notify:RegistListener(CHANGE_PLOT_SELECT_CHAPTER, arg_4_0.changeSelectChapterHandler_)

	for iter_4_0, iter_4_1 in ipairs(arg_4_0.chapterToggleItemList_) do
		iter_4_1:OnEnter()
	end

	arg_4_0:RefreshItemPosition()
end

function var_0_0.OnExit(arg_5_0)
	manager.windowBar:HideBar()
	arg_5_0.chapterSelectTitleView_:OnExit()
	manager.notify:RemoveListener(CHANGE_PLOT_SELECT_CHAPTER, arg_5_0.changeSelectChapterHandler_)
	arg_5_0:StopAllTimer()
	arg_5_0:StopLeanTween()

	for iter_5_0, iter_5_1 in ipairs(arg_5_0.chapterToggleItemList_) do
		iter_5_1:OnExit()
	end
end

function var_0_0.Dispose(arg_6_0)
	arg_6_0.scrollView_.onValueChanged:RemoveAllListeners()

	arg_6_0.changeSelectChapterHandler_ = nil
	arg_6_0.chapterBehindImage_ = nil

	for iter_6_0, iter_6_1 in ipairs(arg_6_0.chapterToggleItemList_) do
		iter_6_1:Dispose()
	end

	arg_6_0.chapterToggleItemList_ = nil

	arg_6_0.chapterSelectTitleView_:Dispose()

	arg_6_0.chapterSelectTitleView_ = nil

	arg_6_0:RemoveListeners()
	var_0_0.super.Dispose(arg_6_0)
end

function var_0_0.AddListeners(arg_7_0)
	arg_7_0.eventTriggerListener_:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.BeginDrag, LuaHelper.EventTriggerAction1(handler(arg_7_0, arg_7_0.BeginDragFun)))
	arg_7_0.eventTriggerListener_:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.Drag, LuaHelper.EventTriggerAction1(handler(arg_7_0, arg_7_0.DragFun)))
	arg_7_0.eventTriggerListener_:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.EndDrag, LuaHelper.EventTriggerAction1(handler(arg_7_0, arg_7_0.EndDragFun)))
	arg_7_0.eventTriggerListener_:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.PointerUp, LuaHelper.EventTriggerAction1(handler(arg_7_0, arg_7_0.PointerUpFun)))
	arg_7_0.toggleEventTriggerListener_:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.BeginDrag, LuaHelper.EventTriggerAction1(handler(arg_7_0, arg_7_0.BeginToggleDragFun)))
	arg_7_0.scrollView_.onValueChanged:AddListener(function()
		arg_7_0:RefreshItemPosition()
	end)
end

function var_0_0.BeginDragFun(arg_9_0, arg_9_1, arg_9_2)
	arg_9_0:StopLeanTween()
end

function var_0_0.DragFun(arg_10_0, arg_10_1, arg_10_2)
	local var_10_0 = arg_10_2.position.x - arg_10_2.pressPosition.x
	local var_10_1 = ChapterTools.GetNeighborClientID(arg_10_0.selectChapterClientID_, var_10_0 < 0)

	if var_10_1 == arg_10_0.selectChapterClientID_ then
		return
	end

	if arg_10_0.nextChapterClientID_ ~= var_10_1 then
		local var_10_2 = ChapterClientCfg[var_10_1]
		local var_10_3 = SpritePathCfg.ChapterPaint.path .. var_10_2.chapter_paint

		getSpriteWithoutAtlasAsync(var_10_3, function(arg_11_0)
			if arg_10_0.chapterBehindImage_ then
				arg_10_0.chapterBehindImage_.sprite = arg_11_0
			end
		end)

		arg_10_0.nextChapterClientID_ = var_10_1
	end

	local var_10_4 = math.min(math.max(0, math.abs(var_10_0)), var_0_0.MAX_DRAG_LENGTH) / var_0_0.MAX_DRAG_LENGTH

	arg_10_0.chapterFrontCanvasGroup_.alpha = 1 - var_10_4
	arg_10_0.chapterBehindCanvasGroup_.alpha = var_10_4
end

function var_0_0.EndDragFun(arg_12_0, arg_12_1, arg_12_2)
	local var_12_0 = arg_12_2.position.x - arg_12_2.pressPosition.x

	if ChapterTools.GetNeighborClientID(arg_12_0.selectChapterClientID_, var_12_0 < 0) == arg_12_0.selectChapterClientID_ then
		return
	end

	if math.abs(var_12_0) > var_0_0.MIN_DRAG_LENGTH then
		if arg_12_0.selectChapterClientID_ == arg_12_0.nextChapterClientID_ then
			return
		end

		arg_12_0.selectChapterClientID_ = arg_12_0.nextChapterClientID_
		arg_12_0.nextChapterClientID_ = nil

		BattleFieldData:SetCacheChapterClient(BattleConst.TOGGLE.SUB_PLOT, arg_12_0.selectChapterClientID_)
		arg_12_0:RefreshData()

		if math.abs(var_12_0) > var_0_0.MAX_DRAG_LENGTH then
			arg_12_0:RefreshChapterUI()
			arg_12_0:SwitchImageOver()
		else
			local var_12_1 = (var_0_0.MAX_DRAG_LENGTH - math.abs(var_12_0)) / var_0_0.MAX_DRAG_LENGTH * var_0_0.SWITCH_STAGE_TIME

			arg_12_0.leanTweenHandler_ = LeanTween.value(arg_12_0.chapterFrontImage_.gameObject, arg_12_0.chapterFrontCanvasGroup_.alpha, 0, var_12_1)

			arg_12_0.leanTweenHandler_:setOnUpdate(LuaHelper.FloatAction(function(arg_13_0)
				arg_12_0.chapterFrontCanvasGroup_.alpha = arg_13_0
				arg_12_0.chapterBehindCanvasGroup_.alpha = 1 - arg_13_0
			end))
			arg_12_0.leanTweenHandler_:setOnComplete(System.Action(function()
				arg_12_0:RefreshChapterUI()
				arg_12_0:SwitchImageOver()
				LeanTween.cancel(arg_12_0.chapterFrontImage_.gameObject)
				arg_12_0.leanTweenHandler_:setOnUpdate(nil):setOnComplete(nil)

				arg_12_0.leanTweenHandler_ = nil
			end))
		end
	else
		local var_12_2 = (1 - (var_0_0.MIN_DRAG_LENGTH - math.abs(var_12_0)) / var_0_0.MIN_DRAG_LENGTH) * 0.8

		arg_12_0.leanTweenHandler_ = LeanTween.value(arg_12_0.chapterFrontImage_.gameObject, arg_12_0.chapterFrontCanvasGroup_.alpha, 1, var_12_2)

		arg_12_0.leanTweenHandler_:setOnUpdate(LuaHelper.FloatAction(function(arg_15_0)
			arg_12_0.chapterFrontCanvasGroup_.alpha = arg_15_0
			arg_12_0.chapterBehindCanvasGroup_.alpha = 1 - arg_15_0
		end))
		arg_12_0.leanTweenHandler_:setOnComplete(System.Action(function()
			LeanTween.cancel(arg_12_0.chapterFrontImage_.gameObject)
			arg_12_0.leanTweenHandler_:setOnUpdate(nil):setOnComplete(nil)

			arg_12_0.leanTweenHandler_ = nil
		end))
	end
end

function var_0_0.PointerUpFun(arg_17_0, arg_17_1, arg_17_2)
	if arg_17_2.dragging then
		return
	end

	if arg_17_0.isLock_ then
		local var_17_0 = arg_17_0:GetActivityID()
		local var_17_1 = ActivityData:GetActivityRefreshTime(var_17_0)

		if var_17_1 > manager.time:GetServerTime() then
			local var_17_2 = GetTips("OPEN_TIME")

			ShowTips(string.format(var_17_2, manager.time:GetLostTimeStr(var_17_1)))

			return
		end
	end

	JumpTools.Jump2SubPlot(arg_17_0.selectChapterClientID_, false, true)
end

function var_0_0.BeginToggleDragFun(arg_18_0, arg_18_1, arg_18_2)
	arg_18_0:StopMoveTimer()
	arg_18_0.scrollView_:OnBeginDrag(arg_18_2)
end

function var_0_0.RemoveListeners(arg_19_0)
	arg_19_0.eventTriggerListener_:RemoveListenerType(UnityEngine.EventSystems.EventTriggerType.BeginDrag)
	arg_19_0.eventTriggerListener_:RemoveListenerType(UnityEngine.EventSystems.EventTriggerType.Drag)
	arg_19_0.eventTriggerListener_:RemoveListenerType(UnityEngine.EventSystems.EventTriggerType.EndDrag)
	arg_19_0.eventTriggerListener_:RemoveListenerType(UnityEngine.EventSystems.EventTriggerType.PointerUp)
	arg_19_0.toggleEventTriggerListener_:RemoveListenerType(UnityEngine.EventSystems.EventTriggerType.BeginDrag)
end

function var_0_0.SwitchImageOver(arg_20_0)
	arg_20_0.chapterBehindImage_, arg_20_0.chapterFrontImage_ = arg_20_0.chapterFrontImage_, arg_20_0.chapterBehindImage_
	arg_20_0.chapterBehindCanvasGroup_, arg_20_0.chapterFrontCanvasGroup_ = arg_20_0.chapterFrontCanvasGroup_, arg_20_0.chapterBehindCanvasGroup_
	arg_20_0.chapterFrontCanvasGroup_.alpha = 1
	arg_20_0.chapterBehindCanvasGroup_.alpha = 0
end

function var_0_0.AutoSwitchImage(arg_21_0)
	local var_21_0 = arg_21_0.selectChapterClientID_
	local var_21_1 = ChapterClientCfg[var_21_0]
	local var_21_2 = SpritePathCfg.ChapterPaint.path .. var_21_1.chapter_paint

	getSpriteWithoutAtlasAsync(var_21_2, function(arg_22_0)
		if arg_21_0.chapterBehindImage_ then
			arg_21_0.chapterBehindImage_.sprite = arg_22_0
		end
	end)

	local var_21_3 = var_0_0.SWITCH_STAGE_TIME

	arg_21_0.leanTweenHandler_ = LeanTween.value(arg_21_0.chapterFrontImage_.gameObject, arg_21_0.chapterFrontCanvasGroup_.alpha, 0, var_21_3)

	arg_21_0.leanTweenHandler_:setOnUpdate(LuaHelper.FloatAction(function(arg_23_0)
		arg_21_0.chapterFrontCanvasGroup_.alpha = arg_23_0
		arg_21_0.chapterBehindCanvasGroup_.alpha = 1 - arg_23_0
	end))
	arg_21_0.leanTweenHandler_:setOnComplete(System.Action(function()
		arg_21_0:SwitchImageOver()
		LeanTween.cancel(arg_21_0.chapterFrontImage_.gameObject)
		arg_21_0.leanTweenHandler_:setOnUpdate(nil):setOnComplete(nil)

		arg_21_0.leanTweenHandler_ = nil
	end))
end

function var_0_0.RefreshData(arg_25_0)
	arg_25_0.selectChapterClientID_ = BattleFieldData:GetCacheChapterClient(BattleConst.TOGGLE.SUB_PLOT)

	local var_25_0 = ChapterClientCfg[arg_25_0.selectChapterClientID_].chapter_list[1]

	arg_25_0.isLock_ = not ChapterTools.IsUnlockSubPlotClient(var_25_0)
end

function var_0_0.InitImage(arg_26_0)
	local var_26_0 = ChapterClientCfg[arg_26_0.selectChapterClientID_]
	local var_26_1 = SpritePathCfg.ChapterPaint.path .. var_26_0.chapter_paint

	getSpriteWithoutAtlasAsync(var_26_1, function(arg_27_0)
		if arg_26_0.chapterBehindImage_ then
			arg_26_0.chapterBehindImage_.sprite = arg_27_0
		end

		if arg_26_0.chapterFrontImage_ then
			arg_26_0.chapterFrontImage_.sprite = arg_27_0
		end
	end)
end

function var_0_0.RefreshUI(arg_28_0)
	arg_28_0:RefreshChapterUI()
	arg_28_0:AutoSwitchImage()
end

function var_0_0.RefreshChapterUI(arg_29_0)
	arg_29_0.chapterSelectTitleView_:OnEnter(arg_29_0.selectChapterClientID_)
	arg_29_0:RefreshGroupToggle()
	arg_29_0:AddActivityTimer()
	arg_29_0:RefreshActivity()
	arg_29_0:RefreshLock()
	arg_29_0:RefreshSelectToggle()
end

function var_0_0.RefreshGroupToggle(arg_30_0)
	arg_30_0:AddMoveTimer(arg_30_0:GetItemPositionX(arg_30_0.selectChapterClientID_))
end

function var_0_0.RefreshActivity(arg_31_0)
	return
end

function var_0_0.RefreshLock(arg_32_0)
	arg_32_0.lockController_:SetSelectedState(tostring(arg_32_0.isLock_))

	for iter_32_0, iter_32_1 in ipairs(arg_32_0.chapterToggleItemList_) do
		iter_32_1:RefreshLock()
	end
end

function var_0_0.ChangeSelectChapterID(arg_33_0)
	arg_33_0:StopLeanTween()
	arg_33_0:RefreshData()
	arg_33_0:RefreshUI()
end

function var_0_0.GetActivityID(arg_34_0)
	local var_34_0 = arg_34_0.selectChapterClientID_
	local var_34_1 = ChapterClientCfg[var_34_0].chapter_list[1]

	return ChapterCfg[var_34_1].activity_id or 0
end

function var_0_0.AddActivityTimer(arg_35_0)
	arg_35_0:RemoveActivityTimer()

	local var_35_0 = arg_35_0.selectChapterClientID_
	local var_35_1 = ChapterClientCfg[var_35_0].chapter_list[1]
	local var_35_2 = arg_35_0:GetActivityID()

	if var_35_2 == 0 then
		return
	end

	local var_35_3 = ActivityData:GetActivityData(var_35_2):IsActivitying()

	arg_35_0.activityTimer_ = Timer.New(function()
		local var_36_0 = ActivityData:GetActivityData(var_35_2):IsActivitying()

		if var_36_0 ~= var_35_3 then
			var_35_3 = var_36_0
			arg_35_0.isLock_ = not ChapterTools.IsUnlockSubPlotClient(var_35_1)

			arg_35_0:RefreshLock()
			arg_35_0:RefreshActivity()
		end
	end, 1, -1)

	arg_35_0.activityTimer_:Start()
end

function var_0_0.RemoveActivityTimer(arg_37_0)
	if arg_37_0.activityTimer_ then
		arg_37_0.activityTimer_:Stop()

		arg_37_0.activityTimer_ = nil
	end
end

function var_0_0.AddMoveTimer(arg_38_0, arg_38_1)
	arg_38_0:StopMoveTimer()

	arg_38_0.moveTimer_ = FrameTimer.New(function()
		local var_39_0 = arg_38_0.chapterParentTf_.rect.width / 2
		local var_39_1 = arg_38_0.scrollTf_.rect.width / 2
		local var_39_2 = arg_38_0.chapterParentTf_.anchoredPosition
		local var_39_3 = arg_38_1 * -1

		if var_39_1 >= var_39_0 + var_39_3 then
			var_39_3 = var_39_1 - var_39_0
		elseif var_39_1 >= var_39_0 - var_39_3 then
			var_39_3 = var_39_0 - var_39_1
		end

		local var_39_4 = 3 * math.pow(arg_38_0.scrollView_.decelerationRate, UnityEngine.Time.unscaledDeltaTime) * UnityEngine.Time.unscaledDeltaTime

		arg_38_0.tempVector2_.x = var_39_3
		arg_38_0.tempVector2_.y = var_39_2.y
		arg_38_0.chapterParentTf_.anchoredPosition = Vector2.Lerp(var_39_2, arg_38_0.tempVector2_, var_39_4)

		if math.abs(var_39_2.x - var_39_3) <= 1 then
			arg_38_0.chapterParentTf_.anchoredPosition = arg_38_0.tempVector2_

			arg_38_0:StopMoveTimer()
		end
	end, 1, -1)

	arg_38_0.moveTimer_:Start()
end

function var_0_0.StopMoveTimer(arg_40_0)
	if arg_40_0.moveTimer_ then
		arg_40_0.moveTimer_:Stop()

		arg_40_0.moveTimer_ = nil
	end
end

function var_0_0.StopLeanTween(arg_41_0)
	if arg_41_0.leanTweenHandler_ then
		LeanTween.cancel(arg_41_0.chapterFrontImage_.gameObject)
		arg_41_0.leanTweenHandler_:callOnCompletes()
	end
end

function var_0_0.StopAllTimer(arg_42_0)
	arg_42_0:StopMoveTimer()
	arg_42_0:RemoveActivityTimer()
end

function var_0_0.RefreshViewContent(arg_43_0)
	local var_43_0 = arg_43_0.chapterItemTf_.rect.width
	local var_43_1 = arg_43_0.layoutGroup_.spacing
	local var_43_2 = arg_43_0.layoutGroup_.padding.left
	local var_43_3 = arg_43_0.layoutGroup_.padding.right
	local var_43_4 = 0

	for iter_43_0, iter_43_1 in ipairs(arg_43_0.groupDataList_) do
		var_43_4 = var_43_4 + 1
	end

	local var_43_5 = var_43_2 + var_43_0 * var_43_4 + var_43_1 * (var_43_4 - 1) + var_43_3

	arg_43_0.chapterParentTf_.sizeDelta = Vector2(var_43_5, arg_43_0.chapterParentTf_.sizeDelta.y)

	for iter_43_2, iter_43_3 in ipairs(arg_43_0.groupDataList_) do
		arg_43_0.positionList_[iter_43_2] = Vector3(var_43_2 + (var_43_0 + var_43_1) * (iter_43_2 - 1) + var_43_0 / 2 - var_43_5 / 2, 0, 0)
	end

	local var_43_6 = arg_43_0.viewportTransform_.rect.width / (var_43_0 + var_43_1) + 2

	for iter_43_4 = 1, var_43_6 do
		if arg_43_0.chapterToggleItemList_[iter_43_4] == nil then
			arg_43_0.chapterToggleItemList_[iter_43_4] = ChapterSelectSubChapterToggleItem.New(arg_43_0.chapterToggleItem_, arg_43_0.chapterParentTf_)
		end
	end
end

function var_0_0.RefreshItemPosition(arg_44_0)
	local var_44_0, var_44_1 = arg_44_0:CalcStartToEndIndex()
	local var_44_2 = {}
	local var_44_3 = {}

	for iter_44_0 = #arg_44_0.chapterToggleItemList_ + 1, var_44_1 - var_44_0 + 1 do
		arg_44_0.chapterToggleItemList_[iter_44_0] = ChapterSelectSubChapterToggleItem.New(arg_44_0.chapterToggleItem_, arg_44_0.chapterParentTf_)
	end

	for iter_44_1 = var_44_0, var_44_1 do
		local var_44_4 = arg_44_0.groupDataList_[iter_44_1][2]
		local var_44_5 = arg_44_0:IsDisplayItem(var_44_4)

		if var_44_5 then
			arg_44_0.chapterToggleItemList_[var_44_5]:SetData(var_44_4)
			arg_44_0.chapterToggleItemList_[var_44_5]:SetLocalPosition(arg_44_0.positionList_[iter_44_1])
			arg_44_0.chapterToggleItemList_[var_44_5]:SetSelect(var_44_4 == arg_44_0.selectChapterClientID_)
			table.insert(var_44_2, var_44_5)
		else
			table.insert(var_44_3, iter_44_1)
		end
	end

	for iter_44_2, iter_44_3 in ipairs(var_44_3) do
		for iter_44_4, iter_44_5 in ipairs(arg_44_0.chapterToggleItemList_) do
			if not table.keyof(var_44_2, iter_44_4) then
				table.insert(var_44_2, iter_44_4)

				local var_44_6 = arg_44_0.groupDataList_[iter_44_3][2]

				iter_44_5:SetData(var_44_6)
				iter_44_5:SetLocalPosition(arg_44_0.positionList_[iter_44_3])
				iter_44_5:SetSelect(var_44_6 == arg_44_0.selectChapterClientID_)

				break
			end
		end
	end

	for iter_44_6 = 1, #arg_44_0.chapterToggleItemList_ do
		if not table.keyof(var_44_2, iter_44_6) then
			arg_44_0.chapterToggleItemList_[iter_44_6]:Show(false)
		end
	end
end

function var_0_0.CalcStartToEndIndex(arg_45_0)
	local var_45_0 = arg_45_0.viewportTransform_.rect.width
	local var_45_1 = arg_45_0.chapterItemTf_.rect.width / 2
	local var_45_2 = 1
	local var_45_3 = 1
	local var_45_4 = arg_45_0.chapterParentTf_.localPosition.x

	for iter_45_0, iter_45_1 in ipairs(arg_45_0.groupDataList_) do
		local var_45_5 = arg_45_0.positionList_[iter_45_0].x + var_45_4

		if var_45_5 - var_45_1 < 0 then
			var_45_2 = iter_45_0
		end

		if var_45_5 + var_45_1 >= 0 and var_45_0 >= var_45_5 - var_45_1 then
			var_45_3 = iter_45_0
		end
	end

	if var_45_3 < var_45_2 then
		var_45_3 = var_45_2
	end

	return var_45_2, var_45_3
end

function var_0_0.IsDisplayItem(arg_46_0, arg_46_1)
	for iter_46_0, iter_46_1 in ipairs(arg_46_0.chapterToggleItemList_) do
		if arg_46_1 == iter_46_1:GetChapterClientID() then
			return iter_46_0
		end
	end
end

function var_0_0.GetItemPositionX(arg_47_0, arg_47_1)
	for iter_47_0, iter_47_1 in ipairs(arg_47_0.groupDataList_) do
		if iter_47_1[2] == arg_47_1 then
			return arg_47_0.positionList_[iter_47_0].x
		end
	end

	return 0
end

function var_0_0.RefreshSelectToggle(arg_48_0)
	for iter_48_0, iter_48_1 in ipairs(arg_48_0.chapterToggleItemList_) do
		local var_48_0 = iter_48_1:GetChapterClientID()

		iter_48_1:SetSelect(var_48_0 == arg_48_0.selectChapterClientID_)
	end
end

return var_0_0
