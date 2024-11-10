local var_0_0 = class("IdolTraineeHeadItem", ReduxView)

function var_0_0.OnCtor(arg_1_0, arg_1_1)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_1.transform

	arg_1_0:InitUI()
end

function var_0_0.InitUI(arg_2_0)
	arg_2_0:BindCfgUI()
	arg_2_0:AddUIListener()

	arg_2_0.selectController_ = arg_2_0.mainControllerEx_:GetController("select")
	arg_2_0.defendController_ = arg_2_0.mainControllerEx_:GetController("defend")
	arg_2_0.attackController_ = arg_2_0.mainControllerEx_:GetController("attack")
end

function var_0_0.AddUIListener(arg_3_0)
	arg_3_0:AddBtnListener(arg_3_0.btn_, nil, function()
		if arg_3_0.click_ then
			arg_3_0.click_()
		end
	end)
end

function var_0_0.SetData(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	arg_5_0.heroID_ = arg_5_1
	arg_5_0.click_ = arg_5_3

	local var_5_0 = IdolTraineeTools:GetHeroBattleInfoTemplate(arg_5_1)

	arg_5_0.headIcon_.sprite = var_5_0.heroIcon

	arg_5_0.defendController_:SetSelectedState(IdolTraineeTools:CheckHeroIsDefine(arg_5_1) and "true" or "false")
	arg_5_0.attackController_:SetSelectedState(IdolTraineeTools:CheckHeroIsAttack(arg_5_1) and "true" or "false")
	arg_5_0.selectController_:SetSelectedState(arg_5_1 == arg_5_2 and "true" or "false")
end

function var_0_0.SelectOn(arg_6_0)
	arg_6_0.selectController_:SetSelectedState("true")
end

function var_0_0.SelectOff(arg_7_0)
	arg_7_0.selectController_:SetSelectedState("false")
end

function var_0_0.Dispose(arg_8_0)
	var_0_0.super.Dispose(arg_8_0)
end

return var_0_0
