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
		arg_4_0.isAsyncLoading_ = nil
		arg_4_0.curLoadingSkinId_ = nil
		arg_4_0.curLoadingModelId_ = nil

		return
	end

	local var_4_0 = SkinCfg[arg_4_1]

	arg_4_0.curLoadingSkinId_ = arg_4_1
	arg_4_0.curLoadingModelId_ = var_4_0.modelId

	local var_4_1 = HeroUITimelineMgr.GetModelPath(arg_4_0.curLoadingSkinId_, arg_4_0.curLoadingModelId_)
	local var_4_2 = true

	arg_4_0.isAsyncLoading_ = manager.resourcePool:AsyncLoad(var_4_1, ASSET_TYPE.TPOSE, function(arg_5_0)
		manager.resourcePool:DestroyOrReturn(arg_5_0, ASSET_TYPE.TPOSE)

		local var_5_0 = arg_4_0.afterModelLoadedCallback_[arg_4_1]

		if var_5_0 then
			for iter_5_0, iter_5_1 in ipairs(var_5_0) do
				iter_5_1()
			end
		end

		arg_4_0.afterModelLoadedCallback_[arg_4_1] = nil
		arg_4_0.curLoadingSkinId_ = nil
		arg_4_0.curLoadingModelId_ = nil
		arg_4_0.isAsyncLoading_ = nil
		var_4_2 = nil
	end)

	if not var_4_2 then
		arg_4_0.isAsyncLoading_ = nil
	end
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

function var_0_0.CancelAllAsyncLoadModelOp(arg_7_0)
	if arg_7_0.isAsyncLoading_ then
		manager.resourcePool:StopAsyncQuest(arg_7_0.isAsyncLoading_)
	end

	arg_7_0.isAsyncLoading_ = nil
	arg_7_0.curLoadingSkinId_ = nil
	arg_7_0.afterModelLoadedCallback_ = {}
end

function var_0_0.SetModelState(arg_8_0, arg_8_1)
	arg_8_0:_PreloadModelAsync(arg_8_1)
	arg_8_0:_AfterModelLoaded(function()
		arg_8_0:_SetModelStateSync(arg_8_1)
	end)
end

function var_0_0._SetModelStateSync(arg_10_0, arg_10_1)
	local var_10_0 = false

	if arg_10_0.raiseModel and arg_10_0.raiseModel:GetSkinID() ~= arg_10_1 then
		arg_10_0:RefreshTrackState(arg_10_1)
		arg_10_0:RefreshCameraState(arg_10_1)
		arg_10_0:RemainAni()
		arg_10_0:RefreshTouchHero()
		arg_10_0:RefreshSceneAni()
	end
end

function var_0_0.SetViewState(arg_11_0, arg_11_1, arg_11_2, arg_11_3)
	local var_11_0 = false

	if arg_11_1 and arg_11_0.view_ui ~= arg_11_1 then
		arg_11_0.last_view_ui = arg_11_0.view_ui
		arg_11_0.view_ui = arg_11_1
		var_11_0 = true
	end

	if arg_11_2 then
		if not arg_11_2[3] then
			arg_11_2[3] = 0
		end

		if arg_11_0.view_data[1] ~= arg_11_2[1] or arg_11_0.view_data[2] ~= arg_11_2[2] or arg_11_0.view_data[3] ~= arg_11_2[3] then
			if arg_11_2[1] then
				if arg_11_0.view_data then
					arg_11_0.last_view_data[1] = arg_11_0.view_data[1] or nil
				end

				arg_11_0.view_data[1] = arg_11_2[1]
				var_11_0 = true
			end

			if arg_11_2[2] then
				if arg_11_0.view_data then
					arg_11_0.last_view_data[2] = arg_11_0.view_data[2] or nil
				end

				arg_11_0.view_data[2] = arg_11_2[2]
				var_11_0 = true
			end

			if arg_11_2[3] then
				if arg_11_0.view_data then
					arg_11_0.last_view_data[3] = arg_11_0.view_data[3] or nil
				end

				arg_11_0.view_data[3] = arg_11_2[3]
				var_11_0 = true
			else
				arg_11_0.last_view_data[3] = arg_11_0.view_data[3] or nil
				arg_11_0.view_data[3] = 0
			end
		end
	end

	if var_11_0 then
		arg_11_0:RefreshCameraState()
		arg_11_0:RefreshAni()
		arg_11_0:RefreshSceneAni()
	end

	if arg_11_3 then
		arg_11_0:RefreshTouchView(arg_11_3)
		arg_11_0:RefreshTouchHero()
	else
		arg_11_0:RefreshTouchView(nil)
	end
