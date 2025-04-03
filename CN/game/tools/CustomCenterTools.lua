local var_0_0 = {
	IsRandomHero = function()
		return PlayerData:IsRandomHero()
	end
}

function var_0_0.GetRandomHeroList()
	local var_2_0 = PlayerData:GetRandomHeroList()

	for iter_2_0 = #var_2_0, 1, -1 do
		local var_2_1 = var_2_0[iter_2_0]
		local var_2_2 = SkinCfg[var_2_1].hero

		if not var_0_0.IsValidHeroSkin(var_2_2, var_2_1) then
			local var_2_3 = var_0_0.GetValidHeroSkin(var_2_2)

			if var_0_0.IsValidHeroSkin(var_2_2, var_2_3) and not table.keyof(var_2_0, var_2_3) then
				var_2_0[iter_2_0] = var_2_3
			else
				table.remove(var_2_0, iter_2_0)
			end
		end
	end

	return var_2_0
end

function var_0_0.GetValidHeroSkin(arg_3_0)
	if CustomCenterTools.IsRandomHero() then
		local var_3_0 = HeroTools.HeroUsingSkinInfo(arg_3_0).id

		if var_0_0.IsValidHeroSkin(arg_3_0, var_3_0) then
			return var_3_0
		else
			return arg_3_0
		end
	else
		return arg_3_0
	end
end

function var_0_0.IsValidHeroSkin(arg_4_0, arg_4_1)
	local var_4_0 = HeroData:GetHeroData(arg_4_0)

	if arg_4_0 == arg_4_1 then
		return true
	end

	for iter_4_0, iter_4_1 in ipairs(var_4_0.unlocked_skin) do
		if iter_4_1.skin_id == arg_4_1 then
			if iter_4_1.time == 0 then
				return true
			end

			if manager.time:GetServerTime() < iter_4_1.time then
				return true
			end

			return false
		end
	end

	return false
end

function var_0_0.IsValidScene(arg_5_0)
	local var_5_0 = HomeSceneSettingData:GetSceneTimeStamp(arg_5_0)

	if var_5_0 == 0 then
		return true
	end

	if var_5_0 > manager.time:GetServerTime() then
		return true
	end

	return false
end

function var_0_0.GetRandomHeroCnt()
	return #PlayerData:GetCacheHeroSkinList()
end

function var_0_0.IsContentRandomHeroSkinID(arg_7_0)
	if var_0_0.IsRandomHero() == false then
		return false
	end

	local var_7_0 = PlayerData:GetCacheHeroSkinList()

	return table.keyof(var_7_0, arg_7_0) ~= nil
end

function var_0_0.SetCacheRandomHeroSkinList(arg_8_0)
	PlayerData:SetCacheHeroSkinList(arg_8_0)
end

function var_0_0.UpdateCacheRandomHeroSkinID(arg_9_0)
	PlayerData:UpdateCacheHeroSkinID(arg_9_0)
end

function var_0_0.CanUpdateCacheRandomHeroSkinID(arg_10_0)
	local var_10_0 = PlayerData:GetCacheHeroSkinList()

	if #var_10_0 == 1 and var_10_0[1] == arg_10_0 then
		return false
	end

	return true
end

function var_0_0.GetHeroUseSkinCnt(arg_11_0)
	local var_11_0 = 0

	if CustomCenterTools.IsRandomHero() then
		local var_11_1 = PlayerData:GetCacheHeroSkinList()

		for iter_11_0, iter_11_1 in pairs(var_11_1) do
			if SkinCfg[iter_11_1].hero == arg_11_0 then
				var_11_0 = var_11_0 + 1
			end
		end

		return var_11_0
	else
		local var_11_2 = PlayerData:GetPosterGirlHeroSkinId()

		if SkinCfg[var_11_2].hero == arg_11_0 then
			return 1
		else
			return 0
		end
	end
end

