local var_0_0 = {}

function var_0_0.GetLoadLightEffect(arg_1_0, arg_1_1)
	local var_1_0 = manager.posterGirl:GetCurScene()
	local var_1_1 = HomeSceneSettingCfg[var_1_0]

	if var_1_1 and type(var_1_1.light_effect) == "table" then
		local var_1_2 = var_1_1.light_effect[arg_1_1 + 1]
		local var_1_3 = var_0_0.GetEffectLightChangeTime(arg_1_0 + 1, arg_1_1 + 1)

		return true, var_1_2, var_1_3
	else
		return false
	end
end

function var_0_0.GetEffectLightChangeTime(arg_2_0, arg_2_1)
	local var_2_0 = manager.posterGirl:GetCurScene()
	local var_2_1 = HomeSceneSettingCfg[var_2_0]

	if var_2_1 and var_2_1.light_effect_delay and type(var_2_1.light_effect_delay) == "table" then
		return var_2_1.light_effect_delay[arg_2_0][arg_2_1]
	end
end

function var_0_0.ProduceCommonState(arg_3_0, arg_3_1)
	if PosterGirlConst.StateKay.init == arg_3_0 then
		return PosterCommonInitState.New(arg_3_1)
	elseif PosterGirlConst.StateKay.idle == arg_3_0 then
		return PosterCommonInteractionState.New(arg_3_1, PosterGirlConst.InteractionKey.idle)
	elseif PosterGirlConst.StateKay.shake == arg_3_0 then
		return PosterCommonInteractionState.New(arg_3_1, PosterGirlConst.InteractionKey.shaking)
	elseif PosterGirlConst.StateKay.touch == arg_3_0 then
		return PosterCommonInteractionState.New(arg_3_1, PosterGirlConst.InteractionKey.mainTouch)
	elseif PosterGirlConst.StateKay.quickclick == arg_3_0 then
		return PosterCommonInteractionState.New(arg_3_1, PosterGirlConst.InteractionKey.mainQuickTouch)
	elseif PosterGirlConst.StateKay.show == arg_3_0 then
		return PosterCommonInteractionState.New(arg_3_1, PosterGirlConst.InteractionKey.showing)
	elseif PosterGirlConst.StateKay.greet == arg_3_0 then
		return PosterCommonGreetingState.New(arg_3_1)
	end
end

function var_0_0.ProduceDlcState(arg_4_0, arg_4_1)
	if PosterGirlConst.StateKay.init == arg_4_0 then
		return PosterDlcInitState.New(arg_4_1)
	elseif PosterGirlConst.StateKay.init_spec == arg_4_0 then
		return PosterDlcInitSpecState.New(arg_4_1)
	elseif PosterGirlConst.StateKay.idle == arg_4_0 then
		return PosterDlcIdleState.New(arg_4_1)
	elseif PosterGirlConst.StateKay.shake == arg_4_0 then
		return PosterDlcInteractionState.New(arg_4_1, PosterGirlConst.InteractionKey.shaking)
	elseif PosterGirlConst.StateKay.touch == arg_4_0 then
		return PosterDlcTouchState.New(arg_4_1)
	elseif PosterGirlConst.StateKay.quickclick == arg_4_0 then
		return PosterDlcInteractionState.New(arg_4_1, PosterGirlConst.InteractionKey.mainQuickTouch)
	elseif PosterGirlConst.StateKay.show == arg_4_0 then
		return PosterDlcInteractionState.New(arg_4_1, PosterGirlConst.InteractionKey.showing)
	elseif PosterGirlConst.StateKay.mid2left == arg_4_0 then
		return PosterDlcSwipeState.New(arg_4_1, PosterGirlConst.ViewDirect.center, PosterGirlConst.ViewDirect.left)
	elseif PosterGirlConst.StateKay.mid2right == arg_4_0 then
		return PosterDlcSwipeState.New(arg_4_1, PosterGirlConst.ViewDirect.center, PosterGirlConst.ViewDirect.right)
	elseif PosterGirlConst.StateKay.left2mid == arg_4_0 then
		return PosterDlcSwipeState.New(arg_4_1, PosterGirlConst.ViewDirect.left, PosterGirlConst.ViewDirect.center)
	elseif PosterGirlConst.StateKay.right2mid == arg_4_0 then
		return PosterDlcSwipeState.New(arg_4_1, PosterGirlConst.ViewDirect.right, PosterGirlConst.ViewDirect.center)
	elseif PosterGirlConst.StateKay.debut == arg_4_0 then
		return PosterDlcDebutState.New(arg_4_1)
	end