end

function var_0_0.CheckEffect(arg_12_0)
	if arg_12_0.view_data and arg_12_0.view_ui == HeroRaiseTrackConst.ViewType.heroRaiseCommon then
		local var_12_0 = arg_12_0.view_data[1]

		if var_12_0 == HeroRaiseTrackConst.HeroRaiseType.attr or var_12_0 == HeroRaiseTrackConst.HeroRaiseType.skill then
			arg_12_0.raiseModel:PlayEffect()
		end
	end
end

function var_0_0.PlayTalk(arg_13_0)
	arg_13_0:_AfterModelLoaded(function()
		if arg_13_0.raiseModel then
			arg_13_0.raiseModel:PlayTalk()
		end
	end)
end

function var_0_0.RefreshTrackState(arg_15_0, arg_15_1)
	local var_15_0 = SkinCfg[arg_15_1].hero
	local var_15_1 = HeroPosAndRotCfg[var_15_0]
	local var_15_2 = var_15_1.hero_view_height

	arg_15_0.raiseModel:SetSkinID(arg_15_1)
	arg_15_0.raiseModel:PlayEffect()
	arg_15_0.track:SetTrackData(var_15_1.hero_view_height)
end

function var_0_0.RefreshCameraState(arg_16_0)
	if not arg_16_0.view_ui then
		return
	end

	if isNil(arg_16_0.brain) then
		arg_16_0.brain = manager.ui:AddMainCameraCom(typeof(CinemachineBrain))
	end

	if arg_16_0.view_ui == HeroRaiseTrackConst.ViewType.null then
		arg_16_0:UnloadSceneAni()
		arg_16_0:UnloadWeaponServant()

		if not isNil(arg_16_0.brain) then
			arg_16_0.brain.m_CustomBlends = nil
		end

		manager.ui:SetMainCameraCom("CinemachineBrain", false)
		manager.ui:ResetMainCamera()
		arg_16_0.track:SetActive(false)
		arg_16_0:SetAstrolableAtive(false)

		arg_16_0.lastState_ = HeroRaiseTrackConst.ModelState.none

		arg_16_0.raiseModel:Finish()

		arg_16_0.view_ui = HeroRaiseTrackConst.ViewType.null
		arg_16_0.view_data = {}
		arg_16_0.last_view_ui = HeroRaiseTrackConst.ViewType.null
		arg_16_0.last_view_data = {}
	elseif arg_16_0.view_ui == HeroRaiseTrackConst.ViewType.heroRaiseCommon then
		arg_16_0:LoadSceneAni()

		if not isNil(arg_16_0.brain) and isNil(arg_16_0.brain.m_CustomBlends) then
			arg_16_0.brain.m_CustomBlends = Asset.Load("UI/HeroCamera/CameraData/MainCamera_Blends.asset")
		end

		manager.ui:SetMainCameraCom("CinemachineBrain", true)
		manager.ui:SetMainCamera("hero")
		arg_16_0.track:SetActive(true)

		if arg_16_0.view_data then
			local var_16_0 = arg_16_0.view_data[1] * 10 + arg_16_0.view_data[2] or 10
			local var_16_1 = arg_16_0.view_data[1]
			local var_16_2 = arg_16_0.view_data[3] or 0

			arg_16_0.track:ChangeCamera(var_16_0)

			local var_16_3 = false
			local var_16_4 = false

			if var_16_1 == HeroRaiseTrackConst.HeroRaiseType.weapon then
				if var_16_2 ~= HeroRaiseTrackConst.HeroServantType.weapon then
					var_16_3 = true
				else
					var_16_4 = true
				end
			end

			if var_16_3 then
				arg_16_0:LoadWeaponServant()
			else
				arg_16_0:UnloadWeaponServant(var_16_4)
			end

			arg_16_0.lastState_ = arg_16_0.raiseModel:GetState()

			if var_16_1 == HeroRaiseTrackConst.HeroRaiseType.attr then
				arg_16_0.raiseModel:SetState(HeroRaiseTrackConst.ModelState.hero)
			elseif var_16_1 == HeroRaiseTrackConst.HeroRaiseType.skill then
				arg_16_0.raiseModel:SetState(HeroRaiseTrackConst.ModelState.hero)
			elseif var_16_1 == HeroRaiseTrackConst.HeroRaiseType.weapon then
				if var_16_2 == HeroRaiseTrackConst.HeroServantType.servant then
					arg_16_0.raiseModel:SetState(HeroRaiseTrackConst.ModelState.none)
				else
					arg_16_0.raiseModel:SetState(HeroRaiseTrackConst.ModelState.weapon)
				end
			elseif var_16_1 == HeroRaiseTrackConst.HeroRaiseType.equip then
				arg_16_0.raiseModel:SetState(HeroRaiseTrackConst.ModelState.none)
			elseif var_16_1 == HeroRaiseTrackConst.HeroRaiseType.transition then
				arg_16_0.raiseModel:SetState(HeroRaiseTrackConst.ModelState.none)
			elseif var_16_1 == HeroRaiseTrackConst.HeroRaiseType.astrolabe then
				arg_16_0.raiseModel:SetState(HeroRaiseTrackConst.ModelState.hero)
			elseif var_16_1 == HeroRaiseTrackConst.HeroRaiseType.chip then
				arg_16_0.raiseModel:SetState(HeroRaiseTrackConst.ModelState.hero)
			end

			if HeroRaiseTrackConst.HeroRaiseRotate[var_16_0] then
				arg_16_0:PlayModelRotation(HeroRaiseTrackConst.HeroRaiseRotate[var_16_0])
			else
				arg_16_0:PlayModelRotation()
			end
		end
	end
