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
	arg_3_0.groupDataList_ = ChapterTools.GetChapterGroupList(BattleFieldData:GetCacheChapterClient(BattleConst.TOGGLE.SUB_PLOT))
end

function var_0_0.OnTop(arg_4_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR,
		INVITE_BAR
	})
end

function var_0_0.OnEnter(arg_5_0)
	arg_5_0:RefreshViewContent()
	arg_5_0:RefreshData()
	arg_5_0:InitImage()
	arg_5_0:RefreshUI()
	arg_5_0.chapterSelectTitleView_:OnEnter(arg_5_0.selectChapterClientID_)
	manager.notify:RegistListener(CHANGE_PLOT_SELECT_CHAPTER, arg_5_0.changeSelectChapterHandler_)

	for iter_5_0, iter_5_1 in ipairs(arg_5_0.chapterToggleItemList_) do
		iter_5_1:OnEnter()
	end

	arg_5_0:RefreshItemPosition()
end

function var_0_0.OnExit(arg_6_0)
	manager.windowBar:HideBar()
	arg_6_0.chapterSelectTitleView_:OnExit()
	manager.notify:RemoveListener(CHANGE_PLOT_SELECT_CHAPTER, arg_6_0.changeSelectChapterHandler_)
	arg_6_0:StopAllTimer()
	arg_6_0:StopLeanTween()

	for iter_6_0, iter_6_1 in ipairs(arg_6_0.chapterToggleItemList_) do
		iter_6_1:OnExit()
	end
end

function var_0_0.Dispose(arg_7_0)
	arg_7_0.scrollView_.onValueChanged:RemoveAllListeners()

	arg_7_0.changeSelectChapterHandler_ = nil
	arg_7_0.chapterBehindImage_ = nil

	for iter_7_0, iter_7_1 in ipairs(arg_7_0.chapterToggleItemList_) do
		iter_7_1:Dispose()
	end

	arg_7_0.chapterToggleItemList_ = nil

	arg_7_0.chapterSelectTitleView_:Dispose()

	arg_7_0.chapterSelectTitleView_ = nil

	arg_7_0:RemoveListeners()
	var_0_0.super.Dispose(arg_7_0)
end

function var_0_0.AddListeners(arg_8_0)
	arg_8_0.eventTriggerListener_:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.BeginDrag, LuaHelper.EventTriggerAction1(handler(arg_8_0, arg_8_0.BeginDragFun)))
	arg_8_0.eventTriggerListener_:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.Drag, LuaHelper.EventTriggerAction1(handler(arg_8_0, arg_8_0.DragFun)))
	arg_8_0.eventTriggerListener_:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.EndDrag, LuaHelper.EventTriggerAction1(handler(arg_8_0, arg_8_0.EndDragFun)))
	arg_8_0.eventTriggerListener_:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.PointerUp, LuaHelper.EventTriggerAction1(handler(arg_8_0, arg_8_0.PointerUpFun)))
	arg_8_0.toggleEventTriggerListener_:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.BeginDrag, LuaHelper.EventTriggerAction1(handler(arg_8_0, arg_8_0.BeginToggleDragFun)))
	arg_8_0.scrollView_.onValueChanged:AddListener(function()
		arg_8_0:RefreshItemPosition()
	end)
end

function var_0_0.BeginDragFun(arg_10_0, arg_10_1, arg_10_2)
	arg_10_0:StopLeanTween()
end

