local var_0_0 = class("DormTaskRunner.Task")

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.progress = 0
	arg_1_0.taskList = {}
	arg_1_0.taskDataCtx = arg_1_1 or {}
	arg_1_0.taskDataCtx.task = arg_1_0
end

function var_0_0.Then(arg_2_0, arg_2_1, arg_2_2)
	local function var_2_0(arg_3_0)
		if arg_2_1 then
			arg_2_1(arg_3_0)
		end

		return true, arg_3_0
	end

	arg_2_2 = arg_2_2 or {}
	arg_2_2.taskDataCtx = arg_2_0.taskDataCtx

	table.insert(arg_2_0.taskList, {
		var_2_0,
		true,
		arg_2_2
	})

	return arg_2_0
end

function var_0_0.WaitUntil(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
	arg_4_3 = arg_4_3 or {}
	arg_4_3.taskDataCtx = arg_4_0.taskDataCtx

	table.insert(arg_4_0.taskList, {
		arg_4_1,
		arg_4_2,
		arg_4_3
	})

	return arg_4_0
end

local function var_0_1(arg_5_0)
	local var_5_0 = arg_5_0.timer

	if not var_5_0.running then
		var_5_0:Start()
	end

	return var_5_0.timeout
end

local function var_0_2()
	return true
end

function var_0_0.WaitForSec(arg_7_0, arg_7_1, arg_7_2)
	if arg_7_1 == 0 then
		return arg_7_0:WaitUntil(var_0_2, arg_7_2)
	end

	return arg_7_0:WaitUntil(var_0_1, arg_7_2, {
		timer = arg_7_0.taskRunner:NewTimer(nil, arg_7_1, false, false)
	})
end

function var_0_0.WaitTask(arg_8_0, ...)
	local var_8_0 = {
		...
	}

	return arg_8_0:WaitUntil(function()
		for iter_9_0, iter_9_1 in ipairs(var_8_0) do
			if not iter_9_1:IsFinished() then
				return false
			end
		end

		return true
	end)
end

function var_0_0.HandleAnimeLoop(arg_10_0, arg_10_1)
	local var_10_0 = {
		continue = false,
		started = false
	}

	DormCharacterActionManager:RegisterAnimeEvent(function(arg_11_0, arg_11_1, ...)
		if var_10_0.started and arg_10_1(arg_11_0, arg_11_1, ...) then
			var_10_0.continue = true

			return true
		end
	end)

	if #arg_10_0.taskList >= 1 then
		arg_10_0.taskList[#arg_10_0.taskList][2] = false
	end

	return arg_10_0:WaitUntil(function(arg_12_0)
		if not arg_12_0.started then
			arg_12_0.started = true
		end

		return arg_12_0.continue
	end, false, var_10_0)
end

function var_0_0.Start(arg_13_0, arg_13_1)
	arg_13_0.progress = 1

	if not arg_13_1 then
		arg_13_0.taskRunner:DoTask(arg_13_0)
	end

	arg_13_0.taskRunner:RegisterTask(arg_13_0)
end

function var_0_0.SetRunner(arg_14_0, arg_14_1)
	arg_14_0.taskRunner = arg_14_1
end

function var_0_0.Abort(arg_15_0)
	if arg_15_0.progress ~= -1 and not arg_15_0:IsFinished() then
		arg_15_0.progress = -1

		if arg_15_0.onAbort then
			arg_15_0:onAbort()
		end
	end
end

function var_0_0.IsCancelled(arg_16_0)
	if arg_16_0.cancellationSrc then
		return arg_16_0.cancellationSrc()
	end
end

function var_0_0.IsStarted(arg_17_0)
	return arg_17_0.progress ~= 0
end

function var_0_0.IsFinished(arg_18_0)
	return arg_18_0.progress > #arg_18_0.taskList
end

function var_0_0.IsAborted(arg_19_0)
	return arg_19_0.progress == -1
end

function var_0_0.SetCancellationSrc(arg_20_0, arg_20_1)
	arg_20_0.cancellationSrc = arg_20_1

	return arg_20_0
end

function var_0_0.SetOnAbort(arg_21_0, arg_21_1)
	arg_21_0.onAbort = arg_21_1

	return arg_21_0
end

function var_0_0.SetOnComplete(arg_22_0, arg_22_1)
	arg_22_0.onComplete = arg_22_1

	return arg_22_0
end

return var_0_0
