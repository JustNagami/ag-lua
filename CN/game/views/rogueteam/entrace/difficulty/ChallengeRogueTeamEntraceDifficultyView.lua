local var_0_0 = class("ChallengeRogueTeamEntraceDifficultyView", ReduxView)

var_0_0.SCALE_VALUE = 0.95
var_0_0.ELLIPSE_A = 1000
var_0_0.ELLIPSE_B = 400
var_0_0.ELLIPSE_SQUARE_A = var_0_0.ELLIPSE_A * var_0_0.ELLIPSE_A
var_0_0.ELLIPSE_SQUARE_B = var_0_0.ELLIPSE_B * var_0_0.ELLIPSE_B

function var_0_0.UIName(arg_1_0)
	return "Widget/System/Activity_Roulike/RoulikSelectUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:BindCfgUI()
	arg_3_0:AddListeners()

	arg_3_0.selectDifficultyHandler_ = handler(arg_3_0, arg_3_0.OnSelectDifficulty)
	arg_3_0.onClickAffixHandler_ = handler(arg_3_0, arg_3_0.OnClickAffix)
	arg_3_0.itemList_ = {}
	arg_3_0.tempVector3_ = Vector3(0, 0, 0)

	local var_3_0 = arg_3_0.ringTf_.localEulerAngles

	arg_3_0.tempEulerAngles_ = Vector3(var_3_0.x, var_3_0.y, var_3_0.z)
	arg_3_0.rogueTeamSureBtnView_ = ChallengeRogueTeamButton.New(arg_3_0.sureBtnGo_, handler(arg_3_0, arg_3_0.OnClickBtn))
	arg_3_0.affixPopView_ = ChallengeRogueTeamEntranceAffixPopView.New(arg_3_0.tipsGo_)
end

function var_0_0.OnEnter(arg_4_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR
	})
	manager.notify:RegistListener(CHALLENGE_ROGUE_TEAM_DIFFICULTY_SELECT, arg_4_0.selectDifficultyHandler_)
	manager.notify:RegistListener(CHALLENGE_ROGUE_TEAM_DIFFICULTY_AFFIX_CLICK, arg_4_0.onClickAffixHandler_)

	local var_4_0 = ChallengeRogueTeamData:GetCacheTemplateID()
	local var_4_1 = ChallengeRogueTeamData:GetUIDifficultyID()
	local var_4_2 = ChallengeRogueTeamData:GetSelectDifficultyID(var_4_0)

	if var_4_1 ~= 0 then
		arg_4_0.selectDifficultyID_ = var_4_1
	elseif var_4_2 ~= 0 then
		arg_4_0.selectDifficultyID_ = var_4_2
	else
		arg_4_0.selectDifficultyID_ = ChallengeRogueTeamTools.GetMaxDifficultyID()
	end

	arg_4_0.lastAnglesX_ = arg_4_0.ringTf_.localEulerAngles.x

	if arg_4_0.params_.isBack then
		arg_4_0.isFirstEnter_ = true
	end

	arg_4_0:RefreshUI()
	arg_4_0.eventTriggerListener_:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.BeginDrag, LuaHelper.EventTriggerAction1(handler(arg_4_0, arg_4_0.BeginDragFun)))
	arg_4_0.eventTriggerListener_:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.EndDrag, LuaHelper.EventTriggerAction1(handler(arg_4_0, arg_4_0.EndDragFun)))
	arg_4_0.eventTriggerListener_:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.Scroll, LuaHelper.EventTriggerAction1(handler(arg_4_0, arg_4_0.ScrollFunc)))
	arg_4_0.eventTriggerListener_:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.PointerDown, LuaHelper.EventTriggerAction1(handler(arg_4_0, arg_4_0.ClickScrollFunc)))
end

function var_0_0.OnExit(arg_5_0)
	arg_5_0.eventTriggerListener_:RemoveListenerType(UnityEngine.EventSystems.EventTriggerType.BeginDrag)
	arg_5_0.eventTriggerListener_:RemoveListenerType(UnityEngine.EventSystems.EventTriggerType.EndDrag)
	arg_5_0.eventTriggerListener_:RemoveListenerType(UnityEngine.EventSystems.EventTriggerType.Scroll)
	arg_5_0.eventTriggerListener_:RemoveListenerType(UnityEngine.EventSystems.EventTriggerType.PointerDown)
	manager.notify:RemoveListener(CHALLENGE_ROGUE_TEAM_DIFFICULTY_SELECT, arg_5_0.selectDifficultyHandler_)
	manager.notify:RemoveListener(CHALLENGE_ROGUE_TEAM_DIFFICULTY_AFFIX_CLICK, arg_5_0.onClickAffixHandler_)
	manager.windowBar:HideBar()
