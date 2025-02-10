local var_0_0 = singletonClass("ActivityAutoCookData")

function var_0_0.Init(arg_1_0)
	arg_1_0.curTimeStep_ = 0
	arg_1_0.curGetGold_ = 0
	arg_1_0.curHaveGold_ = 0
	arg_1_0.curSubGoldRate_ = 0
	arg_1_0.cacheGoldRate_ = nil
	arg_1_0.curElementList_ = {}
	arg_1_0.cacheElementList_ = {}
	arg_1_0.stageData_ = {}

	arg_1_0:InitFoodInfo()

	arg_1_0.firstInitData_ = true
	arg_1_0.speedTipsID_ = 0
	arg_1_0.localSpeedRateList_ = {}
end

function var_0_0.InitFoodInfo(arg_2_0)
	arg_2_0.zeroFoodInfo_ = {}
	arg_2_0.threeFoodInfo_ = {}
	arg_2_0.fourFoodInfo_ = {}
	arg_2_0.zeroFoodIndex_ = 1

	for iter_2_0, iter_2_1 in pairs(ActivityAutoCookFoodCfg.all) do
		local var_2_0 = ActivityAutoCookFoodCfg[iter_2_1]

		if #var_2_0.recipe == 0 then
			table.insert(arg_2_0.zeroFoodInfo_, iter_2_1)
		elseif #var_2_0.recipe == 3 then
			table.insert(arg_2_0.threeFoodInfo_, iter_2_1)
		elseif #var_2_0.recipe == 4 then
			table.insert(arg_2_0.fourFoodInfo_, iter_2_1)
		end
	end
end

function var_0_0.Cook(arg_3_0, arg_3_1)
	local var_3_0 = #arg_3_1

	if var_3_0 == 3 then
		for iter_3_0, iter_3_1 in pairs(arg_3_0.threeFoodInfo_) do
			local var_3_1 = ActivityAutoCookFoodCfg[iter_3_1]
			local var_3_2 = true

			for iter_3_2, iter_3_3 in pairs(var_3_1.recipe) do
				if not table.indexof(arg_3_1, iter_3_3) then
					var_3_2 = false

					break
				end
			end

			if var_3_2 then
				return iter_3_1
			end
		end

		local var_3_3 = arg_3_0.zeroFoodInfo_[arg_3_0.zeroFoodIndex_]

		arg_3_0.zeroFoodIndex_ = arg_3_0.zeroFoodIndex_ + 1

		if arg_3_0.zeroFoodIndex_ > #arg_3_0.zeroFoodInfo_ then
			arg_3_0.zeroFoodIndex_ = 1
		end

		return var_3_3
	elseif var_3_0 == 4 then
		for iter_3_4, iter_3_5 in pairs(arg_3_0.fourFoodInfo_) do
			local var_3_4 = ActivityAutoCookFoodCfg[iter_3_5]
			local var_3_5 = true

			for iter_3_6, iter_3_7 in pairs(var_3_4.recipe) do
				if not table.indexof(arg_3_1, iter_3_7) then
					var_3_5 = false

					break
				end
			end

			if var_3_5 then
				return iter_3_5
			end
		end

		local var_3_6 = arg_3_0.zeroFoodInfo_[arg_3_0.zeroFoodIndex_]

		arg_3_0.zeroFoodIndex_ = arg_3_0.zeroFoodIndex_ + 1

		if arg_3_0.zeroFoodIndex_ > #arg_3_0.zeroFoodInfo_ then
			arg_3_0.zeroFoodIndex_ = 1
		end

		return var_3_6
	end
end

function var_0_0.SetData(arg_4_0, arg_4_1)
	arg_4_0.curTimeStep_ = arg_4_1.data.timestamp
	arg_4_0.curGetGold_ = arg_4_1.data.week_token_num
	arg_4_0.curHaveGold_ = arg_4_1.data.profit_num
	arg_4_0.curSubGoldRate_ = arg_4_1.data.token_rate
	arg_4_0.curElementList_ = cleanProtoTable(arg_4_1.data.rate_list)

	if arg_4_0.cacheGoldRate_ and arg_4_0.curSubGoldRate_ > arg_4_0.cacheGoldRate_ then
		if not arg_4_0.firstInitData_ then
			arg_4_0:UpdateSpeedTips()
		end

		arg_4_0.cacheElementList_ = clone(arg_4_0.curElementList_)
	end

	arg_4_0.cacheGoldRate_ = arg_4_0.curSubGoldRate_
	arg_4_0.curHaveGoldMax_ = arg_4_1.data.profit_max
	arg_4_0.stageData_ = {}

	for iter_4_0, iter_4_1 in ipairs(arg_4_1.data.stage_info_list) do
		arg_4_0.stageData_[iter_4_1.stage_id] = iter_4_1.stage_num
	end

	arg_4_0.curSubGold_ = 0
	arg_4_0.firstInitData_ = false
