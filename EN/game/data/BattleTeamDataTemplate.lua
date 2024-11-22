BattleTeamPlayerTemplate = class("BattleTeamHeroTemplate")

function BattleTeamPlayerTemplate.Ctor(arg_1_0, arg_1_1)
	arg_1_0.playerID = arg_1_1.player_id

	local var_1_0 = arg_1_1.player_battle_info

	arg_1_0.nick = var_1_0.nick
	arg_1_0.level = var_1_0.level
	arg_1_0.channel = var_1_0.channel
	arg_1_0.server = var_1_0.server
	arg_1_0.heroList = {}

	for iter_1_0, iter_1_1 in ipairs(var_1_0.hero_list) do
		local var_1_1 = iter_1_1.hero_base_info
		local var_1_2 = var_1_1.id
		local var_1_3 = var_1_1.using_skin
		local var_1_4 = 0

		if iter_1_1.hero_type == 2 then
			var_1_2 = HeroStandardSystemCfg[var_1_2].hero_id
			var_1_4 = var_1_1.id
		end

		local var_1_5 = {
			id = var_1_2,
			skin = var_1_3,
			trialID = var_1_4,
			star = var_1_1.star,
			exp = var_1_1.exp,
			level = HeroTools.CheckExp(1, var_1_1.exp),
			equip_list = {},
			using_astrolabe = {},
			skill = {},
			skillAttrList = {},
			break_level = var_1_1.break_level,
			weapon_info = {
				exp = var_1_1.weapon.exp,
				breakthrough = var_1_1.weapon.breakthrough
			},
			transition = {},
			weapon_module_level = var_1_1.weapon_module_level,
			dormLevel = iter_1_1.dorm_level
		}

		if var_1_1.servant then
			var_1_5.servantInfo = {
				id = var_1_1.servant.id,
				stage = var_1_1.servant.stage
			}
		else
			var_1_5.servantInfo = {}
		end

		if iter_1_1.equip_list then
			for iter_1_2, iter_1_3 in ipairs(iter_1_1.equip_list) do
				local var_1_6 = {}
				local var_1_7 = {}

				if iter_1_3.enchant_slot_list then
					for iter_1_4, iter_1_5 in ipairs(iter_1_3.enchant_slot_list) do
						local var_1_8 = iter_1_5.id
						local var_1_9 = iter_1_5.effect_list
						local var_1_10 = {}

						for iter_1_6, iter_1_7 in ipairs(var_1_9) do
							table.insert(var_1_10, {
								id = iter_1_7.id,
								num = iter_1_7.level
							})
						end

						if #var_1_10 > 0 then
							var_1_6[iter_1_4] = var_1_10
						end

						table.insert(var_1_7, {
							id = var_1_8,
							effect_list = cleanProtoTable(iter_1_5.effect_list, {
								"id",
								"level"
							}),
							preview_list = {}
						})
					end
				end

				var_1_5.equip_list[iter_1_2] = {
					equip_id = iter_1_3.equip_id,
					prefab_id = iter_1_3.prefab_id,
					exp = iter_1_3.exp,
					now_break_level = iter_1_3.now_break_level or 0,
					enchant = var_1_6,
					race = iter_1_3.race,
					enchant_slot_list = var_1_7
				}
			end
		end

		if var_1_1.using_astrolabe then
			for iter_1_8, iter_1_9 in ipairs(var_1_1.using_astrolabe) do
				var_1_5.using_astrolabe[iter_1_8] = iter_1_9
			end
		end

		if var_1_1.skill then
			for iter_1_10, iter_1_11 in ipairs(var_1_1.skill) do
				var_1_5.skill[iter_1_10] = {
					skill_id = iter_1_11.skill_id,
					skill_level = iter_1_11.skill_level
				}
			end
		end

		if var_1_1.skill_intensify_attribute_list then
			for iter_1_12, iter_1_13 in ipairs(var_1_1.skill_intensify_attribute_list) do
				var_1_5.skillAttrList[iter_1_12] = {
					index = iter_1_13.index,
					level = iter_1_13.level
				}
			end
		end

		if var_1_1.exclusive_skill_list then
			local var_1_11 = {}
			local var_1_12 = {}

			for iter_1_14, iter_1_15 in ipairs(var_1_1.exclusive_skill_list) do
				local var_1_13 = iter_1_15.slot_id

				var_1_11[var_1_13] = {}
				var_1_12[var_1_13] = {}

				for iter_1_16, iter_1_17 in ipairs(iter_1_15.skill_list) do
					table.insert(var_1_11[var_1_13], iter_1_17.skill_id)
					table.insert(var_1_12[var_1_13], iter_1_17.skill_level)
				end
			end

			var_1_5.transition = HeroTools.InitTransitionByCfg(var_1_11, var_1_12)
		end

		local var_1_14 = HeroTrustRelationNet.New(iter_1_1.hero_id)

		var_1_14:InitData(iter_1_1.trust.relation)

		var_1_5.relation = var_1_14
		var_1_5.trust = {
			level = iter_1_1.trust.level,
			exp = iter_1_1.trust.exp,
			mood = iter_1_1.trust.mood
		}, table.insert(arg_1_0.heroList, var_1_5)
	end

	local var_1_15 = arg_1_1.player_room_info

	arg_1_0:UpdateRoomData(var_1_15)
