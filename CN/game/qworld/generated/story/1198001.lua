﻿BaseStoryGraph = import("game.qworld.story.Graph.BaseStoryGraph")

local var_0_0 = class("1198001", BaseStoryGraph)

function var_0_0.Ctor(arg_1_0)
	var_0_0.super.Ctor(arg_1_0)
	arg_1_0:RegisterFuncMap()
end

function var_0_0.Identify(arg_2_0)
	return "1198001"
end

function var_0_0.ConfigPath(arg_3_0)
	return "QWWorld/StoryGraph/1198001"
end

function var_0_0.StartStory(arg_4_0)
	arg_4_0:DialogueNode_1()
end

function var_0_0.DialogueNode_1(arg_5_0)
	arg_5_0:ShowTalkView()
	arg_5_0:SetTalkContent(119800101, "", 0)
	arg_5_0:SetNeedSkip(true, {
		Invoke = function()
			arg_5_0:Skip("End")
		end
	})
	arg_5_0:SetNeedClick(true, {
		Invoke = function()
			arg_5_0:Next()
		end
	})
	arg_5_0:OnNext(function(arg_8_0)
		arg_5_0:ClearOnNext()
		arg_5_0:DialogueNode_2()
	end)
end

function var_0_0.DialogueNode_2(arg_9_0)
	arg_9_0:ShowTalkView()
	arg_9_0:SetTalkContent(119800102, "", 0)
	arg_9_0:SetNeedSkip(true, {
		Invoke = function()
			arg_9_0:Skip("End")
		end
	})
	arg_9_0:SetNeedClick(true, {
		Invoke = function()
			arg_9_0:Next()
		end
	})
	arg_9_0:OnNext(function(arg_12_0)
		arg_9_0:ClearOnNext()
		arg_9_0:DialogueNode_3()
	end)
end

function var_0_0.DialogueNode_3(arg_13_0)
	arg_13_0:ShowTalkView()
	arg_13_0:SetTalkContent(119800103, "", 0)
	arg_13_0:SetNeedSkip(true, {
		Invoke = function()
			arg_13_0:Skip("End")
		end
	})
	arg_13_0:SetNeedClick(true, {
		Invoke = function()
			arg_13_0:Next()
		end
	})
	arg_13_0:OnNext(function(arg_16_0)
		arg_13_0:ClearOnNext()
		arg_13_0:DialogueNode_4()
	end)
end

function var_0_0.DialogueNode_4(arg_17_0)
	arg_17_0:ShowTalkView()
	arg_17_0:SetTalkContent(119800104, "", 0)
	arg_17_0:SetNeedSkip(true, {
		Invoke = function()
			arg_17_0:Skip("End")
		end
	})
	arg_17_0:SetNeedClick(true, {
		Invoke = function()
			arg_17_0:Next()
		end
	})
	arg_17_0:OnNext(function(arg_20_0)
		arg_17_0:ClearOnNext()
		arg_17_0:DialogueNode_5()
	end)
end

function var_0_0.DialogueNode_5(arg_21_0)
	arg_21_0:ShowTalkView()
	arg_21_0:SetTalkContent(119800105, "", 0)
	arg_21_0:SetNeedSkip(true, {
		Invoke = function()
			arg_21_0:Skip("End")
		end
	})
	arg_21_0:SetNeedClick(true, {
		Invoke = function()
			arg_21_0:Next()
		end
	})
	arg_21_0:OnNext(function(arg_24_0)
		arg_21_0:ClearOnNext()
		arg_21_0:DialogueNode_6()
	end)
end

function var_0_0.DialogueNode_6(arg_25_0)
	arg_25_0:ShowTalkView()
	arg_25_0:SetTalkContent(119800106, "", 0)
	arg_25_0:SetNeedSkip(true, {
		Invoke = function()
			arg_25_0:Skip("End")
		end
	})
	arg_25_0:SetNeedClick(true, {
		Invoke = function()
			arg_25_0:Next()
		end
	})
	arg_25_0:OnNext(function(arg_28_0)
		arg_25_0:ClearOnNext()
		arg_25_0:CloseStoryEventNode_7()
	end)
end

function var_0_0.CloseStoryEventNode_7(arg_29_0)
	arg_29_0:EnableCameraCutAction(false)
	arg_29_0:EndStory()
end

function var_0_0.RegisterFuncMap(arg_30_0)
	arg_30_0:RegisterTalkFunction("End", arg_30_0.CloseStoryEventNode_7)
end

return var_0_0
