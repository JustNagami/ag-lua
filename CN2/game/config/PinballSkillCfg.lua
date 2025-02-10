return {
	[30901] = {
		cost = 150,
		action = "drink01_female",
		effect_type = 4,
		cd = 1,
		description = "下次发射弹珠时，弹珠首次返回至地面后会再次弹出。",
		special_effects = "skill",
		id = 30901,
		icon = "TextureConfig/VersionUI/BaichaoUI_3_9/BaichaoUI_3_9_Pinball/Skill/skill1",
		effect = {
			2,
			1
		}
	},
	[30902] = {
		cost = 150,
		action = "drink01_female",
		effect_type = 14,
		cd = 1,
		description = "下次发射弹珠时，增加5个弹珠发射数量。",
		special_effects = "skill",
		id = 30902,
		icon = "TextureConfig/VersionUI/BaichaoUI_3_9/BaichaoUI_3_9_Pinball/Skill/skill2",
		effect = {
			5
		}
	},
	[30903] = {
		cost = 0,
		action = "attack1",
		effect_type = 5,
		cd = 0,
		description = "每回合对玩家造成一定伤害",
		special_effects = "skill",
		id = 30903,
		icon = "TextureConfig/BuffIcon/AFFIX_9091",
		effect = {
			30
		}
	},
	[30904] = {
		cost = 0,
		action = "skill1",
		effect_type = 12,
		cd = 3,
		description = "下次发射弹珠时，弹珠弹射10次后会自动消失",
		special_effects = "skill",
		id = 30904,
		icon = "TextureConfig/BuffIcon/AFFIX_DOTIMMUNE",
		effect = {
			3,
			1
		}
	},
	[30905] = {
		cost = 0,
		action = "skill1",
		effect_type = 13,
		cd = 3,
		description = "将场地中所有砖块类型转化为再生砖块持续1回合",
		special_effects = "skill",
		id = 30905,
		icon = "TextureConfig/BuffIcon/AFFIX_BUFF_SHIELD",
		effect = {
			5,
			1
		}
	},
	all = {
		30901,
		30902,
		30903,
		30904,
		30905
	}
}
