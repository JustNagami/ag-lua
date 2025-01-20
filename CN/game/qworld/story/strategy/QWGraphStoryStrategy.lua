﻿QWBaseStoryStrategy = import("game.qworld.story.strategy.BaseStoryStrategy")

local var_0_0 = class("QWGraphStoryStrategy", QWBaseStoryStrategy)

function var_0_0.OnInit(arg_1_0)
	arg_1_0.graphInstance = nil
end

function var_0_0.OnStartStory(arg_2_0, arg_2_1)
	arg_2_0.graphInstance = import("game.qworld.generated.story." .. arg_2_1).New()

	if arg_2_0.graphInstance then
		arg_2_0.graphInstance:Start()
	else
		Debug.LogError("不存在的故事图: " .. arg_2_1)
	end
end

function var_0_0.OnEndStory(arg_3_0)
	if arg_3_0.graphInstance then
		arg_3_0.graphInstance:OnStopStory()

		arg_3_0.graphInstance = nil
	end
end

function var_0_0.PreContinueStop(arg_4_0)
	if arg_4_0.graphInstance then
		arg_4_0.graphInstance:PreContinueStop()

		arg_4_0.graphInstance = nil
	end
end

return var_0_0
