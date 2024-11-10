local var_0_0 = singletonClass("AdvanceTestData", BaseHeroViewData)
local var_0_1 = {}
local var_0_2

function var_0_0.Init(arg_1_0)
	arg_1_0.mainActivityID = 182241
	arg_1_0.lastSelectIndex = 1
	arg_1_0.isActivityOpen = false
	arg_1_0.battleResultScore = 0
	arg_1_0.scoreList = {}
	arg_1_0.affixList_ = {}
	var_0_2 = {}
end

function var_0_0.GetMainActivityID(arg_2_0)
	return arg_2_0.mainActivityID
end

function var_0_0.GetLastSelectIndex(arg_3_0)
	return arg_3_0.lastSelectIndex
end

function var_0_0.SetLastSelectIndex(arg_4_0, arg_4_1)
	arg_4_0.lastSelectIndex = arg_4_1
end

function var_0_0.InitDefalutHeroList(arg_5_0)
	arg_5_0.heroList = clone(HeroData:GetHeroList())

	for iter_5_0, iter_5_1 in pairs(arg_5_0.heroList) do
		iter_5_1.servantInfo = clone(iter_5_1:GetServantInfo())

		function iter_5_1.GetServantInfo()
			return iter_5_1.servantInfo
		end
	end
end

function var_0_0.GetHeroList(arg_7_0)
	return arg_7_0.heroList
end

function var_0_0.GetSortedHeroList(arg_8_0)
	return (HeroTools.Sort(arg_8_0:GetHeroList()))
end

function var_0_0.GetAdvanceHeroData(arg_9_0, arg_9_1)
	return arg_9_0.heroList[arg_9_1]
end

function var_0_0.GetCurCfgByIndex(arg_10_0, arg_10_1)
	local var_10_0 = AdvanceTestData.mainActivityID
	local var_10_1 = AdvanceTestCfg.get_id_list_by_activity_id[var_10_0]
	local var_10_2

	for iter_10_0, iter_10_1 in pairs(var_10_1) do
		if AdvanceTestCfg[iter_10_1].stage_type == arg_10_1 then
			var_10_2 = AdvanceTestCfg[iter_10_1]

			break
		end
	end

	return var_10_2
end

function var_0_0.SetHeroTeam(arg_11_0, arg_11_1, arg_11_2)
	var_0_2[arg_11_1] = arg_11_2
end

function var_0_0.GetHeroTeam(arg_12_0, arg_12_1)
	local var_12_0 = var_0_2[arg_12_1] or {}

	return {
		var_12_0[1] or 0,
		var_12_0[2] or 0,
		var_12_0[3] or 0
	}
end

function var_0_0.SetHeroListByDifficult(arg_13_0, arg_13_1)
	local var_13_0 = arg_13_0:GetCurCfgByIndex(arg_13_1)
	local var_13_1 = var_13_0.character
	local var_13_2 = var_13_0.weapon

	for iter_13_0, iter_13_1 in pairs(arg_13_0.heroList) do
		iter_13_1.star = var_13_1

		if iter_13_1.servant_uid ~= 0 and iter_13_1.unlock == 1 then
			iter_13_1.servantInfo.stage = var_13_2
		end
	end
end

function var_0_0.GetisActivityOpen(arg_14_0)
	return arg_14_0.isActivityOpen
end

function var_0_0.OnReceviedAdvanceTestData(arg_15_0, arg_15_1)
	if arg_15_1 == nil then
		arg_15_0.isActivityOpen = false
	else
		if arg_15_0.scoreList == nil then
			arg_15_0.scoreList = {}
		end

		arg_15_0.isActivityOpen = true
		arg_15_0.mainActivityID = arg_15_1.activity_id
		arg_15_0.subActivityList = AdvanceTestCfg.get_id_list_by_activity_id[arg_15_0.mainActivityID]

		for iter_15_0, iter_15_1 in ipairs(arg_15_1.stage_list) do
			local var_15_0 = AdvanceTestCfg[arg_15_0.subActivityList[iter_15_0]].stage_type

			arg_15_0.scoreList[var_15_0] = iter_15_1.history_max_score
		end
	end
end

function var_0_0.OnReceviedBattleResult(arg_16_0, arg_16_1)
	local var_16_0 = AdvanceTestCfg[arg_16_1.id]

	arg_16_0.battleResultScore = arg_16_1.score
	arg_16_0.scoreList[var_16_0.stage_type] = arg_16_1.history_max_score
end

function var_0_0.GetBattleResultScore(arg_17_0)
	return arg_17_0.battleResultScore
end

function var_0_0.GetHistortyMaxScoreByIndex(arg_18_0, arg_18_1)
	if not arg_18_0.scoreList or not arg_18_0.scoreList[arg_18_1] then
		return -1
	end

	return arg_18_0.scoreList[arg_18_1]
end

function var_0_0.SetAffixList(arg_19_0, arg_19_1)
	arg_19_0.affixList_ = arg_19_1
end

function var_0_0.GetAffixList(arg_20_0)
	return arg_20_0.affixList_ or {}
end

local var_0_3 = {
	ALL = 1,
	GUILD = 2
}
local var_0_4 = var_0_3.ALL

function var_0_0.GetCurActivityID(arg_21_0)
	local var_21_0 = ActivityCfg[arg_21_0.mainActivityID].sub_activity_list

	for iter_21_0, iter_21_1 in pairs(var_21_0) do
		local var_21_1 = ActivityData:GetActivityData(iter_21_1)

		if manager.time:GetServerTime() >= var_21_1.startTime and manager.time:GetServerTime() < var_21_1.stopTime then
			return iter_21_1
		end
	end

	return 0
end

function var_0_0.GetRankTypeConst(arg_22_0)
	return var_0_3
end

function var_0_0.GetCurRankType(arg_23_0)
	return var_0_4
end

function var_0_0.SetCurRankType(arg_24_0, arg_24_1)
	var_0_4 = arg_24_1
end

return var_0_0
