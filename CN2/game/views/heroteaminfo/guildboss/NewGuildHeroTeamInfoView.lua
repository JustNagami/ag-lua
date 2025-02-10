local var_0_0 = import("game.views.heroTeamInfo.NewHeroTeamInfoBaseView")
local var_0_1 = class("NewGuildHeroTeamInfoView", var_0_0)

function var_0_1.UIName(arg_1_0)
	return "Widget/System/Formation/GuildBoss/FormationGuildBossHeroUI"
end

function var_0_1.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_1.Init(arg_3_0)
	local var_3_0 = arg_3_0.gameObject_

	arg_3_0:InitProxy()

	arg_3_0.gameObject_ = arg_3_0.realGo_
	arg_3_0.transform_ = arg_3_0.realGo_.transform

	arg_3_0:InitUI()
	arg_3_0:AddUIListener()

	arg_3_0.gameObject_ = var_3_0
	arg_3_0.transform_ = var_3_0.transform
end

function var_0_1.InitProxy(arg_4_0)
	arg_4_0:BindCfgUI()
end

function var_0_1.InitUI(arg_5_0)
	arg_5_0:BindCfgUI()
	arg_5_0:InitController()
	arg_5_0:InitSubView()
end

function var_0_1.InitSubView(arg_6_0)
	arg_6_0.heroAvatarView_ = HeroAvatarView.New(arg_6_0, arg_6_0.displayGo_)
	arg_6_0.selfHeroList_ = LuaList.New(handler(arg_6_0, arg_6_0.indexSelfHeroItem), arg_6_0.uiListGo_, SectionHeroTeamHeadItem)
	arg_6_0.assistantHeroList_ = LuaList.New(handler(arg_6_0, arg_6_0.indexAssistantItem), arg_6_0.assitUIListGo_, NewGuildBossAssistantHeadItemView)
	arg_6_0.toggleController1_ = ControllerUtil.GetController(arg_6_0.myHeroToggleBtn_.transform, "select")
	arg_6_0.toggleController2_ = ControllerUtil.GetController(arg_6_0.helpHeroToggleBtn_.transform, "select")
	arg_6_0.filterView_ = NewHeroListFilterView.New(arg_6_0.filterGo_)

	arg_6_0.filterView_:SetExtraSorter(function(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
		local var_7_0 = arg_6_0:IsInSelfTeam(arg_7_0.id) and 1 or 0
		local var_7_1 = arg_6_0:IsInSelfTeam(arg_7_1.id) and 1 or 0

		if var_7_0 ~= var_7_1 then
			return true, var_7_1 < var_7_0
		end

		return false, false
	end)
	arg_6_0.filterView_:SetListChangeHandler(handler(arg_6_0, arg_6_0.OnListChange))

	arg_6_0.assistFilterView_ = NewGuildBossAssistHeroFilterView.New(arg_6_0.assistHeroFilterGo_)

	arg_6_0.assistFilterView_:SetExtraSorter(function(arg_8_0, arg_8_1)
		local var_8_0 = GuildData:CheckCurrentHeroIDIsAssistant(arg_8_0.assist_hero_id) and 1 or 0
		local var_8_1 = GuildData:CheckCurrentHeroIDIsAssistant(arg_8_1.assist_hero_id) and 1 or 0

		if var_8_0 ~= var_8_1 then
			return true, var_8_1 < var_8_0
		end

		return false, false
	end)
	arg_6_0.assistFilterView_:SetListChangeHandler(handler(arg_6_0, arg_6_0.OnAssistListChange))
end

function var_0_1.OnEnter(arg_9_0)
	var_0_1.super.OnEnter(arg_9_0)
	arg_9_0:AddEventListeners()
	arg_9_0.assistFilterView_:OnEnter(HeroViewDataProxy.New(HeroConst.HERO_DATA_TYPE.FOREIGN))
end

function var_0_1.SubViewOnEnter(arg_10_0)
	var_0_1.super.SubViewOnEnter(arg_10_0)

	if arg_10_0.assistFilterView_ then
		arg_10_0.assistFilterView_:Reset(true)
	end
end

function var_0_1.RefreshHeroDataList(arg_11_0)
	local var_11_0 = ReserveTools.GetReserveTemplateByReserveType(ReserveConst.RESERVE_TYPE.GUILD_BOSS)

	arg_11_0.params_.heroList = var_11_0:GetCurHeroInfoList()
end

function var_0_1.RefreshUI(arg_12_0)
	arg_12_0:RefreshMultiModeBtn()
	arg_12_0:RefreshHeroList()
end

function var_0_1.RefreshHeroList(arg_13_0)
	local var_13_0 = arg_13_0.params_.heroList[arg_13_0.params_.selectHeroPos]

	if var_13_0 and var_13_0.heroId ~= 0 then
		if var_13_0.type == 1 then
			arg_13_0:SelectIndex(1)
		else
			arg_13_0:SelectIndex(2)
		end
	else
		arg_13_0:SelectIndex(1)
	end
end

function var_0_1.indexAssistantItem(arg_14_0, arg_14_1, arg_14_2)
	arg_14_2:SetSectionHeroData(arg_14_0.assistantDataList_[arg_14_1])
	arg_14_2:SetSelected(arg_14_0.selectedAssistHeroData_ ~= nil and arg_14_2:GetHeroId() == arg_14_0.selectedAssistHeroData_.assist_hero_id and arg_14_2:GetOwnerId() == arg_14_0.selectedAssistHeroData_.member_id)
	arg_14_2:SetTeamMark(arg_14_0:IsHeroInTeam(arg_14_2:GetHeroId(), arg_14_2:GetOwnerId()) > -1, GetTips("IN_TEAM"))
	arg_14_2:RegisterClickListener(function()
		arg_14_0:SelectAssistantHero(arg_14_1)
	end)
end

function var_0_1.indexSelfHeroItem(arg_16_0, arg_16_1, arg_16_2)
	local var_16_0 = arg_16_0.heroDataList_[arg_16_1].id
	local var_16_1 = arg_16_0.heroDataList_[arg_16_1].trialID

	arg_16_2:SetSectionHeroData(arg_16_0.heroDataList_[arg_16_1], arg_16_0.trialHeroList_)
	arg_16_2:SetSelected(arg_16_2.heroId_ == arg_16_0.selectHeroData_.id)
	arg_16_2:RegisterClickListener(function()
		arg_16_0:SelectSelfHero(arg_16_0.heroDataList_[arg_16_1])
	end)
	arg_16_2:SetTeamMark(arg_16_0:IsInSelfTeam(var_16_0), GetTips("IN_TEAM"))
end

function var_0_1.OnListChange(arg_18_0, arg_18_1, arg_18_2)
	arg_18_0.heroDataList_ = arg_18_2

	if arg_18_0.currentIndex_ ~= 1 then
		return
	end

	arg_18_0.selfHeroList_:StartScroll(#arg_18_0.heroDataList_)

	if #arg_18_0.heroDataList_ > 0 then
		local var_18_0 = arg_18_0:ChooseSelfFirstSelectIndex()

		if var_18_0 then
			arg_18_0.selectHeroData_ = arg_18_0.heroDataList_[var_18_0]
		else
			arg_18_0.selectHeroData_ = arg_18_0.heroDataList_[1]
		end

		arg_18_0:SelectSelfHero(arg_18_0.selectHeroData_)
	else
		arg_18_0:SelectEmptyAssistHero()
	end
end

function var_0_1.OnAssistListChange(arg_19_0, arg_19_1)
	arg_19_0.assistantDataList_ = arg_19_1

	arg_19_0.assistantHeroList_:StartScroll(#arg_19_0.assistantDataList_)

	if arg_19_0.selectedAssistHeroData_ == nil then
		if #arg_19_0.assistantDataList_ > 0 then
			local var_19_0 = arg_19_0:ChooseAssistFirstSelectIndex()

			arg_19_0:SelectAssistantHero(var_19_0)
		else
			arg_19_0:SelectEmptyAssistHero()
		end
	else
		local var_19_1 = -1

		for iter_19_0, iter_19_1 in ipairs(arg_19_0.assistantDataList_) do
			if iter_19_1 ~= nil and iter_19_1.assist_hero_id == arg_19_0.selectedAssistHeroID_ and iter_19_1.member_id == arg_19_0.selectedAssistHeroData_.member_id then
				var_19_1 = iter_19_0

				break
			end
		end

		if var_19_1 ~= -1 then
			arg_19_0:SelectAssistantHero(var_19_1)
		else
			arg_19_0:SelectEmptyAssistHero()
		end
	end
end

function var_0_1.ChooseSelfFirstSelectIndex(arg_20_0)
	local var_20_0 = arg_20_0.params_.heroList[arg_20_0.params_.selectHeroPos]

	if var_20_0 and var_20_0.heroId ~= 0 and var_20_0.type == 1 then
		local var_20_1 = var_20_0.heroId

		for iter_20_0, iter_20_1 in ipairs(arg_20_0.heroDataList_) do
			if iter_20_1.id == var_20_1 then
				return iter_20_0
			end
		end

		return 1
	end

	for iter_20_2, iter_20_3 in ipairs(arg_20_0.heroDataList_) do
		if not arg_20_0:IsInSelfTeam(iter_20_3.id) then
			return iter_20_2
		end
	end

	return 1
end

function var_0_1.ChooseAssistFirstSelectIndex(arg_21_0)
	local var_21_0 = arg_21_0.params_.heroList[arg_21_0.params_.selectHeroPos]

	if var_21_0 and var_21_0.heroId ~= 0 and var_21_0.type == 2 then
		local var_21_1

		for iter_21_0, iter_21_1 in ipairs(arg_21_0.assistantDataList_) do
			if var_21_0.info.assist_hero_id == iter_21_1.assist_hero_id and var_21_0.info.member_id == iter_21_1.member_id then
				var_21_1 = iter_21_0

				break
			end
		end

		return var_21_1
	end

	return 1
end

function var_0_1.SelectSelfHero(arg_22_0, arg_22_1)
	arg_22_0.selectHeroData_ = arg_22_1

	arg_22_0:RefreshSingleModeHeadItem()
	arg_22_0:UpdateSelfHeroView()
end

function var_0_1.RefreshSingleModeHeadItem(arg_23_0)
	for iter_23_0, iter_23_1 in pairs(arg_23_0.selfHeroList_:GetItemList()) do
		iter_23_1:SetSelected(iter_23_1.heroId_ == arg_23_0.selectHeroData_.id)
	end
end

function var_0_1.SelectEmptyAssistHero(arg_24_0)
	arg_24_0.heroAvatarView_:ShowHeroModel(false)

	arg_24_0.fightPowerText_.text = "--"
	arg_24_0.nameText_.text = "--"
	arg_24_0.subNameText_.text = "--"

	arg_24_0.infoBtnController_:SetSelectedState("off")

	arg_24_0.joinBtn_.interactable = false

	arg_24_0.joinBtnController_:SetSelectedState("cantAdd")
end

function var_0_1.SelectAssistantHero(arg_25_0, arg_25_1)
	local var_25_0 = arg_25_0.assistantDataList_[arg_25_1]

	arg_25_0.selectedAssistHeroID_ = var_25_0.assist_hero_id
	arg_25_0.selectedAssistHeroData_ = var_25_0

	arg_25_0.assistantHeroList_:Refresh()
	arg_25_0:UpdateAssistHeroView()
end

function var_0_1.UpdateSelfHeroView(arg_26_0)
	local var_26_0 = arg_26_0.selectHeroData_.id
	local var_26_1 = arg_26_0.selectHeroData_.heroViewProxy:GetHeroUsingSkinInfo(var_26_0, {
		arg_26_0.selectHeroData_.trialID
	}).id

	arg_26_0.heroAvatarView_:ShowHeroModel(true)
	arg_26_0.heroAvatarView_:SetSkinId(var_26_1)

	arg_26_0.fightPowerText_.text = getHeroPower(var_26_0, false)

	local var_26_2 = HeroCfg[var_26_0]

	arg_26_0.nameText_.text = GetI18NText(var_26_2.name)
	arg_26_0.subNameText_.text = GetI18NText(var_26_2.suffix)

	arg_26_0.infoBtnController_:SetSelectedState("on")
	arg_26_0:UpdateJoin(var_26_0)
end

function var_0_1.UpdateJoin(arg_27_0, arg_27_1, arg_27_2)
	arg_27_0.joinBtn_.interactable = true

	arg_27_0.joinBtnController_:SetSelectedState("add")

	if arg_27_0:IsOnlyCaptainToRemove() then
		arg_27_0.joinBtn_.interactable = false

		arg_27_0.joinBtnController_:SetSelectedState("cantRemove")
	elseif arg_27_0:IsHeroInTeam(arg_27_1, arg_27_2) > -1 then
		arg_27_0.joinBtnController_:SetSelectedState("out")
	end
end

function var_0_1.IsOnlyCaptainToRemove(arg_28_0)
	if arg_28_0.params_.selectHeroPos ~= 1 then
		return false
	end

	local var_28_0 = arg_28_0.params_.heroList
	local var_28_1 = var_28_0[1] ~= nil and var_28_0[2] == nil and var_28_0[3] == nil
	local var_28_2

	if var_28_1 then
		local var_28_3 = var_28_0[1]

		if arg_28_0.currentIndex_ ~= var_28_3.type then
			return false
		end

		if var_28_3.type == 1 then
			if arg_28_0.selectHeroData_.id == var_28_3.heroId then
				return true
			end
		elseif var_28_3.type == 2 and arg_28_0.selectedAssistHeroID_ == var_28_3.info.assist_hero_id and arg_28_0.selectedAssistHeroData_.member_id == var_28_3.info.member_id then
			return true
		end
	end

	return false
end

function var_0_1.UpdateAssistHeroView(arg_29_0)
	local var_29_0 = arg_29_0.selectedAssistHeroData_.assist_hero_skin

	if var_29_0 == 0 then
		var_29_0 = arg_29_0.selectedAssistHeroData_.assist_hero_id
	end

	local var_29_1 = arg_29_0.selectedAssistHeroID_

	arg_29_0.heroAvatarView_:ShowHeroModel(true)
	arg_29_0.heroAvatarView_:SetSkinId(var_29_0)

	arg_29_0.fightPowerText_.text = arg_29_0.selectedAssistHeroData_.fight_capacity

	local var_29_2 = HeroCfg[var_29_1]

	arg_29_0.nameText_.text = GetI18NText(var_29_2.name)
	arg_29_0.subNameText_.text = GetI18NText(var_29_2.suffix)

	arg_29_0.infoBtnController_:SetSelectedState("on")
	arg_29_0:UpdateJoin(arg_29_0.selectedAssistHeroData_.assist_hero_id, arg_29_0.selectedAssistHeroData_.member_id)
end

function var_0_1.AddUIListener(arg_30_0)
	arg_30_0:AddBtnListener(arg_30_0.infoBtn_, nil, function()
		if arg_30_0.currentIndex_ == 1 then
			arg_30_0:Go("/newHero", {
				isEnter = true,
				isTemp = false,
				hid = arg_30_0.selectHeroData_.id,
				tempHeroList = {}
			})
		else
			if arg_30_0.selectedAssistHeroData_ == nil then
				return
			end

			ForeignInfoAction:TryToCheckForeignHeroInfo(arg_30_0.selectedAssistHeroData_.member_id, arg_30_0.selectedAssistHeroID_, 2, function()
				JumpTools.OpenPageByJump("/newHero", {
					isForeign = true,
					isEnter = true,
					notShowBar = true,
					hid = arg_30_0.selectedAssistHeroID_,
					type = HeroConst.HERO_DATA_TYPE.FOREIGN
				}, ViewConst.SYSTEM_ID.PLAYER_INFO)
			end)
		end
	end)
	arg_30_0:AddBtnListener(arg_30_0.joinBtn_, nil, function()
		if arg_30_0:IsOnlyCaptainToRemove() then
			return
		end

		if arg_30_0.currentIndex_ == 1 then
			local var_33_0
			local var_33_1 = arg_30_0:IsHeroInTeam(arg_30_0.selectHeroData_.id)
			local var_33_2

			if var_33_1 > -1 then
				var_33_0 = nil
				var_33_2 = var_33_1
			else
				var_33_0 = arg_30_0.selectHeroData_.id
				var_33_2 = arg_30_0.params_.selectHeroPos
			end

			if var_33_0 then
				local var_33_3 = arg_30_0:GetHeroIdPosOfTeam(var_33_0)

				if var_33_3 ~= -1 and var_33_1 == -1 and var_33_3 ~= arg_30_0.params_.selectHeroPos then
					ShowTips("TEAM_REPEAT_HERO")

					return
				end
			end

			arg_30_0:OnGuildBossSelfHeroChange(var_33_2, var_33_0)
		else
			if arg_30_0.selectedAssistHeroData_ == nil then
				return
			end

			local var_33_4
			local var_33_5 = arg_30_0:IsHeroInTeam(arg_30_0.selectedAssistHeroID_, arg_30_0.selectedAssistHeroData_.member_id)
			local var_33_6

			if var_33_5 > -1 then
				var_33_4 = nil
				var_33_6 = var_33_5
			else
				var_33_4 = arg_30_0.selectedAssistHeroData_
				var_33_6 = arg_30_0.params_.selectHeroPos
			end

			if var_33_4 ~= nil then
				for iter_33_0, iter_33_1 in ipairs(arg_30_0.params_.heroList) do
					if iter_33_0 ~= arg_30_0.params_.selectHeroPos and iter_33_1.type == 2 and iter_33_1.assist_hero_id ~= var_33_4.assist_hero_id then
						ShowTips("CLUB_BOSS_ASSIST_MORE_THAN_ONE_TIP")

						return
					end
				end

				local var_33_7 = arg_30_0:GetHeroIdPosOfTeam(var_33_4.assist_hero_id)

				if var_33_7 ~= -1 and var_33_5 == -1 and var_33_7 ~= arg_30_0.params_.selectHeroPos then
					ShowTips("TEAM_REPEAT_HERO")

					return
				end
			end

			arg_30_0:OnGuildBossAssistantHeroChange(var_33_6, var_33_4)
		end

		arg_30_0:Back()
	end)
	arg_30_0:AddBtnListener(arg_30_0.myHeroToggleBtn_, nil, function()
		arg_30_0:SelectIndex(1)
	end)
	arg_30_0:AddBtnListener(arg_30_0.helpHeroToggleBtn_, nil, function()
		arg_30_0:SelectIndex(2)
	end)
end

function var_0_1.SelectIndex(arg_36_0, arg_36_1)
	arg_36_0.currentIndex_ = arg_36_1

	if arg_36_1 == 1 then
		SetActive(arg_36_0.filterGo_, true)
		SetActive(arg_36_0.assistHeroFilterGo_, false)
		arg_36_0.toggleController1_:SetSelectedState("true")
		arg_36_0.toggleController2_:SetSelectedState("false")

		local var_36_0 = HeroTools.Sort(HeroData:GetHeroListExcept({
			0
		}))

		arg_36_0.assistFilterView_:SetAvailable(false)
		arg_36_0.filterView_:SetAvailable(true)
		arg_36_0.filterView_:Reset(true)
		arg_36_0.filterView_:SetHeroIdList(var_36_0)
	else
		SetActive(arg_36_0.filterGo_, false)
		SetActive(arg_36_0.assistHeroFilterGo_, true)
		arg_36_0.toggleController1_:SetSelectedState("false")
		arg_36_0.toggleController2_:SetSelectedState("true")
		arg_36_0.filterView_:SetAvailable(false)
		arg_36_0.assistFilterView_:SetAvailable(true)
		arg_36_0.assistFilterView_:Reset(true)
		arg_36_0.assistFilterView_:SetHeroIdList(GuildData:GetAssistantBriefList())
	end
end

function var_0_1.AddEventListeners(arg_37_0)
	arg_37_0:RegistEventListener(GUILD_ASSIST_BRIEF_UPDATE, function()
		if arg_37_0.assistantHeroList_ == nil then
			return
		end

		if arg_37_0.heroAvatarView_ then
			arg_37_0.heroAvatarView_:OnEnter()
		end
	end)
	arg_37_0:RegistEventListener(GUILD_EXIT, function()
		arg_37_0:Go("/home")
	end)
end

function var_0_1.OnTop(arg_40_0)
	arg_40_0:UpdateBar()
end

function var_0_1.OnBehind(arg_41_0)
	manager.windowBar:HideBar()
end

function var_0_1.UpdateBar(arg_42_0)
	arg_42_0:ShowDefaultBar()
	manager.windowBar:RegistBackCallBack(function()
		arg_42_0:Back(1, {
			isSorted = true
		})
	end)
end

function var_0_1.IsInSelfTeam(arg_44_0, arg_44_1)
	for iter_44_0, iter_44_1 in pairs(arg_44_0.params_.heroList) do
		if iter_44_1.type == 1 and iter_44_1.heroId == arg_44_1 then
			return true
		end
	end

	return false
end

function var_0_1.IsHeroInTeam(arg_45_0, arg_45_1, arg_45_2)
	if arg_45_2 then
		for iter_45_0, iter_45_1 in pairs(arg_45_0.params_.heroList) do
			if iter_45_1.type == 2 and iter_45_1.info.assist_hero_id == arg_45_1 and iter_45_1.info.member_id == arg_45_2 then
				return iter_45_0
			end
		end

		return -1
	else
		for iter_45_2, iter_45_3 in pairs(arg_45_0.params_.heroList) do
			if iter_45_3.type == 1 and iter_45_3.heroId == arg_45_1 then
				return iter_45_2
			end
		end

		return -1
	end
end

function var_0_1.GetHeroIdPosOfTeam(arg_46_0, arg_46_1)
	for iter_46_0, iter_46_1 in pairs(arg_46_0.params_.heroList) do
		if iter_46_1.type == 2 then
			if iter_46_1.info.assist_hero_id == arg_46_1 then
				return iter_46_0
			end
		elseif iter_46_1.heroId == arg_46_1 then
			return iter_46_0
		end
	end

	return -1
end

function var_0_1.OnHeroSort(arg_47_0, arg_47_1, arg_47_2, arg_47_3, arg_47_4, arg_47_5)
	if arg_47_0.currentIndex_ == 1 then
		arg_47_0.filterView_:RefreshSort(arg_47_1, arg_47_2, arg_47_3, arg_47_4, arg_47_5)
	else
		arg_47_0.assistFilterView_:RefreshSort(arg_47_1, arg_47_2, arg_47_3, arg_47_4, arg_47_5)
	end

	HeroData:SaveSortValue(arg_47_1, arg_47_2, arg_47_3, arg_47_4, arg_47_5)
end

function var_0_1.OnExit(arg_48_0)
	if arg_48_0.filterView_ and arg_48_0.filterView_.OnExit then
		arg_48_0.filterView_:OnExit()
	end

	arg_48_0:RemoveAllEventListener()
	manager.ui:ResetMainCamera()
	manager.windowBar:HideBar()

	if arg_48_0.heroAvatarView_ then
		arg_48_0.heroAvatarView_:OnExit()
	end

	if arg_48_0.heroDataList_ and #arg_48_0.heroDataList_ <= 0 then
		HeroData:ResetSortValue()
		arg_48_0.filterView_:Reset()
	end

	if arg_48_0.assistantDataList_ and #arg_48_0.assistantDataList_ <= 0 then
		HeroData:ResetSortValue()
		arg_48_0.assistFilterView_:Reset()
	end
end

function var_0_1.OnMainHomeViewTop(arg_49_0)
	if arg_49_0.filterView_ then
		arg_49_0.filterView_:Reset(true)
	end

	if arg_49_0.assistFilterView_ then
		arg_49_0.assistFilterView_:Reset(true)
	end
end

function var_0_1.Dispose(arg_50_0)
	if arg_50_0.assistantHeroList_ then
		arg_50_0.assistantHeroList_:Dispose()

		arg_50_0.assistantHeroList_ = nil
	end

	if arg_50_0.selfHeroList_ then
		arg_50_0.selfHeroList_:Dispose()

		arg_50_0.selfHeroList_ = nil
	end

	if arg_50_0.filterView_ then
		arg_50_0.filterView_:Dispose()

		arg_50_0.filterView_ = nil
	end

	if arg_50_0.heroAvatarView_ then
		arg_50_0.heroAvatarView_:Dispose()

		arg_50_0.heroAvatarView_ = nil
	end

	if arg_50_0.assistFilterView_ then
		arg_50_0.assistFilterView_:Dispose()

		arg_50_0.assistFilterView_ = nil
	end

	var_0_1.super.Dispose(arg_50_0)
end

function var_0_1.OnGuildBossSelfHeroChange(arg_51_0, arg_51_1, arg_51_2)
	if arg_51_2 == nil then
		arg_51_2 = 0
	end

	if arg_51_2 == 0 then
		for iter_51_0 = arg_51_1, 2 do
			arg_51_0.params_.heroList[iter_51_0] = arg_51_0.params_.heroList[iter_51_0 + 1]
		end

		arg_51_0.params_.heroList[3] = nil
	else
		local var_51_0 = arg_51_0.params_.heroList[1]

		if var_51_0 ~= nil and var_51_0.type == 1 and var_51_0.heroId == arg_51_2 and arg_51_0.params_.heroList[arg_51_1] == nil then
			return
		end

		if arg_51_2 ~= nil and arg_51_2 > 0 then
			arg_51_0.params_.heroList[arg_51_1] = {
				type = 1,
				heroId = arg_51_2
			}
		else
			arg_51_0.params_.heroList[arg_51_1] = nil
		end
	end

	arg_51_0:GuildBossChangeHeroTeam(arg_51_0.params_.heroList)
end

function var_0_1.OnGuildBossAssistantHeroChange(arg_52_0, arg_52_1, arg_52_2)
	if arg_52_2 == nil then
		for iter_52_0 = arg_52_1, 2 do
			arg_52_0.params_.heroList[iter_52_0] = arg_52_0.params_.heroList[iter_52_0 + 1]
		end

		arg_52_0.params_.heroList[3] = nil
	else
		local var_52_0 = arg_52_0.params_.heroList[1]

		if var_52_0 ~= nil and var_52_0.type == 2 and var_52_0.info.assist_hero_id == arg_52_2.assist_hero_id and var_52_0.info.member_id == arg_52_2.member_id and arg_52_0.params_.heroList[arg_52_1] == nil then
			return
		end

		if arg_52_2 ~= nil then
			arg_52_0.params_.heroList[arg_52_1] = {
				type = 2,
				info = arg_52_2
			}
		else
			arg_52_0.params_.heroList[arg_52_1] = nil
		end
	end

	arg_52_0:GuildBossChangeHeroTeam(arg_52_0.params_.heroList)
end

function var_0_1.GuildBossChangeHeroTeam(arg_53_0, arg_53_1)
	local var_53_0 = {}
	local var_53_1 = {
		0,
		0,
		0
	}
	local var_53_2 = {}
	local var_53_3 = 1

	for iter_53_0 = 1, 3 do
		if arg_53_1[iter_53_0] and arg_53_1[iter_53_0].heroId ~= 0 then
			local var_53_4 = arg_53_1[iter_53_0]

			if var_53_4.type == 1 then
				var_53_0[var_53_3] = var_53_4.heroId
			elseif var_53_4.type == 2 then
				var_53_0[var_53_3] = var_53_4.info.assist_hero_id
				var_53_2[var_53_3] = var_53_4.info.member_id
			end

			var_53_3 = var_53_3 + 1
		end
	end

	local var_53_5 = ReserveTools.GetReserveTemplateByReserveType(ReserveConst.RESERVE_TYPE.GUILD_BOSS)

	var_53_5:SetHeroList(arg_53_0.params_.reserveParams, var_53_0, var_53_1)
	var_53_5:SetOwnerID(var_53_2)
end

return var_0_1
