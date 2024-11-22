local var_0_0 = {
	ParseBattleHistoryData = function(arg_1_0, arg_1_1)
		if arg_1_1 then
			return {
				battleID = arg_1_1.battle_id,
				friendType = arg_1_1.battle_type,
				startTime = arg_1_1.timestamp,
				is_attacker = arg_1_1.is_attacker,
				battle_result = arg_1_1.battle_result,
				userID = arg_1_1.another_user_id,
				nick = arg_1_1.another_profile_base.nick,
				icon = arg_1_1.another_profile_base.icon,
				icon_frame = arg_1_1.another_profile_base.icon_frame
			}
		end
	end
}

manager.net:Bind(58169, function(arg_2_0)
	IdolTraineeData:InitDataFromServer(arg_2_0)
end)
manager.net:Bind(58171, function(arg_3_0)
	IdolTraineeData:UpdateTrainDataFromServer(arg_3_0)
	manager.notify:CallUpdateFunc(BACKHOME_IDOL_PVP_STAGE_UPDATE)
end)
manager.net:Bind(58173, function(arg_4_0)
	IdolTraineeData:UpdatePvpDataFromServer(arg_4_0)
	manager.notify:CallUpdateFunc(BACKHOME_IDOL_PVP_STAGE_UPDATE)
end)
manager.net:Bind(58189, function(arg_5_0)
	IdolTraineeData:UpdatePveChapterData(arg_5_0)
end)
manager.net:Bind(58191, function(arg_6_0)
	IdolTraineeData:UpdateQuestRankInfo(arg_6_0.get_id_list)
end)

local function var_0_1(arg_7_0, arg_7_1)
	return function(arg_8_0, arg_8_1)
		local var_8_0

		if isSuccess(arg_8_0.result) then
			var_8_0 = arg_7_0
		else
			ShowTips(arg_8_0.result)

			var_8_0 = arg_7_1
		end

		if var_8_0 then
			var_8_0(arg_8_0, arg_8_1)
		end
	end
end

function var_0_0.GetQuestRankReward(arg_9_0, arg_9_1, arg_9_2)
	manager.net:SendWithLoadingNew(58192, {
		id = arg_9_0,
		select_list = arg_9_1
	}, 58193, function(arg_10_0, arg_10_1)
		if isSuccess(arg_10_0.result) then
			IdolTraineeData:UpdateQuestRankInfo(arg_10_0.get_id_list)

			if arg_9_2 then
				arg_9_2()
			end

			getReward(arg_10_0.reward_list)
			manager.notify:CallUpdateFunc(TASK_LIST_CHANGE)
		else
			ShowTips(arg_10_0.result)
		end
	end)
end

function var_0_0.TrainHeroProperty(arg_11_0, arg_11_1)
	manager.net:SendWithLoadingNew(58166, {
		hero_id = arg_11_0,
		attribute_index = arg_11_1
	}, 58167, var_0_0.OnTrainHeroPropertyCallBack)
end

function var_0_0.OnTrainHeroPropertyCallBack(arg_12_0, arg_12_1)
	if isSuccess(arg_12_0.result) then
		local var_12_0 = DormData:GetHeroTemplateInfo(arg_12_1.hero_id).property[arg_12_1.hero_id][arg_12_1.attribute_index]

		IdolTraineeData:UpdateTrainData(arg_12_1, arg_12_0)

		local var_12_1 = DormData:GetHeroTemplateInfo(arg_12_1.hero_id).property[arg_12_1.hero_id][arg_12_1.attribute_index] - var_12_0

		manager.notify:Invoke(IDOL_TRAINEE_TRAIN_HERO_PROPERTY_CALLBACK, arg_12_1.hero_id, arg_12_1.attribute_index, var_12_1)
	else
		ShowTips(arg_12_0.result)
	end
end

