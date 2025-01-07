local var_0_0 = class("ChapterMapContentView", ReduxView)

var_0_0.SWITCH_STAGE_TIME = 0.8

function var_0_0.UIName(arg_1_0)
	return "Widget/System/Operation/OperationMainUI_new"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0.itemList_ = {}
	arg_3_0.positionList_ = {}
	arg_3_0.mainPlotChapterToggleList_ = {}
	arg_3_0.tempVector3_ = Vector3.New(0, 0, 0)
	arg_3_0.tempVector2_ = Vector2.New(0, 0)

	arg_3_0:InitUI()
	arg_3_0:AddListeners()

	arg_3_0.changeSelectChapterHandler_ = handler(arg_3_0, arg_3_0.ChangeSelectChapterID)
	arg_3_0.changeSelectHardLevelHandler_ = handler(arg_3_0, arg_3_0.ChangeSelectHardLevel)

	for iter_3_0 = 1, 4 do
		arg_3_0.itemList_[iter_3_0] = ChapterMapItemView.New(arg_3_0.mapItem_, arg_3_0.itemParent_)
	end
end

function var_0_0.InitUI(arg_4_0)
	arg_4_0:BindCfgUI()

	arg_4_0.chapterBehindImage_.immediate = true
	arg_4_0.chapterFrontImage_.immediate = true
	arg_4_0.viewportTransform_ = arg_4_0.mapViewPort_.transform
	arg_4_0.hardLevelView_ = HardLevelChapterView.New(arg_4_0.difficultPanel_)
end

function var_0_0.OnTop(arg_5_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR,
		INVITE_BAR
	})
end

function var_0_0.OnEnter(arg_6_0)
	arg_6_0.hardLevelView_:OnEnter()
	arg_6_0:RefreshData()
	arg_6_0:RefreshUI()
	manager.notify:RegistListener(CHANGE_PLOT_SELECT_CHAPTER, arg_6_0.changeSelectChapterHandler_)
	manager.notify:RegistListener(CHANGE_PLOT_HARD_LEVEL, arg_6_0.changeSelectHardLevelHandler_)
end

function var_0_0.OnExit(arg_7_0)
	manager.windowBar:HideBar()
	arg_7_0:StopAllTimer()
	manager.notify:RemoveListener(CHANGE_PLOT_SELECT_CHAPTER, arg_7_0.changeSelectChapterHandler_)
	manager.notify:RemoveListener(CHANGE_PLOT_HARD_LEVEL, arg_7_0.changeSelectHardLevelHandler_)
	arg_7_0.hardLevelView_:OnExit()

	arg_7_0.viewSelectID_ = nil

	for iter_7_0, iter_7_1 in pairs(arg_7_0.mainPlotChapterToggleList_) do
		iter_7_1:OnExit()
	end

	for iter_7_2, iter_7_3 in pairs(arg_7_0.itemList_) do
		iter_7_3:OnExit()
	end

	arg_7_0.isFirstEnter_ = false

	arg_7_0:StopLeanTween()
end

function var_0_0.Dispose(arg_8_0)
	arg_8_0.changeSelectChapterHandler_ = nil
	arg_8_0.changeSelectHardLevelHandler_ = nil

	arg_8_0.scrollRect_.onValueChanged:RemoveAllListeners()
	arg_8_0.hardLevelView_:Dispose()

	arg_8_0.hardLevelView_ = nil

	for iter_8_0, iter_8_1 in pairs(arg_8_0.mainPlotChapterToggleList_) do
		iter_8_1:Dispose()
	end

	arg_8_0.mainPlotChapterToggleList_ = nil

	arg_8_0:RemoveListeners()

	for iter_8_2, iter_8_3 in ipairs(arg_8_0.itemList_) do
		iter_8_3:Dispose()
	end

	arg_8_0.itemList_ = {}

	var_0_0.super.Dispose(arg_8_0)
end

