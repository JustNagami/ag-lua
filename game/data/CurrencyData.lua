local var_0_0 = singletonClass("CurrencyData")
local var_0_1 = 0
local var_0_2 = 0
local var_0_3 = 0
local var_0_4 = false
local var_0_5 = 0
local var_0_6 = {}
local var_0_7 = {}
local var_0_8 = {}

function var_0_0.Init(arg_1_0)
	var_0_1 = 0
	var_0_2 = 0
	var_0_3 = 0
	var_0_4 = false
	var_0_5 = 0
	var_0_6 = {}
	var_0_7 = {}
	var_0_8 = {}

	for iter_1_0, iter_1_1 in ipairs(ItemCfg.get_id_list_by_type[ItemConst.ITEM_TYPE.CURRENCY]) do
		var_0_6[iter_1_1] = {
			num = 0,
			id = iter_1_1
		}
	end

	manager.notify:Invoke(CURRENCY_UPDATE, 0)
end

function var_0_0.CurrencyBuyTimes(arg_2_0, arg_2_1, arg_2_2)
	var_0_1 = arg_2_1
	var_0_2 = arg_2_2

	manager.notify:Invoke(CURRENCY_BUY_TIME_UPDATE, 0)
end

function var_0_0.InitExpiredCurrencyList(arg_3_0, arg_3_1)
	var_0_8 = {}

	for iter_3_0, iter_3_1 in ipairs(arg_3_1) do
		if iter_3_1.num > 0 then
			table.insert(var_0_8, {
				id = iter_3_1.id,
				num = iter_3_1.num,
				timeValid = iter_3_1.time_valid
			})
		end
	end

	manager.notify:Invoke(MATERIAL_EXPIRED)
end

function var_0_0.CurrencyInit(arg_4_0, arg_4_1, arg_4_2)
	for iter_4_0, iter_4_1 in ipairs(arg_4_1) do
		if iter_4_1.time_valid and iter_4_1.time_valid ~= 0 then
			var_0_7[iter_4_1.id] = var_0_7[iter_4_1.id] or {}
			var_0_7[iter_4_1.id][iter_4_1.time_valid] = iter_4_1.num
		else
			var_0_6[iter_4_1.id] = {}
			var_0_6[iter_4_1.id].id = iter_4_1.id
			var_0_6[iter_4_1.id].num = iter_4_1.num

			manager.notify:Invoke(CURRENCY_UPDATE, iter_4_1.id)

			if iter_4_1.id == CurrencyConst.CURRENCY_TYPE_VITALITY then
				local var_4_0 = PlayerData:GetPlayerInfo().userLevel
				local var_4_1 = GameLevelSetting[var_4_0].fatigue_max

				if iter_4_1.num <= var_4_1 - GameSetting.push_notification_fatigue_threshold.value[1] then
					arg_4_0:SetFatigueCallFlag(1)
				end
			end
		end
	end

	if arg_4_2 ~= nil then
		var_0_3 = arg_4_2
	end

	SDKTools.SetDefaultPublicAttribute()
end

function var_0_0.SetLastFatigueRecoverTime(arg_5_0, arg_5_1)
	var_0_3 = arg_5_1
end

