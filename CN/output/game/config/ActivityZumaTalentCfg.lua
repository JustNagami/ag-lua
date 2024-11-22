return {
	[1001] = {
		talent_value = 20,
		name = "缓速领域",
		talent_type = 1,
		desc = "\n轨道弹珠的运动速度降低20%",
		need = 600,
		activity_id = 242791,
		id = 1001,
		icon = "1007",
		pre_id = 0
	},
	[1002] = {
		talent_value = 100,
		name = "精确准星",
		talent_type = 2,
		desc = "\n瞄准弹珠的持续时间增加100%\n\n\n\n\n<color=#FFAB00>瞄准弹珠：轨道上的弹珠有一定概率转化为瞄准弹珠，消除瞄准弹珠后，将在一定时间内获得瞄准线并提升弹珠发射后的速度。</color>",
		need = 800,
		activity_id = 242791,
		id = 1002,
		icon = "1001",
		pre_id = 1001
	},
	[1003] = {
		talent_value = 20,
		name = "色彩变转",
		talent_type = 3,
		desc = "\n洛肯转化特殊弹珠（转色弹珠）所需的积分降低20%\n\n\n\n\n<color=#FFAB00>转色弹珠：累计获得一定数量积分后，洛肯发射的弹珠有一定概率转化为转色弹珠，转色弹珠命中后，将产生爆炸，并将爆炸范围内的所有弹珠变为转色弹珠的颜色。</color>",
		need = 1200,
		activity_id = 242791,
		id = 1003,
		icon = "1004",
		pre_id = 1002
	},
	[1004] = {
		talent_value = 100,
		name = "额外试剂",
		talent_type = 4,
		desc = "\n实验增幅药剂的分数增加100%\n\n\n\n\n<color=#FFAB00>实验增幅药剂：每隔一段时间，将会在场地内出现实验增幅药剂，使用弹珠命中实验增幅药剂后，将获得额外积分。</color>",
		need = 1800,
		activity_id = 242791,
		id = 1004,
		icon = "1008",
		pre_id = 1003
	},
	[1005] = {
		talent_value = 100,
		name = "时空定格",
		talent_type = 5,
		desc = "\n暂停弹珠的持续时间增加100%\n\n\n\n\n<color=#FFAB00>暂停弹珠：轨道上的弹珠有一定概率转化为暂停弹珠，消除暂停弹珠后，将使所有轨道上的弹珠停止前进一定时间。</color>",
		need = 800,
		activity_id = 242791,
		id = 1005,
		icon = "1002",
		pre_id = 1001
	},
	[1006] = {
		talent_value = 20,
		name = "引爆频发",
		talent_type = 6,
		desc = "\n洛肯转化特殊弹珠（爆炸弹珠）所需的积分降低20%\n\n\n\n\n<color=#FFAB00>爆炸弹珠：累计获得一定数量积分后，洛肯发射的弹珠有一定概率转化为爆炸弹珠，爆炸弹珠命中后，将产生爆炸，并将爆炸范围内的所有弹珠消除。</color>",
		need = 1200,
		activity_id = 242791,
		id = 1006,
		icon = "1005",
		pre_id = 1005
	},
	[1007] = {
		talent_value = 10,
		name = "力量掠取",
		talent_type = 7,
		desc = "\n消除积分的获取率提升10%",
		need = 1800,
		activity_id = 242791,
		id = 1007,
		icon = "1009",
		pre_id = 1006
	},
	[1008] = {
		talent_value = 100,
		name = "逆行增幅",
		talent_type = 8,
		desc = "\n回退弹珠的回退距离增加100%\n\n\n\n\n<color=#FFAB00>回退弹珠：轨道上的弹珠有一定概率转化为回退弹珠，消除回退弹珠后，将使对应轨道上的弹珠回退一定距离。</color>",
		need = 800,
		activity_id = 242791,
		id = 1008,
		icon = "1003",
		pre_id = 1001
	},
	[1009] = {
		talent_value = 20,
		name = "万用化现",
		talent_type = 9,
		desc = "\n洛肯转化特殊弹珠（万能弹珠）所需的积分降低20%\n\n\n\n\n<color=#FFAB00>万能弹珠：累计获得一定数量积分后，洛肯发射的弹珠有一定概率转化为万能弹珠，万能弹珠命中后，会根据命中弹珠的颜色，将对应轨道上所有同色弹珠消除。</color>",
		need = 1200,
		activity_id = 242791,
		id = 1009,
		icon = "1006",
		pre_id = 1008
	},
	[1010] = {
		talent_value = 10,
		name = "胜利渴望",
		talent_type = 10,
		desc = "\n结算积分的获取率提升10%",
		need = 1800,
		activity_id = 242791,
		id = 1010,
		icon = "1010",
		pre_id = 1009
	},
	all = {
		1001,
		1002,
		1003,
		1004,
		1005,
		1006,
		1007,
		1008,
		1009,
		1010
	}
}
