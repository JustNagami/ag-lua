local var_0_0 = {}

manager.net:Bind(34101, function(arg_1_0)
	BigMonthCardData:InitData(arg_1_0)
	var_0_0.RefreshRedPoint()
end)

function var_0_0.SignToday()
	manager.net:SendWithLoadingNew(34110, {}, 34111, var_0_0.OnSignToday)
end

function var_0_0.OnSignToday(arg_3_0, arg_3_1)
	if isSuccess(arg_3_0.result) then
		BigMonthCardData:SetRecord(arg_3_0.daily_record)
		BigMonthCardData:UpdateIsSign(arg_3_0.is_sign)
		BigMonthCardData:UpdateSignData(arg_3_0.total_sign_times)
		var_0_0.RefreshRedPoint()
		manager.notify:CallUpdateFunc(BIG_MONTH_CARD_SIGN, arg_3_0.rewards, arg_3_0)
	else
		ShowTips(arg_3_0.result)
	end
end

function var_0_0.AccumulateSign(arg_4_0)
	local var_4_0 = {
		id = arg_4_0
	}

	manager.net:SendWithLoadingNew(34112, var_4_0, 34113, var_0_0.OnAccumulateSign)
end

function var_0_0.OnAccumulateSign(arg_5_0, arg_5_1)
	if isSuccess(arg_5_0.result) then
		BigMonthCardData:SignAccumulate(arg_5_1.id)
		var_0_0.RefreshRedPoint()

		local var_5_0 = arg_5_1.id
		local var_5_1 = BigMonthCardAccumulationCfg[var_5_0].template_id
		local var_5_2 = table.indexof(BigMonthCardAccumulationCfg.get_id_list_by_template_id[var_5_1], var_5_0)

		manager.notify:CallUpdateFunc(BIG_MONTH_CARD_ACCUMULATE_SIGN, arg_5_0.rewards, arg_5_0, var_5_2)
	else
		ShowTips(arg_5_0.result)
	end
end

function var_0_0.BuyBigMonthCard()
	manager.net:SendWithLoadingNew(34114, {}, 34115, var_0_0.OnBuyBigMonthCard)
end

function var_0_0.OnBuyBigMonthCard(arg_7_0, arg_7_1)
	if isSuccess(arg_7_0.result) then
		manager.notify:Invoke(BUY_BIG_MONTH_CARD)
		ShowTips("TRANSACTION_SUCCESS")
	else
		ShowTips(arg_7_0.result)
	end
end

function var_0_0.RefreshRedPoint()
	if BigMonthCardData:HaveMonthCard() and (not BigMonthCardData:IsSignToday() or BigMonthCardData:IsNeedAccumulatSign()) then
		manager.redPoint:setTip(RedPointConst.BIG_MONTH_CARD, 1)
	else
		manager.redPoint:setTip(RedPointConst.BIG_MONTH_CARD, 0)
	end
end

function var_0_0.FirstLoginSinceMonthCardFinish()
	manager.net:SendWithLoadingNew(34116, {}, 34117, var_0_0.OnFirstLoginSinceMonthCardFinish)
end

function var_0_0.OnFirstLoginSinceMonthCardFinish(arg_10_0, arg_10_1)
	if isSuccess(arg_10_0.result) then
		BigMonthCardData:SetIsExpireTip()
	else
		ShowTips(arg_10_0.result)
	end
end

return var_0_0
