BaseStoryGraph = import("game.qworld.story.Graph.BaseStoryGraph")

local var_0_0 = class("11022", BaseStoryGraph)

function var_0_0.Ctor(arg_1_0)
	var_0_0.super.Ctor(arg_1_0)
	arg_1_0:RegisterFuncMap()
end

function var_0_0.Identify(arg_2_0)
	return "11022"
end

function var_0_0.ConfigPath(arg_3_0)
	return "QWWorld/StoryGraph/11022"
end

function var_0_0.StartStory(arg_4_0)
	arg_4_0:BlackFadeDialogueNode_1()
end

function var_0_0.BlackFadeDialogueNode_1(arg_5_0)
	arg_5_0:HideTalkView()
	arg_5_0:OnBlackFade(false, 0, 0.2, 0.5, 0.5, function()
		arg_5_0:HideAllDynamicAction(true, true, 4095, {})
		arg_5_0:EnableCameraByTagAction("1", 1, 0)
		arg_5_0:SetCharToTagAction(9510, "3", function()
			return
		end)
		arg_5_0:SetCharToTagAction(9515, "4", function()
			return
		end)
		arg_5_0:SetCharToTagAction(9073, "2", function()
			return
		end)
		arg_5_0:ActorSeekerAction(9073, {
			"6"
		}, 0.5, function()
			return
		end)
		arg_5_0:PlayActorAnimationAction(9515, "speechless_start", 0.05, 0.5333334, function()
			return
		end)
		arg_5_0:DelayTimeAction(0.2, function()
			arg_5_0:ActorSeekerAction(9510, {
				"7"
			}, 0.5, function()
				return
			end)
		end)
		arg_5_0:SetCharToTagAction(9072, "1", function()
			return
		end)
		arg_5_0:ContinueBlackFade()
		arg_5_0:OnNext(function()
			arg_5_0:ClearOnNext()
			arg_5_0:DialogueNode_2()
		end)
	end, function()
		arg_5_0:Next()
	end)
end

function var_0_0.DialogueNode_2(arg_17_0)
	arg_17_0:ShowTalkView()
	arg_17_0:SetTalkContent(11022001, "", 9073)
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
		arg_17_0:DialogueNode_3()
	end)
end

function var_0_0.DialogueNode_3(arg_21_0)
	arg_21_0:EnableCameraByTagAction("2", 1, 0)
	arg_21_0:ActorSeekerAction(9072, {
		"8"
	}, 0.5, function()
		arg_21_0:PlayActorAnimationAction(9072, "conversation_2", 0.05, 3.166667, function()
			return
		end)
		arg_21_0:PlayActorEmoteAction(9072, "complaint02", 0, 1.466667, function()
			return
		end, true, false)
	end)
	arg_21_0:CameraMoveAction("2", 4, 3, 5, 0.5)
	arg_21_0:ShowTalkView()
	arg_21_0:SetTalkContent(11022002, "", 9072)
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
	arg_21_0:OnNext(function(arg_27_0)
		arg_21_0:ClearOnNext()
		arg_21_0:DialogueNode_4()
	end)
end

function var_0_0.DialogueNode_4(arg_28_0)
	arg_28_0:PlayActorAnimationAction(9073, "summer_doubt", 0.05, 2, function()
		return
	end)
	arg_28_0:PlayActorEmoteAction(9073, "shocked01", 0, 1.4, function()
		return
	end, true, false)
	arg_28_0:ShowTalkView()
	arg_28_0:SetTalkContent(11022003, "", 9073)
	arg_28_0:SetNeedSkip(true, {
		Invoke = function()
			arg_28_0:Skip("End")
		end
	})
	arg_28_0:SetNeedClick(true, {
		Invoke = function()
			arg_28_0:Next()
		end
	})
	arg_28_0:OnNext(function(arg_33_0)
		arg_28_0:ClearOnNext()
		arg_28_0:DialogueNode_5()
	end)
end

function var_0_0.DialogueNode_5(arg_34_0)
	arg_34_0:EnableCameraByTagAction("4", 1, 0)
	arg_34_0:CameraMoveAction("4", 4, 1, 5, 0.5)
	arg_34_0:ShowTalkView()
	arg_34_0:SetTalkContent(11022004, "", 9510)
	arg_34_0:SetNeedSkip(true, {
		Invoke = function()
			arg_34_0:Skip("End")
		end
	})
	arg_34_0:SetNeedClick(true, {
		Invoke = function()
			arg_34_0:Next()
		end
	})
	arg_34_0:OnNext(function(arg_37_0)
		arg_34_0:ClearOnNext()
		arg_34_0:DialogueNode_6()
	end)
