local var_0_0 = class("HeroRaiseTrackMgr")

function var_0_0.Ctor(arg_1_0)
	arg_1_0.view_ui = nil
	arg_1_0.view_data = nil
	arg_1_0.last_view_ui = nil
	arg_1_0.last_view_data = nil
	arg_1_0.track = nil
	arg_1_0.raiseModel = nil
	arg_1_0.touchView_ = nil
	arg_1_0.servantTrackController = nil
	arg_1_0.astrolableController = nil

	arg_1_0:Init()

	arg_1_0.sceneTxAni_ = nil
	arg_1_0.breakFx_ = nil
	arg_1_0.afterModelLoadedCallback_ = {}
end

function var_0_0.Init(arg_2_0)
	arg_2_0.view_ui = HeroRaiseTrackConst.ViewType.null
	arg_2_0.view_data = {}
	arg_2_0.last_view_ui = HeroRaiseTrackConst.ViewType.null
	arg_2_0.last_view_data = {}
	arg_2_0.track = HeroRaiseTrack.New()
	arg_2_0.raiseModel = HeroRaiseModel.New()
	arg_2_0.astrolableController = NormalAstrolabe.New()
end

function var_0_0.Dispose(arg_3_0)
	if arg_3_0.track then
		arg_3_0.track:Dispose()
	end

	if arg_3_0.raiseModel then
		arg_3_0.raiseModel:Dispose()
	end

	if arg_3_0.touchView_ then
		arg_3_0.touchView_:Dispose()
	end

	if arg_3_0.breakFx_ then
		arg_3_0.breakFx_:Dispose()

		arg_3_0.breakFx_ = nil
	end

	arg_3_0:UnloadSceneAni()
	arg_3_0:UnloadAstrolabe()
	arg_3_0:RemoveTween()

	arg_3_0.view_ui = HeroRaiseTrackConst.ViewType.null
	arg_3_0.view_data = {}
	arg_3_0.last_view_ui = HeroRaiseTrackConst.ViewType.null
	arg_3_0.last_view_data = {}
	arg_3_0.sceneTxAni_ = nil
end

function var_0_0._PreloadModelAsync(arg_4_0, arg_4_1)
	if arg_4_0.isAsyncLoading_ then
		if arg_4_0.curLoadingSkinId_ == arg_4_1 then
			return
		end

		arg_4_0.afterModelLoadedCallback_[arg_4_0.curLoadingSkinId_] = nil
	end

	if arg_4_0.raiseModel:GetSkinID() == arg_4_1 then
		arg_4_0.afterModelLoadedCallback_[arg_4_1] = nil
		arg_4_0.isAsyncLoading_ = false
		arg_4_0.curLoadingSkinId_ = nil
		arg_4_0.curLoadingModelId_ = nil

		return
	end

	arg_4_0.isAsyncLoading_ = true

	local var_4_0 = SkinCfg[arg_4_1]

	arg_4_0.curLoadingSkinId_ = arg_4_1
	arg_4_0.curLoadingModelId_ = var_4_0.modelId

	local var_4_1 = manager.heroUiTimeline:GetModelPath(arg_4_0.curLoadingSkinId_, arg_4_0.curLoadingModelId_)

	manager.resourcePool:AsyncLoad(var_4_1, ASSET_TYPE.TPOSE, function(arg_5_0)
		manager.resourcePool:DestroyOrReturn(arg_5_0, ASSET_TYPE.TPOSE)

		local var_5_0 = arg_4_0.afterModelLoadedCallback_[arg_4_1]

		if var_5_0 then
			for iter_5_0, iter_5_1 in ipairs(var_5_0) do
				iter_5_1()
			end
		end

		arg_4_0.afterModelLoadedCallback_[arg_4_1] = nil
		arg_4_0.isAsyncLoading_ = false
		arg_4_0.curLoadingSkinId_ = nil
		arg_4_0.curLoadingModelId_ = nil
	end)
