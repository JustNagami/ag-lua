local var_0_0 = singletonClass("PlayerData")

var_0_0.INVALID_PLAYER = "0"

local var_0_1 = {
	userID = 1,
	show_hero_flag = 1,
	remain_exp = 0,
	likes = 0,
	show_sticker_flag = 1,
	is_changed_nick = 0,
	plot_progress = 0,
	hero_num = 0,
	poster_girl = 1084,
	register_timestamp = 0,
	icon_frame = 2001,
	ip = "",
	extra_chang_nick_time = 0,
	timestamp = 0,
	card_bg_id = 0,
	total_exp = 0,
	birthday_day = 0,
	originalLevel = 1,
	birthday_month = 0,
	nick = "",
	signUserId = "",
	portrait = 1084,
	userLevel = 10,
	sticker_background = 0,
	sign = "",
	sticker_show = {},
	all_background_list = {},
	all_sticker_list = {},
	sticker_show_info = {},
	unlocked_portraits = {},
	icon_frame_list = {},
	heroes = {},
	storylist = {},
	levelUpInfos = {},
	likes_list = {},
	today_send_like = {},
	card_background_list = {},
	tag_info_list = {},
	used_tag_list = {},
	used_chat_buddle_id = GameSetting.profile_chat_bubble_default.value[1],
	chat_bubble_unlock_id_list = {
		GameSetting.profile_chat_bubble_default.value[1]
	}
}

function var_0_0.Init(arg_1_0)
	var_0_1.levelUpInfos = {}
end

local var_0_2 = {}
local var_0_3 = {}
local var_0_4 = {}
local var_0_5 = {}
local var_0_6 = {}
local var_0_7 = {}
local var_0_8 = {}
local var_0_9 = {}
local var_0_10 = {}
local var_0_11 = {}
local var_0_12 = {}
local var_0_13 = {}
local var_0_14 = {}

function var_0_0.PlayInfoInit(arg_2_0, arg_2_1)
	var_0_1.total_exp = arg_2_1.total_exp
	var_0_1.userLevel, var_0_1.remain_exp = LvTools.CheckExp(1, var_0_1.total_exp, "user_level_exp")
	var_0_1.is_changed_nick = arg_2_1.is_changed_nick
	var_0_1.extra_chang_nick_time = arg_2_1.system_change_nick_times or 0

	if var_0_1.nick ~= "" and var_0_1.nick ~= arg_2_1.nick then
		manager.notify:CallUpdateFunc(CHANGE_NAME, arg_2_1)
	end

	var_0_1.nick = arg_2_1.nick
	var_0_1.hero_num = arg_2_1.hero_num
	var_0_1.plot_progress = arg_2_1.plot_progress

	manager.notify:Invoke(PLAYER_MODIFIED)

	if var_0_1.ip == "" then
		var_0_1.ip = GetTips("IP_UNKNOWN")
	end
end

function var_0_0.SetPlayerIP(arg_3_0, arg_3_1)
	var_0_1.ip = arg_3_1.ip_location or GetTips("IP_UNKNOWN")
end

function var_0_0.SetPlayerBirthday(arg_4_0, arg_4_1)
	var_0_1.birthday_month = arg_4_1.month
	var_0_1.birthday_day = arg_4_1.day

	manager.redPoint:setTip(RedPointConst.BRITHDAY, arg_4_1.month == 0 and 1 or 0)
end

function var_0_0.GetPlayerBrithday(arg_5_0)
	return var_0_1.birthday_month, var_0_1.birthday_day
end

function var_0_0.GetPlayerInfo(arg_6_0)
	var_0_1.icon_frame = arg_6_0:GetCurFrame()
	var_0_1.card_bg_id = arg_6_0:GetCurCardBg()

	return var_0_1
end

function var_0_0.GetStoryList(arg_7_0)
	return var_0_1.storylist
end

function var_0_0.GetlevelUpInfos(arg_8_0)
	return var_0_1.levelUpInfos and deepClone(var_0_1.levelUpInfos) or {}
end

function var_0_0.UserBaseInfoInit(arg_9_0, arg_9_1)
	var_0_1.userID = arg_9_1.userID
	var_0_1.register_timestamp = arg_9_1.register_timestamp
	var_0_1.signUserId = arg_9_1.uid_sign
end

function var_0_0.UserLoginTimestampInit(arg_10_0, arg_10_1)
	var_0_1.timestamp = arg_10_1.timestamp
end

function var_0_0.PlayerProtraitChange(arg_11_0, arg_11_1)
	var_0_1.portrait = arg_11_1.portrait
end

function var_0_0.PlayerNicknameChange(arg_12_0, arg_12_1)
	var_0_1.nick = arg_12_1
end

function var_0_0.GetExtraChangeNickTime(arg_13_0)
	return var_0_1.extra_chang_nick_time
end

function var_0_0.UpdateNameChangeInfo(arg_14_0, arg_14_1)
	if not arg_14_1 then
		return
	end

	var_0_1.extra_chang_nick_time = arg_14_1.system_change_nick_times or 0
	var_0_1.is_changed_nick = arg_14_1.is_changed_nick or 0
end

function var_0_0.GetIP(arg_15_0)
	return var_0_1.ip
end