end

function var_0_0.Dispose(arg_6_0)
	arg_6_0.rogueTeamSureBtnView_:Dispose()

	arg_6_0.rogueTeamSureBtnView_ = nil
	arg_6_0.onClickAffixHandler_ = nil

	arg_6_0.affixPopView_:Dispose()

	arg_6_0.affixPopView_ = nil

	for iter_6_0, iter_6_1 in ipairs(arg_6_0.itemList_) do
		iter_6_1:Dispose()
	end

	arg_6_0.selectDifficultyHandler_ = nil
	arg_6_0.itemList_ = nil

	var_0_0.super.Dispose(arg_6_0)
end

function var_0_0.AddListeners(arg_7_0)
	arg_7_0:AddToggleListener(arg_7_0.scrollView_, function(arg_8_0)
		arg_7_0:RefreshItemPosition()
		arg_7_0:PlayAudio()
	end)
	arg_7_0:AddBtnListener(arg_7_0.closeBtn_, nil, function()
		arg_7_0.affixPopView_:Show(false)
	end)
end

function var_0_0.PlayAudio(arg_10_0)
	local var_10_0 = arg_10_0.ringTf_.localEulerAngles.x

	if math.abs(arg_10_0.lastAnglesX_ - var_10_0) > 5 then
		ChallengeRogueTeamTools.PlayAudio("node_select_audio_id")

		arg_10_0.lastAnglesX_ = var_10_0
	end
end

function var_0_0.OnClickBtn(arg_11_0)
	if not arg_11_0:GetSelectItem():GetIsUnlock() then
		return
	else
		ChallengeRogueTeamAction.SetUIDifficulty(arg_11_0.selectDifficultyID_)

		local var_11_0 = ReserveParams.New(ReserveConst.RESERVE_TYPE.CHALLENGE_ROGUE_TEAM, 0, 1, {
			stageType = BattleConst.STAGE_TYPE_NEW.CHALLENGE_ROGUE_TEAM
		})

		if manager.guide:IsPlaying() then
			local var_11_1 = GameSetting.rogue_team_guide_list.value

			ReserveTools.SetHeroList(var_11_0, var_11_1[1], var_11_1[2])
		end

		arg_11_0:Go("/challengeRogueTeamSectionSelectHero", {
			sectionType = BattleConst.STAGE_TYPE_NEW.CHALLENGE_ROGUE_TEAM,
			heroDataType = HeroConst.HERO_DATA_TYPE.CHALLENGEROUGETEAM,
			reserveParams = var_11_0
		})
	end
end

function var_0_0.RefreshUI(arg_12_0)
	local var_12_0 = ChallengeRogueTeamData:GetCacheTemplateID()
	local var_12_1 = RogueTeamCfg[var_12_0].difficulty_temp

	for iter_12_0, iter_12_1 in ipairs(RogueTeamDifficultyCfg.get_id_list_by_template_id[var_12_1]) do
		arg_12_0.itemList_[iter_12_0] = arg_12_0.itemList_[iter_12_0] or ChallengeRogueTeamEntraceDifficultyItem.New(arg_12_0.difficultyItem_, arg_12_0.difficultyParent_)

		arg_12_0.itemList_[iter_12_0]:SetDifficulty(iter_12_1)
	end

	arg_12_0:RefreshSelectDifficulty(arg_12_0.selectDifficultyID_)
	FrameTimer.New(function()
		arg_12_0:OverMoveAction()
		arg_12_0:RefreshItemPosition()
	end, 1, 1):Start()
end

function var_0_0.OnSelectDifficulty(arg_14_0, arg_14_1)
	if arg_14_0.isPopFlag_ then
		arg_14_0:HideAffixPop()

		return
	end

	arg_14_0.selectDifficultyID_ = arg_14_1

	arg_14_0:HideAffixPop()
	arg_14_0:RefreshSelectBtn()
	arg_14_0:Scroll2SelectItem()
end

function var_0_0.OnClickAffix(arg_15_0)
	if arg_15_0.isPopFlag_ then
		arg_15_0.affixPopView_:Show(false)
	else
		arg_15_0.affixPopView_:SetData(arg_15_0.selectDifficultyID_)
	end

	arg_15_0.isPopFlag_ = not arg_15_0.isPopFlag_