end

function var_0_0.DialogueNode_6(arg_38_0)
	arg_38_0:EnableCameraByTagAction("5", 1, 0)
	arg_38_0:PlayActorAnimationAction(9072, "conversation_2", 0.05, 3.166667, function()
		return
	end)
	arg_38_0:CameraMoveAction("5", 4, 6, 5, 0.3)
	arg_38_0:ShowTalkView()
	arg_38_0:SetTalkContent(11022005, "", 9072)
	arg_38_0:SetNeedSkip(true, {
		Invoke = function()
			arg_38_0:Skip("End")
		end
	})
	arg_38_0:SetNeedClick(true, {
		Invoke = function()
			arg_38_0:Next()
		end
	})
	arg_38_0:OnNext(function(arg_42_0)
		arg_38_0:ClearOnNext()
		arg_38_0:DialogueNode_7()
	end)
end

function var_0_0.DialogueNode_7(arg_43_0)
	arg_43_0:EnableCameraByTagAction("6", 1, 0)
	arg_43_0:PlayActorAnimationAction(9073, "summer_doubt", 0.05, 2, function()
		return
	end)
	arg_43_0:SetLookAtParamsAction(9073, 0.8, 1, 1)
	arg_43_0:LookAtRoleAction(true, 9073, "9072")
	arg_43_0:SetLookAtParamsAction(9510, 0.8, 1, 1)
	arg_43_0:LookAtRoleAction(true, 9510, "9072")
	arg_43_0:ShowTalkView()
	arg_43_0:SetTalkContent(11022006, "", 9073)
	arg_43_0:SetNeedSkip(true, {
		Invoke = function()
			arg_43_0:Skip("End")
		end
	})
	arg_43_0:SetNeedClick(true, {
		Invoke = function()
			arg_43_0:Next()
		end
	})
	arg_43_0:OnNext(function(arg_47_0)
		arg_43_0:ClearOnNext()
		arg_43_0:DialogueNode_8()
	end)
end

function var_0_0.DialogueNode_8(arg_48_0)
	arg_48_0:PlayActorAnimationAction(9510, "embarrassed", 0.05, 2.6, function()
		return
	end)
	arg_48_0:ShowTalkView()
	arg_48_0:SetTalkContent(11022007, "", 9510)
	arg_48_0:SetNeedSkip(true, {
		Invoke = function()
			arg_48_0:Skip("End")
		end
	})
	arg_48_0:SetNeedClick(true, {
		Invoke = function()
			arg_48_0:Next()
		end
	})
	arg_48_0:OnNext(function(arg_52_0)
		arg_48_0:ClearOnNext()
		arg_48_0:DialogueNode_9()
	end)
end

function var_0_0.DialogueNode_9(arg_53_0)
	arg_53_0:PlayActorEmoteAction(9072, "happy01_start", 0, 0.1333333, function()
		return
	end, true, true)
	arg_53_0:ActorSeekerAction(9072, {
		"5"
	}, 0.6, function()
		arg_53_0:PlayActorAnimationAction(9072, "action2_1", 0.05, 1.666667, function()
			return
		end)
	end)
	arg_53_0:DelayTimeAction(1, function()
		arg_53_0:EnableCameraByTagAction("8", 1, 0)
	end)
	arg_53_0:PlayActorEmoteAction(9073, "shocked01_start", 0, 0.3666667, function()
		return
	end, true, true)
	arg_53_0:PlayActorEmoteAction(9510, "shocked01", 0, 1.4, function()
		return
	end, true, false)
	arg_53_0:SetCharToTagAction(9515, "9", function()
		return
	end)
	arg_53_0:DelayTimeAction(2.6, function()
		arg_53_0:SetNeedClick(true, {
			Invoke = function()
				arg_53_0:Next()
			end
		})
		arg_53_0:SetNeedSkip(false, nil)
	end)
	arg_53_0:ShowTalkView()
	arg_53_0:SetTalkContent(11022008, "", 9072)
	arg_53_0:SetNeedSkip(true, {
		Invoke = function()
			arg_53_0:Skip("End")
		end
	})
	arg_53_0:SetNeedClick(false, {
		Invoke = function()
			arg_53_0:Next()
		end
	})
	arg_53_0:OnNext(function(arg_65_0)
		arg_53_0:ClearOnNext()
		arg_53_0:DialogueNode_10()
	end)
