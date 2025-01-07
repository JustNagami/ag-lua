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
local var_0_14 = {}

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
	arg_1_0.danceDIY = nil
	arg_1_0.mySharedDIY = nil
	arg_1_0.cachedSharedFromOtherDIY = {}
	arg_1_0.cachedAuthorInfo = nil
end

function var_0_1.BriefListCacheAvailable(arg_2_0, arg_2_1)
	return nullable(arg_2_0.cachedSharedFromOtherDIY, arg_2_1)
end

function var_0_1.CacheBriefList(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.cachedSharedFromOtherDIY[arg_3_1] = arg_3_2
end

function var_0_1.ParseIdolProperty(arg_4_0, arg_4_1, arg_4_2)
	if arg_4_2 then
		local var_4_0 = IdolTraineePveBattleCfg[arg_4_2]

		if var_4_0 then
			local var_4_1 = var_4_0.npc_id
			local var_4_2 = IdolPveNpcCfg[var_4_1]
			local var_4_3 = {
				0,
				0,
				0,
				0,
				0
			}

			for iter_4_0, iter_4_1 in ipairs(var_4_2.attribute) do
				var_4_3[iter_4_0] = iter_4_1
			end

			return var_4_3, var_4_1
		end
	else
		local var_4_4 = BackHomeHeroCfg[arg_4_1]

		if var_4_4 then
			local var_4_5 = {
				0,
				0,
				0,
				0,
				0
			}

			for iter_4_2, iter_4_3 in ipairs(var_4_5) do
				var_4_5[iter_4_2] = var_4_4.idol_base_attribute[iter_4_2][1]
			end

			if arg_4_0 then
				for iter_4_4, iter_4_5 in ipairs(arg_4_0) do
					var_4_5[iter_4_4] = iter_4_5
				end
			end

			return var_4_5
		else
			Debug.LogError("未获取角色配置信息" .. arg_4_1)
		end
	end
end

function var_0_1.InitDataFromServer(arg_5_0, arg_5_1)
	arg_5_0:InitAttackHeroID(arg_5_1)
	arg_5_0:InitDefendHeroID(arg_5_1)

	for iter_5_0, iter_5_1 in ipairs(arg_5_1.hero_list) do
		DormData:GetHeroTemplateInfo(iter_5_1.hero_id):InitDanceTrainData(iter_5_1)
	end

	var_0_4 = arg_5_1.exercise_times_info.use_times
	var_0_5 = {}

	for iter_5_2, iter_5_3 in ipairs(arg_5_1.exercise_times_info.camp_list) do
		var_0_5[iter_5_3] = true
	end

	var_0_6 = arg_5_1.pvp_stage_info.stage_id
	var_0_7 = arg_5_1.pvp_stage_info.refresh_timestamp

	arg_5_0:UpdateHeroPosList(arg_5_1)
end

function var_0_1.UpdateTrainDataFromServer(arg_6_0, arg_6_1)
	var_0_4 = arg_6_1.exercise_times_info.use_times
	var_0_5 = {}

	for iter_6_0, iter_6_1 in ipairs(arg_6_1.exercise_times_info.camp_list) do
		var_0_5[iter_6_1] = true
	end
end

function var_0_1.UpdatePvpDataFromServer(arg_7_0, arg_7_1)
	var_0_6 = arg_7_1.pvp_stage_info.stage_id
	var_0_7 = arg_7_1.pvp_stage_info.refresh_timestamp
end

function var_0_1.UpdateHeroPosList(arg_8_0, arg_8_1)
	local var_8_0 = DormData:GetHeroInfoList()

	for iter_8_0, iter_8_1 in pairs(var_8_0) do
		if iter_8_1.dancePos then
			iter_8_1:GoToDance(nil)
		end
	end

	for iter_8_2, iter_8_3 in ipairs(arg_8_1.hero_pos_list) do
		local var_8_1 = DormData:GetHeroTemplateInfo(iter_8_3.hero_id)

		var_8_1:SetCurHeroID(iter_8_3.hero_id)
		var_8_1:GoToDance(iter_8_3.pos)
	end
end

function var_0_1.UpdateQuestRankInfo(arg_9_0, arg_9_1)
	var_0_12 = 1

	for iter_9_0, iter_9_1 in ipairs(arg_9_1) do
		if iter_9_1 % 4 + 1 > var_0_12 then
			var_0_12 = iter_9_1 % 4 + 1
		end
	end
end

function var_0_1.InitAttackHeroID(arg_10_0, arg_10_1)
	var_0_2 = {}

	for iter_10_0, iter_10_1 in ipairs(arg_10_1.attack_hero_id_list) do
		var_0_2[iter_10_1] = true
	end
end

function var_0_1.InitDefendHeroID(arg_11_0, arg_11_1)
	var_0_3 = {}

	for iter_11_0, iter_11_1 in ipairs(arg_11_1.defend_hero_id_list) do
		var_0_3[iter_11_1] = true
	end
end

function var_0_1.UpdatePveChapterData(arg_12_0, arg_12_1)
	for iter_12_0, iter_12_1 in ipairs(arg_12_1.chapter_list) do
		if not var_0_8[iter_12_1.chapter_id] then
			var_0_8[iter_12_1.chapter_id] = {}
		end

		for iter_12_2, iter_12_3 in ipairs(iter_12_1.stage_list) do
			var_0_8[iter_12_1.chapter_id][iter_12_3.stage_id] = {
				score = 0,
				pass = false
			}
			var_0_8[iter_12_1.chapter_id][iter_12_3.stage_id].score = iter_12_3.score
			var_0_8[iter_12_1.chapter_id][iter_12_3.stage_id].pass = iter_12_3.is_clear
		end
	end
end

local function var_0_15(arg_13_0)
	local var_13_0 = {}
	local var_13_1 = arg_13_0.profile_base
	local var_13_2 = arg_13_0.hero_list[1]
	local var_13_3 = var_13_2.skin_id
	local var_13_4 = BackHomeHeroSkinCfg[var_13_3].hero_id

	var_13_0.nick = var_13_1.nick
	var_13_0.icon = var_13_1.icon
	var_13_0.icon_frame = var_13_1.icon_frame
	var_13_0.hero_id = var_13_4
	var_13_0.skin_id = var_13_3
	var_13_0.property = var_0_1.ParseIdolProperty(var_13_2.attribute_list, var_13_4)

	return var_13_0
end

function var_0_1.UpdateOpponentList(arg_14_0, arg_14_1)
	var_0_9 = {}

	for iter_14_0, iter_14_1 in ipairs(arg_14_1) do
		if iter_14_1.user_id then
			var_0_9[iter_14_1.user_id] = var_0_15(iter_14_1)
		end
	end
end

function var_0_1.UpdateFriendList(arg_15_0, arg_15_1)
	var_0_10 = {}

	for iter_15_0, iter_15_1 in ipairs(arg_15_1) do
		if iter_15_1.user_id then
			var_0_10[iter_15_1.user_id] = var_0_15(iter_15_1)
		end
	end
end

function var_0_1.GetNpcPropertyByStageID(arg_16_0, arg_16_1)
	local var_16_0, var_16_1 = var_0_1.ParseIdolProperty(nil, nil, arg_16_1)

	return var_16_0, var_16_1
end

function var_0_1.UpdateTrainData(arg_17_0, arg_17_1, arg_17_2)
	var_0_4 = var_0_4 + 1

	local var_17_0 = DormData:GetHeroTemplateInfo(arg_17_1.hero_id)

	var_17_0:SetFatigue(arg_17_2.fatigue)
	var_17_0:UpdataDanceTrainData(arg_17_2, arg_17_1)
end

function var_0_1.GetIdolHeroList(arg_18_0, arg_18_1)
	local var_18_0 = {}
	local var_18_1

	if arg_18_1 then
		var_18_1 = BackHomeHeroCfg.all
	else
		var_18_1 = DormHeroTools:GetUnLockBackHomeHeroIDList()
	end

	for iter_18_0, iter_18_1 in ipairs(var_18_1) do
		if BackHomeHeroCfg[iter_18_1].idol_usable == 1 then
			table.insert(var_18_0, iter_18_1)
		end
	end

	return var_18_0
end

function var_0_1.GetIdolHeroSkillList(arg_19_0, arg_19_1)
	if IdolPveNpcCfg[arg_19_1] then
		local var_19_0 = {}
		local var_19_1 = IdolPveNpcCfg[arg_19_1]

		for iter_19_0, iter_19_1 in ipairs(var_19_1.idol_active_skill_list) do
			table.insert(var_19_0, {
				skill = iter_19_1
			})
		end

		for iter_19_2, iter_19_3 in ipairs(var_19_1.idol_passive_skill_list) do
			table.insert(var_19_0, {
				skill = iter_19_3
			})
		end

		return var_19_0
	else
		if not var_0_11[arg_19_1] then
			var_0_11[arg_19_1] = {}

			for iter_19_4, iter_19_5 in ipairs(BackHomeHeroCfg[arg_19_1].idol_active_skill_list) do
				table.insert(var_0_11[arg_19_1], {
					skill = iter_19_5[1],
					property = iter_19_5[2]
				})
			end

			for iter_19_6, iter_19_7 in ipairs(BackHomeHeroCfg[arg_19_1].idol_passive_skill_list) do
				table.insert(var_0_11[arg_19_1], {
					skill = iter_19_7[1],
					property = iter_19_7[2]
				})
			end

			table.sort(var_0_11[arg_19_1], function(arg_20_0, arg_20_1)
				return arg_20_0.property < arg_20_1.property
			end)
		end

		return var_0_11[arg_19_1]
	end
end

function var_0_1.GetCurAttackHero(arg_21_0)
	return var_0_2
end

function var_0_1.GetCurAttackHeroInfo(arg_22_0)
	local var_22_0

	for iter_22_0, iter_22_1 in pairs(var_0_2) do
		if iter_22_1 == true then
			var_22_0 = iter_22_0
		end
	end

	return DormData:GetHeroTemplateInfo(var_22_0).property, var_22_0
end

function var_0_1.GetCurDefendHero(arg_23_0)
	return var_0_3
end

function var_0_1.GetIdolHeroData(arg_24_0, arg_24_1)
	if not HeroTools.GetHeroIsUnlock(arg_24_1) then
		local var_24_0 = {}
		local var_24_1 = BackHomeHeroCfg[arg_24_1]

		for iter_24_0, iter_24_1 in pairs(var_24_1.idol_base_attribute) do
			table.insert(var_24_0, iter_24_1[1])
		end

		return var_24_0
	end

	return DormData:GetHeroTemplateInfo(arg_24_1):GetDanceProperty(arg_24_1)
end

function var_0_1.GetCurTrainTimes(arg_25_0)
	return var_0_4
end

function var_0_1.GetCurBuffCamp(arg_26_0)
	return var_0_5
end

function var_0_1.GetPveChapterData(arg_27_0)
	return var_0_8
end

function var_0_1.GetCacheOpponentList(arg_28_0)
	return var_0_9
end

function var_0_1.GetCacheFriendList(arg_29_0)
	return var_0_10
end

function var_0_1.GetCurPVPStage(arg_30_0)
	return var_0_6
end

function var_0_1.GetQuestRankInfo(arg_31_0)
	return var_0_12
end

function var_0_1.GetHeroPosList(arg_32_0)
	local var_32_0 = {}
	local var_32_1 = DormData:GetHeroInfoList()

	for iter_32_0, iter_32_1 in pairs(var_32_1) do
		if iter_32_1.dancePos then
			var_32_0[iter_32_1.dancePos] = iter_32_1:GetHeroId()
		end
	end

	return var_32_0
end

function var_0_1.InitHistoryBattleData(arg_33_0, arg_33_1)
	var_0_13 = arg_33_1
end

function var_0_1.GetHistoryBattleData(arg_34_0)
	return var_0_13
end

function var_0_1.InitDanceDIY(arg_35_0, arg_35_1)
	local var_35_0 = arg_35_1.sequence_list

	arg_35_0.danceDIY = {}

	for iter_35_0, iter_35_1 in ipairs(var_35_0) do
		arg_35_0.danceDIY[iter_35_1.pos] = var_0_1.ParseDanceDIYSequence(iter_35_1.base_sequence)
	end

	local var_35_1 = arg_35_1.shared_sequence_list

	if var_35_1 then
		arg_35_0.mySharedDIY = {}

		for iter_35_2, iter_35_3 in ipairs(var_35_1) do
			arg_35_0.mySharedDIY[iter_35_3.uid] = arg_35_0:ParseSharedDIYInfo(iter_35_3)
		end
	end
end

function var_0_1.ParseDanceDIYSequence(arg_36_0, arg_36_1)
	local var_36_0 = {}

	if arg_36_0.action_id_list then
		for iter_36_0, iter_36_1 in ipairs(arg_36_0.action_id_list) do
			table.insert(var_36_0, iter_36_1)
		end
	end

	arg_36_1 = arg_36_1 or {}
	arg_36_1.actionList = var_36_0
	arg_36_1.scene = arg_36_0.scene_id
	arg_36_1.music = arg_36_0.music_id

	return arg_36_1
end

function var_0_1.UpdateDIYStatistics(arg_37_0, arg_37_1)
	arg_37_0.liked = arg_37_1.be_liked_num
	arg_37_0.collcted = arg_37_1.be_collected_num
	arg_37_0.viewCount = arg_37_1.be_viewed_num
end

function var_0_1.ParseSharedDIYInfo(arg_38_0, arg_38_1)
	local var_38_0 = var_0_1.ParseDanceDIYSequence(arg_38_1.base_sequence)
	local var_38_1 = arg_38_1.statistics

	var_0_1.UpdateDIYStatistics(var_38_0, var_38_1)

	var_38_0.uid = arg_38_1.uid

	manager.notify:CallUpdateFunc("OnUpdateMySharedDanceDIYStatistics")

	return var_38_0
end

function var_0_1.UpdateMySharedDanceDIYStatistics(arg_39_0, arg_39_1, arg_39_2)
	local var_39_0 = nullable(arg_39_0.mySharedDIY, arg_39_1)

	if var_39_0 then
		var_0_1.UpdateDIYStatistics(var_39_0, arg_39_2)
		manager.notify:CallUpdateFunc("OnUpdateMySharedDanceDIYStatistics")
	end
end

function var_0_1.NewDanceDIYSequence(arg_40_0)
	return {
		actionList = {}
	}
end

function var_0_1.GetDanceDIYSequence(arg_41_0, arg_41_1)
	return nullable(arg_41_0.danceDIY, arg_41_1)
end

function var_0_1.GetSharedDanceDIYSequence(arg_42_0, arg_42_1)
	return nullable(arg_42_0.mySharedDIY, arg_42_1)
end

function var_0_1.SetDanceDIYSequence(arg_43_0, arg_43_1, arg_43_2)
	arg_43_0.danceDIY[arg_43_1] = arg_43_2

	manager.notify:CallUpdateFunc("OnDanceDIYUpdate", arg_43_1, arg_43_2)
end

function var_0_1.SetSharedDanceDIYSequence(arg_44_0, arg_44_1, arg_44_2)
	arg_44_0.mySharedDIY[arg_44_1] = arg_44_2

	manager.notify:CallUpdateFunc("OnSharedDanceDIYUpdate", arg_44_1, arg_44_2)
end

function var_0_1.GetDanceDIYAvailableSlotIdx(arg_45_0)
	for iter_45_0 = 1, var_0_1.DanceDIYSlotLimit() do
		if arg_45_0.danceDIY[iter_45_0] == nil then
			return iter_45_0
		end
	end
end

function var_0_1.DanceDIYSlotLimit()
	return nullable(GameSetting, "idol_dance_edit_max_num", "value", 1) or 3
end

function var_0_1.ShareDanceDIYLimit()
	return nullable(GameSetting, "idol_dance_edit_share_max_num", "value", 1) or 5
end

function var_0_1.DanceDIYActionAvailable(arg_48_0, arg_48_1)
	local var_48_0 = IdolDanceDIYActionCfg[arg_48_1]

	if var_48_0 then
		if var_48_0.unlock_condition == 0 then
			return true
		end

		local var_48_1 = HistoryData:GetHistoryData(var_48_0.unlock_condition)

		if var_48_1 then
			return var_48_1 >= var_48_0.need
		else
			return false
		end
	end
end

function var_0_1.SetLastJumpContext(arg_49_0, arg_49_1)
	var_0_14 = arg_49_1
end

function var_0_1.AcquireLastJumpContext(arg_50_0)
	local var_50_0 = var_0_14

	var_0_14 = nil

	return var_50_0
end

return var_0_1
