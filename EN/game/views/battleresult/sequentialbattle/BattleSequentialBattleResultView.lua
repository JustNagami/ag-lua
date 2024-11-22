local var_0_0 = import("game.views.battleResult.BattleResultBaseView")
local var_0_1 = class("BattleSequentialBattleResultView", var_0_0)

function var_0_1.UIName(arg_1_0)
	return "UI/MardukUI/continuousBattle/MardukContinuousBattleSettlementUI"
end

function var_0_1.InitUI(arg_2_0)
	var_0_1.super.InitUI(arg_2_0)

	arg_2_0.finishController_ = ControllerUtil.GetController(arg_2_0.transform_, "finish")
	arg_2_0.bossController_ = ControllerUtil.GetController(arg_2_0.bossTf_, "name")
	arg_2_0.buffItemList_ = {}
end

function var_0_1.RefreshUI(arg_3_0)
	arg_3_0:SetLevelTitle()
	arg_3_0:RefreshMyExpS()
	arg_3_0:RefreshHeroS()
	arg_3_0:RefreshBattleTime()
	arg_3_0:RefreshFinishState()
	arg_3_0:RefreshLeftPanel()
	arg_3_0:RefreshBuffPanel()
end

function var_0_1.OnEnter(arg_4_0)
	arg_4_0.tweens_ = {}
	arg_4_0.stageData = arg_4_0.params_.stageData
	arg_4_0.stageId = arg_4_0.stageData:GetStageId()
	arg_4_0.stageType = arg_4_0.stageData:GetType()
	arg_4_0.heroExp_ = {}

	BattleInstance.hideBattlePanel()
	arg_4_0:CaculateReward()
	arg_4_0:RefreshUI()

	if arg_4_0.params_.battleResult.errorCode == BattleConst.ERROR_CODE_TIME_OVER then
		ShowMessageBox({
			ButtonType = "SingleBtn",
			isTop = true,
			content = GetTips("ACTIVITY_LOCK_SETTLEMENT_TIP"),
			OkCallback = function()
				arg_4_0:OnClickClose()
			end
		})
	end
end

function var_0_1.SetLevelTitle(arg_6_0)
	arg_6_0.stareText_.text = GetI18NText(BattleSequentialBattleStageCfg[arg_6_0.stageId].name)

	arg_6_0:RefreshTitleImmediate()
end

function var_0_1.RefreshBattleTime(arg_7_0)
	local var_7_0 = BattleStageTools.GetStageCfg(arg_7_0.stageType, arg_7_0.stageId)

	SetActive(arg_7_0.battleTimeGo_, var_7_0.tag ~= BattleConst.BATTLE_TAG.STORY)

	if var_7_0.tag == BattleConst.BATTLE_TAG.STORY then
		return
	end

	arg_7_0.battleTimeText_.text = arg_7_0:GetBattleTime()
end

