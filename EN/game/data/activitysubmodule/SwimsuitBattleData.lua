local var_0_0 = singletonClass("SwimsuitBattleData")
local var_0_1 = 0
local var_0_2 = 0
local var_0_3 = 0
local var_0_4 = {}
local var_0_5 = {}
local var_0_6 = {}
local var_0_7 = {}
local var_0_8 = 0
local var_0_9 = {}
local var_0_10

function var_0_0.Init(arg_1_0)
	var_0_1 = SwimsuitBattleInfoCfg.all[1]
	var_0_2 = 0
	var_0_3 = 0
	var_0_4 = {}

	for iter_1_0, iter_1_1 in ipairs(SwimsuitBattleInfoCfg.all) do
		local var_1_0 = SwimsuitBattleInfoCfg[iter_1_1]

		var_0_4[iter_1_1] = {}

		for iter_1_2 = 1, #var_1_0.hero_list do
			table.insert(var_0_4[iter_1_1], {
				heroID = var_1_0.hero_list[iter_1_2],
				skinID = var_1_0.skin_id[iter_1_2],
				activityID = var_1_0.subactivity_list[iter_1_2]
			})
		end
	end

	var_0_9 = {}

	for iter_1_3, iter_1_4 in ipairs(SwimsuitVoteSystemCfg.all) do
		var_0_9[iter_1_4] = SwimsuitVoteSystemCfg[iter_1_4].activity_subsidiary_id
	end

	var_0_10 = false
end

function var_0_0.initDataFromServer(arg_2_0, arg_2_1)
	var_0_2 = arg_2_1.day_vote_ticket_num

	SwimsuitBattleAction.CheckSwimsuitVoteTicketNum()
end

function var_0_0.initVoteFromServer(arg_3_0, arg_3_1)
	var_0_7 = {}

	for iter_3_0, iter_3_1 in ipairs(arg_3_1.all_schedule_time) do
		var_0_7[iter_3_1.schedule_id] = {}
		var_0_7[iter_3_1.schedule_id].startTime = iter_3_1.start_time
		var_0_7[iter_3_1.schedule_id].endTime = iter_3_1.end_time
	end
end

function var_0_0.UpdateVoteFromServer(arg_4_0, arg_4_1)
	var_0_8 = arg_4_1.schedule_id

	if var_0_8 == 0 then
		var_0_8 = 5
	end

	var_0_5 = {}

	for iter_4_0, iter_4_1 in ipairs(arg_4_1.schedule_list) do
		var_0_5[iter_4_1.schedule_id] = {}

		for iter_4_2, iter_4_3 in ipairs(iter_4_1.competition_list) do
			table.insert(var_0_5[iter_4_1.schedule_id], {
				heroID = iter_4_3.competition_id,
				voteNum = iter_4_3.competition_value
			})
		end
	end

	var_0_6 = {}

	for iter_4_4, iter_4_5 in ipairs(arg_4_1.schedule_win_competition) do
		var_0_6[iter_4_5.schedule_id] = {}

		for iter_4_6, iter_4_7 in ipairs(iter_4_5.competition_list) do
			var_0_6[iter_4_5.schedule_id][iter_4_7.competition_id] = iter_4_7.competition_value
		end
	end

	SwimsuitBattleAction.CheckSwimsuitVoteTicketNum()
end

function var_0_0.UpdateTicketNumAfterBattle(arg_5_0, arg_5_1)
	var_0_2 = var_0_2 + arg_5_1
end

function var_0_0.GetUseHeroList(arg_6_0, arg_6_1)
	return var_0_4[arg_6_1]
end

function var_0_0.GetLastUseHeroID(arg_7_0)
	return var_0_3
end

function var_0_0.SetLastUseHeroID(arg_8_0, arg_8_1)
	var_0_3 = arg_8_1
end

