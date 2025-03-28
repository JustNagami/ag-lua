local var_0_0 = class("PosterGirlMgr")

function var_0_0.Ctor(arg_1_0)
	arg_1_0.view_tag = PosterGirlConst.ViewTag.null
	arg_1_0.view_data = nil
	arg_1_0.actor = nil

	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	return
end

function var_0_0.SetViewTag(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	if not arg_3_3 and arg_3_1 == arg_3_0.view_tag then
		return
	end

	arg_3_0.view_tag = arg_3_1
	arg_3_0.view_data = arg_3_2

	if PosterGirlConst.ViewTag.null == arg_3_0.view_tag then
		if arg_3_0.actor then
			arg_3_0.actor:Dispose()
		end

		arg_3_0.actor = nil
	else
		arg_3_0:RefreshModel()
	end
end

function var_0_0.GetViewTag(arg_4_0)
	return arg_4_0.view_tag
end

function var_0_0.GetViewDirect(arg_5_0)
	return arg_5_0.view_direct
end

function var_0_0.RefreshModel(arg_6_0)
	if arg_6_0.view_tag == PosterGirlConst.ViewTag.playerInfo_other then
		arg_6_0:RefreshOtherModel(arg_6_0.view_data)
	else
		arg_6_0:RefreshCommonModel()
	end

	if arg_6_0.actor then
		arg_6_0.actor:SetSceneID(arg_6_0:GetCurScene())
		arg_6_0.actor:UpdateViewTag(arg_6_0.view_tag)
		arg_6_0.actor:DoInit(arg_6_0.view_tag)
	end
end

function var_0_0.RefreshCommonModel(arg_7_0)
	local var_7_0 = PlayerData:GetPlayerInfo()
	local var_7_1

	if arg_7_0.view_tag == PosterGirlConst.ViewTag.preview then
		var_7_1 = arg_7_0.view_data
	else
		var_7_1 = PlayerData:GetPosterGirlHeroSkinId()
	end

	local var_7_2 = SkinCfg[var_7_1]
	local var_7_3 = SkinSceneActionCfg[var_7_1]
	local var_7_4 = arg_7_0:GetCurScene()

	if var_7_3 and (var_7_3.special_scene_id == var_7_4 or var_7_3.special_scene_id_2 == var_7_4) then
		local var_7_5 = var_7_3.special_scene_id == var_7_4 and var_7_3.special_action or var_7_3.special_action_2

		if arg_7_0.actor and arg_7_0.actor:GetSkinId() == var_7_1 and arg_7_0.actor:GetModelId() == var_7_5 then
			return
		end

		if arg_7_0.actor then
			arg_7_0.actor:Dispose()
		end

		if HomeSceneSettingCfg[var_7_4].limit_display == 0 then
			arg_7_0.actor = PosterGirlDlcActor.New(var_7_1, var_7_5)
		else
			arg_7_0.actor = PosterTzeroActor.New(var_7_1, var_7_5)
		end
	else
		local var_7_6 = var_7_2.main_model_id

		if arg_7_0.actor and arg_7_0.actor:GetSkinId() == var_7_1 and arg_7_0.actor:GetModelId() == var_7_6 then
			return
		end

		if arg_7_0.actor then
			arg_7_0.actor:Dispose()
		end

		arg_7_0.actor = PosterCommonActor.New(var_7_1, var_7_6)
	end
end

function var_0_0.RefreshOtherModel(arg_8_0, arg_8_1)
	local var_8_0 = SkinCfg[arg_8_1].main_model_id

	if arg_8_0.actor and arg_8_0.actor:GetSkinId() == arg_8_1 and arg_8_0.actor:GetModelId() == var_8_0 then
		return
	end

	if arg_8_0.actor then
		arg_8_0.actor:Dispose()
	end

	arg_8_0.actor = PosterCommonActor.New(arg_8_1, var_8_0)
end

function var_0_0.GetTag(arg_9_0)
	if arg_9_0.actor then
		return arg_9_0.actor:GetTag()
	end

	return PosterGirlConst.PosterGirlTag.null
end

function var_0_0.GetModel(arg_10_0)
	if arg_10_0.actor then
		return arg_10_0.actor:GetModel()
	end
end

function var_0_0.GetViewDirect(arg_11_0)
	if arg_11_0.actor then
		return arg_11_0.actor:GetViewDirect()
	end

	return 0
end

function var_0_0.GetCurScene(arg_12_0)
	if arg_12_0.view_tag == PosterGirlConst.ViewTag.preview then
		return HomeSceneSettingData:GetPreviewScene()
	else
		return HomeSceneSettingData:GetCurScene()
	end
end

function var_0_0.Dispose(arg_13_0)
	if arg_13_0.actor then
		arg_13_0.actor:Dispose()
	end

	arg_13_0.actor = nil
	arg_13_0.view_tag = PosterGirlConst.ViewTag.null
end

function var_0_0.SetForceRandomIndex(arg_14_0, arg_14_1)
	arg_14_0.randomIndex = arg_14_1
end

function var_0_0.GetForceRandomIndex(arg_15_0)
	local var_15_0 = arg_15_0.randomIndex

	arg_15_0.randomIndex = nil

	return var_15_0
end

function var_0_0.CheckDebut(arg_16_0)
	if not arg_16_0.actor then
		return false
	end

	return arg_16_0.actor:CheckDebut()
end

function var_0_0.SkipDebut(arg_17_0)
	if not arg_17_0.actor then
		return false
	end

	return arg_17_0.actor:SkipDebut()
end

function var_0_0.IsPlayingDebut(arg_18_0)
	if arg_18_0.actor then
		return arg_18_0.actor:IsPlayingDebut()
	end

	return false
end

function var_0_0.DoShacking(arg_19_0)
	if arg_19_0.actor and #arg_19_0.actor:GetInteractionCfg()[PosterGirlConst.InteractionKey.shaking] ~= 0 then
		arg_19_0.actor:DoShacking()
	end
end

function var_0_0.DoTouch(arg_20_0)
	if arg_20_0.actor and #arg_20_0.actor:GetInteractionCfg()[PosterGirlConst.InteractionKey.mainTouch] ~= 0 then
		arg_20_0.actor:DoTouch()
	end
end

function var_0_0.DoQuickTouch(arg_21_0)
	if arg_21_0.actor and #arg_21_0.actor:GetInteractionCfg()[PosterGirlConst.InteractionKey.mainQuickTouch] ~= 0 then
		arg_21_0.actor:DoQuickTouch()
	end
end

function var_0_0.DoShowing(arg_22_0)
	if arg_22_0.actor and #arg_22_0.actor:GetInteractionCfg()[PosterGirlConst.InteractionKey.showing] ~= 0 then
		arg_22_0.actor:DoShowing()
	end
end

function var_0_0.DoGreeting(arg_23_0)
	if arg_23_0.actor and #arg_23_0.actor:GetInteractionCfg()[PosterGirlConst.InteractionKey.greeting] ~= 0 then
		arg_23_0.actor:DoGreeting()
	end
end

function var_0_0.DoIdle(arg_24_0)
	if arg_24_0.actor and #arg_24_0.actor:GetInteractionCfg()[PosterGirlConst.InteractionKey.idle] ~= 0 then
		arg_24_0.actor:DoIdle()
	end
end

function var_0_0.InitTouchHelp(arg_25_0, arg_25_1)
	if arg_25_0.actor then
		arg_25_0.actor:InitTouchHelp(arg_25_1)
	end
end

function var_0_0.TouchHelpIdle(arg_26_0)
	if arg_26_0.actor then
		arg_26_0.actor:TouchHelpIdle()
	end
end

function var_0_0.TouchHelpSingleDrag(arg_27_0, arg_27_1, arg_27_2)
	if arg_27_0.actor then
		arg_27_0.actor:TouchHelpSingleDrag(arg_27_1, arg_27_2)
	end
end

function var_0_0.TouchHelpMutiDrag(arg_28_0, arg_28_1)
	if arg_28_0.actor then
		arg_28_0.actor:TouchHelpMutiDrag(arg_28_1)
	end
end

function var_0_0.SwipeToLeft(arg_29_0)
	if arg_29_0.actor then
		arg_29_0.actor:SwipeToLeft()
	end
end

function var_0_0.SwipeToRight(arg_30_0)
	if arg_30_0.actor then
		arg_30_0.actor:SwipeToRight()
	end
end

function var_0_0.GetCurrentState(arg_31_0)
	if arg_31_0.actor then
		local var_31_0 = arg_31_0.actor:GetCurrentState()

		if var_31_0 then
			return var_31_0:GetStateKey()
		end
	end

	return PosterGirlConst.StateKay.init
end

function var_0_0.GetInteractionsTimes(arg_32_0)
	if arg_32_0.actor then
		return arg_32_0.actor:GetInteractionsTimes()
	end

	return 0
end

function var_0_0.EndDrag(arg_33_0)
	if arg_33_0.actor then
		arg_33_0.actor:DOEndDrag()
	end
end

return var_0_0
