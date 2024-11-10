local var_0_0 = partialClass("MainHomeView", ReduxView)
local var_0_1 = 0

function var_0_0.AddMiddlePanelUILisener(arg_1_0)
	arg_1_0:AddBtnListener(arg_1_0.btn_changeChar, nil, function()
		arg_1_0:SwitchPosterGirlPanel(false)
		arg_1_0:Go("/changePoster", {
			lastView = "home"
		})
	end)
	arg_1_0:AddBtnListener(arg_1_0.btn_skin, nil, function()
		arg_1_0:SwitchPosterGirlPanel(false)
		arg_1_0:Go("/heroSkin", {
			heroID = arg_1_0.userData_.poster_girl
		})
	end)
	arg_1_0:AddBtnListener(arg_1_0.btn_giftBtn_, nil, function()
		arg_1_0:SwitchPosterGirlPanel(false)
		arg_1_0:Go("/heroArchive", {
			pageID = 3,
			heroID = arg_1_0.userData_.poster_girl
		})
	end)
	arg_1_0:AddBtnListener(arg_1_0.btn_infoBtn_, nil, function()
		local var_5_0 = GameSetting.home_scene_interactive_describe and GameSetting.home_scene_interactive_describe.value or {}

		JumpTools.OpenPageByJump("gameHelpPro", {
			hideHomeBtn = 1,
			isPrefab = true,
			pages = var_5_0
		})
	end)
	arg_1_0:AddBtnListener(arg_1_0.btn_DlcBtn_, nil, function()
		if Time.realtimeSinceStartup < var_0_1 + 1 then
			return
		end

		var_0_1 = Time.realtimeSinceStartup

		HomeSceneSettingAction.ChangeSceneTab(arg_1_0.skinId_)
	end)
	arg_1_0:AddBtnListener(arg_1_0.hideViewBtn_, nil, function()
		arg_1_0.isHide_ = true

		arg_1_0:RefreshHide()
		arg_1_0:StartViewHideTimer()
		arg_1_0.animator_:Play("HomeUI_hide", -1, 0)
	end)
	arg_1_0:AddBtnListener(arg_1_0.showAniSkipBtn_, nil, function()
		manager.posterGirl:SkipDebut()
		HomeSceneSettingData:SetIsPlay(arg_1_0.skinId_)
	end)
	arg_1_0:AddBtnListener(arg_1_0.bgmaskBtn_, nil, function()
		arg_1_0:OnClickBg()
	end)
end

