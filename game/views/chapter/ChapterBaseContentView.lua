local var_0_0 = class("ChapterBaseContentView", ReduxView)

var_0_0.CIRCLE_RADIUS = 1425
var_0_0.ELLIPSE_A = 1425
var_0_0.ELLIPSE_B = 1425
var_0_0.ELLIPSE_SQUARE_A = var_0_0.ELLIPSE_A * var_0_0.ELLIPSE_A
var_0_0.ELLIPSE_SQUARE_B = var_0_0.ELLIPSE_B * var_0_0.ELLIPSE_B

function var_0_0.OnCtor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_1.transform
	arg_1_0.chapterToggle_ = arg_1_2
	arg_1_0.itemList_ = {}
	arg_1_0.tempVector3_ = Vector3.New(0, 0, 0)

	arg_1_0:InitUI()

	arg_1_0.ChangeSelectChapterHandler_ = handler(arg_1_0, arg_1_0.ChangeSelectChapter)
	arg_1_0.layoutGroup_.padding.left = arg_1_0.scrollTf_.rect.width / 2
	arg_1_0.layoutGroup_.padding.right = arg_1_0.scrollTf_.rect.width / 2
end

function var_0_0.OnEnter(arg_2_0)
	manager.notify:RegistListener(CHANGE_DUNGEON, arg_2_0.ChangeSelectChapterHandler_)
	arg_2_0:RefreshData()
	arg_2_0:RefreshUI()
	arg_2_0.eventTriggerListener_:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.BeginDrag, LuaHelper.EventTriggerAction1(handler(arg_2_0, arg_2_0.BeginDragFun)))
	arg_2_0.eventTriggerListener_:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.EndDrag, LuaHelper.EventTriggerAction1(handler(arg_2_0, arg_2_0.EndDragFun)))
end

function var_0_0.OnExit(arg_3_0)
	arg_3_0.eventTriggerListener_:RemoveListenerType(UnityEngine.EventSystems.EventTriggerType.BeginDrag)
	arg_3_0.eventTriggerListener_:RemoveListenerType(UnityEngine.EventSystems.EventTriggerType.EndDrag)
	manager.notify:RemoveListener(CHANGE_DUNGEON, arg_3_0.ChangeSelectChapterHandler_)

	for iter_3_0, iter_3_1 in ipairs(arg_3_0.itemList_) do
		iter_3_1.virtualItem:OnExit()
		iter_3_1.renderItem:OnExit()
	end

	arg_3_0:StopMoveTimer()
	arg_3_0:StopScrollTimer()
end

function var_0_0.Dispose(arg_4_0)
	arg_4_0.ChangeSelectChapterHandler_ = nil

	for iter_4_0, iter_4_1 in pairs(arg_4_0.itemList_) do
		iter_4_1.virtualItem:Dispose()
		iter_4_1.renderItem:Dispose()
	end

	arg_4_0.itemList_ = nil
	arg_4_0.scrollView_ = nil
	arg_4_0.mapItem_ = nil
	arg_4_0.itemParent_ = nil

	var_0_0.super.Dispose(arg_4_0)
end

function var_0_0.InitUI(arg_5_0)
	arg_5_0:BindCfgUI()
	arg_5_0:AddListeners()

	arg_5_0.lockController_ = arg_5_0.btnControllerEx_:GetController("lock")
	arg_5_0.selectController_ = arg_5_0.controllerEx_:GetController("select")
end

function var_0_0.AddListeners(arg_6_0)
	arg_6_0:AddToggleListener(arg_6_0.scrollView_, function(arg_7_0)
		arg_6_0:RefreshItemPosition()
	end)
	arg_6_0:AddBtnListener(arg_6_0.btn_, nil, function()
		arg_6_0:GetSelectItem().renderItem:InvokeBtn()
	end)
end

function var_0_0.BeginDragFun(arg_9_0, arg_9_1, arg_9_2)
	arg_9_0:StopMoveTimer()
	arg_9_0:StopScrollTimer()
	arg_9_0.scrollView_:OnBeginDrag(arg_9_2)
	arg_9_0.selectController_:SetSelectedState("false")
	arg_9_0:PlayAnimatorExit()
end

function var_0_0.EndDragFun(arg_10_0, arg_10_1, arg_10_2)
	arg_10_0.scrollView_:OnEndDrag(arg_10_2)
	arg_10_0:AddScrollTimer()
end

function var_0_0.AddScrollTimer(arg_11_0)
	arg_11_0:StopScrollTimer()

	arg_11_0.scrollTimer_ = nil
	arg_11_0.scrollTimer_ = FrameTimer.New(function()
		if math.abs(arg_11_0.scrollView_.velocity.x) <= 100 then
			arg_11_0.scrollTimer_:Stop()
			arg_11_0:AdjustItem()
		end
	end, 1, -1)

	arg_11_0.scrollTimer_:Start()
end

