local var_0_0 = class("ChaperSelectBaseView", ReduxView)

var_0_0.MAX_DRAG_LENGTH = 1500
var_0_0.MIN_DRAG_LENGTH = 200
var_0_0.SWITCH_STAGE_TIME = 0.8

function var_0_0.UIName(arg_1_0)
	return
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:BindCfgUI()
	arg_3_0:AddListeners()

	arg_3_0.tempVector2_ = Vector2.New(0, 0, 0)
	arg_3_0.hardController_ = arg_3_0.controllerEx_:GetController("isSubPlot")
	arg_3_0.activityController_ = arg_3_0.controllerEx_:GetController("isActivity")
	arg_3_0.chapterSelectTitleView_ = ChapterSelectTitleView.New(arg_3_0.titleGo_)
end

function var_0_0.OnEnter(arg_4_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR,
		INVITE_BAR
	})
	arg_4_0:RefreshData()
	arg_4_0:InitImage()
	arg_4_0:RefreshUI()
	arg_4_0.chapterSelectTitleView_:OnEnter(arg_4_0.selectChapterClientID_)
end

function var_0_0.OnExit(arg_5_0)
	manager.windowBar:HideBar()
	arg_5_0.chapterSelectTitleView_:OnExit()
	arg_5_0:StopAllTimer()
	arg_5_0:StopLeanTween()
end

function var_0_0.Dispose(arg_6_0)
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
end

function var_0_0.BeginDragFun(arg_8_0, arg_8_1, arg_8_2)
	arg_8_0:StopLeanTween()
end

function var_0_0.DragFun(arg_9_0, arg_9_1, arg_9_2)
	local var_9_0 = arg_9_2.position.x - arg_9_2.pressPosition.x
	local var_9_1 = ChapterTools.GetNeighborClientID(arg_9_0.selectChapterClientID_, var_9_0 < 0)

	if var_9_1 == arg_9_0.selectChapterClientID_ then
		return
	end

	if arg_9_0.nextChapterClientID_ ~= var_9_1 then
		local var_9_2 = ChapterClientCfg[var_9_1]
		local var_9_3 = SpritePathCfg.ChapterPaint.path .. var_9_2.chapter_paint

		getSpriteWithoutAtlasAsync(var_9_3, function(arg_10_0)
			if arg_9_0.chapterBehindImage_ then
				arg_9_0.chapterBehindImage_.sprite = arg_10_0
			end
		end)

		arg_9_0.nextChapterClientID_ = var_9_1
	end

	local var_9_4 = math.min(math.max(0, math.abs(var_9_0)), var_0_0.MAX_DRAG_LENGTH) / var_0_0.MAX_DRAG_LENGTH

	arg_9_0.chapterFrontCanvasGroup_.alpha = 1 - var_9_4
	arg_9_0.chapterBehindCanvasGroup_.alpha = var_9_4
end

