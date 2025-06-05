return {
	{
		narrator_name = "a96a13e9545a28bd734fe0a6a9eced6c",
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
		narrator_name = "9f23bad20d94796eaaadfdd7eae961cc",
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
		narrator_name = "346acf599575bb3eb5854f6e8f943142",
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
		narrator_name = "abec053a4b0b0b02082891cce144eff5",
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
		narrator_name = "eed88435a61807353416bb326b9002c8",
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
		narrator_name = "8478ef70b3d38836e77a2c51b6dd9a93",
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
		narrator_name = "6bb438320e68f02df9f615f2b3a4624c",
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
		narrator_name = "4cb301ae0e6d83b03717a621d491d145",
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
		narrator_name = "fc276fb5d9545b83416041a1c2fa4271",
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
		narrator_name = "7a95286d1a9f382b180e764765983ff9",
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
		narrator_name = "124f334a4ea2c8888cac8efd2a55ed35",
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
		narrator_name = "fde4a74606ef1d0ec9cd3e6ea96d0402",
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
		narrator_name = "ce45d35b14d9132ac7e865bacb4c8986",
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
		narrator_name = "c4ef6873229f8f0d55ce15e6d16cd4e5",
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
		narrator_name = "fff0296c70fbb4d1180a667788d395ff",
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
		narrator_name = "4b416240d8a3a3622a4baebe7edf426e",
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
		narrator_name = "8997c906c082594c7c90f47ebe118183",
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
		narrator_name = "4ec3285f0d30ce4afa4f4bb46809ab3a",
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
		narrator_name = "295621493f0a04ab2d06a42553163879",
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
		narrator_name = "ea51010004310cc1e81fcf7603470e7a",
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
		narrator_name = "2ab71967ca0dc60b1d188c5a773c9ba7",
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
		narrator_name = "81fea7abf3a5a9d579f4d672acb00bce",
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
		narrator_name = "058841bcbe6c020dd607d56d56b9de54",
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
		narrator_name = "edcdb5be6ac016c85cc67d1d2010afbe",
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
		narrator_name = "6a3984ac917fdbf651f0294fdd096115",
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
		narrator_name = "0e09c71e3f1258b2290cecfee4e82440",
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
		narrator_name = "229bc7ceeea7756acb2e1be8cc11dc05",
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
		narrator_name = "bcc8eeda2a34e01a708a3d3362cb425a",
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
		narrator_name = "46690e71abbb6781206669ae8e3d93e3",
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
		narrator_name = "b5257314c61310a251c2d4b2c5201a9e",
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
		narrator_name = "b58db3b3d8e03c4e94a6d15af0dc074c",
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
		narrator_name = "07117ee1052de85e1fc91487b4d048d1",
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
		narrator_name = "cd7b7905798fb780a6f1887a29cbe424",
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
		narrator_name = "f5c7ef325743d85fcd8e8090b4a87c4f",
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
		narrator_name = "a6ac7dc265ac6ee32c2fa1a45751c1fc",
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
	[46] = {
		narrator_name = "c71250b482fec95aaf990af33e742bfe",
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
		narrator_name = "986bc23ae938dc20e6f75f3f4ad4739f",
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
		narrator_name = "44a872f9db0e42cde06d7c0e16bc827c",
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
		narrator_name = "0bad412dab2c2a9117961c2746dd516f",
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
		narrator_name = "49762af15a3ab8dfe96920e6b457c663",
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
		narrator_name = "4d056a35f52c6202e6afbc0850c57ed0",
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
		narrator_name = "e866344390d985dcb9c9321417a3d6a6",
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
		narrator_name = "38e03319ceee826c036af87f909c2cfe",
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
		narrator_name = "fc5b12a9d6c1f88c96dfe1d9b840f8d0",
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
		narrator_name = "eb630d96120d5d784f786cef332c9308",
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
		narrator_name = "bf188e97b47d1485895aabc143879a55",
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
		narrator_name = "ff8f35db9c8ffe3eaa35e153e708e089",
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
		narrator_name = "532385b8725adab357cf08b6f740a026",
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
		narrator_name = "4729b8604b51c325939cc5cf356c0eb4",
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
		narrator_name = "32f4e3faabf74d91f06369cd1baa1628",
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
		narrator_name = "0080473cd5e9cd7b95390e3730af987c",
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
		narrator_name = "c0fe917105dfb867b013e3981b8a3c1f",
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
		narrator_name = "c46e6a0f320d002da627fb5271a9fc68",
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
		narrator_name = "1dfb82aff9510e75df068a714e87b13c",
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
		narrator_name = "2bcc3a2ca6f072474090f7177566729a",
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
		narrator_name = "5296b1a05d7f9d042421c2a7e5629a50",
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
		narrator_name = "3ef3849b600f541fef8068c543f150e1",
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
		narrator_name = "a0d302c798be8591e9b9e0cd87f90c82",
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
		narrator_name = "25a66e7560d0c77668dbf9a39e8cc63a",
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
		narrator_name = "840b03049361f5dccf23012d75711fe8",
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
		narrator_name = "d81102757cb7ac18312d2ed73aab1984",
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
		narrator_name = "2e31fcd2af2aa7b3e980501eda6b589f",
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
		narrator_name = "ca339bc326a25c0741072bf41a8f838d",
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
		narrator_name = "bd8b1635f95b85fb71d96e3d3f8fe8f6",
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
		narrator_name = "9b074c0af8a77624763e2ba96c5cd06b",
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
		narrator_name = "b70e8c99ce6841bd99b17504a3a77429",
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
		narrator_name = "a17a41ed950637843ef0d5ac325ce77a",
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
		narrator_name = "6388f2f04194c5330233ea383a45fd3c",
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
		narrator_name = "cfe57ef46dee7f5cb05f8a86e8566dab",
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
		narrator_name = "0a3f29c6299d0684c8f707afd34b4002",
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
		narrator_name = "22d5fb6c7b3de80b50b8ae6fb440f5bf",
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
		narrator_name = "1dede2d9afb037f18b1675f7fd634237",
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
		narrator_name = "6b2fac1f6d97eec287babab72fe656ab",
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
		narrator_name = "b2ff9a1893ebada68f69652ead0f2638",
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
		narrator_name = "3afd35919c05f2e16f2c309926fe9749",
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
		narrator_name = "365a4872b04ac826f8ec2eeafabbde7f",
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
		narrator_name = "4fd06c77d972e0b2c6dcfc0c9623e1c8",
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
		narrator_name = "d921e34ab397014f6121552a765761ab",
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
		narrator_name = "9dba3bcdf0d3cbc9b5b88d6caaf3d148",
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
		narrator_name = "d537eb5d71134c88979a38755e7ec282",
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
		narrator_name = "6d4ababcd63701b5fc165078a45e2792",
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
		narrator_name = "34a68e7a5c43ebb5635e8dbf9a626cbc",
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
		narrator_name = "760d2777665638c972cce2157ff0c8ac",
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
		narrator_name = "4c3085da2b1706bcd0f21132c5d45d24",
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
		narrator_name = "5e697389a048cfa69a7ecfa909736bfe",
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
	[102] = {
		narrator_name = "ba2b75fd4574bc9a8dae78acae38194d",
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
		narrator_name = "8c4d1d11e9658b6db337e81744114df4",
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
		narrator_name = "ecbafb1612d69e7882bd62644bbae1c4",
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
	[121] = {
		narrator_name = "0c6aa4161545d8aaf43d5aa3ffc6a99d",
		group = 0,
		not_skip_guide = 0,
		id = 121,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {
			12101,
			12102,
			12103,
			12104,
			12105,
			12106,
			12107
		},
		open_condition = {
			{
				"uiNameList",
				{
					"ActivityGodEaterGameMainView"
				}
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[122] = {
		narrator_name = "e963d1ad966e236dbd80e79c868271ae",
		group = 0,
		not_skip_guide = 0,
		id = 122,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {
			12201,
			12202
		},
		open_condition = {
			{
				"uiNameList",
				{
					"goldMinerSelectLevelView"
				}
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[123] = {
		narrator_name = "8c4d4e8b48f4eebc4a0e777320274ea0",
		group = 0,
		not_skip_guide = 0,
		id = 123,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {
			12301,
			12302,
			12303,
			12305,
			12306,
			12307,
			12310,
			12311,
			12312,
			12313,
			12314,
			12315,
			12316,
			12318,
			12319,
			12320,
			12321,
			12322,
			12323,
			12324
		},
		open_condition = {
			{
				"uiNameList",
				{
					"civilizationGameMainView"
				}
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[124] = {
		narrator_name = "a08ed4b5f5d6d5f16ac3af6d22902d45",
		group = 0,
		not_skip_guide = 0,
		id = 124,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {
			12401,
			12402,
			12403,
			12404,
			12405
		},
		open_condition = {
			{
				"goldMiner",
				343701
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[125] = {
		narrator_name = "d1f4c26c5f011dc514056fb163f520e5",
		group = 0,
		not_skip_guide = 0,
		id = 125,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {
			12501,
			12502
		},
		open_condition = {
			{
				"goldMiner",
				343706
			}
		},
		skip_condition = {},
		ignore_group_condition = {},
		leaps = {}
	},
	[126] = {
		narrator_name = "998853c6b28a420e46abc91cc9c9d59d",
		group = 0,
		not_skip_guide = 0,
		id = 126,
		narrator_icon = "mmr",
		is_no_home = false,
		steps = {
			12601,
			12602,
			12603,
			12604,
			12605,
			12606,
			12607,
			12608,
			12609
		},
		open_condition = {
			{
				"civilizationGame",
				2
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
			102,
			103,
			104,
			121,
			122,
			123,
			124,
			125,
			126
		},
		{
			1,
			2,
			4,
			5,
			3,
			6,
			8,
			60
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
		102,
		103,
		104,
		121,
		122,
		123,
		124,
		125,
		126
	}
}
