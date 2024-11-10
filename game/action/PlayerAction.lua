local var_0_0 = {}

manager.net:Bind(10999, function(arg_1_0)
	ReconnectLogic.ReconnectError(arg_1_0.reason)
end)
manager.net:Bind(10051, function(arg_2_0)
	if arg_2_0.timestamp and arg_2_0.verify_timestamp then
		manager.time:SetServerTime(arg_2_0.timestamp, arg_2_0.verify_timestamp)
	end
end)
manager.net:Bind(10501, function(arg_3_0)
	var_0_0.OnRequestNewDayData(arg_3_0)
end)
manager.net:Bind(10503, function(arg_4_0)
	var_0_0.SyncSeverTime(arg_4_0)
end)
manager.net:Bind(12019, function(arg_5_0)
	var_0_0.OnClientModuleSwitch(arg_5_0)
end)
manager.net:Bind(12023, function(arg_6_0)
	PlayerData:SetUnclaimedListFromServer(arg_6_0)
end)
manager.net:Bind(32051, function(arg_7_0)
	PlayerData:InItReceivedSkinGift(arg_7_0)
	var_0_0.RefreshSkinGiftRedPoint()
end)
manager.net:Bind(32201, function(arg_8_0)
	PlayerData:AddLikeInfo(arg_8_0.info)
end)
manager.net:Bind(32203, function(arg_9_0)
	PlayerData:InitOverdueCardBgList(arg_9_0.information_background_list)
end)
manager.net:Bind(32205, function(arg_10_0)
	PlayerData:InitOverdueTagList(arg_10_0.tags_list)
end)
manager.notify:RegistListener(ZERO_REFRESH, function()
	PlayerData:ResetSendLikeList()
end)

function var_0_0.RequestNewDayData()
	manager.net:SendWithLoadingNew(10500, {}, 10501, var_0_0.OnRequestNewDayData)
end

function var_0_0.OnRequestNewDayData(arg_13_0, arg_13_1)
	var_0_0.SyncSeverTime(arg_13_0)

	if isSuccess(arg_13_0.result) then
		manager.notify:Invoke(NEW_DAY)
	end
end

function var_0_0.SyncSeverTime(arg_14_0)
	manager.time:SetServerTime(arg_14_0.timestamp, arg_14_0.verify_timestamp)
	_G.gameTimer:SetNextDayFreshTime(arg_14_0.next_refresh_time)
	_G.gameTimer:SetNextWeekFreshTime(arg_14_0.next_weekly_refresh_time)
	_G.gameTimer:SetNextMonthFreshTime(arg_14_0.next_monthly_refresh_time)
end

manager.net:Bind(23009, function(arg_15_0)
	var_0_0.PlayInfoInit(arg_15_0)
end)
manager.net:Bind(23015, function(arg_16_0)
	var_0_0.SetPlayerIP(arg_16_0)
end)
manager.net:Bind(12001, function(arg_17_0)
	var_0_0.StoryInit(arg_17_0.story_list)
end)
manager.net:Bind(12033, function(arg_18_0)
	var_0_0.PlayerBrithdayInit(arg_18_0)
end)
manager.net:Bind(12009, function(arg_19_0)
	var_0_0.PlayerOriginalLevel(arg_19_0)
end)
manager.net:Bind(32009, function(arg_20_0)
	var_0_0.PlayerCardInit(arg_20_0)
end)
manager.net:Bind(32007, function(arg_21_0)
	var_0_0.InitOverdueFrameList(arg_21_0)
end)
manager.net:Bind(12099, function(arg_22_0)
	HideInfoData:InitHideData(arg_22_0)
	ComboSkillTools.InitComboList()
end)
manager.net:Bind(32211, function(arg_23_0)
	PlayerData:UnlockTag(arg_23_0.info.id)
end)
manager.net:Bind(81001, function(arg_24_0)
	PlayerData:InitPlayerStoryTrigger(arg_24_0)
end)

