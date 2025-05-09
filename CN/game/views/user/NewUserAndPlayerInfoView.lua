local var_0_0 = class("NewUserAndPlayerInfoView", ReduxView)
local var_0_1 = 1
local var_0_2 = 860

function var_0_0.UIName(arg_1_0)
	return "Widget/System/UserInfor/UserInfoUInew"
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

	arg_4_0.bgImg_.immediate = true

	local var_4_0 = GameToSDK.CURRENT_SDK_ID == SDK_PLATFORM.DEV or not SDKTools.GetIsOverSea() and _G.CHANNEL_MASTER_ID ~= 1

	SetActive(arg_4_0.userCenterBtn_.gameObject, not var_4_0)
	SetActive(arg_4_0.logoutBtn_.gameObject, var_4_0)

	arg_4_0.curTagList_ = {}
	arg_4_0.tagItem_ = {}
	arg_4_0.tagContentFitter_ = arg_4_0.tagScrollPanel_:GetComponent("ContentSizeFitter")
	arg_4_0.tagCon_ = ControllerUtil.GetController(arg_4_0.transform_, "tag")
	arg_4_0.likeCon_ = ControllerUtil.GetController(arg_4_0.transform_, "like")
	arg_4_0.dormCon_ = ControllerUtil.GetController(arg_4_0.transform_, "dorm")
	arg_4_0.guildCon_ = ControllerUtil.GetController(arg_4_0.transform_, "guild")
	arg_4_0.onlineCon_ = ControllerUtil.GetController(arg_4_0.transform_, "online")
	arg_4_0.newFriendCon_ = ControllerUtil.GetController(arg_4_0.transform_, "newFriend")
	arg_4_0.friendStateCon_ = ControllerUtil.GetController(arg_4_0.transform_, "friendState")
	arg_4_0.stateCon_ = ControllerUtil.GetController(arg_4_0.transform_, "state")
	arg_4_0.systemCon_ = ControllerUtil.GetController(arg_4_0.transform_, "system")
	arg_4_0.signCon_ = arg_4_0.transform_:GetComponent("ControllerExCollection"):GetController("sign")
	arg_4_0.tagSelectPanel_ = TagView.New(arg_4_0.tagSelectPanelGo_)

	arg_4_0.tagSelectPanel_:RegisterClickFunction(handler(arg_4_0, arg_4_0.TagSelectCallback))

	arg_4_0.headPortrait = CommonHeadPortrait.New(arg_4_0.portraitObj_)
end

