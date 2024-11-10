local var_0_0 = {}

manager.net:Bind(67001, function(arg_1_0)
	AdminCatExploreData:InitExploreData(arg_1_0)
end)

function var_0_0.AdminCatSkillLevelUp(arg_2_0, arg_2_1)
	local var_2_0 = {
		mimir_id = arg_2_0,
		skill_id = arg_2_1
	}

	manager.net:SendWithLoadingNew(67002, var_2_0, 67003, var_0_0.AdminCatSkillLevelUpCallBack)
end

function var_0_0.AdminCatSkillLevelUpCallBack(arg_3_0, arg_3_1)
	if isSuccess(arg_3_0.result) then
		AdminCatExploreData:UpdateSkillList(arg_3_1.skill_id)
		ShowTips("EXPLORE_SKILL_UPGRADE")
		manager.notify:CallUpdateFunc(EXPLORE_LEVEL_UP_SKILL_UPDATE)
	else
		ShowTips(GetTips(arg_3_0.result))
	end
end

function var_0_0.AdminCatExplore(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0 = {
		area_id = arg_4_2,
		hour_time = arg_4_1,
		mimir_id = arg_4_0
	}

	manager.net:SendWithLoadingNew(67004, var_4_0, 67005, var_0_0.AdminCatExploreCallBack)
end

function var_0_0.AdminCatExploreCallBack(arg_5_0, arg_5_1)
	if isSuccess(arg_5_0.result) then
		manager.notify:CallUpdateFunc(EXPLORE_UPDATE)
	else
		ShowTips(GetTips(arg_5_0.result))
	end
end

function var_0_0.AdminCatExploreFinish(arg_6_0)
	local var_6_0 = {
		area_id = arg_6_0
	}

	manager.net:SendWithLoadingNew(67006, var_6_0, 67007, var_0_0.AdminCatExploreFinishCallBack)
end

function var_0_0.AdminCatExploreFinishCallBack(arg_7_0, arg_7_1)
	if isSuccess(arg_7_0.result) then
		AdminCatExploreData:UpdateFinishExploreData(arg_7_1.area_id, arg_7_0.event_id, arg_7_0.reward_list)
		manager.notify:CallUpdateFunc(EXPLORE_UPDATE)
	else
		ShowTips(GetTips(arg_7_0.result))
	end
end

function var_0_0.GetWeekReward()
	manager.net:SendWithLoadingNew(67008, {}, 67009, function(arg_9_0)
		if isSuccess(arg_9_0.result) then
			AdminCatExploreData:ResetExploreDay(arg_9_0.reward_list)
			ShowTips("EXPLORE_REWARD_COLLECTION")
			manager.notify:CallUpdateFunc(EXPLORE_REWARD_UPDATE)
		else
			ShowTips(GetTips(arg_9_0.result))
		end
	end)
end

function var_0_0.UnlockAdminCat(arg_10_0)
	local var_10_0 = {
		mimir_id = arg_10_0
	}

	manager.net:SendWithLoadingNew(67010, var_10_0, 67011, var_0_0.UnlockAdminCatCallBack)
end

function var_0_0.UnlockAdminCatCallBack(arg_11_0, arg_11_1)
	if isSuccess(arg_11_0.result) then
		AdminCatExploreData:UpdateUnlockAdminCatList(arg_11_1.mimir_id)
		ShowTips("EXPLORE_MEOW_DEBLOCKING")
		manager.notify:CallUpdateFunc(EXPLORE_UNLOCK_ADMIN_CAT_UPDATE)
	else
		ShowTips(GetTips(arg_11_0.result))
	end
end

function var_0_0.WeeklyFirstOpen()
	manager.net:SendWithLoadingNew(67012, {}, 67013, var_0_0.WeeklyFirstOpenCallBack)
end

function var_0_0.WeeklyFirstOpenCallBack(arg_13_0, arg_13_1)
	if isSuccess(arg_13_0.result) then
		AdminCatExploreData:UpdateWeeklyFirst()
	else
		ShowTips(GetTips(arg_13_0.result))
	end
end

return var_0_0
