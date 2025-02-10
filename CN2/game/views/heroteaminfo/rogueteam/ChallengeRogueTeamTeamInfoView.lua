local var_0_0 = import("game.views.heroTeamInfo.NewHeroTeamInfoBaseView")
local var_0_1 = class("ChallengeRogueTeamTeamInfoView", var_0_0)

function var_0_1.UIName(arg_1_0)
	return "Widget/System/Formation/FormationChallengeRogueTeamHeroUI"
end

function var_0_1.GetHeroList(arg_2_0)
	local var_2_0 = {}
	local var_2_1 = ChallengeRogueTeamData:GetHeroList()
	local var_2_2 = ChallengeRogueTeamData:GetUnlockTrailHeroList()

	if table.length(var_2_1) > 0 or table.length(var_2_2) > 0 or ChallengeRogueTeamData:HeroGetLockState() then
		var_2_0 = HeroTools.Sort(var_2_1)
	else
		for iter_2_0, iter_2_1 in pairs(HeroData:GetHeroList()) do
			if not var_2_1[iter_2_1.id] then
				var_2_0[iter_2_1.id] = iter_2_1
			end
		end

		var_2_0 = HeroTools.Sort(var_2_0)
	end

	return var_2_0
end

function var_0_1.HeadRenderer(arg_3_0, arg_3_1, arg_3_2)
	local var_3_0 = arg_3_0.heroDataList_[arg_3_1].id
	local var_3_1 = arg_3_0.heroDataList_[arg_3_1].trialID

	arg_3_2:SetSectionHeroData(arg_3_0.heroDataList_[arg_3_1])
	arg_3_2:SetSelected(arg_3_2.heroId_ == arg_3_0.selectHeroData_.id and arg_3_2.trialID_ == arg_3_0.selectHeroData_.trialID)
	arg_3_2:RegisterClickListener(function()
		arg_3_0:SelectHero(arg_3_0.heroDataList_[arg_3_1])
	end)
	arg_3_2:SetInTeamFlag(arg_3_0:IsInTeam(var_3_0, var_3_1))
	arg_3_2:SetHeroLock(table.keyof(arg_3_0.lockHeroList_, var_3_0) ~= nil or table.keyof(arg_3_0.lockHeroList_, var_3_1) ~= nil)
	arg_3_2:SetHp(math.ceil(ChallengeRogueTeamData:GetHeroData(var_3_0, nil, true).hpPercent / 100))
	arg_3_2:RefreshHpValue(math.ceil(ChallengeRogueTeamData:GetHeroData(var_3_0, nil, true).hpPercent / 100))
	arg_3_2:SetChallengeRogueTeamModify(ChallengeRogueTeamData:GetHeroData(var_3_0, nil, true))
end

function var_0_1.GetTrialHeroList(arg_5_0)
	local var_5_0 = {}
	local var_5_1 = ChallengeRogueTeamData:GetHeroList()
	local var_5_2 = ChallengeRogueTeamData:GetUnlockTrailHeroList()

	if table.length(var_5_1) > 0 or table.length(var_5_2) > 0 or ChallengeRogueTeamData:HeroGetLockState() then
		for iter_5_0, iter_5_1 in pairs(var_5_2) do
			table.insert(var_5_0, iter_5_0)
		end
	else
		for iter_5_2, iter_5_3 in pairs(ChallengeRogueTeamData:GetTrialHeroList()) do
			if not var_5_1[iter_5_3] then
				table.insert(var_5_0, iter_5_3)
			end
		end
	end

	return var_5_0
end

function var_0_1.ProcessProxyParams(arg_6_0)
	arg_6_0.heroDataType_ = HeroConst.HERO_DATA_TYPE.CHALLENGEROUGETEAM

	if not arg_6_0.params_.sectionProxy then
		arg_6_0.params_.sectionProxy = SectionSelectHeroTools.GetProxy(arg_6_0.params_, arg_6_0.reserveParams_, arg_6_0.heroDataType_)
	end

	arg_6_0.sectionProxy_ = arg_6_0.params_.sectionProxy
	arg_6_0.heroViewProxy_ = arg_6_0.sectionProxy_:GetHeroViewProxy()
	arg_6_0.heroViewProxyDic_ = {}
	arg_6_0.heroViewProxyDic_[arg_6_0.heroDataType_] = arg_6_0.heroViewProxy_
end

function var_0_1.ChangeTeam(arg_7_0, arg_7_1, arg_7_2)
	var_0_1.super.ChangeTeam(arg_7_0, arg_7_1, arg_7_2)
end

function var_0_1.OnChangeTeamSuccess(arg_8_0)
	arg_8_0.heroAvatarView_:RemoveTween()
	arg_8_0:Back(1, {
		isSorted = true
	})
end

function var_0_1.OnInfoBtnClick(arg_9_0, arg_9_1, arg_9_2)
	arg_9_0:Go("/newHero", {
		isEnter = true,
		hid = arg_9_1 or arg_9_0.selectHeroData_.trialID ~= 0 and arg_9_0.selectHeroData_.trialID or arg_9_0.selectHeroData_.id,
		type = arg_9_2 or arg_9_0.selectHeroData_.trialID ~= 0 and HeroConst.HERO_DATA_TYPE.TRIAL or arg_9_0.heroDataType_,
		heroViewProxy = arg_9_0.selectHeroData_.heroViewProxy,
		tempHeroList = arg_9_0:GetValidTrailList()
	})
end

function var_0_1.OnExit(arg_10_0)
	var_0_1.super.OnExit(arg_10_0)
end

function var_0_1.GetHeroViewProxy(arg_11_0, arg_11_1)
	if not arg_11_0.heroViewProxyDic_[arg_11_1] then
		arg_11_0.heroViewProxyDic_[arg_11_1] = HeroViewDataProxy.New(arg_11_1)
	end

	if arg_11_1 == HeroConst.HERO_DATA_TYPE.TRIAL then
		arg_11_0.heroViewProxyDic_[arg_11_1].isChallengeRogue = true
	end

	return arg_11_0.heroViewProxyDic_[arg_11_1]
end

function var_0_1.OnTop(arg_12_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR,
		INFO_BAR
	})
	manager.windowBar:SetGameHelpKey("ROGUE_TEAM_HERO_DESC")
end

function var_0_1.GetHeroInfoViewClass(arg_13_0)
	return ChallengeRogueTeamSectionHeroInfoView
end

return var_0_1