end

function var_0_0._AfterModelLoaded(arg_6_0, arg_6_1)
	if arg_6_0.isAsyncLoading_ then
		local var_6_0 = arg_6_0.curLoadingSkinId_
		local var_6_1 = arg_6_0.afterModelLoadedCallback_[var_6_0] or {}

		table.insert(var_6_1, arg_6_1)

		arg_6_0.afterModelLoadedCallback_[var_6_0] = var_6_1
	else
		arg_6_1()
	end
end

function var_0_0.SetModelState(arg_7_0, arg_7_1)
	arg_7_0:_PreloadModelAsync(arg_7_1)
	arg_7_0:_AfterModelLoaded(function()
		arg_7_0:_SetModelStateSync(arg_7_1)
	end)
end

function var_0_0._SetModelStateSync(arg_9_0, arg_9_1)
	local var_9_0 = false

	if arg_9_0.raiseModel and arg_9_0.raiseModel:GetSkinID() ~= arg_9_1 then
		arg_9_0:RefreshTrackState(arg_9_1)
		arg_9_0:RefreshCameraState(arg_9_1)
		arg_9_0:RemainAni()
		arg_9_0:RefreshTouchHero()
		arg_9_0:RefreshSceneAni()
	end
end

function var_0_0.SetViewState(arg_10_0, arg_10_1, arg_10_2, arg_10_3)
	local var_10_0 = false

	if arg_10_1 and arg_10_0.view_ui ~= arg_10_1 then
		arg_10_0.last_view_ui = arg_10_0.view_ui
		arg_10_0.view_ui = arg_10_1
		var_10_0 = true
	end

	if arg_10_2 then
		if not arg_10_2[3] then
			arg_10_2[3] = 0
		end

		if arg_10_0.view_data[1] ~= arg_10_2[1] or arg_10_0.view_data[2] ~= arg_10_2[2] or arg_10_0.view_data[3] ~= arg_10_2[3] then
			if arg_10_2[1] then
				if arg_10_0.view_data then
					arg_10_0.last_view_data[1] = arg_10_0.view_data[1] or nil
				end

				arg_10_0.view_data[1] = arg_10_2[1]
				var_10_0 = true
			end

			if arg_10_2[2] then
				if arg_10_0.view_data then
					arg_10_0.last_view_data[2] = arg_10_0.view_data[2] or nil
				end

				arg_10_0.view_data[2] = arg_10_2[2]
				var_10_0 = true
			end

			if arg_10_2[3] then
				if arg_10_0.view_data then
					arg_10_0.last_view_data[3] = arg_10_0.view_data[3] or nil
				end

				arg_10_0.view_data[3] = arg_10_2[3]
				var_10_0 = true
			else
				arg_10_0.last_view_data[3] = arg_10_0.view_data[3] or nil
				arg_10_0.view_data[3] = 0
			end
		end
	end

	if var_10_0 then
		arg_10_0:RefreshCameraState()
		arg_10_0:RefreshAni()
		arg_10_0:RefreshSceneAni()
	end

	if arg_10_3 then
		arg_10_0:RefreshTouchView(arg_10_3)
		arg_10_0:RefreshTouchHero()
	else
		arg_10_0:RefreshTouchView(nil)
	end
end

function var_0_0.CheckEffect(arg_11_0)
	if arg_11_0.view_data and arg_11_0.view_ui == HeroRaiseTrackConst.ViewType.heroRaiseCommon then
		local var_11_0 = arg_11_0.view_data[1]

		if var_11_0 == HeroRaiseTrackConst.HeroRaiseType.attr or var_11_0 == HeroRaiseTrackConst.HeroRaiseType.skill then
			arg_11_0.raiseModel:PlayEffect()
		end
	end
end

function var_0_0.PlayTalk(arg_12_0)
	arg_12_0:_AfterModelLoaded(function()
		if arg_12_0.raiseModel then
			arg_12_0.raiseModel:PlayTalk()
		end
	end)
