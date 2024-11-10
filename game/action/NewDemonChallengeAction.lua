local var_0_0 = {}
local var_0_1 = false

function var_0_0.Init()
	NewDemonChallengeData:InitData()

	if var_0_1 then
		return
	end

	manager.net:Bind(64069, function(arg_2_0)
		NewDemonChallengeData:SetMainActivityData(arg_2_0)
		var_0_0.UpdateRewardRedPoint(arg_2_0.activity_id)
	end)
	manager.net:Bind(64065, function(arg_3_0)
		NewDemonChallengeData:SetSubActivityData(arg_3_0.activity_info)
		var_0_0.UpdateSelectRedPoint(arg_3_0.activity_info.activity_id)

		local var_3_0 = ActivityTools.GetMainActivityId(arg_3_0.activity_info.activity_id)

		var_0_0.UpdateRewardRedPoint(var_3_0)
	end)

	var_0_1 = true
end

local var_0_2

function var_0_0.GetChallengeReward(arg_4_0, arg_4_1)
	var_0_2 = arg_4_1

	local var_4_0 = {
		id = arg_4_0
	}

	manager.net:SendWithLoadingNew(64066, var_4_0, 64067, var_0_0.OnGetChallengeReward)
end

function var_0_0.OnGetChallengeReward(arg_5_0, arg_5_1)
	if isSuccess(arg_5_0.result) then
		NewDemonChallengeData:SetRewardState(var_0_2, arg_5_1.id, ActivityConst.DEMON_CHALLENGE_REWARD_STATE.RECEIVED)

		local var_5_0 = NewDemonChallengeRewardCfg[arg_5_1.id]

		if var_5_0 ~= nil then
			getReward2(arg_5_0.reward_list)
			var_0_0.UpdateRewardRedPoint(var_5_0.activity_id)
		end
	else
		ShowTips(arg_5_0.result)
	end

	manager.notify:CallUpdateFunc(DEMON_CHALLENGE_RECEIVE_REWARD, arg_5_0, arg_5_1)
end

function var_0_0.SetSelectedActivityId(arg_6_0)
	NewDemonChallengeData:AddSelectedActivityId(arg_6_0)
	var_0_0.UpdateSelectRedPoint(arg_6_0)
end

function var_0_0.InitRedPointKey(arg_7_0)
	local var_7_0 = ActivityData:GetActivityData(arg_7_0).subActivityIdList

	if #var_7_0 > 0 then
		local var_7_1 = {}

		for iter_7_0 = 1, #var_7_0 do
			local var_7_2 = RedPointConst.NEW_DEMON_CHALLENGE_UNFINISH .. var_7_0[iter_7_0]

			table.insert(var_7_1, var_7_2)
		end

		manager.redPoint:addGroup(RedPointConst.NEW_DEMON_CHALLENGE_UNFINISH .. arg_7_0, var_7_1)
		manager.redPoint:addGroup(RedPointConst.NEW_DEMON_CHALLENGE .. arg_7_0, {
			RedPointConst.NEW_DEMON_CHALLENGE_UNFINISH .. arg_7_0,
			RedPointConst.NEW_DEMON_CHALLENGE_REWARD .. arg_7_0
		})
	end
end

function var_0_0.UpdateRewardRedPoint(arg_8_0)
	local var_8_0 = NewDemonChallengeData:GetRewardStateList(arg_8_0)

	if var_8_0 ~= nil then
		local var_8_1 = NewDemonChallengeData:GetCompletedDifficultyCountList(arg_8_0)
		local var_8_2 = NewDemonChallengeRewardCfg.get_id_list_by_activity_id[arg_8_0]
		local var_8_3 = false

		for iter_8_0, iter_8_1 in ipairs(var_8_2) do
			local var_8_4 = NewDemonChallengeRewardCfg[iter_8_1]

			if var_8_4 ~= nil then
				local var_8_5 = var_8_1[var_8_4.difficulty_id] or 0

				if var_8_0[iter_8_1] == ActivityConst.DEMON_CHALLENGE_REWARD_STATE.UNRECEIVE and var_8_5 >= var_8_4.complete_num then
					var_8_3 = true

					break
				end
			end
		end

		manager.redPoint:setTip(RedPointConst.NEW_DEMON_CHALLENGE_REWARD .. arg_8_0, var_8_3 and 1 or 0)
	end
end

function var_0_0.UpdateSelectRedPoint(arg_9_0)
	local var_9_0 = arg_9_0

	if not ActivityData:GetActivityIsOpen(var_9_0) then
		return
	end

	local var_9_1 = NewDemonChallengeData:GetChallengeInfo(var_9_0)
	local var_9_2 = false

	if var_9_1 then
		for iter_9_0, iter_9_1 in pairs(var_9_1.challengeInfo) do
			if iter_9_1.challenge_state > ActivityConst.DEMON_CHALLENGE_STATE.UNFINISHED then
				var_9_2 = true

				break
			end
		end

		if var_9_2 == false and not NewDemonChallengeData:GetIsSelected(var_9_0) then
			manager.redPoint:setTip(RedPointConst.NEW_DEMON_CHALLENGE_UNFINISH .. var_9_0, 1)
		else
			manager.redPoint:setTip(RedPointConst.NEW_DEMON_CHALLENGE_UNFINISH .. var_9_0, 0)
		end
	end
end

function var_0_0.RefreshRedPoint(arg_10_0)
	if manager.time:GetServerTime() >= ActivityData:GetActivityData(arg_10_0).stopTime then
		local var_10_0 = ActivityData:GetActivityData(arg_10_0).subActivityIdList

		for iter_10_0, iter_10_1 in ipairs(var_10_0) do
			manager.redPoint:setTip(RedPointConst.NEW_DEMON_CHALLENGE_UNFINISH .. iter_10_1, 0)
		end

		manager.redPoint:setTip(RedPointConst.NEW_DEMON_CHALLENGE_REWARD .. arg_10_0, 0)
	end
end

return var_0_0
