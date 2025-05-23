﻿BaseStoryGraph = import("game.qworld.story.Graph.BaseStoryGraph")

local var_0_0 = class("11025", BaseStoryGraph)

function var_0_0.Ctor(arg_1_0)
	var_0_0.super.Ctor(arg_1_0)
	arg_1_0:RegisterFuncMap()
end

function var_0_0.Identify(arg_2_0)
	return "11025"
end

function var_0_0.ConfigPath(arg_3_0)
	return "QWWorld/StoryGraph/11025"
end

function var_0_0.StartStory(arg_4_0)
	arg_4_0:BlackFadeDialogueNode_1()
end

function var_0_0.BlackFadeDialogueNode_1(arg_5_0)
	arg_5_0:HideTalkView()
	arg_5_0:OnBlackFade(false, 0, 0.2, 0.5, 0.5, function()
		arg_5_0:SetCharToTagAction(9073, "9073", function()
			return
		end)
		arg_5_0:SetCharToTagAction(9072, "9072", function()
			return
		end)
		arg_5_0:EnableCameraByTagAction("1", 1, 0)
		arg_5_0:HideAllDynamicAction(true, true, 4081, {})
		arg_5_0:ContinueBlackFade()
		arg_5_0:OnNext(function()
			arg_5_0:ClearOnNext()
			arg_5_0:DialogueNode_2()
		end)
	end, function()
		arg_5_0:Next()
	end)
end

function var_0_0.DialogueNode_2(arg_11_0)
	arg_11_0:PlayActorAnimationAction(9073, "conversation_2", 0.05, 3.166667, function()
		return
	end)
	arg_11_0:ShowTalkView()
	arg_11_0:SetTalkContent(11025001, "", 0)
	arg_11_0:SetNeedSkip(true, {
		Invoke = function()
			arg_11_0:Skip("End")
		end
	})
	arg_11_0:SetNeedClick(true, {
		Invoke = function()
			arg_11_0:Next()
		end
	})
	arg_11_0:OnNext(function(arg_15_0)
		arg_11_0:ClearOnNext()
		arg_11_0:DialogueNode_3()
	end)
end

function var_0_0.DialogueNode_3(arg_16_0)
	arg_16_0:PlayActorAnimationAction(9072, "conversation_1", 0.05, 3, function()
		return
	end)
	arg_16_0:ShowTalkView()
	arg_16_0:SetTalkContent(11025002, "", 0)
	arg_16_0:SetNeedSkip(true, {
		Invoke = function()
			arg_16_0:Skip("End")
		end
	})
	arg_16_0:SetNeedClick(true, {
		Invoke = function()
			arg_16_0:Next()
		end
	})
	arg_16_0:OnNext(function(arg_20_0)
		arg_16_0:ClearOnNext()
		arg_16_0:BlackFadeDialogueNode_4()
	end)
end

function var_0_0.BlackFadeDialogueNode_4(arg_21_0)
	arg_21_0:HideTalkView()
	arg_21_0:OnBlackFade(false, 0, 0.2, 0.5, 0.5, function()
		arg_21_0:DestroyCharAction(9073)
		arg_21_0:HideAllDynamicAction(false, false, 4081, {})
		arg_21_0:EnableCameraByTagAction("", 1, 0)
		arg_21_0:DestroyCharAction(9072)
		arg_21_0:ContinueBlackFade()
		arg_21_0:OnNext(function()
			arg_21_0:ClearOnNext()
			arg_21_0:CloseStoryEventNode_5()
		end)
	end, function()
		arg_21_0:Next()
	end)
end

function var_0_0.CloseStoryEventNode_5(arg_25_0)
	arg_25_0:EnableCameraCutAction(false)
	arg_25_0:EndStory()
end

function var_0_0.RegisterFuncMap(arg_26_0)
	arg_26_0:RegisterTalkFunction("End", arg_26_0.CloseStoryEventNode_5)
end

return var_0_0