end

function var_0_0.DialogueNode_10(arg_66_0)
	arg_66_0:PlayActorEmoteAction(9073, "complaint02_start", 0, 0.4, function()
		return
	end, true, true)
	arg_66_0:ActorSeekerAction(9073, {
		"10"
	}, 2.5, function()
		arg_66_0:PlayActorAnimationAction(9073, "angry01", 0.05, 4.333333, function()
			return
		end)
	end)
	arg_66_0:ActorSeekerAction(9510, {
		"11"
	}, 2.5, function()
		return
	end)
	arg_66_0:ShowTalkView()
	arg_66_0:SetTalkContent(11022009, "", 9073)
	arg_66_0:SetNeedSkip(true, {
		Invoke = function()
			arg_66_0:Skip("End")
		end
	})
	arg_66_0:SetNeedClick(true, {
		Invoke = function()
			arg_66_0:Next()
		end
	})
	arg_66_0:OnNext(function(arg_73_0)
		arg_66_0:ClearOnNext()
		arg_66_0:DialogueNode_11()
	end)
end

function var_0_0.DialogueNode_11(arg_74_0)
	arg_74_0:PlayActorAnimationAction(9515, "stand_female", 0, 4, function()
		return
	end)
	arg_74_0:PlayActorEmoteAction(9072, "happy01_end", 0, 0.2666667, function()
		return
	end, true, false)
	arg_74_0:CameraMoveAction("10", 4, 6, 5, 0.2)
	arg_74_0:EnableCameraByTagAction("10", 1, 0)
	arg_74_0:ShowTalkView()
	arg_74_0:SetTalkContent(11022010, "", 9072)
	arg_74_0:SetNeedSkip(true, {
		Invoke = function()
			arg_74_0:Skip("End")
		end
	})
	arg_74_0:SetNeedClick(true, {
		Invoke = function()
			arg_74_0:Next()
		end
	})
	arg_74_0:OnNext(function(arg_79_0)
		arg_74_0:ClearOnNext()
		arg_74_0:DialogueNode_12()
	end)
end

function var_0_0.DialogueNode_12(arg_80_0)
	arg_80_0:EnableCameraByTagAction("11", 1, 0)
	arg_80_0:PlayActorAnimationAction(9515, "conversation_2", 0, 3.166667, function()
		return
	end)
	arg_80_0:ShowTalkView()
	arg_80_0:SetTalkContent(11022011, "", 9515)
	arg_80_0:SetNeedSkip(true, {
		Invoke = function()
			arg_80_0:Skip("End")
		end
	})
	arg_80_0:SetNeedClick(true, {
		Invoke = function()
			arg_80_0:Next()
		end
	})
	arg_80_0:OnNext(function(arg_84_0)
		arg_80_0:ClearOnNext()
		arg_80_0:DialogueNode_13()
	end)
end

function var_0_0.DialogueNode_13(arg_85_0)
	arg_85_0:EnableCameraByTagAction("12", 1, 0)
	arg_85_0:PlayActorAnimationAction(9072, "action2_1", 0.05, 1.666667, function()
		return
	end)
	arg_85_0:CameraMoveAction("12", 4, 4, 5, 0.4)
	arg_85_0:PlayActorAnimationAction(9073, "embarrassed", 0.05, 2.6, function()
		return
	end)
	arg_85_0:PlayActorEmoteAction(9073, "blink", 0, 0.3333333, function()
		return
	end, true, false)
	arg_85_0:ShowTalkView()
	arg_85_0:SetTalkContent(11022012, "", 9072)
	arg_85_0:SetNeedSkip(true, {
		Invoke = function()
			arg_85_0:Skip("End")
		end
	})
	arg_85_0:SetNeedClick(true, {
		Invoke = function()
			arg_85_0:Next()
		end
	})
	arg_85_0:OnNext(function(arg_91_0)
		arg_85_0:ClearOnNext()
		arg_85_0:DialogueNode_14()
	end)
end