end

function var_0_0.HideAffixPop(arg_16_0)
	arg_16_0.isPopFlag_ = false

	arg_16_0.affixPopView_:Show(false)
end

function var_0_0.ClickScrollFunc(arg_17_0)
	if arg_17_0.isPopFlag_ then
		arg_17_0:HideAffixPop()
	end
end

function var_0_0.RefreshSelectDifficulty(arg_18_0, arg_18_1)
	arg_18_0.selectDifficultyID_ = arg_18_1

	for iter_18_0, iter_18_1 in ipairs(arg_18_0.itemList_) do
		iter_18_1:SetSelectDifficulty(arg_18_1)
	end

	arg_18_0:RefreshSelectBtn()
	arg_18_0:Scroll2SelectItem()
end

function var_0_0.RefreshSelectBtn(arg_19_0)
	if arg_19_0:GetSelectItem():GetIsUnlock() then
		arg_19_0.rogueTeamSureBtnView_:RefreshBtnState(ChallengeRogueTeamButton.ENABLE_CLICK)
	else
		arg_19_0.rogueTeamSureBtnView_:RefreshBtnState(ChallengeRogueTeamButton.DISENABLE_CLICK)
	end
end

function var_0_0.RefreshItemPosition(arg_20_0)
	for iter_20_0, iter_20_1 in ipairs(arg_20_0.itemList_) do
		local var_20_0 = iter_20_1:GetLocalPosition().y + arg_20_0.contentTf_.localPosition.y + arg_20_0.scrollTf_.rect.height / 2

		if var_20_0 > var_0_0.ELLIPSE_A then
			var_20_0 = var_0_0.ELLIPSE_A
		end

		if var_20_0 < var_0_0.ELLIPSE_A * -1 then
			var_20_0 = var_0_0.ELLIPSE_A * -1
		end

		local var_20_1 = 1 - math.abs((var_0_0.SCALE_VALUE - 1) / var_0_0.ELLIPSE_A * var_20_0)
		local var_20_2 = math.abs(var_0_0.ELLIPSE_SQUARE_B - var_0_0.ELLIPSE_SQUARE_B / var_0_0.ELLIPSE_SQUARE_A * var_20_0 * var_20_0)
		local var_20_3 = math.sqrt(var_20_2)
		local var_20_4 = math.sqrt(var_20_3 * var_20_3 + var_20_0 * var_20_0)
		local var_20_5 = math.acos(var_20_3 / var_20_4) / math.pi * 180
		local var_20_6 = var_20_3 - var_0_0.ELLIPSE_B

		iter_20_1:SetChildrenTransform(var_20_6 * -1, var_20_1, var_20_5)

		local var_20_7 = math.abs(arg_20_0.contentTf_.localPosition.y + iter_20_1:GetLocalPosition().y + arg_20_0.scrollTf_.rect.height / 2) <= 40

		iter_20_1:RefreshSelectState(var_20_7)
	end

	arg_20_0.tempEulerAngles_.x = arg_20_0.contentTf_.localPosition.y / 10
	arg_20_0.ringTf_.localEulerAngles = arg_20_0.tempEulerAngles_
end

function var_0_0.BeginDragFun(arg_21_0, arg_21_1, arg_21_2)
	arg_21_0:StopMoveTimer()
	arg_21_0:StopScrollTimer()
	arg_21_0.scrollView_:OnBeginDrag(arg_21_2)
	arg_21_0:HideAffixPop()
end

function var_0_0.EndDragFun(arg_22_0, arg_22_1, arg_22_2)
	arg_22_0.scrollView_:OnEndDrag(arg_22_2)
	arg_22_0:ContinueScrollTimer()
end

function var_0_0.ScrollFunc(arg_23_0, arg_23_1, arg_23_2)
	arg_23_0:BeginDragFun(arg_23_1, arg_23_2)
	arg_23_0:EndDragFun(arg_23_1, arg_23_2)
end

function var_0_0.StopScrollTimer(arg_24_0)
	if arg_24_0.scrollTimer_ then
		arg_24_0.scrollTimer_:Stop()

		arg_24_0.scrollTimer_ = nil
	end
end

function var_0_0.StopMoveTimer(arg_25_0)
	if arg_25_0.moveTimer_ then
		arg_25_0.moveTimer_:Stop()

		arg_25_0.moveTimer_ = nil
	end
end

