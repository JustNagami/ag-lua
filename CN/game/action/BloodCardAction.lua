local var_0_0 = {}

manager.net:Bind(68051, function(arg_1_0)
	BloodCardData:InitFromServer(arg_1_0)
end)
manager.net:Bind(68057, function(arg_2_0)
	BloodCardManager.Instance:ReciveEenmySufferHand(arg_2_0.exchange_num)
end)
manager.net:Bind(68059, function(arg_3_0)
	BloodCardManager.Instance:ReciveRoundStart(arg_3_0.round)
end)
manager.net:Bind(68063, function(arg_4_0)
	BloodCardManager.Instance:ReciveEnemyDrawCard(arg_4_0.round, arg_4_0.get_num)
end)
manager.net:Bind(68067, function(arg_5_0)
	BloodCardManager.Instance:ReciveEnemyPlaceCard(arg_5_0.round, arg_5_0.card_id, arg_5_0.pos, arg_5_0.influence_list)
end)
manager.net:Bind(68069, function(arg_6_0)
	if isSuccess(arg_6_0.result) then
		BloodCardManager.Instance:RecevieEndRoundResult()
	else
		ShowTips(arg_6_0.result)
	end
end)
manager.net:Bind(68071, function(arg_7_0)
	if arg_7_0.reason == 1 then
		-- block empty
	end

	BloodCardManager.Instance:ReciveEndGame(arg_7_0.success_flag, arg_7_0.red_sum_score, arg_7_0.black_sum_score)

	if arg_7_0.success_flag == 1 and not BloodCardData:GetIsMultiGame() then
		BloodCardData:SetPassStage(BloodCardData:GetSelectStageID())
	end

	BloodCardData:SetIsMultiGame(false)
end)
manager.net:Bind(68077, function(arg_8_0)
	manager.notify:Invoke("BLOOD_CARD_MATCHING_SUCCESS")
	JumpTools.OpenPageUntilLoaded("/bloodCardGame", {
		callBack = function()
			BloodCardData:SetIsMultiGame(true)
			BloodCardManager.Instance:StartGame(arg_8_0.order, cleanProtoTable(arg_8_0.card_id_list))

			BloodCardManager.Instance.guideIndex = 0
			BloodCardManager.Instance.isMultiGame = true
		end
	})
end)

function var_0_0.InitRedPoint(arg_10_0)
	local var_10_0 = RedPointConst.ACTIVITY_BLOOD_CARD .. "_" .. arg_10_0
	local var_10_1 = string.format("%s_%s", RedPointConst.ACTIVITY_TASK, BloodCardData:GetTaskActivityID(arg_10_0))

	manager.redPoint:addGroup(var_10_0, {
		var_10_1
	})
end

function var_0_0.SendSaveCardGroup(arg_11_0, arg_11_1, arg_11_2, arg_11_3, arg_11_4)
	local var_11_0 = BloodCardData:GetRecommendCardSetID()
	local var_11_1 = {
		activity_id = arg_11_0,
		card_group = {
			index = arg_11_1,
			card_id_list = arg_11_2,
			name = arg_11_3 or ""
		},
		recommend_id = var_11_0
	}

	manager.net:SendWithLoadingNew(68080, var_11_1, 68081, function(arg_12_0, arg_12_1)
		if isSuccess(arg_12_0.result) then
			BloodCardData:UpdateCardGroup(arg_11_1, arg_11_2, arg_11_3)
			manager.notify:Invoke("BLOOD_CARD_SAVE_CARD_GROUP")

			if arg_11_4 then
				arg_11_4()
			end
		else
			ShowTips(arg_12_0.result)
		end
	end)
end

function var_0_0.SendClearCardGroup(arg_13_0, arg_13_1, arg_13_2)
	local var_13_0 = {
		activity_id = arg_13_0,
		group_index = arg_13_1
	}

	manager.net:SendWithLoadingNew(68082, var_13_0, 68083, function(arg_14_0, arg_14_1)
		if isSuccess(arg_14_0.result) then
			BloodCardData:UpdateCardGroup(arg_13_1, {}, "")
			BloodCardData:SetUsingCardIndex(arg_14_0.current_group_index)
			manager.notify:Invoke("BLOOD_CARD_CLEAR_CARD_GROUP", arg_13_1)

			if arg_13_2 then
				arg_13_2()
			end
		else
			ShowTips(arg_14_0.result)
		end
	end)
end