end

function var_0_0.RefreshTrackState(arg_14_0, arg_14_1)
	local var_14_0 = SkinCfg[arg_14_1].hero
	local var_14_1 = HeroPosAndRotCfg[var_14_0]
	local var_14_2 = var_14_1.hero_view_height

	arg_14_0.raiseModel:SetSkinID(arg_14_1)
	arg_14_0.raiseModel:PlayEffect()
	arg_14_0.track:SetTrackData(var_14_1.hero_view_height)
end

function var_0_0.RefreshCameraState(arg_15_0)
	if not arg_15_0.view_ui then
		return
	end

	if isNil(arg_15_0.brain) then
		arg_15_0.brain = manager.ui:AddMainCameraCom(typeof(CinemachineBrain))
	end

	if arg_15_0.view_ui == HeroRaiseTrackConst.ViewType.null then
		arg_15_0:UnloadSceneAni()
		arg_15_0:UnloadWeaponServant()

		if not isNil(arg_15_0.brain) then
			arg_15_0.brain.m_CustomBlends = nil
		end

		manager.ui:SetMainCameraCom("CinemachineBrain", false)
		manager.ui:ResetMainCamera()
		arg_15_0.track:SetActive(false)
		arg_15_0:SetAstrolableAtive(false)

		arg_15_0.lastState_ = HeroRaiseTrackConst.ModelState.none

		arg_15_0.raiseModel:Finish()

		arg_15_0.view_ui = HeroRaiseTrackConst.ViewType.null
		arg_15_0.view_data = {}
		arg_15_0.last_view_ui = HeroRaiseTrackConst.ViewType.null
		arg_15_0.last_view_data = {}
	elseif arg_15_0.view_ui == HeroRaiseTrackConst.ViewType.heroRaiseCommon then
		arg_15_0:LoadSceneAni()

		if not isNil(arg_15_0.brain) and isNil(arg_15_0.brain.m_CustomBlends) then
			arg_15_0.brain.m_CustomBlends = Asset.Load("UI/HeroCamera/CameraData/MainCamera_Blends.asset")
		end

		manager.ui:SetMainCameraCom("CinemachineBrain", true)
		manager.ui:SetMainCamera("hero")
		arg_15_0.track:SetActive(true)

		if arg_15_0.view_data then
			local var_15_0 = arg_15_0.view_data[1] * 10 + arg_15_0.view_data[2] or 10
			local var_15_1 = arg_15_0.view_data[1]
			local var_15_2 = arg_15_0.view_data[3] or 0

			arg_15_0.track:ChangeCamera(var_15_0)

			local var_15_3 = false
			local var_15_4 = false

			if var_15_1 == HeroRaiseTrackConst.HeroRaiseType.weapon then
				if var_15_2 ~= HeroRaiseTrackConst.HeroServantType.weapon then
					var_15_3 = true
				else
					var_15_4 = true
				end
			end

			if var_15_3 then
				arg_15_0:LoadWeaponServant()
			else
				arg_15_0:UnloadWeaponServant(var_15_4)
			end

			arg_15_0.lastState_ = arg_15_0.raiseModel:GetState()

			if var_15_1 == HeroRaiseTrackConst.HeroRaiseType.attr then
				arg_15_0.raiseModel:SetState(HeroRaiseTrackConst.ModelState.hero)
			elseif var_15_1 == HeroRaiseTrackConst.HeroRaiseType.skill then
				arg_15_0.raiseModel:SetState(HeroRaiseTrackConst.ModelState.hero)
			elseif var_15_1 == HeroRaiseTrackConst.HeroRaiseType.weapon then
				if var_15_2 == HeroRaiseTrackConst.HeroServantType.servant then
					arg_15_0.raiseModel:SetState(HeroRaiseTrackConst.ModelState.none)
				else
					arg_15_0.raiseModel:SetState(HeroRaiseTrackConst.ModelState.weapon)
				end
			elseif var_15_1 == HeroRaiseTrackConst.HeroRaiseType.equip then
				arg_15_0.raiseModel:SetState(HeroRaiseTrackConst.ModelState.none)
			elseif var_15_1 == HeroRaiseTrackConst.HeroRaiseType.transition then
				arg_15_0.raiseModel:SetState(HeroRaiseTrackConst.ModelState.none)
			elseif var_15_1 == HeroRaiseTrackConst.HeroRaiseType.astrolabe then
				arg_15_0.raiseModel:SetState(HeroRaiseTrackConst.ModelState.hero)
			elseif var_15_1 == HeroRaiseTrackConst.HeroRaiseType.chip then
				arg_15_0.raiseModel:SetState(HeroRaiseTrackConst.ModelState.hero)
			end

			if HeroRaiseTrackConst.HeroRaiseRotate[var_15_0] then
				arg_15_0:PlayModelRotation(HeroRaiseTrackConst.HeroRaiseRotate[var_15_0])
			else
				arg_15_0:PlayModelRotation()
			end
		end
	end
