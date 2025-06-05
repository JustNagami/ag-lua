local var_0_0 = {}
local var_0_1 = 15

function var_0_0.GetRechargeDrawGiftList(arg_1_0)
	local var_1_0 = DrawPoolCfg[arg_1_0]

	if not var_1_0 or var_1_0.recharge_shop_list == "" then
		return {}
	else
		local var_1_1 = {}

		for iter_1_0, iter_1_1 in pairs(var_1_0.recharge_shop_list) do
			local var_1_2 = ShopCfg[iter_1_1]

			if var_1_2 and ShopTools.IsGoodCanDisplay(var_1_2.shop_id, iter_1_1) then
				table.insert(var_1_1, iter_1_1)
			end
		end

		table.sort(var_1_1, function(arg_2_0, arg_2_1)
			local var_2_0 = getShopCfg(arg_2_0)
			local var_2_1 = getShopCfg(arg_2_1)
			local var_2_2 = var_0_0.GetGoodStatus(arg_2_0)
			local var_2_3 = var_0_0.GetGoodStatus(arg_2_1)

			if var_2_2 ~= var_2_3 then
				return var_2_2 < var_2_3
			end

			if var_2_0.shop_sort ~= var_2_1.shop_sort then
				return var_2_0.shop_sort > var_2_1.shop_sort
			end

			return var_2_0.goods_id > var_2_1.goods_id
		end)

		return var_1_1
	end
end

function var_0_0.GetGoodStatus(arg_3_0)
	local var_3_0 = false
	local var_3_1 = getShopCfg(arg_3_0)
	local var_3_2 = ShopData.GetShop(var_3_1.shop_id)[arg_3_0]

	if ShopData.IsGoodOutOfDate(arg_3_0) then
		return 2
	end

	if var_3_2 ~= nil and var_3_1.limit_num ~= nil and var_3_1.limit_num ~= -1 and var_3_1.limit_num - var_3_2.buy_times <= 0 then
		var_3_0 = true
	end

	if var_3_0 then
		return 2
	end

	if ShopData.IsGoodUnlock(arg_3_0) == 0 then
		return 1
	end

	return 0
end