function var_0_0.AddRightPanelUIListener(arg_10_0)
	arg_10_0:AddBtnListenerScale(arg_10_0.btnPreviewTask_, nil, function()
		JumpTools.OpenPageByJump("previewTaskMain")
	end)
	arg_10_0:AddBtnListenerScale(arg_10_0.btn_task, nil, function()
		JumpTools.GoToSystem("/task", {
			initNormalizedPosition = true,
			taskIndex = TaskConst.TASK_TYPE.DAILY
		}, ViewConst.SYSTEM_ID.TASK_PLOT)
	end)
	arg_10_0:AddBtnListenerScale(arg_10_0.btn_mail, nil, function()
		OperationRecorder.RecordButtonTouch("homepage_mail")

		local var_13_0 = handler(arg_10_0, function()
			JumpTools.GoToSystem("/mailBox")
		end)

		if MailData.GetTotal() > #MailData.GetMailSort() then
			MailData.GetMailListFromServer(var_13_0)
		else
			var_13_0()
		end

		MailData.ClickMailBtn(manager.time:GetServerTime())
	end)
	arg_10_0:AddBtnListenerScale(arg_10_0.btn_menu, nil, function()
		JumpTools.OpenPageByJump("menuPop")
	end)
	arg_10_0:AddBtnListener(arg_10_0.skinDrawBtn_, nil, function()
		local var_16_0, var_16_1 = ActivitySkinDrawData:GetNotReadStoryID()
		local var_16_2 = ActivityData:GetActivityData(var_16_0)

		if var_16_0 and var_16_2:IsActivitying() then
			if not JumpTools.IsSystemLocked(ViewConst.SYSTEM_ID.SKIN_DRAW) then
				if var_16_1 and var_16_1.isRead == 0 then
					arg_10_0:MuteAudio()

					local var_16_3 = ActivityLimitedSkinStoryCfg[var_16_1.activityID]

					manager.story:StartStoryById(var_16_3.story_id, function()
						manager.loadScene:ForceSetShouldLoadSceneName("home", function()
							ActivitySkinDrawAction.FinishStory(var_16_1.activityID)
							JumpTools.GoToSystem("/activityskinDraw", {
								activityID = var_16_0
							}, ViewConst.SYSTEM_ID.SKIN_DRAW)
						end)
					end)
				else
					JumpTools.GoToSystem("/activityskinDraw", {
						activityID = var_16_0
					}, ViewConst.SYSTEM_ID.SKIN_DRAW)
				end
			else
				ShowTips(JumpTools.GetSystemLockedTip(ViewConst.SYSTEM_ID.SKIN_DRAW, JumpTools.IsSystemLocked(ViewConst.SYSTEM_ID.SKIN_DRAW)))
			end
		else
			SetActive(arg_10_0.skinDrawBtn_.gameObject, false)
		end
	end)
	arg_10_0:AddBtnListener(arg_10_0.btn_combat, nil, function()
		local var_19_0 = getData("SDK", "btn_homepage_combat")
		local var_19_1 = TimeMgr:GetServerTime()

		if var_19_0 == nil or not TimeMgr:IsSameDay(var_19_0, var_19_1) then
			saveData("SDK", "btn_homepage_combat", TimeMgr:GetServerTime())
			OperationRecorder.RecordButtonTouch("homepage_combat")
		end

		JumpTools.GoToSystem("/chapterMap", {
			chapterToggle = BattleConst.TOGGLE.MAIN
		}, ViewConst.SYSTEM_ID.BATTLE)
	end)
	arg_10_0:AddBtnListenerScale(arg_10_0.btn_goddess, nil, function()
		HeroData:SetupHeroMainOpenStatus(true)
		JumpTools.GoToSystem("/newHero", {
			isEnter = true,
			type = HeroConst.HERO_DATA_TYPE.DEFAULT
		}, ViewConst.SYSTEM_ID.HERO)
	end)
	arg_10_0:AddBtnListenerScale(arg_10_0.btn_shop, nil, function()
		OperationRecorder.RecordButtonTouch("homepage_shop")
		JumpTools.GoToSystem("/rechargeEnter", nil, ViewConst.SYSTEM_ID.SHOP_ENTER)
	end)
	arg_10_0:AddBtnListenerScale(arg_10_0.btn_backPake, nil, function()
		JumpTools.GoToSystem("/bag", nil, ViewConst.SYSTEM_ID.BAG)
	end)
	arg_10_0:AddBtnListenerScale(arg_10_0.btnGuild_, nil, function()
		if JumpTools.IsSystemOperationStoped(ViewConst.SYSTEM_ID.GUILD) then
			ShowTips("ERROR_FUNCTION_STOP")

			return nil
		end

		local var_23_0 = JumpTools.IsSystemLocked(ViewConst.SYSTEM_ID.GUILD)

		if var_23_0 then
			ShowTips(JumpTools.GetSystemLockedTip(ViewConst.SYSTEM_ID.GUILD, var_23_0))

			return
		end

		if GuildData:GetGuildInfo().id == nil then
			GuildAction.EnterGuild()
		else
			GuildAction.RequiredGuildInfo(function(arg_24_0)
				if isSuccess(arg_24_0.result) then
					JumpTools.OpenPageByJump("/guildEntrace/guildMain")
				else
					ShowTips(arg_24_0.result)
				end
			end)
		end
	end)
	arg_10_0:AddBtnListenerScale(arg_10_0.btn_dorm_, nil, function()
		local var_25_0 = JumpTools.IsSystemLocked(ViewConst.SYSTEM_ID.DORM)

		if var_25_0 then
			ShowTips(JumpTools.GetSystemLockedTip(ViewConst.SYSTEM_ID.DORM, var_25_0))

			return nil
		end

		local function var_25_1()
			manager.posterGirl:SetViewTag(PosterGirlConst.ViewTag.null)

			local var_26_0 = GameDisplayCfg.dorm_begin_story.value[1]

			if var_26_0 and not manager.story:IsStoryPlayed(var_26_0) then
				manager.story:StartStoryById(var_26_0, function(arg_27_0)
					JumpTools.OpenPageByJump("/dormChooseRoomView")
				end)
			else
				JumpTools.OpenPageByJump("/dormChooseRoomView")
			end
		end

		BackHomeDataManager:EnterBackHomeSystem(var_25_1)
	end)
	arg_10_0:AddBtnListenerScale(arg_10_0.btn_draw, nil, function()
		JumpTools.GoToSystem("/draw", nil, ViewConst.SYSTEM_ID.DRAW)
	end)
end

