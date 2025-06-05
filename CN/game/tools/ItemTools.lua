local var_0_0 = {
	getItemName = function(arg_1_0)
		local var_1_0 = ItemCfg[arg_1_0]

		if var_1_0.type == ItemConst.ITEM_TYPE.HERO then
			return HeroTools.GetHeroFullName(arg_1_0)
		elseif var_1_0.type == ItemConst.ITEM_TYPE.HERO_SKIN and var_1_0.sub_type ~= ItemConst.ITEM_SUB_TYPE.LIMIT_SKIN then
			return SkinCfg[arg_1_0].name
		end

		return GetI18NText(var_1_0.name)
	end
}

function var_0_0.getItemDesc(arg_2_0)
	local var_2_0 = ItemCfg[arg_2_0]

	if var_2_0.type == ItemConst.ITEM_TYPE.HERO then
		return string.format(GetTips("HERO_DESC"), GetI18NText(HeroCfg[arg_2_0].hero_desc))
	elseif var_2_0.type == ItemConst.ITEM_TYPE.HERO_SKIN then
		local var_2_1 = arg_2_0

		if var_2_0.param[1] then
			var_2_1 = var_2_0.param[1]
		end

		return string.format("%s%s", GetI18NText(var_2_0.desc), GetI18NText(SkinCfg[var_2_1].desc))
	elseif var_2_0.type == ItemConst.ITEM_TYPE.SKIN_CHANGE then
		local var_2_2 = var_2_0.param[1]

		return string.format(GetTips("EXCHANGE"), var_0_0.getItemDesc(var_2_2))
	elseif var_2_0.type == ItemConst.ITEM_TYPE.WEAPON_SERVANT then
		return string.format(GetTips("SERVANT_DESC"), GetI18NText(WeaponServantCfg[arg_2_0].desc))
	else
		return GetI18NText(var_2_0.desc)
	end
end

function var_0_0.getItemNum(arg_3_0, arg_3_1)
	if arg_3_0 == nil or arg_3_0 == 0 then
		return 0
	end

	local var_3_0 = ItemCfg[arg_3_0]

	if var_3_0 == nil then
		return 0
	end

	local var_3_1 = var_3_0.type
	local var_3_2 = var_3_0.sub_type

	if var_3_1 == ItemConst.ITEM_TYPE.CURRENCY then
		return CurrencyData:GetCurrencyNum(arg_3_0) or 0
	elseif var_3_1 == ItemConst.ITEM_TYPE.HERO_PIECE then
		local var_3_3 = HeroData:GetHeroData(var_3_0.hero_id)

		if var_3_3 then
			return var_3_3.piece
		end
	elseif var_3_1 == ItemConst.ITEM_TYPE.PROPS or var_3_1 == ItemConst.ITEM_TYPE.MATERIAL or var_3_1 == ItemConst.ITEM_TYPE.ARCHIVE_GIFT or var_3_1 == ItemConst.ITEM_TYPE.SKIN_CHANGE or var_3_1 == ItemConst.ITEM_TYPE.DYNAMIC_STICKER then
		return MaterialData:GetMaterialNum(arg_3_0, arg_3_1)
	elseif var_3_1 == ItemConst.ITEM_TYPE.GIFT then
		if var_3_2 == ItemConst.ITEM_SUB_TYPE.FUKUBUKURO then
			return FukubukuroData:CheckHaveItemId(arg_3_0) and 1 or 0
		else
			return MaterialData:GetMaterialNum(arg_3_0, arg_3_1)
		end
	elseif var_3_1 == ItemConst.ITEM_TYPE.WEAPON_SERVANT then
		local var_3_4 = WeaponServantData:GetServantSByID(arg_3_0)

		return var_3_4 and table.length(var_3_4) or 0
	elseif var_3_1 == ItemConst.ITEM_TYPE.EQUIP then
		return #EquipTools.GetEquipListByEquipid(arg_3_0)
	elseif var_3_1 == ItemConst.ITEM_TYPE.HERO_SKIN then
		if var_3_0.param[1] then
			arg_3_0 = var_3_0.param[1]
		end

		return HeroTools.IsSkinUnlock(arg_3_0) and 1 or 0
	elseif var_3_1 == ItemConst.ITEM_TYPE.PORTRAIT then
		return PlayerData:GetPortrait(arg_3_0).unlock == 1 and 1 or 0
	elseif var_3_1 == ItemConst.ITEM_TYPE.FRAME then
		return PlayerData:GetFrame(arg_3_0).unlock == 1 and 1 or 0
	elseif var_3_1 == ItemConst.ITEM_TYPE.STICKER then
		return not PlayerData:GetSticker(arg_3_0).lock and 1 or 0
	elseif var_3_1 == ItemConst.ITEM_TYPE.CANTEEN_INGREDIENTS then
		return CanteenFoodData:GetHadIngredientNum(arg_3_0) or 0
	elseif var_3_1 == ItemConst.ITEM_TYPE.CLUB_COMMON then
		-- block empty
	elseif var_3_1 == ItemConst.ITEM_TYPE.DORM_FURNITURE then
		return DormData:GetFurNumInfo(arg_3_0).num or 0
	elseif var_3_1 == ItemConst.ITEM_TYPE.SCENE then
		return HomeSceneSettingData:IsHaveScene(arg_3_0) and 1 or 0
	elseif var_3_1 == ItemConst.ITEM_TYPE.FURNITURE_SUIT then
		return DormSuitData:CheckUnlockSuit(arg_3_0) and 1 or 0
	elseif var_3_1 == ItemConst.ITEM_TYPE.STICKER_BG then
		return not PlayerData:GetStickerBg(arg_3_0).lock and 1 or 0
	elseif var_3_1 == ItemConst.ITEM_TYPE.CARD_BG then
		return PlayerData:GetCardBg(arg_3_0).unlock == 1 and 1 or 0
	elseif var_3_1 == ItemConst.ITEM_TYPE.CHAT_BUBBLE then
		return table.keyof(PlayerData:GetUnlockChatBubbleIDList(), arg_3_0) and 1 or 0
	elseif var_3_1 == ItemConst.ITEM_TYPE.STICKER_FG then
		return not PlayerData:GetStickerFg(arg_3_0).lock and 1 or 0
	else
		print("未知的Item类型", var_3_1)
	end

	return 0
