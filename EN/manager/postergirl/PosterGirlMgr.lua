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

function var_0_0.SetViewTag(arg_3_0, arg_3_1, arg_3_2)
	if arg_3_1 == arg_3_0.view_tag then
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

function var_0_0.RefreshModel(arg_5_0)
	if arg_5_0.view_tag == PosterGirlConst.ViewTag.playerInfo_other then
		arg_5_0:RefreshOtherModel(arg_5_0.view_data)
	else
		arg_5_0:RefreshCommonModel()
	end

	if arg_5_0.actor then
		arg_5_0.actor:UpdateViewTag(arg_5_0.view_tag)
		arg_5_0.actor:DoInit(arg_5_0.view_tag)
	end
end

function var_0_0.RefreshCommonModel(arg_6_0)
	local var_6_0 = PlayerData:GetPlayerInfo().poster_girl
	local var_6_1 = HeroTools.HeroUsingSkinInfo(var_6_0).id
	local var_6_2 = SkinCfg[var_6_1]
	local var_6_3 = SkinSceneActionCfg[var_6_1]
	local var_6_4 = HomeSceneSettingData:GetCurScene()

	if var_6_3 and var_6_3.special_scene_id == var_6_4 then
		local var_6_5 = var_6_3.special_action

		if arg_6_0.actor and arg_6_0.actor:GetSkinId() == var_6_1 and arg_6_0.actor:GetModelId() == var_6_5 then
			return
		end

		if arg_6_0.actor then
			arg_6_0.actor:Dispose()
		end

		if HomeSceneSettingCfg[var_6_4].limit_display == 0 then
			arg_6_0.actor = PosterGirlDlcActor.New(var_6_1, var_6_5)
		else
			arg_6_0.actor = PosterTzeroActor.New(var_6_1, var_6_5)
		end
	else
		local var_6_6 = var_6_2.main_model_id

		if arg_6_0.actor and arg_6_0.actor:GetSkinId() == var_6_1 and arg_6_0.actor:GetModelId() == var_6_6 then
			return
		end

		if arg_6_0.actor then
			arg_6_0.actor:Dispose()
		end

		arg_6_0.actor = PosterCommonActor.New(var_6_1, var_6_6)
	end
end

function var_0_0.RefreshOtherModel(arg_7_0, arg_7_1)
	local var_7_0 = SkinCfg[arg_7_1].main_model_id

	if arg_7_0.actor and arg_7_0.actor:GetSkinId() == arg_7_1 and arg_7_0.actor:GetModelId() == var_7_0 then
		return
	end

	if arg_7_0.actor then
		arg_7_0.actor:Dispose()
	end

	arg_7_0.actor = PosterCommonActor.New(arg_7_1, var_7_0)
end

function var_0_0.GetTag(arg_8_0)
	if arg_8_0.actor then
		return arg_8_0.actor:GetTag()
	end

	return PosterGirlConst.PosterGirlTag.null
end

function var_0_0.GetViewDirect(arg_9_0)
	if arg_9_0.actor then
		return arg_9_0.actor:GetViewDirect()
	end

	return 0
end

function var_0_0.Dispose(arg_10_0)
	if arg_10_0.actor then
		arg_10_0.actor:Dispose()
	end

	arg_10_0.actor = nil
	arg_10_0.view_tag = PosterGirlConst.ViewTag.null
end

function var_0_0.SetForceRandomIndex(arg_11_0, arg_11_1)
	arg_11_0.randomIndex = arg_11_1
end

function var_0_0.GetForceRandomIndex(arg_12_0)
	local var_12_0 = arg_12_0.randomIndex

	arg_12_0.randomIndex = nil

	return var_12_0
end

function var_0_0.CheckDebut(arg_13_0)
	if not arg_13_0.actor then
		return false
	end

	return arg_13_0.actor:CheckDebut()
end

function var_0_0.SkipDebut(arg_14_0)
	if not arg_14_0.actor then
		return false
	end

	return arg_14_0.actor:SkipDebut()
end

function var_0_0.IsPlayingDebut(arg_15_0)
	if arg_15_0.actor then
		return arg_15_0.actor:IsPlayingDebut()
	end

	return false
end

function var_0_0.DoShacking(arg_16_0)
	if arg_16_0.actor and #arg_16_0.actor:GetInteractionCfg()[PosterGirlConst.InteractionKey.shaking] ~= 0 then
		arg_16_0.actor:DoShacking()
	end
end

function var_0_0.DoTouch(arg_17_0)
	if arg_17_0.actor and #arg_17_0.actor:GetInteractionCfg()[PosterGirlConst.InteractionKey.mainTouch] ~= 0 then
		arg_17_0.actor:DoTouch()
	end
end

function var_0_0.DoQuickTouch(arg_18_0)
	if arg_18_0.actor and #arg_18_0.actor:GetInteractionCfg()[PosterGirlConst.InteractionKey.mainQuickTouch] ~= 0 then
		arg_18_0.actor:DoQuickTouch()
	end
end

function var_0_0.DoShowing(arg_19_0)
	if arg_19_0.actor and #arg_19_0.actor:GetInteractionCfg()[PosterGirlConst.InteractionKey.showing] ~= 0 then
		arg_19_0.actor:DoShowing()
	end
end

function var_0_0.DoGreeting(arg_20_0)
	if arg_20_0.actor and #arg_20_0.actor:GetInteractionCfg()[PosterGirlConst.InteractionKey.greeting] ~= 0 then
		arg_20_0.actor:DoGreeting()
	end
end

function var_0_0.DoIdle(arg_21_0)
	if arg_21_0.actor and #arg_21_0.actor:GetInteractionCfg()[PosterGirlConst.InteractionKey.idle] ~= 0 then
		arg_21_0.actor:DoIdle()
	end
end

function var_0_0.InitTouchHelp(arg_22_0, arg_22_1)
	if arg_22_0.actor then
		arg_22_0.actor:InitTouchHelp(arg_22_1)
	end
end

function var_0_0.TouchHelpIdle(arg_23_0)
	if arg_23_0.actor then
		arg_23_0.actor:TouchHelpIdle()
	end
end

function var_0_0.TouchHelpSingleDrag(arg_24_0, arg_24_1, arg_24_2)
	if arg_24_0.actor then
		arg_24_0.actor:TouchHelpSingleDrag(arg_24_1, arg_24_2)
	end
end

function var_0_0.TouchHelpMutiDrag(arg_25_0, arg_25_1)
	if arg_25_0.actor then
		arg_25_0.actor:TouchHelpMutiDrag(arg_25_1)
	end
end

return var_0_0
