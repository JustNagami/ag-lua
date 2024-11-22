local var_0_0 = {}

manager.net:Bind(60201, function(arg_1_0)
	ActivityAccumulativeData:InitData(arg_1_0)
	manager.notify:Invoke(ACCUMULATIVEGACHA_UPDATE)
end)

function var_0_0.GetAccumulateReward(arg_2_0, arg_2_1)
	local var_2_0 = {
		point_reward_id_list = {
			arg_2_0
		}
	}

	manager.net:SendWithLoadingNew(60054, var_2_0, 60055, function(arg_3_0)
		if isSuccess(arg_3_0.result) then
			getReward2(arg_3_0.reward_list)
			ActivityAccumulativeData:RefreshData(arg_2_0)
			manager.notify:Invoke(ACCUMULATIVEGACHA_UPDATE)

			if arg_2_1 then
				arg_2_1()
			end
		else
			ShowTips(arg_3_0.result)
		end
	end)
end

return var_0_0