function var_0_0.DialogueNode_14(arg_92_0)
	arg_92_0:EnableCameraByTagAction("13", 1, 0)
	arg_92_0:PlayActorAnimationAction(9515, "speechless_start", 0.05, 0.5333334, function()
		return
	end)
	arg_92_0:PlayActorEmoteAction(9515, "complaint01_start", 0, 0.3333333, function()
		return
	end, true, true)
	arg_92_0:ShowTalkView()
	arg_92_0:SetTalkContent(11022013, "", 0)
	arg_92_0:SetNeedSkip(true, {
		Invoke = function()
			arg_92_0:Skip("End")
		end
	})
	arg_92_0:SetNeedClick(true, {
		Invoke = function()
			arg_92_0:Next()
		end
	})
	arg_92_0:OnNext(function(arg_97_0)
		arg_92_0:ClearOnNext()
		arg_92_0:DialogueNode_15()
	end)
end

function var_0_0.DialogueNode_15(arg_98_0)
	arg_98_0:EnableCameraByTagAction("14", 1, 0)
	arg_98_0:PlayActorAnimationAction(9072, "action2_3", 0.05, 1.333333, function()
		return
	end)
	arg_98_0:PlayActorEmoteAction(9072, "happy01_start", 0, 0.1333333, function()
		return
	end, true, true)
	arg_98_0:ShowTalkView()
	arg_98_0:SetTalkContent(11022014, "", 0)
	arg_98_0:SetNeedSkip(true, {
		Invoke = function()
			arg_98_0:Skip("End")
		end
	})
	arg_98_0:SetNeedClick(true, {
		Invoke = function()
			arg_98_0:Next()
		end
	})
	arg_98_0:OnNext(function(arg_103_0)
		arg_98_0:ClearOnNext()
		arg_98_0:DialogueNode_16()
	end)
end

function var_0_0.DialogueNode_16(arg_104_0)
	arg_104_0:EnableCameraByTagAction("15", 1, 0)
	arg_104_0:PlayActorAnimationAction(9515, "action2_1", 0.05, 1.666667, function()
		return
	end)
	arg_104_0:ShowTalkView()
	arg_104_0:SetTalkContent(11022015, "", 0)
	arg_104_0:SetNeedSkip(true, {
		Invoke = function()
			arg_104_0:Skip("End")
		end
	})
	arg_104_0:SetNeedClick(true, {
		Invoke = function()
			arg_104_0:Next()
		end
	})
	arg_104_0:OnNext(function(arg_108_0)
		arg_104_0:ClearOnNext()
		arg_104_0:DialogueNode_17()
	end)
end

function var_0_0.DialogueNode_17(arg_109_0)
	arg_109_0:PlayActorAnimationAction(9072, "action2_1", 0.05, 1.666667, function()
		return
	end)
	arg_109_0:ShowTalkView()
	arg_109_0:SetTalkContent(11022016, "", 0)
	arg_109_0:SetNeedSkip(true, {
		Invoke = function()
			arg_109_0:Skip("End")
		end
	})
	arg_109_0:SetNeedClick(true, {
		Invoke = function()
			arg_109_0:Next()
		end
	})
	arg_109_0:OnNext(function(arg_113_0)
		arg_109_0:ClearOnNext()
		arg_109_0:DialogueNode_18()
	end)
end

function var_0_0.DialogueNode_18(arg_114_0)
	arg_114_0:EnableCameraByTagAction("13", 1, 0)
	arg_114_0:PlayActorAnimationAction(9515, "conversation_2", 0.05, 3.166667, function()
		return
	end)
	arg_114_0:PlayActorEmoteAction(9515, "anger02_start", 0, 0.5, function()
		return
	end, true, true)
	arg_114_0:ShowTalkView()
	arg_114_0:SetTalkContent(11022017, "", 0)
	arg_114_0:SetNeedSkip(true, {
		Invoke = function()
			arg_114_0:Skip("End")
		end
	})
	arg_114_0:SetNeedClick(true, {
		Invoke = function()
			arg_114_0:Next()
		end
	})
	arg_114_0:OnNext(function(arg_119_0)
		arg_114_0:ClearOnNext()
		arg_114_0:DialogueNode_19()
	end)
end

function var_0_0.DialogueNode_19(arg_120_0)
	arg_120_0:EnableCameraByTagAction("14", 1, 0)
	arg_120_0:PlayActorEmoteAction(9072, "happy01_end", 0, 0.2666667, function()
		return
	end, true, false)
	arg_120_0:DelayTimeAction(1.5, function()
		arg_120_0:PlayActorAnimationAction(9072, "take", 0.05, 1.833333, function()
			return
		end)
	end)
	arg_120_0:ShowTalkView()
	arg_120_0:SetTalkContent(11022018, "", 0)
	arg_120_0:SetNeedSkip(true, {
		Invoke = function()
			arg_120_0:Skip("End")
		end
	})
	arg_120_0:SetNeedClick(true, {
		Invoke = function()
			arg_120_0:Next()
		end
	})
	arg_120_0:OnNext(function(arg_126_0)
		arg_120_0:ClearOnNext()
		arg_120_0:DialogueNode_20()
	end)
