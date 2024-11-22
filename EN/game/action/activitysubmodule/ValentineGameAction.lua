local var_0_0 = {}
local var_0_1 = false

function var_0_0.Init()
	if var_0_1 then
		return
	end

	var_0_1 = true

	ValentineGameData:Init()
	manager.net:Bind(64073, function(arg_2_0)
		ValentineGameData:InitData(arg_2_0)
		ValentineGameAction:RefreshRedPoint(arg_2_0.activity_id)
	end)
end

function var_0_0.InitRedPointKey(arg_3_0)
	if arg_3_0 == ActivityConst.TYR_VALENTINE_GAME then
		local var_3_0 = {}
		local var_3_1 = {}
		local var_3_2 = {}
		local var_3_3 = ActivityData:GetActivityData(arg_3_0).subActivityIdList

		for iter_3_0, iter_3_1 in ipairs(var_3_3) do
			table.insert(var_3_0, RedPointConst.VALENTINE_GAME .. "_" .. iter_3_1)
			table.insert(var_3_1, RedPointConst.VALENTINE_GAME_OPEN .. "_" .. iter_3_1)
			table.insert(var_3_2, RedPointConst.VALENTINE_GAME_REWARD .. "_" .. iter_3_1)
			manager.redPoint:addGroup(RedPointConst.VALENTINE_GAME .. "_" .. iter_3_1, {
				RedPointConst.VALENTINE_GAME_OPEN .. "_" .. iter_3_1,
				RedPointConst.VALENTINE_GAME_REWARD .. "_" .. iter_3_1
			})
		end

		manager.redPoint:addGroup(RedPointConst.VALENTINE_GAME .. "_" .. arg_3_0, var_3_0)
		manager.redPoint:addGroup(RedPointConst.VALENTINE_GAME_OPEN .. "_" .. arg_3_0, var_3_1)
		manager.redPoint:addGroup(RedPointConst.VALENTINE_GAME_REWARD .. "_" .. arg_3_0, var_3_2)
	elseif arg_3_0 == ActivityConst.INDIA_VALENTINE_GAME_V2 then
		local var_3_4 = {}
		local var_3_5 = ActivityData:GetActivityData(arg_3_0).subActivityIdList

		for iter_3_2, iter_3_3 in ipairs(var_3_5) do
			manager.redPoint:addGroup(RedPointConst.VALENTINE_GAME .. "_" .. iter_3_3, {
				RedPointConst.VALENTINE_GAME_OPEN .. "_" .. iter_3_3,
				RedPointConst.VALENTINE_GAME_REWARD .. "_" .. iter_3_3
			})
			table.insert(var_3_4, RedPointConst.VALENTINE_GAME .. "_" .. iter_3_3)
		end

		manager.redPoint:addGroup(RedPointConst.VALENTINE_GAME .. "_" .. arg_3_0, var_3_4)
	end
end

function var_0_0.GetReward(arg_4_0, arg_4_1)
	local var_4_0 = {
		activity_id = arg_4_1
	}

	manager.net:SendWithLoadingNew(64070, var_4_0, 64071, handler(var_0_0, var_0_0.OnGetReward))
end

function var_0_0.OnGetReward(arg_5_0, arg_5_1, arg_5_2)
	if isSuccess(arg_5_1.result) then
		local var_5_0 = arg_5_1.reward_list

		getReward2(var_5_0)
		ValentineGameData:SetReward(arg_5_2.activity_id)
		arg_5_0:RefreshRewardRedPoint(arg_5_2.activity_id)
		manager.notify:CallUpdateFunc(VALENTINE_GAME_REWARD)
	else
		ShowTips(arg_5_1.result)
	end
end

function var_0_0.SetPoint(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
	if ActivityTools.GetMainActivityId(arg_6_1) == ActivityConst.INDIA_VALENTINE_GAME_V2 then
		local var_6_0, var_6_1 = ValentineGameData:GetQID()
		local var_6_2 = {
			activity_id = arg_6_1,
			point = arg_6_2,
			qa_id = var_6_1,
			choose_id = var_6_0
		}

		manager.net:SendWithLoadingNew(64074, var_6_2, 64075, function(arg_7_0, arg_7_1)
			var_0_0:OnSetPoint(arg_7_0, arg_7_1, arg_6_3)
		end)
	else
		local var_6_3 = {
			activity_id = arg_6_1,
			point = arg_6_2
		}

		manager.net:SendWithLoadingNew(64074, var_6_3, 64075, function(arg_8_0, arg_8_1)
			var_0_0:OnSetPoint(arg_8_0, arg_8_1)
		end)
	end
end

function var_0_0.OnSetPoint(arg_9_0, arg_9_1, arg_9_2, arg_9_3)
	if ActivityTools.GetMainActivityId(arg_9_2.activity_id) == ActivityConst.INDIA_VALENTINE_GAME_V2 then
		if isSuccess(arg_9_1.result) then
			ValentineGameData:SetClear(arg_9_2.activity_id, arg_9_2.choose_id, arg_9_2.qa_id)

			if arg_9_3 then
				arg_9_3()
			end
		else
			ShowTips(arg_9_1.result)
		end
	elseif isSuccess(arg_9_1.result) then
		ValentineGameData:SetPoint(arg_9_2.activity_id, arg_9_2.point)
		manager.notify:CallUpdateFunc(VALENTINE_RESULT)
	else
		JumpTools.OpenPageByJump("/valentineGameTest", {
			activityID = arg_9_2.activity_id
		})
		ShowTips(arg_9_1.result)
	end
end

function var_0_0.RefreshRedPoint(arg_10_0, arg_10_1)
	arg_10_0:RefreshOpenRedPoint(arg_10_1)
	arg_10_0:RefreshRewardRedPoint(arg_10_1)
end

function var_0_0.RefreshOpenRedPoint(arg_11_0, arg_11_1)
	local var_11_0 = ValentineGameData:GetData(arg_11_1)

	if ActivityData:GetActivityIsOpen(arg_11_1) and (not var_11_0 or var_11_0.isOpen) then
		manager.redPoint:setTip(RedPointConst.VALENTINE_GAME_OPEN .. "_" .. arg_11_1, 1)
	else
		manager.redPoint:setTip(RedPointConst.VALENTINE_GAME_OPEN .. "_" .. arg_11_1, 0)
	end
end

function var_0_0.RefreshRewardRedPoint(arg_12_0, arg_12_1)
	local var_12_0 = ValentineGameData:GetData(arg_12_1)

	if var_12_0 and var_12_0.isClear and not var_12_0.isReward and ActivityData:GetActivityIsOpen(arg_12_1) then
		manager.redPoint:setTip(RedPointConst.VALENTINE_GAME_REWARD .. "_" .. arg_12_1, 1)
	else
		manager.redPoint:setTip(RedPointConst.VALENTINE_GAME_REWARD .. "_" .. arg_12_1, 0)
	end
end

return var_0_0
