local var_0_0 = {}
local var_0_1 = {}

function var_0_0.GotoCooperation()
	local var_1_0 = CooperationData:GetRoomData()

	if not var_1_0 then
		error("GotoCooperation with nil room")

		return
	end

	local var_1_1 = var_1_0.type
	local var_1_2 = var_1_0.dest

	if BattleConst.STAGE_TYPE_NEW.COOPERATION_DEMO == var_1_1 then
		OpenPageUntilLoaded("/cooperationBlank/cooperation")
	elseif BattleConst.STAGE_TYPE_NEW.STRONGHOLD == var_1_1 then
		OpenPageUntilLoaded("/cooperationBlank/strongholdCooperation")
	elseif BattleConst.STAGE_TYPE_NEW.ACTIVITY_WATER_COOPERATION == var_1_1 then
		OpenPageUntilLoaded("/cooperationBlank/xH3rdWaterCooperation")
	else
		OpenPageUntilLoaded("/cooperationBlank/cooperation")
	end
end

function var_0_0.GotoCooperationEntry(arg_2_0, arg_2_1, arg_2_2)
	if BattleConst.STAGE_TYPE_NEW.COOPERATION_DEMO == arg_2_0 then
		OpenPageUntilLoaded("/cooperationBlank/demoCooperationEntry")
	elseif BattleConst.STAGE_TYPE_NEW.STRONGHOLD == arg_2_0 then
		OpenPageUntilLoaded("/cooperationBlank/strongholdMain")
	elseif BattleConst.STAGE_TYPE_NEW.ACTIVITY_WATER_COOPERATION == arg_2_0 then
		local var_2_0 = ActivityCfg.get_id_list_by_sub_activity_list[arg_2_2][1]

		OpenPageUntilLoaded("/cooperationBlank/xH3rdWaterSelectAssistant", {
			activityId = var_2_0
		})
	end
end

function var_0_0.GetCooperationRoomName(arg_3_0, arg_3_1, arg_3_2)
	if BattleConst.STAGE_TYPE_NEW.ACTIVITY_WATER_COOPERATION == arg_3_0 then
		return BattleActivityWaterCooperationCfg[arg_3_1].name
	elseif BattleConst.STAGE_TYPE_NEW.STRONGHOLD == arg_3_0 then
		return ActivityStrongholdCfg[arg_3_1] and ActivityStrongholdCfg[arg_3_1].room_name or ""
	else
		return ""
	end
end

