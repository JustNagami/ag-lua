local var_0_0 = class("RedPointMgr")

function var_0_0.Ctor(arg_1_0)
	arg_1_0._redPointHelper = require("manager/redPoint/RedPointController")

	arg_1_0._redPointHelper:Init()
	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	arg_2_0:addGroup(RedPointConst.BULLETIN_UNREAD, {
		RedPointConst.BULLETIN_UNREAD_101,
		RedPointConst.BULLETIN_UNREAD_102,
		RedPointConst.BULLETIN_UNREAD_104
	})
	arg_2_0:addGroup(RedPointConst.TASK, {
		RedPointConst.TASK_DAILY,
		RedPointConst.TASK_PLOT,
		RedPointConst.TASK_WEEK,
		RedPointConst.EXPLORE_MAIN
	})
	arg_2_0:addGroup(RedPointConst.COMBAT, {
		RedPointConst.COMBAT_PLOT,
		RedPointConst.COMBAT_SUB_PLOT,
		RedPointConst.COMBAT_CHALLENGE,
		RedPointConst.COMBAT_EQUIP,
		RedPointConst.COMBAT_EQUIP,
		RedPointConst.RESOURSE_STAGE
	})

	local var_2_0 = {}
	local var_2_1 = {}

	for iter_2_0 = 1, BattleConst.HARD_CNT do
		var_2_1[iter_2_0] = {}
	end

	for iter_2_1, iter_2_2 in pairs(ChapterClientCfg.get_id_list_by_toggle[BattleConst.TOGGLE.PLOT]) do
		local var_2_2 = {}
		local var_2_3 = 1

		for iter_2_3, iter_2_4 in pairs(ChapterClientCfg[iter_2_2].chapter_list) do
			table.insert(var_2_2, string.format("%s_%s", RedPointConst.COMBAT_PLOT_CHAPTER, iter_2_4))

			local var_2_4 = ChapterCfg[iter_2_4]
			local var_2_5 = {
				string.format("%s_%s", RedPointConst.COMBAT_PLOT_CHAPTER_STAR, iter_2_4)
			}

			if var_2_1[var_2_4.difficulty] then
				var_2_3 = var_2_4.difficulty

				if var_2_4.sub_type == 13 and var_2_4.difficulty == 1 then
					arg_2_0:addGroup(string.format("%s_%s", RedPointConst.COMBAT_PLOT, iter_2_4), {
						RedPointConst.TRAVEL_SKULD_CHAPTER .. ActivityConst.ACTIVITY_1_6_SKULD_TRAVEL
					})
				elseif var_2_4.clientID == ChapterConst.CHAPTER_CLIENT_19 then
					arg_2_0:addGroup(string.format("%s_%s", RedPointConst.COMBAT_PLOT, iter_2_4), {
						RedPointConst.COMBAT_PLOT_CHAPTER_19_STAR
					})
				end
			end

			local var_2_6

			if var_2_4.unlock_activity_id ~= 0 then
				var_2_6 = var_2_4.unlock_activity_id
			else
				var_2_6 = var_2_4.activity_id
			end

			if var_2_6 ~= 0 then
				table.insert(var_2_5, string.format("%s%s", ActivityTools.GetRedPointKey(var_2_4.activity_id), var_2_6))
			end

			arg_2_0:addGroup(string.format("%s_%s", RedPointConst.COMBAT_PLOT_CHAPTER, iter_2_4), var_2_5)
		end

		arg_2_0:addGroup(string.format("%s_%s", RedPointConst.COMBAT_PLOT, iter_2_2), var_2_2)
		table.insert(var_2_0, string.format("%s_%s", RedPointConst.COMBAT_PLOT, iter_2_2))
		table.insert(var_2_1[var_2_3], string.format("%s_%s", RedPointConst.COMBAT_PLOT, iter_2_2))
	end

	arg_2_0:addGroup(RedPointConst.COMBAT_PLOT, var_2_0)

	for iter_2_5 = 1, BattleConst.HARD_CNT do
		arg_2_0:addGroup(string.format("%s_%s", RedPointConst.COMBAT_PLOT_LEVEL, iter_2_5), var_2_1[iter_2_5])
	end

	local var_2_7 = {}

	for iter_2_6, iter_2_7 in pairs(ChapterClientCfg.get_id_list_by_toggle[BattleConst.TOGGLE.SUB_PLOT] or {}) do
		table.insert(var_2_7, string.format("%s_%s", RedPointConst.COMBAT_SUB_PLOT, iter_2_7))

		local var_2_8 = {}

		for iter_2_8, iter_2_9 in pairs(ChapterClientCfg[iter_2_7].chapter_list) do
			table.insert(var_2_8, string.format("%s_%s", RedPointConst.COMBAT_SUB_PLOT_CHAPTER, iter_2_9))
		end

		arg_2_0:addGroup(string.format("%s_%s", RedPointConst.COMBAT_SUB_PLOT_CHAPTER_LIST, iter_2_7), var_2_8)

		local var_2_9 = {
			string.format("%s_%s", RedPointConst.COMBAT_SUB_PLOT_CHAPTER_LIST, iter_2_7),
			string.format("%s_%s", RedPointConst.COMBAT_SUB_PLOT_EXTRA_STORY, iter_2_7)
		}

		if iter_2_7 == 6010003 then
			table.insert(var_2_9, string.format("%s_%s", RedPointConst.WAR_CHESS, 71012))
			table.insert(var_2_9, string.format("%s_%s", RedPointConst.WAR_CHESS, 71011))
			table.insert(var_2_9, string.format("%s_%s", RedPointConst.ACTIVITY_SIDE_STORY, ActivityConst.THEME.SUMMER))
		end

		arg_2_0:addGroup(string.format("%s_%s", RedPointConst.COMBAT_SUB_PLOT, iter_2_7), var_2_9)
	end

	arg_2_0:addGroup(RedPointConst.COMBAT_SUB_PLOT, var_2_7)
	arg_2_0:addGroup(RedPointConst.BOSS_CHALLENGE, {
		RedPointConst.BOSS_CHALLENGE_NORMAL,
		RedPointConst.BOSS_CHALLENGE_ADVANCE
	})
	arg_2_0:addGroup(RedPointConst.COMBAT_CHALLENGE, {
		RedPointConst.CHALLENGE_COMMON,
		RedPointConst.CHALLENGE_DEMO
	})

	local var_2_10 = {}
	local var_2_11 = ChapterClientCfg.get_id_list_by_toggle[401]

	for iter_2_10, iter_2_11 in ipairs(var_2_11) do
		table.insert(var_2_10, RedPointConst.TOWER_NEW_LEVEL + iter_2_11)
	end

	arg_2_0:addGroup(RedPointConst.TOWER, var_2_10)
	arg_2_0:addGroup(RedPointConst.CHALLENGE_COMMON, {
		RedPointConst.MYTHIC_TIMES_AWARD,
		RedPointConst.MYTHIC_FINAL_AWARD,
		RedPointConst.BOSS_CHALLENGE,
		RedPointConst.MATRIX_EXCHANGE_BONUS,
		RedPointConst.POLYHEDRON,
		RedPointConst.ABYSS,
		RedPointConst.TOWER,
		RedPointConst.WARCHESS,
		RedPointConst.TEACH,
		RedPointConst.CORE_VERIFICATION
	})
	arg_2_0:addGroup(RedPointConst.CHALLENGE_DEMO, {
		RedPointConst.COOPERATION_DEMO
	})
	arg_2_0:addGroup(RedPointConst.TEACH, {
		RedPointConst.TEACH_BASE,
		RedPointConst.TEACH_CHARACTER
	})

	local var_2_12 = ChapterTools.GetRedPoint(ChapterConst.DAILY_EQUIP_EXPERIENCE)

	arg_2_0:addGroup(RedPointConst.COMBAT_EQUIP, {
		RedPointConst.BATTLE_EQUIP,
		RedPointConst.EQUIP_SEIZURE,
		var_2_12,
		RedPointConst.DAILY_EQUIP_ENCHANT
	})
	arg_2_0:addGroup(var_2_12, {
		GetSystemNewRedKeyByChapter(ChapterConst.DAILY_EQUIP_EXPERIENCE)
	})
	arg_2_0:addGroup(RedPointConst.DAILY_EQUIP_ENCHANT, {
		GetSystemNewRedKeyByChapter(ChapterConst.DAILY_EQUIP_ENCHANT)
	})
	arg_2_0:addGroup(RedPointConst.EQUIP_SEIZURE, {
		RedPointConst.EQUIP_SEIZURE_REWARD,
		RedPointConst.EQUIP_SEIZURE_UNREAD
	})

	local var_2_13 = {}

	for iter_2_12, iter_2_13 in pairs(ChapterClientCfg.get_id_list_by_toggle[BattleConst.TOGGLE.RESOURCE] or {}) do
		local var_2_14 = ChapterTools.GetRedPoint(iter_2_13)

		table.insert(var_2_13, var_2_14)
		arg_2_0:addGroup(var_2_14, {
			GetSystemNewRedKeyByChapter(iter_2_13)
		})
	end

	arg_2_0:addGroup(RedPointConst.RESOURSE_STAGE, var_2_13)

	local var_2_15 = {}
	local var_2_16 = {}

	for iter_2_14, iter_2_15 in pairs(HeroCfg.get_id_list_by_private[0]) do
		local var_2_17 = RedPointConst.HERO_ID .. iter_2_15

		table.insert(var_2_16, var_2_17)

		local var_2_18 = RedPointConst.HERO_WEAPON_BREAK_ID .. iter_2_15
		local var_2_19 = RedPointConst.WEAPON_MODULE_UNLOCK .. "_" .. iter_2_15
		local var_2_20 = RedPointConst.HERO_WEAPON .. iter_2_15

		arg_2_0:addGroup(var_2_20, {
			var_2_18
		})

		local var_2_21 = RedPointConst.HERO_UNLOCK_ID .. iter_2_15
		local var_2_22 = RedPointConst.HERO_PROPERTY_PAGE .. iter_2_15
		local var_2_23 = RedPointConst.HERO_STAR_ID .. iter_2_15
		local var_2_24 = RedPointConst.HERO_SKIN_ID .. iter_2_15
		local var_2_25 = {}
		local var_2_26 = SkinCfg.get_id_list_by_hero[iter_2_15]

		for iter_2_16, iter_2_17 in pairs(var_2_26) do
			table.insert(var_2_25, RedPointConst.HERO_SKIN_ROUTE_ID .. iter_2_17)
		end

		arg_2_0:addGroup(var_2_24, var_2_25)

		local var_2_27 = {}
		local var_2_28 = {}

		for iter_2_18, iter_2_19 in pairs(SkinCfg.get_id_list_by_hero[iter_2_15]) do
			local var_2_29 = RedPointConst.HERO_SKIN_ID_EXTEND .. iter_2_19

			table.insert(var_2_27, var_2_29)

			if #SkinCfg[iter_2_19].gift > 0 then
				local var_2_30 = RedPointConst.SKIN_GIFT .. "_" .. iter_2_19

				table.insert(var_2_28, var_2_30)
			end
		end

		local var_2_31 = {}

		table.insertto(var_2_31, var_2_27)
		table.insertto(var_2_31, var_2_28)
		arg_2_0:addGroup(var_2_24, var_2_31)

		local var_2_32 = string.format("%s_%s", RedPointConst.HERO_REALTION, iter_2_15)
		local var_2_33 = string.format("%s_%s", RedPointConst.HERO_REALTION_UNLOCK, iter_2_15)
		local var_2_34 = string.format("%s_%s", RedPointConst.HERO_RELATION_STORY, iter_2_15)
		local var_2_35 = string.format("%s_%s", RedPointConst.HERO_RELATION_COMBO_SKILL, iter_2_15)

		arg_2_0:addGroup(var_2_32, {
			var_2_33,
			var_2_34,
			var_2_35
		})
		arg_2_0:addGroup(var_2_22, {
			var_2_23,
			var_2_24,
			var_2_21,
			var_2_19
		})
		table.insert(var_2_15, RedPointConst.HERO_HEART_STORY_ROOT_ID .. iter_2_15)

		local var_2_36 = HeroTools.GetHeroOntologyID(iter_2_15)

		arg_2_0:addGroup(RedPointConst.HERO_ARCHIVE_ID .. iter_2_15, {
			RedPointConst.HERO_HEARTLINK_ID .. var_2_36,
			string.format("%s_%s", RedPointConst.HERO_TRUST_UP_LEVEL, iter_2_15),
			var_2_32
		})

		for iter_2_20 = 1, HeroConst.HERO_HEARTLINK_STORY_MAX_COUNT do
			local var_2_37 = table.concat({
				RedPointConst.HERO_HEARTLINK_ID,
				var_2_36,
				"_",
				iter_2_20
			})

			arg_2_0:addGroup(RedPointConst.HERO_HEARTLINK_ID .. var_2_36, {
				var_2_37
			})
		end

		arg_2_0:addGroup(var_2_17, {
			var_2_23,
			var_2_24,
			var_2_21
		})
	end

	arg_2_0:addGroup(RedPointConst.HERO, var_2_16)
	arg_2_0:addGroup(RedPointConst.HERO_HEART_STORY_ROOT_FULL, var_2_15)

	local var_2_38 = {
		RedPointConst.SIGN_DAILY,
		RedPointConst.BIG_MONTH_CARD
	}
	local var_2_39 = ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.SEVEN_SIGN] or {}

	for iter_2_21, iter_2_22 in ipairs(var_2_39) do
		table.insert(var_2_38, string.format("%s_%s", RedPointConst.SIGN_SEVEN_DAY, iter_2_22))
	end

	arg_2_0:addGroup(RedPointConst.SIGN, var_2_38)

	local var_2_40 = {}
	local var_2_41 = ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.SEVEN_DAY_SIGN_SKIN] or {}

	for iter_2_23, iter_2_24 in ipairs(var_2_41) do
		table.insert(var_2_40, string.format("%s_%s", RedPointConst.SEVEN_DAY_SIGN_SKIN, iter_2_24))
	end

	arg_2_0:addGroup(RedPointConst.SEVEN_DAY_SIGN_SKIN, var_2_40)

	local var_2_42 = {}
	local var_2_43 = ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.SEVEN_DAY_SIGN_SKIN_LUWU] or {}

	for iter_2_25, iter_2_26 in ipairs(var_2_43) do
		table.insert(var_2_42, string.format("%s_%s", RedPointConst.SEVEN_DAY_SIGN_SKIN, iter_2_26))
	end

	arg_2_0:addGroup(RedPointConst.SEVEN_DAY_SIGN_SKIN, var_2_42)

	local var_2_44 = {}
	local var_2_45 = ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.SEVEN_DAY_SIGN_SKIN_WORLD_LINE] or {}

	for iter_2_27, iter_2_28 in ipairs(var_2_45) do
		table.insert(var_2_44, string.format("%s_%s", RedPointConst.SEVEN_DAY_SIGN_SKIN, iter_2_28))
	end

	arg_2_0:addGroup(RedPointConst.SEVEN_DAY_SIGN_SKIN, var_2_44)

	local var_2_46 = ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.NORSE_SURPRISE_GIFT_DRAW] or {}

	for iter_2_29, iter_2_30 in ipairs(var_2_46) do
		local var_2_47 = string.format("%s_%s", RedPointConst.ACTIVITY_3_0_SURPRISE_GIFT_DRAW, iter_2_30)
		local var_2_48 = string.format("%s_%s", RedPointConst.ACTIVITY_3_0_SURPRISE_GIFT_RECEIVE, iter_2_30)
		local var_2_49 = string.format("%s_%s", RedPointConst.ACTIVITY_3_0_SURPRISE_GIFT, iter_2_30)

		arg_2_0:addGroup(var_2_49, {
			var_2_47,
			var_2_48
		})
	end

	local var_2_50 = string.format("%s_%s", RedPointConst.ACTIVITY_3_0_SURPRISE_GIFT, ActivityConst.ACTIVITY_3_0_SURPRISE_GIFT_DRAW)

	arg_2_0:addGroup(string.format("%s_%s", RedPointConst.SEVEN_DAY_SIGN_SKIN, ActivityConst.ACTIVITY_3_0_SEVEN_DAY_SKIN_SIGN), {
		var_2_50
	})

	local var_2_51 = {}
	local var_2_52 = {}
	local var_2_53 = {}

	for iter_2_31, iter_2_32 in ipairs(ChipCfg.get_id_list_by_type_id[ChipConst.TYPE_MANAGER]) do
		table.insert(var_2_52, string.format("%s_%s", RedPointConst.CHIP_MANAGER, iter_2_32))
		table.insert(var_2_53, string.format("%s_%s", RedPointConst.CHIP_MANAGER, iter_2_32))
	end

	for iter_2_33, iter_2_34 in ipairs(ChipCfg.get_id_list_by_type_id[ChipConst.TYPE_CHIP]) do
		table.insert(var_2_51, string.format("%s_%s", RedPointConst.CHIP_CHIP, iter_2_34))
		table.insert(var_2_53, string.format("%s_%s", RedPointConst.CHIP_CHIP, iter_2_34))
	end

	arg_2_0:addGroup(RedPointConst.CHIP_CHIP, var_2_51)
	arg_2_0:addGroup(RedPointConst.CHIP_MANAGER_CHIP, var_2_52)
	arg_2_0:addGroup(RedPointConst.CHIP_MANAGER, var_2_53)

	for iter_2_35, iter_2_36 in pairs(ChipCfg.get_id_list_by_spec_char) do
		if iter_2_35 > 0 then
			local var_2_54 = RedPointConst.CHIP_HERO_CHIP .. "_" .. iter_2_35
			local var_2_55 = {}
			local var_2_56 = {}

			for iter_2_37, iter_2_38 in pairs(iter_2_36) do
				local var_2_57 = RedPointConst.CHIP_HERO_CHIP .. "_" .. iter_2_35 .. "_" .. ChipCfg[iter_2_38].role_type_id .. "_" .. iter_2_38

				if var_2_55[ChipCfg[iter_2_38].role_type_id] then
					table.insert(var_2_55[ChipCfg[iter_2_38].role_type_id], var_2_57)
				else
					var_2_55[ChipCfg[iter_2_38].role_type_id] = {
						var_2_57
					}
				end

				local var_2_58 = RedPointConst.CHIP_HERO_CURRENCY_CHIP .. "_" .. iter_2_35 .. "_" .. ChipCfg[iter_2_38].role_type_id .. "_" .. iter_2_38

				if var_2_56[ChipCfg[iter_2_38].role_type_id] then
					table.insert(var_2_56[ChipCfg[iter_2_38].role_type_id], var_2_58)
				else
					var_2_56[ChipCfg[iter_2_38].role_type_id] = {
						var_2_58
					}
				end
			end

			local var_2_59 = {}

			for iter_2_39, iter_2_40 in pairs(var_2_55) do
				local var_2_60 = RedPointConst.CHIP_HERO_CHIP .. "_" .. iter_2_35 .. "_" .. iter_2_39

				arg_2_0:addGroup(var_2_60, var_2_55[iter_2_39])
				table.insert(var_2_59, var_2_60)
			end

			for iter_2_41, iter_2_42 in pairs(var_2_56) do
				local var_2_61 = RedPointConst.CHIP_HERO_CURRENCY_CHIP .. "_" .. iter_2_35 .. "_" .. iter_2_41

				arg_2_0:addGroup(var_2_61, var_2_56[iter_2_41])
			end

			arg_2_0:addGroup(var_2_54, var_2_59)
		end
	end

	arg_2_0:addGroup(RedPointConst.FRIEND, {
		RedPointConst.FRIEND_FRIEND_REQUESTS
	})

	local var_2_62 = {}

	for iter_2_43, iter_2_44 in ipairs(ItemCfg.get_id_list_by_type[ItemConst.ITEM_TYPE.SCENE]) do
		local var_2_63 = HomeSceneSettingCfg[iter_2_44]

		if var_2_63 and var_2_63.limit_display == 1 then
			table.insert(var_2_62, RedPointConst.SCENE .. "_" .. iter_2_44)
		end
	end

	arg_2_0:addGroup(RedPointConst.SCENE, var_2_62)
	arg_2_0:addGroup(RedPointConst.FORUM_PLATFORM, {
		RedPointConst.FORUM,
		RedPointConst.FORUM_UNREAD
	})
	arg_2_0:addGroup(RedPointConst.MAIN_HOME_FUNC, {
		RedPointConst.CHIP_MANAGER,
		RedPointConst.SETTING_NEW_FUNCTION,
		RedPointConst.WEAPON_SERVANT_MERGE,
		RedPointConst.SIGN,
		RedPointConst.BULLETIN_UNREAD,
		RedPointConst.EXPLORE_MAIN,
		RedPointConst.COOPERATION_INVIT,
		RedPointConst.SCENE,
		RedPointConst.ACHIEVEMENT,
		RedPointConst.ILLU_USER,
		RedPointConst.OVERSEA_H5_GAME
	})
	arg_2_0:addGroup(RedPointConst.MAIN_HOME_MENU, {
		RedPointConst.MAIN_HOME_FUNC,
		RedPointConst.MAIN_HOME_SDK
	})

	local var_2_64 = {}

	for iter_2_45, iter_2_46 in pairs(AchievementCfg.get_id_list_by_type_id) do
		table.insert(var_2_64, string.format("%s_%s", RedPointConst.ACHIEVEMENT, iter_2_45))
	end

	local var_2_65 = {}

	for iter_2_47, iter_2_48 in pairs(AchievementStoryCfg.all) do
		table.insert(var_2_65, string.format("%s_%s", RedPointConst.ACHIEVEMENT_STORY, iter_2_48))
	end

	arg_2_0:addGroup(RedPointConst.ACHIEVEMENT_STORY, var_2_65)
	table.insertto(var_2_64, var_2_65)
	arg_2_0:addGroup(RedPointConst.ACHIEVEMENT, var_2_64)

	local var_2_66 = {}

	for iter_2_49, iter_2_50 in ipairs(ItemCfg.get_id_list_by_type[ItemConst.ITEM_TYPE.STICKER_BG]) do
		table.insert(var_2_66, RedPointConst.STICKER_BG .. "_" .. iter_2_50)
	end

	arg_2_0:addGroup(RedPointConst.STICKER_BG, var_2_66)

	local var_2_67 = {}
	local var_2_68 = ItemCfg.get_id_list_by_type[ItemConst.ITEM_TYPE.STICKER]

	for iter_2_51, iter_2_52 in ipairs(var_2_68) do
		table.insert(var_2_67, RedPointConst.STICKER_UNLOCK .. "_" .. iter_2_52)
	end

	arg_2_0:addGroup(RedPointConst.STICKER, var_2_67)
	arg_2_0:addGroup(RedPointConst.STICKER_ROOT, {
		RedPointConst.STICKER,
		RedPointConst.STICKER_BG
	})
	arg_2_0:addGroup(RedPointConst.PASSPORT_TASKS, {
		RedPointConst.PASSPORT_TASK_BONUS_7,
		RedPointConst.PASSPORT_TASK_BONUS_8,
		RedPointConst.PASSPORT_TASK_BONUS_9
	})
	arg_2_0:addGroup(RedPointConst.PASSPORT, {
		RedPointConst.PASSPORT_BONUS,
		RedPointConst.PASSPORT_TASKS,
		RedPointConst.PASSPORT_NEW_SEASON
	})
	arg_2_0:addGroup(RedPointConst.SHOP, {
		RedPointConst.HERO_PIECE_EXCHANGE,
		RedPointConst.NEW_SHOP_SHOP
	})
	arg_2_0:addGroup(RedPointConst.CYCLE_BONUS, {
		RedPointConst.CYCLE_BONUS_FREE,
		RedPointConst.CYCLE_BONUS_UNLOCK
	})
	arg_2_0:addGroup(RedPointConst.ACTIVITY_BONUS, {
		RedPointConst.ACTIVITY_BONUS_FREE,
		RedPointConst.ACTIVITY_BONUS_UNLOCK
	})
	arg_2_0:addGroup(RedPointConst.NEWBIE_BONUS, {
		RedPointConst.NEWBIE_BONUS_FREE,
		RedPointConst.NEWBIE_BONUS_UNLOCK
	})
	arg_2_0:addGroup(RedPointConst.NORMAL_BONUS, {
		RedPointConst.NORMAL_BONUS_FREE,
		RedPointConst.NORMAL_BONUS_UNLOCK
	})
	arg_2_0:addGroup(RedPointConst.RECHARGE_BONUS, {
		RedPointConst.ACTIVITY_BONUS,
		RedPointConst.CYCLE_BONUS,
		RedPointConst.NEWBIE_BONUS,
		RedPointConst.NORMAL_BONUS
	})
	arg_2_0:addGroup(RedPointConst.RECHARGE_DOUBLE_AND_NOOB_MONTHLY_RECHARGE_SIGN, {
		RedPointConst.NOOB_MONTHLY_RECHARGE_SIGN,
		RED_POINT_ID.RECHARGE
	})
	arg_2_0:addGroup(RedPointConst.NOOB_RECHARGE, {
		RedPointConst.NOOB_FIRST_RECHARGE,
		RedPointConst.NOOB_MONTHLY_RECHARGE,
		RedPointConst.NOOB_BP_RECHARGE
	})
	arg_2_0:addGroup(RedPointConst.RECHARGE, {
		RedPointConst.RECHARGE_BONUS,
		RedPointConst.TOTAL_CHARGE_BONUS,
		RedPointConst.RECHARGE_DOUBLE_AND_NOOB_MONTHLY_RECHARGE_SIGN,
		RedPointConst.NOOB_RECHARGE,
		RedPointConst.NEW_SHOP_RECHARGE
	})
	arg_2_0:addGroup(RedPointConst.RECHARGE_ENTER, {
		RedPointConst.RECHARGE,
		RedPointConst.SHOP,
		RedPointConst.RECHARGE_RECOMMEND
	})
	arg_2_0:addGroup(RedPointConst.ILLU_ILLUSTRATION, {
		RedPointConst.ILLU_ILLUSTRATION1,
		RedPointConst.ILLU_ILLUSTRATION2,
		RedPointConst.ILLU_ILLUSTRATION3,
		RedPointConst.ILLU_ILLUSTRATION4
	})
	arg_2_0:addGroup(RedPointConst.ILLU_USER, {
		RedPointConst.ILLU_ILLUSTRATION,
		RedPointConst.ILLU_HERO
	})

	local var_2_69 = {}
	local var_2_70 = ItemCfg.get_id_list_by_type[ItemConst.ITEM_TYPE.TAG]

	for iter_2_53, iter_2_54 in ipairs(var_2_70) do
		if ItemCfg[iter_2_54].sub_type ~= ItemConst.ITEM_SUB_TYPE.TAG_LIMIT then
			table.insert(var_2_69, RedPointConst.TAG .. "_" .. iter_2_54)
		end
	end

	arg_2_0:addGroup(RedPointConst.TAG, var_2_69)

	local var_2_71 = {}
	local var_2_72 = ItemCfg.get_id_list_by_type[ItemConst.ITEM_TYPE.CARD_BG]

	for iter_2_55, iter_2_56 in ipairs(var_2_72) do
		if ItemCfg[iter_2_56].sub_type ~= ItemConst.ITEM_SUB_TYPE.CARD_BG_LIMIT then
			table.insert(var_2_71, RedPointConst.CARD_BG .. "_" .. iter_2_56)
		end
	end

	arg_2_0:addGroup(RedPointConst.CARD_BG, var_2_71)

	local var_2_73 = {}
	local var_2_74 = GameSetting.profile_chat_bubble_default.value[1]

	for iter_2_57, iter_2_58 in ipairs(ItemCfg.get_id_list_by_type[ItemConst.ITEM_TYPE.CHAT_BUBBLE]) do
		if iter_2_58 ~= var_2_74 then
			table.insert(var_2_73, string.format("%s_%s", RedPointConst.CHAT_BUBBLE, iter_2_58))
		end
	end

	arg_2_0:addGroup(RedPointConst.CHAT_BUBBLE, var_2_73)
	arg_2_0:addGroup(RedPointConst.USER_CUSTOM, {
		RedPointConst.CHAT_BUBBLE
	})
	arg_2_0:addGroup(RedPointConst.ILLU_MAIN, {
		RedPointConst.STICKER_ROOT,
		RedPointConst.BRITHDAY,
		RedPointConst.TAG,
		RedPointConst.USER_CUSTOM
	})
	arg_2_0:addGroup(RedPointConst.ILLU_HERO, {
		RedPointConst.HERO_RACE_COLLECT_REWARD
	})
	arg_2_0:addGroup(RedPointConst.NOOB_FIRST_RECHARGE, {
		RedPointConst.NOOB_FIRST_RECHARGE_1,
		RedPointConst.NOOB_FIRST_RECHARGE_2
	})
	arg_2_0:addGroup(RedPointConst.NEWBIE_POINT, {
		RedPointConst.NEWBIE_SIGN,
		RedPointConst.NEWBIE_TASK,
		RedPointConst.NEWBIE_UPGRADE,
		RedPointConst.NEWBIE_DAILY_TASK,
		RedPointConst.NOOB_FIRST_RECHARGE,
		RedPointConst.NOOB_MONTHLY_RECHARGE,
		RedPointConst.NOOB_BP_RECHARGE
	})

	local var_2_75 = {}

	for iter_2_59, iter_2_60 in ipairs(NoobVersionCfg.all) do
		local var_2_76 = NoobVersionCfg[iter_2_60]
		local var_2_77 = var_2_76.noob_advance_task_type

		if type(var_2_77) == "table" then
			for iter_2_61, iter_2_62 in ipairs(var_2_77) do
				local var_2_78 = string.format("%s_%d", RedPointConst.NOOB_ADVANCE, iter_2_62)

				var_2_75[#var_2_75 + 1] = var_2_78

				local var_2_79 = var_2_76.noob_advance_task_phase[iter_2_61]
				local var_2_80 = NoobAdvanceTaskPhaseListCfg[var_2_79].phase_list
				local var_2_81 = {}

				for iter_2_63, iter_2_64 in ipairs(var_2_80) do
					local var_2_82 = string.format("%s_%d_%d", RedPointConst.NOOB_ADVANCE, iter_2_62, iter_2_63)

					var_2_81[#var_2_81 + 1] = var_2_82

					local var_2_83 = {}

					for iter_2_65, iter_2_66 in ipairs(iter_2_64[2]) do
						var_2_83[#var_2_83 + 1] = string.format("%s_%d_%d_%d", RedPointConst.NOOB_ADVANCE, iter_2_62, iter_2_63, iter_2_66[1])
					end

					arg_2_0:addGroup(var_2_82, var_2_83)
				end

				arg_2_0:addGroup(var_2_78, var_2_81)
			end

			arg_2_0:addGroup(RedPointConst.NOOB_ADVANCE, var_2_75)
		end
	end

	arg_2_0:addGroup(RedPointConst.GUILD, {
		RedPointConst.GUILD_REQUEST,
		RedPointConst.CLUB_TASK,
		RedPointConst.CLUB_WELFARE,
		RedPointConst.GUILD_MANAGER,
		RedPointConst.GUILD_BOSS
	})
	arg_2_0:addGroup(RedPointConst.GUILD_MANAGER, {
		RedPointConst.GUILD_IMPEACH,
		RedPointConst.GUILD_REQUEST
	})
	arg_2_0:addGroup(RedPointConst.DORM_MAIN, {
		RedPointConst.DORM_HERO_MOOD,
		RedPointConst.DORM_TOTAL_EARN,
		RedPointConst.DORM_SPECIAL_EVENT
	})
	arg_2_0:addGroup(RedPointConst.MATRIX_TERMINAL_GIFT, {
		RedPointConst.MATRIX_TERMINAL_GIFT_STRUGGLE,
		RedPointConst.MATRIX_TERMINAL_GIFT_SHELTER
	})

	local var_2_84 = {}

	for iter_2_67, iter_2_68 in pairs(WarchessLevelCfg.get_id_list_by_type) do
		if iter_2_67 ~= 0 then
			local var_2_85 = {}

			for iter_2_69, iter_2_70 in ipairs(iter_2_68) do
				table.insert(var_2_85, string.format("%s_%s_%s", RedPointConst.WAR_CHESS, iter_2_67, iter_2_70))
			end

			arg_2_0:addGroup(string.format("%s_%s", RedPointConst.WAR_CHESS, iter_2_67), var_2_85)
		end
	end

	local var_2_86 = {}

	for iter_2_71, iter_2_72 in ipairs(StageGroupCfg.get_id_list_by_type[BattleConst.STAGE_TYPE_NEW.OSIRIS_DEMON]) do
		table.insert(var_2_86, DemonChallengeData:GetRedPointConst(iter_2_71))
	end

	arg_2_0:addGroup(RedPointConst.OSIRIS_DEMON, var_2_86)

	for iter_2_73, iter_2_74 in ipairs(ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.HERO_TRIAL]) do
		local var_2_87 = ActivityCfg[iter_2_74].sub_activity_list
		local var_2_88 = {}

		for iter_2_75, iter_2_76 in pairs(var_2_87) do
			local var_2_89 = ActivityHeroTrialCfg.get_id_list_by_activity_id[iter_2_76]

			for iter_2_77, iter_2_78 in ipairs(var_2_89) do
				table.insert(var_2_88, string.format("%s_%s", RedPointConst.HERO_TRIAL, iter_2_78))
			end
		end

		arg_2_0:addGroup(string.format("%s_%s", RedPointConst.HERO_TRIAL, iter_2_74), var_2_88)
	end

	arg_2_0:addGroup(RedPointConst.OSIRIS_ACTIVITY, {
		string.format("%s_%s", RedPointConst.ACTIVITY_TASK, ActivityConst.OSIRIS_TASK_DAILY),
		string.format("%s_%s", RedPointConst.WAR_CHESS, ActivityConst.OSIRIS_CHESS),
		RedPointConst.OSIRIS_DEMON,
		RedPointConst.OSIRIS_RACE_TRIAL,
		string.format("%s_%s", RedPointConst.HERO_TRIAL, ActivityConst.OSIRIS_HERO_TRIAL_STAGE)
	})

	for iter_2_79, iter_2_80 in ipairs(ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.SKIN_TRIAL]) do
		local var_2_90 = ActivityCfg[iter_2_80].sub_activity_list
		local var_2_91 = {}

		for iter_2_81, iter_2_82 in pairs(var_2_90) do
			local var_2_92 = ActivitySkinTrialCfg.get_id_list_by_activity_id[iter_2_82]

			for iter_2_83, iter_2_84 in ipairs(var_2_92) do
				table.insert(var_2_91, string.format("%s_%s", RedPointConst.SKIN_TRIAL, iter_2_84))
			end
		end

		arg_2_0:addGroup(string.format("%s_%s", RedPointConst.SKIN_TRIAL, iter_2_80), var_2_91)
	end

	local var_2_93 = ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.SLAYER] or {}

	for iter_2_85, iter_2_86 in ipairs(var_2_93) do
		local var_2_94 = ActivityCfg[iter_2_86].sub_activity_list

		if #var_2_94 > 0 then
			local var_2_95 = {}

			for iter_2_87, iter_2_88 in ipairs(var_2_94) do
				arg_2_0:addGroup(string.format("%s_%s", RedPointConst.SLYAER_REGIONS, iter_2_88), {
					string.format("%s_%s", RedPointConst.SLAYER_REGIONS_SELECT, iter_2_88),
					string.format("%s_%s", RedPointConst.SLAYER_REGIONS_REWARD, iter_2_88)
				})

				var_2_95[#var_2_95 + 1] = string.format("%s_%s", RedPointConst.SLYAER_REGIONS, iter_2_88)
			end

			arg_2_0:addGroup(string.format("%s_%s", RedPointConst.SLYAER_REGIONS, iter_2_86), var_2_95)
		end

		arg_2_0:addGroup(string.format("%s_%s", RedPointConst.SLAYER, iter_2_86), {
			string.format("%s_%s", RedPointConst.SLYAER_REGIONS, iter_2_86),
			string.format("%s_%s", RedPointConst.SLYAER_REWARD, iter_2_86)
		})
	end

	local var_2_96 = ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.PARKOUR] or {}

	for iter_2_89, iter_2_90 in ipairs(var_2_96) do
		arg_2_0:addGroup(string.format("%s_%s", RedPointConst.PARKOUR, iter_2_90), {
			string.format("%s_%s", RedPointConst.PARKOUR_ENTRUST_ALL, iter_2_90)
		})
		arg_2_0:addGroup(string.format("%s_%s", RedPointConst.PARKOUR_ENTRUST_ALL, iter_2_90), {
			string.format("%s_%s", RedPointConst.PARKOUR_REWARD, iter_2_90),
			string.format("%s_%s", RedPointConst.PARKOUR_ENTRUST, iter_2_90)
		})

		local var_2_97 = ActivityCfg[iter_2_90].sub_activity_list
		local var_2_98 = {}

		for iter_2_91, iter_2_92 in ipairs(var_2_97) do
			table.insert(var_2_98, string.format("%s_%s", RedPointConst.PARKOUR_ENTRUST_REWARD, iter_2_92))
		end

		arg_2_0:addGroup(string.format("%s_%s", RedPointConst.PARKOUR_REWARD, iter_2_90), var_2_98)
	end

	arg_2_0:addGroup(RedPointConst.REGRESSION, {
		RedPointConst.REGRESSION_SIGN,
		RedPointConst.REGRESSION_SURVEY,
		RedPointConst.REGRESSION_TASK,
		RedPointConst.REGRESSION_BP,
		RedPointConst.REGRESSION_SUPPLY_FREE
	})
	arg_2_0:addGroup(RedPointConst.REGRESSION_TASK, {
		string.format("%s_%s", RedPointConst.REGRESSION_TASK, TaskConst.TASK_TYPE.REGRESSION_DAILY),
		string.format("%s_%s", RedPointConst.REGRESSION_TASK, TaskConst.TASK_TYPE.REGRESSION_WEEK),
		string.format("%s_%s", RedPointConst.REGRESSION_TASK, TaskConst.TASK_TYPE.REGRESSION_CHALLENGE)
	})
	arg_2_0:addGroup(RedPointConst.GUILD_BOSS, {
		RedPointConst.GUILD_BOSS_PREPOSE_FIRST_BONUS,
		RedPointConst.GUILD_BOSS_PERSONAL_BONUS,
		RedPointConst.GUILD_BOSS_COMMON_BONUS,
		RedPointConst.GUILD_BOSS_PREPOSE_OPEN,
		RedPointConst.GUILD_BOSS_CHALLENGE_OPEN
	})
	arg_2_0:addGroup(RedPointConst.GUILD_BOSS_BOSS_BTN, {
		RedPointConst.GUILD_BOSS_PERSONAL_BONUS,
		RedPointConst.GUILD_BOSS_COMMON_BONUS,
		RedPointConst.GUILD_BOSS_CHALLENGE_OPEN
	})

	local var_2_99 = ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.SINGLE_MATRIX] or {}

	for iter_2_93, iter_2_94 in ipairs(var_2_99) do
		arg_2_0:addGroup(string.format("%s_%s", RedPointConst.ACTIVITY_MATRIX, iter_2_94), {
			string.format("%s_%s", RedPointConst.ACTIVITY_MATRIX_REWARD, iter_2_94),
			string.format("%s_%s", RedPointConst.ACTIVITY_MATRIX_CLUE, iter_2_94),
			string.format("%s_%s", RedPointConst.ACTIVITY_MATRIX_READ, iter_2_94)
		})
	end

	local var_2_100 = ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.ACTIVITY_MUSIC] or {}

	for iter_2_95, iter_2_96 in ipairs(var_2_100) do
		arg_2_0:addGroup(string.format("%s_%s", RedPointConst.MUSIC, iter_2_96), {
			string.format("%s_%s", RedPointConst.MUSIC_OPEN, iter_2_96),
			string.format("%s_%s", RedPointConst.MUSIC_REWARD, iter_2_96)
		})
	end

	if not ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.ACTIVITY_ZUMA] then
		local var_2_101 = {}
	end

	local var_2_102 = {}

	table.insert(var_2_102, RedPointConst.ZUMA_REWARD)
	table.insert(var_2_102, RedPointConst.ZUMA_TALENT)

	local var_2_103 = ZumaData:GetZumaCfgData()

	for iter_2_97, iter_2_98 in pairs(ZumaConst.ZUMA_DIFFICULT or {}) do
		local var_2_104 = var_2_103[iter_2_98]
		local var_2_105 = {}

		for iter_2_99, iter_2_100 in ipairs(var_2_104) do
			table.insert(var_2_105, string.format("%s_%s", RedPointConst.ZUMA_OPEN, iter_2_100.activity_id))
		end

		local var_2_106 = string.format("%s_%s", RedPointConst.ZUMA_DIFFICULT, iter_2_98)

		arg_2_0:addGroup(var_2_106, var_2_105)
		table.insert(var_2_102, var_2_106)
	end

	arg_2_0:addGroup(RedPointConst.ZUMA .. ActivityConst.ACTIVITY_ZUMA, var_2_102)

	local var_2_107 = ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.STRATEGY_MATRIX] or {}

	for iter_2_101, iter_2_102 in ipairs(var_2_107) do
		local var_2_108 = StrategyMatrixCfg[iter_2_102]

		if var_2_108.activity_difficulty == 1 then
			arg_2_0:addGroup(string.format("%s_%s", RedPointConst.STRATEGY_MATRIX, iter_2_102), {
				string.format("%s_%s", RedPointConst.STRATEGY_MATRIX_OPEN, iter_2_102),
				string.format("%s_%s", RedPointConst.STRATEGY_MATRIX_REWARD, iter_2_102)
			})
		else
			local var_2_109 = var_2_108.pre_condition_args[1] and var_2_108.pre_condition_args[1][2][1]

			if var_2_109 then
				arg_2_0:addGroup(string.format("%s_%s", RedPointConst.STRATEGY_MATRIX, var_2_109), {
					string.format("%s_%s", RedPointConst.STRATEGY_MATRIX_OPEN, iter_2_102),
					string.format("%s_%s", RedPointConst.STRATEGY_MATRIX_REWARD, iter_2_102)
				})
			else
				print("困难模式的肉鸽，无法取到前置活动id,联系活动肉鸽策划")
			end
		end
	end

	local var_2_110 = ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.GUILD_ACTIVITY] or {}

	for iter_2_103, iter_2_104 in ipairs(var_2_110) do
		arg_2_0:addGroup(string.format("%s_%s", RedPointConst.GUILD_ACTIVITY, iter_2_104), {
			string.format("%s_%s", RedPointConst.GUILD_ACTIVITY_RATE, iter_2_104),
			RedPointConst.GUILD_ACTIVITY_UNREGISTER,
			string.format("%s_%s", RedPointConst.GUILD_ACTIVITY_UNGET_COIN, iter_2_104)
		})

		local var_2_111 = {}

		for iter_2_105, iter_2_106 in pairs(TalentTreeCfg.get_id_list_by_activity_id_and_race[iter_2_104]) do
			local var_2_112 = string.format("%s_%d_%d", RedPointConst.GUILD_ACTIVITY_AFFIX, iter_2_104, iter_2_105)

			var_2_111[#var_2_111 + 1] = var_2_112

			local var_2_113 = {}

			for iter_2_107, iter_2_108 in pairs(iter_2_106) do
				var_2_113[#var_2_113 + 1] = string.format("%s_%d_%d_%d", RedPointConst.GUILD_ACTIVITY_AFFIX, iter_2_104, iter_2_105, iter_2_108)
			end

			arg_2_0:addGroup(var_2_112, var_2_113)
		end

		arg_2_0:addGroup(string.format("%s_%d", RedPointConst.GUILD_ACTIVITY_AFFIX, iter_2_104), var_2_111)
	end

	local var_2_114 = GuildActivitySPTools:GetActivityState()

	for iter_2_109, iter_2_110 in pairs(var_2_114) do
		arg_2_0:addGroup(string.format("%s_%s", RedPointConst.GUILD_ACTIVITY_SP, iter_2_109), {
			RedPointConst.GUILD_ACTIVITY_SP_UNREGISTER
		})

		local var_2_115 = iter_2_110.start

		arg_2_0:addGroup(string.format("%s_%s", RedPointConst.GUILD_ACTIVITY_SP, iter_2_109), {
			string.format("%s_%s", RedPointConst.GUILD_ACTIVITY_SP_BONUS, var_2_115),
			string.format("%s_%s", RedPointConst.GUILD_ACTIVITY_SP_UNGET_COIN, var_2_115),
			string.format("%s_%s", RedPointConst.GUILD_ACTIVITY_SP_HERO_FIGHT, var_2_115)
		})

		local var_2_116 = {}

		if TalentTreeCfg.get_id_list_by_activity_id_and_race[var_2_115] then
			for iter_2_111, iter_2_112 in pairs(TalentTreeCfg.get_id_list_by_activity_id_and_race[var_2_115]) do
				local var_2_117 = string.format("%s_%d_%d", RedPointConst.GUILD_ACTIVITY_SP_AFFIX, var_2_115, iter_2_111)

				var_2_116[#var_2_116 + 1] = var_2_117

				local var_2_118 = {}

				for iter_2_113, iter_2_114 in pairs(iter_2_112) do
					var_2_118[#var_2_118 + 1] = string.format("%s_%d_%d_%d", RedPointConst.GUILD_ACTIVITY_SP_AFFIX, var_2_115, iter_2_111, iter_2_114)
				end

				arg_2_0:addGroup(var_2_117, var_2_118)
			end

			arg_2_0:addGroup(string.format("%s_%d", RedPointConst.GUILD_ACTIVITY_SP_AFFIX, var_2_115), var_2_116)
		end
	end

	local var_2_119 = ActivityCfg[ActivityConst.FACTORY_MARDUK].sub_activity_list
	local var_2_120 = {}

	for iter_2_115, iter_2_116 in ipairs(var_2_119) do
		table.insert(var_2_120, string.format("%s_%d", RedPointConst.MARDUK_SPECIAL_NOT_FIGHT, iter_2_116))
	end

	arg_2_0:addGroup(string.format("%s_%d", RedPointConst.MARDUK_SPECIAL_NOT_FIGHT, ActivityConst.FACTORY_MARDUK), var_2_120)
	arg_2_0:addGroup(string.format("%s_%d", RedPointConst.MARDUK_SPECIAL, ActivityConst.FACTORY_MARDUK), {
		string.format("%s_%d", RedPointConst.MARDUK_SPECIAL_NOT_FIGHT, ActivityConst.FACTORY_MARDUK),
		string.format("%s_%d", RedPointConst.MARDUK_SPECIAL_REWARD, ActivityConst.FACTORY_MARDUK)
	})

	local var_2_121 = ActivityCfg[ActivityConst.ACTIVITY_2_2_SPECIAL].sub_activity_list
	local var_2_122 = {}

	for iter_2_117, iter_2_118 in ipairs(var_2_121) do
		table.insert(var_2_122, string.format("%s_%d", RedPointConst.MARDUK_SPECIAL_NOT_FIGHT, iter_2_118))
	end

	arg_2_0:addGroup(string.format("%s_%d", RedPointConst.MARDUK_SPECIAL_NOT_FIGHT, ActivityConst.ACTIVITY_2_2_SPECIAL), var_2_122)
	arg_2_0:addGroup(string.format("%s_%d", RedPointConst.MARDUK_SPECIAL, ActivityConst.ACTIVITY_2_2_SPECIAL), {
		string.format("%s_%d", RedPointConst.MARDUK_SPECIAL_NOT_FIGHT, ActivityConst.ACTIVITY_2_2_SPECIAL),
		string.format("%s_%d", RedPointConst.MARDUK_SPECIAL_REWARD, ActivityConst.ACTIVITY_2_2_SPECIAL)
	})

	local var_2_123 = ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.FIRE_WORK_MAIN] or {}

	for iter_2_119, iter_2_120 in ipairs(var_2_123) do
		local var_2_124 = ActivityCfg[iter_2_120].sub_activity_list
		local var_2_125 = {}

		for iter_2_121, iter_2_122 in ipairs(var_2_124) do
			if ActivityCfg[iter_2_122].activity_template == ActivityTemplateConst.FIRE_WORK then
				local var_2_126 = string.format("%s_%s", RedPointConst.FIRE_WORK, iter_2_122)

				arg_2_0:addGroup(var_2_126, {
					string.format("%s_%s", RedPointConst.FIRE_WORK_OPEN, iter_2_122),
					string.format("%s_%s", RedPointConst.FIRE_WORK_REWARD, iter_2_122)
				})
				table.insert(var_2_125, var_2_126)
			end
		end

		arg_2_0:addGroup(string.format("%s_%s", RedPointConst.FIRE_WORK_MAIN, iter_2_120), var_2_125)
	end

	arg_2_0:addGroup(RedPointConst.CANTEEN_DISPATCH, {
		RedPointConst.CANTEEN_DISPATCH_FINISHED,
		RedPointConst.CANTEEN_DISPATCH_NONE,
		RedPointConst.CANTEEN_UNLOCK_ENTRUST
	})
	arg_2_0:addGroup(RedPointConst.CANTEEN, {
		RedPointConst.CANTEEN_DISPATCH,
		RedPointConst.CANTEEN_BUSINESS_STOPPED,
		RedPointConst.CANTEEN_JOB_AVAILABLE,
		RedPointConst.CANTEEN_UPGRADE_AVAILABLE,
		RedPointConst.CANTEEN_UNLOCK_FOOD,
		RedPointConst.CANTEEN_UNLOCK_ENTRUST
	})
	arg_2_0:addGroup(ActivityTools.GetRedPointKey(ActivityConst.SPRING_CANTEEN) .. ActivityConst.SPRING_CANTEEN, {
		RedPointConst.CANTEEN
	})

	local var_2_127 = #GameSetting.dorm_canteen_task_unlock.value
	local var_2_128 = {}

	for iter_2_123 = 1, var_2_127 do
		var_2_128[iter_2_123] = string.format("%s_%s", RedPointConst.CANTEEN_UNLOCK_ENTRUST, tostring(iter_2_123))
	end

	arg_2_0:addGroup(RedPointConst.CANTEEN_UNLOCK_ENTRUST, var_2_128)

	local var_2_129 = {}
	local var_2_130 = 1

	for iter_2_124, iter_2_125 in pairs(DormEnum.FurnitureTypeNum) do
		var_2_129[var_2_130] = string.format("%s_%s", RedPointConst.CANTEEN_UNLOCK_FOOD, tostring(iter_2_125))
		var_2_130 = var_2_130 + 1
	end

	arg_2_0:addGroup(RedPointConst.CANTEEN_UNLOCK_FOOD, var_2_129)

	for iter_2_126, iter_2_127 in pairs(DormEnum.FurnitureTypeNum) do
		local var_2_131 = {}

		for iter_2_128, iter_2_129 in ipairs(BackHomeCanteenFoodCfg.all) do
			if BackHomeCanteenFoodCfg[iter_2_129].cook_type == iter_2_127 then
				local var_2_132 = string.format("%s_%s_%s", RedPointConst.CANTEEN_UNLOCK_FOOD, tostring(iter_2_127), iter_2_129)

				table.insert(var_2_131, var_2_132)
			end
		end

		arg_2_0:addGroup(string.format("%s_%s", RedPointConst.CANTEEN_UNLOCK_FOOD, iter_2_127), var_2_131)
	end

	local var_2_133 = {}

	for iter_2_130, iter_2_131 in pairs(DormEnum.FurnitureMainType) do
		local var_2_134 = string.format("%s_%s", RedPointConst.CANTEEN_UPGRADE_AVAILABLE, tostring(iter_2_131))

		table.insert(var_2_133, var_2_134)
	end

	arg_2_0:addGroup(RedPointConst.CANTEEN_UPGRADE_AVAILABLE, var_2_133)
	arg_2_0:addGroup(RedPointConst.DORM, {
		RedPointConst.DORM_PLACEMENT
	})

	local var_2_135 = {}

	for iter_2_132, iter_2_133 in ipairs(BackHomeCfg.all) do
		if BackHomeCfg[iter_2_133].type == 3 then
			table.insert(var_2_135, RedPointConst.DORM_PLACEMENT_ROOM .. iter_2_133)
		end
	end

	arg_2_0:addGroup(RedPointConst.DORM_PLACEMENT, var_2_135)

	local var_2_136 = {}

	for iter_2_134 = DormConst.DORM_FUR_TYPE_START, DormConst.DORM_FUR_TYPE_END do
		table.insert(var_2_136, string.format("%s_%s", RedPointConst.DORM_FURNITURE, tostring(iter_2_134)))
	end

	table.insert(var_2_136, RedPointConst.DORM_SUIT)
	arg_2_0:addGroup(RedPointConst.DORM_FURNITURE, var_2_136)

	local var_2_137 = {}
	local var_2_138 = {}
	local var_2_139 = DormSuitData:GetSuitIDListByType(DormSuitTools.DORM_SUIT_TYPE.FULL_SET)

	for iter_2_135, iter_2_136 in ipairs(var_2_139) do
		local var_2_140 = BackHomeSuitCfg[iter_2_136].scene_id[1]

		if var_2_140 == DormConst.BACKHOME_TYPE.PublicDorm then
			table.insert(var_2_138, string.format("%s_%s", RedPointConst.DORM_FULL_PUBLIC_SUIT, tostring(iter_2_136)))
		elseif var_2_140 == DormConst.BACKHOME_TYPE.PrivateDorm then
			table.insert(var_2_137, string.format("%s_%s", RedPointConst.DORM_FULL_PRIVATE_SUIT, tostring(iter_2_136)))
		end
	end

	arg_2_0:addGroup(RedPointConst.DORM_FULL_PUBLIC_SUIT, var_2_138)
	arg_2_0:addGroup(RedPointConst.DORM_FULL_PRIVATE_SUIT, var_2_137)

	local var_2_141 = {}
	local var_2_142 = DormSuitData:GetSuitIDListByType(DormSuitTools.DORM_SUIT_TYPE.PART_SET)

	for iter_2_137, iter_2_138 in ipairs(var_2_142) do
		table.insert(var_2_141, string.format("%s_%s", RedPointConst.DORM_PART_SUIT, tostring(iter_2_138)))
	end

	arg_2_0:addGroup(RedPointConst.DORM_PART_SUIT, var_2_141)

	local var_2_143 = {}
	local var_2_144 = DormTools:GetAllDormShopIDList()

	for iter_2_139, iter_2_140 in ipairs(var_2_144) do
		local var_2_145 = DormSuitTools:GetFurSuitGoodListByShopID(iter_2_140)
		local var_2_146 = {}

		if #var_2_145 > 0 then
			for iter_2_141, iter_2_142 in ipairs(var_2_145) do
				table.insert(var_2_146, DormRedPointTools.FurnitureItemRedPoint(iter_2_140, iter_2_142))
			end

			local var_2_147 = ShopTools.GetShopRedPointKey(iter_2_140)

			arg_2_0:addGroup(var_2_147, var_2_146)
			table.insert(var_2_143, var_2_147)
		end
	end

	arg_2_0:addGroup(RedPointConst.DORM_SUIT_SHOP, var_2_143)
	arg_2_0:addGroup(RedPointConst.BACKHOME, {
		RedPointConst.DORM,
		RedPointConst.CANTEEN
	})
	arg_2_0:addGroup(RedPointConst.ABYSS, {
		RedPointConst.ABYSS_REWARD,
		RedPointConst.ABYSS_CHALLENGE,
		string.format(ServerRedPointPrefix, ServerRedPoint.DISORDER_TRAP_NEW_RED, "ROOT")
	})

	local var_2_148 = MailSpecialLetterCfg.get_id_list_by_letter_belongs
	local var_2_149 = {}

	for iter_2_143, iter_2_144 in pairs(var_2_148) do
		table.insert(var_2_149, RedPointConst.LETTER_SENDER_ID .. iter_2_143)

		local var_2_150 = {}

		for iter_2_145, iter_2_146 in pairs(iter_2_144) do
			table.insert(var_2_150, RedPointConst.LETTER_ID .. iter_2_146)
		end

		arg_2_0:addGroup(RedPointConst.LETTER_SENDER_ID .. iter_2_143, var_2_150)
	end

	arg_2_0:addGroup(RedPointConst.LETTER_UNREAD, var_2_149)
	arg_2_0:addGroup(RedPointConst.MAIL_UNREAD, {
		RedPointConst.LETTER_UNREAD
	})
	arg_2_0:addGroup(RedPointConst.POLYHEDRON, {
		RedPointConst.POLYHEDRON_BEACON_UNLOCK,
		RedPointConst.POLYHEDRON_POLICY_LEVEL_REWARD,
		RedPointConst.POLYHEDRON_HERO_UNLOCK,
		RedPointConst.POLYHEDRON_TASK,
		RedPointConst.POLYHEDRON_TERMINAL_GIFT,
		RedPointConst.POLYHEDRON_NEW_SECTION
	})

	local var_2_151 = ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.POLYHEDRON_ACTIVITY]
	local var_2_152 = {}
	local var_2_153 = {}

	for iter_2_147, iter_2_148 in ipairs(var_2_151) do
		local var_2_154 = ActivityCfg[iter_2_148].season_task_activity_list or {}
		local var_2_155 = ActivityCfg[iter_2_148].achievement_task_activity_list or {}

		for iter_2_149, iter_2_150 in ipairs(var_2_154) do
			var_2_152[#var_2_152 + 1] = string.format("%s_%s", RedPointConst.ACTIVITY_TASK, iter_2_150)
		end

		for iter_2_151, iter_2_152 in ipairs(var_2_155) do
			var_2_153[#var_2_153 + 1] = string.format("%s_%s", RedPointConst.ACTIVITY_TASK, iter_2_152)
		end
	end

	arg_2_0:addGroup(RedPointConst.POLYHEDRON_TASK_SEASON, var_2_152)
	arg_2_0:addGroup(RedPointConst.POLYHEDRON_TASK_ACHIEVEMENT, var_2_153)
	arg_2_0:addGroup(RedPointConst.POLYHEDRON_TASK, {
		RedPointConst.POLYHEDRON_TASK_SEASON,
		RedPointConst.POLYHEDRON_TASK_ACHIEVEMENT
	})
	arg_2_0:addGroup(RedPointConst.RECALL, {
		RedPointConst.RECALL_SIGN,
		RedPointConst.RECALL_TASK,
		RedPointConst.RECALL_REWARD
	})

	local var_2_156 = {}

	for iter_2_153 = 1, #ExploreMeowCfg.all do
		local var_2_157 = ExploreMeowCfg.all[iter_2_153]

		var_2_156[iter_2_153] = RedPointConst.EXPLORE_UNLOCK_ADMIN_CAT .. var_2_157
	end

	local var_2_158 = {}

	for iter_2_154 = 1, #ExploreAreaCfg.all do
		local var_2_159 = ExploreAreaCfg.all[iter_2_154]

		var_2_158[iter_2_154] = RedPointConst.EXPLORE_FINISH .. var_2_159
	end

	arg_2_0:addGroup(RedPointConst.EXPLORE_UNLOCK_ADMIN_CAT, var_2_156)
	arg_2_0:addGroup(RedPointConst.EXPLORE_FINISH, var_2_158)
	arg_2_0:addGroup(RedPointConst.EXPLORE_MAIN, {
		RedPointConst.EXPLORE_REWARD,
		RedPointConst.EXPLORE_UNLOCK_ADMIN_CAT,
		RedPointConst.EXPLORE_FINISH,
		RedPointConst.EXPLORE_QUEUE
	})
	arg_2_0:addGroup(RedPointConst.INVITE_MAIN, {
		RedPointConst.INVITE_DRAW,
		RedPointConst.INVITE_PLOT
	})
	arg_2_0:addGroup(RedPointConst.SETTING_SCREEN, {
		RedPointConst.HIGH_FPS_DEVICE_SURRPORT
	})
	arg_2_0:addGroup(RedPointConst.SETTING_NEW_FUNCTION, {
		RedPointConst.SETTING_SCREEN,
		RedPointConst.SETTING_REMIND
	})

	local var_2_160 = {}

	for iter_2_155, iter_2_156 in ipairs(RechargeRecommendCfg.all) do
		table.insert(var_2_160, RedPointConst.RECHARGE_RECOMMEND .. iter_2_156)
	end

	arg_2_0:addGroup(RedPointConst.RECHARGE_RECOMMEND, var_2_160)

	for iter_2_157, iter_2_158 in ipairs(ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.STRONGHOLD]) do
		arg_2_0:addGroup(string.format("%s_%s", RedPointConst.STRONGHOLD, iter_2_158), {
			string.format("%s_%s", RedPointConst.STRONGHOLD_REWARD, iter_2_158),
			string.format("%s_%s", RedPointConst.STRONGHOLD_INCREASE, iter_2_158),
			string.format("%s_%s", RedPointConst.STRONGHOLD_TASK, iter_2_158)
		})
	end

	arg_2_0:addGroup(RedPointConst.SOLO_HEART_DEMON, {
		RedPointConst.SOLO_HEART_DEMON_FIRST_VIEW,
		RedPointConst.SOLO_HEART_DEMON_REWARD
	})

	local var_2_161 = {}

	for iter_2_159, iter_2_160 in ipairs(ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.ACTIVITY_SKIN_DRAW]) do
		table.insert(var_2_161, RedPointConst.ACTIVITY_DRAW .. "_" .. iter_2_160)
	end

	arg_2_0:addGroup(RedPointConst.ACTIVITY_DRAW, var_2_161)

	local var_2_162 = ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.ACTIVITY_ATTRIBUTE_ARENA] or {}

	for iter_2_161, iter_2_162 in ipairs(var_2_162) do
		arg_2_0:addGroup(string.format("%s_%s", RedPointConst.ACTIVITY_ATTRIBUTE_ARENA, iter_2_162), {
			string.format("%s_%s", RedPointConst.ACTIVITY_ATTRIBUTE_ARENA_TASK, iter_2_162),
			string.format("%s_%s", RedPointConst.ACTIVITY_ATTRIBUTE_ARENA_ENTER, iter_2_162)
		})
	end

	arg_2_0:addGroup(RedPointConst.CORE_VERIFICATION, {
		RedPointConst.CORE_VERIFICATION_REWARD,
		RedPointConst.CORE_VERIFICATION_CHALLENGE
	})
	arg_2_0:addGroup(RedPointConst.CORE_VERIFICATION_REWARD, {
		RedPointConst.CORE_VERIFICATION_REWARD1,
		RedPointConst.CORE_VERIFICATION_REWARD2,
		RedPointConst.CORE_VERIFICATION_REWARD3,
		RedPointConst.CORE_VERIFICATION_REWARD4
	})

	local var_2_163 = SPHeroChallengeData.activityCfg[ActivityConst.ACTIVITY_HERO_CHALLENGE_3_1].heroChipActivityID
	local var_2_164 = SPHeroChallengeData.activityCfg[ActivityConst.ACTIVITY_HERO_CHALLENGE_3_1].taskActivityID

	arg_2_0:addGroup(RedPointConst.SP_HERO_CHALLENGE_3_1, {
		RedPointConst.SP_HERO_CHALLENGE_3_1_ENTRUST,
		string.format("%s_%s", RedPointConst.ACTIVITY_TASK, var_2_163),
		string.format("%s_%s", RedPointConst.ACTIVITY_TASK, var_2_164)
	})
end

function var_0_0.InitData(arg_3_0)
	arg_3_0._redPointHelper:InitData()
end

function var_0_0.Dispose(arg_4_0)
	arg_4_0._redPointHelper:Dispose()
end

function var_0_0.setTip(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	return arg_5_0._redPointHelper:setTip(arg_5_1, arg_5_2, arg_5_3)
end

function var_0_0.getTipValue(arg_6_0, arg_6_1)
	return arg_6_0._redPointHelper:getTipValue(arg_6_1)
end

function var_0_0.getchildKeys(arg_7_0, arg_7_1)
	return arg_7_0._redPointHelper:getchildKeys(arg_7_1)
end

function var_0_0.getTipBoolean(arg_8_0, arg_8_1)
	return arg_8_0._redPointHelper:getTipBoolean(arg_8_1)
end

function var_0_0.addGroup(arg_9_0, arg_9_1, arg_9_2, arg_9_3)
	arg_9_0._redPointHelper:addGroup(arg_9_1, arg_9_2, arg_9_3)
end

function var_0_0.appendGroup(arg_10_0, arg_10_1, arg_10_2, arg_10_3)
	arg_10_0._redPointHelper:appendToGroup(arg_10_1, arg_10_2, arg_10_3)
end

function var_0_0.delGroup(arg_11_0, arg_11_1, arg_11_2)
	arg_11_0._redPointHelper:delGroup(arg_11_1, arg_11_2)
end

function var_0_0.updateKey(arg_12_0, arg_12_1)
	arg_12_0._redPointHelper:updateKey(arg_12_1)
end

function var_0_0.bindUIandKey(arg_13_0, arg_13_1, arg_13_2, arg_13_3)
	arg_13_0._redPointHelper:bindUIandKey(arg_13_1, arg_13_2, arg_13_3)
end

function var_0_0.unbindUIandKey(arg_14_0, arg_14_1, arg_14_2)
	arg_14_0._redPointHelper:unbindUIandKey(arg_14_1, arg_14_2)
end

function var_0_0.setRedPoint(arg_15_0, arg_15_1, arg_15_2, arg_15_3)
	if arg_15_2 then
		arg_15_0._redPointHelper:ChangeRedStyle(arg_15_1, arg_15_3 or RedPointStyle.NORMAL, nil, nil, arg_15_2)
	else
		arg_15_0._redPointHelper:ChangeRedStyle(arg_15_1, RedPointStyle.None, nil, nil, arg_15_2)
	end
end

function var_0_0.ForceHideRedPoint(arg_16_0, arg_16_1)
	local var_16_0 = arg_16_1:Find("notice_img")

	if var_16_0 then
		SetActive(var_16_0.gameObject, false)
	end
end

function var_0_0.SetRedPointIndependent(arg_17_0, arg_17_1, arg_17_2, arg_17_3, arg_17_4)
	if arg_17_2 then
		arg_17_0._redPointHelper:ChangeRedStyle({
			display = arg_17_1
		}, arg_17_4 or RedPointStyle.NORMAL, arg_17_3, nil, arg_17_2)
	else
		arg_17_0._redPointHelper:ChangeRedStyle({
			display = arg_17_1
		}, RedPointStyle.None, arg_17_3, nil, arg_17_2)
	end
end

function var_0_0.ShowRedGraph(arg_18_0, arg_18_1)
	return manager.redPoint._redPointHelper:GetRedGraphWithKey(arg_18_0)
end

function var_0_0.PrintAllRedNode()
	return {
		data = "HHH"
	}
end

function var_0_0.PrintAllKey()
	local var_20_0 = manager.redPoint._redPointHelper:GetAllKey()

	for iter_20_0, iter_20_1 in ipairs(var_20_0) do
		var_20_0 = var_20_0 .. ","
	end

	return {
		data = table.concat(var_20_0)
	}
end

function var_0_0.PrintAllNilKey()
	local var_21_0 = manager.redPoint._redPointHelper:GetAllKey()

	for iter_21_0, iter_21_1 in ipairs(var_21_0) do
		if string.find(iter_21_1, "nil") then
			Debug.LogError(iter_21_1)
		end
	end
end

return var_0_0