function var_0_0.ContinueScrollTimer(arg_26_0)
	arg_26_0:StopScrollTimer()

	arg_26_0.scrollTimer_ = nil
	arg_26_0.scrollTimer_ = FrameTimer.New(function()
		if math.abs(arg_26_0.scrollView_.velocity.y) <= 100 then
			arg_26_0.scrollTimer_:Stop()
			arg_26_0:AdjustItem()
		end
	end, 1, -1)

	arg_26_0.scrollTimer_:Start()
end

function var_0_0.AdjustItem(arg_28_0)
	local var_28_0 = arg_28_0:GetNearestItem()

	arg_28_0:RefreshSelectDifficulty(var_28_0:GetDifficultyID())
end

function var_0_0.GetNearestItem(arg_29_0)
	local var_29_0 = 9999
	local var_29_1

	for iter_29_0, iter_29_1 in ipairs(arg_29_0.itemList_) do
		local var_29_2 = math.abs(arg_29_0.contentTf_.localPosition.y + iter_29_1:GetLocalPosition().y + arg_29_0.scrollTf_.rect.height / 2)

		if var_29_2 < var_29_0 then
			var_29_0 = var_29_2
			var_29_1 = iter_29_1
		end
	end

	return var_29_1
end

function var_0_0.Scroll2SelectItem(arg_30_0)
	for iter_30_0, iter_30_1 in ipairs(arg_30_0.itemList_) do
		if iter_30_1:GetDifficultyID() == arg_30_0.selectDifficultyID_ then
			arg_30_0:AddMoveTimer(iter_30_1)
		end
	end
end

function var_0_0.AddMoveTimer(arg_31_0, arg_31_1)
	arg_31_0:StopMoveTimer()

	local var_31_0 = arg_31_0.contentTf_.localPosition

	arg_31_0.moveTimer_ = FrameTimer.New(function()
		local var_32_0 = arg_31_0.contentTf_.localPosition
		local var_32_1 = arg_31_1:GetLocalPosition().y * -1 - arg_31_0.scrollTf_.rect.height / 2
		local var_32_2 = GameSetting.challenge_velocity_times.value[1] * math.pow(arg_31_0.scrollView_.decelerationRate, UnityEngine.Time.unscaledDeltaTime) * UnityEngine.Time.unscaledDeltaTime

		arg_31_0.tempVector3_.x = var_32_0.x
		arg_31_0.tempVector3_.y = var_32_1
		arg_31_0.tempVector3_.z = var_32_0.z

		local var_32_3 = Vector3.Lerp(var_32_0, arg_31_0.tempVector3_, var_32_2)
		local var_32_4 = GameSetting.challenge_scroll_min_length.value[1]

		if var_32_4 > math.abs(var_32_0.y - var_32_3.y) then
			local var_32_5 = var_32_1 - var_32_0.y

			if var_32_4 < math.abs(var_32_5) then
				var_32_5 = var_32_4 * var_32_5 / math.abs(var_32_5)
			end

			var_32_3.y = var_32_3.y + var_32_5
		end

		arg_31_0.contentTf_.localPosition = var_32_3

		if math.abs(arg_31_0.contentTf_.localPosition.y - var_32_1) <= GameSetting.challenge_stop_min_length.value[1] then
			arg_31_0.scrollView_:StopMovement()
			arg_31_0:StopMoveTimer()
			arg_31_0:OverMoveAction()
			arg_31_0:HideAffixPop()
		end
	end, 1, -1)

	arg_31_0.moveTimer_:Start()
end

function var_0_0.OverMoveAction(arg_33_0)
	local var_33_0 = arg_33_0.contentTf_.localPosition
	local var_33_1 = arg_33_0:GetSelectItem()

	arg_33_0.tempVector3_.x = var_33_0.x
	arg_33_0.tempVector3_.y = var_33_1:GetLocalPosition().y * -1 - arg_33_0.scrollTf_.rect.height / 2
	arg_33_0.tempVector3_.z = var_33_0.z
	arg_33_0.contentTf_.localPosition = arg_33_0.tempVector3_
	arg_33_0.lastAnglesX_ = arg_33_0.ringTf_.localEulerAngles.x
end

function var_0_0.GetSelectItem(arg_34_0)
	for iter_34_0, iter_34_1 in ipairs(arg_34_0.itemList_) do
		if iter_34_1:GetDifficultyID() == arg_34_0.selectDifficultyID_ then
			return iter_34_1
		end
	end

	return arg_34_0.itemList_[1]
end

return var_0_0
