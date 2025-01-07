local var_0_0 = class("ChallengeRogueTeamOverView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/System/Activity_Roulike/RogueTeamStatisticsUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiPop.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:BindCfgUI()
	arg_3_0:AddListeners()

	arg_3_0.contentController_ = arg_3_0.controller_:GetController("content")
	arg_3_0.btnController_ = arg_3_0.controller_:GetController("but")
	arg_3_0.btnCntController_ = arg_3_0.controller_:GetController("btnCnt")
	arg_3_0.bgController_ = arg_3_0.controller_:GetController("bgstate")

	arg_3_0.btnController_:SetSelectedState("on")

	arg_3_0.onSummaryAnimatorOverHandler_ = handler(arg_3_0, arg_3_0.OnSummaryAnimatorOver)
end

function var_0_0.OnEnter(arg_4_0)
	manager.notify:RegistListener(CHALLENGE_ROGUE_TEAM_STATISTICS_SUMMARY_ANIMATOR_OVER, arg_4_0.onSummaryAnimatorOverHandler_)

	arg_4_0.contentIndex_ = ChallengeRogueTeamConst.OVER_STATISTICS_CONTENT_TYPE.SUMMARY

	arg_4_0:RefreshUI()
end

function var_0_0.OnExit(arg_5_0)
	manager.notify:RemoveListener(CHALLENGE_ROGUE_TEAM_STATISTICS_SUMMARY_ANIMATOR_OVER, arg_5_0.onSummaryAnimatorOverHandler_)
	ChallengeRogueTeamData:ExitPlaying()
	manager.notify:Invoke(CHALLENGE_ROGUE_TEAM_EXIT)
end

function var_0_0.Dispose(arg_6_0)
	arg_6_0.onSummaryAnimatorOverHandler_ = nil

	if arg_6_0.summaryView_ then
		arg_6_0.summaryView_:Dispose()

		arg_6_0.summaryView_ = nil
	end

	if arg_6_0.statisticsView_ then
		arg_6_0.statisticsView_:Dispose()

		arg_6_0.statisticsView_ = nil
	end

	if arg_6_0.newRelicView_ then
		arg_6_0.newRelicView_:Dispose()

		arg_6_0.newRelicView_ = nil
	end

	var_0_0.super.Dispose(arg_6_0)
end

function var_0_0.AddListeners(arg_7_0)
	arg_7_0:AddBtnListener(arg_7_0.closeBtn_, nil, function()
		if arg_7_0.contentIndex_ == ChallengeRogueTeamConst.OVER_STATISTICS_CONTENT_TYPE.RELIC then
			ChallengeRogueTeamAction.GotoRogueTeamEntrace()
		else
			arg_7_0.summaryView_:StopAnimator()
		end
	end)
	arg_7_0:AddBtnListener(arg_7_0.btn1_, nil, function()
		if arg_7_0.contentIndex_ == ChallengeRogueTeamConst.OVER_STATISTICS_CONTENT_TYPE.POINT then
			arg_7_0.contentIndex_ = ChallengeRogueTeamConst.OVER_STATISTICS_CONTENT_TYPE.SUMMARY

			arg_7_0:RefreshUI()
		end
	end)
	arg_7_0:AddBtnListener(arg_7_0.btn2_, nil, function()
		if arg_7_0.contentIndex_ == ChallengeRogueTeamConst.OVER_STATISTICS_CONTENT_TYPE.SUMMARY then
			arg_7_0.contentIndex_ = ChallengeRogueTeamConst.OVER_STATISTICS_CONTENT_TYPE.POINT

			arg_7_0:RefreshUI()
		else
			local var_10_0 = ChallengeRogueTeamData:GetOverStaticUnlockRelicDataList()

			if var_10_0 and not table.isEmpty(var_10_0) then
				arg_7_0.contentIndex_ = ChallengeRogueTeamConst.OVER_STATISTICS_CONTENT_TYPE.RELIC

				arg_7_0:RefreshUI()
			else
				ChallengeRogueTeamAction.GotoRogueTeamEntrace()
			end
		end
	end)
end

function var_0_0.RefreshUI(arg_11_0)
	arg_11_0.contentController_:SetSelectedState(arg_11_0.contentIndex_)

	if arg_11_0.contentIndex_ == ChallengeRogueTeamConst.OVER_STATISTICS_CONTENT_TYPE.SUMMARY then
		if arg_11_0.summaryView_ == nil then
			arg_11_0.summaryView_ = ChallengeRogueTeamOverStatisticsSummaryView.New(arg_11_0.summaryGo_)
		end

		arg_11_0:RefreshSummaryBtn()
	elseif arg_11_0.contentIndex_ == ChallengeRogueTeamConst.OVER_STATISTICS_CONTENT_TYPE.POINT then
		if arg_11_0.statisticsView_ == nil then
			arg_11_0.statisticsView_ = ChallengeRogueTeamOverStatisticsPointView.New(arg_11_0.pointGo_)
		end

		arg_11_0.btnCntController_:SetSelectedState("true")

		arg_11_0.btnText1_.text = GetTips("ROGUE_TEAM_PREV_PAGE")
		arg_11_0.btnText2_.text = GetTips("ROGUE_TEAM_SURE")
	elseif arg_11_0.newRelicView_ == nil then
		arg_11_0.newRelicView_ = ChallengeRogueTeamOverStatisticsNewRelicView.New(arg_11_0.newRelicGo_)

		arg_11_0.btnController_:SetSelectedState("off")
	end

	if ChallengeRogueTeamData:PathGetFloorState() == ChallengeRogueTeamConst.FLOOR_STATE.OVER then
		arg_11_0.bgController_:SetSelectedState("state1")
	else
		arg_11_0.bgController_:SetSelectedState("state0")
	end
end

function var_0_0.RefreshSummaryBtn(arg_12_0)
	if arg_12_0.summaryView_:GetFirstPalyFlag() == true then
		arg_12_0.btnCntController_:SetSelectedState("allHide")
	else
		arg_12_0.btnCntController_:SetSelectedState("false")
	end

	arg_12_0.btnText2_.text = GetTips("ROGUE_TEAM_NEXT_PAGE")
end

function var_0_0.OnSummaryAnimatorOver(arg_13_0)
	arg_13_0:RefreshSummaryBtn()
end

function var_0_0.Cacheable(arg_14_0)
	return false
end

return var_0_0