function var_0_0.GetCostTicket(arg_4_0, arg_4_1)
	local var_4_0 = var_0_0.GetCostTicketList(arg_4_0)

	arg_4_1 = arg_4_1 or 1

	for iter_4_0, iter_4_1 in ipairs(var_4_0) do
		if arg_4_1 <= ItemTools.getItemNum(iter_4_1) then
			return iter_4_1
		end
	end

	return var_4_0[#var_4_0]
end

function var_0_0.GetCostTicketList(arg_5_0)
	local var_5_0 = {}
	local var_5_1 = {
		DrawPoolCfg[arg_5_0].cost_once[1]
	}

	for iter_5_0, iter_5_1 in ipairs(var_5_1) do
		if ItemTools.getItemNum(iter_5_1) > 0 then
			table.insert(var_5_0, iter_5_1)
		end
	end

	local var_5_2 = var_5_1[#var_5_1]

	if not table.keyof(var_5_0, var_5_2) then
		table.insert(var_5_0, var_5_2)
	end

	return var_5_0
end

function var_0_0.GetActivityCostTicket(arg_6_0)
	return DrawPoolCfg[arg_6_0].cost_once_activity_material[1] or 0
end

function var_0_0.GetActivityPoolIdByTicketId(arg_7_0)
	for iter_7_0, iter_7_1 in pairs(DrawPoolCfg) do
		local var_7_0 = DrawPoolCfg[iter_7_0]

		if var_7_0.cost_once_activity_material and var_7_0.cost_once_activity_material[1] == arg_7_0 then
			return iter_7_0
		end
	end

	return nil
end

function var_0_0.LoadDrawLevel(arg_8_0)
	local var_8_0 = SceneManager.GetSceneByName("X102")

	if var_8_0 and var_8_0.isLoaded == true then
		return
	end

	if arg_8_0.operation_ then
		return
	end

	arg_8_0.operation_ = Asset.LoadLevelAsync("Levels/X102", true)

	if arg_8_0.timer_ then
		arg_8_0.timer_:Stop()

		arg_8_0.timer_ = nil
	end

	arg_8_0.timer_ = FrameTimer.New(handler(arg_8_0, arg_8_0.Process), 1, -1)

	arg_8_0.timer_:Start()
end

function var_0_0.Process(arg_9_0)
	if arg_9_0.operation_:IsDone() then
		if not gameContext:GetOpenPageHandler("draw") then
			local var_9_0 = SceneManager.GetSceneByName("X102")

			if var_9_0 and var_9_0.isLoaded == true then
				SceneManager.UnloadSceneAsync("X102")
			end
		end

		if arg_9_0.timer_ then
			arg_9_0.timer_:Stop()

			arg_9_0.timer_ = nil
		end

		arg_9_0.operation_ = nil
	end
end

function var_0_0.UnLoadDrawLevel(arg_10_0)
	if arg_10_0.operation_ then
		return
	end

	local var_10_0 = SceneManager.GetSceneByName("X102")

	if var_10_0 and var_10_0.isLoaded == true then
		SceneManager.UnloadSceneAsync("X102")
	end
end

function var_0_0.LevelIsDone(arg_11_0)
	if arg_11_0.operation_ then
		return arg_11_0.operation_:IsDone()
	end

	return true
end

local function var_0_2(arg_12_0)
	local var_12_0 = {}
	local var_12_1 = DrawPoolCfg[arg_12_0]

	if var_12_1.pool_type == 3 then
		if #var_12_1.unoption_up_items[1] == 0 then
			for iter_12_0, iter_12_1 in ipairs(var_12_1.optional_detail) do
				table.insert(var_12_0, iter_12_1)
			end
		else
			for iter_12_2, iter_12_3 in ipairs(var_12_1.unoption_up_items[1]) do
				table.insert(var_12_0, iter_12_3)
			end
		end

		for iter_12_4, iter_12_5 in ipairs(var_12_1.unoption_up_items[2]) do
			table.insert(var_12_0, iter_12_5)
		end
	end

	return var_12_0
end

function var_0_0.GetNowAllPool(arg_13_0)
	local var_13_0 = {}
	local var_13_1 = ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.DRAW] or {}

	for iter_13_0, iter_13_1 in ipairs(var_13_1) do
		if ActivityData:GetActivityIsOpen(iter_13_1) then
			local var_13_2 = ActivityDrawPoolCfg[iter_13_1]

			if var_13_2 then
				for iter_13_2, iter_13_3 in ipairs(var_13_2.config_list) do
					table.insert(var_13_0, iter_13_3)
				end
			end
		end
	end

	return var_13_0
end

function var_0_0.GetNowAllRolePool(arg_14_0)
	local var_14_0 = DrawData:GetPoolList()
	local var_14_1 = {}

	for iter_14_0, iter_14_1 in ipairs(var_14_0) do
		if DrawPoolCfg[iter_14_1].pool_type ~= 2 then
			table.insert(var_14_1, iter_14_1)
		end
	end

	table.sort(var_14_1, function(arg_15_0, arg_15_1)
		return DrawPoolCfg[arg_15_0].order < DrawPoolCfg[arg_15_1].order
	end)

	return var_14_1
end

function var_0_0.GetNowAllServantPool(arg_16_0)
	local var_16_0 = var_0_0:GetNowAllPool()
	local var_16_1 = {}

	for iter_16_0, iter_16_1 in ipairs(var_16_0) do
		if DrawPoolCfg[iter_16_1].pool_type == 2 then
			table.insert(var_16_1, iter_16_1)
		end
	end

	return var_16_1
end

function var_0_0.GetRoleUpPoolID(arg_17_0, arg_17_1)
	local var_17_0 = var_0_0:GetNowAllPool()

	for iter_17_0, iter_17_1 in ipairs(var_17_0) do
		for iter_17_2, iter_17_3 in ipairs(var_0_2(iter_17_1)) do
			if iter_17_3 == arg_17_1 then
				return iter_17_1
			end
		end
	end

	return false
end

function var_0_0.GetDrawBonusActivityIDList()
	local var_18_0 = {}

	for iter_18_0, iter_18_1 in ipairs(ActivityDrawBonusCfg.all) do
		if ActivityData:GetActivityIsOpen(iter_18_1) then
			table.insert(var_18_0, iter_18_1)
		end
	end

	return var_18_0
end

function var_0_0.GetDrawPieceActivityIDList()
	local var_19_0 = {}

	for iter_19_0, iter_19_1 in ipairs(ActivityDrawPieceCfg.all) do
		if ActivityData:GetActivityIsOpen(iter_19_1) then
			table.insert(var_19_0, iter_19_1)
		end
	end

	return var_19_0
end

function var_0_0.HasDrawBonusPoolList(arg_20_0)
	local var_20_0 = var_0_0.GetDrawBonusActivityIDList()

	for iter_20_0, iter_20_1 in ipairs(arg_20_0) do
		local var_20_1 = var_0_0.HasDrawBonusPoolID(var_20_0, iter_20_1)

		if var_20_1 then
			return var_20_1
		end
	end
end

function var_0_0.HasDrawBonusPoolID(arg_21_0, arg_21_1)
	for iter_21_0, iter_21_1 in ipairs(arg_21_0) do
		local var_21_0 = ActivityDrawBonusCfg[iter_21_1]

		if table.keyof(var_21_0.draw_pool_id, arg_21_1) then
			return iter_21_1
		end
	end

	return nil
end

function var_0_0.HasDrawPiecePoolID(arg_22_0, arg_22_1)
	for iter_22_0, iter_22_1 in ipairs(arg_22_0) do
		local var_22_0 = ActivityDrawPieceCfg[iter_22_1]

		if table.keyof(var_22_0.draw_pool_id, arg_22_1) then
			return iter_22_1
		end
	end

	return nil
end

function var_0_0.GetBonusCnt(arg_23_0)
	local var_23_0 = ActivityDrawBonusCfg[arg_23_0]
	local var_23_1 = var_23_0.reward
	local var_23_2 = var_23_0.need
	local var_23_3 = DrawData:GetPoolBonus(arg_23_0)

	return math.floor(var_23_3 / var_23_2) * var_23_1[1][2]
end

return var_0_0
