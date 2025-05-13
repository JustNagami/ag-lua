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

function var_0_0.CheckShopSoldOut(arg_13_0)
	local var_13_0 = getShopIDListByShopID(arg_13_0)

	for iter_13_0, iter_13_1 in ipairs(var_13_0) do
		local var_13_1 = getShopCfg(iter_13_1)
		local var_13_2 = var_13_1.give_id and ItemCfg[var_13_1.give_id] or RechargeShopDescriptionCfg[var_13_1.description]

		if not var_0_0.CheckSoldOut(iter_13_1) then
			if var_13_2.type == var_13_2.HERO_SKIN then
				if not ShopTools.HaveSkin(self.itemCfg.id) then
					return false
				end
			else
				return false
			end
		end
	end

	return true
end

function var_0_0.IsGoodCanBuyInShop(arg_14_0, arg_14_1, arg_14_2)
	local var_14_0 = getShopCfg(arg_14_1)
	local var_14_1 = true
	local var_14_2 = true
	local var_14_3 = true
	local var_14_4 = true
	local var_14_5 = var_0_0.CheckSoldOut(arg_14_1)

	if #var_0_0.GetNextGoods(arg_14_1) > 0 and var_14_5 then
		var_14_2 = false
	end

	if var_14_0.pre_goods_id ~= nil and #var_14_0.pre_goods_id > 0 then
		for iter_14_0, iter_14_1 in ipairs(var_14_0.pre_goods_id) do
			local var_14_6 = getShopCfg(iter_14_1)
			local var_14_7 = ShopData.GetShop(arg_14_0)[iter_14_1]

			if var_14_7 ~= nil and var_14_6.limit_num ~= nil and var_14_6.limit_num ~= -1 and var_14_6.limit_num - (var_14_7.buy_times or 0) > 0 then
				var_14_1 = false

				break
			end
		end

		if #var_0_0.GetNextGoods(arg_14_1) == 0 and var_14_5 and not arg_14_2 then
			var_14_3 = false
		end
	end

	local var_14_8 = var_0_0.CheckInSoldTime(arg_14_1)
	local var_14_9 = var_14_0.limit_display == 1 or ShopData.IsGoodUnlock(var_14_0.goods_id, arg_14_0) == 1

	if var_14_0.taken_down == 0 and var_14_1 and var_14_2 and var_14_3 and var_14_8 and var_14_9 then
		if ShopTools.GetPrice(var_14_0.goods_id) == 0 then
			ShopData.IsGoodUnlock(var_14_0.goods_id)
		end

		return true
	end

	return false
end

function var_0_0.IsGoodCanBuy(arg_15_0, arg_15_1, arg_15_2)
	return ShopData.GetShop(arg_15_0)[arg_15_1] and var_0_0.IsGoodCanBuyInShop(arg_15_0, arg_15_1, arg_15_2) and not var_0_0.CheckSoldOut(arg_15_1)
end

function var_0_0.GetNextGoods(arg_16_0)
	return ShopData.GetNextGoods(arg_16_0)
end

function var_0_0.JudgeIsLvLimit(arg_17_0)
	local var_17_0 = PlayerData:GetPlayerInfo().userLevel

	for iter_17_0, iter_17_1 in ipairs(arg_17_0) do
		if var_0_1.SHOP_LIMIT.PLAYER_LV == iter_17_1[1] and var_17_0 < iter_17_1[2] then
			return true, iter_17_1
		end
	end

	return false
end

function var_0_0.HaveSkin(arg_18_0)
	local var_18_0 = SkinCfg[arg_18_0].hero
	local var_18_1 = HeroData:GetHeroData(var_18_0)
	local var_18_2 = {}

	for iter_18_0, iter_18_1 in ipairs(var_18_1.unlocked_skin) do
		if iter_18_1.skin_id == arg_18_0 and iter_18_1.time == 0 then
			return true
		end
	end

	return false
end

function var_0_0.GetCostLevel(arg_19_0)
	local var_19_0 = getShopCfg(arg_19_0)

	if var_0_0.GetCostCfg(arg_19_0).type == ItemConst.ITEM_TYPE.CURRENCY then
		if var_19_0.cost_id == CurrencyConst.CURRENCY_TYPE_RECHARGE_DIAMOND_FREE or var_19_0.cost_id == CurrencyConst.GetPlatformDiamondId() then
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

function var_0_0.DefaultOpenPopUp(arg_23_0)
	JumpTools.OpenPopUp("rechargeDiamondExchange", {
		getBaseNum = 1,
		useBaseNum = 1,
		useId = CurrencyConst.CURRENCY_TYPE_RECHARGE_DIAMOND_FREE,
		getId = CurrencyConst.CURRENCY_TYPE_DIAMOND,
		defaultNum = arg_23_0
	}, ViewConst.SYSTEM_ID.RECHARGE_DIAMOND_EXCHANGE)
end

function var_0_0.CostEnoughJump(arg_24_0)
	if arg_24_0 == var_0_1.COST_LEVEL.FREE_DIAMOND then
		var_0_0.DiamondEnoughMessageBox()
	elseif arg_24_0 == var_0_1.COST_LEVEL.RECHARGE_DIAMOND then
		var_0_0.DefaultOpenPopUp(0)
	elseif arg_24_0 == var_0_1.COST_LEVEL.MATERIAL then
		ShowTips("ERROR_ITEM_NOT_ENOUGH_MATERIAL")
	end
