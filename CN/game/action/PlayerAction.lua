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
		local var_32_1 = arg_32_1.poster_girl
		local var_32_2 = SkinSceneActionCfg[var_32_1]

		if var_32_2 and var_32_0 ~= var_32_2.special_scene_id and var_32_0 ~= var_32_2.special_scene_id_2 then
			if HomeSceneSettingAction.CheckPosterSceneCanUse(var_32_2.special_scene_id) then
				HomeSceneSettingAction.SetHomeScene(var_32_2.special_scene_id)
				manager.notify:CallUpdateFunc(CHANGE_POSTER_GIRL, arg_32_0, arg_32_1)
				manager.notify:Invoke(CHANGE_POSTER_GIRL)

				return
			end

			if HomeSceneSettingAction.CheckPosterSceneCanUse(var_32_2.special_scene_id_2) then
				HomeSceneSettingAction.SetHomeScene(var_32_2.special_scene_id_2)
				manager.notify:CallUpdateFunc(CHANGE_POSTER_GIRL, arg_32_0, arg_32_1)
				manager.notify:Invoke(CHANGE_POSTER_GIRL)

				return
			end
		end

		manager.notify:CallUpdateFunc(CHANGE_POSTER_GIRL, arg_32_0, arg_32_1)
		manager.notify:Invoke(CHANGE_POSTER_GIRL)
	else
		ShowTips(arg_32_0.result)
	end
end

function var_0_0.ChangePosterGirlWithCallback(arg_33_0, arg_33_1)
	manager.net:SendWithLoadingNew(32016, {
		poster_girl = arg_33_0
	}, 32017, function(arg_34_0)
		if isSuccess(arg_34_0.result) then
			PlayerData:PlayerPosterGirlChange(arg_33_0)
			manager.notify:Invoke(CHANGE_POSTER_GIRL)

			if arg_33_1 then
				arg_33_1()
			end
		else
			ShowTips(arg_34_0.result)
		end
	end)
end

function var_0_0.TouchPosterGirl()
	manager.net:SendWithLoadingNew(32054, {}, 32055, function(arg_36_0)
		if not isSuccess(arg_36_0.result) then
			ShowTips(arg_36_0.result)
		end
	end)
end

function var_0_0.ChangeStoryList(arg_37_0, arg_37_1)
	local var_37_0 = PlayerData:GetStoryList()
	local var_37_1 = {
		story_id = arg_37_0
	}

	if var_37_0[arg_37_0] then
		PlayerData:StoryModify(arg_37_0)
		IllustratedAction.ModifyPlot(arg_37_0)

		if arg_37_1 then
			arg_37_1({
				result = 1
			}, var_37_1)
		end
	else
		var_0_0.OnChangeStoryListCallBack = arg_37_1

		manager.net:SendWithLoadingNew(12002, var_37_1, 12003, var_0_0.OnChangeStoryList)
	end
end

function var_0_0.OnChangeStoryList(arg_38_0, arg_38_1)
	PlayerData:StoryModify(arg_38_1.story_id)
	IllustratedAction.ModifyPlot(arg_38_1.story_id)

	if var_0_0.OnChangeStoryListCallBack then
		var_0_0.OnChangeStoryListCallBack(arg_38_0, arg_38_1)

		var_0_0.OnChangeStoryListCallBack = nil
	end
end

function var_0_0.ChangePortrait(arg_39_0)
	local var_39_0 = {
		icon_id = arg_39_0
	}

	manager.net:SendWithLoadingNew(32032, var_39_0, 32033, var_0_0.OnChangePortrait)
end

function var_0_0.OnChangePortrait(arg_40_0, arg_40_1)
	if isSuccess(arg_40_0.result) then
		PlayerData:ChangePortrait(arg_40_1.icon_id)
		manager.notify:CallUpdateFunc(CHANGE_PORTRAIT)
	else
		ShowTips(arg_40_0.result)
	end
end

function var_0_0.ChangePlayerBirthday(arg_41_0, arg_41_1)
	local var_41_0 = {
		month = arg_41_0,
		day = arg_41_1
	}

	manager.net:SendWithLoadingNew(12030, var_41_0, 12031, var_0_0.OnChangeBirthday)
end

