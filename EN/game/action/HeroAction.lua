local var_0_0 = {}

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

function var_0_0.UnlockHeroSuccess(arg_30_0)
	HeroData:UnlockHeroSuccess(arg_30_0)
	var_0_0.UpdateHeartRedPoint()
	var_0_0.UpdateStoryRedPoint()
	var_0_0.UpdateSuperStoryRedPoint()

	local var_30_0 = SkinCfg[arg_30_0].portrait or 2110111

	PlayerAction.UnlockPortrait(var_30_0)
	PlayerAction.RefreshSkinGiftRedPoint()
	var_0_0.UpdateSkinCouponRedPoint(arg_30_0)
end

function var_0_0.AddHeroExpSuccess(arg_31_0, arg_31_1, arg_31_2)
	HeroData:AddHeroExpSuccess(arg_31_0, arg_31_1, arg_31_2)
end

function var_0_0.BreakSuccess(arg_32_0, arg_32_1)
	HeroData:BreakSuccess(arg_32_0, arg_32_1)
end

function var_0_0.WeaponStr(arg_33_0, arg_33_1, arg_33_2)
	HeroData:WeaponStr(arg_33_0, arg_33_1, arg_33_2)
end

function var_0_0.WeaponBreak(arg_34_0, arg_34_1)
	HeroData:WeaponBreak(arg_34_0, arg_34_1)
end

function var_0_0.ServantReplace(arg_35_0, arg_35_1)
	HeroData:ServantReplace(arg_35_0, arg_35_1)
end

function var_0_0.EquipSwap(arg_36_0, arg_36_1, arg_36_2)
	local var_36_0 = {
		hero_id = arg_36_0,
		equip_id = arg_36_1,
		pos = arg_36_2
	}

	manager.net:SendWithLoadingNew(13012, var_36_0, 13013, var_0_0.OnEquipSwap)
end

function var_0_0.OnEquipSwap(arg_37_0, arg_37_1)
	if isSuccess(arg_37_0.result) then
		HeroData:EquipSwap(arg_37_1.hero_id, arg_37_1.equip_id, arg_37_1.pos)
	end

	manager.notify:CallUpdateFunc(EQUIP_SWAP, arg_37_0, arg_37_1)
end

function var_0_0.EquipUnloadAll(arg_38_0)
	local var_38_0 = {
		hero_id = arg_38_0
	}

	manager.net:SendWithLoadingNew(13018, var_38_0, 13019, var_0_0.OnEquipUnloadAll)
end

function var_0_0.OnEquipUnloadAll(arg_39_0, arg_39_1)
	if isSuccess(arg_39_0.result) then
		HeroData:EquipUnloadAll(arg_39_1.hero_id)
	end

	manager.notify:CallUpdateFunc(EQUIP_UNLOAD_ALL, arg_39_0, arg_39_1)
end

function var_0_0.HeroChangeEquip(arg_40_0, arg_40_1, arg_40_2)
	HeroData:EquipSwap(arg_40_0, arg_40_1, arg_40_2)
end

function var_0_0.HeroSkillUpgrade(arg_41_0, arg_41_1, arg_41_2)
	local var_41_0 = {
		hero_id = arg_41_0,
		skill_id = arg_41_1,
		num = arg_41_2
	}

	manager.net:SendWithLoadingNew(14030, var_41_0, 14031, var_0_0.OnHeroSkillUpgrade)
end

function var_0_0.OnHeroSkillUpgrade(arg_42_0, arg_42_1)
	if isSuccess(arg_42_0.result) then
		HeroData:HeroSkillUpgrade(arg_42_1.hero_id, arg_42_1.skill_id, arg_42_1.num)
	end

	manager.notify:CallUpdateFunc(HERO_SKILL_UPGRADE, arg_42_0, arg_42_1)
end

function var_0_0.HeroSkillAttrUpgrade(arg_43_0, arg_43_1, arg_43_2)
	local var_43_0 = {
		hero_id = arg_43_0,
		index = arg_43_1,
		num = arg_43_2
	}

	manager.net:SendWithLoadingNew(14044, var_43_0, 14045, var_0_0.OnHeroSkillAttrUpgrade)
end

