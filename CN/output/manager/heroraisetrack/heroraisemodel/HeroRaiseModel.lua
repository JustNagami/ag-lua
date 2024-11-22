local var_0_0 = class("HeroRaiseModel")

function var_0_0.Ctor(arg_1_0)
	arg_1_0.skinID = nil
	arg_1_0.modelID = nil
	arg_1_0.weaponID = nil
	arg_1_0.tpose = nil
	arg_1_0.ui_tpose = nil
	arg_1_0.weapon_tpose = nil
	arg_1_0.state = HeroRaiseTrackConst.ModelState.none
	arg_1_0.animator_ = nil
	arg_1_0.lastAni_ = HeroRaiseTrackConst.HeroAniName[21]
	arg_1_0.rotateGo_ = nil
	arg_1_0.talkTimer_ = nil
end

function var_0_0.PlayTalk(arg_2_0)
	if arg_2_0.skinID then
		local var_2_0 = SkinCfg[arg_2_0.skinID]

		if var_2_0 and var_2_0.hero then
			arg_2_0:StopTimer()

			arg_2_0.talkTimer_ = Timer.New(function()
				HeroTools.PlayTalk(var_2_0.hero, "choose")
			end, 1)

			arg_2_0.talkTimer_:Start()
		end
	end
end

function var_0_0.GetRotateGo(arg_4_0)
	if arg_4_0.state == HeroRaiseTrackConst.ModelState.none then
		return nil
	else
		return arg_4_0.rotateGo_
	end
end

function var_0_0.GetSkinID(arg_5_0)
	return arg_5_0.skinID
end

function var_0_0.GetState(arg_6_0)
	return arg_6_0.state
end

function var_0_0.SetSkinID(arg_7_0, arg_7_1)
	if arg_7_1 and arg_7_0.skinID ~= arg_7_1 then
		local var_7_0 = SkinCfg[arg_7_1]

		arg_7_0.skinID = arg_7_1
		arg_7_0.modelID = var_7_0.modelId
		arg_7_0.weaponID = var_7_0.weapon_modelId

		arg_7_0:RefreshModel()
	end
end

function var_0_0.SetState(arg_8_0, arg_8_1)
	if arg_8_1 ~= arg_8_0.state then
		arg_8_0.state = arg_8_1

		arg_8_0:RefreshModel()
	end
end

function var_0_0.SetModelRotation(arg_9_0, arg_9_1)
	if not isNil(arg_9_0.rotateGo_) then
		LeanTween.cancel(arg_9_0.rotateGo_)

		if arg_9_1 then
			LeanTween.rotateLocal(arg_9_0.rotateGo_, arg_9_1, HERO_RAISE_ROTATE_TIME):setEase(LeanTweenType.easeOutQuart)
		else
			LeanTween.rotateLocal(arg_9_0.rotateGo_, Vector3(0, 0, 0), HERO_RAISE_ROTATE_TIME):setEase(LeanTweenType.easeOutQuart)
		end
	end
end

function var_0_0.RefreshModel(arg_10_0)
	arg_10_0:StopTimer()
	arg_10_0:Stop()

	if arg_10_0.state == HeroRaiseTrackConst.ModelState.none then
		arg_10_0:UnloadHeroModel()
		arg_10_0:UnloadWeaponModel()
	elseif arg_10_0.state == HeroRaiseTrackConst.ModelState.hero then
		arg_10_0:UnloadWeaponModel()
		arg_10_0:LoadHeroModel()
	elseif arg_10_0.state == HeroRaiseTrackConst.ModelState.weapon then
		arg_10_0:UnloadHeroModel()
		arg_10_0:LoadWeaponModel()
	end
end

function var_0_0.ResetHeroModel(arg_11_0)
	arg_11_0:PlayAni("action1_1", true, nil)

	if arg_11_0.tpose then
		local var_11_0 = arg_11_0.tpose:GetComponent("UIPoseMoveController")
		local var_11_1 = arg_11_0.tpose.transform

		var_11_1.localPosition = var_11_0:GetInitPosition()
		var_11_1.localEulerAngles = var_11_0:GetInitRotation()
		var_11_1.localScale = Vector3(1, 1, 1)
	end
end

