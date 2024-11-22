local var_0_0 = {}
local var_0_1 = import("game.const.ShopConst")
local var_0_2 = 10

function var_0_0.GetShopRedPointKey(arg_1_0)
	return "SHOP_" .. tostring(arg_1_0)
end

function var_0_0.CollectShopInGroup(arg_2_0)
	local var_2_0 = {}

	for iter_2_0, iter_2_1 in ipairs(arg_2_0) do
		var_2_0[iter_2_1] = true
	end

	local var_2_1 = {}

	if next(var_2_0) then
		for iter_2_2, iter_2_3 in ipairs(ShopListCfg.all) do
			if var_2_0[ShopListCfg[iter_2_3].display_group] then
				table.insert(var_2_1, iter_2_3)
			end
		end
	end

	return var_2_1
end

function var_0_0.FilterShopDataList(arg_3_0, arg_3_1)
	arg_3_1 = arg_3_1 or false

	local var_3_0 = {}
	local var_3_1 = ShopData.GetShop(arg_3_0).shopItemIDs

	for iter_3_0, iter_3_1 in pairs(var_3_1) do
		if var_0_0.IsGoodCanDisplay(arg_3_0, iter_3_1, arg_3_1) then
			local var_3_2 = ShopData.GetShop(arg_3_0)[iter_3_1]

			table.insert(var_3_0, {
				id = iter_3_1,
				shopId = arg_3_0,
				buyTime = var_3_2 ~= nil and var_3_2.buy_times or 0,
				next_refresh_timestamp = var_3_2 ~= nil and var_3_2.next_refresh_timestamp or 0
			})
		end
	end

	if arg_3_0 == var_0_1.SHOP_ID.DLC_SHOP then
		var_3_0 = var_0_0.GetFakeShopDataList(var_3_0)
	end

	table.sort(var_3_0, function(arg_4_0, arg_4_1)
		return getShopCfg(arg_4_0.id).shop_sort > getShopCfg(arg_4_1.id).shop_sort
	end)

	return var_3_0
end

function var_0_0.CommonSort(arg_5_0)
	table.sort(arg_5_0, function(arg_6_0, arg_6_1)
		local var_6_0 = getShopCfg(arg_6_0.id)
		local var_6_1 = getShopCfg(arg_6_1.id)
		local var_6_2 = var_0_0.GetGoodStatus(arg_6_0.id)
		local var_6_3 = var_0_0.GetGoodStatus(arg_6_1.id)

		if var_6_2 ~= var_6_3 then
			return var_6_2 < var_6_3
		end

		if var_6_0.shop_sort ~= var_6_1.shop_sort then
			return var_6_0.shop_sort > var_6_1.shop_sort
		end

		return var_6_0.goods_id > var_6_1.goods_id
	end)

	return arg_5_0
end

function var_0_0.GetGoodStatus(arg_7_0)
	local var_7_0 = false
	local var_7_1 = getShopCfg(arg_7_0)
	local var_7_2 = ShopData.GetShop(var_7_1.shop_id)[arg_7_0]

	if ShopData.IsGoodOutOfDate(arg_7_0) then
		return 3
	end

	if var_7_2 ~= nil and var_7_1.limit_num ~= nil and var_7_1.limit_num ~= -1 and var_7_1.limit_num - (var_7_2.buy_times or 0) <= 0 then
		var_7_0 = true
	end

	if var_7_0 then
		return 3
	end

	if ShopData.IsGoodUnlock(arg_7_0) == 0 then
		return 1
	end

	return 0
end

function var_0_0.CheckLevelEnough(arg_8_0)
	local var_8_0 = getShopCfg(arg_8_0)

	if #var_8_0.level_limit > 0 then
		if var_8_0.level_limit[1][1] ~= nil then
			if var_8_0.level_limit[1][1] == 1 and PlayerData:GetPlayerInfo().userLevel < var_8_0.level_limit[1][2] then
				return false
			end
		elseif var_8_0.level_limit[1].type and var_8_0.level_limit[1].type == 1 and PlayerData:GetPlayerInfo().userLevel < var_8_0.level_limit[1].num then
			return false
		end
	end

	return true
end

function var_0_0.IsGoodCanDisplay(arg_9_0, arg_9_1, arg_9_2)
	local var_9_0 = getShopCfg(arg_9_1)
	local var_9_1 = true
	local var_9_2 = true
	local var_9_3 = true
	local var_9_4 = true
	local var_9_5 = var_0_0.CheckSoldOut(arg_9_1)

	if #var_0_0.GetNextGoods(arg_9_1) > 0 and var_9_5 then
		var_9_2 = false
	end

	if var_9_0.pre_goods_id ~= nil and #var_9_0.pre_goods_id > 0 then
		for iter_9_0, iter_9_1 in ipairs(var_9_0.pre_goods_id) do
			local var_9_6 = getShopCfg(iter_9_1)
			local var_9_7 = ShopData.GetShop(arg_9_0)[iter_9_1]

			if var_9_7 ~= nil and var_9_6.limit_num ~= nil and var_9_6.limit_num ~= -1 and var_9_6.limit_num - (var_9_7.buy_times or 0) > 0 then
				var_9_1 = false

				break
			end
		end

		if #var_0_0.GetNextGoods(arg_9_1) == 0 and var_9_5 and not arg_9_2 then
			var_9_3 = false
		end
	end

	local var_9_8 = var_0_0.CheckInSoldTime(arg_9_1)
	local var_9_9 = (not var_0_0.GetIsTakenDown(var_9_0) or false) and (var_9_0.limit_display == 1 or ShopData.IsGoodUnlock(var_9_0.goods_id, arg_9_0) == 1)
	local var_9_10 = false
	local var_9_11 = HideInfoData:GetSkinHideList()[arg_9_1] or false

	if var_9_0.taken_down == 0 and var_9_1 and var_9_2 and var_9_3 and var_9_8 and var_9_9 and not var_9_11 then
		if ShopTools.GetPrice(var_9_0.goods_id) == 0 then
			ShopData.IsGoodUnlock(var_9_0.goods_id)
		end

		return true
	end

	return false
end

