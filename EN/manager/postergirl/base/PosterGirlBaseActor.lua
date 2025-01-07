local var_0_0 = class("PosterGirlBaseActor")

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.skinId = arg_1_1
	arg_1_0.modelId = arg_1_2
	arg_1_0.tpose = nil
	arg_1_0.ui_topse = nil

	arg_1_0:LoadModel()

	arg_1_0._currentState = nil
	arg_1_0._inTransition = nil
	arg_1_0._states = {}
end

function var_0_0.GetSkinId(arg_2_0)
	return arg_2_0.skinId
end

function var_0_0.GetModelId(arg_3_0)
	return arg_3_0.modelId
end

function var_0_0.GetTag(arg_4_0)
	return PosterGirlConst.PosterGirlTag.null
end

function var_0_0.GetViewDirect(arg_5_0)
	return PosterGirlConst.ViewDirect.center
end

function var_0_0.GetModelPath(arg_6_0)
	return "Char/" .. arg_6_0.modelId
end

function var_0_0.LoadModel(arg_7_0)
	local var_7_0 = arg_7_0:GetModelPath()

	arg_7_0.tpose = manager.resourcePool:Get(var_7_0, ASSET_TYPE.TPOSE)
	arg_7_0.ui_topse = arg_7_0.tpose.transform:Find(string.format("%dui/%dui_tpose", arg_7_0.skinId, arg_7_0.skinId))

	local var_7_1 = SkinCfg[arg_7_0.skinId]

	if arg_7_0.ui_topse then
		local var_7_2 = var_7_1.home_weapon_show and var_7_1.home_weapon_show ~= 0

		HeroTools.SetHeroModelWeaponActivity(arg_7_0.ui_topse, var_7_2)
	end
end

function var_0_0.PlayHeroTalk(arg_8_0, arg_8_1, arg_8_2, arg_8_3)
	local var_8_0

	if arg_8_0.tpose then
		var_8_0 = arg_8_0.tpose.transform
	end

	HeroTools.PlayTalk(arg_8_1, arg_8_2, arg_8_3, var_8_0)

	local var_8_1 = manager.audio:GetVoiceLength(string.format("vo_sys_%d", arg_8_1), string.format("v_s_%d_%s", arg_8_1, arg_8_2), string.format("vo_sys_%d.awb", arg_8_1))
	local var_8_2 = HeroVoiceCfg.get_id_list_by_file[arg_8_2]

	if var_8_2 then
		manager.notify:Invoke(HOME_POSTER_TALK, arg_8_1, var_8_2, var_8_1)
	end
end

function var_0_0.UpdateViewTag(arg_9_0, arg_9_1)
	local var_9_0

	if PosterGirlConst.ViewTag.home == arg_9_1 then
		var_9_0 = "main"
	elseif PosterGirlConst.ViewTag.chat == arg_9_1 then
		var_9_0 = "chat"
	elseif PosterGirlConst.ViewTag.playerInfo == arg_9_1 or PosterGirlConst.ViewTag.playerInfo_other == arg_9_1 then
		var_9_0 = "playerInfo"
	elseif PosterGirlConst.ViewTag.preview == arg_9_1 then
		var_9_0 = "main"
	else
		error("UpdateViewParams")

		return
	end

	local var_9_1 = arg_9_0:GetHeroPosAndRotCfg()
	local var_9_2 = var_9_1["position_" .. var_9_0]
	local var_9_3 = var_9_1["rotation_" .. "main"]
	local var_9_4 = var_9_1["scale_" .. "main"]
	local var_9_5 = var_9_1.offset
	local var_9_6 = Vector3.one

	if arg_9_1 ~= PosterGirlConst.ViewTag.playerInfo_other then
		local var_9_7 = manager.posterGirl:GetCurScene()

		if var_9_7 and var_9_1["position_scene_" .. var_9_7] then
			var_9_2 = var_9_1["position_scene_" .. var_9_7]
		end

		if var_9_7 and var_9_1["rotation_scene_" .. var_9_7] then
			var_9_3 = var_9_1["rotation_scene_" .. var_9_7]
		end
	end

	if var_9_0 == "chat" or var_9_0 == "playerInfo" then
		local var_9_8 = Screen.safeArea
		local var_9_9 = var_9_8.width / var_9_8.height / 1.7777777777777777

		arg_9_0.tpose.transform.localPosition = Vector3.New(var_9_2[1], var_9_2[2], var_9_2[3]) + Vector3(var_9_5 * var_9_9, 0, 0)
		var_9_6 = GameSetting.chat_model_rotation.value
	else
		arg_9_0.tpose.transform.localPosition = Vector3.New(var_9_2[1], var_9_2[2], var_9_2[3])
	end

	if (var_9_0 == "chat" or var_9_0 == "playerInfo") and (arg_9_0:GetViewDirect() == 0 or manager.posterGirl:GetViewTag() == PosterGirlConst.ViewTag.playerInfo) then
		arg_9_0.tpose.transform.localEulerAngles = Vector3.New(var_9_3[1] + var_9_6[1], var_9_3[2] + var_9_6[2], var_9_3[3] + var_9_6[3])
	else
		arg_9_0.tpose.transform.localEulerAngles = Vector3.New(var_9_3[1], var_9_3[2], var_9_3[3])
	end

	arg_9_0.tpose.transform.localScale = Vector3.New(var_9_4[1], var_9_4[2], var_9_4[3])

	arg_9_0:ResetTpose()
end

function var_0_0.GetHeroPosAndRotCfg(arg_10_0)
	local var_10_0 = SkinCfg[arg_10_0.skinId].hero

	return HeroPosAndRotCfg[var_10_0]
end