function var_0_0.AddListeners(arg_9_0)
	arg_9_0.eventTriggerListeners_:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.BeginDrag, LuaHelper.EventTriggerAction1(handler(arg_9_0, arg_9_0.BeginDragFun)))
	arg_9_0.eventTriggerListeners_:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.Drag, LuaHelper.EventTriggerAction1(handler(arg_9_0, arg_9_0.DragFun)))
	arg_9_0.eventTriggerListeners_:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.EndDrag, LuaHelper.EventTriggerAction1(handler(arg_9_0, arg_9_0.EndDragFun)))
	arg_9_0.eventTriggerListeners_:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.Scroll, LuaHelper.EventTriggerAction1(handler(arg_9_0, arg_9_0.ScrollFunc)))
	arg_9_0.scrollRect_.onValueChanged:AddListener(function()
		arg_9_0:RefreshItemPosition()
	end)
end

function var_0_0.BeginDragFun(arg_11_0, arg_11_1, arg_11_2)
	arg_11_0:StopMoveTimer()
	arg_11_0:StopSnapTimer()
	arg_11_0:AddToggleTimer()
end

function var_0_0.DragFun(arg_12_0, arg_12_1, arg_12_2)
	if math.abs(arg_12_2.position.x - arg_12_2.pressPosition.x) > GameSetting.chapter_scroll_length_threshold.value[1] then
		arg_12_0:RefreshSelectChapter(0)
	end
end

function var_0_0.EndDragFun(arg_13_0, arg_13_1, arg_13_2)
	manager.audio:PlayUIAudioByVoice("stage_slide")
	arg_13_0:AddSnapTimer()
end

function var_0_0.ScrollFunc(arg_14_0, arg_14_1, arg_14_2)
	arg_14_0:StopMoveTimer()

	local var_14_0 = arg_14_0:SearchNearClientID()

	arg_14_0.selectChapterClientID_ = var_14_0

	arg_14_0:ChangeSelectID(var_14_0)
	arg_14_0:RefreshSelectChapter(0)
	arg_14_0:AddSnapTimer()
end

function var_0_0.StopMoveAction(arg_15_0)
	arg_15_0:RefreshSelectChapter(arg_15_0.selectChapterClientID_)
	arg_15_0:AutoSwitchImage()
end

function var_0_0.InitImage(arg_16_0)
	local var_16_0 = ChapterClientCfg[arg_16_0.selectChapterClientID_]
	local var_16_1 = SpritePathCfg.ChapterPaint.path .. var_16_0.chapter_paint

	arg_16_0.chapterBehindImage_.spriteAsync = var_16_1
	arg_16_0.chapterFrontImage_.spriteAsync = var_16_1
end

function var_0_0.AutoSwitchImage(arg_17_0)
	local var_17_0 = arg_17_0.selectChapterClientID_
	local var_17_1 = ChapterClientCfg[var_17_0]
	local var_17_2 = SpritePathCfg.ChapterPaint.path .. var_17_1.chapter_paint

	arg_17_0.chapterBehindImage_.spriteAsync = var_17_2

	local var_17_3 = var_0_0.SWITCH_STAGE_TIME

	arg_17_0:StopLeanTween()

	arg_17_0.leanTweenHandler_ = LeanTween.value(arg_17_0.chapterFrontImage_.gameObject, arg_17_0.chapterFrontCanvasGroup_.alpha, 0, var_17_3)

	arg_17_0.leanTweenHandler_:setOnUpdate(LuaHelper.FloatAction(function(arg_18_0)
		arg_17_0.chapterFrontCanvasGroup_.alpha = arg_18_0
		arg_17_0.chapterBehindCanvasGroup_.alpha = 1 - arg_18_0
	end))
	arg_17_0.leanTweenHandler_:setOnComplete(System.Action(function()
		arg_17_0:SwitchImageOver()
		arg_17_0:StopLeanTween()
	end))
end

function var_0_0.StopLeanTween(arg_20_0)
	if arg_20_0.leanTweenHandler_ then
		LeanTween.cancel(arg_20_0.chapterFrontImage_.gameObject)
		arg_20_0.leanTweenHandler_:setOnUpdate(nil):setOnComplete(nil)

		arg_20_0.leanTweenHandler_ = nil
	end
end

function var_0_0.SwitchImageOver(arg_21_0)
	arg_21_0.chapterBehindImage_, arg_21_0.chapterFrontImage_ = arg_21_0.chapterFrontImage_, arg_21_0.chapterBehindImage_
	arg_21_0.chapterBehindCanvasGroup_, arg_21_0.chapterFrontCanvasGroup_ = arg_21_0.chapterFrontCanvasGroup_, arg_21_0.chapterBehindCanvasGroup_
