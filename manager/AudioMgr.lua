local var_0_0 = class("AudioMgr")
local var_0_1 = {
	"music",
	"effect",
	"voice"
}

function var_0_0.Ctor(arg_1_0)
	arg_1_0:OnCtor()
end

function var_0_0.OnCtor(arg_2_0)
	return
end

function var_0_0.InitListener(arg_3_0)
	print("Initialize Audio Mgr")
	AudioManager.Instance:SetListener(manager.ui.mainCamera)
	AudioManager.Instance:CreateCriAtom()
end

function var_0_0.SetLocalizationFlag(arg_4_0, arg_4_1)
	AudioManager.Instance:SetLocalizationFlag(arg_4_1)
end

function var_0_0.GetLocalizationFlag(arg_5_0)
	return AudioManager.Instance:GetLocalizationFlag()
end

function var_0_0.SetAudioMasterMute(arg_6_0, arg_6_1)
	AudioManager.Instance:SetAudioMasterMute(arg_6_1)
end

function var_0_0.ClearBGMFlag(arg_7_0)
	local var_7_0 = AudioManager.Instance:GetPlayer(var_0_1[1])

	if var_7_0 ~= nil then
		var_7_0.cueName = ""
	end
end

function var_0_0.PlayBGM(arg_8_0, arg_8_1, arg_8_2, arg_8_3)
	return AudioManager.Instance:Play(var_0_1[1], arg_8_1, arg_8_2, arg_8_3 ~= "" and arg_8_3 ~= nil)
end

function var_0_0.AddCue(arg_9_0, arg_9_1, arg_9_2, arg_9_3)
	AudioManager.Instance:AddCue(arg_9_1, arg_9_2, arg_9_3)
end

function var_0_0.PlayEffect(arg_10_0, arg_10_1, arg_10_2, arg_10_3)
	return AudioManager.Instance:Play(var_0_1[2], arg_10_1, arg_10_2, arg_10_3 ~= "" and arg_10_3 ~= nil)
end

function var_0_0.StopEffect(arg_11_0)
	AudioManager.Instance:Stop(var_0_1[2])
end

function var_0_0.PlayVoice(arg_12_0, arg_12_1, arg_12_2, arg_12_3)
	return AudioManager.Instance:Play(var_0_1[3], arg_12_1, arg_12_2, arg_12_3 ~= "" and arg_12_3 ~= nil)
end

function var_0_0.StopVoice(arg_13_0)
	AudioManager.Instance:Stop(var_0_1[3])
end

function var_0_0.StopVoiceImmediate(arg_14_0)
	AudioManager.Instance:StopImmediate(var_0_1[3])
end

function var_0_0.PauseVoice(arg_15_0, arg_15_1)
	AudioManager.Instance:Pause(var_0_1[3], arg_15_1)
end

function var_0_0.IsStoppedOfVoice(arg_16_0)
	return AudioManager.Instance:IsStopped(var_0_1[3])
end

function var_0_0.GetVoiceLength(arg_17_0, arg_17_1, arg_17_2, arg_17_3)
	return AudioManager.Instance:GetCueInfoLength(var_0_1[3], arg_17_1, arg_17_2, arg_17_3 ~= "")
end

function var_0_0.StopBgmImmediate(arg_18_0)
	AudioManager.Instance:StopImmediate(var_0_1[1])
end

function var_0_0.Play(arg_19_0, arg_19_1, arg_19_2, arg_19_3, arg_19_4)
	return AudioManager.Instance:Play(arg_19_1, arg_19_2, arg_19_3, arg_19_4 ~= "" and arg_19_4 ~= nil)
end

function var_0_0.Pause(arg_20_0, arg_20_1, arg_20_2)
	AudioManager.Instance:Pause(arg_20_1, arg_20_2)
end

function var_0_0.PauseAll(arg_21_0, arg_21_1)
	AudioManager.Instance:PauseAll(arg_21_1)
end

