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

function var_0_0.SetHomeScene(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0 = arg_4_1 and HomeSceneSettingData:GetRealScene() or HomeSceneSettingData:GetCurScene()

	arg_4_0 = arg_4_0 or HomeSceneSettingData:GetCurSceneID()

	if arg_4_0 == var_4_0 and not arg_4_2 then
		return
	end

	local var_4_1 = {
		poster_background_id = arg_4_0
	}

	manager.net:SendWithLoadingNew(32108, var_4_1, 32109, var_0_0.OnSetHomeScene)
end

function var_0_0.OnSetHomeScene(arg_5_0, arg_5_1)
	if isSuccess(arg_5_0.result) then
		local var_5_0 = HomeSceneSettingData:GetCurScene()
		local var_5_1 = arg_5_1.poster_background_id

		HomeSceneSettingData:SetCurScene(arg_5_1.poster_background_id)

		if HomeSceneSettingData:IsRandomScene() and HomeSceneSettingData:GetUsedState(var_5_0) == SceneConst.HOME_SCENE_TYPE.LOCK then
			HomeSceneSettingData:CalcNextScene()
		end

		if IllustratedData:GetBgm() == 0 then
			local var_5_2 = SettingData:GetHomeSceneSettingData()
			local var_5_3 = HomeSceneSettingCfg[var_5_1]
			local var_5_4 = var_5_3.scene_setting
			local var_5_5 = var_5_3.default_music

			if var_5_5 ~= 0 and var_5_2.home_scene_scene_bgm == 1 and table.indexof(var_5_4, HomeSceneSettingConst.SETTING.SCENE_BGM) then
				IllustratedAction.QuerySetBgm(var_5_5)
			else
				local var_5_6 = HomeSceneSettingCfg[var_5_0]
				local var_5_7 = var_5_6.scene_setting
				local var_5_8 = var_5_6.default_music

				if var_5_8 ~= 0 and table.indexof(var_5_7, HomeSceneSettingConst.SETTING.SCENE_BGM) then
					IllustratedAction.QuerySetBgm(var_5_8)
				end
			end
		end

		manager.notify:CallUpdateFunc(HOME_SCENE_CHANGE)
		manager.notify:Invoke(HOME_SCENE_CHANGE)
	else
		ShowTips(arg_5_0.result)
	end
end

function var_0_0.CheckMatchScene(arg_6_0, arg_6_1)
	local var_6_0 = ItemCfg[arg_6_0].param[1]
	local var_6_1 = PlayerData:GetPlayerInfo()
	local var_6_2 = SkinCfg[var_6_1.poster_girl].hero
	local var_6_3 = HeroTools.HeroUsingSkinInfo(var_6_2).id
	local var_6_4 = SkinSceneActionCfg[var_6_3]

	if var_6_4 and (arg_6_1 == 0 or arg_6_1 ~= 0 and arg_6_1 > manager.time:GetServerTime()) then
		if var_6_4.special_scene_id == var_6_0 then
			HomeSceneSettingAction.SetHomeScene(var_6_0)

			return true
		end

		if var_6_4.special_scene_id_2 == var_6_0 then
			HomeSceneSettingAction.SetHomeScene(var_6_0)

			return true
		end
	end

	return false
end

function var_0_0.CheckPosterSceneCanUse(arg_7_0)
	if not arg_7_0 or arg_7_0 == 0 then
		return false
	end

	return HomeSceneSettingData:GetUsedState(arg_7_0) == SceneConst.HOME_SCENE_TYPE.TRIAL or HomeSceneSettingData:GetUsedState(arg_7_0) == SceneConst.HOME_SCENE_TYPE.UNLOCK
end

function var_0_0.CheckMatchSkin(arg_8_0)
	local var_8_0 = PlayerData:GetPlayerInfo()
	local var_8_1 = SkinCfg[var_8_0.poster_girl].hero

	if arg_8_0 ~= var_8_1 then
		return
	end

	local var_8_2 = HeroTools.HeroUsingSkinInfo(var_8_1).id
	local var_8_3 = SkinSceneActionCfg[var_8_2]
	local var_8_4 = HomeSceneSettingData:GetRealScene()
	local var_8_5 = HomeSceneSettingCfg[var_8_4]

	if var_8_3 then
		if var_0_0.CheckPosterSceneCanUse(var_8_3.special_scene_id) then
			HomeSceneSettingAction.SetHomeScene(var_8_3.special_scene_id)

			if PosterGirlTools.SceneHasTimeEffect(var_8_3.special_scene_id) then
				HomeSceneSettingData:SetIsTimeScene(false)
			end

			return true
		end

		if var_0_0.CheckPosterSceneCanUse(var_8_3.special_scene_id_2) then
			HomeSceneSettingAction.SetHomeScene(var_8_3.special_scene_id_2)

			if PosterGirlTools.SceneHasTimeEffect(var_8_3.special_scene_id_2) then
				HomeSceneSettingData:SetIsTimeScene(false)
			end

			return true
		end
	end

	if var_8_5.limit_display == 0 then
		local var_8_6 = HomeSceneSettingData:GetDefaultScene()

		HomeSceneSettingAction.SetHomeScene(var_8_6, true)

		return true
	end

	return false
end

function var_0_0.CheckMatchPosterGirl(arg_9_0)
	local var_9_0 = HeroTools.HeroUsingSkinInfo(arg_9_0).id
	local var_9_1 = SkinSceneActionCfg[var_9_0]
	local var_9_2 = HomeSceneSettingData:GetRealScene()
	local var_9_3 = HomeSceneSettingCfg[var_9_2]

	if var_9_1 then
		if var_0_0.CheckPosterSceneCanUse(var_9_1.special_scene_id) then
			HomeSceneSettingAction.SetHomeScene(var_9_1.special_scene_id)

			if PosterGirlTools.SceneHasTimeEffect(var_9_1.special_scene_id) then
				HomeSceneSettingData:SetIsTimeScene(false)
			end

			return true
		end

		if var_0_0.CheckPosterSceneCanUse(var_9_1.special_scene_id_2) then
			HomeSceneSettingAction.SetHomeScene(var_9_1.special_scene_id_2)

			if PosterGirlTools.SceneHasTimeEffect(var_9_1.special_scene_id_2) then
				HomeSceneSettingData:SetIsTimeScene(false)
			end

			return true
		end
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
	local var_10_1 = HomeSceneSettingData:GetCurScene()

	if var_10_0 and var_0_0.CheckPosterSceneCanUse(var_10_0.special_scene_id) then
		if var_10_1 ~= var_10_0.special_scene_id then
			HomeSceneSettingAction.SetHomeScene(var_10_0.special_scene_id)
			HomeSceneSettingData:SetIsUseDlcScene(true)
		else
			local var_10_2 = HomeSceneSettingData:GetDefaultScene()

			HomeSceneSettingAction.SetHomeScene(var_10_2)
			HomeSceneSettingData:SetIsUseDlcScene(false)
		end
	end
end

function var_0_0.SetIsRandomScene(arg_11_0, arg_11_1)
	local var_11_0 = PlayerTools.MakeRandomModeData(arg_11_0, HomeSceneSettingData:GetRandomMode())

	manager.net:SendWithLoadingNew(32124, {
		type = 2,
		model = var_11_0
	}, 32125, function(arg_12_0)
		if isSuccess(arg_12_0.result) then
			HomeSceneSettingData:SetIsRandomScene(arg_11_0)
			arg_11_1()
		else
			ShowTips(arg_12_0.result)
		end
	end)
end

function var_0_0.SetRandomMode(arg_13_0, arg_13_1)
	local var_13_0 = PlayerTools.MakeRandomModeData(HomeSceneSettingData:IsRandomScene(), arg_13_0)

	manager.net:SendWithLoadingNew(32124, {
		type = 2,
		model = var_13_0
	}, 32125, function(arg_14_0)
		if isSuccess(arg_14_0.result) then
			HomeSceneSettingData:SetRandomMode(arg_13_0)
			arg_13_1()
			manager.notify:Invoke(CUSTOM_CENTER_SWITCH_RANDOM_MODE)
		else
			ShowTips(arg_14_0.result)
		end
	end)
end

function var_0_0.SetRandomSceneList(arg_15_0, arg_15_1)
	manager.net:SendWithLoadingNew(32130, {
		type = 2,
		random_list = arg_15_0
	}, 32131, function(arg_16_0)
		if isSuccess(arg_16_0.result) then
			HomeSceneSettingData:SetRandomSceneList(arg_15_0)
			arg_15_1()
		else
			ShowTips(arg_16_0.result)
		end
	end)
end

function var_0_0.ChangeTimeScene(arg_17_0, arg_17_1)
	arg_17_0 = arg_17_0 or HomeSceneSettingData:GetCurScene()

	local var_17_0 = 109502
	local var_17_1 = SkinSceneActionCfg[var_17_0]
	local var_17_2

	if arg_17_1 then
		local var_17_3 = manager.time:STimeDescS(arg_17_1, "!%H")
		local var_17_4 = tonumber(var_17_3)

		if var_17_4 >= 6 and var_17_4 < 18 then
			var_17_2 = var_17_1.special_scene_id
		else
			var_17_2 = var_17_1.special_scene_id_2
		end
	else
		local var_17_5 = var_17_1.special_scene_id_2

		if var_17_5 ~= arg_17_0 then
			if HomeSceneSettingCfg[var_17_5].limit_display == 0 then
				Debug.LogError(string.format("场景(%d)的limit_display配置为0, 需为1", var_17_5))
			end

			var_17_2 = var_17_5
		else
			var_17_2 = var_17_1.special_scene_id
		end
	end

	return var_17_2
end

return var_0_0
