local var_0_0 = singletonClass("ActivitySkinDrawDataOld")
local var_0_1 = {}
local var_0_2 = {}
local var_0_3 = {}
local var_0_4 = {}

function var_0_0.Init(arg_1_0)
	var_0_1 = {}
	var_0_2 = {}
	var_0_3 = {}
	var_0_4 = {}
	arg_1_0.nowStoryActivityId_ = nil
end

function var_0_0.InitDrawData(arg_2_0, arg_2_1)
	local var_2_0 = arg_2_1.activity_id

	var_0_1[var_2_0] = {}
	arg_2_0.mainActivityId_ = ActivityCfg.get_id_list_by_sub_activity_list[var_2_0][1]

	for iter_2_0, iter_2_1 in ipairs(arg_2_1.info) do
		local var_2_1 = iter_2_1.drop_id

		var_0_1[var_2_0][var_2_1] = {
			id = var_2_1,
			num = iter_2_1.num
		}
	end

	arg_2_0:RefreshSkinDrawEntrace()
end

function var_0_0.RefreshData(arg_3_0, arg_3_1, arg_3_2)
	if var_0_1[arg_3_1] then
		for iter_3_0, iter_3_1 in ipairs(arg_3_2) do
			local var_3_0 = var_0_1[arg_3_1][iter_3_1].num
			local var_3_1

			var_3_1 = var_3_0 - 1 >= 0 and var_3_0 - 1 or 0
			var_0_1[arg_3_1][iter_3_1].num = var_3_1
		end
	end
end

function var_0_0.InitStoryData(arg_4_0, arg_4_1)
	local var_4_0 = arg_4_1.activity_id
	local var_4_1 = ActivityLimitedSkinStoryCfg.get_id_list_by_activity_id[var_4_0][1]
	local var_4_2 = ActivityLimitedSkinStoryCfg[var_4_1].main_activity_id
	local var_4_3 = ActivityLimitedSkinStoryCfg[var_4_1].story_id

	var_0_2[var_4_2] = var_0_2[var_4_2] or {}
	var_0_2[var_4_2][var_4_0] = {
		activityID = var_4_0,
		mainActivityID = var_4_2,
		storyID = var_4_3,
		isRead = manager.story:IsStoryPlayed(var_4_3) and 1 or 0
	}

	if var_0_2[var_4_2][var_4_0].isRead == 0 and (arg_4_0.nowStoryActivityId_ == nil or var_4_0 <= arg_4_0.nowStoryActivityId_) then
		arg_4_0.nowStoryActivityId_ = var_4_0
	end

	arg_4_0:RefreshSkinDrawEntrace()
end

function var_0_0.RefreshSkinDrawEntrace(arg_5_0)
	manager.notify:Invoke(ACTIVITY_SKIN_DRAW_UPDATE, arg_5_0.mainActivityId_)
end

function var_0_0.FinishStory(arg_6_0, arg_6_1)
	if var_0_2[arg_6_1][arg_6_0.nowStoryActivityId_] then
		var_0_2[arg_6_1][arg_6_0.nowStoryActivityId_].isRead = 1
		arg_6_0.nowStoryActivityId_ = nil
	end

	for iter_6_0, iter_6_1 in pairs(var_0_2[arg_6_1]) do
		if iter_6_1.isRead == 0 and (arg_6_0.nowStoryActivityId_ == nil or iter_6_1.activityID <= arg_6_0.nowStoryActivityId_) then
			arg_6_0.nowStoryActivityId_ = iter_6_1.activityID
		end
	end
end

function var_0_0.GetActivityList(arg_7_0)
	local var_7_0 = {}

	if arg_7_0.mainActivityId_ and ActivityData:GetActivityData(arg_7_0.mainActivityId_):IsActivitying() then
		table.insert(var_7_0, arg_7_0.mainActivityId_)
	end

	return var_7_0
end

function var_0_0.GetStoryInfo(arg_8_0, arg_8_1)
	return var_0_2[arg_8_1] and var_0_2[arg_8_1][arg_8_0.nowStoryActivityId_] or nil
end

function var_0_0.GetDrawInfo(arg_9_0, arg_9_1, arg_9_2)
	return var_0_1[arg_9_1] and var_0_1[arg_9_1][arg_9_2] or nil
end

function var_0_0.GetCurDrawPool(arg_10_0, arg_10_1)
	return var_0_3[arg_10_1]
end

function var_0_0.SetCurDrawPool(arg_11_0, arg_11_1, arg_11_2)
	var_0_3[arg_11_1] = arg_11_2
end

function var_0_0.GetLastFile(arg_12_0, arg_12_1)
	return var_0_4[arg_12_1]
end

function var_0_0.SetLastFile(arg_13_0, arg_13_1, arg_13_2)
	var_0_4[arg_13_1] = arg_13_2
end

return var_0_0
