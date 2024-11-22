local var_0_0 = {}
local var_0_1 = {
	[ActivityConst.KAGUTSUCHI_ACTIVITY_PT_SCROLL] = CurrencyIdMapCfg.CURRENCY_PT_ROULETTE_COIN_2_6.item_id,
	[ActivityConst.KAGUTSUCHI_ACTIVITY_PT_SCROLL_DOWN] = CurrencyIdMapCfg.CURRENCY_PT_COIN_2_7.item_id,
	[ActivityConst.ACTIVITY_2_8_PT_SCROLL_UP] = CurrencyIdMapCfg.CURRENCY_PT_COIN_2_8.item_id,
	[ActivityConst.SPRING_FESTIVAL_ACTIVITY_PT_SCROLL_DOWN] = CurrencyIdMapCfg.CURRENCY_PT_COIN_2_9.item_id,
	[ActivityConst.ACTIVITY_2_10_ACTIVITY_PT_SCROLL] = CurrencyIdMapCfg.CURRENCY_PT_COIN_2_10.item_id,
	[ActivityConst.ACTIVITY_2_11_ACTIVITY_PT_SCROLL] = CurrencyIdMapCfg.CURRENCY_PT_COIN_2_11.item_id,
	[ActivityConst.ACTIVITY_3_0_ACTIVITY_PT_SCROLL] = CurrencyIdMapCfg.CURRENCY_PT_COIN_3_0.item_id,
	[ActivityConst.ACTIVITY_3_1_ACTIVITY_PT_SCROLL] = CurrencyIdMapCfg.CURRENCY_PT_COIN_3_1.item_id,
	[ActivityConst.ACTIVITY_3_2_ACTIVITY_PT_SCROLL_UP] = CurrencyIdMapCfg.CURRENCY_PT_COIN_3_2.item_id
}

function var_0_0.GetCurrencyID(arg_1_0)
	return var_0_1[arg_1_0]
end

local var_0_2 = {
	[ActivityConst.KAGUTSUCHI_ACTIVITY_PT_SCROLL] = CurrencyIdMapCfg.CURRENCY_PT_ROULETTE_TICKET_2_6.item_id,
	[ActivityConst.KAGUTSUCHI_ACTIVITY_PT_SCROLL_DOWN] = CurrencyIdMapCfg.CURRENCY_PT_TICKET_2_7.item_id,
	[ActivityConst.ACTIVITY_2_8_PT_SCROLL_UP] = CurrencyIdMapCfg.CURRENCY_PT_TICKET_2_8.item_id,
	[ActivityConst.SPRING_FESTIVAL_ACTIVITY_PT_SCROLL_DOWN] = CurrencyIdMapCfg.CURRENCY_PT_TICKET_2_9.item_id,
	[ActivityConst.ACTIVITY_2_10_ACTIVITY_PT_SCROLL] = CurrencyIdMapCfg.CURRENCY_PT_TICKET_2_10.item_id,
	[ActivityConst.ACTIVITY_2_11_ACTIVITY_PT_SCROLL] = CurrencyIdMapCfg.CURRENCY_PT_TICKET_2_11.item_id,
	[ActivityConst.ACTIVITY_3_0_ACTIVITY_PT_SCROLL] = CurrencyIdMapCfg.CURRENCY_PT_TICKET_3_0.item_id,
	[ActivityConst.ACTIVITY_3_1_ACTIVITY_PT_SCROLL] = CurrencyIdMapCfg.CURRENCY_PT_TICKET_3_1.item_id,
	[ActivityConst.ACTIVITY_3_2_ACTIVITY_PT_SCROLL_UP] = CurrencyIdMapCfg.CURRENCY_PT_TICKET_3_2.item_id
}

function var_0_0.GetChallengeCurrencyID(arg_2_0)
	return var_0_2[arg_2_0]
end

local var_0_3 = {
	[ActivityConst.KAGUTSUCHI_ACTIVITY_PT_SCROLL] = "ACTIVITY_ROULETTE_DESC",
	[ActivityConst.KAGUTSUCHI_ACTIVITY_PT_SCROLL_DOWN] = "ACTIVITY_PT_DESCRIBE_2_7",
	[ActivityConst.ACTIVITY_2_8_PT_SCROLL_UP] = "ACTIVITY_PT_DESCRIBE_2_8",
	[ActivityConst.SPRING_FESTIVAL_ACTIVITY_PT_SCROLL_DOWN] = "ACTIVITY_PT_DESCRIBE_2_9",
	[ActivityConst.ACTIVITY_2_10_ACTIVITY_PT_SCROLL] = "ACTIVITY_PT_DESCRIBE_2_10",
	[ActivityConst.ACTIVITY_2_11_ACTIVITY_PT_SCROLL] = "ACTIVITY_PT_DESCRIBE_2_11",
	[ActivityConst.ACTIVITY_3_0_ACTIVITY_PT_SCROLL] = "ACTIVITY_PT_DESCRIBE_3_0",
	[ActivityConst.ACTIVITY_3_1_ACTIVITY_PT_SCROLL] = "ACTIVITY_PT_DESCRIBE_3_1",
	[ActivityConst.ACTIVITY_3_2_ACTIVITY_PT_SCROLL_UP] = "ACTIVITY_PT_DESCRIBE_3_0"
}

