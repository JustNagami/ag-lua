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

	arg_5_0.chapterPaint_.immediate = true
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
	arg_9_0.asset_pend_key = ChapterClientCfg[var_9_0].asset_pend_key
	arg_9_0.isAssetPendLock_ = not manager.assetPend:CheckAssetPend(arg_9_0.asset_pend_key)
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

		arg_11_0.chapterPaint_.spriteAsync = var_11_2
		arg_11_0.oldChapterClientID_ = var_11_0
	end
end

function var_0_0.RefreshLock(arg_12_0)
	local var_12_0 = ChapterClientCfg[arg_12_0.chapterClientID_]

	if var_12_0 then
		arg_12_0.asset_pend_key = var_12_0.asset_pend_key
		arg_12_0.isAssetPendLock_ = not manager.assetPend:CheckAssetPend(arg_12_0.asset_pend_key)
	end

	if arg_12_0.isLock_ then
		arg_12_0.lockController_:SetSelectedState("true")
	elseif arg_12_0.isAssetPendLock_ then
		arg_12_0.lockController_:SetSelectedState("assetpend")
	else
		arg_12_0.lockController_:SetSelectedState("false")
	end
end

function var_0_0.RefreshActivity(arg_13_0)
	local var_13_0 = ChapterClientCfg[arg_13_0.chapterClientID_].chapter_list[1]
	local var_13_1 = ChapterCfg[var_13_0]

	arg_13_0.activityController_:SetSelectedState(tostring(ActivityData:GetActivityIsOpen(var_13_1.activity_id)))
end

function var_0_0.RefreshHardLevel(arg_14_0)
	arg_14_0.chapterLevelText_.text = GetTips(BattleConst.HARD_LANGUAGE[arg_14_0.hardLevel_])
end

function var_0_0.RefreshCollect(arg_15_0)
	arg_15_0.collectText_.text = string.format("%s%%", math.floor(arg_15_0.collectRate_ * 100))
end

function var_0_0.PlayAnimate(arg_16_0)
	arg_16_0:AddUpdate()
	arg_16_0:StopTween()

	arg_16_0.collectProgress_.fillAmount = 0
	arg_16_0.tweenValue_ = LeanTween.value(arg_16_0.gameObject_, 0, arg_16_0.collectRate_, 0.5):setOnUpdate(LuaHelper.FloatAction(function(arg_17_0)
		arg_16_0.collectProgress_.fillAmount = arg_17_0
	end)):setOnComplete(LuaHelper.VoidAction(function()
		arg_16_0.tweenValue_:setOnUpdate(nil):setOnComplete(nil):setEase(nil)

		arg_16_0.tweenValue_ = nil
	end)):setEase(LeanTweenType.easeOutQuad):setDelay(0.2)
end

function var_0_0.StopTween(arg_19_0)
	if arg_19_0.tweenValue_ then
		arg_19_0.tweenValue_:setOnUpdate(nil):setOnComplete(nil):setEase(nil)
		LeanTween.cancel(arg_19_0.gameObject_)

		arg_19_0.tweenValue_ = nil
	end
end

function var_0_0.SetChapterClientID(arg_20_0, arg_20_1)
	if arg_20_0.chapterClientID_ then
		manager.redPoint:unbindUIandKey(arg_20_0.itemRect_, string.format("%s_%s", RedPointConst.COMBAT_PLOT, arg_20_0.chapterClientID_))
	end

	local var_20_0 = arg_20_0.chapterClientID_ == arg_20_1

	arg_20_0.chapterClientID_ = arg_20_1
	arg_20_0.transform_.name = arg_20_1

	manager.redPoint:bindUIandKey(arg_20_0.itemRect_, string.format("%s_%s", RedPointConst.COMBAT_PLOT, arg_20_0.chapterClientID_))
	arg_20_0:RefreshData()
	arg_20_0:RefreshUI()

	if not var_20_0 then
		arg_20_0:PlayAnimate()
	end

	arg_20_0:AddActivityTimer()
	arg_20_0:Show(true)
end

