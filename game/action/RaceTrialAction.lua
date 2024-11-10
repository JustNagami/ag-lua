local var_0_0 = {}

manager.net:Bind(11023, function(arg_1_0)
	RaceTrialData:InitData(arg_1_0.race_trial)
end)
manager.net:Bind(11019, function(arg_2_0)
	RaceTrialData:RefreshBattleData(arg_2_0)
end)

function var_0_0.ReceiveScoreReward(arg_3_0, arg_3_1)
	local var_3_0 = {
		point_reward_id_list = {
			arg_3_1
		}
	}

	manager.net:SendWithLoadingNew(60054, var_3_0, 60055, handler(arg_3_0, arg_3_0.OnReceiveScoreReward))
end

function var_0_0.OnReceiveScoreReward(arg_4_0, arg_4_1, arg_4_2)
	if isSuccess(arg_4_1.result) then
		RaceTrialData:ReceiveScoreReward(arg_4_2.point_reward_id_list[1])
		getReward2(arg_4_1.reward_list)
		manager.notify:CallUpdateFunc(RACE_TRIAL_POINT_RECEIVE)
		manager.notify:Invoke(RACE_TRIAL_POINT_RECEIVE)
	else
		ShowTips(arg_4_1.result)
	end
end

function var_0_0.ReceiveFirstReward(arg_5_0, arg_5_1)
	local var_5_0 = {
		id = arg_5_1
	}

	manager.net:SendWithLoadingNew(11020, var_5_0, 11021, handler(arg_5_0, arg_5_0.OnReceiveFirstReward))
end

function var_0_0.OnReceiveFirstReward(arg_6_0, arg_6_1, arg_6_2)
	if isSuccess(arg_6_1.result) then
		RaceTrialData:ReceiveFirstReward(arg_6_2.id)
		getReward(formatRewardCfgList(ActivityRaceTrialCfg[arg_6_2.id].reward_item_list))
		manager.notify:CallUpdateFunc(RACE_TRIAL_FIRST_RECEIVE)
	else
		ShowTips(arg_6_1.result)
	end
end

function var_0_0.SaveCustomList(arg_7_0, arg_7_1, arg_7_2)
	if not ActivityData:GetActivityIsOpen(arg_7_1) then
		return
	end

	RaceTrialData:SaveCustomList(arg_7_1, arg_7_2)

	local var_7_0 = {
		id = arg_7_1,
		race_trial_affix_id_list = arg_7_2
	}

	manager.net:SendWithLoadingNew(11038, var_7_0, 11039, handler(arg_7_0, arg_7_0.OnSaveCustomList))
end

function var_0_0.OnSaveCustomList(arg_8_0, arg_8_1, arg_8_2)
	if isSuccess(arg_8_1.result) then
		-- block empty
	else
		ShowTips(arg_8_1.result)
	end
end

function var_0_0.Init(arg_9_0)
	RaceTrialTools.InitConst(arg_9_0)
	RaceTrialData:InitBattleData(arg_9_0)
	RaceTrialData:InitScoreRewardData(arg_9_0)
end

function var_0_0.InitRedPointKey(arg_10_0)
	local var_10_0 = ActivityData:GetActivityData(arg_10_0).subActivityIdList
	local var_10_1 = {}
	local var_10_2 = {}

	for iter_10_0, iter_10_1 in pairs(var_10_0) do
		var_10_1[#var_10_1 + 1] = string.format("%s_%s_%s", RedPointConst.ACTIVITY_RACE_TRIAL, arg_10_0, iter_10_1)
		var_10_2[#var_10_2 + 1] = string.format("%s_%s_%d_firstReward", RedPointConst.ACTIVITY_RACE_TRIAL, arg_10_0, iter_10_1)
	end

	manager.redPoint:addGroup(string.format("%s_%s_firstReward", RedPointConst.ACTIVITY_RACE_TRIAL, arg_10_0), var_10_2)

	var_10_1[#var_10_1 + 1] = string.format("%s_%s_PointReward", RedPointConst.ACTIVITY_RACE_TRIAL, arg_10_0)
	var_10_1[#var_10_1 + 1] = string.format("%s_%s_firstReward", RedPointConst.ACTIVITY_RACE_TRIAL, arg_10_0)

	manager.redPoint:addGroup(string.format("%s_%s", RedPointConst.ACTIVITY_RACE_TRIAL, arg_10_0), var_10_1)
end

function var_0_0.UpdateRedPoint(arg_11_0)
	if not ActivityData:GetActivityIsOpen(arg_11_0) then
		local var_11_0 = ActivityCfg[arg_11_0].sub_activity_list

		if #var_11_0 > 0 then
			local var_11_1 = arg_11_0

			for iter_11_0, iter_11_1 in ipairs(var_11_0) do
				manager.redPoint:setTip(string.format("%s_%s_%s", RedPointConst.ACTIVITY_RACE_TRIAL, var_11_1, iter_11_1), 0)
				manager.redPoint:setTip(string.format("%s_%s_%d_firstReward", RedPointConst.ACTIVITY_RACE_TRIAL, var_11_1, iter_11_1), 0)
			end

			manager.redPoint:setTip(string.format("%s_%s_PointReward", RedPointConst.ACTIVITY_RACE_TRIAL, var_11_1), 0)
		else
			local var_11_2 = RaceTrialTools.GetMainActivityID(arg_11_0)

			manager.redPoint:setTip(string.format("%s_%s_%s", RedPointConst.ACTIVITY_RACE_TRIAL, var_11_2, arg_11_0), 0)
			manager.redPoint:setTip(string.format("%s_%s_%d_firstReward", RedPointConst.ACTIVITY_RACE_TRIAL, var_11_2, arg_11_0), 0)
		end
	end
end

return var_0_0