function var_0_0.OnChangeBirthday(arg_42_0, arg_42_1)
	if isSuccess(arg_42_0.result) then
		PlayerData:SetPlayerBirthday(arg_42_1)
		manager.notify:CallUpdateFunc(CHANGE_BIRTHDAY)
	else
		ShowTips(arg_42_0.result)
	end
end

function var_0_0.ChangeFrameIcon(arg_43_0)
	local var_43_0 = {
		iconframe_id = arg_43_0
	}

	manager.net:SendWithLoadingNew(32034, var_43_0, 32035, var_0_0.OnChangeFrameIcon)
end

function var_0_0.OnChangeFrameIcon(arg_44_0, arg_44_1)
	if isSuccess(arg_44_0.result) then
		PlayerData:ChangeFrameIcon(arg_44_1.iconframe_id)
		manager.notify:CallUpdateFunc(CHANGE_FRAME)
	else
		ShowTips(arg_44_0.result)
	end
end

function var_0_0.SyncStickerPageUpdateToServer(arg_45_0, arg_45_1)
	local var_45_0 = {}

	for iter_45_0, iter_45_1 in pairs(arg_45_1) do
		local var_45_1 = arg_45_0[iter_45_0]

		if var_45_1 then
			local var_45_2 = {
				page_id = iter_45_0,
				foreground = var_45_1.foreground,
				sticker_display_info = {}
			}

			for iter_45_2, iter_45_3 in ipairs(var_45_1.hierarchy) do
				table.insert(var_45_2.sticker_display_info, {
					sticker_id = iter_45_3,
					location_x = var_45_1.sticker[iter_45_3].positionX,
					location_y = var_45_1.sticker[iter_45_3].positionY,
					scale = var_45_1.sticker[iter_45_3].scale,
					layer = iter_45_2,
					rotate = var_45_1.sticker[iter_45_3].rotation
				})
			end

			table.insert(var_45_0, var_45_2)
		end
	end

	if #var_45_0 == 0 then
		return
	end

	PlayerData:SetStickerEditData(arg_45_0)

	local var_45_3 = {
		sticker_show_info = var_45_0
	}

	manager.net:Push(32038, var_45_3)
end

function var_0_0.SyncStickerShowToServer(arg_46_0)
	manager.net:SendWithLoadingNew(32056, {
		page_id = arg_46_0
	}, 32057, function(arg_47_0, arg_47_1)
		if isSuccess(arg_47_0.result) then
			PlayerData:ChangeStickerShow(arg_46_0)
		else
			ShowTips(arg_47_0.result)
		end
	end)
end

function var_0_0.RequestToRewardStickerSuit(arg_48_0)
	manager.net:SendWithLoadingNew(32058, {
		reward_id_list = {
			arg_48_0
		}
	}, 32059, function(arg_49_0, arg_49_1)
		if isSuccess(arg_49_0.result) then
			PlayerData:AddStickerSuitReward(arg_48_0)

			local var_49_0 = mergeReward2(arg_49_0.reward_list or {})

			if #var_49_0 > 0 then
				getReward2(var_49_0, {
					ItemConst.ITEM_TYPE.HERO,
					ItemConst.ITEM_TYPE.WEAPON_SERVANT
				})
			end
		else
			ShowTips(arg_49_0.result)
		end
	end)
end

function var_0_0.ReceiveSkinGift(arg_50_0)
	local var_50_0 = {
		skin_id = arg_50_0
	}

	manager.net:SendWithLoadingNew(32052, var_50_0, 32053, var_0_0.OnReceiveSkinGift)
end

function var_0_0.OnReceiveSkinGift(arg_51_0, arg_51_1)
	if isSuccess(arg_51_0.result) then
		PlayerData:ReceiveSkinGift(arg_51_1.skin_id)
		manager.redPoint:setTip(RedPointConst.SKIN_GIFT .. "_" .. arg_51_1.skin_id, 0)

		local var_51_0 = SkinCfg[arg_51_1.skin_id].gift

		getReward(formatRewardCfgList(var_51_0))
		manager.notify:Invoke(GET_SKIN_GIFT)
	else
		ShowTips(arg_51_0.result)
	end
end