function var_0_0.AddUIListeners(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.nameBtn_, nil, function()
		if table.keyof(arg_5_0.operationInfo_, OperationConst.CHANGE_NICK) ~= nil then
			ShowTips("ERROR_FUNCTION_STOP")

			return
		end

		JumpTools.OpenPageByJump("changeName")
	end)
	arg_5_0:AddBtnListener(arg_5_0.changeNameBtn_, nil, function()
		if table.keyof(arg_5_0.operationInfo_, OperationConst.CHANGE_NICK) ~= nil then
			ShowTips("ERROR_FUNCTION_STOP")

			return
		end

		JumpTools.OpenPageByJump("changeName")
	end)
	arg_5_0:AddBtnListener(arg_5_0.signBtn_, nil, function()
		arg_5_0.signInput_.text = arg_5_0.sign_

		SetActive(arg_5_0.signInput_.gameObject, true)
		arg_5_0.signInput_:ActivateInputField()
		SetActive(arg_5_0.signTxt_.gameObject, false)
	end)
	arg_5_0.signInput_.onEndEdit:AddListener(function()
		if table.keyof(arg_5_0.operationInfo_, OperationConst.CHANGE_SIGN) ~= nil then
			ShowTips("ERROR_FUNCTION_STOP")
			SetActive(arg_5_0.signInput_.gameObject, false)
			SetActive(arg_5_0.signTxt_.gameObject, true)

			return
		end

		local var_9_0 = arg_5_0.signInput_.text

		if var_9_0 ~= nil and var_9_0 ~= "" and arg_5_0.sign_ == var_9_0 then
			SetActive(arg_5_0.signInput_.gameObject, false)
			SetActive(arg_5_0.signTxt_.gameObject, true)

			return
		end

		local var_9_1, var_9_2 = textLimit(var_9_0, GameSetting.personal_signature_max.value[1])
		local var_9_3 = var_9_1

		if not var_9_2 then
			ShowTips("PERSONAL_SIGNATURE_MAX")
			SetActive(arg_5_0.signInput_.gameObject, false)
			SetActive(arg_5_0.signTxt_.gameObject, true)

			return
		end

		WordVerifyBySDK(var_9_3, function(arg_10_0)
			local var_10_0 = PlayerData:GetPlayerInfo()

			if not arg_10_0 then
				ShowTips("SENSITIVE_WORD")
				arg_5_0:RefreshSign(var_10_0.sign)
				SetActive(arg_5_0.signInput_.gameObject, false)
				SetActive(arg_5_0.signTxt_.gameObject, true)

				return
			end

			if var_10_0.sign == var_9_3 then
				SetActive(arg_5_0.signInput_.gameObject, false)
				SetActive(arg_5_0.signTxt_.gameObject, true)

				return
			end

			local var_10_1 = false

			if var_9_3:find("\n") then
				var_9_3 = string.gsub(var_9_3, "\n", "")
				var_10_1 = true
			end

			PlayerAction.ChangeSign(var_9_3, var_10_1)
		end, JUDGE_MESSAGE_TYPE.PLAYER_SIGN)
	end)
	arg_5_0:AddBtnListener(arg_5_0.logoutBtn_, nil, function()
		ShowMessageBox({
			title = GetTips("PROMPT"),
			content = GetTips("TIP_EXIT_GAME"),
			OkCallback = function()
				OperationRecorder.Record("account_change", "account_change_confirm")
				BulletinData.OnLogout()
				manager.rollTips:OnLogout()
				GameToSDK.Logout()
			end,
			CancelCallback = function()
				OperationRecorder.Record("account_change", "account_change_cancel")
			end
		})
	end)
	arg_5_0:AddBtnListener(arg_5_0.userCenterBtn_, nil, function()
		NeedGameUserInfo()
		GameToSDK.GoUserCenter()
		SDKTools.SendMessageToSDK("direction", {
			direction_type = 2,
			direction_channel = 4
		})
	end)
	arg_5_0:AddBtnListener(arg_5_0.servantbtnBtn_, nil, function()
		OperationRecorder.RecordButtonTouch("userinfo_spirit")
		JumpTools.OpenPageByJump("/illuServantManual")
	end)
	arg_5_0:AddBtnListener(arg_5_0.illustratedAchievementBtn_, nil, function()
		OperationRecorder.RecordButtonTouch("userinfo_achievement")

		if manager.windowBar:GetWhereTag() ~= nil then
			return
		end

		JumpTools.GoToSystem("/achievementManager", nil, ViewConst.SYSTEM_ID.ACHIEVEMENT)
	end)
	arg_5_0.headPortrait:RegisteClickCallback(function()
		if arg_5_0.isForeign_ then
			return
		end

		OperationRecorder.RecordButtonTouch("userinfo_headportrait")
		JumpTools.OpenPageByJump("HeadIconChange", {
			isEnter = true
		})
	end)
	arg_5_0:AddBtnListener(arg_5_0.brithdayBtn_, nil, function()
		JumpTools.OpenPageByJump("BirthdayView")
	end)
	arg_5_0:AddBtnListener(arg_5_0.tagBtn_, nil, function()
		OperationRecorder.RecordButtonTouch("userinfo_usertag")
		arg_5_0:ShowTagView()
	end)
	arg_5_0:AddBtnListener(arg_5_0.hideTagBtn_, nil, function()
		arg_5_0:HideTagView()
		PlayerAction.ChangTagList(arg_5_0.curTagList_)
	end)
	arg_5_0:AddBtnListener(arg_5_0.likeBtn_, nil, function()
		if not arg_5_0.isForeign_ then
			JumpTools.OpenPageByJump("likeInfoPop", {
				index = 1
			})
		else
			if table.indexof(arg_5_0.todaySendLike_, arg_5_0.userID_) or #arg_5_0.todaySendLike_ >= GameSetting.profile_like_limitation.value[1] then
				ShowTips("PROFILE_LIKE_REPEAT_PROMPT")

				return
			end

			PlayerAction.SendLike(arg_5_0.userID_, PlayerAction.SendLikeSrc.PlayerInfo)
		end
	end)
	arg_5_0:AddBtnListener(arg_5_0.copyBtn_, nil, function()
		UnityEngine.GUIUtility.systemCopyBuffer = arg_5_0.userID_

		ShowTips("COPY_SUCCESS")
	end)
	arg_5_0:AddBtnListener(arg_5_0.illustratedStickerBtn_, nil, function()
		OperationRecorder.RecordButtonTouch("userinfo_sticker")

		if arg_5_0.isForeign_ then
			JumpTools.OpenPageByJump("/customStickerMain", {
				foreign = arg_5_0.stickerList_
			})
		else
			JumpTools.OpenPageByJump("/customStickerMain")
		end
	end)
	arg_5_0:AddBtnListener(arg_5_0.illustratedHeroBtn_, nil, function()
		OperationRecorder.RecordButtonTouch("userinfo_hero")
		JumpTools.OpenPageByJump("showHeroPop", {
			userID = arg_5_0.userID_,
			isForeign = arg_5_0.isForeign_,
			heroList = arg_5_0.heroList_
		})
	end)
	arg_5_0:AddBtnListener(arg_5_0.dormBtn_, nil, function()
		if manager.windowBar:GetWhereTag() ~= nil then
			return
		end

		if not arg_5_0.isForeign_ then
			if arg_5_0.dormID_ == 0 then
				local var_25_0 = JumpTools.IsSystemLocked(ViewConst.SYSTEM_ID.DORM)

				ShowTips(JumpTools.GetSystemLockedTip(ViewConst.SYSTEM_ID.DORM, var_25_0))
			else
				local var_25_1 = GameDisplayCfg.dorm_begin_story.value[1]

				if var_25_1 and not manager.story:IsStoryPlayed(var_25_1) then
					manager.story:StartStoryById(var_25_1, function(arg_26_0)
						JumpTools.OpenPageByJump("/dormChooseRoomView")
					end)
				elseif BackHomeCfg[arg_5_0.dormID_].type == DormConst.BACKHOME_TYPE.PublicDorm then
					BackHomeTools:GotoBackHomeRoom(DormConst.PUBLIC_DORM_ID)
				else
					BackHomeTools:GotoBackHomeRoom(arg_5_0.dormID_)
				end
			end
		else
			if not arg_5_0.dormID_ or arg_5_0.dormID_ == 0 then
				ShowTips("PLAYER_DORM_LOCK")

				return
			end

			DormVisitTools:SetIsOtherSystem(true)
			DormVisitTools:SetBackFunc(function()
				OpenPageUntilLoaded("/playerinfo", {
					isForeign = arg_5_0.isForeign_
				})
			end)
			SDKTools.SendMessageToSDK("backhome_dorm_visit_jump", {
				backhome_source = 1
			})
			DormAction:OtherSystemAskSingleFurTemplateExhibit(arg_5_0.userID_)
		end
	end)
	arg_5_0:AddBtnListener(arg_5_0.guildBtn_, nil, function()
		if JumpTools.IsSystemOperationStoped(ViewConst.SYSTEM_ID.GUILD) then
			ShowTips("ERROR_FUNCTION_STOP")

			return
		end

		local var_28_0 = JumpTools.IsSystemLocked(ViewConst.SYSTEM_ID.GUILD)

		if not arg_5_0.isForeign_ and var_28_0 then
			ShowTips(JumpTools.GetSystemLockedTip(ViewConst.SYSTEM_ID.GUILD, var_28_0))

			return
		end

		if GuildData.IsGuildValid(arg_5_0.guildID_) then
			ForeignInfoAction:SearchGuildInfo(arg_5_0.guildID_, 1)
		end
	end)
	arg_5_0:AddBtnListener(arg_5_0.buttonAdd_, nil, function()
		if arg_5_0.newFriendCon_:GetSelectedState() == "1" then
			ShowTips("PROFILE_FRIENDS_APPLYING")

			return
		end

		FriendsAction:TryToRequestToFriend(arg_5_0.userID_, FriendConst.ADD_FRIEND_SOURCE.PLAYER_INFO)
		arg_5_0.newFriendCon_:SetSelectedState(1)
	end)
	arg_5_0:AddBtnListener(arg_5_0.buttonTalk_, nil, function()
		if not FriendsData:GetFreshFlag() then
			FriendsAction:TryToRefreshFriendsView(1, function()
				ChatFriendData:AddCacheFriend(arg_5_0.userID_)
				JumpTools.OpenPageByJump("chat", {
					ignoreBG = true,
					chatToggleID = ChatConst.CHAT_CHANNEL_FRIEND,
					friendID = arg_5_0.userID_
				}, ViewConst.SYSTEM_ID.CHAT)
			end)

			return
		end

		ChatFriendData:AddCacheFriend(arg_5_0.userID_)
		JumpTools.OpenPageByJump("chat", {
			ignoreBG = true,
			chatToggleID = ChatConst.CHAT_CHANNEL_FRIEND,
			friendID = arg_5_0.userID_
		}, ViewConst.SYSTEM_ID.CHAT)
	end)
	arg_5_0:AddBtnListener(arg_5_0.buttonDeleteFriend_, nil, function()
		ShowMessageBox({
			title = GetTips("PROMPT"),
			content = string.format(GetTips("FRIEND_DELETE_QUEST"), arg_5_0.nick_),
			OkCallback = function()
				FriendsAction:TryToDelectFromMyFriendsList(arg_5_0.userID_)
				arg_5_0:Back()
			end
		})
	end)
	arg_5_0:AddBtnListener(arg_5_0.buttonMore_, nil, function()
		if arg_5_0.isPop_ then
			arg_5_0.isPop_ = false

			arg_5_0:HidePop()

			return
		end

		SetActive(arg_5_0.goPop_, true)
		arg_5_0:AddClickTimer()

		arg_5_0.isPop_ = true
	end)
	arg_5_0:AddBtnListener(arg_5_0.buttonReport_, nil, function()
		JumpTools.OpenPageByJump("chatReport", {
			reportType = ChatConst.CHAT_REPORT_TYPE.USER,
			reportData = {
				nick = arg_5_0.nick_,
				userID = arg_5_0.userID_
			}
		}, ViewConst.SYSTEM_ID.CHAT_REPORT)
	end)
	arg_5_0:AddBtnListener(arg_5_0.buttonBlackList_, nil, function()
		ShowMessageBox({
			title = GetTips("PROMPT"),
			content = string.format(GetTips("FRIEND_MOVE_TO_BLACLIST_QUEST"), arg_5_0.nick_),
			OkCallback = function()
				FriendsAction:TryToAddToBlacklist(arg_5_0.userID_)
				arg_5_0:Back()
			end
		})
	end)
