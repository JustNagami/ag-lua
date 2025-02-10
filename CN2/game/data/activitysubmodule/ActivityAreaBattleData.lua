local var_0_0 = singletonClass("ActivityAreaBattleData")
local var_0_1 = {}
local var_0_2 = {}
local var_0_3 = {
	[313425] = "Widget/Version/CORGUI_3_10/CORGUI_3_10_SeizuresUI/",
	[293425] = "Widget/Version/ShashwatUI_3_7/ShashwatUI_3_7_SeizuresUI/"
}

function var_0_0.Init(arg_1_0)
	var_0_1:Init()
end

function var_0_0.GetDataByActivityID(arg_2_0, arg_2_1)
	return var_0_1.activityList[arg_2_1]
end

function var_0_0.InitAreaBattleData(arg_3_0, arg_3_1)
	var_0_2 = {}

	var_0_1:InitAreaBattleData(arg_3_1)
end

function var_0_0.GetPrefabByActivityID(arg_4_0, arg_4_1)
	return var_0_3[arg_4_1]
end

function var_0_0.ResetBattleData(arg_5_0, arg_5_1)
	var_0_1:ResetBattleData(arg_5_1)
end

function var_0_0.UpdateAreaBattleData(arg_6_0, arg_6_1)
	var_0_1:UpdateAreaBattleData(arg_6_1)
end

function var_0_0.GetReward(arg_7_0, arg_7_1)
	var_0_1:GetReward(arg_7_1)
end

function var_0_0.GetStageIdList(arg_8_0)
	return var_0_2
end

function var_0_1.GetReward(arg_9_0, arg_9_1)
	local var_9_0 = ActivityCfg.get_id_list_by_sub_activity_list[arg_9_1.activity_id][1]
	local var_9_1 = {}

	for iter_9_0, iter_9_1 in ipairs(arg_9_1.target_score_list) do
		arg_9_0.activityList[var_9_0][arg_9_1.activity_id].gotChallengeRewardList[iter_9_1] = true
		arg_9_0.activityList[var_9_0][arg_9_1.activity_id].completeTask = arg_9_0.activityList[var_9_0][arg_9_1.activity_id].completeTask + 1

		for iter_9_2, iter_9_3 in ipairs(ActivityAreaBattleCfg[arg_9_1.activity_id].reward_list) do
			if iter_9_3[1] == iter_9_1 then
				for iter_9_4, iter_9_5 in ipairs(iter_9_3[2]) do
					table.insert(var_9_1, iter_9_5)
				end
			end
		end
	end

	local var_9_2 = formatRewardCfgList(var_9_1)
	local var_9_3 = mergeReward(var_9_2)

	getReward(var_9_3, nil, nil, nil, true)
end

function var_0_1.ResetBattleData(arg_10_0, arg_10_1)
	local var_10_0 = ActivityCfg.get_id_list_by_sub_activity_list[arg_10_1.activity_id][1]

	for iter_10_0, iter_10_1 in pairs(arg_10_0.activityList[var_10_0][arg_10_1.activity_id].difficultList) do
		for iter_10_2, iter_10_3 in pairs(arg_10_1.stage_id_list) do
			if iter_10_1[iter_10_3] and iter_10_1[iter_10_3].point > 6 then
				iter_10_1[iter_10_3].usedHeroList = {}
			else
				iter_10_1[iter_10_3] = nil
			end
		end
	end
end

function var_0_1.InitAreaBattleData(arg_11_0, arg_11_1)
	arg_11_0.activityList[arg_11_1.activity_id] = {}

	for iter_11_0, iter_11_1 in ipairs(arg_11_1.area_battle_data_list) do
		arg_11_0.activityList[arg_11_1.activity_id][iter_11_1.activity_id] = arg_11_0:ParseServerData(iter_11_1)
	end
end

function var_0_1.UpdateAreaBattleData(arg_12_0, arg_12_1)
	local var_12_0 = ActivityCfg.get_id_list_by_sub_activity_list[arg_12_1.area_battle_data.activity_id][1]

	arg_12_0.activityList[var_12_0][arg_12_1.area_battle_data.activity_id] = arg_12_0:ParseServerData(arg_12_1.area_battle_data)
end

function var_0_1.ParseServerData(arg_13_0, arg_13_1)
	local var_13_0 = {
		challengeValue = arg_13_1.challenge_value,
		maxChallengeValue = arg_13_1.max_challenge_value,
		allChallengeValue = arg_13_1.acc_challenge_value,
		difficultList = {}
	}

	var_13_0.completeTask = 0

	for iter_13_0, iter_13_1 in ipairs(arg_13_1.difficult_info_list) do
		var_13_0.difficultList[iter_13_1.difficult_level] = {}

		for iter_13_2, iter_13_3 in ipairs(iter_13_1.stage_info_list) do
			var_13_0.difficultList[iter_13_1.difficult_level][iter_13_3.stage_id] = {}
			var_13_0.difficultList[iter_13_1.difficult_level][iter_13_3.stage_id].stageID = iter_13_3.stage_id
			var_13_0.difficultList[iter_13_1.difficult_level][iter_13_3.stage_id].usedHeroList = iter_13_3.used_hero_list
			var_13_0.difficultList[iter_13_1.difficult_level][iter_13_3.stage_id].point = iter_13_3.point

			if var_0_2[iter_13_3.stage_id] then
				var_0_2[iter_13_3.stage_id] = {
					isFirst = true,
					stage_id = iter_13_3.stage_id
				}
			else
				var_0_2[iter_13_3.stage_id] = {
					isFirst = false,
					stage_id = iter_13_3.stage_id
				}
			end
		end
	end

	var_13_0.gotChallengeRewardList = {}

	for iter_13_4, iter_13_5 in ipairs(arg_13_1.got_challenge_reward_list) do
		var_13_0.gotChallengeRewardList[iter_13_5] = true
		var_13_0.completeTask = var_13_0.completeTask + 1
	end

	return var_13_0
end

function var_0_1.Init(arg_14_0)
	arg_14_0.activityList = {}
end

return var_0_0
