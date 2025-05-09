local var_0_0 = {}
local var_0_1 = {
	[109502] = {
		"Atlas/T0_109502Atlas",
		"T0_109502_01212_6"
	},
	[102003] = {
		"Atlas/T0_102003Atlas",
		"T0_102003_4_1_01240"
	}
}
local var_0_2 = {
	[6017] = {
		"TextureBg/Version/T0_109502/T0_109502_01212_7"
	},
	[6018] = {
		"TextureBg/Version/T0_109502/T0_109502_01212_8"
	},
	[6030] = {
		"TextureBg/Version/T0_102003/T0_102003_4_1_01247"
	}
}
local var_0_3 = {
	normal = {
		"search_scene_03_blue",
		"search_scene_03_purple",
		"search_scene_03_gold",
		"search_scene_03_special"
	},
	[102003] = {
		"search_scene_102003_purple",
		"search_scene_102003_purple",
		"search_scene_102003_gold",
		"search_scene_102003_special"
	}
}
local var_0_4 = {
	normal = {
		"search_scene_03_blue",
		"search_scene_03_purple",
		"search_scene_03_gold",
		"search_scene_03_special"
	},
	[102003] = {
		"search_scene_102003_02",
		"search_scene_102003_02",
		"search_scene_102003_02",
		"search_scene_102003_02"
	}
}

function var_0_0.GetSkinDrawCfg(arg_1_0)
	local var_1_0 = T0SkinDrawCfg[arg_1_0]

	if var_1_0 == nil then
		-- block empty
	end

	return var_1_0
end

function var_0_0.GetPoolIdList(arg_2_0)
	return var_0_0.GetSkinDrawCfg(arg_2_0).poolList
end

function var_0_0.GetScenePoolActivityID(arg_3_0)
	return var_0_0.GetSkinDrawCfg(arg_3_0).scenePoolList
end

function var_0_0.GetTaskActivityID(arg_4_0)
	return var_0_0.GetSkinDrawCfg(arg_4_0).activityTaskId
end

function var_0_0.GetTaskCurrency(arg_5_0)
	return var_0_0.GetSkinDrawCfg(arg_5_0).taskCurrency
end

function var_0_0.GetMainUIName(arg_6_0)
	return var_0_0.GetSkinDrawCfg(arg_6_0).mainUI
end

function var_0_0.GetTaskUIName(arg_7_0)
	return var_0_0.GetSkinDrawCfg(arg_7_0).taskUI
end

function var_0_0.GetPopUIName(arg_8_0)
	return var_0_0.GetSkinDrawCfg(arg_8_0).exchangeUI
end

function var_0_0.GetDrawStartUIName(arg_9_0)
	return var_0_0.GetSkinDrawCfg(arg_9_0).drawStartUI
end

function var_0_0.GetDrawRewardUIName(arg_10_0)
	return var_0_0.GetSkinDrawCfg(arg_10_0).drawPopSingleUI
end

function var_0_0.GetDrawResultUIName(arg_11_0)
	return var_0_0.GetSkinDrawCfg(arg_11_0).drawEndUI
end

function var_0_0.GetDrawInfoUIName(arg_12_0)
	return var_0_0.GetSkinDrawCfg(arg_12_0).drawInfoUI
end

function var_0_0.GetActivityShopID(arg_13_0)
	return ActivityShopCfg[arg_13_0].shop_id
end

function var_0_0.GetTypeGo(arg_14_0)
	return var_0_0.GetSkinDrawCfg(arg_14_0).drawEffectUI
end

function var_0_0.GetStoryID(arg_15_0)
	local var_15_0 = ActivityLimitedSkinStoryCfg.get_id_list_by_main_activity_id[arg_15_0]

	for iter_15_0, iter_15_1 in ipairs(var_15_0) do
		local var_15_1 = ActivityLimitedSkinStoryCfg[iter_15_1]

		if var_15_1.activity_id == 0 then
			return var_15_1.story_id
		end
	end

	return 0
end

function var_0_0.GetPoolID(arg_16_0)
	return ActivityLimitedDrawPoolListCfg.get_id_list_by_activity_id[arg_16_0][1]
end

function var_0_0.GetAllReward(arg_17_0)
	local var_17_0 = {}
	local var_17_1

	for iter_17_0, iter_17_1 in ipairs(var_0_0.GetPoolIdList(arg_17_0)) do
		local var_17_2 = ActivityLimitedDrawPoolListCfg[iter_17_1]
		local var_17_3 = var_17_2.main_icon_info

		for iter_17_2, iter_17_3 in ipairs(var_17_3) do
			local var_17_4 = iter_17_3[2]
			local var_17_5 = ItemCfg[var_17_4]

			if var_17_5.type == ItemConst.ITEM_TYPE.SCENE then
				var_17_0[var_17_2.activity_id[1]] = var_17_4
			elseif var_17_5.type == ItemConst.ITEM_TYPE.HERO_SKIN then
				var_17_1 = var_17_4
			end
		end
	end

	return var_17_0, var_17_1
end

function var_0_0.OnJumpToSkinDraw(arg_18_0)
	if ActivityData:GetActivityData(arg_18_0):IsActivitying() then
		if not JumpTools.IsSystemLocked(ViewConst.SYSTEM_ID.SKIN_DRAW) then
			local var_18_0 = ActivitySkinDrawData:GetStoryInfo(arg_18_0)

			manager.posterGirl:SetViewTag(PosterGirlConst.ViewTag.null)

			if var_18_0 and var_18_0.isRead == 0 then
				ActivitySkinDrawAction.FinishStory(var_18_0.activityID, var_18_0.storyId)
				manager.loadScene:SetCurSceneActive(false)
				manager.story:StartStoryById(var_18_0.storyId, function()
					manager.loadScene:SetCurSceneActive(true)
					manager.loadScene:ForceSetShouldLoadSceneName("home", function()
						JumpTools.GoToSystem("/activityskinDraw", {
							checkReward = true,
							activityID = arg_18_0
						}, ViewConst.SYSTEM_ID.SKIN_DRAW)
					end)
				end, false)
			else
				JumpTools.GoToSystem("/activityskinDraw", {
					checkReward = true,
					activityID = arg_18_0
				}, ViewConst.SYSTEM_ID.SKIN_DRAW)
			end
		else
			ShowTips(JumpTools.GetSystemLockedTip(ViewConst.SYSTEM_ID.SKIN_DRAW, JumpTools.IsSystemLocked(ViewConst.SYSTEM_ID.SKIN_DRAW)))
		end
	end
end

function var_0_0.GetSkinIconPath(arg_21_0)
	return var_0_1[arg_21_0]
end

function var_0_0.GetSceneIconPath(arg_22_0)
	return var_0_2[arg_22_0]
end

function var_0_0.GetSoundEffect(arg_23_0)
	local var_23_0 = ActivitySkinDrawData:GetSkinId()

	return var_0_3[var_23_0] or var_0_3.normal
end

function var_0_0.GetOpenBoxEffect(arg_24_0)
	local var_24_0 = ActivitySkinDrawData:GetSkinId()

	return var_0_4[var_24_0] or var_0_4.normal
end

return var_0_0