function var_0_0.CheckInSoldTime(arg_10_0)
	local var_10_0 = getShopCfg(arg_10_0)
	local var_10_1 = TimeMgr.GetInstance():GetServerTime()
	local var_10_2 = true
	local var_10_3 = true
	local var_10_4 = #var_10_0.open_time < 2 and true or var_10_1 >= TimeMgr.GetInstance():parseTimeFromConfig(var_10_0.open_time)
	local var_10_5 = #var_10_0.close_time < 2 and true or var_10_1 < TimeMgr.GetInstance():parseTimeFromConfig(var_10_0.close_time)

	return var_10_4 and var_10_5
end

function var_0_0.GetIsTakenDown(arg_11_0)
	if arg_11_0.taken_down == 0 then
		local var_11_0 = ItemCfg[arg_11_0.give_id]

		if var_11_0 and var_11_0.type == ItemConst.ITEM_TYPE.HERO_PIECE and HeroTools.GetIsHide(var_11_0.hero_id) then
			return true
		end

		if var_11_0 and var_11_0.type == ItemConst.ITEM_TYPE.WEAPON_SERVANT and ServantTools.GetIsHide(var_11_0.id) then
			return true
		end

		if var_11_0 and var_11_0.type == ItemConst.ITEM_TYPE.EQUIP and EquipTools.GetIsHide(var_11_0.id) then
			return true
		end
	else
		return true
	end

	return false
end

function var_0_0.CheckSoldOut(arg_12_0)
	local var_12_0 = getShopCfg(arg_12_0)
	local var_12_1 = ShopData.GetShop(var_12_0.shop_id)

	if var_12_1 == nil then
		return true
	end

	local var_12_2 = var_12_1[arg_12_0]

	if var_12_2 ~= nil and var_12_0.limit_num ~= nil and var_12_0.limit_num ~= -1 and var_12_0.limit_num - (var_12_2.buy_times or 0) <= 0 then
		return true
	end

	return false
end

function var_0_0.IsGoodCanBuyInShop(arg_13_0, arg_13_1, arg_13_2)
	local var_13_0 = getShopCfg(arg_13_1)
	local var_13_1 = true
	local var_13_2 = true
	local var_13_3 = true
	local var_13_4 = true
	local var_13_5 = var_0_0.CheckSoldOut(arg_13_1)

	if #var_0_0.GetNextGoods(arg_13_1) > 0 and var_13_5 then
		var_13_2 = false
	end

	if var_13_0.pre_goods_id ~= nil and #var_13_0.pre_goods_id > 0 then
		for iter_13_0, iter_13_1 in ipairs(var_13_0.pre_goods_id) do
			local var_13_6 = getShopCfg(iter_13_1)
			local var_13_7 = ShopData.GetShop(arg_13_0)[iter_13_1]

			if var_13_7 ~= nil and var_13_6.limit_num ~= nil and var_13_6.limit_num ~= -1 and var_13_6.limit_num - (var_13_7.buy_times or 0) > 0 then
				var_13_1 = false

				break
			end
		end

		if #var_0_0.GetNextGoods(arg_13_1) == 0 and var_13_5 and not arg_13_2 then
			var_13_3 = false
		end
	end

	local var_13_8 = var_0_0.CheckInSoldTime(arg_13_1)
	local var_13_9 = var_13_0.limit_display == 1 or ShopData.IsGoodUnlock(var_13_0.goods_id, arg_13_0) == 1

	if var_13_0.taken_down == 0 and var_13_1 and var_13_2 and var_13_3 and var_13_8 and var_13_9 then
		if ShopTools.GetPrice(var_13_0.goods_id) == 0 then
			ShopData.IsGoodUnlock(var_13_0.goods_id)
		end

		return true
	end

	return false
end

function var_0_0.IsGoodCanBuy(arg_14_0, arg_14_1, arg_14_2)
	return ShopData.GetShop(arg_14_0)[arg_14_1] and var_0_0.IsGoodCanBuyInShop(arg_14_0, arg_14_1, arg_14_2) and not var_0_0.CheckSoldOut(arg_14_1)
end

function var_0_0.GetNextGoods(arg_15_0)
	return ShopData.GetNextGoods(arg_15_0)
end

function var_0_0.JudgeIsLvLimit(arg_16_0)
	local var_16_0 = PlayerData:GetPlayerInfo().userLevel

	for iter_16_0, iter_16_1 in ipairs(arg_16_0) do
		if var_0_1.SHOP_LIMIT.PLAYER_LV == iter_16_1[1] and var_16_0 < iter_16_1[2] then
			return true, iter_16_1
		end
	end

	return false
end

function var_0_0.HaveSkin(arg_17_0)
	local var_17_0 = SkinCfg[arg_17_0].hero
	local var_17_1 = HeroData:GetHeroData(var_17_0)
	local var_17_2 = {}

	for iter_17_0, iter_17_1 in ipairs(var_17_1.unlocked_skin) do
		if iter_17_1.skin_id == arg_17_0 and iter_17_1.time == 0 then
			return true
		end
	end

	return false
end

function var_0_0.GetCostLevel(arg_18_0)
	local var_18_0 = getShopCfg(arg_18_0)

	if var_0_0.GetCostCfg(arg_18_0).type == ItemConst.ITEM_TYPE.CURRENCY then
		if var_18_0.cost_id == CurrencyConst.CURRENCY_TYPE_RECHARGE_DIAMOND_FREE or var_18_0.cost_id == CurrencyConst.GetPlatformDiamondId() then
			return var_0_1.COST_LEVEL.FREE_DIAMOND
		else
			return var_0_1.COST_LEVEL.RECHARGE_DIAMOND
		end
	else
		return var_0_1.COST_LEVEL.MATERIAL
	end
end

function var_0_0.DiamondEnoughMessageBox()
	ShowMessageBox({
		isTop = true,
		title = GetTips("PROMPT"),
		content = GetTips("ERROR_RECHARGE_DIAMOND_NOT_ENOUGH"),
		OkCallback = function()
			SDKTools.SendPaymentMessageToSDK("payment_touch", {
				payment_pay_flower_check = 0
			})
			JumpTools.GoToSystem("/rechargeMain", {
				childShopIndex = 2,
				page = 3
			}, ViewConst.SYSTEM_ID.RECHARGE_MAIN)
		end,
		CancelCallback = function()
			SDKTools.SendPaymentMessageToSDK("payment_touch", {
				payment_pay_flower_check = 1
			})
		end
	})
end