end

function var_0_0.UpdateAutoCookReward(arg_5_0)
	local var_5_0 = manager.time:GetServerTime() - arg_5_0.curTimeStep_
	local var_5_1 = math.floor((var_5_0 - var_5_0 % 360) / 360) * arg_5_0.curSubGoldRate_
	local var_5_2 = GameSetting.auto_cook_item_week_max.value[1] - arg_5_0.curGetGold_ - arg_5_0.curHaveGold_
	local var_5_3 = arg_5_0.curHaveGoldMax_ - arg_5_0.curHaveGold_

	if var_5_2 < 0 then
		var_5_2 = 0
	end

	if var_5_3 < 0 then
		var_5_3 = 0
	end

	local var_5_4

	if var_5_3 < var_5_2 then
		var_5_4 = var_5_3
	else
		var_5_4 = var_5_2
	end

	if var_5_4 < var_5_1 then
		arg_5_0.curSubGold_ = var_5_4
	else
		arg_5_0.curSubGold_ = var_5_1
	end
end

function var_0_0.GetCurHaveGold(arg_6_0)
	arg_6_0:UpdateAutoCookReward()

	return arg_6_0.curHaveGold_ + arg_6_0.curSubGold_
end

function var_0_0.GetCurWeekCanGet(arg_7_0)
	return GameSetting.auto_cook_item_week_max.value[1] - arg_7_0.curGetGold_ - arg_7_0.curHaveGold_
end

function var_0_0.GetCurGetGold(arg_8_0)
	return arg_8_0.curGetGold_
end

function var_0_0.GetCurHaveGoldMax(arg_9_0)
	return arg_9_0.curHaveGoldMax_
end

function var_0_0.GetCurElemontList(arg_10_0)
	return arg_10_0.curElementList_
end

function var_0_0.FinishStage(arg_11_0, arg_11_1)
	if arg_11_0.stageData_[arg_11_1] == nil then
		arg_11_0.stageData_[arg_11_1] = 1
	end

	if arg_11_0.stageData_[arg_11_1] == 1 then
		arg_11_0:SetFirstFinishStageID(arg_11_1)
	end
end

function var_0_0.GetStageIsFinish(arg_12_0, arg_12_1)
	if arg_12_0.stageData_[arg_12_1] and arg_12_0.stageData_[arg_12_1] > 0 then
		return true
	else
		return false
	end
end

function var_0_0.GetFirstFinishStageID(arg_13_0)
	return arg_13_0.firstFinishStageID_
end

function var_0_0.SetFirstFinishStageID(arg_14_0, arg_14_1)
	arg_14_0.firstFinishStageID_ = arg_14_1
end

function var_0_0.UpdateSpeedTips(arg_15_0)
	local var_15_0 = arg_15_0:GetDiffientID()

	if var_15_0 == nil then
		return
	end

	local var_15_1 = ActivityAutoCookSpeedCfg[var_15_0]

	if var_15_1 == nil or var_15_1.tips_id == 0 then
		return
	end

	local var_15_2 = var_15_1.tips_id

	if var_15_1.type == 11802 then
		QWorldData:AddHint(var_15_2)
	else
		arg_15_0.speedTipsID_ = var_15_2
	end
end

function var_0_0.GetDiffientID(arg_16_0)
	for iter_16_0, iter_16_1 in ipairs(arg_16_0.curElementList_) do
		if not table.keyof(arg_16_0.cacheElementList_, iter_16_1) then
			return iter_16_1
		end
	end
end

function var_0_0.GetSpeedTipsID(arg_17_0)
	return arg_17_0.speedTipsID_
end

function var_0_0.ClearSpeedTipsID(arg_18_0)
	arg_18_0.speedTipsID_ = 0
end

function var_0_0.GetLocalSpeedRate(arg_19_0, arg_19_1)
	arg_19_0.localSpeedRateList_[arg_19_1] = arg_19_0.localSpeedRateList_[arg_19_1] or getData("AutoCook", "goldRate" .. arg_19_1) or 0

	return arg_19_0.localSpeedRateList_[arg_19_1]
end

function var_0_0.SetLocalSpeedRate(arg_20_0, arg_20_1, arg_20_2)
	arg_20_0.localSpeedRateList_[arg_20_1] = arg_20_2

	saveData("AutoCook", "goldRate" .. arg_20_1, arg_20_2)
end

function var_0_0.GetCurSpeedRate(arg_21_0)
	return arg_21_0.curSubGoldRate_
end

return var_0_0