function var_0_0.EndDragFun(arg_11_0, arg_11_1, arg_11_2)
	local var_11_0 = arg_11_2.position.x - arg_11_2.pressPosition.x

	if ChapterTools.GetNeighborClientID(arg_11_0.selectChapterClientID_, var_11_0 < 0) == arg_11_0.selectChapterClientID_ then
		return
	end

	if math.abs(var_11_0) > var_0_0.MIN_DRAG_LENGTH then
		arg_11_0.selectChapterClientID_ = arg_11_0.nextChapterClientID_
		arg_11_0.nextChapterClientID_ = nil

		BattleFieldData:SetCacheChapterClient(BattleConst.TOGGLE.PLOT, arg_11_0.selectChapterClientID_)
		arg_11_0:RefreshData()

		if math.abs(var_11_0) > var_0_0.MAX_DRAG_LENGTH then
			arg_11_0:RefreshChapterUI()
			arg_11_0:SwitchImageOver()
		else
			local var_11_1 = (var_0_0.MAX_DRAG_LENGTH - math.abs(var_11_0)) / var_0_0.MAX_DRAG_LENGTH * var_0_0.SWITCH_STAGE_TIME

			arg_11_0.leanTweenHandler_ = LeanTween.value(arg_11_0.chapterFrontImage_.gameObject, arg_11_0.chapterFrontCanvasGroup_.alpha, 0, var_11_1)

			arg_11_0.leanTweenHandler_:setOnUpdate(LuaHelper.FloatAction(function(arg_12_0)
				arg_11_0.chapterFrontCanvasGroup_.alpha = arg_12_0
				arg_11_0.chapterBehindCanvasGroup_.alpha = 1 - arg_12_0
			end))
			arg_11_0.leanTweenHandler_:setOnComplete(System.Action(function()
				arg_11_0:RefreshChapterUI()
				arg_11_0:SwitchImageOver()
				LeanTween.cancel(arg_11_0.chapterFrontImage_.gameObject)
				arg_11_0.leanTweenHandler_:setOnUpdate(nil):setOnComplete(nil)

				arg_11_0.leanTweenHandler_ = nil
			end))
		end
	else
		local var_11_2 = (1 - (var_0_0.MIN_DRAG_LENGTH - math.abs(var_11_0)) / var_0_0.MIN_DRAG_LENGTH) * 0.8

		arg_11_0.leanTweenHandler_ = LeanTween.value(arg_11_0.chapterFrontImage_.gameObject, arg_11_0.chapterFrontCanvasGroup_.alpha, 1, var_11_2)

		arg_11_0.leanTweenHandler_:setOnUpdate(LuaHelper.FloatAction(function(arg_14_0)
			arg_11_0.chapterFrontCanvasGroup_.alpha = arg_14_0
			arg_11_0.chapterBehindCanvasGroup_.alpha = 1 - arg_14_0
		end))
		arg_11_0.leanTweenHandler_:setOnComplete(System.Action(function()
			LeanTween.cancel(arg_11_0.chapterFrontImage_.gameObject)
			arg_11_0.leanTweenHandler_:setOnUpdate(nil):setOnComplete(nil)

			arg_11_0.leanTweenHandler_ = nil
		end))
	end
end

function var_0_0.PointerUpFun(arg_16_0, arg_16_1, arg_16_2)
	if arg_16_2.dragging then
		return
	end

	local var_16_0 = arg_16_0.selectChapterClientID_
	local var_16_1 = BattleFieldData:GetCacheChapter(var_16_0)
	local var_16_2, var_16_3 = ChapterTools.IsFinishPreChapter(var_16_1)

	if not var_16_2 then
		ShowTips(ChapterTools.GetChapterLockText(var_16_1, var_16_3))

		return
	end

	ChapterTools.GotoChapterSection(var_16_1)
end

function var_0_0.BeginToggleDragFun(arg_17_0, arg_17_1, arg_17_2)
	arg_17_0:StopMoveTimer()
	arg_17_0.scrollView_:OnBeginDrag(arg_17_2)
end

function var_0_0.RemoveListeners(arg_18_0)
	arg_18_0.eventTriggerListener_:RemoveListenerType(UnityEngine.EventSystems.EventTriggerType.BeginDrag)
	arg_18_0.eventTriggerListener_:RemoveListenerType(UnityEngine.EventSystems.EventTriggerType.Drag)
	arg_18_0.eventTriggerListener_:RemoveListenerType(UnityEngine.EventSystems.EventTriggerType.EndDrag)
	arg_18_0.eventTriggerListener_:RemoveListenerType(UnityEngine.EventSystems.EventTriggerType.PointerUp)
	arg_18_0.toggleEventTriggerListener_:RemoveListenerType(UnityEngine.EventSystems.EventTriggerType.BeginDrag)
end

function var_0_0.SwitchImageOver(arg_19_0)
	arg_19_0.chapterBehindImage_, arg_19_0.chapterFrontImage_ = arg_19_0.chapterFrontImage_, arg_19_0.chapterBehindImage_
	arg_19_0.chapterBehindCanvasGroup_, arg_19_0.chapterFrontCanvasGroup_ = arg_19_0.chapterFrontCanvasGroup_, arg_19_0.chapterBehindCanvasGroup_
end