end

function var_0_0.ConfirmBuyItem(arg_25_0, arg_25_1, arg_25_2, arg_25_3, arg_25_4)
	local var_25_0 = getShopCfg(arg_25_0)
	local var_25_1 = var_25_0.give_id and ItemCfg[var_25_0.give_id] or RechargeShopDescriptionCfg[var_25_0.description]
	local var_25_2 = var_0_0.GetCostCfg(arg_25_0)
	local var_25_3 = var_0_0.GetCostCount(arg_25_0)
	local var_25_4, var_25_5, var_25_6 = var_0_0.GetPrice(arg_25_0)
	local var_25_7 = var_0_0.GetCostLevel(arg_25_0)
	local var_25_8 = ""
	local var_25_9 = string.format(GetTips("CONFIRM_BUY"), GetI18NText(var_25_2.name), var_25_4 * arg_25_1, GetI18NText(var_25_1.name), arg_25_1)

	ShowMessageBox({
		title = GetTips("PROMPT"),
		content = var_25_9,
		OkCallback = function()
			if var_25_3 < var_25_4 * arg_25_1 then
				var_0_0.CostEnoughJump(var_25_7)
			else
				if ShopData.IsGoodOutOfDate(arg_25_0) then
					ShowTips("GOODS_HAS_BEEN_REMOVED")

					return
				end

				if arg_25_2 then
					arg_25_2(arg_25_0)
				end

				ShopAction.BuyItem({
					{
						goodID = arg_25_0,
						buyNum = arg_25_1
					}
				}, var_25_4, arg_25_4)
			end
		end,
		CancelCallback = arg_25_3
	})
end

function var_0_0.ConfirmBuySkin(arg_27_0, arg_27_1, arg_27_2, arg_27_3, arg_27_4)
	local var_27_0 = 0
	local var_27_1
	local var_27_2 = ""
	local var_27_3 = var_0_0.GetCostCount(arg_27_0[1])
	local var_27_4 = var_0_0.GetCostLevel(arg_27_0[1])
	local var_27_5 = {}

	for iter_27_0, iter_27_1 in ipairs(arg_27_0) do
		local var_27_6 = getShopCfg(iter_27_1)
		local var_27_7 = var_27_6.give_id and ItemCfg[var_27_6.give_id] or RechargeShopDescriptionCfg[var_27_6.description]
		local var_27_8 = var_0_0.GetCostCfg(iter_27_1)
		local var_27_9, var_27_10, var_27_11 = var_0_0.GetPrice(iter_27_1)

		var_27_0 = var_27_0 + var_27_9 * arg_27_1[iter_27_0]
		var_27_1 = var_27_8

		if iter_27_0 == 1 then
			var_27_2 = GetI18NText(var_27_7.name)
		else
			var_27_2 = var_27_2 .. "+" .. GetI18NText(var_27_7.name)
		end

		table.insert(var_27_5, {
			goodID = iter_27_1,
			buyNum = arg_27_1[iter_27_0]
		})
	end

	ShowMessageBox({
		title = GetTips("PROMPT"),
		content = string.format(GetTips("CONFIRM_BUY"), GetI18NText(var_27_1.name), var_27_0, var_27_2, arg_27_1[1]),
		OkCallback = function()
			if var_27_3 < var_27_0 then
				var_0_0.CostEnoughJump(var_27_4)
			else
				for iter_28_0, iter_28_1 in ipairs(arg_27_0) do
					if ShopData.IsGoodOutOfDate(iter_28_1) then
						ShowTips("GOODS_HAS_BEEN_REMOVED")

						return
					end
				end

				ShopAction.BuyItem(var_27_5, nil, arg_27_4)
			end
		end,
		CancelCallback = arg_27_3
	})
end

function var_0_0.GetCostCount(arg_29_0)
	local var_29_0 = getShopCfg(arg_29_0)
	local var_29_1 = var_29_0.cost_id

	if var_29_1 == 0 then
		var_29_1 = var_29_0.cheap_cost_id
	end

	return ItemTools.getItemNum(var_29_1)
end

function var_0_0.GetCostCfg(arg_30_0)
	local var_30_0 = getShopCfg(arg_30_0)

	return ItemCfg[var_30_0.cost_id]
end

function var_0_0.GetCostId(arg_31_0)
	local var_31_0, var_31_1, var_31_2 = ShopTools.IsOnDiscountArea(arg_31_0)
	local var_31_3

	if var_31_0 and var_31_2 then
		var_31_3 = getShopCfg(arg_31_0).cheap_cost_id
	else
		var_31_3 = getShopCfg(arg_31_0).cost_id
	end

	return var_31_3
end