function var_0_0.EXPChange(arg_16_0, arg_16_1)
	var_0_1.total_exp = arg_16_1

	local var_16_0 = var_0_1.userLevel

	var_0_1.userLevel, var_0_1.remain_exp = LvTools.CheckExp(1, var_0_1.total_exp, "user_level_exp")

	local var_16_1 = var_0_1.userLevel

	if var_16_0 ~= var_16_1 then
		manager.notify:Invoke(PLAYER_LEVEL_UP, var_16_0, var_16_1)
		SDKTools.SetDefaultPublicAttribute()
		SendMessageManagerToSDK("role_level", {
			level = var_16_1
		})
	end
end

function var_0_0.PlayerCardInit(arg_17_0, arg_17_1)
	var_0_1.sign = arg_17_1.sign
	var_0_1.heroes = cleanProtoTable(arg_17_1.heroes)
	var_0_1.sticker_show = cleanProtoTable(arg_17_1.sticker_show, {
		"sticker_id",
		"location"
	})
	var_0_1.all_background_list = cleanProtoTable(arg_17_1.all_background_list)
	var_0_1.sticker_show_info = var_0_0:InitStickerShowList(arg_17_1.sticker_show_info or {})
	var_0_1.sticker_background = arg_17_1.sticker_background or GameSetting.sticker_background_default.value[1]
	var_0_1.all_sticker_list = cleanProtoTable(arg_17_1.all_sticker_list)
	var_0_1.unlocked_portraits = cleanProtoTable(arg_17_1.icon_list)
	var_0_1.icon_frame_list = cleanProtoTable(arg_17_1.icon_frame_list, {
		"id",
		"lasted_time"
	})
	var_0_1.likes = arg_17_1.likes
	var_0_1.likes_list = cleanProtoTable(arg_17_1.info_list, {
		"id",
		"time"
	})
	var_0_1.today_send_like = cleanProtoTable(arg_17_1.today_send_like)
	var_0_1.card_background_list = cleanProtoTable(arg_17_1.information_background_list, {
		"id",
		"lasted_time"
	})
	var_0_1.tag_info_list = cleanProtoTable(arg_17_1.tag_info_list, {
		"id",
		"lasted_time",
		"obtain_time"
	})
	var_0_1.used_tag_list = cleanProtoTable(arg_17_1.used_tag_list or {})
	var_0_1.card_bg_id = arg_17_1.information_background_id
	var_0_1.used_chat_buddle_id = arg_17_1.chat_bubble or GameSetting.profile_chat_bubble_default.value[1]
	var_0_1.chat_bubble_unlock_id_list = cleanProtoTable(arg_17_1.chat_bubble_list or {
		GameSetting.profile_chat_bubble_default.value[1]
	})

	if arg_17_1.poster_girl and arg_17_1.poster_girl ~= 0 then
		var_0_1.poster_girl = arg_17_1.poster_girl
	else
		var_0_1.poster_girl = 1084
	end

	if arg_17_1.icon and arg_17_1.icon ~= 0 and arg_17_1.icon ~= 1 then
		var_0_1.portrait = arg_17_1.icon
	else
		var_0_1.portrait = GameSetting.profile_avatar_default.value[1]
	end

	if arg_17_1.icon_frame and arg_17_1.icon_frame ~= 0 and arg_17_1.icon_frame ~= 1 then
		var_0_1.icon_frame = arg_17_1.icon_frame
	else
		var_0_1.icon_frame = GameSetting.profile_avatar_frame_default.value[1]
	end

	var_0_0:InitStickerList()
	var_0_0:InitStickerBgList()
	var_0_0:InitPortraitList()
	var_0_0:InitFrameList()
	var_0_0:InitCardBgList()
	var_0_0:InitTagInfoList()

	var_0_7 = {}
	var_0_11 = {}
	var_0_13 = {}
end

function var_0_0.InitStickerShowList(arg_18_0, arg_18_1)
	local var_18_0 = {}

	for iter_18_0, iter_18_1 in ipairs(arg_18_1) do
		local var_18_1 = {}

		for iter_18_2, iter_18_3 in ipairs(iter_18_1.sticker_display_info) do
			var_18_1[iter_18_3.location] = {
				stickerID = iter_18_3.sticker_id,
				size = iter_18_3.size
			}
		end

		var_18_0[iter_18_1.page_id] = {
			index = iter_18_1.page_id,
			viewID = iter_18_1.template_id,
			sticker = var_18_1
		}
	end

	return var_18_0
end

function var_0_0.InitOverdueFrameList(arg_19_0, arg_19_1)
	if #arg_19_1 > 0 then
		for iter_19_0, iter_19_1 in ipairs(arg_19_1) do
			local var_19_0 = iter_19_1.id
			local var_19_1 = iter_19_1.num
			local var_19_2 = iter_19_1.time_valid

			table.insert(var_0_7, {
				id = var_19_0,
				num = var_19_1,
				timeValid = var_19_2
			})
		end
	end
end

function var_0_0.InitOverdueCardBgList(arg_20_0, arg_20_1)
	if #arg_20_1 > 0 then
		for iter_20_0, iter_20_1 in ipairs(arg_20_1) do
			local var_20_0 = {
				num = 1,
				id = iter_20_1.id,
				timeValid = iter_20_1.time_valid
			}

			table.insert(var_0_11, var_20_0)
		end
	end
end

