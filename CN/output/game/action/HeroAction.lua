﻿local var_0_0 = {}

manager.net:Bind(14007, function(arg_1_0)
	HeroData:ModifyHero(arg_1_0.hero)
	var_0_0.UpdateOneHeroNotice(arg_1_0.hero.hero_base_info.id)
end)
manager.net:Bind(14009, function(arg_2_0)
	HeroData:InitHero(arg_2_0.hero_info_list, arg_2_0.piece_list)
	HeroData:InitFavorite(arg_2_0.favorites)
	ArchiveData:InitArchive(arg_2_0.archives)
	ProposalData:InitProposal(arg_2_0.proposal_list)
	var_0_0.OnHeroInit()
end)
manager.net:Bind(14011, function(arg_3_0)
	HeroData:ModifyInvalidSkin(arg_3_0)
end)
manager.net:Bind(14019, function(arg_4_0)
	HeroData:ModifyHeroPieceByList(arg_4_0.piece_list)
end)
manager.notify:RegistListener(HERO_DATA_INIT, function()
	var_0_0.UpdatePieceRedPoint()
end)
manager.notify:RegistListener(HERO_PIECE_MODIFY, function(arg_6_0)
	var_0_0.UpdateUnlockNotice(arg_6_0)
	var_0_0.UpdateStarNotice(arg_6_0)
	var_0_0.UpdatePieceRedPoint()
end)
manager.notify:RegistListener(HERO_DATA_MODIFY, function(arg_7_0)
	var_0_0.UpdatePieceRedPoint()
	var_0_0.UpdateUnlockNotice(arg_7_0)
	var_0_0.UpdateBreakNotice(arg_7_0)
	var_0_0.UpdateStarNotice(arg_7_0)
end)
manager.notify:RegistListener(MATERIAL_INIT, function()
	var_0_0.CheckHeroBreakNotice()
end)
manager.notify:RegistListener(MATERIAL_LIST_UPDATE, function()
	var_0_0.CheckHeroBreakNotice()
end)
manager.notify:RegistListener(MATERIAL_MODIFY, function()
	var_0_0.CheckHeroBreakNotice()
end)
manager.notify:RegistListener(CURRENCY_UPDATE, function(arg_11_0)
	if arg_11_0 == CurrencyConst.CURRENCY_TYPE_GOLD then
		var_0_0.CheckHeroBreakNotice()
		var_0_0.UpdateAllStarNotice()
	end
end)
manager.notify:RegistListener(PLAYER_LEVEL_UP, function()
	var_0_0.CheckHeroBreakNotice()
end)

function var_0_0.UpdateUnlockNotice(arg_13_0)
	local var_13_0 = HeroData:GetHeroData(arg_13_0)
	local var_13_1 = HeroCfg[arg_13_0]
	local var_13_2 = GameSetting.unlock_hero_need.value[var_13_1.rare]

	if var_13_0.unlock == 0 and var_13_2 <= var_13_0.piece then
		manager.redPoint:setTip(RedPointConst.HERO_UNLOCK_ID .. arg_13_0, 1)
	else
		manager.redPoint:setTip(RedPointConst.HERO_UNLOCK_ID .. arg_13_0, 0)
	end
end

function var_0_0.UpdateBreakNotice(arg_14_0)
	if HeroTools.CanBreakHero(arg_14_0) then
		manager.redPoint:setTip(RedPointConst.HERO_BREAK_ID .. arg_14_0, 1)
	else
		manager.redPoint:setTip(RedPointConst.HERO_BREAK_ID .. arg_14_0, 0)
	end
end

function var_0_0.UpdateAllStarNotice()
	for iter_15_0, iter_15_1 in pairs(HeroData:GetHeroList()) do
		var_0_0.UpdateStarNotice(iter_15_1.id)
	end
end

function var_0_0.UpdateStarNotice(arg_16_0)
	if HeroTools.GetIsCanUpStar(HeroData:GetHeroData(arg_16_0)) then
		manager.redPoint:setTip(RedPointConst.HERO_STAR_ID .. arg_16_0, 1)
	else
		manager.redPoint:setTip(RedPointConst.HERO_STAR_ID .. arg_16_0, 0)
	end
end