function var_0_0.IsOnDiscountArea(arg_32_0)
	local var_32_0 = getShopCfg(arg_32_0)
	local var_32_1 = ShopListCfg[var_32_0.shop_id]

	if var_0_0.GetDiscount(arg_32_0) ~= 100 then
		if #var_32_0.cheap_close_time > 0 then
			local var_32_2 = TimeMgr.GetInstance():GetServerTime()
			local var_32_3 = TimeMgr.GetInstance():parseTimeFromConfig(var_32_0.cheap_open_time)
			local var_32_4 = TimeMgr.GetInstance():parseTimeFromConfig(var_32_0.cheap_close_time)

			if var_32_3 <= var_32_2 and var_32_2 <= var_32_4 then
				return true, true, true
			elseif var_32_1 and #var_32_1.cheap_close_time > 0 then
				local var_32_5 = TimeMgr.GetInstance():GetServerTime()
				local var_32_6 = TimeMgr.GetInstance():parseTimeFromConfig(var_32_1.cheap_open_time)
				local var_32_7 = TimeMgr.GetInstance():parseTimeFromConfig(var_32_1.cheap_close_time)

				if var_32_6 <= var_32_5 and var_32_5 <= var_32_7 then
					return true, true, true
				else
					return true, true, false
				end
			end
		elseif var_32_1 and #var_32_1.cheap_close_time > 0 then
			local var_32_8 = TimeMgr.GetInstance():GetServerTime()
			local var_32_9 = TimeMgr.GetInstance():parseTimeFromConfig(var_32_1.cheap_open_time)
			local var_32_10 = TimeMgr.GetInstance():parseTimeFromConfig(var_32_1.cheap_close_time)

			if var_32_9 <= var_32_8 and var_32_8 <= var_32_10 then
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

function var_0_0.GetPrice(arg_33_0)
	local var_33_0 = var_0_0.GetDiscountPrice(arg_33_0)
	local var_33_1 = var_0_0.GetOriPrice(arg_33_0)
	local var_33_2, var_33_3, var_33_4 = var_0_0.IsOnDiscountArea(arg_33_0)
	local var_33_5 = var_33_0 == var_33_1 and 1 or var_33_0 / var_33_1
	local var_33_6 = math.max(var_33_0, 1)

	if var_33_2 and var_33_4 then
		return var_33_6, var_33_1, var_33_5
	else
		return var_33_1, var_33_1, 1
	end
end

function var_0_0.IsRMB(arg_34_0)
	return getShopCfg(arg_34_0).cost_type == 1
end

function var_0_0.IsSkin(arg_35_0)
	return getShopCfg(arg_35_0).cost_type == 3
end

function var_0_0.GetDiscountLabel(arg_36_0)
	local var_36_0 = var_0_0.GetDiscount(arg_36_0)

	if SDKTools.GetIsThisServer({
		"jp"
	}) then
		return GetTips("LABEL_DISCOUNT_EXTRA")
	elseif SDKTools.GetIsThisServer({
		"kr",
		"en"
	}) then
		return string.format("%d%%%s", 100 - var_36_0, GetTips("LABEL_DISCOUNT"))
	end

	return string.format("%.1f%s", var_36_0 / 10, GetTips("LABEL_DISCOUNT"))
end

function var_0_0.GetDiscount(arg_37_0)
	local var_37_0 = getShopCfg(arg_37_0)
	local var_37_1 = ShopListCfg[var_37_0.shop_id]
	local var_37_2
	local var_37_3

	if var_37_0 and var_37_0.is_limit_time_discount and var_37_0.is_limit_time_discount == 1 then
		if var_0_0.IsRMB(arg_37_0) then
			local var_37_4 = PaymentCfg[var_37_0.cost_id].cost
			local var_37_5 = PaymentCfg[var_37_0.cheap_cost_id].cost

			var_37_2 = math.ceil(100 * var_37_5 / var_37_4)
		else
			var_37_2 = math.ceil(100 * var_37_0.cheap_cost / var_37_0.cost)
		end
	elseif var_37_0 and var_37_0.discount and var_37_0.discount ~= 0 then
		var_37_2 = var_37_0.discount
	else
		var_37_2 = 100
	end

	if var_37_2 == 100 then
		var_37_3 = var_37_0.cost_id
	else
		var_37_3 = var_37_0.cheap_cost_id
	end

	if var_37_1 and var_37_1.is_limit_time_discount == 1 then
		if var_37_1.is_limit_buy_discount == 0 and var_37_0.limit_num ~= nil and var_37_0.limit_num ~= -1 then
			return var_37_2
		end

		if var_37_1.cheap_limit_currency[1] == 1 then
			if table.indexof(var_37_1.cheap_limit_currency[2], var_37_3) then
				var_37_2 = math.min(var_37_1.discount, var_37_2)
			end
		elseif var_37_1.cheap_limit_currency[1] == 2 then
			if not table.indexof(var_37_1.cheap_limit_currency[2], var_37_3) then
				var_37_2 = math.min(var_37_1.discount, var_37_2)
			end
		else
			var_37_2 = math.min(var_37_1.discount, var_37_2)
		end
	end

	return var_37_2
end