function var_0_0.ChangeNickname(arg_25_0, arg_25_1)
	manager.net:SendWithLoadingNew(23012, {
		nick = arg_25_0
	}, 23013, function(arg_26_0)
		if isSuccess(arg_26_0.result) then
			PlayerData:PlayerNicknameChange(arg_25_0)
			PlayerData:UpdateNameChangeInfo(arg_26_0)
			manager.notify:CallUpdateFunc(CHANGE_NAME, {
				nick = arg_25_0
			})
		else
			ShowTips(arg_26_0.result)
		end
	end)
end

function var_0_0.ChangeSign(arg_27_0, arg_27_1)
	var_0_0.isEnter = arg_27_1

	manager.net:SendWithLoadingNew(32012, {
		sign = arg_27_0
	}, 32013, var_0_0.OnChangeSign)
end

function var_0_0.OnChangeSign(arg_28_0, arg_28_1)
	if isSuccess(arg_28_0.result) then
		PlayerData:PlayerSignChange(arg_28_1.sign)
		manager.notify:CallUpdateFunc(CHANGE_SIGN, arg_28_0, arg_28_1, var_0_0.isEnter)
	else
		ShowTips(arg_28_0.result)
	end
end

function var_0_0.ChangeHeros(arg_29_0)
	manager.net:SendWithLoadingNew(32014, {
		heroes = arg_29_0
	}, 32015, var_0_0.OnChangeHeros)
end

function var_0_0.OnChangeHeros(arg_30_0, arg_30_1)
	if isSuccess(arg_30_0.result) then
		PlayerData:ChangeHeros(arg_30_1.heroes)
	else
		ShowTips(arg_30_0.result)
	end
end

function var_0_0.ChangePosterGirl(arg_31_0)
	HomeSceneSettingAction.CheckMatchPosterGirl(arg_31_0)
	manager.net:SendWithLoadingNew(32016, {
		poster_girl = arg_31_0
	}, 32017, var_0_0.OnChangePosterGirl)
end

function var_0_0.OnChangePosterGirl(arg_32_0, arg_32_1)
	if isSuccess(arg_32_0.result) then
		PlayerData:PlayerPosterGirlChange(arg_32_1.poster_girl)

		local var_32_0 = HomeSceneSettingData:GetCurScene()
		local var_32_1 = HeroTools.HeroUsingSkinInfo(arg_32_1.poster_girl).id
		local var_32_2 = SkinSceneActionCfg[var_32_1]

		if var_32_2 and var_32_0 ~= var_32_2.special_scene_id and HomeSceneSettingAction.CheckPosterSceneCanUse(var_32_2.special_scene_id) then
			HomeSceneSettingAction.SetHomeScene(var_32_2.special_scene_id)

			return true
		end

		manager.notify:CallUpdateFunc(CHANGE_POSTER_GIRL, arg_32_0, arg_32_1)
	else
		ShowTips(arg_32_0.result)
	end
end

function var_0_0.TouchPosterGirl()
	manager.net:SendWithLoadingNew(32054, {}, 32055, function(arg_34_0)
		if not isSuccess(arg_34_0.result) then
			ShowTips(arg_34_0.result)
		end
	end)
end

function var_0_0.ChangeStoryList(arg_35_0, arg_35_1)
	local var_35_0 = PlayerData:GetStoryList()
	local var_35_1 = {
		story_id = arg_35_0
	}

	if var_35_0[arg_35_0] then
		PlayerData:StoryModify(arg_35_0)
		IllustratedAction.ModifyPlot(arg_35_0)

		if arg_35_1 then
			arg_35_1({
				result = 1
			}, var_35_1)
		end
	else
		var_0_0.OnChangeStoryListCallBack = arg_35_1

		manager.net:SendWithLoadingNew(12002, var_35_1, 12003, var_0_0.OnChangeStoryList)
	end
end

function var_0_0.OnChangeStoryList(arg_36_0, arg_36_1)
	PlayerData:StoryModify(arg_36_1.story_id)
	IllustratedAction.ModifyPlot(arg_36_1.story_id)

	if var_0_0.OnChangeStoryListCallBack then
		var_0_0.OnChangeStoryListCallBack(arg_36_0, arg_36_1)

		var_0_0.OnChangeStoryListCallBack = nil
	end
