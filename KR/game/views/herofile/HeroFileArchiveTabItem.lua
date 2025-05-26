local var_0_0 = class("HeroFileArchiveTabItem", ReduxView)

function var_0_0.OnCtor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_1.transform
	arg_1_0.itemIndex = arg_1_2
	arg_1_0.onClick_ = arg_1_3

	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	arg_2_0:InitUI()
	arg_2_0:AddUIListener()
end

function var_0_0.InitUI(arg_3_0)
	arg_3_0:BindCfgUI()

	arg_3_0.titleText_.text = string.format(GetTips("HERO_RECORD_HEART_CHAIN"), arg_3_0.itemIndex)
	arg_3_0.lockController_ = arg_3_0.linktabitemControllerEx_:GetController("lock")
	arg_3_0.selectController_ = arg_3_0.linktabitemControllerEx_:GetController("select")
end

function var_0_0.AddUIListener(arg_4_0)
	arg_4_0:AddBtnListener(arg_4_0.selectBtn_, nil, arg_4_0.onClick_)
end

function var_0_0.SetLockState(arg_5_0, arg_5_1)
	arg_5_0.lockController_:SetSelectedState(arg_5_1 and "lock" or "unlock")
end

function var_0_0.SetSelectState(arg_6_0, arg_6_1)
	arg_6_0.selectController_:SetSelectedState(arg_6_1 and "select" or "cancel")
end

function var_0_0.Dispose(arg_7_0)
	var_0_0.super.Dispose(arg_7_0)
end

return var_0_0
