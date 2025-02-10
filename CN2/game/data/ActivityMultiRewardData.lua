local var_0_0 = singletonClass("ActivityMultiRewardData")
local var_0_1 = {}
local var_0_2 = {}
local var_0_3 = 0
local var_0_4 = {}
local var_0_5 = {}

function var_0_0.Init(arg_1_0)
	var_0_1 = {}
	var_0_5 = {}

	for iter_1_0, iter_1_1 in ipairs(ActivityMultiRewardCfg.all) do
		local var_1_0 = ActivityMultiRewardCfg[iter_1_1]

		if not var_0_1[var_1_0.activity_id] then
			var_0_1[var_1_0.activity_id] = {}
			var_0_1[var_1_0.activity_id].ratio = var_1_0.reward_ratio
			var_0_1[var_1_0.activity_id].count = var_1_0.count
		elseif var_0_1[var_1_0.activity_id].ratio ~= var_1_0.reward_ratio or var_0_1[var_1_0.activity_id].count ~= var_1_0.count then
			Debug.LogError("多倍掉落的活动配置表出现错误！！！")

			return
		end

		if not var_0_5[var_1_0.chapter_id] then
			var_0_5[var_1_0.chapter_id] = var_1_0.activity_id
		end
	end

	var_0_4 = {}

	for iter_1_2, iter_1_3 in ipairs(ChapterCfg.all) do
		local var_1_1 = ChapterCfg[iter_1_3]

		if var_0_5[iter_1_3] then
			for iter_1_4, iter_1_5 in ipairs(var_1_1.section_id_list) do
				var_0_4[iter_1_5] = var_0_5[iter_1_3]
			end
		end
	end

	var_0_2 = {}
	var_0_3 = 0
end

function var_0_0.GetCountByActivityID(arg_2_0, arg_2_1)
	return var_0_2[arg_2_1].count, var_0_1[arg_2_1].count
end

function var_0_0.GetTimeByActivityID(arg_3_0, arg_3_1)
	return var_0_2[arg_3_1].time
end

function var_0_0.GetLastBattleMultiData(arg_4_0)
	if var_0_3 == 0 then
		return 0
	end

	return var_0_2[var_0_3].count, var_0_1[var_0_3].count, var_0_1[var_0_3].ratio
end

function var_0_0.ParseBattleMultiReward(arg_5_0, arg_5_1)
	var_0_2[arg_5_1.activity_id] = {
		count = arg_5_1.count,
		time = arg_5_1.next_refresh_time
	}
	var_0_3 = arg_5_1.activity_id
end

function var_0_0.CheckMultiReward(arg_6_0)
	for iter_6_0, iter_6_1 in pairs(var_0_2) do
		return true
	end

	return false
end

function var_0_0.GetMultiRatioByChapterOrToggle(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
	if not arg_7_0:CheckMultiReward() then
		return 0
	end

	local var_7_0 = 0
	local var_7_1

	if arg_7_1 then
		local var_7_2 = ChapterClientCfg.get_id_list_by_toggle[arg_7_1]

		if var_7_2 then
			for iter_7_0, iter_7_1 in ipairs(var_7_2) do
				var_7_1 = var_0_5[iter_7_1]

				if var_7_1 and var_0_2[var_7_1] then
					var_7_0 = var_0_1[var_7_1].ratio

					if arg_7_3 and var_0_2[var_7_1].count <= 0 then
						var_7_0 = 0
					end

					break
				end
			end
		end
	end

	if arg_7_2 then
		var_7_1 = var_0_5[arg_7_2]

		if var_7_1 and var_0_2[var_7_1] then
			var_7_0 = var_0_1[var_7_1].ratio

			if arg_7_3 and var_0_2[var_7_1].count <= 0 then
				var_7_0 = 0
			end
		end
	end

	return var_7_0, var_7_1
end

return var_0_0
