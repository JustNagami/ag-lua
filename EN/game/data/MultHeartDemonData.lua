local var_0_0 = singletonClass("MultHeartDemonData")
local var_0_1 = {}

function var_0_0.Init(arg_1_0)
	var_0_1:Init()
end

function var_0_0.InitMultHeartDemonData(arg_2_0, arg_2_1)
	var_0_1:InitMultHeartDemonData(arg_2_1)
end

function var_0_0.UpdateRewardList(arg_3_0, arg_3_1)
	var_0_1:UpdateRewardList(arg_3_1)
end

function var_0_0.GetDataByPara(arg_4_0, arg_4_1)
	return var_0_1[arg_4_1]
end

function var_0_0.UpdateBattleFinishScore(arg_5_0, arg_5_1)
	var_0_1:UpdateBattleFinishScore(arg_5_1)
end

function var_0_0.UpdateHeroList(arg_6_0, arg_6_1, arg_6_2)
	var_0_1:UpdateHeroList(arg_6_1, arg_6_2)
end

function var_0_0.InitHeroList(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
	var_0_1:InitHeroList(arg_7_1, arg_7_2, arg_7_3)
end

function var_0_0.UpdateTempHeroList(arg_8_0, arg_8_1, arg_8_2)
	var_0_1:UpdateTempHeroList(arg_8_1, arg_8_2)
end

function var_0_0.GiveUp(arg_9_0, arg_9_1)
	var_0_1.isLock = false
	var_0_1.heroTempData = {}

	local var_9_0 = HeroViewDataProxy.New(3)
	local var_9_1 = MultHeartDemonCfg[MultHeartDemonCfg.get_id_list_by_activity_id[var_0_1.activityId][1]]

	if var_0_1.heroTempData == nil or var_0_1.heroTempData[2] == nil then
		var_0_1.heroTempData = {
			[2] = {}
		}

		if var_0_1.difficultyData[2] == nil then
			var_0_1.difficultyData[2] = {
				heroIdList = {}
			}
		end

		var_9_0:SetTempHeroList(var_9_1.trial_hero)

		for iter_9_0, iter_9_1 in ipairs(var_9_1.trial_hero) do
			local var_9_2 = HeroStandardSystemCfg[iter_9_1]

			table.insert(var_0_1.heroTempData[2], {
				type = 3,
				id = var_9_2.hero_id,
				trialID = iter_9_1,
				heroViewProxy = var_9_0
			})

			var_0_1.difficultyData[2].heroIdList[iter_9_0] = iter_9_1
		end
	end
end

function var_0_0.CheckDifficultyCanEnter(arg_10_0, arg_10_1)
	local var_10_0 = var_0_1.activityId
	local var_10_1 = ActivityData:GetActivityRefreshTime(var_10_0)

	if not ActivityData:GetActivityIsOpen(var_10_0) or var_10_1 <= manager.time:GetServerTime() then
		return false
	end

	local var_10_2 = MultHeartDemonCfg[MultHeartDemonCfg.get_id_list_by_activity_id[var_10_0][1]]

	if var_0_1.difficultyData == nil then
		return true
	end

	local var_10_3 = var_0_1.difficultyData[arg_10_1]

	if var_10_3 == nil then
		return true
	end

	return var_0_0:CheckWinOrFail(var_10_3, var_10_2) ~= 0
end

function var_0_0.CheckWinOrFail(arg_11_0, arg_11_1, arg_11_2)
	local var_11_0 = true

	if arg_11_1.heroHPList == nil then
		arg_11_1.heroHPList = {}
	end

	for iter_11_0, iter_11_1 in pairs(arg_11_1.heroIdList) do
		var_11_0 = arg_11_1.heroHPList[iter_11_1] == 0 and var_11_0
	end

	if var_11_0 then
		return 1
	end

	local var_11_1 = true

	for iter_11_2, iter_11_3 in pairs(arg_11_2.heart_damon_id) do
		var_11_1 = arg_11_1.heroHPList[iter_11_3] == 0 and var_11_1
	end

	if var_11_1 then
		return 2
	end

	return 0
end

function var_0_1.Init(arg_12_0)
	arg_12_0.maxScore = 0
	arg_12_0.isLock = false
	arg_12_0.rankTaskList = {}
	arg_12_0.heroTempData = {}

	for iter_12_0, iter_12_1 in ipairs(MultHeartDemonRewardCfg.get_id_list_by_reward_type[0]) do
		table.insert(arg_12_0.rankTaskList, iter_12_1)
	end
end

function var_0_1.InitMultHeartDemonData(arg_13_0, arg_13_1)
	arg_13_0.activityId = arg_13_1.open_edition
	arg_13_0.difficultyData = arg_13_0:ParseDifficultyData(arg_13_1.info_list)
	arg_13_0.challengeStage = arg_13_1.challenge_stage
	arg_13_0.maxScore = {}

	for iter_13_0, iter_13_1 in ipairs(arg_13_1.max_score_list) do
		arg_13_0.maxScore[iter_13_1.difficulty] = iter_13_1.max_score
	end

	arg_13_0:UpdateData()
	arg_13_0:UpdateHeroHP()
	arg_13_0:UpdateName()

	local var_13_0 = HeroViewDataProxy.New(HeroConst.HERO_DATA_TYPE.TRIAL)
	local var_13_1 = MultHeartDemonCfg[MultHeartDemonCfg.get_id_list_by_activity_id[arg_13_0.activityId][1]]

	var_13_0:SetTempHeroList(var_13_1.trial_hero)

	arg_13_0.trialProxy = var_13_0
	arg_13_0.heroTempData = {}

	if nullable(arg_13_0.heroTempData, 2) == nil then
		local var_13_2 = {}

		if arg_13_0.difficultyData[2] == nil then
			arg_13_0.difficultyData[2] = {
				heroIdList = clone(var_13_1.trial_hero)
			}
		end

		for iter_13_2, iter_13_3 in ipairs(arg_13_0.difficultyData[2].heroIdList) do
			local var_13_3 = HeroStandardSystemCfg[iter_13_3]

			table.insert(var_13_2, {
				id = var_13_3.hero_id,
				trialID = iter_13_3,
				type = HeroConst.HERO_DATA_TYPE.DEFAULT,
				heroViewProxy = var_13_0
			})
		end

		arg_13_0.heroTempData[2] = var_13_2
	end

	if nullable(arg_13_0.heroTempData, 1) == nil and arg_13_0.difficultyData[1] then
		local var_13_4 = HeroViewDataProxy.New(HeroConst.HERO_DATA_TYPE.DEFAULT)
		local var_13_5 = {}

		for iter_13_4, iter_13_5 in ipairs(arg_13_0.difficultyData[1].heroIdList) do
			local var_13_6 = HeroStandardSystemCfg[iter_13_5]

			if var_13_6 then
				table.insert(var_13_5, {
					id = var_13_6.hero_id,
					trialID = iter_13_5,
					type = HeroConst.HERO_DATA_TYPE.TRIAL,
					heroViewProxy = var_13_0
				})
			else
				table.insert(var_13_5, {
					trialID = 0,
					id = iter_13_5,
					type = HeroConst.HERO_DATA_TYPE.DEFAULT,
					heroViewProxy = var_13_4
				})
			end
		end

		arg_13_0.heroTempData[1] = var_13_5
	end

	MultHeartDemonAction.UpdateRewardRedPoint()
end

function var_0_1.UpdateName(arg_14_0)
	arg_14_0.nameTable = {}

	local var_14_0 = MultHeartDemonCfg[MultHeartDemonCfg.get_id_list_by_activity_id[var_0_1.activityId][1]]
	local var_14_1 = string.split(var_14_0.heart_damon_name, ",")

	for iter_14_0, iter_14_1 in ipairs(var_14_0.heart_damon_id) do
		arg_14_0.nameTable[iter_14_1] = var_14_1[iter_14_0]
	end
end

function var_0_1.UpdateHeroHP(arg_15_0)
	for iter_15_0, iter_15_1 in pairs(arg_15_0.difficultyData) do
		iter_15_1.heroHPList = {}

		for iter_15_2, iter_15_3 in ipairs(iter_15_1.stageData) do
			if iter_15_1.heroHPList[iter_15_3.heroId] == nil then
				iter_15_1.heroHPList[iter_15_3.heroId] = iter_15_3.heroHP
			end

			if iter_15_1.heroHPList[iter_15_3.bossId] == nil then
				iter_15_1.heroHPList[iter_15_3.bossId] = iter_15_3.bossHP
			end
		end
	end
end

function var_0_1.UpdateHeroList(arg_16_0, arg_16_1, arg_16_2)
	if arg_16_0.isLock then
		return
	end

	if arg_16_2 == 1 then
		arg_16_0.difficultyData[arg_16_2] = {
			heroIdList = {}
		}
	end

	for iter_16_0, iter_16_1 in pairs(arg_16_1) do
		arg_16_0.difficultyData[arg_16_2].heroIdList[iter_16_0] = iter_16_1
	end

	manager.notify:CallUpdateFunc(MULT_HEART_DEMON_SAVE_TEAM)
end

function var_0_1.InitHeroList(arg_17_0, arg_17_1, arg_17_2, arg_17_3)
	local var_17_0 = arg_17_1

	if arg_17_1 == nil then
		var_17_0 = arg_17_0.difficultyData[arg_17_3]
	end

	for iter_17_0, iter_17_1 in ipairs(arg_17_2) do
		var_17_0.heroIdList[iter_17_0] = iter_17_1
		arg_17_0.isLock = true
	end
end

function var_0_1.UpdateData(arg_18_0)
	return
end

function var_0_1.UpdateTempHeroList(arg_19_0, arg_19_1, arg_19_2)
	arg_19_0.heroTempData[arg_19_2] = {}
	arg_19_0.heroTempData[arg_19_2] = arg_19_1
end

function var_0_1.ParseDifficultyData(arg_20_0, arg_20_1)
	local var_20_0 = {}

	for iter_20_0, iter_20_1 in ipairs(arg_20_1) do
		var_20_0[iter_20_1.difficulty] = {}
		var_20_0[iter_20_1.difficulty].stageData = arg_20_0:ParseStageData(iter_20_1.stage_info_list)
		var_20_0[iter_20_1.difficulty].heroIdList = {}

		arg_20_0:InitHeroList(var_20_0[iter_20_1.difficulty], iter_20_1.hero_id_list, iter_20_1.difficulty)

		if iter_20_1.difficulty == 2 then
			arg_20_0.enterFlag = iter_20_1.enter_flag
		end
	end

	return var_20_0
end

function var_0_1.ParseStageData(arg_21_0, arg_21_1)
	local var_21_0 = {}

	for iter_21_0, iter_21_1 in ipairs(arg_21_1) do
		local var_21_1 = iter_21_0

		var_21_0[var_21_1] = arg_21_0:DefaultData()
		var_21_0[var_21_1].stageID = iter_21_1.stage_id
		var_21_0[var_21_1].challengeState = iter_21_1.challenge_state

		if iter_21_1.challenge_state ~= 0 then
			var_21_0[var_21_1].maxScore = iter_21_1.max_score
			var_21_0[var_21_1].heroHP = iter_21_1.hero_hp
			var_21_0[var_21_1].bossHP = iter_21_1.boss_hp
			var_21_0[var_21_1].heroId = iter_21_1.hero_id
			var_21_0[var_21_1].bossId = var_0_0:GetBossIdByStageId(iter_21_1.stage_id)
		end
	end

	return var_21_0
end

function var_0_0.GetBossIdByStageId(arg_22_0, arg_22_1)
	local var_22_0 = MultHeartDemonCfg[MultHeartDemonCfg.get_id_list_by_activity_id[var_0_1.activityId][1]]

	for iter_22_0 = 1, 2 do
		for iter_22_1, iter_22_2 in ipairs(var_22_0.stage_id[iter_22_0][2]) do
			if arg_22_1 == iter_22_2 then
				return var_22_0.heart_damon_id[iter_22_1]
			end
		end
	end

	return 0
end

function var_0_1.DefaultData(arg_23_0)
	return {
		challengeState = 0,
		maxScore = 0
	}
end

function var_0_1.UpdateBattleFinishScore(arg_24_0, arg_24_1)
	arg_24_0.battleScore = arg_24_1
end

return var_0_0
