local var_0_0 = (...):gsub("%.SevenDaySkinData_New", "")
local var_0_1 = require(var_0_0 .. ".SignInfoStruct_New")
local var_0_2 = singletonClass("SevenDaySkinData_New")

function var_0_2.Ctor(arg_1_0)
	arg_1_0.activity_map = {}
end

function var_0_2.InitData(arg_2_0, arg_2_1)
	print("七日签到皮肤初始化", 11097)

	local var_2_0 = var_0_1.New(arg_2_1)

	arg_2_0.activity_map[arg_2_1.activity_id] = var_2_0

	arg_2_0:UpdateRedDotCount(arg_2_1.activity_id)
end

function var_0_2.Clear(arg_3_0)
	if not arg_3_0.activity_map then
		return
	end

	for iter_3_0, iter_3_1 in pairs(arg_3_0.activity_map) do
		iter_3_1:OnCrossDayNew()
		var_0_2:UpdateRedDotCount(iter_3_0)
	end
end

function var_0_2.MaxSignDay(arg_4_0)
	local var_4_0 = ActivityCumulativeSignCfg[arg_4_0.activity_id]

	return var_4_0 and #var_4_0.config_list or 7
end

function var_0_2.GetActivityData(arg_5_0, arg_5_1)
	arg_5_0.activity_map = arg_5_0.activity_map or {}

	local var_5_0 = arg_5_0.activity_map[arg_5_1]

	if not var_5_0 then
		var_5_0 = var_0_1.New({
			activity_id = arg_5_1
		})
		arg_5_0.activity_map[arg_5_1] = var_5_0
	end

	return var_5_0
end

function var_0_2.UpdateActivityData(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0:GetActivityData(arg_6_1):Update(arg_6_2)
	arg_6_0:UpdateRedDotCount(arg_6_1)
end

function var_0_2.UpdateUnlockTimes(arg_7_0, arg_7_1)
	arg_7_0:GetActivityData(arg_7_1):UpdateUnlockTimes()
end

function var_0_2.GetRedDotCount(arg_8_0, arg_8_1)
	return arg_8_0:GetActivityData(arg_8_1):RedDotCount()
end

function var_0_2.UpdateRedDotCount(arg_9_0, arg_9_1)
	local var_9_0 = string.format("%s_%s", RedPointConst.SEVEN_DAY_SIGN_SKIN, arg_9_1)
	local var_9_1 = arg_9_0:GetRedDotCount(arg_9_1)

	print(arg_9_1, "------------------------->", var_9_1)
	manager.redPoint:setTip(var_9_0, var_9_1)
end

return var_0_2