function var_0_0.OnHeroSkillAttrUpgrade(arg_44_0, arg_44_1)
	if isSuccess(arg_44_0.result) then
		HeroData:HeroSkillAttrUpgrade(arg_44_1.hero_id, arg_44_1.index, arg_44_1.num)
	end

	manager.notify:CallUpdateFunc(HERO_SKILL_ATTR_UPGRADE, arg_44_0, arg_44_1)
end

function var_0_0.SelectSkin(arg_45_0, arg_45_1)
	if arg_45_0 == arg_45_1 then
		arg_45_1 = 0
	end

	return manager.net:SendWithLoadingNew(14034, {
		hero_id = arg_45_0,
		skin_id = arg_45_1
	}, 14035, var_0_0.OnSelectSkin)
end

function var_0_0.HeroStarUp(arg_46_0)
	local var_46_0 = {
		id = arg_46_0
	}

	manager.net:SendWithLoadingNew(14012, var_46_0, 14013, var_0_0.OnHeroStarUp)
end

function var_0_0.OnHeroStarUp(arg_47_0, arg_47_1)
	if isSuccess(arg_47_0.result) then
		HeroData:HeroStarUp(arg_47_1.id)
	end

	manager.notify:CallUpdateFunc(HERO_STAR_UP, arg_47_0, arg_47_1)
end

function var_0_0.OnSelectSkin(arg_48_0, arg_48_1)
	if isSuccess(arg_48_0.result) then
		HeroData:SelectSkin(arg_48_1.hero_id, arg_48_1.skin_id)
		HomeSceneSettingAction.CheckMatchSkin(arg_48_1.hero_id)
	else
		ShowTips(arg_48_0.result)
	end

	manager.notify:CallUpdateFunc(HERO_SKIN_SELECT, arg_48_0, arg_48_1)
end

function var_0_0.SkinAdd(arg_49_0, arg_49_1, arg_49_2)
	local var_49_0 = SkinCfg[arg_49_0].hero
	local var_49_1 = HeroData:GetHeroData(var_49_0).unlocked_skin

	if not arg_49_1 then
		table.insert(var_49_1, {
			time = 0,
			skin_id = arg_49_0
		})
	else
		table.insert(var_49_1, {
			skin_id = arg_49_0,
			time = arg_49_2
		})
	end

	if HeroData:GetHeroList()[var_49_0].unlock > 0 then
		if SkinCfg[arg_49_0] and #SkinCfg[arg_49_0].gift > 0 then
			manager.redPoint:setTip(RedPointConst.SKIN_GIFT .. "_" .. arg_49_0, 1)
		end

		manager.redPoint:setTip(RedPointConst.HERO_SKIN_ROUTE_ID .. arg_49_0, 1, RedPointStyle.SHOW_NEW_TAG)
	end

	local var_49_2 = SkinCfg[arg_49_0].portrait

	if not arg_49_1 then
		PlayerAction.UnlockPortrait(var_49_2)
	end
end

local var_0_1

function var_0_0.SendGift(arg_50_0, arg_50_1, arg_50_2)
	local var_50_0 = {
		archive_id = arg_50_0,
		gift_list = arg_50_1
	}

	var_0_1 = arg_50_2

	manager.net:SendWithLoadingNew(14100, var_50_0, 14101, var_0_0.OnSendGift)
end

function var_0_0.OnSendGift(arg_51_0, arg_51_1)
	if isSuccess(arg_51_0.result) then
		ArchiveData:AddExp(arg_51_1.archive_id, var_0_1)
		ArchiveData:AddGift(arg_51_1.archive_id, arg_51_1.gift_list)
		var_0_0.UpdateHeartRedPoint()
		var_0_0.UpdateStoryRedPoint()
		var_0_0.UpdateSuperStoryRedPoint()
		manager.notify:CallUpdateFunc(HERO_SEND_GIFT, arg_51_0, arg_51_1)
	else
		ShowTips(arg_51_0.result)
	end
end

function var_0_0.InitHeartStoryRedPoint()
	local var_52_0 = ArchiveData:GetArchiveList()

	if not var_52_0 then
		return
	end

	for iter_52_0, iter_52_1 in pairs(var_52_0) do
		local var_52_1 = RedPointConst.HERO_STORY_ID .. iter_52_0
		local var_52_2 = RedPointConst.HERO_SUPER_STORY_ID .. iter_52_0
		local var_52_3 = RedPointConst.HERO_ANEDOTE_ID .. iter_52_0
		local var_52_4 = RedPointConst.HERO_HEART_STORY_ROOT_ID .. iter_52_0

		manager.redPoint:addGroup(var_52_4, {
			var_52_2,
			var_52_1,
			var_52_3
		})
	end