end

function var_0_0.getItemTexturePath(arg_4_0, arg_4_1)
	local var_4_0 = ItemCfg[arg_4_0]

	if var_4_0 == nil then
		return
	end

	if var_4_0.type == ItemConst.ITEM_TYPE.EQUIP then
		return arg_4_1 and SpritePathCfg.EquipIcon_s.path or SpritePathCfg.EquipIcon_l.path
	elseif var_4_0.type == ItemConst.ITEM_TYPE.HERO_SKIN or var_4_0.type == ItemConst.ITEM_TYPE.HERO then
		return SpritePathCfg.HeroLittleIcon.path
	elseif var_4_0.type == ItemConst.ITEM_TYPE.HERO_PIECE then
		return SpritePathCfg.HeroPiece.path
	elseif var_4_0.type == ItemConst.ITEM_TYPE.WEAPON_SERVANT then
		return SpritePathCfg.ServantIcon.path
	elseif var_4_0.type == ItemConst.ITEM_TYPE.PORTRAIT then
		if var_4_0.sub_type == 1 then
			return SpritePathCfg.HeroLittleIcon.path
		elseif var_4_0.sub_type == 2 then
			return "TextureConfig/Item_l/"
		else
			print("暂未定义的头像来源")
		end
	elseif var_4_0.type == ItemConst.ITEM_TYPE.STICKER then
		return "TextureConfig/Sticker/Sticker/"
	elseif arg_4_1 then
		return SpritePathCfg.ItemLittleIcon.path
	else
		return SpritePathCfg.ItemIcon.path
	end
end

