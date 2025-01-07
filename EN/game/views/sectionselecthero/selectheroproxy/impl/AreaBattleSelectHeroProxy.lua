local var_0_0 = import("game.views.sectionSelectHero.SelectHeroProxy.SelectHeroBaseProxy")
local var_0_1 = class("AreaBattleHeroProxy", var_0_0)

function var_0_1.CustomGetTeamData(arg_1_0)
	local var_1_0, var_1_1, var_1_2, var_1_3 = ReserveTools.GetHeroList(arg_1_0.reserveParams)
	local var_1_4 = arg_1_0.reserveParams.customData.data
	local var_1_5 = arg_1_0.reserveParams.customData.difficult
	local var_1_6 = {}

	if var_1_4.difficultList[var_1_5] and var_1_4.difficultList[var_1_5][arg_1_0.stageID] and var_1_4.difficultList[var_1_5][arg_1_0.stageID].usedHeroList[1] and arg_1_0:IsSameTeam(var_1_0, var_1_4.difficultList[var_1_5][arg_1_0.stageID].usedHeroList, var_1_3) == false then
		for iter_1_0 = 1, 3 do
			var_1_0[iter_1_0] = (var_1_4.difficultList[var_1_5][arg_1_0.stageID].usedHeroList[iter_1_0] or 0) % 10000

			if (var_1_4.difficultList[var_1_5][arg_1_0.stageID].usedHeroList[iter_1_0] or 0) > 10000 then
				var_1_6[var_1_4.difficultList[var_1_5][arg_1_0.stageID].usedHeroList[iter_1_0] % 10000] = var_1_4.difficultList[var_1_5][arg_1_0.stageID].usedHeroList[iter_1_0]
			end
		end

		for iter_1_1 = 1, 3 do
			if var_1_6[var_1_0[iter_1_1]] or 0 > 10000 then
				var_1_3[iter_1_1] = var_1_6[var_1_0[iter_1_1]]
			else
				var_1_3[iter_1_1] = 0
			end
		end
	end

	for iter_1_2, iter_1_3 in pairs(var_1_4.difficultList[var_1_5] or {}) do
		if arg_1_0.stageID ~= iter_1_2 then
			for iter_1_4, iter_1_5 in ipairs(iter_1_3.usedHeroList or {}) do
				if HeroStandardSystemCfg[iter_1_5] then
					table.insert(var_1_2, HeroStandardSystemCfg[iter_1_5].hero_id)
				end

				table.insert(var_1_2, iter_1_5)
			end
		end
	end

	for iter_1_6, iter_1_7 in pairs(var_1_0) do
		for iter_1_8, iter_1_9 in pairs(var_1_2) do
			if iter_1_7 == iter_1_9 % 10000 then
				var_1_0[iter_1_6] = 0
			end
		end
	end

	return var_1_0, var_1_1, var_1_2, var_1_3
end

function var_0_1.IsSameTeam(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	local var_2_0 = 0

	for iter_2_0, iter_2_1 in pairs(arg_2_1) do
		for iter_2_2, iter_2_3 in ipairs(arg_2_2) do
			if iter_2_1 == iter_2_3 then
				var_2_0 = var_2_0 + 1
			end
		end
	end

	for iter_2_4, iter_2_5 in pairs(arg_2_3) do
		for iter_2_6, iter_2_7 in ipairs(arg_2_2) do
			if iter_2_5 == iter_2_7 then
				var_2_0 = var_2_0 + 1
			end
		end
	end

	return var_2_0 == #arg_2_2
end

function var_0_1.InitCustomParams(arg_3_0, arg_3_1)
	arg_3_0.reserveParams = var_0_1.GetCustomReserveParams(arg_3_0.reserveParams.stageType, arg_3_0.reserveParams.stageID, arg_3_0.reserveParams.customData.activityID)
end

function var_0_1.GotoHeroInfoUI(arg_4_0, arg_4_1)
	local var_4_0, var_4_1 = arg_4_0:CheckBeforeGotoHeroInfoUI(arg_4_1)

	if not var_4_0 then
		if var_4_1 then
			ShowTips(var_4_1)
		end

		return
	end

	local var_4_2 = arg_4_0:GetDefaultTeamInfoParams(arg_4_1)
	local var_4_3 = arg_4_0:GetCustomeTeamInfoParams(arg_4_1)

	for iter_4_0, iter_4_1 in pairs(var_4_3) do
		var_4_2[iter_4_0] = iter_4_1
	end

	local var_4_4 = ActivityCfg.get_id_list_by_sub_activity_list[arg_4_0.activityID][1]
	local var_4_5 = ActivityAreaBattleData:GetDataByActivityID(var_4_4)[arg_4_0.activityID]
	local var_4_6 = 1

	for iter_4_2, iter_4_3 in pairs(ActivityAreaBattleCfg[arg_4_0.activityID].stage_id) do
		for iter_4_4, iter_4_5 in pairs(iter_4_3) do
			if iter_4_5 == arg_4_0.reserveParams.stageID then
				var_4_6 = iter_4_2
			end
		end
	end

	if var_4_5.difficultList[var_4_6] and var_4_5.difficultList[var_4_6][arg_4_0.stageID] and #var_4_5.difficultList[var_4_6][arg_4_0.stageID].usedHeroList ~= 0 then
		ShowTips("ACTIVITY_AREA_BATTLE_RESETTING_TIP")

		return
	end

	JumpTools.OpenPageByJump(arg_4_0:GetHeroTeamInfoRoute(), var_4_2)
end

function var_0_1.GetCustomReserveParams(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = ReserveTools.GetReserveType(arg_5_0, arg_5_1)
	local var_5_1 = ReserveTools.GetContID(arg_5_0, arg_5_1)
	local var_5_2 = ActivityCfg.get_id_list_by_sub_activity_list[arg_5_2][1]
	local var_5_3 = ActivityAreaBattleData:GetDataByActivityID(var_5_2)[arg_5_2]
	local var_5_4 = 1

	for iter_5_0, iter_5_1 in pairs(ActivityAreaBattleCfg[arg_5_2].stage_id) do
		for iter_5_2, iter_5_3 in pairs(iter_5_1) do
			if iter_5_3 == arg_5_1 then
				var_5_4 = iter_5_0
			end
		end
	end

	local var_5_5 = {
		stageType = arg_5_0,
		stageID = arg_5_1,
		activityID = arg_5_2 or 0,
		data = var_5_3,
		difficult = var_5_4
	}

	return ReserveParams.New(var_5_0, var_5_1, nil, var_5_5)
end

function var_0_1.GotoReservesProposalUI(arg_6_0)
	local var_6_0 = ActivityCfg.get_id_list_by_sub_activity_list[arg_6_0.activityID][1]
	local var_6_1 = ActivityAreaBattleData:GetDataByActivityID(var_6_0)[arg_6_0.activityID]
	local var_6_2 = 1

	for iter_6_0, iter_6_1 in pairs(ActivityAreaBattleCfg[arg_6_0.activityID].stage_id) do
		for iter_6_2, iter_6_3 in pairs(iter_6_1) do
			if iter_6_3 == arg_6_0.reserveParams.stageID then
				var_6_2 = iter_6_0
			end
		end
	end

	if var_6_1.difficultList[var_6_2] and var_6_1.difficultList[var_6_2][arg_6_0.stageID] and #var_6_1.difficultList[var_6_2][arg_6_0.stageID].usedHeroList ~= 0 then
		ShowTips("ACTIVITY_AREA_BATTLE_RESETTING_TIP")

		return
	end

	var_0_1.super.GotoReservesProposalUI(arg_6_0)
end

return var_0_1