function var_0_0.AddLeftPanelUIListener(arg_29_0)
	arg_29_0:AddBtnListener(arg_29_0.appearViewBtn_, nil, function()
		arg_29_0:StopViewHideTimer()
		SetActive(arg_29_0.appearViewBtn_.gameObject, false)

		arg_29_0.isHide_ = false

		arg_29_0:RefreshHide()
		arg_29_0.animator_:Play("HomeUI_cx", -1, 0)
	end)
	arg_29_0:AddBtnListener(arg_29_0.btn_message, nil, function()
		OpenPageUntilLoaded("/userinfo", {
			page = "info"
		}, ViewConst.SYSTEM_ID.PLAYER_INFO)
	end)
	arg_29_0:AddBtnListener(arg_29_0.btn_callback, nil, function()
		local var_32_0 = ActivityConst.RECALL_MAIN

		ActivityRecallAction.RequestOpenRecallView(var_32_0, function()
			JumpTools.GoToSystem("/recallMain", nil)
		end)
	end)
	arg_29_0:AddBtnListenerScale(arg_29_0.btn_regression, nil, function()
		RegressionAction.CheckRegressionStory({
			isEnter = true,
			Inited = false
		})
	end)
	arg_29_0:AddBtnListenerScale(arg_29_0.buttonNewbie_, nil, function()
		ActivityNewbieTools.GotoMainView()
	end)
	arg_29_0:AddBtnListenerScale(arg_29_0.btn_newbie_task, nil, function()
		ActivityNewbieTools.GotoNoobAdvanceTaskView()
	end)
	arg_29_0:AddBtnListenerScale(arg_29_0.advanceTestBtn_, nil, function()
		JumpTools.GoToSystem("/advanceTestMain")
	end)
	arg_29_0:AddBtnListenerScale(arg_29_0.btn_passport, nil, function()
		OperationRecorder.RecordButtonTouch("homepage_bp")

		if not PassportData:IsOpen() then
			ShowTips("NOT_IN_OPEN_TIME")

			return
		end

		JumpTools.OpenPageByJump("/passportMain", nil, ViewConst.SYSTEM_ID.PASSPORT_MAIN)
	end)
	arg_29_0:AddBtnListenerScale(arg_29_0.btn_gm, nil, function()
		JumpTools.GoToSystem("gm")
	end)
	arg_29_0:AddBtnListenerScale(arg_29_0.btn_heroInteractionGM, nil, function()
		JumpTools.GoToSystem("heroInteractionGM", {
			skinId = arg_29_0.skinId_
		})
	end)
	arg_29_0:AddBtnListener(arg_29_0.btn_story, nil, function()
		JumpTools.GoToSystem("/storylist")
	end)
	arg_29_0:AddBtnListenerScale(arg_29_0.btn_newServer, nil, function()
		JumpTools.OpenPageByJump("/activityNewServerMain")
	end)
	arg_29_0:AddBtnListenerScale(arg_29_0.btn_friends_, nil, function()
		local var_43_0 = ViewConst.SYSTEM_ID.FRIEND
		local var_43_1 = JumpTools.IsSystemLocked(var_43_0)

		if var_43_0 and var_43_1 then
			ShowTips(JumpTools.GetSystemLockedTip(var_43_0, var_43_1))

			return
		end

		FriendsAction:TryToRefreshFriendsView(FriendsConst.FRIEND_TYPE.MY_FRIENDS, function()
			JumpTools.GoToSystem("/friendsUI", {
				friendPage = FriendsConst.FRIEND_TYPE.MY_FRIENDS
			}, ViewConst.SYSTEM_ID.FRIEND)
		end)
	end)
	arg_29_0:AddBtnListenerScale(arg_29_0.btn_chat, nil, function()
		JumpTools.GoToSystem("/chat", {
			chatToggleID = ChatConst.CHAT_CHANNEL_WORLD
		}, ViewConst.SYSTEM_ID.CHAT)
	end)
end

function var_0_0.AddUIListenersHome(arg_46_0)
	function arg_46_0.mutiTouchHelper_.OnIdle()
		manager.posterGirl:TouchHelpIdle()
	end

	function arg_46_0.mutiTouchHelper_.OnSingleDrag(arg_48_0, arg_48_1)
		manager.posterGirl:TouchHelpSingleDrag(arg_48_0, arg_48_1)
	end

	function arg_46_0.mutiTouchHelper_.OnMutiDrag(arg_49_0)
		manager.posterGirl:TouchHelpMutiDrag(arg_49_0)
	end

	function arg_46_0.mutiTouchHelper_.OnClick()
		if manager.posterGirl:GetViewDirect() == 0 then
			arg_46_0:ShowPosterGirlBtn()
		end

		arg_46_0:DelayToPlayMultiTouchInteraction()
	end
end
