local var_0_0 = singletonClass("HomeSceneSettingData")
local var_0_1 = {}
local var_0_2 = {}
local var_0_3 = {}
local var_0_4 = 0
local var_0_5 = 0
local var_0_6 = {}
local var_0_7 = 0
local var_0_8 = {}
local var_0_9 = 0
local var_0_10 = false
local var_0_11 = false
local var_0_12 = false

function var_0_0.Init(arg_1_0)
	var_0_1 = {}
	var_0_2 = {}
	var_0_4 = 0
	var_0_5 = GameSetting.home_sence_default.value[1]
	var_0_6 = {}
	arg_1_0.cacheSceneList_ = {}
	arg_1_0.clearSceneFlag_ = false
	arg_1_0.cacheSceneID_ = nil
end

function var_0_0.InitData(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	var_0_5 = arg_2_2

	local var_2_0 = ItemCfg.get_id_list_by_sub_type[ItemConst.ITEM_SUB_TYPE.SCENE_NORMAL]

	for iter_2_0, iter_2_1 in ipairs(var_2_0) do
		var_0_2[iter_2_1] = {
			timestamp = 0,
			unlock = 0,
			id = iter_2_1
		}
	end

	for iter_2_2, iter_2_3 in ipairs(arg_2_1) do
		local var_2_1 = iter_2_3.id
		local var_2_2 = iter_2_3.lasted_time

		if var_0_2[var_2_1] then
			var_0_2[var_2_1].unlock = 1
			var_0_2[var_2_1].timestamp = var_2_2
		end
	end

	var_0_7 = arg_2_3.random_model
	var_0_8 = {}

	table.insertto(var_0_8, arg_2_3.random_list)

	arg_2_0.selectSceneList_ = {}
end

function var_0_0.InitOverdueSceneList(arg_3_0, arg_3_1)
	for iter_3_0, iter_3_1 in ipairs(arg_3_1) do
		local var_3_0 = iter_3_1.id
		local var_3_1 = iter_3_1.time_valid

		table.insert(var_0_1, {
			id = var_3_0,
			timeValid = var_3_1
		})
	end
end

function var_0_0.DealOverdueScene(arg_4_0)
	if var_0_1 and #var_0_1 > 0 then
		ShowTips("HOME_SCENE_TIME_INVALID")
		HomeSceneSettingAction.DealOverdueScene()

		var_0_1 = {}
	end
end

function var_0_0.SetCurScene(arg_5_0, arg_5_1)
	var_0_5 = arg_5_1
	arg_5_0.cacheSceneID_ = arg_5_1
end

function var_0_0.SetDefaultScene(arg_6_0, arg_6_1)
	saveData("scene", "default_scene", arg_6_1)
end

function var_0_0.GetDefaultScene(arg_7_0)
	if arg_7_0:IsRandomScene() then
		return arg_7_0:GetRandomScene()
	end

	local var_7_0 = GameSetting.home_sence_default.value
	local var_7_1 = var_7_0[#var_7_0]
	local var_7_2 = HomeSceneSettingData:GetUsedState(var_7_1)

	if var_7_2 ~= SceneConst.HOME_SCENE_TYPE.TRIAL and var_7_2 ~= SceneConst.HOME_SCENE_TYPE.UNLOCK then
		var_7_1 = var_7_0[#var_7_0]
	end

	return var_7_1
end

function var_0_0.GetCurScene(arg_8_0)
	local var_8_0 = PlayerData:GetPosterGirlHeroSkinId()

	return (arg_8_0:GetSceneID(var_8_0))
end

function var_0_0.GetSceneID(arg_9_0, arg_9_1)
	local var_9_0 = arg_9_0:GetCacheSceneID() or var_0_5
	local var_9_1 = SkinSceneActionCfg[arg_9_1]

	if arg_9_0:IsRandomScene() then
		if var_9_1 and HomeSceneSettingData:CanUseScene(var_9_1.special_scene_id) then
			if var_9_0 == var_9_1.special_scene_id or var_9_0 == var_9_1.special_scene_id_2 then
				return var_9_0
			else
				return var_9_1.special_scene_id
			end
		else
			return arg_9_0:GetDefaultScene()
		end
	elseif HomeSceneSettingCfg[var_9_0].limit_display == 0 then
		if var_9_1 and HomeSceneSettingData:CanUseScene(var_9_1.special_scene_id) and (var_9_0 == var_9_1.special_scene_id or var_9_0 == var_9_1.special_scene_id_2) then
			return var_9_0
		elseif var_9_1 and HomeSceneSettingData:CanUseScene(var_9_1.special_scene_id) then
			return var_9_1.special_scene_id
		else
			return arg_9_0:GetDefaultScene()
		end
	elseif HomeSceneSettingData:CanUseScene(var_9_0) then
		return var_9_0
	else
		return arg_9_0:GetDefaultScene()
	end
end

function var_0_0.GetRealScene(arg_10_0)
	if arg_10_0:IsRandomScene() then
		return arg_10_0:GetRandomScene()
	end

	local var_10_0 = HomeSceneSettingCfg[var_0_5]

	if CustomCenterTools.IsRandomHero() and var_10_0.limit_display ~= 1 then
		var_0_5 = GameSetting.home_sence_default.value[2]
	end

	return var_0_5
end

function var_0_0.IsHaveScene(arg_11_0, arg_11_1)
	local var_11_0 = ItemCfg[arg_11_1].param[1]
	local var_11_1 = arg_11_0:GetUsedState(arg_11_1)

	if arg_11_1 == var_11_0 then
		return var_11_1 == SceneConst.HOME_SCENE_TYPE.UNLOCK
	else
		return var_11_1 == SceneConst.HOME_SCENE_TYPE.TRIAL
	end
end

function var_0_0.IsUnlockScene(arg_12_0, arg_12_1)
	if var_0_2[arg_12_1] then
		return var_0_2[arg_12_1].unlock == 1 and var_0_2[arg_12_1].timestamp == 0
	end

	return false
end

function var_0_0.CanUseScene(arg_13_0, arg_13_1)
	local var_13_0 = arg_13_0:GetUsedState(arg_13_1)

	return var_13_0 == SceneConst.HOME_SCENE_TYPE.TRIAL or var_13_0 == SceneConst.HOME_SCENE_TYPE.UNLOCK
end

function var_0_0.GetUsedState(arg_14_0, arg_14_1)
	local var_14_0 = ItemCfg[arg_14_1].param[1]

	if arg_14_0:IsUnlockScene(var_14_0) then
		return SceneConst.HOME_SCENE_TYPE.UNLOCK
	end

	if var_0_2[var_14_0] and (HomeSceneSettingCfg[var_14_0].scene_trial == 1 or var_0_2[var_14_0].timestamp ~= 0) and var_0_2[var_14_0].unlock == 1 then
		local var_14_1 = HomeSceneSettingCfg[var_14_0]
		local var_14_2 = var_14_1.trial_condition
		local var_14_3 = not table.isEmpty(var_14_1.obtain_way) and not JumpTools.NeedHide(var_14_1.obtain_way, arg_14_0.curSceneID_) or var_0_2[var_14_0].timestamp > 0
		local var_14_4 = true

		if manager.time:GetServerTime() > var_0_2[var_14_0].timestamp then
			var_14_4 = false
		end

		if var_14_3 and var_14_4 then
			return SceneConst.HOME_SCENE_TYPE.TRIAL
		end
	end

	return SceneConst.HOME_SCENE_TYPE.LOCK
end

function var_0_0.UnlockScene(arg_15_0, arg_15_1, arg_15_2)
	local var_15_0 = ItemCfg[arg_15_1].param[1]

	if var_0_2[var_15_0] then
		if var_0_2[var_15_0].unlock == 0 and var_0_2[var_15_0].timestamp == 0 then
			arg_15_0:RefreshRed(var_15_0)
		end

		var_0_2[var_15_0].unlock = 1
		var_0_2[var_15_0].timestamp = arg_15_2
	end
end

function var_0_0.RefreshRed(arg_16_0, arg_16_1)
	saveData("scene", tostring(arg_16_1), 1)
	manager.redPoint:setTip(RedPointConst.SCENE .. "_" .. arg_16_1, 1)
end

function var_0_0.SetPreviewScene(arg_17_0, arg_17_1, arg_17_2)
	var_0_4 = arg_17_1

	local var_17_0 = manager.time:GetServerTime()
	local var_17_1 = manager.time:STimeDescS(var_17_0, "!%H")
	local var_17_2 = manager.loadScene:GetTimeScene(var_17_1)
	local var_17_3 = {
		data = "",
		weather = "",
		time = var_17_2,
		skinID = arg_17_2
	}
	local var_17_4 = HomeSceneSettingCfg[arg_17_1].impact

	for iter_17_0 = 1, 3 do
		if not table.indexof(var_17_4, iter_17_0) then
			if iter_17_0 == 1 then
				var_17_3.weather = nil
			elseif iter_17_0 == 2 then
				var_17_3.data = nil
			elseif iter_17_0 == 3 then
				var_17_3.time = nil
			end
		end
	end

	return var_17_3
end

function var_0_0.SetPreviewSceneParams(arg_18_0, arg_18_1)
	preParams = deepClone(arg_18_1)
end

function var_0_0.GetPreviewScene(arg_19_0)
	return var_0_4, deepClone(preParams)
end

function var_0_0.GetIsPlay(arg_20_0, arg_20_1)
	return var_0_6[arg_20_1] == 1
end

function var_0_0.SetIsPlay(arg_21_0, arg_21_1, arg_21_2)
	arg_21_2 = arg_21_2 and arg_21_2 or 1
	var_0_6[arg_21_1] = 1
end

function var_0_0.GetSceneTimeStamp(arg_22_0, arg_22_1)
	if var_0_2[arg_22_1] then
		return var_0_2[arg_22_1].timestamp
	else
		return nil
	end
end

function var_0_0.IsNeedSceenCheck(arg_23_0)
	local var_23_0 = arg_23_0:GetCurScene()
	local var_23_1 = GameSetting.home_sence_default.value
	local var_23_2 = var_23_1[#var_23_1]

	if not getData("scenePop", "sceneID_" .. var_23_2) and table.indexof(var_23_1, var_23_0) then
		local var_23_3 = var_23_1[#var_23_1 - 1] or var_23_1[1]

		return true, var_23_2, var_23_3
	end

	saveData("scenePop", "sceneID_" .. var_23_2, true)

	return false, nil, nil
end

function var_0_0.GetRandomSceneList(arg_24_0)
	local var_24_0 = false

	for iter_24_0, iter_24_1 in ipairs(var_0_8) do
		if not arg_24_0:CanUseScene(iter_24_1) then
			var_24_0 = true

			break
		end
	end

	if var_24_0 then
		local var_24_1 = {}

		for iter_24_2, iter_24_3 in ipairs(var_0_8) do
			if arg_24_0:CanUseScene(iter_24_3) then
				table.insert(var_24_1, iter_24_3)
			end
		end

		var_0_8 = var_24_1
	end

	return var_0_8
end

function var_0_0.SetRandomSceneList(arg_25_0, arg_25_1)
	var_0_8 = clone(arg_25_1)
end

function var_0_0.UpdateRandomSceneList(arg_26_0, arg_26_1)
	local var_26_0 = table.keyof(var_0_8, arg_26_1)

	if var_26_0 then
		table.remove(var_0_8, var_26_0)
	else
		table.insert(var_0_8, arg_26_1)
	end
end

function var_0_0.GetRandomModeRaw(arg_27_0)
	return var_0_7
end

function var_0_0.GetRandomMode(arg_28_0)
	return PlayerTools.RandomModeDataGetMode(var_0_7)
end

function var_0_0.SetRandomMode(arg_29_0, arg_29_1)
	var_0_7 = PlayerTools.MakeRandomModeData(arg_29_0:IsRandomScene(), arg_29_1)
end

function var_0_0.IsRandomScene(arg_30_0)
	return PlayerTools.RandomModeDataIsEnable(var_0_7)
end

function var_0_0.SetIsRandomScene(arg_31_0, arg_31_1)
	var_0_7 = PlayerTools.MakeRandomModeData(arg_31_1, arg_31_0:GetRandomMode())
end

function var_0_0.GetRandomScene(arg_32_0)
	if var_0_9 == 0 or not arg_32_0:CanUseScene(var_0_9) then
		arg_32_0:CalcNextScene()
	end

	if var_0_11 then
		return var_0_5
	end

	return var_0_9
end

function var_0_0.SetRandomScene(arg_33_0, arg_33_1)
	var_0_9 = arg_33_1
end

function var_0_0.IsExistValidScene(arg_34_0)
	local var_34_0 = arg_34_0:GetRandomSceneList()

	for iter_34_0, iter_34_1 in pairs(var_34_0) do
		if arg_34_0:CanUseScene(iter_34_1) then
			return true
		end
	end

	return false
end

function var_0_0.SetForceRandomSceneID(arg_35_0, arg_35_1)
	arg_35_0.forceRandomSceneID_ = arg_35_1
end

function var_0_0.GetForceRandomSceneID(arg_36_0)
	return arg_36_0.forceRandomSceneID_
end

function var_0_0.CalcNextScene(arg_37_0)
	local var_37_0 = arg_37_0:GetRandomSceneList()

	if not arg_37_0:IsExistValidScene() then
		local var_37_1 = GameSetting.home_sence_default.value

		var_0_9 = var_37_1[#var_37_1]
		arg_37_0.forceRandomSceneID_ = nil

		return var_0_9
	end

	if arg_37_0.forceRandomSceneID_ then
		var_0_9 = arg_37_0.forceRandomSceneID_
		arg_37_0.forceRandomSceneID_ = nil

		return
	end

	local var_37_2 = #var_37_0
	local var_37_3 = math.random(var_37_2)
	local var_37_4 = var_37_0[var_37_3]

	if var_37_4 == var_0_9 then
		if var_37_2 >= var_37_3 + 1 then
			var_37_4 = var_37_0[var_37_3 + 1]
		elseif var_37_3 - 1 >= 1 then
			var_37_4 = var_37_0[var_37_3 - 1]
		end
	end

	var_0_9 = var_37_4
end

function var_0_0.SetIsUseDlcScene(arg_38_0, arg_38_1)
	var_0_10 = not arg_38_1
end

function var_0_0.SetIsSwitchTime(arg_39_0, arg_39_1)
	var_0_11 = arg_39_1
end

function var_0_0.SetIsTimeScene(arg_40_0, arg_40_1)
	var_0_12 = arg_40_1
end

function var_0_0.IsTimeScene(arg_41_0)
	return var_0_12
end

function var_0_0.SetCacheRandomSceneList(arg_42_0, arg_42_1)
	arg_42_0.cacheSceneList_ = arg_42_1
end

function var_0_0.GetCacheRandomSceneList(arg_43_0)
	return arg_43_0.cacheSceneList_
end

function var_0_0.UpdateCacheRandomSceneList(arg_44_0, arg_44_1)
	local var_44_0 = table.keyof(arg_44_0.cacheSceneList_, arg_44_1)

	if var_44_0 then
		table.remove(arg_44_0.cacheSceneList_, var_44_0)
	else
		table.insert(arg_44_0.cacheSceneList_, arg_44_1)
	end
end

function var_0_0.SetClearSceneFlag(arg_45_0, arg_45_1)
	arg_45_0.clearSceneFlag_ = arg_45_1
end

function var_0_0.GetClearSceneFlag(arg_46_0)
	return arg_46_0.clearSceneFlag_
end

function var_0_0.SetCacheSceneID(arg_47_0, arg_47_1)
	arg_47_0.cacheSceneID_ = arg_47_1
end

function var_0_0.GetCacheSceneID(arg_48_0)
	return arg_48_0.cacheSceneID_
end

function var_0_0.GetCurSceneID(arg_49_0)
	return var_0_5
end

function var_0_0.AddSelectSceneID(arg_50_0, arg_50_1)
	table.insert(arg_50_0.selectSceneList_, arg_50_1)
end

function var_0_0.GetSelectSceneList(arg_51_0)
	return arg_51_0.selectSceneList_
end

function var_0_0.ClearSelectSceneList(arg_52_0)
	arg_52_0.selectSceneList_ = {}
end

return var_0_0
