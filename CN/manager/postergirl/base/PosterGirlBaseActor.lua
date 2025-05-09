local var_0_0 = class("PosterGirlBaseActor")

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.skinId = arg_1_1
	arg_1_0.modelId = arg_1_2
	arg_1_0.tpose = nil
	arg_1_0.ui_topse = nil
	arg_1_0._currentState = nil
	arg_1_0._inTransition = nil
	arg_1_0._states = {}
	arg_1_0.interactionTImes = 0
	LuaForUtil.IsManualAnimatorBlend = true
end

function var_0_0.GetHeroTimelineMgr(arg_2_0)
	if arg_2_0:IsValid() then
		return arg_2_0.overrideHeroTimelineMgr or manager.heroUiTimeline
	end
end

function var_0_0.UseOwnHeroTimelineMgr(arg_3_0)
	if arg_3_0.overrideHeroTimelineMgr == nil then
		arg_3_0.overrideHeroTimelineMgr = HeroUITimelineMgr.New()
	end
end

function var_0_0.SetActive(arg_4_0, arg_4_1)
	if arg_4_0.tpose and not isNil(arg_4_0.tpose) then
		SetActive(arg_4_0.tpose.gameObject, arg_4_1)
	end
end

function var_0_0.GetSkinId(arg_5_0)
	return arg_5_0.skinId
end

function var_0_0.GetModelId(arg_6_0)
	return arg_6_0.modelId
end

function var_0_0.GetTag(arg_7_0)
	return PosterGirlConst.PosterGirlTag.null
end

function var_0_0.GetViewDirect(arg_8_0)
	return PosterGirlConst.ViewDirect.center
end

function var_0_0.GetModelPath(arg_9_0)
	return "Char/" .. arg_9_0.modelId
end

function var_0_0.LoadModel(arg_10_0)
	local var_10_0 = arg_10_0:GetModelPath()

	arg_10_0.tpose = manager.resourcePool:Get(var_10_0, ASSET_TYPE.TPOSE)
	arg_10_0.ui_topse = arg_10_0.tpose.transform:Find(string.format("%dui/%dui_tpose", arg_10_0.skinId, arg_10_0.skinId))

	local var_10_1 = SkinCfg[arg_10_0.skinId]

	if arg_10_0.ui_topse then
		local var_10_2 = var_10_1.home_weapon_show and var_10_1.home_weapon_show ~= 0

		HeroTools.SetHeroModelWeaponActivity(arg_10_0.ui_topse, var_10_2)
	end
end

function var_0_0.GetModel(arg_11_0)
	return arg_11_0.tpose
end

function var_0_0.IsValid(arg_12_0)
	return not isNil(arg_12_0:GetModel())
end

function var_0_0.PlayHeroTalk(arg_13_0, arg_13_1, arg_13_2, arg_13_3)
	local var_13_0

	if arg_13_0.tpose then
		var_13_0 = arg_13_0.tpose.transform
	end

	HeroTools.PlayTalk(arg_13_1, arg_13_2, arg_13_3, var_13_0)

	local var_13_1 = manager.audio:GetVoiceLength(string.format("vo_sys_%d", arg_13_1), string.format("v_s_%d_%s", arg_13_1, arg_13_2), string.format("vo_sys_%d.awb", arg_13_1))
	local var_13_2 = HeroVoiceCfg.get_id_list_by_file[arg_13_2]

	if var_13_2 then
		manager.notify:Invoke(HOME_POSTER_TALK, arg_13_1, var_13_2, var_13_1)
	end
end

