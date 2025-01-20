QWORLD_GOTO_TYPE = {
	TELEPORT = 1,
	Activity = 4,
	JUMP = 2,
	StopStory = 3,
	OpenMiniMap = 5
}
BaseGoto = import("game.qworld.go.BaseGoto")

return {
	Init = function(arg_1_0)
		arg_1_0._modules = {}
		arg_1_0._modules[QWORLD_GOTO_TYPE.TELEPORT] = import("game.qworld.go.goto.GotoTeleport").New()
		arg_1_0._modules[QWORLD_GOTO_TYPE.JUMP] = import("game.qworld.go.goto.GotoJump").New()
		arg_1_0._modules[QWORLD_GOTO_TYPE.StopStory] = import("game.qworld.go.goto.GotoStopStory").New()
		arg_1_0._modules[QWORLD_GOTO_TYPE.Activity] = import("game.qworld.go.goto.GotoActivity").New()
		arg_1_0._modules[QWORLD_GOTO_TYPE.OpenMiniMap] = import("game.qworld.go.goto.GotoOpenMiniMap").New()
	end,
	Goto = function(arg_2_0, arg_2_1, ...)
		local var_2_0 = arg_2_0._modules[arg_2_1]

		if var_2_0 ~= nil then
			var_2_0:Go(...)
		else
			print("Go type not defined. " .. arg_2_1 or "null")
		end
	end
}
