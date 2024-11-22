local var_0_0 = {}
local var_0_1 = import("game.const.ShopConst")

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
	local var_12_1 = ShopData.GetShop(var_12_0.shop_id)[arg_12_0]

	if var_12_1 ~= nil and var_12_0.limit_num ~= nil and var_12_0.limit_num ~= -1 and var_12_0.limit_num - (var_12_1.buy_times or 0) <= 0 then
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

	ShowMessageBox({
		title = GetTips("PROMPT"),
		content = string.format(GetTips("CONFIRM_BUY"), GetI18NText(var_24_2.name), var_24_4 * arg_24_1, GetI18NText(var_24_1.name), arg_24_1),
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

	if var_0_0.GetDiscount(arg_31_0) ~= 100 then
		if #var_31_0.cheap_close_time > 0 then
			local var_31_1 = TimeMgr.GetInstance():GetServerTime()
			local var_31_2 = TimeMgr.GetInstance():parseTimeFromConfig(var_31_0.cheap_open_time)
			local var_31_3 = TimeMgr.GetInstance():parseTimeFromConfig(var_31_0.cheap_close_time)

			if var_31_2 <= var_31_1 and var_31_1 <= var_31_3 then
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

	if var_32_2 and var_32_4 then
		return var_32_0, var_32_1, var_32_5
	else
		return var_32_1, var_32_1, 1
	end
end

function var_0_0.IsRMB(arg_33_0)
	local var_33_0 = getShopCfg(arg_33_0)

	if var_33_0 == nil then
		local var_33_1 = 1
	end

	return var_33_0.cost_type == 1
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
	local var_36_1

	if var_36_0 and var_36_0.is_limit_time_discount and var_36_0.is_limit_time_discount == 1 then
		if var_0_0.IsRMB(arg_36_0) then
			local var_36_2 = PaymentCfg[var_36_0.cost_id].cost
			local var_36_3 = PaymentCfg[var_36_0.cheap_cost_id].cost

			var_36_1 = math.ceil(100 * var_36_3 / var_36_2)
		else
			var_36_1 = math.ceil(100 * var_36_0.cheap_cost / var_36_0.cost)
		end
	elseif var_36_0 and var_36_0.discount and var_36_0.discount ~= 0 then
		var_36_1 = var_36_0.discount
	else
		var_36_1 = 100
	end

	return var_36_1
end

function var_0_0.GetOriPrice(arg_37_0)
	local var_37_0 = getShopCfg(arg_37_0)
	local var_37_1 = var_0_0.GetDiscount(arg_37_0)

	if var_37_0 and var_37_0.is_limit_time_discount and var_37_0.is_limit_time_discount == 1 or var_37_1 == 100 then
		if var_0_0.IsRMB(arg_37_0) then
			return PaymentCfg[var_37_0.cost_id].cost / 100
		else
			return var_37_0.cost
		end
	else
		local var_37_2

		if var_0_0.IsRMB(arg_37_0) then
			var_37_2 = PaymentCfg[var_37_0.cheap_cost_id].cost / 100
		else
			var_37_2 = var_37_0.cheap_cost
		end

		return math.ceil(var_37_2 / (var_37_1 / 100))
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

	if var_0_0.GetDiscount(arg_39_0) ~= 100 then
		if var_0_0.IsRMB(arg_39_0) then
			return PaymentCfg[var_39_0.cheap_cost_id].cost / 100
		else
			return var_39_0.cheap_cost
		end
	else
		return var_0_0.GetOriPrice(arg_39_0)
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

function var_0_0.GetFragmentList()
	local var_47_0 = {}
	local var_47_1 = HeroTools.GetCanExchangeHero()

	for iter_47_0 = 1, #var_47_1 do
		local var_47_2 = var_47_1[iter_47_0]
		local var_47_3 = ItemCfg[var_47_2.id].rare - 2
		local var_47_4 = GameSetting.fragment_break_num.value[var_47_3]

		var_47_0[var_47_4[1]] = (var_47_0[var_47_4[1]] or 0) + var_47_2.number * var_47_4[2]
	end

	local var_47_5 = {}

	for iter_47_1, iter_47_2 in pairs(var_47_0) do
		if iter_47_2 > 0 then
			table.insert(var_47_5, {
				id = iter_47_1,
				num = iter_47_2
			})
		end
	end

	return var_47_5
end

function var_0_0.CheckGiftSkinOwn(arg_48_0)
	local var_48_0 = getShopCfg(arg_48_0)
	local var_48_1 = RechargeShopDescriptionCfg[var_48_0.description]

	if var_48_1.sub_type == ItemConst.ITEM_SUB_TYPE.SHOP_PACKS then
		for iter_48_0, iter_48_1 in ipairs(var_48_1.param) do
			if iter_48_1[1] then
				local var_48_2 = ItemCfg[iter_48_1[1]]

				if ItemTools.getItemNum(iter_48_1[1]) == 1 and var_48_2.type == ItemConst.ITEM_TYPE.HERO_SKIN then
					return true
				end
			end
		end
	end

	return false
end

function var_0_0.SplitDataByShopID(arg_49_0, arg_49_1)
	local var_49_0 = ShopListCfg[arg_49_1]
	local var_49_1 = {
		{},
		{},
		{},
		{},
		{}
	}
	local var_49_2 = {}

	for iter_49_0, iter_49_1 in ipairs(arg_49_0) do
		local var_49_3 = getShopCfg(iter_49_1.id)
		local var_49_4 = ItemCfg[var_49_3.give_id]

		if var_49_3.shop_refresh == 4 and var_49_4.type == ItemConst.ITEM_TYPE.HERO_PIECE then
			table.insert(var_49_1[5], iter_49_1)
		elseif var_49_4.type == ItemConst.ITEM_TYPE.HERO_PIECE then
			table.insert(var_49_1[4], iter_49_1)
		elseif var_49_4.type == ItemConst.ITEM_TYPE.EQUIP then
			table.insert(var_49_1[3], iter_49_1)
		elseif var_49_4.type == ItemConst.ITEM_TYPE.WEAPON_SERVANT then
			table.insert(var_49_1[2], iter_49_1)
		else
			table.insert(var_49_1[1], iter_49_1)
		end
	end

	local var_49_5 = {
		false,
		false,
		false,
		false,
		false
	}

	for iter_49_2, iter_49_3 in ipairs(var_49_0.shop_label) do
		var_49_5[iter_49_3] = true
	end

	for iter_49_4, iter_49_5 in ipairs(var_49_1) do
		if var_49_5[iter_49_4] == false then
			for iter_49_6, iter_49_7 in ipairs(var_49_1[iter_49_4]) do
				table.insert(var_49_1[1], iter_49_5)
			end

			var_49_1[iter_49_4] = {}
		end
	end

	for iter_49_8, iter_49_9 in ipairs(var_49_1) do
		if #iter_49_9 > 0 then
			var_0_0.CommonSort(iter_49_9)
		end
	end

	local var_49_6 = {}

	for iter_49_10, iter_49_11 in ipairs(var_49_1[3]) do
		local var_49_7 = getShopCfg(iter_49_11.id)
		local var_49_8 = EquipCfg[var_49_7.give_id]

		if var_49_6[var_49_8.suit] == nil then
			var_49_6[var_49_8.suit] = {}
		end

		if var_49_6[var_49_8.suit][var_49_8.starlevel] == nil then
			var_49_6[var_49_8.suit][var_49_8.starlevel] = {}
		end

		table.insert(var_49_6[var_49_8.suit][var_49_8.starlevel], iter_49_11)
	end

	local var_49_9 = {}

	for iter_49_12, iter_49_13 in pairs(var_49_6) do
		table.insert(var_49_9, iter_49_12)
	end

	local var_49_10 = {}

	for iter_49_14, iter_49_15 in ipairs(EquipSuitCfg.all) do
		if var_49_6[iter_49_15] then
			for iter_49_16, iter_49_17 in pairs(var_49_6[iter_49_15]) do
				table.insert(var_49_10, iter_49_17)
			end
		end
	end

	if #var_49_10 == 0 or #var_49_10[1] == 6 then
		var_49_1[3] = var_49_10
	end

	local var_49_11 = {}

	for iter_49_18, iter_49_19 in ipairs(var_49_1) do
		if #iter_49_19 ~= 0 then
			table.insert(var_49_2, iter_49_18)
		end
	end

	for iter_49_20, iter_49_21 in ipairs(var_49_0.shop_label) do
		if #var_49_1[iter_49_21] ~= 0 then
			table.insert(var_49_11, var_49_1[iter_49_21])
		end
	end

	return var_49_11, var_49_2, var_49_9
end

function var_0_0.IsPC()
	return GameToSDK.IsPCPlatform()
end

function var_0_0.IsLimitRecharge()
	return var_0_0.IsPC() and false
end

function var_0_0.CheckDlcCanBuy(arg_52_0)
	if arg_52_0 == nil or arg_52_0 == 0 then
		return false
	end

	local var_52_0 = getShopCfg(arg_52_0)

	if not var_52_0 then
		return false
	end

	return var_0_1.SHOP_ID.DLC_SHOP == var_52_0.shop_id
end

function var_0_0.JumpToSkinShop(arg_53_0, arg_53_1, arg_53_2, arg_53_3)
	local var_53_0 = 0
	local var_53_1

	if not arg_53_1 then
		var_53_0 = var_0_0.GetGoodsIdBySkinId(arg_53_0)
	else
		var_53_0, var_53_1 = var_0_0.GetGoodsIdByDlcId(arg_53_3)
	end

	if var_53_0 == 0 then
		ShowTips(GetTips("ERROR_SHOP_GOODS_OPEN_TIME"))

		return
	end

	local var_53_2 = getShopCfg(var_53_0)

	if not var_53_2 then
		ShowTips(GetTips("ERROR_SHOP_GOODS_OPEN_TIME"))

		return
	end

	local var_53_3 = false

	if ShopTools.CheckShopIsUnLock(var_53_2.shop_id) and ShopTools.IsGoodCanDisplay(var_53_2.shop_id, var_53_2.goods_id) then
		var_53_3 = true
	end

	if var_53_3 then
		local var_53_4 = ShopListCfg[var_53_2.shop_id]

		JumpTools.GoToSystem("/rechargeMain", {
			page = var_53_4.display_group,
			shopListId = var_53_4.id
		}, var_53_4.system)

		local var_53_5 = SkinCfg[arg_53_0]

		if var_53_1 == var_0_1.SHOP_ID.PASSPORT_SHOP then
			JumpTools.OpenPageByJump("shop", {
				goodID = var_53_2.goods_id,
				heroID = var_53_5.hero,
				skinID = arg_53_0,
				shopID = var_53_2.shop_id
			})
		else
			JumpTools.OpenPageByJump("/heroSkinPreview", {
				isShop = true,
				heroID = var_53_5.hero,
				skinID = var_53_5.id,
				goodId = var_53_2.goods_id,
				shopID = var_53_2.shop_id,
				isDlc = arg_53_1
			})
		end
	else
		ShowTips(GetTips("ERROR_SHOP_GOODS_OPEN_TIME"))
	end
end

function var_0_0.GetGoodsIdBySkinId(arg_54_0)
	local var_54_0 = var_0_0.FilterShopDataList(var_0_1.SHOP_ID.SKIN_SHOP)

	for iter_54_0, iter_54_1 in pairs(var_54_0) do
		if getShopCfg(iter_54_1.id).description == arg_54_0 then
			return iter_54_1.id
		end
	end
end

function var_0_0.GetGoodsIdByDlcId(arg_55_0)
	local var_55_0 = var_0_0.FilterShopDataList(var_0_1.SHOP_ID.SKIN_SHOP)

	for iter_55_0, iter_55_1 in pairs(var_55_0) do
		if getShopCfg(iter_55_1.id).description == arg_55_0 then
			return iter_55_1.id, var_0_1.SHOP_ID.SKIN_SHOP
		end
	end

	local var_55_1 = var_0_0.FilterShopDataList(var_0_1.SHOP_ID.PASSPORT_SHOP)

	for iter_55_2, iter_55_3 in pairs(var_55_1) do
		if getShopCfg(iter_55_3.id).give_id == arg_55_0 then
			return iter_55_3.id, var_0_1.SHOP_ID.PASSPORT_SHOP
		end
	end
end

return var_0_0
