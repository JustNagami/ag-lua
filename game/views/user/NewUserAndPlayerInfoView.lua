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
	arg_5_0:AddBtnListener(arg_5_0.headBtn_, nil, function()
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
		JumpTools.OpenPageByJump("/MainSticker", {
			index = 1,
			stickerInfo = arg_5_0.stickerList_,
			stickerBg = arg_5_0.stickerBg_,
			type = arg_5_0.isForeign_ and 3 or 1
		})
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

function var_0_0.OnEnter(arg_38_0)
	arg_38_0.isForeign_ = arg_38_0.params_.isForeign

	SetActive(arg_38_0.likeAddGo_, false)
	arg_38_0:HideTagView()
	arg_38_0:RefreshUI()
end

function var_0_0.RefreshUI(arg_39_0)
	if not arg_39_0.isForeign_ then
		arg_39_0.stateCon_:SetSelectedState("user")
		arg_39_0.signCon_:SetSelectedIndex(1)
		arg_39_0:BindRedPoint()

		arg_39_0.operationInfo_ = OperationData:GetOperationOpenList()

		arg_39_0:RefreshUserData()
		arg_39_0:RefreshExpInfo(arg_39_0.lv_, arg_39_0.exp_)
	else
		arg_39_0.stateCon_:SetSelectedState("player")
		arg_39_0:HidePop()
		arg_39_0:RefreshPlayerData()
		arg_39_0:RefreshFriendState()
		arg_39_0:RefreshOnlineState()

		local var_39_0 = FriendsData:IsFriend(arg_39_0.userID_)

		arg_39_0.signCon_:SetSelectedIndex(1)
	end

	arg_39_0:RefreshSystem()
	arg_39_0:RefreshBtn()
	arg_39_0:RefreshIP(arg_39_0.ip_)
	arg_39_0:RefreshID(arg_39_0.userID_)
	arg_39_0:RefreshName(arg_39_0.nick_)
	SetActive(arg_39_0.signInput_.gameObject, false)
	SetActive(arg_39_0.signTxt_.gameObject, true)
	arg_39_0:RefreshSign(arg_39_0.sign_)
	arg_39_0:RefreshLvInfo(arg_39_0.lv_)
	arg_39_0:RefreshHead(arg_39_0.headIconID_)
	arg_39_0:RefreshFrame(arg_39_0.iconFrameID_)
	arg_39_0:RefreshGuild(arg_39_0.guildID_, arg_39_0.guildName_, arg_39_0.guildIcon_)
	arg_39_0:RefreshBirthday()
	arg_39_0:RefreshTag(arg_39_0.tagList_)
	arg_39_0:RefreshCardBg(arg_39_0.cardBg_)
	arg_39_0:RefreshDorm(arg_39_0.dormID_, arg_39_0.dormName_)
	arg_39_0:RefreshAchievement()
	arg_39_0:RefreshLike(arg_39_0.likeCnt_)

	if not arg_39_0.params_.maskScene then
		arg_39_0:RefreshGirl(arg_39_0.postGirl_)
		arg_39_0:RefreshScene()
	end

	arg_39_0:RefreshBgImage()
end

function var_0_0.RefreshUserData(arg_40_0)
	local var_40_0 = PlayerData:GetPlayerInfo()

	arg_40_0.ip_ = var_40_0.ip
	arg_40_0.nick_ = var_40_0.nick
	arg_40_0.sign_ = var_40_0.sign
	arg_40_0.lv_ = var_40_0.userLevel
	arg_40_0.userID_ = var_40_0.userID
	arg_40_0.exp_ = var_40_0.remain_exp
	arg_40_0.headIconID_ = var_40_0.portrait
	arg_40_0.iconFrameID_ = var_40_0.icon_frame
	arg_40_0.birthdayMonth_ = var_40_0.birthday_month
	arg_40_0.birthdayDay_ = var_40_0.birthday_day
	arg_40_0.likeCnt_ = var_40_0.likes
	arg_40_0.cardBg_ = var_40_0.card_bg_id
	arg_40_0.tagList_ = PlayerData:GetUsingTagListInfo()

	local var_40_1 = var_40_0.poster_girl

	arg_40_0.postGirl_ = HeroTools.HeroUsingSkinInfo(var_40_1).id

	local var_40_2 = GuildData:GetGuildInfo()

	if var_40_2 and var_40_2.id and var_40_2.name then
		arg_40_0.guildID_ = var_40_2.id
		arg_40_0.guildName_ = var_40_2.name
		arg_40_0.guildIcon_ = var_40_2.icon
	else
		arg_40_0.guildID_ = GuildData.INVALID_GUILD
		arg_40_0.guildName_ = ""
		arg_40_0.guildIcon_ = 0
	end

	arg_40_0.dormID_ = 0
	arg_40_0.dormName_ = ""

	if not JumpTools.IsSystemLocked(ViewConst.SYSTEM_ID.DORM) then
		local var_40_3 = DormVisitTools:GetCurTemplateExhibit()

		arg_40_0.dormID_ = var_40_3 == 0 and DormConst.PUBLIC_DORM_ID or var_40_3

		if BackHomeCfg[arg_40_0.dormID_].type == DormConst.BACKHOME_TYPE.PublicDorm then
			arg_40_0.dormName_ = GetTips("DORM_LOBBY_NAME")
		else
			local var_40_4 = DormitoryData:GetDormSceneData(arg_40_0.dormID_).archiveIDList[1]
			local var_40_5 = HeroRecordCfg.get_id_list_by_hero_id[var_40_4][1]

			if var_40_5 then
				local var_40_6 = HeroRecordCfg[var_40_5].name

				if var_40_6 then
					arg_40_0.dormName_ = string.format(GetTips("DORM_HERO_ROOM_NAME"), GetI18NText(var_40_6))
				end
			end
		end
	end

	arg_40_0.heroList_ = {}

	local var_40_7 = PlayerData:GetHeroShowList()

	for iter_40_0, iter_40_1 in ipairs(var_40_7) do
		local var_40_8 = HeroData:GetHeroData(iter_40_1)

		arg_40_0.heroList_[iter_40_0] = {}
		arg_40_0.heroList_[iter_40_0].hero_id = iter_40_1
		arg_40_0.heroList_[iter_40_0].star = var_40_8.star
		arg_40_0.heroList_[iter_40_0].level = var_40_8.level
		arg_40_0.heroList_[iter_40_0].using_skin = var_40_8.using_skin
	end

	arg_40_0.stickerList_ = var_40_0.sticker_show_info
	arg_40_0.stickerBg_ = var_40_0.sticker_background
	arg_40_0.heroAll_ = 0
	arg_40_0.heroNum_ = HeroData:GetHeroNum()

	local var_40_9 = HideInfoData:GetHeroHideList()
	local var_40_10 = HeroCfg.get_id_list_by_private[0]

	for iter_40_2, iter_40_3 in ipairs(var_40_10) do
		if not var_40_9[iter_40_3] then
			arg_40_0.heroAll_ = arg_40_0.heroAll_ + 1
		end
	end

	arg_40_0.weaponServantAll_ = 0
	arg_40_0.weaponServantNum_ = table.length(IllustratedData:GetServantInfo())

	for iter_40_4, iter_40_5 in ipairs(WeaponServantCfg.all) do
		local var_40_11 = IllustratedData:GetServantInfo()[iter_40_5]

		if not ServantTools.GetIsHide(iter_40_5) and (var_40_11 or WeaponServantCfg[iter_40_5].display_type ~= 1) then
			arg_40_0.weaponServantAll_ = arg_40_0.weaponServantAll_ + 1
		end
	end

	arg_40_0.stickerAll_ = #ItemCfg.get_id_list_by_sub_type[ItemConst.ITEM_SUB_TYPE.NORMAL_STICKER]
	arg_40_0.stickerNum_ = #var_40_0.all_sticker_list

	for iter_40_6, iter_40_7 in ipairs(var_40_0.all_sticker_list) do
		if ItemCfg[iter_40_7].sub_type == ItemConst.ITEM_SUB_TYPE.SPECIAL_STICKER then
			arg_40_0.stickerAll_ = arg_40_0.stickerAll_ + 1
		end
	end

	arg_40_0.achieveAll_ = AchievementData:GetAchievementTotalCnt()
	arg_40_0.achieveNum_ = AchievementData:GetFinishAchievementCnt()
end

function var_0_0.RefreshPlayerData(arg_41_0)
	local var_41_0 = ForeignInfoData:GetCurForeignDetailInfo()

	arg_41_0.ip_ = var_41_0.ip
	arg_41_0.nick_ = var_41_0.nick
	arg_41_0.sign_ = var_41_0.sign
	arg_41_0.lv_ = var_41_0.level
	arg_41_0.userID_ = var_41_0.user_id
	arg_41_0.headIconID_ = var_41_0.icon
	arg_41_0.iconFrameID_ = var_41_0.icon_frame
	arg_41_0.isOnline_ = var_41_0.is_online
	arg_41_0.likeCnt_ = var_41_0.likes
	arg_41_0.cardBg_ = var_41_0.card_bg_id
	arg_41_0.tagList_ = var_41_0.used_tag_list
	arg_41_0.postGirl_ = var_41_0.postGril
	arg_41_0.guildID_ = var_41_0.guildID
	arg_41_0.guildName_ = var_41_0.guildName
	arg_41_0.guildIcon_ = var_41_0.guildIcon
	arg_41_0.dormID_ = var_41_0.backhome_architecture_id
	arg_41_0.dormName_ = ""

	if arg_41_0.dormID_ ~= 0 then
		if BackHomeCfg[arg_41_0.dormID_].type == DormConst.BACKHOME_TYPE.PublicDorm then
			arg_41_0.dormName_ = GetTips("DORM_LOBBY_NAME")
		else
			local var_41_1 = var_41_0.hero_id_list
			local var_41_2 = HeroRecordCfg.get_id_list_by_hero_id[var_41_1[1]][1]

			arg_41_0.dormName_ = string.format(GetTips("DORM_HERO_ROOM_NAME"), GetI18NText(HeroRecordCfg[var_41_2].name))
		end
	end

	arg_41_0.heroList_ = {}

	local var_41_3 = var_41_0.hero_list

	for iter_41_0, iter_41_1 in ipairs(var_41_3) do
		arg_41_0.heroList_[iter_41_0] = {}
		arg_41_0.heroList_[iter_41_0].hero_id = iter_41_1.hero_id
		arg_41_0.heroList_[iter_41_0].star = iter_41_1.star
		arg_41_0.heroList_[iter_41_0].level = 0
		arg_41_0.heroList_[iter_41_0].using_skin = iter_41_1.using_skin
	end

	arg_41_0.stickerList_ = var_41_0.sticker_show_info
	arg_41_0.stickerBg_ = var_41_0.sticker_background

	local var_41_4 = var_41_0.hero_static_info

	arg_41_0.heroNum_ = var_41_4.not_hide_num + var_41_4.hide_num
	arg_41_0.heroAll_ = 0

	local var_41_5 = HideInfoData:GetHeroHideList()
	local var_41_6 = HeroCfg.get_id_list_by_private[0]

	for iter_41_2, iter_41_3 in ipairs(var_41_6) do
		if not var_41_5[iter_41_3] then
			arg_41_0.heroAll_ = arg_41_0.heroAll_ + 1
		end
	end

	arg_41_0.heroAll_ = arg_41_0.heroAll_ + var_41_4.cfg_hide_num

	local var_41_7 = var_41_0.weapon_servant_static_info

	arg_41_0.weaponServantNum_ = var_41_7.not_hide_num + var_41_7.hide_num
	arg_41_0.weaponServantAll_ = 0

	for iter_41_4, iter_41_5 in ipairs(WeaponServantCfg.all) do
		if not ServantTools.GetIsHide(iter_41_5) and WeaponServantCfg[iter_41_5].display_type ~= 1 then
			arg_41_0.weaponServantAll_ = arg_41_0.weaponServantAll_ + 1
		end
	end

	arg_41_0.weaponServantAll_ = arg_41_0.weaponServantAll_ + var_41_7.cfg_hide_num

	local var_41_8 = var_41_0.sticker_static_info

	arg_41_0.stickerNum_ = var_41_8.not_hide_num + var_41_8.cfg_hide_num
	arg_41_0.stickerAll_ = #ItemCfg.get_id_list_by_sub_type[ItemConst.ITEM_SUB_TYPE.NORMAL_STICKER] + var_41_8.cfg_hide_num

	local var_41_9 = var_41_0.achievement_static_info

	arg_41_0.achieveNum_ = var_41_9.not_hide_num
	arg_41_0.achieveAll_ = 0

	for iter_41_6, iter_41_7 in ipairs(AchievementCfg.all) do
		local var_41_10 = false
		local var_41_11 = AchievementCfg[iter_41_7].system

		if type(var_41_11) == "table" then
			for iter_41_8, iter_41_9 in ipairs(var_41_11) do
				if SystemCfg[iter_41_9].system_hide == 1 then
					var_41_10 = true

					break
				end
			end
		end

		if AchievementCfg[iter_41_7].is_hide ~= 1 and not var_41_10 then
			arg_41_0.achieveAll_ = arg_41_0.achieveAll_ + 1
		end
	end

	arg_41_0.achieveAll_ = arg_41_0.achieveAll_ + var_41_9.cfg_hide_num
	arg_41_0.todaySendLike_ = PlayerData:GetTodaySendLikeList() or {}
end

function var_0_0.RefreshSystem(arg_42_0)
	arg_42_0.systemCon_:SetSelectedState(manager.windowBar:GetWhereTag() == nil and "on" or "off")
end

function var_0_0.RefreshBtn(arg_43_0)
	arg_43_0.signBtn_.interactable = not arg_43_0.isForeign_
	arg_43_0.headBtn_.interactable = not arg_43_0.isForeign_
	arg_43_0.nameBtn_.interactable = not arg_43_0.isForeign_
	arg_43_0.changeNameBtn_.interactable = not arg_43_0.isForeign_
	arg_43_0.servantbtnBtn_.interactable = not arg_43_0.isForeign_
	arg_43_0.illustratedAchievementBtn_.interactable = not arg_43_0.isForeign_
end

function var_0_0.RefreshExpInfo(arg_44_0, arg_44_1, arg_44_2)
	if LvTools.GetIsMaxLv(arg_44_1, "user") then
		arg_44_0.expTxt_.text = "-/-"
		arg_44_0.progressTrs_.value = 1
	else
		local var_44_0 = GameLevelSetting[arg_44_1].user_level_exp

		arg_44_0.expTxt_.text = string.format("%d/%d", arg_44_2, var_44_0)
		arg_44_0.progressTrs_.value = arg_44_2 / var_44_0
	end
end

function var_0_0.RefreshFriendState(arg_45_0)
	local var_45_0 = FriendsData:GetInfoByID(arg_45_0.userID_)

	if var_45_0 then
		local var_45_1 = var_45_0.relationship

		if var_45_1 == FriendsConst.FRIEND_TYPE.MY_FRIENDS then
			arg_45_0.friendStateCon_:SetSelectedState("myFriend")
		elseif var_45_1 == FriendsConst.FRIEND_TYPE.NEW_FRIENDS then
			arg_45_0.friendStateCon_:SetSelectedState("newFriend")
			arg_45_0.newFriendCon_:SetSelectedState(var_45_0.isDeal and 1 or 0)
		elseif var_45_1 == FriendsConst.FRIEND_TYPE.FRIEND_REQUESTS then
			arg_45_0.friendStateCon_:SetSelectedState("request")
			arg_45_0.newFriendCon_:SetSelectedState(1)
		end
	else
		arg_45_0.friendStateCon_:SetSelectedState("newFriend")
		arg_45_0.newFriendCon_:SetSelectedState(FriendsData:IsInRequest(arg_45_0.userID_) and 1 or 0)
	end
end

function var_0_0.RefreshOnlineState(arg_46_0)
	arg_46_0.onlineCon_:SetSelectedState(arg_46_0.isOnline_ == 1 and "on" or "off")
end

function var_0_0.RefreshIP(arg_47_0, arg_47_1)
	SetActive(arg_47_0.ipGo_, GameToSDK.CURRENT_SERVER == AreaConst.CHINA)

	arg_47_0.ipTxt_.text = arg_47_1

	if arg_47_0.ipGo_.activeSelf then
		UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_0.ipGo_.transform)
	end