function var_0_0.InitOverdueTagList(arg_21_0, arg_21_1)
	if #arg_21_1 > 0 then
		for iter_21_0, iter_21_1 in ipairs(arg_21_1) do
			local var_21_0 = {
				num = 1,
				id = iter_21_1.id,
				time_valid = iter_21_1.time_valid
			}

			table.insert(var_0_13, var_21_0)
		end
	end
end

function var_0_0.PlayerSignChange(arg_22_0, arg_22_1)
	var_0_1.sign = arg_22_1
end

function var_0_0.PlayerShowHeroChange(arg_23_0, arg_23_1)
	var_0_1.heroes = cleanProtoTable(arg_23_1)
end

function var_0_0.PlayerPosterGirlChange(arg_24_0, arg_24_1)
	var_0_1.poster_girl = arg_24_1
end

function var_0_0.StoryInit(arg_25_0, arg_25_1)
	var_0_1.storylist = {}

	for iter_25_0, iter_25_1 in ipairs(arg_25_1) do
		var_0_1.storylist[iter_25_1] = true
	end
end

function var_0_0.StoryModify(arg_26_0, arg_26_1)
	var_0_1.storylist[arg_26_1] = true
end

function var_0_0.PlayerOriginalLevel(arg_27_0, arg_27_1)
	var_0_1.originalLevel = arg_27_1.user_level
end

function var_0_0.ChangeLevel(arg_28_0, arg_28_1)
	if not var_0_1.levelUpInfos then
		var_0_1.levelUpInfos = {}
	end

	local var_28_0 = arg_28_1.fromLevel
	local var_28_1 = arg_28_1.toLevel

	if #var_0_1.levelUpInfos > 0 then
		var_28_0 = math.min(var_0_1.levelUpInfos[1].fromLevel, var_28_0)
		var_28_1 = math.max(var_0_1.levelUpInfos[1].toLevel, var_28_1)
	end

	var_0_1.levelUpInfos[1] = {
		fromLevel = var_28_0,
		toLevel = var_28_1
	}
end

function var_0_0.LevelUpFinish(arg_29_0, arg_29_1)
	if var_0_1.levelUpInfos then
		while table.getn(var_0_1.levelUpInfos) > 0 do
			table.remove(var_0_1.levelUpInfos, 1)
		end
	end
end

function var_0_0.InitModuleSwitchData(arg_30_0, arg_30_1)
	return
end

function var_0_0.GetModuleSwitchData(arg_31_0, arg_31_1)
	return var_0_2[arg_31_1]
end

function var_0_0.InitStickerList(arg_32_0)
	var_0_4 = {}
	var_0_4.get_sticker_id_list = {}

	local var_32_0 = ItemCfg.get_id_list_by_type[ItemConst.ITEM_TYPE.STICKER]

	for iter_32_0, iter_32_1 in ipairs(var_32_0) do
		var_0_4[iter_32_1] = {
			unlock = 0,
			id = iter_32_1
		}

		table.insert(var_0_4.get_sticker_id_list, iter_32_1)
	end

	for iter_32_2, iter_32_3 in ipairs(var_0_1.all_sticker_list) do
		if var_0_4[iter_32_3] then
			var_0_4[iter_32_3].unlock = 1
		end
	end
end

function var_0_0.InitStickerBgList(arg_33_0)
	var_0_3 = {}
	var_0_3.get_sticker_bg_id_list = {}

	local var_33_0 = ItemCfg.get_id_list_by_type[ItemConst.ITEM_TYPE.STICKER_BG]

	for iter_33_0, iter_33_1 in ipairs(var_33_0) do
		var_0_3[iter_33_1] = {
			unlock = 0,
			id = iter_33_1
		}

		table.insert(var_0_3.get_sticker_bg_id_list, iter_33_1)
	end

	for iter_33_2, iter_33_3 in ipairs(var_0_1.all_background_list) do
		if var_0_3[iter_33_3] then
			var_0_3[iter_33_3].unlock = 1
		end
	end
end

function var_0_0.InitPortraitList(arg_34_0)
	var_0_5 = {}
	var_0_5.get_portrait_id_list = {}

	local var_34_0 = ItemCfg.get_id_list_by_type[ItemConst.ITEM_TYPE.PORTRAIT]

	for iter_34_0, iter_34_1 in ipairs(var_34_0) do
		var_0_5[iter_34_1] = {
			unlock = 0,
			id = iter_34_1
		}

		table.insert(var_0_5.get_portrait_id_list, iter_34_1)
	end

	for iter_34_2, iter_34_3 in ipairs(var_0_1.unlocked_portraits) do
		if var_0_5[iter_34_3] then
			var_0_5[iter_34_3].unlock = 1
		end
	end
end

function var_0_0.InitFrameList(arg_35_0)
	var_0_6 = {}
	var_0_6.get_frame_id_list = {}

	local var_35_0 = ItemCfg.get_id_list_by_type[ItemConst.ITEM_TYPE.FRAME]

	for iter_35_0, iter_35_1 in ipairs(var_35_0) do
		if ItemCfg[iter_35_1].sub_type ~= ItemConst.ITEM_SUB_TYPE.FRAME_LIMIT then
			var_0_6[iter_35_1] = {
				lasted_time = 0,
				unlock = 0,
				id = iter_35_1
			}

			table.insert(var_0_6.get_frame_id_list, iter_35_1)
		end
	end

	local var_35_1

	for iter_35_2, iter_35_3 in ipairs(var_0_1.icon_frame_list) do
		local var_35_2 = iter_35_3.id

		if var_0_6[var_35_2] then
			var_0_6[var_35_2].unlock = 1
			var_0_6[var_35_2].lasted_time = iter_35_3.lasted_time
		end
	end
