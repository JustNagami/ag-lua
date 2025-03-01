﻿local var_0_0 = class("GotoMatrixStage", BattleSettlementStrategyBase)

function var_0_0.OnGotoSettlement(arg_1_0, arg_1_1)
	if isSuccess(arg_1_1.num) then
		local var_1_0 = MatrixData:GetBattleTier()

		MatrixAction.DoAfterEvnet(var_1_0)
	end

	arg_1_0:GotoMatrix(arg_1_1.num, arg_1_1.stageData, arg_1_1.starMissionData, arg_1_1.battleResult)
end

function var_0_0.GotoMatrix(arg_2_0, arg_2_1, arg_2_2, arg_2_3, arg_2_4)
	local var_2_0, var_2_1 = GetResultReward()

	if isSuccess(arg_2_1) then
		function BattleCallLuaCallBack()
			gameContext:Go("/battleMatrixResultNew", {
				multiple = 1,
				stageData = arg_2_2,
				rewardList = var_2_0,
				battleResult = arg_2_4
			})
			EndBattleLogic(arg_2_1)
		end
	else
		function BattleCallLuaCallBack()
			gameContext:Go("/battleMatrixFailed", {
				stageData = arg_2_2,
				starMissionData = arg_2_3,
				battleResult = arg_2_4
			})
			manager.story:RemovePlayer()
			EndBattleLogic(arg_2_1)
		end
	end
end

return var_0_0