function var_0_0.AutoSwitchImage(arg_20_0)
	local var_20_0 = arg_20_0.selectChapterClientID_
	local var_20_1 = ChapterClientCfg[var_20_0]
	local var_20_2 = SpritePathCfg.ChapterPaint.path .. var_20_1.chapter_paint

	getSpriteWithoutAtlasAsync(var_20_2, function(arg_21_0)
		if arg_20_0.chapterBehindImage_ then
			arg_20_0.chapterBehindImage_.sprite = arg_21_0
		end
	end)

	local var_20_3 = var_0_0.SWITCH_STAGE_TIME

	arg_20_0.leanTweenHandler_ = LeanTween.value(arg_20_0.chapterFrontImage_.gameObject, arg_20_0.chapterFrontCanvasGroup_.alpha, 0, var_20_3)

	arg_20_0.leanTweenHandler_:setOnUpdate(LuaHelper.FloatAction(function(arg_22_0)
		arg_20_0.chapterFrontCanvasGroup_.alpha = arg_22_0
		arg_20_0.chapterBehindCanvasGroup_.alpha = 1 - arg_22_0
	end))
	arg_20_0.leanTweenHandler_:setOnComplete(System.Action(function()
		arg_20_0:SwitchImageOver()
		LeanTween.cancel(arg_20_0.chapterFrontImage_.gameObject)
		arg_20_0.leanTweenHandler_:setOnUpdate(nil):setOnComplete(nil)

		arg_20_0.leanTweenHandler_ = nil
	end))
end

function var_0_0.RefreshData(arg_24_0)
	return
end

function var_0_0.InitImage(arg_25_0)
	local var_25_0 = ChapterClientCfg[arg_25_0.selectChapterClientID_]
	local var_25_1 = SpritePathCfg.ChapterPaint.path .. var_25_0.chapter_paint

	getSpriteWithoutAtlasAsync(var_25_1, function(arg_26_0)
		if arg_25_0.chapterBehindImage_ then
			arg_25_0.chapterBehindImage_.sprite = arg_26_0
		end

		if arg_25_0.chapterFrontImage_ then
			arg_25_0.chapterFrontImage_.sprite = arg_26_0
		end
	end)
end

function var_0_0.RefreshUI(arg_27_0)
	return
end

function var_0_0.AddMoveTimer(arg_28_0, arg_28_1)
	arg_28_0:StopMoveTimer()

	arg_28_0.moveTimer_ = FrameTimer.New(function()
		local var_29_0 = arg_28_0.contentTf_.rect.width / 2
		local var_29_1 = arg_28_0.scrollTf_.rect.width / 2
		local var_29_2 = arg_28_0.contentTf_.anchoredPosition
		local var_29_3 = arg_28_1:GetLocalPosition().x * -1

		if var_29_1 >= var_29_0 + var_29_3 then
			var_29_3 = var_29_1 - var_29_0
		elseif var_29_1 >= var_29_0 - var_29_3 then
			var_29_3 = var_29_0 - var_29_1
		end

		local var_29_4 = 3 * math.pow(arg_28_0.scrollView_.decelerationRate, UnityEngine.Time.unscaledDeltaTime) * UnityEngine.Time.unscaledDeltaTime

		arg_28_0.tempVector2_.x = var_29_3
		arg_28_0.tempVector2_.y = var_29_2.y
		arg_28_0.contentTf_.anchoredPosition = Vector2.Lerp(var_29_2, arg_28_0.tempVector2_, var_29_4)

		if math.abs(var_29_2.x - var_29_3) <= 1 then
			arg_28_0.contentTf_.anchoredPosition = arg_28_0.tempVector2_

			arg_28_0:StopMoveTimer()
		end
	end, 1, -1)

	arg_28_0.moveTimer_:Start()
end

function var_0_0.StopMoveTimer(arg_30_0)
	if arg_30_0.moveTimer_ then
		arg_30_0.moveTimer_:Stop()

		arg_30_0.moveTimer_ = nil
	end
end

function var_0_0.StopLeanTween(arg_31_0)
	if arg_31_0.leanTweenHandler_ then
		LeanTween.cancel(arg_31_0.chapterFrontImage_.gameObject)
		arg_31_0.leanTweenHandler_:callOnCompletes()
	end
end

function var_0_0.StopAllTimer(arg_32_0)
	arg_32_0:StopMoveTimer()
end

return var_0_0