end

function var_0_0.DialogueNode_20(arg_127_0)
	arg_127_0:EnableCameraByTagAction("15", 1, 0)
	arg_127_0:PlayActorEmoteAction(9515, "shocked01", 0, 1.4, function()
		arg_127_0:PlayActorAnimationAction(9515, "summer_doubt", 0.05, 2, function()
			return
		end)
	end, true, false)
	arg_127_0:ShowTalkView()
	arg_127_0:SetTalkContent(11022019, "", 0)
	arg_127_0:SetNeedSkip(true, {
		Invoke = function()
			arg_127_0:Skip("End")
		end
	})
	arg_127_0:SetNeedClick(true, {
		Invoke = function()
			arg_127_0:Next()
		end
	})
	arg_127_0:OnNext(function(arg_132_0)
		arg_127_0:ClearOnNext()
		arg_127_0:DialogueNode_21()
	end)
end

function var_0_0.DialogueNode_21(arg_133_0)
	arg_133_0:EnableCameraByTagAction("14", 1, 0)
	arg_133_0:PlayActorAnimationAction(9072, "conversation_1", 0.05, 3, function()
		return
	end)
	arg_133_0:ShowTalkView()
	arg_133_0:SetTalkContent(11022020, "", 0)
	arg_133_0:SetNeedSkip(true, {
		Invoke = function()
			arg_133_0:Skip("End")
		end
	})
	arg_133_0:SetNeedClick(true, {
		Invoke = function()
			arg_133_0:Next()
		end
	})
	arg_133_0:OnNext(function(arg_137_0)
		arg_133_0:ClearOnNext()
		arg_133_0:DialogueNode_22()
	end)
end

function var_0_0.DialogueNode_22(arg_138_0)
	arg_138_0:EnableCameraByTagAction("11", 1, 0)
	arg_138_0:PlayActorEmoteAction(9073, "shocked01", 0, 1.4, function()
		return
	end, true, false)
	arg_138_0:PlaySoundsAction(2, "ui_sandplay", "ui_sandplay_x511_story_04_mingshi", "", "")
	arg_138_0:ShowTalkView()
	arg_138_0:SetTalkContent(11022021, "", 0)
	arg_138_0:SetNeedSkip(true, {
		Invoke = function()
			arg_138_0:Skip("End")
		end
	})
	arg_138_0:SetNeedClick(true, {
		Invoke = function()
			arg_138_0:Next()
		end
	})
	arg_138_0:OnNext(function(arg_142_0)
		arg_138_0:ClearOnNext()
		arg_138_0:DialogueNode_23()
	end)
end

function var_0_0.DialogueNode_23(arg_143_0)
	arg_143_0:PlayActorAnimationAction(9072, "conversation_2", 0.05, 3.166667, function()
		return
	end)
	arg_143_0:ShowTalkView()
	arg_143_0:SetTalkContent(11022022, "", 0)
	arg_143_0:SetNeedSkip(true, {
		Invoke = function()
			arg_143_0:Skip("End")
		end
	})
	arg_143_0:SetNeedClick(true, {
		Invoke = function()
			arg_143_0:Next()
		end
	})
	arg_143_0:OnNext(function(arg_147_0)
		arg_143_0:ClearOnNext()
		arg_143_0:DialogueNode_24()
	end)
end

function var_0_0.DialogueNode_24(arg_148_0)
	arg_148_0:EnableCameraByTagAction("13", 1, 0)
	arg_148_0:PlayActorAnimationAction(9515, "think_loop", 0.05, 2, function()
		return
	end)
	arg_148_0:PlayActorEmoteAction(9515, "disdain01_start", 0, 0.4, function()
		return
	end, true, true)
	arg_148_0:ShowTalkView()
	arg_148_0:SetTalkContent(11022023, "", 0)
	arg_148_0:SetNeedSkip(true, {
		Invoke = function()
			arg_148_0:Skip("End")
		end
	})
	arg_148_0:SetNeedClick(true, {
		Invoke = function()
			arg_148_0:Next()
		end
	})
	arg_148_0:OnNext(function(arg_153_0)
		arg_148_0:ClearOnNext()
		arg_148_0:DialogueNode_25()
	end)
