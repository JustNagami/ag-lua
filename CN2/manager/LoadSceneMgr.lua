local var_0_0 = singletonClass("LoadSceneMgr")

function var_0_0.Ctor(arg_1_0)
	arg_1_0.loadScenePool_ = {}
	arg_1_0.isLoading_ = false
	arg_1_0.cacheSceneNameList_ = {}
	arg_1_0.loadInit_ = SceneLoadAndUnloadManager.Instance
end

function var_0_0.GetNeedLoadSceneName(arg_2_0, arg_2_1)
	local var_2_0

	for iter_2_0 = #arg_2_1, 1, -1 do
		if ViewConst.NEED_CHANGE_SCENE_URL_LIST[arg_2_1[iter_2_0]] then
			var_2_0 = arg_2_1[iter_2_0]

			local var_2_1, var_2_2 = arg_2_0:GetShouldLoadSceneName(arg_2_1[iter_2_0])

			if not arg_2_0.loadScenePool_[arg_2_1[iter_2_0]] or arg_2_0:IsNeedLoadScene(arg_2_1[iter_2_0], var_2_2) then
				return arg_2_1[iter_2_0], var_2_0
			end
		end
	end

	return nil, var_2_0
end

function var_0_0.ForceSetShouldLoadSceneName(arg_3_0, arg_3_1, arg_3_2)
	if not ViewConst.NEED_CHANGE_SCENE_URL_LIST[arg_3_1] then
		if arg_3_2 then
			arg_3_2()
		end

		return
	end

	local var_3_0, var_3_1 = arg_3_0:GetShouldLoadSceneName(arg_3_1)

	if var_3_1 == arg_3_0.loadScenePool_[arg_3_1] then
		if arg_3_2 then
			arg_3_2()
		end

		return
	end

	arg_3_0:TryStopSceneSoundEffect(arg_3_1)
	SetForceShowQuanquan(true)

	arg_3_0.isLoading_ = true

	arg_3_0.loadInit_:ChangeScene(var_3_0, arg_3_0.loadScenePool_[arg_3_1], function()
		arg_3_0.isLoading_ = false

		arg_3_0:SetLoadSceneTable(arg_3_1, var_3_1)
		SetForceShowQuanquan(false)

		if arg_3_2 then
			arg_3_2()
		end
	end)
end

function var_0_0.SetShouldLoadSceneName(arg_5_0, arg_5_1)
	if not ViewConst.NEED_CHANGE_SCENE_URL_LIST[arg_5_1] then
		return
	end

	local var_5_0, var_5_1 = arg_5_0:GetShouldLoadSceneName(arg_5_1)

	if var_5_1 == arg_5_0.loadScenePool_[arg_5_1] then
		return
	end

	arg_5_0:TryStopSceneSoundEffect(arg_5_1)

	arg_5_0.isLoading_ = true

	arg_5_0.loadInit_:ChangeScene(var_5_0, arg_5_0.loadScenePool_[arg_5_1], function()
		arg_5_0.isLoading_ = false

		arg_5_0:SetLoadSceneTable(arg_5_1, var_5_1)
	end)
end

function var_0_0.SetLoadSceneTable(arg_7_0, arg_7_1, arg_7_2)
	arg_7_0.loadScenePool_[arg_7_1] = arg_7_2

	if arg_7_1 == "sectionSelectHero" or arg_7_1 == "cooperationSectionSelectHero" then
		return
	end

	local var_7_0

	if SceneManager.GetSceneByName(arg_7_2).rootCount > 0 then
		var_7_0 = SceneManager.GetSceneByName(arg_7_2):GetRootGameObjects()
	end

	if var_7_0 ~= nil then
		local var_7_1 = gameContext:GetFirstRoutePage()

		for iter_7_0 = #arg_7_0.cacheSceneNameList_, 1, -1 do
			local var_7_2 = arg_7_0.cacheSceneNameList_[iter_7_0]

			if arg_7_1 == var_7_2 then
				if var_7_2 ~= var_7_1 then
					arg_7_0:ActiveScene(var_7_0, arg_7_2, false)
				else
					arg_7_0:ActiveScene(var_7_0, arg_7_2, true)
				end

				table.remove(arg_7_0.cacheSceneNameList_, iter_7_0)
			end
		end

		manager.notify:Invoke("ON_ASYNC_SCENE_LOADED", arg_7_2)
	end
end

