local var_0_0 = import("game.views.heroTeamInfo.NewHeroTeamInfoBaseView")
local var_0_1 = class("ChallengeRogueTeamHeroSelectView", var_0_0)

function var_0_1.UIName(arg_1_0)
	return "Widget/System/Formation/FormationChallengeRogueTeamHeroUIVariant"
end

function var_0_1.Init(arg_2_0)
	arg_2_0:BindCfgUI()

	arg_2_0.tabItemList_ = {}
	arg_2_0.heroList_ = LuaList.New(handler(arg_2_0, arg_2_0.HeadRenderer), arg_2_0.heroUIListGo_, ChallengeRogueTeamHeroItem)

	arg_2_0:InitSubView()
	arg_2_0:InitController()
	arg_2_0:AddUIListener()

	arg_2_0.tapType_ = {
		[1] = -1,
		[2] = HeroConst.HERO_ATTACK_TYPE.PYISICS,
		[3] = HeroConst.HERO_ATTACK_TYPE.WIND,
		[4] = HeroConst.HERO_ATTACK_TYPE.FLAME,
		[5] = HeroConst.HERO_ATTACK_TYPE.THUNDER,
		[6] = HeroConst.HERO_ATTACK_TYPE.DARK,
		[7] = HeroConst.HERO_ATTACK_TYPE.LIGHT,
		[8] = HeroConst.HERO_ATTACK_TYPE.FREEZE,
		[9] = HeroConst.HERO_ATTACK_TYPE.WATER
	}
	arg_2_0.btnController_ = arg_2_0.controller_:GetController("btn")
	arg_2_0.emptyController_ = arg_2_0.panelController_:GetController("empty")
end