end

function var_0_0.DialogueNode_25(arg_154_0)
	arg_154_0:EnableCameraByTagAction("24_1", 1, 0)
	arg_154_0:PlayActorAnimationAction(9072, "conversation_1", 0.05, 3, function()
		return
	end)
	arg_154_0:ShowTalkView()
	arg_154_0:SetTalkContent(11022024, "", 0)
	arg_154_0:SetNeedSkip(true, {
		Invoke = function()
			arg_154_0:Skip("End")
		end
	})
	arg_154_0:SetNeedClick(true, {
		Invoke = function()
			arg_154_0:Next()
		end
	})
	arg_154_0:OnNext(function(arg_158_0)
		arg_154_0:ClearOnNext()
		arg_154_0:DialogueNode_26()
	end)
end

function var_0_0.DialogueNode_26(arg_159_0)
	arg_159_0:EnableCameraByTagAction("15", 1, 0)
	arg_159_0:PlayActorAnimationAction(9515, "conversation_2", 0.05, 3.166667, function()
		return
	end)
	arg_159_0:PlayActorEmoteAction(9515, "blink", 0, 0.3333333, function()
		return
	end, true, false)
	arg_159_0:ShowTalkView()
	arg_159_0:SetTalkContent(11022025, "", 0)
	arg_159_0:SetNeedSkip(true, {
		Invoke = function()
			arg_159_0:Skip("End")
		end
	})
	arg_159_0:SetNeedClick(true, {
		Invoke = function()
			arg_159_0:Next()
		end
	})
	arg_159_0:OnNext(function(arg_164_0)
		arg_159_0:ClearOnNext()
		arg_159_0:DialogueNode_27()
	end)
end

function var_0_0.DialogueNode_27(arg_165_0)
	arg_165_0:EnableCameraByTagAction("24", 1, 0)
	arg_165_0:PlayActorAnimationAction(9072, "take", 0.05, 1.833333, function()
		return
	end)
	arg_165_0:ShowTalkView()
	arg_165_0:SetTalkContent(11022026, "", 0)
	arg_165_0:SetNeedSkip(true, {
		Invoke = function()
			arg_165_0:Skip("End")
		end
	})
	arg_165_0:SetNeedClick(true, {
		Invoke = function()
			arg_165_0:Next()
		end
	})
	arg_165_0:OnNext(function(arg_169_0)
		arg_165_0:ClearOnNext()
		arg_165_0:DialogueNode_28()
	end)
end

function var_0_0.DialogueNode_28(arg_170_0)
	arg_170_0:PlayActorEmoteAction(9073, "disdain01_start", 0, 0.4, function()
		return
	end, true, true)
	arg_170_0:ShowTalkView()
	arg_170_0:SetTalkContent(11022027, "", 0)
	arg_170_0:SetNeedSkip(true, {
		Invoke = function()
			arg_170_0:Skip("End")
		end
	})
	arg_170_0:SetNeedClick(true, {
		Invoke = function()
			arg_170_0:Next()
		end
	})
	arg_170_0:OnNext(function(arg_174_0)
		arg_170_0:ClearOnNext()
		arg_170_0:DialogueNode_29()
	end)
end

function var_0_0.DialogueNode_29(arg_175_0)
	arg_175_0:ShowTalkView()
	arg_175_0:SetTalkContent(11022028, "", 0)
	arg_175_0:SetNeedSkip(true, {
		Invoke = function()
			arg_175_0:Skip("End")
		end
	})
	arg_175_0:SetNeedClick(true, {
		Invoke = function()
			arg_175_0:Next()
		end
	})
	arg_175_0:OnNext(function(arg_178_0)
		arg_175_0:ClearOnNext()
		arg_175_0:DialogueNode_30()
	end)
end

function var_0_0.DialogueNode_30(arg_179_0)
	arg_179_0:EnableCameraByTagAction("13", 1, 0)
	arg_179_0:PlayActorAnimationAction(9515, "conversation_2", 0.05, 3.166667, function()
		return
	end)
	arg_179_0:PlayActorEmoteAction(9515, "disdain01_end", 0, 0.4333334, function()
		return
	end, true, false)
	arg_179_0:ShowTalkView()
	arg_179_0:SetTalkContent(11022029, "", 0)
	arg_179_0:SetNeedSkip(true, {
		Invoke = function()
			arg_179_0:Skip("End")
		end
	})
	arg_179_0:SetNeedClick(true, {
		Invoke = function()
			arg_179_0:Next()
		end
	})
	arg_179_0:OnNext(function(arg_184_0)
		arg_179_0:ClearOnNext()
		arg_179_0:DialogueNode_31()
	end)