function var_0_0.ActiveScene(arg_8_0, arg_8_1, arg_8_2, arg_8_3)
	for iter_8_0 = 0, arg_8_1.Length - 1 do
		if arg_8_1[iter_8_0].name == arg_8_2 then
			SetActive(arg_8_1[iter_8_0], arg_8_3)

			if arg_8_3 then
				manager.ui:SetScene(arg_8_1[iter_8_0])
			end
		end
	end
end

function var_0_0.GetShouldLoadSceneName(arg_9_0, arg_9_1)
	local var_9_0 = ""
	local var_9_1 = ""

	if arg_9_1 == "home" or arg_9_1 == "chat" or arg_9_1 == "userinfo" then
		var_9_1 = arg_9_0:GetHomeShouldLoadSceneName()
		var_9_0 = "Levels/" .. var_9_1
	elseif arg_9_1 == "homePreview" then
		var_9_1 = arg_9_0:GetPreviewHomeShouldLoadSceneName()
		var_9_0 = "Levels/" .. var_9_1
	elseif arg_9_1 == "sectionSelectHero" or arg_9_1 == "mythicSectionSelectHero" or arg_9_1 == "challengeRogueTeamSectionSelectHero" or arg_9_1 == "cooperationSectionSelectHero" or arg_9_1 == "summerWaterSectionSelectHero" or arg_9_1 == "sequentialBattleSectionSelectHero" then
		var_9_1 = "X104"
		var_9_0 = "Levels/X104"
	elseif arg_9_1 == "furniturePreview" then
		var_9_1 = "X100_DormPreview"
		var_9_0 = "Levels/X100_DormPreview"
	elseif arg_9_1 == "furniturePreviewWithEntity" then
		var_9_1 = "X100_DormPreviewWithEntity"
		var_9_0 = "Levels/X100_DormPreviewWithEntity"
	else
		error("未实现界面场景获取途径")
	end

	arg_9_0:DealCommonScene(arg_9_1)

	return var_9_0, var_9_1
end

function var_0_0.GetShouldLoadSceneNameID(arg_10_0, arg_10_1)
	if arg_10_1 == "home" or arg_10_1 == "chat" or arg_10_1 == "userinfo" then
		return (HomeSceneSettingData:GetCurScene())
	elseif arg_10_1 == "homePreview" then
		return (HomeSceneSettingData:GetPreviewScene())
	elseif arg_10_1 == "sectionSelectHero" or arg_10_1 == "mythicSectionSelectHero" or arg_10_1 == "challengeRogueTeamSectionSelectHero" or arg_10_1 == "cooperationSectionSelectHero" or arg_10_1 == "summerWaterSectionSelectHero" or arg_10_1 == "sequentialBattleSectionSelectHero" then
		return -1
	elseif arg_10_1 == "furniturePreview" or arg_10_1 == "furniturePreviewWithEntity" then
		return -1
	else
		error("未实现界面场景获取途径")
	end
end

function var_0_0.DealCommonScene(arg_11_0, arg_11_1)
	local var_11_0 = {
		"home",
		"homePreview",
		"userinfo",
		"chat",
		"clubBoss",
		"sectionSelectHero",
		"mythicSectionSelectHero",
		"challengeRogueTeamSectionSelectHero",
		"sequentialBattleSectionSelectHero"
	}

	if not table.indexof(var_11_0, arg_11_1) then
		return
	end

	for iter_11_0, iter_11_1 in ipairs(var_11_0) do
		if iter_11_1 ~= arg_11_1 and arg_11_0.loadScenePool_[iter_11_1] then
			arg_11_0.loadScenePool_[arg_11_1] = arg_11_0.loadScenePool_[iter_11_1]
			arg_11_0.loadScenePool_[iter_11_1] = nil
		end
	end
end

function var_0_0.IsNeedLoadScene(arg_12_0, arg_12_1, arg_12_2)
	local var_12_0 = {
		"home",
		"homePreview",
		"userinfo",
		"chat",
		"clubBoss",
		"sectionSelectHero",
		"mythicSectionSelectHero",
		"challengeRogueTeamSectionSelectHero",
		"sequentialBattleSectionSelectHero"
	}

	if not table.indexof(var_12_0, arg_12_1) then
		return arg_12_0.loadScenePool_[arg_12_1] ~= arg_12_2
	end

	for iter_12_0, iter_12_1 in ipairs(var_12_0) do
		if arg_12_0.loadScenePool_[iter_12_1] and arg_12_0.loadScenePool_[iter_12_1] ~= arg_12_2 then
			return true
		end
	end

	return false
end

