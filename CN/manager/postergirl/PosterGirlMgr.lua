local var_0_0 = class("PosterGirlMgr")

function var_0_0.Ctor(arg_1_0)
	arg_1_0.view_tag = PosterGirlConst.ViewTag.null
	arg_1_0.view_data = nil
	arg_1_0.actor = nil
	arg_1_0.extraActor = nil
	arg_1_0.stateChangeFlag = true
	arg_1_0.isOnMiniGame = false
end

function var_0_0.Init(arg_2_0)
	arg_2_0.extraActor = {}
end

function var_0_0.SetStateCanChange(arg_3_0, arg_3_1)
	arg_3_0.stateChangeFlag = arg_3_1
end

function var_0_0.SetViewTag(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
	if not arg_4_3 and arg_4_1 == arg_4_0.view_tag then
		return
	end

	arg_4_0.view_tag = arg_4_1
	arg_4_0.view_data = arg_4_2

	if PosterGirlConst.ViewTag.null == arg_4_0.view_tag then
		arg_4_0:ExitMiniGame()
		arg_4_0:DisposeMainActor()
		arg_4_0:DisposeExtraActor()

		arg_4_0.extraActor = {}
	else
		arg_4_0:RefreshModel()
	end
end

function var_0_0.GetViewTag(arg_5_0)
	return arg_5_0.view_tag
end

function var_0_0.GetViewDirect(arg_6_0)
	if nullable(arg_6_0.actor, "GetViewDirect") then
		return arg_6_0.actor:GetViewDirect()
	end

	return PosterGirlConst.ViewDirect.center
end

function var_0_0.RefreshModel(arg_7_0)
	if arg_7_0.view_tag == PosterGirlConst.ViewTag.playerInfo_other then
		arg_7_0:RefreshOtherModel(arg_7_0.view_data)
	else
		arg_7_0:RefreshCommonModel()
	end

	if arg_7_0.actor then
		arg_7_0.actor:SetSceneID(arg_7_0:GetCurScene())
		arg_7_0.actor:UpdateViewTag(arg_7_0.view_tag)
		arg_7_0.actor:DoInit(arg_7_0.view_tag)
		arg_7_0:OpenPhysicsRaycaster()
	end
end

local function var_0_1(arg_8_0, arg_8_1)
	if arg_8_0 then
		if arg_8_0.special_scene_id == arg_8_1 then
			return arg_8_0.special_action
		elseif arg_8_0.special_scene_id_2 == arg_8_1 then
			return arg_8_0.special_action_2
		end
	end

	return nil
end

local function var_0_2(arg_9_0, arg_9_1)
	local var_9_0 = SkinCfg[arg_9_0]
	local var_9_1 = SkinSceneActionCfg[arg_9_0]
	local var_9_2 = var_0_1(var_9_1, arg_9_1)
	local var_9_3

	if var_9_2 then
		local var_9_4 = PosterGirlTools.IsTZeroViewPointCanLoopSwitch(arg_9_1)
		local var_9_5 = nullable(HomeSceneSettingCfg, arg_9_1, "limit_display") or 0

		if var_9_4 then
			var_9_3 = PosterTzeroPlusActor
		elseif var_9_5 == 0 then
			var_9_3 = PosterGirlDlcActor
		else
			var_9_3 = PosterTzeroActor
		end
	else
		var_9_2 = var_9_0.main_model_id
		var_9_3 = PosterCommonActor
	end

	return var_9_3, var_9_2
end

function var_0_0.RefreshCommonModel(arg_10_0)
	local var_10_0

	if arg_10_0.view_tag == PosterGirlConst.ViewTag.preview then
		var_10_0 = arg_10_0.view_data
	else
		var_10_0 = PlayerData:GetPosterGirlHeroSkinId()
	end

	local var_10_1 = SkinCfg[var_10_0]
	local var_10_2 = arg_10_0:GetCurScene()
	local var_10_3, var_10_4 = var_0_2(var_10_0, var_10_2)

	arg_10_0:RefreshOtherModel(var_10_0, var_10_4, var_10_3)
end

local function var_0_3(arg_11_0, arg_11_1, arg_11_2, arg_11_3)
	if arg_11_1 then
		arg_11_2 = arg_11_2 or SkinCfg[arg_11_1].main_model_id

		if arg_11_0 then
			if arg_11_0:GetSkinId() == arg_11_1 and arg_11_0:GetModelId() == arg_11_2 and arg_11_0:IsValid() then
				return arg_11_0, false
			end

			arg_11_0:Dispose()
		end

		arg_11_3 = arg_11_3 or PosterCommonActor
		arg_11_0 = arg_11_3.New(arg_11_1, arg_11_2)

		return arg_11_0, true
	else
		if arg_11_0 then
			arg_11_0:Dispose()
		end

		return nil
	end
end

function var_0_0.SwapExtraActorToMainActor(arg_12_0, arg_12_1)
	arg_12_0.actor, arg_12_0.extraActor[arg_12_1] = arg_12_0.extraActor[arg_12_1], arg_12_0.actor
end

function var_0_0.RefreshOtherModel(arg_13_0, arg_13_1, arg_13_2, arg_13_3, arg_13_4)
	local var_13_0
	local var_13_1

	if arg_13_4 then
		var_13_0 = arg_13_0.extraActor[arg_13_4]
		var_13_0, var_13_1 = var_0_3(var_13_0, arg_13_1, arg_13_2, arg_13_3)

		var_13_0:UseOwnHeroTimelineMgr()

		arg_13_0.extraActor[arg_13_4] = var_13_0
	else
		var_13_0 = arg_13_0.actor
		var_13_0, var_13_1 = var_0_3(var_13_0, arg_13_1, arg_13_2, arg_13_3)
		arg_13_0.actor = var_13_0
	end

	if var_13_1 then
		var_13_0:LoadModel()
	end

	return var_13_0
end

function var_0_0.GetTag(arg_14_0)
	if arg_14_0.actor then
		return arg_14_0.actor:GetTag()
	end

	return PosterGirlConst.PosterGirlTag.null
end

function var_0_0.GetModel(arg_15_0)
	if arg_15_0.actor then
		return arg_15_0.actor:GetModel()
	end
end

function var_0_0.GetViewDirect(arg_16_0)
	if arg_16_0.actor then
		return arg_16_0.actor:GetViewDirect()
	end

	return 0
end

function var_0_0.GetCurScene(arg_17_0)
	if arg_17_0.view_tag == PosterGirlConst.ViewTag.preview then
		return HomeSceneSettingData:GetPreviewScene()
	else
		local var_17_0 = HomeSceneSettingData:GetCurScene()

		return manager.loadScene:GetTimeSceneID(var_17_0)
	end
end

function var_0_0.Dispose(arg_18_0)
	arg_18_0:ExitMiniGame()
	arg_18_0:DisposeMainActor()
	arg_18_0:DisposeExtraActor()
	arg_18_0:RemoveAllEventListener()

	if not isNil(arg_18_0.raycaster) then
		arg_18_0.raycaster.enabled = false
	end

	arg_18_0.view_tag = PosterGirlConst.ViewTag.null
end

function var_0_0.RegistEventListener(arg_19_0, arg_19_1, arg_19_2)
	if not arg_19_0.registFunc_ then
		arg_19_0.registFunc_ = {}
	end

	if arg_19_0.registFunc_[arg_19_1] then
		manager.notify:RemoveListener(arg_19_1, arg_19_0.registFunc_[arg_19_1])
	end

	arg_19_0.registFunc_[arg_19_1] = arg_19_2

	manager.notify:RegistListener(arg_19_1, arg_19_2)
end

function var_0_0.RemoveAllEventListener(arg_20_0)
	if arg_20_0.registFunc_ then
		for iter_20_0, iter_20_1 in pairs(arg_20_0.registFunc_) do
			manager.notify:RemoveListener(iter_20_0, iter_20_1)
		end
	end
end

function var_0_0.DisposeMainActor(arg_21_0)
	if arg_21_0.actor then
		arg_21_0.actor:Dispose()
	end

	arg_21_0.actor = nil
end

function var_0_0.DisposeExtraActor(arg_22_0)
	if not arg_22_0.extraActor then
		return
	end

	for iter_22_0, iter_22_1 in pairs(arg_22_0.extraActor) do
		if iter_22_1 then
			iter_22_1:Dispose()
		end
	end

	arg_22_0.extraActor = nil
end

function var_0_0.SetForceRandomIndex(arg_23_0, arg_23_1)
	arg_23_0.randomIndex = arg_23_1
end

function var_0_0.GetForceRandomIndex(arg_24_0)
	local var_24_0 = arg_24_0.randomIndex

	arg_24_0.randomIndex = nil

	return var_24_0
end

function var_0_0.CheckDebut(arg_25_0)
	if not arg_25_0.actor then
		return false
	end

	return arg_25_0.actor:CheckDebut()
end

function var_0_0.SkipDebut(arg_26_0)
	if not arg_26_0.actor then
		return false
	end

	return arg_26_0.actor:SkipDebut()
end

function var_0_0.IsPlayingDebut(arg_27_0)
	if arg_27_0.actor then
		return arg_27_0.actor:IsPlayingDebut()
	end

	return false
end

function var_0_0.DoShacking(arg_28_0)
	if arg_28_0.actor and #arg_28_0.actor:GetInteractionCfg()[PosterGirlConst.InteractionKey.shaking] ~= 0 then
		arg_28_0.actor:DoShacking()
	end
end

function var_0_0.DoTouch(arg_29_0)
	if arg_29_0.actor and arg_29_0.actor:AcceptTouch() then
		arg_29_0.actor:DoTouch()
	end
end

function var_0_0.DoQuickTouch(arg_30_0)
	if arg_30_0.actor and #arg_30_0.actor:GetInteractionCfg()[PosterGirlConst.InteractionKey.mainQuickTouch] ~= 0 then
		arg_30_0.actor:DoQuickTouch()
	end
end

function var_0_0.DoShowing(arg_31_0)
	if arg_31_0.actor and #arg_31_0.actor:GetInteractionCfg()[PosterGirlConst.InteractionKey.showing] ~= 0 then
		arg_31_0.actor:DoShowing()
	end
end

function var_0_0.DoGreeting(arg_32_0)
	if arg_32_0.actor and #arg_32_0.actor:GetInteractionCfg()[PosterGirlConst.InteractionKey.greeting] ~= 0 then
		arg_32_0.actor:DoGreeting()
	end
end

function var_0_0.DoIdle(arg_33_0)
	if arg_33_0.actor and #arg_33_0.actor:GetInteractionCfg()[PosterGirlConst.InteractionKey.idle] ~= 0 then
		arg_33_0.actor:DoIdle()
	end
end

function var_0_0.InitTouchHelp(arg_34_0, arg_34_1)
	if arg_34_0.actor then
		arg_34_0.actor:InitTouchHelp(arg_34_1)
	end
end

function var_0_0.TouchHelpIdle(arg_35_0)
	if arg_35_0.actor then
		arg_35_0.actor:TouchHelpIdle()
	end
end

function var_0_0.TouchHelpSingleDrag(arg_36_0, arg_36_1, arg_36_2)
	if arg_36_0.actor then
		arg_36_0.actor:TouchHelpSingleDrag(arg_36_1, arg_36_2)
	end
end

function var_0_0.TouchHelpMutiDrag(arg_37_0, arg_37_1)
	if arg_37_0.actor then
		arg_37_0.actor:TouchHelpMutiDrag(arg_37_1)
	end
end

function var_0_0.SwipeToLeft(arg_38_0)
	if arg_38_0.actor and arg_38_0.actor.SwipeToLeft then
		arg_38_0.actor:SwipeToLeft()
	end
end

function var_0_0.SwipeToRight(arg_39_0)
	if arg_39_0.actor and arg_39_0.actor.SwipeToRight then
		arg_39_0.actor:SwipeToRight()
	end
end

function var_0_0.GetCurrentState(arg_40_0)
	if arg_40_0.actor then
		local var_40_0 = arg_40_0.actor:GetCurrentState()

		if var_40_0 then
			return var_40_0:GetStateKey()
		end
	end

	return PosterGirlConst.StateKay.init
end

function var_0_0.OpenPhysicsRaycaster(arg_41_0)
	arg_41_0.raycaster = manager.ui.mainCamera.gameObject:GetComponent(typeof(PhysicsRaycaster))

	if isNil(arg_41_0.raycaster) then
		arg_41_0.raycaster = manager.ui.mainCamera.gameObject:AddComponent(typeof(PhysicsRaycaster))
	end

	arg_41_0.raycaster.enabled = true
end

function var_0_0.EnterMiniGame(arg_42_0, arg_42_1)
	local var_42_0 = arg_42_0.actor:GetCurrentState():GetStateKey()
	local var_42_1 = var_42_0 == PosterGirlConst.StateKay.init or var_42_0 == PosterGirlConst.StateKay.init_spec or var_42_0 == PosterGirlConst.StateKay.init_no_blend

	print("EnterMiniGame", var_42_1, var_42_0)

	if var_42_1 and not arg_42_0.isOnMiniGame then
		manager.windowBar:HideBar()

		arg_42_0.isOnMiniGame = true

		if arg_42_1 == PosterGirlConst.MiniGameKey.DanceGame then
			DanceGameManager.StartGame()
		elseif arg_42_1 == PosterGirlConst.MiniGameKey.DrawCardGame then
			DrawCardGameManager.StartGame()
		elseif arg_42_1 == PosterGirlConst.MiniGameKey.GuelGame then
			GuelGameAcion.StartGame()
		end
	end
end

function var_0_0.ExitMiniGame(arg_43_0)
	arg_43_0.isOnMiniGame = false
end

function var_0_0.GetMiniGameState(arg_44_0)
	return arg_44_0.isOnMiniGame
end

function var_0_0.GetInteractionsTimes(arg_45_0)
	if arg_45_0.actor then
		return arg_45_0.actor:GetInteractionsTimes()
	end

	return 0
end

function var_0_0.EndDrag(arg_46_0)
	if arg_46_0.actor then
		arg_46_0.actor:DOEndDrag()
	end
end

return var_0_0