end

function var_0_0.GetLoadWeatherEffect(arg_5_0)
	return false
end

function var_0_0.HasTimeEffect(arg_6_0, arg_6_1)
	local var_6_0 = SkinSceneActionCfg[arg_6_0]

	if var_6_0 and var_6_0.special_scene_id_2 and var_6_0.special_scene_id_2 ~= 0 then
		if arg_6_1 == var_6_0.special_scene_id_2 then
			return HomeSceneSettingData:CanUseScene(var_6_0.special_scene_id)
		elseif arg_6_1 == var_6_0.special_scene_id then
			return HomeSceneSettingData:CanUseScene(var_6_0.special_scene_id_2)
		end
	end

	return false
end

function var_0_0.SceneHasTimeEffect(arg_7_0)
	return var_0_0.HasTimeEffect(109502, arg_7_0)
end

function var_0_0.HasWeatherEffect(arg_8_0, arg_8_1)
	return false
end

function var_0_0.IsSkinSceneTzeroMode(arg_9_0, arg_9_1)
	local var_9_0 = SkinSceneActionCfg[arg_9_0]

	if not var_9_0 then
		return false
	end

	if arg_9_1 == 6001 and var_9_0.special_scene_id == arg_9_1 then
		return true
	elseif (arg_9_1 == 6018 or arg_9_1 == 6017) and (var_9_0.special_scene_id == arg_9_1 or var_9_0.special_scene_id_2 == arg_9_1) then
		return true
	end

	return false
end

function var_0_0.IsLoopSwitch(arg_10_0)
	local var_10_0 = HomeSceneSettingCfg[arg_10_0]

	return var_10_0.can_loop_switch_camera and var_10_0.can_loop_switch_camera == 1 or false
end

function var_0_0.IsInterruptCurAni(arg_11_0)
	local var_11_0 = HomeSceneSettingCfg[arg_11_0]

	return var_11_0.can_interrupt_current_anim_switch_camera and var_11_0.can_interrupt_current_anim_switch_camera == 1 or false
end

function var_0_0.CanInterruptCurAni()
	local var_12_0 = manager.posterGirl.actor

	if var_12_0 then
		local var_12_1 = HomeSceneSettingData:GetCurScene()
		local var_12_2 = PosterGirlTools.IsInterruptCurAni(var_12_1)

		if not var_12_0:CheckInitState() and not var_12_2 then
			return true
		end
	end

	return false
end

function var_0_0.ShowPureMode()
	manager.notify:Invoke(PUREMODE_SHOW)
end

function var_0_0.IsDlcBtn()
	local var_14_0 = manager.posterGirl:GetTag()
	local var_14_1 = manager.posterGirl:GetCurScene()
	local var_14_2 = HomeSceneSettingCfg[var_14_1]
	local var_14_3 = var_14_0 == PosterGirlConst.PosterGirlTag.t0
	local var_14_4 = var_14_2.limit_display ~= 0

	return SettingData:GetGameSettingData().home_scene_dlc_btn == 1 and (var_14_3 and var_14_4 or var_14_2.can_loop_switch_camera == 1)
end

function var_0_0.UpdateDlCBtnRed()
	if getData("GAMESETTING", "DLC_BTN") == 1 then
		manager.redPoint:setTip(RedPointConst.DLC_BTN_RED, 0)
	else
		manager.redPoint:setTip(RedPointConst.DLC_BTN_RED, 1)
	end
end

return var_0_0