end

function var_0_0.UpdateStoryRedPoint()
	local function var_53_0(arg_54_0)
		local var_54_0 = HeroRecordCfg[arg_54_0].plot_id

		for iter_54_0, iter_54_1 in ipairs(var_54_0) do
			local var_54_1 = GameSetting.hero_plot_unlock_condition.value[iter_54_0]
			local var_54_2 = IsConditionAchieved(var_54_1, {
				heroId = arg_54_0
			})
			local var_54_3 = true
			local var_54_4

			if iter_54_0 > 1 then
				var_54_3 = ArchiveData:IsStoryRead(arg_54_0, HeroRecordCfg[arg_54_0].plot_id[iter_54_0 - 1])
			end

			local var_54_5 = ArchiveData:IsStoryRead(arg_54_0, HeroRecordCfg[arg_54_0].plot_id[iter_54_0])

			if var_54_2 and var_54_3 and not var_54_5 then
				return true
			end
		end

		return false
	end

	local var_53_1 = ArchiveData:GetArchiveList()

	for iter_53_0, iter_53_1 in pairs(var_53_1) do
		if HeroRecordCfg.get_id_list_by_hero_id[iter_53_0] then
			local var_53_2 = RedPointConst.HERO_STORY_ID .. iter_53_0
			local var_53_3 = "heartStroy_" .. PlayerData:GetPlayerInfo().userID .. "_" .. HeroRecordCfg.get_id_list_by_hero_id[iter_53_0][1]
			local var_53_4 = getData("HearListRedPoint", var_53_3)
			local var_53_5, var_53_6, var_53_7 = ArchiveData:GetUnlockHeartListInfoLengthByHeroId(iter_53_0)
			local var_53_8 = var_53_4 and var_53_4[1] == var_53_5

			manager.redPoint:setTip(var_53_2, var_53_0(iter_53_0) and not var_53_8 and 1 or 0)
		end
	end
end

function var_0_0.UpdateSuperStoryRedPoint()
	local function var_55_0(arg_56_0)
		local var_56_0 = HeroRecordCfg[arg_56_0].super_plot_id

		for iter_56_0, iter_56_1 in ipairs(var_56_0) do
			local var_56_1 = false

			for iter_56_2, iter_56_3 in ipairs(HeroRecordCfg[arg_56_0].hero_id) do
				local var_56_2 = GameSetting.hero_super_plot_unlock_condition.value[iter_56_0]

				var_56_1 = var_56_1 or IsConditionAchieved(var_56_2, {
					heroId = iter_56_3
				})
			end

			if var_56_1 and not ArchiveData:IsSuperHeartRead(arg_56_0, iter_56_0) then
				return true
			end
		end

		return false
	end

	local function var_55_1(arg_57_0)
		local var_57_0 = GameSetting.hero_anecdote_unlock_condition.value[1]
		local var_57_1 = HeroRecordCfg[arg_57_0]
		local var_57_2 = false

		for iter_57_0, iter_57_1 in ipairs(var_57_1.hero_id) do
			var_57_2 = var_57_2 or IsConditionAchieved(var_57_0, {
				heroId = iter_57_1
			})

			local var_57_3 = ArchiveData:IsArchiveStoryRead(arg_57_0, iter_57_1)

			if var_57_2 and not var_57_3 then
				return true
			end
		end

		return false
	end

	local var_55_2 = ArchiveData:GetArchiveList()

	for iter_55_0, iter_55_1 in pairs(var_55_2) do
		if HeroRecordCfg.get_id_list_by_hero_id[iter_55_0] then
			local var_55_3 = RedPointConst.HERO_SUPER_STORY_ID .. iter_55_0
			local var_55_4 = RedPointConst.HERO_ANEDOTE_ID .. iter_55_0
			local var_55_5 = "heartStroy_" .. PlayerData:GetPlayerInfo().userID .. "_" .. HeroRecordCfg.get_id_list_by_hero_id[iter_55_0][1]
			local var_55_6 = getData("HearListRedPoint", var_55_5)
			local var_55_7, var_55_8, var_55_9 = ArchiveData:GetUnlockHeartListInfoLengthByHeroId(iter_55_0)
			local var_55_10 = var_55_6 and var_55_6[2] == var_55_8
			local var_55_11 = var_55_6 and var_55_6[3] == var_55_9

			manager.redPoint:setTip(var_55_3, var_55_0(iter_55_0) and not var_55_10 and 1 or 0)
			manager.redPoint:setTip(var_55_4, var_55_1(iter_55_0) and not var_55_11 and 1 or 0)
		end
	end