end

function var_0_0.DialogueNode_31(arg_185_0)
	arg_185_0:EnableCameraByTagAction("14", 1, 0)
	arg_185_0:PlayActorEmoteAction(9072, "shocked01", 0, 1.4, function()
		arg_185_0:PlayActorAnimationAction(9072, "conversation_1", 0.05, 3, function()
			return
		end)
	end, true, false)
	arg_185_0:ShowTalkView()
	arg_185_0:SetTalkContent(11022030, "", 0)
	arg_185_0:SetNeedSkip(true, {
		Invoke = function()
			arg_185_0:Skip("End")
		end
	})
	arg_185_0:SetNeedClick(true, {
		Invoke = function()
			arg_185_0:Next()
		end
	})
	arg_185_0:OnNext(function(arg_190_0)
		arg_185_0:ClearOnNext()
		arg_185_0:DialogueNode_32()
	end)
end

function var_0_0.DialogueNode_32(arg_191_0)
	arg_191_0:EnableCameraByTagAction("15", 1, 0)
	arg_191_0:PlayActorAnimationAction(9515, "think_loop", 0, 2, function()
		return
	end)
	arg_191_0:PlayActorEmoteAction(9515, "disdain01", 0, 1.566667, function()
		return
	end, true, false)
	arg_191_0:ShowTalkView()
	arg_191_0:SetTalkContent(11022031, "", 0)
	arg_191_0:SetNeedSkip(true, {
		Invoke = function()
			arg_191_0:Skip("End")
		end
	})
	arg_191_0:SetNeedClick(true, {
		Invoke = function()
			arg_191_0:Next()
		end
	})
	arg_191_0:OnNext(function(arg_196_0)
		arg_191_0:ClearOnNext()
		arg_191_0:DialogueNode_33()
	end)
end

function var_0_0.DialogueNode_33(arg_197_0)
	arg_197_0:ActorSeekerAction(9072, {
		"22"
	}, 0.5, function()
		arg_197_0:PlayActorAnimationAction(9072, "take", 0.05, 1.833333, function()
			return
		end)
	end)
	arg_197_0:DelayTimeAction(1, function()
		arg_197_0:SetLookAtParamsAction(9510, 0.8, 1, 1)
		arg_197_0:LookAtRoleAction(true, 9510, "9072")
		arg_197_0:EnableCameraByTagAction("32", 1, 0)
		arg_197_0:SetLookAtParamsAction(9073, 0.8, 1, 1)
		arg_197_0:LookAtRoleAction(true, 9073, "9072")
	end)
	arg_197_0:ShowTalkView()
	arg_197_0:SetTalkContent(11022032, "", 0)

	local var_197_0 = {
		[0] = {
			id = 11022033,
			icon = "",
			Invoke = function()
				arg_197_0:Next(11022033)
			end
		},
		{
			id = 11022034,
			icon = "",
			Invoke = function()
				arg_197_0:Next(11022034)
			end
		},
		Length = 2
	}

	arg_197_0:SetChoice(var_197_0, false)
	arg_197_0:SetNeedSkip(false, nil)
	arg_197_0:SetNeedClick(false, nil)
	arg_197_0:OnNext(function(arg_203_0)
		arg_197_0:ClearOnNext()
		arg_197_0:CloseChoice()

		if arg_203_0 == 11022033 then
			arg_197_0:DialogueBranchNode_34()
		elseif arg_203_0 == 11022034 then
			arg_197_0:DialogueBranchNode_35()
		end
	end)
end

function var_0_0.DialogueBranchNode_34(arg_204_0)
	arg_204_0:OnNext(function()
		arg_204_0:ClearOnNext()
		arg_204_0:PureActorDialogueNode_36()
	end)
	arg_204_0:Next()
end

function var_0_0.PureActorDialogueNode_36(arg_206_0)
	arg_206_0:EnableCameraByTagAction("33", 1, 0)
	arg_206_0:PlayActorEmoteAction(9073, "shocked01_start", 0, 0.3666667, function()
		return
	end, true, true)
	arg_206_0:CameraMoveAction("33", 4, 1, 1, 0.35)
	arg_206_0:DelayTimeAction(2, function()
		arg_206_0:EventAction(function()
			arg_206_0:ImmediateNextFlag(-1)
		end)
	end)
	arg_206_0:HideTalkView()
	arg_206_0:OnNext(function()
		arg_206_0:ClearOnNext()
		arg_206_0:DialogueNode_37()
	end)
