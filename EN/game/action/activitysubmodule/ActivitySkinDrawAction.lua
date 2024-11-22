local var_0_0 = {}
local var_0_1 = false

function var_0_0.Init()
	ActivitySkinDrawData:Init()

	if var_0_1 then
		return
	end

	manager.net:Bind(68151, function(arg_2_0)
		ActivitySkinDrawData:InitDrawData(arg_2_0)
		var_0_0.RefreshRed(arg_2_0.activity_id)
	end)
	manager.net:Bind(68161, function(arg_3_0)
		ActivitySkinDrawData:InitStoryData(arg_3_0)
	end)

	var_0_1 = true
end

function var_0_0.InitRedPointKey(arg_4_0)
	local var_4_0 = ActivitySkinDrawTools.GetTaskActivityID(arg_4_0)
	local var_4_1 = RedPointConst.ACTIVITY_TASK .. "_" .. var_4_0

	manager.redPoint:addGroup(RedPointConst.ACTIVITY_DRAW .. "_" .. arg_4_0, {
		var_4_1
	})

	local var_4_2 = var_0_0.GetSceneID(arg_4_0)

	if var_4_2 then
		local var_4_3 = RedPointConst.SCENE .. "_" .. var_4_2

		manager.redPoint:addGroup(RedPointConst.ACTIVITY_DRAW .. "_" .. arg_4_0, {
			var_4_3
		})
	end
end

function var_0_0.GetSceneID(arg_5_0)
	local var_5_0 = ActivityCfg[arg_5_0].sub_activity_list[2]
	local var_5_1 = ActivitySkinDrawData:GetPoolID(var_5_0)
	local var_5_2 = ActivityLimitedDrawPoolCfg.get_id_list_by_pool_id[var_5_1]

	for iter_5_0, iter_5_1 in ipairs(var_5_2) do
		local var_5_3 = ActivityLimitedDrawPoolCfg[iter_5_1].reward[1][1]
		local var_5_4 = ItemCfg[var_5_3]

		if var_5_4.type == ItemConst.ITEM_TYPE.SCENE then
			return var_5_4.param[1]
		end
	end
end

function var_0_0.RefreshRed(arg_6_0)
	local var_6_0 = ActivityTools.GetMainActivityId(arg_6_0)
	local var_6_1 = var_0_0.GetSceneID(var_6_0)

	if var_6_1 then
		local var_6_2 = getData("scene", tostring(var_6_1)) or 0

		manager.redPoint:setTip(RedPointConst.SCENE .. "_" .. var_6_1, var_6_2)
	end
end

function var_0_0.StartDraw(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = {
		activity_id = arg_7_0,
		pool_id = arg_7_1,
		drop_type = arg_7_2
	}

	manager.net:SendWithLoadingNew(68152, var_7_0, 68153, var_0_0.OnStartDraw)
end

function var_0_0.OnStartDraw(arg_8_0, arg_8_1)
	if isSuccess(arg_8_0.result) then
		local var_8_0 = arg_8_1.pool_id
		local var_8_1 = arg_8_0.drop_list
		local var_8_2 = arg_8_1.activity_id

		ActivitySkinDrawData:RefreshData(var_8_2, var_8_1)

		local var_8_3 = {
			activityID = var_8_2,
			poolID = arg_8_1.pool_id,
			draw_list = var_8_1
		}

		JumpTools.OpenPageByJump("/activitySkinDrawStart", var_8_3)
	else
		ShowTips(arg_8_0.result)
	end
end

function var_0_0.FinishStory(arg_9_0)
	local var_9_0 = {
		activity_id = arg_9_0
	}

	manager.net:SendWithLoadingNew(68162, var_9_0, 68163, var_0_0.OnFinishStory)
end

function var_0_0.OnFinishStory(arg_10_0, arg_10_1)
	if isSuccess(arg_10_0.result) then
		local var_10_0 = ActivityLimitedSkinStoryCfg[arg_10_1.activity_id]

		ActivitySkinDrawData:FinishStory(var_10_0.main_activity_id)
	else
		ShowTips(arg_10_0.result)
	end
end

return var_0_0
