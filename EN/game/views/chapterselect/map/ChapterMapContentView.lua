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

	arg_4_0.viewportTransform_ = arg_4_0.mapViewPort_.transform
	arg_4_0.hardLevelView_ = HardLevelChapterView.New(arg_4_0.difficultPanel_)
end

function var_0_0.OnEnter(arg_5_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR,
		INVITE_BAR
	})
	arg_5_0.hardLevelView_:OnEnter()
	arg_5_0:RefreshData()
	arg_5_0:RefreshUI()
	manager.notify:RegistListener(CHANGE_PLOT_SELECT_CHAPTER, arg_5_0.changeSelectChapterHandler_)
	manager.notify:RegistListener(CHANGE_PLOT_HARD_LEVEL, arg_5_0.changeSelectHardLevelHandler_)
end

function var_0_0.OnExit(arg_6_0)
	manager.windowBar:HideBar()
	arg_6_0:StopAllTimer()
	manager.notify:RemoveListener(CHANGE_PLOT_SELECT_CHAPTER, arg_6_0.changeSelectChapterHandler_)
	manager.notify:RemoveListener(CHANGE_PLOT_HARD_LEVEL, arg_6_0.changeSelectHardLevelHandler_)
	arg_6_0.hardLevelView_:OnExit()

	arg_6_0.viewSelectID_ = nil

	for iter_6_0, iter_6_1 in pairs(arg_6_0.mainPlotChapterToggleList_) do
		iter_6_1:OnExit()
	end

	for iter_6_2, iter_6_3 in pairs(arg_6_0.itemList_) do
		iter_6_3:OnExit()
	end

	arg_6_0.isFirstEnter_ = false

	arg_6_0:StopLeanTween()
end

function var_0_0.Dispose(arg_7_0)
	arg_7_0.changeSelectChapterHandler_ = nil
	arg_7_0.changeSelectHardLevelHandler_ = nil

	arg_7_0.scrollRect_.onValueChanged:RemoveAllListeners()
	arg_7_0.hardLevelView_:Dispose()

	arg_7_0.hardLevelView_ = nil

	for iter_7_0, iter_7_1 in pairs(arg_7_0.mainPlotChapterToggleList_) do
		iter_7_1:Dispose()
	end

	arg_7_0.mainPlotChapterToggleList_ = nil

	arg_7_0:RemoveListeners()

	for iter_7_2, iter_7_3 in ipairs(arg_7_0.itemList_) do
		iter_7_3:Dispose()
	end

	arg_7_0.itemList_ = {}

	var_0_0.super.Dispose(arg_7_0)
end

function var_0_0.AddListeners(arg_8_0)
	arg_8_0.eventTriggerListeners_:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.BeginDrag, LuaHelper.EventTriggerAction1(handler(arg_8_0, arg_8_0.BeginDragFun)))
	arg_8_0.eventTriggerListeners_:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.Drag, LuaHelper.EventTriggerAction1(handler(arg_8_0, arg_8_0.DragFun)))
	arg_8_0.eventTriggerListeners_:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.EndDrag, LuaHelper.EventTriggerAction1(handler(arg_8_0, arg_8_0.EndDragFun)))
	arg_8_0.eventTriggerListeners_:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.Scroll, LuaHelper.EventTriggerAction1(handler(arg_8_0, arg_8_0.ScrollFunc)))
	arg_8_0.scrollRect_.onValueChanged:AddListener(function()
		arg_8_0:RefreshItemPosition()
	end)
end

function var_0_0.BeginDragFun(arg_10_0, arg_10_1, arg_10_2)
	arg_10_0:StopMoveTimer()
	arg_10_0:StopSnapTimer()
	arg_10_0:AddToggleTimer()
end

function var_0_0.DragFun(arg_11_0, arg_11_1, arg_11_2)
	if math.abs(arg_11_2.position.x - arg_11_2.pressPosition.x) > GameSetting.chapter_scroll_length_threshold.value[1] then
		arg_11_0:RefreshSelectChapter(0)
	end
end