function SendStartBloodardGameRequest()
	local var_15_0 = BloodCardData:GetSelectStageID()
	local var_15_1 = BloodCardData:GetUsingCardIndex()

	if BloodCardGameStageCfg[var_15_0] and BloodCardGameStageCfg[var_15_0].freedom == BloodCardConst.STAGE_CARD_GROUP_LIMIT.LIMIT then
		var_15_1 = 0
	end

	local var_15_2 = {
		stage_id = var_15_0,
		group_index = var_15_1
	}

	manager.net:SendWithLoadingNew(68052, var_15_2, 68053, function(arg_16_0, arg_16_1)
		if isSuccess(arg_16_0.result) then
			if table.indexof(BloodCardConst.guideStageList, var_15_0) then
				BloodCardManager.Instance.guideIndex = table.indexof(BloodCardConst.guideStageList, var_15_0)
				BloodCardManager.Instance.guideID = 0

				for iter_16_0, iter_16_1 in pairs(BloodCardConst.stageGuideList[var_15_0]) do
					if not GuideData:IsFinish(iter_16_1) then
						BloodCardManager.Instance.guideID = iter_16_1
					end
				end
			else
				BloodCardManager.Instance.guideIndex = 0
				BloodCardManager.Instance.guideID = 0
			end

			if BloodCardGameStageCfg[var_15_0].freedom == BloodCardConst.STAGE_CARD_GROUP_LIMIT.LIMIT then
				BloodCardManager.Instance:StartGame(arg_16_0.order, cleanProtoTable(arg_16_0.card_id_list), BloodCardGameStageCfg[var_15_0].player_cards, BloodCardGameStageCfg[var_15_0].ai_cards)
			else
				BloodCardManager.Instance:StartGame(arg_16_0.order, cleanProtoTable(arg_16_0.card_id_list), {}, {})
			end
		else
			ShowTips(arg_16_0.result)
		end
	end)
end

function SendSufferCardRequest(arg_17_0)
	timestamp = manager.time:GetServerTime() - BloodCardManager.Instance.startGameTimestamp

	local var_17_0 = {
		exchange_card_id_list = arg_17_0,
		use_seconds = timestamp
	}

	manager.net:SendWithLoadingNew(68054, var_17_0, 68055, function(arg_18_0, arg_18_1)
		if isSuccess(arg_18_0.result) then
			BloodCardManager.Instance:ReciveSufferResult(cleanProtoTable(arg_18_0.return_card_id_list))
		else
			ShowTips(arg_18_0.result)
		end
	end)
end

function SendDrawCardRequest()
	local var_19_0 = {}

	manager.net:SendWithLoadingNew(68060, var_19_0, 68061, function(arg_20_0, arg_20_1)
		if isSuccess(arg_20_0.result) then
			BloodCardManager.Instance:ReciveDrawCardResult(cleanProtoTable(arg_20_0.return_card_id_list))
		else
			ShowTips(arg_20_0.result)
		end
	end)
end

function SendPlaceCardRequest(arg_21_0, arg_21_1)
	local var_21_0 = manager.time:GetServerTime() - BloodCardManager.Instance.drawCardTimestamp
	local var_21_1 = {
		card_id = arg_21_0,
		pos = arg_21_1,
		use_seconds = var_21_0
	}

	manager.net:SendWithLoadingNew(68064, var_21_1, 68065, function(arg_22_0, arg_22_1)
		if isSuccess(arg_22_0.result) then
			BloodCardManager.Instance:RecivePlaceCardResult(arg_22_0.result, arg_22_0.influence_list, arg_22_0.use_seconds)
		elseif arg_22_0.result == 7 then
			ShowTips(arg_22_0.result)
			BloodCardManager.Instance:RecivePlaceCardResult(arg_22_0.result, arg_22_0.influence_list, arg_22_0.use_seconds)
		else
			ShowTips(arg_22_0.result)
		end
	end)
end

function SendEndRoundRequest()
	local var_23_0 = {}

	manager.net:SendWithLoadingNew(68068, var_23_0, 68069, nil)
end

function SendResetGameRequest()
	local var_24_0 = {}

	manager.net:SendWithLoadingNew(68078, var_24_0, 68079, function(arg_25_0, arg_25_1)
		if isSuccess(arg_25_0.result) then
			BloodCardManager.Instance:ResetGame()
			BloodCardData:SetIsMultiGame(false)
		else
			ShowTips(arg_25_0.result)
		end
	end)
end

function SendMultiGameMatching()
	local var_26_0 = BloodCardData:GetMainActivityID()
	local var_26_1 = {
		group_index = 1,
		activity_id = var_26_0
	}

	manager.net:SendWithLoadingNew(68072, var_26_1, 68073, function(arg_27_0, arg_27_1)
		if isSuccess(arg_27_0.result) then
			JumpTools.OpenPageByJump("bloodCardMatchPop")
		else
			ShowTips(arg_27_0.result)
		end
	end)
end

function SendCancelMultiGameMatching()
	local var_28_0 = {}

	manager.net:SendWithLoadingNew(68074, var_28_0, 68075, function(arg_29_0, arg_29_1)
		if isSuccess(arg_29_0.result) then
			manager.notify:Invoke("BLOOD_CARD_MATCHING_CANCEL")
		else
			ShowTips(arg_29_0.result)
		end
	end)
end

function var_0_0.SendSetActiveCardGroup(arg_30_0, arg_30_1, arg_30_2)
	local var_30_0 = arg_30_0
	local var_30_1 = {
		activity_id = var_30_0,
		group_index = arg_30_1
	}

	manager.net:SendWithLoadingNew(68084, var_30_1, 68085, function(arg_31_0, arg_31_1)
		if isSuccess(arg_31_0.result) then
			BloodCardData:SetUsingCardIndex(arg_30_1)

			if arg_30_2 then
				arg_30_2()
			end
		else
			ShowTips(arg_31_0.result)
		end
	end)
end

function BloodCardGoToHome()
	LaunchQWorld(true)
end

function InvokeClickCard(arg_33_0, arg_33_1)
	manager.notify:Invoke(BLOOD_CARD_IN_GAME_CLICK_CARD, arg_33_0, arg_33_1)
end

return var_0_0
