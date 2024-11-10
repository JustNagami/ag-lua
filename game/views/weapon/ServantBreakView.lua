local var_0_0 = class("ServantBreakView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/System/Hero_servant/HeroServantLvupPopUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiPop.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:InitUI()
	arg_3_0:AddUIListener()
end

function var_0_0.InitUI(arg_4_0)
	arg_4_0:BindCfgUI()
end

function var_0_0.AddUIListener(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.maskBtn_, nil, function()
		arg_5_0:Back()
	end)
end

function var_0_0.OnEnter(arg_7_0)
	arg_7_0:RefreshBreakSuccess(arg_7_0.params_.stage)
end

function var_0_0.OnExit(arg_8_0)
	return
end

function var_0_0.RefreshBreakSuccess(arg_9_0, arg_9_1)
	arg_9_0.nextLevelTxt_.text = arg_9_1 + 1
	arg_9_0.afterText_.text = arg_9_1
end

function var_0_0.Cacheable(arg_10_0)
	return false
end

return var_0_0
