local var_0_0 = partialClass("MainHomeView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/System/Main/HomeUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:InitUI()
	arg_3_0:AddUIListeners()
end

function var_0_0.InitUI(arg_4_0)
	arg_4_0:BindCfgUI()

	arg_4_0.page_ = {}
	arg_4_0.clickCount_ = 0
	arg_4_0.muteAudioHandler_ = handler(arg_4_0, arg_4_0.MuteAudio)
	arg_4_0.shakingAniHandler_ = handler(arg_4_0, arg_4_0.ShakingAni)
	arg_4_0.bannerView_ = BannerView.New(arg_4_0, arg_4_0.btnActivityGo_)
	arg_4_0.activityEntraceView_ = ActivityEntraceView.New(arg_4_0.activityListGo_)
	arg_4_0.skinDrawEntraceView_ = ActivitySkinDrawEntraceView.New(arg_4_0.skinDrawGo_)
	arg_4_0.socializeCon_ = arg_4_0.conExCollection_:GetController("socialize")
	arg_4_0.hideCon_ = arg_4_0.conExCollection_:GetController("hide")
	arg_4_0.sceneCon_ = arg_4_0.conExCollection_:GetController("scene")
	arg_4_0.skinDrawCon_ = arg_4_0.conExCollection_:GetController("skinDraw")
	arg_4_0.drawLockCon_ = arg_4_0.conExCollection_:GetController("drawLocked")
	arg_4_0.dormLockCon_ = arg_4_0.conExCollection_:GetController("dormLocked")
	arg_4_0.guildCon_ = arg_4_0.conExCollection_:GetController("guildLocked")
	arg_4_0.shopCon_ = arg_4_0.conExCollection_:GetController("shopLocked")
	arg_4_0.textLimit_ = arg_4_0.chatTxt_.gameObject:GetComponent("TextExtension")
	arg_4_0.mutiTouchHelper_ = arg_4_0.btn_girl.gameObject:GetComponent("MutiTouchHelper")

	arg_4_0:SwitchPosterGirlPanel(false)
	SetActive(arg_4_0.talkBubbleGo_, false)
end

function var_0_0.AddUIListeners(arg_5_0)
	arg_5_0:AddMiddlePanelUILisener()
	arg_5_0:AddLeftPanelUIListener()
	arg_5_0:AddRightPanelUIListener()
	arg_5_0:AddUIListenersHome()
end

function var_0_0.InitBar(arg_6_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR,
		INFO_BAR
	})
	manager.windowBar:SwitchBar({
		CurrencyConst.CURRENCY_TYPE_VITALITY,
		CurrencyConst.CURRENCY_TYPE_GOLD,
		CurrencyConst.CURRENCY_TYPE_DIAMOND,
		CurrencyConst.GetPlatformDiamondId()
	})
	manager.windowBar:SetBarCanAdd(CurrencyConst.CURRENCY_TYPE_VITALITY, true)
	manager.windowBar:SetBarCanAdd(CurrencyConst.CURRENCY_TYPE_GOLD, true)
	manager.windowBar:SetBarCanAdd(CurrencyConst.CURRENCY_TYPE_DIAMOND, true)
	manager.windowBar:SetBarCanAdd(CurrencyConst.GetPlatformDiamondId(), true)
end

function var_0_0.OnEnter(arg_7_0)
	arg_7_0:RegistEventListener(HOME_POSTER_TALK, handler(arg_7_0, arg_7_0.OnHomePosterTalk))
	manager.ui:ShowBackground(false)
	arg_7_0:CheckHomeSceneInteration(true)
	arg_7_0:ClearHeroFilter()
end

function var_0_0.OnTop(arg_8_0)
	if not arg_8_0.wait_posetr_debut then
		arg_8_0:OnTopFunc()
	end

	arg_8_0:ClearHeroFilter()
end

function var_0_0.OnTopFunc(arg_9_0)
	arg_9_0:InitBar()
	RedPointAction.UpdateSDKRedPoint()
	arg_9_0:CheckNeedPopWindow()
end

