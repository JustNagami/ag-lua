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

	if HomeSceneSettingCfg[arg_5_1].limit_display == 1 then
		arg_5_0:SetDefaultScene(arg_5_1)
	end
end

function var_0_0.SetDefaultScene(arg_6_0, arg_6_1)
	saveData("scene", "default_scene", arg_6_1)
end

function var_0_0.GetDefaultScene(arg_7_0)
	if arg_7_0:IsRandomScene() then
		return arg_7_0:GetRandomScene()
	end

	local var_7_0 = GameSetting.home_sence_default.value
	local var_7_1 = getData("scene", "default_scene") or var_7_0[#var_7_0]
	local var_7_2 = HomeSceneSettingData:GetUsedState(var_7_1)

	if var_7_2 ~= SceneConst.HOME_SCENE_TYPE.TRIAL and var_7_2 ~= SceneConst.HOME_SCENE_TYPE.UNLOCK then
		var_7_1 = var_7_0[#var_7_0]
	end

	return var_7_1
end

function var_0_0.GetCurScene(arg_8_0)
	if PlayerData:IsRandomHero() then
		local var_8_0 = PlayerData:GetPosterGirlHeroId()
		local var_8_1 = HeroTools.HeroUsingSkinInfo(var_8_0).id
		local var_8_2 = SkinSceneActionCfg[var_8_1]

		if not var_0_10 and PlayerData:IsRandomHeroUseDlcScene() and var_8_2 and HomeSceneSettingData:GetUsedState(var_8_2.special_scene_id) ~= SceneConst.HOME_SCENE_TYPE.LOCK then
			local var_8_3 = var_8_2.special_scene_id

			if HomeSceneSettingCfg[var_8_3].limit_display == 0 then
				return var_8_3
			end
		elseif var_0_10 and not PlayerData:IsRandomHeroUseDlcScene() then
			return arg_8_0:GetDefaultScene()
		end
	end

	local var_8_4 = HomeSceneSettingCfg[var_0_5]

	if var_8_4 and var_8_4.limit_display == 0 then
		local var_8_5 = PlayerData:GetPosterGirlHeroId()
		local var_8_6 = HeroTools.HeroUsingSkinInfo(var_8_5).id

		for iter_8_0, iter_8_1 in ipairs(SkinSceneActionCfg.all) do
			local var_8_7 = SkinSceneActionCfg[iter_8_1]

			if var_0_5 == var_8_7.special_scene_id and var_8_6 ~= var_8_7.skin_id then
				return arg_8_0:GetDefaultScene()
			end
		end

		return var_0_5
	end

	if arg_8_0:IsRandomScene() then
		return arg_8_0:GetRandomScene()
	end

	return var_0_5
end

function var_0_0.GetRealScene(arg_9_0)
	if arg_9_0:IsRandomScene() then
		return arg_9_0:GetRandomScene()
	end

	return var_0_5
end

function var_0_0.IsHaveScene(arg_10_0, arg_10_1)
	local var_10_0 = ItemCfg[arg_10_1].param[1]
	local var_10_1 = arg_10_0:GetUsedState(arg_10_1)

	if arg_10_1 == var_10_0 then
		return var_10_1 == SceneConst.HOME_SCENE_TYPE.UNLOCK
	else
		return var_10_1 == SceneConst.HOME_SCENE_TYPE.TRIAL
	end
end

function var_0_0.IsUnlockScene(arg_11_0, arg_11_1)
	if var_0_2[arg_11_1] then
		return var_0_2[arg_11_1].unlock == 1 and var_0_2[arg_11_1].timestamp == 0
	end

	return false
end

function var_0_0.CanUseScene(arg_12_0, arg_12_1)
	local var_12_0 = arg_12_0:GetUsedState(arg_12_1)

	return var_12_0 == SceneConst.HOME_SCENE_TYPE.TRIAL or var_12_0 == SceneConst.HOME_SCENE_TYPE.UNLOCK
end

function var_0_0.GetUsedState(arg_13_0, arg_13_1)
	local var_13_0 = ItemCfg[arg_13_1].param[1]

	if arg_13_0:IsUnlockScene(var_13_0) then
		return SceneConst.HOME_SCENE_TYPE.UNLOCK
	end

	if var_0_2[var_13_0] and (HomeSceneSettingCfg[var_13_0].scene_trial == 1 or var_0_2[var_13_0].timestamp ~= 0) and var_0_2[var_13_0].unlock == 1 then
		local var_13_1 = HomeSceneSettingCfg[var_13_0]
		local var_13_2 = var_13_1.trial_condition
		local var_13_3 = not table.isEmpty(var_13_1.obtain_way) and not JumpTools.NeedHide(var_13_1.obtain_way, arg_13_0.curSceneID_) or var_0_2[var_13_0].timestamp > 0
		local var_13_4 = true

		if manager.time:GetServerTime() > var_0_2[var_13_0].timestamp then
			var_13_4 = false
		end

		if var_13_3 and var_13_4 then
			return SceneConst.HOME_SCENE_TYPE.TRIAL
		end
	end

	return SceneConst.HOME_SCENE_TYPE.LOCK
end

function var_0_0.UnlockScene(arg_14_0, arg_14_1, arg_14_2)
	local var_14_0 = ItemCfg[arg_14_1].param[1]

	if var_0_2[var_14_0] then
		if var_0_2[var_14_0].unlock == 0 and var_0_2[var_14_0].timestamp == 0 then
			arg_14_0:RefreshRed(var_14_0)
		end

		var_0_2[var_14_0].unlock = 1
		var_0_2[var_14_0].timestamp = arg_14_2
	end
end

function var_0_0.RefreshRed(arg_15_0, arg_15_1)
	saveData("scene", tostring(arg_15_1), 1)
	manager.redPoint:setTip(RedPointConst.SCENE .. "_" .. arg_15_1, 1)
end

function var_0_0.SetPreviewScene(arg_16_0, arg_16_1)
	var_0_4 = arg_16_1

	local var_16_0 = {
		data = "",
		weather = "",
		time = SceneConst.HOME_SCENE_TIME.DAY
	}
	local var_16_1 = HomeSceneSettingCfg[arg_16_1].impact

	for iter_16_0 = 1, 3 do
		if not table.indexof(var_16_1, iter_16_0) then
			if iter_16_0 == 1 then
				var_16_0.weather = nil
			elseif iter_16_0 == 2 then
				var_16_0.data = nil
			elseif iter_16_0 == 3 then
				var_16_0.time = nil
			end
		end
	end

	return var_16_0
end

function var_0_0.SetPreviewSceneParams(arg_17_0, arg_17_1)
	preParams = deepClone(arg_17_1)
end

function var_0_0.GetPreviewScene(arg_18_0)
	return var_0_4, deepClone(preParams)
end

function var_0_0.GetIsPlay(arg_19_0, arg_19_1)
	return var_0_6[arg_19_1] == 1
end

function var_0_0.SetIsPlay(arg_20_0, arg_20_1, arg_20_2)
	arg_20_2 = arg_20_2 and arg_20_2 or 1
	var_0_6[arg_20_1] = 1
end

function var_0_0.GetSceneTimeStamp(arg_21_0, arg_21_1)
	if var_0_2[arg_21_1] then
		return var_0_2[arg_21_1].timestamp
	else
		return nil
	end
end

function var_0_0.IsNeedSceenCheck(arg_22_0)
	local var_22_0 = arg_22_0:GetCurScene()
	local var_22_1 = GameSetting.home_sence_default.value
	local var_22_2 = var_22_1[#var_22_1]

	if not getData("scenePop", "sceneID_" .. var_22_2) and table.indexof(var_22_1, var_22_0) then
		local var_22_3 = var_22_1[#var_22_1 - 1] or var_22_1[1]

		return true, var_22_2, var_22_3
	end

	saveData("scenePop", "sceneID_" .. var_22_2, true)

	return false, nil, nil
end

function var_0_0.GetRandomSceneList(arg_23_0)
	local var_23_0 = false

	for iter_23_0, iter_23_1 in ipairs(var_0_8) do
		if not arg_23_0:CanUseScene(iter_23_1) then
			var_23_0 = true

			break
		end
	end

	if var_23_0 then
		local var_23_1 = {}

		for iter_23_2, iter_23_3 in ipairs(var_0_8) do
			if arg_23_0:CanUseScene(iter_23_3) then
				table.insert(var_23_1, iter_23_3)
			end
		end

		var_0_8 = var_23_1
	end

	return var_0_8
end

function var_0_0.SetRandomSceneList(arg_24_0, arg_24_1)
	var_0_8 = clone(arg_24_1)
end

function var_0_0.GetRandomModeRaw(arg_25_0)
	return var_0_7
end

function var_0_0.GetRandomMode(arg_26_0)
	return PlayerTools.RandomModeDataGetMode(var_0_7)
end

function var_0_0.SetRandomMode(arg_27_0, arg_27_1)
	var_0_7 = PlayerTools.MakeRandomModeData(arg_27_0:IsRandomScene(), arg_27_1)
end

function var_0_0.IsRandomScene(arg_28_0)
	return PlayerTools.RandomModeDataIsEnable(var_0_7)
end

function var_0_0.SetIsRandomScene(arg_29_0, arg_29_1)
	var_0_7 = PlayerTools.MakeRandomModeData(arg_29_1, arg_29_0:GetRandomMode())
end

function var_0_0.GetRandomScene(arg_30_0)
	if var_0_9 == 0 then
		arg_30_0:CalcNextScene()
	end

	if var_0_11 then
		return var_0_5
	end

	return var_0_9
end

function var_0_0.SetRandomScene(arg_31_0, arg_31_1)
	var_0_9 = arg_31_1
end

function var_0_0.CalcNextScene(arg_32_0)
	local var_32_0 = arg_32_0:GetRandomSceneList()
	local var_32_1 = #var_32_0

	if var_32_1 == 0 then
		local var_32_2 = GameSetting.home_sence_default.value

		var_0_9 = getData("scene", "default_scene") or var_32_2[#var_32_2]

		return var_0_9
	end

	local var_32_3 = math.random(var_32_1)
	local var_32_4 = var_32_0[var_32_3]

	if var_32_4 == var_0_9 then
		if var_32_1 >= var_32_3 + 1 then
			var_32_4 = var_32_0[var_32_3 + 1]
		elseif var_32_3 - 1 >= 1 then
			var_32_4 = var_32_0[var_32_3 - 1]
		end
	end

	var_0_9 = var_32_4
end

function var_0_0.SetIsUseDlcScene(arg_33_0, arg_33_1)
	var_0_10 = not arg_33_1
end

function var_0_0.SetIsSwitchTime(arg_34_0, arg_34_1)
	var_0_11 = arg_34_1
end

function var_0_0.SetIsTimeScene(arg_35_0, arg_35_1)
	var_0_12 = arg_35_1
end

function var_0_0.IsTimeScene(arg_36_0)
	return var_0_12
end

return var_0_0
