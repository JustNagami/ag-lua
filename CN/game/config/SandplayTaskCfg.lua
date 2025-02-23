return {
	[101] = {
		task_blueprint_sign = 0,
		task_target = "前往与NPC1交谈",
		task_item = "",
		task_tag = "任务1",
		condition = 60,
		main_task_id = 101,
		need = 1,
		hide_task = 0,
		task_id = 101,
		pre_operation = 2,
		pre_task_id = {},
		additional_parameter = {}
	},
	[102] = {
		task_blueprint_sign = 0,
		task_target = "前往与NPC2交谈",
		task_item = "",
		task_tag = "任务2",
		condition = 60,
		main_task_id = 101,
		need = 1,
		hide_task = 0,
		task_id = 102,
		pre_operation = 2,
		pre_task_id = {
			101
		},
		additional_parameter = {}
	},
	[103] = {
		task_blueprint_sign = 0,
		task_target = "找到NPC2_1并跟随其前往指定地点",
		task_item = "",
		task_tag = "任务3",
		condition = 60,
		main_task_id = 101,
		need = 1,
		hide_task = 0,
		task_id = 103,
		pre_operation = 2,
		pre_task_id = {
			102
		},
		additional_parameter = {}
	},
	[104] = {
		task_blueprint_sign = 0,
		task_target = "找到NPC4交谈后生成走格子小游戏",
		task_item = "",
		task_tag = "任务4",
		condition = 60,
		main_task_id = 101,
		need = 1,
		hide_task = 0,
		task_id = 104,
		pre_operation = 2,
		pre_task_id = {
			103
		},
		additional_parameter = {}
	},
	[105] = {
		task_blueprint_sign = 0,
		task_target = "通过NPC3传送到指定区域",
		task_item = "",
		task_tag = "任务5",
		condition = 60,
		main_task_id = 101,
		need = 1,
		hide_task = 0,
		task_id = 105,
		pre_operation = 2,
		pre_task_id = {
			102
		},
		additional_parameter = {}
	},
	[106] = {
		task_blueprint_sign = 0,
		task_target = "找到NPC5聊聊，争取获得宝箱",
		task_item = "",
		task_tag = "任务6",
		condition = 60,
		main_task_id = 101,
		need = 1,
		hide_task = 0,
		task_id = 106,
		pre_operation = 2,
		pre_task_id = {
			105
		},
		additional_parameter = {}
	},
	[107] = {
		task_blueprint_sign = 0,
		task_target = "再次找到NPC4，验证任务完成后生成永久",
		task_item = "",
		task_tag = "任务7",
		condition = 60,
		main_task_id = 101,
		need = 1,
		hide_task = 0,
		task_id = 107,
		pre_operation = 2,
		pre_task_id = {
			104,
			106
		},
		additional_parameter = {}
	},
	[108] = {
		task_blueprint_sign = 0,
		task_target = "（可选）找NPC3谈话",
		task_item = "",
		task_tag = "任务8",
		condition = 60,
		main_task_id = 101,
		need = 1,
		hide_task = 0,
		task_id = 108,
		pre_operation = 2,
		pre_task_id = {
			107
		},
		additional_parameter = {}
	},
	[109] = {
		task_blueprint_sign = 0,
		task_target = "（必选）找NPC1谈话，任务结束后观察NPC3是否被销毁",
		task_item = "",
		task_tag = "任务9",
		condition = 60,
		main_task_id = 101,
		need = 1,
		hide_task = 0,
		task_id = 109,
		pre_operation = 2,
		pre_task_id = {
			107
		},
		additional_parameter = {}
	},
	[201] = {
		task_blueprint_sign = 0,
		task_target = "与宝箱交互后，移除宝箱，并发放任务奖励",
		task_item = "",
		task_tag = "",
		condition = 60,
		main_task_id = 201,
		need = 1,
		hide_task = 0,
		task_id = 201,
		pre_operation = 2,
		pre_task_id = {},
		additional_parameter = {}
	},
	[202] = {
		task_blueprint_sign = 0,
		task_target = "与宝箱交互后，移除宝箱，并发放任务奖励",
		task_item = "",
		task_tag = "",
		condition = 60,
		main_task_id = 202,
		need = 1,
		hide_task = 0,
		task_id = 202,
		pre_operation = 2,
		pre_task_id = {},
		additional_parameter = {}
	},
	[10101001] = {
		task_blueprint_sign = 0,
		task_target = "在附近转转",
		task_item = "",
		task_tag = "在附近转转",
		condition = 60,
		main_task_id = 10101,
		need = 1,
		hide_task = 0,
		task_id = 10101001,
		pre_operation = 2,
		pre_task_id = {},
		additional_parameter = {}
	},
	[10102001] = {
		task_blueprint_sign = 0,
		task_target = "不如找人问问路？",
		task_item = "",
		task_tag = "不如找人问问路？",
		condition = 60,
		main_task_id = 10102,
		need = 1,
		hide_task = 0,
		task_id = 10102001,
		pre_operation = 2,
		pre_task_id = {},
		additional_parameter = {}
	},
	[10102002] = {
		task_blueprint_sign = 1,
		task_target = "和熟人打个招呼",
		task_item = "",
		task_tag = "和熟人打个招呼",
		condition = 60,
		main_task_id = 10102,
		need = 1,
		hide_task = 0,
		task_id = 10102002,
		pre_operation = 2,
		pre_task_id = {
			10102001
		},
		additional_parameter = {}
	},
	[10103001] = {
		task_blueprint_sign = 1,
		task_target = "与英招对话",
		task_item = "",
		task_tag = "与英招对话",
		condition = 60,
		main_task_id = 10103,
		need = 1,
		hide_task = 0,
		task_id = 10103001,
		pre_operation = 2,
		pre_task_id = {},
		additional_parameter = {}
	},
	[10103002] = {
		task_blueprint_sign = 1,
		task_target = "跟随英招",
		task_item = "",
		task_tag = "跟随英招",
		condition = 60,
		main_task_id = 10103,
		need = 1,
		hide_task = 0,
		task_id = 10103002,
		pre_operation = 2,
		pre_task_id = {
			10103001
		},
		additional_parameter = {}
	},
	[10103003] = {
		task_blueprint_sign = 0,
		task_target = "关于师父的考验…",
		task_item = "",
		task_tag = "关于师父的考验…",
		condition = 60,
		main_task_id = 10103,
		need = 1,
		hide_task = 0,
		task_id = 10103003,
		pre_operation = 2,
		pre_task_id = {
			10103002
		},
		additional_parameter = {}
	},
	[10104001] = {
		task_blueprint_sign = 0,
		task_target = "购买笔记本",
		task_item = "",
		task_tag = "购买笔记本",
		condition = 60,
		main_task_id = 10104,
		need = 1,
		hide_task = 0,
		task_id = 10104001,
		pre_operation = 2,
		pre_task_id = {},
		additional_parameter = {}
	},
	[10104002] = {
		task_blueprint_sign = 0,
		task_target = "从柜台取得笔记本",
		task_item = "",
		task_tag = "从柜台取得笔记本",
		condition = 60,
		main_task_id = 10104,
		need = 1,
		hide_task = 0,
		task_id = 10104002,
		pre_operation = 2,
		pre_task_id = {
			10104001
		},
		additional_parameter = {}
	},
	[10105001] = {
		task_blueprint_sign = 0,
		task_target = "答应的帮忙不能忘",
		task_item = "",
		task_tag = "答应的帮忙不能忘",
		condition = 60,
		main_task_id = 10105,
		need = 1,
		hide_task = 0,
		task_id = 10105001,
		pre_operation = 2,
		pre_task_id = {},
		additional_parameter = {}
	},
	[10105002] = {
		task_blueprint_sign = 0,
		task_target = "收起孟章订的食材",
		task_item = "",
		task_tag = "收起孟章订的食材",
		condition = 60,
		main_task_id = 10105,
		need = 1,
		hide_task = 0,
		task_id = 10105002,
		pre_operation = 2,
		pre_task_id = {
			10105001
		},
		additional_parameter = {}
	},
	[10105003] = {
		task_blueprint_sign = 0,
		task_target = "返回寻找孟章",
		task_item = "",
		task_tag = "返回寻找孟章",
		condition = 60,
		main_task_id = 10105,
		need = 1,
		hide_task = 0,
		task_id = 10105003,
		pre_operation = 2,
		pre_task_id = {
			10105002
		},
		additional_parameter = {}
	},
	[10105004] = {
		task_blueprint_sign = 0,
		task_target = "打开地图查看",
		task_item = "",
		task_tag = "打开地图查看",
		condition = 60,
		main_task_id = 10116,
		need = 1,
		hide_task = 0,
		task_id = 10105004,
		pre_operation = 2,
		pre_task_id = {},
		additional_parameter = {}
	},
	[10106001] = {
		task_blueprint_sign = 0,
		task_target = "在「掌厨来也！」中满足6个菜肴需求",
		task_item = "",
		task_tag = "在「掌厨来也！」中满足6个菜肴需求",
		condition = 310103,
		main_task_id = 10106,
		need = 6,
		hide_task = 0,
		task_id = 10106001,
		pre_operation = 2,
		pre_task_id = {},
		additional_parameter = {}
	},
	[10107001] = {
		task_blueprint_sign = 2,
		task_target = "等待醒岁节来临",
		task_item = "",
		task_tag = "等待醒岁节来临",
		condition = 61,
		main_task_id = 10107,
		need = 1,
		hide_task = 0,
		task_id = 10107001,
		pre_operation = 2,
		pre_task_id = {},
		additional_parameter = {
			2025,
			1,
			29,
			0,
			0,
			0
		}
	},
	[10108001] = {
		task_blueprint_sign = 0,
		task_target = "禄良的消息",
		task_item = "",
		task_tag = "禄良的消息",
		condition = 60,
		main_task_id = 10108,
		need = 1,
		hide_task = 0,
		task_id = 10108001,
		pre_operation = 2,
		pre_task_id = {},
		additional_parameter = {}
	},
	[10108002] = {
		task_blueprint_sign = 0,
		task_target = "收下禄良的新年礼",
		task_item = "",
		task_tag = "收下禄良的新年礼",
		condition = 60,
		main_task_id = 10108,
		need = 1,
		hide_task = 0,
		task_id = 10108002,
		pre_operation = 2,
		pre_task_id = {
			10108001
		},
		additional_parameter = {}
	},
	[10108003] = {
		task_blueprint_sign = 0,
		task_target = "前往码头",
		task_item = "",
		task_tag = "前往码头",
		condition = 60,
		main_task_id = 10108,
		need = 1,
		hide_task = 0,
		task_id = 10108003,
		pre_operation = 2,
		pre_task_id = {
			10108002
		},
		additional_parameter = {}
	},
	[10108004] = {
		task_blueprint_sign = 0,
		task_target = "给师父甜品和修习心得",
		task_item = "",
		task_tag = "给师父甜品和修习心得",
		condition = 60,
		main_task_id = 10108,
		need = 1,
		hide_task = 0,
		task_id = 10108004,
		pre_operation = 2,
		pre_task_id = {
			10108003
		},
		additional_parameter = {}
	},
	[10108005] = {
		task_blueprint_sign = 0,
		task_target = "和师父的交流",
		task_item = "",
		task_tag = "和师父的交流",
		condition = 60,
		main_task_id = 10108,
		need = 1,
		hide_task = 0,
		task_id = 10108005,
		pre_operation = 2,
		pre_task_id = {
			10108004
		},
		additional_parameter = {}
	},
	[10108006] = {
		task_blueprint_sign = 0,
		task_target = "捡起修习记录",
		task_item = "",
		task_tag = "捡起修习记录",
		condition = 60,
		main_task_id = 10108,
		need = 1,
		hide_task = 0,
		task_id = 10108006,
		pre_operation = 2,
		pre_task_id = {
			10108005
		},
		additional_parameter = {}
	},
	[10109001] = {
		task_blueprint_sign = 0,
		task_target = "在「醒狮传说」中成功通关「研习Ⅴ」",
		task_item = "",
		task_tag = "在「醒狮传说」中成功通关「研习Ⅴ」",
		condition = 51202,
		main_task_id = 10109,
		need = 1,
		hide_task = 0,
		task_id = 10109001,
		pre_operation = 2,
		pre_task_id = {},
		additional_parameter = {
			4005
		}
	},
	[10110001] = {
		task_blueprint_sign = 0,
		task_target = "稍等数日",
		task_item = "",
		task_tag = "稍等数日",
		condition = 61,
		main_task_id = 10110,
		need = 1,
		hide_task = 0,
		task_id = 10110001,
		pre_operation = 2,
		pre_task_id = {},
		additional_parameter = {
			2025,
			2,
			20,
			7,
			0,
			0
		}
	},
	[10111001] = {
		task_blueprint_sign = 0,
		task_target = "在「泰府新秀」中答对20道题",
		task_item = "",
		task_tag = "在「泰府新秀」中答对20道题",
		condition = 18002,
		main_task_id = 10111,
		need = 20,
		hide_task = 0,
		task_id = 10111001,
		pre_operation = 2,
		pre_task_id = {},
		additional_parameter = {}
	},
	[10112001] = {
		task_blueprint_sign = 0,
		task_target = "在「《江胡》高手！」中通过4个不同关卡",
		task_item = "",
		task_tag = "在「《江胡》高手！」中通过4个不同关卡",
		condition = 54037,
		main_task_id = 10112,
		need = 4,
		hide_task = 0,
		task_id = 10112001,
		pre_operation = 2,
		pre_task_id = {},
		additional_parameter = {
			313431
		}
	},
	[10113001] = {
		task_blueprint_sign = 0,
		task_target = "在「香绣连珠」中达成9个关卡目标",
		task_item = "",
		task_tag = "在「香绣连珠」中达成9个关卡目标",
		condition = 170003,
		main_task_id = 10113,
		need = 9,
		hide_task = 0,
		task_id = 10113001,
		pre_operation = 2,
		pre_task_id = {},
		additional_parameter = {
			313531
		}
	},
	[10114001] = {
		task_blueprint_sign = 0,
		task_target = "在「浮光绎曲」中完成 Wordless Song for a Starry Night 普通难度1次",
		task_item = "",
		task_tag = "在「浮光绎曲」中完成 Wordless Song for a Starry Night 普通难度1次",
		condition = 50103,
		main_task_id = 10114,
		need = 1,
		hide_task = 0,
		task_id = 10114001,
		pre_operation = 2,
		pre_task_id = {},
		additional_parameter = {
			311491,
			1,
			5
		}
	},
	[10115001] = {
		task_blueprint_sign = 0,
		task_target = "隐藏任务，所有主线完成后播放剧情",
		task_item = "",
		task_tag = "",
		condition = 60,
		main_task_id = 10115,
		need = 1,
		hide_task = 0,
		task_id = 10115001,
		pre_operation = 2,
		pre_task_id = {},
		additional_parameter = {}
	},
	[10117001] = {
		task_blueprint_sign = 2,
		task_target = "隐藏任务，等待时间到大年初一早上5点完成",
		task_item = "",
		task_tag = "",
		condition = 61,
		main_task_id = 10117,
		need = 1,
		hide_task = 0,
		task_id = 10117001,
		pre_operation = 2,
		pre_task_id = {},
		additional_parameter = {
			2025,
			1,
			29,
			5,
			0,
			0
		}
	},
	[10118001] = {
		task_blueprint_sign = 2,
		task_target = "隐藏任务，等待时间到3.11版本上线早上7点完成",
		task_item = "",
		task_tag = "",
		condition = 61,
		main_task_id = 10118,
		need = 1,
		hide_task = 0,
		task_id = 10118001,
		pre_operation = 2,
		pre_task_id = {},
		additional_parameter = {
			2025,
			2,
			20,
			7,
			0,
			0
		}
	},
	[10302001] = {
		task_blueprint_sign = 0,
		task_target = "金宝箱任务01",
		task_item = "",
		task_tag = "",
		condition = 60,
		main_task_id = 10302,
		need = 1,
		hide_task = 0,
		task_id = 10302001,
		pre_operation = 2,
		pre_task_id = {},
		additional_parameter = {}
	},
	[10303001] = {
		task_blueprint_sign = 0,
		task_target = "金宝箱任务02",
		task_item = "",
		task_tag = "",
		condition = 60,
		main_task_id = 10303,
		need = 1,
		hide_task = 0,
		task_id = 10303001,
		pre_operation = 2,
		pre_task_id = {},
		additional_parameter = {}
	},
	[10304001] = {
		task_blueprint_sign = 0,
		task_target = "金宝箱任务03",
		task_item = "",
		task_tag = "",
		condition = 60,
		main_task_id = 10304,
		need = 1,
		hide_task = 0,
		task_id = 10304001,
		pre_operation = 2,
		pre_task_id = {},
		additional_parameter = {}
	},
	[10305001] = {
		task_blueprint_sign = 0,
		task_target = "金宝箱任务04",
		task_item = "",
		task_tag = "",
		condition = 60,
		main_task_id = 10305,
		need = 1,
		hide_task = 0,
		task_id = 10305001,
		pre_operation = 2,
		pre_task_id = {},
		additional_parameter = {}
	},
	[10306001] = {
		task_blueprint_sign = 0,
		task_target = "银宝箱任务01",
		task_item = "",
		task_tag = "",
		condition = 60,
		main_task_id = 10306,
		need = 1,
		hide_task = 0,
		task_id = 10306001,
		pre_operation = 2,
		pre_task_id = {},
		additional_parameter = {}
	},
	[10307001] = {
		task_blueprint_sign = 0,
		task_target = "银宝箱任务02",
		task_item = "",
		task_tag = "",
		condition = 60,
		main_task_id = 10307,
		need = 1,
		hide_task = 0,
		task_id = 10307001,
		pre_operation = 2,
		pre_task_id = {},
		additional_parameter = {}
	},
	[10308001] = {
		task_blueprint_sign = 0,
		task_target = "银宝箱任务03",
		task_item = "",
		task_tag = "",
		condition = 60,
		main_task_id = 10308,
		need = 1,
		hide_task = 0,
		task_id = 10308001,
		pre_operation = 2,
		pre_task_id = {},
		additional_parameter = {}
	},
	[10309001] = {
		task_blueprint_sign = 0,
		task_target = "银宝箱任务04",
		task_item = "",
		task_tag = "",
		condition = 60,
		main_task_id = 10309,
		need = 1,
		hide_task = 0,
		task_id = 10309001,
		pre_operation = 2,
		pre_task_id = {},
		additional_parameter = {}
	},
	[10310001] = {
		task_blueprint_sign = 0,
		task_target = "银宝箱任务05",
		task_item = "",
		task_tag = "",
		condition = 60,
		main_task_id = 10310,
		need = 1,
		hide_task = 0,
		task_id = 10310001,
		pre_operation = 2,
		pre_task_id = {},
		additional_parameter = {}
	},
	[10311001] = {
		task_blueprint_sign = 0,
		task_target = "银宝箱任务06",
		task_item = "",
		task_tag = "",
		condition = 60,
		main_task_id = 10311,
		need = 1,
		hide_task = 0,
		task_id = 10311001,
		pre_operation = 2,
		pre_task_id = {},
		additional_parameter = {}
	},
	[10312001] = {
		task_blueprint_sign = 0,
		task_target = "银宝箱任务07",
		task_item = "",
		task_tag = "",
		condition = 60,
		main_task_id = 10312,
		need = 1,
		hide_task = 0,
		task_id = 10312001,
		pre_operation = 2,
		pre_task_id = {},
		additional_parameter = {}
	},
	[10313001] = {
		task_blueprint_sign = 0,
		task_target = "银宝箱任务08",
		task_item = "",
		task_tag = "",
		condition = 60,
		main_task_id = 10313,
		need = 1,
		hide_task = 0,
		task_id = 10313001,
		pre_operation = 2,
		pre_task_id = {},
		additional_parameter = {}
	},
	[10314001] = {
		task_blueprint_sign = 0,
		task_target = "银宝箱任务09",
		task_item = "",
		task_tag = "",
		condition = 60,
		main_task_id = 10314,
		need = 1,
		hide_task = 0,
		task_id = 10314001,
		pre_operation = 2,
		pre_task_id = {},
		additional_parameter = {}
	},
	[10315001] = {
		task_blueprint_sign = 0,
		task_target = "银宝箱任务10",
		task_item = "",
		task_tag = "",
		condition = 60,
		main_task_id = 10315,
		need = 1,
		hide_task = 0,
		task_id = 10315001,
		pre_operation = 2,
		pre_task_id = {},
		additional_parameter = {}
	},
	[10320001] = {
		task_blueprint_sign = 0,
		task_target = "走格子任务01",
		task_item = "",
		task_tag = "",
		condition = 60,
		main_task_id = 10320,
		need = 1,
		hide_task = 0,
		task_id = 10320001,
		pre_operation = 2,
		pre_task_id = {},
		additional_parameter = {}
	},
	[10321001] = {
		task_blueprint_sign = 0,
		task_target = "走格子任务02",
		task_item = "",
		task_tag = "",
		condition = 60,
		main_task_id = 10321,
		need = 1,
		hide_task = 0,
		task_id = 10321001,
		pre_operation = 2,
		pre_task_id = {},
		additional_parameter = {}
	},
	[10322001] = {
		task_blueprint_sign = 0,
		task_target = "走格子任务03",
		task_item = "",
		task_tag = "",
		condition = 60,
		main_task_id = 10322,
		need = 1,
		hide_task = 0,
		task_id = 10322001,
		pre_operation = 2,
		pre_task_id = {},
		additional_parameter = {}
	},
	[10325001] = {
		task_blueprint_sign = 0,
		task_target = "图鉴-无名的信封",
		task_item = "",
		task_tag = "",
		condition = 60,
		main_task_id = 10325,
		need = 1,
		hide_task = 0,
		task_id = 10325001,
		pre_operation = 2,
		pre_task_id = {},
		additional_parameter = {}
	},
	[10326001] = {
		task_blueprint_sign = 0,
		task_target = "图鉴-凶兽出没注意！",
		task_item = "",
		task_tag = "",
		condition = 60,
		main_task_id = 10326,
		need = 1,
		hide_task = 0,
		task_id = 10326001,
		pre_operation = 2,
		pre_task_id = {},
		additional_parameter = {}
	},
	[10327001] = {
		task_blueprint_sign = 0,
		task_target = "图鉴-小书包",
		task_item = "",
		task_tag = "",
		condition = 60,
		main_task_id = 10327,
		need = 1,
		hide_task = 0,
		task_id = 10327001,
		pre_operation = 2,
		pre_task_id = {},
		additional_parameter = {}
	},
	[10328001] = {
		task_blueprint_sign = 0,
		task_target = "图鉴-掉落的许愿签",
		task_item = "",
		task_tag = "",
		condition = 60,
		main_task_id = 10328,
		need = 1,
		hide_task = 0,
		task_id = 10328001,
		pre_operation = 2,
		pre_task_id = {},
		additional_parameter = {}
	},
	[10329001] = {
		task_blueprint_sign = 0,
		task_target = "图鉴-一袋成衣",
		task_item = "",
		task_tag = "",
		condition = 60,
		main_task_id = 10329,
		need = 1,
		hide_task = 0,
		task_id = 10329001,
		pre_operation = 2,
		pre_task_id = {},
		additional_parameter = {}
	},
	[10330001] = {
		task_blueprint_sign = 0,
		task_target = "图鉴-新泰旧史",
		task_item = "",
		task_tag = "",
		condition = 60,
		main_task_id = 10330,
		need = 1,
		hide_task = 0,
		task_id = 10330001,
		pre_operation = 2,
		pre_task_id = {},
		additional_parameter = {}
	},
	[10331001] = {
		task_blueprint_sign = 0,
		task_target = "图鉴-金乌降魔传",
		task_item = "",
		task_tag = "",
		condition = 60,
		main_task_id = 10331,
		need = 1,
		hide_task = 0,
		task_id = 10331001,
		pre_operation = 2,
		pre_task_id = {},
		additional_parameter = {}
	},
	[10332001] = {
		task_blueprint_sign = 0,
		task_target = "图鉴-桌游高手",
		task_item = "",
		task_tag = "",
		condition = 60,
		main_task_id = 10332,
		need = 1,
		hide_task = 0,
		task_id = 10332001,
		pre_operation = 2,
		pre_task_id = {},
		additional_parameter = {}
	},
	[10333001] = {
		task_blueprint_sign = 0,
		task_target = "图鉴-天禄明珠",
		task_item = "",
		task_tag = "",
		condition = 60,
		main_task_id = 10333,
		need = 1,
		hide_task = 0,
		task_id = 10333001,
		pre_operation = 2,
		pre_task_id = {},
		additional_parameter = {}
	},
	[10334001] = {
		task_blueprint_sign = 0,
		task_target = "图鉴-神秘的机关",
		task_item = "",
		task_tag = "",
		condition = 60,
		main_task_id = 10334,
		need = 1,
		hide_task = 0,
		task_id = 10334001,
		pre_operation = 2,
		pre_task_id = {},
		additional_parameter = {}
	},
	[10345001] = {
		task_blueprint_sign = 0,
		task_target = "听听禄良的请求",
		task_item = "",
		task_tag = "暗度陈仓？！",
		condition = 60,
		main_task_id = 10345,
		need = 1,
		hide_task = 0,
		task_id = 10345001,
		pre_operation = 2,
		pre_task_id = {},
		additional_parameter = {}
	},
	[10345002] = {
		task_blueprint_sign = 0,
		task_target = "找个好地方藏东西",
		task_item = "",
		task_tag = "找个好地方藏东西",
		condition = 60,
		main_task_id = 10345,
		need = 1,
		hide_task = 0,
		task_id = 10345002,
		pre_operation = 2,
		pre_task_id = {
			10345001
		},
		additional_parameter = {}
	},
	[10345003] = {
		task_blueprint_sign = 0,
		task_target = "听听禄良怎么说",
		task_item = "",
		task_tag = "东西藏好了",
		condition = 60,
		main_task_id = 10345,
		need = 1,
		hide_task = 0,
		task_id = 10345003,
		pre_operation = 2,
		pre_task_id = {
			10345002
		},
		additional_parameter = {}
	},
	[10346001] = {
		task_blueprint_sign = 0,
		task_target = "询问禄良为何苦恼",
		task_item = "",
		task_tag = "寻找订单",
		condition = 60,
		main_task_id = 10346,
		need = 1,
		hide_task = 0,
		task_id = 10346001,
		pre_operation = 2,
		pre_task_id = {},
		additional_parameter = {}
	},
	[10346002] = {
		task_blueprint_sign = 0,
		task_target = "寻找这批货的订单",
		task_item = "",
		task_tag = "寻找这批货的订单",
		condition = 60,
		main_task_id = 10346,
		need = 1,
		hide_task = 0,
		task_id = 10346002,
		pre_operation = 2,
		pre_task_id = {
			10346001
		},
		additional_parameter = {}
	},
	[10346003] = {
		task_blueprint_sign = 0,
		task_target = "寻找禄良提交订单",
		task_item = "",
		task_tag = "提交订单",
		condition = 60,
		main_task_id = 10346,
		need = 1,
		hide_task = 0,
		task_id = 10346003,
		pre_operation = 2,
		pre_task_id = {
			10346002
		},
		additional_parameter = {}
	},
	[10347001] = {
		task_blueprint_sign = 0,
		task_target = "听听禄良的打算",
		task_item = "",
		task_tag = "小风车，呼呼呼",
		condition = 60,
		main_task_id = 10347,
		need = 1,
		hide_task = 0,
		task_id = 10347001,
		pre_operation = 2,
		pre_task_id = {},
		additional_parameter = {}
	},
	[10347002] = {
		task_blueprint_sign = 0,
		task_target = "寻找风车",
		task_item = "",
		task_tag = "寻找风车",
		condition = 60,
		main_task_id = 10347,
		need = 1,
		hide_task = 0,
		task_id = 10347002,
		pre_operation = 2,
		pre_task_id = {
			10347001
		},
		additional_parameter = {}
	},
	[10347003] = {
		task_blueprint_sign = 0,
		task_target = "将风车给禄良",
		task_item = "",
		task_tag = "交还风车",
		condition = 60,
		main_task_id = 10347,
		need = 1,
		hide_task = 0,
		task_id = 10347003,
		pre_operation = 2,
		pre_task_id = {
			10347002
		},
		additional_parameter = {}
	},
	[10348001] = {
		task_blueprint_sign = 0,
		task_target = "问问禄良怎么了",
		task_item = "",
		task_tag = "吹走的福签",
		condition = 60,
		main_task_id = 10348,
		need = 1,
		hide_task = 0,
		task_id = 10348001,
		pre_operation = 2,
		pre_task_id = {},
		additional_parameter = {}
	},
	[10348002] = {
		task_blueprint_sign = 0,
		task_target = "找到被风吹走的福签",
		task_item = "",
		task_tag = "寻找福签",
		condition = 60,
		main_task_id = 10348,
		need = 1,
		hide_task = 0,
		task_id = 10348002,
		pre_operation = 2,
		pre_task_id = {
			10348001
		},
		additional_parameter = {}
	},
	[10348003] = {
		task_blueprint_sign = 0,
		task_target = "将福签交给禄良",
		task_item = "",
		task_tag = "交还",
		condition = 60,
		main_task_id = 10348,
		need = 1,
		hide_task = 0,
		task_id = 10348003,
		pre_operation = 2,
		pre_task_id = {
			10348002
		},
		additional_parameter = {}
	},
	[10350001] = {
		task_blueprint_sign = 0,
		task_target = "孟章-餐馆经营",
		task_item = "",
		task_tag = "孟章-餐馆经营",
		condition = 60,
		main_task_id = 10350,
		need = 1,
		hide_task = 1,
		task_id = 10350001,
		pre_operation = 2,
		pre_task_id = {},
		additional_parameter = {}
	},
	[10352001] = {
		task_blueprint_sign = 0,
		task_target = "红毛-打牌",
		task_item = "",
		task_tag = "红毛-打牌",
		condition = 60,
		main_task_id = 10352,
		need = 1,
		hide_task = 1,
		task_id = 10352001,
		pre_operation = 2,
		pre_task_id = {},
		additional_parameter = {}
	},
	[10353001] = {
		task_blueprint_sign = 0,
		task_target = "老马-打牌1",
		task_item = "",
		task_tag = "老马-打牌1",
		condition = 60,
		main_task_id = 10353,
		need = 1,
		hide_task = 1,
		task_id = 10353001,
		pre_operation = 2,
		pre_task_id = {},
		additional_parameter = {}
	},
	[10354001] = {
		task_blueprint_sign = 0,
		task_target = "巴丝特-打牌2",
		task_item = "",
		task_tag = "巴丝特-打牌2",
		condition = 60,
		main_task_id = 10354,
		need = 1,
		hide_task = 1,
		task_id = 10354001,
		pre_operation = 2,
		pre_task_id = {},
		additional_parameter = {}
	},
	[10355001] = {
		task_blueprint_sign = 0,
		task_target = "暗御津羽-打牌3",
		task_item = "",
		task_tag = "暗御津羽-打牌3",
		condition = 60,
		main_task_id = 10355,
		need = 1,
		hide_task = 1,
		task_id = 10355001,
		pre_operation = 2,
		pre_task_id = {},
		additional_parameter = {}
	},
	[10356001] = {
		task_blueprint_sign = 0,
		task_target = "庚辰-打牌4",
		task_item = "",
		task_tag = "庚辰-打牌4",
		condition = 60,
		main_task_id = 10356,
		need = 1,
		hide_task = 1,
		task_id = 10356001,
		pre_operation = 2,
		pre_task_id = {},
		additional_parameter = {}
	},
	[10357001] = {
		task_blueprint_sign = 0,
		task_target = "英招-贪吃蛇",
		task_item = "",
		task_tag = "英招-贪吃蛇",
		condition = 60,
		main_task_id = 10357,
		need = 1,
		hide_task = 1,
		task_id = 10357001,
		pre_operation = 2,
		pre_task_id = {},
		additional_parameter = {}
	},
	[10358001] = {
		task_blueprint_sign = 0,
		task_target = "陵光-音游",
		task_item = "",
		task_tag = "陵光-音游",
		condition = 60,
		main_task_id = 10358,
		need = 1,
		hide_task = 1,
		task_id = 10358001,
		pre_operation = 2,
		pre_task_id = {},
		additional_parameter = {}
	},
	[10359001] = {
		task_blueprint_sign = 0,
		task_target = "阿修罗-答题",
		task_item = "",
		task_tag = "阿修罗-答题",
		condition = 60,
		main_task_id = 10359,
		need = 1,
		hide_task = 1,
		task_id = 10359001,
		pre_operation = 2,
		pre_task_id = {},
		additional_parameter = {}
	},
	[10360001] = {
		task_blueprint_sign = 0,
		task_target = "陆吾-祖玛",
		task_item = "",
		task_tag = "陆吾-祖玛",
		condition = 60,
		main_task_id = 10360,
		need = 1,
		hide_task = 1,
		task_id = 10360001,
		pre_operation = 2,
		pre_task_id = {},
		additional_parameter = {}
	},
	[10361001] = {
		task_blueprint_sign = 0,
		task_target = "",
		task_item = "",
		task_tag = "",
		condition = 60,
		main_task_id = 10361,
		need = 1,
		hide_task = 1,
		task_id = 10361001,
		pre_operation = 2,
		pre_task_id = {},
		additional_parameter = {}
	},
	[10362001] = {
		task_blueprint_sign = 0,
		task_target = "",
		task_item = "",
		task_tag = "",
		condition = 60,
		main_task_id = 10362,
		need = 1,
		hide_task = 1,
		task_id = 10362001,
		pre_operation = 2,
		pre_task_id = {},
		additional_parameter = {}
	},
	[10401001] = {
		task_blueprint_sign = 2,
		task_target = "",
		task_item = "",
		task_tag = "",
		condition = 54038,
		main_task_id = 10401,
		need = 1,
		hide_task = 1,
		task_id = 10401001,
		pre_operation = 2,
		pre_task_id = {},
		additional_parameter = {
			102
		}
	},
	[10402001] = {
		task_blueprint_sign = 2,
		task_target = "",
		task_item = "",
		task_tag = "",
		condition = 54038,
		main_task_id = 10402,
		need = 1,
		hide_task = 1,
		task_id = 10402001,
		pre_operation = 2,
		pre_task_id = {},
		additional_parameter = {
			112
		}
	},
	[10403001] = {
		task_blueprint_sign = 2,
		task_target = "",
		task_item = "",
		task_tag = "",
		condition = 54038,
		main_task_id = 10403,
		need = 1,
		hide_task = 1,
		task_id = 10403001,
		pre_operation = 2,
		pre_task_id = {},
		additional_parameter = {
			114
		}
	},
	[10404001] = {
		task_blueprint_sign = 2,
		task_target = "",
		task_item = "",
		task_tag = "",
		condition = 54038,
		main_task_id = 10404,
		need = 1,
		hide_task = 1,
		task_id = 10404001,
		pre_operation = 2,
		pre_task_id = {},
		additional_parameter = {
			124
		}
	},
	get_id_list_by_main_task_id = {
		[10404] = {
			10404001
		},
		[10403] = {
			10403001
		},
		[10402] = {
			10402001
		},
		[10401] = {
			10401001
		},
		[10362] = {
			10362001
		},
		[10361] = {
			10361001
		},
		[10360] = {
			10360001
		},
		[10359] = {
			10359001
		},
		[10358] = {
			10358001
		},
		[10357] = {
			10357001
		},
		[10356] = {
			10356001
		},
		[10355] = {
			10355001
		},
		[10354] = {
			10354001
		},
		[10353] = {
			10353001
		},
		[10352] = {
			10352001
		},
		[10350] = {
			10350001
		},
		[10348] = {
			10348001,
			10348002,
			10348003
		},
		[10347] = {
			10347001,
			10347002,
			10347003
		},
		[10346] = {
			10346001,
			10346002,
			10346003
		},
		[10345] = {
			10345001,
			10345002,
			10345003
		},
		[10334] = {
			10334001
		},
		[10333] = {
			10333001
		},
		[10332] = {
			10332001
		},
		[10331] = {
			10331001
		},
		[10330] = {
			10330001
		},
		[10329] = {
			10329001
		},
		[10328] = {
			10328001
		},
		[10327] = {
			10327001
		},
		[10326] = {
			10326001
		},
		[10325] = {
			10325001
		},
		[10322] = {
			10322001
		},
		[10321] = {
			10321001
		},
		[10320] = {
			10320001
		},
		[10315] = {
			10315001
		},
		[10314] = {
			10314001
		},
		[10313] = {
			10313001
		},
		[10312] = {
			10312001
		},
		[10311] = {
			10311001
		},
		[10310] = {
			10310001
		},
		[10309] = {
			10309001
		},
		[10308] = {
			10308001
		},
		[10307] = {
			10307001
		},
		[10306] = {
			10306001
		},
		[10305] = {
			10305001
		},
		[10304] = {
			10304001
		},
		[10303] = {
			10303001
		},
		[10302] = {
			10302001
		},
		[10118] = {
			10118001
		},
		[10117] = {
			10117001
		},
		[10115] = {
			10115001
		},
		[10114] = {
			10114001
		},
		[10113] = {
			10113001
		},
		[10112] = {
			10112001
		},
		[10111] = {
			10111001
		},
		[10110] = {
			10110001
		},
		[10109] = {
			10109001
		},
		[10108] = {
			10108001,
			10108002,
			10108003,
			10108004,
			10108005,
			10108006
		},
		[10107] = {
			10107001
		},
		[10106] = {
			10106001
		},
		[10116] = {
			10105004
		},
		[10105] = {
			10105001,
			10105002,
			10105003
		},
		[10104] = {
			10104001,
			10104002
		},
		[10103] = {
			10103001,
			10103002,
			10103003
		},
		[10102] = {
			10102001,
			10102002
		},
		[10101] = {
			10101001
		},
		[202] = {
			202
		},
		[201] = {
			201
		},
		[101] = {
			101,
			102,
			103,
			104,
			105,
			106,
			107,
			108,
			109
		}
	},
	all = {
		101,
		102,
		103,
		104,
		105,
		106,
		107,
		108,
		109,
		201,
		202,
		10101001,
		10102001,
		10102002,
		10103001,
		10103002,
		10103003,
		10104001,
		10104002,
		10105001,
		10105002,
		10105003,
		10105004,
		10106001,
		10107001,
		10108001,
		10108002,
		10108003,
		10108004,
		10108005,
		10108006,
		10109001,
		10110001,
		10111001,
		10112001,
		10113001,
		10114001,
		10115001,
		10117001,
		10118001,
		10302001,
		10303001,
		10304001,
		10305001,
		10306001,
		10307001,
		10308001,
		10309001,
		10310001,
		10311001,
		10312001,
		10313001,
		10314001,
		10315001,
		10320001,
		10321001,
		10322001,
		10325001,
		10326001,
		10327001,
		10328001,
		10329001,
		10330001,
		10331001,
		10332001,
		10333001,
		10334001,
		10345001,
		10345002,
		10345003,
		10346001,
		10346002,
		10346003,
		10347001,
		10347002,
		10347003,
		10348001,
		10348002,
		10348003,
		10350001,
		10352001,
		10353001,
		10354001,
		10355001,
		10356001,
		10357001,
		10358001,
		10359001,
		10360001,
		10361001,
		10362001,
		10401001,
		10402001,
		10403001,
		10404001
	}
}
