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
	arg_1_0.interactionTImes = 0
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

function var_0_0.GetModel(arg_8_0)
	return arg_8_0.tpose
end

function var_0_0.PlayHeroTalk(arg_9_0, arg_9_1, arg_9_2, arg_9_3)
	local var_9_0

	if arg_9_0.tpose then
		var_9_0 = arg_9_0.tpose.transform
	end

	HeroTools.PlayTalk(arg_9_1, arg_9_2, arg_9_3, var_9_0)

	local var_9_1 = manager.audio:GetVoiceLength(string.format("vo_sys_%d", arg_9_1), string.format("v_s_%d_%s", arg_9_1, arg_9_2), string.format("vo_sys_%d.awb", arg_9_1))
	local var_9_2 = HeroVoiceCfg.get_id_list_by_file[arg_9_2]

	if var_9_2 then
		manager.notify:Invoke(HOME_POSTER_TALK, arg_9_1, var_9_2, var_9_1)
	end
end

function var_0_0.UpdateViewTag(arg_10_0, arg_10_1)
	local var_10_0

	if PosterGirlConst.ViewTag.home == arg_10_1 then
		var_10_0 = "main"
	elseif PosterGirlConst.ViewTag.chat == arg_10_1 then
		var_10_0 = "chat"
	elseif PosterGirlConst.ViewTag.playerInfo == arg_10_1 or PosterGirlConst.ViewTag.playerInfo_other == arg_10_1 then
		var_10_0 = "playerInfo"
	elseif PosterGirlConst.ViewTag.preview == arg_10_1 then
		var_10_0 = "main"
	else
		error("UpdateViewParams")

		return
	end

	local var_10_1 = arg_10_0:GetHeroPosAndRotCfg()
	local var_10_2 = var_10_1["position_" .. var_10_0]
	local var_10_3 = var_10_1["rotation_" .. "main"]
	local var_10_4 = var_10_1["scale_" .. "main"]
	local var_10_5 = var_10_1.offset
	local var_10_6 = Vector3.one

	if arg_10_1 ~= PosterGirlConst.ViewTag.playerInfo_other then
		local var_10_7 = manager.posterGirl:GetCurScene()

		if var_10_7 and var_10_1["position_scene_" .. var_10_7] then
			var_10_2 = var_10_1["position_scene_" .. var_10_7]
		end

		if var_10_7 and var_10_1["rotation_scene_" .. var_10_7] then
			var_10_3 = var_10_1["rotation_scene_" .. var_10_7]
		end
	end

	if var_10_0 == "chat" or var_10_0 == "playerInfo" then
		local var_10_8 = Screen.safeArea
		local var_10_9 = var_10_8.width / var_10_8.height / 1.7777777777777777

		arg_10_0.tpose.transform.localPosition = Vector3.New(var_10_2[1], var_10_2[2], var_10_2[3]) + Vector3(var_10_5 * var_10_9, 0, 0)
		var_10_6 = GameSetting.chat_model_rotation.value
	else
		arg_10_0.tpose.transform.localPosition = Vector3.New(var_10_2[1], var_10_2[2], var_10_2[3])
	end

	if (var_10_0 == "chat" or var_10_0 == "playerInfo") and (arg_10_0:GetViewDirect() == 0 or manager.posterGirl:GetViewTag() == PosterGirlConst.ViewTag.playerInfo) then
		arg_10_0.tpose.transform.localEulerAngles = Vector3.New(var_10_3[1] + var_10_6[1], var_10_3[2] + var_10_6[2], var_10_3[3] + var_10_6[3])
	else
		arg_10_0.tpose.transform.localEulerAngles = Vector3.New(var_10_3[1], var_10_3[2], var_10_3[3])
	end

	arg_10_0.tpose.transform.localScale = Vector3.New(var_10_4[1], var_10_4[2], var_10_4[3])

	arg_10_0:ResetTpose()
end

function var_0_0.GetHeroPosAndRotCfg(arg_11_0)
	local var_11_0 = SkinCfg[arg_11_0.skinId].hero

	return HeroPosAndRotCfg[var_11_0]
end

function var_0_0.ResetTpose(arg_12_0)
	local var_12_0 = arg_12_0.tpose.transform:Find(arg_12_0.skinId .. "ui")

	if var_12_0 then
		var_12_0.localEulerAngles = Vector3.zero
	end

	local var_12_1 = arg_12_0.tpose.transform:Find(string.format("%dui/%dui_tpose", arg_12_0.skinId, arg_12_0.skinId))

	if var_12_1 then
		var_12_1.localEulerAngles = Vector3.zero
	end
end

function var_0_0.ResetBlendShapes(arg_13_0)
	manager.resourcePool:ResetBlendShapes(arg_13_0.tpose.transform)
end

function var_0_0.EnableEyeController(arg_14_0, arg_14_1)
	LuaForUtil.EnableEyeController(arg_14_0.ui_topse.transform, arg_14_1)
end

function var_0_0.GetCurrentState(arg_15_0)
	return arg_15_0._currentState
end

function var_0_0.ChangeState(arg_16_0, arg_16_1, arg_16_2)
	local var_16_0 = arg_16_0:GetState(arg_16_1)

	if arg_16_2 == nil then
		arg_16_2 = false
	end

	if var_16_0 then
		arg_16_0:Transition(var_16_0, arg_16_2)
	end
