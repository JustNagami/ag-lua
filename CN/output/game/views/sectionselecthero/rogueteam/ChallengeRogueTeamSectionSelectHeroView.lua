local var_0_0 = import("game.views.sectionSelectHero.NewSectionSelectHeroBaseView")
local var_0_1 = class("ChallengeRogueTeamSectionSelectHeroView", var_0_0)

function var_0_1.Init(arg_1_0)
	var_0_1.super.Init(arg_1_0)

	arg_1_0.conditionBtnController_ = arg_1_0.conditionController_:GetController("completeState")
	arg_1_0.rogueTeamSureBtnView_ = ChallengeRogueTeamButton.New(arg_1_0.startBtn_.gameObject)
end

function var_0_1.UIName(arg_2_0)
	return "Widget/System/Formation/ChallengeRogueTeam/ChallengeRogueTeamFormationMainUI"
end

function var_0_1.OnEnter(arg_3_0)
	if arg_3_0.params_.isBack then
		ChallengeRogueTeamAction.OnPlayingState(ChallengeRogueTeamConst.PLAYING_STATE.ENTER, function()
			return
		end)
	end

	arg_3_0.super.OnEnter(arg_3_0)

	arg_3_0.heroModify_ = arg_3_0.params_.heroModify

	local var_3_0 = ChallengeRogueTeamData:GetCacheTemplateID()

	if ChallengeRogueTeamData:GetSelectDifficultyID(var_3_0) == 0 then
		local var_3_1, var_3_2, var_3_3, var_3_4 = arg_3_0.sectionProxy_:GetHeroTeam()

		if var_3_1[1] ~= 0 then
			arg_3_0.rogueTeamSureBtnView_:RefreshBtnState(ChallengeRogueTeamButton.ENABLE_CLICK)
		else
			arg_3_0.rogueTeamSureBtnView_:RefreshBtnState(ChallengeRogueTeamButton.DISENABLE_CLICK)
		end
	else
		arg_3_0.rogueTeamSureBtnView_:RefreshBtnState(ChallengeRogueTeamButton.ENABLE_CLICK)
	end

	arg_3_0.hideEffect_ = getData("challenge_rogue_team", "hide_effect") or false

	arg_3_0.conditionBtnController_:SetSelectedState(tostring(arg_3_0.hideEffect_))
end

function var_0_1.AddListener(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.conditionBtn_, nil, function()
		if arg_5_0.hideEffect_ then
			arg_5_0.hideEffect_ = false
		else
			arg_5_0.hideEffect_ = true
		end

		saveData("challenge_rogue_team", "hide_effect", arg_5_0.hideEffect_)
		arg_5_0.conditionBtnController_:SetSelectedState(tostring(arg_5_0.hideEffect_))
	end)
end

function var_0_1.OnExit(arg_7_0)
	local var_7_0, var_7_1, var_7_2, var_7_3 = arg_7_0.sectionProxy_:GetHeroTeam()

	arg_7_0.super.OnExit(arg_7_0)
end

function var_0_1.RefresgStageInfoActive(arg_8_0)
	return
end

function var_0_1.Dispose(arg_9_0)
	arg_9_0.rogueTeamSureBtnView_:Dispose()

	arg_9_0.rogueTeamSureBtnView_ = nil
	arg_9_0.OnChangeTeamHandler_ = nil

	var_0_1.super.Dispose(arg_9_0)
end

