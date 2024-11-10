local var_0_0 = singletonClass("LoadSceneMgr")

function var_0_0.Ctor(arg_1_0)
	arg_1_0.loadScenePool_ = {}
	arg_1_0.isLoading_ = false
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

	if arg_7_1 == "sectionSelectHero" then
		return
	end

	local var_7_0

	if SceneManager.GetSceneByName(arg_7_2).rootCount > 0 then
		var_7_0 = SceneManager.GetSceneByName(arg_7_2):GetRootGameObjects()
	end

	if var_7_0 ~= nil then
		for iter_7_0 = 0, var_7_0.Length - 1 do
			if var_7_0[iter_7_0].name == arg_7_2 then
				SetActive(var_7_0[iter_7_0], true)
			end
		end
	end
end

function var_0_0.GetShouldLoadSceneName(arg_8_0, arg_8_1)
	local var_8_0 = ""
	local var_8_1 = ""

	if arg_8_1 == "home" or arg_8_1 == "chat" or arg_8_1 == "userinfo" or arg_8_1 == "clubBoss" then
		var_8_1 = arg_8_0:GetHomeShouldLoadSceneName()
		var_8_0 = "Levels/" .. var_8_1
	elseif arg_8_1 == "homePreview" then
		var_8_1 = arg_8_0:GetPreviewHomeShouldLoadSceneName()
		var_8_0 = "Levels/" .. var_8_1
	else
		if arg_8_1 ~= "sectionSelectHero" then
			-- block empty
		end

		var_8_1 = "X104"
		var_8_0 = "Levels/X104"
	end

	if false then
		error("未实现界面场景获取途径")
	end

	arg_8_0:DealCommonScene(arg_8_1)

	return var_8_0, var_8_1
end

function var_0_0.GetShouldLoadSceneNameID(arg_9_0, arg_9_1)
	if arg_9_1 == "home" or arg_9_1 == "chat" or arg_9_1 == "userinfo" or arg_9_1 == "clubBoss" then
		return (HomeSceneSettingData:GetCurScene())
	elseif arg_9_1 == "homePreview" then
		return (HomeSceneSettingData:GetPreviewScene())
	else
		if arg_9_1 ~= "sectionSelectHero" then
			-- block empty
		end

		return -1
	end

	if false then
		error("未实现界面场景获取途径")
	end
end

function var_0_0.DealCommonScene(arg_10_0, arg_10_1)
	local var_10_0 = {
		"home",
		"homePreview",
		"userinfo",
		"chat",
		"clubBoss",
		"sectionSelectHero",
		"mythicSectionSelectHero"
	}

	if not table.indexof(var_10_0, arg_10_1) then
		return
	end

	for iter_10_0, iter_10_1 in ipairs(var_10_0) do
		if iter_10_1 ~= arg_10_1 and arg_10_0.loadScenePool_[iter_10_1] then
			arg_10_0.loadScenePool_[arg_10_1] = arg_10_0.loadScenePool_[iter_10_1]
			arg_10_0.loadScenePool_[iter_10_1] = nil
		end
	end
end

function var_0_0.IsNeedLoadScene(arg_11_0, arg_11_1, arg_11_2)
	local var_11_0 = {
		"home",
		"homePreview",
		"userinfo",
		"chat",
		"clubBoss",
		"sectionSelectHero",
		"mythicSectionSelectHero"
	}

	if not table.indexof(var_11_0, arg_11_1) then
		return arg_11_0.loadScenePool_[arg_11_1] ~= arg_11_2
	end

	for iter_11_0, iter_11_1 in ipairs(var_11_0) do
		if arg_11_0.loadScenePool_[iter_11_1] and arg_11_0.loadScenePool_[iter_11_1] ~= arg_11_2 then
			return true
		end
	end

	return false
end

function var_0_0.CanEnd(arg_12_0)
	return not arg_12_0.isLoading_
end

