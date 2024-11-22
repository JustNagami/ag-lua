local var_0_0 = import("game.dorm.DormEnum")
local var_0_1 = singletonClass("IdolTraineeData")
local var_0_2 = {}
local var_0_3 = {}
local var_0_4 = 0
local var_0_5 = {}
local var_0_6 = 0
local var_0_7 = 0
local var_0_8 = {}
local var_0_9 = {}
local var_0_10 = {}
local var_0_11 = {}
local var_0_12 = 0
local var_0_13 = {}

function var_0_1.Init(arg_1_0)
	var_0_2 = {}
	var_0_3 = {}
	var_0_4 = 0
	var_0_5 = {}
	var_0_6 = 0
	var_0_7 = 0
	var_0_8 = {}
	var_0_12 = 0
	var_0_9 = {}
	var_0_10 = {}
end

function var_0_1.ParseIdolProperty(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	if arg_2_3 then
		local var_2_0 = IdolTraineePveBattleCfg[arg_2_3]

		if var_2_0 then
			local var_2_1 = var_2_0.npc_id
			local var_2_2 = IdolPveNpcCfg[var_2_1]
			local var_2_3 = {
				0,
				0,
				0,
				0,
				0
			}

			for iter_2_0, iter_2_1 in ipairs(var_2_2.attribute) do
				var_2_3[iter_2_0] = iter_2_1
			end

			return var_2_3, var_2_1
		end
	else
		local var_2_4 = BackHomeHeroCfg[arg_2_2]

		if var_2_4 then
			local var_2_5 = {
				0,
				0,
				0,
				0,
				0
			}

			for iter_2_2, iter_2_3 in ipairs(var_2_5) do
				var_2_5[iter_2_2] = var_2_4.idol_base_attribute[iter_2_2][1]
			end

			if arg_2_1 then
				for iter_2_4, iter_2_5 in ipairs(arg_2_1) do
					var_2_5[iter_2_4] = iter_2_5
				end
			end

			return var_2_5
		else
			Debug.LogError("未获取角色配置信息" .. arg_2_2)
		end
	end
end

function var_0_1.InitDataFromServer(arg_3_0, arg_3_1)
	arg_3_0:InitAttackHeroID(arg_3_1)
	arg_3_0:InitDefendHeroID(arg_3_1)

	for iter_3_0, iter_3_1 in ipairs(arg_3_1.hero_list) do
		DormData:GetHeroTemplateInfo(iter_3_1.hero_id):InitDanceTrainData(iter_3_1)
	end

	var_0_4 = arg_3_1.exercise_times_info.use_times
	var_0_5 = {}

	for iter_3_2, iter_3_3 in ipairs(arg_3_1.exercise_times_info.camp_list) do
		var_0_5[iter_3_3] = true
	end

	var_0_6 = arg_3_1.pvp_stage_info.stage_id
	var_0_7 = arg_3_1.pvp_stage_info.refresh_timestamp

	arg_3_0:UpdateHeroPosList(arg_3_1)
end

function var_0_1.UpdateTrainDataFromServer(arg_4_0, arg_4_1)
	var_0_4 = arg_4_1.exercise_times_info.use_times
	var_0_5 = {}

	for iter_4_0, iter_4_1 in ipairs(arg_4_1.exercise_times_info.camp_list) do
		var_0_5[iter_4_1] = true
	end
end

function var_0_1.UpdatePvpDataFromServer(arg_5_0, arg_5_1)
	var_0_6 = arg_5_1.pvp_stage_info.stage_id
	var_0_7 = arg_5_1.pvp_stage_info.refresh_timestamp
end

function var_0_1.UpdateHeroPosList(arg_6_0, arg_6_1)
	local var_6_0 = DormData:GetHeroInfoList()

	for iter_6_0, iter_6_1 in pairs(var_6_0) do
		if iter_6_1.dancePos then
			iter_6_1:GoToDance(nil)
		end
	end

	for iter_6_2, iter_6_3 in ipairs(arg_6_1.hero_pos_list) do
		local var_6_1 = DormData:GetHeroTemplateInfo(iter_6_3.hero_id)

		var_6_1:SetCurHeroID(iter_6_3.hero_id)
		var_6_1:GoToDance(iter_6_3.pos)
	end
end

function var_0_1.UpdateQuestRankInfo(arg_7_0, arg_7_1)
	var_0_12 = 1

	for iter_7_0, iter_7_1 in ipairs(arg_7_1) do
		if iter_7_1 % 4 + 1 > var_0_12 then
			var_0_12 = iter_7_1 % 4 + 1
		end
	end
end

function var_0_1.InitAttackHeroID(arg_8_0, arg_8_1)
	var_0_2 = {}

	for iter_8_0, iter_8_1 in ipairs(arg_8_1.attack_hero_id_list) do
		var_0_2[iter_8_1] = true
	end
end

function var_0_1.InitDefendHeroID(arg_9_0, arg_9_1)
	var_0_3 = {}

	for iter_9_0, iter_9_1 in ipairs(arg_9_1.defend_hero_id_list) do
		var_0_3[iter_9_1] = true
	end
end

function var_0_1.UpdatePveChapterData(arg_10_0, arg_10_1)
	for iter_10_0, iter_10_1 in ipairs(arg_10_1.chapter_list) do
		if not var_0_8[iter_10_1.chapter_id] then
			var_0_8[iter_10_1.chapter_id] = {}
		end

		for iter_10_2, iter_10_3 in ipairs(iter_10_1.stage_list) do
			var_0_8[iter_10_1.chapter_id][iter_10_3.stage_id] = {
				score = 0,
				pass = false
			}
			var_0_8[iter_10_1.chapter_id][iter_10_3.stage_id].score = iter_10_3.score
			var_0_8[iter_10_1.chapter_id][iter_10_3.stage_id].pass = iter_10_3.is_clear
		end
	end
end

function var_0_1.UpdateOpponentList(arg_11_0, arg_11_1)
	var_0_9 = {}

	for iter_11_0, iter_11_1 in ipairs(arg_11_1) do
		if iter_11_1.user_id then
			var_0_9[iter_11_1.user_id] = {}
			var_0_9[iter_11_1.user_id].nick = iter_11_1.profile_base.nick
			var_0_9[iter_11_1.user_id].icon = iter_11_1.profile_base.icon
			var_0_9[iter_11_1.user_id].icon_frame = iter_11_1.profile_base.icon_frame
			var_0_9[iter_11_1.user_id].hero_id = iter_11_1.hero_list[1].hero_id
			var_0_9[iter_11_1.user_id].property = arg_11_0:ParseIdolProperty(iter_11_1.hero_list[1].attribute_list, iter_11_1.hero_list[1].hero_id)
		end
	end
end

function var_0_1.UpdateFriendList(arg_12_0, arg_12_1)
	var_0_10 = {}

	for iter_12_0, iter_12_1 in ipairs(arg_12_1) do
		if iter_12_1.user_id then
			var_0_10[iter_12_1.user_id] = {}
			var_0_10[iter_12_1.user_id].nick = iter_12_1.profile_base.nick
			var_0_10[iter_12_1.user_id].icon = iter_12_1.profile_base.icon
			var_0_10[iter_12_1.user_id].icon_frame = iter_12_1.profile_base.icon_frame
			var_0_10[iter_12_1.user_id].hero_id = iter_12_1.hero_list[1].hero_id
			var_0_10[iter_12_1.user_id].property = arg_12_0:ParseIdolProperty(iter_12_1.hero_list[1].attribute_list, iter_12_1.hero_list[1].hero_id)
		end
	end
end

function var_0_1.GetNpcPropertyByStageID(arg_13_0, arg_13_1)
	local var_13_0, var_13_1 = arg_13_0:ParseIdolProperty(nil, nil, arg_13_1)

	return var_13_0, var_13_1
end

function var_0_1.UpdateTrainData(arg_14_0, arg_14_1, arg_14_2)
	var_0_4 = var_0_4 + 1

	local var_14_0 = DormData:GetHeroTemplateInfo(arg_14_1.hero_id)

	var_14_0:SetFatigue(arg_14_2.fatigue)
	var_14_0:UpdataDanceTrainData(arg_14_2, arg_14_1)
end

function var_0_1.GetIdolHeroList(arg_15_0)
	local var_15_0 = {}
	local var_15_1 = DormHeroTools:GetUnLockBackHomeHeroIDList()

	for iter_15_0, iter_15_1 in ipairs(var_15_1) do
		if BackHomeHeroCfg[iter_15_1].idol_usable == 1 then
			table.insert(var_15_0, iter_15_1)
		end
	end

	return var_15_0
end

function var_0_1.GetIdolHeroSkillList(arg_16_0, arg_16_1)
	if IdolPveNpcCfg[arg_16_1] then
		local var_16_0 = {}
		local var_16_1 = IdolPveNpcCfg[arg_16_1]

		for iter_16_0, iter_16_1 in ipairs(var_16_1.idol_active_skill_list) do
			table.insert(var_16_0, {
				skill = iter_16_1
			})
		end

		for iter_16_2, iter_16_3 in ipairs(var_16_1.idol_passive_skill_list) do
			table.insert(var_16_0, {
				skill = iter_16_3
			})
		end

		return var_16_0
	else
		if not var_0_11[arg_16_1] then
			var_0_11[arg_16_1] = {}

			for iter_16_4, iter_16_5 in ipairs(BackHomeHeroCfg[arg_16_1].idol_active_skill_list) do
				table.insert(var_0_11[arg_16_1], {
					skill = iter_16_5[1],
					property = iter_16_5[2]
				})
			end

			for iter_16_6, iter_16_7 in ipairs(BackHomeHeroCfg[arg_16_1].idol_passive_skill_list) do
				table.insert(var_0_11[arg_16_1], {
					skill = iter_16_7[1],
					property = iter_16_7[2]
				})
			end

			table.sort(var_0_11[arg_16_1], function(arg_17_0, arg_17_1)
				return arg_17_0.property < arg_17_1.property
			end)
		end

		return var_0_11[arg_16_1]
	end
end

function var_0_1.GetCurAttackHero(arg_18_0)
	return var_0_2
end

function var_0_1.GetCurAttackHeroInfo(arg_19_0)
	local var_19_0

	for iter_19_0, iter_19_1 in pairs(var_0_2) do
		if iter_19_1 == true then
			var_19_0 = iter_19_0
		end
	end

	return DormData:GetHeroTemplateInfo(var_19_0).property, var_19_0
end

function var_0_1.GetCurDefendHero(arg_20_0)
	return var_0_3
end

function var_0_1.GetIdolHeroData(arg_21_0, arg_21_1)
	return DormData:GetHeroTemplateInfo(arg_21_1):GetDanceProperty(arg_21_1)
end

function var_0_1.GetCurTrainTimes(arg_22_0)
	return var_0_4
end

function var_0_1.GetCurBuffCamp(arg_23_0)
	return var_0_5
end

function var_0_1.GetPveChapterData(arg_24_0)
	return var_0_8
end

function var_0_1.GetCacheOpponentList(arg_25_0)
	return var_0_9
end

function var_0_1.GetCacheFriendList(arg_26_0)
	return var_0_10
end

function var_0_1.GetCurPVPStage(arg_27_0)
	return var_0_6
end

function var_0_1.GetQuestRankInfo(arg_28_0)
	return var_0_12
end

function var_0_1.GetHeroPosList(arg_29_0)
	local var_29_0 = {}
	local var_29_1 = DormData:GetHeroInfoList()

	for iter_29_0, iter_29_1 in pairs(var_29_1) do
		if iter_29_1.dancePos then
			var_29_0[iter_29_1.dancePos] = iter_29_1:GetHeroId()
		end
	end

	return var_29_0
end

function var_0_1.InitHistoryBattleData(arg_30_0, arg_30_1)
	var_0_13 = arg_30_1
end

function var_0_1.GetHistoryBattleData(arg_31_0)
	return var_0_13
end

return var_0_1