function var_0_0.ResetWeaponModel(arg_12_0)
	local var_12_0 = arg_12_0.weapon_tpose.transform

	var_12_0.localPosition = Vector3(500, 0, 1)
	var_12_0.localEulerAngles = Vector3(0, 0, 0)
	var_12_0.localScale = Vector3(1, 1, 1)
end

function var_0_0.LoadHeroModel(arg_13_0)
	if not arg_13_0.modelID then
		return
	end

	arg_13_0:UnloadHeroModel()

	arg_13_0.tpose = manager.resourcePool:Get(manager.heroUiTimeline:GetModelPath(arg_13_0.skinID, arg_13_0.modelID), ASSET_TYPE.TPOSE)
	arg_13_0.ui_tpose = arg_13_0.tpose.transform:Find(string.format("%dui/%dui_tpose", arg_13_0.skinID, arg_13_0.skinID)).gameObject
	arg_13_0.rotateGo_ = arg_13_0.tpose.transform:Find(string.format("%dui", arg_13_0.skinID)).gameObject
	arg_13_0.animator_ = arg_13_0.ui_tpose:GetComponent(typeof(Animator))

	LuaForUtil.ShowWeapon(arg_13_0.animator_.transform, false)
	manager.heroUiTimeline:BindHero(arg_13_0.skinID, arg_13_0.modelID, arg_13_0.tpose)
	arg_13_0:ResetHeroModel()
end

function var_0_0.UnloadHeroModel(arg_14_0)
	manager.heroUiTimeline:Unbind()
	arg_14_0:Stop()
	arg_14_0:StopTimer()

	if not isNil(arg_14_0.tpose) then
		manager.resourcePool:DestroyOrReturn(arg_14_0.tpose, ASSET_TYPE.TPOSE)
	end

	arg_14_0.tpose = nil
	arg_14_0.ui_tpose = nil
	arg_14_0.rotateGo_ = nil
	arg_14_0.animator_ = nil
end

function var_0_0.LoadWeaponModel(arg_15_0)
	if not arg_15_0.weaponID then
		return
	end

	arg_15_0:UnloadWeaponModel()

	arg_15_0.weapon_tpose = manager.resourcePool:Get("Weapon/" .. arg_15_0.weaponID, ASSET_TYPE.WEAPON)
	arg_15_0.rotateGo_ = arg_15_0.weapon_tpose

	arg_15_0:ResetWeaponModel()
end

function var_0_0.UnloadWeaponModel(arg_16_0)
	arg_16_0:Stop()
	arg_16_0:StopTimer()

	if not isNil(arg_16_0.weapon_tpose) then
		manager.resourcePool:DestroyOrReturn(arg_16_0.weapon_tpose, ASSET_TYPE.WEAPON)
	end

	arg_16_0.weapon_tpose = nil
	arg_16_0.rotateGo_ = nil
end

function var_0_0.Finish(arg_17_0)
	arg_17_0:UnloadHeroModel()
	arg_17_0:UnloadWeaponModel()

	arg_17_0.skinID = nil
	arg_17_0.modelID = nil
	arg_17_0.weaponID = nil
	arg_17_0.tpose = nil
	arg_17_0.ui_tpose = nil
	arg_17_0.weapon_tpose = nil
	arg_17_0.animator_ = nil
	arg_17_0.rotateGo_ = nil
end

function var_0_0.PlayEffect(arg_18_0)
	if arg_18_0.ui_tpose then
		manager.audio:PlayUIAudioByVoice("hero_change")
		LuaForUtil.PlayEffect(arg_18_0.ui_tpose.transform, "Effect/tongyong/fx_appear_UI", Vector3(0, 0, 0), Vector3(1, 1, 1), Vector3(0, 0, 0), Vector3(0, 0, 0), false, 1, 0, 0.8)
	end
end

function var_0_0.RemainAni(arg_19_0, arg_19_1)
	arg_19_0.lastAni_ = arg_19_1
end