function var_0_0.EndDragFun(arg_12_0, arg_12_1, arg_12_2)
	manager.audio:PlayUIAudioByVoice("stage_slide")
	arg_12_0:AddSnapTimer()
end

function var_0_0.ScrollFunc(arg_13_0, arg_13_1, arg_13_2)
	arg_13_0:StopMoveTimer()

	local var_13_0 = arg_13_0:SearchNearClientID()

	arg_13_0.selectChapterClientID_ = var_13_0

	arg_13_0:ChangeSelectID(var_13_0)
	arg_13_0:RefreshSelectChapter(0)
	arg_13_0:AddSnapTimer()
end

function var_0_0.StopMoveAction(arg_14_0)
	arg_14_0:RefreshSelectChapter(arg_14_0.selectChapterClientID_)
	arg_14_0:AutoSwitchImage()
end

function var_0_0.InitImage(arg_15_0)
	local var_15_0 = ChapterClientCfg[arg_15_0.selectChapterClientID_]
	local var_15_1 = SpritePathCfg.ChapterPaint.path .. var_15_0.chapter_paint

	getSpriteWithoutAtlasAsync(var_15_1, function(arg_16_0)
		if not isNil(arg_15_0.chapterBehindImage_) then
			arg_15_0.chapterBehindImage_.sprite = arg_16_0
		end

		if not isNil(arg_15_0.chapterFrontImage_) then
			arg_15_0.chapterFrontImage_.sprite = arg_16_0
		end
	end)
end

function var_0_0.AutoSwitchImage(arg_17_0)
	local var_17_0 = arg_17_0.selectChapterClientID_
	local var_17_1 = ChapterClientCfg[var_17_0]
	local var_17_2 = SpritePathCfg.ChapterPaint.path .. var_17_1.chapter_paint

	getSpriteWithoutAtlasAsync(var_17_2, function(arg_18_0)
		if not isNil(arg_17_0.chapterBehindImage_) then
			arg_17_0.chapterBehindImage_.sprite = arg_18_0
		end
	end)

	local var_17_3 = var_0_0.SWITCH_STAGE_TIME

	arg_17_0:StopLeanTween()

	arg_17_0.leanTweenHandler_ = LeanTween.value(arg_17_0.chapterFrontImage_.gameObject, arg_17_0.chapterFrontCanvasGroup_.alpha, 0, var_17_3)

	arg_17_0.leanTweenHandler_:setOnUpdate(LuaHelper.FloatAction(function(arg_19_0)
		arg_17_0.chapterFrontCanvasGroup_.alpha = arg_19_0
		arg_17_0.chapterBehindCanvasGroup_.alpha = 1 - arg_19_0
	end))
	arg_17_0.leanTweenHandler_:setOnComplete(System.Action(function()
		arg_17_0:SwitchImageOver()
		arg_17_0:StopLeanTween()
	end))
end

function var_0_0.StopLeanTween(arg_21_0)
	if arg_21_0.leanTweenHandler_ then
		LeanTween.cancel(arg_21_0.chapterFrontImage_.gameObject)
		arg_21_0.leanTweenHandler_:setOnUpdate(nil):setOnComplete(nil)

		arg_21_0.leanTweenHandler_ = nil
	end
end

function var_0_0.SwitchImageOver(arg_22_0)
	arg_22_0.chapterBehindImage_, arg_22_0.chapterFrontImage_ = arg_22_0.chapterFrontImage_, arg_22_0.chapterBehindImage_
	arg_22_0.chapterBehindCanvasGroup_, arg_22_0.chapterFrontCanvasGroup_ = arg_22_0.chapterFrontCanvasGroup_, arg_22_0.chapterBehindCanvasGroup_
end

function var_0_0.RemoveListeners(arg_23_0)
	arg_23_0.eventTriggerListeners_:RemoveListenerType(UnityEngine.EventSystems.EventTriggerType.BeginDrag)
	arg_23_0.eventTriggerListeners_:RemoveListenerType(UnityEngine.EventSystems.EventTriggerType.Drag)
	arg_23_0.eventTriggerListeners_:RemoveListenerType(UnityEngine.EventSystems.EventTriggerType.EndDrag)
	arg_23_0.eventTriggerListeners_:RemoveListenerType(UnityEngine.EventSystems.EventTriggerType.Scroll)