end

function var_0_0.InitCardBgList(arg_36_0)
	var_0_10 = {}
	var_0_10.get_cardBg_id_list = {}

	local var_36_0 = ItemCfg.get_id_list_by_type[ItemConst.ITEM_TYPE.CARD_BG]

	for iter_36_0, iter_36_1 in ipairs(var_36_0) do
		if ItemCfg[iter_36_1].sub_type ~= ItemConst.ITEM_SUB_TYPE.CARD_BG_LIMIT then
			var_0_10[iter_36_1] = {
				lasted_time = 0,
				unlock = 0,
				id = iter_36_1
			}

			table.insert(var_0_10.get_cardBg_id_list, iter_36_1)
		end
	end

	for iter_36_2, iter_36_3 in ipairs(var_0_1.card_background_list) do
		local var_36_1 = iter_36_3.id

		if var_0_10[var_36_1] then
			var_0_10[var_36_1].unlock = 1
			var_0_10[var_36_1].lasted_time = iter_36_3.lasted_time
		end
	end
end

function var_0_0.InitTagInfoList(arg_37_0)
	var_0_12 = {}
	var_0_12.get_tagList_id_list = {}

	local var_37_0 = ItemCfg.get_id_list_by_type[ItemConst.ITEM_TYPE.TAG]

	for iter_37_0, iter_37_1 in ipairs(var_37_0) do
		if ItemCfg[iter_37_1].sub_type ~= ItemConst.ITEM_SUB_TYPE.TAG_LIMIT then
			var_0_12[iter_37_1] = {
				obtain_time = 0,
				lasted_time = 0,
				unlock = 0,
				id = iter_37_1
			}

			table.insert(var_0_12.get_tagList_id_list, iter_37_1)
		end
	end

	for iter_37_2, iter_37_3 in ipairs(var_0_1.tag_info_list) do
		local var_37_1 = iter_37_3.id

		if var_0_12[var_37_1] then
			var_0_12[var_37_1].unlock = 1
			var_0_12[var_37_1].lasted_time = iter_37_3.lasted_time
			var_0_12[var_37_1].obtain_time = iter_37_3.obtain_time
		end
	end
end

function var_0_0.InItReceivedSkinGift(arg_38_0, arg_38_1)
	var_0_9 = {}
	var_0_9.all = {}

	for iter_38_0, iter_38_1 in ipairs(arg_38_1.list) do
		var_0_9[iter_38_1.skin_id] = iter_38_1.gift_acquire

		table.insert(var_0_9.all, iter_38_1.skin_id)
	end
end

function var_0_0.ReceiveSkinGift(arg_39_0, arg_39_1)
	var_0_9[arg_39_1] = true

	if not table.indexof(var_0_9.all, arg_39_1) then
		table.insert(var_0_9.all, arg_39_1)
	end
end

function var_0_0.IsNotReceived(arg_40_0, arg_40_1)
	if not var_0_9[arg_40_1] or var_0_9[arg_40_1] == false then
		return true
	end

	return false
end

function var_0_0.ChangeHeros(arg_41_0, arg_41_1)
	for iter_41_0 = 1, 3 do
		var_0_1.heroes[iter_41_0] = arg_41_1[iter_41_0]
	end
end

function var_0_0.ChangeHeroShow(arg_42_0, arg_42_1)
	var_0_1.show_hero_flag = arg_42_1
end

function var_0_0.ChangeStickerShow(arg_43_0, arg_43_1)
	var_0_1.show_sticker_flag = arg_43_1
end

function var_0_0.ChangeStickerList(arg_44_0, arg_44_1, arg_44_2)
	var_0_1.sticker_show_info = var_0_0:InitStickerShowList(arg_44_1)
	var_0_1.sticker_background = arg_44_2

	manager.notify:CallUpdateFunc(CHANGE_STICKER_LIST, var_0_1.sticker_show_info, var_0_1.sticker_background)
end

function var_0_0.ChangePortrait(arg_45_0, arg_45_1)
	var_0_1.portrait = arg_45_1
end

function var_0_0.ChangeFrameIcon(arg_46_0, arg_46_1)
	var_0_1.icon_frame = arg_46_1
end

function var_0_0.GetHeroShowList(arg_47_0)
	return var_0_1.heroes
end

function var_0_0.GetCurPortrait(arg_48_0)
	return var_0_1.portrait
end

function var_0_0.GetCurFrame(arg_49_0)
	local var_49_0 = var_0_6[var_0_1.icon_frame]

	if var_49_0 and var_49_0.lasted_time > 0 and var_49_0.unlock == 1 and var_49_0.lasted_time < manager.time:GetServerTime() then
		arg_49_0:RefreshFrameList(function()
			return var_0_1.icon_frame
		end)
	end

	return var_0_1.icon_frame
end

