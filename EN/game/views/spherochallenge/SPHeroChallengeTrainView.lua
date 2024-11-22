local var_0_0 = class("SPHeroChallengeTrainView", import(".SPHeroChallengeBattleStageBaseView"))

function var_0_0.UIName(arg_1_0)
	return "Widget/System/SPHeroChallenge/SPHeroChallengeTrainUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.OnCtor(arg_3_0)
	return
end

function var_0_0.Init(arg_4_0)
	arg_4_0:InitUI()
	arg_4_0:AddUIListener()
end

function var_0_0.InitUI(arg_5_0)
	arg_5_0:BindCfgUI()

	arg_5_0.lockController = arg_5_0.controller:GetController("open")
end

function var_0_0.OnEnter(arg_6_0)
	arg_6_0:RefreshBar()

	if not arg_6_0.params_.showFlag then
		arg_6_0.lockController:SetSelectedState("no")

		if arg_6_0.params_.reason then
			arg_6_0.lockdescText_.text = GetTips(arg_6_0.params_.reason)
		end
	else
		arg_6_0.lockController:SetSelectedState("open")
	end
end

function var_0_0.RefreshBar(arg_7_0)
	return
end

function var_0_0.OnExit(arg_8_0)
	arg_8_0:RemoveAllEventListener()
end

function var_0_0.AddUIListener(arg_9_0)
	for iter_9_0 = SpHeroChallengeConst.BattleSubType.train1, SpHeroChallengeConst.BattleSubType.train3 do
		arg_9_0:AddBtnListener(arg_9_0["trainitem" .. iter_9_0 .. "Btn_"], nil, function()
			JumpTools.OpenPageByJump("/spHeroChallengeTrainStageView", {
				playAnimation = true,
				trainType = iter_9_0
			})
		end)
	end
end

function var_0_0.Dispose(arg_11_0)
	var_0_0.super.Dispose(arg_11_0)
end

return var_0_0