function var_0_0.DefaultOpenPopUp(arg_22_0)
	JumpTools.OpenPopUp("rechargeDiamondExchange", {
		getBaseNum = 1,
		useBaseNum = 1,
		useId = CurrencyConst.CURRENCY_TYPE_RECHARGE_DIAMOND_FREE,
		getId = CurrencyConst.CURRENCY_TYPE_DIAMOND,
		defaultNum = arg_22_0
	}, ViewConst.SYSTEM_ID.RECHARGE_DIAMOND_EXCHANGE)
end

function var_0_0.CostEnoughJump(arg_23_0)
	if arg_23_0 == var_0_1.COST_LEVEL.FREE_DIAMOND then
		var_0_0.DiamondEnoughMessageBox()
	elseif arg_23_0 == var_0_1.COST_LEVEL.RECHARGE_DIAMOND then
		var_0_0.DefaultOpenPopUp(0)
	elseif arg_23_0 == var_0_1.COST_LEVEL.MATERIAL then
		ShowTips("ERROR_ITEM_NOT_ENOUGH_MATERIAL")
	end
end

function var_0_0.ConfirmBuyItem(arg_24_0, arg_24_1, arg_24_2, arg_24_3, arg_24_4)
	local var_24_0 = getShopCfg(arg_24_0)
	local var_24_1 = var_24_0.give_id and ItemCfg[var_24_0.give_id] or RechargeShopDescriptionCfg[var_24_0.description]
	local var_24_2 = var_0_0.GetCostCfg(arg_24_0)
	local var_24_3 = var_0_0.GetCostCount(arg_24_0)
	local var_24_4, var_24_5, var_24_6 = var_0_0.GetPrice(arg_24_0)
	local var_24_7 = var_0_0.GetCostLevel(arg_24_0)
	local var_24_8 = ""
	local var_24_9 = string.format(GetTips("CONFIRM_BUY"), GetI18NText(var_24_2.name), var_24_4 * arg_24_1, GetI18NText(var_24_1.name), arg_24_1)

	ShowMessageBox({
		title = GetTips("PROMPT"),
		content = var_24_9,
		OkCallback = function()
			if var_24_3 < var_24_4 * arg_24_1 then
				var_0_0.CostEnoughJump(var_24_7)
			else
				if ShopData.IsGoodOutOfDate(arg_24_0) then
					ShowTips("GOODS_HAS_BEEN_REMOVED")

					return
				end

				if arg_24_2 then
					arg_24_2(arg_24_0)
				end

				ShopAction.BuyItem({
					{
						goodID = arg_24_0,
						buyNum = arg_24_1
					}
				}, var_24_4, arg_24_4)
			end
		end,
		CancelCallback = arg_24_3
	})
end

function var_0_0.ConfirmBuySkin(arg_26_0, arg_26_1, arg_26_2, arg_26_3, arg_26_4)
	local var_26_0 = 0
	local var_26_1
	local var_26_2 = ""
	local var_26_3 = var_0_0.GetCostCount(arg_26_0[1])
	local var_26_4 = var_0_0.GetCostLevel(arg_26_0[1])
	local var_26_5 = {}

	for iter_26_0, iter_26_1 in ipairs(arg_26_0) do
		local var_26_6 = getShopCfg(iter_26_1)
		local var_26_7 = var_26_6.give_id and ItemCfg[var_26_6.give_id] or RechargeShopDescriptionCfg[var_26_6.description]
		local var_26_8 = var_0_0.GetCostCfg(iter_26_1)
		local var_26_9, var_26_10, var_26_11 = var_0_0.GetPrice(iter_26_1)

		var_26_0 = var_26_0 + var_26_9 * arg_26_1[iter_26_0]
		var_26_1 = var_26_8

		if iter_26_0 == 1 then
			var_26_2 = GetI18NText(var_26_7.name)
		else
			var_26_2 = var_26_2 .. "+" .. GetI18NText(var_26_7.name)
		end

		table.insert(var_26_5, {
			goodID = iter_26_1,
			buyNum = arg_26_1[iter_26_0]
		})
	end

	ShowMessageBox({
		title = GetTips("PROMPT"),
		content = string.format(GetTips("CONFIRM_BUY"), GetI18NText(var_26_1.name), var_26_0, var_26_2, arg_26_1[1]),
		OkCallback = function()
			if var_26_3 < var_26_0 then
				var_0_0.CostEnoughJump(var_26_4)
			else
				for iter_27_0, iter_27_1 in ipairs(arg_26_0) do
					if ShopData.IsGoodOutOfDate(iter_27_1) then
						ShowTips("GOODS_HAS_BEEN_REMOVED")

						return
					end
				end

				ShopAction.BuyItem(var_26_5, nil, arg_26_4)
			end
		end,
		CancelCallback = arg_26_3
	})
end

function var_0_0.GetCostCount(arg_28_0)
	local var_28_0 = getShopCfg(arg_28_0)
	local var_28_1 = var_28_0.cost_id

	if var_28_1 == 0 then
		var_28_1 = var_28_0.cheap_cost_id
	end

	return ItemTools.getItemNum(var_28_1)
end

function var_0_0.GetCostCfg(arg_29_0)
	local var_29_0 = getShopCfg(arg_29_0)

	return ItemCfg[var_29_0.cost_id]
end

function var_0_0.GetCostId(arg_30_0)
	local var_30_0, var_30_1, var_30_2 = ShopTools.IsOnDiscountArea(arg_30_0)
	local var_30_3

	if var_30_0 and var_30_2 then
		var_30_3 = getShopCfg(arg_30_0).cheap_cost_id
	else
		var_30_3 = getShopCfg(arg_30_0).cost_id
	end

	return var_30_3
end