function var_0_0.GetCurCardBg(arg_51_0)
	local var_51_0 = var_0_10[var_0_1.card_bg_id]

	if var_51_0 and var_51_0.unlock == 1 and var_51_0.lasted_time > 0 and var_51_0.lasted_time < manager.time:GetServerTime() then
		arg_51_0:LockCardBg(var_0_1.card_bg_id)

		local var_51_1 = GameSetting.profile_business_card_default.value[1]

		PlayerAction.ChangeCardBg(var_51_1)

		return var_0_1.card_bg_id
	end

	return var_0_1.card_bg_id
end

function var_0_0.GetStickerShow(arg_52_0)
	return var_0_1.sticker_show_info
end

function var_0_0.GetStickerList(arg_53_0)
	return var_0_4.get_sticker_id_list
end

function var_0_0.GetSticker(arg_54_0, arg_54_1)
	return var_0_4[arg_54_1]
end

function var_0_0.GetStickerBg(arg_55_0, arg_55_1)
	return var_0_3[arg_55_1]
end

function var_0_0.GetPortraitList(arg_56_0)
	return var_0_5.get_portrait_id_list
end

function var_0_0.GetPortrait(arg_57_0, arg_57_1)
	return var_0_5[arg_57_1]
end

function var_0_0.GetFrameList(arg_58_0)
	return var_0_6.get_frame_id_list
end

function var_0_0.GetFrame(arg_59_0, arg_59_1)
	return var_0_6[arg_59_1]
end

function var_0_0.GetCardBgList(arg_60_0)
	return var_0_10.get_cardBg_id_list
end

function var_0_0.GetCardBg(arg_61_0, arg_61_1)
	return var_0_10[arg_61_1]
end

function var_0_0.GetIsStickerShow(arg_62_0)
	return var_0_1.show_sticker_flag
end

function var_0_0.UnlockSticker(arg_63_0, arg_63_1)
	if var_0_4[arg_63_1] then
		if var_0_4[arg_63_1].unlock == 0 then
			PlayerRedPoint:SetStickerUnlock(arg_63_1)
		end

		var_0_4[arg_63_1].unlock = 1

		table.insert(var_0_1.all_sticker_list, arg_63_1)
	end
end

function var_0_0.UnlockStickerBg(arg_64_0, arg_64_1)
	if var_0_3[arg_64_1] and var_0_3[arg_64_1].unlock == 0 then
		var_0_3[arg_64_1].unlock = 1

		manager.redPoint:setTip(RedPointConst.STICKER_BG .. "_" .. arg_64_1, 1)
	end
end

function var_0_0.UnlockPortrait(arg_65_0, arg_65_1)
	if var_0_5[arg_65_1] then
		var_0_5[arg_65_1].unlock = 1

		table.insert(var_0_1.unlocked_portraits, arg_65_1)
	end
end

function var_0_0.UnlockFrame(arg_66_0, arg_66_1)
	local var_66_0 = ItemCfg[arg_66_1]
	local var_66_1 = var_66_0.param[1]

	if var_0_6[var_66_1] then
		if var_66_0.sub_type == ItemConst.ITEM_SUB_TYPE.FRAME_LIMIT or var_66_0.sub_type == ItemConst.ITEM_SUB_TYPE.FRAME_LIMIT_COVER then
			local var_66_2 = var_66_0.param[2]

			if var_0_6[var_66_1].unlock == 0 then
				var_0_6[var_66_1].unlock = 1
				var_0_6[var_66_1].lasted_time = manager.time:GetServerTime() + var_66_2 * 86400

				table.insert(var_0_1.icon_frame_list, {
					id = var_66_1,
					lasted_time = var_0_6[var_66_1].lasted_time
				})
			elseif var_0_6[var_66_1].lasted_time == 0 then
				return
			else
				var_0_6[var_66_1].lasted_time = var_0_6[var_66_1].lasted_time + var_66_2 * 86400
			end
		else
			var_0_6[var_66_1].unlock = 1
			var_0_6[var_66_1].lasted_time = 0
		end
	end
end

function var_0_0.LockFrame(arg_67_0, arg_67_1)
	if var_0_6[arg_67_1] then
		var_0_6[arg_67_1].unlock = 0

		local var_67_0

		for iter_67_0, iter_67_1 in ipairs(var_0_1.icon_frame_list) do
			if iter_67_1.id == arg_67_1 then
				table.remove(var_0_1.icon_frame_list, iter_67_0)
			end
		end
	end
end

function var_0_0.UnlockTag(arg_68_0, arg_68_1)
	local var_68_0 = manager.time:GetServerTime()
	local var_68_1 = ItemCfg[arg_68_1]
	local var_68_2 = var_68_1.param[1]

	if var_0_12[var_68_2] then
		if var_68_1.sub_type == ItemConst.ITEM_SUB_TYPE.TAG_LIMIT then
			local var_68_3 = var_68_1.param[2]
			local var_68_4 = 0

			if var_68_3 == 0 then
				var_68_4 = 0
			elseif var_68_3 == 1 then
				var_68_4 = 7
			elseif var_68_3 == 2 then
				var_68_4 = 14
			elseif var_68_3 == 3 then
				var_68_4 = 30
			end

			if var_0_12[var_68_2].unlock == 0 then
				var_0_12[var_68_2].unlock = 1
				var_0_12[var_68_2].lasted_time = manager.time:GetServerTime() + var_68_4 * 86400

				table.insert(var_0_1.tag_info_list, {
					id = var_68_2,
					lasted_time = var_0_12[var_68_2].lasted_time,
					obtain_time = var_0_12[var_68_2].obtain_time
				})
				manager.redPoint:setTip(RedPointConst.TAG .. "_" .. var_68_2, 1)
				saveData("limitRed", "tag_" .. var_68_2, 1)
			elseif var_0_12[var_68_2].lasted_time == 0 then
				return
			else
				var_0_12[var_68_2].lasted_time = var_0_12[var_68_2].lasted_time + var_68_4 * 86400
			end
		else
			if var_0_12[var_68_2].unlock == 0 then
				var_0_12[var_68_2].obtain_time = var_68_0

				saveData("limitRed", "tag_" .. var_68_2, 1)
				manager.redPoint:setTip(RedPointConst.TAG .. "_" .. var_68_2, 1)
			end

			var_0_12[var_68_2].unlock = 1
			var_0_12[var_68_2].lasted_time = 0
		end
	end