end

function var_0_0.RefreshData(arg_24_0)
	arg_24_0.selectChapterClientID_ = BattleFieldData:GetCacheChapterClient(BattleConst.TOGGLE.PLOT)
	arg_24_0.hardLevel_ = ChapterClientCfg[arg_24_0.selectChapterClientID_].difficulty
	arg_24_0.chapterList_ = {}

	local var_24_0 = getChapterClientList()[arg_24_0.hardLevel_]

	for iter_24_0, iter_24_1 in ipairs(var_24_0) do
		if ChapterTools.HasChapterStage(iter_24_1) then
			table.insert(arg_24_0.chapterList_, iter_24_1)
		end
	end

	arg_24_0.maxChapterLevel_ = #arg_24_0.chapterList_
end

function var_0_0.RefreshUI(arg_25_0)
	arg_25_0:InitImage()
	arg_25_0:RefreshViewContent()
	arg_25_0:ChangeSelectChapterID()
	arg_25_0:RefreshSelectDifficult()
	arg_25_0:RefreshSelectChapter(arg_25_0.selectChapterClientID_)
	arg_25_0:RefreshToggle()
end

function var_0_0.ChangeSelectHardLevel(arg_26_0)
	arg_26_0:RefreshData()
	arg_26_0:RefreshSelectChapter(0)
	arg_26_0:RefreshViewContent()
	arg_26_0:RefreshItemPosition()
	arg_26_0:RefreshSelectDifficult()
	arg_26_0:RefreshToggle()

	arg_26_0.changeLevel_ = true
end

function var_0_0.RefreshToggle(arg_27_0)
	local var_27_0 = ChapterMainPlotToggleCfg.get_id_list_by_difficulty[arg_27_0.hardLevel_]

	for iter_27_0, iter_27_1 in ipairs(var_27_0) do
		local var_27_1 = arg_27_0.mainPlotChapterToggleList_[iter_27_0] or ChapterMapToggleView.New(arg_27_0.chapterItem_, arg_27_0.chapterParentGo_)

		arg_27_0.mainPlotChapterToggleList_[iter_27_0] = var_27_1

		var_27_1:SetData(iter_27_1)
	end

	for iter_27_2 = #var_27_0 + 1, #arg_27_0.mainPlotChapterToggleList_ do
		arg_27_0.mainPlotChapterToggleList_[iter_27_2]:Show(false)
	end

	arg_27_0:RefreshSelectChapterToggle()
end

function var_0_0.RefreshSelectChapter(arg_28_0, arg_28_1)
	if arg_28_0.viewSelectID_ == arg_28_1 then
		return
	end

	arg_28_0.viewSelectID_ = arg_28_1

	for iter_28_0, iter_28_1 in ipairs(arg_28_0.itemList_) do
		iter_28_1:SetSelectID(arg_28_1)
	end
end

function var_0_0.RefreshSelectChapterToggle(arg_29_0)
	arg_29_0.scrollTimer_ = FrameTimer.New(function()
		local var_30_0, var_30_1 = arg_29_0:GetToggleIndex()

		if arg_29_0.lastToggleIndx_ == var_30_0 then
			return
		end

		arg_29_0.lastToggleIndx_ = var_30_0
		arg_29_0.tempVector3_.x = 0
		arg_29_0.tempVector3_.y = 0
		arg_29_0.tempVector3_.z = 0

		local var_30_2 = arg_29_0.viewTf_:InverseTransformPoint(arg_29_0.mainPlotChapterToggleList_[var_30_0]:GetTransform():TransformPoint(arg_29_0.tempVector3_))

		if var_30_2.x <= 0 or var_30_2.x >= arg_29_0.viewTf_.rect.width then
			local var_30_3 = (var_30_0 - 1) / ((arg_29_0.contentTf_.rect.width - arg_29_0.viewTf_.rect.width) / (arg_29_0.itemTf_.rect.width + arg_29_0.contentLayout_.spacing))

			if var_30_3 > 1 then
				var_30_3 = 1
			elseif var_30_3 < 0 then
				var_30_3 = 0
			end

			arg_29_0.scrollView_.horizontalNormalizedPosition = var_30_3
		end

		for iter_30_0, iter_30_1 in pairs(arg_29_0.mainPlotChapterToggleList_) do
			iter_30_1:SetSelectID(arg_29_0.selectChapterClientID_)
		end
	end, 1, 1)

	arg_29_0.scrollTimer_:Start()
