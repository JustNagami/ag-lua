﻿return {
	[101011101] = {
		description = "连续挥动镰刀斩击敌人，造成共计<color=#E78300>{1}</color>攻击力的物理属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101011101,
		extra_param = "",
		param = {
			{
				196,
				3.795,
				true,
				"%"
			}
		}
	},
	[101011201] = {
		description = "使用镰刀连斩，造成共计<color=#E78300>{1}</color>攻击力的物理属性伤害。「禁忌灾刃」处于冷却状态时，可再次点击该技能对自身造成<color=#E78300>{3}</color>（最多<color=#E78300>30%</color>）生命值上限的伤害，并额外施放一次「禁忌灾刃」；该次施放的「禁忌灾刃」命中瞬间伤害提高<color=#E78300>{2}</color>，获得<color=#E78300>8%</color>的奥义值，每次冷却时间内最多施放一次。\n「禁忌灾刃」不会打断普通攻击的连段。\n\n<color=#297DE0>印记：</color>每次施放命中后，获得<color=#E78300>{4}</color>个印记。",
		maxLv = 60,
		type = 1,
		id = 101011201,
		extra_param = "",
		param = {
			{
				160,
				4.1,
				true,
				"%"
			},
			{
				70,
				0,
				false,
				"%"
			},
			{
				15,
				0,
				false,
				"%"
			},
			{
				1,
				0,
				false,
				""
			}
		}
	},
	[101011202] = {
		description = "向目标抛出镰刀并收回，造成共计<color=#E78300>{1}</color>攻击力的物理属性伤害。\n\n<color=#297DE0>印记：</color>每次施放命中后，获得<color=#E78300>{2}</color>个印记。",
		maxLv = 60,
		type = 1,
		id = 101011202,
		extra_param = "",
		param = {
			{
				200,
				5.126,
				true,
				"%"
			},
			{
				1,
				0,
				false,
				""
			}
		}
	},
	[101011203] = {
		description = "向锁定的敌人施放强力的斩击，造成共计<color=#E78300>{1}</color>攻击力的物理属性伤害。当该技能击败敌人时，恢复自身<color=#E78300>{2}</color>的生命值，每次施放最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101011203,
		extra_param = "",
		param = {
			{
				400,
				10.255,
				true,
				"%"
			},
			{
				20,
				0,
				false,
				"%"
			}
		}
	},
	[101011208] = {
		description = "朝约·薇儿丹蒂与雏心·奥西里斯的连携奥义。\n朝约·薇儿丹蒂造成<color=#E78300>{1}+{2}</color>×<color=#297DE0>自身奥义等级</color>攻击力的物理属性伤害；全队伍该次连携奥义的修正系数提高<color=#E78300>{5}</color>。\n雏心·奥西里斯造成<color=#E78300>{3}+{4}</color>×<color=#297DE0>自身奥义等级</color>攻击力的物理属性伤害；命中后恢复全队伍自身<color=#E78300>{6}</color>攻击力的生命值。",
		maxLv = 60,
		type = 1,
		id = 101011208,
		extra_param = "",
		param = {
			{
				600,
				30,
				true,
				"%"
			},
			{
				15.385,
				0.769,
				true,
				"%"
			},
			{
				600,
				30,
				true,
				"%"
			},
			{
				15.385,
				0.769,
				true,
				"%"
			},
			{
				200,
				0,
				false,
				"%"
			},
			{
				25,
				0,
				false,
				"%"
			}
		}
	},
	[101011209] = {
		description = "跃起后，甩出镰刀并收回，攻击最多造成<color=#E78300>12</color>次伤害，造成共计<color=#E78300>{1}</color>攻击力的物理属性伤害；每次攻击命中后，恢复自身<color=#E78300>{2}</color>攻击力的生命值。\n\n自身或者队友受击时，获得<color=#E78300>8%</color>的奥义值，该效果每<color=#E78300>2</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101011209,
		extra_param = "",
		param = {
			{
				600,
				15.634,
				true,
				"%"
			},
			{
				20,
				0,
				false,
				"%"
			}
		}
	},
	[101011281] = {
		description = "雏心·奥西里斯与生魂·奥西里斯的连携奥义。\n雏心·奥西里斯造成<color=#E78300>{1}+{2}</color>×<color=#297DE0>自身奥义等级</color>攻击力的物理属性伤害；命中后恢复全队伍自身<color=#E78300>{5}</color>攻击力的生命值。\n生魂·奥西里斯造成<color=#E78300>{3}+{4}</color>×<color=#297DE0>自身奥义等级</color>攻击力的风属性伤害；自身进入<material=underline c=#FFFFFF h=2 event=terminology args=(111101)>「冥府审判模式」</material>，全队伍伤害提高<color=#E78300>10%+0.2%</color>×<color=#297DE0>自身奥义等级</color>，持续至<material=underline c=#FFFFFF h=2 event=terminology args=(111101)>「冥府审判模式」</material>结束。",
		maxLv = 60,
		type = 1,
		id = 101011281,
		extra_param = "",
		param = {
			{
				600,
				30,
				true,
				"%"
			},
			{
				15.385,
				0.769,
				true,
				"%"
			},
			{
				1110,
				56,
				true,
				"%"
			},
			{
				28.462,
				1.436,
				true,
				"%"
			},
			{
				25,
				0,
				false,
				"%"
			}
		}
	},
	[101011305] = {
		description = "快速闪避敌人攻击，且可以连续施放二次闪避，极限闪避会触发闪避效果。\n闪避效果：进入零时空间使全场敌人动作大幅减速，持续<color=#E78300>2</color>秒；闪避效果每<color=#E78300>{1}</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101011305,
		extra_param = "",
		param = {
			{
				14,
				0,
				false,
				""
			}
		}
	},
	[101013101] = {
		description = "连续攻击锁定的敌人，造成共计<color=#E78300>{1}</color>攻击力的火属性伤害。\n「虚炎行空」：可通过长按普通攻击施放该技能。贯穿空间施放直线攻击，造成<color=#E78300>220%</color>攻击力的火属性伤害。处于<material=underline c=#FFFFFF h=2 event=terminology args=(101301)>「缚炎」</material>状态时，命中时对敌人附加火属性抗性降低<color=#E78300>{2}</color>，持续<color=#E78300>{3}</color>秒。\n强化的「虚炎行空」：每次<material=underline c=#FFFFFF h=2 event=terminology args=(101301)>「缚炎」</material>状态结束后、处于<material=underline c=#FFFFFF h=2 event=terminology args=(101301)>「缚炎」</material>状态并再次进入<material=underline c=#FFFFFF h=2 event=terminology args=(101301)>「缚炎」</material>状态后、<material=underline c=#FFFFFF h=2 event=terminology args=(101301)>「缚炎」</material>状态延长后，会强化下一次的「虚炎行空」，可通过长按普通攻击施放该强化技能。贯穿空间释放重拳，造成<color=#E78300>440%</color>攻击力的火属性伤害。\n「虚炎行空」不会打断普通攻击的连段。\n\n<color=#297DE0>能量：</color>每秒自动获得<color=#E78300>3</color>点能量。",
		maxLv = 60,
		type = 1,
		id = 101013101,
		extra_param = "",
		param = {
			{
				389,
				7.497,
				true,
				"%"
			},
			{
				15,
				0,
				false,
				"%"
			},
			{
				4,
				0,
				false,
				""
			}
		}
	},
	[101013111] = {
		description = "连续攻击锁定的敌人，造成共计<color=#E78300>{1}</color>攻击力的火属性伤害。\n「虚炎行空」：可通过长按普通攻击施放该技能。贯穿空间施放直线攻击，造成<color=#E78300>220%</color>攻击力的火属性伤害。处于<material=underline c=#FFFFFF h=2 event=terminology args=(101301)>「缚炎」</material>状态时，命中时对敌人附加火属性抗性降低<color=#E78300>{2}</color>，持续<color=#E78300>{3}</color>秒。\n强化的「虚炎行空」：进入或延长<material=underline c=#FFFFFF h=2 event=terminology args=(101301)>「缚炎」</material>状态时会强化下一次的「虚炎行空」，并且仅处于<material=underline c=#FFFFFF h=2 event=terminology args=(101301)>「缚炎」</material>状态时才可通过长按普通攻击施放该强化技能。把释放的火焰地涌转为对目标的小范围攻击，造成共计<color=#E78300>660%</color>攻击力的火属性伤害，获得<color=#E78300>12</color>点能量，命中时对敌人附加火属性抗性降低，持续<color=#E78300>{4}</color>秒，最多可叠加<color=#E78300>5</color>层。\n根据<material=underline c=#FFFFFF h=2 event=terminology args=(101301)>「缚炎」</material>状态期间普通攻击命中的次数，「虚炎行空」命中瞬间伤害提高；每次<material=underline c=#FFFFFF h=2 event=terminology args=(101301)>「缚炎」</material>状态结束时移除该伤害提高效果。\n「虚炎行空」不会打断普通攻击的连段。\n\n<color=#297DE0>能量：</color>每秒自动获得<color=#E78300>3</color>点能量。",
		maxLv = 60,
		type = 1,
		id = 101013111,
		extra_param = "",
		param = {
			{
				389,
				7.497,
				true,
				"%"
			},
			{
				15,
				0,
				false,
				"%"
			},
			{
				4,
				0,
				false,
				""
			},
			{
				8,
				0,
				false,
				""
			}
		}
	},
	[101013201] = {
		description = "进入<material=underline c=#FFFFFF h=2 event=terminology args=(101301)>「缚炎」</material>状态，自身火属性伤害提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒。障月之拳穿越一定距离，从锁定的敌人周围攻击目标，造成共计<color=#E78300>{3}</color>攻击力的火属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101013201,
		extra_param = "",
		param = {
			{
				20,
				0,
				false,
				"%"
			},
			{
				4,
				0,
				false,
				""
			},
			{
				240,
				6.153,
				true,
				"%"
			}
		}
	},
	[101013202] = {
		description = "进入<material=underline c=#FFFFFF h=2 event=terminology args=(101301)>「缚炎」</material>状态，自身火属性伤害提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒。施放力场球束缚范围内敌人，持续<color=#E78300>{3}</color>秒，该效果无视敌人的免疫控制状态，并且敌人不会累积控制抗性点数，力场球爆炸后对周围敌人造成<color=#E78300>{4}</color>攻击力的火属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101013202,
		extra_param = "",
		param = {
			{
				20,
				0,
				false,
				"%"
			},
			{
				4,
				0,
				false,
				""
			},
			{
				3.5,
				0,
				false,
				""
			},
			{
				120,
				3.076,
				true,
				"%"
			}
		}
	},
	[101013203] = {
		description = "进入<material=underline c=#FFFFFF h=2 event=terminology args=(101301)>「缚炎」</material>状态，自身火属性伤害提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒。在锁定的敌人下方制造一道地裂，并使周围敌人朝地裂位置聚拢，之后障月重拳从地裂下方挥出，对范围内的敌人进行攻击，造成共计<color=#E78300>{3}</color>攻击力的火属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101013203,
		extra_param = "",
		param = {
			{
				20,
				0,
				false,
				"%"
			},
			{
				4,
				0,
				false,
				""
			},
			{
				300,
				7.691,
				true,
				"%"
			}
		}
	},
	[101013208] = {
		description = "追炎·前鬼坊天狗与障月·阿修罗的连携奥义。\n追炎·前鬼坊天狗造成<color=#E78300>{1}+{2}</color>×<color=#297DE0>自身奥义等级</color>攻击力的物理属性伤害；命中后全队伍恢复满印记。\n障月·阿修罗造成<color=#E78300>{3}+{4}</color>×<color=#297DE0>自身奥义等级</color>攻击力的火属性伤害；命中时对敌人附加火属性抗性降低<color=#E78300>{5}</color>，持续<color=#E78300>{6}</color>秒。",
		maxLv = 60,
		type = 1,
		id = 101013208,
		extra_param = "",
		param = {
			{
				360,
				18,
				true,
				"%"
			},
			{
				9.231,
				0.462,
				true,
				"%"
			},
			{
				840,
				42,
				true,
				"%"
			},
			{
				21.538,
				1.077,
				true,
				"%"
			},
			{
				30,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			}
		}
	},
	[101013209] = {
		description = "跃起后使用障月砸击目标地面，攻击制造四道火柱，对范围内的敌人造成<color=#E78300>{1}</color>攻击力的火属性伤害；命中时对敌人附加火属性抗性降低<color=#E78300>{2}</color>，持续<color=#E78300>{3}</color>秒。\n\n自身或者队友触发零时空间时，获得<color=#E78300>15%</color>的奥义值，该效果每<color=#E78300>0.5</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101013209,
		extra_param = "",
		param = {
			{
				840,
				21.535,
				true,
				"%"
			},
			{
				30,
				0,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[101013305] = {
		description = "快速闪避敌人攻击，极限闪避会触发闪避效果。\n闪避效果：进入零时空间使全场敌人动作大幅减速，持续<color=#E78300>3</color>秒；闪避效果每<color=#E78300>{1}</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101013305,
		extra_param = "",
		param = {
			{
				20,
				0,
				false,
				""
			}
		}
	},
	[101015101] = {
		description = "挥舞审判日轮攻击敌人，造成共计<color=#E78300>{1}</color>攻击力的物理属性伤害。\n\n被动：\n<material=underline c=#FFFFFF h=2 event=terminology args=(101501)>「日晖」</material>上限<color=#E78300>200</color>点。\n\n<color=#297DE0>神能：</color>普通攻击命中后会获得神能。",
		maxLv = 60,
		type = 1,
		id = 101015101,
		extra_param = "",
		param = {
			{
				510,
				9.851,
				true,
				"%"
			}
		}
	},
	[101015201] = {
		description = "向敌人发射钩锁，造成<color=#E78300>{1}</color>攻击力的物理属性伤害，命中后向敌人突进，突进时获得霸体效果并可以格挡受到的伤害，突进期间成功格挡伤害时，重置「刃爪噬敌」的冷却时间；未能突进时，该技能剩余冷却时间缩短<color=#E78300>50%</color>。\n「狂狮逐猎」命中后<color=#E78300>3</color>秒内，「狂狮逐猎」会替换为「狂狮锯齿」、「锯刃撼地」会替换为「锯刃轮舞」，施放其中任意一个技能后技能一、二会替换回原技能。\n「狂狮锯齿」：跃起并将审判日轮向下猛砸，造成共计<color=#E78300>{2}</color>攻击力的物理属性伤害，该技能有<color=#E78300>12</color>秒的冷却时间。\n\n<color=#297DE0>神能：</color>「狂狮逐猎」命中后会获得<color=#E78300>25</color>点神能；突进期间成功格挡伤害时，神能恢复至满值。",
		maxLv = 60,
		type = 1,
		id = 101015201,
		extra_param = "",
		param = {
			{
				150,
				3.846,
				true,
				"%"
			},
			{
				900,
				23.074,
				true,
				"%"
			}
		}
	},
	[101015202] = {
		description = "将审判日轮压向地面，对周围造成伤害并后撤，造成共计<color=#E78300>{1}</color>攻击力的物理属性伤害，施放时获得硬直效果。\n「锯刃轮舞」：挥舞锯齿在周身旋转一圈，造成共计<color=#E78300>{2}</color>攻击力的物理属性伤害，该技能有<color=#E78300>12</color>秒的冷却时间。\n\n<color=#297DE0>神能：</color>「锯刃撼地」非最后一段攻击每次命中后会获得<color=#E78300>2</color>点神能；「锯刃撼地」最后一段攻击命中后会获得<color=#E78300>15</color>点神能。",
		maxLv = 60,
		type = 1,
		id = 101015202,
		extra_param = "",
		param = {
			{
				1000,
				25.638,
				true,
				"%"
			},
			{
				900,
				23.075,
				true,
				"%"
			}
		}
	},
	[101015203] = {
		description = "运用审判日轮撕裂敌人身体，造成共计<color=#E78300>{1}</color>攻击力的物理属性伤害，施放时获得硬直效果，会自动消耗神能持续攻击敌人，每段额外消耗<color=#E78300>25</color>点神能，造成共计<color=#E78300>{2}</color>攻击力的物理属性伤害，并获得<color=#E78300>25</color>点<material=underline c=#FFFFFF h=2 event=terminology args=(101501)>「日晖」</material>，每段攻击对命中的敌人附加物理属性抗性降低<color=#E78300>3%</color>，持续<color=#E78300>{5}</color>秒，最多可叠加<color=#E78300>6</color>层。\n当<material=underline c=#FFFFFF h=2 event=terminology args=(101501)>「日晖」</material>不低于<color=#E78300>100</color>点时，长按普通攻击会消耗<color=#E78300>100</color>点<material=underline c=#FFFFFF h=2 event=terminology args=(101501)>「日晖」</material>施放技能攻击「噬敌利爪」。\n「噬敌利爪」：将审判日轮砸下，造成共计<color=#E78300>{3}</color>攻击力的物理属性伤害，并挥出三道由神能构成的锯齿，造成共计<color=#E78300>{4}</color>攻击力的物理属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101015203,
		extra_param = "",
		param = {
			{
				1800,
				46.152,
				true,
				"%"
			},
			{
				600,
				15.384,
				true,
				"%"
			},
			{
				400,
				10.255,
				true,
				"%"
			},
			{
				700,
				17.947,
				true,
				"%"
			},
			{
				15,
				0,
				false,
				""
			}
		}
	},
	[101015208] = {
		description = "流萤岚雾·休与狂狮·塞赫麦特的连携奥义。\n流萤岚雾·休造成<color=#E78300>{1}+{2}</color>×<color=#297DE0>自身奥义等级</color>攻击力的雷属性伤害；命中后全队伍机制值获得率提高<color=#E78300>{5}</color>，持续<color=#E78300>{6}</color>秒，普通攻击每命中敌人<color=#E78300>1</color>次，会心伤害提高<color=#E78300>25%</color>，最多可叠加<color=#E78300>3</color>层，机制值获得率提高的加成效果结束时会心伤害加成效果移除。\n狂狮·塞赫麦特造成<color=#E78300>{3}+{4}</color>×<color=#297DE0>自身奥义等级</color>攻击力的物理属性伤害；施放时全队伍获得<material=underline c=#FFFFFF h=2 event=terminology args=(101502)>「潜能解放」</material>，持续<color=#E78300>{7}</color>秒；恢复全队<color=#E78300>62%+2%</color>×<color=#297DE0>自身奥义等级</color>攻击力的生命值；命中时全队伍技能伤害提高<color=#E78300>{8}</color>，持续<color=#E78300>{9}</color>秒。",
		maxLv = 60,
		type = 1,
		id = 101015208,
		extra_param = "",
		param = {
			{
				1000,
				50,
				true,
				"%"
			},
			{
				25.641,
				1.282,
				true,
				"%"
			},
			{
				1000,
				50,
				true,
				"%"
			},
			{
				25.641,
				1.282,
				true,
				"%"
			},
			{
				25,
				0,
				false,
				"%"
			},
			{
				20,
				0,
				false,
				""
			},
			{
				12,
				0,
				false,
				""
			},
			{
				20,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			}
		}
	},
	[101015209] = {
		description = "解放自身力量，施放后全队伍获得<material=underline c=#FFFFFF h=2 event=terminology args=(101502)>「潜能解放」</material>，持续<color=#E78300>{2}</color>秒，恢复全队伍自身<color=#E78300>{3}</color>攻击力的生命值。\n<material=underline c=#FFFFFF h=2 event=terminology args=(101502)>「潜能解放」</material>：物理属性伤害提高<color=#E78300>{1}</color>。\n\n当敌人被附加破甲状态时，获得<color=#E78300>8%</color>的奥义值，该效果每<color=#E78300>2</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101015209,
		extra_param = "",
		param = {
			{
				25,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			},
			{
				62,
				2,
				true,
				"%"
			}
		}
	},
	[101015305] = {
		description = "快速闪避敌人攻击，极限闪避会触发闪避效果。\n闪避效果：进入零时空间使全场敌人动作大幅减速，持续<color=#E78300>3</color>秒；闪避效果每<color=#E78300>{1}</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101015305,
		extra_param = "",
		param = {
			{
				20,
				0,
				false,
				""
			}
		}
	},
	[101016101] = {
		description = "挥舞荒獠连续攻击，造成共计<color=#E78300>{1}</color>攻击力的物理属性伤害。普通攻击到第五段时，长按普通攻击，可施放特殊普通攻击「爆压碎裂斩」，造成共计<color=#E78300>{2}</color>攻击力的物理属性伤害，命中后会产生爆炸，每次爆炸造成共计<color=#E78300>{3}</color>攻击力的物理属性伤害，每个<material=underline c=#FFFFFF h=2 event=terminology args=(101601)>「压力槽」</material>标记会消耗<color=#E78300>10</color>点神能并额外产生<color=#E78300>1</color>次爆炸。「爆压碎裂斩」不会打断普通攻击的连段。\n「高压回旋斩」：消耗全部<material=underline c=#FFFFFF h=2 event=terminology args=(101601)>「压力槽」</material>标记并发动回旋斩击，造成共计<color=#E78300>{4}</color>攻击力的物理属性伤害，每消耗<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(101601)>「压力槽」</material>标记获得<color=#E78300>1</color>层<material=underline c=#FFFFFF h=2 event=terminology args=(101602)>「爆裂阈值」</material>和<color=#E78300>15</color>点神能，每层<material=underline c=#FFFFFF h=2 event=terminology args=(101602)>「爆裂阈值」</material>自身伤害提高<color=#E78300>10%</color>，持续<color=#E78300>{5}</color>秒，施放「高压回旋斩」后的<color=#E78300>5</color>秒内，施放「突击战术」、「攻坚战术」时会直接施放该技能的电锯模式。\n<material=underline c=#FFFFFF h=2 event=terminology args=(101603)>「超频电锯模式」</material>：强化普通攻击，期间不再获得神能，前五段每次攻击命中会消耗<color=#E78300>10</color>点神能额外造成共计<color=#E78300>{6}</color>攻击力的物理属性伤害，当神能不足消耗时退出该状态，该状态最多可持续<color=#E78300>10</color>秒。\n\n被动：\n<material=underline c=#FFFFFF h=2 event=terminology args=(101601)>「压力槽」</material>标记最多拥有<color=#E78300>4</color>个。\n\n<color=#297DE0>神能：</color>普通攻击命中后会获得神能。",
		maxLv = 60,
		type = 1,
		id = 101016101,
		extra_param = "",
		param = {
			{
				276,
				5.38,
				true,
				"%"
			},
			{
				266,
				5.142,
				true,
				"%"
			},
			{
				120,
				3.076,
				true,
				"%"
			},
			{
				200,
				5.126,
				true,
				"%"
			},
			{
				10,
				0,
				false,
				""
			},
			{
				240,
				6.152,
				true,
				"%"
			}
		}
	},
	[101016201] = {
		description = "大剑模式：侧身用荒獠撞击，撞击时自身获得短暂的霸体效果，造成共计<color=#E78300>{1}</color>攻击力的物理属性伤害，命中后该技能切换到电锯模式。\n电锯模式：使用荒獠进行突刺攻击，造成共计<color=#E78300>{2}</color>攻击力的物理属性伤害；命中时可通过长按该技能消耗神能持续施放，每消耗<color=#E78300>25</color>点神能获得<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(101601)>「压力槽」</material>标记、伤害提高<color=#E78300>10%</color>并额外造成共计<color=#E78300>{3}</color>攻击力的物理属性伤害；处于修正模式时命中瞬间技能伤害提高<color=#E78300>10%</color>。施放后切换回大剑模式。\n\n<color=#297DE0>神能：</color>撞击的霸体效果期间受击时会格挡伤害并获得<color=#E78300>100</color>点神能。",
		maxLv = 60,
		type = 1,
		id = 101016201,
		extra_param = "",
		param = {
			{
				700,
				17.943,
				true,
				"%"
			},
			{
				450,
				11.534,
				true,
				"%"
			},
			{
				300,
				7.69,
				true,
				"%"
			}
		}
	},
	[101016202] = {
		description = "挥舞荒獠进行横向切割和纵向斩击，造成共计<color=#E78300>{1}</color>攻击力的物理属性伤害。当横向切割和纵向斩击命中了同一个敌人，获得<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(101601)>「压力槽」</material>标记。横向切割和纵向斩击命中时可分别通过长按消耗神能持续切割敌人，横向切割额外造成共计<color=#E78300>{2}</color>攻击力的物理属性伤害，纵向斩击额外造成共计<color=#E78300>{3}</color>攻击力的物理属性伤害，每消耗<color=#E78300>25</color>点神能，获得<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(101601)>「压力槽」</material>标记。",
		maxLv = 60,
		type = 1,
		id = 101016202,
		extra_param = "",
		param = {
			{
				500,
				12.818,
				true,
				"%"
			},
			{
				300,
				7.688,
				true,
				"%"
			},
			{
				300,
				7.69,
				true,
				"%"
			}
		}
	},
	[101016203] = {
		description = "大剑模式：挥舞荒獠连续斩击，造成共计<color=#E78300>{1}</color>攻击力的物理属性伤害，命中后该技能切换到电锯模式。\n电锯模式：把荒獠插入地面切割并释放震荡波，造成共计<color=#E78300>{2}</color>攻击力的范围物理属性伤害；命中时可通过长按该技能消耗神能持续施放，每消耗<color=#E78300>25</color>点神能获得<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(101601)>「压力槽」</material>标记、伤害提高<color=#E78300>10%</color>并额外造成共计<color=#E78300>{3}</color>攻击力的物理属性伤害；处于修正模式时命中瞬间技能伤害提高<color=#E78300>10%</color>。施放后切换回大剑模式。\n\n<color=#297DE0>神能：</color>大剑模式命中后会获得神能。",
		maxLv = 60,
		type = 1,
		id = 101016203,
		extra_param = "",
		param = {
			{
				500,
				12.82,
				true,
				"%"
			},
			{
				450,
				11.531,
				true,
				"%"
			},
			{
				300,
				7.688,
				true,
				"%"
			}
		}
	},
	[101016208] = {
		description = "荒獠·金固与龙切·迦具土的连携奥义。\n荒獠·金固造成<color=#E78300>{1}+{2}</color>×<color=#297DE0>自身奥义等级</color>攻击力的物理属性伤害；自身进入<material=underline c=#FFFFFF h=2 event=terminology args=(101603)>「超频电锯模式」</material>；命中时全队伍技能伤害提高<color=#E78300>{7}</color>，持续<color=#E78300>{8}</color>秒。\n龙切·迦具土造成<color=#E78300>{3}+{4}</color>×<color=#297DE0>自身奥义等级</color>攻击力的火属性伤害；自身进入<material=underline c=#FFFFFF h=2 event=terminology args=(105801)>「染火」</material>状态，持续<color=#E78300>18</color>秒；命中时全队伍火属性伤害提高<color=#E78300>{5}</color>，持续<color=#E78300>{6}</color>秒。",
		maxLv = 60,
		type = 1,
		id = 101016208,
		extra_param = "",
		param = {
			{
				600,
				0,
				false,
				"%"
			},
			{
				15.385,
				0,
				false,
				"%"
			},
			{
				1150,
				0,
				false,
				"%"
			},
			{
				29.487,
				0,
				false,
				"%"
			},
			{
				70,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			},
			{
				25,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			}
		}
	},
	[101016209] = {
		description = "使荒獠超载，造成共计<color=#E78300>{1}</color>攻击力的物理属性伤害；命中时对敌人附加破甲状态，防御力降低<color=#E78300>{2}</color>，持续<color=#E78300>{3}</color>秒。施放后进入<material=underline c=#FFFFFF h=2 event=terminology args=(101603)>「超频电锯模式」</material>，获得<material=underline c=#FFFFFF h=2 event=terminology args=(101601)>「压力槽」</material>满个数的<material=underline c=#FFFFFF h=2 event=terminology args=(101602)>「爆裂阈值」</material>，持续<color=#E78300>{4}</color>秒。\n\n自身或者队友极限闪避时，获得<color=#E78300>8%</color>的奥义值，该效果每<color=#E78300>2</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101016209,
		extra_param = "",
		param = {
			{
				600,
				15.384,
				true,
				"%"
			},
			{
				25,
				0,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				""
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[101016281] = {
		description = "怒蛇·马尔杜克与荒獠·金固的连携奥义。\n怒蛇·马尔杜克造成<color=#E78300>{1}+{2}</color>×<color=#297DE0>自身奥义等级</color>攻击力的物理属性伤害；命中时全队伍受到的伤害降低<color=#E78300>{8}</color>，持续<color=#E78300>{9}</color>秒，对命中的敌人附加破甲状态，防御力降低<color=#E78300>{5}</color>，持续<color=#E78300>{6}</color>秒。\n荒獠·金固造成<color=#E78300>{3}+{4}</color>×<color=#297DE0>自身奥义等级</color>攻击力的物理属性伤害；自身进入<material=underline c=#FFFFFF h=2 event=terminology args=(101603)>「超频电锯模式」</material>；命中时全队伍获得自身满层数<material=underline c=#FFFFFF h=2 event=terminology args=(101601)>「压力槽」</material>对应的<material=underline c=#FFFFFF h=2 event=terminology args=(101602)>「爆裂阈值」</material>，持续<color=#E78300>{7}</color>秒。",
		maxLv = 60,
		type = 1,
		id = 101016281,
		extra_param = "",
		param = {
			{
				1160,
				0,
				false,
				"%"
			},
			{
				29.744,
				0,
				false,
				"%"
			},
			{
				600,
				0,
				false,
				"%"
			},
			{
				15.385,
				0,
				false,
				"%"
			},
			{
				25,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			},
			{
				10,
				0,
				false,
				""
			},
			{
				15,
				0,
				false,
				"%"
			},
			{
				7,
				0,
				false,
				""
			}
		}
	},
	[101016305] = {
		description = "快速闪避敌人的攻击，且可以连续施放二次闪避，极限闪避会触发闪避效果。闪避不会打断普通攻击的连段。在「突击战术」、「攻坚战术」的电锯模式时，可使用非移动闪避打断技能后<color=#E78300>0.8</color>秒内衔接普通攻击来施放「高压回旋斩」。\n闪避效果：进入零时空间使全场敌人动作大幅减速，持续<color=#E78300>2</color>秒；获得<color=#E78300>30</color>点神能；闪避效果每<color=#E78300>{1}</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101016305,
		extra_param = "",
		param = {
			{
				20,
				0,
				false,
				""
			}
		}
	},
	[101017101] = {
		description = "挥舞利爪攻击敌人，造成共计<color=#E78300>{1}</color>攻击力的暗属性伤害。普通攻击最后一段命中时，进入<material=underline c=#FFFFFF h=2 event=terminology args=(101701)>「神瞳凝视」</material>状态，持续<color=#E78300>9</color>秒。",
		maxLv = 60,
		type = 1,
		id = 101017101,
		extra_param = "",
		param = {
			{
				248,
				4.801,
				true,
				"%"
			}
		}
	},
	[101017201] = {
		description = "短距离突进，并造成共计<color=#E78300>{1}</color>攻击力的暗属性伤害；处于<material=underline c=#FFFFFF h=2 event=terminology args=(101701)>「神瞳凝视」</material>状态时，该技能获得以下额外效果：命中时对锁定的敌人附加暗属性抗性降低<color=#E78300>9%</color>，持续<color=#E78300>{2}</color>秒，技能施放后，<material=underline c=#FFFFFF h=2 event=terminology args=(101701)>「神瞳凝视」</material>状态立即结束。\n\n<color=#297DE0>印记：</color>每次施放命中后，获得<color=#E78300>1</color>个印记。",
		maxLv = 60,
		type = 1,
		id = 101017201,
		extra_param = "",
		param = {
			{
				700,
				17.945,
				true,
				"%"
			},
			{
				7,
				0,
				false,
				""
			}
		}
	},
	[101017202] = {
		description = "从地面跃起，暂时隐藏身形，随后现身并用利爪攻击敌人，造成共计<color=#E78300>{1}</color>攻击力的暗属性伤害；处于<material=underline c=#FFFFFF h=2 event=terminology args=(101701)>「神瞳凝视」</material>状态时，该技能获得以下额外效果：对第一个命中的敌人附加眩晕状态，持续<color=#E78300>{2}</color>秒，技能施放后，<material=underline c=#FFFFFF h=2 event=terminology args=(101701)>「神瞳凝视」</material>状态立即结束。\n\n<color=#297DE0>印记：</color>每次施放命中后，获得<color=#E78300>1</color>个印记。",
		maxLv = 60,
		type = 1,
		id = 101017202,
		extra_param = "",
		param = {
			{
				500,
				12.82,
				true,
				"%"
			},
			{
				2,
				0,
				false,
				""
			}
		}
	},
	[101017203] = {
		description = "消耗<color=#E78300>1</color>个印记，进入<material=underline c=#FFFFFF h=2 event=terminology args=(101701)>「神瞳凝视」</material>状态，持续<color=#E78300>9</color>秒；每次进入<material=underline c=#FFFFFF h=2 event=terminology args=(101701)>「神瞳凝视」</material>状态，「猫神的愚弄」会替换为「战神的处决」；「猫神的愚弄」不会打断普通攻击的连段。\n「战神的处决」：释放暗属性神力，造成共计<color=#E78300>{1}</color>攻击力的暗属性范围伤害，技能施放后，<material=underline c=#FFFFFF h=2 event=terminology args=(101701)>「神瞳凝视」</material>状态立即结束。",
		maxLv = 60,
		type = 1,
		id = 101017203,
		extra_param = "",
		param = {
			{
				359,
				9.226,
				true,
				"%"
			}
		}
	},
	[101017208] = {
		description = "觅影·国常立与灵猫·芭丝特的连携奥义。\n觅影·国常立造成<color=#E78300>{1}+{2}</color>×<color=#297DE0>平均技能等级</color>的攻击力的物理属性伤害；命中时对敌人附加物理、火属性、雷属性、风属性和暗属性抗性降低<color=#E78300>{5}</color>，持续<color=#E78300>{6}</color>秒。\n灵猫·芭丝特造成<color=#E78300>{3}+{4}</color>×<color=#297DE0>自身奥义等级</color>攻击力的暗属性伤害；对普通敌人命中瞬间奥义伤害提高，敌人每有<color=#E78300>1%</color>生命值，命中瞬间奥义伤害提高<color=#E78300>0.5%</color>，该效果提供的奥义伤害提高最高为<color=#E78300>50%</color>；对精英和首领敌人命中瞬间奥义伤害提高，敌人每有<color=#E78300>1%</color>修正值，命中瞬间奥义伤害提高<color=#E78300>0.5%</color>，该效果提供的奥义伤害提高最高为<color=#E78300>50%</color>；处于修正模式的敌人修正值视为<color=#E78300>100%</color>。",
		maxLv = 60,
		type = 1,
		id = 101017208,
		extra_param = "",
		param = {
			{
				840,
				42,
				true,
				"%"
			},
			{
				21.538,
				1.077,
				true,
				"%"
			},
			{
				700,
				35,
				true,
				"%"
			},
			{
				17.949,
				0.897,
				true,
				"%"
			},
			{
				30,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			}
		}
	},
	[101017209] = {
		description = "释放暗属性神力对敌人进行判罚，造成共计<color=#E78300>{1}</color>攻击力的暗属性伤害；对普通敌人命中瞬间奥义伤害提高，敌人每有<color=#E78300>1%</color>生命值，命中瞬间奥义伤害提高<color=#E78300>0.5%</color>，该效果提供的奥义伤害提高最高为<color=#E78300>50%</color>；对精英和首领敌人命中瞬间奥义伤害提高，敌人每有<color=#E78300>1%</color>修正值，命中瞬间奥义伤害提高<color=#E78300>0.5%</color>，该效果提供的奥义伤害提高最高为<color=#E78300>50%</color>；处于修正模式的敌人修正值视为<color=#E78300>100%</color>。\n\n当敌人被附加暗属性抗性降低的状态时，获得<color=#E78300>8%</color>的奥义值，该效果每<color=#E78300>1</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101017209,
		extra_param = "",
		param = {
			{
				500,
				12.816,
				true,
				"%"
			}
		}
	},
	[101017305] = {
		description = "快速闪避敌人攻击，闪避不会打断普通攻击的连段，且可以连续施放二次闪避，极限闪避会触发闪避效果。\n闪避效果：极限闪避后<color=#E78300>3</color>秒内点击普通攻击，会瞬移到锁定的敌人身后施放技能攻击，该技能攻击造成共计<color=#E78300>{1}</color>攻击力的暗属性伤害，命中后进入<material=underline c=#FFFFFF h=2 event=terminology args=(101701)>「神瞳凝视」</material>状态；闪避效果每<color=#E78300>{2}</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101017305,
		extra_param = "",
		param = {
			{
				200,
				3.846,
				true,
				"%"
			},
			{
				14,
				0,
				false,
				""
			}
		}
	},
	[101019101] = {
		description = "挥舞长枪，对前方敌人进行攻击，造成共计<color=#E78300>{1}</color>攻击力的风属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101019101,
		extra_param = "",
		param = {
			{
				125,
				2.472,
				true,
				"%"
			}
		}
	},
	[101019201] = {
		description = "凌空跃起，挥舞长枪对敌人进行攻击，造成共计<color=#E78300>{1}</color>攻击力的风属性伤害，并在落地后于前方召唤<color=#E78300>3</color>根<material=underline c=#FFFFFF h=2 event=terminology args=(101901)>「风神之柱」</material>，每根<material=underline c=#FFFFFF h=2 event=terminology args=(101901)>「风神之柱」</material>对敌人造成<color=#E78300>{2}</color>攻击力的风属性伤害。\n\n<color=#297DE0>印记：</color>每次施放命中后，获得<color=#E78300>{3}</color>个印记。",
		maxLv = 60,
		type = 1,
		id = 101019201,
		extra_param = "",
		param = {
			{
				90,
				2.354,
				true,
				"%"
			},
			{
				25,
				0.642,
				true,
				"%"
			},
			{
				1,
				0,
				false,
				""
			}
		}
	},
	[101019202] = {
		description = "在前方召唤一道向前快速移动的飓风，造成共计<color=#E78300>{1}</color>攻击力的风属性伤害。\n\n<color=#297DE0>印记：</color>每次施放命中后，获得<color=#E78300>{2}</color>个印记。",
		maxLv = 60,
		type = 1,
		id = 101019202,
		extra_param = "",
		param = {
			{
				220,
				5.641,
				true,
				"%"
			},
			{
				1,
				0,
				false,
				""
			}
		}
	},
	[101019203] = {
		description = "根据施放时消耗的印记数量对敌人造成伤害。\n<color=#E78300>1</color>个印记：造成共计<color=#E78300>{1}</color>攻击力的风属性伤害。\n<color=#E78300>2</color>个印记：造成共计<color=#E78300>{2}</color>攻击力的风属性伤害。\n<color=#E78300>3</color>个印记：造成共计<color=#E78300>{3}</color>攻击力的风属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101019203,
		extra_param = "",
		param = {
			{
				220,
				5.641,
				true,
				"%"
			},
			{
				248,
				6.408,
				true,
				"%"
			},
			{
				360,
				9.23,
				true,
				"%"
			}
		}
	},
	[101019208] = {
		description = "潮音·波塞冬与疾风之枪·休的连携奥义。\n潮音·波塞冬造成<color=#E78300>{1}+{2}</color>×<color=#297DE0>自身奥义等级</color>攻击力的水属性伤害；恢复全队<color=#E78300>60%+2%</color>×<color=#297DE0>自身奥义等级</color>攻击力的生命值。\n疾风之枪·休造成<color=#E78300>{3}+{4}</color>×<color=#297DE0>自身奥义等级</color>攻击力的风属性伤害；修正等级改变为<color=#E78300>Ω</color>级。",
		maxLv = 60,
		type = 1,
		id = 101019208,
		extra_param = "",
		param = {
			{
				430,
				22,
				true,
				"%"
			},
			{
				11.026,
				0.564,
				true,
				"%"
			},
			{
				500,
				25,
				true,
				"%"
			},
			{
				12.821,
				0.641,
				true,
				"%"
			}
		}
	},
	[101019209] = {
		description = "进行一定距离的突刺，对路径上的敌人进行攻击，造成共计<color=#E78300>{1}</color>攻击力的风属性伤害；修正等级改变为<color=#E78300>Ω</color>级。当施放「风蚀螺旋枪」击败敌人时，进入零时空间，持续<color=#E78300>4</color>秒。\n\n自身或者队友成功消耗印记时，获得<color=#E78300>8%</color>的奥义值。",
		maxLv = 60,
		type = 1,
		id = 101019209,
		extra_param = "",
		param = {
			{
				500,
				12.82,
				true,
				"%"
			}
		}
	},
	[101019233] = {
		description = "根据施放时消耗的印记数量对敌人造成伤害，当命中的敌人数量为<color=#E78300>1</color>时，该技能命中瞬间会心率和会心伤害提高。\n<color=#E78300>1</color>个印记：造成共计<color=#E78300>{1}</color>攻击力的风属性伤害。\n<color=#E78300>2</color>个印记：造成共计<color=#E78300>{2}</color>攻击力的风属性伤害。\n<color=#E78300>3</color>个印记：造成共计<color=#E78300>{3}</color>攻击力的风属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101019233,
		extra_param = "",
		param = {
			{
				400,
				10.256,
				true,
				"%"
			},
			{
				500,
				12.82,
				true,
				"%"
			},
			{
				700,
				17.948,
				true,
				"%"
			}
		}
	},
	[101019281] = {
		description = "疾风之枪·休与早樱·大国主的连携奥义。\n疾风之枪·休造成<color=#E78300>{1}+{2}</color>×<color=#297DE0>自身奥义等级</color>攻击力的风属性伤害；修正等级改变为<color=#E78300>Ω</color>级。\n早樱·大国主造成<color=#E78300>{3}+{4}</color>×<color=#297DE0>自身奥义等级</color>攻击力的物理属性伤害；命中后全队伍重置技能三的冷却时间。",
		maxLv = 60,
		type = 1,
		id = 101019281,
		extra_param = "",
		param = {
			{
				580,
				29,
				true,
				"%"
			},
			{
				14.872,
				0.744,
				true,
				"%"
			},
			{
				840,
				42,
				true,
				"%"
			},
			{
				21.538,
				1.077,
				true,
				"%"
			}
		}
	},
	[101019282] = {
		description = "疾风之枪·休与生魂·奥西里斯的连携奥义。\n疾风之枪·休造成<color=#E78300>{1}+{2}</color>×<color=#297DE0>自身奥义等级</color>攻击力的风属性伤害；施放后修正等级改变为<color=#E78300>Ω</color>级。\n生魂·奥西里斯造成<color=#E78300>{3}+{4}</color>×<color=#297DE0>自身奥义等级</color>攻击力的风属性伤害；自身进入<material=underline c=#FFFFFF h=2 event=terminology args=(111101)>「冥府审判模式」</material>，全队伍伤害提高<color=#E78300>10%+0.2%</color>×<color=#297DE0>自身奥义等级</color>，持续至<material=underline c=#FFFFFF h=2 event=terminology args=(111101)>「冥府审判模式」</material>结束。",
		maxLv = 60,
		type = 1,
		id = 101019282,
		extra_param = "",
		param = {
			{
				500,
				25,
				true,
				"%"
			},
			{
				12.821,
				0.641,
				true,
				"%"
			},
			{
				1000,
				50,
				true,
				"%"
			},
			{
				25.641,
				1.282,
				true,
				"%"
			}
		}
	},
	[101019305] = {
		description = "快速闪避敌人攻击，极限闪避会触发闪避效果。\n闪避效果：使周围敌人朝自身所在位置聚拢并打断敌人的攻击；闪避效果每<color=#E78300>{1}</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101019305,
		extra_param = "",
		param = {
			{
				14,
				0,
				false,
				""
			}
		}
	},
	[101020101] = {
		description = "处于<material=underline c=#FFFFFF h=2 event=terminology args=(102001)>「创生」</material>：\n造成共计<color=#E78300>{1}</color>攻击力的风属性伤害，每次攻击命中后会获得<material=underline c=#FFFFFF h=2 event=terminology args=(102003)>「梵」</material>点数。\n\n处于<material=underline c=#FFFFFF h=2 event=terminology args=(102002)>「毁灭」</material>：\n造成共计<color=#E78300>{2}</color>攻击力的风属性伤害，每次攻击命中后会获得<material=underline c=#FFFFFF h=2 event=terminology args=(102003)>「梵」</material>点数。\n\n被动：\n<material=underline c=#FFFFFF h=2 event=terminology args=(102003)>「梵」</material>上限<color=#E78300>120</color>点。处于<material=underline c=#FFFFFF h=2 event=terminology args=(102002)>「毁灭」</material>时，获得霸体效果，每<color=#E78300>1</color>秒对全场敌人附加<color=#E78300>{3}</color>攻击力的风属性伤害。\n「大自在天·显形」、「大自在天·湮灭」、「初禅净天·显形」、「初禅净天·湮灭」、处于<material=underline c=#FFFFFF h=2 event=terminology args=(102002)>「毁灭」</material>的奥义「梵我一如」命中生命值不高于<color=#E78300>12%</color>的敌人后，会直接击败敌人。\n\n<color=#297DE0>神能：</color>普通攻击命中后会获得神能。",
		maxLv = 60,
		type = 1,
		id = 101020101,
		extra_param = "",
		param = {
			{
				860,
				16.53,
				true,
				"%"
			},
			{
				1000,
				19.223,
				true,
				"%"
			},
			{
				50,
				0,
				false,
				"%"
			}
		}
	},
	[101020201] = {
		description = "处于<material=underline c=#FFFFFF h=2 event=terminology args=(102001)>「创生」</material>：\n「大自在天·始动」：<material=underline c=#FFFFFF h=2 event=terminology args=(102003)>「梵」</material>点数为满时消耗全部<material=underline c=#FFFFFF h=2 event=terminology args=(102003)>「梵」</material>才可施放，造成共计<color=#E78300>{1}</color>攻击力的风属性伤害，施放后的短暂时间内，该技能会替换为「大自在天·显形」，「大自在天·显形」仅衔接在「大自在天·始动」之后才可施放。\n「大自在天·显形」：造成共计<color=#E78300>{2}</color>攻击力的风属性伤害。\n\n处于<material=underline c=#FFFFFF h=2 event=terminology args=(102002)>「毁灭」</material>：\n「大自在天·崩解」：<material=underline c=#FFFFFF h=2 event=terminology args=(102003)>「梵」</material>点数为满时消耗全部<material=underline c=#FFFFFF h=2 event=terminology args=(102003)>「梵」</material>才可施放，造成共计<color=#E78300>{3}</color>攻击力的风属性伤害，施放后的短暂时间内，该技能会替换为「大自在天·湮灭」，「大自在天·湮灭」仅衔接在「大自在天·崩解」之后才可施放。\n「大自在天·湮灭」：造成共计<color=#E78300>{4}</color>攻击力的风属性伤害。\n\n<color=#297DE0>神能：</color>技能命中后会获得神能。",
		maxLv = 60,
		type = 1,
		id = 101020201,
		extra_param = "",
		param = {
			{
				600,
				15.38,
				true,
				"%"
			},
			{
				1000,
				25.641,
				true,
				"%"
			},
			{
				1000,
				25.64,
				true,
				"%"
			},
			{
				1600,
				41.022,
				true,
				"%"
			}
		}
	},
	[101020202] = {
		description = "处于<material=underline c=#FFFFFF h=2 event=terminology args=(102002)>「毁灭」</material>：\n造成共计<color=#E78300>{1}</color>攻击力的风属性伤害，施放后普通攻击每次命中后恢复<color=#E78300>5%</color>的奥义值，持续<color=#E78300>4</color>秒；该技能每次攻击命中后会获得<material=underline c=#FFFFFF h=2 event=terminology args=(102003)>「梵」</material>点数。\n\n<color=#297DE0>神能：</color>技能命中后会获得神能。",
		maxLv = 60,
		type = 1,
		id = 101020202,
		extra_param = "",
		param = {
			{
				600,
				15.38,
				true,
				"%"
			}
		}
	},
	[101020203] = {
		description = "处于<material=underline c=#FFFFFF h=2 event=terminology args=(102001)>「创生」</material>：\n「初禅净天·始动」：神能为满时，消耗全部神能才可施放，造成共计<color=#E78300>{1}</color>攻击力的风属性伤害，施放后的短暂时间内，该技能会替换为「初禅净天·显形」，「初禅净天·显形」仅衔接在「初禅净天·始动」之后才可施放。\n「初禅净天·显形」：造成共计<color=#E78300>{2}</color>攻击力的风属性伤害。\n\n处于<material=underline c=#FFFFFF h=2 event=terminology args=(102002)>「毁灭」</material>：\n「初禅净天·崩解」：神能为满时，消耗全部神能才可施放，造成共计<color=#E78300>{3}</color>攻击力的风属性伤害，施放后的短暂时间内，该技能会替换为「初禅净天·湮灭」，「初禅净天·湮灭」仅衔接在「初禅净天·崩解」之后才可施放。\n「初禅净天·湮灭」：造成共计<color=#E78300>{4}</color>攻击力的风属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101020203,
		extra_param = "",
		param = {
			{
				800,
				20.51,
				true,
				"%"
			},
			{
				1200,
				30.768,
				true,
				"%"
			},
			{
				1200,
				30.769,
				true,
				"%"
			},
			{
				1800,
				46.152,
				true,
				"%"
			}
		}
	},
	[101020208] = {
		description = "三相·梵天与伐灭·伽梨的连携奥义。\n三相·梵天造成<color=#E78300>{1}+{2}</color>×<color=#297DE0>自身奥义等级</color>攻击力的风属性伤害；自身切换为<material=underline c=#FFFFFF h=2 event=terminology args=(102002)>「毁灭」</material>。\n伐灭·伽梨造成<color=#E78300>{3}+{4}</color>×<color=#297DE0>自身奥义等级</color>攻击力的雷属性伤害；命中时全队伍近战伤害提高<color=#E78300>{5}</color>，持续<color=#E78300>{6}</color>秒，对敌人附加雷属性抗性降低<color=#E78300>{7}</color>，持续<color=#E78300>{8}</color>秒。",
		maxLv = 60,
		type = 1,
		id = 101020208,
		extra_param = "",
		param = {
			{
				1200,
				0,
				false,
				"%"
			},
			{
				30.769,
				0,
				false,
				"%"
			},
			{
				1000,
				0,
				false,
				"%"
			},
			{
				25.641,
				0,
				false,
				"%"
			},
			{
				15,
				0,
				false,
				"%"
			},
			{
				20,
				0,
				false,
				""
			},
			{
				20,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			}
		}
	},
	[101020209] = {
		description = "处于<material=underline c=#FFFFFF h=2 event=terminology args=(102001)>「创生」</material>：\n造成共计<color=#E78300>{1}</color>攻击力的风属性伤害，自身切换为<material=underline c=#FFFFFF h=2 event=terminology args=(102002)>「毁灭」</material>。\n切换为<material=underline c=#FFFFFF h=2 event=terminology args=(102002)>「毁灭」</material>时，重置<material=underline c=#FFFFFF h=2 event=terminology args=(102003)>「梵」</material>点数，重置自身奥义的冷却时间，解除连携奥义。\n\n处于<material=underline c=#FFFFFF h=2 event=terminology args=(102002)>「毁灭」</material>：\n造成共计<color=#E78300>{2}</color>攻击力的风属性伤害，自身切换为<material=underline c=#FFFFFF h=2 event=terminology args=(102001)>「创生」</material>。\n切换为<material=underline c=#FFFFFF h=2 event=terminology args=(102001)>「创生」</material>时，重置<material=underline c=#FFFFFF h=2 event=terminology args=(102003)>「梵」</material>点数、闪避效果的冷却时间，重置自身和与自身预组合连携奥义的修正者奥义值、奥义的冷却时间，恢复连携奥义。\n\n众星神系修正者攻击命中后，根据出场时队伍众星神系修正者的数量，依次获得<color=#E78300>2%、3%、4%</color>的奥义值，该效果每<color=#E78300>2</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101020209,
		extra_param = "",
		param = {
			{
				1200,
				30.769,
				true,
				"%"
			},
			{
				2000,
				51.282,
				true,
				"%"
			}
		}
	},
	[101020305] = {
		description = "极限闪避不会触发闪避效果。\n处于<material=underline c=#FFFFFF h=2 event=terminology args=(102001)>「创生」</material>并且闪避效果不处于冷却状态时，可以长按闪避施放技能：触发闪避效果；全队伍攻击力提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒；全队伍恢复<color=#E78300>70%</color>的奥义值；自身获得<color=#E78300>20</color>点神能。施放后可以衔接普通攻击，会从普通攻击第三段开始攻击，衔接施放的普通攻击第三、第四、第五段每次命中时额外获得<color=#E78300>5</color>点<material=underline c=#FFFFFF h=2 event=terminology args=(102003)>「梵」</material>。\n闪避效果：进入零时空间使全场敌人动作大幅减速，持续<color=#E78300>4</color>秒；闪避效果每<color=#E78300>{3}</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101020305,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			},
			{
				33,
				0,
				false,
				""
			},
			{
				20,
				0,
				false,
				""
			}
		}
	},
	[101021101] = {
		description = "造成共计<color=#E78300>{1}</color>攻击力的物理属性伤害。\n\n处于<material=underline c=#FFFFFF h=2 event=terminology args=(102102)>「朝晖」</material>状态时：\n状态期间内每<color=#E78300>0.1</color>秒消耗<color=#E78300>1%</color><material=underline c=#FFFFFF h=2 event=terminology args=(102101)>「辉音」</material>，禁用技能、奥义，获得硬直效果。\n可以连续点击普通攻击施放五段攻击，造成共计<color=#E78300>{2}</color>攻击力的物理属性伤害，施放第五段攻击时会消耗全部怒气，每消耗<color=#E78300>1</color>点怒气，该攻击命中瞬间攻击力提高<color=#E78300>0.2%</color>。\n<material=underline c=#FFFFFF h=2 event=terminology args=(102101)>「辉音」</material>不为<color=#E78300>0</color>时，施放普通攻击的第四段后，可通过长按普通攻击开启一次特殊普通攻击，施放特殊普通攻击期间也可继续长按或点按，造成共计<color=#E78300>{3}</color>攻击力的物理属性伤害，施放特殊普通攻击后继续衔接普通攻击，会从第五段开始攻击。\n<material=underline c=#FFFFFF h=2 event=terminology args=(102101)>「辉音」</material>为<color=#E78300>0</color>时，长按普通攻击，消耗全部怒气，退出<material=underline c=#FFFFFF h=2 event=terminology args=(102102)>「朝晖」</material>状态，造成共计<color=#E78300>{4}</color>攻击力的物理属性伤害，对锁定的敌人附加动作迟缓至<color=#E78300>50%</color>，持续<color=#E78300>{5}</color>秒。\n\n被动：\n自身不会自动获得奥义值，<material=underline c=#FFFFFF h=2 event=terminology args=(102101)>「辉音」</material>为满时，恢复满奥义值。\n施放「黎明四重奏」、「拂晓狂想曲」时获得硬直效果。\n\n<color=#297DE0>怒气：</color>不处于<material=underline c=#FFFFFF h=2 event=terminology args=(102102)>「朝晖」</material>状态，普通攻击命中后会获得怒气；处于<material=underline c=#FFFFFF h=2 event=terminology args=(102102)>「朝晖」</material>状态，特殊普通攻击命中后会获得怒气。",
		maxLv = 60,
		type = 1,
		id = 101021101,
		extra_param = "",
		param = {
			{
				522,
				10.578,
				true,
				"%"
			},
			{
				784,
				15.188,
				true,
				"%"
			},
			{
				3160,
				60.813,
				true,
				"%"
			},
			{
				2400,
				61.532,
				true,
				"%"
			},
			{
				3,
				0,
				false,
				""
			}
		}
	},
	[101021201] = {
		description = "点击依次造成<color=#E78300>{1}、{2}、{3}、{4}</color>攻击力的物理属性伤害，每段攻击命中锁定的敌人时，对锁定的敌人附加<material=underline c=#FFFFFF h=2 event=terminology args=(102103)>「和弦」</material>状态，最多可叠加<color=#E78300>4</color>层；处于<material=underline c=#FFFFFF h=2 event=terminology args=(102103)>「和弦」</material>状态的敌人被击败时，每有<color=#E78300>1</color>层<material=underline c=#FFFFFF h=2 event=terminology args=(102103)>「和弦」</material>，获得<color=#E78300>6.25%</color>的<material=underline c=#FFFFFF h=2 event=terminology args=(102101)>「辉音」</material>；退出<material=underline c=#FFFFFF h=2 event=terminology args=(102102)>「朝晖」</material>状态时，该技能重置为第一段。",
		maxLv = 60,
		type = 1,
		id = 101021201,
		extra_param = "",
		param = {
			{
				100,
				2.564,
				true,
				"%"
			},
			{
				200,
				5.128,
				true,
				"%"
			},
			{
				300,
				7.692,
				true,
				"%"
			},
			{
				400,
				10.256,
				true,
				"%"
			}
		}
	},
	[101021202] = {
		description = "造成共计<color=#E78300>{1}</color>攻击力的物理属性伤害，命中处于<material=underline c=#FFFFFF h=2 event=terminology args=(102103)>「和弦」</material>状态的敌人时，清除<material=underline c=#FFFFFF h=2 event=terminology args=(102103)>「和弦」</material>，每清除<color=#E78300>1</color>层<material=underline c=#FFFFFF h=2 event=terminology args=(102103)>「和弦」</material>，获得<color=#E78300>6.25%</color>的<material=underline c=#FFFFFF h=2 event=terminology args=(102101)>「辉音」</material>。",
		maxLv = 60,
		type = 1,
		id = 101021202,
		extra_param = "",
		param = {
			{
				1000,
				25.64,
				true,
				"%"
			}
		}
	},
	[101021203] = {
		description = "造成共计<color=#E78300>{1}</color>攻击力的物理属性伤害，施放时与锁定的敌人距离越远，命中瞬间基础伤害提高越高，该效果提供的基础伤害提高最高为<color=#E78300>200%</color>。「黎明四重奏」命中后<color=#E78300>3</color>秒内，该技能会替换为「拂晓狂想曲」。\n「拂晓狂想曲」：造成共计<color=#E78300>{2}</color>攻击力的物理属性伤害，最后一次攻击命中处于<material=underline c=#FFFFFF h=2 event=terminology args=(102103)>「和弦」</material>状态的敌人时，清除<material=underline c=#FFFFFF h=2 event=terminology args=(102103)>「和弦」</material>，每清除<color=#E78300>1</color>层<material=underline c=#FFFFFF h=2 event=terminology args=(102103)>「和弦」</material>，获得<color=#E78300>6.25%</color>的<material=underline c=#FFFFFF h=2 event=terminology args=(102101)>「辉音」</material>，该技能有<color=#E78300>7</color>秒的冷却时间。\n\n<color=#297DE0>怒气：</color>「拂晓交响曲」攻击命中后会根据施放时与锁定的敌人距离获得怒气。",
		maxLv = 60,
		type = 1,
		id = 101021203,
		extra_param = "",
		param = {
			{
				800,
				20.506,
				true,
				"%"
			},
			{
				1500,
				38.46,
				true,
				"%"
			}
		}
	},
	[101021208] = {
		description = "曦光·阿尔忒弥斯与铃兰之弦·雅典娜的连携奥义。\n曦光·阿尔忒弥斯造成<color=#E78300>{1}+{2}</color>×<color=#297DE0>自身奥义等级</color>攻击力的物理属性伤害；自身不处于<material=underline c=#FFFFFF h=2 event=terminology args=(102102)>「朝晖」</material>状态时，进入<material=underline c=#FFFFFF h=2 event=terminology args=(102102)>「朝晖」</material>状态，进入<material=underline c=#FFFFFF h=2 event=terminology args=(102102)>「朝晖」</material>状态时全队伍普通攻击命中瞬间会心率提高<color=#E78300>8.2%+0.2%</color>×<color=#297DE0>自身奥义等级</color>，持续<color=#E78300>14</color>秒。\n铃兰之弦·雅典娜造成<color=#E78300>{3}+{4}</color>×<color=#297DE0>自身奥义等级</color>攻击力的物理属性伤害；施放时自身恢复满神能，重置<material=underline c=#FFFFFF h=2 event=terminology args=(104103)>「谐律」</material>层数，进入<material=underline c=#FFFFFF h=2 event=terminology args=(104101)>「鸣刃」</material>状态，该次<material=underline c=#FFFFFF h=2 event=terminology args=(104101)>「鸣刃」</material>状态期间「铃兰剑艺」每次判定成功时，队友周身也会产生一次「谐律音爆」；施放时全队伍普通攻击伤害提高<color=#E78300>20%+1%</color>×<color=#297DE0>自身奥义等级</color>，持续<color=#E78300>{5}</color>秒；自身受到的伤害降低<color=#E78300>{6}</color>，持续<color=#E78300>{7}</color>秒。",
		maxLv = 60,
		type = 1,
		id = 101021208,
		extra_param = "",
		param = {
			{
				960,
				48,
				true,
				"%"
			},
			{
				24.615,
				1.231,
				true,
				"%"
			},
			{
				960,
				48,
				true,
				"%"
			},
			{
				24.615,
				1.231,
				true,
				"%"
			},
			{
				14,
				0,
				false,
				""
			},
			{
				40,
				0,
				false,
				"%"
			},
			{
				20,
				0,
				false,
				""
			}
		}
	},
	[101021209] = {
		description = "自身进入<material=underline c=#FFFFFF h=2 event=terminology args=(102102)>「朝晖」</material>状态，进入<material=underline c=#FFFFFF h=2 event=terminology args=(102102)>「朝晖」</material>状态时全队伍普通攻击命中瞬间会心率提高<color=#E78300>{1}</color>，持续<color=#E78300>14</color>秒。",
		maxLv = 60,
		type = 1,
		id = 101021209,
		extra_param = "",
		param = {
			{
				8.4,
				0.2,
				true,
				"%"
			}
		}
	},
	[101021305] = {
		description = "快速闪避敌人攻击，极限闪避会触发闪避效果。不处于<material=underline c=#FFFFFF h=2 event=terminology args=(102102)>「朝晖」</material>状态，极限闪避后<color=#E78300>2</color>秒内点击普通攻击，会改变普通攻击第一段的攻击模式造成共计<color=#E78300>{1}</color>攻击力的物理属性伤害，继续衔接普通攻击，会从普通攻击第二段开始攻击。\n闪避效果：进入零时空间使全场敌人动作大幅减速，持续<color=#E78300>3</color>秒；闪避效果每<color=#E78300>{2}</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101021305,
		extra_param = "",
		param = {
			{
				262,
				5.688,
				true,
				"%"
			},
			{
				20,
				0,
				false,
				""
			}
		}
	},
	[101022101] = {
		description = "处于<material=underline c=#FFFFFF h=2 event=terminology args=(102201)>「新月」</material>：\n造成共计<color=#E78300>{1}</color>攻击力的暗属性伤害，施放普通攻击第三段时，「新月落影·和声」替换为「新月落影·奏鸣」、「新月银辉·和声」替换为「新月银辉·奏鸣」；不处于<material=underline c=#FFFFFF h=2 event=terminology args=(102207)>「满月幽幕」</material>状态，普通攻击第五段命中后，获得<color=#E78300>20</color>点<material=underline c=#FFFFFF h=2 event=terminology args=(102203)>「月相」</material>。\n\n处于<material=underline c=#FFFFFF h=2 event=terminology args=(102202)>「满月」</material>：\n造成共计<color=#E78300>{2}</color>攻击力的暗属性伤害，施放普通攻击第五段时，「满月落影·和声」替换为「满月落影·奏鸣」、「满月银辉·和声」替换为「满月银辉·奏鸣」。\n\n被动：\n<material=underline c=#FFFFFF h=2 event=terminology args=(102203)>「月相」</material>上限<color=#E78300>100</color>点。有技能替换为<material=underline c=#FFFFFF h=2 event=terminology args=(102206)>「挽歌」</material>时，另一个技能不会替换为<material=underline c=#FFFFFF h=2 event=terminology args=(102205)>「奏鸣」</material>。\n\n<color=#297DE0>神能：</color>普通攻击命中后会获得神能。",
		maxLv = 60,
		type = 1,
		id = 101022101,
		extra_param = "",
		param = {
			{
				582,
				11.292,
				true,
				"%"
			},
			{
				846,
				16.338,
				true,
				"%"
			}
		}
	},
	[101022201] = {
		description = "处于<material=underline c=#FFFFFF h=2 event=terminology args=(102201)>「新月」</material>：\n「新月落影·和声」：造成共计<color=#E78300>{1}</color>攻击力的暗属性伤害。\n「新月落影·奏鸣」：造成共计<color=#E78300>{2}</color>攻击力的暗属性伤害，施放时会生成一片法阵区域，持续<color=#E78300>8</color>秒，对区域内的敌人附加动作迟缓至<color=#E78300>50%</color>，施放后<color=#E78300>8</color>秒内该技能替换为「新月落影·挽歌」。\n「新月落影·挽歌」：施放时会消耗全部神能，引爆法阵，造成<color=#E78300>{3}</color>攻击力的暗属性伤害，每消耗<color=#E78300>1</color>点神能，该技能命中瞬间基础伤害提高<color=#E78300>0.4%</color>。\n施放技能命中后会获得<color=#E78300>20</color>点<material=underline c=#FFFFFF h=2 event=terminology args=(102203)>「月相」</material>，「新月落影·挽歌」消耗神能不低于<color=#E78300>50</color>点时，额外获得<color=#E78300>20</color>点<material=underline c=#FFFFFF h=2 event=terminology args=(102203)>「月相」</material>。\n\n处于<material=underline c=#FFFFFF h=2 event=terminology args=(102202)>「满月」</material>：\n「满月落影·和声」：造成共计<color=#E78300>{4}</color>攻击力的暗属性伤害。\n「满月落影·奏鸣」：造成共计<color=#E78300>{5}</color>攻击力的暗属性伤害，施放时生成一个球体，持续聚集敌人，持续<color=#E78300>8</color>秒，球体造成共计<color=#E78300>{6}</color>攻击力的暗属性伤害；施放后<color=#E78300>8</color>秒内该技能替换为「满月落影·挽歌」。\n「满月落影·挽歌」：施放时会消耗全部神能，引爆球体，造成<color=#E78300>{7}</color>攻击力的暗属性伤害，每消耗<color=#E78300>1</color>点神能，该技能命中瞬间基础伤害提高<color=#E78300>0.4%</color>。\n\n<color=#297DE0>神能：</color>「新月落影·和声」、「满月落影·和声」每次命中后会获得神能。",
		maxLv = 60,
		type = 1,
		id = 101022201,
		extra_param = "",
		param = {
			{
				600,
				15.381,
				true,
				"%"
			},
			{
				1200,
				30.765,
				true,
				"%"
			},
			{
				1500,
				38.461,
				true,
				"%"
			},
			{
				1000,
				25.64,
				true,
				"%"
			},
			{
				1200,
				30.764,
				true,
				"%"
			},
			{
				300,
				7.69,
				true,
				"%"
			},
			{
				2000,
				51.282,
				true,
				"%"
			}
		}
	},
	[101022202] = {
		description = "处于<material=underline c=#FFFFFF h=2 event=terminology args=(102201)>「新月」</material>：\n「新月银辉·和声」：造成共计<color=#E78300>{1}</color>攻击力的暗属性伤害。\n「新月银辉·奏鸣」：造成共计<color=#E78300>{2}</color>攻击力的暗属性伤害，对第一个命中的敌人附加标记，持续<color=#E78300>8</color>秒，施放后<color=#E78300>8</color>秒内该技能替换为「新月银辉·挽歌」。\n「新月银辉·挽歌」：瞬移到有标记的敌人的位置，施放时会消耗全部神能，造成<color=#E78300>{3}</color>攻击力的暗属性伤害，每消耗<color=#E78300>1</color>点神能，该技能命中瞬间基础伤害提高<color=#E78300>0.4%</color>。\n施放技能命中后会获得<color=#E78300>20</color>点<material=underline c=#FFFFFF h=2 event=terminology args=(102203)>「月相」</material>，「新月银辉·挽歌」消耗神能不低于<color=#E78300>50</color>点时，额外获得<color=#E78300>20</color>点<material=underline c=#FFFFFF h=2 event=terminology args=(102203)>「月相」</material>。\n\n处于<material=underline c=#FFFFFF h=2 event=terminology args=(102202)>「满月」</material>：\n「满月银辉·和声」：造成共计<color=#E78300>{4}</color>攻击力的暗属性伤害。\n「满月银辉·奏鸣」：造成共计<color=#E78300>{5}</color>攻击力的暗属性伤害，施放时生成一个球体，每<color=#E78300>1</color>秒对周围的敌人造成<color=#E78300>{6}</color>攻击力的暗属性伤害，持续<color=#E78300>8</color>秒，球体结束时造成<color=#E78300>{7}</color>攻击力的暗属性伤害；施放后<color=#E78300>8</color>秒内该技能替换为「满月银辉·挽歌」。\n「满月银辉·挽歌」：施放时会消耗全部神能，引爆球体，造成共计<color=#E78300>{8}</color>攻击力的暗属性伤害，每消耗<color=#E78300>1</color>点神能，该技能命中瞬间基础伤害提高<color=#E78300>0.4%</color>。\n\n<color=#297DE0>神能：</color>「新月银辉·和声」、「满月银辉·和声」每次命中后会获得神能。",
		maxLv = 60,
		type = 1,
		id = 101022202,
		extra_param = "",
		param = {
			{
				1200,
				30.765,
				true,
				"%"
			},
			{
				500,
				12.82,
				true,
				"%"
			},
			{
				500,
				12.82,
				true,
				"%"
			},
			{
				1000,
				25.64,
				true,
				"%"
			},
			{
				1500,
				38.46,
				true,
				"%"
			},
			{
				100,
				2.564,
				true,
				"%"
			},
			{
				200,
				5.128,
				true,
				"%"
			},
			{
				3000,
				76.922,
				true,
				"%"
			}
		}
	},
	[101022203] = {
		description = "处于<material=underline c=#FFFFFF h=2 event=terminology args=(102201)>「新月」</material>：\n<material=underline c=#FFFFFF h=2 event=terminology args=(102203)>「月相」</material>为满时才可施放，自身切换为<material=underline c=#FFFFFF h=2 event=terminology args=(102202)>「满月」</material>，「新月落影」替换为「满月落影·和声」、「新月银辉」替换为「满月银辉·和声」，获得<material=underline c=#FFFFFF h=2 event=terminology args=(102207)>「满月幽幕」</material>状态。\n<material=underline c=#FFFFFF h=2 event=terminology args=(102207)>「满月幽幕」</material>：攻击力提高<color=#E78300>{2}</color>、会心率提高<color=#E78300>{3}</color>、受到的伤害降低<color=#E78300>{4}</color>、获得霸体效果。\n\n处于<material=underline c=#FFFFFF h=2 event=terminology args=(102202)>「满月」</material>：\n每<color=#E78300>0.12</color>秒消耗<color=#E78300>1</color>点<material=underline c=#FFFFFF h=2 event=terminology args=(102203)>「月相」</material>。\n<material=underline c=#FFFFFF h=2 event=terminology args=(102203)>「月相」</material>为<color=#E78300>0</color>点时，退出<material=underline c=#FFFFFF h=2 event=terminology args=(102207)>「满月幽幕」</material>状态。\n<material=underline c=#FFFFFF h=2 event=terminology args=(102203)>「月相」</material>为<color=#E78300>0</color>点时才可施放，自身切换为<material=underline c=#FFFFFF h=2 event=terminology args=(102201)>「新月」</material>，「满月落影」替换为「新月落影·和声」、「满月银辉」替换为「新月银辉·和声」，造成<color=#E78300>{1}</color>攻击力的暗属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101022203,
		extra_param = "",
		param = {
			{
				3600,
				92.307,
				true,
				"%"
			},
			{
				15,
				0,
				false,
				"%"
			},
			{
				15,
				0,
				false,
				"%"
			},
			{
				90,
				0,
				false,
				"%"
			}
		}
	},
	[101022208] = {
		description = "幽月·塞勒涅与操偶师·哈迪斯的连携奥义。\n幽月·塞勒涅造成<color=#E78300>{1}+{2}</color>×<color=#297DE0>自身奥义等级</color>攻击力的暗属性伤害；施放时，根据自身形态生成对应的<material=underline c=#FFFFFF h=2 event=terminology args=(102208)>「新月月华」</material>或<material=underline c=#FFFFFF h=2 event=terminology args=(102209)>「满月皓光」</material>；全队伍技能伤害提高<color=#E78300>{5}</color>，持续<color=#E78300>{6}</color>秒。\n操偶师·哈迪斯造成<color=#E78300>{3}+{4}</color>×<color=#297DE0>自身奥义等级</color>攻击力的暗属性伤害；施放时，当自身神能点数发生变化时，神能立即回到<color=#E78300>50</color>点，持续<color=#E78300>48</color>秒；全队伍会心率提高<color=#E78300>{7}</color>，持续<color=#E78300>{8}</color>秒，独立伤害提高<color=#E78300>{9}</color>，持续<color=#E78300>{10}</color>秒。\n该连携奥义有<color=#E78300>40</color>秒的冷却时间，该冷却时间不受其他属性影响。",
		maxLv = 60,
		type = 1,
		id = 101022208,
		extra_param = "",
		param = {
			{
				2400,
				0,
				false,
				"%"
			},
			{
				61.538,
				0,
				false,
				"%"
			},
			{
				2400,
				0,
				false,
				"%"
			},
			{
				61.538,
				0,
				false,
				"%"
			},
			{
				24,
				0,
				false,
				"%"
			},
			{
				24,
				0,
				false,
				""
			},
			{
				12,
				0,
				false,
				"%"
			},
			{
				48,
				0,
				false,
				""
			},
			{
				12,
				0,
				false,
				"%"
			},
			{
				24,
				0,
				false,
				""
			}
		}
	},
	[101022209] = {
		description = "处于<material=underline c=#FFFFFF h=2 event=terminology args=(102201)>「新月」</material>：\n造成<color=#E78300>{1}</color>攻击力的暗属性伤害，生成一个<material=underline c=#FFFFFF h=2 event=terminology args=(102208)>「新月月华」</material>，持续<color=#E78300>24</color>秒。\n<material=underline c=#FFFFFF h=2 event=terminology args=(102208)>「新月月华」</material>：持续嘲讽一定范围内的普通敌人和精英敌人。\n\n处于<material=underline c=#FFFFFF h=2 event=terminology args=(102202)>「满月」</material>：\n造成<color=#E78300>{1}</color>攻击力的暗属性伤害，生成一个<material=underline c=#FFFFFF h=2 event=terminology args=(102209)>「满月皓光」</material>，持续<color=#E78300>24</color>秒。\n<material=underline c=#FFFFFF h=2 event=terminology args=(102209)>「满月皓光」</material>：对一定范围内最多<color=#E78300>3</color>个敌人附加<material=underline c=#FFFFFF h=2 event=terminology args=(102210)>「月蚀」</material>状态。\n<material=underline c=#FFFFFF h=2 event=terminology args=(102210)>「月蚀」</material>：敌人受到伤害时，会给其他处于该状态的敌人附加伤害，附加原本伤害的<color=#E78300>30%</color>的暗属性伤害。\n\n出场时，自身和与自身预组合连携奥义的修正者恢复<color=#E78300>35%</color>的奥义值。\n\n自身或者队友攻击造成会心后，获得<color=#E78300>3%</color>的奥义值，该效果每<color=#E78300>2</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101022209,
		extra_param = "",
		param = {
			{
				2400,
				61.538,
				true,
				"%"
			}
		}
	},
	[101022305] = {
		description = "快速闪避敌人攻击，极限闪避会触发闪避效果。处于<material=underline c=#FFFFFF h=2 event=terminology args=(102202)>「满月」</material>时，闪避不会打断普通攻击的连段。极限闪避时，获得硬直效果，持续<color=#E78300>{1}</color>秒。\n闪避效果：进入零时空间使全场敌人动作大幅减速，持续<color=#E78300>3</color>秒；闪避效果每<color=#E78300>{2}</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101022305,
		extra_param = "",
		param = {
			{
				4,
				0,
				false,
				""
			},
			{
				19,
				0,
				false,
				""
			}
		}
	},
	[101024101] = {
		description = "连续攻击，造成共计<color=#E78300>{1}</color>攻击力的暗属性伤害。\n<material=underline c=#FFFFFF h=2 event=terminology args=(102401)>「狼魂」</material>的协同攻击：造成共计<color=#E78300>{2}</color>攻击力的暗属性伤害。\n\n被动：\n<material=underline c=#FFFFFF h=2 event=terminology args=(102401)>「狼魂」</material>会自动攻击其锁定的敌人，随机发动普通攻击的协同攻击或技能的协同攻击，直至敌人被击败。当自身与<material=underline c=#FFFFFF h=2 event=terminology args=(102401)>「狼魂」</material>目标不同，自身施放技能命中时，<material=underline c=#FFFFFF h=2 event=terminology args=(102401)>「狼魂」</material>都会转移目标攻击自身锁定的敌人。<material=underline c=#FFFFFF h=2 event=terminology args=(102401)>「狼魂」</material>发动的协同攻击不视为自身的施放技能。<material=underline c=#FFFFFF h=2 event=terminology args=(102401)>「狼魂」</material>最多在场上存在<color=#E78300>30</color>秒，当<material=underline c=#FFFFFF h=2 event=terminology args=(102401)>「狼魂」</material>锁定的敌人被击败后，<material=underline c=#FFFFFF h=2 event=terminology args=(102401)>「狼魂」</material>会立即消失。\n\n<color=#297DE0>怒气：</color>普通攻击命中后会获得怒气。",
		maxLv = 60,
		type = 1,
		id = 101024101,
		extra_param = "",
		param = {
			{
				319,
				6.407,
				true,
				"%"
			},
			{
				300,
				5.768,
				true,
				"%"
			}
		}
	},
	[101024201] = {
		description = "凝聚神力对目标进行远程冲击，造成共计<color=#E78300>{1}</color>攻击力的暗属性伤害，命中时自身会心率提高<color=#E78300>{2}</color>，持续<color=#E78300>{3}</color>秒；当<material=underline c=#FFFFFF h=2 event=terminology args=(102401)>「狼魂」</material>在场上时，该技能额外造成<color=#E78300>{4}</color>攻击力的暗属性伤害，命中时技能三会替换为「狼魂凝视」；<material=underline c=#FFFFFF h=2 event=terminology args=(102401)>「狼魂」</material>会立即对自身锁定的敌人发动协同攻击。\n<material=underline c=#FFFFFF h=2 event=terminology args=(102401)>「狼魂」</material>的协同攻击：造成共计<color=#E78300>{5}</color>攻击力的暗属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101024201,
		extra_param = "",
		param = {
			{
				700,
				17.945,
				true,
				"%"
			},
			{
				15,
				0,
				false,
				"%"
			},
			{
				4,
				0,
				false,
				""
			},
			{
				200,
				5.128,
				true,
				"%"
			},
			{
				600,
				15.384,
				true,
				"%"
			}
		}
	},
	[101024202] = {
		description = "凝聚神力对目标进行环形切割，造成共计<color=#E78300>{1}</color>攻击力的暗属性伤害，命中时自身暗属性伤害提高<color=#E78300>{2}</color>，持续<color=#E78300>{3}</color>秒；当<material=underline c=#FFFFFF h=2 event=terminology args=(102401)>「狼魂」</material>在场上时，该技能额外造成<color=#E78300>{4}</color>攻击力的暗属性伤害，命中时技能三会替换为「狼魂狂斩」；<material=underline c=#FFFFFF h=2 event=terminology args=(102401)>「狼魂」</material>会立即对自身锁定的敌人发动协同攻击。\n<material=underline c=#FFFFFF h=2 event=terminology args=(102401)>「狼魂」</material>的协同攻击：造成共计<color=#E78300>{5}</color>攻击力的暗属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101024202,
		extra_param = "",
		param = {
			{
				700,
				17.943,
				true,
				"%"
			},
			{
				20,
				0,
				false,
				"%"
			},
			{
				4,
				0,
				false,
				""
			},
			{
				600,
				15.384,
				true,
				"%"
			},
			{
				600,
				15.383,
				true,
				"%"
			}
		}
	},
	[101024203] = {
		description = "当场上没有<material=underline c=#FFFFFF h=2 event=terminology args=(102401)>「狼魂」</material>时，召唤<material=underline c=#FFFFFF h=2 event=terminology args=(102401)>「狼魂」</material>并攻击自身锁定的敌人，召唤时自身对周围造成共计<color=#E78300>{1}</color>攻击力的暗属性伤害、<material=underline c=#FFFFFF h=2 event=terminology args=(102401)>「狼魂」</material>对周围造成共计<color=#E78300>{2}</color>攻击力的暗属性伤害。<material=underline c=#FFFFFF h=2 event=terminology args=(102401)>「狼魂」</material>已经存在于场上时，该技能会替换为「狼魂凝视」。\n「狼魂凝视」：造成共计<color=#E78300>{3}</color>攻击力的暗属性伤害，<material=underline c=#FFFFFF h=2 event=terminology args=(102401)>「狼魂」</material>会立即对自身锁定的敌人发动协同攻击，技能命中时会触发射线追击，造成共计<color=#E78300>{4}</color>攻击力的暗属性伤害；「狼魂凝视」有<color=#E78300>8</color>秒的冷却时间。\n「狼魂狂斩」：造成共计<color=#E78300>{5}</color>攻击力的暗属性伤害，<material=underline c=#FFFFFF h=2 event=terminology args=(102401)>「狼魂」</material>会立即对自身锁定的敌人发动协同攻击，技能命中时会触发狼爪追击，造成共计<color=#E78300>{6}</color>攻击力的暗属性伤害；「狼魂狂斩」有<color=#E78300>8</color>秒的冷却时间。\n<material=underline c=#FFFFFF h=2 event=terminology args=(102401)>「狼魂」</material>的协同攻击：接近敌人并造成共计<color=#E78300>{7}</color>攻击力的暗属性伤害。\n当自身施放「狼魂引渡」、「狼魂凝视」或「狼魂狂斩」时，<material=underline c=#FFFFFF h=2 event=terminology args=(102401)>「狼魂」</material>会继承自身当前属性。",
		maxLv = 60,
		type = 1,
		id = 101024203,
		extra_param = "",
		param = {
			{
				100,
				2.563,
				true,
				"%"
			},
			{
				600,
				15.384,
				true,
				"%"
			},
			{
				600,
				15.384,
				true,
				"%"
			},
			{
				600,
				15.384,
				true,
				"%"
			},
			{
				600,
				15.384,
				true,
				"%"
			},
			{
				600,
				15.384,
				true,
				"%"
			},
			{
				1200,
				30.767,
				true,
				"%"
			}
		}
	},
	[101024208] = {
		description = "胡狼·阿努比斯与狂鳄·索贝克的连携奥义。\n胡狼·阿努比斯造成<color=#E78300>{1}+{2}</color>×<color=#297DE0>自身奥义等级</color>攻击力的暗属性伤害；自身与<material=underline c=#FFFFFF h=2 event=terminology args=(102401)>「狼魂」</material>合体，持续<color=#E78300>15</color>秒；施放时，重置自身技能的冷却时间；命中时全队伍攻击力提高<color=#E78300>{5}</color>、奥义获得率提高<color=#E78300>{8}</color>，持续<color=#E78300>{6}</color>秒。\n狂鳄·索贝克造成<color=#E78300>{3}+{4}</color>×<color=#297DE0>自身奥义等级</color>攻击力的水属性伤害；命中时全队伍近战伤害提高<color=#E78300>{7}</color>，持续<color=#E78300>{6}</color>秒。",
		maxLv = 60,
		type = 1,
		id = 101024208,
		extra_param = "",
		param = {
			{
				1160,
				0,
				false,
				"%"
			},
			{
				29.744,
				0,
				false,
				"%"
			},
			{
				480,
				0,
				false,
				"%"
			},
			{
				12.308,
				0,
				false,
				"%"
			},
			{
				45,
				0,
				false,
				"%"
			},
			{
				15,
				0,
				false,
				""
			},
			{
				30,
				0,
				false,
				"%"
			},
			{
				60,
				0,
				false,
				"%"
			}
		}
	},
	[101024209] = {
		description = "仅当<material=underline c=#FFFFFF h=2 event=terminology args=(102401)>「狼魂」</material>在场上时可以施放。自身与<material=underline c=#FFFFFF h=2 event=terminology args=(102401)>「狼魂」</material>合体，持续<color=#E78300>15</color>秒，造成共计<color=#E78300>{1}</color>攻击力的暗属性伤害；施放时全队伍攻击力提高<color=#E78300>{2}</color>，持续<color=#E78300>{3}</color>秒；重置自身技能的冷却时间。\n与<material=underline c=#FFFFFF h=2 event=terminology args=(102401)>「狼魂」</material>合体期间，技能三会固定替换为「狼魂狂斩」，「狼魂狂斩」有<color=#E78300>8</color>秒的冷却时间；每次施放普通攻击或技能时，会触发额外攻击造成伤害。\n施放普通攻击第一段时，会触发刺击造成共计<color=#E78300>{4}</color>攻击力的暗属性伤害，刺击每<color=#E78300>2.5</color>秒最多触发一次。\n施放普通攻击其他段时，会触发爪击造成共计<color=#E78300>{5}</color>攻击力的暗属性伤害。\n施放「狼魂疾突」时，额外造成共计<color=#E78300>{6}</color>攻击力的暗属性伤害，命中时「狼魂疾突」的剩余冷却时间缩短<color=#E78300>5</color>秒。\n施放「狼魂狂舞」时，额外造成共计<color=#E78300>{7}</color>攻击力的暗属性伤害，命中时「狼魂狂舞」的剩余冷却时间缩短<color=#E78300>5</color>秒。\n施放「狼魂狂斩」时，额外造成共计<color=#E78300>{8}</color>攻击力的暗属性伤害。\n\n队友、<material=underline c=#FFFFFF h=2 event=terminology args=(102401)>「狼魂」</material>击败敌人或<material=underline c=#FFFFFF h=2 event=terminology args=(102401)>「狼魂」</material>的协同攻击命中时，获得<color=#E78300>2.5%</color>的奥义值，该效果每<color=#E78300>2</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101024209,
		extra_param = "",
		param = {
			{
				1160,
				29.74,
				true,
				"%"
			},
			{
				35,
				0,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				""
			},
			{
				237,
				6.09,
				true,
				"%"
			},
			{
				180,
				4.615,
				true,
				"%"
			},
			{
				360,
				9.228,
				true,
				"%"
			},
			{
				360,
				9.23,
				true,
				"%"
			},
			{
				360,
				9.23,
				true,
				"%"
			}
		}
	},
	[101024281] = {
		description = "怒蛇·马尔杜克与胡狼·阿努比斯的连携奥义。\n怒蛇·马尔杜克造成<color=#E78300>{1}+{2}</color>×<color=#297DE0>自身奥义等级</color>攻击力的物理属性伤害；命中时全队伍受到的伤害降低<color=#E78300>{5}</color>，持续<color=#E78300>{6}</color>秒，对命中的敌人附加破甲状态，防御力降低<color=#E78300>{7}</color>，持续<color=#E78300>{8}</color>秒。\n胡狼·阿努比斯造成<color=#E78300>{3}+{4}</color>×<color=#297DE0>自身奥义等级</color>攻击力的暗属性伤害；自身与<material=underline c=#FFFFFF h=2 event=terminology args=(102401)>「狼魂」</material>合体，持续<color=#E78300>15</color>秒；施放时，重置自身技能的冷却时间，自身奥义的剩余冷却时间缩短<color=#E78300>5</color>秒；命中时全队伍攻击力提高<color=#E78300>{9}</color>，持续<color=#E78300>{10}</color>秒，自身会心伤害提高<color=#E78300>{11}</color>、暗属性伤害提高<color=#E78300>{12}</color>，持续<color=#E78300>{13}</color>秒。",
		maxLv = 60,
		type = 1,
		id = 101024281,
		extra_param = "",
		param = {
			{
				1160,
				0,
				false,
				"%"
			},
			{
				29.744,
				0,
				false,
				"%"
			},
			{
				1160,
				0,
				false,
				"%"
			},
			{
				29.744,
				0,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				"%"
			},
			{
				15,
				0,
				false,
				""
			},
			{
				25,
				0,
				false,
				"%"
			},
			{
				15,
				0,
				false,
				""
			},
			{
				35,
				0,
				false,
				"%"
			},
			{
				15,
				0,
				false,
				""
			},
			{
				50,
				0,
				false,
				"%"
			},
			{
				90,
				0,
				false,
				"%"
			},
			{
				15,
				0,
				false,
				""
			}
		}
	},
	[101024305] = {
		description = "快速闪避敌人攻击，极限闪避会触发闪避效果。极限闪避后<color=#E78300>1</color>秒内衔接普通攻击，会施放技能攻击对敌人造成共计<color=#E78300>{1}</color>攻击力的暗属性伤害，<material=underline c=#FFFFFF h=2 event=terminology args=(102401)>「狼魂」</material>会立即对自身锁定的敌人发动「狼魂狂舞」的协同攻击。\n闪避效果：获得<color=#E78300>20</color>点怒气；闪避效果每<color=#E78300>{2}</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101024305,
		extra_param = "",
		param = {
			{
				300,
				7.69,
				true,
				"%"
			},
			{
				14,
				0,
				false,
				""
			}
		}
	},
	[101026101] = {
		description = "对锁定的敌人进行连续攻击，造成共计<color=#E78300>{1}</color>攻击力的火属性伤害。\n\n<color=#297DE0>神能：</color>普通攻击命中后会获得神能。",
		maxLv = 60,
		type = 1,
		id = 101026101,
		extra_param = "",
		param = {
			{
				209,
				4.083,
				true,
				"%"
			}
		}
	},
	[101026201] = {
		description = "向锁定方向发射大量子弹，对范围内的敌人进行攻击，造成<color=#E78300>{1}</color>攻击力的火属性伤害。可通过长按进行最多<color=#E78300>2</color>段蓄力，每段蓄力消耗<color=#E78300>20</color>点神能并且该技能命中瞬间蓄力技能伤害提高<color=#E78300>30%</color>。满蓄力的「炎弹之雨」会对命中的敌人附加灼烧状态，持续<color=#E78300>{3}</color>秒。\n灼烧：每<color=#E78300>3</color>秒附加<color=#E78300>{2}</color>攻击力的火属性伤害，持续<color=#E78300>{3}</color>秒。",
		maxLv = 60,
		type = 1,
		id = 101026201,
		extra_param = "",
		param = {
			{
				320,
				8.205,
				true,
				"%"
			},
			{
				40,
				1,
				true,
				"%"
			},
			{
				13,
				0,
				false,
				""
			}
		}
	},
	[101026202] = {
		description = "锤击地面后，在锁定的敌人下方施放爆炸，对范围内的敌人进行攻击，造成<color=#E78300>{1}</color>攻击力的火属性伤害。可通过长按进行最多<color=#E78300>3</color>段蓄力，每段蓄力消耗<color=#E78300>25</color>点神能并且该技能命中瞬间蓄力技能伤害提高<color=#E78300>30%</color>。满蓄力后施放会额外产生两次更大的环形爆炸，三次爆炸造成共计<color=#E78300>{2}</color>攻击力的火属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101026202,
		extra_param = "",
		param = {
			{
				360,
				9.23,
				true,
				"%"
			},
			{
				1080,
				27.69,
				true,
				"%"
			}
		}
	},
	[101026203] = {
		description = "向目标方向喷射火焰，对范围内的敌人进行攻击，造成共计<color=#E78300>{1}</color>攻击力的火属性伤害。施放该技能时可进行缓慢移动。",
		maxLv = 60,
		type = 1,
		id = 101026203,
		extra_param = "",
		param = {
			{
				322,
				8.454,
				true,
				"%"
			}
		}
	},
	[101026208] = {
		description = "狂鳄·索贝克与银臂·努阿达的连携奥义。\n狂鳄·索贝克造成<color=#E78300>{1}+{2}</color>×<color=#297DE0>自身奥义等级</color>攻击力的水属性伤害；命中时全队伍近战伤害提高<color=#E78300>{5}</color>，持续<color=#E78300>{6}</color>秒。\n银臂·努阿达造成<color=#E78300>{3}+{4}</color>×<color=#297DE0>自身奥义等级</color>攻击力的火属性伤害；命中时全队伍获得<material=underline c=#FFFFFF h=2 event=terminology args=(102601)>「高能过载」</material>效果，持续<color=#E78300>10</color>秒。",
		maxLv = 60,
		type = 1,
		id = 101026208,
		extra_param = "",
		param = {
			{
				480,
				0,
				false,
				"%"
			},
			{
				12.308,
				0,
				false,
				"%"
			},
			{
				400,
				0,
				false,
				"%"
			},
			{
				10.256,
				0,
				false,
				"%"
			},
			{
				20,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			}
		}
	},
	[101026209] = {
		description = "锤击敌人，造成共计<color=#E78300>{1}</color>攻击力的火属性伤害；施放后全队伍获得<material=underline c=#FFFFFF h=2 event=terminology args=(102601)>「高能过载」</material>效果，持续<color=#E78300>10</color>秒。\n<material=underline c=#FFFFFF h=2 event=terminology args=(102601)>「高能过载」</material>：获得硬直效果，受击时对攻击者附加<color=#E78300>{2}</color>攻击力的火属性伤害。\n\n当敌人被附加灼烧状态时，获得<color=#E78300>8%</color>的奥义值，该效果每<color=#E78300>0.5</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101026209,
		extra_param = "",
		param = {
			{
				400,
				10.256,
				true,
				"%"
			},
			{
				50,
				0,
				false,
				"%"
			}
		}
	},
	[101026281] = {
		description = "龙切·迦具土与银臂·努阿达的连携奥义。\n龙切·迦具土造成<color=#E78300>{1}+{2}</color>×<color=#297DE0>自身奥义等级</color>攻击力的火属性伤害；命中时全队伍火属性伤害提高<color=#E78300>{5}</color>，持续<color=#E78300>{6}</color>秒。\n银臂·努阿达造成<color=#E78300>{3}+{4}</color>×<color=#297DE0>自身奥义等级</color>攻击力的火属性伤害；命中时全队伍获得<material=underline c=#FFFFFF h=2 event=terminology args=(102601)>「高能过载」</material>效果，持续<color=#E78300>10</color>秒。",
		maxLv = 60,
		type = 1,
		id = 101026281,
		extra_param = "",
		param = {
			{
				1150,
				0,
				false,
				"%"
			},
			{
				29.487,
				0,
				false,
				"%"
			},
			{
				400,
				0,
				false,
				"%"
			},
			{
				10.256,
				0,
				false,
				"%"
			},
			{
				70,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			}
		}
	},
	[101026305] = {
		description = "快速闪避敌人攻击，极限闪避会触发闪避效果。\n闪避效果：下一次施放的「炎弹之雨」或「地鸣爆弹」可直接达到满蓄力且不需要消耗神能；闪避效果每<color=#E78300>{1}</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101026305,
		extra_param = "",
		param = {
			{
				14,
				0,
				false,
				""
			}
		}
	},
	[101027101] = {
		description = "连续使用船锚打击敌人，造成共计<color=#E78300>{1}</color>攻击力的冰属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101027101,
		extra_param = "",
		param = {
			{
				256,
				4.949,
				true,
				"%"
			}
		}
	},
	[101027201] = {
		description = "向目标突进并打击敌人，造成共计<color=#E78300>{1}</color>攻击力的冰属性伤害。\n\n<color=#297DE0>印记：</color>每次施放命中后，获得<color=#E78300>{2}</color>个印记。",
		maxLv = 60,
		type = 1,
		id = 101027201,
		extra_param = "",
		param = {
			{
				110,
				2.82,
				true,
				"%"
			},
			{
				1,
				0,
				false,
				""
			}
		}
	},
	[101027202] = {
		description = "挥舞船锚对目标进行一次重击，造成共计<color=#E78300>{1}</color>攻击力的冰属性伤害。可通过长按进行蓄力，满蓄力后造成共计<color=#E78300>{2}</color>攻击力的冰属性伤害；当目标敌人在施放技能时处于冰冻状态，可直接达到满蓄力状态。\n\n<color=#297DE0>印记：</color>每次施放命中后，获得<color=#E78300>{3}</color>个印记。",
		maxLv = 60,
		type = 1,
		id = 101027202,
		extra_param = "",
		param = {
			{
				330,
				8.46,
				true,
				"%"
			},
			{
				660,
				16.922,
				true,
				"%"
			},
			{
				1,
				0,
				false,
				""
			}
		}
	},
	[101027203] = {
		description = "挥击船锚向前方击打出一排冰刺，造成共计<color=#E78300>{1}</color>攻击力的冰属性伤害，冰刺命中时，对命中的敌人附加冰冻状态，持续<color=#E78300>{2}</color>秒。",
		maxLv = 60,
		type = 1,
		id = 101027203,
		extra_param = "",
		param = {
			{
				329,
				8.46,
				true,
				"%"
			},
			{
				4.5,
				0,
				false,
				""
			}
		}
	},
	[101027208] = {
		description = "低吹雪·利维坦与寒霜之牙·维达尔的连携奥义。\n低吹雪·利维坦造成<color=#E78300>{1}+{2}</color>×<color=#297DE0>自身奥义等级</color>攻击力的冰属性伤害；对全场敌人附加冰冻状态，持续<color=#E78300>{6}</color>秒。\n寒霜之牙·维达尔造成<color=#E78300>{3}+{4}</color>×<color=#297DE0>自身奥义等级</color>攻击力的冰属性伤害；命中时对敌人附加冰属性抗性降低<color=#E78300>{5}</color>，持续<color=#E78300>{7}</color>秒。",
		maxLv = 60,
		type = 1,
		id = 101027208,
		extra_param = "",
		param = {
			{
				500,
				0,
				false,
				"%"
			},
			{
				12.821,
				0,
				false,
				"%"
			},
			{
				600,
				0,
				false,
				"%"
			},
			{
				15.385,
				0,
				false,
				"%"
			},
			{
				30,
				0,
				false,
				"%"
			},
			{
				5,
				0,
				false,
				""
			},
			{
				12,
				0,
				false,
				""
			}
		}
	},
	[101027209] = {
		description = "潜入地下并向锁定的敌人移动，到达目标点后跃起攻击，造成共计<color=#E78300>{1}</color>攻击力的冰属性伤害；命中时对敌人附加冰冻状态，持续<color=#E78300>{2}</color>秒。\n\n当敌人被附加冰冻状态时，获得<color=#E78300>8%</color>的奥义值，该效果每<color=#E78300>2</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101027209,
		extra_param = "",
		param = {
			{
				500,
				12.82,
				true,
				"%"
			},
			{
				4.5,
				0,
				false,
				""
			}
		}
	},
	[101027221] = {
		description = "快速闪避敌人攻击，极限闪避会触发闪避效果。触发闪避效果后或在闪避效果未处于冷却状态时受身成功后<color=#E78300>3</color>秒内，点击普通攻击会使用重锚施放技能攻击，造成共计<color=#E78300>{2}</color>攻击力的冰属性伤害，对命中的敌人附加冰冻状态。\n受身或触发闪避效果时：冰属性伤害提高<color=#E78300>{1}</color>，下次命中后移除；闪避效果每<color=#E78300>{3}</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101027221,
		extra_param = "",
		param = {
			{
				100,
				0,
				false,
				"%"
			},
			{
				850,
				21.794,
				true,
				"%"
			},
			{
				20,
				0,
				false,
				""
			}
		}
	},
	[101027281] = {
		description = "斩浪·丝卡蒂与低吹雪·利维坦的连携奥义。\n斩浪·丝卡蒂造成<color=#E78300>{1}+{2}</color>×<color=#297DE0>自身奥义等级</color>攻击力的冰属性伤害；命中后全队伍蓄力技能伤害提高<color=#E78300>{6}</color>，持续<color=#E78300>{7}</color>秒。\n低吹雪·利维坦造成<color=#E78300>{3}+{4}</color>×<color=#297DE0>自身奥义等级</color>攻击力的冰属性伤害；对全场敌人附加冰冻状态，持续<color=#E78300>{5}</color>秒。",
		maxLv = 60,
		type = 1,
		id = 101027281,
		extra_param = "",
		param = {
			{
				1200,
				60,
				true,
				"%"
			},
			{
				30.769,
				1.538,
				true,
				"%"
			},
			{
				500,
				25,
				true,
				"%"
			},
			{
				12.821,
				0.641,
				true,
				"%"
			},
			{
				5,
				0,
				false,
				""
			},
			{
				45,
				0,
				false,
				"%"
			},
			{
				18,
				0,
				false,
				""
			}
		}
	},
	[101027305] = {
		description = "快速闪避敌人攻击，极限闪避会触发闪避效果。\n闪避效果：冰属性伤害提高<color=#E78300>{1}</color>，下次命中后移除；闪避效果每<color=#E78300>{2}</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101027305,
		extra_param = "",
		param = {
			{
				100,
				0,
				false,
				"%"
			},
			{
				20,
				0,
				false,
				""
			}
		}
	},
	[101028101] = {
		description = "挥舞「妙尔尼尔」连续攻击，造成共计<color=#E78300>{1}</color>攻击力的雷属性伤害。在施放衍生技能后衔接普通攻击，会从普通攻击第四段开始攻击，衔接施放时获得硬直效果，持续<color=#E78300>2</color>秒。\n\n被动：\n每段普通攻击命中和每次施放技能命中时会获得<material=underline c=#FFFFFF h=2 event=terminology args=(102801)>「雷势」</material>，<material=underline c=#FFFFFF h=2 event=terminology args=(102801)>「雷势」</material>上限<color=#E78300>100</color>点，每<color=#E78300>0.5</color>秒会自动消耗<color=#E78300>7</color>点。每段普通攻击命中时获得<color=#E78300>9</color>点<material=underline c=#FFFFFF h=2 event=terminology args=(102801)>「雷势」</material>，每次施放技能命中时获得<color=#E78300>15</color>点<material=underline c=#FFFFFF h=2 event=terminology args=(102801)>「雷势」</material>，<material=underline c=#FFFFFF h=2 event=terminology args=(102802)>「狂雷」</material>状态期间每次施放技能命中时额外获得<color=#E78300>15</color>点<material=underline c=#FFFFFF h=2 event=terminology args=(102801)>「雷势」</material>。每有<color=#E78300>1</color>点<material=underline c=#FFFFFF h=2 event=terminology args=(102801)>「雷势」</material>，独立伤害提高<color=#E78300>0.3%</color>，<material=underline c=#FFFFFF h=2 event=terminology args=(102801)>「雷势」</material><color=#E78300>80</color>点时加成效果达到最高。\n施放衍生技能时进入<material=underline c=#FFFFFF h=2 event=terminology args=(102802)>「狂雷」</material>状态，持续<color=#E78300>2</color>秒，每有<color=#E78300>1</color>点<material=underline c=#FFFFFF h=2 event=terminology args=(102801)>「雷势」</material>，持续时间延长<color=#E78300>0.01</color>秒，最多延长<color=#E78300>1</color>秒。\n<material=underline c=#FFFFFF h=2 event=terminology args=(102802)>「狂雷」</material>：进入时获得短暂的无敌效果，状态期间内<material=underline c=#FFFFFF h=2 event=terminology args=(102801)>「雷势」</material>不会自动消耗，雷属性伤害提高<color=#E78300>{2}</color>。\n\n<color=#297DE0>印记：</color>普通攻击第五段命中敌人后，获得<color=#E78300>1</color>个印记。",
		maxLv = 60,
		type = 1,
		id = 101028101,
		extra_param = "",
		param = {
			{
				559,
				10.811,
				true,
				"%"
			},
			{
				15,
				0,
				false,
				"%"
			}
		}
	},
	[101028201] = {
		description = "挥舞「妙尔尼尔」朝目标方向突进，造成共计<color=#E78300>{1}</color>攻击力的雷属性伤害。施放后的短暂时间内，该技能会替换为衍生技能「奔雷击」；「奔雷击」仅衔接在「大地的奔雷」之后才可施放。\n「奔雷击」：挥舞「妙尔尼尔」攻击周围的敌人，消耗<color=#E78300>3</color>个印记，造成共计<color=#E78300>{2}</color>攻击力的雷属性伤害。\n\n<color=#297DE0>印记：</color>施放「大地的奔雷」命中后，获得<color=#E78300>1</color>个印记。",
		maxLv = 60,
		type = 1,
		id = 101028201,
		extra_param = "",
		param = {
			{
				320,
				8.204,
				true,
				"%"
			},
			{
				600,
				15.382,
				true,
				"%"
			}
		}
	},
	[101028202] = {
		description = "大力挥舞「妙尔尼尔」，短暂聚集附近的敌人，造成共计<color=#E78300>{1}</color>攻击力的雷属性伤害。施放后的短暂时间内，该技能会替换为衍生技能「风雷击」；「风雷击」仅衔接在「远海的风雷」之后才可施放。\n「风雷击」：旋转「妙尔尼尔」后锤击地面，消耗<color=#E78300>3</color>个印记，造成共计<color=#E78300>{2}</color>攻击力的雷属性伤害。\n\n<color=#297DE0>印记：</color>施放「远海的风雷」命中后，获得<color=#E78300>1</color>个印记。",
		maxLv = 60,
		type = 1,
		id = 101028202,
		extra_param = "",
		param = {
			{
				480,
				12.306,
				true,
				"%"
			},
			{
				850,
				21.792,
				true,
				"%"
			}
		}
	},
	[101028203] = {
		description = "挥舞「妙尔尼尔」猛烈锤击地面，造成共计<color=#E78300>{1}</color>攻击力的雷属性伤害。施放后的短暂时间内，该技能会替换为衍生技能「落雷击」；「落雷击」仅衔接在「深空的落雷」之后才可施放。\n「落雷击」：挥舞「妙尔尼尔」再次猛击地面，消耗<color=#E78300>3</color>个印记，造成共计<color=#E78300>{2}</color>攻击力的雷属性伤害。\n\n<color=#297DE0>印记：</color>施放「深空的落雷」命中后，获得<color=#E78300>1</color>个印记。",
		maxLv = 60,
		type = 1,
		id = 101028203,
		extra_param = "",
		param = {
			{
				600,
				15.384,
				true,
				"%"
			},
			{
				1004,
				25.791,
				true,
				"%"
			}
		}
	},
	[101028208] = {
		description = "彗光·前鬼坊天狗与轰雷·托尔的连携奥义。\n彗光·前鬼坊天狗造成<color=#E78300>{1}+{2}</color>×<color=#297DE0>自身奥义等级</color>攻击力的光属性伤害；命中时全队伍光属性伤害提高<color=#E78300>{5}</color>，持续<color=#E78300>{6}</color>秒。\n轰雷·托尔造成<color=#E78300>{3}+{4}</color>×<color=#297DE0>自身奥义等级</color>攻击力的雷属性伤害；自身进入<material=underline c=#FFFFFF h=2 event=terminology args=(102803)>「怒雷」</material>状态，命中时全队伍技能伤害提高<color=#E78300>{7}</color>，持续<color=#E78300>{8}</color>秒。",
		maxLv = 60,
		type = 1,
		id = 101028208,
		extra_param = "",
		param = {
			{
				360,
				18,
				true,
				"%"
			},
			{
				9.231,
				0.462,
				true,
				"%"
			},
			{
				1200,
				60,
				true,
				"%"
			},
			{
				30.769,
				1.538,
				true,
				"%"
			},
			{
				30,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			},
			{
				30,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			}
		}
	},
	[101028209] = {
		description = "召唤出铁手套「雅恩格利佩尔」，释放怒雷之力。自身进入<material=underline c=#FFFFFF h=2 event=terminology args=(102803)>「怒雷」</material>状态，施放后全队伍印记型修正者技能伤害提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒。\n<material=underline c=#FFFFFF h=2 event=terminology args=(102803)>「怒雷」</material>：状态期间内免疫一切控制与伤害并禁用移动、技能和闪避，根据<material=underline c=#FFFFFF h=2 event=terminology args=(102801)>「雷势」</material>获得的加成效果达到最高。清空<material=underline c=#FFFFFF h=2 event=terminology args=(102801)>「雷势」</material>并不再自动消耗，之后每<color=#E78300>0.2</color>秒获得<color=#E78300>7</color>点<material=underline c=#FFFFFF h=2 event=terminology args=(102801)>「雷势」</material>。连续点击攻击会使用铁手套「雅恩格利佩尔」连续施放技能攻击，造成共计<color=#E78300>{3}</color>攻击力的雷属性伤害，攻击第二段会在前方产生五道落雷，每道落雷造成<color=#E78300>{4}</color>攻击力的雷属性伤害。<material=underline c=#FFFFFF h=2 event=terminology args=(102801)>「雷势」</material>为满时会自动施放最后一拳，造成<color=#E78300>{5}</color>攻击力的雷属性伤害，之后退出<material=underline c=#FFFFFF h=2 event=terminology args=(102803)>「怒雷」</material>状态。\n\n自身或者队友成功消耗印记时，根据消耗的印记数量，每个获得<color=#E78300>4%</color>的奥义值。",
		maxLv = 60,
		type = 1,
		id = 101028209,
		extra_param = "",
		param = {
			{
				30,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			},
			{
				405,
				10.383,
				true,
				"%"
			},
			{
				27,
				0.692,
				true,
				"%"
			},
			{
				1000,
				25.641,
				true,
				"%"
			}
		}
	},
	[101028281] = {
		description = "轰雷·托尔与生魂·奥西里斯的连携奥义。\n轰雷·托尔造成<color=#E78300>{1}+{2}</color>×<color=#297DE0>自身奥义等级</color>攻击力的雷属性伤害；自身进入<material=underline c=#FFFFFF h=2 event=terminology args=(102803)>「怒雷」</material>状态，命中时全队伍印记型修正者技能伤害提高<color=#E78300>{5}</color>，持续至<material=underline c=#FFFFFF h=2 event=terminology args=(111101)>「冥府审判模式」</material>结束。\n生魂·奥西里斯造成<color=#E78300>{3}+{4}</color>×<color=#297DE0>自身奥义等级</color>攻击力的风属性伤害；自身进入<material=underline c=#FFFFFF h=2 event=terminology args=(111101)>「冥府审判模式」</material>，全队伍伤害提高<color=#E78300>20%+0.2%</color>×<color=#297DE0>自身奥义等级</color>，持续至<material=underline c=#FFFFFF h=2 event=terminology args=(111101)>「冥府审判模式」</material>结束。",
		maxLv = 60,
		type = 1,
		id = 101028281,
		extra_param = "",
		param = {
			{
				1200,
				60,
				true,
				"%"
			},
			{
				30.769,
				1.538,
				true,
				"%"
			},
			{
				1000,
				50,
				true,
				"%"
			},
			{
				25.641,
				1.282,
				true,
				"%"
			},
			{
				35,
				0,
				false,
				"%"
			}
		}
	},
	[101028282] = {
		description = "流萤岚雾·休与轰雷·托尔的连携奥义。\n流萤岚雾·休造成<color=#E78300>{1}+{2}</color>×<color=#297DE0>自身奥义等级</color>攻击力的雷属性伤害；命中后全队伍机制值获得率提高<color=#E78300>{5}</color>，持续<color=#E78300>{6}</color>秒，普通攻击每命中敌人<color=#E78300>1</color>次，会心伤害提高<color=#E78300>25%</color>，最多可叠加<color=#E78300>3</color>层，机制值获得率提高的加成效果结束时会心伤害加成效果移除。\n轰雷·托尔造成<color=#E78300>{3}+{4}</color>×<color=#297DE0>自身奥义等级</color>攻击力的雷属性伤害；自身进入<material=underline c=#FFFFFF h=2 event=terminology args=(102803)>「怒雷」</material>状态，命中时全队伍技能伤害提高<color=#E78300>{7}</color>、雷属性伤害提高<color=#E78300>{8}</color>，持续<color=#E78300>{9}</color>秒。",
		maxLv = 60,
		type = 1,
		id = 101028282,
		extra_param = "",
		param = {
			{
				1000,
				50,
				true,
				"%"
			},
			{
				25.641,
				1.282,
				true,
				"%"
			},
			{
				1000,
				50,
				true,
				"%"
			},
			{
				25.641,
				1.282,
				true,
				"%"
			},
			{
				25,
				0,
				false,
				"%"
			},
			{
				20,
				0,
				false,
				""
			},
			{
				30,
				0,
				false,
				"%"
			},
			{
				15,
				0,
				false,
				"%"
			},
			{
				20,
				0,
				false,
				""
			}
		}
	},
	[101028305] = {
		description = "快速闪避敌人攻击，且可以连续施放二次闪避，极限闪避会触发闪避效果。极限闪避后衔接普通攻击，会从普通攻击第四段开始攻击，衔接施放时获得硬直效果，持续<color=#E78300>2</color>秒；获得<color=#E78300>15</color>点<material=underline c=#FFFFFF h=2 event=terminology args=(102801)>「雷势」</material>。\n闪避效果：进入零时空间使全场敌人动作大幅减速，持续<color=#E78300>3</color>秒；闪避效果每<color=#E78300>{1}</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101028305,
		extra_param = "",
		param = {
			{
				20,
				0,
				false,
				""
			}
		}
	},
	[101032101] = {
		description = "操纵巨剑连续攻击敌人，造成共计<color=#E78300>{1}</color>攻击力的光属性伤害。出场时，恢复满印记。",
		maxLv = 60,
		type = 1,
		id = 101032101,
		extra_param = "",
		param = {
			{
				240,
				4.706,
				true,
				"%"
			}
		}
	},
	[101032106] = {
		description = "操纵巨剑连续攻击敌人，造成共计<color=#E78300>{1}</color>攻击力的光属性伤害。出场时，恢复满印记。巨剑类型是「巨剑·皇后」时，改变普通攻击的攻击模式。\n「巨剑·皇后」时：操纵巨剑·皇后对目标进行攻击，造成共计<color=#E78300>{2}</color>攻击力的光属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101032106,
		extra_param = "",
		param = {
			{
				240,
				4.706,
				true,
				"%"
			},
			{
				317,
				6.174,
				true,
				"%"
			}
		}
	},
	[101032201] = {
		description = "切换巨剑类型，对自身周围的敌人造成<color=#E78300>{1}</color>攻击力的光属性伤害。普通攻击过程中也可点击该技能施放，不会打断普通攻击，也不会造成伤害，之后剩余冷却时间缩短<color=#E78300>2.5</color>秒。\n巨剑类型会按照「巨剑·骑士」、「巨剑·城堡」、「巨剑·皇后」顺序循环切换。\n\n<color=#297DE0>印记：</color>直接施放该技能时，获得<color=#E78300>2</color>个印记；普通攻击过程中施放该技能时，获得<color=#E78300>1</color>个印记。",
		maxLv = 60,
		type = 1,
		id = 101032201,
		extra_param = "",
		param = {
			{
				240,
				6.153,
				true,
				"%"
			}
		}
	},
	[101032202] = {
		description = "在目标上方降下巨剑，造成共计<color=#E78300>{1}</color>攻击力的光属性伤害，获得当前巨剑类型对应的<material=underline c=#FFFFFF h=2 event=terminology args=(103202)>「王棋标记」</material>，并把<material=underline c=#FFFFFF h=2 event=terminology args=(103201)>「王棋」</material>置放在场上，<material=underline c=#FFFFFF h=2 event=terminology args=(103201)>「王棋」</material>持续<color=#E78300>30</color>秒。<material=underline c=#FFFFFF h=2 event=terminology args=(103201)>「王棋」</material>存在于场上时可再次点击施放该技能，消耗<color=#E78300>1</color>个印记操纵<material=underline c=#FFFFFF h=2 event=terminology args=(103201)>「王棋」</material>，并根据巨剑类型造成不同的攻击方式。\n「巨剑·骑士」：巨剑再次落下，造成共计<color=#E78300>{2}</color>攻击力的光属性伤害。\n「巨剑·城堡」：瞬移到巨剑位置，操纵巨剑对目标进行一次攻击，造成共计<color=#E78300>{3}</color>攻击力的光属性伤害。\n「巨剑·皇后」：巨剑向目标发射，造成共计<color=#E78300>{4}</color>攻击力的光属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101032202,
		extra_param = "",
		param = {
			{
				400,
				10.256,
				true,
				"%"
			},
			{
				800,
				20.512,
				true,
				"%"
			},
			{
				800,
				20.512,
				true,
				"%"
			},
			{
				800,
				20.511,
				true,
				"%"
			}
		}
	},
	[101032203] = {
		description = "消耗全部<material=underline c=#FFFFFF h=2 event=terminology args=(103202)>「王棋标记」</material>，挥动巨剑向前攻击，造成共计<color=#E78300>{1}</color>攻击力的光属性伤害，施放时禁锢敌人，持续<color=#E78300>1.5</color>秒，并根据<material=underline c=#FFFFFF h=2 event=terminology args=(103202)>「王棋标记」</material>数量从目标上方降下巨剑造成额外的伤害，命中后移除禁锢效果。\n<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(103202)>「王棋标记」</material>：造成共计<color=#E78300>{2}</color>攻击力的光属性伤害。\n<color=#E78300>2</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(103202)>「王棋标记」</material>：造成共计<color=#E78300>{3}</color>攻击力的光属性伤害。\n<color=#E78300>3</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(103202)>「王棋标记」</material>：造成共计<color=#E78300>{4}</color>攻击力的光属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101032203,
		extra_param = "",
		param = {
			{
				160,
				4.102,
				true,
				"%"
			},
			{
				960,
				24.615,
				true,
				"%"
			},
			{
				1440,
				36.922,
				true,
				"%"
			},
			{
				1920,
				49.23,
				true,
				"%"
			}
		}
	},
	[101032208] = {
		description = "光煌·阿波罗与熯天·提尔的连携奥义。\n光煌·阿波罗造成<color=#E78300>{1}+{2}</color>×<color=#297DE0>自身奥义等级</color>攻击力的光属性伤害；自身获得<color=#E78300>3</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(105901)>「光矢」</material>标记，命中后全队伍重置闪避效果冷却时间。\n熯天·提尔造成<color=#E78300>{3}+{4}</color>×<color=#297DE0>自身奥义等级</color>攻击力的光属性伤害；连携奥义结束后全队伍奥义伤害提高<color=#E78300>16%</color>，最多可叠加<color=#E78300>5</color>层。",
		maxLv = 60,
		type = 1,
		id = 101032208,
		extra_param = "",
		param = {
			{
				460,
				0,
				false,
				"%"
			},
			{
				11.795,
				0,
				false,
				"%"
			},
			{
				960,
				0,
				false,
				"%"
			},
			{
				24.615,
				0,
				false,
				"%"
			}
		}
	},
	[101032209] = {
		description = "召唤多个巨剑攻击敌人，造成共计<color=#E78300>{1}</color>攻击力的光属性伤害；施放后全队伍奥义伤害提高<color=#E78300>16%</color>，最多可叠加<color=#E78300>5</color>层。\n\n自身修正等级达到Ω级时，获得<color=#E78300>10%</color>的奥义值。",
		maxLv = 60,
		type = 1,
		id = 101032209,
		extra_param = "",
		param = {
			{
				960,
				24.61,
				true,
				"%"
			}
		}
	},
	[101032305] = {
		description = "快速闪避敌人攻击，极限闪避会触发闪避效果。\n闪避效果：获得<color=#E78300>1</color>个印记；闪避效果每<color=#E78300>{1}</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101032305,
		extra_param = "",
		param = {
			{
				12,
				0,
				false,
				""
			}
		}
	},
	[101033101] = {
		description = "连续驱动「循理之环」施放射线攻击前方敌人，造成共计<color=#E78300>{1}</color>攻击力的光属性伤害。\n\n<color=#297DE0>能量：</color>每秒自动获得<color=#E78300>3</color>点能量。",
		maxLv = 60,
		type = 1,
		id = 101033101,
		extra_param = "",
		param = {
			{
				199,
				3.864,
				true,
				"%"
			}
		}
	},
	[101033201] = {
		description = "从敌人身侧召唤出「循理之环」，裁决秩序的破坏者，造成共计<color=#E78300>{1}</color>攻击力的光属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101033201,
		extra_param = "",
		param = {
			{
				400,
				10.254,
				true,
				"%"
			}
		}
	},
	[101033202] = {
		description = "从敌人上空召唤出高速旋转的警诫之轮，造成共计<color=#E78300>{1}</color>攻击力的光属性伤害。当「逆序警诫」最后一段命中时，自身伤害提高<color=#E78300>10%</color>，持续<color=#E78300>{2}</color>秒，该效果可共享给最后一次生成的<material=underline c=#FFFFFF h=2 event=terminology args=(103301)>「真理之域」</material>范围内的队友。",
		maxLv = 60,
		type = 1,
		id = 101033202,
		extra_param = "",
		param = {
			{
				500,
				12.82,
				true,
				"%"
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[101033203] = {
		description = "驱动「循理之环」从天而降打击敌人，造成共计<color=#E78300>{1}</color>攻击力的光属性伤害。命中后在附近生成<material=underline c=#FFFFFF h=2 event=terminology args=(103301)>「真理之域」</material>，持续<color=#E78300>8</color>秒，自身技能、闪避效果及神格获得的加成效果会共享给最后一次生成的<material=underline c=#FFFFFF h=2 event=terminology args=(103301)>「真理之域」</material>范围内的队友。",
		maxLv = 60,
		type = 1,
		id = 101033203,
		extra_param = "",
		param = {
			{
				700,
				17.942,
				true,
				"%"
			}
		}
	},
	[101033208] = {
		description = "启明·海姆达尔与早樱·大国主的连携奥义。\n启明·海姆达尔造成<color=#E78300>{1}+{2}</color>×<color=#297DE0>自身奥义等级</color>攻击力的光属性伤害；全队伍额外攻击力提高<color=#E78300>1200</color>，攻击命中时额外附加一次<color=#E78300>120%的额外攻击力</color>的伤害，该效果每<color=#E78300>0.4</color>秒最多触发一次，持续<color=#E78300>8</color>秒。\n早樱·大国主造成<color=#E78300>{3}+{4}</color>×<color=#297DE0>自身奥义等级</color>攻击力的物理属性伤害；命中时全队伍重置技能三的冷却时间。",
		maxLv = 60,
		type = 1,
		id = 101033208,
		extra_param = "",
		param = {
			{
				420,
				21,
				true,
				"%"
			},
			{
				10.769,
				0.538,
				true,
				"%"
			},
			{
				840,
				42,
				true,
				"%"
			},
			{
				21.538,
				1.077,
				true,
				"%"
			}
		}
	},
	[101033209] = {
		description = "咏颂至理箴言，释放自身潜能，施放后自身额外攻击力提高<color=#E78300>{1}</color>，攻击命中时额外附加一次<color=#E78300>100%的额外攻击力</color>的伤害，该效果每<color=#E78300>0.4</color>秒最多触发一次，持续<color=#E78300>{2}</color>秒，以上效果可共享给最后一次生成的<material=underline c=#FFFFFF h=2 event=terminology args=(103301)>「真理之域」</material>范围内的队友。\n\n自身或者队友触发闪避效果时，获得<color=#E78300>8%</color>的奥义值，该效果每<color=#E78300>0.5</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101033209,
		extra_param = "",
		param = {
			{
				415,
				15,
				true,
				""
			},
			{
				8,
				0,
				false,
				""
			}
		}
	},
	[101033231] = {
		description = "驱动「循理之环」从天而降打击敌人，造成共计<color=#E78300>{1}</color>攻击力的光属性伤害。命中后在附近生成强化的<material=underline c=#FFFFFF h=2 event=terminology args=(103301)>「真理之域」</material>，持续<color=#E78300>10</color>秒，自身技能、闪避效果及神格获得的加成效果会共享给最后一次生成的<material=underline c=#FFFFFF h=2 event=terminology args=(103301)>「真理之域」</material>范围内的队友。最后一次生成的<material=underline c=#FFFFFF h=2 event=terminology args=(103301)>「真理之域」</material>范围内的队友每<color=#E78300>2</color>秒技能伤害提高，持续<color=#E78300>{2}</color>秒，最多可叠加<color=#E78300>5</color>层。",
		maxLv = 60,
		type = 1,
		id = 101033231,
		extra_param = "",
		param = {
			{
				700,
				17.942,
				true,
				"%"
			},
			{
				5,
				0,
				false,
				""
			}
		}
	},
	[101033282] = {
		description = "启明·海姆达尔与暗星·海拉的连携奥义。\n启明·海姆达尔给全队伍附加额外攻击力提高<color=#E78300>1200</color>，攻击命中时额外附加一次<color=#E78300>120%的额外攻击力</color>的伤害，该效果每<color=#E78300>0.4</color>秒最多触发一次，持续<color=#E78300>8</color>秒；命中后<color=#E78300>20</color>秒内，生成<material=underline c=#FFFFFF h=2 event=terminology args=(103301)>「真理之域」</material>时会在暗星·海拉的位置生成。\n暗星·海拉造成<color=#E78300>{1}+{2}</color>×<color=#297DE0>自身奥义等级</color>攻击力的暗属性伤害；命中时全队伍暗属性伤害提高<color=#E78300>{3}</color>，持续<color=#E78300>{4}</color>秒。",
		maxLv = 60,
		type = 1,
		id = 101033282,
		extra_param = "",
		param = {
			{
				2200,
				0,
				false,
				"%"
			},
			{
				56.41,
				0,
				false,
				"%"
			},
			{
				30,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			}
		}
	},
	[101033305] = {
		description = "快速闪避敌人攻击，极限闪避会触发闪避效果。\n闪避效果：每<color=#E78300>1</color>秒获得<color=#E78300>{1}</color>点能量，额外攻击力提高<color=#E78300>{2}</color>，持续<color=#E78300>{3}</color>秒，该效果可共享给最后一次生成的<material=underline c=#FFFFFF h=2 event=terminology args=(103301)>「真理之域」</material>范围内的队友；闪避效果每<color=#E78300>{4}</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101033305,
		extra_param = "",
		param = {
			{
				2,
				0,
				false,
				""
			},
			{
				300,
				0,
				false,
				""
			},
			{
				4,
				0,
				false,
				""
			},
			{
				12,
				0,
				false,
				""
			}
		}
	},
	[101035101] = {
		description = "使用狂鳄对剑快速攻击敌人，造成共计<color=#E78300>{1}</color>攻击力的水属性伤害。\n\n<color=#297DE0>怒气：</color>普通攻击命中后会获得怒气。",
		maxLv = 60,
		type = 1,
		id = 101035101,
		extra_param = "",
		param = {
			{
				115,
				2.325,
				true,
				"%"
			}
		}
	},
	[101035201] = {
		description = "向前冲刺，对路径上的敌人进行最多六次攻击，造成共计<color=#E78300>{1}</color>攻击力的水属性伤害，当奔跑结束或者再次点击技能时可施放终结一击，造成共计<color=#E78300>{2}</color>攻击力的水属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101035201,
		extra_param = "",
		param = {
			{
				360,
				9.228,
				true,
				"%"
			},
			{
				200,
				5.128,
				true,
				"%"
			}
		}
	},
	[101035202] = {
		description = "把对剑插入地面，触发六道圆形涌浪攻击周围敌人，造成共计<color=#E78300>{1}</color>攻击力的水属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101035202,
		extra_param = "",
		param = {
			{
				118,
				3.076,
				true,
				"%"
			}
		}
	},
	[101035203] = {
		description = "使用两把对剑钳住敌人摔向地面，造成共计<color=#E78300>{1}</color>攻击力的水属性伤害。当敌人无法被抓取时，则造成共计<color=#E78300>{2}</color>攻击力的水属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101035203,
		extra_param = "",
		param = {
			{
				320,
				8.204,
				true,
				"%"
			},
			{
				249,
				6.409,
				true,
				"%"
			}
		}
	},
	[101035208] = {
		description = "龙切·迦具土与狂鳄·索贝克的连携奥义。\n龙切·迦具土造成<color=#E78300>{1}+{2}</color>×<color=#297DE0>自身奥义等级</color>攻击力的火属性伤害；命中时全队伍火属性伤害提高<color=#E78300>{5}</color>，持续<color=#E78300>{6}</color>秒。\n狂鳄·索贝克造成<color=#E78300>{3}+{4}</color>×<color=#297DE0>自身奥义等级</color>攻击力的水属性伤害；命中时全队伍近战伤害提高<color=#E78300>{7}</color>，持续<color=#E78300>{8}</color>秒。",
		maxLv = 60,
		type = 1,
		id = 101035208,
		extra_param = "",
		param = {
			{
				960,
				0,
				false,
				"%"
			},
			{
				24.615,
				0,
				false,
				"%"
			},
			{
				400,
				0,
				false,
				"%"
			},
			{
				10.256,
				0,
				false,
				"%"
			},
			{
				70,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			},
			{
				20,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			}
		}
	},
	[101035209] = {
		description = "跃起并化作一道龙卷砸向敌人，造成共计<color=#E78300>{1}</color>攻击力的水属性伤害；命中时全队伍近战伤害提高<color=#E78300>{2}</color>，持续<color=#E78300>{3}</color>秒。\n\n当人形敌人被击败时，获得<color=#E78300>8%</color>的奥义值。",
		maxLv = 60,
		type = 1,
		id = 101035209,
		extra_param = "",
		param = {
			{
				400,
				10.25,
				true,
				"%"
			},
			{
				20,
				0,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[101035305] = {
		description = "快速闪避敌人攻击，极限闪避会触发闪避效果。\n闪避效果：进入零时空间使全场敌人动作大幅减速，持续<color=#E78300>3</color>秒；获得<color=#E78300>{1}</color>点怒气；闪避效果每<color=#E78300>{2}</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101035305,
		extra_param = "",
		param = {
			{
				30,
				0,
				false,
				""
			},
			{
				20,
				0,
				false,
				""
			}
		}
	},
	[101036101] = {
		description = "对锁定的敌人进行连续射击，造成共计<color=#E78300>{1}</color>攻击力的光属性伤害。\n\n被动：\n自身与敌人距离越远，命中瞬间伤害越高，该效果提供的伤害提高最高为<color=#E78300>30%</color>。\n\n<color=#297DE0>怒气：</color>普通攻击命中后会获得怒气。",
		maxLv = 60,
		type = 1,
		id = 101036101,
		extra_param = "",
		param = {
			{
				118,
				2.329,
				true,
				"%"
			}
		}
	},
	[101036201] = {
		description = "向后跳跃并向目标敌人发射两团幽光，造成共计<color=#E78300>{1}</color>攻击力的光属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101036201,
		extra_param = "",
		param = {
			{
				180,
				4.604,
				true,
				"%"
			}
		}
	},
	[101036202] = {
		description = "快速发射两波箭雨，对周围敌人造成共计<color=#E78300>{1}</color>攻击力的光属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101036202,
		extra_param = "",
		param = {
			{
				260,
				6.666,
				true,
				"%"
			}
		}
	},
	[101036203] = {
		description = "进行三次范围性的散射后，再次拉弓对目标进行一次精准射击，造成共计<color=#E78300>{1}</color>攻击力的光属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101036203,
		extra_param = "",
		param = {
			{
				410,
				10.511,
				true,
				"%"
			}
		}
	},
	[101036209] = {
		description = "跃向空中，对目标敌人进行一次强力射击，造成共计<color=#E78300>{1}</color>攻击力的光属性伤害；自身获得被动加成的最高效果，持续<color=#E78300>10</color>秒，全队伍获得<color=#E78300>30</color>点怒气。",
		maxLv = 60,
		type = 1,
		id = 101036209,
		extra_param = "",
		param = {
			{
				550,
				14.102,
				true,
				"%"
			}
		}
	},
	[101036231] = {
		description = "使用手套装置进行强力攻击，造成共计<color=#E78300>{1}</color>攻击力的光属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101036231,
		extra_param = "",
		param = {
			{
				200,
				5.128,
				true,
				"%"
			}
		}
	},
	[101036305] = {
		description = "快速闪避敌人攻击，极限闪避会触发闪避效果。\n闪避效果：进入零时空间使全场敌人动作大幅减速，持续<color=#E78300>3</color>秒；闪避效果每<color=#E78300>{1}</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101036305,
		extra_param = "",
		param = {
			{
				20,
				0,
				false,
				""
			}
		}
	},
	[101037101] = {
		description = "对锁定的敌人进行连续射击，造成共计<color=#E78300>{1}</color>攻击力的暗属性伤害。\n\n被动：\n自身与敌人距离越远，命中瞬间伤害越高，该效果提供的伤害提高最高为<color=#E78300>30%</color>。\n\n<color=#297DE0>怒气：</color>普通攻击命中后会获得怒气。",
		maxLv = 60,
		type = 1,
		id = 101037101,
		extra_param = "",
		param = {
			{
				118,
				2.329,
				true,
				"%"
			}
		}
	},
	[101037201] = {
		description = "向后跳跃并向目标敌人发射两团幽光，造成共计<color=#E78300>{1}</color>攻击力的暗属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101037201,
		extra_param = "",
		param = {
			{
				180,
				4.604,
				true,
				"%"
			}
		}
	},
	[101037202] = {
		description = "快速发射两波箭雨，对周围敌人造成共计<color=#E78300>{1}</color>攻击力的暗属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101037202,
		extra_param = "",
		param = {
			{
				260,
				6.666,
				true,
				"%"
			}
		}
	},
	[101037203] = {
		description = "进行三次范围性的散射后，再次拉弓对目标进行一次精准射击，造成共计<color=#E78300>{1}</color>攻击力的暗属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101037203,
		extra_param = "",
		param = {
			{
				410,
				10.511,
				true,
				"%"
			}
		}
	},
	[101037208] = {
		description = "早樱·大国主与夜之寄生·霍德尔的连携奥义。\n早樱·大国主造成<color=#E78300>{1}+{2}</color>×<color=#297DE0>自身奥义等级</color>攻击力的物理属性伤害；命中后全队伍重置技能三的冷却时间。\n夜之寄生·霍德尔造成<color=#E78300>{3}+{4}</color>×<color=#297DE0>自身奥义等级</color>攻击力的暗属性伤害；施放时全队伍获得<color=#E78300>30</color>点怒气；命中时全队伍伤害提高，数值等同于自身被动效果提供的伤害提高的上限，持续<color=#E78300>{5}</color>秒。",
		maxLv = 60,
		type = 1,
		id = 101037208,
		extra_param = "",
		param = {
			{
				840,
				42,
				true,
				"%"
			},
			{
				21.538,
				1.077,
				true,
				"%"
			},
			{
				840,
				42,
				true,
				"%"
			},
			{
				21.538,
				1.077,
				true,
				"%"
			},
			{
				12,
				0,
				false,
				""
			}
		}
	},
	[101037209] = {
		description = "跃向空中，对目标敌人进行一次强力射击，造成共计<color=#E78300>{1}</color>攻击力的暗属性伤害；施放时全队伍获得<color=#E78300>30</color>点怒气，施放后自身根据距离获得的被动加成效果达到最高，持续<color=#E78300>10</color>秒。\n\n自身或者队友触发零时空间时，获得<color=#E78300>15%</color>的奥义值，该效果每<color=#E78300>0.5</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101037209,
		extra_param = "",
		param = {
			{
				600,
				15.384,
				true,
				"%"
			}
		}
	},
	[101037231] = {
		description = "使用手套装置进行强力攻击，造成共计<color=#E78300>{1}</color>攻击力的暗属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101037231,
		extra_param = "",
		param = {
			{
				600,
				15.384,
				true,
				"%"
			}
		}
	},
	[101037305] = {
		description = "快速闪避敌人攻击，极限闪避会触发闪避效果。\n闪避效果：进入零时空间使全场敌人动作大幅减速，持续<color=#E78300>3</color>秒；闪避效果每<color=#E78300>{1}</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101037305,
		extra_param = "",
		param = {
			{
				20,
				0,
				false,
				""
			}
		}
	},
	[101038101] = {
		description = "天后化作数只火凤凰攻击敌人，随着凤凰数量的增加，最后引发范围性的爆炸，造成共计<color=#E78300>{1}</color>攻击力的火属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101038101,
		extra_param = "",
		param = {
			{
				99,
				1.944,
				true,
				"%"
			}
		}
	},
	[101038201] = {
		description = "召唤天后沿目标轨迹高速飞行，对路径上的敌人造成共计<color=#E78300>{1}</color>攻击力的火属性伤害。\n\n<color=#297DE0>印记：</color>每次施放命中后，获得<color=#E78300>1</color>个印记。",
		maxLv = 60,
		type = 1,
		id = 101038201,
		extra_param = "",
		param = {
			{
				150,
				3.846,
				true,
				"%"
			}
		}
	},
	[101038202] = {
		description = "运用权杖在目标脚下造成一次爆破，造成共计<color=#E78300>{1}</color>攻击力的火属性范围伤害。\n\n<color=#297DE0>印记：</color>每次施放命中后，获得<color=#E78300>1</color>个印记。",
		maxLv = 60,
		type = 1,
		id = 101038202,
		extra_param = "",
		param = {
			{
				382,
				9.87,
				true,
				"%"
			},
			{
				0,
				0,
				false,
				""
			}
		}
	},
	[101038203] = {
		description = "在周围引发火焰风暴，根据消耗的印记数量对敌人造成伤害。\n<color=#E78300>1</color>个印记：造成共计<color=#E78300>{1}</color>攻击力的火属性伤害。\n<color=#E78300>2</color>个印记：造成共计<color=#E78300>{2}</color>攻击力的火属性伤害。\n<color=#E78300>3</color>个印记：造成共计<color=#E78300>{3}</color>攻击力的火属性伤害。\n<color=#E78300>4</color>个印记：造成共计<color=#E78300>{4}</color>攻击力的火属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101038203,
		extra_param = "",
		param = {
			{
				240,
				6.153,
				true,
				"%"
			},
			{
				400,
				10.255,
				true,
				"%"
			},
			{
				560,
				14.356,
				true,
				"%"
			},
			{
				720,
				18.46,
				true,
				"%"
			}
		}
	},
	[101038208] = {
		description = "羽灼·赫拉与冰渊·波塞冬的连携奥义。\n羽灼·赫拉造成<color=#E78300>{1}+{2}</color>×<color=#297DE0>自身奥义等级</color>攻击力的火属性伤害；全队伍获得<color=#E78300>8%+0.2%</color>×<color=#297DE0>自身奥义等级</color>奥义值。\n冰渊·波塞冬造成<color=#E78300>{3}+{4}</color>×<color=#297DE0>自身奥义等级</color>攻击力的冰属性伤害；命中后全队伍技能一的剩余冷却时间缩短<color=#E78300>4</color>秒，技能二的剩余冷却时间缩短<color=#E78300>6</color>秒。",
		maxLv = 60,
		type = 1,
		id = 101038208,
		extra_param = "",
		param = {
			{
				430,
				22,
				true,
				"%"
			},
			{
				11.026,
				0.564,
				true,
				"%"
			},
			{
				840,
				42,
				true,
				"%"
			},
			{
				21.538,
				1.077,
				true,
				"%"
			}
		}
	},
	[101038209] = {
		description = "在身前召唤天后持续聚集附近敌人，造成共计<color=#E78300>{1}</color>攻击力的火属性伤害。\n\n当敌人被附加灼烧状态时，获得<color=#E78300>8%</color>的奥义值，该效果每<color=#E78300>2</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101038209,
		extra_param = "",
		param = {
			{
				180,
				4.615,
				true,
				"%"
			}
		}
	},
	[101038221] = {
		description = "召唤出天后攻击目标，造成<color=#E78300>{1}</color>攻击力的火属性伤害，对处于灼烧状态下的敌人伤害提高。\n\n<color=#297DE0>印记：</color>每次施放命中后，获得<color=#E78300>1</color>个印记。",
		maxLv = 60,
		type = 1,
		id = 101038221,
		extra_param = "",
		param = {
			{
				385,
				9.871,
				true,
				"%"
			}
		}
	},
	[101038281] = {
		description = "羽灼·赫拉与铃兰之弦·雅典娜的连携奥义。\n羽灼·赫拉造成共计<color=#E78300>{1}+{2}</color>×<color=#297DE0>自身奥义等级</color>攻击力的火属性伤害；生成一个「炽弦凝核」，持续聚集附近的敌人。\n铃兰之弦·雅典娜造成<color=#E78300>{3}+{4}</color>×<color=#297DE0>自身奥义等级</color>攻击力的物理属性伤害；施放时自身恢复满神能，重置<material=underline c=#FFFFFF h=2 event=terminology args=(104103)>「谐律」</material>层数，进入<material=underline c=#FFFFFF h=2 event=terminology args=(104101)>「鸣刃」</material>状态，该次<material=underline c=#FFFFFF h=2 event=terminology args=(104101)>「鸣刃」</material>状态期间「铃兰剑艺」每次判定成功时，队友周身也会产生一次「谐律音爆」；施放时全队伍普通攻击伤害提高<color=#E78300>20%+1%</color>×<color=#297DE0>自身奥义等级</color>，持续<color=#E78300>{5}</color>秒。",
		maxLv = 60,
		type = 1,
		id = 101038281,
		extra_param = "",
		param = {
			{
				718,
				36,
				true,
				"%"
			},
			{
				18.41,
				0.923,
				true,
				"%"
			},
			{
				960,
				48,
				true,
				"%"
			},
			{
				24.615,
				1.231,
				true,
				"%"
			},
			{
				12,
				0,
				false,
				""
			}
		}
	},
	[101038305] = {
		description = "快速闪避敌人攻击，且可以连续施放二次闪避，极限闪避会触发闪避效果。\n闪避效果：进入零时空间使全场敌人动作大幅减速，持续<color=#E78300>2</color>秒；对攻击者附加灼烧状态，持续<color=#E78300>{1}</color>秒；闪避效果每<color=#E78300>{3}</color>秒最多触发一次。\n灼烧：每<color=#E78300>3</color>秒附加<color=#E78300>{2}</color>攻击力的火属性伤害，持续<color=#E78300>{1}</color>秒。",
		maxLv = 60,
		type = 1,
		id = 101038305,
		extra_param = "",
		param = {
			{
				13,
				0,
				false,
				""
			},
			{
				35,
				0,
				false,
				"%"
			},
			{
				20,
				0,
				false,
				""
			}
		}
	},
	[101039101] = {
		description = "召唤露珠攻击前方敌人，造成共计<color=#E78300>{1}</color>攻击力的水属性伤害。\n\n被动：\n当神能为满时，施放技能后会消耗全部神能重置该技能的冷却时间。\n\n<color=#297DE0>神能：</color>普通攻击命中后会获得神能。",
		maxLv = 60,
		type = 1,
		id = 101039101,
		extra_param = "",
		param = {
			{
				190,
				3.698,
				true,
				"%"
			}
		}
	},
	[101039201] = {
		description = "恢复指定范围内所有友方<color=#E78300>{2}+自身{1}攻击力</color>的生命值。",
		maxLv = 60,
		type = 1,
		id = 101039201,
		extra_param = "",
		param = {
			{
				9.4,
				0.4,
				true,
				"%"
			},
			{
				610,
				10,
				true,
				""
			}
		}
	},
	[101039202] = {
		description = "全队伍额外攻击力提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒。",
		maxLv = 60,
		type = 1,
		id = 101039202,
		extra_param = "",
		param = {
			{
				60,
				10,
				true,
				""
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[101039203] = {
		description = "召唤一道浪潮向前方缓慢推进，造成共计<color=#E78300>{1}</color>攻击力的水属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101039203,
		extra_param = "",
		param = {
			{
				360,
				9.23,
				true,
				"%"
			}
		}
	},
	[101039208] = {
		description = "朝约·薇儿丹蒂、追炎·前鬼坊天狗与潮音·波塞冬的连携奥义。\n朝约·薇儿丹蒂造成<color=#E78300>{1}+{2}</color>×<color=#297DE0>自身奥义等级</color>攻击力的物理属性伤害；全队伍该次连携奥义的修正系数提高<color=#E78300>{7}</color>。\n追炎·前鬼坊天狗造成<color=#E78300>{3}+{4}</color>×<color=#297DE0>自身奥义等级</color>攻击力的物理属性伤害；命中后全队伍恢复满值机制值。\n潮音·波塞冬造成<color=#E78300>{5}+{6}</color>×<color=#297DE0>自身奥义等级</color>攻击力的水属性伤害；恢复全队<color=#E78300>60%+2%</color>×<color=#297DE0>自身奥义等级</color>攻击力的生命值，生命值上限提高<color=#E78300>{8}</color>，该效果最多可叠加<color=#E78300>3</color>层。",
		maxLv = 60,
		type = 1,
		id = 101039208,
		extra_param = "",
		param = {
			{
				450,
				23,
				true,
				"%"
			},
			{
				11.538,
				0.59,
				true,
				"%"
			},
			{
				360,
				18,
				true,
				"%"
			},
			{
				9.231,
				0.462,
				true,
				"%"
			},
			{
				360,
				18,
				true,
				"%"
			},
			{
				9.231,
				0.462,
				true,
				"%"
			},
			{
				200,
				0,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				"%"
			}
		}
	},
	[101039209] = {
		description = "全队伍生命值上限提高<color=#E78300>{2}</color>，最多可叠加<color=#E78300>3</color>层，恢复全队伍<color=#E78300>{3}+自身{1}攻击力</color>的生命值。\n\n自身或者队友受身时，获得<color=#E78300>8%</color>的奥义值。",
		maxLv = 60,
		type = 1,
		id = 101039209,
		extra_param = "",
		param = {
			{
				18.8,
				0.8,
				true,
				"%"
			},
			{
				10,
				0,
				false,
				"%"
			},
			{
				1830,
				30,
				true,
				""
			}
		}
	},
	[101039211] = {
		description = "恢复指定范围内所有友方<color=#E78300>{3}+自身{1}攻击力</color>的生命值，受治疗的自身或者队友对应的机制值获得率提高，持续<color=#E78300>{2}</color>秒，并获得对应机制值（<color=#E78300>30</color>点怒气，<color=#E78300>30</color>点能量值，<color=#E78300>1</color>个印记，<color=#E78300>30</color>点神能）。",
		maxLv = 60,
		type = 1,
		id = 101039211,
		extra_param = "",
		param = {
			{
				9.4,
				0.4,
				true,
				"%"
			},
			{
				10,
				0,
				false,
				""
			},
			{
				610,
				10,
				true,
				""
			}
		}
	},
	[101039305] = {
		description = "快速闪避敌人攻击，极限闪避会触发闪避效果。\n闪避效果：进入零时空间使全场敌人动作大幅减速，持续<color=#E78300>2</color>秒；获得<color=#E78300>{1}</color>点神能；闪避效果每<color=#E78300>{2}</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101039305,
		extra_param = "",
		param = {
			{
				50,
				0,
				false,
				""
			},
			{
				20,
				0,
				false,
				""
			}
		}
	},
	[101041101] = {
		description = "连续挥舞大剑，造成共计<color=#E78300>{1}</color>攻击力的物理属性伤害。\n\n被动：\n<material=underline c=#FFFFFF h=2 event=terminology args=(104101)>「鸣刃」</material>状态时，每段普通攻击、「和弦三音」、「促弦五音」、「急弦七音」后半程会开启<material=underline c=#FFFFFF h=2 event=terminology args=(104102)>「谐律判定」</material>，在合适的时机衔接下一段攻击，即可判定成功，每次判定成功时，获得硬直效果，持续<color=#E78300>2.5</color>秒，获得<color=#E78300>1</color>层<material=underline c=#FFFFFF h=2 event=terminology args=(104103)>「谐律」</material>，持续<color=#E78300>7</color>秒，判定未成功时会刷新<material=underline c=#FFFFFF h=2 event=terminology args=(104103)>「谐律」</material>的持续时间，<material=underline c=#FFFFFF h=2 event=terminology args=(104103)>「谐律」</material>最多可叠加<color=#E78300>105</color>层。普通攻击判定成功时会产生一次「谐律音爆」，「谐律音爆」每命中敌人<color=#E78300>1</color>次对周围的敌人造成普通攻击伤害，根据<material=underline c=#FFFFFF h=2 event=terminology args=(104103)>「谐律」</material>层数顺序循环造成<color=#E78300>261.6%、293.6%、329.6%、349.2%、392%、440%、493.8%</color>攻击力的物理属性伤害。技能判定成功时不会打断普通攻击的连段。\n\n<color=#297DE0>神能：</color>不处于<material=underline c=#FFFFFF h=2 event=terminology args=(104101)>「鸣刃」</material>状态时，普通攻击命中后会获得神能。",
		maxLv = 60,
		type = 1,
		id = 101041101,
		extra_param = "",
		param = {
			{
				392,
				7.567,
				true,
				"%"
			}
		}
	},
	[101041201] = {
		description = "造成共计<color=#E78300>{1}</color>攻击力的物理属性伤害。<material=underline c=#FFFFFF h=2 event=terminology args=(104103)>「谐律」</material>层数是<color=#E78300>3</color>的倍数时施放的「和弦三音」造成共计<color=#E78300>{3}</color>攻击力的物理属性伤害，命中后恢复自身<color=#E78300>{4}</color>攻击力的生命值。<material=underline c=#FFFFFF h=2 event=terminology args=(104101)>「鸣刃」</material>状态期间施放「和弦三音」判定成功时命中瞬间伤害提高<color=#E78300>{2}</color>。",
		maxLv = 60,
		type = 1,
		id = 101041201,
		extra_param = "",
		param = {
			{
				800,
				20.512,
				true,
				"%"
			},
			{
				12,
				0,
				false,
				"%"
			},
			{
				1000,
				25.641,
				true,
				"%"
			},
			{
				50,
				0,
				false,
				"%"
			}
		}
	},
	[101041202] = {
		description = "造成共计<color=#E78300>{1}</color>攻击力的物理属性伤害。<material=underline c=#FFFFFF h=2 event=terminology args=(104103)>「谐律」</material>层数是<color=#E78300>5</color>的倍数时施放的「促弦五音」造成共计<color=#E78300>{3}</color>攻击力的物理属性伤害，对命中的敌人附加破甲状态，防御力降低<color=#E78300>{4}</color>，持续<color=#E78300>{5}</color>秒。<material=underline c=#FFFFFF h=2 event=terminology args=(104101)>「鸣刃」</material>状态期间施放「促弦五音」判定成功时命中瞬间伤害提高<color=#E78300>{2}</color>。",
		maxLv = 60,
		type = 1,
		id = 101041202,
		extra_param = "",
		param = {
			{
				1200,
				30.769,
				true,
				"%"
			},
			{
				12,
				0,
				false,
				"%"
			},
			{
				1500,
				38.461,
				true,
				"%"
			},
			{
				20,
				0,
				false,
				"%"
			},
			{
				6,
				0,
				false,
				""
			}
		}
	},
	[101041203] = {
		description = "神能为满时才可施放，施放后对周围敌人造成共计<color=#E78300>{1}</color>攻击力的物理属性伤害，进入<material=underline c=#FFFFFF h=2 event=terminology args=(104101)>「鸣刃」</material>状态，重置「和弦三音」、「促弦五音」、「急弦七音」的冷却时间，「弦刃协奏」替换为「急弦七音」。\n<material=underline c=#FFFFFF h=2 event=terminology args=(104101)>「鸣刃」</material>：每<color=#E78300>0.375</color>秒消耗<color=#E78300>3</color>点神能，该神能消耗不受其他属性影响。神能为<color=#E78300>0</color>点时，退出<material=underline c=#FFFFFF h=2 event=terminology args=(104101)>「鸣刃」</material>状态，之后「弦刃协奏」进入冷却。\n「急弦七音」：造成共计<color=#E78300>{2}</color>攻击力的物理属性伤害。<material=underline c=#FFFFFF h=2 event=terminology args=(104103)>「谐律」</material>层数是<color=#E78300>7</color>的倍数时施放的「急弦七音」造成共计<color=#E78300>{3}</color>攻击力的物理属性伤害，每层<material=underline c=#FFFFFF h=2 event=terminology args=(104103)>「谐律」</material>自身命中瞬间伤害提高<color=#E78300>1%</color>。施放「急弦七音」判定成功时命中瞬间伤害提高<color=#E78300>{4}</color>，「急弦七音」有<color=#E78300>12</color>秒的冷却时间。",
		maxLv = 60,
		type = 1,
		id = 101041203,
		extra_param = "",
		param = {
			{
				600,
				15.384,
				true,
				"%"
			},
			{
				1440,
				36.923,
				true,
				"%"
			},
			{
				1800,
				46.152,
				true,
				"%"
			},
			{
				12,
				0,
				false,
				"%"
			}
		}
	},
	[101041209] = {
		description = "施放时恢复满神能，重置<material=underline c=#FFFFFF h=2 event=terminology args=(104103)>「谐律」</material>层数，进入<material=underline c=#FFFFFF h=2 event=terminology args=(104101)>「鸣刃」</material>状态，该次<material=underline c=#FFFFFF h=2 event=terminology args=(104101)>「鸣刃」</material>状态期间普通攻击每次判定成功时，队友周身也会产生一次「谐律音爆」。施放后全队普通攻击伤害提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒。\n\n当敌人被附加眩晕状态时，获得<color=#E78300>8%</color>的奥义值，该效果每<color=#E78300>2</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101041209,
		extra_param = "",
		param = {
			{
				21,
				1,
				true,
				"%"
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[101041305] = {
		description = "快速闪避敌人攻击，极限闪避会触发闪避效果。闪避不会打断普通攻击的连段；处于<material=underline c=#FFFFFF h=2 event=terminology args=(104101)>「鸣刃」</material>状态时，极限闪避会开启<material=underline c=#FFFFFF h=2 event=terminology args=(104102)>「谐律判定」</material>或重置当前的判定开启一次新的<material=underline c=#FFFFFF h=2 event=terminology args=(104102)>「谐律判定」</material>。\n闪避效果：对攻击者及其周围的敌人造成共计<color=#E78300>{1}</color>攻击力的物理属性伤害，并附加眩晕状态，持续<color=#E78300>{2}</color>秒；闪避效果每<color=#E78300>{3}</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101041305,
		extra_param = "",
		param = {
			{
				440,
				11.282,
				true,
				"%"
			},
			{
				3,
				0,
				false,
				""
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[101042101] = {
		description = "操作两名人偶进行交替攻击，其中琉刻使用利爪，明塔使用拳甲，造成共计<color=#E78300>{1}</color>攻击力的暗属性伤害；当琉刻或明塔不可操作时，会直接用丝线进行攻击，造成共计<color=#E78300>{2}</color>攻击力的暗属性伤害。\n\n被动：\n自身神能不低于<color=#E78300>25</color>点且不高于<color=#E78300>75</color>点时，每<color=#E78300>6</color>秒获得<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(104201)>「冥息」</material>标记，<material=underline c=#FFFFFF h=2 event=terminology args=(104201)>「冥息」</material>标记最多拥有<color=#E78300>4</color>个；每拥有<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(104201)>「冥息」</material>标记，会心率提高<color=#E78300>3%</color>、会心伤害提高<color=#E78300>5%</color>。\n\n<color=#297DE0>神能：</color>琉刻普通攻击和技能每次命中后消耗<color=#E78300>1</color>点神能，明塔普通攻击和技能每次命中后获得<color=#E78300>3</color>点神能，琉刻消耗神能和明塔获得神能不受其他属性影响。",
		maxLv = 60,
		type = 1,
		id = 101042101,
		extra_param = "",
		param = {
			{
				443,
				8.645,
				true,
				"%"
			},
			{
				260,
				6.653,
				true,
				"%"
			}
		}
	},
	[101042201] = {
		description = "切换操作的人偶，下一次施放「冥偶戏·小序曲」或「冥偶戏·进行曲」时，琉刻和明塔进入<material=underline c=#FFFFFF h=2 event=terminology args=(104202)>「伴舞」</material>状态。<material=underline c=#FFFFFF h=2 event=terminology args=(104201)>「冥息」</material>标记为满时，长按普通攻击消耗全部<material=underline c=#FFFFFF h=2 event=terminology args=(104201)>「冥息」</material>标记，琉刻和明塔进入<material=underline c=#FFFFFF h=2 event=terminology args=(104203)>「共舞」</material>状态。\n<material=underline c=#FFFFFF h=2 event=terminology args=(104203)>「共舞」</material>：进入时自身会心率提高<color=#E78300>{2}</color>、会心伤害提高<color=#E78300>{3}</color>、固定伤害提高<color=#E78300>6000</color>，持续<color=#E78300>9</color>秒；琉刻和明塔协同攻击，造成共计<color=#E78300>{1}</color>攻击力的暗属性伤害，持续<color=#E78300>5.5</color>秒，期间禁用技能，不会获得<material=underline c=#FFFFFF h=2 event=terminology args=(104201)>「冥息」</material>标记，不会通过琉刻和明塔消耗和获得神能。\n闪避效果不处于冷却状态时，施放「冥丝轮转」时也会对锁定的敌人触发闪避效果，之后闪避效果进入冷却。",
		maxLv = 60,
		type = 1,
		id = 101042201,
		extra_param = "",
		param = {
			{
				2000,
				51.265,
				true,
				"%"
			},
			{
				12,
				0,
				false,
				"%"
			},
			{
				36,
				0,
				false,
				"%"
			}
		}
	},
	[101042202] = {
		description = "琉刻为当前被操作人偶时，造成共计<color=#E78300>{1}</color>攻击力的暗属性伤害。维持技能动作时，会对命中的敌人附加<material=underline c=#FFFFFF h=2 event=terminology args=(104205)>「暗海」</material>状态，持续<color=#E78300>12</color>秒，重复附加时不会刷新持续时间。\n明塔为当前被操作人偶时，造成共计<color=#E78300>{3}</color>攻击力的暗属性伤害。维持技能动作时，会对命中的敌人附加<material=underline c=#FFFFFF h=2 event=terminology args=(104204)>「冥泽」</material>状态，持续<color=#E78300>8</color>秒，重复附加时不会刷新持续时间。\n<material=underline c=#FFFFFF h=2 event=terminology args=(104205)>「暗海」</material>：每<color=#E78300>2</color>秒附加<color=#E78300>{2}</color>攻击力的暗属性伤害，持续<color=#E78300>12</color>秒。\n<material=underline c=#FFFFFF h=2 event=terminology args=(104204)>「冥泽」</material>：每<color=#E78300>2</color>秒附加<color=#E78300>{4}</color>攻击力的暗属性伤害，持续<color=#E78300>8</color>秒。\n<material=underline c=#FFFFFF h=2 event=terminology args=(104202)>「伴舞」</material>：「冥偶戏·小序曲」会替换为「冥偶戏·圆舞曲」，琉刻和明塔协同攻击，造成共计<color=#E78300>{5}</color>攻击力的暗属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101042202,
		extra_param = "",
		param = {
			{
				900,
				23.071,
				true,
				"%"
			},
			{
				120,
				0,
				false,
				"%"
			},
			{
				900,
				23.076,
				true,
				"%"
			},
			{
				180,
				0,
				false,
				"%"
			},
			{
				1560,
				39.993,
				true,
				"%"
			}
		}
	},
	[101042203] = {
		description = "琉刻为当前被操作人偶时，造成共计<color=#E78300>{1}</color>攻击力的暗属性伤害。维持技能动作时，琉刻会小幅牵引周围敌人。\n明塔为当前被操作人偶时，造成共计<color=#E78300>{2}</color>攻击力的暗属性伤害。维持技能动作时，明塔会小幅牵引周围敌人。\n<material=underline c=#FFFFFF h=2 event=terminology args=(104202)>「伴舞」</material>：「冥偶戏·进行曲」会替换为「冥偶戏·轮舞曲」，琉刻和明塔协同攻击，造成共计<color=#E78300>{3}</color>攻击力的暗属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101042203,
		extra_param = "",
		param = {
			{
				1000,
				25.636,
				true,
				"%"
			},
			{
				1000,
				25.64,
				true,
				"%"
			},
			{
				1440,
				36.904,
				true,
				"%"
			}
		}
	},
	[101042208] = {
		description = "操偶师·哈迪斯与小困·俄尼里伊的连携奥义。\n操偶师·哈迪斯造成<color=#E78300>{1}+{2}</color>×<color=#297DE0>自身奥义等级</color>攻击力的暗属性伤害；施放时，全队伍获得能量、神能恢复状态，持续<color=#E78300>12</color>秒；触发时，当能量、神能不高于<color=#E78300>30</color>点时，获得<color=#E78300>25</color>点能量、神能，该效果每<color=#E78300>3</color>秒最多触发一次；命中时全队伍奥山神系修正者伤害提高<color=#E78300>{5}</color>，持续<color=#E78300>{6}</color>秒。\n小困·俄尼里伊造成<color=#E78300>{3}+{4}</color>×<color=#297DE0>自身奥义等级</color>攻击力的光属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101042208,
		extra_param = "",
		param = {
			{
				1440,
				0,
				false,
				"%"
			},
			{
				36.923,
				0,
				false,
				"%"
			},
			{
				500,
				0,
				false,
				"%"
			},
			{
				12.821,
				0,
				false,
				"%"
			},
			{
				60,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			}
		}
	},
	[101042209] = {
		description = "施放奥义时，自身每<color=#E78300>3</color>秒触发一次，神能回到<color=#E78300>50</color>点，持续<color=#E78300>12</color>秒；每拥有<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(104201)>「冥息」</material>全队伍会心率提高<color=#E78300>3%</color>、会心伤害提高<color=#E78300>15%</color>，持续<color=#E78300>{1}</color>秒；造成共计<color=#E78300>{2}</color>攻击力的暗属性伤害。\n\n自身或者队友攻击造成会心后，获得<color=#E78300>3%</color>的奥义值，该效果每<color=#E78300>2</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101042209,
		extra_param = "",
		param = {
			{
				12,
				0,
				false,
				""
			},
			{
				1200,
				30.764,
				true,
				"%"
			}
		}
	},
	[101042305] = {
		description = "快速闪避敌人攻击，极限闪避会触发闪避效果。\n闪避效果：攻击者动作大幅减速，持续<color=#E78300>4</color>秒；闪避效果每<color=#E78300>{1}</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101042305,
		extra_param = "",
		param = {
			{
				20,
				0,
				false,
				""
			}
		}
	},
	[101048101] = {
		description = "对锁定的敌人连续射击，造成共计<color=#E78300>{1}</color>攻击力的光属性伤害。\n\n<color=#297DE0>能量：</color>每秒自动获得<color=#E78300>{2}</color>点能量。",
		maxLv = 60,
		type = 1,
		id = 101048101,
		extra_param = "",
		param = {
			{
				140,
				2.735,
				true,
				"%"
			},
			{
				5,
				0,
				false,
				""
			}
		}
	},
	[101048201] = {
		description = "召唤激光轰炸锁定的敌人，造成共计<color=#E78300>{1}</color>攻击力的光属性伤害，对命中的敌人附加禁锢状态，持续<color=#E78300>{2}</color>秒。",
		maxLv = 60,
		type = 1,
		id = 101048201,
		extra_param = "",
		param = {
			{
				150,
				3.846,
				true,
				"%"
			},
			{
				4,
				0,
				false,
				""
			}
		}
	},
	[101048202] = {
		description = "召唤空袭装置对区域内的敌人进行轰炸，造成共计<color=#E78300>{1}</color>攻击力的光属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101048202,
		extra_param = "",
		param = {
			{
				480,
				12.3,
				true,
				"%"
			}
		}
	},
	[101048203] = {
		description = "持续释放终焉脉冲，每段造成<color=#E78300>{1}</color>攻击力的光属性伤害，共计<color=#E78300>16</color>段。",
		maxLv = 60,
		type = 1,
		id = 101048203,
		extra_param = "",
		param = {
			{
				40,
				1.026,
				true,
				"%"
			}
		}
	},
	[101048208] = {
		description = "暗星·海拉与彗光·前鬼坊天狗的连携奥义。\n暗星·海拉造成<color=#E78300>{1}+{2}</color>×<color=#297DE0>自身奥义等级</color>攻击力的暗属性伤害；命中时全队伍暗属性伤害提高<color=#E78300>{5}</color>，持续<color=#E78300>{6}</color>秒。\n彗光·前鬼坊天狗造成<color=#E78300>{3}+{4}</color>×<color=#297DE0>自身奥义等级</color>攻击力的光属性伤害；命中时全队伍光属性伤害提高<color=#E78300>{7}</color>，持续<color=#E78300>{8}</color>秒。",
		maxLv = 60,
		type = 1,
		id = 101048208,
		extra_param = "",
		param = {
			{
				1200,
				60,
				true,
				"%"
			},
			{
				30.769,
				1.538,
				true,
				"%"
			},
			{
				360,
				18,
				true,
				"%"
			},
			{
				9.231,
				0.462,
				true,
				"%"
			},
			{
				30,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			},
			{
				30,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			}
		}
	},
	[101048209] = {
		description = "对范围敌人发射多枚导弹，造成共计<color=#E78300>{1}</color>攻击力的光属性伤害；每枚导弹命中后全队伍获得<color=#E78300>{2}</color>点能量。\n\n当敌人被附加禁锢状态时，获得<color=#E78300>8%</color>的奥义值，该效果每<color=#E78300>2</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101048209,
		extra_param = "",
		param = {
			{
				360,
				9.351,
				true,
				"%"
			},
			{
				3,
				0,
				false,
				""
			}
		}
	},
	[101048211] = {
		description = "对前方敌人进行<color=#E78300>9</color>轮轰炸，每轮轰炸造成<color=#E78300>{1}</color>攻击力的光属性伤害，对命中的敌人附加禁锢状态，持续<color=#E78300>{2}</color>秒，后续的轰炸对同一个敌人伤害衰减。",
		maxLv = 60,
		type = 1,
		id = 101048211,
		extra_param = "",
		param = {
			{
				150,
				3.846,
				true,
				"%"
			},
			{
				4,
				0,
				false,
				""
			}
		}
	},
	[101048305] = {
		description = "快速闪避敌人攻击，且可以连续施放二次闪避，极限闪避会触发闪避效果。\n闪避效果：对攻击者附加禁锢状态，持续<color=#E78300>{1}</color>秒；闪避效果每<color=#E78300>{2}</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101048305,
		extra_param = "",
		param = {
			{
				6,
				0,
				false,
				""
			},
			{
				14,
				0,
				false,
				""
			}
		}
	},
	[101049101] = {
		description = "随咒刀而动，使用咒刀发动五段斩击，造成共计<color=#E78300>{1}</color>攻击力的冰属性伤害。\n\n被动：\n施放普通攻击第三段时或施放「彼岸·霜舞」、「彼岸·凛冰」时，会生成一个<material=underline c=#FFFFFF h=2 event=terminology args=(104901)>「冰镜」</material>跟随自身。\n<material=underline c=#FFFFFF h=2 event=terminology args=(104901)>「冰镜」</material>：短暂延迟后破碎，对自身有命中判定但不会造成伤害。<material=underline c=#FFFFFF h=2 event=terminology args=(104901)>「冰镜」</material>破碎命中自身时，会产生技能攻击「碎镜·冥」，对敌人造成共计<color=#E78300>{2}</color>攻击力的冰属性伤害，并且自身获得短暂的<material=underline c=#FFFFFF h=2 event=terminology args=(104902)>「镜游」</material>效果；<material=underline c=#FFFFFF h=2 event=terminology args=(104901)>「冰镜」</material>破碎未命中自身时，会产生技能攻击「碎镜·幽」，对敌人造成共计<color=#E78300>{3}</color>攻击力的冰属性伤害。\n<material=underline c=#FFFFFF h=2 event=terminology args=(104902)>「镜游」</material>：拥有该效果时，获得硬直效果，「彼岸·霜舞」、「彼岸·凛冰」会替换为对应的衍生技能。施放普通攻击第五段时会消耗<material=underline c=#FFFFFF h=2 event=terminology args=(104902)>「镜游」</material>效果，并唤出<material=underline c=#FFFFFF h=2 event=terminology args=(104903)>「日狭女」</material>发动技能攻击敌人，造成共计<color=#E78300>{4}</color>攻击力的冰属性伤害。\n自身极限闪避<material=underline c=#FFFFFF h=2 event=terminology args=(104901)>「冰镜」</material>的破碎时，会唤出<material=underline c=#FFFFFF h=2 event=terminology args=(104903)>「日狭女」</material>发动技能攻击敌人，造成共计<color=#E78300>{5}</color>攻击力的冰属性伤害。\n极限闪避后<color=#E78300>1</color>秒内，点击普通攻击会施放追加攻击，造成共计<color=#E78300>{6}</color>攻击力的冰属性伤害。\n\n<color=#297DE0>怒气：</color>普通攻击命中后会获得怒气。",
		maxLv = 60,
		type = 1,
		id = 101049101,
		extra_param = "",
		param = {
			{
				685,
				13.217,
				true,
				"%"
			},
			{
				400,
				10.256,
				true,
				"%"
			},
			{
				500,
				12.82,
				true,
				"%"
			},
			{
				300,
				7.692,
				true,
				"%"
			},
			{
				200,
				5.128,
				true,
				"%"
			},
			{
				200,
				3.846,
				true,
				"%"
			}
		}
	},
	[101049201] = {
		description = "快速释放一道斩击，造成共计<color=#E78300>{1}</color>攻击力的冰属性伤害。\n衍生技能「镜花·霜舞」：施放时获得硬直效果，唤出<material=underline c=#FFFFFF h=2 event=terminology args=(104903)>「日狭女」</material>并与其一同向前突进斩击，消耗<color=#E78300>35</color>点怒气和<material=underline c=#FFFFFF h=2 event=terminology args=(104902)>「镜游」</material>效果，自身造成共计<color=#E78300>{2}</color>攻击力的冰属性伤害、<material=underline c=#FFFFFF h=2 event=terminology args=(104903)>「日狭女」</material>造成共计<color=#E78300>{3}</color>攻击力的冰属性伤害。\n「彼岸·霜舞」和「镜花·霜舞」共用冷却时间。",
		maxLv = 60,
		type = 1,
		id = 101049201,
		extra_param = "",
		param = {
			{
				1500,
				38.46,
				true,
				"%"
			},
			{
				800,
				20.512,
				true,
				"%"
			},
			{
				900,
				23.076,
				true,
				"%"
			}
		}
	},
	[101049202] = {
		description = "挥舞咒刀横扫并上挑，造成共计<color=#E78300>{1}</color>攻击力的冰属性伤害。\n衍生技能「镜花·凛冰」：施放时获得硬直效果，唤出<material=underline c=#FFFFFF h=2 event=terminology args=(104903)>「日狭女」</material>并与其一同旋转斩击，消耗<color=#E78300>40</color>点怒气和<material=underline c=#FFFFFF h=2 event=terminology args=(104902)>「镜游」</material>效果，自身造成共计<color=#E78300>{2}</color>攻击力的冰属性伤害、<material=underline c=#FFFFFF h=2 event=terminology args=(104903)>「日狭女」</material>造成共计<color=#E78300>{3}</color>攻击力的冰属性伤害。\n「彼岸·凛冰」和「镜花·凛冰」共用冷却时间。",
		maxLv = 60,
		type = 1,
		id = 101049202,
		extra_param = "",
		param = {
			{
				1600,
				41.025,
				true,
				"%"
			},
			{
				1000,
				25.64,
				true,
				"%"
			},
			{
				1100,
				28.204,
				true,
				"%"
			}
		}
	},
	[101049203] = {
		description = "唤出<material=underline c=#FFFFFF h=2 event=terminology args=(104903)>「日狭女」</material>，并在身前凝聚寒冰神力，可以长按该技能进入格挡架势，松开长按或达到时间上限时会施放一次攻击，造成共计<color=#E78300>{1}</color>攻击力的冰属性伤害，之后该技能剩余冷却时间缩短<color=#E78300>40%</color>。\n当处于格挡架势被命中后：格挡伤害；对攻击者附加冰冻状态，持续<color=#E78300>{6}</color>秒；自身攻击力提高<color=#E78300>{4}</color>，持续<color=#E78300>{5}</color>秒；获得<color=#E78300>20</color>点怒气；和<material=underline c=#FFFFFF h=2 event=terminology args=(104903)>「日狭女」</material>一同施放斩击，自身造成共计<color=#E78300>{2}</color>攻击力的冰属性伤害、<material=underline c=#FFFFFF h=2 event=terminology args=(104903)>「日狭女」</material>造成共计<color=#E78300>{3}</color>攻击力的冰属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101049203,
		extra_param = "",
		param = {
			{
				1400,
				35.896,
				true,
				"%"
			},
			{
				1200,
				30.765,
				true,
				"%"
			},
			{
				1300,
				33.332,
				true,
				"%"
			},
			{
				20,
				0,
				false,
				"%"
			},
			{
				14,
				0,
				false,
				""
			},
			{
				2.5,
				0,
				false,
				""
			}
		}
	},
	[101049208] = {
		description = "霜影·暗御津羽与镜花黄泉·伊邪那美的连携奥义。\n霜影·暗御津羽造成<color=#E78300>{1}+{2}</color>×<color=#297DE0>自身奥义等级</color>攻击力的冰属性伤害；施放时我方攻击力最高的冰属性修正者获得<material=underline c=#FFFFFF h=2 event=terminology args=(105502)>「凝寒」</material>状态，持续<color=#E78300>15</color>秒；命中时全队伍怒气型修正者技能伤害提高<color=#E78300>{7}</color>，持续<color=#E78300>{8}</color>秒。\n镜花黄泉·伊邪那美造成<color=#E78300>{3}+{4}</color>×<color=#297DE0>自身奥义等级</color>攻击力的冰属性伤害；施放时全队伍冰属性伤害提高<color=#E78300>{5}</color>，持续<color=#E78300>{6}</color>秒。",
		maxLv = 60,
		type = 1,
		id = 101049208,
		extra_param = "",
		param = {
			{
				1000,
				0,
				false,
				"%"
			},
			{
				25.641,
				0,
				false,
				"%"
			},
			{
				1200,
				0,
				false,
				"%"
			},
			{
				30.769,
				0,
				false,
				"%"
			},
			{
				30,
				0,
				false,
				"%"
			},
			{
				15,
				0,
				false,
				""
			},
			{
				25,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			}
		}
	},
	[101049209] = {
		description = "从常世冰镜中唤出<material=underline c=#FFFFFF h=2 event=terminology args=(104903)>「日狭女」</material>，与其一同释放寒冰神能斩击敌人，自身造成<color=#E78300>{1}</color>攻击力的冰属性伤害、<material=underline c=#FFFFFF h=2 event=terminology args=(104903)>「日狭女」</material>造成<color=#E78300>{2}</color>攻击力的冰属性伤害；施放时全队伍冰属性伤害提高<color=#E78300>{3}</color>，持续<color=#E78300>{4}</color>秒；施放期间对前方敌人附加冰冻状态，自身命中后移除敌人的冰冻状态。\n\n自身或者队友攻击造成会心后，获得<color=#E78300>3%</color>的奥义值，该效果每<color=#E78300>2</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101049209,
		extra_param = "",
		param = {
			{
				720,
				18.461,
				true,
				"%"
			},
			{
				480,
				12.307,
				true,
				"%"
			},
			{
				30,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			}
		}
	},
	[101049305] = {
		description = "快速闪避敌人攻击，极限闪避会触发闪避效果。\n闪避效果：进入零时空间使全场敌人动作大幅减速，持续<color=#E78300>2</color>秒；攻击力提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒；闪避效果每<color=#E78300>{3}</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101049305,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			},
			{
				14,
				0,
				false,
				""
			},
			{
				20,
				0,
				false,
				""
			}
		}
	},
	[101050101] = {
		description = "连续挥动太刀斩击敌人，造成共计<color=#E78300>{1}</color>攻击力的物理属性伤害。\n\n<color=#297DE0>印记：</color>最后一段攻击命中后获得<color=#E78300>{2}</color>个印记，通过该方式获得的印记最多存在<color=#E78300>1</color>个。",
		maxLv = 60,
		type = 1,
		id = 101050101,
		extra_param = "",
		param = {
			{
				124,
				2.448,
				true,
				"%"
			},
			{
				1,
				0,
				false,
				""
			}
		}
	},
	[101050201] = {
		description = "对目标进行三段攻击，造成共计<color=#E78300>{1}</color>攻击力的物理属性伤害。\n\n<color=#297DE0>印记：</color>每次施放命中后，获得<color=#E78300>{2}</color>个印记。",
		maxLv = 60,
		type = 1,
		id = 101050201,
		extra_param = "",
		param = {
			{
				110,
				2.82,
				true,
				"%"
			},
			{
				1,
				0,
				false,
				""
			}
		}
	},
	[101050202] = {
		description = "向目标斩出十字刀光，造成共计<color=#E78300>{1}</color>攻击力的物理属性伤害。\n\n<color=#297DE0>印记：</color>每次施放命中后，获得<color=#E78300>{2}</color>个印记。",
		maxLv = 60,
		type = 1,
		id = 101050202,
		extra_param = "",
		param = {
			{
				180,
				4.614,
				true,
				"%"
			},
			{
				1,
				0,
				false,
				""
			}
		}
	},
	[101050203] = {
		description = "进行一次居合斩，对锁定的敌人施放刀阵，施放后的<color=#E78300>3</color>秒内，可消耗印记施放「绯·散华」的下一式，刀阵的攻击范围提高，「绯·散华」共有三式，会优先消耗通过「五蕴绯想斩」获得的印记。\n「绯·散华」第一式：造成共计<color=#E78300>{1}</color>攻击力的物理属性伤害。\n「绯·散华」第二式：造成共计<color=#E78300>{2}</color>攻击力的物理属性伤害。\n「绯·散华」第三式：造成共计<color=#E78300>{3}</color>攻击力的物理属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101050203,
		extra_param = "",
		param = {
			{
				40,
				1.024,
				true,
				"%"
			},
			{
				80,
				2.05,
				true,
				"%"
			},
			{
				120,
				3.076,
				true,
				"%"
			}
		}
	},
	[101050208] = {
		description = "震离·月读与真红·丰前坊天狗的连携奥义。\n震离·月读造成<color=#E78300>{1}+{2}</color>×<color=#297DE0>自身奥义等级</color>攻击力的雷属性伤害；命中时全队伍雷属性伤害提高<color=#E78300>{5}</color>，持续<color=#E78300>{6}</color>秒。\n真红·丰前坊天狗造成<color=#E78300>{3}+{4}</color>×<color=#297DE0>自身奥义等级</color>攻击力的物理属性伤害；命中后进入零时空间使全场敌人动作大幅减速，持续<color=#E78300>5</color>秒，自身每额外命中<color=#E78300>1</color>个敌人，全队伍获得<color=#E78300>7.5%</color>的奥义值。",
		maxLv = 60,
		type = 1,
		id = 101050208,
		extra_param = "",
		param = {
			{
				1000,
				50,
				true,
				"%"
			},
			{
				25.641,
				1.282,
				true,
				"%"
			},
			{
				360,
				18,
				true,
				"%"
			},
			{
				9.231,
				0.462,
				true,
				"%"
			},
			{
				30,
				0,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[101050209] = {
		description = "向锁定方向突进并挥斩，对范围内的敌人造成共计<color=#E78300>{1}</color>攻击力的物理属性伤害；施放时进入零时空间<color=#E78300>3</color>秒。\n\n自身或者队友的技能和奥义造成会心后，获得<color=#E78300>4%</color>的奥义值，该效果每<color=#E78300>2</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101050209,
		extra_param = "",
		param = {
			{
				359,
				9.358,
				true,
				"%"
			}
		}
	},
	[101050221] = {
		description = "向锁定的敌人斩出可以飞行一段距离的十字刀光，造成共计<color=#E78300>{1}</color>攻击力的物理属性伤害，对命中的敌人附加破甲状态，持续<color=#E78300>{2}</color>秒。\n\n<color=#297DE0>印记：</color>攻击第一段命中后获得<color=#E78300>1</color>个印记，刀光飞行命中时额外获得<color=#E78300>1</color>个印记。",
		maxLv = 60,
		type = 1,
		id = 101050221,
		extra_param = "",
		param = {
			{
				240,
				6.152,
				true,
				"%"
			},
			{
				6,
				0,
				false,
				""
			}
		}
	},
	[101050281] = {
		description = "觅影·国常立与真红·丰前坊天狗的连携奥义。\n觅影·国常立造成<color=#E78300>{1}+{2}</color>×<color=#297DE0>平均技能等级</color>的攻击力的物理属性伤害；命中时对敌人附加物理、火属性、雷属性和风属性抗性降低<color=#E78300>{5}</color>，持续<color=#E78300>{6}</color>秒。\n真红·丰前坊天狗造成<color=#E78300>{3}+{4}</color>×<color=#297DE0>自身奥义等级</color>攻击力的物理属性伤害；命中后进入零时空间使全场敌人动作大幅减速，持续<color=#E78300>5</color>秒，自身每额外命中<color=#E78300>1</color>个敌人，全队伍获得<color=#E78300>7.5%</color>的奥义值。",
		maxLv = 60,
		type = 1,
		id = 101050281,
		extra_param = "",
		param = {
			{
				1000,
				50,
				true,
				"%"
			},
			{
				25.641,
				1.282,
				true,
				"%"
			},
			{
				360,
				18,
				true,
				"%"
			},
			{
				9.231,
				0.462,
				true,
				"%"
			},
			{
				30,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			}
		}
	},
	[101050305] = {
		description = "快速闪避敌人攻击，且可以连续施放二次闪避，极限闪避会触发闪避效果。\n闪避效果：进入零时空间使全场敌人动作大幅减速，持续<color=#E78300>2</color>秒；获得<color=#E78300>2%</color>的奥义值；闪避效果每<color=#E78300>{1}</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101050305,
		extra_param = "",
		param = {
			{
				20,
				0,
				false,
				""
			}
		}
	},
	[101052101] = {
		description = "使用怒蛇进行两轮射击，造成共计<color=#E78300>{1}</color>攻击力的物理属性伤害，随后呼叫<material=underline c=#FFFFFF h=2 event=terminology args=(105202)>「暴风模式」</material>的无人机进行火力覆盖对前方区域进行最多十二次轰炸，每次轰炸造成<color=#E78300>{2}</color>攻击力的物理属性伤害。当拥有「火力覆盖战术」的技能一基础伤害提高的加成效果时，普通攻击最后一段会呼叫<material=underline c=#FFFFFF h=2 event=terminology args=(105202)>「暴风模式」</material>的无人机并向前方翻滚进行连续三次炮击，每次炮击造成<color=#E78300>{4}</color>攻击力的物理属性伤害。\n\n被动：\n每消耗<color=#E78300>1</color>点能量会获得<color=#E78300>1</color>点<material=underline c=#FFFFFF h=2 event=terminology args=(105201)>「火力计数」</material>，<material=underline c=#FFFFFF h=2 event=terminology args=(105201)>「火力计数」</material>上限<color=#E78300>300</color>点；普通攻击第三段结束时会上膛并可获得<color=#E78300>40</color>点<material=underline c=#FFFFFF h=2 event=terminology args=(105201)>「火力计数」</material>。<material=underline c=#FFFFFF h=2 event=terminology args=(105201)>「火力计数」</material>为满时，可以长按普通攻击施放「怒蛇咆吼」。\n「怒蛇咆吼」：怒蛇射速达到极限向敌人倾泻火力施放技能攻击，每<color=#E78300>0.2</color>秒消耗<color=#E78300>12</color>点<material=underline c=#FFFFFF h=2 event=terminology args=(105201)>「火力计数」</material>，施放<color=#E78300>5</color>段攻击，每段造成共计<color=#E78300>{5}</color>攻击力的物理属性伤害，最多持续<color=#E78300>5</color>秒，期间无法获得<material=underline c=#FFFFFF h=2 event=terminology args=(105201)>「火力计数」</material>。\n\n<color=#297DE0>能量：</color>每秒自动获得<color=#E78300>2</color>点能量，普通攻击和「怒蛇咆吼」每次命中获得<color=#E78300>{3}</color>点能量。",
		maxLv = 60,
		type = 1,
		id = 101052101,
		extra_param = "",
		param = {
			{
				225,
				4.326,
				true,
				"%"
			},
			{
				12,
				0.24,
				true,
				"%"
			},
			{
				1,
				0,
				false,
				""
			},
			{
				120,
				3.076,
				true,
				"%"
			},
			{
				800,
				20.51,
				true,
				"%"
			}
		}
	},
	[101052201] = {
		description = "使用怒蛇对敌人进行连续三次炮击，每次炮击造成<color=#E78300>{1}</color>攻击力的物理属性伤害。每次炮击命中后，全队伍技能一基础伤害提高<color=#E78300>5%</color>，持续<color=#E78300>5</color>秒，每次叠加刷新并延长<color=#E78300>1</color>秒，最多可叠加<color=#E78300>3</color>层。每次炮击获得<color=#E78300>{2}</color>点能量。技能施放结束时，根据未释放的炮击次数该技能的剩余冷却时间缩短，每少释放一次炮击，该技能的剩余冷却时间缩短<color=#E78300>20%</color>。能量为满时，该技能会替换为「火力支援战术」。\n「火力支援战术」：消耗<color=#E78300>30</color>点能量，呼叫远程炮火轰炸前方区域，造成共计<color=#E78300>{3}</color>攻击力的物理属性伤害；施放「怒蛇咆吼」且能量为满时会自动消耗能量并施放「火力支援战术」。",
		maxLv = 60,
		type = 1,
		id = 101052201,
		extra_param = "",
		param = {
			{
				120,
				3.076,
				true,
				"%"
			},
			{
				5,
				0,
				false,
				""
			},
			{
				100,
				2.56,
				true,
				"%"
			}
		}
	},
	[101052202] = {
		description = "用怒蛇轰击敌人，造成共计<color=#E78300>{1}</color>攻击力的物理属性伤害并对区域内所有敌人附加眩晕状态，持续<color=#E78300>{3}</color>秒。命中后呼叫<material=underline c=#FFFFFF h=2 event=terminology args=(105203)>「凶风模式」</material>的无人机对区域进行攻击，造成共计<color=#E78300>{2}</color>攻击力的物理属性伤害；施放该技能后<material=underline c=#FFFFFF h=2 event=terminology args=(105201)>「火力计数」</material>消耗降低<color=#E78300>20%</color>，持续<color=#E78300>7</color>秒。\n自身或者队友每次呼叫该无人机命中时，该技能冷却时间缩短<color=#E78300>0.4</color>秒、能量消耗增加<color=#E78300>2</color>点，该效果提供的冷却时间缩短最高为<color=#E78300>6</color>秒、能量消耗增加最高为<color=#E78300>30</color>点。",
		maxLv = 60,
		type = 1,
		id = 101052202,
		extra_param = "",
		param = {
			{
				700,
				17.948,
				true,
				"%"
			},
			{
				349,
				8.972,
				true,
				"%"
			},
			{
				4,
				0,
				false,
				""
			}
		}
	},
	[101052203] = {
		description = "抛出内爆手雷，手雷爆炸后造成共计<color=#E78300>{1}</color>攻击力的物理属性伤害，并短暂聚集敌人。之后呼叫<material=underline c=#FFFFFF h=2 event=terminology args=(105204)>「恶风模式」</material>的无人机对区域进行攻击，造成共计<color=#E78300>{2}</color>攻击力的物理属性伤害；施放该技能后<material=underline c=#FFFFFF h=2 event=terminology args=(105201)>「火力计数」</material>获得率提高<color=#E78300>20%</color>，持续<color=#E78300>7</color>秒。\n自身或者队友每次呼叫该无人机命中时，该技能冷却时间缩短<color=#E78300>0.4</color>秒、能量消耗增加<color=#E78300>2</color>点，该效果提供的冷却时间缩短最高为<color=#E78300>6</color>秒、能量消耗增加最高为<color=#E78300>30</color>点。",
		maxLv = 60,
		type = 1,
		id = 101052203,
		extra_param = "",
		param = {
			{
				700,
				17.948,
				true,
				"%"
			},
			{
				348,
				8.962,
				true,
				"%"
			}
		}
	},
	[101052209] = {
		description = "呼叫多架<material=underline c=#FFFFFF h=2 event=terminology args=(105207)>「雨洪模式」</material>的无人机对目标区域进行最多十二次轰炸，每次轰炸造成<color=#E78300>{1}</color>攻击力的物理属性伤害；对命中的敌人附加破甲状态，防御力降低<color=#E78300>{2}</color>，持续<color=#E78300>{3}</color>秒。\n\n自身或者队友成功消耗能量时，获得<color=#E78300>6%</color>的奥义值，该效果每<color=#E78300>2</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101052209,
		extra_param = "",
		param = {
			{
				100,
				2.564,
				true,
				"%"
			},
			{
				25,
				0,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[101052221] = {
		description = "用怒蛇轰击敌人，造成共计<color=#E78300>{1}</color>攻击力的物理属性伤害并对区域内所有敌人附加眩晕状态，持续<color=#E78300>{2}</color>秒。命中后呼叫<material=underline c=#FFFFFF h=2 event=terminology args=(105205)>「旋风模式」</material>的无人机扫描轰击区域；当队友存在时会根据队友的伤害属性种类和数量，分别对敌人附加对应属性抗性降低<color=#E78300>5%</color>，持续<color=#E78300>{3}</color>秒，相同的效果最多可叠加<color=#E78300>2</color>层。\n自身或者队友每次呼叫该无人机命中时，该技能冷却时间缩短<color=#E78300>0.4</color>秒、能量消耗增加<color=#E78300>2</color>点，该效果提供的冷却时间缩短最高为<color=#E78300>6</color>秒、能量消耗增加最高为<color=#E78300>30</color>点。",
		maxLv = 60,
		type = 1,
		id = 101052221,
		extra_param = "",
		param = {
			{
				700,
				17.948,
				true,
				"%"
			},
			{
				4,
				0,
				false,
				""
			},
			{
				12,
				0,
				false,
				""
			}
		}
	},
	[101052231] = {
		description = "抛出内爆手雷，手雷爆炸后造成共计<color=#E78300>{1}</color>攻击力的物理属性伤害，并短暂聚集敌人。之后呼叫<material=underline c=#FFFFFF h=2 event=terminology args=(105206)>「飓风模式」</material>的无人机向爆炸区域丢下最多六个减速陷阱；陷阱持续对敌人造成伤害，每个陷阱造成共计<color=#E78300>{2}</color>攻击力的物理属性伤害，对命中的敌人附加动作迟缓状态，持续<color=#E78300>{3}</color>秒，每次叠加会略微提高迟缓效果。\n自身或者队友每次呼叫该无人机命中时，该技能冷却时间缩短<color=#E78300>0.4</color>秒、能量消耗增加<color=#E78300>2</color>点，该效果提供的冷却时间缩短最高为<color=#E78300>6</color>秒、能量消耗增加最高为<color=#E78300>30</color>点。",
		maxLv = 60,
		type = 1,
		id = 101052231,
		extra_param = "",
		param = {
			{
				700,
				17.948,
				true,
				"%"
			},
			{
				100,
				2.554,
				true,
				"%"
			},
			{
				2,
				0,
				false,
				""
			}
		}
	},
	[101052305] = {
		description = "快速闪避敌人攻击，极限闪避会触发闪避效果。\n闪避效果：自身受到的伤害降低<color=#E78300>{1}</color>，根据自身的<material=underline c=#FFFFFF h=2 event=terminology args=(105201)>「火力计数」</material>额外降低受到的伤害，每<color=#E78300>1</color>点受到的伤害额外降低<color=#E78300>0.1%</color>，持续<color=#E78300>{2}</color>秒；闪避效果每<color=#E78300>{3}</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101052305,
		extra_param = "",
		param = {
			{
				20,
				0.1,
				true,
				"%"
			},
			{
				7,
				0,
				false,
				""
			},
			{
				14,
				0,
				false,
				""
			}
		}
	},
	[101055101] = {
		description = "挥舞薙刀进行五段斩击，造成共计<color=#E78300>{1}</color>攻击力的冰属性伤害。\n\n被动：\n施放任意一段普攻后衔接施放「破霜击」或「霜影击」，在短暂时间内不会打断普通攻击的连段。\n\n<color=#297DE0>怒气：</color>普通攻击命中后会获得怒气。",
		maxLv = 60,
		type = 1,
		id = 101055101,
		extra_param = "",
		param = {
			{
				534,
				10.33,
				true,
				"%"
			}
		}
	},
	[101055201] = {
		description = "挥舞薙刀斩击的同时向前方进行两段突进，造成共计<color=#E78300>{1}</color>攻击力的冰属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101055201,
		extra_param = "",
		param = {
			{
				1000,
				25.636,
				true,
				"%"
			}
		}
	},
	[101055202] = {
		description = "于刀尖凝聚寒冰神力，在目标区域引发冰晶爆炸，造成共计<color=#E78300>{1}</color>攻击力的冰属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101055202,
		extra_param = "",
		param = {
			{
				1500,
				38.46,
				true,
				"%"
			}
		}
	},
	[101055203] = {
		description = "挥舞薙刀向前突刺，造成共计<color=#E78300>{1}</color>攻击力的冰属性伤害。\n施放每段普通攻击、直接施放的「破霜击」、「曳影击」、「碎月击」后短暂时间内可以衔接施放该技能，「破霜击」会衍生出不同的攻击模式。\n每段普通攻击后衔接施放「破霜击」、直接施放的「破霜击」后衔接施放「破霜击」，造成共计<color=#E78300>{2}</color>攻击力的冰属性伤害；\n「曳影击」后衔接施放「破霜击」，横扫周身后跃身纵斩造成共计<color=#E78300>{3}</color>攻击力的冰属性伤害；\n「碎月击」后衔接施放「破霜击」，跃起后向目标突刺造成共计<color=#E78300>{4}</color>攻击力的冰属性伤害。\n衔接施放的「破霜击」命中时，对命中的敌人附加冰属性抗性降低<color=#E78300>10%</color>，持续<color=#E78300>{5}</color>秒。",
		maxLv = 60,
		type = 1,
		id = 101055203,
		extra_param = "",
		param = {
			{
				100,
				2.564,
				true,
				"%"
			},
			{
				900,
				17.306,
				true,
				"%"
			},
			{
				750,
				19.23,
				true,
				"%"
			},
			{
				900,
				23.076,
				true,
				"%"
			},
			{
				6,
				0,
				false,
				""
			}
		}
	},
	[101055208] = {
		description = "霜影·暗御津羽与震离·月读的连携奥义。\n霜影·暗御津羽造成<color=#E78300>{1}+{2}</color>×<color=#297DE0>自身奥义等级</color>攻击力的冰属性伤害；施放时我方攻击力最高的冰属性修正者获得<material=underline c=#FFFFFF h=2 event=terminology args=(105502)>「凝寒」</material>状态，持续<color=#E78300>15</color>秒；命中时全队伍怒气型修正者技能伤害提高<color=#E78300>{9}</color>，持续<color=#E78300>{10}</color>秒。\n震离·月读造成<color=#E78300>{3}+{4}</color>×<color=#297DE0>自身奥义等级</color>攻击力的雷属性伤害；施放时全队伍雷属性伤害提高<color=#E78300>{5}</color>，持续<color=#E78300>{6}</color>秒；自身会心伤害提高<color=#E78300>{7}</color>，持续<color=#E78300>{8}</color>秒。",
		maxLv = 60,
		type = 1,
		id = 101055208,
		extra_param = "",
		param = {
			{
				1000,
				50,
				true,
				"%"
			},
			{
				25.641,
				1.282,
				true,
				"%"
			},
			{
				840,
				42,
				true,
				"%"
			},
			{
				21.538,
				1.077,
				true,
				"%"
			},
			{
				30,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			},
			{
				15,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			},
			{
				25,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			}
		}
	},
	[101055209] = {
		description = "在刀锋上凝集大量寒冰神力斩击敌人，造成共计<color=#E78300>{1}</color>攻击力的冰属性伤害；施放时我方攻击力最高的冰属性修正者获得<material=underline c=#FFFFFF h=2 event=terminology args=(105502)>「凝寒」</material>状态，持续<color=#E78300>15</color>秒。\n<material=underline c=#FFFFFF h=2 event=terminology args=(105502)>「凝寒」</material>：获得霸体效果，受到的伤害降低<color=#E78300>{2}</color>；会心伤害提高<color=#E78300>35%</color>，霜影·暗御津羽每有<color=#E78300>1%</color>冰属性伤害，会心伤害额外提高<color=#E78300>1%</color>，<material=underline c=#FFFFFF h=2 event=terminology args=(105502)>「凝寒」</material>状态提供的会心伤害提高最高为<color=#E78300>120%</color>；攻击命中时会对敌人附加<material=underline c=#FFFFFF h=2 event=terminology args=(105501)>「霜结」</material>状态，该效果每<color=#E78300>1</color>秒最多触发一次。\n\n自身或者队友触发零时空间时，获得<color=#E78300>15%</color>的奥义值，该效果每<color=#E78300>0.5</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101055209,
		extra_param = "",
		param = {
			{
				1000,
				25.64,
				true,
				"%"
			},
			{
				30,
				0,
				false,
				"%"
			}
		}
	},
	[101055281] = {
		description = "斩浪·丝卡蒂与霜影·暗御津羽的连携奥义。\n斩浪·丝卡蒂造成<color=#E78300>{1}+{2}</color>×<color=#297DE0>自身奥义等级</color>攻击力的冰属性伤害；命中时全队伍蓄力技能伤害提高<color=#E78300>{5}</color>，持续<color=#E78300>{6}</color>秒。\n霜影·暗御津羽造成<color=#E78300>{3}+{4}</color>×<color=#297DE0>自身奥义等级</color>攻击力的冰属性伤害；施放时我方攻击力最高的冰属性修正者获得<material=underline c=#FFFFFF h=2 event=terminology args=(105502)>「凝寒」</material>状态，持续<color=#E78300>15</color>秒；命中时全队伍技能伤害提高<color=#E78300>{7}</color>，持续<color=#E78300>{8}</color>秒。",
		maxLv = 60,
		type = 1,
		id = 101055281,
		extra_param = "",
		param = {
			{
				1000,
				50,
				true,
				"%"
			},
			{
				25.641,
				1.282,
				true,
				"%"
			},
			{
				1000,
				50,
				true,
				"%"
			},
			{
				25.641,
				1.282,
				true,
				"%"
			},
			{
				45,
				0,
				false,
				"%"
			},
			{
				15,
				0,
				false,
				""
			},
			{
				20,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			}
		}
	},
	[101055305] = {
		description = "快速闪避敌人攻击，极限闪避会触发闪避效果。\n施放每段普通攻击、直接施放的「破霜击」、「曳影击」、「碎月击」后短暂时间内可以衔接非移动闪避施放「霜影击」，释放神力凝结而成的寒霜刃气攻击敌人，不同的攻击衔接施放的「霜影击」有不同的攻击模式。\n普通攻击后衔接施放「霜影击」、直接施放的「破霜击」后衔接施放「霜影击」，造成共计<color=#E78300>{1}</color>攻击力的冰属性伤害。\n「曳影击」后衔接施放「霜影击」，造成共计<color=#E78300>{2}</color>攻击力的冰属性伤害。\n「碎月击」后衔接施放「霜影击」，造成共计<color=#E78300>{3}</color>攻击力的冰属性伤害。\n「霜影击」每次命中时对敌人附加<material=underline c=#FFFFFF h=2 event=terminology args=(105501)>「霜结」</material>状态，持续<color=#E78300>10</color>秒，最多可叠加<color=#E78300>7</color>层。全队伍冰属性攻击命中处于<material=underline c=#FFFFFF h=2 event=terminology args=(105501)>「霜结」</material>状态的敌人时，每有<color=#E78300>1</color>层命中瞬间会心率提高<color=#E78300>0.8%</color>。\n闪避效果：进入零时空间使全场敌人动作大幅减速，持续<color=#E78300>3</color>秒；闪避效果每<color=#E78300>{4}</color>秒最多触发一次。\n\n<color=#297DE0>怒气：</color>「霜影击」命中后会获得怒气。",
		maxLv = 60,
		type = 1,
		id = 101055305,
		extra_param = "",
		param = {
			{
				200,
				5.125,
				true,
				"%"
			},
			{
				500,
				12.816,
				true,
				"%"
			},
			{
				500,
				12.817,
				true,
				"%"
			},
			{
				20,
				0,
				false,
				""
			}
		}
	},
	[101056101] = {
		description = "连续使用拳脚对目标进行攻击，造成共计<color=#E78300>{1}</color>攻击力的雷属性伤害。\n施放「神怒·踏鸣」命中时、施放「神怒·雷织」命中时，该技能获得强化效果。\n强化的「雷武真拳」最后一段攻击会额外召唤一道落雷对范围内的敌人进行攻击，造成<color=#E78300>{2}</color>攻击力的雷属性伤害。\n\n<color=#297DE0>能量：</color>每秒自动获得<color=#E78300>3</color>点能量。",
		maxLv = 60,
		type = 1,
		id = 101056101,
		extra_param = "",
		param = {
			{
				189,
				3.675,
				true,
				"%"
			},
			{
				140,
				3.589,
				true,
				"%"
			}
		}
	},
	[101056201] = {
		description = "对锁定的敌人使用两段踢击，造成共计<color=#E78300>{1}</color>攻击力的雷属性伤害。\n普通攻击最后一段命中时、施放「神怒·千雳」命中时，该技能获得强化效果。\n强化的「神怒·踏鸣」第二段踢击对会对命中的敌人附加眩晕状态，持续<color=#E78300>{2}</color>秒。",
		maxLv = 60,
		type = 1,
		id = 101056201,
		extra_param = "",
		param = {
			{
				180,
				4.614,
				true,
				"%"
			},
			{
				3,
				0,
				false,
				""
			}
		}
	},
	[101056202] = {
		description = "对锁定的敌人发动连续的踢击，造成共计<color=#E78300>{1}</color>攻击力的雷属性伤害。\n普通攻击最后一段命中时、施放「神怒·千雳」命中时，该技能获得强化效果。\n强化的「神怒·雷织」可通过连点增加额外踢击次数，每次踢击造成<color=#E78300>{2}</color>攻击力的雷属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101056202,
		extra_param = "",
		param = {
			{
				248,
				6.408,
				true,
				"%"
			},
			{
				56,
				1.442,
				true,
				"%"
			}
		}
	},
	[101056203] = {
		description = "对锁定的敌人发动连续的攻击，造成共计<color=#E78300>{1}</color>攻击力的雷属性伤害，最后再打出一拳，造成共计<color=#E78300>{2}</color>攻击力的雷属性伤害。\n施放「神怒·踏鸣」命中时、施放「神怒·雷织」命中时，该技能获得强化效果。\n强化的「神怒·千雳」最后一拳会自动进行最多<color=#E78300>3</color>段蓄力，再次点击或者满蓄力时会施放，根据该技能蓄力段数分别造成<color=#E78300>{3}</color>，<color=#E78300>{4}</color>，<color=#E78300>{5}</color>攻击力的雷属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101056203,
		extra_param = "",
		param = {
			{
				320,
				8.205,
				true,
				"%"
			},
			{
				160,
				4.102,
				true,
				"%"
			},
			{
				160,
				4.102,
				true,
				"%"
			},
			{
				320,
				8.205,
				true,
				"%"
			},
			{
				640,
				16.41,
				true,
				"%"
			}
		}
	},
	[101056208] = {
		description = "雷獠·伽梨与斩浪·丝卡蒂的连携奥义。\n雷獠·伽梨造成<color=#E78300>{1}+{2}</color>×<color=#297DE0>自身奥义等级</color>攻击力的雷属性伤害；命中后全队伍伤害提高<color=#E78300>10%</color>，持续<color=#E78300>{5}</color>秒，修正者每有<color=#E78300>1%</color>机制值，伤害额外提高<color=#E78300>0.4%</color>，该效果提供的伤害额外提高最高为<color=#E78300>40%</color>。\n斩浪·丝卡蒂造成<color=#E78300>{3}+{4}</color>×<color=#297DE0>自身奥义等级</color>攻击力的冰属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101056208,
		extra_param = "",
		param = {
			{
				500,
				25,
				true,
				"%"
			},
			{
				12.821,
				0.641,
				true,
				"%"
			},
			{
				1000,
				50,
				true,
				"%"
			},
			{
				25.641,
				1.282,
				true,
				"%"
			},
			{
				12,
				0,
				false,
				""
			}
		}
	},
	[101056209] = {
		description = "蓄积雷电后向目标方向轰击，造成共计<color=#E78300>{1}</color>攻击力的雷属性伤害；施放时全队伍能量型修正者的伤害提高<color=#E78300>{2}</color>，持续<color=#E78300>{3}</color>秒。\n\n自身或者队友触发闪避效果时，获得<color=#E78300>15%</color>的奥义值，该效果每<color=#E78300>0.5</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101056209,
		extra_param = "",
		param = {
			{
				500,
				12.82,
				true,
				"%"
			},
			{
				30,
				0,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[101056305] = {
		description = "快速闪避敌人攻击，极限闪避会触发闪避效果。「神怒·千雳」蓄力期间，极限闪避时会保留已完成的蓄力段数，未受击时可以点击继续蓄力。\n闪避效果：进入零时空间使全场敌人动作大幅减速，持续<color=#E78300>2</color>秒；闪避效果每<color=#E78300>{1}</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101056305,
		extra_param = "",
		param = {
			{
				20,
				0,
				false,
				""
			}
		}
	},
	[101058101] = {
		description = "连续挥舞大太刀斩击敌人，造成共计<color=#E78300>{1}</color>攻击力的火属性伤害。每次攻击命中，自身受到的伤害降低<color=#E78300>{2}</color>，持续<color=#E78300>{3}</color>秒，最多可叠加<color=#E78300>10</color>层。\n\n被动：\n「烬祸·焚涅」、「秘剑·焚涅」、「烬祸·牙突」、「秘剑·牙突」、「烬祸·熔火」命中后<color=#E78300>7</color>秒内下一次点击普通攻击会施放技能「绯狱舞炎·改」。\n「绯狱舞炎·改」：造成共计<color=#E78300>255%</color>攻击力的火属性伤害。施放后自身获得硬直效果，持续<color=#E78300>{4}</color>秒。「绯狱舞炎·改」每施放<color=#E78300>3</color>次，会触发技能「绯狱舞炎·炎爆」。\n「绯狱舞炎·炎爆」：造成共计<color=#E78300>360%</color>攻击力的火属性伤害。\n\n<color=#297DE0>能量：</color>每秒自动获得<color=#E78300>3</color>点能量；「绯狱舞炎·改」命中时获得<color=#E78300>10</color>点能量。",
		maxLv = 60,
		type = 1,
		id = 101058101,
		extra_param = "",
		param = {
			{
				222,
				4.324,
				true,
				"%"
			},
			{
				3,
				0,
				false,
				"%"
			},
			{
				5,
				0,
				false,
				""
			},
			{
				5,
				0,
				false,
				""
			}
		}
	},
	[101058201] = {
		description = "释放两次横扫，造成共计<color=#E78300>{1}</color>攻击力的火属性伤害。\n「烬祸·焚涅·改」：造成共计<color=#E78300>{2}</color>攻击力的火属性伤害，该技能有<color=#E78300>12</color>秒的冷却时间，施放后该技能会替换为衍生技能「秘剑·焚涅」。\n「秘剑·焚涅」：进行一次上撩攻击，造成共计<color=#E78300>{3}</color>攻击力的火属性伤害，该技能有<color=#E78300>6</color>秒的冷却时间。",
		maxLv = 60,
		type = 1,
		id = 101058201,
		extra_param = "",
		param = {
			{
				130,
				3.332,
				true,
				"%"
			},
			{
				230,
				5.896,
				true,
				"%"
			},
			{
				355,
				9.102,
				true,
				"%"
			}
		}
	},
	[101058202] = {
		description = "向锁定的敌人突刺，造成共计<color=#E78300>{1}</color>攻击力的火属性伤害。\n「烬祸·牙突·改」：造成共计<color=#E78300>{2}</color>攻击力的火属性伤害，该技能有<color=#E78300>12</color>秒的冷却时间，施放后该技能会替换为衍生技能「秘剑·牙突」。\n「秘剑·牙突」：进行两次交叉斩，造成共计<color=#E78300>{3}</color>攻击力的火属性伤害，该技能有<color=#E78300>6</color>秒的冷却时间。",
		maxLv = 60,
		type = 1,
		id = 101058202,
		extra_param = "",
		param = {
			{
				130,
				3.333,
				true,
				"%"
			},
			{
				230,
				5.897,
				true,
				"%"
			},
			{
				354,
				9.102,
				true,
				"%"
			}
		}
	},
	[101058203] = {
		description = "挥舞大太刀上挑并施放一道刀波，造成共计<color=#E78300>{1}</color>攻击力的火属性伤害，自身进入<material=underline c=#FFFFFF h=2 event=terminology args=(105801)>「染火」</material>状态，持续<color=#E78300>18</color>秒，并重置「烬祸·焚涅」、「烬祸·焚涅·改」、「烬祸·牙突」、「烬祸·牙突·改」的冷却时间。\n<material=underline c=#FFFFFF h=2 event=terminology args=(105801)>「染火」</material>：「烬祸·焚涅」会替换为「烬祸·焚涅·改」、「烬祸·牙突」会替换为「烬祸·牙突·改」，每段普通攻击都视为施放技能攻击。",
		maxLv = 60,
		type = 1,
		id = 101058203,
		extra_param = "",
		param = {
			{
				250,
				6.41,
				true,
				"%"
			}
		}
	},
	[101058208] = {
		description = "烙焰·提尔与龙切·迦具土的连携奥义。\n烙焰·提尔造成<color=#E78300>{1}+{2}</color>×<color=#297DE0>自身奥义等级</color>攻击力的火属性伤害；命中时全队伍技能伤害提高<color=#E78300>{6}</color>、奥义伤害提高<color=#E78300>{7}</color>，持续<color=#E78300>{8}</color>秒。\n龙切·迦具土造成<color=#E78300>{3}+{4}</color>×<color=#297DE0>自身奥义等级</color>攻击力的火属性伤害；命中时全队伍火属性伤害提高<color=#E78300>{5}</color>，持续<color=#E78300>{8}</color>秒。",
		maxLv = 60,
		type = 1,
		id = 101058208,
		extra_param = "",
		param = {
			{
				1160,
				0,
				false,
				"%"
			},
			{
				29.744,
				0,
				false,
				"%"
			},
			{
				1150,
				0,
				false,
				"%"
			},
			{
				29.487,
				0,
				false,
				"%"
			},
			{
				40,
				0,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				"%"
			},
			{
				20,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			}
		}
	},
	[101058209] = {
		description = "挥舞大太刀向周围释放火浪，造成共计<color=#E78300>{1}</color>攻击力的火属性伤害；施放后全队伍火属性伤害提高<color=#E78300>{2}</color>，持续<color=#E78300>{3}</color>秒。\n\n自身或者队友触发闪避效果时，获得<color=#E78300>15%</color>的奥义值，该效果每<color=#E78300>0.5</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101058209,
		extra_param = "",
		param = {
			{
				840,
				21.538,
				true,
				"%"
			},
			{
				30,
				0,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[101058305] = {
		description = "快速闪避敌人攻击，极限闪避会触发闪避效果。极限闪避时，获得<color=#E78300>25</color>点能量。\n闪避效果：进入零时空间使全场敌人动作大幅减速，持续<color=#E78300>4</color>秒；闪避效果每<color=#E78300>{1}</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101058305,
		extra_param = "",
		param = {
			{
				20,
				0,
				false,
				""
			}
		}
	},
	[101059101] = {
		description = "对锁定的敌人进行连续射击，造成共计<color=#E78300>{1}</color>攻击力的光属性伤害。\n\n被动：\n每命中敌人<color=#E78300>20</color>次，获得<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(105901)>「光矢」</material>标记，<material=underline c=#FFFFFF h=2 event=terminology args=(105901)>「光矢」</material>标记最多拥有<color=#E78300>3</color>个。\n\n<color=#297DE0>能量：</color>每秒自动获得<color=#E78300>3</color>点能量。",
		maxLv = 60,
		type = 1,
		id = 101059101,
		extra_param = "",
		param = {
			{
				178,
				3.481,
				true,
				"%"
			}
		}
	},
	[101059201] = {
		description = "向后跃向空中并对目标进行三次射击，造成共计<color=#E78300>{1}</color>攻击力的光属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101059201,
		extra_param = "",
		param = {
			{
				220,
				5.64,
				true,
				"%"
			}
		}
	},
	[101059202] = {
		description = "向敌人冲刺，并进行旋转射击，造成共计<color=#E78300>{1}</color>攻击力的光属性伤害。\n拥有<material=underline c=#FFFFFF h=2 event=terminology args=(105901)>「光矢」</material>标记时，施放「耀日光棘」后<color=#E78300>4</color>秒内，可消耗<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(105901)>「光矢」</material>标记，追加一次攻击。\n追加攻击：跃向空中，对目标射出一支光箭，造成<color=#E78300>{2}</color>攻击力的光属性伤害。自身处于空中且拥有<material=underline c=#FFFFFF h=2 event=terminology args=(105901)>「光矢」</material>标记时，也可直接衔接该追加攻击。",
		maxLv = 60,
		type = 1,
		id = 101059202,
		extra_param = "",
		param = {
			{
				180,
				4.614,
				true,
				"%"
			},
			{
				250,
				6.41,
				true,
				"%"
			}
		}
	},
	[101059203] = {
		description = "发射四支光箭，每支光箭各自攻击路径上敌人，每支造成<color=#E78300>{1}</color>攻击力的光属性伤害。\n拥有<material=underline c=#FFFFFF h=2 event=terminology args=(105901)>「光矢」</material>标记时，施放「辉光交错」后<color=#E78300>4</color>秒内，可消耗<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(105901)>「光矢」</material>标记，追加一次攻击。\n追加攻击：跃向空中，对近处敌人射一支光箭，造成<color=#E78300>{2}</color>攻击力的光属性伤害，对处于中心区域的敌人命中瞬间伤害提高<color=#E78300>{3}</color>。自身处于空中且拥有<material=underline c=#FFFFFF h=2 event=terminology args=(105901)>「光矢」</material>标记时，也可直接衔接该追加攻击。",
		maxLv = 60,
		type = 1,
		id = 101059203,
		extra_param = "",
		param = {
			{
				100,
				2.564,
				true,
				"%"
			},
			{
				300,
				7.692,
				true,
				"%"
			},
			{
				20,
				0,
				false,
				"%"
			}
		}
	},
	[101059209] = {
		description = "快速向锁定的敌人冲刺，然后跃起发射出一支弹射光箭，造成共计<color=#E78300>{1}</color>攻击力的光属性伤害；自身获得<color=#E78300>3</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(105901)>「光矢」</material>标记，全队伍重置闪避效果冷却时间。\n\n自身或者队友触发闪避效果时，获得<color=#E78300>15%</color>的奥义值，该效果每<color=#E78300>0.5</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101059209,
		extra_param = "",
		param = {
			{
				400,
				10.25,
				true,
				"%"
			}
		}
	},
	[101059305] = {
		description = "快速闪避敌人攻击，极限闪避会触发闪避效果。\n闪避效果：进入零时空间使全场敌人动作大幅减速，持续<color=#E78300>2</color>秒；获得<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(105901)>「光矢」</material>标记；闪避效果每<color=#E78300>{1}</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101059305,
		extra_param = "",
		param = {
			{
				12,
				0,
				false,
				""
			}
		}
	},
	[101060101] = {
		description = "自过往除暴安良的经历中领悟的武技，使用开明连续攻击敌人，造成共计<color=#E78300>{1}</color>攻击力的光属性伤害。\n\n被动：\n每段普通攻击的起手阶段有短暂的判定，受击时会施放反击技能攻击「崩枪式」。\n「崩枪式」：造成共计<color=#E78300>{2}</color>攻击力的光属性伤害，施放期间获得无敌效果。\n「破军枪舞」：造成共计<color=#E78300>{3}</color>攻击力的光属性伤害，施放期间获得霸体效果，受到的伤害降低<color=#E78300>{4}</color>。\n\n<color=#297DE0>怒气：</color>普通攻击命中后会获得怒气；触发「崩枪式」时获得<color=#E78300>20</color>点怒气。",
		maxLv = 60,
		type = 1,
		id = 101060101,
		extra_param = "",
		param = {
			{
				546,
				10.57,
				true,
				"%"
			},
			{
				200,
				5.127,
				true,
				"%"
			},
			{
				700,
				17.943,
				true,
				"%"
			},
			{
				30,
				0,
				false,
				"%"
			}
		}
	},
	[101060111] = {
		description = "自过往除暴安良的经历中领悟的武技，使用开明连续攻击敌人，造成共计<color=#E78300>{1}</color>攻击力的光属性伤害。\n\n被动：\n每段普通攻击的起手阶段有短暂的判定，受击时，当自身不处于<material=underline c=#FFFFFF h=2 event=terminology args=(106001)>「枪阵」</material>范围内时会施放反击技能攻击「崩枪式」、处于<material=underline c=#FFFFFF h=2 event=terminology args=(106001)>「枪阵」</material>范围内时会施放反击技能攻击「崩山式」。\n「崩枪式」：造成共计<color=#E78300>{2}</color>攻击力的光属性伤害，施放期间获得无敌效果。\n「崩山式」：回收<color=#E78300>3</color>把<material=underline c=#FFFFFF h=2 event=terminology args=(106002)>「枪」</material>，造成共计<color=#E78300>{3}</color>攻击力的光属性伤害，施放期间获得无敌效果。\n「破军枪舞」：造成共计<color=#E78300>{4}</color>攻击力的光属性伤害，施放期间获得霸体效果，受到的伤害降低<color=#E78300>{5}</color>。\n\n<color=#297DE0>怒气：</color>普通攻击命中后会获得怒气；触发「崩枪式」时获得<color=#E78300>20</color>点怒气，触发「崩山式」时获得<color=#E78300>30</color>点怒气。",
		maxLv = 60,
		type = 1,
		id = 101060111,
		extra_param = "",
		param = {
			{
				546,
				10.57,
				true,
				"%"
			},
			{
				200,
				5.127,
				true,
				"%"
			},
			{
				300,
				7.691,
				true,
				"%"
			},
			{
				700,
				17.943,
				true,
				"%"
			},
			{
				30,
				0,
				false,
				"%"
			}
		}
	},
	[101060201] = {
		description = "脱胎于昆仑枪法的武技其一。\n向前冲刺后，回头对背后敌人刺出一枪，聚集敌人，造成共计<color=#E78300>{1}</color>攻击力的光属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101060201,
		extra_param = "",
		param = {
			{
				600,
				15.382,
				true,
				"%"
			}
		}
	},
	[101060202] = {
		description = "脱胎于昆仑枪法的武技其二。\n快速挥舞开明，造成共计<color=#E78300>{1}</color>攻击力的光属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101060202,
		extra_param = "",
		param = {
			{
				700,
				17.944,
				true,
				"%"
			}
		}
	},
	[101060203] = {
		description = "脱胎于昆仑枪法的武技其三。\n怒气为满时才可施放，消耗全部怒气，舞动开明对周围造成共计<color=#E78300>{1}</color>攻击力的光属性伤害，开启<material=underline c=#FFFFFF h=2 event=terminology args=(106001)>「枪阵」</material>，施放时自身获得短暂的无敌效果。<material=underline c=#FFFFFF h=2 event=terminology args=(106001)>「枪阵」</material>最多存在一个，最多持续<color=#E78300>27</color>秒，<material=underline c=#FFFFFF h=2 event=terminology args=(106001)>「枪阵」</material>存在时禁用「破军枪阵」。\n<material=underline c=#FFFFFF h=2 event=terminology args=(106001)>「枪阵」</material>：每<color=#E78300>3</color>秒会聚集<material=underline c=#FFFFFF h=2 event=terminology args=(106001)>「枪阵」</material>范围内的敌人；自身处于<material=underline c=#FFFFFF h=2 event=terminology args=(106001)>「枪阵」</material>范围内时获得硬直效果、受到的伤害降低<color=#E78300>{2}</color>。开启<material=underline c=#FFFFFF h=2 event=terminology args=(106001)>「枪阵」</material>时，会召唤出<color=#E78300>9</color>把<material=underline c=#FFFFFF h=2 event=terminology args=(106002)>「枪」</material>；自身处于<material=underline c=#FFFFFF h=2 event=terminology args=(106001)>「枪阵」</material>范围内施放「反戈一击」、「游虎啸岩」时，会回收<color=#E78300>3</color>把<material=underline c=#FFFFFF h=2 event=terminology args=(106002)>「枪」</material>，并且该技能的剩余冷却时间缩短<color=#E78300>90%</color>；回收<material=underline c=#FFFFFF h=2 event=terminology args=(106002)>「枪」</material>时会对锁定的敌人触发技能攻击「枪落」，造成共计<color=#E78300>{3}</color>攻击力的光属性伤害。\n每回收<color=#E78300>1</color>把<material=underline c=#FFFFFF h=2 event=terminology args=(106002)>「枪」</material>，自身获得<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(106003)>「枪魂」</material>标记。自身拥有<color=#E78300>3、6、9</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(106003)>「枪魂」</material>标记时，该技能会依次替换为「破军枪阵·三」、「破军枪阵·六」、「破军枪阵·九」。\n「破军枪阵·三」：消耗<color=#E78300>3</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(106003)>「枪魂」</material>标记，造成共计<color=#E78300>{4}</color>攻击力的光属性伤害，命中后下一次施放的「破军枪阵·三」命中瞬间攻击力提高<color=#E78300>9%</color>，持续<color=#E78300>9</color>秒，最多可叠加<color=#E78300>2</color>层。\n「破军枪阵·六」：消耗<color=#E78300>6</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(106003)>「枪魂」</material>标记，造成共计<color=#E78300>{5}</color>攻击力的光属性伤害，施放期间获得霸体效果，受到的伤害降低<color=#E78300>{7}</color>，施放「破军枪阵·六」过程受击时，该技能命中瞬间攻击力提高<color=#E78300>{8}</color>。\n「破军枪阵·九」：消耗<color=#E78300>9</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(106003)>「枪魂」</material>标记，造成共计<color=#E78300>{6}</color>攻击力的光属性伤害，「破军枪阵·九」的前段有短暂的闪避判定，对生命值低于<color=#E78300>50%</color>的敌人命中瞬间基础伤害提高<color=#E78300>{9}</color>，处于零时空间或修正模式时，该技能命中瞬间攻击力提高<color=#E78300>{10}</color>。\n<color=#E78300>9</color>把<material=underline c=#FFFFFF h=2 event=terminology args=(106002)>「枪」</material>全部回收时，会关闭<material=underline c=#FFFFFF h=2 event=terminology args=(106001)>「枪阵」</material>，下一次普通攻击替换为技能攻击「破军枪舞」。当<material=underline c=#FFFFFF h=2 event=terminology args=(106001)>「枪阵」</material>关闭并且未回收的<material=underline c=#FFFFFF h=2 event=terminology args=(106002)>「枪」</material>剩余<color=#E78300>3、6、9</color>时，会恢复<color=#E78300>33、66、100</color>点怒气。",
		maxLv = 60,
		type = 1,
		id = 101060203,
		extra_param = "",
		param = {
			{
				300,
				7.691,
				true,
				"%"
			},
			{
				30,
				0,
				false,
				"%"
			},
			{
				100,
				2.563,
				true,
				"%"
			},
			{
				800,
				20.511,
				true,
				"%"
			},
			{
				1000,
				25.637,
				true,
				"%"
			},
			{
				1400,
				35.896,
				true,
				"%"
			},
			{
				30,
				0,
				false,
				"%"
			},
			{
				18,
				0,
				false,
				"%"
			},
			{
				18,
				0,
				false,
				"%"
			},
			{
				18,
				0,
				false,
				"%"
			}
		}
	},
	[101060208] = {
		description = "巡天·英招与九司·陆吾的连携奥义。\n巡天·英招造成<color=#E78300>{1}+{2}</color>×<color=#297DE0>自身奥义等级</color>攻击力的风属性伤害，命中时全队伍技能伤害提高<color=#E78300>{5}</color>，持续<color=#E78300>{6}</color>秒。\n九司·陆吾造成<color=#E78300>{3}+{4}</color>×<color=#297DE0>自身奥义等级</color>攻击力的光属性伤害，命中时全队伍近战伤害提高<color=#E78300>{7}</color>，持续<color=#E78300>{8}</color>秒。",
		maxLv = 60,
		type = 1,
		id = 101060208,
		extra_param = "",
		param = {
			{
				1250,
				0,
				false,
				"%"
			},
			{
				32.051,
				0,
				false,
				"%"
			},
			{
				1250,
				0,
				false,
				"%"
			},
			{
				32.051,
				0,
				false,
				"%"
			},
			{
				20,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			},
			{
				20,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			}
		}
	},
	[101060209] = {
		description = "将神力全数解放，挥舞长枪快速穿行于战场，造成共计<color=#E78300>{1}</color>攻击力的光属性伤害。\n\n自身或者队友触发零时空间时，获得<color=#E78300>15%</color>的奥义值，该效果每<color=#E78300>0.5</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101060209,
		extra_param = "",
		param = {
			{
				1250,
				32.05,
				true,
				"%"
			}
		}
	},
	[101060305] = {
		description = "脱胎于昆仑枪法的身法，快速闪避敌人攻击，极限闪避会触发闪避效果。\n闪避效果：进入零时空间使全场敌人动作大幅减速，持续<color=#E78300>3</color>秒；闪避效果每<color=#E78300>{1}</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101060305,
		extra_param = "",
		param = {
			{
				20,
				0,
				false,
				""
			}
		}
	},
	[101061101] = {
		description = "执明参悟北方七宿与坎水卦象并将其与「玄机」结合的秘法。\n造成共计<color=#E78300>{1}</color>攻击力的水属性伤害，施放每段普通攻击时获得<color=#E78300>6</color>点<material=underline c=#FFFFFF h=2 event=terminology args=(106101)>「北斗」</material>。\n\n被动：\n<material=underline c=#FFFFFF h=2 event=terminology args=(106101)>「北斗」</material>点数上限<color=#E78300>120</color>点；<material=underline c=#FFFFFF h=2 event=terminology args=(106102)>「南溟」</material>点数上限<color=#E78300>120</color>点。<material=underline c=#FFFFFF h=2 event=terminology args=(106103)>「玄龟」</material>和<material=underline c=#FFFFFF h=2 event=terminology args=(106104)>「冥蛇」</material>标记最多共计拥有<color=#E78300>2</color>个。\n\n<color=#297DE0>神能：</color>施放普通攻击时会获得神能。",
		maxLv = 60,
		type = 1,
		id = 101061101,
		extra_param = "",
		param = {
			{
				600,
				11.536,
				true,
				"%"
			}
		}
	},
	[101061201] = {
		description = "脱胎于颛顼秘法的术法，水流而不盈，行险而不失其信。\n造成共计<color=#E78300>{1}</color>攻击力的水属性伤害，获得<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(106103)>「玄龟」</material>标记，获得<color=#E78300>30</color>点<material=underline c=#FFFFFF h=2 event=terminology args=(106101)>「北斗」</material>。",
		maxLv = 60,
		type = 1,
		id = 101061201,
		extra_param = "",
		param = {
			{
				400,
				10.255,
				true,
				"%"
			}
		}
	},
	[101061202] = {
		description = "脱胎于颛顼秘法的术法，生灭之道，北斗皆主。\n造成共计<color=#E78300>{1}</color>攻击力的水属性伤害，获得<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(106104)>「冥蛇」</material>标记，获得<color=#E78300>30</color>点<material=underline c=#FFFFFF h=2 event=terminology args=(106101)>「北斗」</material>。",
		maxLv = 60,
		type = 1,
		id = 101061202,
		extra_param = "",
		param = {
			{
				400,
				10.255,
				true,
				"%"
			}
		}
	},
	[101061203] = {
		description = "脱胎于颛顼秘法的术法，以卜算之法引导神力。\n<material=underline c=#FFFFFF h=2 event=terminology args=(106101)>「北斗」</material>为满并且拥有<color=#E78300>2</color>个标记时，消耗全部<material=underline c=#FFFFFF h=2 event=terminology args=(106101)>「北斗」</material>和标记开启「演算」。\n「演算」：施放期间获得霸体效果、受到的伤害降低<color=#E78300>{1}</color>，「坎水不盈」、「北斗注死」替换为「数据输入·演算」；可以分别消耗<color=#E78300>10、20</color>点神能点击施放「数据输入·演算」，点击施放合计达到<color=#E78300>2</color>次时，根据消耗的标记的种类和数量施放不同的攻击，并根据点击施放消耗的神能，每消耗<color=#E78300>1</color>点神能，「演算」的命中瞬间攻击力提高<color=#E78300>0.6%</color>：\n「方程式演算」：<color=#E78300>2</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(106103)>「玄龟」</material>标记。神能波动造成共计<color=#E78300>{2}</color>攻击力的水属性伤害、<color=#E78300>16</color>道数据流每道造成<color=#E78300>{3}</color>攻击力的水属性伤害，获得<color=#E78300>50</color>点神能；\n「归纳法演算」：<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(106103)>「玄龟」</material>标记和<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(106104)>「冥蛇」</material>标记。造成共计<color=#E78300>{4}</color>攻击力的水属性伤害，对命中的敌人附加破甲状态，防御力降低<color=#E78300>{5}</color>，持续<color=#E78300>{6}</color>秒；\n「过载化演算」：<color=#E78300>2</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(106104)>「冥蛇」</material>标记。造成共计<color=#E78300>{7}</color>攻击力的水属性伤害。\n连续施放<color=#E78300>2</color>次「演算」时，该技能会替换为「超阶演算」。\n「超阶演算」：施放期间「颛顼秘法」、「坎水不盈」、「北斗注死」、「真武参悟」替换为「数据输入·超阶演算」；可以分别消耗<color=#E78300>0、10、20、40</color>点神能点击施放「数据输入·超阶演算」，点击施放合计达到<color=#E78300>3</color>次时会施放攻击，前两次点击施放分别造成<color=#E78300>{8}</color>、<color=#E78300>{9}</color>攻击力的水属性伤害，最后一段大型攻击造成共计<color=#E78300>{10}</color>攻击力的水属性伤害，大范围聚集敌人，并根据状态期间内点击施放消耗的神能，每消耗<color=#E78300>1</color>点神能，「超阶演算」的大型攻击命中瞬间攻击力提高<color=#E78300>0.4%</color>。",
		maxLv = 60,
		type = 1,
		id = 101061203,
		extra_param = "",
		param = {
			{
				75,
				0,
				false,
				"%"
			},
			{
				400,
				10.247,
				true,
				"%"
			},
			{
				25,
				0.641,
				true,
				"%"
			},
			{
				1000,
				25.64,
				true,
				"%"
			},
			{
				16,
				0,
				false,
				"%"
			},
			{
				24,
				0,
				false,
				""
			},
			{
				1200,
				30.765,
				true,
				"%"
			},
			{
				100,
				2.564,
				true,
				"%"
			},
			{
				100,
				2.564,
				true,
				"%"
			},
			{
				4200,
				107.689,
				true,
				"%"
			}
		}
	},
	[101061208] = {
		description = "太一·庚辰与玄机·执明的连携奥义。\n太一·庚辰造成<color=#E78300>{1}+{2}</color>×<color=#297DE0>自身奥义等级</color>攻击力的水属性伤害。\n玄机·执明造成<color=#E78300>{3}+{4}</color>×<color=#297DE0>自身奥义等级</color>攻击力的水属性伤害；施放时全队伍远程伤害提高<color=#E78300>{5}</color>，持续<color=#E78300>{6}</color>秒。",
		maxLv = 60,
		type = 1,
		id = 101061208,
		extra_param = "",
		param = {
			{
				1500,
				0,
				false,
				"%"
			},
			{
				38.462,
				0,
				false,
				"%"
			},
			{
				1200,
				0,
				false,
				"%"
			},
			{
				30.769,
				0,
				false,
				"%"
			},
			{
				20,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			}
		}
	},
	[101061209] = {
		description = "彻底参悟颛顼秘法后才能施展的极致术法，将神力化为能量流轰击敌人。\n大范围聚集敌人，造成共计<color=#E78300>{1}</color>攻击力的水属性伤害。\n\n自身或者队友攻击造成会心后，获得<color=#E78300>3%</color>的奥义值，该效果每<color=#E78300>2</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101061209,
		extra_param = "",
		param = {
			{
				1200,
				30.765,
				true,
				"%"
			}
		}
	},
	[101061305] = {
		description = "脱胎于颛顼秘法的身法。\n长按闪避可以展开盾牌防御，每<color=#E78300>0.1</color>秒获得<color=#E78300>6</color>点<material=underline c=#FFFFFF h=2 event=terminology args=(106102)>「南溟」</material>。\n快速闪避敌人攻击，极限闪避会触发闪避效果。展开盾牌防御期间受击时，会格挡伤害并触发闪避效果。\n<material=underline c=#FFFFFF h=2 event=terminology args=(106102)>「南溟」</material>为满时松开长按或展开盾牌防御期间受击时，会清空<material=underline c=#FFFFFF h=2 event=terminology args=(106102)>「南溟」</material>并施放技能攻击，造成共计<color=#E78300>{1}</color>攻击力的水属性伤害，获得<color=#E78300>20</color>点神能、<color=#E78300>30</color>点<material=underline c=#FFFFFF h=2 event=terminology args=(106101)>「北斗」</material>。\n闪避效果：进入零时空间使全场敌人动作大幅减速，持续<color=#E78300>3</color>秒；通过防御格挡攻击途径触发闪避效果时，额外获得<color=#E78300>20</color>点神能、<color=#E78300>30</color>点<material=underline c=#FFFFFF h=2 event=terminology args=(106101)>「北斗」</material>；闪避效果每<color=#E78300>{2}</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101061305,
		extra_param = "",
		param = {
			{
				1000,
				25.64,
				true,
				"%"
			},
			{
				20,
				0,
				false,
				""
			}
		}
	},
	[101066101] = {
		description = "召唤兔兔铁拳打击敌人，造成共计<color=#E78300>{1}</color>攻击力的物理属性伤害。\n\n<color=#297DE0>怒气：</color>普通攻击命中后会获得怒气。",
		maxLv = 60,
		type = 1,
		id = 101066101,
		extra_param = "",
		param = {
			{
				194,
				3.817,
				true,
				"%"
			}
		}
	},
	[101066201] = {
		description = "抽取塔罗牌获得<material=underline c=#FFFFFF h=2 event=terminology args=(106601)>「占卜效果」</material>，加成效果持续<color=#E78300>{1}</color>秒。当抽到卡牌与上一次不同时，加成效果提高<color=#E78300>50%</color>。\n<color=#ad25b5>死神</color>：攻击力提高<color=#E78300>{2}</color>。\n<color=#d7ac00>战车</color>：每<color=#E78300>2</color>秒获得<color=#E78300>{3}</color>点怒气。\n<color=#5cb82b>恋人</color>：每<color=#E78300>3</color>秒恢复自身<color=#E78300>{4}</color>攻击力的生命值。",
		maxLv = 60,
		type = 1,
		id = 101066201,
		extra_param = "",
		param = {
			{
				15,
				0,
				false,
				""
			},
			{
				13,
				0.3,
				true,
				"%"
			},
			{
				7,
				0,
				false,
				""
			},
			{
				6,
				0.2,
				true,
				"%"
			}
		}
	},
	[101066202] = {
		description = "发射兔兔二号攻击前方敌人，造成共计<color=#E78300>{1}</color>攻击力的物理属性伤害。命中后会对周围的最多<color=#E78300>5</color>名敌人进行弹射，每次造成<color=#E78300>{2}</color>攻击力的物理属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101066202,
		extra_param = "",
		param = {
			{
				448,
				11.487,
				true,
				"%"
			},
			{
				192,
				4.923,
				true,
				"%"
			}
		}
	},
	[101066203] = {
		description = "跃起攻击前方圆形范围内的敌人，造成共计<color=#E78300>{1}</color>攻击力的物理属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101066203,
		extra_param = "",
		param = {
			{
				1024,
				26.354,
				true,
				"%"
			}
		}
	},
	[101066209] = {
		description = "召唤兔兔三号从天而降攻击目标周围，造成<color=#E78300>{1}</color>攻击力的物理属性伤害；重置自身技能三的冷却时间，队友技能三的剩余冷却时间缩短<color=#E78300>5</color>秒。\n\n自身或者队友施放奥义时，获得<color=#E78300>20%</color>的奥义值。",
		maxLv = 60,
		type = 1,
		id = 101066209,
		extra_param = "",
		param = {
			{
				840,
				21.538,
				true,
				"%"
			}
		}
	},
	[101066231] = {
		description = "召唤兔兔三号从天而降，并自动攻击周围的敌人，造成共计<color=#E78300>{1}</color>攻击力的物理属性伤害。兔兔机器人攻击时会拉扯附近的敌人。",
		maxLv = 60,
		type = 1,
		id = 101066231,
		extra_param = "",
		param = {
			{
				1536,
				39.459,
				true,
				"%"
			}
		}
	},
	[101066305] = {
		description = "快速闪避敌人攻击，极限闪避会触发闪避效果。\n闪避效果：进入零时空间使全场敌人动作大幅减速，持续<color=#E78300>3</color>秒；闪避效果每<color=#E78300>{1}</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101066305,
		extra_param = "",
		param = {
			{
				20,
				0,
				false,
				""
			}
		}
	},
	[101067101] = {
		description = "挥舞利剑，引导水流，造成共计<color=#E78300>{1}</color>攻击力的水属性伤害。普通攻击第三段命中时，会触发「激波」。\n「激波」：场上的<material=underline c=#FFFFFF h=2 event=terminology args=(106701)>「支流幻影」</material>会朝锁定的敌人冲刺并造成<color=#E78300>{2}</color>攻击力的水属性伤害，同时刷新<material=underline c=#FFFFFF h=2 event=terminology args=(106701)>「支流幻影」</material>的持续时间。\n\n被动：\n可通过「长河奔行」、「碎浪逐空」生成<material=underline c=#FFFFFF h=2 event=terminology args=(106701)>「支流幻影」</material>，<material=underline c=#FFFFFF h=2 event=terminology args=(106701)>「支流幻影」</material>在场上持续<color=#E78300>6</color>秒；通过「长河奔行」生成的<material=underline c=#FFFFFF h=2 event=terminology args=(106701)>「支流幻影」</material>最多在场上存在<color=#E78300>2</color>个、通过「碎浪逐空」生成的<material=underline c=#FFFFFF h=2 event=terminology args=(106701)>「支流幻影」</material>最多在场上存在<color=#E78300>1</color>个，各自途径生成的数量已经达到上限时不再生成新的<material=underline c=#FFFFFF h=2 event=terminology args=(106701)>「支流幻影」</material>。",
		maxLv = 60,
		type = 1,
		id = 101067101,
		extra_param = "",
		param = {
			{
				282,
				5.523,
				true,
				"%"
			},
			{
				80,
				2.051,
				true,
				"%"
			}
		}
	},
	[101067201] = {
		description = "向目标冲刺，对敌人造成共计<color=#E78300>{1}</color>攻击力的水属性伤害，命中时生成<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(106701)>「支流幻影」</material>并触发「分流」；技能施放结束后，场上所有<material=underline c=#FFFFFF h=2 event=terminology args=(106701)>「支流幻影」</material>对其周围造成共计<color=#E78300>{3}</color>攻击力的水属性伤害，同时刷新<material=underline c=#FFFFFF h=2 event=terminology args=(106701)>「支流幻影」</material>的持续时间并再次触发「分流」。\n「分流」：生成幻影时会对周围敌人造成共计<color=#E78300>{2}</color>攻击力的水属性伤害。\n\n<color=#297DE0>印记：</color>每次施放命中后，获得<color=#E78300>1</color>个印记。",
		maxLv = 60,
		type = 1,
		id = 101067201,
		extra_param = "",
		param = {
			{
				350,
				8.974,
				true,
				"%"
			},
			{
				120,
				3.076,
				true,
				"%"
			},
			{
				120,
				3.076,
				true,
				"%"
			}
		}
	},
	[101067202] = {
		description = "自身消失，对前方区域造成共计<color=#E78300>{1}</color>攻击力的水属性伤害，自身拥有不少于<color=#E78300>2</color>个印记时，消耗场上全部<material=underline c=#FFFFFF h=2 event=terminology args=(106701)>「支流幻影」</material>，每消耗<color=#E78300>1</color>个幻影，自身近战伤害提高<color=#E78300>6%</color>，持续<color=#E78300>{2}</color>秒，然后在锁定的敌人周围重新生成消耗掉数量的<material=underline c=#FFFFFF h=2 event=terminology args=(106701)>「支流幻影」</material>，生成幻影同时幻影会对周围敌人造成共计<color=#E78300>{3}</color>攻击力的水属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101067202,
		extra_param = "",
		param = {
			{
				700,
				17.944,
				true,
				"%"
			},
			{
				8,
				0,
				false,
				""
			},
			{
				240,
				6.15,
				true,
				"%"
			}
		}
	},
	[101067203] = {
		description = "吸收自身一定范围的<material=underline c=#FFFFFF h=2 event=terminology args=(106701)>「支流幻影」</material>，每吸收<color=#E78300>1</color>个自身技能伤害提高<color=#E78300>6%</color>，持续<color=#E78300>{1}</color>秒；消耗全部印记，每消耗<color=#E78300>1</color>个印记幻影命中瞬间伤害提高<color=#E78300>12%</color>，持续<color=#E78300>8</color>秒；之后自身对敌人造成共计<color=#E78300>{2}</color>攻击力的水属性伤害，每个被吸收的<material=underline c=#FFFFFF h=2 event=terminology args=(106701)>「支流幻影」</material>都会生成一个短暂的幻影对敌人造成共计<color=#E78300>{3}</color>攻击力的水属性伤害，最多生成三个短暂的幻影。",
		maxLv = 60,
		type = 1,
		id = 101067203,
		extra_param = "",
		param = {
			{
				8,
				0,
				false,
				""
			},
			{
				700,
				17.946,
				true,
				"%"
			},
			{
				500,
				12.819,
				true,
				"%"
			}
		}
	},
	[101067208] = {
		description = "流转之洋·欧申纳斯与沐风·恩利尔的连携奥义。\n流转之洋·欧申纳斯造成<color=#E78300>{1}+{2}</color>×<color=#297DE0>自身奥义等级</color>攻击力的水属性伤害；命中时全队伍技能伤害提高<color=#E78300>{5}</color>，持续<color=#E78300>{6}</color>秒。\n沐风·恩利尔造成<color=#E78300>{3}+{4}</color>×<color=#297DE0>自身奥义等级</color>攻击力的风属性伤害；命中时聚集敌人并对敌人附加禁锢状态，持续<color=#E78300>3</color>秒。",
		maxLv = 60,
		type = 1,
		id = 101067208,
		extra_param = "",
		param = {
			{
				1160,
				0,
				false,
				"%"
			},
			{
				29.744,
				0,
				false,
				"%"
			},
			{
				600,
				0,
				false,
				"%"
			},
			{
				15.385,
				0,
				false,
				"%"
			},
			{
				50,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			}
		}
	},
	[101067209] = {
		description = "幻化出水流锋刃进行大范围斩击，造成共计<color=#E78300>{1}</color>攻击力的水属性伤害；施放时场上每存在<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(106701)>「支流幻影」</material>，全队伍水属性伤害提高<color=#E78300>6%</color>、近战伤害提高<color=#E78300>6%</color>，持续<color=#E78300>{2}</color>秒。\n\n自身或者队友极限闪避时，获得<color=#E78300>8%</color>的奥义值，该效果每<color=#E78300>2</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101067209,
		extra_param = "",
		param = {
			{
				1160,
				29.74,
				true,
				"%"
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[101067305] = {
		description = "快速闪避敌人攻击，极限闪避会触发闪避效果。极限闪避时生成<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(106701)>「支流幻影」</material>触发「分流」并获得<color=#E78300>1</color>个印记；极限闪避后<color=#E78300>1</color>秒内，当拥有印记时点击普通攻击会消耗<color=#E78300>1</color>个印记对敌人施放技能攻击造成共计<color=#E78300>{1}</color>攻击力的水属性伤害，并刷新通过「百川归海」获得的加成效果的持续时间。\n闪避效果：自身护甲穿透提高<color=#E78300>{2}</color>，持续<color=#E78300>{3}</color>秒；闪避效果每<color=#E78300>{4}</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101067305,
		extra_param = "",
		param = {
			{
				300,
				7.69,
				true,
				"%"
			},
			{
				18,
				0,
				false,
				"%"
			},
			{
				6,
				0,
				false,
				""
			},
			{
				20,
				0,
				false,
				""
			}
		}
	},
	[101068101] = {
		description = "驱动风元素进行攻击，造成共计<color=#E78300>{1}</color>攻击力的风属性伤害。普通攻击最后一段施放后获得<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(106801)>「风铃」</material>标记，<material=underline c=#FFFFFF h=2 event=terminology args=(106801)>「风铃」</material>标记最多拥有<color=#E78300>3</color>个。\n\n被动：\n当拥有<color=#E78300>3</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(106801)>「风铃」</material>标记时，施放技能会消耗全部标记获得强化效果。\n\n<color=#297DE0>怒气：</color>普通攻击命中后会获得怒气。",
		maxLv = 60,
		type = 1,
		id = 101068101,
		extra_param = "",
		param = {
			{
				196,
				3.841,
				true,
				"%"
			}
		}
	},
	[101068201] = {
		description = "把大量风元素凝聚成「风箭」进行攻击，造成两段伤害，前段造成<color=#E78300>{1}</color>攻击力的风属性伤害、后段造成<color=#E78300>{2}</color>攻击力的风属性伤害，施放后获得<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(106801)>「风铃」</material>标记。\n强化的「疾风冲击」：产生<color=#E78300>3</color>个「风箭」，每个「风箭」造成两段伤害，前段造成<color=#E78300>{3}</color>攻击力的风属性伤害、后段造成<color=#E78300>{4}</color>攻击力的风属性伤害；「飓风回旋」形成的「风眼」被强化的「疾风冲击」产生的「风箭」命中时，「风箭」后段会转变为爆炸，每个爆炸造成共计<color=#E78300>{5}</color>攻击力的风属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101068201,
		extra_param = "",
		param = {
			{
				40,
				1.025,
				true,
				"%"
			},
			{
				360,
				9.23,
				true,
				"%"
			},
			{
				40,
				1.025,
				true,
				"%"
			},
			{
				400,
				10.256,
				true,
				"%"
			},
			{
				640,
				16.41,
				true,
				"%"
			}
		}
	},
	[101068202] = {
		description = "驱动飓风进行攻击，造成共计<color=#E78300>{1}</color>攻击力的风属性伤害，施放后获得<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(106801)>「风铃」</material>标记，命中后会形成「风眼」。\n强化的「飓风回旋」：造成共计<color=#E78300>{2}</color>攻击力的风属性伤害，并额外产生<color=#E78300>3</color>股飓风，每股飓风造成共计<color=#E78300>{4}</color>攻击力的风属性伤害；强化的「飓风回旋」形成的「风眼」被「疾风冲击」产生的「风箭」命中时，「风箭」后段会转变为气旋，造成共计<color=#E78300>{3}</color>攻击力的风属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101068202,
		extra_param = "",
		param = {
			{
				640,
				16.408,
				true,
				"%"
			},
			{
				384,
				9.842,
				true,
				"%"
			},
			{
				640,
				16.41,
				true,
				"%"
			},
			{
				256,
				6.564,
				true,
				"%"
			}
		}
	},
	[101068203] = {
		description = "可以不消耗怒气直接施放，施放后技能伤害提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒，之后该技能剩余冷却时间缩短<color=#E78300>60%</color>，持续时间内施放「疾风冲击」、强化的「疾风冲击」、「飓风回旋」、强化的「飓风回旋」会获得以下额外效果。\n施放「疾风冲击」时，产生的「风箭」命中时对敌人附加风属性抗性降低<color=#E78300>10%</color>，持续<color=#E78300>{3}</color>秒。\n施放强化的「疾风冲击」时，产生的「风箭」命中时对敌人附加风属性抗性降低<color=#E78300>20%</color>，持续<color=#E78300>{4}</color>秒。\n施放「飓风回旋」时，形成的「风眼」会牵引附近敌人。\n施放强化的「飓风回旋」时，形成的「风眼」会牵引附近敌人，牵引效果增强；「风箭」命中飓风命中的敌人时还会产生额外的牵引效果。\n强化的「风元异变」：自身化为飓风，施放期间禁用技能并获得无敌效果，造成共计<color=#E78300>{5}</color>攻击力的风属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101068203,
		extra_param = "",
		param = {
			{
				30,
				0,
				false,
				"%"
			},
			{
				4,
				0,
				false,
				""
			},
			{
				6,
				0,
				false,
				""
			},
			{
				6,
				0,
				false,
				""
			},
			{
				1300,
				33.333,
				true,
				"%"
			}
		}
	},
	[101068208] = {
		description = "青君·孟章与沐风·恩利尔的连携奥义。\n青君·孟章造成<color=#E78300>{1}+{2}</color>×<color=#297DE0>自身奥义等级</color>攻击力的风属性伤害；命中时对敌人附加雷属性抗性降低<color=#E78300>{5}</color>、风属性抗性降低<color=#E78300>{6}</color>，持续<color=#E78300>{7}</color>秒。\n沐风·恩利尔造成<color=#E78300>{3}+{4}</color>×<color=#297DE0>自身奥义等级</color>攻击力的风属性伤害；命中时全队伍风属性伤害提高<color=#E78300>{8}</color>，持续<color=#E78300>{9}</color>秒。",
		maxLv = 60,
		type = 1,
		id = 101068208,
		extra_param = "",
		param = {
			{
				1200,
				0,
				false,
				"%"
			},
			{
				30.769,
				0,
				false,
				"%"
			},
			{
				600,
				0,
				false,
				"%"
			},
			{
				15.385,
				0,
				false,
				"%"
			},
			{
				20,
				0,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			},
			{
				30,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			}
		}
	},
	[101068209] = {
		description = "造成共计<color=#E78300>{1}</color>攻击力的风属性伤害；施放后全队伍风属性伤害提高<color=#E78300>{2}</color>，持续<color=#E78300>{3}</color>秒。\n\n自身或者队友触发零时空间时，获得<color=#E78300>8%</color>的奥义值，该效果每<color=#E78300>0.5</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101068209,
		extra_param = "",
		param = {
			{
				600,
				15.384,
				true,
				"%"
			},
			{
				30,
				0,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[101068305] = {
		description = "快速闪避敌人攻击，且可以连续施放二次闪避，极限闪避会触发闪避效果。\n闪避效果：进入零时空间使全场敌人动作大幅减速，持续<color=#E78300>2</color>秒；获得<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(106801)>「风铃」</material>标记；闪避效果每<color=#E78300>{1}</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101068305,
		extra_param = "",
		param = {
			{
				20,
				0,
				false,
				""
			}
		}
	},
	[101070101] = {
		description = "连续挥舞十曜，并配合十曜衍生的曜刃进行多段攻击，造成共计<color=#E78300>{1}</color>攻击力的火属性伤害。最后一段每次命中时，获得<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(107001)>「曜」</material>标记，<material=underline c=#FFFFFF h=2 event=terminology args=(107001)>「曜」</material>标记最多拥有<color=#E78300>9</color>个。",
		maxLv = 60,
		type = 1,
		id = 101070101,
		extra_param = "",
		param = {
			{
				461,
				9.008,
				true,
				"%"
			}
		}
	},
	[101070201] = {
		description = "挥舞十曜连续斩击目标，造成共计<color=#E78300>{1}</color>攻击力的火属性伤害。当拥有<material=underline c=#FFFFFF h=2 event=terminology args=(107001)>「曜」</material>标记时，每次斩击命中后会消耗<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(107001)>「曜」</material>标记，获得<color=#E78300>1</color>层<material=underline c=#FFFFFF h=2 event=terminology args=(107002)>「火羽」</material>，每层<material=underline c=#FFFFFF h=2 event=terminology args=(107002)>「火羽」</material>自身技能伤害提高<color=#E78300>2%</color>，持续<color=#E78300>{2}</color>秒，最多可叠加<color=#E78300>12</color>层。当拥有<color=#E78300>9</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(107001)>「曜」</material>标记时，施放时会消耗全部<material=underline c=#FFFFFF h=2 event=terminology args=(107001)>「曜」</material>标记，获得<color=#E78300>9</color>层<material=underline c=#FFFFFF h=2 event=terminology args=(107002)>「火羽」</material>，并额外造成共计<color=#E78300>{3}</color>攻击力的火属性伤害。\n处于<material=underline c=#FFFFFF h=2 event=terminology args=(107003)>「日凌」</material>状态时，该技能会替换为「金乌炽空」；退出<material=underline c=#FFFFFF h=2 event=terminology args=(107003)>「日凌」</material>状态时，该技能会替换为「降妖斩决」。\n「金乌炽空」：在空中挥舞十曜攻击目标，消耗<color=#E78300>3</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(107001)>「曜」</material>标记，造成共计<color=#E78300>{4}</color>攻击力的火属性伤害；当拥有<color=#E78300>9</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(107001)>「曜」</material>标记时，则会消耗全部<material=underline c=#FFFFFF h=2 event=terminology args=(107001)>「曜」</material>标记。\n\n<color=#297DE0>神能：</color>当拥有<color=#E78300>9</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(107001)>「曜」</material>标记时，施放「降妖斩决」会消耗全部<material=underline c=#FFFFFF h=2 event=terminology args=(107001)>「曜」</material>标记，获得<color=#E78300>25</color>点神能；「降妖斩决」的斩击每次攻击命中后，会消耗<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(107001)>「曜」</material>标记，获得<color=#E78300>5</color>点神能，并且根据该次技能施放累积消耗的<material=underline c=#FFFFFF h=2 event=terminology args=(107001)>「曜」</material>标记额外获得神能，每累积消耗<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(107001)>「曜」</material>标记，额外获得<color=#E78300>1</color>点神能。当拥有<color=#E78300>9</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(107001)>「曜」</material>标记时，施放「金乌炽空」会消耗全部<material=underline c=#FFFFFF h=2 event=terminology args=(107001)>「曜」</material>标记，获得<color=#E78300>80</color>点神能；当拥有<material=underline c=#FFFFFF h=2 event=terminology args=(107001)>「曜」</material>标记不满<color=#E78300>9</color>个时，「金乌炽空」会消耗<color=#E78300>3</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(107001)>「曜」</material>标记，获得<color=#E78300>20</color>点神能。",
		maxLv = 60,
		type = 1,
		id = 101070201,
		extra_param = "",
		param = {
			{
				600,
				15.383,
				true,
				"%"
			},
			{
				8,
				0,
				false,
				""
			},
			{
				300,
				7.692,
				true,
				"%"
			},
			{
				900,
				23.076,
				true,
				"%"
			}
		}
	},
	[101070202] = {
		description = "释放曜刃，对目标多次攻击，造成共计<color=#E78300>{1}</color>攻击力的火属性伤害，每命中敌人<color=#E78300>1</color>次，获得<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(107001)>「曜」</material>标记。「诛邪破击」处于冷却状态时，「诛邪破击」会替换为「伏魔焚灭」，「伏魔焚灭」有<color=#E78300>3</color>秒的冷却时间。\n「伏魔焚灭」：消耗<color=#E78300>3</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(107001)>「曜」</material>标记，释放曜刃攻击目标，造成共计<color=#E78300>{1}</color>攻击力的火属性伤害。不会打断当前动作，每命中敌人<color=#E78300>1</color>次，获得<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(107001)>「曜」</material>标记。\n处于<material=underline c=#FFFFFF h=2 event=terminology args=(107003)>「日凌」</material>状态时，该技能会替换为「金乌燎原」，「金乌燎原」有<color=#E78300>6</color>秒的冷却时间；退出<material=underline c=#FFFFFF h=2 event=terminology args=(107003)>「日凌」</material>状态时，该技能会替换为「诛邪破击」。\n「金乌燎原」：消耗全部神能，在目标位置展开法阵，对法阵范围内的敌人附加禁锢状态，持续<color=#E78300>{4}</color>秒，依次附加物理、风属性、火属性抗性降低，持续<color=#E78300>{2}</color>秒，每消耗<color=#E78300>1</color>点神能对敌人附加<color=#E78300>1</color>层物理、风属性、火属性抗性降低，每有<color=#E78300>1</color>层对应属性抗性降低<color=#E78300>0.1%</color>，火属性抗性降低最多可叠加<color=#E78300>200</color>层、物理和风属性抗性降低最多可叠加<color=#E78300>100</color>层，之后造成共计<color=#E78300>{3}</color>攻击力的火属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101070202,
		extra_param = "",
		param = {
			{
				300,
				7.69,
				true,
				"%"
			},
			{
				6,
				0,
				false,
				""
			},
			{
				300,
				7.692,
				true,
				"%"
			},
			{
				2,
				0,
				false,
				""
			}
		}
	},
	[101070203] = {
		description = "消耗全部神能，对周围造成共计<color=#E78300>{1}</color>攻击力的火属性伤害，从地面腾空进入<material=underline c=#FFFFFF h=2 event=terminology args=(107003)>「日凌」</material>状态。\n<material=underline c=#FFFFFF h=2 event=terminology args=(107003)>「日凌」</material>：获得硬直效果，闪避值消耗降低<color=#E78300>100%</color>；进入时每消耗<color=#E78300>1</color>点神能自身获得<color=#E78300>1</color>层火属性伤害提高效果，每层自身火属性伤害提高<color=#E78300>0.1%</color>，持续至退出<material=underline c=#FFFFFF h=2 event=terminology args=(107003)>「日凌」</material>状态。连续施放技能或闪避，动作期间可维持<material=underline c=#FFFFFF h=2 event=terminology args=(107003)>「日凌」</material>状态，停止施放后即可回到地面；回到地面时退出<material=underline c=#FFFFFF h=2 event=terminology args=(107003)>「日凌」</material>状态，之后该技能进入冷却。\n处于<material=underline c=#FFFFFF h=2 event=terminology args=(107003)>「日凌」</material>状态时，该技能会替换为「金乌焚陨」；改变「蓬莱剑法」的攻击模式；退出<material=underline c=#FFFFFF h=2 event=terminology args=(107003)>「日凌」</material>状态时，该技能会替换为「三足逐日」。\n「蓬莱剑法」：施放技能攻击驱使曜刃攻击目标，造成共计<color=#E78300>{2}</color>攻击力的火属性伤害，每命中敌人<color=#E78300>4</color>次，获得<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(107001)>「曜」</material>标记。\n「金乌焚陨」：朝锁定的敌人俯冲，命中时消耗全部<material=underline c=#FFFFFF h=2 event=terminology args=(107001)>「曜」</material>标记，造成共计<color=#E78300>{3}</color>攻击力的火属性伤害，每消耗<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(107001)>「曜」</material>标记，该技能的基础伤害提高<color=#E78300>3%</color>，之后退出<material=underline c=#FFFFFF h=2 event=terminology args=(107003)>「日凌」</material>状态。",
		maxLv = 60,
		type = 1,
		id = 101070203,
		extra_param = "",
		param = {
			{
				300,
				7.692,
				true,
				"%"
			},
			{
				700,
				17.945,
				true,
				"%"
			},
			{
				1200,
				30.769,
				true,
				"%"
			}
		}
	},
	[101070208] = {
		description = "十曜·金乌与澄心·陵光的连携奥义。\n十曜·金乌造成<color=#E78300>{1}+{2}</color>×<color=#297DE0>自身奥义等级</color>攻击力的火属性伤害；施放时自身恢复满神能。\n澄心·陵光造成<color=#E78300>{3}+{4}</color>×<color=#297DE0>自身奥义等级</color>攻击力的火属性伤害；施放时全队伍获得<material=underline c=#FFFFFF h=2 event=terminology args=(107508)>「烈阳炽」</material>，持续<color=#E78300>7</color>秒；十曜·金乌的火属性伤害提高<color=#E78300>{5}</color>，持续<color=#E78300>{6}</color>秒。",
		maxLv = 60,
		type = 1,
		id = 101070208,
		extra_param = "",
		param = {
			{
				1000,
				0,
				false,
				"%"
			},
			{
				25.641,
				0,
				false,
				"%"
			},
			{
				1000,
				0,
				false,
				"%"
			},
			{
				25.641,
				0,
				false,
				"%"
			},
			{
				15,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			}
		}
	},
	[101070209] = {
		description = "不处于<material=underline c=#FFFFFF h=2 event=terminology args=(107003)>「日凌」</material>状态时才可施放。释放日曜的威能，造成共计<color=#E78300>{1}</color>攻击力的火属性伤害；每有<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(107001)>「曜」</material>标记，自身获得<color=#E78300>11.1%</color>神能。\n\n自身或者队友施放奥义时，获得<color=#E78300>20%</color>的奥义值。",
		maxLv = 60,
		type = 1,
		id = 101070209,
		extra_param = "",
		param = {
			{
				1000,
				25.64,
				true,
				"%"
			}
		}
	},
	[101070305] = {
		description = "快速闪避敌人的攻击，极限闪避会触发闪避效果。\n闪避效果：对攻击者触发一次<material=underline c=#FFFFFF h=2 event=terminology args=(107003)>「日凌」</material>状态的曜刃攻击；闪避效果每<color=#E78300>{2}</color>秒最多触发一次。\n处于<material=underline c=#FFFFFF h=2 event=terminology args=(107003)>「日凌」</material>状态时，可通过点击闪避在空中进行快速移动，并触发曜刃对锁定的敌人进行攻击，造成共计<color=#E78300>{1}</color>攻击力的火属性伤害，该效果最多每<color=#E78300>4</color>秒触发一次。",
		maxLv = 60,
		type = 1,
		id = 101070305,
		extra_param = "",
		param = {
			{
				365,
				9.383,
				true,
				"%"
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[101071101] = {
		description = "孟章参悟东方星宿，结合巽震卦象而习得的五式剑法。\n可以造成共计<color=#E78300>{1}</color>攻击力的风属性伤害，处于<material=underline c=#FFFFFF h=2 event=terminology args=(107101)>「青巽姿态」</material>时，施放每段普通攻击时会获得<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(107103)>「勿」</material>标记，<material=underline c=#FFFFFF h=2 event=terminology args=(107103)>「勿」</material>标记最多拥有<color=#E78300>4</color>个。\n\n被动：\n切换为<material=underline c=#FFFFFF h=2 event=terminology args=(107102)>「苍震姿态」</material>时，自身每有<color=#E78300>1%</color>的风属性伤害提高，雷属性伤害对应提高<color=#E78300>0.8%</color>；切换为<material=underline c=#FFFFFF h=2 event=terminology args=(107101)>「青巽姿态」</material>时，自身每有<color=#E78300>1%</color>的雷属性伤害提高，风属性伤害对应提高<color=#E78300>0.8%</color>；通过该被动获得的属性伤害提高效果不会再次参与被动的计算。\n\n<color=#297DE0>神能：</color>处于<material=underline c=#FFFFFF h=2 event=terminology args=(107101)>「青巽姿态」</material>时，普通攻击命中后会获得神能。",
		maxLv = 60,
		type = 1,
		id = 101071101,
		extra_param = "",
		param = {
			{
				351,
				6.821,
				true,
				"%"
			}
		}
	},
	[101071201] = {
		description = "脱胎于太昊剑法的身法之一，借助此身法可快速穿行于战场，亦可凌厉破敌。\n处于<material=underline c=#FFFFFF h=2 event=terminology args=(107101)>「青巽姿态」</material>：施放「风雷引」，急速后撤，造成共计<color=#E78300>{1}</color>攻击力的风属性伤害。「风雷引」处于冷却状态时，会替换为「风雷突」，「风雷突」有<color=#E78300>3</color>秒的冷却时间。\n「风雷突」：急速突进，造成共计<color=#E78300>{2}</color>攻击力的风属性伤害，命中时会消耗全部<material=underline c=#FFFFFF h=2 event=terminology args=(107103)>「勿」</material>标记，每消耗<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(107103)>「勿」</material>标记，召唤一把<material=underline c=#FFFFFF h=2 event=terminology args=(107104)>「玉剑」</material>攻击锁定的敌人。\n切换到<material=underline c=#FFFFFF h=2 event=terminology args=(107102)>「苍震姿态」</material>时，该技能会替换为「风雷破」；切换到<material=underline c=#FFFFFF h=2 event=terminology args=(107101)>「青巽姿态」</material>时，该技能会替换为「风雷引」。\n「风雷破」：消耗最多<color=#E78300>3</color>点神能，造成共计<color=#E78300>{3}</color>攻击力的雷属性伤害，该技能有<color=#E78300>2</color>秒的冷却时间。可以在施放「益动势合·震」或「恒出运昌·震」的过程中穿插施放该技能，穿插施放时会改变攻击模式并改变「益动势合·震」或「恒出运昌·震」的后续伤害，衍生出更强力的招式；穿插施放时，「风雷破」、「益动势合·震」和「恒出运昌·震」的剩余冷却时间分别缩短<color=#E78300>99%</color>、<color=#E78300>40%</color>和<color=#E78300>40%</color>；穿插施放后，下一次直接施放该技能时会改变攻击模式、不会进入冷却也不会打断普通攻击的连段。\n\n<color=#297DE0>神能：</color>处于<material=underline c=#FFFFFF h=2 event=terminology args=(107101)>「青巽姿态」</material>时，每命中敌人<color=#E78300>1</color>次，获得<color=#E78300>10</color>点神能。",
		maxLv = 60,
		type = 1,
		id = 101071201,
		extra_param = "",
		param = {
			{
				150,
				3.845,
				true,
				"%"
			},
			{
				150,
				3.846,
				true,
				"%"
			},
			{
				150,
				3.846,
				true,
				"%"
			}
		}
	},
	[101071202] = {
		description = "脱胎于太昊剑法的第一种剑术法门，攻守损益，其势相合。\n处于<material=underline c=#FFFFFF h=2 event=terminology args=(107101)>「青巽姿态」</material>：该技能替换为「益动势合·巽」。施放时格挡受到的伤害，召唤<color=#E78300>8</color>把<material=underline c=#FFFFFF h=2 event=terminology args=(107104)>「玉剑」</material>攻击锁定的敌人。该技能处于冷却状态时，普通攻击每次命中后会召唤不同数量的<material=underline c=#FFFFFF h=2 event=terminology args=(107104)>「玉剑」</material>攻击锁定的敌人，该效果每<color=#E78300>0.3</color>秒最多触发一次。\n<material=underline c=#FFFFFF h=2 event=terminology args=(107104)>「玉剑」</material>：造成<color=#E78300>{1}</color>攻击力的风属性伤害，命中后自身风属性伤害提高<color=#E78300>0.4%</color>，持续<color=#E78300>{4}</color>秒，最多可叠加<color=#E78300>28</color>层。\n处于<material=underline c=#FFFFFF h=2 event=terminology args=(107102)>「苍震姿态」</material>：该技能替换为「益动势合·震」。消耗最多<color=#E78300>5</color>点神能，施放二段攻击造成伤害，根据穿插「风雷破」的时机，又演化出二式剑术，造成不同的伤害。\n第一式：直接施放，造成共计<color=#E78300>{2}</color>攻击力的雷属性伤害；\n第二式：在第二段前穿插施放「风雷破」，最多造成共计<color=#E78300>{3}</color>攻击力的雷属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101071202,
		extra_param = "",
		param = {
			{
				40,
				1.025,
				true,
				"%"
			},
			{
				120,
				3.074,
				true,
				"%"
			},
			{
				240,
				6.151,
				true,
				"%"
			},
			{
				4,
				0,
				false,
				""
			}
		}
	},
	[101071203] = {
		description = "脱胎于太昊剑法的第二种剑术法门，造化恒常，刚柔相济。\n处于<material=underline c=#FFFFFF h=2 event=terminology args=(107101)>「青巽姿态」</material>：该技能替换为「恒出运昌·巽」。神能达到满值后才可施放，踢出飞剑造成共计<color=#E78300>{1}</color>攻击力的风属性伤害，飞剑飞行过程召唤最多<color=#E78300>8</color>道<material=underline c=#FFFFFF h=2 event=terminology args=(107105)>「云雷」</material>攻击沿途敌人，随后接住飞剑重新丢出，自身切换为<material=underline c=#FFFFFF h=2 event=terminology args=(107102)>「苍震姿态」</material>、移除全部<material=underline c=#FFFFFF h=2 event=terminology args=(107103)>「勿」</material>标记、重置「恒出运昌·震」的冷却时间，再次丢出的飞剑在第一个命中的敌人位置造成共计<color=#E78300>{7}</color>攻击力的雷属性伤害，召唤<color=#E78300>6</color>道<material=underline c=#FFFFFF h=2 event=terminology args=(107105)>「云雷」</material>攻击区域内的目标，并小幅聚集敌人。当神能为<color=#E78300>0</color>点时，自身切换为<material=underline c=#FFFFFF h=2 event=terminology args=(107101)>「青巽姿态」</material>。\n<material=underline c=#FFFFFF h=2 event=terminology args=(107105)>「云雷」</material>：造成<color=#E78300>{2}</color>攻击力的雷属性伤害。\n处于<material=underline c=#FFFFFF h=2 event=terminology args=(107102)>「苍震姿态」</material>：该技能替换为「恒出运昌·震」。消耗最多<color=#E78300>15</color>点神能，施放三段攻击造成伤害，最后一段攻击在前方区域召唤<color=#E78300>10</color>道<material=underline c=#FFFFFF h=2 event=terminology args=(107105)>「云雷」</material>，根据穿插「风雷破」的时机，又演化出四式剑术，造成不同的伤害。\n第一式：直接施放，造成共计<color=#E78300>{3}</color>攻击力的雷属性伤害；\n第二式：仅在第二段前穿插施放「风雷破」，最多造成共计<color=#E78300>{4}</color>攻击力的雷属性伤害；\n第三式：仅在第三段前穿插施放「风雷破」，最多造成共计<color=#E78300>{5}</color>攻击力的雷属性伤害；\n第四式：在第二段前和第三段前都穿插施放「风雷破」，最多造成共计<color=#E78300>{6}</color>攻击力的雷属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101071203,
		extra_param = "",
		param = {
			{
				300,
				7.692,
				true,
				"%"
			},
			{
				40,
				1.025,
				true,
				"%"
			},
			{
				300,
				7.688,
				true,
				"%"
			},
			{
				750,
				19.224,
				true,
				"%"
			},
			{
				1001,
				25.663,
				true,
				"%"
			},
			{
				1154,
				29.585,
				true,
				"%"
			},
			{
				200,
				5.125,
				true,
				"%"
			}
		}
	},
	[101071209] = {
		description = "将太昊剑法修行到极致而悟出的无上法门，可以援引风雷之力。\n造成共计<color=#E78300>{1}</color>攻击力的雷属性伤害；施放时根据当前的姿态，自身风属性或雷属性伤害提高<color=#E78300>{2}</color>，持续<color=#E78300>{3}</color>秒。\n\n自身或者队友施放奥义、自身切换姿态时，获得<color=#E78300>10%</color>的奥义值。",
		maxLv = 60,
		type = 1,
		id = 101071209,
		extra_param = "",
		param = {
			{
				1160,
				29.743,
				true,
				"%"
			},
			{
				30,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			}
		}
	},
	[101071305] = {
		description = "脱胎于太昊剑法的身法之一。\n快速闪避敌人攻击，极限闪避时会根据不同姿态触发不同的闪避效果；闪避效果每<color=#E78300>{2}</color>秒最多触发一次。\n处于<material=underline c=#FFFFFF h=2 event=terminology args=(107101)>「青巽姿态」</material>的闪避效果：触发<color=#E78300>8</color>把<material=underline c=#FFFFFF h=2 event=terminology args=(107104)>「玉剑」</material>攻击锁定的敌人；\n处于<material=underline c=#FFFFFF h=2 event=terminology args=(107102)>「苍震姿态」</material>的闪避效果：下一次施放「益动势合·震」或「恒出运昌·震」时，获得硬直和格挡效果，持续<color=#E78300>{1}</color>秒。",
		maxLv = 60,
		type = 1,
		id = 101071305,
		extra_param = "",
		param = {
			{
				2,
				0,
				false,
				""
			},
			{
				14,
				0,
				false,
				""
			}
		}
	},
	[101072101] = {
		description = "操纵神算子施展御风奇术，对敌人进行最多五段攻击，造成共计<color=#E78300>{1}</color>攻击力的风属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101072101,
		extra_param = "",
		param = {
			{
				371,
				7.205,
				true,
				"%"
			}
		}
	},
	[101072201] = {
		description = "使用神算子快速滑行，然后进行迅猛一击，造成共计<color=#E78300>{1}</color>攻击力的风属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101072201,
		extra_param = "",
		param = {
			{
				700,
				17.948,
				true,
				"%"
			}
		}
	},
	[101072202] = {
		description = "掷出神算子对敌人进行旋转攻击，造成共计<color=#E78300>{1}</color>攻击力的风属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101072202,
		extra_param = "",
		param = {
			{
				1400,
				35.891,
				true,
				"%"
			}
		}
	},
	[101072203] = {
		description = "施放普通攻击最后一段、「运势如风」、「算筹如刀」后短暂时间内，「财货如雨」会替换为「辟邪奇术」，并可以进行衔接施放，衔接施放时有不同的段数、造成不同的伤害、命中后获得点数不同的<material=underline c=#FFFFFF h=2 event=terminology args=(107201)>「财运」</material>，<material=underline c=#FFFFFF h=2 event=terminology args=(107201)>「财运」</material>点数上限<color=#E78300>50</color>点：\n普通攻击最后一段后衔接施放「辟邪奇术」：可施放一段，造成共计<color=#E78300>{4}</color>攻击力的风属性伤害，获得共计<color=#E78300>6</color>点<material=underline c=#FFFFFF h=2 event=terminology args=(107201)>「财运」</material>；\n「运势如风」后衔接施放「辟邪奇术」：可连续施放三段，造成共计<color=#E78300>{5}</color>攻击力的风属性伤害，获得共计<color=#E78300>10</color>点<material=underline c=#FFFFFF h=2 event=terminology args=(107201)>「财运」</material>；\n「算筹如刀」后衔接施放「辟邪奇术」：可连续施放五段，造成共计<color=#E78300>{6}</color>攻击力的风属性伤害，获得共计<color=#E78300>14</color>点<material=underline c=#FFFFFF h=2 event=terminology args=(107201)>「财运」</material>。\n\n「财货如雨」：消耗全部<material=underline c=#FFFFFF h=2 event=terminology args=(107201)>「财运」</material>，跃入空中使用神算子攻击敌人，根据消耗的<material=underline c=#FFFFFF h=2 event=terminology args=(107201)>「财运」</material>点数对敌人造成不同的伤害。\n消耗的<material=underline c=#FFFFFF h=2 event=terminology args=(107201)>「财运」</material>点数低于<color=#E78300>40</color>时，造成共计<color=#E78300>{1}</color>攻击力的风属性伤害；\n消耗的<material=underline c=#FFFFFF h=2 event=terminology args=(107201)>「财运」</material>点数不低于<color=#E78300>40</color>时，造成共计<color=#E78300>{2}</color>攻击力的风属性伤害；\n施放「财货如雨」时全队伍风属性伤害提高<color=#E78300>10%</color>，持续<color=#E78300>{3}</color>秒，每消耗<color=#E78300>1</color>点<material=underline c=#FFFFFF h=2 event=terminology args=(107201)>「财运」</material>，附加的风属性伤害额外提高<color=#E78300>0.6%</color>。\n\n<color=#297DE0>印记：</color>施放「辟邪奇术」最后一段命中后，获得<color=#E78300>1</color>个印记。",
		maxLv = 60,
		type = 1,
		id = 101072203,
		extra_param = "",
		param = {
			{
				1000,
				25.639,
				true,
				"%"
			},
			{
				1200,
				30.766,
				true,
				"%"
			},
			{
				16,
				0,
				false,
				""
			},
			{
				800,
				20.512,
				true,
				"%"
			},
			{
				1200,
				30.768,
				true,
				"%"
			},
			{
				1600,
				41.024,
				true,
				"%"
			}
		}
	},
	[101072208] = {
		description = "太一·庚辰与百解·禄良的连携奥义。\n太一·庚辰造成<color=#E78300>{1}+{2}</color>×<color=#297DE0>自身奥义等级</color>攻击力的水属性伤害；该次奥义只有<color=#E78300>1.60%</color>的概率造成会心，该会心概率不受其他效果影响，会心时会心伤害额外提高<color=#E78300>{3}</color>、独立伤害提高<color=#E78300>{4}</color>。\n百解·禄良生成一个跟随自身的<material=underline c=#FFFFFF h=2 event=terminology args=(107202)>「瑞币」</material>，持续<color=#E78300>12</color>秒。",
		maxLv = 60,
		type = 1,
		id = 101072208,
		extra_param = "",
		param = {
			{
				2000,
				0,
				false,
				"%"
			},
			{
				51.282,
				0,
				false,
				"%"
			},
			{
				40,
				0,
				false,
				"%"
			},
			{
				40,
				0,
				false,
				"%"
			}
		}
	},
	[101072209] = {
		description = "最大程度施放神算子的神力，造成共计<color=#E78300>{1}</color>攻击力的风属性伤害；生成一个跟随自身的<material=underline c=#FFFFFF h=2 event=terminology args=(107202)>「瑞币」</material>，持续<color=#E78300>12</color>秒，每个修正者最多被一个<material=underline c=#FFFFFF h=2 event=terminology args=(107202)>「瑞币」</material>跟随。\n<material=underline c=#FFFFFF h=2 event=terminology args=(107202)>「瑞币」</material>：跟随的修正者风属性攻击命中瞬间伤害提高<color=#E78300>{2}</color>；跟随的修正者攻击命中时，会发动协同攻击并短暂聚集敌人，造成共计<color=#E78300>{3}</color>攻击力的风属性伤害，协同攻击每<color=#E78300>2</color>秒最多触发一次，对命中的敌人附加风属性抗性降低<color=#E78300>{4}</color>，持续<color=#E78300>{5}</color>秒。\n\n自身或者队友触发闪避效果时，获得<color=#E78300>15%</color>的奥义值，该效果每<color=#E78300>0.5</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101072209,
		extra_param = "",
		param = {
			{
				800,
				20.512,
				true,
				"%"
			},
			{
				16,
				0.5,
				true,
				"%"
			},
			{
				50,
				1.282,
				true,
				"%"
			},
			{
				18,
				0,
				false,
				"%"
			},
			{
				3,
				0,
				false,
				""
			}
		}
	},
	[101072281] = {
		description = "百解·禄良和巡天·英招的连携奥义。\n百解·禄良造成<color=#E78300>{1}+{2}</color>×<color=#297DE0>自身奥义等级</color>攻击力的风属性伤害；生成一个跟随自身的<material=underline c=#FFFFFF h=2 event=terminology args=(107202)>「瑞币」</material>，持续<color=#E78300>12</color>秒。巡天·英招的风属性伤害提高<color=#E78300>{5}</color>，持续<color=#E78300>{6}</color>秒。\n巡天·英招造成<color=#E78300>{3}+{4}</color>×<color=#297DE0>自身奥义等级</color>攻击力的风属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101072281,
		extra_param = "",
		param = {
			{
				800,
				0,
				false,
				"%"
			},
			{
				20.513,
				0,
				false,
				"%"
			},
			{
				1250,
				0,
				false,
				"%"
			},
			{
				32.051,
				0,
				false,
				"%"
			},
			{
				30,
				0,
				false,
				"%"
			},
			{
				15,
				0,
				false,
				""
			}
		}
	},
	[101072305] = {
		description = "快速闪避敌人攻击，闪避不会打断普通攻击的连段，且可以连续施放二次闪避，极限闪避会触发闪避效果。\n闪避效果：进入零时空间使全场敌人动作大幅减速，持续<color=#E78300>2</color>秒；获得<color=#E78300>10</color>点<material=underline c=#FFFFFF h=2 event=terminology args=(107201)>「财运」</material>；闪避效果每<color=#E78300>{1}</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101072305,
		extra_param = "",
		param = {
			{
				20,
				0,
				false,
				""
			}
		}
	},
	[101074101] = {
		description = "流浪途中自行领悟的武技，使用无极连续攻击敌人，造成共计<color=#E78300>{1}</color>攻击力的风属性伤害。\n\n被动：\n神能不低于<color=#E78300>5</color>点时：非移动闪避后，下一个施放的非衍生技能会获得强化效果，移动闪避后，上一个施放的技能会替换为对应的衍生技能；施放衍生技能或有强化效果的技能时会消耗最多<color=#E78300>5</color>点神能，衍生技能最多存在<color=#E78300>1</color>个。\n神能满值时，施放技能时会进入<material=underline c=#FFFFFF h=2 event=terminology args=(107401)>「神司」</material>状态。\n<material=underline c=#FFFFFF h=2 event=terminology args=(107401)>「神司」</material>：每<color=#E78300>0.2</color>秒消耗<color=#E78300>2</color>点神能，神能消耗不受其他属性影响，神能为<color=#E78300>0</color>点时，退出<material=underline c=#FFFFFF h=2 event=terminology args=(107401)>「神司」</material>状态。状态期间内「踏云破空」、「聚流啸海」、「振翼撼山」的冷却时间缩短<color=#E78300>2</color>秒，获得硬直效果，攻击力提高<color=#E78300>{2}</color>、受到的伤害降低<color=#E78300>{3}</color>、神能获得率降低<color=#E78300>{4}</color>，施放衍生技能或有强化效果的技能时不再消耗神能。\n\n<color=#297DE0>神能：</color>普通攻击命中后会获得神能。",
		maxLv = 60,
		type = 1,
		id = 101074101,
		extra_param = "",
		param = {
			{
				511,
				9.968,
				true,
				"%"
			},
			{
				30,
				0,
				false,
				"%"
			},
			{
				30,
				0,
				false,
				"%"
			},
			{
				1000,
				0,
				false,
				"%"
			}
		}
	},
	[101074201] = {
		description = "脱胎于玄司棍法的武技其一。\n快速踢击敌人，造成共计<color=#E78300>{1}</color>攻击力的风属性伤害。\n强化效果：施放时获得霸体效果，每次攻击命中后获得<color=#E78300>10</color>点神能。\n衍生技能「踏云击」：施放一次强力踢击，造成共计<color=#E78300>{2}</color>攻击力的风属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101074201,
		extra_param = "",
		param = {
			{
				900,
				23.076,
				true,
				"%"
			},
			{
				300,
				7.692,
				true,
				"%"
			}
		}
	},
	[101074202] = {
		description = "脱胎于玄司棍法的武技其二。\n使用无极向前突刺，造成共计<color=#E78300>{1}</color>攻击力的风属性伤害，可通过长按进行蓄力，蓄力时获得霸体效果、受到的伤害降低<color=#E78300>60%</color>，满蓄力后会自动施放，命中敌人后产生爆发性冲击，造成共计<color=#E78300>{2}</color>攻击力的风属性伤害。\n强化效果：施放时获得霸体效果，并且可以直接达到满蓄力状态。\n衍生技能「聚流击」：造成共计<color=#E78300>{1}</color>攻击力的风属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101074202,
		extra_param = "",
		param = {
			{
				300,
				7.692,
				true,
				"%"
			},
			{
				800,
				20.512,
				true,
				"%"
			}
		}
	},
	[101074203] = {
		description = "脱胎于玄司棍法的武技其三。\n快速舞动无极，猛烈攻击敌人，造成共计<color=#E78300>{1}</color>攻击力的风属性伤害。\n强化效果：施放时获得霸体效果，每次攻击命中时获得<color=#E78300>10%</color>的闪避值。\n衍生技能「振翼击」：借助无极冲撞敌方目标，造成共计<color=#E78300>{2}</color>攻击力的风属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101074203,
		extra_param = "",
		param = {
			{
				1100,
				28.202,
				true,
				"%"
			},
			{
				360,
				9.23,
				true,
				"%"
			}
		}
	},
	[101074209] = {
		description = "施展神司御风的力量，向敌人施放猛烈的多段攻击，造成共计<color=#E78300>{1}</color>攻击力的风属性伤害。\n\n自身或者队友施放奥义时，获得<color=#E78300>20%</color>的奥义值。",
		maxLv = 60,
		type = 1,
		id = 101074209,
		extra_param = "",
		param = {
			{
				1250,
				32.05,
				true,
				"%"
			}
		}
	},
	[101074305] = {
		description = "脱胎于玄司棍法的身法，快速闪避敌人攻击，极限闪避会触发闪避效果。移动闪避会攻击前方的敌人，造成共计<color=#E78300>{3}</color>攻击力的风属性伤害。\n闪避效果：通过非移动闪避触发闪避效果时，下一次点击普通攻击会施放技能攻击「御风击」；通过移动闪避触发闪避效果时，下一次点击普通攻击会施放技能攻击「巡天击」；施放「御风击」或「巡天击」时获得霸体效果、受到的伤害降低<color=#E78300>{4}</color>，持续<color=#E78300>{5}</color>秒；闪避效果每<color=#E78300>{6}</color>秒最多触发一次。\n「御风击」：造成共计<color=#E78300>{1}</color>攻击力的风属性伤害。\n「巡天击」：造成共计<color=#E78300>{2}</color>攻击力的风属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101074305,
		extra_param = "",
		param = {
			{
				1000,
				19.23,
				true,
				"%"
			},
			{
				1000,
				25.64,
				true,
				"%"
			},
			{
				100,
				2.563,
				true,
				"%"
			},
			{
				50,
				0,
				false,
				"%"
			},
			{
				1.5,
				0,
				false,
				""
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[101075101] = {
		description = "陵光参悟南方七宿和离卦习得的御火秘法。\n造成共计<color=#E78300>{1}</color>攻击力的火属性伤害。在施放任一技能的<material=underline c=#FFFFFF h=2 event=terminology args=(107501)>「起式」</material>、<material=underline c=#FFFFFF h=2 event=terminology args=(107502)>「燃式」</material>后衔接普通攻击，会从普通攻击第四段开始攻击；施放技能「离行不息·起式」、「晋照升明·起式」时可以点击普通攻击打断技能并衔接普通攻击第四段。\n\n被动：\n普通攻击第四段或第五段命中时、施放「天同人和·起式」或「天同人和·燃式」命中时，「离行不息」和「晋照升明」会在<material=underline c=#FFFFFF h=2 event=terminology args=(107501)>「起式」</material>、<material=underline c=#FFFFFF h=2 event=terminology args=(107502)>「燃式」</material>之间切换。\n施放技能后<color=#E78300>10</color>秒内，再次施放技能时判定为连续施放；连续施放<color=#E78300>4</color>个技能后，进入<material=underline c=#FFFFFF h=2 event=terminology args=(107509)>「烈离」</material>状态，持续<color=#E78300>10</color>秒。\n<material=underline c=#FFFFFF h=2 event=terminology args=(107509)>「烈离」</material>：状态期间所有技能统一切换为<material=underline c=#FFFFFF h=2 event=terminology args=(107503)>「烈式」</material>，并且仅可以施放其中的任意一个，状态结束时所有技能切换为<material=underline c=#FFFFFF h=2 event=terminology args=(107501)>「起式」</material>。\n<material=underline c=#FFFFFF h=2 event=terminology args=(107503)>「烈式」</material>的加成效果最多可以存在<color=#E78300>2</color>个。\n\n<color=#297DE0>印记：</color>普通攻击第五段命中敌人时，获得<color=#E78300>1</color>个印记。",
		maxLv = 60,
		type = 1,
		id = 101075101,
		extra_param = "",
		param = {
			{
				495,
				9.608,
				true,
				"%"
			}
		}
	},
	[101075201] = {
		description = "脱胎于天南法门的御火功法之一，由于天南法门的特点，实战中有三式。\n<material=underline c=#FFFFFF h=2 event=terminology args=(107501)>「起式」</material>：突进后挥舞折扇攻击敌人，造成共计<color=#E78300>{1}</color>攻击力的火属性伤害。\n<material=underline c=#FFFFFF h=2 event=terminology args=(107502)>「燃式」</material>：疾速突进攻击沿途敌人，造成共计<color=#E78300>{2}</color>攻击力的火属性伤害。\n<material=underline c=#FFFFFF h=2 event=terminology args=(107503)>「烈式」</material>：消耗<color=#E78300>4</color>个印记，对自身周围造成共计<color=#E78300>{3}</color>攻击力的火属性伤害。施放时全队伍获得<material=underline c=#FFFFFF h=2 event=terminology args=(107504)>「炫铠」</material>。\n<material=underline c=#FFFFFF h=2 event=terminology args=(107504)>「炫铠」</material>：获得澄心·陵光<color=#E78300>{4}</color>生命值上限的护盾，持续<color=#E78300>{5}</color>秒。\n\n<color=#297DE0>印记：</color><material=underline c=#FFFFFF h=2 event=terminology args=(107501)>「起式」</material>或<material=underline c=#FFFFFF h=2 event=terminology args=(107502)>「燃式」</material>攻击命中后，获得<color=#E78300>1</color>个印记。",
		maxLv = 60,
		type = 1,
		id = 101075201,
		extra_param = "",
		param = {
			{
				700,
				17.945,
				true,
				"%"
			},
			{
				800,
				20.512,
				true,
				"%"
			},
			{
				900,
				23.076,
				true,
				"%"
			},
			{
				16.8,
				0.4,
				true,
				"%"
			},
			{
				14,
				0,
				false,
				""
			}
		}
	},
	[101075202] = {
		description = "脱胎于天南法门的御火功法之一，由于天南法门的特点，实战中有三式。\n<material=underline c=#FFFFFF h=2 event=terminology args=(107501)>「起式」</material>：挥舞折扇攻击前方敌人，造成共计<color=#E78300>{1}</color>攻击力的火属性伤害。\n<material=underline c=#FFFFFF h=2 event=terminology args=(107502)>「燃式」</material>：后跃并留下旋转的折扇攻击敌人，造成共计<color=#E78300>{2}</color>攻击力的火属性伤害。\n<material=underline c=#FFFFFF h=2 event=terminology args=(107503)>「烈式」</material>：消耗<color=#E78300>4</color>个印记，对自身周围造成共计<color=#E78300>{3}</color>攻击力的火属性伤害。施放时全队伍获得<material=underline c=#FFFFFF h=2 event=terminology args=(107505)>「烬火」</material>。\n<material=underline c=#FFFFFF h=2 event=terminology args=(107505)>「烬火」</material>：生命值不高于<color=#E78300>70%</color>时，命中瞬间伤害上升<color=#E78300>4%</color>，生命值每比<color=#E78300>70%</color>低<color=#E78300>1%</color>额外上升<color=#E78300>0.4%</color>，最高<color=#E78300>{4}</color>。\n\n<color=#297DE0>印记：</color><material=underline c=#FFFFFF h=2 event=terminology args=(107501)>「起式」</material>或<material=underline c=#FFFFFF h=2 event=terminology args=(107502)>「燃式」</material>攻击命中后，获得<color=#E78300>1</color>个印记。",
		maxLv = 60,
		type = 1,
		id = 101075202,
		extra_param = "",
		param = {
			{
				700,
				17.944,
				true,
				"%"
			},
			{
				800,
				20.508,
				true,
				"%"
			},
			{
				1000,
				25.64,
				true,
				"%"
			},
			{
				8.8,
				0.4,
				true,
				"%"
			}
		}
	},
	[101075203] = {
		description = "脱胎于天南法门的御火功法之一，由于天南法门的特点，实战中有三式。\n<material=underline c=#FFFFFF h=2 event=terminology args=(107501)>「起式」</material>：挥舞折扇同时突进攻击前方大范围的敌人，造成共计<color=#E78300>{1}</color>攻击力的火属性伤害，命中后，该技能切换为<material=underline c=#FFFFFF h=2 event=terminology args=(107502)>「燃式」</material>。\n<material=underline c=#FFFFFF h=2 event=terminology args=(107502)>「燃式」</material>：交叉挥舞两把折扇攻击前方大范围的敌人，造成共计<color=#E78300>{2}</color>攻击力的火属性伤害，命中后，该技能切换为<material=underline c=#FFFFFF h=2 event=terminology args=(107501)>「起式」</material>。\n<material=underline c=#FFFFFF h=2 event=terminology args=(107503)>「烈式」</material>：消耗<color=#E78300>4</color>个印记，对自身周围造成共计<color=#E78300>{3}</color>攻击力的火属性伤害。施放时全队伍获得<material=underline c=#FFFFFF h=2 event=terminology args=(107506)>「煌焰」</material>。\n<material=underline c=#FFFFFF h=2 event=terminology args=(107506)>「煌焰」</material>：生命值不低于<color=#E78300>50%</color>时，命中瞬间伤害上升<color=#E78300>4%</color>，生命值每比<color=#E78300>50%</color>高<color=#E78300>1%</color>额外上升<color=#E78300>0.4%</color>，最高<color=#E78300>{4}</color>。\n\n<color=#297DE0>印记：</color><material=underline c=#FFFFFF h=2 event=terminology args=(107501)>「起式」</material>或<material=underline c=#FFFFFF h=2 event=terminology args=(107502)>「燃式」</material>攻击命中后，获得<color=#E78300>1</color>个印记。",
		maxLv = 60,
		type = 1,
		id = 101075203,
		extra_param = "",
		param = {
			{
				700,
				17.947,
				true,
				"%"
			},
			{
				900,
				23.075,
				true,
				"%"
			},
			{
				1000,
				25.64,
				true,
				"%"
			},
			{
				6.6,
				0.3,
				true,
				"%"
			}
		}
	},
	[101075208] = {
		description = "澄心·陵光与太一·庚辰的连携奥义。\n澄心·陵光造成<color=#E78300>{1}+{2}</color>×<color=#297DE0>自身奥义等级</color>攻击力的火属性伤害；施放时全队伍获得<material=underline c=#FFFFFF h=2 event=terminology args=(107508)>「烈阳炽」</material>，持续<color=#E78300>7</color>秒；太一·庚辰的水属性伤害提高<color=#E78300>{5}</color>，持续<color=#E78300>{6}</color>秒。\n太一·庚辰造成<color=#E78300>{3}+{4}</color>×<color=#297DE0>自身奥义等级</color>攻击力的水属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101075208,
		extra_param = "",
		param = {
			{
				1000,
				0,
				false,
				"%"
			},
			{
				25.641,
				0,
				false,
				"%"
			},
			{
				1500,
				0,
				false,
				"%"
			},
			{
				38.462,
				0,
				false,
				"%"
			},
			{
				15,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			}
		}
	},
	[101075209] = {
		description = "彻底参悟天南法门后习得的极致功法，可以爆发烈火之力。\n施放任意技能的<material=underline c=#FFFFFF h=2 event=terminology args=(107503)>「烈式」</material>时，全队伍获得<material=underline c=#FFFFFF h=2 event=terminology args=(107507)>「阳炽」</material>，持续<color=#E78300>{3}</color>秒；施放奥义后，全队伍获得<material=underline c=#FFFFFF h=2 event=terminology args=(107508)>「烈阳炽」</material>，持续<color=#E78300>{4}</color>秒；拥有<material=underline c=#FFFFFF h=2 event=terminology args=(107508)>「烈阳炽」</material>时，<material=underline c=#FFFFFF h=2 event=terminology args=(107507)>「阳炽」</material>的加成效果不生效。\n<material=underline c=#FFFFFF h=2 event=terminology args=(107507)>「阳炽」</material>：<color=#E78300>50%</color>的概率命中瞬间独立伤害提高<color=#E78300>{1}</color>。\n<material=underline c=#FFFFFF h=2 event=terminology args=(107508)>「烈阳炽」</material>：<color=#E78300>100%</color>的概率命中瞬间独立伤害提高<color=#E78300>{2}</color>。\n\n自身或者队友攻击造成会心后，获得<color=#E78300>3%</color>的奥义值，该效果每<color=#E78300>2</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101075209,
		extra_param = "",
		param = {
			{
				3.4,
				0.2,
				true,
				"%"
			},
			{
				6.8,
				0.4,
				true,
				"%"
			},
			{
				7,
				0,
				false,
				""
			},
			{
				7,
				0,
				false,
				""
			}
		}
	},
	[101075305] = {
		description = "脱胎于天南法门的身法。\n快速闪避敌人攻击，极限闪避会触发闪避效果。\n闪避效果：进入零时空间使全场敌人动作大幅减速，持续<color=#E78300>3</color>秒；闪避效果每<color=#E78300>{1}</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101075305,
		extra_param = "",
		param = {
			{
				20,
				0,
				false,
				""
			}
		}
	},
	[101076101] = {
		description = "操控太一的神力，连续攻击敌人，造成共计<color=#E78300>{1}</color>攻击力的水属性伤害。普通攻击第四段会聚集并挑空命中的敌人；普通攻击第六段会击飞命中的敌人。\n\n被动：\n施放「冀野星陨」、「黎丘云合」后会获得对应的<material=underline c=#FFFFFF h=2 event=terminology args=(107601)>「阳爻」</material>、<material=underline c=#FFFFFF h=2 event=terminology args=(107602)>「阴爻」</material>标记，<material=underline c=#FFFFFF h=2 event=terminology args=(107601)>「阳爻」</material>和<material=underline c=#FFFFFF h=2 event=terminology args=(107602)>「阴爻」</material>标记最多拥有<color=#E78300>4</color>个。\n\n<color=#297DE0>怒气：</color>普通攻击命中后会获得怒气。",
		maxLv = 60,
		type = 1,
		id = 101076101,
		extra_param = "",
		param = {
			{
				875,
				16.821,
				true,
				"%"
			}
		}
	},
	[101076201] = {
		description = "「冀野星陨·阳」：造成共计<color=#E78300>{1}</color>攻击力的水属性伤害，挑空攻击命中的敌人，该技能施放时获得<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(107601)>「阳爻」</material>标记，并替换为「冀野星陨·阴」。\n「冀野星陨·阴」：造成共计<color=#E78300>{2}</color>攻击力的水属性伤害，小范围聚集敌人，该技能施放时获得<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(107602)>「阴爻」</material>标记，并替换为「冀野星陨·阳」。\n「冀野星陨·阳」和「冀野星陨·阴」共用冷却时间。",
		maxLv = 60,
		type = 1,
		id = 101076201,
		extra_param = "",
		param = {
			{
				900,
				23.076,
				true,
				"%"
			},
			{
				900,
				23.076,
				true,
				"%"
			}
		}
	},
	[101076202] = {
		description = "「黎丘云合·阳」：造成共计<color=#E78300>{1}</color>攻击力的水属性伤害，挑空最后一次攻击命中的敌人，该技能施放时获得<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(107601)>「阳爻」</material>标记，并替换为「黎丘云合·阴」。\n「黎丘云合·阴」：造成共计<color=#E78300>{2}</color>攻击力的水属性伤害，该技能施放时获得<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(107602)>「阴爻」</material>标记，并替换为「黎丘云合·阳」。\n「黎丘云合·阳」和「黎丘云合·阴」共用冷却时间。",
		maxLv = 60,
		type = 1,
		id = 101076202,
		extra_param = "",
		param = {
			{
				900,
				23.076,
				true,
				"%"
			},
			{
				900,
				23.073,
				true,
				"%"
			}
		}
	},
	[101076203] = {
		description = "施放「南极海鸣」时，全场敌人动作迟缓至<color=#E78300>{8}</color>，持续<color=#E78300>{9}</color>秒。\n「南极海鸣·阳」：消耗<color=#E78300>2</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(107601)>「阳爻」</material>标记，造成共计<color=#E78300>{1}</color>攻击力的水属性伤害，之后极大范围聚集敌人，持续<color=#E78300>{4}</color>秒。施放后「冀野星陨」、「黎丘云合」切换到「冀野星陨·阴」、「黎丘云合·阴」并重置冷却时间，该技能切换到「南极海鸣·阴」，自身进入<material=underline c=#FFFFFF h=2 event=terminology args=(107603)>「虚极」</material>状态。\n「南极海鸣·阴」：消耗<color=#E78300>2</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(107602)>「阴爻」</material>标记，造成共计<color=#E78300>{2}</color>攻击力的水属性伤害，之后每<color=#E78300>{5}</color>秒全场随机选择攻击<color=#E78300>{7}</color>次敌人，每次攻击造成<color=#E78300>{3}</color>攻击力的水属性伤害，持续<color=#E78300>{6}</color>秒。施放后「冀野星陨」、「黎丘云合」切换到「冀野星陨·阳」、「黎丘云合·阳」并重置冷却时间，该技能切换到「南极海鸣·阳」自身进入<material=underline c=#FFFFFF h=2 event=terminology args=(107604)>「恒极」</material>状态。\n「南极海鸣·阳」和「南极海鸣·阴」有分别的冷却时间。",
		maxLv = 60,
		type = 1,
		id = 101076203,
		extra_param = "",
		param = {
			{
				1200,
				30.767,
				true,
				"%"
			},
			{
				800,
				20.511,
				true,
				"%"
			},
			{
				64,
				1.641,
				true,
				"%"
			},
			{
				8,
				0,
				false,
				""
			},
			{
				1,
				0,
				false,
				""
			},
			{
				8,
				0,
				false,
				""
			},
			{
				4,
				0,
				false,
				""
			},
			{
				50,
				0,
				false,
				"%"
			},
			{
				1.5,
				0,
				false,
				""
			}
		}
	},
	[101076209] = {
		description = "释放太一的澎拜神力，造成共计<color=#E78300>{1}</color>攻击力的水属性伤害。\n\n天垣神系修正者攻击命中后，根据出场时队伍天垣神系修正者的数量，依次获得<color=#E78300>2%、3%、4%</color>的奥义值，该效果每<color=#E78300>2</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101076209,
		extra_param = "",
		param = {
			{
				1500,
				38.461,
				true,
				"%"
			}
		}
	},
	[101076305] = {
		description = "快速闪避敌人攻击，极限闪避会触发闪避效果。\n闪避效果：进入零时空间使全场敌人动作大幅减速，持续<color=#E78300>2</color>秒；并小范围聚集敌人；处于<material=underline c=#FFFFFF h=2 event=terminology args=(107604)>「恒极」</material>状态时，获得<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(107601)>「阳爻」</material>标记；处于<material=underline c=#FFFFFF h=2 event=terminology args=(107603)>「虚极」</material>状态时，获得<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(107602)>「阴爻」</material>标记；闪避效果每<color=#E78300>{1}</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101076305,
		extra_param = "",
		param = {
			{
				20,
				0,
				false,
				""
			}
		}
	},
	[101080101] = {
		description = "连续挥舞战斧攻击敌人，造成共计<color=#E78300>{1}</color>攻击力的冰属性伤害。\n\n<color=#297DE0>怒气：</color>普通攻击命中后会获得怒气。",
		maxLv = 60,
		type = 1,
		id = 101080101,
		extra_param = "",
		param = {
			{
				298,
				5.767,
				true,
				"%"
			}
		}
	},
	[101080111] = {
		description = "连续挥舞战斧攻击敌人，造成共计<color=#E78300>{1}</color>攻击力的冰属性伤害。普通攻击命中敌人时，有一定的概率对前方的敌人附加冰冻状态，持续<color=#E78300>{2}</color>秒，该效果每<color=#E78300>6</color>秒最多触发一次。每次普通攻击命中处于冰冻状态的敌人后会额外获得<color=#E78300>6</color>点怒气。普通攻击命中后，会对前方非自身普通攻击直接命中的敌人进行范围技能攻击，造成<color=#E78300>125%</color>攻击力的冰属性伤害。\n\n<color=#297DE0>怒气：</color>普通攻击命中后会获得怒气。",
		maxLv = 60,
		type = 1,
		id = 101080111,
		extra_param = "",
		param = {
			{
				298,
				5.767,
				true,
				"%"
			},
			{
				2,
				0,
				false,
				""
			}
		}
	},
	[101080201] = {
		description = "挥舞战斧对周围敌人进行攻击，造成共计<color=#E78300>{1}</color>攻击力的冰属性伤害，第二段攻击会对命中的敌人附加冰冻状态，持续<color=#E78300>{2}</color>秒。",
		maxLv = 60,
		type = 1,
		id = 101080201,
		extra_param = "",
		param = {
			{
				180,
				4.614,
				true,
				"%"
			},
			{
				3,
				0,
				false,
				""
			}
		}
	},
	[101080202] = {
		description = "身体旋转并舞动战斧，持续攻击周围敌人，造成共计<color=#E78300>{1}</color>攻击力的冰属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101080202,
		extra_param = "",
		param = {
			{
				345,
				8.969,
				true,
				"%"
			}
		}
	},
	[101080203] = {
		description = "跃起劈向目标，造成<color=#E78300>{1}</color>攻击力的冰属性伤害。施放「极地猎袭」成功击败敌人时，重置该技能的冷却时间。",
		maxLv = 60,
		type = 1,
		id = 101080203,
		extra_param = "",
		param = {
			{
				360,
				9.23,
				true,
				"%"
			}
		}
	},
	[101080208] = {
		description = "寒霜之牙·维达尔与逆潮·利维坦的连携奥义。\n寒霜之牙·维达尔造成<color=#E78300>{1}+{2}</color>×<color=#297DE0>自身奥义等级</color>攻击力的冰属性伤害；命中时对敌人附加冰属性抗性降低<color=#E78300>{5}</color>，持续<color=#E78300>{6}</color>秒。\n逆潮·利维坦造成<color=#E78300>{3}+{4}</color>×<color=#297DE0>自身奥义等级</color>攻击力的水属性伤害；命中时全队伍受到的伤害降低<color=#E78300>{7}</color>，每<color=#E78300>2</color>秒恢复自身<color=#E78300>{9}攻击力</color>的生命值，持续<color=#E78300>{8}</color>秒。",
		maxLv = 60,
		type = 1,
		id = 101080208,
		extra_param = "",
		param = {
			{
				600,
				30,
				true,
				"%"
			},
			{
				15.385,
				0.769,
				true,
				"%"
			},
			{
				800,
				40,
				true,
				"%"
			},
			{
				20.513,
				1.026,
				true,
				"%"
			},
			{
				30,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			},
			{
				25,
				0,
				false,
				"%"
			},
			{
				8,
				0,
				false,
				""
			},
			{
				20,
				0,
				false,
				"%"
			}
		}
	},
	[101080209] = {
		description = "对敌人造成共计<color=#E78300>{1}</color>攻击力的冰属性伤害；命中时对敌人附加冰属性抗性降低<color=#E78300>{2}</color>，持续<color=#E78300>{3}</color>秒。\n\n当敌人被附加冰冻状态时，获得<color=#E78300>8%</color>的奥义值，该效果每<color=#E78300>2</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101080209,
		extra_param = "",
		param = {
			{
				500,
				12.82,
				true,
				"%"
			},
			{
				30,
				0,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[101080305] = {
		description = "快速闪避敌人攻击，极限闪避会触发闪避效果。\n闪避效果：进入零时空间使全场敌人动作大幅减速，持续<color=#E78300>2</color>秒；冰属性伤害提高<color=#E78300>{1}</color>，效果持续<color=#E78300>{2}</color>秒；闪避效果每<color=#E78300>{3}</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101080305,
		extra_param = "",
		param = {
			{
				50,
				0,
				false,
				"%"
			},
			{
				5,
				0,
				false,
				""
			},
			{
				18,
				0,
				false,
				""
			}
		}
	},
	[101081101] = {
		description = "挥动斩浪号上搭载的斩舰刃，配合武装连续进攻敌人，造成共计<color=#E78300>{1}</color>攻击力的冰属性伤害。普通攻击任意一段后都可通过长按衔接施放蓄力技能攻击「霜断」。由于斩浪号的存在，自身不会受到击飞影响。\n「霜断」：造成共计<color=#E78300>{2}</color>攻击力的冰属性伤害。\n处于<material=underline c=#FFFFFF h=2 event=terminology args=(108102)>「巡航模式」</material>时，施放普通攻击会自动锁定目标并发射二枚利剑式跟踪导弹，每一枚跟踪导弹能造成<color=#E78300>{3}</color>攻击力的冰属性伤害，当锁定的敌人处于冰冻状态时会额外发射两枚跟踪导弹。\n\n<color=#297DE0>神能：</color>非<material=underline c=#FFFFFF h=2 event=terminology args=(108102)>「巡航模式」</material>时，普通攻击与「霜断」命中后会获得神能；<material=underline c=#FFFFFF h=2 event=terminology args=(108102)>「巡航模式」</material>时，移动与漂移都会获得神能。",
		maxLv = 60,
		type = 1,
		id = 101081101,
		extra_param = "",
		param = {
			{
				498,
				9.61,
				true,
				"%"
			},
			{
				250,
				4.807,
				true,
				"%"
			},
			{
				80,
				2.051,
				true,
				"%"
			}
		}
	},
	[101081201] = {
		description = "使用斩舰刃对前方敌人进行高速连斩，造成共计<color=#E78300>{1}</color>攻击力的冰属性伤害，每次施放命中时获得<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(108101)>「破冰」</material>标记，<material=underline c=#FFFFFF h=2 event=terminology args=(108101)>「破冰」</material>标记最多拥有<color=#E78300>3</color>个；每拥有<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(108101)>「破冰」</material>标记，冰属性伤害提高<color=#E78300>10%</color>、蓄力技能伤害提高<color=#E78300>20%</color>。<material=underline c=#FFFFFF h=2 event=terminology args=(108102)>「巡航模式」</material>时，「破空寒流」会替换为「极地冰爆」。\n「极地冰爆」：消耗<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(108101)>「破冰」</material>标记向目标发射冻结跟踪弹，对爆炸范围内的敌人造成<color=#E78300>{2}</color>攻击力的冰属性伤害并附加冰冻状态，持续<color=#E78300>{3}</color>秒。「极地冰爆」有<color=#E78300>4</color>秒的冷却时间。",
		maxLv = 60,
		type = 1,
		id = 101081201,
		extra_param = "",
		param = {
			{
				1000,
				25.64,
				true,
				"%"
			},
			{
				360,
				9.23,
				true,
				"%"
			},
			{
				2,
				0,
				false,
				""
			}
		}
	},
	[101081202] = {
		description = "在斩浪号的辅助下高速突进，向前斩出凝聚冰锋的一刀，造成共计<color=#E78300>{1}</color>攻击力的冰属性伤害。<material=underline c=#FFFFFF h=2 event=terminology args=(108102)>「巡航模式」</material>时，「冰锋闪袭」会替换为「晶尘飞散」。\n「晶尘飞散」：神能为满时才可施放，消耗全部神能向锁定的敌人发动一次冲刺攻击，冲刺过程中会有短暂的闪避判定，造成共计<color=#E78300>{2}</color>攻击力的冰属性伤害，施放时利剑式跟踪导弹的发射速度提高<color=#E78300>75%</color>，持续<color=#E78300>2</color>秒。「晶尘飞散」有<color=#E78300>3</color>秒的冷却时间。\n\n<color=#297DE0>神能：</color>「冰锋闪袭」攻击命中后获得<color=#E78300>15</color>点神能。",
		maxLv = 60,
		type = 1,
		id = 101081202,
		extra_param = "",
		param = {
			{
				700,
				17.948,
				true,
				"%"
			},
			{
				300,
				7.692,
				true,
				"%"
			}
		}
	},
	[101081203] = {
		description = "神能为满时，斩浪号可消耗全部神能进入<material=underline c=#FFFFFF h=2 event=terminology args=(108102)>「巡航模式」</material>，持续<color=#E78300>15</color>秒。\n<material=underline c=#FFFFFF h=2 event=terminology args=(108102)>「巡航模式」</material>：获得霸体效果，禁用「大冰川期」。可通过大幅转向进行漂移快速转向。再次施放该技能或持续时间结束时会退出<material=underline c=#FFFFFF h=2 event=terminology args=(108102)>「巡航模式」</material>并消耗全部神能，随后会短暂潜入冰下并从目标附近跃出，造成共计<color=#E78300>{1}</color>攻击力的冰属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101081203,
		extra_param = "",
		param = {
			{
				700,
				17.948,
				true,
				"%"
			}
		}
	},
	[101081209] = {
		description = "斩浪号输出力全开，全力运转向斩舰刃供能，短暂蓄力后挥下释放冰霜冲击对周围敌人造成共计<color=#E78300>{1}</color>攻击力的冰属性伤害；施放时全队伍蓄力技能伤害提高<color=#E78300>{2}</color>，持续<color=#E78300>{3}</color>秒。\n\n当有敌人进入控制抗性状态时，获得<color=#E78300>25%</color>的奥义值。",
		maxLv = 60,
		type = 1,
		id = 101081209,
		extra_param = "",
		param = {
			{
				1000,
				25.641,
				true,
				"%"
			},
			{
				45,
				0,
				false,
				"%"
			},
			{
				15,
				0,
				false,
				""
			}
		}
	},
	[101081305] = {
		description = "非<material=underline c=#FFFFFF h=2 event=terminology args=(108102)>「巡航模式」</material>：\n非移动时长按闪避时：消耗闪避值在原地展开屏障，自身受到的伤害降低<color=#E78300>60%</color>。屏障持续期间可再次消耗闪避值格挡第一次伤害。当自身拥有<material=underline c=#FFFFFF h=2 event=terminology args=(108101)>「破冰」</material>标记时，成功格挡后的短暂时间内取消点击，会消耗<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(108101)>「破冰」</material>标记施放一次「霜断」，该次施放「霜断」期间自身获得无敌效果。\n移动时点击闪避：快速闪避敌人攻击，对沿途敌人造成共计<color=#E78300>{1}</color>攻击力的冰属性伤害，极限闪避会触发闪避效果。\n<material=underline c=#FFFFFF h=2 event=terminology args=(108102)>「巡航模式」</material>：\n驾驶斩浪号短暂潜入冰中闪避敌人攻击，极限闪避会触发闪避效果。\n闪避效果：获得<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(108101)>「破冰」</material>标记；闪避效果每<color=#E78300>{2}</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101081305,
		extra_param = "",
		param = {
			{
				100,
				2.564,
				true,
				"%"
			},
			{
				12,
				0,
				false,
				""
			}
		}
	},
	[101084101] = {
		description = "挥动卢恩之刃对目标进行连续斩击，造成共计<color=#E78300>{1}</color>攻击力的物理属性伤害。\n\n<color=#297DE0>神能：</color>普通攻击命中后会获得神能。",
		maxLv = 60,
		type = 1,
		id = 101084101,
		extra_param = "",
		param = {
			{
				87,
				1.704,
				true,
				"%"
			}
		}
	},
	[101084201] = {
		description = "向前方进行一定距离的突刺，对沿途敌人造成共计<color=#E78300>{1}</color>攻击力的物理属性伤害。施放两次「高速突刺」后会替换为<material=underline c=#FFFFFF h=2 event=terminology args=(128401)>「破晓」</material>。\n<material=underline c=#FFFFFF h=2 event=terminology args=(128401)>「破晓」</material>：对沿途敌人造成共计<color=#E78300>{2}</color>攻击力的物理属性伤害。\n该技能命中处于<material=underline c=#FFFFFF h=2 event=terminology args=(108401)>「卢恩标记」</material>状态的敌人结束后，清除<material=underline c=#FFFFFF h=2 event=terminology args=(108401)>「卢恩标记」</material>。\n\n<color=#297DE0>神能：</color><material=underline c=#FFFFFF h=2 event=terminology args=(128401)>「破晓」</material>命中处于<material=underline c=#FFFFFF h=2 event=terminology args=(108401)>「卢恩标记」</material>状态的敌人时，获得<color=#E78300>50</color>点神能。",
		maxLv = 60,
		type = 1,
		id = 101084201,
		extra_param = "",
		param = {
			{
				52,
				1.384,
				true,
				"%"
			},
			{
				72,
				1.844,
				true,
				"%"
			}
		}
	},
	[101084202] = {
		description = "向周围敌人进行横斩，造成共计<color=#E78300>{1}</color>攻击力的物理属性伤害，对命中的敌人附加<material=underline c=#FFFFFF h=2 event=terminology args=(108401)>「卢恩标记」</material>状态，持续<color=#E78300>4</color>秒，重置技能一的冷却时间。\n自身其他技能对处于<material=underline c=#FFFFFF h=2 event=terminology args=(108401)>「卢恩标记」</material>状态的敌人命中瞬间会心率提高<color=#E78300>{2}</color>。",
		maxLv = 60,
		type = 1,
		id = 101084202,
		extra_param = "",
		param = {
			{
				85,
				2.205,
				true,
				"%"
			},
			{
				100,
				0,
				false,
				"%"
			}
		}
	},
	[101084203] = {
		description = "施放出多道剑光对敌人进行攻击，造成共计<color=#E78300>{1}</color>攻击力的物理属性伤害，施放后重置技能一的冷却时间，命中处于<material=underline c=#FFFFFF h=2 event=terminology args=(108401)>「卢恩标记」</material>状态的敌人结束后，清除<material=underline c=#FFFFFF h=2 event=terminology args=(108401)>「卢恩标记」</material>。当神能达到满值时，该技能会替换为「逐光落影」。\n「逐光落影」：消耗全部神能，举剑产生冲击后大范围横斩，造成共计<color=#E78300>{2}</color>攻击力的物理属性伤害，该技能会心率提高<color=#E78300>100%</color>，重置技能一的冷却时间。",
		maxLv = 60,
		type = 1,
		id = 101084203,
		extra_param = "",
		param = {
			{
				220,
				5.64,
				true,
				"%"
			},
			{
				298,
				7.688,
				true,
				"%"
			}
		}
	},
	[101084209] = {
		description = "卢恩之刃展开为命运之刃，对目标敌人进行斩击，造成共计<color=#E78300>{1}</color>攻击力的物理属性伤害；该次奥义攻击修正系数提高<color=#E78300>{2}</color>。\n\n自身或者队友触发零时空间时，获得<color=#E78300>15%</color>的奥义值，该效果每<color=#E78300>0.5</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101084209,
		extra_param = "",
		param = {
			{
				360,
				9.23,
				true,
				"%"
			},
			{
				200,
				0,
				false,
				"%"
			}
		}
	},
	[101084212] = {
		description = "向前方进行一定距离的突刺，对沿途敌人造成共计<color=#E78300>{1}</color>攻击力的物理属性伤害。施放时自身伤害提高，持续<color=#E78300>5</color>秒，最多可叠加<color=#E78300>3</color>层。施放两次「飓风突刺」后会替换为「启明」。\n「启明」：攻击沿途敌人，造成共计<color=#E78300>{2}</color>攻击力的物理属性伤害。\n该技能命中处于<material=underline c=#FFFFFF h=2 event=terminology args=(108401)>「卢恩标记」</material>状态的敌人结束后，清除<material=underline c=#FFFFFF h=2 event=terminology args=(108401)>「卢恩标记」</material>。\n\n<color=#297DE0>神能：</color>施放时获得<color=#E78300>10</color>点神能；「启明」命中处于<material=underline c=#FFFFFF h=2 event=terminology args=(108401)>「卢恩标记」</material>状态的敌人时，获得<color=#E78300>50</color>点神能。",
		maxLv = 60,
		type = 1,
		id = 101084212,
		extra_param = "",
		param = {
			{
				52,
				1.384,
				true,
				"%"
			},
			{
				72,
				1.844,
				true,
				"%"
			}
		}
	},
	[101084305] = {
		description = "快速闪避敌人攻击，且可以连续施放二次闪避，极限闪避会触发闪避效果。\n闪避效果：进入零时空间使全场敌人动作大幅减速，持续<color=#E78300>3</color>秒；闪避效果每<color=#E78300>{1}</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101084305,
		extra_param = "",
		param = {
			{
				20,
				0,
				false,
				""
			}
		}
	},
	[101089101] = {
		description = "造成共计<color=#E78300>{1}</color>攻击力的风属性伤害。\n\n被动：\n自身拥有<color=#E78300>3</color>种类型<material=underline c=#FFFFFF h=2 event=terminology args=(108901)>「风弹」</material>，<material=underline c=#FFFFFF h=2 event=terminology args=(108901)>「风弹」</material>最多拥有<color=#E78300>6</color>颗。\n拥有<material=underline c=#FFFFFF h=2 event=terminology args=(108901)>「风弹」</material>时，施放「格刹奔袭」、「坎蒂破影」时会分别消耗<color=#E78300>1、3</color>颗<material=underline c=#FFFFFF h=2 event=terminology args=(108901)>「风弹」</material>并获得不同效果：\n消耗<material=underline c=#FFFFFF h=2 event=terminology args=(108902)>「风弹·湛蓝」</material>时：当自身生命值为满时，获得<color=#E78300>12</color>层<material=underline c=#FFFFFF h=2 event=terminology args=(108905)>「湛蓝」</material>状态；\n消耗<material=underline c=#FFFFFF h=2 event=terminology args=(108902)>「风弹·湛蓝」</material>命中时：根据消耗的<material=underline c=#FFFFFF h=2 event=terminology args=(108901)>「风弹」</material>数量，每有<color=#E78300>1</color>颗每次命中后恢复<color=#E78300>2%</color>的生命值；\n<material=underline c=#FFFFFF h=2 event=terminology args=(108905)>「湛蓝」</material>：拥有层数时受到的伤害降低<color=#E78300>{2}</color>，最多持续<color=#E78300>30</color>秒，每次生命值降低时失去<color=#E78300>1</color>层；\n消耗<material=underline c=#FFFFFF h=2 event=terminology args=(108903)>「风弹·澄黄」</material>时：获得<color=#E78300>1</color>层<material=underline c=#FFFFFF h=2 event=terminology args=(108906)>「澄黄」</material>状态，最多可叠加<color=#E78300>6</color>层；\n消耗<material=underline c=#FFFFFF h=2 event=terminology args=(108903)>「风弹·澄黄」</material>命中时：根据消耗的<material=underline c=#FFFFFF h=2 event=terminology args=(108901)>「风弹」</material>数量，每<color=#E78300>1</color>颗技能命中瞬间技能伤害提高<color=#E78300>3%</color>；\n<material=underline c=#FFFFFF h=2 event=terminology args=(108906)>「澄黄」</material>：每有<color=#E78300>1</color>层，伤害提高<color=#E78300>2%</color>；\n消耗<material=underline c=#FFFFFF h=2 event=terminology args=(108904)>「风弹·赤红」</material>时：消耗<color=#E78300>1</color>层<material=underline c=#FFFFFF h=2 event=terminology args=(108906)>「澄黄」</material>状态，获得<color=#E78300>10</color>层<material=underline c=#FFFFFF h=2 event=terminology args=(108907)>「赤红」</material>状态，<material=underline c=#FFFFFF h=2 event=terminology args=(108907)>「赤红」</material>状态层数达到<color=#E78300>60</color>层后改变为获得<color=#E78300>2</color>层<material=underline c=#FFFFFF h=2 event=terminology args=(108907)>「赤红」</material>状态，最多可叠加<color=#E78300>100</color>层；\n消耗<material=underline c=#FFFFFF h=2 event=terminology args=(108904)>「风弹·赤红」</material>命中时：根据消耗的<material=underline c=#FFFFFF h=2 event=terminology args=(108901)>「风弹」</material>数量，每<color=#E78300>1</color>颗技能命中瞬间技能伤害提高<color=#E78300>5%</color>；\n<material=underline c=#FFFFFF h=2 event=terminology args=(108907)>「赤红」</material>：每有<color=#E78300>1</color>层，风属性伤害提高<color=#E78300>0.3%</color>。\n\n<material=underline c=#FFFFFF h=2 event=terminology args=(108901)>「风弹」</material>类型为<material=underline c=#FFFFFF h=2 event=terminology args=(108904)>「风弹·赤红」</material>时，施放技能时会对自身造成<color=#E78300>10%</color>生命值上限的伤害，自身拥有<material=underline c=#FFFFFF h=2 event=terminology args=(108905)>「湛蓝」</material>状态时，会消耗<color=#E78300>1</color>层，改变为对自身造成<color=#E78300>5%</color>生命值上限的伤害。\n施放普通攻击第二、第四、第六段时，获得神能增加效果，持续<color=#E78300>6</color>秒，最多可叠加<color=#E78300>2</color>层，每层自身每<color=#E78300>0.6</color>秒获得<color=#E78300>2</color>点神能；神能为满时，会进行自动装填，消耗全部神能，获得<color=#E78300>6</color>颗<material=underline c=#FFFFFF h=2 event=terminology args=(108901)>「风弹」</material>，重置技能的冷却时间。",
		maxLv = 60,
		type = 1,
		id = 101089101,
		extra_param = "",
		param = {
			{
				735,
				14.174,
				true,
				"%"
			},
			{
				80,
				0,
				false,
				"%"
			}
		}
	},
	[101089201] = {
		description = "造成共计<color=#E78300>{1}</color>攻击力的风属性伤害；处于普通攻击获得的神能增加效果时，该技能每次命中后获得<color=#E78300>4</color>点神能，施放后该技能的剩余冷却时间缩短<color=#E78300>25%</color>，并且不会打断普通攻击的连段。",
		maxLv = 60,
		type = 1,
		id = 101089201,
		extra_param = "",
		param = {
			{
				600,
				15.384,
				true,
				"%"
			}
		}
	},
	[101089202] = {
		description = "造成共计<color=#E78300>{1}</color>攻击力的风属性伤害；处于普通攻击获得的神能增加效果时，该技能每次命中后获得<color=#E78300>2</color>点神能，施放后该技能的剩余冷却时间缩短<color=#E78300>25%</color>，并且不会打断普通攻击的连段。",
		maxLv = 60,
		type = 1,
		id = 101089202,
		extra_param = "",
		param = {
			{
				900,
				23.075,
				true,
				"%"
			}
		}
	},
	[101089203] = {
		description = "手动装填，造成共计<color=#E78300>{1}</color>攻击力的风属性伤害，切换<material=underline c=#FFFFFF h=2 event=terminology args=(108901)>「风弹」</material>类型，消耗全部神能，每消耗<color=#E78300>15</color>点神能，获得<color=#E78300>1</color>颗<material=underline c=#FFFFFF h=2 event=terminology args=(108901)>「风弹」</material>。\n该技能不处于冷却状态时，可以通过快速先后点击普通攻击、「格刹奔袭」施放该技能进行手动装填，通过该途径施放时不会使该技能进入冷却、不会打断普通攻击的连段，该途径每<color=#E78300>1</color>秒最多触发一次；不切换<material=underline c=#FFFFFF h=2 event=terminology args=(108901)>「风弹」</material>类型，消耗全部神能获得对应数量的<material=underline c=#FFFFFF h=2 event=terminology args=(108901)>「风弹」</material>。\n<material=underline c=#FFFFFF h=2 event=terminology args=(108901)>「风弹」</material>类型为<material=underline c=#FFFFFF h=2 event=terminology args=(108904)>「风弹·赤红」</material>时，该技能会替换为「自在花舞」。\n「自在花舞」：造成共计<color=#E78300>{2}</color>攻击力的风属性伤害，攻击每次命中时，会消耗<color=#E78300>1</color>颗<material=underline c=#FFFFFF h=2 event=terminology args=(108901)>「风弹」</material>对命中的敌人附加风属性抗性降低<color=#E78300>2%</color>，持续<color=#E78300>{3}</color>秒，最多可叠加<color=#E78300>6</color>层；该技能有<color=#E78300>2</color>秒的冷却时间。",
		maxLv = 60,
		type = 1,
		id = 101089203,
		extra_param = "",
		param = {
			{
				300,
				7.685,
				true,
				"%"
			},
			{
				1000,
				25.64,
				true,
				"%"
			},
			{
				6,
				0,
				false,
				""
			}
		}
	},
	[101089208] = {
		description = "焚轮·帕尔瓦蒂与三相·梵天的连携奥义。\n焚轮·帕尔瓦蒂造成<color=#E78300>{1}+{2}</color>×<color=#297DE0>自身奥义等级</color>攻击力的风属性伤害；施放时，全队伍攻击力提高<color=#E78300>{5}</color>，持续<color=#E78300>{6}</color>秒；施放后重置自身奥义的冷却时间。\n三相·梵天造成<color=#E78300>{3}+{4}</color>×<color=#297DE0>自身奥义等级</color>攻击力的风属性伤害；自身切换为<material=underline c=#FFFFFF h=2 event=terminology args=(102002)>「毁灭」</material>。",
		maxLv = 60,
		type = 1,
		id = 101089208,
		extra_param = "",
		param = {
			{
				1200,
				0,
				false,
				"%"
			},
			{
				30.769,
				0,
				false,
				"%"
			},
			{
				1200,
				0,
				false,
				"%"
			},
			{
				30.769,
				0,
				false,
				"%"
			},
			{
				20,
				0,
				false,
				"%"
			},
			{
				20,
				0,
				false,
				""
			}
		}
	},
	[101089209] = {
		description = "造成共计<color=#E78300>{1}</color>攻击力的风属性伤害；切换<material=underline c=#FFFFFF h=2 event=terminology args=(108901)>「风弹」</material>类型，恢复满神能。\n\n自身或者队友施放奥义时，自身施放「格刹奔袭」、「坎蒂破影」消耗<material=underline c=#FFFFFF h=2 event=terminology args=(108901)>「风弹」</material>时，获得<color=#E78300>12%</color>的奥义值。",
		maxLv = 60,
		type = 1,
		id = 101089209,
		extra_param = "",
		param = {
			{
				1200,
				30.765,
				true,
				"%"
			}
		}
	},
	[101089305] = {
		description = "快速闪避敌人攻击，极限闪避会触发闪避效果。\n闪避效果：进入零时空间使全场敌人动作大幅减速，持续<color=#E78300>2</color>秒；根据<material=underline c=#FFFFFF h=2 event=terminology args=(108901)>「风弹」</material>类型获得不同的效果：\n<material=underline c=#FFFFFF h=2 event=terminology args=(108902)>「风弹·湛蓝」</material>：恢复<color=#E78300>30%</color>的生命值；\n<material=underline c=#FFFFFF h=2 event=terminology args=(108903)>「风弹·澄黄」</material>：获得<color=#E78300>1</color>层<material=underline c=#FFFFFF h=2 event=terminology args=(108906)>「澄黄」</material>状态；\n<material=underline c=#FFFFFF h=2 event=terminology args=(108904)>「风弹·赤红」</material>：恢复满神能；\n闪避效果每<color=#E78300>{1}</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101089305,
		extra_param = "",
		param = {
			{
				20,
				0,
				false,
				""
			}
		}
	},
	[101093101] = {
		description = "使用忍刀快速地斩击敌人，造成共计<color=#E78300>{1}</color>攻击力的物理属性伤害。\n<material=underline c=#FFFFFF h=2 event=terminology args=(109301)>「忍持」</material>：由「天」与「地」两种持组合而成，消耗<material=underline c=#FFFFFF h=2 event=terminology args=(109301)>「忍持」</material>可以施展对应的「忍法」技能。当已拥有<material=underline c=#FFFFFF h=2 event=terminology args=(109301)>「忍持」</material>的情况下获得新的<material=underline c=#FFFFFF h=2 event=terminology args=(109301)>「忍持」</material>时会清空已有的<material=underline c=#FFFFFF h=2 event=terminology args=(109301)>「忍持」</material>。当神能为满时，施放「忍法」不会消耗<material=underline c=#FFFFFF h=2 event=terminology args=(109301)>「忍持」</material>而是消耗全部神能。\n\n<color=#297DE0>神能：</color>普通攻击命中后会获得神能。",
		maxLv = 60,
		type = 1,
		id = 101093101,
		extra_param = "",
		param = {
			{
				240,
				4.636,
				true,
				"%"
			}
		}
	},
	[101093208] = {
		description = "朔望·月读与觅影·国常立的连携奥义。\n朔望·月读造成<color=#E78300>{1}+{2}</color>×<color=#297DE0>自身奥义等级</color>攻击力的暗属性伤害；命中后全队伍获得<color=#E78300>30</color>点神能，对命中的敌人附加受创状态，持续<color=#E78300>{5}</color>秒。\n受创：每<color=#E78300>3</color>秒附加<color=#E78300>78%+2%</color>×<color=#297DE0>自身奥义等级</color>攻击力的暗属性伤害，持续<color=#E78300>{5}</color>秒。\n觅影·国常立造成<color=#E78300>{3}+{4}</color>×<color=#297DE0>平均技能等级</color>的攻击力的物理属性伤害；命中时对敌人附加物理、火属性、雷属性和风属性抗性降低<color=#E78300>{6}</color>，持续<color=#E78300>{7}</color>秒。",
		maxLv = 60,
		type = 1,
		id = 101093208,
		extra_param = "",
		param = {
			{
				360,
				18,
				true,
				"%"
			},
			{
				9.231,
				0.462,
				true,
				"%"
			},
			{
				1000,
				50,
				true,
				"%"
			},
			{
				25.641,
				1.282,
				true,
				"%"
			},
			{
				10,
				0,
				false,
				""
			},
			{
				30,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			}
		}
	},
	[101093231] = {
		description = "「忍法」：掷出大量苦无，对周围大范围的敌人进行攻击，造成共计<color=#E78300>{1}</color>攻击力的物理属性伤害。\n消耗「天」与「天」组合的<material=underline c=#FFFFFF h=2 event=terminology args=(109301)>「忍持」</material>施放。\n\n可通过消耗「天」与「天」组合的<material=underline c=#FFFFFF h=2 event=terminology args=(109301)>「忍持」</material>施放奥义「真无合参·雨」。对范围内敌人造成共计<color=#E78300>{2}</color>攻击力的物理属性伤害；命中时对敌人附加物理属性抗性降低<color=#E78300>{3}</color>，持续<color=#E78300>{4}</color>秒。",
		maxLv = 60,
		type = 1,
		id = 101093231,
		extra_param = "",
		param = {
			{
				320,
				8.204,
				true,
				"%"
			},
			{
				1000,
				25.64,
				true,
				"%"
			},
			{
				30,
				0,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[101093232] = {
		description = "「忍法」：化身为般若之雷，对前方敌人造成共计<color=#E78300>{1}</color>攻击力的雷属性伤害。\n消耗「天」与「地」组合的<material=underline c=#FFFFFF h=2 event=terminology args=(109301)>「忍持」</material>施放。\n\n可通过消耗「天」与「地」组合的<material=underline c=#FFFFFF h=2 event=terminology args=(109301)>「忍持」</material>施放奥义「真无合参·雷」。对范围内敌人造成共计<color=#E78300>{2}</color>攻击力的雷属性伤害；命中时对敌人附加雷属性抗性降低<color=#E78300>{3}</color>，持续<color=#E78300>{4}</color>秒。",
		maxLv = 60,
		type = 1,
		id = 101093232,
		extra_param = "",
		param = {
			{
				357,
				9.228,
				true,
				"%"
			},
			{
				1000,
				25.64,
				true,
				"%"
			},
			{
				30,
				0,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[101093233] = {
		description = "「忍法」：向前方敌人冲刺并卷起旋风，造成共计<color=#E78300>{1}</color>攻击力的风属性伤害。\n消耗「地」与「天」组合的<material=underline c=#FFFFFF h=2 event=terminology args=(109301)>「忍持」</material>施放。\n\n可通过消耗「地」与「天」组合的<material=underline c=#FFFFFF h=2 event=terminology args=(109301)>「忍持」</material>施放奥义「真无合参·风」。对范围内敌人造成共计<color=#E78300>{2}</color>攻击力的风属性伤害；命中时对敌人附加风属性抗性降低<color=#E78300>{3}</color>，持续<color=#E78300>{4}</color>秒。",
		maxLv = 60,
		type = 1,
		id = 101093233,
		extra_param = "",
		param = {
			{
				560,
				14.355,
				true,
				"%"
			},
			{
				1000,
				25.64,
				true,
				"%"
			},
			{
				30,
				0,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[101093236] = {
		description = "「忍法」：引爆目标敌人，造成共计<color=#E78300>{1}</color>攻击力的火属性伤害，并在目标身上留下间歇爆破<color=#E78300>9</color>次的界阵，每次爆破造成<color=#E78300>{2}</color>攻击力的火属性伤害，当目标被击败爆破会立即停止。\n消耗「地」与「地」组合的<material=underline c=#FFFFFF h=2 event=terminology args=(109301)>「忍持」</material>施放。\n\n可通过消耗「地」与「地」组合的<material=underline c=#FFFFFF h=2 event=terminology args=(109301)>「忍持」</material>施放奥义「真无合参·火」。对范围内敌人造成共计<color=#E78300>{3}</color>攻击力的火属性伤害；命中时对敌人附加火属性抗性降低<color=#E78300>{4}</color>，持续<color=#E78300>{5}</color>秒。",
		maxLv = 60,
		type = 1,
		id = 101093236,
		extra_param = "",
		param = {
			{
				175,
				4.512,
				true,
				"%"
			},
			{
				88,
				2.256,
				true,
				"%"
			},
			{
				1000,
				25.64,
				true,
				"%"
			},
			{
				30,
				0,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[101093305] = {
		description = "快速闪避敌人攻击，且可以连续施放二次闪避，极限闪避会触发闪避效果。\n闪避效果：进入零时空间使全场敌人动作大幅减速，持续<color=#E78300>3</color>秒；闪避效果每<color=#E78300>{1}</color>秒最多触发一次。\n\n自身或者队友触发零时空间时，获得<color=#E78300>15%</color>的奥义值，该效果每<color=#E78300>0.5</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101093305,
		extra_param = "",
		param = {
			{
				20,
				0,
				false,
				""
			}
		}
	},
	[101094101] = {
		description = "展开魔铳，对锁定的敌人进行连续射击，造成共计<color=#E78300>{1}</color>攻击力的暗属性伤害。\n\n<color=#297DE0>神能：</color>普通攻击命中后会获得神能。",
		maxLv = 60,
		type = 1,
		id = 101094101,
		extra_param = "",
		param = {
			{
				280,
				5.474,
				true,
				"%"
			}
		}
	},
	[101094201] = {
		description = "展开魔铳，对前方范围内的敌人进行扫射，造成共计<color=#E78300>{1}</color>攻击力的暗属性伤害。\n\n<color=#297DE0>神能：</color>每次施放命中后会获得<color=#E78300>{2}</color>点神能。",
		maxLv = 60,
		type = 1,
		id = 101094201,
		extra_param = "",
		param = {
			{
				350,
				8.967,
				true,
				"%"
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[101094202] = {
		description = "迟钝转变为魔炮形态，向锁定方向进行一次炮击，造成共计<color=#E78300>{1}</color>攻击力的暗属性伤害。\n\n<color=#297DE0>神能：</color>每次施放命中后会获得<color=#E78300>{2}</color>点神能。",
		maxLv = 60,
		type = 1,
		id = 101094202,
		extra_param = "",
		param = {
			{
				320,
				8.205,
				true,
				"%"
			},
			{
				15,
				0,
				false,
				""
			}
		}
	},
	[101094203] = {
		description = "迟钝转变为炮垒形态，可持续对瞄准方向进行炮击，每次炮击消耗<color=#E78300>20</color>点神能，造成共计<color=#E78300>{1}</color>攻击力的暗属性伤害，炮击神能消耗不受其他属性影响。\n在炮垒形态下免疫控制效果，禁用移动、技能和自身奥义，仅可进行左右旋转瞄准；自身受到的伤害降低<color=#E78300>20%</color>，每受到生命值上限<color=#E78300>1%</color>的伤害时会消耗<color=#E78300>1</color>点神能；当神能不足或点击取消时会退出炮垒形态。",
		maxLv = 60,
		type = 1,
		id = 101094203,
		extra_param = "",
		param = {
			{
				750,
				19.23,
				true,
				"%"
			}
		}
	},
	[101094209] = {
		description = "同时召唤多门魔炮向锁定方向射击，对区域内的敌人进行四次散布炮击，每次造成<color=#E78300>{1}</color>攻击力的暗属性伤害；施放时全队伍暗属性伤害提高<color=#E78300>{2}</color>，持续<color=#E78300>{3}</color>秒。\n\n自身或者队友触发零时空间时，获得<color=#E78300>15%</color>的奥义值，该效果每<color=#E78300>0.5</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101094209,
		extra_param = "",
		param = {
			{
				1000,
				25.641,
				true,
				"%"
			},
			{
				30,
				0,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[101094305] = {
		description = "快速闪避敌人攻击，极限闪避会触发闪避效果。\n闪避效果：进入零时空间使全场敌人动作大幅减速，持续<color=#E78300>2</color>秒；获得<color=#E78300>{1}</color>点神能；闪避效果每<color=#E78300>{2}</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101094305,
		extra_param = "",
		param = {
			{
				30,
				0,
				false,
				""
			},
			{
				20,
				0,
				false,
				""
			}
		}
	},
	[101095101] = {
		description = "造成共计<color=#E78300>{1}</color>攻击力的物理属性伤害。\n处于<material=underline c=#FFFFFF h=2 event=terminology args=(109501)>「牵丝」</material>状态时，造成共计<color=#E78300>{2}</color>攻击力的物理属性伤害。\n\n被动：\n<material=underline c=#FFFFFF h=2 event=terminology args=(109502)>「羽刃」</material>和<material=underline c=#FFFFFF h=2 event=terminology args=(109503)>「银丝」</material>标记最多共计拥有<color=#E78300>2</color>个。\n施放技能不会打断普通攻击的连段。\n不处于<material=underline c=#FFFFFF h=2 event=terminology args=(109501)>「牵丝」</material>状态时，施放普通攻击最后一段时，「刃舞」、「丝雨」会替换为「刀纱」、「缀影」，并重置「刀纱」、「缀影」的冷却时间，施放其中任意一个技能后「刀纱」、「缀影」会替换回「刃舞」、「丝雨」。\n处于<material=underline c=#FFFFFF h=2 event=terminology args=(109501)>「牵丝」</material>状态时，施放普通攻击最后一段时，「刀纱」、「缀影」会替换为「刻韵·刃」、「刻韵·丝」，施放其中任意一个技能后「刻韵·刃」、「刻韵·丝」会替换回「刀纱」、「缀影」。\n\n<color=#297DE0>能量：</color>不处于<material=underline c=#FFFFFF h=2 event=terminology args=(109501)>「牵丝」</material>状态时，每秒自动获得<color=#E78300>5</color>点能量。",
		maxLv = 60,
		type = 1,
		id = 101095101,
		extra_param = "",
		param = {
			{
				640,
				12.301,
				true,
				"%"
			},
			{
				960,
				18.504,
				true,
				"%"
			}
		}
	},
	[101095201] = {
		description = "造成共计<color=#E78300>{1}</color>攻击力的物理属性伤害。\n「刀纱」：造成共计<color=#E78300>{2}</color>攻击力的物理属性伤害，该技能有<color=#E78300>7</color>秒的冷却时间。\n施放该技能时，获得<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(109502)>「羽刃」</material>标记。\n施放「刃舞」、「刀纱」时有短暂的闪避，该闪避不会触发闪避效果，极限闪避敌人的攻击时获得<color=#E78300>15</color>点能量。",
		maxLv = 60,
		type = 1,
		id = 101095201,
		extra_param = "",
		param = {
			{
				400,
				10.256,
				true,
				"%"
			},
			{
				600,
				15.384,
				true,
				"%"
			}
		}
	},
	[101095202] = {
		description = "造成共计<color=#E78300>{1}</color>攻击力的物理属性伤害。\n「缀影」：造成共计<color=#E78300>{2}</color>攻击力的物理属性伤害，该技能有<color=#E78300>7</color>秒的冷却时间。\n施放该技能时，获得<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(109503)>「银丝」</material>标记。\n「丝雨」、「缀影」会对命中的敌人附加动作迟缓至<color=#E78300>75%</color>，持续<color=#E78300>{3}</color>秒。",
		maxLv = 60,
		type = 1,
		id = 101095202,
		extra_param = "",
		param = {
			{
				400,
				10.255,
				true,
				"%"
			},
			{
				600,
				15.38,
				true,
				"%"
			},
			{
				2,
				0,
				false,
				""
			}
		}
	},
	[101095203] = {
		description = "消耗<color=#E78300>2</color>个标记才可施放，根据当前的标记的种类和数量，消耗全部标记施放不同的攻击：\n「刻韵·刃」：<color=#E78300>2</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(109502)>「羽刃」</material>标记，造成共计<color=#E78300>{1}</color>攻击力的物理属性伤害；\n「刻韵·缀」：<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(109502)>「羽刃」</material>标记和<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(109503)>「银丝」</material>标记，造成共计<color=#E78300>{2}</color>攻击力的物理属性伤害，对命中的敌人附加动作迟缓至<color=#E78300>75%</color>，持续<color=#E78300>{6}</color>秒；\n「刻韵·丝」：<color=#E78300>2</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(109503)>「银丝」</material>标记，造成共计<color=#E78300>{3}</color>攻击力的物理属性伤害，对命中的敌人附加动作迟缓至<color=#E78300>25%</color>，持续<color=#E78300>{7}</color>秒。\n能量为满时，可以长按普通攻击施放技能「羽落」。\n「羽落」：对周围造成共计<color=#E78300>{4}</color>攻击力的物理属性伤害，消耗全部标记，进入<material=underline c=#FFFFFF h=2 event=terminology args=(109501)>「牵丝」</material>状态，重置「刀纱」、「缀影」的冷却时间；施放时攻击力提高<color=#E78300>5%</color>，能量上限每比<color=#E78300>100</color>点高<color=#E78300>1</color>点，攻击力额外提高<color=#E78300>0.5%</color>，持续至<material=underline c=#FFFFFF h=2 event=terminology args=(109501)>「牵丝」</material>状态结束，该效果提供的攻击力提高最高为<color=#E78300>20%</color>。当有消耗标记的<material=underline c=#FFFFFF h=2 event=terminology args=(109501)>「牵丝」</material>状态结束时，会返还消耗的标记。\n<material=underline c=#FFFFFF h=2 event=terminology args=(109501)>「牵丝」</material>：每<color=#E78300>0.1</color>秒失去<color=#E78300>1</color>点能量，能量为<color=#E78300>0</color>点时，退出<material=underline c=#FFFFFF h=2 event=terminology args=(109501)>「牵丝」</material>状态；状态期间内，「刃舞」、「丝雨」、「刻韵」会替换为「刀纱」、「缀影」、「囚网」，施放「刀纱」、「缀影」不会获得对应的标记。\n「囚网」：造成共计<color=#E78300>{5}</color>攻击力的物理属性伤害，该技能有<color=#E78300>12</color>秒的冷却时间，对范围内的敌人附加动作迟缓至<color=#E78300>0%</color>，持续<color=#E78300>3.5</color>秒。",
		maxLv = 60,
		type = 1,
		id = 101095203,
		extra_param = "",
		param = {
			{
				1200,
				30.76,
				true,
				"%"
			},
			{
				1000,
				25.64,
				true,
				"%"
			},
			{
				800,
				20.51,
				true,
				"%"
			},
			{
				600,
				15.38,
				true,
				"%"
			},
			{
				1000,
				25.64,
				true,
				"%"
			},
			{
				3,
				0,
				false,
				""
			},
			{
				3,
				0,
				false,
				""
			}
		}
	},
	[101095208] = {
		description = "狂狮·塞赫麦特与苍鹭·托特的连携奥义。\n狂狮·塞赫麦特造成<color=#E78300>{1}+{2}</color>×<color=#297DE0>自身奥义等级</color>攻击力的物理属性伤害；施放时全队伍获得<material=underline c=#FFFFFF h=2 event=terminology args=(101502)>「潜能解放」</material>，持续<color=#E78300>{5}</color>秒；恢复全队<color=#E78300>62%+2%</color>×<color=#297DE0>自身奥义等级</color>攻击力的生命值；命中时全队伍技能伤害提高<color=#E78300>{6}</color>，持续<color=#E78300>{7}</color>秒。\n苍鹭·托特造成<color=#E78300>{3}+{4}</color>×<color=#297DE0>自身奥义等级</color>攻击力的物理属性伤害；施放时全队伍全属性伤害提高<color=#E78300>{8}</color>，持续<color=#E78300>{9}</color>秒。",
		maxLv = 60,
		type = 1,
		id = 101095208,
		extra_param = "",
		param = {
			{
				1000,
				0,
				false,
				"%"
			},
			{
				25.641,
				0,
				false,
				"%"
			},
			{
				1200,
				0,
				false,
				"%"
			},
			{
				30.769,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			},
			{
				20,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			},
			{
				15,
				0,
				false,
				"%"
			},
			{
				15,
				0,
				false,
				""
			}
		}
	},
	[101095209] = {
		description = "造成共计<color=#E78300>{1}</color>攻击力的物理属性伤害；施放时自身独立伤害提高<color=#E78300>{2}</color>，持续<color=#E78300>{3}</color>秒；全队伍全属性伤害提高<color=#E78300>{4}</color>，持续<color=#E78300>{5}</color>秒。\n\n自身或者队友攻击造成会心后，获得<color=#E78300>3%</color>的奥义值，该效果每<color=#E78300>2</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101095209,
		extra_param = "",
		param = {
			{
				1200,
				30.765,
				true,
				"%"
			},
			{
				20,
				0,
				false,
				"%"
			},
			{
				25,
				0,
				false,
				""
			},
			{
				15,
				0,
				false,
				"%"
			},
			{
				15,
				0,
				false,
				""
			}
		}
	},
	[101095281] = {
		description = "苍鹭·托特与生魂·奥西里斯的连携奥义。\n苍鹭·托特造成<color=#E78300>{1}+{2}</color>×<color=#297DE0>自身奥义等级</color>攻击力的物理属性伤害；施放时全队伍全属性伤害提高<color=#E78300>{5}</color>，持续<color=#E78300>{6}</color>秒。\n生魂·奥西里斯造成<color=#E78300>{3}+{4}</color>×<color=#297DE0>自身奥义等级</color>攻击力的风属性伤害；自身进入<material=underline c=#FFFFFF h=2 event=terminology args=(111101)>「冥府审判模式」</material>，全队伍伤害提高<color=#E78300>20%+0.2%</color>×<color=#297DE0>自身奥义等级</color>，自身独立伤害提高<color=#E78300>{7}</color>，持续至<material=underline c=#FFFFFF h=2 event=terminology args=(111101)>「冥府审判模式」</material>结束；自身的生命移除状态不会使自身生命值降低至<color=#E78300>1</color>以下。",
		maxLv = 60,
		type = 1,
		id = 101095281,
		extra_param = "",
		param = {
			{
				1440,
				72,
				true,
				"%"
			},
			{
				36.923,
				1.846,
				true,
				"%"
			},
			{
				1000,
				50,
				true,
				"%"
			},
			{
				25.641,
				1.282,
				true,
				"%"
			},
			{
				15,
				0,
				false,
				"%"
			},
			{
				15,
				0,
				false,
				""
			},
			{
				20,
				0,
				false,
				"%"
			}
		}
	},
	[101095305] = {
		description = "快速闪避敌人攻击，闪避不会打断普通攻击的连段，极限闪避会触发闪避效果。\n闪避效果：极限闪避后<color=#E78300>3</color>秒内点击普通攻击，会施放技能攻击「幻丝」；不处于<material=underline c=#FFFFFF h=2 event=terminology args=(109501)>「牵丝」</material>状态时，「刃舞」、「丝雨」会替换为「刀纱」、「缀影」，重置「刀纱」、「缀影」的冷却时间；处于<material=underline c=#FFFFFF h=2 event=terminology args=(109501)>「牵丝」</material>状态时，「刀纱」、「缀影」会替换为「刻韵·刃」、「刻韵·丝」；闪避效果每<color=#E78300>{3}</color>秒最多触发一次。\n「幻丝」：瞬移到锁定的敌人身后，造成共计<color=#E78300>{1}</color>攻击力的物理属性伤害，施放时对锁定的敌人附加动作迟缓至<color=#E78300>50%</color>，持续<color=#E78300>{2}</color>秒。",
		maxLv = 60,
		type = 1,
		id = 101095305,
		extra_param = "",
		param = {
			{
				300,
				7.688,
				true,
				"%"
			},
			{
				1.5,
				0,
				false,
				""
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[101096101] = {
		description = "对锁定的敌人进行连续攻击，造成共计<color=#E78300>{1}</color>攻击力的风属性伤害。\n\n被动：\n自身移动时速度会不断加快，直至开启<material=underline c=#FFFFFF h=2 event=terminology args=(109601)>「矢量加速」</material>。\n\n<color=#297DE0>怒气：</color>普通攻击命中后会获得怒气。",
		maxLv = 60,
		type = 1,
		id = 101096101,
		extra_param = "",
		param = {
			{
				272,
				5.285,
				true,
				"%"
			}
		}
	},
	[101096201] = {
		description = "对锁定的敌人使用两段踢击，造成共计<color=#E78300>{1}</color>攻击力的风属性伤害，最后一段攻击命中后对锁定的敌人附加<material=underline c=#FFFFFF h=2 event=terminology args=(109602)>「逐风标记」</material>。\n<material=underline c=#FFFFFF h=2 event=terminology args=(109602)>「逐风标记」</material>：持续<color=#E78300>10</color>秒，自身从顺风方位攻击处于<material=underline c=#FFFFFF h=2 event=terminology args=(109602)>「逐风标记」</material>状态的敌人时，命中瞬间伤害提高<color=#E78300>{2}</color>。",
		maxLv = 60,
		type = 1,
		id = 101096201,
		extra_param = "",
		param = {
			{
				400,
				10.255,
				true,
				"%"
			},
			{
				25,
				0,
				false,
				"%"
			}
		}
	},
	[101096202] = {
		description = "快速位移一段距离。\n移动时长按「风驰迹掣」可额外消耗<color=#E78300>5</color>点怒气直接进入<material=underline c=#FFFFFF h=2 event=terminology args=(109601)>「矢量加速」</material>状态。\n处于<material=underline c=#FFFFFF h=2 event=terminology args=(109601)>「矢量加速」</material>状态时，可消耗<color=#E78300>5</color>点怒气施放一次追加攻击。\n追加攻击：在矢量加速过程中对锁定方向释放强力飞踢，造成共计<color=#E78300>{1}</color>攻击力的风属性伤害，该技能有<color=#E78300>5</color>秒的冷却时间。",
		maxLv = 60,
		type = 1,
		id = 101096202,
		extra_param = "",
		param = {
			{
				200,
				5.128,
				true,
				"%"
			}
		}
	},
	[101096203] = {
		description = "快速机动并连续攻击敌人，造成共计<color=#E78300>{1}</color>攻击力的风属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101096203,
		extra_param = "",
		param = {
			{
				800,
				20.512,
				true,
				"%"
			}
		}
	},
	[101096208] = {
		description = "黎幻·赫拉与风行·赫尔墨斯的连携奥义。\n黎幻·赫拉造成<color=#E78300>{1}+{2}</color>×<color=#297DE0>自身奥义等级</color>攻击力的光属性伤害；全队伍伤害提高<color=#E78300>14%+0.4%</color>×<color=#297DE0>自身奥义等级</color>，持续<color=#E78300>{5}</color>秒，<color=#E78300>12</color>秒内返还全队伍下一次消耗的所有机制值。\n风行·赫尔墨斯造成<color=#E78300>{3}+{4}</color>×<color=#297DE0>自身奥义等级</color>攻击力的风属性伤害；命中时对敌人附加风属性抗性降低<color=#E78300>{6}</color>，持续<color=#E78300>{7}</color>秒，并附加<material=underline c=#FFFFFF h=2 event=terminology args=(109602)>「逐风标记」</material>。",
		maxLv = 60,
		type = 1,
		id = 101096208,
		extra_param = "",
		param = {
			{
				1000,
				0,
				false,
				"%"
			},
			{
				25.641,
				0,
				false,
				"%"
			},
			{
				600,
				0,
				false,
				"%"
			},
			{
				15.385,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			},
			{
				30,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			}
		}
	},
	[101096209] = {
		description = "借助权钥的力量冲刺，到达目标时掀起风暴，造成共计<color=#E78300>{1}</color>攻击力的风属性伤害；命中时对敌人附加风属性抗性降低<color=#E78300>{2}</color>，持续<color=#E78300>{3}</color>秒，最后一次攻击命中后对锁定的敌人附加<material=underline c=#FFFFFF h=2 event=terminology args=(109602)>「逐风标记」</material>。\n\n自身或者队友的普通攻击造成会心后，获得<color=#E78300>2%</color>的奥义值，该效果每<color=#E78300>2</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101096209,
		extra_param = "",
		param = {
			{
				500,
				12.816,
				true,
				"%"
			},
			{
				30,
				0,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[101096305] = {
		description = "快速闪避敌人攻击，极限闪避会触发闪避效果。\n闪避效果：进入零时空间使全场敌人动作大幅减速，持续<color=#E78300>2</color>秒；闪避效果每<color=#E78300>{1}</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101096305,
		extra_param = "",
		param = {
			{
				15,
				0,
				false,
				""
			}
		}
	},
	[101097101] = {
		description = "对锁定的敌人发射虹光，造成共计<color=#E78300>{1}</color>攻击力的光属性伤害。\n\n<color=#297DE0>能量：</color>每秒自动获得<color=#E78300>4</color>点能量。",
		maxLv = 60,
		type = 1,
		id = 101097101,
		extra_param = "",
		param = {
			{
				225,
				4.323,
				true,
				"%"
			}
		}
	},
	[101097201] = {
		description = "向前抛出小羊，小羊弹跳时对敌人造成共计<color=#E78300>{1}</color>攻击力的光属性伤害，命中处在领域内的敌人时，会对命中的敌人附加禁锢状态，持续<color=#E78300>{2}</color>秒。",
		maxLv = 60,
		type = 1,
		id = 101097201,
		extra_param = "",
		param = {
			{
				500,
				12.82,
				true,
				"%"
			},
			{
				5,
				0,
				false,
				""
			}
		}
	},
	[101097202] = {
		description = "生成一片<material=underline c=#FFFFFF h=2 event=terminology args=(109701)>「绘梦领域」</material>，持续<color=#E78300>15</color>秒。在<material=underline c=#FFFFFF h=2 event=terminology args=(109701)>「绘梦领域」</material>内所有友方受到的伤害降低<color=#E78300>{1}</color>。",
		maxLv = 60,
		type = 1,
		id = 101097202,
		extra_param = "",
		param = {
			{
				12.2,
				0.2,
				true,
				"%"
			}
		}
	},
	[101097203] = {
		description = "进入梦游状态并生成一个泡梦。梦游状态期间，可缓慢移动，每<color=#E78300>1</color>秒为处在技能二生成的领域内所有友方恢复自身<color=#E78300>{1}</color>攻击力的生命值。自身停止蓄力、受击时或蓄力时间达到上限时，泡梦会破碎并对周围的敌人造成共计<color=#E78300>{2}</color>攻击力的光属性伤害。可通过长按进行最多<color=#E78300>2</color>段蓄力，每段蓄力泡梦的命中瞬间蓄力技能伤害提高<color=#E78300>50%</color>。",
		maxLv = 60,
		type = 1,
		id = 101097203,
		extra_param = "",
		param = {
			{
				3.2,
				0.2,
				true,
				"%"
			},
			{
				700,
				17.948,
				true,
				"%"
			}
		}
	},
	[101097209] = {
		description = "高高抛起小羊，小羊变大后向目标砸落并膨胀爆炸，对范围内的敌人造成共计<color=#E78300>{1}</color>的光属性伤害；对命中的敌人附加禁锢状态，持续<color=#E78300>{2}</color>秒。\n\n自身或者队友施放奥义时，获得<color=#E78300>20%</color>的奥义值。",
		maxLv = 60,
		type = 1,
		id = 101097209,
		extra_param = "",
		param = {
			{
				500,
				12.82,
				true,
				"%"
			},
			{
				5,
				0,
				false,
				""
			}
		}
	},
	[101097221] = {
		description = "生成一片<material=underline c=#FFFFFF h=2 event=terminology args=(109702)>「幽梦领域」</material>，持续<color=#E78300>15</color>秒。在<material=underline c=#FFFFFF h=2 event=terminology args=(109702)>「幽梦领域」</material>持续期间，所有友方受到的伤害降低<color=#E78300>{1}</color>；对命中的敌人附加<material=underline c=#FFFFFF h=2 event=terminology args=(109703)>「幽梦」</material>状态。\n<material=underline c=#FFFFFF h=2 event=terminology args=(109703)>「幽梦」</material>：每<color=#E78300>1</color>秒附加暗属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101097221,
		extra_param = "",
		param = {
			{
				18.3,
				0.3,
				true,
				"%"
			}
		}
	},
	[101097305] = {
		description = "快速闪避敌人攻击，极限闪避会触发闪避效果。\n闪避效果：进入零时空间使全场敌人动作大幅减速，持续<color=#E78300>3</color>秒；对攻击者及其周围的敌人造成<color=#E78300>{1}</color>攻击力的光属性伤害；闪避效果每<color=#E78300>{2}</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101097305,
		extra_param = "",
		param = {
			{
				240,
				6.153,
				true,
				"%"
			},
			{
				20,
				0,
				false,
				""
			}
		}
	},
	[101099101] = {
		description = "连续挥动朔斩击敌人，造成共计<color=#E78300>{1}</color>攻击力的暗属性伤害。\n\n<color=#297DE0>神能：</color>普通攻击命中后会获得神能。",
		maxLv = 60,
		type = 1,
		id = 101099101,
		extra_param = "",
		param = {
			{
				174,
				3.385,
				true,
				"%"
			}
		}
	},
	[101099201] = {
		description = "连续斩击后掷出朔攻击敌人，造成共计<color=#E78300>{1}</color>攻击力的暗属性伤害。\n\n<color=#297DE0>神能：</color>每次命中后都会获得<color=#E78300>{2}</color>点神能。",
		maxLv = 60,
		type = 1,
		id = 101099201,
		extra_param = "",
		param = {
			{
				148,
				3.843,
				true,
				"%"
			},
			{
				7,
				0,
				false,
				""
			}
		}
	},
	[101099202] = {
		description = "当神能为满时，「朔·月蚀」改变为「望·月蚀」，施放「望·月蚀」会消耗全部神能。\n「朔·月蚀」：向前突进，对敌人造成共计<color=#E78300>{1}</color>攻击力的暗属性伤害。\n「望·月蚀」：施放<material=underline c=#FFFFFF h=2 event=terminology args=(109901)>「望」</material>造成共计<color=#E78300>{2}</color>攻击力的暗属性伤害，对命中的敌人附加受创状态，持续<color=#E78300>{4}</color>秒。\n受创：每<color=#E78300>3</color>秒附加<color=#E78300>{3}</color>攻击力的暗属性伤害，持续<color=#E78300>{4}</color>秒。",
		maxLv = 60,
		type = 1,
		id = 101099202,
		extra_param = "",
		param = {
			{
				200,
				5.127,
				true,
				"%"
			},
			{
				250,
				6.41,
				true,
				"%"
			},
			{
				40,
				1,
				true,
				"%"
			},
			{
				16,
				0,
				false,
				""
			}
		}
	},
	[101099203] = {
		description = "当神能为满时，「朔·月夜见」改变为「望·月夜见」，施放「望·月夜见」会消耗全部神能。\n「朔·月夜见」：连续点击施放居合术攻击敌人及其周围处于受创状态的敌人，每次造成<color=#E78300>{1}</color>攻击力的暗属性伤害，最后一次造成<color=#E78300>{2}</color>攻击力的暗属性伤害。\n「望·月夜见」：蓄力施放<material=underline c=#FFFFFF h=2 event=terminology args=(109901)>「望」</material>击出一道刀光，造成共计<color=#E78300>{3}</color>攻击力的暗属性伤害。可通过长按进行最多<color=#E78300>3</color>段蓄力，每段蓄力该技能命中瞬间蓄力技能伤害提高<color=#E78300>30%</color>。",
		maxLv = 60,
		type = 1,
		id = 101099203,
		extra_param = "",
		param = {
			{
				46,
				1.192,
				true,
				"%"
			},
			{
				77,
				1.987,
				true,
				"%"
			},
			{
				460,
				11.794,
				true,
				"%"
			}
		}
	},
	[101099209] = {
		description = "斩击前方目标，造成共计<color=#E78300>{1}</color>攻击力的暗属性伤害；对命中的敌人附加受创状态，持续<color=#E78300>{2}</color>秒，每命中敌人<color=#E78300>1</color>次全队伍获得<color=#E78300>30</color>点神能。\n受创：每<color=#E78300>3</color>秒附加<color=#E78300>{3}</color>攻击力的暗属性伤害，持续<color=#E78300>{2}</color>秒。\n\n当敌人被附加受创状态时，获得<color=#E78300>8%</color>的奥义值，该效果每<color=#E78300>2</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101099209,
		extra_param = "",
		param = {
			{
				360,
				9.23,
				true,
				"%"
			},
			{
				10,
				0,
				false,
				""
			},
			{
				80,
				2,
				true,
				"%"
			}
		}
	},
	[101099231] = {
		description = "当神能为满时，重置「朔望·末月」的冷却时间，「朔·末月」改变为「望·末月」，施放「望·末月」会消耗全部神能。\n「朔·末月」：连续点击施放居合术攻击敌人及其周围处于受创状态的敌人，每次造成<color=#E78300>{1}</color>攻击力的暗属性伤害，最后一次造成<color=#E78300>{2}</color>攻击力的暗属性伤害。\n「望·末月」：蓄力施放<material=underline c=#FFFFFF h=2 event=terminology args=(109901)>「望」</material>击出三道刀光，主刀光造成共计<color=#E78300>{3}</color>攻击力的暗属性伤害，每个副刀光造成共计<color=#E78300>{4}</color>攻击力的暗属性伤害。可通过长按进行最多<color=#E78300>3</color>段蓄力，每段蓄力该技能命中瞬间蓄力技能伤害提高<color=#E78300>30%</color>。",
		maxLv = 60,
		type = 1,
		id = 101099231,
		extra_param = "",
		param = {
			{
				46,
				1.192,
				true,
				"%"
			},
			{
				77,
				1.987,
				true,
				"%"
			},
			{
				460,
				11.794,
				true,
				"%"
			},
			{
				180,
				4.615,
				true,
				"%"
			}
		}
	},
	[101099305] = {
		description = "快速闪避敌人攻击，极限闪避会触发闪避效果。\n闪避效果：进入零时空间使全场敌人动作大幅减速，持续<color=#E78300>3</color>秒；闪避效果每<color=#E78300>{1}</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101099305,
		extra_param = "",
		param = {
			{
				20,
				0,
				false,
				""
			}
		}
	},
	[101111101] = {
		description = "召唤镰刀连续斩击敌人，造成共计<color=#E78300>{1}</color>攻击力的风属性伤害。\n<material=underline c=#FFFFFF h=2 event=terminology args=(111101)>「冥府审判模式」</material>：施放剑翼对锁定的敌人进行切割，造成<color=#E78300>{2}</color>攻击力的风属性伤害。\n\n<color=#297DE0>印记：</color>普通攻击第三段和五段命中后，各获得<color=#E78300>1</color>个印记。<material=underline c=#FFFFFF h=2 event=terminology args=(111101)>「冥府审判模式」</material>普通攻击第四段命中后，获得<color=#E78300>1</color>个印记。",
		maxLv = 60,
		type = 1,
		id = 101111101,
		extra_param = "",
		param = {
			{
				343,
				6.677,
				true,
				"%"
			},
			{
				340,
				6.535,
				true,
				"%"
			}
		}
	},
	[101111201] = {
		description = "掷出镰刀，对锁定方向的敌人造成共计<color=#E78300>{1}</color>攻击力的风属性伤害。\n<material=underline c=#FFFFFF h=2 event=terminology args=(111101)>「冥府审判模式」</material>：发射剑翼，造成共计<color=#E78300>{2}</color>攻击力的风属性伤害。\n施放「幽岚羽刃」后，可消耗<color=#E78300>2</color>个印记额外施放一次，该次施放不会获得印记。\n\n<color=#297DE0>印记：</color>每次施放命中后，不同模式下都可以获得<color=#E78300>2</color>个印记。",
		maxLv = 60,
		type = 1,
		id = 101111201,
		extra_param = "",
		param = {
			{
				287,
				7.433,
				true,
				"%"
			},
			{
				480,
				12.304,
				true,
				"%"
			}
		}
	},
	[101111202] = {
		description = "旋转镰刀对周围敌人进行，造成共计<color=#E78300>{1}</color>攻击力的风属性伤害。\n<material=underline c=#FFFFFF h=2 event=terminology args=(111101)>「冥府审判模式」</material>：召唤环绕自身的剑翼，对剑翼路径上的敌人进行<color=#E78300>26</color>次攻击，每次造成<color=#E78300>{2}</color>攻击力的风属性伤害，持续<color=#E78300>6</color>秒。",
		maxLv = 60,
		type = 1,
		id = 101111202,
		extra_param = "",
		param = {
			{
				500,
				12.818,
				true,
				"%"
			},
			{
				30,
				0.769,
				true,
				"%"
			}
		}
	},
	[101111203] = {
		description = "挥舞镰刀进行一次上挑攻击，造成共计<color=#E78300>{1}</color>攻击力的风属性伤害。\n<material=underline c=#FFFFFF h=2 event=terminology args=(111101)>「冥府审判模式」</material>：在前方聚集敌人，造成共计<color=#E78300>{2}</color>攻击力的风属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101111203,
		extra_param = "",
		param = {
			{
				660,
				16.923,
				true,
				"%"
			},
			{
				1000,
				25.641,
				true,
				"%"
			}
		}
	},
	[101111209] = {
		description = "短暂解开灵魂束缚进入<material=underline c=#FFFFFF h=2 event=terminology args=(111101)>「冥府审判模式」</material>，自身生命值恢复至满值。\n<material=underline c=#FFFFFF h=2 event=terminology args=(111101)>「冥府审判模式」</material>：改变「空冥镰斩」、「幽岚羽刃」、「永劫轮舞」、「终灵凋落」的攻击模式。全队伍伤害提高<color=#E78300>{1}</color>，持续至<material=underline c=#FFFFFF h=2 event=terminology args=(111101)>「冥府审判模式」</material>结束。自身获得霸体效果和每秒<color=#E78300>7%</color>生命值上限的生命移除状态，当生命值为<color=#E78300>0</color>时退出<material=underline c=#FFFFFF h=2 event=terminology args=(111101)>「冥府审判模式」</material>，恢复至原本状态。\n退出<material=underline c=#FFFFFF h=2 event=terminology args=(111101)>「冥府审判模式」</material>后，恢复与自身预组合连携奥义的修正者相等的奥义值；无预组合连携奥义的修正者时，<material=underline c=#FFFFFF h=2 event=terminology args=(111101)>「冥府审判模式」</material>时也可恢复奥义值。\n出场时，自身和与自身预组合连携奥义的修正者恢复<color=#E78300>35%</color>的奥义值。\n\n当敌人被附加虚弱状态并且自身不处于<material=underline c=#FFFFFF h=2 event=terminology args=(111101)>「冥府审判模式」</material>时，获得<color=#E78300>8%</color>的奥义值，该效果每<color=#E78300>2</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101111209,
		extra_param = "",
		param = {
			{
				10.2,
				0.2,
				true,
				"%"
			}
		}
	},
	[101111305] = {
		description = "快速闪避敌人攻击，极限闪避会触发闪避效果。不处于<material=underline c=#FFFFFF h=2 event=terminology args=(111101)>「冥府审判模式」</material>时，闪避会对周围敌人进行攻击，造成<color=#E78300>{3}</color>攻击力的风属性伤害。\n闪避效果：进入零时空间使全场敌人动作大幅减速，持续<color=#E78300>2</color>秒；对攻击者附加虚弱状态，攻击力降低<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒；闪避效果每<color=#E78300>{4}</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101111305,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			},
			{
				3,
				0,
				false,
				""
			},
			{
				240,
				6.153,
				true,
				"%"
			},
			{
				14,
				0,
				false,
				""
			}
		}
	},
	[101119101] = {
		description = "连续舞动双枪攻击敌人，造成共计<color=#E78300>{1}</color>攻击力的雷属性伤害。\n\n被动：\n自身每有<color=#E78300>1%</color>风属性伤害提高，雷属性伤害提高<color=#E78300>0.7%</color>。\n<material=underline c=#FFFFFF h=2 event=terminology args=(111903)>「雷引」</material>和<material=underline c=#FFFFFF h=2 event=terminology args=(111904)>「惊岚」</material>标记最多共计拥有<color=#E78300>6</color>个。\n\n<color=#297DE0>怒气：</color>普通攻击命中后会获得怒气。",
		maxLv = 60,
		type = 1,
		id = 101119101,
		extra_param = "",
		param = {
			{
				232,
				4.562,
				true,
				"%"
			}
		}
	},
	[101119201] = {
		description = "挥舞长枪，造成共计<color=#E78300>{1}</color>攻击力的雷属性伤害，在<material=underline c=#FFFFFF h=2 event=terminology args=(111901)>「进攻姿态」</material>和<material=underline c=#FFFFFF h=2 event=terminology args=(111902)>「防御姿态」</material>之间进行切换；处于<material=underline c=#FFFFFF h=2 event=terminology args=(111902)>「防御姿态」</material>期间获得硬直效果。\n无论「风雷易势」是否处于冷却、是否替换为「风雷流转」，在施放「雷鸣风啸」、「奔雷疾风」、「风雷流转」或者追击、反击过程中可以点击该技能进行姿态切换，消耗最多<color=#E78300>7</color>点怒气，不会打断当前动作也不会造成伤害。\n施放「雷鸣风啸」、「奔雷疾风」过程中受击时，若处于<material=underline c=#FFFFFF h=2 event=terminology args=(111902)>「防御姿态」</material>，会格挡当前的伤害并触发反击，消耗最多<color=#E78300>15</color>点怒气，反击造成共计<color=#E78300>{2}</color>攻击力的雷属性伤害，施放反击时获得无敌效果，每次施放命中后获得<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(111904)>「惊岚」</material>标记。\n当标记为满时，「风雷易势」会替换为「风雷流转」，<material=underline c=#FFFFFF h=2 event=terminology args=(111901)>「进攻姿态」</material>和<material=underline c=#FFFFFF h=2 event=terminology args=(111902)>「防御姿态」</material>的「风雷流转」分别有<color=#E78300>15</color>秒的冷却时间。\n「风雷流转」：造成共计<color=#E78300>{3}</color>攻击力的雷属性伤害，施放后消耗全部标记。",
		maxLv = 60,
		type = 1,
		id = 101119201,
		extra_param = "",
		param = {
			{
				360,
				9.227,
				true,
				"%"
			},
			{
				1200,
				30.768,
				true,
				"%"
			},
			{
				1500,
				38.46,
				true,
				"%"
			}
		}
	},
	[101119202] = {
		description = "挥舞双枪向前突进，随后向敌人发动猛烈的连续突刺，造成共计<color=#E78300>{1}</color>攻击力的雷属性伤害。处于<material=underline c=#FFFFFF h=2 event=terminology args=(111901)>「进攻姿态」</material>命中时会开启一次追击，之后若切换成<material=underline c=#FFFFFF h=2 event=terminology args=(111902)>「防御姿态」</material>则会关闭追击，追击造成共计<color=#E78300>{2}</color>攻击力的雷属性伤害，每次施放命中后获得<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(111903)>「雷引」</material>标记。",
		maxLv = 60,
		type = 1,
		id = 101119202,
		extra_param = "",
		param = {
			{
				447,
				11.534,
				true,
				"%"
			},
			{
				560,
				14.352,
				true,
				"%"
			}
		}
	},
	[101119203] = {
		description = "赋予双枪雷电神力后进行大范围的挥舞攻击，随后双枪幻化为十几道带有雷电神力的幻影，从上方落下打击敌人，造成共计<color=#E78300>{1}</color>攻击力的雷属性伤害。处于<material=underline c=#FFFFFF h=2 event=terminology args=(111901)>「进攻姿态」</material>命中时会开启一次追击，之后若切换成<material=underline c=#FFFFFF h=2 event=terminology args=(111902)>「防御姿态」</material>则会关闭追击，追击造成共计<color=#E78300>{2}</color>攻击力的雷属性伤害，每次施放命中后获得<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(111903)>「雷引」</material>标记。",
		maxLv = 60,
		type = 1,
		id = 101119203,
		extra_param = "",
		param = {
			{
				450,
				11.536,
				true,
				"%"
			},
			{
				560,
				14.352,
				true,
				"%"
			}
		}
	},
	[101119208] = {
		description = "流萤岚雾·休与旧誓·薇儿丹蒂的连携奥义。\n流萤岚雾·休造成<color=#E78300>{1}+{2}</color>×<color=#297DE0>自身奥义等级</color>攻击力的雷属性伤害；命中后全队伍机制值获得率提高<color=#E78300>{5}</color>，持续<color=#E78300>{6}</color>秒，普通攻击每命中敌人<color=#E78300>1</color>次，会心伤害提高<color=#E78300>25%</color>，最多可叠加<color=#E78300>3</color>层，机制值获得率提高的加成效果结束时会心伤害加成效果移除。\n旧誓·薇儿丹蒂造成<color=#E78300>{3}+{4}</color>×<color=#297DE0>自身奥义等级</color>攻击力的雷属性伤害；命中后全队伍获得<color=#E78300>15%</color>的奥义值",
		maxLv = 60,
		type = 1,
		id = 101119208,
		extra_param = "",
		param = {
			{
				1000,
				50,
				true,
				"%"
			},
			{
				25.641,
				1.282,
				true,
				"%"
			},
			{
				500,
				25,
				true,
				"%"
			},
			{
				12.821,
				0.641,
				true,
				"%"
			},
			{
				25,
				0,
				false,
				"%"
			},
			{
				20,
				0,
				false,
				""
			}
		}
	},
	[101119209] = {
		description = "造成共计<color=#E78300>{1}</color>攻击力的雷属性伤害；命中后全队伍机制值获得率提高<color=#E78300>{2}</color>，持续<color=#E78300>16</color>秒，普通攻击每命中敌人<color=#E78300>1</color>次，会心伤害提高<color=#E78300>20%</color>，最多可叠加<color=#E78300>3</color>层，机制值获得率提高的加成效果结束时会心伤害加成效果移除。\n\n自身或者队友消耗机制值时，获得<color=#E78300>8%</color>的奥义值，该效果每<color=#E78300>2</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101119209,
		extra_param = "",
		param = {
			{
				1000,
				25.641,
				true,
				"%"
			},
			{
				20,
				0,
				false,
				"%"
			}
		}
	},
	[101119305] = {
		description = "快速闪避敌人攻击，极限闪避会触发闪避效果。\n闪避效果：获得<color=#E78300>25</color>点怒气；闪避效果每<color=#E78300>{1}</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101119305,
		extra_param = "",
		param = {
			{
				14,
				0,
				false,
				""
			}
		}
	},
	[101127101] = {
		description = "挥舞逆潮鲸歌，与海兽眷属协同进攻敌人，造成共计<color=#E78300>{1}</color>攻击力的水属性伤害。\n\n<color=#297DE0>印记：</color>普通攻击每命中<color=#E78300>15</color>次后，获得<color=#E78300>1</color>个印记。",
		maxLv = 60,
		type = 1,
		id = 101127101,
		extra_param = "",
		param = {
			{
				365,
				7.081,
				true,
				"%"
			}
		}
	},
	[101127201] = {
		description = "向前挥出一道奔涌的海流，随后召唤出海兽眷属从海流末端跃出突袭，造成共计<color=#E78300>{1}</color>攻击力的水属性伤害。施放时获得<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(112701)>「逆潮」</material>标记，<material=underline c=#FFFFFF h=2 event=terminology args=(112701)>「逆潮」</material>标记最多拥有<color=#E78300>1</color>个；「海兽跃袭」每命中敌人<color=#E78300>1</color>次，治疗效果提高<color=#E78300>5%</color>，最多可叠加<color=#E78300>4</color>层；自身每有<color=#E78300>1%</color>治疗效果提高，「海兽跃袭」命中瞬间伤害提高<color=#E78300>1.25%</color>，该效果提供的伤害提高最高为<color=#E78300>100%</color>。\n<material=underline c=#FFFFFF h=2 event=terminology args=(112701)>「逆潮」</material>标记被消耗后，加成效果会额外持续<color=#E78300>1</color>秒，之后移除，额外持续时间内的加成效果不计入原本的叠加层数。\n\n<color=#297DE0>印记：</color>每次施放命中后，获得<color=#E78300>1</color>个印记。",
		maxLv = 60,
		type = 1,
		id = 101127201,
		extra_param = "",
		param = {
			{
				600,
				15.381,
				true,
				"%"
			}
		}
	},
	[101127202] = {
		description = "展开权钥在原地召唤两只海兽眷属，海兽眷属存续期间，造成共计<color=#E78300>{1}</color>攻击力的水属性范围伤害。施放时获得<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(112702)>「鲸歌」</material>标记，<material=underline c=#FFFFFF h=2 event=terminology args=(112702)>「鲸歌」</material>标记最多拥有<color=#E78300>1</color>个；「鲸歌唤潮」每命中敌人<color=#E78300>1</color>次，会心伤害提高<color=#E78300>10%</color>，最多可叠加<color=#E78300>6</color>层；自身每有<color=#E78300>1%</color>会心伤害提高，「鲸歌唤潮」命中瞬间伤害提高<color=#E78300>0.8%</color>，该效果提供的伤害提高最高为<color=#E78300>100%</color>。\n<material=underline c=#FFFFFF h=2 event=terminology args=(112702)>「鲸歌」</material>标记被消耗后，加成效果会额外持续<color=#E78300>1</color>秒，之后移除，额外持续时间内的加成效果不计入原本的叠加层数。\n\n<color=#297DE0>印记：</color>每次施放命中后，获得<color=#E78300>1</color>个印记。",
		maxLv = 60,
		type = 1,
		id = 101127202,
		extra_param = "",
		param = {
			{
				800,
				20.51,
				true,
				"%"
			}
		}
	},
	[101127203] = {
		description = "印记不满<color=#E78300>4</color>个时，点击施放可获得<color=#E78300>1</color>个印记。自身印记为满<color=#E78300>4</color>个时，「暗潮之力」会替换为「深海愈疗」。\n「深海愈疗」：解放权钥的力量展开愈疗之环，消耗<color=#E78300>4</color>个印记，恢复附近所有友方自身<color=#E78300>{1}</color>的攻击力的生命值；「深海愈疗」有<color=#E78300>3</color>秒的冷却时间。施放「深海愈疗」时会消耗全部标记，获得额外的技能效果。\n消耗<material=underline c=#FFFFFF h=2 event=terminology args=(112701)>「逆潮」</material>标记时，对锁定的敌人造成共计<color=#E78300>{2}</color>攻击力的水属性伤害，自身每有<color=#E78300>1%</color>治疗效果提高，该次攻击命中瞬间伤害提高<color=#E78300>1.25%</color>，该效果提供的伤害提高最高为<color=#E78300>100%</color>。\n消耗<material=underline c=#FFFFFF h=2 event=terminology args=(112702)>「鲸歌」</material>标记时，附近所有友方受到的伤害降低，自身每有<color=#E78300>1%</color>会心伤害提高，受到的伤害降低提高<color=#E78300>0.12%</color>，该效果提供的受到的伤害降低最高为<color=#E78300>15%</color>，持续<color=#E78300>{3}</color>秒。",
		maxLv = 60,
		type = 1,
		id = 101127203,
		extra_param = "",
		param = {
			{
				28.7,
				0.7,
				true,
				"%"
			},
			{
				750,
				19.23,
				true,
				"%"
			},
			{
				8,
				0,
				false,
				""
			}
		}
	},
	[101127209] = {
		description = "与海兽眷属心意相通，召唤海洋的力量守护身边的人，施放时全队伍受到的伤害降低<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒，<color=#E78300>8</color>秒内获得以下效果：下一次施放「深海愈疗」后会获得<color=#E78300>4</color>个印记，「深海愈疗」施放时剩余冷却时间缩短<color=#E78300>100%</color>。\n\n自身或者队友受到治疗时，获得<color=#E78300>4%</color>的奥义值，该效果每<color=#E78300>2</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101127209,
		extra_param = "",
		param = {
			{
				13.3,
				0.3,
				true,
				"%"
			},
			{
				8,
				0,
				false,
				""
			}
		}
	},
	[101127305] = {
		description = "利用粒子成像迷惑敌人攻击，且可以连续施放二次闪避，极限闪避会触发闪避效果。\n闪避效果：进入零时空间使全场敌人动作大幅减速，持续<color=#E78300>3</color>秒；闪避效果每<color=#E78300>{1}</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101127305,
		extra_param = "",
		param = {
			{
				20,
				0,
				false,
				""
			}
		}
	},
	[101132101] = {
		description = "处于<material=underline c=#FFFFFF h=2 event=terminology args=(113201)>「燃剑姿态」</material>：连续挥舞长剑进行强力的斩击，造成共计<color=#E78300>{1}</color>攻击力的火属性伤害。\n处于<material=underline c=#FFFFFF h=2 event=terminology args=(113202)>「炽甲姿态」</material>：使用拳甲进行快速而连续的攻击，造成共计<color=#E78300>{2}</color>攻击力的火属性伤害。\n\n<color=#297DE0>怒气：</color>普通攻击命中后会获得怒气。",
		maxLv = 60,
		type = 1,
		id = 101132101,
		extra_param = "",
		param = {
			{
				318,
				6.126,
				true,
				"%"
			},
			{
				349,
				6.776,
				true,
				"%"
			}
		}
	},
	[101132201] = {
		description = "处于<material=underline c=#FFFFFF h=2 event=terminology args=(113201)>「燃剑姿态」</material>：挥舞长剑向前方斩击，造成共计<color=#E78300>{1}</color>攻击力的火属性伤害，对命中的敌人附加眩晕状态，持续<color=#E78300>{2}</color>秒。\n处于<material=underline c=#FFFFFF h=2 event=terminology args=(113202)>「炽甲姿态」</material>：向前突进，使用拳甲重击前方的敌人，消耗<color=#E78300>20</color>点怒气，造成共计<color=#E78300>{3}</color>攻击力的火属性伤害，命中时对敌人附加火属性抗性降低<color=#E78300>{4}</color>，持续<color=#E78300>{5}</color>秒；该技能有<color=#E78300>6</color>秒的冷却时间。",
		maxLv = 60,
		type = 1,
		id = 101132201,
		extra_param = "",
		param = {
			{
				500,
				12.82,
				true,
				"%"
			},
			{
				2,
				0,
				false,
				""
			},
			{
				700,
				17.948,
				true,
				"%"
			},
			{
				16,
				0,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[101132202] = {
		description = "处于<material=underline c=#FFFFFF h=2 event=terminology args=(113201)>「燃剑姿态」</material>：挥舞长剑进行大范围的横扫，造成共计<color=#E78300>{1}</color>攻击力的火属性伤害。\n处于<material=underline c=#FFFFFF h=2 event=terminology args=(113202)>「炽甲姿态」</material>：消耗<color=#E78300>20</color>点怒气，将旋转长剑移动到锁定的敌人位置并刷新旋转长剑的持续时间，并且旋转长剑命中瞬间伤害提高<color=#E78300>{2}</color>，持续<color=#E78300>5</color>秒；该技能有<color=#E78300>6</color>秒的冷却时间。",
		maxLv = 60,
		type = 1,
		id = 101132202,
		extra_param = "",
		param = {
			{
				900,
				23.076,
				true,
				"%"
			},
			{
				40,
				0,
				false,
				"%"
			}
		}
	},
	[101132203] = {
		description = "将长剑向目标位置掷出并持续旋转，自身切换为<material=underline c=#FFFFFF h=2 event=terminology args=(113202)>「炽甲姿态」</material>。命中第一个敌人时旋转长剑会在停留在该位置并持续造成范围伤害，每<color=#E78300>0.5</color>秒造成<color=#E78300>{1}</color>攻击力的火属性伤害，最多可持续<color=#E78300>10</color>秒，持续时间结束后，旋转长剑消失，自身切换为<material=underline c=#FFFFFF h=2 event=terminology args=(113201)>「燃剑姿态」</material>，之后该技能进入冷却。\n旋转长剑在目标位置持续旋转时，可再次点击该技能，旋转长剑会返回。接住旋转长剑后自身切换为<material=underline c=#FFFFFF h=2 event=terminology args=(113201)>「燃剑姿态」</material>，长剑与拳甲合并施放强力攻击，造成<color=#E78300>{2}</color>攻击力的火属性伤害，施放强力攻击时自身免疫控制与伤害，之后该技能进入冷却。",
		maxLv = 60,
		type = 1,
		id = 101132203,
		extra_param = "",
		param = {
			{
				160,
				4.102,
				true,
				"%"
			},
			{
				2000,
				51.28,
				true,
				"%"
			}
		}
	},
	[101132208] = {
		description = "惑火灼心·迦具土与烙焰·提尔的连携奥义。\n惑火灼心·迦具土造成<color=#E78300>{1}+{2}</color>×<color=#297DE0>自身奥义等级</color>攻击力的火属性伤害；施放时获得<material=underline c=#FFFFFF h=2 event=terminology args=(115803)>「焚心·祸」</material>状态；命中时全队伍怒气型修正者火属性攻击命中瞬间技能伤害提高<color=#E78300>{8}</color>，持续<color=#E78300>12</color>秒。\n烙焰·提尔造成<color=#E78300>{3}+{4}</color>×<color=#297DE0>自身奥义等级</color>攻击力的火属性伤害；命中时全队伍技能伤害提高<color=#E78300>{5}</color>、奥义伤害提高<color=#E78300>{6}</color>，持续<color=#E78300>{7}</color>秒。",
		maxLv = 60,
		type = 1,
		id = 101132208,
		extra_param = "",
		param = {
			{
				1160,
				0,
				false,
				"%"
			},
			{
				29.744,
				0,
				false,
				"%"
			},
			{
				1160,
				0,
				false,
				"%"
			},
			{
				29.744,
				0,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				"%"
			},
			{
				20,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			},
			{
				50,
				0,
				false,
				"%"
			}
		}
	},
	[101132209] = {
		description = "收回长剑切换为<material=underline c=#FFFFFF h=2 event=terminology args=(113201)>「燃剑姿态」</material>，以神力凝聚烈焰，进行一次大范围的强力斩击，造成共计<color=#E78300>{1}</color>攻击力的火属性伤害；命中时全队伍技能伤害提高<color=#E78300>{2}</color>、奥义伤害提高<color=#E78300>{3}</color>，持续<color=#E78300>{4}</color>秒。\n\n自身或者队友施放奥义时，获得<color=#E78300>20%</color>的奥义值。",
		maxLv = 60,
		type = 1,
		id = 101132209,
		extra_param = "",
		param = {
			{
				1160,
				29.743,
				true,
				"%"
			},
			{
				10,
				0,
				false,
				"%"
			},
			{
				20,
				0,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[101132305] = {
		description = "快速闪避敌人攻击，极限闪避会触发闪避效果。\n闪避效果：获得<color=#E78300>15</color>点怒气；火属性伤害提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒；闪避效果每<color=#E78300>{3}</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101132305,
		extra_param = "",
		param = {
			{
				12,
				0,
				false,
				"%"
			},
			{
				6,
				0,
				false,
				""
			},
			{
				12,
				0,
				false,
				""
			}
		}
	},
	[101138101] = {
		description = "对锁定的敌人发射流光，造成共计<color=#E78300>{1}</color>攻击力的光属性伤害。\n\n<color=#297DE0>能量：</color>每秒自动获得<color=#E78300>3</color>点能量。",
		maxLv = 60,
		type = 1,
		id = 101138101,
		extra_param = "",
		param = {
			{
				330,
				6.368,
				true,
				"%"
			}
		}
	},
	[101138201] = {
		description = "在锁定的敌人上方召唤<color=#E78300>7</color>个流星，对范围内的敌人进行攻击，每个流星造成<color=#E78300>{1}</color>攻击力的光属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101138201,
		extra_param = "",
		param = {
			{
				200,
				5.128,
				true,
				"%"
			}
		}
	},
	[101138202] = {
		description = "对自身周围敌人进行攻击，造成共计<color=#E78300>{1}</color>攻击力的光属性伤害；攻击力最高的队友攻击力提高<color=#E78300>{2}</color>，持续<color=#E78300>{3}</color>秒。",
		maxLv = 60,
		type = 1,
		id = 101138202,
		extra_param = "",
		param = {
			{
				480,
				12.307,
				true,
				"%"
			},
			{
				20.5,
				0.5,
				true,
				"%"
			},
			{
				15,
				0,
				false,
				""
			}
		}
	},
	[101138203] = {
		description = "在目标的上方召唤天枢，对范围内的敌人进行攻击，造成共计<color=#E78300>{1}</color>攻击力的光属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101138203,
		extra_param = "",
		param = {
			{
				1500,
				38.46,
				true,
				"%"
			}
		}
	},
	[101138209] = {
		description = "全队伍伤害提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒；返还<color=#E78300>10</color>秒内全队伍下一次消耗的机制值。\n\n自身或者队友触发零时空间时，获得<color=#E78300>8%</color>的奥义值。",
		maxLv = 60,
		type = 1,
		id = 101138209,
		extra_param = "",
		param = {
			{
				14.4,
				0.4,
				true,
				"%"
			},
			{
				12,
				0,
				false,
				""
			}
		}
	},
	[101138305] = {
		description = "快速闪避敌人攻击，极限闪避会触发闪避效果。\n闪避效果：进入零时空间使全场敌人动作大幅减速，持续<color=#E78300>2</color>秒；触发光箭对攻击者进行攻击，造成共计<color=#E78300>{1}</color>攻击力的光属性伤害；闪避效果每<color=#E78300>{2}</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101138305,
		extra_param = "",
		param = {
			{
				240,
				6.152,
				true,
				"%"
			},
			{
				24,
				0,
				false,
				""
			}
		}
	},
	[101138351] = {
		description = "快速闪避敌人攻击，闪避必定触发闪避效果。\n长按闪避会消耗<color=#E78300>30</color>点能量额外触发闪避效果，该效果每<color=#E78300>24</color>秒最多触发一次。\n闪避效果：进入零时空间使全场敌人动作大幅减速，持续<color=#E78300>2</color>秒；触发光箭对锁定的敌人进行攻击，造成共计<color=#E78300>{1}</color>攻击力的光属性伤害；闪避效果每<color=#E78300>{2}</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101138351,
		extra_param = "",
		param = {
			{
				240,
				6.152,
				true,
				"%"
			},
			{
				24,
				0,
				false,
				""
			}
		}
	},
	[101139101] = {
		description = "召唤冰棱攻击前方敌人，造成共计<color=#E78300>{1}</color>攻击力的冰属性伤害。\n\n被动：\n<material=underline c=#FFFFFF h=2 event=terminology args=(113901)>「若雪」</material>和<material=underline c=#FFFFFF h=2 event=terminology args=(113902)>「寒封」</material>标记最多共计拥有<color=#E78300>2</color>个。\n\n<color=#297DE0>能量：</color>每秒自动获得<color=#E78300>3</color>点能量。",
		maxLv = 60,
		type = 1,
		id = 101139101,
		extra_param = "",
		param = {
			{
				209,
				4.081,
				true,
				"%"
			}
		}
	},
	[101139201] = {
		description = "召唤一根冰刺攻击目标，造成共计<color=#E78300>{1}</color>攻击力的冰属性伤害，维持技能动作短暂时间后可再次点击该技能施放「追加吟唱」。\n「追加吟唱」：冰刺碎裂后化作碎片再次攻击，造成共计<color=#E78300>{2}</color>攻击力的冰属性伤害，并获得<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(113901)>「若雪」</material>标记。\n消耗不同数量<material=underline c=#FFFFFF h=2 event=terminology args=(113901)>「若雪」</material>标记进入<material=underline c=#FFFFFF h=2 event=terminology args=(113903)>「临渊」</material>状态时，状态期间内获得不同效果：\n<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(113901)>「若雪」</material>标记：自身冰属性伤害提高<color=#E78300>10%</color>；施放「零度寒芒」后，「零度寒芒」的剩余冷却时间缩短<color=#E78300>3</color>秒。\n<color=#E78300>2</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(113901)>「若雪」</material>标记：自身冰属性伤害提高<color=#E78300>30%</color>；施放「零度寒芒」后，「零度寒芒」的剩余冷却时间缩短<color=#E78300>7</color>秒。",
		maxLv = 60,
		type = 1,
		id = 101139201,
		extra_param = "",
		param = {
			{
				300,
				7.692,
				true,
				"%"
			},
			{
				240,
				6.151,
				true,
				"%"
			}
		}
	},
	[101139202] = {
		description = "召唤冰柱穿刺锁定的敌人，造成共计<color=#E78300>{1}</color>攻击力的冰属性伤害，对命中的敌人附加冰冻状态，持续<color=#E78300>{2}</color>秒，维持技能动作短暂时间后可再次点击该技能施放「追加吟唱」。\n「追加吟唱」：在命中的敌人周围产生连续冰爆，造成共计<color=#E78300>{3}</color>攻击力的冰属性伤害，并获得<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(113902)>「寒封」</material>标记。\n消耗不同数量<material=underline c=#FFFFFF h=2 event=terminology args=(113902)>「寒封」</material>标记进入<material=underline c=#FFFFFF h=2 event=terminology args=(113903)>「临渊」</material>状态时，状态期间内获得不同效果：\n<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(113902)>「寒封」</material>标记：攻击命中时会对敌人附加冰属性抗性降低<color=#E78300>1%</color>，持续<color=#E78300>{4}</color>秒，该效果最高<color=#E78300>20%</color>；施放「事象冰封」后，「事象冰封」的剩余冷却时间缩短<color=#E78300>4</color>秒。\n<color=#E78300>2</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(113902)>「寒封」</material>标记：攻击命中时会对敌人附加冰属性抗性降低<color=#E78300>2%</color>，持续<color=#E78300>{4}</color>秒，该效果最高<color=#E78300>20%</color>；施放「事象冰封」后，「事象冰封」的剩余冷却时间缩短<color=#E78300>9</color>秒。",
		maxLv = 60,
		type = 1,
		id = 101139202,
		extra_param = "",
		param = {
			{
				200,
				5.128,
				true,
				"%"
			},
			{
				4,
				0,
				false,
				""
			},
			{
				240,
				6.153,
				true,
				"%"
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[101139203] = {
		description = "施放「零度寒芒」或「事象冰封」后，施放「银雪回响」会重复施放上一技能并获得对应的<material=underline c=#FFFFFF h=2 event=terminology args=(113901)>「若雪」</material>或<material=underline c=#FFFFFF h=2 event=terminology args=(113902)>「寒封」</material>标记，该次施放会附加对应技能的「追加吟唱」攻击。拥有<color=#E78300>2</color>个任意标记时，「银雪回响」会替换为「银雪星霜」。\n「银雪星霜」：施放时消耗全部标记并获得对应效果，向锁定方向发射三道星霜，对路径上的敌人造成共计<color=#E78300>{1}</color>攻击力的冰属性伤害，重置「零度寒芒」和「事象冰封」的冷却时间，进入<material=underline c=#FFFFFF h=2 event=terminology args=(113903)>「临渊」</material>状态，持续<color=#E78300>8</color>秒。\n<material=underline c=#FFFFFF h=2 event=terminology args=(113903)>「临渊」</material>：状态期间内禁用技能三，无法获得<material=underline c=#FFFFFF h=2 event=terminology args=(113901)>「若雪」</material>或<material=underline c=#FFFFFF h=2 event=terminology args=(113902)>「寒封」</material>标记；施放「零度寒芒」或「事象冰封」时会附加对应技能的「追加吟唱」攻击。",
		maxLv = 60,
		type = 1,
		id = 101139203,
		extra_param = "",
		param = {
			{
				700,
				17.941,
				true,
				"%"
			}
		}
	},
	[101139209] = {
		description = "召唤多个冰柱攻击锁定的敌人，造成共计<color=#E78300>{1}</color>攻击力的冰属性伤害；根据当前拥有的标记的种类和数量，全队伍技能一和技能二的剩余冷却时间缩短。\n<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(113901)>「若雪」</material>标记：全队伍技能一的剩余冷却时间缩短<color=#E78300>3</color>秒。\n<color=#E78300>2</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(113901)>「若雪」</material>标记：全队伍技能一的剩余冷却时间缩短<color=#E78300>7</color>秒。\n<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(113902)>「寒封」</material>标记：全队伍技能二的剩余冷却时间缩短<color=#E78300>4</color>秒。\n<color=#E78300>2</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(113902)>「寒封」</material>标记：全队伍技能二的剩余冷却时间缩短<color=#E78300>9</color>秒。\n\n当敌人被附加冰冻状态时，获得<color=#E78300>8%</color>的奥义值，该效果每<color=#E78300>2</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101139209,
		extra_param = "",
		param = {
			{
				840,
				21.535,
				true,
				"%"
			}
		}
	},
	[101139305] = {
		description = "快速闪避敌人攻击，极限闪避会触发闪避效果。\n闪避效果：进入零时空间使全场敌人动作大幅减速，持续<color=#E78300>3</color>秒；闪避效果每<color=#E78300>{1}</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101139305,
		extra_param = "",
		param = {
			{
				20,
				0,
				false,
				""
			}
		}
	},
	[101148101] = {
		description = "对周围目标进行连续射击，造成共计<color=#E78300>{1}</color>攻击力的物理属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101148101,
		extra_param = "",
		param = {
			{
				246,
				4.895,
				true,
				"%"
			}
		}
	},
	[101148201] = {
		description = "抬手甩出一颗爆弹，爆弹会在<color=#E78300>5</color>秒后爆炸，当有接触敌人时会立即发生爆炸，造成共计<color=#E78300>{1}</color>攻击力的物理属性伤害。\n\n<color=#297DE0>印记：</color>每次施放命中后，获得<color=#E78300>{2}</color>个印记。",
		maxLv = 60,
		type = 1,
		id = 101148201,
		extra_param = "",
		param = {
			{
				130,
				3.333,
				true,
				"%"
			},
			{
				1,
				0,
				false,
				""
			}
		}
	},
	[101148202] = {
		description = "自动锁定并对目标进行射击，起手造成<color=#E78300>{1}</color>攻击力的物理属性伤害，接着进行两轮射击，每轮进行五次攻击造成共计<color=#E78300>{2}</color>攻击力的物理属性伤害。\n\n<color=#297DE0>印记：</color>每次施放命中后，获得<color=#E78300>{3}</color>个印记。",
		maxLv = 60,
		type = 1,
		id = 101148202,
		extra_param = "",
		param = {
			{
				44,
				1.128,
				true,
				"%"
			},
			{
				85,
				2.255,
				true,
				"%"
			},
			{
				1,
				0,
				false,
				""
			}
		}
	},
	[101148203] = {
		description = "武器展开变为狙击枪，开启「狙击模式」，最多持续<color=#E78300>10</color>秒，可通过闪避直接结束该模式，之后该技能进入冷却。\n「狙击模式」：禁用移动和自身其他技能，点击技能可对瞄准目标进行射击，造成<color=#E78300>{1}</color>攻击力的物理属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101148203,
		extra_param = "",
		param = {
			{
				140,
				3.589,
				true,
				"%"
			}
		}
	},
	[101148209] = {
		description = "枪械变形为狙击枪，对前方直线路径上的敌人进行贯穿射击，造成共计<color=#E78300>{1}</color>攻击力的物理属性伤害；命中后自身获得<color=#E78300>{2}</color>个印记，队友获得<color=#E78300>1</color>个印记。\n\n自身或者队友触发零时空间时，获得<color=#E78300>15%</color>的奥义值，该效果每<color=#E78300>0.5</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101148209,
		extra_param = "",
		param = {
			{
				360,
				9.23,
				true,
				"%"
			},
			{
				4,
				0,
				false,
				""
			}
		}
	},
	[101148305] = {
		description = "快速闪避敌人攻击，极限闪避会触发闪避效果。\n闪避效果：进入零时空间使全场敌人动作大幅减速，持续<color=#E78300>4</color>秒；闪避效果每<color=#E78300>{1}</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101148305,
		extra_param = "",
		param = {
			{
				25,
				0,
				false,
				""
			}
		}
	},
	[101150101] = {
		description = "沉眠于樱切这柄权钥上的古剑术，造成共计<color=#E78300>{1}</color>攻击力的雷属性伤害。\n处于<material=underline c=#FFFFFF h=2 event=terminology args=(115001)>「樱弥」</material>状态时，造成共计<color=#E78300>{2}</color>攻击力的雷属性伤害。\n\n<color=#297DE0>神能：</color>不处于<material=underline c=#FFFFFF h=2 event=terminology args=(115001)>「樱弥」</material>状态时，普通攻击命中后会获得神能。",
		maxLv = 60,
		type = 1,
		id = 101150101,
		extra_param = "",
		param = {
			{
				413,
				8.046,
				true,
				"%"
			},
			{
				511,
				9.969,
				true,
				"%"
			}
		}
	},
	[101150201] = {
		description = "传承自樱切的古剑术，第一式，造成共计<color=#E78300>{1}</color>攻击力的雷属性伤害。\n「一式·决刹」：可以连续衔接施放最多<color=#E78300>3</color>段攻击，依次造成共计<color=#E78300>{2}、{3}、{4}</color>攻击力的雷属性伤害；仅施放<color=#E78300>1</color>段攻击后，该技能剩余冷却时间缩短<color=#E78300>6</color>秒；仅施放<color=#E78300>2</color>段攻击后，该技能剩余冷却时间缩短<color=#E78300>3</color>秒；拥有神能时，每段施放命中时获得<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(115003)>「樱」</material>标记；该技能有<color=#E78300>10</color>秒的冷却时间。\n\n<color=#297DE0>神能：</color>不处于<material=underline c=#FFFFFF h=2 event=terminology args=(115001)>「樱弥」</material>状态时，每次命中后会获得<color=#E78300>5</color>点神能。",
		maxLv = 60,
		type = 1,
		id = 101150201,
		extra_param = "",
		param = {
			{
				600,
				15.384,
				true,
				"%"
			},
			{
				300,
				7.692,
				true,
				"%"
			},
			{
				400,
				10.256,
				true,
				"%"
			},
			{
				500,
				12.82,
				true,
				"%"
			}
		}
	},
	[101150202] = {
		description = "传承自樱切的古剑术，第三式，前段造成共计<color=#E78300>{1}</color>攻击力的雷属性伤害，后段造成<color=#E78300>{2}</color>攻击力的雷属性伤害。\n「三式·樱舞」：可以连续衔接施放最多<color=#E78300>3</color>段攻击，依次造成共计<color=#E78300>{3}、{4}、{5}</color>攻击力的雷属性伤害；仅施放<color=#E78300>1</color>段攻击后，该技能剩余冷却时间缩短<color=#E78300>6</color>秒；仅施放<color=#E78300>2</color>段攻击后，该技能剩余冷却时间缩短<color=#E78300>3</color>秒；拥有神能时，每段施放命中时获得<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(115003)>「樱」</material>标记；该技能有<color=#E78300>10</color>秒的冷却时间。\n\n<color=#297DE0>神能：</color>不处于<material=underline c=#FFFFFF h=2 event=terminology args=(115001)>「樱弥」</material>状态时，每次命中后会获得<color=#E78300>5</color>点神能。",
		maxLv = 60,
		type = 1,
		id = 101150202,
		extra_param = "",
		param = {
			{
				300,
				7.692,
				true,
				"%"
			},
			{
				300,
				7.692,
				true,
				"%"
			},
			{
				300,
				7.692,
				true,
				"%"
			},
			{
				400,
				10.256,
				true,
				"%"
			},
			{
				500,
				12.82,
				true,
				"%"
			}
		}
	},
	[101150203] = {
		description = "将樱切的力量全数解放，神能为满时才可施放，施放时对锁定的敌人附加动作迟缓至<color=#E78300>50%</color>，持续<color=#E78300>{4}</color>秒，造成共计<color=#E78300>{1}</color>攻击力的雷属性伤害，进入<material=underline c=#FFFFFF h=2 event=terminology args=(115001)>「樱弥」</material>状态。\n<material=underline c=#FFFFFF h=2 event=terminology args=(115001)>「樱弥」</material>：「一式·裂空」、「三式·苍雷」、「九式·绯染」会替换为「一式·决刹」、「三式·樱舞」、「九式·落樱」并重置技能的冷却时间。状态期间内每<color=#E78300>0.15</color>秒消耗<color=#E78300>1</color>点神能，神能消耗不受其他属性影响，神能获得率降低<color=#E78300>{5}</color>。每次普通攻击、「一式·决刹」、「二式·破罔」、「三式·樱舞」、「九式·绯影」命中后，获得<color=#E78300>1</color>点<material=underline c=#FFFFFF h=2 event=terminology args=(115002)>「妖樱」</material>，<material=underline c=#FFFFFF h=2 event=terminology args=(115002)>「妖樱」</material>上限<color=#E78300>100</color>点。\n「九式·绯影」：当自身拥有<material=underline c=#FFFFFF h=2 event=terminology args=(115003)>「樱」</material>标记时，点击普通攻击会消耗<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(115003)>「樱」</material>标记施放技能攻击，向前疾冲，造成共计<color=#E78300>{2}</color>攻击力的雷属性伤害。\n「九式·落樱」：施放迅捷无匹的斩击，造成共计<color=#E78300>{3}</color>攻击力的雷属性伤害，每有<color=#E78300>1</color>点<material=underline c=#FFFFFF h=2 event=terminology args=(115002)>「妖樱」</material>，命中瞬间独立伤害提高<color=#E78300>0.7%</color>；<material=underline c=#FFFFFF h=2 event=terminology args=(115002)>「妖樱」</material>点数不足<color=#E78300>100</color>点时，对锁定的敌人附加动作迟缓至<color=#E78300>50%</color>，持续<color=#E78300>{6}</color>秒，<material=underline c=#FFFFFF h=2 event=terminology args=(115002)>「妖樱」</material>点数达到<color=#E78300>100</color>点时，施放时进入零时空间<color=#E78300>3</color>秒，该技能最后一段攻击命中瞬间会心率提高<color=#E78300>{7}</color>；退出<material=underline c=#FFFFFF h=2 event=terminology args=(115001)>「樱弥」</material>状态，退出时消耗全部神能、<material=underline c=#FFFFFF h=2 event=terminology args=(115003)>「樱」</material>标记和<material=underline c=#FFFFFF h=2 event=terminology args=(115002)>「妖樱」</material>点数，之后「九式·绯染」进入冷却。\n「二式·破罔」：收剑入鞘，以快至极限的斩击划破空间，造成共计<color=#E78300>{8}</color>攻击力的雷属性伤害。\n\n<color=#297DE0>神能：</color>不处于<material=underline c=#FFFFFF h=2 event=terminology args=(115001)>「樱弥」</material>状态时，「二式·破罔」每次命中后会获得<color=#E78300>3</color>点神能。",
		maxLv = 60,
		type = 1,
		id = 101150203,
		extra_param = "",
		param = {
			{
				600,
				15.382,
				true,
				"%"
			},
			{
				400,
				10.254,
				true,
				"%"
			},
			{
				1100,
				28.199,
				true,
				"%"
			},
			{
				2,
				0,
				false,
				""
			},
			{
				1000,
				0,
				false,
				"%"
			},
			{
				3,
				0,
				false,
				""
			},
			{
				50,
				0,
				false,
				"%"
			},
			{
				450,
				11.535,
				true,
				"%"
			}
		}
	},
	[101150208] = {
		description = "绯染·丰前坊天狗与震离·月读的连携奥义。\n绯染·丰前坊天狗造成<color=#E78300>{1}+{2}</color>×<color=#297DE0>自身奥义等级</color>攻击力的雷属性伤害；施放时全队伍会心率提高<color=#E78300>{5}</color>、技能伤害提高<color=#E78300>{6}</color>，持续<color=#E78300>{7}</color>秒；下一次「九式·落樱」最后一段攻击命中瞬间护甲穿透提高<color=#E78300>{8}</color>。\n震离·月读造成<color=#E78300>{3}+{4}</color>×<color=#297DE0>自身奥义等级</color>攻击力的雷属性伤害；施放时全队伍攻击力提高<color=#E78300>{9}</color>、雷属性伤害提高<color=#E78300>{10}</color>，持续<color=#E78300>{11}</color>秒；重置「雷殛·荒天」的冷却时间；恢复<color=#E78300>20</color>点怒气；命中后<color=#E78300>4</color>秒内，「雷殛·荒天」不清除<material=underline c=#FFFFFF h=2 event=terminology args=(119901)>「雷殛之印」</material>并且会开启下一式，下一次「雷殛·荒天」的剩余冷却时间缩短<color=#E78300>10</color>秒。",
		maxLv = 60,
		type = 1,
		id = 101150208,
		extra_param = "",
		param = {
			{
				1000,
				50,
				true,
				"%"
			},
			{
				25.641,
				1.282,
				true,
				"%"
			},
			{
				1000,
				50,
				true,
				"%"
			},
			{
				25.641,
				1.282,
				true,
				"%"
			},
			{
				12,
				0,
				false,
				"%"
			},
			{
				25,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			},
			{
				40,
				0,
				false,
				"%"
			},
			{
				15,
				0,
				false,
				"%"
			},
			{
				30,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			}
		}
	},
	[101150209] = {
		description = "一瞬之间挥出无数次斩击，造成共计<color=#E78300>{1}</color>攻击力的雷属性伤害，命中时全队伍会心率提高<color=#E78300>{2}</color>，持续<color=#E78300>{3}</color>秒。\n\n自身或者队友触发零时空间时，获得<color=#E78300>15%</color>的奥义值，该效果每<color=#E78300>0.5</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101150209,
		extra_param = "",
		param = {
			{
				1000,
				25.64,
				true,
				"%"
			},
			{
				12,
				0,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[101150281] = {
		description = "震离·月读、绯染·丰前坊天狗与觅影·国常立的连携奥义。\n震离·月读造成<color=#E78300>{1}+{2}</color>×<color=#297DE0>自身奥义等级</color>攻击力的雷属性伤害；命中时全队伍攻击力提高<color=#E78300>{7}</color>、雷属性伤害提高<color=#E78300>{8}</color>，持续<color=#E78300>{9}</color>秒。\n绯染·丰前坊天狗造成<color=#E78300>{3}+{4}</color>×<color=#297DE0>自身奥义等级</color>攻击力的雷属性伤害；命中时全队伍会心率提高<color=#E78300>{10}</color>、会心伤害提高<color=#E78300>{11}</color>，持续<color=#E78300>{12}</color>秒。\n觅影·国常立造成<color=#E78300>{5}+{6}</color>×<color=#297DE0>平均技能等级</color>攻击力的雷属性伤害；命中时对敌人附加物理、火属性、雷属性和风属性抗性降低<color=#E78300>{13}</color>，持续<color=#E78300>{14}</color>秒；全队伍技能伤害提高<color=#E78300>{15}</color>、奥义获得率提高<color=#E78300>{16}</color>，持续<color=#E78300>{17}</color>秒。",
		maxLv = 60,
		type = 1,
		id = 101150281,
		extra_param = "",
		param = {
			{
				1000,
				50,
				true,
				"%"
			},
			{
				25.641,
				1.282,
				true,
				"%"
			},
			{
				1000,
				50,
				true,
				"%"
			},
			{
				25.641,
				1.282,
				true,
				"%"
			},
			{
				1000,
				50,
				true,
				"%"
			},
			{
				25.641,
				1.282,
				true,
				"%"
			},
			{
				40,
				0,
				false,
				"%"
			},
			{
				30,
				0,
				false,
				"%"
			},
			{
				15,
				0,
				false,
				""
			},
			{
				12,
				0,
				false,
				"%"
			},
			{
				30,
				0,
				false,
				"%"
			},
			{
				15,
				0,
				false,
				""
			},
			{
				30,
				0,
				false,
				"%"
			},
			{
				15,
				0,
				false,
				""
			},
			{
				30,
				0,
				false,
				"%"
			},
			{
				60,
				0,
				false,
				"%"
			},
			{
				15,
				0,
				false,
				""
			}
		}
	},
	[101150282] = {
		description = "镜花黄泉·伊邪那美与绯染·丰前坊天狗的连携奥义。\n镜花黄泉·伊邪那美造成<color=#E78300>{1}+{2}</color>×<color=#297DE0>自身奥义等级</color>攻击力的冰属性伤害；施放时全队伍冰属性伤害提高<color=#E78300>{5}</color>、真樱神系修正者伤害提高<color=#E78300>{6}</color>，持续<color=#E78300>{7}</color>秒。\n绯染·丰前坊天狗造成<color=#E78300>{3}+{4}</color>×<color=#297DE0>自身奥义等级</color>攻击力的雷属性伤害；施放时全队伍会心率提高<color=#E78300>{8}</color>、会心伤害提高<color=#E78300>{9}</color>，持续<color=#E78300>{10}</color>秒。",
		maxLv = 60,
		type = 1,
		id = 101150282,
		extra_param = "",
		param = {
			{
				1440,
				72,
				true,
				"%"
			},
			{
				36.923,
				1.846,
				true,
				"%"
			},
			{
				1000,
				50,
				true,
				"%"
			},
			{
				25.641,
				1.282,
				true,
				"%"
			},
			{
				30,
				0,
				false,
				"%"
			},
			{
				45,
				0,
				false,
				"%"
			},
			{
				15,
				0,
				false,
				""
			},
			{
				12,
				0,
				false,
				"%"
			},
			{
				25,
				0,
				false,
				"%"
			},
			{
				15,
				0,
				false,
				""
			}
		}
	},
	[101150305] = {
		description = "快速闪避敌人攻击，极限闪避会触发闪避效果。极限闪避后<color=#E78300>2</color>秒内点击普通攻击，会施放「二式·破罔」。\n闪避效果：进入零时空间使全场敌人动作大幅减速，持续<color=#E78300>2</color>秒；闪避效果每<color=#E78300>{1}</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101150305,
		extra_param = "",
		param = {
			{
				20,
				0,
				false,
				""
			}
		}
	},
	[101156101] = {
		description = "造成共计<color=#E78300>{1}</color>攻击力的雷属性伤害。\n施放普通攻击第四段时会出现判定，在合适的时机点击普通攻击时会触发<material=underline c=#FFFFFF h=2 event=terminology args=(115601)>「煌雷」</material>获得强化效果：普通攻击最后一段改变为造成共计<color=#E78300>{2}</color>攻击力的雷属性伤害。\n\n被动：\n施放获得强化效果的普通攻击和技能期间获得霸体效果。触发<material=underline c=#FFFFFF h=2 event=terminology args=(115601)>「煌雷」</material>时，技能的剩余冷却时间缩短<color=#E78300>0.5</color>秒。\n\n<color=#297DE0>怒气：</color>普通攻击命中后会获得怒气。",
		maxLv = 60,
		type = 1,
		id = 101156101,
		extra_param = "",
		param = {
			{
				508,
				9.848,
				true,
				"%"
			},
			{
				308,
				6.005,
				true,
				"%"
			}
		}
	},
	[101156201] = {
		description = "前段造成共计<color=#E78300>{1}</color>攻击力的雷属性伤害，消耗全部怒气，后段造成共计<color=#E78300>{2}</color>攻击力的雷属性伤害；施放前段时会出现判定，在合适的时机点击该技能时会触发<material=underline c=#FFFFFF h=2 event=terminology args=(115601)>「煌雷」</material>获得强化效果：后段改变为造成共计<color=#E78300>{3}</color>攻击力的雷属性伤害。消耗怒气低于<color=#E78300>50</color>点时，技能后段命中瞬间基础伤害提高<color=#E78300>5%</color>，消耗怒气不低于<color=#E78300>50</color>点且低于<color=#E78300>100</color>点时，技能后段命中瞬间基础伤害提高<color=#E78300>10%</color>，消耗怒气<color=#E78300>100</color>点时，技能后段命中瞬间基础伤害提高<color=#E78300>15%</color>。\n触发<material=underline c=#FFFFFF h=2 event=terminology args=(115601)>「煌雷」</material>的后段攻击会对命中的敌人附加破甲状态，持续<color=#E78300>{4}</color>秒；消耗怒气低于<color=#E78300>50</color>点时，附加的破甲状态防御力降低<color=#E78300>3%</color>，消耗怒气不低于<color=#E78300>50</color>点且低于<color=#E78300>100</color>点时，附加的破甲状态防御力降低<color=#E78300>6%</color>，消耗怒气<color=#E78300>100</color>点时，附加的破甲状态防御力降低<color=#E78300>9%</color>。",
		maxLv = 60,
		type = 1,
		id = 101156201,
		extra_param = "",
		param = {
			{
				500,
				12.82,
				true,
				"%"
			},
			{
				500,
				12.818,
				true,
				"%"
			},
			{
				600,
				15.382,
				true,
				"%"
			},
			{
				18,
				0,
				false,
				""
			}
		}
	},
	[101156202] = {
		description = "瞬移到敌人位置，前段造成共计<color=#E78300>{1}</color>攻击力的雷属性伤害，命中后的短暂时间内，可以点击该技能施放后段，造成共计<color=#E78300>{2}</color>攻击力的雷属性伤害；前段攻击命中后会出现判定，在合适的时机点击该技能时会触发<material=underline c=#FFFFFF h=2 event=terminology args=(115601)>「煌雷」</material>获得强化效果：后段改变为造成共计<color=#E78300>{3}</color>攻击力的雷属性伤害，最后一次攻击命中时自身技能伤害提高<color=#E78300>{4}</color>，持续<color=#E78300>{5}</color>秒。\n\n<color=#297DE0>怒气：</color>强化的后段攻击命中后会获得怒气。",
		maxLv = 60,
		type = 1,
		id = 101156202,
		extra_param = "",
		param = {
			{
				300,
				7.692,
				true,
				"%"
			},
			{
				300,
				7.692,
				true,
				"%"
			},
			{
				400,
				10.256,
				true,
				"%"
			},
			{
				10,
				0,
				false,
				"%"
			},
			{
				18,
				0,
				false,
				""
			}
		}
	},
	[101156203] = {
		description = "消耗全部怒气，造成<color=#E78300>{1}</color>攻击力的雷属性伤害，可通过长按进行最多<color=#E78300>3</color>段蓄力，蓄力时获得霸体效果并聚集敌人，根据蓄力的段数分别造成<color=#E78300>{2}、{3}、{4}</color>攻击力的雷属性伤害；消耗怒气低于<color=#E78300>50</color>点时，该技能命中瞬间基础伤害提高<color=#E78300>5%</color>，消耗怒气不低于<color=#E78300>50</color>点且低于<color=#E78300>100</color>点时，该技能命中瞬间基础伤害提高<color=#E78300>10%</color>，消耗怒气<color=#E78300>100</color>点时，该技能命中瞬间基础伤害提高<color=#E78300>15%</color>。\n满蓄力的该技能视为触发<material=underline c=#FFFFFF h=2 event=terminology args=(115601)>「煌雷」</material>。",
		maxLv = 60,
		type = 1,
		id = 101156203,
		extra_param = "",
		param = {
			{
				600,
				15.384,
				true,
				"%"
			},
			{
				1000,
				25.641,
				true,
				"%"
			},
			{
				1400,
				35.897,
				true,
				"%"
			},
			{
				1800,
				46.153,
				true,
				"%"
			}
		}
	},
	[101156209] = {
		description = "造成共计<color=#E78300>{1}</color>攻击力的雷属性伤害；命中时对敌人附加雷属性抗性降低<color=#E78300>{2}</color>，持续<color=#E78300>{3}</color>秒。\n自身或者队友施放单人奥义时，会心伤害提高<color=#E78300>30%</color>，持续<color=#E78300>{4}</color>秒。\n\n自身或者队友极限闪避时，获得<color=#E78300>8%</color>的奥义值，该效果每<color=#E78300>2</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101156209,
		extra_param = "",
		param = {
			{
				1000,
				25.636,
				true,
				"%"
			},
			{
				20,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			},
			{
				5,
				0,
				false,
				""
			}
		}
	},
	[101156305] = {
		description = "快速闪避敌人攻击，极限闪避会触发闪避效果。闪避不会打断普通攻击的连段；极限闪避时，获得<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(115602)>「霹雳」</material>标记；极限闪避后，会出现<material=underline c=#FFFFFF h=2 event=terminology args=(115601)>「煌雷」</material>，在合适的时机点击普通攻击时，会施放获得强化效果的普通攻击的最后一段。\n<material=underline c=#FFFFFF h=2 event=terminology args=(115602)>「霹雳」</material>：每拥有<color=#E78300>1</color>个该标记，施放「九劫·雷崩」时，会消耗全部标记，每<color=#E78300>1</color>个减少<color=#E78300>1</color>段蓄力时间；受击并损失生命值时，失去<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(115602)>「霹雳」</material>标记，施放获得强化效果的普通攻击和技能期间，不会失去<material=underline c=#FFFFFF h=2 event=terminology args=(115602)>「霹雳」</material>标记；<material=underline c=#FFFFFF h=2 event=terminology args=(115602)>「霹雳」</material>标记最多拥有<color=#E78300>3</color>个。\n闪避效果：恢复满怒气；获得<color=#E78300>3</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(115602)>「霹雳」</material>标记；重置「九劫·雷崩」的冷却时间；闪避效果每<color=#E78300>{1}</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101156305,
		extra_param = "",
		param = {
			{
				14,
				0,
				false,
				""
			}
		}
	},
	[101158101] = {
		description = "挥舞太刀进行五段斩击，造成共计<color=#E78300>{1}</color>攻击力的火属性伤害。\n\n被动：\n<material=underline c=#FFFFFF h=2 event=terminology args=(115802)>「焚心」</material>：根据<material=underline c=#FFFFFF h=2 event=terminology args=(115802)>「焚心」</material>的等级，自身对视骸伤害依次提高<color=#E78300>5%、15%、30%</color>；衔接施放的「鸦惑一闪」、「瞬灭焰斩」命中瞬间会心伤害提高<color=#E78300>{2}</color>、对应的技能基础伤害提高<color=#E78300>20%</color>并且根据<material=underline c=#FFFFFF h=2 event=terminology args=(115802)>「焚心」</material>的等级每命中敌人<color=#E78300>1</color>次基础伤害额外提高<color=#E78300>10%、15%、20%</color>，该效果提供的技能基础伤害提高最高为<color=#E78300>50%</color>。\n\n<color=#297DE0>怒气：</color>普通攻击命中后会获得怒气。",
		maxLv = 60,
		type = 1,
		id = 101158101,
		extra_param = "",
		param = {
			{
				595,
				11.535,
				true,
				"%"
			},
			{
				20,
				0,
				false,
				"%"
			}
		}
	},
	[101158201] = {
		description = "向前疾冲并挥出一记斩击，造成共计<color=#E78300>{1}</color>攻击力的火属性伤害。\n可以在处于<material=underline c=#FFFFFF h=2 event=terminology args=(115801)>「熔火」</material>状态时衔接施放该技能，跃至空中并向前用太刀横扫突进，造成共计<color=#E78300>{2}</color>攻击力的火属性伤害，根据衔接施放时的<material=underline c=#FFFFFF h=2 event=terminology args=(115802)>「焚心」</material>的等级，可以最多额外连续衔接施放<color=#E78300>3</color>次；技能施放后，根据额外施放的次数降低<material=underline c=#FFFFFF h=2 event=terminology args=(115802)>「焚心」</material>的等级。",
		maxLv = 60,
		type = 1,
		id = 101158201,
		extra_param = "",
		param = {
			{
				300,
				7.691,
				true,
				"%"
			},
			{
				300,
				7.69,
				true,
				"%"
			}
		}
	},
	[101158202] = {
		description = "进入<material=underline c=#FFFFFF h=2 event=terminology args=(115801)>「熔火」</material>状态。\n<material=underline c=#FFFFFF h=2 event=terminology args=(115801)>「熔火」</material>：将太刀收回，持续对自身造成伤害并维持动作积蓄惑火，积蓄条满时，清空积蓄条并提升<material=underline c=#FFFFFF h=2 event=terminology args=(115802)>「焚心」</material>的等级。处于<material=underline c=#FFFFFF h=2 event=terminology args=(115801)>「熔火」</material>状态时每<color=#E78300>0.2</color>秒对自身造成<color=#E78300>2%</color>生命值上限的伤害。根据<material=underline c=#FFFFFF h=2 event=terminology args=(115802)>「焚心」</material>的等级，每<color=#E78300>0.1</color>秒依次获得<color=#E78300>3%、4%、5%、5%</color>积蓄条，自身有怒气时，每<color=#E78300>0.1</color>秒消耗<color=#E78300>9</color>点怒气并额外获得<color=#E78300>2%</color>积蓄条。\n<material=underline c=#FFFFFF h=2 event=terminology args=(115802)>「焚心」</material>等级提升时，会对周围的敌人分别造成<color=#E78300>{1}、{2}、{3}</color>攻击力的火属性伤害。\n<material=underline c=#FFFFFF h=2 event=terminology args=(115802)>「焚心」</material>等级降低后，怒气获得率提高<color=#E78300>{4}</color>，持续<color=#E78300>{5}</color>秒。",
		maxLv = 60,
		type = 1,
		id = 101158202,
		extra_param = "",
		param = {
			{
				200,
				5.128,
				true,
				"%"
			},
			{
				250,
				6.41,
				true,
				"%"
			},
			{
				300,
				7.692,
				true,
				"%"
			},
			{
				100,
				0,
				false,
				"%"
			},
			{
				4,
				0,
				false,
				""
			}
		}
	},
	[101158203] = {
		description = "处于<material=underline c=#FFFFFF h=2 event=terminology args=(115801)>「熔火」</material>状态时才可衔接施放，瞬间向四周发动多次斩击，并以一记猛烈的下劈收尾，造成共计<color=#E78300>{1}</color>攻击力的火属性伤害，技能结束后根据<material=underline c=#FFFFFF h=2 event=terminology args=(115802)>「焚心」</material>的等级恢复自身<color=#E78300>100%、140%、180%</color>攻击力的生命值，然后清空<material=underline c=#FFFFFF h=2 event=terminology args=(115802)>「焚心」</material>等级。",
		maxLv = 60,
		type = 1,
		id = 101158203,
		extra_param = "",
		param = {
			{
				2000,
				51.28,
				true,
				"%"
			}
		}
	},
	[101158209] = {
		description = "挥舞太刀将周遭卷入火海，获得<material=underline c=#FFFFFF h=2 event=terminology args=(115803)>「焚心·祸」</material>状态，造成共计<color=#E78300>{1}</color>攻击力的火属性伤害。\n<material=underline c=#FFFFFF h=2 event=terminology args=(115803)>「焚心·祸」</material>：自动积蓄惑火，每<color=#E78300>0.1</color>秒恢复<color=#E78300>2%</color>积蓄条，处于<material=underline c=#FFFFFF h=2 event=terminology args=(115801)>「熔火」</material>状态时该效果改变为<color=#E78300>3%</color>，持续<color=#E78300>8</color>秒。\n\n自身或者队友损失生命值时，获得<color=#E78300>4.5%</color>的奥义值，该效果每<color=#E78300>2</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101158209,
		extra_param = "",
		param = {
			{
				1160,
				29.743,
				true,
				"%"
			}
		}
	},
	[101158305] = {
		description = "快速闪避敌人攻击，极限闪避会触发闪避效果。极限闪避时，对自身和攻击者附加<material=underline c=#FFFFFF h=2 event=terminology args=(115804)>「燃火」</material>状态，持续<color=#E78300>5</color>秒，场上被附加<material=underline c=#FFFFFF h=2 event=terminology args=(115804)>「燃火」</material>状态的敌人最多存在一个。施放普通攻击或「鸦惑一闪」期间点击闪避时，会改变为施放「焚心熔火」，通过该途径施放的「焚心熔火」不会打断普通攻击的连段。施放「焚心熔火」时会有短暂的闪避判定。\n<material=underline c=#FFFFFF h=2 event=terminology args=(115804)>「燃火」</material>：自身可以格挡处于<material=underline c=#FFFFFF h=2 event=terminology args=(115804)>「燃火」</material>状态的敌人的攻击伤害，处于<material=underline c=#FFFFFF h=2 event=terminology args=(115804)>「燃火」</material>状态的敌人被击败时，移除自身的<material=underline c=#FFFFFF h=2 event=terminology args=(115804)>「燃火」</material>状态。\n闪避效果：积蓄条获得率提高<color=#E78300>15%</color>，持续<color=#E78300>5</color>秒；闪避效果每<color=#E78300>{1}</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101158305,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[101184101] = {
		description = "使用剑盾连续攻击敌人，造成共计<color=#E78300>{1}</color>攻击力的雷属性伤害。\n\n<color=#297DE0>神能：</color>普通攻击第三段的盾击命中后，获得<color=#E78300>5</color>点神能。",
		maxLv = 60,
		type = 1,
		id = 101184101,
		extra_param = "",
		param = {
			{
				93,
				1.849,
				true,
				"%"
			}
		}
	},
	[101184201] = {
		description = "向锁定的敌人挥击并丢出盾牌，挥击对前方造成共计<color=#E78300>{1}</color>攻击力的雷属性伤害，飞盾命中造成共计<color=#E78300>{2}</color>攻击力的雷属性伤害。\n\n<color=#297DE0>神能：</color>飞盾每命中敌人<color=#E78300>1</color>次，获得<color=#E78300>10</color>点神能。",
		maxLv = 60,
		type = 1,
		id = 101184201,
		extra_param = "",
		param = {
			{
				24,
				0.615,
				true,
				"%"
			},
			{
				96,
				2.46,
				true,
				"%"
			}
		}
	},
	[101184202] = {
		description = "长按时进行举盾防御并对前方敌人造成共计<color=#E78300>{1}</color>攻击力的雷属性伤害，持续<color=#E78300>3</color>秒，松开长按或达到时间上限时会施放一次攻击，造成共计<color=#E78300>{2}</color>攻击力的雷属性伤害。当举盾防御被命中时，会格挡受到的伤害，并施放强力反击，造成共计<color=#E78300>{3}</color>攻击力的雷属性伤害，并进入零时空间<color=#E78300>2</color>秒。\n\n<color=#297DE0>神能：</color>成功格挡后，获得<color=#E78300>15</color>点神能。",
		maxLv = 60,
		type = 1,
		id = 101184202,
		extra_param = "",
		param = {
			{
				90,
				2.307,
				true,
				"%"
			},
			{
				270,
				6.923,
				true,
				"%"
			},
			{
				540,
				13.846,
				true,
				"%"
			}
		}
	},
	[101184203] = {
		description = "积蓄力量，跃起后向下冲击，消耗全部神能，造成共计<color=#E78300>{1}</color>攻击力的雷属性伤害，给自身施加生命值上限<color=#E78300>5%</color>的护盾，护盾持续<color=#E78300>{2}</color>秒，每消耗<color=#E78300>1</color>点神能，护盾值额外提高生命值上限<color=#E78300>0.1%</color>。",
		maxLv = 60,
		type = 1,
		id = 101184203,
		extra_param = "",
		param = {
			{
				360,
				9.23,
				true,
				"%"
			},
			{
				12,
				0,
				false,
				""
			}
		}
	},
	[101184208] = {
		description = "震离·月读与旧誓·薇儿丹蒂的连携奥义。\n震离·月读造成<color=#E78300>{1}+{2}</color>×<color=#297DE0>自身奥义等级</color>攻击力的雷属性伤害；命中时全队伍雷属性伤害提高<color=#E78300>{5}</color>，持续<color=#E78300>{6}</color>秒。\n旧誓·薇儿丹蒂造成<color=#E78300>{3}+{4}</color>×<color=#297DE0>自身奥义等级</color>攻击力的雷属性伤害；命中后全队伍获得<color=#E78300>15%</color>的奥义值。",
		maxLv = 60,
		type = 1,
		id = 101184208,
		extra_param = "",
		param = {
			{
				840,
				42,
				true,
				"%"
			},
			{
				21.538,
				1.077,
				true,
				"%"
			},
			{
				350,
				18,
				true,
				"%"
			},
			{
				8.974,
				0.462,
				true,
				"%"
			},
			{
				30,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			},
			{
				21.538,
				1.077,
				true,
				""
			},
			{
				8.974,
				0.462,
				true,
				""
			}
		}
	},
	[101184209] = {
		description = "手持盾牌向锁定的敌人进行冲撞，造成共计<color=#E78300>{1}</color>攻击力的雷属性伤害，同时冲撞路径上存在的敌人，造成共计<color=#E78300>{2}</color>攻击力的雷属性伤害；施放后全队伍获得<color=#E78300>15%</color>的奥义值，命中后自身获得<color=#E78300>30</color>点神能。\n\n自身或者队友触发零时空间时，获得<color=#E78300>15%</color>的奥义值，该效果每<color=#E78300>0.5</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101184209,
		extra_param = "",
		param = {
			{
				280,
				7.179,
				true,
				"%"
			},
			{
				120,
				3.076,
				true,
				"%"
			}
		}
	},
	[101184305] = {
		description = "快速闪避敌人攻击，且可以连续施放二次闪避，极限闪避会触发闪避效果。\n闪避效果：进入零时空间使全场敌人动作大幅减速，持续<color=#E78300>2</color>秒；闪避效果每<color=#E78300>{1}</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101184305,
		extra_param = "",
		param = {
			{
				20,
				0,
				false,
				""
			}
		}
	},
	[101197101] = {
		description = "造成共计<color=#E78300>{1}</color>攻击力的暗属性伤害。\n\n<color=#297DE0>能量：</color>每秒自动获得<color=#E78300>2</color>点能量。",
		maxLv = 60,
		type = 1,
		id = 101197101,
		extra_param = "",
		param = {
			{
				274,
				5.284,
				true,
				"%"
			}
		}
	},
	[101197201] = {
		description = "造成共计<color=#E78300>{1}</color>攻击力的暗属性伤害，施放后的<color=#E78300>3</color>秒内，该技能会替换为衍生技能「沉梦」。\n「沉梦」：消耗<color=#E78300>50</color>点能量，造成共计<color=#E78300>{2}</color>攻击力的暗属性伤害，命中时根据当前能量每点能量附加<color=#E78300>1%</color>攻击力的暗属性伤害。\n每次施放该技能或该衍生技能时，获得<color=#E78300>1</color>点<material=underline c=#FFFFFF h=2 event=terminology args=(119701)>「噩梦」</material>，<material=underline c=#FFFFFF h=2 event=terminology args=(119701)>「噩梦」</material>上限<color=#E78300>2</color>点。",
		maxLv = 60,
		type = 1,
		id = 101197201,
		extra_param = "",
		param = {
			{
				300,
				7.692,
				true,
				"%"
			},
			{
				400,
				10.256,
				true,
				"%"
			}
		}
	},
	[101197202] = {
		description = "造成共计<color=#E78300>{1}</color>攻击力的暗属性伤害，施放后的<color=#E78300>3</color>秒内，该技能会替换为衍生技能「白昼梦」。\n「白昼梦」：消耗<color=#E78300>50</color>点能量，造成共计<color=#E78300>{2}</color>攻击力的暗属性伤害，命中时根据消耗<material=underline c=#FFFFFF h=2 event=terminology args=(119702)>「甜梦」</material>点数获得的攻击力提高效果层数，每有<color=#E78300>1</color>层命中瞬间攻击力额外提高<color=#E78300>1%</color>。\n每次施放该技能或该衍生技能时，获得<color=#E78300>1</color>点<material=underline c=#FFFFFF h=2 event=terminology args=(119702)>「甜梦」</material>，<material=underline c=#FFFFFF h=2 event=terminology args=(119702)>「甜梦」</material>上限<color=#E78300>2</color>点。",
		maxLv = 60,
		type = 1,
		id = 101197202,
		extra_param = "",
		param = {
			{
				300,
				7.688,
				true,
				"%"
			},
			{
				400,
				10.252,
				true,
				"%"
			}
		}
	},
	[101197203] = {
		description = "点击触发造成共计<color=#E78300>{1}</color>攻击力的暗属性伤害，触发时依次消耗全部<material=underline c=#FFFFFF h=2 event=terminology args=(119701)>「噩梦」</material>、<material=underline c=#FFFFFF h=2 event=terminology args=(119702)>「甜梦」</material>点数获得不同的效果：\n<material=underline c=#FFFFFF h=2 event=terminology args=(119701)>「噩梦」</material>：根据消耗的点数，自身依次获得<color=#E78300>6、12</color>点能量；\n<material=underline c=#FFFFFF h=2 event=terminology args=(119702)>「甜梦」</material>：根据消耗的点数，获得对应点数的<material=underline c=#FFFFFF h=2 event=terminology args=(119701)>「噩梦」</material>，自身依次获得<color=#E78300>1、3</color>层攻击力提高效果，每有<color=#E78300>1</color>层攻击力提高<color=#E78300>1%</color>，持续<color=#E78300>{2}</color>秒，最多可叠加<color=#E78300>20</color>层。",
		maxLv = 60,
		type = 1,
		id = 101197203,
		extra_param = "",
		param = {
			{
				50,
				1.282,
				true,
				"%"
			},
			{
				12,
				0,
				false,
				""
			}
		}
	},
	[101197208] = {
		description = "操偶师·哈迪斯与梦影·俄尼里伊的连携奥义。\n操偶师·哈迪斯造成<color=#E78300>{1}+{2}</color>×<color=#297DE0>自身奥义等级</color>攻击力的暗属性伤害；施放时，自身每<color=#E78300>3</color>秒触发一次，神能回到<color=#E78300>50</color>点，持续<color=#E78300>12</color>秒；全队伍会心率提高<color=#E78300>{5}</color>、会心伤害提高<color=#E78300>{6}</color>，持续<color=#E78300>{7}</color>秒。\n梦影·俄尼里伊造成<color=#E78300>{3}+{4}</color>×<color=#297DE0>自身奥义等级</color>攻击力的暗属性伤害；自身进入或重置<material=underline c=#FFFFFF h=2 event=terminology args=(119703)>「幻梦」</material>状态。",
		maxLv = 60,
		type = 1,
		id = 101197208,
		extra_param = "",
		param = {
			{
				1200,
				0,
				false,
				"%"
			},
			{
				30.769,
				0,
				false,
				"%"
			},
			{
				800,
				0,
				false,
				"%"
			},
			{
				20.513,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			}
		}
	},
	[101197209] = {
		description = "进入或重置<material=underline c=#FFFFFF h=2 event=terminology args=(119703)>「幻梦」</material>状态。\n<material=underline c=#FFFFFF h=2 event=terminology args=(119703)>「幻梦」</material>：全队伍暗属性伤害提高<color=#E78300>{1}</color>；自身能量为满时，消耗等于能量上限值的能量，获得<material=underline c=#FFFFFF h=2 event=terminology args=(119704)>「幻梦沉眠」</material>，持续<color=#E78300>7</color>秒，退出或重置<material=underline c=#FFFFFF h=2 event=terminology args=(119703)>「幻梦」</material>时会立即结束<material=underline c=#FFFFFF h=2 event=terminology args=(119704)>「幻梦沉眠」</material>。\n<material=underline c=#FFFFFF h=2 event=terminology args=(119704)>「幻梦沉眠」</material>：全队伍暗属性攻击命中时，自身对命中的敌人附加暗属性抗性降低<color=#E78300>1%</color>，持续<color=#E78300>{2}</color>秒，最多可叠加<color=#E78300>25</color>层，并且自身对敌人附加<color=#E78300>{3}</color>攻击力的暗属性伤害。\n处于<material=underline c=#FFFFFF h=2 event=terminology args=(119703)>「幻梦」</material>状态时，「牛角门的醒梦」替换为「梦醒时分」，并且每<color=#E78300>4</color>秒自动触发一次「牛角门的醒梦」。\n「梦醒时分」：触发<material=underline c=#FFFFFF h=2 event=terminology args=(119705)>「梦醒」</material>，退出<material=underline c=#FFFFFF h=2 event=terminology args=(119703)>「幻梦」</material>状态，并造成共计<color=#E78300>{4}</color>攻击力的暗属性伤害。\n<material=underline c=#FFFFFF h=2 event=terminology args=(119705)>「梦醒」</material>：根据该次处于<material=underline c=#FFFFFF h=2 event=terminology args=(119703)>「幻梦」</material>状态期间全队伍暗属性攻击命中敌人次数，自身对锁定的敌人附加次数<color=#E78300>×20%</color>攻击力的暗属性伤害，最多计入<color=#E78300>150</color>次。\n\n自身或者队友施放奥义时，获得<color=#E78300>20%</color>的奥义值。",
		maxLv = 60,
		type = 1,
		id = 101197209,
		extra_param = "",
		param = {
			{
				50,
				0,
				false,
				"%"
			},
			{
				15,
				0,
				false,
				""
			},
			{
				30,
				0,
				false,
				"%"
			},
			{
				800,
				20.51,
				true,
				"%"
			}
		}
	},
	[101197305] = {
		description = "快速闪避敌人攻击，极限闪避会触发闪避效果。\n闪避效果：进入零时空间使全场敌人动作大幅减速，持续<color=#E78300>2</color>秒，获得<color=#E78300>2</color>点<material=underline c=#FFFFFF h=2 event=terminology args=(119701)>「噩梦」</material>、<color=#E78300>2</color>点<material=underline c=#FFFFFF h=2 event=terminology args=(119702)>「甜梦」</material>；闪避效果每<color=#E78300>{1}</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101197305,
		extra_param = "",
		param = {
			{
				20,
				0,
				false,
				""
			}
		}
	},
	[101199101] = {
		description = "连续挥动太刀斩击敌人，造成共计<color=#E78300>{1}</color>攻击力的雷属性伤害。\n\n<color=#297DE0>怒气：</color>普通攻击命中后会获得怒气。",
		maxLv = 60,
		type = 1,
		id = 101199101,
		extra_param = "",
		param = {
			{
				240,
				4.659,
				true,
				"%"
			}
		}
	},
	[101199201] = {
		description = "向前方突进一段距离并斩击沿途敌人，造成共计<color=#E78300>{1}</color>攻击力的雷属性伤害，对命中的敌人附加<material=underline c=#FFFFFF h=2 event=terminology args=(119901)>「雷殛之印」</material>。",
		maxLv = 60,
		type = 1,
		id = 101199201,
		extra_param = "",
		param = {
			{
				260,
				6.666,
				true,
				"%"
			}
		}
	},
	[101199202] = {
		description = "使用双刀对前方敌人进行连斩，造成共计<color=#E78300>{1}</color>攻击力的雷属性伤害，对命中的敌人附加<material=underline c=#FFFFFF h=2 event=terminology args=(119901)>「雷殛之印」</material>。",
		maxLv = 60,
		type = 1,
		id = 101199202,
		extra_param = "",
		param = {
			{
				320,
				8.205,
				true,
				"%"
			}
		}
	},
	[101199203] = {
		description = "使用拔刀术斩击前方敌人，命中处于<material=underline c=#FFFFFF h=2 event=terminology args=(119901)>「雷殛之印」</material>的敌人时，清除<material=underline c=#FFFFFF h=2 event=terminology args=(119901)>「雷殛之印」</material>并开启「雷殛·荒天」的下一式，「雷殛·荒天」共有三式，第三式施放时不会消耗怒气，也不会清除<material=underline c=#FFFFFF h=2 event=terminology args=(119901)>「雷殛之印」</material>。\n「雷殛·荒天」第一式：造成共计<color=#E78300>{1}</color>攻击力的雷属性伤害。\n「雷殛·荒天」第二式：造成共计<color=#E78300>{2}</color>攻击力的雷属性伤害。\n「雷殛·荒天」第三式：施放四道落雷，单次落雷造成<color=#E78300>{3}</color>攻击力的雷属性伤害，后续的落雷对同个敌人伤害依次衰减，对同个敌人最多造成<color=#E78300>2.8×{3}</color>攻击力的雷属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101199203,
		extra_param = "",
		param = {
			{
				250,
				6.41,
				true,
				"%"
			},
			{
				450,
				11.538,
				true,
				"%"
			},
			{
				600,
				15.384,
				true,
				"%"
			}
		}
	},
	[101199209] = {
		description = "对锁定的敌人突进并进行斩击，造成共计<color=#E78300>{1}</color>攻击力的雷属性伤害；施放时全队伍雷属性伤害提高<color=#E78300>{2}</color>，持续<color=#E78300>{3}</color>秒。\n\n自身或者队友触发零时空间时，获得<color=#E78300>15%</color>的奥义值，该效果每<color=#E78300>0.5</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101199209,
		extra_param = "",
		param = {
			{
				840,
				21.538,
				true,
				"%"
			},
			{
				30,
				0,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[101199305] = {
		description = "快速闪避敌人攻击，且可以连续施放二次闪避，极限闪避会触发闪避效果。极限闪避后点击普通攻击会施放技能攻击，造成共计<color=#E78300>{1}</color>攻击力的雷属性伤害。\n闪避效果：进入零时空间使全场敌人动作大幅减速，持续<color=#E78300>3</color>秒；该次点击普通攻击施放的技能攻击，会对命中的敌人附加<material=underline c=#FFFFFF h=2 event=terminology args=(119901)>「雷殛之印」</material>；闪避效果每<color=#E78300>{2}</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101199305,
		extra_param = "",
		param = {
			{
				134,
				3.46,
				true,
				"%"
			},
			{
				14,
				0,
				false,
				""
			}
		}
	},
	[101248101] = {
		description = "处于<material=underline c=#FFFFFF h=2 event=terminology args=(124801)>「束刃模式」</material>：\n前四段攻击造成共计<color=#E78300>{1}</color>攻击力的雷属性伤害；施放第四段普通攻击后，点击普通攻击会施放技能攻击「跃电斩」，在<color=#E78300>2.5</color>秒内可以连点普通攻击，每次造成<color=#E78300>{2}</color>攻击力的雷属性伤害；继续点击普通攻击会衔接普通攻击最后一段，造成共计<color=#E78300>{3}</color>攻击力的雷属性伤害，最后一段普通攻击施放后的短暂时间内，「必杀·掠雷轰击」替换为「必杀·掠雷闪袭」。\n处于<material=underline c=#FFFFFF h=2 event=terminology args=(124802)>「磁炮模式」</material>：\n造成<color=#E78300>{4}</color>攻击力的雷属性伤害，可通过长按进行最多<color=#E78300>3</color>段蓄力技能攻击，分别造成<color=#E78300>{5}、{6}、{7}</color>攻击力的雷属性伤害，施放蓄力攻击后的短暂时间内，「必杀·掠雷横扫」替换为「必杀·掠雷重击」。\n\n被动：\n出场时，恢复满怒气。\n处于<material=underline c=#FFFFFF h=2 event=terminology args=(124801)>「束刃模式」</material>时，技能伤害提高<color=#E78300>{8}</color>；处于<material=underline c=#FFFFFF h=2 event=terminology args=(124802)>「磁炮模式」</material>时，修正系数提高<color=#E78300>{9}</color>；切换形态时，技能伤害提高效果和修正系数提高效果会额外延长<color=#E78300>7</color>秒；出场时，从<material=underline c=#FFFFFF h=2 event=terminology args=(124802)>「磁炮模式」</material>切换为<material=underline c=#FFFFFF h=2 event=terminology args=(124801)>「束刃模式」</material>。\n<material=underline c=#FFFFFF h=2 event=terminology args=(124804)>「脉冲」</material>：处于<material=underline c=#FFFFFF h=2 event=terminology args=(124801)>「束刃模式」</material>时，点击普通攻击时会消耗该状态从「跃电斩」开始攻击；处于<material=underline c=#FFFFFF h=2 event=terminology args=(124802)>「磁炮模式」</material>时，下一次蓄力攻击会消耗该状态，从第<color=#E78300>3</color>段开始蓄力；切换形态时，<material=underline c=#FFFFFF h=2 event=terminology args=(124804)>「脉冲」</material>状态移除。\n普通攻击最后一段、满蓄力的蓄力攻击命中时，获得<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(124803)>「神威」</material>标记，<material=underline c=#FFFFFF h=2 event=terminology args=(124803)>「神威」</material>标记最多拥有<color=#E78300>5</color>个。\n\n<color=#297DE0>怒气：</color>普通攻击、「跃电斩」、蓄力攻击命中后会获得怒气。",
		maxLv = 60,
		type = 1,
		id = 101248101,
		extra_param = "",
		param = {
			{
				321,
				6.247,
				true,
				"%"
			},
			{
				100,
				2.564,
				true,
				"%"
			},
			{
				224,
				4.324,
				true,
				"%"
			},
			{
				62,
				1.201,
				true,
				"%"
			},
			{
				150,
				3.846,
				true,
				"%"
			},
			{
				400,
				10.256,
				true,
				"%"
			},
			{
				700,
				17.948,
				true,
				"%"
			},
			{
				12,
				0,
				false,
				"%"
			},
			{
				20,
				0,
				false,
				"%"
			}
		}
	},
	[101248201] = {
		description = "处于<material=underline c=#FFFFFF h=2 event=terminology args=(124801)>「束刃模式」</material>时，该技能替换为「必杀·掠雷轰击」；处于<material=underline c=#FFFFFF h=2 event=terminology args=(124802)>「磁炮模式」</material>时，该技能替换为「必杀·掠雷横扫」。\n「必杀·掠雷轰击」：切换为<material=underline c=#FFFFFF h=2 event=terminology args=(124802)>「磁炮模式」</material>，造成共计<color=#E78300>{1}</color>攻击力的雷属性伤害。\n「必杀·掠雷横扫」：切换为<material=underline c=#FFFFFF h=2 event=terminology args=(124801)>「束刃模式」</material>，造成共计<color=#E78300>{2}</color>攻击力的雷属性伤害。\n「必杀·掠雷闪袭」：切换为<material=underline c=#FFFFFF h=2 event=terminology args=(124802)>「磁炮模式」</material>，造成共计<color=#E78300>{3}</color>攻击力的雷属性伤害；施放时，获得<material=underline c=#FFFFFF h=2 event=terminology args=(124804)>「脉冲」</material>状态；命中时，获得<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(124803)>「神威」</material>标记。\n「必杀·掠雷重击」：切换为<material=underline c=#FFFFFF h=2 event=terminology args=(124801)>「束刃模式」</material>，造成共计<color=#E78300>{4}</color>攻击力的雷属性伤害；施放时，获得<material=underline c=#FFFFFF h=2 event=terminology args=(124804)>「脉冲」</material>状态；命中时，获得<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(124803)>「神威」</material>标记。",
		maxLv = 60,
		type = 1,
		id = 101248201,
		extra_param = "",
		param = {
			{
				300,
				7.692,
				true,
				"%"
			},
			{
				300,
				7.691,
				true,
				"%"
			},
			{
				500,
				12.819,
				true,
				"%"
			},
			{
				500,
				12.82,
				true,
				"%"
			}
		}
	},
	[101248202] = {
		description = "处于<material=underline c=#FFFFFF h=2 event=terminology args=(124801)>「束刃模式」</material>：\n造成共计<color=#E78300>{1}</color>攻击力的雷属性伤害，获得<material=underline c=#FFFFFF h=2 event=terminology args=(124804)>「脉冲」</material>状态；施放时会消耗最多<color=#E78300>3</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(124803)>「神威」</material>标记，每消耗<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(124803)>「神威」</material>标记，该技能的剩余冷却时间缩短<color=#E78300>2</color>秒。\n处于<material=underline c=#FFFFFF h=2 event=terminology args=(124802)>「磁炮模式」</material>：\n造成共计<color=#E78300>{2}</color>攻击力的雷属性伤害，获得<material=underline c=#FFFFFF h=2 event=terminology args=(124804)>「脉冲」</material>状态；施放时会消耗最多<color=#E78300>3</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(124803)>「神威」</material>标记，每消耗<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(124803)>「神威」</material>标记，该技能攻击命中瞬间修正系数提高<color=#E78300>12%</color>。",
		maxLv = 60,
		type = 1,
		id = 101248202,
		extra_param = "",
		param = {
			{
				1500,
				38.46,
				true,
				"%"
			},
			{
				1500,
				38.46,
				true,
				"%"
			}
		}
	},
	[101248203] = {
		description = "造成共计<color=#E78300>{1}</color>攻击力的雷属性伤害，获得<material=underline c=#FFFFFF h=2 event=terminology args=(124804)>「脉冲」</material>状态；施放时会消耗最多<color=#E78300>3</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(124803)>「神威」</material>标记，每消耗<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(124803)>「神威」</material>标记，最后一次攻击命中时，额外造成<color=#E78300>{2}</color>攻击力的雷属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101248203,
		extra_param = "",
		param = {
			{
				2000,
				51.28,
				true,
				"%"
			},
			{
				500,
				12.82,
				true,
				"%"
			}
		}
	},
	[101248208] = {
		description = "神威·前鬼坊天狗与轰雷·托尔的连携奥义。\n神威·前鬼坊天狗造成<color=#E78300>{1}+{2}</color>×<color=#297DE0>自身奥义等级</color>攻击力的雷属性伤害；命中时，全队伍会心伤害提高<color=#E78300>{5}</color>、护甲穿透提高<color=#E78300>{6}</color>，持续<color=#E78300>{7}</color>秒。\n轰雷·托尔造成<color=#E78300>{3}+{4}</color>×<color=#297DE0>自身奥义等级</color>攻击力的雷属性伤害；自身进入<material=underline c=#FFFFFF h=2 event=terminology args=(102803)>「怒雷」</material>状态，命中时全队伍技能伤害提高<color=#E78300>{8}</color>、雷属性伤害提高<color=#E78300>{9}</color>，持续<color=#E78300>{10}</color>秒。",
		maxLv = 60,
		type = 1,
		id = 101248208,
		extra_param = "",
		param = {
			{
				1000,
				50,
				true,
				"%"
			},
			{
				25.641,
				1.282,
				true,
				"%"
			},
			{
				1000,
				50,
				true,
				"%"
			},
			{
				25.641,
				1.282,
				true,
				"%"
			},
			{
				60,
				0,
				false,
				"%"
			},
			{
				20,
				0,
				false,
				"%"
			},
			{
				20,
				0,
				false,
				""
			},
			{
				30,
				0,
				false,
				"%"
			},
			{
				15,
				0,
				false,
				"%"
			},
			{
				20,
				0,
				false,
				""
			}
		}
	},
	[101248209] = {
		description = "造成共计<color=#E78300>{1}</color>攻击力的雷属性伤害；命中时，全队伍会心伤害提高<color=#E78300>{2}</color>、护甲穿透提高<color=#E78300>{3}</color>，持续<color=#E78300>{4}</color>秒；命中后，全队伍获得<color=#E78300>30</color>点怒气。\n\n自身或者队友触发零时空间时，获得<color=#E78300>15%</color>的奥义值，该效果每<color=#E78300>0.5</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101248209,
		extra_param = "",
		param = {
			{
				1000,
				25.641,
				true,
				"%"
			},
			{
				50,
				0,
				false,
				"%"
			},
			{
				20,
				0,
				false,
				"%"
			},
			{
				16,
				0,
				false,
				""
			}
		}
	},
	[101248305] = {
		description = "快速闪避敌人攻击，极限闪避会触发闪避效果。\n自身移动一段时间后，移动速度加快，直到进入<material=underline c=#FFFFFF h=2 event=terminology args=(124808)>「推进模式」</material>，可在移动中长按闪避立即进入<material=underline c=#FFFFFF h=2 event=terminology args=(124808)>「推进模式」</material>。\n<material=underline c=#FFFFFF h=2 event=terminology args=(124808)>「推进模式」</material>：每秒获得<color=#E78300>5</color>点怒气和恢复<color=#E78300>{1}</color>的生命值。\n闪避效果：进入零时空间使全场敌人动作大幅减速，持续<color=#E78300>3</color>秒；闪避效果每<color=#E78300>{2}</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101248305,
		extra_param = "",
		param = {
			{
				3,
				0,
				false,
				"%"
			},
			{
				20,
				0,
				false,
				""
			}
		}
	},
	[101284101] = {
		description = "造成共计<color=#E78300>{1}</color>攻击力的光属性伤害，不处于<material=underline c=#FFFFFF h=2 event=terminology args=(128402)>「裁断」</material>状态的普通攻击每次命中后获得<color=#E78300>1</color>点<material=underline c=#FFFFFF h=2 event=terminology args=(128401)>「破晓」</material>。\n\n被动：\n<material=underline c=#FFFFFF h=2 event=terminology args=(128401)>「破晓」</material>点数上限<color=#E78300>100</color>点。\n处于<material=underline c=#FFFFFF h=2 event=terminology args=(128402)>「裁断」</material>状态时，施放普通攻击第一段、第三段、第五段时，会唤出裁断之手攻击，分别造成共计<color=#E78300>{2}</color>、<color=#E78300>{3}</color>、<color=#E78300>{4}</color>攻击力的光属性伤害。\n\n<color=#297DE0>神能：</color>普通攻击命中后会获得神能。",
		maxLv = 60,
		type = 1,
		id = 101284101,
		extra_param = "",
		param = {
			{
				520,
				9.998,
				true,
				"%"
			},
			{
				250,
				6.41,
				true,
				"%"
			},
			{
				350,
				8.974,
				true,
				"%"
			},
			{
				450,
				11.538,
				true,
				"%"
			}
		}
	},
	[101284201] = {
		description = "造成共计<color=#E78300>{1}</color>攻击力的光属性伤害，施放时该技能会替换为「刹那」，不施放「刹那」短暂时间后，该技能会替换为「辉光」。\n「刹那」：造成共计<color=#E78300>{2}</color>攻击力的光属性伤害。\n「辉光」：造成共计<color=#E78300>{3}</color>攻击力的光属性伤害，施放时会消耗全部神能，每消耗<color=#E78300>1</color>点神能，该技能命中瞬间技能伤害提高<color=#E78300>0.3%</color>。\n不处于<material=underline c=#FFFFFF h=2 event=terminology args=(128402)>「裁断」</material>状态时，「刹那的辉光」命中后会获得共计<color=#E78300>9</color>点<material=underline c=#FFFFFF h=2 event=terminology args=(128401)>「破晓」</material>、「刹那」命中后会获得共计<color=#E78300>16</color>点<material=underline c=#FFFFFF h=2 event=terminology args=(128401)>「破晓」</material>、「辉光」命中后会获得共计<color=#E78300>9</color>点<material=underline c=#FFFFFF h=2 event=terminology args=(128401)>「破晓」</material>。\n\n<color=#297DE0>神能：</color>「刹那的辉光」、「刹那」每次命中后会获得神能。",
		maxLv = 60,
		type = 1,
		id = 101284201,
		extra_param = "",
		param = {
			{
				800,
				20.511,
				true,
				"%"
			},
			{
				1000,
				25.64,
				true,
				"%"
			},
			{
				900,
				23.076,
				true,
				"%"
			}
		}
	},
	[101284202] = {
		description = "造成共计<color=#E78300>{1}</color>攻击力的光属性伤害，施放时该技能会替换为「运升」，不施放「运升」短暂时间后，该技能会替换为「命咎」。\n「运升」：造成共计<color=#E78300>{2}</color>攻击力的光属性伤害。\n「命咎」：造成共计<color=#E78300>{3}</color>攻击力的光属性伤害，施放时会消耗全部神能，每消耗<color=#E78300>1</color>点神能，该技能命中瞬间技能伤害提高<color=#E78300>0.3%</color>。\n不处于<material=underline c=#FFFFFF h=2 event=terminology args=(128402)>「裁断」</material>状态时，「命运的涟漪」命中后会获得共计<color=#E78300>10</color>点<material=underline c=#FFFFFF h=2 event=terminology args=(128401)>「破晓」</material>、「运升」命中后会获得共计<color=#E78300>16</color>点<material=underline c=#FFFFFF h=2 event=terminology args=(128401)>「破晓」</material>、「命咎」命中后会获得共计<color=#E78300>10</color>点<material=underline c=#FFFFFF h=2 event=terminology args=(128401)>「破晓」</material>。\n\n<color=#297DE0>神能：</color>「命运的涟漪」、「运升」每次命中后会获得神能。",
		maxLv = 60,
		type = 1,
		id = 101284202,
		extra_param = "",
		param = {
			{
				800,
				20.51,
				true,
				"%"
			},
			{
				1000,
				25.64,
				true,
				"%"
			},
			{
				900,
				23.075,
				true,
				"%"
			}
		}
	},
	[101284203] = {
		description = "<material=underline c=#FFFFFF h=2 event=terminology args=(128401)>「破晓」</material>点数为满时才可施放，造成共计<color=#E78300>{1}</color>攻击力的光属性伤害，进入<material=underline c=#FFFFFF h=2 event=terminology args=(128402)>「裁断」</material>状态，重置「刹那的辉光」、「命运的涟漪」的冷却时间。\n<material=underline c=#FFFFFF h=2 event=terminology args=(128402)>「裁断」</material>：每<color=#E78300>0.15</color>秒会自动消耗<color=#E78300>1</color>点<material=underline c=#FFFFFF h=2 event=terminology args=(128401)>「破晓」</material>，当<material=underline c=#FFFFFF h=2 event=terminology args=(128401)>「破晓」</material>点数为<color=#E78300>0</color>点时，退出<material=underline c=#FFFFFF h=2 event=terminology args=(128402)>「裁断」</material>状态；状态期间内，施放「刹那」、「辉光」、「运升」、「命咎」时会唤出裁断之手攻击，分别造成<color=#E78300>{2}</color>、<color=#E78300>{3}</color>、<color=#E78300>{4}</color>、<color=#E78300>{5}</color>攻击力的光属性伤害。\n施放「辉光」、「命咎」时，「裁断的剑印」会替换为「炽光的剑印」，可以衔接施放「炽光的剑印」，造成共计<color=#E78300>{6}</color>攻击力的光属性伤害。",
		maxLv = 60,
		type = 1,
		id = 101284203,
		extra_param = "",
		param = {
			{
				1200,
				30.768,
				true,
				"%"
			},
			{
				300,
				7.692,
				true,
				"%"
			},
			{
				300,
				7.691,
				true,
				"%"
			},
			{
				300,
				7.692,
				true,
				"%"
			},
			{
				300,
				7.692,
				true,
				"%"
			},
			{
				600,
				15.38,
				true,
				"%"
			}
		}
	},
	[101284208] = {
		description = "黯耀·薇儿丹蒂与黎幻·赫拉的连携奥义。\n黯耀·薇儿丹蒂造成<color=#E78300>{1}+{2}</color>×<color=#297DE0>自身奥义等级</color>攻击力的光属性伤害；命中时全队伍光属性伤害提高<color=#E78300>{3}</color>，持续<color=#E78300>{4}</color>秒；该次奥义攻击修正系数提高<color=#E78300>{5}</color>。\n黎幻·赫拉给全队伍施加伤害提高<color=#E78300>14%+0.4%</color>×<color=#297DE0>自身奥义等级</color>，持续<color=#E78300>{6}</color>秒，<color=#E78300>12</color>秒内返还全队伍下一次消耗的所有机制值；黯耀·薇儿丹蒂的会心率提高<color=#E78300>{7}</color>，持续<color=#E78300>{8}</color>秒。",
		maxLv = 60,
		type = 1,
		id = 101284208,
		extra_param = "",
		param = {
			{
				2000,
				0,
				false,
				"%"
			},
			{
				51.282,
				0,
				false,
				"%"
			},
			{
				30,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			},
			{
				120,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			},
			{
				20,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			}
		}
	},
	[101284209] = {
		description = "造成共计<color=#E78300>{1}</color>攻击力的光属性伤害；命中时全队伍光属性伤害提高<color=#E78300>{2}</color>，持续<color=#E78300>{3}</color>秒；该次奥义攻击修正系数提高<color=#E78300>{4}</color>。\n\n自身或者队友触发零时空间时，获得<color=#E78300>15%</color>的奥义值，该效果每<color=#E78300>0.5</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101284209,
		extra_param = "",
		param = {
			{
				1000,
				25.64,
				true,
				"%"
			},
			{
				30,
				0,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				""
			},
			{
				120,
				0,
				false,
				"%"
			}
		}
	},
	[101284305] = {
		description = "移动闪避敌人攻击，极限闪避会触发闪避效果。非移动闪避时，会举剑格挡，成功格挡后可以点击普通攻击施放反击，造成共计<color=#E78300>{1}</color>攻击力的光属性伤害；每次施放反击命中时「刹那的辉光」、「命运的涟漪」的剩余冷却时间缩短<color=#E78300>1</color>秒；反击每次命中后获得<color=#E78300>5</color>点神能；闪避效果不处于冷却状态时，反击命中时也会触发闪避效果，之后闪避效果进入冷却。\n闪避效果：进入零时空间使全场敌人动作大幅减速，持续<color=#E78300>2</color>秒；闪避效果每<color=#E78300>{2}</color>秒最多触发一次。",
		maxLv = 60,
		type = 1,
		id = 101284305,
		extra_param = "",
		param = {
			{
				600,
				15.383,
				true,
				"%"
			},
			{
				20,
				0,
				false,
				""
			}
		}
	},
	[106087101] = {
		description = "站定发射慢速大型水弹，命中敌人产生范围伤害。需要消耗水量。",
		maxLv = 60,
		type = 1,
		id = 106087101,
		extra_param = "",
		param = {}
	},
	[106087201] = {
		description = "站定后连续发射追踪弹幕。需要消耗水量。",
		maxLv = 60,
		type = 1,
		id = 106087201,
		extra_param = "",
		param = {}
	},
	[106087202] = {
		description = "防反成功时向被攻击方向发射水弹，命中后爆炸产生小型水弹。防反成功时回复大量水量和奥义能量。需要消耗水量。",
		maxLv = 60,
		type = 1,
		id = 106087202,
		extra_param = "",
		param = {}
	},
	[106087209] = {
		description = "蓄力后开炮发射慢速大型水弹，命中敌人后爆炸产生多颗小型水弹。",
		maxLv = 60,
		type = 1,
		id = 106087209,
		extra_param = "",
		param = {}
	},
	[106088101] = {
		description = "使用冲锋枪连续发射水弹。需要消耗水量。",
		maxLv = 60,
		type = 1,
		id = 106088101,
		extra_param = "",
		param = {}
	},
	[106088201] = {
		description = "在前方一定距离召唤一个小型回复法阵，阵内友方每隔一段时间对阵内友方单位施加回复效果。需要消耗水量。",
		maxLv = 60,
		type = 1,
		id = 106088201,
		extra_param = "",
		param = {}
	},
	[106088202] = {
		description = "防反后，自动生成子弹攻击。防反成功时回复大量水量和奥义能量。需要消耗水量。",
		maxLv = 60,
		type = 1,
		id = 106088202,
		extra_param = "",
		param = {}
	},
	[106088209] = {
		description = "释放后对全体施加回复效果，并在一段时间内提升攻击力。金乌自身进入强化状态，攻击时额外发射多枚小型水弹。",
		maxLv = 60,
		type = 1,
		id = 106088209,
		extra_param = "",
		param = {}
	},
	[106089101] = {
		description = "使用霰弹枪对近距离敌人造成范围伤害。并给自身增加短时间的护盾。需要消耗水量。",
		maxLv = 60,
		type = 1,
		id = 106089101,
		extra_param = "",
		param = {}
	},
	[106089201] = {
		description = "释放一个漩涡持续吸引敌人。需要消耗水量。",
		maxLv = 60,
		type = 1,
		id = 106089201,
		extra_param = "",
		param = {}
	},
	[106089202] = {
		description = "防反比其他角色更容易触发。防反成功后，以自身为圆心产生范围伤害，并为自己添加护盾。防反成功时回复大量水量和奥义能量。需要消耗水量。",
		maxLv = 60,
		type = 1,
		id = 106089202,
		extra_param = "",
		param = {}
	},
	[106089209] = {
		description = "在前方制造冰山造成一次范围伤害。释放后我方全体在一段时间内防御力提升，且这段时间内我方全体成功防反或闪避恢复的水增多一倍。为友方全体添加护盾。",
		maxLv = 60,
		type = 1,
		id = 106089209,
		extra_param = "",
		param = {}
	},
	[106090101] = {
		description = "站定架枪射击，发射穿透射线。需要消耗水量。",
		maxLv = 60,
		type = 1,
		id = 106090101,
		extra_param = "",
		param = {}
	},
	[106090201] = {
		description = "人偶出现在哈迪斯身边造成范围伤害，同时哈迪斯架枪射击一次。需要消耗水量。",
		maxLv = 60,
		type = 1,
		id = 106090201,
		extra_param = "",
		param = {}
	},
	[106090202] = {
		description = "防反成功时向被攻击方向发射穿透射线，造成高额伤害。防反成功时回复大量水量和奥义能量。需要消耗水量。",
		maxLv = 60,
		type = 1,
		id = 106090202,
		extra_param = "",
		param = {}
	},
	[106090209] = {
		description = "跳起向前狙击，造成高额范围伤害。",
		maxLv = 60,
		type = 1,
		id = 106090209,
		extra_param = "",
		param = {}
	},
	[106110101] = {
		description = "在小节的第四拍输入，完成整个小节。",
		maxLv = 60,
		type = 1,
		id = 106110101,
		extra_param = "",
		param = {}
	},
	[106110201] = {
		description = "成功输入「音符 · 白闪」将击倒对应节拍的金色音符怪物并造成伤害，完美输入时造成暴击伤害。一小节包含两个或以上「音符 · 白闪」时，下次输入「音符 · 白闪」必定为完美判定并在第四拍进行一次追击。",
		maxLv = 60,
		type = 1,
		id = 106110201,
		extra_param = "",
		param = {}
	},
	[106110202] = {
		description = "成功输入「音符 · 霜花」将击倒对应节拍的红色音符怪物并造成伤害，完美输入时造成暴击伤害。一小节包含两个或以上「音符 · 霜花」时，下次输入「音符 · 霜花」必定为完美判定并在第四拍进行一次追击。",
		maxLv = 60,
		type = 1,
		id = 106110202,
		extra_param = "",
		param = {}
	},
	[106110203] = {
		description = "成功输入「音符 · 凛冽」将击倒对应节拍的蓝色音符怪物并造成伤害，完美输入时造成暴击伤害。一小节包含两个或以上「音符 · 凛冽」时，下次输入「音符 · 凛冽」必定为完美判定并在第四拍进行一次追击。",
		maxLv = 60,
		type = 1,
		id = 106110203,
		extra_param = "",
		param = {}
	},
	[106110209] = {
		description = "成功完成音符输入时，伊邪那美会积累变奏能量。当错误输入时，变奏能量将会降低。变奏能量积累到达满值后进入「变奏 · 羁绊回声」，每次进行追击时<material=underline c=#FFFFFF h=2 event=terminology args=(104903)>「日狭女」</material>将伴随伊邪那美一同进行攻击。",
		maxLv = 60,
		type = 1,
		id = 106110209,
		extra_param = "",
		param = {}
	},
	[106117101] = {
		description = "文案预留",
		maxLv = 60,
		type = 1,
		id = 106117101,
		extra_param = "",
		param = {}
	},
	[106117202] = {
		description = "文案预留",
		maxLv = 60,
		type = 1,
		id = 106117202,
		extra_param = "",
		param = {}
	},
	[109049201] = {
		description = "直接开始推动一枚大雪球。如果使用技能时已经在推动雪球的状态中，则将直接推出一枚大雪球。",
		maxLv = 60,
		type = 1,
		id = 109049201,
		extra_param = "",
		param = {}
	},
	[109049202] = {
		description = "开始正常推动雪球，推出该雪球时将额外推出两个同等大小的雪球。如果使用技能时已经在推动雪球的状态中，则将直接推出三枚雪球。",
		maxLv = 60,
		type = 1,
		id = 109049202,
		extra_param = "",
		param = {}
	},
	[109049203] = {
		description = "进入大型雪球之中，持续造成碾压效果。当持续时间结束，大雪球将分裂为四个大型雪球。",
		maxLv = 60,
		type = 1,
		id = 109049203,
		extra_param = "",
		param = {}
	},
	[109049204] = {
		description = "大雪人技能一：在场地内随机位置召唤一阵暴风雪，持续对范围内的敌人造成伤害。",
		maxLv = 60,
		type = 1,
		id = 109049204,
		extra_param = "",
		param = {}
	},
	[109049205] = {
		description = "大雪人技能二：制造坚硬的冰霜护盾包围自身。持续时间内受到的伤害减少50%。",
		maxLv = 60,
		type = 1,
		id = 109049205,
		extra_param = "",
		param = {}
	},
	[109049206] = {
		description = "大雪人技能三：在场地内制造逐渐碰撞爆炸的雪球，对敌人造成伤害和击退。",
		maxLv = 60,
		type = 1,
		id = 109049206,
		extra_param = "",
		param = {}
	},
	[109055201] = {
		description = "直接开始推动一枚大雪球。如果使用技能时已经在推动雪球的状态中，则将直接推出一枚大雪球。",
		maxLv = 60,
		type = 1,
		id = 109055201,
		extra_param = "",
		param = {}
	},
	[109055202] = {
		description = "开始正常推动雪球，推出该雪球时将额外推出两个同等大小的雪球。如果使用技能时已经在推动雪球的状态中，则将直接推出三枚雪球。",
		maxLv = 60,
		type = 1,
		id = 109055202,
		extra_param = "",
		param = {}
	},
	[109055203] = {
		description = "进入大型雪球之中，持续造成碾压效果。当持续时间结束，大雪球将分裂为四个大型雪球。",
		maxLv = 60,
		type = 1,
		id = 109055203,
		extra_param = "",
		param = {}
	},
	[109055204] = {
		description = "大雪人技能一：在场地内随机位置召唤一阵暴风雪，持续对范围内的敌人造成伤害。",
		maxLv = 60,
		type = 1,
		id = 109055204,
		extra_param = "",
		param = {}
	},
	[109055205] = {
		description = "大雪人技能二：制造坚硬的冰霜护盾包围自身。持续时间内受到的伤害减少50%。",
		maxLv = 60,
		type = 1,
		id = 109055205,
		extra_param = "",
		param = {}
	},
	[109055206] = {
		description = "大雪人技能三：在场地内制造逐渐碰撞爆炸的雪球，对敌人造成伤害和击退。",
		maxLv = 60,
		type = 1,
		id = 109055206,
		extra_param = "",
		param = {}
	},
	[109060201] = {
		description = "直接开始推动一枚大雪球。如果使用技能时已经在推动雪球的状态中，则将直接推出一枚大雪球。",
		maxLv = 60,
		type = 1,
		id = 109060201,
		extra_param = "",
		param = {}
	},
	[109060202] = {
		description = "开始正常推动雪球，推出该雪球时将额外推出两个同等大小的雪球。如果使用技能时已经在推动雪球的状态中，则将直接推出三枚雪球。",
		maxLv = 60,
		type = 1,
		id = 109060202,
		extra_param = "",
		param = {}
	},
	[109060203] = {
		description = "进入大型雪球之中，持续造成碾压效果。当持续时间结束，大雪球将分裂为四个大型雪球。",
		maxLv = 60,
		type = 1,
		id = 109060203,
		extra_param = "",
		param = {}
	},
	[109060204] = {
		description = "大雪人技能一：在场地内随机位置召唤一阵暴风雪，持续对范围内的敌人造成伤害。",
		maxLv = 60,
		type = 1,
		id = 109060204,
		extra_param = "",
		param = {}
	},
	[109060205] = {
		description = "大雪人技能二：制造坚硬的冰霜护盾包围自身。持续时间内受到的伤害减少50%。",
		maxLv = 60,
		type = 1,
		id = 109060205,
		extra_param = "",
		param = {}
	},
	[109060206] = {
		description = "大雪人技能三：在场地内制造逐渐碰撞爆炸的雪球，对敌人造成伤害和击退。",
		maxLv = 60,
		type = 1,
		id = 109060206,
		extra_param = "",
		param = {}
	},
	[109061201] = {
		description = "直接开始推动一枚大雪球。如果使用技能时已经在推动雪球的状态中，则将直接推出一枚大雪球。",
		maxLv = 60,
		type = 1,
		id = 109061201,
		extra_param = "",
		param = {}
	},
	[109061202] = {
		description = "开始正常推动雪球，推出该雪球时将额外推出两个同等大小的雪球。如果使用技能时已经在推动雪球的状态中，则将直接推出三枚雪球。",
		maxLv = 60,
		type = 1,
		id = 109061202,
		extra_param = "",
		param = {}
	},
	[109061203] = {
		description = "进入大型雪球之中，持续造成碾压效果。当持续时间结束，大雪球将分裂为四个大型雪球。",
		maxLv = 60,
		type = 1,
		id = 109061203,
		extra_param = "",
		param = {}
	},
	[109061204] = {
		description = "大雪人技能一：在场地内随机位置召唤一阵暴风雪，持续对范围内的敌人造成伤害。",
		maxLv = 60,
		type = 1,
		id = 109061204,
		extra_param = "",
		param = {}
	},
	[109061205] = {
		description = "大雪人技能二：制造坚硬的冰霜护盾包围自身。持续时间内受到的伤害减少50%。",
		maxLv = 60,
		type = 1,
		id = 109061205,
		extra_param = "",
		param = {}
	},
	[109061206] = {
		description = "大雪人技能三：在场地内制造逐渐碰撞爆炸的雪球，对敌人造成伤害和击退。",
		maxLv = 60,
		type = 1,
		id = 109061206,
		extra_param = "",
		param = {}
	},
	[110110011] = {
		description = "「冥海涟漪」可充能<color=#E78300>2</color>次。",
		maxLv = 1,
		type = 1,
		id = 110110011,
		extra_param = "",
		param = {}
	},
	[110110012] = {
		description = "出场时，生命值扣除至生命值上限的<color=#E78300>50%</color>。\n当生命值低于<color=#E78300>50%</color>时，每<color=#E78300>3</color>秒恢复一次生命值，生命值每比<color=#E78300>50%</color>低<color=#E78300>1%</color>恢复<color=#E78300>0.4%</color>的生命值。",
		maxLv = 1,
		type = 1,
		id = 110110012,
		extra_param = "",
		param = {}
	},
	[110110013] = {
		description = "在施放普通攻击第一段或第二段后衔接「禁忌灾刃」，会改变「禁忌灾刃」的攻击模式。\n「禁忌灾刃」：造成共计<color=#E78300>{1}</color>（技能一每提升一级<color=#E78300>+{2}</color>）攻击力的物理属性伤害，自身生命值越少，「禁忌灾刃」命中瞬间伤害提高越高，该效果提供的伤害提高最高为<color=#E78300>150%</color>。",
		maxLv = 1,
		type = 1,
		id = 110110013,
		extra_param = "",
		param = {
			{
				210,
				5.381,
				true,
				"%"
			},
			{
				5.385,
				0.138,
				true,
				"%"
			}
		}
	},
	[110110021] = {
		description = "「断罪之镰」的冷却时间缩短<color=#E78300>11</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110110021,
		extra_param = "",
		param = {}
	},
	[110110022] = {
		description = "「断罪之镰」命中后，恢复<color=#E78300>{1}</color>的生命值，每次施放最多触发一次。",
		maxLv = 1,
		type = 1,
		id = 110110022,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			}
		}
	},
	[110110023] = {
		description = "在施放普通攻击第三段或第四段后衔接「禁忌灾刃」，会改变「禁忌灾刃」的攻击模式。\n「禁忌灾刃」：造成共计<color=#E78300>{1}</color>（技能一每提升一级<color=#E78300>+{2}</color>）攻击力的物理属性伤害，「禁忌灾刃」会小范围聚集敌人，命中时额外获得<color=#E78300>{3}</color>个印记。",
		maxLv = 1,
		type = 1,
		id = 110110023,
		extra_param = "",
		param = {
			{
				180,
				4.613,
				true,
				"%"
			},
			{
				4.615,
				0.118,
				true,
				"%"
			},
			{
				2,
				0,
				false,
				""
			}
		}
	},
	[110110031] = {
		description = "「禁忌灾刃」的修正系数提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 110110031,
		extra_param = "",
		param = {
			{
				100,
				0,
				false,
				"%"
			}
		}
	},
	[110110032] = {
		description = "进入修正模式时，敌人生命值越多自身物理属性伤害提高越高，持续至退出修正模式，该效果提供的物理属性伤害提高最高为<color=#E78300>80%</color>。",
		maxLv = 1,
		type = 1,
		id = 110110032,
		extra_param = "",
		param = {}
	},
	[110110033] = {
		description = "在施放「狱镰回旋」后衔接「禁忌灾刃」，会改变「禁忌灾刃」的攻击模式。\n「禁忌灾刃」：造成共计<color=#E78300>{1}</color>（技能一每提升一级<color=#E78300>+{2}</color>）攻击力的物理属性伤害，命中时对敌人附加物理属性抗性降低<color=#E78300>{3}</color>，持续<color=#E78300>{4}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110110033,
		extra_param = "",
		param = {
			{
				160,
				4.101,
				true,
				"%"
			},
			{
				4.103,
				0.105,
				true,
				"%"
			},
			{
				40,
				0,
				false,
				"%"
			},
			{
				3,
				0,
				false,
				""
			}
		}
	},
	[110130011] = {
		description = "每次进入<material=underline c=#FFFFFF h=2 event=terminology args=(101301)>「缚炎」</material>状态时，获得<color=#E78300>{1}</color>点能量。",
		maxLv = 1,
		type = 1,
		id = 110130011,
		extra_param = "",
		param = {
			{
				12,
				0,
				false,
				""
			}
		}
	},
	[110130012] = {
		description = "处于<material=underline c=#FFFFFF h=2 event=terminology args=(101301)>「缚炎」</material>状态时，普通攻击每命中敌人<color=#E78300>3</color>次，获得<color=#E78300>{1}</color>点能量。",
		maxLv = 1,
		type = 1,
		id = 110130012,
		extra_param = "",
		param = {
			{
				4,
				0,
				false,
				""
			}
		}
	},
	[110130013] = {
		description = "施放「虚炎行空」时，根据当前能量的<color=#E78300>50%</color>，每有<color=#E78300>1</color>点能量，获得<color=#E78300>1</color>层技能伤害提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒，最多可叠加<color=#E78300>100</color>层，并消耗<color=#E78300>50%</color>当前能量。",
		maxLv = 1,
		type = 1,
		id = 110130013,
		extra_param = "",
		param = {
			{
				2,
				2,
				true,
				"%"
			},
			{
				6,
				0,
				false,
				""
			}
		}
	},
	[110130021] = {
		description = "「咫尺天威」造成会心后自身会心率提高，自身每有<color=#E78300>1%</color>火属性伤害，自身会心率提高<color=#E78300>0.6%</color>，持续<color=#E78300>5</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110130021,
		extra_param = "",
		param = {}
	},
	[110130022] = {
		description = "「浮屠困囚」对束缚的敌人附加会心抗性降低，自身每有<color=#E78300>1%</color>会心率，敌人的会心抗性降低<color=#E78300>0.3%</color>，持续<color=#E78300>4</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110130022,
		extra_param = "",
		param = {}
	},
	[110130023] = {
		description = "自身攻击造成会心后，会心伤害提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒，最多可叠加<color=#E78300>5</color>层；通过神格「修罗战界·道摄」获得的会心伤害提高效果在施放「擎天撼地」命中瞬间效果提高<color=#E78300>100%</color>。",
		maxLv = 1,
		type = 1,
		id = 110130023,
		extra_param = "",
		param = {
			{
				8,
				8,
				true,
				"%"
			},
			{
				6,
				0,
				false,
				""
			}
		}
	},
	[110130031] = {
		description = "<material=underline c=#FFFFFF h=2 event=terminology args=(101301)>「缚炎」</material>状态的火属性伤害提高效果改变为<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 110130031,
		extra_param = "",
		param = {
			{
				45,
				0,
				false,
				"%"
			}
		}
	},
	[110130032] = {
		description = "处于<material=underline c=#FFFFFF h=2 event=terminology args=(101301)>「缚炎」</material>状态再次进入<material=underline c=#FFFFFF h=2 event=terminology args=(101301)>「缚炎」</material>状态时，改变为当前<material=underline c=#FFFFFF h=2 event=terminology args=(101301)>「缚炎」</material>状态持续时间延长<color=#E78300>4</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110130032,
		extra_param = "",
		param = {}
	},
	[110130033] = {
		description = "延长<material=underline c=#FFFFFF h=2 event=terminology args=(101301)>「缚炎」</material>状态时，自身火属性伤害额外提高<color=#E78300>45%</color>，最多可叠加<color=#E78300>2</color>层。",
		maxLv = 1,
		type = 1,
		id = 110130033,
		extra_param = "",
		param = {}
	},
	[110150011] = {
		description = "「狂狮锯齿」、「锯刃轮舞」命中时对敌人附加破甲状态，防御力降低<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110150011,
		extra_param = "",
		param = {
			{
				15,
				0,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[110150012] = {
		description = "神能上限增加<color=#E78300>25</color>点。",
		maxLv = 1,
		type = 1,
		id = 110150012,
		extra_param = "",
		param = {}
	},
	[110150013] = {
		description = "<material=underline c=#FFFFFF h=2 event=terminology args=(101502)>「潜能解放」</material>不再给全队伍附加，目标改变为我方攻击力最高的物理属性修正者，并且改变为以下效果：\n物理属性伤害提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒；\n会心伤害提高<color=#E78300>{3}</color>，持续<color=#E78300>{4}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110150013,
		extra_param = "",
		param = {
			{
				30,
				0,
				false,
				"%"
			},
			{
				15,
				0,
				false,
				""
			},
			{
				70,
				0,
				false,
				"%"
			},
			{
				15,
				0,
				false,
				""
			}
		}
	},
	[110150021] = {
		description = "「狂狮逐猎」命中时，自身攻击力提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110150021,
		extra_param = "",
		param = {
			{
				15,
				0,
				false,
				"%"
			},
			{
				15,
				0,
				false,
				""
			}
		}
	},
	[110150022] = {
		description = "「刃爪噬敌」每段攻击命中时，自身会心率提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒，最多可叠加<color=#E78300>6</color>层。",
		maxLv = 1,
		type = 1,
		id = 110150022,
		extra_param = "",
		param = {
			{
				4,
				4,
				true,
				"%"
			},
			{
				5,
				0,
				false,
				""
			}
		}
	},
	[110150023] = {
		description = "「锯刃撼地」的冷却时间缩短<color=#E78300>3</color>秒。\n「狂狮逐猎」命中后「狂狮逐猎」、「锯刃撼地」不再替换为「狂狮锯齿」、「锯刃轮舞」。\n当自身前方小范围存在敌人时，施放「狂狮逐猎」时会改变攻击模式，造成共计<color=#E78300>{1}</color>（技能一每提升一级<color=#E78300>+{2}</color>）攻击力的物理属性伤害，施放时获得短暂的霸体效果并可以格挡受到的伤害，成功格挡伤害时，神能恢复至满值；「狂狮逐猎」成功格挡伤害时，该技能的剩余冷却时间缩短<color=#E78300>50%</color>，重置「刃爪噬敌」的冷却时间。\n施放「锯刃撼地」、「刃爪噬敌」时可以再次点击施放「锯刃撼地」最后一段提前打断攻击动作，造成共计<color=#E78300>{3}</color>（技能二每提升一级<color=#E78300>+{4}</color>）攻击力的物理属性伤害，施放「锯刃撼地」最后一段时获得短暂的霸体效果并可以格挡受到的伤害，成功格挡伤害时，重置「狂狮逐猎」的冷却时间。\n「刃爪噬敌」可以打断「锯刃撼地」的持续攻击动作。\n「噬敌利爪」命中瞬间会心伤害提高<color=#E78300>{5}</color>；施放「噬敌利爪」时不再挥出三道锯齿而是改变为挥出旋转的锯齿，造成共计<color=#E78300>{6}</color>（技能三每提升一级<color=#E78300>+{7}</color>）攻击力的物理属性伤害。",
		maxLv = 1,
		type = 1,
		id = 110150023,
		extra_param = "",
		param = {
			{
				150,
				3.846,
				true,
				"%"
			},
			{
				3.846,
				0.099,
				true,
				"%"
			},
			{
				200,
				5.128,
				true,
				"%"
			},
			{
				5.128,
				0.131,
				true,
				"%"
			},
			{
				30,
				0,
				false,
				"%"
			},
			{
				2100,
				53.841,
				true,
				"%"
			},
			{
				53.846,
				1.381,
				true,
				"%"
			}
		}
	},
	[110150031] = {
		description = "「狂狮锯齿」、「锯刃轮舞」命中瞬间技能伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 110150031,
		extra_param = "",
		param = {
			{
				20,
				0,
				false,
				"%"
			}
		}
	},
	[110150032] = {
		description = "「狂狮逐猎」的冷却时间缩短<color=#E78300>2</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110150032,
		extra_param = "",
		param = {}
	},
	[110150033] = {
		description = "「狂狮逐猎」命中时对敌人附加破甲状态，防御力降低<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒。\n施放「锯刃撼地」时会聚集周围的敌人。",
		maxLv = 1,
		type = 1,
		id = 110150033,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			},
			{
				6,
				0,
				false,
				""
			}
		}
	},
	[110160011] = {
		description = "<material=underline c=#FFFFFF h=2 event=terminology args=(101601)>「压力槽」</material>标记上限增加<color=#E78300>2</color>个。",
		maxLv = 1,
		type = 1,
		id = 110160011,
		extra_param = "",
		param = {}
	},
	[110160012] = {
		description = "「爆压碎裂斩」可以在普通攻击任意一段后衔接施放。",
		maxLv = 1,
		type = 1,
		id = 110160012,
		extra_param = "",
		param = {}
	},
	[110160013] = {
		description = "「爆压碎裂斩」前段会获得短暂的霸体状态，可格挡敌人伤害；成功格挡敌人伤害时，会心率提高<color=#E78300>{1}</color>、会心伤害提高<color=#E78300>{2}</color>，持续<color=#E78300>{3}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110160013,
		extra_param = "",
		param = {
			{
				15,
				0,
				false,
				"%"
			},
			{
				35,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			}
		}
	},
	[110160021] = {
		description = "施放「高压回旋斩」也会进入<material=underline c=#FFFFFF h=2 event=terminology args=(101603)>「超频电锯模式」</material>，通过这种途径进入的<material=underline c=#FFFFFF h=2 event=terminology args=(101603)>「超频电锯模式」</material>最多持续<color=#E78300>7</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110160021,
		extra_param = "",
		param = {}
	},
	[110160022] = {
		description = "<material=underline c=#FFFFFF h=2 event=terminology args=(101603)>「超频电锯模式」</material>的攻击也可以获得神能。",
		maxLv = 1,
		type = 1,
		id = 110160022,
		extra_param = "",
		param = {}
	},
	[110160023] = {
		description = "<material=underline c=#FFFFFF h=2 event=terminology args=(101603)>「超频电锯模式」</material>的攻击命中时，对命中的敌人附加物理属性抗性降低<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110160023,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			},
			{
				7,
				0,
				false,
				""
			}
		}
	},
	[110160031] = {
		description = "施放「高压回旋斩」消耗<material=underline c=#FFFFFF h=2 event=terminology args=(101601)>「压力槽」</material>时，每消耗<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(101601)>「压力槽」</material>标记，获得<color=#E78300>25</color>点神能。",
		maxLv = 1,
		type = 1,
		id = 110160031,
		extra_param = "",
		param = {}
	},
	[110160032] = {
		description = "「突击战术」、「攻坚战术」的电锯模式或者「歼灭战术」的长按攻击命中时，对命中的敌人附加破甲状态，防御力降低<color=#E78300>{1}</color>，每个<material=underline c=#FFFFFF h=2 event=terminology args=(101601)>「压力槽」</material>标记破甲额外提供防御力降低<color=#E78300>2.5%</color>，持续<color=#E78300>{2}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110160032,
		extra_param = "",
		param = {
			{
				10,
				2.5,
				true,
				"%"
			},
			{
				7,
				0,
				false,
				""
			}
		}
	},
	[110160033] = {
		description = "「突击战术」、「攻坚战术」的电锯模式消耗神能时该次攻击的最后一段命中瞬间技能伤害提高，每消耗<color=#E78300>25</color>点神能，命中瞬间技能伤害提高<color=#E78300>{1}</color>，该效果提供的技能伤害提高最高为<color=#E78300>120%</color>。",
		maxLv = 1,
		type = 1,
		id = 110160033,
		extra_param = "",
		param = {
			{
				20,
				20,
				true,
				"%"
			}
		}
	},
	[110170011] = {
		description = "「战神的处决」的基础伤害提高<color=#E78300>{2}</color>。「猫神的愚弄」会对锁定的敌人附加<material=underline c=#FFFFFF h=2 event=terminology args=(101702)>「月痕标记」</material>，持续<color=#E78300>9</color>秒，场上被附加<material=underline c=#FFFFFF h=2 event=terminology args=(101702)>「月痕标记」</material>的敌人最多存在一个；自身对处于<material=underline c=#FFFFFF h=2 event=terminology args=(101702)>「月痕标记」</material>状态下的敌人命中瞬间伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 110170011,
		extra_param = "",
		param = {
			{
				18,
				0,
				false,
				"%"
			},
			{
				30,
				0,
				false,
				"%"
			}
		}
	},
	[110170012] = {
		description = "当锁定的敌人处于<material=underline c=#FFFFFF h=2 event=terminology args=(101702)>「月痕标记」</material>状态时，施放「夜灵的游猎」时会瞬移到其身后并发动攻击；施放「残月的奔袭」、「夜灵的游猎」命中处于<material=underline c=#FFFFFF h=2 event=terminology args=(101702)>「月痕标记」</material>状态的敌人后「猫神的愚弄」都会被暂时替换为「战神的处决」，持续到「战神的处决」被施放或下一次退出<material=underline c=#FFFFFF h=2 event=terminology args=(101701)>「神瞳凝视」</material>状态。",
		maxLv = 1,
		type = 1,
		id = 110170012,
		extra_param = "",
		param = {}
	},
	[110170013] = {
		description = "「战神的处决」击败敌人时，恢复满印记，重置技能的冷却时间。",
		maxLv = 1,
		type = 1,
		id = 110170013,
		extra_param = "",
		param = {}
	},
	[110170021] = {
		description = "闪避效果的冷却时间缩短<color=#E78300>5</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110170021,
		extra_param = "",
		param = {}
	},
	[110170022] = {
		description = "普通攻击和技能每命中敌人<color=#E78300>1</color>次，获得<color=#E78300>1</color>层会心伤害提高效果，每层自身会心伤害提高<color=#E78300>{1}</color>，最多可叠加<color=#E78300>9</color>层；受击时，失去全部层数和全部印记。",
		maxLv = 1,
		type = 1,
		id = 110170022,
		extra_param = "",
		param = {
			{
				9,
				9,
				true,
				"%"
			}
		}
	},
	[110170023] = {
		description = "「猫神的愚弄」不再消耗<color=#E78300>1</color>个印记而是恢复<color=#E78300>1</color>个印记。极限闪避后施放的技能攻击命中时，当拥有印记则会消耗<color=#E78300>1</color>个印记重置闪避效果的冷却时间。",
		maxLv = 1,
		type = 1,
		id = 110170023,
		extra_param = "",
		param = {}
	},
	[110170031] = {
		description = "「猫神的愚弄」的冷却时间缩短<color=#E78300>1</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110170031,
		extra_param = "",
		param = {}
	},
	[110170032] = {
		description = "印记数量上限增加<color=#E78300>1</color>个。普通攻击最后一段命中时不再进入<material=underline c=#FFFFFF h=2 event=terminology args=(101701)>「神瞳凝视」</material>状态，改变为获得<color=#E78300>1</color>个印记。",
		maxLv = 1,
		type = 1,
		id = 110170032,
		extra_param = "",
		param = {}
	},
	[110170033] = {
		description = "「猫神的愚弄」会消耗全部印记，重置自身其他技能的冷却时间并进入<material=underline c=#FFFFFF h=2 event=terminology args=(101701)>「神瞳凝视」</material>状态，根据消耗的印记数量强化技能伤害和效果，每消耗<color=#E78300>1</color>个印记，「残月的奔袭」、「夜灵的游猎」、「战神的处决」命中瞬间技能伤害提高<color=#E78300>5%</color>。\n「残月的奔袭」：每消耗<color=#E78300>1</color>个印记，命中时对锁定的敌人附加暗属性抗性降低<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒。\n「夜灵的游猎」：根据消耗的印记数量，附加的眩晕状态依次持续<color=#E78300>2、3、4</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110170033,
		extra_param = "",
		param = {
			{
				12,
				12,
				true,
				"%"
			},
			{
				7,
				0,
				false,
				""
			}
		}
	},
	[110190011] = {
		description = "「破势」的基础伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 110190011,
		extra_param = "",
		param = {
			{
				30,
				0,
				false,
				"%"
			}
		}
	},
	[110190012] = {
		description = "印记上限增加<color=#E78300>3</color>个。根据施放「破势」前拥有的印记数量，命中时会消耗对应数量的印记，每消耗<color=#E78300>1</color>个印记，该技能基础伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 110190012,
		extra_param = "",
		param = {
			{
				20,
				20,
				true,
				"%"
			}
		}
	},
	[110190013] = {
		description = "自身触发闪避效果时，获得<color=#E78300>{1}</color>个印记。",
		maxLv = 1,
		type = 1,
		id = 110190013,
		extra_param = "",
		param = {
			{
				1,
				0,
				false,
				""
			}
		}
	},
	[110190021] = {
		description = "「涌动之风」召唤的飓风会拉扯沿途的敌人。",
		maxLv = 1,
		type = 1,
		id = 110190021,
		extra_param = "",
		param = {}
	},
	[110190022] = {
		description = "「涌动之风」的基础伤害提高<color=#E78300>{1}</color>。召唤的飓风攻击范围半径提高<color=#E78300>60%</color>，距离提高<color=#E78300>12%</color>。",
		maxLv = 1,
		type = 1,
		id = 110190022,
		extra_param = "",
		param = {
			{
				30,
				0,
				false,
				"%"
			}
		}
	},
	[110190023] = {
		description = "「破势」命中时会重置「涌动之风」的冷却时间。当自身拥有印记时，「涌动之风」命中时对敌人附加风属性抗性降低<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110190023,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[110190031] = {
		description = "<material=underline c=#FFFFFF h=2 event=terminology args=(101901)>「风神之柱」</material>造成会心后，重置闪避效果的冷却时间，获得<color=#E78300>{1}</color>的闪避值，该效果每<color=#E78300>3.5</color>秒最多触发一次。",
		maxLv = 1,
		type = 1,
		id = 110190031,
		extra_param = "",
		param = {
			{
				5,
				0,
				false,
				"%"
			}
		}
	},
	[110190032] = {
		description = "闪避时会对锁定的敌人召唤一根<material=underline c=#FFFFFF h=2 event=terminology args=(101901)>「风神之柱」</material>，造成<color=#E78300>{1}</color>攻击力的风属性伤害；自身触发闪避效果时，会额外再召唤一根<material=underline c=#FFFFFF h=2 event=terminology args=(101901)>「风神之柱」</material>。",
		maxLv = 1,
		type = 1,
		id = 110190032,
		extra_param = "",
		param = {
			{
				100,
				2.564,
				true,
				"%"
			}
		}
	},
	[110190033] = {
		description = "<material=underline c=#FFFFFF h=2 event=terminology args=(101901)>「风神之柱」</material>每命中敌人<color=#E78300>1</color>次后，<material=underline c=#FFFFFF h=2 event=terminology args=(101901)>「风神之柱」</material>命中瞬间伤害提高<color=#E78300>{1}</color>，持续<color=#E78300>5</color>秒，最多可叠加<color=#E78300>5</color>层。",
		maxLv = 1,
		type = 1,
		id = 110190033,
		extra_param = "",
		param = {
			{
				50,
				50,
				true,
				"%"
			}
		}
	},
	[110200011] = {
		description = "对普通敌人伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 110200011,
		extra_param = "",
		param = {
			{
				33,
				0,
				false,
				"%"
			}
		}
	},
	[110200012] = {
		description = "处于<material=underline c=#FFFFFF h=2 event=terminology args=(102002)>「毁灭」</material>时，改变为每<color=#E78300>1</color>秒对全场敌人附加<color=#E78300>{1}</color>攻击力的风属性伤害，并对生命值不低于<color=#E78300>20%</color>的自身或者队友附加<color=#E78300>{2}</color>的生命值上限的伤害，自身或者队友每次被附加该伤害时，攻击力提高<color=#E78300>{3}</color>，持续<color=#E78300>{4}</color>秒，最多可叠加<color=#E78300>7</color>层，切换为<material=underline c=#FFFFFF h=2 event=terminology args=(102001)>「创生」</material>时移除全队伍该攻击力提高效果。",
		maxLv = 1,
		type = 1,
		id = 110200012,
		extra_param = "",
		param = {
			{
				100,
				0,
				false,
				"%"
			},
			{
				3,
				0,
				false,
				"%"
			},
			{
				3,
				3,
				true,
				"%"
			},
			{
				3,
				0,
				false,
				""
			}
		}
	},
	[110200013] = {
		description = "切换为<material=underline c=#FFFFFF h=2 event=terminology args=(102001)>「创生」</material>时，根据神格「破灭之神·俱毁」对我方附加伤害的次数，每有<color=#E78300>1</color>次全队伍攻击力提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒，该效果提供的攻击力提高最高为<color=#E78300>40%</color>。",
		maxLv = 1,
		type = 1,
		id = 110200013,
		extra_param = "",
		param = {
			{
				2,
				2,
				true,
				"%"
			},
			{
				15,
				0,
				false,
				""
			}
		}
	},
	[110200021] = {
		description = "自身触发闪避效果时，全队伍获得<color=#E78300>3</color>层<material=underline c=#FFFFFF h=2 event=terminology args=(102004)>「莲影」</material>，持续<color=#E78300>15</color>秒，恢复全队伍<color=#E78300>{1}</color>的生命值。\n<material=underline c=#FFFFFF h=2 event=terminology args=(102004)>「莲影」</material>：受击时，失去<color=#E78300>1</color>层<material=underline c=#FFFFFF h=2 event=terminology args=(102004)>「莲影」</material>，获得无敌效果，持续<color=#E78300>3</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110200021,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			}
		}
	},
	[110200022] = {
		description = "「大自在天·显形」命中时，全队伍攻击力提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒，「大自在天·湮灭」命中时，重置该提高效果的持续时间。\n「初禅净天·显形」对命中的敌人附加全属性抗性降低<color=#E78300>{3}</color>，持续<color=#E78300>{4}</color>秒，「初禅净天·湮灭」命中拥有该全属性抗性降低状态的敌人时，重置该状态的持续时间。",
		maxLv = 1,
		type = 1,
		id = 110200022,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			},
			{
				20,
				0,
				false,
				""
			},
			{
				10,
				0,
				false,
				"%"
			},
			{
				20,
				0,
				false,
				""
			}
		}
	},
	[110200023] = {
		description = "施放<material=underline c=#FFFFFF h=2 event=terminology args=(102001)>「创生」</material>的奥义或连携奥义时，全队伍会心率提高<color=#E78300>{1}</color>，自身或者队友会心率每比<color=#E78300>100%</color>高<color=#E78300>0.1%</color>，会心伤害提高<color=#E78300>0.2%</color>，该效果提供的会心伤害提高最高为<color=#E78300>200%</color>，持续<color=#E78300>33</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110200023,
		extra_param = "",
		param = {
			{
				25,
				0,
				false,
				"%"
			}
		}
	},
	[110200031] = {
		description = "施放「摩诃迦罗」时会聚集敌人，施放「摩诃迦罗」后普通攻击伤害提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒，受到的伤害降低<color=#E78300>{3}</color>，持续<color=#E78300>{4}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110200031,
		extra_param = "",
		param = {
			{
				33,
				0,
				false,
				"%"
			},
			{
				5,
				0,
				false,
				""
			},
			{
				90,
				0,
				false,
				"%"
			},
			{
				20,
				0,
				false,
				""
			}
		}
	},
	[110200032] = {
		description = "「大自在天」、「初禅净天」的基础伤害提高<color=#E78300>{1}</color>。\n施放「初禅净天·湮灭」后，技能「大自在天·崩解」会替换为「大自在天·湮灭」，该「大自在天·湮灭」不会获得神能。",
		maxLv = 1,
		type = 1,
		id = 110200032,
		extra_param = "",
		param = {
			{
				66,
				0,
				false,
				"%"
			}
		}
	},
	[110200033] = {
		description = "每次施放「大自在天·显形」、「大自在天·湮灭」、「初禅净天·显形」、「初禅净天·湮灭」命中后，获得<color=#E78300>1</color>层加成效果，最多可叠加<color=#E78300>5</color>层，处于<material=underline c=#FFFFFF h=2 event=terminology args=(102002)>「毁灭」</material>施放奥义时，每有<color=#E78300>1</color>层奥义命中瞬间独立伤害提高<color=#E78300>{1}</color>，施放后消耗全部层数。",
		maxLv = 1,
		type = 1,
		id = 110200033,
		extra_param = "",
		param = {
			{
				80,
				80,
				true,
				"%"
			}
		}
	},
	[110210011] = {
		description = "全队伍获得<color=#E78300>1</color>层技能伤害提高效果，自身每有<color=#E78300>25%</color><material=underline c=#FFFFFF h=2 event=terminology args=(102101)>「辉音」</material>，额外获得<color=#E78300>1</color>层，最多可叠加<color=#E78300>5</color>层，每有<color=#E78300>1</color>层技能伤害提高<color=#E78300>{1}</color>。\n清除<material=underline c=#FFFFFF h=2 event=terminology args=(102103)>「和弦」</material>时，根据清除的标记的层数，每有<color=#E78300>1</color>层，对敌人附加物理属性抗性降低<color=#E78300>{2}</color>，持续<color=#E78300>{3}</color>秒，最多可叠加<color=#E78300>4</color>层。",
		maxLv = 1,
		type = 1,
		id = 110210011,
		extra_param = "",
		param = {
			{
				3,
				3,
				true,
				"%"
			},
			{
				4,
				4,
				true,
				"%"
			},
			{
				7,
				0,
				false,
				""
			}
		}
	},
	[110210012] = {
		description = "队长攻击命中时，自身会触发攻击，造成共计<color=#E78300>{1}</color>（普通攻击每提升一级<color=#E78300>+{2}</color>）攻击力的物理属性伤害，该效果每<color=#E78300>2</color>秒最多触发一次，触发<color=#E78300>4</color>次后，下一次触发时会改变攻击模式，造成共计<color=#E78300>{3}</color>（普通攻击每提升一级<color=#E78300>+{4}</color>）攻击力的物理属性伤害。",
		maxLv = 1,
		type = 1,
		id = 110210012,
		extra_param = "",
		param = {
			{
				100,
				2.56,
				true,
				"%"
			},
			{
				2.564,
				0.066,
				true,
				"%"
			},
			{
				200,
				5.125,
				true,
				"%"
			},
			{
				5.128,
				0.131,
				true,
				"%"
			}
		}
	},
	[110210013] = {
		description = "自身处于<material=underline c=#FFFFFF h=2 event=terminology args=(102102)>「朝晖」</material>状态时：\n神格「荒原狩野·猎林」中的技能伤害提高效果层数维持<color=#E78300>5</color>层；\n神格「荒原狩野·猎林」中的物理抗性降低效果层数维持<color=#E78300>4</color>层，并改变为持续对全场敌人附加；\n神格「荒原狩野·夜狩」中的触发攻击仅会触发改变攻击模式后的攻击。",
		maxLv = 1,
		type = 1,
		id = 110210013,
		extra_param = "",
		param = {}
	},
	[110210021] = {
		description = "禁用技能，奥义改变为施放奥义或连携奥义后，自身进入<material=underline c=#FFFFFF h=2 event=terminology args=(102104)>「奏鸣曲」</material>状态。\n<material=underline c=#FFFFFF h=2 event=terminology args=(102104)>「奏鸣曲」</material>：自身获得霸体效果，受到的伤害降低<color=#E78300>{1}</color>，不会成为敌人的攻击目标，队友每<color=#E78300>3</color>秒恢复<color=#E78300>3%</color>的奥义值。",
		maxLv = 1,
		type = 1,
		id = 110210021,
		extra_param = "",
		param = {
			{
				50,
				0,
				false,
				"%"
			}
		}
	},
	[110210022] = {
		description = "出场时，自身恢复<color=#E78300>100%</color>的奥义值，自身奥义等级每有<color=#E78300>1</color>级，额外恢复<color=#E78300>5%</color>的奥义值。\n退出<material=underline c=#FFFFFF h=2 event=terminology args=(102104)>「奏鸣曲」</material>状态时，自身恢复<color=#E78300>100%</color>的奥义值，自身奥义等级每有<color=#E78300>1</color>级，额外恢复<color=#E78300>5%</color>的奥义值。",
		maxLv = 1,
		type = 1,
		id = 110210022,
		extra_param = "",
		param = {}
	},
	[110210023] = {
		description = "自身处于<material=underline c=#FFFFFF h=2 event=terminology args=(102104)>「奏鸣曲」</material>状态时，获得以下效果：\n队友的攻击力提高<color=#E78300>{1}</color>，自身攻击力每比<color=#E78300>6000</color>高<color=#E78300>50</color>，队友的攻击力额外提高<color=#E78300>1%</color>，该效果提供的攻击力提高最高为<color=#E78300>30%</color>；\n队友的会心率提高<color=#E78300>{2}</color>；\n队友技能伤害提高<color=#E78300>{3}</color>。",
		maxLv = 1,
		type = 1,
		id = 110210023,
		extra_param = "",
		param = {
			{
				10,
				1,
				true,
				"%"
			},
			{
				20,
				0,
				false,
				"%"
			},
			{
				20,
				0,
				false,
				"%"
			}
		}
	},
	[110210031] = {
		description = "清除<material=underline c=#FFFFFF h=2 event=terminology args=(102103)>「和弦」</material>时，根据清除的标记的层数，每清除<color=#E78300>1</color>层，「黎明四重奏」的剩余冷却时间缩短<color=#E78300>1</color>秒。\n施放「晨曦谢幕曲」清除<material=underline c=#FFFFFF h=2 event=terminology args=(102103)>「和弦」</material>时，根据清除锁定的敌人的标记层数，分别造成共计<color=#E78300>{1}</color>（技能二每提升一级<color=#E78300>+{2}</color>）、<color=#E78300>{3}</color>（技能二每提升一级<color=#E78300>+{4}</color>）、<color=#E78300>{5}</color>（技能二每提升一级<color=#E78300>+{6}</color>）、<color=#E78300>{7}</color>（技能二每提升一级<color=#E78300>+{8}</color>）攻击力的物理伤害。\n施放「拂晓狂想曲」清除<material=underline c=#FFFFFF h=2 event=terminology args=(102103)>「和弦」</material>时，根据清除锁定的敌人的标记层数，分别造成共计<color=#E78300>{9}</color>（技能三每提升一级<color=#E78300>+{10}</color>）、<color=#E78300>{11}</color>（技能三每提升一级<color=#E78300>+{12}</color>）、<color=#E78300>{13}</color>（技能三每提升一级<color=#E78300>+{14}</color>）、<color=#E78300>{15}</color>（技能三每提升一级<color=#E78300>+{16}</color>）攻击力的物理伤害。",
		maxLv = 1,
		type = 1,
		id = 110210031,
		extra_param = "",
		param = {
			{
				250,
				6.41,
				true,
				"%"
			},
			{
				6.41,
				0.164,
				true,
				"%"
			},
			{
				500,
				12.82,
				true,
				"%"
			},
			{
				12.821,
				0.329,
				true,
				"%"
			},
			{
				750,
				19.228,
				true,
				"%"
			},
			{
				19.231,
				0.493,
				true,
				"%"
			},
			{
				1000,
				25.64,
				true,
				"%"
			},
			{
				25.641,
				0.657,
				true,
				"%"
			},
			{
				250,
				6.41,
				true,
				"%"
			},
			{
				6.41,
				0.164,
				true,
				"%"
			},
			{
				500,
				12.82,
				true,
				"%"
			},
			{
				12.821,
				0.329,
				true,
				"%"
			},
			{
				750,
				19.228,
				true,
				"%"
			},
			{
				19.231,
				0.493,
				true,
				"%"
			},
			{
				1000,
				25.64,
				true,
				"%"
			},
			{
				25.641,
				0.657,
				true,
				"%"
			}
		}
	},
	[110210032] = {
		description = "「黎明四重奏」不再消耗怒气，改变为依次获得<color=#E78300>3、5、7、10</color>点怒气。\n「晨曦谢幕曲」、「拂晓狂想曲」改变为消耗<color=#E78300>40</color>点怒气，命中瞬间基础伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 110210032,
		extra_param = "",
		param = {
			{
				20,
				0,
				false,
				"%"
			}
		}
	},
	[110210033] = {
		description = "处于<material=underline c=#FFFFFF h=2 event=terminology args=(102102)>「朝晖」</material>状态并且<material=underline c=#FFFFFF h=2 event=terminology args=(102101)>「辉音」</material>不为<color=#E78300>0</color>时，攻击力提高<color=#E78300>{1}</color>、近战伤害提高<color=#E78300>{10}</color>。\n处于<material=underline c=#FFFFFF h=2 event=terminology args=(102102)>「朝晖」</material>状态时，特殊普通攻击前四段攻击命中时，也会对命中的锁定敌人附加<material=underline c=#FFFFFF h=2 event=terminology args=(102103)>「和弦」</material>状态；处于<material=underline c=#FFFFFF h=2 event=terminology args=(102102)>「朝晖」</material>状态的普通攻击最后一段的最后一次攻击命中处于<material=underline c=#FFFFFF h=2 event=terminology args=(102103)>「和弦」</material>状态的敌人时，也会清除<material=underline c=#FFFFFF h=2 event=terminology args=(102103)>「和弦」</material>，清除<material=underline c=#FFFFFF h=2 event=terminology args=(102103)>「和弦」</material>时，根据清除锁定的敌人的标记层数，分别造成共计<color=#E78300>{2}</color>（普通攻击每提升一级<color=#E78300>+{3}</color>）、<color=#E78300>{4}</color>（普通攻击每提升一级<color=#E78300>+{5}</color>）、<color=#E78300>{6}</color>（普通攻击每提升一级<color=#E78300>+{7}</color>）、<color=#E78300>{8}</color>（普通攻击每提升一级<color=#E78300>+{9}</color>）攻击力的物理伤害。",
		maxLv = 1,
		type = 1,
		id = 110210033,
		extra_param = "",
		param = {
			{
				24,
				0,
				false,
				"%"
			},
			{
				400,
				10.256,
				true,
				"%"
			},
			{
				10.256,
				0.263,
				true,
				"%"
			},
			{
				800,
				20.51,
				true,
				"%"
			},
			{
				20.513,
				0.526,
				true,
				"%"
			},
			{
				1200,
				30.765,
				true,
				"%"
			},
			{
				30.769,
				0.789,
				true,
				"%"
			},
			{
				1600,
				41.02,
				true,
				"%"
			},
			{
				41.026,
				1.052,
				true,
				"%"
			},
			{
				10,
				0,
				false,
				"%"
			}
		}
	},
	[110220011] = {
		description = "处于<material=underline c=#FFFFFF h=2 event=terminology args=(102202)>「满月」</material>时改变为每<color=#E78300>0.09</color>秒消耗<color=#E78300>1</color>点<material=underline c=#FFFFFF h=2 event=terminology args=(102203)>「月相」</material>。\n<material=underline c=#FFFFFF h=2 event=terminology args=(102207)>「满月幽幕」</material>状态持续时间多于<color=#E78300>5</color>秒后，每<color=#E78300>1</color>秒自身获得<color=#E78300>1</color>层攻击力提高效果，每层自身攻击力提高<color=#E78300>{1}</color>，最多可叠加<color=#E78300>5</color>层，<material=underline c=#FFFFFF h=2 event=terminology args=(102207)>「满月幽幕」</material>状态结束时立即移除该攻击力提高效果。",
		maxLv = 1,
		type = 1,
		id = 110220011,
		extra_param = "",
		param = {
			{
				3,
				3,
				true,
				"%"
			}
		}
	},
	[110220012] = {
		description = "切换到<material=underline c=#FFFFFF h=2 event=terminology args=(102202)>「满月」</material>形态并获得<material=underline c=#FFFFFF h=2 event=terminology args=(102207)>「满月幽幕」</material>状态时或处于<material=underline c=#FFFFFF h=2 event=terminology args=(102207)>「满月幽幕」</material>状态切换到<material=underline c=#FFFFFF h=2 event=terminology args=(102201)>「新月」</material>形态时，获得<color=#E78300>20</color>点<material=underline c=#FFFFFF h=2 event=terminology args=(102203)>「月相」</material>。",
		maxLv = 1,
		type = 1,
		id = 110220012,
		extra_param = "",
		param = {}
	},
	[110220013] = {
		description = "「月轮」不再需要根据<material=underline c=#FFFFFF h=2 event=terminology args=(102203)>「月相」</material>才可施放，但冷却时间改变为<color=#E78300>20</color>秒。\n处于<material=underline c=#FFFFFF h=2 event=terminology args=(102207)>「满月幽幕」</material>状态时，施放「满月落影」、「满月银辉」命中后会获得<color=#E78300>20</color>点<material=underline c=#FFFFFF h=2 event=terminology args=(102203)>「月相」</material>，「满月落影·挽歌」、「满月银辉·挽歌」消耗神能不低于<color=#E78300>50</color>点时，额外获得<color=#E78300>20</color>点<material=underline c=#FFFFFF h=2 event=terminology args=(102203)>「月相」</material>。",
		maxLv = 1,
		type = 1,
		id = 110220013,
		extra_param = "",
		param = {}
	},
	[110220021] = {
		description = "<material=underline c=#FFFFFF h=2 event=terminology args=(102208)>「新月月华」</material>也会对一定范围内最多<color=#E78300>3</color>个敌人附加<material=underline c=#FFFFFF h=2 event=terminology args=(102210)>「月蚀」</material>状态；<material=underline c=#FFFFFF h=2 event=terminology args=(102209)>「满月皓光」</material>也会持续嘲讽一定范围内的普通敌人和精英敌人。",
		maxLv = 1,
		type = 1,
		id = 110220021,
		extra_param = "",
		param = {}
	},
	[110220022] = {
		description = "处于<material=underline c=#FFFFFF h=2 event=terminology args=(102210)>「月蚀」</material>状态的敌人暗属性抗性降低<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 110220022,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			}
		}
	},
	[110220023] = {
		description = "<material=underline c=#FFFFFF h=2 event=terminology args=(102207)>「满月幽幕」</material>状态也会给自身以外攻击力最高的队友附加。\n处于<material=underline c=#FFFFFF h=2 event=terminology args=(102207)>「满月幽幕」</material>状态，「满月落影·挽歌」、「满月银辉·挽歌」消耗神能不低于<color=#E78300>50</color>点时，获得<color=#E78300>20</color>点<material=underline c=#FFFFFF h=2 event=terminology args=(102203)>「月相」</material>。\n切换为<material=underline c=#FFFFFF h=2 event=terminology args=(102201)>「新月」</material>时，获得<color=#E78300>40</color>点<material=underline c=#FFFFFF h=2 event=terminology args=(102203)>「月相」</material>。",
		maxLv = 1,
		type = 1,
		id = 110220023,
		extra_param = "",
		param = {}
	},
	[110220031] = {
		description = "交替施放「满月落影」、「满月银辉」时，获得加成效果：处于<material=underline c=#FFFFFF h=2 event=terminology args=(102207)>「满月幽幕」</material>时，技能命中瞬间独立伤害提高<color=#E78300>{1}</color>；连续施放「满月落影」、「满月银辉」时移除该加成效果。",
		maxLv = 1,
		type = 1,
		id = 110220031,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			}
		}
	},
	[110220032] = {
		description = "仅对<color=#E78300>1</color>个敌人附加<material=underline c=#FFFFFF h=2 event=terminology args=(102210)>「月蚀」</material>状态时，对该敌人额外附加破甲状态，防御力降低<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 110220032,
		extra_param = "",
		param = {
			{
				20,
				0,
				false,
				"%"
			}
		}
	},
	[110220033] = {
		description = "处于<material=underline c=#FFFFFF h=2 event=terminology args=(102202)>「满月」</material>时获得以下效果：\n改变为每<color=#E78300>0.29</color>秒消耗<color=#E78300>1</color>点<material=underline c=#FFFFFF h=2 event=terminology args=(102203)>「月相」</material>；\n施放普通攻击第五段时，技能的剩余冷却时间缩短<color=#E78300>3</color>秒；\n「满月落影·挽歌」、「满月银辉·挽歌」改变攻击模式，额外造成共计<color=#E78300>{1}</color>（对应技能每提升一级<color=#E78300>+{2}</color>）攻击力的暗属性伤害；\n「满月落影·挽歌」消耗神能不低于<color=#E78300>50</color>点时重置「满月银辉·和声」的冷却时间；\n「满月银辉·挽歌」消耗神能不低于<color=#E78300>50</color>点时重置「满月落影·和声」的冷却时间；\n闪避效果不处于冷却状态时，施放消耗神能不低于<color=#E78300>50</color>点的「满月落影·挽歌」、「满月银辉·挽歌」时也会触发闪避效果，之后闪避效果进入冷却。",
		maxLv = 1,
		type = 1,
		id = 110220033,
		extra_param = "",
		param = {
			{
				1500,
				38.46,
				true,
				"%"
			},
			{
				38.462,
				0.986,
				true,
				"%"
			}
		}
	},
	[110240011] = {
		description = "「狼魂凝视」命中后，获得<color=#E78300>2.5%</color>的奥义值。",
		maxLv = 1,
		type = 1,
		id = 110240011,
		extra_param = "",
		param = {}
	},
	[110240012] = {
		description = "当「狼魂疾突」的协同攻击命中后，「狼魂疾突」的剩余冷却时间缩短<color=#E78300>3</color>秒；当「狼魂狂舞」的协同攻击命中后，「狼魂狂舞」的剩余冷却时间缩短<color=#E78300>3</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110240012,
		extra_param = "",
		param = {}
	},
	[110240013] = {
		description = "当<material=underline c=#FFFFFF h=2 event=terminology args=(102401)>「狼魂」</material>在场并且「狼魂疾突」、「狼魂狂舞」处于冷却状态时，可以直接点击该技能，<material=underline c=#FFFFFF h=2 event=terminology args=(102401)>「狼魂」</material>会对其锁定的敌人发动协同攻击，每次「狼魂疾突」、「狼魂狂舞」冷却期间该效果最多触发一次。",
		maxLv = 1,
		type = 1,
		id = 110240013,
		extra_param = "",
		param = {}
	},
	[110240021] = {
		description = "普通攻击最后一段命中时，<material=underline c=#FFFFFF h=2 event=terminology args=(102401)>「狼魂」</material>会发动「狼魂疾突」的协同攻击。",
		maxLv = 1,
		type = 1,
		id = 110240021,
		extra_param = "",
		param = {}
	},
	[110240022] = {
		description = "施放「狼魂疾突」命中时会对敌人附加<material=underline c=#FFFFFF h=2 event=terminology args=(102402)>「判罚」</material>，每<color=#E78300>2</color>秒会产生一次爆炸对周围造成<color=#E78300>{1}</color>攻击力的暗属性伤害，持续<color=#E78300>10</color>秒，场上被附加<material=underline c=#FFFFFF h=2 event=terminology args=(102402)>「判罚」</material>的敌人最多存在一个。",
		maxLv = 1,
		type = 1,
		id = 110240022,
		extra_param = "",
		param = {
			{
				80,
				2.051,
				true,
				"%"
			}
		}
	},
	[110240023] = {
		description = "自身与<material=underline c=#FFFFFF h=2 event=terminology args=(102401)>「狼魂」</material>对处于<material=underline c=#FFFFFF h=2 event=terminology args=(102402)>「判罚」</material>的敌人命中瞬间伤害提高<color=#E78300>{1}</color>；每次命中处于<material=underline c=#FFFFFF h=2 event=terminology args=(102402)>「判罚」</material>的敌人都会使<material=underline c=#FFFFFF h=2 event=terminology args=(102402)>「判罚」</material>多造成一次爆炸，该效果每<color=#E78300>1</color>秒最多触发一次。",
		maxLv = 1,
		type = 1,
		id = 110240023,
		extra_param = "",
		param = {
			{
				15,
				0,
				false,
				"%"
			}
		}
	},
	[110240031] = {
		description = "「胡狼奔行」、「狼魂疾突」、「狼魂狂舞」的协同攻击每段命中时获得<color=#E78300>5</color>点怒气。",
		maxLv = 1,
		type = 1,
		id = 110240031,
		extra_param = "",
		param = {}
	},
	[110240032] = {
		description = "<material=underline c=#FFFFFF h=2 event=terminology args=(102401)>「狼魂」</material>锁定的敌人被击败时会自动寻找下一个敌人，<material=underline c=#FFFFFF h=2 event=terminology args=(102401)>「狼魂」</material>在存在时间内没有寻找到下一个敌人时才会消失；<material=underline c=#FFFFFF h=2 event=terminology args=(102401)>「狼魂」</material>存在的时间延长<color=#E78300>30</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110240032,
		extra_param = "",
		param = {}
	},
	[110240033] = {
		description = "奥义获得率降低<color=#E78300>{1}</color>。<material=underline c=#FFFFFF h=2 event=terminology args=(102401)>「狼魂」</material>的协同攻击命中瞬间暗属性伤害提高<color=#E78300>{2}</color>。",
		maxLv = 1,
		type = 1,
		id = 110240033,
		extra_param = "",
		param = {
			{
				50,
				0,
				false,
				"%"
			},
			{
				35,
				0,
				false,
				"%"
			}
		}
	},
	[110260011] = {
		description = "神能的上限增加<color=#E78300>40</color>点。",
		maxLv = 1,
		type = 1,
		id = 110260011,
		extra_param = "",
		param = {}
	},
	[110260012] = {
		description = "每<color=#E78300>1</color>秒自动获得<color=#E78300>{1}</color>点神能。",
		maxLv = 1,
		type = 1,
		id = 110260012,
		extra_param = "",
		param = {
			{
				2,
				0,
				false,
				""
			}
		}
	},
	[110260013] = {
		description = "「重装烈炎」可通过长按消耗神能持续施放，每消耗一次神能，后续的命中瞬间伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 110260013,
		extra_param = "",
		param = {
			{
				15,
				15,
				true,
				"%"
			}
		}
	},
	[110260021] = {
		description = "满蓄力施放「炎弹之雨」或「地鸣爆弹」时，该技能的剩余冷却时间缩短<color=#E78300>20%</color>。",
		maxLv = 1,
		type = 1,
		id = 110260021,
		extra_param = "",
		param = {}
	},
	[110260022] = {
		description = "「炎弹之雨」或「地鸣爆弹」处于冷却状态时，可消耗<color=#E78300>30</color>点神能强制施放一次满蓄力的「炎弹之雨」或「地鸣爆弹」。强制施放后武器会过热无法使用，点击普通攻击可重新装填。",
		maxLv = 1,
		type = 1,
		id = 110260022,
		extra_param = "",
		param = {}
	},
	[110260023] = {
		description = "强制施放「炎弹之雨」或「地鸣爆弹」时，对周围的敌人造成<color=#E78300>{1}</color>攻击力的火属性伤害，并恢复自身<color=#E78300>{2}</color>攻击力的生命值。",
		maxLv = 1,
		type = 1,
		id = 110260023,
		extra_param = "",
		param = {
			{
				770,
				19.743,
				true,
				"%"
			},
			{
				30,
				0,
				false,
				"%"
			}
		}
	},
	[110260031] = {
		description = "对智械敌人的灼烧伤害提高<color=#E78300>80%</color>。",
		maxLv = 1,
		type = 1,
		id = 110260031,
		extra_param = "",
		param = {}
	},
	[110260032] = {
		description = "「炎弹之雨」命中处于灼烧状态的敌人时，会立即结算敌人的灼烧状态的剩余伤害。",
		maxLv = 1,
		type = 1,
		id = 110260032,
		extra_param = "",
		param = {}
	},
	[110260033] = {
		description = "当场上智械敌人被击败时，重置「地鸣爆弹」的冷却时间。",
		maxLv = 1,
		type = 1,
		id = 110260033,
		extra_param = "",
		param = {}
	},
	[110270011] = {
		description = "当敌人被附加冰冻状态时，自身对其附加<color=#E78300>{1}</color>攻击力的冰属性伤害。",
		maxLv = 1,
		type = 1,
		id = 110270011,
		extra_param = "",
		param = {
			{
				70,
				0,
				false,
				"%"
			}
		}
	},
	[110270012] = {
		description = "普通攻击最后一段命中后，获得<color=#E78300>{1}</color>个印记。",
		maxLv = 1,
		type = 1,
		id = 110270012,
		extra_param = "",
		param = {
			{
				1,
				0,
				false,
				""
			}
		}
	},
	[110270013] = {
		description = "「冒失猛撞」的第二段命中时，清除敌人全部控制抗性点数。",
		maxLv = 1,
		type = 1,
		id = 110270013,
		extra_param = "",
		param = {}
	},
	[110270021] = {
		description = "闪避效果的冷却时间缩短<color=#E78300>5</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110270021,
		extra_param = "",
		param = {}
	},
	[110270022] = {
		description = "处于未受击状态时，攻击力提高<color=#E78300>{1}</color>，受击后移除该效果；极限闪避后，进入未受击状态。",
		maxLv = 1,
		type = 1,
		id = 110270022,
		extra_param = "",
		param = {
			{
				30,
				0,
				false,
				"%"
			}
		}
	},
	[110270023] = {
		description = "自身触发闪避效果时，会重置「旋冰之弧」的冷却时间。",
		maxLv = 1,
		type = 1,
		id = 110270023,
		extra_param = "",
		param = {}
	},
	[110270031] = {
		description = "技能或奥义造成会心后，攻击力提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110270031,
		extra_param = "",
		param = {
			{
				15,
				0,
				false,
				"%"
			},
			{
				5,
				0,
				false,
				""
			}
		}
	},
	[110270032] = {
		description = "完美蓄力的「旋冰之弧」命中瞬间会心率提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 110270032,
		extra_param = "",
		param = {
			{
				100,
				0,
				false,
				"%"
			}
		}
	},
	[110270033] = {
		description = "自身成功附加冰冻状态时，会心伤害提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110270033,
		extra_param = "",
		param = {
			{
				60,
				0,
				false,
				"%"
			},
			{
				6,
				0,
				false,
				""
			}
		}
	},
	[110280011] = {
		description = "普通攻击第四段命中后，「深空的落雷」的剩余冷却时间缩短<color=#E78300>1</color>秒。普通攻击第四段命中后，会触发落雷，造成<color=#E78300>{1}</color>攻击力的雷属性伤害。",
		maxLv = 1,
		type = 1,
		id = 110280011,
		extra_param = "",
		param = {
			{
				200,
				5.128,
				true,
				"%"
			}
		}
	},
	[110280012] = {
		description = "普通攻击第四段命中时，进入<material=underline c=#FFFFFF h=2 event=terminology args=(102802)>「狂雷」</material>状态，持续<color=#E78300>1.5</color>秒；通过该神格进入的<material=underline c=#FFFFFF h=2 event=terminology args=(102802)>「狂雷」</material>状态持续时间不会被其他效果延长。",
		maxLv = 1,
		type = 1,
		id = 110280012,
		extra_param = "",
		param = {}
	},
	[110280013] = {
		description = "普通攻击命中瞬间普通攻击伤害提高<color=#E78300>{1}</color>。普通攻击第五段命中时，会触发五道落雷，每道落雷造成<color=#E78300>{2}</color>攻击力的雷属性伤害。",
		maxLv = 1,
		type = 1,
		id = 110280013,
		extra_param = "",
		param = {
			{
				100,
				0,
				false,
				"%"
			},
			{
				200,
				5.128,
				true,
				"%"
			}
		}
	},
	[110280021] = {
		description = "每有<color=#E78300>1</color>点<material=underline c=#FFFFFF h=2 event=terminology args=(102801)>「雷势」</material>，受到的伤害降低<color=#E78300>0.3%</color>，<material=underline c=#FFFFFF h=2 event=terminology args=(102801)>「雷势」</material><color=#E78300>80</color>点时减伤效果达到最高，处于<material=underline c=#FFFFFF h=2 event=terminology args=(102802)>「狂雷」</material>状态时，减伤效果提高<color=#E78300>200%</color>。",
		maxLv = 1,
		type = 1,
		id = 110280021,
		extra_param = "",
		param = {}
	},
	[110280022] = {
		description = "每次进入<material=underline c=#FFFFFF h=2 event=terminology args=(102802)>「狂雷」</material>状态时，会使周围的敌人雷属性抗性降低<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110280022,
		extra_param = "",
		param = {
			{
				15,
				0,
				false,
				"%"
			},
			{
				7,
				0,
				false,
				""
			}
		}
	},
	[110280023] = {
		description = "<material=underline c=#FFFFFF h=2 event=terminology args=(102802)>「狂雷」</material>状态持续时间延长<color=#E78300>0.5</color>秒；处于<material=underline c=#FFFFFF h=2 event=terminology args=(102802)>「狂雷」</material>状态时，会心伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 110280023,
		extra_param = "",
		param = {
			{
				30,
				0,
				false,
				"%"
			}
		}
	},
	[110280031] = {
		description = "非衍生技能的「大地的奔雷」、「远海的风雷」、「深空的落雷」命中瞬间技能伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 110280031,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			}
		}
	},
	[110280032] = {
		description = "技能替换为衍生技能且不施放时，之后对应技能的剩余冷却时间缩短<color=#E78300>2</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110280032,
		extra_param = "",
		param = {}
	},
	[110280033] = {
		description = "在施放「大地的奔雷」、「远海的风雷」、「深空的落雷」后衔接普通攻击，也会从普通攻击第四段开始攻击。普通攻击第五段命中时，自身攻击力提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110280033,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			},
			{
				4,
				0,
				false,
				""
			}
		}
	},
	[110320011] = {
		description = "当场上存在「巨剑·城堡」对应的<material=underline c=#FFFFFF h=2 event=terminology args=(103201)>「王棋」</material>时，「布局弈法」会对命中的敌人附加眩晕状态，持续<color=#E78300>{1}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110320011,
		extra_param = "",
		param = {
			{
				4,
				0,
				false,
				""
			}
		}
	},
	[110320012] = {
		description = "消耗<color=#E78300>3</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(103202)>「王棋标记」</material>的「同翼互攻」命中瞬间会心率提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 110320012,
		extra_param = "",
		param = {
			{
				32,
				0,
				false,
				"%"
			}
		}
	},
	[110320013] = {
		description = "当场上存在「巨剑·骑士」或「巨剑·皇后」对应的<material=underline c=#FFFFFF h=2 event=terminology args=(103201)>「王棋」</material>时，当施放「落兵升变」时会自动触发一次「布局弈法」的后段攻击，该次触发的后段攻击不会消耗印记，但基础伤害降低<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 110320013,
		extra_param = "",
		param = {
			{
				30,
				0,
				false,
				"%"
			}
		}
	},
	[110320021] = {
		description = "印记上限增加<color=#E78300>1</color>个。",
		maxLv = 1,
		type = 1,
		id = 110320021,
		extra_param = "",
		param = {}
	},
	[110320022] = {
		description = "施放「布局弈法」的后段，闪避效果的剩余冷却时间缩短<color=#E78300>7</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110320022,
		extra_param = "",
		param = {}
	},
	[110320023] = {
		description = "施放「布局弈法」的后段攻击后，王棋仍然存在于场上，并刷新存在时间，可再次施放「布局弈法」的后段攻击。",
		maxLv = 1,
		type = 1,
		id = 110320023,
		extra_param = "",
		param = {}
	},
	[110320031] = {
		description = "「布局弈法」的前段命中时会对敌人附加光属性抗性降低<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110320031,
		extra_param = "",
		param = {
			{
				16,
				0,
				false,
				"%"
			},
			{
				6,
				0,
				false,
				""
			}
		}
	},
	[110320032] = {
		description = "当场上存在<material=underline c=#FFFFFF h=2 event=terminology args=(103201)>「王棋」</material>时，全队伍防御力提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 110320032,
		extra_param = "",
		param = {
			{
				16,
				0,
				false,
				"%"
			}
		}
	},
	[110320033] = {
		description = "自身触发闪避效果时，使周围敌人朝场上<material=underline c=#FFFFFF h=2 event=terminology args=(103201)>「王棋」</material>所在的位置聚拢，并对<material=underline c=#FFFFFF h=2 event=terminology args=(103201)>「王棋」</material>周围的敌人造成伤害，造成共计<color=#E78300>{1}</color>攻击力的光属性伤害。",
		maxLv = 1,
		type = 1,
		id = 110320033,
		extra_param = "",
		param = {
			{
				800,
				20.512,
				true,
				"%"
			}
		}
	},
	[110330011] = {
		description = "「至理裁决」最后一段命中时，额外攻击力提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒，该效果可共享给最后一次生成的<material=underline c=#FFFFFF h=2 event=terminology args=(103301)>「真理之域」</material>范围内的队友。",
		maxLv = 1,
		type = 1,
		id = 110330011,
		extra_param = "",
		param = {
			{
				300,
				0,
				false,
				""
			},
			{
				6,
				0,
				false,
				""
			}
		}
	},
	[110330012] = {
		description = "神格「天启·先驱」的加成效果提高<color=#E78300>50%</color>，持续时间延长<color=#E78300>2</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110330012,
		extra_param = "",
		param = {}
	},
	[110330013] = {
		description = "每次触发「极境光域」的共享效果时，<material=underline c=#FFFFFF h=2 event=terminology args=(103301)>「真理之域」</material>范围内的队友会心率提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒，最多可叠加<color=#E78300>3</color>层。",
		maxLv = 1,
		type = 1,
		id = 110330013,
		extra_param = "",
		param = {
			{
				7,
				7,
				true,
				"%"
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[110330021] = {
		description = "「重构跃迁」的效果持续时间延长<color=#E78300>2</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110330021,
		extra_param = "",
		param = {}
	},
	[110330022] = {
		description = "「至理裁决」的中心区域会产生一次额外攻击，造成共计<color=#E78300>{1}</color>攻击力的光属性伤害，命中的敌人光属性抗性降低<color=#E78300>{2}</color>，持续<color=#E78300>{3}</color>秒，最多可叠加<color=#E78300>2</color>层；处于「重构跃迁」的效果时，额外攻击命中瞬间伤害提高<color=#E78300>30%</color>。",
		maxLv = 1,
		type = 1,
		id = 110330022,
		extra_param = "",
		param = {
			{
				400,
				10.256,
				true,
				"%"
			},
			{
				15,
				15,
				true,
				"%"
			},
			{
				5,
				0,
				false,
				""
			}
		}
	},
	[110330023] = {
		description = "处于「重构跃迁」的效果时，施放「至理裁决」时会额外召唤两枚「循理之环」攻击敌人。神格「威临·破阵」的额外攻击命中后，「重构跃迁」的剩余冷却时间缩短<color=#E78300>2</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110330023,
		extra_param = "",
		param = {}
	},
	[110330031] = {
		description = "「逆序警诫」的冷却时间缩短<color=#E78300>3</color>秒；当「逆序警诫」处于冷却状态时，每<color=#E78300>2</color>秒获得<color=#E78300>{1}</color>点能量，该效果可共享给最后一次生成的<material=underline c=#FFFFFF h=2 event=terminology args=(103301)>「真理之域」</material>范围内的队友。",
		maxLv = 1,
		type = 1,
		id = 110330031,
		extra_param = "",
		param = {
			{
				2,
				0,
				false,
				""
			}
		}
	},
	[110330032] = {
		description = "施放「极境光域」后，每<color=#E78300>5</color>秒对最后一次生成的<material=underline c=#FFFFFF h=2 event=terminology args=(103301)>「真理之域」</material>范围内的随机一名敌人额外召唤一枚「逆序警诫」的警诫之轮。",
		maxLv = 1,
		type = 1,
		id = 110330032,
		extra_param = "",
		param = {}
	},
	[110330033] = {
		description = "「逆序警诫」的伤害衰减<color=#E78300>{1}</color>，但会额外造成两次攻击；「逆序警诫」的自身伤害提高效果变为可叠加，最多可叠加<color=#E78300>3</color>层。每次自身触发共享，获得<color=#E78300>7%</color>的奥义值，该效果每<color=#E78300>2</color>秒最多触发一次。",
		maxLv = 1,
		type = 1,
		id = 110330033,
		extra_param = "",
		param = {
			{
				60,
				0,
				false,
				"%"
			}
		}
	},
	[110350011] = {
		description = "伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 110350011,
		extra_param = "",
		param = {
			{
				30,
				0,
				false,
				"%"
			}
		}
	},
	[110350012] = {
		description = "普通攻击命中生命值低于<color=#E78300>25%</color>的普通敌人时，有<color=#E78300>25%</color>的概率直接击败敌人。",
		maxLv = 1,
		type = 1,
		id = 110350012,
		extra_param = "",
		param = {}
	},
	[110350013] = {
		description = "自身击败普通敌人后，对精英和首领敌人伤害提高<color=#E78300>{1}</color>，最多可叠加<color=#E78300>10</color>层，持续至本场战斗结束。",
		maxLv = 1,
		type = 1,
		id = 110350013,
		extra_param = "",
		param = {
			{
				4,
				4,
				true,
				"%"
			}
		}
	},
	[110350021] = {
		description = "「撼流逐浪」的冷却时间缩短<color=#E78300>5</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110350021,
		extra_param = "",
		param = {}
	},
	[110350022] = {
		description = "施放「撼流逐浪」成功击败敌人后，伤害提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110350022,
		extra_param = "",
		param = {
			{
				50,
				0,
				false,
				"%"
			},
			{
				7,
				0,
				false,
				""
			}
		}
	},
	[110350023] = {
		description = "施放「撼流逐浪」钳住敌人时，最后一段摔向地面的伤害范围半径提高<color=#E78300>50%</color>，被钳制的敌人的生命值越少最后一段命中瞬间伤害提高越高，该效果提供的伤害提高最高为<color=#E78300>300%</color>。",
		maxLv = 1,
		type = 1,
		id = 110350023,
		extra_param = "",
		param = {}
	},
	[110350031] = {
		description = "普通攻击命中人形敌人时，怒气获得率提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 110350031,
		extra_param = "",
		param = {
			{
				15,
				0,
				false,
				"%"
			}
		}
	},
	[110350032] = {
		description = "「蛮勇追猎」奔跑的时间延长，额外延长的时间内持续消耗怒气，每施放<color=#E78300>2</color>次攻击消耗<color=#E78300>5</color>点怒气，每施放<color=#E78300>2</color>次攻击，终结一击的命中瞬间伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 110350032,
		extra_param = "",
		param = {
			{
				3,
				3,
				true,
				"%"
			}
		}
	},
	[110350033] = {
		description = "怒气达到满值后，每<color=#E78300>1</color>秒消耗<color=#E78300>15</color>点怒气，直至怒气值为<color=#E78300>0</color>点，在此期间施放技能不再消耗怒气。",
		maxLv = 1,
		type = 1,
		id = 110350033,
		extra_param = "",
		param = {}
	},
	[110370011] = {
		description = "「瞬影幽光」的幽光飞行距离提高<color=#E78300>30%</color>，伤害范围半径提高<color=#E78300>20%</color>。",
		maxLv = 1,
		type = 1,
		id = 110370011,
		extra_param = "",
		param = {}
	},
	[110370012] = {
		description = "「双重散射」会对命中的敌人附加<material=underline c=#FFFFFF h=2 event=terminology args=(103701)>「暗寄生」</material>状态，持续<color=#E78300>{2}</color>秒，处于<material=underline c=#FFFFFF h=2 event=terminology args=(103701)>「暗寄生」</material>状态的敌人受到的伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 110370012,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[110370013] = {
		description = "「瞬影幽光」的两团幽光会拉扯附近的敌人，并根据拉扯范围内被附加<material=underline c=#FFFFFF h=2 event=terminology args=(103701)>「暗寄生」</material>状态的敌人数量提高牵引力。",
		maxLv = 1,
		type = 1,
		id = 110370013,
		extra_param = "",
		param = {}
	},
	[110370021] = {
		description = "施放「双重散射」后，根据命中的敌人的次数，每命中敌人<color=#E78300>1</color>次，被动效果提供的伤害提高上限提高<color=#E78300>2%</color>，持续<color=#E78300>7</color>秒，该效果每<color=#E78300>7</color>秒最多触发一次。",
		maxLv = 1,
		type = 1,
		id = 110370021,
		extra_param = "",
		param = {}
	},
	[110370022] = {
		description = "当攻击命中并且被动加成效果为最高时，「双重散射」的剩余冷却时间缩短<color=#E78300>0.3</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110370022,
		extra_param = "",
		param = {}
	},
	[110370023] = {
		description = "「双重散射」的前后段攻击命中同一个敌人时，自身根据距离获得的被动加成效果达到最高，持续<color=#E78300>5</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110370023,
		extra_param = "",
		param = {}
	},
	[110370031] = {
		description = "「破袭之矢」每命中敌人<color=#E78300>1</color>次，后续的命中瞬间伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 110370031,
		extra_param = "",
		param = {
			{
				3,
				3,
				true,
				"%"
			}
		}
	},
	[110370032] = {
		description = "「破袭之矢」对命中的敌人附加受创状态，持续<color=#E78300>{2}</color>秒。\n受创：每<color=#E78300>3</color>秒附加<color=#E78300>{1}</color>攻击力的暗属性伤害，持续<color=#E78300>{2}</color>秒；附加的伤害可以叠加。",
		maxLv = 1,
		type = 1,
		id = 110370032,
		extra_param = "",
		param = {
			{
				10,
				10,
				true,
				"%"
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[110370033] = {
		description = "「破袭之矢」的冷却时间缩短<color=#E78300>2</color>秒；自身触发闪避效果时，「破袭之矢」的剩余冷却时间缩短<color=#E78300>2</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110370033,
		extra_param = "",
		param = {}
	},
	[110380011] = {
		description = "「阳炎风暴」对处于灼烧状态的敌人命中瞬间伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 110380011,
		extra_param = "",
		param = {
			{
				35,
				0,
				false,
				"%"
			}
		}
	},
	[110380012] = {
		description = "每命中敌人<color=#E78300>15</color>次，获得<color=#E78300>1</color>个印记。",
		maxLv = 1,
		type = 1,
		id = 110380012,
		extra_param = "",
		param = {}
	},
	[110380013] = {
		description = "「阳炎风暴」的冷却时间缩短<color=#E78300>8</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110380013,
		extra_param = "",
		param = {}
	},
	[110380021] = {
		description = "闪避效果的冷却时间缩短<color=#E78300>5</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110380021,
		extra_param = "",
		param = {}
	},
	[110380022] = {
		description = "「炽拥」的基础伤害提高<color=#E78300>{1}</color>，每命中敌人<color=#E78300>1</color>次有<color=#E78300>10%</color>的概率获得额外<color=#E78300>1</color>个印记。\n「炽拥」每命中敌人<color=#E78300>1</color>次，闪避效果的剩余冷却时间缩短<color=#E78300>0.2</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110380022,
		extra_param = "",
		param = {
			{
				35,
				0,
				false,
				"%"
			}
		}
	},
	[110380023] = {
		description = "自身触发闪避效果时，获得<color=#E78300>1</color>个印记并对锁定的敌人触发「炽拥」，该次触发不会使该技能进入冷却。",
		maxLv = 1,
		type = 1,
		id = 110380023,
		extra_param = "",
		param = {}
	},
	[110380031] = {
		description = "「圣炎俯冲」会对命中的敌人附加灼烧状态，持续<color=#E78300>{2}</color>秒。\n灼烧：每<color=#E78300>3</color>秒附加<color=#E78300>{1}</color>攻击力的火属性伤害，持续<color=#E78300>{2}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110380031,
		extra_param = "",
		param = {
			{
				35,
				0,
				false,
				"%"
			},
			{
				13,
				0,
				false,
				""
			}
		}
	},
	[110380032] = {
		description = "每命中敌人<color=#E78300>1</color>次，火属性伤害提高<color=#E78300>{1}</color>，命中处于灼烧状态的敌人时火属性伤害额外提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒，该效果提供的火属性伤害提高最高为<color=#E78300>15%</color>。",
		maxLv = 1,
		type = 1,
		id = 110380032,
		extra_param = "",
		param = {
			{
				1,
				1,
				true,
				"%"
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[110380033] = {
		description = "「阳炎风暴」命中时对敌人附加火属性抗性降低<color=#E78300>10%</color>，持续<color=#E78300>{1}</color>秒；对处于灼烧状态的敌人效果改变为<color=#E78300>15%</color>。",
		maxLv = 1,
		type = 1,
		id = 110380033,
		extra_param = "",
		param = {
			{
				8,
				0,
				false,
				""
			}
		}
	},
	[110390011] = {
		description = "「星离雨散」的冷却时间缩短<color=#E78300>4</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110390011,
		extra_param = "",
		param = {}
	},
	[110390012] = {
		description = "「激流浪涌」会对命中的敌人附加虚弱状态，攻击力降低<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110390012,
		extra_param = "",
		param = {
			{
				30,
				0,
				false,
				"%"
			},
			{
				8,
				0,
				false,
				""
			}
		}
	},
	[110390013] = {
		description = "「星离雨散」会对全队伍附加霸体效果，持续<color=#E78300>{1}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110390013,
		extra_param = "",
		param = {
			{
				3,
				0,
				false,
				""
			}
		}
	},
	[110390021] = {
		description = "「星离雨散」的额外攻击力效果提高<color=#E78300>40%</color>。",
		maxLv = 1,
		type = 1,
		id = 110390021,
		extra_param = "",
		param = {}
	},
	[110390022] = {
		description = "「海之恩泽」会对范围内的敌人造成共计<color=#E78300>{1}</color>攻击力的水属性伤害。",
		maxLv = 1,
		type = 1,
		id = 110390022,
		extra_param = "",
		param = {
			{
				140,
				3.589,
				true,
				"%"
			}
		}
	},
	[110390023] = {
		description = "「激流浪涌」会产生第二段攻击，并且范围更大，造成共计<color=#E78300>{1}</color>攻击力的水属性伤害。",
		maxLv = 1,
		type = 1,
		id = 110390023,
		extra_param = "",
		param = {
			{
				960,
				24.615,
				true,
				"%"
			}
		}
	},
	[110390031] = {
		description = "「海之恩泽」的生命值恢复效果提高<color=#E78300>20%</color>。",
		maxLv = 1,
		type = 1,
		id = 110390031,
		extra_param = "",
		param = {}
	},
	[110390032] = {
		description = "自身或者队友受击时，获得<color=#E78300>1.2%</color>的奥义值。",
		maxLv = 1,
		type = 1,
		id = 110390032,
		extra_param = "",
		param = {}
	},
	[110390033] = {
		description = "「海之恩泽」会为全队伍恢复生命值，不再需要选择区域。",
		maxLv = 1,
		type = 1,
		id = 110390033,
		extra_param = "",
		param = {}
	},
	[110410011] = {
		description = "「和弦三音」的恢复效果提高，每层<material=underline c=#FFFFFF h=2 event=terminology args=(104103)>「谐律」</material>自身治疗效果提高<color=#E78300>1%</color>。",
		maxLv = 1,
		type = 1,
		id = 110410011,
		extra_param = "",
		param = {}
	},
	[110410012] = {
		description = "「促弦五音」的破甲效果提高，每层<material=underline c=#FFFFFF h=2 event=terminology args=(104103)>「谐律」</material>破甲额外提供防御力降低<color=#E78300>0.5%</color>。",
		maxLv = 1,
		type = 1,
		id = 110410012,
		extra_param = "",
		param = {}
	},
	[110410013] = {
		description = "每次进入<material=underline c=#FFFFFF h=2 event=terminology args=(104101)>「鸣刃」</material>状态，<material=underline c=#FFFFFF h=2 event=terminology args=(104103)>「谐律」</material>层数改变为<color=#E78300>35</color>层。",
		maxLv = 1,
		type = 1,
		id = 110410013,
		extra_param = "",
		param = {}
	},
	[110410021] = {
		description = "全队伍近战型修正者拥有硬直效果时，受到的伤害降低<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 110410021,
		extra_param = "",
		param = {
			{
				20,
				0,
				false,
				"%"
			}
		}
	},
	[110410022] = {
		description = "闪避效果命中瞬间伤害提高<color=#E78300>{1}</color>。自身闪避效果没有成功附加眩晕状态时，也能获得奥义值。",
		maxLv = 1,
		type = 1,
		id = 110410022,
		extra_param = "",
		param = {
			{
				100,
				0,
				false,
				"%"
			}
		}
	},
	[110410023] = {
		description = "敌人被「谐律音爆」命中后，受到「谐律音爆」的伤害提高<color=#E78300>{1}</color>，持续<color=#E78300>5</color>秒，最多可叠加<color=#E78300>9</color>层。",
		maxLv = 1,
		type = 1,
		id = 110410023,
		extra_param = "",
		param = {
			{
				12,
				12,
				true,
				"%"
			}
		}
	},
	[110410031] = {
		description = "<material=underline c=#FFFFFF h=2 event=terminology args=(104102)>「谐律判定」</material>会有完美判定。技能完美判定成功时，命中瞬间技能伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 110410031,
		extra_param = "",
		param = {
			{
				12,
				0,
				false,
				"%"
			}
		}
	},
	[110410032] = {
		description = "每次完美判定成功时，获得<color=#E78300>1</color>点神能。",
		maxLv = 1,
		type = 1,
		id = 110410032,
		extra_param = "",
		param = {}
	},
	[110410033] = {
		description = "<material=underline c=#FFFFFF h=2 event=terminology args=(104103)>「谐律」</material>层数不少于<color=#E78300>7</color>层时，攻击力提高<color=#E78300>{1}</color>；<material=underline c=#FFFFFF h=2 event=terminology args=(104103)>「谐律」</material>层数不少于<color=#E78300>14</color>层时，物理属性伤害提高<color=#E78300>{2}</color>；<material=underline c=#FFFFFF h=2 event=terminology args=(104103)>「谐律」</material>层数不少于<color=#E78300>21</color>层时，近战伤害提高<color=#E78300>{3}</color>。",
		maxLv = 1,
		type = 1,
		id = 110410033,
		extra_param = "",
		param = {
			{
				12,
				0,
				false,
				"%"
			},
			{
				15,
				0,
				false,
				"%"
			},
			{
				18,
				0,
				false,
				"%"
			}
		}
	},
	[110420011] = {
		description = "消耗<material=underline c=#FFFFFF h=2 event=terminology args=(104201)>「冥息」</material>进入<material=underline c=#FFFFFF h=2 event=terminology args=(104203)>「共舞」</material>状态时，获得会心率和会心伤害的效果提高<color=#E78300>24%</color>。",
		maxLv = 1,
		type = 1,
		id = 110420011,
		extra_param = "",
		param = {}
	},
	[110420012] = {
		description = "「冥丝轮转」不再可主动施放，但每<color=#E78300>6</color>秒会自动施放。拥有<color=#E78300>4</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(104201)>「冥息」</material>时，下一次施放「冥丝轮转」时琉刻和明塔会自动同时进入<material=underline c=#FFFFFF h=2 event=terminology args=(104203)>「共舞」</material>状态。",
		maxLv = 1,
		type = 1,
		id = 110420012,
		extra_param = "",
		param = {}
	},
	[110420013] = {
		description = "当<material=underline c=#FFFFFF h=2 event=terminology args=(104202)>「伴舞」</material>状态的琉刻命中的敌人不处于暗属性抗性降低的状态时，对命中的敌人附加暗属性抗性降低<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒。对处于暗属性抗性降低状态的敌人，琉刻命中瞬间伤害提高<color=#E78300>{3}</color>。\n当<material=underline c=#FFFFFF h=2 event=terminology args=(104202)>「伴舞」</material>状态的明塔命中的敌人不处于破甲状态时，对命中的敌人附加破甲状态，防御力降低<color=#E78300>{4}</color>，持续<color=#E78300>{5}</color>秒。对处于破甲状态的敌人，明塔命中瞬间伤害提高<color=#E78300>{3}</color>。",
		maxLv = 1,
		type = 1,
		id = 110420013,
		extra_param = "",
		param = {
			{
				12,
				0,
				false,
				"%"
			},
			{
				6,
				0,
				false,
				""
			},
			{
				24,
				24,
				true,
				"%"
			},
			{
				12,
				0,
				false,
				"%"
			},
			{
				6,
				0,
				false,
				""
			}
		}
	},
	[110420021] = {
		description = "神能不低于<color=#E78300>25</color>点且不高于<color=#E78300>75</color>点时，伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 110420021,
		extra_param = "",
		param = {
			{
				12,
				0,
				false,
				"%"
			}
		}
	},
	[110420022] = {
		description = "神能不低于<color=#E78300>30</color>点且不高于<color=#E78300>70</color>点时，下次获得<material=underline c=#FFFFFF h=2 event=terminology args=(104201)>「冥息」</material>标记的间隔时间缩短<color=#E78300>1.5</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110420022,
		extra_param = "",
		param = {}
	},
	[110420023] = {
		description = "神能不低于<color=#E78300>40</color>点且不高于<color=#E78300>60</color>点时，攻击力提高<color=#E78300>{1}</color>、暗属性伤害提高<color=#E78300>{2}</color>、技能伤害提高<color=#E78300>{3}</color>。",
		maxLv = 1,
		type = 1,
		id = 110420023,
		extra_param = "",
		param = {
			{
				24,
				0,
				false,
				"%"
			},
			{
				24,
				0,
				false,
				"%"
			},
			{
				24,
				0,
				false,
				"%"
			}
		}
	},
	[110420031] = {
		description = "琉刻每次命中时的神能消耗改变为<color=#E78300>4</color>点，明塔每次命中时的神能获得改变为<color=#E78300>12</color>点。",
		maxLv = 1,
		type = 1,
		id = 110420031,
		extra_param = "",
		param = {}
	},
	[110420032] = {
		description = "切换到操作琉刻时，消耗<color=#E78300>15</color>点神能；切换到操作明塔时，获得<color=#E78300>15</color>点神能。",
		maxLv = 1,
		type = 1,
		id = 110420032,
		extra_param = "",
		param = {}
	},
	[110420033] = {
		description = "不再通过原本途径获得<material=underline c=#FFFFFF h=2 event=terminology args=(104201)>「冥息」</material>标记。\n神能为<color=#E78300>0</color>点时，暗属性伤害提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒，获得<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(104201)>「冥息」</material>标记，该途径获得<material=underline c=#FFFFFF h=2 event=terminology args=(104201)>「冥息」</material>标记有<color=#E78300>9</color>秒的冷却时间。\n神能为满时，暗属性伤害提高<color=#E78300>{3}</color>，持续<color=#E78300>{4}</color>秒，获得<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(104201)>「冥息」</material>标记，该途径获得<material=underline c=#FFFFFF h=2 event=terminology args=(104201)>「冥息」</material>标记有<color=#E78300>9</color>秒的冷却时间。",
		maxLv = 1,
		type = 1,
		id = 110420033,
		extra_param = "",
		param = {
			{
				24,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			},
			{
				24,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			}
		}
	},
	[110480011] = {
		description = "「定点打击」的冷却时间缩短<color=#E78300>3</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110480011,
		extra_param = "",
		param = {}
	},
	[110480012] = {
		description = "「定点打击」的范围半径提高<color=#E78300>60%</color>，命中瞬间基础伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 110480012,
		extra_param = "",
		param = {
			{
				20,
				0,
				false,
				"%"
			}
		}
	},
	[110480013] = {
		description = "对处于禁锢状态的敌人命中瞬间会心率提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 110480013,
		extra_param = "",
		param = {
			{
				25,
				0,
				false,
				"%"
			}
		}
	},
	[110480021] = {
		description = "「电导空袭」的基础伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 110480021,
		extra_param = "",
		param = {
			{
				30,
				0,
				false,
				"%"
			}
		}
	},
	[110480022] = {
		description = "「电导空袭」每次命中后，获得<color=#E78300>{1}</color>点能量。",
		maxLv = 1,
		type = 1,
		id = 110480022,
		extra_param = "",
		param = {
			{
				1,
				0,
				false,
				""
			}
		}
	},
	[110480023] = {
		description = "「电导空袭」可充能<color=#E78300>2</color>次。「电导空袭」命中瞬间会心率提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 110480023,
		extra_param = "",
		param = {
			{
				45,
				0,
				false,
				"%"
			}
		}
	},
	[110480031] = {
		description = "能量上限增加<color=#E78300>20</color>点。",
		maxLv = 1,
		type = 1,
		id = 110480031,
		extra_param = "",
		param = {}
	},
	[110480032] = {
		description = "「终焉脉冲」会消耗全部能量，每额外消耗<color=#E78300>1</color>点能量，命中瞬间伤害提高<color=#E78300>2%</color>。",
		maxLv = 1,
		type = 1,
		id = 110480032,
		extra_param = "",
		param = {}
	},
	[110480033] = {
		description = "「终焉脉冲」每次击败敌人时，获得<color=#E78300>{1}</color>点能量。",
		maxLv = 1,
		type = 1,
		id = 110480033,
		extra_param = "",
		param = {
			{
				60,
				0,
				false,
				""
			}
		}
	},
	[110490011] = {
		description = "生成<material=underline c=#FFFFFF h=2 event=terminology args=(104901)>「冰镜」</material>至<material=underline c=#FFFFFF h=2 event=terminology args=(104901)>「冰镜」</material>破碎时，获得硬直效果、受到的伤害降低<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 110490011,
		extra_param = "",
		param = {
			{
				15,
				0,
				false,
				"%"
			}
		}
	},
	[110490012] = {
		description = "<material=underline c=#FFFFFF h=2 event=terminology args=(104903)>「日狭女」</material>对处于冰冻状态的敌人命中瞬间伤害提高<color=#E78300>{1}</color>。\n获得<material=underline c=#FFFFFF h=2 event=terminology args=(104902)>「镜游」</material>时，独立伤害提高<color=#E78300>{2}</color>，持续<color=#E78300>{3}</color>秒，最多可叠加<color=#E78300>4</color>层。",
		maxLv = 1,
		type = 1,
		id = 110490012,
		extra_param = "",
		param = {
			{
				15,
				0,
				false,
				"%"
			},
			{
				7,
				7,
				true,
				"%"
			},
			{
				7,
				0,
				false,
				""
			}
		}
	},
	[110490013] = {
		description = "「碎镜·冥」会对命中的敌人附加冰冻状态，持续<color=#E78300>{1}</color>秒，该冰冻状态获得以下效果：持续时间不会被霸体的持续时间减半的效果减半；对处于自身以外附加的冰冻效果的敌人附加时，不会增加控制抗性点数。\n「镜花·霜舞」和「镜花·凛冰」的自身攻击的最后一次攻击命中处于冰冻状态的敌人时，移除敌人的冰冻状态，同时命中瞬间攻击力提高<color=#E78300>{2}</color>、会心率提高<color=#E78300>{3}</color>。",
		maxLv = 1,
		type = 1,
		id = 110490013,
		extra_param = "",
		param = {
			{
				2.5,
				0,
				false,
				""
			},
			{
				40,
				0,
				false,
				"%"
			},
			{
				40,
				0,
				false,
				"%"
			}
		}
	},
	[110490021] = {
		description = "<material=underline c=#FFFFFF h=2 event=terminology args=(104903)>「日狭女」</material>对普通敌人伤害提高<color=#E78300>{1}</color>。\n<material=underline c=#FFFFFF h=2 event=terminology args=(104903)>「日狭女」</material>攻击命中生命值低于<color=#E78300>25%</color>的普通敌人时，会直接击败敌人。",
		maxLv = 1,
		type = 1,
		id = 110490021,
		extra_param = "",
		param = {
			{
				15,
				0,
				false,
				"%"
			}
		}
	},
	[110490022] = {
		description = "普通攻击每次消耗<material=underline c=#FFFFFF h=2 event=terminology args=(104902)>「镜游」</material>效果唤出的<material=underline c=#FFFFFF h=2 event=terminology args=(104903)>「日狭女」</material>攻击命中时对敌人附加破甲状态，防御力降低<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒，最多可叠加<color=#E78300>4</color>层。",
		maxLv = 1,
		type = 1,
		id = 110490022,
		extra_param = "",
		param = {
			{
				5,
				5,
				true,
				"%"
			},
			{
				7,
				0,
				false,
				""
			}
		}
	},
	[110490023] = {
		description = "当拥有<material=underline c=#FFFFFF h=2 event=terminology args=(104902)>「镜游」</material>效果时，不处于普通攻击第四段时也会从普通攻击第五段开始攻击，并改变该次攻击模式。\n击败敌人时，会生成一个冰花，延迟后碎裂，造成共计<color=#E78300>{1}</color>攻击力的冰属性伤害，场上最多存在<color=#E78300>4</color>个。",
		maxLv = 1,
		type = 1,
		id = 110490023,
		extra_param = "",
		param = {
			{
				400,
				10.256,
				true,
				"%"
			}
		}
	},
	[110490031] = {
		description = "自身极限闪避敌人的攻击时也会生成「碎镜·幽」。",
		maxLv = 1,
		type = 1,
		id = 110490031,
		extra_param = "",
		param = {}
	},
	[110490032] = {
		description = "自身极限闪避<material=underline c=#FFFFFF h=2 event=terminology args=(104901)>「冰镜」</material>的破碎唤出<material=underline c=#FFFFFF h=2 event=terminology args=(104903)>「日狭女」</material>攻击敌人时，会消耗<color=#E78300>25</color>点怒气改变<material=underline c=#FFFFFF h=2 event=terminology args=(104903)>「日狭女」</material>的攻击模式：\n极限闪避普通攻击生成的<material=underline c=#FFFFFF h=2 event=terminology args=(104901)>「冰镜」</material>时，<material=underline c=#FFFFFF h=2 event=terminology args=(104903)>「日狭女」</material>造成共计<color=#E78300>{1}</color>（普通攻击每提升一级<color=#E78300>+{2}</color>）攻击力的冰属性伤害；\n极限闪避「彼岸·霜舞」生成的<material=underline c=#FFFFFF h=2 event=terminology args=(104901)>「冰镜」</material>时，<material=underline c=#FFFFFF h=2 event=terminology args=(104903)>「日狭女」</material>造成共计<color=#E78300>{3}</color>（技能一每提升一级<color=#E78300>+{4}</color>）攻击力的冰属性伤害；\n极限闪避「彼岸·凛冰」生成的<material=underline c=#FFFFFF h=2 event=terminology args=(104901)>「冰镜」</material>时，<material=underline c=#FFFFFF h=2 event=terminology args=(104903)>「日狭女」</material>造成共计<color=#E78300>{5}</color>（技能二每提升一级<color=#E78300>+{6}</color>）攻击力的冰属性伤害。",
		maxLv = 1,
		type = 1,
		id = 110490032,
		extra_param = "",
		param = {
			{
				400,
				10.256,
				true,
				"%"
			},
			{
				10.256,
				0.263,
				true,
				"%"
			},
			{
				1000,
				25.64,
				true,
				"%"
			},
			{
				25.641,
				0.657,
				true,
				"%"
			},
			{
				1000,
				25.64,
				true,
				"%"
			},
			{
				25.641,
				0.657,
				true,
				"%"
			}
		}
	},
	[110490033] = {
		description = "不再可通过极限闪避触发闪避效果；「彼岸·千引」成功格挡后会触发闪避效果；当「彼岸·千引」格挡<material=underline c=#FFFFFF h=2 event=terminology args=(104901)>「冰镜」</material>的命中时，会消耗<material=underline c=#FFFFFF h=2 event=terminology args=(104902)>「镜游」</material>效果额外获得<color=#E78300>15</color>点怒气。\n「碎镜·幽」会对命中的敌人附加冰冻状态，持续<color=#E78300>{1}</color>秒，该冰冻状态获得以下效果：持续时间不会被霸体的持续时间减半的效果减半；对处于自身以外附加的冰冻效果的敌人附加时，不会增加控制抗性点数。\n极限闪避后点击普通攻击施放的追加攻击命中处于冰冻状态的敌人时，移除敌人的冰冻状态，同时命中瞬间攻击力提高<color=#E78300>{2}</color>、会心率提高<color=#E78300>{3}</color>。",
		maxLv = 1,
		type = 1,
		id = 110490033,
		extra_param = "",
		param = {
			{
				2.5,
				0,
				false,
				""
			},
			{
				40,
				0,
				false,
				"%"
			},
			{
				40,
				0,
				false,
				"%"
			}
		}
	},
	[110500011] = {
		description = "当印记达到满时，技能和奥义命中瞬间会心率、会心伤害提高<color=#E78300>{1}</color>，持续<color=#E78300>5</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110500011,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			}
		}
	},
	[110500012] = {
		description = "技能造成会心后，有<color=#E78300>25%</color>的概率获得<color=#E78300>1</color>个印记，该效果每<color=#E78300>1</color>秒最多触发一次。",
		maxLv = 1,
		type = 1,
		id = 110500012,
		extra_param = "",
		param = {}
	},
	[110500013] = {
		description = "触发神格「天忍穗耳命·空蝉」的效果时，攻击力提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110500013,
		extra_param = "",
		param = {
			{
				25,
				0,
				false,
				"%"
			},
			{
				9,
				0,
				false,
				""
			}
		}
	},
	[110500021] = {
		description = "「绯·缨白」会对命中的敌人附加受创状态，持续<color=#E78300>{1}</color>秒。\n受创：每<color=#E78300>3</color>秒附加<color=#E78300>{2}</color>攻击力的物理属性伤害，持续<color=#E78300>{1}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110500021,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				""
			},
			{
				20,
				20,
				true,
				"%"
			}
		}
	},
	[110500022] = {
		description = "「绯·散华」第二式命中处于受创状态的敌人时，会把受创状态扩散到敌人一定范围内的其他敌人身上。",
		maxLv = 1,
		type = 1,
		id = 110500022,
		extra_param = "",
		param = {}
	},
	[110500023] = {
		description = "「绯·散华」第三式对处于受创状态的敌人命中瞬间伤害提高<color=#E78300>{1}</color>。当「绯·散华」第三式击败处于受创状态的敌人时，技能和奥义的剩余冷却时间缩短<color=#E78300>1</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110500023,
		extra_param = "",
		param = {
			{
				100,
				0,
				false,
				"%"
			}
		}
	},
	[110500031] = {
		description = "触发闪避效果<color=#E78300>5</color>秒内，当「绯·散华」命中时，自身伤害提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110500031,
		extra_param = "",
		param = {
			{
				40,
				0,
				false,
				"%"
			},
			{
				9,
				0,
				false,
				""
			}
		}
	},
	[110500032] = {
		description = "闪避不会打断普通攻击的连段。闪避值恢复速度提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 110500032,
		extra_param = "",
		param = {
			{
				50,
				0,
				false,
				"%"
			}
		}
	},
	[110500033] = {
		description = "连续施放「绯·散华」第三式时，每次施放命中瞬间伤害提高<color=#E78300>100%</color>。",
		maxLv = 1,
		type = 1,
		id = 110500033,
		extra_param = "",
		param = {}
	},
	[110520011] = {
		description = "「火力支援战术」能量消耗减少<color=#E78300>10</color>点；施放「怒蛇咆吼」时每<color=#E78300>1</color>秒额外获得<color=#E78300>{1}</color>点能量。",
		maxLv = 1,
		type = 1,
		id = 110520011,
		extra_param = "",
		param = {
			{
				2,
				0,
				false,
				""
			}
		}
	},
	[110520012] = {
		description = "施放「怒蛇咆吼」时每次消耗<material=underline c=#FFFFFF h=2 event=terminology args=(105201)>「火力计数」</material>获得<color=#E78300>1</color>层伤害提高效果，每层自身伤害提高<color=#E78300>{1}</color>，最多可叠加<color=#E78300>25</color>层；在施放「快速反应战术」或「优势围歼战术」<color=#E78300>3</color>秒后移除该效果。",
		maxLv = 1,
		type = 1,
		id = 110520012,
		extra_param = "",
		param = {
			{
				1,
				1,
				true,
				"%"
			}
		}
	},
	[110520013] = {
		description = "「火力覆盖战术」缩短剩余冷却时间的效果，会同样作用在下一次施放的「快速反应战术」或「优势围歼战术」，该效果每次施放「火力覆盖战术」最多触发一次。",
		maxLv = 1,
		type = 1,
		id = 110520013,
		extra_param = "",
		param = {}
	},
	[110520021] = {
		description = "普通攻击和「火力覆盖战术」的动作翻滚期间受击时，会获得闪避效果；闪避效果持续期间，「火力覆盖战术」每次炮击命中会使该技能的剩余冷却时间缩短<color=#E78300>20%</color>。",
		maxLv = 1,
		type = 1,
		id = 110520021,
		extra_param = "",
		param = {}
	},
	[110520022] = {
		description = "自身施放「优势围歼战术」后会附带引导信标，引导信标范围内的敌人受到<material=underline c=#FFFFFF h=2 event=terminology args=(105207)>「雨洪模式」</material>以外的无人机的伤害提高<color=#E78300>{1}</color>，无人机退场时引导信标造成<color=#E78300>{2}</color>（技能三每提升一级<color=#E78300>+{3}</color>）攻击力的物理属性伤害。\n神格「神王的诡计·困斗」被激活时，该神格效果失效。",
		maxLv = 1,
		type = 1,
		id = 110520022,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			},
			{
				2000,
				51.282,
				true,
				"%"
			},
			{
				51.282,
				1.315,
				true,
				"%"
			}
		}
	},
	[110520023] = {
		description = "<material=underline c=#FFFFFF h=2 event=terminology args=(105207)>「雨洪模式」</material>以外的无人机的攻击命中时会根据当前<material=underline c=#FFFFFF h=2 event=terminology args=(105201)>「火力计数」</material>点数命中瞬间伤害提高，每<color=#E78300>1</color>点<material=underline c=#FFFFFF h=2 event=terminology args=(105201)>「火力计数」</material>命中瞬间伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 110520023,
		extra_param = "",
		param = {
			{
				0.1,
				0.1,
				true,
				"%"
			}
		}
	},
	[110520031] = {
		description = "施放「神战的终结」时，全队伍远程伤害提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110520031,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			},
			{
				7,
				0,
				false,
				""
			}
		}
	},
	[110520032] = {
		description = "激活后，「快速反应战术」呼叫的无人机从<material=underline c=#FFFFFF h=2 event=terminology args=(105203)>「凶风模式」</material>改变为<material=underline c=#FFFFFF h=2 event=terminology args=(105205)>「旋风模式」</material>。",
		maxLv = 1,
		type = 1,
		id = 110520032,
		extra_param = "",
		param = {}
	},
	[110520033] = {
		description = "激活后，「优势围歼战术」呼叫的无人机从<material=underline c=#FFFFFF h=2 event=terminology args=(105204)>「恶风模式」</material>改变为<material=underline c=#FFFFFF h=2 event=terminology args=(105206)>「飓风模式」</material>。",
		maxLv = 1,
		type = 1,
		id = 110520033,
		extra_param = "",
		param = {}
	},
	[110550011] = {
		description = "「霜影击」造成会心后，自身攻击力提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110550011,
		extra_param = "",
		param = {
			{
				15,
				0,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[110550012] = {
		description = "衔接施放的「破霜击」造成会心后，下一次「霜影击」施放时，「霜影击」的命中瞬间会心率提高<color=#E78300>{1}</color>，持续<color=#E78300>2.5</color>秒；「霜影击」造成会心后，下一次衔接施放的「破霜击」会心伤害提高<color=#E78300>{2}</color>。",
		maxLv = 1,
		type = 1,
		id = 110550012,
		extra_param = "",
		param = {
			{
				30,
				0,
				false,
				"%"
			},
			{
				20,
				0,
				false,
				"%"
			}
		}
	},
	[110550013] = {
		description = "<material=underline c=#FFFFFF h=2 event=terminology args=(105502)>「凝寒」</material>状态改变为仅对自身生效，持续时间延长至<color=#E78300>20</color>秒。\n处于<material=underline c=#FFFFFF h=2 event=terminology args=(105502)>「凝寒」</material>状态时，技能伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 110550013,
		extra_param = "",
		param = {
			{
				25,
				0,
				false,
				"%"
			}
		}
	},
	[110550021] = {
		description = "<material=underline c=#FFFFFF h=2 event=terminology args=(105501)>「霜结」</material>最多可叠加层数改变为<color=#E78300>15</color>层。",
		maxLv = 1,
		type = 1,
		id = 110550021,
		extra_param = "",
		param = {}
	},
	[110550022] = {
		description = "衔接施放的「破霜击」不再对敌人附加冰属性抗性降低。\n「霜影击」每次造成会心后，对命中的敌人附加冰属性抗性降低<color=#E78300>15%</color>，持续<color=#E78300>{1}</color>秒。\n「霜影击」命中瞬间伤害提高<color=#E78300>{2}</color>，衔接施放的「破霜击」的伤害衰减<color=#E78300>{3}</color>。",
		maxLv = 1,
		type = 1,
		id = 110550022,
		extra_param = "",
		param = {
			{
				5,
				0,
				false,
				""
			},
			{
				15,
				0,
				false,
				"%"
			},
			{
				70,
				0,
				false,
				"%"
			}
		}
	},
	[110550023] = {
		description = "长按闪避时，会消耗<color=#E78300>45</color>点怒气施放「霜影击·改」，造成共计<color=#E78300>{1}</color>攻击力的冰属性伤害，最后一段攻击命中时，全队伍冰属性伤害提高<color=#E78300>{2}</color>，持续<color=#E78300>{3}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110550023,
		extra_param = "",
		param = {
			{
				1300,
				33.328,
				true,
				"%"
			},
			{
				30,
				0,
				false,
				"%"
			},
			{
				5,
				0,
				false,
				""
			}
		}
	},
	[110550031] = {
		description = "衔接施放的「破霜击」每次施放命中会生成一个<material=underline c=#FFFFFF h=2 event=terminology args=(105503)>「纸傀」</material>，持续<color=#E78300>10</color>秒，场上最多存在<color=#E78300>3</color>个。\n<material=underline c=#FFFFFF h=2 event=terminology args=(105503)>「纸傀」</material>：每<color=#E78300>2</color>秒对周围造成造成<color=#E78300>{1}</color>攻击力的冰属性伤害。",
		maxLv = 1,
		type = 1,
		id = 110550031,
		extra_param = "",
		param = {
			{
				100,
				2.564,
				true,
				"%"
			}
		}
	},
	[110550032] = {
		description = "「霜影击」命中时，所有<material=underline c=#FFFFFF h=2 event=terminology args=(105503)>「纸傀」</material>会立即对周围造成一次<color=#E78300>{1}</color>攻击力的冰属性伤害，该效果每<color=#E78300>2</color>秒最多触发一次。",
		maxLv = 1,
		type = 1,
		id = 110550032,
		extra_param = "",
		param = {
			{
				200,
				5.128,
				true,
				"%"
			}
		}
	},
	[110550033] = {
		description = "施放「霜影击」时会把一定范围内的<material=underline c=#FFFFFF h=2 event=terminology args=(105503)>「纸傀」</material>移动到自身周围，并刷新持续时间；直接施放「破霜击」时附近的<material=underline c=#FFFFFF h=2 event=terminology args=(105503)>「纸傀」</material>会朝自身攻击方向移动；<material=underline c=#FFFFFF h=2 event=terminology args=(105503)>「纸傀」</material>移动时造成<color=#E78300>{1}</color>攻击力的冰属性伤害，会对命中的不处于冰冻状态的敌人附加冰冻状态，持续<color=#E78300>{2}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110550033,
		extra_param = "",
		param = {
			{
				100,
				2.564,
				true,
				"%"
			},
			{
				3,
				0,
				false,
				""
			}
		}
	},
	[110560011] = {
		description = "自身改变为每秒自动获得<color=#E78300>4</color>点能量。",
		maxLv = 1,
		type = 1,
		id = 110560011,
		extra_param = "",
		param = {}
	},
	[110560012] = {
		description = "能量不低于<color=#E78300>40</color>点时，伤害提高<color=#E78300>{1}</color>；能量低于<color=#E78300>40</color>点时，伤害提高效果会在<color=#E78300>3</color>秒后移除。",
		maxLv = 1,
		type = 1,
		id = 110560012,
		extra_param = "",
		param = {
			{
				25,
				0,
				false,
				"%"
			}
		}
	},
	[110560013] = {
		description = "每次施放「神怒·踏鸣」、强化的「神怒·雷织」额外踢击命中时，会心率提高<color=#E78300>{1}</color>，持续<color=#E78300>{3}</color>秒，最多可叠加<color=#E78300>5</color>层。\n强化的「雷武真拳」最后一段、至少蓄力<color=#E78300>1</color>段的强化的「神怒·千雳」命中后，给自身施加生命值上限<color=#E78300>{2}</color>的护盾，持续<color=#E78300>{4}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110560013,
		extra_param = "",
		param = {
			{
				7,
				7,
				true,
				"%"
			},
			{
				10,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			},
			{
				12,
				0,
				false,
				""
			}
		}
	},
	[110560021] = {
		description = "强化的「神怒·雷织」连点的额外踢击，每次命中时，对相同敌人命中瞬间伤害提高<color=#E78300>{1}</color>，该效果提供的伤害提高最高为<color=#E78300>135%</color>。",
		maxLv = 1,
		type = 1,
		id = 110560021,
		extra_param = "",
		param = {
			{
				9,
				9,
				true,
				"%"
			}
		}
	},
	[110560022] = {
		description = "强化的「神怒·雷织」连点的额外踢击次数增加<color=#E78300>2</color>次。",
		maxLv = 1,
		type = 1,
		id = 110560022,
		extra_param = "",
		param = {}
	},
	[110560023] = {
		description = "强化的「神怒·雷织」连点进行额外踢击期间，极限闪避后可以继续施放强化的「神怒·雷织」。",
		maxLv = 1,
		type = 1,
		id = 110560023,
		extra_param = "",
		param = {}
	},
	[110560031] = {
		description = "极限闪避后<color=#E78300>5</color>秒内，施放普通攻击会直接使用最后一段攻击。",
		maxLv = 1,
		type = 1,
		id = 110560031,
		extra_param = "",
		param = {}
	},
	[110560032] = {
		description = "强化的「神怒·千雳」蓄力期间，极限闪避时，攻击力提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110560032,
		extra_param = "",
		param = {
			{
				70,
				0,
				false,
				"%"
			},
			{
				9,
				0,
				false,
				""
			}
		}
	},
	[110560033] = {
		description = "每次施放强化效果，技能和奥义的剩余冷却时间缩短<color=#E78300>1</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110560033,
		extra_param = "",
		param = {}
	},
	[110580011] = {
		description = "「绯狱舞炎·炎爆」会对命中的敌人附加灼烧状态，持续<color=#E78300>{2}</color>秒。\n灼烧：每<color=#E78300>3</color>秒附加<color=#E78300>{1}</color>攻击力的火属性伤害，持续<color=#E78300>{2}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110580011,
		extra_param = "",
		param = {
			{
				30,
				0,
				false,
				"%"
			},
			{
				9,
				0,
				false,
				""
			}
		}
	},
	[110580012] = {
		description = "处于<material=underline c=#FFFFFF h=2 event=terminology args=(105801)>「染火」</material>状态时，当施放「绯狱舞炎·改」后触发「绯狱舞炎·炎爆」时，之后每次施放「绯狱舞炎·改」都会触发「绯狱舞炎·炎爆」。",
		maxLv = 1,
		type = 1,
		id = 110580012,
		extra_param = "",
		param = {}
	},
	[110580013] = {
		description = "对处于灼烧状态的敌人命中瞬间伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 110580013,
		extra_param = "",
		param = {
			{
				15,
				0,
				false,
				"%"
			}
		}
	},
	[110580021] = {
		description = "处于<material=underline c=#FFFFFF h=2 event=terminology args=(105801)>「染火」</material>状态时，受到的伤害降低<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 110580021,
		extra_param = "",
		param = {
			{
				15,
				0,
				false,
				"%"
			}
		}
	},
	[110580022] = {
		description = "「绯狱舞炎·改」每命中敌人<color=#E78300>1</color>次，<material=underline c=#FFFFFF h=2 event=terminology args=(105801)>「染火」</material>状态持续时间延长<color=#E78300>1</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110580022,
		extra_param = "",
		param = {}
	},
	[110580023] = {
		description = "当<material=underline c=#FFFFFF h=2 event=terminology args=(105801)>「染火」</material>状态持续到「烬祸·熔火」的冷却结束时，「烬祸·熔火」会获得强化效果。\n强化的「烬祸·熔火」：造成共计<color=#E78300>{1}</color>（技能三每提升一级<color=#E78300>+{2}</color>）攻击力的火属性伤害。",
		maxLv = 1,
		type = 1,
		id = 110580023,
		extra_param = "",
		param = {
			{
				700,
				17.945,
				true,
				"%"
			},
			{
				17.949,
				0.46,
				true,
				"%"
			}
		}
	},
	[110580031] = {
		description = "普通攻击每命中<color=#E78300>5</color>次时，会获得<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(105802)>「炽轮」</material>标记，<material=underline c=#FFFFFF h=2 event=terminology args=(105802)>「炽轮」</material>标记最多拥有<color=#E78300>2</color>个。施放「秘剑·焚涅」或「秘剑·牙突」时会消耗<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(105802)>「炽轮」</material>标记并获得强化效果。\n强化的「秘剑·焚涅」：造成共计<color=#E78300>{1}</color>（技能一每提升一级<color=#E78300>+{2}</color>）攻击力的火属性伤害。\n强化的「秘剑·牙突」：造成共计<color=#E78300>{3}</color>（技能二每提升一级<color=#E78300>+{4}</color>）攻击力的火属性伤害。",
		maxLv = 1,
		type = 1,
		id = 110580031,
		extra_param = "",
		param = {
			{
				955,
				24.486,
				true,
				"%"
			},
			{
				24.487,
				0.628,
				true,
				"%"
			},
			{
				600,
				15.384,
				true,
				"%"
			},
			{
				15.385,
				0.394,
				true,
				"%"
			}
		}
	},
	[110580032] = {
		description = "「绯狱舞炎·改」改变为长按普通攻击施放，并且可在普通攻击任意一段之后衔接施放。「绯狱舞炎·改」获得硬直效果改变为获得无敌效果。",
		maxLv = 1,
		type = 1,
		id = 110580032,
		extra_param = "",
		param = {}
	},
	[110580033] = {
		description = "处于<material=underline c=#FFFFFF h=2 event=terminology args=(105801)>「染火」</material>状态普通攻击或「绯狱舞炎·改」每命中敌人<color=#E78300>1</color>次，会心率提高<color=#E78300>{1}</color>、会心伤害提高<color=#E78300>{2}</color>，持续<color=#E78300>{3}</color>秒，最多可叠加<color=#E78300>10</color>层。",
		maxLv = 1,
		type = 1,
		id = 110580033,
		extra_param = "",
		param = {
			{
				3,
				3,
				true,
				"%"
			},
			{
				7,
				7,
				true,
				"%"
			},
			{
				9,
				0,
				false,
				""
			}
		}
	},
	[110590011] = {
		description = "自身触发闪避效果时，会额外获得<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(105901)>「光矢」</material>标记。",
		maxLv = 1,
		type = 1,
		id = 110590011,
		extra_param = "",
		param = {}
	},
	[110590012] = {
		description = "每次消耗<material=underline c=#FFFFFF h=2 event=terminology args=(105901)>「光矢」</material>，「耀日光棘」的剩余冷却时间缩短<color=#E78300>1</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110590012,
		extra_param = "",
		param = {}
	},
	[110590013] = {
		description = "消耗<material=underline c=#FFFFFF h=2 event=terminology args=(105901)>「光矢」</material>时，会心伤害提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒，最多可叠加<color=#E78300>3</color>层。",
		maxLv = 1,
		type = 1,
		id = 110590013,
		extra_param = "",
		param = {
			{
				20,
				20,
				true,
				"%"
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[110590021] = {
		description = "「耀日光棘」命中时额外获得<color=#E78300>1</color>次被动命中计数。",
		maxLv = 1,
		type = 1,
		id = 110590021,
		extra_param = "",
		param = {}
	},
	[110590022] = {
		description = "「耀日光棘」的基础伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 110590022,
		extra_param = "",
		param = {
			{
				35,
				0,
				false,
				"%"
			}
		}
	},
	[110590023] = {
		description = "「灼尽之光」每命中敌人<color=#E78300>1</color>次，获得<color=#E78300>{1}</color>点能量，并且自身技能和奥义的剩余冷却时间缩短<color=#E78300>0.5</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110590023,
		extra_param = "",
		param = {
			{
				2,
				0,
				false,
				""
			}
		}
	},
	[110590031] = {
		description = "「辉光交错」追加攻击的中心判定范围半径提高<color=#E78300>50%</color>。",
		maxLv = 1,
		type = 1,
		id = 110590031,
		extra_param = "",
		param = {}
	},
	[110590032] = {
		description = "「辉光交错」的冷却时间缩短<color=#E78300>3</color>秒，并不再消耗能量。",
		maxLv = 1,
		type = 1,
		id = 110590032,
		extra_param = "",
		param = {}
	},
	[110590033] = {
		description = "「辉光交错」的追加攻击，对处于中心区域的敌人命中瞬间伤害改变为<color=#E78300>{1}</color>；「辉光交错」的追加攻击命中时，每拥有<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(105901)>「光矢」</material>标记，命中瞬间会心伤害提高<color=#E78300>{2}</color>。",
		maxLv = 1,
		type = 1,
		id = 110590033,
		extra_param = "",
		param = {
			{
				40,
				0,
				false,
				"%"
			},
			{
				60,
				60,
				true,
				"%"
			}
		}
	},
	[110600011] = {
		description = "施放「破军枪阵·六」时会聚集敌人。\n「破军枪阵·三」、「破军枪阵·六」、「破军枪阵·九」攻击命中时对敌人附加光属性抗性降低<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110600011,
		extra_param = "",
		param = {
			{
				18,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			}
		}
	},
	[110600012] = {
		description = "触发反击时对攻击者附加近战伤害抗性降低<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110600012,
		extra_param = "",
		param = {
			{
				9,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			}
		}
	},
	[110600013] = {
		description = "施放「破军枪阵」时，嘲讽所有敌人，持续<color=#E78300>{3}</color>秒，嘲讽期间普通攻击全程受击时都能触发反击，反击获得的怒气提高<color=#E78300>50%</color>。\n开启<material=underline c=#FFFFFF h=2 event=terminology args=(106001)>「枪阵」</material>时，全队伍光属性伤害提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒。\n触发「枪落」时会聚集敌人。",
		maxLv = 1,
		type = 1,
		id = 110600013,
		extra_param = "",
		param = {
			{
				18,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			},
			{
				6,
				0,
				false,
				""
			}
		}
	},
	[110600021] = {
		description = "普通攻击每命中敌人<color=#E78300>1</color>次，技能的剩余冷却时间缩短<color=#E78300>0.15</color>秒；反击每命中敌人<color=#E78300>1</color>次，技能的剩余冷却时间缩短<color=#E78300>1</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110600021,
		extra_param = "",
		param = {}
	},
	[110600022] = {
		description = "施放技能时获得<color=#E78300>1</color>层攻击力加成、施放反击技能时获得<color=#E78300>3</color>层攻击力加成，每层自身攻击力提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒，最多可叠加<color=#E78300>9</color>层，自身处于<material=underline c=#FFFFFF h=2 event=terminology args=(106001)>「枪阵」</material>范围内时，会持续刷新持续时间。",
		maxLv = 1,
		type = 1,
		id = 110600022,
		extra_param = "",
		param = {
			{
				3,
				3,
				true,
				"%"
			},
			{
				6,
				0,
				false,
				""
			}
		}
	},
	[110600023] = {
		description = "每回收<color=#E78300>1</color>把<material=underline c=#FFFFFF h=2 event=terminology args=(106002)>「枪」</material>，会心伤害提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒，最多可叠加<color=#E78300>9</color>层。\n施放「破军枪阵·三」、「破军枪阵·六」、「破军枪阵·九」后，下一次施放反击、「反戈一击」、「游虎啸岩」、「破军枪舞」时，会根据施放的「破军枪阵」的类型，分别造成共计<color=#E78300>{3}、{4}、{5}</color>攻击力的光属性伤害，并且分别获得<color=#E78300>12、16、20</color>点怒气。",
		maxLv = 1,
		type = 1,
		id = 110600023,
		extra_param = "",
		param = {
			{
				9,
				9,
				true,
				"%"
			},
			{
				18,
				0,
				false,
				""
			},
			{
				200,
				5.127,
				true,
				"%"
			},
			{
				300,
				7.688,
				true,
				"%"
			},
			{
				400,
				10.254,
				true,
				"%"
			}
		}
	},
	[110600031] = {
		description = "「破军枪舞」命中瞬间技能伤害提高<color=#E78300>{1}</color>，每命中敌人<color=#E78300>1</color>次获得<color=#E78300>3</color>点怒气。",
		maxLv = 1,
		type = 1,
		id = 110600031,
		extra_param = "",
		param = {
			{
				18,
				0,
				false,
				"%"
			}
		}
	},
	[110600032] = {
		description = "施放「破军枪阵·六」结束后，攻击力提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒，当该次「破军枪阵·六」击败敌人时，攻击力额外提高<color=#E78300>9%</color>。",
		maxLv = 1,
		type = 1,
		id = 110600032,
		extra_param = "",
		param = {
			{
				36,
				9,
				true,
				"%"
			},
			{
				27,
				0,
				false,
				""
			}
		}
	},
	[110600033] = {
		description = "「破军枪阵·九」命中生命值分别低于<color=#E78300>75%、50%、25%</color>的敌人时，自身的攻击对该敌人命中瞬间攻击力分别提高<color=#E78300>18%、36%、54%</color>、命中瞬间会心率分别提高<color=#E78300>18%、36%、54%</color>，持续<color=#E78300>6</color>秒，该效果每个敌人每<color=#E78300>27</color>秒最多触发一次。",
		maxLv = 1,
		type = 1,
		id = 110600033,
		extra_param = "",
		param = {}
	},
	[110610011] = {
		description = "点击施放「数据输入·演算」时改变为消耗<color=#E78300>15、30</color>点神能，每消耗<color=#E78300>1</color>点神能，「演算」的命中瞬间攻击力提高改变为<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 110610011,
		extra_param = "",
		param = {
			{
				0.8,
				0.8,
				true,
				"%"
			}
		}
	},
	[110610012] = {
		description = "出场时、第一次施放「演算」时，获得<color=#E78300>60</color>点<material=underline c=#FFFFFF h=2 event=terminology args=(106101)>「北斗」</material>。",
		maxLv = 1,
		type = 1,
		id = 110610012,
		extra_param = "",
		param = {}
	},
	[110610013] = {
		description = "出场时，获得<color=#E78300>2</color>层攻击力提高效果；每层自身攻击力提高<color=#E78300>{1}</color>；每次施放「超阶演算」后，移除<color=#E78300>1</color>层攻击力提高效果。",
		maxLv = 1,
		type = 1,
		id = 110610013,
		extra_param = "",
		param = {
			{
				16,
				-8,
				true,
				"%"
			}
		}
	},
	[110610021] = {
		description = "每段普通攻击改变为获得<color=#E78300>8</color>点<material=underline c=#FFFFFF h=2 event=terminology args=(106101)>「北斗」</material>。\n施放「坎水不盈」、「北斗注死」改变为获得<color=#E78300>40</color>点<material=underline c=#FFFFFF h=2 event=terminology args=(106101)>「北斗」</material>。",
		maxLv = 1,
		type = 1,
		id = 110610021,
		extra_param = "",
		param = {}
	},
	[110610022] = {
		description = "「超阶演算」消耗神能点数达到<color=#E78300>80、120</color>点时，「超阶演算」的大型攻击命中瞬间基础伤害分别提高<color=#E78300>{1}、{2}</color>。",
		maxLv = 1,
		type = 1,
		id = 110610022,
		extra_param = "",
		param = {
			{
				8,
				8,
				true,
				"%"
			},
			{
				16,
				16,
				true,
				"%"
			}
		}
	},
	[110610023] = {
		description = "施放「演算」、「超阶演算」时，会心率提高<color=#E78300>{1}</color>、会心伤害提高<color=#E78300>{2}</color>，最多可叠加<color=#E78300>4</color>层。",
		maxLv = 1,
		type = 1,
		id = 110610023,
		extra_param = "",
		param = {
			{
				4,
				4,
				true,
				"%"
			},
			{
				12,
				12,
				true,
				"%"
			}
		}
	},
	[110610031] = {
		description = "「演算」命中时对敌人附加水属性抗性降低<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒。\n施放「演算」时，全队伍机制值获得率提高<color=#E78300>{3}</color>，持续<color=#E78300>{4}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110610031,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			},
			{
				16,
				0,
				false,
				""
			},
			{
				20,
				0,
				false,
				"%"
			},
			{
				8,
				0,
				false,
				""
			}
		}
	},
	[110610032] = {
		description = "开启「超阶演算」时会触发零时空间，持续时间<color=#E78300>3</color>秒，全队伍技能伤害提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110610032,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			},
			{
				16,
				0,
				false,
				""
			}
		}
	},
	[110610033] = {
		description = "施放奥义或连携奥义时，重置全队伍水属性修正者的技能三的冷却时间。",
		maxLv = 1,
		type = 1,
		id = 110610033,
		extra_param = "",
		param = {}
	},
	[110660011] = {
		description = "处于任意<material=underline c=#FFFFFF h=2 event=terminology args=(106601)>「占卜效果」</material>时，普通攻击会对命中的敌人附加破甲状态，防御力降低<color=#E78300>{2}</color>，持续<color=#E78300>{1}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110660011,
		extra_param = "",
		param = {
			{
				3,
				0,
				false,
				""
			},
			{
				10,
				0,
				false,
				"%"
			}
		}
	},
	[110660012] = {
		description = "「兔兔加农」会传递敌人的破甲状态，并使附加的剩余时间低于<color=#E78300>10</color>秒的破甲状态延长至<color=#E78300>10</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110660012,
		extra_param = "",
		param = {}
	},
	[110660013] = {
		description = "「兔兔扫射」对处于破甲状态的敌人命中瞬间伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 110660013,
		extra_param = "",
		param = {
			{
				35,
				0,
				false,
				"%"
			}
		}
	},
	[110660021] = {
		description = "<material=underline c=#FFFFFF h=2 event=terminology args=(106601)>「占卜效果」</material>延长<color=#E78300>5</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110660021,
		extra_param = "",
		param = {}
	},
	[110660022] = {
		description = "自身拥有任意<material=underline c=#FFFFFF h=2 event=terminology args=(106601)>「占卜效果」</material>时，会心率提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 110660022,
		extra_param = "",
		param = {
			{
				22,
				0,
				false,
				"%"
			}
		}
	},
	[110660023] = {
		description = "<material=underline c=#FFFFFF h=2 event=terminology args=(106601)>「占卜效果」</material>会作用于全队伍，但对队友的效果降低至一半。\n队友拥有<material=underline c=#FFFFFF h=2 event=terminology args=(106601)>「占卜效果」</material>时，会心率提高<color=#E78300>11%</color>。",
		maxLv = 1,
		type = 1,
		id = 110660023,
		extra_param = "",
		param = {}
	},
	[110660031] = {
		description = "「占卜」的冷却时间缩短<color=#E78300>3</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110660031,
		extra_param = "",
		param = {}
	},
	[110660032] = {
		description = "「占卜」获得的塔罗牌变为随机，但加成效果提高<color=#E78300>60%</color>。",
		maxLv = 1,
		type = 1,
		id = 110660032,
		extra_param = "",
		param = {}
	},
	[110660033] = {
		description = "施放「占卜」后，技能和奥义命中瞬间会心率提高<color=#E78300>50%</color>，持续<color=#E78300>5</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110660033,
		extra_param = "",
		param = {}
	},
	[110670011] = {
		description = "「百川归海」吸收<material=underline c=#FFFFFF h=2 event=terminology args=(106701)>「支流幻影」</material>的有效范围半径降低<color=#E78300>33.33%</color>，但吸收后获得的技能伤害加成效果提高。根据吸收的<material=underline c=#FFFFFF h=2 event=terminology args=(106701)>「支流幻影」</material>的数量，技能伤害依次提高<color=#E78300>6%、18%、36%</color>。",
		maxLv = 1,
		type = 1,
		id = 110670011,
		extra_param = "",
		param = {}
	},
	[110670012] = {
		description = "普通攻击造成会心后，也会触发「激波」，该效果每<color=#E78300>3</color>秒最多触发一次。",
		maxLv = 1,
		type = 1,
		id = 110670012,
		extra_param = "",
		param = {}
	},
	[110670013] = {
		description = "自身和幻影在<color=#E78300>0.3</color>秒内命中同一个敌人时，自身水属性伤害提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒；幻影在<color=#E78300>0.3</color>秒内命中同一个敌人时，命中的敌人水属性抗性降低<color=#E78300>{3}</color>，持续<color=#E78300>{4}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110670013,
		extra_param = "",
		param = {
			{
				18,
				0,
				false,
				"%"
			},
			{
				3,
				0,
				false,
				""
			},
			{
				12,
				0,
				false,
				"%"
			},
			{
				3,
				0,
				false,
				""
			}
		}
	},
	[110670021] = {
		description = "场上每存在<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(106701)>「支流幻影」</material>，自身攻击力提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 110670021,
		extra_param = "",
		param = {
			{
				6,
				6,
				true,
				"%"
			}
		}
	},
	[110670022] = {
		description = "「激潮涌灭」不再需要不少于<color=#E78300>2</color>个印记的条件。",
		maxLv = 1,
		type = 1,
		id = 110670022,
		extra_param = "",
		param = {}
	},
	[110670023] = {
		description = "「百川归海」获得的加成效果的持续时间延长<color=#E78300>4</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110670023,
		extra_param = "",
		param = {}
	},
	[110670031] = {
		description = "极限闪避时，水属性伤害提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110670031,
		extra_param = "",
		param = {
			{
				18,
				0,
				false,
				"%"
			},
			{
				6,
				0,
				false,
				""
			}
		}
	},
	[110670032] = {
		description = "自身触发闪避效果时，攻击力提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110670032,
		extra_param = "",
		param = {
			{
				24,
				0,
				false,
				"%"
			},
			{
				6,
				0,
				false,
				""
			}
		}
	},
	[110670033] = {
		description = "闪避效果的冷却时间缩短<color=#E78300>5</color>秒；闪避效果获得以下额外效果：场上存在<material=underline c=#FFFFFF h=2 event=terminology args=(106701)>「支流幻影」</material>时，点击闪避时自身会与距离最远的<material=underline c=#FFFFFF h=2 event=terminology args=(106701)>「支流幻影」</material>交换位置并触发闪避效果，自身交换前的位置会重新生成<material=underline c=#FFFFFF h=2 event=terminology args=(106701)>「支流幻影」</material>并触发「分流」。",
		maxLv = 1,
		type = 1,
		id = 110670033,
		extra_param = "",
		param = {}
	},
	[110680011] = {
		description = "普通攻击第三段或第四段命中时，「疾风冲击」的剩余冷却时间缩短<color=#E78300>1</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110680011,
		extra_param = "",
		param = {}
	},
	[110680012] = {
		description = "未强化的「疾风冲击」产生的「风箭」命中普通攻击最后一段产生的书页时会产生爆炸，造成共计<color=#E78300>{1}</color>攻击力的风属性伤害，获得<color=#E78300>10</color>点怒气。",
		maxLv = 1,
		type = 1,
		id = 110680012,
		extra_param = "",
		param = {
			{
				500,
				12.82,
				true,
				"%"
			}
		}
	},
	[110680013] = {
		description = "未强化的「疾风冲击」产生的「风箭」命中未强化的「风眼」后也会产生小型气旋，造成共计<color=#E78300>{1}</color>攻击力的风属性伤害，之后「飓风回旋」的剩余冷却时间缩短<color=#E78300>2</color>秒、「风元异变」的剩余冷却时间缩短<color=#E78300>4</color>秒，该效果每次未强化的「风眼」最多触发一次。",
		maxLv = 1,
		type = 1,
		id = 110680013,
		extra_param = "",
		param = {
			{
				500,
				12.82,
				true,
				"%"
			}
		}
	},
	[110680021] = {
		description = "未强化的「飓风回旋」形成的「风眼」也会短暂牵引敌人。",
		maxLv = 1,
		type = 1,
		id = 110680021,
		extra_param = "",
		param = {}
	},
	[110680022] = {
		description = "未强化的「疾风冲击」产生的「风箭」命中普通攻击最后一段产生的书页时会牵引敌人。",
		maxLv = 1,
		type = 1,
		id = 110680022,
		extra_param = "",
		param = {}
	},
	[110680023] = {
		description = "强化的「飓风回旋」形成的「风眼」最后一段被「风箭」命中后产生的气旋会对命中的敌人附加破甲状态，防御力降低<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110680023,
		extra_param = "",
		param = {
			{
				15,
				0,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[110680031] = {
		description = "施放强化的「风元异变」结束后，会在原地产生风暴，造成共计<color=#E78300>{1}</color>攻击力的风属性伤害。",
		maxLv = 1,
		type = 1,
		id = 110680031,
		extra_param = "",
		param = {
			{
				1500,
				38.46,
				true,
				"%"
			}
		}
	},
	[110680032] = {
		description = "自身触发闪避效果时，重置「风元异变」的冷却时间。",
		maxLv = 1,
		type = 1,
		id = 110680032,
		extra_param = "",
		param = {}
	},
	[110680033] = {
		description = "施放强化的「风元异变」结束后，获得<color=#E78300>3</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(106801)>「风铃」</material>标记。",
		maxLv = 1,
		type = 1,
		id = 110680033,
		extra_param = "",
		param = {}
	},
	[110700011] = {
		description = "施放「金乌焚陨」时，每消耗<color=#E78300>3</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(107001)>「曜」</material>标记，技能的基础伤害额外提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 110700011,
		extra_param = "",
		param = {
			{
				9,
				9,
				true,
				"%"
			}
		}
	},
	[110700012] = {
		description = "腾空进入<material=underline c=#FFFFFF h=2 event=terminology args=(107003)>「日凌」</material>状态时，每消耗<color=#E78300>1</color>点神能，自身受到的伤害提高<color=#E78300>{1}</color>，技能伤害提高<color=#E78300>{2}</color>，持续至退出<material=underline c=#FFFFFF h=2 event=terminology args=(107003)>「日凌」</material>状态。",
		maxLv = 1,
		type = 1,
		id = 110700012,
		extra_param = "",
		param = {
			{
				0.5,
				0.5,
				true,
				"%"
			},
			{
				0.2,
				0.2,
				true,
				"%"
			}
		}
	},
	[110700013] = {
		description = "处于<material=underline c=#FFFFFF h=2 event=terminology args=(107003)>「日凌」</material>状态时，每<color=#E78300>0.5</color>秒会心率降低<color=#E78300>{1}</color>、会心伤害提高<color=#E78300>{2}</color>，该效果提供的会心率降低最高为<color=#E78300>63%</color>、会心伤害提高最高为<color=#E78300>280%</color>；以上效果会在退出<material=underline c=#FFFFFF h=2 event=terminology args=(107003)>「日凌」</material>状态<color=#E78300>3</color>秒后移除。",
		maxLv = 1,
		type = 1,
		id = 110700013,
		extra_param = "",
		param = {
			{
				1.8,
				1.8,
				true,
				"%"
			},
			{
				8,
				8,
				true,
				"%"
			}
		}
	},
	[110700021] = {
		description = "每获得<color=#E78300>1</color>点神能，获得<color=#E78300>1</color>层攻击力提高效果，持续<color=#E78300>{2}</color>秒，每层自身攻击力提高<color=#E78300>{1}</color>，最多可叠加层数等同于神能上限点数。",
		maxLv = 1,
		type = 1,
		id = 110700021,
		extra_param = "",
		param = {
			{
				0.1,
				0.1,
				true,
				"%"
			},
			{
				3,
				0,
				false,
				""
			}
		}
	},
	[110700022] = {
		description = "处于<material=underline c=#FFFFFF h=2 event=terminology args=(107003)>「日凌」</material>状态时，每<color=#E78300>1</color>秒获得<color=#E78300>1</color>点神能。「金乌燎原」对敌人附加的火属性抗性降低改变为最多可叠加<color=#E78300>250</color>层、物理和风属性抗性降低改变为最多可叠加<color=#E78300>150</color>层。「金乌燎原」的冷却时间缩短<color=#E78300>2</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110700022,
		extra_param = "",
		param = {}
	},
	[110700023] = {
		description = "消耗神能时，每消耗<color=#E78300>1</color>点神能队友获得<color=#E78300>1</color>层技能伤害降低效果，每层队友技能伤害降低<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒，该效果重复获得时不会刷新和叠加；消耗神能时，根据队友的数量自身每消耗<color=#E78300>1</color>点神能自身获得<color=#E78300>1</color>层技能伤害提高效果，每层自身技能伤害提高<color=#E78300>{3}</color>，持续<color=#E78300>{4}</color>秒，最多可叠加层数等同于神能上限点数的<color=#E78300>200%</color>。",
		maxLv = 1,
		type = 1,
		id = 110700023,
		extra_param = "",
		param = {
			{
				0.1,
				0.1,
				true,
				"%"
			},
			{
				6,
				0,
				false,
				""
			},
			{
				0.1,
				0.1,
				true,
				"%"
			},
			{
				12,
				0,
				false,
				""
			}
		}
	},
	[110700031] = {
		description = "每次消耗或获得<material=underline c=#FFFFFF h=2 event=terminology args=(107001)>「曜」</material>标记后，每拥有<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(107001)>「曜」</material>标记，攻击力提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 110700031,
		extra_param = "",
		param = {
			{
				2,
				2,
				true,
				"%"
			}
		}
	},
	[110700032] = {
		description = "不处于<material=underline c=#FFFFFF h=2 event=terminology args=(107003)>「日凌」</material>状态每次达到<color=#E78300>9</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(107001)>「曜」</material>标记后，获得以下效果：下一次消耗全部<material=underline c=#FFFFFF h=2 event=terminology args=(107001)>「曜」</material>标记施放「金乌炽空」后，每拥有<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(107001)>「曜」</material>标记，命中瞬间伤害提高<color=#E78300>{1}</color>，持续<color=#E78300>9</color>秒。\n处于<material=underline c=#FFFFFF h=2 event=terminology args=(107003)>「日凌」</material>状态每次达到<color=#E78300>9</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(107001)>「曜」</material>标记后，获得以下效果：下一次消耗全部<material=underline c=#FFFFFF h=2 event=terminology args=(107001)>「曜」</material>标记施放「降妖斩决」后，「降妖斩决」的剑气攻击、「诛邪破击」和「伏魔焚灭」命中瞬间伤害提高<color=#E78300>{2}</color>，持续<color=#E78300>9</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110700032,
		extra_param = "",
		param = {
			{
				2,
				2,
				true,
				"%"
			},
			{
				30,
				0,
				false,
				"%"
			}
		}
	},
	[110700033] = {
		description = "腾空进入<material=underline c=#FFFFFF h=2 event=terminology args=(107003)>「日凌」</material>状态时，改变为每消耗<color=#E78300>1</color>点神能自身获得<color=#E78300>2</color>层火属性伤害提高效果，但每<color=#E78300>2</color>秒失去<color=#E78300>99</color>层。",
		maxLv = 1,
		type = 1,
		id = 110700033,
		extra_param = "",
		param = {}
	},
	[110710011] = {
		description = "召唤<material=underline c=#FFFFFF h=2 event=terminology args=(107104)>「玉剑」</material>后，在每把<material=underline c=#FFFFFF h=2 event=terminology args=(107104)>「玉剑」</material>位置召唤一道<material=underline c=#FFFFFF h=2 event=terminology args=(107105)>「云雷」</material>。",
		maxLv = 1,
		type = 1,
		id = 110710011,
		extra_param = "",
		param = {}
	},
	[110710012] = {
		description = "处于<material=underline c=#FFFFFF h=2 event=terminology args=(107102)>「苍震姿态」</material>时，「风雷破」每穿插施放<color=#E78300>2</color>次，会触发风场产生技能攻击，造成共计<color=#E78300>{1}</color>攻击力的风属性伤害。",
		maxLv = 1,
		type = 1,
		id = 110710012,
		extra_param = "",
		param = {
			{
				200,
				5.128,
				true,
				"%"
			}
		}
	},
	[110710013] = {
		description = "<material=underline c=#FFFFFF h=2 event=terminology args=(107104)>「玉剑」</material>或<material=underline c=#FFFFFF h=2 event=terminology args=(107105)>「云雷」</material>命中后，根据当前的姿态，风属性或雷属性伤害提高<color=#E78300>{1}</color>，最多可叠加<color=#E78300>20</color>层，切换姿态时移除该效果；通过该神格获得的属性伤害提高效果不会参与被动的计算。",
		maxLv = 1,
		type = 1,
		id = 110710013,
		extra_param = "",
		param = {
			{
				1,
				1,
				true,
				"%"
			}
		}
	},
	[110710021] = {
		description = "处于<material=underline c=#FFFFFF h=2 event=terminology args=(107102)>「苍震姿态」</material>，未穿插施放「风雷破」的「恒出运昌·震」的施放过程中，「恒出运昌·震」每次命中后自身获得<color=#E78300>3</color>点神能，队友获得<color=#E78300>1</color>点神能。",
		maxLv = 1,
		type = 1,
		id = 110710021,
		extra_param = "",
		param = {}
	},
	[110710022] = {
		description = "处于<material=underline c=#FFFFFF h=2 event=terminology args=(107102)>「苍震姿态」</material>时，全队伍神能型修正者技能伤害提高<color=#E78300>{1}</color>，队友的神能消耗降低<color=#E78300>{2}</color>。",
		maxLv = 1,
		type = 1,
		id = 110710022,
		extra_param = "",
		param = {
			{
				15,
				0,
				false,
				"%"
			},
			{
				15,
				0,
				false,
				"%"
			}
		}
	},
	[110710023] = {
		description = "处于<material=underline c=#FFFFFF h=2 event=terminology args=(107102)>「苍震姿态」</material>时，获得以下效果：\n「风雷破」、「益动势合·震」、「恒出运昌·震」的神能消耗改变为<color=#E78300>3、1、1</color>点；\n<color=#E78300>4</color>秒内连续施放技能时，会额外消耗之前施放的技能的神能基础消耗的总和；\n每次消耗神能时，每消耗<color=#E78300>1</color>点神能，「风雷破」和「恒出运昌·震」的剩余冷却时间缩短<color=#E78300>0.1</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110710023,
		extra_param = "",
		param = {}
	},
	[110710031] = {
		description = "切换为<material=underline c=#FFFFFF h=2 event=terminology args=(107101)>「青巽姿态」</material>后<color=#E78300>10</color>秒内，每把<material=underline c=#FFFFFF h=2 event=terminology args=(107104)>「玉剑」</material>命中后，获得<color=#E78300>1</color>点神能。",
		maxLv = 1,
		type = 1,
		id = 110710031,
		extra_param = "",
		param = {}
	},
	[110710032] = {
		description = "处于<material=underline c=#FFFFFF h=2 event=terminology args=(107102)>「苍震姿态」</material>时，技能伤害提高<color=#E78300>{1}</color>，但每<color=#E78300>2</color>秒自动消耗<color=#E78300>2</color>点神能。",
		maxLv = 1,
		type = 1,
		id = 110710032,
		extra_param = "",
		param = {
			{
				35,
				0,
				false,
				"%"
			}
		}
	},
	[110710033] = {
		description = "穿插施放「风雷破」时，会额外消耗<color=#E78300>4</color>点神能，攻击力提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒，最多可叠加<color=#E78300>4</color>层。",
		maxLv = 1,
		type = 1,
		id = 110710033,
		extra_param = "",
		param = {
			{
				7,
				7,
				true,
				"%"
			},
			{
				7,
				0,
				false,
				""
			}
		}
	},
	[110720011] = {
		description = "「辟邪奇术」的基础伤害提高<color=#E78300>{1}</color>。「辟邪奇术」的<material=underline c=#FFFFFF h=2 event=terminology args=(107201)>「财运」</material>点数获得率提高<color=#E78300>50%</color>。",
		maxLv = 1,
		type = 1,
		id = 110720011,
		extra_param = "",
		param = {
			{
				15,
				0,
				false,
				"%"
			}
		}
	},
	[110720012] = {
		description = "「财货如雨」的加成效果持续时间改变为<color=#E78300>{1}</color>秒，每消耗<color=#E78300>1</color>点<material=underline c=#FFFFFF h=2 event=terminology args=(107201)>「财运」</material>附加的风属性伤害改变为<color=#E78300>0.7%</color>。",
		maxLv = 1,
		type = 1,
		id = 110720012,
		extra_param = "",
		param = {
			{
				20,
				0,
				false,
				""
			}
		}
	},
	[110720013] = {
		description = "<material=underline c=#FFFFFF h=2 event=terminology args=(107201)>「财运」</material>点数上限增加<color=#E78300>20</color>点。\n施放消耗<material=underline c=#FFFFFF h=2 event=terminology args=(107201)>「财运」</material>点数不低于<color=#E78300>60</color>的「财货如雨」时，会改变为造成共计<color=#E78300>{2}</color>（技能三每提升一级<color=#E78300>+{3}</color>）攻击力的风属性伤害。消耗<color=#E78300>70</color>点<material=underline c=#FFFFFF h=2 event=terminology args=(107201)>「财运」</material>的「财货如雨」给全队伍附加加成效果时，额外附加风属性攻击命中瞬间会心率提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 110720013,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			},
			{
				1400,
				35.893,
				true,
				"%"
			},
			{
				35.897,
				0.92,
				true,
				"%"
			}
		}
	},
	[110720021] = {
		description = "<material=underline c=#FFFFFF h=2 event=terminology args=(107202)>「瑞币」</material>的协同攻击触发冷却时间缩短至<color=#E78300>1</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110720021,
		extra_param = "",
		param = {}
	},
	[110720022] = {
		description = "<material=underline c=#FFFFFF h=2 event=terminology args=(107202)>「瑞币」</material>跟随的修正者每次施放技能时，风属性攻击命中瞬间会心伤害提高<color=#E78300>{1}</color>，持续<color=#E78300>4</color>秒，该效果最多可叠加<color=#E78300>5</color>层。",
		maxLv = 1,
		type = 1,
		id = 110720022,
		extra_param = "",
		param = {
			{
				18,
				18,
				true,
				"%"
			}
		}
	},
	[110720023] = {
		description = "<material=underline c=#FFFFFF h=2 event=terminology args=(107202)>「瑞币」</material>的协同攻击命中瞬间伤害提高<color=#E78300>{1}</color>。<material=underline c=#FFFFFF h=2 event=terminology args=(107202)>「瑞币」</material>改变为跟随所有队友。",
		maxLv = 1,
		type = 1,
		id = 110720023,
		extra_param = "",
		param = {
			{
				30,
				0,
				false,
				"%"
			}
		}
	},
	[110720031] = {
		description = "「辟邪奇术」最后一段攻击命中后，自身攻击力提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110720031,
		extra_param = "",
		param = {
			{
				15,
				15,
				true,
				"%"
			},
			{
				8,
				0,
				false,
				""
			}
		}
	},
	[110720032] = {
		description = "神格「神算尊者·术奇」的攻击力提高效果最多可以叠加<color=#E78300>3</color>层，当叠加至<color=#E78300>3</color>层时<color=#E78300>8</color>秒内不再可叠加。",
		maxLv = 1,
		type = 1,
		id = 110720032,
		extra_param = "",
		param = {}
	},
	[110720033] = {
		description = "「财货如雨」的基础伤害提高<color=#E78300>{2}</color>，但不再消耗<material=underline c=#FFFFFF h=2 event=terminology args=(107201)>「财运」</material>、不再给全队伍附加加成效果。\n<material=underline c=#FFFFFF h=2 event=terminology args=(107201)>「财运」</material>点数达到满值时，每<color=#E78300>0.3</color>秒消耗<color=#E78300>1</color>点<material=underline c=#FFFFFF h=2 event=terminology args=(107201)>「财运」</material>，直至<material=underline c=#FFFFFF h=2 event=terminology args=(107201)>「财运」</material>点数为<color=#E78300>0</color>点，在期间不会获得<material=underline c=#FFFFFF h=2 event=terminology args=(107201)>「财运」</material>，自身技能伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 110720033,
		extra_param = "",
		param = {
			{
				88.8,
				0,
				false,
				"%"
			},
			{
				30,
				0,
				false,
				"%"
			}
		}
	},
	[110740011] = {
		description = "不处于<material=underline c=#FFFFFF h=2 event=terminology args=(107401)>「神司」</material>状态时，「御风击」、「巡天击」每次攻击命中后，获得<color=#E78300>10</color>点神能。",
		maxLv = 1,
		type = 1,
		id = 110740011,
		extra_param = "",
		param = {}
	},
	[110740012] = {
		description = "「踏云击」、「聚流击」、「振翼击」分别至少施放过一次后，下一次点击普通攻击会施放「御风击」并重置衍生技能的施放计数。",
		maxLv = 1,
		type = 1,
		id = 110740012,
		extra_param = "",
		param = {}
	},
	[110740013] = {
		description = "<material=underline c=#FFFFFF h=2 event=terminology args=(107401)>「神司」</material>状态每次神能消耗改变为<color=#E78300>1</color>点。处于<material=underline c=#FFFFFF h=2 event=terminology args=(107401)>「神司」</material>状态时，每命中敌人<color=#E78300>1</color>次会心率提高<color=#E78300>{1}</color>，最多可叠加<color=#E78300>10</color>层，每<color=#E78300>0.8</color>秒减少<color=#E78300>1</color>层。",
		maxLv = 1,
		type = 1,
		id = 110740013,
		extra_param = "",
		param = {
			{
				2,
				2,
				true,
				"%"
			}
		}
	},
	[110740021] = {
		description = "施放「踏云破空」后的下一次「踏云击」会造成共计<color=#E78300>{1}</color>（技能一每提升一级<color=#E78300>+{2}</color>）攻击力的风属性伤害。",
		maxLv = 1,
		type = 1,
		id = 110740021,
		extra_param = "",
		param = {
			{
				600,
				15.384,
				true,
				"%"
			},
			{
				15.385,
				0.394,
				true,
				"%"
			}
		}
	},
	[110740022] = {
		description = "施放「踏云破空」后的下一次「踏云击」获得以下效果：\n不处于<material=underline c=#FFFFFF h=2 event=terminology args=(107401)>「神司」</material>状态时，每次命中后，获得<color=#E78300>15</color>点神能；\n击退距离提高，击退的敌人撞击到其他敌人或击退距离足够远时会停下并造成范围伤害，造成共计<color=#E78300>{2}</color>攻击力的风属性伤害，对命中的敌人附加眩晕状态，持续<color=#E78300>{1}</color>秒，当敌人被击败时会触发爆破，造成共计<color=#E78300>{3}</color>攻击力的风属性伤害；\n对不受该次击退影响的敌人伤害提高<color=#E78300>{4}</color>。",
		maxLv = 1,
		type = 1,
		id = 110740022,
		extra_param = "",
		param = {
			{
				2,
				0,
				false,
				""
			},
			{
				300,
				7.692,
				true,
				"%"
			},
			{
				300,
				7.692,
				true,
				"%"
			},
			{
				30,
				0,
				false,
				"%"
			}
		}
	},
	[110740023] = {
		description = "处于<material=underline c=#FFFFFF h=2 event=terminology args=(107401)>「神司」</material>状态时获得以下效果：\n「踏云破空」的冷却时间额外缩短<color=#E78300>2</color>秒；\n施放「踏云破空」后的下一次「踏云击」击退的敌人撞击时也会触发爆破，造成共计<color=#E78300>{1}</color>攻击力的风属性伤害，每次施放最多触发一次。",
		maxLv = 1,
		type = 1,
		id = 110740023,
		extra_param = "",
		param = {
			{
				300,
				7.692,
				true,
				"%"
			}
		}
	},
	[110740031] = {
		description = "非移动闪避后完美时机衔接施放强化的「踏云破空」或「聚流啸海」或「振翼撼山」，每次攻击命中后，获得<color=#E78300>5</color>点神能。",
		maxLv = 1,
		type = 1,
		id = 110740031,
		extra_param = "",
		param = {}
	},
	[110740032] = {
		description = "非移动闪避后完美时机衔接施放强化的「踏云破空」或「聚流啸海」或「振翼撼山」后，下一次点击普通攻击时会施放「巡天击」。",
		maxLv = 1,
		type = 1,
		id = 110740032,
		extra_param = "",
		param = {}
	},
	[110740033] = {
		description = "处于<material=underline c=#FFFFFF h=2 event=terminology args=(107401)>「神司」</material>状态时，「聚流啸海」不再替换为「聚流击」，而是获得衔接非移动闪避施放时对应的强化效果。",
		maxLv = 1,
		type = 1,
		id = 110740033,
		extra_param = "",
		param = {}
	},
	[110750011] = {
		description = "<material=underline c=#FFFFFF h=2 event=terminology args=(107504)>「炫铠」</material>、<material=underline c=#FFFFFF h=2 event=terminology args=(107505)>「烬火」</material>、<material=underline c=#FFFFFF h=2 event=terminology args=(107506)>「煌焰」</material>、<material=underline c=#FFFFFF h=2 event=terminology args=(107507)>「阳炽」</material>、<material=underline c=#FFFFFF h=2 event=terminology args=(107508)>「烈阳炽」</material>的效果都仅对自身生效。\n出场时，自身每有<color=#E78300>25</color>生命值上限，基础攻击力提高<color=#E78300>1</color>，该效果提供的基础攻击力提高最高为<color=#E78300>3000</color>。",
		maxLv = 1,
		type = 1,
		id = 110750011,
		extra_param = "",
		param = {}
	},
	[110750012] = {
		description = "不再有<material=underline c=#FFFFFF h=2 event=terminology args=(107509)>「烈离」</material>状态，技能状态默认为<material=underline c=#FFFFFF h=2 event=terminology args=(107503)>「烈式」</material>。\n闪避不会打断普通攻击的连段。\n施放技能后衔接普通攻击时，不再固定从普通攻击第四段攻击开始，不同的技能后会衔接不同的普通攻击连段；<material=underline c=#FFFFFF h=2 event=terminology args=(107501)>「起式」</material>和<material=underline c=#FFFFFF h=2 event=terminology args=(107502)>「燃式」</material>施放条件改变，施放每段普通攻击时可通过长按普通攻击衔接施放技能，不同的普通攻击连段后会衔接施放不同的技能：\n普通攻击第一段时长按普通攻击，会衔接施放「离行不息·起式」；「离行不息·起式」后衔接普通攻击，会从普通攻击第二段开始攻击；\n普通攻击第二段时长按普通攻击，会衔接施放「晋照升明·起式」；「晋照升明·起式」后衔接普通攻击，会从普通攻击第三段开始攻击；\n普通攻击第三段时长按普通攻击，会衔接施放「离行不息·燃式」；「离行不息·燃式」后衔接普通攻击，会从普通攻击第四段开始攻击；\n普通攻击第四段时长按普通攻击，会衔接施放「晋照升明·燃式」；「晋照升明·燃式」后衔接普通攻击，会从普通攻击第五段开始攻击；\n普通攻击第五段时长按普通攻击，会衔接施放「天同人和·起式」；「天同人和·起式」后衔接普通攻击，会从普通攻击第四段开始攻击；\n施放「天同人和·起式」时点击普通攻击，会衔接施放「天同人和·燃式」；「天同人和·燃式」后衔接普通攻击，会从普通攻击第四段开始攻击。",
		maxLv = 1,
		type = 1,
		id = 110750012,
		extra_param = "",
		param = {}
	},
	[110750013] = {
		description = "不处于<material=underline c=#FFFFFF h=2 event=terminology args=(107510)>「燃离」</material>状态施放的<material=underline c=#FFFFFF h=2 event=terminology args=(107501)>「起式」</material>和<material=underline c=#FFFFFF h=2 event=terminology args=(107502)>「燃式」</material>技能种类数量达到<color=#E78300>4</color>时，施放「天同人和·燃式」命中时，进入<material=underline c=#FFFFFF h=2 event=terminology args=(107510)>「燃离」</material>状态，持续<color=#E78300>{1}</color>秒。\n<material=underline c=#FFFFFF h=2 event=terminology args=(107510)>「燃离」</material>：独立伤害提高<color=#E78300>{2}</color>。",
		maxLv = 1,
		type = 1,
		id = 110750013,
		extra_param = "",
		param = {
			{
				7,
				0,
				false,
				""
			},
			{
				70,
				0,
				false,
				"%"
			}
		}
	},
	[110750021] = {
		description = "<material=underline c=#FFFFFF h=2 event=terminology args=(107504)>「炫铠」</material>的护盾值提高<color=#E78300>20%</color>。",
		maxLv = 1,
		type = 1,
		id = 110750021,
		extra_param = "",
		param = {}
	},
	[110750022] = {
		description = "拥有<material=underline c=#FFFFFF h=2 event=terminology args=(107505)>「烬火」</material>的加成效果的自身或者队友，生命值越少防御力提高越高，该效果提供的防御力提高最高为<color=#E78300>150%</color>。\n拥有<material=underline c=#FFFFFF h=2 event=terminology args=(107506)>「煌焰」</material>的加成效果的自身或者队友，每<color=#E78300>3</color>秒恢复<color=#E78300>3%</color>的生命值；生命值为满时，改变为恢复<color=#E78300>3%</color>的奥义值。",
		maxLv = 1,
		type = 1,
		id = 110750022,
		extra_param = "",
		param = {}
	},
	[110750023] = {
		description = "拥有护盾<material=underline c=#FFFFFF h=2 event=terminology args=(107504)>「炫铠」</material>的自身或者队友，获得的<material=underline c=#FFFFFF h=2 event=terminology args=(107505)>「烬火」</material>或<material=underline c=#FFFFFF h=2 event=terminology args=(107506)>「煌焰」</material>的加成效果达到最高。\n自身施放奥义后或连携奥义时，全队伍攻击力提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110750023,
		extra_param = "",
		param = {
			{
				50,
				0,
				false,
				"%"
			},
			{
				5,
				0,
				false,
				""
			}
		}
	},
	[110750031] = {
		description = "自身技能攻击命中时，对命中的敌人附加火属性抗性降低<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110750031,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			},
			{
				7,
				0,
				false,
				""
			}
		}
	},
	[110750032] = {
		description = "全队伍火属性攻击命中处于火属性抗性降低状态的敌人时，命中瞬间攻击力提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 110750032,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			}
		}
	},
	[110750033] = {
		description = "自身或者队友拥有护盾<material=underline c=#FFFFFF h=2 event=terminology args=(107504)>「炫铠」</material>时，火属性伤害提高<color=#E78300>{1}</color>。\n自身施放奥义后或连携奥义时，全队伍火属性伤害提高<color=#E78300>{2}</color>，持续<color=#E78300>{3}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110750033,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			},
			{
				15,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			}
		}
	},
	[110760011] = {
		description = "「南极海鸣·阳」不再聚集敌人，造成<color=#E78300>{1}</color>攻击力的水属性伤害，并挑空全场敌人。",
		maxLv = 1,
		type = 1,
		id = 110760011,
		extra_param = "",
		param = {
			{
				128,
				3.282,
				true,
				"%"
			}
		}
	},
	[110760012] = {
		description = "所有处于浮空状态的敌人动作迟缓至<color=#E78300>{1}</color>，并对处于浮空状态的敌人附加动作迟缓至<color=#E78300>0%</color>，持续<color=#E78300>{2}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110760012,
		extra_param = "",
		param = {
			{
				50,
				0,
				false,
				"%"
			},
			{
				1,
				0,
				false,
				""
			}
		}
	},
	[110760013] = {
		description = "自身施放普通攻击时，每<color=#E78300>{4}</color>秒会随机选择锁定目标一定范围内处于浮空状态的敌人，将其投掷向锁定的敌人，投掷命中时对锁定的敌人附加停滞效果，持续<color=#E78300>{1}</color>秒，当被这个效果停滞的敌人再次被投掷命中时，停滞效果持续时间延长<color=#E78300>{2}</color>秒，最多可延长<color=#E78300>{3}</color>次；选择浮空状态的敌人时，每个敌人每<color=#E78300>{5}</color>秒最多被选择一次；被停滞的敌人停滞效果结束后，<color=#E78300>{6}</color>秒内不会受到停滞效果影响。",
		maxLv = 1,
		type = 1,
		id = 110760013,
		extra_param = "",
		param = {
			{
				1,
				0,
				false,
				""
			},
			{
				1,
				0,
				false,
				""
			},
			{
				3,
				0,
				false,
				""
			},
			{
				0.2,
				0,
				false,
				""
			},
			{
				4,
				0,
				false,
				""
			},
			{
				28,
				-1,
				true,
				""
			}
		}
	},
	[110760021] = {
		description = "所有处于浮空状态的敌人动作迟缓至<color=#E78300>{1}</color>；最长浮空时间延长<color=#E78300>100%</color>。",
		maxLv = 1,
		type = 1,
		id = 110760021,
		extra_param = "",
		param = {
			{
				30,
				0,
				false,
				"%"
			}
		}
	},
	[110760022] = {
		description = "「冀野星陨·阳」、「黎丘云合·阳」最后一次攻击命中时，重置敌人的最长浮空时间，每个敌人每次浮空最多重置<color=#E78300>{1}</color>次。",
		maxLv = 1,
		type = 1,
		id = 110760022,
		extra_param = "",
		param = {
			{
				3,
				0,
				false,
				""
			}
		}
	},
	[110760023] = {
		description = "施放「南极海鸣·阳」后，对全场敌人附加破甲状态，防御力降低<color=#E78300>{2}</color>，持续<color=#E78300>{3}</color>秒。\n「南极海鸣·阳」聚集敌人时，对聚集范围内所有不受影响的敌人附加停滞效果，持续<color=#E78300>{1}</color>秒。\n「南极海鸣·阴」每次随机攻击命中时附加全属性抗性降低<color=#E78300>{4}</color>，持续<color=#E78300>{5}</color>秒，每个敌人该效果最多可叠加<color=#E78300>{6}</color>层。",
		maxLv = 1,
		type = 1,
		id = 110760023,
		extra_param = "",
		param = {
			{
				5,
				0,
				false,
				""
			},
			{
				5,
				1,
				true,
				"%"
			},
			{
				12,
				0,
				false,
				""
			},
			{
				5,
				5,
				true,
				"%"
			},
			{
				12,
				0,
				false,
				""
			},
			{
				4,
				0,
				false,
				""
			}
		}
	},
	[110760031] = {
		description = "敌人落地时会产生范围伤害，造成<color=#E78300>{2}</color>攻击力的水属性伤害，该效果每<color=#E78300>{1}</color>秒最多触发一次。",
		maxLv = 1,
		type = 1,
		id = 110760031,
		extra_param = "",
		param = {
			{
				0.2,
				0,
				false,
				""
			},
			{
				128,
				3.282,
				true,
				"%"
			}
		}
	},
	[110760032] = {
		description = "普通攻击最后一段命中处于浮空状态的敌人时，会将敌人强制下落。「黎丘云合·阴」每次命中时也会挑空敌人。",
		maxLv = 1,
		type = 1,
		id = 110760032,
		extra_param = "",
		param = {}
	},
	[110760033] = {
		description = "施放「南极海鸣·阳」后，自身攻击力提高<color=#E78300>{5}</color>，持续<color=#E78300>{6}</color>秒。\n「南极海鸣·阳」聚集敌人时，对聚集范围内精英和首领敌人以及不受聚集影响的普通敌人附加<material=underline c=#FFFFFF h=2 event=terminology args=(107605)>「重渊」</material>状态，持续<color=#E78300>{1}</color>秒。\n全队伍攻击命中处于<material=underline c=#FFFFFF h=2 event=terminology args=(107605)>「重渊」</material>状态的敌人时，自身会触发攻击，造成<color=#E78300>{3}</color>（技能三每提升一级<color=#E78300>+{4}</color>）攻击力的水属性伤害，该效果每<color=#E78300>{2}</color>秒最多触发一次。",
		maxLv = 1,
		type = 1,
		id = 110760033,
		extra_param = "",
		param = {
			{
				12,
				0,
				false,
				""
			},
			{
				1,
				0,
				false,
				""
			},
			{
				128,
				3.282,
				true,
				"%"
			},
			{
				3.282,
				0.084,
				true,
				"%"
			},
			{
				16,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			}
		}
	},
	[110800011] = {
		description = "普通攻击对处于冰冻状态的敌人命中瞬间伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 110800011,
		extra_param = "",
		param = {
			{
				200,
				0,
				false,
				"%"
			}
		}
	},
	[110800012] = {
		description = "「永冻净土」附加的冰冻状态持续时间延长<color=#E78300>2</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110800012,
		extra_param = "",
		param = {}
	},
	[110800013] = {
		description = "「永冻净土」每命中敌人<color=#E78300>1</color>次，剩余冷却时间缩短<color=#E78300>1</color>秒，该效果最多缩短<color=#E78300>3</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110800013,
		extra_param = "",
		param = {}
	},
	[110800021] = {
		description = "「寒潮漩涡」每命中敌人<color=#E78300>1</color>次，获得<color=#E78300>1</color>点怒气。",
		maxLv = 1,
		type = 1,
		id = 110800021,
		extra_param = "",
		param = {}
	},
	[110800022] = {
		description = "「寒潮漩涡」可通过长按来增加旋转圈数，每二个额外圈数消耗<color=#E78300>10</color>点怒气。",
		maxLv = 1,
		type = 1,
		id = 110800022,
		extra_param = "",
		param = {}
	},
	[110800023] = {
		description = "「极地猎袭」不再消耗怒气，而是获得<color=#E78300>35</color>点怒气，但伤害衰减<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 110800023,
		extra_param = "",
		param = {
			{
				15,
				0,
				false,
				"%"
			}
		}
	},
	[110800031] = {
		description = "「极地猎袭」的基础伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 110800031,
		extra_param = "",
		param = {
			{
				25,
				0,
				false,
				"%"
			}
		}
	},
	[110800032] = {
		description = "「极地猎袭」对处于冰冻状态的敌人命中瞬间会心率提高<color=#E78300>100%</color>。",
		maxLv = 1,
		type = 1,
		id = 110800032,
		extra_param = "",
		param = {}
	},
	[110800033] = {
		description = "「极地猎袭」每次命中未能击败敌人时，每命中敌人<color=#E78300>1</color>次，剩余冷却时间缩短<color=#E78300>50%</color>、命中瞬间会心伤害提高<color=#E78300>{1}</color>，该效果提供的会心伤害提高最高为<color=#E78300>150%</color>。",
		maxLv = 1,
		type = 1,
		id = 110800033,
		extra_param = "",
		param = {
			{
				15,
				15,
				true,
				"%"
			}
		}
	},
	[110810011] = {
		description = "利剑式跟踪导弹每次命中时有<color=#E78300>10%</color>的概率获得<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(108101)>「破冰」</material>标记，该效果每<color=#E78300>3</color>秒最多触发一次。",
		maxLv = 1,
		type = 1,
		id = 110810011,
		extra_param = "",
		param = {}
	},
	[110810012] = {
		description = "进入<material=underline c=#FFFFFF h=2 event=terminology args=(108102)>「巡航模式」</material>时，会消耗全部<material=underline c=#FFFFFF h=2 event=terminology args=(108101)>「破冰」</material>标记。每消耗<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(108101)>「破冰」</material>标记，<material=underline c=#FFFFFF h=2 event=terminology args=(108102)>「巡航模式」</material>的持续时间延长<color=#E78300>3</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110810012,
		extra_param = "",
		param = {}
	},
	[110810013] = {
		description = "<material=underline c=#FFFFFF h=2 event=terminology args=(108102)>「巡航模式」</material>结束的跃出伤害提高，根据<material=underline c=#FFFFFF h=2 event=terminology args=(108102)>「巡航模式」</material>中普通攻击释放的利剑式跟踪导弹数量，每释放<color=#E78300>1</color>枚追踪导弹，命中瞬间伤害提高<color=#E78300>{1}</color>，该效果提供的伤害提高最高为<color=#E78300>300%</color>。",
		maxLv = 1,
		type = 1,
		id = 110810013,
		extra_param = "",
		param = {
			{
				3,
				3,
				true,
				"%"
			}
		}
	},
	[110810021] = {
		description = "<material=underline c=#FFFFFF h=2 event=terminology args=(108101)>「破冰」</material>标记上限增加<color=#E78300>1</color>个。",
		maxLv = 1,
		type = 1,
		id = 110810021,
		extra_param = "",
		param = {}
	},
	[110810022] = {
		description = "<material=underline c=#FFFFFF h=2 event=terminology args=(108102)>「巡航模式」</material>时，<material=underline c=#FFFFFF h=2 event=terminology args=(108101)>「破冰」</material>标记的加成效果提高<color=#E78300>100%</color>。",
		maxLv = 1,
		type = 1,
		id = 110810022,
		extra_param = "",
		param = {}
	},
	[110810023] = {
		description = "<material=underline c=#FFFFFF h=2 event=terminology args=(108101)>「破冰」</material>标记的加成效果会作用于全队伍，但对队友的效果降低至一半。",
		maxLv = 1,
		type = 1,
		id = 110810023,
		extra_param = "",
		param = {}
	},
	[110810031] = {
		description = "当神能为满时，施放「冰锋闪袭」命中时会改变为消耗<color=#E78300>25</color>点神能，对命中的敌人附加冰冻状态，持续<color=#E78300>{1}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110810031,
		extra_param = "",
		param = {
			{
				2,
				0,
				false,
				""
			}
		}
	},
	[110810032] = {
		description = "当拥有的标记为满时，施放「破空寒流」命中时会改变为消耗<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(108101)>「破冰」</material>标记，命中瞬间伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 110810032,
		extra_param = "",
		param = {
			{
				60,
				0,
				false,
				"%"
			}
		}
	},
	[110810033] = {
		description = "「霜断」蓄力时间缩短<color=#E78300>1</color>秒。每次施放「霜断」命中时，「破空寒流」或「冰锋闪袭」中随机一个处于冷却状态的技能的剩余冷却时间缩短<color=#E78300>1</color>秒；剩余冷却时间缩短成功时，<material=underline c=#FFFFFF h=2 event=terminology args=(108102)>「巡航模式」</material>的剩余冷却时间延长<color=#E78300>3</color>秒，<material=underline c=#FFFFFF h=2 event=terminology args=(108102)>「巡航模式」</material>不处于冷却状态时也会增加<color=#E78300>3</color>秒剩余冷却时间。",
		maxLv = 1,
		type = 1,
		id = 110810033,
		extra_param = "",
		param = {}
	},
	[110840011] = {
		description = "「逐光落影」命中瞬间伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 110840011,
		extra_param = "",
		param = {
			{
				30,
				0,
				false,
				"%"
			}
		}
	},
	[110840012] = {
		description = "「分光剑影」或「逐光落影」击败敌人时，获得<color=#E78300>10</color>点神能、<color=#E78300>3.75%</color>的奥义值。",
		maxLv = 1,
		type = 1,
		id = 110840012,
		extra_param = "",
		param = {}
	},
	[110840013] = {
		description = "施放奥义后，伤害提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110840013,
		extra_param = "",
		param = {
			{
				20,
				0,
				false,
				"%"
			},
			{
				15,
				0,
				false,
				""
			}
		}
	},
	[110840021] = {
		description = "处于零时空间时，伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 110840021,
		extra_param = "",
		param = {
			{
				60,
				0,
				false,
				"%"
			}
		}
	},
	[110840022] = {
		description = "自身触发闪避效果时，重置「高速突刺」的冷却时间，并获得<color=#E78300>{1}</color>点神能。",
		maxLv = 1,
		type = 1,
		id = 110840022,
		extra_param = "",
		param = {
			{
				20,
				0,
				false,
				""
			}
		}
	},
	[110840023] = {
		description = "「逐光落影」命中时，会重置「事象洞悉」的冷却时间。",
		maxLv = 1,
		type = 1,
		id = 110840023,
		extra_param = "",
		param = {}
	},
	[110840031] = {
		description = "「分光剑影」和「逐光落影」的修正系数提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 110840031,
		extra_param = "",
		param = {
			{
				50,
				0,
				false,
				"%"
			}
		}
	},
	[110840032] = {
		description = "处于修正模式时，伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 110840032,
		extra_param = "",
		param = {
			{
				80,
				0,
				false,
				"%"
			}
		}
	},
	[110840033] = {
		description = "进入修正模式时，重置「迅捷横斩」与「分光剑影」的冷却时间，并获得<color=#E78300>100</color>点神能。",
		maxLv = 1,
		type = 1,
		id = 110840033,
		extra_param = "",
		param = {}
	},
	[110890011] = {
		description = "「坎蒂破影」可充能<color=#E78300>2</color>次。",
		maxLv = 1,
		type = 1,
		id = 110890011,
		extra_param = "",
		param = {}
	},
	[110890012] = {
		description = "施放「坎蒂破影」时，神能获得率提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒，最多可叠加<color=#E78300>6</color>层。",
		maxLv = 1,
		type = 1,
		id = 110890012,
		extra_param = "",
		param = {
			{
				25,
				25,
				true,
				"%"
			},
			{
				12,
				0,
				false,
				""
			}
		}
	},
	[110890013] = {
		description = "每消耗<color=#E78300>1</color>颗<material=underline c=#FFFFFF h=2 event=terminology args=(108901)>「风弹」</material>，获得<color=#E78300>1</color>层技能二基础伤害提高<color=#E78300>{1}</color>，最多可叠加<color=#E78300>36</color>层；消耗<material=underline c=#FFFFFF h=2 event=terminology args=(108901)>「风弹」</material>的「坎蒂破影」命中时，每有<color=#E78300>1</color>层命中瞬间基础伤害额外提高<color=#E78300>{2}</color>。\n<material=underline c=#FFFFFF h=2 event=terminology args=(108907)>「赤红」</material>状态层数不低于<color=#E78300>50</color>层时，「自在花舞」攻击命中同一个敌人<color=#E78300>6</color>次后，对敌人附加<material=underline c=#FFFFFF h=2 event=terminology args=(108908)>「雪莲」</material>状态，持续<color=#E78300>1</color>秒，最后一次攻击命中处于<material=underline c=#FFFFFF h=2 event=terminology args=(108908)>「雪莲」</material>状态的敌人时，移除<material=underline c=#FFFFFF h=2 event=terminology args=(108908)>「雪莲」</material>并额外造成共计<color=#E78300>{3}</color>（技能三每提升一级<color=#E78300>+{4}</color>）攻击力的风属性伤害。",
		maxLv = 1,
		type = 1,
		id = 110890013,
		extra_param = "",
		param = {
			{
				0.5,
				0.5,
				true,
				"%"
			},
			{
				0.5,
				0.5,
				true,
				"%"
			},
			{
				600,
				15.381,
				true,
				"%"
			},
			{
				15.385,
				0.394,
				true,
				"%"
			}
		}
	},
	[110890021] = {
		description = "手动装填时，根据消耗的神能，每消耗<color=#E78300>15</color>点神能，自身攻击力提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒，该效果提供的攻击力提高最高为<color=#E78300>{3}</color>。",
		maxLv = 1,
		type = 1,
		id = 110890021,
		extra_param = "",
		param = {
			{
				2,
				2,
				true,
				"%"
			},
			{
				6,
				0,
				false,
				""
			},
			{
				12,
				12,
				true,
				"%"
			}
		}
	},
	[110890022] = {
		description = "普通攻击获得的神能增加效果持续时间改变为<color=#E78300>9</color>秒。\n「格刹奔袭」、「坎蒂破影」的剩余冷却时间缩短效果改变为<color=#E78300>40%</color>，并且触发剩余冷却时间缩短时，对应的另一个技能也会触发剩余冷却时间缩短。",
		maxLv = 1,
		type = 1,
		id = 110890022,
		extra_param = "",
		param = {}
	},
	[110890023] = {
		description = "手动装填时，自身风属性伤害提高<color=#E78300>51%</color>，持续<color=#E78300>{1}</color>秒，消耗的神能每比<color=#E78300>15</color>的任意整数倍多<color=#E78300>1</color>点，风属性伤害提高减少<color=#E78300>5%</color>，风属性伤害提高最低减少至<color=#E78300>1%</color>。",
		maxLv = 1,
		type = 1,
		id = 110890023,
		extra_param = "",
		param = {
			{
				6,
				0,
				false,
				""
			}
		}
	},
	[110890031] = {
		description = "出场时或恢复连携奥义时，自身和与自身预组合连携奥义的修正者获得以下效果：\n技能攻击命中<color=#E78300>15</color>次时，技能伤害提高<color=#E78300>{1}</color>，解除连携奥义时，该技能伤害提高效果改变为<color=#E78300>{2}</color>，恢复连携奥义时移除该效果。",
		maxLv = 1,
		type = 1,
		id = 110890031,
		extra_param = "",
		param = {
			{
				6,
				6,
				true,
				"%"
			},
			{
				36,
				36,
				true,
				"%"
			}
		}
	},
	[110890032] = {
		description = "<material=underline c=#FFFFFF h=2 event=terminology args=(108907)>「赤红」</material>状态改变为对全队伍生效。",
		maxLv = 1,
		type = 1,
		id = 110890032,
		extra_param = "",
		param = {}
	},
	[110890033] = {
		description = "消耗<material=underline c=#FFFFFF h=2 event=terminology args=(108901)>「风弹」</material>后，恢复全队<color=#E78300>{1}</color>的生命值，每消耗<color=#E78300>1</color>颗<material=underline c=#FFFFFF h=2 event=terminology args=(108901)>「风弹」</material>，队友获得<color=#E78300>1</color>层会心提高效果，持续<color=#E78300>{4}</color>秒，每层会心率提高<color=#E78300>{2}</color>、会心伤害提高<color=#E78300>{3}</color>，最多可叠加<color=#E78300>6</color>层。\n施放奥义「净世焚轮」后，全队伍奥义或连携奥义攻击命中瞬间会心率提高<color=#E78300>{5}</color>。",
		maxLv = 1,
		type = 1,
		id = 110890033,
		extra_param = "",
		param = {
			{
				4,
				0,
				false,
				"%"
			},
			{
				4,
				4,
				true,
				"%"
			},
			{
				10,
				10,
				true,
				"%"
			},
			{
				12,
				0,
				false,
				""
			},
			{
				24,
				0,
				false,
				"%"
			}
		}
	},
	[110930011] = {
		description = "每拥有<color=#E78300>1</color>个「天」，会心伤害提高<color=#E78300>{1}</color>，失去<material=underline c=#FFFFFF h=2 event=terminology args=(109301)>「忍持」</material>时移除该效果。",
		maxLv = 1,
		type = 1,
		id = 110930011,
		extra_param = "",
		param = {
			{
				50,
				50,
				true,
				"%"
			}
		}
	},
	[110930012] = {
		description = "每拥有<color=#E78300>1</color>个「地」，攻击力提高<color=#E78300>{1}</color>，失去<material=underline c=#FFFFFF h=2 event=terminology args=(109301)>「忍持」</material>时移除该效果。",
		maxLv = 1,
		type = 1,
		id = 110930012,
		extra_param = "",
		param = {
			{
				25,
				25,
				true,
				"%"
			}
		}
	},
	[110930013] = {
		description = "失去<material=underline c=#FFFFFF h=2 event=terminology args=(109301)>「忍持」</material>时，根据消耗的「天」与「地」两种持的数量，每有<color=#E78300>1</color>个「天」，会心伤害提高<color=#E78300>{1}</color>，每有<color=#E78300>1</color>个「地」，攻击力提高<color=#E78300>{2}</color>，持续<color=#E78300>3</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110930013,
		extra_param = "",
		param = {
			{
				100,
				100,
				true,
				"%"
			},
			{
				50,
				50,
				true,
				"%"
			}
		}
	},
	[110930021] = {
		description = "结印成功获得<material=underline c=#FFFFFF h=2 event=terminology args=(109301)>「忍持」</material>时，获得<color=#E78300>20</color>点神能。",
		maxLv = 1,
		type = 1,
		id = 110930021,
		extra_param = "",
		param = {}
	},
	[110930022] = {
		description = "施放不同于上一个的「忍法」技能时，「天之持」和「地之持」的剩余冷却时间缩短<color=#E78300>2</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110930022,
		extra_param = "",
		param = {}
	},
	[110930023] = {
		description = "施放的「忍法」技能的第一个「持」和上一个施放的「忍法」技能的第二个「持」不同时，该「忍法」命中瞬间伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 110930023,
		extra_param = "",
		param = {
			{
				50,
				0,
				false,
				"%"
			}
		}
	},
	[110930031] = {
		description = "出场时，会根据自身和队友的伤害属性种类，自身对应属性伤害提高<color=#E78300>{1}</color>，相同属性的效果不可叠加。",
		maxLv = 1,
		type = 1,
		id = 110930031,
		extra_param = "",
		param = {
			{
				25,
				0,
				false,
				"%"
			}
		}
	},
	[110930032] = {
		description = "不同的「忍法」技能会对敌人附加不同状态。\n「苦无时雨」：对命中的敌人附加破甲状态，防御力降低<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒。\n「般若惊雷」：最后一段攻击命中后，对命中的敌人附加眩晕状态，持续<color=#E78300>{3}</color>秒。\n「镰鼬旋风」：对命中的敌人附加虚弱状态，攻击力降低<color=#E78300>{4}</color>，持续<color=#E78300>{5}</color>秒。\n「地爆界法」：对命中的敌人附加灼烧状态，持续<color=#E78300>{7}</color>秒。\n灼烧：每<color=#E78300>3</color>秒附加<color=#E78300>{6}</color>攻击力的火属性伤害，持续<color=#E78300>{7}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110930032,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			},
			{
				7,
				0,
				false,
				""
			},
			{
				3,
				0,
				false,
				""
			},
			{
				30,
				0.1,
				true,
				"%"
			},
			{
				7,
				0,
				false,
				""
			},
			{
				30,
				0,
				false,
				"%"
			},
			{
				13,
				0,
				false,
				""
			}
		}
	},
	[110930033] = {
		description = "对处于控制抗性的敌人命中瞬间会心率提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 110930033,
		extra_param = "",
		param = {
			{
				60,
				0,
				false,
				"%"
			}
		}
	},
	[110940011] = {
		description = "处于「归灭裁定」的炮垒形态时，受到的伤害降低<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 110940011,
		extra_param = "",
		param = {
			{
				20,
				0,
				false,
				"%"
			}
		}
	},
	[110940012] = {
		description = "普通攻击不再获得神能，改变为每<color=#E78300>1</color>秒自动获得<color=#E78300>{1}</color>点神能。",
		maxLv = 1,
		type = 1,
		id = 110940012,
		extra_param = "",
		param = {
			{
				3,
				0,
				false,
				""
			}
		}
	},
	[110940013] = {
		description = "神能上限增加<color=#E78300>20</color>点。",
		maxLv = 1,
		type = 1,
		id = 110940013,
		extra_param = "",
		param = {}
	},
	[110940021] = {
		description = "「冥灵爆破」的基础伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 110940021,
		extra_param = "",
		param = {
			{
				80,
				0,
				false,
				"%"
			}
		}
	},
	[110940022] = {
		description = "「冥灵爆破」命中时会产生一片「灵能迷雾」，持续<color=#E78300>6</color>秒，造成<color=#E78300>{2}</color>攻击力的暗属性伤害，对命中的敌人附加混乱状态，离开「灵能迷雾」后混乱状态持续<color=#E78300>{1}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110940022,
		extra_param = "",
		param = {
			{
				1,
				0,
				false,
				""
			},
			{
				200,
				5.128,
				true,
				"%"
			}
		}
	},
	[110940023] = {
		description = "「噩梦收割」命中「灵能迷雾」时，会产生范围性的爆炸和击飞，造成<color=#E78300>{1}</color>攻击力的暗属性伤害。",
		maxLv = 1,
		type = 1,
		id = 110940023,
		extra_param = "",
		param = {
			{
				200,
				5.128,
				true,
				"%"
			}
		}
	},
	[110940031] = {
		description = "对普通敌人伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 110940031,
		extra_param = "",
		param = {
			{
				70,
				0,
				false,
				"%"
			}
		}
	},
	[110940032] = {
		description = "「归灭裁定」的炮击附加牵引效果，但每次炮击会消耗<color=#E78300>30</color>点神能。",
		maxLv = 1,
		type = 1,
		id = 110940032,
		extra_param = "",
		param = {}
	},
	[110940033] = {
		description = "「归灭裁定」的爆炸和牵引范围提高<color=#E78300>60%</color>。",
		maxLv = 1,
		type = 1,
		id = 110940033,
		extra_param = "",
		param = {}
	},
	[110950011] = {
		description = "普通攻击伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 110950011,
		extra_param = "",
		param = {
			{
				20,
				0,
				false,
				"%"
			}
		}
	},
	[110950012] = {
		description = "不处于<material=underline c=#FFFFFF h=2 event=terminology args=(109501)>「牵丝」</material>状态时，每次普通攻击或技能命中后恢复<color=#E78300>1</color>点能量。\n处于<material=underline c=#FFFFFF h=2 event=terminology args=(109501)>「牵丝」</material>状态时，改变为每<color=#E78300>0.15</color>秒失去<color=#E78300>1</color>点能量。",
		maxLv = 1,
		type = 1,
		id = 110950012,
		extra_param = "",
		param = {}
	},
	[110950013] = {
		description = "处于<material=underline c=#FFFFFF h=2 event=terminology args=(109501)>「牵丝」</material>状态时，攻击力提高<color=#E78300>{1}</color>，每次击败敌人时，获得<color=#E78300>20</color>点能量。",
		maxLv = 1,
		type = 1,
		id = 110950013,
		extra_param = "",
		param = {
			{
				20,
				0,
				false,
				"%"
			}
		}
	},
	[110950021] = {
		description = "施放「刃舞」、「刀纱」极限闪避敌人的攻击后<color=#E78300>3</color>秒内点击普通攻击，也会施放「幻丝」。\n「幻丝」命中瞬间技能伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 110950021,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			}
		}
	},
	[110950022] = {
		description = "每次施放「幻丝」时，获得<color=#E78300>1</color>层<material=underline c=#FFFFFF h=2 event=terminology args=(109504)>「丝缘」</material>，每层<material=underline c=#FFFFFF h=2 event=terminology args=(109504)>「丝缘」</material>自身会心伤害提高<color=#E78300>{1}</color>、护甲穿透提高<color=#E78300>{2}</color>，最多可叠加<color=#E78300>7</color>层；受击时，失去<color=#E78300>1</color>层<material=underline c=#FFFFFF h=2 event=terminology args=(109504)>「丝缘」</material>。\n处于<material=underline c=#FFFFFF h=2 event=terminology args=(109501)>「牵丝」</material>状态时获得满层<material=underline c=#FFFFFF h=2 event=terminology args=(109504)>「丝缘」</material>，受击时也不会失去层数。",
		maxLv = 1,
		type = 1,
		id = 110950022,
		extra_param = "",
		param = {
			{
				4.5,
				4.5,
				true,
				"%"
			},
			{
				3,
				3,
				true,
				"%"
			}
		}
	},
	[110950023] = {
		description = "消耗<color=#E78300>2</color>个标记施放「刻韵」后<color=#E78300>3</color>秒内点击普通攻击，也会施放「幻丝」。\n拥有<color=#E78300>7</color>层<material=underline c=#FFFFFF h=2 event=terminology args=(109504)>「丝缘」</material>时，自身独立伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 110950023,
		extra_param = "",
		param = {
			{
				50,
				0,
				false,
				"%"
			}
		}
	},
	[110950031] = {
		description = "不处于<material=underline c=#FFFFFF h=2 event=terminology args=(109501)>「牵丝」</material>状态时，「刃舞」、「刀纱」、「丝雨」、「缀影」命中瞬间技能伤害提高<color=#E78300>{1}</color>。\n处于<material=underline c=#FFFFFF h=2 event=terminology args=(109501)>「牵丝」</material>状态时，「刀纱」、「缀影」、「刻韵·刃」、「刻韵·丝」命中瞬间技能伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 110950031,
		extra_param = "",
		param = {
			{
				7,
				0,
				false,
				"%"
			}
		}
	},
	[110950032] = {
		description = "「刃舞」、「刀纱」、「刻韵·刃」命中时也会给敌人附加<material=underline c=#FFFFFF h=2 event=terminology args=(109502)>「羽刃」</material>标记，「丝雨」、「缀影」、「刻韵·丝」命中时也会给敌人附加<material=underline c=#FFFFFF h=2 event=terminology args=(109503)>「银丝」</material>标记，每种标记最多存在<color=#E78300>1</color>个。\n当敌人被附加<color=#E78300>2</color>种标记<color=#E78300>2</color>秒后，清除标记并附加破甲状态，防御力降低<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒，附加动作迟缓至<color=#E78300>75%</color>，持续<color=#E78300>{3}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110950032,
		extra_param = "",
		param = {
			{
				7,
				0,
				false,
				"%"
			},
			{
				7,
				0,
				false,
				""
			},
			{
				3,
				0,
				false,
				""
			}
		}
	},
	[110950033] = {
		description = "出场时，全队伍会心伤害提高都高于<color=#E78300>70%</color>时，全队伍攻击力提高<color=#E78300>{1}</color>。\n处于<material=underline c=#FFFFFF h=2 event=terminology args=(109501)>「牵丝」</material>状态时，全队伍独立伤害提高<color=#E78300>{2}</color>。",
		maxLv = 1,
		type = 1,
		id = 110950033,
		extra_param = "",
		param = {
			{
				30,
				0,
				false,
				"%"
			},
			{
				20,
				0,
				false,
				"%"
			}
		}
	},
	[110960011] = {
		description = "处于<material=underline c=#FFFFFF h=2 event=terminology args=(109601)>「矢量加速」</material>状态时，每<color=#E78300>1</color>秒恢复<color=#E78300>{1}</color>点怒气和自身<color=#E78300>{2}</color>攻击力的生命值。",
		maxLv = 1,
		type = 1,
		id = 110960011,
		extra_param = "",
		param = {
			{
				4,
				0,
				false,
				""
			},
			{
				3,
				0,
				false,
				"%"
			}
		}
	},
	[110960012] = {
		description = "怒气越多，「风驰迹掣」追加攻击命中瞬间伤害越高，该效果提供的伤害提高最高为<color=#E78300>100%</color>。",
		maxLv = 1,
		type = 1,
		id = 110960012,
		extra_param = "",
		param = {}
	},
	[110960013] = {
		description = "怒气不低于<color=#E78300>80</color>点时，会心率提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 110960013,
		extra_param = "",
		param = {
			{
				25,
				0,
				false,
				"%"
			}
		}
	},
	[110960021] = {
		description = "奥义获得率提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 110960021,
		extra_param = "",
		param = {
			{
				25,
				0,
				false,
				"%"
			}
		}
	},
	[110960022] = {
		description = "<material=underline c=#FFFFFF h=2 event=terminology args=(109602)>「逐风标记」</material>的持续时间延长<color=#E78300>5</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110960022,
		extra_param = "",
		param = {}
	},
	[110960023] = {
		description = "队友从<material=underline c=#FFFFFF h=2 event=terminology args=(109602)>「逐风标记」</material>的顺风方位攻击处于<material=underline c=#FFFFFF h=2 event=terminology args=(109602)>「逐风标记」</material>状态的敌人时，命中瞬间伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 110960023,
		extra_param = "",
		param = {
			{
				25,
				0,
				false,
				"%"
			}
		}
	},
	[110960031] = {
		description = "从<material=underline c=#FFFFFF h=2 event=terminology args=(109602)>「逐风标记」</material>的顺风方位攻击处于<material=underline c=#FFFFFF h=2 event=terminology args=(109602)>「逐风标记」</material>状态的敌人时，每次命中额外获得<color=#E78300>2</color>点怒气。",
		maxLv = 1,
		type = 1,
		id = 110960031,
		extra_param = "",
		param = {}
	},
	[110960032] = {
		description = "对处于<material=underline c=#FFFFFF h=2 event=terminology args=(109602)>「逐风标记」</material>状态的敌人施放「风驰迹掣」时，会机动到顺风方位。从<material=underline c=#FFFFFF h=2 event=terminology args=(109602)>「逐风标记」</material>的顺风方位施放「风驰迹掣」时，会直接施放「风驰迹掣」追加攻击，施放后该技能会进入冷却。",
		maxLv = 1,
		type = 1,
		id = 110960032,
		extra_param = "",
		param = {}
	},
	[110960033] = {
		description = "「闪绝岚破」会拉扯附近的敌人。",
		maxLv = 1,
		type = 1,
		id = 110960033,
		extra_param = "",
		param = {}
	},
	[110970011] = {
		description = "「眠羊游行」每次命中时，后续的命中瞬间伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 110970011,
		extra_param = "",
		param = {
			{
				25,
				25,
				true,
				"%"
			}
		}
	},
	[110970012] = {
		description = "「眠羊游行」命中处在技能二生成的领域内的敌人时，对命中的敌人附加光属性抗性、暗属性抗性降低<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110970012,
		extra_param = "",
		param = {
			{
				25,
				0,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[110970013] = {
		description = "自身触发闪避效果时，重置「眠羊游行」的冷却时间。",
		maxLv = 1,
		type = 1,
		id = 110970013,
		extra_param = "",
		param = {}
	},
	[110970021] = {
		description = "「梦幻泡影」的蓄力时间上限延长，额外增加<color=#E78300>2</color>段蓄力；每段蓄力泡梦的蓄力技能伤害改变为<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 110970021,
		extra_param = "",
		param = {
			{
				75,
				75,
				true,
				"%"
			}
		}
	},
	[110970022] = {
		description = "当闪避效果不处于冷却状态时，「梦幻泡影」蓄力期间受击时会格挡伤害并触发闪避效果，触发时自身不会进入受击状态也不会打断蓄力，并对周围的敌人附加禁锢状态，持续<color=#E78300>5</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110970022,
		extra_param = "",
		param = {}
	},
	[110970023] = {
		description = "「梦幻泡影」蓄力时每<color=#E78300>0.5</color>至<color=#E78300>1</color>秒会对自身周围区域造成<color=#E78300>{1}</color>攻击力的光属性伤害。",
		maxLv = 1,
		type = 1,
		id = 110970023,
		extra_param = "",
		param = {
			{
				240,
				6.153,
				true,
				"%"
			}
		}
	},
	[110970031] = {
		description = "敌人被附加禁锢状态时，获得<color=#E78300>{1}</color>点能量，该效果每<color=#E78300>3</color>秒最多触发一次。",
		maxLv = 1,
		type = 1,
		id = 110970031,
		extra_param = "",
		param = {
			{
				30,
				0,
				false,
				""
			}
		}
	},
	[110970032] = {
		description = "「绘梦童话」的效果提高<color=#E78300>30%</color>。",
		maxLv = 1,
		type = 1,
		id = 110970032,
		extra_param = "",
		param = {}
	},
	[110970033] = {
		description = "「绘梦童话」的效果会在开启后持续至主动关闭或者能量不足时，最多持续<color=#E78300>60</color>秒，期间内不再自动获得能量，并且每<color=#E78300>1</color>秒消耗<color=#E78300>3</color>点能量，效果结束后技能进入冷却；「绘梦童话」效果持续期间，施放「眠羊游行」不再消耗能量；「绘梦童话」冷却时间缩短<color=#E78300>16</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110970033,
		extra_param = "",
		param = {}
	},
	[110990011] = {
		description = "「月弧斩」获得的神能额外提高<color=#E78300>3</color>点。",
		maxLv = 1,
		type = 1,
		id = 110990011,
		extra_param = "",
		param = {}
	},
	[110990012] = {
		description = "「月弧斩」的基础伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 110990012,
		extra_param = "",
		param = {
			{
				30,
				0,
				false,
				"%"
			}
		}
	},
	[110990013] = {
		description = "「月弧斩」的每次命中后有<color=#E78300>25%</color>的概率随机重置自身一个处于冷却状态的其他技能或奥义的冷却时间，该效果每次施放「月弧斩」最多触发一次。",
		maxLv = 1,
		type = 1,
		id = 110990013,
		extra_param = "",
		param = {}
	},
	[110990021] = {
		description = "<material=underline c=#FFFFFF h=2 event=terminology args=(109901)>「望」</material>命中瞬间伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 110990021,
		extra_param = "",
		param = {
			{
				30,
				0,
				false,
				"%"
			}
		}
	},
	[110990022] = {
		description = "每次施放<material=underline c=#FFFFFF h=2 event=terminology args=(109901)>「望」</material>击败敌人时，该技能的剩余冷却时间缩短<color=#E78300>30%</color>，并进入零时空间，持续<color=#E78300>4</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110990022,
		extra_param = "",
		param = {}
	},
	[110990023] = {
		description = "处于零时空间时，神能获得率提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 110990023,
		extra_param = "",
		param = {
			{
				100,
				0,
				false,
				"%"
			}
		}
	},
	[110990031] = {
		description = "「朔望·月夜见」的冷却时间缩短<color=#E78300>8</color>秒。",
		maxLv = 1,
		type = 1,
		id = 110990031,
		extra_param = "",
		param = {}
	},
	[110990032] = {
		description = "「朔·月夜见」每次命中时，后续的命中瞬间伤害提高<color=#E78300>{1}</color>，该效果提供的伤害提高最高为<color=#E78300>180%</color>。",
		maxLv = 1,
		type = 1,
		id = 110990032,
		extra_param = "",
		param = {
			{
				30,
				30,
				true,
				"%"
			}
		}
	},
	[110990033] = {
		description = "施放「朔·月夜见」时，可消耗<color=#E78300>20</color>点神能增加额外攻击段数。",
		maxLv = 1,
		type = 1,
		id = 110990033,
		extra_param = "",
		param = {}
	},
	[111110011] = {
		description = "不处于<material=underline c=#FFFFFF h=2 event=terminology args=(111101)>「冥府审判模式」</material>时，「终灵凋落」命中时会对敌人附加风属性抗性降低<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒。\n处于<material=underline c=#FFFFFF h=2 event=terminology args=(111101)>「冥府审判模式」</material>时，「终灵凋落」命中时会对敌人附加风属性抗性降低<color=#E78300>{3}</color>，持续<color=#E78300>{2}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 111110011,
		extra_param = "",
		param = {
			{
				10,
				10,
				true,
				"%"
			},
			{
				8,
				0,
				false,
				""
			},
			{
				20,
				20,
				true,
				"%"
			}
		}
	},
	[111110012] = {
		description = "不处于<material=underline c=#FFFFFF h=2 event=terminology args=(111101)>「冥府审判模式」</material>时，「幽岚羽刃」命中时会对敌人附加虚弱状态，攻击力降低<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒。\n处于<material=underline c=#FFFFFF h=2 event=terminology args=(111101)>「冥府审判模式」</material>时，「幽岚羽刃」命中时会对敌人附加虚弱状态，攻击力降低<color=#E78300>{3}</color>，持续<color=#E78300>{2}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 111110012,
		extra_param = "",
		param = {
			{
				10,
				10,
				true,
				"%"
			},
			{
				8,
				0,
				false,
				""
			},
			{
				20,
				20,
				true,
				"%"
			}
		}
	},
	[111110013] = {
		description = "不处于<material=underline c=#FFFFFF h=2 event=terminology args=(111101)>「冥府审判模式」</material>时，「永劫轮舞」命中敌人时，后续的基础伤害提高<color=#E78300>{1}</color>，该效果每<color=#E78300>0.3</color>秒最多触发一次。\n处于<material=underline c=#FFFFFF h=2 event=terminology args=(111101)>「冥府审判模式」</material>时，「永劫轮舞」命中敌人时，后续的基础伤害提高<color=#E78300>{2}</color>，该效果每<color=#E78300>0.3</color>秒最多触发一次。",
		maxLv = 1,
		type = 1,
		id = 111110013,
		extra_param = "",
		param = {
			{
				3,
				3,
				true,
				"%"
			},
			{
				6,
				6,
				true,
				"%"
			}
		}
	},
	[111110021] = {
		description = "施放「冥府神罚」时，生命值上限提高<color=#E78300>{1}</color>，该效果最多可叠加<color=#E78300>5</color>层。",
		maxLv = 1,
		type = 1,
		id = 111110021,
		extra_param = "",
		param = {
			{
				9,
				9,
				true,
				"%"
			}
		}
	},
	[111110022] = {
		description = "自身生命值越少，「幽岚羽刃」命中瞬间伤害提高越高，该效果提供的伤害提高最高为<color=#E78300>150%</color>。",
		maxLv = 1,
		type = 1,
		id = 111110022,
		extra_param = "",
		param = {}
	},
	[111110023] = {
		description = "<material=underline c=#FFFFFF h=2 event=terminology args=(111101)>「冥府审判模式」</material>改变为每秒<color=#E78300>10%</color>生命值上限的生命移除状态。<material=underline c=#FFFFFF h=2 event=terminology args=(111101)>「冥府审判模式」</material>时，会吸收非致命伤害并<color=#E78300>100%</color>转化为生命值，最多可吸收伤害量等同于自身生命值上限。",
		maxLv = 1,
		type = 1,
		id = 111110023,
		extra_param = "",
		param = {}
	},
	[111110031] = {
		description = "处于虚弱状态的敌人被击败时，恢复<color=#E78300>{1}</color>攻击力的生命值，该效果每<color=#E78300>1</color>秒最多触发一次。",
		maxLv = 1,
		type = 1,
		id = 111110031,
		extra_param = "",
		param = {
			{
				9,
				0,
				false,
				"%"
			}
		}
	},
	[111110032] = {
		description = "出场时，获得<color=#E78300>3</color>层减伤效果，之后每<color=#E78300>20</color>秒获得<color=#E78300>1</color>层，最多可叠加<color=#E78300>3</color>层；每层自身受到的伤害降低<color=#E78300>{1}</color>；自身每次受击时，失去<color=#E78300>1</color>层减伤效果。",
		maxLv = 1,
		type = 1,
		id = 111110032,
		extra_param = "",
		param = {
			{
				15,
				15,
				true,
				"%"
			}
		}
	},
	[111110033] = {
		description = "不处于<material=underline c=#FFFFFF h=2 event=terminology args=(111101)>「冥府审判模式」</material>受到致命伤害时，自动规避该伤害，并获得无敌效果，持续<color=#E78300>5</color>秒；自身和与自身预组合连携奥义修正者，重置奥义的冷却时间，并恢复<color=#E78300>100%</color>奥义值；该效果每场战斗最多触发一次。",
		maxLv = 1,
		type = 1,
		id = 111110033,
		extra_param = "",
		param = {}
	},
	[111190011] = {
		description = "追击、反击或「风雷流转」命中后的<color=#E78300>5</color>秒内，在施放「雷鸣风啸」、「奔雷疾风」、「风雷流转」或者追击、反击过程中点击「风雷易势」进行姿态切换切换到<material=underline c=#FFFFFF h=2 event=terminology args=(111901)>「进攻姿态」</material>会施放特殊攻击，造成共计<color=#E78300>{1}</color>（技能一每提升一级<color=#E78300>+{2}</color>）攻击力的雷属性伤害。\n在施放特殊攻击过程中点击「风雷易势」也能进行姿态切换。",
		maxLv = 1,
		type = 1,
		id = 111190011,
		extra_param = "",
		param = {
			{
				360,
				9.23,
				true,
				"%"
			},
			{
				9.231,
				0.237,
				true,
				"%"
			}
		}
	},
	[111190012] = {
		description = "施放特殊攻击时，获得短暂的格挡状态，成功格挡伤害时，获得以下效果：\n格挡状态延长<color=#E78300>1</color>秒，雷属性伤害提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒，每次施放最多触发一次。",
		maxLv = 1,
		type = 1,
		id = 111190012,
		extra_param = "",
		param = {
			{
				25,
				25,
				true,
				"%"
			},
			{
				12,
				0,
				false,
				""
			}
		}
	},
	[111190013] = {
		description = "「风雷易势」处于冷却状态时，普通攻击期间也可通过点击「风雷易势」切换姿态。\n特殊攻击成功格挡伤害后，可通过在「风雷易势」处于冷却期间普通攻击时切换到<material=underline c=#FFFFFF h=2 event=terminology args=(111901)>「进攻姿态」</material>触发一次特殊攻击。\n神格「鸣雷沙暴·强风」雷属性伤害提高最多可叠加<color=#E78300>3</color>层。",
		maxLv = 1,
		type = 1,
		id = 111190013,
		extra_param = "",
		param = {}
	},
	[111190021] = {
		description = "当反击在技能命中结束后至技能动作结束前触发，则该次反击基础伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 111190021,
		extra_param = "",
		param = {
			{
				20,
				20,
				true,
				"%"
			}
		}
	},
	[111190022] = {
		description = "追击或反击每命中敌人<color=#E78300>1</color>次，获得<color=#E78300>1</color>层攻击力加成，每层自身攻击力提高<color=#E78300>{1}</color>，最多可叠加<color=#E78300>6</color>层；受击并损失生命值时，减少<color=#E78300>2</color>层攻击力加成；攻击力加成满<color=#E78300>6</color>层时，会心率提高<color=#E78300>{2}</color>。",
		maxLv = 1,
		type = 1,
		id = 111190022,
		extra_param = "",
		param = {
			{
				8,
				8,
				true,
				"%"
			},
			{
				30,
				0,
				false,
				"%"
			}
		}
	},
	[111190023] = {
		description = "施放「风雷流转」过程中受击时，若处于<material=underline c=#FFFFFF h=2 event=terminology args=(111902)>「防御姿态」</material>，也会格挡当前的伤害并触发反击。\n反击命中时会对敌人附加雷属性抗性降低<color=#E78300>{1}</color>、风属性抗性降低<color=#E78300>{2}</color>，持续<color=#E78300>{3}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 111190023,
		extra_param = "",
		param = {
			{
				15,
				0,
				false,
				"%"
			},
			{
				15,
				0,
				false,
				"%"
			},
			{
				7,
				0,
				false,
				""
			}
		}
	},
	[111190031] = {
		description = "每拥有<color=#E78300>1</color>个对应姿态的标记，对应姿态的「风雷流转」命中瞬间伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 111190031,
		extra_param = "",
		param = {
			{
				20,
				20,
				true,
				"%"
			}
		}
	},
	[111190032] = {
		description = "当拥有至少<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(111903)>「雷引」</material>标记时，<material=underline c=#FFFFFF h=2 event=terminology args=(111901)>「进攻姿态」</material>的「风雷流转」会产生额外攻击，造成共计<color=#E78300>{1}</color>（技能一每提升一级<color=#E78300>+{2}</color>）攻击力的雷属性伤害，每拥有<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(111903)>「雷引」</material>标记，额外攻击的命中瞬间伤害提高<color=#E78300>20%</color>。\n当拥有至少<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(111904)>「惊岚」</material>标记时，<material=underline c=#FFFFFF h=2 event=terminology args=(111902)>「防御姿态」</material>的「风雷流转」命中时会进入零时空间<color=#E78300>0.8</color>秒，每拥有<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(111904)>「惊岚」</material>标记，该零时空间持续时间增加<color=#E78300>0.2</color>秒。",
		maxLv = 1,
		type = 1,
		id = 111190032,
		extra_param = "",
		param = {
			{
				1000,
				25.64,
				true,
				"%"
			},
			{
				25.641,
				0.657,
				true,
				"%"
			}
		}
	},
	[111190033] = {
		description = "「风雷流转」只会消耗对应姿态的标记。\n当施放无标记消耗的「风雷流转」后，会切换为对应的另一个姿态，并且下一次施放「风雷流转」会消耗全部标记。",
		maxLv = 1,
		type = 1,
		id = 111190033,
		extra_param = "",
		param = {}
	},
	[111270011] = {
		description = "施放「深海愈疗」时会根据消耗的标记缩短对应技能的剩余冷却时间。消耗<material=underline c=#FFFFFF h=2 event=terminology args=(112701)>「逆潮」</material>标记时，「海兽跃袭」的剩余冷却时间缩短<color=#E78300>2</color>秒；消耗<material=underline c=#FFFFFF h=2 event=terminology args=(112702)>「鲸歌」</material>标记时，「鲸歌唤潮」的剩余冷却时间缩短<color=#E78300>4</color>秒。",
		maxLv = 1,
		type = 1,
		id = 111270011,
		extra_param = "",
		param = {}
	},
	[111270012] = {
		description = "当印记不满<color=#E78300>4</color>个并且「暗潮之力」处于冷却状态时，点击「暗潮之力」会进入<material=underline c=#FFFFFF h=2 event=terminology args=(112703)>「感应」</material>状态，持续<color=#E78300>0.5</color>秒，每次「暗潮之力」冷却期间该效果最多触发一次。\n<material=underline c=#FFFFFF h=2 event=terminology args=(112703)>「感应」</material>：受击时，获得无敌效果，持续<color=#E78300>1</color>秒。",
		maxLv = 1,
		type = 1,
		id = 111270012,
		extra_param = "",
		param = {}
	},
	[111270013] = {
		description = "处于<material=underline c=#FFFFFF h=2 event=terminology args=(112703)>「感应」</material>状态受击时，「暗潮之力」的剩余冷却时间缩短<color=#E78300>3</color>秒，对附近敌人造成共计<color=#E78300>{1}</color>攻击力的水属性伤害，每次「暗潮之力」冷却期间该效果最多触发一次。",
		maxLv = 1,
		type = 1,
		id = 111270013,
		extra_param = "",
		param = {
			{
				850,
				21.794,
				true,
				"%"
			}
		}
	},
	[111270021] = {
		description = "施放技能或奥义时，普通攻击伤害提高<color=#E78300>{1}</color>，每拥有<color=#E78300>1</color>个标记普通攻击伤害额外提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 111270021,
		extra_param = "",
		param = {
			{
				50,
				50,
				true,
				"%"
			},
			{
				6,
				0,
				false,
				""
			}
		}
	},
	[111270022] = {
		description = "普通攻击造成会心后有<color=#E78300>30%</color>的概率触发以下效果。\n当拥有的标记不满时，随机获得<color=#E78300>1</color>个未拥有的标记。\n当拥有的标记为满时，近战伤害提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 111270022,
		extra_param = "",
		param = {
			{
				25,
				0,
				false,
				"%"
			},
			{
				6,
				0,
				false,
				""
			}
		}
	},
	[111270023] = {
		description = "普通攻击会对命中的敌人附加以下效果。\n当拥有标记时，命中时对敌人附加破甲状态，防御力降低<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒。\n当拥有的标记为满时，命中时对敌人附加水属性抗性降低<color=#E78300>{3}</color>，持续<color=#E78300>{4}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 111270023,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			},
			{
				6,
				0,
				false,
				""
			},
			{
				15,
				0,
				false,
				"%"
			},
			{
				6,
				0,
				false,
				""
			}
		}
	},
	[111270031] = {
		description = "施放技能或奥义时，攻击力提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒，最多可叠加<color=#E78300>3</color>层。",
		maxLv = 1,
		type = 1,
		id = 111270031,
		extra_param = "",
		param = {
			{
				10,
				10,
				true,
				"%"
			},
			{
				6,
				0,
				false,
				""
			}
		}
	},
	[111270032] = {
		description = "施放「深海愈疗」会额外恢复附近的所有友方已损失的生命值的<color=#E78300>15%</color>，该效果不受治疗效果提高或降低与被治疗效果提高或降低影响。",
		maxLv = 1,
		type = 1,
		id = 111270032,
		extra_param = "",
		param = {}
	},
	[111270033] = {
		description = "施放「深海愈疗」时，治疗效果提高，每有<color=#E78300>1</color>个标记治疗效果提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 111270033,
		extra_param = "",
		param = {
			{
				15,
				15,
				true,
				"%"
			},
			{
				6,
				0,
				false,
				""
			}
		}
	},
	[111320011] = {
		description = "处于<material=underline c=#FFFFFF h=2 event=terminology args=(113201)>「燃剑姿态」</material>时，普通攻击和技能命中瞬间伤害提高<color=#E78300>{1}</color>。抛掷出去的长剑命中时会跟随敌人。",
		maxLv = 1,
		type = 1,
		id = 111320011,
		extra_param = "",
		param = {
			{
				16,
				0,
				false,
				"%"
			}
		}
	},
	[111320012] = {
		description = "施放「炙炼侵袭」将长剑抛掷出去后，再次点击该技能不再使旋转长剑飞回，而是瞬移到旋转长剑处收回长剑。越早收回旋转的长剑，「炙炼侵袭」的剩余冷却时间缩短越多，该效果提供的剩余冷却时间缩短最高为<color=#E78300>12</color>秒。",
		maxLv = 1,
		type = 1,
		id = 111320012,
		extra_param = "",
		param = {}
	},
	[111320013] = {
		description = "处于<material=underline c=#FFFFFF h=2 event=terminology args=(113201)>「燃剑姿态」</material>时，每<color=#E78300>2</color>秒获得<color=#E78300>1</color>层攻击力提高效果；处于<material=underline c=#FFFFFF h=2 event=terminology args=(113202)>「炽甲姿态」</material>时，每<color=#E78300>2</color>秒失去<color=#E78300>1</color>层攻击力提高效果，最多可叠加<color=#E78300>10</color>层。每层自身攻击力提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 111320013,
		extra_param = "",
		param = {
			{
				3.5,
				3.5,
				true,
				"%"
			}
		}
	},
	[111320021] = {
		description = "处于<material=underline c=#FFFFFF h=2 event=terminology args=(113202)>「炽甲姿态」</material>时，命中瞬间伤害提高<color=#E78300>{1}</color>；每<color=#E78300>0.5</color>秒恢复<color=#E78300>3</color>点怒气。",
		maxLv = 1,
		type = 1,
		id = 111320021,
		extra_param = "",
		param = {
			{
				16,
				0,
				false,
				"%"
			}
		}
	},
	[111320022] = {
		description = "处于<material=underline c=#FFFFFF h=2 event=terminology args=(113202)>「炽甲姿态」</material>时，获得以下效果：\n施放「焚灭掳夺」击中返回的旋转长剑时，可以将旋转长剑再次抛掷出去并刷新旋转长剑的持续时间，之后重置「焚灭掳夺」的冷却时间；\n将旋转长剑再次抛掷出去时，旋转长剑命中瞬间伤害提高<color=#E78300>{1}</color>，最多可叠加<color=#E78300>2</color>层；\n成功把旋转长剑再次抛掷出去后，下一次点击普通攻击会瞬移到锁定的敌人身边，并直接施放普通攻击最后一段；\n施放「炙炼侵袭」时重置「焚灭掳夺」的冷却时间。\n神格「燃剑的制裁·瞬燃」被激活时，该神格效果失效。",
		maxLv = 1,
		type = 1,
		id = 111320022,
		extra_param = "",
		param = {
			{
				12,
				12,
				true,
				"%"
			}
		}
	},
	[111320023] = {
		description = "处于<material=underline c=#FFFFFF h=2 event=terminology args=(113201)>「燃剑姿态」</material>时，每次普通攻击命中时，「炙炼侵袭」的剩余冷却时间缩短<color=#E78300>0.5</color>秒。\n处于<material=underline c=#FFFFFF h=2 event=terminology args=(113202)>「炽甲姿态」</material>时，施放「爆烈强攻」会消耗全部怒气，每消耗<color=#E78300>1</color>点怒气，基础伤害提高<color=#E78300>{1}</color>；施放奥义后，重置「炙炼侵袭」的冷却时间。",
		maxLv = 1,
		type = 1,
		id = 111320023,
		extra_param = "",
		param = {
			{
				1,
				1,
				true,
				"%"
			}
		}
	},
	[111320031] = {
		description = "自身生命值越少伤害越高，最高<color=#E78300>30%</color>。\n处于<material=underline c=#FFFFFF h=2 event=terminology args=(113201)>「燃剑姿态」</material>时，每次普通攻击后，会对自身造成<color=#E78300>2%</color>的生命值上限的伤害；施放「爆烈强攻」或「焚灭掳夺」的每段技能后，会对自身造成<color=#E78300>10%</color>的生命值上限的伤害。",
		maxLv = 1,
		type = 1,
		id = 111320031,
		extra_param = "",
		param = {}
	},
	[111320032] = {
		description = "处于<material=underline c=#FFFFFF h=2 event=terminology args=(113201)>「燃剑姿态」</material>时，施放「爆烈强攻」或「焚灭掳夺」命中时，对命中的敌人附加<material=underline c=#FFFFFF h=2 event=terminology args=(113203)>「焚罪」</material>状态，持续<color=#E78300>20</color>秒。\n处于<material=underline c=#FFFFFF h=2 event=terminology args=(113202)>「炽甲姿态」</material>时，自身对处于<material=underline c=#FFFFFF h=2 event=terminology args=(113203)>「焚罪」</material>状态的敌人命中瞬间火属性伤害提高<color=#E78300>{1}</color>；每次普通攻击命中时，恢复<color=#E78300>{2}</color>的生命值，当生命值不高于<color=#E78300>50%</color>时，恢复<color=#E78300>{3}</color>的生命值。收回长剑时，「炙炼侵袭」的剩余冷却时间缩短<color=#E78300>9</color>秒。",
		maxLv = 1,
		type = 1,
		id = 111320032,
		extra_param = "",
		param = {
			{
				24,
				0,
				false,
				"%"
			},
			{
				1.5,
				1.5,
				true,
				"%"
			},
			{
				3,
				3,
				true,
				"%"
			}
		}
	},
	[111320033] = {
		description = "攻击命中处于<material=underline c=#FFFFFF h=2 event=terminology args=(113203)>「焚罪」</material>状态的敌人时，会产生一次爆炸，对周围的敌人造成共计<color=#E78300>{1}</color>攻击力的火属性伤害，该效果每<color=#E78300>10</color>秒最多触发一次；当自身击败处于<material=underline c=#FFFFFF h=2 event=terminology args=(113203)>「焚罪」</material>状态的敌人时，重置该效果的冷却时间。",
		maxLv = 1,
		type = 1,
		id = 111320033,
		extra_param = "",
		param = {
			{
				2000,
				51.282,
				true,
				"%"
			}
		}
	},
	[111380011] = {
		description = "「陨落晨星」可充能<color=#E78300>2</color>次。「陨落晨星」召唤的流星额外增加<color=#E78300>2</color>个。",
		maxLv = 1,
		type = 1,
		id = 111380011,
		extra_param = "",
		param = {}
	},
	[111380012] = {
		description = "自身技能或奥义命中的敌人受到自身的技能伤害提高，每命中敌人<color=#E78300>1</color>次命中瞬间技能伤害提高<color=#E78300>{1}</color>，持续<color=#E78300>3</color>秒，最多可叠加<color=#E78300>12</color>层。",
		maxLv = 1,
		type = 1,
		id = 111380012,
		extra_param = "",
		param = {
			{
				2,
				2,
				true,
				"%"
			}
		}
	},
	[111380013] = {
		description = "神格「清辉星海·天权」对敌人的伤害提高效果达到<color=#E78300>8%</color>后，自身对该敌人施放的技能或奥义命中瞬间会心率和会心伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 111380013,
		extra_param = "",
		param = {
			{
				15,
				0,
				false,
				"%"
			}
		}
	},
	[111380021] = {
		description = "「光幻瞬变」命中瞬间伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 111380021,
		extra_param = "",
		param = {
			{
				15,
				0,
				false,
				"%"
			}
		}
	},
	[111380022] = {
		description = "进入零时空间时，伤害提高<color=#E78300>12%</color>，该效果每<color=#E78300>1</color>秒提高<color=#E78300>12%</color>，最多提升至<color=#E78300>60%</color>。",
		maxLv = 1,
		type = 1,
		id = 111380022,
		extra_param = "",
		param = {}
	},
	[111380023] = {
		description = "自身触发的零时空间的持续时间延长<color=#E78300>2</color>秒。",
		maxLv = 1,
		type = 1,
		id = 111380023,
		extra_param = "",
		param = {}
	},
	[111380031] = {
		description = "「曙光祈愿」的冷却时间缩短<color=#E78300>5</color>秒。",
		maxLv = 1,
		type = 1,
		id = 111380031,
		extra_param = "",
		param = {}
	},
	[111380032] = {
		description = "「曙光祈愿」不再以自身为目标。施放「曙光祈愿」后，自身攻击力提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 111380032,
		extra_param = "",
		param = {
			{
				25,
				0,
				false,
				"%"
			},
			{
				15,
				0,
				false,
				""
			}
		}
	},
	[111380033] = {
		description = "「曙光祈愿」的选择目标额外攻击力提高，数值等同于自身攻击力的<color=#E78300>25%</color>，持续<color=#E78300>{1}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 111380033,
		extra_param = "",
		param = {
			{
				15,
				0,
				false,
				""
			}
		}
	},
	[111390011] = {
		description = "施放「银雪回响」重复施放技能命中时，每命中敌人<color=#E78300>1</color>次，自身能量获得率提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒，最多可叠加<color=#E78300>3</color>层。",
		maxLv = 1,
		type = 1,
		id = 111390011,
		extra_param = "",
		param = {
			{
				12,
				12,
				true,
				"%"
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[111390012] = {
		description = "施放「银雪回响」重复施放技能时，根据该次重复施放技能消耗的能量，每消耗<color=#E78300>1</color>点能量，攻击力提高<color=#E78300>2%</color>，持续<color=#E78300>{1}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 111390012,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[111390013] = {
		description = "神格「璀璨寒冬·寒晶」和「璀璨寒冬·绝封」的加成效果持续期间进入<material=underline c=#FFFFFF h=2 event=terminology args=(113903)>「临渊」</material>状态时，加成效果提高<color=#E78300>50%</color>，并且加成效果持续至<material=underline c=#FFFFFF h=2 event=terminology args=(113903)>「临渊」</material>状态结束。",
		maxLv = 1,
		type = 1,
		id = 111390013,
		extra_param = "",
		param = {}
	},
	[111390021] = {
		description = "当敌人被附加冰冻状态时，获得<color=#E78300>{1}</color>点能量。",
		maxLv = 1,
		type = 1,
		id = 111390021,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[111390022] = {
		description = "「事象冰封」的「追加吟唱」每<color=#E78300>5</color>次命中后，下一次该技能的追加攻击会对命中的敌人附加冰冻状态，持续<color=#E78300>{1}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 111390022,
		extra_param = "",
		param = {
			{
				3,
				0,
				false,
				""
			}
		}
	},
	[111390023] = {
		description = "消耗<material=underline c=#FFFFFF h=2 event=terminology args=(113902)>「寒封」</material>标记进入<material=underline c=#FFFFFF h=2 event=terminology args=(113903)>「临渊」</material>状态，攻击命中<color=#E78300>15</color>次之后，每次攻击命中时队友的冰属性伤害提高，持续<color=#E78300>{1}</color>秒，每对敌人附加冰属性抗性降低<color=#E78300>1%</color>，冰属性伤害提高<color=#E78300>1%</color>，该效果提供的冰属性伤害提高最高为<color=#E78300>20%</color>。",
		maxLv = 1,
		type = 1,
		id = 111390023,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[111390031] = {
		description = "<material=underline c=#FFFFFF h=2 event=terminology args=(113903)>「临渊」</material>状态期间，施放「零度寒芒」或「事象冰封」时，另一个技能的剩余冷却时间缩短<color=#E78300>50%</color>。",
		maxLv = 1,
		type = 1,
		id = 111390031,
		extra_param = "",
		param = {}
	},
	[111390032] = {
		description = "<material=underline c=#FFFFFF h=2 event=terminology args=(113903)>「临渊」</material>状态期间，施放「零度寒芒」或「事象冰封」时，会心率提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒，最多可叠加<color=#E78300>5</color>层。",
		maxLv = 1,
		type = 1,
		id = 111390032,
		extra_param = "",
		param = {
			{
				3,
				3,
				true,
				"%"
			},
			{
				4,
				0,
				false,
				""
			}
		}
	},
	[111390033] = {
		description = "<material=underline c=#FFFFFF h=2 event=terminology args=(113903)>「临渊」</material>状态的持续时间延长<color=#E78300>3</color>秒。",
		maxLv = 1,
		type = 1,
		id = 111390033,
		extra_param = "",
		param = {}
	},
	[111480011] = {
		description = "「战术爆弹」会对命中的敌人附加破甲状态，防御力降低<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 111480011,
		extra_param = "",
		param = {
			{
				15,
				0,
				false,
				"%"
			},
			{
				6,
				0,
				false,
				""
			}
		}
	},
	[111480012] = {
		description = "「战术爆弹」的爆炸范围半径提高<color=#E78300>16.67%</color>。",
		maxLv = 1,
		type = 1,
		id = 111480012,
		extra_param = "",
		param = {}
	},
	[111480013] = {
		description = "「战术爆弹」的飞行距离提高<color=#E78300>150%</color>，并在飞行期间短暂追踪敌人。",
		maxLv = 1,
		type = 1,
		id = 111480013,
		extra_param = "",
		param = {}
	},
	[111480021] = {
		description = "「连环准星」对处于破甲状态的敌人命中瞬间会心率提高<color=#E78300>100%</color>。",
		maxLv = 1,
		type = 1,
		id = 111480021,
		extra_param = "",
		param = {}
	},
	[111480022] = {
		description = "「连环准星」每命中敌人<color=#E78300>5</color>次，会在目标位置引发爆炸，造成<color=#E78300>{1}</color>攻击力的物理属性伤害。",
		maxLv = 1,
		type = 1,
		id = 111480022,
		extra_param = "",
		param = {
			{
				220,
				5.641,
				true,
				"%"
			}
		}
	},
	[111480023] = {
		description = "「连环准星」额外进行两轮射击。",
		maxLv = 1,
		type = 1,
		id = 111480023,
		extra_param = "",
		param = {}
	},
	[111480031] = {
		description = "普通攻击每命中敌人<color=#E78300>1</color>次有<color=#E78300>10%</color>的概率获得<color=#E78300>1</color>个印记。",
		maxLv = 1,
		type = 1,
		id = 111480031,
		extra_param = "",
		param = {}
	},
	[111480032] = {
		description = "获得或恢复印记时，自身物理属性伤害提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 111480032,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[111480033] = {
		description = "每获得<color=#E78300>1</color>个印记，自身随机一个处于冷却状态的技能剩余冷却时间缩短<color=#E78300>0.5</color>秒。",
		maxLv = 1,
		type = 1,
		id = 111480033,
		extra_param = "",
		param = {}
	},
	[111500011] = {
		description = "自身击败敌人时，恢复自身<color=#E78300>{1}</color>攻击力的生命值。",
		maxLv = 1,
		type = 1,
		id = 111500011,
		extra_param = "",
		param = {
			{
				15,
				15,
				true,
				"%"
			}
		}
	},
	[111500012] = {
		description = "处于<material=underline c=#FFFFFF h=2 event=terminology args=(115001)>「樱弥」</material>状态时，受到的伤害降低<color=#E78300>{1}</color>，施放「一式·决刹」、「三式·樱舞」时获得硬直效果。",
		maxLv = 1,
		type = 1,
		id = 111500012,
		extra_param = "",
		param = {
			{
				30,
				0,
				false,
				"%"
			}
		}
	},
	[111500013] = {
		description = "处于<material=underline c=#FFFFFF h=2 event=terminology args=(115001)>「樱弥」</material>状态时，神能为<color=#E78300>0</color>点时，获得每<color=#E78300>0.1</color>秒<color=#E78300>1%</color>生命值上限的生命移除状态。\n处于自身的生命移除状态时，施放「一式·决刹」、「三式·樱舞」每段命中时可以获得<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(115003)>「樱」</material>标记。\n生命值为<color=#E78300>1</color>时，退出<material=underline c=#FFFFFF h=2 event=terminology args=(115001)>「樱弥」</material>状态；施放「九式·落樱」时移除自身的生命移除状态。",
		maxLv = 1,
		type = 1,
		id = 111500013,
		extra_param = "",
		param = {}
	},
	[111500021] = {
		description = "拥有<material=underline c=#FFFFFF h=2 event=terminology args=(115003)>「樱」</material>标记时，点击普通攻击不再施放「九式·绯影」。\n处于<material=underline c=#FFFFFF h=2 event=terminology args=(115001)>「樱弥」</material>状态时，在普通攻击期间长按普通攻击并可以在适当时机松开长按，消耗<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(115003)>「樱」</material>标记，施放「二式·破罔」。",
		maxLv = 1,
		type = 1,
		id = 111500021,
		extra_param = "",
		param = {}
	},
	[111500022] = {
		description = "施放「二式·破罔」时迅速长按普通攻击并在适当时机松开长按，可以衔接施放「二式·破罔」。",
		maxLv = 1,
		type = 1,
		id = 111500022,
		extra_param = "",
		param = {}
	},
	[111500023] = {
		description = "施放或衔接施放消耗<material=underline c=#FFFFFF h=2 event=terminology args=(115003)>「樱」</material>标记的「二式·破罔」时，下一次衔接施放的「二式·破罔」不会消耗<material=underline c=#FFFFFF h=2 event=terminology args=(115003)>「樱」</material>标记。\n每次衔接施放时，该次技能命中瞬间独立伤害提高<color=#E78300>{1}</color>，最多可叠加<color=#E78300>3</color>层，未能成功衔接施放时，失去全部层数。",
		maxLv = 1,
		type = 1,
		id = 111500023,
		extra_param = "",
		param = {
			{
				50,
				50,
				true,
				"%"
			}
		}
	},
	[111500031] = {
		description = "出场时，神能恢复至满值。",
		maxLv = 1,
		type = 1,
		id = 111500031,
		extra_param = "",
		param = {}
	},
	[111500032] = {
		description = "「九式·绯影」连续衔接施放时，第二次施放会改变为施放「九式·绯华」，第三次施放会改变为施放「九式·樱散」。\n「九式·绯华」：造成共计<color=#E78300>{1}</color>（技能三每提升一级<color=#E78300>+{2}</color>）攻击力的雷属性伤害。\n「九式·樱散」：造成共计<color=#E78300>{3}</color>（技能三每提升一级<color=#E78300>+{4}</color>）攻击力的雷属性伤害。",
		maxLv = 1,
		type = 1,
		id = 111500032,
		extra_param = "",
		param = {
			{
				700,
				17.944,
				true,
				"%"
			},
			{
				17.949,
				0.46,
				true,
				"%"
			},
			{
				1000,
				25.639,
				true,
				"%"
			},
			{
				25.641,
				0.657,
				true,
				"%"
			}
		}
	},
	[111500033] = {
		description = "处于<material=underline c=#FFFFFF h=2 event=terminology args=(115001)>「樱弥」</material>状态并且拥有神能时，普通攻击、「一式·决刹」、「三式·樱舞」、「九式·绯影」、「九式·绯华」、「九式·樱散」命中瞬间攻击力提高<color=#E78300>{1}</color>。\n「九式·落樱」改变为每消耗<color=#E78300>1</color>点<material=underline c=#FFFFFF h=2 event=terminology args=(115002)>「妖樱」</material>，命中瞬间独立伤害提高<color=#E78300>{2}</color>。",
		maxLv = 1,
		type = 1,
		id = 111500033,
		extra_param = "",
		param = {
			{
				30,
				0,
				false,
				"%"
			},
			{
				1.4,
				1.4,
				true,
				"%"
			}
		}
	},
	[111560011] = {
		description = "不再需要蓄力也可直接施放满蓄力的「九劫·雷崩」。\n施放「九劫·雷崩」时会消耗全部<material=underline c=#FFFFFF h=2 event=terminology args=(115602)>「霹雳」</material>标记，每消耗<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(115602)>「霹雳」</material>标记会对每个命中的敌人触发<color=#E78300>1</color>次落雷攻击，造成<color=#E78300>{1}</color>（技能三每提升一级<color=#E78300>+{2}</color>）攻击力的雷属性伤害。",
		maxLv = 1,
		type = 1,
		id = 111560011,
		extra_param = "",
		param = {
			{
				400,
				10.256,
				true,
				"%"
			},
			{
				10.256,
				0.263,
				true,
				"%"
			}
		}
	},
	[111560012] = {
		description = "「三劫·伐恶」前段命中时，自身雷属性伤害提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒，对命中的敌人附加会心抗性降低<color=#E78300>{3}</color>，持续<color=#E78300>{4}</color>秒。\n满蓄力的「九劫·雷崩」会在命中的敌人的位置生成一片雷场区域，持续<color=#E78300>10</color>秒，范围内的敌人雷属性抗性降低<color=#E78300>{5}</color>。\n普通攻击命中雷场区域范围内的敌人时，普通攻击命中瞬间会心率提高<color=#E78300>{6}</color>。\n雷场区域最多存在一个。",
		maxLv = 1,
		type = 1,
		id = 111560012,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			},
			{
				7,
				0,
				false,
				""
			},
			{
				15,
				0,
				false,
				"%"
			},
			{
				7,
				0,
				false,
				""
			},
			{
				10,
				0,
				false,
				"%"
			},
			{
				50,
				0,
				false,
				"%"
			}
		}
	},
	[111560013] = {
		description = "施放「一劫·煌闪」前段后可以点击普通攻击施放特殊拳攻击的普通攻击，造成共计<color=#E78300>{1}</color>（普通攻击每提升一级<color=#E78300>+{9}</color>）攻击力的雷属性伤害，施放特殊拳攻击<color=#E78300>3</color>秒内，可以连点普通攻击，每次攻击造成<color=#E78300>{2}</color>（普通攻击每提升一级<color=#E78300>+{10}</color>）攻击力的雷属性伤害；在合适的时机点击普通攻击时，会触发并获得强化效果：特殊拳攻击改变为造成共计<color=#E78300>{3}</color>（普通攻击每提升一级<color=#E78300>+{11}</color>）攻击力的雷属性伤害，连点每次攻击改变为造成<color=#E78300>{4}</color>（普通攻击每提升一级<color=#E78300>+{12}</color>）攻击力的雷属性伤害。\n施放「三劫·伐恶」前段后可以点击普通攻击施放特殊腿攻击的普通攻击，造成共计<color=#E78300>{5}</color>（普通攻击每提升一级<color=#E78300>+{13}</color>）攻击力的雷属性伤害，施放特殊腿攻击<color=#E78300>3</color>秒内，可以连点普通攻击，每次攻击造成<color=#E78300>{6}</color>（普通攻击每提升一级<color=#E78300>+{14}</color>）攻击力的雷属性伤害；在合适的时机点击普通攻击时，会触发并获得强化效果：特殊腿攻击改变为造成共计<color=#E78300>{7}</color>（普通攻击每提升一级<color=#E78300>+{15}</color>）攻击力的雷属性伤害，连点每次攻击改变为造成<color=#E78300>{8}</color>（普通攻击每提升一级<color=#E78300>+{16}</color>）攻击力的雷属性伤害。\n特殊腿攻击命中后会获得怒气，获得强化效果的特殊腿攻击命中后会获得更多的怒气。",
		maxLv = 1,
		type = 1,
		id = 111560013,
		extra_param = "",
		param = {
			{
				700,
				13.459,
				true,
				"%"
			},
			{
				175,
				3.365,
				true,
				"%"
			},
			{
				800,
				15.383,
				true,
				"%"
			},
			{
				200,
				3.846,
				true,
				"%"
			},
			{
				200,
				3.842,
				true,
				"%"
			},
			{
				50,
				0.961,
				true,
				"%"
			},
			{
				300,
				5.767,
				true,
				"%"
			},
			{
				75,
				1.442,
				true,
				"%"
			},
			{
				13.462,
				0.259,
				true,
				"%"
			},
			{
				3.365,
				0.065,
				true,
				"%"
			},
			{
				15.385,
				0.296,
				true,
				"%"
			},
			{
				3.846,
				0.074,
				true,
				"%"
			},
			{
				3.846,
				0.074,
				true,
				"%"
			},
			{
				0.962,
				0.018,
				true,
				"%"
			},
			{
				5.769,
				0.111,
				true,
				"%"
			},
			{
				1.442,
				0.028,
				true,
				"%"
			}
		}
	},
	[111560021] = {
		description = "每次触发<material=underline c=#FFFFFF h=2 event=terminology args=(115601)>「煌雷」</material>时，全队伍雷属性伤害提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 111560021,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			},
			{
				7,
				0,
				false,
				""
			}
		}
	},
	[111560022] = {
		description = "连续触发<material=underline c=#FFFFFF h=2 event=terminology args=(115601)>「煌雷」</material>不低于<color=#E78300>3</color>次时，全队伍雷属性修正者会心率提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒。\n连续触发<material=underline c=#FFFFFF h=2 event=terminology args=(115601)>「煌雷」</material>不低于<color=#E78300>5</color>次时，全队伍雷属性修正者会心伤害提高<color=#E78300>{3}</color>，持续<color=#E78300>{4}</color>秒。\n出现判定未能成功触发<material=underline c=#FFFFFF h=2 event=terminology args=(115601)>「煌雷」</material>时，清除计数。",
		maxLv = 1,
		type = 1,
		id = 111560022,
		extra_param = "",
		param = {
			{
				15,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			},
			{
				50,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			}
		}
	},
	[111560023] = {
		description = "<material=underline c=#FFFFFF h=2 event=terminology args=(115602)>「霹雳」</material>不再减少「九劫·雷崩」的蓄力时间，改变为根据消耗的标记的数量提高聚集敌人的速度和范围；施放「九劫·雷崩」蓄力时，嘲讽所有敌人，并且可以格挡敌人的攻击伤害。\n满蓄力的「九劫·雷崩」会对命中的敌人附加雷属性抗性降低<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒。\n施放奥义或连携奥义后，全队伍获得<color=#E78300>20%</color>的奥义值。",
		maxLv = 1,
		type = 1,
		id = 111560023,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			},
			{
				15,
				0,
				false,
				""
			}
		}
	},
	[111560031] = {
		description = "不再出现判定，施放对应的普通攻击或技能会直接触发<material=underline c=#FFFFFF h=2 event=terminology args=(115601)>「煌雷」</material>获得强化效果。",
		maxLv = 1,
		type = 1,
		id = 111560031,
		extra_param = "",
		param = {}
	},
	[111560032] = {
		description = "每<color=#E78300>5</color>秒获得<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(115602)>「霹雳」</material>标记。\n极限闪避后衔接普通攻击，会触发<material=underline c=#FFFFFF h=2 event=terminology args=(115601)>「煌雷」</material>施放特殊普通攻击，造成<color=#E78300>{1}</color>（普通攻击每提升一级<color=#E78300>+{2}</color>）攻击力的雷属性伤害，该特殊普通攻击不会打断普通攻击的连段。拥有<material=underline c=#FFFFFF h=2 event=terminology args=(115602)>「霹雳」</material>标记时，非移动闪避后衔接普通攻击，也会消耗<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(115602)>「霹雳」</material>标记施放该特殊普通攻击。\n普通攻击第四段或该特殊普通攻击命中时，下一次普通攻击第四段和该特殊普通攻击命中瞬间伤害提高<color=#E78300>{3}</color>，持续<color=#E78300>5</color>秒，最多可叠加<color=#E78300>15</color>层。",
		maxLv = 1,
		type = 1,
		id = 111560032,
		extra_param = "",
		param = {
			{
				350,
				6.73,
				true,
				"%"
			},
			{
				6.731,
				0.129,
				true,
				"%"
			},
			{
				6,
				6,
				true,
				"%"
			}
		}
	},
	[111560033] = {
		description = "满蓄力的「九劫·雷崩」命中锁定的敌人时，会在该敌人的位置生成一个跟随敌人的雷球，每<color=#E78300>0.5</color>秒对周围的敌人造成<color=#E78300>{1}</color>（技能三每提升一级<color=#E78300>+{2}</color>）攻击力的雷属性伤害，持续<color=#E78300>5</color>秒，该敌人被击败时，雷球也会消失；施放普通攻击第四段、特殊普通攻击命中该敌人时，重置雷球的持续时间。\n施放「一劫·煌闪」的后段时会获得<color=#E78300>2</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(115602)>「霹雳」</material>标记；施放「三劫·伐恶」的后段时会获得<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(115602)>「霹雳」</material>标记。",
		maxLv = 1,
		type = 1,
		id = 111560033,
		extra_param = "",
		param = {
			{
				30,
				0.769,
				true,
				"%"
			},
			{
				0.769,
				0.02,
				true,
				"%"
			}
		}
	},
	[111580011] = {
		description = "<material=underline c=#FFFFFF h=2 event=terminology args=(115804)>「燃火」</material>状态持续时间延长至敌人被击败，处于<material=underline c=#FFFFFF h=2 event=terminology args=(115804)>「燃火」</material>状态的敌人攻击不会打断自身动作，但自身不再格挡处于<material=underline c=#FFFFFF h=2 event=terminology args=(115804)>「燃火」</material>状态的敌人的攻击伤害。<material=underline c=#FFFFFF h=2 event=terminology args=(115802)>「焚心」</material>等级提升时，对锁定的敌人附加<material=underline c=#FFFFFF h=2 event=terminology args=(115804)>「燃火」</material>状态。",
		maxLv = 1,
		type = 1,
		id = 111580011,
		extra_param = "",
		param = {}
	},
	[111580012] = {
		description = "根据已损失的生命值，每损失<color=#E78300>9%</color>生命值，自身对视骸敌人伤害提高<color=#E78300>{1}</color>，该效果提供的对视骸敌人伤害提高最高为<color=#E78300>55%</color>。\n处于<material=underline c=#FFFFFF h=2 event=terminology args=(115804)>「燃火」</material>状态时，自身受到的伤害降低<color=#E78300>{2}</color>。",
		maxLv = 1,
		type = 1,
		id = 111580012,
		extra_param = "",
		param = {
			{
				5,
				5,
				true,
				"%"
			},
			{
				30,
				0,
				false,
				"%"
			}
		}
	},
	[111580013] = {
		description = "自身处于<material=underline c=#FFFFFF h=2 event=terminology args=(115801)>「熔火」</material>状态时，每<color=#E78300>0.2</color>秒根据已损失的生命值每有<color=#E78300>1%</color>对处于<material=underline c=#FFFFFF h=2 event=terminology args=(115804)>「燃火」</material>状态的敌人附加<color=#E78300>{1}</color>攻击力的火属性伤害，该效果提供的每次附加的伤害最高为<color=#E78300>240%</color>。\n<material=underline c=#FFFFFF h=2 event=terminology args=(115801)>「熔火」</material>状态衔接施放「鸦惑一闪」、「瞬灭焰斩」时，获得硬直效果、受到的伤害降低<color=#E78300>{2}</color>。",
		maxLv = 1,
		type = 1,
		id = 111580013,
		extra_param = "",
		param = {
			{
				2.4,
				2.4,
				true,
				"%"
			},
			{
				50,
				0,
				false,
				"%"
			}
		}
	},
	[111580021] = {
		description = "每次攻击命中后，恢复<color=#E78300>7%</color>积蓄条。",
		maxLv = 1,
		type = 1,
		id = 111580021,
		extra_param = "",
		param = {}
	},
	[111580022] = {
		description = "自身处于<material=underline c=#FFFFFF h=2 event=terminology args=(115804)>「燃火」</material>状态时，攻击命中后恢复<color=#E78300>{1}</color>攻击力的生命值，该效果每<color=#E78300>4</color>秒最多触发一次。",
		maxLv = 1,
		type = 1,
		id = 111580022,
		extra_param = "",
		param = {
			{
				15,
				0,
				false,
				"%"
			}
		}
	},
	[111580023] = {
		description = "<material=underline c=#FFFFFF h=2 event=terminology args=(115802)>「焚心」</material>每有<color=#E78300>1</color>级，攻击力提高<color=#E78300>{1}</color>、技能伤害提高<color=#E78300>{2}</color>、护甲穿透提高<color=#E78300>{3}</color>。",
		maxLv = 1,
		type = 1,
		id = 111580023,
		extra_param = "",
		param = {
			{
				10,
				10,
				true,
				"%"
			},
			{
				10,
				10,
				true,
				"%"
			},
			{
				10,
				10,
				true,
				"%"
			}
		}
	},
	[111580031] = {
		description = "衔接施放「鸦惑一闪」、「瞬灭焰斩」期间受击时，根据<material=underline c=#FFFFFF h=2 event=terminology args=(115802)>「焚心」</material>的等级对应技能基础伤害提高<color=#E78300>10%、15%、20%</color>；<material=underline c=#FFFFFF h=2 event=terminology args=(115802)>「焚心」</material>效果提供的技能基础伤害提高最高改变为<color=#E78300>120%</color>。",
		maxLv = 1,
		type = 1,
		id = 111580031,
		extra_param = "",
		param = {}
	},
	[111580032] = {
		description = "生命值变为<color=#E78300>1</color>时，每有<color=#E78300>1000</color>生命值上限，火属性伤害提高<color=#E78300>{1}</color>，该效果提供的火属性伤害提高最高为<color=#E78300>24%</color>，当生命值高于<color=#E78300>50%</color>时移除该效果。",
		maxLv = 1,
		type = 1,
		id = 111580032,
		extra_param = "",
		param = {
			{
				0.4,
				0.4,
				true,
				"%"
			}
		}
	},
	[111580033] = {
		description = "生命值为<color=#E78300>1</color>时，自动积蓄惑火，每<color=#E78300>0.1</color>秒恢复<color=#E78300>4%</color>积蓄条。\n「瞬灭焰斩」改变为恢复自身<color=#E78300>80%、100%、120%</color>攻击力的生命值。\n进入<material=underline c=#FFFFFF h=2 event=terminology args=(115801)>「熔火」</material>状态时会对自身和锁定的敌人附加<material=underline c=#FFFFFF h=2 event=terminology args=(115805)>「微·燃火」</material>状态，最多持续<color=#E78300>4</color>秒，场上被附加<material=underline c=#FFFFFF h=2 event=terminology args=(115805)>「微·燃火」</material>状态的敌人最多存在一个。\n<material=underline c=#FFFFFF h=2 event=terminology args=(115805)>「微·燃火」</material>：自身可以格挡处于<material=underline c=#FFFFFF h=2 event=terminology args=(115805)>「微·燃火」</material>状态的敌人的攻击伤害<color=#E78300>2</color>次，处于<material=underline c=#FFFFFF h=2 event=terminology args=(115805)>「微·燃火」</material>状态的敌人被击败时，移除自身的<material=underline c=#FFFFFF h=2 event=terminology args=(115805)>「微·燃火」</material>状态。",
		maxLv = 1,
		type = 1,
		id = 111580033,
		extra_param = "",
		param = {}
	},
	[111840011] = {
		description = "「盾牌投掷」会对命中的敌人附加眩晕状态，持续<color=#E78300>{1}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 111840011,
		extra_param = "",
		param = {
			{
				2,
				0,
				false,
				""
			}
		}
	},
	[111840012] = {
		description = "施放「盾牌投掷」会改变为盾牌弹射，每次造成<color=#E78300>{1}</color>攻击力的雷属性伤害，最多可弹射<color=#E78300>5</color>次，每次命中会获得<color=#E78300>18</color>点神能。",
		maxLv = 1,
		type = 1,
		id = 111840012,
		extra_param = "",
		param = {
			{
				130,
				3.333,
				true,
				"%"
			}
		}
	},
	[111840013] = {
		description = "「盾牌投掷」每弹射一次，后续命中瞬间伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 111840013,
		extra_param = "",
		param = {
			{
				30,
				30,
				true,
				"%"
			}
		}
	},
	[111840021] = {
		description = "「反制打击」的举盾防御持续时间缩短<color=#E78300>50%</color>；成功格挡的反击命中时额外获得<color=#E78300>15</color>点神能，反击命中瞬间伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 111840021,
		extra_param = "",
		param = {
			{
				30,
				0,
				false,
				"%"
			}
		}
	},
	[111840022] = {
		description = "自身神能越多，攻击力提高越高，该效果提供的攻击力提高最高为<color=#E78300>100%</color>；施放「信念守护」消耗神能时，该攻击力提高效果<color=#E78300>1</color>秒内不会变化。",
		maxLv = 1,
		type = 1,
		id = 111840022,
		extra_param = "",
		param = {}
	},
	[111840023] = {
		description = "「反制打击」成功格挡后，重置「信念守护」的冷却时间，普通攻击每命中敌人<color=#E78300>1</color>次都会获得<color=#E78300>{1}</color>点神能，持续<color=#E78300>9</color>秒。",
		maxLv = 1,
		type = 1,
		id = 111840023,
		extra_param = "",
		param = {
			{
				3,
				0,
				false,
				""
			}
		}
	},
	[111840031] = {
		description = "队友受击时，自身获得<color=#E78300>{1}</color>点神能。",
		maxLv = 1,
		type = 1,
		id = 111840031,
		extra_param = "",
		param = {
			{
				3,
				0,
				false,
				""
			}
		}
	},
	[111840032] = {
		description = "「信念守护」的护盾值提高<color=#E78300>20%</color>。",
		maxLv = 1,
		type = 1,
		id = 111840032,
		extra_param = "",
		param = {}
	},
	[111840033] = {
		description = "「信念守护」也会给队友施加护盾；队友会根据队友的生命值上限获得护盾值。",
		maxLv = 1,
		type = 1,
		id = 111840033,
		extra_param = "",
		param = {}
	},
	[111970011] = {
		description = "每次触发<material=underline c=#FFFFFF h=2 event=terminology args=(119705)>「梦醒」</material>时，自身攻击力提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒，最多可叠加<color=#E78300>6</color>层。",
		maxLv = 1,
		type = 1,
		id = 111970011,
		extra_param = "",
		param = {
			{
				15,
				15,
				true,
				"%"
			},
			{
				12,
				0,
				false,
				""
			}
		}
	},
	[111970012] = {
		description = "处于<material=underline c=#FFFFFF h=2 event=terminology args=(119703)>「幻梦」</material>状态自身或者队友触发闪避效果时，触发<color=#E78300>1</color>次<material=underline c=#FFFFFF h=2 event=terminology args=(119705)>「梦醒」</material>。",
		maxLv = 1,
		type = 1,
		id = 111970012,
		extra_param = "",
		param = {}
	},
	[111970013] = {
		description = "进入<material=underline c=#FFFFFF h=2 event=terminology args=(119703)>「幻梦」</material>状态时，自身会心率降低<color=#E78300>{1}</color>，全队伍攻击力提高<color=#E78300>{2}</color>，<color=#E78300>15</color>秒后，自身能量获得率降低<color=#E78300>{3}</color>，持续至<material=underline c=#FFFFFF h=2 event=terminology args=(119703)>「幻梦」</material>状态结束。",
		maxLv = 1,
		type = 1,
		id = 111970013,
		extra_param = "",
		param = {
			{
				5,
				0,
				false,
				"%"
			},
			{
				40,
				0,
				false,
				"%"
			},
			{
				80,
				0,
				false,
				"%"
			}
		}
	},
	[111970021] = {
		description = "根据<material=underline c=#FFFFFF h=2 event=terminology args=(119701)>「噩梦」</material>的点数，全队伍会心率依次提高<color=#E78300>{1}、{2}</color>。\n根据<material=underline c=#FFFFFF h=2 event=terminology args=(119702)>「甜梦」</material>的点数，全队伍会心伤害依次提高<color=#E78300>{3}、{4}</color>。",
		maxLv = 1,
		type = 1,
		id = 111970021,
		extra_param = "",
		param = {
			{
				5,
				5,
				true,
				"%"
			},
			{
				10,
				10,
				true,
				"%"
			},
			{
				5,
				5,
				true,
				"%"
			},
			{
				10,
				10,
				true,
				"%"
			}
		}
	},
	[111970022] = {
		description = "自身或者队友触发<material=underline c=#FFFFFF h=2 event=terminology args=(119704)>「幻梦沉眠」</material>的效果时，自身给自身或者队友附加暗属性伤害提高<color=#E78300>{1}</color>，持续至<material=underline c=#FFFFFF h=2 event=terminology args=(119703)>「幻梦」</material>结束，最多可叠加<color=#E78300>25</color>层。",
		maxLv = 1,
		type = 1,
		id = 111970022,
		extra_param = "",
		param = {
			{
				0.4,
				0.4,
				true,
				"%"
			}
		}
	},
	[111970023] = {
		description = "自身或者队友造成会心后，自身获得<color=#E78300>1</color>点能量，处于<material=underline c=#FFFFFF h=2 event=terminology args=(119703)>「幻梦」</material>状态时，能量上限减少<color=#E78300>1</color>点，该效果每<color=#E78300>0.2</color>秒最多触发一次；能量上限减少最多减少<color=#E78300>30</color>点，退出或重置<material=underline c=#FFFFFF h=2 event=terminology args=(119703)>「幻梦」</material>状态时移除能量上限减少效果。",
		maxLv = 1,
		type = 1,
		id = 111970023,
		extra_param = "",
		param = {}
	},
	[111970031] = {
		description = "处于<material=underline c=#FFFFFF h=2 event=terminology args=(119703)>「幻梦」</material>状态时，「牛角门的醒梦」的触发间隔改变为<color=#E78300>3</color>秒。",
		maxLv = 1,
		type = 1,
		id = 111970031,
		extra_param = "",
		param = {}
	},
	[111970032] = {
		description = "不再根据消耗<material=underline c=#FFFFFF h=2 event=terminology args=(119701)>「噩梦」</material>的点数获得能量，改变为有消耗<material=underline c=#FFFFFF h=2 event=terminology args=(119701)>「噩梦」</material>获得<color=#E78300>15</color>点能量。\n不再根据消耗<material=underline c=#FFFFFF h=2 event=terminology args=(119702)>「甜梦」</material>的点数获得攻击力提高层数，改变为有消耗<material=underline c=#FFFFFF h=2 event=terminology args=(119702)>「甜梦」</material>时获得<color=#E78300>5</color>层攻击力提高效果。",
		maxLv = 1,
		type = 1,
		id = 111970032,
		extra_param = "",
		param = {}
	},
	[111970033] = {
		description = "根据上一个施放的技能，「牛角门的醒梦」获得不同的效果：\n「永眠的沉梦」、「沉梦」：「牛角门的醒梦」改变为造成共计<color=#E78300>{1}</color>（技能三每提升一级<color=#E78300>+{2}</color>）攻击力的暗属性伤害；触发后<color=#E78300>5</color>秒内，每次队友机制值改变时，自身获得<color=#E78300>1</color>点能量，处于<material=underline c=#FFFFFF h=2 event=terminology args=(119703)>「幻梦」</material>状态时，改变为获得<color=#E78300>2</color>点能量。\n「遥想的白昼梦」、「白昼梦」：「牛角门的醒梦」改变为造成共计<color=#E78300>{3}</color>（技能三每提升一级<color=#E78300>+{4}</color>）攻击力的暗属性伤害；触发后<color=#E78300>10</color>秒内，队友攻击每命中敌人<color=#E78300>15</color>次，全队伍获得<color=#E78300>1</color>层攻击力提高效果，每有<color=#E78300>1</color>层攻击力提高<color=#E78300>{5}</color>，持续<color=#E78300>{6}</color>秒，最多可叠加<color=#E78300>30</color>层，处于<material=underline c=#FFFFFF h=2 event=terminology args=(119703)>「幻梦」</material>状态时，改变为全队伍获得<color=#E78300>2</color>层攻击力提高效果。",
		maxLv = 1,
		type = 1,
		id = 111970033,
		extra_param = "",
		param = {
			{
				60,
				1.538,
				true,
				"%"
			},
			{
				1.538,
				0.039,
				true,
				"%"
			},
			{
				60,
				1.538,
				true,
				"%"
			},
			{
				1.538,
				0.039,
				true,
				"%"
			},
			{
				0.5,
				0.5,
				true,
				"%"
			},
			{
				6,
				0,
				false,
				""
			}
		}
	},
	[111990011] = {
		description = "「雷殛·烈光」的怒气消耗减少<color=#E78300>10</color>点。",
		maxLv = 1,
		type = 1,
		id = 111990011,
		extra_param = "",
		param = {}
	},
	[111990012] = {
		description = "通过「雷殛·烈光」以外的途径对敌人附加<material=underline c=#FFFFFF h=2 event=terminology args=(119901)>「雷殛之印」</material>时，重置「雷殛·烈光」的冷却时间。",
		maxLv = 1,
		type = 1,
		id = 111990012,
		extra_param = "",
		param = {}
	},
	[111990013] = {
		description = "「雷殛·烈光」每次施放命中时，「雷殛·荒天」第三式对该敌人命中瞬间伤害提高<color=#E78300>{1}</color>，该效果最多可叠加<color=#E78300>3</color>层。",
		maxLv = 1,
		type = 1,
		id = 111990013,
		extra_param = "",
		param = {
			{
				33,
				33,
				true,
				"%"
			}
		}
	},
	[111990021] = {
		description = "每次清除<material=underline c=#FFFFFF h=2 event=terminology args=(119901)>「雷殛之印」</material>或处于<material=underline c=#FFFFFF h=2 event=terminology args=(119901)>「雷殛之印」</material>的敌人被击败时，获得<color=#E78300>{1}</color>点怒气。",
		maxLv = 1,
		type = 1,
		id = 111990021,
		extra_param = "",
		param = {
			{
				15,
				0,
				false,
				""
			}
		}
	},
	[111990022] = {
		description = "每次清除<material=underline c=#FFFFFF h=2 event=terminology args=(119901)>「雷殛之印」</material>或处于<material=underline c=#FFFFFF h=2 event=terminology args=(119901)>「雷殛之印」</material>的敌人被击败时，技能和奥义的剩余冷却时间缩短<color=#E78300>1.5</color>秒。",
		maxLv = 1,
		type = 1,
		id = 111990022,
		extra_param = "",
		param = {}
	},
	[111990023] = {
		description = "「雷殛·荒天」第三式也会清除<material=underline c=#FFFFFF h=2 event=terminology args=(119901)>「雷殛之印」</material>，成功清除<material=underline c=#FFFFFF h=2 event=terminology args=(119901)>「雷殛之印」</material>后，雷属性伤害提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 111990023,
		extra_param = "",
		param = {
			{
				35,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			}
		}
	},
	[111990031] = {
		description = "成功附加<material=underline c=#FFFFFF h=2 event=terminology args=(119901)>「雷殛之印」</material>后，会心率提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 111990031,
		extra_param = "",
		param = {
			{
				15,
				0,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[111990032] = {
		description = "普通攻击最后一段命中时或极限闪避后点击普通攻击施放的技能攻击命中时，有<color=#E78300>50%</color>的概率对命中的敌人附加<material=underline c=#FFFFFF h=2 event=terminology args=(119901)>「雷殛之印」</material>。",
		maxLv = 1,
		type = 1,
		id = 111990032,
		extra_param = "",
		param = {}
	},
	[111990033] = {
		description = "对处于<material=underline c=#FFFFFF h=2 event=terminology args=(119901)>「雷殛之印」</material>的敌人命中瞬间伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 111990033,
		extra_param = "",
		param = {
			{
				20,
				0,
				false,
				"%"
			}
		}
	},
	[112480011] = {
		description = "获得<material=underline c=#FFFFFF h=2 event=terminology args=(124804)>「脉冲」</material>状态时，队友获得<material=underline c=#FFFFFF h=2 event=terminology args=(124807)>「电荷激荡」</material>状态，持续<color=#E78300>7</color>秒。\n<material=underline c=#FFFFFF h=2 event=terminology args=(124807)>「电荷激荡」</material>：获得硬直效果，雷属性伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 112480011,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			}
		}
	},
	[112480012] = {
		description = "处于<material=underline c=#FFFFFF h=2 event=terminology args=(124807)>「电荷激荡」</material>状态的雷属性修正者施放技能时，自身会触发一次追加攻击，造成<color=#E78300>{1}</color>攻击力的雷属性伤害，该效果每<color=#E78300>0.1</color>秒最多触发一次。",
		maxLv = 1,
		type = 1,
		id = 112480012,
		extra_param = "",
		param = {
			{
				100,
				2.564,
				true,
				"%"
			}
		}
	},
	[112480013] = {
		description = "追加攻击命中时，对敌人附加会心抗性降低<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒。\n处于<material=underline c=#FFFFFF h=2 event=terminology args=(124807)>「电荷激荡」</material>状态的雷属性修正者攻击每次产生会心后，获得<color=#E78300>1</color>层会心伤害提高<color=#E78300>{3}</color>，持续<color=#E78300>{4}</color>秒，最多可叠加<color=#E78300>50</color>层。",
		maxLv = 1,
		type = 1,
		id = 112480013,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			},
			{
				5,
				0,
				false,
				""
			},
			{
				0.3,
				0.3,
				true,
				"%"
			},
			{
				5,
				0,
				false,
				""
			}
		}
	},
	[112480021] = {
		description = "前鬼坊天狗攻击力提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 112480021,
		extra_param = "",
		param = {
			{
				15,
				0,
				false,
				"%"
			}
		}
	},
	[112480022] = {
		description = "出场时，前鬼坊天狗给前鬼坊天狗附加会心率提高<color=#E78300>{1}</color>。\n自身不作为队长时，前鬼坊天狗给队长附加远程伤害提高<color=#E78300>{2}</color>。",
		maxLv = 1,
		type = 1,
		id = 112480022,
		extra_param = "",
		param = {
			{
				15,
				15,
				true,
				"%"
			},
			{
				10,
				10,
				true,
				"%"
			}
		}
	},
	[112480023] = {
		description = "出场时，前鬼坊天狗恢复<color=#E78300>100%</color>的奥义值。\n施放前鬼坊天狗单人奥义时，前鬼坊天狗会消耗全部奥义值并进入冷却状态。\n若前鬼坊天狗作为队长，则当前鬼坊天狗奥义进入冷却状态时，前鬼坊天狗给队长附加全属性伤害提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒。\n前鬼坊天狗奥义进入冷却状态后，会随机触发以下其中一个效果：\n队长技能伤害提高<color=#E78300>{3}</color>，持续<color=#E78300>{4}</color>秒；\n前鬼坊天狗受到的伤害降低<color=#E78300>{5}</color>，持续<color=#E78300>{6}</color>秒，恢复<color=#E78300>{7}</color>的生命值；\n前鬼坊天狗获得<color=#E78300>60%</color>的奥义值。",
		maxLv = 1,
		type = 1,
		id = 112480023,
		extra_param = "",
		param = {
			{
				15,
				15,
				true,
				"%"
			},
			{
				15,
				0,
				false,
				""
			},
			{
				15,
				0,
				false,
				"%"
			},
			{
				15,
				0,
				false,
				""
			},
			{
				30,
				0,
				false,
				"%"
			},
			{
				15,
				0,
				false,
				""
			},
			{
				20,
				0,
				false,
				"%"
			}
		}
	},
	[112480031] = {
		description = "被动获得额外效果：处于<material=underline c=#FFFFFF h=2 event=terminology args=(124801)>「束刃模式」</material>时，会心伤害提高<color=#E78300>{1}</color>；处于<material=underline c=#FFFFFF h=2 event=terminology args=(124802)>「磁炮模式」</material>时，会心率提高<color=#E78300>{2}</color>。",
		maxLv = 1,
		type = 1,
		id = 112480031,
		extra_param = "",
		param = {
			{
				25,
				0,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				"%"
			}
		}
	},
	[112480032] = {
		description = "施放「必杀·掠雷闪袭」、「必杀·掠雷重击」期间自身获得格挡效果。\n出场时、施放「必杀·掠雷闪袭」或「必杀·掠雷重击」切换形态时，被动的加成效果延长时间改变为<color=#E78300>14</color>秒；并会产生额外的攻击，造成共计<color=#E78300>{1}</color>（技能一每提升一级<color=#E78300>+{2}</color>）攻击力的雷属性伤害，该额外攻击命中时，获得<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(124803)>「神威」</material>标记。",
		maxLv = 1,
		type = 1,
		id = 112480032,
		extra_param = "",
		param = {
			{
				400,
				10.255,
				true,
				"%"
			},
			{
				10.256,
				0.263,
				true,
				"%"
			}
		}
	},
	[112480033] = {
		description = "消耗<color=#E78300>3</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(124803)>「神威」</material>标记的「必杀·翔翼降临」、「必杀·超频巨炮」攻击命中瞬间基础伤害提高<color=#E78300>{1}</color>。\n自身拥有<material=underline c=#FFFFFF h=2 event=terminology args=(124803)>「神威」</material>标记不低于<color=#E78300>3</color>个时，获得<material=underline c=#FFFFFF h=2 event=terminology args=(124805)>「火力全开！」</material>状态。\n<material=underline c=#FFFFFF h=2 event=terminology args=(124805)>「火力全开！」</material>：\n闪避效果不处于冷却状态时，普通攻击最后一段的最后一次攻击或满蓄力的蓄力攻击命中时，也会触发闪避效果，之后闪避效果进入冷却；\n普通攻击最后一段的最后一次攻击命中时，会产生额外的技能攻击，造成共计<color=#E78300>{2}</color>（普通攻击每提升一级<color=#E78300>+{3}</color>）攻击力的雷属性伤害；\n满蓄力的蓄力攻击，会产生额外的技能攻击，造成共计<color=#E78300>{4}</color>（普通攻击每提升一级<color=#E78300>+{5}</color>）攻击力的雷属性伤害。",
		maxLv = 1,
		type = 1,
		id = 112480033,
		extra_param = "",
		param = {
			{
				40,
				0,
				false,
				"%"
			},
			{
				500,
				12.82,
				true,
				"%"
			},
			{
				12.821,
				0.329,
				true,
				"%"
			},
			{
				400,
				10.256,
				true,
				"%"
			},
			{
				10.256,
				0.263,
				true,
				"%"
			}
		}
	},
	[112840011] = {
		description = "不处于<material=underline c=#FFFFFF h=2 event=terminology args=(128402)>「裁断」</material>状态时，反击每次命中后获得<color=#E78300>5</color>点<material=underline c=#FFFFFF h=2 event=terminology args=(128401)>「破晓」</material>。\n施放反击后，也可点击普通攻击衔接施放「炽光的剑印」。",
		maxLv = 1,
		type = 1,
		id = 112840011,
		extra_param = "",
		param = {}
	},
	[112840012] = {
		description = "不处于<material=underline c=#FFFFFF h=2 event=terminology args=(128402)>「裁断」</material>状态时：每次施放「辉光」命中后，会触发一次额外攻击，造成共计<color=#E78300>{1}</color>攻击力的光属性伤害；每次施放「命咎」命中后，会触发一次额外攻击，造成共计<color=#E78300>{2}</color>攻击力的光属性伤害。\n处于<material=underline c=#FFFFFF h=2 event=terminology args=(128402)>「裁断」</material>状态时：每次施放「辉光」命中后，会触发一次额外攻击，造成共计<color=#E78300>{3}</color>攻击力的光属性伤害；每次施放「命咎」命中后，会触发一次额外攻击，造成共计<color=#E78300>{4}</color>攻击力的光属性伤害。",
		maxLv = 1,
		type = 1,
		id = 112840012,
		extra_param = "",
		param = {
			{
				300,
				7.688,
				true,
				"%"
			},
			{
				300,
				7.692,
				true,
				"%"
			},
			{
				400,
				10.254,
				true,
				"%"
			},
			{
				400,
				10.256,
				true,
				"%"
			}
		}
	},
	[112840013] = {
		description = "施放每段普通攻击、「刹那的辉光」、「刹那」、「辉光」、「命运的涟漪」、「运升」、「命咎」时会有短暂的格挡，成功格挡伤害时会触发额外攻击，造成共计<color=#E78300>{1}</color>攻击力的光属性伤害，该额外攻击每<color=#E78300>1</color>秒最多触发一次。",
		maxLv = 1,
		type = 1,
		id = 112840013,
		extra_param = "",
		param = {
			{
				400,
				10.255,
				true,
				"%"
			}
		}
	},
	[112840021] = {
		description = "处于<material=underline c=#FFFFFF h=2 event=terminology args=(128402)>「裁断」</material>状态时，攻击力提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 112840021,
		extra_param = "",
		param = {
			{
				12,
				0,
				false,
				"%"
			}
		}
	},
	[112840022] = {
		description = "唤出的裁断之手攻击命中瞬间伤害提高<color=#E78300>{1}</color>，修正系数提高<color=#E78300>{2}</color>。",
		maxLv = 1,
		type = 1,
		id = 112840022,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			},
			{
				80,
				0,
				false,
				"%"
			}
		}
	},
	[112840023] = {
		description = "处于<material=underline c=#FFFFFF h=2 event=terminology args=(128402)>「裁断」</material>状态时，每<color=#E78300>0.2</color>秒自动获得<color=#E78300>3</color>点神能，施放「刹那的辉光」、「命运的涟漪」时，技能只会替换为「辉光」、「命咎」。",
		maxLv = 1,
		type = 1,
		id = 112840023,
		extra_param = "",
		param = {}
	},
	[112840031] = {
		description = "出场时，获得<color=#E78300>50</color>点<material=underline c=#FFFFFF h=2 event=terminology args=(128401)>「破晓」</material>。",
		maxLv = 1,
		type = 1,
		id = 112840031,
		extra_param = "",
		param = {}
	},
	[112840032] = {
		description = "施放「刹那的辉光」后，不衔接施放「刹那」也不施放「辉光」时，「刹那的辉光」的剩余冷却时间缩短<color=#E78300>4</color>秒；施放「命运的涟漪」后，不衔接施放「运升」也不施放「命咎」时，「命运的涟漪」的剩余冷却时间缩短<color=#E78300>4</color>秒。\n闪避效果不处于冷却状态时，施放「炽光的剑印」时也会触发闪避效果，之后闪避效果进入冷却。",
		maxLv = 1,
		type = 1,
		id = 112840032,
		extra_param = "",
		param = {}
	},
	[112840033] = {
		description = "施放普通攻击第三段后不继续衔接普通攻击第四段的短暂时间后，可以连续点击普通攻击施放攻击，依次造成共计<color=#E78300>{1}</color>（普通攻击每提升一级<color=#E78300>+{2}</color>）、<color=#E78300>{3}</color>（普通攻击每提升一级<color=#E78300>+{4}</color>）、<color=#E78300>{5}</color>（普通攻击每提升一级<color=#E78300>+{6}</color>）攻击力的光属性伤害；该攻击每次命中后获得<color=#E78300>1</color>点<material=underline c=#FFFFFF h=2 event=terminology args=(128401)>「破晓」</material>；施放该最后一段攻击时会消耗全部神能，每消耗<color=#E78300>1</color>点神能，该攻击命中瞬间普通攻击伤害提高<color=#E78300>{7}</color>；施放该最后一段攻击时，「裁断的剑印」会替换为「炽光的剑印」，可以衔接施放「炽光的剑印」。",
		maxLv = 1,
		type = 1,
		id = 112840033,
		extra_param = "",
		param = {
			{
				500,
				9.615,
				true,
				"%"
			},
			{
				9.615,
				0.185,
				true,
				"%"
			},
			{
				600,
				11.538,
				true,
				"%"
			},
			{
				11.538,
				0.222,
				true,
				"%"
			},
			{
				700,
				13.46,
				true,
				"%"
			},
			{
				13.462,
				0.259,
				true,
				"%"
			},
			{
				0.5,
				0.5,
				true,
				"%"
			}
		}
	},
	[200000001] = {
		description = "「苍澜鲸歌」会对范围内的敌人造成共计<color=#E78300>{1}</color>攻击力的水属性伤害。",
		maxLv = 1,
		type = 1,
		id = 200000001,
		extra_param = "",
		param = {
			{
				140,
				3.589,
				false,
				"%"
			}
		}
	},
	[200000002] = {
		description = "「苍澜鲸歌」的生命值恢复效果提高<color=#E78300>20%</color>。",
		maxLv = 1,
		type = 1,
		id = 200000002,
		extra_param = "",
		param = {}
	},
	[200000003] = {
		description = "「苍澜鲸歌」会为全队伍恢复生命值，不再需要选择区域。",
		maxLv = 1,
		type = 1,
		id = 200000003,
		extra_param = "",
		param = {}
	},
	[200000004] = {
		description = "「多轮轰炸」的冷却时间缩短<color=#E78300>3</color>秒。",
		maxLv = 1,
		type = 1,
		id = 200000004,
		extra_param = "",
		param = {}
	},
	[200000005] = {
		description = "「多轮轰炸」的范围半径提高<color=#E78300>60%</color>，命中瞬间基础伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 200000005,
		extra_param = "",
		param = {
			{
				20,
				0,
				false,
				"%"
			}
		}
	},
	[200000006] = {
		description = "「兔兔出击」对处于破甲状态的敌人命中瞬间伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 200000006,
		extra_param = "",
		param = {
			{
				35,
				0,
				false,
				"%"
			}
		}
	},
	[200000007] = {
		description = "「灼舞」的基础伤害提高<color=#E78300>{1}</color>，每命中敌人<color=#E78300>1</color>次有<color=#E78300>10%</color>的概率获得额外<color=#E78300>1</color>个印记。\n「灼舞」每命中敌人<color=#E78300>1</color>次，闪避效果的剩余冷却时间缩短<color=#E78300>0.2</color>秒。",
		maxLv = 1,
		type = 1,
		id = 200000007,
		extra_param = "",
		param = {
			{
				35,
				0,
				false,
				"%"
			}
		}
	},
	[200000008] = {
		description = "自身触发闪避效果时，获得<color=#E78300>1</color>个印记并对锁定的敌人触发「灼舞」，该次触发不会使该技能进入冷却。",
		maxLv = 1,
		type = 1,
		id = 200000008,
		extra_param = "",
		param = {}
	},
	[200000009] = {
		description = "「朔望·末月」的冷却时间缩短<color=#E78300>8</color>秒。",
		maxLv = 1,
		type = 1,
		id = 200000009,
		extra_param = "",
		param = {}
	},
	[200000010] = {
		description = "「朔·末月」每次命中时，后续的命中瞬间伤害提高<color=#E78300>{1}</color>，该效果提供的伤害提高最高为<color=#E78300>180%</color>。",
		maxLv = 1,
		type = 1,
		id = 200000010,
		extra_param = "",
		param = {
			{
				30,
				30,
				false,
				"%"
			}
		}
	},
	[200000011] = {
		description = "施放「朔·末月」时，可消耗<color=#E78300>20</color>点神能增加额外攻击段数。",
		maxLv = 1,
		type = 1,
		id = 200000011,
		extra_param = "",
		param = {}
	},
	[200000012] = {
		description = "自身触发闪避效果时，重置「飓风突刺」的冷却时间，并获得<color=#E78300>{1}</color>点神能。",
		maxLv = 1,
		type = 1,
		id = 200000012,
		extra_param = "",
		param = {
			{
				20,
				0,
				false,
				""
			}
		}
	},
	[200000013] = {
		description = "「破军」的基础伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 200000013,
		extra_param = "",
		param = {
			{
				30,
				0,
				false,
				"%"
			}
		}
	},
	[200000014] = {
		description = "印记上限增加<color=#E78300>3</color>个。根据施放「破军」前拥有的印记数量，命中时会消耗对应数量的印记，每消耗<color=#E78300>1</color>个印记，该技能基础伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 200000014,
		extra_param = "",
		param = {
			{
				20,
				20,
				false,
				"%"
			}
		}
	},
	[200000015] = {
		description = "「破军」命中时会重置「涌动之风」的冷却时间。当自身拥有印记时，「涌动之风」命中时对敌人附加风属性抗性降低<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 200000015,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[200000016] = {
		description = "普通攻击对处于冰冻状态的敌人命中瞬间伤害提高<color=#E78300>{1}</color>。\n普通攻击的扩散范围攻击对处于冰冻状态的敌人会造成<color=#E78300>375%</color>攻击力的冰属性伤害。",
		maxLv = 1,
		type = 1,
		id = 200000016,
		extra_param = "",
		param = {
			{
				200,
				0,
				false,
				"%"
			}
		}
	},
	[200000017] = {
		description = "「幽离冲击」每命中一个敌人，后续命中瞬间伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 200000017,
		extra_param = "",
		param = {
			{
				3,
				3,
				false,
				"%"
			}
		}
	},
	[200000018] = {
		description = "「幽离冲击」对命中的敌人附加受创状态，持续<color=#E78300>{2}</color>秒。\n受创：每<color=#E78300>3</color>秒附加<color=#E78300>{1}</color>攻击力的暗属性伤害，持续<color=#E78300>{2}</color>秒；附加的伤害可以叠加。",
		maxLv = 1,
		type = 1,
		id = 200000018,
		extra_param = "",
		param = {
			{
				10,
				10,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[200000019] = {
		description = "「幽离冲击」的冷却时间缩短<color=#E78300>2</color>秒；自身触发闪避效果时，「幽离冲击」的剩余冷却时间缩短<color=#E78300>2</color>秒。",
		maxLv = 1,
		type = 1,
		id = 200000019,
		extra_param = "",
		param = {}
	},
	[200000020] = {
		description = "「幽梦乐园」的效果提高<color=#E78300>30%</color>。",
		maxLv = 1,
		type = 1,
		id = 200000020,
		extra_param = "",
		param = {}
	},
	[200000021] = {
		description = "「幽梦乐园」的效果会在开启后持续至主动关闭，最多持续<color=#E78300>60</color>秒，期间内不再自动获得能量，并且每<color=#E78300>1</color>秒消耗<color=#E78300>3</color>点能量，关闭后技能进入冷却；「幽梦乐园」效果持续期间，施放「眠羊游行」不再消耗能量；「幽梦乐园」冷却时间缩短<color=#E78300>16</color>秒。",
		maxLv = 1,
		type = 1,
		id = 200000021,
		extra_param = "",
		param = {}
	},
	[200000022] = {
		description = "「闪耀冲击」每命中一个敌人，后续伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 200000022,
		extra_param = "",
		param = {
			{
				1,
				1,
				false,
				"%"
			}
		}
	},
	[200000023] = {
		description = "「闪耀冲击」对命中的敌人附加受创状态，每<color=#E78300>3</color>秒造成<color=#E78300>{1}</color>攻击力的光属性伤害，持续<color=#E78300>{2}</color>秒；该效果可以叠加。",
		maxLv = 1,
		type = 1,
		id = 200000023,
		extra_param = "",
		param = {
			{
				10,
				10,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[200000024] = {
		description = "「闪耀冲击」的冷却时间缩短<color=#E78300>2</color>秒；自身触发闪避效果时，「闪耀冲击」的剩余冷却时间缩短<color=#E78300>2</color>秒。",
		maxLv = 1,
		type = 1,
		id = 200000024,
		extra_param = "",
		param = {}
	},
	[200000025] = {
		description = "「浮光幻羽」命中瞬间伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 200000025,
		extra_param = "",
		param = {
			{
				15,
				0,
				false,
				"%"
			}
		}
	},
	[200000026] = {
		description = "每次触发「极境神域」的共享效果时，<material=underline c=#FFFFFF h=2 event=terminology args=(103301)>「真理之域」</material>范围内的队友会心率提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒，最多可叠加<color=#E78300>3</color>层。",
		maxLv = 1,
		type = 1,
		id = 200000026,
		extra_param = "",
		param = {
			{
				7,
				7,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[200000027] = {
		description = "施放「极境神域」后，每<color=#E78300>5</color>秒对最后一次生成的<material=underline c=#FFFFFF h=2 event=terminology args=(103301)>「真理之域」</material>范围内的随机一名敌人额外召唤一枚「逆序警诫」的警诫之轮。",
		maxLv = 1,
		type = 1,
		id = 200000027,
		extra_param = "",
		param = {}
	},
	[200000028] = {
		description = "施放「炙炼侵袭」将长剑抛掷出去后，再次点击该技能键不再使旋转的长剑飞回，而是瞬移到旋转的长剑处收回长剑。接住长剑后的强力攻击施放时，获得<color=#E78300>100</color>点<material=underline c=#FFFFFF h=2 event=terminology args=(113204)>「烙印」</material>。越早收回长剑，「炙炼侵袭」的剩余冷却时间缩短越多，该效果提供的剩余冷却时间缩短最高为<color=#E78300>12</color>秒。",
		maxLv = 1,
		type = 1,
		id = 200000028,
		extra_param = "",
		param = {}
	},
	[200000029] = {
		description = "处于<material=underline c=#FFFFFF h=2 event=terminology args=(113201)>「燃剑姿态」</material>时，每次普通攻击命中时，「炙炼侵袭」的剩余冷却时间缩短<color=#E78300>0.5</color>秒。\n处于<material=underline c=#FFFFFF h=2 event=terminology args=(113202)>「炽甲姿态」</material>时，施放「爆裂强攻」会消耗全部怒气、全部<material=underline c=#FFFFFF h=2 event=terminology args=(113204)>「烙印」</material>，每消耗<color=#E78300>1</color>点怒气，基础伤害提高<color=#E78300>{1}</color>，消耗<material=underline c=#FFFFFF h=2 event=terminology args=(113204)>「烙印」</material>时基础伤害也会提高；施放奥义后，重置「炙炼侵袭」的冷却时间。",
		maxLv = 1,
		type = 1,
		id = 200000029,
		extra_param = "",
		param = {
			{
				1,
				1,
				false,
				"%"
			},
			{
				0.1,
				0.1,
				false,
				""
			}
		}
	},
	[200000030] = {
		description = "奥义获得率降低<color=#E78300>{1}</color>。<material=underline c=#FFFFFF h=2 event=terminology args=(102401)>「狼魂」</material>的协同攻击和特殊攻击命中瞬间暗属性伤害提高<color=#E78300>{2}</color>。",
		maxLv = 1,
		type = 1,
		id = 200000030,
		extra_param = "",
		param = {
			{
				50,
				0,
				false,
				"%"
			},
			{
				35,
				0,
				false,
				"%"
			}
		}
	},
	[200001001] = {
		description = "「逐光落影」的基础伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 200001001,
		extra_param = "",
		param = {
			{
				30,
				0,
				false,
				"%"
			}
		}
	},
	[200001002] = {
		description = "「绯·散华」第三式对处于受创状态的敌人基础伤害提高<color=#E78300>{1}</color>。当「绯·散华」第三式击败处于受创状态的敌人时，技能和奥义的剩余冷却时间缩短<color=#E78300>1</color>秒。",
		maxLv = 1,
		type = 1,
		id = 200001002,
		extra_param = "",
		param = {
			{
				100,
				0,
				false,
				"%"
			}
		}
	},
	[200001003] = {
		description = "连续施放「绯·散华」第三式时，每次施放基础伤害提高<color=#E78300>100%</color>。",
		maxLv = 1,
		type = 1,
		id = 200001003,
		extra_param = "",
		param = {}
	},
	[200001004] = {
		description = "对处于灼烧状态的敌人命中瞬间伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 200001004,
		extra_param = "",
		param = {
			{
				45,
				0,
				false,
				"%"
			}
		}
	},
	[200001005] = {
		description = "当<material=underline c=#FFFFFF h=2 event=terminology args=(105801)>「染火」</material>状态持续到「烬祸·熔火」的冷却结束时，「烬祸·熔火」会获得强化效果。\n强化的「烬祸·熔火」：造成共计<color=#E78300>{1}</color>（技能三每提升一级<color=#E78300>+{2}</color>）攻击力的火属性伤害。",
		maxLv = 1,
		type = 1,
		id = 200001005,
		extra_param = "",
		param = {
			{
				3600,
				92.306,
				false,
				"%"
			},
			{
				92.308,
				2.367,
				false,
				"%"
			}
		}
	},
	[200001006] = {
		description = "普通攻击每命中<color=#E78300>5</color>次时，会获得<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(105802)>「炽轮」</material>标记，<material=underline c=#FFFFFF h=2 event=terminology args=(105802)>「炽轮」</material>标记最多拥有<color=#E78300>2</color>个。施放「秘剑·焚涅」或「秘剑·牙突」时会消耗<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(105802)>「炽轮」</material>标记并获得强化效果。\n强化的「秘剑·焚涅」：造成共计<color=#E78300>{1}</color>（技能一每提升一级<color=#E78300>+{2}</color>）攻击力的火属性伤害。\n强化的「秘剑·牙突」：造成共计<color=#E78300>{3}</color>（技能二每提升一级<color=#E78300>+{4}</color>）攻击力的火属性伤害。",
		maxLv = 1,
		type = 1,
		id = 200001006,
		extra_param = "",
		param = {
			{
				1200,
				30.768,
				false,
				"%"
			},
			{
				30.769,
				0.789,
				false,
				"%"
			},
			{
				1200,
				30.768,
				false,
				"%"
			},
			{
				30.769,
				0.789,
				false,
				"%"
			}
		}
	},
	[200001007] = {
		description = "当场上存在<material=underline c=#FFFFFF h=2 event=terminology args=(103201)>「王棋」</material>时，全队伍防御力提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 200001007,
		extra_param = "",
		param = {
			{
				48,
				0,
				false,
				"%"
			}
		}
	},
	[200001008] = {
		description = "在施放普通攻击第一段或第二段后衔接「禁忌灾刃」，会改变「禁忌灾刃」的攻击模式。\n「禁忌灾刃」：造成共计<color=#E78300>{1}</color>（技能一每提升一级+<color=#E78300>{2}</color>）攻击力的物理属性伤害，自身生命值越少，「禁忌灾刃」命中瞬间伤害提高越高，该效果提供的伤害提高最高为<color=#E78300>150%</color>。",
		maxLv = 1,
		type = 1,
		id = 200001008,
		extra_param = "",
		param = {
			{
				480,
				12.306,
				false,
				"%"
			},
			{
				12.308,
				0.316,
				false,
				"%"
			}
		}
	},
	[200001009] = {
		description = "在施放普通攻击第三段或第四段后衔接「禁忌灾刃」，会改变「禁忌灾刃」的攻击模式。\n「禁忌灾刃」：造成共计<color=#E78300>{1}</color>（技能一每提升一级<color=#E78300>+{2}</color>）攻击力的物理属性伤害，「禁忌灾刃」会小范围聚集敌人，命中时额外获得<color=#E78300>{3}</color>个印记。",
		maxLv = 1,
		type = 1,
		id = 200001009,
		extra_param = "",
		param = {
			{
				360,
				9.228,
				false,
				"%"
			},
			{
				9.231,
				0.237,
				false,
				"%"
			},
			{
				2,
				0,
				false,
				""
			}
		}
	},
	[200001010] = {
		description = "在施放「狱镰回旋」后衔接「禁忌灾刃」，会改变「禁忌灾刃」的攻击模式。\n「禁忌灾刃」：造成共计<color=#E78300>{1}</color>（技能一每提升一级<color=#E78300>+{2}</color>）攻击力的物理属性伤害，命中时对敌人附加物理属性抗性降低<color=#E78300>{3}</color>，持续<color=#E78300>{4}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 200001010,
		extra_param = "",
		param = {
			{
				250,
				6.41,
				false,
				"%"
			},
			{
				6.41,
				0.164,
				false,
				"%"
			},
			{
				40,
				0,
				false,
				"%"
			},
			{
				3,
				0,
				false,
				""
			}
		}
	},
	[200001011] = {
		description = "不处于<material=underline c=#FFFFFF h=2 event=terminology args=(111101)>「冥府审判模式」</material>时，「永劫轮舞」命中敌人时，后续的基础伤害提高<color=#E78300>{1}</color>，该效果每<color=#E78300>0.1</color>秒最多触发一次。\n处于<material=underline c=#FFFFFF h=2 event=terminology args=(111101)>「冥府审判模式」</material>时，「永劫轮舞」命中敌人时，后续的基础伤害提高<color=#E78300>{2}</color>，该效果每<color=#E78300>0.1</color>秒最多触发一次。",
		maxLv = 1,
		type = 1,
		id = 200001011,
		extra_param = "",
		param = {
			{
				3,
				3,
				false,
				"%"
			},
			{
				6,
				6,
				false,
				"%"
			}
		}
	},
	[200001012] = {
		description = "施放「冥府神罚」时，生命值上限提高<color=#E78300>{1}</color>，该效果最多可叠加<color=#E78300>2</color>层。",
		maxLv = 1,
		type = 1,
		id = 200001012,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[200001013] = {
		description = "<material=underline c=#FFFFFF h=2 event=terminology args=(111101)>「冥府审判模式」</material>改变为每秒<color=#E78300>9%</color>生命值上限的生命移除状态。<material=underline c=#FFFFFF h=2 event=terminology args=(111101)>「冥府审判模式」</material>时，会吸收非致命伤害并<color=#E78300>100%</color>转化为生命值，最多可吸收伤害量等同于自身生命值上限的<color=#E78300>150%</color>。",
		maxLv = 1,
		type = 1,
		id = 200001013,
		extra_param = "",
		param = {}
	},
	[200001014] = {
		description = "出场时，获得<color=#E78300>6</color>层减伤效果，之后每<color=#E78300>18</color>秒获得<color=#E78300>1</color>层，最多可叠加<color=#E78300>6</color>层；每层自身受到的伤害降低<color=#E78300>{1}</color>；自身每次受击时，失去<color=#E78300>1</color>层减伤效果。",
		maxLv = 1,
		type = 1,
		id = 200001014,
		extra_param = "",
		param = {
			{
				15,
				15,
				false,
				"%"
			}
		}
	},
	[200001017] = {
		description = "当敌人被附加冰冻状态时，自身对其附加<color=#E78300>{1}</color>攻击力的冰属性伤害。",
		maxLv = 1,
		type = 1,
		id = 200001017,
		extra_param = "",
		param = {
			{
				200,
				0,
				false,
				"%"
			}
		}
	},
	[200001018] = {
		description = "处于未受击状态时，攻击力提高<color=#E78300>{1}</color>，受击后移除该效果；极限闪避后，进入未受击状态。",
		maxLv = 1,
		type = 1,
		id = 200001018,
		extra_param = "",
		param = {
			{
				35,
				0,
				false,
				"%"
			}
		}
	},
	[200001019] = {
		description = "自身成功附加冰冻状态时，会心伤害提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 200001019,
		extra_param = "",
		param = {
			{
				70,
				0,
				false,
				"%"
			},
			{
				6,
				0,
				false,
				""
			}
		}
	},
	[200001020] = {
		description = "普通攻击对处于冰冻状态的敌人独立伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 200001020,
		extra_param = "",
		param = {
			{
				200,
				0,
				false,
				"%"
			}
		}
	},
	[200001021] = {
		description = "「寒潮漩涡」可通过长按来增加旋转圈数，每二个额外圈数消耗<color=#E78300>10</color>点怒气；每消耗一次怒气，「寒潮漩涡」的基础伤害提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒，最多可叠加<color=#E78300>10</color>层。",
		maxLv = 1,
		type = 1,
		id = 200001021,
		extra_param = "",
		param = {
			{
				6,
				6,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[200001022] = {
		description = "「极地猎袭」的基础伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 200001022,
		extra_param = "",
		param = {
			{
				35,
				0,
				false,
				"%"
			}
		}
	},
	[200001023] = {
		description = "利剑式跟踪导弹每次命中时有<color=#E78300>100%</color>的概率获得<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(108101)>「破冰」</material>标记，该效果每<color=#E78300>3</color>秒最多触发一次。",
		maxLv = 1,
		type = 1,
		id = 200001023,
		extra_param = "",
		param = {}
	},
	[200001024] = {
		description = "<material=underline c=#FFFFFF h=2 event=terminology args=(108102)>「巡航模式」</material>结束的跃出伤害提高，根据<material=underline c=#FFFFFF h=2 event=terminology args=(108102)>「巡航模式」</material>中普通攻击释放的利剑式跟踪导弹数量，每释放<color=#E78300>1</color>枚追踪导弹，基础伤害提高<color=#E78300>{1}</color>、自身恢复<color=#E78300>1</color>点神能，该效果提供的基础伤害提高最高为<color=#E78300>300%</color>。\n利剑式跟踪导弹命中时会对敌人附加冰属性抗性降低<color=#E78300>{2}</color>，持续<color=#E78300>{3}</color>秒，最多可叠加<color=#E78300>100</color>层。",
		maxLv = 1,
		type = 1,
		id = 200001024,
		extra_param = "",
		param = {
			{
				3,
				3,
				false,
				"%"
			},
			{
				0.1,
				0.1,
				false,
				"%"
			},
			{
				3,
				0,
				false,
				""
			}
		}
	},
	[200001025] = {
		description = "当拥有的标记为满时，施放「破空寒流」命中时会改变为消耗<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(108101)>「破冰」</material>标记，基础伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 200001025,
		extra_param = "",
		param = {
			{
				60,
				0,
				false,
				"%"
			}
		}
	},
	[200001026] = {
		description = "处于<material=underline c=#FFFFFF h=2 event=terminology args=(112703)>「感应」</material>状态受击时，「暗潮之力」的剩余冷却时间缩短<color=#E78300>3</color>秒，对附近敌人造成共计<color=#E78300>{1}</color>攻击力的水属性伤害，每次「暗潮之力」冷却期间该效果最多触发一次。",
		maxLv = 1,
		type = 1,
		id = 200001026,
		extra_param = "",
		param = {
			{
				900,
				23.076,
				false,
				"%"
			}
		}
	},
	[200001027] = {
		description = "普通攻击会对命中的敌人附加以下效果。\n当拥有标记时，命中时对敌人附加破甲状态，防御力降低<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒。\n当拥有的标记为满时，命中时对敌人附加水属性抗性降低<color=#E78300>{3}</color>，持续<color=#E78300>{4}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 200001027,
		extra_param = "",
		param = {
			{
				20,
				0,
				false,
				"%"
			},
			{
				6,
				0,
				false,
				""
			},
			{
				25,
				0,
				false,
				"%"
			},
			{
				6,
				0,
				false,
				""
			}
		}
	},
	[200001028] = {
		description = "施放「深海愈疗」会额外恢复附近的所有友方已损失的生命值的<color=#E78300>20%</color>，该效果不受治疗效果提高或降低与被治疗效果提高或降低影响。",
		maxLv = 1,
		type = 1,
		id = 200001028,
		extra_param = "",
		param = {}
	},
	[200001029] = {
		description = "普通攻击对处于冰冻状态的敌人独立伤害提高<color=#E78300>{1}</color>。\n普通攻击的扩散范围攻击对处于冰冻状态的敌人会造成<color=#E78300>750%</color>攻击力的冰属性伤害。",
		maxLv = 1,
		type = 1,
		id = 200001029,
		extra_param = "",
		param = {
			{
				200,
				0,
				false,
				"%"
			}
		}
	},
	[200001030] = {
		description = "每次施放<material=underline c=#FFFFFF h=2 event=terminology args=(109901)>「望」</material>击败敌人时，该技能的剩余冷却时间缩短<color=#E78300>50%</color>，进入零时空间，持续<color=#E78300>4</color>秒，并获得<color=#E78300>25</color>点神能。",
		maxLv = 1,
		type = 1,
		id = 200001030,
		extra_param = "",
		param = {}
	},
	[200001031] = {
		description = "「朔·月夜见」每次命中时，后续的基础伤害提高<color=#E78300>{1}</color>，该效果提供的基础伤害提高最高为<color=#E78300>240%</color>。",
		maxLv = 1,
		type = 1,
		id = 200001031,
		extra_param = "",
		param = {
			{
				40,
				40,
				false,
				"%"
			}
		}
	},
	[200001032] = {
		description = "施放「朔·月夜见」时，可消耗<color=#E78300>15</color>点神能增加额外攻击段数。",
		maxLv = 1,
		type = 1,
		id = 200001032,
		extra_param = "",
		param = {}
	},
	[200001033] = {
		description = "「朔·末月」每次命中时，后续的基础伤害提高<color=#E78300>{1}</color>，该效果提供的基础伤害提高最高为<color=#E78300>240%</color>。",
		maxLv = 1,
		type = 1,
		id = 200001033,
		extra_param = "",
		param = {
			{
				40,
				40,
				false,
				"%"
			}
		}
	},
	[200001034] = {
		description = "施放「朔·末月」时，可消耗<color=#E78300>15</color>点神能增加额外攻击段数。",
		maxLv = 1,
		type = 1,
		id = 200001034,
		extra_param = "",
		param = {}
	},
	[200001035] = {
		description = "「雷殛·烈光」每次施放命中时，「雷殛·荒天」第三式对该敌人命中瞬间伤害提高<color=#E78300>{1}</color>，该效果最多可叠加<color=#E78300>3</color>层。",
		maxLv = 1,
		type = 1,
		id = 200001035,
		extra_param = "",
		param = {
			{
				36,
				36,
				false,
				"%"
			}
		}
	},
	[200001036] = {
		description = "「雷殛·荒天」第三式也会清除<material=underline c=#FFFFFF h=2 event=terminology args=(119901)>「雷殛之印」</material>，成功清除<material=underline c=#FFFFFF h=2 event=terminology args=(119901)>「雷殛之印」</material>后，雷属性伤害提高<color=#E78300>{1}</color>、会心率提高<color=#E78300>{3}</color>，持续<color=#E78300>{2}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 200001036,
		extra_param = "",
		param = {
			{
				35,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			},
			{
				10,
				0,
				false,
				"%"
			}
		}
	},
	[200001037] = {
		description = "全队伍对处于<material=underline c=#FFFFFF h=2 event=terminology args=(119901)>「雷殛之印」</material>的敌人命中瞬间伤害提高<color=#E78300>{1}</color>。处于<material=underline c=#FFFFFF h=2 event=terminology args=(119901)>「雷殛之印」</material>的敌人雷属性抗性降低<color=#E78300>{2}</color>。",
		maxLv = 1,
		type = 1,
		id = 200001037,
		extra_param = "",
		param = {
			{
				20,
				0,
				false,
				"%"
			},
			{
				15,
				0,
				false,
				"%"
			}
		}
	},
	[200001038] = {
		description = "施放的「忍法」技能的第一个「持」和上一个施放的「忍法」技能的第二个「持」不同时、施放的「忍法」技能和上一个「忍法」技能相同并且上一个「忍法」技能是通过消耗全部神能施放时，该「忍法」独立伤害提高<color=#E78300>{1}</color>，命中时对敌人附加破甲状态，防御力降低<color=#E78300>{2}</color>，持续<color=#E78300>{3}</color>秒，最多可叠加<color=#E78300>3</color>层。",
		maxLv = 1,
		type = 1,
		id = 200001038,
		extra_param = "",
		param = {
			{
				70,
				0,
				false,
				"%"
			},
			{
				7,
				7,
				false,
				"%"
			},
			{
				9,
				0,
				false,
				""
			}
		}
	},
	[200001039] = {
		description = "对处于控制抗性的敌人命中瞬间会心率提高<color=#E78300>{1}</color>、会心伤害提高<color=#E78300>{2}</color>。",
		maxLv = 1,
		type = 1,
		id = 200001039,
		extra_param = "",
		param = {
			{
				60,
				0,
				false,
				"%"
			},
			{
				30,
				0,
				false,
				"%"
			}
		}
	},
	[200001040] = {
		description = "「连环准星」每命中敌人<color=#E78300>5</color>次，会在目标位置施放爆炸，造成<color=#E78300>{1}</color>攻击力的物理属性伤害。",
		maxLv = 1,
		type = 1,
		id = 200001040,
		extra_param = "",
		param = {
			{
				400,
				10.256,
				false,
				"%"
			}
		}
	},
	[200001041] = {
		description = "获得或恢复印记时，自身物理属性伤害提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 200001041,
		extra_param = "",
		param = {
			{
				15,
				0,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[200001042] = {
		description = "「电导空袭」可充能<color=#E78300>2</color>次。「电导空袭」命中瞬间会心率提高<color=#E78300>{1}</color>、会心伤害提高<color=#E78300>{2}</color>。",
		maxLv = 1,
		type = 1,
		id = 200001042,
		extra_param = "",
		param = {
			{
				45,
				0,
				false,
				"%"
			},
			{
				45,
				0,
				false,
				"%"
			}
		}
	},
	[200001043] = {
		description = "「终焉脉冲」会消耗全部能量，每额外消耗<color=#E78300>1</color>点能量，命中瞬间基础伤害提高<color=#E78300>2%</color>。",
		maxLv = 1,
		type = 1,
		id = 200001043,
		extra_param = "",
		param = {}
	},
	[200001044] = {
		description = "「兔兔扫射」对处于破甲状态的敌人命中瞬间基础伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 200001044,
		extra_param = "",
		param = {
			{
				35,
				0,
				false,
				"%"
			}
		}
	},
	[200001045] = {
		description = "<material=underline c=#FFFFFF h=2 event=terminology args=(106601)>「占卜效果」</material>会作用于全队伍。\n队友拥有<material=underline c=#FFFFFF h=2 event=terminology args=(106601)>「占卜效果」</material>时，会心率提高<color=#E78300>17%</color>。",
		maxLv = 1,
		type = 1,
		id = 200001045,
		extra_param = "",
		param = {}
	},
	[200001046] = {
		description = "「兔兔出击」对处于破甲状态的敌人命中瞬间基础伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 200001046,
		extra_param = "",
		param = {
			{
				35,
				0,
				false,
				"%"
			}
		}
	},
	[200001048] = {
		description = "「激流浪涌」会产生第二段攻击，并且范围更大，造成共计<color=#E78300>{1}</color>攻击力的水属性伤害。",
		maxLv = 1,
		type = 1,
		id = 200001048,
		extra_param = "",
		param = {
			{
				3600,
				92.307,
				false,
				"%"
			}
		}
	},
	[200001049] = {
		description = "自身或者队友受击时，获得<color=#E78300>2.5%</color>的奥义值。",
		maxLv = 1,
		type = 1,
		id = 200001049,
		extra_param = "",
		param = {}
	},
	[200001050] = {
		description = "「眠羊游行」每次命中时，后续的命中瞬间基础伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 200001050,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[200001051] = {
		description = "「梦幻泡影」蓄力时每<color=#E78300>0.5</color>至<color=#E78300>1</color>秒会对自身周围区域造成<color=#E78300>{1}</color>攻击力的光属性伤害。",
		maxLv = 1,
		type = 1,
		id = 200001051,
		extra_param = "",
		param = {
			{
				300,
				7.692,
				false,
				"%"
			}
		}
	},
	[200001052] = {
		description = "「阳炎风暴」对处于灼烧状态的敌人命中瞬间基础伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 200001052,
		extra_param = "",
		param = {
			{
				35,
				0,
				false,
				"%"
			}
		}
	},
	[200001053] = {
		description = "「阳炎风暴」的冷却时间缩短<color=#E78300>8</color>秒，并且会对命中的敌人附加灼烧状态，持续<color=#E78300>{2}</color>秒。\n灼烧：每<color=#E78300>3</color>秒附加<color=#E78300>{1}</color>攻击力的火属性伤害，持续<color=#E78300>{2}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 200001053,
		extra_param = "",
		param = {
			{
				360,
				0,
				false,
				"%"
			},
			{
				13,
				0,
				false,
				""
			}
		}
	},
	[200001054] = {
		description = "火属性伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 200001054,
		extra_param = "",
		param = {
			{
				15,
				0,
				false,
				"%"
			}
		}
	},
	[200001055] = {
		description = "「阳炎风暴」命中时对敌人附加火属性抗性降低<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 200001055,
		extra_param = "",
		param = {
			{
				15,
				0,
				false,
				"%"
			},
			{
				13,
				0,
				false,
				""
			}
		}
	},
	[200001056] = {
		description = "每次进入<material=underline c=#FFFFFF h=2 event=terminology args=(104101)>「鸣刃」</material>状态，<material=underline c=#FFFFFF h=2 event=terminology args=(104103)>「谐律」</material>层数改变为<color=#E78300>35</color>层。\n全队伍对处于破甲状态的敌人命中瞬间普通攻击伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 200001056,
		extra_param = "",
		param = {
			{
				15,
				0,
				false,
				"%"
			}
		}
	},
	[200001057] = {
		description = "敌人被「谐律音爆」命中后，受到「谐律音爆」的伤害提高<color=#E78300>{1}</color>，持续<color=#E78300>12</color>秒，最多可叠加<color=#E78300>12</color>层。",
		maxLv = 1,
		type = 1,
		id = 200001057,
		extra_param = "",
		param = {
			{
				12,
				12,
				false,
				"%"
			}
		}
	},
	[200001058] = {
		description = "每次完美判定成功时，获得<color=#E78300>2</color>点神能。",
		maxLv = 1,
		type = 1,
		id = 200001058,
		extra_param = "",
		param = {}
	},
	[200001059] = {
		description = "<material=underline c=#FFFFFF h=2 event=terminology args=(104103)>「谐律」</material>层数不少于<color=#E78300>7</color>层时，攻击力提高<color=#E78300>{1}</color>；<material=underline c=#FFFFFF h=2 event=terminology args=(104103)>「谐律」</material>层数不少于<color=#E78300>14</color>层时，物理属性伤害提高<color=#E78300>{2}</color>；<material=underline c=#FFFFFF h=2 event=terminology args=(104103)>「谐律」</material>层数不少于<color=#E78300>21</color>层时，近战伤害提高<color=#E78300>{3}</color>；<material=underline c=#FFFFFF h=2 event=terminology args=(104103)>「谐律」</material>层数不少于<color=#E78300>28</color>层时，受到的伤害降低<color=#E78300>{4}</color>；<material=underline c=#FFFFFF h=2 event=terminology args=(104103)>「谐律」</material>层数不少于<color=#E78300>35</color>层时，获得霸体效果。",
		maxLv = 1,
		type = 1,
		id = 200001059,
		extra_param = "",
		param = {
			{
				12,
				0,
				false,
				"%"
			},
			{
				15,
				0,
				false,
				"%"
			},
			{
				18,
				0,
				false,
				"%"
			},
			{
				21,
				0,
				false,
				"%"
			}
		}
	},
	[200001060] = {
		description = "施放「虚炎行空」时，技能伤害提高<color=#E78300>200%</color>，持续<color=#E78300>{1}</color>秒，并消耗<color=#E78300>50%</color>当前能量。",
		maxLv = 1,
		type = 1,
		id = 200001060,
		extra_param = "",
		param = {
			{
				6,
				0,
				false,
				""
			}
		}
	},
	[200001061] = {
		description = "「咫尺天威」命中时，自身每有<color=#E78300>1%</color>火属性伤害，自身会心率提高<color=#E78300>0.8%</color>，持续<color=#E78300>5</color>秒。",
		maxLv = 1,
		type = 1,
		id = 200001061,
		extra_param = "",
		param = {}
	},
	[200001062] = {
		description = "会心伤害提高<color=#E78300>{1}</color>；「擎天撼地」命中瞬间会心伤害额外提高<color=#E78300>{2}</color>。",
		maxLv = 1,
		type = 1,
		id = 200001062,
		extra_param = "",
		param = {
			{
				45,
				0,
				false,
				"%"
			},
			{
				45,
				0,
				false,
				"%"
			}
		}
	},
	[200001063] = {
		description = "延长<material=underline c=#FFFFFF h=2 event=terminology args=(101301)>「缚炎」</material>状态时，自身火属性伤害额外提高<color=#E78300>45%</color>，最多可叠加<color=#E78300>2</color>层。\n自身的火属性伤害提高不低于<color=#E78300>150%</color>时，会心率提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 200001063,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			}
		}
	},
	[200001064] = {
		description = "消耗<material=underline c=#FFFFFF h=2 event=terminology args=(105901)>「光矢」</material>时，会心率提高<color=#E78300>{3}</color>、会心伤害提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 200001064,
		extra_param = "",
		param = {
			{
				60,
				60,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				""
			},
			{
				10,
				0,
				false,
				"%"
			}
		}
	},
	[200001065] = {
		description = "「辉光交错」的追加攻击，对处于中心区域的敌人命中瞬间基础伤害改变为<color=#E78300>{1}</color>；「辉光交错」的追加攻击命中时，每拥有<color=#E78300>1</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(105901)>「光矢」</material>标记，命中瞬间会心伤害提高<color=#E78300>{2}</color>。",
		maxLv = 1,
		type = 1,
		id = 200001065,
		extra_param = "",
		param = {
			{
				40,
				0,
				false,
				"%"
			},
			{
				60,
				60,
				false,
				"%"
			}
		}
	},
	[200001066] = {
		description = "怒气越多，「风驰迹掣」追加攻击命中瞬间基础伤害越高，该效果提供的基础伤害提高最高为<color=#E78300>100%</color>。",
		maxLv = 1,
		type = 1,
		id = 200001066,
		extra_param = "",
		param = {}
	},
	[200001067] = {
		description = "队友从<material=underline c=#FFFFFF h=2 event=terminology args=(109602)>「逐风标记」</material>的顺风方位攻击处于<material=underline c=#FFFFFF h=2 event=terminology args=(109602)>「逐风标记」</material>状态的敌人时，命中瞬间伤害提高<color=#E78300>{1}</color>。\n全队伍从<material=underline c=#FFFFFF h=2 event=terminology args=(109602)>「逐风标记」</material>的顺风方位攻击处于<material=underline c=#FFFFFF h=2 event=terminology args=(109602)>「逐风标记」</material>状态的敌人时，命中瞬间会心伤害提高<color=#E78300>{2}</color>。",
		maxLv = 1,
		type = 1,
		id = 200001067,
		extra_param = "",
		param = {
			{
				25,
				0,
				false,
				"%"
			},
			{
				25,
				0,
				false,
				"%"
			}
		}
	},
	[200001068] = {
		description = "施放特殊攻击时，获得短暂的格挡状态，成功格挡伤害时，获得以下效果：\n格挡状态延长<color=#E78300>1</color>秒，雷属性伤害提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒，每次施放最多触发一次。\n施放特殊攻击时也会获得雷属性伤害提高效果。",
		maxLv = 1,
		type = 1,
		id = 200001068,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			}
		}
	},
	[200001069] = {
		description = "反击命中瞬间基础伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 200001069,
		extra_param = "",
		param = {
			{
				25,
				0,
				false,
				"%"
			}
		}
	},
	[200001070] = {
		description = "施放「风雷流转」过程中受击时，若处于<material=underline c=#FFFFFF h=2 event=terminology args=(111902)>「防御姿态」</material>，也会格挡当前的伤害并触发反击。\n反击命中时会对敌人附加雷属性抗性降低<color=#E78300>{1}</color>、风属性抗性降低<color=#E78300>{2}</color>，持续<color=#E78300>{3}</color>秒。\n施放<material=underline c=#FFFFFF h=2 event=terminology args=(111902)>「防御姿态」</material>的「风雷流转」后，嘲讽所有敌人，持续<color=#E78300>{4}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 200001070,
		extra_param = "",
		param = {
			{
				15,
				0,
				false,
				"%"
			},
			{
				15,
				0,
				false,
				"%"
			},
			{
				7,
				0,
				false,
				""
			},
			{
				7,
				0,
				false,
				""
			}
		}
	},
	[200001071] = {
		description = "每拥有<color=#E78300>1</color>个对应姿态的标记，对应姿态的「风雷流转」命中瞬间基础伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 200001071,
		extra_param = "",
		param = {
			{
				20,
				20,
				false,
				"%"
			}
		}
	},
	[200001072] = {
		description = "「破势」命中时会重置「涌动之风」的冷却时间。当自身拥有印记时，「涌动之风」命中时对敌人附加风属性抗性降低<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 200001072,
		extra_param = "",
		param = {
			{
				20,
				0,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[200001073] = {
		description = "「破军」命中时会重置「涌动之风」的冷却时间。当自身拥有印记时，「涌动之风」命中时对敌人附加风属性抗性降低<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 200001073,
		extra_param = "",
		param = {
			{
				20,
				0,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[200001074] = {
		description = "闪避时会对锁定的敌人召唤一根<material=underline c=#FFFFFF h=2 event=terminology args=(101901)>「风神之柱」</material>，造成<color=#E78300>{1}</color>攻击力的风属性伤害；自身触发闪避效果时，会额外再召唤一根<material=underline c=#FFFFFF h=2 event=terminology args=(101901)>「风神之柱」</material>。",
		maxLv = 1,
		type = 1,
		id = 200001074,
		extra_param = "",
		param = {
			{
				250,
				6.41,
				false,
				"%"
			}
		}
	},
	[200001075] = {
		description = "命中瞬间普通攻击伤害提高<color=#E78300>{1}</color>。普通攻击第五段命中时，会触发五道落雷，每道落雷造成<color=#E78300>{2}</color>攻击力的雷属性伤害。",
		maxLv = 1,
		type = 1,
		id = 200001075,
		extra_param = "",
		param = {
			{
				100,
				0,
				false,
				"%"
			},
			{
				250,
				6.41,
				false,
				"%"
			}
		}
	},
	[200001076] = {
		description = "每次进入<material=underline c=#FFFFFF h=2 event=terminology args=(102802)>「狂雷」</material>状态时，会使周围的敌人雷属性抗性降低<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 200001076,
		extra_param = "",
		param = {
			{
				20,
				0,
				false,
				"%"
			},
			{
				7,
				0,
				false,
				""
			}
		}
	},
	[200001077] = {
		description = "在施放「大地的奔雷」、「远海的风雷」、「深空的落雷」后衔接普通攻击，也会从普通攻击第四段开始攻击。普通攻击第五段命中时，自身攻击力提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 200001077,
		extra_param = "",
		param = {
			{
				15,
				0,
				false,
				"%"
			},
			{
				7,
				0,
				false,
				""
			}
		}
	},
	[200001078] = {
		description = "施放「银雪回响」重复施放技能命中时，能量获得率提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 200001078,
		extra_param = "",
		param = {
			{
				40,
				0,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[200001079] = {
		description = "施放「银雪回响」重复施放技能时，攻击力提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 200001079,
		extra_param = "",
		param = {
			{
				40,
				0,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[200001080] = {
		description = "处于消耗<material=underline c=#FFFFFF h=2 event=terminology args=(113902)>「寒封」</material>标记进入的<material=underline c=#FFFFFF h=2 event=terminology args=(113903)>「临渊」</material>状态时，队友冰属性伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 200001080,
		extra_param = "",
		param = {
			{
				25,
				0,
				false,
				"%"
			}
		}
	},
	[200001081] = {
		description = "处于<material=underline c=#FFFFFF h=2 event=terminology args=(113903)>「临渊」</material>状态，会心率提高<color=#E78300>{1}</color>，能量消耗降低<color=#E78300>{2}</color>。",
		maxLv = 1,
		type = 1,
		id = 200001081,
		extra_param = "",
		param = {
			{
				15,
				0,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				"%"
			}
		}
	},
	[200001082] = {
		description = "<material=underline c=#FFFFFF h=2 event=terminology args=(113903)>「临渊」</material>状态的持续时间延长<color=#E78300>3</color>秒。\n处于<material=underline c=#FFFFFF h=2 event=terminology args=(113903)>「临渊」</material>状态时，闪避值消耗降低<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 200001082,
		extra_param = "",
		param = {
			{
				100,
				0,
				false,
				"%"
			}
		}
	},
	[200001083] = {
		description = "施放「盾牌投掷」会改变为盾牌弹射，每次造成<color=#E78300>{1}</color>攻击力的雷属性伤害，最多可弹射<color=#E78300>5</color>次，每次命中会获得<color=#E78300>18</color>点神能。",
		maxLv = 1,
		type = 1,
		id = 200001083,
		extra_param = "",
		param = {
			{
				1000,
				25.641,
				false,
				"%"
			}
		}
	},
	[200001084] = {
		description = "「反制打击」的举盾防御持续时间缩短<color=#E78300>50%</color>；成功格挡的反击命中时额外获得<color=#E78300>15</color>点神能，反击命中瞬间基础伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 200001084,
		extra_param = "",
		param = {
			{
				30,
				0,
				false,
				"%"
			}
		}
	},
	[200001085] = {
		description = "「信念守护」也会给队友施加护盾；队友会根据旧誓·薇儿丹蒂的生命值上限获得护盾值。\n给自身或队友施加护盾时，自身或队友会心率提高<color=#E78300>{1}</color>、会心伤害提高<color=#E78300>{2}</color>，持续<color=#E78300>{3}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 200001085,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			},
			{
				20,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			}
		}
	},
	[200001086] = {
		description = "每次触发「极境光域」的共享效果时，<material=underline c=#FFFFFF h=2 event=terminology args=(103301)>「真理之域」</material>范围内的队友会心率提高<color=#E78300>{1}</color>、会心伤害提高<color=#E78300>{3}</color>，持续<color=#E78300>{2}</color>秒，最多可叠加<color=#E78300>3</color>层。",
		maxLv = 1,
		type = 1,
		id = 200001086,
		extra_param = "",
		param = {
			{
				7,
				7,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				""
			},
			{
				7,
				7,
				false,
				"%"
			}
		}
	},
	[200001087] = {
		description = "每次触发「极境神域」的共享效果时，<material=underline c=#FFFFFF h=2 event=terminology args=(103301)>「真理之域」</material>范围内的队友会心率提高<color=#E78300>{1}</color>、会心伤害提高<color=#E78300>{3}</color>，持续<color=#E78300>{2}</color>秒，最多可叠加<color=#E78300>3</color>层。",
		maxLv = 1,
		type = 1,
		id = 200001087,
		extra_param = "",
		param = {
			{
				7,
				7,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				""
			},
			{
				7,
				7,
				false,
				"%"
			}
		}
	},
	[200001088] = {
		description = "「逆序警诫」的伤害衰减<color=#E78300>{1}</color>，但会额外造成两次攻击；「逆序警诫」的自身伤害提高效果变为可叠加，最多可叠加<color=#E78300>3</color>层。每次自身触发共享，获得<color=#E78300>7%</color>的奥义值，该效果每<color=#E78300>2</color>秒最多触发一次。",
		maxLv = 1,
		type = 1,
		id = 200001088,
		extra_param = "",
		param = {
			{
				50,
				0,
				false,
				"%"
			}
		}
	},
	[200001089] = {
		description = "当<material=underline c=#FFFFFF h=2 event=terminology args=(104202)>「伴舞」</material>状态的琉刻命中的敌人不处于暗属性抗性降低的状态时，对命中的敌人附加暗属性抗性降低<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒。对处于暗属性抗性降低状态的敌人，琉刻命中瞬间伤害提高<color=#E78300>{3}</color>。\n当<material=underline c=#FFFFFF h=2 event=terminology args=(104202)>「伴舞」</material>状态的明塔命中的敌人不处于破甲状态时，对命中的敌人附加破甲状态，防御力降低<color=#E78300>{4}</color>，持续<color=#E78300>{5}</color>秒。对处于破甲状态的敌人，明塔命中瞬间伤害提高<color=#E78300>{3}</color>。\n攻击命中生命值低于<color=#E78300>25%</color>的普通敌人时，会直接击败敌人。",
		maxLv = 1,
		type = 1,
		id = 200001089,
		extra_param = "",
		param = {
			{
				12,
				0,
				false,
				"%"
			},
			{
				6,
				0,
				false,
				""
			},
			{
				24,
				24,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				"%"
			},
			{
				6,
				0,
				false,
				""
			}
		}
	},
	[200001090] = {
		description = "神能不低于<color=#E78300>40</color>点且不高于<color=#E78300>60</color>点时，攻击力提高<color=#E78300>{1}</color>、技能伤害提高<color=#E78300>{2}</color>、独立伤害提高<color=#E78300>{3}</color>。\n出场时，恢复<color=#E78300>40</color>点神能。",
		maxLv = 1,
		type = 1,
		id = 200001090,
		extra_param = "",
		param = {
			{
				24,
				0,
				false,
				"%"
			},
			{
				24,
				0,
				false,
				"%"
			},
			{
				24,
				0,
				false,
				"%"
			}
		}
	},
	[200001091] = {
		description = "切换到操作琉刻时，消耗<color=#E78300>48</color>点神能；切换到操作明塔时，获得<color=#E78300>48</color>点神能。",
		maxLv = 1,
		type = 1,
		id = 200001091,
		extra_param = "",
		param = {}
	},
	[200001092] = {
		description = "施放「狼魂疾突」命中时会对敌人附加<material=underline c=#FFFFFF h=2 event=terminology args=(102402)>「判罚」</material>，每<color=#E78300>2</color>秒会产生一次爆炸对周围造成<color=#E78300>{1}</color>攻击力的暗属性伤害，持续<color=#E78300>10</color>秒，场上被附加<material=underline c=#FFFFFF h=2 event=terminology args=(102402)>「判罚」</material>的敌人最多存在一个。",
		maxLv = 1,
		type = 1,
		id = 200001092,
		extra_param = "",
		param = {
			{
				100,
				2.564,
				false,
				"%"
			}
		}
	},
	[200001093] = {
		description = "「胡狼奔行」、「狼魂疾突」、「狼魂狂舞」的协同攻击每段命中时获得<color=#E78300>5</color>点怒气。\n自身怒气为满时，<material=underline c=#FFFFFF h=2 event=terminology args=(102401)>「狼魂」</material>攻击命中瞬间会心率提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 200001093,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			}
		}
	},
	[200001094] = {
		description = "<material=underline c=#FFFFFF h=2 event=terminology args=(102401)>「狼魂」</material>锁定的敌人被击败时会自动寻找下一个敌人，<material=underline c=#FFFFFF h=2 event=terminology args=(102401)>「狼魂」</material>没有寻找到下一个敌人时才会消失。",
		maxLv = 1,
		type = 1,
		id = 200001094,
		extra_param = "",
		param = {}
	},
	[200001095] = {
		description = "奥义获得率降低<color=#E78300>{1}</color>。<material=underline c=#FFFFFF h=2 event=terminology args=(102401)>「狼魂」</material>的协同攻击命中瞬间暗属性伤害提高<color=#E78300>{2}</color>。\n自身未攻击命中<color=#E78300>6</color>秒后，<material=underline c=#FFFFFF h=2 event=terminology args=(102401)>「狼魂」</material>获得以下效果：攻击命中瞬间攻击力提高<color=#E78300>{3}</color>、会心率提高<color=#E78300>{4}</color>、会心伤害提高<color=#E78300>{5}</color>、技能伤害提高<color=#E78300>{6}</color>；自身攻击命中时，移除该效果。",
		maxLv = 1,
		type = 1,
		id = 200001095,
		extra_param = "",
		param = {
			{
				50,
				0,
				false,
				"%"
			},
			{
				35,
				0,
				false,
				"%"
			},
			{
				50,
				0,
				false,
				"%"
			},
			{
				30,
				0,
				false,
				"%"
			},
			{
				50,
				0,
				false,
				"%"
			},
			{
				50,
				0,
				false,
				"%"
			}
		}
	},
	[200001096] = {
		description = "奥义获得率降低<color=#E78300>{1}</color>。<material=underline c=#FFFFFF h=2 event=terminology args=(102401)>「狼魂」</material>的协同攻击和特殊攻击命中瞬间暗属性伤害提高<color=#E78300>{2}</color>。\n自身未攻击命中<color=#E78300>6</color>秒后，<material=underline c=#FFFFFF h=2 event=terminology args=(102401)>「狼魂」</material>获得以下效果：攻击命中瞬间攻击力提高<color=#E78300>{3}</color>、会心率提高<color=#E78300>{4}</color>、会心伤害提高<color=#E78300>{5}</color>、技能伤害提高<color=#E78300>{6}</color>；自身攻击命中时，移除该效果。",
		maxLv = 1,
		type = 1,
		id = 200001096,
		extra_param = "",
		param = {
			{
				50,
				0,
				false,
				"%"
			},
			{
				35,
				0,
				false,
				"%"
			},
			{
				50,
				0,
				false,
				"%"
			},
			{
				30,
				0,
				false,
				"%"
			},
			{
				50,
				0,
				false,
				"%"
			},
			{
				50,
				0,
				false,
				"%"
			}
		}
	},
	[200001097] = {
		description = "神能上限增加<color=#E78300>20</color>点。\n不处于炮垒形态时，每<color=#E78300>0.15</color>秒额外自动获得<color=#E78300>{1}</color>点神能。",
		maxLv = 1,
		type = 1,
		id = 200001097,
		extra_param = "",
		param = {
			{
				2,
				0,
				false,
				""
			}
		}
	},
	[200001098] = {
		description = "「冥灵爆破」命中时会产生一片「灵能迷雾」，持续<color=#E78300>6</color>秒，造成<color=#E78300>{2}</color>攻击力的暗属性伤害，对命中的敌人附加混乱状态，离开「灵能迷雾」后混乱状态持续<color=#E78300>{1}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 200001098,
		extra_param = "",
		param = {
			{
				1,
				0,
				false,
				""
			},
			{
				7000,
				179.487,
				false,
				"%"
			}
		}
	},
	[200001099] = {
		description = "「噩梦收割」命中「灵能迷雾」时，会产生范围性的爆炸和击飞，造成<color=#E78300>{1}</color>攻击力的暗属性伤害。",
		maxLv = 1,
		type = 1,
		id = 200001099,
		extra_param = "",
		param = {
			{
				7000,
				179.487,
				false,
				"%"
			}
		}
	},
	[200001100] = {
		description = "技能三基础伤害提高<color=#E78300>{1}</color>。\n「归灭裁定」的爆炸和牵引范围提高<color=#E78300>60%</color>。\n「归灭裁定」的炮击命中生命值低于<color=#E78300>25%</color>的普通敌人时，会直接击败敌人。",
		maxLv = 1,
		type = 1,
		id = 200001100,
		extra_param = "",
		param = {
			{
				30,
				0,
				false,
				"%"
			}
		}
	},
	[200001101] = {
		description = "自身击败敌人后，伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 200001101,
		extra_param = "",
		param = {
			{
				50,
				0,
				false,
				"%"
			}
		}
	},
	[200001102] = {
		description = "施放「撼流逐浪」钳住敌人时，最后一段摔向地面的伤害范围半径提高<color=#E78300>50%</color>，被钳制的敌人的生命值越少最后一段命中瞬间基础伤害提高越高，该效果提供的基础伤害提高最高为<color=#E78300>300%</color>。",
		maxLv = 1,
		type = 1,
		id = 200001102,
		extra_param = "",
		param = {}
	},
	[200001103] = {
		description = "怒气达到满值后，每<color=#E78300>1</color>秒消耗<color=#E78300>15</color>点怒气，直至怒气值为<color=#E78300>0</color>点，在此期间施放技能不再消耗怒气。\n「蛮勇追猎」每施放<color=#E78300>2</color>次攻击获得<color=#E78300>2</color>点怒气。",
		maxLv = 1,
		type = 1,
		id = 200001103,
		extra_param = "",
		param = {}
	},
	[200001104] = {
		description = "「爆压碎裂斩」前段会获得短暂的霸体状态，可格挡敌人伤害；成功格挡敌人伤害时，会心率提高<color=#E78300>{1}</color>、会心伤害提高<color=#E78300>{2}</color>，持续<color=#E78300>{3}</color>秒。\n<color=#297DE0>「攻坚战术」</color>的大剑模式每次攻击命中后会获得<color=#E78300>12</color>点神能。",
		maxLv = 1,
		type = 1,
		id = 200001104,
		extra_param = "",
		param = {
			{
				15,
				0,
				false,
				"%"
			},
			{
				35,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			}
		}
	},
	[200001105] = {
		description = "「突击战术」、「攻坚战术」的电锯模式消耗神能时该次攻击的最后一段命中瞬间技能伤害提高，每消耗<color=#E78300>25</color>点神能，命中瞬间技能伤害提高<color=#E78300>{1}</color>，该效果提供的技能伤害提高最高为<color=#E78300>120%</color>。\n「高压回旋斩」命中时，攻击力提高<color=#E78300>{2}</color>，持续<color=#E78300>{3}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 200001105,
		extra_param = "",
		param = {
			{
				20,
				20,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				"%"
			},
			{
				7,
				0,
				false,
				""
			}
		}
	},
	[200001106] = {
		description = "强化的「飓风回旋」形成的「风眼」最后一段被「风箭」命中后产生的气旋会对命中的敌人附加破甲状态，防御力降低<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒，产生的气旋命中时全队伍会心率提高<color=#E78300>{3}</color>，持续<color=#E78300>{4}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 200001106,
		extra_param = "",
		param = {
			{
				15,
				0,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				""
			},
			{
				15,
				0,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[200001107] = {
		description = "施放强化的「风元异变」期间攻击力提高<color=#E78300>{1}</color>；施放结束后，获得<color=#E78300>3</color>个<material=underline c=#FFFFFF h=2 event=terminology args=(106801)>「风铃」</material>标记。",
		maxLv = 1,
		type = 1,
		id = 200001107,
		extra_param = "",
		param = {
			{
				40,
				0,
				false,
				"%"
			}
		}
	},
	[200001108] = {
		description = "自身施放「优势围歼战术」后会附带引导信标，引导信标范围内的敌人受到<material=underline c=#FFFFFF h=2 event=terminology args=(105207)>「雨洪模式」</material>以外的无人机的伤害提高<color=#E78300>{1}</color>，无人机退场时引导信标造成<color=#E78300>{2}</color>（技能三每提升一级<color=#E78300>+{3}</color>）攻击力的物理属性伤害。\n神格「神王的诡计·困斗」被激活时，该神格效果失效。",
		maxLv = 1,
		type = 1,
		id = 200001108,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			},
			{
				2500,
				64.102,
				false,
				"%"
			},
			{
				64.103,
				1.644,
				false,
				"%"
			}
		}
	},
	[200001109] = {
		description = "<material=underline c=#FFFFFF h=2 event=terminology args=(105207)>「雨洪模式」</material>以外的无人机攻击命中瞬间伤害提高<color=#E78300>{1}</color>。\n施放奥义或连携奥义时，全队伍攻击力提高<color=#E78300>{2}</color>，持续<color=#E78300>{3}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 200001109,
		extra_param = "",
		param = {
			{
				40,
				0,
				false,
				"%"
			},
			{
				15,
				0,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[200001110] = {
		description = "施放奥义或连携奥义时，全队伍近战、远程伤害提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒，全队伍受到的伤害降低<color=#E78300>{3}</color>，持续<color=#E78300>{4}</color>秒。\n施放奥义或连携奥义后，全队伍获得<color=#E78300>15%</color>的奥义值。",
		maxLv = 1,
		type = 1,
		id = 200001110,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			},
			{
				7,
				0,
				false,
				""
			},
			{
				30,
				0,
				false,
				"%"
			},
			{
				15,
				0,
				false,
				""
			}
		}
	},
	[200001111] = {
		description = "激活后，「优势围歼战术」呼叫的无人机从<material=underline c=#FFFFFF h=2 event=terminology args=(105204)>「恶风模式」</material>改变为<material=underline c=#FFFFFF h=2 event=terminology args=(105206)>「飓风模式」</material>。\n自身受到队友附加的奥义伤害提高效果时，队友攻击力提高<color=#E78300>{1}</color>、会心率提高<color=#E78300>{2}</color>、会心伤害提高<color=#E78300>{3}</color>、技能基础伤害提高<color=#E78300>{4}</color>，持续<color=#E78300>{5}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 200001111,
		extra_param = "",
		param = {
			{
				30,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				"%"
			},
			{
				50,
				0,
				false,
				"%"
			},
			{
				50,
				0,
				false,
				"%"
			},
			{
				18,
				0,
				false,
				""
			}
		}
	},
	[200001112] = {
		description = "每次施放「神怒·踏鸣」、强化的「神怒·雷织」额外踢击命中时，会心率提高<color=#E78300>{1}</color>，持续<color=#E78300>{3}</color>秒。\n强化的「雷武真拳」最后一段、至少蓄力<color=#E78300>1</color>段的强化的「神怒·千雳」命中后，自身受到的伤害降低<color=#E78300>{5}</color>，持续<color=#E78300>{6}</color>秒，给自身施加生命值上限<color=#E78300>{2}</color>的护盾，持续<color=#E78300>{4}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 200001112,
		extra_param = "",
		param = {
			{
				40,
				0,
				false,
				"%"
			},
			{
				30,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			},
			{
				12,
				0,
				false,
				""
			},
			{
				30,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			}
		}
	},
	[200001113] = {
		description = "强化的「神怒·雷织」连点的额外踢击，每次命中时，对相同敌人命中瞬间基础伤害提高<color=#E78300>{1}</color>，该效果提供的基础伤害提高最高<color=#E78300>135%</color>。",
		maxLv = 1,
		type = 1,
		id = 200001113,
		extra_param = "",
		param = {
			{
				9,
				9,
				false,
				"%"
			}
		}
	},
	[200001114] = {
		description = "「双重散射」会对命中的敌人附加<material=underline c=#FFFFFF h=2 event=terminology args=(103701)>「暗寄生」</material>状态，持续<color=#E78300>{2}</color>秒，处于<material=underline c=#FFFFFF h=2 event=terminology args=(103701)>「暗寄生」</material>状态的敌人受到的伤害提高<color=#E78300>{1}</color>、会心抗性降低<color=#E78300>{3}</color>。",
		maxLv = 1,
		type = 1,
		id = 200001114,
		extra_param = "",
		param = {
			{
				20,
				0,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				""
			},
			{
				10,
				0,
				false,
				"%"
			}
		}
	},
	[200001115] = {
		description = "「双重散射」的前后段攻击命中同一个敌人时，自身根据距离获得的被动加成效果达到最高，持续<color=#E78300>5</color>秒，自身会心伤害提高<color=#E78300>{1}</color>，持续<color=#E78300>{2}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 200001115,
		extra_param = "",
		param = {
			{
				30,
				0,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[200001116] = {
		description = "「破袭之矢」的基础伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 200001116,
		extra_param = "",
		param = {
			{
				30,
				0,
				false,
				"%"
			}
		}
	},
	[200001117] = {
		description = "「幽离冲击」的基础伤害提高<color=#E78300>{1}</color>。",
		maxLv = 1,
		type = 1,
		id = 200001117,
		extra_param = "",
		param = {
			{
				30,
				0,
				false,
				"%"
			}
		}
	},
	[200001118] = {
		description = "「双重散射」的冷却时间缩短<color=#E78300>2</color>秒。\n「破袭之矢」的冷却时间缩短<color=#E78300>7</color>秒。",
		maxLv = 1,
		type = 1,
		id = 200001118,
		extra_param = "",
		param = {}
	},
	[200001119] = {
		description = "「双重散射」的冷却时间缩短<color=#E78300>2</color>秒。\n「幽离冲击」的冷却时间缩短<color=#E78300>7</color>秒。",
		maxLv = 1,
		type = 1,
		id = 200001119,
		extra_param = "",
		param = {}
	},
	[220101101] = {
		description = "当雏心·奥西里斯装备时，获得以下效果。\n获得所有神格的第三层效果。\n技能一基础伤害提高<color=#E78300>{1}%</color>。\n技能三基础伤害提高<color=#E78300>{2}%</color>。",
		maxLv = 0,
		type = 0,
		id = 220101101,
		param = {
			{
				"0",
				"36",
				"24"
			},
			{
				"0",
				"45",
				"30"
			},
			{
				"0",
				"54",
				"36"
			},
			{
				"0",
				"63",
				"42"
			},
			{
				"0",
				"72",
				"48"
			},
			{
				"0",
				"81",
				"54"
			},
			{
				"0",
				"90",
				"60"
			}
		},
		extra_param = {
			"0",
			"36%/45%/54%/63%/72%/81%/90",
			"24%/30%/36%/42%/48%/54%/60"
		}
	},
	[220101301] = {
		description = "当障月·阿修罗装备时，获得以下效果。\n<color=#297DE0><material=underline c=#FFFFFF h=2 event=terminology args=(101301)>「缚炎」</material></color>状态消失后不再强化<color=#297DE0>「虚炎行空」</color>，改变为进入或延长<color=#297DE0><material=underline c=#FFFFFF h=2 event=terminology args=(101301)>「缚炎」</material></color>状态时获得<color=#E78300>1</color>次强化的<color=#297DE0>「虚炎行空」</color>，可通过长按普通攻击施放该强化技能，强化的次数可以累积。把释放的火焰地涌转为对目标的小范围攻击，造成共计<color=#E78300>{2}%</color>攻击力的火属性伤害，获得<color=#E78300>12</color>点能量，对命中的敌人附加火属性抗性降低<color=#E78300>{3}%</color>，持续<color=#E78300>{4}</color>秒。\n<color=#297DE0><material=underline c=#FFFFFF h=2 event=terminology args=(101301)>「缚炎」</material></color>状态期间普通攻击每命中<color=#E78300>1</color>次，<color=#297DE0>「虚炎行空」</color>命中瞬间伤害提高<color=#E78300>{1}%</color>；每次<color=#297DE0><material=underline c=#FFFFFF h=2 event=terminology args=(101301)>「缚炎」</material></color>状态结束时移除该伤害提高效果。\n<color=#297DE0>「擎天撼地」</color>的冷却时间缩短<color=#E78300>{5}</color>秒。",
		maxLv = 0,
		type = 0,
		id = 220101301,
		param = {
			{
				"0",
				"2.4",
				"660",
				"12",
				"8",
				"1.2"
			},
			{
				"0",
				"3",
				"660",
				"15",
				"8",
				"1.5"
			},
			{
				"0",
				"3.6",
				"660",
				"18",
				"8",
				"1.8"
			},
			{
				"0",
				"4.2",
				"660",
				"21",
				"8",
				"2.1"
			},
			{
				"0",
				"4.8",
				"660",
				"24",
				"8",
				"2.4"
			},
			{
				"0",
				"5.4",
				"660",
				"27",
				"8",
				"2.7"
			},
			{
				"0",
				"6",
				"660",
				"30",
				"8",
				"3"
			}
		},
		extra_param = {
			"0",
			"2.4%/3%/3.6%/4.2%/4.8%/5.4%/6",
			"660",
			"12%/15%/18%/21%/24%/27%/30",
			"8",
			"1.2/1.5/1.8/2.1/2.4/2.7/3"
		}
	},
	[220101601] = {
		description = "当荒獠·金固装备时，获得以下效果。\n<color=#297DE0>「突击战术」</color>的电锯模式可以打断<color=#297DE0>「高压回旋斩」</color>的举剑动作并直接使用荒獠切割敌人。\n施放<color=#297DE0>「突击战术」</color>的电锯模式时，获得霸体效果；命中时，物理属性伤害提高<color=#E78300>{1}%</color>，持续<color=#E78300>{2}</color>秒。\n处于修正模式时，施放<color=#297DE0>「突击战术」</color>、<color=#297DE0>「攻坚战术」</color>的电锯模式时每消耗<color=#E78300>25</color>点神能该技能技能伤害提高<color=#E78300>10%</color>。\n<color=#297DE0>「攻坚战术」</color>的大剑模式会对命中的敌人附加物理属性抗性降低<color=#E78300>{3}%</color>，持续<color=#E78300>{4}</color>秒。",
		maxLv = 0,
		type = 0,
		id = 220101601,
		param = {
			{
				"0",
				"12",
				"12",
				"10",
				"7"
			},
			{
				"0",
				"15",
				"12",
				"10",
				"7"
			},
			{
				"0",
				"18",
				"12",
				"10",
				"7"
			},
			{
				"0",
				"21",
				"12",
				"10",
				"7"
			},
			{
				"0",
				"24",
				"12",
				"10",
				"7"
			},
			{
				"0",
				"27",
				"12",
				"10",
				"7"
			},
			{
				"0",
				"30",
				"12",
				"10",
				"7"
			}
		},
		extra_param = {
			"0",
			"12%/15%/18%/21%/24%/27%/30",
			"12",
			"10",
			"7"
		}
	},
	[220101901] = {
		description = "当疾风之枪·休装备时，获得以下效果。\n技能三<color=#297DE0>「破势」</color>改变为<color=#297DE0>「破军」</color>。\n对前方目标造成大范围突刺伤害。<color=#297DE0>「破军」</color>命中瞬间会心率提高<color=#E78300>{1}%</color>、会心伤害提高<color=#E78300>{2}%</color>。\n<color=#297DE0>「破军」</color>命中时，全队伍风属性伤害提高<color=#E78300>{3}%</color>，持续<color=#E78300>{4}</color>秒。",
		maxLv = 0,
		type = 0,
		id = 220101901,
		param = {
			{
				"0",
				"32",
				"32",
				"15",
				"10"
			},
			{
				"0",
				"40",
				"40",
				"15",
				"10"
			},
			{
				"0",
				"48",
				"48",
				"15",
				"10"
			},
			{
				"0",
				"56",
				"56",
				"15",
				"10"
			},
			{
				"0",
				"64",
				"64",
				"15",
				"10"
			},
			{
				"0",
				"72",
				"72",
				"15",
				"10"
			},
			{
				"0",
				"80",
				"80",
				"15",
				"10"
			}
		},
		extra_param = {
			"0",
			"32%/40%/48%/56%/64%/72%/80",
			"32%/40%/48%/56%/64%/72%/80",
			"15",
			"10"
		}
	},
	[220102401] = {
		description = "当胡狼·阿努比斯装备时，获得以下效果。\n<color=#297DE0><material=underline c=#FFFFFF h=2 event=terminology args=(102401)>「狼魂」</material></color>自动攻击时，有<color=#E78300>50%</color>的概率施放特殊攻击，特殊攻击有三段分别造成共计<color=#E78300>{1}%、{6}%</color>（技能三每提升一级<color=#E78300>+{7}%</color>）<color=#E78300>、{8}%</color>（技能二每提升一级<color=#E78300>+{9}%</color>）攻击力的暗属性伤害，并对命中的敌人附加眩晕状态，持续<color=#E78300>{2}</color>秒。\n施放<color=#297DE0>「狼魂疾突」</color>时，<color=#297DE0><material=underline c=#FFFFFF h=2 event=terminology args=(102401)>「狼魂」</material></color>的协同攻击会附带额外爆炸效果，对小范围敌人造成共计<color=#E78300>{3}%</color>（技能一每提升一级<color=#E78300>+{4}%</color>）攻击力的暗属性伤害。\n施放<color=#297DE0>「狼魂狂舞」</color>时，<color=#297DE0><material=underline c=#FFFFFF h=2 event=terminology args=(102401)>「狼魂」</material></color>的协同攻击会改变为特殊攻击。\n施放<color=#297DE0>「狼魂凝视」</color>或<color=#297DE0>「狼魂狂斩」</color>时，<color=#297DE0><material=underline c=#FFFFFF h=2 event=terminology args=(102401)>「狼魂」</material></color>会根据其与其锁定的敌人的距离，选择施放协同攻击或特殊攻击。\n<color=#297DE0><material=underline c=#FFFFFF h=2 event=terminology args=(102401)>「狼魂」</material></color>攻击命中瞬间伤害提高<color=#E78300>{5}%</color>。\n会心率提高<color=#E78300>{10}%</color>。",
		maxLv = 0,
		type = 0,
		id = 220102401,
		param = {
			{
				"0",
				"1200",
				"4",
				"600",
				"15.4",
				"28",
				"600",
				"15.4",
				"600",
				"15.4",
				"10"
			},
			{
				"0",
				"1200",
				"4",
				"600",
				"15.4",
				"35",
				"600",
				"15.4",
				"600",
				"15.4",
				"10"
			},
			{
				"0",
				"1200",
				"4",
				"600",
				"15.4",
				"42",
				"600",
				"15.4",
				"600",
				"15.4",
				"10"
			},
			{
				"0",
				"1200",
				"4",
				"600",
				"15.4",
				"49",
				"600",
				"15.4",
				"600",
				"15.4",
				"10"
			},
			{
				"0",
				"1200",
				"4",
				"600",
				"15.4",
				"56",
				"600",
				"15.4",
				"600",
				"15.4",
				"10"
			},
			{
				"0",
				"1200",
				"4",
				"600",
				"15.4",
				"63",
				"600",
				"15.4",
				"600",
				"15.4",
				"10"
			},
			{
				"0",
				"1200",
				"4",
				"600",
				"15.4",
				"70",
				"600",
				"15.4",
				"600",
				"15.4",
				"10"
			}
		},
		extra_param = {
			"0",
			"1200",
			"4",
			"600",
			"15.4",
			"28%/35%/42%/49%/56%/63%/70",
			"600",
			"15.4",
			"600",
			"15.4",
			"10"
		}
	},
	[220102701] = {
		description = "当低吹雪·利维坦装备时，获得以下效果。\n闪避<color=#297DE0>「凌雪折光」</color>改变为<color=#297DE0>「暴风反击」</color>。\n触发闪避效果后或在闪避效果未处于冷却状态时受身成功后<color=#E78300>3</color>秒内，点击普通攻击会使用重锚施放技能攻击，造成共计<color=#E78300>{3}%</color>攻击力的冰属性伤害，对命中的敌人附加冰冻状态，持续<color=#E78300>{2}</color>秒。\n受身时也可以获得闪避效果，并且不会使闪避效果进入冷却状态。\n<color=#297DE0>「暴风反击」</color>命中瞬间伤害提高<color=#E78300>{1}%</color>。\n闪避必定触发闪避效果，并且闪避效果改变为持续<color=#E78300>{4}</color>秒。",
		maxLv = 0,
		type = 0,
		id = 220102701,
		param = {
			{
				"0",
				"40",
				"2",
				"850",
				"6"
			},
			{
				"0",
				"50",
				"2.2",
				"850",
				"6"
			},
			{
				"0",
				"60",
				"2.5",
				"850",
				"6"
			},
			{
				"0",
				"70",
				"2.8",
				"850",
				"6"
			},
			{
				"0",
				"80",
				"3",
				"850",
				"6"
			},
			{
				"0",
				"90",
				"3.2",
				"850",
				"6"
			},
			{
				"0",
				"100",
				"3.5",
				"850",
				"6"
			}
		},
		extra_param = {
			"0",
			"40%/50%/60%/70%/80%/90%/100",
			"2/2.2/2.5/2.8/3/3.2/3.5",
			"850",
			"6"
		}
	},
	[220102801] = {
		description = "当轰雷·托尔装备时，获得以下效果。\n处于<color=#297DE0><material=underline c=#FFFFFF h=2 event=terminology args=(102802)>「狂雷」</material></color>状态时，每次施放技能命中时都会产生一次落雷，对敌人造成<color=#E78300>{1}%</color>攻击力的雷属性伤害。使用<color=#297DE0>「妙尔尼尔」</color>每次施放非衍生技能命中时、使用<color=#297DE0>「雅恩格利佩尔」</color>每次施放最后一拳以外的技能攻击命中时，自身伤害提高<color=#E78300>{2}%</color>，持续<color=#E78300>{3}</color>秒，最多可叠加<color=#E78300>3</color>层。\n<color=#297DE0><material=underline c=#FFFFFF h=2 event=terminology args=(102803)>「怒雷」</material></color>状态施放最后一拳时，该技能命中瞬间攻击力提高<color=#E78300>{5}%</color>。\n施放<color=#297DE0>「落雷击」</color>命中时，每拥有<color=#E78300>1</color>层层数，<color=#297DE0>「落雷击」</color>独立伤害提高<color=#E78300>{4}%</color>，当拥有<color=#E78300>3</color>层层数时会视为拥有<color=#E78300>4</color>层层数；<color=#297DE0>「落雷击」</color>结束后移除所有层数。",
		maxLv = 0,
		type = 0,
		id = 220102801,
		param = {
			{
				"0",
				"500",
				"10",
				"7",
				"12",
				"48"
			},
			{
				"0",
				"500",
				"10",
				"7",
				"15",
				"60"
			},
			{
				"0",
				"500",
				"10",
				"7",
				"18",
				"72"
			},
			{
				"0",
				"500",
				"10",
				"7",
				"21",
				"84"
			},
			{
				"0",
				"500",
				"10",
				"7",
				"24",
				"96"
			},
			{
				"0",
				"500",
				"10",
				"7",
				"27",
				"108"
			},
			{
				"0",
				"500",
				"10",
				"7",
				"30",
				"120"
			}
		},
		extra_param = {
			"0",
			"500",
			"10",
			"7",
			"12%/15%/18%/21%/24%/27%/30",
			"48%/60%/72%/84%/96%/108%/120"
		}
	},
	[220103201] = {
		description = "当熯天·提尔装备时，获得以下效果。\n普通攻击<color=#297DE0>「王棋闪击」</color>改变为<color=#297DE0>「王棋进军」</color>。\n印记上限增加<color=#E78300>1</color>个；直接施放<color=#297DE0>「落兵升变」</color>时，额外获得<color=#E78300>1</color>个印记。\n巨剑类型是<color=#297DE0>「巨剑·皇后」</color>时，独立伤害提高<color=#E78300>{1}%</color>，改变普通攻击的攻击模式。",
		maxLv = 0,
		type = 0,
		id = 220103201,
		param = {
			{
				"0",
				"32",
				"471"
			},
			{
				"0",
				"40",
				"471"
			},
			{
				"0",
				"48",
				"471"
			},
			{
				"0",
				"56",
				"471"
			},
			{
				"0",
				"64",
				"471"
			},
			{
				"0",
				"72",
				"471"
			},
			{
				"0",
				"80",
				"471"
			}
		},
		extra_param = {
			"0",
			"32%/40%/48%/56%/64%/72%/80",
			"471"
		}
	},
	[220103301] = {
		description = "当启明·海姆达尔装备时，获得以下效果。\n技能三基础伤害提高<color=#E78300>{3}%</color>。\n技能三<color=#297DE0>「极境光域」</color>改变为<color=#297DE0>「极境神域」</color>。\n<color=#297DE0>「极境神域」</color>生成的<color=#297DE0><material=underline c=#FFFFFF h=2 event=terminology args=(103301)>「真理之域」</material></color>持续时间延长<color=#E78300>2</color>秒、覆盖范围半径提高<color=#E78300>25%</color>。\n施放<color=#297DE0>「极境神域」</color>时全队伍全属性伤害提高<color=#E78300>{4}%</color>，持续<color=#E78300>{5}</color>秒。\n施放<color=#297DE0>「极境神域」</color>后全队伍获得<color=#E78300>10%</color>的奥义值。\n最后一次生成的<color=#297DE0><material=underline c=#FFFFFF h=2 event=terminology args=(103301)>「真理之域」</material></color>范围内的队友每<color=#E78300>2</color>秒技能伤害提高<color=#E78300>{1}%</color>，持续<color=#E78300>{2}</color>秒，最多可叠加<color=#E78300>5</color>层。",
		maxLv = 0,
		type = 0,
		id = 220103301,
		param = {
			{
				"0",
				"8",
				"5",
				"20",
				"10",
				"13"
			},
			{
				"0",
				"10",
				"5",
				"25",
				"12.5",
				"13"
			},
			{
				"0",
				"12",
				"5",
				"30",
				"15",
				"13"
			},
			{
				"0",
				"14",
				"5",
				"35",
				"17.5",
				"13"
			},
			{
				"0",
				"16",
				"5",
				"40",
				"20",
				"13"
			},
			{
				"0",
				"18",
				"5",
				"45",
				"22.5",
				"13"
			},
			{
				"0",
				"20",
				"5",
				"50",
				"25",
				"13"
			}
		},
		extra_param = {
			"0",
			"8%/10%/12%/14%/16%/18%/20",
			"5",
			"20%/25%/30%/35%/40%/45%/50",
			"10%/12.5%/15%/17.5%/20%/22.5%/25",
			"13"
		}
	},
	[220103501] = {
		description = "当狂鳄·索贝克装备时，获得以下效果。\n技能二基础伤害提高<color=#E78300>{3}%</color>。\n<color=#297DE0>「圣河咆哮」</color>对附近敌人的攻击频率提高。\n攻击命中时，对命中的敌人附加水属性抗性降低<color=#E78300>{1}%</color>，持续<color=#E78300>{2}</color>秒。\n<color=#297DE0>「撼流逐浪」</color>将敌人摔向地面命中时，自身伤害提高<color=#E78300>{4}%</color>，持续<color=#E78300>{5}</color>秒；当敌人无法被抓取的<color=#297DE0>「撼流逐浪」</color>后段攻击命中时，自身恢复<color=#E78300>15%</color>的奥义值。",
		maxLv = 0,
		type = 0,
		id = 220103501,
		param = {
			{
				"0",
				"12",
				"6",
				"12",
				"30",
				"15"
			},
			{
				"0",
				"15",
				"6",
				"15",
				"30",
				"15"
			},
			{
				"0",
				"18",
				"6",
				"18",
				"30",
				"15"
			},
			{
				"0",
				"21",
				"6",
				"21",
				"30",
				"15"
			},
			{
				"0",
				"24",
				"6",
				"24",
				"30",
				"15"
			},
			{
				"0",
				"27",
				"6",
				"27",
				"30",
				"15"
			},
			{
				"0",
				"30",
				"6",
				"30",
				"30",
				"15"
			}
		},
		extra_param = {
			"0",
			"12%/15%/18%/21%/24%/27%/30",
			"6",
			"12%/15%/18%/21%/24%/27%/30",
			"30",
			"15"
		}
	},
	[220103701] = {
		description = "当夜之寄生·霍德尔装备时，获得以下效果。\n技能三<color=#297DE0>「破袭之矢」</color>改变为<color=#297DE0>「幽离冲击」</color>。\n被动效果提供的伤害提高上限提高<color=#E78300>{1}%</color>；根据距离获得的被动加成效果达到最高。\n施放技能后，技能的冷却时间缩短<color=#E78300>1</color>秒，该效果提供的冷却时间缩短最高为<color=#E78300>3</color>秒。\n普通攻击每次命中后，会获得<color=#E78300>3</color>点怒气；<color=#297DE0>「幽离冲击」</color>的怒气消耗降低<color=#E78300>40%</color>。\n施放<color=#297DE0>「瞬影幽光」、「双重散射」</color>后，对应技能的怒气消耗降低<color=#E78300>{2}%</color>，该效果提供的怒气消耗降低最高为<color=#E78300>100%</color>。",
		maxLv = 0,
		type = 0,
		id = 220103701,
		param = {
			{
				"0",
				"12",
				"8"
			},
			{
				"0",
				"15",
				"10"
			},
			{
				"0",
				"18",
				"12"
			},
			{
				"0",
				"21",
				"14"
			},
			{
				"0",
				"24",
				"16"
			},
			{
				"0",
				"27",
				"18"
			},
			{
				"0",
				"30",
				"20"
			}
		},
		extra_param = {
			"0",
			"12%/15%/18%/21%/24%/27%/30",
			"8%/10%/12%/14%/16%/18%/20"
		}
	},
	[220103801] = {
		description = "当羽灼·赫拉装备时，获得以下效果。\n技能三基础伤害提高<color=#E78300>{2}%</color>。\n技能二<color=#297DE0>「炽拥」</color>改变为<color=#297DE0>「灼舞」</color>。\n<color=#297DE0>「灼舞」</color>对处于灼烧状态的敌人命中瞬间基础伤害提高<color=#E78300>{1}%</color>。",
		maxLv = 0,
		type = 0,
		id = 220103801,
		param = {
			{
				"0",
				"28",
				"20"
			},
			{
				"0",
				"35",
				"25"
			},
			{
				"0",
				"42",
				"30"
			},
			{
				"0",
				"49",
				"35"
			},
			{
				"0",
				"56",
				"40"
			},
			{
				"0",
				"63",
				"45"
			},
			{
				"0",
				"70",
				"50"
			}
		},
		extra_param = {
			"0",
			"28%/35%/42%/49%/56%/63%/70",
			"20%/25%/30%/35%/40%/45%/50"
		}
	},
	[220103901] = {
		description = "当潮音·波塞冬装备时，获得以下效果。\n技能一<color=#297DE0>「海之恩泽」</color>改变为<color=#297DE0>「苍澜鲸歌」</color>。\n治疗效果提高<color=#E78300>{3}%</color>。\n出场时，自身每有<color=#E78300>1%</color>治疗效果提高，技能伤害提高<color=#E78300>1%</color>，该效果提供的技能伤害提高最高为<color=#E78300>30%</color>。\n施放<color=#297DE0>「苍澜鲸歌」</color>治疗自身或者队友时，自身或者队友对应的机制值获得率提高<color=#E78300>{1}%</color>，持续<color=#E78300>{2}</color>秒，并获得对应机制值（<color=#E78300>30</color>点怒气、<color=#E78300>30</color>点能量、<color=#E78300>1</color>个印记、<color=#E78300>30</color>点神能）。",
		maxLv = 0,
		type = 0,
		id = 220103901,
		param = {
			{
				"0",
				"12",
				"10",
				"10"
			},
			{
				"0",
				"15",
				"10",
				"10"
			},
			{
				"0",
				"18",
				"10",
				"10"
			},
			{
				"0",
				"21",
				"10",
				"10"
			},
			{
				"0",
				"24",
				"10",
				"10"
			},
			{
				"0",
				"27",
				"10",
				"10"
			},
			{
				"0",
				"30",
				"10",
				"10"
			}
		},
		extra_param = {
			"0",
			"12%/15%/18%/21%/24%/27%/30",
			"10",
			"10"
		}
	},
	[220104101] = {
		description = "当铃兰之弦·雅典娜装备时，获得以下效果。\n<color=#297DE0>「谐律音爆」</color>命中瞬间独立伤害提高<color=#E78300>{2}%</color>。\n处于<color=#297DE0><material=underline c=#FFFFFF h=2 event=terminology args=(104101)>「鸣刃」</material></color>状态时，神能消耗改变为每<color=#E78300>0.{3}</color>秒消耗<color=#E78300>3</color>点神能。<color=#297DE0><material=underline c=#FFFFFF h=2 event=terminology args=(104101)>「鸣刃」</material></color>状态期间，每段普通攻击判定成功并命中<color=#E78300>5</color>次后，进入<color=#297DE0><material=underline c=#FFFFFF h=2 event=terminology args=(104104)>「完美谐律」</material></color>状态，持续<color=#E78300>{1}</color>秒。\n<color=#297DE0><material=underline c=#FFFFFF h=2 event=terminology args=(104104)>「完美谐律」</material></color>：状态期间内获得硬直效果，不会开启<color=#297DE0><material=underline c=#FFFFFF h=2 event=terminology args=(104102)>「谐律判定」</material></color>但每段普通攻击或每次施放技能都视为判定成功或完美判定成功，并且<color=#297DE0><material=underline c=#FFFFFF h=2 event=terminology args=(104103)>「谐律」</material></color>层数都视为<color=#E78300>3、5、7</color>的倍数，判定成功或完美判定成功时额外获得<color=#E78300>1</color>层<color=#297DE0><material=underline c=#FFFFFF h=2 event=terminology args=(104103)>「谐律」</material></color>。\n处于<color=#297DE0><material=underline c=#FFFFFF h=2 event=terminology args=(104101)>「鸣刃」</material></color>状态施放奥义或连携奥义时，<color=#297DE0><material=underline c=#FFFFFF h=2 event=terminology args=(104103)>「谐律」</material></color>层数会保留<color=#E78300>{4}%</color>。\n完美判定的判定区间增加。",
		maxLv = 0,
		type = 0,
		id = 220104101,
		param = {
			{
				"0",
				"7",
				"12",
				"50",
				"40"
			},
			{
				"0",
				"7",
				"15",
				"55",
				"50"
			},
			{
				"0",
				"7",
				"18",
				"60",
				"60"
			},
			{
				"0",
				"7",
				"21",
				"65",
				"70"
			},
			{
				"0",
				"7",
				"24",
				"70",
				"80"
			},
			{
				"0",
				"7",
				"27",
				"75",
				"90"
			},
			{
				"0",
				"7",
				"30",
				"80",
				"100"
			}
		},
		extra_param = {
			"0",
			"7",
			"12%/15%/18%/21%/24%/27%/30",
			"50/55/60/65/70/75/80",
			"40%/50%/60%/70%/80%/90%/100"
		}
	},
	[220104201] = {
		description = "当操偶师·哈迪斯装备时，获得以下效果。\n处于<color=#297DE0><material=underline c=#FFFFFF h=2 event=terminology args=(104203)>「共舞」</material></color>状态时的固定伤害改变为<color=#E78300>{2}</color>。\n处于<color=#297DE0><material=underline c=#FFFFFF h=2 event=terminology args=(104203)>「共舞」</material></color>状态时，琉刻和明塔在进行协同攻击时会在敌人的位置上形成三个由大量冥丝聚集形成的锋利圆环，造成共计<color=#E78300>{1}%</color>攻击力的暗属性伤害。\n处于<color=#297DE0><material=underline c=#FFFFFF h=2 event=terminology args=(104203)>「共舞」</material></color>状态时，获得霸体效果、受到的伤害降低<color=#E78300>{3}%</color>。\n获得<color=#297DE0><material=underline c=#FFFFFF h=2 event=terminology args=(104201)>「冥息」</material></color>标记的间隔时间缩短<color=#E78300>1</color>秒。\n拥有<color=#297DE0><material=underline c=#FFFFFF h=2 event=terminology args=(104201)>「冥息」</material></color>标记时，自身根据标记数量获得的会心率、会心伤害提高的效果视为<color=#E78300>4</color>层。",
		maxLv = 0,
		type = 0,
		id = 220104201,
		param = {
			{
				"0",
				"1200",
				"8000",
				"99"
			},
			{
				"0",
				"1200",
				"10000",
				"99"
			},
			{
				"0",
				"1200",
				"12000",
				"99"
			},
			{
				"0",
				"1200",
				"14000",
				"99"
			},
			{
				"0",
				"1200",
				"16000",
				"99"
			},
			{
				"0",
				"1200",
				"18000",
				"99"
			},
			{
				"0",
				"1200",
				"20000",
				"99"
			}
		},
		extra_param = {
			"0",
			"1200",
			"8000/10000/12000/14000/16000/18000/20000",
			"99"
		}
	},
	[220104802] = {
		description = "当彗光·前鬼坊天狗装备时，获得以下效果。\n技能二、三基础伤害提高<color=#E78300>{2}%</color>。\n技能一<color=#297DE0>「定点打击」</color>改变为<color=#297DE0>「多轮轰炸」</color>。\n<color=#297DE0>「多轮轰炸」</color>的轰炸次数增加，后续轰炸对同一个敌人伤害衰减<color=#E78300>{1}%</color>。",
		maxLv = 0,
		type = 0,
		id = 220104802,
		param = {
			{
				"0",
				"49",
				"8"
			},
			{
				"0",
				"41",
				"10"
			},
			{
				"0",
				"33",
				"12"
			},
			{
				"0",
				"25",
				"14"
			},
			{
				"0",
				"17",
				"16"
			},
			{
				"0",
				"9",
				"18"
			},
			{
				"0",
				"1",
				"20"
			}
		},
		extra_param = {
			"0",
			"49%/41%/33%/25%/17%/9%/1",
			"8%/10%/12%/14%/16%/18%/20"
		}
	},
	[220105001] = {
		description = "当真红·丰前坊天狗装备时，获得以下效果。\n技能二<color=#297DE0>「绯·云水」</color>改变为<color=#297DE0>「绯·苍星」</color>。\n十字刀光飞行一段距离，命中时会额外获得<color=#E78300>1</color>个印记，并对命中的敌人附加破甲状态，防御力降低<color=#E78300>{1}%</color>，持续<color=#E78300>6</color>秒。",
		maxLv = 0,
		type = 0,
		id = 220105001,
		param = {
			{
				"0",
				"20"
			},
			{
				"0",
				"25"
			},
			{
				"0",
				"30"
			},
			{
				"0",
				"35"
			},
			{
				"0",
				"40"
			},
			{
				"0",
				"45"
			},
			{
				"0",
				"50"
			}
		},
		extra_param = {
			"0",
			"20%/25%/30%/35%/40%/45%/50"
		}
	},
	[220105201] = {
		description = "当怒蛇·马尔杜克装备时，获得以下效果。\n当队友施放技能或奥义时，会随机呼叫自身<color=#297DE0>「快速反应战术」</color>或<color=#297DE0>「优势围歼战术」</color>相对应的无人机，造成对应的物理属性伤害，全队伍额外攻击力提高<color=#E78300>{1}</color>，持续<color=#E78300>18</color>秒，该效果所提供的额外攻击力最高为<color=#E78300>{2}</color>；每个队友呼叫的两种无人机分别有<color=#E78300>{3}</color>秒的冷却时间。\n<color=#297DE0><material=underline c=#FFFFFF h=2 event=terminology args=(105203)>「凶风模式」</material></color>：队友呼叫该模式无人机时能量消耗降低<color=#E78300>{5}%</color>，持续<color=#E78300>{4}</color>秒；全队伍技能二基础伤害提高<color=#E78300>{6}%</color>，持续<color=#E78300>{4}</color>秒。\n<color=#297DE0><material=underline c=#FFFFFF h=2 event=terminology args=(105204)>「恶风模式」</material></color>：队友呼叫该模式无人机时能量获得率提高<color=#E78300>{7}%</color>，持续<color=#E78300>{4}</color>秒；全队伍技能三基础伤害提高<color=#E78300>{8}%</color>，持续<color=#E78300>{4}</color>秒。\n<color=#297DE0><material=underline c=#FFFFFF h=2 event=terminology args=(105205)>「旋风模式」</material></color>：队友呼叫该模式无人机时，根据其队友的属性种类，分别对敌人附加对应属性抗性降低<color=#E78300>{9}%</color>的效果，持续<color=#E78300>{4}</color>秒，该效果可以与自身呼叫的<color=#297DE0><material=underline c=#FFFFFF h=2 event=terminology args=(105205)>「旋风模式」</material></color>无人机的属性抗性降低效果叠加。\n<color=#297DE0><material=underline c=#FFFFFF h=2 event=terminology args=(105206)>「飓风模式」</material></color>：队友呼叫该模式无人机时，全队伍会心率提高<color=#E78300>{10}%</color>，持续<color=#E78300>{4}</color>秒，最多可叠加<color=#E78300>2</color>层。",
		maxLv = 0,
		type = 0,
		id = 220105201,
		param = {
			{
				"0",
				"180",
				"1080",
				"20",
				"12",
				"10",
				"10",
				"10",
				"10",
				"10",
				"5"
			},
			{
				"0",
				"180",
				"1260",
				"19",
				"12",
				"10",
				"10",
				"10",
				"10",
				"10",
				"5"
			},
			{
				"0",
				"180",
				"1440",
				"18",
				"12",
				"10",
				"10",
				"10",
				"10",
				"10",
				"5"
			},
			{
				"0",
				"180",
				"1620",
				"17",
				"12",
				"10",
				"10",
				"10",
				"10",
				"10",
				"5"
			},
			{
				"0",
				"180",
				"1800",
				"16",
				"12",
				"10",
				"10",
				"10",
				"10",
				"10",
				"5"
			},
			{
				"0",
				"180",
				"1980",
				"15",
				"12",
				"10",
				"10",
				"10",
				"10",
				"10",
				"5"
			},
			{
				"0",
				"180",
				"2160",
				"14",
				"12",
				"10",
				"10",
				"10",
				"10",
				"10",
				"5"
			}
		},
		extra_param = {
			"0",
			"180",
			"1080/1260/1440/1620/1800/1980/2160",
			"20/19/18/17/16/15/14",
			"12",
			"10",
			"10",
			"10",
			"10",
			"10",
			"5"
		}
	},
	[220105601] = {
		description = "当雷獠·伽梨装备时，获得以下效果。\n技能一、二、三基础伤害提高<color=#E78300>{3}%</color>。\n出场时、自身触发闪避效果时、进入修正模式时，获得一次强化效果。\n每次施放强化效果时，攻击力提高<color=#E78300>{1}%</color>，持续<color=#E78300>{2}</color>秒，最多可叠加<color=#E78300>4</color>层。\n强化的<color=#297DE0>「神怒·雷织」</color>连点进行额外踢击时、强化的<color=#297DE0>「神怒·千雳」</color>蓄力时，闪避不会打断踢击和蓄力，之后点击技能会继续踢击和蓄力。",
		maxLv = 0,
		type = 0,
		id = 220105601,
		param = {
			{
				"0",
				"4",
				"10",
				"12"
			},
			{
				"0",
				"5",
				"10",
				"12"
			},
			{
				"0",
				"6",
				"10",
				"12"
			},
			{
				"0",
				"7",
				"10",
				"12"
			},
			{
				"0",
				"8",
				"10",
				"12"
			},
			{
				"0",
				"9",
				"10",
				"12"
			},
			{
				"0",
				"10",
				"10",
				"12"
			}
		},
		extra_param = {
			"0",
			"4%/5%/6%/7%/8%/9%/10",
			"10",
			"12"
		}
	},
	[220105801] = {
		description = "当龙切·迦具土装备时，获得以下效果。\n受击时，攻击力提高<color=#E78300>{1}%</color>，持续<color=#E78300>{2}</color>秒，最多可叠加<color=#E78300>3</color>层。\n施放<color=#297DE0>「绯狱舞炎·改」</color>时会施放焰浪，对沿途的敌人造成<color=#E78300>{3}%</color>攻击力的火属性伤害；<color=#297DE0>「绯狱舞炎·改」</color>命中多个敌人时会额外获得能量。\n焰浪命中瞬间伤害提高<color=#E78300>{4}%</color>。",
		maxLv = 0,
		type = 0,
		id = 220105801,
		param = {
			{
				"0",
				"12",
				"7",
				"600",
				"24"
			},
			{
				"0",
				"15",
				"7",
				"600",
				"30"
			},
			{
				"0",
				"18",
				"7",
				"600",
				"36"
			},
			{
				"0",
				"21",
				"7",
				"600",
				"42"
			},
			{
				"0",
				"24",
				"7",
				"600",
				"48"
			},
			{
				"0",
				"27",
				"7",
				"600",
				"54"
			},
			{
				"0",
				"30",
				"7",
				"600",
				"60"
			}
		},
		extra_param = {
			"0",
			"12%/15%/18%/21%/24%/27%/30",
			"7",
			"600",
			"24%/30%/36%/42%/48%/54%/60"
		}
	},
	[220105901] = {
		description = "当光煌·阿波罗装备时，获得以下效果。\n被动效果中命中次数条件减少<color=#E78300>{1}</color>次。\n自身造成会心时获得<color=#E78300>1</color>点能量，并有<color=#E78300>{2}%</color>的概率重置<color=#297DE0>「辉光交错」</color>的冷却时间。\n追加攻击命中瞬间基础伤害提高<color=#E78300>{3}%</color>。\n追加攻击命中时对敌人附加光属性抗性降低<color=#E78300>{4}%</color>，持续<color=#E78300>{5}</color>秒。",
		maxLv = 0,
		type = 0,
		id = 220105901,
		param = {
			{
				"0",
				"6",
				"12",
				"10",
				"24",
				"15"
			},
			{
				"0",
				"7",
				"14",
				"12.5",
				"24",
				"15"
			},
			{
				"0",
				"8",
				"16",
				"15",
				"24",
				"15"
			},
			{
				"0",
				"9",
				"18",
				"17.5",
				"24",
				"15"
			},
			{
				"0",
				"10",
				"20",
				"20",
				"24",
				"15"
			},
			{
				"0",
				"11",
				"22",
				"22.5",
				"24",
				"15"
			},
			{
				"0",
				"12",
				"24",
				"25",
				"24",
				"15"
			}
		},
		extra_param = {
			"0",
			"6/7/8/9/10/11/12",
			"12%/14%/16%/18%/20%/22%/24",
			"10%/12.5%/15%/17.5%/20%/22.5%/25",
			"24",
			"15"
		}
	},
	[220106601] = {
		description = "当早樱·大国主装备时，获得以下效果。\n技能三<color=#297DE0>「兔兔扫射」</color>改变为<color=#297DE0>「兔兔出击」</color>。\n召唤兔兔机器人，自动攻击并拉扯周围的目标。<color=#297DE0>「兔兔出击」</color>命中瞬间独立伤害提高<color=#E78300>{2}%</color>，拉扯半径提高<color=#E78300>{1}%</color>。\n当自身或者队友拥有任意<material=underline c=#FFFFFF h=2 event=terminology args=(106601)>「占卜效果」</material>时，会心伤害提高<color=#E78300>{3}%</color>。",
		maxLv = 0,
		type = 0,
		id = 220106601,
		param = {
			{
				"0",
				"20",
				"20",
				"30"
			},
			{
				"0",
				"40",
				"25",
				"30"
			},
			{
				"0",
				"60",
				"30",
				"30"
			},
			{
				"0",
				"80",
				"35",
				"30"
			},
			{
				"0",
				"100",
				"40",
				"30"
			},
			{
				"0",
				"120",
				"45",
				"30"
			},
			{
				"0",
				"140",
				"50",
				"30"
			}
		},
		extra_param = {
			"0",
			"20%/40%/60%/80%/100%/120%/140",
			"20%/25%/30%/35%/40%/45%/50",
			"30"
		}
	},
	[220106801] = {
		description = "当沐风·恩利尔装备时，获得以下效果。\n每次获得<color=#297DE0><material=underline c=#FFFFFF h=2 event=terminology args=(106801)>「风铃」</material></color>标记时，伤害提高<color=#E78300>{1}%</color>，持续<color=#E78300>{2}</color>秒，最多可叠加<color=#E78300>3</color>层。\n施放未强化的<color=#297DE0>「风元异变」</color>也会获得<color=#E78300>1</color>个<color=#297DE0><material=underline c=#FFFFFF h=2 event=terminology args=(106801)>「风铃」</material></color>标记。\n施放强化的<color=#297DE0>「风元异变」</color>结束后，会获得施放未强化的<color=#297DE0>「风元异变」</color>的技能强化效果。\n施放奥义或连携奥义时，全队伍奥义伤害提高<color=#E78300>{3}%</color>，持续<color=#E78300>{4}</color>秒。",
		maxLv = 0,
		type = 0,
		id = 220106801,
		param = {
			{
				"0",
				"6",
				"5",
				"10",
				"10"
			},
			{
				"0",
				"7.5",
				"5",
				"10",
				"10"
			},
			{
				"0",
				"9",
				"5",
				"10",
				"10"
			},
			{
				"0",
				"10.5",
				"5",
				"10",
				"10"
			},
			{
				"0",
				"12",
				"5",
				"10",
				"10"
			},
			{
				"0",
				"13.5",
				"5",
				"10",
				"10"
			},
			{
				"0",
				"15",
				"5",
				"10",
				"10"
			}
		},
		extra_param = {
			"0",
			"6%/7.5%/9%/10.5%/12%/13.5%/15",
			"5",
			"10",
			"10"
		}
	},
	[220108001] = {
		description = "当寒霜之牙·维达尔装备时，获得以下效果。\n普通攻击<color=#297DE0>「冰原狩猎」</color>改变为<color=#297DE0>「凌霜之牙」</color>。\n普通攻击命中敌人时，有<color=#E78300>{1}%</color>的概率对前方的敌人附加冰冻状态，持续<color=#E78300>{2}</color>秒，该效果每<color=#E78300>6</color>秒最多触发一次。每次普通攻击命中处于冰冻状态的敌人后会额外获得<color=#E78300>6</color>点怒气。普通攻击命中后，会对前方非自身普通攻击直接命中的敌人进行范围技能攻击，造成<color=#E78300>250%</color>攻击力的冰属性伤害。\n普通攻击命中时会对敌人附加冰属性抗性降低<color=#E78300>{3}%</color>，持续<color=#E78300>{4}</color>秒。",
		maxLv = 0,
		type = 0,
		id = 220108001,
		param = {
			{
				"0",
				"40",
				"2",
				"12",
				"6"
			},
			{
				"0",
				"50",
				"2",
				"15",
				"6"
			},
			{
				"0",
				"60",
				"2",
				"18",
				"6"
			},
			{
				"0",
				"70",
				"2",
				"21",
				"6"
			},
			{
				"0",
				"80",
				"2",
				"24",
				"6"
			},
			{
				"0",
				"90",
				"2",
				"27",
				"6"
			},
			{
				"0",
				"100",
				"2",
				"30",
				"6"
			}
		},
		extra_param = {
			"0",
			"40%/50%/60%/70%/80%/90%/100",
			"2",
			"12%/15%/18%/21%/24%/27%/30",
			"6"
		}
	},
	[220108101] = {
		description = "当斩浪·丝卡蒂装备时，获得以下效果。\n<color=#297DE0>「霜断」</color>和<color=#297DE0>「晶尘飞散」</color>命中时会对命中的敌人附加冰属性抗性降低<color=#E78300>{1}%</color>，持续<color=#E78300>{2}</color>秒。\n对处于冰属性抗性降低状态的敌人命中瞬间独立伤害提高，数值等同于冰属性抗性降低的<color=#E78300>{3}%</color>。\n<color=#297DE0><material=underline c=#FFFFFF h=2 event=terminology args=(108102)>「巡航模式」</material></color>时，会自动施放普通攻击发射利剑式跟踪导弹。\n展开屏障期间的格挡并施放的<color=#297DE0>「霜断」</color>不再需要消耗<color=#297DE0><material=underline c=#FFFFFF h=2 event=terminology args=(108101)>「破冰」</material></color>标记。",
		maxLv = 0,
		type = 0,
		id = 220108101,
		param = {
			{
				"0",
				"12",
				"15",
				"64"
			},
			{
				"0",
				"12",
				"15",
				"80"
			},
			{
				"0",
				"12",
				"15",
				"96"
			},
			{
				"0",
				"12",
				"15",
				"112"
			},
			{
				"0",
				"12",
				"15",
				"128"
			},
			{
				"0",
				"12",
				"15",
				"144"
			},
			{
				"0",
				"12",
				"15",
				"160"
			}
		},
		extra_param = {
			"0",
			"12",
			"15",
			"64%/80%/96%/112%/128%/144%/160"
		}
	},
	[220108401] = {
		description = "当朝约·薇儿丹蒂装备时，获得以下效果。\n技能一<color=#297DE0>「高速突刺」</color>改变为<color=#297DE0>「飓风突刺」</color>。\n施放<color=#297DE0>「飓风突刺」</color>或<color=#297DE0>「启明」</color>时获得<color=#E78300>10</color>点神能，独立伤害提高<color=#E78300>{1}%</color>，持续<color=#E78300>{2}</color>秒，最多可叠加<color=#E78300>3</color>层。",
		maxLv = 0,
		type = 0,
		id = 220108401,
		param = {
			{
				"0",
				"12",
				"5"
			},
			{
				"0",
				"15",
				"5"
			},
			{
				"0",
				"18",
				"5"
			},
			{
				"0",
				"21",
				"5"
			},
			{
				"0",
				"24",
				"5"
			},
			{
				"0",
				"27",
				"5"
			},
			{
				"0",
				"30",
				"5"
			}
		},
		extra_param = {
			"0",
			"12%/15%/18%/21%/24%/27%/30",
			"5"
		}
	},
	[220109301] = {
		description = "当觅影·国常立装备时，获得以下效果。\n<color=#297DE0>「天之持」</color>、<color=#297DE0>「地之持」</color>的冷却时间缩短<color=#E78300>1.5</color>秒。\n施放<color=#297DE0>「天之持」</color>后，会对锁定敌人进行一次手里剑袭击，造成<color=#E78300>{1}%</color>攻击力的物理属性伤害；施放<color=#297DE0>「地之持」</color>后会对周围的敌人形成一次范围性的冲击，造成<color=#E78300>{2}%</color>攻击力的物理属性伤害。\n<color=#297DE0>「忍法」</color>独立伤害提高<color=#E78300>{3}%</color>。\n施放奥义时不再需要消耗<material=underline c=#FFFFFF h=2 event=terminology args=(109301)>「忍持」</material>。",
		maxLv = 0,
		type = 0,
		id = 220109301,
		param = {
			{
				"0",
				"500",
				"500",
				"24"
			},
			{
				"0",
				"500",
				"500",
				"30"
			},
			{
				"0",
				"500",
				"500",
				"36"
			},
			{
				"0",
				"500",
				"500",
				"42"
			},
			{
				"0",
				"500",
				"500",
				"48"
			},
			{
				"0",
				"500",
				"500",
				"54"
			},
			{
				"0",
				"500",
				"500",
				"60"
			}
		},
		extra_param = {
			"0",
			"500",
			"500",
			"24%/30%/36%/42%/48%/54%/60"
		}
	},
	[220109401] = {
		description = "当暗星·海拉装备时，获得以下效果。\n炮垒形态的炮击的神能消耗减少<color=#E78300>5</color>点，炮击的独立伤害提高<color=#E78300>{1}%</color>。",
		maxLv = 0,
		type = 0,
		id = 220109401,
		param = {
			{
				"0",
				"32"
			},
			{
				"0",
				"40"
			},
			{
				"0",
				"48"
			},
			{
				"0",
				"56"
			},
			{
				"0",
				"64"
			},
			{
				"0",
				"72"
			},
			{
				"0",
				"80"
			}
		},
		extra_param = {
			"0",
			"32%/40%/48%/56%/64%/72%/80"
		}
	},
	[220109601] = {
		description = "当风行·赫尔墨斯装备时，获得以下效果。\n技能三基础伤害提高<color=#E78300>{2}%</color>。\n普通攻击最后一段后，可通过继续点击普通攻击消耗怒气衔接<color=#297DE0>「风驰迹掣」</color>的追加攻击，通过该途径的<color=#297DE0>「风驰迹掣」</color>不会进入冷却状态。\n<color=#297DE0>「风驰迹掣」</color>的追加攻击会对命中的敌人附加风属性抗性降低<color=#E78300>{1}%</color>，该效果提供的风属性抗性降低最高为<color=#E78300>120%</color>。",
		maxLv = 0,
		type = 0,
		id = 220109601,
		param = {
			{
				"0",
				"6",
				"12"
			},
			{
				"0",
				"7.5",
				"15"
			},
			{
				"0",
				"9",
				"18"
			},
			{
				"0",
				"10.5",
				"21"
			},
			{
				"0",
				"12",
				"24"
			},
			{
				"0",
				"13.5",
				"27"
			},
			{
				"0",
				"15",
				"30"
			}
		},
		extra_param = {
			"0",
			"6%/7.5%/9%/10.5%/12%/13.5%/15",
			"12%/15%/18%/21%/24%/27%/30"
		}
	},
	[220109701] = {
		description = "当小困·俄尼里伊装备时，获得以下效果。\n技能二<color=#297DE0>「绘梦童话」</color>改变为<color=#297DE0>「幽梦乐园」</color>。\n<color=#297DE0>「幽梦乐园」</color>持续期间内，技能一、三基础伤害提高<color=#E78300>{2}%</color>。\n<color=#297DE0>「幽梦乐园」</color>持续期间内，所有友方受到的伤害降低，自身会对命中的敌人附加<color=#297DE0><material=underline c=#FFFFFF h=2 event=terminology args=(109703)>「幽梦」</material></color>状态。\n<color=#297DE0><material=underline c=#FFFFFF h=2 event=terminology args=(109703)>「幽梦」</material></color>：每<color=#E78300>1</color>秒附加<color=#E78300>{1}%</color>攻击力的暗属性伤害。",
		maxLv = 0,
		type = 0,
		id = 220109701,
		param = {
			{
				"0",
				"80",
				"16"
			},
			{
				"0",
				"100",
				"20"
			},
			{
				"0",
				"120",
				"24"
			},
			{
				"0",
				"140",
				"28"
			},
			{
				"0",
				"160",
				"32"
			},
			{
				"0",
				"180",
				"36"
			},
			{
				"0",
				"200",
				"40"
			}
		},
		extra_param = {
			"0",
			"80%/100%/120%/140%/160%/180%/200",
			"16%/20%/24%/28%/32%/36%/40"
		}
	},
	[220109901] = {
		description = "当朔望·月读装备时，获得以下效果。\n技能三<color=#297DE0>「朔望·月夜见」</color>改变为<color=#297DE0>「朔望·末月」</color>。\n普通攻击每次命中额外获得<color=#E78300>2</color>点神能。蓄力时获得硬直效果。\n神能为满时，重置<color=#297DE0>「朔望·末月」</color>的冷却时间。\n<color=#297DE0>「望·末月」</color>的蓄力时间缩短<color=#E78300>60%</color>，基础伤害提高<color=#E78300>{1}%</color>。",
		maxLv = 0,
		type = 0,
		id = 220109901,
		param = {
			{
				"0",
				"16"
			},
			{
				"0",
				"20"
			},
			{
				"0",
				"24"
			},
			{
				"0",
				"28"
			},
			{
				"0",
				"32"
			},
			{
				"0",
				"36"
			},
			{
				"0",
				"40"
			}
		},
		extra_param = {
			"0",
			"16%/20%/24%/28%/32%/36%/40"
		}
	},
	[220111101] = {
		description = "当生魂·奥西里斯装备时，获得以下效果。\n印记上限增加<color=#E78300>2</color>个；出场时，自身和与自身预组合连携奥义的修正者恢复<color=#E78300>{1}%</color>的奥义值。\n施放<color=#297DE0>「幽岚羽刃」</color>后的再次施放，不再需要消耗印记；<color=#297DE0>「永劫轮舞」</color>也不再需要消耗印记。\n<color=#297DE0>「终灵凋落」</color>每次施放命中时，每秒恢复自身<color=#E78300>{3}%</color>的生命值，持续<color=#E78300>{4}</color>秒；消耗剩余的全部印记，每额外消耗<color=#E78300>1</color>个印记<color=#297DE0>「终灵凋落」</color>的独立伤害提高<color=#E78300>{2}%</color>。\n<color=#297DE0><material=underline c=#FFFFFF h=2 event=terminology args=(111101)>「冥府审判模式」</material></color>下施放的<color=#297DE0>「终灵凋落」</color>的伤害提高效果和生命值恢复效果提高<color=#E78300>100%</color>。",
		maxLv = 0,
		type = 0,
		id = 220111101,
		param = {
			{
				"0",
				"5",
				"12",
				"1.2",
				"8"
			},
			{
				"0",
				"10",
				"15",
				"1.3",
				"8"
			},
			{
				"0",
				"15",
				"18",
				"1.4",
				"8"
			},
			{
				"0",
				"20",
				"21",
				"1.5",
				"8"
			},
			{
				"0",
				"25",
				"24",
				"1.6",
				"8"
			},
			{
				"0",
				"30",
				"27",
				"1.7",
				"8"
			},
			{
				"0",
				"35",
				"30",
				"1.8",
				"8"
			}
		},
		extra_param = {
			"0",
			"5%/10%/15%/20%/25%/30%/35",
			"12%/15%/18%/21%/24%/27%/30",
			"1.2%/1.3%/1.4%/1.5%/1.6%/1.7%/1.8",
			"8"
		}
	},
	[220111901] = {
		description = "当流萤岚雾·休装备时，获得以下效果。\n追击与反击的基础伤害提高<color=#E78300>{1}%</color>。\n在施放追击或反击的过程中切换过姿态后，可以额外产生一次对应技能的追击和一次反击，额外产生的追击和反击无法继续触发该效果。",
		maxLv = 0,
		type = 0,
		id = 220111901,
		param = {
			{
				"0",
				"20"
			},
			{
				"0",
				"25"
			},
			{
				"0",
				"30"
			},
			{
				"0",
				"35"
			},
			{
				"0",
				"40"
			},
			{
				"0",
				"45"
			},
			{
				"0",
				"50"
			}
		},
		extra_param = {
			"0",
			"20%/25%/30%/35%/40%/45%/50"
		}
	},
	[220112701] = {
		description = "当逆潮·利维坦装备时，获得以下效果。\n技能三基础伤害提高<color=#E78300>{2}%</color>。\n每次成功获得标记或施放<color=#297DE0>「深海愈疗」</color>时，<color=#297DE0>「暗潮之力」</color>的剩余冷却时间缩短<color=#E78300>3</color>秒。\n施放<color=#297DE0>「深海愈疗」</color>时会生成一个跟随自身的领域，持续<color=#E78300>8</color>秒，处于领域范围内的敌人被命中时近战伤害抗性降低<color=#E78300>{1}%</color>，持续<color=#E78300>3</color>秒。",
		maxLv = 0,
		type = 0,
		id = 220112701,
		param = {
			{
				"0",
				"16",
				"8"
			},
			{
				"0",
				"20",
				"10"
			},
			{
				"0",
				"24",
				"12"
			},
			{
				"0",
				"28",
				"14"
			},
			{
				"0",
				"32",
				"16"
			},
			{
				"0",
				"36",
				"18"
			},
			{
				"0",
				"40",
				"20"
			}
		},
		extra_param = {
			"0",
			"16%/20%/24%/28%/32%/36%/40",
			"8%/10%/12%/14%/16%/18%/20"
		}
	},
	[220113901] = {
		description = "当冰渊·波塞冬装备时，获得以下效果。\n每命中敌人<color=#E78300>{1}</color>次，获得<color=#E78300>1</color>点能量。\n处于<color=#297DE0><material=underline c=#FFFFFF h=2 event=terminology args=(113903)>「临渊」</material></color>状态时，<color=#297DE0>「零度寒芒」</color>的冰属性伤害加成效果提高<color=#E78300>20%</color>，<color=#297DE0>「事象冰封」</color>对命中的敌人附加的冰属性抗性降低效果提高<color=#E78300>20%</color>。\n处于<color=#297DE0><material=underline c=#FFFFFF h=2 event=terminology args=(113903)>「临渊」</material></color>状态时，每次施放<color=#297DE0>「零度寒芒」</color>或<color=#297DE0>「事象冰封」</color>时，对应技能的基础伤害提高<color=#E78300>{2}%</color>，持续<color=#E78300>5</color>秒，最多可叠加<color=#E78300>5</color>层。\n处于<color=#297DE0><material=underline c=#FFFFFF h=2 event=terminology args=(113903)>「临渊」</material></color>状态时，每秒自动额外获得<color=#E78300>1</color>点能量。\n第<color=#E78300>3</color>次及之后退出<color=#297DE0><material=underline c=#FFFFFF h=2 event=terminology args=(113903)>「临渊」</material></color>状态时，<color=#297DE0>「银雪回响」</color>的剩余冷却时间缩短<color=#E78300>{3}</color>秒。",
		maxLv = 0,
		type = 0,
		id = 220113901,
		param = {
			{
				"0",
				"15",
				"12",
				"4"
			},
			{
				"0",
				"14",
				"15",
				"5"
			},
			{
				"0",
				"13",
				"18",
				"6"
			},
			{
				"0",
				"12",
				"21",
				"7"
			},
			{
				"0",
				"11",
				"24",
				"8"
			},
			{
				"0",
				"10",
				"27",
				"9"
			},
			{
				"0",
				"9",
				"30",
				"10"
			}
		},
		extra_param = {
			"0",
			"15/14/13/12/11/10/9",
			"12%/15%/18%/21%/24%/27%/30",
			"4/5/6/7/8/9/10"
		}
	},
	[220114801] = {
		description = "当追炎·前鬼坊天狗装备时，获得以下效果。\n技能三基础伤害提高<color=#E78300>{2}%</color>。\n印记上限增加<color=#E78300>2</color>个。\n每消耗<color=#E78300>1</color>个印记，伤害提高<color=#E78300>{1}%</color>，最多可叠加<color=#E78300>10</color>层。",
		maxLv = 0,
		type = 0,
		id = 220114801,
		param = {
			{
				"0",
				"4",
				"16"
			},
			{
				"0",
				"5",
				"20"
			},
			{
				"0",
				"6",
				"24"
			},
			{
				"0",
				"7",
				"28"
			},
			{
				"0",
				"8",
				"32"
			},
			{
				"0",
				"9",
				"36"
			},
			{
				"0",
				"10",
				"40"
			}
		},
		extra_param = {
			"0",
			"4%/5%/6%/7%/8%/9%/10",
			"16%/20%/24%/28%/32%/36%/40"
		}
	},
	[220118401] = {
		description = "当旧誓·薇儿丹蒂装备时，获得以下效果。\n自身或者队友获得<color=#297DE0>「信念守护」</color>的护盾时，攻击力提高<color=#E78300>{4}%</color>、雷属性伤害提高<color=#E78300>{1}%</color>，持续<color=#E78300>{2}</color>秒；护盾移除时，攻击力提高、雷属性伤害提高效果也会移除。\n<color=#297DE0>「信念守护」</color>的护盾移除或者刷新时，会以自身为中心造成一次范围爆炸，造成共计<color=#E78300>{3}%</color>攻击力的雷属性伤害。\n施放<color=#297DE0>「反制打击」</color>时，嘲讽所有敌人，持续<color=#E78300>{5}</color>秒。\n自身奥义或连携奥义攻击命中瞬间修正系数提高<color=#E78300>{6}%</color>。\n<color=#297DE0>「信念守护」</color>的冷却时间缩短<color=#E78300>{7}</color>秒。",
		maxLv = 0,
		type = 0,
		id = 220118401,
		param = {
			{
				"0",
				"20",
				"12",
				"480",
				"10",
				"4",
				"120",
				"1.2"
			},
			{
				"0",
				"25",
				"12",
				"480",
				"12.5",
				"4",
				"120",
				"1.5"
			},
			{
				"0",
				"30",
				"12",
				"480",
				"15",
				"4",
				"120",
				"1.8"
			},
			{
				"0",
				"35",
				"12",
				"480",
				"17.5",
				"4",
				"120",
				"2.1"
			},
			{
				"0",
				"40",
				"12",
				"480",
				"20",
				"4",
				"120",
				"2.4"
			},
			{
				"0",
				"45",
				"12",
				"480",
				"22.5",
				"4",
				"120",
				"2.7"
			},
			{
				"0",
				"50",
				"12",
				"480",
				"25",
				"4",
				"120",
				"3"
			}
		},
		extra_param = {
			"0",
			"20%/25%/30%/35%/40%/45%/50",
			"12",
			"480",
			"10%/12.5%/15%/17.5%/20%/22.5%/25",
			"4",
			"120",
			"1.2/1.5/1.8/2.1/2.4/2.7/3"
		}
	},
	[220119901] = {
		description = "当震离·月读装备时，获得以下效果。\n每次清除<color=#297DE0><material=underline c=#FFFFFF h=2 event=terminology args=(119901)>「雷殛之印」</material></color>或处于<color=#297DE0><material=underline c=#FFFFFF h=2 event=terminology args=(119901)>「雷殛之印」</material></color>的敌人被击败时，攻击力提高<color=#E78300>{1}%</color>，持续<color=#E78300>{2}</color>秒，最多可叠加<color=#E78300>3</color>层。\n<color=#297DE0>「雷殛·荒天」</color>第一式、<color=#297DE0>「雷殛·荒天」</color>第二式不再消耗怒气，<color=#297DE0>「雷殛·荒天」</color>第三式命中时消耗全部怒气，根据消耗的怒气每有<color=#E78300>1%</color>，<color=#297DE0>「雷殛·荒天」</color>第三式命中瞬间独立伤害提高<color=#E78300>{3}%</color>。",
		maxLv = 0,
		type = 0,
		id = 220119901,
		param = {
			{
				"0",
				"6",
				"9",
				"1.5"
			},
			{
				"0",
				"7.5",
				"9",
				"1.5"
			},
			{
				"0",
				"9",
				"9",
				"1.5"
			},
			{
				"0",
				"10.5",
				"9",
				"1.5"
			},
			{
				"0",
				"12",
				"9",
				"1.5"
			},
			{
				"0",
				"13.5",
				"9",
				"1.5"
			},
			{
				"0",
				"15",
				"9",
				"1.5"
			}
		},
		extra_param = {
			"0",
			"6%/7.5%/9%/10.5%/12%/13.5%/15",
			"9",
			"1.5"
		}
	},
	[500000401] = {
		description = "会心伤害提高<color=#E78300>{1}%</color>。",
		maxLv = 0,
		type = 0,
		id = 500000401,
		param = {
			{
				"0",
				"8"
			},
			{
				"0",
				"10"
			},
			{
				"0",
				"12"
			},
			{
				"0",
				"14"
			},
			{
				"0",
				"16"
			},
			{
				"0",
				"18"
			},
			{
				"0",
				"20"
			}
		},
		extra_param = {
			"0",
			"8%/10%/12%/14%/16%/18%/20"
		}
	},
	[500000402] = {
		description = "奥义伤害提高<color=#E78300>{1}%</color>。",
		maxLv = 0,
		type = 0,
		id = 500000402,
		param = {
			{
				"0",
				"24"
			},
			{
				"0",
				"28"
			},
			{
				"0",
				"32"
			},
			{
				"0",
				"36"
			},
			{
				"0",
				"40"
			},
			{
				"0",
				"44"
			},
			{
				"0",
				"48"
			}
		},
		extra_param = {
			"0",
			"24%/28%/32%/36%/40%/44%/48"
		}
	},
	[500000403] = {
		description = "会心率提高<color=#E78300>{1}%</color>。",
		maxLv = 0,
		type = 0,
		id = 500000403,
		param = {
			{
				"0",
				"4"
			},
			{
				"0",
				"5"
			},
			{
				"0",
				"6"
			},
			{
				"0",
				"7"
			},
			{
				"0",
				"8"
			},
			{
				"0",
				"9"
			},
			{
				"0",
				"10"
			}
		},
		extra_param = {
			"0",
			"4%/5%/6%/7%/8%/9%/10"
		}
	},
	[500000404] = {
		description = "攻击力提高<color=#E78300>{1}%</color>。",
		maxLv = 0,
		type = 0,
		id = 500000404,
		param = {
			{
				"0",
				"4"
			},
			{
				"0",
				"5"
			},
			{
				"0",
				"6"
			},
			{
				"0",
				"7"
			},
			{
				"0",
				"8"
			},
			{
				"0",
				"9"
			},
			{
				"0",
				"10"
			}
		},
		extra_param = {
			"0",
			"4%/5%/6%/7%/8%/9%/10"
		}
	},
	[500000405] = {
		description = "防御力提高<color=#E78300>{1}%</color>。",
		maxLv = 0,
		type = 0,
		id = 500000405,
		param = {
			{
				"0",
				"4"
			},
			{
				"0",
				"5"
			},
			{
				"0",
				"6"
			},
			{
				"0",
				"7"
			},
			{
				"0",
				"8"
			},
			{
				"0",
				"9"
			},
			{
				"0",
				"10"
			}
		},
		extra_param = {
			"0",
			"4%/5%/6%/7%/8%/9%/10"
		}
	},
	[500000406] = {
		description = "触发闪避效果时，技能伤害提高<color=#E78300>{1}%</color>，持续<color=#E78300>7</color>秒。",
		maxLv = 0,
		type = 0,
		id = 500000406,
		param = {
			{
				"0",
				"30"
			},
			{
				"0",
				"35"
			},
			{
				"0",
				"40"
			},
			{
				"0",
				"45"
			},
			{
				"0",
				"50"
			},
			{
				"0",
				"55"
			},
			{
				"0",
				"60"
			}
		},
		extra_param = {
			"0",
			"30%/35%/40%/45%/50%/55%/60"
		}
	},
	[500000407] = {
		description = "施放技能和奥义命中瞬间会心率提高<color=#E78300>{1}%</color>。",
		maxLv = 0,
		type = 0,
		id = 500000407,
		param = {
			{
				"0",
				"9"
			},
			{
				"0",
				"10.5"
			},
			{
				"0",
				"12"
			},
			{
				"0",
				"13.5"
			},
			{
				"0",
				"15"
			},
			{
				"0",
				"16.5"
			},
			{
				"0",
				"18"
			}
		},
		extra_param = {
			"0",
			"9%/10.5%/12%/13.5%/15%/16.5%/18"
		}
	},
	[500000408] = {
		description = "受击时，攻击力提高<color=#E78300>{1}%</color>、防御力提高<color=#E78300>{2}%</color>，持续<color=#E78300>{3}</color>秒。",
		maxLv = 0,
		type = 0,
		id = 500000408,
		param = {
			{
				"0",
				"6",
				"5",
				"9"
			},
			{
				"0",
				"7",
				"5",
				"9"
			},
			{
				"0",
				"8",
				"5",
				"9"
			},
			{
				"0",
				"9",
				"5",
				"9"
			},
			{
				"0",
				"10",
				"5",
				"9"
			},
			{
				"0",
				"11",
				"5",
				"9"
			},
			{
				"0",
				"12",
				"5",
				"9"
			}
		},
		extra_param = {
			"0",
			"6%/7%/8%/9%/10%/11%/12",
			"5",
			"9"
		}
	},
	[500000409] = {
		description = "触发闪避效果时，机制值获得率提高<color=#E78300>{1}%</color>，持续<color=#E78300>{2}</color>秒。",
		maxLv = 0,
		type = 0,
		id = 500000409,
		param = {
			{
				"0",
				"18",
				"6"
			},
			{
				"0",
				"21",
				"6"
			},
			{
				"0",
				"24",
				"6"
			},
			{
				"0",
				"27",
				"6"
			},
			{
				"0",
				"30",
				"6"
			},
			{
				"0",
				"33",
				"6"
			},
			{
				"0",
				"36",
				"6"
			}
		},
		extra_param = {
			"0",
			"18%/21%/24%/27%/30%/33%/36",
			"6"
		}
	},
	[500000410] = {
		description = "普通攻击造成会心后，攻击力提高<color=#E78300>{1}%</color>，持续<color=#E78300>{2}</color>秒，最多可叠加<color=#E78300>3</color>层。",
		maxLv = 0,
		type = 0,
		id = 500000410,
		param = {
			{
				"0",
				"3",
				"9"
			},
			{
				"0",
				"3.5",
				"9"
			},
			{
				"0",
				"4",
				"9"
			},
			{
				"0",
				"4.5",
				"9"
			},
			{
				"0",
				"5",
				"9"
			},
			{
				"0",
				"5.5",
				"9"
			},
			{
				"0",
				"6",
				"9"
			}
		},
		extra_param = {
			"0",
			"3%/3.5%/4%/4.5%/5%/5.5%/6",
			"9"
		}
	},
	[500000411] = {
		description = "触发闪避效果时，会心率提高<color=#E78300>{1}%</color>，持续<color=#E78300>{2}</color>秒。",
		maxLv = 0,
		type = 0,
		id = 500000411,
		param = {
			{
				"0",
				"9",
				"6"
			},
			{
				"0",
				"10.5",
				"6"
			},
			{
				"0",
				"12",
				"6"
			},
			{
				"0",
				"13.5",
				"6"
			},
			{
				"0",
				"15",
				"6"
			},
			{
				"0",
				"16.5",
				"6"
			},
			{
				"0",
				"18",
				"6"
			}
		},
		extra_param = {
			"0",
			"9%/10.5%/12%/13.5%/15%/16.5%/18",
			"6"
		}
	},
	[500000412] = {
		description = "普通攻击每命中敌人<color=#E78300>1</color>次，技能伤害提高<color=#E78300>{1}%</color>，持续<color=#E78300>5</color>秒，最多可叠加<color=#E78300>5</color>层，当叠加至<color=#E78300>5</color>层时<color=#E78300>9</color>秒内不再可叠加。",
		maxLv = 0,
		type = 0,
		id = 500000412,
		param = {
			{
				"0",
				"4.8"
			},
			{
				"0",
				"5.6"
			},
			{
				"0",
				"6.4"
			},
			{
				"0",
				"7.2"
			},
			{
				"0",
				"8"
			},
			{
				"0",
				"8.8"
			},
			{
				"0",
				"9.6"
			}
		},
		extra_param = {
			"0",
			"4.8%/5.6%/6.4%/7.2%/8%/8.8%/9.6"
		}
	},
	[500000413] = {
		description = "触发闪避效果时，攻击力提高<color=#E78300>{1}%</color>，持续<color=#E78300>{2}</color>秒。",
		maxLv = 0,
		type = 0,
		id = 500000413,
		param = {
			{
				"0",
				"18",
				"10"
			},
			{
				"0",
				"21",
				"10"
			},
			{
				"0",
				"24",
				"10"
			},
			{
				"0",
				"27",
				"10"
			},
			{
				"0",
				"30",
				"10"
			},
			{
				"0",
				"33",
				"10"
			},
			{
				"0",
				"36",
				"10"
			}
		},
		extra_param = {
			"0",
			"18%/21%/24%/27%/30%/33%/36",
			"10"
		}
	},
	[500000414] = {
		description = "敌人生命值越多自身命中时修正系数提高越高，该效果提供的修正系数提高最高为<color=#E78300>{1}%</color>。",
		maxLv = 0,
		type = 0,
		id = 500000414,
		param = {
			{
				"0",
				"18"
			},
			{
				"0",
				"21"
			},
			{
				"0",
				"24"
			},
			{
				"0",
				"27"
			},
			{
				"0",
				"30"
			},
			{
				"0",
				"33"
			},
			{
				"0",
				"36"
			}
		},
		extra_param = {
			"0",
			"18%/21%/24%/27%/30%/33%/36"
		}
	},
	[500000415] = {
		description = "触发闪避效果时，获得生命值上限<color=#E78300>{1}%</color>的护盾，持续<color=#E78300>{2}</color>秒。",
		maxLv = 0,
		type = 0,
		id = 500000415,
		param = {
			{
				"0",
				"4.2",
				"10"
			},
			{
				"0",
				"4.9",
				"10"
			},
			{
				"0",
				"5.6",
				"10"
			},
			{
				"0",
				"6.3",
				"10"
			},
			{
				"0",
				"7",
				"10"
			},
			{
				"0",
				"7.7",
				"10"
			},
			{
				"0",
				"8.4",
				"10"
			}
		},
		extra_param = {
			"0",
			"4.2%/4.9%/5.6%/6.3%/7%/7.7%/8.4",
			"10"
		}
	},
	[500000416] = {
		description = "自身触发的的零时空间延长<color=#E78300>2</color>秒。\n处于零时空间时，技能伤害提高<color=#E78300>{1}%</color>。",
		maxLv = 0,
		type = 0,
		id = 500000416,
		param = {
			{
				"0",
				"30"
			},
			{
				"0",
				"35"
			},
			{
				"0",
				"40"
			},
			{
				"0",
				"45"
			},
			{
				"0",
				"50"
			},
			{
				"0",
				"55"
			},
			{
				"0",
				"60"
			}
		},
		extra_param = {
			"0",
			"30%/35%/40%/45%/50%/55%/60"
		}
	},
	[500000417] = {
		description = "消耗机制值时技能伤害提高，持续<color=#E78300>2</color>秒，每消耗最大机制值的<color=#E78300>1%</color>，技能伤害提高<color=#E78300>0.{1}%</color>，该效果提供的技能伤害提高最高为<color=#E78300>{2}%</color>。",
		maxLv = 0,
		type = 0,
		id = 500000417,
		param = {
			{
				"0",
				"24",
				"24"
			},
			{
				"0",
				"28",
				"28"
			},
			{
				"0",
				"32",
				"32"
			},
			{
				"0",
				"36",
				"36"
			},
			{
				"0",
				"40",
				"40"
			},
			{
				"0",
				"44",
				"44"
			},
			{
				"0",
				"48",
				"48"
			}
		},
		extra_param = {
			"0",
			"24%/28%/32%/36%/40%/44%/48",
			"24%/28%/32%/36%/40%/44%/48"
		}
	},
	[500000418] = {
		description = "施放技能和奥义命中瞬间会心率提高<color=#E78300>{1}%</color>、会心伤害提高<color=#E78300>{2}%</color>。",
		maxLv = 0,
		type = 0,
		id = 500000418,
		param = {
			{
				"0",
				"10",
				"30"
			},
			{
				"0",
				"10",
				"35"
			},
			{
				"0",
				"10",
				"40"
			},
			{
				"0",
				"10",
				"45"
			},
			{
				"0",
				"10",
				"50"
			},
			{
				"0",
				"10",
				"55"
			},
			{
				"0",
				"10",
				"60"
			}
		},
		extra_param = {
			"0",
			"10",
			"30%/35%/40%/45%/50%/55%/60"
		}
	},
	[500000419] = {
		description = "触发闪避效果时，攻击者受到的伤害提高<color=#E78300>{1}%</color>，持续<color=#E78300>{2}</color>秒，多个该效果不可叠加。\n每次极限闪避时，闪避效果的剩余冷却时间缩短<color=#E78300>1</color>秒。",
		maxLv = 0,
		type = 0,
		id = 500000419,
		param = {
			{
				"0",
				"9",
				"6"
			},
			{
				"0",
				"10.5",
				"6"
			},
			{
				"0",
				"12",
				"6"
			},
			{
				"0",
				"13.5",
				"6"
			},
			{
				"0",
				"15",
				"6"
			},
			{
				"0",
				"16.5",
				"6"
			},
			{
				"0",
				"18",
				"6"
			}
		},
		extra_param = {
			"0",
			"9%/10.5%/12%/13.5%/15%/16.5%/18",
			"6"
		}
	},
	[500000420] = {
		description = "对处于异常状态的敌人命中瞬间伤害提高<color=#E78300>{1}%</color>。\n异常状态包括：受创、灼烧、冰冻、麻痹、眩晕、禁锢、混乱。",
		maxLv = 0,
		type = 0,
		id = 500000420,
		param = {
			{
				"0",
				"15"
			},
			{
				"0",
				"17.5"
			},
			{
				"0",
				"20"
			},
			{
				"0",
				"22.5"
			},
			{
				"0",
				"25"
			},
			{
				"0",
				"27.5"
			},
			{
				"0",
				"30"
			}
		},
		extra_param = {
			"0",
			"15%/17.5%/20%/22.5%/25%/27.5%/30"
		}
	},
	[500000421] = {
		description = "开场时、生命值第一次低于<color=#E78300>50%</color>时，自身获得最大生命值<color=#E78300>{1}%</color>的护盾，当护盾破裂时，向以自身为圆心的周围发射扩散性水波，水波会击退敌人并造成共计<color=#E78300>{2}%</color>攻击力的水属性伤害。",
		maxLv = 0,
		type = 0,
		id = 500000421,
		param = {
			{
				"0",
				"20",
				"1907"
			},
			{
				"0",
				"25",
				"1907"
			},
			{
				"0",
				"30",
				"1907"
			},
			{
				"0",
				"35",
				"1907"
			},
			{
				"0",
				"40",
				"1907"
			},
			{
				"0",
				"45",
				"1907"
			},
			{
				"0",
				"50",
				"1907"
			}
		},
		extra_param = {
			"0",
			"20%/25%/30%/35%/40%/45%/50",
			"1907"
		}
	},
	[500000422] = {
		description = "技能伤害提高<color=#E78300>{1}%</color>。",
		maxLv = 0,
		type = 0,
		id = 500000422,
		param = {
			{
				"0",
				"6"
			},
			{
				"0",
				"7.5"
			},
			{
				"0",
				"9"
			},
			{
				"0",
				"10.5"
			},
			{
				"0",
				"12"
			},
			{
				"0",
				"13.5"
			},
			{
				"0",
				"15"
			}
		},
		extra_param = {
			"0",
			"6%/7.5%/9%/10.5%/12%/13.5%/15"
		}
	},
	[500000423] = {
		description = "触发闪避效果时，自身奥义获得率提高<color=#E78300>{1}%</color>，持续<color=#E78300>7</color>秒。",
		maxLv = 0,
		type = 0,
		id = 500000423,
		param = {
			{
				"0",
				"48"
			},
			{
				"0",
				"56"
			},
			{
				"0",
				"64"
			},
			{
				"0",
				"72"
			},
			{
				"0",
				"80"
			},
			{
				"0",
				"88"
			},
			{
				"0",
				"96"
			}
		},
		extra_param = {
			"0",
			"48%/56%/64%/72%/80%/88%/96"
		}
	},
	[500000424] = {
		description = "攻击命中时，对命中的敌人附加破甲状态，防御力降低<color=#E78300>{1}%</color>，持续<color=#E78300>7</color>秒，该效果每个敌人每<color=#E78300>12</color>秒最多被附加一次，多个该效果不可叠加。",
		maxLv = 0,
		type = 0,
		id = 500000424,
		param = {
			{
				"0",
				"9.6"
			},
			{
				"0",
				"11.2"
			},
			{
				"0",
				"12.8"
			},
			{
				"0",
				"14.4"
			},
			{
				"0",
				"16"
			},
			{
				"0",
				"17.6"
			},
			{
				"0",
				"19.2"
			}
		},
		extra_param = {
			"0",
			"9.6%/11.2%/12.8%/14.4%/16%/17.6%/19.2"
		}
	},
	[500000425] = {
		description = "修正等级不低于<color=#E78300>B</color>时，普通攻击伤害提高<color=#E78300>{1}%</color>；\n修正等级不低于<color=#E78300>A</color>时，技能伤害提高<color=#E78300>{2}%</color>；\n修正等级不低于<color=#E78300>S</color>时，奥义伤害提高<color=#E78300>{3}%</color>；\n修正等级为<color=#E78300>Ω</color>时，以上效果提高<color=#E78300>100%</color>。",
		maxLv = 0,
		type = 0,
		id = 500000425,
		param = {
			{
				"0",
				"6",
				"6",
				"6"
			},
			{
				"0",
				"7.5",
				"7.5",
				"7.5"
			},
			{
				"0",
				"9",
				"9",
				"9"
			},
			{
				"0",
				"10.5",
				"10.5",
				"10.5"
			},
			{
				"0",
				"12",
				"12",
				"12"
			},
			{
				"0",
				"13.5",
				"13.5",
				"13.5"
			},
			{
				"0",
				"15",
				"15",
				"15"
			}
		},
		extra_param = {
			"0",
			"6%/7.5%/9%/10.5%/12%/13.5%/15",
			"6%/7.5%/9%/10.5%/12%/13.5%/15",
			"6%/7.5%/9%/10.5%/12%/13.5%/15"
		}
	},
	[500101101] = {
		description = "当雏心·奥西里斯装备时，获得以下效果。\n获得所有神格的第三层效果。\n技能一基础伤害提高<color=#E78300>{1}%</color>。",
		maxLv = 0,
		type = 0,
		id = 500101101,
		param = {
			{
				"0",
				"36"
			},
			{
				"0",
				"45"
			},
			{
				"0",
				"54"
			},
			{
				"0",
				"63"
			},
			{
				"0",
				"72"
			},
			{
				"0",
				"81"
			},
			{
				"0",
				"90"
			}
		},
		extra_param = {
			"0",
			"36%/45%/54%/63%/72%/81%/90"
		}
	},
	[500101301] = {
		description = "当障月·阿修罗装备时，获得以下效果。\n<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(101301)>「缚炎」</material></color>状态消失后不再强化<color=#297DE0>「虚炎行空」</color>，改变为进入或延长<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(101301)>「缚炎」</material></color>状态时强化下一次的<color=#297DE0>「虚炎行空」</color>，并且仅处于<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(101301)>「缚炎」</material></color>状态时才可通过长按普通攻击施放该强化技能。把释放的火焰地涌转为对目标的小范围攻击，造成共计<color=#E78300>{2}%</color>攻击力的火属性伤害，获得<color=#E78300>12</color>点能量，对命中的敌人附加火属性抗性降低<color=#E78300>{3}%</color>，持续<color=#E78300>{4}</color>秒，最多可叠加<color=#E78300>5</color>层。\n<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(101301)>「缚炎」</material></color>状态期间普通攻击每命中<color=#E78300>1</color>次，<color=#297DE0>「虚炎行空」</color>命中瞬间伤害提高<color=#E78300>{1}%</color>；每次<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(101301)>「缚炎」</material></color>状态结束时移除该伤害提高效果。",
		maxLv = 0,
		type = 0,
		id = 500101301,
		param = {
			{
				"0",
				"2.4",
				"660",
				"2.4",
				"8"
			},
			{
				"0",
				"3",
				"660",
				"3",
				"8"
			},
			{
				"0",
				"3.6",
				"660",
				"3.6",
				"8"
			},
			{
				"0",
				"4.2",
				"660",
				"4.2",
				"8"
			},
			{
				"0",
				"4.8",
				"660",
				"4.8",
				"8"
			},
			{
				"0",
				"5.4",
				"660",
				"5.4",
				"8"
			},
			{
				"0",
				"6",
				"660",
				"6",
				"8"
			}
		},
		extra_param = {
			"0",
			"2.4%/3%/3.6%/4.2%/4.8%/5.4%/6",
			"660",
			"2.4%/3%/3.6%/4.2%/4.8%/5.4%/6",
			"8"
		}
	},
	[500101501] = {
		description = "当狂狮·塞赫麦特装备时，获得以下效果。\n进入修正模式时，重置<color=#297DE0>「刃爪噬敌」</color>的冷却时间，神能恢复至满值。\n<color=#297DE0>「刃爪噬敌」</color>对敌人附加的每层物理属性抗性降低改变为<color=#E78300>{1}%</color>。\n<color=#297DE0>「噬敌利爪」</color>命中瞬间基础伤害提高<color=#E78300>{2}%</color>。\n施放奥义或连携奥义时，全队伍物理攻击命中瞬间会心率提高<color=#E78300>{3}%</color>，持续<color=#E78300>12</color>秒。",
		maxLv = 0,
		type = 0,
		id = 500101501,
		param = {
			{
				"0",
				"5",
				"16",
				"10"
			},
			{
				"0",
				"5",
				"20",
				"12.5"
			},
			{
				"0",
				"5",
				"24",
				"15"
			},
			{
				"0",
				"5",
				"28",
				"17.5"
			},
			{
				"0",
				"5",
				"32",
				"20"
			},
			{
				"0",
				"5",
				"36",
				"22.5"
			},
			{
				"0",
				"5",
				"40",
				"25"
			}
		},
		extra_param = {
			"0",
			"5",
			"16%/20%/24%/28%/32%/36%/40",
			"10%/12.5%/15%/17.5%/20%/22.5%/25"
		}
	},
	[500101601] = {
		description = "当荒獠·金固装备时，获得以下效果。\n<color=#297DE0>「突击战术」</color>的电锯模式可以打断<color=#297DE0>「高压回旋斩」</color>的举剑动作并直接使用荒獠切割敌人。\n施放<color=#297DE0>「突击战术」</color>的电锯模式时，获得霸体效果；命中时，物理属性伤害提高<color=#E78300>{1}%</color>，持续<color=#E78300>{2}</color>秒。\n处于修正模式时，施放<color=#297DE0>「突击战术」</color>、<color=#297DE0>「攻坚战术」</color>的电锯模式时每消耗<color=#E78300>25</color>点神能该技能技能伤害提高<color=#E78300>10%</color>。",
		maxLv = 0,
		type = 0,
		id = 500101601,
		param = {
			{
				"0",
				"12",
				"12"
			},
			{
				"0",
				"15",
				"12"
			},
			{
				"0",
				"18",
				"12"
			},
			{
				"0",
				"21",
				"12"
			},
			{
				"0",
				"24",
				"12"
			},
			{
				"0",
				"27",
				"12"
			},
			{
				"0",
				"30",
				"12"
			}
		},
		extra_param = {
			"0",
			"12%/15%/18%/21%/24%/27%/30",
			"12"
		}
	},
	[500101701] = {
		description = "当灵猫·芭丝特装备时，获得以下效果。\n自身护甲穿透提高<color=#E78300>{1}%</color>、会心伤害提高<color=#E78300>{3}%</color>，从敌人背后攻击时命中瞬间会心率提高<color=#E78300>100%</color>。\n施放<color=#297DE0>「猫神的愚弄」</color>时进入<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(101703)>「夜影」</material></color>状态，隐匿身形持续<color=#E78300>9</color>秒。\n<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(101703)>「夜影」</material></color>：移动速度提高<color=#E78300>20%</color>，命中时仅<color=#E78300>1</color>次命中瞬间独立伤害提高<color=#E78300>{2}%</color>，命中后或者受到伤害时退出<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(101703)>「夜影」</material></color>状态。",
		maxLv = 0,
		type = 0,
		id = 500101701,
		param = {
			{
				"0",
				"20",
				"20",
				"20"
			},
			{
				"0",
				"25",
				"25",
				"20"
			},
			{
				"0",
				"30",
				"30",
				"20"
			},
			{
				"0",
				"35",
				"35",
				"20"
			},
			{
				"0",
				"40",
				"40",
				"20"
			},
			{
				"0",
				"45",
				"45",
				"20"
			},
			{
				"0",
				"50",
				"50",
				"20"
			}
		},
		extra_param = {
			"0",
			"20%/25%/30%/35%/40%/45%/50",
			"20%/25%/30%/35%/40%/45%/50",
			"20"
		}
	},
	[500101901] = {
		description = "当疾风之枪·休装备时，获得以下效果。\n技能三<color=#297DE0>「破势」</color>改变为<color=#297DE0>「破军」</color>。\n对前方目标造成大范围突刺伤害。当<color=#297DE0>「破军」</color>命中的敌人数量为<color=#E78300>1</color>时，命中瞬间会心率提高<color=#E78300>{1}%</color>、会心伤害提高<color=#E78300>{2}%</color>。",
		maxLv = 0,
		type = 0,
		id = 500101901,
		param = {
			{
				"0",
				"16",
				"16"
			},
			{
				"0",
				"20",
				"20"
			},
			{
				"0",
				"24",
				"24"
			},
			{
				"0",
				"28",
				"28"
			},
			{
				"0",
				"32",
				"32"
			},
			{
				"0",
				"36",
				"36"
			},
			{
				"0",
				"40",
				"40"
			}
		},
		extra_param = {
			"0",
			"16%/20%/24%/28%/32%/36%/40",
			"16%/20%/24%/28%/32%/36%/40"
		}
	},
	[500102001] = {
		description = "当三相·梵天装备时，获得以下效果。\n众星神系修正者最终伤害提高<color=#E78300>{1}%</color>。\n<color=#297DE0>「初禅净天·湮灭」</color>命中时对敌人附加敌人的<color=#E78300>{2}%</color>生命值上限的无视防御的伤害，该效果每个敌人最多触发一次。\n神格<color=#297DE0>「破灭之神·璃伽」</color>获得额外的效果：处于<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(102002)>「毁灭」</material></color>时，攻击命中生命值低于<color=#E78300>{3}%</color>的普通敌人后，会直接击败敌人。\n神格<color=#297DE0>「创生之神·金卵」</color>获得额外的效果：给全队附加的攻击力提高效果改变为<color=#E78300>{4}%</color>，给敌人附加的全属性抗性降低效果改变为<color=#E78300>{5}%</color>。\n神格<color=#297DE0>「三相合一·破坏」</color>获得额外的效果：每次切换形态时，独立伤害提高<color=#E78300>{6}%</color>，持续<color=#E78300>{7}</color>秒。",
		maxLv = 0,
		type = 0,
		id = 500102001,
		param = {
			{
				"0",
				"5",
				"6",
				"15",
				"15",
				"15",
				"8",
				"20"
			},
			{
				"0",
				"7.5",
				"7",
				"18",
				"15",
				"15",
				"10",
				"20"
			},
			{
				"0",
				"10",
				"8",
				"21",
				"15",
				"15",
				"12",
				"20"
			},
			{
				"0",
				"12.5",
				"9",
				"24",
				"15",
				"15",
				"14",
				"20"
			},
			{
				"0",
				"15",
				"10",
				"27",
				"15",
				"15",
				"16",
				"20"
			},
			{
				"0",
				"17.5",
				"11",
				"30",
				"15",
				"15",
				"18",
				"20"
			},
			{
				"0",
				"20",
				"12",
				"33",
				"15",
				"15",
				"20",
				"20"
			}
		},
		extra_param = {
			"0",
			"5%/7.5%/10%/12.5%/15%/17.5%/20",
			"6%/7%/8%/9%/10%/11%/12",
			"15%/18%/21%/24%/27%/30%/33",
			"15",
			"15",
			"8%/10%/12%/14%/16%/18%/20",
			"20"
		}
	},
	[500102101] = {
		description = "当曦光·阿尔忒弥斯装备时，获得以下效果。\n独立伤害提高<color=#E78300>{1}%</color>。\n<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(102101)>「辉音」</material></color>获得率提高<color=#E78300>100%</color>。\n处于<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(102102)>「朝晖」</material></color>状态时，受到的伤害降低<color=#E78300>{2}%</color>；施放每段特殊普通攻击命中后恢复自身<color=#E78300>{3}%</color>攻击力的生命值。\n处于<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(102104)>「奏鸣曲」</material></color>状态时，队友全属性伤害提高<color=#E78300>{4}%</color>、独立伤害提高<color=#E78300>{5}%</color>。",
		maxLv = 0,
		type = 0,
		id = 500102101,
		param = {
			{
				"0",
				"12",
				"50",
				"15",
				"8",
				"10"
			},
			{
				"0",
				"15",
				"50",
				"15",
				"10",
				"10"
			},
			{
				"0",
				"18",
				"50",
				"15",
				"12",
				"10"
			},
			{
				"0",
				"21",
				"50",
				"15",
				"14",
				"10"
			},
			{
				"0",
				"24",
				"50",
				"15",
				"16",
				"10"
			},
			{
				"0",
				"27",
				"50",
				"15",
				"18",
				"10"
			},
			{
				"0",
				"30",
				"50",
				"15",
				"20",
				"10"
			}
		},
		extra_param = {
			"0",
			"12%/15%/18%/21%/24%/27%/30",
			"50",
			"15",
			"8%/10%/12%/14%/16%/18%/20",
			"10"
		}
	},
	[500102201] = {
		description = "当幽月·塞勒涅装备时，获得以下效果。\n不处于<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(102207)>「满月幽幕」</material></color>状态，每获得<color=#E78300>20</color>点<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(102203)>「月相」</material></color>时，独立伤害提高<color=#E78300>{1}%</color>，持续<color=#E78300>{2}</color>秒，最多可叠加<color=#E78300>5</color>层；处于<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(102207)>「满月幽幕」</material></color>状态时，每层独立伤害提高改变为<color=#E78300>{3}%</color>，效果持续时间改变为持续至退出<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(102207)>「满月幽幕」</material></color>状态。\n<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(102208)>「新月月华」</material></color>和<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(102209)>「满月皓光」</material></color>的范围扩大至全场。\n处于<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(102201)>「新月」</material></color>触发闪避效果时，恢复自身<color=#E78300>{4}%</color>的生命值。\n暗属性修正者队友施放奥义或连携奥义后，获得<color=#E78300>35%</color>的奥义值。",
		maxLv = 0,
		type = 0,
		id = 500102201,
		param = {
			{
				"0",
				"2",
				"8",
				"4",
				"15"
			},
			{
				"0",
				"2.5",
				"8",
				"5",
				"15"
			},
			{
				"0",
				"3",
				"8",
				"6",
				"15"
			},
			{
				"0",
				"3.5",
				"8",
				"7",
				"15"
			},
			{
				"0",
				"4",
				"8",
				"8",
				"15"
			},
			{
				"0",
				"4.5",
				"8",
				"9",
				"15"
			},
			{
				"0",
				"5",
				"8",
				"10",
				"15"
			}
		},
		extra_param = {
			"0",
			"2%/2.5%/3%/3.5%/4%/4.5%/5",
			"8",
			"4%/5%/6%/7%/8%/9%/10",
			"15"
		}
	},
	[500102401] = {
		description = "当胡狼·阿努比斯装备时，获得以下效果。\n<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(102401)>「狼魂」</material></color>自动攻击时，有<color=#E78300>50%</color>的概率施放特殊攻击，特殊攻击有三段分别造成共计<color=#E78300>{1}%、{6}%</color>（技能三每提升一级<color=#E78300>+{7}%</color>）<color=#E78300>、{8}%</color>（技能二每提升一级<color=#E78300>+{9}%</color>）攻击力的暗属性伤害，并对命中的敌人附加眩晕状态，持续<color=#E78300>{2}</color>秒。\n施放<color=#297DE0>「狼魂疾突」</color>时，<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(102401)>「狼魂」</material></color>的协同攻击会附带额外爆炸效果，对小范围敌人造成共计<color=#E78300>{3}%</color>（技能一每提升一级<color=#E78300>+{4}%</color>）攻击力的暗属性伤害。\n施放<color=#297DE0>「狼魂狂舞」</color>时，<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(102401)>「狼魂」</material></color>的协同攻击会改变为特殊攻击。\n施放<color=#297DE0>「狼魂凝视」</color>或<color=#297DE0>「狼魂狂斩」</color>时，<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(102401)>「狼魂」</material></color>会根据其与其锁定的敌人的距离，选择施放协同攻击或特殊攻击。\n特殊攻击命中瞬间伤害提高<color=#E78300>{5}%</color>。",
		maxLv = 0,
		type = 0,
		id = 500102401,
		param = {
			{
				"0",
				"1200",
				"4",
				"600",
				"15.4",
				"28",
				"600",
				"15.4",
				"600",
				"15.4"
			},
			{
				"0",
				"1200",
				"4",
				"600",
				"15.4",
				"35",
				"600",
				"15.4",
				"600",
				"15.4"
			},
			{
				"0",
				"1200",
				"4",
				"600",
				"15.4",
				"42",
				"600",
				"15.4",
				"600",
				"15.4"
			},
			{
				"0",
				"1200",
				"4",
				"600",
				"15.4",
				"49",
				"600",
				"15.4",
				"600",
				"15.4"
			},
			{
				"0",
				"1200",
				"4",
				"600",
				"15.4",
				"56",
				"600",
				"15.4",
				"600",
				"15.4"
			},
			{
				"0",
				"1200",
				"4",
				"600",
				"15.4",
				"63",
				"600",
				"15.4",
				"600",
				"15.4"
			},
			{
				"0",
				"1200",
				"4",
				"600",
				"15.4",
				"70",
				"600",
				"15.4",
				"600",
				"15.4"
			}
		},
		extra_param = {
			"0",
			"1200",
			"4",
			"600",
			"15.4",
			"28%/35%/42%/49%/56%/63%/70",
			"600",
			"15.4",
			"600",
			"15.4"
		}
	},
	[500102601] = {
		description = "当银臂·努阿达装备时，获得以下效果。\n满蓄力的<color=#297DE0>「炎弹之雨」</color>和满蓄力的<color=#297DE0>「地鸣爆弹」</color>技能伤害提高<color=#E78300>{3}%</color>。\n施放满蓄力的<color=#297DE0>「炎弹之雨」</color>或满蓄力的<color=#297DE0>「地鸣爆弹」</color>时，会对命中的敌人附加<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(102602)>「燎焰」</material></color>状态。对处于<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(102602)>「燎焰」</material></color>状态的敌人命中瞬间伤害提高<color=#E78300>{1}%</color>。\n施放满蓄力技能攻击处于<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(102602)>「燎焰」</material></color>状态的敌人时，会引爆并造成范围伤害，造成<color=#E78300>{2}%</color>攻击力的火属性伤害。",
		maxLv = 0,
		type = 0,
		id = 500102601,
		param = {
			{
				"0",
				"8",
				"770",
				"12"
			},
			{
				"0",
				"10",
				"770",
				"15"
			},
			{
				"0",
				"12",
				"770",
				"18"
			},
			{
				"0",
				"14",
				"770",
				"21"
			},
			{
				"0",
				"16",
				"770",
				"24"
			},
			{
				"0",
				"18",
				"770",
				"27"
			},
			{
				"0",
				"20",
				"770",
				"30"
			}
		},
		extra_param = {
			"0",
			"8%/10%/12%/14%/16%/18%/20",
			"770",
			"12%/15%/18%/21%/24%/27%/30"
		}
	},
	[500102701] = {
		description = "当低吹雪·利维坦装备时，获得以下效果。\n闪避<color=#297DE0>「凌雪折光」</color>改变为<color=#297DE0>「暴风反击」</color>。\n触发闪避效果后或在闪避效果未处于冷却状态时受身成功后<color=#E78300>3</color>秒内，点击普通攻击会使用重锚施放技能攻击，造成共计<color=#E78300>{3}%</color>攻击力的冰属性伤害，对命中的敌人附加冰冻状态，持续<color=#E78300>{2}</color>秒。\n受身时也可以获得闪避效果，并且不会使闪避效果进入冷却状态。\n<color=#297DE0>「暴风反击」</color>命中瞬间伤害提高<color=#E78300>{1}%</color>。",
		maxLv = 0,
		type = 0,
		id = 500102701,
		param = {
			{
				"0",
				"40",
				"2",
				"850"
			},
			{
				"0",
				"50",
				"2.2",
				"850"
			},
			{
				"0",
				"60",
				"2.5",
				"850"
			},
			{
				"0",
				"70",
				"2.8",
				"850"
			},
			{
				"0",
				"80",
				"3",
				"850"
			},
			{
				"0",
				"90",
				"3.2",
				"850"
			},
			{
				"0",
				"100",
				"3.5",
				"850"
			}
		},
		extra_param = {
			"0",
			"40%/50%/60%/70%/80%/90%/100",
			"2/2.2/2.5/2.8/3/3.2/3.5",
			"850"
		}
	},
	[500102801] = {
		description = "当轰雷·托尔装备时，获得以下效果。\n处于<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(102802)>「狂雷」</material></color>状态时，每次施放技能命中时都会产生一次落雷，对敌人造成<color=#E78300>{1}%</color>攻击力的雷属性伤害。使用<color=#297DE0>「妙尔尼尔」</color>每次施放非衍生技能命中时、使用<color=#297DE0>「雅恩格利佩尔」</color>每次施放最后一拳以外的技能攻击命中时，自身伤害提高<color=#E78300>{2}%</color>，持续<color=#E78300>{3}</color>秒，最多可叠加<color=#E78300>3</color>层。\n<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(102803)>「怒雷」</material></color>状态施放最后一拳时，每拥有<color=#E78300>1</color>层层数，该技能命中瞬间攻击力提高<color=#E78300>{5}%</color>，当拥有<color=#E78300>3</color>层层数时会视为拥有<color=#E78300>4</color>层层数。\n施放<color=#297DE0>「落雷击」</color>命中时，每拥有<color=#E78300>1</color>层层数，<color=#297DE0>「落雷击」</color>基础伤害提高<color=#E78300>{4}%</color>，当拥有<color=#E78300>3</color>层层数时会视为拥有<color=#E78300>4</color>层层数；<color=#297DE0>「落雷击」</color>结束后移除所有层数。",
		maxLv = 0,
		type = 0,
		id = 500102801,
		param = {
			{
				"0",
				"500",
				"10",
				"7",
				"12",
				"12"
			},
			{
				"0",
				"500",
				"10",
				"7",
				"15",
				"15"
			},
			{
				"0",
				"500",
				"10",
				"7",
				"18",
				"18"
			},
			{
				"0",
				"500",
				"10",
				"7",
				"21",
				"21"
			},
			{
				"0",
				"500",
				"10",
				"7",
				"24",
				"24"
			},
			{
				"0",
				"500",
				"10",
				"7",
				"27",
				"27"
			},
			{
				"0",
				"500",
				"10",
				"7",
				"30",
				"30"
			}
		},
		extra_param = {
			"0",
			"500",
			"10",
			"7",
			"12%/15%/18%/21%/24%/27%/30",
			"12%/15%/18%/21%/24%/27%/30"
		}
	},
	[500103201] = {
		description = "当熯天·提尔装备时，获得以下效果。\n普通攻击<color=#297DE0>「王棋闪击」</color>改变为<color=#297DE0>「王棋进军」</color>。\n巨剑类型是<color=#297DE0>「巨剑·皇后」</color>时，伤害提高<color=#E78300>{1}%</color>，改变普通攻击的攻击模式。",
		maxLv = 0,
		type = 0,
		id = 500103201,
		param = {
			{
				"0",
				"32",
				"317"
			},
			{
				"0",
				"40",
				"317"
			},
			{
				"0",
				"48",
				"317"
			},
			{
				"0",
				"56",
				"317"
			},
			{
				"0",
				"64",
				"317"
			},
			{
				"0",
				"72",
				"317"
			},
			{
				"0",
				"80",
				"317"
			}
		},
		extra_param = {
			"0",
			"32%/40%/48%/56%/64%/72%/80",
			"317"
		}
	},
	[500103301] = {
		description = "当启明·海姆达尔装备时，获得以下效果。\n技能三<color=#297DE0>「极境光域」</color>改变为<color=#297DE0>「极境神域」</color>。\n<color=#297DE0>「极境神域」</color>生成的<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(103301)>「真理之域」</material></color>持续时间延长<color=#E78300>2</color>秒、覆盖范围半径提高<color=#E78300>25%</color>。\n最后一次生成的<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(103301)>「真理之域」</material></color>范围内的队友每<color=#E78300>2</color>秒技能伤害提高<color=#E78300>{1}%</color>，持续<color=#E78300>{2}</color>秒，最多可叠加<color=#E78300>5</color>层。",
		maxLv = 0,
		type = 0,
		id = 500103301,
		param = {
			{
				"0",
				"8",
				"5"
			},
			{
				"0",
				"10",
				"5"
			},
			{
				"0",
				"12",
				"5"
			},
			{
				"0",
				"14",
				"5"
			},
			{
				"0",
				"16",
				"5"
			},
			{
				"0",
				"18",
				"5"
			},
			{
				"0",
				"20",
				"5"
			}
		},
		extra_param = {
			"0",
			"8%/10%/12%/14%/16%/18%/20",
			"5"
		}
	},
	[500103501] = {
		description = "当狂鳄·索贝克装备时，获得以下效果。\n<color=#297DE0>「圣河咆哮」</color>对附近敌人的攻击频率提高。\n攻击命中时，对命中的敌人附加水属性抗性降低<color=#E78300>{1}%</color>，持续<color=#E78300>{2}</color>秒。",
		maxLv = 0,
		type = 0,
		id = 500103501,
		param = {
			{
				"0",
				"12",
				"6"
			},
			{
				"0",
				"15",
				"6"
			},
			{
				"0",
				"18",
				"6"
			},
			{
				"0",
				"21",
				"6"
			},
			{
				"0",
				"24",
				"6"
			},
			{
				"0",
				"27",
				"6"
			},
			{
				"0",
				"30",
				"6"
			}
		},
		extra_param = {
			"0",
			"12%/15%/18%/21%/24%/27%/30",
			"6"
		}
	},
	[500103601] = {
		description = "当巴德尔装备时，获得以下效果。\n技能三<color=#297DE0>「破袭之矢」</color>改变为<color=#297DE0>「闪耀冲击」</color>。\n被动效果提供的伤害提高上限提高<color=#E78300>{1}%</color>。",
		maxLv = 0,
		type = 0,
		id = 500103601,
		param = {
			{
				"0",
				"12"
			},
			{
				"0",
				"15"
			},
			{
				"0",
				"18"
			},
			{
				"0",
				"21"
			},
			{
				"0",
				"24"
			},
			{
				"0",
				"27"
			},
			{
				"0",
				"30"
			}
		},
		extra_param = {
			"0",
			"12%/15%/18%/21%/24%/27%/30"
		}
	},
	[500103701] = {
		description = "当夜之寄生·霍德尔装备时，获得以下效果。\n技能三<color=#297DE0>「破袭之矢」</color>改变为<color=#297DE0>「幽离冲击」</color>。\n被动效果提供的伤害提高上限提高<color=#E78300>{1}%</color>。",
		maxLv = 0,
		type = 0,
		id = 500103701,
		param = {
			{
				"0",
				"12"
			},
			{
				"0",
				"15"
			},
			{
				"0",
				"18"
			},
			{
				"0",
				"21"
			},
			{
				"0",
				"24"
			},
			{
				"0",
				"27"
			},
			{
				"0",
				"30"
			}
		},
		extra_param = {
			"0",
			"12%/15%/18%/21%/24%/27%/30"
		}
	},
	[500103801] = {
		description = "当羽灼·赫拉装备时，获得以下效果。\n技能二<color=#297DE0>「炽拥」</color>改变为<color=#297DE0>「灼舞」</color>。\n<color=#297DE0>「灼舞」</color>对处于灼烧状态的敌人命中瞬间伤害提高<color=#E78300>{1}%</color>。",
		maxLv = 0,
		type = 0,
		id = 500103801,
		param = {
			{
				"0",
				"28"
			},
			{
				"0",
				"35"
			},
			{
				"0",
				"42"
			},
			{
				"0",
				"49"
			},
			{
				"0",
				"56"
			},
			{
				"0",
				"63"
			},
			{
				"0",
				"70"
			}
		},
		extra_param = {
			"0",
			"28%/35%/42%/49%/56%/63%/70"
		}
	},
	[500103901] = {
		description = "当潮音·波塞冬装备时，获得以下效果。\n技能一<color=#297DE0>「海之恩泽」</color>改变为<color=#297DE0>「苍澜鲸歌」</color>。\n施放<color=#297DE0>「苍澜鲸歌」</color>治疗自身或者队友时，自身或者队友对应的机制值获得率提高<color=#E78300>{1}%</color>，持续<color=#E78300>{2}</color>秒，并获得对应机制值（<color=#E78300>30</color>点怒气、<color=#E78300>30</color>点能量、<color=#E78300>1</color>个印记、<color=#E78300>30</color>点神能）。",
		maxLv = 0,
		type = 0,
		id = 500103901,
		param = {
			{
				"0",
				"12",
				"10"
			},
			{
				"0",
				"15",
				"10"
			},
			{
				"0",
				"18",
				"10"
			},
			{
				"0",
				"21",
				"10"
			},
			{
				"0",
				"24",
				"10"
			},
			{
				"0",
				"27",
				"10"
			},
			{
				"0",
				"30",
				"10"
			}
		},
		extra_param = {
			"0",
			"12%/15%/18%/21%/24%/27%/30",
			"10"
		}
	},
	[500104101] = {
		description = "当铃兰之弦·雅典娜装备时，获得以下效果。\n<color=#297DE0>「谐律音爆」</color>命中瞬间伤害提高<color=#E78300>{2}%</color>。\n处于<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(104101)>「鸣刃」</material></color>状态时，神能消耗改变为每<color=#E78300>0.{3}</color>秒消耗<color=#E78300>3</color>点神能。<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(104101)>「鸣刃」</material></color>状态期间，每段普通攻击判定成功并命中<color=#E78300>5</color>次后，进入<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(104104)>「完美谐律」</material></color>状态，持续<color=#E78300>{1}</color>秒。\n<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(104104)>「完美谐律」</material></color>：状态期间内获得硬直效果，不会开启<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(104102)>「谐律判定」</material></color>但每段普通攻击或每次施放技能都视为判定成功或完美判定成功，并且<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(104103)>「谐律」</material></color>层数都视为<color=#E78300>3、5、7</color>的倍数。",
		maxLv = 0,
		type = 0,
		id = 500104101,
		param = {
			{
				"0",
				"7",
				"12",
				"50"
			},
			{
				"0",
				"7",
				"15",
				"55"
			},
			{
				"0",
				"7",
				"18",
				"60"
			},
			{
				"0",
				"7",
				"21",
				"65"
			},
			{
				"0",
				"7",
				"24",
				"70"
			},
			{
				"0",
				"7",
				"27",
				"75"
			},
			{
				"0",
				"7",
				"30",
				"80"
			}
		},
		extra_param = {
			"0",
			"7",
			"12%/15%/18%/21%/24%/27%/30",
			"50/55/60/65/70/75/80"
		}
	},
	[500104201] = {
		description = "当操偶师·哈迪斯装备时，获得以下效果。\n处于<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(104203)>「共舞」</material></color>状态时的固定伤害改变为<color=#E78300>{2}</color>。\n处于<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(104203)>「共舞」</material></color>状态时，琉刻和明塔在进行协同攻击时会在敌人的位置上形成三个由大量冥丝聚集形成的锋利圆环，造成共计<color=#E78300>{1}%</color>攻击力的暗属性伤害。",
		maxLv = 0,
		type = 0,
		id = 500104201,
		param = {
			{
				"0",
				"1200",
				"8000"
			},
			{
				"0",
				"1200",
				"10000"
			},
			{
				"0",
				"1200",
				"12000"
			},
			{
				"0",
				"1200",
				"14000"
			},
			{
				"0",
				"1200",
				"16000"
			},
			{
				"0",
				"1200",
				"18000"
			},
			{
				"0",
				"1200",
				"20000"
			}
		},
		extra_param = {
			"0",
			"1200",
			"8000/10000/12000/14000/16000/18000/20000"
		}
	},
	[500104802] = {
		description = "当彗光·前鬼坊天狗装备时，获得以下效果。\n技能一<color=#297DE0>「定点打击」</color>改变为<color=#297DE0>「多轮轰炸」</color>。\n<color=#297DE0>「多轮轰炸」</color>的轰炸次数增加，后续轰炸对同一个敌人伤害衰减<color=#E78300>{1}%</color>。",
		maxLv = 0,
		type = 0,
		id = 500104802,
		param = {
			{
				"0",
				"64"
			},
			{
				"0",
				"55"
			},
			{
				"0",
				"46"
			},
			{
				"0",
				"37"
			},
			{
				"0",
				"28"
			},
			{
				"0",
				"19"
			},
			{
				"0",
				"10"
			}
		},
		extra_param = {
			"0",
			"64%/55%/46%/37%/28%/19%/10"
		}
	},
	[500104901] = {
		description = "当镜花黄泉·伊邪那美装备时，获得以下效果。\n技能一、二基础伤害提高<color=#E78300>{1}%</color>。\n获得<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(104902)>「镜游」</material></color>时，恢复自身<color=#E78300>{2}%</color>的生命值。\n神格<color=#297DE0>「常世冰镜·冰凝」</color>激活时，处于修正模式时不再触发该神格效果，并且处于修正模式自身每次攻击命中时，对不处于冰冻状态的敌人附加冰冻状态，持续至修正模式结束；自身攻击每命中处于冰冻状态的敌人<color=#E78300>5</color>次时，移除敌人的冰冻状态，同时触发一次额外的技能攻击，造成共计<color=#E78300>{3}%</color>攻击力的冰属性伤害。\n通过闪避<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(104901)>「冰镜」</material></color>破碎触发闪避效果后<color=#E78300>19</color>秒内，下<color=#E78300>4</color>次<color=#297DE0>「碎镜·冥」</color>的命中瞬间攻击力提高<color=#E78300>{4}%</color>。通过<color=#297DE0>「彼岸·千引」</color>格挡<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(104901)>「冰镜」</material></color>破碎触发闪避效果后<color=#E78300>19</color>秒内，下<color=#E78300>4</color>次<color=#297DE0>「碎镜·幽」</color>命中瞬间攻击力提高<color=#E78300>{4}%</color>。",
		maxLv = 0,
		type = 0,
		id = 500104901,
		param = {
			{
				"0",
				"28",
				"4",
				"700",
				"8"
			},
			{
				"0",
				"35",
				"5",
				"700",
				"10"
			},
			{
				"0",
				"42",
				"6",
				"700",
				"12"
			},
			{
				"0",
				"49",
				"7",
				"700",
				"14"
			},
			{
				"0",
				"56",
				"8",
				"700",
				"16"
			},
			{
				"0",
				"63",
				"9",
				"700",
				"18"
			},
			{
				"0",
				"70",
				"10",
				"700",
				"20"
			}
		},
		extra_param = {
			"0",
			"28%/35%/42%/49%/56%/63%/70",
			"4%/5%/6%/7%/8%/9%/10",
			"700",
			"8%/10%/12%/14%/16%/18%/20"
		}
	},
	[500105001] = {
		description = "当真红·丰前坊天狗装备时，获得以下效果。\n技能二<color=#297DE0>「绯·云水」</color>改变为<color=#297DE0>「绯·苍星」</color>。\n十字刀光飞行一段距离，命中时会额外获得<color=#E78300>1</color>个印记，并对命中的敌人附加破甲状态，防御力降低<color=#E78300>{1}%</color>，持续<color=#E78300>6</color>秒。",
		maxLv = 0,
		type = 0,
		id = 500105001,
		param = {
			{
				"0",
				"16"
			},
			{
				"0",
				"20"
			},
			{
				"0",
				"24"
			},
			{
				"0",
				"28"
			},
			{
				"0",
				"32"
			},
			{
				"0",
				"36"
			},
			{
				"0",
				"40"
			}
		},
		extra_param = {
			"0",
			"16%/20%/24%/28%/32%/36%/40"
		}
	},
	[500105201] = {
		description = "当怒蛇·马尔杜克装备时，获得以下效果。\n当队友施放技能或奥义时，会随机呼叫自身<color=#297DE0>「快速反应战术」</color>或<color=#297DE0>「优势围歼战术」</color>相对应的无人机，造成对应的物理属性伤害，全队伍额外攻击力提高<color=#E78300>{1}</color>，持续<color=#E78300>18</color>秒，该效果所提供的额外攻击力最高为<color=#E78300>{2}</color>；每个队友呼叫的两种无人机分别有<color=#E78300>{3}</color>秒的冷却时间。\n<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(105203)>「凶风模式」</material></color>：队友呼叫该模式无人机时能量消耗降低<color=#E78300>{8}%</color>，持续<color=#E78300>{5}</color>秒；全队伍技能二基础伤害提高<color=#E78300>{9}%</color>，持续<color=#E78300>{5}</color>秒，最多可叠加<color=#E78300>2</color>层。\n<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(105204)>「恶风模式」</material></color>：队友呼叫该模式无人机时能量获得率提高<color=#E78300>{6}%</color>，持续<color=#E78300>{5}</color>秒；全队伍技能三基础伤害提高<color=#E78300>{7}%</color>，持续<color=#E78300>{5}</color>秒，最多可叠加<color=#E78300>2</color>层。\n<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(105205)>「旋风模式」</material></color>：队友呼叫该模式无人机时，根据其队友的属性种类和数量，分别对敌人附加对应属性抗性降低<color=#E78300>{4}%</color>的效果，持续<color=#E78300>{5}</color>秒，相同的效果最多可叠加<color=#E78300>2</color>层，该效果可以与自身呼叫的<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(105205)>「旋风模式」</material></color>无人机的属性抗性降低效果叠加。\n<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(105206)>「飓风模式」</material></color>：队友呼叫该模式无人机时会心率提高<color=#E78300>{10}%</color>，持续<color=#E78300>{5}</color>秒，当效果持续期间进入零时空间时，会刷新持续时间并将会心率提高的效果共享给其队友，最多可叠加<color=#E78300>2</color>层。",
		maxLv = 0,
		type = 0,
		id = 500105201,
		param = {
			{
				"0",
				"180",
				"1080",
				"20",
				"5",
				"12",
				"10",
				"5",
				"10",
				"5",
				"5"
			},
			{
				"0",
				"180",
				"1260",
				"19",
				"5",
				"12",
				"10",
				"5",
				"10",
				"5",
				"5"
			},
			{
				"0",
				"180",
				"1440",
				"18",
				"5",
				"12",
				"10",
				"5",
				"10",
				"5",
				"5"
			},
			{
				"0",
				"180",
				"1620",
				"17",
				"5",
				"12",
				"10",
				"5",
				"10",
				"5",
				"5"
			},
			{
				"0",
				"180",
				"1800",
				"16",
				"5",
				"12",
				"10",
				"5",
				"10",
				"5",
				"5"
			},
			{
				"0",
				"180",
				"1980",
				"15",
				"5",
				"12",
				"10",
				"5",
				"10",
				"5",
				"5"
			},
			{
				"0",
				"180",
				"2160",
				"14",
				"5",
				"12",
				"10",
				"5",
				"10",
				"5",
				"5"
			}
		},
		extra_param = {
			"0",
			"180",
			"1080/1260/1440/1620/1800/1980/2160",
			"20/19/18/17/16/15/14",
			"5",
			"12",
			"10",
			"5",
			"10",
			"5",
			"5"
		}
	},
	[500105501] = {
		description = "当霜影·暗御津羽装备时，获得以下效果。\n技能三基础伤害提高<color=#E78300>{1}%</color>。\n全队伍冰属性攻击命中处于<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(105501)>「霜结」</material></color>状态的敌人时，每有<color=#E78300>1</color>层命中瞬间会心率额外提高<color=#E78300>{2}%</color>。\n衔接施放的<color=#297DE0>「破霜击」</color>附加的冰属性抗性额外降低<color=#E78300>{3}%</color>；神格<color=#297DE0>「神之血的霜结·寒影」</color>的<color=#297DE0>「霜影击」</color>造成会心后附加的冰属性抗性额外降低<color=#E78300>{4}%</color>。\n进入修正模式时，清除敌人全部控制抗性和控制抗性点数；处于修正模式时，每次敌人被附加控制状态时，会清除控制抗性点数并额外产生一次霜爆，造成共计<color=#E78300>{5}%</color>攻击力的冰属性伤害，每次修正模式最多触发<color=#E78300>3</color>次。\n衔接施放的<color=#297DE0>「破霜击」</color>、<color=#297DE0>「霜影击」</color>每命中敌人<color=#E78300>1</color>次，自身伤害提高<color=#E78300>{6}%</color>，持续<color=#E78300>{7}</color>秒，最多可叠加<color=#E78300>3</color>层。",
		maxLv = 0,
		type = 0,
		id = 500105501,
		param = {
			{
				"0",
				"16",
				"0.4",
				"4",
				"10",
				"500",
				"6",
				"6"
			},
			{
				"0",
				"20",
				"0.5",
				"5",
				"12.5",
				"500",
				"7.5",
				"6"
			},
			{
				"0",
				"24",
				"0.6",
				"6",
				"15",
				"500",
				"9",
				"6"
			},
			{
				"0",
				"28",
				"0.7",
				"7",
				"17.5",
				"500",
				"10.5",
				"6"
			},
			{
				"0",
				"32",
				"0.8",
				"8",
				"20",
				"500",
				"12",
				"6"
			},
			{
				"0",
				"36",
				"0.9",
				"9",
				"22.5",
				"500",
				"13.5",
				"6"
			},
			{
				"0",
				"40",
				"1",
				"10",
				"25",
				"500",
				"15",
				"6"
			}
		},
		extra_param = {
			"0",
			"16%/20%/24%/28%/32%/36%/40",
			"0.4%/0.5%/0.6%/0.7%/0.8%/0.9%/1",
			"4%/5%/6%/7%/8%/9%/10",
			"10%/12.5%/15%/17.5%/20%/22.5%/25",
			"500",
			"6%/7.5%/9%/10.5%/12%/13.5%/15",
			"6"
		}
	},
	[500105601] = {
		description = "当雷獠·伽梨装备时，获得以下效果。\n出场时、自身触发闪避效果时、进入修正模式时，获得一次强化效果。\n每次施放强化效果时，攻击力提高<color=#E78300>{1}%</color>，持续<color=#E78300>{2}</color>秒，最多可叠加<color=#E78300>4</color>层。\n强化的<color=#297DE0>「神怒·雷织」</color>连点进行额外踢击时、强化的<color=#297DE0>「神怒·千雳」</color>蓄力时，闪避不会打断踢击和蓄力，之后点击技能会继续踢击和蓄力。",
		maxLv = 0,
		type = 0,
		id = 500105601,
		param = {
			{
				"0",
				"4",
				"5"
			},
			{
				"0",
				"5",
				"5"
			},
			{
				"0",
				"6",
				"5"
			},
			{
				"0",
				"7",
				"5"
			},
			{
				"0",
				"8",
				"5"
			},
			{
				"0",
				"9",
				"5"
			},
			{
				"0",
				"10",
				"5"
			}
		},
		extra_param = {
			"0",
			"4%/5%/6%/7%/8%/9%/10",
			"5"
		}
	},
	[500105801] = {
		description = "当龙切·迦具土装备时，获得以下效果。\n受击时，攻击力提高<color=#E78300>{1}%</color>，持续<color=#E78300>{2}</color>秒，最多可叠加<color=#E78300>3</color>层。\n施放<color=#297DE0>「绯狱舞炎·改」</color>时会施放焰浪，对沿途的敌人造成<color=#E78300>{3}%</color>攻击力的火属性伤害；<color=#297DE0>「绯狱舞炎·改」</color>命中多个敌人时会额外获得能量。\n焰浪命中瞬间伤害提高<color=#E78300>{4}%</color>。",
		maxLv = 0,
		type = 0,
		id = 500105801,
		param = {
			{
				"0",
				"12",
				"7",
				"255",
				"24"
			},
			{
				"0",
				"15",
				"7",
				"255",
				"30"
			},
			{
				"0",
				"18",
				"7",
				"255",
				"36"
			},
			{
				"0",
				"21",
				"7",
				"255",
				"42"
			},
			{
				"0",
				"24",
				"7",
				"255",
				"48"
			},
			{
				"0",
				"27",
				"7",
				"255",
				"54"
			},
			{
				"0",
				"30",
				"7",
				"255",
				"60"
			}
		},
		extra_param = {
			"0",
			"12%/15%/18%/21%/24%/27%/30",
			"7",
			"255",
			"24%/30%/36%/42%/48%/54%/60"
		}
	},
	[500105901] = {
		description = "当光煌·阿波罗装备时，获得以下效果。\n被动效果中命中次数条件减少<color=#E78300>{1}</color>次。\n自身造成会心时获得<color=#E78300>1</color>点能量，并有<color=#E78300>{2}%</color>的概率重置<color=#297DE0>「辉光交错」</color>的冷却时间。",
		maxLv = 0,
		type = 0,
		id = 500105901,
		param = {
			{
				"0",
				"6",
				"12"
			},
			{
				"0",
				"7",
				"14"
			},
			{
				"0",
				"8",
				"16"
			},
			{
				"0",
				"9",
				"18"
			},
			{
				"0",
				"10",
				"20"
			},
			{
				"0",
				"11",
				"22"
			},
			{
				"0",
				"12",
				"24"
			}
		},
		extra_param = {
			"0",
			"6/7/8/9/10/11/12",
			"12%/14%/16%/18%/20%/22%/24"
		}
	},
	[500106001] = {
		description = "当九司·陆吾装备时，获得以下效果。\n技能三基础伤害提高<color=#E78300>{1}%</color>。\n处于<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(106001)>「枪阵」</material></color>范围内时，<color=#297DE0>「崩枪式」</color>改变为<color=#297DE0>「崩山式」</color>。\n当自身不处于<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(106001)>「枪阵」</material></color>范围内，施放<color=#297DE0>「反戈一击」</color>、<color=#297DE0>「游虎啸岩」</color>时，<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(106001)>「枪阵」</material></color>会移动到身边。\n第一次<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(106001)>「枪阵」</material></color>关闭时，恢复<color=#E78300>{5}</color>点怒气。\n<color=#297DE0>「破军枪阵·九」</color>对精英和首领敌人命中瞬间会心伤害提高<color=#E78300>{2}%</color>。\n开启<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(106001)>「枪阵」</material></color>时，独立伤害提高<color=#E78300>{3}%</color>，持续<color=#E78300>{4}</color>秒。",
		maxLv = 0,
		type = 0,
		id = 500106001,
		param = {
			{
				"0",
				"18",
				"12",
				"5",
				"12",
				"24"
			},
			{
				"0",
				"27",
				"18",
				"7.5",
				"12",
				"30"
			},
			{
				"0",
				"36",
				"24",
				"10",
				"12",
				"36"
			},
			{
				"0",
				"45",
				"30",
				"12.5",
				"12",
				"42"
			},
			{
				"0",
				"54",
				"36",
				"15",
				"12",
				"48"
			},
			{
				"0",
				"63",
				"42",
				"17.5",
				"12",
				"54"
			},
			{
				"0",
				"72",
				"48",
				"20",
				"12",
				"60"
			}
		},
		extra_param = {
			"0",
			"18%/27%/36%/45%/54%/63%/72",
			"12%/18%/24%/30%/36%/42%/48",
			"5%/7.5%/10%/12.5%/15%/17.5%/20",
			"12",
			"24/30/36/42/48/54/60"
		}
	},
	[500106101] = {
		description = "当玄机·执明装备时，获得以下效果。\n独立伤害提高<color=#E78300>{1}%</color>。\n技能三基础伤害提高<color=#E78300>{2}%</color>。\n第一次施放奥义或连携奥义时，<color=#297DE0>「真武参悟」</color>替换为<color=#297DE0>「超阶演算」</color>；之后每施放<color=#E78300>2</color>次奥义或连携奥义，<color=#297DE0>「真武参悟」</color>替换为<color=#297DE0>「超阶演算」</color>。\n神能上限增加<color=#E78300>20</color>点，每<color=#E78300>4</color>秒恢复<color=#E78300>{3}</color>点神能；开启<color=#297DE0>「演算」</color>时，恢复<color=#E78300>{4}</color>点神能；开启<color=#297DE0>「超阶演算」</color>时，恢复<color=#E78300>{5}</color>点神能。",
		maxLv = 0,
		type = 0,
		id = 500106101,
		param = {
			{
				"0",
				"8",
				"28",
				"4",
				"40",
				"40"
			},
			{
				"0",
				"10",
				"35",
				"5",
				"40",
				"50"
			},
			{
				"0",
				"12",
				"42",
				"6",
				"40",
				"60"
			},
			{
				"0",
				"14",
				"49",
				"7",
				"40",
				"70"
			},
			{
				"0",
				"16",
				"56",
				"8",
				"40",
				"80"
			},
			{
				"0",
				"18",
				"63",
				"9",
				"40",
				"90"
			},
			{
				"0",
				"20",
				"70",
				"10",
				"40",
				"100"
			}
		},
		extra_param = {
			"0",
			"8%/10%/12%/14%/16%/18%/20",
			"28%/35%/42%/49%/56%/63%/70",
			"4/5/6/7/8/9/10",
			"40",
			"40/50/60/70/80/90/100"
		}
	},
	[500106601] = {
		description = "当早樱·大国主装备时，获得以下效果。\n技能三<color=#297DE0>「兔兔扫射」</color>改变为<color=#297DE0>「兔兔出击」</color>。\n召唤兔兔机器人，自动攻击并拉扯周围的目标。<color=#297DE0>「兔兔出击」</color>命中瞬间基础伤害提高<color=#E78300>{2}%</color>，拉扯半径提高<color=#E78300>{1}%</color>。",
		maxLv = 0,
		type = 0,
		id = 500106601,
		param = {
			{
				"0",
				"20",
				"16"
			},
			{
				"0",
				"40",
				"20"
			},
			{
				"0",
				"60",
				"24"
			},
			{
				"0",
				"80",
				"28"
			},
			{
				"0",
				"100",
				"32"
			},
			{
				"0",
				"120",
				"36"
			},
			{
				"0",
				"140",
				"40"
			}
		},
		extra_param = {
			"0",
			"20%/40%/60%/80%/100%/120%/140",
			"16%/20%/24%/28%/32%/36%/40"
		}
	},
	[500106701] = {
		description = "当流转之洋·欧申纳斯装备时，获得以下效果。\n会心率提高<color=#E78300>10%</color>。\n每段普通攻击命中和每次施放技能会累积连段层数，当连段层数满、停止连段或连段被中止时，会生成一个短暂的幻影对锁定敌人连续发动等同于连段层数的次数的攻击，幻影发动攻击期间不可累积连段层数，当剩余连段层数不满足幻影攻击的消耗时会消耗剩余的连段层数发动攻击；每段普通攻击命中累积<color=#E78300>1</color>层、每次施放技能或极限闪避后的技能累积<color=#E78300>5</color>层，最多累积<color=#E78300>20</color>层；攻击造成<color=#E78300>100%</color>攻击力的水属性伤害，每消耗<color=#E78300>1</color>层连段层数，该效果命中瞬间伤害提高<color=#E78300>{1}%</color>。",
		maxLv = 0,
		type = 0,
		id = 500106701,
		param = {
			{
				"0",
				"6"
			},
			{
				"0",
				"7.5"
			},
			{
				"0",
				"9"
			},
			{
				"0",
				"10.5"
			},
			{
				"0",
				"12"
			},
			{
				"0",
				"13.5"
			},
			{
				"0",
				"15"
			}
		},
		extra_param = {
			"0",
			"6%/7.5%/9%/10.5%/12%/13.5%/15"
		}
	},
	[500106801] = {
		description = "当沐风·恩利尔装备时，获得以下效果。\n每次获得<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(106801)>「风铃」</material></color>标记时，伤害提高<color=#E78300>{1}%</color>，持续<color=#E78300>{2}</color>秒，最多可叠加<color=#E78300>3</color>层。\n施放未强化的<color=#297DE0>「风元异变」</color>也会获得<color=#E78300>1</color>个<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(106801)>「风铃」</material></color>标记。\n施放强化的<color=#297DE0>「风元异变」</color>结束后，会获得施放未强化的<color=#297DE0>「风元异变」</color>的技能强化效果。",
		maxLv = 0,
		type = 0,
		id = 500106801,
		param = {
			{
				"0",
				"6",
				"5"
			},
			{
				"0",
				"7.5",
				"5"
			},
			{
				"0",
				"9",
				"5"
			},
			{
				"0",
				"10.5",
				"5"
			},
			{
				"0",
				"12",
				"5"
			},
			{
				"0",
				"13.5",
				"5"
			},
			{
				"0",
				"15",
				"5"
			}
		},
		extra_param = {
			"0",
			"6%/7.5%/9%/10.5%/12%/13.5%/15",
			"5"
		}
	},
	[500107001] = {
		description = "当十曜·金乌装备时，获得以下效果。\n腾空或者回到地面时获得<color=#E78300>{4}</color>个<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(107001)>「曜」</material></color>标记。\n处于<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(107003)>「日凌」</material></color>状态的<color=#297DE0>「蓬莱剑法」</color>获得<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(107001)>「曜」</material></color>标记的命中敌人次数条件减少至<color=#E78300>3</color>次。\n<color=#297DE0>「伏魔焚灭」</color>不再需要消耗<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(107001)>「曜」</material></color>标记。\n每次满标记时，会心率提高<color=#E78300>{1}%</color>、神能上限增加<color=#E78300>{2}</color>点、神能获得率提高<color=#E78300>{3}%</color>，最多可叠加<color=#E78300>9</color>层。",
		maxLv = 0,
		type = 0,
		id = 500107001,
		param = {
			{
				"0",
				"3",
				"5",
				"5",
				"3"
			},
			{
				"0",
				"3.5",
				"6",
				"6",
				"4"
			},
			{
				"0",
				"4",
				"7",
				"7",
				"5"
			},
			{
				"0",
				"4.5",
				"8",
				"8",
				"6"
			},
			{
				"0",
				"5",
				"9",
				"9",
				"7"
			},
			{
				"0",
				"5.5",
				"10",
				"10",
				"8"
			},
			{
				"0",
				"6",
				"11",
				"11",
				"9"
			}
		},
		extra_param = {
			"0",
			"3%/3.5%/4%/4.5%/5%/5.5%/6",
			"5/6/7/8/9/10/11",
			"5%/6%/7%/8%/9%/10%/11",
			"3/4/5/6/7/8/9"
		}
	},
	[500107101] = {
		description = "当青君·孟章装备时，获得以下效果。\n风属性伤害提高<color=#E78300>{1}%</color>。\n通过被动获得的属性伤害提高效果提高，每有<color=#E78300>1%</color>属性伤害提高，另外一个属性伤害额外提高<color=#E78300>{2}%</color>。\n受到自身或者队友风属性攻击的敌人在<color=#E78300>0.3</color>秒内受到自身雷属性攻击命中时，对命中的敌人附加雷属性抗性降低<color=#E78300>{3}%</color>、风属性抗性降低<color=#E78300>{4}%</color>，持续<color=#E78300>{5}</color>秒，该效果每<color=#E78300>3</color>秒最多触发一次。\n攻击命中处于雷属性抗性降低状态的敌人时命中瞬间会心率提高，数值等同于雷属性抗性降低的<color=#E78300>80%</color>，该效果提供的会心率提高最高为<color=#E78300>16%</color>。\n攻击命中处于风属性抗性降低状态的敌人时命中瞬间会心伤害提高，数值等同于风属性抗性降低的<color=#E78300>160%</color>，该效果提供的会心伤害提高最高为<color=#E78300>32%</color>。",
		maxLv = 0,
		type = 0,
		id = 500107101,
		param = {
			{
				"0",
				"8",
				"0.1",
				"5",
				"5",
				"4"
			},
			{
				"0",
				"12",
				"0.2",
				"7.5",
				"7.5",
				"4"
			},
			{
				"0",
				"16",
				"0.3",
				"10",
				"10",
				"4"
			},
			{
				"0",
				"20",
				"0.4",
				"12.5",
				"12.5",
				"4"
			},
			{
				"0",
				"24",
				"0.5",
				"15",
				"15",
				"4"
			},
			{
				"0",
				"28",
				"0.6",
				"17.5",
				"17.5",
				"4"
			},
			{
				"0",
				"32",
				"0.7",
				"20",
				"20",
				"4"
			}
		},
		extra_param = {
			"0",
			"8%/12%/16%/20%/24%/28%/32",
			"0.1%/0.2%/0.3%/0.4%/0.5%/0.6%/0.7",
			"5%/7.5%/10%/12.5%/15%/17.5%/20",
			"5%/7.5%/10%/12.5%/15%/17.5%/20",
			"4"
		}
	},
	[500107201] = {
		description = "当百解·禄良装备时，获得以下效果。\n<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(107202)>「瑞币」</material></color>的持续时间延长<color=#E78300>{8}</color>秒。\n<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(107202)>「瑞币」</material></color>的协同攻击附加的风属性抗性降低效果可额外叠加，每次叠加风属性抗性额外降低<color=#E78300>{1}%</color>，最多可额外叠加<color=#E78300>{2}</color>层。\n<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(107202)>「瑞币」</material></color>效果结束时，自身以外的队友恢复<color=#E78300>{6}%</color>的奥义值，并在跟随的修正者位置产生爆炸，造成共计<color=#E78300>{3}%</color>攻击力的风属性伤害。爆炸会对命中的敌人附加破甲状态，防御力降低<color=#E78300>{4}%</color>，持续<color=#E78300>{5}</color>秒。\n<color=#297DE0>「辟邪奇术」</color>的最后一段攻击命中后，自身奥义的剩余冷却时间缩短<color=#E78300>{7}</color>秒。\n施放奥义后或连携奥义时，获得<color=#E78300>10</color>点<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(107201)>「财运」</material></color>。",
		maxLv = 0,
		type = 0,
		id = 500107201,
		param = {
			{
				"0",
				"1.6",
				"8",
				"800",
				"6",
				"12",
				"4",
				"0.4",
				"2"
			},
			{
				"0",
				"2",
				"8",
				"800",
				"7.5",
				"12",
				"5",
				"0.5",
				"3"
			},
			{
				"0",
				"2.4",
				"8",
				"800",
				"9",
				"12",
				"6",
				"0.6",
				"4"
			},
			{
				"0",
				"2.8",
				"8",
				"800",
				"10.5",
				"12",
				"7",
				"0.7",
				"5"
			},
			{
				"0",
				"3.2",
				"8",
				"800",
				"12",
				"12",
				"8",
				"0.8",
				"6"
			},
			{
				"0",
				"3.6",
				"8",
				"800",
				"13.5",
				"12",
				"9",
				"0.9",
				"7"
			},
			{
				"0",
				"4",
				"8",
				"800",
				"15",
				"12",
				"10",
				"1",
				"8"
			}
		},
		extra_param = {
			"0",
			"1.6%/2%/2.4%/2.8%/3.2%/3.6%/4",
			"8",
			"800",
			"6%/7.5%/9%/10.5%/12%/13.5%/15",
			"12",
			"4%/5%/6%/7%/8%/9%/10",
			"0.4/0.5/0.6/0.7/0.8/0.9/1",
			"2/3/4/5/6/7/8"
		}
	},
	[500107401] = {
		description = "当巡天·英招装备时，获得以下效果。\n技能一、二、三基础伤害提高<color=#E78300>{1}%</color>。\n衍生技能可以存在<color=#E78300>3</color>个；移动闪避后替换衍生技能不再需要神能不少于<color=#E78300>5</color>点的条件，施放衍生技能时不再消耗神能。\n闪避后，自身独立伤害提高<color=#E78300>{2}%</color>，持续<color=#E78300>{3}</color>秒。",
		maxLv = 0,
		type = 0,
		id = 500107401,
		param = {
			{
				"0",
				"12",
				"5",
				"6"
			},
			{
				"0",
				"18",
				"7.5",
				"6"
			},
			{
				"0",
				"24",
				"10",
				"6"
			},
			{
				"0",
				"30",
				"12.5",
				"6"
			},
			{
				"0",
				"36",
				"15",
				"6"
			},
			{
				"0",
				"42",
				"17.5",
				"6"
			},
			{
				"0",
				"48",
				"20",
				"6"
			}
		},
		extra_param = {
			"0",
			"12%/18%/24%/30%/36%/42%/48",
			"5%/7.5%/10%/12.5%/15%/17.5%/20",
			"6"
		}
	},
	[500107501] = {
		description = "当澄心·陵光装备时，获得以下效果。\n施放<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(107503)>「烈式」</material></color>时，全队伍会心率提高<color=#E78300>{2}%</color>、全属性伤害提高<color=#E78300>{3}%</color>，持续<color=#E78300>{1}</color>秒。\n<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(107507)>「阳炽」</material></color>的概率增加<color=#E78300>{4}%</color>。\n<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(107508)>「烈阳炽」</material></color>的持续时间延长<color=#E78300>{5}</color>秒。\n<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(107509)>「烈离」</material></color>的持续时间缩短<color=#E78300>{6}</color>秒。\n<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(107510)>「燃离」</material></color>的持续时间延长<color=#E78300>{7}</color>秒。",
		maxLv = 0,
		type = 0,
		id = 500107501,
		param = {
			{
				"0",
				"10",
				"10",
				"10",
				"8",
				"1",
				"0.4",
				"1"
			},
			{
				"0",
				"10",
				"12.5",
				"12.5",
				"15",
				"2",
				"1",
				"2"
			},
			{
				"0",
				"10",
				"15",
				"15",
				"22",
				"3",
				"1.6",
				"3"
			},
			{
				"0",
				"10",
				"17.5",
				"17.5",
				"29",
				"4",
				"2.2",
				"4"
			},
			{
				"0",
				"10",
				"20",
				"20",
				"36",
				"5",
				"2.8",
				"5"
			},
			{
				"0",
				"10",
				"22.5",
				"22.5",
				"43",
				"6",
				"3.4",
				"6"
			},
			{
				"0",
				"10",
				"25",
				"25",
				"50",
				"7",
				"4",
				"7"
			}
		},
		extra_param = {
			"0",
			"10",
			"10%/12.5%/15%/17.5%/20%/22.5%/25",
			"10%/12.5%/15%/17.5%/20%/22.5%/25",
			"8%/15%/22%/29%/36%/43%/50",
			"1/2/3/4/5/6/7",
			"0.4/1/1.6/2.2/2.8/3.4/4",
			"1/2/3/4/5/6/7"
		}
	},
	[500107601] = {
		description = "当太一·庚辰装备时，获得以下效果。\n天垣神系修正者最终伤害提高<color=#E78300>{1}%</color>。\n天垣神系修正者攻击命中瞬间近战伤害和远程伤害提高<color=#E78300>{5}%</color>。\n被投掷命中附加停滞效果的敌人，受到影响的间隔时间缩短至<color=#E78300>{6}</color>秒。\n自身对全场敌人附加破甲时的效果提高，提供的防御力降低效果改变为<color=#E78300>{7}%</color>。\n自身对处于浮空状态或<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(107605)>「重渊」</material></color>状态的敌人命中瞬间独立伤害提高<color=#E78300>{2}%</color>。\n具有修正值的敌人出场时，修正值增加<color=#E78300>{3}%</color>；退出修正模式后，修正值增加<color=#E78300>{4}%</color>。",
		maxLv = 0,
		type = 0,
		id = 500107601,
		param = {
			{
				"0",
				"5",
				"8",
				"8",
				"8",
				"2",
				"27",
				"6"
			},
			{
				"0",
				"7.5",
				"12",
				"15",
				"8",
				"3",
				"26",
				"7"
			},
			{
				"0",
				"10",
				"16",
				"22",
				"8",
				"4",
				"25",
				"8"
			},
			{
				"0",
				"12.5",
				"20",
				"29",
				"8",
				"5",
				"24",
				"9"
			},
			{
				"0",
				"15",
				"24",
				"36",
				"8",
				"6",
				"23",
				"10"
			},
			{
				"0",
				"17.5",
				"28",
				"43",
				"8",
				"7",
				"22",
				"11"
			},
			{
				"0",
				"20",
				"32",
				"50",
				"8",
				"8",
				"21",
				"12"
			}
		},
		extra_param = {
			"0",
			"5%/7.5%/10%/12.5%/15%/17.5%/20",
			"8%/12%/16%/20%/24%/28%/32",
			"8%/15%/22%/29%/36%/43%/50",
			"8",
			"2%/3%/4%/5%/6%/7%/8",
			"27/26/25/24/23/22/21",
			"6%/7%/8%/9%/10%/11%/12"
		}
	},
	[500108001] = {
		description = "当寒霜之牙·维达尔装备时，获得以下效果。\n普通攻击<color=#297DE0>「冰原狩猎」</color>改变为<color=#297DE0>「凌霜之牙」</color>。\n普通攻击命中敌人时，有<color=#E78300>{1}%</color>的概率对前方的敌人附加冰冻状态，持续<color=#E78300>{2}</color>秒，该效果每<color=#E78300>6</color>秒最多触发一次。每次普通攻击命中处于冰冻状态的敌人后会额外获得<color=#E78300>6</color>点怒气。普通攻击命中后，会对前方非自身普通攻击直接命中的敌人进行范围技能攻击，造成<color=#E78300>125%</color>攻击力的冰属性伤害。",
		maxLv = 0,
		type = 0,
		id = 500108001,
		param = {
			{
				"0",
				"40",
				"2"
			},
			{
				"0",
				"50",
				"2"
			},
			{
				"0",
				"60",
				"2"
			},
			{
				"0",
				"70",
				"2"
			},
			{
				"0",
				"80",
				"2"
			},
			{
				"0",
				"90",
				"2"
			},
			{
				"0",
				"100",
				"2"
			}
		},
		extra_param = {
			"0",
			"40%/50%/60%/70%/80%/90%/100",
			"2"
		}
	},
	[500108101] = {
		description = "当斩浪·丝卡蒂装备时，获得以下效果。\n<color=#297DE0>「霜断」</color>和<color=#297DE0>「晶尘飞散」</color>命中时会对命中的敌人附加冰属性抗性降低<color=#E78300>{1}%</color>，持续<color=#E78300>{2}</color>秒。\n对处于冰属性抗性降低状态的敌人命中瞬间伤害提高，数值等同于冰属性抗性降低的<color=#E78300>{3}%</color>。",
		maxLv = 0,
		type = 0,
		id = 500108101,
		param = {
			{
				"0",
				"12",
				"15",
				"64"
			},
			{
				"0",
				"12",
				"15",
				"80"
			},
			{
				"0",
				"12",
				"15",
				"96"
			},
			{
				"0",
				"12",
				"15",
				"112"
			},
			{
				"0",
				"12",
				"15",
				"128"
			},
			{
				"0",
				"12",
				"15",
				"144"
			},
			{
				"0",
				"12",
				"15",
				"160"
			}
		},
		extra_param = {
			"0",
			"12",
			"15",
			"64%/80%/96%/112%/128%/144%/160"
		}
	},
	[500108401] = {
		description = "当朝约·薇儿丹蒂装备时，获得以下效果。\n技能一<color=#297DE0>「高速突刺」</color>改变为<color=#297DE0>「飓风突刺」</color>。\n施放<color=#297DE0>「飓风突刺」</color>或<color=#297DE0>「启明」</color>时获得<color=#E78300>10</color>点神能，伤害提高<color=#E78300>{1}%</color>，持续<color=#E78300>{2}</color>秒，最多可叠加<color=#E78300>3</color>层。",
		maxLv = 0,
		type = 0,
		id = 500108401,
		param = {
			{
				"0",
				"12",
				"5"
			},
			{
				"0",
				"15",
				"5"
			},
			{
				"0",
				"18",
				"5"
			},
			{
				"0",
				"21",
				"5"
			},
			{
				"0",
				"24",
				"5"
			},
			{
				"0",
				"27",
				"5"
			},
			{
				"0",
				"30",
				"5"
			}
		},
		extra_param = {
			"0",
			"12%/15%/18%/21%/24%/27%/30",
			"5"
		}
	},
	[500108901] = {
		description = "当焚轮·帕尔瓦蒂装备时，获得以下效果。\n独立伤害提高<color=#E78300>{1}%</color>。\n<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(108901)>「风弹」</material></color>类型切换到<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(108902)>「风弹·湛蓝」</material></color>时，自身恢复<color=#E78300>{2}%</color>的生命值。\n<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(108905)>「湛蓝」</material></color>状态层数增加<color=#E78300>12</color>层。\n每层<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(108907)>「赤红」</material></color>提供的风属性伤害提高改变为<color=#E78300>0.6%</color>。\n自动装填时，神能获得率提高<color=#E78300>{3}%</color>，持续<color=#E78300>{4}</color>秒。\n神格<color=#297DE0>「雪峰轮回·焚我」</color>获得额外的效果：会心率提高<color=#E78300>{5}%</color>。",
		maxLv = 0,
		type = 0,
		id = 500108901,
		param = {
			{
				"0",
				"8",
				"8",
				"50",
				"12",
				"10"
			},
			{
				"0",
				"10",
				"10",
				"50",
				"12",
				"15"
			},
			{
				"0",
				"12",
				"12",
				"50",
				"12",
				"20"
			},
			{
				"0",
				"14",
				"14",
				"50",
				"12",
				"25"
			},
			{
				"0",
				"16",
				"16",
				"50",
				"12",
				"30"
			},
			{
				"0",
				"18",
				"18",
				"50",
				"12",
				"35"
			},
			{
				"0",
				"20",
				"20",
				"50",
				"12",
				"40"
			}
		},
		extra_param = {
			"0",
			"8%/10%/12%/14%/16%/18%/20",
			"8%/10%/12%/14%/16%/18%/20",
			"50",
			"12",
			"10%/15%/20%/25%/30%/35%/40"
		}
	},
	[500109301] = {
		description = "当觅影·国常立装备时，获得以下效果。\n施放<color=#297DE0>「天之持」</color>后，会对锁定敌人进行一次手里剑袭击，造成<color=#E78300>{1}%</color>攻击力的物理属性伤害；施放<color=#297DE0>「地之持」</color>后会对周围的敌人形成一次范围性的冲击，造成<color=#E78300>{2}%</color>攻击力的物理属性伤害。\n<color=#297DE0>「忍法」</color>命中瞬间伤害提高<color=#E78300>{3}%</color>。",
		maxLv = 0,
		type = 0,
		id = 500109301,
		param = {
			{
				"0",
				"375",
				"375",
				"24"
			},
			{
				"0",
				"375",
				"375",
				"30"
			},
			{
				"0",
				"375",
				"375",
				"36"
			},
			{
				"0",
				"375",
				"375",
				"42"
			},
			{
				"0",
				"375",
				"375",
				"48"
			},
			{
				"0",
				"375",
				"375",
				"54"
			},
			{
				"0",
				"375",
				"375",
				"60"
			}
		},
		extra_param = {
			"0",
			"375",
			"375",
			"24%/30%/36%/42%/48%/54%/60"
		}
	},
	[500109401] = {
		description = "当暗星·海拉装备时，获得以下效果。\n炮垒形态的炮击的神能消耗减少<color=#E78300>5</color>点，炮击的基础伤害提高<color=#E78300>{1}%</color>。",
		maxLv = 0,
		type = 0,
		id = 500109401,
		param = {
			{
				"0",
				"32"
			},
			{
				"0",
				"40"
			},
			{
				"0",
				"48"
			},
			{
				"0",
				"56"
			},
			{
				"0",
				"64"
			},
			{
				"0",
				"72"
			},
			{
				"0",
				"80"
			}
		},
		extra_param = {
			"0",
			"32%/40%/48%/56%/64%/72%/80"
		}
	},
	[500109501] = {
		description = "当苍鹭·托特装备时，获得以下效果。\n独立伤害提高<color=#E78300>{1}%</color>。\n技能一、二、三基础伤害提高<color=#E78300>{2}%</color>。\n每<color=#E78300>0.5</color>秒自动恢复<color=#E78300>1</color>点能量。退出<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(109501)>「牵丝」</material></color>状态后，恢复<color=#E78300>{3}</color>点能量。\n不处于<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(109501)>「牵丝」</material></color>状态时，施放<color=#297DE0>「刃舞」</color>或<color=#297DE0>「丝雨」</color>后，<color=#297DE0>「刃舞」</color>、<color=#297DE0>「丝雨」</color>会替换为<color=#297DE0>「刀纱」</color>、<color=#297DE0>「缀影」</color>，并重置<color=#297DE0>「刀纱」</color>、<color=#297DE0>「缀影」</color>的冷却时间，施放其中任意一个技能后<color=#297DE0>「刀纱」</color>、<color=#297DE0>「缀影」</color>会替换回<color=#297DE0>「刃舞」</color>、<color=#297DE0>「丝雨」</color>。\n处于<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(109501)>「牵丝」</material></color>状态时，施放<color=#297DE0>「刀纱」</color>后，<color=#297DE0>「刀纱」</color>会替换为<color=#297DE0>「刻韵·刃」</color>；施放<color=#297DE0>「缀影」</color>后，<color=#297DE0>「缀影」</color>会替换为<color=#297DE0>「刻韵·丝」</color>；施放<color=#297DE0>「刻韵·刃」</color>或<color=#297DE0>「刻韵·丝」</color>后，<color=#297DE0>「刻韵·刃」</color>、<color=#297DE0>「刻韵·丝」</color>会替换回<color=#297DE0>「刀纱」</color>、<color=#297DE0>「缀影」</color>。",
		maxLv = 0,
		type = 0,
		id = 500109501,
		param = {
			{
				"0",
				"10",
				"8",
				"24"
			},
			{
				"0",
				"12.5",
				"10",
				"30"
			},
			{
				"0",
				"15",
				"12",
				"36"
			},
			{
				"0",
				"17.5",
				"14",
				"42"
			},
			{
				"0",
				"20",
				"16",
				"48"
			},
			{
				"0",
				"22.5",
				"18",
				"54"
			},
			{
				"0",
				"25",
				"20",
				"60"
			}
		},
		extra_param = {
			"0",
			"10%/12.5%/15%/17.5%/20%/22.5%/25",
			"8%/10%/12%/14%/16%/18%/20",
			"24/30/36/42/48/54/60"
		}
	},
	[500109601] = {
		description = "当风行·赫尔墨斯装备时，获得以下效果。\n普通攻击最后一段后，可通过继续点击普通攻击消耗怒气衔接<color=#297DE0>「风驰迹掣」</color>的追加攻击，通过该途径的<color=#297DE0>「风驰迹掣」</color>不会进入冷却状态。\n<color=#297DE0>「风驰迹掣」</color>的追加攻击会对命中的敌人附加风属性抗性降低<color=#E78300>{1}%</color>，该效果提供的风属性抗性降低最高为<color=#E78300>120%</color>。",
		maxLv = 0,
		type = 0,
		id = 500109601,
		param = {
			{
				"0",
				"4"
			},
			{
				"0",
				"5"
			},
			{
				"0",
				"6"
			},
			{
				"0",
				"7"
			},
			{
				"0",
				"8"
			},
			{
				"0",
				"9"
			},
			{
				"0",
				"10"
			}
		},
		extra_param = {
			"0",
			"4%/5%/6%/7%/8%/9%/10"
		}
	},
	[500109701] = {
		description = "当小困·俄尼里伊装备时，获得以下效果。\n技能二<color=#297DE0>「绘梦童话」</color>改变为<color=#297DE0>「幽梦乐园」</color>。\n<color=#297DE0>「幽梦乐园」</color>持续期间内，所有友方受到的伤害降低，自身会对命中的敌人附加<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(109703)>「幽梦」</material></color>状态。\n<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(109703)>「幽梦」</material></color>：每<color=#E78300>1</color>秒附加<color=#E78300>{1}%</color>攻击力的暗属性伤害。",
		maxLv = 0,
		type = 0,
		id = 500109701,
		param = {
			{
				"0",
				"80"
			},
			{
				"0",
				"100"
			},
			{
				"0",
				"120"
			},
			{
				"0",
				"140"
			},
			{
				"0",
				"160"
			},
			{
				"0",
				"180"
			},
			{
				"0",
				"200"
			}
		},
		extra_param = {
			"0",
			"80%/100%/120%/140%/160%/180%/200"
		}
	},
	[500109901] = {
		description = "当朔望·月读装备时，获得以下效果。\n技能三<color=#297DE0>「朔望·月夜见」</color>改变为<color=#297DE0>「朔望·末月」</color>。\n神能为满时，重置<color=#297DE0>「朔望·末月」</color>的冷却时间。\n<color=#297DE0>「望·末月」</color>的蓄力时间缩短<color=#E78300>60%</color>。副刀光命中瞬间伤害提高<color=#E78300>{1}%</color>。",
		maxLv = 0,
		type = 0,
		id = 500109901,
		param = {
			{
				"0",
				"12"
			},
			{
				"0",
				"15"
			},
			{
				"0",
				"18"
			},
			{
				"0",
				"21"
			},
			{
				"0",
				"24"
			},
			{
				"0",
				"27"
			},
			{
				"0",
				"30"
			}
		},
		extra_param = {
			"0",
			"12%/15%/18%/21%/24%/27%/30"
		}
	},
	[500111101] = {
		description = "当生魂·奥西里斯装备时，获得以下效果。\n印记上限增加<color=#E78300>2</color>个；出场时，自身和与自身预组合连携奥义的修正者恢复<color=#E78300>{1}%</color>的奥义值。\n施放<color=#297DE0>「幽岚羽刃」</color>后的再次施放，不再需要消耗印记。\n<color=#297DE0>「终灵凋落」</color>每次施放命中时，每秒恢复自身<color=#E78300>{3}%</color>的生命值，持续<color=#E78300>{4}</color>秒；消耗剩余的全部印记，每额外消耗<color=#E78300>1</color>个印记<color=#297DE0>「终灵凋落」</color>命中瞬间伤害提高<color=#E78300>{2}%</color>。\n<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(111101)>「冥府审判模式」</material></color>下施放的<color=#297DE0>「终灵凋落」</color>的伤害提高效果和生命值恢复效果提高<color=#E78300>100%</color>。",
		maxLv = 0,
		type = 0,
		id = 500111101,
		param = {
			{
				"0",
				"5",
				"12",
				"1.2",
				"8"
			},
			{
				"0",
				"10",
				"14",
				"1.3",
				"8"
			},
			{
				"0",
				"15",
				"16",
				"1.4",
				"8"
			},
			{
				"0",
				"20",
				"18",
				"1.5",
				"8"
			},
			{
				"0",
				"25",
				"20",
				"1.6",
				"8"
			},
			{
				"0",
				"30",
				"22",
				"1.7",
				"8"
			},
			{
				"0",
				"35",
				"24",
				"1.8",
				"8"
			}
		},
		extra_param = {
			"0",
			"5%/10%/15%/20%/25%/30%/35",
			"12%/14%/16%/18%/20%/22%/24",
			"1.2%/1.3%/1.4%/1.5%/1.6%/1.7%/1.8",
			"8"
		}
	},
	[500111901] = {
		description = "当流萤岚雾·休装备时，获得以下效果。\n追击与反击命中瞬间伤害提高<color=#E78300>{1}%</color>。\n在施放追击或反击的过程中切换过姿态后，可以额外产生一次对应技能的追击和一次反击，额外产生的追击和反击无法继续触发该效果。",
		maxLv = 0,
		type = 0,
		id = 500111901,
		param = {
			{
				"0",
				"16"
			},
			{
				"0",
				"20"
			},
			{
				"0",
				"24"
			},
			{
				"0",
				"28"
			},
			{
				"0",
				"32"
			},
			{
				"0",
				"36"
			},
			{
				"0",
				"40"
			}
		},
		extra_param = {
			"0",
			"16%/20%/24%/28%/32%/36%/40"
		}
	},
	[500112701] = {
		description = "当逆潮·利维坦装备时，获得以下效果。\n每次成功获得标记或施放<color=#297DE0>「深海愈疗」</color>时，<color=#297DE0>「暗潮之力」</color>的剩余冷却时间缩短<color=#E78300>3</color>秒。\n施放<color=#297DE0>「深海愈疗」</color>时会生成一个跟随自身的领域，持续<color=#E78300>8</color>秒，处于领域范围内的敌人被命中时近战伤害抗性降低<color=#E78300>{1}%</color>，持续<color=#E78300>1</color>秒。",
		maxLv = 0,
		type = 0,
		id = 500112701,
		param = {
			{
				"0",
				"12"
			},
			{
				"0",
				"15"
			},
			{
				"0",
				"18"
			},
			{
				"0",
				"21"
			},
			{
				"0",
				"24"
			},
			{
				"0",
				"27"
			},
			{
				"0",
				"30"
			}
		},
		extra_param = {
			"0",
			"12%/15%/18%/21%/24%/27%/30"
		}
	},
	[500113201] = {
		description = "当烙焰·提尔装备时，获得以下效果。\n神格<color=#297DE0>「燃剑的制裁·瞬燃」</color>获得额外的效果：接住长剑后的强力攻击施放时，会获得<color=#E78300>100</color>点<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(113204)>「烙印」</material></color>。\n神格<color=#297DE0>「炽甲的惩戒·凝火」</color>获得额外的效果：每消耗<color=#E78300>1</color>点<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(113204)>「烙印」</material></color>，<color=#297DE0>「爆烈强攻」</color>的基础伤害提高<color=#E78300>{5}%</color>。\n处于<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(113202)>「炽甲姿态」</material></color>时，每次普通攻击命中时会获得<color=#E78300>4</color>点<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(113204)>「烙印」</material></color>，<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(113204)>「烙印」</material></color>上限<color=#E78300>100</color>点。\n处于<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(113201)>「燃剑姿态」</material></color>时，每次施放普通攻击或技能时，会触发额外技能攻击造成伤害。\n施放每段普通攻击时，额外造成共计<color=#E78300>{1}%</color>攻击力的火属性伤害，之后每段最多消耗<color=#E78300>8</color>点<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(113204)>「烙印」</material></color>。\n施放<color=#297DE0>「爆烈强攻」</color>时，每次攻击额外造成<color=#E78300>{2}%</color>攻击力的火属性伤害，之后消耗<color=#E78300>8</color>点<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(113204)>「烙印」</material></color>。\n施放<color=#297DE0>「焚灭掳夺」</color>时，每次攻击额外造成<color=#E78300>{3}%</color>攻击力的火属性伤害，之后消耗<color=#E78300>12</color>点<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(113204)>「烙印」</material></color>。\n触发的额外技能攻击命中瞬间伤害提高<color=#E78300>{4}%</color>。",
		maxLv = 0,
		type = 0,
		id = 500113201,
		param = {
			{
				"0",
				"600",
				"600",
				"900",
				"16",
				"1.6"
			},
			{
				"0",
				"600",
				"600",
				"900",
				"20",
				"2"
			},
			{
				"0",
				"600",
				"600",
				"900",
				"24",
				"2.4"
			},
			{
				"0",
				"600",
				"600",
				"900",
				"28",
				"2.8"
			},
			{
				"0",
				"600",
				"600",
				"900",
				"32",
				"3.2"
			},
			{
				"0",
				"600",
				"600",
				"900",
				"36",
				"3.6"
			},
			{
				"0",
				"600",
				"600",
				"900",
				"40",
				"4"
			}
		},
		extra_param = {
			"0",
			"600",
			"600",
			"900",
			"16%/20%/24%/28%/32%/36%/40",
			"1.6%/2%/2.4%/2.8%/3.2%/3.6%/4"
		}
	},
	[500113801] = {
		description = "当黎幻·赫拉装备时，获得以下效果。\n闪避<color=#297DE0>「光幻瞬变」</color>改变为<color=#297DE0>「浮光幻羽」</color>。\n闪避必定触发闪避效果；长按闪避消耗<color=#E78300>30</color>点能量可额外触发闪避效果，该效果每<color=#E78300>24</color>秒最多触发一次。受到<color=#297DE0>「曙光祈愿」</color>影响的自身或者队友，处于零时空间时，命中瞬间伤害提高<color=#E78300>{1}%</color>。",
		maxLv = 0,
		type = 0,
		id = 500113801,
		param = {
			{
				"0",
				"32"
			},
			{
				"0",
				"40"
			},
			{
				"0",
				"48"
			},
			{
				"0",
				"56"
			},
			{
				"0",
				"64"
			},
			{
				"0",
				"72"
			},
			{
				"0",
				"80"
			}
		},
		extra_param = {
			"0",
			"32%/40%/48%/56%/64%/72%/80"
		}
	},
	[500113901] = {
		description = "当冰渊·波塞冬装备时，获得以下效果。\n每命中敌人<color=#E78300>{1}</color>次，获得<color=#E78300>1</color>点能量。\n处于<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(113903)>「临渊」</material></color>状态时，<color=#297DE0>「零度寒芒」</color>的冰属性伤害加成效果提高<color=#E78300>20%</color>，<color=#297DE0>「事象冰封」</color>对命中的敌人附加的冰属性抗性降低效果提高<color=#E78300>20%</color>。\n处于<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(113903)>「临渊」</material></color>状态时，每次施放<color=#297DE0>「零度寒芒」</color>或<color=#297DE0>「事象冰封」</color>时，对应技能的基础伤害提高<color=#E78300>{2}%</color>，持续<color=#E78300>5</color>秒，最多可叠加<color=#E78300>5</color>层。",
		maxLv = 0,
		type = 0,
		id = 500113901,
		param = {
			{
				"0",
				"24",
				"12"
			},
			{
				"0",
				"23",
				"15"
			},
			{
				"0",
				"22",
				"18"
			},
			{
				"0",
				"21",
				"21"
			},
			{
				"0",
				"20",
				"24"
			},
			{
				"0",
				"19",
				"27"
			},
			{
				"0",
				"18",
				"30"
			}
		},
		extra_param = {
			"0",
			"24/23/22/21/20/19/18",
			"12%/15%/18%/21%/24%/27%/30"
		}
	},
	[500114801] = {
		description = "当追炎·前鬼坊天狗装备时，获得以下效果。\n印记上限增加<color=#E78300>2</color>个。\n每消耗<color=#E78300>1</color>个印记，伤害提高<color=#E78300>{1}%</color>，持续<color=#E78300>{2}</color>秒，最多可叠加<color=#E78300>10</color>层。",
		maxLv = 0,
		type = 0,
		id = 500114801,
		param = {
			{
				"0",
				"4",
				"5"
			},
			{
				"0",
				"5",
				"5"
			},
			{
				"0",
				"6",
				"5"
			},
			{
				"0",
				"7",
				"5"
			},
			{
				"0",
				"8",
				"5"
			},
			{
				"0",
				"9",
				"5"
			},
			{
				"0",
				"10",
				"5"
			}
		},
		extra_param = {
			"0",
			"4%/5%/6%/7%/8%/9%/10",
			"5"
		}
	},
	[500115001] = {
		description = "当绯染·丰前坊天狗装备时，获得以下效果。\n技能一、二、三基础伤害提高<color=#E78300>{1}%</color>。\n不处于<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(115001)>「樱弥」</material></color>状态时，普通攻击命中后获得的神能增加，<color=#297DE0>「一式·裂空」</color>、<color=#297DE0>「三式·苍雷」</color>每次施放命中后改变为获得<color=#E78300>10</color>点神能。\n进入<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(115001)>「樱弥」</material></color>状态时，获得<color=#E78300>40</color>点<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(115002)>「妖樱」</material></color>。\n<color=#297DE0>「一式·裂空」</color>、<color=#297DE0>「三式·苍雷」</color>的最后一次攻击命中时，<color=#297DE0>「一式·决刹」</color>、<color=#297DE0>「三式·樱舞」</color>连续衔接第三次施放的最后一次攻击命中时，会触发额外攻击，造成共计<color=#E78300>{2}%</color>攻击力的雷属性伤害。",
		maxLv = 0,
		type = 0,
		id = 500115001,
		param = {
			{
				"0",
				"18",
				"700"
			},
			{
				"0",
				"27",
				"700"
			},
			{
				"0",
				"36",
				"700"
			},
			{
				"0",
				"45",
				"700"
			},
			{
				"0",
				"54",
				"700"
			},
			{
				"0",
				"63",
				"700"
			},
			{
				"0",
				"72",
				"700"
			}
		},
		extra_param = {
			"0",
			"18%/27%/36%/45%/54%/63%/72",
			"700"
		}
	},
	[500115601] = {
		description = "当伐灭·伽梨装备时，获得以下效果。\n出场时，对全队伍施加护盾值等同于各自生命值上限的护盾。\n每次触发<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(115601)>「煌雷」</material></color>时，全队伍攻击力提高<color=#E78300>{1}%</color>，持续<color=#E78300>{2}</color>秒。\n自身或者队友施放单人奥义时，会心伤害提高改变为<color=#E78300>60%</color>。\n普通攻击或技能每次命中后，会获得不同点数的<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(115603)>「煌闪劫雷」</material></color>，<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(115603)>「煌闪劫雷」</material></color>上限<color=#E78300>150</color>点；施放技能后会消耗不同的点数的<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(115603)>「煌闪劫雷」</material></color>，重置技能的冷却时间。\n<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(115603)>「煌闪劫雷」</material></color>：普通攻击获得<color=#E78300>1</color>点，强化的普通攻击获得<color=#E78300>2</color>点；技能获得<color=#E78300>3</color>点，强化的技能获得<color=#E78300>5</color>点。<color=#297DE0>「一劫·煌闪」</color>消耗<color=#E78300>75</color>点；<color=#297DE0>「三劫·伐恶」</color>消耗<color=#E78300>25</color>点；<color=#297DE0>「九劫·雷崩」</color>消耗<color=#E78300>100</color>点。",
		maxLv = 0,
		type = 0,
		id = 500115601,
		param = {
			{
				"0",
				"16",
				"7"
			},
			{
				"0",
				"20",
				"7"
			},
			{
				"0",
				"24",
				"7"
			},
			{
				"0",
				"28",
				"7"
			},
			{
				"0",
				"32",
				"7"
			},
			{
				"0",
				"36",
				"7"
			},
			{
				"0",
				"40",
				"7"
			}
		},
		extra_param = {
			"0",
			"16%/20%/24%/28%/32%/36%/40",
			"7"
		}
	},
	[500115801] = {
		description = "当惑火灼心·迦具土装备时，获得以下效果。\n积蓄条获得率提高<color=#E78300>30%</color>。\n每次<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(115801)>「熔火」</material></color>状态结束时，会心伤害提高<color=#E78300>{1}%</color>，持续<color=#E78300>{2}</color>秒。\n<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(115802)>「焚心」</material></color>等级提升后<color=#E78300>1</color>秒内衔接施放<color=#297DE0>「鸦惑一闪」</color>、<color=#297DE0>「瞬灭焰斩」</color>时，衔接施放的技能命中瞬间攻击力提高<color=#E78300>{3}%</color>。\n<color=#297DE0>「瞬灭焰斩」</color>施放结束后，<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(115802)>「焚心」</material></color>等级提升至<color=#E78300>3</color>时，<color=#297DE0>「瞬灭焰斩」</color>的剩余冷却时间缩短<color=#E78300>50%</color>，每次<color=#297DE0>「瞬灭焰斩」</color>冷却期间该效果最多触发一次。",
		maxLv = 0,
		type = 0,
		id = 500115801,
		param = {
			{
				"0",
				"40",
				"4",
				"40"
			},
			{
				"0",
				"50",
				"4",
				"40"
			},
			{
				"0",
				"60",
				"4",
				"40"
			},
			{
				"0",
				"70",
				"4",
				"40"
			},
			{
				"0",
				"80",
				"4",
				"40"
			},
			{
				"0",
				"90",
				"4",
				"40"
			},
			{
				"0",
				"100",
				"4",
				"40"
			}
		},
		extra_param = {
			"0",
			"40%/50%/60%/70%/80%/90%/100",
			"4",
			"40"
		}
	},
	[500118401] = {
		description = "当旧誓·薇儿丹蒂装备时，获得以下效果。\n自身或者队友获得<color=#297DE0>「信念守护」</color>的护盾时，雷属性伤害提高<color=#E78300>{1}%</color>，持续<color=#E78300>{2}</color>秒；护盾移除时，雷属性伤害提高效果也会移除。\n<color=#297DE0>「信念守护」</color>的护盾移除或者刷新时，会以自身为中心造成一次范围爆炸，造成共计<color=#E78300>{3}%</color>攻击力的雷属性伤害。",
		maxLv = 0,
		type = 0,
		id = 500118401,
		param = {
			{
				"0",
				"20",
				"12",
				"480"
			},
			{
				"0",
				"25",
				"12",
				"480"
			},
			{
				"0",
				"30",
				"12",
				"480"
			},
			{
				"0",
				"35",
				"12",
				"480"
			},
			{
				"0",
				"40",
				"12",
				"480"
			},
			{
				"0",
				"45",
				"12",
				"480"
			},
			{
				"0",
				"50",
				"12",
				"480"
			}
		},
		extra_param = {
			"0",
			"20%/25%/30%/35%/40%/45%/50",
			"12",
			"480"
		}
	},
	[500119701] = {
		description = "当梦影·俄尼里伊装备时，获得以下效果。\n会心率提高<color=#E78300>{1}%</color>。\n进入<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(119703)>「幻梦」</material></color>状态时，若自身会心率不低于<color=#E78300>100%</color>，则队友会心伤害提高<color=#E78300>{2}%</color>，持续至<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(119703)>「幻梦」</material></color>状态结束。\n<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(119705)>「梦醒」</material></color>计入次数上限增加<color=#E78300>50</color>。\n每次触发<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(119705)>「梦醒」</material></color>时，根据暗属性队友的数量，每有<color=#E78300>1</color>个该次附加的伤害计入次数增加<color=#E78300>{3}</color>次。\n神格<color=#297DE0>「无尽幻梦·象梦」</color>触发攻击力提高效果时，会根据暗属性队友的数量触发额外次数。",
		maxLv = 0,
		type = 0,
		id = 500119701,
		param = {
			{
				"0",
				"36",
				"36",
				"40"
			},
			{
				"0",
				"45",
				"45",
				"50"
			},
			{
				"0",
				"54",
				"54",
				"60"
			},
			{
				"0",
				"63",
				"63",
				"70"
			},
			{
				"0",
				"72",
				"72",
				"80"
			},
			{
				"0",
				"81",
				"81",
				"90"
			},
			{
				"0",
				"90",
				"90",
				"100"
			}
		},
		extra_param = {
			"0",
			"36%/45%/54%/63%/72%/81%/90",
			"36%/45%/54%/63%/72%/81%/90",
			"40/50/60/70/80/90/100"
		}
	},
	[500119901] = {
		description = "当震离·月读装备时，获得以下效果。\n每次清除<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(119901)>「雷殛之印」</material></color>或处于<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(119901)>「雷殛之印」</material></color>的敌人被击败时，攻击力提高<color=#E78300>{1}%</color>，持续<color=#E78300>{2}</color>秒，最多可叠加<color=#E78300>3</color>层。\n<color=#297DE0>「雷殛·荒天」</color>第三式命中时消耗全部怒气，根据消耗的怒气每有<color=#E78300>1%</color>，<color=#297DE0>「雷殛·荒天」</color>第三式命中瞬间伤害提高<color=#E78300>{3}%</color>。",
		maxLv = 0,
		type = 0,
		id = 500119901,
		param = {
			{
				"0",
				"6",
				"9",
				"1.5"
			},
			{
				"0",
				"7.5",
				"9",
				"1.5"
			},
			{
				"0",
				"9",
				"9",
				"1.5"
			},
			{
				"0",
				"10.5",
				"9",
				"1.5"
			},
			{
				"0",
				"12",
				"9",
				"1.5"
			},
			{
				"0",
				"13.5",
				"9",
				"1.5"
			},
			{
				"0",
				"15",
				"9",
				"1.5"
			}
		},
		extra_param = {
			"0",
			"6%/7.5%/9%/10.5%/12%/13.5%/15",
			"9",
			"1.5"
		}
	},
	[500124801] = {
		description = "当神威·前鬼坊天狗装备时，获得以下效果。\n出场时，获得<color=#E78300>5</color>个<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(124803)>「神威」</material></color>标记。\n施放<color=#297DE0>「跃电斩」</color>、普通攻击最后一段、蓄力攻击期间，自身获得霸体效果，受到伤害降低<color=#E78300>{1}%</color>。\n普通攻击最后一段的最后一次攻击、满蓄力的蓄力攻击命中会对命中的敌人附加麻痹状态，持续<color=#E78300>{2}</color>秒，附加<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(124806)>「电荷过载」</material></color>状态，持续<color=#E78300>8</color>秒。\n自身攻击处于<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(124806)>「电荷过载」</material></color>状态的敌人时，攻击命中瞬间独立伤害提高<color=#E78300>{3}%</color>；若处于<color=#297DE0><material=underline c=#2380BF h=2 event=terminology args=(124806)>「电荷过载」</material></color>的敌人同时处于破甲状态或雷属性抗性降低状态，则每有<color=#E78300>1</color>种该减益状态，攻击命中瞬间独立伤害额外提高<color=#E78300>{3}%</color>。",
		maxLv = 0,
		type = 0,
		id = 500124801,
		param = {
			{
				"0",
				"30",
				"3",
				"4.8"
			},
			{
				"0",
				"30",
				"3",
				"6"
			},
			{
				"0",
				"30",
				"3",
				"7.2"
			},
			{
				"0",
				"30",
				"3",
				"8.4"
			},
			{
				"0",
				"30",
				"3",
				"9.6"
			},
			{
				"0",
				"30",
				"3",
				"10.8"
			},
			{
				"0",
				"30",
				"3",
				"12"
			}
		},
		extra_param = {
			"0",
			"30",
			"3",
			"4.8%/6%/7.2%/8.4%/9.6%/10.8%/12"
		}
	},
	[500128401] = {
		description = "当黯耀·薇儿丹蒂装备时，获得以下效果。\n独立伤害提高<color=#E78300>{1}%</color>。\n技能一、二、三基础伤害提高<color=#E78300>{2}%</color>。\n<color=#297DE0>「炽光的剑印」</color>命中时对敌人附加光属性抗性降低<color=#E78300>{3}%</color>，持续<color=#E78300>{4}</color>秒。\n施放<color=#297DE0>「辉光」</color>、<color=#297DE0>「命咎」</color>每消耗<color=#E78300>1</color>点神能，技能命中瞬间技能伤害提高改变为<color=#E78300>{5}%</color>。\n进入修正模式时，重置<color=#297DE0>「刹那的辉光」</color>、<color=#297DE0>「命运的涟漪」</color>的冷却时间。",
		maxLv = 0,
		type = 0,
		id = 500128401,
		param = {
			{
				"0",
				"12",
				"4.8",
				"4.8",
				"12",
				"0.5"
			},
			{
				"0",
				"15",
				"6",
				"6",
				"12",
				"0.5"
			},
			{
				"0",
				"18",
				"7.2",
				"7.2",
				"12",
				"0.5"
			},
			{
				"0",
				"21",
				"8.4",
				"8.4",
				"12",
				"0.5"
			},
			{
				"0",
				"24",
				"9.6",
				"9.6",
				"12",
				"0.5"
			},
			{
				"0",
				"27",
				"10.8",
				"10.8",
				"12",
				"0.5"
			},
			{
				"0",
				"30",
				"12",
				"12",
				"12",
				"0.5"
			}
		},
		extra_param = {
			"0",
			"12%/15%/18%/21%/24%/27%/30",
			"4.8%/6%/7.2%/8.4%/9.6%/10.8%/12",
			"4.8%/6%/7.2%/8.4%/9.6%/10.8%/12",
			"12",
			"0.5"
		}
	},
	[600000001] = {
		description = "额外攻击力提高{1}。",
		maxLv = 1,
		type = 1,
		id = 600000001,
		extra_param = "",
		param = {
			{
				180,
				0,
				false,
				""
			}
		}
	},
	[600000002] = {
		description = "奥义伤害提高{1}。",
		maxLv = 1,
		type = 1,
		id = 600000002,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			}
		}
	},
	[600000003] = {
		description = "额外生命值提高{1}。",
		maxLv = 1,
		type = 1,
		id = 600000003,
		extra_param = "",
		param = {
			{
				900,
				0,
				false,
				""
			}
		}
	},
	[600000004] = {
		description = "额外防御力提高{1}。",
		maxLv = 1,
		type = 1,
		id = 600000004,
		extra_param = "",
		param = {
			{
				60,
				0,
				false,
				""
			}
		}
	},
	[600000005] = {
		description = "对生命值低于{1}的敌人命中瞬间伤害提高{2}。",
		maxLv = 1,
		type = 1,
		id = 600000005,
		extra_param = "",
		param = {
			{
				40,
				0,
				false,
				"%"
			},
			{
				35,
				0,
				false,
				"%"
			}
		}
	},
	[600000006] = {
		description = "治疗效果提高{1}。治疗生命值低于{2}的自身或者队友时，治疗效果额外提高30%。",
		maxLv = 1,
		type = 1,
		id = 600000006,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			},
			{
				40,
				0,
				false,
				"%"
			}
		}
	},
	[600000007] = {
		description = "攻击命中后，有{1}的概率对目标及其一定范围内的所有敌人附加灼烧状态，持续{2}秒，该效果每{4}秒最多触发一次。\n灼烧：每3秒附加{3}攻击力的火属性伤害，持续{2}秒。",
		maxLv = 1,
		type = 1,
		id = 600000007,
		extra_param = "",
		param = {
			{
				30,
				0,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				""
			},
			{
				20,
				0,
				false,
				"%"
			},
			{
				15,
				0,
				false,
				""
			}
		}
	},
	[600000008] = {
		description = "物理属性伤害提高{1}。\n物理技能或奥义每命中敌人1次，物理属性伤害提高{2}，持续{4}秒，最多可叠加5层，当叠加至5层时{4}秒内不再可叠加；达到5层时，会心伤害提高{3}。",
		maxLv = 1,
		type = 1,
		id = 600000008,
		extra_param = "",
		param = {
			{
				5,
				0,
				false,
				"%"
			},
			{
				2,
				2,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[600000009] = {
		description = "雷属性伤害提高{1}。\n技能或奥义命中时，对附近随机一个敌人触发一次落雷攻击，造成共计90%攻击力的雷属性伤害，该效果每{2}秒最多触发一次。",
		maxLv = 1,
		type = 1,
		id = 600000009,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			},
			{
				5,
				0,
				false,
				""
			}
		}
	},
	[600000010] = {
		description = "光属性伤害提高{1}。\n攻击命中时，对自身周围的敌人附加光属性抗性降低{2}和虚弱状态，攻击力降低{3}，持续10秒，多个刻印效果不可叠加。",
		maxLv = 1,
		type = 1,
		id = 600000010,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			},
			{
				5,
				0,
				false,
				"%"
			},
			{
				5,
				0,
				false,
				"%"
			}
		}
	},
	[600000011] = {
		description = "风属性伤害提高{1}。\n每有一个当前显示处于冷却状态的技能或奥义，风属性伤害额外提高{2}。",
		maxLv = 1,
		type = 1,
		id = 600000011,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			},
			{
				5,
				5,
				false,
				"%"
			}
		}
	},
	[600000012] = {
		description = "冰属性伤害提高{1}。\n冰属性技能和奥义的会心伤害提高{2}；命中处于冰冻状态的敌人时，会心伤害额外提高40%。",
		maxLv = 1,
		type = 1,
		id = 600000012,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			},
			{
				20,
				0,
				false,
				"%"
			}
		}
	},
	[600000013] = {
		description = "暗属性伤害提高{1}。\n对敌人造成暗属性伤害时，附加3%攻击力+固定伤害的无视防御的伤害。",
		maxLv = 1,
		type = 1,
		id = 600000013,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			}
		}
	},
	[600000014] = {
		description = "水属性伤害提高{1}。\n攻击命中时，对命中的敌人附加水属性抗性降低{2}，持续{3}秒，多个刻印效果不可叠加；攻击命中处于水属性抗性降低的敌人时，会心率提高{4}。",
		maxLv = 1,
		type = 1,
		id = 600000014,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			},
			{
				5,
				0,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				""
			},
			{
				5,
				0,
				false,
				"%"
			}
		}
	},
	[600000015] = {
		description = "火属性伤害提高{1}。\n击败敌人时，火属性伤害额外提高{2}，持续{3}秒，最多可叠加3层。",
		maxLv = 1,
		type = 1,
		id = 600000015,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			},
			{
				10,
				10,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[600000016] = {
		description = "处于修正模式时，伤害提高{1}。",
		maxLv = 1,
		type = 1,
		id = 600000016,
		extra_param = "",
		param = {
			{
				50,
				0,
				false,
				"%"
			}
		}
	},
	[600000017] = {
		description = "修正等级为Ω级时，会心伤害提高{1}。",
		maxLv = 1,
		type = 1,
		id = 600000017,
		extra_param = "",
		param = {
			{
				35,
				0,
				false,
				"%"
			}
		}
	},
	[600000018] = {
		description = "自身触发闪避效果时，会心率提高{1}，持续{2}秒。",
		maxLv = 1,
		type = 1,
		id = 600000018,
		extra_param = "",
		param = {
			{
				75,
				0,
				false,
				"%"
			},
			{
				3,
				0,
				false,
				""
			}
		}
	},
	[600000019] = {
		description = "会心率随修正等级提高而提高，每级会心率提高{1}，最高15%。",
		maxLv = 1,
		type = 1,
		id = 600000019,
		extra_param = "",
		param = {
			{
				3,
				3,
				false,
				"%"
			}
		}
	},
	[600000020] = {
		description = "奥义获得率提高{1}，奥义伤害提高{2}。",
		maxLv = 1,
		type = 1,
		id = 600000020,
		extra_param = "",
		param = {
			{
				30,
				0,
				false,
				"%"
			},
			{
				30,
				0,
				false,
				"%"
			}
		}
	},
	[600000021] = {
		description = "生命值上限提高{1}，每10秒自动恢复{2}的生命值。",
		maxLv = 1,
		type = 1,
		id = 600000021,
		extra_param = "",
		param = {
			{
				20,
				0,
				false,
				"%"
			},
			{
				2,
				0,
				false,
				"%"
			}
		}
	},
	[600000022] = {
		description = "怒气型修正者的技能伤害提高{2}。\n怒气获得率随修正等级提高而提高，每级怒气获得率提高{1}，最高35%。",
		maxLv = 1,
		type = 1,
		id = 600000022,
		extra_param = "",
		param = {
			{
				7,
				7,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				"%"
			}
		}
	},
	[600000023] = {
		description = "每次消耗能量时，有一定的概率获得能量上限的35%的能量；每消耗1点能量，触发的概率提高1%。",
		maxLv = 1,
		type = 1,
		id = 600000023,
		extra_param = "",
		param = {
			{
				1,
				0,
				false,
				""
			}
		}
	},
	[600000024] = {
		description = "每次消耗印记时，有一定的概率获得消耗的印记，并且攻击力提高{1}，持续{2}秒，该效果每12秒最多触发一次；每施放一个技能或奥义，触发的概率提高{3}，效果触发后重置概率。",
		maxLv = 1,
		type = 1,
		id = 600000024,
		extra_param = "",
		param = {
			{
				18,
				0,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				""
			},
			{
				15,
				0,
				false,
				"%"
			}
		}
	},
	[600000025] = {
		description = "消耗神能时，会心率提高{1}，持续{2}秒；会心率提高效果结束后，获得触发该次效果消耗的神能的10%。",
		maxLv = 1,
		type = 1,
		id = 600000025,
		extra_param = "",
		param = {
			{
				15,
				0,
				false,
				"%"
			},
			{
				3,
				0,
				false,
				""
			}
		}
	},
	[600000026] = {
		description = "怒气型修正者的技能伤害提高{1}。\n怒气消耗降低20%。",
		maxLv = 1,
		type = 1,
		id = 600000026,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			}
		}
	},
	[600000027] = {
		description = "能量上限增加30点。\n攻击命中时，获得{1}点能量，该效果每{2}秒最多触发一次。",
		maxLv = 1,
		type = 1,
		id = 600000027,
		extra_param = "",
		param = {
			{
				1,
				0,
				false,
				""
			},
			{
				1,
				0,
				false,
				""
			}
		}
	},
	[600000028] = {
		description = "印记型修正者的技能伤害提高{1}。\n技能或奥义每次命中敌人时，有{2}的概率获得1个印记，该效果每{3}秒最多触发一次。",
		maxLv = 1,
		type = 1,
		id = 600000028,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			},
			{
				30,
				0,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[600000029] = {
		description = "神能型修正者的技能伤害提高{1}。\n每秒获得{2}点神能。",
		maxLv = 1,
		type = 1,
		id = 600000029,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			},
			{
				1,
				0,
				false,
				""
			}
		}
	},
	[600000030] = {
		description = "每次施放技能或奥义时获得1层「幽影」效果，持续8秒，最多可叠加5层，每次叠加「幽影」的剩余持续时间延长1.5秒，叠加达到5层时持续时间不再延长；每拥有1层「幽影」，命中瞬间暗属性伤害提高{1}。\n受击时，每层「幽影」的效果提高100%，持续8秒，「幽影」效果结束时移除该效果。",
		maxLv = 1,
		type = 1,
		id = 600000030,
		extra_param = "",
		param = {
			{
				4,
				4,
				false,
				"%"
			}
		}
	},
	[600000031] = {
		description = "自身触发零时空间时，技能和奥义的剩余冷却时间缩短1.5秒。",
		maxLv = 1,
		type = 1,
		id = 600000031,
		extra_param = "",
		param = {}
	},
	[600000032] = {
		description = "技能或奥义命中时，对命中的敌人附加冰属性抗性降低{1}，持续{2}秒，对处于控制抗性的敌人效果提高至18%；多个刻印效果不可叠加。",
		maxLv = 1,
		type = 1,
		id = 600000032,
		extra_param = "",
		param = {
			{
				10,
				8,
				false,
				"%"
			},
			{
				8,
				0,
				false,
				""
			}
		}
	},
	[600000033] = {
		description = "治疗效果提高{1}。\n施加治疗时，被治疗的自身或者队友伤害提高{2}，持续{3}秒，多个刻印效果不可叠加；治疗者每有1%治疗效果提高，被治疗的自身或者队友伤害额外提高0.2%，该效果提供的伤害额外提高最高为15%。",
		maxLv = 1,
		type = 1,
		id = 600000033,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			},
			{
				5,
				0.1,
				false,
				"%"
			},
			{
				6,
				0,
				false,
				""
			}
		}
	},
	[600000034] = {
		description = "每次获得或恢复神能时，攻击力提高{1}，持续{3}秒，最多可叠加3层；每次消耗神能时，会心伤害提高{2}，持续{4}秒，最多可叠加3层。",
		maxLv = 1,
		type = 1,
		id = 600000034,
		extra_param = "",
		param = {
			{
				3,
				3,
				false,
				"%"
			},
			{
				12,
				12,
				false,
				"%"
			},
			{
				5,
				0,
				false,
				""
			},
			{
				5,
				0,
				false,
				""
			}
		}
	},
	[600000035] = {
		description = "每次消耗怒气时，攻击力提高{1}、怒气获得率提高{2}，持续{3}秒，最多可叠加5层，该效果每{4}秒最多触发一次。",
		maxLv = 1,
		type = 1,
		id = 600000035,
		extra_param = "",
		param = {
			{
				3,
				3,
				false,
				"%"
			},
			{
				8,
				8,
				false,
				"%"
			},
			{
				8,
				0,
				false,
				""
			},
			{
				3,
				0,
				false,
				""
			}
		}
	},
	[600000036] = {
		description = "近战伤害提高{1}。\n施放普通攻击命中时，技能伤害提高{2}，持续{3}秒，该效果每10秒最多触发一次。\n施放技能或奥义命中时，普通攻击伤害提高{4}，持续{5}秒，该效果每10秒最多触发一次。",
		maxLv = 1,
		type = 1,
		id = 600000036,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			},
			{
				5,
				0,
				false,
				"%"
			},
			{
				7,
				0,
				false,
				""
			},
			{
				15,
				0,
				false,
				"%"
			},
			{
				7,
				0,
				false,
				""
			}
		}
	},
	[600000037] = {
		description = "施放技能命中时，获得1个印记，该效果每12秒最多触发一次。\n普通攻击命中时，攻击力提高{1}，持续{2}秒，该效果每10秒最多触发一次。\n消耗印记后3秒内技能命中时，会心伤害提高{3}，持续{4}秒，最多可叠加2层，该效果每1秒最多触发一次。",
		maxLv = 1,
		type = 1,
		id = 600000037,
		extra_param = "",
		param = {
			{
				9,
				0,
				false,
				"%"
			},
			{
				9,
				0,
				false,
				""
			},
			{
				15,
				15,
				false,
				"%"
			},
			{
				9,
				0,
				false,
				""
			}
		}
	},
	[600000038] = {
		description = "能量获得率提高{1}。\n每有一个当前显示不处于冷却状态的技能或奥义，能量获得率都会额外提高{3}，自身能量不高于60时，每个提供的能量获得率提高至{4}。\n每有一个当前显示处于冷却状态的技能或奥义，会心伤害提高{2}。\n每累积消耗50点能量，全队伍伤害提高{5}，持续{6}秒，该效果每{7}秒最多触发一次，全队伍最多可叠加2层；触发间隔时间内累积消耗能量也会正常计算。",
		maxLv = 1,
		type = 1,
		id = 600000038,
		extra_param = "",
		param = {
			{
				20,
				0,
				false,
				"%"
			},
			{
				7,
				7,
				false,
				"%"
			},
			{
				20,
				20,
				false,
				"%"
			},
			{
				70,
				70,
				false,
				"%"
			},
			{
				5,
				5,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[600000039] = {
		description = "奥义伤害提高{1}。\n每次施放技能命中时获得1层「度衡」，每层「度衡」攻击力提高{2}，持续{3}秒，最多可叠加3层，当叠加至3层「度衡」时{5}秒内不再可叠加；达到3层「度衡」时，伤害提高{4}。",
		maxLv = 1,
		type = 1,
		id = 600000039,
		extra_param = "",
		param = {
			{
				30,
				0,
				false,
				"%"
			},
			{
				3,
				3,
				false,
				"%"
			},
			{
				3,
				0,
				false,
				""
			},
			{
				12,
				0,
				false,
				"%"
			},
			{
				15,
				0,
				false,
				""
			}
		}
	},
	[600000040] = {
		description = "雷属性伤害提高{1}。\n雷属性修正者消耗机制值至0时技能伤害提高，持续{2}秒，根据最后一次的消耗每消耗最大值机制值的1%，自身技能伤害提高{3}，该效果提供的技能伤害提高最高为40%。",
		maxLv = 1,
		type = 1,
		id = 600000040,
		extra_param = "",
		param = {
			{
				5,
				5,
				false,
				"%"
			},
			{
				2,
				0,
				false,
				""
			},
			{
				0.4,
				0.4,
				false,
				"%"
			}
		}
	},
	[600000041] = {
		description = "技能伤害提高{1}、奥义获得率提高{2}。\n当自身给队友附加奥义伤害提高时，自身进入「祝佑」状态，持续1秒，「祝佑」状态结束后，获得以下效果。\n技能伤害提高{3}、近战伤害提高{4}，持续{5}秒。",
		maxLv = 1,
		type = 1,
		id = 600000041,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			},
			{
				20,
				0,
				false,
				"%"
			},
			{
				20,
				0,
				false,
				"%"
			},
			{
				30,
				0,
				false,
				"%"
			},
			{
				15,
				0,
				false,
				""
			}
		}
	},
	[600000042] = {
		description = "生命值上限提高{1}。\n当自身拥有护盾时，会心率提高{2}。\n当给自身或者队友施加护盾时，被施加护盾的自身或者队友攻击力提高{3}、普通攻击伤害提高{4}，持续{5}秒，多个刻印效果不可叠加。",
		maxLv = 1,
		type = 1,
		id = 600000042,
		extra_param = "",
		param = {
			{
				20,
				0,
				false,
				"%"
			},
			{
				5,
				0,
				false,
				"%"
			},
			{
				15,
				0,
				false,
				"%"
			},
			{
				20,
				0,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[600000043] = {
		description = "火属性伤害提高{1}。\n火属性攻击命中瞬间会心伤害提高{2}。",
		maxLv = 1,
		type = 1,
		id = 600000043,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			},
			{
				30,
				0,
				false,
				"%"
			}
		}
	},
	[600000044] = {
		description = "风属性伤害提高{1}。\n雷属性攻击命中时，会心率提高{2}，持续{3}秒，该效果每{6}秒最多触发一次。\n雷属性攻击命中瞬间雷属性伤害提高{4}。\n风属性攻击命中瞬间风属性伤害提高{5}。",
		maxLv = 1,
		type = 1,
		id = 600000044,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			},
			{
				15,
				0,
				false,
				"%"
			},
			{
				7,
				0,
				false,
				""
			},
			{
				7,
				0,
				false,
				"%"
			},
			{
				7,
				0,
				false,
				"%"
			},
			{
				9,
				0,
				false,
				""
			}
		}
	},
	[600000045] = {
		description = "远程伤害提高{1}。\n施放普通攻击命中时，技能伤害提高{2}，持续{3}秒，该效果每{6}秒最多触发一次。\n施放技能或奥义命中时，普通攻击伤害提高{4}，持续{5}秒，该效果每{6}秒最多触发一次。",
		maxLv = 1,
		type = 1,
		id = 600000045,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			},
			{
				5,
				0,
				false,
				"%"
			},
			{
				7,
				0,
				false,
				""
			},
			{
				15,
				0,
				false,
				"%"
			},
			{
				7,
				0,
				false,
				""
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[600000046] = {
		description = "风属性攻击命中时，对命中的敌人附加风属性抗性降低{1}，持续{2}秒，多个刻印效果不可叠加。\n当给自身或者队友附加风属性伤害提高时，被附加风属性伤害提高的自身或者队友风属性攻击命中瞬间会心率提高{3}，持续{4}秒，多个刻印效果不可叠加。",
		maxLv = 1,
		type = 1,
		id = 600000046,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			},
			{
				8,
				0,
				false,
				""
			},
			{
				8,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			}
		}
	},
	[600000047] = {
		description = "风属性伤害提高{1}。\n风属性技能攻击命中瞬间技能伤害提高{2}。",
		maxLv = 1,
		type = 1,
		id = 600000047,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			},
			{
				20,
				0,
				false,
				"%"
			}
		}
	},
	[600000048] = {
		description = "冰属性攻击命中时，对命中的敌人附加冰属性抗性降低{1}，持续{2}秒，多个刻印效果不可叠加。\n冰属性技能攻击命中时，全队伍会心率提高{3}，持续{4}秒，该效果每{5}秒最多触发一次，多个刻印效果不可叠加。",
		maxLv = 1,
		type = 1,
		id = 600000048,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			},
			{
				8,
				0,
				false,
				""
			},
			{
				8,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			},
			{
				16,
				0,
				false,
				""
			}
		}
	},
	[600000049] = {
		description = "冰属性伤害提高{1}。\n冰属性攻击命中瞬间会心伤害提高{2}。\n当治疗自身或触发闪避效果时，冰属性技能攻击命中瞬间技能伤害提高{3}，持续{4}秒。",
		maxLv = 1,
		type = 1,
		id = 600000049,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			},
			{
				15,
				0,
				false,
				"%"
			},
			{
				15,
				0,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[600000050] = {
		description = "火属性伤害提高{1}，当生命值不高于50%时，命中瞬间火属性伤害额外提高{1}。\n当自身损失生命值时获得1层「残烬」效果、当生命值为1时每0.2秒获得1层「残烬」效果，「残烬」效果持续{2}秒，最多可叠加10层；拥有10层「残烬」时，移除所有层数并获得以下效果。\n攻击力提高{3}、会心率提高{4}，持续{5}秒。",
		maxLv = 1,
		type = 1,
		id = 600000050,
		extra_param = "",
		param = {
			{
				7,
				0,
				false,
				"%"
			},
			{
				4,
				0,
				false,
				""
			},
			{
				9,
				0,
				false,
				"%"
			},
			{
				15,
				0,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[600000051] = {
		description = "光属性伤害提高{1}。\n每次光属性技能攻击命中后，技能伤害提高{2}，持续{3}秒，最多可以叠加9层。",
		maxLv = 1,
		type = 1,
		id = 600000051,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			},
			{
				2.5,
				2.5,
				false,
				"%"
			},
			{
				9,
				0,
				false,
				""
			}
		}
	},
	[600000052] = {
		description = "水属性伤害提高{1}。\n水属性攻击命中瞬间会心伤害提高{2}。",
		maxLv = 1,
		type = 1,
		id = 600000052,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			},
			{
				30,
				0,
				false,
				"%"
			}
		}
	},
	[600000053] = {
		description = "雷属性伤害提高{1}。\n每次施放雷属性技能命中时，技能伤害提高{2}，持续{3}秒，最多可以叠加3层。",
		maxLv = 1,
		type = 1,
		id = 600000053,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			},
			{
				7.5,
				7.5,
				false,
				"%"
			},
			{
				7,
				0,
				false,
				""
			}
		}
	},
	[600000054] = {
		description = "物理攻击命中时，对命中的敌人附加物理属性抗性降低{1}，持续{2}秒，多个刻印效果不可叠加。\n物理技能攻击命中时，全队伍会心率提高{3}，持续{4}秒，该效果每{5}秒最多触发一次，多个刻印效果不可叠加。",
		maxLv = 1,
		type = 1,
		id = 600000054,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			},
			{
				8,
				0,
				false,
				""
			},
			{
				8,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			},
			{
				16,
				0,
				false,
				""
			}
		}
	},
	[600000055] = {
		description = "物理属性伤害提高{1}。\n每次获得或恢复机制值时，获得1层「朔月」，最多可叠加30层；每层「朔月」自身物理属性技能攻击命中瞬间技能伤害提高{2}。\n出场时获得3层「望月」，每次消耗机制值时，失去1层；每层「望月」自身物理属性攻击命中瞬间会心伤害提高{3}。",
		maxLv = 1,
		type = 1,
		id = 600000055,
		extra_param = "",
		param = {
			{
				9,
				0,
				false,
				"%"
			},
			{
				0.3,
				0.3,
				false,
				"%"
			},
			{
				3,
				3,
				false,
				"%"
			}
		}
	},
	[600000056] = {
		description = "攻击力提高{1}，修正系数提高{2}，获得硬直效果。\n修正系数不低于200%的攻击命中时，技能伤害提高{3}、会心伤害提高{4}，持续{5}秒。",
		maxLv = 1,
		type = 1,
		id = 600000056,
		extra_param = "",
		param = {
			{
				7,
				0,
				false,
				"%"
			},
			{
				20,
				0,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				"%"
			},
			{
				30,
				0,
				false,
				"%"
			},
			{
				16,
				0,
				false,
				""
			}
		}
	},
	[600000057] = {
		description = "暗属性攻击命中时，全队伍暗属性伤害提高{1}，持续{2}秒，多个刻印效果不可叠加。\n当给敌人附加暗属性抗性降低时，全队伍暗属性攻击命中瞬间会心率提高{3}，持续12秒，该效果每{4}秒最多触发一次，多个刻印效果不可叠加。",
		maxLv = 1,
		type = 1,
		id = 600000057,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			},
			{
				8,
				0,
				false,
				""
			},
			{
				8,
				0,
				false,
				"%"
			},
			{
				16,
				0,
				false,
				""
			}
		}
	},
	[600000058] = {
		description = "暗属性伤害提高{1}。\n暗属性技能攻击命中瞬间技能伤害提高{2}。",
		maxLv = 1,
		type = 1,
		id = 600000058,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			},
			{
				20,
				0,
				false,
				"%"
			}
		}
	},
	[600000059] = {
		description = "物理属性伤害提高{1}。\n物理属性攻击命中瞬间会心伤害提高{2}。",
		maxLv = 1,
		type = 1,
		id = 600000059,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			},
			{
				30,
				0,
				false,
				"%"
			}
		}
	},
	[600000060] = {
		description = "普通攻击命中时，技能伤害提高{1}，持续{2}秒。\n施放单人奥义时，会心伤害提高{3}，持续{4}秒。\n施放连携奥义时，奥义伤害提高{5}，持续{6}秒。",
		maxLv = 1,
		type = 1,
		id = 600000060,
		extra_param = "",
		param = {
			{
				12,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			},
			{
				18,
				0,
				false,
				"%"
			},
			{
				18,
				0,
				false,
				""
			},
			{
				24,
				0,
				false,
				"%"
			},
			{
				24,
				0,
				false,
				""
			}
		}
	},
	[600000061] = {
		description = "雷属性攻击命中时，对命中的敌人附加雷属性抗性降低{1}，持续{2}秒，多个刻印效果不可叠加。\n当给自身或者队友附加雷属性伤害提高时，被附加雷属性伤害提高的自身或者队友雷属性攻击命中瞬间会心率提高{3}，持续{4}秒，多个刻印效果不可叠加。",
		maxLv = 1,
		type = 1,
		id = 600000061,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			},
			{
				8,
				0,
				false,
				""
			},
			{
				8,
				0,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			}
		}
	},
	[600000062] = {
		description = "风属性伤害提高{1}。\n风属性攻击命中瞬间会心伤害提高{2}。\n自身解除连携奥义后，技能伤害提高{3}。",
		maxLv = 1,
		type = 1,
		id = 600000062,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			},
			{
				15,
				0,
				false,
				"%"
			},
			{
				15,
				0,
				false,
				"%"
			}
		}
	},
	[600000063] = {
		description = "怒气型修正者的技能伤害提高{1}。\n怒气获取率提高{2}。\n消耗怒气不低于30点时，会心伤害提高{3}，持续{4}秒。",
		maxLv = 1,
		type = 1,
		id = 600000063,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			},
			{
				15,
				0,
				false,
				"%"
			},
			{
				30,
				0,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[700000001] = {
		description = "不需要描述的模板填1",
		maxLv = 9999999,
		type = 1,
		id = 700000001,
		extra_param = "",
		param = {}
	},
	[700000101] = {
		description = "该敌方单位造成的伤害提高{1}",
		maxLv = 3,
		type = 1,
		id = 700000101,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000102] = {
		description = "该敌方单位受到的伤害降低{1}",
		maxLv = 3,
		type = 1,
		id = 700000102,
		extra_param = "",
		param = {
			{
				20,
				10,
				false,
				"%"
			}
		}
	},
	[700000103] = {
		description = "该敌方单位获得“霸体”状态，不受受击、击飞、击退效果影响，不受除冰冻以外的控制效果",
		maxLv = 1,
		type = 1,
		id = 700000103,
		extra_param = "",
		param = {}
	},
	[700000104] = {
		description = "该敌方单位的物理属性抗性提高{1}",
		maxLv = 4,
		type = 1,
		id = 700000104,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000105] = {
		description = "该敌方单位的光属性抗性提高{1}",
		maxLv = 4,
		type = 1,
		id = 700000105,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000106] = {
		description = "该敌方单位的暗属性抗性提高{1}",
		maxLv = 4,
		type = 1,
		id = 700000106,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000107] = {
		description = "该敌方单位的水属性抗性提高{1}",
		maxLv = 4,
		type = 1,
		id = 700000107,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000108] = {
		description = "该敌方单位的冰属性抗性提高{1}",
		maxLv = 4,
		type = 1,
		id = 700000108,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000109] = {
		description = "该敌方单位的火属性抗性提高{1}",
		maxLv = 4,
		type = 1,
		id = 700000109,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000110] = {
		description = "该敌方单位的风属性抗性提高{1}",
		maxLv = 4,
		type = 1,
		id = 700000110,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000111] = {
		description = "该敌方单位的雷属性抗性提高{1}",
		maxLv = 4,
		type = 1,
		id = 700000111,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000112] = {
		description = "该敌方单位的物理属性抗性降低{1}",
		maxLv = 3,
		type = 1,
		id = 700000112,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000113] = {
		description = "该敌方单位的光属性抗性降低{1}",
		maxLv = 3,
		type = 1,
		id = 700000113,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000114] = {
		description = "该敌方单位的暗属性抗性降低{1}",
		maxLv = 3,
		type = 1,
		id = 700000114,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000115] = {
		description = "该敌方单位的水属性抗性降低{1}",
		maxLv = 3,
		type = 1,
		id = 700000115,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000116] = {
		description = "该敌方单位的冰属性抗性降低{1}",
		maxLv = 3,
		type = 1,
		id = 700000116,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000117] = {
		description = "该敌方单位的火属性抗性降低{1}",
		maxLv = 3,
		type = 1,
		id = 700000117,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000118] = {
		description = "该敌方单位的风属性抗性降低{1}",
		maxLv = 3,
		type = 1,
		id = 700000118,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000119] = {
		description = "该敌方单位的雷属性抗性降低{1}",
		maxLv = 3,
		type = 1,
		id = 700000119,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000120] = {
		description = "该敌方单位10米范围外修正者攻击力降低{1}",
		maxLv = 4,
		type = 1,
		id = 700000120,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000121] = {
		description = "该敌方单位攻击命中后，使目标破甲，防御力降低{1}，持续{2}秒",
		maxLv = 3,
		type = 1,
		id = 700000121,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			},
			{
				3,
				0,
				false,
				""
			}
		}
	},
	[700000122] = {
		description = "该敌方单位攻击命中后，使目标灼烧，每3秒造成目标最大生命值{1}的伤害，持续{2}秒",
		maxLv = 3,
		type = 1,
		id = 700000122,
		extra_param = "",
		param = {
			{
				2,
				2,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			}
		}
	},
	[700000123] = {
		description = "该敌方单位攻击命中后，使目标眩晕，持续{1}秒",
		maxLv = 1,
		type = 1,
		id = 700000123,
		extra_param = "",
		param = {
			{
				2,
				0,
				false,
				""
			}
		}
	},
	[700000124] = {
		description = "该敌方单位攻击命中后，使目标受创，每3秒造成目标最大生命值{1}的伤害，持续{2}秒",
		maxLv = 3,
		type = 1,
		id = 700000124,
		extra_param = "",
		param = {
			{
				2,
				2,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			}
		}
	},
	[700000125] = {
		description = "该敌方单位攻击命中后，使目标禁锢，持续{1}秒",
		maxLv = 1,
		type = 1,
		id = 700000125,
		extra_param = "",
		param = {
			{
				2,
				0,
				false,
				""
			}
		}
	},
	[700000126] = {
		description = "该敌方单位攻击命中后，使目标冰冻，持续{1}秒",
		maxLv = 1,
		type = 1,
		id = 700000126,
		extra_param = "",
		param = {
			{
				2,
				0,
				false,
				""
			}
		}
	},
	[700000127] = {
		description = "该敌方单位攻击命中后，使目标减速，移动速度降低{1}，持续{2}秒",
		maxLv = 3,
		type = 1,
		id = 700000127,
		extra_param = "",
		param = {
			{
				20,
				10,
				false,
				"%"
			},
			{
				5,
				0,
				false,
				""
			}
		}
	},
	[700000128] = {
		description = "该敌方单位受到攻击时不会进入受击状态",
		maxLv = 1,
		type = 1,
		id = 700000128,
		extra_param = "",
		param = {}
	},
	[700000129] = {
		description = "该敌方单位被击败后，留下一颗3秒后引爆的炸弹，对爆炸范围内的修正者造成目标最大生命值30%的伤害",
		maxLv = 1,
		type = 1,
		id = 700000129,
		extra_param = "",
		param = {}
	},
	[700000131] = {
		description = "该敌方单位被击败后，大范围内其他敌方单位造成的伤害提高{1}、受到的伤害降低{2}，最多可叠加3层",
		maxLv = 1,
		type = 1,
		id = 700000131,
		extra_param = "",
		param = {
			{
				8,
				8,
				false,
				"%"
			},
			{
				8,
				8,
				false,
				"%"
			}
		}
	},
	[700000132] = {
		description = "该敌方单位10米范围内没有友方其他单位时，造成的伤害提高{1}",
		maxLv = 1,
		type = 1,
		id = 700000132,
		extra_param = "",
		param = {
			{
				20,
				0,
				false,
				"%"
			}
		}
	},
	[700000133] = {
		description = "每10秒，该敌方单位会瞬间移动至目标附近",
		maxLv = 1,
		type = 1,
		id = 700000133,
		extra_param = "",
		param = {}
	},
	[700000134] = {
		description = "该敌方单位被击败前，友方其他单位免疫伤害",
		maxLv = 1,
		type = 1,
		id = 700000134,
		extra_param = "",
		param = {}
	},
	[700000135] = {
		description = "该敌方单位每30秒释放一个护罩，持续15秒，护罩内的所有友方单位受到的伤害降低{1}",
		maxLv = 1,
		type = 1,
		id = 700000135,
		extra_param = "",
		param = {
			{
				90,
				0,
				false,
				"%"
			}
		}
	},
	[700000136] = {
		description = "该敌方单位生命值低于30%时，造成的伤害提高{1}，并获得“霸体”状态，战斗中仅生效一次",
		maxLv = 3,
		type = 1,
		id = 700000136,
		extra_param = "",
		param = {
			{
				30,
				30,
				false,
				"%"
			}
		}
	},
	[700000137] = {
		description = "该敌方单位的移动速度提高{1}",
		maxLv = 3,
		type = 1,
		id = 700000137,
		extra_param = "",
		param = {
			{
				15,
				15,
				false,
				"%"
			}
		}
	},
	[700000138] = {
		description = "该敌方单位受到攻击时，有10%的几率对所有修正者释放一次火山喷发，造成目标最大生命值{1}的火属性伤害，每8秒最多触发1次",
		maxLv = 3,
		type = 1,
		id = 700000138,
		extra_param = "",
		param = {
			{
				8,
				8,
				false,
				"%"
			}
		}
	},
	[700000139] = {
		description = "每10秒，该敌方单位造成的伤害提高{1}，受到的伤害降低{2}，最多可叠加10层",
		maxLv = 1,
		type = 1,
		id = 700000139,
		extra_param = "",
		param = {
			{
				5,
				5,
				false,
				"%"
			},
			{
				5,
				5,
				false,
				"%"
			}
		}
	},
	[700000140] = {
		description = "该敌方单位每20秒给队长修正者加一个诅咒，5秒后，诅咒传导至指定目标10米范围内的所有修正者，并对被传导的修正者造成目标最大生命值30%的暗属性伤害",
		maxLv = 1,
		type = 1,
		id = 700000140,
		extra_param = "",
		param = {}
	},
	[700000141] = {
		description = "距离该敌方单位{1}米范围内的修正者受到的治疗效果降低{2}",
		maxLv = 4,
		type = 1,
		id = 700000141,
		extra_param = "",
		param = {
			{
				15,
				0,
				false,
				""
			},
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000142] = {
		description = "该敌方单位被击败2秒后产生一滩的毒液，持续10秒，毒液中的修正者每秒受到自身最大生命值{1}的水属性伤害",
		maxLv = 3,
		type = 1,
		id = 700000142,
		extra_param = "",
		param = {
			{
				2,
				2,
				false,
				"%"
			}
		}
	},
	[700000143] = {
		description = "该敌方单位每10秒对所有修正者的当前位置召唤一道落雷，命中的目标受到自身最大生命值{1}的雷属性伤害，并眩晕2秒",
		maxLv = 3,
		type = 1,
		id = 700000143,
		extra_param = "",
		param = {
			{
				10,
				10,
				false,
				"%"
			}
		}
	},
	[700000144] = {
		description = "该敌方单位每20秒施放一个追踪冰球，冰球每0.5秒对接触到的修正者造成自身最大生命值{1}的冰属性伤害，并冰冻2秒",
		maxLv = 3,
		type = 1,
		id = 700000144,
		extra_param = "",
		param = {
			{
				1,
				1,
				false,
				"%"
			}
		}
	},
	[700000145] = {
		description = "该敌方单位每20秒在所有修正者的当前位置释放地裂，持续10秒，处于其中的修正者每秒受到自身最大生命值{1}的物理属性伤害",
		maxLv = 3,
		type = 1,
		id = 700000145,
		extra_param = "",
		param = {
			{
				2,
				2,
				false,
				"%"
			}
		}
	},
	[700000146] = {
		description = "每两个火链词缀的敌方单位之间出现火链，碰触到火链的修正者每秒受到自身最大生命值{1}的火属性伤害",
		maxLv = 3,
		type = 1,
		id = 700000146,
		extra_param = "",
		param = {
			{
				1,
				1,
				false,
				"%"
			}
		}
	},
	[700000147] = {
		description = "每两个共生词缀的敌方单位之间出现共生链，使受到的伤害平均分摊",
		maxLv = 1,
		type = 1,
		id = 700000147,
		extra_param = "",
		param = {}
	},
	[700000148] = {
		description = "该敌方单位每30秒开启一个反伤护盾，持续3秒，攻击者每次攻击时，都会受到攻击者自身最大生命值2%的反弹伤害",
		maxLv = 1,
		type = 1,
		id = 700000148,
		extra_param = "",
		param = {}
	},
	[700000149] = {
		description = "该敌方单位每10秒给大范围内其他敌方单位提供加成效果，造成伤害提高{1}、受到的伤害降低{2}，最多可叠加5层",
		maxLv = 1,
		type = 1,
		id = 700000149,
		extra_param = "",
		param = {
			{
				5,
				5,
				false,
				"%"
			},
			{
				5,
				5,
				false,
				"%"
			}
		}
	},
	[700000150] = {
		description = "该敌方单位每20秒恢复友方其他单位{1}的最大生命值",
		maxLv = 1,
		type = 1,
		id = 700000150,
		extra_param = "",
		param = {
			{
				12,
				0,
				false,
				"%"
			}
		}
	},
	[700000151] = {
		description = "该敌方单位每20秒对两位修正者释放一个电荷，若5秒内没有互相靠近抵消，则会对目标造成目标最大生命值{1}的雷属性伤害，并眩晕3秒",
		maxLv = 3,
		type = 1,
		id = 700000151,
		extra_param = "",
		param = {
			{
				15,
				15,
				false,
				"%"
			}
		}
	},
	[700000152] = {
		description = "该敌方单位生命值低于50%时，将召唤一个与当前状态完全一致的分身，战斗中仅生效一次",
		maxLv = 1,
		type = 1,
		id = 700000152,
		extra_param = "",
		param = {}
	},
	[700000153] = {
		description = "该敌方单位攻击命中后，该次有50%的概率扣除印记类型修正者的一个印记，除印记类修正者外的其他修正者机制值获得率降低50%，持续10秒",
		maxLv = 1,
		type = 1,
		id = 700000153,
		extra_param = "",
		param = {}
	},
	[700000154] = {
		description = "该敌方单位攻击命中后，目标当前闪避能量减少{1}，每{2}秒最多触发1次",
		maxLv = 3,
		type = 1,
		id = 700000154,
		extra_param = "",
		param = {
			{
				20,
				20,
				false,
				"%"
			},
			{
				2,
				0,
				false,
				""
			}
		}
	},
	[700000155] = {
		description = "修正者闪避能量最大值减少{1}",
		maxLv = 3,
		type = 1,
		id = 700000155,
		extra_param = "",
		param = {
			{
				20,
				20,
				false,
				"%"
			}
		}
	},
	[700000156] = {
		description = "修正者闪避能量恢复速度降低{1}",
		maxLv = 3,
		type = 1,
		id = 700000156,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000157] = {
		description = "修正者受到的治疗效果降低{1}",
		maxLv = 3,
		type = 1,
		id = 700000157,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000158] = {
		description = "修正者攻击力降低{1}",
		maxLv = 3,
		type = 1,
		id = 700000158,
		extra_param = "",
		param = {
			{
				15,
				15,
				false,
				"%"
			}
		}
	},
	[700000159] = {
		description = "修正者受到的伤害提高{1}",
		maxLv = 3,
		type = 1,
		id = 700000159,
		extra_param = "",
		param = {
			{
				15,
				15,
				false,
				"%"
			}
		}
	},
	[700000160] = {
		description = "修正者每秒损失1%的最大生命值",
		maxLv = 1,
		type = 1,
		id = 700000160,
		extra_param = "",
		param = {}
	},
	[700000161] = {
		description = "修正者的会心伤害降低{1}",
		maxLv = 3,
		type = 1,
		id = 700000161,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000162] = {
		description = "该敌方单位每秒对周围4米范围内的敌方单位造成自身攻击力{1}的火属性伤害",
		maxLv = 3,
		type = 1,
		id = 700000162,
		extra_param = "",
		param = {
			{
				3,
				3,
				false,
				"%"
			}
		}
	},
	[700000163] = {
		description = "关卡中不能通过闪避效果触发零时空间",
		maxLv = 1,
		type = 1,
		id = 700000163,
		extra_param = "",
		param = {}
	},
	[700000164] = {
		description = "该敌方单位生命值每减少1%，造成的伤害提高{1}",
		maxLv = 3,
		type = 1,
		id = 700000164,
		extra_param = "",
		param = {
			{
				0.3,
				0.3,
				false,
				"%"
			}
		}
	},
	[700000165] = {
		description = "该敌方单位受到的每次攻击会降低{1}的伤害",
		maxLv = 3,
		type = 1,
		id = 700000165,
		extra_param = "",
		param = {
			{
				1000,
				1000,
				false,
				""
			}
		}
	},
	[700000166] = {
		description = "该敌方单位单次受到的伤害最高为生命值上限的{1}",
		maxLv = 3,
		type = 1,
		id = 700000166,
		extra_param = "",
		param = {
			{
				5,
				-2,
				false,
				"%"
			}
		}
	},
	[700000167] = {
		description = "该敌方单位护甲穿透提高{1}",
		maxLv = 4,
		type = 1,
		id = 700000167,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000168] = {
		description = "该敌方单位受到的近战伤害降低{1}",
		maxLv = 4,
		type = 1,
		id = 700000168,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000169] = {
		description = "该敌方单位受到的远程伤害降低{1}",
		maxLv = 4,
		type = 1,
		id = 700000169,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000170] = {
		description = "该敌方单位受到的会心伤害降低{1}",
		maxLv = 4,
		type = 1,
		id = 700000170,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000171] = {
		description = "该敌方单位受到的会心率降低{1}",
		maxLv = 4,
		type = 1,
		id = 700000171,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000172] = {
		description = "该敌方单位10米范围内的友方其他单位攻击力提高{1}",
		maxLv = 3,
		type = 1,
		id = 700000172,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000173] = {
		description = "无法对该敌方单位开启修正模式",
		maxLv = 1,
		type = 1,
		id = 700000173,
		extra_param = "",
		param = {}
	},
	[700000174] = {
		description = "该敌方单位10米范围内每存在一个友方其他单位，自身攻击力提高{1}，最多可叠加5层",
		maxLv = 3,
		type = 1,
		id = 700000174,
		extra_param = "",
		param = {
			{
				5,
				5,
				false,
				"%"
			}
		}
	},
	[700000175] = {
		description = "该敌方单位获得一个最大生命值{1}的永久护盾，护盾存在时，受到攻击时不会进入受击状态",
		maxLv = 3,
		type = 1,
		id = 700000175,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000176] = {
		description = "修正模式无法响应神系共鸣",
		maxLv = 1,
		type = 1,
		id = 700000176,
		extra_param = "",
		param = {}
	},
	[700000177] = {
		description = "修正者闪避消耗的能量减少25%",
		maxLv = 1,
		type = 1,
		id = 700000177,
		extra_param = "",
		param = {}
	},
	[700000178] = {
		description = "修正者会心率提高{1}",
		maxLv = 3,
		type = 1,
		id = 700000178,
		extra_param = "",
		param = {
			{
				15,
				15,
				false,
				"%"
			}
		}
	},
	[700000179] = {
		description = "修正者怒气获得率提高50%",
		maxLv = 1,
		type = 1,
		id = 700000179,
		extra_param = "",
		param = {}
	},
	[700000180] = {
		description = "修正者能量获得率提高50%",
		maxLv = 1,
		type = 1,
		id = 700000180,
		extra_param = "",
		param = {}
	},
	[700000181] = {
		description = "修正者神能获得率提高50%",
		maxLv = 1,
		type = 1,
		id = 700000181,
		extra_param = "",
		param = {}
	},
	[700000182] = {
		description = "修正者获取印记时有50%概率多获取1个",
		maxLv = 1,
		type = 1,
		id = 700000182,
		extra_param = "",
		param = {}
	},
	[700000183] = {
		description = "修正者受到的伤害降低25%",
		maxLv = 1,
		type = 1,
		id = 700000183,
		extra_param = "",
		param = {}
	},
	[700000184] = {
		description = "修正者击败敌方单位时恢复自身5%的最大生命值",
		maxLv = 1,
		type = 1,
		id = 700000184,
		extra_param = "",
		param = {}
	},
	[700000185] = {
		description = "修正者奥义伤害提高300%",
		maxLv = 1,
		type = 1,
		id = 700000185,
		extra_param = "",
		param = {}
	},
	[700000186] = {
		description = "该敌方单位受到的伤害降低25%；处于持续伤害状态时，失去该减伤效果",
		maxLv = 1,
		type = 1,
		id = 700000186,
		extra_param = "",
		param = {}
	},
	[700000187] = {
		description = "该敌方单位每秒恢复自身{1}的最大生命值",
		maxLv = 1,
		type = 1,
		id = 700000187,
		extra_param = "",
		param = {
			{
				0.3,
				0,
				false,
				"%"
			}
		}
	},
	[700000188] = {
		description = "该敌方单位受到来自奥山系修正者的伤害降低{1}",
		maxLv = 4,
		type = 1,
		id = 700000188,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000189] = {
		description = "该敌方单位受到来自尼罗系修正者的伤害降低{1}",
		maxLv = 4,
		type = 1,
		id = 700000189,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000190] = {
		description = "该敌方单位受到来自真樱系修正者的伤害降低{1}",
		maxLv = 4,
		type = 1,
		id = 700000190,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000191] = {
		description = "该敌方单位受到来自圣树系修正者的伤害降低{1}",
		maxLv = 4,
		type = 1,
		id = 700000191,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000192] = {
		description = "该敌方单位受到来自众星系修正者的伤害降低{1}",
		maxLv = 4,
		type = 1,
		id = 700000192,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000193] = {
		description = "该敌方单位受到来自奥山系修正者的伤害提高{1}",
		maxLv = 3,
		type = 1,
		id = 700000193,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000194] = {
		description = "该敌方单位受到来自尼罗系修正者的伤害提高{1}",
		maxLv = 3,
		type = 1,
		id = 700000194,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000195] = {
		description = "该敌方单位受到来自真樱系修正者的伤害提高{1}",
		maxLv = 3,
		type = 1,
		id = 700000195,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000196] = {
		description = "该敌方单位受到来自圣树系修正者的伤害提高{1}",
		maxLv = 3,
		type = 1,
		id = 700000196,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000197] = {
		description = "该敌方单位受到来自众星系修正者的伤害提高{1}",
		maxLv = 3,
		type = 1,
		id = 700000197,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000198] = {
		description = "奥山系修正者造成的伤害提高{1}",
		maxLv = 3,
		type = 1,
		id = 700000198,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000199] = {
		description = "尼罗系修正者造成的伤害提高{1}",
		maxLv = 3,
		type = 1,
		id = 700000199,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000200] = {
		description = "真樱系修正者造成的伤害提高{1}",
		maxLv = 3,
		type = 1,
		id = 700000200,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000201] = {
		description = "圣树系修正者造成的伤害提高{1}",
		maxLv = 3,
		type = 1,
		id = 700000201,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000202] = {
		description = "众星系修正者造成的伤害提高{1}",
		maxLv = 3,
		type = 1,
		id = 700000202,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000203] = {
		description = "关卡中无法通过极限闪避触发闪避效果",
		maxLv = 1,
		type = 1,
		id = 700000203,
		extra_param = "",
		param = {}
	},
	[700000204] = {
		description = "该敌方单位被附加持续伤害状态后会立即移除该状态",
		maxLv = 1,
		type = 1,
		id = 700000204,
		extra_param = "",
		param = {}
	},
	[700000205] = {
		description = "该敌方单位在场时，修正者的治疗效果降低{1}",
		maxLv = 4,
		type = 1,
		id = 700000205,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000206] = {
		description = "该敌方单位被击倒后会获得10秒的“霸体”状态，期间造成的伤害提高30%",
		maxLv = 1,
		type = 1,
		id = 700000206,
		extra_param = "",
		param = {}
	},
	[700000207] = {
		description = "出场时，该敌方单位获得3秒的无敌",
		maxLv = 1,
		type = 1,
		id = 700000207,
		extra_param = "",
		param = {}
	},
	[700000208] = {
		description = "该敌方单位正面受到的伤害降低{1}，背面受到的伤害提高{2}",
		maxLv = 4,
		type = 1,
		id = 700000208,
		extra_param = "",
		param = {
			{
				25,
				10,
				false,
				"%"
			},
			{
				25,
				10,
				false,
				"%"
			}
		}
	},
	[700000209] = {
		description = "该敌方单位正面受到的伤害提高{1}，背面受到的伤害降低{2}",
		maxLv = 4,
		type = 1,
		id = 700000209,
		extra_param = "",
		param = {
			{
				25,
				10,
				false,
				"%"
			},
			{
				25,
				10,
				false,
				"%"
			}
		}
	},
	[700000210] = {
		description = "该敌方单位处于持续伤害状态时，造成的伤害提高{1}",
		maxLv = 1,
		type = 1,
		id = 700000210,
		extra_param = "",
		param = {
			{
				30,
				0,
				false,
				"%"
			}
		}
	},
	[700000211] = {
		description = "该敌方单位受到的普通攻击伤害提高{1}，受到的技能和奥义伤害降低{2}",
		maxLv = 4,
		type = 1,
		id = 700000211,
		extra_param = "",
		param = {
			{
				25,
				10,
				false,
				"%"
			},
			{
				25,
				10,
				false,
				"%"
			}
		}
	},
	[700000212] = {
		description = "该敌方单位受到的普通攻击伤害降低{1}，受到的技能和奥义伤害提高{2}",
		maxLv = 4,
		type = 1,
		id = 700000212,
		extra_param = "",
		param = {
			{
				25,
				10,
				false,
				"%"
			},
			{
				25,
				10,
				false,
				"%"
			}
		}
	},
	[700000213] = {
		description = "修正者每次受到治疗时，会受到相当于自身最大生命值10%的伤害，该效果每0.5秒最多触发一次",
		maxLv = 1,
		type = 1,
		id = 700000213,
		extra_param = "",
		param = {}
	},
	[700000214] = {
		description = "该敌方单位每10秒对全体敌方目标造成一次相当于自身攻击力{1}的伤害",
		maxLv = 3,
		type = 1,
		id = 700000214,
		extra_param = "",
		param = {
			{
				20,
				10,
				false,
				"%"
			}
		}
	},
	[700000215] = {
		description = "该敌方单位生命值低于30%时，每3秒恢复自身2%的最大生命值，持续15秒，战斗中仅生效一次",
		maxLv = 1,
		type = 1,
		id = 700000215,
		extra_param = "",
		param = {}
	},
	[700000216] = {
		description = "修正者能量获得率降低{1}",
		maxLv = 4,
		type = 1,
		id = 700000216,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000217] = {
		description = "修正者怒气获得率降低{1}",
		maxLv = 4,
		type = 1,
		id = 700000217,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000218] = {
		description = "修正者神能获得率降低{1}",
		maxLv = 4,
		type = 1,
		id = 700000218,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000219] = {
		description = "修正者每10秒扣除{1}个印记",
		maxLv = 1,
		type = 1,
		id = 700000219,
		extra_param = "",
		param = {
			{
				1,
				0,
				false,
				""
			}
		}
	},
	[700000220] = {
		description = "能量类型修正者的技能伤害降低{1}",
		maxLv = 4,
		type = 1,
		id = 700000220,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000221] = {
		description = "能量类型修正者的技能伤害提高{1}",
		maxLv = 3,
		type = 1,
		id = 700000221,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000222] = {
		description = "怒气类型修正者的技能伤害降低{1}",
		maxLv = 4,
		type = 1,
		id = 700000222,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000223] = {
		description = "怒气类型修正者的技能伤害提高{1}",
		maxLv = 3,
		type = 1,
		id = 700000223,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000224] = {
		description = "印记类型修正者的技能伤害降低{1}",
		maxLv = 4,
		type = 1,
		id = 700000224,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000225] = {
		description = "印记类型修正者的技能伤害提高{1}",
		maxLv = 3,
		type = 1,
		id = 700000225,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000226] = {
		description = "神能类型修正者的技能伤害降低{1}",
		maxLv = 4,
		type = 1,
		id = 700000226,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000227] = {
		description = "神能类型修正者的技能伤害提高{1}",
		maxLv = 3,
		type = 1,
		id = 700000227,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000228] = {
		description = "修正等级达到Ω级时，自身伤害提高75%；未达到时，自身伤害降低30%",
		maxLv = 1,
		type = 1,
		id = 700000228,
		extra_param = "",
		param = {}
	},
	[700000229] = {
		description = "评分值获取率降低30%",
		maxLv = 1,
		type = 1,
		id = 700000229,
		extra_param = "",
		param = {}
	},
	[700000230] = {
		description = "评分值获取率提高30%",
		maxLv = 1,
		type = 1,
		id = 700000230,
		extra_param = "",
		param = {}
	},
	[700000231] = {
		description = "修正值积累速度提高20%，修正模式内伤害提高150%，但非修正模式时造成的伤害降低50%",
		maxLv = 1,
		type = 1,
		id = 700000231,
		extra_param = "",
		param = {}
	},
	[700000232] = {
		description = "修正者对敌方普通单位造成的伤害降低{1}",
		maxLv = 3,
		type = 1,
		id = 700000232,
		extra_param = "",
		param = {
			{
				20,
				10,
				false,
				"%"
			}
		}
	},
	[700000233] = {
		description = "修正者持续蓄力类技能伤害提高25%，但所有伤害降低10%",
		maxLv = 1,
		type = 1,
		id = 700000233,
		extra_param = "",
		param = {}
	},
	[700000234] = {
		description = "修正者会心伤害提高{1}",
		maxLv = 3,
		type = 1,
		id = 700000234,
		extra_param = "",
		param = {
			{
				30,
				30,
				false,
				"%"
			}
		}
	},
	[700000235] = {
		description = "修正者受到的治疗效果提高{1}",
		maxLv = 3,
		type = 1,
		id = 700000235,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000236] = {
		description = "修正者攻击力提高{1}",
		maxLv = 3,
		type = 1,
		id = 700000236,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000237] = {
		description = "修正者造成的最终伤害提高{1}",
		maxLv = 3,
		type = 1,
		id = 700000237,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000238] = {
		description = "修正者造成的最终伤害降低{1}",
		maxLv = 3,
		type = 1,
		id = 700000238,
		extra_param = "",
		param = {
			{
				20,
				10,
				false,
				"%"
			}
		}
	},
	[700000239] = {
		description = "修正者奥义值获得率提高{1}",
		maxLv = 3,
		type = 1,
		id = 700000239,
		extra_param = "",
		param = {
			{
				30,
				30,
				false,
				"%"
			}
		}
	},
	[700000240] = {
		description = "修正者造成的伤害提高{1}",
		maxLv = 3,
		type = 1,
		id = 700000240,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000241] = {
		description = "修正者受到的伤害降低{1}",
		maxLv = 3,
		type = 1,
		id = 700000241,
		extra_param = "",
		param = {
			{
				20,
				10,
				false,
				"%"
			}
		}
	},
	[700000242] = {
		description = "修正者获得“霸体”状态，不受受击、击飞、击退效果影响，不受除冰冻以外的控制效果",
		maxLv = 1,
		type = 1,
		id = 700000242,
		extra_param = "",
		param = {}
	},
	[700000243] = {
		description = "修正者攻击命中后，使目标破甲，防御力降低{1}，持续{2}秒",
		maxLv = 3,
		type = 1,
		id = 700000243,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			},
			{
				3,
				0,
				false,
				""
			}
		}
	},
	[700000244] = {
		description = "修正者攻击命中后，使目标灼烧，每3秒造成目标最大生命值{1}的伤害，持续{2}秒",
		maxLv = 3,
		type = 1,
		id = 700000244,
		extra_param = "",
		param = {
			{
				2,
				2,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			}
		}
	},
	[700000245] = {
		description = "修正者攻击命中后，使目标眩晕，持续{1}秒",
		maxLv = 1,
		type = 1,
		id = 700000245,
		extra_param = "",
		param = {
			{
				2,
				0,
				false,
				""
			}
		}
	},
	[700000246] = {
		description = "修正者攻击命中后，使目标受创，每3秒造成目标最大生命值{1}的伤害，持续{2}秒",
		maxLv = 3,
		type = 1,
		id = 700000246,
		extra_param = "",
		param = {
			{
				2,
				2,
				false,
				"%"
			},
			{
				12,
				0,
				false,
				""
			}
		}
	},
	[700000247] = {
		description = "修正者攻击命中后，使目标禁锢，持续{1}秒",
		maxLv = 1,
		type = 1,
		id = 700000247,
		extra_param = "",
		param = {
			{
				2,
				0,
				false,
				""
			}
		}
	},
	[700000248] = {
		description = "修正者攻击命中后，使目标冰冻，持续{1}秒",
		maxLv = 1,
		type = 1,
		id = 700000248,
		extra_param = "",
		param = {
			{
				2,
				0,
				false,
				""
			}
		}
	},
	[700000249] = {
		description = "修正者攻击命中后，使目标减速，移动速度降低{1}，持续{2}秒",
		maxLv = 3,
		type = 1,
		id = 700000249,
		extra_param = "",
		param = {
			{
				20,
				10,
				false,
				"%"
			},
			{
				5,
				0,
				false,
				""
			}
		}
	},
	[700000250] = {
		description = "修正者受到攻击时不会进入受击状态",
		maxLv = 1,
		type = 1,
		id = 700000250,
		extra_param = "",
		param = {}
	},
	[700000251] = {
		description = "修正者生命值低于30%时，造成的伤害提高{1}，并获得“霸体”状态，战斗中仅生效一次",
		maxLv = 3,
		type = 1,
		id = 700000251,
		extra_param = "",
		param = {
			{
				30,
				30,
				false,
				"%"
			}
		}
	},
	[700000252] = {
		description = "修正者的移动速度提高{1}",
		maxLv = 3,
		type = 1,
		id = 700000252,
		extra_param = "",
		param = {
			{
				15,
				15,
				false,
				"%"
			}
		}
	},
	[700000253] = {
		description = "每10秒，修正者造成的伤害提高{1}、受到的伤害降低{2}，最多可叠加10层",
		maxLv = 1,
		type = 1,
		id = 700000253,
		extra_param = "",
		param = {
			{
				5,
				5,
				false,
				"%"
			},
			{
				5,
				5,
				false,
				"%"
			}
		}
	},
	[700000254] = {
		description = "修正者每30秒开启一个反伤护盾，持续3秒，攻击者每次攻击时，都会受到攻击者自身最大生命值2%的反弹伤害",
		maxLv = 1,
		type = 1,
		id = 700000254,
		extra_param = "",
		param = {}
	},
	[700000255] = {
		description = "修正者闪避能量最大值减少{1}",
		maxLv = 3,
		type = 1,
		id = 700000255,
		extra_param = "",
		param = {
			{
				20,
				20,
				false,
				"%"
			}
		}
	},
	[700000256] = {
		description = "修正者闪避能量恢复速度降低{1}",
		maxLv = 3,
		type = 1,
		id = 700000256,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000257] = {
		description = "修正者受到的治疗效果降低{1}",
		maxLv = 3,
		type = 1,
		id = 700000257,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000258] = {
		description = "修正者攻击力降低{1}",
		maxLv = 3,
		type = 1,
		id = 700000258,
		extra_param = "",
		param = {
			{
				15,
				15,
				false,
				"%"
			}
		}
	},
	[700000259] = {
		description = "修正者受到的伤害提高{1}",
		maxLv = 3,
		type = 1,
		id = 700000259,
		extra_param = "",
		param = {
			{
				15,
				15,
				false,
				"%"
			}
		}
	},
	[700000260] = {
		description = "修正者每秒损失1%的最大生命值",
		maxLv = 1,
		type = 1,
		id = 700000260,
		extra_param = "",
		param = {}
	},
	[700000261] = {
		description = "修正者的会心伤害降低{1}",
		maxLv = 3,
		type = 1,
		id = 700000261,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000262] = {
		description = "修正者生命值每减少1%，造成的伤害提高{1}",
		maxLv = 3,
		type = 1,
		id = 700000262,
		extra_param = "",
		param = {
			{
				0.3,
				0.3,
				false,
				"%"
			}
		}
	},
	[700000263] = {
		description = "修正者受到的每次攻击会降低{1}的伤害",
		maxLv = 3,
		type = 1,
		id = 700000263,
		extra_param = "",
		param = {
			{
				1000,
				1000,
				false,
				""
			}
		}
	},
	[700000264] = {
		description = "修正者单次受到的伤害最高为生命值上限的{1}",
		maxLv = 3,
		type = 1,
		id = 700000264,
		extra_param = "",
		param = {
			{
				5,
				-2,
				false,
				"%"
			}
		}
	},
	[700000265] = {
		description = "修正者护甲穿透提高{1}",
		maxLv = 4,
		type = 1,
		id = 700000265,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000266] = {
		description = "修正者受到的近战伤害降低{1}",
		maxLv = 4,
		type = 1,
		id = 700000266,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000267] = {
		description = "修正者受到的远程伤害降低{1}",
		maxLv = 4,
		type = 1,
		id = 700000267,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000268] = {
		description = "修正者受到的会心伤害降低{1}",
		maxLv = 4,
		type = 1,
		id = 700000268,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000269] = {
		description = "修正者获得一个最大生命值{1}的永久护盾，护盾存在时，受到攻击时不会进入受击状态",
		maxLv = 3,
		type = 1,
		id = 700000269,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000270] = {
		description = "修正者受到的伤害降低25%，处于持续伤害状态时，失去该减伤效果",
		maxLv = 1,
		type = 1,
		id = 700000270,
		extra_param = "",
		param = {}
	},
	[700000271] = {
		description = "修正者每秒恢复自身{1}的最大生命值",
		maxLv = 1,
		type = 1,
		id = 700000271,
		extra_param = "",
		param = {
			{
				0.3,
				0,
				false,
				"%"
			}
		}
	},
	[700000272] = {
		description = "修正者被附加的持续伤害状态后会立即移除",
		maxLv = 1,
		type = 1,
		id = 700000272,
		extra_param = "",
		param = {}
	},
	[700000273] = {
		description = "修正者被击倒后会获得10秒的“霸体”状态，期间造成的伤害提高30%",
		maxLv = 1,
		type = 1,
		id = 700000273,
		extra_param = "",
		param = {}
	},
	[700000274] = {
		description = "出场时，修正者获得3秒的无敌",
		maxLv = 1,
		type = 1,
		id = 700000274,
		extra_param = "",
		param = {}
	},
	[700000275] = {
		description = "修正者正面受到的伤害降低{1}，背面受到的伤害提高{2}",
		maxLv = 4,
		type = 1,
		id = 700000275,
		extra_param = "",
		param = {
			{
				25,
				10,
				false,
				"%"
			},
			{
				25,
				10,
				false,
				"%"
			}
		}
	},
	[700000276] = {
		description = "修正者正面受到的伤害提高{1}，背面受到的伤害降低{2}",
		maxLv = 4,
		type = 1,
		id = 700000276,
		extra_param = "",
		param = {
			{
				25,
				10,
				false,
				"%"
			},
			{
				25,
				10,
				false,
				"%"
			}
		}
	},
	[700000277] = {
		description = "修正者处于持续伤害状态时，获得{1}的伤害提高效果",
		maxLv = 1,
		type = 1,
		id = 700000277,
		extra_param = "",
		param = {
			{
				30,
				0,
				false,
				"%"
			}
		}
	},
	[700000278] = {
		description = "修正者受到的普攻伤害提高{1}，受到的技能和奥义伤害降低{2}",
		maxLv = 4,
		type = 1,
		id = 700000278,
		extra_param = "",
		param = {
			{
				25,
				10,
				false,
				"%"
			},
			{
				25,
				10,
				false,
				"%"
			}
		}
	},
	[700000279] = {
		description = "修正者受到的普攻伤害降低{1}，受到的技能和奥义伤害提高{2}",
		maxLv = 4,
		type = 1,
		id = 700000279,
		extra_param = "",
		param = {
			{
				25,
				10,
				false,
				"%"
			},
			{
				25,
				10,
				false,
				"%"
			}
		}
	},
	[700000280] = {
		description = "修正者生命值低于30%时，每3秒恢复自身2%的最大生命值，持续15秒，战斗中仅生效一次",
		maxLv = 1,
		type = 1,
		id = 700000280,
		extra_param = "",
		param = {}
	},
	[700000281] = {
		description = "该敌方单位受到致命伤害后，血量锁定为1点，获得无敌效果，持续{1}秒，结束后死亡",
		maxLv = 1,
		type = 1,
		id = 700000281,
		extra_param = "",
		param = {
			{
				7,
				0,
				false,
				""
			}
		}
	},
	[700000282] = {
		description = "该敌方单位进入修正空间后，依然能正常行动，且这段时间内修正者无法通过闪避效果触发零时空间",
		maxLv = 1,
		type = 1,
		id = 700000282,
		extra_param = "",
		param = {}
	},
	[700000283] = {
		description = "修正模式下，该敌方单位每3秒产生一道向自身聚拢的圆形震波，修正者被命中时有较大概率打断当前技能，并受到{1}最大生命值的伤害。",
		maxLv = 1,
		type = 1,
		id = 700000283,
		extra_param = "",
		param = {
			{
				3,
				0,
				false,
				"%"
			}
		}
	},
	[700000284] = {
		description = "该敌方单位在零时空间内受到伤害提高{1}，零时空间外受到的伤害降低{2}",
		maxLv = 3,
		type = 1,
		id = 700000284,
		extra_param = "",
		param = {
			{
				30,
				30,
				false,
				"%"
			},
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000285] = {
		description = "该敌方单位被任意一种属性攻击命中后，提升对该属性{1}的伤害抗性，持续10秒，持续时间内不可再次触发",
		maxLv = 4,
		type = 1,
		id = 700000285,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000286] = {
		description = "该敌方单位处于非控制抗性状态时，受到的伤害降低{1}，处于控制抗性状态时，受到伤害提升{2}",
		maxLv = 3,
		type = 1,
		id = 700000286,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			},
			{
				10,
				10,
				false,
				"%"
			}
		}
	},
	[700000287] = {
		description = "该敌方单位附近大范围内其他敌人造成的伤害提高{1}，该效果每10秒触发1次，最多可叠加5层",
		maxLv = 1,
		type = 1,
		id = 700000287,
		extra_param = "",
		param = {
			{
				5,
				5,
				false,
				"%"
			}
		}
	},
	[700000288] = {
		description = "该敌方单位附近大范围内其他敌人受到的伤害降低{1}，该效果每10秒触发1次，最多可叠加5层",
		maxLv = 1,
		type = 1,
		id = 700000288,
		extra_param = "",
		param = {
			{
				5,
				5,
				false,
				"%"
			}
		}
	},
	[700000289] = {
		description = "该敌方单位造成的伤害提高{1}，该效果每10秒触发1次，最多可叠加10层",
		maxLv = 1,
		type = 1,
		id = 700000289,
		extra_param = "",
		param = {
			{
				3,
				3,
				false,
				"%"
			}
		}
	},
	[700000290] = {
		description = "该敌方单位受到的伤害降低{1}，该效果每10秒触发1次，最多可叠加10层",
		maxLv = 1,
		type = 1,
		id = 700000290,
		extra_param = "",
		param = {
			{
				3,
				3,
				false,
				"%"
			}
		}
	},
	[700000291] = {
		description = "该敌方单位被击败后，附近大范围内其他敌人造成的伤害提高{1}，最多可叠加3层",
		maxLv = 1,
		type = 1,
		id = 700000291,
		extra_param = "",
		param = {
			{
				8,
				8,
				false,
				"%"
			}
		}
	},
	[700000292] = {
		description = "该敌方单位被击败后，附近大范围内其他敌人受到的伤害降低{1}，最多可叠加3层",
		maxLv = 1,
		type = 1,
		id = 700000292,
		extra_param = "",
		param = {
			{
				8,
				8,
				false,
				"%"
			}
		}
	},
	[700000293] = {
		description = "该敌方单位被会心攻击命中时，该次伤害降低{1}",
		maxLv = 3,
		type = 1,
		id = 700000293,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000294] = {
		description = "该敌方单位被非会心攻击命中时，该次伤害降低{1}",
		maxLv = 3,
		type = 1,
		id = 700000294,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000295] = {
		description = "该敌方单位处于非控制状态时，受到的伤害降低{1}，处于通用控制状态时，受到伤害提高{2}",
		maxLv = 4,
		type = 1,
		id = 700000295,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			},
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000296] = {
		description = "该敌方单位被命中且击败时，清空攻击者的机制值（怒气、能量、印记、神能）",
		maxLv = 1,
		type = 1,
		id = 700000296,
		extra_param = "",
		param = {}
	},
	[700000297] = {
		description = "该敌方单位受到的伤害降低{1}，当攻击被极限闪避时，会受到一次生命最大值{2}的伤害，该伤害无视「狭锋」的减伤效果",
		maxLv = 4,
		type = 1,
		id = 700000297,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			},
			{
				100,
				-20,
				false,
				"%"
			}
		}
	},
	[700000298] = {
		description = "该敌方单位受到的伤害降低80%，每次受击后伤害降低效果减少2%，10秒未受击则恢复初始值",
		maxLv = 1,
		type = 1,
		id = 700000298,
		extra_param = "",
		param = {
			{
				9999.999,
				0,
				false,
				""
			}
		}
	},
	[700000299] = {
		description = "该敌方单位命中血量高于{1}的修正者方单位，伤害提高{2}",
		maxLv = 3,
		type = 1,
		id = 700000299,
		extra_param = "",
		param = {
			{
				50,
				0,
				false,
				"%"
			},
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000300] = {
		description = "该敌方单位出场后获得护盾，护盾最多抵御{1}次攻击，护盾消失后攻击力提高{2}",
		maxLv = 1,
		type = 1,
		id = 700000300,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				""
			},
			{
				100,
				0,
				false,
				"%"
			}
		}
	},
	[700000301] = {
		description = "队友对该敌方单位造成的伤害降低{1}",
		maxLv = 4,
		type = 1,
		id = 700000301,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000302] = {
		description = "该敌方单位受到的伤害根据修正者当前机制值（怒气、能量、印记、神能）按百分比减免，机制值越高减免越高，最高100%",
		maxLv = 1,
		type = 1,
		id = 700000302,
		extra_param = "",
		param = {}
	},
	[700000303] = {
		description = "该敌方单位存在于场上时，零时空间不会使敌人减速，且修正者方单位无法免疫伤害",
		maxLv = 1,
		type = 1,
		id = 700000303,
		extra_param = "",
		param = {}
	},
	[700000304] = {
		description = "该敌方单位对修正者一技能的抗性提高{1}",
		maxLv = 3,
		type = 1,
		id = 700000304,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000305] = {
		description = "该敌方单位对修正者二技能的抗性提高{1}",
		maxLv = 3,
		type = 1,
		id = 700000305,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000306] = {
		description = "该敌方单位对修正者三技能的抗性提高{1}",
		maxLv = 3,
		type = 1,
		id = 700000306,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000307] = {
		description = "该敌方单位受到的伤害降低{1}，修正者方单位对其造成的蓄力攻击伤害提高{2}",
		maxLv = 3,
		type = 1,
		id = 700000307,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			},
			{
				30,
				30,
				false,
				"%"
			}
		}
	},
	[700000308] = {
		description = "该敌方单位存在于场上时，所有精英以上敌人造成的伤害提高{1}、受到的伤害降低{2}，具有该效果的单位都被击败后移除效果，并使场上随机一个精英及以上的敌人进入修正模式",
		maxLv = 4,
		type = 1,
		id = 700000308,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			},
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000309] = {
		description = "该敌方单位结束修正模式后，修正者方单位的修正系数降低{1}，该效果可叠加",
		maxLv = 1,
		type = 1,
		id = 700000309,
		extra_param = "",
		param = {
			{
				30,
				30,
				false,
				"%"
			}
		}
	},
	[700000310] = {
		description = "该敌方单位攻击力提高{1}，防御力提高{2}，生命值上限提高{3}，修正值上限提高{3}",
		maxLv = 5,
		type = 1,
		id = 700000310,
		extra_param = "",
		param = {
			{
				10,
				10,
				false,
				"%"
			},
			{
				10,
				10,
				false,
				"%"
			},
			{
				10,
				10,
				false,
				"%"
			}
		}
	},
	[700000311] = {
		description = "修正者每施放一次技能，当前奥义值总量减少{1}",
		maxLv = 3,
		type = 1,
		id = 700000311,
		extra_param = "",
		param = {
			{
				1,
				1,
				false,
				"%"
			}
		}
	},
	[700000312] = {
		description = "修正者被命中后损失5点神能/怒气/能量或15%概率损失1个印记",
		maxLv = 1,
		type = 1,
		id = 700000312,
		extra_param = "",
		param = {}
	},
	[700000313] = {
		description = "全队修正者造成的修正值降低{1}",
		maxLv = 4,
		type = 1,
		id = 700000313,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000314] = {
		description = "修正者不受护盾保护时受到的伤害提高{1}",
		maxLv = 3,
		type = 1,
		id = 700000314,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000315] = {
		description = "修正者受到护盾保护时受到的伤害提高{1}",
		maxLv = 3,
		type = 1,
		id = 700000315,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000316] = {
		description = "进入修正空间后，全队修正者会心伤害降低{1}",
		maxLv = 3,
		type = 1,
		id = 700000316,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000317] = {
		description = "进入修正空间后，全队修正者每秒受到相当于自身最大生命值{1}的伤害",
		maxLv = 3,
		type = 1,
		id = 700000317,
		extra_param = "",
		param = {
			{
				1,
				1,
				false,
				"%"
			}
		}
	},
	[700000318] = {
		description = "进入修正空间后，全队修正者治疗效果下降{1}",
		maxLv = 3,
		type = 1,
		id = 700000318,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000319] = {
		description = "处于修正空间中时，全队修正者造成会心伤害后增加各自正在冷却中的非奥义技能的冷却时间1秒",
		maxLv = 1,
		type = 1,
		id = 700000319,
		extra_param = "",
		param = {}
	},
	[700000320] = {
		description = "修正者生命值低于50%时受到伤害提升{1}",
		maxLv = 3,
		type = 1,
		id = 700000320,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000321] = {
		description = "修正者每损失1%的生命值，伤害降低{1}",
		maxLv = 3,
		type = 1,
		id = 700000321,
		extra_param = "",
		param = {
			{
				0.3,
				0.3,
				false,
				"%"
			}
		}
	},
	[700000322] = {
		description = "修正者每命中一个敌人降低自身伤害7%，最多降低98%，持续{1}秒",
		maxLv = 1,
		type = 1,
		id = 700000322,
		extra_param = "",
		param = {
			{
				3,
				0,
				false,
				""
			}
		}
	},
	[700000323] = {
		description = "修正者每命中一个敌人降低自身防御10%，最多降低100%，持续{1}秒",
		maxLv = 1,
		type = 1,
		id = 700000323,
		extra_param = "",
		param = {
			{
				3,
				0,
				false,
				""
			}
		}
	},
	[700000324] = {
		description = "全队修正者战斗前20秒内防御力降低{1}",
		maxLv = 4,
		type = 1,
		id = 700000324,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000325] = {
		description = "全队修正者战斗前20秒内会心率降低{1}",
		maxLv = 4,
		type = 1,
		id = 700000325,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000326] = {
		description = "修正者进入零时空间后，触发者伤害降低{1}，持续{2}秒",
		maxLv = 3,
		type = 1,
		id = 700000326,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[700000327] = {
		description = "修正者进入零时空间后，触发者防御降低{1}，持续{2}秒",
		maxLv = 3,
		type = 1,
		id = 700000327,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[700000328] = {
		description = "修正者每次施放技能或奥义自身伤害降低{1}，持续{2}秒，可叠加3层，叠加时刷新持续时间",
		maxLv = 3,
		type = 1,
		id = 700000328,
		extra_param = "",
		param = {
			{
				5,
				5,
				false,
				"%"
			},
			{
				3,
				0,
				false,
				""
			}
		}
	},
	[700000329] = {
		description = "修正者每次施放技能或奥义自身防御降低{1}，持续{2}秒，可叠加3层，叠加时刷新持续时间",
		maxLv = 3,
		type = 1,
		id = 700000329,
		extra_param = "",
		param = {
			{
				5,
				5,
				false,
				"%"
			},
			{
				3,
				0,
				false,
				""
			}
		}
	},
	[700000330] = {
		description = "修正者造成会心伤害后自身伤害降低{1}，持续{2}秒，可叠加3层，叠加时刷新持续时间",
		maxLv = 3,
		type = 1,
		id = 700000330,
		extra_param = "",
		param = {
			{
				5,
				5,
				false,
				"%"
			},
			{
				3,
				0,
				false,
				""
			}
		}
	},
	[700000331] = {
		description = "修正者造成会心伤害后自身防御降低{1}，持续{2}秒，可叠加3层，叠加时刷新持续时间",
		maxLv = 3,
		type = 1,
		id = 700000331,
		extra_param = "",
		param = {
			{
				5,
				5,
				false,
				"%"
			},
			{
				3,
				0,
				false,
				""
			}
		}
	},
	[700000332] = {
		description = "修正者受到治疗后防御降低{1}，持续{2}秒，可叠加3层，叠加时刷新持续时间",
		maxLv = 3,
		type = 1,
		id = 700000332,
		extra_param = "",
		param = {
			{
				5,
				5,
				false,
				"%"
			},
			{
				5,
				0,
				false,
				""
			}
		}
	},
	[700000333] = {
		description = "修正者受到治疗后伤害降低{1}，持续{2}秒，可叠加3层，叠加时刷新持续时间",
		maxLv = 3,
		type = 1,
		id = 700000333,
		extra_param = "",
		param = {
			{
				5,
				5,
				false,
				"%"
			},
			{
				5,
				0,
				false,
				""
			}
		}
	},
	[700000334] = {
		description = "修正者移速降低{1}",
		maxLv = 3,
		type = 1,
		id = 700000334,
		extra_param = "",
		param = {
			{
				15,
				15,
				false,
				"%"
			}
		}
	},
	[700000335] = {
		description = "圣树神系修正者机制值获得率提高{1}",
		maxLv = 5,
		type = 1,
		id = 700000335,
		extra_param = "",
		param = {
			{
				5,
				5,
				false,
				"%"
			}
		}
	},
	[700000336] = {
		description = "真樱神系修正者对普通敌人的伤害提高{1}",
		maxLv = 5,
		type = 1,
		id = 700000336,
		extra_param = "",
		param = {
			{
				5,
				5,
				false,
				"%"
			}
		}
	},
	[700000337] = {
		description = "奥山神系修正者修正系数提高{1}",
		maxLv = 5,
		type = 1,
		id = 700000337,
		extra_param = "",
		param = {
			{
				10,
				10,
				false,
				"%"
			}
		}
	},
	[700000338] = {
		description = "尼罗神系修正者会心伤害提高{1}",
		maxLv = 5,
		type = 1,
		id = 700000338,
		extra_param = "",
		param = {
			{
				10,
				10,
				false,
				"%"
			}
		}
	},
	[700000339] = {
		description = "众星神系修正者对精英和首领伤害提高{1}",
		maxLv = 5,
		type = 1,
		id = 700000339,
		extra_param = "",
		param = {
			{
				5,
				5,
				false,
				"%"
			}
		}
	},
	[700000340] = {
		description = "修正者施放技能或奥义后，技能伤害提高{1}，最多叠加5层，施放普通攻击后移除该效果，并且10秒内无法再次获得该效果。",
		maxLv = 1,
		type = 1,
		id = 700000340,
		extra_param = "",
		param = {
			{
				10,
				10,
				false,
				"%"
			}
		}
	},
	[700000341] = {
		description = "攻击力提升{1}(20%)\n（等级上限5级，括号内为满级数值）",
		maxLv = 5,
		type = 1,
		id = 700000341,
		extra_param = "",
		param = {
			{
				10,
				2.5,
				false,
				"%"
			}
		}
	},
	[700000342] = {
		description = "减伤提升{1}(30%)\n（等级上限5级，括号内为满级数值）",
		maxLv = 5,
		type = 1,
		id = 700000342,
		extra_param = "",
		param = {
			{
				10,
				5,
				false,
				"%"
			}
		}
	},
	[700000343] = {
		description = "奥义伤害提升{1}(40%)\n（等级上限5级，括号内为满级数值）",
		maxLv = 5,
		type = 1,
		id = 700000343,
		extra_param = "",
		param = {
			{
				20,
				5,
				false,
				"%"
			}
		}
	},
	[700000344] = {
		description = "会心率增加{1}(20%)\n（等级上限5级，括号内为满级数值）",
		maxLv = 5,
		type = 1,
		id = 700000344,
		extra_param = "",
		param = {
			{
				10,
				2.5,
				false,
				"%"
			}
		}
	},
	[700000345] = {
		description = "会心伤害增加{1}(40%)\n（等级上限5级，括号内为满级数值）",
		maxLv = 5,
		type = 1,
		id = 700000345,
		extra_param = "",
		param = {
			{
				20,
				5,
				false,
				"%"
			}
		}
	},
	[700000346] = {
		description = "对小怪伤害提高{1}(40%)\n（等级上限5级，括号内为满级数值）",
		maxLv = 5,
		type = 1,
		id = 700000346,
		extra_param = "",
		param = {
			{
				20,
				5,
				false,
				"%"
			}
		}
	},
	[700000347] = {
		description = "对精英和Boss伤害加成{1}(20%)\n（等级上限5级，括号内为满级数值）",
		maxLv = 5,
		type = 1,
		id = 700000347,
		extra_param = "",
		param = {
			{
				10,
				2.5,
				false,
				"%"
			}
		}
	},
	[700000348] = {
		description = "普攻伤害加成{1}(20%)\n（等级上限5级，括号内为满级数值）",
		maxLv = 5,
		type = 1,
		id = 700000348,
		extra_param = "",
		param = {
			{
				10,
				2.5,
				false,
				"%"
			}
		}
	},
	[700000349] = {
		description = "修正指数提升{1}(20%)\n（等级上限5级，括号内为满级数值）",
		maxLv = 5,
		type = 1,
		id = 700000349,
		extra_param = "",
		param = {
			{
				10,
				2.5,
				false,
				"%"
			}
		}
	},
	[700000350] = {
		description = "闪避消耗降低{1}(40%)\n（等级上限5级，括号内为满级数值）",
		maxLv = 5,
		type = 1,
		id = 700000350,
		extra_param = "",
		param = {
			{
				20,
				5,
				false,
				"%"
			}
		}
	},
	[700000351] = {
		description = "本回廊中作战附带额外效果\n修正模式中，会心伤害提升200%",
		maxLv = 1,
		type = 1,
		id = 700000351,
		extra_param = "",
		param = {}
	},
	[700000352] = {
		description = "本回廊中作战附带额外效果\n命中视骸回复生命值",
		maxLv = 1,
		type = 1,
		id = 700000352,
		extra_param = "",
		param = {}
	},
	[700000353] = {
		description = "本回廊中作战附带额外效果\n技能、普攻和奥义命中会随机减少一个技能2秒的CD\n触发后有1秒钟的冷却时间",
		maxLv = 1,
		type = 1,
		id = 700000353,
		extra_param = "",
		param = {}
	},
	[700000354] = {
		description = "本回廊中作战附带额外效果\n释放奥义后每秒回复释放者血量4%持续10秒",
		maxLv = 1,
		type = 1,
		id = 700000354,
		extra_param = "",
		param = {}
	},
	[700000355] = {
		description = "本回廊中作战附带额外效果\n释放奥义后，全队十秒内获得移速加成50%，提升最终伤害50%",
		maxLv = 1,
		type = 1,
		id = 700000355,
		extra_param = "",
		param = {}
	},
	[700000356] = {
		description = "分档燃烧生命",
		maxLv = 2,
		type = 1,
		id = 700000356,
		extra_param = "",
		param = {}
	},
	[700000357] = {
		description = "攻击力提升{1}",
		maxLv = 20,
		type = 1,
		id = 700000357,
		extra_param = "",
		param = {
			{
				10,
				5,
				false,
				"%"
			}
		}
	},
	[700000358] = {
		description = "防御力提升{1}",
		maxLv = 20,
		type = 1,
		id = 700000358,
		extra_param = "",
		param = {
			{
				10,
				5,
				false,
				"%"
			}
		}
	},
	[700000359] = {
		description = "会心率提升{1}",
		maxLv = 20,
		type = 1,
		id = 700000359,
		extra_param = "",
		param = {
			{
				5,
				3,
				false,
				"%"
			}
		}
	},
	[700000360] = {
		description = "会心伤害提升{1}",
		maxLv = 20,
		type = 1,
		id = 700000360,
		extra_param = "",
		param = {
			{
				5,
				3,
				false,
				"%"
			}
		}
	},
	[700000361] = {
		description = "该敌方单位处于无敌状态。",
		maxLv = 1,
		type = 1,
		id = 700000361,
		extra_param = "",
		param = {}
	},
	[700000362] = {
		description = "该敌方单位受到来自天垣系修正者的伤害降低{1}",
		maxLv = 4,
		type = 1,
		id = 700000362,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000363] = {
		description = "该敌方单位受到来自天垣系修正者的伤害提高{1}",
		maxLv = 3,
		type = 1,
		id = 700000363,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000364] = {
		description = "天垣系修正者造成的伤害提高{1}",
		maxLv = 3,
		type = 1,
		id = 700000364,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000365] = {
		description = "敌方单位物理以外的属性抗性提高{1}",
		maxLv = 4,
		type = 1,
		id = 700000365,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000366] = {
		description = "敌方单位光以外的属性抗性提高{1}",
		maxLv = 4,
		type = 1,
		id = 700000366,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000367] = {
		description = "敌方单位暗以外的属性抗性提高{1}",
		maxLv = 4,
		type = 1,
		id = 700000367,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000368] = {
		description = "敌方单位水以外的属性抗性提高{1}",
		maxLv = 4,
		type = 1,
		id = 700000368,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000369] = {
		description = "敌方单位冰以外的属性抗性提高{1}",
		maxLv = 4,
		type = 1,
		id = 700000369,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000370] = {
		description = "敌方单位火以外的属性抗性提高{1}",
		maxLv = 4,
		type = 1,
		id = 700000370,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000371] = {
		description = "敌方单位风以外的属性抗性提高{1}",
		maxLv = 4,
		type = 1,
		id = 700000371,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000372] = {
		description = "敌方单位雷以外的属性抗性提高{1}",
		maxLv = 4,
		type = 1,
		id = 700000372,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000373] = {
		description = "敌方单位的物理属性抗性降低{1}",
		maxLv = 4,
		type = 1,
		id = 700000373,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000374] = {
		description = "敌方单位的光属性抗性降低{1}",
		maxLv = 4,
		type = 1,
		id = 700000374,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000375] = {
		description = "敌方单位的暗属性抗性降低{1}",
		maxLv = 4,
		type = 1,
		id = 700000375,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000376] = {
		description = "敌方单位的水属性抗性降低{1}",
		maxLv = 4,
		type = 1,
		id = 700000376,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000377] = {
		description = "敌方单位的冰属性抗性降低{1}",
		maxLv = 4,
		type = 1,
		id = 700000377,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000378] = {
		description = "敌方单位的火属性抗性降低{1}",
		maxLv = 4,
		type = 1,
		id = 700000378,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000379] = {
		description = "敌方单位的风属性抗性降低{1}",
		maxLv = 4,
		type = 1,
		id = 700000379,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000380] = {
		description = "敌方单位的雷属性抗性降低{1}",
		maxLv = 4,
		type = 1,
		id = 700000380,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000381] = {
		description = "天垣神系修正者攻击力提高{1}",
		maxLv = 5,
		type = 1,
		id = 700000381,
		extra_param = "",
		param = {
			{
				5,
				5,
				false,
				"%"
			}
		}
	},
	[700000382] = {
		description = "该敌方单位受到来自天垣系修正者的伤害提高{1}",
		maxLv = 3,
		type = 1,
		id = 700000382,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000383] = {
		description = "该敌方单位受到来自奥山系修正者的伤害提高{1}",
		maxLv = 3,
		type = 1,
		id = 700000383,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000384] = {
		description = "该敌方单位受到来自尼罗系修正者的伤害提高{1}",
		maxLv = 3,
		type = 1,
		id = 700000384,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000385] = {
		description = "该敌方单位受到来自真樱系修正者的伤害提高{1}",
		maxLv = 3,
		type = 1,
		id = 700000385,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000386] = {
		description = "该敌方单位受到来自圣树系修正者的伤害提高{1}",
		maxLv = 3,
		type = 1,
		id = 700000386,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000387] = {
		description = "该敌方单位受到来自众星系修正者的伤害提高{1}",
		maxLv = 3,
		type = 1,
		id = 700000387,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700000388] = {
		description = "敌方单位受到的物理属性伤害提高{1}",
		maxLv = 10,
		type = 1,
		id = 700000388,
		extra_param = "",
		param = {
			{
				10,
				10,
				false,
				"%"
			}
		}
	},
	[700000389] = {
		description = "敌方单位受到的风属性伤害提高{1}",
		maxLv = 10,
		type = 1,
		id = 700000389,
		extra_param = "",
		param = {
			{
				10,
				10,
				false,
				"%"
			}
		}
	},
	[700000390] = {
		description = "敌方单位受到的火属性伤害提高{1}",
		maxLv = 10,
		type = 1,
		id = 700000390,
		extra_param = "",
		param = {
			{
				10,
				10,
				false,
				"%"
			}
		}
	},
	[700000391] = {
		description = "敌方单位受到的水属性伤害提高{1}",
		maxLv = 10,
		type = 1,
		id = 700000391,
		extra_param = "",
		param = {
			{
				10,
				10,
				false,
				"%"
			}
		}
	},
	[700000392] = {
		description = "敌方单位受到的冰属性伤害提高{1}",
		maxLv = 10,
		type = 1,
		id = 700000392,
		extra_param = "",
		param = {
			{
				10,
				10,
				false,
				"%"
			}
		}
	},
	[700000393] = {
		description = "敌方单位受到的暗属性伤害提高{1}",
		maxLv = 10,
		type = 1,
		id = 700000393,
		extra_param = "",
		param = {
			{
				10,
				10,
				false,
				"%"
			}
		}
	},
	[700000394] = {
		description = "敌方单位受到的光属性伤害提高{1}",
		maxLv = 10,
		type = 1,
		id = 700000394,
		extra_param = "",
		param = {
			{
				10,
				10,
				false,
				"%"
			}
		}
	},
	[700000395] = {
		description = "敌方单位受到的雷属性伤害提高{1}",
		maxLv = 10,
		type = 1,
		id = 700000395,
		extra_param = "",
		param = {
			{
				10,
				10,
				false,
				"%"
			}
		}
	},
	[700000396] = {
		description = "敌方单位受全属性的伤害提高{1}",
		maxLv = 10,
		type = 1,
		id = 700000396,
		extra_param = "",
		param = {
			{
				10,
				10,
				false,
				"%"
			}
		}
	},
	[700000397] = {
		description = "敌方单位受到物理以外的属性伤害降低{1}",
		maxLv = 10,
		type = 1,
		id = 700000397,
		extra_param = "",
		param = {
			{
				10,
				10,
				false,
				"%"
			}
		}
	},
	[700000398] = {
		description = "敌方单位受到风以外的属性伤害降低{1}",
		maxLv = 10,
		type = 1,
		id = 700000398,
		extra_param = "",
		param = {
			{
				10,
				10,
				false,
				"%"
			}
		}
	},
	[700000399] = {
		description = "敌方单位受到火以外的属性伤害降低{1}",
		maxLv = 10,
		type = 1,
		id = 700000399,
		extra_param = "",
		param = {
			{
				10,
				10,
				false,
				"%"
			}
		}
	},
	[700000400] = {
		description = "敌方单位受到水以外的属性伤害降低{1}",
		maxLv = 10,
		type = 1,
		id = 700000400,
		extra_param = "",
		param = {
			{
				10,
				10,
				false,
				"%"
			}
		}
	},
	[700000401] = {
		description = "敌方单位受到冰以外的属性伤害降低{1}",
		maxLv = 10,
		type = 1,
		id = 700000401,
		extra_param = "",
		param = {
			{
				10,
				10,
				false,
				"%"
			}
		}
	},
	[700000402] = {
		description = "敌方单位受到暗以外的属性伤害降低{1}",
		maxLv = 10,
		type = 1,
		id = 700000402,
		extra_param = "",
		param = {
			{
				10,
				10,
				false,
				"%"
			}
		}
	},
	[700000403] = {
		description = "敌方单位受到光以外的属性伤害降低{1}",
		maxLv = 10,
		type = 1,
		id = 700000403,
		extra_param = "",
		param = {
			{
				10,
				10,
				false,
				"%"
			}
		}
	},
	[700000404] = {
		description = "敌方单位受到雷以外的属性伤害降低{1}",
		maxLv = 10,
		type = 1,
		id = 700000404,
		extra_param = "",
		param = {
			{
				10,
				10,
				false,
				"%"
			}
		}
	},
	[700000411] = {
		description = "敌方单位的物理属性抗性降低{1}",
		maxLv = 40,
		type = 1,
		id = 700000411,
		extra_param = "",
		param = {
			{
				5,
				5,
				false,
				"%"
			}
		}
	},
	[700000412] = {
		description = "敌方单位的火属性抗性降低{1}",
		maxLv = 40,
		type = 1,
		id = 700000412,
		extra_param = "",
		param = {
			{
				5,
				5,
				false,
				"%"
			}
		}
	},
	[700000413] = {
		description = "敌方单位的水属性抗性降低{1}",
		maxLv = 40,
		type = 1,
		id = 700000413,
		extra_param = "",
		param = {
			{
				5,
				5,
				false,
				"%"
			}
		}
	},
	[700000414] = {
		description = "敌方单位的冰属性抗性降低{1}",
		maxLv = 40,
		type = 1,
		id = 700000414,
		extra_param = "",
		param = {
			{
				5,
				5,
				false,
				"%"
			}
		}
	},
	[700000415] = {
		description = "敌方单位的雷属性抗性降低{1}",
		maxLv = 40,
		type = 1,
		id = 700000415,
		extra_param = "",
		param = {
			{
				5,
				5,
				false,
				"%"
			}
		}
	},
	[700000416] = {
		description = "敌方单位的风属性抗性降低{1}",
		maxLv = 40,
		type = 1,
		id = 700000416,
		extra_param = "",
		param = {
			{
				5,
				5,
				false,
				"%"
			}
		}
	},
	[700000417] = {
		description = "敌方单位的光属性抗性降低{1}",
		maxLv = 40,
		type = 1,
		id = 700000417,
		extra_param = "",
		param = {
			{
				5,
				5,
				false,
				"%"
			}
		}
	},
	[700000418] = {
		description = "敌方单位的暗属性抗性降低{1}",
		maxLv = 40,
		type = 1,
		id = 700000418,
		extra_param = "",
		param = {
			{
				5,
				5,
				false,
				"%"
			}
		}
	},
	[700000421] = {
		description = "敌方单位受到物理属性以外的属性伤害衰减{1}",
		maxLv = 20,
		type = 1,
		id = 700000421,
		extra_param = "",
		param = {
			{
				5,
				5,
				false,
				"%"
			}
		}
	},
	[700000422] = {
		description = "敌方单位受到火属性以外的属性伤害衰减{1}",
		maxLv = 20,
		type = 1,
		id = 700000422,
		extra_param = "",
		param = {
			{
				5,
				5,
				false,
				"%"
			}
		}
	},
	[700000423] = {
		description = "敌方单位受到水属性以外的属性伤害衰减{1}",
		maxLv = 20,
		type = 1,
		id = 700000423,
		extra_param = "",
		param = {
			{
				5,
				5,
				false,
				"%"
			}
		}
	},
	[700000424] = {
		description = "敌方单位受到冰属性以外的属性伤害衰减{1}",
		maxLv = 20,
		type = 1,
		id = 700000424,
		extra_param = "",
		param = {
			{
				5,
				5,
				false,
				"%"
			}
		}
	},
	[700000425] = {
		description = "敌方单位受到雷属性以外的属性伤害衰减{1}",
		maxLv = 20,
		type = 1,
		id = 700000425,
		extra_param = "",
		param = {
			{
				5,
				5,
				false,
				"%"
			}
		}
	},
	[700000426] = {
		description = "敌方单位受到风属性以外的属性伤害衰减{1}",
		maxLv = 20,
		type = 1,
		id = 700000426,
		extra_param = "",
		param = {
			{
				5,
				5,
				false,
				"%"
			}
		}
	},
	[700000427] = {
		description = "敌方单位受到光属性以外的属性伤害衰减{1}",
		maxLv = 20,
		type = 1,
		id = 700000427,
		extra_param = "",
		param = {
			{
				5,
				5,
				false,
				"%"
			}
		}
	},
	[700000428] = {
		description = "敌方单位受到暗属性以外的属性伤害衰减{1}",
		maxLv = 20,
		type = 1,
		id = 700000428,
		extra_param = "",
		param = {
			{
				5,
				5,
				false,
				"%"
			}
		}
	},
	[700000431] = {
		description = "护盾受到物理属性以外的属性伤害衰减{1}",
		maxLv = 20,
		type = 1,
		id = 700000431,
		extra_param = "",
		param = {
			{
				5,
				5,
				false,
				"%"
			}
		}
	},
	[700000432] = {
		description = "护盾受到火属性以外的属性伤害衰减{1}",
		maxLv = 20,
		type = 1,
		id = 700000432,
		extra_param = "",
		param = {
			{
				5,
				5,
				false,
				"%"
			}
		}
	},
	[700000433] = {
		description = "护盾受到水属性以外的属性伤害衰减{1}",
		maxLv = 20,
		type = 1,
		id = 700000433,
		extra_param = "",
		param = {
			{
				5,
				5,
				false,
				"%"
			}
		}
	},
	[700000434] = {
		description = "护盾受到冰属性以外的属性伤害衰减{1}",
		maxLv = 20,
		type = 1,
		id = 700000434,
		extra_param = "",
		param = {
			{
				5,
				5,
				false,
				"%"
			}
		}
	},
	[700000435] = {
		description = "护盾受到雷属性以外的属性伤害衰减{1}",
		maxLv = 20,
		type = 1,
		id = 700000435,
		extra_param = "",
		param = {
			{
				5,
				5,
				false,
				"%"
			}
		}
	},
	[700000436] = {
		description = "护盾受到风属性以外的属性伤害衰减{1}",
		maxLv = 20,
		type = 1,
		id = 700000436,
		extra_param = "",
		param = {
			{
				5,
				5,
				false,
				"%"
			}
		}
	},
	[700000437] = {
		description = "护盾受到光属性以外的属性伤害衰减{1}",
		maxLv = 20,
		type = 1,
		id = 700000437,
		extra_param = "",
		param = {
			{
				5,
				5,
				false,
				"%"
			}
		}
	},
	[700000438] = {
		description = "护盾受到暗属性以外的属性伤害衰减{1}",
		maxLv = 20,
		type = 1,
		id = 700000438,
		extra_param = "",
		param = {
			{
				5,
				5,
				false,
				"%"
			}
		}
	},
	[700000441] = {
		description = "敌方单位受到物理和冰属性以外的属性伤害衰减{1}",
		maxLv = 20,
		type = 1,
		id = 700000441,
		extra_param = "",
		param = {
			{
				5,
				5,
				false,
				"%"
			}
		}
	},
	[700000442] = {
		description = "敌方单位受到火和水属性以外的属性伤害衰减{1}",
		maxLv = 20,
		type = 1,
		id = 700000442,
		extra_param = "",
		param = {
			{
				5,
				5,
				false,
				"%"
			}
		}
	},
	[700000443] = {
		description = "敌方单位受到雷和风属性以外的属性伤害衰减{1}",
		maxLv = 20,
		type = 1,
		id = 700000443,
		extra_param = "",
		param = {
			{
				5,
				5,
				false,
				"%"
			}
		}
	},
	[700000444] = {
		description = "敌方单位受到光和暗属性以外的属性伤害衰减{1}",
		maxLv = 20,
		type = 1,
		id = 700000444,
		extra_param = "",
		param = {
			{
				5,
				5,
				false,
				"%"
			}
		}
	},
	[700000445] = {
		description = "敌方单位受到冰和光属性以外的属性伤害衰减{1}",
		maxLv = 20,
		type = 1,
		id = 700000445,
		extra_param = "",
		param = {
			{
				5,
				5,
				false,
				"%"
			}
		}
	},
	[700000446] = {
		description = "敌方单位受到物理和暗属性以外的属性伤害衰减{1}",
		maxLv = 20,
		type = 1,
		id = 700000446,
		extra_param = "",
		param = {
			{
				5,
				5,
				false,
				"%"
			}
		}
	},
	[700000501] = {
		description = "战斗开始时，修正者根据机制类型获得不同机制值，神能、能量、怒气获得{1}点，印记获得{2}点。",
		maxLv = 1,
		type = 1,
		id = 700000501,
		extra_param = "",
		param = {
			{
				30,
				0,
				false,
				""
			},
			{
				1,
				0,
				false,
				""
			}
		}
	},
	[700000502] = {
		description = "战斗开始时，修正者在10秒内奥义值获得率提高{2}。",
		maxLv = 1,
		type = 1,
		id = 700000502,
		extra_param = "",
		param = {
			{
				14,
				0,
				false,
				""
			},
			{
				100,
				0,
				false,
				"%"
			}
		}
	},
	[700000503] = {
		description = "战斗开始第一次获得评分后，修正等级立即到达S级。",
		maxLv = 1,
		type = 1,
		id = 700000503,
		extra_param = "",
		param = {}
	},
	[700000504] = {
		description = "战斗开始时，修正者获得{1}秒的霸体。",
		maxLv = 1,
		type = 1,
		id = 700000504,
		extra_param = "",
		param = {
			{
				15,
				0,
				false,
				""
			}
		}
	},
	[700000505] = {
		description = "战斗开始时，修正者恢复自身最大生命值的{1}。",
		maxLv = 1,
		type = 1,
		id = 700000505,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			}
		}
	},
	[700000506] = {
		description = "队内怒气类型修正者触发闪避效果后，该修正者在{1}秒内怒气获得率提高{2}。",
		maxLv = 1,
		type = 1,
		id = 700000506,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				""
			},
			{
				100,
				0,
				false,
				"%"
			}
		}
	},
	[700000507] = {
		description = "队内能量类型修正者触发闪避效果后，该修正者获得{1}点能量。",
		maxLv = 1,
		type = 1,
		id = 700000507,
		extra_param = "",
		param = {
			{
				50,
				0,
				false,
				""
			}
		}
	},
	[700000508] = {
		description = "队内印记类型修正者触发闪避效果后，该修正者返还下一次消耗的所有印记。",
		maxLv = 1,
		type = 1,
		id = 700000508,
		extra_param = "",
		param = {}
	},
	[700000509] = {
		description = "队内神能类型修正者触发闪避效果后，该修正者获得{1}点神能。",
		maxLv = 1,
		type = 1,
		id = 700000509,
		extra_param = "",
		param = {
			{
				50,
				0,
				false,
				""
			}
		}
	},
	[700000510] = {
		description = "修正者触发闪避效果后，重置该修正者技能三的冷却时间。",
		maxLv = 1,
		type = 1,
		id = 700000510,
		extra_param = "",
		param = {}
	},
	[700000511] = {
		description = "修正者触发闪避效果后，该修正者获得50%的奥义值，奥义的剩余冷却时间缩短5秒。",
		maxLv = 1,
		type = 1,
		id = 700000511,
		extra_param = "",
		param = {}
	},
	[700000512] = {
		description = "修正者触发闪避效果后，全队回复{1}的最大生命值。",
		maxLv = 1,
		type = 1,
		id = 700000512,
		extra_param = "",
		param = {
			{
				3,
				0,
				false,
				"%"
			}
		}
	},
	[700000513] = {
		description = "修正者触发闪避效果后的5秒内释放过技能或奥义，则可以提高一次自身{1}会心率，持续{2}秒。",
		maxLv = 1,
		type = 1,
		id = 700000513,
		extra_param = "",
		param = {
			{
				100,
				0,
				false,
				"%"
			},
			{
				2,
				0,
				false,
				""
			}
		}
	},
	[700000514] = {
		description = "修正者触发闪避效果后，5秒内该修正者下次攻击修正系数提高15%。",
		maxLv = 1,
		type = 1,
		id = 700000514,
		extra_param = "",
		param = {}
	},
	[700000515] = {
		description = "修正者触发闪避效果后，修正等级立即提高至Ω级。",
		maxLv = 1,
		type = 1,
		id = 700000515,
		extra_param = "",
		param = {}
	},
	[700000516] = {
		description = "修正者触发闪避效果后，该修正者持续蓄力类技能的蓄力速度与释放速度提升40%，保持到战斗结束，最多叠加3次。",
		maxLv = 1,
		type = 1,
		id = 700000516,
		extra_param = "",
		param = {
			{
				40,
				40,
				false,
				""
			},
			{
				3,
				0,
				false,
				""
			}
		}
	},
	[700000517] = {
		description = "进入修正模式时，修正者的机制值（怒气、能量、印记、神能）变为满值。",
		maxLv = 1,
		type = 1,
		id = 700000517,
		extra_param = "",
		param = {}
	},
	[700000518] = {
		description = "退出修正模式后，修正者的机制值（怒气、能量、印记、神能）变为满值。",
		maxLv = 1,
		type = 1,
		id = 700000518,
		extra_param = "",
		param = {}
	},
	[700000519] = {
		description = "进入修正模式时，修正者的奥义值变为满值。",
		maxLv = 1,
		type = 1,
		id = 700000519,
		extra_param = "",
		param = {}
	},
	[700000520] = {
		description = "进入修正模式时，重置修正者所有技能和奥义的冷却时间。",
		maxLv = 1,
		type = 1,
		id = 700000520,
		extra_param = "",
		param = {}
	},
	[700000521] = {
		description = "退出修正模式后，重置修正者所有技能和奥义的冷却时间。",
		maxLv = 1,
		type = 1,
		id = 700000521,
		extra_param = "",
		param = {}
	},
	[700000522] = {
		description = "进入修正模式时，修正者恢复自身最大生命值的{1}。",
		maxLv = 1,
		type = 1,
		id = 700000522,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			}
		}
	},
	[700000523] = {
		description = "退出修正模式后，根据敌人在修正模式中受到的伤害总量，恢复修正者对应百分比的生命值。",
		maxLv = 1,
		type = 1,
		id = 700000523,
		extra_param = "",
		param = {}
	},
	[700000524] = {
		description = "修正模式的持续时间延长4秒。",
		maxLv = 1,
		type = 1,
		id = 700000524,
		extra_param = "",
		param = {}
	},
	[700000525] = {
		description = "退出修正模式后，再对敌人造成一次相当于敌人在该次修正模式中受到伤害总量20%的追加伤害。",
		maxLv = 1,
		type = 1,
		id = 700000525,
		extra_param = "",
		param = {}
	},
	[700000526] = {
		description = "处于修正模式时，修正者会心率提高{1}；同时装备“无名的圣剑”时效果翻倍。",
		maxLv = 1,
		type = 1,
		id = 700000526,
		extra_param = "",
		param = {
			{
				20,
				20,
				false,
				"%"
			}
		}
	},
	[700000527] = {
		description = "处于修正模式时，修正者会心伤害提高{1}；同时装备“无名的剑鞘”时效果翻倍。",
		maxLv = 1,
		type = 1,
		id = 700000527,
		extra_param = "",
		param = {
			{
				40,
				40,
				false,
				"%"
			}
		}
	},
	[700000528] = {
		description = "修正者施放奥义命中敌人时，修正值增加5%，每次奥义最多触发3次。",
		maxLv = 1,
		type = 1,
		id = 700000528,
		extra_param = "",
		param = {}
	},
	[700000529] = {
		description = "修正者施放奥义时，该修正者恢复最大生命值的{1}。",
		maxLv = 1,
		type = 1,
		id = 700000529,
		extra_param = "",
		param = {
			{
				5,
				0,
				false,
				"%"
			}
		}
	},
	[700000530] = {
		description = "修正者施放奥义后，重置该修正者随机一个处于冷却中的技能。",
		maxLv = 1,
		type = 1,
		id = 700000530,
		extra_param = "",
		param = {}
	},
	[700000531] = {
		description = "修正者施放奥义后，该修正者获得50%的机制值（怒气、能量、印记、神能）。",
		maxLv = 1,
		type = 1,
		id = 700000531,
		extra_param = "",
		param = {}
	},
	[700000532] = {
		description = "处于修正模式时，修正者施放奥义都会延长0.5秒修正模式的持续时间。",
		maxLv = 1,
		type = 1,
		id = 700000532,
		extra_param = "",
		param = {}
	},
	[700000533] = {
		description = "修正者施放奥义命中敌人时，修正等级提高至下一等级(最高到达Ω级）。",
		maxLv = 1,
		type = 1,
		id = 700000533,
		extra_param = "",
		param = {}
	},
	[700000534] = {
		description = "修正者施放奥义后，该修正者获得50%的奥义值，奥义的剩余冷却时间缩短50%。",
		maxLv = 1,
		type = 1,
		id = 700000534,
		extra_param = "",
		param = {}
	},
	[700000535] = {
		description = "怒气类型修正者怒气消耗降低{1}。",
		maxLv = 1,
		type = 1,
		id = 700000535,
		extra_param = "",
		param = {
			{
				30,
				0,
				false,
				"%"
			}
		}
	},
	[700000536] = {
		description = "怒气类型修正者每秒获得{1}点怒气。",
		maxLv = 1,
		type = 1,
		id = 700000536,
		extra_param = "",
		param = {
			{
				3,
				0,
				false,
				""
			}
		}
	},
	[700000537] = {
		description = "能量类型修正者能量获得率提高{1}。",
		maxLv = 1,
		type = 1,
		id = 700000537,
		extra_param = "",
		param = {
			{
				30,
				0,
				false,
				"%"
			}
		}
	},
	[700000538] = {
		description = "能量类型修正者能量消耗降低{1}。",
		maxLv = 1,
		type = 1,
		id = 700000538,
		extra_param = "",
		param = {
			{
				30,
				0,
				false,
				"%"
			}
		}
	},
	[700000539] = {
		description = "印记类型修正者触发打断补偿将额外获取1个印记，且7秒内无法再次触发该效果。",
		maxLv = 1,
		type = 1,
		id = 700000539,
		extra_param = "",
		param = {}
	},
	[700000540] = {
		description = "印记类型修正者使用消耗印记的技能后，立即恢复{1}个印记，该效果每7秒触发一次。",
		maxLv = 1,
		type = 1,
		id = 700000540,
		extra_param = "",
		param = {
			{
				1,
				0,
				false,
				""
			}
		}
	},
	[700000541] = {
		description = "神能类型修正者神能获得率提高{1}。",
		maxLv = 1,
		type = 1,
		id = 700000541,
		extra_param = "",
		param = {
			{
				30,
				0,
				false,
				"%"
			}
		}
	},
	[700000542] = {
		description = "神能充满时恢复该修正者攻击力{1}的生命值，该效果每6秒触发一次。",
		maxLv = 1,
		type = 1,
		id = 700000542,
		extra_param = "",
		param = {
			{
				30,
				0,
				false,
				"%"
			}
		}
	},
	[700000543] = {
		description = "修正者的技能和奥义冷却时间缩短7.5%，同时装备“白熊玩偶”时效果翻倍，且可以与“白熊玩偶”的效果叠加。",
		maxLv = 1,
		type = 1,
		id = 700000543,
		extra_param = "",
		param = {}
	},
	[700000544] = {
		description = "修正者的技能和奥义冷却时间缩短7.5%，同时装备“毛绒睡帽”时效果翻倍，且可以与“毛绒睡帽”的效果叠加。",
		maxLv = 1,
		type = 1,
		id = 700000544,
		extra_param = "",
		param = {}
	},
	[700000545] = {
		description = "修正者攻击命中敌人时，该修正者随机一个冷却中技能的剩余冷却时间缩短1秒，该效果每2秒触发一次，且不会缩短奥义的剩余冷却时间。",
		maxLv = 1,
		type = 1,
		id = 700000545,
		extra_param = "",
		param = {}
	},
	[700000546] = {
		description = "修正者闪避效果触发的零时空间持续时间延长{1}秒。",
		maxLv = 1,
		type = 1,
		id = 700000546,
		extra_param = "",
		param = {
			{
				1,
				0,
				false,
				""
			}
		}
	},
	[700000547] = {
		description = "修正者闪避能量恢复速度提高{1}。",
		maxLv = 1,
		type = 1,
		id = 700000547,
		extra_param = "",
		param = {
			{
				50,
				0,
				false,
				"%"
			}
		}
	},
	[700000548] = {
		description = "修正者每佩戴一个刻印，该修正者会心率提高{1}。",
		maxLv = 1,
		type = 1,
		id = 700000548,
		extra_param = "",
		param = {
			{
				5,
				5,
				false,
				"%"
			}
		}
	},
	[700000549] = {
		description = "修正者每装备一个神格，该修正者会心率提高{1}。",
		maxLv = 1,
		type = 1,
		id = 700000549,
		extra_param = "",
		param = {
			{
				5,
				5,
				false,
				"%"
			}
		}
	},
	[700000550] = {
		description = "修正者施放奥义以外的技能命中敌人时，该技能的剩余冷却时间缩短30%，单次释放技能只会触发一次。若此次技能击败敌人，则再次触发该效果。",
		maxLv = 1,
		type = 1,
		id = 700000550,
		extra_param = "",
		param = {}
	},
	[700000551] = {
		description = "修正者施放奥义以外的技能击败敌人时，该修正者获得30%的机制值（怒气、能量、印记、神能）。",
		maxLv = 1,
		type = 1,
		id = 700000551,
		extra_param = "",
		param = {}
	},
	[700000552] = {
		description = "修正者每击败一个敌人，恢复该修正者最大生命值的{1}。",
		maxLv = 1,
		type = 1,
		id = 700000552,
		extra_param = "",
		param = {
			{
				1,
				0,
				false,
				"%"
			}
		}
	},
	[700000553] = {
		description = "战斗开始时，修正者最大生命值上限降低{1}、会心率提高{2}，并永久获得“霸体”状态。",
		maxLv = 1,
		type = 1,
		id = 700000553,
		extra_param = "",
		param = {
			{
				50,
				0,
				false,
				"%"
			},
			{
				50,
				0,
				false,
				"%"
			}
		}
	},
	[700000554] = {
		description = "修正者生命值低于60%时，该修正者的攻击力提高{1}；修正者生命值低于30%时，则该修正者攻击力提高{2}。",
		maxLv = 1,
		type = 1,
		id = 700000554,
		extra_param = "",
		param = {
			{
				30,
				30,
				false,
				"%"
			},
			{
				60,
				60,
				false,
				"%"
			}
		}
	},
	[700000555] = {
		description = "战斗开始时，修正者会心伤害提高{1}，每经过一场胜利这个效果会提高10%，最多叠加至100%。",
		maxLv = 10,
		type = 1,
		id = 700000555,
		extra_param = "",
		param = {
			{
				10,
				10,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[700000556] = {
		description = "战斗开始时，修正者最大生命值上限提高{1}，每经过一场胜利这个效果会提高5%，最多叠加至50%。",
		maxLv = 10,
		type = 1,
		id = 700000556,
		extra_param = "",
		param = {
			{
				5,
				5,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[700000557] = {
		description = "修正者施放技能和奥义时受到的伤害降低{1}，每经过一场胜利这个效果会提高3%，最多叠加至18%；当修正者生命值低于30%时，对于该修正者的该效果翻倍。",
		maxLv = 6,
		type = 1,
		id = 700000557,
		extra_param = "",
		param = {
			{
				3,
				3,
				false,
				"%"
			},
			{
				6,
				0,
				false,
				""
			}
		}
	},
	[700000558] = {
		description = "修正者的闪避效果的冷却时间缩短{1}秒，每经过一场胜利这个效果会提高1秒，最多减少{2}秒。",
		maxLv = 8,
		type = 1,
		id = 700000558,
		extra_param = "",
		param = {
			{
				1,
				1,
				false,
				""
			},
			{
				8,
				0,
				false,
				""
			}
		}
	},
	[700000559] = {
		description = "战斗开始后，修正者攻击力提高{1}，持续{2}秒。",
		maxLv = 1,
		type = 1,
		id = 700000559,
		extra_param = "",
		param = {
			{
				15,
				0,
				false,
				"%"
			},
			{
				15,
				0,
				false,
				""
			}
		}
	},
	[700000560] = {
		description = "修正者触发闪避效果后，该修正者的移动速度提高{1}，持续{2}秒。",
		maxLv = 1,
		type = 1,
		id = 700000560,
		extra_param = "",
		param = {
			{
				20,
				0,
				false,
				"%"
			},
			{
				3,
				0,
				false,
				""
			}
		}
	},
	[700000561] = {
		description = "修正者触发闪避效果后，该修正者的闪避效果剩余冷却时间缩短2秒。",
		maxLv = 1,
		type = 1,
		id = 700000561,
		extra_param = "",
		param = {}
	},
	[700000562] = {
		description = "修正者每击败一个普通敌人，该修正者对精英敌人的伤害提高{1}，该效果可叠加。",
		maxLv = 1,
		type = 1,
		id = 700000562,
		extra_param = "",
		param = {
			{
				3,
				3,
				false,
				"%"
			}
		}
	},
	[700000563] = {
		description = "战斗开始后，修正者最大生命值上限降低{1}、受到的伤害降低{2}。",
		maxLv = 1,
		type = 1,
		id = 700000563,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			},
			{
				20,
				0,
				false,
				"%"
			}
		}
	},
	[700000564] = {
		description = "战斗开始时，闪避能量上限提高{1}，每经过一场胜利这个效果会降低4%，最多降低80%。",
		maxLv = 21,
		type = 1,
		id = 700000564,
		extra_param = "",
		param = {
			{
				60,
				-4,
				false,
				"%"
			}
		}
	},
	[700000565] = {
		description = "战斗开始时，修正者获得{1}的任意一种属性伤害提高效果，该效果每20秒随机切换一次。",
		maxLv = 1,
		type = 1,
		id = 700000565,
		extra_param = "",
		param = {
			{
				30,
				0,
				false,
				"%"
			}
		}
	},
	[700000566] = {
		description = "修正者受到攻击时，恢复{1}点生命值，该效果每7秒触发一次。",
		maxLv = 1,
		type = 1,
		id = 700000566,
		extra_param = "",
		param = {
			{
				100,
				0,
				false,
				""
			}
		}
	},
	[700000567] = {
		description = "精英敌人对修正者的伤害降低{1}，普通敌人对修正者的伤害提高{2}。",
		maxLv = 1,
		type = 1,
		id = 700000567,
		extra_param = "",
		param = {
			{
				40,
				0,
				false,
				"%"
			},
			{
				20,
				0,
				false,
				"%"
			}
		}
	},
	[700000568] = {
		description = "精英敌人对修正者的伤害提高{1}；普通敌人对修正者的伤害降低{2}。",
		maxLv = 1,
		type = 1,
		id = 700000568,
		extra_param = "",
		param = {
			{
				20,
				0,
				false,
				"%"
			},
			{
				40,
				0,
				false,
				"%"
			}
		}
	},
	[700000569] = {
		description = "修正者的奥义冷却时间延长20秒，奥义值获得率降低{1}，但奥义伤害提高{2} 。",
		maxLv = 1,
		type = 1,
		id = 700000569,
		extra_param = "",
		param = {
			{
				50,
				0,
				false,
				"%"
			},
			{
				100,
				0,
				false,
				"%"
			}
		}
	},
	[700000570] = {
		description = "修正者未受到攻击时，该修正者攻击力提高{1}，受击后移除效果；若15秒内该修正者未受到攻击，则重新获得该效果。",
		maxLv = 1,
		type = 1,
		id = 700000570,
		extra_param = "",
		param = {
			{
				15,
				0,
				false,
				"%"
			}
		}
	},
	[700000571] = {
		description = "修正者获得属性伤害提高效果时，该修正者伤害提高，数值等同于该次提高的属性伤害的100%，持续{1}秒。该效果不可叠加。",
		maxLv = 1,
		type = 1,
		id = 700000571,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[700000572] = {
		description = "修正者击败智械类敌人时，该修正者有10%的概率获得满值机制值（怒气、能量、印记、神能）。",
		maxLv = 1,
		type = 1,
		id = 700000572,
		extra_param = "",
		param = {}
	},
	[700000573] = {
		description = "修正者施放技能和奥义时，该修正者获得“霸体”状态。",
		maxLv = 1,
		type = 1,
		id = 700000573,
		extra_param = "",
		param = {}
	},
	[700000574] = {
		description = "修正者机制值（怒气、能量、印记、神能）为满值时，该修正者受到的伤害降低{1}。",
		maxLv = 1,
		type = 1,
		id = 700000574,
		extra_param = "",
		param = {
			{
				20,
				0,
				false,
				"%"
			}
		}
	},
	[700000575] = {
		description = "修正者连续5次命中敌人没有造成会心时，该修正者下一次攻击的会心率提高{1}。",
		maxLv = 1,
		type = 1,
		id = 700000575,
		extra_param = "",
		param = {
			{
				100,
				0,
				false,
				"%"
			}
		}
	},
	[700000576] = {
		description = "修正者获得印记的技能和奥义伤害提高{1}。",
		maxLv = 1,
		type = 1,
		id = 700000576,
		extra_param = "",
		param = {
			{
				40,
				0,
				false,
				"%"
			}
		}
	},
	[700000577] = {
		description = "修正者最大生命值上限提高{2}，移动速度降低{1}。",
		maxLv = 1,
		type = 1,
		id = 700000577,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			},
			{
				20,
				0,
				false,
				"%"
			}
		}
	},
	[700000578] = {
		description = "近战修正者受到自身5米范围内的敌人攻击时，受到的伤害降低{1}。",
		maxLv = 1,
		type = 1,
		id = 700000578,
		extra_param = "",
		param = {
			{
				15,
				0,
				false,
				"%"
			}
		}
	},
	[700000579] = {
		description = "远程修正者受到自身10米范围外的敌人攻击时，受到的伤害降低{1}。",
		maxLv = 1,
		type = 1,
		id = 700000579,
		extra_param = "",
		param = {
			{
				15,
				0,
				false,
				"%"
			}
		}
	},
	[700000580] = {
		description = "若修正者一定时间内没有移动，则该修正者恢复{1}的生命值，该效果在位移后重新开始计时。",
		maxLv = 1,
		type = 1,
		id = 700000580,
		extra_param = "",
		param = {
			{
				5,
				0,
				false,
				"%"
			}
		}
	},
	[700000581] = {
		description = "修正者受到单次超过生命上限30%时的伤害时获得自身{1}生命值的护盾，该效果每20秒只能触发一次。",
		maxLv = 1,
		type = 1,
		id = 700000581,
		extra_param = "",
		param = {
			{
				30,
				0,
				false,
				"%"
			}
		}
	},
	[700000582] = {
		description = "闪避能量不足时，可通过对自身造成最大生命值5%的伤害进行强制闪避。",
		maxLv = 1,
		type = 1,
		id = 700000582,
		extra_param = "",
		param = {}
	},
	[700000583] = {
		description = "修正者受到的伤害会平均分摊到其他修正者上。",
		maxLv = 1,
		type = 1,
		id = 700000583,
		extra_param = "",
		param = {}
	},
	[700000584] = {
		description = "修正者受到攻击时，有5%的概率受到双倍伤害，有50%的概率受到的伤害降低{1}。",
		maxLv = 1,
		type = 1,
		id = 700000584,
		extra_param = "",
		param = {
			{
				50,
				0,
				false,
				"%"
			}
		}
	},
	[700000585] = {
		description = "修正者攻击满生命值的敌人时，该修正者的会心率提高{1}。",
		maxLv = 1,
		type = 1,
		id = 700000585,
		extra_param = "",
		param = {
			{
				100,
				0,
				false,
				"%"
			}
		}
	},
	[700000586] = {
		description = "修正者普通攻击命中敌人5次后，该修正者下一次普通攻击将附加{1}攻击力的随机属性伤害。",
		maxLv = 1,
		type = 1,
		id = 700000586,
		extra_param = "",
		param = {
			{
				50,
				0,
				false,
				"%"
			}
		}
	},
	[700000587] = {
		description = "修正者普通攻击命中时，该修正者会心率提高{1}，最多可叠加5层，技能或奥义会心后移除该效果。",
		maxLv = 1,
		type = 1,
		id = 700000587,
		extra_param = "",
		param = {
			{
				5,
				5,
				false,
				"%"
			}
		}
	},
	[700000588] = {
		description = "修正者受身成功时，该修正者闪避效果的剩余冷却时间缩短1秒。",
		maxLv = 1,
		type = 1,
		id = 700000588,
		extra_param = "",
		param = {}
	},
	[700000589] = {
		description = "战斗开始时，修正者的修正系数的加成效果将100%转为普通攻击的伤害加成。",
		maxLv = 1,
		type = 1,
		id = 700000589,
		extra_param = "",
		param = {}
	},
	[700000590] = {
		description = "修正者施放普通攻击命中敌人后，该修正者技能伤害提高{1}，持续{2}秒。",
		maxLv = 1,
		type = 1,
		id = 700000590,
		extra_param = "",
		param = {
			{
				15,
				0,
				false,
				"%"
			},
			{
				2,
				0,
				false,
				""
			}
		}
	},
	[700000591] = {
		description = "修正者施放技能和奥义命中敌人后，该修正者普通攻击伤害提高{1}，持续{2}秒。",
		maxLv = 1,
		type = 1,
		id = 700000591,
		extra_param = "",
		param = {
			{
				45,
				0,
				false,
				"%"
			},
			{
				2,
				0,
				false,
				""
			}
		}
	},
	[700000592] = {
		description = "修正等级Ω级的持续时间延长2秒。",
		maxLv = 1,
		type = 1,
		id = 700000592,
		extra_param = "",
		param = {}
	},
	[700000593] = {
		description = "战斗开始后，修正者会心率变为40%，会心伤害提高，数值等同于会心率降低的量。",
		maxLv = 1,
		type = 1,
		id = 700000593,
		extra_param = "",
		param = {}
	},
	[700000594] = {
		description = "修正者满血状态时，该修正者受到的第一次伤害固定为1点，该效果对处于护盾状态的修正者无效，每10秒最多触发1次。",
		maxLv = 1,
		type = 1,
		id = 700000594,
		extra_param = "",
		param = {}
	},
	[700000595] = {
		description = "战斗开始时，修正者防御力提高，数值等同于自身已损失的生命值百分比。",
		maxLv = 1,
		type = 1,
		id = 700000595,
		extra_param = "",
		param = {}
	},
	[700000596] = {
		description = "携带并经过十场胜利后，修正者在零时空间内的会心率提高100%。",
		maxLv = 1,
		type = 1,
		id = 700000596,
		extra_param = "",
		param = {
			{
				100,
				0,
				false,
				""
			}
		}
	},
	[700000597] = {
		description = "战斗开始时，修正者普通攻击伤害提高{1}，每经过一场胜利这个效果会提高{1}，最多叠加{2}层。",
		maxLv = 10,
		type = 1,
		id = 700000597,
		extra_param = "",
		param = {
			{
				12,
				12,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[700000598] = {
		description = "战斗开始时，修正者伤害提高{1}，持续{2}秒；效果结束后修正者造成的伤害降低{3}。",
		maxLv = 1,
		type = 1,
		id = 700000598,
		extra_param = "",
		param = {
			{
				70,
				0,
				false,
				"%"
			},
			{
				20,
				0,
				false,
				""
			},
			{
				40,
				0,
				false,
				"%"
			}
		}
	},
	[700000599] = {
		description = "修正者获得护盾时，恢复该修正者护盾值10%的生命值。",
		maxLv = 1,
		type = 1,
		id = 700000599,
		extra_param = "",
		param = {}
	},
	[700000600] = {
		description = "修正者连续5次攻击造成会心时，该修正者获得自身最大生命值{1}的护盾，持续{2}秒，效果每10秒触发一次。",
		maxLv = 1,
		type = 1,
		id = 700000600,
		extra_param = "",
		param = {
			{
				20,
				0,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[700000601] = {
		description = "攻击命中敌人后，该修正者随机一个技能的冷却时间缩短2秒（仅限冷却中的技能，且不包含奥义技能），该效果每3秒可触发一次。",
		maxLv = 1,
		type = 1,
		id = 700000601,
		extra_param = "",
		param = {}
	},
	[700000602] = {
		description = "技能和奥义命中敌人后，该修正者下一次普通攻击命中敌人时会心率增加{1}并且回复自身{2}的生命值，该效果每5秒可触发一次。",
		maxLv = 1,
		type = 1,
		id = 700000602,
		extra_param = "",
		param = {
			{
				100,
				0,
				false,
				"%"
			},
			{
				4,
				0,
				false,
				"%"
			}
		}
	},
	[700000603] = {
		description = "普通攻击命中敌人后，该修正者攻击力增加{1}。该效果最高叠加20层，修正者受到来自敌方的伤害时，该效果被移除并进入5秒冷却时间。",
		maxLv = 1,
		type = 1,
		id = 700000603,
		extra_param = "",
		param = {
			{
				4,
				4,
				false,
				"%"
			}
		}
	},
	[700000604] = {
		description = "战斗开始后，修正者伤害提升{1}，{2}秒后移除，效果移除后修正者伤害降低{3}。",
		maxLv = 1,
		type = 1,
		id = 700000604,
		extra_param = "",
		param = {
			{
				50,
				0,
				false,
				"%"
			},
			{
				30,
				0,
				false,
				""
			},
			{
				12,
				0,
				false,
				"%"
			}
		}
	},
	[700000605] = {
		description = "修正者受到伤害时，立刻获得{1}最大生命值的全属性护盾，持续时间{2}秒，冷却时间30秒。",
		maxLv = 1,
		type = 1,
		id = 700000605,
		extra_param = "",
		param = {
			{
				15,
				0,
				false,
				"%"
			},
			{
				15,
				0,
				false,
				""
			}
		}
	},
	[700000606] = {
		description = "修正者受伤且生命值低于30%时，立刻回复全部生命值，该效果整场战斗只能触发一次，该效果在受到致死伤害时不会触发。",
		maxLv = 1,
		type = 1,
		id = 700000606,
		extra_param = "",
		param = {}
	},
	[700000607] = {
		description = "战斗开始一分钟后，修正者的会心伤害增加{1}。之后每过12秒，会心率就会增加{2}，上限为100%",
		maxLv = 1,
		type = 1,
		id = 700000607,
		extra_param = "",
		param = {
			{
				50,
				0,
				false,
				"%"
			},
			{
				5,
				5,
				false,
				"%"
			}
		}
	},
	[700000608] = {
		description = "修正者受到治疗或伤害后，下一次非奥义技能的命中伤害提高{1}，该效果有3秒的内置冷却时间，伤害提高效果不可叠加。",
		maxLv = 1,
		type = 1,
		id = 700000608,
		extra_param = "",
		param = {
			{
				50,
				0,
				false,
				"%"
			}
		}
	},
	[700000609] = {
		description = "战斗中，修正者的闪避技能冷却时间减少3秒。触发闪避技能后的2.5秒内，技能和奥义命中时会心率提升{1}。",
		maxLv = 1,
		type = 1,
		id = 700000609,
		extra_param = "",
		param = {
			{
				100,
				0,
				false,
				"%"
			}
		}
	},
	[700000801] = {
		description = "战斗中，队长受到致命一击时，立即恢复20%的最大生命值，每场战斗中仅可触发一次。",
		maxLv = 1,
		type = 1,
		id = 700000801,
		extra_param = "",
		param = {}
	},
	[700000802] = {
		description = "战斗中，作为队友的修正者被击败时，队长的伤害提高50%，最多可叠加2层。",
		maxLv = 1,
		type = 1,
		id = 700000802,
		extra_param = "",
		param = {}
	},
	[700000803] = {
		description = "战斗中，修正者防御降低10%、治疗效果提高20%。",
		maxLv = 1,
		type = 1,
		id = 700000803,
		extra_param = "",
		param = {}
	},
	[700000804] = {
		description = "战斗时，我方修正者与敌方单位攻击力提高20%。",
		maxLv = 1,
		type = 1,
		id = 700000804,
		extra_param = "",
		param = {}
	},
	[700000805] = {
		description = "本场战斗中仅由队长上场时，队长攻击力提高100%、最大生命值上限提高100%。",
		maxLv = 1,
		type = 1,
		id = 700000805,
		extra_param = "",
		param = {}
	},
	[700000806] = {
		description = "触发神系共鸣的最高效果仅需2位同神系修正者。",
		maxLv = 1,
		type = 1,
		id = 700000806,
		extra_param = "",
		param = {}
	},
	[700009001] = {
		description = "极限闪避后1秒内的普通攻击每命中一个敌人，「百川归海」的剩余冷却时间缩短1秒。",
		maxLv = 1,
		type = 1,
		id = 700009001,
		extra_param = "",
		param = {}
	},
	[700009002] = {
		description = "施放「长河奔行」后，额外获得1个印记。",
		maxLv = 1,
		type = 1,
		id = 700009002,
		extra_param = "",
		param = {}
	},
	[700009003] = {
		description = "施放「激潮涌灭」击败敌人时，随机重置一个处于冷却中的其他技能。",
		maxLv = 1,
		type = 1,
		id = 700009003,
		extra_param = "",
		param = {}
	},
	[700009004] = {
		description = "「百川归海」最后一段会聚集敌人。",
		maxLv = 1,
		type = 1,
		id = 700009004,
		extra_param = "",
		param = {}
	},
	[700009005] = {
		description = "自身被命中时，场上的「支流幻影」会朝攻击者冲刺并造成伤害，该效果每5秒可触发一次。",
		maxLv = 1,
		type = 1,
		id = 700009005,
		extra_param = "",
		param = {}
	},
	[700009006] = {
		description = "被命中时，自身和最近的「支流幻影」交换位置，并对交换位置前后的周围造成100%攻击力的水属性伤害，该效果每10秒最多触发一次，该伤害视为技能伤害。",
		maxLv = 1,
		type = 1,
		id = 700009006,
		extra_param = "",
		param = {}
	},
	[700009007] = {
		description = "受到致命伤害时，自动规避此次伤害，恢复最大生命值的20%，重置所有技能和奥义的冷却时间。",
		maxLv = 1,
		type = 1,
		id = 700009007,
		extra_param = "",
		param = {}
	},
	[700009008] = {
		description = "「长河奔行」生成的「支流幻影」上限增加1个。 神格「长河波涛-深压」新增以下效果：吸收4个「支流幻影」时，技能伤害提高60%。",
		maxLv = 1,
		type = 1,
		id = 700009008,
		extra_param = "",
		param = {}
	},
	[700009009] = {
		description = "普通攻击命中敌人时，「支流幻影」对附近随机一个敌人发动攻击。",
		maxLv = 1,
		type = 1,
		id = 700009009,
		extra_param = "",
		param = {}
	},
	[700009010] = {
		description = "生成「支流幻影」时，「支流幻影」对附近的敌人减速，移动速度降低{1}，持续{2}秒",
		maxLv = 1,
		type = 1,
		id = 700009010,
		extra_param = "",
		param = {
			{
				50,
				0,
				false,
				"%"
			},
			{
				5,
				0,
				false,
				""
			}
		}
	},
	[700009011] = {
		description = "修正者击败敌方单位时恢复自身5%的最大生命值。",
		maxLv = 1,
		type = 1,
		id = 700009011,
		extra_param = "",
		param = {}
	},
	[700009012] = {
		description = "接下来5场战斗，自身会携带词缀“减速”。",
		maxLv = 5,
		type = 1,
		id = 700009012,
		extra_param = "",
		param = {}
	},
	[700009013] = {
		description = "接下来5场战斗，敌人会携带词缀“薪火”。",
		maxLv = 5,
		type = 1,
		id = 700009013,
		extra_param = "",
		param = {}
	},
	[700009014] = {
		description = "接下来5场战斗，敌人会携带词缀“庇荫”。",
		maxLv = 5,
		type = 1,
		id = 700009014,
		extra_param = "",
		param = {}
	},
	[700009015] = {
		description = "接下来5场战斗，敌人会携带词缀“致残”。",
		maxLv = 5,
		type = 1,
		id = 700009015,
		extra_param = "",
		param = {}
	},
	[700009016] = {
		description = "接下来5场战斗，自身会携带词缀“燃能”。",
		maxLv = 5,
		type = 1,
		id = 700009016,
		extra_param = "",
		param = {}
	},
	[700009017] = {
		description = "接下来5场战斗，自身无法触发「碎浪逐空」的极限闪避效果。",
		maxLv = 5,
		type = 1,
		id = 700009017,
		extra_param = "",
		param = {}
	},
	[700009018] = {
		description = "接下来5场战斗，自身开场获得100%奥义充能。",
		maxLv = 5,
		type = 1,
		id = 700009018,
		extra_param = "",
		param = {}
	},
	[700009019] = {
		description = "接下来5场战斗，自身开场获得4个印记。",
		maxLv = 5,
		type = 1,
		id = 700009019,
		extra_param = "",
		param = {}
	},
	[700009020] = {
		description = "接下来5场战斗，自身移动速度+100%。",
		maxLv = 5,
		type = 1,
		id = 700009020,
		extra_param = "",
		param = {}
	},
	[700009021] = {
		description = "接下来5场战斗，自身闪避能量恢复速度+100%。",
		maxLv = 5,
		type = 1,
		id = 700009021,
		extra_param = "",
		param = {}
	},
	[700009022] = {
		description = "敌人最大生命值降低{1}",
		maxLv = 5,
		type = 1,
		id = 700009022,
		extra_param = "",
		param = {
			{
				5,
				5,
				false,
				"%"
			}
		}
	},
	[700009023] = {
		description = "受到的伤害降低{1}",
		maxLv = 5,
		type = 1,
		id = 700009023,
		extra_param = "",
		param = {
			{
				5,
				5,
				false,
				"%"
			}
		}
	},
	[700009024] = {
		description = "最大生命值提高{1}",
		maxLv = 5,
		type = 1,
		id = 700009024,
		extra_param = "",
		param = {
			{
				20,
				20,
				false,
				"%"
			}
		}
	},
	[700009025] = {
		description = "会心率提高{1}，会心伤害提高{2}",
		maxLv = 5,
		type = 1,
		id = 700009025,
		extra_param = "",
		param = {
			{
				20,
				20,
				false,
				"%"
			},
			{
				30,
				30,
				false,
				"%"
			}
		}
	},
	[700009026] = {
		description = "修正系数提高{1}",
		maxLv = 5,
		type = 1,
		id = 700009026,
		extra_param = "",
		param = {
			{
				10,
				10,
				false,
				"%"
			}
		}
	},
	[700009027] = {
		description = "敌人最大生命值降低{1}",
		maxLv = 5,
		type = 1,
		id = 700009027,
		extra_param = "",
		param = {
			{
				5,
				5,
				false,
				"%"
			}
		}
	},
	[700009028] = {
		description = "受到的伤害降低{1}",
		maxLv = 5,
		type = 1,
		id = 700009028,
		extra_param = "",
		param = {
			{
				5,
				5,
				false,
				"%"
			}
		}
	},
	[700009029] = {
		description = "最大生命值提高{1}",
		maxLv = 5,
		type = 1,
		id = 700009029,
		extra_param = "",
		param = {
			{
				20,
				20,
				false,
				"%"
			}
		}
	},
	[700009030] = {
		description = "会心率提高{1}，会心伤害提高{2}",
		maxLv = 5,
		type = 1,
		id = 700009030,
		extra_param = "",
		param = {
			{
				20,
				20,
				false,
				"%"
			},
			{
				30,
				30,
				false,
				"%"
			}
		}
	},
	[700009031] = {
		description = "机制值获得率提高{1}",
		maxLv = 5,
		type = 1,
		id = 700009031,
		extra_param = "",
		param = {
			{
				10,
				10,
				false,
				"%"
			}
		}
	},
	[700009032] = {
		description = "敌人最大生命值降低{1}",
		maxLv = 5,
		type = 1,
		id = 700009032,
		extra_param = "",
		param = {
			{
				5,
				5,
				false,
				"%"
			}
		}
	},
	[700009033] = {
		description = "受到的伤害降低{1}",
		maxLv = 5,
		type = 1,
		id = 700009033,
		extra_param = "",
		param = {
			{
				5,
				5,
				false,
				"%"
			}
		}
	},
	[700009034] = {
		description = "最大生命值提高{1}",
		maxLv = 5,
		type = 1,
		id = 700009034,
		extra_param = "",
		param = {
			{
				20,
				20,
				false,
				"%"
			}
		}
	},
	[700009035] = {
		description = "会心率提高{1}，会心伤害提高{2}",
		maxLv = 5,
		type = 1,
		id = 700009035,
		extra_param = "",
		param = {
			{
				20,
				20,
				false,
				"%"
			},
			{
				30,
				30,
				false,
				"%"
			}
		}
	},
	[700009036] = {
		description = "所有技能和奥义冷却时间缩短{1}秒",
		maxLv = 5,
		type = 1,
		id = 700009036,
		extra_param = "",
		param = {
			{
				0.3,
				0.3,
				false,
				""
			}
		}
	},
	[700009037] = {
		description = "敌人最大生命值降低{1}",
		maxLv = 5,
		type = 1,
		id = 700009037,
		extra_param = "",
		param = {
			{
				5,
				5,
				false,
				"%"
			}
		}
	},
	[700009038] = {
		description = "受到的伤害降低{1}",
		maxLv = 5,
		type = 1,
		id = 700009038,
		extra_param = "",
		param = {
			{
				5,
				5,
				false,
				"%"
			}
		}
	},
	[700009039] = {
		description = "最大生命值提高{1}",
		maxLv = 5,
		type = 1,
		id = 700009039,
		extra_param = "",
		param = {
			{
				20,
				20,
				false,
				"%"
			}
		}
	},
	[700009040] = {
		description = "会心率提高{1}，会心伤害提高{2}",
		maxLv = 5,
		type = 1,
		id = 700009040,
		extra_param = "",
		param = {
			{
				20,
				20,
				false,
				"%"
			},
			{
				30,
				30,
				false,
				"%"
			}
		}
	},
	[700009041] = {
		description = "伤害提高{1}",
		maxLv = 5,
		type = 1,
		id = 700009041,
		extra_param = "",
		param = {
			{
				4,
				4,
				false,
				"%"
			}
		}
	},
	[700009042] = {
		description = "敌人最大生命值降低{1}",
		maxLv = 5,
		type = 1,
		id = 700009042,
		extra_param = "",
		param = {
			{
				5,
				5,
				false,
				"%"
			}
		}
	},
	[700009043] = {
		description = "受到的伤害降低{1}",
		maxLv = 5,
		type = 1,
		id = 700009043,
		extra_param = "",
		param = {
			{
				5,
				5,
				false,
				"%"
			}
		}
	},
	[700009044] = {
		description = "最大生命值提高{1}",
		maxLv = 5,
		type = 1,
		id = 700009044,
		extra_param = "",
		param = {
			{
				20,
				20,
				false,
				"%"
			}
		}
	},
	[700009045] = {
		description = "会心率提高{1}，会心伤害提高{2}",
		maxLv = 5,
		type = 1,
		id = 700009045,
		extra_param = "",
		param = {
			{
				20,
				20,
				false,
				"%"
			},
			{
				30,
				30,
				false,
				"%"
			}
		}
	},
	[700009046] = {
		description = "技能伤害提高{1}",
		maxLv = 5,
		type = 1,
		id = 700009046,
		extra_param = "",
		param = {
			{
				6,
				6,
				false,
				"%"
			}
		}
	},
	[700009047] = {
		description = "技能命中敌人后，伤害提高{1}、移动速度提高{2}，最多可叠加20层，持续至本场战斗结束，该效果每2秒最多叠加一次",
		maxLv = 1,
		type = 1,
		id = 700009047,
		extra_param = "",
		param = {
			{
				2.5,
				2.5,
				false,
				"%"
			},
			{
				2,
				2,
				false,
				"%"
			}
		}
	},
	[700009048] = {
		description = "生命值低于50%时，攻击力提高{1}、会心伤害提高{2}，持续{3}秒，该效果本场战斗最多触发一次",
		maxLv = 1,
		type = 1,
		id = 700009048,
		extra_param = "",
		param = {
			{
				100,
				0,
				false,
				"%"
			},
			{
				100,
				0,
				false,
				"%"
			},
			{
				25,
				0,
				false,
				""
			}
		}
	},
	[700009049] = {
		description = "战斗开始60秒后，技能冷却时间缩短{1}，机制值获取效率提高{2}，持续至本场战斗结束",
		maxLv = 1,
		type = 1,
		id = 700009049,
		extra_param = "",
		param = {
			{
				50,
				0,
				false,
				"%"
			},
			{
				100,
				0,
				false,
				"%"
			}
		}
	},
	[700009050] = {
		description = "没有进行普通攻击和没有施放技能1秒后，攻击力提高{1}、会心率提高{2}，同时会心伤害每1秒提高{3}、最多可叠加2层；该效果会在进行普通攻击或施放技能命中敌人1秒后移除",
		maxLv = 1,
		type = 1,
		id = 700009050,
		extra_param = "",
		param = {
			{
				50,
				0,
				false,
				"%"
			},
			{
				80,
				0,
				false,
				"%"
			},
			{
				40,
				40,
				false,
				"%"
			}
		}
	},
	[700009051] = {
		description = "闪避效果冷却时间缩短3秒；触发极限闪避，伤害提高{1}，持续{2}秒",
		maxLv = 1,
		type = 1,
		id = 700009051,
		extra_param = "",
		param = {
			{
				150,
				0,
				false,
				"%"
			},
			{
				5,
				0,
				false,
				""
			}
		}
	},
	[700009052] = {
		description = "奥义获得率提高{1}，每次释放奥义后奥义获得率额外提高10%，最多可叠加3层，持续至本场战斗结束",
		maxLv = 1,
		type = 1,
		id = 700009052,
		extra_param = "",
		param = {
			{
				70,
				10,
				false,
				"%"
			}
		}
	},
	[700009053] = {
		description = "受到敌方伤害后，生命值低于15%时触发，无视敌方伤害，且每次命中敌人恢复自身{1}的生命值，该效果持续15秒或当生命值恢复至90%时结束，该效果本场战斗最多触发3次",
		maxLv = 1,
		type = 1,
		id = 700009053,
		extra_param = "",
		param = {
			{
				12,
				0,
				false,
				"%"
			}
		}
	},
	[700009054] = {
		description = "受到敌方伤害后5秒内，会心率提高{1}、首次命中敌人时恢复自身{2}的生命值，该效果每5秒最多触发一次",
		maxLv = 1,
		type = 1,
		id = 700009054,
		extra_param = "",
		param = {
			{
				100,
				0,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				"%"
			}
		}
	},
	[700009055] = {
		description = "战斗开始后，获得生命值上限{1}的护盾，持续10s，该效果每15秒触发一次；当护盾被移除时，受到的伤害降低{2}，持续5秒，并恢复自身{3}的生命值",
		maxLv = 1,
		type = 1,
		id = 700009055,
		extra_param = "",
		param = {
			{
				15,
				0,
				false,
				"%"
			},
			{
				50,
				0,
				false,
				"%"
			},
			{
				8,
				0,
				false,
				"%"
			}
		}
	},
	[700009056] = {
		description = "真樱修正者的攻击将额外造成一次固定{1}的附加伤害，每击退9波敌人附加伤害值提高5000，附加伤害每0.5秒最多触发一次",
		maxLv = 1,
		type = 1,
		id = 700009056,
		extra_param = "",
		param = {
			{
				5000,
				5000,
				false,
				""
			}
		}
	},
	[700009057] = {
		description = "奥山修正者的技能伤害提高{1}，每击退5波敌人提升10%技能伤害",
		maxLv = 1,
		type = 1,
		id = 700009057,
		extra_param = "",
		param = {
			{
				25,
				10,
				false,
				"%"
			}
		}
	},
	[700009058] = {
		description = "尼罗修正者每击退1波敌人，额外获得30%奥义充能，每击退5波敌人，奥义伤害提高75%",
		maxLv = 1,
		type = 1,
		id = 700009058,
		extra_param = "",
		param = {}
	},
	[700009059] = {
		description = "圣树修正者的会心率提高{1}、会心伤害提高{2}，每击退9波敌人会心率额外提高12%、会心伤害额外提高24%",
		maxLv = 1,
		type = 1,
		id = 700009059,
		extra_param = "",
		param = {
			{
				24,
				24,
				false,
				"%"
			},
			{
				12,
				12,
				false,
				"%"
			}
		}
	},
	[700009060] = {
		description = "众星修正者每击退1波敌人，刷新全部技能冷却时间",
		maxLv = 1,
		type = 1,
		id = 700009060,
		extra_param = "",
		param = {}
	},
	[700009061] = {
		description = "怒气型修正者怒气获得率提高30%、会心伤害提高40% ，每击退9波敌人怒气获得率额外提高15%",
		maxLv = 1,
		type = 1,
		id = 700009061,
		extra_param = "",
		param = {
			{
				30,
				15,
				false,
				""
			},
			{
				40,
				0,
				false,
				""
			}
		}
	},
	[700009062] = {
		description = "神能型修正者神能获得率提高20%、技能伤害提高20% ，每击退9波敌人神能获得率额外提高10%",
		maxLv = 1,
		type = 1,
		id = 700009062,
		extra_param = "",
		param = {
			{
				20,
				10,
				false,
				""
			},
			{
				20,
				0,
				false,
				""
			}
		}
	},
	[700009063] = {
		description = "能量型修正者能量获得率提高50%、技能冷却时间缩短15% ，每击退9波敌人能量获得率额外提高25%",
		maxLv = 1,
		type = 1,
		id = 700009063,
		extra_param = "",
		param = {
			{
				50,
				25,
				false,
				""
			},
			{
				15,
				0,
				false,
				""
			}
		}
	},
	[700009064] = {
		description = "印记型修正者获取印记时50%的概率额外获得1个印记、消耗印记的技能会心率提高20% ，每击退9波敌人印记额外获取概率提高25%",
		maxLv = 1,
		type = 1,
		id = 700009064,
		extra_param = "",
		param = {
			{
				50,
				25,
				false,
				""
			},
			{
				20,
				0,
				false,
				""
			}
		}
	},
	[700009065] = {
		description = "奥山系修正者奥义获取速度提升{1}，奥义伤害提高{2}",
		maxLv = 1,
		type = 1,
		id = 700009065,
		extra_param = "",
		param = {
			{
				50,
				0,
				false,
				"%"
			},
			{
				100,
				0,
				false,
				"%"
			}
		}
	},
	[700009066] = {
		description = "尼罗系修正者机制值获取效率提高{1}",
		maxLv = 1,
		type = 1,
		id = 700009066,
		extra_param = "",
		param = {
			{
				100,
				0,
				false,
				"%"
			}
		}
	},
	[700009067] = {
		description = "真樱系修正者技能以及奥义冷却时间降低{1}",
		maxLv = 1,
		type = 1,
		id = 700009067,
		extra_param = "",
		param = {
			{
				30,
				0,
				false,
				"%"
			}
		}
	},
	[700009068] = {
		description = "众星系修正者修正等级到Ω时伤害提高{1}",
		maxLv = 1,
		type = 1,
		id = 700009068,
		extra_param = "",
		param = {
			{
				100,
				0,
				false,
				"%"
			}
		}
	},
	[700009069] = {
		description = "圣树系修正者会心率提高{1}，会心伤害提高{2}",
		maxLv = 1,
		type = 1,
		id = 700009069,
		extra_param = "",
		param = {
			{
				30,
				0,
				false,
				"%"
			},
			{
				60,
				0,
				false,
				"%"
			}
		}
	},
	[700009070] = {
		description = "修正者闪避后，伤害提高{1}，持续{2}秒",
		maxLv = 1,
		type = 1,
		id = 700009070,
		extra_param = "",
		param = {
			{
				30,
				0,
				false,
				"%"
			},
			{
				3,
				0,
				false,
				""
			}
		}
	},
	[700009071] = {
		description = "修正者机制值满后，伤害提高{2}，持续{1}秒，该效果每10秒最多触发一次",
		maxLv = 1,
		type = 1,
		id = 700009071,
		extra_param = "",
		param = {
			{
				5,
				0,
				false,
				""
			},
			{
				70,
				0,
				false,
				"%"
			}
		}
	},
	[700009072] = {
		description = "修正者普通攻击每命中一次，下一次施放的奥义伤害提高{1}，最多可叠加20层；释放奥义后，移除所有层数",
		maxLv = 1,
		type = 1,
		id = 700009072,
		extra_param = "",
		param = {
			{
				5,
				5,
				false,
				"%"
			}
		}
	},
	[700009073] = {
		description = "修正者会心率提高{1}；修正者产生会心时，所有技能剩余冷却时间缩短20%，该效果每2秒最多触发一次",
		maxLv = 1,
		type = 1,
		id = 700009073,
		extra_param = "",
		param = {
			{
				15,
				0,
				false,
				"%"
			}
		}
	},
	[700009074] = {
		description = "修正者施放技能后，普通攻击伤害提高{1}，持续{2}秒",
		maxLv = 1,
		type = 1,
		id = 700009074,
		extra_param = "",
		param = {
			{
				100,
				0,
				false,
				"%"
			},
			{
				3,
				0,
				false,
				""
			}
		}
	},
	[700009075] = {
		description = "神能型修正者神能获得率提高{1}，修正等级达到Ω时神能获得率提高{2}",
		maxLv = 1,
		type = 1,
		id = 700009075,
		extra_param = "",
		param = {
			{
				36,
				0,
				false,
				"%"
			},
			{
				72,
				0,
				false,
				"%"
			}
		}
	},
	[700009076] = {
		description = "怒气型修正者极限闪避后{1}秒内，怒气获得率提高{2}",
		maxLv = 1,
		type = 1,
		id = 700009076,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				""
			},
			{
				50,
				0,
				false,
				"%"
			}
		}
	},
	[700009077] = {
		description = "印记型修正者获得印记时，有{1}的概率额外获得1个印记",
		maxLv = 1,
		type = 1,
		id = 700009077,
		extra_param = "",
		param = {
			{
				50,
				0,
				false,
				"%"
			}
		}
	},
	[700009078] = {
		description = "能量型修正者能量获得率提高{1}",
		maxLv = 1,
		type = 1,
		id = 700009078,
		extra_param = "",
		param = {
			{
				50,
				0,
				false,
				"%"
			}
		}
	},
	[700009079] = {
		description = "修正者对首领奥义伤害提高100%",
		maxLv = 1,
		type = 1,
		id = 700009079,
		extra_param = "",
		param = {}
	},
	[700009080] = {
		description = "修正者每隔24秒获得满机制值",
		maxLv = 1,
		type = 1,
		id = 700009080,
		extra_param = "",
		param = {}
	},
	[700009081] = {
		description = "修正者极限闪避后，对首领伤害提高{1}，持续{2}秒",
		maxLv = 1,
		type = 1,
		id = 700009081,
		extra_param = "",
		param = {
			{
				30,
				0,
				false,
				"%"
			},
			{
				5,
				0,
				false,
				""
			}
		}
	},
	[700009082] = {
		description = "修正者对处于被控制状态的敌人造成的伤害提高{1}",
		maxLv = 1,
		type = 1,
		id = 700009082,
		extra_param = "",
		param = {
			{
				50,
				0,
				false,
				"%"
			}
		}
	},
	[700009083] = {
		description = "修正者退出修正模式后，根据对敌人造成的伤害占其最大生命值的百分比，恢复全队相同百分比的血量",
		maxLv = 1,
		type = 1,
		id = 700009083,
		extra_param = "",
		param = {}
	},
	[700009084] = {
		description = "修正者附近每存在一个敌人，伤害提高{1}，最多提高{2}",
		maxLv = 1,
		type = 1,
		id = 700009084,
		extra_param = "",
		param = {
			{
				5,
				5,
				false,
				"%"
			},
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700009085] = {
		description = "修正者施放奥义后，所有友方单位受到的下一次伤害最高为1点",
		maxLv = 1,
		type = 1,
		id = 700009085,
		extra_param = "",
		param = {}
	},
	[700009086] = {
		description = "修正者在6秒内连续施放三个技能，雷属性伤害提高{1}，持续{2}秒",
		maxLv = 1,
		type = 1,
		id = 700009086,
		extra_param = "",
		param = {
			{
				35,
				0,
				false,
				"%"
			},
			{
				3,
				0,
				false,
				""
			}
		}
	},
	[700009087] = {
		description = "印记型修正者技能冷却时间缩短{1}",
		maxLv = 1,
		type = 1,
		id = 700009087,
		extra_param = "",
		param = {
			{
				40,
				0,
				false,
				"%"
			}
		}
	},
	[700009088] = {
		description = "修正者每损失1%的生命值，伤害提高{1}，该效果最高60%",
		maxLv = 1,
		type = 1,
		id = 700009088,
		extra_param = "",
		param = {
			{
				0.6,
				0.6,
				false,
				"%"
			}
		}
	},
	[700009089] = {
		description = "修正者伤害提高30%，每次受击后伤害提升效果减少{1}，10秒未受击则恢复初始值",
		maxLv = 1,
		type = 1,
		id = 700009089,
		extra_param = "",
		param = {
			{
				10,
				10,
				false,
				"%"
			}
		}
	},
	[700009090] = {
		description = "修正者近战伤害提高{1}",
		maxLv = 1,
		type = 1,
		id = 700009090,
		extra_param = "",
		param = {
			{
				20,
				0,
				false,
				"%"
			}
		}
	},
	[700009091] = {
		description = "修正者远程伤害提高{1}",
		maxLv = 1,
		type = 1,
		id = 700009091,
		extra_param = "",
		param = {
			{
				20,
				0,
				false,
				"%"
			}
		}
	},
	[700009101] = {
		description = "修正者怒气获得率提高100%",
		maxLv = 1,
		type = 1,
		id = 700009101,
		extra_param = "",
		param = {}
	},
	[700009102] = {
		description = "修正者神能获得率提高100%",
		maxLv = 1,
		type = 1,
		id = 700009102,
		extra_param = "",
		param = {}
	},
	[700009103] = {
		description = "修正者能量获得率提高100%",
		maxLv = 1,
		type = 1,
		id = 700009103,
		extra_param = "",
		param = {}
	},
	[700009104] = {
		description = "修正者获得印记时，会额外获得1个印记",
		maxLv = 1,
		type = 1,
		id = 700009104,
		extra_param = "",
		param = {}
	},
	[700009105] = {
		description = "闪避回复速度提高100%，从背面攻击怪物时伤害提高{1}",
		maxLv = 1,
		type = 1,
		id = 700009105,
		extra_param = "",
		param = {
			{
				70,
				0,
				false,
				"%"
			}
		}
	},
	[700009106] = {
		description = "修正者伤害提高50%，每次受击后伤害提升效果减少{1}，10秒未受击则恢复初始值",
		maxLv = 1,
		type = 1,
		id = 700009106,
		extra_param = "",
		param = {
			{
				10,
				10,
				false,
				"%"
			}
		}
	},
	[700009107] = {
		description = "奥义获得率提高{1}，施放奥义后重置所有技能冷却时间",
		maxLv = 1,
		type = 1,
		id = 700009107,
		extra_param = "",
		param = {
			{
				50,
				0,
				false,
				"%"
			}
		}
	},
	[700009108] = {
		description = "闪避效果冷却时间缩短8秒。极限闪避后，伤害提高{1}、获得“霸体”效果，持续3秒",
		maxLv = 1,
		type = 1,
		id = 700009108,
		extra_param = "",
		param = {
			{
				30,
				0,
				false,
				"%"
			}
		}
	},
	[700009109] = {
		description = "每5秒伤害提高{1}，受到伤害减少{2}，效果最多叠加10层",
		maxLv = 1,
		type = 1,
		id = 700009109,
		extra_param = "",
		param = {
			{
				4,
				4,
				false,
				"%"
			},
			{
				2,
				2,
				false,
				"%"
			}
		}
	},
	[700009110] = {
		description = "修正等级Ω时，伤害提高{1}，生命值最低只会降低到1",
		maxLv = 1,
		type = 1,
		id = 700009110,
		extra_param = "",
		param = {
			{
				70,
				0,
				false,
				"%"
			}
		}
	},
	[700009111] = {
		description = "生命值低于15%时，获得“无敌”效果，持续1秒；之后每秒钟恢复最大生命值的{1}，持续10秒，该效果每20秒最多触发一次",
		maxLv = 1,
		type = 1,
		id = 700009111,
		extra_param = "",
		param = {
			{
				5,
				0,
				false,
				"%"
			}
		}
	},
	[700009112] = {
		description = "机制值为满时，恢复最大生命值的{1}，该效果每15秒最多触发一次",
		maxLv = 1,
		type = 1,
		id = 700009112,
		extra_param = "",
		param = {
			{
				50,
				0,
				false,
				"%"
			}
		}
	},
	[700009113] = {
		description = "极限闪避后获得自身最大生命值{1}的护盾，该护盾持续6秒",
		maxLv = 1,
		type = 1,
		id = 700009113,
		extra_param = "",
		param = {
			{
				50,
				0,
				false,
				"%"
			}
		}
	},
	[700009114] = {
		description = "每隔3秒，在10米范围内随机选择一名敌人对其降下一道落雷，造成{1}攻击力的雷属性伤害",
		maxLv = 1,
		type = 1,
		id = 700009114,
		extra_param = "",
		param = {
			{
				500,
				12.82,
				false,
				"%"
			}
		}
	},
	[700009115] = {
		description = "进入「狂雷」状态时，获得50点「雷势」",
		maxLv = 1,
		type = 1,
		id = 700009115,
		extra_param = "",
		param = {}
	},
	[700009116] = {
		description = "施放衍生技能命中时，会退出「狂雷」状态并降下一道落雷，造成{1}攻击力的雷属性伤害",
		maxLv = 1,
		type = 1,
		id = 700009116,
		extra_param = "",
		param = {
			{
				500,
				12.82,
				false,
				"%"
			}
		}
	},
	[700009117] = {
		description = "进入「狂雷」状态时，会聚集场上敌人到自己身边，该效果每10秒触发一次",
		maxLv = 1,
		type = 1,
		id = 700009117,
		extra_param = "",
		param = {}
	},
	[700009118] = {
		description = "普通攻击第四段命中敌人时，获得1个印记",
		maxLv = 1,
		type = 1,
		id = 700009118,
		extra_param = "",
		param = {}
	},
	[700009119] = {
		description = "被敌人命中后获得20点「雷势」，并对攻击者降下一道落雷，造成{1}攻击力的雷属性伤害，被此次落雷命中的敌人会被眩晕4s，如果被眩晕则会被拉扯到角色身前",
		maxLv = 1,
		type = 1,
		id = 700009119,
		extra_param = "",
		param = {
			{
				500,
				12.82,
				false,
				"%"
			}
		}
	},
	[700009120] = {
		description = "「狂雷」状态下击败敌人会随机刷新一个技能的冷却，该效果每5秒触发一次",
		maxLv = 1,
		type = 1,
		id = 700009120,
		extra_param = "",
		param = {}
	},
	[700009121] = {
		description = "触发闪避效果时，聚集敌人并降下一道落雷，造成{1}攻击力的雷属性伤害",
		maxLv = 1,
		type = 1,
		id = 700009121,
		extra_param = "",
		param = {
			{
				500,
				12.82,
				false,
				"%"
			}
		}
	},
	[700009122] = {
		description = "进入「狂雷」状态时，所有技能的冷却时间减少20%",
		maxLv = 1,
		type = 1,
		id = 700009122,
		extra_param = "",
		param = {}
	},
	[700009123] = {
		description = "闪避会在5米范围内随机降下一道落雷，造成{1}攻击力的雷属性伤害，触发极限闪避时会对攻击者额外降下一道落雷",
		maxLv = 1,
		type = 1,
		id = 700009123,
		extra_param = "",
		param = {
			{
				500,
				12.82,
				false,
				"%"
			}
		}
	},
	[700009124] = {
		description = "每击败一个敌人获得少量奥义充能",
		maxLv = 1,
		type = 1,
		id = 700009124,
		extra_param = "",
		param = {}
	},
	[700009125] = {
		description = "生命上限+30%",
		maxLv = 1,
		type = 1,
		id = 700009125,
		extra_param = "",
		param = {}
	},
	[700009126] = {
		description = "奥义获得率提高{1}",
		maxLv = 1,
		type = 1,
		id = 700009126,
		extra_param = "",
		param = {
			{
				50,
				0,
				false,
				"%"
			}
		}
	},
	[700009127] = {
		description = "接下来5场战斗，自身会携带负面词缀“减速”。\n减速：移动速度降低30%",
		maxLv = 5,
		type = 1,
		id = 700009127,
		extra_param = "",
		param = {}
	},
	[700009128] = {
		description = "接下来5场战斗，敌人会携带词缀“薪火”。\n薪火：该敌方单位被击败后，附近大范围内其他敌人造成的伤害提高{1}，最多可叠加3层",
		maxLv = 5,
		type = 1,
		id = 700009128,
		extra_param = "",
		param = {
			{
				8,
				8,
				false,
				"%"
			}
		}
	},
	[700009129] = {
		description = "接下来5场战斗，敌人会携带词缀“庇荫”。\n庇荫：该敌方单位被击败后，附近大范围内其他敌人受到的伤害降低{1}，最多可叠加3层",
		maxLv = 5,
		type = 1,
		id = 700009129,
		extra_param = "",
		param = {
			{
				8,
				8,
				false,
				"%"
			}
		}
	},
	[700009130] = {
		description = "接下来5场战斗，敌人会携带词缀“致残”。\n致残：该敌方单位攻击命中后，目标当前闪避能量减少{1}，每{2}秒最多触发1次",
		maxLv = 5,
		type = 1,
		id = 700009130,
		extra_param = "",
		param = {
			{
				20,
				20,
				false,
				"%"
			},
			{
				2,
				0,
				false,
				""
			}
		}
	},
	[700009131] = {
		description = "接下来5场战斗，自身会携带负面词缀“燃能”。\n燃能：修正者被命中后损失5点神能/怒气/能量或15%概率损失1个印记",
		maxLv = 5,
		type = 1,
		id = 700009131,
		extra_param = "",
		param = {}
	},
	[700009132] = {
		description = "接下来5场战斗，自身无法触发「雷光远遁」的极限闪避效果。",
		maxLv = 5,
		type = 1,
		id = 700009132,
		extra_param = "",
		param = {}
	},
	[700009133] = {
		description = "接下来5场战斗，自身开场获得100%奥义充能。",
		maxLv = 5,
		type = 1,
		id = 700009133,
		extra_param = "",
		param = {}
	},
	[700009134] = {
		description = "接下来5场战斗，自身开场获得3个印记。",
		maxLv = 5,
		type = 1,
		id = 700009134,
		extra_param = "",
		param = {}
	},
	[700009135] = {
		description = "接下来5场战斗，自身移动速度+100%。",
		maxLv = 5,
		type = 1,
		id = 700009135,
		extra_param = "",
		param = {}
	},
	[700009136] = {
		description = "接下来5场战斗，自身闪避能量恢复速度+100%。",
		maxLv = 5,
		type = 1,
		id = 700009136,
		extra_param = "",
		param = {}
	},
	[700009138] = {
		description = "在主控修正者脚下生成1个火箭弹，每5秒生成一个。每成功闪避火箭弹2次时，在场上生成1个我方的无人机辅助；场上无人机最多存在2个，每个无人机最多存在25秒",
		maxLv = 1,
		type = 1,
		id = 700009138,
		extra_param = "",
		param = {}
	},
	[700009139] = {
		description = "修正者被蛇神命中时，会被附加蛇之眼标记，持续20秒。处于蛇之眼标记的修正者受到的伤害提高160%",
		maxLv = 1,
		type = 1,
		id = 700009139,
		extra_param = "",
		param = {}
	},
	[700009140] = {
		description = "比弗隆斯的大眼会有从外向内的光圈，被光圈命中时会被击退并消耗机制值（30点怒气/能量/神能、1个印记）。大眼充能成功后，比弗隆斯受到的伤害降低42%；大眼充能失败后，比弗隆斯攻击力提高30%、受到的伤害提高10%",
		maxLv = 1,
		type = 1,
		id = 700009140,
		extra_param = "",
		param = {}
	},
	[700009141] = {
		description = "拉冬每次施放陨落灾域，在陨石落点生成一个龙之果实，龙之果实会在20秒后自爆；生成龙之果实后拉冬恢复25%生命值。当龙之果实被修正者击破后，拉冬攻击力提高15%，所有修正者攻击力提高10%，持续25秒，并恢复30%的生命值；当龙之果实成功自爆后，拉冬攻击力提高30%，并恢复20%的生命值",
		maxLv = 1,
		type = 1,
		id = 700009141,
		extra_param = "",
		param = {}
	},
	[700009142] = {
		description = "哈法斯生命值低于50%时会获得生命值上限30%的护盾，并且每2秒自动恢复3%的生命值。护盾被击破后，哈法斯防御力降低12%，持续15秒，攻击力提高12%",
		maxLv = 1,
		type = 1,
		id = 700009142,
		extra_param = "",
		param = {}
	},
	[700009143] = {
		description = "琉刻与明塔获得共生效果，受到的伤害平分。每次进入修正空间时，共生效果移除；退出修正空间后24秒内，琉刻与明塔伤害提高24%，修正值一直为0不会增加；之后琉刻与明塔重新获得共生效果",
		maxLv = 1,
		type = 1,
		id = 700009143,
		extra_param = "",
		param = {}
	},
	[700009144] = {
		description = "每间隔25秒，奥利海姆和零一其中一个获得伤害提高50%、另一个受到的伤害提高20%。修正模式结束后换强制轮换一次效果，时间会重置",
		maxLv = 1,
		type = 1,
		id = 700009144,
		extra_param = "",
		param = {}
	},
	[700009145] = {
		description = "两个视骸其中一个生命值低于30%时，获得献祭状态，持续24秒；状态期间不会进入修正模式，状态结束时另一个视骸恢复60%的生命值、伤害提高50%且不会进入修正模式。处于献祭状态的敌人被击败时，击败者恢复30%的生命值、伤害提高15%",
		maxLv = 1,
		type = 1,
		id = 700009145,
		extra_param = "",
		param = {}
	},
	[700009146] = {
		description = "队友的伤害提高10%，主控修正者受到的伤害提高30%",
		maxLv = 1,
		type = 1,
		id = 700009146,
		extra_param = "",
		param = {}
	},
	[700009147] = {
		description = "修正者伤害提高15%，被击时消耗对应机制值（30点怒气/能量/神能、1个印记）",
		maxLv = 1,
		type = 1,
		id = 700009147,
		extra_param = "",
		param = {}
	},
	[700009148] = {
		description = "修正者奥义获得率提高10%，评分值获得率降低30%",
		maxLv = 1,
		type = 1,
		id = 700009148,
		extra_param = "",
		param = {}
	},
	[700009149] = {
		description = "修正者受到的伤害提高20%。修正者生命值高于50%时，造成的伤害提高10%",
		maxLv = 1,
		type = 1,
		id = 700009149,
		extra_param = "",
		param = {}
	},
	[700009150] = {
		description = "修正者获得每3秒3%生命值上限的生命移除状态，但攻击力提高25%",
		maxLv = 1,
		type = 1,
		id = 700009150,
		extra_param = "",
		param = {}
	},
	[700009151] = {
		description = "修正者闪避消耗降低80%，但不能触发极限闪避效果",
		maxLv = 1,
		type = 1,
		id = 700009151,
		extra_param = "",
		param = {}
	},
	[700009152] = {
		description = "修正者受到的恢复效果提高50%，但受到的伤害提高15%",
		maxLv = 1,
		type = 1,
		id = 700009152,
		extra_param = "",
		param = {}
	},
	[700009153] = {
		description = "处于修正空间时，怪物受到的伤害提高15%。退出修正空间后，敌人攻击力提高30%，持续15秒",
		maxLv = 1,
		type = 1,
		id = 700009153,
		extra_param = "",
		param = {}
	},
	[700009154] = {
		description = "修正者会心伤害提高20%，奥义冷却时间延长10秒",
		maxLv = 1,
		type = 1,
		id = 700009154,
		extra_param = "",
		param = {}
	},
	[700009155] = {
		description = "修正者的冰冻、眩晕、禁锢效果时间延长30%。敌人伤害提高30%",
		maxLv = 1,
		type = 1,
		id = 700009155,
		extra_param = "",
		param = {}
	},
	[700009156] = {
		description = "敌人生命值高于50%时，受到的伤害提高15%；生命值低于50%时，伤害提高15%，受到的伤害降低20%",
		maxLv = 1,
		type = 1,
		id = 700009156,
		extra_param = "",
		param = {}
	},
	[700009157] = {
		description = "出场时，修正者获得2次无敌效果；失去效果后，受到伤害提高20%，持续40秒",
		maxLv = 1,
		type = 1,
		id = 700009157,
		extra_param = "",
		param = {}
	},
	[700009158] = {
		description = "修正者闪避值恢复速度提高20%，但闪避后受到的伤害提高8%，持续5秒",
		maxLv = 1,
		type = 1,
		id = 700009158,
		extra_param = "",
		param = {}
	},
	[700009160] = {
		description = "烙焰·提尔专属词缀：提尔处于手甲姿态时伤害提升40%",
		maxLv = 1,
		type = 1,
		id = 700009160,
		extra_param = "",
		param = {}
	},
	[700009161] = {
		description = "施放「冀野星陨」时，会同时施放「冀野星陨·阳」、「冀野星陨·阴」。",
		maxLv = 1,
		type = 1,
		id = 700009161,
		extra_param = "",
		param = {}
	},
	[700009162] = {
		description = "触发天垣神系共鸣的最高效果。",
		maxLv = 1,
		type = 1,
		id = 700009162,
		extra_param = "",
		param = {}
	},
	[700009163] = {
		description = "施放「南极海鸣」时，对命中的敌人附加冰冻效果，持续{1}秒，该效果每{2}秒最多触发一次。",
		maxLv = 1,
		type = 1,
		id = 700009163,
		extra_param = "",
		param = {
			{
				5,
				0,
				false,
				""
			},
			{
				15,
				0,
				false,
				""
			}
		}
	},
	[700009164] = {
		description = "极限闪避时，触发一次追加攻击。",
		maxLv = 1,
		type = 1,
		id = 700009164,
		extra_param = "",
		param = {}
	},
	[700009165] = {
		description = "极限闪避时，当攻击者具有修正值，攻击者修正值增加{1}。",
		maxLv = 1,
		type = 1,
		id = 700009165,
		extra_param = "",
		param = {
			{
				40,
				0,
				false,
				"%"
			}
		}
	},
	[700009166] = {
		description = "「冀野星陨」命中时，「南极海鸣」的剩余冷却时间缩短{1}秒，该效果每{2}秒最多触发一次。",
		maxLv = 1,
		type = 1,
		id = 700009166,
		extra_param = "",
		param = {
			{
				1,
				0,
				false,
				""
			},
			{
				4,
				0,
				false,
				""
			}
		}
	},
	[700009167] = {
		description = "「黎丘云合」命中时，「南极海鸣」的剩余冷却时间缩短{1}秒，该效果每{2}秒最多触发一次。",
		maxLv = 1,
		type = 1,
		id = 700009167,
		extra_param = "",
		param = {
			{
				2.5,
				0,
				false,
				""
			},
			{
				8,
				0,
				false,
				""
			}
		}
	},
	[700009168] = {
		description = "极限闪避时，「南极海鸣」的剩余冷却时间缩短{1}秒。",
		maxLv = 1,
		type = 1,
		id = 700009168,
		extra_param = "",
		param = {
			{
				8,
				0,
				false,
				""
			}
		}
	},
	[700009169] = {
		description = "施放「南极海鸣」时，获得免疫效果，持续{1}秒，期间受到攻击时，对攻击者触发一次追加攻击。",
		maxLv = 1,
		type = 1,
		id = 700009169,
		extra_param = "",
		param = {
			{
				2,
				0,
				false,
				""
			}
		}
	},
	[700009170] = {
		description = "受到致命伤害时，自动规避该伤害并恢复自身{1}的生命值，重置自身所有技能和奥义的冷却时间，每场战斗最多触发一次。",
		maxLv = 1,
		type = 1,
		id = 700009170,
		extra_param = "",
		param = {
			{
				20,
				0,
				false,
				"%"
			}
		}
	},
	[700009171] = {
		description = "格莫瑞攻击每命中修正者3次后会回复自身1%的生命值，并且修正者每被格莫瑞命中一次防御力降低16%，最多可叠加5层。当修正者成功弹反格莫瑞的攻击后可以解除防御降低效果",
		maxLv = 1,
		type = 1,
		id = 700009171,
		extra_param = "",
		param = {}
	},
	[700009172] = {
		description = "敌人最大生命值降低{1}",
		maxLv = 5,
		type = 1,
		id = 700009172,
		extra_param = "",
		param = {
			{
				5,
				5,
				false,
				"%"
			}
		}
	},
	[700009173] = {
		description = "受到的伤害降低{1}",
		maxLv = 5,
		type = 1,
		id = 700009173,
		extra_param = "",
		param = {
			{
				5,
				5,
				false,
				"%"
			}
		}
	},
	[700009174] = {
		description = "最大生命值提高{1}",
		maxLv = 5,
		type = 1,
		id = 700009174,
		extra_param = "",
		param = {
			{
				20,
				20,
				false,
				"%"
			}
		}
	},
	[700009175] = {
		description = "会心率提高{1}，会心伤害提高{2}",
		maxLv = 5,
		type = 1,
		id = 700009175,
		extra_param = "",
		param = {
			{
				20,
				20,
				false,
				"%"
			},
			{
				30,
				30,
				false,
				"%"
			}
		}
	},
	[700009176] = {
		description = "全属性伤害提高提高{1}",
		maxLv = 5,
		type = 1,
		id = 700009176,
		extra_param = "",
		param = {
			{
				30,
				30,
				false,
				"%"
			}
		}
	},
	[700009177] = {
		description = "敌人最大生命值提高{1}",
		maxLv = 50,
		type = 1,
		id = 700009177,
		extra_param = "",
		param = {
			{
				10,
				10,
				false,
				"%"
			}
		}
	},
	[700009178] = {
		description = "修正者的会心率提高100%",
		maxLv = 1,
		type = 1,
		id = 700009178,
		extra_param = "",
		param = {}
	},
	[700009179] = {
		description = "技能三「彼岸·千引」成功格挡时，对周围的敌人附加冰冻状态、冰属性抗性降低{1}，持续{2}秒。",
		maxLv = 1,
		type = 1,
		id = 700009179,
		extra_param = "",
		param = {
			{
				25,
				0,
				false,
				"%"
			},
			{
				7,
				0,
				false,
				""
			}
		}
	},
	[700009180] = {
		description = "普通攻击第五段会聚集附近的敌人。",
		maxLv = 1,
		type = 1,
		id = 700009180,
		extra_param = "",
		param = {}
	},
	[700009181] = {
		description = "极限闪避后的追加攻击命中时，自身随机一个技能的剩余冷却时间缩短3秒，该效果每4秒最多触发一次。",
		maxLv = 1,
		type = 1,
		id = 700009181,
		extra_param = "",
		param = {}
	},
	[700009182] = {
		description = "施放普通攻击第二段、技能一、技能二会有额外的刀气攻击敌人,造成{1}攻击力的冰属性伤害。",
		maxLv = 1,
		type = 1,
		id = 700009182,
		extra_param = "",
		param = {
			{
				300,
				7.692,
				false,
				"%"
			}
		}
	},
	[700009183] = {
		description = "「镜花·霜舞」、「镜花·凛冰」会额外消耗10点怒气，伤害提高{1}。",
		maxLv = 1,
		type = 1,
		id = 700009183,
		extra_param = "",
		param = {
			{
				20,
				0,
				false,
				"%"
			}
		}
	},
	[700009184] = {
		description = "每次击败敌人时，「日狭女」的伤害提高{1}，最多可叠加5层；达到满层时，「日狭女」攻击命中普通敌人时有一定概率直接击败敌人。",
		maxLv = 1,
		type = 1,
		id = 700009184,
		extra_param = "",
		param = {
			{
				5,
				5,
				false,
				"%"
			}
		}
	},
	[700009185] = {
		description = "「日狭女」攻击命中处于控制抗性状态的敌人时，会清除敌人的控制抗性状态，该效果每25秒最多触发一次。",
		maxLv = 1,
		type = 1,
		id = 700009185,
		extra_param = "",
		param = {}
	},
	[700009186] = {
		description = "「日狭女」会从常世随机对1个普通敌人附加禁锢状态，持续2秒，并造成最大生命值10%的伤害，该效果每5秒最多触发一次。",
		maxLv = 1,
		type = 1,
		id = 700009186,
		extra_param = "",
		param = {}
	},
	[700009187] = {
		description = "自身的攻击有25%的概率清除敌人的控制抗性点数，并造成{1}攻击力的冰属性伤害，该效果每3秒最多触发一次。",
		maxLv = 1,
		type = 1,
		id = 700009187,
		extra_param = "",
		param = {
			{
				700,
				17.948,
				false,
				"%"
			}
		}
	},
	[700009188] = {
		description = "「日狭女」攻击命中时，对命中的敌人附加防御力降低{1}，最多可叠加3层。",
		maxLv = 1,
		type = 1,
		id = 700009188,
		extra_param = "",
		param = {
			{
				20,
				20,
				false,
				"%"
			}
		}
	},
	[700009189] = {
		description = "火属性伤害提高{1}",
		maxLv = 3,
		type = 1,
		id = 700009189,
		extra_param = "",
		param = {
			{
				20,
				20,
				false,
				"%"
			}
		}
	},
	[700009190] = {
		description = "怒气获得率提高{1}",
		maxLv = 3,
		type = 1,
		id = 700009190,
		extra_param = "",
		param = {
			{
				20,
				20,
				false,
				"%"
			}
		}
	},
	[700009191] = {
		description = "奥义值获得率提高{1}",
		maxLv = 3,
		type = 1,
		id = 700009191,
		extra_param = "",
		param = {
			{
				15,
				15,
				false,
				"%"
			}
		}
	},
	[700009192] = {
		description = "对精英及首领敌人伤害提高{1}",
		maxLv = 3,
		type = 1,
		id = 700009192,
		extra_param = "",
		param = {
			{
				20,
				20,
				false,
				"%"
			}
		}
	},
	[700009193] = {
		description = "会心伤害提高{1}",
		maxLv = 3,
		type = 1,
		id = 700009193,
		extra_param = "",
		param = {
			{
				30,
				30,
				false,
				"%"
			}
		}
	},
	[700009194] = {
		description = "处于「熔火」状态时，积蓄条获得率提高100%",
		maxLv = 1,
		type = 1,
		id = 700009194,
		extra_param = "",
		param = {}
	},
	[700009195] = {
		description = "修正者生命值越少伤害提高越高，该效果提供的伤害提高最高60%",
		maxLv = 1,
		type = 1,
		id = 700009195,
		extra_param = "",
		param = {
			{
				0.6,
				0.6,
				false,
				""
			}
		}
	},
	[700009196] = {
		description = "修正等级为Ω时，伤害提高{1}，生命值最低只会降低到1",
		maxLv = 1,
		type = 1,
		id = 700009196,
		extra_param = "",
		param = {
			{
				60,
				0,
				false,
				"%"
			}
		}
	},
	[700009197] = {
		description = "该敌方单位受到的伤害提高{1}",
		maxLv = 6,
		type = 1,
		id = 700009197,
		extra_param = "",
		param = {
			{
				50,
				50,
				false,
				"%"
			}
		}
	},
	[700009198] = {
		description = "嬉闹团雪的特殊装置「喵爪之助」",
		maxLv = 1,
		type = 1,
		id = 700009198,
		extra_param = "",
		param = {}
	},
	[700009199] = {
		description = "嬉闹团雪的特殊装置「喵爪摇摇」",
		maxLv = 1,
		type = 1,
		id = 700009199,
		extra_param = "",
		param = {}
	},
	[700009200] = {
		description = "嬉闹团雪的特殊装置「喵爪特尔」",
		maxLv = 1,
		type = 1,
		id = 700009200,
		extra_param = "",
		param = {}
	},
	[700009201] = {
		description = "攻击力提升{1}",
		maxLv = 10,
		type = 1,
		id = 700009201,
		extra_param = "",
		param = {
			{
				10,
				10,
				false,
				"%"
			}
		}
	},
	[700009202] = {
		description = "普攻伤害提升{1}",
		maxLv = 10,
		type = 1,
		id = 700009202,
		extra_param = "",
		param = {
			{
				10,
				10,
				false,
				"%"
			}
		}
	},
	[700009203] = {
		description = "会心率提高{1}",
		maxLv = 20,
		type = 1,
		id = 700009203,
		extra_param = "",
		param = {
			{
				5,
				5,
				false,
				"%"
			}
		}
	},
	[700009204] = {
		description = "最大生命提升{1}",
		maxLv = 10,
		type = 1,
		id = 700009204,
		extra_param = "",
		param = {
			{
				10,
				10,
				false,
				"%"
			}
		}
	},
	[700009205] = {
		description = "技能伤害提升{1}",
		maxLv = 20,
		type = 1,
		id = 700009205,
		extra_param = "",
		param = {
			{
				5,
				5,
				false,
				"%"
			}
		}
	},
	[700009206] = {
		description = "会心伤害提升{1}",
		maxLv = 10,
		type = 1,
		id = 700009206,
		extra_param = "",
		param = {
			{
				10,
				10,
				false,
				"%"
			}
		}
	},
	[700009207] = {
		description = "奥义伤害提升{1}",
		maxLv = 10,
		type = 1,
		id = 700009207,
		extra_param = "",
		param = {
			{
				10,
				10,
				false,
				"%"
			}
		}
	},
	[700009208] = {
		description = "防御力提升{1}",
		maxLv = 10,
		type = 1,
		id = 700009208,
		extra_param = "",
		param = {
			{
				10,
				10,
				false,
				"%"
			}
		}
	},
	[700009209] = {
		description = "全属性伤害提高提高{1}",
		maxLv = 5,
		type = 1,
		id = 700009209,
		extra_param = "",
		param = {
			{
				30,
				30,
				false,
				"%"
			}
		}
	},
	[700009210] = {
		description = "全属性伤害提高提高{1}",
		maxLv = 5,
		type = 1,
		id = 700009210,
		extra_param = "",
		param = {
			{
				30,
				30,
				false,
				"%"
			}
		}
	},
	[700009211] = {
		description = "全属性伤害提高提高{1}",
		maxLv = 5,
		type = 1,
		id = 700009211,
		extra_param = "",
		param = {
			{
				30,
				30,
				false,
				"%"
			}
		}
	},
	[700009212] = {
		description = "全属性伤害提高提高{1}",
		maxLv = 5,
		type = 1,
		id = 700009212,
		extra_param = "",
		param = {
			{
				30,
				30,
				false,
				"%"
			}
		}
	},
	[700009213] = {
		description = "全属性伤害提高提高{1}",
		maxLv = 5,
		type = 1,
		id = 700009213,
		extra_param = "",
		param = {
			{
				30,
				30,
				false,
				"%"
			}
		}
	},
	[700009215] = {
		description = "修正者每次命中复仇之拳则复仇之拳造成伤害提高5%，同时自身防御力降低3%，最多可叠加10层，当修正者成功弹反复仇之拳的攻击后可减少复仇怒意效果，复仇之拳成功命中修正者后清空复仇怒意效果。",
		maxLv = 10,
		type = 1,
		id = 700009215,
		extra_param = "",
		param = {}
	},
	[700009319] = {
		description = "解锁「音符 · 白闪」",
		maxLv = 1,
		type = 1,
		id = 700009319,
		extra_param = "",
		param = {}
	},
	[700009320] = {
		description = "解锁「音符 · 霜花 」",
		maxLv = 1,
		type = 1,
		id = 700009320,
		extra_param = "",
		param = {}
	},
	[700009321] = {
		description = "解锁「音符 · 凛冽」",
		maxLv = 1,
		type = 1,
		id = 700009321,
		extra_param = "",
		param = {}
	},
	[700009322] = {
		description = "解锁「变奏 · 羁绊回声 」",
		maxLv = 1,
		type = 1,
		id = 700009322,
		extra_param = "",
		param = {}
	},
	[700009323] = {
		description = "解锁「终曲 · 寂静旋律 」",
		maxLv = 1,
		type = 1,
		id = 700009323,
		extra_param = "",
		param = {}
	},
	[700009324] = {
		description = "解锁「音符 · 新月 」",
		maxLv = 1,
		type = 1,
		id = 700009324,
		extra_param = "",
		param = {}
	},
	[700009325] = {
		description = "解锁「音符 · 满月 」",
		maxLv = 1,
		type = 1,
		id = 700009325,
		extra_param = "",
		param = {}
	},
	[700009326] = {
		description = "解锁「音符 · 夜华流转 」",
		maxLv = 1,
		type = 1,
		id = 700009326,
		extra_param = "",
		param = {}
	},
	[700009327] = {
		description = "解锁「变奏 · 辉月交响 」",
		maxLv = 1,
		type = 1,
		id = 700009327,
		extra_param = "",
		param = {}
	},
	[700009328] = {
		description = "解锁「终曲 · 庄严乐章 」",
		maxLv = 1,
		type = 1,
		id = 700009328,
		extra_param = "",
		param = {}
	},
	[700009329] = {
		description = "一技能的最后一击将射出燃烧弹",
		maxLv = 1,
		type = 1,
		id = 700009329,
		extra_param = "",
		param = {}
	},
	[700009330] = {
		description = "普攻造成伤害的同时将灼烧地面",
		maxLv = 1,
		type = 1,
		id = 700009330,
		extra_param = "",
		param = {}
	},
	[700009331] = {
		description = "二技能的距离与伤害增加",
		maxLv = 1,
		type = 1,
		id = 700009331,
		extra_param = "",
		param = {}
	},
	[700009332] = {
		description = "闪避时在自己脚下生成一个聚集怪物的漩涡",
		maxLv = 1,
		type = 1,
		id = 700009332,
		extra_param = "",
		param = {}
	},
	[700009333] = {
		description = "完美格挡后下次普攻变为旋转飞刃",
		maxLv = 1,
		type = 1,
		id = 700009333,
		extra_param = "",
		param = {}
	},
	[700009334] = {
		description = "三技能可以飞行，获得新技能组",
		maxLv = 1,
		type = 1,
		id = 700009334,
		extra_param = "",
		param = {}
	},
	[700009335] = {
		description = "一技能范围变大且附带眩晕",
		maxLv = 1,
		type = 1,
		id = 700009335,
		extra_param = "",
		param = {}
	},
	[700009336] = {
		description = "二技能跳起时在空中可以移动，且落地伤害范围更大",
		maxLv = 1,
		type = 1,
		id = 700009336,
		extra_param = "",
		param = {}
	},
	[700009337] = {
		description = "普通攻击附带剑气，造成额外伤害",
		maxLv = 1,
		type = 1,
		id = 700009337,
		extra_param = "",
		param = {}
	},
	[700009338] = {
		description = "通过三技能积蓄怒气，积攒满怒气后进入暴走模式",
		maxLv = 1,
		type = 1,
		id = 700009338,
		extra_param = "",
		param = {}
	},
	[700009339] = {
		description = "战斗开始后每秒减少2%生命值，同时攻击力上升10%，对朗香造成一定伤害后会完全恢复生命值，并且攻击力上升10%效果改为会心率上升20%，30秒后会重新添加此效果。",
		maxLv = 10,
		type = 1,
		id = 700009339,
		extra_param = "",
		param = {}
	},
	[700009340] = {
		description = "技能二「晨曦谢幕曲」、技能三「拂晓狂想曲」命中后额外获得10点怒气，技能命中瞬间伤害提高60%。",
		maxLv = 1,
		type = 1,
		id = 700009340,
		extra_param = "",
		param = {}
	},
	[700009341] = {
		description = "攻击命中时产生协同攻击，该效果每1秒最多触发一次。",
		maxLv = 1,
		type = 1,
		id = 700009341,
		extra_param = "",
		param = {}
	},
	[700009342] = {
		description = "出场时，获得100%的「辉音」。 处于「朝晖」状态时，施放特殊普通攻击命中瞬间会心伤害提高50%。",
		maxLv = 1,
		type = 1,
		id = 700009342,
		extra_param = "",
		param = {}
	},
	[700009343] = {
		description = "施放技能二「晨曦谢幕曲」、技能三「拂晓狂想曲」时会聚集附近敌人。",
		maxLv = 1,
		type = 1,
		id = 700009343,
		extra_param = "",
		param = {}
	},
	[700009344] = {
		description = "怒气获得率提高25%，每次击败敌人后，会获得10点怒气。",
		maxLv = 1,
		type = 1,
		id = 700009344,
		extra_param = "",
		param = {}
	},
	[700009345] = {
		description = "技能一「黎明四重奏」每次命中时对敌人附加破甲状态，防御力降低10%，持续20秒，最多可叠加4层。",
		maxLv = 1,
		type = 1,
		id = 700009345,
		extra_param = "",
		param = {}
	},
	[700009346] = {
		description = "技能三「拂晓交响曲」的冷却时间改变为3秒。\n施放技能三「拂晓交响曲」会消耗全部怒气，每消耗8点怒气，额外触发1次箭雨攻击。",
		maxLv = 1,
		type = 1,
		id = 700009346,
		extra_param = "",
		param = {}
	},
	[700009347] = {
		description = "处于「朝晖」状态时，特殊普通攻击每次命中后会恢复「辉音」点数。",
		maxLv = 1,
		type = 1,
		id = 700009347,
		extra_param = "",
		param = {}
	},
	[700009348] = {
		description = "处于「朝晖」状态时，每当首次释放特殊普通攻击时，会进入零时空间，持续4秒。",
		maxLv = 1,
		type = 1,
		id = 700009348,
		extra_param = "",
		param = {}
	},
	[700009349] = {
		description = "处于「朝晖」状态时，攻速大幅提高。",
		maxLv = 1,
		type = 1,
		id = 700009349,
		extra_param = "",
		param = {}
	},
	[700009481] = {
		description = "生命值提高{1}",
		maxLv = 3,
		type = 1,
		id = 700009481,
		extra_param = "",
		param = {
			{
				10,
				10,
				false,
				"%"
			}
		}
	},
	[700009482] = {
		description = "攻击力提高{1}",
		maxLv = 3,
		type = 1,
		id = 700009482,
		extra_param = "",
		param = {
			{
				7,
				7,
				false,
				"%"
			}
		}
	},
	[700009483] = {
		description = "会心伤害提高{1}",
		maxLv = 3,
		type = 1,
		id = 700009483,
		extra_param = "",
		param = {
			{
				10,
				10,
				false,
				"%"
			}
		}
	},
	[700009484] = {
		description = "印记型修正者伤害提高{1}",
		maxLv = 3,
		type = 1,
		id = 700009484,
		extra_param = "",
		param = {
			{
				10,
				10,
				false,
				"%"
			}
		}
	},
	[700009485] = {
		description = "神能型修正者伤害提高{1}",
		maxLv = 3,
		type = 1,
		id = 700009485,
		extra_param = "",
		param = {
			{
				10,
				10,
				false,
				"%"
			}
		}
	},
	[700009486] = {
		description = "会心率提高{1}",
		maxLv = 3,
		type = 1,
		id = 700009486,
		extra_param = "",
		param = {
			{
				12,
				12,
				false,
				"%"
			}
		}
	},
	[700009487] = {
		description = "怒气型修正者伤害提高{1}",
		maxLv = 3,
		type = 1,
		id = 700009487,
		extra_param = "",
		param = {
			{
				10,
				10,
				false,
				"%"
			}
		}
	},
	[700009488] = {
		description = "移动速度提高{1}",
		maxLv = 3,
		type = 1,
		id = 700009488,
		extra_param = "",
		param = {
			{
				2,
				2,
				false,
				"%"
			}
		}
	},
	[700009491] = {
		description = "全队伍奥义伤害提高{1}，技能冷却时间缩短{2}",
		maxLv = 3,
		type = 1,
		id = 700009491,
		extra_param = "",
		param = {
			{
				40,
				40,
				false,
				"%"
			},
			{
				6,
				6,
				false,
				"%"
			}
		}
	},
	[700009492] = {
		description = "全队伍增幅范围提高，增幅效果延长{1}秒",
		maxLv = 3,
		type = 1,
		id = 700009492,
		extra_param = "",
		param = {
			{
				3,
				2,
				false,
				""
			}
		}
	},
	[700009493] = {
		description = "首次进入准备阶段时，额外获得{1}点强化点数",
		maxLv = 3,
		type = 1,
		id = 700009493,
		extra_param = "",
		param = {
			{
				60,
				60,
				false,
				""
			}
		}
	},
	[700009501] = {
		description = "镰骸的防御力提高100%\n<color=#E9E346><光强化></color>光属性普通攻击命中时，被命中的敌人防御力降低2%，最多可叠加60层",
		maxLv = 1,
		type = 1,
		id = 700009501,
		extra_param = "",
		param = {}
	},
	[700009502] = {
		description = "<color=#ff3000><挑战模拟></color>敌人命中主控修正者时，主控修正者每秒损失2%的生命值，持续10秒；期间敌人的伤害提高25%",
		maxLv = 1,
		type = 1,
		id = 700009502,
		extra_param = "",
		param = {}
	},
	[700009503] = {
		description = "精英敌人造成的伤害提高25%\n<color=#A835D4><雷强化></color>修正者的雷属性技能命中时，恢复自身2%的生命值",
		maxLv = 1,
		type = 1,
		id = 700009503,
		extra_param = "",
		param = {}
	},
	[700009504] = {
		description = "<color=#ff3000><挑战模拟></color>敌人命中主控修正者时，恢复自身5%的生命值",
		maxLv = 1,
		type = 1,
		id = 700009504,
		extra_param = "",
		param = {}
	},
	[700009505] = {
		description = "普通敌人造成的伤害提高25%\n<color=#4EE4CE><冰强化></color>冰属性技能命中冰冻状态下的敌人时，冰冻效果延长0.5秒，单次冰冻最多延长2秒",
		maxLv = 1,
		type = 1,
		id = 700009505,
		extra_param = "",
		param = {}
	},
	[700009506] = {
		description = "第一波普通敌人的武装获得强化",
		maxLv = 1,
		type = 1,
		id = 700009506,
		extra_param = "",
		param = {}
	},
	[700009507] = {
		description = "第二波普通敌人的武装获得强化",
		maxLv = 1,
		type = 1,
		id = 700009507,
		extra_param = "",
		param = {}
	},
	[700009508] = {
		description = "<color=#ff3000><挑战模拟></color>合体智械生产小型智械的速度提高100%",
		maxLv = 1,
		type = 1,
		id = 700009508,
		extra_param = "",
		param = {}
	},
	[700009509] = {
		description = "普通敌人造成的伤害提高25%\n<color=#8E6DE7><暗强化></color>敌人受到的暗属性伤害提高15%",
		maxLv = 1,
		type = 1,
		id = 700009509,
		extra_param = "",
		param = {}
	},
	[700009510] = {
		description = "<color=#ff3000><挑战模拟></color>命中主控修正者后，敌人造成的伤害提高25%，持续20秒；最多可叠加4层",
		maxLv = 1,
		type = 1,
		id = 700009510,
		extra_param = "",
		param = {}
	},
	[700009511] = {
		description = "精英敌人造成的伤害提高25%\n<color=#88E682><风强化></color>敌人受到的风属性伤害提高15%",
		maxLv = 1,
		type = 1,
		id = 700009511,
		extra_param = "",
		param = {}
	},
	[700009512] = {
		description = "<color=#ff3000><挑战模拟></color>精英敌人爆发出全部潜能，造成的伤害提高25%，攻击速度得到一定程度的提升",
		maxLv = 1,
		type = 1,
		id = 700009512,
		extra_param = "",
		param = {}
	},
	[700009513] = {
		description = "精英敌人的生命值上限提高25%\n<color=#F3751A><火强化></color>敌人受到的火属性伤害提高15%",
		maxLv = 1,
		type = 1,
		id = 700009513,
		extra_param = "",
		param = {}
	},
	[700009514] = {
		description = "<color=#ff3000><挑战模拟></color>精英敌人的生命值低于25%时获得“霸体”状态，移动速度提高100%，造成的伤害提高100%\n其防御力降低100%，每秒钟损失0.5%的生命值",
		maxLv = 1,
		type = 1,
		id = 700009514,
		extra_param = "",
		param = {}
	},
	[700009515] = {
		description = "精英敌人的生命值上限提高25%\n<color=#8E6DE7><暗强化></color>敌人受到的暗属性伤害提高15%",
		maxLv = 1,
		type = 1,
		id = 700009515,
		extra_param = "",
		param = {}
	},
	[700009516] = {
		description = "<color=#ff3000><挑战模拟></color>精英敌人的生命值低于25%时，获得一个生命值上限25%的护盾",
		maxLv = 1,
		type = 1,
		id = 700009516,
		extra_param = "",
		param = {}
	},
	[700009517] = {
		description = "普通敌人的生命值上限提高25%\n<color=#F3751A><火强化></color>敌人受到的火属性伤害提高15%",
		maxLv = 1,
		type = 1,
		id = 700009517,
		extra_param = "",
		param = {}
	},
	[700009518] = {
		description = "普通敌人生命值上限提高25%\n<color=#A835D4><雷强化></color>修正者的雷属性技能命中时，恢复自身2%的生命值",
		maxLv = 1,
		type = 1,
		id = 700009518,
		extra_param = "",
		param = {}
	},
	[700009519] = {
		description = "普通敌人的防御力提高75%\n<color=#A835D4><雷强化></color>敌人受到的雷属性伤害提高15%",
		maxLv = 1,
		type = 1,
		id = 700009519,
		extra_param = "",
		param = {}
	},
	[700009520] = {
		description = "<color=#ff3000><挑战模拟></color>精英敌人攻击命中主控修正者后，使目标眩晕，持续2秒",
		maxLv = 1,
		type = 1,
		id = 700009520,
		extra_param = "",
		param = {}
	},
	[700009521] = {
		description = "普通敌人的防御力提高150%\n<color=#EC5858><物理强化></color>敌人受到的物理属性伤害提高15%",
		maxLv = 1,
		type = 1,
		id = 700009521,
		extra_param = "",
		param = {}
	},
	[700009540] = {
		description = "奥利海姆的防御力提高225%\n处于零时空间时，移除此防御力加成，全队的会心率提高20%",
		maxLv = 1,
		type = 1,
		id = 700009540,
		extra_param = "",
		param = {}
	},
	[700009541] = {
		description = "零一的防御力提高225%\n处于零时空间时，移除此防御力加成，全队的会心率提高20%",
		maxLv = 1,
		type = 1,
		id = 700009541,
		extra_param = "",
		param = {}
	},
	[700009542] = {
		description = "<color=#ff7300><复杂模拟></color>零一的生命值上限提高50%",
		maxLv = 1,
		type = 1,
		id = 700009542,
		extra_param = "",
		param = {}
	},
	[700009543] = {
		description = "<color=#ff7300><复杂模拟></color>奥利海姆的生命值上限提高50%",
		maxLv = 1,
		type = 1,
		id = 700009543,
		extra_param = "",
		param = {}
	},
	[700009544] = {
		description = "<color=#ff3000><挑战模拟></color>奥利海姆攻击命中主控修正者会使目标减速，移动速度降低20%，持续5秒\n奥利海姆攻击时会快速衔接下一段攻击",
		maxLv = 1,
		type = 1,
		id = 700009544,
		extra_param = "",
		param = {}
	},
	[700009545] = {
		description = "<color=#ff3000><挑战模拟></color>零一获得“霸体”状态；造成的伤害提高50%",
		maxLv = 1,
		type = 1,
		id = 700009545,
		extra_param = "",
		param = {}
	},
	[700009546] = {
		description = "净化者的防御力提高225%\n<color=#8E6DE7><暗强化></color>「暗蚀」状态下的敌人受到的暗属性伤害提高15%",
		maxLv = 1,
		type = 1,
		id = 700009546,
		extra_param = "",
		param = {}
	},
	[700009547] = {
		description = "圣洁者的防御力提高225%\n<color=#8E6DE7><暗强化></color>「暗蚀」状态下的敌人命中修正者后，提高修正者50%的移动速度，持续3秒",
		maxLv = 1,
		type = 1,
		id = 700009547,
		extra_param = "",
		param = {}
	},
	[700009548] = {
		description = "<color=#ff7300><复杂模拟></color>净化者的生命值上限提高50%",
		maxLv = 1,
		type = 1,
		id = 700009548,
		extra_param = "",
		param = {}
	},
	[700009549] = {
		description = "<color=#ff7300><复杂模拟></color>圣洁者的生命值上限提高50%",
		maxLv = 1,
		type = 1,
		id = 700009549,
		extra_param = "",
		param = {}
	},
	[700009550] = {
		description = "<color=#ff3000><挑战模拟></color>净化者造成的伤害提高50%，且攻击变得更加凌厉",
		maxLv = 1,
		type = 1,
		id = 700009550,
		extra_param = "",
		param = {}
	},
	[700009551] = {
		description = "<color=#ff3000><挑战模拟></color>圣洁者受到火、雷、风属性的伤害减少75%",
		maxLv = 1,
		type = 1,
		id = 700009551,
		extra_param = "",
		param = {}
	},
	[700009552] = {
		description = "兵部卿的防御力提高225%\n<color=#A835D4><雷强化></color>敌人受到的雷属性伤害提高15%",
		maxLv = 1,
		type = 1,
		id = 700009552,
		extra_param = "",
		param = {}
	},
	[700009553] = {
		description = "画师的防御力提高225%\n<color=#A835D4><雷强化></color>修正者的雷属性技能命中时，恢复自身2%的生命值",
		maxLv = 1,
		type = 1,
		id = 700009553,
		extra_param = "",
		param = {}
	},
	[700009554] = {
		description = "<color=#ff7300><复杂模拟></color>兵部卿的生命值上限提高50%",
		maxLv = 1,
		type = 1,
		id = 700009554,
		extra_param = "",
		param = {}
	},
	[700009555] = {
		description = "<color=#ff7300><复杂模拟></color>画师的生命值上限提高50%",
		maxLv = 1,
		type = 1,
		id = 700009555,
		extra_param = "",
		param = {}
	},
	[700009556] = {
		description = "<color=#ff3000><挑战模拟></color>兵部卿造成的伤害提高50%，命中主控修正者后，使目标眩晕，持续2秒",
		maxLv = 1,
		type = 1,
		id = 700009556,
		extra_param = "",
		param = {}
	},
	[700009557] = {
		description = "<color=#ff3000><挑战模拟></color>画师获得“霸体”状态，受到攻击时，其修正值会快速下降",
		maxLv = 1,
		type = 1,
		id = 700009557,
		extra_param = "",
		param = {}
	},
	[700009558] = {
		description = "黑英的防御力提高225%\n<color=#F3751A><火强化></color>敌人受到的火属性伤害提高15%",
		maxLv = 1,
		type = 1,
		id = 700009558,
		extra_param = "",
		param = {}
	},
	[700009559] = {
		description = "幻骸的防御力提高225%\n<color=#F3751A><火强化></color>附加的灼烧状态最多可以叠加三层，叠加时刷新持续时间",
		maxLv = 1,
		type = 1,
		id = 700009559,
		extra_param = "",
		param = {}
	},
	[700009560] = {
		description = "<color=#ff7300><复杂模拟></color>黑英的生命值上限提高50%",
		maxLv = 1,
		type = 1,
		id = 700009560,
		extra_param = "",
		param = {}
	},
	[700009561] = {
		description = "<color=#ff7300><复杂模拟></color>幻骸的生命值上限提高50%",
		maxLv = 1,
		type = 1,
		id = 700009561,
		extra_param = "",
		param = {}
	},
	[700009562] = {
		description = "<color=#ff3000><挑战模拟></color>黑英造成的伤害提高50%，并且其攻击更加凌冽",
		maxLv = 1,
		type = 1,
		id = 700009562,
		extra_param = "",
		param = {}
	},
	[700009563] = {
		description = "<color=#ff3000><挑战模拟></color>幻骸受到光、暗、冰属性的伤害减少75%",
		maxLv = 1,
		type = 1,
		id = 700009563,
		extra_param = "",
		param = {}
	},
	[700009564] = {
		description = "伊森的防御力提高25%\n<color=#88E682><风强化></color>敌人受到的风属性伤害提高15%",
		maxLv = 1,
		type = 1,
		id = 700009564,
		extra_param = "",
		param = {}
	},
	[700009565] = {
		description = "伊森的生命值上限提高25%\n<color=#88E682><风强化></color>修正者恢复生命值时，会心率会提高1%，持续5秒，最多叠加20层，叠加时刷新持续时间",
		maxLv = 1,
		type = 1,
		id = 700009565,
		extra_param = "",
		param = {}
	},
	[700009566] = {
		description = "伊森造成的伤害提高25%\n<color=#88E682><风强化></color>修正者造成风属性伤害时，闪避能量恢复速度提高50%，持续3秒",
		maxLv = 1,
		type = 1,
		id = 700009566,
		extra_param = "",
		param = {}
	},
	[700009567] = {
		description = "伊森的生命值上限提高25%",
		maxLv = 1,
		type = 1,
		id = 700009567,
		extra_param = "",
		param = {}
	},
	[700009568] = {
		description = "<color=#ff7300><复杂模拟></color>伊森造成的伤害提高25%\n命中主控修正者后会附加标记，持续15秒，在标记期间再次被伊森命中，本次伤害将会提高100%",
		maxLv = 1,
		type = 1,
		id = 700009568,
		extra_param = "",
		param = {}
	},
	[700009569] = {
		description = "<color=#ffc800><延时突破></color>开局后每过30秒，伊森的防御力就提高50%，最高提升至500%\n进入二阶段时该效果的加成会重置",
		maxLv = 1,
		type = 1,
		id = 700009569,
		extra_param = "",
		param = {}
	},
	[700009570] = {
		description = "库什尔方的防御力提高25%\n<color=#4EE4CE><冰强化></color>敌人受到的冰属性伤害提高15%",
		maxLv = 1,
		type = 1,
		id = 700009570,
		extra_param = "",
		param = {}
	},
	[700009571] = {
		description = "库什尔方的生命值上限提高25%\n<color=#4EE4CE><冰强化></color>命中处于冰冻状态下的敌人时，移动速度会提升50%，持续10秒",
		maxLv = 1,
		type = 1,
		id = 700009571,
		extra_param = "",
		param = {}
	},
	[700009572] = {
		description = "库什尔方造成的伤害提高25%\n<color=#4EE4CE><冰强化></color>冰冻延长2秒",
		maxLv = 1,
		type = 1,
		id = 700009572,
		extra_param = "",
		param = {}
	},
	[700009573] = {
		description = "库什尔方的生命值上限提高25%",
		maxLv = 1,
		type = 1,
		id = 700009573,
		extra_param = "",
		param = {}
	},
	[700009574] = {
		description = "<color=#ff7300><复杂模拟></color>库什尔方造成的伤害提高25%，移动速度提高25%",
		maxLv = 1,
		type = 1,
		id = 700009574,
		extra_param = "",
		param = {}
	},
	[700009575] = {
		description = "<color=#ffc800><延时突破></color>开局后60秒，库什尔方每3秒恢复自身最大生命1%的生命值，且造成的伤害提高25%",
		maxLv = 1,
		type = 1,
		id = 700009575,
		extra_param = "",
		param = {}
	},
	[700009576] = {
		description = "骸化暗金属的防御力提高25%\n<color=#EC5858><物理强化></color>敌人受到的物理属性伤害提高15%",
		maxLv = 1,
		type = 1,
		id = 700009576,
		extra_param = "",
		param = {}
	},
	[700009577] = {
		description = "骸化暗金属的生命值上限提高25%\n<color=#EC5858><物理强化></color>拥有5层「共振」时，攻击力额外提高15%",
		maxLv = 1,
		type = 1,
		id = 700009577,
		extra_param = "",
		param = {}
	},
	[700009578] = {
		description = "骸化暗金属造成的伤害提高25%\n<color=#EC5858><物理强化></color>每层「共振」提高5%的会心率",
		maxLv = 1,
		type = 1,
		id = 700009578,
		extra_param = "",
		param = {}
	},
	[700009579] = {
		description = "骸化暗金属的生命值上限提高25%",
		maxLv = 1,
		type = 1,
		id = 700009579,
		extra_param = "",
		param = {}
	},
	[700009580] = {
		description = "<color=#ff7300><复杂模拟></color>骸化暗金属造成的伤害提高25%\n命中主控修正者后降低修正值",
		maxLv = 1,
		type = 1,
		id = 700009580,
		extra_param = "",
		param = {}
	},
	[700009581] = {
		description = "<color=#ffc800><延时突破></color>开局后每过30秒，骸化暗金属的防御力就提高50%，最高提升至500%",
		maxLv = 1,
		type = 1,
		id = 700009581,
		extra_param = "",
		param = {}
	},
	[700009582] = {
		description = "哈加提的防御力提高25%\n<color=#E9E346><光强化></color>敌人受到的光属性伤害提高15%",
		maxLv = 1,
		type = 1,
		id = 700009582,
		extra_param = "",
		param = {}
	},
	[700009583] = {
		description = "哈加提的生命值上限提高25%\n<color=#E9E346><光强化></color>造成光属性伤害后，哈加提会额外增加修正值",
		maxLv = 1,
		type = 1,
		id = 700009583,
		extra_param = "",
		param = {}
	},
	[700009584] = {
		description = "哈加提造成的伤害提高25%\n<color=#004C99><修正空间增强></color>修正模式延长5秒",
		maxLv = 1,
		type = 1,
		id = 700009584,
		extra_param = "",
		param = {}
	},
	[700009585] = {
		description = "哈加提的生命值上限提高25%",
		maxLv = 1,
		type = 1,
		id = 700009585,
		extra_param = "",
		param = {}
	},
	[700009586] = {
		description = "<color=#ff7300><复杂模拟></color>哈加提造成的伤害提高25%，命中主控修正者后会恢复5%的生命值",
		maxLv = 1,
		type = 1,
		id = 700009586,
		extra_param = "",
		param = {}
	},
	[700009587] = {
		description = "<color=#ffc800><延时突破></color>开局后60秒，哈加提受到的伤害降低40%",
		maxLv = 1,
		type = 1,
		id = 700009587,
		extra_param = "",
		param = {}
	},
	[700009588] = {
		description = "雅典娜的防御力提高25%\n<color=#00B7E4><水强化></color>敌人受到的水属性伤害提高15%",
		maxLv = 1,
		type = 1,
		id = 700009588,
		extra_param = "",
		param = {}
	},
	[700009589] = {
		description = "雅典娜的最大生命值提高25%\n<color=#FF6666><零时空间增强></color>零时空间内全队修正者的会心率提升40%",
		maxLv = 1,
		type = 1,
		id = 700009589,
		extra_param = "",
		param = {}
	},
	[700009590] = {
		description = "雅典娜造成的伤害提高25%\n<color=#FF6666><零时空间增强></color>修正者闪避效果触发的零时空间持续时间延长1秒",
		maxLv = 1,
		type = 1,
		id = 700009590,
		extra_param = "",
		param = {}
	},
	[700009591] = {
		description = "雅典娜的生命值上限提高25%",
		maxLv = 1,
		type = 1,
		id = 700009591,
		extra_param = "",
		param = {}
	},
	[700009592] = {
		description = "<color=#ff7300><复杂模拟></color>雅典娜造成的伤害提高25%，命中主控修正者后，使目标眩晕，持续2秒",
		maxLv = 1,
		type = 1,
		id = 700009592,
		extra_param = "",
		param = {}
	},
	[700009593] = {
		description = "<color=#ffc800><延时突破></color>开局后60秒，雅典娜会持续降低自身修正值",
		maxLv = 1,
		type = 1,
		id = 700009593,
		extra_param = "",
		param = {}
	},
	[700009601] = {
		description = "<color=#ffbb00><生存增强></color>塞壬的生命值上限提高25%，防御力提高75%",
		maxLv = 1,
		type = 1,
		id = 700009601,
		extra_param = "",
		param = {}
	},
	[700009602] = {
		description = "<color=#ffbb00><进攻增强></color>塞壬造成的伤害提高50%；攻击命中主控修正者后附加灼烧，造成持续伤害",
		maxLv = 1,
		type = 1,
		id = 700009602,
		extra_param = "",
		param = {}
	},
	[700009603] = {
		description = "<color=#ff3000><挑战模拟></color>塞壬或塞壬之翼攻击命中主控修正者后，免疫来自队友的伤害，持续5秒",
		maxLv = 1,
		type = 1,
		id = 700009603,
		extra_param = "",
		param = {}
	},
	[700009604] = {
		description = "<color=#ffbb00><生存增强></color>拉冬的生命值上限提高25%，进入二阶段时获得护盾",
		maxLv = 1,
		type = 1,
		id = 700009604,
		extra_param = "",
		param = {}
	},
	[700009605] = {
		description = "<color=#ffbb00><进攻增强></color>拉冬造成的伤害提高50%；对受到护盾保护的修正者造成的伤害额外提高100%",
		maxLv = 1,
		type = 1,
		id = 700009605,
		extra_param = "",
		param = {}
	},
	[700009606] = {
		description = "<color=#ff3000><挑战模拟></color>拉冬的修正值随着时间流逝不断降低",
		maxLv = 1,
		type = 1,
		id = 700009606,
		extra_param = "",
		param = {}
	},
	[700009607] = {
		description = "<color=#ffbb00><生存增强></color>乌尔德的生命值上限提高25%，命中主控修正者后恢复自身生命值",
		maxLv = 1,
		type = 1,
		id = 700009607,
		extra_param = "",
		param = {}
	},
	[700009608] = {
		description = "<color=#ffbb00><进攻增强></color>乌尔德造成的伤害提高50%，命中主控修正者后此效果会提高75%，持续5秒",
		maxLv = 1,
		type = 1,
		id = 700009608,
		extra_param = "",
		param = {}
	},
	[700009609] = {
		description = "<color=#ff3000><挑战模拟></color>乌尔德命中主控修正者后获得护盾",
		maxLv = 1,
		type = 1,
		id = 700009609,
		extra_param = "",
		param = {}
	},
	[700009610] = {
		description = "<color=#ffbb00><生存增强></color>明塔和琉刻的生命值上限提高25%，命中主控修正者后暂时提升自身防御力",
		maxLv = 1,
		type = 1,
		id = 700009610,
		extra_param = "",
		param = {}
	},
	[700009611] = {
		description = "<color=#ffbb00><进攻增强></color>明塔和琉刻造成的伤害提高50%，攻击命中主控修正者后附加受创，造成持续伤害",
		maxLv = 1,
		type = 1,
		id = 700009611,
		extra_param = "",
		param = {}
	},
	[700009612] = {
		description = "<color=#ff3000><挑战模拟></color>击败一名敌人后，另外一名敌人恢复全部生命值，造成的伤害提高75%",
		maxLv = 1,
		type = 1,
		id = 700009612,
		extra_param = "",
		param = {}
	},
	[700009613] = {
		description = "<color=#ffbb00><生存增强></color>比弗隆斯的生命值上限提高25%，大眼球出场时获得护盾",
		maxLv = 1,
		type = 1,
		id = 700009613,
		extra_param = "",
		param = {}
	},
	[700009614] = {
		description = "<color=#ffbb00><进攻增强></color>比弗隆斯造成的伤害提高50%；若未及时消灭大眼球，比弗隆斯造成的伤害额外提高75%",
		maxLv = 1,
		type = 1,
		id = 700009614,
		extra_param = "",
		param = {}
	},
	[700009615] = {
		description = "<color=#ff3000><挑战模拟></color>比弗隆斯的生命值低于20%时，对主控修正者造成的伤害提高300%",
		maxLv = 1,
		type = 1,
		id = 700009615,
		extra_param = "",
		param = {}
	},
	[700009616] = {
		description = "<color=#ffbb00><生存增强></color>远吕知的生命值上限提高50%",
		maxLv = 1,
		type = 1,
		id = 700009616,
		extra_param = "",
		param = {}
	},
	[700009617] = {
		description = "<color=#ffbb00><进攻增强></color>远吕知造成的伤害提高50%，命中主控修正者后此效果暂时提高75%，持续5秒",
		maxLv = 1,
		type = 1,
		id = 700009617,
		extra_param = "",
		param = {}
	},
	[700009618] = {
		description = "<color=#ff3000><挑战模拟></color>距离远吕知一定距离的修正者攻击力降低100%",
		maxLv = 1,
		type = 1,
		id = 700009618,
		extra_param = "",
		param = {}
	},
	[700009619] = {
		description = "<color=#ffbb00><生存增强></color>歌姬的生命值上限提高25%，鲸鱼的生命值上限提高100%",
		maxLv = 1,
		type = 1,
		id = 700009619,
		extra_param = "",
		param = {}
	},
	[700009620] = {
		description = "<color=#ffbb00><进攻增强></color>歌姬造成的伤害提高50%，命中主控修正者后此效果暂时提高75%，持续5秒",
		maxLv = 1,
		type = 1,
		id = 700009620,
		extra_param = "",
		param = {}
	},
	[700009621] = {
		description = "<color=#ff3000><挑战模拟></color>敌人攻击命中主控修正者，当前闪避值减少60%",
		maxLv = 1,
		type = 1,
		id = 700009621,
		extra_param = "",
		param = {}
	},
	[700009622] = {
		description = "<color=#ffbb00><生存增强></color>哈法斯的生命值上限提高25%，命中主控修正者后降低自身修正值",
		maxLv = 1,
		type = 1,
		id = 700009622,
		extra_param = "",
		param = {}
	},
	[700009623] = {
		description = "<color=#ffbb00><进攻增强></color>哈法斯造成的伤害提高50%，命中主控修正者后眩晕其3秒，此效果每10秒最多触发一次",
		maxLv = 1,
		type = 1,
		id = 700009623,
		extra_param = "",
		param = {}
	},
	[700009624] = {
		description = "<color=#ff3000><挑战模拟></color>哈法斯免疫非会心伤害",
		maxLv = 1,
		type = 1,
		id = 700009624,
		extra_param = "",
		param = {}
	},
	[700009625] = {
		description = "<color=#ffbb00><生存增强></color>战骸的生命值上限提高25%，获得“霸体”状态",
		maxLv = 1,
		type = 1,
		id = 700009625,
		extra_param = "",
		param = {}
	},
	[700009626] = {
		description = "<color=#ffbb00><进攻增强></color>战骸造成的伤害提高50%，命中主控修正者后此效果会提高75%，持续5秒",
		maxLv = 1,
		type = 1,
		id = 700009626,
		extra_param = "",
		param = {}
	},
	[700009627] = {
		description = "<color=#ff3000><挑战模拟></color>战骸命中主控修正者后，造成的伤害提高15%，可以叠加",
		maxLv = 1,
		type = 1,
		id = 700009627,
		extra_param = "",
		param = {}
	},
	[700009628] = {
		description = "<color=#ffbb00><生存增强></color>净化者的生命值上限提高25%，防御力提高75%",
		maxLv = 1,
		type = 1,
		id = 700009628,
		extra_param = "",
		param = {}
	},
	[700009629] = {
		description = "<color=#ffbb00><进攻增强></color>净化者造成的伤害提高50%，命中主控修正者后此效果会提高75%，持续5秒",
		maxLv = 1,
		type = 1,
		id = 700009629,
		extra_param = "",
		param = {}
	},
	[700009630] = {
		description = "<color=#ff3000><挑战模拟></color>净化者命中主控修正者后回复5%生命值",
		maxLv = 1,
		type = 1,
		id = 700009630,
		extra_param = "",
		param = {}
	},
	[700009631] = {
		description = "<color=#ffbb00><生存增强></color>弥诺陶洛斯的生命值上限提高25%，命中主控修正者后恢复生命值",
		maxLv = 1,
		type = 1,
		id = 700009631,
		extra_param = "",
		param = {}
	},
	[700009632] = {
		description = "<color=#ffbb00><进攻增强></color>弥诺陶洛斯造成的伤害提高50%，命中主控修正者后此效果会提高75%，持续5秒",
		maxLv = 1,
		type = 1,
		id = 700009632,
		extra_param = "",
		param = {}
	},
	[700009633] = {
		description = "<color=#ff3000><挑战模拟></color>弥诺陶洛斯免疫非会心伤害",
		maxLv = 1,
		type = 1,
		id = 700009633,
		extra_param = "",
		param = {}
	},
	[700009634] = {
		description = "<color=#ffbb00><生存增强></color>自律机甲的生命值上限提高25%，获得一个生命值上限25%的护盾",
		maxLv = 1,
		type = 1,
		id = 700009634,
		extra_param = "",
		param = {}
	},
	[700009635] = {
		description = "<color=#ffbb00><进攻增强></color>自律机甲造成的伤害提高50%，命中主控修正者后眩晕其3秒，此效果每10秒最多触发一次",
		maxLv = 1,
		type = 1,
		id = 700009635,
		extra_param = "",
		param = {}
	},
	[700009636] = {
		description = "<color=#ff3000><挑战模拟></color>自律机甲的修正值随着时间流逝不断降低",
		maxLv = 1,
		type = 1,
		id = 700009636,
		extra_param = "",
		param = {}
	},
	[700009637] = {
		description = "<color=#ffbb00><生存增强></color>苍梅的生命值上限提高25%，获得一个生命值上限25%的护盾",
		maxLv = 1,
		type = 1,
		id = 700009637,
		extra_param = "",
		param = {}
	},
	[700009638] = {
		description = "<color=#ffbb00><进攻增强></color>苍梅造成的伤害提高50%，命中主控修正者后此效果会提高75%，持续5秒",
		maxLv = 1,
		type = 1,
		id = 700009638,
		extra_param = "",
		param = {}
	},
	[700009639] = {
		description = "<color=#ff3000><挑战模拟></color>苍梅命中主控修正者，当前闪避值减少60%",
		maxLv = 1,
		type = 1,
		id = 700009639,
		extra_param = "",
		param = {}
	},
	[700009640] = {
		description = "<color=#ffbb00><生存增强></color>蹈火者的生命值上限提高25%，获得“霸体”状态",
		maxLv = 1,
		type = 1,
		id = 700009640,
		extra_param = "",
		param = {}
	},
	[700009641] = {
		description = "<color=#ffbb00><进攻增强></color>蹈火者造成的伤害提高50%，命中主控修正者后此效果会提高75%，持续5秒",
		maxLv = 1,
		type = 1,
		id = 700009641,
		extra_param = "",
		param = {}
	},
	[700009642] = {
		description = "<color=#ff3000><挑战模拟></color>蹈火者召唤大量的狂信徒协助战斗",
		maxLv = 1,
		type = 1,
		id = 700009642,
		extra_param = "",
		param = {}
	},
	[700009681] = {
		description = "我方移动速度提高25%",
		maxLv = 1,
		type = 1,
		id = 700009681,
		extra_param = "",
		param = {}
	},
	[700009682] = {
		description = "我方每3秒恢复1%的生命值",
		maxLv = 1,
		type = 1,
		id = 700009682,
		extra_param = "",
		param = {}
	},
	[700009683] = {
		description = "我方闪避值上限提高20%",
		maxLv = 1,
		type = 1,
		id = 700009683,
		extra_param = "",
		param = {}
	},
	[700009684] = {
		description = "队友造成的非会心伤害提高25%",
		maxLv = 1,
		type = 1,
		id = 700009684,
		extra_param = "",
		param = {}
	},
	[700009685] = {
		description = "我方防御力提高25%",
		maxLv = 1,
		type = 1,
		id = 700009685,
		extra_param = "",
		param = {}
	},
	[700009686] = {
		description = "主控修正者触发的零时空间时间延长1秒",
		maxLv = 1,
		type = 1,
		id = 700009686,
		extra_param = "",
		param = {}
	},
	[700009701] = {
		description = "普通敌人的生命值上限提高25%",
		maxLv = 1,
		type = 1,
		id = 700009701,
		extra_param = "",
		param = {}
	},
	[700009702] = {
		description = "<color=#ff7300><复杂模拟></color>普通敌人的生命值上限提高50%",
		maxLv = 1,
		type = 1,
		id = 700009702,
		extra_param = "",
		param = {}
	},
	[700009703] = {
		description = "普通敌人造成的伤害提高25%",
		maxLv = 1,
		type = 1,
		id = 700009703,
		extra_param = "",
		param = {}
	},
	[700009704] = {
		description = "<color=#ff7300><复杂模拟></color>普通敌人造成的伤害提高50%",
		maxLv = 1,
		type = 1,
		id = 700009704,
		extra_param = "",
		param = {}
	},
	[700009705] = {
		description = "普通敌人的防御力提高75%",
		maxLv = 1,
		type = 1,
		id = 700009705,
		extra_param = "",
		param = {}
	},
	[700009706] = {
		description = "<color=#ff7300><复杂模拟></color>普通敌人的防御力提高150%",
		maxLv = 1,
		type = 1,
		id = 700009706,
		extra_param = "",
		param = {}
	},
	[700009707] = {
		description = "精英敌人的生命值上限提高25%",
		maxLv = 1,
		type = 1,
		id = 700009707,
		extra_param = "",
		param = {}
	},
	[700009708] = {
		description = "<color=#ff7300><复杂模拟></color>精英敌人的生命值上限提高50%",
		maxLv = 1,
		type = 1,
		id = 700009708,
		extra_param = "",
		param = {}
	},
	[700009709] = {
		description = "精英敌人造成的伤害提高25%",
		maxLv = 1,
		type = 1,
		id = 700009709,
		extra_param = "",
		param = {}
	},
	[700009710] = {
		description = "<color=#ff7300><复杂模拟></color>精英敌人造成的伤害提高50%",
		maxLv = 1,
		type = 1,
		id = 700009710,
		extra_param = "",
		param = {}
	},
	[700009711] = {
		description = "精英敌人的防御力提高75%",
		maxLv = 1,
		type = 1,
		id = 700009711,
		extra_param = "",
		param = {}
	},
	[700009712] = {
		description = "<color=#ff7300><复杂模拟></color>精英敌人的防御力提高150%",
		maxLv = 1,
		type = 1,
		id = 700009712,
		extra_param = "",
		param = {}
	},
	[700009713] = {
		description = "<color=#EC5858><物理强化></color>\n修正者物理普通攻击或技能命中时，获得1层「共振」，攻击力提高3%，持续5秒，最多可叠加5层\n拥有5层「共振」时，受到的伤害降低20%",
		maxLv = 1,
		type = 1,
		id = 700009713,
		extra_param = "",
		param = {}
	},
	[700009714] = {
		description = "<color=#88E682><风强化></color>\n风属性技能命中后，攻击力提高20%，每秒恢复自身1%的生命值，持续5秒",
		maxLv = 1,
		type = 1,
		id = 700009714,
		extra_param = "",
		param = {}
	},
	[700009715] = {
		description = "<color=#F3751A><火强化></color>\n火属性普通攻击，技能或奥义命中敌人后，附加灼烧状态，每秒造成200%攻击力的火属性伤害，持续5秒",
		maxLv = 1,
		type = 1,
		id = 700009715,
		extra_param = "",
		param = {}
	},
	[700009716] = {
		description = "<color=#A835D4><雷强化></color>\n雷属性技能命中时，对命中的敌人造成1000%攻击力的伤害，该效果对每个敌人每5秒最多触发一次",
		maxLv = 1,
		type = 1,
		id = 700009716,
		extra_param = "",
		param = {}
	},
	[700009717] = {
		description = "<color=#8E6DE7><暗强化></color>\n暗属性技能命中的敌人获得「暗蚀」状态，其造成的伤害降低30%，持续5秒",
		maxLv = 1,
		type = 1,
		id = 700009717,
		extra_param = "",
		param = {}
	},
	[700009718] = {
		description = "<color=#E9E346><光强化></color>\n处于修正模式时，敌人受到的光属性伤害提高50%",
		maxLv = 1,
		type = 1,
		id = 700009718,
		extra_param = "",
		param = {}
	},
	[700009719] = {
		description = "<color=#4EE4CE><冰强化></color>\n敌人处于冰冻状态下时，防御力降低100%",
		maxLv = 1,
		type = 1,
		id = 700009719,
		extra_param = "",
		param = {}
	},
	[700009720] = {
		description = "<color=#00B7E4><水强化></color>\n处于零时空间时，敌人受到的水属性伤害提高30%",
		maxLv = 1,
		type = 1,
		id = 700009720,
		extra_param = "",
		param = {}
	},
	[700009721] = {
		description = "<color=#ff3000><挑战模拟></color>所有敌人获得“霸体”状态",
		maxLv = 1,
		type = 1,
		id = 700009721,
		extra_param = "",
		param = {}
	},
	[700009741] = {
		description = "队友造成的伤害降低25%\n<color=#EC5858><物理强化></color>敌方单位的物理属性抗性降低25%",
		maxLv = 1,
		type = 1,
		id = 700009741,
		extra_param = "",
		param = {}
	},
	[700009742] = {
		description = "队友造成的伤害降低25%\n<color=#88E682><风强化></color>敌方单位的风属性抗性降低25%",
		maxLv = 1,
		type = 1,
		id = 700009742,
		extra_param = "",
		param = {}
	},
	[700009743] = {
		description = "队友造成的伤害降低25%\n<color=#F3751A><火强化></color>敌方单位的火属性抗性降低25%",
		maxLv = 1,
		type = 1,
		id = 700009743,
		extra_param = "",
		param = {}
	},
	[700009744] = {
		description = "队友造成的伤害降低25%\n<color=#A835D4><雷强化></color>敌方单位的雷属性抗性降低25%",
		maxLv = 1,
		type = 1,
		id = 700009744,
		extra_param = "",
		param = {}
	},
	[700009745] = {
		description = "队友造成的伤害降低25%\n<color=#8E6DE7><暗强化></color>敌方单位的暗属性抗性降低25%",
		maxLv = 1,
		type = 1,
		id = 700009745,
		extra_param = "",
		param = {}
	},
	[700009746] = {
		description = "队友造成的伤害降低25%\n<color=#E9E346><光强化></color>敌方单位的光属性抗性降低25%",
		maxLv = 1,
		type = 1,
		id = 700009746,
		extra_param = "",
		param = {}
	},
	[700009747] = {
		description = "队友造成的伤害降低25%\n<color=#4EE4CE><冰强化></color>敌方单位的冰属性抗性降低25%",
		maxLv = 1,
		type = 1,
		id = 700009747,
		extra_param = "",
		param = {}
	},
	[700009748] = {
		description = "队友造成的伤害降低25%\n<color=#00B7E4><水强化></color>敌方单位的水属性抗性降低25%",
		maxLv = 1,
		type = 1,
		id = 700009748,
		extra_param = "",
		param = {}
	},
	[700009749] = {
		description = "<color=#F4D03F>第8波开始</color>：\n每1波敌人物理以外的属性抗性提高7.5%，最高90%",
		maxLv = 1,
		type = 1,
		id = 700009749,
		extra_param = "",
		param = {}
	},
	[700009750] = {
		description = "<color=#F4D03F>第8波开始</color>：\n每1波敌人光以外的属性抗性提高\n7.5%，最高90%",
		maxLv = 1,
		type = 1,
		id = 700009750,
		extra_param = "",
		param = {}
	},
	[700009751] = {
		description = "<color=#F4D03F>第8波开始</color>：\n每1波敌人暗以外的属性抗性提高\n7.5%，最高90%",
		maxLv = 1,
		type = 1,
		id = 700009751,
		extra_param = "",
		param = {}
	},
	[700009752] = {
		description = "<color=#F4D03F>第8波开始</color>：\n每1波敌人水以外的属性抗性提高\n7.5%，最高90%",
		maxLv = 1,
		type = 1,
		id = 700009752,
		extra_param = "",
		param = {}
	},
	[700009753] = {
		description = "<color=#F4D03F>第8波开始</color>：\n每1波敌人冰以外的属性抗性提高\n7.5%，最高90%",
		maxLv = 1,
		type = 1,
		id = 700009753,
		extra_param = "",
		param = {}
	},
	[700009754] = {
		description = "<color=#F4D03F>第8波开始</color>：\n每1波敌人火以外的属性抗性提高\n7.5%，最高90%",
		maxLv = 1,
		type = 1,
		id = 700009754,
		extra_param = "",
		param = {}
	},
	[700009755] = {
		description = "<color=#F4D03F>第8波开始</color>：\n每1波敌人风以外的属性抗性提高\n7.5%，最高90%",
		maxLv = 1,
		type = 1,
		id = 700009755,
		extra_param = "",
		param = {}
	},
	[700009756] = {
		description = "<color=#F4D03F>第8波开始</color>：\n每1波敌人雷以外的属性抗性提高\n7.5%，最高90%",
		maxLv = 1,
		type = 1,
		id = 700009756,
		extra_param = "",
		param = {}
	},
	[700009757] = {
		description = "天垣修正者造成的伤害提高35%",
		maxLv = 1,
		type = 1,
		id = 700009757,
		extra_param = "",
		param = {}
	},
	[700009758] = {
		description = "来自环境的侵蚀，修正者每秒流失生命值",
		maxLv = 101,
		type = 1,
		id = 700009758,
		extra_param = "",
		param = {}
	},
	[700009759] = {
		description = "闪避能量回复速度提高",
		maxLv = 1,
		type = 1,
		id = 700009759,
		extra_param = "",
		param = {}
	},
	[700009760] = {
		description = "「朝约」「旧誓」切换后短暂时间内造成的伤害提高",
		maxLv = 1,
		type = 1,
		id = 700009760,
		extra_param = "",
		param = {}
	},
	[700009761] = {
		description = "「朝约」「旧誓」切换后短暂时间内造成的伤害大幅提高",
		maxLv = 1,
		type = 1,
		id = 700009761,
		extra_param = "",
		param = {}
	},
	[700009762] = {
		description = "获得减伤",
		maxLv = 1,
		type = 1,
		id = 700009762,
		extra_param = "",
		param = {}
	},
	[700009763] = {
		description = "「朝约」「黯耀」切换后短暂时间内增加会心率",
		maxLv = 1,
		type = 1,
		id = 700009763,
		extra_param = "",
		param = {}
	},
	[700009764] = {
		description = "「朝约」「黯耀」切换后短暂时间内增加大量会心率",
		maxLv = 1,
		type = 1,
		id = 700009764,
		extra_param = "",
		param = {}
	},
	[700009765] = {
		description = "造成的伤害提高",
		maxLv = 1,
		type = 1,
		id = 700009765,
		extra_param = "",
		param = {}
	},
	[700009766] = {
		description = "「旧誓」「黯耀」切换后修正系数暂时提高",
		maxLv = 1,
		type = 1,
		id = 700009766,
		extra_param = "",
		param = {}
	},
	[700009767] = {
		description = "「旧誓」「黯耀」切换后修正系数暂时大幅提高",
		maxLv = 1,
		type = 1,
		id = 700009767,
		extra_param = "",
		param = {}
	},
	[700009768] = {
		description = "权钥开放",
		maxLv = 1,
		type = 1,
		id = 700009768,
		extra_param = "",
		param = {}
	},
	[700009769] = {
		description = "权钥开放",
		maxLv = 1,
		type = 1,
		id = 700009769,
		extra_param = "",
		param = {}
	},
	[700009770] = {
		description = "权钥开放",
		maxLv = 1,
		type = 1,
		id = 700009770,
		extra_param = "",
		param = {}
	},
	[700009801] = {
		description = "梦境模拟中的敌人「<color=#2ECC71>生命</color>」系数得到了增强",
		maxLv = 1,
		type = 1,
		id = 700009801,
		extra_param = "",
		param = {}
	},
	[700009802] = {
		description = "梦境模拟中的敌人「<color=#CB4335>伤害</color>」系数得到了增强",
		maxLv = 1,
		type = 1,
		id = 700009802,
		extra_param = "",
		param = {}
	},
	[700009803] = {
		description = "开局进入二阶段，同时提高生命值和攻击力",
		maxLv = 1,
		type = 1,
		id = 700009803,
		extra_param = "",
		param = {}
	},
	[700009804] = {
		description = "命中主控修正者后造成的伤害提高75%，持续5秒",
		maxLv = 1,
		type = 1,
		id = 700009804,
		extra_param = "",
		param = {}
	},
	[700009805] = {
		description = "主控修正者，被导弹命中后减速50%，持续5秒",
		maxLv = 1,
		type = 1,
		id = 700009805,
		extra_param = "",
		param = {}
	},
	[700009806] = {
		description = "鲸鱼的防御力提高",
		maxLv = 1,
		type = 1,
		id = 700009806,
		extra_param = "",
		param = {}
	},
	[700009807] = {
		description = "转阶段时会出现左卫门督和右卫门督",
		maxLv = 1,
		type = 1,
		id = 700009807,
		extra_param = "",
		param = {}
	},
	[700009808] = {
		description = "大眼变得更大更强了！",
		maxLv = 1,
		type = 1,
		id = 700009808,
		extra_param = "",
		param = {}
	},
	[700009809] = {
		description = "命中主控修正者后造成的伤害提高75%，持续5秒",
		maxLv = 1,
		type = 1,
		id = 700009809,
		extra_param = "",
		param = {}
	},
	[700009810] = {
		description = "开局进入二阶段，同时提高生命值和攻击力",
		maxLv = 1,
		type = 1,
		id = 700009810,
		extra_param = "",
		param = {}
	},
	[700009811] = {
		description = "造成的伤害提高50%",
		maxLv = 1,
		type = 1,
		id = 700009811,
		extra_param = "",
		param = {}
	},
	[700009812] = {
		description = "命中主控修正者后，暂时提高防御力并恢复一定的生命值",
		maxLv = 1,
		type = 1,
		id = 700009812,
		extra_param = "",
		param = {}
	},
	[700009813] = {
		description = "暗金属被骸化侵蚀，防御力得到了较大提升",
		maxLv = 1,
		type = 1,
		id = 700009813,
		extra_param = "",
		param = {}
	},
	[700009814] = {
		description = "哈加提生命值降低至50%时，石英会加入战斗",
		maxLv = 1,
		type = 1,
		id = 700009814,
		extra_param = "",
		param = {}
	},
	[700009815] = {
		description = "角色获得了强化",
		maxLv = 1,
		type = 1,
		id = 700009815,
		extra_param = "",
		param = {}
	},
	[700009816] = {
		description = "角色获得了强化",
		maxLv = 1,
		type = 1,
		id = 700009816,
		extra_param = "",
		param = {}
	},
	[700009817] = {
		description = "角色获得了强化",
		maxLv = 1,
		type = 1,
		id = 700009817,
		extra_param = "",
		param = {}
	},
	[700009818] = {
		description = "角色获得了强化",
		maxLv = 1,
		type = 1,
		id = 700009818,
		extra_param = "",
		param = {}
	},
	[700009819] = {
		description = "角色获得了强化",
		maxLv = 1,
		type = 1,
		id = 700009819,
		extra_param = "",
		param = {}
	},
	[700009820] = {
		description = "角色获得了强化",
		maxLv = 1,
		type = 1,
		id = 700009820,
		extra_param = "",
		param = {}
	},
	[700009821] = {
		description = "角色获得了强化",
		maxLv = 1,
		type = 1,
		id = 700009821,
		extra_param = "",
		param = {}
	},
	[700009822] = {
		description = "角色获得了强化",
		maxLv = 1,
		type = 1,
		id = 700009822,
		extra_param = "",
		param = {}
	},
	[700009823] = {
		description = "角色获得了强化",
		maxLv = 1,
		type = 1,
		id = 700009823,
		extra_param = "",
		param = {}
	},
	[700009824] = {
		description = "角色获得了强化",
		maxLv = 1,
		type = 1,
		id = 700009824,
		extra_param = "",
		param = {}
	},
	[700009825] = {
		description = "角色获得了强化",
		maxLv = 1,
		type = 1,
		id = 700009825,
		extra_param = "",
		param = {}
	},
	[700009826] = {
		description = "角色获得了强化",
		maxLv = 1,
		type = 1,
		id = 700009826,
		extra_param = "",
		param = {}
	},
	[700009831] = {
		description = "造成伤害提高25%",
		maxLv = 1,
		type = 1,
		id = 700009831,
		extra_param = "",
		param = {}
	},
	[700009832] = {
		description = "普通攻击命中生成次数盾，每段命中计1次，最多累计5次",
		maxLv = 1,
		type = 1,
		id = 700009832,
		extra_param = "",
		param = {}
	},
	[700009833] = {
		description = "会心时修正系数提高，修正模式中造成伤害提高100%",
		maxLv = 1,
		type = 1,
		id = 700009833,
		extra_param = "",
		param = {}
	},
	[700009834] = {
		description = "怒气值高于50时，命中敌人有概率回复生命值",
		maxLv = 1,
		type = 1,
		id = 700009834,
		extra_param = "",
		param = {}
	},
	[700009835] = {
		description = "命中有50%概率造成200%伤害",
		maxLv = 1,
		type = 1,
		id = 700009835,
		extra_param = "",
		param = {}
	},
	[700009836] = {
		description = "修正空间外每15秒回复4%生命值",
		maxLv = 1,
		type = 1,
		id = 700009836,
		extra_param = "",
		param = {}
	},
	[700009837] = {
		description = "连续命中暂时自身会心率",
		maxLv = 1,
		type = 1,
		id = 700009837,
		extra_param = "",
		param = {}
	},
	[700009838] = {
		description = "普通攻击的怒气获得率提高",
		maxLv = 1,
		type = 1,
		id = 700009838,
		extra_param = "",
		param = {}
	},
	[700009839] = {
		description = "普通攻击命中时，技能三的剩余冷却时间缩短",
		maxLv = 1,
		type = 1,
		id = 700009839,
		extra_param = "",
		param = {}
	},
	[700009840] = {
		description = "普通攻击伤害提高，普通攻击的速度大幅提高",
		maxLv = 1,
		type = 1,
		id = 700009840,
		extra_param = "",
		param = {}
	},
	[700009841] = {
		description = "每次普通攻击时，恢复自身生命值",
		maxLv = 1,
		type = 1,
		id = 700009841,
		extra_param = "",
		param = {}
	},
	[700009842] = {
		description = "怒气高于50点时，获得免疫伤害效果，受击时，消耗15点怒气，该效果每秒最多触发一次",
		maxLv = 1,
		type = 1,
		id = 700009842,
		extra_param = "",
		param = {}
	},
	[700009843] = {
		description = "处于修正模式时，每秒恢复自身生命值",
		maxLv = 1,
		type = 1,
		id = 700009843,
		extra_param = "",
		param = {}
	},
	[700009844] = {
		description = "受到伤害时，敌人的修正值增加",
		maxLv = 1,
		type = 1,
		id = 700009844,
		extra_param = "",
		param = {}
	},
	[700009845] = {
		description = "处于修正模式时，每秒获得100点怒气",
		maxLv = 1,
		type = 1,
		id = 700009845,
		extra_param = "",
		param = {}
	},
	[700009846] = {
		description = "普通攻击命中时，敌人的修正值增加",
		maxLv = 1,
		type = 1,
		id = 700009846,
		extra_param = "",
		param = {}
	},
	[700009851] = {
		description = "蓄力技能伤害提高",
		maxLv = 3,
		type = 1,
		id = 700009851,
		extra_param = "",
		param = {}
	},
	[700009852] = {
		description = "受到的伤害降低",
		maxLv = 3,
		type = 1,
		id = 700009852,
		extra_param = "",
		param = {}
	},
	[700009853] = {
		description = "怒气获得率提高",
		maxLv = 3,
		type = 1,
		id = 700009853,
		extra_param = "",
		param = {}
	},
	[700009854] = {
		description = "修正系数提高",
		maxLv = 3,
		type = 1,
		id = 700009854,
		extra_param = "",
		param = {}
	},
	[700009901] = {
		description = "<color=#F3751A><火强化></color>敌人受到的火属性伤害提高50%，火属性以外的属性抗性提高30%",
		maxLv = 1,
		type = 1,
		id = 700009901,
		extra_param = "",
		param = {}
	},
	[700009902] = {
		description = "<color=#ffbb00><生存增强></color>敌人的生命值上限提高75%\n距离骸化暗金属一定距离外的修正者攻击力降低100%，一定距离内火属性伤害提高50%",
		maxLv = 1,
		type = 1,
		id = 700009902,
		extra_param = "",
		param = {}
	},
	[700009903] = {
		description = "<color=#ffbb00><进攻增强></color>敌人对主控修正者造成的伤害直接提高75%\n地图中出现额外补给可供拾取",
		maxLv = 1,
		type = 1,
		id = 700009903,
		extra_param = "",
		param = {}
	},
	[700009904] = {
		description = "<color=#ff3000><挑战模拟></color>骸化暗金属不再进入修正模式和零时空间\n修正者普通攻击伤害提高100%",
		maxLv = 1,
		type = 1,
		id = 700009904,
		extra_param = "",
		param = {}
	},
	[700009905] = {
		description = "<color=#E9E346><光强化></color>敌人受到的光属性伤害提高50%，光属性以外的属性抗性提高30%",
		maxLv = 1,
		type = 1,
		id = 700009905,
		extra_param = "",
		param = {}
	},
	[700009906] = {
		description = "<color=#ffbb00><生存增强></color>敌人的生命值上限提高50%\n敌人的生命值低于40%时，生成一个最大生命值50%的护盾，该效果最多触发一次",
		maxLv = 1,
		type = 1,
		id = 700009906,
		extra_param = "",
		param = {}
	},
	[700009907] = {
		description = "<color=#ffbb00><进攻增强></color>暗金属命中主控修正者后短暂激活「对决时间」\n「对决时间」中敌人对没有霸体效果的主控修正者造成的伤害直接提高150%，主控修正者的伤害直接提高50%",
		maxLv = 1,
		type = 1,
		id = 700009907,
		extra_param = "",
		param = {}
	},
	[700009908] = {
		description = "<color=#ff3000><挑战模拟></color>不处于修正模式和零时空间时，暗金属免疫非会心伤害\n暗金属零时空间中受到的伤害直接提高50%",
		maxLv = 1,
		type = 1,
		id = 700009908,
		extra_param = "",
		param = {}
	},
	[700009909] = {
		description = "<color=#88E682><风强化></color>敌人受到的风属性伤害提高50%，风属性以外的属性抗性提高30%",
		maxLv = 1,
		type = 1,
		id = 700009909,
		extra_param = "",
		param = {}
	},
	[700009910] = {
		description = "<color=#ffbb00><生存增强></color>敌人的生命值上限提高100%\n修正者蓄力技能伤害提高150%",
		maxLv = 1,
		type = 1,
		id = 700009910,
		extra_param = "",
		param = {}
	},
	[700009911] = {
		description = "<color=#ffbb00><进攻增强></color>敌人对主控修正者造成的伤害直接提高75%，对拥有霸体效果的主控修正者造成的伤害直接降低50%",
		maxLv = 1,
		type = 1,
		id = 700009911,
		extra_param = "",
		param = {}
	},
	[700009912] = {
		description = "<color=#ff3000><挑战模拟></color>库什尔方攻击命中主控修正者后，每秒对主控修正者造成伤害，持续至本场战斗结束",
		maxLv = 1,
		type = 1,
		id = 700009912,
		extra_param = "",
		param = {}
	},
	[700009913] = {
		description = "<color=#EC5858><物理强化></color>敌人受到的物理属性伤害提高50%，物理以外的属性抗性提高30%",
		maxLv = 1,
		type = 1,
		id = 700009913,
		extra_param = "",
		param = {}
	},
	[700009914] = {
		description = "<color=#ffbb00><生存增强></color>敌人的生命值上限提高100%\n敌人在破甲状态下，受到的物理属性伤害提高75%",
		maxLv = 1,
		type = 1,
		id = 700009914,
		extra_param = "",
		param = {}
	},
	[700009915] = {
		description = "<color=#ffbb00><进攻增强></color>敌人对主控修正者造成的伤害直接提高75%，敌人被附加眩晕状态后移除该效果10秒，期间主控修正者造成的伤害直接提高50%",
		maxLv = 1,
		type = 1,
		id = 700009915,
		extra_param = "",
		param = {}
	},
	[700009916] = {
		description = "<color=#ff3000><挑战模拟></color>敌人的生命值上限提高50%，免疫非会心伤害\n主控修正者拥有5层「共振」时，伤害直接提高25%",
		maxLv = 1,
		type = 1,
		id = 700009916,
		extra_param = "",
		param = {}
	},
	[700009917] = {
		description = "<color=#00B7E4><水强化></color>敌人受到的水属性伤害提高50%，水属性以外的属性抗性提高30%",
		maxLv = 1,
		type = 1,
		id = 700009917,
		extra_param = "",
		param = {}
	},
	[700009918] = {
		description = "<color=#ffbb00><生存增强></color>敌人的生命值上限提高150%\n处于零时空间时，敌人受到的水属性伤害提高75%",
		maxLv = 1,
		type = 1,
		id = 700009918,
		extra_param = "",
		param = {}
	},
	[700009919] = {
		description = "<color=#ffbb00><进攻增强></color>敌人对主控修正者造成的伤害直接提高75%\n处于零时空间时，敌人受到的会心伤害直接提高50%",
		maxLv = 1,
		type = 1,
		id = 700009919,
		extra_param = "",
		param = {}
	},
	[700009920] = {
		description = "<color=#ff3000><挑战模拟></color>雅典娜进入二阶段时，会召唤铃兰团护卫队进入战场",
		maxLv = 1,
		type = 1,
		id = 700009920,
		extra_param = "",
		param = {}
	},
	[700009921] = {
		description = "<color=#ffbb00><生存增强></color>敌人的生命值上限提高100%",
		maxLv = 1,
		type = 1,
		id = 700009921,
		extra_param = "",
		param = {}
	},
	[700009922] = {
		description = "<color=#ffbb00><进攻增强></color>敌人对主控修正者造成的伤害直接提高75%",
		maxLv = 1,
		type = 1,
		id = 700009922,
		extra_param = "",
		param = {}
	},
	[700009923] = {
		description = "<color=#ff3000><挑战模拟></color>库什尔方攻击命中主控修正者后，每秒对主控修正者造成伤害，持续至本场战斗结束",
		maxLv = 1,
		type = 1,
		id = 700009923,
		extra_param = "",
		param = {}
	},
	[700009924] = {
		description = "<color=#A835D4><雷强化></color>敌人受到的雷属性伤害提高50%，雷属性以外的属性抗性提高30%",
		maxLv = 1,
		type = 1,
		id = 700009924,
		extra_param = "",
		param = {}
	},
	[700009925] = {
		description = "<color=#ffbb00><生存增强></color>敌人的生命值上限提高150%\n处于零时空间时，敌人受到的雷属性伤害提高75%",
		maxLv = 1,
		type = 1,
		id = 700009925,
		extra_param = "",
		param = {}
	},
	[700009926] = {
		description = "<color=#ffbb00><进攻增强></color>敌人对主控修正者造成的伤害直接提高75%\n处于零时空间时，敌人受到的会心伤害直接提高50%",
		maxLv = 1,
		type = 1,
		id = 700009926,
		extra_param = "",
		param = {}
	},
	[700009927] = {
		description = "<color=#ff3000><挑战模拟></color>敌人命中主控修正者后，回复自身血量",
		maxLv = 1,
		type = 1,
		id = 700009927,
		extra_param = "",
		param = {}
	},
	[700009928] = {
		description = "<color=#EC5858><物理强化></color>敌人受到的物理属性伤害提高50%，物理以外的属性抗性提高30%",
		maxLv = 1,
		type = 1,
		id = 700009928,
		extra_param = "",
		param = {}
	},
	[700009929] = {
		description = "<color=#ffbb00><生存增强></color>敌人的生命值上限提高150%\n处于修正空间时，敌人受到的物理属性伤害提高75%",
		maxLv = 1,
		type = 1,
		id = 700009929,
		extra_param = "",
		param = {}
	},
	[700009930] = {
		description = "零时空间外造成的伤害降低25%",
		maxLv = 1,
		type = 1,
		id = 700009930,
		extra_param = "",
		param = {}
	},
	[700009931] = {
		description = "敌人命中主控修正者后施加一个存在15秒的标记，命中标记会爆炸，额外造成75%的伤害",
		maxLv = 1,
		type = 1,
		id = 700009931,
		extra_param = "",
		param = {}
	},
	[700009932] = {
		description = "敌人命中主控修正者后，获得最大生命值10%的护盾，单局内最多生效5次",
		maxLv = 1,
		type = 1,
		id = 700009932,
		extra_param = "",
		param = {}
	},
	[700009933] = {
		description = "<color=#28B463><生存增强></color>敌人最大生命值提升{1}",
		maxLv = 2,
		type = 1,
		id = 700009933,
		extra_param = "",
		param = {
			{
				30,
				120,
				false,
				"%"
			}
		}
	},
	[700009934] = {
		description = "<color=#F39C12><进攻增强></color>命中主控修正者后施加标记，命中标记会爆炸，额外造成{1}的伤害",
		maxLv = 2,
		type = 1,
		id = 700009934,
		extra_param = "",
		param = {
			{
				75,
				25,
				false,
				"%"
			}
		}
	},
	[700009935] = {
		description = "<color=#F39C12><进攻增强></color>敌人血量低于30%时被激怒，造成的伤害提升{1}",
		maxLv = 2,
		type = 1,
		id = 700009935,
		extra_param = "",
		param = {
			{
				30,
				50,
				false,
				"%"
			}
		}
	},
	[700009936] = {
		description = "<color=#CB4335><挑战强化></color>命中主控修正者后，获得最大生命值{1}的护盾。单局内最多生效5次",
		maxLv = 2,
		type = 1,
		id = 700009936,
		extra_param = "",
		param = {
			{
				6,
				4,
				false,
				"%"
			}
		}
	},
	[700009937] = {
		description = "<color=#CB4335><挑战强化></color>敌人在修正空间外，每6秒恢复{1}的最大血量",
		maxLv = 2,
		type = 1,
		id = 700009937,
		extra_param = "",
		param = {
			{
				1,
				0.5,
				false,
				"%"
			}
		}
	},
	[700009938] = {
		description = "<color=#CB4335><挑战强化></color>敌人在零时空间外，受到的伤害降低{1}",
		maxLv = 2,
		type = 1,
		id = 700009938,
		extra_param = "",
		param = {
			{
				30,
				20,
				false,
				"%"
			}
		}
	},
	[700009939] = {
		description = "物理以外的属性的最终伤害降低50%",
		maxLv = 1,
		type = 1,
		id = 700009939,
		extra_param = "",
		param = {}
	},
	[700009940] = {
		description = "冰以外的属性的最终伤害降低50%",
		maxLv = 1,
		type = 1,
		id = 700009940,
		extra_param = "",
		param = {}
	},
	[700009941] = {
		description = "火以外的属性的最终伤害降低50%",
		maxLv = 1,
		type = 1,
		id = 700009941,
		extra_param = "",
		param = {}
	},
	[700009942] = {
		description = "水以外的属性的最终伤害降低50%",
		maxLv = 1,
		type = 1,
		id = 700009942,
		extra_param = "",
		param = {}
	},
	[700009943] = {
		description = "暗以外的属性的最终伤害降低50%",
		maxLv = 1,
		type = 1,
		id = 700009943,
		extra_param = "",
		param = {}
	},
	[700009944] = {
		description = "光以外的属性的最终伤害降低50%",
		maxLv = 1,
		type = 1,
		id = 700009944,
		extra_param = "",
		param = {}
	},
	[700009945] = {
		description = "雷以外的属性的最终伤害降低50%",
		maxLv = 1,
		type = 1,
		id = 700009945,
		extra_param = "",
		param = {}
	},
	[700009946] = {
		description = "风以外的属性的最终伤害降低50%",
		maxLv = 1,
		type = 1,
		id = 700009946,
		extra_param = "",
		param = {}
	},
	[700009947] = {
		description = "敌人最大生命值提升{1}",
		maxLv = 5,
		type = 1,
		id = 700009947,
		extra_param = "",
		param = {
			{
				15,
				15,
				false,
				"%"
			}
		}
	},
	[700009948] = {
		description = "对主控修正者造成的伤害提高{1}",
		maxLv = 5,
		type = 1,
		id = 700009948,
		extra_param = "",
		param = {
			{
				6,
				6,
				false,
				"%"
			}
		}
	},
	[700070001] = {
		description = "该敌方单位在5米范围有如果有敌方单位存在则范围内所有单位防御力减少{1}",
		maxLv = 4,
		type = 1,
		id = 700070001,
		extra_param = "",
		param = {
			{
				30,
				30,
				false,
				"%"
			}
		}
	},
	[700070002] = {
		description = "该敌方单位被击败后，留下一颗3秒后引爆的炸弹，对爆炸范围内的所有单位造成目标最大生命值50%的伤害",
		maxLv = 1,
		type = 1,
		id = 700070002,
		extra_param = "",
		param = {}
	},
	[700070003] = {
		description = "战斗中，在随机一位敌方单位位置处召唤一道大范围落雷，命中的目标受到自身最大生命值{1}的雷属性伤害，并眩晕5秒",
		maxLv = 3,
		type = 1,
		id = 700070003,
		extra_param = "",
		param = {
			{
				30,
				10,
				false,
				"%"
			}
		}
	},
	[700070004] = {
		description = "该敌方单位受到致命伤害后，血量锁定为1点，之后免疫所有伤害",
		maxLv = 1,
		type = 1,
		id = 700070004,
		extra_param = "",
		param = {}
	},
	[700070005] = {
		description = "该敌方单位生命值低于30%时，造成的伤害提高{1}，并获得“霸体”状态，持续15秒，战斗中仅生效一次",
		maxLv = 3,
		type = 1,
		id = 700070005,
		extra_param = "",
		param = {
			{
				30,
				30,
				false,
				"%"
			}
		}
	},
	[700070101] = {
		description = "背击命中瞬间的伤害提高20%。施放技能三「猫神的愚弄」后3秒内，点击普通攻击也可以发动背击。背击：瞬移到敌人背后发动的攻击。",
		maxLv = 1,
		type = 1,
		id = 700070101,
		extra_param = "",
		param = {}
	},
	[700070102] = {
		description = "背击命中锁定的敌人后5秒内，当击败锁定的敌人时，重置技能的冷却时间，并且3秒内可以点击普通攻击发动背击；每击败敌人1次，背击命中瞬间的伤害提高1%，该效果可以叠加。",
		maxLv = 1,
		type = 1,
		id = 700070102,
		extra_param = "",
		param = {}
	},
	[700070103] = {
		description = "「神瞳凝视」状态的技能一「残月的奔袭」和技能二「夜灵的游猎」命中瞬间的伤害提高25%。",
		maxLv = 1,
		type = 1,
		id = 700070103,
		extra_param = "",
		param = {}
	},
	[700070104] = {
		description = "普通攻击和技能命中处于眩晕状态的敌人时，命中瞬间的会心伤害提高40%；普通攻击和技能命中处于暗属性抗性降低状态的敌人时，命中瞬间的暗属性伤害提高20%。",
		maxLv = 1,
		type = 1,
		id = 700070104,
		extra_param = "",
		param = {}
	},
	[700070105] = {
		description = "施放技能一「残月的奔袭」或技能二「夜灵的游猎」后，进入「神瞳凝视」状态。",
		maxLv = 1,
		type = 1,
		id = 700070105,
		extra_param = "",
		param = {}
	},
	[700070106] = {
		description = "技能一「眠羊游行」会朝两侧丢出额外的小羊。",
		maxLv = 1,
		type = 1,
		id = 700070106,
		extra_param = "",
		param = {}
	},
	[700070107] = {
		description = "处于技能二「绘梦领域」或「幽梦领域」内时，自身伤害提高30%。",
		maxLv = 1,
		type = 1,
		id = 700070107,
		extra_param = "",
		param = {}
	},
	[700070108] = {
		description = "禁锢的持续时间延长3秒，普通攻击和技能命中处于禁锢状态的敌人时，伤害提高{1}、技能的剩余冷却时间缩短0.3秒。",
		maxLv = 1,
		type = 1,
		id = 700070108,
		extra_param = "",
		param = {
			{
				20,
				0,
				false,
				"%"
			}
		}
	},
	[700070109] = {
		description = "奥义结束后重置技能一「眠羊游行」冷却时间,施放奥义后3秒内，施放技能不会消耗能量，并且技能一「眠羊游行」不会进入冷却状态。",
		maxLv = 1,
		type = 1,
		id = 700070109,
		extra_param = "",
		param = {}
	},
	[700070110] = {
		description = "技能三「梦幻泡影」持续蓄力期间，每间隔1.5秒朝自身一定范围内的敌人方向丢出小羊；技能三「梦幻泡影」命中时，根据丢出的小羊的数量每1只，命中瞬间的伤害提高10%，该效果最多计算99只小羊，技能三「梦幻泡影」命中后清空。",
		maxLv = 1,
		type = 1,
		id = 700070110,
		extra_param = "",
		param = {}
	},
	[700070111] = {
		description = "技能二「寒潮漩涡」独立伤害提高50%，施放过程中聚集敌人，技能持续时间增加。",
		maxLv = 1,
		type = 1,
		id = 700070111,
		extra_param = "",
		param = {}
	},
	[700070112] = {
		description = "技能二「寒潮漩涡」对命中的敌人附加冰冻状态，持续2秒，命中被技能一「永冻净土」技能二「寒潮漩涡」附加冰冻状态的敌人时，冰冻状态持续时间延长0.1秒。",
		maxLv = 1,
		type = 1,
		id = 700070112,
		extra_param = "",
		param = {}
	},
	[700070113] = {
		description = "技能三「极地猎袭」击败敌人时，刷新自身其他技能的剩余冷却时间，伤害提高3%，该效果可以叠加。",
		maxLv = 1,
		type = 1,
		id = 700070113,
		extra_param = "",
		param = {}
	},
	[700070114] = {
		description = "技能三「极地猎袭」命中处于控制抗性状态的敌人时，清除敌人的控制抗性，技能三「极地猎袭」命中时回复40怒气，技能一「永冻净土」可充能2次。",
		maxLv = 1,
		type = 1,
		id = 700070114,
		extra_param = "",
		param = {}
	},
	[700070115] = {
		description = "技能三「极地猎袭」命中处于冰冻状态的敌人时，独立伤害提高50%，重置该技能的冷却时间，获得50点怒气，技能三「极地猎袭」可充能2次。",
		maxLv = 1,
		type = 1,
		id = 700070115,
		extra_param = "",
		param = {}
	},
	[700070116] = {
		description = "处于「染火」状态时，普攻「绯狱舞炎」每次命中时会对敌人附加1层强化灼烧状态，持续20秒，该效果可以叠加。\n强化灼烧：立即附加50%攻击力的火属性伤害，之后每3秒再附加一次伤害，持续20秒。",
		maxLv = 1,
		type = 1,
		id = 700070116,
		extra_param = "",
		param = {}
	},
	[700070117] = {
		description = "「绯狱舞炎·改」命中处于灼烧状态的敌人时，会触发「绯狱舞炎·炎爆」，「绯狱舞炎·炎爆」命中敌人时立即结算敌人的强化灼烧状态的剩余伤害，每个敌人每十秒最多触发一次，但不会移除强化灼烧效果。",
		maxLv = 1,
		type = 1,
		id = 700070117,
		extra_param = "",
		param = {}
	},
	[700070118] = {
		description = "处于「染火」状态时，技能一「烬祸·牙突」、技能二「烬祸·焚涅」也会对命中的敌人附加3层强化灼烧状态，持续20秒，该效果可以叠加。\n强化灼烧：立即附加50%攻击力的火属性伤害，之后每3秒再附加一次伤害，持续20秒。",
		maxLv = 1,
		type = 1,
		id = 700070118,
		extra_param = "",
		param = {}
	},
	[700070119] = {
		description = "奥义命中时会结算目标强化灼烧的剩余伤害，此次伤害提升100%，不会移除强化灼烧效果，此次奥义每命中一个存在强化灼烧效果的敌人，奥义的剩余冷却时间缩短2秒。",
		maxLv = 1,
		type = 1,
		id = 700070119,
		extra_param = "",
		param = {
			{
				9999.999,
				0,
				false,
				""
			}
		}
	},
	[700070120] = {
		description = "处于「染火」状态时，自身独立伤害提高100%，「绯狱舞炎·改」每次命中时，技能的剩余冷却时间缩短0.5秒。",
		maxLv = 1,
		type = 1,
		id = 700070120,
		extra_param = "",
		param = {}
	},
	[700070121] = {
		description = "施放技能三「绯·散华」时，额外造成100%攻击力的物理属性伤害，该效果每1秒最多触发一次。",
		maxLv = 1,
		type = 1,
		id = 700070121,
		extra_param = "",
		param = {}
	},
	[700070122] = {
		description = "长按施放技能一「绯·缨白」、技能二「绯·云水」、技能二「绯·苍星」时获得1个印记，并施放一次技能三「绯·散华」，自身伤害提高15%，持续7秒。",
		maxLv = 1,
		type = 1,
		id = 700070122,
		extra_param = "",
		param = {}
	},
	[700070123] = {
		description = "技能三「绯·散华」独立伤害提高30%，命中时获得1个印记，该效果每3秒最多触发一次。",
		maxLv = 1,
		type = 1,
		id = 700070123,
		extra_param = "",
		param = {}
	},
	[700070124] = {
		description = "技能三「绯·散华」命中时自身其他技能的剩余冷却时间缩短1秒，该效果每3秒最多触发一次，施放时获得无敌效果，该效果每3秒最多触发一次。",
		maxLv = 1,
		type = 1,
		id = 700070124,
		extra_param = "",
		param = {}
	},
	[700070125] = {
		description = "普通攻击时长按可以施放技能三「绯·散华」，技能三「绯·散华」过程中长按并松开可以继续衔接技能三「绯·散华」。",
		maxLv = 1,
		type = 1,
		id = 700070125,
		extra_param = "",
		param = {}
	},
	[700070126] = {
		description = "技能一「高速突刺」或「飓风突刺」的技能伤害提高60%，命中时技能二「迅捷横斩」的剩余冷却时间缩短70%。",
		maxLv = 1,
		type = 1,
		id = 700070126,
		extra_param = "",
		param = {}
	},
	[700070127] = {
		description = "极限闪避时，伤害提高30%，持续5秒，重置技能一「高速突刺」或「飓风突刺」的冷却时间。",
		maxLv = 1,
		type = 1,
		id = 700070127,
		extra_param = "",
		param = {}
	},
	[700070128] = {
		description = "施放技能三「分光剑影」时聚集敌人，自身伤害提高30%，持续5秒。",
		maxLv = 1,
		type = 1,
		id = 700070128,
		extra_param = "",
		param = {}
	},
	[700070129] = {
		description = "施放强化技能一「破晓」或「启明」时，会触发一次技能三「逐光落影」，技能三「逐光落影」最后一段命中时，额外造成300%攻击力的物理属性伤害。",
		maxLv = 1,
		type = 1,
		id = 700070129,
		extra_param = "",
		param = {}
	},
	[700070130] = {
		description = "施放技能三「逐光落影」时获得70点神能，技能三「逐光落影」每消耗1点神能，自身伤害提高0.5%，持续{1}秒。",
		maxLv = 1,
		type = 1,
		id = 700070130,
		extra_param = "",
		param = {
			{
				5,
				0,
				false,
				""
			}
		}
	},
	[700070131] = {
		description = "「风神之柱」每命中1次，技能三「破势」或「破军」的独立伤害提高0.5%，该效果可以叠加。",
		maxLv = 1,
		type = 1,
		id = 700070131,
		extra_param = "",
		param = {}
	},
	[700070132] = {
		description = "普通攻击每次命中都会触发「风神之柱」，「风神之柱」每次命中，技能和奥义的剩余冷却时间缩短0.3秒。",
		maxLv = 1,
		type = 1,
		id = 700070132,
		extra_param = "",
		param = {}
	},
	[700070133] = {
		description = "技能二「涌动之风」命中时，对命中的敌人触发「风神之柱」。",
		maxLv = 1,
		type = 1,
		id = 700070133,
		extra_param = "",
		param = {}
	},
	[700070134] = {
		description = "技能三「破势」和「破军」的独立伤害提高30%，释放时会聚集敌人。",
		maxLv = 1,
		type = 1,
		id = 700070134,
		extra_param = "",
		param = {}
	},
	[700070135] = {
		description = "「风神之柱」的独立伤害提高20%，命中时获得1个印记，该效果每1秒最多触发一次。",
		maxLv = 1,
		type = 1,
		id = 700070135,
		extra_param = "",
		param = {}
	},
	[700070136] = {
		description = "技能一「雷殛·烈光」命中时，自身其他技能的剩余冷却时间缩短70%，获得50点怒气，该效果每1秒最多触发一次。",
		maxLv = 1,
		type = 1,
		id = 700070136,
		extra_param = "",
		param = {}
	},
	[700070137] = {
		description = "施放技能三「雷殛·荒天」第三式时会在前方聚集敌人，并回复30点怒气，施放后伤害提高20%，持续8秒。",
		maxLv = 1,
		type = 1,
		id = 700070137,
		extra_param = "",
		param = {}
	},
	[700070138] = {
		description = "技能一「雷殛·烈光」技能伤害提高60%，命中时触发落雷，造成500%攻击力的雷属性伤害，并将技能三「雷殛·荒天」替换为第三式。",
		maxLv = 1,
		type = 1,
		id = 700070138,
		extra_param = "",
		param = {}
	},
	[700070139] = {
		description = "极限闪避后会将技能三「雷殛·荒天」替换为第三式并回复100怒气。",
		maxLv = 1,
		type = 1,
		id = 700070139,
		extra_param = "",
		param = {}
	},
	[700070140] = {
		description = "清除「雷殛之印」时，伤害提高3%，最多可叠加8层；技能三「雷殛·荒天」第一式、第二式命中时会回复50点怒气并将「雷殛·荒天」替换为第三式。",
		maxLv = 1,
		type = 1,
		id = 700070140,
		extra_param = "",
		param = {
			{
				9999.999,
				0,
				false,
				""
			}
		}
	},
	[700070141] = {
		description = "技能一「战术爆弹」爆炸时会产生额外3次爆炸，并聚集敌人。",
		maxLv = 1,
		type = 1,
		id = 700070141,
		extra_param = "",
		param = {}
	},
	[700070142] = {
		description = "普通攻击命中时，技能一「战术爆弹」、技能二「连环准星」、奥义「贯穿狙击」的剩余冷却时间缩短1秒；施放技能和奥义后点击普通攻击会衔接第五段攻击。",
		maxLv = 1,
		type = 1,
		id = 700070142,
		extra_param = "",
		param = {}
	},
	[700070143] = {
		description = "技能二「连环准星」造成会心时，延长一轮射击；该技能伤害提高20%。",
		maxLv = 1,
		type = 1,
		id = 700070143,
		extra_param = "",
		param = {}
	},
	[700070144] = {
		description = "技能三「狙击模式」的技能伤害提高20%，开启技能三「狙击模式」时受到的伤害降低30%。",
		maxLv = 1,
		type = 1,
		id = 700070144,
		extra_param = "",
		param = {}
	},
	[700070145] = {
		description = "施放技能三「狙击模式」每次命中时，获得1个印记。",
		maxLv = 1,
		type = 1,
		id = 700070145,
		extra_param = "",
		param = {}
	},
	[700070146] = {
		description = "结印成功后，恢复25%的奥义值，奥义的剩余冷却时间缩短4秒。",
		maxLv = 1,
		type = 1,
		id = 700070146,
		extra_param = "",
		param = {}
	},
	[700070147] = {
		description = "奥义命中时，附加一次4000%的伤害。",
		maxLv = 1,
		type = 1,
		id = 700070147,
		extra_param = "",
		param = {}
	},
	[700070148] = {
		description = "「苦无时雨」：对命中的敌人触发一次手里剑袭击。\n「般若惊雷」：命中时附加一次100%的伤害。\n「镰鼬旋风」：命中时附加一次100%的伤害。\n「地爆界法」：对命中的敌人触发三次范围冲击，每次冲击会牵引周围敌人。",
		maxLv = 1,
		type = 1,
		id = 700070148,
		extra_param = "",
		param = {}
	},
	[700070149] = {
		description = "闪避必定触发闪避效果，触发闪避效果时恢复50%的奥义值，并重置技能一「天之持」和技能二「地之持」的冷却时间。",
		maxLv = 1,
		type = 1,
		id = 700070149,
		extra_param = "",
		param = {}
	},
	[700070150] = {
		description = "结印成功后3秒内，每次普通攻击命中时会触发一次手里剑袭击，手里剑攻击命中后技能一「天之持」和技能二「地之持」的剩余冷却时间缩短0.3秒。",
		maxLv = 1,
		type = 1,
		id = 700070150,
		extra_param = "",
		param = {}
	},
	[700070151] = {
		description = "施放技能二「地鸣爆弹」时，最多选择场上两个目标进行额外一次攻击。",
		maxLv = 1,
		type = 1,
		id = 700070151,
		extra_param = "",
		param = {}
	},
	[700070152] = {
		description = "施放技能时受到的伤害降低70%。",
		maxLv = 1,
		type = 1,
		id = 700070152,
		extra_param = "",
		param = {}
	},
	[700070153] = {
		description = "技能三「重装烈炎」每次攻击命中会获得6点神能。",
		maxLv = 1,
		type = 1,
		id = 700070153,
		extra_param = "",
		param = {}
	},
	[700070154] = {
		description = "蓄力施放技能一「炎弹之雨」、技能二「地鸣爆弹」时，会在前方聚集敌人，每次施放满蓄力技能后，自身火属性伤害提高20%，可叠加最多5次。",
		maxLv = 1,
		type = 1,
		id = 700070154,
		extra_param = "",
		param = {}
	},
	[700070155] = {
		description = "蓄力施放技能一「炎弹之雨」、技能二「地鸣爆弹」时，当自身神能高于30点时会消耗30点神能直接达到满蓄力状态，该效果每3秒最多触发一次。",
		maxLv = 1,
		type = 1,
		id = 700070155,
		extra_param = "",
		param = {}
	},
	[700070156] = {
		description = "普通攻击命中时，会召唤隐形无人机对目标进行攻击造成200%攻击力伤害，该效果每1秒最多触发一次。",
		maxLv = 1,
		type = 1,
		id = 700070156,
		extra_param = "",
		param = {}
	},
	[700070157] = {
		description = "会自动召唤无人机攻击敌人，该效果每3秒最多触发一次，队友同样可以触发。",
		maxLv = 1,
		type = 1,
		id = 700070157,
		extra_param = "",
		param = {}
	},
	[700070158] = {
		description = "技能一「定点打击」/「多轮轰炸」可充能两次，「多轮轰炸」对同一个敌人伤害不再衰减。",
		maxLv = 1,
		type = 1,
		id = 700070158,
		extra_param = "",
		param = {}
	},
	[700070159] = {
		description = "技能三「终焉脉冲」额外追加两道光束攻击，并且施放时免疫受到的伤害。",
		maxLv = 1,
		type = 1,
		id = 700070159,
		extra_param = "",
		param = {}
	},
	[700070160] = {
		description = "奥义「导弹连发」每次攻击命中时，附加400%攻击力的无视防御力的伤害；连携奥义附加3600%攻击力的无视防御力的伤害。",
		maxLv = 1,
		type = 1,
		id = 700070160,
		extra_param = "",
		param = {}
	},
	[700070161] = {
		description = "技能一「蛮勇追猎」技能伤害提高75%，获得硬直效果。",
		maxLv = 1,
		type = 1,
		id = 700070161,
		extra_param = "",
		param = {}
	},
	[700070162] = {
		description = "施放技能二「圣河咆哮」后每3秒对周围触发一次技能二「圣河咆哮」伤害，持续12秒。",
		maxLv = 1,
		type = 1,
		id = 700070162,
		extra_param = "",
		param = {}
	},
	[700070163] = {
		description = "技能三「撼流逐浪」技能伤害提高125%，对无法投掷的敌人额外提高25%。",
		maxLv = 1,
		type = 1,
		id = 700070163,
		extra_param = "",
		param = {}
	},
	[700070164] = {
		description = "技能三「撼流逐浪」会直接击败抓取的敌人，最后一段命中造成被击败敌人的50%当前生命值的无视防御力的伤害。",
		maxLv = 1,
		type = 1,
		id = 700070164,
		extra_param = "",
		param = {}
	},
	[700070165] = {
		description = "攻击命中后获得怒气，怒气越多自身受到的伤害降低越高，全元素伤害越高，该效果提供的受到的伤害降低最高30%，全元素伤害最高30%；击败敌人后重置技能的冷却时间。",
		maxLv = 1,
		type = 1,
		id = 700070165,
		extra_param = "",
		param = {}
	},
	[700070166] = {
		description = "极限闪避后可点击普通攻击衔接反击，反击命中时会追加一次技能三「冰刺重击」冰刺伤害",
		maxLv = 1,
		type = 1,
		id = 700070166,
		extra_param = "",
		param = {}
	},
	[700070167] = {
		description = "技能二「旋冰之弧」完美蓄力命中后，重置该技能的冷却时间。",
		maxLv = 1,
		type = 1,
		id = 700070167,
		extra_param = "",
		param = {}
	},
	[700070168] = {
		description = "技能一「冒失猛撞」可充能2次，命中处于冰冻状态的敌人时会附加破甲效果，防御力降低50%，持续6秒。",
		maxLv = 1,
		type = 1,
		id = 700070168,
		extra_param = "",
		param = {}
	},
	[700070169] = {
		description = "技能三「冰刺重击」会额外朝两侧发出冰刺，冰刺的全元素伤害伤害提高30%。",
		maxLv = 1,
		type = 1,
		id = 700070169,
		extra_param = "",
		param = {}
	},
	[700070170] = {
		description = "技能二「旋冰之弧」每次完美蓄力后，基础伤害提高20%，该效果可以叠加最多20次，不完美蓄力释放时清空。",
		maxLv = 1,
		type = 1,
		id = 700070170,
		extra_param = "",
		param = {}
	},
	[700070171] = {
		description = "施放技能一「圣炎俯冲」时会连续朝前方额外召唤两只天后。",
		maxLv = 1,
		type = 1,
		id = 700070171,
		extra_param = "",
		param = {}
	},
	[700070172] = {
		description = "施放技能一「圣炎俯冲」时会立即朝两侧额外召唤天后。",
		maxLv = 1,
		type = 1,
		id = 700070172,
		extra_param = "",
		param = {}
	},
	[700070173] = {
		description = "普通攻击最后一段命中时，会触发技能一「圣炎俯冲」攻击敌人。",
		maxLv = 1,
		type = 1,
		id = 700070173,
		extra_param = "",
		param = {}
	},
	[700070174] = {
		description = "「圣炎俯冲」召唤的天后飞行达到极限距离或消失时，会在原地触发一次「灼舞」。",
		maxLv = 1,
		type = 1,
		id = 700070174,
		extra_param = "",
		param = {}
	},
	[700070175] = {
		description = "触发闪避效果后，会触发技能一「圣炎俯冲」攻击攻击者。",
		maxLv = 1,
		type = 1,
		id = 700070175,
		extra_param = "",
		param = {}
	},
	[700070176] = {
		description = "场上每有一只兔兔三号，兔兔三号的伤害提高20%。",
		maxLv = 1,
		type = 1,
		id = 700070176,
		extra_param = "",
		param = {}
	},
	[700070177] = {
		description = "技能三「兔兔出击」会额外召唤一只兔兔三号。",
		maxLv = 1,
		type = 1,
		id = 700070177,
		extra_param = "",
		param = {}
	},
	[700070178] = {
		description = "每次施放技能二「兔兔加农」命中时，会召唤一只兔兔三号。",
		maxLv = 1,
		type = 1,
		id = 700070178,
		extra_param = "",
		param = {}
	},
	[700070179] = {
		description = "普通攻击最后一段命中时，会召唤一只兔兔三号。",
		maxLv = 1,
		type = 1,
		id = 700070179,
		extra_param = "",
		param = {}
	},
	[700070180] = {
		description = "自身触发闪避效果后，会召唤一只兔兔三号攻击敌人。",
		maxLv = 1,
		type = 1,
		id = 700070180,
		extra_param = "",
		param = {}
	},
	[700070181] = {
		description = "普通攻击第四段命中敌人后，获得<color=#FF9500>1</color>个印记。",
		maxLv = 1,
		type = 1,
		id = 700070181,
		extra_param = "",
		param = {}
	},
	[700070182] = {
		description = "每次进入「狂雷」状态时，技能剩余冷却时间缩短<color=#FF9500>20%</color>。",
		maxLv = 1,
		type = 1,
		id = 700070182,
		extra_param = "",
		param = {}
	},
	[700070183] = {
		description = "每次进入「狂雷」状态时，触发「托尔的雷击」。\n「托尔的雷击」：对锁定的目标造成<color=#FF9500>{1}</color>攻击力伤害；对命中的敌人附加<color=#E78300>1</color>层「劈中」，该效果每<color=#FF9500>0.5</color>秒最多触发一次。\n「劈中」：每层会为「托尔的雷击」提供命中瞬间伤害提高<color=#E78300>{2}</color>，持续<color=#E78300>{3}</color>秒，每次附加刷新持续时间，最多可叠加<color=#E78300>5</color>层。",
		maxLv = 1,
		type = 1,
		id = 700070183,
		extra_param = "",
		param = {
			{
				500,
				12.82,
				false,
				"%"
			},
			{
				20,
				20,
				false,
				"%"
			},
			{
				4,
				0,
				false,
				""
			}
		}
	},
	[700070184] = {
		description = "「雷势」<color=#FF9500>80</color>点及以上时，触发「托尔的雷击」，该效果每<color=#E78300>3</color>秒最多触发一次。\n「托尔的雷击」：对锁定的目标造成<color=#FF9500>{1}</color>攻击力伤害；对命中的敌人附加<color=#E78300>1</color>层「劈中」，该效果每<color=#FF9500>0.5</color>秒最多触发一次。\n「劈中」：每层会为「托尔的雷击」提供命中瞬间伤害提高<color=#E78300>{2}</color>，持续<color=#E78300>{3}</color>秒，每次附加刷新持续时间，最多可叠加<color=#E78300>5</color>层。",
		maxLv = 1,
		type = 1,
		id = 700070184,
		extra_param = "",
		param = {
			{
				500,
				12.82,
				false,
				"%"
			},
			{
				20,
				20,
				false,
				"%"
			},
			{
				4,
				0,
				false,
				""
			}
		}
	},
	[700070185] = {
		description = "极限闪避时，会对攻击者施加「托尔的禁锢」，之后每次施放的普通攻击、技能命中处于「托尔的禁锢」的敌人时，触发「托尔的雷击」。\n「托尔的禁锢」：附加禁锢状态，持续<color=#FF9500>{4}</color>秒。\n「托尔的雷击」：对锁定的目标造成<color=#FF9500>{1}</color>攻击力伤害；对命中的敌人附加<color=#E78300>1</color>层「劈中」，该效果每<color=#FF9500>0.5</color>秒最多触发一次。\n「劈中」：每层会为「托尔的雷击」提供命中瞬间伤害提高<color=#E78300>{2}</color>，持续<color=#E78300>{3}</color>秒，每次附加刷新持续时间，最多可叠加<color=#E78300>5</color>层。",
		maxLv = 1,
		type = 1,
		id = 700070185,
		extra_param = "",
		param = {
			{
				500,
				12.82,
				false,
				"%"
			},
			{
				20,
				20,
				false,
				"%"
			},
			{
				4,
				0,
				false,
				""
			},
			{
				6,
				0,
				false,
				""
			}
		}
	},
	[700070186] = {
		description = "施放强化的技能二「神怒·雷织」时，连点的额外踢击次数增加1次，期间受到的伤害降低60%，每段踢击攻击都会引动空气爆裂，额外造成40%攻击力的雷属性伤害。",
		maxLv = 1,
		type = 1,
		id = 700070186,
		extra_param = "",
		param = {}
	},
	[700070187] = {
		description = "施放强化的技能三「神怒·千雳」时，前半段可以连点增加5次额外攻击，期间获得硬直、受到的伤害降低60%；最后一段攻击命中会给自身施加生命值上限10%的护盾，持续12秒。\n至少施放一次额外攻击时，最后一段攻击可直接达到满蓄力状态。",
		maxLv = 1,
		type = 1,
		id = 700070187,
		extra_param = "",
		param = {}
	},
	[700070188] = {
		description = "施放强化的普通攻击第四段时，会额外召唤一道落雷轰击，对周围敌人造成500%攻击力的雷属性伤害，获得20点能量。",
		maxLv = 1,
		type = 1,
		id = 700070188,
		extra_param = "",
		param = {}
	},
	[700070189] = {
		description = "施放强化的技能一「神怒·踏鸣」后，会额外获得一次施放次数，并且会获得强化效果。",
		maxLv = 1,
		type = 1,
		id = 700070189,
		extra_param = "",
		param = {}
	},
	[700070190] = {
		description = "施放普通攻击「雷武真拳」第四段、技能三「神怒·千雳」命中时，自身会心伤害提高10%，持续7秒，最多可叠加5层。\n施放技能一「神怒·踏鸣」、技能二「神怒·雷织」命中时，自身独立伤害提高6%，持续7秒，最多可叠加5层。",
		maxLv = 1,
		type = 1,
		id = 700070190,
		extra_param = "",
		param = {}
	},
	[700070191] = {
		description = "普通攻击伤害提高30%，对命中的敌人附加暗属性抗性降低15%，持续5秒。\n普通攻击命中时，弹跳攻击附近的敌人数次，每次弹跳造成20%攻击力的的暗属性伤害。",
		maxLv = 1,
		type = 1,
		id = 700070191,
		extra_param = "",
		param = {}
	},
	[700070192] = {
		description = "改变技能二「双重散射」的攻击模式。\n技能二「双重散射」命中时，散射攻击附近的敌人，造成300%攻击力的的暗属性伤害。",
		maxLv = 1,
		type = 1,
		id = 700070192,
		extra_param = "",
		param = {}
	},
	[700070193] = {
		description = "技能三「幽离冲击」怒气消耗降低30点。\n技能三攻击命中后，在命中位置生成1个强化的「瞬影幽光」，持续牵引周围敌人，每次对敌人附加30%攻击力的暗属性伤害，存在8秒，场上最多存在1个。\n生成强化的「瞬影幽光」时，重置一次技能三的冷却时间。\n存在强化的「瞬影幽光」时，施放技能三「幽离冲击」会额外造成一次攻击，造成350%攻击力的暗属性伤害。",
		maxLv = 1,
		type = 1,
		id = 700070193,
		extra_param = "",
		param = {}
	},
	[700070194] = {
		description = "普攻最后一段攻击命中后，额外回复30点怒气，并在命中位置生成1个强化的「瞬影幽光」，持续牵引周围敌人，每次对敌人附加30%攻击力的暗属性伤害，存在8秒，场上最多存在1个。\n生成强化的「瞬影幽光」时，重置一次技能三的冷却时间。\n存在强化的「瞬影幽光」时，施放普通攻击最后一段会额外造成一次攻击，造成350%攻击力的暗属性伤害。",
		maxLv = 1,
		type = 1,
		id = 700070194,
		extra_param = "",
		param = {}
	},
	[700070195] = {
		description = "闪避时触发一次全方位射击，造成100%攻击力的暗属性伤害，命中时自身随机一个处于冷却状态的技能或奥义的剩余冷却时间缩短1秒，该效果每5秒最多触发一次。\n普通攻击最后一段命中时，获得25%的闪避值。",
		maxLv = 1,
		type = 1,
		id = 700070195,
		extra_param = "",
		param = {}
	},
	[700070196] = {
		description = "炮垒形态下，攻击转变为激光扫射前方区域，每次攻击消耗20点神能，造成7次共计2100%攻击力的暗属性伤害。",
		maxLv = 1,
		type = 1,
		id = 700070196,
		extra_param = "",
		param = {}
	},
	[700070197] = {
		description = "每次攻击命中时，自身独立伤害提高6%，最多可叠加10层，该效果每0.8秒最多触发一次，每0.8秒减少一层。",
		maxLv = 1,
		type = 1,
		id = 700070197,
		extra_param = "",
		param = {}
	},
	[700070198] = {
		description = "技能二「冥灵爆破」的冷却时间缩短60%。\n技能二「冥灵爆破」命中后，会在命中的敌人附近生成数个炮台进行协同攻击，造成共计400%攻击力的暗属性伤害。",
		maxLv = 1,
		type = 1,
		id = 700070198,
		extra_param = "",
		param = {}
	},
	[700070199] = {
		description = "闪避时触发一次协同攻击，对周围敌人造成100%攻击力的暗属性伤害 ，并获得25点神能。",
		maxLv = 1,
		type = 1,
		id = 700070199,
		extra_param = "",
		param = {}
	},
	[700070200] = {
		description = "处于炮垒形态下，会在场上生成一个「聚影信标」，该效果每4秒最多触发一次。\n自身炮击攻击命中「聚影信标」时，会爆破并牵引附近的敌人，对敌人造成共计300%攻击力的暗属性伤害，并获得40点神能。",
		maxLv = 1,
		type = 1,
		id = 700070200,
		extra_param = "",
		param = {}
	},
	[700070201] = {
		description = "强化的技能三「风元异变」的怒气消耗降低40点。\n强化的技能三「风元异变」可以长按持续施放，每3秒消耗6点怒气。",
		maxLv = 1,
		type = 1,
		id = 700070201,
		extra_param = "",
		param = {}
	},
	[700070202] = {
		description = "技能一「疾风冲击」会额外产生4个风箭，造成共计400%攻击力的风属性伤害。",
		maxLv = 1,
		type = 1,
		id = 700070202,
		extra_param = "",
		param = {}
	},
	[700070203] = {
		description = "技能二「飓风回旋」命中时，会触发气旋弹跳攻击敌人，造成共计700%攻击力的风属性伤害，该效果每2秒最多触发一次。",
		maxLv = 1,
		type = 1,
		id = 700070203,
		extra_param = "",
		param = {}
	},
	[700070204] = {
		description = "施放强化的技能三「风元异变」根据上一次施放的技能获得以下不同的额外效果：\n技能一「疾风冲击」：施放期间会产生风弹，造成100%攻击力的风属性伤害，该效果每0.12秒最多触发一次；\n技能二「飓风回旋」：施放期间会产生飓风，造成共计400%攻击力的风属性伤害，该效果每1.2秒最多触发一次。",
		maxLv = 1,
		type = 1,
		id = 700070204,
		extra_param = "",
		param = {}
	},
	[700070205] = {
		description = "每次施放技能时，自身攻击力提高5%，持续10秒，最多可叠加10层。",
		maxLv = 1,
		type = 1,
		id = 700070205,
		extra_param = "",
		param = {}
	},
	[700070206] = {
		description = "施放普通攻击、技能一、技能二时会产生额外的刀气攻击，造成300%攻击力的冰属性伤害。",
		maxLv = 1,
		type = 1,
		id = 700070206,
		extra_param = "",
		param = {}
	},
	[700070207] = {
		description = "施放普通攻击第五段时会聚集附近的敌人。",
		maxLv = 1,
		type = 1,
		id = 700070207,
		extra_param = "",
		param = {}
	},
	[700070208] = {
		description = "技能三「彼岸·千引」的冷却时间缩短50%。\n技能三「彼岸·千引」处于格挡架势时，会自动唤出「日狭女」对敌人进行攻击，造成2300%攻击力的冰属性伤害，每2秒最多触发一次。",
		maxLv = 1,
		type = 1,
		id = 700070208,
		extra_param = "",
		param = {}
	},
	[700070209] = {
		description = "攻击命中时有25%的概率清除敌人的控制点数，并造成700%攻击力的冰属性伤害，该效果每3秒最多触发一次。",
		maxLv = 1,
		type = 1,
		id = 700070209,
		extra_param = "",
		param = {}
	},
	[700070210] = {
		description = "「日狭女」攻击命中时，对命中的敌人附加破甲，防御力降低20%，持续12秒，最多可叠加4层。",
		maxLv = 1,
		type = 1,
		id = 700070210,
		extra_param = "",
		param = {}
	},
	[700070211] = {
		description = "施放「炽光的剑印」后可以衔接「炽光的剑印」，每次施放会消耗5点「破晓」，处于「裁断」状态时施放「炽光的剑印」不会消耗「破晓」点数。",
		maxLv = 1,
		type = 1,
		id = 700070211,
		extra_param = "",
		param = {}
	},
	[700070212] = {
		description = "处于「裁断」状态时，普通攻击范围提高，自身攻击力提高50%，普通攻击命中也会获得「破晓」。",
		maxLv = 1,
		type = 1,
		id = 700070212,
		extra_param = "",
		param = {}
	},
	[700070213] = {
		description = "「刹那」、「运升」命中时，会产生额外攻击，造成400%攻击力的光属性伤害，额外攻击命中时获得「破晓」20点和神能40点数。\n「辉光」、「命咎」命中时，会产生额外攻击，造成400%攻击力的光属性伤害；施放「辉光」、「命咎」时，对应的技能的剩余冷却时间缩短3秒。",
		maxLv = 1,
		type = 1,
		id = 700070213,
		extra_param = "",
		param = {}
	},
	[700070214] = {
		description = "每次成功格挡后，会触发一次额外攻击，造成400%攻击力的光属性伤害，该效果每0.1秒最多触发一次。",
		maxLv = 1,
		type = 1,
		id = 700070214,
		extra_param = "",
		param = {}
	},
	[700070215] = {
		description = "出场时「破晓」恢复至满值。每次击败敌人时，获得20点「破晓」。",
		maxLv = 1,
		type = 1,
		id = 700070215,
		extra_param = "",
		param = {}
	},
	[700070216] = {
		description = "施放每段普通攻击时，点击普通攻击会自动衔接施放「破霜击」。\n「破霜击」的怒气消耗降低18点。",
		maxLv = 1,
		type = 1,
		id = 700070216,
		extra_param = "",
		param = {}
	},
	[700070217] = {
		description = "衔接施放「破霜击」后，衔接非移动闪避也可以施放「霜影击」。",
		maxLv = 1,
		type = 1,
		id = 700070217,
		extra_param = "",
		param = {}
	},
	[700070218] = {
		description = "衔接施放「破霜击」时，自身普通攻击伤害提高50%，持续5秒。\n施放「霜影击」时，技能一「曳影击」、技能二「碎月击」、奥义的剩余冷却时间缩短2秒。",
		maxLv = 1,
		type = 1,
		id = 700070218,
		extra_param = "",
		param = {}
	},
	[700070219] = {
		description = "施放每段普通攻击时，获得霸体效果、受到的伤害降低30%，持续2秒。",
		maxLv = 1,
		type = 1,
		id = 700070219,
		extra_param = "",
		param = {}
	},
	[700070220] = {
		description = "自身每有1点怒气，命中瞬间攻击力提高0.6%，该效果提供的攻击力提高最高为60%。",
		maxLv = 1,
		type = 1,
		id = 700070220,
		extra_param = "",
		param = {}
	},
	[700070221] = {
		description = "技能二「鲸歌唤潮」改变为在自身周围召唤海兽眷属，造成共计3500%攻击力的水属性伤害，并且持续时间改变为10秒。",
		maxLv = 1,
		type = 1,
		id = 700070221,
		extra_param = "",
		param = {}
	},
	[700070222] = {
		description = "技能一「海兽跃袭」攻击首次命中时，会产生分裂攻击，额外造成共计1500%攻击力的水属性伤害。",
		maxLv = 1,
		type = 1,
		id = 700070222,
		extra_param = "",
		param = {}
	},
	[700070223] = {
		description = "技能二「鲸歌唤潮」也会在队友周围唤出海兽眷属。",
		maxLv = 1,
		type = 1,
		id = 700070223,
		extra_param = "",
		param = {}
	},
	[700070224] = {
		description = "技能一「海兽跃袭」、技能二「鲸歌唤潮」每次命中时，自身攻击力提高10%，持续8秒，最多可叠加8层。",
		maxLv = 1,
		type = 1,
		id = 700070224,
		extra_param = "",
		param = {}
	},
	[700070225] = {
		description = "闪避时，会召唤海兽眷属攻击敌人，造成共计1500%攻击力的水属性伤害，该效果每3秒最多触发一次，命中敌人时自身随机一个技能的剩余冷却时间缩短3秒。",
		maxLv = 1,
		type = 1,
		id = 700070225,
		extra_param = "",
		param = {}
	},
	[700070501] = {
		description = "普通攻击命中时，额外造成90%攻击力的伤害，该效果每3秒最多触发一次。",
		maxLv = 5,
		type = 1,
		id = 700070501,
		extra_param = "",
		param = {}
	},
	[700070502] = {
		description = "普通攻击命中时，对敌人造成其生命值上限的<color=#FF9500>{1}</color>的伤害。",
		maxLv = 5,
		type = 1,
		id = 700070502,
		extra_param = "",
		param = {
			{
				0.1,
				0.1,
				false,
				"%"
			}
		}
	},
	[700070503] = {
		description = "普通攻击命中生命值百分比高于自身的敌人时，命中瞬间的伤害提高<color=#FF9500>{1}</color>。",
		maxLv = 5,
		type = 1,
		id = 700070503,
		extra_param = "",
		param = {
			{
				30,
				21,
				false,
				"%"
			}
		}
	},
	[700070504] = {
		description = "普通攻击命中生命值百分比低于自身的敌人时，命中瞬间的会心率提高<color=#FF9500>{1}</color>。",
		maxLv = 5,
		type = 1,
		id = 700070504,
		extra_param = "",
		param = {
			{
				25,
				18,
				false,
				"%"
			}
		}
	},
	[700070505] = {
		description = "普通攻击命中时，普通攻击伤害提高30%，最多可叠加<color=#FF9500>{2}</color>层。",
		maxLv = 5,
		type = 1,
		id = 700070505,
		extra_param = "",
		param = {
			{
				30,
				30,
				false,
				""
			},
			{
				2,
				1,
				false,
				""
			}
		}
	},
	[700070506] = {
		description = "普通攻击命中后，技能伤害提高<color=#FF9500>{1}</color>，持续{2}秒。",
		maxLv = 5,
		type = 1,
		id = 700070506,
		extra_param = "",
		param = {
			{
				15,
				10,
				false,
				"%"
			},
			{
				3,
				0,
				false,
				""
			}
		}
	},
	[700070507] = {
		description = "普通攻击有<color=#FF9500>{1}</color>概率命中瞬间的伤害提高200%，有<color=#FF9500>{2}</color>的概率命中瞬间的伤害降低20%，该效果每2秒最多触发一次。",
		maxLv = 5,
		type = 1,
		id = 700070507,
		extra_param = "",
		param = {
			{
				10,
				20,
				false,
				"%"
			},
			{
				90,
				-20,
				false,
				"%"
			}
		}
	},
	[700070508] = {
		description = "普通攻击命中时，获得<color=#FF9500>{1}</color>的奥义值，该效果每3秒最多触发一次。",
		maxLv = 5,
		type = 1,
		id = 700070508,
		extra_param = "",
		param = {
			{
				10,
				6,
				false,
				"%"
			}
		}
	},
	[700070509] = {
		description = "普通攻击命中时，有15%的概率奥义的剩余冷却时间缩短<color=#FF9500>{1}</color>秒。",
		maxLv = 5,
		type = 1,
		id = 700070509,
		extra_param = "",
		param = {
			{
				2,
				0.8,
				false,
				""
			}
		}
	},
	[700070510] = {
		description = "普通攻击命中时，有15%的概率随机一个技能的剩余冷却时间缩短<color=#FF9500>{1}</color>秒。",
		maxLv = 5,
		type = 1,
		id = 700070510,
		extra_param = "",
		param = {
			{
				1,
				0.5,
				false,
				""
			}
		}
	},
	[700070511] = {
		description = "普通攻击命中时，获得20闪避值，该效果每<color=#FF9500>{1}</color>秒最多触发一次。",
		maxLv = 5,
		type = 1,
		id = 700070511,
		extra_param = "",
		param = {
			{
				4,
				-0.5,
				false,
				""
			}
		}
	},
	[700070512] = {
		description = "普通攻击命中时，闪避效果的剩余冷却时间缩短1秒，该效果每<color=#FF9500>{1}</color>秒最多触发一次。",
		maxLv = 5,
		type = 1,
		id = 700070512,
		extra_param = "",
		param = {
			{
				5,
				-0.5,
				false,
				""
			}
		}
	},
	[700070551] = {
		description = "技能和奥义命中时，造成300%攻击力的伤害，该效果每<color=#FF9500>{1}</color>秒最多触发一次。",
		maxLv = 5,
		type = 1,
		id = 700070551,
		extra_param = "",
		param = {
			{
				5,
				-0.5,
				false,
				""
			}
		}
	},
	[700070552] = {
		description = "技能和奥义命中时，敌人的生命值越多，命中瞬间的伤害提高越高，该效果每20%生命值提高<color=#FF9500>{1}</color>。",
		maxLv = 5,
		type = 1,
		id = 700070552,
		extra_param = "",
		param = {
			{
				4,
				4,
				false,
				"%"
			}
		}
	},
	[700070553] = {
		description = "技能和奥义命中时，对命中的敌人附加畏惧状态，防御力降低<color=#FF9500>{1}</color>，持续5秒。",
		maxLv = 5,
		type = 1,
		id = 700070553,
		extra_param = "",
		param = {
			{
				15,
				5,
				false,
				"%"
			}
		}
	},
	[700070554] = {
		description = "技能和奥义命中生命值百分比高于自身的敌人时，命中瞬间的伤害提高<color=#FF9500>{1}</color>。",
		maxLv = 5,
		type = 1,
		id = 700070554,
		extra_param = "",
		param = {
			{
				15,
				11,
				false,
				"%"
			}
		}
	},
	[700070555] = {
		description = "技能和奥义命中生命值百分比低于自身的敌人时，命中瞬间的会心率提高<color=#FF9500>{1}</color>。",
		maxLv = 5,
		type = 1,
		id = 700070555,
		extra_param = "",
		param = {
			{
				12,
				9,
				false,
				"%"
			}
		}
	},
	[700070556] = {
		description = "技能和奥义命中处于畏惧状态的敌人时，所有技能和奥义的剩余冷却时间缩短1.5秒，该效果每<color=#FF9500>{1}</color>秒最多触发一次。",
		maxLv = 5,
		type = 1,
		id = 700070556,
		extra_param = "",
		param = {
			{
				6,
				-0.5,
				false,
				""
			}
		}
	},
	[700070557] = {
		description = "技能和奥义命中处于畏惧状态的敌人时，会附加一次<color=#FF9500>{1}</color>攻击力的伤害,该效果每0.3秒最多触发一次。",
		maxLv = 5,
		type = 1,
		id = 700070557,
		extra_param = "",
		param = {
			{
				70,
				20,
				false,
				"%"
			}
		}
	},
	[700070558] = {
		description = "技能和奥义命中时，技能伤害提高<color=#FF9500>{1}</color>，持续{2}秒，该效果每5秒最多触发一次。",
		maxLv = 5,
		type = 1,
		id = 700070558,
		extra_param = "",
		param = {
			{
				30,
				10,
				false,
				"%"
			},
			{
				1.5,
				0,
				false,
				""
			}
		}
	},
	[700070559] = {
		description = "技能和奥义命中并产生会心时，对命中的敌人附加破甲状态，防御力降低<color=#FF9500>{1}</color>，持续{2}秒。",
		maxLv = 5,
		type = 1,
		id = 700070559,
		extra_param = "",
		param = {
			{
				15,
				5,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[700070560] = {
		description = "技能和奥义命中时，自身伤害提高<color=#FF9500>{1}</color>，持续2秒，该效果每10秒最多触发一次。",
		maxLv = 5,
		type = 1,
		id = 700070560,
		extra_param = "",
		param = {
			{
				60,
				40,
				false,
				"%"
			}
		}
	},
	[700070561] = {
		description = "技能和奥义命中时，获得<color=#FF9500>{1}</color>的奥义值，该效果每6秒最多触发一次。",
		maxLv = 5,
		type = 1,
		id = 700070561,
		extra_param = "",
		param = {
			{
				12,
				8,
				false,
				"%"
			}
		}
	},
	[700070562] = {
		description = "技能和奥义命中时，奥义的剩余冷却时间缩短<color=#FF9500>{1}</color>秒，该效果每5秒最多触发一次。",
		maxLv = 5,
		type = 1,
		id = 700070562,
		extra_param = "",
		param = {
			{
				1.5,
				0.8,
				false,
				""
			}
		}
	},
	[700070563] = {
		description = "技能和奥义命中时，全属性伤害提高<color=#FF9500>{1}</color>，持续{2}秒，该效果每5秒最多触发一次。",
		maxLv = 5,
		type = 1,
		id = 700070563,
		extra_param = "",
		param = {
			{
				10,
				10,
				false,
				"%"
			},
			{
				3,
				0,
				false,
				""
			}
		}
	},
	[700070564] = {
		description = "技能和奥义命中时，获得40闪避值，该效果每6秒最多触发一次。",
		maxLv = 1,
		type = 1,
		id = 700070564,
		extra_param = "",
		param = {}
	},
	[700070565] = {
		description = "技能和奥义命中时，闪避效果的剩余冷却时间缩短1秒，该效果每8秒最多触发一次。",
		maxLv = 5,
		type = 1,
		id = 700070565,
		extra_param = "",
		param = {}
	},
	[700070566] = {
		description = "技能和奥义命中时，奥义伤害提高<color=#FF9500>{1}</color>，持续8秒。",
		maxLv = 5,
		type = 1,
		id = 700070566,
		extra_param = "",
		param = {
			{
				80,
				50,
				false,
				"%"
			}
		}
	},
	[700070601] = {
		description = "主控修正者施放奥义后，进入零时空间，持续2秒。",
		maxLv = 5,
		type = 1,
		id = 700070601,
		extra_param = "",
		param = {}
	},
	[700070602] = {
		description = "主控修正者施放奥义时，获得灵感，持续15秒，持有灵感时伤害提高<color=#FF9500>{1}</color>。",
		maxLv = 5,
		type = 1,
		id = 700070602,
		extra_param = "",
		param = {
			{
				20,
				15,
				false,
				"%"
			}
		}
	},
	[700070603] = {
		description = "主控修正者施放奥义时，获得灵感，持续15秒，持有灵感时<color=#FF9500>{1}</color>秒独立伤害提高50%。",
		maxLv = 5,
		type = 1,
		id = 700070603,
		extra_param = "",
		param = {
			{
				3,
				1,
				false,
				""
			}
		}
	},
	[700070604] = {
		description = "主控修正者施放奥义时，获得灵感，持续15秒，获得灵感时，恢复满机制值。",
		maxLv = 1,
		type = 1,
		id = 700070604,
		extra_param = "",
		param = {}
	},
	[700070605] = {
		description = "主控修正者施放奥义时，获得灵感，持续15秒，获得灵感时，护甲穿透提高<color=#FF9500>{1}</color>，直到灵感结束。",
		maxLv = 5,
		type = 1,
		id = 700070605,
		extra_param = "",
		param = {
			{
				20,
				10,
				false,
				"%"
			},
			{
				9999.999,
				0,
				false,
				""
			}
		}
	},
	[700070606] = {
		description = "主控修正者施放奥义时，获得灵感，持续15秒，获得灵感时，技能和奥义的剩余冷却时间缩短<color=#FF9500>{1}</color>。",
		maxLv = 5,
		type = 1,
		id = 700070606,
		extra_param = "",
		param = {
			{
				20,
				20,
				false,
				"%"
			}
		}
	},
	[700070607] = {
		description = "主控修正者持有灵感时，每次攻击额外造成<color=#FF9500>{1}</color>攻击力的伤害，该效果每0.3秒最多触发一次。",
		maxLv = 5,
		type = 1,
		id = 700070607,
		extra_param = "",
		param = {
			{
				70,
				20,
				false,
				"%"
			}
		}
	},
	[700070608] = {
		description = "队友施放奥义后，自身获得<color=#FF9500>{1}</color>的奥义值。",
		maxLv = 5,
		type = 1,
		id = 700070608,
		extra_param = "",
		param = {
			{
				15,
				10,
				false,
				"%"
			}
		}
	},
	[700070609] = {
		description = "队友施放奥义时，全队奥义伤害提高<color=#FF9500>{1}</color>，持续8秒。",
		maxLv = 5,
		type = 1,
		id = 700070609,
		extra_param = "",
		param = {
			{
				50,
				50,
				false,
				"%"
			}
		}
	},
	[700070610] = {
		description = "队友施放奥义时，自身获得霸体效果，持续<color=#FF9500>{1}</color>秒。",
		maxLv = 5,
		type = 1,
		id = 700070610,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[700070611] = {
		description = "队友施放奥义时，自身受到的伤害降低<color=#FF9500>{1}</color>，持续{2}秒。",
		maxLv = 5,
		type = 1,
		id = 700070611,
		extra_param = "",
		param = {
			{
				20,
				10,
				false,
				"%"
			},
			{
				8,
				0,
				false,
				""
			}
		}
	},
	[700070612] = {
		description = "队友施放奥义时，自身技能和奥义的剩余冷却时间缩短<color=#FF9500>{1}</color>秒。",
		maxLv = 5,
		type = 1,
		id = 700070612,
		extra_param = "",
		param = {
			{
				4,
				2,
				false,
				""
			}
		}
	},
	[700070613] = {
		description = "队友施放奥义时，自身全属性伤害提高<color=#FF9500>{1}</color>，持续{2}秒。",
		maxLv = 5,
		type = 1,
		id = 700070613,
		extra_param = "",
		param = {
			{
				20,
				14,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[700070614] = {
		description = "队友施放奥义时，自身获得20闪避值。",
		maxLv = 5,
		type = 1,
		id = 700070614,
		extra_param = "",
		param = {}
	},
	[700070615] = {
		description = "队友施放奥义时，自身闪避效果的剩余冷却时间缩短1秒。",
		maxLv = 5,
		type = 1,
		id = 700070615,
		extra_param = "",
		param = {}
	},
	[700070651] = {
		description = "极限闪避时，对攻击者造成300%攻击力的伤害。",
		maxLv = 5,
		type = 1,
		id = 700070651,
		extra_param = "",
		param = {}
	},
	[700070652] = {
		description = "极限闪避时，伤害提高<color=#FF9500>{1}</color>，持续{2}秒。",
		maxLv = 5,
		type = 1,
		id = 700070652,
		extra_param = "",
		param = {
			{
				25,
				15,
				false,
				"%"
			},
			{
				5,
				0,
				false,
				""
			}
		}
	},
	[700070653] = {
		description = "极限闪避时，全属性伤害提高<color=#FF9500>{1}</color>，持续{2}秒。",
		maxLv = 5,
		type = 1,
		id = 700070653,
		extra_param = "",
		param = {
			{
				20,
				14,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[700070654] = {
		description = "极限闪避时，会心率提高<color=#FF9500>{1}</color>，持续{2}秒。",
		maxLv = 5,
		type = 1,
		id = 700070654,
		extra_param = "",
		param = {
			{
				15,
				10,
				false,
				"%"
			},
			{
				3,
				0,
				false,
				""
			}
		}
	},
	[700070655] = {
		description = "极限闪避时，会心伤害提高<color=#FF9500>{1}</color>，持续{2}秒。",
		maxLv = 5,
		type = 1,
		id = 700070655,
		extra_param = "",
		param = {
			{
				15,
				10,
				false,
				"%"
			},
			{
				3,
				0,
				false,
				""
			}
		}
	},
	[700070656] = {
		description = "极限闪避时，获得<color=#FF9500>{1}</color>生命值上限的护盾，持续5秒，该效果每5秒最多触发一次。",
		maxLv = 5,
		type = 1,
		id = 700070656,
		extra_param = "",
		param = {
			{
				5,
				2,
				false,
				"%"
			}
		}
	},
	[700070657] = {
		description = "极限闪避时，重置闪避效果的冷却时间，该效果每5秒最多触发一次。",
		maxLv = 1,
		type = 1,
		id = 700070657,
		extra_param = "",
		param = {}
	},
	[700070658] = {
		description = "极限闪避时，技能和奥义的剩余冷却时间缩短<color=#FF9500>{1}</color>秒，该效果每5秒最多触发一次。",
		maxLv = 5,
		type = 1,
		id = 700070658,
		extra_param = "",
		param = {
			{
				7,
				3,
				false,
				""
			}
		}
	},
	[700070659] = {
		description = "极限闪避时，聚集敌人，该效果每5秒最多触发一次。",
		maxLv = 5,
		type = 1,
		id = 700070659,
		extra_param = "",
		param = {}
	},
	[700070660] = {
		description = "极限闪避时，获得满机制值，该效果每5秒最多触发一次。",
		maxLv = 5,
		type = 1,
		id = 700070660,
		extra_param = "",
		param = {}
	},
	[700070661] = {
		description = "极限闪避时，获得<color=#FF9500>{1}</color>的奥义值。",
		maxLv = 5,
		type = 1,
		id = 700070661,
		extra_param = "",
		param = {
			{
				6,
				4,
				false,
				"%"
			}
		}
	},
	[700070662] = {
		description = "极限闪避时，奥义伤害提高<color=#FF9500>{1}</color>，持续8秒。",
		maxLv = 5,
		type = 1,
		id = 700070662,
		extra_param = "",
		param = {
			{
				30,
				30,
				false,
				"%"
			}
		}
	},
	[700070663] = {
		description = "极限闪避时，技能伤害提高<color=#FF9500>{1}</color>，该效果可以叠加。",
		maxLv = 5,
		type = 1,
		id = 700070663,
		extra_param = "",
		param = {
			{
				2,
				1,
				false,
				"%"
			}
		}
	},
	[700070664] = {
		description = "极限闪避时，获得20闪避值。",
		maxLv = 5,
		type = 1,
		id = 700070664,
		extra_param = "",
		param = {}
	},
	[700070665] = {
		description = "场上存在敌人时，闪避过程中会受到一次敌人的攻击触发极限闪避，该效果每5秒最多触发一次。此次攻击可能打到队友。",
		maxLv = 5,
		type = 1,
		id = 700070665,
		extra_param = "",
		param = {}
	},
	[700070666] = {
		description = "闪避效果可充能2次。",
		maxLv = 5,
		type = 1,
		id = 700070666,
		extra_param = "",
		param = {}
	},
	[700070701] = {
		description = "伤害提高5%，每有{1}喵喵币，伤害额外提高10%。",
		maxLv = 5,
		type = 1,
		id = 700070701,
		extra_param = "",
		param = {
			{
				2000,
				0,
				false,
				""
			}
		}
	},
	[700070702] = {
		description = "全属性伤害提高5%，每有{1}喵喵币，全属性伤害额外提高10%。",
		maxLv = 5,
		type = 1,
		id = 700070702,
		extra_param = "",
		param = {
			{
				2000,
				0,
				false,
				""
			}
		}
	},
	[700070703] = {
		description = "受到的伤害降低5%，每有{1}喵喵币，受到的伤害额外降低10%。",
		maxLv = 5,
		type = 1,
		id = 700070703,
		extra_param = "",
		param = {
			{
				2000,
				0,
				false,
				""
			}
		}
	},
	[700070704] = {
		description = "生命值上限提高5%，每有{1}喵喵币，生命值上限额外提高10%。",
		maxLv = 5,
		type = 1,
		id = 700070704,
		extra_param = "",
		param = {
			{
				2000,
				0,
				false,
				""
			}
		}
	},
	[700070705] = {
		description = "攻击力提高4%，每有{1}喵喵币，攻击力提高8%。",
		maxLv = 5,
		type = 1,
		id = 700070705,
		extra_param = "",
		param = {
			{
				2000,
				0,
				false,
				""
			}
		}
	},
	[700070706] = {
		description = "闪避消耗降低2%，每有{1}喵喵币，闪避消耗降低4%。",
		maxLv = 5,
		type = 1,
		id = 700070706,
		extra_param = "",
		param = {
			{
				2000,
				0,
				false,
				""
			}
		}
	},
	[700070707] = {
		description = "技能的冷却时间缩短5%，每有{1}喵喵币，技能的冷却时间缩短5%。",
		maxLv = 5,
		type = 1,
		id = 700070707,
		extra_param = "",
		param = {
			{
				2000,
				0,
				false,
				""
			}
		}
	},
	[700070708] = {
		description = "奥义伤害额外提高15%，每有{1}喵喵币，奥义伤害额外提高25%。",
		maxLv = 5,
		type = 1,
		id = 700070708,
		extra_param = "",
		param = {
			{
				2000,
				0,
				false,
				""
			}
		}
	},
	[700070709] = {
		description = "场上存在敌人时，主控修正者每3秒对范围内的敌人造成一次红包攻击，红包攻击造成10*喵喵币数伤害和400%攻击力伤害。",
		maxLv = 5,
		type = 1,
		id = 700070709,
		extra_param = "",
		param = {}
	},
	[700070710] = {
		description = "主控修正者技能和奥义命中时，对范围内的敌人造成一次红包攻击，红包攻击造成10*喵喵币数伤害和400%攻击力伤害，该效果每3秒最多触发一次。",
		maxLv = 5,
		type = 1,
		id = 700070710,
		extra_param = "",
		param = {}
	},
	[700070711] = {
		description = "红包攻击命中的敌人，防御力降低15%。",
		maxLv = 5,
		type = 1,
		id = 700070711,
		extra_param = "",
		param = {}
	},
	[700070712] = {
		description = "主控修正者普通攻击命中时，对范围内的敌人造成一次红包攻击，红包攻击造成10*喵喵币数伤害和400%攻击力伤害，该效果每3秒最多触发一次。",
		maxLv = 5,
		type = 1,
		id = 700070712,
		extra_param = "",
		param = {}
	},
	[700070713] = {
		description = "红包攻击命中的敌人受到的伤害提高10%。",
		maxLv = 5,
		type = 1,
		id = 700070713,
		extra_param = "",
		param = {}
	},
	[700070714] = {
		description = "主控修正者受击时，对攻击者造成伤害，每有1喵喵币，造成20的伤害。",
		maxLv = 5,
		type = 1,
		id = 700070714,
		extra_param = "",
		param = {}
	},
	[700070715] = {
		description = "主控修正者受击时，每有20喵喵币，受到的伤害降低1。",
		maxLv = 5,
		type = 1,
		id = 700070715,
		extra_param = "",
		param = {}
	},
	[700070751] = {
		description = "聚集敌人，该效果每8秒最多触发一次。",
		maxLv = 5,
		type = 1,
		id = 700070751,
		extra_param = "",
		param = {}
	},
	[700070752] = {
		description = "场上存在敌人时，进入零时空间，该效果每12秒最多触发一次。",
		maxLv = 5,
		type = 1,
		id = 700070752,
		extra_param = "",
		param = {}
	},
	[700070753] = {
		description = "攻击命中生命值百分比高于自身的敌人时，附加眩晕状态，持续<color=#FF9500>{1}</color>秒，该效果每8秒最多触发一次。",
		maxLv = 5,
		type = 1,
		id = 700070753,
		extra_param = "",
		param = {
			{
				2,
				0.5,
				false,
				""
			}
		}
	},
	[700070754] = {
		description = "攻击命中生命值百分比低于自身的敌人时，命中瞬间的伤害提高<color=#FF9500>{1}</color>。",
		maxLv = 5,
		type = 1,
		id = 700070754,
		extra_param = "",
		param = {
			{
				20,
				14,
				false,
				"%"
			}
		}
	},
	[700070755] = {
		description = "场上敌人不高于<color=#FF9500>{1}</color>个时，命中瞬间的会心率提高15%。",
		maxLv = 5,
		type = 1,
		id = 700070755,
		extra_param = "",
		param = {
			{
				1,
				1,
				false,
				""
			}
		}
	},
	[700070756] = {
		description = "场上敌人不少于<color=#FF9500>{1}</color>个时，会心伤害提高15%。",
		maxLv = 5,
		type = 1,
		id = 700070756,
		extra_param = "",
		param = {
			{
				5,
				-1,
				false,
				""
			}
		}
	},
	[700070757] = {
		description = "攻击每命中10次，会心率提高100%，持续2秒。",
		maxLv = 5,
		type = 1,
		id = 700070757,
		extra_param = "",
		param = {}
	},
	[700070758] = {
		description = "攻击命中时，会心率提高100%，持续2秒，该效果每8秒最多触发一次。",
		maxLv = 5,
		type = 1,
		id = 700070758,
		extra_param = "",
		param = {}
	},
	[700070759] = {
		description = "攻击有20%的概率额外造成<color=#FF9500>{1}</color>攻击力的伤害。",
		maxLv = 5,
		type = 1,
		id = 700070759,
		extra_param = "",
		param = {
			{
				70,
				20,
				false,
				"%"
			}
		}
	},
	[700070760] = {
		description = "命中瞬间的攻击力提高<color=#FF9500>{1}</color>，最多可叠加{2}层。",
		maxLv = 5,
		type = 1,
		id = 700070760,
		extra_param = "",
		param = {
			{
				0.2,
				0.2,
				false,
				"%"
			},
			{
				50,
				30,
				false,
				""
			}
		}
	},
	[700070761] = {
		description = "命中瞬间的伤害提高<color=#FF9500>{1}</color>，该效果3秒内持续降低至0，然后三秒内提高到<color=#FF9500>{1}</color>，循环。",
		maxLv = 5,
		type = 1,
		id = 700070761,
		extra_param = "",
		param = {
			{
				18,
				18,
				false,
				"%"
			}
		}
	},
	[700070762] = {
		description = "技能和奥义的冷却时间缩短50%，伤害降低30%。",
		maxLv = 5,
		type = 1,
		id = 700070762,
		extra_param = "",
		param = {}
	},
	[700070763] = {
		description = "每次消耗机制时，获得满机制值，该效果每8秒最多触发一次。",
		maxLv = 5,
		type = 1,
		id = 700070763,
		extra_param = "",
		param = {}
	},
	[700070764] = {
		description = "每次造成会心时，命中瞬间的伤害提高5%，最多可叠加<color=#FF9500>{1}</color>层，不造成会心时清除层数。",
		maxLv = 5,
		type = 1,
		id = 700070764,
		extra_param = "",
		param = {
			{
				4,
				2,
				false,
				""
			}
		}
	},
	[700070765] = {
		description = "受击时，对攻击者附加眩晕状态，持续<color=#FF9500>{1}</color>秒，该效果每10秒最多触发一次。",
		maxLv = 5,
		type = 1,
		id = 700070765,
		extra_param = "",
		param = {
			{
				2,
				0.5,
				false,
				""
			}
		}
	},
	[700070766] = {
		description = "自身每有20%的生命值，命中瞬间的攻击力提高<color=#FF9500>{1}</color>。",
		maxLv = 5,
		type = 1,
		id = 700070766,
		extra_param = "",
		param = {
			{
				5,
				5,
				false,
				"%"
			}
		}
	},
	[700070767] = {
		description = "生命值损失时，每损失180点生命值，额外攻击力提高<color=#FF9500>{1}</color>。",
		maxLv = 5,
		type = 1,
		id = 700070767,
		extra_param = "",
		param = {
			{
				10,
				10,
				false,
				""
			}
		}
	},
	[700070768] = {
		description = "生命值恢复时，每恢复180点生命值，额外攻击力提高<color=#FF9500>{1}</color>。",
		maxLv = 5,
		type = 1,
		id = 700070768,
		extra_param = "",
		param = {
			{
				10,
				10,
				false,
				""
			}
		}
	},
	[700070801] = {
		description = "技能命中时，随机对一名命中的敌人附加「解和」状态，持续6秒，该效果每<color=#FF9500>{1}</color>秒最多触发一次。\n「解和」：每3秒造成3%当前生命值的伤害。",
		maxLv = 5,
		type = 1,
		id = 700070801,
		extra_param = "",
		param = {
			{
				10,
				-1,
				false,
				""
			}
		}
	},
	[700070802] = {
		description = "普通攻击命中时，随机对一名命中的敌人附加「解和」状态，持续3秒，该效果每<color=#FF9500>{1}</color>秒最多触发一次。\n「解和」：每3秒造成3%当前生命值的伤害。",
		maxLv = 5,
		type = 1,
		id = 700070802,
		extra_param = "",
		param = {
			{
				5,
				-0.5,
				false,
				""
			}
		}
	},
	[700070803] = {
		description = "奥义命中时，随机对一名命中的敌人附加「解和」状态，持续15秒，该效果每<color=#FF9500>{1}</color>秒最多触发一次。\n「解和」：每3秒造成3%当前生命值的伤害。",
		maxLv = 5,
		type = 1,
		id = 700070803,
		extra_param = "",
		param = {
			{
				25,
				-2,
				false,
				""
			}
		}
	},
	[700070804] = {
		description = "触发闪避效果时，对攻击者附加「解和」状态，持续15秒，该效果每<color=#FF9500>{1}</color>秒最多触发一次。\n「解和」：每3秒造成3%当前生命值的伤害。",
		maxLv = 5,
		type = 1,
		id = 700070804,
		extra_param = "",
		param = {
			{
				25,
				-2,
				false,
				""
			}
		}
	},
	[700070805] = {
		description = "「解和」造成的伤害提高<color=#FF9500>{1}</color>。\n「解和」：每3秒造成3%当前生命值的伤害。",
		maxLv = 5,
		type = 1,
		id = 700070805,
		extra_param = "",
		param = {
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700070806] = {
		description = "处于「解和」的敌人受到的伤害提高<color=#FF9500>{1}</color>。\n「解和」：每3秒造成3%当前生命值的伤害。",
		maxLv = 5,
		type = 1,
		id = 700070806,
		extra_param = "",
		param = {
			{
				15,
				10,
				false,
				"%"
			}
		}
	},
	[700070807] = {
		description = "处于「解和」的敌人被击败时，会把「解和」状态扩散到敌人一定范围内的其他敌人身上，该扩散效果每<color=#FF9500>{1}</color>秒最多触发一次。\n「解和」：每3秒造成3%当前生命值的伤害。",
		maxLv = 5,
		type = 1,
		id = 700070807,
		extra_param = "",
		param = {
			{
				5,
				-1,
				false,
				""
			}
		}
	},
	[700070808] = {
		description = "处于「解和」的敌人被击败时，敌人一定范围内的其他处于「解和」的敌人会立即造成一次伤害，该效果每<color=#FF9500>{1}</color>秒最多触发一次。\n「解和」：每3秒造成3%当前生命值的伤害。",
		maxLv = 5,
		type = 1,
		id = 700070808,
		extra_param = "",
		param = {
			{
				5,
				-1,
				false,
				""
			}
		}
	},
	[700070809] = {
		description = "处于「解和」的敌人攻击力降低<color=#FF9500>{1}</color>。\n「解和」：每3秒造成3%当前生命值的伤害。",
		maxLv = 5,
		type = 1,
		id = 700070809,
		extra_param = "",
		param = {
			{
				10,
				10,
				false,
				"%"
			}
		}
	},
	[700070810] = {
		description = "「解和」触发时会对生命值低于50%的敌人附加破甲状态，防御力降低<color=#FF9500>{1}</color>，持续{2}秒。\n「解和」：每3秒造成3%当前生命值的伤害。",
		maxLv = 5,
		type = 1,
		id = 700070810,
		extra_param = "",
		param = {
			{
				20,
				10,
				false,
				"%"
			},
			{
				2,
				0,
				false,
				""
			}
		}
	},
	[700070811] = {
		description = "「解和」触发时，生命值高于70%时的敌人会动作迟缓至<color=#FF9500>{1}</color>，持续0.3秒。\n「解和」：每3秒造成3%当前生命值的伤害。",
		maxLv = 5,
		type = 1,
		id = 700070811,
		extra_param = "",
		param = {
			{
				80,
				-10,
				false,
				"%"
			}
		}
	},
	[700070812] = {
		description = "处于「解和」的敌人被击败时，恢复自身<color=#FF9500>{1}</color>的攻击力的生命值，该效果每10秒最多触发一次。\n「解和」：每3秒造成3%当前生命值的伤害。",
		maxLv = 5,
		type = 1,
		id = 700070812,
		extra_param = "",
		param = {
			{
				35,
				10,
				false,
				"%"
			}
		}
	},
	[700070813] = {
		description = "「解和」触发时，额外造成<color=#FF9500>{1}</color>已损失的生命值的伤害。\n「解和」：每3秒造成3%当前生命值的伤害。",
		maxLv = 5,
		type = 1,
		id = 700070813,
		extra_param = "",
		param = {
			{
				0.2,
				0.2,
				false,
				"%"
			}
		}
	},
	[700070814] = {
		description = "施放奥义后，自身一定范围内每有一名处于「解和」状态的敌人，获得<color=#FF9500>{1}</color>的奥义值。\n「解和」：每3秒造成3%当前生命值的伤害。",
		maxLv = 5,
		type = 1,
		id = 700070814,
		extra_param = "",
		param = {
			{
				10,
				5,
				false,
				"%"
			}
		}
	},
	[700070851] = {
		description = "技能命中时，有<color=#FF9500>{1}</color>的概率下一次命中触发「粉碎」。\n「粉碎」：对小范围造成55%攻击力伤害，该效果每0.8秒最多触发一次。",
		maxLv = 5,
		type = 1,
		id = 700070851,
		extra_param = "",
		param = {
			{
				30,
				10,
				false,
				"%"
			}
		}
	},
	[700070852] = {
		description = "普通攻击命中时，有<color=#FF9500>{1}</color>的概率下一次命中触发「粉碎」。\n「粉碎」：对小范围造成55%攻击力伤害，该效果每0.8秒最多触发一次。",
		maxLv = 5,
		type = 1,
		id = 700070852,
		extra_param = "",
		param = {
			{
				20,
				10,
				false,
				"%"
			}
		}
	},
	[700070853] = {
		description = "施放奥义后<color=#FF9500>{1}</color>秒内，命中触发「粉碎」。\n「粉碎」：对小范围造成55%攻击力伤害，该效果每0.8秒最多触发一次。",
		maxLv = 5,
		type = 1,
		id = 700070853,
		extra_param = "",
		param = {
			{
				2,
				0.6,
				false,
				""
			}
		}
	},
	[700070854] = {
		description = "触发闪避效果后<color=#FF9500>{1}</color>秒内，命中触发「粉碎」。\n「粉碎」：对小范围造成55%攻击力伤害，该效果每0.8秒最多触发一次。",
		maxLv = 5,
		type = 1,
		id = 700070854,
		extra_param = "",
		param = {
			{
				2,
				0.6,
				false,
				""
			}
		}
	},
	[700070855] = {
		description = "「粉碎」触发间隔时间缩短至<color=#FF9500>{1}</color>秒。\n「粉碎」：对小范围造成55%攻击力伤害，该效果每<color=#FF9500>{2}</color>秒最多触发一次。",
		maxLv = 1,
		type = 1,
		id = 700070855,
		extra_param = "",
		param = {
			{
				0.6,
				0,
				false,
				""
			},
			{
				0.6,
				0,
				false,
				""
			}
		}
	},
	[700070856] = {
		description = "命中处于易伤状态的敌人时会触发「粉碎」，该效果每<color=#FF9500>{1}</color>秒最多触发一次。\n「粉碎」：对小范围造成55%攻击力伤害，该效果每0.8秒最多触发一次。",
		maxLv = 5,
		type = 1,
		id = 700070856,
		extra_param = "",
		param = {
			{
				0.9,
				-0.1,
				false,
				""
			}
		}
	},
	[700070857] = {
		description = "命中处于破甲状态的敌人时会触发「粉碎」，该效果每<color=#FF9500>{1}</color>秒最多触发一次。\n「粉碎」：对小范围造成55%攻击力伤害，该效果每0.8秒最多触发一次。",
		maxLv = 5,
		type = 1,
		id = 700070857,
		extra_param = "",
		param = {
			{
				0.9,
				-0.1,
				false,
				""
			}
		}
	},
	[700070858] = {
		description = "「粉碎」会对命中的敌人附加虚弱状态，攻击力降低<color=#FF9500>{1}</color>，持续<color=#FF9500>{2}</color>秒。\n「粉碎」：对小范围造成55%攻击力伤害，该效果每0.8秒最多触发一次。",
		maxLv = 5,
		type = 1,
		id = 700070858,
		extra_param = "",
		param = {
			{
				10,
				6,
				false,
				"%"
			},
			{
				1.5,
				0.3,
				false,
				""
			}
		}
	},
	[700070859] = {
		description = "「粉碎」会对命中的敌人附加破甲状态，防御力降低100%，持续<color=#FF9500>{1}</color>秒。\n「粉碎」：对小范围造成55%攻击力伤害，该效果每0.8秒最多触发一次。",
		maxLv = 5,
		type = 1,
		id = 700070859,
		extra_param = "",
		param = {
			{
				1.5,
				0.3,
				false,
				""
			}
		}
	},
	[700070860] = {
		description = "「粉碎」命中时会对生命值高于50%的敌人额外造成1%当前生命值的伤害，该效果每个敌人每<color=#FF9500>{1}</color>秒最多触发一次。\n「粉碎」：对小范围造成55%攻击力伤害，该效果每0.8秒最多触发一次。",
		maxLv = 5,
		type = 1,
		id = 700070860,
		extra_param = "",
		param = {
			{
				5,
				-1,
				false,
				""
			}
		}
	},
	[700070861] = {
		description = "「粉碎」命中时会对生命值低于50%的敌人额外造成1%已损失生命值的伤害，该效果每个敌人每<color=#FF9500>{1}</color>秒最多触发一次。\n「粉碎」：对小范围造成55%攻击力伤害，该效果每0.8秒最多触发一次。",
		maxLv = 5,
		type = 1,
		id = 700070861,
		extra_param = "",
		param = {
			{
				5,
				-1,
				false,
				""
			}
		}
	},
	[700070862] = {
		description = "「粉碎」命中时会对敌人附加眩晕状态，持续0.5秒，该效果每<color=#FF9500>{1}</color>秒最多触发一次。\n「粉碎」：对小范围造成55%攻击力伤害，该效果每0.8秒最多触发一次。",
		maxLv = 5,
		type = 1,
		id = 700070862,
		extra_param = "",
		param = {
			{
				15,
				-2,
				false,
				""
			}
		}
	},
	[700070863] = {
		description = "「粉碎」命中时，生命值低于50%的敌人会动作迟缓至<color=#FF9500>{1}</color>，持续{2}秒。\n「粉碎」：对小范围造成55%攻击力伤害，该效果每0.8秒最多触发一次。",
		maxLv = 5,
		type = 1,
		id = 700070863,
		extra_param = "",
		param = {
			{
				85,
				-5,
				false,
				"%"
			},
			{
				0.3,
				0,
				false,
				""
			}
		}
	},
	[700070864] = {
		description = "「粉碎」命中时会对生命值低于50%的敌人附加移动速度降低<color=#FF9500>{1}</color>，持续{2}秒。\n「粉碎」：对小范围造成55%攻击力伤害，该效果每0.8秒最多触发一次。",
		maxLv = 5,
		type = 1,
		id = 700070864,
		extra_param = "",
		param = {
			{
				15,
				5,
				false,
				"%"
			},
			{
				5,
				0,
				false,
				""
			}
		}
	},
	[700070865] = {
		description = "「粉碎」命中时会对生命值低于50%的敌人附加1.5秒的易伤效果，受到的伤害提高<color=#FF9500>{1}</color>。\n「粉碎」：对小范围造成55%攻击力伤害，该效果每0.8秒最多触发一次。",
		maxLv = 5,
		type = 1,
		id = 700070865,
		extra_param = "",
		param = {
			{
				15,
				10,
				false,
				"%"
			}
		}
	},
	[700070866] = {
		description = "「粉碎」对处于冰冻或禁锢状态中的敌人，命中瞬间伤害提高<color=#FF9500>{1}</color>。\n「粉碎」：对小范围造成55%攻击力伤害，该效果每0.8秒最多触发一次。",
		maxLv = 5,
		type = 1,
		id = 700070866,
		extra_param = "",
		param = {
			{
				30,
				10,
				false,
				"%"
			}
		}
	},
	[700070867] = {
		description = "「粉碎」触发时，自身随机一个处于冷却状态的技能剩余冷却时间缩短<color=#FF9500>{1}</color>。\n「粉碎」：对小范围造成55%攻击力伤害，该效果每0.8秒最多触发一次。",
		maxLv = 5,
		type = 1,
		id = 700070867,
		extra_param = "",
		param = {
			{
				3,
				1,
				false,
				"%"
			}
		}
	},
	[700071001] = {
		description = "闪避值回复速度提高{1}，移动速度提高{2}",
		maxLv = 3,
		type = 1,
		id = 700071001,
		extra_param = "",
		param = {
			{
				20,
				20,
				false,
				"%"
			},
			{
				10,
				10,
				false,
				"%"
			}
		}
	},
	[700071002] = {
		description = "所有技能冷却时间缩短{1}",
		maxLv = 3,
		type = 1,
		id = 700071002,
		extra_param = "",
		param = {
			{
				5,
				5,
				false,
				"%"
			}
		}
	},
	[700071003] = {
		description = "机制值获得率提高{1}",
		maxLv = 3,
		type = 1,
		id = 700071003,
		extra_param = "",
		param = {
			{
				10,
				10,
				false,
				"%"
			}
		}
	},
	[700071004] = {
		description = "受到的伤害降低{1}",
		maxLv = 3,
		type = 1,
		id = 700071004,
		extra_param = "",
		param = {
			{
				5,
				5,
				false,
				"%"
			}
		}
	},
	[700071005] = {
		description = "会心伤害提高{1}",
		maxLv = 3,
		type = 1,
		id = 700071005,
		extra_param = "",
		param = {
			{
				15,
				15,
				false,
				"%"
			}
		}
	},
	[700071006] = {
		description = "有{1}的概率对命中的敌人附加破甲状态，防御力降低{2}",
		maxLv = 3,
		type = 1,
		id = 700071006,
		extra_param = "",
		param = {
			{
				5,
				5,
				false,
				"%"
			},
			{
				25,
				25,
				false,
				"%"
			}
		}
	},
	[700071007] = {
		description = "奥义获得率提高{1}",
		maxLv = 3,
		type = 1,
		id = 700071007,
		extra_param = "",
		param = {
			{
				10,
				10,
				false,
				"%"
			}
		}
	},
	[700071008] = {
		description = "零时空间延长{1}秒",
		maxLv = 3,
		type = 1,
		id = 700071008,
		extra_param = "",
		param = {
			{
				1,
				1,
				false,
				""
			}
		}
	},
	[700071011] = {
		description = "临时",
		maxLv = 999,
		type = 1,
		id = 700071011,
		extra_param = "",
		param = {}
	},
	[700071012] = {
		description = "临时",
		maxLv = 1,
		type = 1,
		id = 700071012,
		extra_param = "",
		param = {}
	},
	[700071013] = {
		description = "临时",
		maxLv = 1,
		type = 1,
		id = 700071013,
		extra_param = "",
		param = {}
	},
	[700071014] = {
		description = "临时",
		maxLv = 1,
		type = 1,
		id = 700071014,
		extra_param = "",
		param = {}
	},
	[700071015] = {
		description = "临时",
		maxLv = 1,
		type = 1,
		id = 700071015,
		extra_param = "",
		param = {}
	},
	[700071016] = {
		description = "临时",
		maxLv = 4,
		type = 1,
		id = 700071016,
		extra_param = "",
		param = {}
	},
	[700071017] = {
		description = "临时",
		maxLv = 1,
		type = 1,
		id = 700071017,
		extra_param = "",
		param = {}
	},
	[700071018] = {
		description = "临时",
		maxLv = 1,
		type = 1,
		id = 700071018,
		extra_param = "",
		param = {}
	},
	[700071019] = {
		description = "临时",
		maxLv = 1,
		type = 1,
		id = 700071019,
		extra_param = "",
		param = {}
	},
	[700071020] = {
		description = "临时",
		maxLv = 1,
		type = 1,
		id = 700071020,
		extra_param = "",
		param = {}
	},
	[700071021] = {
		description = "临时",
		maxLv = 1,
		type = 1,
		id = 700071021,
		extra_param = "",
		param = {}
	},
	[700071022] = {
		description = "临时",
		maxLv = 1,
		type = 1,
		id = 700071022,
		extra_param = "",
		param = {}
	},
	[700071023] = {
		description = "临时",
		maxLv = 1,
		type = 1,
		id = 700071023,
		extra_param = "",
		param = {}
	},
	[700071024] = {
		description = "修正者受到的治疗效果降低{1}",
		maxLv = 4,
		type = 1,
		id = 700071024,
		extra_param = "",
		param = {
			{
				50,
				40,
				false,
				"%"
			}
		}
	},
	[700071025] = {
		description = "精英、BOSS单位生命值低于{1}时，并获得“霸体”状态，战斗中仅生效一次",
		maxLv = 2,
		type = 1,
		id = 700071025,
		extra_param = "",
		param = {
			{
				30,
				30,
				false,
				"%"
			}
		}
	},
	[700071026] = {
		description = "小幅提升敌人攻击力、最大生命值",
		maxLv = 1,
		type = 1,
		id = 700071026,
		extra_param = "",
		param = {}
	},
	[700071027] = {
		description = "大幅提升敌人攻击力、最大生命值",
		maxLv = 1,
		type = 1,
		id = 700071027,
		extra_param = "",
		param = {}
	},
	[700071101] = {
		description = "<material=underline c=#5C5D60 h=2 event=terminology args=(1000002)>「过载」</material>有<color=#F48800>{1}</color>的概率连续触发<material=underline c=#5C5D60 h=2 event=terminology args=(1000002)>「过载」</material>。",
		maxLv = 3,
		type = 1,
		id = 700071101,
		extra_param = "",
		param = {
			{
				25,
				5,
				false,
				"%"
			}
		}
	},
	[700071102] = {
		description = "技能会对命中的敌人附加<material=underline c=#5C5D60 h=2 event=terminology args=(1000001)>「锁定」</material>状态，延迟<color=#F48800>{1}</color>秒后，对敌人触发<material=underline c=#5C5D60 h=2 event=terminology args=(1000002)>「过载」</material>，造成<color=#F48800>{2}</color><material=underline c=#5C5D60 h=2 event=terminology args=(1000003)>「战术伤害」</material>。",
		maxLv = 3,
		type = 1,
		id = 700071102,
		extra_param = "",
		param = {
			{
				6,
				-0.5,
				false,
				""
			},
			{
				600,
				0,
				false,
				"%"
			}
		}
	},
	[700071103] = {
		description = "<material=underline c=#5C5D60 h=2 event=terminology args=(1000001)>「锁定」</material>的触发时间缩短时，额外缩短<color=#F48800>{1}</color>秒。",
		maxLv = 3,
		type = 1,
		id = 700071103,
		extra_param = "",
		param = {
			{
				0.4,
				0.15,
				false,
				""
			}
		}
	},
	[700071104] = {
		description = "处于修正模式时，<material=underline c=#5C5D60 h=2 event=terminology args=(1000001)>「锁定」</material>的触发时间缩短<color=#F48800>{1}</color>。",
		maxLv = 3,
		type = 1,
		id = 700071104,
		extra_param = "",
		param = {
			{
				15,
				10,
				false,
				"%"
			}
		}
	},
	[700071105] = {
		description = "受击时，立即对攻击者触发<material=underline c=#5C5D60 h=2 event=terminology args=(1000002)>「过载」</material>，造成<color=#F48800>{1}</color><material=underline c=#5C5D60 h=2 event=terminology args=(1000003)>「战术伤害」</material>；对附近所有敌人附加<material=underline c=#5C5D60 h=2 event=terminology args=(1000001)>「锁定」</material>状态，延迟<color=#F48800>{2}</color>秒后触发<material=underline c=#5C5D60 h=2 event=terminology args=(1000002)>「过载」</material>。",
		maxLv = 3,
		type = 1,
		id = 700071105,
		extra_param = "",
		param = {
			{
				1200,
				0,
				false,
				"%"
			},
			{
				3,
				-0.5,
				false,
				""
			}
		}
	},
	[700071106] = {
		description = "施放技能三时，对全场敌人附加<material=underline c=#5C5D60 h=2 event=terminology args=(1000001)>「锁定」</material>状态，延迟<color=#F48800>{1}</color>秒后触发<material=underline c=#5C5D60 h=2 event=terminology args=(1000002)>「过载」</material>，造成<color=#F48800>{2}</color><material=underline c=#5C5D60 h=2 event=terminology args=(1000003)>「战术伤害」</material>，该效果每{3}秒最多触发一次。",
		maxLv = 3,
		type = 1,
		id = 700071106,
		extra_param = "",
		param = {
			{
				6,
				-0.5,
				false,
				""
			},
			{
				600,
				0,
				false,
				"%"
			},
			{
				3,
				0,
				false,
				""
			}
		}
	},
	[700071107] = {
		description = "<material=underline c=#5C5D60 h=2 event=terminology args=(1000002)>「过载」</material>命中敌人时，机制值获得率提高<color=#F48800>{1}</color>，持续<color=#F48800>{2}</color>秒。",
		maxLv = 3,
		type = 1,
		id = 700071107,
		extra_param = "",
		param = {
			{
				10,
				10,
				false,
				"%"
			},
			{
				2,
				0,
				false,
				""
			}
		}
	},
	[700071108] = {
		description = "处于<material=underline c=#5C5D60 h=2 event=terminology args=(1000001)>「锁定」</material>状态的敌人受到的伤害提高<color=#F48800>{1}</color>。",
		maxLv = 3,
		type = 1,
		id = 700071108,
		extra_param = "",
		param = {
			{
				20,
				8,
				false,
				"%"
			}
		}
	},
	[700071109] = {
		description = "<material=underline c=#5C5D60 h=2 event=terminology args=(1000002)>「过载」</material>命中敌人时，若敌人存活，则下1次对敌人附加的<material=underline c=#5C5D60 h=2 event=terminology args=(1000001)>「锁定」</material>状态的延迟时间缩短<color=#F48800>{1}</color>秒，最多缩短<color=#F48800>{2}</color>秒。",
		maxLv = 3,
		type = 1,
		id = 700071109,
		extra_param = "",
		param = {
			{
				0.7,
				0.3,
				false,
				""
			},
			{
				4,
				0,
				false,
				""
			}
		}
	},
	[700071110] = {
		description = "闪避后，对周围<color=#F48800>{1}</color>名敌人触发<material=underline c=#5C5D60 h=2 event=terminology args=(1000002)>「过载」</material>，造成<color=#F48800>{2}</color><material=underline c=#5C5D60 h=2 event=terminology args=(1000003)>「战术伤害」</material>。",
		maxLv = 3,
		type = 1,
		id = 700071110,
		extra_param = "",
		param = {
			{
				1,
				1,
				false,
				""
			},
			{
				150,
				0,
				false,
				"%"
			}
		}
	},
	[700071111] = {
		description = "释放普通攻击时，随机减少自身1个技能<color=#F48800>{1}</color>秒的冷却时间。",
		maxLv = 3,
		type = 1,
		id = 700071111,
		extra_param = "",
		param = {
			{
				1,
				0.5,
				false,
				""
			}
		}
	},
	[700071112] = {
		description = "<material=underline c=#5C5D60 h=2 event=terminology args=(1000002)>「过载」</material>命中时，自身技能伤害提高<color=#F48800>{1}</color>，该效果提供的技能伤害提高最高为<color=#F48800>{2}</color>。",
		maxLv = 3,
		type = 1,
		id = 700071112,
		extra_param = "",
		param = {
			{
				5,
				1,
				false,
				"%"
			},
			{
				100,
				8,
				false,
				"%"
			}
		}
	},
	[700071121] = {
		description = "<material=underline c=#5C5D60 h=2 event=terminology args=(1000001)>「锁定」</material>的延迟时间增加<color=#F48800>{1}</color>秒，每次<material=underline c=#5C5D60 h=2 event=terminology args=(1000001)>「锁定」</material>的触发时间缩短时，<material=underline c=#5C5D60 h=2 event=terminology args=(1000002)>「过载」</material>伤害提高<color=#F48800>{2}</color>。",
		maxLv = 1,
		type = 1,
		id = 700071121,
		extra_param = "",
		param = {
			{
				2,
				0,
				false,
				""
			},
			{
				15,
				0,
				false,
				"%"
			}
		}
	},
	[700071122] = {
		description = "<material=underline c=#5C5D60 h=2 event=terminology args=(1000002)>「过载」</material>伤害提高<color=#F48800>{1}</color>，攻击范围扩大为小范围。",
		maxLv = 1,
		type = 1,
		id = 700071122,
		extra_param = "",
		param = {
			{
				40,
				0,
				false,
				"%"
			}
		}
	},
	[700071123] = {
		description = "极限闪避后<color=#F48800>{1}</color>秒内，自身对攻击者每次造成伤害时会触发<material=underline c=#5C5D60 h=2 event=terminology args=(1000002)>「过载」</material>，造成<color=#F48800>{2}</color><material=underline c=#5C5D60 h=2 event=terminology args=(1000003)>「战术伤害」</material>，该效果每{3}秒最多触发一次。",
		maxLv = 1,
		type = 1,
		id = 700071123,
		extra_param = "",
		param = {
			{
				6,
				0,
				false,
				""
			},
			{
				180,
				0,
				false,
				"%"
			},
			{
				0.3,
				0,
				false,
				""
			}
		}
	},
	[700071149] = {
		description = "流派1通用效果",
		maxLv = 1,
		type = 1,
		id = 700071149,
		extra_param = "",
		param = {}
	},
	[700071150] = {
		description = "使用战术指令时，生成一片过载力场，持续<color=#F48800>{3}</color>秒，每间隔<color=#F48800>{1}</color>秒对随机1个敌人触发<material=underline c=#5C5D60 h=2 event=terminology args=(1000002)>「过载」</material>，造成<color=#F48800>{2}</color><material=underline c=#5C5D60 h=2 event=terminology args=(1000003)>「战术伤害」</material>。",
		maxLv = 1,
		type = 1,
		id = 700071150,
		extra_param = "",
		param = {
			{
				0.5,
				0,
				false,
				""
			},
			{
				200,
				0,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[700071151] = {
		description = "流派2一般珍宝1",
		maxLv = 3,
		type = 1,
		id = 700071151,
		extra_param = "",
		param = {}
	},
	[700071152] = {
		description = "流派2一般珍宝2",
		maxLv = 3,
		type = 1,
		id = 700071152,
		extra_param = "",
		param = {}
	},
	[700071153] = {
		description = "流派2一般珍宝3",
		maxLv = 3,
		type = 1,
		id = 700071153,
		extra_param = "",
		param = {}
	},
	[700071154] = {
		description = "流派2一般珍宝4",
		maxLv = 3,
		type = 1,
		id = 700071154,
		extra_param = "",
		param = {}
	},
	[700071155] = {
		description = "流派2一般珍宝5",
		maxLv = 3,
		type = 1,
		id = 700071155,
		extra_param = "",
		param = {}
	},
	[700071156] = {
		description = "流派2一般珍宝6",
		maxLv = 3,
		type = 1,
		id = 700071156,
		extra_param = "",
		param = {}
	},
	[700071157] = {
		description = "流派2一般珍宝7",
		maxLv = 3,
		type = 1,
		id = 700071157,
		extra_param = "",
		param = {}
	},
	[700071158] = {
		description = "流派2一般珍宝8",
		maxLv = 3,
		type = 1,
		id = 700071158,
		extra_param = "",
		param = {}
	},
	[700071159] = {
		description = "流派2一般珍宝9",
		maxLv = 3,
		type = 1,
		id = 700071159,
		extra_param = "",
		param = {}
	},
	[700071160] = {
		description = "流派2一般珍宝10",
		maxLv = 3,
		type = 1,
		id = 700071160,
		extra_param = "",
		param = {}
	},
	[700071161] = {
		description = "流派2一般珍宝11",
		maxLv = 3,
		type = 1,
		id = 700071161,
		extra_param = "",
		param = {}
	},
	[700071162] = {
		description = "流派2一般珍宝12",
		maxLv = 3,
		type = 1,
		id = 700071162,
		extra_param = "",
		param = {}
	},
	[700071171] = {
		description = "流派2专属珍宝1",
		maxLv = 1,
		type = 1,
		id = 700071171,
		extra_param = "",
		param = {}
	},
	[700071172] = {
		description = "流派2专属珍宝2",
		maxLv = 1,
		type = 1,
		id = 700071172,
		extra_param = "",
		param = {}
	},
	[700071173] = {
		description = "流派2专属珍宝3",
		maxLv = 1,
		type = 1,
		id = 700071173,
		extra_param = "",
		param = {}
	},
	[700071199] = {
		description = "流派2通用效果",
		maxLv = 1,
		type = 1,
		id = 700071199,
		extra_param = "",
		param = {}
	},
	[700071200] = {
		description = "流派2流派大招",
		maxLv = 1,
		type = 1,
		id = 700071200,
		extra_param = "",
		param = {}
	},
	[700071201] = {
		description = "闪避时，获得最大生命值<color=#F48800>{1}</color>的护盾<material=underline c=#5C5D60 h=2 event=terminology args=(1000023)>「阻抗」</material>，持续<color=#F48800>{2}</color>秒，该效果每{3}秒最多触发一次。",
		maxLv = 3,
		type = 1,
		id = 700071201,
		extra_param = "",
		param = {
			{
				10,
				5,
				false,
				"%"
			},
			{
				6,
				0,
				false,
				""
			},
			{
				5,
				0,
				false,
				""
			}
		}
	},
	[700071202] = {
		description = "每释放<color=#F48800>{1}</color>次普通攻击，获得最大生命值<color=#F48800>{2}</color>的护盾<material=underline c=#5C5D60 h=2 event=terminology args=(1000023)>「阻抗」</material>，持续<color=#F48800>{3}</color>秒。",
		maxLv = 3,
		type = 1,
		id = 700071202,
		extra_param = "",
		param = {
			{
				5,
				0,
				false,
				""
			},
			{
				5,
				2,
				false,
				"%"
			},
			{
				4,
				0,
				false,
				""
			}
		}
	},
	[700071203] = {
		description = "施放技能三时，获得最大生命值<color=#F48800>{1}</color>的护盾<material=underline c=#5C5D60 h=2 event=terminology args=(1000023)>「阻抗」</material>，持续<color=#F48800>{2}</color>秒，该效果每{3}秒最多触发一次。",
		maxLv = 3,
		type = 1,
		id = 700071203,
		extra_param = "",
		param = {
			{
				10,
				5,
				false,
				"%"
			},
			{
				6,
				0,
				false,
				""
			},
			{
				5,
				0,
				false,
				""
			}
		}
	},
	[700071204] = {
		description = "拥有护盾时，每间隔<color=#F48800>{1}</color>秒获得<color=#F48800>{2}</color>点<material=underline c=#5C5D60 h=2 event=terminology args=(1000021)>「充能」</material>。\n<material=underline c=#5C5D60 h=2 event=terminology args=(1000021)>「充能」</material>为满时，触发<material=underline c=#5C5D60 h=2 event=terminology args=(1000022)>「扩散电弧」</material>，造成<color=#F48800>{3}</color><material=underline c=#5C5D60 h=2 event=terminology args=(1000003)>「战术伤害」</material>。",
		maxLv = 3,
		type = 1,
		id = 700071204,
		extra_param = "",
		param = {
			{
				1,
				0,
				false,
				""
			},
			{
				30,
				10,
				false,
				""
			},
			{
				200,
				0,
				false,
				"%"
			}
		}
	},
	[700071205] = {
		description = "拥有护盾时，对一定范围内的敌人伤害提高<color=#F48800>{1}</color>。",
		maxLv = 3,
		type = 1,
		id = 700071205,
		extra_param = "",
		param = {
			{
				30,
				10,
				false,
				"%"
			}
		}
	},
	[700071206] = {
		description = "获得奥义值时，获得等同于奥义获得值的<color=#F48800>{1}</color>点<material=underline c=#5C5D60 h=2 event=terminology args=(1000021)>「充能」</material>。\n<material=underline c=#5C5D60 h=2 event=terminology args=(1000021)>「充能」</material>为满时，触发<material=underline c=#5C5D60 h=2 event=terminology args=(1000022)>「扩散电弧」</material>，造成<color=#F48800>{2}</color><material=underline c=#5C5D60 h=2 event=terminology args=(1000003)>「战术伤害」</material>。",
		maxLv = 3,
		type = 1,
		id = 700071206,
		extra_param = "",
		param = {
			{
				10,
				5,
				false,
				"%"
			},
			{
				200,
				0,
				false,
				"%"
			}
		}
	},
	[700071207] = {
		description = "击败敌人时，获得最大生命值<color=#F48800>{1}</color>的护盾<material=underline c=#5C5D60 h=2 event=terminology args=(1000023)>「阻抗」</material>，持续<color=#F48800>{2}</color>秒，该效果每{3}秒最多触发一次。",
		maxLv = 3,
		type = 1,
		id = 700071207,
		extra_param = "",
		param = {
			{
				10,
				5,
				false,
				"%"
			},
			{
				6,
				0,
				false,
				""
			},
			{
				5,
				0,
				false,
				""
			}
		}
	},
	[700071208] = {
		description = "进入战斗时，获得等同于已损失生命值的<color=#F48800>{1}</color>的护盾<material=underline c=#5C5D60 h=2 event=terminology args=(1000023)>「阻抗」</material>，持续<color=#F48800>{2}</color>秒。",
		maxLv = 3,
		type = 1,
		id = 700071208,
		extra_param = "",
		param = {
			{
				50,
				20,
				false,
				"%"
			},
			{
				20,
				0,
				false,
				""
			}
		}
	},
	[700071209] = {
		description = "奥义获得率提高<color=#F48800>{1}</color>，奥义的冷却时间缩短<color=#F48800>{2}</color>。",
		maxLv = 3,
		type = 1,
		id = 700071209,
		extra_param = "",
		param = {
			{
				40,
				10,
				false,
				"%"
			},
			{
				50,
				0,
				false,
				"%"
			}
		}
	},
	[700071210] = {
		description = "<material=underline c=#5C5D60 h=2 event=terminology args=(1000022)>「扩散电弧」</material>每命中敌人1次，获得<color=#F48800>{1}</color>点奥义值。",
		maxLv = 3,
		type = 1,
		id = 700071210,
		extra_param = "",
		param = {
			{
				70,
				30,
				false,
				""
			}
		}
	},
	[700071211] = {
		description = "获得的护盾值提高<color=#F48800>{1}</color>。",
		maxLv = 3,
		type = 1,
		id = 700071211,
		extra_param = "",
		param = {
			{
				20,
				10,
				false,
				"%"
			}
		}
	},
	[700071212] = {
		description = "受到的伤害降低<color=#F48800>{1}</color>。",
		maxLv = 3,
		type = 1,
		id = 700071212,
		extra_param = "",
		param = {
			{
				12,
				6,
				false,
				"%"
			}
		}
	},
	[700071221] = {
		description = "<material=underline c=#5C5D60 h=2 event=terminology args=(1000022)>「扩散电弧」</material>到达最远处会返回。",
		maxLv = 1,
		type = 1,
		id = 700071221,
		extra_param = "",
		param = {}
	},
	[700071222] = {
		description = "拥有护盾时，每间隔<color=#F48800>{1}</color>秒触发一次<material=underline c=#5C5D60 h=2 event=terminology args=(1000022)>「扩散电弧」</material>。",
		maxLv = 1,
		type = 1,
		id = 700071222,
		extra_param = "",
		param = {
			{
				2,
				0,
				false,
				""
			}
		}
	},
	[700071223] = {
		description = "施放奥义后，连续触发<color=#F48800>{1}</color>次<material=underline c=#5C5D60 h=2 event=terminology args=(1000022)>「扩散电弧」</material>。",
		maxLv = 1,
		type = 1,
		id = 700071223,
		extra_param = "",
		param = {
			{
				3,
				0,
				false,
				""
			}
		}
	},
	[700071249] = {
		description = "流派3通用效果",
		maxLv = 1,
		type = 1,
		id = 700071249,
		extra_param = "",
		param = {}
	},
	[700071250] = {
		description = "使用战术指令时，在主控修正者位置处生成一个大型护罩和电流地形，持续<color=#F48800>15</color>秒；修正者在护罩内免疫伤害，并且每间隔0.5秒获得<color=#F48800>{1}</color>点<material=underline c=#5C5D60 h=2 event=terminology args=(1000021)>「充能」</material>，对敌人造成<color=#F48800>{2}</color><material=underline c=#5C5D60 h=2 event=terminology args=(1000003)>「战术伤害」</material>。\n<material=underline c=#5C5D60 h=2 event=terminology args=(1000021)>「充能」</material>为满时，触发<material=underline c=#5C5D60 h=2 event=terminology args=(1000022)>「扩散电弧」</material>，造成<color=#F48800>{3}</color><material=underline c=#5C5D60 h=2 event=terminology args=(1000003)>「战术伤害」</material>。",
		maxLv = 1,
		type = 1,
		id = 700071250,
		extra_param = "",
		param = {
			{
				40,
				0,
				false,
				""
			},
			{
				120,
				0,
				false,
				"%"
			},
			{
				200,
				0,
				false,
				"%"
			}
		}
	},
	[700071251] = {
		description = "施放普通攻击时，向前方射出1把<material=underline c=#5C5D60 h=2 event=terminology args=(1000031)>「利刃」</material>，造成<color=#F48800>{1}</color><material=underline c=#5C5D60 h=2 event=terminology args=(1000003)>「战术伤害」</material>。<material=underline c=#5C5D60 h=2 event=terminology args=(1000031)>「利刃」</material>命中时，有概率生成1把<material=underline c=#5C5D60 h=2 event=terminology args=(1000032)>「链刃」</material>，持续<color=#F48800>{2}</color>秒。",
		maxLv = 3,
		type = 1,
		id = 700071251,
		extra_param = "",
		param = {
			{
				90,
				30,
				false,
				"%"
			},
			{
				4,
				0,
				false,
				""
			}
		}
	},
	[700071252] = {
		description = "施放技能时，向前方射出3把<material=underline c=#5C5D60 h=2 event=terminology args=(1000031)>「利刃」</material>，造成<color=#F48800>{1}</color><material=underline c=#5C5D60 h=2 event=terminology args=(1000003)>「战术伤害」</material>。<material=underline c=#5C5D60 h=2 event=terminology args=(1000031)>「利刃」</material>命中时，有概率生成1把<material=underline c=#5C5D60 h=2 event=terminology args=(1000032)>「链刃」</material>，持续<color=#F48800>{2}</color>秒。",
		maxLv = 3,
		type = 1,
		id = 700071252,
		extra_param = "",
		param = {
			{
				90,
				30,
				false,
				"%"
			},
			{
				4,
				0,
				false,
				""
			}
		}
	},
	[700071253] = {
		description = "受击时，生成1把<material=underline c=#5C5D60 h=2 event=terminology args=(1000032)>「链刃」</material>，持续<color=#F48800>{1}</color>秒，并提高所有<material=underline c=#5C5D60 h=2 event=terminology args=(1000032)>「链刃」</material>转速，持续<color=#F48800>{2}</color>秒。",
		maxLv = 3,
		type = 1,
		id = 700071253,
		extra_param = "",
		param = {
			{
				5,
				2,
				false,
				""
			},
			{
				3,
				1,
				false,
				""
			}
		}
	},
	[700071254] = {
		description = "所有<material=underline c=#5C5D60 h=2 event=terminology args=(1000032)>「链刃」</material>持续时间延长<color=#F48800>{1}</color>秒。",
		maxLv = 3,
		type = 1,
		id = 700071254,
		extra_param = "",
		param = {
			{
				2,
				0.5,
				false,
				""
			}
		}
	},
	[700071255] = {
		description = "施放奥义后，生成<material=underline c=#5C5D60 h=2 event=terminology args=(1000032)>「链刃」</material>数量至上限，持续<color=#F48800>{1}</color>秒，并提高所有<material=underline c=#5C5D60 h=2 event=terminology args=(1000032)>「链刃」</material>转速，持续<color=#F48800>{2}</color>秒。",
		maxLv = 3,
		type = 1,
		id = 700071255,
		extra_param = "",
		param = {
			{
				5,
				2,
				false,
				""
			},
			{
				3,
				1,
				false,
				""
			}
		}
	},
	[700071256] = {
		description = "闪避时，提高所有<material=underline c=#5C5D60 h=2 event=terminology args=(1000032)>「链刃」</material>转速，持续<color=#F48800>{1}</color>秒。",
		maxLv = 3,
		type = 1,
		id = 700071256,
		extra_param = "",
		param = {
			{
				1,
				0.5,
				false,
				""
			}
		}
	},
	[700071257] = {
		description = "进入零时空间、修正模式时，提高所有<material=underline c=#5C5D60 h=2 event=terminology args=(1000032)>「链刃」</material>转速，持续<color=#F48800>{1}</color>秒。",
		maxLv = 3,
		type = 1,
		id = 700071257,
		extra_param = "",
		param = {
			{
				4,
				2,
				false,
				""
			}
		}
	},
	[700071258] = {
		description = "生成<material=underline c=#5C5D60 h=2 event=terminology args=(1000032)>「链刃」</material>时，有<color=#F48800>{1}</color>的概率，额外再生成1把。",
		maxLv = 3,
		type = 1,
		id = 700071258,
		extra_param = "",
		param = {
			{
				10,
				5,
				false,
				"%"
			}
		}
	},
	[700071259] = {
		description = "<material=underline c=#5C5D60 h=2 event=terminology args=(1000031)>「利刃」</material>伤害降低<color=#F48800>{1}</color>，但不再被敌人阻挡。",
		maxLv = 3,
		type = 1,
		id = 700071259,
		extra_param = "",
		param = {
			{
				30,
				-5,
				false,
				"%"
			}
		}
	},
	[700071260] = {
		description = "极限闪避时，生成1把<material=underline c=#5C5D60 h=2 event=terminology args=(1000032)>「链刃」</material>，持续<color=#F48800>{1}</color>秒。",
		maxLv = 3,
		type = 1,
		id = 700071260,
		extra_param = "",
		param = {
			{
				5,
				2,
				false,
				""
			}
		}
	},
	[700071261] = {
		description = "<material=underline c=#5C5D60 h=2 event=terminology args=(1000032)>「链刃」</material>转速提高时，自身技能动作速度提高<color=#F48800>{1}</color>。",
		maxLv = 3,
		type = 1,
		id = 700071261,
		extra_param = "",
		param = {
			{
				20,
				10,
				false,
				"%"
			}
		}
	},
	[700071262] = {
		description = "闪避时，射出3把<material=underline c=#5C5D60 h=2 event=terminology args=(1000031)>「利刃」</material>，造成<color=#F48800>{1}</color><material=underline c=#5C5D60 h=2 event=terminology args=(1000003)>「战术伤害」</material>。<material=underline c=#5C5D60 h=2 event=terminology args=(1000031)>「利刃」</material>命中时，有概率生成1把<material=underline c=#5C5D60 h=2 event=terminology args=(1000032)>「链刃」</material>，持续<color=#F48800>{2}</color>秒。",
		maxLv = 3,
		type = 1,
		id = 700071262,
		extra_param = "",
		param = {
			{
				90,
				30,
				false,
				"%"
			},
			{
				4,
				0,
				false,
				""
			}
		}
	},
	[700071271] = {
		description = "<material=underline c=#5C5D60 h=2 event=terminology args=(1000032)>「链刃」</material>上限翻倍。",
		maxLv = 1,
		type = 1,
		id = 700071271,
		extra_param = "",
		param = {}
	},
	[700071272] = {
		description = "<material=underline c=#5C5D60 h=2 event=terminology args=(1000032)>「链刃」</material>命中时，也会触发<material=underline c=#5C5D60 h=2 event=terminology args=(1000031)>「利刃」</material>的概率额外效果。",
		maxLv = 1,
		type = 1,
		id = 700071272,
		extra_param = "",
		param = {}
	},
	[700071273] = {
		description = "<material=underline c=#5C5D60 h=2 event=terminology args=(1000032)>「链刃」</material>即将消失时，会向前方射出。",
		maxLv = 1,
		type = 1,
		id = 700071273,
		extra_param = "",
		param = {}
	},
	[700071299] = {
		description = "流派4通用效果",
		maxLv = 1,
		type = 1,
		id = 700071299,
		extra_param = "",
		param = {}
	},
	[700071300] = {
		description = "使用战术指令时，持续射出<material=underline c=#5C5D60 h=2 event=terminology args=(1000032)>「链刃」</material>，持续<color=#F48800>{1}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 700071300,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[700071301] = {
		description = "普通攻击命中时，对敌人附加等同于<color=#F48800>{1}</color>×当前普通攻击段数的<material=underline c=#5C5D60 h=2 event=terminology args=(1000041)>「侵蚀」</material>状态层数。",
		maxLv = 3,
		type = 1,
		id = 700071301,
		extra_param = "",
		param = {
			{
				10,
				5,
				false,
				""
			},
			{
				5,
				0,
				false,
				""
			},
			{
				2200,
				0,
				false,
				""
			},
			{
				50,
				0,
				false,
				""
			}
		}
	},
	[700071302] = {
		description = "闪避时，在闪避位置生产一个<material=underline c=#5C5D60 h=2 event=terminology args=(1000042)>「场域」</material>，持续<color=#F48800>{1}</color>秒，该效果每{2}秒最多触发一次。",
		maxLv = 3,
		type = 1,
		id = 700071302,
		extra_param = "",
		param = {
			{
				5,
				2,
				false,
				""
			},
			{
				6,
				0,
				false,
				""
			}
		}
	},
	[700071303] = {
		description = "极限闪避时，以<color=#F48800>{1}</color>倍率结算一次敌人的<material=underline c=#5C5D60 h=2 event=terminology args=(1000041)>「侵蚀」</material>结算伤害，该结算不会减少<material=underline c=#5C5D60 h=2 event=terminology args=(1000041)>「侵蚀」</material>层数。",
		maxLv = 3,
		type = 1,
		id = 700071303,
		extra_param = "",
		param = {
			{
				100,
				50,
				false,
				"%"
			}
		}
	},
	[700071304] = {
		description = "<material=underline c=#5C5D60 h=2 event=terminology args=(1000041)>「侵蚀」</material>结算伤害时层数减半改变为减少<color=#F48800>{1}</color>。",
		maxLv = 3,
		type = 1,
		id = 700071304,
		extra_param = "",
		param = {
			{
				35,
				-5,
				false,
				"%"
			}
		}
	},
	[700071305] = {
		description = "每段技能命中时，敌人下一次<material=underline c=#5C5D60 h=2 event=terminology args=(1000041)>「侵蚀」</material>结算伤害时，有<color=#F48800>{1}</color>概率不会减少层数，未触发时概率叠加，触发后重置概率。",
		maxLv = 3,
		type = 1,
		id = 700071305,
		extra_param = "",
		param = {
			{
				1.5,
				0.6,
				false,
				"%"
			}
		}
	},
	[700071306] = {
		description = "受击时，以<color=#F48800>{1}</color>倍率结算一次敌人的<material=underline c=#5C5D60 h=2 event=terminology args=(1000041)>「侵蚀」</material>结算伤害，该结算不会减少<material=underline c=#5C5D60 h=2 event=terminology args=(1000041)>「侵蚀」</material>层数。",
		maxLv = 3,
		type = 1,
		id = 700071306,
		extra_param = "",
		param = {
			{
				120,
				60,
				false,
				"%"
			}
		}
	},
	[700071307] = {
		description = "处于<material=underline c=#5C5D60 h=2 event=terminology args=(1000041)>「侵蚀」</material>状态的敌人，攻击力降低<color=#F48800>{1}</color>。",
		maxLv = 3,
		type = 1,
		id = 700071307,
		extra_param = "",
		param = {
			{
				20,
				15,
				false,
				"%"
			}
		}
	},
	[700071308] = {
		description = "<material=underline c=#5C5D60 h=2 event=terminology args=(1000042)>「场域」</material>的持续时间延长<color=#F48800>{1}</color>秒。",
		maxLv = 3,
		type = 1,
		id = 700071308,
		extra_param = "",
		param = {
			{
				3,
				1,
				false,
				""
			}
		}
	},
	[700071309] = {
		description = "<material=underline c=#5C5D60 h=2 event=terminology args=(1000041)>「侵蚀」</material>结算伤害时，若层数不高于<color=#F48800>{1}</color>，会对附近的敌人附加<color=#F48800>{2}</color>层<material=underline c=#5C5D60 h=2 event=terminology args=(1000041)>「侵蚀」</material>状态。",
		maxLv = 3,
		type = 1,
		id = 700071309,
		extra_param = "",
		param = {
			{
				300,
				0,
				false,
				""
			},
			{
				200,
				50,
				false,
				""
			}
		}
	},
	[700071310] = {
		description = "普通攻击动作速度提高<color=#F48800>{1}</color>。",
		maxLv = 3,
		type = 1,
		id = 700071310,
		extra_param = "",
		param = {
			{
				30,
				20,
				false,
				"%"
			}
		}
	},
	[700071311] = {
		description = "<material=underline c=#5C5D60 h=2 event=terminology args=(1000041)>「侵蚀」</material>结算伤害的间隔时间缩短<color=#F48800>{1}</color>秒。",
		maxLv = 3,
		type = 1,
		id = 700071311,
		extra_param = "",
		param = {
			{
				1,
				0.5,
				false,
				""
			}
		}
	},
	[700071312] = {
		description = "普通攻击每命中<color=#F48800>{1}</color>次，目标处会生成一个<material=underline c=#5C5D60 h=2 event=terminology args=(1000042)>「场域」</material>，持续<color=#F48800>{2}</color>秒，该效果每{3}秒最多触发一次。",
		maxLv = 3,
		type = 1,
		id = 700071312,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				""
			},
			{
				5,
				2.5,
				false,
				""
			},
			{
				6,
				0,
				false,
				""
			}
		}
	},
	[700071321] = {
		description = "普通攻击命中时，有{1}的概率以<color=#F48800>{2}</color>倍率结算一次敌人的<material=underline c=#5C5D60 h=2 event=terminology args=(1000041)>「侵蚀」</material>结算伤害，该结算不会减少<material=underline c=#5C5D60 h=2 event=terminology args=(1000041)>「侵蚀」</material>层数。",
		maxLv = 1,
		type = 1,
		id = 700071321,
		extra_param = "",
		param = {
			{
				10,
				0,
				false,
				"%"
			},
			{
				150,
				0,
				false,
				"%"
			}
		}
	},
	[700071322] = {
		description = "处于<material=underline c=#5C5D60 h=2 event=terminology args=(1000041)>「侵蚀」</material>状态的敌人攻击时，会以<color=#F48800>{1}</color>倍率结算一次敌人的<material=underline c=#5C5D60 h=2 event=terminology args=(1000041)>「侵蚀」</material>结算伤害，该结算不会减少<material=underline c=#5C5D60 h=2 event=terminology args=(1000041)>「侵蚀」</material>层数。",
		maxLv = 1,
		type = 1,
		id = 700071322,
		extra_param = "",
		param = {
			{
				150,
				0,
				false,
				"%"
			}
		}
	},
	[700071323] = {
		description = "自身周围始终存在<material=underline c=#5C5D60 h=2 event=terminology args=(1000042)>「场域」</material>。",
		maxLv = 1,
		type = 1,
		id = 700071323,
		extra_param = "",
		param = {
			{
				0.6,
				0,
				false,
				""
			},
			{
				60,
				0,
				false,
				""
			}
		}
	},
	[700071349] = {
		description = "流派5通用",
		maxLv = 1,
		type = 1,
		id = 700071349,
		extra_param = "",
		param = {}
	},
	[700071350] = {
		description = "使用战术指令时，每间隔<color=#F48800>{1}</color>秒，结算附近所有敌人的<material=underline c=#5C5D60 h=2 event=terminology args=(1000041)>「侵蚀」</material>结算伤害，该结算不会减少<material=underline c=#5C5D60 h=2 event=terminology args=(1000041)>「侵蚀」</material>层数，持续<color=#F48800>{2}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 700071350,
		extra_param = "",
		param = {
			{
				1,
				0,
				false,
				""
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[700071351] = {
		description = "施放普通攻击时，会向锁定的敌人发射1个<material=underline c=#5C5D60 h=2 event=terminology args=(1000051)>「冰锥」</material>，造成<color=#F48800>{1}</color><material=underline c=#5C5D60 h=2 event=terminology args=(1000003)>「战术伤害」</material>，并附加1层<material=underline c=#5C5D60 h=2 event=terminology args=(1000052)>「寒冷」</material>状态。",
		maxLv = 3,
		type = 1,
		id = 700071351,
		extra_param = "",
		param = {
			{
				100,
				30,
				false,
				"%"
			}
		}
	},
	[700071352] = {
		description = "施放技能时，会向锁定的敌人发射3个<material=underline c=#5C5D60 h=2 event=terminology args=(1000051)>「冰锥」</material>，造成<color=#F48800>{1}</color><material=underline c=#5C5D60 h=2 event=terminology args=(1000003)>「战术伤害」</material>，并附加1层<material=underline c=#5C5D60 h=2 event=terminology args=(1000052)>「寒冷」</material>状态。",
		maxLv = 3,
		type = 1,
		id = 700071352,
		extra_param = "",
		param = {
			{
				70,
				20,
				false,
				"%"
			}
		}
	},
	[700071353] = {
		description = "<material=underline c=#5C5D60 h=2 event=terminology args=(1000051)>「冰锥」</material>对处于冰冻状态的敌人造成<color=#F48800>{1}</color>倍伤害。",
		maxLv = 3,
		type = 1,
		id = 700071353,
		extra_param = "",
		param = {
			{
				3,
				1,
				false,
				""
			}
		}
	},
	[700071354] = {
		description = "敌人的冰冻状态持续时间延长<color=#F48800>{1}</color>秒。",
		maxLv = 3,
		type = 1,
		id = 700071354,
		extra_param = "",
		param = {
			{
				1,
				0.4,
				false,
				""
			}
		}
	},
	[700071355] = {
		description = "受击时，对攻击者附加冰冻状态，持续{1}秒，并触发<material=underline c=#5C5D60 h=2 event=terminology args=(1000053)>「冰爆」</material>，造成<color=#F48800>{2}</color>点范围<material=underline c=#5C5D60 h=2 event=terminology args=(1000003)>「战术伤害」</material>。",
		maxLv = 3,
		type = 1,
		id = 700071355,
		extra_param = "",
		param = {
			{
				3,
				0,
				false,
				""
			},
			{
				300,
				300,
				false,
				"%"
			}
		}
	},
	[700071356] = {
		description = "极限闪避时，对攻击者附加冰冻状态，持续{1}秒，并触发<material=underline c=#5C5D60 h=2 event=terminology args=(1000053)>「冰爆」</material>，造成<color=#F48800>{2}</color>点范围<material=underline c=#5C5D60 h=2 event=terminology args=(1000003)>「战术伤害」</material>。",
		maxLv = 3,
		type = 1,
		id = 700071356,
		extra_param = "",
		param = {
			{
				3,
				0,
				false,
				""
			},
			{
				200,
				200,
				false,
				"%"
			}
		}
	},
	[700071357] = {
		description = "闪避时，在目标位置生成<material=underline c=#5C5D60 h=2 event=terminology args=(1000054)>「冰霜地形」</material>，持续<color=#F48800>{1}</color>秒，该效果每{2}秒最多触发一次。",
		maxLv = 3,
		type = 1,
		id = 700071357,
		extra_param = "",
		param = {
			{
				6,
				2,
				false,
				""
			},
			{
				3,
				0,
				false,
				""
			}
		}
	},
	[700071358] = {
		description = "对未处于<material=underline c=#5C5D60 h=2 event=terminology args=(1000052)>「寒冷」</material>状态的敌人附加<material=underline c=#5C5D60 h=2 event=terminology args=(1000052)>「寒冷」</material>状态时，额外附加<color=#F48800>{1}</color>层。",
		maxLv = 3,
		type = 1,
		id = 700071358,
		extra_param = "",
		param = {
			{
				10,
				2,
				false,
				""
			}
		}
	},
	[700071359] = {
		description = "敌人被击败时，<color=#F48800>{1}</color>的概率生成一片<material=underline c=#5C5D60 h=2 event=terminology args=(1000054)>「冰霜地形」</material>，持续<color=#F48800>{2}</color>秒，精英和首领敌人被击败时100%的概率生成<material=underline c=#5C5D60 h=2 event=terminology args=(1000054)>「冰霜地形」</material>。",
		maxLv = 3,
		type = 1,
		id = 700071359,
		extra_param = "",
		param = {
			{
				20,
				0,
				false,
				"%"
			},
			{
				6,
				2,
				false,
				""
			}
		}
	},
	[700071360] = {
		description = "修正者处于<material=underline c=#5C5D60 h=2 event=terminology args=(1000054)>「冰霜地形」</material>范围内时，每<color=#F48800>{1}</color>秒恢复<color=#F48800>{2}</color>点怒气、能量、神能，或<color=#F48800>{3}</color>个印记。",
		maxLv = 3,
		type = 1,
		id = 700071360,
		extra_param = "",
		param = {
			{
				5,
				-1,
				false,
				""
			},
			{
				30,
				0,
				false,
				""
			},
			{
				1,
				0,
				false,
				""
			}
		}
	},
	[700071361] = {
		description = "<material=underline c=#5C5D60 h=2 event=terminology args=(1000053)>「冰爆」</material>会对命中的敌人附加<color=#F48800>{1}</color>层<material=underline c=#5C5D60 h=2 event=terminology args=(1000052)>「寒冷」</material>状态。",
		maxLv = 3,
		type = 1,
		id = 700071361,
		extra_param = "",
		param = {
			{
				10,
				2,
				false,
				""
			}
		}
	},
	[700071362] = {
		description = "每冰冻一个敌人，随机减少自身1个技能<color=#F48800>{1}</color>秒的冷却时间。",
		maxLv = 3,
		type = 1,
		id = 700071362,
		extra_param = "",
		param = {
			{
				2,
				1,
				false,
				""
			}
		}
	},
	[700071371] = {
		description = "处于冰冻状态的敌人被击败时，不会立即退场，每间隔<color=#F48800>{1}</color>秒会向周围发射<material=underline c=#5C5D60 h=2 event=terminology args=(1000051)>「冰锥」</material>，造成<color=#F48800>{2}</color><material=underline c=#5C5D60 h=2 event=terminology args=(1000003)>「战术伤害」</material>，持续至冰冻状态结束。",
		maxLv = 1,
		type = 1,
		id = 700071371,
		extra_param = "",
		param = {
			{
				0.5,
				0,
				false,
				""
			},
			{
				60,
				0,
				false,
				"%"
			}
		}
	},
	[700071372] = {
		description = "处于冰冻状态的敌人会生成一片<material=underline c=#5C5D60 h=2 event=terminology args=(1000054)>「冰霜地形」</material>，持续至冰冻状态结束。",
		maxLv = 1,
		type = 1,
		id = 700071372,
		extra_param = "",
		param = {}
	},
	[700071373] = {
		description = "处于冰冻状态的敌人生命值低于<color=#F48800>{1}</color>时会立即被击败，精英和首领敌人为<color=#F48800>{2}</color>。",
		maxLv = 1,
		type = 1,
		id = 700071373,
		extra_param = "",
		param = {
			{
				25,
				0,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				"%"
			}
		}
	},
	[700071399] = {
		description = "流派6通用效果",
		maxLv = 1,
		type = 1,
		id = 700071399,
		extra_param = "",
		param = {}
	},
	[700071400] = {
		description = "使用战术指令时，每间隔<color=#F48800>{1}</color>秒，在区域内随机降下巨型<material=underline c=#5C5D60 h=2 event=terminology args=(1000051)>「冰锥」</material>，每次命中造成<color=#F48800>{2}</color><material=underline c=#5C5D60 h=2 event=terminology args=(1000003)>「战术伤害」</material>，并附加3层<material=underline c=#5C5D60 h=2 event=terminology args=(1000052)>「寒冷」</material>状态，持续<color=#F48800>{3}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 700071400,
		extra_param = "",
		param = {
			{
				0.2,
				0,
				false,
				""
			},
			{
				120,
				0,
				false,
				"%"
			},
			{
				10,
				0,
				false,
				""
			}
		}
	},
	[700071412] = {
		description = "双重12",
		maxLv = 1,
		type = 1,
		id = 700071412,
		extra_param = "",
		param = {}
	},
	[700071413] = {
		description = "触发<material=underline c=#5C5D60 h=2 event=terminology args=(1000002)>「过载」</material>时，获得<color=#F48800>{1}</color>最大生命值的护盾<material=underline c=#5C5D60 h=2 event=terminology args=(1000023)>「阻抗」</material>，持续<color=#F48800>{2}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 700071413,
		extra_param = "",
		param = {
			{
				1,
				0,
				false,
				"%"
			},
			{
				1,
				0,
				false,
				""
			}
		}
	},
	[700071414] = {
		description = "<material=underline c=#5C5D60 h=2 event=terminology args=(1000032)>「链刃」</material>命中时，<material=underline c=#5C5D60 h=2 event=terminology args=(1000001)>「锁定」</material>的触发时间缩短<color=#F48800>{1}</color>秒。",
		maxLv = 1,
		type = 1,
		id = 700071414,
		extra_param = "",
		param = {
			{
				0.1,
				0,
				false,
				""
			}
		}
	},
	[700071415] = {
		description = "<material=underline c=#5C5D60 h=2 event=terminology args=(1000002)>「过载」</material>命中时，还会对命中的敌人附加<color=#F48800>{1}</color>层<material=underline c=#5C5D60 h=2 event=terminology args=(1000041)>「侵蚀」</material>。",
		maxLv = 1,
		type = 1,
		id = 700071415,
		extra_param = "",
		param = {
			{
				30,
				0,
				false,
				""
			}
		}
	},
	[700071416] = {
		description = "<material=underline c=#5C5D60 h=2 event=terminology args=(1000054)>「冰霜地形」</material>每间隔{2}秒，会触发<material=underline c=#5C5D60 h=2 event=terminology args=(1000002)>「过载」</material>，造成<color=#F48800>{1}</color><material=underline c=#5C5D60 h=2 event=terminology args=(1000003)>「战术伤害」</material>。",
		maxLv = 1,
		type = 1,
		id = 700071416,
		extra_param = "",
		param = {
			{
				300,
				0,
				false,
				"%"
			},
			{
				1,
				0,
				false,
				""
			}
		}
	},
	[700071423] = {
		description = "双重23",
		maxLv = 1,
		type = 1,
		id = 700071423,
		extra_param = "",
		param = {}
	},
	[700071424] = {
		description = "双重24",
		maxLv = 1,
		type = 1,
		id = 700071424,
		extra_param = "",
		param = {}
	},
	[700071425] = {
		description = "双重25",
		maxLv = 1,
		type = 1,
		id = 700071425,
		extra_param = "",
		param = {}
	},
	[700071426] = {
		description = "双重26",
		maxLv = 1,
		type = 1,
		id = 700071426,
		extra_param = "",
		param = {}
	},
	[700071434] = {
		description = "拥有护盾时，提高<material=underline c=#5C5D60 h=2 event=terminology args=(1000032)>「链刃」</material>转速。",
		maxLv = 1,
		type = 1,
		id = 700071434,
		extra_param = "",
		param = {}
	},
	[700071435] = {
		description = "<material=underline c=#5C5D60 h=2 event=terminology args=(1000041)>「侵蚀」</material>结算伤害时，恢复全队伍等同于层数的奥义值。",
		maxLv = 1,
		type = 1,
		id = 700071435,
		extra_param = "",
		param = {
			{
				100,
				0,
				false,
				""
			}
		}
	},
	[700071436] = {
		description = "拥有护盾时，每间隔<color=#F48800>{1}</color>秒发射1个<material=underline c=#5C5D60 h=2 event=terminology args=(1000051)>「冰锥」</material>，造成<color=#F48800>{2}</color><material=underline c=#5C5D60 h=2 event=terminology args=(1000003)>「战术伤害」</material>，并附加1层<material=underline c=#5C5D60 h=2 event=terminology args=(1000052)>「寒冷」</material>状态。",
		maxLv = 1,
		type = 1,
		id = 700071436,
		extra_param = "",
		param = {
			{
				1,
				0,
				false,
				""
			},
			{
				100,
				30,
				false,
				"%"
			}
		}
	},