function var_0_0.GetHomeShouldLoadSceneName(arg_13_0, arg_13_1)
	local var_13_0 = arg_13_1 or HomeSceneSettingData:GetCurScene()
	local var_13_1 = HomeSceneSettingCfg[var_13_0]

	if not arg_13_1 and HomeSceneSettingData:GetUsedState(var_13_0) == SceneConst.HOME_SCENE_TYPE.LOCK then
		local var_13_2 = GameSetting.home_sence_default.value[1]

		var_13_1 = HomeSceneSettingCfg[var_13_2]

		HomeSceneSettingAction.SetHomeScene(var_13_2)
	end

	local var_13_3 = manager.time:GetServerTime()
	local var_13_4 = ""
	local var_13_5 = ""
	local var_13_6 = ""

	for iter_13_0, iter_13_1 in ipairs(var_13_1.impact) do
		if iter_13_1 == SceneConst.HOME_SCENE_IMPACT.WEATHER then
			var_13_4 = arg_13_0:GetWeatherScene()
		elseif iter_13_1 == SceneConst.HOME_SCENE_IMPACT.DATA then
			var_13_5 = arg_13_0:GetDataScene()
		elseif iter_13_1 == SceneConst.HOME_SCENE_IMPACT.TIME then
			local var_13_7 = manager.time:STimeDescS(var_13_3, "!%H")

			var_13_6 = arg_13_0:GetTimeScene(var_13_7)
		end
	end

	return var_13_1.prefix .. var_13_4 .. var_13_5 .. var_13_6
end

function var_0_0.GetWeatherScene(arg_14_0)
	return ""
end

function var_0_0.GetDataScene(arg_15_0)
	return ""
end

function var_0_0.GetTimeScene(arg_16_0, arg_16_1)
	local var_16_0 = tonumber(arg_16_1)
	local var_16_1 = HomeSceneCfg.get_id_list_by_type[SceneConst.HOME_SCENE_IMPACT.TIME]

	for iter_16_0, iter_16_1 in ipairs(var_16_1) do
		local var_16_2 = HomeSceneCfg[iter_16_1]
		local var_16_3 = var_16_2.start_time
		local var_16_4 = var_16_2.end_time

		if var_16_3 <= var_16_0 and var_16_0 <= var_16_4 then
			return var_16_2.scene
		end
	end

	return ""
end

function var_0_0.GetPreviewHomeShouldLoadSceneName(arg_17_0)
	local var_17_0, var_17_1 = HomeSceneSettingData:GetPreviewScene()
	local var_17_2 = HomeSceneSettingCfg[var_17_0]
	local var_17_3 = var_17_2.impact
	local var_17_4 = ""
	local var_17_5 = ""
	local var_17_6 = ""

	for iter_17_0, iter_17_1 in ipairs(var_17_2.impact) do
		if iter_17_1 == SceneConst.HOME_SCENE_IMPACT.WEATHER then
			var_17_4 = var_17_1.weather
		elseif iter_17_1 == SceneConst.HOME_SCENE_IMPACT.DATA then
			var_17_5 = var_17_1.data
		elseif iter_17_1 == SceneConst.HOME_SCENE_IMPACT.TIME then
			var_17_6 = var_17_1.time
		end
	end

	return var_17_2.prefix .. var_17_4 .. var_17_5 .. var_17_6
end

function var_0_0.SetHomeSceneSoundEffect(arg_18_0)
	local var_18_0 = HomeSceneSettingData:GetCurScene()
	local var_18_1 = HomeSceneSettingCfg[var_18_0].scene_setting

	if not table.indexof(var_18_1, HomeSceneSettingConst.SETTING.SOUND_EFFECT) then
		return
	end

	if not (SettingData:GetHomeSceneSettingData().home_scene_sound_effect == 1) then
		manager.audio:PlayEffect("ui_scene", "ui_scene_x201_stop", "")
	end
end

function var_0_0.SetPreviewHomeSceneSoundEffect(arg_19_0)
	local var_19_0, var_19_1 = HomeSceneSettingData:GetPreviewScene()
	local var_19_2 = HomeSceneSettingCfg[var_19_0].scene_setting

	if not table.indexof(var_19_2, HomeSceneSettingConst.SETTING.SOUND_EFFECT) then
		return
	end

	if not (SettingData:GetHomeSceneSettingData().home_scene_sound_effect == 1) then
		manager.audio:PlayEffect("ui_scene", "ui_scene_x201_stop", "")
	end
end

function var_0_0.TryStopSceneSoundEffect(arg_20_0, arg_20_1)
	local var_20_0 = arg_20_0:GetShouldLoadSceneNameID(arg_20_1)
	local var_20_1 = HomeSceneSettingCfg[var_20_0]

	if var_20_1 then
		local var_20_2 = var_20_1.scene_setting

		if not table.indexof(var_20_2, HomeSceneSettingConst.SETTING.SOUND_EFFECT) then
			arg_20_0:StopSceneSoundEffect()
		end
	else
		arg_20_0:StopSceneSoundEffect()
	end
end

function var_0_0.StopSceneSoundEffect(arg_21_0)
	manager.audio:PlayEffect("ui_scene", "ui_scene_x201_stop", "")
end

function var_0_0.Dispose(arg_22_0)
	arg_22_0.loadScenePool_ = {}
end

return var_0_0