function var_0_0.RequestOpponentList(arg_13_0, arg_13_1, arg_13_2)
	manager.net:SendWithLoadingNew(58180, {
		battle_type = arg_13_0
	}, 58181, function(arg_14_0, arg_14_1)
		if isSuccess(arg_14_0.result) then
			if arg_14_1.battle_type == 1 then
				IdolTraineeData:UpdateFriendList(arg_14_0.pvp_fight_list)
			elseif arg_14_1.battle_type == 2 then
				IdolTraineeData:UpdateOpponentList(arg_14_0.pvp_fight_list)
			end

			manager.notify:Invoke(IDOL_TRAINEE_REFRESH_OPPONENT)
		elseif arg_13_2 then
			ShowTips(arg_14_0.result)
		end

		if arg_13_1 then
			arg_13_1()
		end
	end)
end

local function var_0_2(arg_15_0)
	return function(arg_16_0, arg_16_1)
		if isSuccess(arg_16_0.result) then
			IdolTraineeData:UpdateHeroPosList(arg_16_1)

			if arg_15_0 then
				arg_15_0()
			end

			manager.notify:Invoke(DORM_REGENERATE_HERO)
		else
			ShowTips(arg_16_0.result)
		end
	end
end

local function var_0_3(arg_17_0)
	for iter_17_0, iter_17_1 in pairs(arg_17_0) do
		if iter_17_1.pos > GameSetting.dorm_idol_room_max_place.value[1] or iter_17_1.pos <= 0 then
			return false
		end
	end

	return true
end

function var_0_0.RequestSetHeroPos(arg_18_0, arg_18_1)
	if var_0_3(arg_18_0) then
		manager.net:SendWithLoadingNew(58174, {
			hero_pos_list = arg_18_0
		}, 58175, var_0_2(arg_18_1))
	else
		Debug.LogError("练舞房传入错误位置")

		if arg_18_1 then
			arg_18_1()
		end
	end
end

function var_0_0.RequestSetHeroPosPromise(arg_19_0)
	local var_19_0 = {
		hero_pos_list = arg_19_0
	}

	return manager.net:SendWithLoading(58174, var_19_0, 58175):next(function(arg_20_0)
		var_0_2(nil)(arg_20_0, var_19_0)

		return arg_20_0
	end)
end

function var_0_0.RequestSetAttackHero(arg_21_0, arg_21_1)
	manager.net:SendWithLoadingNew(58176, {
		attack_hero_id_list = {
			arg_21_0
		}
	}, 58177, function(arg_22_0, arg_22_1)
		if isSuccess(arg_22_0.result) then
			IdolTraineeData:InitAttackHeroID(arg_22_1)

			if arg_21_1 then
				arg_21_1()
			end
		else
			ShowTips(arg_22_0.result)
		end
	end)
end

function var_0_0.RequestSetDefendHero(arg_23_0, arg_23_1)
	manager.net:SendWithLoadingNew(58178, {
		defend_hero_id_list = {
			arg_23_0
		}
	}, 58179, function(arg_24_0, arg_24_1)
		if isSuccess(arg_24_0.result) then
			IdolTraineeData:InitDefendHeroID(arg_24_1)

			if arg_23_1 then
				arg_23_1()
			end
		else
			ShowTips(arg_24_0.result)
		end
	end)
end

function var_0_0.AskHistoryBattleData(arg_25_0)
	manager.net:SendWithLoadingNew(58182, {}, 58183, function(arg_26_0, arg_26_1)
		if isSuccess(arg_26_0.result) then
			local var_26_0 = {}

			for iter_26_0, iter_26_1 in ipairs(arg_26_0.history_mini_battle_list) do
				local var_26_1 = var_0_0:ParseBattleHistoryData(iter_26_1)

				var_26_0[var_26_1.battleID] = var_26_1
			end

			IdolTraineeData:InitHistoryBattleData(var_26_0)
		end

		if arg_25_0 then
			arg_25_0()
		end
	end)
end

local function var_0_4(arg_27_0, arg_27_1)
	if not isSuccess(arg_27_0.result) then
		ShowTips(arg_27_0.result)
	end
end

manager.net:Bind(58195, function(arg_28_0)
	IdolTraineeData:InitDanceDIY(arg_28_0)
end)

