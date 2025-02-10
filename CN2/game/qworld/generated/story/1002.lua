BaseStoryGraph = import("game.qworld.story.Graph.BaseStoryGraph")

local var_0_0 = class("1002", BaseStoryGraph)

function var_0_0.Identify(arg_1_0)
	return "1002"
end

function var_0_0.ConfigPath(arg_2_0)
	return "QWWorld/StoryGraph/1002"
end

function var_0_0.StartStory(arg_3_0)
	arg_3_0:DialogueNode_1()
end

function var_0_0.DialogueNode_1(arg_4_0)
	arg_4_0:EnableCameraCutAction(true)
	arg_4_0:SetCharToTagAction(9072, "ASDAS", function()
		arg_4_0:PlayActorEmoteAction(0, "silent01", 0, 1.7, function()
			return
		end)
		arg_4_0:PlayActorAnimationAction(0, "cheer", 0, 2.333333, function()
			arg_4_0:DelayTimeAction(10, function()
				arg_4_0:SetNeedClick(true, {
					Invoke = function()
						arg_4_0:Next()
					end
				})
				arg_4_0:SetNeedSkip(false, nil)
				arg_4_0:EventAction(function()
					arg_4_0:ImmediateNextFlag(-1)
				end)
			end)
		end)
	end)
	arg_4_0:ShowTalkView()
	arg_4_0:SetTalkContent(2, "Assets/UIResources/UI_AB/TextureConfig/Story/Character/story_1020.png", 0)
	arg_4_0:SetNeedSkip(false, {
		Invoke = function()
			arg_4_0:Skip()
		end
	})
	arg_4_0:SetNeedClick(true, {
		Invoke = function()
			arg_4_0:Next()
		end
	})
	arg_4_0:OnNext(function(arg_13_0)
		arg_4_0:ClearOnNext()
		arg_4_0:DialogueNode_2()
	end)
end

function var_0_0.DialogueNode_2(arg_14_0)
	arg_14_0:EnableCameraCutAction(false)
	arg_14_0:EnableCameraByTagAction("2")
	arg_14_0:ShowTalkView()
	arg_14_0:SetTalkContent(3, "", 9072)
	arg_14_0:SetNeedSkip(false, {
		Invoke = function()
			arg_14_0:Skip()
		end
	})
	arg_14_0:SetNeedClick(true, {
		Invoke = function()
			arg_14_0:Next()
		end
	})
	arg_14_0:OnNext(function(arg_17_0)
		arg_14_0:ClearOnNext()
		arg_14_0:DialogueNode_3()
	end)
end

function var_0_0.DialogueNode_3(arg_18_0)
	arg_18_0:EnableCameraByTagAction("3")
	arg_18_0:ShowTalkView()
	arg_18_0:SetTalkContent(4, "", 9072)
	arg_18_0:SetNeedSkip(false, {
		Invoke = function()
			arg_18_0:Skip()
		end
	})
	arg_18_0:SetNeedClick(true, {
		Invoke = function()
			arg_18_0:Next()
		end
	})
	arg_18_0:OnNext(function(arg_21_0)
		arg_18_0:ClearOnNext()
		arg_18_0:DialogueNode_4()
	end)
end

function var_0_0.DialogueNode_4(arg_22_0)
	arg_22_0:EnableCameraByTagAction("3")
	arg_22_0:ShowTalkView()
	arg_22_0:SetTalkContent(5, "", 9070)
	arg_22_0:SetNeedSkip(false, {
		Invoke = function()
			arg_22_0:Skip()
		end
	})
	arg_22_0:SetNeedClick(true, {
		Invoke = function()
			arg_22_0:Next()
		end
	})
	arg_22_0:OnNext(function(arg_25_0)
		arg_22_0:ClearOnNext()
		arg_22_0:DialogueNode_5()
	end)
end

