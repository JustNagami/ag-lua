local var_0_0 = {}

manager.notify:RegistListener(MATERIAL_MODIFY, function(arg_1_0)
	var_0_0.InitRedPoint(arg_1_0)
end)
manager.notify:RegistListener(CURRENCY_UPDATE, function(arg_2_0)
	var_0_0.InitRedPoint(arg_2_0)
end)
manager.net:Bind(85101, function(arg_3_0)
	ActivityPointData:InitData(arg_3_0.reward_list)
end)

function var_0_0.SubmitPointReward(arg_4_0, arg_4_1)
	local var_4_0 = {
		reward_id_list = arg_4_0
	}

	manager.net:SendWithLoadingNew(85102, var_4_0, 85103, function(arg_5_0)
		if isSuccess(arg_5_0.result) then
			getReward(mergeReward(arg_5_0.item_list))

			for iter_5_0, iter_5_1 in ipairs(arg_4_0) do
				ActivityPointData:AddPointRewardID(iter_5_1)
				var_0_0.UpdateRedPoint(iter_5_1)
			end

			arg_4_1(arg_5_0)
		else
			ShowTips(arg_5_0.result)
		end
	end)
end

function var_0_0.InitRedPoint()
	for iter_6_0, iter_6_1 in pairs(ActivityPointRewardCfg.get_id_list_by_activity_id) do
		var_0_0.UpdateActivityRedPoint(iter_6_0)
	end
end

function var_0_0.UpdateActivityRedPoint(arg_7_0)
	if ActivityTools.GetActivityStatus(arg_7_0) == ActivityConst.ACTIVITY_STATE.ACTIVING then
		local var_7_0 = 0
		local var_7_1 = ActivityPointRewardCfg.get_id_list_by_activity_id[arg_7_0]

		for iter_7_0, iter_7_1 in ipairs(var_7_1) do
			local var_7_2 = ActivityPointRewardCfg[iter_7_1]

			if var_7_2.need_item_id ~= 0 and not ActivityPointData:IsCompleteID(iter_7_1) and var_7_2.need <= ItemTools.getItemNum(var_7_2.need_item_id) then
				var_7_0 = 1

				break
			end

			if ActivityCfg[arg_7_0].activity_template == ActivityTemplateConst.CHALLENGE_ROGUE_TEAM_SCORE then
				local var_7_3 = ChallengeRogueTeamTools.GetTeamplateIDByActivityID(arg_7_0)
				local var_7_4 = ChallengeRogueTeamData:GetRewardedScoreList(var_7_3)

				if not table.keyof(var_7_4, iter_7_1) and var_7_2.need <= ItemTools.getItemNum(RogueTeamCfg[var_7_3].point_item) then
					var_7_0 = 1

					break
				end
			end
		end

		local var_7_5 = string.format("%s_%s", RedPointConst.ACTIVITY_POINT_REWARD, arg_7_0)

		manager.redPoint:setTip(var_7_5, var_7_0)
	else
		local var_7_6 = string.format("%s_%s", RedPointConst.ACTIVITY_POINT_REWARD, arg_7_0)

		manager.redPoint:setTip(var_7_6, 0)
	end
end

function var_0_0.UpdateRedPoint(arg_8_0)
	local var_8_0 = ActivityPointRewardCfg[arg_8_0].activity_id

	var_0_0.UpdateActivityRedPoint(var_8_0)
end

manager.net:Bind(86011, function(arg_9_0)
	ActivityPointData:InitUseDunDunData(arg_9_0)
end)

function var_0_0.InitDunDunRedPointKey(arg_10_0)
	local var_10_0 = ActivityPointRewardCfg.get_id_list_by_activity_id[arg_10_0]
	local var_10_1 = {}

	for iter_10_0, iter_10_1 in pairs(var_10_0) do
		local var_10_2 = RedPointConst.ACTIVITY_USE_DUNDUN_REWARD .. iter_10_1

		table.insert(var_10_1, var_10_2)
	end

	manager.redPoint:addGroup(RedPointConst.ACTIVITY_USE_DUNDUN .. arg_10_0, var_10_1)
end

return var_0_0