function var_0_0.OnExit(arg_10_0)
	arg_10_0.updateBgm_ = nil
	arg_10_0.wait_posetr_debut = false

	manager.posterGirl:SetViewTag(PosterGirlConst.ViewTag.null)
	manager.loadScene:StopSceneSoundEffect()
	manager.notify:RemoveListener(MUTE_MAIN_AUDIO, arg_10_0.muteAudioHandler_)
	manager.notify:RemoveListener(SHAKING_MOBILE, arg_10_0.shakingAniHandler_)
	arg_10_0:RemoveAllEventListener()
	manager.windowBar:HideBar()
	manager.ui:ResetMainCamera()
	arg_10_0:MuteAudio()

	for iter_10_0, iter_10_1 in pairs(arg_10_0.page_) do
		iter_10_1:OnExit()
	end

	arg_10_0.activityEntraceView_:OnExit()
	arg_10_0.skinDrawEntraceView_:OnExit()

	if not JumpTools.IsSystemLocked(ViewConst.SYSTEM_ID.CHAT) then
		ChatAction.EnterChatUI(2)
	end

	SetActive(arg_10_0.btn_girl.gameObject, false)

	arg_10_0.skinId_ = nil

	ItemTools.StopRefreshLimitRed()
	arg_10_0:StopAllTimers()

	arg_10_0.isHeroGiftOpen_ = nil
	arg_10_0.params_.changePoster = nil

	AnimatorTools.Stop()
	arg_10_0:UnBindRedPointUI()

	arg_10_0.talking_ = false
end

function var_0_0.Dispose(arg_11_0)
	arg_11_0.muteAudioHandler_ = nil

	arg_11_0.activityEntraceView_:Dispose()

	arg_11_0.activityEntraceView_ = nil

	arg_11_0.skinDrawEntraceView_:Dispose()

	arg_11_0.skinDrawEntraceView_ = nil

	for iter_11_0, iter_11_1 in pairs(arg_11_0.page_) do
		iter_11_1:Dispose()
	end

	arg_11_0.page_ = nil

	arg_11_0:RemoveAllListeners()

	if arg_11_0.bannerView_ then
		arg_11_0.bannerView_:Dispose()

		arg_11_0.bannerView_ = nil
	end

	if arg_11_0.hideChangeBtnDelayTimer_ then
		arg_11_0.hideChangeBtnDelayTimer_:Stop()

		arg_11_0.hideChangeBtnDelayTimer_ = nil
	end

	arg_11_0:RemovePosterTween()
	var_0_0.super.Dispose(arg_11_0)
end

function var_0_0.OnEnterFunc(arg_12_0)
	arg_12_0:CheckIsNeedOpenWebPage()
	arg_12_0:UpdateFollowGiftRedPoint()
	SurveyAction.UpdateSurveyRedPoint()
	ReduxFactory.GetInstance():OnMainHomeViewTop()
	arg_12_0:RefreshPage()
	arg_12_0:RefreshUserInfo()
	ItemTools.RefreshLimitRed()
	arg_12_0:RefreshBanner()
	arg_12_0:RefreshRealtimeUI()
	arg_12_0:StartRefreshUITimer()
	arg_12_0:UpdataOperationViewRedPoint()
	arg_12_0:BindRedPointUI()
	arg_12_0:RegistEventListener(PASSPORT_INIT, function()
		arg_12_0:CheckPassportBtn()
	end)
	arg_12_0:CheckPassportBtn()
	arg_12_0:UpdateChipRedPoint()
	arg_12_0:UpdateFriendsRedPoint()
	SetActive(arg_12_0.skinDrawRedPanel_, not JumpTools.IsSystemLocked(ViewConst.SYSTEM_ID.SKIN_DRAW))
	arg_12_0:RefreshChat()

	local var_12_0 = not JumpTools.IsConditionLocked({
		2,
		GameSetting.newbie_unlock_level_id.value[1]
	}) and not ActivityNewbieTools.IsFinishAllActivity()

	SetActive(arg_12_0.goNewbie_, var_12_0)

	local var_12_1, var_12_2 = ActivityNewbieTools.CheckAdvanceTaskOpen()

	SetActive(arg_12_0.btn_newbie_task.gameObject, var_12_1)

	if var_12_1 then
		local var_12_3 = ActivityNewbieTools.GetAdvanceTaskCfg(var_12_2)

		arg_12_0.newbieAdvanceTaskTitle_.text = GetTips(NoobVersionCfg[var_12_3.versionID].noob_advance_task_title[var_12_3.index])
	end

	local var_12_4 = RegressionData:IsRegressionOpen()

	SetActive(arg_12_0.btn_regression.gameObject, var_12_4)

	local var_12_5 = ActivityData:GetActivityIsOpen(ActivityConst.ACTIVITY_NEW_SERVER)
	local var_12_6 = JumpTools.IsConditionLocked(NewServerCfg[ActivityConst.ACTIVITY_NEW_SERVER].open_condition[1]) == false

	SetActive(arg_12_0.btn_newServer.gameObject, var_12_5 and var_12_6)
	arg_12_0:CheckLocked()
	arg_12_0:CheckActivite()
	arg_12_0.activityEntraceView_:OnEnter()
	arg_12_0.skinDrawEntraceView_:OnEnter()
	BulletinData.SetIslogin(true)
	manager.rollTips:TryToCreatTips()
	manager.notify:RegistListener(MUTE_MAIN_AUDIO, arg_12_0.muteAudioHandler_)
	manager.notify:RegistListener(SHAKING_MOBILE, arg_12_0.shakingAniHandler_)
	arg_12_0:RefreshHide()