function var_0_0.IsOnDiscountArea(arg_31_0)
	local var_31_0 = getShopCfg(arg_31_0)
	local var_31_1 = ShopListCfg[var_31_0.shop_id]

	if var_0_0.GetDiscount(arg_31_0) ~= 100 then
		if #var_31_0.cheap_close_time > 0 then
			local var_31_2 = TimeMgr.GetInstance():GetServerTime()
			local var_31_3 = TimeMgr.GetInstance():parseTimeFromConfig(var_31_0.cheap_open_time)
			local var_31_4 = TimeMgr.GetInstance():parseTimeFromConfig(var_31_0.cheap_close_time)

			if var_31_3 <= var_31_2 and var_31_2 <= var_31_4 then
				return true, true, true
			elseif var_31_1 and #var_31_1.cheap_close_time > 0 then
				local var_31_5 = TimeMgr.GetInstance():GetServerTime()
				local var_31_6 = TimeMgr.GetInstance():parseTimeFromConfig(var_31_1.cheap_open_time)
				local var_31_7 = TimeMgr.GetInstance():parseTimeFromConfig(var_31_1.cheap_close_time)

				if var_31_6 <= var_31_5 and var_31_5 <= var_31_7 then
					return true, true, true
				else
					return true, true, false
				end
			end
		elseif var_31_1 and #var_31_1.cheap_close_time > 0 then
			local var_31_8 = TimeMgr.GetInstance():GetServerTime()
			local var_31_9 = TimeMgr.GetInstance():parseTimeFromConfig(var_31_1.cheap_open_time)
			local var_31_10 = TimeMgr.GetInstance():parseTimeFromConfig(var_31_1.cheap_close_time)

			if var_31_9 <= var_31_8 and var_31_8 <= var_31_10 then
				return true, true, true
			else
				return true, true, false
			end
		else
			return true, false, true
		end
	else
		return false, false, false
	end
end

function var_0_0.GetPrice(arg_32_0)
	local var_32_0 = var_0_0.GetDiscountPrice(arg_32_0)
	local var_32_1 = var_0_0.GetOriPrice(arg_32_0)
	local var_32_2, var_32_3, var_32_4 = var_0_0.IsOnDiscountArea(arg_32_0)
	local var_32_5 = var_32_0 == var_32_1 and 1 or var_32_0 / var_32_1
	local var_32_6 = SettingData:GetCurrentLanguage()

	if var_32_6 == "fr" or var_32_6 == "de" then
		var_32_0 = string.gsub(tostring(var_32_0), "%.", ",")
	end

	if var_32_2 and var_32_4 then
		return var_32_0, var_32_1, var_32_5
	else
		return var_32_1, var_32_1, 1
	end
end

function var_0_0.IsRMB(arg_33_0)
	return getShopCfg(arg_33_0).cost_type == 1
end

function var_0_0.IsSkin(arg_34_0)
	return getShopCfg(arg_34_0).cost_type == 3
end

function var_0_0.GetDiscountLabel(arg_35_0)
	local var_35_0 = var_0_0.GetDiscount(arg_35_0)

	if SDKTools.GetIsThisServer({
		"jp"
	}) then
		return GetTips("LABEL_DISCOUNT_EXTRA")
	elseif SDKTools.GetIsThisServer({
		"kr",
		"en"
	}) then
		return string.format("%d%%%s", 100 - var_35_0, GetTips("LABEL_DISCOUNT"))
	end

	return string.format("%.1f%s", var_35_0 / 10, GetTips("LABEL_DISCOUNT"))
end

function var_0_0.GetDiscount(arg_36_0)
	local var_36_0 = getShopCfg(arg_36_0)
	local var_36_1 = ShopListCfg[var_36_0.shop_id]
	local var_36_2
	local var_36_3

	if var_36_0 and var_36_0.is_limit_time_discount and var_36_0.is_limit_time_discount == 1 then
		if var_0_0.IsRMB(arg_36_0) then
			local var_36_4 = PaymentCfg[var_36_0.cost_id].cost
			local var_36_5 = PaymentCfg[var_36_0.cheap_cost_id].cost

			var_36_2 = math.ceil(100 * var_36_5 / var_36_4)
		else
			var_36_2 = math.ceil(100 * var_36_0.cheap_cost / var_36_0.cost)
		end
	elseif var_36_0 and var_36_0.discount and var_36_0.discount ~= 0 then
		var_36_2 = var_36_0.discount
	else
		var_36_2 = 100
	end

	if var_36_2 == 100 then
		var_36_3 = var_36_0.cost_id
	else
		var_36_3 = var_36_0.cheap_cost_id
	end

	if var_36_1 and var_36_1.is_limit_time_discount == 1 then
		if var_36_1.is_limit_buy_discount == 0 and var_36_0.limit_num ~= nil and var_36_0.limit_num ~= -1 then
			return var_36_2
		end

		if var_36_1.cheap_limit_currency[1] == 1 then
			if table.indexof(var_36_1.cheap_limit_currency[2], var_36_3) then
				var_36_2 = math.min(var_36_1.discount, var_36_2)
			end
		elseif var_36_1.cheap_limit_currency[1] == 2 then
			if not table.indexof(var_36_1.cheap_limit_currency[2], var_36_3) then
				var_36_2 = math.min(var_36_1.discount, var_36_2)
			end
		else
			var_36_2 = math.min(var_36_1.discount, var_36_2)
		end
	end

	return var_36_2
end

function var_0_0.GetOriPrice(arg_37_0)
	local var_37_0 = getShopCfg(arg_37_0)
	local var_37_1 = var_0_0.GetDiscount(arg_37_0)
	local var_37_2 = ShopListCfg[var_37_0.shop_id]

	if var_37_1 == 100 or var_37_0 and var_37_0.is_limit_time_discount and var_37_0.is_limit_time_discount == 1 or var_37_0.cheap_cost == 0 then
		if var_0_0.IsRMB(arg_37_0) then
			return PaymentCfg[var_37_0.cost_id].cost / 100
		else
			return var_37_0.cost
		end
	else
		local var_37_3

		if var_0_0.IsRMB(arg_37_0) then
			var_37_3 = PaymentCfg[var_37_0.cheap_cost_id].cost / 100
		else
			var_37_3 = var_37_0.cheap_cost
		end

		if var_37_2.is_limit_time_discount == 1 and var_37_1 >= var_37_2.discount then
			return math.ceil(var_37_3 * 100 / var_37_0.discount)
		else
			return math.ceil(var_37_3 * 100 / var_37_1)
		end
	end
end

function var_0_0.GetMoneySymbol(arg_38_0)
	local var_38_0 = getShopCfg(arg_38_0)

	if var_0_0.IsRMB(arg_38_0) and PaymentCfg[var_38_0.cost_id] then
		return PaymentCfg[var_38_0.cost_id].currency_symbol
	end

	return ""
end