end

function var_0_0.ChangePortrait(arg_37_0)
	local var_37_0 = {
		icon_id = arg_37_0
	}

	manager.net:SendWithLoadingNew(32032, var_37_0, 32033, var_0_0.OnChangePortrait)
end

function var_0_0.OnChangePortrait(arg_38_0, arg_38_1)
	if isSuccess(arg_38_0.result) then
		PlayerData:ChangePortrait(arg_38_1.icon_id)
		manager.notify:CallUpdateFunc(CHANGE_PORTRAIT)
	else
		ShowTips(arg_38_0.result)
	end
end

function var_0_0.ChangePlayerBirthday(arg_39_0, arg_39_1)
	local var_39_0 = {
		month = arg_39_0,
		day = arg_39_1
	}

	manager.net:SendWithLoadingNew(12030, var_39_0, 12031, var_0_0.OnChangeBirthday)
end

function var_0_0.OnChangeBirthday(arg_40_0, arg_40_1)
	if isSuccess(arg_40_0.result) then
		PlayerData:SetPlayerBirthday(arg_40_1)
		manager.notify:CallUpdateFunc(CHANGE_BIRTHDAY)
	else
		ShowTips(arg_40_0.result)
	end
end

function var_0_0.ChangeFrameIcon(arg_41_0)
	local var_41_0 = {
		iconframe_id = arg_41_0
	}

	manager.net:SendWithLoadingNew(32034, var_41_0, 32035, var_0_0.OnChangeFrameIcon)
end

function var_0_0.OnChangeFrameIcon(arg_42_0, arg_42_1)
	if isSuccess(arg_42_0.result) then
		PlayerData:ChangeFrameIcon(arg_42_1.iconframe_id)
		manager.notify:CallUpdateFunc(CHANGE_FRAME)
	else
		ShowTips(arg_42_0.result)
	end
end

function var_0_0.ChangeStickerList(arg_43_0)
	local var_43_0 = {}

	for iter_43_0, iter_43_1 in pairs(arg_43_0.info) do
		local var_43_1 = {}
		local var_43_2 = StickViewTemplateCfg[iter_43_1.viewID]

		for iter_43_2, iter_43_3 in ipairs(var_43_2.range_list) do
			local var_43_3 = iter_43_1.sticker[iter_43_2]

			var_43_1[iter_43_2] = {
				sticker_id = var_43_3.stickerID,
				location = iter_43_2,
				size = var_43_3.size
			}
		end

		table.insert(var_43_0, {
			page_id = iter_43_1.index,
			template_id = iter_43_1.viewID,
			sticker_display_info = var_43_1
		})
	end

	local var_43_4 = {
		sticker_show_info = var_43_0,
		sticker_background = arg_43_0.stickerBg
	}

	manager.net:SendWithLoadingNew(32038, var_43_4, 32039, var_0_0.OnChangeStickerList)
end

function var_0_0.OnChangeStickerList(arg_44_0, arg_44_1)
	if isSuccess(arg_44_0.result) then
		PlayerData:ChangeStickerList(arg_44_1.sticker_show_info, arg_44_1.sticker_background)
	else
		ShowTips(arg_44_0.result)
	end
end

function var_0_0.ReceiveSkinGift(arg_45_0)
	local var_45_0 = {
		skin_id = arg_45_0
	}

	manager.net:SendWithLoadingNew(32052, var_45_0, 32053, var_0_0.OnReceiveSkinGift)
end

function var_0_0.OnReceiveSkinGift(arg_46_0, arg_46_1)
	if isSuccess(arg_46_0.result) then
		PlayerData:ReceiveSkinGift(arg_46_1.skin_id)
		manager.redPoint:setTip(RedPointConst.SKIN_GIFT .. "_" .. arg_46_1.skin_id, 0)

		local var_46_0 = SkinCfg[arg_46_1.skin_id].gift

		getReward(formatRewardCfgList(var_46_0))
		manager.notify:Invoke(GET_SKIN_GIFT)
	else
		ShowTips(arg_46_0.result)
	end
