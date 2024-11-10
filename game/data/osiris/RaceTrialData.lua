local var_0_0 = singletonClass("RaceTrialData")

function var_0_0.Init(arg_1_0)
	arg_1_0.totalScore_ = 0
	arg_1_0.battleData_ = {
		get_id_list = {}
	}
	arg_1_0.scoreRewardData_ = {}
	arg_1_0.battleState_ = {
		complete = 2,
		received = 3,
		incomplete = 1
	}
end

function var_0_0.InitData(arg_2_0, arg_2_1)
	local var_2_0 = arg_2_1.activity_id

	arg_2_0:ModifyScoreRewardData(arg_2_1.got_reward_list or {})

	local var_2_1 = ActivityData:GetActivityData(var_2_0).subActivityIdList

	for iter_2_0, iter_2_1 in ipairs(var_2_1) do
		arg_2_0:RefreshRedPoint(iter_2_1)
	end
end

function var_0_0.InitBattleData(arg_3_0, arg_3_1)
	local var_3_0 = ActivityData:GetActivityData(arg_3_1).subActivityIdList

	for iter_3_0, iter_3_1 in ipairs(var_3_0) do
		arg_3_0.battleData_[iter_3_1] = {
			point = 0,
			state = 1,
			id = iter_3_1,
			customList = {}
		}
	end

	arg_3_0.battleData_.get_id_list = {}
end

function var_0_0.InitScoreRewardData(arg_4_0, arg_4_1)
	local var_4_0 = ActivityPointRewardCfg.get_id_list_by_activity_id[arg_4_1]

	if var_4_0 ~= nil then
		for iter_4_0, iter_4_1 in ipairs(var_4_0) do
			arg_4_0.scoreRewardData_[iter_4_1] = {}
			arg_4_0.scoreRewardData_[iter_4_1].id = iter_4_1
			arg_4_0.scoreRewardData_[iter_4_1].receive_flag = false
		end
	end
end

function var_0_0.ModifyScoreRewardData(arg_5_0, arg_5_1)
	for iter_5_0, iter_5_1 in ipairs(arg_5_1) do
		arg_5_0.scoreRewardData_[iter_5_1].receive_flag = true
	end
end

function var_0_0.RefreshBattleData(arg_6_0, arg_6_1)
	local var_6_0 = arg_6_1.challenge
	local var_6_1 = {}

	for iter_6_0, iter_6_1 in ipairs(var_6_0.custom_affix_list) do
		var_6_1[iter_6_0] = iter_6_1
	end

	arg_6_0.battleData_[var_6_0.activity_id] = {
		id = var_6_0.activity_id,
		state = var_6_0.first_clear_reward_apply_state,
		customList = var_6_1,
		point = var_6_0.point
	}

	arg_6_0:RefreshRedPoint(var_6_0.activity_id)
end

function var_0_0.GetTotalScore(arg_7_0, arg_7_1)
	arg_7_0.totalScore_ = 0

	local var_7_0 = ActivityData:GetActivityData(arg_7_1).subActivityIdList

	for iter_7_0, iter_7_1 in ipairs(var_7_0) do
		local var_7_1 = arg_7_0.battleData_[iter_7_1]

		arg_7_0.totalScore_ = arg_7_0.totalScore_ + (var_7_1 and var_7_1.point or 0)
	end

	return arg_7_0.totalScore_
end