end

function var_0_0.RefreshID(arg_48_0, arg_48_1)
	arg_48_0.uid_.text = arg_48_1
end

function var_0_0.RefreshName(arg_49_0, arg_49_1)
	if not OperationData:IsOperationOpen(OperationConst.MANUAL_WORD_VERIFY) then
		local var_49_0, var_49_1 = wordVerify(arg_49_1, {
			isReplace = true
		})

		arg_49_0.name_.text = var_49_1
	else
		arg_49_0.name_.text = arg_49_1
	end

	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_49_0.namePanel_)
end

function var_0_0.RefreshSign(arg_50_0, arg_50_1)
	arg_50_1 = string.gsub(arg_50_1, "\n", "")

	if not OperationData:IsOperationOpen(OperationConst.MANUAL_WORD_VERIFY) then
		local var_50_0, var_50_1 = wordVerify(arg_50_1, {
			isReplace = true
		})

		arg_50_0.signTxt_.text = var_50_1 == "" and GetTips("PROFILE_PERSONAL_PROFILE_DEFAULT") or var_50_1
	else
		arg_50_0.signTxt_.text = arg_50_1 == "" and GetTips("PROFILE_PERSONAL_PROFILE_DEFAULT") or arg_50_1
	end
end

function var_0_0.RefreshHead(arg_51_0, arg_51_1)
	arg_51_0.headIcon_.sprite = ItemTools.getItemSprite(arg_51_1)

	arg_51_0.headIcon_:SetNativeSize()
