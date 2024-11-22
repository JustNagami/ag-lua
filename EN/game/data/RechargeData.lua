local var_0_0 = singletonClass("RechargeData")
local var_0_1 = {
	is_sign = 0,
	monthly_card_timestamp = 0,
	monthly_card_num = 0
}
local var_0_2 = {
	totalRechargeNum = 0,
	firstRechargeIdList = {},
	receiveTotalRechargeList = {}
}

function var_0_0.Init(arg_1_0)
	var_0_1.monthly_card_num = 0
	var_0_1.monthly_card_timestamp = 0
	var_0_1.is_sign = 0
	var_0_2 = {
		totalRechargeNum = 0,
		firstRechargeIdList = {},
		receiveTotalRechargeList = {}
	}
end

function var_0_0.InitWithServerData(arg_2_0, arg_2_1)
	var_0_1.monthly_card_num = arg_2_1.monthly_card_num
	var_0_1.monthly_card_timestamp = arg_2_1.monthly_card_timestamp
	var_0_1.is_sign = arg_2_1.is_sign
end

function var_0_0.InitTotalRechargeDataFromServer(arg_3_0, arg_3_1)
	var_0_2.totalRechargeNum = arg_3_1.total_recharge_num
	var_0_2.receiveTotalRechargeList = arg_3_1.receive_total_recharge_list
end

function var_0_0.InitFirstChargeDataFromServer(arg_4_0, arg_4_1)
	var_0_2.firstRechargeIdList = arg_4_1.first_recharge_id_list
end

function var_0_0.IsSignToday(arg_5_0)
	return var_0_1.is_sign == 1
end

function var_0_0.HaveMonthCard(arg_6_0)
	return var_0_1.monthly_card_timestamp > 0 and TimeMgr.GetInstance():GetServerTime() < var_0_1.monthly_card_timestamp
end

function var_0_0.SignToday(arg_7_0)
	var_0_1.is_sign = 1
end

function var_0_0.ResetSign(arg_8_0)
	var_0_1.is_sign = 0
end

function var_0_0.GetCardNum(arg_9_0)
	return var_0_1.monthly_card_num
end

function var_0_0.GetMonthCardDeadTime(arg_10_0)
	return var_0_1.monthly_card_timestamp
end

function var_0_0.MarkBonusGet(arg_11_0, arg_11_1)
	var_0_2.receiveTotalRechargeList = arg_11_1.receive_total_recharge_list
end

function var_0_0.GetTotalRechargeNum(arg_12_0)
	return var_0_2.totalRechargeNum
end

function var_0_0.HaveGetTotalRechargeBonus(arg_13_0, arg_13_1)
	if not table.indexof(var_0_2.receiveTotalRechargeList, arg_13_1) then
		return false
	end

	return true
end

function var_0_0.HaveRecharged(arg_14_0, arg_14_1)
	if not table.indexof(var_0_2.firstRechargeIdList, arg_14_1) then
		return false
	end

	return true
end

function var_0_0.RecordTotalRecharge(arg_15_0, arg_15_1)
	local var_15_0 = PaymentCfg[arg_15_1]

	var_0_2.totalRechargeNum = var_0_2.totalRechargeNum + var_15_0.total_point

	manager.notify:Invoke(TOTAL_RECHARGE_UPDATE, arg_15_1)
	SDKTools.SetRechargePublicAttribute()
	print("totalRechargeData.totalRechargeNum" .. tostring(var_0_2.totalRechargeNum))
	SendMessageManagerToSDK("charge_Total", {
		total = var_0_2.totalRechargeNum
	})
end

function var_0_0.RecordRecharge(arg_16_0, arg_16_1)
	if not table.indexof(var_0_2.firstRechargeIdList, arg_16_1) then
		table.insert(var_0_2.firstRechargeIdList, arg_16_1)
	end

	manager.notify:Invoke(RECHARGE_UPDATE, arg_16_1)
end

function var_0_0.HaveUngetTotalRechargeBonus(arg_17_0)
	for iter_17_0, iter_17_1 in ipairs(TotalRechargeCfg.all) do
		local var_17_0 = TotalRechargeCfg[iter_17_1]

		if var_0_2.totalRechargeNum >= var_17_0.num and not arg_17_0:HaveGetTotalRechargeBonus(iter_17_1) then
			return true
		end
	end

	return false
end

function var_0_0.GetMonthCardLastDay(arg_18_0)
	local var_18_0 = arg_18_0:GetMonthCardDeadTime() - TimeMgr.GetInstance():GetServerTime()
	local var_18_1 = math.floor(var_18_0 / 86400)

	if var_18_1 < 0 then
		var_18_1 = 0
	end

	return var_18_1
end

return var_0_0
