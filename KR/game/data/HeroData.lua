local var_0_0 = singletonClass("HeroData", BaseHeroViewData)
local var_0_1 = {}
local var_0_2 = {}
local var_0_3 = {}
local var_0_4 = false
local var_0_5 = true
local var_0_6 = 0
local var_0_7 = {}
local var_0_8 = {}
local var_0_9 = {}
local var_0_10 = {}
local var_0_11 = {}

function var_0_0.InitHero(arg_1_0, arg_1_1, arg_1_2)
	var_0_1 = {}
	var_0_2 = {}
	var_0_3 = {}

	arg_1_0:ResetSortValue()

	var_0_10 = {}
	var_0_11 = {}

	for iter_1_0, iter_1_1 in ipairs(arg_1_2) do
		var_0_11[iter_1_1.id] = iter_1_1.num
	end

	for iter_1_2, iter_1_3 in ipairs(arg_1_1) do
		local var_1_0 = iter_1_3.hero_base_info
		local var_1_1 = DefalutHeroDataTemplate.New(var_1_0.id)

		var_1_1:Init(iter_1_3)

		var_1_1.piece = var_0_11[var_1_0.id or 0]
		var_0_10[var_1_0.id] = var_1_1
	end

	for iter_1_4, iter_1_5 in ipairs(HeroCfg.get_id_list_by_private[0]) do
		if var_0_10[iter_1_5] then
			var_0_1[iter_1_5] = var_0_10[iter_1_5]
		else
			var_0_1[iter_1_5] = DefalutHeroDataTemplate.New(iter_1_5)
		end

		var_0_1[iter_1_5].piece = var_0_11[iter_1_5] or 0

		for iter_1_6, iter_1_7 in ipairs(var_0_1[iter_1_5]:GetEquipInfoList()) do
			if iter_1_7.equip_id ~= 0 then
				var_0_2[iter_1_7.equip_id] = iter_1_5
			end
		end
	end

	manager.notify:Invoke(HERO_DATA_INIT)
	HeroTools.DispatchAllHeroNewRed("unlockHero", RedPointConst.HERO_ID)
	HeroTools.DispatchAllHeroNewRed("unlockRelation", RedPointConst.HERO_REALTION .. "_")
	HeroTools.DispatchAllHeroNewRed("unlockSkin", RedPointConst.HERO_SKIN_ID)
end

function var_0_0.ModifyHero(arg_2_0, arg_2_1)
	var_0_1[arg_2_1.hero_base_info.id]:ModifyHero(arg_2_1)

	var_0_1[arg_2_1.hero_base_info.id].piece = var_0_11[arg_2_1.hero_base_info.id] or 0

	manager.notify:Invoke(HERO_DATA_MODIFY, arg_2_1.hero_base_info.id)
end

function var_0_0.ModifyHeroPieceByList(arg_3_0, arg_3_1)
	for iter_3_0, iter_3_1 in ipairs(arg_3_1) do
		var_0_1[iter_3_1.id].piece = iter_3_1.num
		var_0_11[iter_3_1.id] = iter_3_1.num
	end

	manager.notify:Invoke(HERO_DATA_INIT)
end

