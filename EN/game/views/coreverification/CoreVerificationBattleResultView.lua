BattleScoreResultView = import("game.views.battleResult.score.BattleScoreResultView")

local var_0_0 = class("CoreVerificationBattleResultView", BattleScoreResultView)

function var_0_0.UIName(arg_1_0)
	return "Widget/System/BattleResult/BattleCoreVerification/CoreVerificationBattleResult"
end

function var_0_0.InitUI(arg_2_0)
	arg_2_0.hasSnapshot_ = GetBattleResultSnapShot()

	arg_2_0:BindCfgUI()
end

function var_0_0.AddListener(arg_3_0)
	arg_3_0:AddBtnListener(arg_3_0.btnBack_, nil, function()
		arg_3_0:CloseFunc()
	end)
	arg_3_0:AddBtnListener(arg_3_0.statisticsBtn_, nil, function()
		arg_3_0:GoToBattleStatistics()
	end)
end

function var_0_0.RefreshUI(arg_6_0)
	local var_6_0 = arg_6_0.stageData:GetDest()

	arg_6_0.battleTime2Text_.text = arg_6_0:GetBattleTime()

	local var_6_1 = CoreVerificationInfoCfg[var_6_0].difficult

	arg_6_0.titleText_.text = GetTips("HARD_LEVEL") .. GetTips("NUM_" .. var_6_1)
end

function var_0_0.GoToBattleStatistics(arg_7_0)
	JumpTools.OpenPageByJump("battleStatistics", {
		stageData = arg_7_0.params_.stageData,
		battleTime = arg_7_0:GetBattleTime(),
		hasSnapshot_ = arg_7_0.hasSnapshot_
	})
end

function var_0_0.OnExit(arg_8_0)
	local var_8_0 = arg_8_0.stageData:GetDest()
	local var_8_1 = {}

	for iter_8_0, iter_8_1 in ipairs(arg_8_0.stageData:GetHeroTeam()) do
		if iter_8_1 ~= 0 then
			table.insert(var_8_1, iter_8_1)
		end
	end

	local var_8_2 = LuaExchangeHelper.GetBattleStatisticsData().dataForLua.battleTime

	CoreVerificationData:BattleStageData(var_8_0, var_8_1, var_8_2)
end

return var_0_0