function var_0_0.DialogueNode_5(arg_26_0)
	arg_26_0:ShowTalkView()
	arg_26_0:SetTalkContent(6, "", 9072)

	local var_26_0 = {
		[0] = {
			id = 7,
			icon = "",
			Invoke = function()
				arg_26_0:Next(7)
			end
		},
		{
			id = 8,
			icon = "",
			Invoke = function()
				arg_26_0:Next(8)
			end
		},
		Length = 2
	}

	arg_26_0:SetChoice(var_26_0, false)
	arg_26_0:SetNeedSkip(false, nil)
	arg_26_0:SetNeedClick(false, nil)
	arg_26_0:OnNext(function(arg_29_0)
		arg_26_0:ClearOnNext()
		arg_26_0:CloseChoice()

		if arg_29_0 == 7 then
			arg_26_0:DialogueBranchNode_6()
		elseif arg_29_0 == 8 then
			arg_26_0:DialogueBranchNode_7()
		end
	end)
end

function var_0_0.DialogueBranchNode_6(arg_30_0)
	arg_30_0:OnNext(function()
		arg_30_0:ClearOnNext()
		arg_30_0:DialogueNode_8()
	end)
	arg_30_0:Next()
end

function var_0_0.DialogueNode_8(arg_32_0)
	arg_32_0:EnableCameraByTagAction("2")
	arg_32_0:ShowTalkView()
	arg_32_0:SetTalkContent(9, "", 9072)
	arg_32_0:SetNeedSkip(false, {
		Invoke = function()
			arg_32_0:Skip()
		end
	})
	arg_32_0:SetNeedClick(true, {
		Invoke = function()
			arg_32_0:Next()
		end
	})
	arg_32_0:OnNext(function(arg_35_0)
		arg_32_0:ClearOnNext()
		arg_32_0:DialogueNode_9()
	end)
end

function var_0_0.DialogueNode_9(arg_36_0)
	arg_36_0:EnableCameraByTagAction("3")
	arg_36_0:ShowTalkView()
	arg_36_0:SetTalkContent(10, "", 9070)
	arg_36_0:SetNeedSkip(false, {
		Invoke = function()
			arg_36_0:Skip()
		end
	})
	arg_36_0:SetNeedClick(true, {
		Invoke = function()
			arg_36_0:Next()
		end
	})
	arg_36_0:OnNext(function(arg_39_0)
		arg_36_0:ClearOnNext()
		arg_36_0:DialogueNode_10()
	end)
end

function var_0_0.DialogueNode_10(arg_40_0)
	arg_40_0:EnableCameraByTagAction("1")
	arg_40_0:ShowTalkView()
	arg_40_0:SetTalkContent(11, "", 9074)
	arg_40_0:SetNeedSkip(false, {
		Invoke = function()
			arg_40_0:Skip()
		end
	})
	arg_40_0:SetNeedClick(true, {
		Invoke = function()
			arg_40_0:Next()
		end
	})
	arg_40_0:OnNext(function(arg_43_0)
		arg_40_0:ClearOnNext()
		arg_40_0:DialogueNode_11()
	end)
end

function var_0_0.DialogueNode_11(arg_44_0)
	arg_44_0:ShowTalkView()
	arg_44_0:SetTalkContent(12, "", 9074)
	arg_44_0:SetNeedSkip(false, {
		Invoke = function()
			arg_44_0:Skip()
		end
	})
	arg_44_0:SetNeedClick(true, {
		Invoke = function()
			arg_44_0:Next()
		end
	})
	arg_44_0:OnNext(function(arg_47_0)
		arg_44_0:ClearOnNext()
		arg_44_0:DialogueNode_12()
	end)
end

function var_0_0.DialogueNode_12(arg_48_0)
	arg_48_0:ShowTalkView()
	arg_48_0:SetTalkContent(13, "", 9070)
	arg_48_0:SetNeedSkip(false, {
		Invoke = function()
			arg_48_0:Skip()
		end
	})
	arg_48_0:SetNeedClick(true, {
		Invoke = function()
			arg_48_0:Next()
		end
	})
	arg_48_0:OnNext(function(arg_51_0)
		arg_48_0:ClearOnNext()
		arg_48_0:DialogueNode_13()
	end)