end

local function var_0_3()
	local var_38_0 = ForeignInfoData:GetCurForeignDetailInfo()
	local var_38_1 = var_38_0.post_background_id

	if HomeSceneSettingCfg[var_38_1].limit_display == 0 then
		local var_38_2 = SkinSceneActionCfg.get_id_list_by_special_scene_id[var_38_1]

		if var_38_2 and var_38_2[1] ~= var_38_0.postGril then
			print("好友dlc场景和角色不匹配! 替换为默认场景")

			local var_38_3 = GameSetting.home_sence_default.value

			var_38_1 = var_38_3[#var_38_3]
		end
	end

	if var_38_1 == 0 then
		var_38_1 = GameSetting.home_sence_default.value[2]
	end

	return var_38_1
end

function var_0_0.ReserveCameraEnter(arg_39_0)
	if arg_39_0.params_.maskScene then
		return
	end

	local var_39_0

	if arg_39_0.params_.isForeign then
		var_39_0 = var_0_3()
	else
		var_39_0 = HomeSceneSettingData:GetCurScene()
	end

	local var_39_1 = manager.loadScene:GetHomeShouldLoadSceneName(var_39_0)

	manager.loadScene:SetSceneActive(var_39_1, true)
end

function var_0_0.OnEnter(arg_40_0)
	arg_40_0.isForeign_ = arg_40_0.params_.isForeign

	SetActive(arg_40_0.likeAddGo_, false)
	arg_40_0:HideTagView()
	arg_40_0:RefreshUI()
end

function var_0_0.RefreshUI(arg_41_0)
	if not arg_41_0.isForeign_ then
		arg_41_0.stateCon_:SetSelectedState("user")
		arg_41_0.signCon_:SetSelectedIndex(1)
		arg_41_0:BindRedPoint()

		arg_41_0.operationInfo_ = OperationData:GetOperationOpenList()

		arg_41_0:RefreshUserData()
		arg_41_0:RefreshExpInfo(arg_41_0.lv_, arg_41_0.exp_)
	else
		arg_41_0.stateCon_:SetSelectedState("player")
		arg_41_0:HidePop()
		arg_41_0:RefreshPlayerData()
		arg_41_0:RefreshFriendState()
		arg_41_0:RefreshOnlineState()

		local var_41_0 = FriendsData:IsFriend(arg_41_0.userID_)

		arg_41_0.signCon_:SetSelectedIndex(var_41_0 and 1 or 0)
	end

	arg_41_0:RefreshSystem()
	arg_41_0:RefreshBtn()
	arg_41_0:RefreshIP(arg_41_0.ip_)
	arg_41_0:RefreshID(arg_41_0.userID_)
	arg_41_0:RefreshName(arg_41_0.nick_)
	SetActive(arg_41_0.signInput_.gameObject, false)
	SetActive(arg_41_0.signTxt_.gameObject, true)
	arg_41_0:RefreshSign(arg_41_0.sign_)
	arg_41_0:RefreshLvInfo(arg_41_0.lv_)
	arg_41_0:RefreshHead(arg_41_0.headIconID_)
	arg_41_0:RefreshFrame(arg_41_0.iconFrameID_)
	arg_41_0:RefreshGuild(arg_41_0.guildID_, arg_41_0.guildName_, arg_41_0.guildIcon_)
	arg_41_0:RefreshBirthday()
	arg_41_0:RefreshTag(arg_41_0.tagList_)
	arg_41_0:RefreshCardBg(arg_41_0.cardBg_)
	arg_41_0:RefreshDorm(arg_41_0.dormID_, arg_41_0.dormName_)
	arg_41_0:RefreshAchievement()
	arg_41_0:RefreshLike(arg_41_0.likeCnt_)

	if not arg_41_0.params_.maskScene then
		arg_41_0:RefreshGirl(arg_41_0.postGirl_)
		arg_41_0:RefreshScene()
	end

	arg_41_0:RefreshBgImage()
end

function var_0_0.RefreshUserData(arg_42_0)
	local var_42_0 = PlayerData:GetPlayerInfo()

	arg_42_0.ip_ = var_42_0.ip
	arg_42_0.nick_ = var_42_0.nick
	arg_42_0.sign_ = var_42_0.sign
	arg_42_0.lv_ = var_42_0.userLevel
	arg_42_0.userID_ = var_42_0.userID
	arg_42_0.exp_ = var_42_0.remain_exp
	arg_42_0.headIconID_ = var_42_0.portrait
	arg_42_0.iconFrameID_ = var_42_0.icon_frame
	arg_42_0.birthdayMonth_ = var_42_0.birthday_month
	arg_42_0.birthdayDay_ = var_42_0.birthday_day
	arg_42_0.likeCnt_ = var_42_0.likes
	arg_42_0.cardBg_ = var_42_0.card_bg_id
	arg_42_0.tagList_ = PlayerData:GetUsingTagListInfo()

	local var_42_1 = var_42_0.poster_girl

	arg_42_0.postGirl_ = HeroTools.HeroUsingSkinInfo(var_42_1).id

	local var_42_2 = GuildData:GetGuildInfo()

	if var_42_2 and var_42_2.id and var_42_2.name then
		arg_42_0.guildID_ = var_42_2.id
		arg_42_0.guildName_ = var_42_2.name
		arg_42_0.guildIcon_ = var_42_2.icon
	else
		arg_42_0.guildID_ = GuildData.INVALID_GUILD
		arg_42_0.guildName_ = ""
		arg_42_0.guildIcon_ = 0
	end

	arg_42_0.dormID_ = 0
	arg_42_0.dormName_ = ""

	if not JumpTools.IsSystemLocked(ViewConst.SYSTEM_ID.DORM) then
		local var_42_3 = DormVisitTools:GetCurTemplateExhibit()

		arg_42_0.dormID_ = var_42_3 == 0 and DormConst.PUBLIC_DORM_ID or var_42_3

		if BackHomeCfg[arg_42_0.dormID_].type == DormConst.BACKHOME_TYPE.PublicDorm then
			arg_42_0.dormName_ = GetTips("DORM_LOBBY_NAME")
		else
			local var_42_4 = DormitoryData:GetDormSceneData(arg_42_0.dormID_).archiveIDList[1]
			local var_42_5 = HeroRecordCfg.get_id_list_by_hero_id[var_42_4][1]

			if var_42_5 then
				local var_42_6 = HeroRecordCfg[var_42_5].name

				if var_42_6 then
					arg_42_0.dormName_ = string.format(GetTips("DORM_HERO_ROOM_NAME"), var_42_6)
				end
			end
		end
	end

	arg_42_0.heroList_ = {}

	local var_42_7 = PlayerData:GetHeroShowList()

	for iter_42_0, iter_42_1 in ipairs(var_42_7) do
		local var_42_8 = HeroData:GetHeroData(iter_42_1)

		arg_42_0.heroList_[iter_42_0] = {}
		arg_42_0.heroList_[iter_42_0].hero_id = iter_42_1
		arg_42_0.heroList_[iter_42_0].star = var_42_8.star
		arg_42_0.heroList_[iter_42_0].level = var_42_8.level
		arg_42_0.heroList_[iter_42_0].using_skin = var_42_8.using_skin
	end

	arg_42_0.stickerList_ = var_42_0.sticker_show_info
	arg_42_0.stickerBg_ = var_42_0.sticker_background
	arg_42_0.heroAll_ = 0
	arg_42_0.heroNum_ = HeroData:GetHeroNum()

	local var_42_9 = HideInfoData:GetHeadIconHideList()
	local var_42_10 = HeroCfg.get_id_list_by_private[0]

	for iter_42_2, iter_42_3 in ipairs(var_42_10) do
		if not var_42_9[iter_42_3] then
			arg_42_0.heroAll_ = arg_42_0.heroAll_ + 1
		end
	end

	arg_42_0.weaponServantAll_ = 0
	arg_42_0.weaponServantNum_ = table.length(IllustratedData:GetServantInfo())

	for iter_42_4, iter_42_5 in ipairs(WeaponServantCfg.all) do
		local var_42_11 = IllustratedData:GetServantInfo()[iter_42_5]

		if not ServantTools.GetIsHide(iter_42_5) and (var_42_11 or WeaponServantCfg[iter_42_5].display_type ~= 1) then
			arg_42_0.weaponServantAll_ = arg_42_0.weaponServantAll_ + 1
		end
	end

	arg_42_0.stickerAll_ = #PlayerData:GetStickerList(true) + #PlayerData:GetStickerBgList(true) + #PlayerData:GetStickerFgList(true)
	arg_42_0.stickerNum_ = #PlayerData:GetStickerList() + #PlayerData:GetStickerBgList() + #PlayerData:GetStickerFgList()
	arg_42_0.achieveAll_ = AchievementData:GetAchievementTotalCnt()
	arg_42_0.achieveNum_ = AchievementData:GetFinishAchievementCnt()
end

function var_0_0.RefreshPlayerData(arg_43_0)
	local var_43_0 = ForeignInfoData:GetCurForeignDetailInfo()

	arg_43_0.ip_ = var_43_0.ip
	arg_43_0.nick_ = var_43_0.nick
	arg_43_0.sign_ = var_43_0.sign
	arg_43_0.lv_ = var_43_0.level
	arg_43_0.userID_ = var_43_0.user_id
	arg_43_0.headIconID_ = var_43_0.icon
	arg_43_0.iconFrameID_ = var_43_0.icon_frame
	arg_43_0.isOnline_ = var_43_0.is_online
	arg_43_0.likeCnt_ = var_43_0.likes
	arg_43_0.cardBg_ = var_43_0.card_bg_id
	arg_43_0.tagList_ = var_43_0.used_tag_list
	arg_43_0.postGirl_ = var_43_0.postGril
	arg_43_0.guildID_ = var_43_0.guildID
	arg_43_0.guildName_ = var_43_0.guildName
	arg_43_0.guildIcon_ = var_43_0.guildIcon
	arg_43_0.dormID_ = var_43_0.backhome_architecture_id
	arg_43_0.dormName_ = ""

	if arg_43_0.dormID_ ~= 0 then
		if BackHomeCfg[arg_43_0.dormID_].type == DormConst.BACKHOME_TYPE.PublicDorm then
			arg_43_0.dormName_ = GetTips("DORM_LOBBY_NAME")
		else
			local var_43_1 = var_43_0.hero_id_list
			local var_43_2 = HeroRecordCfg.get_id_list_by_hero_id[var_43_1[1]][1]

			arg_43_0.dormName_ = string.format(GetTips("DORM_HERO_ROOM_NAME"), HeroRecordCfg[var_43_2].name)
		end
	end

	arg_43_0.heroList_ = {}

	local var_43_3 = var_43_0.hero_list

	for iter_43_0, iter_43_1 in ipairs(var_43_3) do
		arg_43_0.heroList_[iter_43_0] = {}
		arg_43_0.heroList_[iter_43_0].hero_id = iter_43_1.hero_id
		arg_43_0.heroList_[iter_43_0].star = iter_43_1.star
		arg_43_0.heroList_[iter_43_0].level = 0
		arg_43_0.heroList_[iter_43_0].using_skin = iter_43_1.using_skin
	end

	arg_43_0.stickerList_ = var_43_0.sticker_show_info
	arg_43_0.stickerBg_ = var_43_0.sticker_background

	local var_43_4 = var_43_0.hero_static_info

	arg_43_0.heroNum_ = var_43_4.not_hide_num + var_43_4.hide_num
	arg_43_0.heroAll_ = 0

	local var_43_5 = HideInfoData:GetHeadIconHideList()
	local var_43_6 = HeroCfg.get_id_list_by_private[0]

	for iter_43_2, iter_43_3 in ipairs(var_43_6) do
		if not var_43_5[iter_43_3] then
			arg_43_0.heroAll_ = arg_43_0.heroAll_ + 1
		end
	end

	arg_43_0.heroAll_ = arg_43_0.heroAll_ + var_43_4.cfg_hide_num

	local var_43_7 = var_43_0.weapon_servant_static_info

	arg_43_0.weaponServantNum_ = var_43_7.not_hide_num + var_43_7.hide_num
	arg_43_0.weaponServantAll_ = 0

	for iter_43_4, iter_43_5 in ipairs(WeaponServantCfg.all) do
		if not ServantTools.GetIsHide(iter_43_5) and WeaponServantCfg[iter_43_5].display_type ~= 1 then
			arg_43_0.weaponServantAll_ = arg_43_0.weaponServantAll_ + 1
		end
	end

	arg_43_0.weaponServantAll_ = arg_43_0.weaponServantAll_ + var_43_7.cfg_hide_num

	local var_43_8 = var_43_0.sticker_static_info
	local var_43_9 = var_43_0.sticker_background_static_info
	local var_43_10 = var_43_0.sticker_foreground_static_info

	arg_43_0.stickerNum_ = var_43_8.not_hide_num + var_43_8.cfg_hide_num + var_43_9.not_hide_num + var_43_10.not_hide_num
	arg_43_0.stickerAll_ = #ItemCfg.get_id_list_by_sub_type[ItemConst.ITEM_SUB_TYPE.NORMAL_STICKER] + var_43_8.cfg_hide_num + #PlayerData:GetStickerBgList(true) + #PlayerData:GetStickerFgList(true)

	local var_43_11 = var_43_0.achievement_static_info

	arg_43_0.achieveNum_ = var_43_11.not_hide_num
	arg_43_0.achieveAll_ = 0

	for iter_43_6, iter_43_7 in ipairs(AchievementCfg.all) do
		local var_43_12 = false
		local var_43_13 = AchievementCfg[iter_43_7].system

		if type(var_43_13) == "table" then
			for iter_43_8, iter_43_9 in ipairs(var_43_13) do
				if SystemCfg[iter_43_9].system_hide == 1 then
					var_43_12 = true

					break
				end
			end
		end

		if AchievementCfg[iter_43_7].is_hide ~= 1 and not var_43_12 then
			arg_43_0.achieveAll_ = arg_43_0.achieveAll_ + 1
		end
	end

	arg_43_0.achieveAll_ = arg_43_0.achieveAll_ + var_43_11.cfg_hide_num
	arg_43_0.todaySendLike_ = PlayerData:GetTodaySendLikeList() or {}
end

function var_0_0.RefreshSystem(arg_44_0)
	arg_44_0.systemCon_:SetSelectedState(manager.windowBar:GetWhereTag() == nil and "on" or "off")
end

function var_0_0.RefreshBtn(arg_45_0)
	arg_45_0.signBtn_.interactable = not arg_45_0.isForeign_
	arg_45_0.nameBtn_.interactable = not arg_45_0.isForeign_
	arg_45_0.changeNameBtn_.interactable = not arg_45_0.isForeign_
	arg_45_0.servantbtnBtn_.interactable = not arg_45_0.isForeign_
	arg_45_0.illustratedAchievementBtn_.interactable = not arg_45_0.isForeign_
end

function var_0_0.RefreshExpInfo(arg_46_0, arg_46_1, arg_46_2)
	if LvTools.GetIsMaxLv(arg_46_1, "user") then
		arg_46_0.expTxt_.text = "-/-"
		arg_46_0.progressTrs_.value = 1
	else
		local var_46_0 = GameLevelSetting[arg_46_1].user_level_exp

		arg_46_0.expTxt_.text = string.format("%d/%d", arg_46_2, var_46_0)
		arg_46_0.progressTrs_.value = arg_46_2 / var_46_0
	end
end

function var_0_0.RefreshFriendState(arg_47_0)
	local var_47_0 = FriendsData:GetInfoByID(arg_47_0.userID_)

	if var_47_0 then
		local var_47_1 = var_47_0.relationship

		if var_47_1 == FriendsConst.FRIEND_TYPE.MY_FRIENDS then
			arg_47_0.friendStateCon_:SetSelectedState("myFriend")
		elseif var_47_1 == FriendsConst.FRIEND_TYPE.NEW_FRIENDS or var_47_1 == FriendsConst.FRIEND_TYPE.SEARCH then
			arg_47_0.friendStateCon_:SetSelectedState("newFriend")
			arg_47_0.newFriendCon_:SetSelectedState(var_47_0.isDeal and 1 or 0)
		elseif var_47_1 == FriendsConst.FRIEND_TYPE.FRIEND_REQUESTS then
			arg_47_0.friendStateCon_:SetSelectedState("request")
			arg_47_0.newFriendCon_:SetSelectedState(1)
		end
	else
		arg_47_0.friendStateCon_:SetSelectedState("newFriend")
		arg_47_0.newFriendCon_:SetSelectedState(FriendsData:IsInRequest(arg_47_0.userID_) and 1 or 0)
	end
end

function var_0_0.RefreshOnlineState(arg_48_0)
	arg_48_0.onlineCon_:SetSelectedState(arg_48_0.isOnline_ == 1 and "on" or "off")
end

function var_0_0.RefreshIP(arg_49_0, arg_49_1)
	SetActive(arg_49_0.ipGo_, GameToSDK.CURRENT_SERVER == AreaConst.CHINA)

	arg_49_0.ipTxt_.text = arg_49_1

	if arg_49_0.ipGo_.activeSelf then
		UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_49_0.ipGo_.transform)
	end