function var_0_0.GetSceneList(arg_12_0, arg_12_1)
	local var_12_0 = {}
	local var_12_1 = {}
	local var_12_2 = SkinSceneActionCfg[arg_12_0]

	if var_12_2 then
		local var_12_3 = var_12_2.special_scene_id

		if table.keyof(var_12_0, var_12_3) or table.keyof(var_12_1, var_12_3) then
			-- block empty
		elseif HomeSceneSettingData:CanUseScene(var_12_3) then
			table.insert(var_12_0, var_12_3)
		else
			table.insert(var_12_1, var_12_3)
		end

		local var_12_4 = var_12_2.special_scene_id_2

		if var_12_4 == 0 or table.keyof(var_12_0, var_12_4) or table.keyof(var_12_1, var_12_4) then
			-- block empty
		elseif HomeSceneSettingData:CanUseScene(var_12_4) then
			table.insert(var_12_0, var_12_4)
		else
			table.insert(var_12_1, var_12_4)
		end
	end

	for iter_12_0, iter_12_1 in ipairs(SkinSceneActionCfg.all) do
		local var_12_5 = SkinSceneActionCfg[iter_12_1]
		local var_12_6 = var_12_5.special_scene_id

		if not table.keyof(HomeSceneSettingCfg.get_id_list_by_limit_display[1], var_12_6) or table.keyof(var_12_0, var_12_6) or table.keyof(var_12_1, var_12_6) then
			-- block empty
		elseif HomeSceneSettingData:CanUseScene(var_12_6) then
			table.insert(var_12_0, var_12_6)
		else
			table.insert(var_12_1, var_12_6)
		end

		local var_12_7 = var_12_5.special_scene_id_2

		if var_12_7 == 0 or not table.keyof(HomeSceneSettingCfg.get_id_list_by_limit_display[1], var_12_7) or table.keyof(var_12_0, var_12_7) or table.keyof(var_12_1, var_12_7) then
			-- block empty
		elseif HomeSceneSettingData:CanUseScene(var_12_7) then
			table.insert(var_12_0, var_12_7)
		else
			table.insert(var_12_1, var_12_7)
		end
	end

	for iter_12_2, iter_12_3 in ipairs(HomeSceneSettingCfg.get_id_list_by_limit_display[1]) do
		if table.keyof(var_12_0, iter_12_3) or table.keyof(var_12_1, iter_12_3) then
			-- block empty
		elseif HomeSceneSettingData:CanUseScene(iter_12_3) then
			table.insert(var_12_0, iter_12_3)
		else
			table.insert(var_12_1, iter_12_3)
		end
	end

	local var_12_8 = SkinSceneActionCfg[arg_12_0]

	table.insertto(var_12_0, var_12_1)

	if var_0_0.IsRandomScene() then
		local var_12_9 = {}
		local var_12_10 = HomeSceneSettingData:GetCacheRandomSceneList()

		for iter_12_4, iter_12_5 in ipairs(var_12_0) do
			if table.keyof(var_12_10, iter_12_5) then
				table.insert(var_12_9, iter_12_5)
			end
		end

		for iter_12_6, iter_12_7 in ipairs(var_12_9) do
			table.removebyvalue(var_12_0, iter_12_7)
		end

		table.insertto(var_12_9, var_12_0)

		var_12_0 = var_12_9
	else
		local var_12_11 = HomeSceneSettingData:GetRealScene()
		local var_12_12 = table.keyof(var_12_0, var_12_11)

		if var_12_12 then
			table.remove(var_12_0, var_12_12)
			table.insert(var_12_0, 1, var_12_11)
		end
	end

	table.removebyvalue(var_12_0, arg_12_1)
	table.insert(var_12_0, 1, arg_12_1)

	return var_12_0
end

function var_0_0.HasDLCScene(arg_13_0)
	local var_13_0 = SkinSceneActionCfg[arg_13_0]

	if var_13_0 == nil then
		return false
	end

	local var_13_1 = var_13_0.special_scene_id

	if HomeSceneSettingCfg[var_13_1].limit_display == 1 then
		return false
	end

	if HomeSceneSettingData:GetUsedState(var_13_1) == SceneConst.HOME_SCENE_TYPE.LOCK then
		return false
	end

	return true
end

function var_0_0.GetDLCScene(arg_14_0)
	local var_14_0 = SkinSceneActionCfg[arg_14_0]

	if var_14_0 then
		local var_14_1 = var_14_0.special_scene_id

		if HomeSceneSettingData:CanUseScene(var_14_1) then
			return var_14_1
		end
	end