function var_0_0.UpdateViewTag(arg_14_0, arg_14_1)
	local var_14_0

	if PosterGirlConst.ViewTag.home == arg_14_1 then
		var_14_0 = "main"
	elseif PosterGirlConst.ViewTag.chat == arg_14_1 then
		var_14_0 = "chat"
	elseif PosterGirlConst.ViewTag.playerInfo == arg_14_1 or PosterGirlConst.ViewTag.playerInfo_other == arg_14_1 then
		var_14_0 = "playerInfo"
	elseif PosterGirlConst.ViewTag.preview == arg_14_1 then
		var_14_0 = "main"
	else
		error("UpdateViewParams")

		return
	end

	local var_14_1 = arg_14_0:GetHeroPosAndRotCfg()
	local var_14_2 = var_14_1["position_" .. var_14_0]
	local var_14_3 = var_14_1["rotation_" .. "main"]
	local var_14_4 = var_14_1["scale_" .. "main"]
	local var_14_5 = var_14_1.offset
	local var_14_6 = Vector3.one

	if arg_14_1 ~= PosterGirlConst.ViewTag.playerInfo_other then
		local var_14_7 = manager.posterGirl:GetCurScene()

		if var_14_7 and var_14_1["position_scene_" .. var_14_7] then
			var_14_2 = var_14_1["position_scene_" .. var_14_7]
		end

		if var_14_7 and var_14_1["rotation_scene_" .. var_14_7] then
			var_14_3 = var_14_1["rotation_scene_" .. var_14_7]
		end
	end

	if var_14_0 == "chat" or var_14_0 == "playerInfo" then
		local var_14_8 = Screen.safeArea
		local var_14_9 = var_14_8.width / var_14_8.height / 1.7777777777777777

		arg_14_0.tpose.transform.localPosition = Vector3.New(var_14_2[1], var_14_2[2], var_14_2[3]) + Vector3(var_14_5 * var_14_9, 0, 0)
		var_14_6 = GameSetting.chat_model_rotation.value
	else
		arg_14_0.tpose.transform.localPosition = Vector3.New(var_14_2[1], var_14_2[2], var_14_2[3])
	end

	if (var_14_0 == "chat" or var_14_0 == "playerInfo") and (arg_14_0:GetViewDirect() == 0 or manager.posterGirl:GetViewTag() == PosterGirlConst.ViewTag.playerInfo) then
		arg_14_0.tpose.transform.localEulerAngles = Vector3.New(var_14_3[1] + var_14_6[1], var_14_3[2] + var_14_6[2], var_14_3[3] + var_14_6[3])
	else
		arg_14_0.tpose.transform.localEulerAngles = Vector3.New(var_14_3[1], var_14_3[2], var_14_3[3])
	end

	arg_14_0.tpose.transform.localScale = Vector3.New(var_14_4[1], var_14_4[2], var_14_4[3])

	arg_14_0:ResetTpose()
end

function var_0_0.GetHeroPosAndRotCfg(arg_15_0)
	local var_15_0 = SkinCfg[arg_15_0.skinId].hero

	return HeroPosAndRotCfg[var_15_0]
end

function var_0_0.ResetTpose(arg_16_0)
	local var_16_0 = arg_16_0.tpose.transform:Find(arg_16_0.skinId .. "ui")

	if var_16_0 then
		var_16_0.localEulerAngles = Vector3.zero
	end

	local var_16_1 = arg_16_0.tpose.transform:Find(string.format("%dui/%dui_tpose", arg_16_0.skinId, arg_16_0.skinId))

	if var_16_1 then
		var_16_1.localEulerAngles = Vector3.zero
	end
end

function var_0_0.ResetBlendShapes(arg_17_0)
	manager.resourcePool:ResetBlendShapes(arg_17_0.tpose.transform)
end

function var_0_0.EnableEyeController(arg_18_0, arg_18_1)
	LuaForUtil.EnableEyeController(arg_18_0.ui_topse.transform, arg_18_1)
end

function var_0_0.GetCurrentState(arg_19_0)
	return arg_19_0._currentState
end

function var_0_0.ChangeState(arg_20_0, arg_20_1, arg_20_2)
	local var_20_0 = arg_20_0:GetState(arg_20_1)

	if arg_20_2 == nil then
		arg_20_2 = false
	end

	if var_20_0 then
		arg_20_0:Transition(var_20_0, arg_20_2)
	end
end

function var_0_0.Transition(arg_21_0, arg_21_1, arg_21_2)
	if arg_21_0._currentState == arg_21_1 or arg_21_0._inTransition then
		arg_21_0._currentState:Update()

		return
	end

	arg_21_0._inTransition = true

	if arg_21_0._currentState ~= nil then
		arg_21_0._currentState:Exit(arg_21_2)
	end

	arg_21_0._currentState = arg_21_1

	if arg_21_0._currentState ~= nil then
		arg_21_0._currentState:Enter()
		manager.notify:Invoke(ON_POSTERGIRL_TRANSITION_END, arg_21_1)
	end

	arg_21_0._inTransition = false
end

function var_0_0.GetState(arg_22_0, arg_22_1)
	return nil
end

function var_0_0.Dispose(arg_23_0)
	if arg_23_0._currentState then
		arg_23_0._currentState:Dispose()
	end

	arg_23_0._currentState = nil

	if arg_23_0.tpose then
		manager.resourcePool:DestroyOrReturn(arg_23_0.tpose, ASSET_TYPE.TPOSE)

		arg_23_0.tpose = nil
	end

	if arg_23_0.overrideHeroTimelineMgr then
		arg_23_0.overrideHeroTimelineMgr:Dispose()

		arg_23_0.overrideHeroTimelineMgr = nil
	end

	arg_23_0.tpose = nil
	arg_23_0.ui_topse = nil
	arg_23_0._states = nil
