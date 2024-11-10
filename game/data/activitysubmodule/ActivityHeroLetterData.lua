local var_0_0 = singletonClass("ActivityHeroLetterData")
local var_0_1 = {}

function var_0_0.Init(arg_1_0)
	var_0_1 = {}
end

function var_0_0.SetData(arg_2_0, arg_2_1)
	var_0_1[arg_2_1.activity_id] = arg_2_1.sign
end

function var_0_0.SetRewardSign(arg_3_0, arg_3_1, arg_3_2)
	var_0_1[arg_3_1] = arg_3_2 and 1 or 0
end

function var_0_0.GetRewwardSign(arg_4_0, arg_4_1)
	return var_0_1[arg_4_1] or 1
end

return var_0_0
