local var_0_0 = class("TetrisGameScorePopView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/BackHouseUI/TetrisGame/TetrisGameResultUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiPop.transform
end

function var_0_0.OnCtor(arg_3_0)
	return
end

function var_0_0.Init(arg_4_0)
	arg_4_0:InitUI()
	arg_4_0:AddUIListener()

	arg_4_0.stateController = arg_4_0.controller:GetController("state")
end

function var_0_0.InitUI(arg_5_0)
	arg_5_0:BindCfgUI()
end

function var_0_0.OnEnter(arg_6_0)
	arg_6_0.activityID = TetrisGameData:GetCurActivityID()
	arg_6_0.stageID = arg_6_0.params_.stageID

	arg_6_0:RefreshView()

	local var_6_0 = TetrisGameRunTimeManager:GetBlackBoard()

	if ActivityTetrisGameStageCfg[arg_6_0.stageID].type ~= TetrisGameConst.stageType.endLess then
		if var_6_0.resultFlag then
			manager.audio:PlayEffect("minigame_activity_2_2", "minigame_activity_2_2_flip_enter", "")
			manager.audio:PlayEffect("minigame_activity_2_8", "minigame_activity_2_8_dati_bingo", "")
		else
			manager.audio:PlayEffect("minigame_activity_2_2", "minigame_activity_2_2_flip_fail", "")
			manager.audio:PlayEffect("minigame_activity_2_8", "minigame_activity_2_8_dati_error", "")
		end
	end
end

function var_0_0.OnTop(arg_7_0)
	arg_7_0:RefreshView()
end

function var_0_0.OnExit(arg_8_0)
	manager.windowBar:HideBar()
	arg_8_0:RemoveAllEventListener()
end

function var_0_0.AddUIListener(arg_9_0)
	arg_9_0:AddBtnListener(arg_9_0.restart, nil, function()
		if arg_9_0.stageID then
			TetrisGameRunTimeManager:ExitGame()
			arg_9_0:Back()
			TetrisGameTools:EnterStage(arg_9_0.stageID)
		end
	end)
	arg_9_0:AddBtnListener(arg_9_0.confirm, nil, function()
		local var_11_0 = TetrisGameRunTimeManager:GetBlackBoard()

		TetrisGameRunTimeManager:ExitGame()

		if ActivityTetrisGameStageCfg[arg_9_0.stageID].type == TetrisGameConst.stageType.endLess then
			JumpTools.OpenPageByJump("/tetrisGameSkillView")
		else
			local var_11_1 = arg_9_0.stageID
			local var_11_2 = ActivityTetrisGameChapterCfg.get_id_list_by_tetris_stage_list[arg_9_0.stageID][1]

			if var_11_0.resultFlag then
				local var_11_3 = ActivityTetrisGameChapterCfg[var_11_2].tetris_stage_list

				for iter_11_0, iter_11_1 in ipairs(var_11_3) do
					local var_11_4 = TetrisGameData:GetStageInfoByStageID(iter_11_1)

					if var_11_4 and var_11_4.isClear == false then
						var_11_1 = iter_11_1

						break
					end
				end
			end

			JumpTools.OpenPageByJump("/tetrisGameChooseStageView", {
				chapterID = var_11_2,
				stageID = var_11_1
			})
		end
	end)
end

function var_0_0.RefreshView(arg_12_0)
	local var_12_0 = TetrisGameRunTimeManager:GetBlackBoard()

	arg_12_0.score.text = var_12_0.totalScore
	arg_12_0.roundNum.text = var_12_0.usedRound

	if ActivityTetrisGameStageCfg[arg_12_0.stageID].type == TetrisGameConst.stageType.endLess then
		arg_12_0.stateController:SetSelectedState("endLess")
	elseif var_12_0.resultFlag then
		arg_12_0.stateController:SetSelectedState("win")
	else
		arg_12_0.stateController:SetSelectedState("lose")
	end
end

function var_0_0.Dispose(arg_13_0)
	var_0_0.super.Dispose(arg_13_0)
end

return var_0_0