function var_0_0.StopScrollTimer(arg_13_0)
	if arg_13_0.scrollTimer_ then
		arg_13_0.scrollTimer_:Stop()

		arg_13_0.scrollTimer_ = nil
	end
end

function var_0_0.AdjustItem(arg_14_0)
	local var_14_0 = arg_14_0:GetNearestItem()

	BattleFieldData:SetCacheChapterClient(arg_14_0.chapterToggle_, var_14_0.renderItem:GetChapterClientID())
	arg_14_0:ChangeSelectChapter(true)
end

function var_0_0.SetActive(arg_15_0, arg_15_1)
	SetActive(arg_15_0.gameObject_, arg_15_1)

	if arg_15_1 then
		arg_15_0:RefreshItemPosition()
		arg_15_0:PlayAnimatorEnter()
	end
end

function var_0_0.RefreshData(arg_16_0)
	arg_16_0.selectClientID_ = BattleFieldData:GetCacheChapterClient(arg_16_0.chapterToggle_)
end

function var_0_0.RefreshUI(arg_17_0)
	arg_17_0:RefreshMapItems()

	for iter_17_0, iter_17_1 in pairs(arg_17_0.itemList_) do
		iter_17_1.virtualItem:OnEnter()
		iter_17_1.renderItem:OnEnter()
	end

	arg_17_0:RefreshSortItem()
	FrameTimer.New(function()
		arg_17_0:OverMoveAction()
		arg_17_0:RefreshItemPosition()
	end, 1, 1):Start()
end

function var_0_0.RefreshChapterUI(arg_19_0)
	local var_19_0 = ChapterClientCfg[arg_19_0.selectClientID_]

	arg_19_0.nameText_.text = GetI18NText(var_19_0.name)

	SetSpriteWithoutAtlasAsync(arg_19_0.mapImage_, SpritePathCfg.ChapterPaint.path .. var_19_0.chapter_paint)

	local var_19_1 = arg_19_0:GetSelectItem()
	local var_19_2 = var_19_1.renderItem:GetLockState()

	arg_19_0.lockController_:SetSelectedState(tostring(var_19_2))

	if var_19_2 then
		arg_19_0.lockText_.text = var_19_1.renderItem:GetLockTips(arg_19_0.lockTips_)
	end

	if arg_19_0.gameObject_.activeInHierarchy then
		arg_19_0.bgAnimator_:Play("Fx_base_cx", 0, 0)
	end

	arg_19_0:PlayAnimatorEnter()
end

function var_0_0.RefreshMapItems(arg_20_0)
	return
end

function var_0_0.GetToggleID(arg_21_0)
	return
end

function var_0_0.RefreshSortItem(arg_22_0)
	local var_22_0 = {}
	local var_22_1 = {}

	for iter_22_0, iter_22_1 in ipairs(arg_22_0.itemList_) do
		if iter_22_1.renderItem:GetLockState() then
			table.insert(var_22_1, iter_22_1)
		else
			table.insert(var_22_0, iter_22_1)
		end
	end

	table.insertto(var_22_0, var_22_1)

	for iter_22_2, iter_22_3 in ipairs(var_22_0) do
		iter_22_3.virtualItem:SetSiblingIndex(iter_22_2)
	end
end

function var_0_0.ChangeSelectChapter(arg_23_0, arg_23_1)
	if not arg_23_1 then
		arg_23_0:PlayAnimatorExit()
	end

	arg_23_0:RefreshData()
	arg_23_0:Scroll2SelectItem()
end

function var_0_0.Scroll2SelectItem(arg_24_0)
	arg_24_0.selectController_:SetSelectedState("false")

	for iter_24_0, iter_24_1 in ipairs(arg_24_0.itemList_) do
		if iter_24_1.renderItem:GetChapterClientID() == arg_24_0.selectClientID_ then
			arg_24_0:AddMoveTimer(iter_24_1)
		end
	end
end

function var_0_0.RefreshItemPosition(arg_25_0)
	for iter_25_0, iter_25_1 in ipairs(arg_25_0.itemList_) do
		local var_25_0 = iter_25_1.virtualItem:GetLocalPosition().x + arg_25_0.contentTf_.localPosition.x
		local var_25_1 = 1
		local var_25_2 = 0
		local var_25_3 = -1 * var_0_0.CIRCLE_RADIUS
		local var_25_4 = var_25_0 * math.pi / 3600
		local var_25_5 = math.cos(var_25_4) * var_25_2 - math.sin(var_25_4) * var_25_3
		local var_25_6 = var_0_0.CIRCLE_RADIUS + (math.cos(var_25_4) * var_25_3 + math.sin(var_25_4) * var_25_2)

		iter_25_1.renderItem:SetPosition(var_25_5 - arg_25_0.contentTf_.localPosition.x, var_25_6 + 220, var_25_1)
	end
end

function var_0_0.GetEllipseYValue(arg_26_0, arg_26_1)
	local var_26_0 = var_0_0.ELLIPSE_SQUARE_B - var_0_0.ELLIPSE_SQUARE_B / var_0_0.ELLIPSE_SQUARE_A * arg_26_1 * arg_26_1

	if var_26_0 < 0 then
		var_26_0 = 0
	end

	return math.sqrt(var_26_0)
