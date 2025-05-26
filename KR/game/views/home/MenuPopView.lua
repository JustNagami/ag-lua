local var_0_0 = class("MenuPopView", ReduxView)
local var_0_1 = {
	userCenter = 9901,
	activity = 9910,
	shop = 9911,
	query = 9905,
	suggest = 9902,
	info = 9912,
	psq = 9907,
	forum = 9904,
	attention = 9908,
	uccn = 9909,
	cdk = 9903
}

function var_0_0.UIName(arg_1_0)
	return "Widget/System/Main/MenuUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiPop.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:InitUI()
	arg_3_0:AddUIListeners()
end

function var_0_0.InitUI(arg_4_0)
	arg_4_0:BindCfgUI()

	arg_4_0.chipCon_ = ControllerUtil.GetController(arg_4_0.chipBtn_.transform, "lock")
	arg_4_0.exploreCon_ = ControllerUtil.GetController(arg_4_0.exploreBtn_.transform, "lock")
end

function var_0_0.AddUIListeners(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.musicBtn_, nil, function()
		JumpTools.OpenPageByJump("/illuMusic", {
			isEnter = true
		})
	end)
	arg_5_0:AddBtnListener(arg_5_0.taskBtn_, nil, function()
		JumpTools.GoToSystem("/task", {
			initNormalizedPosition = true,
			taskIndex = TaskConst.TASK_TYPE.DAILY
		}, ViewConst.SYSTEM_ID.TASK_PLOT)
	end)
	arg_5_0:AddBtnListener(arg_5_0.mailBtn_, nil, function()
		local var_8_0 = handler(arg_5_0, function()
			JumpTools.GoToSystem("/mailBox")
		end)

		if MailData.GetTotal() > #MailData.GetMailSort() then
			MailData.GetMailListFromServer(var_8_0)
		else
			var_8_0()
		end

		MailData.ClickMailBtn(manager.time:GetServerTime())
	end)
	arg_5_0:AddBtnListener(arg_5_0.servantBtn_, nil, function()
		OperationRecorder.RecordButtonTouch("homepage_expand_1")
		SDKTools.SendMessageToSDK("weapon_servant_touch", {
			touch_times = 1
		})
		JumpTools.OpenPageByJump("/weaponServant")
	end)
	arg_5_0:AddBtnListener(arg_5_0.chipBtn_, nil, function()
		OperationRecorder.RecordButtonTouch("homepage_expand_2")
		JumpTools.GoToSystem("/chipManager", nil, ViewConst.SYSTEM_ID.CHIP_MANAGER)
	end)
	arg_5_0:AddBtnListener(arg_5_0.suggestBtn_, nil, function()
		OperationRecorder.RecordButtonTouch("homepage_expand_16")
		NeedGameUserInfo()
		SendMessageToSDK("{\"messageType\" : \"StartCustomerService\"}")
		manager.redPoint:setTip(RedPointConst.CUSTOMER_SERVICE_UNREAD, 0)
		SDKTools.SendMessageToSDK("direction", {
			direction_type = 3,
			direction_channel = 4
		})
	end)
	arg_5_0:AddBtnListener(arg_5_0.attentionBtn_, nil, function()
		OperationRecorder.RecordButtonTouch("homepage_expand_10")
		saveData("SDK", "followGift", 0)
		manager.redPoint:setTip(RedPointConst.FOLLOW_GIFT, 0)
		arg_5_0:Go("/followGift")
		SDKTools.SendMessageToSDK("direction", {
			direction_type = 5,
			direction_channel = 4
		})
	end)
	arg_5_0:AddBtnListener(arg_5_0.psqBtn_, nil, function()
		OperationRecorder.RecordButtonTouch("homepage_expand_9")
		SurveyAction.SetSurveyRedPointData()
		JumpTools.OpenPageByJump("survey", {
			type = OperationConst.SURVEY_TYPE.NORMAL
		})
		SDKTools.SendMessageToSDK("direction", {
			direction_type = 4,
			direction_channel = 4
		})
	end)
	arg_5_0:AddBtnListener(arg_5_0.queryBtn_, nil, function()
		OperationRecorder.RecordButtonTouch("homepage_expand_15")

		local var_15_0 = {
			userId = PlayerData:GetPlayerInfo().userID,
			signUserId = PlayerData:GetPlayerInfo().signUserId
		}

		OperationAction.OpenOperationUrl("INQUERY_URL", var_15_0)
		SDKTools.SendMessageToSDK("direction", {
			direction_type = 6,
			direction_channel = 4
		})
	end)
	arg_5_0:AddBtnListener(arg_5_0.cdkBtn_, nil, function()
		OperationRecorder.RecordButtonTouch("homepage_expand_11")
		JumpTools.OpenPageByJump("GiftPopUp")
		SDKTools.SendMessageToSDK("direction", {
			direction_type = 7,
			direction_channel = 4
		})
	end)
	arg_5_0:AddBtnListener(arg_5_0.archiveBtn_, nil, function()
		OperationRecorder.RecordButtonTouch("homepage_expand_6")
		JumpTools.GoToSystem("/newHeroArchiveView")
	end)
	arg_5_0:AddBtnListener(arg_5_0.forumBtn_, nil, function()
		local var_18_0 = {
			userId = PlayerData:GetPlayerInfo().userID,
			signUserId = PlayerData:GetPlayerInfo().signUserId,
			gameAppId = _G.ChannelLoginInfo.channelAppId,
			token = _G.ChannelLoginInfo.channelToken
		}

		OperationRecorder.RecordButtonTouch("homepage_expand_12")
		OperationAction.OpenOperationUrl("FORUM_URL", var_18_0)
		RedPointAction.HandleNeedRedPoint(RED_POINT_ID.FORUM)
		SDKTools.SendMessageToSDK("direction", {
			direction_type = 8,
			direction_channel = 4
		})
		manager.redPoint:setTip(RedPointConst.FORUM, 0)
		manager.redPoint:setTip(RedPointConst.FORUM_UNREAD, 0)
	end)
	arg_5_0:AddBtnListener(arg_5_0.signBtn_, nil, function()
		OperationRecorder.RecordButtonTouch("homepage_expand_7")
		JumpTools.OpenPageByJump("sign", {
			check = true,
			activityID = ActivityConst.SIGN
		}, ViewConst.SYSTEM_ID.SIGN)
	end)
	arg_5_0:AddBtnListener(arg_5_0.anncBtn_, nil, function()
		OperationRecorder.RecordButtonTouch("homepage_expand_8")

		local var_20_0 = arg_5_0:GetBulletinID()

		if var_20_0 == false then
			ShowTips("NO_ANNOUNCEMENT")
		else
			JumpTools.OpenPageByJump("bulletin", {
				bulletinID = var_20_0
			}, ViewConst.SYSTEM_ID.ANNOUNCEMENT)
		end
	end)
	arg_5_0:AddBtnListener(arg_5_0.uccnBtn_, nil, function()
		OperationRecorder.RecordButtonTouch("homepage_expand_18")
		OperationAction.OpenOperationUrl("OFFICIAL_URL")
		SDKTools.SendMessageToSDK("direction", {
			direction_type = 1,
			direction_channel = 4
		})
	end)
	arg_5_0:AddBtnListener(arg_5_0.activityBtn_, nil, function()
		OperationRecorder.RecordButtonTouch("homepage_expand_13")

		local var_22_0 = {
			userId = PlayerData:GetPlayerInfo().userID,
			signUserId = PlayerData:GetPlayerInfo().signUserId
		}

		OperationAction.OpenOperationUrl("ACTIVITY_URL", var_22_0)
		RedPointAction.HandleNeedRedPoint(RED_POINT_ID.ACTIVITY)
		manager.redPoint:setTip(RedPointConst.OPERATION_ACTIVITY, 0)
	end)
	arg_5_0:AddBtnListener(arg_5_0.shopBtn_, nil, function()
		local var_23_0 = {}

		OperationRecorder.RecordButtonTouch("homepage_expand_14")
		OperationAction.OpenOperationUrl("SHOPPING_URL", var_23_0)
		RedPointAction.HandleNeedRedPoint(RED_POINT_ID.SHOP_TAOBAO)
		manager.redPoint:setTip(RedPointConst.SHOP_TAOBAO, 0)
		SDKTools.SendMessageToSDK("direction", {
			direction_type = 10,
			direction_channel = 4
		})
	end)
	arg_5_0:AddBtnListener(arg_5_0.exploreBtn_, nil, function()
		OperationRecorder.RecordButtonTouch("homepage_expand_5")
		JumpTools.OpenPageByJump("/adminCatExploreView", nil, ViewConst.SYSTEM_ID.ADMIN_CAT_EXPLORE)
	end)
	arg_5_0:AddBtnListener(arg_5_0.infomationBtn_, nil, function()
		OperationRecorder.RecordButtonTouch("homepage_expand_17")

		local var_25_0 = {
			userId = PlayerData:GetPlayerInfo().userID,
			signUserId = PlayerData:GetPlayerInfo().signUserId
		}

		OperationAction.OpenOperationUrl("INFORMATION_URL", var_25_0)
		RedPointAction.HandleRedPoint(RED_POINT_ID.INFOMATION)
		manager.redPoint:setTip(RedPointConst.INFOMATION, 0)
	end)
	arg_5_0:AddBtnListener(arg_5_0.illustratedhandbookBtn_, nil, function()
		OperationRecorder.RecordButtonTouch("homepage_expand_3")
		JumpTools.GoToSystem("/illustratedMain", nil, ViewConst.SYSTEM_ID.ILLUSTRATION)
	end)
	arg_5_0:AddBtnListener(arg_5_0.achieveMentBtn_, nil, function()
		OperationRecorder.RecordButtonTouch("homepage_expand_4")
		JumpTools.GoToSystem("/achievementManager", nil, ViewConst.SYSTEM_ID.ACHIEVEMENT)
	end)
	arg_5_0:AddBtnListener(arg_5_0.settingBtn_, nil, function()
		JumpTools.GoToSystem("/setting", {
			setType = SettingConst.SETTING_TYPE.SYSTEM
		}, ViewConst.SYSTEM_ID.SETTING)
	end)
	arg_5_0:AddBtnListener(arg_5_0.userCenterBtn_, nil, function()
		NeedGameUserInfo()
		GameToSDK.GoUserCenter()
		SDKTools.SendMessageToSDK("direction", {
			direction_type = 2,
			direction_channel = 4
		})
	end)
	arg_5_0:AddBtnListener(nil, arg_5_0.m_exitBtn, function()
		ShowMessageBox({
			content = GetTips("TIP_LOGOUT_GOTO_LOGIN_VIEW"),
			OkCallback = function()
				GotoLoginView()
			end,
			CancelCallback = function()
				return
			end
		})
	end)
	arg_5_0:AddBtnListener(arg_5_0.bgBtn_, nil, function()
		arg_5_0:Back()
	end)
	arg_5_0:AddBtnListener(arg_5_0.cooperationBtn_, nil, function()
		OperationRecorder.RecordButtonTouch("homepage_expand_19")

		if CooperationAction.CheckCooperationApplyLimit(true) then
			return
		end

		JumpTools.OpenPageByJump("cooperationApply")
	end)
	arg_5_0:AddBtnListener(arg_5_0.sceneBtn_, nil, function()
		local var_35_0 = HomeSceneSettingData:GetCurScene()

		JumpTools.OpenPageByJump("/scenePreview")
	end)

	if arg_5_0.capsuleToysBtn_ then
		arg_5_0:AddBtnListener(arg_5_0.capsuleToysBtn_, nil, function()
			OverseaH5GameAction.EnterGame(2)
		end)
	end