function var_0_0.SwitchAni(arg_20_0, arg_20_1, arg_20_2)
	if arg_20_0.state ~= HeroRaiseTrackConst.ModelState.hero then
		return
	end

	local var_20_0 = true

	if arg_20_0.lastAni_ and arg_20_0.lastAni_ ~= "" and arg_20_1 == "" and arg_20_2 == HeroRaiseTrackConst.HeroAniName[12] then
		arg_20_0:PlayAni(arg_20_0.lastAni_ .. "_2", var_20_0, nil)

		return
	end

	arg_20_0.lastAni_ = arg_20_2

	if arg_20_1 == arg_20_2 then
		return
	end

	if arg_20_2 == "" then
		LuaForUtil.EnableEyeController(arg_20_0.tpose.transform, true)
		manager.resourcePool:ResetBlendShapes(arg_20_0.tpose.transform)
		arg_20_0:RemainAni(HeroRaiseTrackConst.HeroAniName[12])

		return
	end

	arg_20_0:_PrepareTimeline(arg_20_2)

	if arg_20_1 == "" then
		if arg_20_2 == HeroRaiseTrackConst.HeroRaiseIdleAniName then
			arg_20_0:PlayAni(arg_20_2, var_20_0, nil)
		else
			arg_20_0:PlayAni(arg_20_2 .. "_1", var_20_0, function()
				arg_20_0:PlayAni(arg_20_2 .. "_2", var_20_0, nil)
			end)
		end

		return
	end

	if arg_20_1 == HeroRaiseTrackConst.HeroRaiseIdleAniName then
		arg_20_0:PlayAni(arg_20_2 .. "_1", var_20_0, function()
			arg_20_0:PlayAni(arg_20_2 .. "_2", var_20_0, nil)
		end)

		return
	end

	if arg_20_2 == HeroRaiseTrackConst.HeroRaiseIdleAniName then
		arg_20_0:PlayAni(arg_20_1 .. "_3", var_20_0, function()
			arg_20_0:PlayAni(arg_20_2, var_20_0, nil)
		end)

		return
	end

	arg_20_0:PlayAni(arg_20_1 .. "_3", var_20_0, function()
		arg_20_0:PlayAni(arg_20_2 .. "_1", var_20_0, function()
			arg_20_0:PlayAni(arg_20_2 .. "_2", var_20_0, nil)
		end)
	end)
end

function var_0_0.ResetBlendShapes(arg_26_0)
	if arg_26_0.ui_tpose then
		LuaForUtil.EnableEyeController(arg_26_0.ui_tpose.transform, true)
		manager.resourcePool:ResetBlendShapes(arg_26_0.ui_tpose.transform)
	end
end

local var_0_1 = 0.5

function var_0_0.PlayAni(arg_27_0, arg_27_1, arg_27_2, arg_27_3)
	manager.heroUiTimeline:PlayAction(arg_27_1, {
		isUniqueBlending = true,
		fadeSecond = var_0_1,
		isLoop = arg_27_0:_IsLoopClip(arg_27_1),
		group = arg_27_0:_GetGroup(arg_27_1)
	})
	manager.heroUiTimeline:SetCallbackBlendSignal(function(arg_28_0)
		if arg_27_3 ~= nil then
			arg_27_3()
		end
	end)
end

function var_0_0.Stop(arg_29_0)
	if arg_29_0.timer_ ~= nil then
		arg_29_0.timer_:Stop()

		arg_29_0.timer_ = nil
	end

	manager.heroUiTimeline:SetCallbackBlendSignal(nil)
end

function var_0_0.GetAnimator(arg_30_0)
	if arg_30_0.animator_ then
		return arg_30_0.animator_
	end

	return nil
end

function var_0_0.StopTimer(arg_31_0)
	if arg_31_0.talkTimer_ then
		arg_31_0.talkTimer_:Stop()

		arg_31_0.talkTimer_ = nil
	end
end

function var_0_0._PrepareTimeline(arg_32_0, arg_32_1)
	if arg_32_1 == HeroRaiseTrackConst.HeroRaiseIdleAniName then
		return
	end

	manager.heroUiTimeline:PrepareAction(arg_32_1 .. "_1")
	manager.heroUiTimeline:PrepareAction(arg_32_1 .. "_2")
end

function var_0_0._IsLoopClip(arg_33_0, arg_33_1)
	if arg_33_1 == "action1_1" then
		return true
	end

	if string.find(arg_33_1, "_2") then
		return true
	end

	return false
end

function var_0_0._GetGroup(arg_34_0, arg_34_1)
	for iter_34_0, iter_34_1 in pairs(HeroRaiseTrackConst.HeroAniName) do
		if string.find(arg_34_1, iter_34_1) then
			return iter_34_1
		end
	end

	return arg_34_1
end

function var_0_0.Dispose(arg_35_0)
	arg_35_0:StopTimer()
	arg_35_0:Finish()
end

return var_0_0