end

function var_0_0.GetToggleIndex(arg_31_0)
	local var_31_0 = ChapterMainPlotToggleCfg.get_id_list_by_difficulty[arg_31_0.hardLevel_]

	for iter_31_0, iter_31_1 in ipairs(var_31_0) do
		if table.keyof(ChapterMainPlotToggleCfg[iter_31_1].chapter_client_list, arg_31_0.selectChapterClientID_) then
			return iter_31_0, #var_31_0
		end
	end

	return #var_31_0, #var_31_0
end

function var_0_0.RefreshViewContent(arg_32_0)
	local var_32_0 = arg_32_0.mapItemTf_.rect.width
	local var_32_1 = arg_32_0.layoutGroup_.spacing
	local var_32_2 = arg_32_0.layoutGroup_.padding.left
	local var_32_3 = arg_32_0.layoutGroup_.padding.right
	local var_32_4 = 0

	for iter_32_0, iter_32_1 in ipairs(arg_32_0.chapterList_) do
		var_32_4 = var_32_4 + 1

		if arg_32_0.positionList_[iter_32_0] == nil then
			arg_32_0.positionList_[iter_32_0] = Vector3.New(var_32_2 + (var_32_0 + var_32_1) * (iter_32_0 - 1) + var_32_0 / 2, 0, 0)
		end
	end

	local var_32_5 = var_32_2 + var_32_0 * var_32_4 + var_32_1 * (var_32_4 - 1) + var_32_3 - arg_32_0.viewportTransform_.rect.width

	arg_32_0.tempVector2_.x = var_32_5
	arg_32_0.tempVector2_.y = arg_32_0.mapItemParentTf_.sizeDelta.y
	arg_32_0.mapItemParentTf_.sizeDelta = arg_32_0.tempVector2_
end

function var_0_0.IsDisplayItem(arg_33_0, arg_33_1)
	for iter_33_0, iter_33_1 in ipairs(arg_33_0.itemList_) do
		if arg_33_1 == iter_33_1:GetChapterClientID() then
			return iter_33_0
		end
	end
end

function var_0_0.RefreshItemPosition(arg_34_0)
	local var_34_0, var_34_1 = arg_34_0:CalcStartToEndIndex()
	local var_34_2 = {}
	local var_34_3 = {}

	for iter_34_0 = var_34_0, var_34_1 do
		local var_34_4 = arg_34_0.chapterList_[iter_34_0]
		local var_34_5 = arg_34_0:IsDisplayItem(var_34_4)

		if var_34_5 then
			arg_34_0.itemList_[var_34_5]:SetChapterClientID(arg_34_0.chapterList_[iter_34_0])
			arg_34_0.itemList_[var_34_5]:SetLocalPosition(arg_34_0.positionList_[iter_34_0])
			table.insert(var_34_2, var_34_5)
		else
			table.insert(var_34_3, iter_34_0)
		end
	end

	for iter_34_1, iter_34_2 in ipairs(var_34_3) do
		for iter_34_3, iter_34_4 in ipairs(arg_34_0.itemList_) do
			if not table.keyof(var_34_2, iter_34_3) then
				table.insert(var_34_2, iter_34_3)
				iter_34_4:SetChapterClientID(arg_34_0.chapterList_[iter_34_2])
				iter_34_4:SetLocalPosition(arg_34_0.positionList_[iter_34_2])

				break
			end
		end
	end

	for iter_34_5 = 1, #arg_34_0.itemList_ do
		if not table.keyof(var_34_2, iter_34_5) then
			arg_34_0.itemList_[iter_34_5]:Show(false)
		end
	end