end

function var_0_0.RefreshSkinGiftRedPoint()
	for iter_47_0, iter_47_1 in ipairs(SkinCfg.all) do
		if #SkinCfg[iter_47_1].gift > 0 and HeroTools.IsSkinUnlock(iter_47_1) then
			local var_47_0 = SkinCfg[iter_47_1].hero

			if HeroData:GetHeroList()[var_47_0].unlock > 0 and PlayerData:IsNotReceived(iter_47_1) then
				manager.redPoint:setTip(RedPointConst.SKIN_GIFT .. "_" .. iter_47_1, 1)
			else
				manager.redPoint:setTip(RedPointConst.SKIN_GIFT .. "_" .. iter_47_1, 0)
			end
		else
			manager.redPoint:setTip(RedPointConst.SKIN_GIFT .. "_" .. iter_47_1, 0)
		end
	end
end

function var_0_0.PlayInfoInit(arg_48_0)
	PlayerData:PlayInfoInit(arg_48_0)
end

function var_0_0.PlayerBrithdayInit(arg_49_0)
	PlayerData:SetPlayerBirthday({
		month = arg_49_0.month,
		day = arg_49_0.day
	})
end

function var_0_0.SetPlayerIP(arg_50_0)
	PlayerData:SetPlayerIP(arg_50_0)
end

function var_0_0.UserBaseInfoInit(arg_51_0)
	PlayerData:UserBaseInfoInit(arg_51_0)
end

function var_0_0.UserLoginTimestampInit(arg_52_0)
	PlayerData:UserLoginTimestampInit(arg_52_0)
end

function var_0_0.LevelUpFinish(arg_53_0)
	PlayerData:LevelUpFinish(arg_53_0)
end

function var_0_0.ChangeLevel(arg_54_0, arg_54_1)
	PlayerData:ChangeLevel({
		fromLevel = arg_54_0,
		toLevel = arg_54_1
	})
	ActivityNewbieAction.PlayerUpgradeRedPoint()
	BattleStageAction.UpdateSubPlotRedPoint()
	BattleStageAction.UpdateActivityRedPoint()
	EquipSeizureAction.InitRedPointEveryDay()
	BattleEquipAction.UpdateRedPoint()
	DailyNewRedPoint:InitNewTagData()
end

function var_0_0.EXPChange(arg_55_0)
	PlayerData:EXPChange(arg_55_0)
end

function var_0_0.ModifyHeroNick(arg_56_0)
	PlayerData:ModifyHeroNick(arg_56_0)
end

function var_0_0.PlayerOriginalLevel(arg_57_0)
	PlayerData:PlayerOriginalLevel(arg_57_0)
end

function var_0_0.StoryModify(arg_58_0)
	PlayerData:StoryModify(arg_58_0)
end

function var_0_0.StoryInit(arg_59_0)
	PlayerData:StoryInit(arg_59_0)
end

function var_0_0.PlayerShowHeroChange(arg_60_0)
	PlayerData:PlayerShowHeroChange(arg_60_0)
end

function var_0_0.PlayerCardInit(arg_61_0)
	PlayerData:PlayerCardInit(arg_61_0)

	local var_61_0 = PlayerData:GetPlayerInfo()

	for iter_61_0, iter_61_1 in ipairs(var_61_0.all_background_list) do
		local var_61_1 = PlayerData:GetStickerBg(iter_61_1)

		if iter_61_1 ~= 4002 and var_61_1 and var_61_1.unlock == 1 and not RedPointData:GetIsRedPointOpen(RedPointConst.STICKER_BG_RANGE + iter_61_1) then
			manager.redPoint:setTip(RedPointConst.STICKER_BG .. "_" .. iter_61_1, 1)
		end
	end

	PlayerRedPoint:DispatchAllStickerUnlock()
	HomeSceneSettingData:InitData(arg_61_0.poster_background_list, arg_61_0.poster_background_id)
end