end

function var_0_0.RefreshID(arg_50_0, arg_50_1)
	arg_50_0.uid_.text = arg_50_1
end

function var_0_0.RefreshName(arg_51_0, arg_51_1)
	if not OperationData:IsOperationOpen(OperationConst.MANUAL_WORD_VERIFY) then
		local var_51_0, var_51_1 = wordVerify(arg_51_1, {
			isReplace = true
		})

		arg_51_0.name_.text = var_51_1
	else
		arg_51_0.name_.text = arg_51_1
	end

	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_0.namePanel_)
end

function var_0_0.RefreshSign(arg_52_0, arg_52_1)
	arg_52_1 = string.gsub(arg_52_1, "\n", "")

	if not OperationData:IsOperationOpen(OperationConst.MANUAL_WORD_VERIFY) then
		local var_52_0, var_52_1 = wordVerify(arg_52_1, {
			isReplace = true
		})

		arg_52_0.signTxt_.text = var_52_1 == "" and GetTips("PROFILE_PERSONAL_PROFILE_DEFAULT") or var_52_1
	else
		arg_52_0.signTxt_.text = arg_52_1 == "" and GetTips("PROFILE_PERSONAL_PROFILE_DEFAULT") or arg_52_1
	end
end

function var_0_0.RefreshHead(arg_53_0, arg_53_1)
	arg_53_0.headPortrait:RenderHead(arg_53_1)
