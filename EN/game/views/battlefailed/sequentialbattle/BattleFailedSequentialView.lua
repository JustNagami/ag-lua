NewBattleFailedWithButtonView = import("game.views.battleFailed.newBattleFailed.NewBattleFailedWithButtonView")

local var_0_0 = class("BattleFailedSequentialView", NewBattleFailedWithButtonView)

function var_0_0.OnClickRestart(arg_1_0)
	local var_1_0 = arg_1_0.params_.stageData:GetActivityID()
	local var_1_1 = SequentialBattleData:GetCurrentFinishStageIndex(var_1_0) + 1
	local var_1_2 = var_1_0
	local var_1_3 = var_1_1
	local var_1_4 = BattleStageFactory.Produce(BattleConst.STAGE_TYPE_NEW.SEQUENTIAL_BATTLE, SequentialBattleChapterCfg[var_1_0].stage_id[var_1_1], var_1_0, var_1_2, var_1_3, {
		activityID = var_1_0
	})

	BattleController.GetInstance():LaunchBattle(var_1_4)
end

function var_0_0.OnClickBack(arg_2_0)
	local var_2_0 = arg_2_0.params_.stageData:GetActivityID()

	ShowMessageBox({
		title = GetTips("PROMPT"),
		content = GetTips("SEQUENTIAL_BATTLE_RESET_STAGE"),
		OkCallback = function()
			SequentialBattleAction.ResetTeam(var_2_0, function(arg_4_0)
				if isSuccess(arg_4_0.result) then
					SequentialBattleData:ResetChapterTeamData(var_2_0)
					arg_2_0:QuitUI()
				else
					ShowTips(arg_4_0.result)
				end
			end)
		end
	})
end

return var_0_0
