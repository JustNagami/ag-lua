﻿local var_0_0 = {
	CURRENCY_FOR_DRAW = 36,
	ITEM_TYPE = {
		CURRENCY = 1,
		PORTRAIT = 11,
		FRAME = 12,
		SCENE = 21,
		STICKER_BG = 18,
		GIFT = 5,
		CANTEEN_INGREDIENTS = 16,
		CARD_BG = 23,
		FURNITURE_SUIT = 24,
		CHAT_BUBBLE = 26,
		PROPS = 4,
		DORM_FURNITURE = 15,
		SKIN_CHANGE = 14,
		STICKER = 13,
		WEAPON_SERVANT = 9,
		CLUB_COMMON = 17,
		HERO_PIECE = 3,
		EQUIP = 7,
		TAG = 22,
		DYNAMIC_STICKER = 20,
		HERO_SKIN = 8,
		STICKER_FG = 25,
		ARCHIVE_GIFT = 10,
		HERO = 2,
		MATERIAL = 6
	},
	ITEM_SUB_TYPE = {
		FRAME_LIMIT = 1203,
		LIMIT_SKIN = 801,
		SPECIAL_STICKER = 1302,
		PERIODICITY_EXPLORE_TICKER_INSTANCE = 1701,
		NORMAL_STICKER = 1301,
		PROPS_VITALITY = 401,
		FRAME_LINK = 1202,
		SCENE_LIMITED = 2102,
		SCENE_NORMAL = 2101,
		PERIODICITY_EXPLORE_TICKER = 1702,
		MOON_CAKE = 621,
		HERO_BREAK_ITEM = 604,
		MOON_FILLING_MATERIAL = 619,
		FUKUBUKURO = 513,
		EQUIP_PIECE_UP = 511,
		MOON_FILLING = 620,
		SHOP_PACKS = 501,
		FRAME_LIMIT_COVER = 1204,
		DROP_ITEM = 507,
		NEWWARCHESS_MOVEPOINT_PACKAGE = 622,
		LIMIT_TIME_SKIN_ITEM = 407,
		OPTIONAL_ITEM_MULT = 508,
		DROP_TICKET = 1401,
		PROPS_VITALITY_TIME_VALID = 403,
		TAG_LIMIT = 2202,
		EQUIP_PIECE = 510,
		MODULE_PIECE = 617,
		BITRHDAY_LETTER = 405,
		MOON_CAKE_GIFT = 512,
		SHOP_SEVEN_PACKS = 505,
		OPTIONAL_ITEM = 504,
		CHANGE_NAME_CARD = 1501,
		OPTIONAL_ITEM_LIMIT_TIME = 514,
		BIRTHDAY_ITEM = 406,
		PROPS_BOND = 402,
		HERO_CHIP_GIFT = 506,
		CARD_BG_LIMIT = 2302,
		TIME_LIMIT_ITEM = 404
	},
	SORT_TYPE = {
		UP = 1,
		DOWN = 0
	},
	SUIT_TYPE = {
		DETAIL = 1,
		SMALL = 0
	},
	ITEM_TYPE_NAME = {
		"ITEM_TYPE_NOTE_1",
		"ITEM_TYPE_NOTE_2",
		"ITEM_TYPE_NOTE_3",
		"ITEM_TYPE_NOTE_4",
		"ITEM_TYPE_NOTE_5",
		"ITEM_TYPE_NOTE_6",
		"ITEM_TYPE_NOTE_7",
		"ITEM_TYPE_NOTE_8",
		"ITEM_TYPE_NOTE_9"
	},
	STR_ITEM = {
		SERVANT = 612,
		HERO = 601,
		EQUIP = 608,
		WEAPON = 602
	},
	ITEM_FLOOR = {
		SHORT = 1,
		BLACK = 3,
		LONG = 2
	},
	ITEM_ANIMATOR_TYPE = {
		STOP = 0,
		ADVANCED = 2,
		NORMAL = 1
	}
}

var_0_0.LIMIT_TIME_ITEM = {
	[var_0_0.ITEM_SUB_TYPE.PERIODICITY_EXPLORE_TICKER] = true,
	[var_0_0.ITEM_SUB_TYPE.TIME_LIMIT_ITEM] = true
}
var_0_0.ITEM_STORE_MATERIAL_IGNORE = {
	type = {
		[var_0_0.ITEM_TYPE.ARCHIVE_GIFT] = true
	},
	subType = {
		[var_0_0.ITEM_SUB_TYPE.MOON_FILLING_MATERIAL] = true,
		[var_0_0.ITEM_SUB_TYPE.MOON_FILLING] = true,
		[var_0_0.ITEM_SUB_TYPE.MOON_CAKE] = true,
		[var_0_0.ITEM_SUB_TYPE.MOON_CAKE_GIFT] = true
	}
}

return var_0_0
