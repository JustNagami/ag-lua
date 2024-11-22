local var_0_0 = {}

manager.net:Bind(75009, function(arg_1_0)
	Debug.Log("收到协议")
	CoreVerificationData:UpdateCycleInfo(arg_1_0)
	var_0_0.UpdateRewardRedPoints()
	var_0_0.UpdateChallengeRedPoints()
	manager.notify:Invoke(CORE_VERIFICATION_CYCLE_UPDATE)
end)

function var_0_0.ResetChallenge(arg_2_0)
	local var_2_0 = {
		type = arg_2_0
	}

	manager.net:SendWithLoadingNew(75010, var_2_0, 75011, var_0_0.OnResetChallengeCallBack)
end

function var_0_0.OnResetChallengeCallBack(arg_3_0, arg_3_1)
	if isSuccess(arg_3_0.result) then
		if arg_3_1.type == 0 then
			CoreVerificationData:ResetStage()
			var_0_0.UpdateRewardRedPoints()
			var_0_0.UpdateChallengeRedPoints()
			manager.notify:Invoke(CORE_VERIFICATION_CYCLE_UPDATE)
			ShowTips("CORE_VERIFICATION_RESETTIPS2")
		end
	else
		ShowTips(arg_3_0.result)
	end
end

function var_0_0.GetReward(arg_4_0)
	manager.net:SendWithLoadingNew(75006, arg_4_0, 75007, var_0_0.OnGetRewardCallback)
end

function var_0_0.OnGetRewardCallback(arg_5_0, arg_5_1)
	if isSuccess(arg_5_0.result) then
		CoreVerificationData:UpdateRewardData(arg_5_1)
		var_0_0.UpdateRewardRedPoints()
		getReward(mergeReward(arg_5_0.reward_list))
		manager.notify:CallUpdateFunc(CORE_VERIFICATION_GET_REWARD)
	else
		ShowTips(arg_5_0.result)
	end
end

function var_0_0.UpdateRewardRedPoints()
	local var_6_0 = {
		0,
		0,
		0,
		0
	}

	for iter_6_0 = 1, 4 do
		local var_6_1 = CoreVerificationData:GetRewardListByType(iter_6_0)

		for iter_6_1, iter_6_2 in ipairs(var_6_1) do
			local var_6_2, var_6_3, var_6_4, var_6_5 = CoreVerificationData:GetTaskProcess(iter_6_2)

			if var_6_4 and not var_6_5 then
				var_6_0[CoreVerificationRewardCfg[iter_6_2].reward_type] = 1
			end
		end
	end

	manager.redPoint:setTip(RedPointConst.CORE_VERIFICATION_REWARD1, var_6_0[1])
	manager.redPoint:setTip(RedPointConst.CORE_VERIFICATION_REWARD2, var_6_0[2])
	manager.redPoint:setTip(RedPointConst.CORE_VERIFICATION_REWARD3, var_6_0[3])
	manager.redPoint:setTip(RedPointConst.CORE_VERIFICATION_REWARD4, var_6_0[4])
end

function var_0_0.UpdateChallengeRedPoints()
	local var_7_0 = CoreVerificationData:IsStageProcess()
	local var_7_1 = getData("CoreVerification", "click_time") or 0
	local var_7_2 = _G.gameTimer:GetNextDayFreshTime()

	if JumpTools.IsSystemLocked(ViewConst.SYSTEM_ID.CORE_VERIFICATION) then
		manager.redPoint:setTip(RedPointConst.CORE_VERIFICATION_CHALLENGE, 0)
	elseif var_7_0 or var_7_2 > 0 and var_7_2 <= var_7_1 then
		manager.redPoint:setTip(RedPointConst.CORE_VERIFICATION_CHALLENGE, 0)
	else
		manager.redPoint:setTip(RedPointConst.CORE_VERIFICATION_CHALLENGE, 1)
	end
end

return var_0_0
