local var_0_0 = singletonClass("ActivityPointData")

function var_0_0.Init(arg_1_0)
	arg_1_0.completeIDList_ = {}
	arg_1_0.activityUseDunDunDataList_ = {}
end

function var_0_0.InitData(arg_2_0, arg_2_1)
	for iter_2_0, iter_2_1 in ipairs(arg_2_1) do
		arg_2_0:AddPointRewardID(iter_2_1)
	end
end

function var_0_0.IsCompleteID(arg_3_0, arg_3_1)
	local var_3_0 = ActivityPointRewardCfg[arg_3_1]

	return table.keyof(arg_3_0.completeIDList_, arg_3_1) ~= nil
end

function var_0_0.AddPointRewardID(arg_4_0, arg_4_1)
	table.insert(arg_4_0.completeIDList_, arg_4_1)
end

function var_0_0.InitUseDunDunData(arg_5_0, arg_5_1)
	arg_5_0.activityUseDunDunDataList_ = {}
	arg_5_0.activityUseDunDunDataList_[arg_5_1.activity_id] = {
		point = arg_5_1.point,
		rewardIDList = cleanProtoTable(arg_5_1.reward_list)
	}

	arg_5_0:UpdateUseDunDunRedPoint(arg_5_1.activity_id)
end

function var_0_0.GetUseDunDunRewardIsGet(arg_6_0, arg_6_1, arg_6_2)
	if arg_6_0.activityUseDunDunDataList_[arg_6_1] then
		if table.indexof(arg_6_0.activityUseDunDunDataList_[arg_6_1].rewardIDList, arg_6_2) then
			return true
		else
			return false
		end
	end
end

function var_0_0.GetCurDunDunPoint(arg_7_0, arg_7_1)
	if arg_7_0.activityUseDunDunDataList_[arg_7_1] then
		return arg_7_0.activityUseDunDunDataList_[arg_7_1].point
	else
		return 0
	end
end

function var_0_0.GetUseDunDunReward(arg_8_0, arg_8_1, arg_8_2)
	if arg_8_0.activityUseDunDunDataList_[arg_8_1] and arg_8_0.activityUseDunDunDataList_[arg_8_1].rewardIDList then
		for iter_8_0, iter_8_1 in ipairs(arg_8_2) do
			table.insert(arg_8_0.activityUseDunDunDataList_[arg_8_1].rewardIDList, iter_8_1)
		end
	else
		arg_8_0.activityUseDunDunDataList_[arg_8_1] = {
			point = 0,
			rewardIDList = {}
		}

		for iter_8_2, iter_8_3 in ipairs(arg_8_2) do
			table.insert(arg_8_0.activityUseDunDunDataList_[arg_8_1].rewardIDList, iter_8_3)
		end
	end

	arg_8_0:UpdateUseDunDunRedPoint(arg_8_1)
end

function var_0_0.UpdateUseDunDunRedPoint(arg_9_0, arg_9_1)
	local var_9_0 = ActivityPointRewardCfg.get_id_list_by_activity_id[arg_9_1]

	if ActivityData:GetActivityIsOpen(arg_9_1) then
		if arg_9_0.activityUseDunDunDataList_[arg_9_1] then
			for iter_9_0, iter_9_1 in pairs(var_9_0) do
				local var_9_1 = RedPointConst.ACTIVITY_USE_DUNDUN_REWARD .. iter_9_1
				local var_9_2 = ActivityPointRewardCfg[iter_9_1]

				if arg_9_0.activityUseDunDunDataList_[arg_9_1].point >= var_9_2.need then
					if table.indexof(arg_9_0.activityUseDunDunDataList_[arg_9_1].rewardIDList, iter_9_1) then
						manager.redPoint:setTip(var_9_1, 0)
					else
						manager.redPoint:setTip(var_9_1, 1)
					end
				else
					manager.redPoint:setTip(var_9_1, 0)
				end
			end
		else
			for iter_9_2, iter_9_3 in pairs(var_9_0) do
				local var_9_3 = RedPointConst.ACTIVITY_USE_DUNDUN_REWARD .. iter_9_3

				manager.redPoint:setTip(var_9_3, 0)
			end
		end
	else
		for iter_9_4, iter_9_5 in pairs(var_9_0) do
			local var_9_4 = RedPointConst.ACTIVITY_USE_DUNDUN_REWARD .. iter_9_5

			manager.redPoint:setTip(var_9_4, 0)
		end
	end
end

return var_0_0
