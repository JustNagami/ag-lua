local var_0_0 = class("ChallengeRogueTeamOverStatisticsSummaryView", ReduxView)

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_1.transform

	arg_1_0:BindCfgUI()
	arg_1_0:AddListeners()

	arg_1_0.firstPlayFlag_ = true
	arg_1_0.viewPortHeight_ = arg_1_0.viewPortTf_.rect.height
	arg_1_0.layoutSpace_ = arg_1_0.layout_.spacing

	arg_1_0:RefreshUI()
end

function var_0_0.Dispose(arg_2_0)
	arg_2_0.suitSkillView_:Dispose()

	arg_2_0.suitSkillView_ = nil

	arg_2_0.relicView_:Dispose()

	arg_2_0.relicView_ = nil

	var_0_0.super.Dispose(arg_2_0)
end

function var_0_0.AddListeners(arg_3_0)
	return
end

function var_0_0.RefreshUI(arg_4_0)
	arg_4_0.suitSkillView_ = ChallengeRogueTeamOverStatisticsSummarySuitSkillView.New(arg_4_0.suitSkillGo_)
	arg_4_0.relicView_ = ChallengeRogueTeamOverStatisticsSummaryRelicView.New(arg_4_0.relicGo_)
	arg_4_0.teamView_ = ChallengeRogueTeamOverStatisticsSummaryTeamView.New(arg_4_0.teamGo_)

	arg_4_0.suitSkillView_:Show(false)
	arg_4_0.relicView_:Show(false)
	arg_4_0.teamView_:Show(false)

	local var_4_0 = ChallengeRogueTeamData:GetCacheTemplateID()

	arg_4_0.timeText_.text = manager.time:DescCdTime2(ChallengeRogueTeamData:GetTotalTime())

	local var_4_1 = ChallengeRogueTeamData:PlotGetEndingID()
	local var_4_2
	local var_4_3 = ChallengeRogueTeamData:GetCacheTemplateID()
	local var_4_4 = RogueTeamCfg[var_4_3].ending_temp

	if not ChallengeRogueTeamData:GetGuideStatisticsFlag() then
		local var_4_5 = RogueTeamEndingCfg.get_id_list_by_temp_id_ending_state[var_4_4][99][1]

		var_4_2 = RogueTeamEndingCfg[var_4_5]
	elseif ChallengeRogueTeamData:PathGetFloorState() == ChallengeRogueTeamConst.FLOOR_STATE.FAIL or var_4_1 == 0 then
		local var_4_6 = RogueTeamEndingCfg.get_id_list_by_temp_id_ending_state[var_4_4][0][1]

		var_4_2 = RogueTeamEndingCfg[var_4_6]
	else
		var_4_2 = RogueTeamEndingCfg[var_4_1]
	end

	arg_4_0.floorText_.text = ChallengeRogueTeamTools.GetFloorName()
	arg_4_0.titleText_.text = var_4_2.story_name
	arg_4_0.descText_.text = var_4_2.story_desc
	arg_4_0.totalHeight_ = 0

	arg_4_0:PlayDescAnimator()
end

function var_0_0.StopAnimator(arg_5_0)
	if arg_5_0.firstPlayFlag_ == false then
		return
	end

	arg_5_0.firstPlayFlag_ = false
	arg_5_0.scrollView_.enabled = true

	arg_5_0:StopTimer()
	arg_5_0:StopMoveTimer()
	arg_5_0.suitSkillView_:Show(true)
	arg_5_0.relicView_:Show(true)
	arg_5_0.teamView_:Show(true)

	arg_5_0.scrollView_.normalizedPosition = Vector2(0, 0)

	manager.notify:Invoke(CHALLENGE_ROGUE_TEAM_STATISTICS_SUMMARY_ANIMATOR_OVER)
end

function var_0_0.GetFirstPalyFlag(arg_6_0)
	return arg_6_0.firstPlayFlag_
end

function var_0_0.PlayDescAnimator(arg_7_0)
	arg_7_0.scrollView_.enabled = false

	arg_7_0:PauseAnimator(GameSetting.rogue_team_statistics_mode_pause_time.value[1], function()
		local var_8_0 = arg_7_0.suitSkillView_:GetHeight()

		arg_7_0.totalHeight_ = var_8_0

		arg_7_0:PlaySuitSkillAnimator()
	end)
