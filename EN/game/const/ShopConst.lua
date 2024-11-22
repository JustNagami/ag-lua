local var_0_0 = {
	SHOP_ID = {
		DORM_SHOP = 51,
		CONSTANT_OBSERVATIONS = 24,
		SIX_SHOP = 34,
		DREAM_SHOP = 23,
		DIRECT_SHOP = 16,
		RE_COME_SHOP = 200,
		PASSPORT_SHOP = 11,
		DAILY_SHOP = 2,
		LIMIT_SUPPLY = 3,
		MIGRATION_OBSERVATIONS = 25,
		CONTRACT_BENEFITS = 37,
		SKIN_SHOP = 15,
		NEWBIE_SHOP = 5,
		SUMMER_SHOP1 = 91,
		DRAW_SHOP = 6,
		GUIDE_SHOP = 13,
		CORE_VERIFICATION = 41,
		DAILY_SUPPLY = 4,
		NEW_DUO_WEI = 22,
		SP_HERO_CHALLENGE_1 = 216,
		NOOB_BP_RECHARGE = 1046,
		NOOB_MONTHLY_RECHARGE = 1045,
		NEW_SERVER_SHOP = 220,
		OLD_DUO_WEI = 21,
		BLACK_AREA = 20,
		REPURCHASE_SHOP = 17,
		SUPPORT_SHOP = 100,
		OBSERVATION_SHOP = 36,
		ADMIN_CAT_SHOP = 99,
		REPORT_SHOP = 12,
		FURNITURE_SHOP = 52,
		EQUIP_DEVELOP = 32,
		RECHARGE = 1043,
		EIGHT_SHOP = 35,
		COHOMOLOGY_TRACKS = 14,
		CANTEEN_SHOP = 50,
		SKIN_TARGET = 18,
		DLC_SHOP = 15,
		SUPPORT_SHOP_2_8 = 103
	},
	SHOP_LIMIT_TEXT = {
		[0] = "LIMIT_ALL",
		"PURCHASE_LIMIT",
		"LIMIT_MONTH",
		"LIMIT_WEEK",
		"LIMIT_DAY",
		"LIMIT_ALL",
		"LIMIT_ALL",
		"PURCHASE_LIMIT"
	},
	SHOP_LIMIT = {
		BATTLE_PASS_LV = 2,
		PLAYER_LV = 1
	},
	COST_LEVEL = {
		RECHARGE_DIAMOND = 2,
		MATERIAL = 3,
		FREE_DIAMOND = 1
	},
	DISCOUNT = {
		TIME_DISCOUNT = 2,
		DISCOUNT = 3,
		NONE = 4
	},
	TAGS = {
		NEW = 2,
		SUPER_VALUE = 1
	},
	ITEM_TYPE_TO_LABEL = {
		[ItemConst.ITEM_TYPE.HERO_PIECE] = "SHOP_LABLE_4",
		[ItemConst.ITEM_TYPE.EQUIP] = "SHOP_LABLE_3",
		[ItemConst.ITEM_TYPE.WEAPON_SERVANT] = "SHOP_LABLE_2"
	},
	ADD_CURRENCY = {
		[2] = true,
		[1] = true
	}
}

var_0_0.prefabList = {
	[var_0_0.SHOP_ID.LIMIT_SUPPLY] = "Widget/System/Recharge/pages/RechargeGiftPageUI",
	[var_0_0.SHOP_ID.DAILY_SUPPLY] = "Widget/System/Recharge/pages/RechargeGiftPageUI",
	[var_0_0.SHOP_ID.NEWBIE_SHOP] = "Widget/System/Recharge/pages/RechargeGiftPageUI",
	[var_0_0.SHOP_ID.DRAW_SHOP] = "Widget/System/Recharge/pages/RechargeVoucherPageUI",
	[var_0_0.SHOP_ID.SKIN_SHOP] = "Widget/System/Recharge/pages/RechargeSkinDlcPageUI_New",
	[var_0_0.SHOP_ID.DIRECT_SHOP] = "Widget/System/Recharge/pages/RechargeSkinPageUI_New",
	[var_0_0.SHOP_ID.REPURCHASE_SHOP] = "Widget/System/Recharge/pages/RechargeSkinPageUI_New",
	[var_0_0.SHOP_ID.SKIN_TARGET] = "Widget/System/Recharge/pages/RechargeSkinTicketPageUI",
	[var_0_0.SHOP_ID.CONSTANT_OBSERVATIONS] = "Widget/System/Recharge/pages/RechargeMonthCardPageUI",
	[var_0_0.SHOP_ID.MIGRATION_OBSERVATIONS] = "Widget/System/Recharge/pages/RechargeRechargePageUI",
	[var_0_0.SHOP_ID.SIX_SHOP] = "Widget/System/Recharge/pages/RechargeFirstRechargePageUI",
	[var_0_0.SHOP_ID.EIGHT_SHOP] = "Widget/System/Recharge/pages/RechargeFirstRechargePageUI",
	[var_0_0.SHOP_ID.OBSERVATION_SHOP] = "Widget/System/Activitynewbie/NewbieMonthlyCardUI_old",
	[var_0_0.SHOP_ID.CONTRACT_BENEFITS] = "Widget/System/Activitynewbie/NewbieBpRechargeUI_old"
}
var_0_0.SIX_EIGHT = {
	[var_0_0.SHOP_ID.SIX_SHOP] = 1,
	[var_0_0.SHOP_ID.EIGHT_SHOP] = 2
}
var_0_0.SHOP_ID_TO_RED_CONST = {
	[var_0_0.SHOP_ID.LIMIT_SUPPLY] = "ACTIVITY_BONUS",
	[var_0_0.SHOP_ID.DAILY_SUPPLY] = "NORMAL_BONUS",
	[var_0_0.SHOP_ID.NEWBIE_SHOP] = "NEWBIE_BONUS",
	[var_0_0.SHOP_ID.REPORT_SHOP] = "HERO_PIECE_EXCHANGE",
	[var_0_0.SHOP_ID.CONSTANT_OBSERVATIONS] = "NOOB_MONTHLY_RECHARGE_SIGN",
	[var_0_0.SHOP_ID.MIGRATION_OBSERVATIONS] = 400,
	[var_0_0.SHOP_ID.SIX_SHOP] = "NOOB_FIRST_RECHARGE_1",
	[var_0_0.SHOP_ID.EIGHT_SHOP] = "NOOB_FIRST_RECHARGE_2",
	[var_0_0.SHOP_ID.OBSERVATION_SHOP] = "NOOB_MONTHLY_RECHARGE",
	[var_0_0.SHOP_ID.CONTRACT_BENEFITS] = "NOOB_BP_RECHARGE"
}
var_0_0.PC_LOCK_SHOP = {
	[var_0_0.SHOP_ID.SKIN_TARGET] = true,
	[var_0_0.SHOP_ID.MIGRATION_OBSERVATIONS] = true
}
var_0_0.PC_LOCK_RECHARGE = {
	["1_4"] = true,
	["2_3"] = true
}
var_0_0.NEED_HIDE_TIME = {
	[var_0_0.SHOP_ID.SP_HERO_CHALLENGE_1] = true,
	[var_0_0.SHOP_ID.CANTEEN_SHOP] = true
}

return var_0_0
