OperationConst = import("game.const.OperationConst")
RedPointConst = import("game.const.RedPointConst")

return {
	Forum = 11,
	Shop = 14,
	Infomation = 10,
	Survey = 9,
	Explore = 5,
	Inquery = 15,
	Servant = 1,
	Sign = 7,
	Announcement = 8,
	Chip = 2,
	Cooperation = 17,
	Attention = 13,
	Activity = 18,
	Cdk = 12,
	HeartStory = 6,
	Guide = 20,
	Suggest = 16,
	Achieve = 4,
	Illustrated = 3,
	OfficialWeb = 19,
	MenuBtnList = {
		{
			id = 1,
			nameId = 520001,
			icon = "icon_weaponservant_new",
			type = 0
		},
		{
			id = 2,
			nameId = 520002,
			icon = "icon_chip_new",
			type = 0
		},
		{
			id = 3,
			nameId = 520003,
			icon = "icon_collect_new",
			type = 0
		},
		{
			id = 4,
			nameId = 520004,
			icon = "icon_achieve_new",
			type = 0
		},
		{
			id = 5,
			nameId = 520005,
			icon = "icon_explore_new",
			type = 0
		},
		{
			id = 6,
			nameId = 520006,
			icon = "icon_ArchiveStory",
			type = 0
		},
		{
			id = 7,
			nameId = 520007,
			icon = "btn_gift_new",
			type = 1
		},
		{
			id = 8,
			nameId = 520008,
			icon = "btn_annc_new",
			type = 1
		},
		{
			systemId = 9907,
			nameId = 520009,
			type = 1,
			id = 9,
			icon = "icon_psq_new"
		},
		{
			systemId = 9912,
			nameId = 520010,
			type = 1,
			id = 10,
			icon = "icon_info_new"
		},
		{
			systemId = 9904,
			nameId = 520011,
			type = 1,
			id = 11,
			icon = "icon_forum_new"
		},
		{
			systemId = 9903,
			nameId = 520012,
			type = 1,
			id = 12,
			icon = "icon_cdk_new"
		},
		{
			systemId = 9908,
			nameId = 520013,
			type = 1,
			id = 13,
			icon = "icon_attention_new"
		},
		{
			systemId = 9911,
			nameId = 520014,
			type = 1,
			id = 14,
			icon = "icon_perimeter_new"
		},
		{
			systemId = 9905,
			nameId = 520015,
			type = 1,
			id = 15,
			icon = "icon_query_new"
		},
		{
			systemId = 9902,
			nameId = 520016,
			type = 1,
			id = 16,
			icon = "icon_suggest_new"
		},
		{
			id = 17,
			nameId = 520017,
			icon = "icon_online_new",
			type = 1
		},
		{
			systemId = 9910,
			nameId = 520018,
			type = 1,
			id = 18,
			icon = "icon_activity_new"
		},
		{
			systemId = 9909,
			nameId = 520019,
			type = 1,
			id = 19,
			icon = "icon_web_new"
		}
	},
	MenuToOperation = {
		[9] = OperationConst.QUESTIONNAIRE,
		[10] = OperationConst.INFOMATION,
		[11] = OperationConst.FORUM,
		[12] = OperationConst.CD_KEY,
		[13] = OperationConst.ATTENTION,
		[14] = OperationConst.SHOP_TAOBAO,
		[15] = OperationConst.INQUERY,
		[16] = OperationConst.SUGGEST,
		[18] = OperationConst.ACTIVITY,
		[19] = OperationConst.OFFICIAL_WEBSITE
	},
	MenuRedPointList = {
		RedPointConst.WEAPON_SERVANT_MERGE,
		RedPointConst.CHIP_MANAGER,
		RedPointConst.ILLU_USER,
		RedPointConst.ACHIEVEMENT,
		RedPointConst.EXPLORE_MAIN,
		RedPointConst.HERO_HEART_STORY_ROOT_FULL,
		RedPointConst.SIGN,
		RedPointConst.BULLETIN_UNREAD,
		RedPointConst.SURVEY,
		RedPointConst.INFOMATION,
		RedPointConst.FORUM_PLATFORM,
		[13] = RedPointConst.FOLLOW_GIFT,
		[14] = RedPointConst.SHOP_TAOBAO,
		[16] = RedPointConst.CUSTOMER_SERVICE_UNREAD,
		[17] = RedPointConst.COOPERATION_INVIT,
		[18] = RedPointConst.OPERATION_ACTIVITY
	}
}