end

function var_0_0.OnEnter(arg_37_0)
	arg_37_0:RefreshSDK()
	arg_37_0:RefreshLock()
	arg_37_0:RefreshMusic()
	arg_37_0:BindRedPointUI()
end

function var_0_0.GetBulletinID(arg_38_0)
	local var_38_0 = manager.time:GetServerTime()
	local var_38_1 = {
		101,
		102,
		104
	}

	for iter_38_0, iter_38_1 in ipairs(var_38_1) do
		local var_38_2 = BulletinData.GetBulletinIDList()[iter_38_1]

		if var_38_2 then
			for iter_38_2, iter_38_3 in pairs(var_38_2) do
				local var_38_3 = BulletinData.GetBulletinPageList()[iter_38_3]

				if var_38_0 < var_38_3.endTime then
					return var_38_3.id
				end
			end
		end
	end

	return false
end

function var_0_0.RefreshSDK(arg_39_0)
	arg_39_0:RefreshSDKOpen()
end

function var_0_0.RefreshSDKOpen(arg_40_0)
	local var_40_0 = OperationData:GetOperationOpenList()
	local var_40_1 = PlayerData:GetPlayerInfo().userLevel

	if table.keyof(var_40_0, OperationConst.USER_CENTER) ~= nil and var_40_1 >= SystemCfg[var_0_1.userCenter].open_condition[1][2] then
		SetActive(arg_40_0.userCenterBtn_.gameObject, true)
	else
		SetActive(arg_40_0.userCenterBtn_.gameObject, false)
	end

	if table.keyof(var_40_0, OperationConst.SUGGEST) ~= nil and var_40_1 >= SystemCfg[var_0_1.suggest].open_condition[1][2] then
		SetActive(arg_40_0.suggestBtn_.gameObject, true)
	else
		SetActive(arg_40_0.suggestBtn_.gameObject, false)
	end

	if table.keyof(var_40_0, OperationConst.CD_KEY) ~= nil and var_40_1 >= SystemCfg[var_0_1.cdk].open_condition[1][2] then
		SetActive(arg_40_0.cdkBtn_.gameObject, true)
	else
		SetActive(arg_40_0.cdkBtn_.gameObject, false)
	end

	if table.keyof(var_40_0, OperationConst.FORUM) ~= nil and var_40_1 >= SystemCfg[var_0_1.forum].open_condition[1][2] then
		SetActive(arg_40_0.forumBtn_.gameObject, true)
	else
		SetActive(arg_40_0.forumBtn_.gameObject, false)
	end

	if table.keyof(var_40_0, OperationConst.INQUERY) ~= nil and var_40_1 >= SystemCfg[var_0_1.query].open_condition[1][2] then
		SetActive(arg_40_0.queryBtn_.gameObject, true)
	else
		SetActive(arg_40_0.queryBtn_.gameObject, false)
	end

	SetActive(arg_40_0.guideBtn_.gameObject, false)

	if table.keyof(var_40_0, OperationConst.QUESTIONNAIRE) ~= nil and var_40_1 >= SystemCfg[var_0_1.psq].open_condition[1][2] then
		SetActive(arg_40_0.psqBtn_.gameObject, true)
	else
		SetActive(arg_40_0.psqBtn_.gameObject, false)
	end

	if table.keyof(var_40_0, OperationConst.ATTENTION) ~= nil and var_40_1 >= SystemCfg[var_0_1.attention].open_condition[1][2] then
		SetActive(arg_40_0.attentionBtn_.gameObject, true)
	else
		SetActive(arg_40_0.attentionBtn_.gameObject, false)
	end

	if table.keyof(var_40_0, OperationConst.OFFICIAL_WEBSITE) ~= nil and var_40_1 >= SystemCfg[var_0_1.uccn].open_condition[1][2] then
		SetActive(arg_40_0.uccnBtn_.gameObject, true)
	else
		SetActive(arg_40_0.uccnBtn_.gameObject, false)
	end

	if table.keyof(var_40_0, OperationConst.ACTIVITY) ~= nil and var_40_1 >= SystemCfg[var_0_1.activity].open_condition[1][2] then
		SetActive(arg_40_0.activityBtn_.gameObject, true)
	else
		SetActive(arg_40_0.activityBtn_.gameObject, false)
	end

	if table.keyof(var_40_0, OperationConst.SHOP_TAOBAO) ~= nil and var_40_1 >= SystemCfg[var_0_1.shop].open_condition[1][2] then
		SetActive(arg_40_0.shopBtn_.gameObject, true)
	else
		SetActive(arg_40_0.shopBtn_.gameObject, false)
	end

	if table.keyof(var_40_0, OperationConst.INFOMATION) ~= nil and var_40_1 >= SystemCfg[var_0_1.info].open_condition[1][2] then
		SetActive(arg_40_0.infomationBtn_.gameObject, true)
	else
		SetActive(arg_40_0.infomationBtn_.gameObject, false)
	end

	if arg_40_0.capsuleToysBtn_ and OverseaH5GameData:GetIsOpen() then
		SetActive(arg_40_0.capsuleToysBtn_.gameObject, true)
	else
		SetActive(arg_40_0.capsuleToysBtn_.gameObject, false)
	end