end

local var_0_1 = {
	Sign = {
		"sign",
		{
			check = true,
			activityID = ActivityConst.SIGN
		},
		ViewConst.SYSTEM_ID.SIGN
	},
	Praise = {
		"praise"
	},
	ActivityAdvertise = {
		"activityAdvertise"
	},
	ChatMuted = {
		"chatMuted"
	},
	RegressionNewGift = {
		"regressionNewGift"
	}
}

local function var_0_2(arg_14_0, arg_14_1, arg_14_2)
	if arg_14_2 then
		table.insert(arg_14_0, arg_14_1)
	end

	return arg_14_2
end

local function var_0_3(arg_15_0)
	return function()
		JumpTools.OpenPageByJump(unpack(arg_15_0))
	end
end

function var_0_0.CheckWeakGuide(arg_17_0)
	return
end

function var_0_0.GetSpecialCom(arg_18_0, arg_18_1)
	local var_18_0 = string.sub(arg_18_1[1], 3)
	local var_18_1 = arg_18_1[2]

	if var_18_0 == "activityEntraceView_" then
		local var_18_2 = arg_18_0.activityEntraceView_.itemUiList_:GetItemByIndex(var_18_1)

		if var_18_2 then
			return var_18_2.gameObject_
		end
	end
end

function var_0_0.CheckNeedPopWindow(arg_19_0)
	if manager.guide:IsPlaying() then
		SetActive(arg_19_0.mask_, false)

		return
	end

	local var_19_0 = SignTools.IsCanSign()
	local var_19_1 = RechargeData:HaveMonthCard() and not RechargeData:IsSignToday()
	local var_19_2 = ActivityBigMonthCardToggle:Check()
	local var_19_3 = var_19_0
	local var_19_4 = SurveyData:GetPraise()
	local var_19_5 = ChatData:IsMuted() and not ChatData:GetShowMutedTips()
	local var_19_6 = RegressionData:CheckRegressionGift()
	local var_19_7 = ActivityAdvertiseTools.NeedShowAdvertise()
	local var_19_8 = BulletinData.CheckDailyLoginPopBulletin()
	local var_19_9, var_19_10, var_19_11 = ArchiveTools.NeedShowArchivePop()
	local var_19_12, var_19_13, var_19_14 = HomeSceneSettingData:IsNeedSceenCheck()
	local var_19_15 = not LuaHidTools.HasSetRemapNotice()

	if var_19_3 or var_19_4 or var_19_6 or var_19_5 or var_19_7 or var_19_9 or var_19_12 or var_19_15 then
		SetActive(arg_19_0.mask_, true)
	else
		SetActive(arg_19_0.mask_, false)
		arg_19_0:RealCheckWeakGuide()
	end

	if arg_19_0.needToPlayTalk_ and not var_19_3 and not var_19_4 and not var_19_2 then
		arg_19_0:PlayHeroGreeting()

		arg_19_0.needToPlayTalk_ = false
	end

	if arg_19_0.params_.isFirstCheck then
		if var_19_3 or var_19_4 or var_19_2 then
			arg_19_0.needToPlayTalk_ = true
		else
			arg_19_0:PlayHeroGreeting()
		end

		arg_19_0.params_.isFirstCheck = false
	end

	local var_19_16 = {}

	if not var_0_2(var_19_16, var_0_3(var_0_1.Sign), var_19_1 or var_19_2 or var_19_3) and not var_0_2(var_19_16, var_0_3(var_0_1.Praise), var_19_4) and not var_0_2(var_19_16, var_0_3(var_0_1.ActivityAdvertise), var_19_7) and not var_0_2(var_19_16, var_0_3({
		"bulletin",
		{
			bulletinID = var_19_8
		},
		ViewConst.SYSTEM_ID.ANNOUNCEMENT
	}), var_19_8) and not var_0_2(var_19_16, var_0_3(var_0_1.ChatMuted), var_19_5) and not var_0_2(var_19_16, var_0_3(var_0_1.RegressionNewGift), var_19_6) and not var_0_2(var_19_16, var_0_3({
		"archiveHomePop",
		{
			heroID = var_19_10,
			type = var_19_11
		}
	}), var_19_9) and not var_0_2(var_19_16, var_0_3({
		"homeChangeScenePop",
		{
			left = var_19_13,
			right = var_19_14
		}
	}), var_19_12) then
		local var_19_17 = var_0_2(var_19_16, LuaHidTools.QueryRemapNotice, var_19_15)
	end

	arg_19_0:StartShowTimer(var_19_16)