end

function var_0_0.RemoveListeners(arg_22_0)
	arg_22_0.eventTriggerListeners_:RemoveListenerType(UnityEngine.EventSystems.EventTriggerType.BeginDrag)
	arg_22_0.eventTriggerListeners_:RemoveListenerType(UnityEngine.EventSystems.EventTriggerType.Drag)
	arg_22_0.eventTriggerListeners_:RemoveListenerType(UnityEngine.EventSystems.EventTriggerType.EndDrag)
	arg_22_0.eventTriggerListeners_:RemoveListenerType(UnityEngine.EventSystems.EventTriggerType.Scroll)
end

function var_0_0.RefreshData(arg_23_0)
	arg_23_0.selectChapterClientID_ = BattleFieldData:GetCacheChapterClient(BattleConst.TOGGLE.PLOT)
	arg_23_0.hardLevel_ = ChapterClientCfg[arg_23_0.selectChapterClientID_].difficulty
	arg_23_0.chapterList_ = {}

	local var_23_0 = getChapterClientList()[arg_23_0.hardLevel_]

	for iter_23_0, iter_23_1 in ipairs(var_23_0) do
		if ChapterTools.HasChapterStage(iter_23_1) then
			table.insert(arg_23_0.chapterList_, iter_23_1)
		end
	end

	arg_23_0.maxChapterLevel_ = #arg_23_0.chapterList_
end

function var_0_0.RefreshUI(arg_24_0)
	arg_24_0:InitImage()
	arg_24_0:RefreshViewContent()
	arg_24_0:ChangeSelectChapterID()
	arg_24_0:RefreshSelectDifficult()
	arg_24_0:RefreshSelectChapter(arg_24_0.selectChapterClientID_)
	arg_24_0:RefreshToggle()
end

function var_0_0.ChangeSelectHardLevel(arg_25_0)
	arg_25_0:RefreshData()
	arg_25_0:RefreshSelectChapter(0)
	arg_25_0:RefreshViewContent()
	arg_25_0:RefreshItemPosition()
	arg_25_0:RefreshSelectDifficult()
	arg_25_0:RefreshToggle()

	arg_25_0.changeLevel_ = true
end

function var_0_0.RefreshToggle(arg_26_0)
	local var_26_0 = ChapterMainPlotToggleCfg.get_id_list_by_difficulty[arg_26_0.hardLevel_]

	for iter_26_0, iter_26_1 in ipairs(var_26_0) do
		local var_26_1 = arg_26_0.mainPlotChapterToggleList_[iter_26_0] or ChapterMapToggleView.New(arg_26_0.chapterItem_, arg_26_0.chapterParentGo_)

		arg_26_0.mainPlotChapterToggleList_[iter_26_0] = var_26_1

		var_26_1:SetData(iter_26_1)
	end

	for iter_26_2 = #var_26_0 + 1, #arg_26_0.mainPlotChapterToggleList_ do
		arg_26_0.mainPlotChapterToggleList_[iter_26_2]:Show(false)
	end

	arg_26_0:RefreshSelectChapterToggle()
end

function var_0_0.RefreshSelectChapter(arg_27_0, arg_27_1)
	if arg_27_0.viewSelectID_ == arg_27_1 then
		return
	end

	arg_27_0.viewSelectID_ = arg_27_1

	for iter_27_0, iter_27_1 in ipairs(arg_27_0.itemList_) do
		iter_27_1:SetSelectID(arg_27_1)
	end
end