function var_0_0.UpdateSkillNotice(arg_17_0, arg_17_1)
	local var_17_0 = arg_17_1 and RedPointConst.HERO_SKILL_ATTR .. arg_17_0 or RedPointConst.HERO_SKILL_UP .. arg_17_0

	if HeroTools.GetIsCanSkillUpNew(arg_17_0, arg_17_1) then
		manager.redPoint:setTip(var_17_0, 1)
	else
		manager.redPoint:setTip(var_17_0, 0)
	end
end

function var_0_0.UpdatePieceRedPoint()
	if #HeroTools.GetCanExchangeHero() > 0 then
		manager.redPoint:setTip(RedPointConst.HERO_PIECE_EXCHANGE, 1)
	else
		manager.redPoint:setTip(RedPointConst.HERO_PIECE_EXCHANGE, 0)
	end
end

function var_0_0.OnHeroInit()
	var_0_0.CheckHeroBreakNotice()
	var_0_0.CheckHeroUnlockNotice()
	var_0_0.UpdateAllStarNotice()
	var_0_0.UpdateHeartRedPoint()
	var_0_0.InitHeartStoryRedPoint()
	var_0_0.UpdateStoryRedPoint()
	var_0_0.UpdateSuperStoryRedPoint()
	var_0_0.UpdateAllHeroSkinRedPoint()
end

function var_0_0.UpdateAllHeroSkinRedPoint()
	for iter_20_0, iter_20_1 in pairs(HeroData:GetHeroList()) do
		var_0_0.UpdateSkinCouponRedPoint(iter_20_1.id)
		var_0_0.UpdateHeroSkinRedPoint(iter_20_1.id)
	end
end

function var_0_0.UpdateSkinCouponRedPoint(arg_21_0)
	local var_21_0 = HeroData:GetHeroList()[arg_21_0].unlock > 0
	local var_21_1 = SkinCfg.get_id_list_by_hero[arg_21_0]

	for iter_21_0, iter_21_1 in ipairs(var_21_1) do
		if var_21_0 == true and HeroTools.CanChangeSkin(iter_21_1) then
			manager.redPoint:setTip(RedPointConst.HERO_SKIN_ID .. arg_21_0, 1)

			return
		end
	end

	manager.redPoint:setTip(RedPointConst.HERO_SKIN_ID .. arg_21_0, 0)
end

function var_0_0.CheckHeroBreakNotice()
	for iter_22_0, iter_22_1 in pairs(HeroData:GetHeroList()) do
		var_0_0.UpdateBreakNotice(iter_22_1.id)
	end
end

function var_0_0.CheckHeroUnlockNotice()
	for iter_23_0, iter_23_1 in pairs(HeroData:GetHeroList()) do
		var_0_0.UpdateUnlockNotice(iter_23_1.id)
	end
end

function var_0_0.UpdateOneHeroNotice(arg_24_0)
	var_0_0.UpdateUnlockNotice(arg_24_0)
	var_0_0.UpdateBreakNotice(arg_24_0)
	var_0_0.UpdateStarNotice(arg_24_0)
	var_0_0.UpdateSkinCouponRedPoint(arg_24_0)
end

function var_0_0.HeroPieceModify(arg_25_0, arg_25_1)
	HeroData:HeroPieceModify(arg_25_0, arg_25_1)
end

function var_0_0.HeroBreak(arg_26_0)
	local var_26_0 = {
		hero_id = arg_26_0
	}

	manager.net:SendWithLoadingNew(14036, var_26_0, 14037, var_0_0.OnHeroBreak)
end

function var_0_0.OnHeroBreak(arg_27_0, arg_27_1)
	manager.notify:CallUpdateFunc(HERO_BREAK, arg_27_0, arg_27_1)
end

function var_0_0.AddHeroExp(arg_28_0, arg_28_1)
	manager.net:SendWithLoadingNew(14014, {
		id = arg_28_0,
		item_list = arg_28_1
	}, 14015, var_0_0.OnAddHeroExp)
end

function var_0_0.OnAddHeroExp(arg_29_0, arg_29_1)
	if isSuccess(arg_29_0.result) then
		-- block empty
	else
		ShowTips(arg_29_0.result)
	end

	manager.notify:CallUpdateFunc(ON_HERO_ADD_EXP, arg_29_0)
end

function var_0_0.HeroLevelUpAndBreak(arg_30_0, arg_30_1, arg_30_2, arg_30_3, arg_30_4)
	local var_30_0 = {
		hero_id = arg_30_0,
		break_list = arg_30_1,
		level = arg_30_2,
		item_list = arg_30_3
	}

	manager.net:SendWithLoadingNew(14120, var_30_0, 14121, function(arg_31_0, arg_31_1)
		var_0_0.OnHeroLevelUpAndBreak(arg_31_0, arg_31_1, arg_30_4)
	end)