function var_0_0.InitOverdueFrameList(arg_62_0)
	PlayerData:InitOverdueFrameList(arg_62_0.icon_frame_list or {})
end

function var_0_0.PlayerProtraitChange(arg_63_0)
	PlayerData:PlayerProtraitChange(arg_63_0)
end

function var_0_0.UnlockSticker(arg_64_0)
	PlayerData:UnlockSticker(arg_64_0)
end

function var_0_0.UnlockStickerBg(arg_65_0)
	PlayerData:UnlockStickerBg(arg_65_0)
end

function var_0_0.UnlockPortrait(arg_66_0)
	PlayerData:UnlockPortrait(arg_66_0)
end

function var_0_0.UnlockFrame(arg_67_0)
	PlayerData:UnlockFrame(arg_67_0)
end

function var_0_0.LockFrame(arg_68_0, arg_68_1)
	PlayerData:LockFrame(arg_68_1)
end

function var_0_0.OnClientModuleSwitch(arg_69_0)
	PlayerData:InitModuleSwitchData(arg_69_0)
end

function var_0_0.AwakeName(arg_70_0, arg_70_1)
	manager.net:SendWithLoadingNew(23012, {
		nick = arg_70_0
	}, 23013, function(arg_71_0)
		if isSuccess(arg_71_0.result) then
			PlayerData:PlayerNicknameChange(arg_70_0)
			PlayerData:UpdateNameChangeInfo(arg_71_0)
			arg_70_1()
		else
			ShowTips(arg_71_0.result)
		end
	end)
end

function var_0_0.DealOverdueFrame()
	manager.net:SendWithLoadingNew(32040, {}, 32041, var_0_0.OnDealOverdueFrame)
end

function var_0_0.OnDealOverdueFrame(arg_73_0, arg_73_1)
	if isSuccess(arg_73_0.result) then
		-- block empty
	else
		ShowTips(arg_73_0.result)
	end
end

function var_0_0.DealOverdueCardBgList()
	manager.net:SendWithLoadingNew(32206, {}, 32207, var_0_0.OnDealOverdueCardBgList)
end

function var_0_0.OnDealOverdueCardBgList(arg_75_0, arg_75_1)
	if isSuccess(arg_75_0.result) then
		-- block empty
	else
		ShowTips(arg_75_0.result)
	end
end

function var_0_0.DealOverdueTagList()
	manager.net:SendWithLoadingNew(32208, {
		nothing = 1
	}, 32209, var_0_0.OnDealOverdueTagList)
end

function var_0_0.OnDealOverdueTagList(arg_77_0, arg_77_1)
	if isSuccess(arg_77_0.result) then
		-- block empty
	else
		ShowTips(arg_77_0.result)
	end
end

function var_0_0.ReadUnclaimedMessage(arg_78_0)
	local var_78_0 = {
		id = arg_78_0
	}

	manager.net:SendWithLoadingNew(12024, var_78_0, 12025, var_0_0.OnReadUnclaimedMessageCallback)
end

function var_0_0.OnReadUnclaimedMessageCallback(arg_79_0, arg_79_1)
	if isSuccess(arg_79_0.result) then
		PlayerData:ReadUnclaimed(arg_79_1.id)
	else
		ShowTips(GetTips(arg_79_0.result))
	end
end

function var_0_0.CheckRecommendEquip(arg_80_0, arg_80_1)
	manager.net:SendWithLoadingNew(32042, {
		role_id = arg_80_0
	}, 32043, function(arg_81_0)
		if isSuccess(arg_81_0.result) then
			if arg_80_1 then
				arg_80_1()
			end
		else
			ShowTips(GetTips(arg_81_0.result))
		end
	end)
end

function var_0_0.CheckHeroVoice(arg_82_0, arg_82_1)
	manager.net:SendWithLoadingNew(32044, {
		role_id = arg_82_0
	}, 32045, function(arg_83_0)
		if isSuccess(arg_83_0.result) then
			if arg_82_1 then
				arg_82_1()
			end
		else
			ShowTips(GetTips(arg_83_0.result))
		end
	end)
