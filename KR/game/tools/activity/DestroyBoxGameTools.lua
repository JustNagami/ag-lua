local var_0_0 = {
	GetRewardPanelList = function(arg_1_0)
		local var_1_0 = {}

		for iter_1_0, iter_1_1 in ipairs(DestroyBoxGameRewardCfg.get_id_list_by_main_activity_id[arg_1_0]) do
			local var_1_1 = DestroyBoxGameRewardCfg[iter_1_1]
			local var_1_2 = var_1_1.activity_id

			if not var_1_0[var_1_2] and var_1_1.need_show == 1 then
				var_1_0[var_1_2] = clone(DestroyBoxGameRewardCfg.get_id_list_by_activity_id[var_1_2])
			end
		end

		return var_1_0
	end
}

function var_0_0.GetSortRewardPanel(arg_2_0, arg_2_1)
	local var_2_0 = {}
	local var_2_1 = {}

	for iter_2_0, iter_2_1 in pairs(arg_2_1) do
		local var_2_2, var_2_3 = var_0_0.GetSortRewardList(arg_2_0, iter_2_1)

		if var_2_3 > 0 then
			table.insert(var_2_1, iter_2_0)
		else
			table.insert(var_2_0, iter_2_0)
		end
	end

	local var_2_4 = {}

	table.sort(var_2_1, function(arg_3_0, arg_3_1)
		return arg_3_0 < arg_3_1
	end)
	table.sort(var_2_0, function(arg_4_0, arg_4_1)
		return arg_4_0 < arg_4_1
	end)
	table.insertto(var_2_4, var_2_1)
	table.insertto(var_2_4, var_2_0)

	return var_2_4, #var_2_1
end

function var_0_0.GetSortRewardList(arg_5_0, arg_5_1)
	local var_5_0 = {}
	local var_5_1 = {}
	local var_5_2 = {}

	for iter_5_0, iter_5_1 in ipairs(arg_5_1) do
		if table.keyof(DestroyBoxGameData:GetReceiveRewardList(arg_5_0), iter_5_1) then
			table.insert(var_5_2, iter_5_1)
		elseif var_0_0.IsUnlockReward(iter_5_1) then
			table.insert(var_5_1, iter_5_1)
		else
			table.insert(var_5_0, iter_5_1)
		end
	end

	local var_5_3 = {}

	table.insertto(var_5_3, var_5_1)
	table.insertto(var_5_3, var_5_0)
	table.insertto(var_5_3, var_5_2)

	return var_5_3, #var_5_1
end

function var_0_0.IsUnlockReward(arg_6_0)
	local var_6_0 = DestroyBoxGameRewardCfg[arg_6_0]
	local var_6_1 = var_6_0.activity_id

	for iter_6_0, iter_6_1 in ipairs(var_6_0.difficulty_id) do
		local var_6_2

		if var_6_0.need_show ~= 1 then
			var_6_2 = DestroyBoxGameCfg.get_id_list_by_activity_id[var_6_1][1]
		else
			var_6_2 = DestroyBoxGameCfg.get_id_list_by_activity_id[var_6_1][iter_6_1]
		end

		local var_6_3 = DestroyBoxGameData:GetStageData(var_6_2)

		if var_6_3 and var_6_3.maxScore >= var_6_0.complete_num then
			return true
		end
	end

	return false
end

function var_0_0.GetCanReceiveRewardList(arg_7_0)
	local var_7_0 = {}
	local var_7_1 = DestroyBoxGameData:GetReceiveRewardList(arg_7_0)

	for iter_7_0, iter_7_1 in ipairs(DestroyBoxGameRewardCfg.get_id_list_by_main_activity_id[arg_7_0]) do
		if DestroyBoxGameRewardCfg[iter_7_1].need_show == 1 and not table.keyof(var_7_1, iter_7_1) and DestroyBoxGameTools.IsUnlockReward(iter_7_1) then
			table.insert(var_7_0, iter_7_1)
		end
	end

	return var_7_0
end

function var_0_0.GetFinishRewardCnt(arg_8_0)
	local var_8_0 = 0
	local var_8_1 = DestroyBoxGameData:GetReceiveRewardList(arg_8_0)

	for iter_8_0, iter_8_1 in ipairs(DestroyBoxGameRewardCfg.get_id_list_by_main_activity_id[arg_8_0]) do
		if table.keyof(var_8_1, iter_8_1) and DestroyBoxGameRewardCfg[iter_8_1].need_show == 1 then
			var_8_0 = var_8_0 + 1
		end
	end

	return var_8_0
end

return var_0_0