end

function var_0_0.OnHeroLevelUpAndBreak(arg_32_0, arg_32_1, arg_32_2)
	if isSuccess(arg_32_0.result) then
		if arg_32_2 then
			arg_32_2(arg_32_1, arg_32_0.item_list)
		end
	else
		ShowTips(arg_32_0.result)
	end
end

function var_0_0.UnlockHeroSuccess(arg_33_0)
	HeroData:UnlockHeroSuccess(arg_33_0)
	var_0_0.UpdateHeartRedPoint()
	var_0_0.UpdateStoryRedPoint()
	var_0_0.UpdateSuperStoryRedPoint()

	local var_33_0 = SkinCfg[arg_33_0].portrait or 2110111

	PlayerAction.UnlockPortrait(var_33_0)
	PlayerAction.RefreshSkinGiftRedPoint()
	var_0_0.UpdateSkinCouponRedPoint(arg_33_0)
end

function var_0_0.AddHeroExpSuccess(arg_34_0, arg_34_1, arg_34_2)
	HeroData:AddHeroExpSuccess(arg_34_0, arg_34_1, arg_34_2)
end

function var_0_0.BreakSuccess(arg_35_0, arg_35_1)
	HeroData:BreakSuccess(arg_35_0, arg_35_1)
end

function var_0_0.WeaponStr(arg_36_0, arg_36_1, arg_36_2)
	HeroData:WeaponStr(arg_36_0, arg_36_1, arg_36_2)
end

function var_0_0.WeaponBreak(arg_37_0, arg_37_1)
	HeroData:WeaponBreak(arg_37_0, arg_37_1)
end

function var_0_0.ServantReplace(arg_38_0, arg_38_1)
	HeroData:ServantReplace(arg_38_0, arg_38_1)
end

function var_0_0.EquipSwap(arg_39_0, arg_39_1, arg_39_2)
	local var_39_0 = {
		hero_id = arg_39_0,
		equip_id = arg_39_1,
		pos = arg_39_2
	}

	manager.net:SendWithLoadingNew(13012, var_39_0, 13013, var_0_0.OnEquipSwap)
end

function var_0_0.OnEquipSwap(arg_40_0, arg_40_1)
	if isSuccess(arg_40_0.result) then
		HeroData:EquipSwap(arg_40_1.hero_id, arg_40_1.equip_id, arg_40_1.pos)
	end

	manager.notify:CallUpdateFunc(EQUIP_SWAP, arg_40_0, arg_40_1)
end

function var_0_0.EquipUnloadAll(arg_41_0)
	local var_41_0 = {
		hero_id = arg_41_0
	}

	manager.net:SendWithLoadingNew(13018, var_41_0, 13019, var_0_0.OnEquipUnloadAll)
end

function var_0_0.OnEquipUnloadAll(arg_42_0, arg_42_1)
	if isSuccess(arg_42_0.result) then
		HeroData:EquipUnloadAll(arg_42_1.hero_id)
	end

	manager.notify:CallUpdateFunc(EQUIP_UNLOAD_ALL, arg_42_0, arg_42_1)
end

function var_0_0.HeroChangeEquip(arg_43_0, arg_43_1, arg_43_2)
	HeroData:EquipSwap(arg_43_0, arg_43_1, arg_43_2)
end

function var_0_0.HeroSkillUpgrade(arg_44_0, arg_44_1, arg_44_2)
	local var_44_0 = {
		hero_id = arg_44_0,
		skill_id = arg_44_1,
		num = arg_44_2
	}

	manager.net:SendWithLoadingNew(14030, var_44_0, 14031, var_0_0.OnHeroSkillUpgrade)
end

function var_0_0.OnHeroSkillUpgrade(arg_45_0, arg_45_1)
	if isSuccess(arg_45_0.result) then
		HeroData:HeroSkillUpgrade(arg_45_1.hero_id, arg_45_1.skill_id, arg_45_1.num)
	end

	manager.notify:CallUpdateFunc(HERO_SKILL_UPGRADE, arg_45_0, arg_45_1)
end