function var_0_0.GetHelpKey(arg_3_0)
	return var_0_3[arg_3_0] or ""
end

local var_0_4 = {
	[ActivityConst.ACTIVITY_3_0_ACTIVITY_PT_SCROLL] = "ACTIVITY_PT_RULE_3_0",
	[ActivityConst.ACTIVITY_3_1_ACTIVITY_PT_SCROLL] = "ACTIVITY_PT_RULE_3_1",
	[ActivityConst.ACTIVITY_3_2_ACTIVITY_PT_SCROLL_UP] = "ACTIVITY_PT_RULE_3_0"
}

function var_0_0.GetDesc(arg_4_0)
	return var_0_4[arg_4_0] or ""
end

local var_0_5 = {
	[ActivityConst.KAGUTSUCHI_ACTIVITY_PT_SCROLL] = "UI/VersionUI/JapanRegionUI_2_6/JapanRegionPtUpUI/JapanRegionPtMainUpUI",
	[ActivityConst.KAGUTSUCHI_ACTIVITY_PT_SCROLL_DOWN] = "UI/VersionUI/JapanRegionUI_2_6/JapanRegionPtDownUI/JapanRegionPtMainDownUI",
	[ActivityConst.ACTIVITY_2_8_PT_SCROLL_UP] = "UI/VersionUI/IndiaUI_2_8/IndiaPTUp/IndiaPTUpMainUI",
	[ActivityConst.SPRING_FESTIVAL_ACTIVITY_PT_SCROLL_DOWN] = "UI/VersionUI/IndiaUI_2_8/IndiaPTDown/IndiaPTDownMainUI",
	[ActivityConst.ACTIVITY_2_10_ACTIVITY_PT_SCROLL] = "UI/VersionUI/JapanRegionUI_2_10/JapanRegionUI_2_10PtUpUI/JapanRegionPtMainUpUI",
	[ActivityConst.ACTIVITY_2_11_ACTIVITY_PT_SCROLL] = "UI/VersionUI/JapanRegionUI_2_10/JapanRegionUI_2_10PtDownUI/JapanRegionPtMainUpUI",
	[ActivityConst.ACTIVITY_3_0_ACTIVITY_PT_SCROLL] = "Widget/Version/NorseUI_3_0/NorseUI_3_0_PtUpUI/NorseUI_3_0_PtMainUpUI",
	[ActivityConst.ACTIVITY_3_1_ACTIVITY_PT_SCROLL] = "Widget/Version/NorseUI_3_0/NorseUI_3_0_PtDownUI/NorseUI_3_0_PtMainDownUI",
	[ActivityConst.ACTIVITY_3_2_ACTIVITY_PT_SCROLL_UP] = "Widget/Version/NorseUI_3_2/NorseUI_3_2_PtUpUI/NorseUI_3_2_PtMainUpUI"
}

function var_0_0.GetEnterUIName(arg_5_0)
	return var_0_5[arg_5_0]
end

local var_0_6 = {
	[ActivityConst.KAGUTSUCHI_ACTIVITY_PT_SCROLL] = "UI/VersionUI/JapanRegionUI_2_6/JapanRegionPtUpUI/JapanRegionPtUpUI",
	[ActivityConst.KAGUTSUCHI_ACTIVITY_PT_SCROLL_DOWN] = "UI/VersionUI/JapanRegionUI_2_6/JapanRegionPtDownUI/JapanRegionPTLevelDownUI",
	[ActivityConst.ACTIVITY_2_8_PT_SCROLL_UP] = "UI/VersionUI/IndiaUI_2_8/IndiaPTUp/IndiaPTUpLevelUI",
	[ActivityConst.SPRING_FESTIVAL_ACTIVITY_PT_SCROLL_DOWN] = "UI/VersionUI/IndiaUI_2_8/IndiaPTDown/IndiaPTDownLevelUI",
	[ActivityConst.ACTIVITY_2_10_ACTIVITY_PT_SCROLL] = "UI/VersionUI/JapanRegionUI_2_10/JapanRegionUI_2_10PtUpUI/JapanRegionPtUpUI",
	[ActivityConst.ACTIVITY_2_11_ACTIVITY_PT_SCROLL] = "UI/VersionUI/JapanRegionUI_2_10/JapanRegionUI_2_10PtDownUI/JapanRegionPtDownUI",
	[ActivityConst.ACTIVITY_3_0_ACTIVITY_PT_SCROLL] = "Widget/Version/NorseUI_3_0/NorseUI_3_0_PtUpUI/NorseUI_3_0_PtUpUI",
	[ActivityConst.ACTIVITY_3_1_ACTIVITY_PT_SCROLL] = "Widget/Version/NorseUI_3_0/NorseUI_3_0_PtDownUI/NorseUI_3_0_PtDownUI",
	[ActivityConst.ACTIVITY_3_2_ACTIVITY_PT_SCROLL_UP] = "Widget/Version/NorseUI_3_2/NorseUI_3_2_PtUpUI/NorseUI_3_2_PtUpUI"
}