end

function var_0_0.RefreshLock(arg_41_0)
	if JumpTools.IsSystemLocked(ViewConst.SYSTEM_ID.CHIP_MANAGER) then
		arg_41_0.chipCon_:SetSelectedState("true")
	else
		arg_41_0.chipCon_:SetSelectedState("false")
	end

	if JumpTools.IsSystemLocked(ViewConst.SYSTEM_ID.ADMIN_CAT_EXPLORE) then
		arg_41_0.exploreCon_:SetSelectedState("true")
	else
		arg_41_0.exploreCon_:SetSelectedState("false")
	end

	if CooperationTools.GetShowInviteRoot() then
		SetActive(arg_41_0.cooperationBtn_.gameObject, true)
	else
		SetActive(arg_41_0.cooperationBtn_.gameObject, false)
	end
end

function var_0_0.RefreshMusic(arg_42_0)
	local var_42_0 = MusicRecordCfg.all[1]
	local var_42_1 = GetHomeMusicID()

	if var_42_1 ~= 0 and MusicRecordCfg[var_42_1] then
		var_42_0 = var_42_1
	else
		local var_42_2 = manager.audio:GetBgmPlayer()

		if var_42_2 then
			local var_42_3 = var_42_2.cueName or ""
			local var_42_4 = var_42_2.cueSheet or ""

			if var_42_3 ~= "" and var_42_4 ~= "" then
				local var_42_5 = MusicRecordCfg.all

				for iter_42_0, iter_42_1 in ipairs(var_42_5) do
					local var_42_6 = MusicRecordCfg[iter_42_1]

					if var_42_6.cueName == var_42_3 and var_42_6.cuesheet == var_42_4 then
						var_42_0 = iter_42_1
					end
				end
			end
		end
	end

	arg_42_0.musicTxt_.text = GetI18NText(MusicRecordCfg[var_42_0].musicName)