function var_0_0.CanEnd(arg_13_0)
	return not arg_13_0.isLoading_
end

local function var_0_1(arg_14_0)
	local var_14_0 = HomeSceneSettingCfg[arg_14_0]
	local var_14_1 = PlayerData:GetPosterGirlHeroId()
	local var_14_2 = HeroTools.HeroUsingSkinInfo(var_14_1).id
	local var_14_3 = SkinSceneActionCfg[var_14_2]

	if var_14_3 and (arg_14_0 == var_14_3.special_scene_id or arg_14_0 == var_14_3.special_scene_id_2) and not string.isNullOrEmpty(var_14_0.prefix_dlc) then
		return var_14_0.prefix_dlc
	end

	return var_14_0.prefix
end

function var_0_0.GetHomeShouldLoadSceneName(arg_15_0, arg_15_1)
	local var_15_0 = arg_15_1 or HomeSceneSettingData:GetCurScene()
	local var_15_1 = HomeSceneSettingCfg[var_15_0]

	if not arg_15_1 and HomeSceneSettingData:GetUsedState(var_15_0) == SceneConst.HOME_SCENE_TYPE.LOCK then
		var_15_0 = GameSetting.home_sence_default.value[1]
		var_15_1 = HomeSceneSettingCfg[var_15_0]

		HomeSceneSettingAction.SetHomeScene(var_15_0)
	end

	local var_15_2 = manager.time:GetServerTime()

	if not arg_15_0.sceneDisableAutoChange_ and HomeSceneSettingData:IsTimeScene() and not HomeSceneSettingData:IsRandomScene() and PosterGirlTools.SceneHasTimeEffect(var_15_0) then
		var_15_0 = HomeSceneSettingAction.ChangeTimeScene(var_15_0, var_15_2)
		var_15_1 = HomeSceneSettingCfg[var_15_0]
	end

	local var_15_3 = ""
	local var_15_4 = ""
	local var_15_5 = ""

	for iter_15_0, iter_15_1 in ipairs(var_15_1.impact) do
		if iter_15_1 == SceneConst.HOME_SCENE_IMPACT.WEATHER then
			var_15_3 = arg_15_0:GetWeatherScene()
		elseif iter_15_1 == SceneConst.HOME_SCENE_IMPACT.DATA then
			var_15_4 = arg_15_0:GetDataScene()
		elseif iter_15_1 == SceneConst.HOME_SCENE_IMPACT.TIME then
			local var_15_6 = manager.time:STimeDescS(var_15_2, "!%H")

			var_15_5 = arg_15_0:GetTimeScene(var_15_6)
		end
	end

	return var_0_1(var_15_0) .. var_15_3 .. var_15_4 .. var_15_5
end

function var_0_0.GetWeatherScene(arg_16_0)
	return ""
end

function var_0_0.GetDataScene(arg_17_0)
	return ""
end

function var_0_0.GetTimeScene(arg_18_0, arg_18_1)
	local var_18_0 = tonumber(arg_18_1)
	local var_18_1 = HomeSceneCfg.get_id_list_by_type[SceneConst.HOME_SCENE_IMPACT.TIME]

	for iter_18_0, iter_18_1 in ipairs(var_18_1) do
		local var_18_2 = HomeSceneCfg[iter_18_1]
		local var_18_3 = var_18_2.start_time
		local var_18_4 = var_18_2.end_time

		if var_18_3 <= var_18_0 and var_18_0 <= var_18_4 then
			return var_18_2.scene
		end
	end

	return ""
end

function var_0_0.GetPreviewHomeShouldLoadSceneName(arg_19_0)
	local var_19_0, var_19_1 = HomeSceneSettingData:GetPreviewScene()
	local var_19_2 = HomeSceneSettingCfg[var_19_0]
	local var_19_3 = var_19_2.impact
	local var_19_4 = ""
	local var_19_5 = ""
	local var_19_6 = ""

	for iter_19_0, iter_19_1 in ipairs(var_19_2.impact) do
		if iter_19_1 == SceneConst.HOME_SCENE_IMPACT.WEATHER then
			var_19_4 = var_19_1.weather
		elseif iter_19_1 == SceneConst.HOME_SCENE_IMPACT.DATA then
			var_19_5 = var_19_1.data
		elseif iter_19_1 == SceneConst.HOME_SCENE_IMPACT.TIME then
			var_19_6 = var_19_1.time
		end
	end

	return var_19_2.prefix .. var_19_4 .. var_19_5 .. var_19_6