function var_0_0.GetOriPrice(arg_38_0)
	local var_38_0 = getShopCfg(arg_38_0)
	local var_38_1 = var_0_0.GetDiscount(arg_38_0)
	local var_38_2 = ShopListCfg[var_38_0.shop_id]

	if var_38_1 == 100 or var_38_0 and var_38_0.is_limit_time_discount and var_38_0.is_limit_time_discount == 1 or var_38_0.cheap_cost == 0 then
		if var_0_0.IsRMB(arg_38_0) then
			return PaymentCfg[var_38_0.cost_id].cost / 100
		else
			return var_38_0.cost
		end
	else
		local var_38_3

		if var_0_0.IsRMB(arg_38_0) then
			var_38_3 = PaymentCfg[var_38_0.cheap_cost_id].cost / 100
		else
			var_38_3 = var_38_0.cheap_cost
		end

		if var_38_2.is_limit_time_discount == 1 and var_38_1 >= var_38_2.discount then
			return math.ceil(var_38_3 * 100 / var_38_0.discount)
		else
			return math.ceil(var_38_3 * 100 / var_38_1)
		end
	end
end

function var_0_0.GetMoneySymbol(arg_39_0)
	local var_39_0 = getShopCfg(arg_39_0)

	if var_0_0.IsRMB(arg_39_0) and PaymentCfg[var_39_0.cost_id] then
		return PaymentCfg[var_39_0.cost_id].currency_symbol
	end

	return ""
end

function var_0_0.GetDiscountPrice(arg_40_0)
	local var_40_0 = getShopCfg(arg_40_0)
	local var_40_1 = var_0_0.GetOriPrice(arg_40_0)
	local var_40_2 = ShopListCfg[var_40_0.shop_id]

	if var_0_0.GetDiscount(arg_40_0) ~= 100 then
		if var_0_0.IsRMB(arg_40_0) then
			if var_40_0.cheap_cost_id == 0 then
				return PaymentCfg[var_40_0.cost_id].cost / 100
			else
				return PaymentCfg[var_40_0.cheap_cost_id].cost / 100
			end
		else
			if var_40_2 and var_40_2.discount ~= 0 then
				local var_40_3 = var_40_2.discount * var_40_1 * 100 / 10000
				local var_40_4 = math.floor(var_40_3)

				if var_40_0.cheap_cost == 0 then
					return var_40_4
				elseif var_40_2.is_limit_buy_discount == 0 and var_40_0.limit_num > 0 then
					return var_40_0.cheap_cost
				else
					return math.min(var_40_4, var_40_0.cheap_cost)
				end
			end

			return var_40_0.cheap_cost
		end
	else
		return var_40_1
	end
end

function var_0_0.IsShopOpen(arg_41_0)
	local var_41_0 = ShopListCfg[arg_41_0]

	if var_41_0.activity_id == 0 then
		return true, 0
	elseif ActivityData:GetActivityIsOpen(var_41_0.activity_id) then
		return true, 1
	else
		local var_41_1 = ActivityData:GetActivityData(var_41_0.activity_id)
		local var_41_2 = manager.time:GetServerTime()

		if var_41_1 and var_41_2 < var_41_1.startTime then
			return false, 3
		else
			return false, 2
		end
	end
end

function var_0_0.GetGoodsIDListByItemID(arg_42_0, arg_42_1)
	local var_42_0 = {}

	if #getShopIDListByShopID(arg_42_0) > 0 then
		local var_42_1 = getShopIDListByShopID(arg_42_0)

		for iter_42_0, iter_42_1 in ipairs(var_42_1) do
			if getShopCfg(iter_42_1).give_id == arg_42_1 then
				table.insert(var_42_0, iter_42_1)
			end
		end
	end

	return var_42_0
end

function var_0_0.IsGoodCanExchange(arg_43_0, arg_43_1)
	for iter_43_0, iter_43_1 in ipairs(arg_43_1) do
		if var_0_0.IsGoodCanDisplay(arg_43_0, iter_43_1) then
			return true
		end
	end

	return false
end

function var_0_0.CheckShopIsUnLock(arg_44_0)
	if arg_44_0 then
		local var_44_0 = ShopListCfg[arg_44_0].open_condition

		if var_44_0 and var_44_0 > 0 and ShopListCfg[arg_44_0].display_group == 18 then
			return IsConditionAchieved(var_44_0)
		end
	end

	return true
end

function var_0_0.GetShopIsUnLockDesc(arg_45_0)
	local var_45_0 = ShopListCfg[arg_45_0].open_condition

	if var_45_0 and var_45_0 > 0 and ShopListCfg[arg_45_0].display_group == 18 then
		local var_45_1, var_45_2, var_45_3 = IsConditionAchieved(var_45_0)
		local var_45_4 = string.format(GetTips("ACTIVITY_CLUB_SP_SHOP_UNLOCK_PROGRESS"), tostring(var_45_2), tostring(var_45_3))

		return GuildActivityTools.GetGuildSpConditionDesc(var_45_0) .. GetTips("DORM_CANTEEN_LEVEL_UNLOCK") .. var_45_4
	end
end