end

function var_0_0.CalcStartToEndIndex(arg_35_0)
	local var_35_0 = arg_35_0.viewportTransform_.rect.width
	local var_35_1 = arg_35_0.mapItemTf_.rect.width / 2
	local var_35_2 = 1
	local var_35_3 = 1
	local var_35_4 = arg_35_0.mapItemParentTf_.localPosition.x

	for iter_35_0, iter_35_1 in ipairs(arg_35_0.chapterList_) do
		local var_35_5 = arg_35_0.positionList_[iter_35_0].x + var_35_4

		if var_35_5 + var_35_1 < 0 then
			var_35_2 = iter_35_0
		end

		if var_35_5 + var_35_1 >= 0 and var_35_0 >= var_35_5 - var_35_1 then
			var_35_3 = iter_35_0
		end
	end

	if var_35_3 < var_35_2 then
		var_35_3 = var_35_2
	end

	return var_35_2, var_35_3
end

function var_0_0.RefreshSelectDifficult(arg_36_0)
	arg_36_0.hardLevelView_:SetData(arg_36_0.hardLevel_, 0)
end

function var_0_0.ChangeSelectChapterID(arg_37_0)
	arg_37_0:RefreshData()
	arg_37_0:StopAllTimer()
	arg_37_0.scrollRect_:StopMovement()

	local var_37_0 = arg_37_0:GetItemPositionX(arg_37_0.selectChapterClientID_)

	if arg_37_0.changeLevel_ or not arg_37_0.isFirstEnter_ then
		local var_37_1 = arg_37_0.mapItemParentTf_.localPosition

		arg_37_0.tempVector3_.x = var_37_0
		arg_37_0.tempVector3_.y = var_37_1.y
		arg_37_0.tempVector3_.z = var_37_1.z
		arg_37_0.mapItemParentTf_.localPosition = arg_37_0.tempVector3_

		arg_37_0:RefreshItemPosition()
		arg_37_0:StopMoveAction()
	else
		arg_37_0:AddMoveTimer(var_37_0)
	end

	arg_37_0:RefreshSelectChapterToggle()

	if arg_37_0.changeLevel_ or not arg_37_0.isFirstEnter_ then
		arg_37_0.changeLevel_ = false
		arg_37_0.isFirstEnter_ = true
	else
		arg_37_0:RefreshSelectChapter(0)
	end
end

function var_0_0.ChangeSelectID(arg_38_0, arg_38_1)
	if not arg_38_1 then
		return
	end

	if arg_38_1 == BattleFieldData:GetCacheChapterClient(BattleConst.TOGGLE.PLOT) then
		return
	end

	BattleFieldData:SetCacheChapterClient(BattleConst.TOGGLE.PLOT, arg_38_1)
	arg_38_0:RefreshSelectChapterToggle()
end

function var_0_0.SearchNearClientID(arg_39_0)
	local var_39_0
	local var_39_1 = 200000
	local var_39_2 = arg_39_0.viewportTransform_.localPosition.x + arg_39_0.viewportTransform_.rect.width / 2

	for iter_39_0, iter_39_1 in ipairs(arg_39_0.chapterList_) do
		local var_39_3 = arg_39_0.positionList_[iter_39_0]
		local var_39_4 = math.abs(var_39_3.x + arg_39_0.mapItemParentTf_.localPosition.x - arg_39_0.viewportTransform_.rect.width / 2)

		if var_39_4 <= var_39_1 then
			var_39_1 = var_39_4
			var_39_0 = iter_39_1
		end
	end

	return var_39_0
end

function var_0_0.GetItemPositionX(arg_40_0, arg_40_1)
	local var_40_0 = table.keyof(arg_40_0.chapterList_, arg_40_1)
	local var_40_1 = arg_40_0.mapItemParentTf_.localPosition

	return -arg_40_0.positionList_[var_40_0].x + arg_40_0.viewportTransform_.rect.width / 2