function var_0_0.GetMainUIName(arg_6_0)
	return var_0_6[arg_6_0]
end

local var_0_7 = {
	[ActivityConst.KAGUTSUCHI_ACTIVITY_PT_SCROLL] = "UI/VersionUI/JapanRegionUI_2_6/JapanRegionPtUpUI/JapanRegionPtUpPopUI",
	[ActivityConst.KAGUTSUCHI_ACTIVITY_PT_SCROLL_DOWN] = "UI/VersionUI/JapanRegionUI_2_6/JapanRegionPtDownUI/JapanRegionPtDownPopUI",
	[ActivityConst.ACTIVITY_2_8_PT_SCROLL_UP] = "UI/VersionUI/IndiaUI_2_8_common/IndiaPtUpPopUI",
	[ActivityConst.SPRING_FESTIVAL_ACTIVITY_PT_SCROLL_DOWN] = "UI/VersionUI/IndiaUI_2_8_common/IndiaPtUpPopUI",
	[ActivityConst.ACTIVITY_2_10_ACTIVITY_PT_SCROLL] = "UI/VersionUI/JapanRegionUI_2_10/JapanRegionUI_2_10PtUpUI/JapanRegionPtUpPopUI",
	[ActivityConst.ACTIVITY_2_11_ACTIVITY_PT_SCROLL] = "UI/VersionUI/JapanRegionUI_2_10/JapanRegionUI_2_10PtDownUI/JapanRegionPtDownPopUI",
	[ActivityConst.ACTIVITY_3_0_ACTIVITY_PT_SCROLL] = "Widget/Version/NorseUI_3_0/NorseUI_3_0_PtUpUI/NorseUI_3_0_PtUpPopUI",
	[ActivityConst.ACTIVITY_3_1_ACTIVITY_PT_SCROLL] = "Widget/Version/NorseUI_3_0/NorseUI_3_0_PtDownUI/NorseUI_3_0_PtDownPopUI",
	[ActivityConst.ACTIVITY_3_2_ACTIVITY_PT_SCROLL_UP] = "Widget/Version/NorseUI_3_2/NorseUI_3_2_PtUpUI/NorseUI_3_2_PtUpPopUI"
}

function var_0_0.GetBuffPopUIName(arg_7_0)
	return var_0_7[arg_7_0]
end

local var_0_8 = {
	[ActivityConst.KAGUTSUCHI_ACTIVITY_PT_SCROLL] = ActivityConst.KAGUTSUCHI_ACTIVITY_PT_SCROLL_LEVEL,
	[ActivityConst.KAGUTSUCHI_ACTIVITY_PT_SCROLL_DOWN] = ActivityConst.KAGUTSUCHI_ACTIVITY_PT_SCROLL_LEVEL_DOWN,
	[ActivityConst.ACTIVITY_2_8_PT_SCROLL_UP] = ActivityConst.ACTIVITY_2_8_PT_SCROLL_LEVEL_UP,
	[ActivityConst.SPRING_FESTIVAL_ACTIVITY_PT_SCROLL_DOWN] = ActivityConst.SPRING_FESTIVAL_ACTIVITY_PT_SCROLL_LEVEL_DOWN,
	[ActivityConst.ACTIVITY_2_10_ACTIVITY_PT_SCROLL] = ActivityConst.ACTIVITY_2_10_ACTIVITY_PT_SCROLL_LEVEL,
	[ActivityConst.ACTIVITY_2_11_ACTIVITY_PT_SCROLL] = ActivityConst.ACTIVITY_2_11_ACTIVITY_PT_SCROLL_LEVEL,
	[ActivityConst.ACTIVITY_3_0_ACTIVITY_PT_SCROLL] = ActivityConst.ACTIVITY_3_0_ACTIVITY_PT_SCROLL_LEVEL,
	[ActivityConst.ACTIVITY_3_1_ACTIVITY_PT_SCROLL] = ActivityConst.ACTIVITY_3_1_ACTIVITY_PT_SCROLL_LEVEL,
	[ActivityConst.ACTIVITY_3_2_ACTIVITY_PT_SCROLL_UP] = ActivityConst.ACTIVITY_3_2_ACTIVITY_PT_SCROLL_LEVEL_UP
}