function var_0_0.CheckDlcPurchased(arg_46_0)
	local var_46_0 = getShopCfg(arg_46_0)

	if not var_46_0 then
		return true
	end

	local var_46_1 = var_46_0.give_id or var_46_0.description

	if not var_46_0.give then
		local var_46_2 = 1
	end

	local var_46_3
	local var_46_4

	if var_46_0.description then
		local var_46_5 = var_46_0.description

		var_46_4 = RechargeShopDescriptionCfg[var_46_5]
	else
		var_46_4 = ItemCfg[var_46_1]
	end

	if var_46_4 and var_46_4.type == ItemConst.ITEM_TYPE.SCENE and (SceneConst.HOME_SCENE_TYPE.LOCK == HomeSceneSettingData:GetUsedState(var_46_4.id) or SceneConst.HOME_SCENE_TYPE.TRIAL == HomeSceneSettingData:GetUsedState(var_46_4.id)) then
		return false
	end

	return true
end

function var_0_0.CheckDlcPurchasedByItemID(arg_47_0)
	local var_47_0 = ItemCfg[arg_47_0]

	if var_47_0 and var_47_0.type == ItemConst.ITEM_TYPE.SCENE and (SceneConst.HOME_SCENE_TYPE.LOCK == HomeSceneSettingData:GetUsedState(var_47_0.id) or SceneConst.HOME_SCENE_TYPE.TRIAL == HomeSceneSettingData:GetUsedState(var_47_0.id)) then
		return false
	end

	return true
end

function var_0_0.CheckDlcTrialByItemID(arg_48_0)
	local var_48_0 = ItemCfg[arg_48_0]

	if var_48_0 and var_48_0.type == ItemConst.ITEM_TYPE.SCENE and SceneConst.HOME_SCENE_TYPE.TRIAL == HomeSceneSettingData:GetUsedState(var_48_0.id) then
		return true
	end

	return false
end

function var_0_0.GetFragmentList()
	local var_49_0 = {}
	local var_49_1 = HeroTools.GetCanExchangeHero()

	for iter_49_0 = 1, #var_49_1 do
		local var_49_2 = var_49_1[iter_49_0]
		local var_49_3 = ItemCfg[var_49_2.id].rare - 2
		local var_49_4 = GameSetting.fragment_break_num.value[var_49_3]

		var_49_0[var_49_4[1]] = (var_49_0[var_49_4[1]] or 0) + var_49_2.number * var_49_4[2]
	end

	local var_49_5 = {}

	for iter_49_1, iter_49_2 in pairs(var_49_0) do
		if iter_49_2 > 0 then
			table.insert(var_49_5, {
				id = iter_49_1,
				num = iter_49_2
			})
		end
	end

	return var_49_5
end

function var_0_0.CheckGiftSkinOwn(arg_50_0)
	local var_50_0 = getShopCfg(arg_50_0)
	local var_50_1 = RechargeShopDescriptionCfg[var_50_0.description]

	if var_50_1.sub_type == ItemConst.ITEM_SUB_TYPE.SHOP_PACKS then
		for iter_50_0, iter_50_1 in ipairs(var_50_1.param) do
			if iter_50_1[1] then
				local var_50_2 = ItemCfg[iter_50_1[1]]

				if ItemTools.getItemNum(iter_50_1[1]) == 1 and var_50_2.type == ItemConst.ITEM_TYPE.HERO_SKIN then
					return true
				end
			end
		end
	end

	return false
end

function var_0_0.SplitDataByShopID(arg_51_0, arg_51_1)
	local var_51_0 = ShopListCfg[arg_51_1]
	local var_51_1 = {
		{},
		{},
		{},
		{},
		{}
	}
	local var_51_2 = {}

	for iter_51_0, iter_51_1 in ipairs(arg_51_0) do
		local var_51_3 = getShopCfg(iter_51_1.id)
		local var_51_4 = ItemCfg[var_51_3.give_id]

		if var_51_3.shop_refresh == 4 and var_51_4.type == ItemConst.ITEM_TYPE.HERO_PIECE then
			table.insert(var_51_1[5], iter_51_1)
		elseif var_51_4.type == ItemConst.ITEM_TYPE.HERO_PIECE then
			table.insert(var_51_1[4], iter_51_1)
		elseif var_51_4.type == ItemConst.ITEM_TYPE.EQUIP then
			table.insert(var_51_1[3], iter_51_1)
		elseif var_51_4.type == ItemConst.ITEM_TYPE.WEAPON_SERVANT then
			table.insert(var_51_1[2], iter_51_1)
		else
			table.insert(var_51_1[1], iter_51_1)
		end
	end

	local var_51_5 = {
		false,
		false,
		false,
		false,
		false
	}

	for iter_51_2, iter_51_3 in ipairs(var_51_0.shop_label) do
		var_51_5[iter_51_3] = true
	end

	for iter_51_4, iter_51_5 in ipairs(var_51_1) do
		if var_51_5[iter_51_4] == false then
			for iter_51_6, iter_51_7 in ipairs(var_51_1[iter_51_4]) do
				table.insert(var_51_1[1], iter_51_5)
			end

			var_51_1[iter_51_4] = {}
		end
	end

	for iter_51_8, iter_51_9 in ipairs(var_51_1) do
		if #iter_51_9 > 0 then
			var_0_0.CommonSort(iter_51_9)
		end
	end

	local var_51_6 = {}

	for iter_51_10, iter_51_11 in ipairs(var_51_1[3]) do
		local var_51_7 = getShopCfg(iter_51_11.id)
		local var_51_8 = EquipCfg[var_51_7.give_id]

		if var_51_6[var_51_8.suit] == nil then
			var_51_6[var_51_8.suit] = {}
		end

		if var_51_6[var_51_8.suit][var_51_8.starlevel] == nil then
			var_51_6[var_51_8.suit][var_51_8.starlevel] = {}
		end

		table.insert(var_51_6[var_51_8.suit][var_51_8.starlevel], iter_51_11)
	end

	local var_51_9 = {}

	for iter_51_12, iter_51_13 in pairs(var_51_6) do
		table.insert(var_51_9, iter_51_12)
	end

	local var_51_10 = {}

	for iter_51_14, iter_51_15 in ipairs(EquipSuitCfg.all) do
		if var_51_6[iter_51_15] then
			for iter_51_16, iter_51_17 in pairs(var_51_6[iter_51_15]) do
				table.insert(var_51_10, iter_51_17)
			end
		end
	end

	if #var_51_10 == 0 or #var_51_10[1] == 6 then
		var_51_1[3] = var_51_10
	end

	local var_51_11 = {}

	for iter_51_18, iter_51_19 in ipairs(var_51_1) do
		if #iter_51_19 ~= 0 then
			table.insert(var_51_2, iter_51_18)
		end
	end

	for iter_51_20, iter_51_21 in ipairs(var_51_0.shop_label) do
		if #var_51_1[iter_51_21] ~= 0 then
			table.insert(var_51_11, var_51_1[iter_51_21])
		end
	end

	return var_51_11, var_51_2, var_51_9