function var_0_0.HeroSkillAttrUpgrade(arg_46_0, arg_46_1, arg_46_2)
	local var_46_0 = {
		hero_id = arg_46_0,
		index = arg_46_1,
		num = arg_46_2
	}

	manager.net:SendWithLoadingNew(14044, var_46_0, 14045, var_0_0.OnHeroSkillAttrUpgrade)
end

function var_0_0.OnHeroSkillAttrUpgrade(arg_47_0, arg_47_1)
	if isSuccess(arg_47_0.result) then
		HeroData:HeroSkillAttrUpgrade(arg_47_1.hero_id, arg_47_1.index, arg_47_1.num)
	end

	manager.notify:CallUpdateFunc(HERO_SKILL_ATTR_UPGRADE, arg_47_0, arg_47_1)
end

function var_0_0.SelectSkin(arg_48_0, arg_48_1)
	if arg_48_0 == arg_48_1 then
		arg_48_1 = 0
	end

	return manager.net:SendWithLoadingNew(14034, {
		hero_id = arg_48_0,
		skin_id = arg_48_1
	}, 14035, var_0_0.OnSelectSkin)
end

function var_0_0.HeroStarUp(arg_49_0)
	local var_49_0 = {
		id = arg_49_0
	}

	manager.net:SendWithLoadingNew(14012, var_49_0, 14013, var_0_0.OnHeroStarUp)
end

function var_0_0.OnHeroStarUp(arg_50_0, arg_50_1)
	if isSuccess(arg_50_0.result) then
		HeroData:HeroStarUp(arg_50_1.id)
	end

	manager.notify:CallUpdateFunc(HERO_STAR_UP, arg_50_0, arg_50_1)
end

function var_0_0.OnSelectSkin(arg_51_0, arg_51_1)
	if isSuccess(arg_51_0.result) then
		HeroData:SelectSkin(arg_51_1.hero_id, arg_51_1.skin_id)
		HomeSceneSettingAction.CheckMatchSkin(arg_51_1.hero_id)
	else
		ShowTips(arg_51_0.result)
	end

	manager.notify:CallUpdateFunc(HERO_SKIN_SELECT, arg_51_0, arg_51_1)
end

function var_0_0.SkinAdd(arg_52_0, arg_52_1, arg_52_2)
	local var_52_0 = SkinCfg[arg_52_0].hero
	local var_52_1 = HeroData:GetHeroData(var_52_0).unlocked_skin

	if not arg_52_1 then
		table.insert(var_52_1, {
			time = 0,
			skin_id = arg_52_0
		})
	else
		table.insert(var_52_1, {
			skin_id = arg_52_0,
			time = arg_52_2
		})
	end

	if HeroData:GetHeroList()[var_52_0].unlock > 0 then
		if SkinCfg[arg_52_0] and #SkinCfg[arg_52_0].gift > 0 then
			manager.redPoint:setTip(RedPointConst.SKIN_GIFT .. "_" .. arg_52_0, 1)
		end

		manager.redPoint:setTip(RedPointConst.HERO_SKIN_ROUTE_ID .. arg_52_0, 1, RedPointStyle.SHOW_NEW_TAG)
	end

	local var_52_2 = SkinCfg[arg_52_0].portrait

	if not arg_52_1 then
		PlayerAction.UnlockPortrait(var_52_2)
	end
end

local var_0_1

function var_0_0.SendGift(arg_53_0, arg_53_1, arg_53_2)
	local var_53_0 = {
		archive_id = arg_53_0,
		gift_list = arg_53_1
	}

	var_0_1 = arg_53_2

	manager.net:SendWithLoadingNew(14100, var_53_0, 14101, var_0_0.OnSendGift)
end

function var_0_0.OnSendGift(arg_54_0, arg_54_1)
	if isSuccess(arg_54_0.result) then
		ArchiveData:AddExp(arg_54_1.archive_id, var_0_1)
		ArchiveData:AddGift(arg_54_1.archive_id, arg_54_1.gift_list)
		var_0_0.UpdateHeartRedPoint()
		var_0_0.UpdateStoryRedPoint()
		var_0_0.UpdateSuperStoryRedPoint()
		manager.notify:CallUpdateFunc(HERO_SEND_GIFT, arg_54_0, arg_54_1)
	else
		ShowTips(arg_54_0.result)
	end
end

