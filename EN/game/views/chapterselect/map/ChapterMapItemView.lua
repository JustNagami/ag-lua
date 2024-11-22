local var_0_0 = class("ChapterMapItemView", ReduxView)

function var_0_0.OnCtor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.gameObject_ = Object.Instantiate(arg_1_1, arg_1_2.transform)
	arg_1_0.transform_ = arg_1_0.gameObject_.transform
	arg_1_0.tempVector3_ = Vector3.New(0, 0, 0)
	arg_1_0.parent_ = arg_1_2
	arg_1_0.viewportTransform_ = arg_1_2.transform.parent
	arg_1_0.width_ = arg_1_0.viewportTransform_.rect.width / 2
	arg_1_0.alphaScale_ = 0.0007692307692307692

	arg_1_0:InitUI()
	arg_1_0:AddListeners()
	arg_1_0:Show(true)
end

function var_0_0.OnEnter(arg_2_0)
	return
end

function var_0_0.OnExit(arg_3_0)
	if arg_3_0.chapterClientID_ then
		manager.redPoint:unbindUIandKey(arg_3_0.itemRect_, string.format("%s_%s", RedPointConst.COMBAT_PLOT, arg_3_0.chapterClientID_))
	end

	arg_3_0:StopTimer()
	arg_3_0:StopTween()
	arg_3_0:RemoveActivityTimer()
end

function var_0_0.Dispose(arg_4_0)
	arg_4_0:RemoveListeners()
	var_0_0.super.Dispose(arg_4_0)
	Object.Destroy(arg_4_0.gameObject_)

	arg_4_0.gameObject_ = nil
	arg_4_0.transform_ = nil
end

function var_0_0.InitUI(arg_5_0)
	arg_5_0:BindCfgUI()

	arg_5_0.lockController_ = arg_5_0.controllerEx_:GetController("lock")
	arg_5_0.activityController_ = arg_5_0.controllerEx_:GetController("activityFlag")
	arg_5_0.selectController_ = arg_5_0.controllerEx_:GetController("chapter")
end

function var_0_0.AddListeners(arg_6_0)
	arg_6_0:AddBtnListener(arg_6_0.btn_, nil, function()
		local var_7_0 = arg_6_0.hardLevel_
		local var_7_1 = arg_6_0.chapterClientID_
		local var_7_2 = BattleFieldData:GetCacheChapter(var_7_1)
		local var_7_3 = BattleFieldData:GetCacheChapterClient(BattleConst.TOGGLE.PLOT)

		if ChapterClientCfg[var_7_3].id ~= var_7_1 then
			manager.audio:PlayUIAudioByVoice("stage_slide")
			BattleFieldAction.ChangeSelectChapterID(var_7_2)

			return
		end

		local var_7_4, var_7_5 = ChapterTools.IsFinishPreChapter(var_7_2)

		if not var_7_4 then
			ShowTips(ChapterTools.GetChapterLockText(var_7_2, var_7_5))

			return
		end

		ChapterTools.GotoChapterSection(var_7_2)
	end)
end

function var_0_0.RemoveListeners(arg_8_0)
	arg_8_0.btn_.onClick:RemoveAllListeners()
end

function var_0_0.RefreshData(arg_9_0)
	local var_9_0 = arg_9_0.chapterClientID_
	local var_9_1 = ChapterClientCfg[var_9_0].chapter_list[1]

	arg_9_0.collectRate_ = ChapterTools.GetChapterClientFinishPercentage(var_9_0)

	local var_9_2 = ChapterCfg[var_9_1]

	arg_9_0.isLock_ = not ChapterTools.IsFinishPreChapter(var_9_1)
	arg_9_0.hardLevel_ = var_9_2.type
end

function var_0_0.RefreshUI(arg_10_0)
	arg_10_0:RefreshItem()
	arg_10_0:RefreshLock()
	arg_10_0:RefreshActivity()
	arg_10_0:RefreshCollect()
end

function var_0_0.RefreshItem(arg_11_0)
	local var_11_0 = arg_11_0.chapterClientID_

	if arg_11_0.oldChapterClientID_ ~= var_11_0 then
		local var_11_1 = ChapterClientCfg[var_11_0]

		arg_11_0.chapterName_.text = GetI18NText(var_11_1.name)
		arg_11_0.chapterDesc_.text = GetI18NText(var_11_1.desc)

		local var_11_2 = SpritePathCfg.ChapterPaint.path .. var_11_1.chapter_paint

		getSpriteWithoutAtlasAsync(var_11_2, function(arg_12_0)
			if not isNil(arg_11_0.chapterPaint_) then
				arg_11_0.chapterPaint_.sprite = arg_12_0
			end
		end)

		arg_11_0.oldChapterClientID_ = var_11_0
	end
end

function var_0_0.RefreshLock(arg_13_0)
	arg_13_0.lockController_:SetSelectedState(tostring(arg_13_0.isLock_))
end

function var_0_0.RefreshActivity(arg_14_0)
	local var_14_0 = ChapterClientCfg[arg_14_0.chapterClientID_].chapter_list[1]
	local var_14_1 = ChapterCfg[var_14_0]

	arg_14_0.activityController_:SetSelectedState(tostring(ActivityData:GetActivityIsOpen(var_14_1.activity_id)))
end

function var_0_0.RefreshHardLevel(arg_15_0)
	arg_15_0.chapterLevelText_.text = GetTips(BattleConst.HARD_LANGUAGE[arg_15_0.hardLevel_])
end

function var_0_0.RefreshCollect(arg_16_0)
	arg_16_0.collectText_.text = string.format("%s%%", math.floor(arg_16_0.collectRate_ * 100))
end

