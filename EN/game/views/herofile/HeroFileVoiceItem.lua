﻿local var_0_0 = class("HeroFileVoiceItem", ReduxView)

function var_0_0.OnCtor(arg_1_0, arg_1_1)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_1.transform

	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	arg_2_0:InitUI()
	arg_2_0:AddUIListener()
end

function var_0_0.InitUI(arg_3_0)
	arg_3_0:BindCfgUI()

	arg_3_0.lockController_ = arg_3_0.voiceControllerEx_:GetController("lock")
	arg_3_0.playController_ = arg_3_0.voiceControllerEx_:GetController("playing")
end

function var_0_0.SetData(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
	arg_4_0.unlock_ = arg_4_2.unlock
	arg_4_0.onClick_ = arg_4_3
	arg_4_0.id_ = arg_4_2.id

	if arg_4_2.unlock then
		arg_4_0.lockController_:SetSelectedState("unlock")

		arg_4_0.voiceNameText_.text = HeroVoiceCfg[arg_4_2.id].title
	else
		arg_4_0.lockController_:SetSelectedState("lock")

		arg_4_0.voiceNameText_.text = HeroVoiceCfg[arg_4_2.id].title

		if DormHeroTools:IsVoiceNeedUnlock(arg_4_2.id, arg_4_1) then
			arg_4_0.voiceLockText_.text = string.format(GetTips("DORM_VOICE_UNLOCK_TIP"), DormHeroTools:GetVoiceUnlockLevel(arg_4_1, arg_4_2.id))
		else
			local var_4_0 = HeroVoiceCfg[arg_4_2.id].unlock_condition

			if var_4_0 and var_4_0 ~= 0 then
				arg_4_0.voiceLockText_.text = ConditionCfg[var_4_0].desc
			else
				arg_4_0.voiceLockText_.text = ""
			end
		end
	end
end

function var_0_0.SetIsShow(arg_5_0, arg_5_1)
	SetActive(arg_5_0.gameObject_, arg_5_1)
end

function var_0_0.AddUIListener(arg_6_0)
	arg_6_0:AddBtnListener(arg_6_0.voiceBtn_, nil, function()
		if arg_6_0.onClick_ and arg_6_0.unlock_ then
			arg_6_0.onClick_(arg_6_0.id_)
		end
	end)
end

function var_0_0.StopPlay(arg_8_0)
	arg_8_0.playController_:SetSelectedState("stop")
end

function var_0_0.StartPlay(arg_9_0)
	arg_9_0.playController_:SetSelectedState("play")
end

function var_0_0.Dispose(arg_10_0)
	var_0_0.super.Dispose(arg_10_0)
end

return var_0_0
