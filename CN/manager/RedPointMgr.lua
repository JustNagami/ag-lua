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
		RedPointConst.RESOURSE_STAGE,
		RedPointConst.RESIDENT_ACT
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
		elseif ChapterConst.NEW_TAG_CLIENT[iter_2_7] then
			table.insert(var_2_9, string.format("%s_%s", RedPointConst.COMBAT_SUB_POLT_NEW_TAG, iter_2_7))
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

	local var_2_16 = ActivityCfg[ActivityConst.SUMMER_CHESS_BOARD_ENTRY].sub_activity_list
	local var_2_17 = {}

	for iter_2_14, iter_2_15 in ipairs(var_2_16) do
		table.insert(var_2_17, string.format("%s%s", ActivityTools.GetRedPointKey(iter_2_15), iter_2_15))
	end

	local var_2_18 = string.format("%s%s", ActivityTools.GetRedPointKey(ActivityConst.SUMMER_CHESS_BOARD_ENTRY), ActivityConst.SUMMER_CHESS_BOARD_ENTRY)

	arg_2_0:addGroup(var_2_18, var_2_17)

	local var_2_19 = {}
	local var_2_20 = {}

	for iter_2_16, iter_2_17 in pairs(HeroCfg.get_id_list_by_private[0]) do
		local var_2_21 = RedPointConst.HERO_ID .. iter_2_17

		table.insert(var_2_20, var_2_21)

		local var_2_22 = RedPointConst.HERO_WEAPON_BREAK_ID .. iter_2_17
		local var_2_23 = RedPointConst.WEAPON_MODULE_UNLOCK .. "_" .. iter_2_17
		local var_2_24 = RedPointConst.HERO_WEAPON .. iter_2_17

		arg_2_0:addGroup(var_2_24, {
			var_2_22
		})

		local var_2_25 = RedPointConst.HERO_UNLOCK_ID .. iter_2_17
		local var_2_26 = RedPointConst.HERO_PROPERTY_PAGE .. iter_2_17
		local var_2_27 = RedPointConst.HERO_STAR_ID .. iter_2_17
		local var_2_28 = RedPointConst.HERO_SKIN_ID .. iter_2_17
		local var_2_29 = {}
		local var_2_30 = SkinCfg.get_id_list_by_hero[iter_2_17]

		for iter_2_18, iter_2_19 in pairs(var_2_30) do
			table.insert(var_2_29, RedPointConst.HERO_SKIN_ROUTE_ID .. iter_2_19)
		end

		arg_2_0:addGroup(var_2_28, var_2_29)

		local var_2_31 = {}
		local var_2_32 = {}

		for iter_2_20, iter_2_21 in pairs(SkinCfg.get_id_list_by_hero[iter_2_17]) do
			local var_2_33 = RedPointConst.HERO_SKIN_ID_EXTEND .. iter_2_21

			table.insert(var_2_31, var_2_33)

			if #SkinCfg[iter_2_21].gift > 0 then
				local var_2_34 = RedPointConst.SKIN_GIFT .. "_" .. iter_2_21

				table.insert(var_2_32, var_2_34)
			end
		end

		local var_2_35 = {}

		table.insertto(var_2_35, var_2_31)
		table.insertto(var_2_35, var_2_32)
		arg_2_0:addGroup(var_2_28, var_2_35)

		local var_2_36 = string.format("%s_%s", RedPointConst.HERO_REALTION, iter_2_17)
		local var_2_37 = string.format("%s_%s", RedPointConst.HERO_REALTION_UNLOCK, iter_2_17)
		local var_2_38 = string.format("%s_%s", RedPointConst.HERO_RELATION_STORY, iter_2_17)
		local var_2_39 = string.format("%s_%s", RedPointConst.HERO_RELATION_COMBO_SKILL, iter_2_17)

		arg_2_0:addGroup(var_2_36, {
			var_2_37,
			var_2_38,
			var_2_39
		})
		arg_2_0:addGroup(var_2_26, {
			var_2_27,
			var_2_28,
			var_2_25,
			var_2_23
		})
		table.insert(var_2_19, RedPointConst.HERO_HEART_STORY_ROOT_ID .. iter_2_17)

		local var_2_40 = HeroTools.GetHeroOntologyID(iter_2_17)

		arg_2_0:addGroup(RedPointConst.HERO_ARCHIVE_ID .. iter_2_17, {
			RedPointConst.HERO_HEARTLINK_ID .. var_2_40,
			string.format("%s_%s", RedPointConst.HERO_TRUST_UP_LEVEL, iter_2_17),
			var_2_36
		})

		for iter_2_22 = 1, HeroConst.HERO_HEARTLINK_STORY_MAX_COUNT do
			local var_2_41 = table.concat({
				RedPointConst.HERO_HEARTLINK_ID,
				var_2_40,
				"_",
				iter_2_22
			})

			arg_2_0:addGroup(RedPointConst.HERO_HEARTLINK_ID .. var_2_40, {
				var_2_41
			})
		end

		arg_2_0:addGroup(var_2_21, {
			var_2_27,
			var_2_28,
			var_2_25
		})
	end

	arg_2_0:addGroup(RedPointConst.HERO, var_2_20)
	arg_2_0:addGroup(RedPointConst.HERO_HEART_STORY_ROOT_FULL, var_2_19)

	local var_2_42 = {
		RedPointConst.TAROT_SIGN,
		RedPointConst.BIG_MONTH_CARD
	}
	local var_2_43 = ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.SEVEN_SIGN] or {}

	for iter_2_23, iter_2_24 in ipairs(var_2_43) do
		table.insert(var_2_42, string.format("%s_%s", RedPointConst.SIGN_SEVEN_DAY, iter_2_24))
	end

	arg_2_0:addGroup(RedPointConst.SIGN, var_2_42)

	local var_2_44 = {}
	local var_2_45 = ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.SEVEN_DAY_SIGN_SKIN] or {}

	for iter_2_25, iter_2_26 in ipairs(var_2_45) do
		table.insert(var_2_44, string.format("%s_%s", RedPointConst.SEVEN_DAY_SIGN_SKIN, iter_2_26))
	end

	arg_2_0:addGroup(RedPointConst.SEVEN_DAY_SIGN_SKIN, var_2_44)

	local var_2_46 = {}
	local var_2_47 = ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.SEVEN_DAY_SIGN_SKIN_LUWU] or {}

	for iter_2_27, iter_2_28 in ipairs(var_2_47) do
		table.insert(var_2_46, string.format("%s_%s", RedPointConst.SEVEN_DAY_SIGN_SKIN, iter_2_28))
	end

	arg_2_0:addGroup(RedPointConst.SEVEN_DAY_SIGN_SKIN, var_2_46)

	local var_2_48 = {}
	local var_2_49 = ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.SEVEN_DAY_SIGN_SKIN_WORLD_LINE] or {}

	for iter_2_29, iter_2_30 in ipairs(var_2_49) do
		table.insert(var_2_48, string.format("%s_%s", RedPointConst.SEVEN_DAY_SIGN_SKIN, iter_2_30))
	end

	arg_2_0:addGroup(RedPointConst.SEVEN_DAY_SIGN_SKIN, var_2_48)

	local var_2_50 = {}
	local var_2_51 = ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.SEVEN_DAY_SIGN_SKIN_NEW] or {}

	for iter_2_31, iter_2_32 in ipairs(var_2_51) do
		table.insert(var_2_50, string.format("%s_%s", RedPointConst.SEVEN_DAY_SIGN_SKIN, iter_2_32))
	end

	arg_2_0:addGroup(RedPointConst.SEVEN_DAY_SIGN_SKIN, var_2_50)

	local var_2_52 = {}
	local var_2_53 = ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.SEVEN_DAY_SIGN_SKIN_NEW] or {}

	for iter_2_33, iter_2_34 in ipairs(var_2_53) do
		if iter_2_34 == ActivityConst.ACTIVITY_4_0_SEVEN_DAY_SKIN_SIGN then
			table.insert(var_2_52, string.format("%s_%s", RedPointConst.SEVEN_DAY_SIGN_SKIN_NEWSIGN, iter_2_34))
			table.insert(var_2_52, string.format("%s_%s", RedPointConst.SEVEN_DAY_SIGN_SKIN_GIFT, iter_2_34))
			arg_2_0:addGroup(string.format("%s_%s", RedPointConst.SEVEN_DAY_SIGN_SKIN, iter_2_34), var_2_52)
		end
	end

	arg_2_0:addGroup(RedPointConst.SEVEN_DAY_SIGN_SKIN, var_2_52)

	local var_2_54 = ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.NORSE_SURPRISE_GIFT_DRAW] or {}

	for iter_2_35, iter_2_36 in ipairs(var_2_54) do
		local var_2_55 = string.format("%s_%s", RedPointConst.ACTIVITY_3_0_SURPRISE_GIFT_DRAW, iter_2_36)
		local var_2_56 = string.format("%s_%s", RedPointConst.ACTIVITY_3_0_SURPRISE_GIFT_RECEIVE, iter_2_36)
		local var_2_57 = string.format("%s_%s", RedPointConst.ACTIVITY_3_0_SURPRISE_GIFT, iter_2_36)

		arg_2_0:addGroup(var_2_57, {
			var_2_55,
			var_2_56
		})
	end

	local var_2_58 = string.format("%s_%s", RedPointConst.ACTIVITY_3_0_SURPRISE_GIFT, ActivityConst.ACTIVITY_3_0_SURPRISE_GIFT_DRAW)

	arg_2_0:addGroup(string.format("%s_%s", RedPointConst.SEVEN_DAY_SIGN_SKIN, ActivityConst.ACTIVITY_3_0_SEVEN_DAY_SKIN_SIGN), {
		var_2_58
	})

	local var_2_59 = {}
	local var_2_60 = {}
	local var_2_61 = {}

	for iter_2_37, iter_2_38 in ipairs(ChipCfg.get_id_list_by_type_id[ChipConst.TYPE_MANAGER]) do
		table.insert(var_2_60, string.format("%s_%s", RedPointConst.CHIP_MANAGER, iter_2_38))
		table.insert(var_2_61, string.format("%s_%s", RedPointConst.CHIP_MANAGER, iter_2_38))
	end

	for iter_2_39, iter_2_40 in ipairs(ChipCfg.get_id_list_by_type_id[ChipConst.TYPE_CHIP]) do
		table.insert(var_2_59, string.format("%s_%s", RedPointConst.CHIP_CHIP, iter_2_40))
		table.insert(var_2_61, string.format("%s_%s", RedPointConst.CHIP_CHIP, iter_2_40))
	end

	arg_2_0:addGroup(RedPointConst.CHIP_CHIP, var_2_59)
	arg_2_0:addGroup(RedPointConst.CHIP_MANAGER_CHIP, var_2_60)
	arg_2_0:addGroup(RedPointConst.CHIP_MANAGER, var_2_61)

	for iter_2_41, iter_2_42 in pairs(ChipCfg.get_id_list_by_spec_char) do
		if iter_2_41 > 0 then
			local var_2_62 = RedPointConst.CHIP_HERO_CHIP .. "_" .. iter_2_41
			local var_2_63 = {}
			local var_2_64 = {}

			for iter_2_43, iter_2_44 in pairs(iter_2_42) do
				local var_2_65 = RedPointConst.CHIP_HERO_CHIP .. "_" .. iter_2_41 .. "_" .. ChipCfg[iter_2_44].role_type_id .. "_" .. iter_2_44

				if var_2_63[ChipCfg[iter_2_44].role_type_id] then
					table.insert(var_2_63[ChipCfg[iter_2_44].role_type_id], var_2_65)
				else
					var_2_63[ChipCfg[iter_2_44].role_type_id] = {
						var_2_65
					}
				end

				local var_2_66 = RedPointConst.CHIP_HERO_CURRENCY_CHIP .. "_" .. iter_2_41 .. "_" .. ChipCfg[iter_2_44].role_type_id .. "_" .. iter_2_44

				if var_2_64[ChipCfg[iter_2_44].role_type_id] then
					table.insert(var_2_64[ChipCfg[iter_2_44].role_type_id], var_2_66)
				else
					var_2_64[ChipCfg[iter_2_44].role_type_id] = {
						var_2_66
					}
				end
			end

			local var_2_67 = {}

			for iter_2_45, iter_2_46 in pairs(var_2_63) do
				local var_2_68 = RedPointConst.CHIP_HERO_CHIP .. "_" .. iter_2_41 .. "_" .. iter_2_45

				arg_2_0:addGroup(var_2_68, var_2_63[iter_2_45])
				table.insert(var_2_67, var_2_68)
			end

			for iter_2_47, iter_2_48 in pairs(var_2_64) do
				local var_2_69 = RedPointConst.CHIP_HERO_CURRENCY_CHIP .. "_" .. iter_2_41 .. "_" .. iter_2_47

				arg_2_0:addGroup(var_2_69, var_2_64[iter_2_47])
			end

			arg_2_0:addGroup(var_2_62, var_2_67)
		end
	end

	arg_2_0:addGroup(RedPointConst.FRIEND, {
		RedPointConst.FRIEND_FRIEND_REQUESTS
	})

	local var_2_70 = {}

	for iter_2_49, iter_2_50 in ipairs(ItemCfg.get_id_list_by_type[ItemConst.ITEM_TYPE.SCENE]) do
		local var_2_71 = HomeSceneSettingCfg[iter_2_50]

		if var_2_71 and var_2_71.limit_display == 1 then
			table.insert(var_2_70, RedPointConst.SCENE .. "_" .. iter_2_50)
		end
	end

	arg_2_0:addGroup(RedPointConst.SCENE_NORMAL, var_2_70)

	local var_2_72 = {}

	for iter_2_51, iter_2_52 in pairs(SkinSceneActionCfg.get_id_list_by_special_scene_id) do
		local var_2_73 = HomeSceneSettingCfg[iter_2_51]

		if var_2_73 and var_2_73.limit_display and var_2_73.limit_display == 0 then
			table.insert(var_2_72, RedPointConst.SCENE .. "_" .. iter_2_51)
		end
	end

	arg_2_0:addGroup(RedPointConst.SCENE_DLC, var_2_72)
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
		RedPointConst.ACHIEVEMENT,
		RedPointConst.ILLU_USER,
		RedPointConst.FRIEND
	})
	arg_2_0:addGroup(RedPointConst.MAIN_HOME_MENU, {
		RedPointConst.MAIN_HOME_FUNC,
		RedPointConst.MAIN_HOME_SDK
	})

	local var_2_74 = {}

	for iter_2_53, iter_2_54 in pairs(AchievementCfg.get_id_list_by_type_id) do
		table.insert(var_2_74, string.format("%s_%s", RedPointConst.ACHIEVEMENT, iter_2_53))
	end

	local var_2_75 = {}

	for iter_2_55, iter_2_56 in pairs(AchievementStoryCfg.all) do
		table.insert(var_2_75, string.format("%s_%s", RedPointConst.ACHIEVEMENT_STORY, iter_2_56))
	end

	arg_2_0:addGroup(RedPointConst.ACHIEVEMENT_STORY, var_2_75)
	table.insertto(var_2_74, var_2_75)
	arg_2_0:addGroup(RedPointConst.ACHIEVEMENT, var_2_74)

	local var_2_76 = {}
	local var_2_77 = {}
	local var_2_78 = {}
	local var_2_79 = {}

	for iter_2_57, iter_2_58 in ipairs(ProfileDecorateItemCfg.all) do
		local var_2_80 = ProfileDecorateItemCfg[iter_2_58]

		if var_2_80.item_type == 4 then
			table.insert(var_2_76, RedPointConst.CUSTOM_STICKER_ITEM .. "_" .. iter_2_58)
		elseif var_2_80.item_type == 5 then
			table.insert(var_2_78, RedPointConst.CUSTOM_STICKER_ITEM .. "_" .. iter_2_58)
		elseif var_2_80.item_type == 6 then
			table.insert(var_2_77, RedPointConst.CUSTOM_STICKER_ITEM .. "_" .. iter_2_58)
		end
	end

	for iter_2_59, iter_2_60 in ipairs(StickerSuitCfg.all) do
		table.insert(var_2_79, RedPointConst.CUSTOM_STICKER_SUIT_REWARD .. "_" .. iter_2_60)
	end

	arg_2_0:addGroup(RedPointConst.CUSTOM_STICKER_BG, var_2_76)
	arg_2_0:addGroup(RedPointConst.CUSTOM_STICKER_FG, var_2_77)
	arg_2_0:addGroup(RedPointConst.CUSTOM_STICKER_ST, var_2_78)
	arg_2_0:addGroup(RedPointConst.CUSTOM_STICKER_SUIT_REWARD, var_2_79)
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
		RedPointConst.NORMAL_BONUS,
		RedPointConst.SKIN_DISCOUNT_GIFT
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
		RedPointConst.ILLU_ILLUSTRATION4,
		RedPointConst.ILLU_ILLUSTRATION5,
		RedPointConst.ILLU_ILLUSTRATION6
	})
	arg_2_0:addGroup(RedPointConst.ILLU_USER, {
		RedPointConst.ILLU_ILLUSTRATION,
		RedPointConst.ILLU_HERO
	})

	local var_2_81 = {}
	local var_2_82 = ItemCfg.get_id_list_by_type[ItemConst.ITEM_TYPE.TAG]

	for iter_2_61, iter_2_62 in ipairs(var_2_82) do
		if ItemCfg[iter_2_62].sub_type ~= ItemConst.ITEM_SUB_TYPE.TAG_LIMIT then
			table.insert(var_2_81, RedPointConst.TAG .. "_" .. iter_2_62)
		end
	end

	arg_2_0:addGroup(RedPointConst.TAG, var_2_81)

	local var_2_83 = {}
	local var_2_84 = ItemCfg.get_id_list_by_type[ItemConst.ITEM_TYPE.CARD_BG]

	for iter_2_63, iter_2_64 in ipairs(var_2_84) do
		if ItemCfg[iter_2_64].sub_type ~= ItemConst.ITEM_SUB_TYPE.CARD_BG_LIMIT then
			table.insert(var_2_83, RedPointConst.CARD_BG .. "_" .. iter_2_64)
		end
	end

	arg_2_0:addGroup(RedPointConst.CARD_BG, var_2_83)

	local var_2_85 = {}
	local var_2_86 = GameSetting.profile_chat_bubble_default.value[1]

	for iter_2_65, iter_2_66 in ipairs(ItemCfg.get_id_list_by_type[ItemConst.ITEM_TYPE.CHAT_BUBBLE]) do
		if iter_2_66 ~= var_2_86 then
			table.insert(var_2_85, string.format("%s_%s", RedPointConst.CHAT_BUBBLE, iter_2_66))
		end
	end

	arg_2_0:addGroup(RedPointConst.CHAT_BUBBLE, var_2_85)
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

	local var_2_87 = {}

	for iter_2_67, iter_2_68 in ipairs(ActivityMonsterCosplayCfg.all) do
		local var_2_88 = ActivityMonsterCosplayCfg[iter_2_68]

		var_2_87[iter_2_68] = {}

		for iter_2_69, iter_2_70 in ipairs(var_2_88.skill_list) do
			table.insert(var_2_87[iter_2_68], "MonsterCosPlay" .. iter_2_70)
		end
	end

	local var_2_89 = {}

	for iter_2_71, iter_2_72 in ipairs(ActivityMonsterCosplayCfg.all) do
		arg_2_0:addGroup("MonsterCosPlayMonsterID" .. iter_2_72, var_2_87[iter_2_72])
		table.insert(var_2_89, "MonsterCosPlayMonsterID" .. iter_2_72)
	end

	arg_2_0:addGroup(RedPointConst.MONSTER_COSPLAY_SKILL, var_2_89)
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

	local var_2_90 = {}

	for iter_2_73, iter_2_74 in ipairs(NoobVersionCfg.all) do
		local var_2_91 = NoobVersionCfg[iter_2_74]
		local var_2_92 = var_2_91.noob_advance_task_type

		if type(var_2_92) == "table" then
			for iter_2_75, iter_2_76 in ipairs(var_2_92) do
				local var_2_93 = string.format("%s_%d", RedPointConst.NOOB_ADVANCE, iter_2_76)

				var_2_90[#var_2_90 + 1] = var_2_93

				local var_2_94 = var_2_91.noob_advance_task_phase[iter_2_75]
				local var_2_95 = NoobAdvanceTaskPhaseListCfg[var_2_94].phase_list
				local var_2_96 = {}

				for iter_2_77, iter_2_78 in ipairs(var_2_95) do
					local var_2_97 = string.format("%s_%d_%d", RedPointConst.NOOB_ADVANCE, iter_2_76, iter_2_77)

					var_2_96[#var_2_96 + 1] = var_2_97

					local var_2_98 = {}

					for iter_2_79, iter_2_80 in ipairs(iter_2_78[2]) do
						var_2_98[#var_2_98 + 1] = string.format("%s_%d_%d_%d", RedPointConst.NOOB_ADVANCE, iter_2_76, iter_2_77, iter_2_80[1])
					end

					arg_2_0:addGroup(var_2_97, var_2_98)
				end

				arg_2_0:addGroup(var_2_93, var_2_96)
			end

			arg_2_0:addGroup(RedPointConst.NOOB_ADVANCE, var_2_90)
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

	local var_2_99 = {}

	for iter_2_81, iter_2_82 in pairs(WarchessLevelCfg.get_id_list_by_type) do
		if iter_2_81 ~= 0 then
			local var_2_100 = {}

			for iter_2_83, iter_2_84 in ipairs(iter_2_82) do
				table.insert(var_2_100, string.format("%s_%s_%s", RedPointConst.WAR_CHESS, iter_2_81, iter_2_84))
			end

			arg_2_0:addGroup(string.format("%s_%s", RedPointConst.WAR_CHESS, iter_2_81), var_2_100)
		end
	end

	local var_2_101 = {}

	for iter_2_85, iter_2_86 in ipairs(StageGroupCfg.get_id_list_by_type[BattleConst.STAGE_TYPE_NEW.OSIRIS_DEMON]) do
		table.insert(var_2_101, DemonChallengeData:GetRedPointConst(iter_2_85))
	end

	arg_2_0:addGroup(RedPointConst.OSIRIS_DEMON, var_2_101)

	for iter_2_87, iter_2_88 in ipairs(ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.HERO_TRIAL]) do
		local var_2_102 = ActivityCfg[iter_2_88].sub_activity_list
		local var_2_103 = {}

		for iter_2_89, iter_2_90 in pairs(var_2_102) do
			local var_2_104 = ActivityHeroTrialCfg.get_id_list_by_activity_id[iter_2_90]

			for iter_2_91, iter_2_92 in ipairs(var_2_104) do
				table.insert(var_2_103, string.format("%s_%s", RedPointConst.HERO_TRIAL, iter_2_92))
			end
		end

		arg_2_0:addGroup(string.format("%s_%s", RedPointConst.HERO_TRIAL, iter_2_88), var_2_103)
	end

	arg_2_0:addGroup(RedPointConst.OSIRIS_ACTIVITY, {
		string.format("%s_%s", RedPointConst.ACTIVITY_TASK, ActivityConst.OSIRIS_TASK_DAILY),
		string.format("%s_%s", RedPointConst.WAR_CHESS, ActivityConst.OSIRIS_CHESS),
		RedPointConst.OSIRIS_DEMON,
		RedPointConst.OSIRIS_RACE_TRIAL,
		string.format("%s_%s", RedPointConst.HERO_TRIAL, ActivityConst.OSIRIS_HERO_TRIAL_STAGE)
	})

	for iter_2_93, iter_2_94 in ipairs(ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.SKIN_TRIAL]) do
		local var_2_105 = ActivityCfg[iter_2_94].sub_activity_list
		local var_2_106 = {}

		for iter_2_95, iter_2_96 in pairs(var_2_105) do
			local var_2_107 = ActivitySkinTrialCfg.get_id_list_by_activity_id[iter_2_96]

			for iter_2_97, iter_2_98 in ipairs(var_2_107 or {}) do
				table.insert(var_2_106, string.format("%s_%s", RedPointConst.SKIN_TRIAL, iter_2_98))
			end
		end

		arg_2_0:addGroup(string.format("%s_%s", RedPointConst.SKIN_TRIAL, iter_2_94), var_2_106)
	end

	local var_2_108 = ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.SLAYER] or {}

	for iter_2_99, iter_2_100 in ipairs(var_2_108) do
		local var_2_109 = ActivityCfg[iter_2_100].sub_activity_list

		if #var_2_109 > 0 then
			local var_2_110 = {}

			for iter_2_101, iter_2_102 in ipairs(var_2_109) do
				arg_2_0:addGroup(string.format("%s_%s", RedPointConst.SLYAER_REGIONS, iter_2_102), {
					string.format("%s_%s", RedPointConst.SLAYER_REGIONS_SELECT, iter_2_102),
					string.format("%s_%s", RedPointConst.SLAYER_REGIONS_REWARD, iter_2_102)
				})

				var_2_110[#var_2_110 + 1] = string.format("%s_%s", RedPointConst.SLYAER_REGIONS, iter_2_102)
			end

			arg_2_0:addGroup(string.format("%s_%s", RedPointConst.SLYAER_REGIONS, iter_2_100), var_2_110)
		end

		arg_2_0:addGroup(string.format("%s_%s", RedPointConst.SLAYER, iter_2_100), {
			string.format("%s_%s", RedPointConst.SLYAER_REGIONS, iter_2_100),
			string.format("%s_%s", RedPointConst.SLYAER_REWARD, iter_2_100)
		})
	end

	local var_2_111 = ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.PARKOUR] or {}

	for iter_2_103, iter_2_104 in ipairs(var_2_111) do
		arg_2_0:addGroup(string.format("%s_%s", RedPointConst.PARKOUR, iter_2_104), {
			string.format("%s_%s", RedPointConst.PARKOUR_ENTRUST_ALL, iter_2_104)
		})
		arg_2_0:addGroup(string.format("%s_%s", RedPointConst.PARKOUR_ENTRUST_ALL, iter_2_104), {
			string.format("%s_%s", RedPointConst.PARKOUR_REWARD, iter_2_104),
			string.format("%s_%s", RedPointConst.PARKOUR_ENTRUST, iter_2_104)
		})

		local var_2_112 = ActivityCfg[iter_2_104].sub_activity_list
		local var_2_113 = {}

		for iter_2_105, iter_2_106 in ipairs(var_2_112) do
			table.insert(var_2_113, string.format("%s_%s", RedPointConst.PARKOUR_ENTRUST_REWARD, iter_2_106))
		end

		arg_2_0:addGroup(string.format("%s_%s", RedPointConst.PARKOUR_REWARD, iter_2_104), var_2_113)
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
	arg_2_0:addGroup(RedPointConst.NEW_REGRESSION, {
		RedPointConst.NEW_REGRESSION_TASK,
		RedPointConst.NEW_REGRESSION_PRIVILEGE
	})

	local var_2_114 = {
		TaskConst.TASK_TYPE.REGRESSION_CURRENT_ACT,
		TaskConst.TASK_TYPE.REGRESSION_DRAW,
		TaskConst.TASK_TYPE.REGRESSION_TILI
	}
	local var_2_115 = {
		RedPointConst.NEW_REGRESSION_SIGN
	}

	for iter_2_107, iter_2_108 in pairs(var_2_114) do
		local var_2_116 = string.format("%s_%s", RedPointConst.NEW_REGRESSION_TASK_TOGGLE, iter_2_108)

		table.insert(var_2_115, var_2_116)
		arg_2_0:addGroup(var_2_116, {
			var_2_115,
			string.format("%s_%s", RedPointConst.NEW_REGRESSION_TASK_REWARD, iter_2_108),
			var_2_115,
			string.format("%s_%s", RedPointConst.NEW_REGRESSION_TASK_FIRST, iter_2_108)
		})
	end

	arg_2_0:addGroup(RedPointConst.NEW_REGRESSION_TASK, var_2_115)
	arg_2_0:addGroup(RedPointConst.NEW_REGRESSION_SIGN, {
		RedPointConst.NEW_REGRESSION_SIGN_REWARD,
		RedPointConst.NEW_REGRESSION_SIGN_FIRST
	})
	arg_2_0:addGroup(RedPointConst.NEW_REGRESSION_PRIVILEGE, {
		RedPointConst.NEW_REGRESSION_RES_FIND,
		RedPointConst.NEW_REGRESSION_SHOP,
		RedPointConst.NEW_REGRESSION_DRAW_NEW_TAG,
		RedPointConst.NEW_REGRESSION_GIFT_NET_TAG
	})
	arg_2_0:addGroup(RedPointConst.NEW_REGRESSION_GIFT_NET_TAG, {
		RedPointConst.NEW_REGRESSION_MONTHCARD_NEW_TAG,
		RedPointConst.NEW_REGRESSION_PASSPORT_NEW_TAG
	})
	arg_2_0:addGroup(RedPointConst.NEW_REGRESSION_SHOP, {
		RedPointConst.NEW_REGRESSION_FREE_DAILY_REWARD,
		RedPointConst.NEW_REGRESSION_FREE_REWARD
	})
	arg_2_0:addGroup(RedPointConst.NEW_REGRESSION, {
		RedPointConst.NEW_REGRESSION_TASK,
		RedPointConst.NEW_REGRESSION_PRIVILEGE
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

	local var_2_117 = ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.SINGLE_MATRIX] or {}

	for iter_2_109, iter_2_110 in ipairs(var_2_117) do
		arg_2_0:addGroup(string.format("%s_%s", RedPointConst.ACTIVITY_MATRIX, iter_2_110), {
			string.format("%s_%s", RedPointConst.ACTIVITY_MATRIX_REWARD, iter_2_110),
			string.format("%s_%s", RedPointConst.ACTIVITY_MATRIX_CLUE, iter_2_110),
			string.format("%s_%s", RedPointConst.ACTIVITY_MATRIX_READ, iter_2_110)
		})
	end

	local var_2_118 = ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.ACTIVITY_MUSIC] or {}

	for iter_2_111, iter_2_112 in ipairs(var_2_118) do
		arg_2_0:addGroup(string.format("%s_%s", RedPointConst.MUSIC, iter_2_112), {
			string.format("%s_%s", RedPointConst.MUSIC_OPEN, iter_2_112),
			string.format("%s_%s", RedPointConst.MUSIC_REWARD, iter_2_112)
		})
	end

	if not ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.ACTIVITY_ZUMA] then
		local var_2_119 = {}
	end

	local var_2_120 = {}

	table.insert(var_2_120, RedPointConst.ZUMA_REWARD)
	table.insert(var_2_120, RedPointConst.ZUMA_TALENT)

	local var_2_121 = ZumaData:GetZumaCfgData()

	for iter_2_113, iter_2_114 in pairs(ZumaConst.ZUMA_DIFFICULT or {}) do
		local var_2_122 = var_2_121[iter_2_114]
		local var_2_123 = {}

		for iter_2_115, iter_2_116 in ipairs(var_2_122 or {}) do
			table.insert(var_2_123, string.format("%s_%s", RedPointConst.ZUMA_OPEN, iter_2_116.activity_id))
		end

		local var_2_124 = string.format("%s_%s", RedPointConst.ZUMA_DIFFICULT, iter_2_114)

		arg_2_0:addGroup(var_2_124, var_2_123)
		table.insert(var_2_120, var_2_124)
	end

	arg_2_0:addGroup(RedPointConst.ZUMA .. ActivityConst.ACTIVITY_ZUMA, var_2_120)
	arg_2_0:addGroup(RedPointConst.ZUMA .. ActivityConst.ACTIVITY_3_11_ZUMA, var_2_120)

	local var_2_125 = ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.STRATEGY_MATRIX] or {}

	for iter_2_117, iter_2_118 in ipairs(var_2_125) do
		local var_2_126 = StrategyMatrixCfg[iter_2_118]

		if var_2_126.activity_difficulty == 1 then
			arg_2_0:addGroup(string.format("%s_%s", RedPointConst.STRATEGY_MATRIX, iter_2_118), {
				string.format("%s_%s", RedPointConst.STRATEGY_MATRIX_OPEN, iter_2_118),
				string.format("%s_%s", RedPointConst.STRATEGY_MATRIX_REWARD, iter_2_118)
			})
		else
			local var_2_127 = var_2_126.pre_condition_args[1] and var_2_126.pre_condition_args[1][2][1]

			if var_2_127 then
				arg_2_0:addGroup(string.format("%s_%s", RedPointConst.STRATEGY_MATRIX, var_2_127), {
					string.format("%s_%s", RedPointConst.STRATEGY_MATRIX_OPEN, iter_2_118),
					string.format("%s_%s", RedPointConst.STRATEGY_MATRIX_REWARD, iter_2_118)
				})
			else
				print("困难模式的肉鸽，无法取到前置活动id,联系活动肉鸽策划")
			end
		end
	end

	local var_2_128 = ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.GUILD_ACTIVITY] or {}

	for iter_2_119, iter_2_120 in ipairs(var_2_128) do
		arg_2_0:addGroup(string.format("%s_%s", RedPointConst.GUILD_ACTIVITY, iter_2_120), {
			string.format("%s_%s", RedPointConst.GUILD_ACTIVITY_RATE, iter_2_120),
			RedPointConst.GUILD_ACTIVITY_UNREGISTER,
			string.format("%s_%s", RedPointConst.GUILD_ACTIVITY_UNGET_COIN, iter_2_120)
		})

		local var_2_129 = {}

		for iter_2_121, iter_2_122 in pairs(TalentTreeCfg.get_id_list_by_activity_id_and_race[iter_2_120]) do
			local var_2_130 = string.format("%s_%d_%d", RedPointConst.GUILD_ACTIVITY_AFFIX, iter_2_120, iter_2_121)

			var_2_129[#var_2_129 + 1] = var_2_130

			local var_2_131 = {}

			for iter_2_123, iter_2_124 in pairs(iter_2_122) do
				var_2_131[#var_2_131 + 1] = string.format("%s_%d_%d_%d", RedPointConst.GUILD_ACTIVITY_AFFIX, iter_2_120, iter_2_121, iter_2_124)
			end

			arg_2_0:addGroup(var_2_130, var_2_131)
		end

		arg_2_0:addGroup(string.format("%s_%d", RedPointConst.GUILD_ACTIVITY_AFFIX, iter_2_120), var_2_129)
	end

	local var_2_132 = GuildActivitySPTools:GetActivityState()

	for iter_2_125, iter_2_126 in pairs(var_2_132) do
		arg_2_0:addGroup(string.format("%s_%s", RedPointConst.GUILD_ACTIVITY_SP, iter_2_125), {
			RedPointConst.GUILD_ACTIVITY_SP_UNREGISTER
		})

		local var_2_133 = iter_2_126.start

		arg_2_0:addGroup(string.format("%s_%s", RedPointConst.GUILD_ACTIVITY_SP, iter_2_125), {
			string.format("%s_%s", RedPointConst.GUILD_ACTIVITY_SP_BONUS, var_2_133),
			string.format("%s_%s", RedPointConst.GUILD_ACTIVITY_SP_UNGET_COIN, var_2_133),
			string.format("%s_%s", RedPointConst.GUILD_ACTIVITY_SP_HERO_FIGHT, var_2_133)
		})

		local var_2_134 = {}

		if TalentTreeCfg.get_id_list_by_activity_id_and_race[var_2_133] then
			for iter_2_127, iter_2_128 in pairs(TalentTreeCfg.get_id_list_by_activity_id_and_race[var_2_133]) do
				local var_2_135 = string.format("%s_%d_%d", RedPointConst.GUILD_ACTIVITY_SP_AFFIX, var_2_133, iter_2_127)

				var_2_134[#var_2_134 + 1] = var_2_135

				local var_2_136 = {}

				for iter_2_129, iter_2_130 in pairs(iter_2_128) do
					var_2_136[#var_2_136 + 1] = string.format("%s_%d_%d_%d", RedPointConst.GUILD_ACTIVITY_SP_AFFIX, var_2_133, iter_2_127, iter_2_130)
				end

				arg_2_0:addGroup(var_2_135, var_2_136)
			end

			arg_2_0:addGroup(string.format("%s_%d", RedPointConst.GUILD_ACTIVITY_SP_AFFIX, var_2_133), var_2_134)
		end
	end

	local var_2_137 = ActivityCfg[ActivityConst.FACTORY_MARDUK].sub_activity_list
	local var_2_138 = {}

	for iter_2_131, iter_2_132 in ipairs(var_2_137) do
		table.insert(var_2_138, string.format("%s_%d", RedPointConst.MARDUK_SPECIAL_NOT_FIGHT, iter_2_132))
	end

	arg_2_0:addGroup(string.format("%s_%d", RedPointConst.MARDUK_SPECIAL_NOT_FIGHT, ActivityConst.FACTORY_MARDUK), var_2_138)
	arg_2_0:addGroup(string.format("%s_%d", RedPointConst.MARDUK_SPECIAL, ActivityConst.FACTORY_MARDUK), {
		string.format("%s_%d", RedPointConst.MARDUK_SPECIAL_NOT_FIGHT, ActivityConst.FACTORY_MARDUK),
		string.format("%s_%d", RedPointConst.MARDUK_SPECIAL_REWARD, ActivityConst.FACTORY_MARDUK)
	})

	local var_2_139 = ActivityCfg[ActivityConst.ACTIVITY_2_2_SPECIAL].sub_activity_list
	local var_2_140 = {}

	for iter_2_133, iter_2_134 in ipairs(var_2_139) do
		table.insert(var_2_140, string.format("%s_%d", RedPointConst.MARDUK_SPECIAL_NOT_FIGHT, iter_2_134))
	end

	arg_2_0:addGroup(string.format("%s_%d", RedPointConst.MARDUK_SPECIAL_NOT_FIGHT, ActivityConst.ACTIVITY_2_2_SPECIAL), var_2_140)
	arg_2_0:addGroup(string.format("%s_%d", RedPointConst.MARDUK_SPECIAL, ActivityConst.ACTIVITY_2_2_SPECIAL), {
		string.format("%s_%d", RedPointConst.MARDUK_SPECIAL_NOT_FIGHT, ActivityConst.ACTIVITY_2_2_SPECIAL),
		string.format("%s_%d", RedPointConst.MARDUK_SPECIAL_REWARD, ActivityConst.ACTIVITY_2_2_SPECIAL)
	})

	local var_2_141 = ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.FIRE_WORK_MAIN] or {}

	for iter_2_135, iter_2_136 in ipairs(var_2_141) do
		local var_2_142 = ActivityCfg[iter_2_136].sub_activity_list
		local var_2_143 = {}

		for iter_2_137, iter_2_138 in ipairs(var_2_142) do
			if ActivityCfg[iter_2_138].activity_template == ActivityTemplateConst.FIRE_WORK then
				local var_2_144 = string.format("%s_%s", RedPointConst.FIRE_WORK, iter_2_138)

				arg_2_0:addGroup(var_2_144, {
					string.format("%s_%s", RedPointConst.FIRE_WORK_OPEN, iter_2_138),
					string.format("%s_%s", RedPointConst.FIRE_WORK_REWARD, iter_2_138)
				})
				table.insert(var_2_143, var_2_144)
			end
		end

		arg_2_0:addGroup(string.format("%s_%s", RedPointConst.FIRE_WORK_MAIN, iter_2_136), var_2_143)
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

	local var_2_145 = #GameSetting.dorm_canteen_task_unlock.value
	local var_2_146 = {}

	for iter_2_139 = 1, var_2_145 do
		var_2_146[iter_2_139] = string.format("%s_%s", RedPointConst.CANTEEN_UNLOCK_ENTRUST, tostring(iter_2_139))
	end

	arg_2_0:addGroup(RedPointConst.CANTEEN_UNLOCK_ENTRUST, var_2_146)

	local var_2_147 = {}
	local var_2_148 = 1

	for iter_2_140, iter_2_141 in pairs(DormEnum.FurnitureTypeNum) do
		var_2_147[var_2_148] = string.format("%s_%s", RedPointConst.CANTEEN_UNLOCK_FOOD, tostring(iter_2_141))
		var_2_148 = var_2_148 + 1
	end

	arg_2_0:addGroup(RedPointConst.CANTEEN_UNLOCK_FOOD, var_2_147)

	for iter_2_142, iter_2_143 in pairs(DormEnum.FurnitureTypeNum) do
		local var_2_149 = {}

		for iter_2_144, iter_2_145 in ipairs(BackHomeCanteenFoodCfg.all) do
			if BackHomeCanteenFoodCfg[iter_2_145].cook_type == iter_2_143 then
				local var_2_150 = string.format("%s_%s_%s", RedPointConst.CANTEEN_UNLOCK_FOOD, tostring(iter_2_143), iter_2_145)

				table.insert(var_2_149, var_2_150)
			end
		end

		arg_2_0:addGroup(string.format("%s_%s", RedPointConst.CANTEEN_UNLOCK_FOOD, iter_2_143), var_2_149)
	end

	local var_2_151 = {}

	for iter_2_146, iter_2_147 in pairs(DormEnum.FurnitureMainType) do
		local var_2_152 = string.format("%s_%s", RedPointConst.CANTEEN_UPGRADE_AVAILABLE, tostring(iter_2_147))

		table.insert(var_2_151, var_2_152)
	end

	arg_2_0:addGroup(RedPointConst.CANTEEN_UPGRADE_AVAILABLE, var_2_151)
	arg_2_0:addGroup(RedPointConst.DORM, {
		RedPointConst.DORM_PLACEMENT
	})
	arg_2_0:addGroup(RedPointConst.DORM_NAVI, {
		RedPointConst.DORM_ILLU,
		RedPointConst.CANTEEN,
		RedPointConst.IDOL_TRAINEE
	})

	local var_2_153 = {}

	for iter_2_148, iter_2_149 in ipairs(BackHomeCfg.all) do
		if BackHomeCfg[iter_2_149].type == 3 then
			table.insert(var_2_153, RedPointConst.DORM_PLACEMENT_ROOM .. iter_2_149)
		end
	end

	arg_2_0:addGroup(RedPointConst.DORM_PLACEMENT, var_2_153)

	local var_2_154 = {}

	for iter_2_150 = DormConst.DORM_FUR_TYPE_START, DormConst.DORM_FUR_TYPE_END do
		table.insert(var_2_154, string.format("%s_%s", RedPointConst.DORM_FURNITURE, tostring(iter_2_150)))
	end

	table.insert(var_2_154, RedPointConst.DORM_SUIT)
	arg_2_0:addGroup(RedPointConst.DORM_FURNITURE, var_2_154)

	local var_2_155 = {}
	local var_2_156 = {}
	local var_2_157 = DormSuitData:GetSuitIDListByType(DormSuitTools.DORM_SUIT_TYPE.FULL_SET)

	for iter_2_151, iter_2_152 in ipairs(var_2_157) do
		local var_2_158 = BackHomeSuitCfg[iter_2_152].scene_id[1]

		if var_2_158 == DormConst.BACKHOME_TYPE.PublicDorm then
			table.insert(var_2_156, string.format("%s_%s", RedPointConst.DORM_FULL_PUBLIC_SUIT, tostring(iter_2_152)))
		elseif var_2_158 == DormConst.BACKHOME_TYPE.PrivateDorm then
			table.insert(var_2_155, string.format("%s_%s", RedPointConst.DORM_FULL_PRIVATE_SUIT, tostring(iter_2_152)))
		end
	end

	arg_2_0:addGroup(RedPointConst.DORM_FULL_PUBLIC_SUIT, var_2_156)
	arg_2_0:addGroup(RedPointConst.DORM_FULL_PRIVATE_SUIT, var_2_155)

	local var_2_159 = {}
	local var_2_160 = DormSuitData:GetSuitIDListByType(DormSuitTools.DORM_SUIT_TYPE.PART_SET)

	for iter_2_153, iter_2_154 in ipairs(var_2_160) do
		table.insert(var_2_159, string.format("%s_%s", RedPointConst.DORM_PART_SUIT, tostring(iter_2_154)))
	end

	arg_2_0:addGroup(RedPointConst.DORM_PART_SUIT, var_2_159)

	local var_2_161 = {}
	local var_2_162 = DormTools:GetAllDormShopIDList()

	for iter_2_155, iter_2_156 in ipairs(var_2_162) do
		local var_2_163 = DormSuitTools:GetFurSuitGoodListByShopID(iter_2_156)
		local var_2_164 = {}

		if #var_2_163 > 0 then
			for iter_2_157, iter_2_158 in ipairs(var_2_163) do
				table.insert(var_2_164, DormRedPointTools.FurnitureItemRedPoint(iter_2_156, iter_2_158))
			end

			local var_2_165 = ShopTools.GetShopRedPointKey(iter_2_156)

			arg_2_0:addGroup(var_2_165, var_2_164)
			table.insert(var_2_161, var_2_165)
		end
	end

	arg_2_0:addGroup(RedPointConst.DORM_SUIT_SHOP, var_2_161)

	local var_2_166 = {}
	local var_2_167 = {}
	local var_2_168 = {}

	table.insert(var_2_166, RedPointConst.DORM_ILLU_HERO)
	table.insert(var_2_166, RedPointConst.DORM_ILLU_REWARD_1)
	arg_2_0:addGroup(RedPointConst.DORM_ILLU_HERO_ALL, var_2_166)

	local var_2_169 = {}

	for iter_2_159, iter_2_160 in ipairs(BackHomeFurnitureThemeCfg.all) do
		local var_2_170 = RedPointConst.DORM_ILLU_FUR_THEME .. iter_2_160

		table.insert(var_2_169, var_2_170)
	end

	arg_2_0:addGroup(RedPointConst.DORM_ILLU_FUR, var_2_169)
	table.insert(var_2_167, RedPointConst.DORM_ILLU_FUR)
	table.insert(var_2_167, RedPointConst.DORM_ILLU_REWARD_3)
	arg_2_0:addGroup(RedPointConst.DORM_ILLU_FUR_ALL, var_2_167)
	table.insert(var_2_168, RedPointConst.DORM_ILLU_DANCE)
	table.insert(var_2_168, RedPointConst.DORM_ILLU_REWARD_2)
	arg_2_0:addGroup(RedPointConst.DORM_ILLU_DANCE_ALL, var_2_168)
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

	local var_2_171 = {}

	for iter_2_161, iter_2_162 in ipairs(IdolTraineeChapterCfg.all) do
		table.insert(var_2_171, string.format("%s_%s", RedPointConst.IDOL_TRAINEE_CHAPTER_TASK, iter_2_162))
	end

	arg_2_0:addGroup(RedPointConst.IDOL_TRAINEE_CHAPTER_TASK, var_2_171)
	arg_2_0:addGroup(RedPointConst.IDOL_TRAINEE, {
		RedPointConst.IDOL_TRAINEE_CHAPTER_TASK,
		RedPointConst.IDOL_TRAINEE_DAY_AND_WEEK_TASK
	})
	arg_2_0:addGroup(RedPointConst.BACKHOME, {
		RedPointConst.DORM,
		RedPointConst.CANTEEN,
		RedPointConst.DORM_ILLU,
		RedPointConst.IDOL_TRAINEE
	})
	arg_2_0:addGroup(RedPointConst.ABYSS, {
		RedPointConst.ABYSS_REWARD,
		RedPointConst.ABYSS_CHALLENGE,
		string.format(ServerRedPointPrefix, ServerRedPoint.DISORDER_TRAP_NEW_RED, "ROOT")
	})

	local var_2_172 = MailSpecialLetterCfg.get_id_list_by_letter_belongs
	local var_2_173 = {}

	for iter_2_163, iter_2_164 in pairs(var_2_172) do
		table.insert(var_2_173, RedPointConst.LETTER_SENDER_ID .. iter_2_163)

		local var_2_174 = {}

		for iter_2_165, iter_2_166 in pairs(iter_2_164) do
			table.insert(var_2_174, RedPointConst.LETTER_ID .. iter_2_166)
		end

		arg_2_0:addGroup(RedPointConst.LETTER_SENDER_ID .. iter_2_163, var_2_174)
	end

	arg_2_0:addGroup(RedPointConst.LETTER_UNREAD, var_2_173)
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

	local var_2_175 = {}

	for iter_2_167 = 1, #ExploreMeowCfg.all do
		local var_2_176 = ExploreMeowCfg.all[iter_2_167]

		var_2_175[iter_2_167] = RedPointConst.EXPLORE_UNLOCK_ADMIN_CAT .. var_2_176
	end

	local var_2_177 = {}

	for iter_2_168 = 1, #ExploreAreaCfg.all do
		local var_2_178 = ExploreAreaCfg.all[iter_2_168]

		var_2_177[iter_2_168] = RedPointConst.EXPLORE_FINISH .. var_2_178
	end

	arg_2_0:addGroup(RedPointConst.EXPLORE_UNLOCK_ADMIN_CAT, var_2_175)
	arg_2_0:addGroup(RedPointConst.EXPLORE_FINISH, var_2_177)
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
	arg_2_0:addGroup(RedPointConst.SETING_GAME_RED, {
		RedPointConst.DLC_BTN_RED
	})
	arg_2_0:addGroup(RedPointConst.SETTING_NEW_FUNCTION, {
		RedPointConst.SETTING_SCREEN,
		RedPointConst.SETTING_REMIND,
		RedPointConst.SETING_GAME_RED
	})

	local var_2_179 = {}

	for iter_2_169, iter_2_170 in ipairs(RechargeRecommendCfg.all) do
		table.insert(var_2_179, RedPointConst.RECHARGE_RECOMMEND .. iter_2_170)
	end

	arg_2_0:addGroup(RedPointConst.RECHARGE_RECOMMEND, var_2_179)

	for iter_2_171, iter_2_172 in ipairs(ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.STRONGHOLD]) do
		arg_2_0:addGroup(string.format("%s_%s", RedPointConst.STRONGHOLD, iter_2_172), {
			string.format("%s_%s", RedPointConst.STRONGHOLD_REWARD, iter_2_172),
			string.format("%s_%s", RedPointConst.STRONGHOLD_INCREASE, iter_2_172),
			string.format("%s_%s", RedPointConst.STRONGHOLD_TASK, iter_2_172)
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

	local var_2_180 = {}

	for iter_2_173, iter_2_174 in ipairs(ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.ACTIVITY_SKIN_DRAW]) do
		table.insert(var_2_180, RedPointConst.ACTIVITY_DRAW .. "_" .. iter_2_174)
	end

	arg_2_0:addGroup(RedPointConst.ACTIVITY_DRAW, var_2_180)

	local var_2_181 = ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.ACTIVITY_ATTRIBUTE_ARENA] or {}

	for iter_2_175, iter_2_176 in ipairs(var_2_181) do
		arg_2_0:addGroup(string.format("%s_%s", RedPointConst.ACTIVITY_ATTRIBUTE_ARENA, iter_2_176), {
			string.format("%s_%s", RedPointConst.ACTIVITY_ATTRIBUTE_ARENA_TASK, iter_2_176),
			string.format("%s_%s", RedPointConst.ACTIVITY_ATTRIBUTE_ARENA_ENTER, iter_2_176)
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

	local var_2_182 = SPHeroChallengeData.activityCfg[ActivityConst.ACTIVITY_HERO_CHALLENGE_3_1].heroChipActivityID
	local var_2_183 = SPHeroChallengeData.activityCfg[ActivityConst.ACTIVITY_HERO_CHALLENGE_3_1].taskActivityID

	arg_2_0:addGroup(RedPointConst.SP_HERO_CHALLENGE_3_1, {
		RedPointConst.SP_HERO_CHALLENGE_3_1_ENTRUST,
		string.format("%s_%s", RedPointConst.ACTIVITY_TASK, var_2_182),
		string.format("%s_%s", RedPointConst.ACTIVITY_TASK, var_2_183)
	})

	local var_2_184 = {}

	for iter_2_177, iter_2_178 in ipairs(ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.ACTIVITY_SWIMSUIT_BATTLE_HERO_STAGE]) do
		table.insert(var_2_184, string.format("%s_%s", RedPointConst.ACTIVITY_SWIMSUIT_BATTLE_HERO, iter_2_178))
	end

	table.insert(var_2_184, RedPointConst.ACTIVITY_SWIMSUIT_BATTLE_REWARD)
	arg_2_0:addGroup(string.format("%s%s", ActivityTools.GetRedPointKey(282951), 282951), var_2_184)
	arg_2_0:addGroup(string.format("%s%s", ActivityTools.GetRedPointKey(282961), 282961), {
		RedPointConst.ACTIVITY_SWIMSUIT_VOTE_TICKET,
		RedPointConst.ACTIVITY_SWIMSUIT_VOTE_REWARD
	})

	local var_2_185 = {}
	local var_2_186 = {}
	local var_2_187 = {
		RedPointConst.CAPTURE_GAME_UNLOCK_STAGE,
		"_",
		0
	}
	local var_2_188 = {
		RedPointConst.CAPTURE_GAME_UNLOCK_SECTION,
		"_",
		0
	}

	for iter_2_179, iter_2_180 in ipairs(ActivitySwimSkinSectionCfg.all) do
		local var_2_189 = ActivitySwimSkinSectionCfg[iter_2_180]
		local var_2_190 = {}

		var_2_188[3] = iter_2_180

		local var_2_191 = table.concat(var_2_188)

		if var_2_189.mode == CaptureGameConst.CaptureGameMode.Single then
			for iter_2_181, iter_2_182 in ipairs(var_2_189.sub_section_list) do
				var_2_187[3] = iter_2_182

				table.insert(var_2_190, table.concat(var_2_187))
			end

			table.insert(var_2_185, var_2_191)
		elseif var_2_189.mode == CaptureGameConst.CaptureGameMode.Multiple then
			for iter_2_183, iter_2_184 in ipairs(var_2_189.sub_section_list) do
				var_2_187[3] = iter_2_184

				table.insert(var_2_190, table.concat(var_2_187))
			end

			table.insert(var_2_186, var_2_191)
		end

		arg_2_0:addGroup(var_2_191, var_2_190)
	end

	arg_2_0:addGroup(RedPointConst.CAPTURE_GAME_UNLOCK_SINGLE_ROOT, var_2_185)
	arg_2_0:addGroup(RedPointConst.CAPTURE_GAME_UNLOCK_MULTI_ROOT, var_2_186)
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

	local var_2_192 = {}

	for iter_2_185, iter_2_186 in ipairs(ActivityTangramGameChapterCfg.all) do
		local var_2_193 = string.format("%s_%s", RedPointConst.ACTIVITY_3_5_TANGRAM_GAME_CHAPTER, iter_2_186)

		table.insert(var_2_192, var_2_193)
		arg_2_0:addGroup(var_2_193, {
			string.format("%s_%s", RedPointConst.ACTIVITY_3_5_TANGRAM_GAME_FULL_CLUE, iter_2_186),
			string.format("%s_%s", RedPointConst.ACTIVITY_3_5_TANGRAM_GAME_STAGE, iter_2_186)
		})
	end

	arg_2_0:addGroup(RedPointConst.ACTIVITY_3_5_TANGRAM_GAME_CHAPTER, var_2_192)

	local var_2_194 = {}

	for iter_2_187, iter_2_188 in ipairs(ActivityWaterPipeStageCfg.all) do
		local var_2_195 = string.format("%s_%s", RedPointConst.ACTIVITY_WATER_PIPE_STAGE, iter_2_188)

		table.insert(var_2_194, var_2_195)
	end

	arg_2_0:addGroup(ActivityTools.GetRedPointKey(WaterPipeData:GetMainActivityID()) .. WaterPipeData:GetMainActivityID(), var_2_194)
	arg_2_0:addGroup(ActivityTools.GetRedPointKey(ActivityConst.ACTIVITY_WATER_PIPE_HOME) .. ActivityConst.ACTIVITY_WATER_PIPE_HOME, var_2_194)

	local var_2_196 = {}
	local var_2_197 = {}
	local var_2_198 = ActivityCfg[ActivityConst.ACTIVITY_RED_ENVELOPE].sub_activity_list

	for iter_2_189, iter_2_190 in ipairs(var_2_198) do
		table.insert(var_2_196, RedPointConst.ACTIVITY_RED_ENVELOPE_NEW_DAY .. "_" .. iter_2_190)
		table.insert(var_2_197, RedPointConst.ACTIVITY_RED_ENVELOPE_CAN_CLAIMED .. "_" .. iter_2_190)
	end

	local var_2_199 = ActivityTools.GetRedPointKey(ActivityConst.ACTIVITY_RED_ENVELOPE) .. ActivityConst.ACTIVITY_RED_ENVELOPE

	arg_2_0:addGroup(RedPointConst.ACTIVITY_RED_ENVELOPE_NEW_DAY .. "_" .. ActivityConst.ACTIVITY_RED_ENVELOPE, var_2_196)
	arg_2_0:addGroup(RedPointConst.ACTIVITY_RED_ENVELOPE_CAN_CLAIMED .. "_" .. ActivityConst.ACTIVITY_RED_ENVELOPE, var_2_197)
	arg_2_0:addGroup(var_2_199, {
		RedPointConst.ACTIVITY_RED_ENVELOPE_NEW_DAY .. "_" .. ActivityConst.ACTIVITY_RED_ENVELOPE,
		RedPointConst.ACTIVITY_RED_ENVELOPE_CAN_CLAIMED .. "_" .. ActivityConst.ACTIVITY_RED_ENVELOPE
	})
	arg_2_0:BindQWorldRedPoint()
end

function var_0_0.BindQWorldRedPoint(arg_3_0)
	local var_3_0 = SandPlayMapCfg.all

	for iter_3_0, iter_3_1 in ipairs(var_3_0) do
		local var_3_1 = SandPlayMapCfg[iter_3_1].activity_id
		local var_3_2 = ActivityCfg[var_3_1].sub_activity_list
		local var_3_3 = {}

		for iter_3_2, iter_3_3 in ipairs(var_3_2) do
			table.insert(var_3_3, ActivityTools.GetRedPointKey(iter_3_3) .. iter_3_3)
			arg_3_0:appendGroup(ActivityTools.GetRedPointKey(var_3_1) .. var_3_1, ActivityTools.GetRedPointKey(iter_3_3) .. iter_3_3, true)
		end
	end

	local var_3_4 = {
		RedPointConst.QWORLD_BOOKLET_LEVEL_REWARD,
		RedPointConst.QUANZHOU_LIMIT_TASK_ALL
	}

	arg_3_0:addGroup(RedPointConst.QWORLD_ACTIVITY_ENTRY, var_3_4)
	arg_3_0:appendGroup(ActivityTools.GetRedPointKey(ActivityConst.ACTIVITY_QUANZHOU_ENTRY) .. ActivityConst.ACTIVITY_QUANZHOU_ENTRY, RedPointConst.QWORLD_ACTIVITY_ENTRY)
end

function var_0_0.InitData(arg_4_0)
	arg_4_0._redPointHelper:InitData()
end

function var_0_0.Dispose(arg_5_0)
	arg_5_0._redPointHelper:Dispose()
end

function var_0_0.setTip(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
	return arg_6_0._redPointHelper:setTip(arg_6_1, arg_6_2, arg_6_3)
end

function var_0_0.getTipValue(arg_7_0, arg_7_1)
	return arg_7_0._redPointHelper:getTipValue(arg_7_1)
end

function var_0_0.getchildKeys(arg_8_0, arg_8_1)
	return arg_8_0._redPointHelper:getchildKeys(arg_8_1)
end

function var_0_0.getTipBoolean(arg_9_0, arg_9_1)
	return arg_9_0._redPointHelper:getTipBoolean(arg_9_1)
end

function var_0_0.addGroup(arg_10_0, arg_10_1, arg_10_2, arg_10_3)
	arg_10_0._redPointHelper:addGroup(arg_10_1, arg_10_2, arg_10_3)
end

function var_0_0.appendGroup(arg_11_0, arg_11_1, arg_11_2, arg_11_3)
	arg_11_0._redPointHelper:appendToGroup(arg_11_1, arg_11_2, arg_11_3)
end

function var_0_0.delGroup(arg_12_0, arg_12_1, arg_12_2)
	arg_12_0._redPointHelper:delGroup(arg_12_1, arg_12_2)
end

function var_0_0.updateKey(arg_13_0, arg_13_1)
	arg_13_0._redPointHelper:updateKey(arg_13_1)
end

function var_0_0.bindUIandKey(arg_14_0, arg_14_1, arg_14_2, arg_14_3)
	arg_14_0._redPointHelper:bindUIandKey(arg_14_1, arg_14_2, arg_14_3)
end

function var_0_0.unbindUIandKey(arg_15_0, arg_15_1, arg_15_2)
	arg_15_0._redPointHelper:unbindUIandKey(arg_15_1, arg_15_2)
end

function var_0_0.setRedPoint(arg_16_0, arg_16_1, arg_16_2, arg_16_3)
	if arg_16_2 then
		arg_16_0._redPointHelper:ChangeRedStyle(arg_16_1, arg_16_3 or RedPointStyle.NORMAL, nil, nil, arg_16_2)
	else
		arg_16_0._redPointHelper:ChangeRedStyle(arg_16_1, RedPointStyle.None, nil, nil, arg_16_2)
	end
end

function var_0_0.ForceHideRedPoint(arg_17_0, arg_17_1)
	local var_17_0 = arg_17_1:Find("notice_img")

	if var_17_0 then
		SetActive(var_17_0.gameObject, false)
	end
end

function var_0_0.SetRedPointIndependent(arg_18_0, arg_18_1, arg_18_2, arg_18_3, arg_18_4)
	if arg_18_2 then
		arg_18_0._redPointHelper:ChangeRedStyle({
			display = arg_18_1
		}, arg_18_4 or RedPointStyle.NORMAL, arg_18_3, nil, arg_18_2)
	else
		arg_18_0._redPointHelper:ChangeRedStyle({
			display = arg_18_1
		}, RedPointStyle.None, arg_18_3, nil, arg_18_2)
	end
end

function var_0_0.ShowRedGraph(arg_19_0, arg_19_1)
	return manager.redPoint._redPointHelper:GetRedGraphWithKey(arg_19_0)
end

function var_0_0.PrintAllRedNode()
	return {
		data = "HHH"
	}
end

function var_0_0.PrintAllKey()
	local var_21_0 = manager.redPoint._redPointHelper:GetAllKey()

	for iter_21_0, iter_21_1 in ipairs(var_21_0) do
		var_21_0 = var_21_0 .. ","
	end

	return {
		data = table.concat(var_21_0)
	}
end

function var_0_0.PrintAllNilKey()
	local var_22_0 = manager.redPoint._redPointHelper:GetAllKey()

	for iter_22_0, iter_22_1 in ipairs(var_22_0) do
		if string.find(iter_22_1, "nil") then
			Debug.LogError(iter_22_1)
		end
	end
end

function var_0_0.AddRogueTeamGroup(arg_23_0)
	local var_23_0 = {}

	for iter_23_0, iter_23_1 in ipairs(RogueTeamCfg.all) do
		local var_23_1 = ChallengeRogueTeamTools.GetCollectActivityIDByType(iter_23_1, ChallengeRogueTeamConst.COLLECTION_TASK_TYPE.RELIC)
		local var_23_2 = ChallengeRogueTeamTools.GetCollectActivityIDByType(iter_23_1, ChallengeRogueTeamConst.COLLECTION_TASK_TYPE.EVENT)
		local var_23_3 = ChallengeRogueTeamTools.GetTaskActivityID(iter_23_1)
		local var_23_4 = string.format("%s_%s", RedPointConst.CHALLENGE_ROGUE_TEAM, iter_23_1)
		local var_23_5 = string.format("%s_%s", RedPointConst.ACTIVITY_TASK, var_23_3)
		local var_23_6 = string.format("%s_%s", RedPointConst.CHALLENGE_ROGUE_TEAM_ILLUSTRATED, iter_23_1)
		local var_23_7 = string.format("%s_%s", RedPointConst.ACTIVITY_TASK, var_23_1)
		local var_23_8 = string.format("%s_%s", RedPointConst.ACTIVITY_TASK, var_23_2)
		local var_23_9 = string.format("%s_%s", RedPointConst.CHALLENGE_ROGUE_TEAM_ILLUSTRATED_CAMP, iter_23_1)
		local var_23_10 = string.format("%s_%s", RedPointConst.CHALLENGE_ROGUE_TEAM_ILLUSTRATED_END, iter_23_1)
		local var_23_11, var_23_12 = ChallengeRogueTeamData:GetAllCampTreasureIDListByTemp(RogueTeamCfg[iter_23_1].item_temp)
		local var_23_13 = {}

		for iter_23_2, iter_23_3 in ipairs(var_23_12) do
			local var_23_14 = ChallengeRogueTeamTools.GetTreasureCollectionActivityIDByCamp(iter_23_1, iter_23_3)
			local var_23_15 = string.format("%s_%s", RedPointConst.ACTIVITY_TASK, var_23_14)
			local var_23_16 = {}

			for iter_23_4, iter_23_5 in ipairs(AssignmentCfg.get_id_list_by_activity_id[var_23_14]) do
				table.insert(var_23_16, string.format("%s_%s", RedPointConst.ACTIVITY_TASK, iter_23_5))
			end

			arg_23_0:addGroup(var_23_15, var_23_16)
			table.insert(var_23_13, var_23_15)
		end

		arg_23_0:addGroup(var_23_9, var_23_13)

		local var_23_17 = ChallengeRogueTeamData:GetAllCollectionTaskByType(iter_23_1, ChallengeRogueTeamConst.COLLECTION_TASK_TYPE.END)
		local var_23_18 = {}

		for iter_23_6, iter_23_7 in ipairs(var_23_17) do
			local var_23_19 = string.format("%s_%s", RedPointConst.ACTIVITY_TASK, iter_23_7)

			table.insert(var_23_18, var_23_19)
		end

		arg_23_0:addGroup(var_23_10, var_23_18)

		local var_23_20 = AssignmentCfg.get_id_list_by_activity_id[var_23_1]
		local var_23_21 = {}

		for iter_23_8, iter_23_9 in ipairs(var_23_20) do
			local var_23_22 = string.format("%s_%s", RedPointConst.ACTIVITY_TASK, iter_23_9)

			table.insert(var_23_21, var_23_22)
		end

		arg_23_0:addGroup(var_23_7, var_23_21)

		local var_23_23 = AssignmentCfg.get_id_list_by_activity_id[var_23_2]
		local var_23_24 = {}

		for iter_23_10, iter_23_11 in ipairs(var_23_23) do
			local var_23_25 = string.format("%s_%s", RedPointConst.ACTIVITY_TASK, iter_23_11)

			table.insert(var_23_24, var_23_25)
		end

		arg_23_0:addGroup(var_23_8, var_23_24)

		local var_23_26 = AssignmentCfg.get_id_list_by_activity_id[var_23_3]
		local var_23_27 = {}

		for iter_23_12, iter_23_13 in ipairs(var_23_26) do
			local var_23_28 = string.format("%s_%s", RedPointConst.ACTIVITY_TASK, iter_23_13)

			table.insert(var_23_27, var_23_28)
		end

		arg_23_0:addGroup(var_23_5, var_23_27)
		arg_23_0:addGroup(var_23_6, {
			var_23_7,
			var_23_8,
			var_23_9,
			var_23_10
		})
		arg_23_0:addGroup(var_23_4, {
			string.format("%s_%s", RedPointConst.ACTIVITY_POINT_REWARD, ChallengeRogueTeamTools.GetPointActivityID(iter_23_1)),
			var_23_5,
			var_23_6
		})
		table.insert(var_23_0, var_23_4)
	end

	arg_23_0:addGroup(RedPointConst.CHALLENGE_ROGUE_TEAM, var_23_0)
end

return var_0_0