end

function var_0_0.BindRedPointUI(arg_43_0)
	manager.redPoint:bindUIandKey(arg_43_0.anncBtn_.transform, RedPointConst.BULLETIN_UNREAD)
	manager.redPoint:bindUIandKey(arg_43_0.signBtn_.transform, RedPointConst.SIGN)
	manager.redPoint:bindUIandKey(arg_43_0.servantBtn_.transform, RedPointConst.WEAPON_SERVANT_MERGE)
	manager.redPoint:bindUIandKey(arg_43_0.settingBtn_.transform, RedPointConst.SETTING_NEW_FUNCTION)
	manager.redPoint:bindUIandKey(arg_43_0.chipBtn_.transform, RedPointConst.CHIP_MANAGER)
	manager.redPoint:bindUIandKey(arg_43_0.taskBtn_.transform, RedPointConst.TASK)
	manager.redPoint:bindUIandKey(arg_43_0.mailBtn_.transform, RedPointConst.MAIL_UNREAD)
	manager.redPoint:bindUIandKey(arg_43_0.exploreBtn_.transform, RedPointConst.EXPLORE_MAIN)
	manager.redPoint:bindUIandKey(arg_43_0.cooperationBtn_.transform, RedPointConst.COOPERATION_INVIT)
	manager.redPoint:bindUIandKey(arg_43_0.sceneBtn_.transform, RedPointConst.SCENE)
	manager.redPoint:bindUIandKey(arg_43_0.achieveMentBtn_.transform, RedPointConst.ACHIEVEMENT)
	manager.redPoint:bindUIandKey(arg_43_0.illustratedhandbookBtn_.transform, RedPointConst.ILLU_USER)
	manager.redPoint:bindUIandKey(arg_43_0.archiveBtn_.transform, RedPointConst.HERO_HEART_STORY_ROOT_FULL)
	manager.redPoint:bindUIandKey(arg_43_0.attentionBtn_.transform, RedPointConst.FOLLOW_GIFT)
	manager.redPoint:bindUIandKey(arg_43_0.psqBtn_.transform, RedPointConst.SURVEY)
	manager.redPoint:bindUIandKey(arg_43_0.forumBtn_.transform, RedPointConst.FORUM_PLATFORM)
	manager.redPoint:bindUIandKey(arg_43_0.activityBtn_.transform, RedPointConst.OPERATION_ACTIVITY)
	manager.redPoint:bindUIandKey(arg_43_0.shopBtn_.transform, RedPointConst.SHOP_TAOBAO)
	manager.redPoint:bindUIandKey(arg_43_0.infomationBtn_.transform, RedPointConst.INFOMATION)
	manager.redPoint:bindUIandKey(arg_43_0.suggestBtn_.transform, RedPointConst.CUSTOMER_SERVICE_UNREAD)

	if arg_43_0.capsuleToysBtn_ then
		manager.redPoint:bindUIandKey(arg_43_0.capsuleToysBtn_.transform, RedPointConst.OVERSEA_H5_GAME)
	end
