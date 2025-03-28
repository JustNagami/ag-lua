local var_0_0 = {
	GetActivityList = function()
		local var_1_0 = {}

		for iter_1_0, iter_1_1 in ipairs(ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.SKIN_DISCOUNT_GIFT]) do
			if ActivityData:GetActivityIsOpen(iter_1_1) then
				table.insert(var_1_0, iter_1_1)
			end
		end

		return var_1_0
	end,
	HasGiftActivityID = function()
		local var_2_0 = SkinDiscountGiftTools.GetActivityList()

		for iter_2_0, iter_2_1 in ipairs(var_2_0) do
			for iter_2_2, iter_2_3 in ipairs(ActivitySkinDiscountCfg.get_id_list_by_activity_id[iter_2_1]) do
				if ActivitySkinDiscountCfg[iter_2_3].limit_num > SkinDiscountGiftData:GetUsedTimes(iter_2_3) then
					return iter_2_1
				end
			end
		end
	end,
	HasDiscountGoodsID = function(arg_3_0)
		local var_3_0 = SkinDiscountGiftTools.GetActivityList()

		for iter_3_0, iter_3_1 in ipairs(var_3_0) do
			for iter_3_2, iter_3_3 in ipairs(ActivitySkinDiscountCfg.get_id_list_by_activity_id[iter_3_1]) do
				local var_3_1 = ActivitySkinDiscountCfg[iter_3_3]

				if var_3_1.limit_num > SkinDiscountGiftData:GetUsedTimes(iter_3_3) then
					for iter_3_4, iter_3_5 in ipairs(var_3_1.goods_id) do
						if iter_3_5[1] == arg_3_0 then
							return iter_3_1
						end
					end
				end
			end
		end

		return nil
	end
}

function var_0_0.HasCheapGoodsList(arg_4_0)
	local var_4_0 = SkinDiscountGiftData:GetGoodsIDList()

	for iter_4_0, iter_4_1 in ipairs(var_4_0) do
		if var_0_0.HasCheapGoods(arg_4_0, iter_4_1.skinGoodsID) then
			return true
		end
	end

	return false
end

function var_0_0.HasCheapGoods(arg_5_0, arg_5_1)
	local var_5_0 = var_0_0.GetItemIDByGoodsID(arg_5_1)
	local var_5_1 = SkinCfg[var_5_0].hero
	local var_5_2 = ShopTools.GetPrice(arg_5_1)

	for iter_5_0, iter_5_1 in ipairs(ActivitySkinDiscountCfg[arg_5_0].goods_id) do
		if not SkinDiscountGiftTools.HasSkin(iter_5_1[1]) then
			local var_5_3 = var_0_0.GetItemIDByGoodsID(iter_5_1[1])

			if var_5_1 == SkinCfg[var_5_3].hero and var_5_2 < ShopTools.GetPrice(iter_5_1[1]) then
				return true
			end
		end
	end

	return false
end

function var_0_0.GetDiscountActivityID(arg_6_0)
	local var_6_0 = SkinDiscountGiftTools.GetActivityList()

	for iter_6_0, iter_6_1 in ipairs(var_6_0) do
		for iter_6_2, iter_6_3 in ipairs(ActivitySkinDiscountCfg.get_id_list_by_activity_id[iter_6_1]) do
			local var_6_1 = ActivitySkinDiscountCfg[iter_6_3]

			if var_6_1.limit_num > SkinDiscountGiftData:GetUsedTimes(iter_6_3) then
				for iter_6_4, iter_6_5 in ipairs(var_6_1.goods_id) do
					if iter_6_5[1] == arg_6_0 or iter_6_5[2] == arg_6_0 then
						return iter_6_1
					end
				end
			end
		end
	end
end

function var_0_0.GetEntramceItemPrefabPath(arg_7_0)
	return "Widget/System/Recharge/RechargeSkinEventUI_main"
end

function var_0_0.GetSignActivityID(arg_8_0)
	local var_8_0 = ActivityCfg[arg_8_0]

	for iter_8_0, iter_8_1 in ipairs(var_8_0.sub_activity_list) do
		if ActivityCfg[iter_8_1].activity_template == ActivityTemplateConst.SKIN_DISCOUNT_GIFT_SIGN then
			return iter_8_1
		end
	end
end

function var_0_0.GetSignState(arg_9_0, arg_9_1)
	return SignTools.GetSevenDaySignState2(arg_9_0, arg_9_1)
end

function var_0_0.GetRemainCount(arg_10_0)
	return ActivitySkinDiscountCfg[arg_10_0].limit_num - SkinDiscountGiftData:GetUsedTimes(arg_10_0)
end

function var_0_0.HasAllGoodsSkin(arg_11_0)
	local var_11_0 = ActivitySkinDiscountCfg[arg_11_0].goods_id

	for iter_11_0, iter_11_1 in ipairs(var_11_0) do
		if not var_0_0.HasSkin(iter_11_1[1]) or not var_0_0.HasScene(iter_11_1[2]) then
			return false
		end
	end

	return true
end