end

function BattleTeamPlayerTemplate.UpdateRoomData(arg_2_0, arg_2_1)
	arg_2_0.is_ready = arg_2_1.is_ready
	arg_2_0.is_master = arg_2_1.is_master
	arg_2_0.be_liked_uids = {}

	for iter_2_0, iter_2_1 in ipairs(arg_2_1.be_liked_uids) do
		table.insert(arg_2_0.be_liked_uids, iter_2_1)
	end
end

function BattleTeamPlayerTemplate.ParseHeroViewData(arg_3_0, arg_3_1)
	if arg_3_1 == nil then
		arg_3_1 = 1
	end

	local var_3_0 = arg_3_0.heroList[arg_3_1]
	local var_3_1 = {
		id = var_3_0.id,
		exp = var_3_0.exp,
		level = var_3_0.level,
		star = var_3_0.star
	}

	var_3_1.piece = 0
	var_3_1.unlock = 1
	var_3_1.using_skin = var_3_0.skin
	var_3_1.break_level = var_3_0.break_level
	var_3_1.transition = {}

	for iter_3_0, iter_3_1 in pairs(var_3_0.transition) do
		table.insert(var_3_1.transition, {
			talent_points = 0,
			slot_id = iter_3_0,
			skill_list = iter_3_1
		})
	end

	var_3_1.dormLevel = var_3_0.dormLevel
	var_3_1.unlocked_astrolabe = var_3_0.unlock_astrolabe
	var_3_1.using_astrolabe = var_3_0.using_astrolabe
	var_3_1.weapon_info = {
		level = WeaponTools.ExpToLv(var_3_0.weapon_info.exp),
		exp = var_3_0.weapon_info.exp,
		breakthrough = var_3_0.weapon_info.breakthrough
	}

	if var_3_0.servantInfo.id == nil or var_3_0.servantInfo.id == 0 then
		var_3_1.servantInfo = nil
	else
		var_3_1.servantInfo = {
			uid = 1,
			locked = true,
			id = var_3_0.servantInfo.id,
			stage = var_3_0.servantInfo.stage
		}
	end

	var_3_1.servant_uid = 1
	var_3_1.moduleLevel = var_3_0.weapon_module_level
	var_3_1.moduleAssignment = 0
	var_3_1.equip = {
		{
			pos = 1,
			equip_id = 0
		},
		{
			pos = 2,
			equip_id = 0
		},
		{
			pos = 3,
			equip_id = 0
		},
		{
			pos = 4,
			equip_id = 0
		},
		{
			pos = 5,
			equip_id = 0
		},
		{
			pos = 6,
			equip_id = 0
		}
	}
	var_3_1.equip_struct_list = {}

	for iter_3_2, iter_3_3 in ipairs(var_3_0.equip_list) do
		local var_3_2 = iter_3_3.equip_id
		local var_3_3 = iter_3_3.prefab_id
		local var_3_4 = EquipCfg[var_3_3].pos

		var_3_1.equip[var_3_4].equip_id = var_3_3

		local var_3_5 = {
			race_preview = 0,
			is_lock = 0,
			equip_id = var_3_2,
			prefab_id = var_3_3,
			exp = iter_3_3.exp,
			hero_id = var_3_0.id,
			now_break_level = iter_3_3.now_break_level,
			enchant_slot_list = iter_3_3.enchant_slot_list,
			race = iter_3_3.race
		}
		local var_3_6 = EquipStruct.New(var_3_5.equip_id, var_3_5.prefab_id)

		var_3_6:ParseServerData(var_3_5)

		var_3_1.equip_struct_list[var_3_4] = var_3_6
	end

	var_3_1.skillAttrList = var_3_0.skillAttrList
	var_3_1.skill = {}

	for iter_3_4, iter_3_5 in ipairs(var_3_0.skill) do
		local var_3_7 = HeroTools.GetHeroSkillAddLevel(var_3_1, iter_3_5.skill_id)
		local var_3_8 = iter_3_5.skill_level - var_3_7
		local var_3_9 = math.max(1, var_3_8)

		table.insert(var_3_1.skill, {
			skill_id = iter_3_5.skill_id,
			skill_level = var_3_9
		})
	end

	return var_3_1, var_3_1.servantInfo
end