function var_0_0.DragFun(arg_11_0, arg_11_1, arg_11_2)
	local var_11_0 = arg_11_2.position.x - arg_11_2.pressPosition.x
	local var_11_1 = ChapterTools.GetNeighborClientID(arg_11_0.selectChapterClientID_, var_11_0 < 0)

	if var_11_1 == arg_11_0.selectChapterClientID_ then
		return
	end

	if arg_11_0.nextChapterClientID_ ~= var_11_1 then
		local var_11_2 = ChapterClientCfg[var_11_1]
		local var_11_3 = SpritePathCfg.ChapterPaint.path .. var_11_2.chapter_paint

		arg_11_0.chapterBehindImage_.spriteAsync = var_11_3
		arg_11_0.nextChapterClientID_ = var_11_1
	end

	local var_11_4 = math.min(math.max(0, math.abs(var_11_0)), var_0_0.MAX_DRAG_LENGTH) / var_0_0.MAX_DRAG_LENGTH

	arg_11_0.chapterFrontCanvasGroup_.alpha = 1 - var_11_4
	arg_11_0.chapterBehindCanvasGroup_.alpha = var_11_4
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

	arg_21_0.chapterBehindImage_.spriteAsync = var_21_2

	local var_21_3 = var_0_0.SWITCH_STAGE_TIME

	arg_21_0.leanTweenHandler_ = LeanTween.value(arg_21_0.chapterFrontImage_.gameObject, arg_21_0.chapterFrontCanvasGroup_.alpha, 0, var_21_3)

	arg_21_0.leanTweenHandler_:setOnUpdate(LuaHelper.FloatAction(function(arg_22_0)
		arg_21_0.chapterFrontCanvasGroup_.alpha = arg_22_0
		arg_21_0.chapterBehindCanvasGroup_.alpha = 1 - arg_22_0
	end))
	arg_21_0.leanTweenHandler_:setOnComplete(System.Action(function()
		arg_21_0:SwitchImageOver()
		LeanTween.cancel(arg_21_0.chapterFrontImage_.gameObject)
		arg_21_0.leanTweenHandler_:setOnUpdate(nil):setOnComplete(nil)

		arg_21_0.leanTweenHandler_ = nil
	end))
end

function var_0_0.RefreshData(arg_24_0)
	arg_24_0.selectChapterClientID_ = BattleFieldData:GetCacheChapterClient(BattleConst.TOGGLE.SUB_PLOT)

	local var_24_0 = ChapterClientCfg[arg_24_0.selectChapterClientID_].chapter_list[1]

	arg_24_0.isLock_ = not ChapterTools.IsUnlockSubPlotClient(var_24_0)
end

function var_0_0.InitImage(arg_25_0)
	local var_25_0 = ChapterClientCfg[arg_25_0.selectChapterClientID_]
	local var_25_1 = SpritePathCfg.ChapterPaint.path .. var_25_0.chapter_paint

	arg_25_0.chapterBehindImage_.spriteAsync = var_25_1
	arg_25_0.chapterFrontImage_.spriteAsync = var_25_1
end

function var_0_0.RefreshUI(arg_26_0)
	arg_26_0:RefreshChapterUI()
	arg_26_0:AutoSwitchImage()
end

function var_0_0.RefreshChapterUI(arg_27_0)
	arg_27_0.chapterSelectTitleView_:OnEnter(arg_27_0.selectChapterClientID_)
	arg_27_0:RefreshGroupToggle()
	arg_27_0:AddActivityTimer()
	arg_27_0:RefreshActivity()
	arg_27_0:RefreshLock()
	arg_27_0:RefreshSelectToggle()
end

function var_0_0.RefreshGroupToggle(arg_28_0)
	arg_28_0:AddMoveTimer(arg_28_0:GetItemPositionX(arg_28_0.selectChapterClientID_))
end

function var_0_0.RefreshActivity(arg_29_0)
	return
end

function var_0_0.RefreshLock(arg_30_0)
	local var_30_0 = ChapterClientCfg[arg_30_0.selectChapterClientID_].asset_pend_key

	if arg_30_0.isLock_ then
		arg_30_0.lockController_:SetSelectedState("true")
	elseif not manager.assetPend:CheckAssetPend(var_30_0) then
		arg_30_0.lockController_:SetSelectedState("assetpend")
	else
		arg_30_0.lockController_:SetSelectedState("false")
	end

	for iter_30_0, iter_30_1 in ipairs(arg_30_0.chapterToggleItemList_) do
		iter_30_1:RefreshLock()
	end
end

function var_0_0.ChangeSelectChapterID(arg_31_0)
	arg_31_0:StopLeanTween()
	arg_31_0:RefreshData()
	arg_31_0:RefreshUI()
end

function var_0_0.GetActivityID(arg_32_0)
	local var_32_0 = arg_32_0.selectChapterClientID_
	local var_32_1 = ChapterClientCfg[var_32_0].chapter_list[1]

	return ChapterCfg[var_32_1].activity_id or 0
end