end

function var_0_0.RefreshTouchView(arg_16_0, arg_16_1)
	if arg_16_0.touchView_ then
		arg_16_0.touchView_:Dispose()

		arg_16_0.touchView_ = nil
	end

	if isNil(arg_16_1) then
		return
	end

	arg_16_0.touchView_ = HeroRaiseModelToucherView.New(arg_16_1)
end

function var_0_0.RefreshTouchHero(arg_17_0)
	if arg_17_0.touchView_ then
		local var_17_0 = arg_17_0.raiseModel:GetRotateGo()

		if not isNil(var_17_0) then
			arg_17_0.touchView_:SetRotateNode(var_17_0.transform)
		end
	end
end

function var_0_0.RefreshAstrolabeColor(arg_18_0, arg_18_1)
	local var_18_0 = manager.ui:GetSceneSettingBySceneName("X100")

	if var_18_0 then
		if arg_18_1 then
			arg_18_0:CreateTimer(var_18_0, ASTROLABE_COLOR[1], ASTROLABE_COLOR[2], ASTROLABE_COLOR[3])
		else
			arg_18_0:CreateTimer(var_18_0, 1, 1, 1)
		end
	end
end

function var_0_0.CreateTimer(arg_19_0, arg_19_1, arg_19_2, arg_19_3, arg_19_4)
	arg_19_0:RemoveTween()

	local var_19_0 = arg_19_1.probeLightingBase.r
	local var_19_1 = arg_19_1.probeLightingBase.g
	local var_19_2 = arg_19_1.probeLightingBase.b

	arg_19_0.tweenValue_ = LeanTween.value(0, 1, ASTROLABE_COLOR_TIME):setOnUpdate(LuaHelper.FloatAction(function(arg_20_0)
		localR = Mathf.Lerp(var_19_0, arg_19_2, arg_20_0)
		localG = Mathf.Lerp(var_19_1, arg_19_3, arg_20_0)
		localB = Mathf.Lerp(var_19_2, arg_19_4, arg_20_0)
		arg_19_1.probeLightingBase = Color.New(localR, localG, localB)
	end)):setOnComplete(LuaHelper.VoidAction(function()
		arg_19_0:RemoveTween()
	end))
end

function var_0_0.RemoveTween(arg_22_0)
	if arg_22_0.tweenValue_ then
		arg_22_0.tweenValue_:setOnComplete(nil):setOnUpdate(nil):setEase(nil)
		LeanTween.cancel(arg_22_0.tweenValue_.id)

		arg_22_0.tweenValue_ = nil
	end
end