end

function var_0_0.Transition(arg_17_0, arg_17_1, arg_17_2)
	if arg_17_0._currentState == arg_17_1 or arg_17_0._inTransition then
		return
	end

	arg_17_0._inTransition = true

	if arg_17_0._currentState ~= nil then
		arg_17_0._currentState:Exit(arg_17_2)
	end

	arg_17_0._currentState = arg_17_1

	if arg_17_0._currentState ~= nil then
		arg_17_0._currentState:Enter()
		manager.notify:Invoke(ON_POSTERGIRL_TRANSITION_END, arg_17_1)
	end

	arg_17_0._inTransition = false
end

function var_0_0.GetState(arg_18_0, arg_18_1)
	return nil
end

function var_0_0.Dispose(arg_19_0)
	if arg_19_0._currentState then
		arg_19_0._currentState:Exit(true)
	end

	arg_19_0._currentState = nil

	if arg_19_0.tpose then
		manager.resourcePool:DestroyOrReturn(arg_19_0.tpose, ASSET_TYPE.TPOSE)
	end

	arg_19_0.tpose = nil
	arg_19_0.ui_topse = nil
end

function var_0_0.InitTouchHelp(arg_20_0, arg_20_1)
	return
end

function var_0_0.TouchHelpIdle(arg_21_0)
	return
end

function var_0_0.TouchHelpSingleDrag(arg_22_0, arg_22_1, arg_22_2)
	return
end

function var_0_0.TouchHelpMutiDrag(arg_23_0, arg_23_1)
	return
end

function var_0_0.CheckInitState(arg_24_0)
	local var_24_0 = arg_24_0:GetCurrentState()

	return var_24_0 and var_24_0:GetStateKey() == PosterGirlConst.StateKay.init or false
end

function var_0_0.CheckDebut(arg_25_0)
	return false
end

function var_0_0.SkipDebut(arg_26_0)
	return false
end

function var_0_0.IsPlayingDebut(arg_27_0)
	local var_27_0 = arg_27_0:GetCurrentState()

	return var_27_0 and var_27_0:GetStateKey() == PosterGirlConst.StateKay.debut or false
end

function var_0_0._GetInteractionCfg(arg_28_0, arg_28_1)
	if arg_28_0.cacheInteractionCfg_ then
		return arg_28_0.cacheInteractionCfg_
	end

	local var_28_0 = arg_28_0:GetSceneID()
	local var_28_1 = HomeSceneSettingCfg[var_28_0]
	local var_28_2 = var_28_1 and var_28_1.action_suffix
	local var_28_3 = arg_28_0:GetTimeParam()

	arg_28_0.cacheInteractionCfg_ = HeroTools:GetUnlockInteractionCfg(arg_28_1, {
		var_28_2,
		var_28_3
	})

	return arg_28_0.cacheInteractionCfg_
end

function var_0_0.GetTimeParam(arg_29_0)
	return nil
end

function var_0_0.GetInteractionCfg(arg_30_0)
	return arg_30_0:_GetInteractionCfg(arg_30_0:GetSkinId())
end

function var_0_0.DoShacking(arg_31_0)
	arg_31_0:AddInteractionsTimes()
end

function var_0_0.DoTouch(arg_32_0)
	arg_32_0:AddInteractionsTimes()
end

function var_0_0.DoQuickTouch(arg_33_0)
	arg_33_0:AddInteractionsTimes()
end

function var_0_0.DoShowing(arg_34_0)
	arg_34_0:AddInteractionsTimes()
end

function var_0_0.DoGreeting(arg_35_0)
	return
end

function var_0_0.DoIdle(arg_36_0)
	return
end

function var_0_0.DoInit(arg_37_0, arg_37_1)
	return
end

function var_0_0.DOEndDrag(arg_38_0)
	return
end

function var_0_0.InitSceneEffect(arg_39_0)
	local var_39_0 = arg_39_0:GetViewDirect()
	local var_39_1, var_39_2 = PosterGirlTools.GetLoadLightEffect(var_39_0, var_39_0)

	if var_39_1 then
		manager.ui:SetSceneLightEffect(var_39_2)
	end

	manager.loadScene:SetSceneWeather(manager.loadScene:GetCurWeather())
end

function var_0_0.OnChangeScene(arg_40_0)
	arg_40_0.cacheInteractionCfg_ = nil

	arg_40_0:InitSceneEffect()
end

function var_0_0.SetSceneID(arg_41_0, arg_41_1)
	if arg_41_0.cacheSceneId_ and arg_41_0.cacheSceneId_ ~= arg_41_1 then
		arg_41_0.cacheSceneId_ = arg_41_1

		arg_41_0:OnChangeScene()
	elseif arg_41_0.cacheSceneId_ == nil then
		arg_41_0.cacheSceneId_ = arg_41_1

		arg_41_0:OnChangeScene()
	else
		arg_41_0.cacheSceneId_ = arg_41_1
	end
end

function var_0_0.GetSceneID(arg_42_0)
	return arg_42_0.cacheSceneId_ or manager.posterGirl:GetCurScene()
end

function var_0_0.GetInteractionsTimes(arg_43_0)
	return arg_43_0.interactionTImes
end

function var_0_0.AddInteractionsTimes(arg_44_0)
	arg_44_0.interactionTImes = arg_44_0.interactionTImes + 1
end

return var_0_0
