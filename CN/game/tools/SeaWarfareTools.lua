local var_0_0 = {}

function var_0_0.SetCacheTagId(arg_1_0)
	var_0_0.cacheTagId = arg_1_0
end

function var_0_0.GetCacheTagId()
	return var_0_0.cacheTagId
end

function var_0_0.SetIsGoBackFromBattle(arg_3_0)
	var_0_0.isGoBackFromBattle = arg_3_0
end

function var_0_0.GetIsGoBackFromBattle()
	return var_0_0.isGoBackFromBattle
end

function var_0_0.IsSystemUnLock()
	local var_5_0 = SandPlaySystemCfg[QWorldSystemConst.SEA_WARFARE]

	if var_5_0.task_id == 0 then
		return true
	end

	return QWorldQuestTool.IsSubQuestFinish(var_5_0.task_id)
end

function var_0_0.GotoChallengeStageByTag()
	QWorldMgr:GetQWorldTagMgr():GotoTag(SeaWarfareConst.CHALLENGE_STAGE_TAG_ID)
end

function var_0_0.GotoChallengeStage()
	JumpTools.OpenPageByJump("/seaWarfareMain", {})
end

function var_0_0.GetStageIDList(arg_8_0)
	return SeaWarfareStageCfg.get_id_list_by_type[arg_8_0]
end

function var_0_0.LaunchBattle(arg_9_0, arg_9_1, arg_9_2)
	local var_9_0 = SeaWarfareStageCfg[arg_9_0].stage_id
	local var_9_1 = BattleStageFactory.Produce(BattleConst.STAGE_TYPE_NEW.SEA_WARFARE, var_9_0)

	var_9_1:SetSeaWarfareStageID(arg_9_0)

	if arg_9_2 then
		var_9_1:SetMarinerIDList(arg_9_2)
	end

	if arg_9_1 then
		var_9_1:SetSkillID(arg_9_1)
	end

	BattleController.GetInstance():LaunchBattle(var_9_1)
end

function var_0_0.IsStageLock(arg_10_0)
	local var_10_0 = SeaWarfareStageCfg[arg_10_0]

	if var_10_0.pre_stage ~= 0 then
		local var_10_1 = var_10_0.pre_stage

		return not var_0_0.IsStageCompleted(var_10_1)
	else
		return false
	end
end

function var_0_0.IsStageCompleted(arg_11_0)
	return SeaWarfareData:IsStageCompleted(arg_11_0)
end

function var_0_0.GetMarinerIDList()
	return SeaWarfareSkillCfg.get_id_list_by_type[SeaWarfareConst.SKILL_TYPE.MARINER]
end

function var_0_0.GetSkillIDList()
	return SeaWarfareSkillCfg.get_id_list_by_type[SeaWarfareConst.SKILL_TYPE.SKILL]
end

function var_0_0.GetTagIDList()
	local var_14_0 = {}

	for iter_14_0, iter_14_1 in ipairs(SandplayTagCfg.all) do
		local var_14_1 = SandplayTagCfg[iter_14_1].behaviour_parameters

		if type(var_14_1) == "table" and var_14_1[1] == QWorldSystemConst.SEA_WARFARE then
			var_14_0[#var_14_0 + 1] = iter_14_1
		end
	end

	return var_14_0
end

function var_0_0.IsSkillLock(arg_15_0)
	return SeaWarfareData:IsSkilllock(arg_15_0)
end

function var_0_0.IsSkillFirstUnlock(arg_16_0)
	if var_0_0.IsSkillLock(arg_16_0) then
		return false
	end

	return not getData("sea_warfare", string.format("first_unlock_skill_mark_%d", arg_16_0))
end

function var_0_0.SetSkillFirstUnlockMark(arg_17_0)
	saveData("sea_warfare", string.format("first_unlock_skill_mark_%d", arg_17_0), true)
end

function var_0_0.GetUnlockMarinerIDList()
	local var_18_0 = {}
	local var_18_1 = var_0_0.GetMarinerIDList()

	for iter_18_0, iter_18_1 in ipairs(var_18_1) do
		if not var_0_0.IsSkillLock(iter_18_1) then
			var_18_0[#var_18_0 + 1] = iter_18_1
		end
	end

	return var_18_0
end

function var_0_0.SetNeedPopFirstRewardStageID(arg_19_0)
	var_0_0.needPopRewardStageID = arg_19_0
end

function var_0_0.GetNeedPopFirstRewardStageID()
	return var_0_0.needPopRewardStageID
end

function var_0_0.SetNeedFirstCompleteAnimStageID(arg_21_0)
	var_0_0.needFirstCompleteAnimStageID = arg_21_0
end

function var_0_0.GetNeedFirstCompleteAnimStageID()
	return var_0_0.needFirstCompleteAnimStageID
end

function var_0_0.GetSeaWarfareStageID(arg_23_0)
	if not var_0_0.initedSeaWarfareStageIdDic then
		var_0_0.initedSeaWarfareStageIdDic = true
		var_0_0.seaWarfareStageIdDic = {}

		for iter_23_0, iter_23_1 in ipairs(SeaWarfareStageCfg.all) do
			local var_23_0 = SeaWarfareStageCfg[iter_23_1].stage_id

			var_0_0.seaWarfareStageIdDic[var_23_0] = iter_23_1
		end
	end

	return var_0_0.seaWarfareStageIdDic[arg_23_0]
end

function var_0_0.PlayAnim(arg_24_0, arg_24_1, arg_24_2)
	arg_24_0.enabled = true

	arg_24_0:Play(arg_24_1, -1, 0)
	arg_24_0:Update(0)

	local var_24_0 = Timer.New(function()
		local var_25_0 = arg_24_0:GetCurrentAnimatorStateInfo(0)

		if var_25_0:IsName(arg_24_1) and var_25_0.normalizedTime >= 1 then
			if arg_24_2 then
				arg_24_2()
			end

			if var_0_0.animTimerDic_[arg_24_1] then
				var_0_0.animTimerDic_[arg_24_1]:Stop()

				var_0_0.animTimerDic_[arg_24_1] = nil
			end

			arg_24_0.enabled = false
		end
	end, 0.033, -1)

	var_24_0:Start()
	var_0_0.AddAnimTimer(var_24_0, arg_24_1)

	return var_24_0
end

function var_0_0.AddAnimTimer(arg_26_0, arg_26_1)
	var_0_0.animTimerDic_ = var_0_0.animTimerDic_ or {}
	var_0_0.animTimerDic_[arg_26_1] = arg_26_0
end

return var_0_0