end

function var_0_0.DialogueNode_37(arg_211_0)
	arg_211_0:EnableCameraByTagAction("35", 1, 0)
	arg_211_0:PlayActorAnimationAction(9072, "summer_doubt", 0.05, 2, function()
		arg_211_0:PlayActorAnimationAction(9072, "conversation_2", 0.05, 3.166667, function()
			return
		end)
	end)
	arg_211_0:PlayActorEmoteAction(9072, "happy01_start", 0, 0.1333333, function()
		return
	end, true, true)
	arg_211_0:ShowTalkView()
	arg_211_0:SetTalkContent(11022035, "", 0)
	arg_211_0:SetNeedSkip(true, {
		Invoke = function()
			arg_211_0:Skip("End")
		end
	})
	arg_211_0:SetNeedClick(true, {
		Invoke = function()
			arg_211_0:Next()
		end
	})
	arg_211_0:OnNext(function(arg_217_0)
		arg_211_0:ClearOnNext()
		arg_211_0:DialogueNode_38()
	end)
end

function var_0_0.DialogueNode_38(arg_218_0)
	arg_218_0:PlayActorEmoteAction(9073, "happy01_start", 0, 0.1333333, function()
		return
	end, false, false)
	arg_218_0:PlayActorAnimationAction(9073, "action3_1", 0.05, 2.266667, function()
		return
	end)
	arg_218_0:ShowTalkView()
	arg_218_0:SetTalkContent(11022036, "", 0)
	arg_218_0:SetNeedSkip(true, {
		Invoke = function()
			arg_218_0:Skip("End")
		end
	})
	arg_218_0:SetNeedClick(true, {
		Invoke = function()
			arg_218_0:Next()
		end
	})
	arg_218_0:OnNext(function(arg_223_0)
		arg_218_0:ClearOnNext()
		arg_218_0:DialogueNode_39()
	end)
end

function var_0_0.DialogueNode_39(arg_224_0)
	arg_224_0:PlayActorAnimationAction(9510, "conversation_1", 0.05, 3, function()
		return
	end)
	arg_224_0:ShowTalkView()
	arg_224_0:SetTalkContent(11022037, "", 0)
	arg_224_0:SetNeedSkip(true, {
		Invoke = function()
			arg_224_0:Skip("End")
		end
	})
	arg_224_0:SetNeedClick(true, {
		Invoke = function()
			arg_224_0:Next()
		end
	})
	arg_224_0:OnNext(function(arg_228_0)
		arg_224_0:ClearOnNext()
		arg_224_0:BlackFadeDialogueNode_40()
	end)
end

function var_0_0.BlackFadeDialogueNode_40(arg_229_0)
	arg_229_0:HideTalkView()
	arg_229_0:OnBlackFade(false, 0, 0.2, 0.5, 0.5, function()
		arg_229_0:HideAllDynamicAction(false, false, 4095, {})
		arg_229_0:EnableCameraByTagAction("", 1, 0)
		arg_229_0:DestroyCharAction(9072)
		arg_229_0:DestroyCharAction(9073)
		arg_229_0:DestroyCharAction(9515)
		arg_229_0:DestroyCharAction(9510)
		arg_229_0:ContinueBlackFade()
		arg_229_0:OnNext(function()
			arg_229_0:ClearOnNext()
			arg_229_0:CloseStoryEventNode_41()
		end)
	end, function()
		arg_229_0:Next()
	end)
end

function var_0_0.CloseStoryEventNode_41(arg_233_0)
	arg_233_0:EnableCameraCutAction(false)
	arg_233_0:EndStory()
end

function var_0_0.DialogueBranchNode_35(arg_234_0)
	arg_234_0:OnNext(function()
		arg_234_0:ClearOnNext()
		arg_234_0:PureActorDialogueNode_36()
	end)
	arg_234_0:Next()
end

function var_0_0.RegisterFuncMap(arg_236_0)
	arg_236_0:RegisterTalkFunction("End", arg_236_0.BlackFadeDialogueNode_40)
	arg_236_0:RegisterTalkFunction("End", arg_236_0.CloseStoryEventNode_41)
end

return var_0_0