end

function var_0_0.UpdateHeartRedPoint()
	local var_58_0 = HeroRecordCfg.all

	if not var_58_0 then
		return
	end

	for iter_58_0, iter_58_1 in pairs(var_58_0) do
		for iter_58_2 = 1, HeroConst.HERO_HEARTLINK_STORY_MAX_COUNT do
			local var_58_1 = RedPointConst.HERO_HEARTLINK_ID .. iter_58_1 .. "_" .. iter_58_2
			local var_58_2 = GameSetting.heart_chain_unlock_condition.value[iter_58_2]
			local var_58_3 = IsConditionAchieved(var_58_2, {
				heroId = iter_58_1
			}) and not ArchiveData:IsHeartRead(iter_58_1, iter_58_2)

			manager.redPoint:setTip(var_58_1, var_58_3 and 1 or 0)
		end
	end
end

function var_0_0.ReadStory(arg_59_0, arg_59_1, arg_59_2, arg_59_3)
	local var_59_0 = {
		arg_59_1
	}
	local var_59_1 = {
		archive_id = arg_59_0,
		video_list = var_59_0
	}

	if arg_59_2 == 1 then
		ArchiveData:SetStoryRead(arg_59_0, arg_59_1)
		manager.net:SendWithLoadingNew(14104, var_59_1, 14105, var_0_0.OnReadStory)
		var_0_0.UpdateStoryRedPoint()
	elseif arg_59_2 == 2 then
		ArchiveData:SetSuperHeartRead(arg_59_0, arg_59_3)
		ArchiveAction.SendViewSuperHeart(arg_59_0, arg_59_3)
		HeroAction.UpdateSuperStoryRedPoint()
	end

	manager.notify:Invoke(UPDATE_HEARTLIST)
end

function var_0_0.OnReadStory(arg_60_0, arg_60_1)
	if not isSuccess(arg_60_0.result) then
		ShowTips(arg_60_0.result)
	end
end

function var_0_0.ReadHeartLink(arg_61_0, arg_61_1)
	local var_61_0 = {
		arg_61_1
	}
	local var_61_1 = {
		archive_id = arg_61_0,
		text_list = var_61_0
	}

	ArchiveData:SetHeartRead(arg_61_0, arg_61_1)
	manager.net:SendWithLoadingNew(14102, var_61_1, 14103, var_0_0.OnReadHeartLink)
end

function var_0_0.OnReadHeartLink(arg_62_0, arg_62_1)
	if not isSuccess(arg_62_0.result) then
		ShowTips(arg_62_0.result)
	end
end

function var_0_0.SetFavoriteHeroOn(arg_63_0)
	local var_63_0 = {
		hero_id = arg_63_0
	}

	manager.net:SendWithLoadingNew(14106, var_63_0, 14107, var_0_0.OnSetFavoriteHeroOn)
end

function var_0_0.OnSetFavoriteHeroOn(arg_64_0, arg_64_1)
	if isSuccess(arg_64_0.result) then
		HeroData:SetFavoriteHeroOn(arg_64_1.hero_id)
		manager.notify:Invoke(FAVORITE_HERO)
	else
		ShowTips(arg_64_0.result)
	end
end

function var_0_0.SetFavoriteHeroOff(arg_65_0)
	local var_65_0 = {
		hero_id = arg_65_0
	}

	manager.net:SendWithLoadingNew(14108, var_65_0, 14109, var_0_0.OnSetFavoriteHeroOff)
end

function var_0_0.OnSetFavoriteHeroOff(arg_66_0, arg_66_1)
	if isSuccess(arg_66_0.result) then
		HeroData:SetFavoriteHeroOff(arg_66_1.hero_id)
		manager.notify:Invoke(FAVORITE_HERO)
	else
		ShowTips(arg_66_0.result)
	end
