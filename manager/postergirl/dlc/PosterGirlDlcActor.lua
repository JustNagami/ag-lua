local var_0_0 = class("PosterGirlDlcActor", PosterGirlBaseActor)

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	var_0_0.super.Ctor(arg_1_0, arg_1_1, arg_1_2)
	manager.ui:AddMainCameraCom(typeof(CinemachineBrain))

	arg_1_0.playable_list = {}

	arg_1_0:Init()

	local var_1_0, var_1_1 = PosterGirlTools.GetLoadLightEffect(arg_1_0.view_direct, arg_1_0.view_direct)

	if var_1_0 then
		manager.ui:SetSceneLightEffect(var_1_1)
	end

	arg_1_0:UpdateCameraParams()
end

function var_0_0.Init(arg_2_0)
	arg_2_0.view_direct = PosterGirlConst.ViewDirect.center
end

function var_0_0.LoadModel(arg_3_0)
	var_0_0.super.LoadModel(arg_3_0)

	local var_3_0 = arg_3_0.tpose.transform:Find("camera")

	if var_3_0 then
		arg_3_0.cameraManager_ = var_3_0:GetComponent("CharacterCameraManager")
	else
		arg_3_0.cameraManager_ = nil
	end
end

function var_0_0.GetHeroPosAndRotCfg(arg_4_0)
	local var_4_0 = arg_4_0.skinId * 100

	return HeroPosAndRotCfg[var_4_0]
end

function var_0_0.GetTag(arg_5_0)
	return PosterGirlConst.PosterGirlTag.t0
end

function var_0_0.CheckDebut(arg_6_0)
	if HomeSceneSettingData:GetIsPlay(arg_6_0.skinId) then
		return false
	end

	arg_6_0:ChangeState(PosterGirlConst.StateKay.debut)

	return true
end

function var_0_0.SkipDebut(arg_7_0)
	local var_7_0 = arg_7_0:GetCurrentState()

	if not var_7_0 or var_7_0:GetStateKey() ~= PosterGirlConst.StateKay.debut then
		return false
	end

	arg_7_0:ChangeState(PosterGirlConst.StateKay.init, true)

	return true
end

function var_0_0.CheckInitState(arg_8_0)
	local var_8_0 = arg_8_0:GetCurrentState()

	return var_8_0 and var_8_0:GetStateKey() == PosterGirlConst.StateKay.init or false
end

function var_0_0.InitTouchHelp(arg_9_0, arg_9_1)
	arg_9_0.cameraManager_.touchHelper = arg_9_1
end

function var_0_0.TouchHelpIdle(arg_10_0)
	arg_10_0.cameraManager_:TweenToDefaultCameraPos()
end

function var_0_0.TouchHelpSingleDrag(arg_11_0, arg_11_1, arg_11_2)
	if not arg_11_0:CheckInitState() then
		return
	end

	arg_11_0.cameraManager_:RotateCamera(arg_11_1, arg_11_2)
end

function var_0_0.TouchHelpMutiDrag(arg_12_0, arg_12_1)
	local var_12_0 = GameSetting.delta_to_zoom and GameSetting.delta_to_zoom.value[1] or 10

	if var_12_0 < arg_12_1 then
		arg_12_0.cameraManager_:SetActiveCamera(1)
	elseif arg_12_1 < -1 * var_12_0 then
		arg_12_0.cameraManager_:SetActiveCamera(0)
	end
end

function var_0_0.SetSelfCamera(arg_13_0, arg_13_1)
	if arg_13_1 == -1 then
		arg_13_0.cameraManager_:RemoveActiveCamera()
	else
		arg_13_0.cameraManager_:SetActiveCamera(arg_13_1)
	end

	arg_13_0:ResetCameraPos()
end

function var_0_0.ResetCameraPos(arg_14_0)
	arg_14_0.cameraManager_:ResetCameraDefaultCfg()
end

function var_0_0.UpdateCameraParams(arg_15_0)
	arg_15_0.cameraManager_:SetCameraParams(0)
	arg_15_0:SetSelfCamera(0)
end

function var_0_0.MuteCamera(arg_16_0, arg_16_1)
	SetActive(arg_16_0.cameraManager_.gameObject, not arg_16_1)
end

function var_0_0.GetState(arg_17_0, arg_17_1)
	if arg_17_0._states[arg_17_1] then
		return arg_17_0._states[arg_17_1]
	end

	local var_17_0 = PosterGirlTools.ProduceDlcState(arg_17_1, arg_17_0)

	if var_17_0 ~= nil then
		var_17_0:SetStateKey(arg_17_1)

		arg_17_0._states[arg_17_1] = var_17_0

		return var_17_0
	end
end

function var_0_0.GetInteractionCfg(arg_18_0)
	return HeroTools:GetUnlockInteractionCfg(arg_18_0.skinId)
end