function var_0_0.InitHeartStoryRedPoint()
	local var_55_0 = ArchiveData:GetArchiveList()

	if not var_55_0 then
		return
	end

	for iter_55_0, iter_55_1 in pairs(var_55_0) do
		local var_55_1 = RedPointConst.HERO_STORY_ID .. iter_55_0
		local var_55_2 = RedPointConst.HERO_SUPER_STORY_ID .. iter_55_0
		local var_55_3 = RedPointConst.HERO_ANEDOTE_ID .. iter_55_0
		local var_55_4 = RedPointConst.HERO_HEART_STORY_ROOT_ID .. iter_55_0

		manager.redPoint:addGroup(var_55_4, {
			var_55_2,
			var_55_1,
			var_55_3
		})
	end
end

function var_0_0.UpdateStoryRedPoint()
	local function var_56_0(arg_57_0)
		local var_57_0 = HeroRecordCfg[arg_57_0].plot_id

		for iter_57_0, iter_57_1 in ipairs(var_57_0) do
			local var_57_1 = GameSetting.hero_plot_unlock_condition.value[iter_57_0]
			local var_57_2 = IsConditionAchieved(var_57_1, {
				heroId = arg_57_0
			})
			local var_57_3 = true
			local var_57_4

			if iter_57_0 > 1 then
				var_57_3 = ArchiveData:IsStoryRead(arg_57_0, HeroRecordCfg[arg_57_0].plot_id[iter_57_0 - 1])
			end

			local var_57_5 = ArchiveData:IsStoryRead(arg_57_0, HeroRecordCfg[arg_57_0].plot_id[iter_57_0])

			if var_57_2 and var_57_3 and not var_57_5 then
				return true
			end
		end

		return false
	end

	local var_56_1 = ArchiveData:GetArchiveList()

	for iter_56_0, iter_56_1 in pairs(var_56_1) do
		if HeroRecordCfg.get_id_list_by_hero_id[iter_56_0] then
			local var_56_2 = RedPointConst.HERO_STORY_ID .. iter_56_0
			local var_56_3 = "heartStroy_" .. PlayerData:GetPlayerInfo().userID .. "_" .. HeroRecordCfg.get_id_list_by_hero_id[iter_56_0][1]
			local var_56_4 = getData("HearListRedPoint", var_56_3)
			local var_56_5, var_56_6, var_56_7 = ArchiveData:GetUnlockHeartListInfoLengthByHeroId(iter_56_0)
			local var_56_8 = var_56_4 and var_56_4[1] == var_56_5

			manager.redPoint:setTip(var_56_2, var_56_0(iter_56_0) and not var_56_8 and 1 or 0)
		end
	end
end

function var_0_0.UpdateSuperStoryRedPoint()
	local function var_58_0(arg_59_0)
		local var_59_0 = HeroRecordCfg[arg_59_0].super_plot_id

		for iter_59_0, iter_59_1 in ipairs(var_59_0) do
			local var_59_1 = false

			for iter_59_2, iter_59_3 in ipairs(HeroRecordCfg[arg_59_0].hero_id) do
				local var_59_2 = GameSetting.hero_super_plot_unlock_condition.value[iter_59_0]

				var_59_1 = var_59_1 or IsConditionAchieved(var_59_2, {
					heroId = iter_59_3
				})
			end

			if var_59_1 and not ArchiveData:IsSuperHeartRead(arg_59_0, iter_59_0) then
				return true
			end
		end

		return false
	end

	local function var_58_1(arg_60_0)
		local var_60_0 = GameSetting.hero_anecdote_unlock_condition.value[1]
		local var_60_1 = HeroRecordCfg[arg_60_0]
		local var_60_2 = false

		for iter_60_0, iter_60_1 in ipairs(var_60_1.hero_id) do
			var_60_2 = var_60_2 or IsConditionAchieved(var_60_0, {
				heroId = iter_60_1
			})

			local var_60_3 = ArchiveData:IsArchiveStoryRead(arg_60_0, iter_60_1)

			if var_60_2 and not var_60_3 then
				return true
			end
		end

		return false
	end

	local var_58_2 = ArchiveData:GetArchiveList()

	for iter_58_0, iter_58_1 in pairs(var_58_2) do
		if HeroRecordCfg.get_id_list_by_hero_id[iter_58_0] then
			local var_58_3 = RedPointConst.HERO_SUPER_STORY_ID .. iter_58_0
			local var_58_4 = RedPointConst.HERO_ANEDOTE_ID .. iter_58_0
			local var_58_5 = "heartStroy_" .. PlayerData:GetPlayerInfo().userID .. "_" .. HeroRecordCfg.get_id_list_by_hero_id[iter_58_0][1]
			local var_58_6 = getData("HearListRedPoint", var_58_5)
			local var_58_7, var_58_8, var_58_9 = ArchiveData:GetUnlockHeartListInfoLengthByHeroId(iter_58_0)
			local var_58_10 = var_58_6 and var_58_6[2] == var_58_8
			local var_58_11 = var_58_6 and var_58_6[3] == var_58_9

			manager.redPoint:setTip(var_58_3, var_58_0(iter_58_0) and not var_58_10 and 1 or 0)
			manager.redPoint:setTip(var_58_4, var_58_1(iter_58_0) and not var_58_11 and 1 or 0)
		end
	end