end

function var_0_0.RefreshFrame(arg_52_0, arg_52_1)
	arg_52_0.headFrameIcon_.sprite = getSpriteWithoutAtlas("TextureConfig/Frame/" .. arg_52_1)

	arg_52_0.headFrameIcon_:SetNativeSize()
end

function var_0_0.RefreshLvInfo(arg_53_0, arg_53_1)
	arg_53_0.lvTxt_.text = arg_53_1
end

function var_0_0.RefreshGuild(arg_54_0, arg_54_1, arg_54_2, arg_54_3)
	if arg_54_1 == 0 or arg_54_1 == "0" then
		arg_54_0.guildCon_:SetSelectedState("false")
	else
		arg_54_0.guildTxt_.text = arg_54_2

		local var_54_0 = ClubHeadIconCfg[arg_54_3]

		if var_54_0 then
			arg_54_0.guildIconImg_.sprite = getSpriteViaConfig("ClubHeadIcon", var_54_0.icon_bg)
		end

		arg_54_0.guildCon_:SetSelectedState("true")
	end
end

function var_0_0.RefreshBirthday(arg_55_0)
	SetActive(arg_55_0.birthdayPanelGo_, not arg_55_0.isForeign_)

	if arg_55_0.birthdayDay_ == 0 then
		SetActive(arg_55_0.brithdayBtn_.gameObject, not arg_55_0.isForeign_)
		SetActive(arg_55_0.brithdayTxt_.gameObject, false)
	else
		SetActive(arg_55_0.brithdayBtn_.gameObject, false)
		SetActive(arg_55_0.brithdayTxt_.gameObject, true)

		arg_55_0.brithdayTxt_.text = string.format(GetTips("OTHER_BIRTHDAY"), arg_55_0.birthdayMonth_, arg_55_0.birthdayDay_)
	end