end

function var_0_0.RefreshTouchView(arg_17_0, arg_17_1)
	if arg_17_0.touchView_ then
		arg_17_0.touchView_:Dispose()

		arg_17_0.touchView_ = nil
	end

	if isNil(arg_17_1) then
		return
	end

	arg_17_0.touchView_ = HeroRaiseModelToucherView.New(arg_17_1)
end

function var_0_0.RefreshTouchHero(arg_18_0)
	if arg_18_0.touchView_ then
		local var_18_0 = arg_18_0.raiseModel:GetRotateGo()

		if not isNil(var_18_0) then
			arg_18_0.touchView_:SetRotateNode(var_18_0.transform)
		end
	end
end

function var_0_0.RefreshAstrolabeColor(arg_19_0, arg_19_1)
	local var_19_0 = manager.ui:GetSceneSettingBySceneName("X100")

	if var_19_0 then
		if arg_19_1 then
			arg_19_0:CreateTimer(var_19_0, ASTROLABE_COLOR[1], ASTROLABE_COLOR[2], ASTROLABE_COLOR[3])
		else
			arg_19_0:CreateTimer(var_19_0, 1, 1, 1)
		end
	end
end

function var_0_0.CreateTimer(arg_20_0, arg_20_1, arg_20_2, arg_20_3, arg_20_4)
	arg_20_0:RemoveTween()

	local var_20_0 = arg_20_1.probeLightingBase.r
	local var_20_1 = arg_20_1.probeLightingBase.g
	local var_20_2 = arg_20_1.probeLightingBase.b

	arg_20_0.tweenValue_ = LeanTween.value(0, 1, ASTROLABE_COLOR_TIME):setOnUpdate(LuaHelper.FloatAction(function(arg_21_0)
		localR = Mathf.Lerp(var_20_0, arg_20_2, arg_21_0)
		localG = Mathf.Lerp(var_20_1, arg_20_3, arg_21_0)
		localB = Mathf.Lerp(var_20_2, arg_20_4, arg_21_0)
		arg_20_1.probeLightingBase = Color.New(localR, localG, localB)
	end)):setOnComplete(LuaHelper.VoidAction(function()
		arg_20_0:RemoveTween()
	end))