end

function var_0_0.UpdateHeartRedPoint()
	local var_61_0 = HeroRecordCfg.all

	if not var_61_0 then
		return
	end

	for iter_61_0, iter_61_1 in pairs(var_61_0) do
		for iter_61_2 = 1, HeroConst.HERO_HEARTLINK_STORY_MAX_COUNT do
			local var_61_1 = RedPointConst.HERO_HEARTLINK_ID .. iter_61_1 .. "_" .. iter_61_2
			local var_61_2 = GameSetting.heart_chain_unlock_condition.value[iter_61_2]
			local var_61_3 = IsConditionAchieved(var_61_2, {
				heroId = iter_61_1
			}) and not ArchiveData:IsHeartRead(iter_61_1, iter_61_2)

			manager.redPoint:setTip(var_61_1, var_61_3 and 1 or 0)
		end
	end
end

function var_0_0.ReadStory(arg_62_0, arg_62_1, arg_62_2, arg_62_3)
	local var_62_0 = {
		arg_62_1
	}
	local var_62_1 = {
		archive_id = arg_62_0,
		video_list = var_62_0
	}

	if arg_62_2 == 1 then
		ArchiveData:SetStoryRead(arg_62_0, arg_62_1)
		manager.net:SendWithLoadingNew(14104, var_62_1, 14105, var_0_0.OnReadStory)
		var_0_0.UpdateStoryRedPoint()
	elseif arg_62_2 == 2 then
		ArchiveData:SetSuperHeartRead(arg_62_0, arg_62_3)
		ArchiveAction.SendViewSuperHeart(arg_62_0, arg_62_3)
		HeroAction.UpdateSuperStoryRedPoint()
	end

	manager.notify:Invoke(UPDATE_HEARTLIST)
end

function var_0_0.OnReadStory(arg_63_0, arg_63_1)
	if not isSuccess(arg_63_0.result) then
		ShowTips(arg_63_0.result)
	end
end

function var_0_0.ReadHeartLink(arg_64_0, arg_64_1)
	local var_64_0 = {
		arg_64_1
	}
	local var_64_1 = {
		archive_id = arg_64_0,
		text_list = var_64_0
	}

	ArchiveData:SetHeartRead(arg_64_0, arg_64_1)
	manager.net:SendWithLoadingNew(14102, var_64_1, 14103, var_0_0.OnReadHeartLink)
end

function var_0_0.OnReadHeartLink(arg_65_0, arg_65_1)
	if not isSuccess(arg_65_0.result) then
		ShowTips(arg_65_0.result)
	end
end

function var_0_0.SetFavoriteHeroOn(arg_66_0)
	local var_66_0 = {
		hero_id = arg_66_0
	}

	manager.net:SendWithLoadingNew(14106, var_66_0, 14107, var_0_0.OnSetFavoriteHeroOn)
end

function var_0_0.OnSetFavoriteHeroOn(arg_67_0, arg_67_1)
	if isSuccess(arg_67_0.result) then
		HeroData:SetFavoriteHeroOn(arg_67_1.hero_id)
		manager.notify:Invoke(FAVORITE_HERO)
	else
		ShowTips(arg_67_0.result)
	end
end

function var_0_0.SetFavoriteHeroOff(arg_68_0)
	local var_68_0 = {
		hero_id = arg_68_0
	}

	manager.net:SendWithLoadingNew(14108, var_68_0, 14109, var_0_0.OnSetFavoriteHeroOff)
end