end

function var_0_0.AddSnapTimer(arg_41_0)
	arg_41_0:StopSnapTimer()

	arg_41_0.snapTimer_ = FrameTimer.New(function()
		if arg_41_0.scrollRect_.velocity.x > -200 and arg_41_0.scrollRect_.velocity.x < 200 then
			arg_41_0.scrollRect_:StopMovement()

			local var_42_0 = arg_41_0:SearchNearClientID()

			arg_41_0.selectChapterClientID_ = var_42_0

			arg_41_0:ChangeSelectID(var_42_0)

			local var_42_1 = arg_41_0:GetItemPositionX(var_42_0)

			arg_41_0:AddMoveTimer(var_42_1)
			arg_41_0:StopSnapTimer()
		end
	end, 1, -1)

	arg_41_0.snapTimer_:Start()
end

function var_0_0.StopSnapTimer(arg_43_0)
	if arg_43_0.snapTimer_ then
		arg_43_0.snapTimer_:Stop()

		arg_43_0.snapTimer_ = nil
	end
end

function var_0_0.AddMoveTimer(arg_44_0, arg_44_1)
	arg_44_0:StopMoveTimer()

	arg_44_0.moveTimer_ = FrameTimer.New(function()
		local var_45_0 = arg_44_0.mapItemParentTf_.localPosition
		local var_45_1 = GameSetting.chapter_velocity_times.value[1] * math.pow(arg_44_0.scrollRect_.decelerationRate, UnityEngine.Time.unscaledDeltaTime) * UnityEngine.Time.unscaledDeltaTime

		arg_44_0.tempVector3_.x = arg_44_1
		arg_44_0.tempVector3_.y = var_45_0.y
		arg_44_0.tempVector3_.z = var_45_0.z

		local var_45_2 = Vector3.Lerp(var_45_0, arg_44_0.tempVector3_, var_45_1)
		local var_45_3 = GameSetting.chapter_scroll_min_length.value[1]

		if var_45_3 > math.abs(var_45_0.x - var_45_2.x) then
			local var_45_4 = arg_44_1 - var_45_0.x

			if var_45_3 < math.abs(var_45_4) then
				var_45_4 = var_45_3 * var_45_4 / math.abs(var_45_4)
			end

			var_45_2.x = var_45_2.x + var_45_4
		end

		arg_44_0.mapItemParentTf_.anchoredPosition = var_45_2

		if math.abs(var_45_0.x - arg_44_1) <= GameSetting.chapter_stop_min_length.value[1] then
			arg_44_0.scrollView_:StopMovement()

			arg_44_0.mapItemParentTf_.anchoredPosition = arg_44_0.tempVector3_

			arg_44_0:StopToggleTimer()
			arg_44_0:StopMoveTimer()
			arg_44_0:StopMoveAction()
		end
	end, 1, -1)

	arg_44_0.moveTimer_:Start()
end

function var_0_0.StopMoveTimer(arg_46_0)
	if arg_46_0.moveTimer_ then
		arg_46_0.moveTimer_:Stop()

		arg_46_0.moveTimer_ = nil
	end
end

function var_0_0.AddToggleTimer(arg_47_0)
	arg_47_0:StopToggleTimer()

	arg_47_0.toggleTimer_ = FrameTimer.New(function()
		local var_48_0 = arg_47_0:SearchNearClientID()

		arg_47_0.selectChapterClientID_ = var_48_0

		arg_47_0:ChangeSelectID(var_48_0)
	end, 1, -1)

	arg_47_0.toggleTimer_:Start()
end

function var_0_0.StopToggleTimer(arg_49_0)
	if arg_49_0.toggleTimer_ then
		arg_49_0.toggleTimer_:Stop()

		arg_49_0.toggleTimer_ = nil
	end
end

function var_0_0.StopAllTimer(arg_50_0)
	arg_50_0:StopMoveTimer()
	arg_50_0:StopSnapTimer()
	arg_50_0:StopToggleTimer()
end

return var_0_0