end

function var_0_0.RefreshDorm(arg_56_0, arg_56_1, arg_56_2)
	if arg_56_1 == 0 then
		arg_56_0.dormCon_:SetSelectedState("false")
	else
		arg_56_0.dormText_.text = arg_56_2

		arg_56_0.dormCon_:SetSelectedState("true")
	end
end

function var_0_0.RefreshTag(arg_57_0, arg_57_1)
	arg_57_0.curTagList_ = arg_57_1

	arg_57_0.tagCon_:SetSelectedState(#arg_57_1 > 0 and "off" or "on")
	arg_57_0:StopTagScroll()

	for iter_57_0, iter_57_1 in ipairs(arg_57_1) do
		if not arg_57_0.tagItem_[iter_57_0] then
			local var_57_0 = Object.Instantiate(arg_57_0.tagTemplate_, arg_57_0.tagContent_)

			arg_57_0.tagItem_[iter_57_0] = NewUserAndPlayerInfoTagItem.New(var_57_0)
		end

		arg_57_0.tagItem_[iter_57_0]:SetData(iter_57_1)
	end

	for iter_57_2 = #arg_57_1 + 1, #arg_57_0.tagItem_ do
		arg_57_0.tagItem_[iter_57_2]:Show(false)
	end

	local var_57_1 = var_0_2

	LayoutRebuilder.ForceRebuildLayoutImmediate(arg_57_0.tagPanel_)

	if var_57_1 >= arg_57_0.tagContent_.transform.rect.width then
		arg_57_0.tagContentFitter_.horizontalFit = ContentSizeFitter.FitMode.PreferredSize

		LayoutRebuilder.ForceRebuildLayoutImmediate(arg_57_0.tagScrollPanel_)
	else
		arg_57_0.tagContentFitter_.horizontalFit = ContentSizeFitter.FitMode.Unconstrained
		arg_57_0.tagScrollPanel_.sizeDelta = Vector2(var_57_1, arg_57_0.tagScrollPanel_.sizeDelta.y)
		arg_57_0.tagContent_.anchoredPosition = Vector3.New(0, arg_57_0.tagContent_.anchoredPosition.y, 0)

		if arg_57_0.isTagShow_ then
			return
		end

		arg_57_0.tagScrollTimer_ = FuncTimerManager.inst:CreateFuncFrameTimer(function()
			if arg_57_0.tagContent_.anchoredPosition.x <= -1 * arg_57_0.tagContent_.transform.rect.width then
				arg_57_0.tagContent_.anchoredPosition = Vector3.New(var_57_1, arg_57_0.tagContent_.anchoredPosition.y, 0)
			end

			arg_57_0.tagContent_.anchoredPosition = Vector3.New(arg_57_0.tagContent_.anchoredPosition.x - var_0_1, arg_57_0.tagContent_.anchoredPosition.y, 0)
		end, -1, true)
	end
end

function var_0_0.RefreshCardBg(arg_59_0, arg_59_1)
	local var_59_0 = ProfileBusinessCardCfg[arg_59_1]
	local var_59_1 = var_59_0.resource

	if var_59_0.type == 1 then
		arg_59_0.cardBgIcon_.sprite = getSpriteWithoutAtlas("TextureConfig/UserInfor/" .. var_59_1)
	elseif var_59_0.type == 2 then
		-- block empty
	elseif var_59_0.type == 3 then
		-- block empty
	end
end

function var_0_0.RefreshAchievement(arg_60_0)
	arg_60_0.heroTxt_.text = arg_60_0.heroNum_ .. "/" .. arg_60_0.heroAll_

	if arg_60_0.heroNum_ == arg_60_0.heroAll_ then
		arg_60_0.heroPre_.text = "100%"
	else
		arg_60_0.heroPre_.text = math.floor(arg_60_0.heroNum_ * 100 / arg_60_0.heroAll_) .. "%"
	end

	arg_60_0.stickerTxt_.text = arg_60_0.stickerNum_ .. "/" .. arg_60_0.stickerAll_

	if arg_60_0.stickerNum_ == arg_60_0.stickerAll_ then
		arg_60_0.stickerPre_.text = "100%"
	else
		arg_60_0.stickerPre_.text = math.floor(arg_60_0.stickerNum_ * 100 / arg_60_0.stickerAll_) .. "%"
	end

	arg_60_0.weaponServantTxt_.text = arg_60_0.weaponServantNum_ .. "/" .. arg_60_0.weaponServantAll_

	if arg_60_0.weaponServantNum_ == arg_60_0.weaponServantAll_ then
		arg_60_0.weaponServantPre_.text = "100%"
	else
		arg_60_0.weaponServantPre_.text = math.floor(arg_60_0.weaponServantNum_ * 100 / arg_60_0.weaponServantAll_) .. "%"
	end

	arg_60_0.achieveTxt_.text = arg_60_0.achieveNum_ .. "/" .. arg_60_0.achieveAll_

	if arg_60_0.achieveNum_ == arg_60_0.achieveAll_ then
		arg_60_0.achievePre_.text = "100%"
	else
		arg_60_0.achievePre_.text = math.floor(arg_60_0.achieveNum_ * 100 / arg_60_0.achieveAll_) .. "%"
	end
end

function var_0_0.RefreshLike(arg_61_0, arg_61_1)
	if arg_61_1 >= 10000 then
		arg_61_0.like_.text = string.format("%.1f", arg_61_1 / 1000) .. "K"
	else
		arg_61_0.like_.text = arg_61_1
	end

	if not arg_61_0.isForeign_ then
		arg_61_0.likeCon_:SetSelectedState("on")
	else
		arg_61_0.likeCon_:SetSelectedState(table.indexof(arg_61_0.todaySendLike_, arg_61_0.userID_) and "off" or "on")
	end
end

function var_0_0.RefreshGirl(arg_62_0, arg_62_1)
	if arg_62_0.isForeign_ then
		manager.posterGirl:SetViewTag(PosterGirlConst.ViewTag.playerInfo_other, arg_62_1)
	else
		manager.posterGirl:SetViewTag(PosterGirlConst.ViewTag.playerInfo)
	end
end

function var_0_0.RefreshScene(arg_63_0)
	if not arg_63_0.isForeign_ then
		local var_63_0 = HomeSceneSettingData:GetCurScene()
		local var_63_1 = "playerInfo_" .. var_63_0

		if CameraCfg[var_63_1] then
			manager.ui:SetMainCamera(var_63_1)
		else
			manager.ui:SetMainCamera("playerInfo", false, false)
		end
	else
		local var_63_2 = ForeignInfoData:GetCurForeignDetailInfo().post_background_id
		local var_63_3 = manager.loadScene:GetHomeShouldLoadSceneName(var_63_2)
		local var_63_4 = "UI/Common/BackgroundQuad"

		arg_63_0:DestoryBackGround()

		arg_63_0.backGround_ = manager.resourcePool:Get(var_63_4, ASSET_TYPE.SCENE)
		arg_63_0.backGroundTrs_ = arg_63_0.backGround_.transform

		local var_63_5 = GameSetting.profile_other_players_coordinate.value

		arg_63_0.backGroundTrs_:SetParent(manager.ui.mainCamera.transform)

		arg_63_0.backGroundTrs_.localPosition = Vector3(var_63_5[1], var_63_5[2], var_63_5[3])
		arg_63_0.backGroundTrs_.localEulerAngles = Vector3(0, 0, 0)
		arg_63_0.backGroundTrs_.localScale = Vector3(11, 11, 1)
		arg_63_0.backGroundTrs_:Find("pic_background1"):GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/BackgroundQuad/" .. var_63_3)

		manager.ui:SetMainCamera("playerInfo", false, true)
	end
end

function var_0_0.TagSelectCallback(arg_64_0, arg_64_1)
	arg_64_0:RefreshTag(arg_64_1)
end

function var_0_0.HidePop(arg_65_0)
	SetActive(arg_65_0.goPop_, false)
end

function var_0_0.ShowTagView(arg_66_0)
	PlayerData:DealOverdueTagList()
	PlayerData:ClearTagRed()

	arg_66_0.isTagShow_ = true

	arg_66_0.tagSelectPanel_:Show(true)
	arg_66_0.tagSelectPanel_:RefreshUI()
	SetActive(arg_66_0.hideTagBtn_.gameObject, true)
	arg_66_0:RefreshTag(arg_66_0.curTagList_)
end

function var_0_0.HideTagView(arg_67_0)
	arg_67_0.isTagShow_ = false

	arg_67_0.tagSelectPanel_:Show(false)
	SetActive(arg_67_0.hideTagBtn_.gameObject, false)
end

function var_0_0.AddClickTimer(arg_68_0)
	arg_68_0:StopTimer()

	arg_68_0.buttonUp_ = 0
	arg_68_0.clickTimer_ = FuncTimerManager.inst:CreateFuncFrameTimer(function()
		if Input.GetMouseButtonUp(0) then
			arg_68_0.buttonUp_ = arg_68_0.buttonUp_ + 1

			if arg_68_0.buttonUp_ >= 2 then
				arg_68_0:HidePop()
				FuncTimerManager.inst:RemoveFuncTimer(arg_68_0.clickTimer_)

				arg_68_0.clickTimer_ = nil
			end
		end
	end, -1, true)
end

function var_0_0.StopTimer(arg_70_0)
	if arg_70_0.clickTimer_ then
		FuncTimerManager.inst:RemoveFuncTimer(arg_70_0.clickTimer_)

		arg_70_0.clickTimer_ = nil
	end
end

function var_0_0.StopTagScroll(arg_71_0)
	if arg_71_0.tagScrollTimer_ then
		FuncTimerManager.inst:RemoveFuncTimer(arg_71_0.tagScrollTimer_)

		arg_71_0.tagScrollTimer_ = nil
	end
end

function var_0_0.BindRedPoint(arg_72_0)
	manager.redPoint:bindUIandKey(arg_72_0.brithdayBtn_.transform, RedPointConst.BRITHDAY)
	manager.redPoint:bindUIandKey(arg_72_0.stickerRedPanel_, RedPointConst.STICKER_ROOT)
	manager.redPoint:bindUIandKey(arg_72_0.headBtn_.transform, RedPointConst.USER_CUSTOM)
	manager.redPoint:bindUIandKey(arg_72_0.tagBtn_.transform, RedPointConst.TAG)
end

function var_0_0.UnbindRedPoint(arg_73_0)
	manager.redPoint:unbindUIandKey(arg_73_0.brithdayBtn_.transform, RedPointConst.BRITHDAY)
	manager.redPoint:unbindUIandKey(arg_73_0.stickerRedPanel_, RedPointConst.STICKER_ROOT)
	manager.redPoint:unbindUIandKey(arg_73_0.headBtn_.transform, RedPointConst.USER_CUSTOM)
	manager.redPoint:unbindUIandKey(arg_73_0.tagBtn_.transform, RedPointConst.TAG)
end

function var_0_0.OnTop(arg_74_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR
	})
	manager.windowBar:RegistBackCallBack(function()
		JumpTools.Back(nil, {
			userID = arg_74_0.userID_
		})
	end)
