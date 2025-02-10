local var_0_0 = class("AdvanceTestRankView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "UI/AdvancetestingUI/AtestingRankUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0.rankTypeConst_ = AdvanceTestData:GetRankTypeConst()

	arg_3_0:InitUI()

	arg_3_0.subTypeToggleController_ = arg_3_0.conExCollection_:GetController("subType")
	arg_3_0.tabController_ = arg_3_0.toggleConEx:GetController("tab")
	arg_3_0.tabNumController_ = arg_3_0.toggleConEx:GetController("num")
	arg_3_0.itemGo_ = {
		arg_3_0.m_easyBtn.gameObject,
		arg_3_0.m_nomalBtn.gameObject,
		arg_3_0.m_hardBtn.gameObject
	}
	arg_3_0.clickIndex_ = {}
	arg_3_0.commonPortrait_ = CommonHeadPortrait.New(arg_3_0.headItem_)

	arg_3_0:AddListeners()
end

function var_0_0.InitUI(arg_4_0)
	arg_4_0:BindCfgUI()

	arg_4_0.RefreshUIHandler_ = handler(arg_4_0, arg_4_0.Refresh)
	arg_4_0.list_ = LuaList.New(handler(arg_4_0, arg_4_0.IndexItem), arg_4_0.m_list, AdvanceTestRankItem)
end

function var_0_0.AddListeners(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.m_allBtn, nil, function()
		if AdvanceTestData:GetCurRankType() ~= arg_5_0.rankTypeConst_.ALL then
			RankAction.QueryActivityRank(arg_5_0.activityID, arg_5_0.stageType)
		end

		AdvanceTestData:SetCurRankType(arg_5_0.rankTypeConst_.ALL)
		arg_5_0:Refresh()
	end)
	arg_5_0:AddBtnListener(arg_5_0.m_guildBtn, nil, function()
		if AdvanceTestData:GetCurRankType() ~= arg_5_0.rankTypeConst_.GUILD then
			RankAction.QueryGuildActivityRank(arg_5_0.activityID, arg_5_0.stageType)
		end

		AdvanceTestData:SetCurRankType(arg_5_0.rankTypeConst_.GUILD)
	end)
	arg_5_0:AddBtnListener(arg_5_0.m_rewardBtn, nil, function()
		JumpTools.OpenPageByJump("advanceTestReward", {
			activityID = arg_5_0.activityID
		})
	end)
	arg_5_0:AddBtnListener(arg_5_0.m_easyBtn, nil, function()
		arg_5_0:OnClickSubType(1)
	end)
	arg_5_0:AddBtnListener(arg_5_0.m_nomalBtn, nil, function()
		arg_5_0:OnClickSubType(2)
	end)
	arg_5_0:AddBtnListener(arg_5_0.m_hardBtn, nil, function()
		arg_5_0:OnClickSubType(3)
	end)
end

function var_0_0.OnClickSubType(arg_12_0, arg_12_1)
	local var_12_0 = AdvanceTestData:GetCurRankType()
	local var_12_1 = arg_12_0.clickIndex_[arg_12_1]

	if arg_12_0.index ~= var_12_1 then
		if var_12_0 == arg_12_0.rankTypeConst_.ALL then
			RankAction.QueryActivityRank(arg_12_0.activityID, arg_12_1)
		elseif var_12_0 == arg_12_0.rankTypeConst_.GUILD then
			RankAction.QueryGuildActivityRank(arg_12_0.activityID, arg_12_1)
		end
	end

	arg_12_0.index = var_12_1
	arg_12_0.stageType = arg_12_1

	arg_12_0:Refresh()
end

function var_0_0.OnTop(arg_13_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR,
		INFO_BAR
	})
end

function var_0_0.OnEnter(arg_14_0)
	arg_14_0.activityID = arg_14_0.params_.activityID

	local var_14_0 = ActivityData:GetActivityData(arg_14_0.activityID)

	arg_14_0.startTime_ = var_14_0.startTime
	arg_14_0.stopTime_ = var_14_0.stopTime

	local var_14_1 = AdvanceTestCfg.get_id_list_by_activity_id[AdvanceTestData:GetCacheActivityID()]

	for iter_14_0 = 1, 3 do
		SetActive(arg_14_0.itemGo_[iter_14_0], false)
	end

	for iter_14_1 = 1, 3 do
		if var_14_1[iter_14_1] then
			local var_14_2 = AdvanceTestCfg[var_14_1[iter_14_1]]

			SetActive(arg_14_0.itemGo_[var_14_2.stage_type], true)

			arg_14_0.clickIndex_[var_14_2.stage_type] = iter_14_1
		end
	end

	arg_14_0.stageType = arg_14_0.params_.stageType
	arg_14_0.index = arg_14_0.clickIndex_[arg_14_0.params_.stageType]

	manager.notify:RegistListener(ADVANCE_TEST_RANK_UPGRADE, arg_14_0.RefreshUIHandler_)
	RankAction.QueryActivityRank(arg_14_0.activityID, arg_14_0.stageType)
	arg_14_0:RefreshGuildRankGo()
	arg_14_0:AddTimer()