function var_0_0.OnSetFavoriteHeroOff(arg_69_0, arg_69_1)
	if isSuccess(arg_69_0.result) then
		HeroData:SetFavoriteHeroOff(arg_69_1.hero_id)
		manager.notify:Invoke(FAVORITE_HERO)
	else
		ShowTips(arg_69_0.result)
	end
end

function var_0_0.UnLockSkin(arg_70_0)
	manager.net:SendWithLoadingNew(14110, {
		skin_id = arg_70_0
	}, 14111, var_0_0.OnUnLockSkin)
end

function var_0_0.OnUnLockSkin(arg_71_0, arg_71_1)
	if isSuccess(arg_71_0.result) then
		HeroAction.GetSkinAni(arg_71_1.skin_id)
		PlayerAction.RefreshSkinGiftRedPoint()
	else
		ShowTips(arg_71_0.result)
	end
end

function var_0_0.TryToImproveTransitionGiftPt(arg_72_0, arg_72_1, arg_72_2, arg_72_3)
	local var_72_0 = {
		hero_id = arg_72_0,
		slot_id = arg_72_1,
		lv_up_num = arg_72_2
	}

	manager.net:SendWithLoadingNew(14112, var_72_0, 14113, function(arg_73_0)
		if isSuccess(arg_73_0.result) then
			HeroData:ImproveTransitionGiftPt(var_72_0)
			manager.notify:Invoke(IMPROVE_TRANSITION_GIFT_PT)
		else
			ShowTips(arg_73_0.result)
		end
	end)
end

function var_0_0.TryToSaveTransitionSkill(arg_74_0, arg_74_1, arg_74_2, arg_74_3)
	local var_74_0 = {
		hero_id = arg_74_0,
		slot_id = arg_74_1,
		skill_list = arg_74_2
	}

	manager.net:SendWithLoadingNew(14114, var_74_0, 14115, function(arg_75_0)
		if isSuccess(arg_75_0.result) then
			HeroData:ModifyTransitionSkill(var_74_0)

			if arg_74_3 then
				arg_74_3()
			end
		else
			ShowTips(arg_75_0.result)
		end
	end)
end

function var_0_0.TryToLevelUpModule(arg_76_0)
	manager.net:SendWithLoadingNew(14116, {
		hero_id = arg_76_0
	}, 14117, function(arg_77_0)
		if isSuccess(arg_77_0.result) then
			local var_77_0 = HeroData:GetCurModuleLevel(arg_76_0) + 1
			local var_77_1 = WeaponModuleCfg[arg_76_0].cost[var_77_0]

			HeroData:ModuleLevelUp(arg_76_0)
			HeroAction.UpdateModuleRedPointByHeroID(arg_76_0)

			if HeroData:GetCurModuleLevel(arg_76_0) > 1 then
				JumpTools.OpenPageByJump("weaponModuleLevelUpPopView", {
					heroID = arg_76_0
				})
			else
				JumpTools.OpenPageByJump("/weaponModuleUnlockPopView", {
					heroID = arg_76_0
				})
			end

			manager.notify:Invoke(HERO_DATA_MODIFY, arg_76_0)
		else
			ShowTips(arg_77_0.result)
		end
	end)
end

function var_0_0.ResolveModuleItem(arg_78_0)
	manager.net:SendWithLoadingNew(14118, {
		item_list = arg_78_0
	}, 14119, function(arg_79_0, arg_79_1)
		if isSuccess(arg_79_0.result) then
			manager.notify:CallUpdateFunc(ON_RESOLVE_MODULE_ITEM, arg_79_0, arg_79_1.item_list)
		else
			ShowTips(arg_79_0.result)
		end
	end)
end

function var_0_0.GetSkinAni(arg_80_0)
	local var_80_0 = SkinCfg[arg_80_0].hero

	getReward({
		{
			num = 1,
			id = arg_80_0
		}
	}, {
		ItemConst.ITEM_TYPE.HERO_SKIN
	})
	HeroAction.SkinAdd(arg_80_0)
	HeroAction.UpdateHeroSkinRedPoint(var_80_0)
end