end

function var_0_0.OnChangeNickname(arg_76_0, arg_76_1)
	arg_76_0:RefreshName(arg_76_1.nick)
end

function var_0_0.OnChangeSign(arg_77_0, arg_77_1, arg_77_2, arg_77_3)
	SetActive(arg_77_0.signInput_.gameObject, false)
	SetActive(arg_77_0.signTxt_.gameObject, true)

	arg_77_0.sign_ = arg_77_2.sign

	arg_77_0:RefreshSign(arg_77_2.sign)

	if arg_77_3 then
		ShowTips("NOT_SUPPORTED_LINE_FEED")
	else
		ShowTips("SUCCESS_CHANGE_SIGNATURE")
	end
end

function var_0_0.OnChangePortrait(arg_78_0)
	local var_78_0 = PlayerData:GetPlayerInfo()

	arg_78_0:RefreshHead(var_78_0.portrait)
end

function var_0_0.OnChangeFrame(arg_79_0)
	local var_79_0 = PlayerData:GetPlayerInfo()

	arg_79_0:RefreshFrame(var_79_0.icon_frame)
end

function var_0_0.OnChangeBirthday(arg_80_0)
	arg_80_0.birthdayMonth_, arg_80_0.birthdayDay_ = PlayerData:GetPlayerBrithday()

	arg_80_0:RefreshBirthday()