end

function var_0_0.LockTag(arg_69_0, arg_69_1)
	if var_0_12[arg_69_1] then
		var_0_12[arg_69_1].unlock = 0

		for iter_69_0, iter_69_1 in ipairs(var_0_1.tag_info_list) do
			if iter_69_1.id == arg_69_1 then
				table.remove(var_0_1.tag_info_list, iter_69_0)
			end
		end
	end
end

function var_0_0.UnlockCardBg(arg_70_0, arg_70_1)
	local var_70_0 = ItemCfg[arg_70_1]
	local var_70_1 = var_70_0.param[1]

	if var_0_10[var_70_1] then
		if var_70_0.sub_type == ItemConst.ITEM_SUB_TYPE.CARD_BG_LIMIT then
			local var_70_2 = var_70_0.param[2]
			local var_70_3 = 0

			if var_70_2 == 0 then
				var_70_3 = 0
			elseif var_70_2 == 1 then
				var_70_3 = 7
			elseif var_70_2 == 2 then
				var_70_3 = 14
			elseif var_70_2 == 3 then
				var_70_3 = 30
			end

			if var_0_10[var_70_1].unlock == 0 then
				var_0_10[var_70_1].unlock = 1
				var_0_10[var_70_1].lasted_time = manager.time:GetServerTime() + var_70_3 * 86400

				table.insert(var_0_1.card_background_list, {
					id = var_70_1,
					lasted_time = var_0_10[var_70_1].lasted_time
				})
				manager.redPoint:setTip(RedPointConst.CARD_BG .. "_" .. var_70_1, 1)
				saveData("limitRed", "cardBg_" .. var_70_1, 1)
			elseif var_0_10[var_70_1].lasted_time == 0 then
				return
			else
				var_0_10[var_70_1].lasted_time = var_0_10[var_70_1].lasted_time + var_70_3 * 86400
			end
		else
			if var_0_10[var_70_1].unlock == 0 then
				saveData("limitRed", "cardBg_" .. var_70_1, 1)
				manager.redPoint:setTip(RedPointConst.CARD_BG .. "_" .. var_70_1, 1)
			end

			var_0_10[var_70_1].unlock = 1
			var_0_10[var_70_1].lasted_time = 0
		end
	end
end

function var_0_0.LockCardBg(arg_71_0, arg_71_1)
	if var_0_10[arg_71_1] then
		var_0_10[arg_71_1].unlock = 0

		for iter_71_0, iter_71_1 in ipairs(var_0_1.card_background_list) do
			if iter_71_1.id == arg_71_1 then
				table.remove(var_0_1.card_background_list, iter_71_0)
			end
		end
	end
end

function var_0_0.RefreshFrameList(arg_72_0, arg_72_1)
	local var_72_0
	local var_72_1 = false
	local var_72_2 = var_0_1.icon_frame
	local var_72_3 = manager.time:GetServerTime()

	for iter_72_0, iter_72_1 in ipairs(var_0_6.get_frame_id_list) do
		local var_72_4 = var_0_6[iter_72_1]

		if var_72_4.unlock == 1 and var_72_4.lasted_time > 0 and var_72_3 > var_72_4.lasted_time then
			arg_72_0:LockFrame(iter_72_1)

			if iter_72_1 == var_72_2 then
				var_72_1 = true
			end
		end
	end

	if var_72_1 then
		local var_72_5 = GameSetting.profile_avatar_frame_default.value[1]

		PlayerAction.ChangeFrameIcon(var_72_5)
	end

	if arg_72_1 then
		arg_72_1()
	end
end

function var_0_0.DealOverdueFrame(arg_73_0)
	if var_0_7 and #var_0_7 > 0 then
		JumpTools.OpenPageByJump("FrameExpired", {
			expiredList = var_0_7,
			type = ItemConst.ITEM_TYPE.FRAME
		})
		PlayerAction.DealOverdueFrame()

		var_0_7 = {}
	end
end

function var_0_0.DealOverdueCardBgList(arg_74_0)
	if var_0_11 and #var_0_11 > 0 then
		JumpTools.OpenPageByJump("FrameExpired", {
			expiredList = var_0_11,
			type = ItemConst.ITEM_TYPE.CARD_BG
		})
		PlayerAction.DealOverdueCardBgList()

		var_0_11 = {}
	end
end

