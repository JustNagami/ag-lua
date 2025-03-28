local var_0_0 = class("QWorldStoryHistoryView", import("game.extend.ReduxView"))

function var_0_0.UIName(arg_1_0)
	return "Widget/System/SandPlay/SandPlay_Story/SandPlay_ChatHistoryUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiPop.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:InitUI()
	arg_3_0:AddUIListener()
end

function var_0_0.AddUIListener(arg_4_0)
	arg_4_0:AddBtnListener(arg_4_0.btnBack_, nil, function()
		if arg_4_0.canExit then
			arg_4_0:Back()
		end
	end)
end

function var_0_0.SetGaussion(arg_6_0, arg_6_1)
	arg_6_0:SetGaussionBg(arg_6_1)
	manager.ui:SetUISeparateRender(arg_6_1)
end

function var_0_0.InitUI(arg_7_0)
	arg_7_0:BindCfgUI()

	arg_7_0.itemPool = {}
	arg_7_0.canExit = true
	arg_7_0.loadFrameCounter = 10
	arg_7_0.frameTimer = nil
	arg_7_0.histroyCount = 0
	arg_7_0.curFrameTimer = 0
	arg_7_0.curLoadCounter = 0
	arg_7_0.curFrameLoadCount = 0
	arg_7_0.storyHistory = {}
	arg_7_0.curVoicePlayCell = nil
end

function var_0_0.OnEnter(arg_8_0)
	arg_8_0.canExit = false
	arg_8_0.storyHistory = QWorldMgr:GetQWorldStoryMgr():GetStoryHistory()
	arg_8_0.histroyCount = #arg_8_0.storyHistory
	arg_8_0.curFrameLoadCount = math.ceil(arg_8_0.histroyCount / arg_8_0.loadFrameCounter)

	arg_8_0:StartLoadHistory()
	manager.notify:Invoke(QWORLD_STORY_HISTORY_OPEN, true)
end

function var_0_0.StartLoadHistory(arg_9_0)
	arg_9_0:StopLoad()

	arg_9_0.curFrameTimer = 0
	arg_9_0.frameTimer = FrameTimer.New(function()
		if arg_9_0.curFrameTimer < arg_9_0.loadFrameCounter then
			local var_10_0 = arg_9_0.curLoadCounter + 1
			local var_10_1 = arg_9_0.curLoadCounter + 1 + arg_9_0.curFrameLoadCount

			for iter_10_0 = var_10_0, var_10_1 do
				if arg_9_0.storyHistory[iter_10_0] then
					arg_9_0:InstNewCell(iter_10_0)
				else
					arg_9_0:StopLoad()

					arg_9_0.canExit = true

					return
				end
			end

			if var_10_1 > arg_9_0.histroyCount then
				arg_9_0:StopLoad()

				arg_9_0.canExit = true

				return
			end

			arg_9_0.curLoadCounter = arg_9_0.curLoadCounter + arg_9_0.curFrameLoadCount
		end

		arg_9_0.curFrameTimer = arg_9_0.curFrameTimer + 1

		if arg_9_0.curFrameTimer == arg_9_0.loadFrameCounter then
			arg_9_0:StopLoad()

			arg_9_0.canExit = true

			return
		end
	end, 1, -1)

	arg_9_0.frameTimer:Start()
end

function var_0_0.StopLoad(arg_11_0)
	if arg_11_0.frameTimer then
		arg_11_0.frameTimer:Stop()

		arg_11_0.frameTimer = nil
	end
end

function var_0_0.OnExit(arg_12_0)
	arg_12_0:StopLoad()

	for iter_12_0, iter_12_1 in pairs(arg_12_0.itemPool) do
		iter_12_1:Dispose()
	end

	arg_12_0.itemPool = {}
	arg_12_0.curLoadCounter = 0

	arg_12_0:StopVoiceTimer()
	manager.audio:StopVoiceImmediate()
	manager.notify:Invoke(QWORLD_STORY_HISTORY_OPEN, false)
end

function var_0_0.InstNewCell(arg_13_0, arg_13_1)
	if arg_13_0.itemPool[arg_13_1] then
		arg_13_0.itemPool[arg_13_1]:Show()
		arg_13_0.itemPool[arg_13_1]:Render(arg_13_0.storyHistory[arg_13_1])
	else
		local var_13_0 = GameObject.Instantiate(arg_13_0.oneRow_, arg_13_0.content_.transform)
		local var_13_1 = QWorldStoryHistoryCell.New(var_13_0, arg_13_0)

		table.insert(arg_13_0.itemPool, var_13_1)
		var_13_1:Show()
		var_13_1:Render(arg_13_0.storyHistory[arg_13_1])
	end
end

function var_0_0.PlayTalkVoice(arg_14_0, arg_14_1)
	if arg_14_0.curVoicePlayCell then
		if arg_14_0.curVoicePlayCell == arg_14_1 then
			return
		end

		arg_14_0.curVoicePlayCell:ChangeVoiceState(false)
	end

	arg_14_1:ChangeVoiceState(true)

	local var_14_0 = arg_14_1.talkId
	local var_14_1 = SandplayStoryTalkCfg[var_14_0]

	manager.audio:StopVoiceImmediate()
	manager.audio:PlayVoice(var_14_1.cue_sheet, var_14_1.cue_name, true)

	local var_14_2 = manager.audio:GetVoiceLength(var_14_1.cue_sheet, var_14_1.cue_name, true) / 1000

	arg_14_0:StartVoiceTimer(var_14_2)

	arg_14_0.curVoicePlayCell = arg_14_1
end

function var_0_0.StartVoiceTimer(arg_15_0, arg_15_1)
	arg_15_0:StopVoiceTimer()

	arg_15_0.voiceTimer = Timer.New(function()
		if arg_15_0.curVoicePlayCell then
			arg_15_0.curVoicePlayCell:ChangeVoiceState(false)

			arg_15_0.curVoicePlayCell = nil
		end

		arg_15_0:StopVoiceTimer()
	end, arg_15_1, 1)

	arg_15_0.voiceTimer:Start()
end

function var_0_0.StopVoiceTimer(arg_17_0)
	if arg_17_0.voiceTimer then
		arg_17_0.voiceTimer:Stop()

		arg_17_0.voiceTimer = nil
	end
end

function var_0_0.Dispose(arg_18_0)
	arg_18_0:StopLoad()

	for iter_18_0, iter_18_1 in ipairs(arg_18_0.itemPool) do
		iter_18_1:Dispose()
	end

	arg_18_0.itemPool = nil

	var_0_0.super.Dispose(arg_18_0)
end

return var_0_0
