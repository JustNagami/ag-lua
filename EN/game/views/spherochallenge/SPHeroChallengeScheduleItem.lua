local var_0_0 = class("SPHeroChallengeScheduleItem", ReduxView)

function var_0_0.OnCtor(arg_1_0, arg_1_1)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_1.transform

	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	arg_2_0:InitUI()
end

function var_0_0.InitUI(arg_3_0)
	arg_3_0:BindCfgUI()

	arg_3_0.stateController = arg_3_0.controller:GetController("State")
end

function var_0_0.RefreshUI(arg_4_0, arg_4_1)
	local var_4_0 = SPHeroChallengeData:GetCurActivityInfo()

	if var_4_0 then
		local var_4_1 = var_4_0:GetStartListScheduleInfoByList(arg_4_1)

		if var_4_1 then
			local var_4_2 = var_4_1.scheduleID

			arg_4_0.imageImg_.sprite = SPHeroChallengeTools:GetScheduleIcon(var_4_2)
			arg_4_0.schedulenameText_.text = ActivityHeroChallengeScheduleCfg[var_4_2].name
			arg_4_0.scheduledescText_.text = ActivityHeroChallengeScheduleCfg[var_4_2].linkgame_des

			if var_4_1.isFinish then
				arg_4_0.stateController:SetSelectedState("Done")
			else
				arg_4_0.stateController:SetSelectedState("Normal")
			end

			UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_4_0.trs1_)
			UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_4_0.trs2_)
			UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_4_0.trs3_)
			UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_4_0.trs4_)
			UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_4_0.trs5_)
			UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_4_0.trs6_)

			arg_4_0.Timer = FrameTimer.New(function()
				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_4_0.trs1_)
				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_4_0.trs2_)
				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_4_0.trs3_)
				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_4_0.trs4_)
				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_4_0.trs5_)
				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_4_0.trs6_)

				if arg_4_0.Timer then
					arg_4_0.Timer:Stop()

					arg_4_0.Timer = nil
				end
			end, 1, 1)

			arg_4_0.Timer:Start()
		else
			arg_4_0.stateController:SetSelectedState("add")
		end
	end
end

function var_0_0.AddUIListener(arg_6_0)
	arg_6_0:AddBtnListener(arg_6_0.addBtn_, nil, function()
		if arg_6_0.state == "empty" then
			JumpTools.OpenPageByJump("/spHeroChallengeScheduleView")
		end
	end)
end

function var_0_0.Dispose(arg_8_0)
	arg_8_0.gameObject_ = nil
	arg_8_0.transform_ = nil

	if arg_8_0.Timer then
		arg_8_0.Timer:Stop()
	end

	var_0_0.super.Dispose(arg_8_0)
end

return var_0_0
