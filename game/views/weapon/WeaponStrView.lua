local var_0_0 = class("WeaponStrView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/System/Hero_key/HeroKeyLvupPopUI"
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
	arg_5_0:AddBtnListener(arg_5_0.bgmask_, nil, function()
		arg_5_0:Back()
		arg_5_0.params_.callback()
	end)
end

function var_0_0.OnEnter(arg_7_0)
	local var_7_0 = arg_7_0.params_

	arg_7_0:RefreshStrSuccess(var_7_0.oriLv, var_7_0.afterLv, var_7_0.breakthrough)
end

function var_0_0.OnExit(arg_8_0)
	return
end

function var_0_0.RefreshStrSuccess(arg_9_0, arg_9_1, arg_9_2, arg_9_3)
	arg_9_0.descChangeText_.text = arg_9_1
	arg_9_0.desctextText_.text = arg_9_2

	local var_9_0 = WeaponTools.WeaponAtk(arg_9_1, arg_9_3)
	local var_9_1 = WeaponTools.WeaponAtk(arg_9_2, arg_9_3)

	arg_9_0.originText_.text = string.format("%d", var_9_0)
	arg_9_0.afterText_.text = string.format("%d", var_9_1)
end

function var_0_0.Cacheable(arg_10_0)
	return false
end

function var_0_0.Dispose(arg_11_0)
	arg_11_0:RemoveAllListeners()
	var_0_0.super.Dispose(arg_11_0)
end

return var_0_0
