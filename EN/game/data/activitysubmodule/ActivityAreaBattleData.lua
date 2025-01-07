local var_0_0 = singletonClass("ActivityAreaBattleData")
local var_0_1 = {}

function var_0_0.Init(arg_1_0)
	var_0_1:Init()
end

function var_0_0.GetDataByActivityID(arg_2_0, arg_2_1)
	return var_0_1.activityList[arg_2_1]
end

function var_0_0.InitAreaBattleData(arg_3_0, arg_3_1)
	var_0_1:InitAreaBattleData(arg_3_1)
end

function var_0_0.ResetBattleData(arg_4_0, arg_4_1)
	var_0_1:ResetBattleData(arg_4_1)
end

function var_0_0.UpdateAreaBattleData(arg_5_0, arg_5_1)
	var_0_1:UpdateAreaBattleData(arg_5_1)
end

function var_0_0.GetReward(arg_6_0, arg_6_1)
	var_0_1:GetReward(arg_6_1)
end

function var_0_1.GetReward(arg_7_0, arg_7_1)
	local var_7_0 = ActivityCfg.get_id_list_by_sub_activity_list[arg_7_1.activity_id][1]
	local var_7_1 = {}

	for iter_7_0, iter_7_1 in ipairs(arg_7_1.target_score_list) do
		arg_7_0.activityList[var_7_0][arg_7_1.activity_id].gotChallengeRewardList[iter_7_1] = true
		arg_7_0.activityList[var_7_0][arg_7_1.activity_id].completeTask = arg_7_0.activityList[var_7_0][arg_7_1.activity_id].completeTask + 1

		for iter_7_2, iter_7_3 in ipairs(ActivityAreaBattleCfg[arg_7_1.activity_id].reward_list) do
			if iter_7_3[1] == iter_7_1 then
				for iter_7_4, iter_7_5 in ipairs(iter_7_3[2]) do
					table.insert(var_7_1, iter_7_5)
				end
			end
		end
	end

	local var_7_2 = formatRewardCfgList(var_7_1)
	local var_7_3 = mergeReward(var_7_2)

	getReward(var_7_3, nil, nil, nil, true)
end

function var_0_1.ResetBattleData(arg_8_0, arg_8_1)
	local var_8_0 = ActivityCfg.get_id_list_by_sub_activity_list[arg_8_1.activity_id][1]

	for iter_8_0, iter_8_1 in pairs(arg_8_0.activityList[var_8_0][arg_8_1.activity_id].difficultList) do
		for iter_8_2, iter_8_3 in pairs(arg_8_1.stage_id_list) do
			if iter_8_1[iter_8_3] and iter_8_1[iter_8_3].point > 6 then
				iter_8_1[iter_8_3].usedHeroList = {}
			else
				iter_8_1[iter_8_3] = nil
			end
		end
	end
end

function var_0_1.InitAreaBattleData(arg_9_0, arg_9_1)
	arg_9_0.activityList[arg_9_1.activity_id] = {}

	for iter_9_0, iter_9_1 in ipairs(arg_9_1.area_battle_data_list) do
		arg_9_0.activityList[arg_9_1.activity_id][iter_9_1.activity_id] = arg_9_0:ParseServerData(iter_9_1)
	end
end

function var_0_1.UpdateAreaBattleData(arg_10_0, arg_10_1)
	local var_10_0 = ActivityCfg.get_id_list_by_sub_activity_list[arg_10_1.area_battle_data.activity_id][1]

	arg_10_0.activityList[var_10_0][arg_10_1.area_battle_data.activity_id] = arg_10_0:ParseServerData(arg_10_1.area_battle_data)
end

function var_0_1.ParseServerData(arg_11_0, arg_11_1)
	local var_11_0 = {
		challengeValue = arg_11_1.challenge_value,
		maxChallengeValue = arg_11_1.max_challenge_value,
		allChallengeValue = arg_11_1.acc_challenge_value,
		difficultList = {}
	}

	var_11_0.completeTask = 0

	for iter_11_0, iter_11_1 in ipairs(arg_11_1.difficult_info_list) do
		var_11_0.difficultList[iter_11_1.difficult_level] = {}

		for iter_11_2, iter_11_3 in ipairs(iter_11_1.stage_info_list) do
			var_11_0.difficultList[iter_11_1.difficult_level][iter_11_3.stage_id] = {}
			var_11_0.difficultList[iter_11_1.difficult_level][iter_11_3.stage_id].stageID = iter_11_3.stage_id
			var_11_0.difficultList[iter_11_1.difficult_level][iter_11_3.stage_id].usedHeroList = iter_11_3.used_hero_list
			var_11_0.difficultList[iter_11_1.difficult_level][iter_11_3.stage_id].point = iter_11_3.point
		end
	end

	var_11_0.gotChallengeRewardList = {}

	for iter_11_4, iter_11_5 in ipairs(arg_11_1.got_challenge_reward_list) do
		var_11_0.gotChallengeRewardList[iter_11_5] = true
		var_11_0.completeTask = var_11_0.completeTask + 1
	end

	return var_11_0
end

function var_0_1.Init(arg_12_0)
	arg_12_0.activityList = {}
end

return var_0_0