end

function var_0_0.UnLockSkin(arg_67_0)
	manager.net:SendWithLoadingNew(14110, {
		skin_id = arg_67_0
	}, 14111, var_0_0.OnUnLockSkin)
end

function var_0_0.OnUnLockSkin(arg_68_0, arg_68_1)
	if isSuccess(arg_68_0.result) then
		HeroAction.GetSkinAni(arg_68_1.skin_id)
		PlayerAction.RefreshSkinGiftRedPoint()
	else
		ShowTips(arg_68_0.result)
	end
end

function var_0_0.TryToImproveTransitionGiftPt(arg_69_0, arg_69_1, arg_69_2, arg_69_3)
	local var_69_0 = {
		hero_id = arg_69_0,
		slot_id = arg_69_1,
		lv_up_num = arg_69_2
	}

	manager.net:SendWithLoadingNew(14112, var_69_0, 14113, function(arg_70_0)
		if isSuccess(arg_70_0.result) then
			HeroData:ImproveTransitionGiftPt(var_69_0)
			manager.notify:Invoke(IMPROVE_TRANSITION_GIFT_PT)
		else
			ShowTips(arg_70_0.result)
		end
	end)
end

function var_0_0.TryToSaveTransitionSkill(arg_71_0, arg_71_1, arg_71_2, arg_71_3)
	local var_71_0 = {
		hero_id = arg_71_0,
		slot_id = arg_71_1,
		skill_list = arg_71_2
	}

	manager.net:SendWithLoadingNew(14114, var_71_0, 14115, function(arg_72_0)
		if isSuccess(arg_72_0.result) then
			HeroData:ModifyTransitionSkill(var_71_0)

			if arg_71_3 then
				arg_71_3()
			end
		else
			ShowTips(arg_72_0.result)
		end
	end)
end

function var_0_0.TryToLevelUpModule(arg_73_0)
	manager.net:SendWithLoadingNew(14116, {
		hero_id = arg_73_0
	}, 14117, function(arg_74_0)
		if isSuccess(arg_74_0.result) then
			local var_74_0 = HeroData:GetCurModuleLevel(arg_73_0) + 1
			local var_74_1 = WeaponModuleCfg[arg_73_0].cost[var_74_0]

			HeroData:ModuleLevelUp(arg_73_0)
			HeroAction.UpdateModuleRedPointByHeroID(arg_73_0)

			if HeroData:GetCurModuleLevel(arg_73_0) > 1 then
				JumpTools.OpenPageByJump("weaponModuleLevelUpPopView", {
					heroID = arg_73_0
				})
			else
				JumpTools.OpenPageByJump("/weaponModuleUnlockPopView", {
					heroID = arg_73_0
				})
			end

			manager.notify:Invoke(HERO_DATA_MODIFY, arg_73_0)
		else
			ShowTips(arg_74_0.result)
		end
	end)
end

function var_0_0.ResolveModuleItem(arg_75_0)
	manager.net:SendWithLoadingNew(14118, {
		item_list = arg_75_0
	}, 14119, function(arg_76_0, arg_76_1)
		if isSuccess(arg_76_0.result) then
			manager.notify:CallUpdateFunc(ON_RESOLVE_MODULE_ITEM, arg_76_0, arg_76_1.item_list)
		else
			ShowTips(arg_76_0.result)
		end
	end)
end

function var_0_0.GetSkinAni(arg_77_0)
	local var_77_0 = SkinCfg[arg_77_0].hero

	getReward({
		{
			num = 1,
			id = arg_77_0
		}
	}, {
		ItemConst.ITEM_TYPE.HERO_SKIN
	})
	HeroAction.SkinAdd(arg_77_0)
	HeroAction.UpdateHeroSkinRedPoint(var_77_0)
end

function var_0_0.UpdateAllSkinRedPoint()
	local var_78_0 = HeroData:GetHeroList()

	for iter_78_0, iter_78_1 in pairs(var_78_0) do
		local var_78_1 = iter_78_1.unlocked_skin
		local var_78_2 = iter_78_1.unlock > 0
		local var_78_3 = {}

		for iter_78_2, iter_78_3 in ipairs(var_78_1) do
			table.insert(var_78_3, iter_78_3.skin_id)
		end

		for iter_78_4, iter_78_5 in pairs(SkinCfg.get_id_list_by_hero[iter_78_1.id]) do
			local var_78_4 = RedPointConst.HERO_SKIN_ID_EXTEND .. iter_78_5

			if var_78_2 and not table.indexof(var_78_3, iter_78_5) and HeroTools.GetSkinIsCanUnlockAndGet(iter_78_5) then
				manager.redPoint:setTip(var_78_4, 1)
			else
				manager.redPoint:setTip(var_78_4, 0)
			end
		end
	end