function var_0_1.UpdateBar(arg_10_0)
	arg_10_0.sectionProxy_:UpdateBar()
	manager.windowBar:RegistBackCallBack(function()
		CommonFilterData:ClearFilter(Filter_Root_Define.Hero_Filter_List.filter_id)

		if arg_10_0.params_.exit2Entrace then
			ShowMessageBox({
				title = GetTips("PROMPT"),
				content = GetTips("CHALLENGE_ROGUE_EXIT_GAME"),
				OkCallback = function()
					ChallengeRogueTeamAction.OnPlayingState(ChallengeRogueTeamConst.PLAYING_STATE.EXIT, function()
						ChallengeRogueTeamAction.GotoRogueTeamEntrace()
					end)
				end,
				CancelCallback = function()
					return
				end
			})
		else
			arg_10_0:Back()
		end
	end)
	manager.windowBar:RegistHomeCallBack(function()
		ChallengeRogueTeamAction.OnPlayingState(ChallengeRogueTeamConst.PLAYING_STATE.EXIT, function()
			gameContext:Go("/home", nil, nil, true)
		end)
	end)
end

function var_0_1.StartBattle(arg_17_0)
	local var_17_0 = ChallengeRogueTeamData:GetCacheTemplateID()

	if arg_17_0.heroModify_ then
		arg_17_0:SaveReserveTeam()
		arg_17_0:Back()

		return
	end

	if ChallengeRogueTeamData:GetSelectDifficultyID(var_17_0) == 0 then
		local var_17_1, var_17_2, var_17_3, var_17_4 = arg_17_0.sectionProxy_:GetHeroTeam()

		if var_17_1[3] == 0 then
			ShowMessageBox({
				isTop = true,
				content = GetTips("ROGUE_TEAM_MEMBER_TIPS"),
				OkCallback = function()
					arg_17_0:EnterRogueMain(var_17_0, var_17_1, var_17_4)
				end,
				CancelCallback = function()
					return
				end
			})

			return
		end

		arg_17_0:EnterRogueMain(var_17_0, var_17_1, var_17_4)
	else
		arg_17_0:SaveReserveTeam(function()
			arg_17_0.sectionProxy_:StartBattle()
		end)
		ChallengeRogueTeamData:UISetSelectEventOption()
	end
end

function var_0_1.SaveReserveTeam(arg_21_0, arg_21_1)
	local var_21_0, var_21_1, var_21_2, var_21_3 = arg_21_0.sectionProxy_:GetHeroTeam()

	ReserveTools.SetHeroList(arg_21_0.sectionProxy_:GetReserveParams(), var_21_0, var_21_3)
	ReserveAction.SaveContData(ReserveConst.RESERVE_TYPE.CHALLENGE_ROGUE_TEAM, ReserveTools.GetContID(BattleConst.STAGE_TYPE_NEW.CHALLENGE_ROGUE_TEAM), arg_21_1)
end

function var_0_1.EnterRogueMain(arg_22_0, arg_22_1, arg_22_2, arg_22_3)
	local var_22_0 = {}

	for iter_22_0, iter_22_1 in ipairs(arg_22_2) do
		var_22_0[iter_22_0] = {
			hp_ratio = 10000,
			hero_id = iter_22_1,
			temp_id = arg_22_3[iter_22_0]
		}
	end

	arg_22_0:SaveReserveTeam()
	ChallengeRogueTeamAction.SelectedDifficulty(arg_22_1, ChallengeRogueTeamData:GetUIDifficultyID(), var_22_0, function()
		ChallengeRogueTeamData:UISetNeedPlayStartAnimator(true)
		gameContext:OverrideUrl("/challengeRogueTeamEntraceDifficulty", "/challengeRogueTeamPathMain", nil, "home")
		ChallengeRogueTeamStartAnimatorView.New()
	end)
end

function var_0_1.GotoReservesProposalUI(arg_24_0)
	ChallengeRogueTeamAction.OnPlayingState(ChallengeRogueTeamConst.PLAYING_STATE.EXIT, function()
		var_0_1.super.GotoReservesProposalUI(arg_24_0)
	end)
end

function var_0_1.OnSectionClickHero(arg_26_0, arg_26_1)
	ChallengeRogueTeamAction.OnPlayingState(ChallengeRogueTeamConst.PLAYING_STATE.EXIT, function()
		var_0_1.super.OnSectionClickHero(arg_26_0, arg_26_1)
	end)
end

return var_0_1