function var_0_0.PlayAnimate(arg_17_0)
	arg_17_0:AddUpdate()
	arg_17_0:StopTween()

	arg_17_0.collectProgress_.fillAmount = 0
	arg_17_0.tweenValue_ = LeanTween.value(arg_17_0.gameObject_, 0, arg_17_0.collectRate_, 0.5):setOnUpdate(LuaHelper.FloatAction(function(arg_18_0)
		arg_17_0.collectProgress_.fillAmount = arg_18_0
	end)):setOnComplete(LuaHelper.VoidAction(function()
		arg_17_0.tweenValue_:setOnUpdate(nil):setOnComplete(nil):setEase(nil)

		arg_17_0.tweenValue_ = nil
	end)):setEase(LeanTweenType.easeOutQuad):setDelay(0.2)
end

function var_0_0.StopTween(arg_20_0)
	if arg_20_0.tweenValue_ then
		arg_20_0.tweenValue_:setOnUpdate(nil):setOnComplete(nil):setEase(nil)
		LeanTween.cancel(arg_20_0.gameObject_)

		arg_20_0.tweenValue_ = nil
	end
end

function var_0_0.SetChapterClientID(arg_21_0, arg_21_1)
	if arg_21_0.chapterClientID_ then
		manager.redPoint:unbindUIandKey(arg_21_0.itemRect_, string.format("%s_%s", RedPointConst.COMBAT_PLOT, arg_21_0.chapterClientID_))
	end

	local var_21_0 = arg_21_0.chapterClientID_ == arg_21_1

	arg_21_0.chapterClientID_ = arg_21_1
	arg_21_0.transform_.name = arg_21_1

	manager.redPoint:bindUIandKey(arg_21_0.itemRect_, string.format("%s_%s", RedPointConst.COMBAT_PLOT, arg_21_0.chapterClientID_))
	arg_21_0:RefreshData()
	arg_21_0:RefreshUI()

	if not var_21_0 then
		arg_21_0:PlayAnimate()
	end

	arg_21_0:AddActivityTimer()
	arg_21_0:Show(true)
end

function var_0_0.SetLocalPosition(arg_22_0, arg_22_1)
	arg_22_0.transform_.localPosition = arg_22_1
end

function var_0_0.GetLocalPosition(arg_23_0)
	return arg_23_0.transform_.localPosition + arg_23_0.parent_.transform.localPosition
end

function var_0_0.Show(arg_24_0, arg_24_1)
	if arg_24_1 == false then
		arg_24_0.tempVector3_.x = 1000000000000
		arg_24_0.tempVector3_.y = 1000000000000
		arg_24_0.tempVector3_.z = 1000000000000

		arg_24_0:SetLocalPosition(arg_24_0.tempVector3_)
	else
		SetActive(arg_24_0.gameObject_, arg_24_1)
	end
end

function var_0_0.Hide(arg_25_0, arg_25_1)
	arg_25_1 = arg_25_1 and ChapterTools.HasChapterStage(arg_25_0.chapterClientID_)

	SetActive(arg_25_0.gameObject_, arg_25_1)

	if arg_25_1 then
		arg_25_0:PlayAnimate()
	end
end

function var_0_0.Scale(arg_26_0, arg_26_1)
	arg_26_0.tempVector3_.x = arg_26_1
	arg_26_0.tempVector3_.y = arg_26_1
	arg_26_0.tempVector3_.z = 1
	arg_26_0.transform_.localScale = arg_26_0.tempVector3_
end

function var_0_0.SetAlpha(arg_27_0, arg_27_1)
	return
end

function var_0_0.StopTimer(arg_28_0)
	if arg_28_0.timer_ then
		arg_28_0.timer_:Stop()

		arg_28_0.timer_ = nil
	end
end

function var_0_0.AddUpdate(arg_29_0)
	arg_29_0:StopTimer()
	arg_29_0:CalcScale()

	arg_29_0.timer_ = FrameTimer.New(function()
		arg_29_0:CalcScale()
	end, 1, -1)

	arg_29_0.timer_:Start()
end

function var_0_0.CalcScale(arg_31_0)
	local var_31_0 = arg_31_0:GetLocalPosition()
	local var_31_1 = math.abs(var_31_0.x - arg_31_0.width_)

	if var_31_1 < arg_31_0.width_ * 2 then
		arg_31_0:Scale(1 - var_31_1 / (arg_31_0.width_ * 10))
	end
end

function var_0_0.SetSelectID(arg_32_0, arg_32_1)
	if arg_32_0.chapterClientID_ == arg_32_1 then
		arg_32_0.selectController_:SetSelectedState("select")
		arg_32_0:PlayAnimate()
	else
		arg_32_0.selectController_:SetSelectedState("normal")
	end
end

function var_0_0.GetChapterClientID(arg_33_0)
	return arg_33_0.chapterClientID_
end

function var_0_0.IsLock(arg_34_0)
	return arg_34_0.isLock_
end

function var_0_0.AddActivityTimer(arg_35_0)
	arg_35_0:RemoveActivityTimer()

	local var_35_0 = arg_35_0.chapterClientID_
	local var_35_1 = ChapterClientCfg[var_35_0].chapter_list[1]
	local var_35_2 = ChapterCfg[var_35_1].activity_id

	if var_35_2 == 0 then
		return
	end

	local var_35_3 = ActivityData:GetActivityData(var_35_2):IsActivitying()

	arg_35_0.activityTimer_ = Timer.New(function()
		local var_36_0 = ActivityData:GetActivityData(var_35_2):IsActivitying()

		if var_36_0 ~= var_35_3 then
			var_35_3 = var_36_0
			arg_35_0.isLock_ = not ChapterTools.IsFinishPreChapter(var_35_1)

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

return var_0_0
