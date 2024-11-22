return {
	[1001] = {
		name = "无限旋转",
		skill_id = 1001,
		desc = "点击待选区方块，使选中方块<color=#F48800>顺时针旋转90°</color>。",
		exclusion = {},
		unlock_stage_id = {
			2
		},
		params_1 = {},
		params_2 = {},
		Params_3 = {}
	},
	[1002] = {
		name = "更替重置",
		skill_id = 1002,
		desc = "每回合放置一个方块后，将<color=#F48800>直接进入下一个回合</color>。",
		exclusion = {},
		unlock_stage_id = {
			3
		},
		params_1 = {},
		params_2 = {},
		Params_3 = {}
	},
	[1003] = {
		name = "幸运回合",
		skill_id = 1003,
		desc = "每三个回合后，将生成<color=#F48800>单格及三格的特殊方块</color>，放置任一方块结束该回合。",
		exclusion = {},
		unlock_stage_id = {
			4
		},
		params_1 = {
			3
		},
		params_2 = {
			0,
			1,
			2
		},
		Params_3 = {}
	},
	[1004] = {
		name = "以时换率",
		skill_id = 1004,
		desc = "总时间减少<color=#F48800>50</color>秒，<color=#F48800>消除得分和放置得分</color>倍率大幅度增加。",
		exclusion = {},
		unlock_stage_id = {
			4
		},
		params_1 = {
			50,
			1
		},
		params_2 = {},
		Params_3 = {}
	},
	[1005] = {
		name = "厚积薄发",
		skill_id = 1005,
		desc = "每当方块放入盘面中且未触发消除时，将<color=#F48800>积累蓄力进度</color>；\n当触发消除时，将<color=#F48800>清空蓄力进度</color>，并按照蓄力进度倍率比例提升获得消除得分。",
		exclusion = {
			1006
		},
		unlock_stage_id = {
			5
		},
		params_1 = {
			{
				1,
				0
			},
			{
				2,
				1
			},
			{
				3,
				2
			},
			{
				4,
				3
			},
			{
				5,
				4
			},
			{
				6,
				5
			},
			{
				7,
				6
			}
		},
		params_2 = {},
		Params_3 = {
			6
		}
	},
	[1006] = {
		name = "连频整合",
		skill_id = 1006,
		desc = "每当触发消除时倍率增加，并将<color=#F48800>倒计时持续时间刷新至10秒</color>，倒计时结束后倍率恢复；\n当触发消除时，按照倍率比例提升获得消除得分。",
		exclusion = {
			1005
		},
		unlock_stage_id = {
			6
		},
		params_1 = {
			{
				1,
				0
			},
			{
				2,
				1
			},
			{
				3,
				2
			},
			{
				4,
				3
			},
			{
				5,
				4
			}
		},
		params_2 = {
			10
		},
		Params_3 = {
			10
		}
	},
	all = {
		1001,
		1002,
		1003,
		1004,
		1005,
		1006
	}
}
