return {
	GetMainUIName = function(arg_1_0)
		if arg_1_0 == ActivityConst.ACTIVITY_2_2_SKIN_DRAW then
			return "UI/VersionUI/XuHeng3rdUI/T0Scene/T0Scene"
		else
			return "UI/VersionUI/XuHeng3rdUI/T0Scene/T0Scene"
		end
	end,
	GetTaskUIName = function(arg_2_0)
		if arg_2_0 == ActivityConst.ACTIVITY_2_2_SKIN_DRAW then
			return "UI/VersionUI/XuHeng3rdUI/T0Scene/T0Scene2"
		else
			return "UI/VersionUI/XuHeng3rdUI/T0Scene/T0Scene2"
		end
	end,
	GetPopUIName = function(arg_3_0)
		if arg_3_0 == ActivityConst.ACTIVITY_2_2_SKIN_DRAW then
			return "UI/VersionUI/XuHeng3rdUI/T0Scene/T0Scene3"
		else
			return "UI/VersionUI/XuHeng3rdUI/T0Scene/T0Scene3"
		end
	end,
	GetDrawStartUIName = function(arg_4_0)
		if arg_4_0 == ActivityConst.ACTIVITY_2_2_SKIN_DRAW then
			return "UI/VersionUI/XuHeng3rdUI/T0Scene/DrawCardsUI/T0_DrawCardUI"
		else
			return "UI/VersionUI/XuHeng3rdUI/T0Scene/DrawCardsUI/T0_DrawCardUI"
		end
	end,
	GetDrawRewardUIName = function(arg_5_0)
		if arg_5_0 == ActivityConst.ACTIVITY_2_2_SKIN_DRAW then
			return "UI/VersionUI/XuHeng3rdUI/T0Scene/SingledrawUI/T0_Single"
		else
			return "UI/VersionUI/XuHeng3rdUI/T0Scene/SingledrawUI/T0_Single"
		end
	end,
	GetDrawResultUIName = function(arg_6_0)
		if arg_6_0 == ActivityConst.ACTIVITY_2_2_SKIN_DRAW then
			return "UI/VersionUI/XuHeng3rdUI/T0Scene/T0Scene4"
		else
			return "UI/VersionUI/XuHeng3rdUI/T0Scene/T0Scene4"
		end
	end,
	GetDrawInfoUIName = function(arg_7_0)
		if arg_7_0 == ActivityConst.ACTIVITY_2_2_SKIN_DRAW then
			return "UI/VersionUI/XuHeng3rdUI/T0Scene/T0_DrawInfoUI"
		else
			return "UI/VersionUI/XuHeng3rdUI/T0Scene/T0_DrawInfoUI"
		end
	end,
	GetTaskActivityID = function(arg_8_0)
		if arg_8_0 == ActivityConst.ACTIVITY_2_2_SKIN_DRAW then
			return ActivityConst.ACTIVITY_2_2_SKIN_TASK
		else
			return ActivityConst.ACTIVITY_2_2_SKIN_TASK
		end
	end,
	GetActivityShopID = function(arg_9_0)
		return ActivityShopCfg[arg_9_0].shop_id
	end,
	GetStoryID = function(arg_10_0)
		if arg_10_0 == ActivityConst.ACTIVITY_2_2_SKIN_DRAW then
			return GameSetting.limited_skin_story_1.value[1]
		else
			return GameSetting.limited_skin_story_1.value[1]
		end
	end,
	GetTypeGo = function(arg_11_0)
		if arg_11_0 == ActivityConst.ACTIVITY_2_2_SKIN_DRAW then
			return {
				"UI/VersionUI/XuHeng3rdUI/T0Scene/SingledrawUI/SingledrawUI_blue",
				"UI/VersionUI/XuHeng3rdUI/T0Scene/SingledrawUI/SingledrawUI_purple",
				"UI/VersionUI/XuHeng3rdUI/T0Scene/SingledrawUI/SingledrawUI_golden",
				special = "UI/VersionUI/XuHeng3rdUI/T0Scene/SingledrawUI/SingledrawUI_special",
				movie = "UI/VersionUI/XuHeng3rdUI/T0Scene/SingledrawUI/SingledrawUI_movie"
			}
		else
			return {
				"UI/VersionUI/XuHeng3rdUI/T0Scene/SingledrawUI/SingledrawUI_blue",
				"UI/VersionUI/XuHeng3rdUI/T0Scene/SingledrawUI/SingledrawUI_purple",
				"UI/VersionUI/XuHeng3rdUI/T0Scene/SingledrawUI/SingledrawUI_golden",
				special = "UI/VersionUI/XuHeng3rdUI/T0Scene/SingledrawUI/SingledrawUI_special",
				movie = "UI/VersionUI/XuHeng3rdUI/T0Scene/SingledrawUI/SingledrawUI_movie"
			}
		end
	end,
	GetTaskCurrency = function(arg_12_0)
		if arg_12_0 == ActivityConst.ACTIVITY_2_2_SKIN_DRAW then
			return {
				CurrencyIdMapCfg.CURRENCY_TYPE_GENGCHEN_SKIN_COIN.item_id
			}
		else
			return {}
		end
	end
}