end

function var_0_0.UnBindRedPointUI(arg_44_0)
	manager.redPoint:unbindUIandKey(arg_44_0.anncBtn_.transform, RedPointConst.BULLETIN_UNREAD)
	manager.redPoint:unbindUIandKey(arg_44_0.signBtn_.transform, RedPointConst.SIGN)
	manager.redPoint:unbindUIandKey(arg_44_0.servantBtn_.transform, RedPointConst.WEAPON_SERVANT_MERGE)
	manager.redPoint:unbindUIandKey(arg_44_0.settingBtn_.transform, RedPointConst.SETTING_NEW_FUNCTION)
	manager.redPoint:unbindUIandKey(arg_44_0.chipBtn_.transform, RedPointConst.CHIP_MANAGER)
	manager.redPoint:unbindUIandKey(arg_44_0.taskBtn_.transform, RedPointConst.TASK)
	manager.redPoint:unbindUIandKey(arg_44_0.mailBtn_.transform, RedPointConst.MAIL_UNREAD)
	manager.redPoint:unbindUIandKey(arg_44_0.exploreBtn_.transform, RedPointConst.EXPLORE_MAIN)
	manager.redPoint:unbindUIandKey(arg_44_0.cooperationBtn_.transform, RedPointConst.COOPERATION_INVIT)
	manager.redPoint:unbindUIandKey(arg_44_0.sceneBtn_.transform, RedPointConst.SCENE)
	manager.redPoint:unbindUIandKey(arg_44_0.achieveMentBtn_.transform, RedPointConst.ACHIEVEMENT)
	manager.redPoint:unbindUIandKey(arg_44_0.illustratedhandbookBtn_.transform, RedPointConst.ILLU_USER)
	manager.redPoint:unbindUIandKey(arg_44_0.archiveBtn_.transform, RedPointConst.HERO_HEART_STORY_ROOT_FULL)
	manager.redPoint:unbindUIandKey(arg_44_0.attentionBtn_.transform, RedPointConst.FOLLOW_GIFT)
	manager.redPoint:unbindUIandKey(arg_44_0.psqBtn_.transform, RedPointConst.SURVEY)
	manager.redPoint:unbindUIandKey(arg_44_0.forumBtn_.transform, RedPointConst.FORUM_PLATFORM)
	manager.redPoint:unbindUIandKey(arg_44_0.activityBtn_.transform, RedPointConst.OPERATION_ACTIVITY)
	manager.redPoint:unbindUIandKey(arg_44_0.shopBtn_.transform, RedPointConst.SHOP_TAOBAO)
	manager.redPoint:unbindUIandKey(arg_44_0.infomationBtn_.transform, RedPointConst.INFOMATION)
	manager.redPoint:unbindUIandKey(arg_44_0.suggestBtn_.transform, RedPointConst.CUSTOMER_SERVICE_UNREAD)

	if arg_44_0.capsuleToysBtn_ then
		manager.redPoint:unbindUIandKey(arg_44_0.capsuleToysBtn_.transform, RedPointConst.OVERSEA_H5_GAME)
	end
end

function var_0_0.OnTop(arg_45_0)
	return
end

function var_0_0.OnExit(arg_46_0)
	arg_46_0:UnBindRedPointUI()
end

function var_0_0.Dispose(arg_47_0)
	arg_47_0:RemoveAllListeners()
	var_0_0.super.Dispose(arg_47_0)
end

function var_0_0.OnExitInput(arg_48_0)
	arg_48_0:Back()
end

return var_0_0