function var_0_1.OnEnter(arg_3_0)
	if arg_3_0.params_.isBack and arg_3_0.stopCountimeFlag_ then
		ChallengeRogueTeamAction.OnPlayingState(ChallengeRogueTeamConst.PLAYING_STATE.ENTER, function()
			arg_3_0.stopCountimeFlag_ = false
		end)
	end

	if arg_3_0.params_.isEnter then
		arg_3_0.recruitedList_ = {}
		arg_3_0.selectTabIndex_ = 1
		arg_3_0.selectHeroData_ = {
			id = 0,
			trialID = 0
		}
		arg_3_0.enterScrollPosition_ = nil
	end

	arg_3_0.cacheBattlePower_ = {}
	arg_3_0.recruitNumLimit_ = math.max(ChallengeRogueTeamData:AttributeGetValue(8), 1)

	for iter_3_0, iter_3_1 in ipairs(arg_3_0.tapType_) do
		if not arg_3_0.tabItemList_[iter_3_0] then
			local var_3_0 = Object.Instantiate(arg_3_0.tabItemGo_, arg_3_0.tabContent_)

			arg_3_0.tabItemList_[iter_3_0] = ChallengeRogueTeamHeroTabItem.New(var_3_0)
		end

		arg_3_0:IndexTabItem(iter_3_0, arg_3_0.tabItemList_[iter_3_0])
		SetActive(arg_3_0.tabItemList_[iter_3_0].gameObject_, true)
	end

	for iter_3_2 = #arg_3_0.tabItemList_, #arg_3_0.tapType_ + 1, -1 do
		SetActive(arg_3_0.tabItemList_[iter_3_2].gameObject_, false)
	end

	for iter_3_3, iter_3_4 in ipairs(arg_3_0.heroList_:GetItemList()) do
		iter_3_4:SetRecruited(false)
	end

	arg_3_0.recruitedNumText_.text = string.format(GetTips("CHALLENGE_ROGUE_RECRUITED_NUM"), arg_3_0.recruitNumLimit_)

	arg_3_0:ProcessCamera()
	arg_3_0:ProcessParams()
	arg_3_0:SubViewOnEnter()
	arg_3_0:GetHeroTeam()
	arg_3_0:RefreshSelectTab()
	arg_3_0:RefreshHeroDataList()

	if not arg_3_0.params_.isEnter then
		arg_3_0:SelectHero(arg_3_0.selectHeroData_)
	else
		arg_3_0:RefreshHeroList()
	end

	if arg_3_0.enterScrollPosition_ then
		arg_3_0.heroList_:StartScrollByPosition(#arg_3_0.heroDataList_, arg_3_0.enterScrollPosition_)
	else
		arg_3_0.heroList_:StartScroll(#arg_3_0.heroDataList_, 1)
	end

	manager.rogueTeamInGameInfoBox:ShowBox()

	arg_3_0.params_.isBack = false
end

function var_0_1.ProcessProxyParams(arg_5_0)
	arg_5_0.heroDataType_ = HeroConst.HERO_DATA_TYPE.CHALLENGEROUGETEAM

	if not arg_5_0.params_.sectionProxy then
		arg_5_0.params_.sectionProxy = SectionSelectHeroTools.GetProxy(arg_5_0.params_, arg_5_0.reserveParams_, arg_5_0.heroDataType_)
	end

	arg_5_0.sectionProxy_ = arg_5_0.params_.sectionProxy
	arg_5_0.heroViewProxy_ = arg_5_0.sectionProxy_:GetHeroViewProxy()
	arg_5_0.heroViewProxyDic_ = {}
	arg_5_0.heroViewProxyDic_[arg_5_0.heroDataType_] = arg_5_0.heroViewProxy_
end

function var_0_1.RefreshSelectTab(arg_6_0)
	return
end

function var_0_1.IndexTabItem(arg_7_0, arg_7_1, arg_7_2)
	arg_7_2:SetData(arg_7_1, arg_7_0.tapType_[arg_7_1])
	arg_7_2:SetClickCallBack(function(arg_8_0)
		if arg_7_0.selectTabIndex_ == arg_8_0 then
			return
		end

		arg_7_0.selectTabIndex_ = arg_8_0

		for iter_8_0, iter_8_1 in ipairs(arg_7_0.tabItemList_) do
			iter_8_1:RefreshSelect(arg_7_0.selectTabIndex_)
		end

		arg_7_0.heroDataList_ = arg_7_0:FilterHeroDataList(arg_7_0.allHeroDataList_)

		arg_7_0.heroList_:StartScroll(#arg_7_0.heroDataList_)
	end)
	arg_7_2:RefreshSelect(arg_7_0.selectTabIndex_)
end

function var_0_1.HeadRenderer(arg_9_0, arg_9_1, arg_9_2)
	local var_9_0 = arg_9_0.heroDataList_[arg_9_1].id
	local var_9_1 = arg_9_0.heroDataList_[arg_9_1].trialID

	arg_9_2:SetSectionHeroData(arg_9_1, arg_9_0.heroDataList_[arg_9_1])
	arg_9_2:SetSelected(arg_9_2.heroId_ == arg_9_0.selectHeroData_.id and arg_9_2.trialID_ == arg_9_0.selectHeroData_.trialID)

	if arg_9_2.trialID_ ~= 0 then
		arg_9_2:SetRecruited(table.indexof(arg_9_0.recruitedList_, arg_9_2.trialID_))
	else
		arg_9_2:SetRecruited(table.indexof(arg_9_0.recruitedList_, arg_9_2.heroId_))
	end

	arg_9_2:RegisterClickListener(function(arg_10_0)
		if arg_9_0.recruitNumLimit_ > 1 then
			if #arg_9_0.recruitedList_ >= arg_9_0.recruitNumLimit_ and not table.indexof(arg_9_0.recruitedList_, arg_9_0.heroDataList_[arg_10_0].id) and not table.indexof(arg_9_0.recruitedList_, arg_9_0.heroDataList_[arg_10_0].trialID) then
				ShowTips("CHALLENGE_ROGUE_TEAM_RECRUIT_LIMIT")

				return
			end
		elseif not table.isEmpty(arg_9_0.recruitedList_) then
			arg_9_0:AddHeroToRecruitList(arg_9_0.selectHeroData_)
		end

		arg_9_0:AddHeroToRecruitList(arg_9_0.heroDataList_[arg_10_0])
		arg_9_0:SelectHero(arg_9_0.heroDataList_[arg_10_0])

		arg_9_0.selectHeroData_ = arg_9_0.heroDataList_[arg_10_0]

		for iter_10_0, iter_10_1 in pairs(arg_9_0.heroList_:GetItemList()) do
			if arg_9_0.selectHeroData_.trialID ~= 0 then
				if iter_10_1.trialID_ == arg_9_0.selectHeroData_.trialID then
					arg_9_0.selectItem_ = iter_10_1
				end
			elseif iter_10_1.heroId_ == arg_9_0.selectHeroData_.id then
				arg_9_0.selectItem_ = iter_10_1
			end

			if iter_10_1.trialID_ ~= 0 then
				iter_10_1:SetRecruited(table.indexof(arg_9_0.recruitedList_, iter_10_1.trialID_))
			else
				iter_10_1:SetRecruited(table.indexof(arg_9_0.recruitedList_, iter_10_1.heroId_))
			end
		end

		arg_9_0.emptyController_:SetSelectedState(tostring(arg_9_0.selectHeroData_.id == 0))
	end)
	arg_9_2:RegisterLookListener(function(arg_11_0, arg_11_1)
		arg_9_0:OnInfoBtnClick(arg_11_0, arg_11_1)
	end)
end

function var_0_1.RefreshHeroList(arg_12_0)
	for iter_12_0, iter_12_1 in pairs(arg_12_0.heroList_:GetItemList()) do
		iter_12_1:SetSelected("false")
	end

	arg_12_0.emptyController_:SetSelectedState("true")
end

function var_0_1.AddHeroToRecruitList(arg_13_0, arg_13_1)
	local var_13_0

	if arg_13_1.type == HeroConst.HERO_DATA_TYPE.TRIAL then
		var_13_0 = table.indexof(arg_13_0.recruitedList_, arg_13_1.trialID)
	else
		var_13_0 = table.indexof(arg_13_0.recruitedList_, arg_13_1.id)
	end

	if not var_13_0 and #arg_13_0.recruitedList_ < arg_13_0.recruitNumLimit_ then
		local var_13_1 = false

		for iter_13_0, iter_13_1 in ipairs(arg_13_0.recruitedList_) do
			local var_13_2 = HeroCfg[iter_13_1]
			local var_13_3

			if not var_13_2 then
				var_13_3 = HeroStandardSystemCfg[iter_13_1].hero_id
			else
				var_13_3 = iter_13_1
			end

			if var_13_3 == arg_13_1.id then
				var_13_1 = iter_13_0

				break
			end
		end

		if var_13_1 then
			table.remove(arg_13_0.recruitedList_, var_13_1)
		end

		table.insert(arg_13_0.recruitedList_, arg_13_1.trialID ~= 0 and arg_13_1.trialID or arg_13_1.id)
	elseif var_13_0 then
		table.remove(arg_13_0.recruitedList_, var_13_0)
	end

	if #arg_13_0.recruitedList_ > 0 then
		arg_13_0.btnController_:SetSelectedState("01")
	else
		arg_13_0.btnController_:SetSelectedState("0")
	end
end

function var_0_1.SelectHero(arg_14_0, arg_14_1)
	arg_14_0.selectHeroData_ = arg_14_1

	for iter_14_0, iter_14_1 in pairs(arg_14_0.heroList_:GetItemList()) do
		if arg_14_0.selectHeroData_.trialID ~= 0 then
			iter_14_1:SetSelected(iter_14_1.trialID_ == arg_14_0.selectHeroData_.trialID)
		else
			iter_14_1:SetSelected(iter_14_1.trialID_ == 0 and iter_14_1.heroId_ == arg_14_0.selectHeroData_.id)
		end
	end

	arg_14_0:RefreshInfoBtn()
	arg_14_0:UpdateHeroView()
	arg_14_0:RefreshJoinBtn()
end

function var_0_1.UpdateHeroView(arg_15_0)
	if arg_15_0.selectHeroData_ and arg_15_0.selectHeroData_.id ~= 0 and arg_15_0.selectHeroData_.heroViewProxy then
		local var_15_0 = arg_15_0.selectHeroData_.id
		local var_15_1 = arg_15_0.selectHeroData_.heroViewProxy:GetHeroData(var_15_0, {
			arg_15_0.selectHeroData_.trialID
		})
		local var_15_2 = arg_15_0.selectHeroData_.heroViewProxy:GetHeroUsingSkinInfo(var_15_0, {
			arg_15_0.selectHeroData_.trialID
		}).id

		arg_15_0.heroInfoView_:SetProxy(arg_15_0.selectHeroData_.heroViewProxy)
		arg_15_0.heroInfoView_:SetHeroInfo(var_15_1)
		arg_15_0.heroInfoView_:UpdateView()
	end

	arg_15_0.emptyController_:SetSelectedState(tostring(not arg_15_0.selectHeroData_ or arg_15_0.selectHeroData_.id == 0 or not arg_15_0.selectHeroData_.heroViewProxy))
end

function var_0_1.InitSubView(arg_16_0)
	arg_16_0.filterView_ = arg_16_0:GetFilterClass().New(arg_16_0.filterGo_)

	arg_16_0.filterView_:SetExtraSorter(handler(arg_16_0, arg_16_0.ExtraSorter))

	arg_16_0.autoClearFilter_ = true
	arg_16_0.heroAvatarView_ = HeroAvatarView.New(arg_16_0, arg_16_0.displayGo_)
	arg_16_0.heroInfoView_ = ChallengeRogueTeamSectionHeroInfoView.New(arg_16_0, arg_16_0.heroInfoGo_)
end

function var_0_1.GetHeroList(arg_17_0)
	local var_17_0 = {}
	local var_17_1 = ChallengeRogueTeamData:GetHeroList()
	local var_17_2 = ChallengeRogueTeamData:GetUnlockTrailHeroList()

	for iter_17_0, iter_17_1 in pairs(HeroData:GetHeroList()) do
		local var_17_3 = 0

		for iter_17_2, iter_17_3 in pairs(ChallengeRogueTeamData:GetTrialHeroList()) do
			if HeroStandardSystemCfg[iter_17_3].hero_id == iter_17_1.id then
				var_17_3 = iter_17_3
			end
		end

		if not var_17_1[iter_17_1.id] and not var_17_2[var_17_3] then
			var_17_0[iter_17_1.id] = iter_17_1
		end
	end

	return (HeroTools.Sort(var_17_0))
end

function var_0_1.GetTrialHeroList(arg_18_0)
	local var_18_0 = {}
	local var_18_1 = ChallengeRogueTeamData:GetUnlockTrailHeroList()
	local var_18_2 = ChallengeRogueTeamData:GetHeroList()

	for iter_18_0, iter_18_1 in pairs(ChallengeRogueTeamData:GetTrialHeroList()) do
		if not var_18_1[iter_18_1] and not var_18_2[HeroStandardSystemCfg[iter_18_1].hero_id] then
			table.insert(var_18_0, iter_18_1)
		end
	end

	return var_18_0
end

function var_0_1.RefreshHeroDataList(arg_19_0)
	local var_19_0 = {}

	if not arg_19_0.params_.isBack then
		arg_19_0.allTrialIDList_ = {}
		arg_19_0.customHeroList_, arg_19_0.canSwitchResctrictHeroList_ = SectionSelectHeroTools.GetRestrictHeroList(arg_19_0.params_.stageType, arg_19_0.params_.stageID)
		arg_19_0.curCanSwitchRestrictHero_ = arg_19_0.canSwitchResctrictHeroList_[arg_19_0.params_.selectHeroPos] ~= ReserveConst.RESTRICT_HERO_SWITCH_MODE.FORBID

		local var_19_1
		local var_19_2
		local var_19_3, var_19_4 = SectionSelectHeroTools.GetRestrictHeroPosDic(arg_19_0.params_.stageType, arg_19_0.params_.stageID)

		if arg_19_0.customHeroList_[arg_19_0.params_.selectHeroPos][1] then
			arg_19_0:ProcessCustomHeroData(var_19_0, var_19_4)
		else
			arg_19_0:ProcessOwnHeroData(var_19_0, var_19_3)
			arg_19_0:ProcessTrialHeroData(var_19_0, var_19_4)
		end

		for iter_19_0, iter_19_1 in pairs(arg_19_0.heroViewProxyDic_) do
			iter_19_1:SetTempHeroList(arg_19_0.allTrialIDList_)
		end

		arg_19_0.allHeroDataList_ = var_19_0
		arg_19_0.heroDataList_ = arg_19_0:FilterHeroDataList(arg_19_0.allHeroDataList_)
	else
		arg_19_0.heroDataList_ = arg_19_0.sortedHeroList_
	end
end

function var_0_1.FilterHeroDataList(arg_20_0, arg_20_1)
	local var_20_0 = {}

	if arg_20_0.tapType_[arg_20_0.selectTabIndex_] == -1 then
		var_20_0 = arg_20_1
	else
		for iter_20_0, iter_20_1 in ipairs(arg_20_1) do
			local var_20_1 = HeroCfg[iter_20_1.id]
			local var_20_2 = false

			if iter_20_1.type == HeroConst.HERO_DATA_TYPE.TRIAL then
				if table.indexof(arg_20_0.recruitedList_, iter_20_1.trialID) then
					var_20_2 = true
				end
			elseif table.indexof(arg_20_0.recruitedList_, iter_20_1.id) then
				var_20_2 = true
			end

			if var_20_1.ATK_attribute[1] == arg_20_0.tapType_[arg_20_0.selectTabIndex_] or var_20_2 then
				table.insert(var_20_0, iter_20_1)
			end
		end
	end

	arg_20_0:SortHeroList(var_20_0)

	arg_20_0.sortedHeroList_ = deepClone(var_20_0)

	return var_20_0
end

function var_0_1.SortHeroList(arg_21_0, arg_21_1)
	table.sort(arg_21_1, function(arg_22_0, arg_22_1)
		local var_22_0 = arg_22_0.type == HeroConst.HERO_DATA_TYPE.TRIAL
		local var_22_1 = arg_22_1.type == HeroConst.HERO_DATA_TYPE.TRIAL
		local var_22_2
		local var_22_3

		if var_22_0 then
			var_22_2 = table.indexof(arg_21_0.recruitedList_, arg_22_0.trialID) or 999
		else
			var_22_2 = table.indexof(arg_21_0.recruitedList_, arg_22_0.id) or 999
		end

		if var_22_1 then
			var_22_3 = table.indexof(arg_21_0.recruitedList_, arg_22_1.trialID) or 999
		else
			var_22_3 = table.indexof(arg_21_0.recruitedList_, arg_22_1.id) or 999
		end

		if var_22_2 ~= var_22_3 then
			return var_22_2 < var_22_3
		end

		if var_22_0 ~= var_22_1 and (not var_22_0 or not var_22_1) then
			return var_22_0 ~= false
		end

		local var_22_4
		local var_22_5

		if var_22_0 then
			var_22_4 = arg_21_0.cacheBattlePower_[arg_22_0.trialID] or TempHeroData:GetBattlePower(arg_22_0.trialID)
			arg_21_0.cacheBattlePower_[arg_22_0.trialID] = var_22_4
		else
			var_22_4 = arg_21_0.cacheBattlePower_[arg_22_0.id] or arg_22_0.heroViewProxy:GetBattlePower(arg_22_0.id)
			arg_21_0.cacheBattlePower_[arg_22_0.id] = var_22_4
		end

		if var_22_1 then
			var_22_5 = arg_21_0.cacheBattlePower_[arg_22_1.trialID] or TempHeroData:GetBattlePower(arg_22_1.trialID)
			arg_21_0.cacheBattlePower_[arg_22_1.trialID] = var_22_5
		else
			var_22_5 = arg_21_0.cacheBattlePower_[arg_22_1.id] or arg_22_1.heroViewProxy:GetBattlePower(arg_22_1.id)
			arg_21_0.cacheBattlePower_[arg_22_1.id] = var_22_5
		end

		if var_22_4 ~= var_22_5 then
			return var_22_5 < var_22_4
		end

		if arg_22_0.star ~= arg_22_0.star then
			return arg_22_0.star > arg_22_1.star
		end

		local var_22_6 = HeroCfg[arg_22_0.id]
		local var_22_7 = HeroCfg[arg_22_1.id]

		if var_22_6.rare ~= var_22_7.rare then
			return var_22_6.rare > var_22_7.rare
		end

		if arg_22_0.exp ~= arg_22_1.exp then
			return arg_22_0.exp > arg_22_1.ext
		end

		return arg_22_0.id < arg_22_1.id
	end)
end

function var_0_1.OnInfoBtnClick(arg_23_0, arg_23_1, arg_23_2)
	arg_23_0.stopCountimeFlag_ = true

	ChallengeRogueTeamAction.OnPlayingState(ChallengeRogueTeamConst.PLAYING_STATE.EXIT, function()
		return
	end)
	ChallengeRogueTeamData:HeroSetLockState(false)
	arg_23_0:Go("/newHero", {
		isEnter = true,
		hid = arg_23_1.tempID ~= 0 and arg_23_1.tempID or arg_23_1.id,
		type = arg_23_2 or arg_23_1.tempID ~= 0 and HeroConst.HERO_DATA_TYPE.TRIAL,
		tempHeroList = arg_23_0:GetValidTrailList(arg_23_1.tempID)
	})

	arg_23_0.enterScrollPosition_ = arg_23_0.heroList_:GetScrolledPosition()
end

function var_0_1.GetValidTrailList(arg_25_0, arg_25_1)
	local var_25_0 = {}

	if arg_25_1 ~= 0 then
		for iter_25_0, iter_25_1 in pairs(arg_25_0.allTrialIDList_) do
			local var_25_1 = HeroStandardSystemCfg[iter_25_1]

			if not HeroTools.IsNPC(var_25_1.hero_id) and not HeroTools.NeedHideInfo(var_25_1.hero_id) then
				table.insert(var_25_0, iter_25_1)
			end
		end
	end

	return var_25_0
end

function var_0_1.OnJoinClick(arg_26_0)
	if #arg_26_0.recruitedList_ < arg_26_0.recruitNumLimit_ then
		ShowMessageBox({
			isTop = true,
			content = GetTips("ROGUE_TEAM_FORGIVE_RECRUIT"),
			OkCallback = function()
				arg_26_0:RecruitHero()
			end,
			CancelCallback = function()
				return
			end
		})
	else
		arg_26_0:RecruitHero()
	end

	ChallengeRogueTeamData:HeroSetLockState(true)
end

function var_0_1.RecruitHero(arg_29_0)
	local var_29_0 = {}
	local var_29_1 = {}

	for iter_29_0, iter_29_1 in ipairs(arg_29_0.recruitedList_) do
		local var_29_2 = HeroStandardSystemCfg[iter_29_1]

		if var_29_2 then
			table.insert(var_29_0, var_29_2.hero_id)
			table.insert(var_29_1, iter_29_1)
		else
			table.insert(var_29_0, iter_29_1)
			table.insert(var_29_1, 0)
		end
	end

	ChallengeRogueTeamAction.HeroRecruit(var_29_0, var_29_1, function()
		ChallengeRogueTeamData:ClearUnOperateData()
		ChallengeRogueTeamData:RemoveServerTriggerQueue()
		arg_29_0:Back()
		ChallengeRogueTeamAction.RemovePopWindowCnt()
		manager.notify:Invoke(CHALLENGE_ROGUE_TEAM_UPDATE_WINDOW)
	end)
end

function var_0_1.OnExit(arg_31_0)
	var_0_1.super.OnExit(arg_31_0)

	arg_31_0.params_.isEnter = false
	arg_31_0.cacheBattlePower_ = {}

	manager.rogueTeamInGameInfoBox:HideBox()
	manager.rogueTeamMapPreviewBtnBar:HideBar()
end

function var_0_1.Dispose(arg_32_0)
	arg_32_0.stopCountimeFlag_ = false

	var_0_1.super.Dispose(arg_32_0)

	if arg_32_0.tabItemList_ then
		for iter_32_0, iter_32_1 in ipairs(arg_32_0.tabItemList_) do
			iter_32_1:Dispose()
		end

		arg_32_0.tabItemList_ = nil
	end

	if arg_32_0.heroList_ then
		arg_32_0.heroList_:Dispose()

		arg_32_0.heroList_ = nil
	end
end

function var_0_1.OnTop(arg_33_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR,
		INFO_BAR
	})
	manager.windowBar:SetGameHelpKey("ROGUE_TEAM_HERO_DESC")
	manager.rogueTeamMapPreviewBtnBar:ShowBar()
	manager.rogueTeamMapPreviewBtnBar:ShowState(ChallengeRogueTeamConst.MAP_BTN_WINDOW.OTHER)
	ChallengeRogueTeamTools.RegistWindowBarClick()
end

return var_0_1
