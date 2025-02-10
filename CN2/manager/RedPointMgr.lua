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
		elseif iter_2_7 == 6010012 then
			local var_2_10 = ActivityConst.SUMMER_CHESS_BOARD_MAIN

			table.insert(var_2_9, string.format("%s%s", ActivityTools.GetRedPointKey(var_2_10), var_2_10))
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

	local var_2_11 = {}
	local var_2_12 = ChapterClientCfg.get_id_list_by_toggle[401]

	for iter_2_10, iter_2_11 in ipairs(var_2_12) do
		table.insert(var_2_11, RedPointConst.TOWER_NEW_LEVEL + iter_2_11)
	end

	arg_2_0:addGroup(RedPointConst.TOWER, var_2_11)
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
		RedPointConst.CORE_VERIFICATION,
		RedPointConst.CHALLENGE_ROGUE_TEAM
	})
	arg_2_0:addGroup(RedPointConst.CHALLENGE_DEMO, {
		RedPointConst.COOPERATION_DEMO
	})
	arg_2_0:addGroup(RedPointConst.TEACH, {
		RedPointConst.TEACH_BASE,
		RedPointConst.TEACH_CHARACTER
	})
	arg_2_0:AddRogueTeamGroup()

	local var_2_13 = ChapterTools.GetRedPoint(ChapterConst.DAILY_EQUIP_EXPERIENCE)

	arg_2_0:addGroup(RedPointConst.COMBAT_EQUIP, {
		RedPointConst.BATTLE_EQUIP,
		RedPointConst.EQUIP_SEIZURE,
		var_2_13,
		RedPointConst.DAILY_EQUIP_ENCHANT
	})
	arg_2_0:addGroup(var_2_13, {
		GetSystemNewRedKeyByChapter(ChapterConst.DAILY_EQUIP_EXPERIENCE)
	})
	arg_2_0:addGroup(RedPointConst.DAILY_EQUIP_ENCHANT, {
		GetSystemNewRedKeyByChapter(ChapterConst.DAILY_EQUIP_ENCHANT)
	})
	arg_2_0:addGroup(RedPointConst.EQUIP_SEIZURE, {
		RedPointConst.EQUIP_SEIZURE_REWARD,
		RedPointConst.EQUIP_SEIZURE_UNREAD
	})

	local var_2_14 = {}

	for iter_2_12, iter_2_13 in pairs(ChapterClientCfg.get_id_list_by_toggle[BattleConst.TOGGLE.RESOURCE] or {}) do
		local var_2_15 = ChapterTools.GetRedPoint(iter_2_13)

		table.insert(var_2_14, var_2_15)
		arg_2_0:addGroup(var_2_15, {
			GetSystemNewRedKeyByChapter(iter_2_13)
		})
	end

	arg_2_0:addGroup(RedPointConst.RESOURSE_STAGE, var_2_14)

	local var_2_16 = {}
	local var_2_17 = {}

	for iter_2_14, iter_2_15 in pairs(HeroCfg.get_id_list_by_private[0]) do
		local var_2_18 = RedPointConst.HERO_ID .. iter_2_15

		table.insert(var_2_17, var_2_18)

		local var_2_19 = RedPointConst.HERO_WEAPON_BREAK_ID .. iter_2_15
		local var_2_20 = RedPointConst.WEAPON_MODULE_UNLOCK .. "_" .. iter_2_15
		local var_2_21 = RedPointConst.HERO_WEAPON .. iter_2_15

		arg_2_0:addGroup(var_2_21, {
			var_2_19
		})

		local var_2_22 = RedPointConst.HERO_UNLOCK_ID .. iter_2_15
		local var_2_23 = RedPointConst.HERO_PROPERTY_PAGE .. iter_2_15
		local var_2_24 = RedPointConst.HERO_STAR_ID .. iter_2_15
		local var_2_25 = RedPointConst.HERO_SKIN_ID .. iter_2_15
		local var_2_26 = {}
		local var_2_27 = SkinCfg.get_id_list_by_hero[iter_2_15]

		for iter_2_16, iter_2_17 in pairs(var_2_27) do
			table.insert(var_2_26, RedPointConst.HERO_SKIN_ROUTE_ID .. iter_2_17)
		end

		arg_2_0:addGroup(var_2_25, var_2_26)

		local var_2_28 = {}
		local var_2_29 = {}

		for iter_2_18, iter_2_19 in pairs(SkinCfg.get_id_list_by_hero[iter_2_15]) do
			local var_2_30 = RedPointConst.HERO_SKIN_ID_EXTEND .. iter_2_19

			table.insert(var_2_28, var_2_30)

			if #SkinCfg[iter_2_19].gift > 0 then
				local var_2_31 = RedPointConst.SKIN_GIFT .. "_" .. iter_2_19

				table.insert(var_2_29, var_2_31)
			end
		end

		local var_2_32 = {}

		table.insertto(var_2_32, var_2_28)
		table.insertto(var_2_32, var_2_29)
		arg_2_0:addGroup(var_2_25, var_2_32)

		local var_2_33 = string.format("%s_%s", RedPointConst.HERO_REALTION, iter_2_15)
		local var_2_34 = string.format("%s_%s", RedPointConst.HERO_REALTION_UNLOCK, iter_2_15)
		local var_2_35 = string.format("%s_%s", RedPointConst.HERO_RELATION_STORY, iter_2_15)
		local var_2_36 = string.format("%s_%s", RedPointConst.HERO_RELATION_COMBO_SKILL, iter_2_15)

		arg_2_0:addGroup(var_2_33, {
			var_2_34,
			var_2_35,
			var_2_36
		})
		arg_2_0:addGroup(var_2_23, {
			var_2_24,
			var_2_25,
			var_2_22,
			var_2_20
		})
		table.insert(var_2_16, RedPointConst.HERO_HEART_STORY_ROOT_ID .. iter_2_15)

		local var_2_37 = HeroTools.GetHeroOntologyID(iter_2_15)

		arg_2_0:addGroup(RedPointConst.HERO_ARCHIVE_ID .. iter_2_15, {
			RedPointConst.HERO_HEARTLINK_ID .. var_2_37,
			string.format("%s_%s", RedPointConst.HERO_TRUST_UP_LEVEL, iter_2_15),
			var_2_33
		})

		for iter_2_20 = 1, HeroConst.HERO_HEARTLINK_STORY_MAX_COUNT do
			local var_2_38 = table.concat({
				RedPointConst.HERO_HEARTLINK_ID,
				var_2_37,
				"_",
				iter_2_20
			})

			arg_2_0:addGroup(RedPointConst.HERO_HEARTLINK_ID .. var_2_37, {
				var_2_38
			})
		end

		arg_2_0:addGroup(var_2_18, {
			var_2_24,
			var_2_25,
			var_2_22
		})
	end

	arg_2_0:addGroup(RedPointConst.HERO, var_2_17)
	arg_2_0:addGroup(RedPointConst.HERO_HEART_STORY_ROOT_FULL, var_2_16)

	local var_2_39 = {
		RedPointConst.TAROT_SIGN,
		RedPointConst.BIG_MONTH_CARD
	}
	local var_2_40 = ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.SEVEN_SIGN] or {}

	for iter_2_21, iter_2_22 in ipairs(var_2_40) do
		table.insert(var_2_39, string.format("%s_%s", RedPointConst.SIGN_SEVEN_DAY, iter_2_22))
	end

	arg_2_0:addGroup(RedPointConst.SIGN, var_2_39)

	local var_2_41 = {}
	local var_2_42 = ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.SEVEN_DAY_SIGN_SKIN] or {}

	for iter_2_23, iter_2_24 in ipairs(var_2_42) do
		table.insert(var_2_41, string.format("%s_%s", RedPointConst.SEVEN_DAY_SIGN_SKIN, iter_2_24))
	end

	arg_2_0:addGroup(RedPointConst.SEVEN_DAY_SIGN_SKIN, var_2_41)

	local var_2_43 = {}
	local var_2_44 = ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.SEVEN_DAY_SIGN_SKIN_LUWU] or {}

	for iter_2_25, iter_2_26 in ipairs(var_2_44) do
		table.insert(var_2_43, string.format("%s_%s", RedPointConst.SEVEN_DAY_SIGN_SKIN, iter_2_26))
	end

	arg_2_0:addGroup(RedPointConst.SEVEN_DAY_SIGN_SKIN, var_2_43)

	local var_2_45 = {}
	local var_2_46 = ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.SEVEN_DAY_SIGN_SKIN_WORLD_LINE] or {}

	for iter_2_27, iter_2_28 in ipairs(var_2_46) do
		table.insert(var_2_45, string.format("%s_%s", RedPointConst.SEVEN_DAY_SIGN_SKIN, iter_2_28))
	end

	arg_2_0:addGroup(RedPointConst.SEVEN_DAY_SIGN_SKIN, var_2_45)

	local var_2_47 = {}
	local var_2_48 = ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.SEVEN_DAY_SIGN_SKIN_WORLD_LINE] or {}

	for iter_2_29, iter_2_30 in ipairs(var_2_48) do
		table.insert(var_2_47, string.format("%s_%s", RedPointConst.SEVEN_DAY_SIGN_SKIN, iter_2_30))
	end

	arg_2_0:addGroup(RedPointConst.SEVEN_DAY_SIGN_SKIN, var_2_47)

	local var_2_49 = ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.NORSE_SURPRISE_GIFT_DRAW] or {}

	for iter_2_31, iter_2_32 in ipairs(var_2_49) do
		local var_2_50 = string.format("%s_%s", RedPointConst.ACTIVITY_3_0_SURPRISE_GIFT_DRAW, iter_2_32)
		local var_2_51 = string.format("%s_%s", RedPointConst.ACTIVITY_3_0_SURPRISE_GIFT_RECEIVE, iter_2_32)
		local var_2_52 = string.format("%s_%s", RedPointConst.ACTIVITY_3_0_SURPRISE_GIFT, iter_2_32)

		arg_2_0:addGroup(var_2_52, {
			var_2_50,
			var_2_51
		})
	end

	local var_2_53 = string.format("%s_%s", RedPointConst.ACTIVITY_3_0_SURPRISE_GIFT, ActivityConst.ACTIVITY_3_0_SURPRISE_GIFT_DRAW)

	arg_2_0:addGroup(string.format("%s_%s", RedPointConst.SEVEN_DAY_SIGN_SKIN, ActivityConst.ACTIVITY_3_0_SEVEN_DAY_SKIN_SIGN), {
		var_2_53
	})

	local var_2_54 = {}
	local var_2_55 = {}
	local var_2_56 = {}

	for iter_2_33, iter_2_34 in ipairs(ChipCfg.get_id_list_by_type_id[ChipConst.TYPE_MANAGER]) do
		table.insert(var_2_55, string.format("%s_%s", RedPointConst.CHIP_MANAGER, iter_2_34))
		table.insert(var_2_56, string.format("%s_%s", RedPointConst.CHIP_MANAGER, iter_2_34))
	end

	for iter_2_35, iter_2_36 in ipairs(ChipCfg.get_id_list_by_type_id[ChipConst.TYPE_CHIP]) do
		table.insert(var_2_54, string.format("%s_%s", RedPointConst.CHIP_CHIP, iter_2_36))
		table.insert(var_2_56, string.format("%s_%s", RedPointConst.CHIP_CHIP, iter_2_36))
	end

	arg_2_0:addGroup(RedPointConst.CHIP_CHIP, var_2_54)
	arg_2_0:addGroup(RedPointConst.CHIP_MANAGER_CHIP, var_2_55)
	arg_2_0:addGroup(RedPointConst.CHIP_MANAGER, var_2_56)

	for iter_2_37, iter_2_38 in pairs(ChipCfg.get_id_list_by_spec_char) do
		if iter_2_37 > 0 then
			local var_2_57 = RedPointConst.CHIP_HERO_CHIP .. "_" .. iter_2_37
			local var_2_58 = {}
			local var_2_59 = {}

			for iter_2_39, iter_2_40 in pairs(iter_2_38) do
				local var_2_60 = RedPointConst.CHIP_HERO_CHIP .. "_" .. iter_2_37 .. "_" .. ChipCfg[iter_2_40].role_type_id .. "_" .. iter_2_40

				if var_2_58[ChipCfg[iter_2_40].role_type_id] then
					table.insert(var_2_58[ChipCfg[iter_2_40].role_type_id], var_2_60)
				else
					var_2_58[ChipCfg[iter_2_40].role_type_id] = {
						var_2_60
					}
				end

				local var_2_61 = RedPointConst.CHIP_HERO_CURRENCY_CHIP .. "_" .. iter_2_37 .. "_" .. ChipCfg[iter_2_40].role_type_id .. "_" .. iter_2_40

				if var_2_59[ChipCfg[iter_2_40].role_type_id] then
					table.insert(var_2_59[ChipCfg[iter_2_40].role_type_id], var_2_61)
				else
					var_2_59[ChipCfg[iter_2_40].role_type_id] = {
						var_2_61
					}
				end
			end

			local var_2_62 = {}

			for iter_2_41, iter_2_42 in pairs(var_2_58) do
				local var_2_63 = RedPointConst.CHIP_HERO_CHIP .. "_" .. iter_2_37 .. "_" .. iter_2_41

				arg_2_0:addGroup(var_2_63, var_2_58[iter_2_41])
				table.insert(var_2_62, var_2_63)
			end

			for iter_2_43, iter_2_44 in pairs(var_2_59) do
				local var_2_64 = RedPointConst.CHIP_HERO_CURRENCY_CHIP .. "_" .. iter_2_37 .. "_" .. iter_2_43

				arg_2_0:addGroup(var_2_64, var_2_59[iter_2_43])
			end

			arg_2_0:addGroup(var_2_57, var_2_62)
		end
	end

	arg_2_0:addGroup(RedPointConst.FRIEND, {
		RedPointConst.FRIEND_FRIEND_REQUESTS
	})

	local var_2_65 = {}

	for iter_2_45, iter_2_46 in ipairs(ItemCfg.get_id_list_by_type[ItemConst.ITEM_TYPE.SCENE]) do
		local var_2_66 = HomeSceneSettingCfg[iter_2_46]

		if var_2_66 and var_2_66.limit_display == 1 then
			table.insert(var_2_65, RedPointConst.SCENE .. "_" .. iter_2_46)
		end
	end

	arg_2_0:addGroup(RedPointConst.SCENE_NORMAL, var_2_65)

	local var_2_67 = {}

	for iter_2_47, iter_2_48 in pairs(SkinSceneActionCfg.get_id_list_by_special_scene_id) do
		local var_2_68 = HomeSceneSettingCfg[iter_2_47]

		if var_2_68 and var_2_68.limit_display and var_2_68.limit_display == 0 then
			table.insert(var_2_67, RedPointConst.SCENE .. "_" .. iter_2_47)
		end
	end

	arg_2_0:addGroup(RedPointConst.SCENE_DLC, var_2_67)
	arg_2_0:addGroup(RedPointConst.SCENE, {
		RedPointConst.SCENE_NORMAL,
		RedPointConst.SCENE_DLC
	})
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
		RedPointConst.ILLU_USER
	})
	arg_2_0:addGroup(RedPointConst.MAIN_HOME_MENU, {
		RedPointConst.MAIN_HOME_FUNC,
		RedPointConst.MAIN_HOME_SDK
	})

	local var_2_69 = {}

	for iter_2_49, iter_2_50 in pairs(AchievementCfg.get_id_list_by_type_id) do
		table.insert(var_2_69, string.format("%s_%s", RedPointConst.ACHIEVEMENT, iter_2_49))
	end

	local var_2_70 = {}

	for iter_2_51, iter_2_52 in pairs(AchievementStoryCfg.all) do
		table.insert(var_2_70, string.format("%s_%s", RedPointConst.ACHIEVEMENT_STORY, iter_2_52))
	end

	arg_2_0:addGroup(RedPointConst.ACHIEVEMENT_STORY, var_2_70)
	table.insertto(var_2_69, var_2_70)
	arg_2_0:addGroup(RedPointConst.ACHIEVEMENT, var_2_69)

	local var_2_71 = {}
	local var_2_72 = {}
	local var_2_73 = {}
	local var_2_74 = {}

	for iter_2_53, iter_2_54 in ipairs(ProfileDecorateItemCfg.all) do
		local var_2_75 = ProfileDecorateItemCfg[iter_2_54]

		if var_2_75.item_type == 4 then
			table.insert(var_2_71, RedPointConst.CUSTOM_STICKER_ITEM .. "_" .. iter_2_54)
		elseif var_2_75.item_type == 5 then
			table.insert(var_2_73, RedPointConst.CUSTOM_STICKER_ITEM .. "_" .. iter_2_54)
		elseif var_2_75.item_type == 6 then
			table.insert(var_2_72, RedPointConst.CUSTOM_STICKER_ITEM .. "_" .. iter_2_54)
		end
	end

	for iter_2_55, iter_2_56 in ipairs(StickerSuitCfg.all) do
		table.insert(var_2_74, RedPointConst.CUSTOM_STICKER_SUIT_REWARD .. "_" .. iter_2_56)
	end

	arg_2_0:addGroup(RedPointConst.CUSTOM_STICKER_BG, var_2_71)
	arg_2_0:addGroup(RedPointConst.CUSTOM_STICKER_FG, var_2_72)
	arg_2_0:addGroup(RedPointConst.CUSTOM_STICKER_ST, var_2_73)
	arg_2_0:addGroup(RedPointConst.CUSTOM_STICKER_SUIT_REWARD, var_2_74)
	arg_2_0:addGroup(RedPointConst.CUSTOM_STICKER_CATEGORY, {
		RedPointConst.CUSTOM_STICKER_ST,
		RedPointConst.CUSTOM_STICKER_BG,
		RedPointConst.CUSTOM_STICKER_FG
	})
	arg_2_0:addGroup(RedPointConst.CUSTOM_STICKER_ROOT, {
		RedPointConst.CUSTOM_STICKER_CATEGORY,
		RedPointConst.CUSTOM_STICKER_SUIT_REWARD
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

	local var_2_76 = {}
	local var_2_77 = ItemCfg.get_id_list_by_type[ItemConst.ITEM_TYPE.TAG]

	for iter_2_57, iter_2_58 in ipairs(var_2_77) do
		if ItemCfg[iter_2_58].sub_type ~= ItemConst.ITEM_SUB_TYPE.TAG_LIMIT then
			table.insert(var_2_76, RedPointConst.TAG .. "_" .. iter_2_58)
		end
	end

	arg_2_0:addGroup(RedPointConst.TAG, var_2_76)

	local var_2_78 = {}
	local var_2_79 = ItemCfg.get_id_list_by_type[ItemConst.ITEM_TYPE.CARD_BG]

	for iter_2_59, iter_2_60 in ipairs(var_2_79) do
		if ItemCfg[iter_2_60].sub_type ~= ItemConst.ITEM_SUB_TYPE.CARD_BG_LIMIT then
			table.insert(var_2_78, RedPointConst.CARD_BG .. "_" .. iter_2_60)
		end
	end

	arg_2_0:addGroup(RedPointConst.CARD_BG, var_2_78)

	local var_2_80 = {}
	local var_2_81 = GameSetting.profile_chat_bubble_default.value[1]

	for iter_2_61, iter_2_62 in ipairs(ItemCfg.get_id_list_by_type[ItemConst.ITEM_TYPE.CHAT_BUBBLE]) do
		if iter_2_62 ~= var_2_81 then
			table.insert(var_2_80, string.format("%s_%s", RedPointConst.CHAT_BUBBLE, iter_2_62))
		end
	end

	arg_2_0:addGroup(RedPointConst.CHAT_BUBBLE, var_2_80)
	arg_2_0:addGroup(RedPointConst.USER_CUSTOM, {
		RedPointConst.CHAT_BUBBLE
	})
	arg_2_0:addGroup(RedPointConst.ILLU_MAIN, {
		RedPointConst.BRITHDAY,
		RedPointConst.TAG,
		RedPointConst.USER_CUSTOM
	})
	arg_2_0:addGroup(RedPointConst.ILLU_HERO, {
		RedPointConst.HERO_RACE_COLLECT_REWARD
	})

	local var_2_82 = {}

	for iter_2_63, iter_2_64 in ipairs(ActivityMonsterCosplayCfg.all) do
		local var_2_83 = ActivityMonsterCosplayCfg[iter_2_64]

		var_2_82[iter_2_64] = {}

		for iter_2_65, iter_2_66 in ipairs(var_2_83.skill_list) do
			table.insert(var_2_82[iter_2_64], "MonsterCosPlay" .. iter_2_66)
		end
	end

	local var_2_84 = {}

	for iter_2_67, iter_2_68 in ipairs(ActivityMonsterCosplayCfg.all) do
		arg_2_0:addGroup("MonsterCosPlayMonsterID" .. iter_2_68, var_2_82[iter_2_68])
		table.insert(var_2_84, "MonsterCosPlayMonsterID" .. iter_2_68)
	end

	arg_2_0:addGroup(RedPointConst.MONSTER_COSPLAY_SKILL, var_2_84)
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

	local var_2_85 = {}

	for iter_2_69, iter_2_70 in ipairs(NoobVersionCfg.all) do
		local var_2_86 = NoobVersionCfg[iter_2_70]
		local var_2_87 = var_2_86.noob_advance_task_type

		if type(var_2_87) == "table" then
			for iter_2_71, iter_2_72 in ipairs(var_2_87) do
				local var_2_88 = string.format("%s_%d", RedPointConst.NOOB_ADVANCE, iter_2_72)

				var_2_85[#var_2_85 + 1] = var_2_88

				local var_2_89 = var_2_86.noob_advance_task_phase[iter_2_71]
				local var_2_90 = NoobAdvanceTaskPhaseListCfg[var_2_89].phase_list
				local var_2_91 = {}

				for iter_2_73, iter_2_74 in ipairs(var_2_90) do
					local var_2_92 = string.format("%s_%d_%d", RedPointConst.NOOB_ADVANCE, iter_2_72, iter_2_73)

					var_2_91[#var_2_91 + 1] = var_2_92

					local var_2_93 = {}

					for iter_2_75, iter_2_76 in ipairs(iter_2_74[2]) do
						var_2_93[#var_2_93 + 1] = string.format("%s_%d_%d_%d", RedPointConst.NOOB_ADVANCE, iter_2_72, iter_2_73, iter_2_76[1])
					end

					arg_2_0:addGroup(var_2_92, var_2_93)
				end

				arg_2_0:addGroup(var_2_88, var_2_91)
			end

			arg_2_0:addGroup(RedPointConst.NOOB_ADVANCE, var_2_85)
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

	local var_2_94 = {}

	for iter_2_77, iter_2_78 in pairs(WarchessLevelCfg.get_id_list_by_type) do
		if iter_2_77 ~= 0 then
			local var_2_95 = {}

			for iter_2_79, iter_2_80 in ipairs(iter_2_78) do
				table.insert(var_2_95, string.format("%s_%s_%s", RedPointConst.WAR_CHESS, iter_2_77, iter_2_80))
			end

			arg_2_0:addGroup(string.format("%s_%s", RedPointConst.WAR_CHESS, iter_2_77), var_2_95)
		end
	end

	local var_2_96 = {}

	for iter_2_81, iter_2_82 in ipairs(StageGroupCfg.get_id_list_by_type[BattleConst.STAGE_TYPE_NEW.OSIRIS_DEMON]) do
		table.insert(var_2_96, DemonChallengeData:GetRedPointConst(iter_2_81))
	end

	arg_2_0:addGroup(RedPointConst.OSIRIS_DEMON, var_2_96)

	for iter_2_83, iter_2_84 in ipairs(ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.HERO_TRIAL]) do
		local var_2_97 = ActivityCfg[iter_2_84].sub_activity_list
		local var_2_98 = {}

		for iter_2_85, iter_2_86 in pairs(var_2_97) do
			local var_2_99 = ActivityHeroTrialCfg.get_id_list_by_activity_id[iter_2_86]

			for iter_2_87, iter_2_88 in ipairs(var_2_99) do
				table.insert(var_2_98, string.format("%s_%s", RedPointConst.HERO_TRIAL, iter_2_88))
			end
		end

		arg_2_0:addGroup(string.format("%s_%s", RedPointConst.HERO_TRIAL, iter_2_84), var_2_98)
	end

	arg_2_0:addGroup(RedPointConst.OSIRIS_ACTIVITY, {
		string.format("%s_%s", RedPointConst.ACTIVITY_TASK, ActivityConst.OSIRIS_TASK_DAILY),
		string.format("%s_%s", RedPointConst.WAR_CHESS, ActivityConst.OSIRIS_CHESS),
		RedPointConst.OSIRIS_DEMON,
		RedPointConst.OSIRIS_RACE_TRIAL,
		string.format("%s_%s", RedPointConst.HERO_TRIAL, ActivityConst.OSIRIS_HERO_TRIAL_STAGE)
	})

	for iter_2_89, iter_2_90 in ipairs(ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.SKIN_TRIAL]) do
		local var_2_100 = ActivityCfg[iter_2_90].sub_activity_list
		local var_2_101 = {}

		for iter_2_91, iter_2_92 in pairs(var_2_100) do
			local var_2_102 = ActivitySkinTrialCfg.get_id_list_by_activity_id[iter_2_92]

			for iter_2_93, iter_2_94 in ipairs(var_2_102 or {}) do
				table.insert(var_2_101, string.format("%s_%s", RedPointConst.SKIN_TRIAL, iter_2_94))
			end
		end

		arg_2_0:addGroup(string.format("%s_%s", RedPointConst.SKIN_TRIAL, iter_2_90), var_2_101)
	end

	local var_2_103 = ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.SLAYER] or {}

	for iter_2_95, iter_2_96 in ipairs(var_2_103) do
		local var_2_104 = ActivityCfg[iter_2_96].sub_activity_list

		if #var_2_104 > 0 then
			local var_2_105 = {}

			for iter_2_97, iter_2_98 in ipairs(var_2_104) do
				arg_2_0:addGroup(string.format("%s_%s", RedPointConst.SLYAER_REGIONS, iter_2_98), {
					string.format("%s_%s", RedPointConst.SLAYER_REGIONS_SELECT, iter_2_98),
					string.format("%s_%s", RedPointConst.SLAYER_REGIONS_REWARD, iter_2_98)
				})

				var_2_105[#var_2_105 + 1] = string.format("%s_%s", RedPointConst.SLYAER_REGIONS, iter_2_98)
			end

			arg_2_0:addGroup(string.format("%s_%s", RedPointConst.SLYAER_REGIONS, iter_2_96), var_2_105)
		end

		arg_2_0:addGroup(string.format("%s_%s", RedPointConst.SLAYER, iter_2_96), {
			string.format("%s_%s", RedPointConst.SLYAER_REGIONS, iter_2_96),
			string.format("%s_%s", RedPointConst.SLYAER_REWARD, iter_2_96)
		})
	end

	local var_2_106 = ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.PARKOUR] or {}

	for iter_2_99, iter_2_100 in ipairs(var_2_106) do
		arg_2_0:addGroup(string.format("%s_%s", RedPointConst.PARKOUR, iter_2_100), {
			string.format("%s_%s", RedPointConst.PARKOUR_ENTRUST_ALL, iter_2_100)
		})
		arg_2_0:addGroup(string.format("%s_%s", RedPointConst.PARKOUR_ENTRUST_ALL, iter_2_100), {
			string.format("%s_%s", RedPointConst.PARKOUR_REWARD, iter_2_100),
			string.format("%s_%s", RedPointConst.PARKOUR_ENTRUST, iter_2_100)
		})

		local var_2_107 = ActivityCfg[iter_2_100].sub_activity_list
		local var_2_108 = {}

		for iter_2_101, iter_2_102 in ipairs(var_2_107) do
			table.insert(var_2_108, string.format("%s_%s", RedPointConst.PARKOUR_ENTRUST_REWARD, iter_2_102))
		end

		arg_2_0:addGroup(string.format("%s_%s", RedPointConst.PARKOUR_REWARD, iter_2_100), var_2_108)
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

	local var_2_109 = ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.SINGLE_MATRIX] or {}

	for iter_2_103, iter_2_104 in ipairs(var_2_109) do
		arg_2_0:addGroup(string.format("%s_%s", RedPointConst.ACTIVITY_MATRIX, iter_2_104), {
			string.format("%s_%s", RedPointConst.ACTIVITY_MATRIX_REWARD, iter_2_104),
			string.format("%s_%s", RedPointConst.ACTIVITY_MATRIX_CLUE, iter_2_104),
			string.format("%s_%s", RedPointConst.ACTIVITY_MATRIX_READ, iter_2_104)
		})
	end

	local var_2_110 = ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.ACTIVITY_MUSIC] or {}

	for iter_2_105, iter_2_106 in ipairs(var_2_110) do
		arg_2_0:addGroup(string.format("%s_%s", RedPointConst.MUSIC, iter_2_106), {
			string.format("%s_%s", RedPointConst.MUSIC_OPEN, iter_2_106),
			string.format("%s_%s", RedPointConst.MUSIC_REWARD, iter_2_106)
		})
	end

	if not ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.ACTIVITY_ZUMA] then
		local var_2_111 = {}
	end

	local var_2_112 = {}

	table.insert(var_2_112, RedPointConst.ZUMA_REWARD)
	table.insert(var_2_112, RedPointConst.ZUMA_TALENT)

	local var_2_113 = ZumaData:GetZumaCfgData()

	for iter_2_107, iter_2_108 in pairs(ZumaConst.ZUMA_DIFFICULT or {}) do
		local var_2_114 = var_2_113[iter_2_108]
		local var_2_115 = {}

		for iter_2_109, iter_2_110 in ipairs(var_2_114 or {}) do
			table.insert(var_2_115, string.format("%s_%s", RedPointConst.ZUMA_OPEN, iter_2_110.activity_id))
		end

		local var_2_116 = string.format("%s_%s", RedPointConst.ZUMA_DIFFICULT, iter_2_108)

		arg_2_0:addGroup(var_2_116, var_2_115)
		table.insert(var_2_112, var_2_116)
	end

	arg_2_0:addGroup(RedPointConst.ZUMA .. ActivityConst.ACTIVITY_ZUMA, var_2_112)
	arg_2_0:addGroup(RedPointConst.ZUMA .. ActivityConst.ACTIVITY_3_11_ZUMA, var_2_112)

	local var_2_117 = ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.STRATEGY_MATRIX] or {}

	for iter_2_111, iter_2_112 in ipairs(var_2_117) do
		local var_2_118 = StrategyMatrixCfg[iter_2_112]

		if var_2_118.activity_difficulty == 1 then
			arg_2_0:addGroup(string.format("%s_%s", RedPointConst.STRATEGY_MATRIX, iter_2_112), {
				string.format("%s_%s", RedPointConst.STRATEGY_MATRIX_OPEN, iter_2_112),
				string.format("%s_%s", RedPointConst.STRATEGY_MATRIX_REWARD, iter_2_112)
			})
		else
			local var_2_119 = var_2_118.pre_condition_args[1] and var_2_118.pre_condition_args[1][2][1]

			if var_2_119 then
				arg_2_0:addGroup(string.format("%s_%s", RedPointConst.STRATEGY_MATRIX, var_2_119), {
					string.format("%s_%s", RedPointConst.STRATEGY_MATRIX_OPEN, iter_2_112),
					string.format("%s_%s", RedPointConst.STRATEGY_MATRIX_REWARD, iter_2_112)
				})
			else
				print("困难模式的肉鸽，无法取到前置活动id,联系活动肉鸽策划")
			end
		end
	end

	local var_2_120 = ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.GUILD_ACTIVITY] or {}

	for iter_2_113, iter_2_114 in ipairs(var_2_120) do
		arg_2_0:addGroup(string.format("%s_%s", RedPointConst.GUILD_ACTIVITY, iter_2_114), {
			string.format("%s_%s", RedPointConst.GUILD_ACTIVITY_RATE, iter_2_114),
			RedPointConst.GUILD_ACTIVITY_UNREGISTER,
			string.format("%s_%s", RedPointConst.GUILD_ACTIVITY_UNGET_COIN, iter_2_114)
		})

		local var_2_121 = {}

		for iter_2_115, iter_2_116 in pairs(TalentTreeCfg.get_id_list_by_activity_id_and_race[iter_2_114]) do
			local var_2_122 = string.format("%s_%d_%d", RedPointConst.GUILD_ACTIVITY_AFFIX, iter_2_114, iter_2_115)

			var_2_121[#var_2_121 + 1] = var_2_122

			local var_2_123 = {}

			for iter_2_117, iter_2_118 in pairs(iter_2_116) do
				var_2_123[#var_2_123 + 1] = string.format("%s_%d_%d_%d", RedPointConst.GUILD_ACTIVITY_AFFIX, iter_2_114, iter_2_115, iter_2_118)
			end

			arg_2_0:addGroup(var_2_122, var_2_123)
		end

		arg_2_0:addGroup(string.format("%s_%d", RedPointConst.GUILD_ACTIVITY_AFFIX, iter_2_114), var_2_121)
	end

	local var_2_124 = GuildActivitySPTools:GetActivityState()

	for iter_2_119, iter_2_120 in pairs(var_2_124) do
		arg_2_0:addGroup(string.format("%s_%s", RedPointConst.GUILD_ACTIVITY_SP, iter_2_119), {
			RedPointConst.GUILD_ACTIVITY_SP_UNREGISTER
		})

		local var_2_125 = iter_2_120.start

		arg_2_0:addGroup(string.format("%s_%s", RedPointConst.GUILD_ACTIVITY_SP, iter_2_119), {
			string.format("%s_%s", RedPointConst.GUILD_ACTIVITY_SP_BONUS, var_2_125),
			string.format("%s_%s", RedPointConst.GUILD_ACTIVITY_SP_UNGET_COIN, var_2_125),
			string.format("%s_%s", RedPointConst.GUILD_ACTIVITY_SP_HERO_FIGHT, var_2_125)
		})

		local var_2_126 = {}

		if TalentTreeCfg.get_id_list_by_activity_id_and_race[var_2_125] then
			for iter_2_121, iter_2_122 in pairs(TalentTreeCfg.get_id_list_by_activity_id_and_race[var_2_125]) do
				local var_2_127 = string.format("%s_%d_%d", RedPointConst.GUILD_ACTIVITY_SP_AFFIX, var_2_125, iter_2_121)

				var_2_126[#var_2_126 + 1] = var_2_127

				local var_2_128 = {}

				for iter_2_123, iter_2_124 in pairs(iter_2_122) do
					var_2_128[#var_2_128 + 1] = string.format("%s_%d_%d_%d", RedPointConst.GUILD_ACTIVITY_SP_AFFIX, var_2_125, iter_2_121, iter_2_124)
				end

				arg_2_0:addGroup(var_2_127, var_2_128)
			end

			arg_2_0:addGroup(string.format("%s_%d", RedPointConst.GUILD_ACTIVITY_SP_AFFIX, var_2_125), var_2_126)
		end
	end

	local var_2_129 = ActivityCfg[ActivityConst.FACTORY_MARDUK].sub_activity_list
	local var_2_130 = {}

	for iter_2_125, iter_2_126 in ipairs(var_2_129) do
		table.insert(var_2_130, string.format("%s_%d", RedPointConst.MARDUK_SPECIAL_NOT_FIGHT, iter_2_126))
	end

	arg_2_0:addGroup(string.format("%s_%d", RedPointConst.MARDUK_SPECIAL_NOT_FIGHT, ActivityConst.FACTORY_MARDUK), var_2_130)
	arg_2_0:addGroup(string.format("%s_%d", RedPointConst.MARDUK_SPECIAL, ActivityConst.FACTORY_MARDUK), {
		string.format("%s_%d", RedPointConst.MARDUK_SPECIAL_NOT_FIGHT, ActivityConst.FACTORY_MARDUK),
		string.format("%s_%d", RedPointConst.MARDUK_SPECIAL_REWARD, ActivityConst.FACTORY_MARDUK)
	})

	local var_2_131 = ActivityCfg[ActivityConst.ACTIVITY_2_2_SPECIAL].sub_activity_list
	local var_2_132 = {}

	for iter_2_127, iter_2_128 in ipairs(var_2_131) do
		table.insert(var_2_132, string.format("%s_%d", RedPointConst.MARDUK_SPECIAL_NOT_FIGHT, iter_2_128))
	end

	arg_2_0:addGroup(string.format("%s_%d", RedPointConst.MARDUK_SPECIAL_NOT_FIGHT, ActivityConst.ACTIVITY_2_2_SPECIAL), var_2_132)
	arg_2_0:addGroup(string.format("%s_%d", RedPointConst.MARDUK_SPECIAL, ActivityConst.ACTIVITY_2_2_SPECIAL), {
		string.format("%s_%d", RedPointConst.MARDUK_SPECIAL_NOT_FIGHT, ActivityConst.ACTIVITY_2_2_SPECIAL),
		string.format("%s_%d", RedPointConst.MARDUK_SPECIAL_REWARD, ActivityConst.ACTIVITY_2_2_SPECIAL)
	})

	local var_2_133 = ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.FIRE_WORK_MAIN] or {}

	for iter_2_129, iter_2_130 in ipairs(var_2_133) do
		local var_2_134 = ActivityCfg[iter_2_130].sub_activity_list
		local var_2_135 = {}

		for iter_2_131, iter_2_132 in ipairs(var_2_134) do
			if ActivityCfg[iter_2_132].activity_template == ActivityTemplateConst.FIRE_WORK then
				local var_2_136 = string.format("%s_%s", RedPointConst.FIRE_WORK, iter_2_132)

				arg_2_0:addGroup(var_2_136, {
					string.format("%s_%s", RedPointConst.FIRE_WORK_OPEN, iter_2_132),
					string.format("%s_%s", RedPointConst.FIRE_WORK_REWARD, iter_2_132)
				})
				table.insert(var_2_135, var_2_136)
			end
		end

		arg_2_0:addGroup(string.format("%s_%s", RedPointConst.FIRE_WORK_MAIN, iter_2_130), var_2_135)
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

	local var_2_137 = #GameSetting.dorm_canteen_task_unlock.value
	local var_2_138 = {}

	for iter_2_133 = 1, var_2_137 do
		var_2_138[iter_2_133] = string.format("%s_%s", RedPointConst.CANTEEN_UNLOCK_ENTRUST, tostring(iter_2_133))
	end

	arg_2_0:addGroup(RedPointConst.CANTEEN_UNLOCK_ENTRUST, var_2_138)

	local var_2_139 = {}
	local var_2_140 = 1

	for iter_2_134, iter_2_135 in pairs(DormEnum.FurnitureTypeNum) do
		var_2_139[var_2_140] = string.format("%s_%s", RedPointConst.CANTEEN_UNLOCK_FOOD, tostring(iter_2_135))
		var_2_140 = var_2_140 + 1
	end

	arg_2_0:addGroup(RedPointConst.CANTEEN_UNLOCK_FOOD, var_2_139)

	for iter_2_136, iter_2_137 in pairs(DormEnum.FurnitureTypeNum) do
		local var_2_141 = {}

		for iter_2_138, iter_2_139 in ipairs(BackHomeCanteenFoodCfg.all) do
			if BackHomeCanteenFoodCfg[iter_2_139].cook_type == iter_2_137 then
				local var_2_142 = string.format("%s_%s_%s", RedPointConst.CANTEEN_UNLOCK_FOOD, tostring(iter_2_137), iter_2_139)

				table.insert(var_2_141, var_2_142)
			end
		end

		arg_2_0:addGroup(string.format("%s_%s", RedPointConst.CANTEEN_UNLOCK_FOOD, iter_2_137), var_2_141)
	end

	local var_2_143 = {}

	for iter_2_140, iter_2_141 in pairs(DormEnum.FurnitureMainType) do
		local var_2_144 = string.format("%s_%s", RedPointConst.CANTEEN_UPGRADE_AVAILABLE, tostring(iter_2_141))

		table.insert(var_2_143, var_2_144)
	end

	arg_2_0:addGroup(RedPointConst.CANTEEN_UPGRADE_AVAILABLE, var_2_143)
	arg_2_0:addGroup(RedPointConst.DORM, {
		RedPointConst.DORM_PLACEMENT
	})
	arg_2_0:addGroup(RedPointConst.DORM_NAVI, {
		RedPointConst.DORM_ILLU,
		RedPointConst.CANTEEN
	})

	local var_2_145 = {}

	for iter_2_142, iter_2_143 in ipairs(BackHomeCfg.all) do
		if BackHomeCfg[iter_2_143].type == 3 then
			table.insert(var_2_145, RedPointConst.DORM_PLACEMENT_ROOM .. iter_2_143)
		end
	end

	arg_2_0:addGroup(RedPointConst.DORM_PLACEMENT, var_2_145)

	local var_2_146 = {}

	for iter_2_144 = DormConst.DORM_FUR_TYPE_START, DormConst.DORM_FUR_TYPE_END do
		table.insert(var_2_146, string.format("%s_%s", RedPointConst.DORM_FURNITURE, tostring(iter_2_144)))
	end

	table.insert(var_2_146, RedPointConst.DORM_SUIT)
	arg_2_0:addGroup(RedPointConst.DORM_FURNITURE, var_2_146)

	local var_2_147 = {}
	local var_2_148 = {}
	local var_2_149 = DormSuitData:GetSuitIDListByType(DormSuitTools.DORM_SUIT_TYPE.FULL_SET)

	for iter_2_145, iter_2_146 in ipairs(var_2_149) do
		local var_2_150 = BackHomeSuitCfg[iter_2_146].scene_id[1]

		if var_2_150 == DormConst.BACKHOME_TYPE.PublicDorm then
			table.insert(var_2_148, string.format("%s_%s", RedPointConst.DORM_FULL_PUBLIC_SUIT, tostring(iter_2_146)))
		elseif var_2_150 == DormConst.BACKHOME_TYPE.PrivateDorm then
			table.insert(var_2_147, string.format("%s_%s", RedPointConst.DORM_FULL_PRIVATE_SUIT, tostring(iter_2_146)))
		end
	end

	arg_2_0:addGroup(RedPointConst.DORM_FULL_PUBLIC_SUIT, var_2_148)
	arg_2_0:addGroup(RedPointConst.DORM_FULL_PRIVATE_SUIT, var_2_147)

	local var_2_151 = {}
	local var_2_152 = DormSuitData:GetSuitIDListByType(DormSuitTools.DORM_SUIT_TYPE.PART_SET)

	for iter_2_147, iter_2_148 in ipairs(var_2_152) do
		table.insert(var_2_151, string.format("%s_%s", RedPointConst.DORM_PART_SUIT, tostring(iter_2_148)))
	end

	arg_2_0:addGroup(RedPointConst.DORM_PART_SUIT, var_2_151)

	local var_2_153 = {}
	local var_2_154 = DormTools:GetAllDormShopIDList()

	for iter_2_149, iter_2_150 in ipairs(var_2_154) do
		local var_2_155 = DormSuitTools:GetFurSuitGoodListByShopID(iter_2_150)
		local var_2_156 = {}

		if #var_2_155 > 0 then
			for iter_2_151, iter_2_152 in ipairs(var_2_155) do
				table.insert(var_2_156, DormRedPointTools.FurnitureItemRedPoint(iter_2_150, iter_2_152))
			end

			local var_2_157 = ShopTools.GetShopRedPointKey(iter_2_150)

			arg_2_0:addGroup(var_2_157, var_2_156)
			table.insert(var_2_153, var_2_157)
		end
	end

	arg_2_0:addGroup(RedPointConst.DORM_SUIT_SHOP, var_2_153)

	local var_2_158 = {}
	local var_2_159 = {}
	local var_2_160 = {}

	table.insert(var_2_158, RedPointConst.DORM_ILLU_HERO)
	table.insert(var_2_158, RedPointConst.DORM_ILLU_REWARD_1)
	arg_2_0:addGroup(RedPointConst.DORM_ILLU_HERO_ALL, var_2_158)

	local var_2_161 = {}

	for iter_2_153, iter_2_154 in ipairs(BackHomeFurnitureThemeCfg.all) do
		local var_2_162 = RedPointConst.DORM_ILLU_FUR_THEME .. iter_2_154

		table.insert(var_2_161, var_2_162)
	end

	arg_2_0:addGroup(RedPointConst.DORM_ILLU_FUR, var_2_161)
	table.insert(var_2_159, RedPointConst.DORM_ILLU_FUR)
	table.insert(var_2_159, RedPointConst.DORM_ILLU_REWARD_3)
	arg_2_0:addGroup(RedPointConst.DORM_ILLU_FUR_ALL, var_2_159)
	table.insert(var_2_160, RedPointConst.DORM_ILLU_DANCE)
	table.insert(var_2_160, RedPointConst.DORM_ILLU_REWARD_2)
	arg_2_0:addGroup(RedPointConst.DORM_ILLU_DANCE_ALL, var_2_160)
	arg_2_0:addGroup(RedPointConst.DORM_ILLU_NEW, {
		RedPointConst.DORM_ILLU_HERO_ALL,
		RedPointConst.DORM_ILLU_FUR_ALL,
		RedPointConst.DORM_ILLU_DANCE_ALL
	})
	arg_2_0:addGroup(RedPointConst.DORM_ILLU_REWARD, {
		RedPointConst.DORM_ILLU_REWARD_1,
		RedPointConst.DORM_ILLU_REWARD_2,
		RedPointConst.DORM_ILLU_REWARD_3
	})
	arg_2_0:addGroup(RedPointConst.DORM_ILLU, {
		RedPointConst.DORM_ILLU_REWARD,
		RedPointConst.DORM_ILLU_NEW
	})
	arg_2_0:addGroup(RedPointConst.BACKHOME, {
		RedPointConst.DORM,
		RedPointConst.CANTEEN,
		RedPointConst.DORM_ILLU
	})
	arg_2_0:addGroup(RedPointConst.ABYSS, {
		RedPointConst.ABYSS_REWARD,
		RedPointConst.ABYSS_CHALLENGE,
		string.format(ServerRedPointPrefix, ServerRedPoint.DISORDER_TRAP_NEW_RED, "ROOT")
	})

	local var_2_163 = MailSpecialLetterCfg.get_id_list_by_letter_belongs
	local var_2_164 = {}

	for iter_2_155, iter_2_156 in pairs(var_2_163) do
		table.insert(var_2_164, RedPointConst.LETTER_SENDER_ID .. iter_2_155)

		local var_2_165 = {}

		for iter_2_157, iter_2_158 in pairs(iter_2_156) do
			table.insert(var_2_165, RedPointConst.LETTER_ID .. iter_2_158)
		end

		arg_2_0:addGroup(RedPointConst.LETTER_SENDER_ID .. iter_2_155, var_2_165)
	end

	arg_2_0:addGroup(RedPointConst.LETTER_UNREAD, var_2_164)
	arg_2_0:addGroup(RedPointConst.MAIL_UNREAD, {
		RedPointConst.LETTER_UNREAD
	})
	arg_2_0:addGroup(RedPointConst.POLYHEDRON, {
		RedPointConst.POLYHEDRON_BEACON_UNLOCK,
		RedPointConst.POLYHEDRON_POLICY_LEVEL_REWARD,
		RedPointConst.POLYHEDRON_HERO_UNLOCK,
		RedPointConst.POLYHEDRON_RESIDENT_TASK,
		RedPointConst.POLYHEDRON_TERMINAL_GIFT,
		RedPointConst.POLYHEDRON_NEW_SECTION
	})
	arg_2_0:addGroup(RedPointConst.RECALL, {
		RedPointConst.RECALL_SIGN,
		RedPointConst.RECALL_TASK,
		RedPointConst.RECALL_REWARD
	})

	local var_2_166 = {}

	for iter_2_159 = 1, #ExploreMeowCfg.all do
		local var_2_167 = ExploreMeowCfg.all[iter_2_159]

		var_2_166[iter_2_159] = RedPointConst.EXPLORE_UNLOCK_ADMIN_CAT .. var_2_167
	end

	local var_2_168 = {}

	for iter_2_160 = 1, #ExploreAreaCfg.all do
		local var_2_169 = ExploreAreaCfg.all[iter_2_160]

		var_2_168[iter_2_160] = RedPointConst.EXPLORE_FINISH .. var_2_169
	end

	arg_2_0:addGroup(RedPointConst.EXPLORE_UNLOCK_ADMIN_CAT, var_2_166)
	arg_2_0:addGroup(RedPointConst.EXPLORE_FINISH, var_2_168)
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

	local var_2_170 = {}

	for iter_2_161, iter_2_162 in ipairs(RechargeRecommendCfg.all) do
		table.insert(var_2_170, RedPointConst.RECHARGE_RECOMMEND .. iter_2_162)
	end

	arg_2_0:addGroup(RedPointConst.RECHARGE_RECOMMEND, var_2_170)

	for iter_2_163, iter_2_164 in ipairs(ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.STRONGHOLD]) do
		arg_2_0:addGroup(string.format("%s_%s", RedPointConst.STRONGHOLD, iter_2_164), {
			string.format("%s_%s", RedPointConst.STRONGHOLD_REWARD, iter_2_164),
			string.format("%s_%s", RedPointConst.STRONGHOLD_INCREASE, iter_2_164),
			string.format("%s_%s", RedPointConst.STRONGHOLD_TASK, iter_2_164)
		})
	end

	arg_2_0:addGroup(RedPointConst.SOLO_HEART_DEMON, {
		RedPointConst.SOLO_HEART_DEMON_FIRST_VIEW,
		RedPointConst.SOLO_HEART_DEMON_REWARD
	})
	arg_2_0:addGroup(RedPointConst.MULT_HEART_DEMON, {
		RedPointConst.MULT_HEART_DEMON_FIRST_VIEW,
		RedPointConst.MULT_HEART_DEMON_REWARD
	})

	local var_2_171 = {}

	for iter_2_165, iter_2_166 in ipairs(ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.ACTIVITY_SKIN_DRAW]) do
		table.insert(var_2_171, RedPointConst.ACTIVITY_DRAW .. "_" .. iter_2_166)
	end

	arg_2_0:addGroup(RedPointConst.ACTIVITY_DRAW, var_2_171)

	local var_2_172 = ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.ACTIVITY_ATTRIBUTE_ARENA] or {}

	for iter_2_167, iter_2_168 in ipairs(var_2_172) do
		arg_2_0:addGroup(string.format("%s_%s", RedPointConst.ACTIVITY_ATTRIBUTE_ARENA, iter_2_168), {
			string.format("%s_%s", RedPointConst.ACTIVITY_ATTRIBUTE_ARENA_TASK, iter_2_168),
			string.format("%s_%s", RedPointConst.ACTIVITY_ATTRIBUTE_ARENA_ENTER, iter_2_168)
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

	local var_2_173 = SPHeroChallengeData.activityCfg[ActivityConst.ACTIVITY_HERO_CHALLENGE_3_1].heroChipActivityID
	local var_2_174 = SPHeroChallengeData.activityCfg[ActivityConst.ACTIVITY_HERO_CHALLENGE_3_1].taskActivityID

	arg_2_0:addGroup(RedPointConst.SP_HERO_CHALLENGE_3_1, {
		RedPointConst.SP_HERO_CHALLENGE_3_1_ENTRUST,
		string.format("%s_%s", RedPointConst.ACTIVITY_TASK, var_2_173),
		string.format("%s_%s", RedPointConst.ACTIVITY_TASK, var_2_174)
	})

	local var_2_175 = {}

	for iter_2_169, iter_2_170 in ipairs(ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.ACTIVITY_SWIMSUIT_BATTLE_HERO_STAGE]) do
		table.insert(var_2_175, string.format("%s_%s", RedPointConst.ACTIVITY_SWIMSUIT_BATTLE_HERO, iter_2_170))
	end

	table.insert(var_2_175, RedPointConst.ACTIVITY_SWIMSUIT_BATTLE_REWARD)
	arg_2_0:addGroup(string.format("%s%s", ActivityTools.GetRedPointKey(282951), 282951), var_2_175)
	arg_2_0:addGroup(string.format("%s%s", ActivityTools.GetRedPointKey(282961), 282961), {
		RedPointConst.ACTIVITY_SWIMSUIT_VOTE_TICKET,
		RedPointConst.ACTIVITY_SWIMSUIT_VOTE_REWARD
	})

	local var_2_176 = {}
	local var_2_177 = {}
	local var_2_178 = {
		RedPointConst.CAPTURE_GAME_UNLOCK_STAGE,
		"_",
		0
	}
	local var_2_179 = {
		RedPointConst.CAPTURE_GAME_UNLOCK_SECTION,
		"_",
		0
	}

	for iter_2_171, iter_2_172 in ipairs(ActivitySwimSkinSectionCfg.all) do
		local var_2_180 = ActivitySwimSkinSectionCfg[iter_2_172]
		local var_2_181 = {}

		var_2_179[3] = iter_2_172

		local var_2_182 = table.concat(var_2_179)

		if var_2_180.mode == CaptureGameConst.CaptureGameMode.Single then
			for iter_2_173, iter_2_174 in ipairs(var_2_180.sub_section_list) do
				var_2_178[3] = iter_2_174

				table.insert(var_2_181, table.concat(var_2_178))
			end

			table.insert(var_2_176, var_2_182)
		elseif var_2_180.mode == CaptureGameConst.CaptureGameMode.Multiple then
			for iter_2_175, iter_2_176 in ipairs(var_2_180.sub_section_list) do
				var_2_178[3] = iter_2_176

				table.insert(var_2_181, table.concat(var_2_178))
			end

			table.insert(var_2_177, var_2_182)
		end

		arg_2_0:addGroup(var_2_182, var_2_181)
	end

	arg_2_0:addGroup(RedPointConst.CAPTURE_GAME_UNLOCK_SINGLE_ROOT, var_2_176)
	arg_2_0:addGroup(RedPointConst.CAPTURE_GAME_UNLOCK_MULTI_ROOT, var_2_177)
	arg_2_0:addGroup(RedPointConst.CAPTURE_GAME_UNLOCK_ROOT, {
		RedPointConst.CAPTURE_GAME_UNLOCK_SINGLE_ROOT,
		RedPointConst.CAPTURE_GAME_UNLOCK_MULTI_ROOT,
		RedPointConst.CAPTURE_GAME_TASK_REWARD
	})
	arg_2_0:addGroup(ActivityTools.GetRedPointKey(ActivityConst.ACTIVITY_SWIM_SKIN) .. ActivityConst.ACTIVITY_SWIM_SKIN, {
		RedPointConst.CAPTURE_GAME_UNLOCK_ROOT
	})
	arg_2_0:addGroup(RedPointConst.ACTIVITY_3_5_CATCH_DUCK, {
		RedPointConst.ACTIVITY_3_5_CATCH_DUCK_STAGE,
		RedPointConst.ACTIVITY_3_5_CATCH_DUCK_TASK
	})
	arg_2_0:addGroup(ActivityTools.GetRedPointKey(ActivityConst.SUMMER_CHESS_BOARD_PLUZZE) .. ActivityConst.SUMMER_CHESS_BOARD_PLUZZE, {
		RedPointConst.ACTIVITY_3_5_TANGRAM_GAME
	})
	arg_2_0:addGroup(RedPointConst.ACTIVITY_3_5_TANGRAM_GAME, {
		RedPointConst.ACTIVITY_3_5_TANGRAM_GAME_CHAPTER,
		string.format("%s_%s", RedPointConst.ACTIVITY_TASK, ActivityConst.SUMMER_CHESS_BOARD_PLUZZE_TASK)
	})
	arg_2_0:addGroup(string.format("%s_%s", RedPointConst.ACTIVITY_TASK, ActivityConst.SUMMER_CHESS_BOARD_PLUZZE_TASK), {
		string.format("%s_%s", RedPointConst.ACTIVITY_TASK, ActivityConst.ACTIVITY_3_5_TANGRAM_GAME_TASK1),
		string.format("%s_%s", RedPointConst.ACTIVITY_TASK, ActivityConst.ACTIVITY_3_5_TANGRAM_GAME_TASK2)
	})
	arg_2_0:addGroup(string.format("%s%s", ActivityTools.GetRedPointKey(2932801), 2932801), {
		RedPointConst.ACTIVITY_IDOL_COMPETITION_SIGN,
		RedPointConst.ACTIVITY_IDOL_COMPETITION_REWARD
	})

	local var_2_183 = {}

	for iter_2_177, iter_2_178 in ipairs(ActivityTangramGameChapterCfg.all) do
		local var_2_184 = string.format("%s_%s", RedPointConst.ACTIVITY_3_5_TANGRAM_GAME_CHAPTER, iter_2_178)

		table.insert(var_2_183, var_2_184)
		arg_2_0:addGroup(var_2_184, {
			string.format("%s_%s", RedPointConst.ACTIVITY_3_5_TANGRAM_GAME_FULL_CLUE, iter_2_178),
			string.format("%s_%s", RedPointConst.ACTIVITY_3_5_TANGRAM_GAME_STAGE, iter_2_178)
		})
	end

	arg_2_0:addGroup(RedPointConst.ACTIVITY_3_5_TANGRAM_GAME_CHAPTER, var_2_183)

	local var_2_185 = {}

	for iter_2_179, iter_2_180 in ipairs(ActivityWaterPipeStageCfg.all) do
		local var_2_186 = string.format("%s_%s", RedPointConst.ACTIVITY_WATER_PIPE_STAGE, iter_2_180)

		table.insert(var_2_185, var_2_186)
	end

	arg_2_0:addGroup(ActivityTools.GetRedPointKey(WaterPipeData:GetMainActivityID()) .. WaterPipeData:GetMainActivityID(), var_2_185)
	arg_2_0:addGroup(ActivityTools.GetRedPointKey(ActivityConst.ACTIVITY_WATER_PIPE_HOME) .. ActivityConst.ACTIVITY_WATER_PIPE_HOME, var_2_185)

	local var_2_187 = {}
	local var_2_188 = {}
	local var_2_189 = ActivityCfg[ActivityConst.ACTIVITY_RED_ENVELOPE].sub_activity_list

	for iter_2_181, iter_2_182 in ipairs(var_2_189) do
		table.insert(var_2_187, RedPointConst.ACTIVITY_RED_ENVELOPE_NEW_DAY .. "_" .. iter_2_182)
		table.insert(var_2_188, RedPointConst.ACTIVITY_RED_ENVELOPE_CAN_CLAIMED .. "_" .. iter_2_182)
	end

	local var_2_190 = ActivityTools.GetRedPointKey(ActivityConst.ACTIVITY_RED_ENVELOPE) .. ActivityConst.ACTIVITY_RED_ENVELOPE

	arg_2_0:addGroup(RedPointConst.ACTIVITY_RED_ENVELOPE_NEW_DAY .. "_" .. ActivityConst.ACTIVITY_RED_ENVELOPE, var_2_187)
	arg_2_0:addGroup(RedPointConst.ACTIVITY_RED_ENVELOPE_CAN_CLAIMED .. "_" .. ActivityConst.ACTIVITY_RED_ENVELOPE, var_2_188)
	arg_2_0:addGroup(var_2_190, {
		RedPointConst.ACTIVITY_RED_ENVELOPE_NEW_DAY .. "_" .. ActivityConst.ACTIVITY_RED_ENVELOPE,
		RedPointConst.ACTIVITY_RED_ENVELOPE_CAN_CLAIMED .. "_" .. ActivityConst.ACTIVITY_RED_ENVELOPE
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

function var_0_0.AddRogueTeamGroup(arg_22_0)
	local var_22_0 = {}

	for iter_22_0, iter_22_1 in ipairs(RogueTeamCfg.all) do
		local var_22_1 = ChallengeRogueTeamTools.GetCollectActivityIDByType(iter_22_1, ChallengeRogueTeamConst.COLLECTION_TASK_TYPE.RELIC)
		local var_22_2 = ChallengeRogueTeamTools.GetCollectActivityIDByType(iter_22_1, ChallengeRogueTeamConst.COLLECTION_TASK_TYPE.EVENT)
		local var_22_3 = ChallengeRogueTeamTools.GetTaskActivityID(iter_22_1)
		local var_22_4 = string.format("%s_%s", RedPointConst.CHALLENGE_ROGUE_TEAM, iter_22_1)
		local var_22_5 = string.format("%s_%s", RedPointConst.ACTIVITY_TASK, var_22_3)
		local var_22_6 = string.format("%s_%s", RedPointConst.CHALLENGE_ROGUE_TEAM_ILLUSTRATED, iter_22_1)
		local var_22_7 = string.format("%s_%s", RedPointConst.ACTIVITY_TASK, var_22_1)
		local var_22_8 = string.format("%s_%s", RedPointConst.ACTIVITY_TASK, var_22_2)
		local var_22_9 = string.format("%s_%s", RedPointConst.CHALLENGE_ROGUE_TEAM_ILLUSTRATED_CAMP, iter_22_1)
		local var_22_10 = string.format("%s_%s", RedPointConst.CHALLENGE_ROGUE_TEAM_ILLUSTRATED_END, iter_22_1)
		local var_22_11, var_22_12 = ChallengeRogueTeamData:GetAllCampTreasureIDListByTemp(RogueTeamCfg[iter_22_1].item_temp)
		local var_22_13 = {}

		for iter_22_2, iter_22_3 in ipairs(var_22_12) do
			local var_22_14 = ChallengeRogueTeamTools.GetTreasureCollectionActivityIDByCamp(iter_22_1, iter_22_3)
			local var_22_15 = string.format("%s_%s", RedPointConst.ACTIVITY_TASK, var_22_14)
			local var_22_16 = {}

			for iter_22_4, iter_22_5 in ipairs(AssignmentCfg.get_id_list_by_activity_id[var_22_14]) do
				table.insert(var_22_16, string.format("%s_%s", RedPointConst.ACTIVITY_TASK, iter_22_5))
			end

			arg_22_0:addGroup(var_22_15, var_22_16)
			table.insert(var_22_13, var_22_15)
		end

		arg_22_0:addGroup(var_22_9, var_22_13)

		local var_22_17 = ChallengeRogueTeamData:GetAllCollectionTaskByType(iter_22_1, ChallengeRogueTeamConst.COLLECTION_TASK_TYPE.END)
		local var_22_18 = {}

		for iter_22_6, iter_22_7 in ipairs(var_22_17) do
			local var_22_19 = string.format("%s_%s", RedPointConst.ACTIVITY_TASK, iter_22_7)

			table.insert(var_22_18, var_22_19)
		end

		arg_22_0:addGroup(var_22_10, var_22_18)

		local var_22_20 = AssignmentCfg.get_id_list_by_activity_id[var_22_1]
		local var_22_21 = {}

		for iter_22_8, iter_22_9 in ipairs(var_22_20) do
			local var_22_22 = string.format("%s_%s", RedPointConst.ACTIVITY_TASK, iter_22_9)

			table.insert(var_22_21, var_22_22)
		end

		arg_22_0:addGroup(var_22_7, var_22_21)

		local var_22_23 = AssignmentCfg.get_id_list_by_activity_id[var_22_2]
		local var_22_24 = {}

		for iter_22_10, iter_22_11 in ipairs(var_22_23) do
			local var_22_25 = string.format("%s_%s", RedPointConst.ACTIVITY_TASK, iter_22_11)

			table.insert(var_22_24, var_22_25)
		end

		arg_22_0:addGroup(var_22_8, var_22_24)

		local var_22_26 = AssignmentCfg.get_id_list_by_activity_id[var_22_3]
		local var_22_27 = {}

		for iter_22_12, iter_22_13 in ipairs(var_22_26) do
			local var_22_28 = string.format("%s_%s", RedPointConst.ACTIVITY_TASK, iter_22_13)

			table.insert(var_22_27, var_22_28)
		end

		arg_22_0:addGroup(var_22_5, var_22_27)
		arg_22_0:addGroup(var_22_6, {
			var_22_7,
			var_22_8,
			var_22_9,
			var_22_10
		})
		arg_22_0:addGroup(var_22_4, {
			string.format("%s_%s", RedPointConst.ACTIVITY_POINT_REWARD, ChallengeRogueTeamTools.GetPointActivityID(iter_22_1)),
			var_22_5,
			var_22_6
		})
		table.insert(var_22_0, var_22_4)
	end

	arg_22_0:addGroup(RedPointConst.CHALLENGE_ROGUE_TEAM, var_22_0)
end

return var_0_0
