local var_0_0 = class("ChallengeRogueTeamEntraceView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/System/Activity_Roulike/RogueMainUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:BindCfgUI()
	arg_3_0:AddListeners()

	arg_3_0.pointBtnView_ = ChallengeRogueTeamPointBtn.New(arg_3_0.pointGo_)
	arg_3_0.exitPlayingView_ = ChallengeRogueTeamExitPlayingPanel.New(arg_3_0.exitPlayingGo_)
	arg_3_0.exitPlayingController_ = arg_3_0.controllerEx_:GetController("file")
	arg_3_0.exitPlayController_ = arg_3_0.exitPlayControllerEx_:GetController("termination")
	arg_3_0.taskController_ = arg_3_0.taskControllerEx_:GetController("taskBtn")
	arg_3_0.illustratedController_ = arg_3_0.illustratedControllerEx_:GetController("IllustratedBtn")
	arg_3_0.skillController_ = arg_3_0.skillControllerEx_:GetController("skillBtn")
	arg_3_0.pointController_ = arg_3_0.pointControllerEx_:GetController("pointBtn")
	arg_3_0.onExitPlayingHandler_ = handler(arg_3_0, arg_3_0.OnExitPlaying)
end

function var_0_0.OnEnter(arg_4_0)
	ChallengeRogueTeamAction.ResetPopWindowCnt()
	ChallengeRogueTeamData:UISetEventIDAnimator()

	arg_4_0.templateID_ = arg_4_0.params_.templateID

	ChallengeRogueTeamData:SetCacheTemplateID(arg_4_0.templateID_)
	arg_4_0.pointBtnView_:OnEnter(ChallengeRogueTeamData:GetScoreActivityIDByTemple(arg_4_0.templateID_))
	arg_4_0:RefreshUI()
	manager.notify:RegistListener(CHALLENGE_ROGUE_TEAM_EXIT, arg_4_0.onExitPlayingHandler_)

	local var_4_0 = string.format("%s_%s", RedPointConst.ACTIVITY_TASK, ChallengeRogueTeamTools.GetTaskActivityID(arg_4_0.templateID_))

	manager.redPoint:bindUIandKey(arg_4_0.taskBtn_.transform, var_4_0)

	local var_4_1 = string.format("%s_%s", RedPointConst.ACTIVITY_POINT_REWARD, ChallengeRogueTeamTools.GetPointActivityID(arg_4_0.templateID_))

	manager.redPoint:bindUIandKey(arg_4_0.scoreBtn_.transform, var_4_1)

	local var_4_2 = string.format("%s_%s", RedPointConst.CHALLENGE_ROGUE_TEAM_ILLUSTRATED, arg_4_0.templateID_)

	manager.redPoint:bindUIandKey(arg_4_0.illustratedBtn_.transform, var_4_2)
	arg_4_0:RefreshBGM()
end

function var_0_0.OnEnterOver(arg_5_0)
	local var_5_0 = RogueTeamCfg[arg_5_0.templateID_].story_id

	if manager.story:IsStoryPlayed(var_5_0) then
		return
	end

	manager.story:StartStoryById(var_5_0, function()
		return
	end)
end

function var_0_0.OnExit(arg_7_0)
	local var_7_0 = string.format("%s_%s", RedPointConst.ACTIVITY_TASK, ChallengeRogueTeamTools.GetTaskActivityID(arg_7_0.templateID_))

	manager.redPoint:unbindUIandKey(arg_7_0.taskBtn_.transform, var_7_0)

	local var_7_1 = string.format("%s_%s", RedPointConst.ACTIVITY_POINT_REWARD, ChallengeRogueTeamTools.GetPointActivityID(arg_7_0.templateID_))

	manager.redPoint:unbindUIandKey(arg_7_0.scoreBtn_.transform, var_7_1)

	local var_7_2 = string.format("%s_%s", RedPointConst.CHALLENGE_ROGUE_TEAM_ILLUSTRATED, arg_7_0.templateID_)

	manager.redPoint:unbindUIandKey(arg_7_0.illustratedBtn_.transform, var_7_2)
	manager.windowBar:HideBar()
	manager.notify:RemoveListener(CHALLENGE_ROGUE_TEAM_EXIT, arg_7_0.onExitPlayingHandler_)
end

function var_0_0.Dispose(arg_8_0)
	arg_8_0.onExitPlayingHandler_ = nil

	arg_8_0.pointBtnView_:Dispose()

	arg_8_0.pointBtnView_ = nil

	arg_8_0.exitPlayingView_:Dispose()

	arg_8_0.exitPlayingView_ = nil

	var_0_0.super.Dispose(arg_8_0)
end

function var_0_0.AddListeners(arg_9_0)
	arg_9_0:AddBtnListener(arg_9_0.taskBtn_, nil, function()
		if not ChallengeRogueTeamData:IsFinishGuide() then
			ShowTips("ROGUE_TEAM_FINISH_GUIDE_THEN_OPEN")

			return
		end

		local var_10_0 = ChallengeRogueTeamData:GetCacheTemplateID()

		JumpTools.OpenPageByJump("challengeRogueTeamRewardPop", {
			activityId = ChallengeRogueTeamData:GetTaskActivityIDByTemple(var_10_0)
		})
	end)
	arg_9_0:AddBtnListener(arg_9_0.technologyTreeBtn_, nil, function()
		if not ChallengeRogueTeamData:IsFinishGuide() then
			ShowTips("ROGUE_TEAM_FINISH_GUIDE_THEN_OPEN")

			return
		end

		JumpTools.OpenPageByJump("/challengeRogueTeamSkillTree")
	end)
	arg_9_0:AddBtnListener(arg_9_0.illustratedBtn_, nil, function()
		if not ChallengeRogueTeamData:IsFinishGuide() then
			ShowTips("ROGUE_TEAM_FINISH_GUIDE_THEN_OPEN")

			return
		end

		JumpTools.OpenPageByJump("/challengeRogueTeamIllustratedEntrace", {
			templateID = ChallengeRogueTeamData:GetCacheTemplateID()
		})
	end)
	arg_9_0:AddBtnListener(arg_9_0.scoreBtn_, nil, function()
		if not ChallengeRogueTeamData:IsFinishGuide() then
			ShowTips("ROGUE_TEAM_FINISH_GUIDE_THEN_OPEN")

			return
		end

		local var_13_0 = ChallengeRogueTeamData:GetCacheTemplateID()

		JumpTools.OpenPageByJump("challengeRogueTeamScorePop", {
			activityId = ChallengeRogueTeamData:GetScoreActivityIDByTemple(var_13_0)
		})
	end)
	arg_9_0:AddBtnListener(arg_9_0.startBtn_, nil, function()
		local var_14_0 = ChallengeRogueTeamData:GetCacheTemplateID()

		ChallengeRogueTeamData:ModifyAllHeroInfo(var_14_0)
		ChallengeRogueTeamAction.GotoRogueTeamSystem()
	end)
end

function var_0_0.RefreshUI(arg_15_0)
	arg_15_0.pointBtnView_:RefreshUI()
	arg_15_0.exitPlayingView_:RefreshUI()
	arg_15_0:OnExitPlaying()
end

function var_0_0.OnExitPlaying(arg_16_0)
	local var_16_0 = ChallengeRogueTeamData:GetCacheTemplateID()

	if ChallengeRogueTeamData:GetSelectDifficultyID(var_16_0) == 0 then
		arg_16_0.exitPlayingController_:SetSelectedState("close")

		arg_16_0.btnText_.text = GetTips("ROGUE_TEAM_START")
	else
		arg_16_0.exitPlayingController_:SetSelectedState("open")

		arg_16_0.btnText_.text = GetTips("ROGUE_TEAM_CONTINUE")
	end

	if not ChallengeRogueTeamData:IsFinishGuide() then
		arg_16_0.exitPlayController_:SetSelectedState("ash")
		arg_16_0.taskController_:SetSelectedState("ash")
		arg_16_0.illustratedController_:SetSelectedState("ash")
		arg_16_0.skillController_:SetSelectedState("ash")
		arg_16_0.pointController_:SetSelectedState("ash")
	else
		arg_16_0.exitPlayController_:SetSelectedState("normal")
		arg_16_0.taskController_:SetSelectedState("normal")
		arg_16_0.illustratedController_:SetSelectedState("normal")
		arg_16_0.skillController_:SetSelectedState("normal")
		arg_16_0.pointController_:SetSelectedState("normal")
	end
end

function var_0_0.OnTop(arg_17_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR,
		INFO_BAR
	})
	manager.windowBar:SetGameHelpKey("ROGUE_TEAM_DESC")
	arg_17_0:RefreshUI()
end

function var_0_0.RefreshBGM(arg_18_0)
	ChallengeRogueTeamTools.PlayAudio("main_audio_id")
end

return var_0_0