end

function var_0_0.GetCircleYValue(arg_27_0, arg_27_1)
	local var_27_0 = var_0_0.CIRCLE_RADIUS

	arg_27_1 = math.abs(arg_27_0.contentTf_.localPosition.x + arg_27_1)

	if var_27_0 < arg_27_1 then
		arg_27_1 = var_27_0
	end

	return math.sqrt(var_27_0 * var_27_0 - arg_27_1 * arg_27_1)
end

function var_0_0.GetSelectItem(arg_28_0)
	for iter_28_0, iter_28_1 in ipairs(arg_28_0.itemList_) do
		if iter_28_1.renderItem:GetChapterClientID() == arg_28_0.selectClientID_ then
			return iter_28_1
		end
	end

	return arg_28_0.itemList_[1]
end

function var_0_0.GetNearestItem(arg_29_0)
	local var_29_0 = 9999
	local var_29_1

	for iter_29_0, iter_29_1 in ipairs(arg_29_0.itemList_) do
		local var_29_2 = math.abs(arg_29_0.contentTf_.localPosition.x + iter_29_1.virtualItem:GetLocalPosition().x)

		if var_29_2 < var_29_0 then
			var_29_0 = var_29_2
			var_29_1 = iter_29_1
		end
	end

	return var_29_1
end

function var_0_0.OverMoveAction(arg_30_0)
	arg_30_0.selectController_:SetSelectedState("true")

	local var_30_0 = arg_30_0.contentTf_.localPosition
	local var_30_1 = arg_30_0:GetSelectItem()

	arg_30_0.tempVector3_.x = var_30_1.virtualItem:GetLocalPosition().x * -1
	arg_30_0.tempVector3_.y = var_30_0.y
	arg_30_0.tempVector3_.z = var_30_0.z
	arg_30_0.contentTf_.localPosition = arg_30_0.tempVector3_

	arg_30_0:RefreshChapterUI()
end

function var_0_0.PlayAnimatorEnter(arg_31_0)
	for iter_31_0, iter_31_1 in ipairs(arg_31_0.itemList_) do
		if iter_31_1.renderItem:GetChapterClientID() == arg_31_0.selectClientID_ then
			iter_31_1.renderItem:PlayAnimatorEnter()
		end
	end
end

function var_0_0.PlayAnimatorExit(arg_32_0)
	for iter_32_0, iter_32_1 in ipairs(arg_32_0.itemList_) do
		if iter_32_1.renderItem:GetChapterClientID() == arg_32_0.selectClientID_ then
			iter_32_1.renderItem:PlayAnimatorExit()
		end
	end
end

function var_0_0.AddMoveTimer(arg_33_0, arg_33_1)
	arg_33_0:StopMoveTimer()

	local var_33_0 = arg_33_0.contentTf_.localPosition

	arg_33_0.moveTimer_ = FrameTimer.New(function()
		local var_34_0 = arg_33_0.contentTf_.rect.width / 2
		local var_34_1 = arg_33_0.scrollTf_.rect.width / 2
		local var_34_2 = arg_33_0.contentTf_.localPosition
		local var_34_3 = arg_33_1.virtualItem:GetLocalPosition().x * -1
		local var_34_4 = GameSetting.challenge_velocity_times.value[1] * math.pow(arg_33_0.scrollView_.decelerationRate, UnityEngine.Time.unscaledDeltaTime) * UnityEngine.Time.unscaledDeltaTime

		arg_33_0.tempVector3_.x = var_34_3
		arg_33_0.tempVector3_.y = var_34_2.y
		arg_33_0.tempVector3_.z = var_34_2.z

		local var_34_5 = Vector3.Lerp(var_34_2, arg_33_0.tempVector3_, var_34_4)
		local var_34_6 = GameSetting.challenge_scroll_min_length.value[1]

		if var_34_6 > math.abs(var_34_2.x - var_34_5.x) then
			local var_34_7 = var_34_3 - var_34_2.x

			if var_34_6 < math.abs(var_34_7) then
				var_34_7 = var_34_6 * var_34_7 / math.abs(var_34_7)
			end

			var_34_5.x = var_34_5.x + var_34_7
		end

		arg_33_0.contentTf_.localPosition = var_34_5

		if math.abs(arg_33_0.contentTf_.localPosition.x - var_34_3) <= GameSetting.challenge_stop_min_length.value[1] then
			arg_33_0.scrollView_:StopMovement()
			arg_33_0:StopMoveTimer()
			arg_33_0:OverMoveAction()
		end
	end, 1, -1)

	arg_33_0.moveTimer_:Start()
end

function var_0_0.StopMoveTimer(arg_35_0)
	if arg_35_0.moveTimer_ then
		arg_35_0.moveTimer_:Stop()

		arg_35_0.moveTimer_ = nil
	end
end

return var_0_0
