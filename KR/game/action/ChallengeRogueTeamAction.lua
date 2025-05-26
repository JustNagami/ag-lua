local var_0_0 = {}

manager.net:Bind(88001, function(arg_1_0)
	ChallengeRogueTeamData:InitPathDataFromServer(arg_1_0)
	manager.notify:Invoke(CHALLENGE_ROGUE_TEAM_MAP_INIT)
	var_0_0.CheckNeedMapSwitchEffect()
end)
manager.net:Bind(88003, function(arg_2_0)
	ChallengeRogueTeamData:UpdateNode(arg_2_0)
	var_0_0.CheckNeedMapSwitchEffect()

	if not ChallengeRogueTeamTools.HasMapSwitchEffect() then
		local var_2_0 = ChallengeRogueTeamData:UIGetPlayAnimatorNodeIDList()

		for iter_2_0, iter_2_1 in pairs(ChallengeRogueTeamData:PathGetFinishPath()) do
			if not table.keyof(var_2_0, iter_2_1) then
				ChallengeRogueTeamData:AddServerTriggerQueue(ChallengeRogueTeamConst.SERVER_TRIGGER_TYPE.MAP_NODE_EFFECT, {
					nodeID = iter_2_1
				})
				ChallengeRogueTeamData:UIInsertPlayAnimatorNodeIDList(iter_2_1)
				ChallengeRogueTeamData:UISetNodeEffectID(iter_2_1)
			end
		end
	end

	manager.notify:Invoke(CHALLENGE_ROGUE_TEAM_PATH_FINISH_NODE)
end)
manager.net:Bind(88011, function(arg_3_0)
	ChallengeRogueTeamData:PathSetFloorState(arg_3_0.floor_state)
	manager.notify:Invoke(CHALLENGE_ROGUE_TEAM_MAP_CLEAR)
end)
manager.net:Bind(88013, function(arg_4_0)
	ChallengeRogueTeamData:UpdateGlobalAttribute(arg_4_0)
	manager.notify:Invoke(CHALLENGE_ROGUE_TEAM_UPDATE_WINDOW)
end)
manager.net:Bind(88015, function(arg_5_0)
	var_0_0.UpdatePopWindow(arg_5_0)
end)
manager.net:Bind(88027, function(arg_6_0)
	var_0_0.UpdateShopWindow(arg_6_0)
end)
manager.net:Bind(88029, function(arg_7_0)
	ChallengeRogueTeamData:UpdateGuideState(arg_7_0)
end)
manager.net:Bind(88019, function(arg_8_0)
	ChallengeRogueTeamData:UpdateHeroHP(arg_8_0)
end)
manager.net:Bind(88021, function(arg_9_0)
	for iter_9_0, iter_9_1 in ipairs(arg_9_0.item_list) do
		local var_9_0 = iter_9_1.opt

		for iter_9_2, iter_9_3 in ipairs(iter_9_1.treasure_list) do
			ChallengeRogueTeamData:TreasureListUpdate(var_9_0, iter_9_3)
		end

		for iter_9_4, iter_9_5 in ipairs(iter_9_1.other_list) do
			ChallengeRogueTeamData:EffectItemListUpdate(var_9_0, iter_9_5)
		end
	end

	manager.notify:Invoke(CHALLENGE_ROGUE_TEAM_BAG_UPDATE)
end)
manager.net:Bind(88305, function(arg_10_0)
	ChallengeRogueTeamData:InitOutSideFromServer(arg_10_0)
end)
manager.net:Bind(88309, function(arg_11_0)
	ChallengeRogueTeamData:SetRewardedScoreList(arg_11_0.template_id, arg_11_0.reward_list)
end)

function var_0_0.RequestViewCollectionItem(arg_12_0, arg_12_1, arg_12_2, arg_12_3)
	manager.net:SendWithLoadingNew(88312, {
		template_id = arg_12_0,
		colllection_id = arg_12_1,
		type = arg_12_2
	}, 88313, function(arg_13_0)
		if isSuccess(arg_13_0.result) then
			ChallengeRogueTeamData:UpdateViewedIllustrated(arg_12_0, arg_12_1)
			manager.notify:Invoke(CHALLENGE_ROGUE_TEAM_VIWED_ILLUSTRADED, arg_12_1)

			if arg_12_3 then
				arg_12_3()
			end
		else
			ShowTips(arg_13_0.result)
		end
	end)
