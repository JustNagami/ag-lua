local var_0_0 = import("game.reserve.ReserveContDataTemplate")
local var_0_1 = class("ReserveProposalContDataTemplate", var_0_0)

function var_0_1.Ctor(arg_1_0, arg_1_1, arg_1_2)
	var_0_1.super.Ctor(arg_1_0, arg_1_1, arg_1_2)

	arg_1_0.isTemp = false
	arg_1_0.name = ""
end

function var_0_1.SetName(arg_2_0, arg_2_1)
	arg_2_0.name = arg_2_1
end

function var_0_1.GetName(arg_3_0)
	return arg_3_0.name
end

function var_0_1.GetIsTemp(arg_4_0)
	return arg_4_0.isTemp
end

function var_0_1.SetIsTemp(arg_5_0, arg_5_1)
	arg_5_0.isTemp = arg_5_1
end

function var_0_1.Reset(arg_6_0)
	var_0_1.super.Reset(arg_6_0)

	arg_6_0.isTemp = false
	arg_6_0.name = ""
end

return var_0_1