function var_0_0.RefreshSkinGiftRedPoint()
	for iter_52_0, iter_52_1 in ipairs(SkinCfg.all) do
		if #SkinCfg[iter_52_1].gift > 0 and HeroTools.IsSkinUnlock(iter_52_1) then
			local var_52_0 = SkinCfg[iter_52_1].hero

			if HeroData:GetHeroList()[var_52_0].unlock > 0 and PlayerData:IsNotReceived(iter_52_1) then
				manager.redPoint:setTip(RedPointConst.SKIN_GIFT .. "_" .. iter_52_1, 1)
			else
				manager.redPoint:setTip(RedPointConst.SKIN_GIFT .. "_" .. iter_52_1, 0)
			end
		else
			manager.redPoint:setTip(RedPointConst.SKIN_GIFT .. "_" .. iter_52_1, 0)
		end
	end
end

function var_0_0.PlayInfoInit(arg_53_0)
	PlayerData:PlayInfoInit(arg_53_0)
end

function var_0_0.PlayerBrithdayInit(arg_54_0)
	PlayerData:SetPlayerBirthday({
		month = arg_54_0.month,
		day = arg_54_0.day
	})
end

function var_0_0.SetPlayerIP(arg_55_0)
	PlayerData:SetPlayerIP(arg_55_0)
end

function var_0_0.UserBaseInfoInit(arg_56_0)
	PlayerData:UserBaseInfoInit(arg_56_0)
end

function var_0_0.UserLoginTimestampInit(arg_57_0)
	PlayerData:UserLoginTimestampInit(arg_57_0)
end

function var_0_0.LevelUpFinish(arg_58_0)
	PlayerData:LevelUpFinish(arg_58_0)
end

function var_0_0.ChangeLevel(arg_59_0, arg_59_1)
	PlayerData:ChangeLevel({
		fromLevel = arg_59_0,
		toLevel = arg_59_1
	})
	ActivityNewbieAction.PlayerUpgradeRedPoint()
	BattleStageAction.UpdateSubPlotRedPoint()
	BattleStageAction.UpdateActivityRedPoint()
	EquipSeizureAction.InitRedPointEveryDay()
	BattleEquipAction.UpdateRedPoint()
	DailyNewRedPoint:InitNewTagData()
end

function var_0_0.EXPChange(arg_60_0)
	PlayerData:EXPChange(arg_60_0)
end

function var_0_0.ModifyHeroNick(arg_61_0)
	PlayerData:ModifyHeroNick(arg_61_0)
end

function var_0_0.PlayerOriginalLevel(arg_62_0)
	PlayerData:PlayerOriginalLevel(arg_62_0)
end

function var_0_0.StoryModify(arg_63_0)
	PlayerData:StoryModify(arg_63_0)
end

function var_0_0.StoryInit(arg_64_0)
	PlayerData:StoryInit(arg_64_0)
end

function var_0_0.PlayerShowHeroChange(arg_65_0)
	PlayerData:PlayerShowHeroChange(arg_65_0)
end

function var_0_0.PlayerCardInit(arg_66_0)
	PlayerData:PlayerCardInit(arg_66_0)

	local var_66_0 = PlayerData:GetStickerList()

	for iter_66_0, iter_66_1 in ipairs(var_66_0) do
		if not getData("PlayerCustomStickerTriggered", "StickerItem_" .. iter_66_1) then
			manager.redPoint:setTip(RedPointConst.CUSTOM_STICKER_ITEM .. "_" .. iter_66_1, 1)
		end
	end

	local var_66_1 = PlayerData:GetStickerBgList()

	for iter_66_2, iter_66_3 in ipairs(var_66_1) do
		if not getData("PlayerCustomStickerTriggered", "StickerItem_" .. iter_66_3) then
			manager.redPoint:setTip(RedPointConst.CUSTOM_STICKER_ITEM .. "_" .. iter_66_3, 1)
		end
	end

	local var_66_2 = PlayerData:GetStickerFgList()

	for iter_66_4, iter_66_5 in ipairs(var_66_2) do
		if not getData("PlayerCustomStickerTriggered", "StickerItem_" .. iter_66_5) then
			manager.redPoint:setTip(RedPointConst.CUSTOM_STICKER_ITEM .. "_" .. iter_66_5, 1)
		end
	end

	for iter_66_6, iter_66_7 in ipairs(StickerSuitCfg.all) do
		if PlayerData:CheckStickerSuitReward(iter_66_7) then
			manager.redPoint:setTip(RedPointConst.CUSTOM_STICKER_SUIT_REWARD .. "_" .. iter_66_7, 0)
		else
			local var_66_3 = StickerSuitCfg[iter_66_7]
			local var_66_4 = true

			for iter_66_8, iter_66_9 in ipairs(var_66_3.content) do
				local var_66_5 = ProfileDecorateItemCfg[iter_66_9]

				if var_66_5.item_type == 4 then
					var_66_4 = PlayerData:GetStickerBg(iter_66_9).lock
				elseif var_66_5.item_type == 5 then
					var_66_4 = PlayerData:GetSticker(iter_66_9).lock
				elseif var_66_5.item_type == 6 then
					var_66_4 = PlayerData:GetStickerFg(iter_66_9).lock
				end

				if var_66_4 then
					manager.redPoint:setTip(RedPointConst.CUSTOM_STICKER_SUIT_REWARD .. "_" .. iter_66_7, 0)

					break
				end
			end

			if not var_66_4 then
				manager.redPoint:setTip(RedPointConst.CUSTOM_STICKER_SUIT_REWARD .. "_" .. iter_66_7, 1)
			end
		end
	end

	local var_66_6 = {
		random_model = 0,
		random_list = {}
	}
	local var_66_7 = {
		show_hero_dressing_scene = false,
		random_model = 0,
		routine_hero_dressing_scene = false,
		random_list = {}
	}

	for iter_66_10, iter_66_11 in ipairs(arg_66_0.random_info) do
		if iter_66_11.random_type == 2 then
			var_66_6 = iter_66_11
		elseif iter_66_11.random_type == 1 then
			var_66_7 = iter_66_11
		end
	end

	HomeSceneSettingData:InitData(arg_66_0.poster_background_list, arg_66_0.poster_background_id, var_66_6)
	PlayerData:SetRandomHeroData(var_66_7)
