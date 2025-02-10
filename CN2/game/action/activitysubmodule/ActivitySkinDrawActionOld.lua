local var_0_0 = {}
local var_0_1 = false

function var_0_0.Init()
	ActivitySkinDrawDataOld:Init()

	if var_0_1 then
		return
	end

	manager.net:Bind(68151, function(arg_2_0)
		ActivitySkinDrawDataOld:InitDrawData(arg_2_0)
		var_0_0.RefreshRed(arg_2_0.activity_id)
	end)
	manager.net:Bind(68161, function(arg_3_0)
		ActivitySkinDrawDataOld:InitStoryData(arg_3_0)
	end)

	var_0_1 = true
end

function var_0_0.InitRedPointKey(arg_4_0)
	local var_4_0 = ActivitySkinDrawToolsOld.GetTaskActivityID(arg_4_0)
	local var_4_1 = RedPointConst.ACTIVITY_TASK .. "_" .. var_4_0
	local var_4_2 = ActivitySkinDrawToolsOld.GetScenePoolActivityID(arg_4_0)
	local var_4_3 = ActivitySkinDrawToolsOld.GetSceneID(var_4_2)

	if var_4_3 and var_4_3 ~= 0 then
		local var_4_4 = RedPointConst.SCENE .. "_" .. var_4_3

		manager.redPoint:addGroup(RedPointConst.ACTIVITY_DRAW .. "_" .. arg_4_0, {
			var_4_1,
			var_4_4
		})
	else
		manager.redPoint:addGroup(RedPointConst.ACTIVITY_DRAW .. "_" .. arg_4_0, {
			var_4_1
		})
	end
end

function var_0_0.StartDraw(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = {
		activity_id = arg_5_0,
		pool_id = arg_5_1,
		drop_type = arg_5_2
	}

	var_0_0.materialItem_ = {}

	local var_5_1 = {}
	local var_5_2 = ActivityLimitedDrawPoolCfg.get_id_list_by_pool_id[arg_5_1] or {}

	for iter_5_0, iter_5_1 in ipairs(var_5_2) do
		local var_5_3 = ActivityLimitedDrawPoolCfg[iter_5_1].reward[1][1]
		local var_5_4 = ItemCfg[var_5_3]

		if var_5_4.type == ItemConst.ITEM_TYPE.HERO_SKIN then
			if HeroTools.GetSkinIsUnlock(var_5_3) then
				table.insert(var_5_1, iter_5_1)
			end
		elseif var_5_4.type == ItemConst.ITEM_TYPE.SCENE then
			if HomeSceneSettingData:GetUsedState(var_5_3) == SceneConst.HOME_SCENE_TYPE.UNLOCK then
				table.insert(var_5_1, iter_5_1)
			end
		elseif var_5_4.type == ItemConst.ITEM_TYPE.FRAME then
			local var_5_5 = PlayerData:GetFrame(var_5_3)

			if var_5_5 and var_5_5.unlock == 1 and var_5_5.lasted_time == 0 then
				table.insert(var_5_1, iter_5_1)
			end
		elseif var_5_4.type == ItemConst.ITEM_TYPE.DYNAMIC_STICKER then
			local var_5_6 = var_5_4.param[1]
			local var_5_7 = ChatStickerCfg[var_5_6]

			if var_5_7 and not (var_5_7.free == 0 and ChatStickerData:IsLockSticker(var_5_6) or false) then
				table.insert(var_5_1, iter_5_1)
			end
		else
			var_0_0.materialItem_[iter_5_1] = iter_5_1
		end
	end

	manager.net:SendWithLoadingNew(68152, var_5_0, 68153, function(arg_6_0)
		if isSuccess(arg_6_0.result) then
			local var_6_0 = arg_6_0.drop_list

			ActivitySkinDrawDataOld:RefreshData(arg_5_0, var_6_0)

			local var_6_1 = ActivityTools.GetMainActivityId(arg_5_0)
			local var_6_2 = {
				activityID = arg_5_0,
				mainActivityID = var_6_1,
				poolID = arg_5_1,
				draw_list = var_6_0,
				replaceList = var_5_1
			}

			JumpTools.OpenPageByJump("/activitySkinDrawStartOld", var_6_2)
		else
			ShowTips(arg_6_0.result)
		end
	end)
end

function var_0_0.GetIsCanReplace(arg_7_0)
	return var_0_0.materialItem_[arg_7_0] == nil
end

function var_0_0.FinishStory(arg_8_0, arg_8_1)
	local var_8_0 = {
		activity_id = arg_8_0,
		story_id = arg_8_1
	}

	manager.net:SendWithLoadingNew(68162, var_8_0, 68163, var_0_0.OnFinishStory)
end

function var_0_0.OnFinishStory(arg_9_0, arg_9_1)
	if isSuccess(arg_9_0.result) then
		local var_9_0 = arg_9_1.activity_id
		local var_9_1 = ActivityLimitedSkinStoryCfg.get_id_list_by_activity_id[var_9_0][1]
		local var_9_2 = ActivityLimitedSkinStoryCfg[var_9_1].main_activity_id

		ActivitySkinDrawDataOld:FinishStory(var_9_2)
	else
		ShowTips(arg_9_0.result)
	end
end

function var_0_0.RefreshRed(arg_10_0)
	local var_10_0 = ActivitySkinDrawToolsOld.GetSceneID(arg_10_0)

	if var_10_0 and var_10_0 ~= 0 then
		local var_10_1 = getData("scene", tostring(var_10_0)) or 0

		manager.redPoint:setTip(RedPointConst.SCENE .. "_" .. var_10_0, var_10_1)
	end
end

return var_0_0