function var_0_0.DealOverdueTagList(arg_75_0)
	if var_0_13 and #var_0_13 > 0 then
		JumpTools.OpenPageByJump("FrameExpired", {
			expiredList = var_0_13,
			type = ItemConst.ITEM_TYPE.TAG
		})
		PlayerAction.DealOverdueTagList()

		var_0_13 = {}
	end
end

function var_0_0.SetUnclaimedListFromServer(arg_76_0, arg_76_1)
	var_0_8 = {}

	for iter_76_0, iter_76_1 in ipairs(arg_76_1.reward) do
		var_0_8[iter_76_1.id] = iter_76_1.stage
	end
end

function var_0_0.GetUnclaimed(arg_77_0, arg_77_1)
	return var_0_8[arg_77_1] or nil
end

function var_0_0.ReadUnclaimed(arg_78_0, arg_78_1)
	var_0_8[arg_78_1] = nil
end

function var_0_0.SetUsingTagList(arg_79_0, arg_79_1)
	var_0_1.used_tag_list = arg_79_1
end

function var_0_0.GetUnlockTagListInfo(arg_80_0)
	local var_80_0 = {}
	local var_80_1 = manager.time:GetServerTime()

	for iter_80_0, iter_80_1 in ipairs(var_0_12.get_tagList_id_list) do
		local var_80_2 = var_0_12[iter_80_1]

		if var_80_2 and var_80_2.unlock == 1 then
			if var_80_2.lasted_time == 0 or var_80_1 < var_80_2.lasted_time then
				table.insert(var_80_0, var_80_2)
			else
				arg_80_0:LockTag(iter_80_1)
			end
		end
	end

	table.sort(var_80_0, function(arg_81_0, arg_81_1)
		local var_81_0 = ProfileLabelCfg[arg_81_0.id]
		local var_81_1 = ProfileLabelCfg[arg_81_1.id]

		if var_81_0.type ~= var_81_1.type then
			return var_81_0.type > var_81_1.type
		end

		if arg_81_0.obtain_time ~= arg_81_0.obtain_time then
			return arg_81_0.obtain_time < arg_81_0.obtain_time
		end

		return arg_81_0.id < arg_81_1.id
	end)

	return var_80_0
end

function var_0_0.GetUsingTagListInfo(arg_82_0)
	local var_82_0 = {}
	local var_82_1 = manager.time:GetServerTime()

	for iter_82_0, iter_82_1 in ipairs(var_0_1.used_tag_list) do
		local var_82_2 = var_0_12[iter_82_1]

		if var_82_2 and var_82_2.unlock == 1 and (var_82_2.lasted_time == 0 or var_82_1 < var_82_2.lasted_time) then
			table.insert(var_82_0, iter_82_1)
		end
	end

	table.sort(var_82_0, function(arg_83_0, arg_83_1)
		local var_83_0 = ProfileLabelCfg[arg_83_0]
		local var_83_1 = ProfileLabelCfg[arg_83_1]

		if var_83_0.type ~= var_83_1.type then
			return var_83_0.type > var_83_1.type
		end

		if var_0_12[arg_83_0].obtain_time ~= var_0_12[arg_83_1].obtain_time then
			return var_0_12[arg_83_0].obtain_time < var_0_12[arg_83_1].obtain_time
		end

		return arg_83_0 < arg_83_1
	end)

	return var_82_0
end

function var_0_0.GetTagInfo(arg_84_0, arg_84_1)
	return var_0_12[arg_84_1]
end

function var_0_0.ResetSendLikeList(arg_85_0)
	var_0_1.today_send_like = {}
end

function var_0_0.GetTodaySendLikeList(arg_86_0)
	return var_0_1.today_send_like
end

function var_0_0.SetCardBg(arg_87_0, arg_87_1)
	var_0_1.card_bg_id = arg_87_1
end

function var_0_0.OnSendLike(arg_88_0, arg_88_1)
	table.insert(var_0_1.today_send_like, arg_88_1)
end

function var_0_0.GetLikeInfo(arg_89_0)
	local var_89_0 = {}

	for iter_89_0 = 1, GameSetting.profile_like_record.value[1] do
		if var_0_1.likes_list[iter_89_0] then
			table.insert(var_89_0, var_0_1.likes_list[iter_89_0])
		else
			break
		end
	end

	return var_89_0
end

function var_0_0.AddLikeInfo(arg_90_0, arg_90_1)
	table.sort(arg_90_1, function(arg_91_0, arg_91_1)
		return arg_91_0.time > arg_91_1.time
	end)

	local var_90_0 = {}

	table.insertto(var_90_0, arg_90_1)
	table.insertto(var_90_0, var_0_1.likes_list)

	for iter_90_0 = #var_90_0, GameSetting.profile_like_record.value[1] + 1, -1 do
		table.remove(var_90_0, iter_90_0)
	end

	var_0_1.likes_list = var_90_0
	var_0_1.likes = var_0_1.likes + #arg_90_1

	manager.notify:CallUpdateFunc(GET_LIKE)
end

local var_0_15