end

function var_0_0.IsPC()
	return GameToSDK.IsPCPlatform()
end

function var_0_0.IsLimitRecharge()
	return var_0_0.IsPC() and SDKTools.GetIsKorea()
end

function var_0_0.CheckDlcCanBuy(arg_54_0)
	if arg_54_0 == nil or arg_54_0 == 0 then
		return false
	end

	local var_54_0 = getShopCfg(arg_54_0)

	if not var_54_0 then
		return false
	end

	return var_0_1.SHOP_ID.DLC_SHOP == var_54_0.shop_id
end

function var_0_0.JumpToSkinShop(arg_55_0, arg_55_1, arg_55_2, arg_55_3)
	local var_55_0 = 0
	local var_55_1

	if not arg_55_1 then
		var_55_0 = var_0_0.GetGoodsIdBySkinId(arg_55_0)
	else
		var_55_0, var_55_1 = var_0_0.GetGoodsIdByDlcId(arg_55_3)
	end

	if var_55_0 == 0 then
		ShowTips(GetTips("ERROR_SHOP_GOODS_OPEN_TIME"))

		return
	end

	local var_55_2 = getShopCfg(var_55_0)

	if not var_55_2 then
		ShowTips(GetTips("ERROR_SHOP_GOODS_OPEN_TIME"))

		return
	end

	local var_55_3 = false

	if ShopTools.CheckShopIsUnLock(var_55_2.shop_id) and ShopTools.IsGoodCanDisplay(var_55_2.shop_id, var_55_2.goods_id) then
		var_55_3 = true
	end

	if var_55_3 then
		local var_55_4 = ShopListCfg[var_55_2.shop_id]

		JumpTools.GoToSystem("/rechargeMain", {
			page = var_55_4.display_group,
			shopListId = var_55_4.id
		}, var_55_4.system)

		local var_55_5 = SkinCfg[arg_55_0]

		if var_55_1 == var_0_1.SHOP_ID.PASSPORT_SHOP then
			JumpTools.OpenPageByJump("shop", {
				goodID = var_55_2.goods_id,
				heroID = var_55_5.hero,
				skinID = arg_55_0,
				shopID = var_55_2.shop_id
			})
		else
			JumpTools.OpenPageByJump("/heroSkinPreview", {
				isShop = true,
				heroID = var_55_5.hero,
				skinID = var_55_5.id,
				goodId = var_55_2.goods_id,
				shopID = var_55_2.shop_id,
				isDlc = arg_55_1
			})
		end
	else
		ShowTips(GetTips("ERROR_SHOP_GOODS_OPEN_TIME"))
	end
end

function var_0_0.CheckGiveIsOwn(arg_56_0, arg_56_1)
	local function var_56_0(arg_57_0, arg_57_1)
		arg_57_1 = arg_57_1 or 0

		local var_57_0 = ItemCfg[arg_57_0]

		if ItemTools.getItemNum(arg_57_0) + arg_57_1 >= var_57_0.limit then
			return false
		end

		return true
	end

	local var_56_1 = getShopCfg(arg_56_0)

	if var_56_1.description then
		local var_56_2 = RechargeShopDescriptionCfg[var_56_1.description]

		if var_56_2.sub_type == ItemConst.ITEM_SUB_TYPE.SHOP_PACKS then
			for iter_56_0, iter_56_1 in ipairs(var_56_2.param) do
				if var_56_0(iter_56_1[1], iter_56_1[2] * arg_56_1) == false then
					return false
				end
			end

			return true
		else
			return var_56_0(var_56_1.description, arg_56_1)
		end
	else
		return var_56_0(var_56_1.give_id, arg_56_1)
	end

	return false
