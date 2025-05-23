﻿local var_0_0 = partialClass("MainHomeView", ReduxView)

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
	arg_4_0.skinDiscountGiftEntranceView_ = SkinDiscountGiftEntranceView.New(arg_4_0.skinDiscountGo_)
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
	arg_4_0.changedlcCon_ = arg_4_0.conExCollection_:GetController("changedlcView")
	arg_4_0.puremodeCon_ = arg_4_0.conExCollection_:GetController("puremode")
	arg_4_0.btn_zuoCon_ = arg_4_0.btn_zuo01Controllerexcollection_:GetController("zuo01")
	arg_4_0.btn_youCon_ = arg_4_0.btn_youControllerexcollection_:GetController("you01")

	arg_4_0:SwitchPosterGirlPanel(false)
	SetActive(arg_4_0.talkBubbleGo_, false)
	arg_4_0.puremodeCon_:SetSelectedState("hide")
	arg_4_0.changedlcCon_:SetSelectedState("hide")

	arg_4_0.longTimeNoOpCheckCom_ = arg_4_0.panelGo_:GetComponent("LongTimeNoOperation")
end

function var_0_0.AddUIListeners(arg_5_0)
	arg_5_0:AddMiddlePanelUILisener()
	arg_5_0:AddLeftPanelUIListener()
	arg_5_0:AddRightPanelUIListener()
	arg_5_0:AddUIListenersHome()
end

function var_0_0.OnEnter(arg_6_0)
	arg_6_0:RegistEventListener(HOME_POSTER_TALK, handler(arg_6_0, arg_6_0.OnHomePosterTalk))
	arg_6_0:RegistEventListener(PUREMODE_SHOW, handler(arg_6_0, arg_6_0.SetPureModeShow))
	arg_6_0:RegistEventListener(ON_POSTERGIRL_TRANSITION_END, handler(arg_6_0, arg_6_0.UpdatePosterGirlBtn))
	arg_6_0:RegistEventListener(HOME_BTN_VISIBE, handler(arg_6_0, arg_6_0.OnHomeBtnVisible))
	arg_6_0:RegistEventListener(ON_GAME_IN, function(arg_7_0)
		if arg_6_0:IsTop() then
			manager.posterGirl:EnterMiniGame(arg_7_0)
		end
	end)
	manager.ui:ShowBackground(false)
	arg_6_0:CheckHomeSceneInteration(true)
	arg_6_0:ClearHeroFilter()
	DormRedPointTools:RefreshIlluDanceNew()
end

function var_0_0.OnTop(arg_8_0)
	if not arg_8_0.wait_posetr_debut then
		arg_8_0:OnTopFunc()
	end

	arg_8_0:ClearHeroFilter()

	arg_8_0.longTimeNoOpCheckCom_.enabled = true
end

function var_0_0.OnTopFunc(arg_9_0)
	if arg_9_0.params_.isPureMode == true then
		arg_9_0.isPureMode_ = false

		arg_9_0:SetPureMode(false, true)
		arg_9_0:RecordPureModeLog(true, PureModeConst.EnterMode.mode5)
	else
		arg_9_0:InitBar()
		PlayerData:SetIsDeskMode(false)
		arg_9_0:SetPureMode(true)
	end

	RedPointAction.UpdateSDKRedPoint()

	arg_9_0.isDoActionEnd_ = arg_9_0:CheckNeedPopWindow()

	if arg_9_0.isDoActionEnd_ then
		arg_9_0.isBehind_ = false
	end

	arg_9_0:UpdateActivityLoginRedPoint()
end