function var_0_0.GetCurLv(arg_8_0, arg_8_1)
	local var_8_0
	local var_8_1 = ActivityPointRewardCfg.get_id_list_by_activity_id[arg_8_1]

	for iter_8_0, iter_8_1 in ipairs(var_8_1) do
		local var_8_2 = arg_8_0.scoreRewardData_[iter_8_1]

		if not var_8_2.receive_flag then
			return var_8_2.id
		end
	end

	return var_8_1[#var_8_1]
end

function var_0_0.GetFirstRewardSortList(arg_9_0, arg_9_1)
	local var_9_0
	local var_9_1 = {}
	local var_9_2 = {}
	local var_9_3 = {}
	local var_9_4 = {}
	local var_9_5 = ActivityData:GetActivityData(arg_9_1).subActivityIdList

	for iter_9_0, iter_9_1 in ipairs(var_9_5) do
		local var_9_6 = arg_9_0.battleData_[iter_9_1]

		if var_9_6.state == arg_9_0.battleState_.incomplete then
			table.insert(var_9_3, iter_9_1)
		elseif var_9_6.state == arg_9_0.battleState_.complete then
			table.insert(var_9_2, iter_9_1)
		elseif var_9_6.state == arg_9_0.battleState_.received then
			table.insert(var_9_4, iter_9_1)
		end
	end

	table.insertto(var_9_1, var_9_2)
	table.insertto(var_9_1, var_9_3)
	table.insertto(var_9_1, var_9_4)

	return var_9_1
end

function var_0_0.GetBattleData(arg_10_0, arg_10_1)
	return arg_10_0.battleData_[arg_10_1]
end

function var_0_0.GetScoreRewardSortList(arg_11_0, arg_11_1)
	local var_11_0
	local var_11_1
	local var_11_2 = {}
	local var_11_3 = {}
	local var_11_4 = {}
	local var_11_5 = {}
	local var_11_6 = ActivityPointRewardCfg.get_id_list_by_activity_id[arg_11_1]

	for iter_11_0, iter_11_1 in ipairs(var_11_6) do
		local var_11_7 = arg_11_0.scoreRewardData_[iter_11_1]
		local var_11_8 = ActivityPointRewardCfg[iter_11_1].need

		if var_11_7.receive_flag then
			table.insert(var_11_5, var_11_7.id)
		elseif var_11_8 <= arg_11_0.totalScore_ then
			table.insert(var_11_3, var_11_7.id)
		else
			table.insert(var_11_4, var_11_7.id)
		end
	end

	table.insertto(var_11_2, var_11_3)
	table.insertto(var_11_2, var_11_4)
	table.insertto(var_11_2, var_11_5)

	return var_11_2
end

function var_0_0.GetScoreRewardByID(arg_12_0, arg_12_1)
	return arg_12_0.scoreRewardData_[arg_12_1]
end

function var_0_0.GetRaceTrialStartTime(arg_13_0, arg_13_1)
	return ActivityData:GetActivityData(arg_13_1).startTime
end

function var_0_0.GetRaceTrialEndTime(arg_14_0, arg_14_1)
	return ActivityData:GetActivityData(arg_14_1).stopTime
end

function var_0_0.GetCustomList(arg_15_0, arg_15_1)
	return arg_15_0.battleData_[arg_15_1].customList
end

function var_0_0.GetCustomListByStageID(arg_16_0, arg_16_1)
	local var_16_0
	local var_16_1 = ActivityRaceTrialCfg.all

	for iter_16_0, iter_16_1 in ipairs(var_16_1) do
		local var_16_2 = ActivityRaceTrialCfg[iter_16_1]

		if arg_16_1 == var_16_2.stage_id then
			return arg_16_0.battleData_[var_16_2.id].customList
		end
	end

	print("匹配出错")

	return {}
end

function var_0_0.ReceiveScoreReward(arg_17_0, arg_17_1)
	arg_17_0.scoreRewardData_[arg_17_1].receive_flag = true

	local var_17_0 = ActivityPointRewardCfg[arg_17_1].activity_id
	local var_17_1 = ActivityData:GetActivityData(var_17_0).subActivityIdList

	for iter_17_0, iter_17_1 in ipairs(var_17_1) do
		arg_17_0:RefreshScoreRedPoint(iter_17_1)
	end
end

function var_0_0.ReceiveFirstReward(arg_18_0, arg_18_1)
	arg_18_0.battleData_[arg_18_1].state = arg_18_0.battleState_.received

	arg_18_0:RefreshFirstRedPoint(arg_18_1)
end

function var_0_0.SaveCustomList(arg_19_0, arg_19_1, arg_19_2)
	arg_19_2 = arg_19_2 or {}
	arg_19_0.battleData_[arg_19_1].customList = arg_19_2
end

function var_0_0.RefreshRedPoint(arg_20_0, arg_20_1)
	arg_20_0:RefreshBattleRedPoint(arg_20_1)
	arg_20_0:RefreshScoreRedPoint(arg_20_1)
	arg_20_0:RefreshFirstRedPoint(arg_20_1)
end

function var_0_0.RefreshBattleRedPoint(arg_21_0, arg_21_1)
	local var_21_0 = arg_21_0.battleData_[arg_21_1]
	local var_21_1 = RaceTrialTools.GetMainActivityID(arg_21_1)
	local var_21_2 = 1
	local var_21_3 = ActivityData:GetActivityIsOpen(arg_21_1) and var_21_0.point <= 0 and 1 or 0

	manager.redPoint:setTip(string.format("%s_%s_%s", RedPointConst.ACTIVITY_RACE_TRIAL, var_21_1, arg_21_1), var_21_3)
end

function var_0_0.RefreshScoreRedPoint(arg_22_0, arg_22_1)
	local var_22_0 = false
	local var_22_1
	local var_22_2
	local var_22_3 = RaceTrialTools.GetMainActivityID(arg_22_1)
	local var_22_4 = arg_22_0:GetTotalScore(var_22_3)
	local var_22_5 = ActivityPointRewardCfg.get_id_list_by_activity_id[var_22_3]

	for iter_22_0, iter_22_1 in ipairs(var_22_5) do
		local var_22_6 = ActivityPointRewardCfg[iter_22_1]
		local var_22_7 = arg_22_0.scoreRewardData_[iter_22_1]

		if var_22_4 >= var_22_6.need and var_22_7.receive_flag == false then
			var_22_0 = true

			break
		end
	end

	manager.redPoint:setTip(string.format("%s_%s_PointReward", RedPointConst.ACTIVITY_RACE_TRIAL, var_22_3), var_22_0 and 1 or 0)
end

function var_0_0.RefreshFirstRedPoint(arg_23_0, arg_23_1)
	local var_23_0 = false
	local var_23_1 = RaceTrialTools.GetMainActivityID(arg_23_1)

	if arg_23_0.battleData_[arg_23_1].state == arg_23_0.battleState_.complete then
		var_23_0 = true
	end

	manager.redPoint:setTip(string.format("%s_%s_%d_firstReward", RedPointConst.ACTIVITY_RACE_TRIAL, var_23_1, arg_23_1), var_23_0 and 1 or 0)
end

function var_0_0.SetBattleRedPointOn(arg_24_0, arg_24_1, arg_24_2)
	local var_24_0 = RaceTrialTools.GetMainActivityID(arg_24_2)

	manager.redPoint:setTip(string.format("%s_%s_%s", RedPointConst.ACTIVITY_RACE_TRIAL, var_24_0, arg_24_2), 0)
end

function var_0_0.GetBattleResultGoal(arg_25_0, arg_25_1)
	local var_25_0 = arg_25_0.battleData_[arg_25_1].customList or {}
	local var_25_1 = ActivityRaceTrialCfg[arg_25_1].base_point
	local var_25_2

	for iter_25_0, iter_25_1 in ipairs(var_25_0) do
		var_25_1 = var_25_1 + ActivityAffixPoolCfg[iter_25_1].point
	end

	return var_25_1
end

return var_0_0