function var_0_0.RefreshTagRed(arg_92_0)
	arg_92_0:StopTagRed()

	var_0_15 = Timer.New(function()
		local var_93_0 = 0
		local var_93_1 = manager.time:GetServerTime()

		for iter_93_0, iter_93_1 in ipairs(var_0_12.get_tagList_id_list) do
			local var_93_2 = var_0_12[iter_93_1]
			local var_93_3 = getData("limitRed", "tag_" .. iter_93_1) or 0

			if var_93_2.unlock == 1 and var_93_2.lasted_time > 0 and var_93_3 == 1 then
				var_93_0 = var_93_0 + 1

				if var_93_1 < var_93_2.lasted_time then
					arg_92_0:LockTag(iter_93_1)
					saveData("limitRed", "tag_" .. iter_93_1, 0)
					manager.redPoint:setTip(RedPointConst.TAG .. "_" .. iter_93_1, 0)
				else
					manager.redPoint:setTip(RedPointConst.TAG .. "_" .. iter_93_1, 1)
				end
			end
		end

		if var_93_0 == 0 then
			arg_92_0:StopTagRed()
		end
	end, 1, -1)

	var_0_15:Start()
end

function var_0_0.ClearTagRed(arg_94_0)
	for iter_94_0, iter_94_1 in ipairs(var_0_12.get_tagList_id_list) do
		saveData("limitRed", "tag_" .. iter_94_1, 0)
		manager.redPoint:setTip(RedPointConst.TAG .. "_" .. iter_94_1, 0)
	end
end

function var_0_0.StopTagRed(arg_95_0)
	if var_0_15 then
		var_0_15:Stop()

		var_0_15 = nil
	end
end

local var_0_16

function var_0_0.RefreshCardBgRed(arg_96_0)
	arg_96_0:StopCardRed()

	var_0_16 = Timer.New(function()
		local var_97_0 = 0
		local var_97_1 = manager.time:GetServerTime()

		for iter_97_0, iter_97_1 in ipairs(var_0_10.get_cardBg_id_list) do
			local var_97_2 = var_0_10[iter_97_1]
			local var_97_3 = getData("limitRed", "cardBg_" .. iter_97_1) or 0

			if var_97_2.unlock == 1 and var_97_2.lasted_time > 0 and var_97_3 == 1 then
				var_97_0 = var_97_0 + 1

				if var_97_1 < var_97_2.lasted_time then
					arg_96_0:LockCardBg(iter_97_1)
					saveData("limitRed", "cardBg_" .. iter_97_1, 0)
					manager.redPoint:setTip(RedPointConst.CARD_BG .. "_" .. iter_97_1, 0)
				else
					manager.redPoint:setTip(RedPointConst.CARD_BG .. "_" .. iter_97_1, 1)
				end
			end
		end

		if var_97_0 == 0 then
			arg_96_0:StopCardRed()
		end
	end, 1, -1)

	var_0_16:Start()
end

function var_0_0.ClearCardBgRed(arg_98_0)
	for iter_98_0, iter_98_1 in ipairs(var_0_10.get_cardBg_id_list) do
		saveData("limitRed", "cardBg_" .. iter_98_1, 0)
		manager.redPoint:setTip(RedPointConst.CARD_BG .. "_" .. iter_98_1, 0)
	end
end

function var_0_0.StopCardRed(arg_99_0)
	if var_0_16 then
		var_0_16:Stop()

		var_0_16 = nil
	end
end

function var_0_0.SetCurChatBubbleID(arg_100_0, arg_100_1)
	var_0_1.used_chat_buddle_id = arg_100_1
end

function var_0_0.GetCurChatBubbleID(arg_101_0)
	return var_0_1.used_chat_buddle_id
end

function var_0_0.UnlockChatBubble(arg_102_0, arg_102_1)
	table.insert(var_0_1.chat_bubble_unlock_id_list, arg_102_1)
	manager.redPoint:setTip(string.format("%s_%s", RedPointConst.CHAT_BUBBLE, arg_102_1), 1)
end

function var_0_0.GetUnlockChatBubbleIDList(arg_103_0)
	return var_0_1.chat_bubble_unlock_id_list
end

function var_0_0.InitPlayerStoryTrigger(arg_104_0, arg_104_1)
	var_0_14 = {}

	for iter_104_0, iter_104_1 in ipairs(arg_104_1.info_list) do
		var_0_14[iter_104_1.trigger_group_id] = {}

		for iter_104_2, iter_104_3 in ipairs(iter_104_1.completed_trigger_list) do
			table.insert(var_0_14[iter_104_1.trigger_group_id], iter_104_3)
		end
	end
end

function var_0_0.AddPlayerStoryTrigger(arg_105_0, arg_105_1)
	local var_105_0 = StoryTriggerCfg[arg_105_1]

	if var_0_14[var_105_0.trigger_group] then
		if table.indexof(var_0_14[var_105_0.trigger_group], arg_105_1) == false then
			table.insert(var_0_14[var_105_0.trigger_group], arg_105_1)
		end
	else
		var_0_14[var_105_0.trigger_group] = {
			arg_105_1
		}
	end
end

function var_0_0.GetPlayerStoryTriggerGroupInfo(arg_106_0, arg_106_1)
	local var_106_0 = StoryTriggerCfg[arg_106_1]
	local var_106_1 = #StoryTriggerCfg.get_id_list_by_trigger_group[var_106_0.trigger_group]
	local var_106_2 = 0

	if var_0_14[var_106_0.trigger_group] then
		var_106_2 = #var_0_14[var_106_0.trigger_group]
	end

	return var_106_2, var_106_1
end

return var_0_0