end

function var_0_0.OnExit(arg_15_0)
	arg_15_0.pos_ = arg_15_0.list_:GetScrolledPosition()

	arg_15_0:StopTimer()
	manager.windowBar:HideBar()
	manager.notify:RemoveListener(ADVANCE_TEST_RANK_UPGRADE, arg_15_0.RefreshUIHandler_)
	AdvanceTestData:SetCurRankType(arg_15_0.rankTypeConst_.ALL)
end

function var_0_0.Refresh(arg_16_0)
	if AdvanceTestData:GetCurRankType() == arg_16_0.rankTypeConst_.ALL then
		local var_16_0 = RankData:GetActivityRank(arg_16_0.activityID, arg_16_0.stageType)

		arg_16_0.rankList = var_16_0 and var_16_0.rankList or {}

		if var_16_0 then
			local var_16_1, var_16_2 = var_16_0:GetCurRankDes()

			arg_16_0.m_rank.text = var_16_1
			arg_16_0.m_score.text = var_16_2
		else
			arg_16_0.m_rank.text = ""
			arg_16_0.m_score.text = ""
		end

		SetActive(arg_16_0.m_rewardBtn, true)
		arg_16_0.tabController_:SetSelectedState("all")
	else
		local var_16_3 = RankData:GetGuildActivityRank(arg_16_0.activityID, arg_16_0.stageType)

		arg_16_0.rankList = var_16_3 and var_16_3.rankList or {}

		if var_16_3 then
			local var_16_4, var_16_5 = var_16_3:GetCurRankDes()

			arg_16_0.m_rank.text = var_16_4
			arg_16_0.m_score.text = var_16_5
		else
			arg_16_0.m_rank.text = ""
			arg_16_0.m_score.text = ""
		end

		SetActive(arg_16_0.m_rewardBtn, false)
		arg_16_0.tabController_:SetSelectedState("club")
	end

	arg_16_0.list_:StartScroll(#arg_16_0.rankList)

	if arg_16_0.pos_ then
		arg_16_0.list_:SetScrolledPosition(arg_16_0.pos_)
	end

	local var_16_6 = PlayerData:GetPlayerInfo()

	arg_16_0.commonPortrait_:RenderHead(var_16_6 and var_16_6.portrait)
	arg_16_0.commonPortrait_:RenderFrame(var_16_6.icon_frame)
	arg_16_0.subTypeToggleController_:SetSelectedState(arg_16_0.stageType)
end

function var_0_0.IndexItem(arg_17_0, arg_17_1, arg_17_2)
	local var_17_0 = arg_17_0.rankList[arg_17_1]

	arg_17_2:Refresh(var_17_0)
end

function var_0_0.Dispose(arg_18_0)
	arg_18_0.commonPortrait_:Dispose()

	if arg_18_0.list_ then
		arg_18_0.list_:Dispose()

		arg_18_0.list_ = nil
	end

	var_0_0.super.Dispose(arg_18_0)
end

function var_0_0.AddTimer(arg_19_0)
	arg_19_0:StopTimer()

	arg_19_0.m_leftTimeText.text = GetTips("REMAINING_TIME") .. manager.time:GetLostTimeStr2(arg_19_0.stopTime_, nil, true)
	arg_19_0.timer_ = Timer.New(function()
		if manager.time:GetServerTime() > arg_19_0.stopTime_ then
			return
		end

		arg_19_0.m_leftTimeText.text = GetTips("REMAINING_TIME") .. manager.time:GetLostTimeStr2(arg_19_0.stopTime_, nil, true)
	end, 1, -1)

	arg_19_0.timer_:Start()
end

function var_0_0.StopTimer(arg_21_0)
	if arg_21_0.timer_ then
		arg_21_0.timer_:Stop()

		arg_21_0.timer_ = nil
	end
end

function var_0_0.RefreshGuildRankGo(arg_22_0)
	if GuildData:GetGuildInfo().id == nil then
		arg_22_0.tabNumController_:SetSelectedState("01")
	else
		arg_22_0.tabNumController_:SetSelectedState("02")
	end
end

function var_0_0.OnRankUpdate(arg_23_0)
	arg_23_0:Refresh()
end

return var_0_0
