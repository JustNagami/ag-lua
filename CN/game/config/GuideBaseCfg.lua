return {
	{
		narrator_name = "巴德尔",
		group = 0,
		not_skip_guide = 1,
		id = 1,
		narrator_icon = "1036",
		is_no_home = true,
		steps = {
			101,
			102,
			107
		},
		open_condition = {},
		skip_condition = {
			{
				"stage",
				1010001
			}
		},
		ignore_group_condition = {},
		leaps = {}
	},
	{
		narrator_name = "巴德尔",
		group = 0,
		not_skip_guide = 1,
		id = 2,
		narrator_icon = "1036",
		is_no_home = true,
		steps = {
			201,
			202,
			206
		},
		open_condition = {
			{
				"stage",
				1010001
			}
		},
		skip_condition = {
			{
				"stage",
				1010002
			}
		},
		ignore_group_condition = {},
		leaps = {}
	},
	[4] = {
		narrator_name = "巴德尔",
		group = 0,
		not_skip_guide = 1,
		id = 4,
		narrator_icon = "1036",
		is_no_home = true,
		steps = {
			405,
			406,
			407,
			408,
			409,
			410,
			411,
			412
		},
		open_condition = {
			{
				"stage",
				1010002
			},
			{
				"canJump"
			}
		},
		skip_condition = {
			{
				"stage",
				1010003
			}
		},
		ignore_group_condition = {},
		leaps = {}
	},
	[5] = {
		narrator_name = "巴德尔",
		group = 0,
		not_skip_guide = 1,
		id = 5,
		narrator_icon = "1036",
		is_no_home = true,
		steps = {
			501,
			502,
			503,
			504,
			505,
			506,
			507,
			508
		},
		open_condition = {
			{
				"stage",
				1010003
			},
			{
				"canJump"
			}
		},
		skip_condition = {
			{
				"stage",
				1010004
			}
		},
		ignore_group_condition = {},
		leaps = {}
	},
	{
		narrator_name = "巴德尔",
		group = 0,
		not_skip_guide = 1,
		id = 3,
		narrator_icon = "1036",
		is_no_home = false,
		steps = {},
		open_condition = {
			{
				"stage",
				1010004
			},
			{
				"canJump"
			}
		},
		skip_condition = {
			{
				"stage",
				1010005
			}
		},
		ignore_group_condition = {},
		leaps = {}
	},
	[6] = {
		narrator_name = "巴德尔",
		group = 0,
		not_skip_guide = 1,
		id = 6,
		narrator_icon = "1036",
		is_no_home = false,
		steps = {
			601,
			602,
			603,
			604,
			605,
			606,
			607,
			608,
			609,
			610
		},
		open_condition = {
			{
				"guide",
				3
			},
			{
				"stage",
				1010004
			},
			{
				"canJump"
			}
		},
		skip_condition = {
			{
				"stage",
				1010005
			}
		},
		ignore_group_condition = {},
		leaps = {}
	},
	[8] = {
		narrator_name = "巴德尔",
		group = 0,
		not_skip_guide = 1,
		id = 8,
		narrator_icon = "1036",
		is_no_home = false,
		steps = {},
		open_condition = {
			{
				"stage",
				1010101
			},
			{
				"canJump"
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[10] = {
		narrator_name = "弥弥尔",
		group = 1,
		not_skip_guide = 0,
		id = 10,
		narrator_icon = "mmr",
		is_no_home = true,
		steps = {
			1001,
			1002,
			1003
		},
		open_condition = {
			{
				"stage",
				1010412
			},
			{
				"canJump"
			}
		},
		skip_condition = {},
		ignore_group_condition = {
			{
				"uiNameList",
				{
					"chapterMap"
				}
			}
		},
		leaps = {}
	},
	[1001] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 1001,
		narrator_icon = "mmr",
		is_no_home = true,
		steps = {
			1004,
			1005
		},
		open_condition = {
			{
				"guide",
				10
			},
			{
				"uiNameList",
				{
					"towerStage"
				}
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[11] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 11,
		narrator_icon = "mmr",
		is_no_home = true,
		steps = {
			1101,
			1102,
			1103
		},
		open_condition = {
			{
				"playerLevel",
				40
			},
			{
				"canJump"
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[1101] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 1101,
		narrator_icon = "mmr",
		is_no_home = true,
		steps = {},
		open_condition = {
			{
				"guide",
				11
			},
			{
				"uiNameList",
				{
					"mythicDifficulty"
				}
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[12] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 12,
		narrator_icon = "mmr",
		is_no_home = true,
		steps = {
			1201,
			1202,
			1203
		},
		open_condition = {
			{
				"stage",
				1010513
			},
			{
				"canJump"
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[1201] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 1201,
		narrator_icon = "mmr",
		is_no_home = true,
		steps = {
			1204
		},
		open_condition = {
			{
				"guide",
				12
			},
			{
				"uiNameList",
				{
					"warChessStage"
				}
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[13] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 13,
		narrator_icon = "mmr",
		is_no_home = true,
		steps = {
			1301,
			1302,
			1303
		},
		open_condition = {
			{
				"playerLevel",
				30
			},
			{
				"canJump"
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[1301] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 1301,
		narrator_icon = "mmr",
		is_no_home = true,
		steps = {
			1304,
			1305
		},
		open_condition = {
			{
				"guide",
				13
			},
			{
				"uiNameList",
				{
					"bossSwitch"
				}
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[17] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 17,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {},
		open_condition = {
			{
				"stage",
				1010102
			},
			{
				"uiNameList",
				{
					"home"
				}
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[18] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 18,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {
			1801,
			1802,
			1804,
			1805,
			1806,
			1807,
			1808
		},
		open_condition = {
			{
				"stage",
				1010210
			},
			{
				"canJump"
			}
		},
		skip_condition = {
			{
				"stage",
				1010211
			}
		},
		ignore_group_condition = {},
		leaps = {}
	},
	[19] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 19,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {},
		open_condition = {
			{
				"stage",
				1010211
			},
			{
				"canJump"
			}
		},
		skip_condition = {
			{
				"stage",
				1010301
			}
		},
		ignore_group_condition = {},
		leaps = {}
	},
	[20] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 20,
		narrator_icon = "mmr",
		is_no_home = true,
		steps = {
			2001,
			2002,
			2003
		},
		open_condition = {
			{
				"playerLevel",
				20
			},
			{
				"stage",
				1010304
			},
			{
				"canJump"
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[2001] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 2001,
		narrator_icon = "mmr",
		is_no_home = true,
		steps = {
			2004,
			2005
		},
		open_condition = {
			{
				"guide",
				20
			},
			{
				"uiNameList",
				{
					"equipSection"
				}
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[21] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 21,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {
			2102,
			2103
		},
		open_condition = {
			{
				"guide",
				13
			},
			{
				"stage",
				1010613
			},
			{
				"uiNameList",
				{
					"chapterMapContent"
				}
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[22] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 22,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {
			2201,
			2202
		},
		open_condition = {
			{
				"playerLevel",
				40
			},
			{
				"stage",
				1010304
			},
			{
				"uiNameList",
				{
					"chapterMap"
				}
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[2201] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 2201,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {
			2203
		},
		open_condition = {
			{
				"guide",
				22
			},
			{
				"uiNameList",
				{
					"enchantment"
				}
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[27] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 27,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {
			2701,
			2702,
			2703,
			2704,
			2705,
			2706
		},
		open_condition = {
			{
				"stage",
				1011206
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {
			{
				"skuldTravelView",
				2
			}
		}
	},
	[28] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 28,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {},
		open_condition = {},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[29] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 29,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {
			2901,
			2902
		},
		open_condition = {
			{
				"stage",
				1011242
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {
			{
				"skuldTravelView",
				2
			}
		}
	},
	[35] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 35,
		narrator_icon = "mmr",
		is_no_home = true,
		steps = {
			3501,
			3502,
			3503
		},
		open_condition = {
			{
				"playerLevel",
				55
			},
			{
				"stage",
				1010304
			},
			{
				"canJump"
			}
		},
		skip_condition = {
			{
				"playerLevel",
				56
			}
		},
		ignore_group_condition = {},
		leaps = {}
	},
	[3501] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 3501,
		narrator_icon = "mmr",
		is_no_home = true,
		steps = {
			3504
		},
		open_condition = {
			{
				"guide",
				35
			},
			{
				"uiNameList",
				{
					"equipSeizure"
				}
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[36] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 36,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {
			3601,
			3602,
			3603
		},
		open_condition = {
			{
				"drawNewHero"
			},
			{
				"uiNameList",
				{
					"home"
				}
			}
		},
		skip_condition = {
			{
				"playerLevel",
				20
			}
		},
		ignore_group_condition = {},
		leaps = {}
	},
	[3601] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 3601,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {
			3604,
			3605
		},
		open_condition = {
			{
				"guide",
				36
			},
			{
				"uiNameList",
				{
					"teachStage"
				}
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[37] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 37,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {
			3701,
			3702,
			3703,
			3704
		},
		open_condition = {
			{
				"uiNameList",
				{
					"equipCultureView"
				}
			},
			{
				"equip",
				"equipLevel",
				30
			},
			{
				"equip",
				"page",
				4
			}
		},
		skip_condition = {
			{
				"playerLevel",
				50
			}
		},
		ignore_group_condition = {},
		leaps = {}
	},
	[38] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 38,
		narrator_icon = "mmr",
		is_no_home = true,
		steps = {
			3801,
			3802,
			3803
		},
		open_condition = {
			{
				"stage",
				1010405
			},
			{
				"canJump"
			}
		},
		skip_condition = {
			{
				"stage",
				1010406
			}
		},
		ignore_group_condition = {},
		leaps = {}
	},
	[40] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 40,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {
			4001,
			4002,
			4003,
			4004,
			4005,
			4006,
			4007,
			4008,
			4009,
			4010,
			4011,
			4012
		},
		open_condition = {
			{
				"playerLevel",
				60
			},
			{
				"canJump"
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[41] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 41,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {
			4101,
			4102,
			4103,
			4104
		},
		open_condition = {
			{
				"uiNameList",
				{
					"equipCultureView"
				}
			},
			{
				"equip",
				"cultureEquipReset"
			},
			{
				"equip",
				"page",
				5
			}
		},
		skip_condition = {
			{
				"playerLevel",
				50
			}
		},
		ignore_group_condition = {},
		leaps = {}
	},
	[43] = {
		narrator_name = "弥弥尔",
		group = 1,
		not_skip_guide = 0,
		id = 43,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {
			4301,
			4302,
			4303,
			4304,
			4305,
			4306,
			4307,
			4308
		},
		open_condition = {
			{
				"playerLevel",
				70
			},
			{
				"uiNameList",
				{
					"home",
					"weaponModuleView"
				}
			}
		},
		skip_condition = {},
		ignore_group_condition = {
			{
				"uiNameList",
				{
					"weaponModuleView"
				}
			}
		},
		leaps = {
			{
				"weaponModuleView",
				3
			}
		}
	},
	[44] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 44,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {
			4401,
			4402,
			4403,
			4404,
			4405,
			4406,
			4407,
			4408,
			4409,
			4410,
			4411,
			4412
		},
		open_condition = {
			{
				"uiNameList",
				{
					"activityNoob"
				}
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[46] = {
		narrator_name = "弥弥尔",
		group = 1,
		not_skip_guide = 0,
		id = 46,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {
			4601,
			4602,
			4603,
			4604
		},
		open_condition = {
			{
				"playerLevel",
				45
			},
			{
				"canJump"
			}
		},
		skip_condition = {},
		ignore_group_condition = {
			{
				"uiNameList",
				{
					"chapterMap",
					"polyhedronLobby"
				}
			}
		},
		leaps = {}
	},
	[4601] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 4601,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {},
		open_condition = {
			{
				"guide",
				46
			},
			{
				"uiNameList",
				{
					"polyhedronLobby"
				}
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[47] = {
		narrator_name = "弥弥尔",
		group = 1,
		not_skip_guide = 0,
		id = 47,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {
			4701,
			4702
		},
		open_condition = {
			{
				"playerLevel",
				35
			},
			{
				"heroFavorability",
				{
					0,
					5
				}
			},
			{
				"canJump"
			}
		},
		skip_condition = {},
		ignore_group_condition = {
			{
				"uiNameList",
				{
					"dormChooseRoomView",
					"dorm"
				}
			}
		},
		leaps = {}
	},
	[48] = {
		narrator_name = "弥弥尔",
		group = 2,
		not_skip_guide = 0,
		id = 48,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {
			4801,
			4803,
			4804,
			4805,
			4807,
			4809
		},
		open_condition = {
			{
				"playerLevel",
				35
			},
			{
				"uiNameList",
				{
					"dormChooseRoomView",
					"dorm"
				}
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {
			{
				"dorm",
				2
			}
		}
	},
	[49] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 49,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {
			4902,
			4903,
			4904
		},
		open_condition = {
			{
				"playerLevel",
				35
			},
			{
				"uiNameList",
				{
					"dorm"
				}
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[50] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 50,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {
			5001,
			5004,
			5006
		},
		open_condition = {
			{
				"playerLevel",
				35
			},
			{
				"uiNameList",
				{
					"dorm"
				}
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[51] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 51,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {
			5101,
			5102,
			5103,
			5104,
			5105
		},
		open_condition = {
			{
				"playerLevel",
				35
			},
			{
				"uiNameList",
				{
					"heroInteractView"
				}
			},
			{
				"whereTag",
				"dorm"
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[52] = {
		narrator_name = "弥弥尔",
		group = 2,
		not_skip_guide = 0,
		id = 52,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {
			5201,
			5202,
			5203,
			5205,
			5207,
			5208
		},
		open_condition = {
			{
				"playerLevel",
				35
			},
			{
				"uiNameList",
				{
					"dormChooseRoomView",
					"restaurantMain"
				}
			}
		},
		skip_condition = {},
		ignore_group_condition = {
			{
				"uiNameList",
				{
					"restaurantMain"
				}
			}
		},
		leaps = {
			{
				"restaurantMain",
				2
			}
		}
	},
	[53] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 53,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {
			5301,
			5302,
			5303,
			5304,
			5305
		},
		open_condition = {
			{
				"playerLevel",
				35
			},
			{
				"uiNameList",
				{
					"restaurantMain"
				}
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[54] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 54,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {
			5401,
			5403,
			5405,
			5406,
			5407,
			5408
		},
		open_condition = {
			{
				"playerLevel",
				35
			},
			{
				"uiNameList",
				{
					"restaurantMain"
				}
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[55] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 55,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {
			5502,
			5503,
			5504,
			5505
		},
		open_condition = {
			{
				"playerLevel",
				35
			},
			{
				"uiNameList",
				{
					"restaurantCookUpView"
				}
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[56] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 56,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {
			5603,
			5604,
			5605,
			5606,
			5608
		},
		open_condition = {
			{
				"stage",
				1010102
			},
			{
				"uiNameList",
				{
					"adminCatExploreView"
				}
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[57] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 57,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {
			5701,
			5702,
			5703,
			5704,
			5705,
			5706,
			5707,
			5708
		},
		open_condition = {
			{
				"uiNameList",
				{
					"strongholdMain"
				}
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[59] = {
		narrator_name = "禄良",
		group = 0,
		not_skip_guide = 0,
		id = 59,
		narrator_icon = "1072",
		is_no_home = false,
		steps = {
			5901,
			5902,
			5903,
			5904,
			5905,
			5906,
			5907,
			5908,
			5909,
			5910,
			5911,
			5912,
			5913,
			5914,
			5915,
			5916,
			5917,
			5918,
			5919,
			5920,
			5921,
			5922,
			5923,
			5924,
			5925,
			5926,
			5927,
			5928,
			5929,
			5930,
			5931,
			5932,
			5933,
			5934,
			5935,
			5936,
			5937,
			5938,
			5939,
			5940,
			5941,
			5942,
			5943
		},
		open_condition = {
			{
				"activityId",
				222661
			},
			{
				"uiNameList",
				{
					"CombineGameMainView"
				}
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[60] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 1,
		id = 60,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {},
		open_condition = {
			{
				"stage",
				1010113
			},
			{
				"canJump"
			}
		},
		skip_condition = {
			{
				"stage",
				1010201
			}
		},
		ignore_group_condition = {},
		leaps = {}
	},
	[61] = {
		narrator_name = "弥弥尔",
		group = 2,
		not_skip_guide = 0,
		id = 61,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {
			6101,
			6102
		},
		open_condition = {
			{
				"playerLevel",
				35
			},
			{
				"notGuide",
				62
			},
			{
				"uiNameList",
				{
					"dormChooseRoomView"
				}
			}
		},
		skip_condition = {
			{
				"guide",
				62
			}
		},
		ignore_group_condition = {},
		leaps = {}
	},
	[62] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 62,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {
			6201,
			6202,
			6203,
			6204,
			6205,
			6206,
			6207,
			6208,
			6209,
			6210,
			6211,
			6212
		},
		open_condition = {
			{
				"playerLevel",
				35
			},
			{
				"uiNameList",
				{
					"idolTraineeCamp"
				}
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[63] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 63,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {
			6302,
			6303
		},
		open_condition = {
			{
				"playerLevel",
				35
			},
			{
				"uiNameList",
				{
					"idolTraineeDepolyChara"
				}
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[64] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 64,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {
			6401,
			6403,
			6404,
			6405,
			6407,
			6408,
			6409,
			6410
		},
		open_condition = {
			{
				"playerLevel",
				35
			},
			{
				"uiNameList",
				{
					"idolTraineeCamp"
				}
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[65] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 65,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {
			6502,
			6503,
			6504,
			6505
		},
		open_condition = {
			{
				"playerLevel",
				35
			},
			{
				"uiNameList",
				{
					"idolTraineeQuest"
				}
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[66] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 66,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {
			6602,
			6603
		},
		open_condition = {
			{
				"playerLevel",
				60
			},
			{
				"uiNameList",
				{
					"chapterMap"
				}
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[6601] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 6601,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {
			6604,
			6605,
			6606,
			6607
		},
		open_condition = {
			{
				"guide",
				66
			},
			{
				"uiNameList",
				{
					"coreVerificationMain"
				}
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[67] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 67,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {
			6701,
			6702,
			6703
		},
		open_condition = {
			{
				"uiNameList",
				{
					"activityReforgeChapterView"
				}
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[68] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 68,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {
			6801,
			6802,
			6803,
			6804,
			6805,
			6806,
			6807,
			6808,
			6809
		},
		open_condition = {
			{
				"uiNameList",
				{
					"activityReforgeWaveView"
				}
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[70] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 70,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {
			7002,
			7003,
			7004,
			7005,
			7007
		},
		open_condition = {
			{
				"playerLevel",
				35
			},
			{
				"uiNameList",
				{
					"idolTraineeChapterMain"
				}
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[71] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 71,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {
			7101,
			7102,
			7103,
			7104,
			7105
		},
		open_condition = {
			{
				"playerLevel",
				60
			},
			{
				"guide",
				66
			},
			{
				"uiNameList",
				{
					"home"
				}
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[72] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 72,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {
			7201,
			7202,
			7203,
			7204,
			7205,
			7206,
			7207,
			7208,
			7209,
			7210
		},
		open_condition = {
			{
				"playerLevel",
				35
			},
			{
				"uiNameList",
				{
					"spHeroChallengeMainView"
				}
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[73] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 73,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {
			7301,
			7302,
			7303,
			7304,
			7305,
			7306,
			7307,
			7308
		},
		open_condition = {
			{
				"uiNameList",
				{
					"chessBoardHomeView"
				}
			},
			{
				"chess",
				"canUseProp",
				true
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[74] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 74,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {
			7401,
			7402
		},
		open_condition = {
			{
				"guide",
				73
			},
			{
				"chess",
				"canUseProp",
				true
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[75] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 75,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {
			7501
		},
		open_condition = {
			{
				"chess",
				"chanceId",
				101111
			},
			{
				"uiNameList",
				{
					"chessBoardChanceView"
				}
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[76] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 76,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {
			7601,
			7602,
			7603,
			7604
		},
		open_condition = {
			{
				"guide",
				75
			},
			{
				"chess",
				"canUseProp",
				true
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[77] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 77,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {
			7701,
			7702,
			7703,
			7704,
			7705,
			7706,
			7707,
			7708,
			7709,
			7710,
			7711,
			7712,
			7713,
			7714,
			7715,
			7716,
			7717
		},
		open_condition = {
			{
				"activityId",
				283181
			},
			{
				"uiNameList",
				{
					"activitySummerSimBusinessMain"
				}
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[78] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 78,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {
			7801,
			7802,
			7803,
			7804,
			7805,
			7806,
			7807,
			7808,
			7809,
			7810
		},
		open_condition = {
			{
				"activityId",
				283181
			},
			{
				"uiName",
				"activitySummerSimBusinessMain"
			},
			{
				"uiParam",
				"stageID",
				107
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[79] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 79,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {
			7901,
			7902,
			7903,
			7904,
			7905,
			7906,
			7907
		},
		open_condition = {
			{
				"activityId",
				283181
			},
			{
				"uiName",
				"activitySummerSimBusinessMain"
			},
			{
				"uiParam",
				"stageID",
				103
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[80] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 80,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {
			8001,
			8002,
			8003,
			8004,
			8005,
			8006
		},
		open_condition = {
			{
				"activityId",
				283181
			},
			{
				"uiName",
				"activitySummerSimBusinessMain"
			},
			{
				"uiParam",
				"stageID",
				106
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[81] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 81,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {
			8101,
			8102,
			8103,
			8104,
			8105
		},
		open_condition = {
			{
				"activityId",
				283181
			},
			{
				"uiName",
				"activitySummerSimBusinessMain"
			},
			{
				"uiParam",
				"stageID",
				108
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[82] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 82,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {
			8201,
			8202,
			8203,
			8204
		},
		open_condition = {
			{
				"activityId",
				293231
			},
			{
				"uiNameList",
				{
					"tetrisGameMainView"
				}
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[83] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 83,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {
			8301,
			8302,
			8303,
			8304
		},
		open_condition = {
			{
				"uiNameList",
				{
					"customStickerMain"
				}
			},
			{
				"selfSticker"
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[84] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 84,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {
			8401,
			8402,
			8403
		},
		open_condition = {
			{
				"idolCompetition"
			},
			{
				"uiNameList",
				{
					"idolCompetitionMain"
				}
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[85] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 85,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {
			8501,
			8502
		},
		open_condition = {
			{
				"uiNameList",
				{
					"idolCompetitionSign"
				}
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[90] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 90,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {
			9002,
			9003
		},
		open_condition = {
			{
				"playerLevel",
				35
			},
			{
				"notGuide",
				91
			},
			{
				"uiNameList",
				{
					"chapterMap"
				}
			}
		},
		skip_condition = {
			{
				"guide",
				91
			}
		},
		ignore_group_condition = {},
		leaps = {}
	},
	[91] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 91,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {
			9101,
			9102,
			9108
		},
		open_condition = {
			{
				"uiNameList",
				{
					"challengeRogueTeamEntrace"
				}
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[92] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 92,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {
			9201
		},
		open_condition = {
			{
				"uiNameList",
				{
					"challengeRogueTeamTreasureSelect"
				}
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[94] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 94,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {
			9401
		},
		open_condition = {
			{
				"uiNameList",
				{
					"challengeRogueTeamSuitSkill"
				}
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[95] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 95,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {
			9501
		},
		open_condition = {
			{
				"uiNameList",
				{
					"challengeRogueTeamTreasureSelect"
				}
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[96] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 96,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {
			9601,
			9603,
			9604
		},
		open_condition = {
			{
				"uiNameList",
				{
					"challengeRogueTeamTreasureSelect"
				}
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[97] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 97,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {
			9701
		},
		open_condition = {
			{
				"uiNameList",
				{
					"challengeRogueTeamTeamInfo"
				}
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[98] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 98,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {
			9801,
			9802
		},
		open_condition = {
			{
				"uiNameList",
				{
					"challengeRogueTeamEntrace"
				}
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[99] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 99,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {
			9901,
			9902,
			9903
		},
		open_condition = {
			{
				"uiNameList",
				{
					"equipCultureView"
				}
			},
			{
				"equip",
				"cultureEquipStar",
				4
			},
			{
				"equip",
				"equipLevel",
				30
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {
			{
				"enchantChangeView",
				3
			}
		}
	},
	[100] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 100,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {
			10001,
			10002,
			10003,
			10004,
			10005,
			10006,
			10007,
			10008,
			10009,
			10010,
			10011
		},
		open_condition = {
			{
				"activityId",
				293425
			},
			{
				"uiNameList",
				{
					"AreaBattleMapView"
				}
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[101] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 101,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {
			10101,
			10103,
			10104,
			10105
		},
		open_condition = {
			{
				"uiNameList",
				{
					"idolTraineeCamp"
				}
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[102] = {
		narrator_name = "弥弥尔",
		group = 2,
		not_skip_guide = 0,
		id = 102,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {
			10201,
			10202,
			10203
		},
		open_condition = {
			{
				"uiNameList",
				{
					"dormChooseRoomView"
				}
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[103] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 103,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {
			10301
		},
		open_condition = {
			{
				"uiNameList",
				{
					"dormIlluMainView"
				}
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[104] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 104,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {
			10401
		},
		open_condition = {
			{
				"uiNameList",
				{
					"dormInformationView"
				}
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[105] = {
		narrator_name = "禄良",
		group = 0,
		not_skip_guide = 0,
		id = 105,
		narrator_icon = "1072",
		is_no_home = false,
		steps = {
			10501,
			10502
		},
		open_condition = {
			{
				"qworldFunction",
				31146101
			},
			{
				"uiNameList",
				{
					"qworldMainHome"
				}
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[106] = {
		narrator_name = "孟章",
		group = 0,
		not_skip_guide = 0,
		id = 106,
		narrator_icon = "1071",
		is_no_home = false,
		steps = {
			10601,
			10602,
			10603
		},
		open_condition = {
			{
				"playerLevel",
				35
			},
			{
				"uiNameList",
				{
					"activityAutoCookMainView"
				}
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[107] = {
		narrator_name = "金乌",
		group = 0,
		not_skip_guide = 0,
		id = 107,
		narrator_icon = "1070",
		is_no_home = false,
		steps = {
			10701,
			10702
		},
		open_condition = {
			{
				"qworldFunction",
				31361101
			},
			{
				"uiNameList",
				{
					"qworldMainHome"
				}
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[108] = {
		narrator_name = "桌游店店长",
		group = 0,
		not_skip_guide = 0,
		id = 108,
		narrator_icon = "9508",
		is_no_home = false,
		steps = {
			10802,
			10803,
			10804,
			10805,
			10806,
			10807,
			10808,
			10809,
			10810,
			10811,
			10812,
			10813
		},
		open_condition = {
			{
				"playerLevel",
				35
			},
			{
				"uiNameList",
				{
					"bloodCardGame"
				}
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[109] = {
		narrator_name = "桌游店店长",
		group = 0,
		not_skip_guide = 0,
		id = 109,
		narrator_icon = "9508",
		is_no_home = false,
		steps = {
			10901,
			10902
		},
		open_condition = {
			{
				"playerLevel",
				35
			},
			{
				"uiNameList",
				{
					"bloodCardGame"
				}
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[110] = {
		narrator_name = "桌游店店长",
		group = 0,
		not_skip_guide = 1,
		id = 110,
		narrator_icon = "9508",
		is_no_home = false,
		steps = {
			11001,
			11002,
			11003,
			11004,
			11005,
			11006,
			11007
		},
		open_condition = {
			{
				"playerLevel",
				35
			},
			{
				"uiNameList",
				{
					"bloodCardBuild"
				}
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[111] = {
		narrator_name = "桌游店店长",
		group = 0,
		not_skip_guide = 0,
		id = 111,
		narrator_icon = "9508",
		is_no_home = false,
		steps = {
			11101
		},
		open_condition = {
			{
				"playerLevel",
				35
			},
			{
				"uiNameList",
				{
					"bloodCardGame"
				}
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[112] = {
		narrator_name = "桌游店店长",
		group = 0,
		not_skip_guide = 0,
		id = 112,
		narrator_icon = "9508",
		is_no_home = false,
		steps = {
			11201,
			11202
		},
		open_condition = {
			{
				"bloodCardFunction",
				1803
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[113] = {
		narrator_name = "桌游店店长",
		group = 0,
		not_skip_guide = 0,
		id = 113,
		narrator_icon = "9508",
		is_no_home = false,
		steps = {
			11301
		},
		open_condition = {
			{
				"bloodCardFunction",
				1805
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[115] = {
		narrator_name = "金乌",
		group = 0,
		not_skip_guide = 0,
		id = 115,
		narrator_icon = "1070",
		is_no_home = false,
		steps = {
			11501,
			11502
		},
		open_condition = {
			{
				"qworldFunction",
				31364103
			},
			{
				"uiNameList",
				{
					"qworldMainHome"
				}
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[116] = {
		narrator_name = "弥弥尔",
		group = 0,
		not_skip_guide = 0,
		id = 116,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {
			11601,
			11602
		},
		open_condition = {
			{
				"uiNameList",
				{
					"springFestivalZumaMainView"
				}
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	get_id_list_by_not_skip_guide = {
		[0] = {
			10,
			1001,
			11,
			1101,
			12,
			1201,
			13,
			1301,
			17,
			18,
			19,
			20,
			2001,
			21,
			22,
			2201,
			27,
			28,
			29,
			35,
			3501,
			36,
			3601,
			37,
			38,
			40,
			41,
			43,
			44,
			46,
			4601,
			47,
			48,
			49,
			50,
			51,
			52,
			53,
			54,
			55,
			56,
			57,
			59,
			61,
			62,
			63,
			64,
			65,
			66,
			6601,
			67,
			68,
			70,
			71,
			72,
			73,
			74,
			75,
			76,
			77,
			78,
			79,
			80,
			81,
			82,
			83,
			84,
			85,
			90,
			91,
			92,
			94,
			95,
			96,
			97,
			98,
			99,
			100,
			101,
			102,
			103,
			104,
			105,
			106,
			107,
			108,
			109,
			111,
			112,
			113,
			115,
			116
		},
		{
			1,
			2,
			4,
			5,
			3,
			6,
			8,
			60,
			110
		}
	},
	all = {
		1,
		2,
		4,
		5,
		3,
		6,
		8,
		10,
		1001,
		11,
		1101,
		12,
		1201,
		13,
		1301,
		17,
		18,
		19,
		20,
		2001,
		21,
		22,
		2201,
		27,
		28,
		29,
		35,
		3501,
		36,
		3601,
		37,
		38,
		40,
		41,
		43,
		44,
		46,
		4601,
		47,
		48,
		49,
		50,
		51,
		52,
		53,
		54,
		55,
		56,
		57,
		59,
		60,
		61,
		62,
		63,
		64,
		65,
		66,
		6601,
		67,
		68,
		70,
		71,
		72,
		73,
		74,
		75,
		76,
		77,
		78,
		79,
		80,
		81,
		82,
		83,
		84,
		85,
		90,
		91,
		92,
		94,
		95,
		96,
		97,
		98,
		99,
		100,
		101,
		102,
		103,
		104,
		105,
		106,
		107,
		108,
		109,
		110,
		111,
		112,
		113,
		115,
		116
	}
}