function var_0_0.GetGoodsList(arg_12_0, arg_12_1)
	local var_12_0 = {}
	local var_12_1 = {}
	local var_12_2 = {}
	local var_12_3 = {}
	local var_12_4 = ActivitySkinDiscountCfg[arg_12_0].goods_id

	for iter_12_0, iter_12_1 in ipairs(var_12_4) do
		local var_12_5 = iter_12_1[1]
		local var_12_6 = iter_12_1[2]

		if var_0_0.HasSkin(var_12_5) then
			table.insert(var_12_1, iter_12_0)
		else
			table.insert(var_12_0, iter_12_0)
		end

		local var_12_7, var_12_8 = var_0_0.GetGoodsPrice(var_12_5, var_12_6)

		var_12_2[iter_12_0] = var_12_7

		if var_12_7 ~= var_12_8 then
			table.insert(var_12_3, iter_12_0)
		end
	end

	table.sort(var_12_0, function(arg_13_0, arg_13_1)
		local var_13_0 = table.keyof(var_12_3, arg_13_0)
		local var_13_1 = table.keyof(var_12_3, arg_13_1)

		if var_13_0 and not var_13_1 then
			return true
		elseif not var_13_0 and var_13_1 then
			return false
		end

		if var_12_2[arg_13_0] == var_12_2[arg_13_1] then
			return var_12_4[arg_13_0][1] > var_12_4[arg_13_1][1]
		elseif var_12_2[arg_13_0] > var_12_2[arg_13_1] then
			return true
		end

		return false
	end)
	table.sort(var_12_1, function(arg_14_0, arg_14_1)
		local var_14_0 = table.keyof(var_12_3, arg_14_0)
		local var_14_1 = table.keyof(var_12_3, arg_14_1)

		if var_14_0 and not var_14_1 then
			return true
		elseif not var_14_0 and var_14_1 then
			return false
		end

		if var_12_2[arg_14_0] == var_12_2[arg_14_1] then
			return var_12_4[arg_14_0][1] > var_12_4[arg_14_1][1]
		elseif var_12_2[arg_14_0] > var_12_2[arg_14_1] then
			return true
		end

		return false
	end)
	table.insertto(var_12_0, var_12_1)

	local var_12_9 = {}

	for iter_12_2, iter_12_3 in ipairs(var_12_0) do
		table.insert(var_12_9, var_12_4[iter_12_3])
	end

	return var_12_9
end

function var_0_0.HasSkin(arg_15_0)
	local var_15_0 = getShopCfg(arg_15_0).description
	local var_15_1 = RechargeShopDescriptionCfg[var_15_0].param[1]

	if ShopTools.HaveSkin(var_15_1) or HeroTools.CanChangeSkin(var_15_1) then
		return true
	end

	return false
end

function var_0_0.HasScene(arg_16_0)
	if arg_16_0 == nil then
		return true
	end

	return ShopTools.CheckDlcPurchased(arg_16_0)
end

function var_0_0.GetItemIDByGoodsID(arg_17_0)
	local var_17_0 = getShopCfg(arg_17_0)

	if var_17_0.shop_refresh == 3 then
		local var_17_1 = var_17_0.description

		return RechargeShopDescriptionCfg[var_17_1].param[1]
	else
		return var_17_0.give_id
	end
end

function var_0_0.IsSelectSkinGoodsID(arg_18_0)
	local var_18_0 = SkinDiscountGiftData:GetGoodsIDList()

	for iter_18_0, iter_18_1 in ipairs(var_18_0) do
		if iter_18_1.skinGoodsID == arg_18_0 then
			return true
		end
	end

	return false
end

function var_0_0.IsSelectSceneGoodsID(arg_19_0)
	local var_19_0 = SkinDiscountGiftData:GetGoodsIDList()

	for iter_19_0, iter_19_1 in ipairs(var_19_0) do
		if iter_19_1.sceneGoodsID == arg_19_0 then
			return iter_19_1.isSelectSceneID
		end
	end

	return false
end

function var_0_0.IsFullSkinGoodsID(arg_20_0)
	return arg_20_0 <= #SkinDiscountGiftData:GetGoodsIDList()
end

function var_0_0.GetGoodsPrice(arg_21_0, arg_21_1)
	local var_21_0 = 0
	local var_21_1 = 0
	local var_21_2 = 0
	local var_21_3 = 0

	if not SkinDiscountGiftTools.HasSkin(arg_21_0) then
		var_21_0, var_21_1 = ShopTools.GetPrice(arg_21_0)
	end

	if arg_21_1 and not SkinDiscountGiftTools.HasScene(arg_21_1) then
		var_21_2, var_21_3 = ShopTools.GetPrice(arg_21_1)
	end

	return var_21_0 + var_21_2, var_21_1 + var_21_3
end

function var_0_0.GetTotalDiscountPrice(arg_22_0)
	local var_22_0 = SkinDiscountGiftData:GetGoodsIDList()
	local var_22_1 = 0

	for iter_22_0 = 1, 2 do
		local var_22_2 = var_22_0[iter_22_0]

		if var_22_2 then
			local var_22_3, var_22_4 = ShopTools.GetPrice(var_22_2.skinGoodsID)

			var_22_1 = var_22_1 + math.floor(var_22_3 * arg_22_0)

			if var_22_2.isSelectSceneID and var_22_2.sceneGoodsID then
				local var_22_5, var_22_6 = ShopTools.GetPrice(var_22_2.sceneGoodsID)

				var_22_1 = var_22_1 + math.floor(var_22_5 * arg_22_0)
			end
		end
	end

	return var_22_1
end

function var_0_0.GetReturePrice()
	local var_23_0 = 0
	local var_23_1 = SkinDiscountGiftData:GetGoodsIDList()

	for iter_23_0, iter_23_1 in ipairs(var_23_1) do
		local var_23_2 = iter_23_1.skinGoodsID
		local var_23_3 = getShopCfg(var_23_2)

		if not SkinDiscountGiftTools.HasSkin(var_23_2) and var_23_3.give_back_list and #var_23_3.give_back_list > 0 then
			var_23_0 = var_23_0 + var_23_3.give_back_list[1].num
		end
	end

	return var_23_0
end

return var_0_0