function var_0_0.SaveDanceDIYSequence(arg_29_0, arg_29_1, arg_29_2)
	if arg_29_0 == nil then
		debugger.WaitIDE()
		debugger.BreakHere()
	end

	manager.net:SendWithLoadingNew(58198, {
		sequence = {
			pos = arg_29_0,
			base_sequence = {
				scene_id = arg_29_1.scene,
				music_id = arg_29_1.music,
				action_id_list = arg_29_1.actionList
			}
		}
	}, 58199, var_0_0.OnSaveDanceDIYSequence(arg_29_1, arg_29_2))
end

function var_0_0.OnSaveDanceDIYSequence(arg_30_0, arg_30_1)
	return function(arg_31_0, arg_31_1)
		if isSuccess(arg_31_0.result) then
			IdolTraineeData:SetDanceDIYSequence(arg_31_1.sequence.pos, arg_30_0)

			if arg_30_1 then
				arg_30_1()
			end
		else
			ShowTips(arg_31_0.result)
		end
	end
end

function var_0_0.DeleteDanceDIYSequence(arg_32_0)
	manager.net:SendWithLoadingNew(58200, {
		pos = arg_32_0
	}, 58201, var_0_0.OnDeleteDanceDIYSequence)
end

function var_0_0.OnDeleteDanceDIYSequence(arg_33_0, arg_33_1)
	if isSuccess(arg_33_0.result) then
		IdolTraineeData:SetDanceDIYSequence(arg_33_1.pos, nil)
	end
end

function var_0_0.ShareDanceDIYSequence(arg_34_0, arg_34_1)
	local var_34_0 = {
		base_sequence = {
			scene_id = arg_34_0.scene,
			music_id = arg_34_0.music,
			action_id_list = arg_34_0.actionList
		}
	}

	manager.net:SendWithLoadingNew(58204, var_34_0, 58205, var_0_0.OnShareDanceDIYSequence(arg_34_0, arg_34_1))
end

function var_0_0.OnShareDanceDIYSequence(arg_35_0, arg_35_1)
	return function(arg_36_0, arg_36_1)
		if isSuccess(arg_36_0.result) then
			IdolTraineeData:SetSharedDanceDIYSequence(arg_36_0.uid, arg_35_0)

			if arg_35_1 then
				arg_35_1(arg_36_0, arg_36_1)
			end
		elseif arg_36_0.result == TipsCfg.get_id_list_by_define.ERROR_NUM_LIMIT then
			ShowTips("IDOL_DANCE_DIY_SHARE_LIMIT_EXCEEDED")
		else
			ShowTips(arg_36_0.result)
		end
	end
end

function var_0_0.StopShareDanceDIYSeqence(arg_37_0)
	manager.net:SendWithLoadingNew(58206, {
		uid = arg_37_0
	}, 58207, var_0_0.OnStopShareDanceDIYSeqence)
end

function var_0_0.OnStopShareDanceDIYSeqence(arg_38_0, arg_38_1)
	if isSuccess(arg_38_0.result) then
		IdolTraineeData:SetSharedDanceDIYSequence(arg_38_1.uid, nil)
	else
		ShowTips(arg_38_0.result)
	end
end

function var_0_0.Like(arg_39_0, arg_39_1)
	manager.net:SendWithLoadingNew(58208, {
		uid = arg_39_0
	}, 58209, var_0_0.OnLike(arg_39_1))
end

function var_0_0.OnLike(arg_40_0)
	return function(arg_41_0, arg_41_1)
		if isSuccess(arg_41_0.result) then
			if arg_40_0 then
				arg_40_0(arg_41_1.uid)
			end
		else
			ShowTips(arg_41_0.result)
		end
	end
end

function var_0_0.ForkDIYSequence(arg_42_0, arg_42_1, arg_42_2, arg_42_3)
	manager.net:SendWithLoadingNew(58210, {
		uid = arg_42_0,
		sequence = {
			pos = arg_42_2,
			base_sequence = {
				scene_id = arg_42_1.scene,
				music_id = arg_42_1.music,
				action_id_list = arg_42_1.actionList
			}
		}
	}, 58211, var_0_0.OnForkDIYSequence(arg_42_1, arg_42_3))
end