function var_0_0.GetDiscountPrice(arg_39_0)
	local var_39_0 = getShopCfg(arg_39_0)
	local var_39_1 = var_0_0.GetOriPrice(arg_39_0)
	local var_39_2 = ShopListCfg[var_39_0.shop_id]

	if var_0_0.GetDiscount(arg_39_0) ~= 100 then
		if var_0_0.IsRMB(arg_39_0) then
			if var_39_0.cheap_cost_id == 0 then
				return PaymentCfg[var_39_0.cost_id].cost / 100
			else
				return PaymentCfg[var_39_0.cheap_cost_id].cost / 100
			end
		else
			if var_39_2 and var_39_2.discount ~= 0 then
				local var_39_3 = var_39_2.discount * var_39_1 * 100 / 10000
				local var_39_4 = math.floor(var_39_3)
				local var_39_5 = var_39_4 == var_39_3

				if var_39_0.cheap_cost == 0 then
					return var_39_5 and math.max(var_39_4, 1) or var_39_4
				elseif var_39_2.is_limit_buy_discount == 0 and var_39_0.limit_num > 0 then
					return var_39_0.cheap_cost
				else
					return math.min(var_39_5 and math.max(var_39_4, 1) or var_39_4, var_39_0.cheap_cost)
				end
			end

			return var_39_0.cheap_cost
		end
	else
		return var_39_1
	end
end

function var_0_0.IsShopOpen(arg_40_0)
	local var_40_0 = ShopListCfg[arg_40_0]

	if var_40_0.activity_id == 0 then
		return true, 0
	elseif ActivityData:GetActivityIsOpen(var_40_0.activity_id) then
		return true, 1
	else
		local var_40_1 = ActivityData:GetActivityData(var_40_0.activity_id)
		local var_40_2 = manager.time:GetServerTime()

		if var_40_1 and var_40_2 < var_40_1.startTime then
			return false, 3
		else
			return false, 2
		end
	end
end

function var_0_0.GetGoodsIDListByItemID(arg_41_0, arg_41_1)
	local var_41_0 = {}

	if #getShopIDListByShopID(arg_41_0) > 0 then
		local var_41_1 = getShopIDListByShopID(arg_41_0)

		for iter_41_0, iter_41_1 in ipairs(var_41_1) do
			if getShopCfg(iter_41_1).give_id == arg_41_1 then
				table.insert(var_41_0, iter_41_1)
			end
		end
	end

	return var_41_0
end

function var_0_0.IsGoodCanExchange(arg_42_0, arg_42_1)
	for iter_42_0, iter_42_1 in ipairs(arg_42_1) do
		if var_0_0.IsGoodCanDisplay(arg_42_0, iter_42_1) then
			return true
		end
	end

	return false
end

function var_0_0.CheckShopIsUnLock(arg_43_0)
	if arg_43_0 then
		local var_43_0 = ShopListCfg[arg_43_0].open_condition

		if var_43_0 and var_43_0 > 0 and ShopListCfg[arg_43_0].display_group == 18 then
			return IsConditionAchieved(var_43_0)
		end
	end

	return true
end

function var_0_0.GetShopIsUnLockDesc(arg_44_0)
	local var_44_0 = ShopListCfg[arg_44_0].open_condition

	if var_44_0 and var_44_0 > 0 and ShopListCfg[arg_44_0].display_group == 18 then
		local var_44_1, var_44_2, var_44_3 = IsConditionAchieved(var_44_0)
		local var_44_4 = string.format(GetTips("ACTIVITY_CLUB_SP_SHOP_UNLOCK_PROGRESS"), tostring(var_44_2), tostring(var_44_3))

		return GuildActivityTools.GetGuildSpConditionDesc(var_44_0) .. GetTips("DORM_CANTEEN_LEVEL_UNLOCK") .. var_44_4
	end
end

function var_0_0.CheckDlcPurchased(arg_45_0)
	local var_45_0 = getShopCfg(arg_45_0)

	if not var_45_0 then
		return true
	end

	local var_45_1 = var_45_0.give_id or var_45_0.description

	if not var_45_0.give then
		local var_45_2 = 1
	end

	local var_45_3
	local var_45_4

	if var_45_0.description then
		local var_45_5 = var_45_0.description

		var_45_4 = RechargeShopDescriptionCfg[var_45_5]
	else
		var_45_4 = ItemCfg[var_45_1]
	end

	if var_45_4 and var_45_4.type == ItemConst.ITEM_TYPE.SCENE and (SceneConst.HOME_SCENE_TYPE.LOCK == HomeSceneSettingData:GetUsedState(var_45_4.id) or SceneConst.HOME_SCENE_TYPE.TRIAL == HomeSceneSettingData:GetUsedState(var_45_4.id)) then
		return false
	end

	return true
end

function var_0_0.CheckDlcPurchasedByItemID(arg_46_0)
	local var_46_0 = ItemCfg[arg_46_0]

	if var_46_0 and var_46_0.type == ItemConst.ITEM_TYPE.SCENE and (SceneConst.HOME_SCENE_TYPE.LOCK == HomeSceneSettingData:GetUsedState(var_46_0.id) or SceneConst.HOME_SCENE_TYPE.TRIAL == HomeSceneSettingData:GetUsedState(var_46_0.id)) then
		return false
	end

	return true
end

function var_0_0.CheckDlcTrialByItemID(arg_47_0)
	local var_47_0 = ItemCfg[arg_47_0]

	if var_47_0 and var_47_0.type == ItemConst.ITEM_TYPE.SCENE and SceneConst.HOME_SCENE_TYPE.TRIAL == HomeSceneSettingData:GetUsedState(var_47_0.id) then
		return true
	end

	return false
end

function var_0_0.GetFragmentList()
	local var_48_0 = {}
	local var_48_1 = HeroTools.GetCanExchangeHero()

	for iter_48_0 = 1, #var_48_1 do
		local var_48_2 = var_48_1[iter_48_0]
		local var_48_3 = ItemCfg[var_48_2.id].rare - 2
		local var_48_4 = GameSetting.fragment_break_num.value[var_48_3]

		var_48_0[var_48_4[1]] = (var_48_0[var_48_4[1]] or 0) + var_48_2.number * var_48_4[2]
	end

	local var_48_5 = {}

	for iter_48_1, iter_48_2 in pairs(var_48_0) do
		if iter_48_2 > 0 then
			table.insert(var_48_5, {
				id = iter_48_1,
				num = iter_48_2
			})
		end
	end

	return var_48_5
