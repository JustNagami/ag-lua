﻿return {
	[1001] = {
		pool_type = 1,
		pool_id = 1001,
		pool_name = "夜宴之邀",
		pool_sign = "",
		detail_note = "一、核心奖励：\n\n「海上的私语」*1\n「蓝染雪枝」*1\n「精确探测凭证x10」*1\n「钥从探测凭证x5」*2\n「神识凝晶x10」*1\n「极致灵泉萃取液x96」*1\n「高级赋能模块x40」*1\n\n\n二、活动规则\n\n1.每次邀约需要消耗「特邀贵宾函」，「特邀贵宾函」可使用移转之辉或移转之花兑换，<color=#F6841D>使用移转之花兑换「特邀贵宾函」会根据当前兑换次数获得不同的兑换折扣</color>。\n2.每次邀约时将会通过概率决定抽取到的奖励类型，核心奖励的概率为<color=#F6841D>1%</color>，其他奖励的概率为<color=#F6841D>99%</color>，每次邀约均会获取一个奖励，每<color=#F6841D>10</color>次邀约中至少可以获得一个核心奖励。<color=#F6841D>奖励获取后不会再次被抽取</color>，至多<color=#F6841D>80</color>次邀约必定获得卡池内全部奖励。\n3.使用移转之辉购买「特邀贵宾函」单价为移转之辉*120，合计可兑换80张。\n4.使用移转之花购买「特邀贵宾函」单价为移转之花*120，可以1折折扣兑换20张（单价移转之花*12），2折折扣兑换10张（单价移转之花*24），3折折扣兑换10张（单价移转之花*36），4折折扣兑换10张（单价移转之花*48），6折折扣兑换10张（单价移转之花*72），8折折扣兑换10张（单价移转之花*96），原价兑换10张，合计可兑换80张。\n\n三、核心奖励概率说明：\n\n1.当抽取到核心奖励时，各核心奖励初始概率如下：\n\n「海上的私语」-0.30%\n「蓝染雪枝」-30.00%\n「精确探测凭证x10」-2.70%\n「钥从探测凭证x5」-10.00%\n「神识凝晶x10」-12.00%\n「极致灵泉萃取液x96」-20.00%\n「高级赋能模块x40」-25.00%\n\n2.每次抽取到核心奖励时，核心奖励奖池内各个奖励将会由各奖励所占权重实时计算概率。计算公式如下：\n\n<color=#F6841D>特定奖励获取概率=特定奖励剩余数量*特定奖励权重/（核心奖励奖池内剩余奖励数量*各奖励对应权重）之和</color>\n\n各奖励权重如下：\n\n「海上的私语」\t   3\n「蓝染雪枝」\t   300\n「精确探测凭证x10」\t 27\n「钥从探测凭证x5」\t  50\n「神识凝晶x10」\t  120\n「极致灵泉萃取液x96」\t 200\n「高级赋能模块x40」\t 250\n\n例如：\n当核心奖励奖池内「蓝染雪枝」、「高级赋能模块x40」、「极致灵泉萃取液x96」已抽取完成，此时再次抽取到核心奖励时，奖励为「海上的私语」的概率\n=3*1/（3*1+27*1+50*2+120*1）=1.20%\n当核心奖励奖池内仅剩余「海上的私语」、「精确探测凭证x10」未被抽取，此时再次抽取到核心奖励时，奖励为「海上的私语」的概率\n=3*1/（3*1+27*1）=10.00%\n即随着抽取行为的进行，所有物品的概率均会做实时的波动。",
		poll_picture_select = "",
		poll_picture = "",
		activity_id = {
			182221
		},
		cost_once = {
			53030,
			1
		},
		cost_ten_times = {
			53030,
			10
		},
		stage_list = {
			1
		},
		payment = {
			300000014,
			300000013,
			300000012,
			300000011,
			300000010,
			300000009,
			300000008,
			300000007
		},
		payment_free = {
			300000006
		},
		main_icon_info = {
			{
				113,
				2020
			},
			{
				120,
				107602
			}
		},
		icon_info = {
			{
				108,
				90001
			},
			{
				109,
				90002
			},
			{
				110,
				90003
			},
			{
				111,
				90004
			},
			{
				112,
				90005
			}
		}
	},
	[1002] = {
		pool_type = 2,
		pool_id = 1002,
		pool_name = "夜宴之邀",
		pool_sign = "",
		detail_note = "一、核心奖励：\n\n「暮色珍珠」*1\n「精确探测凭证x5」*1\n「聚合权能晶体x24」*1\n「重构秘仪x20」*1\n\n\n二、活动规则\n\n1.每次邀约需要消耗「宴会邀请函」，「宴会邀请函」可使用移转之辉或移转之花兑换，<color=#F6841D>使用移转之花兑换「宴会邀请函」会根据当前兑换次数获得不同的兑换折扣</color>。\n2.每次邀约时将会通过概率决定抽取到的奖励类型，核心奖励的概率为<color=#F6841D>1%</color>，其他奖励的概率为<color=#F6841D>99%</color>，每次邀约均会获取一个奖励，每<color=#F6841D>10</color>次邀约中至少可以获得一个核心奖励。<color=#F6841D>奖励获取后不会再次被抽取</color>，至多<color=#F6841D>40</color>次邀约必定获得卡池内全部奖励。\n3.使用移转之辉购买「宴会邀请函」单价为移转之辉*60，合计可兑换40张。\n4.使用移转之花购买「宴会邀请函」单价为移转之花*60，可以1折折扣兑换10张（单价移转之花*6），4折折扣兑换10张（单价移转之花*24），8折折扣兑换10张（单价移转之花*48），原价兑换10张，合计可兑换40张。\n\n三、核心奖励概率说明：\n\n1.当抽取到核心奖励时，各核心奖励初始概率如下：\n\n「暮色珍珠」-2.50%\n「精确探测凭证x5」-7.50%\n「聚合权能晶体x24」-40.00%\n「重构秘仪x20」-50.00%\n\n2.每次抽取到核心奖励时，核心奖励奖池内各个奖励将会由各奖励所占权重实时计算概率。计算公式如下：\n\n<color=#F6841D>特定奖励获取概率=特定奖励剩余数量*特定奖励权重/（核心奖励奖池内剩余奖励数量*各奖励对应权重）之和</color>\n\n各奖励权重如下：\n\n「暮色珍珠」\t1\n「精确探测凭证x5」\t3\n「聚合权能晶体x24」\t16\n「重构秘仪x20」\t 20\n\n例如：\n当核心奖励奖池内「重构秘仪x20」、「聚合权能晶体x24」已抽取完成，此时再次抽取到核心奖励时，奖励为「暮色珍珠」的概率\n=1*1/（1*1+3*1）=25.00%\n即随着抽取行为的进行，所有物品的概率均会做实时的波动。",
		poll_picture_select = "",
		poll_picture = "",
		activity_id = {
			182222
		},
		cost_once = {
			53031,
			1
		},
		cost_ten_times = {
			53031,
			10
		},
		stage_list = {
			1
		},
		payment = {
			300000005,
			300000004,
			300000003,
			300000002
		},
		payment_free = {
			300000001
		},
		main_icon_info = {
			{
				208,
				6001
			}
		},
		icon_info = {
			{
				207,
				38
			},
			{
				206,
				41303
			},
			{
				205,
				40701
			}
		}
	},
	[1003] = {
		pool_type = 1,
		pool_id = 1003,
		pool_name = "夜宴之邀",
		pool_sign = "",
		detail_note = "重复获得<color=#F6841D>「海上的私语」、「蓝染雪枝」、「庚辰·叹气」、「庚辰·喝茶」、「庚辰·疑惑」、「庚辰·点赞」、「庚辰·敲打」</color>时将在获得时自动转化为移转之辉\n<color=#F6841D>「海上的私语」</color>转化为<color=#F6841D>1000</color>移转之辉\n<color=#F6841D>「蓝染雪枝」</color>转化为<color=#F6841D>50</color>移转之辉\n<color=#F6841D>「庚辰·叹气」、「庚辰·喝茶」、「庚辰·疑惑」、「庚辰·点赞」、「庚辰·敲打」</color>转化为<color=#F6841D>20</color>移转之辉\n\n一、核心奖励：\n\n「海上的私语」*1\n「蓝染雪枝」*1\n「精确探测凭证x10」*1\n「钥从探测凭证x5」*2\n「神识凝晶x10」*1\n「极致灵泉萃取液x96」*1\n「高级赋能模块x40」*1\n\n\n二、活动规则\n\n1.每次邀约需要消耗「特邀贵宾函」，「特邀贵宾函」可使用移转之辉或移转之花兑换，<color=#F6841D>使用移转之花兑换「特邀贵宾函」会根据当前兑换次数获得不同的兑换折扣</color>。\n2.每次邀约时将会通过概率决定抽取到的奖励类型，核心奖励的概率为<color=#F6841D>1%</color>，其他奖励的概率为<color=#F6841D>99%</color>，每次邀约均会获取一个奖励，每<color=#F6841D>10</color>次邀约中至少可以获得一个核心奖励。<color=#F6841D>奖励获取后不会再次被抽取</color>，至多<color=#F6841D>80</color>次邀约必定获得卡池内全部奖励。\n3.使用移转之辉购买「特邀贵宾函」单价为移转之辉*120，合计可兑换80张。\n4.使用移转之花购买「特邀贵宾函」单价为移转之花*120，可以1折折扣兑换20张（单价移转之花*12），2折折扣兑换10张（单价移转之花*24），3折折扣兑换10张（单价移转之花*36），4折折扣兑换10张（单价移转之花*48），6折折扣兑换10张（单价移转之花*72），8折折扣兑换10张（单价移转之花*96），原价兑换10张，合计可兑换80张。\n\n三、核心奖励概率说明：\n\n1.当抽取到核心奖励时，各核心奖励初始概率如下：\n\n「海上的私语」-0.30%\n「蓝染雪枝」-30.00%\n「精确探测凭证x10」-2.70%\n「钥从探测凭证x5」-10.00%\n「神识凝晶x10」-12.00%\n「极致灵泉萃取液x96」-20.00%\n「高级赋能模块x40」-25.00%\n\n2.每次抽取到核心奖励时，核心奖励奖池内各个奖励将会由各奖励所占权重实时计算概率。计算公式如下：\n\n<color=#F6841D>特定奖励获取概率=特定奖励剩余数量*特定奖励权重/（核心奖励奖池内剩余奖励数量*各奖励对应权重）之和</color>\n\n各奖励权重如下：\n\n「海上的私语」\t   3\n「蓝染雪枝」\t   300\n「精确探测凭证x10」\t 27\n「钥从探测凭证x5」\t  50\n「神识凝晶x10」\t  120\n「极致灵泉萃取液x96」\t 200\n「高级赋能模块x40」\t 250\n\n例如：\n当核心奖励奖池内「蓝染雪枝」、「高级赋能模块x40」、「极致灵泉萃取液x96」已抽取完成，此时再次抽取到核心奖励时，奖励为「海上的私语」的概率\n=3*1/（3*1+27*1+50*2+120*1）=1.20%\n当核心奖励奖池内仅剩余「海上的私语」、「精确探测凭证x10」未被抽取，此时再次抽取到核心奖励时，奖励为「海上的私语」的概率\n=3*1/（3*1+27*1）=10.00%\n即随着抽取行为的进行，所有物品的概率均会做实时的波动。",
		poll_picture_select = "",
		poll_picture = "",
		activity_id = {
			272221
		},
		cost_once = {
			53109,
			1
		},
		cost_ten_times = {
			53109,
			10
		},
		stage_list = {
			1
		},
		payment = {
			301000014,
			301000013,
			301000012,
			301000011,
			301000010,
			301000009,
			301000008,
			301000007
		},
		payment_free = {
			301000006
		},
		main_icon_info = {
			{
				313,
				2020
			},
			{
				320,
				107602
			}
		},
		icon_info = {
			{
				308,
				90001
			},
			{
				309,
				90002
			},
			{
				310,
				90003
			},
			{
				311,
				90004
			},
			{
				312,
				90005
			}
		}
	},
	[1004] = {
		pool_type = 2,
		pool_id = 1004,
		pool_name = "夜宴之邀",
		pool_sign = "",
		detail_note = "重复获得<color=#F6841D>「暮色珍珠」</color>时将在获得时自动转化为移转之辉\n<color=#F6841D>「暮色珍珠」</color>转化为<color=#F6841D>500</color>移转之辉\n\n一、核心奖励：\n\n「暮色珍珠」*1\n「精确探测凭证x5」*1\n「聚合权能晶体x24」*1\n「重构秘仪x20」*1\n\n\n二、活动规则\n\n1.每次邀约需要消耗「宴会邀请函」，「宴会邀请函」可使用移转之辉或移转之花兑换，<color=#F6841D>使用移转之花兑换「宴会邀请函」会根据当前兑换次数获得不同的兑换折扣</color>。\n2.每次邀约时将会通过概率决定抽取到的奖励类型，核心奖励的概率为<color=#F6841D>1%</color>，其他奖励的概率为<color=#F6841D>99%</color>，每次邀约均会获取一个奖励，每<color=#F6841D>10</color>次邀约中至少可以获得一个核心奖励。<color=#F6841D>奖励获取后不会再次被抽取</color>，至多<color=#F6841D>40</color>次邀约必定获得卡池内全部奖励。\n3.使用移转之辉购买「宴会邀请函」单价为移转之辉*60，合计可兑换40张。\n4.使用移转之花购买「宴会邀请函」单价为移转之花*60，可以1折折扣兑换10张（单价移转之花*6），4折折扣兑换10张（单价移转之花*24），8折折扣兑换10张（单价移转之花*48），原价兑换10张，合计可兑换40张。\n\n三、核心奖励概率说明：\n\n1.当抽取到核心奖励时，各核心奖励初始概率如下：\n\n「暮色珍珠」-2.50%\n「精确探测凭证x5」-7.50%\n「聚合权能晶体x24」-40.00%\n「重构秘仪x20」-50.00%\n\n2.每次抽取到核心奖励时，核心奖励奖池内各个奖励将会由各奖励所占权重实时计算概率。计算公式如下：\n\n<color=#F6841D>特定奖励获取概率=特定奖励剩余数量*特定奖励权重/（核心奖励奖池内剩余奖励数量*各奖励对应权重）之和</color>\n\n各奖励权重如下：\n\n「暮色珍珠」\t1\n「精确探测凭证x5」\t3\n「聚合权能晶体x24」\t16\n「重构秘仪x20」\t 20\n\n例如：\n当核心奖励奖池内「重构秘仪x20」、「聚合权能晶体x24」已抽取完成，此时再次抽取到核心奖励时，奖励为「暮色珍珠」的概率\n=1*1/（1*1+3*1）=25.00%\n即随着抽取行为的进行，所有物品的概率均会做实时的波动。",
		poll_picture_select = "",
		poll_picture = "",
		activity_id = {
			272222
		},
		cost_once = {
			53110,
			1
		},
		cost_ten_times = {
			53110,
			10
		},
		stage_list = {
			1
		},
		payment = {
			301000005,
			301000004,
			301000003,
			301000002
		},
		payment_free = {
			301000001
		},
		main_icon_info = {
			{
				408,
				6001
			}
		},
		icon_info = {
			{
				407,
				38
			},
			{
				406,
				41303
			},
			{
				405,
				40701
			}
		}
	},
	[1005] = {
		pool_type = 1,
		pool_id = 1005,
		pool_name = "绘夜之诗",
		pool_sign = "T0_109502_banner_3",
		detail_note = "一、活动规则\n\n1.每次邀约需要消耗「羽之笺」，「羽之笺」可使用移转之辉或移转之花兑换，<color=#F6841D>使用移转之花兑换「羽之笺」会根据当前兑换次数获得不同的兑换折扣</color>。\n2.每次邀约时将会通过概率决定抽取到的奖励类型，核心奖励的概率为<color=#F6841D>1%</color>，其他奖励的概率为<color=#F6841D>99%</color>，每次邀约均会获取一个奖励，每<color=#F6841D>10</color>次邀约中至少可以获得一个核心奖励。<color=#F6841D>奖励获取后不会再次被抽取</color>，至多<color=#F6841D>80</color>次邀约必定获得卡池内全部奖励。\n3.使用移转之辉购买「羽之笺」单价为移转之辉*120，合计可兑换80张。\n4.使用移转之花购买「羽之笺」单价为移转之花*120，可以1折折扣兑换20张（单价移转之花*12），2折折扣兑换10张（单价移转之花*24），3折折扣兑换10张（单价移转之花*36），4折折扣兑换10张（单价移转之花*48），6折折扣兑换10张（单价移转之花*72），8折折扣兑换10张（单价移转之花*96），原价兑换10张，合计可兑换80张。\n\n二、核心奖励概率说明：\n\n1.核心奖励概率将会随着卡池抽取行为实时变化，计算公式如下：\n\n<color=#F6841D>特定奖励获取概率=特定奖励剩余数量*特定奖励权重/（核心奖励奖池内剩余奖励数量*各奖励对应权重）之和</color>\n\n2.各核心奖励权重如下：\n\n<color=#F6841D>「绘夜之诗」\t\t\t\t\t3\n「追迹的约定」\t\t\t\t300\n「精确探测凭证x10」\t\t27\n「钥从探测凭证x5」\t\t100\n「神识凝晶x10」\t\t\t120\n「观测补给一型」\t\t\t200\n「高级赋能模块x40」\t\t250</color>",
		poll_picture_select = "I18NImg/ZH_CN/T0_Banner/T0_109502_banner_1_skin",
		poll_picture = "I18NImg/ZH_CN/T0_Banner/T0_109502_banner_2_skin",
		activity_id = {
			292221
		},
		cost_once = {
			53120,
			1
		},
		cost_ten_times = {
			53120,
			10
		},
		stage_list = {
			1
		},
		payment = {
			303000019,
			303000018,
			303000017,
			303000016,
			303000015,
			303000014,
			303000013,
			303000012
		},
		payment_free = {
			303000011
		},
		main_icon_info = {
			{
				520,
				109502
			},
			{
				513,
				2917
			}
		},
		icon_info = {
			{
				508,
				90058
			},
			{
				509,
				90059
			},
			{
				510,
				90060
			},
			{
				511,
				90061
			},
			{
				512,
				90062
			}
		}
	},
	[1006] = {
		pool_type = 2,
		pool_id = 1006,
		pool_name = "思念的归处·晨意",
		pool_sign = "T0_109502_banner_4",
		detail_note = "一、活动规则\n\n1.每次邀约需要消耗「忆之签·晨意」，「忆之签·晨意」可使用移转之辉或移转之花兑换，<color=#F6841D>使用移转之花兑换「忆之签·晨意」会根据当前兑换次数获得不同的兑换折扣</color>。\n2.每次邀约时将会通过概率决定抽取到的奖励类型，核心奖励的概率为<color=#F6841D>1%</color>，其他奖励的概率为<color=#F6841D>99%</color>，每次邀约均会获取一个奖励，每<color=#F6841D>10</color>次邀约中至少可以获得一个核心奖励。<color=#F6841D>奖励获取后不会再次被抽取</color>，至多<color=#F6841D>40</color>次邀约必定获得卡池内全部奖励。\n3.使用移转之辉购买「忆之签·晨意」原价为移转之辉*60，可以84折折扣兑换40张（单价移转之辉*50）。\n4.使用移转之花购买「忆之签·晨意」原价为移转之花*60，可以1折折扣兑换10张（单价移转之花*6），3折折扣兑换10张（单价移转之花*18），5折折扣兑换10张（单价移转之花*30），7折折扣兑换10张（单价移转之花*42），合计可兑换40张。\n\n二、核心奖励概率说明：\n\n1.核心奖励概率将会随着卡池抽取行为实时变化，计算公式如下：\n\n<color=#F6841D>特定奖励获取概率=特定奖励剩余数量*特定奖励权重/（核心奖励奖池内剩余奖励数量*各奖励对应权重）之和</color>\n\n2.各核心奖励权重如下：\n\n<color=#F6841D>「思念的归处·晨意」\t25\n「精确探测凭证x5」\t75\n「聚合权能晶体x24」400\n「观测补给二型」\t\t500</color>",
		poll_picture_select = "I18NImg/ZH_CN/T0_Banner/T0_109502_banner_1_morning",
		poll_picture = "I18NImg/ZH_CN/T0_Banner/T0_109502_banner_2_morning",
		activity_id = {
			292222
		},
		cost_once = {
			53121,
			1
		},
		cost_ten_times = {
			53121,
			10
		},
		stage_list = {
			1
		},
		payment = {
			303000005,
			303000004,
			303000003,
			303000002
		},
		payment_free = {
			303000001
		},
		main_icon_info = {
			{
				608,
				6017
			}
		},
		icon_info = {
			{
				607,
				38
			},
			{
				606,
				41303
			},
			{
				605,
				30095
			}
		}
	},
	[1007] = {
		pool_type = 2,
		pool_id = 1007,
		pool_name = "思念的归处·夜语",
		pool_sign = "T0_109502_banner_5",
		detail_note = "一、活动规则\n\n1.每次邀约需要消耗「忆之签·夜语」，「忆之签·夜语」可使用移转之辉或移转之花兑换，<color=#F6841D>使用移转之花兑换「忆之签·夜语」会根据当前兑换次数获得不同的兑换折扣</color>。\n2.每次邀约时将会通过概率决定抽取到的奖励类型，核心奖励的概率为<color=#F6841D>1%</color>，其他奖励的概率为<color=#F6841D>99%</color>，每次邀约均会获取一个奖励，每<color=#F6841D>10</color>次邀约中至少可以获得一个核心奖励。<color=#F6841D>奖励获取后不会再次被抽取</color>，至多<color=#F6841D>40</color>次邀约必定获得卡池内全部奖励。\n3.使用移转之辉购买「忆之签·夜语」原价为移转之辉*60，可以84折折扣兑换40张（单价移转之辉*50）。\n4.使用移转之花购买「忆之签·夜语」原价为移转之花*60，可以1折折扣兑换10张（单价移转之花*6），3折折扣兑换10张（单价移转之花*18），5折折扣兑换10张（单价移转之花*30），7折折扣兑换10张（单价移转之花*42），合计可兑换40张。\n\n二、核心奖励概率说明：\n\n1.核心奖励概率将会随着卡池抽取行为实时变化，计算公式如下：\n\n<color=#F6841D>特定奖励获取概率=特定奖励剩余数量*特定奖励权重/（核心奖励奖池内剩余奖励数量*各奖励对应权重）之和</color>\n\n2.各核心奖励权重如下：\n\n<color=#F6841D>「思念的归处·夜语」\t25\n「精确探测凭证x5」\t75\n「聚合权能晶体x24」400\n「观测补给二型」\t\t500</color>",
		poll_picture_select = "I18NImg/ZH_CN/T0_Banner/T0_109502_banner_1_night",
		poll_picture = "I18NImg/ZH_CN/T0_Banner/T0_109502_banner_2_night",
		activity_id = {
			292223
		},
		cost_once = {
			53124,
			1
		},
		cost_ten_times = {
			53124,
			10
		},
		stage_list = {
			1
		},
		payment = {
			303000010,
			303000009,
			303000008,
			303000007
		},
		payment_free = {
			303000006
		},
		main_icon_info = {
			{
				708,
				6018
			}
		},
		icon_info = {
			{
				707,
				38
			},
			{
				706,
				41303
			},
			{
				705,
				30095
			}
		}
	},
	get_id_list_by_activity_id = {
		[292223] = {
			1007
		},
		[292222] = {
			1006
		},
		[292221] = {
			1005
		},
		[272222] = {
			1004
		},
		[272221] = {
			1003
		},
		[182222] = {
			1002
		},
		[182221] = {
			1001
		}
	},
	all = {
		1001,
		1002,
		1003,
		1004,
		1005,
		1006,
		1007
	}
}