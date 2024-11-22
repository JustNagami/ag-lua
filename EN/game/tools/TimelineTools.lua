local var_0_0 = {}
local var_0_1
local var_0_2
local var_0_3 = handler(var_0_0, var_0_0.StopCallback)

function var_0_0.StopCallback()
	var_0_1.stopped = var_0_1.stopped - var_0_0.StopCallback
	var_0_1.extrapolationMode = UnityEngine.Playables.DirectorWrapMode.Loop

	if var_0_2 ~= nil then
		var_0_2()

		var_0_2 = nil
	end

	var_0_1 = nil
end

function var_0_0.PlayTimelineWithCallback(arg_2_0, arg_2_1, arg_2_2)
	if var_0_1 ~= nil then
		var_0_1.stopped = var_0_1.stopped - var_0_0.StopCallback
	end

	var_0_1 = arg_2_0
	var_0_2 = arg_2_2

	arg_2_0:Play(arg_2_1)

	arg_2_0.extrapolationMode = UnityEngine.Playables.DirectorWrapMode.None
	arg_2_0.time = 0
	arg_2_0.stopped = arg_2_0.stopped + var_0_0.StopCallback
end

return var_0_0
