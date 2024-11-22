return {
	[1001] = {
		closetime = 5,
		priority = 1,
		talk_adapt = 1,
		talk_anchors = 1,
		name = "home",
		narrator_icon = "mmr",
		id = 1001,
		talk_content = "新人，这是我们特意为你准备的欢迎仪式，希望你能再接再厉。",
		narrator_name = "弥弥尔",
		guide_component = {
			"buttonNewbie_"
		},
		mask_component = {},
		opencondition = {
			{
				"stage",
				1010005
			}
		},
		skipcondition = {
			{
				"stage",
				1010113
			}
		},
		talk_position = {
			568,
			-284
		}
	},
	[1002] = {
		closetime = 5,
		priority = 0,
		talk_adapt = 2,
		talk_anchors = 2,
		name = "home",
		narrator_icon = "mmr",
		id = 1002,
		talk_content = "弥弥观测站功能开放了。",
		narrator_name = "弥弥尔",
		guide_component = {
			"btn_menu"
		},
		mask_component = {},
		opencondition = {
			{
				"guide",
				17
			}
		},
		skipcondition = {
			{
				"stage",
				1010113
			}
		},
		talk_position = {
			-370,
			-280
		}
	},
	[1003] = {
		closetime = 5,
		priority = -1,
		talk_adapt = 2,
		talk_anchors = 3,
		name = "home",
		narrator_icon = "mmr",
		id = 1003,
		talk_content = "矩阵公会现已开放。",
		narrator_name = "弥弥尔",
		guide_component = {
			"btnGuild_"
		},
		mask_component = {},
		opencondition = {
			{
				"playerLevel",
				30
			}
		},
		skipcondition = {
			{
				"stage",
				1010613
			}
		},
		talk_position = {
			-600,
			240
		}
	},
	[1004] = {
		closetime = 5,
		priority = -2,
		talk_adapt = 2,
		talk_anchors = 2,
		name = "home",
		narrator_icon = "mmr",
		id = 1004,
		talk_content = "管理员，热门活动的参与入口已经开放了。",
		narrator_name = "弥弥尔",
		guide_component = {
			"@@activityEntraceView_",
			1
		},
		mask_component = {
			"guideComponents",
			"guide_activity"
		},
		opencondition = {
			{
				"playerLevel",
				30
			}
		},
		skipcondition = {
			{
				"stage",
				1010811
			}
		},
		talk_position = {
			-760,
			-330
		}
	},
	[1005] = {
		closetime = 5,
		priority = -3,
		talk_adapt = 1,
		talk_anchors = 1,
		name = "home",
		narrator_icon = "mmr",
		id = 1005,
		talk_content = "相信管理员现在已经对自己的基本职责非常熟悉了，那就让我们开启进修企划吧！",
		narrator_name = "弥弥尔",
		guide_component = {
			"btn_newbie_task"
		},
		mask_component = {},
		opencondition = {
			{
				"playerLevel",
				41
			}
		},
		skipcondition = {
			{
				"playerLevel",
				45
			}
		},
		talk_position = {
			568,
			-267
		}
	},
	[1101] = {
		closetime = 5,
		priority = 5,
		talk_adapt = 0,
		talk_anchors = 4,
		name = "chapterMap",
		narrator_icon = "mmr",
		id = 1101,
		talk_content = "「因子采集」玩法开放，技能升级所需物资获取权限已开启。",
		narrator_name = "弥弥尔",
		guide_component = {
			"toggleView_",
			2,
			"button_"
		},
		mask_component = {},
		opencondition = {
			{
				"stage",
				1010102
			}
		},
		skipcondition = {
			{
				"stage",
				1010310
			}
		},
		talk_position = {
			970,
			285
		}
	},
	[1102] = {
		closetime = 5,
		priority = 4,
		talk_adapt = 0,
		talk_anchors = 4,
		name = "chapterMap",
		narrator_icon = "mmr",
		id = 1102,
		talk_content = "「模拟作战」玩法开放，修正者升级所需物资获取权限已开启。",
		narrator_name = "弥弥尔",
		guide_component = {
			"toggleView_",
			2,
			"button_"
		},
		mask_component = {},
		opencondition = {
			{
				"stage",
				1010108
			}
		},
		skipcondition = {
			{
				"stage",
				1010310
			}
		},
		talk_position = {
			970,
			285
		}
	},
	[1103] = {
		closetime = 5,
		priority = 3,
		talk_adapt = 0,
		talk_anchors = 4,
		name = "chapterMap",
		narrator_icon = "mmr",
		id = 1103,
		talk_content = "「深层勘探」玩法开放，权钥升级所需物资获取权限已开启。",
		narrator_name = "弥弥尔",
		guide_component = {
			"toggleView_",
			2,
			"button_"
		},
		mask_component = {},
		opencondition = {
			{
				"stage",
				1010113
			}
		},
		skipcondition = {
			{
				"stage",
				1010310
			}
		},
		talk_position = {
			970,
			285
		}
	},
	[1104] = {
		closetime = 5,
		priority = 2,
		talk_adapt = 0,
		talk_anchors = 4,
		name = "chapterMap",
		narrator_icon = "mmr",
		id = 1104,
		talk_content = "「失落遗迹」玩法开放，修正者突破所需物资获取权限已开启。",
		narrator_name = "弥弥尔",
		guide_component = {
			"toggleView_",
			2,
			"button_"
		},
		mask_component = {},
		opencondition = {
			{
				"stage",
				1010204
			}
		},
		skipcondition = {
			{
				"stage",
				1010310
			}
		},
		talk_position = {
			970,
			285
		}
	},
	[1105] = {
		closetime = 5,
		priority = 1,
		talk_adapt = 0,
		talk_anchors = 4,
		name = "chapterMap",
		narrator_icon = "mmr",
		id = 1105,
		talk_content = "「极限萃取」、「酬金委托」玩法开放，全部物资获取权限已开启。",
		narrator_name = "弥弥尔",
		guide_component = {
			"toggleView_",
			2,
			"button_"
		},
		mask_component = {},
		opencondition = {
			{
				"stage",
				1010211
			}
		},
		skipcondition = {
			{
				"stage",
				1010310
			}
		},
		talk_position = {
			970,
			285
		}
	},
	[1201] = {
		closetime = 5,
		priority = 0,
		talk_adapt = 0,
		talk_anchors = 0,
		name = "newHero",
		narrator_icon = "mmr",
		id = 1201,
		talk_content = "「连携奥义动画」回看功能已经开放，管理员现在可以回看修正者们的连携奥义动画了。",
		narrator_name = "弥弥尔",
		guide_component = {
			"pages_",
			2,
			"buttonComboSkill_"
		},
		mask_component = {},
		opencondition = {
			{
				"uiName",
				"newHero"
			}
		},
		skipcondition = {
			{
				"uiName",
				"comboSkillInfo"
			}
		},
		talk_position = {
			80,
			125
		}
	},
	[1202] = {
		closetime = 5,
		priority = 0,
		talk_adapt = 0,
		talk_anchors = 8,
		name = "comboSkillInfo",
		narrator_icon = "mmr",
		id = 1202,
		talk_content = "管理员可以从此处查看修正者们的连携奥义动画。",
		narrator_name = "弥弥尔",
		guide_component = {
			"viewBtn_"
		},
		mask_component = {},
		opencondition = {
			{
				"uiName",
				"comboSkillInfo"
			}
		},
		skipcondition = {
			{
				"uiName",
				"HeroCooperationView"
			}
		},
		talk_position = {
			-50,
			100
		}
	},
	[1301] = {
		closetime = 5,
		priority = 0,
		talk_adapt = 0,
		talk_anchors = 3,
		name = "heroPreviewChange",
		narrator_icon = "mmr",
		id = 1301,
		talk_content = "「连携奥义动画」回看功能已经开放，管理员现在可以回看修正者们的连携奥义动画了。",
		narrator_name = "弥弥尔",
		guide_component = {
			"infoBtn_"
		},
		mask_component = {},
		opencondition = {
			{
				"uiName",
				"heroPreviewChange"
			}
		},
		skipcondition = {
			{
				"uiName",
				"heroPreviewMain"
			}
		},
		talk_position = {
			-380,
			220
		}
	},
	[1302] = {
		closetime = 5,
		priority = 0,
		talk_adapt = 0,
		talk_anchors = 2,
		name = "heroPreviewMain",
		narrator_icon = "mmr",
		id = 1302,
		talk_content = "管理员可以从此处查看修正者们的连携奥义动画。",
		narrator_name = "弥弥尔",
		guide_component = {
			"subPages_",
			1,
			"cooperationBtn_"
		},
		mask_component = {},
		opencondition = {
			{
				"uiName",
				"heroPreviewMain"
			}
		},
		skipcondition = {
			{
				"uiName",
				"HeroCooperationView"
			}
		},
		talk_position = {
			-650,
			-685
		}
	},
	[1401] = {
		closetime = 5,
		priority = 0,
		talk_adapt = 1,
		talk_anchors = 1,
		name = "home",
		narrator_icon = "mmr",
		id = 1401,
		talk_content = "管理员，贴纸系统已完成更新，快来看看吧。",
		narrator_name = "弥弥尔",
		guide_component = {
			"btn_message"
		},
		mask_component = {},
		opencondition = {
			{
				"uiName",
				"home"
			}
		},
		skipcondition = {
			{
				"uiName",
				"userinfo"
			}
		},
		talk_position = {
			410,
			-230
		}
	},
	[1402] = {
		closetime = 5,
		priority = 0,
		talk_adapt = 0,
		talk_anchors = 4,
		name = "userinfo",
		narrator_icon = "mmr",
		id = 1402,
		talk_content = "管理员，快来试试自由摆放的贴纸吧！",
		narrator_name = "弥弥尔",
		guide_component = {
			"illustratedStickerBtn_"
		},
		mask_component = {},
		opencondition = {
			{
				"uiName",
				"userinfo"
			}
		},
		skipcondition = {
			{
				"uiName",
				"customStickerMain"
			}
		},
		talk_position = {
			1371,
			125
		}
	},
	[1501] = {
		closetime = 5,
		priority = 0,
		talk_adapt = 1,
		talk_anchors = 5,
		name = "polyhedronLobby",
		narrator_icon = "mmr",
		id = 1501,
		talk_content = "演算终端机现已完成优化升级，提高了信息探索的效率，「维度偏移」的最高等级从40级调降至20级，可以获取的奖励总量不变。",
		narrator_name = "弥弥尔",
		guide_component = {
			"m_policyBtn"
		},
		mask_component = {},
		opencondition = {
			{
				"uiName",
				"polyhedronLobby"
			}
		},
		skipcondition = {
			{
				"uiName",
				"polyhedronPolicyReward"
			}
		},
		talk_position = {
			830,
			68
		}
	},
	[1502] = {
		closetime = 5,
		priority = 0,
		talk_adapt = 1,
		talk_anchors = 5,
		name = "polyhedronLobby",
		narrator_icon = "mmr",
		id = 1502,
		talk_content = "「维度曲线」的任务系统更新，将提供固有状态的任务，降低了整体任务处理流程的复杂度。",
		narrator_name = "弥弥尔",
		guide_component = {
			"m_taskBtn"
		},
		mask_component = {},
		opencondition = {
			{
				"uiName",
				"polyhedronLobby"
			}
		},
		skipcondition = {
			{
				"uiName",
				"polyhedronTask"
			}
		},
		talk_position = {
			776,
			-151
		}
	},
	[1601] = {
		closetime = 5,
		priority = 1,
		talk_adapt = 1,
		talk_anchors = 0,
		name = "tetrisGameStageView",
		narrator_icon = "mmr",
		id = 1601,
		talk_content = "点击这里也可以查看技能的效果",
		narrator_name = "弥弥尔",
		guide_component = {
			"guideComponents",
			"guide_mask"
		},
		mask_component = {},
		opencondition = {
			{
				"uiName",
				"tetrisGameStageView"
			}
		},
		skipcondition = {
			{
				"uiName",
				"tetrisGameScorePopView"
			}
		},
		talk_position = {
			-309,
			-326
		}
	},
	[1701] = {
		closetime = 5,
		priority = 1,
		talk_adapt = 0,
		talk_anchors = 0,
		name = "challengeRogueTeamSectionSelectHero",
		narrator_icon = "mmr",
		id = 1701,
		talk_content = "这里可以关闭队友特效",
		narrator_name = "弥弥尔",
		guide_component = {
			"conditionBtn_"
		},
		mask_component = {},
		opencondition = {
			{
				"uiName",
				"challengeRogueTeamSectionSelectHero"
			}
		},
		skipcondition = {},
		talk_position = {
			320,
			380
		}
	},
	get_id_list_by_name = {
		challengeRogueTeamSectionSelectHero = {
			1701
		},
		tetrisGameStageView = {
			1601
		},
		polyhedronLobby = {
			1501,
			1502
		},
		userinfo = {
			1402
		},
		heroPreviewMain = {
			1302
		},
		heroPreviewChange = {
			1301
		},
		comboSkillInfo = {
			1202
		},
		newHero = {
			1201
		},
		chapterMap = {
			1101,
			1102,
			1103,
			1104,
			1105
		},
		home = {
			1001,
			1002,
			1003,
			1004,
			1005,
			1401
		}
	},
	all = {
		1001,
		1002,
		1003,
		1004,
		1005,
		1101,
		1102,
		1103,
		1104,
		1105,
		1201,
		1202,
		1301,
		1302,
		1401,
		1402,
		1501,
		1502,
		1601,
		1701
	}
}