end

function var_0_0.InitOverdueFrameList(arg_67_0)
	PlayerData:InitOverdueFrameList(arg_67_0.icon_frame_list or {})
end

function var_0_0.PlayerProtraitChange(arg_68_0)
	PlayerData:PlayerProtraitChange(arg_68_0)
end

function var_0_0.UnlockSticker(arg_69_0)
	PlayerData:UnlockSticker(arg_69_0)
end

function var_0_0.UnlockStickerBg(arg_70_0)
	PlayerData:UnlockStickerBg(arg_70_0)
end

function var_0_0.UnlockStickerFg(arg_71_0)
	PlayerData:UnlockStickerFg(arg_71_0)
end

function var_0_0.UnlockPortrait(arg_72_0, arg_72_1)
	PlayerData:UnlockPortrait(arg_72_0, arg_72_1)
end

function var_0_0.UnlockFrame(arg_73_0)
	PlayerData:UnlockFrame(arg_73_0)
end

function var_0_0.LockFrame(arg_74_0, arg_74_1)
	PlayerData:LockFrame(arg_74_1)
end

function var_0_0.OnClientModuleSwitch(arg_75_0)
	PlayerData:InitModuleSwitchData(arg_75_0)
end

function var_0_0.AwakeName(arg_76_0, arg_76_1)
	manager.net:SendWithLoadingNew(23012, {
		nick = arg_76_0
	}, 23013, function(arg_77_0)
		if isSuccess(arg_77_0.result) then
			PlayerData:PlayerNicknameChange(arg_76_0)
			PlayerData:UpdateNameChangeInfo(arg_77_0)
			arg_76_1()
		else
			ShowTips(arg_77_0.result)
		end
	end)
end

function var_0_0.DealOverdueFrame()
	manager.net:SendWithLoadingNew(32040, {}, 32041, var_0_0.OnDealOverdueFrame)
end

function var_0_0.OnDealOverdueFrame(arg_79_0, arg_79_1)
	if isSuccess(arg_79_0.result) then
		-- block empty
	else
		ShowTips(arg_79_0.result)
	end
end

function var_0_0.DealOverdueCardBgList()
	manager.net:SendWithLoadingNew(32206, {
		nothing = 0
	}, 32207, var_0_0.OnDealOverdueCardBgList)
end

function var_0_0.OnDealOverdueCardBgList(arg_81_0, arg_81_1)
	if isSuccess(arg_81_0.result) then
		-- block empty
	else
		ShowTips(arg_81_0.result)
	end
end

function var_0_0.DealOverdueTagList()
	manager.net:SendWithLoadingNew(32208, {
		nothing = 1
	}, 32209, var_0_0.OnDealOverdueTagList)
end

