local var_0_0 = {}
local var_0_1
local var_0_2

function var_0_0.BuildContext(arg_1_0)
	arg_1_0.context = {
		runStrategy = QWStoryConst.StoryType.StoryGraph
	}

	local var_1_0 = "game.qworld.story.strategy."

	arg_1_0.storyStategy = {
		[QWStoryConst.StoryType.StoryGraph] = import(var_1_0 .. "QWGraphStoryStrategy").New()
	}
end

function var_0_0.StartStory(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	if arg_2_3 then
		arg_2_0.context.runStrategy = arg_2_3

		arg_2_0.storyStategy[arg_2_3]:StartStory(arg_2_1, arg_2_2)
	else
		arg_2_0.context.runStrategy = QWStoryConst.StoryType.StoryGraph

		arg_2_0.storyStategy[QWStoryConst.StoryType.StoryGraph]:StartStory(arg_2_1, arg_2_2)
	end
end

function var_0_0.GetTarget(arg_3_0)
	return arg_3_0.storyStategy[arg_3_0.context.runStrategy]:GetTarget()
end

function var_0_0.StopStory(arg_4_0)
	local var_4_0 = arg_4_0.storyStategy[arg_4_0.context.runStrategy]:GetStoryID()

	arg_4_0.storyStategy[arg_4_0.context.runStrategy]:StopStory()
	arg_4_0:OnStoryEnd(var_4_0)
end

function var_0_0.Init(arg_5_0)
	manager.notify:RegistListener(QWORLD_OPEN_MAIN_VIEW, function(arg_6_0)
		arg_5_0:OnMainHomeOpenChange(arg_6_0)
	end)

	var_0_1 = QWorldStoryView.New()
	var_0_2 = import("game.qworld.story.view.BlackFadeController").New()

	arg_5_0:BuildContext()
	var_0_1:Hide()
end

function var_0_0.SetContent(arg_7_0, arg_7_1, arg_7_2, arg_7_3, arg_7_4, arg_7_5, arg_7_6, arg_7_7, arg_7_8)
	var_0_1:RenderContent(arg_7_1, arg_7_3, arg_7_4)
	var_0_1:SetNeedClickCallback(arg_7_5, arg_7_6)
	var_0_1:SetSkipCallback(arg_7_7, arg_7_8)
end

function var_0_0.OpenChoice(arg_8_0, arg_8_1, arg_8_2)
	var_0_1:SetNeedClickCallback(false, nil)
	var_0_1:SetSkipCallback(false, false)
	var_0_1:OpenChoice(arg_8_1, arg_8_2)
end

function var_0_0.CollectFunctionChoice(arg_9_0)
	local var_9_0 = {}
	local var_9_1 = arg_9_0:GetCurStrategy():GetTarget()

	if var_9_1 then
		var_9_0 = var_9_1:GetAllTalkTag()
	end

	return var_9_0
end

function var_0_0.GetCurStrategy(arg_10_0)
	return arg_10_0.storyStategy[arg_10_0.context.runStrategy]
end

function var_0_0.CloseChoice(arg_11_0)
	var_0_1:CloseChoice()
end

function var_0_0.OnStoryEnd(arg_12_0, arg_12_1)
	var_0_1:Hide()
	QWorldMgr:GetQWorldQuestMgr():OnStoryEnd(arg_12_1)
end

function var_0_0.ShowTalkView(arg_13_0)
	var_0_1:Show()
end

function var_0_0.HideTalkView(arg_14_0)
	var_0_1:Hide()
end

function var_0_0.GetTalkView(arg_15_0)
	return var_0_1
end

function var_0_0.StartTalk(arg_16_0, arg_16_1, arg_16_2, arg_16_3, arg_16_4, arg_16_5)
	if not QWorldMgr:IsInQWorldMain() then
		return
	end

	if not arg_16_0.talkCtx then
		arg_16_0.talkCtx = {}
	end

	if not arg_16_0.talkCtx[arg_16_1] then
		arg_16_0.talkCtx[arg_16_1] = QWStoryConst.TalkViewPage[arg_16_1].New()
	end

	if arg_16_0.talkCtx[arg_16_1] then
		arg_16_0.talkCtx[arg_16_1]:Show()
		arg_16_0.talkCtx[arg_16_1]:RenderContent(arg_16_2, arg_16_3, arg_16_4, arg_16_0:GetSpeed(), arg_16_5)
	end
end

function var_0_0.StartTalkList(arg_17_0, arg_17_1, arg_17_2, arg_17_3)
	if not QWorldMgr:IsInQWorldMain() then
		return
	end

	if not arg_17_0.talkCtx then
		arg_17_0.talkCtx = {}
	end

	if not arg_17_0.talkCtx[arg_17_1] then
		arg_17_0.talkCtx[arg_17_1] = QWStoryConst.TalkViewPage[arg_17_1].New()
	end

	if arg_17_0.talkCtx[arg_17_1] then
		arg_17_0.talkCtx[arg_17_1]:Show()
		arg_17_0.talkCtx[arg_17_1]:RenderContentList(arg_17_2, arg_17_0:GetSpeed(), arg_17_3)
	end
end

function var_0_0.GetSpeed(arg_18_0)
	return 0.2
end

function var_0_0.HideTalk(arg_19_0, arg_19_1)
	if arg_19_0.talkCtx[arg_19_1] then
		arg_19_0.talkCtx[arg_19_1]:Hide()
	end
end

function var_0_0.CloseTalk(arg_20_0, arg_20_1)
	if arg_20_0.talkCtx[arg_20_1] then
		arg_20_0.talkCtx[arg_20_1]:Dispose()

		arg_20_0.talkCtx[arg_20_1] = nil
	end
end

function var_0_0.GetBlackFade(arg_21_0)
	return var_0_2
end

function var_0_0.OnMainHomeOpenChange(arg_22_0, arg_22_1)
	if arg_22_1 == 1 then
		-- block empty
	elseif arg_22_0.talkCtx then
		for iter_22_0, iter_22_1 in pairs(arg_22_0.talkCtx) do
			if iter_22_1 then
				iter_22_1:Hide()
				iter_22_1:TryInterrupt()
			end
		end
	end
end

function var_0_0.Dispose(arg_23_0)
	if arg_23_0.talkCtx then
		for iter_23_0, iter_23_1 in pairs(arg_23_0.talkCtx) do
			if iter_23_1 then
				iter_23_1:Dispose()
			end
		end
	end

	arg_23_0.talkCtx = nil

	if var_0_1 then
		var_0_1:Dispose()

		var_0_1 = nil
	end
end

return var_0_0