end

function var_0_0.RemoveTween(arg_23_0)
	if arg_23_0.tweenValue_ then
		arg_23_0.tweenValue_:setOnComplete(nil):setOnUpdate(nil):setEase(nil)
		LeanTween.cancel(arg_23_0.tweenValue_.id)

		arg_23_0.tweenValue_ = nil
	end
end

function var_0_0.RemainAni(arg_24_0)
	if arg_24_0.raiseModel:GetState() == HeroRaiseTrackConst.ModelState.hero and arg_24_0.view_data and arg_24_0.view_data[1] and arg_24_0.view_data[2] then
		local var_24_0 = arg_24_0.view_data[1] * 10 + arg_24_0.view_data[2] or 10

		arg_24_0.raiseModel:SwitchAni("", HeroRaiseTrackConst.HeroAniName[var_24_0])
	end
end

function var_0_0.RefreshAni(arg_25_0)
	if arg_25_0.view_data and arg_25_0.view_data[1] and arg_25_0.view_data[2] then
		if arg_25_0.breakFx_ == nil then
			arg_25_0.breakFx_ = HeroRaiseCameraTx.New()

			arg_25_0.breakFx_:Init("UI/HeroGodHood/TX_Property_Break_01.prefab")
		end

		local var_25_0 = arg_25_0.view_data[1] * 10 + arg_25_0.view_data[2] or 10
		local var_25_1 = 0

		if arg_25_0.last_view_data and arg_25_0.last_view_data[1] and arg_25_0.last_view_data[2] then
			var_25_1 = arg_25_0.last_view_data[1] * 10 + arg_25_0.last_view_data[2] or 0
		end

		if var_25_0 == 12 then
			arg_25_0.breakFx_:PlayAnim("TX_Property_Break_star")
		elseif var_25_1 == 12 then
			arg_25_0.breakFx_:PlayAnim("TX_Property_Break_end")
		end

		local var_25_2 = {}

		if (var_25_0 ~= 12 or var_25_1 ~= 21) and (var_25_0 ~= 21 or var_25_1 ~= 12) then
			table.insert(var_25_2, HeroRaiseTrackConst.HeroAniName[var_25_1] or "")
			table.insert(var_25_2, HeroRaiseTrackConst.HeroAniName[var_25_0] or "")
			arg_25_0.raiseModel:SwitchAni(var_25_2[1], var_25_2[2])
		elseif var_25_0 == 12 and var_25_1 == 21 then
			arg_25_0.raiseModel:RemainAni(HeroRaiseTrackConst.HeroAniName[21])
		end
	elseif arg_25_0.breakFx_ then
		arg_25_0.breakFx_:Dispose()

		arg_25_0.breakFx_ = nil
	end
end

function var_0_0.RefreshSceneAni(arg_26_0)
	if arg_26_0.view_data and arg_26_0.view_data[1] and arg_26_0.view_data[2] then
		local var_26_0 = arg_26_0.view_data[1] * 10 + arg_26_0.view_data[2] or 10
		local var_26_1 = 0

		if arg_26_0.last_view_data and arg_26_0.last_view_data[1] and arg_26_0.last_view_data[2] then
			var_26_1 = arg_26_0.last_view_data[1] * 10 + arg_26_0.last_view_data[2] or 0
		end

		if var_26_0 == 10 or var_26_0 == 20 then
			if var_26_1 ~= 10 and var_26_1 ~= 20 then
				arg_26_0:PlaySceneAni("TX_Property_Corrector_star1")
			else
				arg_26_0:PlaySceneAni("TX_Property_Corrector_stand")
			end
		elseif var_26_1 ~= 10 and var_26_1 ~= 20 then
			arg_26_0:PlaySceneAni("TX_Property_Corrector_hide")
		else
			arg_26_0:PlaySceneAni("TX_Property_Corrector_end1")
		end
	end
end

function var_0_0.RemainSceneAni(arg_27_0)
	if arg_27_0.view_data and arg_27_0.view_data[1] and arg_27_0.view_data[2] then
		local var_27_0 = arg_27_0.view_data[1] * 10 + arg_27_0.view_data[2] or 10

		if var_27_0 == 10 or var_27_0 == 20 then
			arg_27_0:PlaySceneAni("TX_Property_Corrector_stand")
		end
	end