end

function var_0_0.RequestGameResult(arg_14_0)
	local var_14_0 = ChallengeRogueTeamData:IsFinishGuide()

	manager.net:SendWithLoadingNew(88306, {}, 88307, function(arg_15_0)
		if isSuccess(arg_15_0.result) then
			ChallengeRogueTeamData:SetGuideStatisticsFlag(var_14_0)
			ChallengeRogueTeamData:UpdateOverStatisticsData(arg_15_0.end_info_list, arg_15_0.unlock_collection)
			ChallengeRogueTeamData:UpdateIllustrated(ChallengeRogueTeamData:GetActiveTemplateID(), arg_15_0.collection_list)
			ChallengeRogueTeamData:UpdateUnlockIllustrated(ChallengeRogueTeamData:GetActiveTemplateID(), arg_15_0.unlock_collection)
			ChallengeRogueTeamData:UpdateTotalTime(arg_15_0.total_time)
			manager.notify:Invoke(CHALLENGE_ROGUE_TEAM_GAME_OVER_STATIC)

			if arg_14_0 then
				arg_14_0()
			end
		else
			ShowTips(arg_15_0.result)
		end
	end)
end

function var_0_0.UpdateHistoryData()
	if ChallengeRogueTeamData:PathGetFloorState() == ChallengeRogueTeamConst.FLOOR_STATE.OVER then
		if ChallengeRogueTeamTools.IsGuideFloor() then
			return
		end

		local var_16_0 = ChallengeRogueTeamData:GetActiveTemplateID()
		local var_16_1 = ChallengeRogueTeamData:GetSelectDifficultyID(var_16_0)

		ChallengeRogueTeamData:AddHistoryDifficultyClearCnt(var_16_0, var_16_1)

		local var_16_2 = ChallengeRogueTeamData.PlotGetEndingID()

		ChallengeRogueTeamData:AddHistoryEndingPassCnt(var_16_0, var_16_2)
	end
end

function var_0_0.SelectedNode(arg_17_0, arg_17_1)
	local var_17_0 = ChallengeRogueTeamData:PathGetSelectedNodeID()

	ChallengeRogueTeamData:PathSetSelectedNodeID(arg_17_0)
	manager.net:SendWithLoadingNew(88004, {
		node_id = arg_17_0
	}, 88005, function(arg_18_0)
		if isSuccess(arg_18_0.result) then
			manager.notify:Invoke(CHALLENGE_ROGUE_TEAM_PATH_SELECTED_NODE)

			if arg_17_1 then
				arg_17_1()
			end
		else
			ChallengeRogueTeamData:PathSetSelectedNodeID(var_17_0)
			ShowTips(arg_18_0.result)
		end
	end)
end