function var_0_0.GetLevelActivityID(arg_8_0)
	return var_0_8[arg_8_0]
end

local var_0_9 = {
	[ActivityConst.KAGUTSUCHI_ACTIVITY_PT_SCROLL] = ActivityConst.KAGUTSUCHI_ACTIVITY_PT_SCROLL_TASK,
	[ActivityConst.KAGUTSUCHI_ACTIVITY_PT_SCROLL_DOWN] = ActivityConst.KAGUTSUCHI_ACTIVITY_PT_SCROLL_TASK_DOWN,
	[ActivityConst.ACTIVITY_2_8_PT_SCROLL_UP] = ActivityConst.ACTIVITY_2_8_PT_SCROLL_TASK_UP,
	[ActivityConst.SPRING_FESTIVAL_ACTIVITY_PT_SCROLL_DOWN] = ActivityConst.SPRING_FESTIVAL_ACTIVITY_PT_SCROLL_TASK_DOWN,
	[ActivityConst.ACTIVITY_2_10_ACTIVITY_PT_SCROLL] = ActivityConst.ACTIVITY_2_10_ACTIVITY_PT_SCROLL_TASK,
	[ActivityConst.ACTIVITY_2_11_ACTIVITY_PT_SCROLL] = ActivityConst.ACTIVITY_2_11_ACTIVITY_PT_SCROLL_TASK,
	[ActivityConst.ACTIVITY_3_0_ACTIVITY_PT_SCROLL] = ActivityConst.ACTIVITY_3_0_ACTIVITY_PT_SCROLL_TASK,
	[ActivityConst.ACTIVITY_3_1_ACTIVITY_PT_SCROLL] = ActivityConst.ACTIVITY_3_1_ACTIVITY_PT_SCROLL_TASK,
	[ActivityConst.ACTIVITY_3_2_ACTIVITY_PT_SCROLL_UP] = ActivityConst.ACTIVITY_3_2_ACTIVITY_PT_SCROLL_TASK_UP
}

function var_0_0.GetTaskActivityID(arg_9_0)
	return var_0_9[arg_9_0]
end

local var_0_10 = {
	[ActivityConst.KAGUTSUCHI_ACTIVITY_PT_SCROLL] = ActivityConst.KAGUTSUCHI_ACTIVITY_PT_SCROLL_SHOP,
	[ActivityConst.KAGUTSUCHI_ACTIVITY_PT_SCROLL_DOWN] = ActivityConst.KAGUTSUCHI_ACTIVITY_PT_SCROLL_SHOP_DOWN,
	[ActivityConst.ACTIVITY_2_8_PT_SCROLL_UP] = ActivityConst.ACTIVITY_2_8_PT_SCROLL_SHOP_UP,
	[ActivityConst.SPRING_FESTIVAL_ACTIVITY_PT_SCROLL_DOWN] = ActivityConst.SPRING_FESTIVAL_ACTIVITY_PT_SCROLL_SHOP_DOWN,
	[ActivityConst.ACTIVITY_2_10_ACTIVITY_PT_SCROLL] = ActivityConst.ACTIVITY_2_10_ACTIVITY_PT_SCROLL_SHOP,
	[ActivityConst.ACTIVITY_2_11_ACTIVITY_PT_SCROLL] = ActivityConst.ACTIVITY_2_11_ACTIVITY_PT_SCROLL_SHOP,
	[ActivityConst.ACTIVITY_3_0_ACTIVITY_PT_SCROLL] = ActivityConst.ACTIVITY_3_0_ACTIVITY_PT_SCROLL_SHOP,
	[ActivityConst.ACTIVITY_3_1_ACTIVITY_PT_SCROLL] = ActivityConst.ACTIVITY_3_1_ACTIVITY_PT_SCROLL_SHOP,
	[ActivityConst.ACTIVITY_3_2_ACTIVITY_PT_SCROLL_UP] = ActivityConst.ACTIVITY_3_2_ACTIVITY_PT_SCROLL_SHOP_UP
}

function var_0_0.GetShopActivityID(arg_10_0)
	return var_0_10[arg_10_0]
end

return var_0_0