end

function var_0_0.RefreshFrame(arg_54_0, arg_54_1)
	arg_54_0.headPortrait:RenderFrame(arg_54_1)
end

function var_0_0.RefreshLvInfo(arg_55_0, arg_55_1)
	arg_55_0.lvTxt_.text = arg_55_1
end

function var_0_0.RefreshGuild(arg_56_0, arg_56_1, arg_56_2, arg_56_3)
	if arg_56_1 == 0 or arg_56_1 == "0" then
		arg_56_0.guildCon_:SetSelectedState("false")
	else
		arg_56_0.guildTxt_.text = arg_56_2

		local var_56_0 = ClubHeadIconCfg[arg_56_3]

		if var_56_0 then
			arg_56_0.guildIconImg_.sprite = getSpriteViaConfig("ClubHeadIcon", var_56_0.icon_bg)
		end

		arg_56_0.guildCon_:SetSelectedState("true")
	end
end

function var_0_0.RefreshBirthday(arg_57_0)
	SetActive(arg_57_0.birthdayPanelGo_, not arg_57_0.isForeign_)

	if arg_57_0.birthdayDay_ == 0 then
		SetActive(arg_57_0.brithdayBtn_.gameObject, not arg_57_0.isForeign_)
		SetActive(arg_57_0.brithdayTxt_.gameObject, false)
	else
		SetActive(arg_57_0.brithdayBtn_.gameObject, false)
		SetActive(arg_57_0.brithdayTxt_.gameObject, true)

		arg_57_0.brithdayTxt_.text = string.format(GetTips("OTHER_BIRTHDAY"), arg_57_0.birthdayMonth_, arg_57_0.birthdayDay_)
	end
