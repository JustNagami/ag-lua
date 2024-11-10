local var_0_0 = singletonClass("ActivitySkinDrawData")
local var_0_1 = {}
local var_0_2 = {}
local var_0_3 = {}
local var_0_4 = {}

function var_0_0.Init(arg_1_0)
	var_0_1 = {}
	var_0_2 = {}
	var_0_3 = {}
	var_0_4 = {}
end

function var_0_0.InitDrawData(arg_2_0, arg_2_1)
	local var_2_0 = arg_2_1.activity_id

	var_0_1[var_2_0] = {}
	var_0_1[var_2_0].all = {}

	local var_2_1 = arg_2_0:GetPoolID(var_2_0)
	local var_2_2 = ActivityLimitedDrawPoolCfg.get_id_list_by_pool_id[var_2_1]

	for iter_2_0, iter_2_1 in ipairs(var_2_2) do
		local var_2_3 = ActivityLimitedDrawPoolCfg[iter_2_1]

		var_0_1[var_2_0][iter_2_1] = {
			id = iter_2_1,
			num = var_2_3.total
		}

		table.insert(var_0_1[var_2_0].all, iter_2_1)
	end

	for iter_2_2, iter_2_3 in ipairs(arg_2_1.info) do
		local var_2_4 = iter_2_3.drop_id

		var_0_1[var_2_0][var_2_4] = {
			id = var_2_4,
			num = iter_2_3.num
		}
	end
end

function var_0_0.GetPoolID(arg_3_0, arg_3_1)
	local var_3_0 = ActivityLimitedDrawPoolListCfg.all

	for iter_3_0, iter_3_1 in ipairs(var_3_0) do
		local var_3_1 = ActivityLimitedDrawPoolListCfg[iter_3_1].activity_id

		if table.indexof(var_3_1, arg_3_1) then
			return iter_3_1
		end
	end

	return 0
end

function var_0_0.RefreshData(arg_4_0, arg_4_1, arg_4_2)
	if var_0_1[arg_4_1] then
		for iter_4_0, iter_4_1 in ipairs(arg_4_2) do
			local var_4_0 = var_0_1[arg_4_1][iter_4_1].num
			local var_4_1

			var_4_1 = var_4_0 - 1 >= 0 and var_4_0 - 1 or 0
			var_0_1[arg_4_1][iter_4_1].num = var_4_1
		end
	end
end

function var_0_0.InitStoryData(arg_5_0, arg_5_1)
	local var_5_0 = arg_5_1.activity_id
	local var_5_1 = ActivityLimitedSkinStoryCfg[var_5_0].main_activity_id

	var_0_2[var_5_1] = {
		activityID = var_5_0,
		mainActivityID = var_5_1,
		storyID = arg_5_1.story_stage,
		isRead = arg_5_1.is_read
	}
end

function var_0_0.FinishStory(arg_6_0, arg_6_1)
	if var_0_2[arg_6_1] then
		var_0_2[arg_6_1].isRead = 1
	end
end

function var_0_0.GetNotReadStoryID(arg_7_0)
	for iter_7_0, iter_7_1 in pairs(var_0_1) do
		if ActivityData:GetActivityData(iter_7_0):IsActivitying() then
			local var_7_0 = ActivityTools.GetMainActivityId(iter_7_0)

			return var_7_0, var_0_2[var_7_0]
		end
	end
end

function var_0_0.GetDrawInfo(arg_8_0, arg_8_1, arg_8_2)
	return var_0_1[arg_8_1][arg_8_2]
end

function var_0_0.GetCurDrawPool(arg_9_0, arg_9_1)
	return var_0_3[arg_9_1]
end

function var_0_0.SetCurDrawPool(arg_10_0, arg_10_1, arg_10_2)
	var_0_3[arg_10_1] = arg_10_2
end

function var_0_0.GetLastFile(arg_11_0, arg_11_1)
	return var_0_4[arg_11_1]
end

function var_0_0.SetLastFile(arg_12_0, arg_12_1, arg_12_2)
	var_0_4[arg_12_1] = arg_12_2
end

return var_0_0