end

function var_0_0.OnChangeCardBg(arg_81_0, arg_81_1)
	local var_81_0 = PlayerData:GetPlayerInfo()

	arg_81_0:RefreshCardBg(arg_81_1)
end

function var_0_0.OnChangTagList(arg_82_0)
	arg_82_0.tagList_ = PlayerData:GetUsingTagListInfo()

	arg_82_0:RefreshTag(arg_82_0.tagList_)
end

function var_0_0.OnGetLike(arg_83_0)
	arg_83_0.likeCnt_ = PlayerData:GetPlayerInfo().likes

	arg_83_0:RefreshLike(arg_83_0.likeCnt_)
end

function var_0_0.OnSendLike(arg_84_0)
	arg_84_0.todaySendLike_ = PlayerData:GetTodaySendLikeList() or {}

	SetActive(arg_84_0.likeAddGo_, true)

	arg_84_0.likeCnt_ = arg_84_0.likeCnt_ + 1

	arg_84_0:RefreshLike(arg_84_0.likeCnt_)
end

function var_0_0.OnFriendsDelect(arg_85_0, arg_85_1)
	if arg_85_1 == arg_85_0.userID_ then
		arg_85_0:Back()
	end
end

function var_0_0.OnCheckForeignInfo(arg_86_0, arg_86_1)
	arg_86_0.params_.isForeign = arg_86_1.isForeign
	arg_86_0.isForeign_ = arg_86_1.isForeign

	arg_86_0:OnEnter()