function var_0_0.DoShacking(arg_19_0)
	if not arg_19_0:CheckInitState() or PosterGirlConst.ViewDirect.center ~= arg_19_0.view_direct then
		return
	end

	arg_19_0:ChangeState(PosterGirlConst.StateKay.shake)
end

function var_0_0.DoTouch(arg_20_0)
	if not arg_20_0:CheckInitState() then
		return
	end

	arg_20_0:ChangeState(PosterGirlConst.StateKay.touch)
end

function var_0_0.DoQuickTouch(arg_21_0)
	if not arg_21_0:CheckInitState() or PosterGirlConst.ViewDirect.center ~= arg_21_0.view_direct then
		return
	end

	arg_21_0:ChangeState(PosterGirlConst.StateKay.quickclick)
end

function var_0_0.DoShowing(arg_22_0)
	if not arg_22_0:CheckInitState() or PosterGirlConst.ViewDirect.center ~= arg_22_0.view_direct then
		return
	end

	arg_22_0:ChangeState(PosterGirlConst.StateKay.show)
end

function var_0_0.DoInit(arg_23_0, arg_23_1)
	if arg_23_1 == PosterGirlConst.ViewTag.home then
		arg_23_0:ChangeState(PosterGirlConst.StateKay.init)
	else
		arg_23_0:ChangeState(PosterGirlConst.StateKay.init_spec, true)
	end
end

function var_0_0.DoIdle(arg_24_0)
	if not arg_24_0:CheckInitState() then
		return
	end

	arg_24_0:ChangeState(PosterGirlConst.StateKay.idle)
end

function var_0_0.GetPlayable(arg_25_0, arg_25_1)
	for iter_25_0, iter_25_1 in ipairs(arg_25_0.playable_list) do
		if arg_25_1 == iter_25_1.name then
			return iter_25_1.playable, iter_25_1.timeLintGo
		end
	end

	local var_25_0, var_25_1 = arg_25_0:CreatPlayable(arg_25_1)

	if var_25_0 then
		local var_25_2 = {
			name = arg_25_1,
			timeLintGo = var_25_1,
			playable = var_25_0
		}

		table.insert(arg_25_0.playable_list, var_25_2)
	end

	if #arg_25_0.playable_list > 2 then
		local var_25_3 = table.remove(arg_25_0.playable_list, 1)

		Object.Destroy(var_25_3.timeLintGo)
	end

	return var_25_0, var_25_1
end

function var_0_0.CreatPlayable(arg_26_0, arg_26_1)
	local var_26_0 = string.format("UITimeLine/Charactor/%s/%s", tostring(arg_26_0.skinId), arg_26_1)
	local var_26_1 = Asset.Load(var_26_0)
	local var_26_2 = Object.Instantiate(var_26_1, arg_26_0.tpose.transform)
	local var_26_3 = var_26_2:GetComponent("PlayableDirector")

	if var_26_3 then
		local var_26_4 = var_26_3.playableAsset
		local var_26_5 = var_26_4.outputTrackCount

		for iter_26_0 = 0, var_26_5 - 1 do
			local var_26_6 = var_26_4:GetOutputTrack(iter_26_0)

			if var_26_3:GetGenericBinding(var_26_6) == nil then
				local var_26_7 = string.sub(var_26_6.name, 1, 1)

				if var_26_7 == "@" then
					local var_26_8 = string.sub(var_26_6.name, 2)
					local var_26_9
					local var_26_10 = arg_26_0.tpose.transform:Find(var_26_8)

					if var_26_10 == nil then
						local var_26_11 = GameObject.Find(var_26_8)

						if var_26_11 ~= nil then
							var_26_9 = var_26_11:GetComponent(typeof(Animator))
						end
					else
						var_26_9 = var_26_10:GetComponent(typeof(Animator))
					end

					if var_26_9 ~= nil then
						var_26_3:SetGenericBinding(var_26_6, var_26_9)
					end
				elseif var_26_7 == "#" then
					local var_26_12 = string.sub(var_26_6.name, 2)
					local var_26_13
					local var_26_14 = arg_26_0.tpose.transform:Find(var_26_12):GetComponent("CharacterEffect")

					if var_26_14 ~= nil then
						var_26_3:SetGenericBinding(var_26_6, var_26_14)
					end
				elseif var_26_7 == "&" then
					local var_26_15 = string.sub(var_26_6.name, 2)
					local var_26_16
					local var_26_17 = arg_26_0.tpose.transform:Find(var_26_15):GetComponent("CriLipsExPlayer")

					if var_26_17 ~= nil then
						var_26_3:SetGenericBinding(var_26_6, var_26_17)
					end
				end
			end
		end
	end

	return var_26_3, var_26_2
end

function var_0_0.Dispose(arg_27_0)
	for iter_27_0, iter_27_1 in ipairs(arg_27_0.playable_list) do
		Object.Destroy(iter_27_1.timeLintGo)
	end

	var_0_0.super.Dispose(arg_27_0)
end

return var_0_0
