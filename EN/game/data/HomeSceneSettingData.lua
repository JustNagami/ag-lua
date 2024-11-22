local var_0_0 = singletonClass("HomeSceneSettingData")
local var_0_1 = {}
local var_0_2 = {}
local var_0_3 = {}
local var_0_4 = 0
local var_0_5 = 0
local var_0_6 = {}

function var_0_0.Init(arg_1_0)
	var_0_1 = {}
	var_0_2 = {}
	var_0_4 = 0
	var_0_5 = GameSetting.home_sence_default.value[1]
	var_0_6 = {}
end

function var_0_0.InitData(arg_2_0, arg_2_1, arg_2_2)
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
	local var_7_0 = GameSetting.home_sence_default.value

	return getData("scene", "default_scene") or var_7_0[#var_7_0]
end

function var_0_0.GetCurScene(arg_8_0)
	local var_8_0 = HomeSceneSettingCfg[var_0_5]

	if var_8_0 and var_8_0.limit_display == 0 then
		local var_8_1 = PlayerData:GetPlayerInfo()
		local var_8_2 = HeroTools.HeroUsingSkinInfo(var_8_1.poster_girl).id

		for iter_8_0, iter_8_1 in ipairs(SkinSceneActionCfg.all) do
			local var_8_3 = SkinSceneActionCfg[iter_8_1]

			if var_0_5 == var_8_3.special_scene_id and var_8_2 ~= var_8_3.skin_id then
				return arg_8_0:GetDefaultScene()
			end
		end
	end

	return var_0_5
end

function var_0_0.GetRealScene(arg_9_0)
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

function var_0_0.GetUsedState(arg_12_0, arg_12_1)
	local var_12_0 = ItemCfg[arg_12_1].param[1]

	if arg_12_0:IsUnlockScene(var_12_0) then
		return SceneConst.HOME_SCENE_TYPE.UNLOCK
	end

	if var_0_2[var_12_0] and (HomeSceneSettingCfg[var_12_0].scene_trial == 1 or var_0_2[var_12_0].timestamp ~= 0) and var_0_2[var_12_0].unlock == 1 then
		local var_12_1 = HomeSceneSettingCfg[var_12_0]
		local var_12_2 = var_12_1.trial_condition
		local var_12_3 = not table.isEmpty(var_12_1.obtain_way) and not JumpTools.NeedHide(var_12_1.obtain_way, arg_12_0.curSceneID_) or var_0_2[var_12_0].timestamp > 0
		local var_12_4 = true

		if manager.time:GetServerTime() > var_0_2[var_12_0].timestamp then
			var_12_4 = false
		end

		if var_12_3 and var_12_4 then
			return SceneConst.HOME_SCENE_TYPE.TRIAL
		end
	end

	return SceneConst.HOME_SCENE_TYPE.LOCK
end

function var_0_0.UnlockScene(arg_13_0, arg_13_1, arg_13_2)
	local var_13_0 = ItemCfg[arg_13_1].param[1]

	if var_0_2[var_13_0] then
		if var_0_2[var_13_0].unlock == 0 and var_0_2[var_13_0].timestamp == 0 then
			arg_13_0:RefreshRed(var_13_0)
		end

		var_0_2[var_13_0].unlock = 1
		var_0_2[var_13_0].timestamp = arg_13_2
	end
end

function var_0_0.RefreshRed(arg_14_0, arg_14_1)
	saveData("scene", tostring(arg_14_1), 1)
	manager.redPoint:setTip(RedPointConst.SCENE .. "_" .. arg_14_1, 1)
end

function var_0_0.SetPreviewScene(arg_15_0, arg_15_1)
	var_0_4 = arg_15_1

	local var_15_0 = {
		data = "",
		weather = "",
		time = SceneConst.HOME_SCENE_TIME.DAY
	}
	local var_15_1 = HomeSceneSettingCfg[arg_15_1].impact

	for iter_15_0 = 1, 3 do
		if not table.indexof(var_15_1, iter_15_0) then
			if iter_15_0 == 1 then
				var_15_0.weather = nil
			elseif iter_15_0 == 2 then
				var_15_0.data = nil
			elseif iter_15_0 == 3 then
				var_15_0.time = nil
			end
		end
	end

	return var_15_0
end

function var_0_0.SetPreviewSceneParams(arg_16_0, arg_16_1)
	preParams = deepClone(arg_16_1)
end

function var_0_0.GetPreviewScene(arg_17_0)
	return var_0_4, deepClone(preParams)
end

function var_0_0.GetIsPlay(arg_18_0, arg_18_1)
	return var_0_6[arg_18_1] == 1
end

function var_0_0.SetIsPlay(arg_19_0, arg_19_1, arg_19_2)
	arg_19_2 = arg_19_2 and arg_19_2 or 1
	var_0_6[arg_19_1] = 1
end

function var_0_0.GetSceneTimeStamp(arg_20_0, arg_20_1)
	if var_0_2[arg_20_1] then
		return var_0_2[arg_20_1].timestamp
	else
		return nil
	end
end

function var_0_0.IsNeedSceenCheck(arg_21_0)
	local var_21_0 = arg_21_0:GetCurScene()
	local var_21_1 = GameSetting.home_sence_default.value
	local var_21_2 = var_21_1[#var_21_1]

	if not getData("scenePop", "sceneID_" .. var_21_2) and table.indexof(var_21_1, var_21_0) then
		local var_21_3 = var_21_1[#var_21_1 - 1] or var_21_1[1]

		return true, var_21_2, var_21_3
	end

	saveData("scenePop", "sceneID_" .. var_21_2, true)

	return false, nil, nil
end

return var_0_0