function var_0_0.RefreshSelectChapterToggle(arg_28_0)
	arg_28_0.scrollTimer_ = FrameTimer.New(function()
		local var_29_0, var_29_1 = arg_28_0:GetToggleIndex()

		if arg_28_0.lastToggleIndx_ == var_29_0 then
			return
		end

		arg_28_0.lastToggleIndx_ = var_29_0
		arg_28_0.tempVector3_.x = 0
		arg_28_0.tempVector3_.y = 0
		arg_28_0.tempVector3_.z = 0

		local var_29_2 = arg_28_0.viewTf_:InverseTransformPoint(arg_28_0.mainPlotChapterToggleList_[var_29_0]:GetTransform():TransformPoint(arg_28_0.tempVector3_))

		if var_29_2.x <= 0 or var_29_2.x >= arg_28_0.viewTf_.rect.width then
			local var_29_3 = (var_29_0 - 1) / ((arg_28_0.contentTf_.rect.width - arg_28_0.viewTf_.rect.width) / (arg_28_0.itemTf_.rect.width + arg_28_0.contentLayout_.spacing))

			if var_29_3 > 1 then
				var_29_3 = 1
			elseif var_29_3 < 0 then
				var_29_3 = 0
			end

			arg_28_0.scrollView_.horizontalNormalizedPosition = var_29_3
		end

		for iter_29_0, iter_29_1 in pairs(arg_28_0.mainPlotChapterToggleList_) do
			iter_29_1:SetSelectID(arg_28_0.selectChapterClientID_)
		end
	end, 1, 1)

	arg_28_0.scrollTimer_:Start()
end

function var_0_0.GetToggleIndex(arg_30_0)
	local var_30_0 = ChapterMainPlotToggleCfg.get_id_list_by_difficulty[arg_30_0.hardLevel_]

	for iter_30_0, iter_30_1 in ipairs(var_30_0) do
		if table.keyof(ChapterMainPlotToggleCfg[iter_30_1].chapter_client_list, arg_30_0.selectChapterClientID_) then
			return iter_30_0, #var_30_0
		end
	end

	return #var_30_0, #var_30_0
end

function var_0_0.RefreshViewContent(arg_31_0)
	local var_31_0 = arg_31_0.mapItemTf_.rect.width
	local var_31_1 = arg_31_0.layoutGroup_.spacing
	local var_31_2 = arg_31_0.layoutGroup_.padding.left
	local var_31_3 = arg_31_0.layoutGroup_.padding.right
	local var_31_4 = 0

	for iter_31_0, iter_31_1 in ipairs(arg_31_0.chapterList_) do
		var_31_4 = var_31_4 + 1

		if arg_31_0.positionList_[iter_31_0] == nil then
			arg_31_0.positionList_[iter_31_0] = Vector3.New(var_31_2 + (var_31_0 + var_31_1) * (iter_31_0 - 1) + var_31_0 / 2, 0, 0)
		end
	end

	local var_31_5 = var_31_2 + var_31_0 * var_31_4 + var_31_1 * (var_31_4 - 1) + var_31_3 - arg_31_0.viewportTransform_.rect.width

	arg_31_0.tempVector2_.x = var_31_5
	arg_31_0.tempVector2_.y = arg_31_0.mapItemParentTf_.sizeDelta.y
	arg_31_0.mapItemParentTf_.sizeDelta = arg_31_0.tempVector2_
end

function var_0_0.IsDisplayItem(arg_32_0, arg_32_1)
	for iter_32_0, iter_32_1 in ipairs(arg_32_0.itemList_) do
		if arg_32_1 == iter_32_1:GetChapterClientID() then
			return iter_32_0
		end
	end
end

function var_0_0.RefreshItemPosition(arg_33_0)
	local var_33_0, var_33_1 = arg_33_0:CalcStartToEndIndex()
	local var_33_2 = {}
	local var_33_3 = {}

	for iter_33_0 = var_33_0, var_33_1 do
		local var_33_4 = arg_33_0.chapterList_[iter_33_0]
		local var_33_5 = arg_33_0:IsDisplayItem(var_33_4)

		if var_33_5 then
			arg_33_0.itemList_[var_33_5]:SetChapterClientID(arg_33_0.chapterList_[iter_33_0])
			arg_33_0.itemList_[var_33_5]:SetLocalPosition(arg_33_0.positionList_[iter_33_0])
			table.insert(var_33_2, var_33_5)
		else
			table.insert(var_33_3, iter_33_0)
		end
	end

	for iter_33_1, iter_33_2 in ipairs(var_33_3) do
		for iter_33_3, iter_33_4 in ipairs(arg_33_0.itemList_) do
			if not table.keyof(var_33_2, iter_33_3) then
				table.insert(var_33_2, iter_33_3)
				iter_33_4:SetChapterClientID(arg_33_0.chapterList_[iter_33_2])
				iter_33_4:SetLocalPosition(arg_33_0.positionList_[iter_33_2])

				break
			end
		end
	end

	for iter_33_5 = 1, #arg_33_0.itemList_ do
		if not table.keyof(var_33_2, iter_33_5) then
			arg_33_0.itemList_[iter_33_5]:Show(false)
		end
	end