function var_0_0.getItemSprite(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = ItemCfg[arg_5_0]

	if var_5_0 == nil then
		return
	end

	local var_5_1 = var_0_0.getItemTexturePath(arg_5_0, arg_5_2)

	if var_5_0.type == ItemConst.ITEM_TYPE.STICKER then
		local var_5_2 = getSpriteWithoutAtlas(var_5_1 .. var_5_0.icon)

		if var_5_2 then
			return var_5_2
		else
			return getSpriteWithoutAtlas(var_5_1 .. var_5_0.icon .. SettingData:GetCurrentLanguageKey())
		end
	else
		return getSpriteWithoutAtlas(var_5_1 .. var_5_0.icon)
	end
end

function var_0_0.GetItemSpriteAsync(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
	local var_6_0 = ItemCfg[arg_6_0] or RechargeShopDescriptionCfg[arg_6_0] or {
		sub_type = 3,
		icon = "30042"
	}

	if not var_6_0.icon then
		var_6_0.icon = "30042"
	end

	local var_6_1 = true

	if not arg_6_2 then
		local var_6_2 = var_0_0.getItemTexturePath(arg_6_0, arg_6_3)

		if var_6_0.type == ItemConst.ITEM_TYPE.STICKER then
			var_6_1 = false
		end

		arg_6_2 = var_6_2 .. var_6_0.icon
	end

	if not var_6_1 then
		local var_6_3 = var_0_0.getItemSprite(arg_6_0, nil, arg_6_3)

		arg_6_1(arg_6_0, var_6_3)
	else
		getSpriteWithoutAtlasAsync(arg_6_2, function(arg_7_0)
			arg_6_1(arg_6_0, arg_7_0)
		end)
	end
end

function var_0_0.getItemLittleSprite(arg_8_0)
	return var_0_0.getItemSprite(arg_8_0, nil, true)
end

function var_0_0.GetItemExpiredTimeByInfo(arg_9_0)
	if arg_9_0.timeValid ~= nil and arg_9_0.timeValid > 0 then
		return arg_9_0.timeValid
	end

	return var_0_0.GetItemExpiredTimeByID(arg_9_0.id)
end

function var_0_0.GetItemExpiredTimeByID(arg_10_0)
	local var_10_0 = ItemCfg[arg_10_0]

	if var_10_0.time ~= nil and var_10_0.time ~= "" then
		local var_10_1 = var_10_0.time[1]

		if var_10_1 == 1 or var_10_1 == 5 then
			for iter_10_0, iter_10_1 in ipairs(var_10_0.time[2]) do
				local var_10_2, var_10_3 = ActivityData:GetActivityTime(iter_10_1)

				return var_10_3
			end
		elseif var_10_1 == 2 then
			return var_10_0.time[2][1]
		elseif var_10_1 == 3 then
			return _G.gameTimer:GetNextWeekFreshTime() + var_10_0.time[2][1] * 604800 + (var_10_0.time[2][2][1] - 1) * 24 * 3600 + (var_10_0.time[2][2][2] - 5) * 3600 + var_10_0.time[2][2][3] * 60
		elseif var_10_1 == 4 then
			return _G.gameTimer:GetNextDayFreshTime() + var_10_0.time[2][1] * 24 * 3600 + (var_10_0.time[2][2][1] - 5) * 3600 + var_10_0.time[2][2][2] * 60 + var_10_0.time[2][2][3]
		end
	end

	return 0
end

function var_0_0.IsItemExpired(arg_11_0)
	local var_11_0 = arg_11_0.id

	if var_0_0.IsItemExpiredByItemId(var_11_0) then
		return true
	end

	if arg_11_0.timeValid ~= nil and arg_11_0.timeValid > 0 and manager.time:GetServerTime() > arg_11_0.timeValid then
		return true
	end

	return false
end

function var_0_0.IsItemExpiredByItemId(arg_12_0)
	if ItemCfg[arg_12_0].type ~= ItemConst.ITEM_TYPE.MATERIAL then
		return false
	end

	local var_12_0 = ItemCfg[arg_12_0]

	if var_12_0.time ~= nil and var_12_0.time ~= "" then
		local var_12_1 = var_12_0.time[1]

		if var_12_1 == 1 then
			return not ActivityData:GetActivityIsOpen(var_12_0.time[2][1])
		elseif var_12_1 == 2 then
			return manager.time:GetServerTime() > var_12_0.time[2][1]
		end
	end

	return false
end

function var_0_0.GetItemCountdownText(arg_13_0)
	if arg_13_0 <= manager.time:GetServerTime() then
		return GetTips("TIP_EXPIRED")
	else
		return manager.time:GetLostTimeStr2(arg_13_0, nil, false)
	end
end

function var_0_0.RefreshLimitRed()
	PlayerData:RefreshTagRed()
	PlayerData:RefreshCardBgRed()
end

function var_0_0.StopRefreshLimitRed()
	PlayerData:StopTagRed()
	PlayerData:StopCardRed()
end

function var_0_0.GetItemIsOwned(arg_16_0)
	local var_16_0 = ItemCfg[arg_16_0]
	local var_16_1 = var_16_0.type

	if var_16_1 == ItemConst.ITEM_TYPE.SKIN_CHANGE then
		return var_0_0.getItemNum(arg_16_0) > 0 or HeroTools.GetSkinIsUnlock(var_16_0.param[1])
	elseif var_16_1 == ItemConst.ITEM_TYPE.HERO_SKIN then
		if var_16_0.param[1] then
			return HeroTools.GetSkinIsUnlock(var_16_0.param[1])
		else
			return HeroTools.GetSkinIsUnlock(var_16_0.id)
		end
	elseif var_16_1 == ItemConst.ITEM_TYPE.DYNAMIC_STICKER then
		local var_16_2 = not ChatStickerData:IsLockSticker(var_16_0.param[1])

		return var_0_0.getItemNum(arg_16_0) > 0 or var_16_2
	elseif var_16_1 == ItemConst.ITEM_TYPE.STICKER_BG then
		local var_16_3 = not PlayerData:GetStickerBg(arg_16_0).lock

		return var_0_0.getItemNum(arg_16_0) > 0 or var_16_3
	elseif var_16_1 == ItemConst.ITEM_TYPE.TAG then
		local var_16_4 = PlayerData:GetTagInfo(arg_16_0).unlock == 1

		return var_0_0.getItemNum(arg_16_0) > 0 or var_16_4
	elseif var_16_1 == ItemConst.ITEM_TYPE.CARD_BG then
		local var_16_5 = PlayerData:GetCardBg(arg_16_0).unlock == 1

		return var_0_0.getItemNum(arg_16_0) > 0 or var_16_5
	elseif var_16_1 == ItemConst.ITEM_TYPE.CHAT_BUBBLE then
		local var_16_6 = table.keyof(PlayerData:GetUnlockChatBubbleIDList(), arg_16_0)

		return var_0_0.getItemNum(arg_16_0) > 0 or var_16_6
	elseif var_16_1 == ItemConst.ITEM_TYPE.SCENE then
		return HomeSceneSettingData:GetUsedState(ItemCfg[arg_16_0].param[1]) == SceneConst.HOME_SCENE_TYPE.UNLOCK
	end

	return false
end

function var_0_0.isCanUseItem(arg_17_0)
	local var_17_0 = ItemCfg[arg_17_0]

	return (var_17_0.use == 1 or var_17_0.use == 2) and MaterialConst.MATERIAL_TYPE.MYTHIC_REFRESH ~= var_17_0.sub_type
end

function var_0_0.GetItemSourceList(arg_18_0)
	local var_18_0 = {}
	local var_18_1 = ItemCfg[arg_18_0]
	local var_18_2 = clone(var_18_1.source)

	if var_18_1.type == ItemConst.ITEM_TYPE.HERO_PIECE then
		for iter_18_0, iter_18_1 in ipairs(var_18_2) do
			if iter_18_1[1] == ViewConst.SYSTEM_ID.DRAW then
				table.insert(var_18_0, iter_18_1)
			elseif iter_18_1[1] == ViewConst.SYSTEM_ID.LIMIT_DRAW or iter_18_1[1] == ViewConst.SYSTEM_ID.LIMIT_MUST_DRAW then
				if HeroTools:CanBeDraw(iter_18_1[2]) then
					table.insert(var_18_0, iter_18_1)
				end
			elseif iter_18_1[1] == ViewConst.SYSTEM_ID.NEWS_SHOP or iter_18_1[1] == ViewConst.SYSTEM_ID.DREAM_SHOP then
				local var_18_3 = var_18_1.id - 10000

				if HeroTools.GetHeroIsUnlock(var_18_3) then
					table.insert(var_18_0, iter_18_1)
				end
			else
				table.insert(var_18_0, iter_18_1)
			end
		end
	else
		for iter_18_2, iter_18_3 in ipairs(var_18_2) do
			if not iter_18_3[2] then
				var_18_2[iter_18_2][2] = arg_18_0
			end
		end

		var_18_0 = var_18_2
	end

	local var_18_4 = {}
	local var_18_5 = {}

	for iter_18_4 = #var_18_0, 1, -1 do
		if JumpTools.NeedHide(var_18_0[iter_18_4], arg_18_0) then
			table.remove(var_18_0, iter_18_4)
		end

		if var_18_0[iter_18_4] and var_18_0[iter_18_4][1] == ViewConst.JUMP_SPECIAL_ID.HEROITEM_SPECIAL_SOURCE then
			table.remove(var_18_0, iter_18_4)

			_, var_18_5 = SourceTool.GetJumpDataByHeroSpecialType(arg_18_0)
		elseif var_18_0[iter_18_4] and var_18_0[iter_18_4][1] == ViewConst.JUMP_SPECIAL_ID.SERVANT_SPECIAL_SOURCE then
			table.remove(var_18_0, iter_18_4)

			_, var_18_4 = SourceTool.GetJumpDataByServantSpecialType(arg_18_0)
		elseif var_18_0[iter_18_4] and var_18_0[iter_18_4][1] == ViewConst.JUMP_SPECIAL_ID.GODEATER_SPECIAL_SERVANT then
			table.remove(var_18_0, iter_18_4)

			_, var_18_4 = SourceTool.GetGodEaterSourece(arg_18_0)
		elseif var_18_0[iter_18_4] and var_18_0[iter_18_4][1] == ViewConst.JUMP_SPECIAL_ID.EQUIP_SPECIAL_SOURCE then
			local var_18_6 = SourceTool.GetJumpDataByEquipSpecialType(var_18_0, arg_18_0)

			table.remove(var_18_0, iter_18_4)

			if var_18_6 and var_18_6[1] and not JumpTools.NeedHide(var_18_6, arg_18_0) then
				table.insert(var_18_0, var_18_6)
			end
		end
	end

	for iter_18_5, iter_18_6 in pairs(var_18_4) do
		local var_18_7 = true

		for iter_18_7, iter_18_8 in pairs(var_18_0) do
			if iter_18_8[1] == iter_18_6[1] then
				var_18_7 = false
			end
		end

		if var_18_7 then
			table.insert(var_18_0, iter_18_6)
		end
	end

	for iter_18_9, iter_18_10 in pairs(var_18_5) do
		local var_18_8 = true

		for iter_18_11, iter_18_12 in pairs(var_18_0) do
			if iter_18_12[1] == iter_18_10[1] then
				var_18_8 = false
			end
		end

		if var_18_8 then
			table.insert(var_18_0, iter_18_10)
		end
	end

	return var_18_0
end

function var_0_0.HasOwnAllLimitCardItems(arg_19_0)
	local var_19_0 = ItemCfg[arg_19_0].param
	local var_19_1
	local var_19_2
	local var_19_3
	local var_19_4

	for iter_19_0, iter_19_1 in ipairs(var_19_0) do
		local var_19_5 = ItemCfg[iter_19_1]

		if var_19_5.type == ItemConst.ITEM_TYPE.HERO_SKIN then
			var_19_4 = iter_19_1
		elseif var_19_5.type == ItemConst.ITEM_TYPE.SCENE then
			var_19_3 = iter_19_1
		end
	end

	if var_19_4 and ItemCfg[var_19_4] then
		var_19_2 = ItemCfg[var_19_4].param[1]
	end

	if var_19_3 and ItemCfg[var_19_3] then
		var_19_1 = ItemCfg[var_19_3].param[1]
	end

	local var_19_6 = false
	local var_19_7 = false

	if var_19_2 and var_19_1 then
		local var_19_8 = HeroTools.GetHasOwnedSkin(var_19_2)

		if HomeSceneSettingData:IsHaveScene(var_19_1) and var_19_8 then
			return true
		end
	elseif not var_19_2 and var_19_1 then
		if HomeSceneSettingData:IsHaveScene(var_19_1) then
			return true
		end
	elseif var_19_2 and not var_19_1 and HeroTools.GetHasOwnedSkin(var_19_2) then
		return true
	end

	return false
end

local function var_0_1(arg_20_0, arg_20_1, arg_20_2)
	local var_20_0 = arg_20_2.type
	local var_20_1 = table.indexof(arg_20_0, var_20_0)

	if var_20_1 and arg_20_1[var_20_0] then
		local var_20_2 = table.indexof(arg_20_1[var_20_0], arg_20_2.id)

		if var_20_2 then
			return var_20_1, var_20_2
		else
			return false
		end
	end

	return var_20_1
end

function var_0_0.SortRewardItemList(arg_21_0)
	local var_21_0 = {
		ItemConst.ITEM_TYPE.HERO,
		ItemConst.ITEM_TYPE.HERO_SKIN,
		ItemConst.ITEM_TYPE.SCENE,
		ItemConst.ITEM_TYPE.WEAPON_SERVANT,
		ItemConst.ITEM_TYPE.GIFT,
		ItemConst.ITEM_TYPE.CURRENCY,
		ItemConst.ITEM_TYPE.PORTRAIT,
		ItemConst.ITEM_TYPE.FRAME,
		ItemConst.ITEM_TYPE.STICKER,
		ItemConst.ITEM_TYPE.DORM_FURNITURE
	}
	local var_21_1 = {
		[ItemConst.ITEM_TYPE.CURRENCY] = {
			1,
			30,
			31,
			32
		}
	}

	table.sort(arg_21_0, function(arg_22_0, arg_22_1)
		local var_22_0 = arg_22_0.id
		local var_22_1 = arg_22_1.id
		local var_22_2 = ItemCfg[var_22_0]
		local var_22_3 = ItemCfg[var_22_1]
		local var_22_4, var_22_5 = var_0_1(var_21_0, var_21_1, var_22_2)
		local var_22_6, var_22_7 = var_0_1(var_21_0, var_21_1, var_22_3)

		if var_22_4 and var_22_6 then
			local var_22_8 = var_22_4 == var_22_6

			if var_22_8 and var_22_5 and var_22_7 then
				return var_22_5 < var_22_7
			elseif not var_22_8 then
				return var_22_4 < var_22_6
			end
		elseif var_22_4 ~= var_22_6 then
			return var_22_6 == false
		end

		return rewardSortFunc(arg_22_0, arg_22_1)
	end)

	return arg_21_0
end

local function var_0_2(arg_23_0, arg_23_1, arg_23_2)
	local var_23_0 = arg_23_2.type
	local var_23_1 = table.indexof(arg_23_0, var_23_0)

	if var_23_1 and arg_23_1[var_23_0] then
		local var_23_2 = table.indexof(arg_23_1[var_23_0], arg_23_2.id)

		if var_23_2 then
			return var_23_1, var_23_2
		else
			return false
		end
	end

	return var_23_1
end

function var_0_0.SortRewardItemList(arg_24_0)
	local var_24_0 = {
		ItemConst.ITEM_TYPE.HERO,
		ItemConst.ITEM_TYPE.HERO_SKIN,
		ItemConst.ITEM_TYPE.SCENE,
		ItemConst.ITEM_TYPE.WEAPON_SERVANT,
		ItemConst.ITEM_TYPE.GIFT,
		ItemConst.ITEM_TYPE.CURRENCY,
		ItemConst.ITEM_TYPE.PORTRAIT,
		ItemConst.ITEM_TYPE.FRAME,
		ItemConst.ITEM_TYPE.STICKER,
		ItemConst.ITEM_TYPE.DORM_FURNITURE
	}
	local var_24_1 = {
		[ItemConst.ITEM_TYPE.CURRENCY] = {
			1,
			30,
			31,
			32
		}
	}

	table.sort(arg_24_0, function(arg_25_0, arg_25_1)
		local var_25_0 = arg_25_0.id
		local var_25_1 = arg_25_1.id
		local var_25_2 = ItemCfg[var_25_0]
		local var_25_3 = ItemCfg[var_25_1]
		local var_25_4, var_25_5 = var_0_2(var_24_0, var_24_1, var_25_2)
		local var_25_6, var_25_7 = var_0_2(var_24_0, var_24_1, var_25_3)

		if var_25_4 and var_25_6 then
			local var_25_8 = var_25_4 == var_25_6

			if var_25_8 and var_25_5 and var_25_7 then
				return var_25_5 < var_25_7
			elseif not var_25_8 then
				return var_25_4 < var_25_6
			end
		elseif var_25_4 ~= var_25_6 then
			return var_25_6 == false
		end

		return rewardSortFunc(arg_25_0, arg_25_1)
	end)

	return arg_24_0
end

return var_0_0
