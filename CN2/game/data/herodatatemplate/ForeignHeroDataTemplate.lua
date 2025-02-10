local var_0_0 = class("ForeignHeroDataTemplate", BaseHeroDataTemplate)

function var_0_0.Ctor(arg_1_0, arg_1_1)
	var_0_0.super.Ctor(arg_1_0, arg_1_1)

	arg_1_0.relation = HeroTrustRelationNet.New(arg_1_1)
	arg_1_0.trust = {
		exp = 0,
		mood = 1,
		level = 0
	}
	arg_1_0.clear_mission_list = {}
	arg_1_0.clear_times = 0
	arg_1_0.piece = 0
	arg_1_0.unlocked_skin = {}
	arg_1_0.equipDataList = {}
	arg_1_0.dormLevel = 0
	arg_1_0.equip_list = {}
end

function var_0_0.Init(arg_2_0, arg_2_1)
	local var_2_0 = arg_2_1.hero_base_info

	arg_2_0.id = var_2_0.id
	arg_2_0.exp = var_2_0.exp
	arg_2_0.level = var_2_0.level
	arg_2_0.star = var_2_0.star
	arg_2_0.skill = cleanProtoTable(var_2_0.skill, {
		"skill_id",
		"skill_level"
	})
	arg_2_0.skillAttrList = cleanProtoTable(var_2_0.skill_intensify_attribute_list, {
		"index",
		"level"
	})
	arg_2_0.unlocked_astrolabe = cleanProtoTable(var_2_0.unlock_astrolabe)
	arg_2_0.using_astrolabe = cleanProtoTable(var_2_0.using_astrolabe)
	arg_2_0.break_level = var_2_0.break_level
	arg_2_0.weapon_info = {
		level = WeaponTools.ExpToLv(var_2_0.weapon.exp),
		exp = var_2_0.weapon.exp,
		breakthrough = var_2_0.weapon.breakthrough
	}
	arg_2_0.using_skin = var_2_0.using_skin
	arg_2_0.moduleLevel = var_2_0.weapon_module_level
	arg_2_0.servantInfo = {
		uid = 0,
		locked = true,
		id = var_2_0.servant.id,
		stage = var_2_0.servant.stage
	}
	arg_2_0.transition = arg_2_0:InitTransition(var_2_0.exclusive_skill_list or {})
	arg_2_0.unlock = 1
	arg_2_0.using_hero_chip = cleanProtoTable(arg_2_1.using_hero_chip)
	arg_2_0.equip = arg_2_0:InitHeroEquip(var_2_0.id, arg_2_1.equip_list)
	arg_2_0.servant_uid = 0
	arg_2_0.moduleAssignment = {}
	arg_2_0.unlocked_skin = {}
	arg_2_0.dormLevel = arg_2_1.dorm_level
	arg_2_0.trust = {
		level = arg_2_1.trust.level,
		exp = arg_2_1.trust.exp,
		mood = arg_2_1.trust.mood
	}

	local var_2_1 = HeroTrustRelationNet.New(var_2_0.id)

	var_2_1:InitData(arg_2_1.trust.relation)

	arg_2_0.relation = var_2_1
end

function var_0_0.ModifyHero(arg_3_0, arg_3_1)
	arg_3_0:Init(arg_3_1)
end

function var_0_0.GetServantInfo(arg_4_0)
	return arg_4_0.servantInfo
end

function var_0_0.GetWeaponInfo(arg_5_0)
	return arg_5_0.weapon_info
end

function var_0_0.GetEquipInfoList(arg_6_0)
	return arg_6_0.equip
end

function var_0_0.GetSkillInfoList(arg_7_0)
	return arg_7_0.skill
end

function var_0_0.GetSkillAttrList(arg_8_0)
	return arg_8_0.skillAttrList
end

function var_0_0.GetTransitionInfoList(arg_9_0)
	return arg_9_0.transition
end

function var_0_0.InitTransition(arg_10_0, arg_10_1)
	local var_10_0 = {}

	for iter_10_0, iter_10_1 in ipairs(arg_10_1) do
		var_10_0[iter_10_0] = {
			slot_id = iter_10_1.slot_id,
			skill_list = cleanProtoTable(iter_10_1.skill_list, {
				"skill_id",
				"skill_level"
			}),
			talent_points = iter_10_1.talent_points
		}
	end

	return var_10_0
end

function var_0_0.GetType(arg_11_0)
	return HeroConst.HERO_DATA_TYPE.FOREIGN
end

function var_0_0.InitHeroEquip(arg_12_0, arg_12_1, arg_12_2)
	local var_12_0 = {
		{
			pos = 1,
			prefab_id = 0
		},
		{
			pos = 2,
			prefab_id = 0
		},
		{
			pos = 3,
			prefab_id = 0
		},
		{
			pos = 4,
			prefab_id = 0
		},
		{
			pos = 5,
			prefab_id = 0
		},
		{
			pos = 6,
			prefab_id = 0
		}
	}

	for iter_12_0, iter_12_1 in ipairs(arg_12_2) do
		local var_12_1 = iter_12_1.equip_id

		var_12_0[EquipCfg[var_12_1].pos].equip_id = var_12_1

		local var_12_2 = {
			race_preview = 0,
			is_lock = true,
			equip_id = iter_12_0,
			prefab_id = var_12_1,
			exp = iter_12_1.exp,
			hero_id = arg_12_1,
			now_break_level = iter_12_1.now_break_level,
			enchant_slot_list = arg_12_0:InitEnchantInfo(iter_12_1.enchant_slot_list),
			race = iter_12_1.race
		}
		local var_12_3 = EquipStruct.New(var_12_2.equip_id, var_12_2.prefab_id)

		var_12_3:ParseServerData(var_12_2)

		arg_12_0.equip_list[iter_12_0] = var_12_3
	end

	return var_12_0
end

function var_0_0.InitEnchantInfo(arg_13_0, arg_13_1)
	local var_13_0 = {}

	for iter_13_0, iter_13_1 in ipairs(arg_13_1) do
		var_13_0[iter_13_1.id] = {
			id = iter_13_1.id,
			effect_list = cleanProtoTable(iter_13_1.effect_list, {
				"id",
				"level"
			}),
			preview_list = {}
		}
	end

	return var_13_0
end

return var_0_0
