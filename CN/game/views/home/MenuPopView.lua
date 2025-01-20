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
	return "Widget/System/Main/MenuUI_new"
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

	arg_4_0.menuList_ = LuaList.New(handler(arg_4_0, arg_4_0.IndexMenuItem), arg_4_0.listGo_, MenuPopItem)
	arg_4_0.menuFunctionList_ = {}
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

		MailData.GetMailListFromServer(var_8_0)
		MailData.ClickMailBtn(manager.time:GetServerTime())
	end)
	arg_5_0:AddBtnListener(arg_5_0.settingBtn_, nil, function()
		JumpTools.GoToSystem("/setting", {
			setType = SettingConst.SETTING_TYPE.SYSTEM
		}, ViewConst.SYSTEM_ID.SETTING)
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
	arg_5_0:AddBtnListener(arg_5_0.sceneBtn_, nil, function()
		local var_15_0 = HomeSceneSettingData:GetCurScene()

		JumpTools.OpenPageByJump("/scenePreview")
	end)
	arg_5_0:AddBtnListener(arg_5_0.userCenterBtn_, nil, function()
		NeedGameUserInfo()
		GameToSDK.GoUserCenter()
		SDKTools.SendMessageToSDK("direction", {
			direction_type = 2,
			direction_channel = 4
		})
	end)

	arg_5_0.menuFunctionList_[MenuPopConst.Servant] = function()
		OperationRecorder.RecordButtonTouch("homepage_expand_1")
		SDKTools.SendMessageToSDK("weapon_servant_touch", {
			touch_times = 1
		})
		JumpTools.OpenPageByJump("/weaponServant")
	end
	arg_5_0.menuFunctionList_[MenuPopConst.Chip] = function()
		OperationRecorder.RecordButtonTouch("homepage_expand_2")
		JumpTools.GoToSystem("/chipManager", nil, ViewConst.SYSTEM_ID.CHIP_MANAGER)
	end
	arg_5_0.menuFunctionList_[MenuPopConst.Illustrated] = function()
		OperationRecorder.RecordButtonTouch("homepage_expand_3")
		JumpTools.GoToSystem("/illustratedMain", nil, ViewConst.SYSTEM_ID.ILLUSTRATION)
	end
	arg_5_0.menuFunctionList_[MenuPopConst.Achieve] = function()
		OperationRecorder.RecordButtonTouch("homepage_expand_4")
		JumpTools.GoToSystem("/achievementManager", nil, ViewConst.SYSTEM_ID.ACHIEVEMENT)
	end
	arg_5_0.menuFunctionList_[MenuPopConst.Explore] = function()
		OperationRecorder.RecordButtonTouch("homepage_expand_5")
		JumpTools.OpenPageByJump("/adminCatExploreView", nil, ViewConst.SYSTEM_ID.ADMIN_CAT_EXPLORE)
	end
	arg_5_0.menuFunctionList_[MenuPopConst.HeartStory] = function()
		OperationRecorder.RecordButtonTouch("homepage_expand_6")
		JumpTools.GoToSystem("/newHeroArchiveView")
	end
	arg_5_0.menuFunctionList_[MenuPopConst.Sign] = function()
		OperationRecorder.RecordButtonTouch("homepage_expand_7")
		JumpTools.OpenPageByJump("sign", {
			check = true,
			activityID = ActivityConst.SIGN
		}, ViewConst.SYSTEM_ID.SIGN)
	end
	arg_5_0.menuFunctionList_[MenuPopConst.Announcement] = function(arg_24_0)
		OperationRecorder.RecordButtonTouch("homepage_expand_8")

		local var_24_0 = arg_24_0:GetBulletinID()

		if var_24_0 == false then
			ShowTips("NO_ANNOUNCEMENT")
		else
			JumpTools.OpenPageByJump("bulletin", {
				bulletinID = var_24_0
			}, ViewConst.SYSTEM_ID.ANNOUNCEMENT)
		end
	end
	arg_5_0.menuFunctionList_[MenuPopConst.Survey] = function()
		OperationRecorder.RecordButtonTouch("homepage_expand_9")
		SurveyAction.SetSurveyRedPointData()
		JumpTools.OpenPageByJump("survey", {
			type = OperationConst.SURVEY_TYPE.NORMAL
		})
		SDKTools.SendMessageToSDK("direction", {
			direction_type = 4,
			direction_channel = 4
		})
	end
	arg_5_0.menuFunctionList_[MenuPopConst.Infomation] = function()
		OperationRecorder.RecordButtonTouch("homepage_expand_17")

		local var_26_0 = {
			userId = PlayerData:GetPlayerInfo().userID,
			signUserId = PlayerData:GetPlayerInfo().signUserId
		}

		OperationAction.OpenOperationUrl("INFORMATION_URL", var_26_0)
		RedPointAction.HandleRedPoint(RED_POINT_ID.INFOMATION)
		manager.redPoint:setTip(RedPointConst.INFOMATION, 0)
	end
	arg_5_0.menuFunctionList_[MenuPopConst.Forum] = function()
		local var_27_0 = {
			userId = PlayerData:GetPlayerInfo().userID,
			signUserId = PlayerData:GetPlayerInfo().signUserId
		}

		if _G.ChannelLoginInfo ~= nil then
			var_27_0.gameAppId = _G.ChannelLoginInfo.channelAppId
			var_27_0.token = _G.ChannelLoginInfo.channelToken
		end

		OperationRecorder.RecordButtonTouch("homepage_expand_12")
		OperationAction.OpenOperationUrl("FORUM_URL", var_27_0)
		RedPointAction.HandleNeedRedPoint(RED_POINT_ID.FORUM)
		SDKTools.SendMessageToSDK("direction", {
			direction_type = 8,
			direction_channel = 4
		})
		manager.redPoint:setTip(RedPointConst.FORUM, 0)
		manager.redPoint:setTip(RedPointConst.FORUM_UNREAD, 0)
	end
	arg_5_0.menuFunctionList_[MenuPopConst.Cdk] = function()
		OperationRecorder.RecordButtonTouch("homepage_expand_11")
		JumpTools.OpenPageByJump("GiftPopUp")
		SDKTools.SendMessageToSDK("direction", {
			direction_type = 7,
			direction_channel = 4
		})
	end
	arg_5_0.menuFunctionList_[MenuPopConst.Attention] = function()
		OperationRecorder.RecordButtonTouch("homepage_expand_10")
		saveData("SDK", "followGift", 0)
		manager.redPoint:setTip(RedPointConst.FOLLOW_GIFT, 0)
		JumpTools.OpenPageByJump("/followGift")
		SDKTools.SendMessageToSDK("direction", {
			direction_type = 5,
			direction_channel = 4
		})
	end
	arg_5_0.menuFunctionList_[MenuPopConst.Shop] = function()
		local var_30_0 = {}

		OperationRecorder.RecordButtonTouch("homepage_expand_14")
		OperationAction.OpenOperationUrl("SHOPPING_URL", var_30_0)
		RedPointAction.HandleNeedRedPoint(RED_POINT_ID.SHOP_TAOBAO)
		manager.redPoint:setTip(RedPointConst.SHOP_TAOBAO, 0)
		SDKTools.SendMessageToSDK("direction", {
			direction_type = 10,
			direction_channel = 4
		})
	end
	arg_5_0.menuFunctionList_[MenuPopConst.Inquery] = function()
		OperationRecorder.RecordButtonTouch("homepage_expand_15")

		local var_31_0 = {
			userId = PlayerData:GetPlayerInfo().userID,
			signUserId = PlayerData:GetPlayerInfo().signUserId
		}

		OperationAction.OpenOperationUrl("INQUERY_URL", var_31_0)
		SDKTools.SendMessageToSDK("direction", {
			direction_type = 6,
			direction_channel = 4
		})
	end
	arg_5_0.menuFunctionList_[MenuPopConst.Suggest] = function()
		OperationRecorder.RecordButtonTouch("homepage_expand_16")
		NeedGameUserInfo()
		SendMessageToSDK("{\"messageType\" : \"StartCustomerService\"}")
		manager.redPoint:setTip(RedPointConst.CUSTOMER_SERVICE_UNREAD, 0)
		SDKTools.SendMessageToSDK("direction", {
			direction_type = 3,
			direction_channel = 4
		})
	end
	arg_5_0.menuFunctionList_[MenuPopConst.Cooperation] = function()
		OperationRecorder.RecordButtonTouch("homepage_expand_19")

		if CooperationAction.CheckCooperationApplyLimit(true) then
			return
		end

		JumpTools.OpenPageByJump("cooperationApply")
	end
	arg_5_0.menuFunctionList_[MenuPopConst.Activity] = function()
		OperationRecorder.RecordButtonTouch("homepage_expand_13")

		local var_34_0 = {
			userId = PlayerData:GetPlayerInfo().userID,
			signUserId = PlayerData:GetPlayerInfo().signUserId
		}

		OperationAction.OpenOperationUrl("ACTIVITY_URL", var_34_0)
		RedPointAction.HandleNeedRedPoint(RED_POINT_ID.ACTIVITY)
		manager.redPoint:setTip(RedPointConst.OPERATION_ACTIVITY, 0)
	end
	arg_5_0.menuFunctionList_[MenuPopConst.OfficialWeb] = function()
		OperationRecorder.RecordButtonTouch("homepage_expand_18")
		OperationAction.OpenOperationUrl("OFFICIAL_URL")
		SDKTools.SendMessageToSDK("direction", {
			direction_type = 1,
			direction_channel = 4
		})
	end
end

function var_0_0.OnEnter(arg_36_0)
	arg_36_0.btnList_ = {}

	arg_36_0:RefreshBtnOpen()
	arg_36_0:RefreshLock()
	arg_36_0.menuList_:StartScroll(#arg_36_0.btnList_)
	arg_36_0:RefreshMusic()
	arg_36_0:BindRedPointUI()
end

function var_0_0.IndexMenuItem(arg_37_0, arg_37_1, arg_37_2)
	local var_37_0 = arg_37_0.btnList_[arg_37_1]

	arg_37_2:SetData(var_37_0, arg_37_0.menuFunctionList_[var_37_0.id])
end

function var_0_0.RefreshBtnOpen(arg_38_0)
	local var_38_0 = OperationData:GetOperationOpenList()
	local var_38_1 = PlayerData:GetPlayerInfo().userLevel

	SetActive(arg_38_0.userCenterBtn_.gameObject, table.keyof(var_38_0, OperationConst.USER_CENTER) ~= nil and var_38_1 >= SystemCfg[var_0_1.userCenter].open_condition[1][2])

	local var_38_2 = clone(MenuPopConst.MenuBtnList)

	for iter_38_0, iter_38_1 in ipairs(var_38_2) do
		if not MenuPopConst.MenuToOperation[iter_38_0] or table.keyof(var_38_0, MenuPopConst.MenuToOperation[iter_38_0]) ~= nil and var_38_1 >= SystemCfg[iter_38_1.systemId].open_condition[1][2] then
			if iter_38_1.id ~= MenuPopConst.Cooperation then
				table.insert(arg_38_0.btnList_, iter_38_1)
			elseif CooperationTools.GetShowInviteRoot() then
				table.insert(arg_38_0.btnList_, iter_38_1)
			end
		end
	end
end

function var_0_0.RefreshLock(arg_39_0)
	for iter_39_0, iter_39_1 in ipairs(arg_39_0.btnList_) do
		if iter_39_1.id == MenuPopConst.Chip then
			iter_39_1.lock = JumpTools.IsSystemLocked(ViewConst.SYSTEM_ID.CHIP_MANAGER)
		elseif iter_39_1.id == MenuPopConst.Explore then
			iter_39_1.lock = JumpTools.IsSystemLocked(ViewConst.SYSTEM_ID.ADMIN_CAT_EXPLORE)
		end
	end
end

function var_0_0.RefreshMusic(arg_40_0)
	local var_40_0 = MusicRecordCfg.all[1]
	local var_40_1 = GetHomeMusicID()

	if var_40_1 ~= 0 and MusicRecordCfg[var_40_1] then
		var_40_0 = var_40_1
	else
		local var_40_2 = manager.audio:GetBgmPlayer()

		if var_40_2 then
			local var_40_3 = var_40_2.cueName or ""
			local var_40_4 = var_40_2.cueSheet or ""

			if var_40_3 ~= "" and var_40_4 ~= "" then
				local var_40_5 = MusicRecordCfg.all

				for iter_40_0, iter_40_1 in ipairs(var_40_5) do
					local var_40_6 = MusicRecordCfg[iter_40_1]

					if var_40_6.cueName == var_40_3 and var_40_6.cuesheet == var_40_4 then
						var_40_0 = iter_40_1
					end
				end
			end
		end
	end

	arg_40_0.musicTxt_.text = GetI18NText(MusicRecordCfg[var_40_0].musicName)
end

function var_0_0.BindRedPointUI(arg_41_0)
	manager.redPoint:bindUIandKey(arg_41_0.settingBtn_.transform, RedPointConst.SETTING_NEW_FUNCTION)
	manager.redPoint:bindUIandKey(arg_41_0.taskBtn_.transform, RedPointConst.TASK)
	manager.redPoint:bindUIandKey(arg_41_0.mailBtn_.transform, RedPointConst.MAIL_UNREAD)
	manager.redPoint:bindUIandKey(arg_41_0.sceneBtn_.transform, RedPointConst.SCENE)
end

function var_0_0.UnBindRedPointUI(arg_42_0)
	manager.redPoint:unbindUIandKey(arg_42_0.settingBtn_.transform, RedPointConst.SETTING_NEW_FUNCTION)
	manager.redPoint:unbindUIandKey(arg_42_0.taskBtn_.transform, RedPointConst.TASK)
	manager.redPoint:unbindUIandKey(arg_42_0.mailBtn_.transform, RedPointConst.MAIL_UNREAD)
	manager.redPoint:unbindUIandKey(arg_42_0.sceneBtn_.transform, RedPointConst.SCENE)
end

function var_0_0.OnTop(arg_43_0)
	return
end

function var_0_0.OnExit(arg_44_0)
	arg_44_0:UnBindRedPointUI()
end

function var_0_0.Dispose(arg_45_0)
	arg_45_0:RemoveAllListeners()

	if arg_45_0.menuList_ then
		arg_45_0.menuList_:Dispose()
	end

	var_0_0.super.Dispose(arg_45_0)
end

function var_0_0.OnExitInput(arg_46_0)
	arg_46_0:Back()
end

return var_0_0
