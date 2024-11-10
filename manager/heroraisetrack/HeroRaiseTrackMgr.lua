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

function var_0_0.SetModelState(arg_4_0, arg_4_1)
	local var_4_0 = false

	if arg_4_0.raiseModel and arg_4_0.raiseModel:GetSkinID() ~= arg_4_1 then
		arg_4_0:RefreshTrackState(arg_4_1)
		arg_4_0:RefreshCameraState(arg_4_1)
		arg_4_0:RemainAni()
		arg_4_0:RefreshTouchHero()
		arg_4_0:RefreshSceneAni()
	end
end

function var_0_0.SetViewState(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	local var_5_0 = false

	if arg_5_1 and arg_5_0.view_ui ~= arg_5_1 then
		arg_5_0.last_view_ui = arg_5_0.view_ui
		arg_5_0.view_ui = arg_5_1
		var_5_0 = true
	end

	if arg_5_2 then
		if not arg_5_2[3] then
			arg_5_2[3] = 0
		end

		if arg_5_0.view_data[1] ~= arg_5_2[1] or arg_5_0.view_data[2] ~= arg_5_2[2] or arg_5_0.view_data[3] ~= arg_5_2[3] then
			if arg_5_2[1] then
				if arg_5_0.view_data then
					arg_5_0.last_view_data[1] = arg_5_0.view_data[1] or nil
				end

				arg_5_0.view_data[1] = arg_5_2[1]
				var_5_0 = true
			end

			if arg_5_2[2] then
				if arg_5_0.view_data then
					arg_5_0.last_view_data[2] = arg_5_0.view_data[2] or nil
				end

				arg_5_0.view_data[2] = arg_5_2[2]
				var_5_0 = true
			end

			if arg_5_2[3] then
				if arg_5_0.view_data then
					arg_5_0.last_view_data[3] = arg_5_0.view_data[3] or nil
				end

				arg_5_0.view_data[3] = arg_5_2[3]
				var_5_0 = true
			else
				arg_5_0.last_view_data[3] = arg_5_0.view_data[3] or nil
				arg_5_0.view_data[3] = 0
			end
		end
	end

	if var_5_0 then
		arg_5_0:RefreshCameraState()
		arg_5_0:RefreshAni()
		arg_5_0:RefreshSceneAni()
	end

	if arg_5_3 then
		arg_5_0:RefreshTouchView(arg_5_3)
		arg_5_0:RefreshTouchHero()
	else
		arg_5_0:RefreshTouchView(nil)
	end
end

function var_0_0.CheckEffect(arg_6_0)
	if arg_6_0.view_data and arg_6_0.view_ui == HeroRaiseTrackConst.ViewType.heroRaiseCommon then
		local var_6_0 = arg_6_0.view_data[1]

		if var_6_0 == HeroRaiseTrackConst.HeroRaiseType.attr or var_6_0 == HeroRaiseTrackConst.HeroRaiseType.skill then
			arg_6_0.raiseModel:PlayEffect()
		end
	end
end

function var_0_0.PlayTalk(arg_7_0)
	if arg_7_0.raiseModel then
		arg_7_0.raiseModel:PlayTalk()
	end
end

function var_0_0.RefreshTrackState(arg_8_0, arg_8_1)
	local var_8_0 = SkinCfg[arg_8_1].hero
	local var_8_1 = HeroPosAndRotCfg[var_8_0]
	local var_8_2 = var_8_1.hero_view_height

	arg_8_0.raiseModel:SetSkinID(arg_8_1)
	arg_8_0.raiseModel:PlayEffect()
	arg_8_0.track:SetTrackData(var_8_1.hero_view_height)
end

function var_0_0.RefreshCameraState(arg_9_0)
	if not arg_9_0.view_ui then
		return
	end

	if isNil(arg_9_0.brain) then
		arg_9_0.brain = manager.ui:AddMainCameraCom(typeof(CinemachineBrain))
	end

	if arg_9_0.view_ui == HeroRaiseTrackConst.ViewType.null then
		arg_9_0:UnloadSceneAni()
		arg_9_0:UnloadWeaponServant()

		if not isNil(arg_9_0.brain) then
			arg_9_0.brain.m_CustomBlends = nil
		end

		manager.ui:SetMainCameraCom("CinemachineBrain", false)
		manager.ui:ResetMainCamera()
		arg_9_0.track:SetActive(false)
		arg_9_0:SetAstrolableAtive(false)

		arg_9_0.lastState_ = HeroRaiseTrackConst.ModelState.none

		arg_9_0.raiseModel:Finish()

		arg_9_0.view_ui = HeroRaiseTrackConst.ViewType.null
		arg_9_0.view_data = {}
		arg_9_0.last_view_ui = HeroRaiseTrackConst.ViewType.null
		arg_9_0.last_view_data = {}
	elseif arg_9_0.view_ui == HeroRaiseTrackConst.ViewType.heroRaiseCommon then
		arg_9_0:LoadSceneAni()

		if not isNil(arg_9_0.brain) and isNil(arg_9_0.brain.m_CustomBlends) then
			arg_9_0.brain.m_CustomBlends = Asset.Load("UI/HeroCamera/CameraData/MainCamera_Blends.asset")
		end

		manager.ui:SetMainCameraCom("CinemachineBrain", true)
		manager.ui:SetMainCamera("hero")
		arg_9_0.track:SetActive(true)

		if arg_9_0.view_data then
			local var_9_0 = arg_9_0.view_data[1] * 10 + arg_9_0.view_data[2] or 10
			local var_9_1 = arg_9_0.view_data[1]
			local var_9_2 = arg_9_0.view_data[3] or 0

			arg_9_0.track:ChangeCamera(var_9_0)

			local var_9_3 = false
			local var_9_4 = false

			if var_9_1 == HeroRaiseTrackConst.HeroRaiseType.weapon then
				if var_9_2 ~= HeroRaiseTrackConst.HeroServantType.weapon then
					var_9_3 = true
				else
					var_9_4 = true
				end
			end

			if var_9_3 then
				arg_9_0:LoadWeaponServant()
			else
				arg_9_0:UnloadWeaponServant(var_9_4)
			end

			arg_9_0.lastState_ = arg_9_0.raiseModel:GetState()

			if var_9_1 == HeroRaiseTrackConst.HeroRaiseType.attr then
				arg_9_0.raiseModel:SetState(HeroRaiseTrackConst.ModelState.hero)
			elseif var_9_1 == HeroRaiseTrackConst.HeroRaiseType.skill then
				arg_9_0.raiseModel:SetState(HeroRaiseTrackConst.ModelState.hero)
			elseif var_9_1 == HeroRaiseTrackConst.HeroRaiseType.weapon then
				if var_9_2 == HeroRaiseTrackConst.HeroServantType.servant then
					arg_9_0.raiseModel:SetState(HeroRaiseTrackConst.ModelState.none)
				else
					arg_9_0.raiseModel:SetState(HeroRaiseTrackConst.ModelState.weapon)
				end
			elseif var_9_1 == HeroRaiseTrackConst.HeroRaiseType.equip then
				arg_9_0.raiseModel:SetState(HeroRaiseTrackConst.ModelState.none)
			elseif var_9_1 == HeroRaiseTrackConst.HeroRaiseType.transition then
				arg_9_0.raiseModel:SetState(HeroRaiseTrackConst.ModelState.none)
			elseif var_9_1 == HeroRaiseTrackConst.HeroRaiseType.astrolabe then
				arg_9_0.raiseModel:SetState(HeroRaiseTrackConst.ModelState.hero)
			elseif var_9_1 == HeroRaiseTrackConst.HeroRaiseType.chip then
				arg_9_0.raiseModel:SetState(HeroRaiseTrackConst.ModelState.hero)
			end

			if HeroRaiseTrackConst.HeroRaiseRotate[var_9_0] then
				arg_9_0:PlayModelRotation(HeroRaiseTrackConst.HeroRaiseRotate[var_9_0])
			else
				arg_9_0:PlayModelRotation()
			end
		end
	end
end

function var_0_0.RefreshTouchView(arg_10_0, arg_10_1)
	if arg_10_0.touchView_ then
		arg_10_0.touchView_:Dispose()

		arg_10_0.touchView_ = nil
	end

	if isNil(arg_10_1) then
		return
	end

	arg_10_0.touchView_ = HeroRaiseModelToucherView.New(arg_10_1)
end

function var_0_0.RefreshTouchHero(arg_11_0)
	if arg_11_0.touchView_ then
		local var_11_0 = arg_11_0.raiseModel:GetRotateGo()

		if not isNil(var_11_0) then
			arg_11_0.touchView_:SetRotateNode(var_11_0.transform)
		end
	end
end

function var_0_0.RefreshAstrolabeColor(arg_12_0, arg_12_1)
	local var_12_0 = manager.ui:GetSceneSettingBySceneName("X100")

	if var_12_0 then
		if arg_12_1 then
			arg_12_0:CreateTimer(var_12_0, ASTROLABE_COLOR[1], ASTROLABE_COLOR[2], ASTROLABE_COLOR[3])
		else
			arg_12_0:CreateTimer(var_12_0, 1, 1, 1)
		end
	end
end

function var_0_0.CreateTimer(arg_13_0, arg_13_1, arg_13_2, arg_13_3, arg_13_4)
	arg_13_0:RemoveTween()

	local var_13_0 = arg_13_1.probeLightingBase.r
	local var_13_1 = arg_13_1.probeLightingBase.g
	local var_13_2 = arg_13_1.probeLightingBase.b

	arg_13_0.tweenValue_ = LeanTween.value(0, 1, ASTROLABE_COLOR_TIME):setOnUpdate(LuaHelper.FloatAction(function(arg_14_0)
		localR = Mathf.Lerp(var_13_0, arg_13_2, arg_14_0)
		localG = Mathf.Lerp(var_13_1, arg_13_3, arg_14_0)
		localB = Mathf.Lerp(var_13_2, arg_13_4, arg_14_0)
		arg_13_1.probeLightingBase = Color.New(localR, localG, localB)
	end)):setOnComplete(LuaHelper.VoidAction(function()
		arg_13_0:RemoveTween()
	end))
end

function var_0_0.RemoveTween(arg_16_0)
	if arg_16_0.tweenValue_ then
		arg_16_0.tweenValue_:setOnComplete(nil):setOnUpdate(nil):setEase(nil)
		LeanTween.cancel(arg_16_0.tweenValue_.id)

		arg_16_0.tweenValue_ = nil
	end
end

function var_0_0.RemainAni(arg_17_0)
	if arg_17_0.raiseModel:GetState() == HeroRaiseTrackConst.ModelState.hero and arg_17_0.view_data and arg_17_0.view_data[1] and arg_17_0.view_data[2] then
		local var_17_0 = arg_17_0.view_data[1] * 10 + arg_17_0.view_data[2] or 10

		arg_17_0.raiseModel:SwitchAni("", HeroRaiseTrackConst.HeroAniName[var_17_0])
	end
end

function var_0_0.RefreshAni(arg_18_0)
	if arg_18_0.view_data and arg_18_0.view_data[1] and arg_18_0.view_data[2] then
		if arg_18_0.breakFx_ == nil then
			arg_18_0.breakFx_ = HeroRaiseCameraTx.New()

			arg_18_0.breakFx_:Init("UI/HeroGodHood/TX_Property_Break_01.prefab")
		end

		local var_18_0 = arg_18_0.view_data[1] * 10 + arg_18_0.view_data[2] or 10
		local var_18_1 = 0

		if arg_18_0.last_view_data and arg_18_0.last_view_data[1] and arg_18_0.last_view_data[2] then
			var_18_1 = arg_18_0.last_view_data[1] * 10 + arg_18_0.last_view_data[2] or 0
		end

		if var_18_0 == 12 then
			arg_18_0.breakFx_:PlayAnim("TX_Property_Break_star")
		elseif var_18_1 == 12 then
			arg_18_0.breakFx_:PlayAnim("TX_Property_Break_end")
		end

		local var_18_2 = {}

		if (var_18_0 ~= 12 or var_18_1 ~= 21) and (var_18_0 ~= 21 or var_18_1 ~= 12) then
			table.insert(var_18_2, HeroRaiseTrackConst.HeroAniName[var_18_1] or "")
			table.insert(var_18_2, HeroRaiseTrackConst.HeroAniName[var_18_0] or "")
			arg_18_0.raiseModel:SwitchAni(var_18_2[1], var_18_2[2])
		elseif var_18_0 == 12 and var_18_1 == 21 then
			arg_18_0.raiseModel:RemainAni(HeroRaiseTrackConst.HeroAniName[21])
		end
	elseif arg_18_0.breakFx_ then
		arg_18_0.breakFx_:Dispose()

		arg_18_0.breakFx_ = nil
	end
end

function var_0_0.RefreshSceneAni(arg_19_0)
	if arg_19_0.view_data and arg_19_0.view_data[1] and arg_19_0.view_data[2] then
		local var_19_0 = arg_19_0.view_data[1] * 10 + arg_19_0.view_data[2] or 10
		local var_19_1 = 0

		if arg_19_0.last_view_data and arg_19_0.last_view_data[1] and arg_19_0.last_view_data[2] then
			var_19_1 = arg_19_0.last_view_data[1] * 10 + arg_19_0.last_view_data[2] or 0
		end

		if var_19_0 == 10 or var_19_0 == 20 then
			if var_19_1 ~= 10 and var_19_1 ~= 20 then
				arg_19_0:PlaySceneAni("TX_Property_Corrector_star1")
			else
				arg_19_0:PlaySceneAni("TX_Property_Corrector_stand")
			end
		elseif var_19_1 ~= 10 and var_19_1 ~= 20 then
			arg_19_0:PlaySceneAni("TX_Property_Corrector_hide")
		else
			arg_19_0:PlaySceneAni("TX_Property_Corrector_end1")
		end
	end
end

function var_0_0.RemainSceneAni(arg_20_0)
	if arg_20_0.view_data and arg_20_0.view_data[1] and arg_20_0.view_data[2] then
		local var_20_0 = arg_20_0.view_data[1] * 10 + arg_20_0.view_data[2] or 10

		if var_20_0 == 10 or var_20_0 == 20 then
			arg_20_0:PlaySceneAni("TX_Property_Corrector_stand")
		end
	end
end

function var_0_0.PlaySceneAni(arg_21_0, arg_21_1)
	if isNil(arg_21_0.sceneTxAni_) then
		return
	end

	arg_21_0.sceneTxAni_:Play(arg_21_1)
	arg_21_0.sceneTxAni_:Update(0)
end

function var_0_0.LoadSceneAni(arg_22_0)
	if isNil(arg_22_0.sceneTxTrans_) then
		local var_22_0 = SceneManager.GetSceneByName("X100")
		local var_22_1 = var_22_0:GetRootGameObjects()
		local var_22_2

		if var_22_1 ~= nil then
			for iter_22_0 = 0, var_22_1.Length - 1 do
				if var_22_1[iter_22_0].name == var_22_0.name then
					var_22_2 = var_22_1[iter_22_0]

					break
				end
			end
		end

		arg_22_0.sceneTxTrans_ = var_22_2.transform:Find("X100_base_003/TX_Property_Corrector")

		if arg_22_0.sceneTxTrans_ then
			arg_22_0.sceneTxAni_ = arg_22_0.sceneTxTrans_:GetComponentInChildren(typeof(Animator))
		end
	end
end

function var_0_0.UnloadSceneAni(arg_23_0)
	arg_23_0.sceneTxTrans_ = nil
	arg_23_0.sceneTxAni_ = nil
end

function var_0_0.RemoveTween(arg_24_0)
	if arg_24_0.tween then
		arg_24_0.tween:setOnComplete(nil)
		LeanTween.cancel(arg_24_0.m_arror.gameObject)

		arg_24_0.tween = nil
	end
end

function var_0_0.PlayModelRotation(arg_25_0, arg_25_1)
	if arg_25_0.raiseModel then
		arg_25_0.raiseModel:SetModelRotation(arg_25_1)
	end
end

function var_0_0.SetWeaponServantID(arg_26_0, arg_26_1)
	if arg_26_0.servantTrackController then
		arg_26_0.servantTrackController:SetServantID(arg_26_1)
	end
end

function var_0_0.LoadWeaponServant(arg_27_0)
	if arg_27_0.servantTrackController and arg_27_0.servantTrackController:CheckValid() then
		return
	end

	if arg_27_0.servantTrackController then
		arg_27_0.servantTrackController:Dispose()

		arg_27_0.servantTrackController = nil
	end

	local var_27_0 = Asset.Load("UI/HeroGodHood/TX_WeaponServant.prefab")
	local var_27_1 = Object.Instantiate(var_27_0, manager.ui.mainCamera.transform)

	if not isNil(var_27_1) then
		arg_27_0.servantTrackController = ServantTrackController.New()

		arg_27_0.servantTrackController:Init(var_27_1)
	end
end

function var_0_0.PlayServantAnim(arg_28_0, arg_28_1, arg_28_2)
	if arg_28_0.servantTrackController then
		arg_28_0.servantTrackController:PlayAnim(arg_28_1, arg_28_2)
	end
end

function var_0_0.UnloadWeaponServant(arg_29_0, arg_29_1)
	if arg_29_0.servantTrackController then
		if arg_29_1 then
			arg_29_0:PlayServantAnim("Fade")
		else
			arg_29_0.servantTrackController:Dispose()

			arg_29_0.servantTrackController = nil
		end
	end
end

function var_0_0.UnloadAstrolabe(arg_30_0)
	if arg_30_0.astrolableController then
		arg_30_0.astrolableController:Dispose()
	end
end

function var_0_0.SetAstrolableAtive(arg_31_0, arg_31_1)
	if arg_31_0.astrolableController then
		arg_31_0.astrolableController:SetActive(arg_31_1)

		if not arg_31_1 then
			arg_31_0:RefreshAstrolableState(AstrolabeConst.AnimationState.Hide)
		end
	end
end

function var_0_0.RefreshAstrolableState(arg_32_0, arg_32_1)
	if arg_32_0.astrolableController then
		arg_32_0.astrolableController:RefreshAnimationState(arg_32_1)
	end
end

return var_0_0