function var_0_0.HeroPieceModify(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0 = var_0_1[arg_4_1]

	var_0_11[arg_4_1] = arg_4_2
	var_4_0.piece = arg_4_2

	manager.notify:Invoke(HERO_PIECE_MODIFY, arg_4_1)
end

function var_0_0.AddHeroExpSuccess(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	local var_5_0 = arg_5_0:GetHeroData(arg_5_1)

	var_5_0.level = arg_5_2
	var_5_0.exp = arg_5_3

	manager.notify:Invoke(HERO_DATA_MODIFY, arg_5_1)
end

function var_0_0.BreakSuccess(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0:GetHeroData(arg_6_1).break_level = arg_6_2

	manager.notify:Invoke(HERO_DATA_MODIFY, arg_6_1)
end

function var_0_0.UnlockHeroSuccess(arg_7_0, arg_7_1)
	arg_7_0:GetHeroData(arg_7_1).unlock = 1

	HeroTools.SetHeroNewTagRed(arg_7_1, "unlockHero", RedPointConst.HERO_ID .. arg_7_1, true)
	DormRedPointTools:SetIlluNewTagRed(arg_7_1, "heroNew", RedPointConst.DORM_ILLU_HERO, true)
	manager.notify:Invoke(HERO_DATA_MODIFY, arg_7_1)
	manager.notify:Invoke(HERO_UNLOCK_SUCCESS, arg_7_1)
end

function var_0_0.HeroClearTimesModify(arg_8_0, arg_8_1, arg_8_2)
	local var_8_0 = arg_8_0:GetHeroData(arg_8_1)

	if var_8_0 == nil then
		return
	end

	var_8_0.clear_times = (var_8_0.clear_times or 0) + arg_8_2
end

function var_0_0.EquipSwap(arg_9_0, arg_9_1, arg_9_2, arg_9_3)
	if arg_9_1 ~= 0 then
		local var_9_0 = var_0_2[arg_9_2]
		local var_9_1 = var_0_1[arg_9_1]:GetEquipInfoList()[arg_9_3].equip_id

		if var_9_0 and var_9_0 ~= 0 then
			var_0_1[var_9_0]:GetEquipInfoList()[arg_9_3].equip_id = var_9_1

			if var_9_1 and var_9_1 ~= 0 then
				var_0_2[var_9_1] = var_9_0
			end
		else
			var_0_2[var_9_1] = nil
		end

		var_0_1[arg_9_1]:GetEquipInfoList()[arg_9_3].equip_id = arg_9_2

		if arg_9_2 ~= 0 then
			var_0_2[arg_9_2] = arg_9_1
		end

		manager.notify:Invoke(HERO_DATA_MODIFY, arg_9_1)
	end
end

function var_0_0.EquipUnloadAll(arg_10_0, arg_10_1)
	local var_10_0 = var_0_1[arg_10_1]

	for iter_10_0, iter_10_1 in ipairs(var_10_0:GetEquipInfoList()) do
		if iter_10_1.equip_id ~= 0 then
			var_0_2[iter_10_1.equip_id] = nil
			iter_10_1.equip_id = 0
		end
	end

	manager.notify:Invoke(HERO_DATA_MODIFY, arg_10_1)
end

function var_0_0.AstrolabeUnlock(arg_11_0, arg_11_1, arg_11_2)
	local var_11_0 = var_0_1[arg_11_1].unlocked_astrolabe

	if not table.keyof(var_11_0, arg_11_2) then
		table.insert(var_11_0, arg_11_2)
	end
end

function var_0_0.AstrolabeEquip(arg_12_0, arg_12_1, arg_12_2)
	local var_12_0 = var_0_1[arg_12_1].using_astrolabe

	if not table.keyof(var_12_0, arg_12_2) then
		table.insert(var_12_0, arg_12_2)
	end

	manager.notify:Invoke(HERO_DATA_MODIFY, arg_12_1)
end

function var_0_0.AstrolabeEquipAll(arg_13_0, arg_13_1, arg_13_2)
	local var_13_0 = deepClone(HeroAstrolabeCfg.get_id_list_by_hero_astrolabe_suit_id[arg_13_2])

	var_0_1[arg_13_1].using_astrolabe = var_13_0

	manager.notify:Invoke(HERO_DATA_MODIFY, arg_13_1)
end

function var_0_0.AstrolabeEquipByList(arg_14_0, arg_14_1, arg_14_2)
	var_0_1[arg_14_1].using_astrolabe = arg_14_2

	manager.notify:Invoke(HERO_DATA_MODIFY, arg_14_1)
end

function var_0_0.AstrolabeUnload(arg_15_0, arg_15_1, arg_15_2)
	local var_15_0 = var_0_1[arg_15_1].using_astrolabe
	local var_15_1 = table.keyof(var_15_0, arg_15_2)

	if var_15_1 then
		table.remove(var_15_0, var_15_1)
		var_0_0:AstrolabeUnload(arg_15_1, arg_15_2 + 1)
		manager.notify:Invoke(HERO_DATA_MODIFY, arg_15_1)
	end
end

function var_0_0.AstrolabeUnloadAll(arg_16_0, arg_16_1)
	var_0_1[arg_16_1].using_astrolabe = {}

	manager.notify:Invoke(HERO_DATA_MODIFY, arg_16_1)
end

function var_0_0.WeaponStr(arg_17_0, arg_17_1, arg_17_2, arg_17_3)
	var_0_1[arg_17_1]:GetWeaponInfo().level = arg_17_2
	var_0_1[arg_17_1]:GetWeaponInfo().exp = arg_17_3

	manager.notify:Invoke(HERO_DATA_MODIFY, arg_17_1)
end

function var_0_0.WeaponBreak(arg_18_0, arg_18_1, arg_18_2)
	var_0_1[arg_18_1]:GetWeaponInfo().breakthrough = arg_18_2

	manager.notify:Invoke(HERO_DATA_MODIFY, arg_18_1)
end

function var_0_0.ServantReplace(arg_19_0, arg_19_1, arg_19_2)
	var_0_1[arg_19_1].servant_uid = arg_19_2

	manager.notify:Invoke(HERO_DATA_MODIFY, arg_19_1)
end

function var_0_0.HeroSkillUpgrade(arg_20_0, arg_20_1, arg_20_2, arg_20_3)
	local var_20_0 = arg_20_0:GetHeroData(arg_20_1)

	for iter_20_0, iter_20_1 in ipairs(var_20_0:GetSkillInfoList()) do
		if iter_20_1.skill_id == arg_20_2 then
			iter_20_1.skill_level = iter_20_1.skill_level + (arg_20_3 or 1)

			break
		end
	end
end

function var_0_0.HeroSkillAttrUpgrade(arg_21_0, arg_21_1, arg_21_2, arg_21_3)
	local var_21_0 = arg_21_0:GetHeroData(arg_21_1)

	for iter_21_0, iter_21_1 in ipairs(var_21_0:GetSkillAttrList()) do
		if iter_21_1.index == arg_21_2 then
			iter_21_1.level = iter_21_1.level + (arg_21_3 or 1)

			manager.notify:Invoke(HERO_DATA_MODIFY, arg_21_1)

			return
		end
	end

	table.insert(var_21_0:GetSkillAttrList(), {
		index = arg_21_2,
		level = arg_21_3
	})
	manager.notify:Invoke(HERO_DATA_MODIFY, arg_21_1)
end

function var_0_0.HeroStarUp(arg_22_0, arg_22_1)
	local var_22_0 = arg_22_0:GetHeroData(arg_22_1)
	local var_22_1 = HeroStarCfg[var_22_0.star]
	local var_22_2 = var_22_1.star
	local var_22_3 = var_22_1.phase

	var_0_11[arg_22_1] = var_22_0.piece

	local var_22_4, var_22_5 = HeroTools.GetNextStarAndPhase(var_22_2, var_22_3)

	var_22_0.star = HeroTools.GetStarCfgId(var_22_4, var_22_5)

	manager.notify:Invoke(HERO_DATA_MODIFY, arg_22_1)
end

function var_0_0.SelectSkin(arg_23_0, arg_23_1, arg_23_2)
	arg_23_0:GetHeroData(arg_23_1).using_skin = arg_23_2
end

function var_0_0.GetHeroListExcept(arg_24_0, arg_24_1)
	local var_24_0 = {}

	for iter_24_0, iter_24_1 in pairs(var_0_1) do
		if table.indexof(arg_24_1, iter_24_0) then
			-- block empty
		else
			var_24_0[iter_24_0] = iter_24_1
		end
	end

	return var_24_0
end

function var_0_0.GetHeroList(arg_25_0)
	return var_0_1
end

function var_0_0.GetEquipMap(arg_26_0)
	return var_0_2
end

function var_0_0.GetHeroOmegaNeedPiece(arg_27_0, arg_27_1)
	local var_27_0 = HeroData:GetHeroData(arg_27_1)
	local var_27_1 = HeroCfg[arg_27_1]
	local var_27_2 = 0

	if var_27_0.unlock == 1 then
		local var_27_3 = HeroStarCfg[var_27_0.star].star
		local var_27_4 = HeroStarCfg[var_27_0.star].phase
		local var_27_5 = HeroTools.GetStarCfgId(var_27_3, var_27_4)

		for iter_27_0 = table.keyof(HeroStarCfg.all, var_27_5), #HeroStarCfg.all do
			var_27_2 = var_27_2 + HeroStarCfg[HeroStarCfg.all[iter_27_0]].star_up
		end

		return math.max(0, var_27_2 - var_27_0.piece)
	else
		local var_27_6 = var_27_1.rare
		local var_27_7 = GameSetting.unlock_hero_need.value[var_27_6]

		for iter_27_1 = 1, #HeroStarCfg.all do
			var_27_2 = var_27_2 + HeroStarCfg[HeroStarCfg.all[iter_27_1]].star_up
		end

		return var_27_7 + var_27_2
	end
end

function var_0_0.GetHeroNum(arg_28_0)
	local var_28_0 = 0

	for iter_28_0, iter_28_1 in pairs(var_0_1) do
		if iter_28_1.unlock == 1 then
			var_28_0 = var_28_0 + 1
		end
	end

	return var_28_0
end

function var_0_0.GetUnlockHeros(arg_29_0)
	local var_29_0 = {}

	for iter_29_0, iter_29_1 in pairs(var_0_1) do
		if iter_29_1.unlock == 1 then
			table.insert(var_29_0, iter_29_1.id)
		end
	end

	return var_29_0
end

function var_0_0.InitFavorite(arg_30_0, arg_30_1)
	var_0_3 = arg_30_1 or {}
end

function var_0_0.IsFavorite(arg_31_0, arg_31_1)
	return table.indexof(var_0_3, arg_31_1)
end

function var_0_0.SetFavoriteHeroOn(arg_32_0, arg_32_1)
	if not table.indexof(var_0_3, arg_32_1) then
		table.insert(var_0_3, arg_32_1)
	end
end

function var_0_0.SetFavoriteHeroOff(arg_33_0, arg_33_1)
	local var_33_0 = table.indexof(var_0_3, arg_33_1)

	if var_33_0 then
		table.remove(var_0_3, var_33_0)
	end
end

function var_0_0.SaveSortValue(arg_34_0, arg_34_1, arg_34_2, arg_34_3, arg_34_4, arg_34_5)
	var_0_5 = arg_34_1 == nil and true or arg_34_1
	var_0_6 = arg_34_2 or 0
	var_0_7 = arg_34_3 or {}
	var_0_8 = arg_34_4 or {}
	var_0_9 = arg_34_5 or {}
end

function var_0_0.SaveSortType(arg_35_0, arg_35_1)
	var_0_6 = arg_35_1 or 0
end

function var_0_0.GetSortValue(arg_36_0)
	return var_0_5, var_0_6, var_0_7, var_0_8, var_0_9
end

function var_0_0.ResetSortValue(arg_37_0)
	var_0_5 = true
	var_0_6 = 0
	var_0_7 = {}
	var_0_8 = {}
	var_0_9 = {}
end

function var_0_0.ImproveTransitionGiftPt(arg_38_0, arg_38_1)
	local var_38_0 = arg_38_0:GetHeroTransitionSkillBySlotID(arg_38_1.hero_id, arg_38_1.slot_id)

	if var_38_0 then
		var_38_0.talent_points = var_38_0.talent_points + arg_38_1.lv_up_num
	else
		local var_38_1 = var_0_1[arg_38_1.hero_id]

		table.insert(var_38_1:GetTransitionInfoList(), {
			slot_id = arg_38_1.slot_id,
			skill_list = {},
			talent_points = arg_38_1.lv_up_num
		})
	end
end

function var_0_0.ModifyTransitionSkill(arg_39_0, arg_39_1)
	local var_39_0 = arg_39_0:GetHeroTransitionSkillBySlotID(arg_39_1.hero_id, arg_39_1.slot_id)

	if var_39_0 then
		var_39_0.skill_list = cleanProtoTable(arg_39_1.skill_list)

		manager.notify:Invoke(HERO_TRANSITION_CHANGE, {
			heroId = arg_39_1.hero_id
		})
	end
end

function var_0_0.GetHeroTransitionSkillBySlotID(arg_40_0, arg_40_1, arg_40_2)
	local var_40_0 = var_0_1[arg_40_1]

	for iter_40_0, iter_40_1 in ipairs(var_40_0:GetTransitionInfoList()) do
		if iter_40_1.slot_id == arg_40_2 then
			return iter_40_1
		end
	end

	return false
end

function var_0_0.GetCurModuleLevel(arg_41_0, arg_41_1)
	return var_0_1[arg_41_1] and var_0_1[arg_41_1].moduleLevel or 0
end

function var_0_0.GetModuleMaxLevel(arg_42_0, arg_42_1)
	return #WeaponModuleCfg[arg_42_1].cost
end

function var_0_0.ModuleLevelUp(arg_43_0, arg_43_1)
	if var_0_1[arg_43_1] then
		var_0_1[arg_43_1].moduleLevel = var_0_1[arg_43_1].moduleLevel + 1
	end
end

function var_0_0.GetModuleAssignmentIsFinish(arg_44_0, arg_44_1)
	if var_0_1[arg_44_1] then
		if var_0_1[arg_44_1].moduleAssignment > 0 then
			return true
		else
			return false
		end
	end

	return false
end

function var_0_0.GetModulePowersByHeroID(arg_45_0, arg_45_1)
	local var_45_0 = {}
	local var_45_1 = arg_45_0:GetCurModuleLevel(arg_45_1)
	local var_45_2 = WeaponModuleCfg[arg_45_1]

	if var_45_2 then
		for iter_45_0 = 1, var_45_1 do
			local var_45_3 = var_45_2.skill[iter_45_0]

			for iter_45_1, iter_45_2 in pairs(var_45_3) do
				table.insert(var_45_0, iter_45_2)
			end
		end
	end

	return var_45_0
end

function var_0_0.GetAllModulePowersByHeroID(arg_46_0, arg_46_1)
	local var_46_0 = {}
	local var_46_1 = arg_46_0:GetModuleMaxLevel(arg_46_1)
	local var_46_2 = WeaponModuleCfg[arg_46_1]

	if var_46_2 then
		for iter_46_0 = 1, var_46_1 do
			local var_46_3 = var_46_2.skill[iter_46_0]

			for iter_46_1, iter_46_2 in pairs(var_46_3) do
				table.insert(var_46_0, iter_46_2)
			end
		end
	end

	return var_46_0
end

function var_0_0.GetCurModuleEffectListByType(arg_47_0, arg_47_1, arg_47_2, arg_47_3)
	local var_47_0 = HeroTools:GetModulePowersByHeroIDAndLevel(arg_47_1, arg_47_3)
	local var_47_1 = {}

	for iter_47_0, iter_47_1 in pairs(var_47_0) do
		if WeaponModuleEffectCfg[iter_47_1].type == arg_47_2 then
			table.insert(var_47_1, iter_47_1)
		end
	end

	if var_47_1[1] then
		return var_47_1
	else
		return nil
	end
end

function var_0_0.GetLockModuleEffectListByType(arg_48_0, arg_48_1, arg_48_2)
	local var_48_0 = WeaponModuleCfg[arg_48_1].skill[1]
	local var_48_1 = {}

	for iter_48_0, iter_48_1 in pairs(var_48_0) do
		if WeaponModuleEffectCfg[iter_48_1].type == arg_48_2 then
			table.insert(var_48_1, iter_48_1)
		end
	end

	if var_48_1[1] then
		return var_48_1
	else
		return nil
	end
end

function var_0_0.UnlockTrust(arg_49_0, arg_49_1, arg_49_2)
	if var_0_1[arg_49_1] then
		var_0_1[arg_49_1].trust.level = 1
		var_0_1[arg_49_1].trust.exp = 0
		var_0_1[arg_49_1].trust.mood = arg_49_2
	end

	HeroAction.UpdateSuperStoryRedPoint()
	HeroTools.SetHeroNewTagRed(arg_49_1, "unlockRelation", table.concat({
		RedPointConst.HERO_REALTION,
		"_",
		arg_49_1
	}), true)
end

function var_0_0.UpgradeTrustLevel(arg_50_0, arg_50_1)
	if var_0_1[arg_50_1] then
		local var_50_0 = var_0_1[arg_50_1].trust.level

		var_0_1[arg_50_1].trust.level = var_50_0 + 1
		var_0_1[arg_50_1].trust.exp = 0
	end

	HeroAction.UpdateSuperStoryRedPoint()
end

function var_0_0.UnlockRelationNet(arg_51_0, arg_51_1, arg_51_2, arg_51_3)
	if var_0_1[arg_51_1] then
		var_0_1[arg_51_1].relation:UnlockRelationNet(arg_51_2, arg_51_3)
	end
end

function var_0_0.SetupHeroMainOpenStatus(arg_52_0, arg_52_1)
	var_0_4 = arg_52_1
end

function var_0_0.GetHeroMainOpenStatus(arg_53_0)
	return var_0_4
end

function var_0_0.SetHeroStrategyRedPoint(arg_54_0, arg_54_1)
	saveData("strategy", "strategy_" .. arg_54_1, "1")
end

function var_0_0.GetHeroStrategyRedPoint(arg_55_0, arg_55_1)
	local var_55_0 = HeroCfg[arg_55_1].study_stage[1]
	local var_55_1 = BattleTeachData:GetHeroTeachInfo(arg_55_1, var_55_0) > 0

	return getData("strategy", "strategy_" .. arg_55_1) ~= "1" and not var_55_1
end

function var_0_0.GetRecommendEquipSkill(arg_56_0, arg_56_1, arg_56_2)
	local var_56_0 = {
		3,
		2,
		1
	}
	local var_56_1 = HeroCfg[arg_56_1].recommend_equip_skill

	for iter_56_0 = 1, #var_56_1 do
		if table.indexof(var_56_1[iter_56_0], arg_56_2) then
			return var_56_0[iter_56_0]
		end
	end
end

function var_0_0.Init(arg_57_0)
	_G.heroViewPageIndex_ = 1
end

return var_0_0
