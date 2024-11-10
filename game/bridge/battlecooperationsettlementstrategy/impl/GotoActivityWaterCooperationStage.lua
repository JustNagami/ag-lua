local var_0_0 = class("GotoActivityWaterCooperationStage", BattleCooperationSettlementStrategyBase)

function var_0_0.OnGotoSettlement(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1.num
	local var_1_1 = arg_1_1.stageData
	local var_1_2 = arg_1_1.starMissionData
	local var_1_3 = arg_1_1.battleResult

	if isSuccess(var_1_0) then
		local var_1_4 = arg_1_0:GetResultReward()

		function BattleCallLuaCallBack()
			JumpTools.OpenPageByJump("/xH3rdWaterSettlementView", {
				result = var_1_0,
				rewardList = var_1_4,
				stageData = var_1_1,
				starMissionData = var_1_2,
				battleResult = var_1_3
			})
			EndBattleLogic(var_1_0)
		end
	else
		function BattleCallLuaCallBack()
			gameContext:Go("/xH3rdWaterBattleCooperationFailed", {
				stageData = var_1_1
			})
			EndBattleLogic(var_1_0)
		end
	end
end

return var_0_0