end

function var_0_0.CheckGiftSkinOwn(arg_49_0)
	local var_49_0 = getShopCfg(arg_49_0)
	local var_49_1 = RechargeShopDescriptionCfg[var_49_0.description]

	if var_49_1.sub_type == ItemConst.ITEM_SUB_TYPE.SHOP_PACKS then
		for iter_49_0, iter_49_1 in ipairs(var_49_1.param) do
			if iter_49_1[1] then
				local var_49_2 = ItemCfg[iter_49_1[1]]

				if ItemTools.getItemNum(iter_49_1[1]) == 1 and var_49_2.type == ItemConst.ITEM_TYPE.HERO_SKIN and ShopTools.HaveSkin(iter_49_1[1]) then
					return true
				end
			end
		end
	end

	return false
end

function var_0_0.SplitDataByShopID(arg_50_0, arg_50_1)
	local var_50_0 = ShopListCfg[arg_50_1]
	local var_50_1 = {
		{},
		{},
		{},
		{},
		{}
	}
	local var_50_2 = {}

	for iter_50_0, iter_50_1 in ipairs(arg_50_0) do
		local var_50_3 = getShopCfg(iter_50_1.id)
		local var_50_4 = ItemCfg[var_50_3.give_id]

		if var_50_3.shop_refresh == 4 and var_50_4.type == ItemConst.ITEM_TYPE.HERO_PIECE then
			table.insert(var_50_1[5], iter_50_1)
		elseif var_50_4.type == ItemConst.ITEM_TYPE.HERO_PIECE then
			table.insert(var_50_1[4], iter_50_1)
		elseif var_50_4.type == ItemConst.ITEM_TYPE.EQUIP then
			table.insert(var_50_1[3], iter_50_1)
		elseif var_50_4.type == ItemConst.ITEM_TYPE.WEAPON_SERVANT then
			table.insert(var_50_1[2], iter_50_1)
		else
			table.insert(var_50_1[1], iter_50_1)
		end
	end

	local var_50_5 = {
		false,
		false,
		false,
		false,
		false
	}

	for iter_50_2, iter_50_3 in ipairs(var_50_0.shop_label) do
		var_50_5[iter_50_3] = true
	end

	for iter_50_4, iter_50_5 in ipairs(var_50_1) do
		if var_50_5[iter_50_4] == false then
			for iter_50_6, iter_50_7 in ipairs(var_50_1[iter_50_4]) do
				table.insert(var_50_1[1], iter_50_5)
			end

			var_50_1[iter_50_4] = {}
		end
	end

	for iter_50_8, iter_50_9 in ipairs(var_50_1) do
		if #iter_50_9 > 0 then
			var_0_0.CommonSort(iter_50_9)
		end
	end

	local var_50_6 = {}

	for iter_50_10, iter_50_11 in ipairs(var_50_1[3]) do
		local var_50_7 = getShopCfg(iter_50_11.id)
		local var_50_8 = EquipCfg[var_50_7.give_id]

		if var_50_6[var_50_8.suit] == nil then
			var_50_6[var_50_8.suit] = {}
		end

		if var_50_6[var_50_8.suit][var_50_8.starlevel] == nil then
			var_50_6[var_50_8.suit][var_50_8.starlevel] = {}
		end

		table.insert(var_50_6[var_50_8.suit][var_50_8.starlevel], iter_50_11)
	end

	local var_50_9 = {}

	for iter_50_12, iter_50_13 in pairs(var_50_6) do
		table.insert(var_50_9, iter_50_12)
	end

	local var_50_10 = {}

	for iter_50_14, iter_50_15 in ipairs(EquipSuitCfg.all) do
		if var_50_6[iter_50_15] then
			for iter_50_16, iter_50_17 in pairs(var_50_6[iter_50_15]) do
				table.insert(var_50_10, iter_50_17)
			end
		end
	end

	if #var_50_10 == 0 or #var_50_10[1] == 6 then
		var_50_1[3] = var_50_10
	end

	local var_50_11 = {}

	for iter_50_18, iter_50_19 in ipairs(var_50_1) do
		if #iter_50_19 ~= 0 then
			table.insert(var_50_2, iter_50_18)
		end
	end

	for iter_50_20, iter_50_21 in ipairs(var_50_0.shop_label) do
		if #var_50_1[iter_50_21] ~= 0 then
			table.insert(var_50_11, var_50_1[iter_50_21])
		end
	end

	return var_50_11, var_50_2, var_50_9
end

function var_0_0.IsPC()
	return GameToSDK.IsPCPlatform()
end

function var_0_0.IsLimitRecharge()
	return var_0_0.IsPC() and _G.CHANNEL_MASTER_ID ~= 1
end

function var_0_0.CheckDlcCanBuy(arg_53_0)
	if arg_53_0 == nil or arg_53_0 == 0 then
		return false
	end

	local var_53_0 = getShopCfg(arg_53_0)

	if not var_53_0 then
		return false
	end

	return var_0_1.SHOP_ID.DLC_SHOP == var_53_0.shop_id
end

function var_0_0.JumpToSkinShop(arg_54_0, arg_54_1, arg_54_2, arg_54_3)
	local var_54_0 = 0
	local var_54_1

	if not arg_54_1 then
		var_54_0 = var_0_0.GetGoodsIdBySkinId(arg_54_0)
	else
		var_54_0, var_54_1 = var_0_0.GetGoodsIdByDlcId(arg_54_3)
	end

	if var_54_0 == 0 then
		ShowTips(GetTips("ERROR_SHOP_GOODS_OPEN_TIME"))

		return
	end

	local var_54_2 = getShopCfg(var_54_0)

	if not var_54_2 then
		ShowTips(GetTips("ERROR_SHOP_GOODS_OPEN_TIME"))

		return
	end

	local var_54_3 = false

	if ShopTools.CheckShopIsUnLock(var_54_2.shop_id) and ShopTools.IsGoodCanDisplay(var_54_2.shop_id, var_54_2.goods_id) then
		var_54_3 = true
	end

	if var_54_3 then
		local var_54_4 = ShopListCfg[var_54_2.shop_id]

		JumpTools.GoToSystem("/rechargeMain", {
			page = var_54_4.display_group,
			shopListId = var_54_4.id
		}, var_54_4.system)

		local var_54_5 = SkinCfg[arg_54_0]

		if var_54_1 == var_0_1.SHOP_ID.PASSPORT_SHOP then
			JumpTools.OpenPageByJump("shop", {
				goodID = var_54_2.goods_id,
				heroID = var_54_5.hero,
				skinID = arg_54_0,
				shopID = var_54_2.shop_id
			})
		else
			JumpTools.OpenPageByJump("/heroSkinPreview", {
				isShop = true,
				heroID = var_54_5.hero,
				skinID = var_54_5.id,
				goodId = var_54_2.goods_id,
				shopID = var_54_2.shop_id,
				isDlc = arg_54_1
			})
		end
	else
		ShowTips(GetTips("ERROR_SHOP_GOODS_OPEN_TIME"))
	end