function var_0_0.UpdateAllSkinRedPoint()
	local var_81_0 = HeroData:GetHeroList()

	for iter_81_0, iter_81_1 in pairs(var_81_0) do
		local var_81_1 = iter_81_1.unlocked_skin
		local var_81_2 = iter_81_1.unlock > 0
		local var_81_3 = {}

		for iter_81_2, iter_81_3 in ipairs(var_81_1) do
			table.insert(var_81_3, iter_81_3.skin_id)
		end

		for iter_81_4, iter_81_5 in pairs(SkinCfg.get_id_list_by_hero[iter_81_1.id]) do
			local var_81_4 = RedPointConst.HERO_SKIN_ID_EXTEND .. iter_81_5

			if var_81_2 and not table.indexof(var_81_3, iter_81_5) and HeroTools.GetSkinIsCanUnlockAndGet(iter_81_5) then
				manager.redPoint:setTip(var_81_4, 1)
			else
				manager.redPoint:setTip(var_81_4, 0)
			end
		end
	end
end

function var_0_0.UpdateHeroSkinRedPoint(arg_82_0)
	local var_82_0 = HeroData:GetHeroList()
	local var_82_1 = var_82_0[arg_82_0].unlocked_skin
	local var_82_2 = {}

	for iter_82_0, iter_82_1 in ipairs(var_82_1) do
		table.insert(var_82_2, iter_82_1.skin_id)
	end

	local var_82_3 = var_82_0[arg_82_0].unlock > 0

	for iter_82_2, iter_82_3 in pairs(SkinCfg.get_id_list_by_hero[arg_82_0]) do
		local var_82_4 = RedPointConst.HERO_SKIN_ID_EXTEND .. iter_82_3

		if var_82_3 and not table.indexof(var_82_2, iter_82_3) and HeroTools.GetSkinIsCanUnlockAndGet(iter_82_3) then
			manager.redPoint:setTip(var_82_4, 1)
		else
			manager.redPoint:setTip(var_82_4, 0)
		end

		manager.redPoint:setTip(RedPointConst.HERO_SKIN_ROUTE_ID .. iter_82_3, not table.indexof(var_82_2, iter_82_3) and HeroTools.GetSkinIsCanUnlockAndGet(iter_82_3) and 1 or 0, RedPointStyle.SHOW_NEW_TAG)
	end
end

function var_0_0.RefreshHeroRedPointAfterSeverSendData()
	var_0_0.UpdateAllSkinRedPoint()
end

function var_0_0.UpdateModuleRedPointByHeroID(arg_84_0)
	local var_84_0 = WeaponModuleCfg[arg_84_0]

	if var_84_0 == nil then
		return
	end

	local var_84_1 = HeroData:GetCurModuleLevel(arg_84_0)
	local var_84_2 = HeroData:GetModuleMaxLevel(arg_84_0)
	local var_84_3 = RedPointConst.WEAPON_MODULE_UNLOCK .. "_" .. arg_84_0

	if var_84_2 <= var_84_1 then
		manager.redPoint:setTip(var_84_3, 0)

		return
	end

	local var_84_4 = var_84_0.condition[var_84_1 + 1]
	local var_84_5 = var_84_0.cost[var_84_1 + 1]
	local var_84_6 = {}
	local var_84_7 = 0

	for iter_84_0, iter_84_1 in pairs(var_84_5) do
		if iter_84_1[1] == 2 then
			var_84_7 = iter_84_1[2]
		else
			table.insert(var_84_6, iter_84_1)
		end
	end

	if not checkGold(var_84_7, false) then
		manager.redPoint:setTip(var_84_3, 0)

		return
	end

	if not HeroData:GetModuleAssignmentIsFinish(arg_84_0) then
		manager.redPoint:setTip(var_84_3, 0)

		return
	end

	if var_84_4 and var_84_4[1] then
		for iter_84_2, iter_84_3 in pairs(var_84_4) do
			if not IsConditionAchieved(iter_84_3, {
				heroId = arg_84_0
			}) then
				manager.redPoint:setTip(var_84_3, 0)

				return
			end
		end
	end

	for iter_84_4, iter_84_5 in pairs(var_84_6) do
		if iter_84_5[2] > ItemTools.getItemNum(iter_84_5[1]) then
			manager.redPoint:setTip(var_84_3, 0)

			return
		end
	end

	manager.redPoint:setTip(var_84_3, 1)
end

function var_0_0.QueryHeroNewData(arg_85_0)
	manager.net:SendWithLoadingNew(14042, {
		hero_id = arg_85_0
	}, 14043, var_0_0.OnHeroNewDataBack)
end

function var_0_0.OnHeroNewDataBack(arg_86_0)
	if isSuccess(arg_86_0.result) then
		-- block empty
	else
		ShowTips(arg_86_0.result)
	end
end

return var_0_0