end

function var_0_0.PlaySceneAni(arg_28_0, arg_28_1)
	if isNil(arg_28_0.sceneTxAni_) then
		return
	end

	arg_28_0.sceneTxAni_:Play(arg_28_1)
	arg_28_0.sceneTxAni_:Update(0)
end

function var_0_0.LoadSceneAni(arg_29_0)
	if isNil(arg_29_0.sceneTxTrans_) then
		local var_29_0 = SceneManager.GetSceneByName("X100")
		local var_29_1 = var_29_0:GetRootGameObjects()
		local var_29_2

		if var_29_1 ~= nil then
			for iter_29_0 = 0, var_29_1.Length - 1 do
				if var_29_1[iter_29_0].name == var_29_0.name then
					var_29_2 = var_29_1[iter_29_0]

					break
				end
			end
		end

		arg_29_0.sceneTxTrans_ = var_29_2.transform:Find("X100_base_003/TX_Property_Corrector")

		if arg_29_0.sceneTxTrans_ then
			arg_29_0.sceneTxAni_ = arg_29_0.sceneTxTrans_:GetComponentInChildren(typeof(Animator))
		end
	end
end

function var_0_0.UnloadSceneAni(arg_30_0)
	arg_30_0.sceneTxTrans_ = nil
	arg_30_0.sceneTxAni_ = nil
end

function var_0_0.RemoveTween(arg_31_0)
	if arg_31_0.tween then
		arg_31_0.tween:setOnComplete(nil)
		LeanTween.cancel(arg_31_0.m_arror.gameObject)

		arg_31_0.tween = nil
	end
end

function var_0_0.PlayModelRotation(arg_32_0, arg_32_1)
	if arg_32_0.raiseModel then
		arg_32_0.raiseModel:SetModelRotation(arg_32_1)
	end
end

function var_0_0.SetWeaponServantID(arg_33_0, arg_33_1)
	if arg_33_0.servantTrackController then
		arg_33_0.servantTrackController:SetServantID(arg_33_1)
	end
end

function var_0_0.LoadWeaponServant(arg_34_0)
	if arg_34_0.servantTrackController and arg_34_0.servantTrackController:CheckValid() then
		return
	end

	if arg_34_0.servantTrackController then
		arg_34_0.servantTrackController:Dispose()

		arg_34_0.servantTrackController = nil
	end

	local var_34_0 = Asset.Load("UI/HeroGodHood/TX_WeaponServant.prefab")
	local var_34_1 = Object.Instantiate(var_34_0, manager.ui.mainCamera.transform)

	if not isNil(var_34_1) then
		arg_34_0.servantTrackController = ServantTrackController.New()

		arg_34_0.servantTrackController:Init(var_34_1)
	end
end

function var_0_0.PlayServantAnim(arg_35_0, arg_35_1, arg_35_2)
	if arg_35_0.servantTrackController then
		arg_35_0.servantTrackController:PlayAnim(arg_35_1, arg_35_2)
	end
end

function var_0_0.UnloadWeaponServant(arg_36_0, arg_36_1)
	if arg_36_0.servantTrackController then
		if arg_36_1 then
			arg_36_0:PlayServantAnim("Fade")
		else
			arg_36_0.servantTrackController:Dispose()

			arg_36_0.servantTrackController = nil
		end
	end
end

function var_0_0.UnloadAstrolabe(arg_37_0)
	if arg_37_0.astrolableController then
		arg_37_0.astrolableController:Dispose()
	end
end

function var_0_0.SetAstrolableAtive(arg_38_0, arg_38_1)
	if arg_38_0.astrolableController then
		arg_38_0.astrolableController:SetActive(arg_38_1)

		if not arg_38_1 then
			arg_38_0:RefreshAstrolableState(AstrolabeConst.AnimationState.Hide)
		end
	end
end

function var_0_0.RefreshAstrolableState(arg_39_0, arg_39_1)
	if arg_39_0.astrolableController then
		arg_39_0.astrolableController:RefreshAnimationState(arg_39_1)
	end
end

return var_0_0