end

function var_0_0.RefreshDorm(arg_58_0, arg_58_1, arg_58_2)
	if arg_58_1 == 0 then
		arg_58_0.dormCon_:SetSelectedState("false")
	else
		arg_58_0.dormText_.text = arg_58_2

		arg_58_0.dormCon_:SetSelectedState("true")
	end
end

function var_0_0.RefreshTag(arg_59_0, arg_59_1)
	arg_59_0.curTagList_ = arg_59_1

	arg_59_0.tagCon_:SetSelectedState(#arg_59_1 > 0 and "off" or "on")
	arg_59_0:StopTagScroll()

	for iter_59_0, iter_59_1 in ipairs(arg_59_1) do
		if not arg_59_0.tagItem_[iter_59_0] then
			local var_59_0 = Object.Instantiate(arg_59_0.tagTemplate_, arg_59_0.tagContent_)

			arg_59_0.tagItem_[iter_59_0] = NewUserAndPlayerInfoTagItem.New(var_59_0)
		end

		arg_59_0.tagItem_[iter_59_0]:SetData(iter_59_1)
	end

	for iter_59_2 = #arg_59_1 + 1, #arg_59_0.tagItem_ do
		arg_59_0.tagItem_[iter_59_2]:Show(false)
	end

	local var_59_1 = var_0_2

	LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_0.tagPanel_)

	if var_59_1 >= arg_59_0.tagContent_.transform.rect.width then
		arg_59_0.tagContentFitter_.horizontalFit = ContentSizeFitter.FitMode.PreferredSize

		LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_0.tagScrollPanel_)
	else
		arg_59_0.tagContentFitter_.horizontalFit = ContentSizeFitter.FitMode.Unconstrained
		arg_59_0.tagScrollPanel_.sizeDelta = Vector2(var_59_1, arg_59_0.tagScrollPanel_.sizeDelta.y)
		arg_59_0.tagContent_.anchoredPosition = Vector3.New(0, arg_59_0.tagContent_.anchoredPosition.y, 0)

		if arg_59_0.isTagShow_ then
			return
		end

		arg_59_0.tagScrollTimer_ = FuncTimerManager.inst:CreateFuncFrameTimer(function()
			if arg_59_0.tagContent_.anchoredPosition.x <= -1 * arg_59_0.tagContent_.transform.rect.width then
				arg_59_0.tagContent_.anchoredPosition = Vector3.New(var_59_1, arg_59_0.tagContent_.anchoredPosition.y, 0)
			end

			arg_59_0.tagContent_.anchoredPosition = Vector3.New(arg_59_0.tagContent_.anchoredPosition.x - var_0_1, arg_59_0.tagContent_.anchoredPosition.y, 0)
		end, -1, true)
	end
end

function var_0_0.RefreshCardBg(arg_61_0, arg_61_1)
	local var_61_0 = ProfileDecorateItemCfg[arg_61_1]
	local var_61_1 = var_61_0.resource

	if var_61_0.type == 1 then
		arg_61_0.cardBgIcon_.sprite = pureGetSpriteWithoutAtlas("TextureConfig/UserInfor/" .. var_61_1)
	elseif var_61_0.type == 2 then
		-- block empty
	elseif var_61_0.type == 3 then
		-- block empty
	end
end

