local var_0_0 = class("SignInfoStruct_New")

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.activity_id = arg_1_1.activity_id
	arg_1_0.unlock_reward = arg_1_1.unlock_reward or {}
	arg_1_0.gain_reward = arg_1_1.gain_reward or {}
	arg_1_0.unlock_times = arg_1_1.unlock_times or 0
end

function var_0_0.Update(arg_2_0, arg_2_1)
	local var_2_0 = arg_2_1.id_list
	local var_2_1 = arg_2_1.id
	local var_2_2 = 0

	if var_2_0 then
		for iter_2_0, iter_2_1 in ipairs(var_2_0) do
			table.insert(arg_2_0.gain_reward, iter_2_1)

			for iter_2_2, iter_2_3 in ipairs(arg_2_0.unlock_reward) do
				if iter_2_1 == iter_2_3 then
					var_2_2 = iter_2_2
				end
			end
		end

		table.remove(arg_2_0.unlock_reward, var_2_2)
	end

	if var_2_1 then
		table.insert(arg_2_0.gain_reward, var_2_1)

		for iter_2_4, iter_2_5 in ipairs(arg_2_0.unlock_reward) do
			if var_2_1 == iter_2_5 then
				var_2_2 = iter_2_4
			end
		end

		table.remove(arg_2_0.unlock_reward, var_2_2)
	end
end

function var_0_0.UpdateUnlockTimes(arg_3_0)
	arg_3_0.unlock_times = arg_3_0.unlock_times + 1
end

function var_0_0.TotalSignDay(arg_4_0)
	local var_4_0 = ActivityCumulativeSignCfg[arg_4_0.activity_id]

	return var_4_0 and #var_4_0.config_list or 7
end

function var_0_0.OnSignSuccess(arg_5_0, arg_5_1)
	arg_5_0:Update(arg_5_1)
end

function var_0_0.EndTime(arg_6_0)
	return ActivityData:GetActivityData(arg_6_0.activity_id).stopTime
end

function var_0_0.OnCrossDayNew(arg_7_0)
	return
end

function var_0_0.ReSignNum(arg_8_0)
	local var_8_0 = arg_8_0:TotalSignDay()
	local var_8_1 = manager.time
	local var_8_2 = 86400
	local var_8_3 = var_8_1:GetServerTime()
	local var_8_4 = arg_8_0:EndTime() - var_8_3
	local var_8_5 = math.ceil(var_8_4 / var_8_2)

	return (math.max(var_8_0 - var_8_5 - arg_8_0.unlock_times, 0))
end

function var_0_0.SignRewardList(arg_9_0)
	if arg_9_0.reward_list then
		return arg_9_0.reward_list
	end

	arg_9_0.reward_list = {}

	local var_9_0 = ActivityCumulativeSignCfg[arg_9_0.activity_id]

	if not var_9_0 then
		print("ActivityCumulativeSignCfg不存在对应活动的配置------>", arg_9_0.activity_id)

		return
	end

	for iter_9_0, iter_9_1 in ipairs(var_9_0.config_list) do
		table.insert(arg_9_0.reward_list, SignCfg[iter_9_1].reward)
	end

	return arg_9_0.reward_list
end

function var_0_0.RedDotCount(arg_10_0)
	return #arg_10_0.unlock_reward
end

return var_0_0