function var_0_0.OnDealOverdueTagList(arg_83_0, arg_83_1)
	if isSuccess(arg_83_0.result) then
		-- block empty
	else
		ShowTips(arg_83_0.result)
	end
end

function var_0_0.ReadUnclaimedMessage(arg_84_0)
	local var_84_0 = {
		id = arg_84_0
	}

	manager.net:SendWithLoadingNew(12024, var_84_0, 12025, var_0_0.OnReadUnclaimedMessageCallback)
end

function var_0_0.OnReadUnclaimedMessageCallback(arg_85_0, arg_85_1)
	if isSuccess(arg_85_0.result) then
		PlayerData:ReadUnclaimed(arg_85_1.id)
	else
		ShowTips(GetTips(arg_85_0.result))
	end
end

function var_0_0.CheckRecommendEquip(arg_86_0, arg_86_1)
	manager.net:SendWithLoadingNew(32042, {
		role_id = arg_86_0
	}, 32043, function(arg_87_0)
		if isSuccess(arg_87_0.result) then
			if arg_86_1 then
				arg_86_1()
			end
		else
			ShowTips(GetTips(arg_87_0.result))
		end
	end)
end

function var_0_0.CheckHeroVoice(arg_88_0, arg_88_1)
	manager.net:SendWithLoadingNew(32044, {
		role_id = arg_88_0
	}, 32045, function(arg_89_0)
		if isSuccess(arg_89_0.result) then
			if arg_88_1 then
				arg_88_1()
			end
		else
			ShowTips(GetTips(arg_89_0.result))
		end
	end)
end

function var_0_0.ChangeCardBg(arg_90_0)
	local var_90_0 = {
		id = arg_90_0
	}

	manager.net:SendWithLoadingNew(32114, var_90_0, 32115, var_0_0.OnChangeCardBg)
end

function var_0_0.OnChangeCardBg(arg_91_0, arg_91_1)
	if isSuccess(arg_91_0.result) then
		PlayerData:SetCardBg(arg_91_1.id)
		manager.notify:CallUpdateFunc(CHANGE_CARD_BG, arg_91_1.id)
	else
		ShowTips(arg_91_0.result)
	end
end

function var_0_0.ChangTagList(arg_92_0)
	local var_92_0 = {}
	local var_92_1 = manager.time:GetServerTime()

	for iter_92_0, iter_92_1 in ipairs(arg_92_0) do
		local var_92_2 = PlayerData:GetTagInfo(iter_92_1)

		if var_92_2.lasted_time == 0 or var_92_1 < var_92_2.lasted_time then
			table.insert(var_92_0, iter_92_1)
		end
	end

	local var_92_3 = {
		tags = var_92_0
	}

	manager.net:SendWithLoadingNew(32116, var_92_3, 32117, var_0_0.OnChangTagList)
end

function var_0_0.OnChangTagList(arg_93_0, arg_93_1)
	if isSuccess(arg_93_0.result) then
		PlayerData:SetUsingTagList(arg_93_1.tags)
		manager.notify:CallUpdateFunc(CHANGE_TAG_LIST)
	else
		ShowTips(arg_93_0.result)
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

function var_0_0.SendLike(arg_94_0, arg_94_1, arg_94_2)
	local var_94_0 = {
		uid = arg_94_0,
		source = arg_94_1,
		activity_id = arg_94_2 or 0
	}

	manager.net:SendWithLoadingNew(32118, var_94_0, 32119, var_0_0.OnSendLike)
end

function var_0_0.OnSendLike(arg_95_0, arg_95_1)
	if isSuccess(arg_95_0.result) then
		ForeignInfoData:OnSendLike()
		PlayerData:OnSendLike(arg_95_1.uid)
		manager.notify:CallUpdateFunc(SEND_LIKE)
	else
		ShowTips(arg_95_0.result)
	end
end

function var_0_0.ChangeChatBubble(arg_96_0, arg_96_1)
	manager.net:SendWithLoadingNew(32120, {
		chat_bubble = arg_96_0
	}, 32121, function(arg_97_0)
		if isSuccess(arg_97_0.result) then
			PlayerData:SetCurChatBubbleID(arg_96_0)
			arg_96_1()
		else
			ShowTips(arg_97_0.result)
		end
	end)
end