function var_0_0.RefreshAchievement(arg_62_0)
	arg_62_0.heroTxt_.text = arg_62_0.heroNum_ .. "/" .. arg_62_0.heroAll_

	if arg_62_0.heroNum_ == arg_62_0.heroAll_ then
		arg_62_0.heroPre_.text = "100%"
	else
		arg_62_0.heroPre_.text = math.floor(arg_62_0.heroNum_ * 100 / arg_62_0.heroAll_) .. "%"
	end

	arg_62_0.stickerTxt_.text = arg_62_0.stickerNum_ .. "/" .. arg_62_0.stickerAll_

	if arg_62_0.stickerNum_ == arg_62_0.stickerAll_ then
		arg_62_0.stickerPre_.text = "100%"
	else
		arg_62_0.stickerPre_.text = math.floor(arg_62_0.stickerNum_ * 100 / arg_62_0.stickerAll_) .. "%"
	end

	arg_62_0.weaponServantTxt_.text = arg_62_0.weaponServantNum_ .. "/" .. arg_62_0.weaponServantAll_

	if arg_62_0.weaponServantNum_ == arg_62_0.weaponServantAll_ then
		arg_62_0.weaponServantPre_.text = "100%"
	else
		arg_62_0.weaponServantPre_.text = math.floor(arg_62_0.weaponServantNum_ * 100 / arg_62_0.weaponServantAll_) .. "%"
	end

	arg_62_0.achieveTxt_.text = arg_62_0.achieveNum_ .. "/" .. arg_62_0.achieveAll_

	if arg_62_0.achieveNum_ == arg_62_0.achieveAll_ then
		arg_62_0.achievePre_.text = "100%"
	else
		arg_62_0.achievePre_.text = math.floor(arg_62_0.achieveNum_ * 100 / arg_62_0.achieveAll_) .. "%"
	end
end

function var_0_0.RefreshLike(arg_63_0, arg_63_1)
	if arg_63_1 >= 10000 then
		arg_63_0.like_.text = string.format("%.1f", arg_63_1 / 1000) .. "K"
	else
		arg_63_0.like_.text = arg_63_1
	end

	if not arg_63_0.isForeign_ then
		arg_63_0.likeCon_:SetSelectedState("on")
	else
		arg_63_0.likeCon_:SetSelectedState(table.indexof(arg_63_0.todaySendLike_, arg_63_0.userID_) and "off" or "on")
	end
end

function var_0_0.RefreshGirl(arg_64_0, arg_64_1)
	if arg_64_0.isForeign_ then
		if arg_64_1 == 0 then
			arg_64_1 = 1084
		end

		manager.posterGirl:SetViewTag(PosterGirlConst.ViewTag.playerInfo_other, arg_64_1)
	else
		manager.posterGirl:SetViewTag(PosterGirlConst.ViewTag.playerInfo)
	end
end

function var_0_0.RefreshScene(arg_65_0)
	if not arg_65_0.isForeign_ then
		local var_65_0 = HomeSceneSettingData:GetCurScene()

		if CameraCfg["t0_playerInfo_" .. var_65_0] and PosterGirlConst.PosterGirlTag.t0 == manager.posterGirl:GetTag() then
			manager.ui:SetMainCamera("t0_playerInfo_" .. var_65_0)
		elseif CameraCfg["playerInfo_" .. var_65_0] then
			manager.ui:SetMainCamera("playerInfo_" .. var_65_0)
		else
			manager.ui:SetMainCamera("playerInfo", false, false)
		end
	else
		local var_65_1 = var_0_3()

		manager.loadScene:SetSceneDisableAutoChange(true)

		local var_65_2 = manager.loadScene:GetHomeShouldLoadSceneName(var_65_1)

		manager.loadScene:SetSceneDisableAutoChange(false)

		local var_65_3 = "UI/Common/BackgroundQuad"

		arg_65_0:DestoryBackGround()

		arg_65_0.backGround_ = manager.resourcePool:Get(var_65_3, ASSET_TYPE.SCENE)
		arg_65_0.backGroundTrs_ = arg_65_0.backGround_.transform

		local var_65_4 = GameSetting.profile_other_players_coordinate.value

		arg_65_0.backGroundTrs_:SetParent(manager.ui.mainCamera.transform)

		arg_65_0.backGroundTrs_.localPosition = Vector3(var_65_4[1], var_65_4[2], var_65_4[3])
		arg_65_0.backGroundTrs_.localEulerAngles = Vector3(0, 0, 0)
		arg_65_0.backGroundTrs_.localScale = Vector3(11, 11, 1)
		arg_65_0.backGroundTrs_:Find("pic_background1"):GetComponent("SpriteRenderer").sprite = pureGetSpriteWithoutAtlas("TextureConfig/BackgroundQuad/" .. var_65_2)

		manager.ui:SetMainCamera("playerInfo", false, true)
	end
end

function var_0_0.TagSelectCallback(arg_66_0, arg_66_1)
	arg_66_0:RefreshTag(arg_66_1)
end

function var_0_0.HidePop(arg_67_0)
	SetActive(arg_67_0.goPop_, false)
end

function var_0_0.ShowTagView(arg_68_0)
	PlayerData:DealOverdueTagList()
	PlayerData:ClearTagRed()

	arg_68_0.isTagShow_ = true

	arg_68_0.tagSelectPanel_:Show(true)
	arg_68_0.tagSelectPanel_:RefreshUI()
	SetActive(arg_68_0.hideTagBtn_.gameObject, true)
	arg_68_0:RefreshTag(arg_68_0.curTagList_)
end

function var_0_0.HideTagView(arg_69_0)
	arg_69_0.isTagShow_ = false

	arg_69_0.tagSelectPanel_:Show(false)
	SetActive(arg_69_0.hideTagBtn_.gameObject, false)
end

function var_0_0.AddClickTimer(arg_70_0)
	arg_70_0:StopTimer()

	arg_70_0.buttonUp_ = 0
	arg_70_0.clickTimer_ = FuncTimerManager.inst:CreateFuncFrameTimer(function()
		if Input.GetMouseButtonUp(0) then
			arg_70_0.buttonUp_ = arg_70_0.buttonUp_ + 1

			if arg_70_0.buttonUp_ >= 2 then
				arg_70_0:HidePop()
				FuncTimerManager.inst:RemoveFuncTimer(arg_70_0.clickTimer_)

				arg_70_0.clickTimer_ = nil
			end
		end
	end, -1, true)
end

function var_0_0.StopTimer(arg_72_0)
	if arg_72_0.clickTimer_ then
		FuncTimerManager.inst:RemoveFuncTimer(arg_72_0.clickTimer_)

		arg_72_0.clickTimer_ = nil
	end
end

function var_0_0.StopTagScroll(arg_73_0)
	if arg_73_0.tagScrollTimer_ then
		FuncTimerManager.inst:RemoveFuncTimer(arg_73_0.tagScrollTimer_)

		arg_73_0.tagScrollTimer_ = nil
	end
end