end

function var_0_0.RemovePosterTween(arg_20_0)
	if arg_20_0.posterTween_ then
		arg_20_0.posterTween_:setOnComplete(nil):setOnUpdate(nil):setEase(nil)
		LeanTween.cancel(arg_20_0.posterTween_.id)

		arg_20_0.posterTween_ = nil
	end
end

function var_0_0.HideTimeline(arg_21_0)
	if arg_21_0.timelines_ then
		local var_21_0 = arg_21_0.timelines_:GetComponentsInChildren(typeof(UnityEngine.Transform), true)

		for iter_21_0, iter_21_1 in pairs(var_21_0:ToTable()) do
			if iter_21_1.name ~= arg_21_0.timelines_.name then
				SetActive(iter_21_1.gameObject, false)
			end
		end
	end
end

function var_0_0.OnClickBg(arg_22_0)
	if arg_22_0.isHide_ then
		arg_22_0:StartViewHideTimer()
	end
end

function var_0_0.OnHomeSignUpdate(arg_23_0)
	arg_23_0:CheckNeedPopWindow()
end

function var_0_0.OnChangeNickname(arg_24_0, arg_24_1)
	arg_24_0.name_.text = GetI18NText(arg_24_1.nick)
end

function var_0_0.OnHeroGiftReward(arg_25_0)
	arg_25_0:CheckHeroGiftActivite()
end

function var_0_0.ShowPosterGirlBtn(arg_26_0)
	arg_26_0:SwitchPosterGirlPanel(true)

	if arg_26_0.hideChangeBtnDelayTimer_ ~= nil then
		arg_26_0.hideChangeBtnDelayTimer_:Reset()
	else
		arg_26_0.hideChangeBtnDelayTimer_ = Timer.New(handler(arg_26_0, arg_26_0.HidePosterGirlBtn), 3, 1)

		arg_26_0.hideChangeBtnDelayTimer_:Start()
	end
end

function var_0_0.HidePosterGirlBtn(arg_27_0)
	arg_27_0:SwitchPosterGirlPanel(false)

	if arg_27_0.hideChangeBtnDelayTimer_ ~= nil then
		arg_27_0.hideChangeBtnDelayTimer_:Stop()

		arg_27_0.hideChangeBtnDelayTimer_ = nil
	end
end