end

function var_0_0.IsRandomScene()
	return HomeSceneSettingData:IsRandomScene()
end

function var_0_0.SetCacheRandomSceneList(arg_16_0)
	HomeSceneSettingData:SetCacheRandomSceneList(arg_16_0)
end

function var_0_0.GetRandomSceneCnt()
	return #HomeSceneSettingData:GetCacheRandomSceneList()
end

function var_0_0.IsContentRandomSceneID(arg_18_0)
	if var_0_0.IsRandomScene() == false then
		return false
	end

	local var_18_0 = HomeSceneSettingData:GetCacheRandomSceneList()

	return table.keyof(var_18_0, arg_18_0) ~= nil
end

function var_0_0.CanUpdateCacheRandomSceneID(arg_19_0)
	local var_19_0 = HomeSceneSettingData:GetCacheRandomSceneList()

	if #var_19_0 == 1 and var_19_0[1] == arg_19_0 then
		return false
	end

	return true
end

function var_0_0.UpdateCacheRandomSceneID(arg_20_0)
	HomeSceneSettingData:UpdateCacheRandomSceneList(arg_20_0)
end

function var_0_0.SetUseSelectedScene()
	local var_21_0 = HomeSceneSettingData:GetPreviewScene()

	HomeSceneSettingAction.SetHomeScene(var_21_0, true)
end

function var_0_0.IsDLCScene(arg_22_0)
	if HomeSceneSettingCfg[arg_22_0].limit_display == 1 then
		return false
	end

	return true
end

function var_0_0.IsMatchHeroScene(arg_23_0, arg_23_1)
	if HomeSceneSettingData:CanUseScene(arg_23_1) == false then
		return false
	end

	if not var_0_0.IsDLCScene(arg_23_1) then
		return true
	end

	return table.keyof(SkinSceneActionCfg.get_id_list_by_special_scene_id[arg_23_1], arg_23_0) ~= nil
end

function var_0_0.GetMatchScene(arg_24_0, arg_24_1)
	if HomeSceneSettingData:CanUseScene(arg_24_1) == false and var_0_0.IsContentRandomSceneID(arg_24_1) then
		var_0_0.UpdateCacheRandomSceneID(arg_24_1)
	end

	if var_0_0.IsRandomScene() then
		-- block empty
	else
		HomeSceneSettingData:SetCacheSceneID(arg_24_1)
	end

	local var_24_0 = SkinSceneActionCfg[arg_24_0]

	if var_24_0 then
		local var_24_1 = var_24_0.special_scene_id

		if HomeSceneSettingData:CanUseScene(var_24_1) then
			if not var_0_0.IsRandomScene() then
				HomeSceneSettingData:SetCacheSceneID(var_24_1)
			end

			return var_24_1
		end
	end

	if not CustomCenterTools.IsMatchHeroScene(arg_24_0, arg_24_1) then
		local var_24_2 = HomeSceneSettingData:GetSceneID(arg_24_0)

		if not var_0_0.IsRandomScene() then
			HomeSceneSettingData:SetCacheSceneID(var_24_2)
		end

		return var_24_2
	end

	return arg_24_1
end

function var_0_0.GetLastPreviewHero()
	local var_25_0 = PlayerData:GetSelectSkinList()
	local var_25_1 = var_0_0.GetRandomHeroList()

	for iter_25_0 = #var_25_0, 1, -1 do
		local var_25_2 = var_25_0[iter_25_0]

		if table.keyof(var_25_1, var_25_2) then
			return var_25_2
		end
	end

	return var_25_1[1] or 1084
end

function var_0_0.GetLastPreviewScene()
	local var_26_0 = HomeSceneSettingData:GetSelectSceneList()
	local var_26_1 = HomeSceneSettingData:GetRandomSceneList()

	for iter_26_0 = #var_26_0, 1, -1 do
		local var_26_2 = var_26_0[iter_26_0]

		if table.keyof(var_26_1, var_26_2) then
			return var_26_2
		end
	end

	return var_26_1[1] or GameSetting.home_sence_default.value[2]
end

return var_0_0
