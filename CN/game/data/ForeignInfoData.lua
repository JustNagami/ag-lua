local var_0_0 = singletonClass("ForeignInfoData", BaseHeroViewData)
local var_0_1 = {}
local var_0_2

function var_0_0.SetForeignHeroInfo(arg_1_0, arg_1_1)
	var_0_1 = {}

	for iter_1_0, iter_1_1 in ipairs(arg_1_1) do
		local var_1_0 = iter_1_1.hero_base_info
		local var_1_1 = ForeignHeroDataTemplate.New(var_1_0.id)

		var_1_1:Init(iter_1_1)

		var_0_1[var_1_0.id] = var_1_1
	end
end

function var_0_0.GetHeroList(arg_2_0)
	return var_0_1
end

function var_0_0.GetHeroNO(arg_3_0, arg_3_1)
	return table.indexof(arg_3_0:GetHeroIDList(), arg_3_1) or 0
end

function var_0_0.GetEquipDataList(arg_4_0, arg_4_1)
	return var_0_1[arg_4_1].equip_list
end

function var_0_0.SetCurForeignDetailInfo(arg_5_0, arg_5_1)
	var_0_2 = {
		user_id = arg_5_1.user_id,
		level = arg_5_1.level,
		nick = arg_5_1.base_info.nick,
		icon = arg_5_1.base_info.icon,
		icon_frame = arg_5_1.base_info.icon_frame,
		sign = arg_5_1.sign,
		sticker_show_info = PlayerData:InitStickerShowList({
			arg_5_1.sticker_show_info
		}, true),
		hero_list = arg_5_1.hero_list or {},
		is_online = arg_5_1.is_online,
		ip = (arg_5_1.ip_location == nil or arg_5_1.ip_location == "") and GetTips("IP_UNKNOWN") or arg_5_1.ip_location,
		guildID = arg_5_1.club_id,
		guildName = arg_5_1.club_name,
		guildIcon = arg_5_1.club_icon,
		postGril = arg_5_0:GetPostID(arg_5_1.poster_hero),
		birthdayMonth = arg_5_1.birthday.month,
		birthdayDay = arg_5_1.birthday.day,
		backhome_architecture_id = arg_5_1.backhome_architecture_id,
		hero_id_list = cleanProtoTable(arg_5_1.hero_id_list),
		likes = arg_5_1.likes,
		used_tag_list = cleanProtoTable(arg_5_1.used_tag_list),
		card_bg_id = arg_5_1.information_background_id,
		post_background_id = arg_5_1.post_background_id,
		achievement_static_info = arg_5_1.achievement_static_info,
		hero_static_info = arg_5_1.hero_static_info,
		weapon_servant_static_info = arg_5_1.weapon_servant_static_info,
		sticker_static_info = arg_5_1.sticker_static_info,
		sticker_background_static_info = arg_5_1.sticker_background_static_info,
		sticker_foreground_static_info = arg_5_1.sticker_foreground_static_info
	}
end

function var_0_0.GetPostID(arg_6_0, arg_6_1)
	if arg_6_1.hero_id ~= 0 then
		if arg_6_1.using_skin ~= 0 then
			return arg_6_1.using_skin
		else
			return arg_6_1.hero_id
		end
	end

	return 1084
end

function var_0_0.GetCurForeignDetailInfo(arg_7_0)
	return var_0_2
end

function var_0_0.OnSendLike(arg_8_0)
	if var_0_2 and var_0_2.likes then
		var_0_2.likes = var_0_2.likes + 1
	end
end

function var_0_0.GetExFilterSorterFunc(arg_9_0)
	return function(arg_10_0, arg_10_1)
		local var_10_0 = ForeignInfoData:GetHeroNO(arg_10_0.id)
		local var_10_1 = ForeignInfoData:GetHeroNO(arg_10_1.id)

		return true, var_10_0 < var_10_1
	end
end

return var_0_0