function var_0_0.SwitchPosterGirlPanel(arg_28_0, arg_28_1)
	SetActive(arg_28_0.changeGirlBtn, arg_28_1)
	SetActive(arg_28_0.changeSkinBtn, arg_28_1)
	SetActive(arg_28_0.btn_giftGo_, arg_28_1)

	local var_28_0 = false
	local var_28_1 = false

	if arg_28_1 then
		local var_28_2 = HeroTools.HeroUsingSkinInfo(arg_28_0.posterGirl_).id
		local var_28_3 = SkinSceneActionCfg[var_28_2]

		if var_28_3 and HomeSceneSettingData:GetUsedState(var_28_3.special_scene_id) ~= SceneConst.HOME_SCENE_TYPE.LOCK and HomeSceneSettingCfg[var_28_3.special_scene_id].limit_display ~= 1 then
			SetActive(arg_28_0.btn_DlcGo_, true)
		else
			SetActive(arg_28_0.btn_DlcGo_, false)
		end

		local var_28_4 = manager.posterGirl:GetViewDirect()
		local var_28_5 = HomeSceneSettingData:GetCurScene()

		if PosterGirlTools.IsSkinSceneTzeroMode(var_28_2, var_28_5) and var_28_4 == PosterGirlConst.ViewDirect.center then
			SetActive(arg_28_0.btn_infoGo_, true)
		else
			SetActive(arg_28_0.btn_infoGo_, false)
		end

		var_28_0 = PosterGirlTools.HasTimeEffect(var_28_2, var_28_5)
		var_28_1 = PosterGirlTools.HasWeatherEffect(var_28_2, var_28_5)
	else
		SetActive(arg_28_0.btn_infoGo_, false)
		SetActive(arg_28_0.btn_DlcGo_, false)
	end

	SetActive(arg_28_0.timeSwitchBtn_.gameObject, var_28_0)
	SetActive(arg_28_0.weatherSwitchBtn_.gameObject, var_28_1)
end

function var_0_0.MuteAudio(arg_29_0)
	HeroTools.StopTalk()

	if arg_29_0.multiTouchTimer_ ~= nil then
		arg_29_0.multiTouchTimer_:Stop()

		arg_29_0.multiTouchTimer_ = nil
	end

	SetActive(arg_29_0.talkBubbleGo_, false)

	arg_29_0.talking_ = false
end

function var_0_0.ShakingAni(arg_30_0)
	manager.posterGirl:DoShacking()
end

function var_0_0.OnHomeSceneChange(arg_31_0, arg_31_1, arg_31_2)
	manager.transition:OnlyShowEffect(true, function()
		manager.loadScene:ForceSetShouldLoadSceneName("home", function()
			if arg_31_0.OnlyShowEffectExiting_ then
				return
			end

			arg_31_0:MuteAudio()
			arg_31_0:SetCamera()
			manager.posterGirl:RefreshModel()
			manager.posterGirl:InitTouchHelp(arg_31_0.mutiTouchHelper_)

			if manager.posterGirl:CheckDebut() then
				manager.windowBar:SwitchBar({})
				arg_31_0.sceneCon_:SetSelectedState("off")
			end

			arg_31_0:HidePosterGirlBtn()

			arg_31_0.OnlyShowEffectExiting_ = true

			manager.transition:OnlyShowEffect(false)

			arg_31_0.OnlyShowEffectExiting_ = false

			if arg_31_0.updateBgm_ then
				PlayGameSetBGM()

				arg_31_0.updateBgm_ = nil
			end
		end)
	end)
end

function var_0_0.SetCamera(arg_34_0)
	local var_34_0 = HomeSceneSettingData:GetCurScene()
	local var_34_1 = "home_" .. var_34_0

	if CameraCfg[var_34_1] then
		manager.ui:SetMainCamera(var_34_1)
	else
		manager.ui:SetMainCamera("home")
	end
end

function var_0_0.CheckIsNeedPlayShowingAni(arg_35_0)
	local var_35_0 = false

	if arg_35_0.params_.changePoster then
		arg_35_0.params_.changePoster = nil

		if not arg_35_0.assistantVoiceTime_ or Time.realtimeSinceStartup - arg_35_0.assistantVoiceTime_ >= HeroConst.SET_ASSISTANT_VOICE_CD then
			arg_35_0.assistantVoiceTime_ = Time.realtimeSinceStartup

			manager.posterGirl:DoShowing()

			local var_35_1 = true
		end
	end
end