function var_0_1.RefreshLeftPanel(arg_8_0)
	local var_8_0 = arg_8_0.params_.stageData:GetActivityID()
	local var_8_1 = SequentialBattleData:GetCurrentFinishStageIndex(var_8_0)

	arg_8_0.finishText_.text = string.format("%s/%s", var_8_1, #SequentialBattleChapterCfg[var_8_0].stage_id)

	local var_8_2 = SequentialBattleChapterCfg[var_8_0]

	if var_8_2.boss_list[var_8_1] ~= 0 then
		arg_8_0.bossController_:SetSelectedState("true")

		arg_8_0.portraitImage_.sprite = getSpriteWithoutAtlas(string.format("TextureConfig/MardukUI/boss/icon/%s", var_8_2.boss_list[var_8_1]))
	else
		arg_8_0.bossController_:SetSelectedState("false")
	end
end

function var_0_1.RefreshBuffPanel(arg_9_0)
	local var_9_0 = arg_9_0.params_.stageData:GetStageAffix()

	for iter_9_0 = #var_9_0 + 1, #arg_9_0.buffItemList_ do
		arg_9_0.buffItemList_[iter_9_0]:Show(false)
	end

	for iter_9_1 = 1, #var_9_0 do
		arg_9_0.buffItemList_[iter_9_1] = arg_9_0.buffItemList_[iter_9_1] or SequentialBattleFactoryTeamBuff.New(arg_9_0.buffItem_, arg_9_0.buffParent_)

		arg_9_0.buffItemList_[iter_9_1]:SetData(var_9_0[iter_9_1])
	end
end

function var_0_1.RefreshFinishState(arg_10_0)
	local var_10_0 = arg_10_0.params_.stageData:GetActivityID()

	if SequentialBattleData:GetCurrentFinishStageIndex(var_10_0) + 1 > #SequentialBattleChapterCfg[var_10_0].stage_id then
		arg_10_0.finishController_:SetSelectedState("true")
	else
		arg_10_0.finishController_:SetSelectedState("false")
	end
end

function var_0_1.AddListener(arg_11_0)
	arg_11_0:AddBtnListener(arg_11_0.buttonMask_, nil, function()
		arg_11_0:EndAnimator()
	end)
	arg_11_0:AddBtnListener(arg_11_0.closeBtn_, nil, function()
		BattleInstance.QuitBattle(arg_11_0.params_.stageData)
	end)
	arg_11_0:AddBtnListener(arg_11_0.btnOnceMore_, nil, function()
		arg_11_0:OnClickNextStage()
	end)
	arg_11_0:AddBtnListener(arg_11_0.btnBattleCount_, nil, function()
		arg_11_0.toStat_ = true

		JumpTools.OpenPageByJump("battleStatistics", {
			stageData = arg_11_0.stageData,
			battleTime = arg_11_0:GetBattleTime()
		})
	end)
	arg_11_0:AddBtnListener(arg_11_0.giveUpBtn_, nil, function()
		arg_11_0:OnClickClose()
	end)
end

function var_0_1.OnClickClose(arg_17_0)
	local var_17_0 = arg_17_0.params_.stageData:GetActivityID()

	ShowMessageBox({
		title = GetTips("PROMPT"),
		content = GetTips("SEQUENTIAL_BATTLE_RESET_STAGE"),
		OkCallback = function()
			SequentialBattleAction.ResetTeam(var_17_0, function(arg_19_0)
				if isSuccess(arg_19_0.result) then
					SequentialBattleData:ResetChapterTeamData(var_17_0)
					BattleInstance.QuitBattle(arg_17_0.params_.stageData, nil, true)
				else
					ShowTips(arg_19_0.result)
				end
			end)
		end
	})
end

function var_0_1.OnClickNextStage(arg_20_0)
	local var_20_0 = arg_20_0.params_.stageData:GetActivityID()
	local var_20_1 = SequentialBattleData:GetCurrentFinishStageIndex(var_20_0) + 1
	local var_20_2 = var_20_0
	local var_20_3 = var_20_1
	local var_20_4 = ReserveParams.New(ReserveConst.RESERVE_TYPE.SEQUENTIAL_BATTLE, var_20_2, var_20_3, {
		stageType = BattleConst.STAGE_TYPE_NEW.SEQUENTIAL_BATTLE,
		stageID = SequentialBattleChapterCfg[var_20_0].stage_id[var_20_1],
		activityID = var_20_0
	})
	local var_20_5 = BattleStageFactory.Produce(BattleConst.STAGE_TYPE_NEW.SEQUENTIAL_BATTLE, SequentialBattleChapterCfg[var_20_0].stage_id[var_20_1], var_20_0, var_20_4)

	BattleController.GetInstance():LaunchBattle(var_20_5)
end

function var_0_1.Dispose(arg_21_0)
	for iter_21_0, iter_21_1 in ipairs(arg_21_0.buffItemList_) do
		iter_21_1:Dispose()
	end

	arg_21_0.buffItemList_ = nil

	var_0_1.super.Dispose(arg_21_0)
end

return var_0_1