function var_0_0.InitChatBubbleRedPoint()
	local var_98_0 = GameSetting.profile_chat_bubble_default.value[1]

	for iter_98_0, iter_98_1 in ipairs(PlayerData:GetUnlockChatBubbleIDList()) do
		if iter_98_1 ~= var_98_0 then
			RedPointData:GetIsRedPointOpen(RedPointConst.CHAT_BUBBLE_RANGE + iter_98_1)
		end
	end
end

function var_0_0.UseStoryTrigger(arg_99_0, arg_99_1, arg_99_2, arg_99_3)
	local var_99_0 = {
		trigger_id = arg_99_0,
		trigger_story = arg_99_1,
		trigger_text = arg_99_2,
		trigger_select = arg_99_3
	}

	manager.net:Push(81002, var_99_0)
	PlayerData:AddPlayerStoryTrigger(arg_99_0)
end

function var_0_0.UploadRandomSceneGirlSetting(arg_100_0, arg_100_1, arg_100_2)
	local var_100_0 = {
		random_info_list = {}
	}

	if arg_100_0 then
		table.insert(var_100_0.random_info_list, arg_100_0)
	end

	if arg_100_1 then
		table.insert(var_100_0.random_info_list, arg_100_1)
	end

	for iter_100_0, iter_100_1 in ipairs(var_100_0.random_info_list) do
		iter_100_1.show_hero_dressing_scene = iter_100_1.show_hero_dressing_scene and 1 or 0
		iter_100_1.routine_hero_dressing_scene = iter_100_1.routine_hero_dressing_scene and 1 or 0
	end

	manager.net:SendWithLoadingNew(32122, var_100_0, 32123, arg_100_2)
end

function var_0_0.SetIsRandomHero(arg_101_0, arg_101_1)
	local var_101_0 = PlayerTools.MakeRandomModeData(arg_101_0, PlayerData:GetRandomHeroMode())

	manager.net:SendWithLoadingNew(32124, {
		type = 1,
		model = var_101_0
	}, 32125, function(arg_102_0)
		if isSuccess(arg_102_0.result) then
			PlayerData:SetIsRandomHero(arg_101_0)
			arg_101_1()
		else
			ShowTips(arg_102_0.result)
		end
	end)
end

function var_0_0.SetRandomHeroMode(arg_103_0, arg_103_1)
	local var_103_0 = PlayerTools.MakeRandomModeData(PlayerData:IsRandomHero(), arg_103_0)

	manager.net:SendWithLoadingNew(32124, {
		type = 1,
		model = var_103_0
	}, 32125, function(arg_104_0)
		if isSuccess(arg_104_0.result) then
			PlayerData:SetRandomHeroMode(arg_103_0)
			arg_103_1()
			manager.notify:Invoke(CUSTOM_CENTER_SWITCH_RANDOM_MODE)
		else
			ShowTips(arg_104_0.result)
		end
	end)
end

function var_0_0.SetRandomHeroList(arg_105_0, arg_105_1)
	manager.net:SendWithLoadingNew(32130, {
		type = 1,
		random_list = arg_105_0
	}, 32131, function(arg_106_0)
		if isSuccess(arg_106_0.result) then
			PlayerData:SetRandomHeroList(arg_105_0)
			arg_105_1()
		else
			ShowTips(arg_106_0.result)
		end
	end)
end

function var_0_0.SetIsRandomHeroUseDlcScene(arg_107_0, arg_107_1)
	manager.net:SendWithLoadingNew(32126, {
		type = 1,
		show_hero_dressing_scene = arg_107_0
	}, 32127, function(arg_108_0)
		if isSuccess(arg_108_0.result) then
			PlayerData:SetIsRandomHeroUseDlcScene(arg_107_0)
			HomeSceneSettingData:SetIsUseDlcScene(arg_107_0)
			arg_107_1()
		else
			ShowTips(arg_108_0.result)
		end
	end)
end

function var_0_0.SetIsRandomHeroShowEachDebutAnim(arg_109_0, arg_109_1)
	manager.net:SendWithLoadingNew(32128, {
		type = 1,
		routine_hero_dressing_scene = arg_109_0
	}, 32129, function(arg_110_0)
		if isSuccess(arg_110_0.result) then
			PlayerData:SetIsRandomHeroShowEachDebutAnim(arg_109_0)
			arg_109_1()
			arg_109_1()
		else
			ShowTips(arg_110_0.result)
		end
	end)
end

return var_0_0