function var_0_0.AddActivityTimer(arg_33_0)
	arg_33_0:RemoveActivityTimer()

	local var_33_0 = arg_33_0.selectChapterClientID_
	local var_33_1 = ChapterClientCfg[var_33_0].chapter_list[1]
	local var_33_2 = arg_33_0:GetActivityID()

	if var_33_2 == 0 then
		return
	end

	local var_33_3 = ActivityData:GetActivityData(var_33_2):IsActivitying()

	arg_33_0.activityTimer_ = Timer.New(function()
		local var_34_0 = ActivityData:GetActivityData(var_33_2):IsActivitying()

		if var_34_0 ~= var_33_3 then
			var_33_3 = var_34_0
			arg_33_0.isLock_ = not ChapterTools.IsUnlockSubPlotClient(var_33_1)

			arg_33_0:RefreshLock()
			arg_33_0:RefreshActivity()
		end
	end, 1, -1)

	arg_33_0.activityTimer_:Start()
end

function var_0_0.RemoveActivityTimer(arg_35_0)
	if arg_35_0.activityTimer_ then
		arg_35_0.activityTimer_:Stop()

		arg_35_0.activityTimer_ = nil
	end
end

function var_0_0.AddMoveTimer(arg_36_0, arg_36_1)
	arg_36_0:StopMoveTimer()

	arg_36_0.moveTimer_ = FrameTimer.New(function()
		local var_37_0 = arg_36_0.chapterParentTf_.rect.width / 2
		local var_37_1 = arg_36_0.scrollTf_.rect.width / 2
		local var_37_2 = arg_36_0.chapterParentTf_.anchoredPosition
		local var_37_3 = arg_36_1 * -1

		if var_37_1 >= var_37_0 + var_37_3 then
			var_37_3 = var_37_1 - var_37_0
		elseif var_37_1 >= var_37_0 - var_37_3 then
			var_37_3 = var_37_0 - var_37_1
		end

		local var_37_4 = 3 * math.pow(arg_36_0.scrollView_.decelerationRate, UnityEngine.Time.unscaledDeltaTime) * UnityEngine.Time.unscaledDeltaTime

		arg_36_0.tempVector2_.x = var_37_3
		arg_36_0.tempVector2_.y = var_37_2.y
		arg_36_0.chapterParentTf_.anchoredPosition = Vector2.Lerp(var_37_2, arg_36_0.tempVector2_, var_37_4)

		if math.abs(var_37_2.x - var_37_3) <= 1 then
			arg_36_0.chapterParentTf_.anchoredPosition = arg_36_0.tempVector2_

			arg_36_0:StopMoveTimer()
		end
	end, 1, -1)

	arg_36_0.moveTimer_:Start()
end

function var_0_0.StopMoveTimer(arg_38_0)
	if arg_38_0.moveTimer_ then
		arg_38_0.moveTimer_:Stop()

		arg_38_0.moveTimer_ = nil
	end
end

function var_0_0.StopLeanTween(arg_39_0)
	if arg_39_0.leanTweenHandler_ then
		LeanTween.cancel(arg_39_0.chapterFrontImage_.gameObject)
		arg_39_0.leanTweenHandler_:callOnCompletes()
	end
end

function var_0_0.StopAllTimer(arg_40_0)
	arg_40_0:StopMoveTimer()
	arg_40_0:RemoveActivityTimer()
end

function var_0_0.RefreshViewContent(arg_41_0)
	local var_41_0 = arg_41_0.chapterItemTf_.rect.width
	local var_41_1 = arg_41_0.layoutGroup_.spacing
	local var_41_2 = arg_41_0.layoutGroup_.padding.left
	local var_41_3 = arg_41_0.layoutGroup_.padding.right
	local var_41_4 = 0

	for iter_41_0, iter_41_1 in ipairs(arg_41_0.groupDataList_) do
		var_41_4 = var_41_4 + 1
	end

	local var_41_5 = var_41_2 + var_41_0 * var_41_4 + var_41_1 * (var_41_4 - 1) + var_41_3

	arg_41_0.chapterParentTf_.sizeDelta = Vector2(var_41_5, arg_41_0.chapterParentTf_.sizeDelta.y)

	for iter_41_2, iter_41_3 in ipairs(arg_41_0.groupDataList_) do
		arg_41_0.positionList_[iter_41_2] = Vector3(var_41_2 + (var_41_0 + var_41_1) * (iter_41_2 - 1) + var_41_0 / 2 - var_41_5 / 2, 0, 0)
	end

	local var_41_6 = arg_41_0.viewportTransform_.rect.width / (var_41_0 + var_41_1) + 2

	for iter_41_4 = 1, var_41_6 do
		if arg_41_0.chapterToggleItemList_[iter_41_4] == nil then
			arg_41_0.chapterToggleItemList_[iter_41_4] = ChapterSelectSubChapterToggleItem.New(arg_41_0.chapterToggleItem_, arg_41_0.chapterParentTf_)
		end
	end