end

function var_0_0.PlaySuitSkillAnimator(arg_9_0)
	arg_9_0.suitSkillView_:Show(true)
	arg_9_0:PauseAnimator(GameSetting.rogue_team_statistics_mode_pause_time.value[1], function()
		local var_10_0 = arg_9_0.suitSkillView_:GetHeight()
		local var_10_1 = arg_9_0.relicView_:GetHeight()

		if var_10_1 >= arg_9_0.viewPortHeight_ then
			arg_9_0:MoveContent(var_10_0, function()
				arg_9_0:PlayRelicAnimator()
			end)
		else
			arg_9_0.totalHeight_ = arg_9_0.totalHeight_ + arg_9_0.layoutSpace_ + var_10_1

			if arg_9_0.totalHeight_ > arg_9_0.viewPortHeight_ then
				arg_9_0:MoveContent(arg_9_0.totalHeight_ - arg_9_0.viewPortHeight_, function()
					arg_9_0:PlayRelicAnimator()
				end)
			else
				arg_9_0:PlayRelicAnimator()
			end
		end
	end)
end

function var_0_0.PlayRelicAnimator(arg_13_0, arg_13_1)
	arg_13_0.relicView_:Show(true)
	arg_13_0:PauseAnimator(GameSetting.rogue_team_statistics_mode_pause_time.value[1], function()
		local var_14_0 = arg_13_0.suitSkillView_:GetHeight()
		local var_14_1 = arg_13_0.relicView_:GetHeight()
		local var_14_2 = arg_13_0.teamView_:GetHeight()

		if var_14_2 >= arg_13_0.viewPortHeight_ then
			arg_13_0:MoveContent(arg_13_0.totalHeight_ + arg_13_0.layoutSpace_ - arg_13_0.viewPortHeight_, function()
				arg_13_0:PlayTeamAnimator()
			end)
		else
			arg_13_0.totalHeight_ = arg_13_0.totalHeight_ + arg_13_0.layoutSpace_ + var_14_2

			if arg_13_0.totalHeight_ > arg_13_0.viewPortHeight_ then
				arg_13_0:MoveContent(arg_13_0.totalHeight_ - arg_13_0.viewPortHeight_, function()
					arg_13_0:PlayTeamAnimator()
				end)
			else
				arg_13_0:PlayTeamAnimator()
			end
		end
	end)
end

function var_0_0.PlayTeamAnimator(arg_17_0)
	arg_17_0.teamView_:Show(true)
	arg_17_0:PauseAnimator(GameSetting.rogue_team_statistics_mode_pause_time.value[1], function()
		local var_18_0 = arg_17_0.teamView_:GetHeight()

		arg_17_0:MoveContent(arg_17_0.totalHeight_ - arg_17_0.viewPortHeight_, function()
			arg_17_0:StopAnimator()
		end)
	end)
end

function var_0_0.MoveContent(arg_20_0, arg_20_1, arg_20_2)
	arg_20_0:StopMoveTimer()

	arg_20_0.moveTimer_ = FrameTimer.New(function()
		local var_21_0 = arg_20_0.contentTf_.localPosition

		var_21_0.y = var_21_0.y + GameSetting.rogue_team_statistics_scroll_y_value.value[1]

		if var_21_0.y >= arg_20_1 then
			var_21_0.y = arg_20_1
			arg_20_0.contentTf_.localPosition = var_21_0

			arg_20_0:StopMoveTimer()
			arg_20_2()
		end

		arg_20_0.contentTf_.localPosition = var_21_0
	end, 1, -1)

	arg_20_0.moveTimer_:Start()
end

function var_0_0.StopMoveTimer(arg_22_0)
	if arg_22_0.moveTimer_ then
		arg_22_0.moveTimer_:Stop()

		arg_22_0.moveTimer_ = nil
	end
end

function var_0_0.PauseAnimator(arg_23_0, arg_23_1, arg_23_2)
	arg_23_0.timer_ = Timer.New(function()
		arg_23_0:StopTimer()
		arg_23_2()
	end, arg_23_1, 1)

	arg_23_0.timer_:Start()
end

function var_0_0.StopTimer(arg_25_0)
	if arg_25_0.timer_ then
		arg_25_0.timer_:Stop()

		arg_25_0.timer_ = nil
	end
end

return var_0_0