function var_0_0.GetCooperationTeamHeroList(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0 = {}
	local var_4_1 = false

	if arg_4_0 == BattleConst.STAGE_TYPE_NEW.COOPERATION_DEMO then
		local var_4_2 = ActivityCooperationDemoCfg[arg_4_1]

		if var_4_2 then
			var_4_1 = true
		end

		for iter_4_0, iter_4_1 in ipairs(var_4_2.hero_standard_system_id_list) do
			local var_4_3 = HeroStandardSystemCfg[iter_4_1]

			table.insert(var_4_0, {
				id = var_4_3.hero_id,
				trialID = iter_4_1
			})
		end
	elseif arg_4_0 == BattleConst.STAGE_TYPE_NEW.STRONGHOLD then
		local var_4_4 = ActivityStrongholdCfg[arg_4_1]
		local var_4_5 = var_4_4.limit_heros
		local var_4_6 = HeroTools.Sort(HeroData:GetHeroList())

		for iter_4_2, iter_4_3 in pairs(var_4_6) do
			if table.indexof(var_4_5, iter_4_3) then
				table.insert(var_4_0, {
					trialID = 0,
					id = iter_4_3
				})
			end
		end

		for iter_4_4, iter_4_5 in ipairs(var_4_4.standard_heros) do
			local var_4_7 = HeroStandardSystemCfg[iter_4_5]

			table.insert(var_4_0, {
				id = var_4_7.hero_id,
				trialID = iter_4_5
			})
		end
	elseif arg_4_0 == BattleConst.STAGE_TYPE_NEW.ACTIVITY_WATER_COOPERATION then
		local var_4_8 = ActivityCfg.get_id_list_by_sub_activity_list[arg_4_2][1]
		local var_4_9, var_4_10 = ActivityWaterData:GetCanUseTrialList(var_4_8)

		for iter_4_6, iter_4_7 in ipairs(var_4_10) do
			local var_4_11 = HeroStandardSystemCfg[iter_4_7]

			table.insert(var_4_0, {
				id = var_4_11.hero_id,
				trialID = iter_4_7
			})
		end
	end

	if var_4_1 then
		local var_4_12 = HeroTools.Sort(HeroData:GetHeroList())

		for iter_4_8, iter_4_9 in pairs(var_4_12) do
			table.insert(var_4_0, {
				trialID = 0,
				id = iter_4_9
			})
		end
	end

	return var_4_0
end

function var_0_0.RegisterInvitationValidation(arg_5_0, arg_5_1)
	var_0_1[arg_5_0] = arg_5_1
end

function var_0_0.IsInvitationValid(arg_6_0, arg_6_1, arg_6_2)
	if not var_0_1[arg_6_0] then
		return true
	end

	if var_0_1[arg_6_0](arg_6_1, arg_6_2) then
		return true
	end

	return false
end

function var_0_0.GetShowInviteRoot()
	local var_7_0 = GameSetting.cooperation_invite_root_show_activity_template.value

	for iter_7_0, iter_7_1 in ipairs(var_7_0) do
		local var_7_1 = ActivityCfg.get_id_list_by_activity_template[iter_7_1] or {}

		for iter_7_2, iter_7_3 in ipairs(var_7_1) do
			if ActivityData:GetActivityIsOpen(iter_7_3) then
				return true
			end
		end
	end

	return false
end

local var_0_2

function var_0_0.ShowHeroView(arg_8_0)
	local var_8_0 = CooperationData:GetRoomData()
	local var_8_1 = var_8_0 and var_8_0:GetRoomPlayerData(arg_8_0)

	if var_8_1 == nil then
		return
	end

	local var_8_2 = var_8_1.heroList
	local var_8_3 = var_8_2[1].id
	local var_8_4 = var_8_2[1].trialID

	if var_8_4 and var_8_4 ~= 0 then
		gameContext:Go("/newHero", {
			isEnter = true,
			isTemp = true,
			hid = var_8_3,
			tempHeroList = {
				var_8_4
			}
		})
	else
		var_0_2 = clone(var_8_1)

		JumpTools.OpenPageByJump("/newHero", {
			isEnter = true,
			notShowBar = true,
			isCooperation = true
		}, ViewConst.SYSTEM_ID.PLAYER_INFO)
	end
end

function var_0_0.GetCooperationHeroPower(arg_9_0)
	local var_9_0 = CooperationData:GetRoomData()
	local var_9_1 = var_9_0 and var_9_0:GetRoomPlayerData(arg_9_0)

	if var_9_1 == nil then
		return 0
	end

	local var_9_2 = var_9_1.heroList
	local var_9_3 = var_9_2[1].id

	var_0_2 = var_9_1

	if var_9_2[1].trialID and var_9_2[1].trialID ~= 0 then
		return getHeroPower(var_9_2[1].trialID, true)
	else
		return var_0_0.GetBattlePower(var_9_3)
	end
end

function var_0_0.GetShowPlayerHeroIdList()
	if var_0_2 then
		local var_10_0 = var_0_2.heroList
		local var_10_1 = {}

		for iter_10_0, iter_10_1 in ipairs(var_10_0) do
			table.insert(var_10_1, iter_10_1.id)
		end

		return var_10_1
	end

	return {}
end

function var_0_0.GetShowPlayerHero(arg_11_0)
	local var_11_0 = var_0_2.heroList

	for iter_11_0, iter_11_1 in ipairs(var_11_0) do
		if iter_11_1.id == arg_11_0 then
			local var_11_1, var_11_2 = var_0_2:ParseHeroViewData(iter_11_0)

			return var_11_1, var_11_2
		end
	end

	return nil, nil
end

function var_0_0.GetBattlePower(arg_12_0)
	local var_12_0, var_12_1 = var_0_0.GetShowPlayerHero(arg_12_0)
	local var_12_2 = {}

	for iter_12_0 = 1, 6 do
		if var_12_0.equip_struct_list[iter_12_0] then
			table.insert(var_12_2, var_12_0.equip_struct_list[iter_12_0])
		end
	end

	return calcBattlePower(var_12_0, var_12_1, var_12_2, var_12_0.trialID, {
		isCooperation = true
	})
end

function var_0_0.GetEquipInfo(arg_13_0, arg_13_1)
	return var_0_0.GetShowPlayerHero(arg_13_0).equip_struct_list[arg_13_1]
end

function var_0_0.GetHeroSkillInfo(arg_14_0)
	local var_14_0 = {}
	local var_14_1 = var_0_0.GetShowPlayerHero(arg_14_0)

	for iter_14_0, iter_14_1 in ipairs(var_14_1.skill) do
		var_14_0[iter_14_1.skill_id] = iter_14_1.skill_level
	end

	local var_14_2 = {}

	for iter_14_2, iter_14_3 in ipairs(HeroCfg[arg_14_0].skills) do
		local var_14_3 = HeroTools.GetHeroSkillAddLevel(var_14_1, iter_14_3)

		if SkillTools.GetIsDodgeSkill(iter_14_3) then
			var_14_3 = 0
		end

		table.insert(var_14_2, {
			isCanUp = false,
			id = iter_14_3,
			heroId = arg_14_0,
			lv = var_14_0[iter_14_3],
			addSkillLv = var_14_3
		})
	end

	return var_14_2
end

function var_0_0.GetHeroServantInfo(arg_15_0)
	local var_15_0 = {}
	local var_15_1 = var_0_0.GetShowPlayerHero(arg_15_0)

	if var_15_1.servant_uid ~= 0 then
		return {
			uid = 0,
			locked = true,
			id = var_15_1.servant_uid,
			stage = var_15_1.servant_stage
		}
	else
		return nil
	end
end

return var_0_0