end

function var_0_0.UpdateHeroSkinRedPoint(arg_79_0)
	local var_79_0 = HeroData:GetHeroList()
	local var_79_1 = var_79_0[arg_79_0].unlocked_skin
	local var_79_2 = {}

	for iter_79_0, iter_79_1 in ipairs(var_79_1) do
		table.insert(var_79_2, iter_79_1.skin_id)
	end

	local var_79_3 = var_79_0[arg_79_0].unlock > 0

	for iter_79_2, iter_79_3 in pairs(SkinCfg.get_id_list_by_hero[arg_79_0]) do
		local var_79_4 = RedPointConst.HERO_SKIN_ID_EXTEND .. iter_79_3

		if var_79_3 and not table.indexof(var_79_2, iter_79_3) and HeroTools.GetSkinIsCanUnlockAndGet(iter_79_3) then
			manager.redPoint:setTip(var_79_4, 1)
		else
			manager.redPoint:setTip(var_79_4, 0)
		end

		manager.redPoint:setTip(RedPointConst.HERO_SKIN_ROUTE_ID .. iter_79_3, not table.indexof(var_79_2, iter_79_3) and HeroTools.GetSkinIsCanUnlockAndGet(iter_79_3) and 1 or 0, RedPointStyle.SHOW_NEW_TAG)
	end
end

function var_0_0.RefreshHeroRedPointAfterSeverSendData()
	var_0_0.UpdateAllSkinRedPoint()
end

function var_0_0.UpdateModuleRedPointByHeroID(arg_81_0)
	local var_81_0 = WeaponModuleCfg[arg_81_0]

	if var_81_0 == nil then
		return
	end

	local var_81_1 = HeroData:GetCurModuleLevel(arg_81_0)
	local var_81_2 = HeroData:GetModuleMaxLevel(arg_81_0)
	local var_81_3 = RedPointConst.WEAPON_MODULE_UNLOCK .. "_" .. arg_81_0

	if var_81_2 <= var_81_1 then
		manager.redPoint:setTip(var_81_3, 0)

		return
	end

	local var_81_4 = var_81_0.condition[var_81_1 + 1]
	local var_81_5 = var_81_0.cost[var_81_1 + 1]
	local var_81_6 = {}
	local var_81_7 = 0

	for iter_81_0, iter_81_1 in pairs(var_81_5) do
		if iter_81_1[1] == 2 then
			var_81_7 = iter_81_1[2]
		else
			table.insert(var_81_6, iter_81_1)
		end
	end

	if not checkGold(var_81_7, false) then
		manager.redPoint:setTip(var_81_3, 0)

		return
	end

	if not HeroData:GetModuleAssignmentIsFinish(arg_81_0) then
		manager.redPoint:setTip(var_81_3, 0)

		return
	end

	if var_81_4 and var_81_4[1] then
		for iter_81_2, iter_81_3 in pairs(var_81_4) do
			if not IsConditionAchieved(iter_81_3, {
				heroId = arg_81_0
			}) then
				manager.redPoint:setTip(var_81_3, 0)

				return
			end
		end
	end

	for iter_81_4, iter_81_5 in pairs(var_81_6) do
		if iter_81_5[2] > ItemTools.getItemNum(iter_81_5[1]) then
			manager.redPoint:setTip(var_81_3, 0)

			return
		end
	end

	manager.redPoint:setTip(var_81_3, 1)
end

function var_0_0.QueryHeroNewData(arg_82_0)
	manager.net:SendWithLoadingNew(14042, {
		hero_id = arg_82_0
	}, 14043, var_0_0.OnHeroNewDataBack)
end

function var_0_0.OnHeroNewDataBack(arg_83_0)
	if isSuccess(arg_83_0.result) then
		-- block empty
	else
		ShowTips(arg_83_0.result)
	end
end

return var_0_0