end

function var_0_0.GetGoodsIdBySkinId(arg_58_0)
	local var_58_0 = var_0_0.FilterShopDataList(var_0_1.SHOP_ID.SKIN_SHOP)

	for iter_58_0, iter_58_1 in pairs(var_58_0) do
		if getShopCfg(iter_58_1.id).description == arg_58_0 then
			return iter_58_1.id
		end
	end
end

function var_0_0.GetGoodsIdByDlcId(arg_59_0)
	local var_59_0 = var_0_0.FilterShopDataList(var_0_1.SHOP_ID.SKIN_SHOP)

	for iter_59_0, iter_59_1 in pairs(var_59_0) do
		if getShopCfg(iter_59_1.id).description == arg_59_0 then
			return iter_59_1.id, var_0_1.SHOP_ID.SKIN_SHOP
		end
	end

	local var_59_1 = var_0_0.FilterShopDataList(var_0_1.SHOP_ID.PASSPORT_SHOP)

	for iter_59_2, iter_59_3 in pairs(var_59_1) do
		if getShopCfg(iter_59_3.id).give_id == arg_59_0 then
			return iter_59_3.id, var_0_1.SHOP_ID.PASSPORT_SHOP
		end
	end
end

function var_0_0.CheckGoodsOwen(arg_60_0)
	local var_60_0 = getShopCfg(arg_60_0)

	if var_60_0.shop_refresh ~= 3 then
		local var_60_1 = ItemCfg[var_60_0.give_id]

		if var_60_1.num_exchange_item then
			return ItemTools.getItemNum(var_60_0.give_id) >= var_60_1.limit
		end
	else
		local var_60_2 = RechargeShopDescriptionCfg[var_60_0.description]

		if var_60_2.sub_type == ItemConst.ITEM_SUB_TYPE.SHOP_PACKS then
			for iter_60_0, iter_60_1 in ipairs(RechargeShopDescriptionCfg[var_60_0.description].param) do
				local var_60_3 = ItemCfg[iter_60_1[1]]

				if var_60_3.num_exchange_item and ItemTools.getItemNum(iter_60_1[1]) >= var_60_3.limit then
					return true
				end
			end
		elseif var_60_2.sub_type == ItemConst.ITEM_SUB_TYPE.SHOP_SEVEN_PACKS then
			for iter_60_2, iter_60_3 in pairs(var_60_2.param[2]) do
				local var_60_4 = ItemCfg[iter_60_3[1]]

				if var_60_4.num_exchange_item and ItemTools.getItemNum(iter_60_3[1]) >= var_60_4.limit then
					return true
				end
			end
		end
	end

	return false
end

function var_0_0.rewertReward(arg_61_0, arg_61_1)
	local var_61_0 = {}
	local var_61_1 = getShopCfg(arg_61_0)

	if var_61_1.description then
		local var_61_2 = RechargeShopDescriptionCfg[var_61_1.description]

		if var_61_2.sub_type == ItemConst.ITEM_SUB_TYPE.SHOP_PACKS then
			for iter_61_0, iter_61_1 in pairs(var_61_2.param) do
				table.insert(var_61_0, {
					id = iter_61_1[1],
					num = iter_61_1[2] * arg_61_1
				})
			end
		elseif var_61_2.sub_type == ItemConst.ITEM_SUB_TYPE.SHOP_SEVEN_PACKS then
			for iter_61_2, iter_61_3 in pairs(var_61_2.param[2]) do
				table.insert(var_61_0, {
					id = iter_61_3[1],
					num = iter_61_3[2] * arg_61_1 * var_61_2.param[3]
				})
			end
		end
	else
		table.insert(var_61_0, {
			id = var_61_1.give_id,
			num = var_61_1.give * arg_61_1
		})
	end

	local var_61_3 = {}
	local var_61_4 = {}

	for iter_61_4, iter_61_5 in ipairs(var_61_0) do
		local var_61_5 = ItemCfg[iter_61_5.id]

		if var_61_5.num_exchange_item and ItemTools.getItemNum(iter_61_5.id) + iter_61_5.num > var_61_5.limit then
			if ItemTools.getItemNum(iter_61_5.id) > var_61_5.limit then
				table.insert(var_61_3, {
					id = iter_61_5.id,
					num = iter_61_5.num
				})
				table.insert(var_61_4, {
					id = var_61_5.num_exchange_item[1][1],
					num = iter_61_5.num * var_61_5.num_exchange_item[1][2]
				})
			else
				table.insert(var_61_3, {
					id = iter_61_5.id,
					num = ItemTools.getItemNum(iter_61_5.id) + iter_61_5.num - var_61_5.limit
				})
				table.insert(var_61_4, {
					id = var_61_5.num_exchange_item[1][1],
					num = (ItemTools.getItemNum(iter_61_5.id) + iter_61_5.num - var_61_5.limit) * var_61_5.num_exchange_item[1][2]
				})
			end
		end
	end

	local var_61_6 = formatRewardCfgList(var_61_4)
	local var_61_7 = mergeReward(var_61_6)

	return var_61_3, var_61_7
end