function var_0_0.RequestNextMapData(arg_19_0)
	local var_19_0 = ChallengeRogueTeamData:GetRefreshMapFlag()

	manager.net:SendWithLoadingNew(88008, {
		sign = var_19_0
	}, 88009, function(arg_20_0)
		if isSuccess(arg_20_0.result) then
			ChallengeRogueTeamData:SetRefreshMapFlag()

			if var_19_0 == ChallengeRogueTeamConst.MAP_FLOOR_SWTICH.EXIT_HIDDEN then
				ChallengeRogueTeamData:PathExitSecondMap()

				local var_20_0 = ChallengeRogueTeamData:PathGetFinishPath()
				local var_20_1 = var_20_0[#var_20_0]

				ChallengeRogueTeamData:AddServerTriggerQueue(ChallengeRogueTeamConst.SERVER_TRIGGER_TYPE.MAP_NODE_EFFECT, {
					nodeID = var_20_1
				})
				ChallengeRogueTeamData:UIInsertPlayAnimatorNodeIDList(var_20_1)
				ChallengeRogueTeamData:UISetNodeEffectID(var_20_1)
			elseif var_19_0 == ChallengeRogueTeamConst.MAP_FLOOR_SWTICH.ENTER_HIDDEN then
				ChallengeRogueTeamData:CheckFinishNode()
			end

			manager.notify:Invoke(CHALLENGE_ROGUE_TEAM_MAP_INIT)
			arg_19_0(arg_20_0)
		else
			ShowTips(arg_20_0.result)
			arg_19_0(arg_20_0)
		end
	end)
end

function var_0_0.SelectedEventValue(arg_21_0, arg_21_1, arg_21_2)
	manager.net:SendWithLoadingNew(88200, {
		event_id = arg_21_0,
		param_arg = arg_21_1
	}, 88201, function(arg_22_0)
		if isSuccess(arg_22_0.result) then
			if arg_22_0.window_opt == true then
				ChallengeRogueTeamData:ClearUnOperateData()
			end

			if arg_21_2 then
				arg_21_2()
			end
		else
			ShowTips(arg_22_0.result)
		end
	end)
end

function var_0_0.ShopBuyItem(arg_23_0, arg_23_1)
	manager.net:SendWithLoadingNew(88222, {
		index = arg_23_0
	}, 88223, function(arg_24_0)
		if isSuccess(arg_24_0.result) then
			if arg_23_0 == 0 then
				ChallengeRogueTeamData:ClearShopData()
			end

			if arg_23_1 then
				arg_23_1()
			end
		else
			ShowTips(arg_24_0.result)
		end
	end)
end

function var_0_0.UpdatePopWindow(arg_25_0)
	ChallengeRogueTeamData:UpdateOperateData(arg_25_0.other_info)
	manager.notify:Invoke(CHALLENGE_ROGUE_TEAM_UPDATE_OPERATE_WINDOW)
	manager.notify:Invoke(CHALLENGE_ROGUE_TEAM_UPDATE_WINDOW)
end

function var_0_0.UpdateShopWindow(arg_26_0)
	ChallengeRogueTeamData:UpdateShopData(arg_26_0.shop_info)
	manager.notify:Invoke(CHALLENGE_ROGUE_TEAM_UPDATE_OPERATE_WINDOW)
	manager.notify:Invoke(CHALLENGE_ROGUE_TEAM_UPDATE_WINDOW)
end

function var_0_0.SetUIDifficulty(arg_27_0)
	ChallengeRogueTeamData:SetUIDifficultyID(arg_27_0)
end

function var_0_0.SelectedDifficulty(arg_28_0, arg_28_1, arg_28_2, arg_28_3)
	manager.net:SendWithLoadingNew(88100, {
		template_id = arg_28_0,
		difficult = arg_28_1,
		hero_list = arg_28_2
	}, 88101, function(arg_29_0)
		if isSuccess(arg_29_0.result) then
			ChallengeRogueTeamData:SetActiveTemplateID(arg_28_0)
			ChallengeRogueTeamData:SetSelectDifficultyID(arg_28_0, arg_28_1)
			ChallengeRogueTeamData:HeroSetLockState(true)

			if arg_28_3 then
				arg_28_3()
			end
		else
			ShowTips(arg_29_0.result)
		end
	end)
end

function var_0_0.HeroRecruit(arg_30_0, arg_30_1, arg_30_2)
	local var_30_0 = {}

	for iter_30_0, iter_30_1 in ipairs(arg_30_0) do
		var_30_0[iter_30_0] = {
			hp_ratio = 10000,
			hero_id = iter_30_1,
			temp_id = arg_30_1[iter_30_0]
		}
	end

	manager.net:SendWithLoadingNew(88102, {
		hero_list = var_30_0
	}, 88103, function(arg_31_0)
		if isSuccess(arg_31_0.result) then
			arg_30_2()
		else
			ShowTips(arg_31_0.result)
		end
	end)
end

function var_0_0.GotoRogueTeamEntrace()
	JumpTools.GoToSystem("/challengeRogueTeamEntrace", {
		templateID = ChallengeRogueTeamData:GetCacheTemplateID()
	})
end

function var_0_0.GotoRogueTeamSystem()
	local var_33_0 = ChallengeRogueTeamData:GetCacheTemplateID()

	if ChallengeRogueTeamData:GetSelectDifficultyID(var_33_0) == 0 then
		JumpTools.GoToSystem("/challengeRogueTeamEntraceDifficulty")
	else
		var_0_0.OnPlayingState(ChallengeRogueTeamConst.PLAYING_STATE.ENTER, function()
			JumpTools.GoToSystem("/challengeRogueTeamPathMain")
		end)
	end
end

function var_0_0.ResetOperateData(arg_35_0, arg_35_1)
	manager.net:SendWithLoadingNew(88202, {
		event_id = arg_35_0
	}, 88203, function(arg_36_0)
		if isSuccess(arg_36_0.result) then
			arg_35_1()
		else
			ShowTips(arg_36_0.result)
		end
	end)
end

manager.net:Bind(88205, function(arg_37_0)
	ChallengeRogueTeamData:UpdateObtainItem(arg_37_0)
	manager.notify:Invoke(CHALLENGE_ROGUE_TEAM_UPDATE_WINDOW)
end)
manager.net:Bind(88017, function(arg_38_0)
	ChallengeRogueTeamData:UpdateEffectList(arg_38_0)
	manager.notify:Invoke(CHALLENGE_ROGUE_TEAM_UPDATA_EFFECT_LIST)
end)

function var_0_0.CloseNodeReplaceWindow(arg_39_0, arg_39_1, arg_39_2)
	manager.net:SendWithLoadingNew(88208, {
		node_id = arg_39_0,
		node_type = arg_39_1
	}, 88209, function(arg_40_0)
		if isSuccess(arg_40_0.result) then
			arg_39_2(arg_40_0)
		else
			ShowTips(arg_40_0.result)
		end
	end)
end

manager.net:Bind(88211, function(arg_41_0)
	ChallengeRogueTeamData:SuitSkillSetValue({
		suitSkillID = arg_41_0.id,
		energyValue = arg_41_0.value
	})
end)

function var_0_0.RemoveSelectedItem(arg_42_0, arg_42_1)
	manager.net:SendWithLoadingNew(88212, {
		item_id_list = arg_42_0
	}, 88213, function(arg_43_0)
		if isSuccess(arg_43_0.result) then
			ChallengeRogueTeamData:ClearUnOperateData()
			arg_42_1(arg_43_0)
		else
			ShowTips(arg_43_0.result)
		end
	end)
end

manager.net:Bind(88221, function(arg_44_0)
	ChallengeRogueTeamData:SetRefreshMapFlag(arg_44_0.sign)
	var_0_0.CheckNeedMapSwitchEffect()
end)
manager.net:Bind(88033, function(arg_45_0)
	ChallengeRogueTeamData:SetBattleResultData(arg_45_0)
end)
manager.net:Bind(88023, function(arg_46_0)
	ChallengeRogueTeamData:UISetEventPause(false)
	ChallengeRogueTeamData:EventUpdate(arg_46_0)
	manager.notify:Invoke(CHALLENGE_ROGUE_TEAM_UPDATE_WINDOW)
end)

function var_0_0.ChooiseEventOptionID(arg_47_0, arg_47_1)
	manager.net:SendWithLoadingNew(88024, {
		opt_id = arg_47_0
	}, 88025, function(arg_48_0)
		if isSuccess(arg_48_0.result) then
			ChallengeRogueTeamData:UISetEventIDAnimator()
			arg_47_1(arg_48_0)
		else
			ShowTips(arg_48_0.result)
		end
	end)
end

manager.net:Bind(88215, function(arg_49_0)
	ChallengeRogueTeamData:PlotSetWorldLineID(arg_49_0.id)
end)
manager.net:Bind(88217, function(arg_50_0)
	ChallengeRogueTeamData:PlotSetEndingData(arg_50_0)
end)

function var_0_0.PlayEndingPlot(arg_51_0)
	manager.net:SendWithLoadingNew(88218, {}, 88219, function(arg_52_0)
		if isSuccess(arg_52_0.result) then
			ChallengeRogueTeamData:PlotSetEndingPlayState(ChallengeRogueTeamConst.ENDING_PLOT_STATE.PLAYED)
			arg_51_0()
		else
			ShowTips(arg_52_0.result)
		end
	end)
end

function var_0_0.OnPlayingState(arg_53_0, arg_53_1)
	local var_53_0 = ChallengeRogueTeamData:GetCacheTemplateID()

	if ChallengeRogueTeamData:GetSelectDifficultyID(var_53_0) == 0 then
		arg_53_1()

		return
	end

	manager.net:SendWithLoadingNew(88030, {
		type = arg_53_0
	}, 88031, function(arg_54_0)
		if isSuccess(arg_54_0.result) then
			arg_53_1()
		end
	end)
end

var_0_0.popWindowCnt_ = 0

function var_0_0.AddPopWindowCnt()
	var_0_0.popWindowCnt_ = var_0_0.popWindowCnt_ + 1
end

function var_0_0.RemovePopWindowCnt()
	var_0_0.popWindowCnt_ = var_0_0.popWindowCnt_ - 1

	if var_0_0.popWindowCnt_ < 0 then
		var_0_0.popWindowCnt_ = 0
	end
end

function var_0_0.ResetPopWindowCnt()
	var_0_0.popWindowCnt_ = 0
end

function var_0_0.PopWindowProcessSystem()
	if var_0_0.popWindowCnt_ > 0 then
		return true
	end

	local var_58_0 = ChallengeRogueTeamData:GetServerTriggerQueue()[1]

	if var_58_0 then
		local var_58_1 = var_58_0.triggerType

		if var_58_1 ~= ChallengeRogueTeamConst.SERVER_TRIGGER_TYPE.TREASURE and ChallengeRogueTeamTools.NeedPlaySuitSkillEffectAnimation() then
			var_0_0.AddPopWindowCnt()
			manager.rogueTeamInGameInfoBox:RefreshSuitSkillBox()

			return true
		end

		if var_58_1 == ChallengeRogueTeamConst.SERVER_TRIGGER_TYPE.ATTRIBUTE then
			return var_0_0.TriggerGlobalAttributePop(var_58_0) or var_0_0.PopWindowProcessSystem()
		elseif var_58_1 == ChallengeRogueTeamConst.SERVER_TRIGGER_TYPE.OPERATE_POP_WINDOW then
			return var_0_0.TriggerOperateWindow(var_58_0) or var_0_0.PopWindowProcessSystem()
		elseif var_58_1 == ChallengeRogueTeamConst.SERVER_TRIGGER_TYPE.REWARD_POP_WINDOW then
			return var_0_0.TriggerRewardWindow(var_58_0) or var_0_0.PopWindowProcessSystem()
		elseif var_58_1 == ChallengeRogueTeamConst.SERVER_TRIGGER_TYPE.HERO_HP_MODITY then
			var_0_0.AddPopWindowCnt()
			manager.rogueTeamInGameInfoBox:PlayHeroTeamEffect(var_58_0)

			return var_0_0.PopWindowProcessSystem()
		elseif var_58_1 == ChallengeRogueTeamConst.SERVER_TRIGGER_TYPE.HERO_UNLOCK then
			var_0_0.AddPopWindowCnt()
			manager.rogueTeamInGameInfoBox:PlayAddHeroEffect()

			return var_0_0.PopWindowProcessSystem()
		elseif var_58_1 == ChallengeRogueTeamConst.SERVER_TRIGGER_TYPE.WORLD_LINE_CHANGE then
			var_0_0.AddPopWindowCnt()

			return var_0_0.TriggerWorldLineWindow(var_58_0)
		elseif var_58_1 == ChallengeRogueTeamConst.SERVER_TRIGGER_TYPE.RELIC_CNT_EFFECT then
			var_0_0.AddPopWindowCnt()
			manager.rogueTeamInGameInfoBox:PlayRelicEffect(var_58_0.value)

			return true
		elseif var_58_1 == ChallengeRogueTeamConst.SERVER_TRIGGER_TYPE.BUFF_CNT_EFFECT then
			var_0_0.AddPopWindowCnt()
			manager.rogueTeamInGameInfoBox:PlayBuffEffect()

			return true
		elseif var_58_1 == ChallengeRogueTeamConst.SERVER_TRIGGER_TYPE.TREASURE then
			var_0_0.AddPopWindowCnt()
			manager.rogueTeamInGameInfoBox:RefreshTreasureBox(var_58_0)

			return true
		elseif var_58_1 == ChallengeRogueTeamConst.SERVER_TRIGGER_TYPE.MAP_SWITCH then
			var_0_0:AddPopWindowCnt()

			return var_0_0.TriggerMapSwitchWindow(var_58_0)
		elseif var_58_1 == ChallengeRogueTeamConst.SERVER_TRIGGER_TYPE.MAP_NODE_EFFECT then
			var_0_0:AddPopWindowCnt()

			return var_0_0.TriggerMapNodeChanged(var_58_0)
		else
			ChallengeRogueTeamData:RemoveServerTriggerQueue()

			return var_0_0.PopWindowProcessSystem()
		end

		return true
	end

	return false
end

function var_0_0.TriggerGlobalAttributePop(arg_59_0)
	local var_59_0 = arg_59_0.value.attributeID

	if var_59_0 == ChallengeRogueTeamConst.ATTRIBUTE_ENUM.MECHANISM_VALUE then
		var_0_0.AddPopWindowCnt()
		manager.rogueTeamMechanismBar:PlayAnimator(arg_59_0)

		return true
	elseif var_59_0 == ChallengeRogueTeamConst.ATTRIBUTE_ENUM.GOLD or var_59_0 == ChallengeRogueTeamConst.ATTRIBUTE_ENUM.REVIVE_CNT or var_59_0 == ChallengeRogueTeamConst.ATTRIBUTE_ENUM.REVIVE_LIMIT_CNT then
		local var_59_1 = ChallengeRogueTeamData:AttributeGetValue(var_59_0)

		if ChallengeRogueTeamData:UIGetAttributeValue(var_59_0) ~= var_59_1 then
			var_0_0.AddPopWindowCnt()
			manager.rogueTeamWindowBar:PlayAnimator(var_59_0)

			return true
		end
	end

	local var_59_2 = ChallengeRogueTeamData:AttributeGetValue(var_59_0)

	ChallengeRogueTeamData:UISetAttributeValue(var_59_0, var_59_2)
	ChallengeRogueTeamData:RemoveServerTriggerQueue()

	return false
end

function var_0_0.TriggerOperateWindow(arg_60_0)
	local var_60_0 = ChallengeRogueTeamData:GetUnOperateData().eventType

	ChallengeRogueTeamData:UISetOperatePopType(var_60_0)

	if var_60_0 == ChallengeRogueTeamConst.NODE_UNOPERATE_EVENT.TREASURE then
		var_0_0.AddPopWindowCnt()
		JumpTools.OpenPageByJump("challengeRogueTeamTreasureSelect")

		return true
	elseif var_60_0 == ChallengeRogueTeamConst.NODE_UNOPERATE_EVENT.RELIC then
		var_0_0.AddPopWindowCnt()
		JumpTools.OpenPageByJump("challengeRogueTeamTreasureSelect")

		return true
	elseif var_60_0 == ChallengeRogueTeamConst.NODE_UNOPERATE_EVENT.HERO_RECRUIT then
		var_0_0.AddPopWindowCnt()
		JumpTools.OpenPageByJump("/challengeRogueTeamHeroSelect", {
			isEnter = true
		})

		return true
	elseif var_60_0 == ChallengeRogueTeamConst.NODE_UNOPERATE_EVENT.INIT_REWARD then
		var_0_0.AddPopWindowCnt()
		JumpTools.OpenPageByJump("challengeRogueTeamTreasureSelect")

		return true
	elseif var_60_0 == ChallengeRogueTeamConst.NODE_UNOPERATE_EVENT.BAG_ITEM_REPLACE then
		var_0_0.AddPopWindowCnt()
		JumpTools.OpenPageByJump("/challengeRogueTeamBagItemSelect")

		return true
	elseif var_60_0 == ChallengeRogueTeamConst.NODE_UNOPERATE_EVENT.MECHANISM then
		var_0_0.AddPopWindowCnt()
		JumpTools.OpenPageByJump("challengeRogueTeamTreasureSelect")

		return true
	else
		ChallengeRogueTeamData:RemoveServerTriggerQueue()

		return false
	end
end

function var_0_0.TriggerRewardWindow(arg_61_0)
	local var_61_0 = arg_61_0.value.itemList[1]
	local var_61_1 = var_61_0.id
	local var_61_2 = RogueTeamItemCfg[var_61_1]
	local var_61_3 = arg_61_0.value.sourceType

	if var_61_0.operate == ChallengeRogueTeamConst.ITEM_OPERATE.UPDATE then
		var_0_0.AddPopWindowCnt()
		JumpTools.OpenPageByJump("challengeRogueTeamTreasureUpgrade", {
			triggerValue = arg_61_0.value
		})

		return true
	end

	if var_61_3 == ChallengeRogueTeamConst.ITEM_SOURCE_TYPE.HIDE and var_61_2.type ~= ChallengeRogueTeamConst.ITEM_TYPE.SUIT_SKILL then
		var_0_0.UpdateUIItemData(arg_61_0)
		ChallengeRogueTeamData:ClearObtainData()
		ChallengeRogueTeamData:RemoveServerTriggerQueue()

		return false
	end

	if var_61_2.type == ChallengeRogueTeamConst.ITEM_TYPE.SUIT_SKILL then
		var_0_0.AddPopWindowCnt()
		JumpTools.OpenPageByJump("challengeRogueTeamSuitSkill", {
			triggerValue = arg_61_0.value
		})

		return true
	else
		var_0_0.AddPopWindowCnt()
		JumpTools.OpenPageByJump("challengeRogueTeamReward", {
			triggerValue = arg_61_0.value
		})
		var_0_0.UpdateUIItemData(arg_61_0)

		return true
	end

	return false
end

function var_0_0.UpdateUIItemData(arg_62_0)
	local var_62_0 = arg_62_0.value.itemList[1].id
	local var_62_1 = RogueTeamItemCfg[var_62_0]

	if var_62_1.type == ChallengeRogueTeamConst.ITEM_TYPE.TREASURE then
		ChallengeRogueTeamData:InsertServerTriggerQueue(ChallengeRogueTeamConst.SERVER_TRIGGER_TYPE.TREASURE, 2, arg_62_0.value)
	elseif var_62_1.type == ChallengeRogueTeamConst.ITEM_TYPE.RELIC then
		ChallengeRogueTeamData:InsertServerTriggerQueue(ChallengeRogueTeamConst.SERVER_TRIGGER_TYPE.RELIC_CNT_EFFECT, 2, arg_62_0)
	elseif var_62_1.type == ChallengeRogueTeamConst.ITEM_TYPE.MECHANISM and arg_62_0.value.itemList[1].operate ~= ChallengeRogueTeamConst.ITEM_OPERATE.DELETE then
		ChallengeRogueTeamData:InsertServerTriggerQueue(ChallengeRogueTeamConst.SERVER_TRIGGER_TYPE.BUFF_CNT_EFFECT, 2, arg_62_0)
	end
end

function var_0_0.TriggerWorldLineWindow(arg_63_0)
	JumpTools.OpenPageByJump("challengeRogueTeamWorldLine")

	return true
end

function var_0_0.TriggerMapSwitchWindow(arg_64_0)
	JumpTools.OpenPageByJump("challengeRogueTeamMapSwitchEffect")

	return true
end

function var_0_0.TriggerMapNodeChanged(arg_65_0)
	ChallengeRogueTeamData:RemoveServerTriggerQueue()
	ChallengeRogueTeamAction.RemovePopWindowCnt()
	manager.notify:Invoke(CHALLENGE_ROGUE_TEAM_UPDATE_WINDOW)

	return true
end

function var_0_0.PopOperateWindowProcessSystem()
	if ChallengeRogueTeamTools.HasNewShopPopWindow() then
		var_0_0.TriggerPopShopWindow()

		return true
	elseif ChallengeRogueTeamTools.HasNewEventPopWindow() then
		var_0_0.TriggerPopEventWindow()

		return true
	else
		return var_0_0.TriggerBattle()
	end
end

function var_0_0.TriggerPopShopWindow()
	local var_67_0 = ChallengeRogueTeamData:GetShopData()

	if ChallengeRogueTeamTools.HasNewShopPopWindow() then
		JumpTools.OpenPageByJump("/challengeRogueTeamShop")
	end
end

function var_0_0.TriggerPopEventWindow()
	if ChallengeRogueTeamData:EventGetCurrentID() ~= 0 then
		local var_68_0 = ChallengeRogueTeamData:EventGetCurrentID()
		local var_68_1, var_68_2 = ChallengeRogueTeamData:UIGetSelectEventOption()

		if var_68_1 == var_68_0 and var_68_2 ~= nil then
			local var_68_3 = ChallengeRogueTeamTools.GetRogueTeamEventStageID(var_68_2)

			if var_68_3 ~= 0 then
				var_0_0.GotoRogueTeamEventReserve(var_68_3)

				return
			end
		end

		JumpTools.OpenPageByJump("/challengeRogueTeamEvent")
	else
		ChallengeRogueTeamData:UISetSelectEventOption()
	end
end

function var_0_0.TriggerBattle()
	local var_69_0 = ChallengeRogueTeamData:PathGetSelectedNodeID()

	if var_69_0 == 0 then
		return false
	end

	local var_69_1 = ChallengeRogueTeamData:PathGetNodeData(var_69_0)

	if not var_69_1 or var_69_1.state ~= ChallengeRogueTeamConst.NODE_STATE.UNCLEAN then
		return false
	end

	if ChallengeRogueTeamTools.IsBattleNode(var_69_1.nodeType) and var_69_1.param ~= 0 then
		var_0_0.GotoRogueTeamReserve(var_69_0, var_69_1.param)

		return true
	end

	return false
end

function var_0_0.TriggerPopWorldLineWindow()
	JumpTools.OpenPageByJump("challengeRogueTeamWorldLine")
end

function var_0_0.GotoRogueTeamEventReserve(arg_71_0, arg_71_1)
	if arg_71_0 ~= 0 then
		manager.rogueTeamMechanismBar:HideBar()
		manager.rogueTeamInGameInfoBox:HideBox()

		local var_71_0 = ChallengeRogueTeamData:PathGetSelectedNodeID()

		var_0_0.GotoRogueTeamReserve(var_71_0, arg_71_0, arg_71_1)
	end
end

function var_0_0.GotoRogueTeamReserve(arg_72_0, arg_72_1, arg_72_2)
	local var_72_0 = ReserveParams.New(ReserveConst.RESERVE_TYPE.CHALLENGE_ROGUE_TEAM, 0, 1, {
		stageType = BattleConst.STAGE_TYPE_NEW.CHALLENGE_ROGUE_TEAM
	})

	gameContext:Go("/challengeRogueTeamSectionSelectHero", {
		exit2Entrace = true,
		sectionType = BattleConst.STAGE_TYPE_NEW.CHALLENGE_ROGUE_TEAM,
		heroDataType = HeroConst.HERO_DATA_TYPE.CHALLENGEROUGETEAM,
		reserveParams = var_72_0,
		section = arg_72_1,
		nodeID = arg_72_0
	}, arg_72_2)
end

function var_0_0.CheckNeedMapSwitchEffect()
	if ChallengeRogueTeamTools.IsClearMapFloor() and ChallengeRogueTeamTools.HasMapSwitchEffect() == false then
		ChallengeRogueTeamData:AddServerTriggerQueue(ChallengeRogueTeamConst.SERVER_TRIGGER_TYPE.MAP_SWITCH)
	end
end

function var_0_0.UnLockSkill(arg_74_0, arg_74_1)
	manager.net:SendWithLoadingNew(88300, {
		template_id = arg_74_0,
		tree_id = arg_74_1
	}, 88301, function(arg_75_0)
		if isSuccess(arg_75_0.result) then
			ChallengeRogueTeamData:UnLockSkill(arg_74_0, arg_74_1)
		else
			ShowTips(arg_75_0.result)
		end
	end)
end

function var_0_0.ClickItemAffix(arg_76_0, arg_76_1, arg_76_2)
	if arg_76_0 == "terminology" then
		local var_76_0 = {}

		for iter_76_0 in string.gmatch(arg_76_1, "%d+") do
			table.insert(var_76_0, tonumber(iter_76_0))
		end

		local var_76_1 = {}
		local var_76_2 = {}

		for iter_76_1, iter_76_2 in ipairs(var_76_0) do
			local var_76_3 = TerminologyCfg[iter_76_2]

			table.insert(var_76_1, var_76_3.word)
			table.insert(var_76_2, var_76_3.desc)
		end

		JumpTools.OpenPageByJump("gameHelpMulti", {
			titleList = var_76_1,
			contentList = var_76_2
		})
	elseif arg_76_2 then
		arg_76_2()
	end
end

return var_0_0