end

function var_0_0.CheckGiveIsOwn(arg_55_0, arg_55_1)
	local function var_55_0(arg_56_0, arg_56_1)
		arg_56_1 = arg_56_1 or 0

		local var_56_0 = ItemCfg[arg_56_0]

		if ItemTools.getItemNum(arg_56_0) + arg_56_1 >= var_56_0.limit then
			return false
		end

		return true
	end

	local var_55_1 = getShopCfg(arg_55_0)

	if var_55_1.description then
		local var_55_2 = RechargeShopDescriptionCfg[var_55_1.description]

		if var_55_2.sub_type == ItemConst.ITEM_SUB_TYPE.SHOP_PACKS then
			for iter_55_0, iter_55_1 in ipairs(var_55_2.param) do
				if var_55_0(iter_55_1[1], iter_55_1[2] * arg_55_1) == false then
					return false
				end
			end

			return true
		else
			return var_55_0(var_55_1.description, arg_55_1)
		end
	else
		return var_55_0(var_55_1.give_id, arg_55_1)
	end

	return false
end

function var_0_0.GetGoodsIdBySkinId(arg_57_0)
	local var_57_0 = var_0_0.FilterShopDataList(var_0_1.SHOP_ID.SKIN_SHOP)

	for iter_57_0, iter_57_1 in pairs(var_57_0) do
		if getShopCfg(iter_57_1.id).description == arg_57_0 then
			return iter_57_1.id
		end
	end
end

function var_0_0.GetGoodsIdByDlcId(arg_58_0)
	local var_58_0 = var_0_0.FilterShopDataList(var_0_1.SHOP_ID.SKIN_SHOP)

	for iter_58_0, iter_58_1 in pairs(var_58_0) do
		if getShopCfg(iter_58_1.id).description == arg_58_0 then
			return iter_58_1.id, var_0_1.SHOP_ID.SKIN_SHOP
		end
	end

	local var_58_1 = var_0_0.FilterShopDataList(var_0_1.SHOP_ID.PASSPORT_SHOP)

	for iter_58_2, iter_58_3 in pairs(var_58_1) do
		if getShopCfg(iter_58_3.id).give_id == arg_58_0 then
			return iter_58_3.id, var_0_1.SHOP_ID.PASSPORT_SHOP
		end
	end
end

function var_0_0.CheckGoodsOwen(arg_59_0)
	local var_59_0 = getShopCfg(arg_59_0)

	if var_59_0.shop_refresh ~= 3 then
		local var_59_1 = ItemCfg[var_59_0.give_id]

		if var_59_1.num_exchange_item then
			return ItemTools.getItemNum(var_59_0.give_id) >= var_59_1.limit
		end
	else
		local var_59_2 = RechargeShopDescriptionCfg[var_59_0.description]

		if var_59_2.sub_type == ItemConst.ITEM_SUB_TYPE.SHOP_PACKS then
			for iter_59_0, iter_59_1 in ipairs(RechargeShopDescriptionCfg[var_59_0.description].param) do
				local var_59_3 = ItemCfg[iter_59_1[1]]

				if var_59_3.num_exchange_item and ItemTools.getItemNum(iter_59_1[1]) >= var_59_3.limit then
					return true
				end
			end
		elseif var_59_2.sub_type == ItemConst.ITEM_SUB_TYPE.SHOP_SEVEN_PACKS then
			for iter_59_2, iter_59_3 in pairs(var_59_2.param[2]) do
				local var_59_4 = ItemCfg[iter_59_3[1]]

				if var_59_4.num_exchange_item and ItemTools.getItemNum(iter_59_3[1]) >= var_59_4.limit then
					return true
				end
			end
		end
	end

	return false
end

function var_0_0.rewertReward(arg_60_0, arg_60_1)
	local var_60_0 = {}
	local var_60_1 = getShopCfg(arg_60_0)

	if var_60_1.description then
		local var_60_2 = RechargeShopDescriptionCfg[var_60_1.description]

		if var_60_2.sub_type == ItemConst.ITEM_SUB_TYPE.SHOP_PACKS then
			for iter_60_0, iter_60_1 in pairs(var_60_2.param) do
				table.insert(var_60_0, {
					id = iter_60_1[1],
					num = iter_60_1[2] * arg_60_1
				})
			end
		elseif var_60_2.sub_type == ItemConst.ITEM_SUB_TYPE.SHOP_SEVEN_PACKS then
			for iter_60_2, iter_60_3 in pairs(var_60_2.param[2]) do
				table.insert(var_60_0, {
					id = iter_60_3[1],
					num = iter_60_3[2] * arg_60_1 * var_60_2.param[3]
				})
			end
		end
	else
		table.insert(var_60_0, {
			id = var_60_1.give_id,
			num = var_60_1.give * arg_60_1
		})
	end

	local var_60_3 = {}
	local var_60_4 = {}

	for iter_60_4, iter_60_5 in ipairs(var_60_0) do
		local var_60_5 = ItemCfg[iter_60_5.id]

		if var_60_5.num_exchange_item and ItemTools.getItemNum(iter_60_5.id) + iter_60_5.num > var_60_5.limit then
			if ItemTools.getItemNum(iter_60_5.id) > var_60_5.limit then
				table.insert(var_60_3, {
					id = iter_60_5.id,
					num = iter_60_5.num
				})
				table.insert(var_60_4, {
					id = var_60_5.num_exchange_item[1][1],
					num = iter_60_5.num * var_60_5.num_exchange_item[1][2]
				})
			else
				table.insert(var_60_3, {
					id = iter_60_5.id,
					num = ItemTools.getItemNum(iter_60_5.id) + iter_60_5.num - var_60_5.limit
				})
				table.insert(var_60_4, {
					id = var_60_5.num_exchange_item[1][1],
					num = (ItemTools.getItemNum(iter_60_5.id) + iter_60_5.num - var_60_5.limit) * var_60_5.num_exchange_item[1][2]
				})
			end
		end
	end

	local var_60_6 = formatRewardCfgList(var_60_4)
	local var_60_7 = mergeReward(var_60_6)

	return var_60_3, var_60_7