function var_0_0.OnForkDIYSequence(arg_43_0, arg_43_1)
	return function(arg_44_0, arg_44_1)
		if isSuccess(arg_44_0.result) then
			IdolTraineeData:SetDanceDIYSequence(arg_44_1.sequence.pos, arg_43_0)

			if arg_43_1 then
				arg_43_1(arg_44_1.uid, arg_44_0.be_collected_num)
			end
		elseif arg_44_0.result == TipsCfg.get_id_list_by_define.ERROR_USER_NOT_ACHIEVE_CONDITION then
			ShowTips("IDOL_DANCE_DIY_FORK_SHARED_NOT_ACHIEVE_CONDITION")
		else
			ShowTips(arg_44_0.result)
		end
	end
end

function var_0_0.GetSharedDanceDIYSequenceDetail(arg_45_0, arg_45_1)
	manager.net:SendWithLoadingNew(58212, {
		sequence_uid = arg_45_0
	}, 58213, var_0_1(arg_45_1))
end

function var_0_0.GetSharedDanceDIYBriefList(arg_46_0, arg_46_1, arg_46_2)
	manager.net:SendWithLoadingNew(58214, {
		type = arg_46_0
	}, 58215, function(arg_47_0, arg_47_1)
		if isSuccess(arg_47_0.result) then
			arg_46_1(arg_47_0, arg_47_1)
		elseif arg_47_0.result == TipsCfg.get_id_list_by_define.ERROR_REFRESH_TOO_FAST then
			if arg_46_2 then
				arg_46_2(arg_47_0, arg_47_1)
			else
				ShowTips(arg_47_0.result)
			end
		else
			ShowTips(arg_47_0.result)
		end
	end)
end

function var_0_0.ProcessAuthorInfo(arg_48_0, arg_48_1)
	arg_48_1 = arg_48_1 or {}

	for iter_48_0, iter_48_1 in ipairs(arg_48_0.user_brief_list) do
		arg_48_1[iter_48_1.user_id] = {
			uid = iter_48_1.user_id,
			name = iter_48_1.profile_base.nick,
			headId = iter_48_1.profile_base.icon,
			frameId = iter_48_1.profile_base.icon_frame
		}
	end

	return arg_48_1
end

function var_0_0.ProcessBriefList(arg_49_0, arg_49_1)
	local var_49_0 = {}

	for iter_49_0, iter_49_1 in ipairs(arg_49_0.sequence_brief_list) do
		local var_49_1 = IdolTraineeData.ParseDanceDIYSequence(iter_49_1)

		IdolTraineeData.UpdateDIYStatistics(var_49_1, iter_49_1)

		local var_49_2 = nullable(arg_49_1, iter_49_1.user_id, "name") or "--"
		local var_49_3 = IdolTraineeTools.GetSharedDIYDanceDataName(var_49_2)
		local var_49_4 = {
			source = IdolTraineeConst.DataSource.OthersSharedData,
			id = iter_49_1.sequence_uid,
			name = var_49_3,
			author = iter_49_1.user_id,
			authorInfo = arg_49_1[iter_49_1.user_id],
			recommend = iter_49_1.recommend_value,
			actionCount = iter_49_1.action_num,
			data = var_49_1
		}

		table.insert(var_49_0, var_49_4)
	end

	return var_49_0
end

function var_0_0.GetMySharedDanceDIYStatistics(arg_50_0)
	manager.net:SendWithLoadingNew(58216, {}, 58217, var_0_0.OnGetMySharedDanceDIYStatistics(arg_50_0))
end

function var_0_0.OnGetMySharedDanceDIYStatistics(arg_51_0)
	return function(arg_52_0)
		if isSuccess(arg_52_0.result) then
			for iter_52_0, iter_52_1 in ipairs(arg_52_0.sequence_statistics_list) do
				local var_52_0 = iter_52_1.sequence_uid

				IdolTraineeData:UpdateMySharedDanceDIYStatistics(var_52_0, iter_52_1.statistics)
			end

			if arg_51_0 then
				arg_51_0(arg_52_0)
			end
		else
			ShowTips(arg_52_0.result)
		end
	end
end

return var_0_0
