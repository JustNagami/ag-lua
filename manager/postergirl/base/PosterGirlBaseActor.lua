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
	return 0
end

function var_0_0.LoadModel(arg_6_0)
	local var_6_0 = "Char/" .. arg_6_0.modelId

	arg_6_0.tpose = manager.resourcePool:Get(var_6_0, ASSET_TYPE.TPOSE)
	arg_6_0.ui_topse = arg_6_0.tpose.transform:Find(string.format("%dui/%dui_tpose", arg_6_0.skinId, arg_6_0.skinId))

	local var_6_1 = SkinCfg[arg_6_0.skinId]

	if arg_6_0.ui_topse then
		local var_6_2 = var_6_1.home_weapon_show and var_6_1.home_weapon_show ~= 0

		HeroTools.SetHeroModelWeaponActivity(arg_6_0.ui_topse, var_6_2)
	end
end

function var_0_0.PlayHeroTalk(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
	local var_7_0

	if arg_7_0.tpose then
		var_7_0 = arg_7_0.tpose.transform
	end

	HeroTools.PlayTalk(arg_7_1, arg_7_2, arg_7_3, var_7_0)

	local var_7_1 = manager.audio:GetVoiceLength(string.format("vo_sys_%d", arg_7_1), string.format("v_s_%d_%s", arg_7_1, arg_7_2), string.format("vo_sys_%d.awb", arg_7_1))
	local var_7_2 = HeroVoiceCfg.get_id_list_by_file[arg_7_2]

	if var_7_2 then
		manager.notify:Invoke(HOME_POSTER_TALK, arg_7_1, var_7_2, var_7_1)
	end
end

function var_0_0.UpdateViewTag(arg_8_0, arg_8_1)
	local var_8_0

	if PosterGirlConst.ViewTag.home == arg_8_1 then
		var_8_0 = "main"
	elseif PosterGirlConst.ViewTag.chat == arg_8_1 then
		var_8_0 = "chat"
	elseif PosterGirlConst.ViewTag.playerInfo == arg_8_1 or PosterGirlConst.ViewTag.playerInfo_other == arg_8_1 then
		var_8_0 = "playerInfo"
	else
		error("UpdateViewParams")

		return
	end

	local var_8_1 = arg_8_0:GetHeroPosAndRotCfg()
	local var_8_2 = var_8_1["position_" .. var_8_0]
	local var_8_3 = var_8_1["rotation_" .. "main"]
	local var_8_4 = var_8_1["scale_" .. "main"]
	local var_8_5 = var_8_1.offset
	local var_8_6 = Vector3.one

	if arg_8_1 ~= PosterGirlConst.ViewTag.playerInfo_other then
		local var_8_7 = HomeSceneSettingData:GetCurScene()

		if var_8_7 and var_8_1["position_scene_" .. var_8_7] then
			var_8_2 = var_8_1["position_scene_" .. var_8_7]
		end

		if var_8_7 and var_8_1["rotation_scene_" .. var_8_7] then
			var_8_3 = var_8_1["rotation_scene_" .. var_8_7]
		end
	end

	if var_8_0 == "chat" or var_8_0 == "playerInfo" then
		local var_8_8 = Screen.safeArea
		local var_8_9 = var_8_8.width / var_8_8.height / 1.7777777777777777

		arg_8_0.tpose.transform.localPosition = Vector3.New(var_8_2[1], var_8_2[2], var_8_2[3]) + Vector3(var_8_5 * var_8_9, 0, 0)
		var_8_6 = GameSetting.chat_model_rotation.value
	else
		arg_8_0.tpose.transform.localPosition = Vector3.New(var_8_2[1], var_8_2[2], var_8_2[3])
	end

	if (var_8_0 == "chat" or var_8_0 == "playerInfo") and (arg_8_0:GetViewDirect() == 0 or manager.posterGirl:GetViewTag() == PosterGirlConst.ViewTag.playerInfo) then
		arg_8_0.tpose.transform.localEulerAngles = Vector3.New(var_8_3[1] + var_8_6[1], var_8_3[2] + var_8_6[2], var_8_3[3] + var_8_6[3])
	else
		arg_8_0.tpose.transform.localEulerAngles = Vector3.New(var_8_3[1], var_8_3[2], var_8_3[3])
	end

	arg_8_0.tpose.transform.localScale = Vector3.New(var_8_4[1], var_8_4[2], var_8_4[3])

	arg_8_0:ResetTpose()
end

function var_0_0.GetHeroPosAndRotCfg(arg_9_0)
	local var_9_0 = SkinCfg[arg_9_0.skinId].hero

	return HeroPosAndRotCfg[var_9_0]
end

function var_0_0.ResetTpose(arg_10_0)
	local var_10_0 = arg_10_0.tpose.transform:Find(arg_10_0.skinId .. "ui")

	if var_10_0 then
		var_10_0.localEulerAngles = Vector3.zero
	end

	local var_10_1 = arg_10_0.tpose.transform:Find(string.format("%dui/%dui_tpose", arg_10_0.skinId, arg_10_0.skinId))

	if var_10_1 then
		var_10_1.localEulerAngles = Vector3.zero
	end
end

function var_0_0.ResetBlendShapes(arg_11_0)
	manager.resourcePool:ResetBlendShapes(arg_11_0.tpose.transform)
end

function var_0_0.EnableEyeController(arg_12_0, arg_12_1)
	LuaForUtil.EnableEyeController(arg_12_0.ui_topse.transform, arg_12_1)
end

function var_0_0.GetCurrentState(arg_13_0)
	return arg_13_0._currentState
end

function var_0_0.ChangeState(arg_14_0, arg_14_1, arg_14_2)
	local var_14_0 = arg_14_0:GetState(arg_14_1)

	if arg_14_2 == nil then
		arg_14_2 = false
	end

	if var_14_0 then
		arg_14_0:Transition(var_14_0, arg_14_2)
	end
end

function var_0_0.Transition(arg_15_0, arg_15_1, arg_15_2)
	if arg_15_0._currentState == arg_15_1 or arg_15_0._inTransition then
		return
	end

	arg_15_0._inTransition = true

	if arg_15_0._currentState ~= nil then
		arg_15_0._currentState:Exit(arg_15_2)
	end

	arg_15_0._currentState = arg_15_1

	if arg_15_0._currentState ~= nil then
		arg_15_0._currentState:Enter()
	end

	arg_15_0._inTransition = false
end

function var_0_0.GetState(arg_16_0, arg_16_1)
	return nil
end

function var_0_0.Dispose(arg_17_0)
	if arg_17_0._currentState then
		arg_17_0._currentState:Exit(true)
	end

	arg_17_0._currentState = nil

	if arg_17_0.tpose then
		manager.resourcePool:DestroyOrReturn(arg_17_0.tpose, ASSET_TYPE.TPOSE)
	end

	arg_17_0.tpose = nil
	arg_17_0.ui_topse = nil
end

function var_0_0.InitTouchHelp(arg_18_0, arg_18_1)
	return
end

function var_0_0.TouchHelpIdle(arg_19_0)
	return
end

function var_0_0.TouchHelpSingleDrag(arg_20_0, arg_20_1, arg_20_2)
	return
end

function var_0_0.TouchHelpMutiDrag(arg_21_0, arg_21_1)
	return
end

function var_0_0.CheckInitState(arg_22_0)
	local var_22_0 = arg_22_0:GetCurrentState()

	return var_22_0 and var_22_0:GetStateKey() == PosterGirlConst.StateKay.init or false
end

function var_0_0.CheckDebut(arg_23_0)
	return false
end

function var_0_0.SkipDebut(arg_24_0)
	return false
end

function var_0_0.IsPlayingDebut(arg_25_0)
	local var_25_0 = arg_25_0:GetCurrentState()

	return var_25_0 and var_25_0:GetStateKey() == PosterGirlConst.StateKay.debut or false
end

function var_0_0.GetInteractionCfg()
	return nil
end

function var_0_0.DoShacking(arg_27_0)
	return
end

function var_0_0.DoTouch(arg_28_0)
	return
end

function var_0_0.DoQuickTouch(arg_29_0)
	return
end

function var_0_0.DoShowing(arg_30_0)
	return
end

function var_0_0.DoGreeting(arg_31_0)
	return
end

function var_0_0.DoIdle(arg_32_0)
	return
end

function var_0_0.DoInit(arg_33_0, arg_33_1)
	return
end

return var_0_0
