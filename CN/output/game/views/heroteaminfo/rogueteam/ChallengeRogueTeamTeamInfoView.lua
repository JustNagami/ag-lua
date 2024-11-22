local var_0_0 = import("game.views.heroTeamInfo.NewHeroTeamInfoBaseView")
local var_0_1 = class("ChallengeRogueTeamTeamInfoView", var_0_0)

function var_0_1.UIName(arg_1_0)
	return "Widget/System/Formation/FormationChallengeRogueTeamHeroUI"
end

function var_0_1.InitSubView(arg_2_0)
	arg_2_0.filterView_ = arg_2_0:GetFilterClass().New(arg_2_0.filterGo_)

	arg_2_0.filterView_:SetExtraSorter(handler(arg_2_0, arg_2_0.ExtraSorter))
	arg_2_0.filterView_:SetListChangeHandler(handler(arg_2_0, arg_2_0.OnListChange))

	arg_2_0.autoClearFilter_ = true
	arg_2_0.heroAvatarView_ = HeroAvatarView.New(arg_2_0, arg_2_0.displayGo_)
	arg_2_0.heroInfoView_ = ChallengeRogueTeamSectionHeroInfoView.New(arg_2_0, arg_2_0.heroInfoGo_)
end

function var_0_1.GetHeroList(arg_3_0)
	local var_3_0 = {}
	local var_3_1 = ChallengeRogueTeamData:GetHeroList()
	local var_3_2 = ChallengeRogueTeamData:GetUnlockTrailHeroList()

	if table.length(var_3_1) > 0 or table.length(var_3_2) > 0 or ChallengeRogueTeamData:HeroGetLockState() then
		var_3_0 = HeroTools.Sort(var_3_1)
	else
		for iter_3_0, iter_3_1 in pairs(HeroData:GetHeroList()) do
			if not var_3_1[iter_3_1.id] then
				var_3_0[iter_3_1.id] = iter_3_1
			end
		end

		var_3_0 = HeroTools.Sort(var_3_0)
	end

	return var_3_0
end

function var_0_1.HeadRenderer(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0 = arg_4_0.heroDataList_[arg_4_1].id
	local var_4_1 = arg_4_0.heroDataList_[arg_4_1].trialID

	arg_4_2:SetSectionHeroData(arg_4_0.heroDataList_[arg_4_1])
	arg_4_2:SetSelected(arg_4_2.heroId_ == arg_4_0.selectHeroData_.id and arg_4_2.trialID_ == arg_4_0.selectHeroData_.trialID)
	arg_4_2:RegisterClickListener(function()
		arg_4_0:SelectHero(arg_4_0.heroDataList_[arg_4_1])
	end)
	arg_4_2:SetInTeamFlag(arg_4_0:IsInTeam(var_4_0, var_4_1))
	arg_4_2:SetHeroLock(table.keyof(arg_4_0.lockHeroList_, var_4_0) ~= nil or table.keyof(arg_4_0.lockHeroList_, var_4_1) ~= nil)
	arg_4_2:SetHp(math.ceil(ChallengeRogueTeamData:GetHeroData(var_4_0, nil, true).hpPercent / 100))
	arg_4_2:RefreshHpValue(math.ceil(ChallengeRogueTeamData:GetHeroData(var_4_0, nil, true).hpPercent / 100))
	arg_4_2:SetChallengeRogueTeamModify(ChallengeRogueTeamData:GetHeroData(var_4_0, nil, true))
end

function var_0_1.GetTrialHeroList(arg_6_0)
	local var_6_0 = {}
	local var_6_1 = ChallengeRogueTeamData:GetHeroList()
	local var_6_2 = ChallengeRogueTeamData:GetUnlockTrailHeroList()

	if table.length(var_6_1) > 0 or table.length(var_6_2) > 0 or ChallengeRogueTeamData:HeroGetLockState() then
		for iter_6_0, iter_6_1 in pairs(var_6_2) do
			table.insert(var_6_0, iter_6_0)
		end
	else
		for iter_6_2, iter_6_3 in pairs(ChallengeRogueTeamData:GetTrialHeroList()) do
			if not var_6_1[iter_6_3] then
				table.insert(var_6_0, iter_6_3)
			end
		end
	end

	return var_6_0
end

function var_0_1.ProcessProxyParams(arg_7_0)
	arg_7_0.heroDataType_ = HeroConst.HERO_DATA_TYPE.CHALLENGEROUGETEAM

	if not arg_7_0.params_.sectionProxy then
		arg_7_0.params_.sectionProxy = SectionSelectHeroTools.GetProxy(arg_7_0.params_, arg_7_0.reserveParams_, arg_7_0.heroDataType_)
	end

	arg_7_0.sectionProxy_ = arg_7_0.params_.sectionProxy
	arg_7_0.heroViewProxy_ = arg_7_0.sectionProxy_:GetHeroViewProxy()
	arg_7_0.heroViewProxyDic_ = {}
	arg_7_0.heroViewProxyDic_[arg_7_0.heroDataType_] = arg_7_0.heroViewProxy_
end

function var_0_1.ChangeTeam(arg_8_0, arg_8_1, arg_8_2)
	var_0_1.super.ChangeTeam(arg_8_0, arg_8_1, arg_8_2)
end

function var_0_1.OnChangeTeamSuccess(arg_9_0)
	arg_9_0.heroAvatarView_:RemoveTween()
	arg_9_0:Back(1, {
		isSorted = true
	})
end

function var_0_1.OnInfoBtnClick(arg_10_0, arg_10_1, arg_10_2)
	arg_10_0:Go("/newHero", {
		isEnter = true,
		hid = arg_10_1 or arg_10_0.selectHeroData_.trialID ~= 0 and arg_10_0.selectHeroData_.trialID or arg_10_0.selectHeroData_.id,
		type = arg_10_2 or arg_10_0.selectHeroData_.trialID ~= 0 and HeroConst.HERO_DATA_TYPE.TRIAL or arg_10_0.heroDataType_,
		heroViewProxy = arg_10_0.selectHeroData_.heroViewProxy,
		tempHeroList = arg_10_0:GetValidTrailList()
	})
end

function var_0_1.OnExit(arg_11_0)
	var_0_1.super.OnExit(arg_11_0)
end

function var_0_1.GetHeroViewProxy(arg_12_0, arg_12_1)
	if not arg_12_0.heroViewProxyDic_[arg_12_1] then
		arg_12_0.heroViewProxyDic_[arg_12_1] = HeroViewDataProxy.New(arg_12_1)
	end

	if arg_12_1 == HeroConst.HERO_DATA_TYPE.TRIAL then
		arg_12_0.heroViewProxyDic_[arg_12_1].isChallengeRogue = true
	end

	return arg_12_0.heroViewProxyDic_[arg_12_1]
end

function var_0_1.OnTop(arg_13_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR,
		INFO_BAR
	})
	manager.windowBar:SetGameHelpKey("ROGUE_TEAM_HERO_DESC")
end

return var_0_1