end

function var_0_0.RefreshItemPosition(arg_42_0)
	local var_42_0, var_42_1 = arg_42_0:CalcStartToEndIndex()
	local var_42_2 = {}
	local var_42_3 = {}

	for iter_42_0 = #arg_42_0.chapterToggleItemList_ + 1, var_42_1 - var_42_0 + 1 do
		arg_42_0.chapterToggleItemList_[iter_42_0] = ChapterSelectSubChapterToggleItem.New(arg_42_0.chapterToggleItem_, arg_42_0.chapterParentTf_)
	end

	for iter_42_1 = var_42_0, var_42_1 do
		local var_42_4 = arg_42_0.groupDataList_[iter_42_1][2]
		local var_42_5 = arg_42_0:IsDisplayItem(var_42_4)

		if var_42_5 then
			arg_42_0.chapterToggleItemList_[var_42_5]:SetData(var_42_4)
			arg_42_0.chapterToggleItemList_[var_42_5]:SetLocalPosition(arg_42_0.positionList_[iter_42_1])
			arg_42_0.chapterToggleItemList_[var_42_5]:SetSelect(var_42_4 == arg_42_0.selectChapterClientID_)
			table.insert(var_42_2, var_42_5)
		else
			table.insert(var_42_3, iter_42_1)
		end
	end

	for iter_42_2, iter_42_3 in ipairs(var_42_3) do
		for iter_42_4, iter_42_5 in ipairs(arg_42_0.chapterToggleItemList_) do
			if not table.keyof(var_42_2, iter_42_4) then
				table.insert(var_42_2, iter_42_4)

				local var_42_6 = arg_42_0.groupDataList_[iter_42_3][2]

				iter_42_5:SetData(var_42_6)
				iter_42_5:SetLocalPosition(arg_42_0.positionList_[iter_42_3])
				iter_42_5:SetSelect(var_42_6 == arg_42_0.selectChapterClientID_)

				break
			end
		end
	end

	for iter_42_6 = 1, #arg_42_0.chapterToggleItemList_ do
		if not table.keyof(var_42_2, iter_42_6) then
			arg_42_0.chapterToggleItemList_[iter_42_6]:Show(false)
		end
	end
end

function var_0_0.CalcStartToEndIndex(arg_43_0)
	local var_43_0 = arg_43_0.viewportTransform_.rect.width
	local var_43_1 = arg_43_0.chapterItemTf_.rect.width / 2
	local var_43_2 = 1
	local var_43_3 = 1
	local var_43_4 = arg_43_0.chapterParentTf_.localPosition.x

	for iter_43_0, iter_43_1 in ipairs(arg_43_0.groupDataList_) do
		local var_43_5 = arg_43_0.positionList_[iter_43_0].x + var_43_4

		if var_43_5 - var_43_1 < 0 then
			var_43_2 = iter_43_0
		end

		if var_43_5 + var_43_1 >= 0 and var_43_0 >= var_43_5 - var_43_1 then
			var_43_3 = iter_43_0
		end
	end

	if var_43_3 < var_43_2 then
		var_43_3 = var_43_2
	end

	return var_43_2, var_43_3
end

function var_0_0.IsDisplayItem(arg_44_0, arg_44_1)
	for iter_44_0, iter_44_1 in ipairs(arg_44_0.chapterToggleItemList_) do
		if arg_44_1 == iter_44_1:GetChapterClientID() then
			return iter_44_0
		end
	end
end

function var_0_0.GetItemPositionX(arg_45_0, arg_45_1)
	for iter_45_0, iter_45_1 in ipairs(arg_45_0.groupDataList_) do
		if iter_45_1[2] == arg_45_1 then
			return arg_45_0.positionList_[iter_45_0].x
		end
	end

	return 0
end

function var_0_0.RefreshSelectToggle(arg_46_0)
	for iter_46_0, iter_46_1 in ipairs(arg_46_0.chapterToggleItemList_) do
		local var_46_0 = iter_46_1:GetChapterClientID()

		iter_46_1:SetSelect(var_46_0 == arg_46_0.selectChapterClientID_)
	end
end

return var_0_0