function var_0_0.GetVoteTicketInfo(arg_9_0, arg_9_1)
	local var_9_0 = SwimsuitBattleInfoCfg[arg_9_1].voting_ticket_id
	local var_9_1 = SwimsuitBattleInfoCfg[arg_9_1].voting_ticket_limit

	return var_9_0, var_0_2, var_9_1
end

function var_0_0.GetCurVoteRound(arg_10_0)
	return var_0_8
end

function var_0_0.GetVoteContestantsData(arg_11_0)
	return var_0_5
end

function var_0_0.GetSortVoteContestantsData(arg_12_0, arg_12_1)
	local var_12_0 = {}

	if not var_0_5[arg_12_1] then
		return var_12_0
	end

	for iter_12_0, iter_12_1 in ipairs(var_0_5[arg_12_1]) do
		table.insert(var_12_0, {
			ID = iter_12_1.heroID,
			voteNum = iter_12_1.voteNum
		})
	end

	return var_12_0
end

function var_0_0.GetSortVoteContestantsDataByID(arg_13_0, arg_13_1)
	local var_13_0 = {}

	if not var_0_5[arg_13_1] then
		return var_13_0
	end

	for iter_13_0, iter_13_1 in pairs(var_0_5[arg_13_1]) do
		table.insert(var_13_0, {
			ID = iter_13_1.heroID,
			voteNum = iter_13_1.voteNum
		})
	end

	table.sort(var_13_0, function(arg_14_0, arg_14_1)
		return arg_14_0.ID < arg_14_1.ID
	end)

	return var_13_0
end

function var_0_0.GetWinerMapByRound(arg_15_0, arg_15_1)
	if not var_0_6[arg_15_1] then
		return {}
	end

	return var_0_6[arg_15_1]
end

function var_0_0.GetWinerListByRound(arg_16_0, arg_16_1)
	local var_16_0 = {}

	if not var_0_6[arg_16_1] then
		return var_16_0
	end

	for iter_16_0, iter_16_1 in pairs(var_0_6[arg_16_1]) do
		table.insert(var_16_0, {
			ID = iter_16_0,
			voteNum = iter_16_1
		})
	end

	table.sort(var_16_0, function(arg_17_0, arg_17_1)
		return arg_17_0.voteNum > arg_17_1.voteNum
	end)

	return var_16_0
end

function var_0_0.GetRoundTimerData(arg_18_0, arg_18_1)
	return var_0_7[arg_18_1]
end

function var_0_0.GetSkinByHeroID(arg_19_0, arg_19_1)
	for iter_19_0, iter_19_1 in ipairs(var_0_4[var_0_1]) do
		if iter_19_1.heroID == arg_19_1 then
			return iter_19_1.skinID
		end
	end

	return nil
end

function var_0_0.GetVoteActivityID(arg_20_0)
	return var_0_9
end

function var_0_0.CheckInRoundTime(arg_21_0)
	if var_0_8 == 5 then
		ShowTips("TIME_OVER")

		return false
	end

	local var_21_0 = var_0_7[var_0_8]

	if manager.time:GetServerTime() < var_21_0.startTime then
		ShowTips("SOLO_NOT_OPEN")

		return false
	end

	if manager.time:GetServerTime() >= var_21_0.endTime then
		ShowTips("SWIM_VOTE_SETTLEMENT")

		return false
	end

	return true
end

function var_0_0.GetTaskIdByRound(arg_22_0, arg_22_1)
	local var_22_0 = AssignmentCfg.get_id_list_by_activity_id[SwimsuitBattleInfoCfg[var_0_1].vote_activity_id]

	if not arg_22_1 then
		return var_22_0
	end

	local var_22_1 = {}

	for iter_22_0, iter_22_1 in ipairs(var_22_0) do
		if AssignmentCfg[iter_22_1].additional_parameter[1] == arg_22_1 then
			table.insert(var_22_1, iter_22_1)
		end
	end

	return var_22_1
end

function var_0_0.GetRedPointClickTag(arg_23_0)
	return var_0_10
end

function var_0_0.SetRedPointClickTag(arg_24_0)
	var_0_10 = true
end

return var_0_0
