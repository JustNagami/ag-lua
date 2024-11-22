local var_0_0 = {}

manager.net:Bind(32107, function(arg_1_0)
	HomeSceneSettingData:InitOverdueSceneList(arg_1_0.poster_background_list or {})
end)

function var_0_0.DealOverdueScene()
	manager.net:SendWithLoadingNew(32112, {}, 32113, var_0_0.OnDealOverdueScene)
end

function var_0_0.OnDealOverdueScene(arg_3_0, arg_3_1)
	if isSuccess(arg_3_0.result) then
		-- block empty
	else
		ShowTips(arg_3_0.result)
	end
end

function var_0_0.SetHomeScene(arg_4_0)
	if arg_4_0 == HomeSceneSettingData:GetCurScene() then
		return
	end

	local var_4_0 = {
		poster_background_id = arg_4_0
	}

	manager.net:SendWithLoadingNew(32108, var_4_0, 32109, var_0_0.OnSetHomeScene)
end

function var_0_0.OnSetHomeScene(arg_5_0, arg_5_1)
	if isSuccess(arg_5_0.result) then
		HomeSceneSettingData:SetCurScene(arg_5_1.poster_background_id)
		manager.notify:CallUpdateFunc(HOME_SCENE_CHANGE)
	else
		ShowTips(arg_5_0.result)
	end
end

function var_0_0.CheckMatchScene(arg_6_0, arg_6_1)
	local var_6_0 = ItemCfg[arg_6_0].param[1]
	local var_6_1 = PlayerData:GetPlayerInfo()
	local var_6_2 = HeroTools.HeroUsingSkinInfo(var_6_1.poster_girl).id
	local var_6_3 = SkinSceneActionCfg[var_6_2]

	if var_6_3 and (arg_6_1 == 0 or arg_6_1 ~= 0 and arg_6_1 > manager.time:GetServerTime()) and var_6_3.special_scene_id == var_6_0 then
		HomeSceneSettingAction.SetHomeScene(var_6_0)

		return true
	end

	return false
end

function var_0_0.CheckPosterSceneCanUse(arg_7_0)
	return HomeSceneSettingData:GetUsedState(arg_7_0) == SceneConst.HOME_SCENE_TYPE.TRIAL or HomeSceneSettingData:GetUsedState(arg_7_0) == SceneConst.HOME_SCENE_TYPE.UNLOCK
end

function var_0_0.CheckMatchSkin(arg_8_0)
	local var_8_0 = PlayerData:GetPlayerInfo()

	if arg_8_0 ~= var_8_0.poster_girl then
		return
	end

	local var_8_1 = HeroTools.HeroUsingSkinInfo(var_8_0.poster_girl).id
	local var_8_2 = SkinSceneActionCfg[var_8_1]
	local var_8_3 = HomeSceneSettingData:GetRealScene()
	local var_8_4 = HomeSceneSettingCfg[var_8_3]

	if var_8_2 and var_0_0.CheckPosterSceneCanUse(var_8_2.special_scene_id) then
		HomeSceneSettingAction.SetHomeScene(var_8_2.special_scene_id)

		return true
	end

	if var_8_4.limit_display == 0 then
		local var_8_5 = HomeSceneSettingData:GetDefaultScene()

		HomeSceneSettingAction.SetHomeScene(var_8_5)

		return true
	end

	return false
end

function var_0_0.CheckMatchPosterGirl(arg_9_0)
	local var_9_0 = HeroTools.HeroUsingSkinInfo(arg_9_0).id
	local var_9_1 = SkinSceneActionCfg[var_9_0]
	local var_9_2 = HomeSceneSettingData:GetRealScene()
	local var_9_3 = HomeSceneSettingCfg[var_9_2]

	if var_9_1 and var_0_0.CheckPosterSceneCanUse(var_9_1.special_scene_id) then
		HomeSceneSettingAction.SetHomeScene(var_9_1.special_scene_id)

		return true
	end

	if var_9_3.limit_display == 0 then
		local var_9_4 = HomeSceneSettingData:GetDefaultScene()

		HomeSceneSettingAction.SetHomeScene(var_9_4)

		return true
	end

	return false
end

function var_0_0.ChangeSceneTab(arg_10_0)
	local var_10_0 = SkinSceneActionCfg[arg_10_0]
	local var_10_1 = HomeSceneSettingData:GetRealScene()

	if var_10_0 and var_0_0.CheckPosterSceneCanUse(var_10_0.special_scene_id) then
		if var_10_1 ~= var_10_0.special_scene_id then
			HomeSceneSettingAction.SetHomeScene(var_10_0.special_scene_id)
		else
			local var_10_2 = HomeSceneSettingData:GetDefaultScene()

			HomeSceneSettingAction.SetHomeScene(var_10_2)
		end
	end
end

return var_0_0
