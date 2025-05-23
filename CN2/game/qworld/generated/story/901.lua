﻿BaseStoryGraph = import("game.qworld.story.Graph.BaseStoryGraph")

local var_0_0 = class("901", BaseStoryGraph)

function var_0_0.Identify(arg_1_0)
	return "901"
end

function var_0_0.ConfigPath(arg_2_0)
	return "QWWorld/StoryGraph/901"
end

function var_0_0.StartStory(arg_3_0)
	arg_3_0:DialogueNode_1()
end

function var_0_0.DialogueNode_1(arg_4_0)
	arg_4_0:EnableCameraCutAction(true)
	arg_4_0:ShowTalkView()
	arg_4_0:SetTalkContent(901, "", 0)

	local var_4_0 = {
		Length = 1,
		[0] = {
			id = 902,
			icon = "",
			Invoke = function()
				arg_4_0:Next(902)
			end
		}
	}

	arg_4_0:SetChoice(var_4_0, true)
	arg_4_0:SetNeedSkip(false, nil)
	arg_4_0:SetNeedClick(false, nil)
	arg_4_0:OnNext(function(arg_6_0)
		arg_4_0:ClearOnNext()
		arg_4_0:CloseChoice()

		if arg_6_0 == 902 then
			arg_4_0:DialogueBranchNode_2()
		end
	end)
end

function var_0_0.DialogueBranchNode_2(arg_7_0)
	arg_7_0:OnNext(function()
		arg_7_0:ClearOnNext()
		arg_7_0:DialogueNode_3()
	end)
	arg_7_0:Next()
end

function var_0_0.DialogueNode_3(arg_9_0)
	arg_9_0:ShowTalkView()
	arg_9_0:SetTalkContent(903, "", 0)
	arg_9_0:SetNeedSkip(false, {
		Invoke = function()
			arg_9_0:Skip()
		end
	})
	arg_9_0:SetNeedClick(true, {
		Invoke = function()
			arg_9_0:Next()
		end
	})
	arg_9_0:OnNext(function(arg_12_0)
		arg_9_0:ClearOnNext()
		arg_9_0:CloseStoryEventNode_4()
	end)
end

function var_0_0.CloseStoryEventNode_4(arg_13_0)
	arg_13_0:EnableCameraCutAction(false)
	arg_13_0:EndStory()
end

return var_0_0