function var_0_0.CheckHomeSceneInteration(arg_36_0)
	manager.windowBar:ClearWhereTag()
	arg_36_0:SetCamera()

	arg_36_0.isHide_ = false
	arg_36_0.userData_ = PlayerData:GetPlayerInfo()
	arg_36_0.posterGirl_ = PlayerData:GetPosterGirlHeroId()
	arg_36_0.skinId_ = HeroTools.HeroUsingSkinInfo(arg_36_0.posterGirl_).id

	manager.posterGirl:SetViewTag(PosterGirlConst.ViewTag.home)
	manager.posterGirl:InitTouchHelp(arg_36_0.mutiTouchHelper_)

	if not manager.guide:IsPlaying() and manager.posterGirl:CheckDebut() then
		arg_36_0.wait_posetr_debut = true

		manager.windowBar:SwitchBar({})
		arg_36_0.sceneCon_:SetSelectedState("off")
	else
		arg_36_0.sceneCon_:SetSelectedState("on")
		arg_36_0:OnEnterFunc()
		arg_36_0:CheckIsNeedPlayShowingAni()
	end

	manager.loadScene:SetHomeSceneSoundEffect()
end

function var_0_0.OnHomeDebutOver(arg_37_0)
	if arg_37_0.wait_posetr_debut then
		arg_37_0:OnEnterFunc()
		arg_37_0:OnTopFunc()
	end

	arg_37_0:InitBar()
	arg_37_0.sceneCon_:SetSelectedState("on")

	arg_37_0.wait_posetr_debut = false
end

function var_0_0.PlayHeroGreeting(arg_38_0)
	manager.posterGirl:DoGreeting()
end

function var_0_0.DelayToPlayMultiTouchInteraction(arg_39_0)
	arg_39_0.clickCount_ = arg_39_0.clickCount_ + 1

	if arg_39_0.multiTouchTimer_ == nil then
		arg_39_0.multiTouchTimer_ = Timer.New(function()
			if arg_39_0.multiTouchTimer_ then
				arg_39_0.multiTouchTimer_:Stop()

				arg_39_0.multiTouchTimer_ = nil
			end

			local var_40_0 = HomeSceneSettingData:GetCurScene()

			if arg_39_0.clickCount_ >= 3 then
				SDKTools.SendMessageToSDK("poster_touch", {
					touch_times = 3,
					position = 0,
					hero_id = arg_39_0.skinId_,
					scene_id = var_40_0
				})
				manager.posterGirl:DoQuickTouch()
			else
				SDKTools.SendMessageToSDK("poster_touch", {
					touch_times = 1,
					position = 0,
					hero_id = arg_39_0.skinId_,
					scene_id = var_40_0
				})
				manager.posterGirl:DoTouch()
			end

			arg_39_0.clickCount_ = 0
		end, 0.5, 1)

		arg_39_0.multiTouchTimer_:Start()
	end
end

function var_0_0.OnHomePosterTalk(arg_41_0, arg_41_1, arg_41_2, arg_41_3)
	local var_41_0 = tonumber(arg_41_1)
	local var_41_1 = HeroVoiceDescCfg.Get(var_41_0, arg_41_2[1])

	if var_41_1 then
		arg_41_0.talking_ = true

		if not isNil(arg_41_0.talkBubbleGo_) then
			arg_41_0:RefreshTalkBubbleHide()
		end

		if not isNil(arg_41_0.talkLabel_) then
			arg_41_0.talkLabel_.text = var_41_1
		end

		if arg_41_0.talkBubbleTimer_ ~= nil then
			arg_41_0.talkBubbleTimer_:Stop()

			arg_41_0.talkBubbleTimer_ = nil
		end

		arg_41_0.talkBubbleTimer_ = TimeTools.StartAfterSeconds(arg_41_3 / 1000, function()
			arg_41_0.talking_ = false

			if not isNil(arg_41_0.talkBubbleGo_) then
				SetActive(arg_41_0.talkBubbleGo_, false)
			end

			if arg_41_0.talkBubbleTimer_ ~= nil then
				arg_41_0.talkBubbleTimer_:Stop()

				arg_41_0.talkBubbleTimer_ = nil
			end
		end, {})
	end
end

function var_0_0.ClearHeroFilter(arg_43_0)
	HeroData:SetupHeroMainOpenStatus(false)
	CommonFilterData:ClearFilter(Filter_Root_Define.Hero_Filter_List.filter_id)
end

return var_0_0
