local var_0_0 = {}
local var_0_1 = {}
local var_0_2 = {}

function var_0_0.DlcConfirmBuyItem(arg_1_0, arg_1_1)
	var_0_1 = {}
	var_0_2 = {}

	local var_1_0 = ShopTools.GetCostCfg(arg_1_0)
	local var_1_1 = 0
	local var_1_2 = ""

	for iter_1_0, iter_1_1 in ipairs(arg_1_1) do
		local var_1_3 = getShopCfg(iter_1_1)
		local var_1_4, var_1_5, var_1_6 = ShopTools.GetPrice(iter_1_1, var_1_3.shop_id)

		var_1_1 = var_1_1 + var_1_4

		local var_1_7 = RechargeShopDescriptionCfg[var_1_3.description]

		if iter_1_0 == 1 then
			var_1_2 = GetI18NText(var_1_7.name)
		else
			var_1_2 = var_1_2 .. "," .. GetI18NText(var_1_7.name)
		end
	end

	local var_1_8 = 1

	ShowMessageBox({
		title = GetTips("PROMPT"),
		content = string.format(GetTips("CONFIRM_BUY"), GetI18NText(var_1_0.name), var_1_1, var_1_2, var_1_8),
		OkCallback = function()
			for iter_2_0, iter_2_1 in ipairs(arg_1_1) do
				local var_2_0 = getShopCfg(iter_2_1)

				if ShopData.IsGoodOutOfDate(iter_2_1, var_2_0.shop_id) then
					ShowTips("GOODS_HAS_BEEN_REMOVED")

					return
				end
			end

			var_0_1 = clone(arg_1_1)
			var_0_2 = {}

			local var_2_1 = table.remove(var_0_1, 1)
			local var_2_2 = getShopCfg(var_2_1)

			var_0_0.BuyItem(var_2_1, 1, nil, var_2_2.shop_id)
		end,
		CancelCallback = function()
			return
		end
	})
end

function var_0_0.BuyItem(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
	local var_4_0 = getShopCfg(arg_4_0, arg_4_3)
	local var_4_1

	var_4_1 = ShopListCfg[arg_4_3].type ~= 3

	local var_4_2 = var_4_0.shop_id

	if not ShopTools.IsShopOpen(var_4_2) then
		ShowTips("TIME_OVER")

		return
	end

	local var_4_3 = 0

	if arg_4_2 then
		var_4_3 = arg_4_2
	else
		var_4_3 = var_4_0.cost

		local var_4_4, var_4_5, var_4_6 = ShopTools.IsOnDiscountArea(arg_4_0, var_4_2)

		if var_4_4 and var_4_6 then
			var_4_3 = var_4_0.cheap_cost
		end
	end

	local var_4_7 = var_4_3 * arg_4_1
	local var_4_8 = ItemCfg[var_4_0.cost_id].type
	local var_4_9 = {}

	table.insert(var_4_9, {
		id = var_4_0.cost_id,
		num = var_4_7
	})

	local var_4_10 = {
		buy_id = arg_4_0,
		shop_id = var_4_0.shop_id,
		buy_num = arg_4_1,
		cost_items = var_4_9
	}

	var_4_10.buy_source = 0

	SendMessageManagerToSDK("purchase_complete_GP_ONCE")

	return manager.net:SendWithLoadingNew(20012, var_4_10, 20013, var_0_0.ShopItemUpdate)
end

function var_0_0.ShopItemUpdate(arg_5_0, arg_5_1)
	local var_5_0

	if arg_5_0.result == 0 then
		ShopData.ShopItemUpdate(arg_5_1.buy_id, arg_5_1.shop_id, arg_5_1.buy_num)

		local var_5_1 = getShopCfg(arg_5_1.buy_id, arg_5_1.shop_id)
		local var_5_2 = ShopTools.GetPrice(arg_5_1.buy_id, arg_5_1.shop_id) * arg_5_1.buy_num
		local var_5_3 = var_5_1.give_id or var_5_1.description
		local var_5_4 = var_5_1.give or 1
		local var_5_5
		local var_5_6

		if var_5_1.description then
			local var_5_7 = var_5_1.description

			var_5_6 = RechargeShopDescriptionCfg[var_5_7]
		else
			var_5_6 = ItemCfg[var_5_3]
		end

		if var_5_6.sub_type == ItemConst.ITEM_SUB_TYPE.SHOP_PACKS then
			local var_5_8 = {}
			local var_5_9 = var_5_6.param

			for iter_5_0, iter_5_1 in ipairs(var_5_9) do
				table.insert(var_5_8, {
					iter_5_1[1],
					iter_5_1[2] * arg_5_1.buy_num * var_5_4
				})
			end

			var_5_0 = var_5_8
		elseif var_5_6.sub_type == ItemConst.ITEM_SUB_TYPE.SHOP_SEVEN_PACKS then
			local var_5_10 = {}
			local var_5_11 = var_5_6.param[1]

			for iter_5_2, iter_5_3 in ipairs(var_5_11) do
				table.insert(var_5_10, {
					iter_5_3[1],
					iter_5_3[2] * arg_5_1.buy_num * var_5_4
				})
			end

			var_5_0 = var_5_10
		elseif var_5_6.type == 8 and var_5_1.description then
			var_5_0 = {}

			local var_5_12 = var_5_6.param[1]

			var_5_0 = {
				{
					var_5_12,
					1
				}
			}
		else
			var_5_0 = {
				{
					var_5_3,
					var_5_4 * arg_5_1.buy_num
				}
			}
		end

		if var_5_1.give_back_list and next(var_5_1.give_back_list) ~= nil then
			local var_5_13 = {}

			for iter_5_4, iter_5_5 in ipairs(var_5_1.give_back_list) do
				table.insert(var_5_13, {
					iter_5_5.id,
					iter_5_5.num
				})
			end

			table.insertto(var_5_0, var_5_13)
		end

		manager.notify:CallUpdateFunc(SHOP_BUY_CALLBACK, arg_5_0.result, arg_5_1.buy_id, arg_5_1.shop_id, arg_5_1.buy_num)
		table.insertto(var_0_2, var_5_0)

		if #var_0_1 == 0 then
			if var_5_0 and #var_5_0 > 0 then
				var_0_2 = formatRewardCfgList(var_0_2)
				var_0_2 = mergeReward(var_0_2)

				getReward(var_0_2, {
					ItemConst.ITEM_TYPE.HERO_SKIN
				})
			else
				ShowTips("TRANSACTION_SUCCESS")
			end
		else
			local var_5_14 = table.remove(var_0_1, 1)
			local var_5_15 = getShopCfg(var_5_14)

			var_0_0.BuyItem(var_5_14, 1, nil, var_5_15.shop_id)
		end
	elseif TipsCfg[arg_5_0.result] ~= nil then
		ShowTips(TipsCfg[arg_5_0.result].desc)
	else
		ShowTips(GetTips(tostring(arg_5_0.result)))
	end

	manager.notify:Invoke(SHOP_BUY_SUCCESS, arg_5_1.buy_id, arg_5_1.shop_id)
end

return var_0_0