function var_0_0.RemainAni(arg_23_0)
	if arg_23_0.raiseModel:GetState() == HeroRaiseTrackConst.ModelState.hero and arg_23_0.view_data and arg_23_0.view_data[1] and arg_23_0.view_data[2] then
		local var_23_0 = arg_23_0.view_data[1] * 10 + arg_23_0.view_data[2] or 10

		arg_23_0.raiseModel:SwitchAni("", HeroRaiseTrackConst.HeroAniName[var_23_0])
	end
end

function var_0_0.RefreshAni(arg_24_0)
	if arg_24_0.view_data and arg_24_0.view_data[1] and arg_24_0.view_data[2] then
		if arg_24_0.breakFx_ == nil then
			arg_24_0.breakFx_ = HeroRaiseCameraTx.New()

			arg_24_0.breakFx_:Init("UI/HeroGodHood/TX_Property_Break_01.prefab")
		end

		local var_24_0 = arg_24_0.view_data[1] * 10 + arg_24_0.view_data[2] or 10
		local var_24_1 = 0

		if arg_24_0.last_view_data and arg_24_0.last_view_data[1] and arg_24_0.last_view_data[2] then
			var_24_1 = arg_24_0.last_view_data[1] * 10 + arg_24_0.last_view_data[2] or 0
		end

		if var_24_0 == 12 then
			arg_24_0.breakFx_:PlayAnim("TX_Property_Break_star")
		elseif var_24_1 == 12 then
			arg_24_0.breakFx_:PlayAnim("TX_Property_Break_end")
		end

		local var_24_2 = {}

		if (var_24_0 ~= 12 or var_24_1 ~= 21) and (var_24_0 ~= 21 or var_24_1 ~= 12) then
			table.insert(var_24_2, HeroRaiseTrackConst.HeroAniName[var_24_1] or "")
			table.insert(var_24_2, HeroRaiseTrackConst.HeroAniName[var_24_0] or "")
			arg_24_0.raiseModel:SwitchAni(var_24_2[1], var_24_2[2])
		elseif var_24_0 == 12 and var_24_1 == 21 then
			arg_24_0.raiseModel:RemainAni(HeroRaiseTrackConst.HeroAniName[21])
		end
	elseif arg_24_0.breakFx_ then
		arg_24_0.breakFx_:Dispose()

		arg_24_0.breakFx_ = nil
	end
end

function var_0_0.RefreshSceneAni(arg_25_0)
	if arg_25_0.view_data and arg_25_0.view_data[1] and arg_25_0.view_data[2] then
		local var_25_0 = arg_25_0.view_data[1] * 10 + arg_25_0.view_data[2] or 10
		local var_25_1 = 0

		if arg_25_0.last_view_data and arg_25_0.last_view_data[1] and arg_25_0.last_view_data[2] then
			var_25_1 = arg_25_0.last_view_data[1] * 10 + arg_25_0.last_view_data[2] or 0
		end

		if var_25_0 == 10 or var_25_0 == 20 then
			if var_25_1 ~= 10 and var_25_1 ~= 20 then
				arg_25_0:PlaySceneAni("TX_Property_Corrector_star1")
			else
				arg_25_0:PlaySceneAni("TX_Property_Corrector_stand")
			end
		elseif var_25_1 ~= 10 and var_25_1 ~= 20 then
			arg_25_0:PlaySceneAni("TX_Property_Corrector_hide")
		else
			arg_25_0:PlaySceneAni("TX_Property_Corrector_end1")
		end
	end
end

function var_0_0.RemainSceneAni(arg_26_0)
	if arg_26_0.view_data and arg_26_0.view_data[1] and arg_26_0.view_data[2] then
		local var_26_0 = arg_26_0.view_data[1] * 10 + arg_26_0.view_data[2] or 10

		if var_26_0 == 10 or var_26_0 == 20 then
			arg_26_0:PlaySceneAni("TX_Property_Corrector_stand")
		end
	end
end

function var_0_0.PlaySceneAni(arg_27_0, arg_27_1)
	if isNil(arg_27_0.sceneTxAni_) then
		return
	end

	arg_27_0.sceneTxAni_:Play(arg_27_1)
	arg_27_0.sceneTxAni_:Update(0)