end

function var_0_0.DialogueNode_13(arg_52_0)
	arg_52_0:ShowTalkView()
	arg_52_0:SetTalkContent(14, "", 9070)
	arg_52_0:SetNeedSkip(false, {
		Invoke = function()
			arg_52_0:Skip()
		end
	})
	arg_52_0:SetNeedClick(true, {
		Invoke = function()
			arg_52_0:Next()
		end
	})
	arg_52_0:OnNext(function(arg_55_0)
		arg_52_0:ClearOnNext()
		arg_52_0:DialogueNode_14()
	end)
end

function var_0_0.DialogueNode_14(arg_56_0)
	arg_56_0:ShowTalkView()
	arg_56_0:SetTalkContent(15, "", 9070)
	arg_56_0:SetNeedSkip(false, {
		Invoke = function()
			arg_56_0:Skip()
		end
	})
	arg_56_0:SetNeedClick(true, {
		Invoke = function()
			arg_56_0:Next()
		end
	})
	arg_56_0:OnNext(function(arg_59_0)
		arg_56_0:ClearOnNext()
		arg_56_0:DialogueNode_15()
	end)
end

function var_0_0.DialogueNode_15(arg_60_0)
	arg_60_0:EnableCameraByTagAction("3")
	arg_60_0:ShowTalkView()
	arg_60_0:SetTalkContent(16, "", 9072)
	arg_60_0:SetNeedSkip(false, {
		Invoke = function()
			arg_60_0:Skip()
		end
	})
	arg_60_0:SetNeedClick(true, {
		Invoke = function()
			arg_60_0:Next()
		end
	})
	arg_60_0:OnNext(function(arg_63_0)
		arg_60_0:ClearOnNext()
		arg_60_0:DialogueNode_16()
	end)
end

function var_0_0.DialogueNode_16(arg_64_0)
	arg_64_0:ShowTalkView()
	arg_64_0:SetTalkContent(17, "", 9074)
	arg_64_0:SetNeedSkip(false, {
		Invoke = function()
			arg_64_0:Skip()
		end
	})
	arg_64_0:SetNeedClick(true, {
		Invoke = function()
			arg_64_0:Next()
		end
	})
	arg_64_0:OnNext(function(arg_67_0)
		arg_64_0:ClearOnNext()
		arg_64_0:DialogueNode_17()
	end)
end

function var_0_0.DialogueNode_17(arg_68_0)
	arg_68_0:ShowTalkView()
	arg_68_0:SetTalkContent(18, "", 9072)
	arg_68_0:SetNeedSkip(false, {
		Invoke = function()
			arg_68_0:Skip()
		end
	})
	arg_68_0:SetNeedClick(true, {
		Invoke = function()
			arg_68_0:Next()
		end
	})
	arg_68_0:OnNext(function(arg_71_0)
		arg_68_0:ClearOnNext()
		arg_68_0:DialogueNode_18()
	end)
end

function var_0_0.DialogueNode_18(arg_72_0)
	arg_72_0:ShowTalkView()
	arg_72_0:SetTalkContent(19, "", 9070)
	arg_72_0:SetNeedSkip(false, {
		Invoke = function()
			arg_72_0:Skip()
		end
	})
	arg_72_0:SetNeedClick(true, {
		Invoke = function()
			arg_72_0:Next()
		end
	})
	arg_72_0:OnNext(function(arg_75_0)
		arg_72_0:ClearOnNext()
		arg_72_0:CloseStoryEventNode_19()
	end)
end

function var_0_0.CloseStoryEventNode_19(arg_76_0)
	arg_76_0:EnableCameraCutAction(false)
	arg_76_0:EndStory()
end

function var_0_0.DialogueBranchNode_7(arg_77_0)
	arg_77_0:OnNext(function()
		arg_77_0:ClearOnNext()
		arg_77_0:DialogueNode_8()
	end)
	arg_77_0:Next()
end

return var_0_0