function var_0_0.Stop(arg_22_0, arg_22_1)
	AudioManager.Instance:Stop(arg_22_1)
end

function var_0_0.StopAll(arg_23_0)
	AudioManager.Instance:StopAll()
end

function var_0_0.RemoveCue(arg_24_0, arg_24_1)
	AudioManager.Instance:RemoveCue(arg_24_1)
end

function var_0_0.SetVolume(arg_25_0, arg_25_1, arg_25_2)
	AudioManager.Instance:SetVolume(arg_25_1, arg_25_2)
end

function var_0_0.GetVolume(arg_26_0, arg_26_1)
	return AudioManager.Instance:GetVolume(arg_26_1)
end

function var_0_0.GetMusicVolume(arg_27_0)
	return AudioManager.Instance:GetVolume(var_0_1[1])
end

function var_0_0.GetEffectVolume(arg_28_0)
	return AudioManager.Instance:GetVolume(var_0_1[2])
end

function var_0_0.GetVoiceVolume(arg_29_0)
	return AudioManager.Instance:GetVolume(var_0_1[3])
end

function var_0_0.PlayUIAudio(arg_30_0, arg_30_1)
	AudioManager.Instance:PlayUIAudio(arg_30_1)
end

function var_0_0.PlayUIAudioByVoice(arg_31_0, arg_31_1)
	local var_31_0 = -1

	if arg_31_1 == "open_battel" then
		var_31_0 = 14
	elseif arg_31_1 == "expup" then
		var_31_0 = 17
	elseif arg_31_1 == "pro1" then
		var_31_0 = 18
	elseif arg_31_1 == "pro2" then
		var_31_0 = 18
	elseif arg_31_1 == "pro3" then
		var_31_0 = 19
	elseif arg_31_1 == "sign_in" then
		var_31_0 = 20
	elseif arg_31_1 == "stage_slide" then
		var_31_0 = 21
	elseif arg_31_1 == "equip" then
		var_31_0 = 22
	elseif arg_31_1 == "hero_change" then
		var_31_0 = 25
	end

	if var_31_0 ~= -1 then
		manager.audio:PlayUIAudio(var_31_0)
	end
end

function var_0_0.SetEffectSelectorLabel(arg_32_0, arg_32_1, arg_32_2)
	AudioManager.Instance:SetSelectorLabel(var_0_1[2], arg_32_1, arg_32_2)
end

function var_0_0.SetObtainGoldSelectorLabel(arg_33_0)
	AudioManager.Instance:SetSelectorLabel(var_0_1[2], "search", "gold")
end

function var_0_0.SetObtainPurpleSelectorLabel(arg_34_0)
	AudioManager.Instance:SetSelectorLabel(var_0_1[2], "search", "purple")
end

function var_0_0.SetObtainBlueSelectorLabel(arg_35_0)
	AudioManager.Instance:SetSelectorLabel(var_0_1[2], "search", "blue")
end

function var_0_0.Dispose(arg_36_0)
	return
end

function var_0_0.DestoryCriAtom(arg_37_0)
	AudioManager.Instance:DestoryCriAtom()
end

function var_0_0.GetBgmPlayer(arg_38_0)
	return AudioManager.Instance:GetPlayer(var_0_1[1])
end

function var_0_0.SetBgmAisacControl(arg_39_0, arg_39_1, arg_39_2)
	return AudioManager.Instance:SetAisacControl(var_0_1[1], arg_39_1, arg_39_2)
end

function var_0_0.ResetParametersBgm(arg_40_0)
	AudioManager.Instance:ResetParameters(var_0_1[1])
end

function var_0_0.SetEffectAisacControl(arg_41_0, arg_41_1, arg_41_2)
	return AudioManager.Instance:SetAisacControl(var_0_1[2], arg_41_1, arg_41_2)
end

function var_0_0.SetStartTime(arg_42_0, arg_42_1)
	AudioManager.Instance:SetStartTime(var_0_1[1], arg_42_1)
end

return var_0_0