function var_0_0.SetCurrencyValue(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
	if arg_6_3 > 0 then
		var_0_7[arg_6_1] = var_0_7[arg_6_1] or {}
		var_0_7[arg_6_1][arg_6_3] = arg_6_2
	else
		var_0_6[arg_6_1].num = arg_6_2
	end

	if arg_6_1 == CurrencyConst.CURRENCY_TYPE_VITALITY and var_0_6[arg_6_1].num > ItemCfg[CurrencyConst.CURRENCY_TYPE_VITALITY].max then
		var_0_6[arg_6_1].num = ItemCfg[CurrencyConst.CURRENCY_TYPE_VITALITY].max
	end

	if arg_6_1 == CurrencyConst.GetOtherPlatformDiamondId() and AreaDifferenceCfg[GameToSDK.CURRENT_SERVER].currency_merge == 1 then
		arg_6_1 = CurrencyConst.GetPlatformDiamondId()
	end

	if arg_6_1 == CurrencyConst.CURRENCY_TYPE_SHIFTING_EXP then
		PolyhedronAction.RefreshPolicyRedPoint()
	end

	manager.notify:Invoke(CURRENCY_UPDATE, arg_6_1, arg_6_3, arg_6_2)

	if arg_6_1 == CurrencyConst.CURRENCY_TYPE_RECHARGE_DIAMOND_FREE or arg_6_1 == CurrencyConst.GetPlatformDiamondId() then
		SDKTools.SetCurrencyPublicAttribute(CurrencyConst.CURRENCY_TYPE_RECHARGE_DIAMOND_FREE)
	elseif arg_6_1 == CurrencyConst.CURRENCY_TYPE_VITALITY then
		SDKTools.SetCurrencyPublicAttribute(arg_6_1)
	elseif arg_6_1 == CurrencyConst.CURRENCY_TYPE_GOLD then
		SDKTools.SetCurrencyPublicAttribute(arg_6_1)
	elseif arg_6_1 == CurrencyConst.CURRENCY_TYPE_DIAMOND then
		SDKTools.SetCurrencyPublicAttribute(arg_6_1)
	end
end

function var_0_0.GetCurrencyMap(arg_7_0)
	return var_0_6
end

function var_0_0.GetTimeVaildCurrencyListBySubTypes(arg_8_0, arg_8_1)
	local var_8_0 = {}

	for iter_8_0, iter_8_1 in pairs(var_0_7[arg_8_1] or {}) do
		table.insert(var_8_0, {
			id = arg_8_1,
			num = iter_8_1,
			timeValid = iter_8_0
		})
	end

	return var_8_0
end

function var_0_0.GetGoldBuyTimes(arg_9_0)
	return var_0_1
end

function var_0_0.GetFatigueBuyTimes(arg_10_0)
	return var_0_2
end

function var_0_0.GetLastFatigueRecoverTime(arg_11_0)
	return var_0_3
end

function var_0_0.GetVitalityFull(arg_12_0)
	return var_0_4
end

function var_0_0.VitalityFull(arg_13_0, arg_13_1)
	var_0_4 = arg_13_1
end

function var_0_0.GetRechargeDiamond(arg_14_0)
	if var_0_6 == nil then
		return 0
	end

	local var_14_0 = var_0_6[CurrencyConst.GetPlatformDiamondId()].num
	local var_14_1 = var_0_6[CurrencyConst.CURRENCY_TYPE_RECHARGE_DIAMOND_FREE].num
	local var_14_2 = 0

	if AreaDifferenceCfg[GameToSDK.CURRENT_SERVER].currency_merge == 1 or SDKTools.GetIsOverSea() == false then
		var_14_2 = var_0_6[CurrencyConst.GetOtherPlatformDiamondId()].num
	end

	return var_14_0 + var_14_1 + var_14_2
end

function var_0_0.GetCurrencyNum(arg_15_0, arg_15_1)
	if arg_15_1 == CurrencyConst.CURRENCY_TYPE_RECHARGE_DIAMOND_FREE then
		return arg_15_0:GetRechargeDiamond()
	end

	if var_0_7[arg_15_1] then
		local var_15_0 = 0

		for iter_15_0, iter_15_1 in pairs(var_0_7[arg_15_1]) do
			var_15_0 = iter_15_1 + var_15_0
		end

		return var_15_0
	elseif var_0_6[arg_15_1] == nil then
		var_0_6[arg_15_1] = {
			num = 0,
			id = arg_15_1
		}

		return 0
	end

	return var_0_6[arg_15_1].num
end

function var_0_0.SetFatigueCallFlag(arg_16_0, arg_16_1)
	var_0_5 = arg_16_1
end

function var_0_0.GetFatigueCallFlag(arg_17_0)
	return var_0_5
end

function var_0_0.IsRechargeDiamond(arg_18_0, arg_18_1)
	return arg_18_1 == CurrencyIdMapCfg.CURRENCY_TYPE_RECHARGE_DIAMOND_FREE.item_id or arg_18_1 == CurrencyIdMapCfg.CURRENCY_TYPE_RECHARGE_DIAMOND_IOS.item_id or arg_18_1 == CurrencyIdMapCfg.CURRENCY_TYPE_RECHARGE_DIAMOND_NOT_IOS.item_id
end

function var_0_0.CheckExpiredCurrencyList(arg_19_0)
	return var_0_8
end

function var_0_0.ClearExpiredCurrencyList(arg_20_0)
	var_0_8 = {}
end

return var_0_0
