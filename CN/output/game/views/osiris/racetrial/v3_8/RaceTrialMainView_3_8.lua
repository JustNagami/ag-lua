local var_0_0 = class("RaceTrialMainView_3_8", ActivityMainBasePanel)

function var_0_0.GetUIName(arg_1_0)
	return RaceTrialTools.GetMainUIName(arg_1_0.activityID_)
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:InitUI()
	arg_3_0:AddUIListeners()
end

function var_0_0.InitUI(arg_4_0)
	arg_4_0:BindCfgUI()
end

function var_0_0.AddUIListeners(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.m_descBtn, nil, function()
		local var_6_0 = GetTips("ACTIVITY_OSIRIS_TACE_TRIAL_DESCRIPE")

		JumpTools.OpenPageByJump("gameHelp", {
			icon = "icon_i",
			key = "ACTIVITY_OSIRIS_TACE_TRIAL_DESCRIPE",
			iconColor = Color(1, 1, 1),
			title = GetTips("STAGE_DESCRIPE"),
			content = var_6_0
		})
	end)
	arg_5_0:AddBtnListener(arg_5_0.m_entrustBtn, nil, function()
		if not arg_5_0:IsActivityTime(arg_5_0.activityID_) then
			return
		end

		JumpTools.OpenPageByJump("/raceTrialEnter", {
			activityID = arg_5_0.activityID_
		})
	end)
end

function var_0_0.RefreshTimeText(arg_8_0)
	if arg_8_0.m_timeLab then
		arg_8_0.m_timeLab.text = manager.time:GetLostTimeStrWith2UnitWithPrefix(arg_8_0.stopTime_, true)
	end
end

function var_0_0.Dispose(arg_9_0)
	arg_9_0:RemoveAllListeners()
	var_0_0.super.Dispose(arg_9_0)
end

return var_0_0