function var_0_0.revertGoodsReward(arg_62_0)
	local var_62_0 = {}

	for iter_62_0, iter_62_1 in ipairs(arg_62_0) do
		local var_62_1 = ItemCfg[iter_62_1[1]]

		if var_62_1.num_exchange_item then
			if ItemTools.getItemNum(iter_62_1[1]) > var_62_1.limit then
				if ItemTools.getItemNum(iter_62_1[1]) - iter_62_1[2] >= var_62_1.limit then
					table.insert(var_62_0, {
						var_62_1.num_exchange_item[1][1],
						iter_62_1[2] * var_62_1.num_exchange_item[1][2]
					})
				else
					table.insert(var_62_0, {
						iter_62_1[1],
						var_62_1.limit - ItemTools.getItemNum(iter_62_1[1]) + iter_62_1[2]
					})
					table.insert(var_62_0, {
						var_62_1.num_exchange_item[1][1],
						(ItemTools.getItemNum(iter_62_1[1]) - var_62_1.limit) * var_62_1.num_exchange_item[1][2]
					})
				end
			end
		else
			table.insert(var_62_0, {
				iter_62_1[1],
				iter_62_1[2]
			})
		end
	end

	return var_62_0
end

function var_0_0.IsShopDiscount(arg_63_0)
	local var_63_0 = ShopListCfg[arg_63_0]

	if #var_63_0.cheap_close_time > 0 then
		local var_63_1 = TimeMgr.GetInstance():GetServerTime()
		local var_63_2 = TimeMgr.GetInstance():parseTimeFromConfig(var_63_0.cheap_open_time)
		local var_63_3 = TimeMgr.GetInstance():parseTimeFromConfig(var_63_0.cheap_close_time)

		if var_63_2 <= var_63_1 and var_63_1 <= var_63_3 then
			return true
		end

		return false
	end
end

function var_0_0.IsAnyShopDiscount(arg_64_0)
	for iter_64_0, iter_64_1 in ipairs(arg_64_0) do
		if var_0_0.IsShopDiscount(iter_64_1) then
			return true
		end
	end

	return false
end

function var_0_0.GetSkinIdByDlcGoodsId(arg_65_0)
	return SkinSceneActionCfg.get_id_list_by_special_scene_id[RechargeShopDescriptionCfg[getShopCfg(arg_65_0).description].param[1]][1]
end

function var_0_0.GetFakeShopDataList(arg_66_0)
	local var_66_0 = clone(arg_66_0)

	for iter_66_0, iter_66_1 in ipairs(arg_66_0) do
		local var_66_1 = getShopCfg(iter_66_1.id)
		local var_66_2 = RechargeShopDescriptionCfg[var_66_1.description or 0]

		if var_66_2 and var_66_2.type == ItemConst.ITEM_TYPE.SCENE then
			local var_66_3 = var_0_0.GetSkinIdByDlcGoodsId(iter_66_1.id)

			if HeroTools.GetShopIdBySkinId(var_66_3) <= 0 then
				table.insert(var_66_0, {
					next_refresh_timestamp = 0,
					buyTime = 0,
					id = -iter_66_1.id,
					shopId = var_0_1.SHOP_ID.DLC_SHOP
				})

				ShopCfg[-iter_66_1.id] = {
					taken_down = 0,
					is_limit_time_discount = 0,
					position = 0,
					shop_refresh = 3,
					goods_id = -var_66_1.goods_id,
					shop_id = var_0_1.SHOP_ID.DLC_SHOP,
					shop_sort = var_66_1.shop_sort,
					give_id = var_66_3,
					description = var_66_3,
					give = var_66_1.give,
					cost_type = var_66_1.cost_type,
					cost_id = var_66_1.cost_id,
					cost = var_66_1.cost,
					cheap_cost_id = var_66_1.cheap_cost_id,
					cheap_cost = var_66_1.cheap_cost,
					discount = var_66_1.discount,
					limit_num = var_66_1.limit_num,
					level_limit = {},
					limit_display = {},
					pre_goods_id = {},
					refresh_cycle = var_66_1.refresh_cycle,
					open_time = {},
					close_time = {},
					cheap_open_time = {},
					cheap_close_time = {},
					tag = var_66_1.tag,
					backhome_tag = var_66_1.backhome_tag,
					next_goods_id = cleanProtoTable(var_66_1.next_goods_id),
					give_back_list = {},
					dlc = iter_66_1.id
				}
				SkinIDToGoodIDCfg[var_66_3] = {
					id = -iter_66_1.id,
					goods_id = {
						-iter_66_1.id
					}
				}
				RechargeShopDescriptionCfg[var_66_3] = clone(ItemCfg[var_66_3])
				RechargeShopDescriptionCfg[var_66_3].param[1] = var_66_3
			end
		end
	end

	return var_66_0
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
			local var_68_0 = {
				userId = PlayerData:GetPlayerInfo().userID,
				signUserId = PlayerData:GetPlayerInfo().signUserId,
				gameAppId = _G.ChannelLoginInfo.channelAppId,
				token = _G.ChannelLoginInfo.channelToken
			}

			OperationAction.OpenOperationUrl("PC_SHOP", var_68_0)
		end
	})
end

return var_0_0