function var_0_0.OnExit(arg_10_0)
	arg_10_0.updateBgm_ = nil
	arg_10_0.wait_posetr_debut = false

	PlayerData:SetPosterGirlDebut(false)
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
	arg_10_0.skinDiscountGiftEntranceView_:OnExit()

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

	arg_11_0.skinDiscountGiftEntranceView_:Dispose()

	arg_11_0.skinDiscountGiftEntranceView_ = nil

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
	arg_12_0:UpdateShopBtnTag()
	arg_12_0:RegistEventListener(PASSPORT_INIT, function()
		arg_12_0:CheckPassportBtn()
	end)
	arg_12_0:CheckPassportBtn()
	arg_12_0:UpdateChipRedPoint()
	arg_12_0:UpdateFriendsRedPoint()
	PosterGirlTools.UpdateDlCBtnRed()
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

	local var_12_4 = RegressionDataNew:IsRegressionOpen()

	SetActive(arg_12_0.btn_regression.gameObject, var_12_4)

	local var_12_5 = ActivityData:GetActivityIsOpen(ActivityConst.ACTIVITY_NEW_SERVER)
	local var_12_6 = JumpTools.IsConditionLocked(NewServerCfg[ActivityConst.ACTIVITY_NEW_SERVER].open_condition[1]) == false

	SetActive(arg_12_0.btn_newServer.gameObject, var_12_5 and var_12_6)
	arg_12_0:CheckLocked()
	arg_12_0:CheckActivite()
	arg_12_0.activityEntraceView_:OnEnter()
	arg_12_0.skinDrawEntraceView_:OnEnter()
	arg_12_0.skinDiscountGiftEntranceView_:OnEnter()
	BulletinData.SetIslogin(true)
	manager.rollTips:TryToCreatTips()
	manager.notify:RegistListener(MUTE_MAIN_AUDIO, arg_12_0.muteAudioHandler_)
	manager.notify:RegistListener(SHAKING_MOBILE, arg_12_0.shakingAniHandler_)
	arg_12_0:RefreshHide()
	arg_12_0:OnHomeBtnVisible(true)
	arg_12_0:UpdatePosterGirlBtn()

	if arg_12_0.params_.isHomeBack then
		arg_12_0.isPureMode_ = false

		PlayerData:SetIsDeskMode(false)

		arg_12_0.params_.isHomeBack = nil
	end

	if PlayerData:GetDeskMode() then
		arg_12_0.animator_:Play("HomeUI_hide2")
	end
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
	},
	Birthday = {
		"BirthdayPop"
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
	local var_19_6 = RegressionDataNew:CheckIsShowGift()
	local var_19_7 = ActivityAdvertiseTools.NeedShowAdvertise()
	local var_19_8 = BulletinData.CheckDailyLoginPopBulletin()
	local var_19_9, var_19_10, var_19_11 = ArchiveTools.NeedShowArchivePop()
	local var_19_12, var_19_13, var_19_14 = HomeSceneSettingData:IsNeedSceenCheck()
	local var_19_15 = not LuaHidTools.HasSetRemapNotice()
	local var_19_16 = BirthdayTools.IsShowBirthdayPop()

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

		manager.gc:Collect()
		Resources.UnloadUnusedAssets()

		arg_19_0.params_.isFirstCheck = false
	end

	local var_19_17 = {}

	if not var_0_2(var_19_17, var_0_3(var_0_1.Sign), var_19_1 or var_19_2 or var_19_3) and not var_0_2(var_19_17, var_0_3(var_0_1.Praise), var_19_4) and not var_0_2(var_19_17, var_0_3(var_0_1.ActivityAdvertise), var_19_7) and not var_0_2(var_19_17, var_0_3({
		"bulletin",
		{
			bulletinID = var_19_8
		},
		ViewConst.SYSTEM_ID.ANNOUNCEMENT
	}), var_19_8) and not var_0_2(var_19_17, var_0_3(var_0_1.ChatMuted), var_19_5) and not var_0_2(var_19_17, var_0_3(var_0_1.RegressionNewGift), var_19_6) and not var_0_2(var_19_17, var_0_3({
		"archiveHomePop",
		{
			heroID = var_19_10,
			type = var_19_11
		}
	}), var_19_9) and not var_0_2(var_19_17, var_0_3({
		"homeChangeScenePop",
		{
			left = var_19_13,
			right = var_19_14
		}
	}), var_19_12) and not var_0_2(var_19_17, LuaHidTools.QueryRemapNotice, var_19_15) then
		local var_19_18 = var_0_2(var_19_17, var_0_3(var_0_1.Birthday), var_19_16)
	end

	arg_19_0:StartShowTimer(var_19_17)

	return #var_19_17 <= 0
end

function var_0_0.UpdateActivityLoginRedPoint(arg_20_0)
	ActivityAutoCookAction.UpdateLoginRedPoint()
end

function var_0_0.RemovePosterTween(arg_21_0)
	if arg_21_0.posterTween_ then
		arg_21_0.posterTween_:setOnComplete(nil):setOnUpdate(nil):setEase(nil)
		LeanTween.cancel(arg_21_0.posterTween_.id)

		arg_21_0.posterTween_ = nil
	end
end

function var_0_0.HideTimeline(arg_22_0)
	if arg_22_0.timelines_ then
		local var_22_0 = arg_22_0.timelines_:GetComponentsInChildren(typeof(UnityEngine.Transform), true)

		for iter_22_0, iter_22_1 in pairs(var_22_0:ToTable()) do
			if iter_22_1.name ~= arg_22_0.timelines_.name then
				SetActive(iter_22_1.gameObject, false)
			end
		end
	end
end

function var_0_0.OnClickBg(arg_23_0, arg_23_1)
	if arg_23_0.isHide_ and arg_23_0:IsTop() then
		arg_23_0:StartViewHideTimer()
	end

	arg_23_0:OnTouchInteract(arg_23_1)
end

function var_0_0.OnTouchInteract(arg_24_0, arg_24_1)
	local var_24_0 = arg_24_0:AnySceneObjAcceptTouchInteract(arg_24_1)

	if isNil(var_24_0) then
		arg_24_0:DelayToPlayMultiTouchInteraction()
	else
		var_24_0:OnPointerDown(arg_24_1)
	end
end

function var_0_0.AnySceneObjAcceptTouchInteract(arg_25_0, arg_25_1)
	if manager.ui.mainCamera:GetComponent("PhysicsRaycaster") and arg_25_1 then
		local var_25_0 = arg_25_1.position
		local var_25_1 = UnityEngine.Camera.main:ScreenPointToRay(var_25_0)
		local var_25_2 = UnityEngine.Physics.RaycastAll(var_25_1)
		local var_25_3 = {}

		for iter_25_0 = 0, var_25_2.Length - 1 do
			table.insert(var_25_3, var_25_2[iter_25_0])
		end

		table.sort(var_25_3, function(arg_26_0, arg_26_1)
			return arg_26_0.distance < arg_26_1.distance
		end)

		for iter_25_1, iter_25_2 in ipairs(var_25_3) do
			local var_25_4 = iter_25_2.transform:GetComponent("EventTrigger")

			if var_25_4 then
				return var_25_4
			end
		end
	end

	return nil
end

function var_0_0.OnHomeSignUpdate(arg_27_0)
	arg_27_0:CheckNeedPopWindow()
end

function var_0_0.OnChangeNickname(arg_28_0, arg_28_1)
	arg_28_0.name_.text = GetI18NText(arg_28_1.nick)
end

function var_0_0.OnHeroGiftReward(arg_29_0)
	arg_29_0:CheckHeroGiftActivite()
end

function var_0_0.ShowPosterGirlBtn(arg_30_0)
	arg_30_0:SwitchPosterGirlPanel(true)

	if arg_30_0.hideChangeBtnDelayTimer_ ~= nil then
		arg_30_0.hideChangeBtnDelayTimer_:Reset()
	else
		arg_30_0.hideChangeBtnDelayTimer_ = Timer.New(handler(arg_30_0, arg_30_0.HidePosterGirlBtn), 3, 1)

		arg_30_0.hideChangeBtnDelayTimer_:Start()
	end
end

function var_0_0.HidePosterGirlBtn(arg_31_0)
	arg_31_0:SwitchPosterGirlPanel(false)

	if arg_31_0.hideChangeBtnDelayTimer_ ~= nil then
		arg_31_0.hideChangeBtnDelayTimer_:Stop()

		arg_31_0.hideChangeBtnDelayTimer_ = nil
	end
end

function var_0_0.SwitchPosterGirlPanel(arg_32_0, arg_32_1)
	SetActive(arg_32_0.changeGirlBtn, arg_32_1)
	SetActive(arg_32_0.changeSkinBtn, arg_32_1)
	SetActive(arg_32_0.btn_giftGo_, arg_32_1)

	local var_32_0 = false
	local var_32_1 = false

	if arg_32_1 then
		local var_32_2 = PlayerData:GetPosterGirlHeroSkinId()
		local var_32_3 = SkinSceneActionCfg[var_32_2]

		if var_32_3 and HomeSceneSettingData:GetUsedState(var_32_3.special_scene_id) ~= SceneConst.HOME_SCENE_TYPE.LOCK and HomeSceneSettingCfg[var_32_3.special_scene_id].limit_display ~= 1 then
			SetActive(arg_32_0.btn_DlcGo_, true)
		else
			SetActive(arg_32_0.btn_DlcGo_, false)
		end

		local var_32_4 = manager.posterGirl:GetViewDirect()
		local var_32_5 = HomeSceneSettingData:GetCurScene()

		if PosterGirlTools.IsSkinSceneTzeroMode(var_32_2, var_32_5) and var_32_4 == PosterGirlConst.ViewDirect.center then
			SetActive(arg_32_0.btn_infoGo_, true)
		else
			SetActive(arg_32_0.btn_infoGo_, false)
		end

		var_32_0 = PosterGirlTools.HasTimeEffect(var_32_2, var_32_5)
		var_32_1 = PosterGirlTools.HasWeatherEffect(var_32_2, var_32_5)
	else
		SetActive(arg_32_0.btn_infoGo_, false)
		SetActive(arg_32_0.btn_DlcGo_, false)
	end

	SetActive(arg_32_0.timeSwitchBtn_.gameObject, var_32_0)
	SetActive(arg_32_0.weatherSwitchBtn_.gameObject, var_32_1)
end

function var_0_0.MuteAudio(arg_33_0)
	HeroTools.StopTalk()

	if arg_33_0.multiTouchTimer_ ~= nil then
		arg_33_0.multiTouchTimer_:Stop()

		arg_33_0.multiTouchTimer_ = nil
	end

	SetActive(arg_33_0.talkBubbleGo_, false)

	arg_33_0.talking_ = false
end

function var_0_0.ShakingAni(arg_34_0)
	manager.posterGirl:DoShacking()
end

function var_0_0.OnHomeSceneChange(arg_35_0, arg_35_1, arg_35_2)
	manager.transition:OnlyShowEffect(true, function()
		manager.loadScene:ForceSetShouldLoadSceneName("home", function()
			if arg_35_0.OnlyShowEffectExiting_ then
				return
			end

			arg_35_0:MuteAudio()
			arg_35_0:SetCamera()
			manager.posterGirl:RefreshModel()
			manager.posterGirl:InitTouchHelp(arg_35_0.mutiTouchHelper_)

			if manager.posterGirl:CheckDebut() then
				manager.windowBar:HideBar()
				arg_35_0.sceneCon_:SetSelectedState("off")
			end

			arg_35_0:HidePosterGirlBtn()

			arg_35_0.OnlyShowEffectExiting_ = true

			manager.transition:OnlyShowEffect(false)

			arg_35_0.OnlyShowEffectExiting_ = false

			local var_37_0 = SettingData:GetHomeSceneSettingData()
			local var_37_1 = HomeSceneSettingData:GetCurScene()
			local var_37_2 = HomeSceneSettingCfg[var_37_1]
			local var_37_3 = var_37_2.scene_setting
			local var_37_4 = var_37_2.default_music

			if var_37_0.home_scene_scene_bgm == 0 or var_37_4 == 0 then
				-- block empty
			else
				if var_37_0.home_scene_scene_bgm == 1 and var_37_4 ~= 0 and var_37_0.home_scene_scene_bgm == 1 and table.indexof(var_37_3, HomeSceneSettingConst.SETTING.SCENE_BGM) then
					IllustratedAction.QuerySetBgm(var_37_4)
				end

				PlayGameSetBGM()
			end

			manager.gc:Collect()
			Resources.UnloadUnusedAssets()
		end)
	end)
end

function var_0_0.SetCamera(arg_38_0)
	local var_38_0 = HomeSceneSettingData:GetCurScene()
	local var_38_1 = "home_" .. var_38_0

	if CameraCfg[var_38_1] then
		manager.ui:SetMainCamera(var_38_1)
	else
		manager.ui:SetMainCamera("home")
	end
end

function var_0_0.CheckIsNeedPlayShowingAni(arg_39_0)
	local var_39_0 = false

	if arg_39_0.params_.changePoster then
		arg_39_0.params_.changePoster = nil

		if not arg_39_0.assistantVoiceTime_ or Time.realtimeSinceStartup - arg_39_0.assistantVoiceTime_ >= HeroConst.SET_ASSISTANT_VOICE_CD then
			arg_39_0.assistantVoiceTime_ = Time.realtimeSinceStartup

			manager.posterGirl:DoShowing()

			local var_39_1 = true
		end
	end
end

function var_0_0.CheckHomeSceneInteration(arg_40_0)
	manager.windowBar:ClearWhereTag()
	arg_40_0:SetCamera()

	arg_40_0.isHide_ = false
	arg_40_0.userData_ = PlayerData:GetPlayerInfo()
	arg_40_0.skinId_ = PlayerData:GetPosterGirlHeroSkinId()
	arg_40_0.posterGirl_ = SkinCfg[arg_40_0.skinId_].hero

	HeroAction.SelectSkinWithCallback(arg_40_0.posterGirl_, arg_40_0.skinId_, function()
		return
	end)

	if CustomCenterTools.IsRandomHero() and PlayerData:GetRandomHeroMode() == HomeSceneSettingConst.RANDOM_MODE.EACH_DAY then
		saveData("RandomData", "LastId_HERO", PlayerData:GetRandomHero())
	end

	if CustomCenterTools.IsRandomScene() and HomeSceneSettingData:GetRandomMode() == HomeSceneSettingConst.RANDOM_MODE.EACH_DAY then
		saveData("RandomData", "LastId_SCENE", HomeSceneSettingData:GetRandomScene())
	end

	local var_40_0 = HomeSceneSettingData:GetCurScene()

	PlayerAction.SaveHeroSkinIDAndSceneID(arg_40_0.skinId_, var_40_0)
	manager.posterGirl:SetViewTag(PosterGirlConst.ViewTag.home)
	manager.posterGirl:InitTouchHelp(arg_40_0.mutiTouchHelper_)

	if not manager.guide:IsPlaying() and manager.posterGirl:CheckDebut() then
		arg_40_0.wait_posetr_debut = true

		PlayerData:SetPosterGirlDebut(true)
		manager.windowBar:HideBar()
		arg_40_0.sceneCon_:SetSelectedState("off")
		arg_40_0:HideSceneMenuPanel(true)
	else
		arg_40_0.sceneCon_:SetSelectedState("on")
		arg_40_0:OnEnterFunc()
		arg_40_0:CheckIsNeedPlayShowingAni()
	end

	manager.loadScene:SetHomeSceneSoundEffect()
end

function var_0_0.OnHomeDebutOver(arg_42_0)
	if arg_42_0.wait_posetr_debut then
		arg_42_0:OnEnterFunc()
		arg_42_0:OnTopFunc()
	end

	arg_42_0:InitBar()
	arg_42_0.sceneCon_:SetSelectedState("on")
	arg_42_0:HideSceneMenuPanel(false)

	arg_42_0.wait_posetr_debut = false

	PlayerData:SetPosterGirlDebut(false)
end

function var_0_0.HideSceneMenuPanel(arg_43_0, arg_43_1)
	if arg_43_0:IsOpenRoute("menuPop") then
		manager.notify:Invoke(HOME_HIDE_MENU_POP, arg_43_1)
	end
end

function var_0_0.PlayHeroGreeting(arg_44_0)
	manager.posterGirl:DoGreeting()
end

function var_0_0.DelayToPlayMultiTouchInteraction(arg_45_0)
	arg_45_0.clickCount_ = arg_45_0.clickCount_ + 1

	if arg_45_0.multiTouchTimer_ == nil then
		arg_45_0.multiTouchTimer_ = Timer.New(function()
			if arg_45_0.multiTouchTimer_ then
				arg_45_0.multiTouchTimer_:Stop()

				arg_45_0.multiTouchTimer_ = nil
			end

			if manager.posterGirl:GetMiniGameState() then
				return
			end

			local var_46_0 = HomeSceneSettingData:GetCurScene()

			if arg_45_0.clickCount_ >= 3 then
				SDKTools.SendMessageToSDK("poster_touch", {
					touch_times = 3,
					position = 0,
					hero_id = arg_45_0.skinId_,
					scene_id = var_46_0
				})
				manager.posterGirl:DoQuickTouch()
			else
				SDKTools.SendMessageToSDK("poster_touch", {
					touch_times = 1,
					position = 0,
					hero_id = arg_45_0.skinId_,
					scene_id = var_46_0
				})
				manager.posterGirl:DoTouch()
			end

			arg_45_0.clickCount_ = 0
		end, 0.5, 1)

		arg_45_0.multiTouchTimer_:Start()
	end
end

function var_0_0.ClearHomePosterTalk(arg_47_0)
	arg_47_0.talking_ = false

	if not isNil(arg_47_0.talkBubbleGo_) then
		SetActive(arg_47_0.talkBubbleGo_, false)
	end

	if arg_47_0.talkBubbleTimer_ ~= nil then
		arg_47_0.talkBubbleTimer_:Stop()

		arg_47_0.talkBubbleTimer_ = nil
	end
end

function var_0_0.OnHomePosterTalk(arg_48_0, arg_48_1, arg_48_2, arg_48_3)
	local var_48_0 = tonumber(arg_48_1)
	local var_48_1 = HeroVoiceDescCfg.Get(var_48_0, arg_48_2[1])

	if var_48_1 then
		arg_48_0.talking_ = true

		if not isNil(arg_48_0.talkBubbleGo_) then
			arg_48_0:RefreshTalkBubbleHide()
		end

		if not isNil(arg_48_0.talkLabel_) then
			arg_48_0.talkLabel_.text = var_48_1
		end

		if arg_48_0.talkBubbleTimer_ ~= nil then
			arg_48_0.talkBubbleTimer_:Stop()

			arg_48_0.talkBubbleTimer_ = nil
		end

		arg_48_0.talkBubbleTimer_ = TimeTools.StartAfterSeconds(arg_48_3 / 1000, function()
			arg_48_0:ClearHomePosterTalk()
		end, {})
	end
end

function var_0_0.OnHomeBtnVisible(arg_50_0, arg_50_1)
	SetActive(arg_50_0.panelGo_, arg_50_1)

	arg_50_1 = arg_50_1 and PosterGirlTools.IsDlcBtn()

	arg_50_0.changedlcCon_:SetSelectedState(arg_50_1 and "show" or "hide")

	if arg_50_1 then
		arg_50_0:UpdatePosterGirlBtn()
	end
end

function var_0_0.ClearHeroFilter(arg_51_0)
	HeroData:SetupHeroMainOpenStatus(false)
	CommonFilterData:ClearFilter(Filter_Root_Define.Hero_Filter_List.filter_id)
end

function var_0_0.UpdatePosterGirlBtn(arg_52_0)
	local var_52_0 = HomeSceneSettingData:GetCurScene()
	local var_52_1 = manager.posterGirl:GetViewDirect()
	local var_52_2 = PosterGirlTools.IsLoopSwitch(var_52_0)
	local var_52_3 = manager.posterGirl:GetCurrentState()
	local var_52_4 = PosterGirlTools.CanInterruptCurAni()

	if (var_52_1 ~= PosterGirlConst.ViewDirect.left or var_52_2) and var_52_4 then
		arg_52_0.btn_zuoCon_:SetSelectedState("enable")
	else
		arg_52_0.btn_zuoCon_:SetSelectedState("disable")
	end

	if (var_52_1 ~= PosterGirlConst.ViewDirect.right or var_52_2) and var_52_4 then
		arg_52_0.btn_youCon_:SetSelectedState("enable")
	else
		arg_52_0.btn_youCon_:SetSelectedState("disable")
	end
end

function var_0_0.OnBehind(arg_53_0)
	arg_53_0.isBehind_ = true
	arg_53_0.longTimeNoOpCheckCom_.enabled = false

	arg_53_0:StopViewHideTimer()
	arg_53_0:SetPureModeBtnActive(false, false)
end

function var_0_0.SetPureModeShow(arg_54_0)
	if manager.guide:IsPlaying() or manager.guide:IsPlayingWeaking() or not arg_54_0.isDoActionEnd_ or not arg_54_0:IsTop() then
		return
	end

	arg_54_0:StopAllTimers()
	arg_54_0:SetPureMode(false)
	arg_54_0:SetPureModeBtnActive(false, true)

	local var_54_0 = arg_54_0.isPureMode_ and PureModeConst.EnterMode.mode3 or PureModeConst.EnterMode.mode2

	JumpTools.OpenPageByJump("PureModeView", {
		enterType = var_54_0
	})

	if arg_54_0.isPureMode_ then
		arg_54_0:RecordPureModeLog(false)
	end
end

return var_0_0