function var_0_0.BindRedPoint(arg_74_0)
	manager.redPoint:bindUIandKey(arg_74_0.brithdayBtn_.transform, RedPointConst.BRITHDAY)
	manager.redPoint:bindUIandKey(arg_74_0.stickerRedPanel_, RedPointConst.CUSTOM_STICKER_ROOT)
	manager.redPoint:bindUIandKey(arg_74_0.portraitObj_.transform, RedPointConst.USER_CUSTOM)
	manager.redPoint:bindUIandKey(arg_74_0.tagBtn_.transform, RedPointConst.TAG)
end

function var_0_0.UnbindRedPoint(arg_75_0)
	manager.redPoint:unbindUIandKey(arg_75_0.brithdayBtn_.transform, RedPointConst.BRITHDAY)
	manager.redPoint:unbindUIandKey(arg_75_0.stickerRedPanel_, RedPointConst.CUSTOM_STICKER_ROOT)
	manager.redPoint:unbindUIandKey(arg_75_0.portraitObj_.transform, RedPointConst.USER_CUSTOM)
	manager.redPoint:unbindUIandKey(arg_75_0.tagBtn_.transform, RedPointConst.TAG)
end

function var_0_0.OnTop(arg_76_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR
	})
	manager.windowBar:RegistBackCallBack(function()
		JumpTools.Back(nil, {
			userID = arg_76_0.userID_
		})
	end)
end

function var_0_0.OnChangeNickname(arg_78_0, arg_78_1)
	arg_78_0:RefreshName(arg_78_1.nick)
end

function var_0_0.OnChangeSign(arg_79_0, arg_79_1, arg_79_2, arg_79_3)
	SetActive(arg_79_0.signInput_.gameObject, false)
	SetActive(arg_79_0.signTxt_.gameObject, true)

	arg_79_0.sign_ = arg_79_2.sign

	arg_79_0:RefreshSign(arg_79_2.sign)

	if arg_79_3 then
		ShowTips("NOT_SUPPORTED_LINE_FEED")
	else
		ShowTips("SUCCESS_CHANGE_SIGNATURE")
	end
end

function var_0_0.OnChangePortrait(arg_80_0)
	local var_80_0 = PlayerData:GetPlayerInfo()

	arg_80_0:RefreshHead(var_80_0.portrait)
end

function var_0_0.OnChangeFrame(arg_81_0)
	local var_81_0 = PlayerData:GetPlayerInfo()

	arg_81_0:RefreshFrame(var_81_0.icon_frame)
end

function var_0_0.OnChangeBirthday(arg_82_0)
	arg_82_0.birthdayMonth_, arg_82_0.birthdayDay_ = PlayerData:GetPlayerBrithday()

	arg_82_0:RefreshBirthday()
end

function var_0_0.OnChangeCardBg(arg_83_0, arg_83_1)
	local var_83_0 = PlayerData:GetPlayerInfo()

	arg_83_0:RefreshCardBg(arg_83_1)
end

function var_0_0.OnChangTagList(arg_84_0)
	arg_84_0.tagList_ = PlayerData:GetUsingTagListInfo()

	arg_84_0:RefreshTag(arg_84_0.tagList_)
end

function var_0_0.OnGetLike(arg_85_0)
	arg_85_0.likeCnt_ = PlayerData:GetPlayerInfo().likes

	arg_85_0:RefreshLike(arg_85_0.likeCnt_)
end

function var_0_0.OnSendLike(arg_86_0)
	arg_86_0.todaySendLike_ = PlayerData:GetTodaySendLikeList() or {}

	SetActive(arg_86_0.likeAddGo_, true)

	arg_86_0.likeCnt_ = arg_86_0.likeCnt_ + 1

	arg_86_0:RefreshLike(arg_86_0.likeCnt_)
end

function var_0_0.OnFriendsDelect(arg_87_0, arg_87_1)
	if arg_87_1 == arg_87_0.userID_ then
		arg_87_0:Back()
	end
end

function var_0_0.OnCheckForeignInfo(arg_88_0, arg_88_1)
	arg_88_0.params_.isForeign = arg_88_1.isForeign
	arg_88_0.isForeign_ = arg_88_1.isForeign

	arg_88_0:OnEnter()
end

function var_0_0.DestoryBackGround(arg_89_0)
	if arg_89_0.backGround_ then
		manager.resourcePool:DestroyOrReturn(arg_89_0.backGround_, ASSET_TYPE.SCENE)

		arg_89_0.backGround_ = nil
	end
end

function var_0_0.RefreshBgImage(arg_90_0)
	local var_90_0 = manager.windowBar:GetWhereTag()

	if var_90_0 == "canteen" or var_90_0 == "dorm" or var_90_0 == "danceGame" or var_90_0 == "minigame" then
		SetActive(arg_90_0.bgImg_.gameObject, true)

		local var_90_1

		if arg_90_0.isForeign_ then
			var_90_1 = ForeignInfoData:GetCurForeignDetailInfo().post_background_id
		else
			var_90_1 = HomeSceneSettingData:GetCurScene()
		end

		manager.loadScene:SetSceneDisableAutoChange(true)

		local var_90_2 = manager.loadScene:GetHomeShouldLoadSceneName(var_90_1)

		manager.loadScene:SetSceneDisableAutoChange(false)

		arg_90_0.bgImg_.spriteSync = "TextureConfig/BackgroundQuad/" .. var_90_2
	else
		SetActive(arg_90_0.bgImg_.gameObject, false)
	end
end

function var_0_0.OnExit(arg_91_0)
	arg_91_0:StopTagScroll()
	arg_91_0:StopTimer()
	manager.windowBar:HideBar()
	arg_91_0.tagSelectPanel_:OnExit()
	manager.posterGirl:SetViewTag(PosterGirlConst.ViewTag.null)

	for iter_91_0, iter_91_1 in ipairs(arg_91_0.tagItem_) do
		iter_91_1:OnExit()
	end

	arg_91_0:DestoryBackGround()
	manager.ui:ResetMainCamera()

	arg_91_0.stickerList_ = {}

	arg_91_0:UnbindRedPoint()
	arg_91_0:HidePop()
end

function var_0_0.Dispose(arg_92_0)
	arg_92_0.signInput_.onEndEdit:RemoveAllListeners()
	arg_92_0.tagSelectPanel_:Dispose()

	for iter_92_0, iter_92_1 in ipairs(arg_92_0.tagItem_) do
		iter_92_1:Dispose()
	end

	arg_92_0.headPortrait:Dispose()

	arg_92_0.headPortrait = nil

	arg_92_0:RemoveAllListeners()
	var_0_0.super.Dispose(arg_92_0)
end

return var_0_0