end

function var_0_0.SetHomeSceneSoundEffect(arg_20_0)
	local var_20_0 = HomeSceneSettingData:GetCurScene()
	local var_20_1 = HomeSceneSettingCfg[var_20_0].scene_setting

	if not table.indexof(var_20_1, HomeSceneSettingConst.SETTING.SOUND_EFFECT) then
		return
	end

	if not (SettingData:GetHomeSceneSettingData().home_scene_sound_effect == 1) then
		manager.audio:PlayEffect("ui_scene", "ui_scene_x201_stop", "")
		manager.audio:PlayEffect("ui_scene", "ui_scene_ambience_loop_stop", "")
	end
end

function var_0_0.SetPreviewHomeSceneSoundEffect(arg_21_0)
	local var_21_0, var_21_1 = HomeSceneSettingData:GetPreviewScene()
	local var_21_2 = HomeSceneSettingCfg[var_21_0].scene_setting

	if not table.indexof(var_21_2, HomeSceneSettingConst.SETTING.SOUND_EFFECT) then
		return
	end

	if not (SettingData:GetHomeSceneSettingData().home_scene_sound_effect == 1) then
		manager.audio:PlayEffect("ui_scene", "ui_scene_x201_stop", "")
		manager.audio:PlayEffect("ui_scene", "ui_scene_ambience_loop_stop", "")
	end
end

function var_0_0.TryStopSceneSoundEffect(arg_22_0, arg_22_1)
	local var_22_0 = arg_22_0:GetShouldLoadSceneNameID(arg_22_1)
	local var_22_1 = HomeSceneSettingCfg[var_22_0]

	if var_22_1 then
		local var_22_2 = var_22_1.scene_setting

		if not table.indexof(var_22_2, HomeSceneSettingConst.SETTING.SOUND_EFFECT) then
			arg_22_0:StopSceneSoundEffect()
		end
	else
		arg_22_0:StopSceneSoundEffect()
	end
end

function var_0_0.StopSceneSoundEffect(arg_23_0)
	manager.audio:PlayEffect("ui_scene", "ui_scene_x201_stop", "")
	manager.audio:PlayEffect("ui_scene", "ui_scene_ambience_loop_stop", "")
end

function var_0_0.SetSceneWeather(arg_24_0, arg_24_1)
	local var_24_0, var_24_1 = PosterGirlTools.GetLoadWeatherEffect(arg_24_1)

	if var_24_0 then
		manager.ui:SetSceneWeatherEffect(var_24_1)
	end

	arg_24_0.curWeather_ = arg_24_1
end

function var_0_0.GetCurWeather(arg_25_0)
	return arg_25_0.curWeather_ or SceneConst.HOME_SCENE_WEATHER.SUNNY
end

function var_0_0.GetLoadScenePool(arg_26_0)
	return arg_26_0.loadScenePool_
end

function var_0_0.Dispose(arg_27_0)
	for iter_27_0, iter_27_1 in pairs(arg_27_0.loadScenePool_) do
		SceneManager.UnloadSceneAsync(iter_27_1)
	end

	arg_27_0.loadScenePool_ = {}
	arg_27_0.cacheSceneNameList_ = {}
end

function var_0_0.HideLastSceneList(arg_28_0)
	local var_28_0 = arg_28_0.loadScenePool_

	for iter_28_0 = #arg_28_0.cacheSceneNameList_, 1, -1 do
		local var_28_1 = arg_28_0.cacheSceneNameList_[iter_28_0]

		if var_28_0[var_28_1] then
			local var_28_2, var_28_3 = arg_28_0:GetShouldLoadSceneName(var_28_1)
			local var_28_4 = SceneManager.GetSceneByName(var_28_3)

			if var_28_4.rootCount > 0 then
				local var_28_5 = var_28_4:GetRootGameObjects()

				if var_28_5 then
					arg_28_0:ActiveScene(var_28_5, var_28_3, false)
					table.remove(arg_28_0.cacheSceneNameList_, iter_28_0)
				end
			end
		end
	end
end

function var_0_0.AddCachePage(arg_29_0)
	if not arg_29_0:CanEnd() then
		local var_29_0 = gameContext:GetFirstRoutePage()

		table.insert(arg_29_0.cacheSceneNameList_, var_29_0)
	end
end

function var_0_0.SetSceneDisableAutoChange(arg_30_0, arg_30_1)
	arg_30_0.sceneDisableAutoChange_ = arg_30_1
end

return var_0_0