end

function var_0_0.DestoryBackGround(arg_87_0)
	if arg_87_0.backGround_ then
		manager.resourcePool:DestroyOrReturn(arg_87_0.backGround_, ASSET_TYPE.SCENE)

		arg_87_0.backGround_ = nil
	end
end

function var_0_0.RefreshBgImage(arg_88_0)
	local var_88_0 = manager.windowBar:GetWhereTag()

	if var_88_0 == "canteen" or var_88_0 == "dorm" or var_88_0 == "danceGame" or var_88_0 == "minigame" then
		SetActive(arg_88_0.bgImg_.gameObject, true)

		local var_88_1 = ForeignInfoData:GetCurForeignDetailInfo().post_background_id
		local var_88_2 = manager.loadScene:GetHomeShouldLoadSceneName(var_88_1)

		arg_88_0.bgImg_.sprite = getSpriteWithoutAtlas("TextureConfig/BackgroundQuad/" .. var_88_2)
	else
		SetActive(arg_88_0.bgImg_.gameObject, false)
	end
end

function var_0_0.OnExit(arg_89_0)
	arg_89_0:StopTagScroll()
	arg_89_0:StopTimer()
	manager.windowBar:HideBar()
	arg_89_0.tagSelectPanel_:OnExit()
	manager.posterGirl:SetViewTag(PosterGirlConst.ViewTag.null)

	for iter_89_0, iter_89_1 in ipairs(arg_89_0.tagItem_) do
		iter_89_1:OnExit()
	end

	arg_89_0:DestoryBackGround()
	manager.ui:ResetMainCamera()

	arg_89_0.stickerList_ = {}

	arg_89_0:UnbindRedPoint()
	arg_89_0:HidePop()
end

function var_0_0.Dispose(arg_90_0)
	arg_90_0.signInput_.onEndEdit:RemoveAllListeners()
	arg_90_0.tagSelectPanel_:Dispose()

	for iter_90_0, iter_90_1 in ipairs(arg_90_0.tagItem_) do
		iter_90_1:Dispose()
	end

	arg_90_0:RemoveAllListeners()
	var_0_0.super.Dispose(arg_90_0)
end

return var_0_0