end

function var_0_0.revertGoodsReward(arg_61_0)
	local var_61_0 = {}

	for iter_61_0, iter_61_1 in ipairs(arg_61_0) do
		local var_61_1 = ItemCfg[iter_61_1[1]]

		if var_61_1.num_exchange_item then
			if ItemTools.getItemNum(iter_61_1[1]) > var_61_1.limit then
				if ItemTools.getItemNum(iter_61_1[1]) - iter_61_1[2] >= var_61_1.limit then
					table.insert(var_61_0, {
						var_61_1.num_exchange_item[1][1],
						iter_61_1[2] * var_61_1.num_exchange_item[1][2]
					})
				else
					table.insert(var_61_0, {
						iter_61_1[1],
						var_61_1.limit - ItemTools.getItemNum(iter_61_1[1]) + iter_61_1[2]
					})
					table.insert(var_61_0, {
						var_61_1.num_exchange_item[1][1],
						(ItemTools.getItemNum(iter_61_1[1]) - var_61_1.limit) * var_61_1.num_exchange_item[1][2]
					})
				end
			end
		else
			table.insert(var_61_0, {
				iter_61_1[1],
				iter_61_1[2]
			})
		end
	end

	return var_61_0
end

function var_0_0.IsShopDiscount(arg_62_0)
	local var_62_0 = ShopListCfg[arg_62_0]

	if #var_62_0.cheap_close_time > 0 then
		local var_62_1 = TimeMgr.GetInstance():GetServerTime()
		local var_62_2 = TimeMgr.GetInstance():parseTimeFromConfig(var_62_0.cheap_open_time)
		local var_62_3 = TimeMgr.GetInstance():parseTimeFromConfig(var_62_0.cheap_close_time)

		if var_62_2 <= var_62_1 and var_62_1 <= var_62_3 then
			return true
		end

		return false
	end
end

function var_0_0.IsAnyShopDiscount(arg_63_0)
	for iter_63_0, iter_63_1 in ipairs(arg_63_0) do
		if var_0_0.IsShopDiscount(iter_63_1) then
			return true
		end
	end

	return false
end

function var_0_0.GetSkinIdByDlcGoodsId(arg_64_0)
	return SkinSceneActionCfg.get_id_list_by_special_scene_id[RechargeShopDescriptionCfg[getShopCfg(arg_64_0).description].param[1]][1]
end

function var_0_0.GetFakeShopDataList(arg_65_0)
	local var_65_0 = clone(arg_65_0)

	for iter_65_0, iter_65_1 in ipairs(arg_65_0) do
		local var_65_1 = getShopCfg(iter_65_1.id)
		local var_65_2 = RechargeShopDescriptionCfg[var_65_1.description or 0]

		if var_65_2 and var_65_2.type == ItemConst.ITEM_TYPE.SCENE then
			local var_65_3 = var_0_0.GetSkinIdByDlcGoodsId(iter_65_1.id)

			if HeroTools.GetShopIdBySkinId(var_65_3) <= 0 then
				table.insert(var_65_0, {
					next_refresh_timestamp = 0,
					buyTime = 0,
					id = -iter_65_1.id,
					shopId = var_0_1.SHOP_ID.DLC_SHOP
				})

				ShopCfg[-iter_65_1.id] = {
					taken_down = 0,
					is_limit_time_discount = 0,
					position = 0,
					shop_refresh = 3,
					goods_id = -var_65_1.goods_id,
					shop_id = var_0_1.SHOP_ID.DLC_SHOP,
					shop_sort = var_65_1.shop_sort,
					give_id = var_65_3,
					description = var_65_3,
					give = var_65_1.give,
					cost_type = var_65_1.cost_type,
					cost_id = var_65_1.cost_id,
					cost = var_65_1.cost,
					cheap_cost_id = var_65_1.cheap_cost_id,
					cheap_cost = var_65_1.cheap_cost,
					discount = var_65_1.discount,
					limit_num = var_65_1.limit_num,
					level_limit = {},
					limit_display = {},
					pre_goods_id = {},
					refresh_cycle = var_65_1.refresh_cycle,
					open_time = {},
					close_time = {},
					cheap_open_time = {},
					cheap_close_time = {},
					tag = var_65_1.tag,
					backhome_tag = var_65_1.backhome_tag,
					next_goods_id = cleanProtoTable(var_65_1.next_goods_id),
					give_back_list = {},
					dlc = iter_65_1.id
				}
				SkinIDToGoodIDCfg[var_65_3] = {
					id = -iter_65_1.id,
					goods_id = {
						-iter_65_1.id
					}
				}
				RechargeShopDescriptionCfg[var_65_3] = clone(ItemCfg[var_65_3])
				RechargeShopDescriptionCfg[var_65_3].param[1] = var_65_3
			end
		end
	end

	return var_65_0
end

function var_0_0.OpenWebRecharge()
	ShowMessageBox({
		isTop = true,
		title = GetTips("PROMPT"),
		content = GetTips("ERROR_PC_SHOP_TIPS3"),
		BtnText = {
			[3] = GetTips("ERROR_PC_SHOP_JUMP")
		},
		OkCallback = function()
			local var_67_0 = {
				userId = PlayerData:GetPlayerInfo().userID,
				signUserId = PlayerData:GetPlayerInfo().signUserId,
				gameAppId = _G.ChannelLoginInfo.channelAppId,
				token = _G.ChannelLoginInfo.channelToken
			}

			OperationAction.OpenOperationUrl("PC_SHOP", var_67_0)
		end
	})
end

return var_0_0