end

function var_0_0.LoadSceneAni(arg_28_0)
	if isNil(arg_28_0.sceneTxTrans_) then
		local var_28_0 = SceneManager.GetSceneByName("X100")
		local var_28_1 = var_28_0:GetRootGameObjects()
		local var_28_2

		if var_28_1 ~= nil then
			for iter_28_0 = 0, var_28_1.Length - 1 do
				if var_28_1[iter_28_0].name == var_28_0.name then
					var_28_2 = var_28_1[iter_28_0]

					break
				end
			end
		end

		arg_28_0.sceneTxTrans_ = var_28_2.transform:Find("X100_base_003/TX_Property_Corrector")

		if arg_28_0.sceneTxTrans_ then
			arg_28_0.sceneTxAni_ = arg_28_0.sceneTxTrans_:GetComponentInChildren(typeof(Animator))
		end
	end
end

function var_0_0.UnloadSceneAni(arg_29_0)
	arg_29_0.sceneTxTrans_ = nil
	arg_29_0.sceneTxAni_ = nil
end

function var_0_0.RemoveTween(arg_30_0)
	if arg_30_0.tween then
		arg_30_0.tween:setOnComplete(nil)
		LeanTween.cancel(arg_30_0.m_arror.gameObject)

		arg_30_0.tween = nil
	end
end

function var_0_0.PlayModelRotation(arg_31_0, arg_31_1)
	if arg_31_0.raiseModel then
		arg_31_0.raiseModel:SetModelRotation(arg_31_1)
	end
end

function var_0_0.SetWeaponServantID(arg_32_0, arg_32_1)
	if arg_32_0.servantTrackController then
		arg_32_0.servantTrackController:SetServantID(arg_32_1)
	end
end

function var_0_0.LoadWeaponServant(arg_33_0)
	if arg_33_0.servantTrackController and arg_33_0.servantTrackController:CheckValid() then
		return
	end

	if arg_33_0.servantTrackController then
		arg_33_0.servantTrackController:Dispose()

		arg_33_0.servantTrackController = nil
	end

	local var_33_0 = Asset.Load("UI/HeroGodHood/TX_WeaponServant.prefab")
	local var_33_1 = Object.Instantiate(var_33_0, manager.ui.mainCamera.transform)

	if not isNil(var_33_1) then
		arg_33_0.servantTrackController = ServantTrackController.New()

		arg_33_0.servantTrackController:Init(var_33_1)
	end
end

function var_0_0.PlayServantAnim(arg_34_0, arg_34_1, arg_34_2)
	if arg_34_0.servantTrackController then
		arg_34_0.servantTrackController:PlayAnim(arg_34_1, arg_34_2)
	end
end

function var_0_0.UnloadWeaponServant(arg_35_0, arg_35_1)
	if arg_35_0.servantTrackController then
		if arg_35_1 then
			arg_35_0:PlayServantAnim("Fade")
		else
			arg_35_0.servantTrackController:Dispose()

			arg_35_0.servantTrackController = nil
		end
	end
end

function var_0_0.UnloadAstrolabe(arg_36_0)
	if arg_36_0.astrolableController then
		arg_36_0.astrolableController:Dispose()
	end
end

function var_0_0.SetAstrolableAtive(arg_37_0, arg_37_1)
	if arg_37_0.astrolableController then
		arg_37_0.astrolableController:SetActive(arg_37_1)

		if not arg_37_1 then
			arg_37_0:RefreshAstrolableState(AstrolabeConst.AnimationState.Hide)
		end
	end
end

function var_0_0.RefreshAstrolableState(arg_38_0, arg_38_1)
	if arg_38_0.astrolableController then
		arg_38_0.astrolableController:RefreshAnimationState(arg_38_1)
	end
end

return var_0_0
