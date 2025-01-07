local var_0_0 = class("PosterGirlBaseState")

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.actor = arg_1_1
	arg_1_0.state_key = nil
end

function var_0_0.Enter(arg_2_0)
	return
end

function var_0_0.Exit(arg_3_0, arg_3_1)
	return
end

function var_0_0.SetStateKey(arg_4_0, arg_4_1)
	arg_4_0.state_key = arg_4_1
end

function var_0_0.GetStateKey(arg_5_0)
	return arg_5_0.state_key
end

function var_0_0.CanPlayNextAni(arg_6_0)
	return false
end

return var_0_0
