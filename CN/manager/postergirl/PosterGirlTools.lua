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

function var_0_0.DlcStateShouldCache(arg_4_0)
	if arg_4_0 then
		if type(arg_4_0) == "table" then
			local var_4_0 = arg_4_0.class or arg_4_0

			if var_4_0.GetInstance or var_4_0.New then
				return var_4_0.__cname
			else
				return nil
			end
		end

		return arg_4_0
	end
end

function var_0_0.ProduceDlcState(arg_5_0, arg_5_1, arg_5_2)
	if PosterGirlConst.StateKay.init == arg_5_0 then
		return PosterDlcInitState.New(arg_5_1)
	elseif PosterGirlConst.StateKay.init_spec == arg_5_0 then
		return PosterDlcInitSpecState.New(arg_5_1)
	elseif PosterGirlConst.StateKay.init_no_blend == arg_5_0 then
		return PosterDlcInitNoblendState.New(arg_5_1)
	elseif PosterGirlConst.StateKay.idle == arg_5_0 then
		return PosterDlcIdleState.New(arg_5_1)
	elseif PosterGirlConst.StateKay.idle == arg_5_0 then
		return PosterDlcIdleStatenihu.New(arg_5_1)
	elseif PosterGirlConst.StateKay.shake == arg_5_0 then
		return PosterDlcInteractionState.New(arg_5_1, PosterGirlConst.InteractionKey.shaking)
	elseif PosterGirlConst.StateKay.touch == arg_5_0 then
		return PosterDlcTouchState.New(arg_5_1)
	elseif PosterGirlConst.StateKay.quickclick == arg_5_0 then
		return PosterDlcInteractionState.New(arg_5_1, PosterGirlConst.InteractionKey.mainQuickTouch)
	elseif PosterGirlConst.StateKay.show == arg_5_0 then
		return PosterDlcInteractionState.New(arg_5_1, PosterGirlConst.InteractionKey.showing)
	elseif PosterGirlConst.StateKay.mid2left == arg_5_0 then
		return PosterDlcSwipeState.New(arg_5_1, PosterGirlConst.ViewDirect.center, PosterGirlConst.ViewDirect.left)
	elseif PosterGirlConst.StateKay.mid2right == arg_5_0 then
		return PosterDlcSwipeState.New(arg_5_1, PosterGirlConst.ViewDirect.center, PosterGirlConst.ViewDirect.right)
	elseif PosterGirlConst.StateKay.left2mid == arg_5_0 then
		return PosterDlcSwipeState.New(arg_5_1, PosterGirlConst.ViewDirect.left, PosterGirlConst.ViewDirect.center)
	elseif PosterGirlConst.StateKay.right2mid == arg_5_0 then
		return PosterDlcSwipeState.New(arg_5_1, PosterGirlConst.ViewDirect.right, PosterGirlConst.ViewDirect.center)
	elseif PosterGirlConst.StateKay.debut == arg_5_0 then
		return PosterDlcDebutState.New(arg_5_1)
	elseif arg_5_0 then
		local var_5_0 = arg_5_0.class or arg_5_0
		local var_5_1 = var_5_0.GetInstance or var_5_0.New

		if var_5_1 then
			return var_5_1(arg_5_1)
		end
	end
end

function var_0_0.GetLoadWeatherEffect(arg_6_0)
	return false
end

function var_0_0.HasTimeEffect(arg_7_0, arg_7_1)
	local var_7_0 = SkinSceneActionCfg[arg_7_0]

	if var_7_0 and var_7_0.special_scene_id_2 and var_7_0.special_scene_id_2 ~= 0 then
		if arg_7_1 == var_7_0.special_scene_id_2 then
			return HomeSceneSettingData:CanUseScene(var_7_0.special_scene_id)
		elseif arg_7_1 == var_7_0.special_scene_id then
			return HomeSceneSettingData:CanUseScene(var_7_0.special_scene_id_2)
		end
	end

	return false
end

function var_0_0.SceneHasTimeEffect(arg_8_0)
	return var_0_0.HasTimeEffect(109502, arg_8_0)
end

function var_0_0.HasWeatherEffect(arg_9_0, arg_9_1)
	return false
end

function var_0_0.IsSkinSceneTzeroMode(arg_10_0, arg_10_1)
	local var_10_0 = SkinSceneActionCfg[arg_10_0]

	if not var_10_0 then
		return false
	end

	if arg_10_1 == 6001 and var_10_0.special_scene_id == arg_10_1 then
		return true
	elseif (arg_10_1 == 6018 or arg_10_1 == 6017) and (var_10_0.special_scene_id == arg_10_1 or var_10_0.special_scene_id_2 == arg_10_1) then
		return true
	end

	return false
end

function var_0_0.IsStateOpenDrag(arg_11_0)
	if arg_11_0 == PosterGirlConst.StateKay.danceGame then
		return true
	end
end

function var_0_0.IsLoopSwitch(arg_12_0)
	local var_12_0 = HomeSceneSettingCfg[arg_12_0]

	return var_12_0.can_loop_switch_camera and var_12_0.can_loop_switch_camera == 1 or false
end

function var_0_0.IsInterruptCurAni(arg_13_0)
	local var_13_0 = HomeSceneSettingCfg[arg_13_0]

	return var_13_0.can_interrupt_current_anim_switch_camera and var_13_0.can_interrupt_current_anim_switch_camera == 1 or false
end

function var_0_0.CanInterruptCurAni()
	local var_14_0 = manager.posterGirl.actor

	if var_14_0 then
		local var_14_1 = HomeSceneSettingData:GetCurScene()
		local var_14_2 = PosterGirlTools.IsInterruptCurAni(var_14_1)

		if var_14_0:CheckInitState() or var_14_2 then
			return true
		end
	end

	return false
end

function var_0_0.GetMiniGameAction(arg_15_0, arg_15_1)
	return ({
		{
			enter = "game_tv_enter_101"
		}
	})[arg_15_0]
end

function var_0_0.DoMiniGameAction(arg_16_0, arg_16_1)
	return ({
		{
			enter = "game_tv_enter_101"
		}
	})[arg_16_0]
end

function var_0_0.ShowPureMode()
	manager.notify:Invoke(PUREMODE_SHOW)
end

function var_0_0.IsDlcBtn()
	local var_18_0 = manager.posterGirl:GetTag()
	local var_18_1 = manager.posterGirl:GetCurScene()
	local var_18_2 = HomeSceneSettingCfg[var_18_1]
	local var_18_3 = var_18_0 == PosterGirlConst.PosterGirlTag.t0
	local var_18_4 = var_18_2.limit_display ~= 0

	return SettingData:GetGameSettingData().home_scene_dlc_btn == 1 and var_18_3 and var_18_4
end

function var_0_0.UpdateDlCBtnRed()
	if getData("GAMESETTING", "DLC_BTN") == 1 then
		manager.redPoint:setTip(RedPointConst.DLC_BTN_RED, 0)
	else
		manager.redPoint:setTip(RedPointConst.DLC_BTN_RED, 1)
	end
end

function var_0_0.IsTZeroViewPointCanLoopSwitch(arg_20_0)
	arg_20_0 = arg_20_0 or HomeSceneSettingData:GetCurScene()

	return PosterGirlTools.IsLoopSwitch(arg_20_0)
end

return var_0_0