end

function var_0_0.InitTouchHelp(arg_24_0, arg_24_1)
	return
end

function var_0_0.TouchHelpIdle(arg_25_0)
	return
end

function var_0_0.TouchHelpSingleDrag(arg_26_0, arg_26_1, arg_26_2)
	return
end

function var_0_0.TouchHelpMutiDrag(arg_27_0, arg_27_1)
	return
end

function var_0_0.CheckInitState(arg_28_0)
	local var_28_0 = arg_28_0:GetCurrentState()

	return var_28_0 and var_28_0:GetStateKey() == PosterGirlConst.StateKay.init or false
end

function var_0_0.CheckDebut(arg_29_0)
	return false
end

function var_0_0.SkipDebut(arg_30_0)
	return false
end

function var_0_0.IsPlayingDebut(arg_31_0)
	local var_31_0 = arg_31_0:GetCurrentState()

	return var_31_0 and var_31_0:GetStateKey() == PosterGirlConst.StateKay.debut or false
end

function var_0_0._GetInteractionCfg(arg_32_0, arg_32_1)
	if arg_32_0.cacheInteractionCfg_ then
		return arg_32_0.cacheInteractionCfg_
	end

	local var_32_0 = arg_32_0:GetSceneID()
	local var_32_1 = HomeSceneSettingCfg[var_32_0]
	local var_32_2 = var_32_1 and var_32_1.action_suffix
	local var_32_3 = arg_32_0:GetTimeParam()

	arg_32_0.cacheInteractionCfg_ = HeroTools:GetUnlockInteractionCfg(arg_32_1, {
		var_32_2,
		var_32_3
	})

	return arg_32_0.cacheInteractionCfg_
end

function var_0_0.GetTimeParam(arg_33_0)
	return nil
end

function var_0_0.GetInteractionCfg(arg_34_0)
	return arg_34_0:_GetInteractionCfg(arg_34_0:GetSkinId())
end

function var_0_0.DoShacking(arg_35_0)
	arg_35_0:AddInteractionsTimes()
end

function var_0_0.AcceptTouch(arg_36_0)
	if #arg_36_0:GetInteractionCfg()[PosterGirlConst.InteractionKey.mainTouch] ~= 0 then
		return true
	end
end

function var_0_0.DoTouch(arg_37_0)
	arg_37_0:AddInteractionsTimes()
end

function var_0_0.DoQuickTouch(arg_38_0)
	arg_38_0:AddInteractionsTimes()
end

function var_0_0.DoShowing(arg_39_0)
	arg_39_0:AddInteractionsTimes()
end

function var_0_0.DoGreeting(arg_40_0)
	return
end

function var_0_0.CheckIdle(arg_41_0)
	return arg_41_0:CheckInitState() and not manager.story:IsPlay()
end

function var_0_0.DoIdle(arg_42_0)
	return
end

function var_0_0.DoInit(arg_43_0, arg_43_1)
	return
end

function var_0_0.DOEndDrag(arg_44_0)
	return
end

function var_0_0.InitSceneEffect(arg_45_0)
	local var_45_0 = arg_45_0:GetViewDirect()
	local var_45_1, var_45_2 = PosterGirlTools.GetLoadLightEffect(var_45_0, var_45_0)

	if var_45_1 then
		manager.ui:SetSceneLightEffect(var_45_2)
	end

	manager.loadScene:SetSceneWeather(manager.loadScene:GetCurWeather())
end

function var_0_0.OnChangeScene(arg_46_0)
	arg_46_0.cacheInteractionCfg_ = nil

	arg_46_0:InitSceneEffect()
end

function var_0_0.SetSceneID(arg_47_0, arg_47_1)
	if arg_47_0.cacheSceneId_ and arg_47_0.cacheSceneId_ ~= arg_47_1 then
		arg_47_0.cacheSceneId_ = arg_47_1

		arg_47_0:OnChangeScene()
	elseif arg_47_0.cacheSceneId_ == nil then
		arg_47_0.cacheSceneId_ = arg_47_1

		arg_47_0:OnChangeScene()
	else
		arg_47_0.cacheSceneId_ = arg_47_1
	end
end

function var_0_0.GetSceneID(arg_48_0)
	return arg_48_0.cacheSceneId_ or manager.posterGirl:GetCurScene()
end

function var_0_0.GetInteractionsTimes(arg_49_0)
	return arg_49_0.interactionTImes
end

function var_0_0.AddInteractionsTimes(arg_50_0)
	arg_50_0.interactionTImes = arg_50_0.interactionTImes + 1
end

return var_0_0