end

function var_0_0.CalcStartToEndIndex(arg_34_0)
	local var_34_0 = arg_34_0.viewportTransform_.rect.width
	local var_34_1 = arg_34_0.mapItemTf_.rect.width / 2
	local var_34_2 = 1
	local var_34_3 = 1
	local var_34_4 = arg_34_0.mapItemParentTf_.localPosition.x

	for iter_34_0, iter_34_1 in ipairs(arg_34_0.chapterList_) do
		local var_34_5 = arg_34_0.positionList_[iter_34_0].x + var_34_4

		if var_34_5 + var_34_1 < 0 then
			var_34_2 = iter_34_0
		end

		if var_34_5 + var_34_1 >= 0 and var_34_0 >= var_34_5 - var_34_1 then
			var_34_3 = iter_34_0
		end
	end

	if var_34_3 < var_34_2 then
		var_34_3 = var_34_2
	end

	return var_34_2, var_34_3
end

function var_0_0.RefreshSelectDifficult(arg_35_0)
	arg_35_0.hardLevelView_:SetData(arg_35_0.hardLevel_, 0)
end

function var_0_0.ChangeSelectChapterID(arg_36_0)
	arg_36_0:RefreshData()
	arg_36_0:StopAllTimer()
	arg_36_0.scrollRect_:StopMovement()

	local var_36_0 = arg_36_0:GetItemPositionX(arg_36_0.selectChapterClientID_)

	if arg_36_0.changeLevel_ or not arg_36_0.isFirstEnter_ then
		local var_36_1 = arg_36_0.mapItemParentTf_.localPosition

		arg_36_0.tempVector3_.x = var_36_0
		arg_36_0.tempVector3_.y = var_36_1.y
		arg_36_0.tempVector3_.z = var_36_1.z
		arg_36_0.mapItemParentTf_.localPosition = arg_36_0.tempVector3_

		arg_36_0:RefreshItemPosition()
		arg_36_0:StopMoveAction()
	else
		arg_36_0:AddMoveTimer(var_36_0)
	end

	arg_36_0:RefreshSelectChapterToggle()

	if arg_36_0.changeLevel_ or not arg_36_0.isFirstEnter_ then
		arg_36_0.changeLevel_ = false
		arg_36_0.isFirstEnter_ = true
	else
		arg_36_0:RefreshSelectChapter(0)
	end
end

function var_0_0.ChangeSelectID(arg_37_0, arg_37_1)
	if not arg_37_1 then
		return
	end

	if arg_37_1 == BattleFieldData:GetCacheChapterClient(BattleConst.TOGGLE.PLOT) then
		return
	end

	BattleFieldData:SetCacheChapterClient(BattleConst.TOGGLE.PLOT, arg_37_1)
	arg_37_0:RefreshSelectChapterToggle()
end

function var_0_0.SearchNearClientID(arg_38_0)
	local var_38_0
	local var_38_1 = 200000
	local var_38_2 = arg_38_0.viewportTransform_.localPosition.x + arg_38_0.viewportTransform_.rect.width / 2

	for iter_38_0, iter_38_1 in ipairs(arg_38_0.chapterList_) do
		local var_38_3 = arg_38_0.positionList_[iter_38_0]
		local var_38_4 = math.abs(var_38_3.x + arg_38_0.mapItemParentTf_.localPosition.x - arg_38_0.viewportTransform_.rect.width / 2)

		if var_38_4 <= var_38_1 then
			var_38_1 = var_38_4
			var_38_0 = iter_38_1
		end
	end

	return var_38_0
end

function var_0_0.GetItemPositionX(arg_39_0, arg_39_1)
	local var_39_0 = table.keyof(arg_39_0.chapterList_, arg_39_1)
	local var_39_1 = arg_39_0.mapItemParentTf_.localPosition

	return -arg_39_0.positionList_[var_39_0].x + arg_39_0.viewportTransform_.rect.width / 2
