local var_0_0 = singletonClass("PlayerData")

var_0_0.INVALID_PLAYER = "0"

local var_0_1 = {
	originalLevel = 1,
	show_hero_flag = 1,
	userLevel = 10,
	userID = 1,
	show_sticker_flag = 1,
	is_changed_nick = 0,
	likes = 0,
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
	remain_exp = 0,
	birthday_month = 0,
	nick = "",
	signUserId = "",
	portrait = 1084,
	sign = "",
	all_suit_rewarded = {},
	all_foreground_list = {},
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
local var_0_15 = {}

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
	var_0_1.all_suit_rewarded = {}

	for iter_17_0, iter_17_1 in ipairs(arg_17_1.admitted_suit_reaward_list) do
		var_0_1.all_suit_rewarded[iter_17_1] = true
	end

	var_0_1.all_foreground_list = cleanProtoTable(arg_17_1.all_foreground_list)
	var_0_1.all_background_list = cleanProtoTable(arg_17_1.all_background_list)
	var_0_1.show_sticker_flag = arg_17_1.sticker_background ~= 0 and arg_17_1.sticker_background or GameSetting.sticker_background_default.value[1]
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

	var_0_1.sticker_show_info = var_0_0:InitStickerShowList(arg_17_1.sticker_show_info or {})

	var_0_0:InitPortraitList()
	var_0_0:InitFrameList()
	var_0_0:InitCardBgList()
	var_0_0:InitTagInfoList()

	var_0_8 = {}
	var_0_12 = {}
	var_0_14 = {}
end

function var_0_0.InitStickerShowList(arg_18_0, arg_18_1, arg_18_2)
	local var_18_0 = {}

	for iter_18_0, iter_18_1 in ipairs(arg_18_1) do
		var_18_0[iter_18_1.page_id] = {
			foreground = iter_18_1.foreground or 0,
			sticker = {},
			hierarchy = {}
		}

		if iter_18_1.foreground and iter_18_1.foreground ~= 0 then
			var_0_3[iter_18_1.foreground].page = iter_18_1.page_id
		end

		for iter_18_2, iter_18_3 in ipairs(iter_18_1.sticker_display_info) do
			var_18_0[iter_18_1.page_id].sticker[iter_18_3.sticker_id] = {
				positionX = iter_18_3.location_x,
				positionY = iter_18_3.location_y,
				rotation = iter_18_3.rotate,
				scale = iter_18_3.scale
			}
			var_18_0[iter_18_1.page_id].hierarchy[iter_18_3.layer] = iter_18_3.sticker_id
			var_0_5[iter_18_3.sticker_id].page = iter_18_1.page_id
		end
	end

	if not arg_18_2 then
		for iter_18_4, iter_18_5 in ipairs(arg_18_0:GetStickerBgList()) do
			if not var_18_0[iter_18_5] then
				var_18_0[iter_18_5] = {
					foreground = 0,
					sticker = {},
					hierarchy = {}
				}
			end
		end
	end

	return var_18_0
end

function var_0_0.InitOverdueFrameList(arg_19_0, arg_19_1)
	if #arg_19_1 > 0 then
		for iter_19_0, iter_19_1 in ipairs(arg_19_1) do
			local var_19_0 = iter_19_1.id
			local var_19_1 = iter_19_1.num
			local var_19_2 = iter_19_1.time_valid

			table.insert(var_0_8, {
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

			table.insert(var_0_12, var_20_0)
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

			table.insert(var_0_14, var_21_0)
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
	var_0_5 = {}
	var_0_3 = {}
	var_0_4 = {}

	for iter_32_0, iter_32_1 in ipairs(ProfileDecorateItemCfg.all) do
		local var_32_0 = ProfileDecorateItemCfg[iter_32_1]

		if var_32_0.item_type == 4 then
			var_0_4[iter_32_1] = {
				suit = 0,
				lock = true,
				page = iter_32_1
			}
		elseif var_32_0.item_type == 5 then
			var_0_5[iter_32_1] = {
				suit = 0,
				lock = true,
				page = 0
			}
		elseif var_32_0.item_type == 6 then
			var_0_3[iter_32_1] = {
				suit = 0,
				lock = true,
				page = 0
			}
		end
	end

	for iter_32_2, iter_32_3 in ipairs(var_0_1.all_sticker_list) do
		if var_0_5[iter_32_3] then
			var_0_5[iter_32_3].lock = false
		end
	end

	for iter_32_4, iter_32_5 in ipairs(var_0_1.all_foreground_list) do
		if var_0_3[iter_32_5] then
			var_0_3[iter_32_5].lock = false
		end
	end

	for iter_32_6, iter_32_7 in ipairs(var_0_1.all_background_list) do
		if var_0_4[iter_32_7] then
			var_0_4[iter_32_7].lock = false
		end
	end

	for iter_32_8, iter_32_9 in ipairs(StickerSuitCfg.all) do
		local var_32_1 = StickerSuitCfg[iter_32_9]

		for iter_32_10, iter_32_11 in ipairs(var_32_1.content) do
			local var_32_2 = ProfileDecorateItemCfg[iter_32_11]

			if var_32_2.item_type == 4 then
				var_0_4[iter_32_11].suit = iter_32_9
			elseif var_32_2.item_type == 5 then
				var_0_5[iter_32_11].suit = iter_32_9
			elseif var_32_2.item_type == 6 then
				var_0_3[iter_32_11].suit = iter_32_9
			end
		end
	end
end

function var_0_0.InitPortraitList(arg_33_0)
	var_0_6 = {}
	var_0_6.get_portrait_id_list = {}

	local var_33_0 = ItemCfg.get_id_list_by_type[ItemConst.ITEM_TYPE.PORTRAIT]

	for iter_33_0, iter_33_1 in ipairs(var_33_0) do
		var_0_6[iter_33_1] = {
			unlock = 0,
			id = iter_33_1
		}

		table.insert(var_0_6.get_portrait_id_list, iter_33_1)
	end

	for iter_33_2, iter_33_3 in ipairs(var_0_1.unlocked_portraits) do
		if var_0_6[iter_33_3] then
			var_0_6[iter_33_3].unlock = 1
		end
	end
end

function var_0_0.InitFrameList(arg_34_0)
	var_0_7 = {}
	var_0_7.get_frame_id_list = {}

	local var_34_0 = ItemCfg.get_id_list_by_type[ItemConst.ITEM_TYPE.FRAME]

	for iter_34_0, iter_34_1 in ipairs(var_34_0) do
		if ItemCfg[iter_34_1].sub_type ~= ItemConst.ITEM_SUB_TYPE.FRAME_LIMIT then
			var_0_7[iter_34_1] = {
				lasted_time = 0,
				unlock = 0,
				id = iter_34_1
			}

			table.insert(var_0_7.get_frame_id_list, iter_34_1)
		end
	end

	local var_34_1

	for iter_34_2, iter_34_3 in ipairs(var_0_1.icon_frame_list) do
		local var_34_2 = iter_34_3.id

		if var_0_7[var_34_2] then
			var_0_7[var_34_2].unlock = 1
			var_0_7[var_34_2].lasted_time = iter_34_3.lasted_time
		end
	end
end

function var_0_0.InitCardBgList(arg_35_0)
	var_0_11 = {}
	var_0_11.get_cardBg_id_list = {}

	local var_35_0 = ItemCfg.get_id_list_by_type[ItemConst.ITEM_TYPE.CARD_BG]

	for iter_35_0, iter_35_1 in ipairs(var_35_0) do
		if ItemCfg[iter_35_1].sub_type ~= ItemConst.ITEM_SUB_TYPE.CARD_BG_LIMIT then
			var_0_11[iter_35_1] = {
				lasted_time = 0,
				unlock = 0,
				id = iter_35_1
			}

			table.insert(var_0_11.get_cardBg_id_list, iter_35_1)
		end
	end

	for iter_35_2, iter_35_3 in ipairs(var_0_1.card_background_list) do
		local var_35_1 = iter_35_3.id

		if var_0_11[var_35_1] then
			var_0_11[var_35_1].unlock = 1
			var_0_11[var_35_1].lasted_time = iter_35_3.lasted_time
		end
	end
end

function var_0_0.InitTagInfoList(arg_36_0)
	var_0_13 = {}
	var_0_13.get_tagList_id_list = {}

	local var_36_0 = ItemCfg.get_id_list_by_type[ItemConst.ITEM_TYPE.TAG]

	for iter_36_0, iter_36_1 in ipairs(var_36_0) do
		if ItemCfg[iter_36_1].sub_type ~= ItemConst.ITEM_SUB_TYPE.TAG_LIMIT then
			var_0_13[iter_36_1] = {
				obtain_time = 0,
				lasted_time = 0,
				unlock = 0,
				id = iter_36_1
			}

			table.insert(var_0_13.get_tagList_id_list, iter_36_1)
		end
	end

	for iter_36_2, iter_36_3 in ipairs(var_0_1.tag_info_list) do
		local var_36_1 = iter_36_3.id

		if var_0_13[var_36_1] then
			var_0_13[var_36_1].unlock = 1
			var_0_13[var_36_1].lasted_time = iter_36_3.lasted_time
			var_0_13[var_36_1].obtain_time = iter_36_3.obtain_time
		end
	end
end

function var_0_0.InItReceivedSkinGift(arg_37_0, arg_37_1)
	var_0_10 = {}
	var_0_10.all = {}

	for iter_37_0, iter_37_1 in ipairs(arg_37_1.list) do
		var_0_10[iter_37_1.skin_id] = iter_37_1.gift_acquire

		table.insert(var_0_10.all, iter_37_1.skin_id)
	end
end

function var_0_0.ReceiveSkinGift(arg_38_0, arg_38_1)
	var_0_10[arg_38_1] = true

	if not table.indexof(var_0_10.all, arg_38_1) then
		table.insert(var_0_10.all, arg_38_1)
	end
end

function var_0_0.IsNotReceived(arg_39_0, arg_39_1)
	if not var_0_10[arg_39_1] or var_0_10[arg_39_1] == false then
		return true
	end

	return false
end

function var_0_0.ChangeHeros(arg_40_0, arg_40_1)
	for iter_40_0 = 1, 3 do
		var_0_1.heroes[iter_40_0] = arg_40_1[iter_40_0]
	end
end

function var_0_0.ChangeHeroShow(arg_41_0, arg_41_1)
	var_0_1.show_hero_flag = arg_41_1
end

function var_0_0.ChangeStickerShow(arg_42_0, arg_42_1)
	var_0_1.show_sticker_flag = arg_42_1
end

function var_0_0.ChangePortrait(arg_43_0, arg_43_1)
	var_0_1.portrait = arg_43_1
end

function var_0_0.ChangeFrameIcon(arg_44_0, arg_44_1)
	var_0_1.icon_frame = arg_44_1
end

function var_0_0.GetHeroShowList(arg_45_0)
	return var_0_1.heroes
end

function var_0_0.GetCurPortrait(arg_46_0)
	return var_0_1.portrait
end

function var_0_0.GetCurFrame(arg_47_0)
	local var_47_0 = var_0_7[var_0_1.icon_frame]

	if var_47_0 and var_47_0.lasted_time > 0 and var_47_0.unlock == 1 and var_47_0.lasted_time < manager.time:GetServerTime() then
		arg_47_0:RefreshFrameList(function()
			return var_0_1.icon_frame
		end)
	end

	return var_0_1.icon_frame
end

function var_0_0.GetCurCardBg(arg_49_0)
	local var_49_0 = var_0_11[var_0_1.card_bg_id]

	if var_49_0 and var_49_0.unlock == 1 and var_49_0.lasted_time > 0 and var_49_0.lasted_time < manager.time:GetServerTime() then
		arg_49_0:LockCardBg(var_0_1.card_bg_id)

		local var_49_1 = GameSetting.profile_business_card_default.value[1]

		PlayerAction.ChangeCardBg(var_49_1)

		return var_0_1.card_bg_id
	end

	return var_0_1.card_bg_id
end

function var_0_0.CheckStickerSuitReward(arg_50_0, arg_50_1)
	if var_0_1.all_suit_rewarded[arg_50_1] then
		return true
	end

	return false
end

function var_0_0.AddStickerSuitReward(arg_51_0, arg_51_1)
	var_0_1.all_suit_rewarded[arg_51_1] = true

	manager.redPoint:setTip(RedPointConst.CUSTOM_STICKER_SUIT_REWARD .. "_" .. arg_51_1, 0)
end

function var_0_0.GetStickerEditData(arg_52_0)
	return var_0_1.sticker_show_info
end

function var_0_0.SetStickerEditData(arg_53_0, arg_53_1)
	var_0_1.sticker_show_info = arg_53_1
end

function var_0_0.GetStickerList(arg_54_0, arg_54_1, arg_54_2)
	local var_54_0 = {}

	for iter_54_0, iter_54_1 in pairs(var_0_5) do
		local var_54_1 = ItemCfg[iter_54_0]

		if var_54_1 and var_54_1.sub_type == 1302 and iter_54_1.lock then
			-- block empty
		elseif arg_54_2 then
			if iter_54_1.lock then
				table.insert(var_54_0, iter_54_0)
			end
		elseif arg_54_1 or not iter_54_1.lock then
			table.insert(var_54_0, iter_54_0)
		end
	end

	return var_54_0
end

function var_0_0.GetSticker(arg_55_0, arg_55_1)
	return var_0_5[arg_55_1]
end

function var_0_0.SetStickerPage(arg_56_0, arg_56_1, arg_56_2)
	local var_56_0 = var_0_5[arg_56_1]

	if var_56_0 then
		var_56_0.page = arg_56_2
	end
end

function var_0_0.GetStickerBgList(arg_57_0, arg_57_1, arg_57_2)
	local var_57_0 = {}

	for iter_57_0, iter_57_1 in pairs(var_0_4) do
		if arg_57_2 then
			if iter_57_1.lock then
				table.insert(var_57_0, iter_57_0)
			end
		elseif arg_57_1 or not iter_57_1.lock then
			table.insert(var_57_0, iter_57_0)
		end
	end

	return var_57_0
end

function var_0_0.GetStickerBg(arg_58_0, arg_58_1)
	return var_0_4[arg_58_1]
end

function var_0_0.GetStickerFgList(arg_59_0, arg_59_1, arg_59_2)
	local var_59_0 = {}

	for iter_59_0, iter_59_1 in pairs(var_0_3) do
		if arg_59_2 then
			if iter_59_1.lock then
				table.insert(var_59_0, iter_59_0)
			end
		elseif arg_59_1 or not iter_59_1.lock then
			table.insert(var_59_0, iter_59_0)
		end
	end

	return var_59_0
end

function var_0_0.GetStickerFg(arg_60_0, arg_60_1)
	return var_0_3[arg_60_1]
end

function var_0_0.SetStickerFgPage(arg_61_0, arg_61_1, arg_61_2)
	local var_61_0 = var_0_3[arg_61_1]

	if var_61_0 then
		var_61_0.page = arg_61_2
	end
end

function var_0_0.ClearStickerCollectPageRedPoint(arg_62_0, arg_62_1)
	local var_62_0 = {}

	if arg_62_1 == 1 then
		var_62_0 = arg_62_0:GetStickerList()
	elseif arg_62_1 == 2 then
		var_62_0 = arg_62_0:GetStickerBgList()
	elseif arg_62_1 == 3 then
		var_62_0 = arg_62_0:GetStickerFgList()
	end

	for iter_62_0, iter_62_1 in ipairs(var_62_0) do
		if not getData("PlayerCustomStickerTriggered", "StickerItem_" .. iter_62_1) then
			saveData("PlayerCustomStickerTriggered", "StickerItem_" .. iter_62_1, 1)
			manager.redPoint:setTip(RedPointConst.CUSTOM_STICKER_ITEM .. "_" .. iter_62_1, 0)
		end
	end
end

function var_0_0.GetPortraitList(arg_63_0)
	return var_0_6.get_portrait_id_list
end

function var_0_0.GetPortrait(arg_64_0, arg_64_1)
	return var_0_6[arg_64_1]
end

function var_0_0.GetFrameList(arg_65_0)
	return var_0_7.get_frame_id_list
end

function var_0_0.GetFrame(arg_66_0, arg_66_1)
	return var_0_7[arg_66_1]
end

function var_0_0.GetCardBgList(arg_67_0)
	return var_0_11.get_cardBg_id_list
end

function var_0_0.GetCardBg(arg_68_0, arg_68_1)
	return var_0_11[arg_68_1]
end

function var_0_0.GetStickerShowID(arg_69_0)
	return var_0_1.show_sticker_flag
end

function var_0_0.UnlockSticker(arg_70_0, arg_70_1)
	if var_0_5[arg_70_1] then
		if not getData("PlayerCustomStickerTriggered", "StickerItem_" .. arg_70_1) then
			manager.redPoint:setTip(RedPointConst.CUSTOM_STICKER_ITEM .. "_" .. arg_70_1, 1)
		end

		var_0_5[arg_70_1].lock = false

		table.insert(var_0_1.all_sticker_list, arg_70_1)

		if var_0_5[arg_70_1].suit ~= 0 then
			local var_70_0 = StickerSuitCfg[var_0_5[arg_70_1].suit]
			local var_70_1 = true

			for iter_70_0, iter_70_1 in ipairs(var_70_0.content) do
				local var_70_2 = ProfileDecorateItemCfg[iter_70_1]

				if var_70_2.item_type == 4 then
					var_70_1 = PlayerData:GetStickerBg(iter_70_1).lock
				elseif var_70_2.item_type == 5 then
					var_70_1 = PlayerData:GetSticker(iter_70_1).lock
				elseif var_70_2.item_type == 6 then
					var_70_1 = PlayerData:GetStickerFg(iter_70_1).lock
				end

				if var_70_1 then
					break
				end
			end

			if not var_70_1 then
				manager.redPoint:setTip(RedPointConst.CUSTOM_STICKER_SUIT_REWARD .. "_" .. var_0_5[arg_70_1].suit, 1)
			end
		end
	end
end

function var_0_0.UnlockStickerBg(arg_71_0, arg_71_1)
	if var_0_4[arg_71_1] and var_0_4[arg_71_1].lock then
		var_0_4[arg_71_1].lock = false

		if not getData("PlayerCustomStickerTriggered", "StickerItem_" .. arg_71_1) then
			manager.redPoint:setTip(RedPointConst.CUSTOM_STICKER_ITEM .. "_" .. arg_71_1, 1)
		end

		table.insert(var_0_1.all_background_list, arg_71_1)

		var_0_1.sticker_show_info[arg_71_1] = {
			foreground = 0,
			sticker = {},
			hierarchy = {}
		}

		if var_0_4[arg_71_1].suit ~= 0 then
			local var_71_0 = StickerSuitCfg[var_0_4[arg_71_1].suit]
			local var_71_1 = true

			for iter_71_0, iter_71_1 in ipairs(var_71_0.content) do
				local var_71_2 = ProfileDecorateItemCfg[iter_71_1]

				if var_71_2.item_type == 4 then
					var_71_1 = PlayerData:GetStickerBg(iter_71_1).lock
				elseif var_71_2.item_type == 5 then
					var_71_1 = PlayerData:GetSticker(iter_71_1).lock
				elseif var_71_2.item_type == 6 then
					var_71_1 = PlayerData:GetStickerFg(iter_71_1).lock
				end

				if var_71_1 then
					break
				end
			end

			if not var_71_1 then
				manager.redPoint:setTip(RedPointConst.CUSTOM_STICKER_SUIT_REWARD .. "_" .. var_0_4[arg_71_1].suit, 1)
			end
		end
	end
end

function var_0_0.UnlockStickerFg(arg_72_0, arg_72_1)
	if var_0_3[arg_72_1] and var_0_3[arg_72_1].lock then
		var_0_3[arg_72_1].lock = false

		if not getData("PlayerCustomStickerTriggered", "StickerItem_" .. arg_72_1) then
			manager.redPoint:setTip(RedPointConst.CUSTOM_STICKER_ITEM .. "_" .. arg_72_1, 1)
		end

		table.insert(var_0_1.all_foreground_list, arg_72_1)

		if var_0_3[arg_72_1].suit ~= 0 then
			local var_72_0 = StickerSuitCfg[var_0_3[arg_72_1].suit]
			local var_72_1 = true

			for iter_72_0, iter_72_1 in ipairs(var_72_0.content) do
				local var_72_2 = ProfileDecorateItemCfg[iter_72_1]

				if var_72_2.item_type == 4 then
					var_72_1 = PlayerData:GetStickerBg(iter_72_1).lock
				elseif var_72_2.item_type == 5 then
					var_72_1 = PlayerData:GetSticker(iter_72_1).lock
				elseif var_72_2.item_type == 6 then
					var_72_1 = PlayerData:GetStickerFg(iter_72_1).lock
				end

				if var_72_1 then
					break
				end
			end

			if not var_72_1 then
				manager.redPoint:setTip(RedPointConst.CUSTOM_STICKER_SUIT_REWARD .. "_" .. var_0_3[arg_72_1].suit, 1)
			end
		end
	end
end

function var_0_0.UnlockPortrait(arg_73_0, arg_73_1)
	if var_0_6[arg_73_1] then
		var_0_6[arg_73_1].unlock = 1

		table.insert(var_0_1.unlocked_portraits, arg_73_1)
	end
end

function var_0_0.UnlockFrame(arg_74_0, arg_74_1)
	local var_74_0 = ItemCfg[arg_74_1]
	local var_74_1 = var_74_0.param[1]

	if var_0_7[var_74_1] then
		if var_74_0.sub_type == ItemConst.ITEM_SUB_TYPE.FRAME_LIMIT or var_74_0.sub_type == ItemConst.ITEM_SUB_TYPE.FRAME_LIMIT_COVER then
			local var_74_2 = var_74_0.param[2]

			if var_0_7[var_74_1].unlock == 0 then
				var_0_7[var_74_1].unlock = 1
				var_0_7[var_74_1].lasted_time = manager.time:GetServerTime() + var_74_2 * 86400

				table.insert(var_0_1.icon_frame_list, {
					id = var_74_1,
					lasted_time = var_0_7[var_74_1].lasted_time
				})
			elseif var_0_7[var_74_1].lasted_time == 0 then
				return
			else
				var_0_7[var_74_1].lasted_time = var_0_7[var_74_1].lasted_time + var_74_2 * 86400
			end
		else
			var_0_7[var_74_1].unlock = 1
			var_0_7[var_74_1].lasted_time = 0
		end
	end
end

function var_0_0.LockFrame(arg_75_0, arg_75_1)
	if var_0_7[arg_75_1] then
		var_0_7[arg_75_1].unlock = 0

		local var_75_0

		for iter_75_0, iter_75_1 in ipairs(var_0_1.icon_frame_list) do
			if iter_75_1.id == arg_75_1 then
				table.remove(var_0_1.icon_frame_list, iter_75_0)
			end
		end
	end
end

function var_0_0.UnlockTag(arg_76_0, arg_76_1)
	local var_76_0 = manager.time:GetServerTime()
	local var_76_1 = ItemCfg[arg_76_1]
	local var_76_2 = var_76_1.param[1]

	if var_0_13[var_76_2] then
		if var_76_1.sub_type == ItemConst.ITEM_SUB_TYPE.TAG_LIMIT then
			local var_76_3 = var_76_1.param[2]
			local var_76_4 = 0

			if var_76_3 == 0 then
				var_76_4 = 0
			elseif var_76_3 == 1 then
				var_76_4 = 7
			elseif var_76_3 == 2 then
				var_76_4 = 14
			elseif var_76_3 == 3 then
				var_76_4 = 30
			end

			if var_0_13[var_76_2].unlock == 0 then
				var_0_13[var_76_2].unlock = 1
				var_0_13[var_76_2].lasted_time = manager.time:GetServerTime() + var_76_4 * 86400

				table.insert(var_0_1.tag_info_list, {
					id = var_76_2,
					lasted_time = var_0_13[var_76_2].lasted_time,
					obtain_time = var_0_13[var_76_2].obtain_time
				})
				manager.redPoint:setTip(RedPointConst.TAG .. "_" .. var_76_2, 1)
				saveData("limitRed", "tag_" .. var_76_2, 1)
			elseif var_0_13[var_76_2].lasted_time == 0 then
				return
			else
				var_0_13[var_76_2].lasted_time = var_0_13[var_76_2].lasted_time + var_76_4 * 86400
			end
		else
			if var_0_13[var_76_2].unlock == 0 then
				var_0_13[var_76_2].obtain_time = var_76_0

				saveData("limitRed", "tag_" .. var_76_2, 1)
				manager.redPoint:setTip(RedPointConst.TAG .. "_" .. var_76_2, 1)
			end

			var_0_13[var_76_2].unlock = 1
			var_0_13[var_76_2].lasted_time = 0
		end
	end
end

function var_0_0.LockTag(arg_77_0, arg_77_1)
	if var_0_13[arg_77_1] then
		var_0_13[arg_77_1].unlock = 0

		for iter_77_0, iter_77_1 in ipairs(var_0_1.tag_info_list) do
			if iter_77_1.id == arg_77_1 then
				table.remove(var_0_1.tag_info_list, iter_77_0)
			end
		end
	end
end

function var_0_0.UnlockCardBg(arg_78_0, arg_78_1)
	local var_78_0 = ItemCfg[arg_78_1]
	local var_78_1 = var_78_0.param[1]

	if var_0_11[var_78_1] then
		if var_78_0.sub_type == ItemConst.ITEM_SUB_TYPE.CARD_BG_LIMIT then
			local var_78_2 = var_78_0.param[2]
			local var_78_3 = 0

			if var_78_2 == 0 then
				var_78_3 = 0
			elseif var_78_2 == 1 then
				var_78_3 = 7
			elseif var_78_2 == 2 then
				var_78_3 = 14
			elseif var_78_2 == 3 then
				var_78_3 = 30
			end

			if var_0_11[var_78_1].unlock == 0 then
				var_0_11[var_78_1].unlock = 1
				var_0_11[var_78_1].lasted_time = manager.time:GetServerTime() + var_78_3 * 86400

				table.insert(var_0_1.card_background_list, {
					id = var_78_1,
					lasted_time = var_0_11[var_78_1].lasted_time
				})
				manager.redPoint:setTip(RedPointConst.CARD_BG .. "_" .. var_78_1, 1)
				saveData("limitRed", "cardBg_" .. var_78_1, 1)
			elseif var_0_11[var_78_1].lasted_time == 0 then
				return
			else
				var_0_11[var_78_1].lasted_time = var_0_11[var_78_1].lasted_time + var_78_3 * 86400
			end
		else
			if var_0_11[var_78_1].unlock == 0 then
				saveData("limitRed", "cardBg_" .. var_78_1, 1)
				manager.redPoint:setTip(RedPointConst.CARD_BG .. "_" .. var_78_1, 1)
			end

			var_0_11[var_78_1].unlock = 1
			var_0_11[var_78_1].lasted_time = 0
		end
	end
end

function var_0_0.LockCardBg(arg_79_0, arg_79_1)
	if var_0_11[arg_79_1] then
		var_0_11[arg_79_1].unlock = 0

		for iter_79_0, iter_79_1 in ipairs(var_0_1.card_background_list) do
			if iter_79_1.id == arg_79_1 then
				table.remove(var_0_1.card_background_list, iter_79_0)
			end
		end
	end
end

function var_0_0.RefreshFrameList(arg_80_0, arg_80_1)
	local var_80_0
	local var_80_1 = false
	local var_80_2 = var_0_1.icon_frame
	local var_80_3 = manager.time:GetServerTime()

	for iter_80_0, iter_80_1 in ipairs(var_0_7.get_frame_id_list) do
		local var_80_4 = var_0_7[iter_80_1]

		if var_80_4.unlock == 1 and var_80_4.lasted_time > 0 and var_80_3 > var_80_4.lasted_time then
			arg_80_0:LockFrame(iter_80_1)

			if iter_80_1 == var_80_2 then
				var_80_1 = true
			end
		end
	end

	if var_80_1 then
		local var_80_5 = GameSetting.profile_avatar_frame_default.value[1]

		PlayerAction.ChangeFrameIcon(var_80_5)
	end

	if arg_80_1 then
		arg_80_1()
	end
end

function var_0_0.DealOverdueFrame(arg_81_0)
	if var_0_8 and #var_0_8 > 0 then
		JumpTools.OpenPageByJump("FrameExpired", {
			expiredList = var_0_8,
			type = ItemConst.ITEM_TYPE.FRAME
		})
		PlayerAction.DealOverdueFrame()

		var_0_8 = {}
	end
end

function var_0_0.DealOverdueCardBgList(arg_82_0)
	if var_0_12 and #var_0_12 > 0 then
		JumpTools.OpenPageByJump("FrameExpired", {
			expiredList = var_0_12,
			type = ItemConst.ITEM_TYPE.CARD_BG
		})
		PlayerAction.DealOverdueCardBgList()

		var_0_12 = {}
	end
end

function var_0_0.DealOverdueTagList(arg_83_0)
	if var_0_14 and #var_0_14 > 0 then
		JumpTools.OpenPageByJump("FrameExpired", {
			expiredList = var_0_14,
			type = ItemConst.ITEM_TYPE.TAG
		})
		PlayerAction.DealOverdueTagList()

		var_0_14 = {}
	end
end

function var_0_0.SetUnclaimedListFromServer(arg_84_0, arg_84_1)
	var_0_9 = {}

	for iter_84_0, iter_84_1 in ipairs(arg_84_1.reward) do
		var_0_9[iter_84_1.id] = iter_84_1.stage
	end
end

function var_0_0.GetUnclaimed(arg_85_0, arg_85_1)
	return var_0_9[arg_85_1] or nil
end

function var_0_0.ReadUnclaimed(arg_86_0, arg_86_1)
	var_0_9[arg_86_1] = nil
end

function var_0_0.SetUsingTagList(arg_87_0, arg_87_1)
	var_0_1.used_tag_list = arg_87_1
end

function var_0_0.GetUnlockTagListInfo(arg_88_0)
	local var_88_0 = {}
	local var_88_1 = manager.time:GetServerTime()

	for iter_88_0, iter_88_1 in ipairs(var_0_13.get_tagList_id_list) do
		local var_88_2 = var_0_13[iter_88_1]

		if var_88_2 and var_88_2.unlock == 1 then
			if var_88_2.lasted_time == 0 or var_88_1 < var_88_2.lasted_time then
				table.insert(var_88_0, var_88_2)
			else
				arg_88_0:LockTag(iter_88_1)
			end
		end
	end

	table.sort(var_88_0, function(arg_89_0, arg_89_1)
		local var_89_0 = ProfileLabelCfg[arg_89_0.id]
		local var_89_1 = ProfileLabelCfg[arg_89_1.id]

		if var_89_0.type ~= var_89_1.type then
			return var_89_0.type > var_89_1.type
		end

		if arg_89_0.obtain_time ~= arg_89_0.obtain_time then
			return arg_89_0.obtain_time < arg_89_0.obtain_time
		end

		return arg_89_0.id < arg_89_1.id
	end)

	return var_88_0
end

function var_0_0.GetUsingTagListInfo(arg_90_0)
	local var_90_0 = {}
	local var_90_1 = manager.time:GetServerTime()

	for iter_90_0, iter_90_1 in ipairs(var_0_1.used_tag_list) do
		local var_90_2 = var_0_13[iter_90_1]

		if var_90_2 and var_90_2.unlock == 1 and (var_90_2.lasted_time == 0 or var_90_1 < var_90_2.lasted_time) then
			table.insert(var_90_0, iter_90_1)
		end
	end

	table.sort(var_90_0, function(arg_91_0, arg_91_1)
		local var_91_0 = ProfileLabelCfg[arg_91_0]
		local var_91_1 = ProfileLabelCfg[arg_91_1]

		if var_91_0.type ~= var_91_1.type then
			return var_91_0.type > var_91_1.type
		end

		if var_0_13[arg_91_0].obtain_time ~= var_0_13[arg_91_1].obtain_time then
			return var_0_13[arg_91_0].obtain_time < var_0_13[arg_91_1].obtain_time
		end

		return arg_91_0 < arg_91_1
	end)

	return var_90_0
end

function var_0_0.GetTagInfo(arg_92_0, arg_92_1)
	return var_0_13[arg_92_1]
end

function var_0_0.ResetSendLikeList(arg_93_0)
	var_0_1.today_send_like = {}
end

function var_0_0.GetTodaySendLikeList(arg_94_0)
	return var_0_1.today_send_like
end

function var_0_0.SetCardBg(arg_95_0, arg_95_1)
	var_0_1.card_bg_id = arg_95_1
end

function var_0_0.OnSendLike(arg_96_0, arg_96_1)
	table.insert(var_0_1.today_send_like, arg_96_1)
end

function var_0_0.GetLikeInfo(arg_97_0)
	local var_97_0 = {}

	for iter_97_0 = 1, GameSetting.profile_like_record.value[1] do
		if var_0_1.likes_list[iter_97_0] then
			table.insert(var_97_0, var_0_1.likes_list[iter_97_0])
		else
			break
		end
	end

	return var_97_0
end

function var_0_0.AddLikeInfo(arg_98_0, arg_98_1)
	table.sort(arg_98_1, function(arg_99_0, arg_99_1)
		return arg_99_0.time > arg_99_1.time
	end)

	local var_98_0 = {}

	table.insertto(var_98_0, arg_98_1)
	table.insertto(var_98_0, var_0_1.likes_list)

	for iter_98_0 = #var_98_0, GameSetting.profile_like_record.value[1] + 1, -1 do
		table.remove(var_98_0, iter_98_0)
	end

	var_0_1.likes_list = var_98_0
	var_0_1.likes = var_0_1.likes + #arg_98_1

	manager.notify:CallUpdateFunc(GET_LIKE)
end

local var_0_16

function var_0_0.RefreshTagRed(arg_100_0)
	arg_100_0:StopTagRed()

	var_0_16 = Timer.New(function()
		local var_101_0 = 0
		local var_101_1 = manager.time:GetServerTime()

		for iter_101_0, iter_101_1 in ipairs(var_0_13.get_tagList_id_list) do
			local var_101_2 = var_0_13[iter_101_1]
			local var_101_3 = getData("limitRed", "tag_" .. iter_101_1) or 0

			if var_101_2.unlock == 1 and var_101_2.lasted_time > 0 and var_101_3 == 1 then
				var_101_0 = var_101_0 + 1

				if var_101_1 < var_101_2.lasted_time then
					arg_100_0:LockTag(iter_101_1)
					saveData("limitRed", "tag_" .. iter_101_1, 0)
					manager.redPoint:setTip(RedPointConst.TAG .. "_" .. iter_101_1, 0)
				else
					manager.redPoint:setTip(RedPointConst.TAG .. "_" .. iter_101_1, 1)
				end
			end
		end

		if var_101_0 == 0 then
			arg_100_0:StopTagRed()
		end
	end, 1, -1)

	var_0_16:Start()
end

function var_0_0.ClearTagRed(arg_102_0)
	for iter_102_0, iter_102_1 in ipairs(var_0_13.get_tagList_id_list) do
		saveData("limitRed", "tag_" .. iter_102_1, 0)
		manager.redPoint:setTip(RedPointConst.TAG .. "_" .. iter_102_1, 0)
	end
end

function var_0_0.StopTagRed(arg_103_0)
	if var_0_16 then
		var_0_16:Stop()

		var_0_16 = nil
	end
end

local var_0_17

function var_0_0.RefreshCardBgRed(arg_104_0)
	arg_104_0:StopCardRed()

	var_0_17 = Timer.New(function()
		local var_105_0 = 0
		local var_105_1 = manager.time:GetServerTime()

		for iter_105_0, iter_105_1 in ipairs(var_0_11.get_cardBg_id_list) do
			local var_105_2 = var_0_11[iter_105_1]
			local var_105_3 = getData("limitRed", "cardBg_" .. iter_105_1) or 0

			if var_105_2.unlock == 1 and var_105_2.lasted_time > 0 and var_105_3 == 1 then
				var_105_0 = var_105_0 + 1

				if var_105_1 < var_105_2.lasted_time then
					arg_104_0:LockCardBg(iter_105_1)
					saveData("limitRed", "cardBg_" .. iter_105_1, 0)
					manager.redPoint:setTip(RedPointConst.CARD_BG .. "_" .. iter_105_1, 0)
				else
					manager.redPoint:setTip(RedPointConst.CARD_BG .. "_" .. iter_105_1, 1)
				end
			end
		end

		if var_105_0 == 0 then
			arg_104_0:StopCardRed()
		end
	end, 1, -1)

	var_0_17:Start()
end

function var_0_0.ClearCardBgRed(arg_106_0)
	for iter_106_0, iter_106_1 in ipairs(var_0_11.get_cardBg_id_list) do
		saveData("limitRed", "cardBg_" .. iter_106_1, 0)
		manager.redPoint:setTip(RedPointConst.CARD_BG .. "_" .. iter_106_1, 0)
	end
end

function var_0_0.StopCardRed(arg_107_0)
	if var_0_17 then
		var_0_17:Stop()

		var_0_17 = nil
	end
end

function var_0_0.SetCurChatBubbleID(arg_108_0, arg_108_1)
	var_0_1.used_chat_buddle_id = arg_108_1
end

function var_0_0.GetCurChatBubbleID(arg_109_0)
	return var_0_1.used_chat_buddle_id
end

function var_0_0.UnlockChatBubble(arg_110_0, arg_110_1)
	table.insert(var_0_1.chat_bubble_unlock_id_list, arg_110_1)
	manager.redPoint:setTip(string.format("%s_%s", RedPointConst.CHAT_BUBBLE, arg_110_1), 1)
end

function var_0_0.GetUnlockChatBubbleIDList(arg_111_0)
	return var_0_1.chat_bubble_unlock_id_list
end

function var_0_0.InitPlayerStoryTrigger(arg_112_0, arg_112_1)
	var_0_15 = {}

	for iter_112_0, iter_112_1 in ipairs(arg_112_1.info_list) do
		var_0_15[iter_112_1.trigger_group_id] = {}

		for iter_112_2, iter_112_3 in ipairs(iter_112_1.completed_trigger_list) do
			table.insert(var_0_15[iter_112_1.trigger_group_id], iter_112_3)
		end
	end
end

function var_0_0.AddPlayerStoryTrigger(arg_113_0, arg_113_1)
	local var_113_0 = StoryTriggerCfg[arg_113_1]

	if var_0_15[var_113_0.trigger_group] then
		if table.indexof(var_0_15[var_113_0.trigger_group], arg_113_1) == false then
			table.insert(var_0_15[var_113_0.trigger_group], arg_113_1)
		end
	else
		var_0_15[var_113_0.trigger_group] = {
			arg_113_1
		}
	end
end

function var_0_0.GetPlayerStoryTriggerGroupInfo(arg_114_0, arg_114_1)
	local var_114_0 = StoryTriggerCfg[arg_114_1]
	local var_114_1 = #StoryTriggerCfg.get_id_list_by_trigger_group[var_114_0.trigger_group]
	local var_114_2 = 0

	if var_0_15[var_114_0.trigger_group] then
		var_114_2 = #var_0_15[var_114_0.trigger_group]
	end

	return var_114_2, var_114_1
end

local var_0_18 = 0
local var_0_19 = {}
local var_0_20 = 0
local var_0_21 = false
local var_0_22 = false

function var_0_0.GetRandomPosterGirlData(arg_115_0)
	return {
		random_type = 1,
		random_model = var_0_18,
		random_list = var_0_19,
		show_hero_dressing_scene = var_0_21,
		routine_hero_dressing_scene = var_0_22
	}
end

function var_0_0.GetRandomSceneData(arg_116_0)
	return {
		random_type = 2,
		random_model = HomeSceneSettingData:GetRandomModeRaw(),
		random_list = HomeSceneSettingData:GetRandomSceneList()
	}
end

function var_0_0.SetRandomHeroData(arg_117_0, arg_117_1)
	var_0_18 = arg_117_1.random_model
	var_0_19 = {}
	var_0_21 = arg_117_1.show_hero_dressing_scene ~= 0
	var_0_22 = arg_117_1.routine_hero_dressing_scene ~= 0

	table.insertto(var_0_19, arg_117_1.random_list)
end

function var_0_0.IsRandomHeroUseDlcScene(arg_118_0)
	return var_0_21
end

function var_0_0.SetIsRandomHeroUseDlcScene(arg_119_0, arg_119_1)
	var_0_21 = arg_119_1
end

function var_0_0.IsRandomHeroShowEachDebutAnim(arg_120_0)
	return var_0_22
end

function var_0_0.SetIsRandomHeroShowEachDebutAnim(arg_121_0, arg_121_1)
	var_0_22 = arg_121_1
end

function var_0_0.GetRandomHeroList(arg_122_0)
	return var_0_19
end

function var_0_0.SetRandomHeroList(arg_123_0, arg_123_1)
	var_0_19 = clone(arg_123_1)
end

function var_0_0.GetRandomHeroMode(arg_124_0)
	return PlayerTools.RandomModeDataGetMode(var_0_18)
end

function var_0_0.SetRandomHeroMode(arg_125_0, arg_125_1)
	var_0_18 = PlayerTools.MakeRandomModeData(arg_125_0:IsRandomHero(), arg_125_1)
end

function var_0_0.IsRandomHero(arg_126_0)
	return PlayerTools.RandomModeDataIsEnable(var_0_18)
end

function var_0_0.SetIsRandomHero(arg_127_0, arg_127_1)
	var_0_18 = PlayerTools.MakeRandomModeData(arg_127_1, arg_127_0:GetRandomHeroMode())
end

function var_0_0.GetRandomHero(arg_128_0)
	if var_0_20 == 0 then
		arg_128_0:CalcNextRandomHero()
	end

	return var_0_20
end

function var_0_0.SetRandomHero(arg_129_0, arg_129_1)
	var_0_20 = arg_129_1
end

function var_0_0.CalcNextRandomHero(arg_130_0)
	local var_130_0 = arg_130_0:GetRandomHeroList()
	local var_130_1 = #var_130_0

	if var_130_1 == 0 then
		var_0_20 = var_0_1.poster_girl

		return var_0_20
	end

	local var_130_2 = math.random(var_130_1)
	local var_130_3 = var_130_0[var_130_2]

	if var_130_3 == var_0_20 then
		if var_130_1 >= var_130_2 + 1 then
			var_130_3 = var_130_0[var_130_2 + 1]
		elseif var_130_2 - 1 >= 1 then
			var_130_3 = var_130_0[var_130_2 - 1]
		end
	end

	var_0_20 = var_130_3
end

function var_0_0.GetPosterGirlHeroId(arg_131_0)
	if arg_131_0:IsRandomHero() then
		return arg_131_0:GetRandomHero()
	else
		return var_0_1.poster_girl
	end
end

return var_0_0
