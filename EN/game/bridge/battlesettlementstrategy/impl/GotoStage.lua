local var_0_0 = class("GotoStage", BattleSettlementStrategyBase)

function var_0_0.Init(arg_1_0)
	arg_1_0.PreGotoFunc = {
		[BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_TOWER] = handler(arg_1_0, arg_1_0.OnGotoTowerStage),
		[BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_MYTHIC] = handler(arg_1_0, arg_1_0.OnGotoMythicStage),
		[BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_CHESS] = handler(arg_1_0, arg_1_0.OnGotoChessStage),
		[BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_NEWWARCHESS] = handler(arg_1_0, arg_1_0.OnGotoNewChessStage),
		[BattleConst.STAGE_TYPE_NEW.PUSH_BOX_BATTLE] = handler(arg_1_0, arg_1_0.OnGotoPushBoxStage)
	}
end

function var_0_0.OnGotoSettlement(arg_2_0, arg_2_1)
	local var_2_0 = arg_2_1.num
	local var_2_1 = arg_2_1.stageData
	local var_2_2 = arg_2_1.starMissionData
	local var_2_3 = arg_2_1.battleResult
	local var_2_4 = var_2_1:GetType()
	local var_2_5 = var_2_1:GetStageId()
	local var_2_6 = arg_2_0.PreGotoFunc[var_2_4]

	if var_2_6 then
		var_2_6(arg_2_1)
	end

	arg_2_0:GotoStage(arg_2_1.num, arg_2_1.stageData, arg_2_1.starMissionData, arg_2_1.battleResult)
end

function var_0_0.OnGotoTowerStage(arg_3_0, arg_3_1)
	local var_3_0 = arg_3_1.num
	local var_3_1 = arg_3_1.stageData:GetStageId()

	if isSuccess(var_3_0) then
		local var_3_2 = getChapterIDByStageID(var_3_1)

		TowerData:UpdateOverTower(var_3_2, var_3_1)
	end
end

function var_0_0.OnGotoMythicStage(arg_4_0, arg_4_1)
	local var_4_0 = arg_4_1.num
	local var_4_1 = arg_4_1.stageData

	if isSuccess(var_4_0) and not MythicData:GetIsNew() then
		local var_4_2 = var_4_1:GetDest()

		MythicData:UpdatePartitionState(var_4_2)
	end

	MythicAction:UpdateMythicRedTip()
end

function var_0_0.OnGotoChessStage(arg_5_0, arg_5_1)
	local var_5_0 = arg_5_1.num
	local var_5_1 = arg_5_1.stageData

	if isSuccess(var_5_0) then
		manager.ChessManager:BattleSuccess()
	end

	manager.ChessManager.forceBattle:BattleResult(isSuccess(var_5_0))
end

function var_0_0.OnGotoNewChessStage(arg_6_0, arg_6_1)
	local var_6_0 = arg_6_1.num
	local var_6_1 = arg_6_1.stageData

	if isSuccess(var_6_0) then
		manager.NewChessManager:BattleSuccess()
	end
end

function var_0_0.OnGotoPushBoxStage(arg_7_0, arg_7_1)
	return
end

return var_0_0