end

function var_0_0.AddSnapTimer(arg_40_0)
	arg_40_0:StopSnapTimer()

	arg_40_0.snapTimer_ = FrameTimer.New(function()
		if arg_40_0.scrollRect_.velocity.x > -200 and arg_40_0.scrollRect_.velocity.x < 200 then
			arg_40_0.scrollRect_:StopMovement()

			local var_41_0 = arg_40_0:SearchNearClientID()

			arg_40_0.selectChapterClientID_ = var_41_0

			arg_40_0:ChangeSelectID(var_41_0)

			local var_41_1 = arg_40_0:GetItemPositionX(var_41_0)

			arg_40_0:AddMoveTimer(var_41_1)
			arg_40_0:StopSnapTimer()
		end
	end, 1, -1)

	arg_40_0.snapTimer_:Start()
end

function var_0_0.StopSnapTimer(arg_42_0)
	if arg_42_0.snapTimer_ then
		arg_42_0.snapTimer_:Stop()

		arg_42_0.snapTimer_ = nil
	end
end

function var_0_0.AddMoveTimer(arg_43_0, arg_43_1)
	arg_43_0:StopMoveTimer()

	arg_43_0.moveTimer_ = FrameTimer.New(function()
		local var_44_0 = arg_43_0.mapItemParentTf_.localPosition
		local var_44_1 = GameSetting.chapter_velocity_times.value[1] * math.pow(arg_43_0.scrollRect_.decelerationRate, UnityEngine.Time.unscaledDeltaTime) * UnityEngine.Time.unscaledDeltaTime

		arg_43_0.tempVector3_.x = arg_43_1
		arg_43_0.tempVector3_.y = var_44_0.y
		arg_43_0.tempVector3_.z = var_44_0.z

		local var_44_2 = Vector3.Lerp(var_44_0, arg_43_0.tempVector3_, var_44_1)
		local var_44_3 = GameSetting.chapter_scroll_min_length.value[1]

		if var_44_3 > math.abs(var_44_0.x - var_44_2.x) then
			local var_44_4 = arg_43_1 - var_44_0.x

			if var_44_3 < math.abs(var_44_4) then
				var_44_4 = var_44_3 * var_44_4 / math.abs(var_44_4)
			end

			var_44_2.x = var_44_2.x + var_44_4
		end

		arg_43_0.mapItemParentTf_.anchoredPosition = var_44_2

		if math.abs(var_44_0.x - arg_43_1) <= GameSetting.chapter_stop_min_length.value[1] then
			arg_43_0.scrollView_:StopMovement()

			arg_43_0.mapItemParentTf_.anchoredPosition = arg_43_0.tempVector3_

			arg_43_0:StopToggleTimer()
			arg_43_0:StopMoveTimer()
			arg_43_0:StopMoveAction()
		end
	end, 1, -1)

	arg_43_0.moveTimer_:Start()
end

function var_0_0.StopMoveTimer(arg_45_0)
	if arg_45_0.moveTimer_ then
		arg_45_0.moveTimer_:Stop()

		arg_45_0.moveTimer_ = nil
	end
end

function var_0_0.AddToggleTimer(arg_46_0)
	arg_46_0:StopToggleTimer()

	arg_46_0.toggleTimer_ = FrameTimer.New(function()
		local var_47_0 = arg_46_0:SearchNearClientID()

		arg_46_0.selectChapterClientID_ = var_47_0

		arg_46_0:ChangeSelectID(var_47_0)
	end, 1, -1)

	arg_46_0.toggleTimer_:Start()
end

function var_0_0.StopToggleTimer(arg_48_0)
	if arg_48_0.toggleTimer_ then
		arg_48_0.toggleTimer_:Stop()

		arg_48_0.toggleTimer_ = nil
	end
end

function var_0_0.StopAllTimer(arg_49_0)
	arg_49_0:StopMoveTimer()
	arg_49_0:StopSnapTimer()
	arg_49_0:StopToggleTimer()
end

function var_0_0.OnAssetPendDownloadEnd(arg_50_0, arg_50_1, arg_50_2)
	for iter_50_0, iter_50_1 in ipairs(arg_50_0.itemList_) do
		iter_50_1:RefreshLock()
	end
end

return var_0_0
