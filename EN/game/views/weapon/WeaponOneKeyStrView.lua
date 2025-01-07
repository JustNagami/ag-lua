local var_0_0 = import("game.views.weapon.WeaponStrView")
local var_0_1 = class("WeaponOneKeyStrView", var_0_0)

function var_0_1.OnEnter(arg_1_0)
	arg_1_0:CheckBack()

	local var_1_0 = arg_1_0.params_

	arg_1_0:RefreshStrSuccess(var_1_0.oriLv, var_1_0.afterLv, var_1_0.beforeBreak, var_1_0.afterBreak)
end

function var_0_1.RefreshStrSuccess(arg_2_0, arg_2_1, arg_2_2, arg_2_3, arg_2_4)
	arg_2_0.descChangeText_.text = arg_2_1
	arg_2_0.desctextText_.text = arg_2_2

	local var_2_0 = WeaponTools.WeaponAtk(arg_2_1, arg_2_3)
	local var_2_1 = WeaponTools.WeaponAtk(arg_2_2, arg_2_4)

	arg_2_0.originText_.text = string.format("%d", var_2_0)
	arg_2_0.afterText_.text = string.format("%d", var_2_1)
end

return var_0_1