function var_0_0.SetLocalPosition(arg_21_0, arg_21_1)
	arg_21_0.transform_.localPosition = arg_21_1
end

function var_0_0.GetLocalPosition(arg_22_0)
	return arg_22_0.transform_.localPosition + arg_22_0.parent_.transform.localPosition
end

function var_0_0.Show(arg_23_0, arg_23_1)
	if arg_23_1 == false then
		arg_23_0.tempVector3_.x = 1000000000000
		arg_23_0.tempVector3_.y = 1000000000000
		arg_23_0.tempVector3_.z = 1000000000000

		arg_23_0:SetLocalPosition(arg_23_0.tempVector3_)
	else
		SetActive(arg_23_0.gameObject_, arg_23_1)
	end
end

function var_0_0.Hide(arg_24_0, arg_24_1)
	arg_24_1 = arg_24_1 and ChapterTools.HasChapterStage(arg_24_0.chapterClientID_)

	SetActive(arg_24_0.gameObject_, arg_24_1)

	if arg_24_1 then
		arg_24_0:PlayAnimate()
	end
end

function var_0_0.Scale(arg_25_0, arg_25_1)
	arg_25_0.tempVector3_.x = arg_25_1
	arg_25_0.tempVector3_.y = arg_25_1
	arg_25_0.tempVector3_.z = 1
	arg_25_0.transform_.localScale = arg_25_0.tempVector3_
end

function var_0_0.SetAlpha(arg_26_0, arg_26_1)
	return
end

function var_0_0.StopTimer(arg_27_0)
	if arg_27_0.timer_ then
		arg_27_0.timer_:Stop()

		arg_27_0.timer_ = nil
	end
end

function var_0_0.AddUpdate(arg_28_0)
	arg_28_0:StopTimer()
	arg_28_0:CalcScale()

	arg_28_0.timer_ = FrameTimer.New(function()
		arg_28_0:CalcScale()
	end, 1, -1)

	arg_28_0.timer_:Start()
end

function var_0_0.CalcScale(arg_30_0)
	local var_30_0 = arg_30_0:GetLocalPosition()
	local var_30_1 = math.abs(var_30_0.x - arg_30_0.width_)

	if var_30_1 < arg_30_0.width_ * 2 then
		arg_30_0:Scale(1 - var_30_1 / (arg_30_0.width_ * 10))
	end
end

function var_0_0.SetSelectID(arg_31_0, arg_31_1)
	if arg_31_0.chapterClientID_ == arg_31_1 then
		arg_31_0.selectController_:SetSelectedState("select")
		arg_31_0:PlayAnimate()
	else
		arg_31_0.selectController_:SetSelectedState("normal")
	end
end

function var_0_0.GetChapterClientID(arg_32_0)
	return arg_32_0.chapterClientID_
end

function var_0_0.IsLock(arg_33_0)
	return arg_33_0.isLock_
end

function var_0_0.AddActivityTimer(arg_34_0)
	arg_34_0:RemoveActivityTimer()

	local var_34_0 = arg_34_0.chapterClientID_
	local var_34_1 = ChapterClientCfg[var_34_0].chapter_list[1]
	local var_34_2 = ChapterCfg[var_34_1].activity_id

	if var_34_2 == 0 then
		return
	end

	local var_34_3 = ActivityData:GetActivityData(var_34_2):IsActivitying()

	arg_34_0.activityTimer_ = Timer.New(function()
		local var_35_0 = ActivityData:GetActivityData(var_34_2):IsActivitying()

		if var_35_0 ~= var_34_3 then
			var_34_3 = var_35_0
			arg_34_0.isLock_ = not ChapterTools.IsFinishPreChapter(var_34_1)

			arg_34_0:RefreshLock()
			arg_34_0:RefreshActivity()
		end
	end, 1, -1)

	arg_34_0.activityTimer_:Start()
end

function var_0_0.RemoveActivityTimer(arg_36_0)
	if arg_36_0.activityTimer_ then
		arg_36_0.activityTimer_:Stop()

		arg_36_0.activityTimer_ = nil
	end
end

return var_0_0