end

function var_0_0.ChangeCardBg(arg_84_0)
	local var_84_0 = {
		id = arg_84_0
	}

	manager.net:SendWithLoadingNew(32114, var_84_0, 32115, var_0_0.OnChangeCardBg)
end

function var_0_0.OnChangeCardBg(arg_85_0, arg_85_1)
	if isSuccess(arg_85_0.result) then
		PlayerData:SetCardBg(arg_85_1.id)
		manager.notify:CallUpdateFunc(CHANGE_CARD_BG, arg_85_1.id)
	else
		ShowTips(arg_85_0.result)
	end
end

function var_0_0.ChangTagList(arg_86_0)
	local var_86_0 = {}
	local var_86_1 = manager.time:GetServerTime()

	for iter_86_0, iter_86_1 in ipairs(arg_86_0) do
		local var_86_2 = PlayerData:GetTagInfo(iter_86_1)

		if var_86_2.lasted_time == 0 or var_86_1 < var_86_2.lasted_time then
			table.insert(var_86_0, iter_86_1)
		end
	end

	local var_86_3 = {
		tags = var_86_0
	}

	manager.net:SendWithLoadingNew(32116, var_86_3, 32117, var_0_0.OnChangTagList)
end

function var_0_0.OnChangTagList(arg_87_0, arg_87_1)
	if isSuccess(arg_87_0.result) then
		PlayerData:SetUsingTagList(arg_87_1.tags)
		manager.notify:CallUpdateFunc(CHANGE_TAG_LIST)
	else
		ShowTips(arg_87_0.result)
	end
end

var_0_0.SendLikeSrc = {
	MidAutumnActivity = 5,
	MultiPlayerGameRoom = 1,
	MultiPlayerGameResult = 2,
	AddFriend = 0,
	DormInfo = 4,
	PlayerInfo = 3,
	Activity = 6,
	IdolDanceGame = 7
}

function var_0_0.SendLike(arg_88_0, arg_88_1, arg_88_2)
	local var_88_0 = {
		uid = arg_88_0,
		source = arg_88_1,
		activity_id = arg_88_2 or 0
	}

	manager.net:SendWithLoadingNew(32118, var_88_0, 32119, var_0_0.OnSendLike)
end

function var_0_0.OnSendLike(arg_89_0, arg_89_1)
	if isSuccess(arg_89_0.result) then
		ForeignInfoData:OnSendLike()
		PlayerData:OnSendLike(arg_89_1.uid)
		manager.notify:CallUpdateFunc(SEND_LIKE)
	else
		ShowTips(arg_89_0.result)
	end
end

function var_0_0.ChangeChatBubble(arg_90_0, arg_90_1)
	manager.net:SendWithLoadingNew(32120, {
		chat_bubble = arg_90_0
	}, 32121, function(arg_91_0)
		if isSuccess(arg_91_0.result) then
			PlayerData:SetCurChatBubbleID(arg_90_0)
			arg_90_1()
		else
			ShowTips(arg_91_0.result)
		end
	end)
end

function var_0_0.InitChatBubbleRedPoint()
	local var_92_0 = GameSetting.profile_chat_bubble_default.value[1]

	for iter_92_0, iter_92_1 in ipairs(PlayerData:GetUnlockChatBubbleIDList()) do
		if iter_92_1 ~= var_92_0 and not RedPointData:GetIsRedPointOpen(RedPointConst.CHAT_BUBBLE_RANGE + iter_92_1) then
			manager.redPoint:setTip(string.format("%s_%s", RedPointConst.CHAT_BUBBLE, iter_92_1), 1)
		end
	end
end

function var_0_0.UseStoryTrigger(arg_93_0, arg_93_1, arg_93_2, arg_93_3)
	local var_93_0 = {
		trigger_id = arg_93_0,
		trigger_story = arg_93_1,
		trigger_text = arg_93_2,
		trigger_select = arg_93_3
	}

	manager.net:Push(81002, var_93_0)
	PlayerData:AddPlayerStoryTrigger(arg_93_0)
end

return var_0_0