function var_0_0.ResetTpose(arg_11_0)
	local var_11_0 = arg_11_0.tpose.transform:Find(arg_11_0.skinId .. "ui")

	if var_11_0 then
		var_11_0.localEulerAngles = Vector3.zero
	end

	local var_11_1 = arg_11_0.tpose.transform:Find(string.format("%dui/%dui_tpose", arg_11_0.skinId, arg_11_0.skinId))

	if var_11_1 then
		var_11_1.localEulerAngles = Vector3.zero
	end
end

function var_0_0.ResetBlendShapes(arg_12_0)
	manager.resourcePool:ResetBlendShapes(arg_12_0.tpose.transform)
end

function var_0_0.EnableEyeController(arg_13_0, arg_13_1)
	LuaForUtil.EnableEyeController(arg_13_0.ui_topse.transform, arg_13_1)
end

function var_0_0.GetCurrentState(arg_14_0)
	return arg_14_0._currentState
end

function var_0_0.ChangeState(arg_15_0, arg_15_1, arg_15_2)
	local var_15_0 = arg_15_0:GetState(arg_15_1)

	if arg_15_2 == nil then
		arg_15_2 = false
	end

	if var_15_0 then
		arg_15_0:Transition(var_15_0, arg_15_2)
	end
end

function var_0_0.Transition(arg_16_0, arg_16_1, arg_16_2)
	if arg_16_0._currentState == arg_16_1 or arg_16_0._inTransition then
		return
	end

	arg_16_0._inTransition = true

	if arg_16_0._currentState ~= nil then
		arg_16_0._currentState:Exit(arg_16_2)
	end

	arg_16_0._currentState = arg_16_1

	if arg_16_0._currentState ~= nil then
		arg_16_0._currentState:Enter()
	end

	arg_16_0._inTransition = false
end

function var_0_0.GetState(arg_17_0, arg_17_1)
	return nil
end

function var_0_0.Dispose(arg_18_0)
	if arg_18_0._currentState then
		arg_18_0._currentState:Exit(true)
	end

	arg_18_0._currentState = nil

	if arg_18_0.tpose then
		manager.resourcePool:DestroyOrReturn(arg_18_0.tpose, ASSET_TYPE.TPOSE)
	end

	arg_18_0.tpose = nil
	arg_18_0.ui_topse = nil
end

function var_0_0.InitTouchHelp(arg_19_0, arg_19_1)
	return
end

function var_0_0.TouchHelpIdle(arg_20_0)
	return
end

function var_0_0.TouchHelpSingleDrag(arg_21_0, arg_21_1, arg_21_2)
	return
end

function var_0_0.TouchHelpMutiDrag(arg_22_0, arg_22_1)
	return
end

function var_0_0.CheckInitState(arg_23_0)
	local var_23_0 = arg_23_0:GetCurrentState()

	return var_23_0 and var_23_0:GetStateKey() == PosterGirlConst.StateKay.init or false
end

function var_0_0.CheckDebut(arg_24_0)
	return false
end

function var_0_0.SkipDebut(arg_25_0)
	return false
end

function var_0_0.IsPlayingDebut(arg_26_0)
	local var_26_0 = arg_26_0:GetCurrentState()

	return var_26_0 and var_26_0:GetStateKey() == PosterGirlConst.StateKay.debut or false
end

function var_0_0._GetInteractionCfg(arg_27_0, arg_27_1)
	if arg_27_0.cacheInteractionCfg_ then
		return arg_27_0.cacheInteractionCfg_
	end

	local var_27_0 = arg_27_0:GetSceneID()
	local var_27_1 = HomeSceneSettingCfg[var_27_0]
	local var_27_2 = var_27_1 and var_27_1.action_suffix
	local var_27_3 = arg_27_0:GetTimeParam()

	arg_27_0.cacheInteractionCfg_ = HeroTools:GetUnlockInteractionCfg(arg_27_1, {
		var_27_2,
		var_27_3
	})

	return arg_27_0.cacheInteractionCfg_
end

function var_0_0.GetTimeParam(arg_28_0)
	return nil
end

function var_0_0.GetInteractionCfg(arg_29_0)
	return arg_29_0:_GetInteractionCfg(arg_29_0:GetSkinId())
end

function var_0_0.DoShacking(arg_30_0)
	return
end

function var_0_0.DoTouch(arg_31_0)
	return
end

function var_0_0.DoQuickTouch(arg_32_0)
	return
end

function var_0_0.DoShowing(arg_33_0)
	return
end

function var_0_0.DoGreeting(arg_34_0)
	return
end

function var_0_0.DoIdle(arg_35_0)
	return
end

function var_0_0.DoInit(arg_36_0, arg_36_1)
	return
end

function var_0_0.InitSceneEffect(arg_37_0)
	local var_37_0 = arg_37_0:GetViewDirect()
	local var_37_1, var_37_2 = PosterGirlTools.GetLoadLightEffect(var_37_0, var_37_0)

	if var_37_1 then
		manager.ui:SetSceneLightEffect(var_37_2)
	end

	manager.loadScene:SetSceneWeather(manager.loadScene:GetCurWeather())
end

function var_0_0.OnChangeScene(arg_38_0)
	arg_38_0.cacheInteractionCfg_ = nil

	arg_38_0:InitSceneEffect()
end

function var_0_0.SetSceneID(arg_39_0, arg_39_1)
	if arg_39_0.cacheSceneId_ and arg_39_0.cacheSceneId_ ~= arg_39_1 then
		arg_39_0.cacheSceneId_ = arg_39_1

		arg_39_0:OnChangeScene()
	else
		arg_39_0.cacheSceneId_ = arg_39_1
	end
end

function var_0_0.GetSceneID(arg_40_0)
	return arg_40_0.cacheSceneId_ or manager.posterGirl:GetCurScene()
end

return var_0_0
