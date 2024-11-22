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

	arg_5_0.joinBtnController_ = arg_5_0.btnPanelController_:GetController("join")
	arg_5_0.infoBtnController_ = arg_5_0.btnPanelController_:GetController("info")
	arg_5_0.heroAvatarView_ = HeroAvatarView.New(arg_5_0, arg_5_0.displayGo_)
	arg_5_0.selfHeroList_ = LuaList.New(handler(arg_5_0, arg_5_0.indexSelfHeroItem), arg_5_0.uiListGo_, SectionHeroTeamHeadItem)
	arg_5_0.assistantHeroList_ = LuaList.New(handler(arg_5_0, arg_5_0.indexAssistantItem), arg_5_0.assitUIListGo_, NewGuildBossAssistantHeadItemView)
	arg_5_0.toggleController1_ = ControllerUtil.GetController(arg_5_0.myHeroToggleBtn_.transform, "select")
	arg_5_0.toggleController2_ = ControllerUtil.GetController(arg_5_0.helpHeroToggleBtn_.transform, "select")
	arg_5_0.filterView_ = NewHeroListFilterView.New(arg_5_0.filterGo_)

	arg_5_0.filterView_:SetExtraSorter(function(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
		local var_6_0 = arg_5_0:IsInSelfTeam(arg_6_0.id) and 1 or 0
		local var_6_1 = arg_5_0:IsInSelfTeam(arg_6_1.id) and 1 or 0

		if var_6_0 ~= var_6_1 then
			return true, var_6_1 < var_6_0
		end

		return false, false
	end)
	arg_5_0.filterView_:SetListChangeHandler(handler(arg_5_0, arg_5_0.OnListChange))

	arg_5_0.assistFilterView_ = NewGuildBossAssistHeroFilterView.New(arg_5_0.assistHeroFilterGo_)

	arg_5_0.assistFilterView_:SetExtraSorter(function(arg_7_0, arg_7_1)
		local var_7_0 = GuildData:CheckCurrentHeroIDIsAssistant(arg_7_0.assist_hero_id) and 1 or 0
		local var_7_1 = GuildData:CheckCurrentHeroIDIsAssistant(arg_7_1.assist_hero_id) and 1 or 0

		if var_7_0 ~= var_7_1 then
			return true, var_7_1 < var_7_0
		end

		return false, false
	end)
	arg_5_0.assistFilterView_:SetListChangeHandler(handler(arg_5_0, arg_5_0.OnAssistListChange))
end

function var_0_1.OnEnter(arg_8_0)
	var_0_1.super.OnEnter(arg_8_0)
	arg_8_0:AddEventListeners()
	arg_8_0.assistFilterView_:OnEnter(HeroViewDataProxy.New(HeroConst.HERO_DATA_TYPE.FOREIGN))
end

function var_0_1.SubViewOnEnter(arg_9_0)
	var_0_1.super.SubViewOnEnter(arg_9_0)

	if arg_9_0.assistFilterView_ then
		arg_9_0.assistFilterView_:Reset(true)
	end
end

function var_0_1.RefreshHeroDataList(arg_10_0)
	local var_10_0 = ReserveTools.GetReserveTemplateByReserveType(ReserveConst.RESERVE_TYPE.GUILD_BOSS)

	arg_10_0.params_.heroList = var_10_0:GetCurHeroInfoList()
end

function var_0_1.RefreshHeroList(arg_11_0)
	local var_11_0 = arg_11_0.params_.heroList[arg_11_0.params_.selectHeroPos]

	if var_11_0 and var_11_0.heroId ~= 0 then
		if var_11_0.type == 1 then
			arg_11_0:SelectIndex(1)
		else
			arg_11_0:SelectIndex(2)
		end
	else
		arg_11_0:SelectIndex(1)
	end
end

function var_0_1.indexAssistantItem(arg_12_0, arg_12_1, arg_12_2)
	arg_12_2:SetSectionHeroData(arg_12_0.assistantDataList_[arg_12_1])
	arg_12_2:SetSelected(arg_12_0.selectedAssistHeroData_ ~= nil and arg_12_2:GetHeroId() == arg_12_0.selectedAssistHeroData_.assist_hero_id and arg_12_2:GetOwnerId() == arg_12_0.selectedAssistHeroData_.member_id)
	arg_12_2:SetTeamMark(arg_12_0:IsHeroInTeam(arg_12_2:GetHeroId(), arg_12_2:GetOwnerId()) > -1, GetTips("IN_TEAM"))
	arg_12_2:RegisterClickListener(function()
		arg_12_0:SelectAssistantHero(arg_12_1)
	end)
end

function var_0_1.indexSelfHeroItem(arg_14_0, arg_14_1, arg_14_2)
	local var_14_0 = arg_14_0.heroDataList_[arg_14_1].id
	local var_14_1 = arg_14_0.heroDataList_[arg_14_1].trialID

	arg_14_2:SetSectionHeroData(arg_14_0.heroDataList_[arg_14_1], arg_14_0.trialHeroList_)
	arg_14_2:SetSelected(arg_14_2.heroId_ == arg_14_0.selectHeroData_.id and arg_14_2.trialID_ == arg_14_0.selectHeroData_.trialID)
	arg_14_2:RegisterClickListener(function()
		arg_14_0:SelectSelfHero(arg_14_0.heroDataList_[arg_14_1])
	end)
	arg_14_2:SetTeamMark(arg_14_0:IsInSelfTeam(var_14_0), GetTips("IN_TEAM"))
end

function var_0_1.OnListChange(arg_16_0, arg_16_1, arg_16_2)
	arg_16_0.heroDataList_ = arg_16_2

	if arg_16_0.currentIndex_ ~= 1 then
		return
	end

	arg_16_0.selfHeroList_:StartScroll(#arg_16_0.heroDataList_)

	if #arg_16_0.heroDataList_ > 0 then
		local var_16_0 = arg_16_0:ChooseSelfFirstSelectIndex()

		if var_16_0 then
			arg_16_0.selectHeroData_ = arg_16_0.heroDataList_[var_16_0]
		else
			arg_16_0.selectHeroData_ = arg_16_0.heroDataList_[1]
		end

		arg_16_0:SelectSelfHero(arg_16_0.selectHeroData_)
	else
		arg_16_0:SelectEmptyAssistHero()
	end
end

function var_0_1.OnAssistListChange(arg_17_0, arg_17_1)
	arg_17_0.assistantDataList_ = arg_17_1

	arg_17_0.assistantHeroList_:StartScroll(#arg_17_0.assistantDataList_)

	if arg_17_0.selectedAssistHeroData_ == nil then
		if #arg_17_0.assistantDataList_ > 0 then
			local var_17_0 = arg_17_0:ChooseAssistFirstSelectIndex()

			arg_17_0:SelectAssistantHero(var_17_0)
		else
			arg_17_0:SelectEmptyAssistHero()
		end
	else
		local var_17_1 = -1

		for iter_17_0, iter_17_1 in ipairs(arg_17_0.assistantDataList_) do
			if iter_17_1 ~= nil and iter_17_1.assist_hero_id == arg_17_0.selectedAssistHeroID_ and iter_17_1.member_id == arg_17_0.selectedAssistHeroData_.member_id then
				var_17_1 = iter_17_0

				break
			end
		end

		if var_17_1 ~= -1 then
			arg_17_0:SelectAssistantHero(var_17_1)
		else
			arg_17_0:SelectEmptyAssistHero()
		end
	end
end

function var_0_1.ChooseSelfFirstSelectIndex(arg_18_0)
	local var_18_0 = arg_18_0.params_.heroList[arg_18_0.params_.selectHeroPos]

	if var_18_0 and var_18_0.heroId ~= 0 and var_18_0.type == 1 then
		local var_18_1 = var_18_0.heroId

		for iter_18_0, iter_18_1 in ipairs(arg_18_0.heroDataList_) do
			if iter_18_1.id == var_18_1 then
				return iter_18_0
			end
		end

		return 1
	end

	for iter_18_2, iter_18_3 in ipairs(arg_18_0.heroDataList_) do
		if not arg_18_0:IsInSelfTeam(iter_18_3.id) then
			return iter_18_2
		end
	end

	return 1
end

function var_0_1.ChooseAssistFirstSelectIndex(arg_19_0)
	local var_19_0 = arg_19_0.params_.heroList[arg_19_0.params_.selectHeroPos]

	if var_19_0 and var_19_0.heroId ~= 0 and var_19_0.type == 2 then
		local var_19_1

		for iter_19_0, iter_19_1 in ipairs(arg_19_0.assistantDataList_) do
			if var_19_0.info.assist_hero_id == iter_19_1.assist_hero_id and var_19_0.info.member_id == iter_19_1.member_id then
				var_19_1 = iter_19_0

				break
			end
		end

		return var_19_1
	end

	return 1
end

function var_0_1.SelectSelfHero(arg_20_0, arg_20_1)
	arg_20_0.selectHeroData_ = arg_20_1

	for iter_20_0, iter_20_1 in pairs(arg_20_0.selfHeroList_:GetItemList()) do
		iter_20_1:SetSelected(iter_20_1.heroId_ == arg_20_0.selectHeroData_.id)
	end

	arg_20_0:UpdateSelfHeroView()
end

function var_0_1.SelectEmptyAssistHero(arg_21_0)
	arg_21_0.heroAvatarView_:ShowHeroModel(false)

	arg_21_0.fightPowerText_.text = "--"
	arg_21_0.nameText_.text = "--"
	arg_21_0.subNameText_.text = "--"

	arg_21_0.infoBtnController_:SetSelectedState("off")

	arg_21_0.joinBtn_.interactable = false

	arg_21_0.joinBtnController_:SetSelectedState("cantAdd")
end

function var_0_1.SelectAssistantHero(arg_22_0, arg_22_1)
	local var_22_0 = arg_22_0.assistantDataList_[arg_22_1]

	arg_22_0.selectedAssistHeroID_ = var_22_0.assist_hero_id
	arg_22_0.selectedAssistHeroData_ = var_22_0

	arg_22_0.assistantHeroList_:Refresh()
	arg_22_0:UpdateAssistHeroView()
end

function var_0_1.UpdateSelfHeroView(arg_23_0)
	local var_23_0 = arg_23_0.selectHeroData_.id
	local var_23_1 = arg_23_0.selectHeroData_.heroViewProxy:GetHeroUsingSkinInfo(var_23_0, {
		arg_23_0.selectHeroData_.trialID
	}).id

	arg_23_0.heroAvatarView_:ShowHeroModel(true)
	arg_23_0.heroAvatarView_:SetSkinId(var_23_1)

	arg_23_0.fightPowerText_.text = getHeroPower(var_23_0, false)

	local var_23_2 = HeroCfg[var_23_0]

	arg_23_0.nameText_.text = GetI18NText(var_23_2.name)
	arg_23_0.subNameText_.text = GetI18NText(var_23_2.suffix)

	arg_23_0.infoBtnController_:SetSelectedState("on")
	arg_23_0:UpdateJoin(var_23_0)
end

function var_0_1.UpdateJoin(arg_24_0, arg_24_1, arg_24_2)
	arg_24_0.joinBtn_.interactable = true

	arg_24_0.joinBtnController_:SetSelectedState("add")

	if arg_24_0:IsOnlyCaptainToRemove() then
		arg_24_0.joinBtn_.interactable = false

		arg_24_0.joinBtnController_:SetSelectedState("cantRemove")
	elseif arg_24_0:IsHeroInTeam(arg_24_1, arg_24_2) > -1 then
		arg_24_0.joinBtnController_:SetSelectedState("out")
	end
end

function var_0_1.IsOnlyCaptainToRemove(arg_25_0)
	if arg_25_0.params_.selectHeroPos ~= 1 then
		return false
	end

	local var_25_0 = arg_25_0.params_.heroList
	local var_25_1 = var_25_0[1] ~= nil and var_25_0[2] == nil and var_25_0[3] == nil
	local var_25_2

	if var_25_1 then
		local var_25_3 = var_25_0[1]

		if arg_25_0.currentIndex_ ~= var_25_3.type then
			return false
		end

		if var_25_3.type == 1 then
			if arg_25_0.selectHeroData_.id == var_25_3.heroId then
				return true
			end
		elseif var_25_3.type == 2 and arg_25_0.selectedAssistHeroID_ == var_25_3.info.assist_hero_id and arg_25_0.selectedAssistHeroData_.member_id == var_25_3.info.member_id then
			return true
		end
	end

	return false
end

function var_0_1.UpdateAssistHeroView(arg_26_0)
	local var_26_0 = arg_26_0.selectedAssistHeroData_.assist_hero_skin

	if var_26_0 == 0 then
		var_26_0 = arg_26_0.selectedAssistHeroData_.assist_hero_id
	end

	local var_26_1 = arg_26_0.selectedAssistHeroID_

	arg_26_0.heroAvatarView_:ShowHeroModel(true)
	arg_26_0.heroAvatarView_:SetSkinId(var_26_0)

	arg_26_0.fightPowerText_.text = arg_26_0.selectedAssistHeroData_.fight_capacity

	local var_26_2 = HeroCfg[var_26_1]

	arg_26_0.nameText_.text = GetI18NText(var_26_2.name)
	arg_26_0.subNameText_.text = GetI18NText(var_26_2.suffix)

	arg_26_0.infoBtnController_:SetSelectedState("on")
	arg_26_0:UpdateJoin(arg_26_0.selectedAssistHeroData_.assist_hero_id, arg_26_0.selectedAssistHeroData_.member_id)
end

function var_0_1.AddUIListener(arg_27_0)
	arg_27_0:AddBtnListener(arg_27_0.infoBtn_, nil, function()
		if arg_27_0.currentIndex_ == 1 then
			arg_27_0:Go("/newHero", {
				isEnter = true,
				isTemp = false,
				hid = arg_27_0.selectHeroData_.id,
				tempHeroList = {}
			})
		else
			if arg_27_0.selectedAssistHeroData_ == nil then
				return
			end

			ForeignInfoAction:TryToCheckForeignHeroInfo(arg_27_0.selectedAssistHeroData_.member_id, arg_27_0.selectedAssistHeroID_, 2, function()
				JumpTools.OpenPageByJump("/newHero", {
					isForeign = true,
					isEnter = true,
					notShowBar = true,
					hid = arg_27_0.selectedAssistHeroID_,
					type = HeroConst.HERO_DATA_TYPE.FOREIGN
				}, ViewConst.SYSTEM_ID.PLAYER_INFO)
			end)
		end
	end)
	arg_27_0:AddBtnListener(arg_27_0.joinBtn_, nil, function()
		if arg_27_0:IsOnlyCaptainToRemove() then
			return
		end

		if arg_27_0.currentIndex_ == 1 then
			local var_30_0
			local var_30_1 = arg_27_0:IsHeroInTeam(arg_27_0.selectHeroData_.id)
			local var_30_2

			if var_30_1 > -1 then
				var_30_0 = nil
				var_30_2 = var_30_1
			else
				var_30_0 = arg_27_0.selectHeroData_.id
				var_30_2 = arg_27_0.params_.selectHeroPos
			end

			if var_30_0 then
				local var_30_3 = arg_27_0:GetHeroIdPosOfTeam(var_30_0)

				if var_30_3 ~= -1 and var_30_1 == -1 and var_30_3 ~= arg_27_0.params_.selectHeroPos then
					ShowTips("TEAM_REPEAT_HERO")

					return
				end
			end

			arg_27_0:OnGuildBossSelfHeroChange(var_30_2, var_30_0)
		else
			if arg_27_0.selectedAssistHeroData_ == nil then
				return
			end

			local var_30_4
			local var_30_5 = arg_27_0:IsHeroInTeam(arg_27_0.selectedAssistHeroID_, arg_27_0.selectedAssistHeroData_.member_id)
			local var_30_6

			if var_30_5 > -1 then
				var_30_4 = nil
				var_30_6 = var_30_5
			else
				var_30_4 = arg_27_0.selectedAssistHeroData_
				var_30_6 = arg_27_0.params_.selectHeroPos
			end

			if var_30_4 ~= nil then
				for iter_30_0, iter_30_1 in ipairs(arg_27_0.params_.heroList) do
					if iter_30_0 ~= arg_27_0.params_.selectHeroPos and iter_30_1.type == 2 and iter_30_1.assist_hero_id ~= var_30_4.assist_hero_id then
						ShowTips("CLUB_BOSS_ASSIST_MORE_THAN_ONE_TIP")

						return
					end
				end

				local var_30_7 = arg_27_0:GetHeroIdPosOfTeam(var_30_4.assist_hero_id)

				if var_30_7 ~= -1 and var_30_5 == -1 and var_30_7 ~= arg_27_0.params_.selectHeroPos then
					ShowTips("TEAM_REPEAT_HERO")

					return
				end
			end

			arg_27_0:OnGuildBossAssistantHeroChange(var_30_6, var_30_4)
		end

		arg_27_0:Back()
	end)
	arg_27_0:AddBtnListener(arg_27_0.myHeroToggleBtn_, nil, function()
		arg_27_0:SelectIndex(1)
	end)
	arg_27_0:AddBtnListener(arg_27_0.helpHeroToggleBtn_, nil, function()
		arg_27_0:SelectIndex(2)
	end)
end

function var_0_1.SelectIndex(arg_33_0, arg_33_1)
	arg_33_0.currentIndex_ = arg_33_1

	if arg_33_1 == 1 then
		SetActive(arg_33_0.filterGo_, true)
		SetActive(arg_33_0.assistHeroFilterGo_, false)
		arg_33_0.toggleController1_:SetSelectedState("true")
		arg_33_0.toggleController2_:SetSelectedState("false")

		local var_33_0 = HeroTools.Sort(HeroData:GetHeroListExcept({
			0
		}))

		arg_33_0.assistFilterView_:SetAvailable(false)
		arg_33_0.filterView_:SetAvailable(true)
		arg_33_0.filterView_:Reset(true)
		arg_33_0.filterView_:SetHeroIdList(var_33_0)
	else
		SetActive(arg_33_0.filterGo_, false)
		SetActive(arg_33_0.assistHeroFilterGo_, true)
		arg_33_0.toggleController1_:SetSelectedState("false")
		arg_33_0.toggleController2_:SetSelectedState("true")
		arg_33_0.filterView_:SetAvailable(false)
		arg_33_0.assistFilterView_:SetAvailable(true)
		arg_33_0.assistFilterView_:Reset(true)
		arg_33_0.assistFilterView_:SetHeroIdList(GuildData:GetAssistantBriefList())
	end
end

function var_0_1.AddEventListeners(arg_34_0)
	arg_34_0:RegistEventListener(GUILD_ASSIST_BRIEF_UPDATE, function()
		if arg_34_0.assistantHeroList_ == nil then
			return
		end

		if arg_34_0.heroAvatarView_ then
			arg_34_0.heroAvatarView_:OnEnter()
		end
	end)
	arg_34_0:RegistEventListener(GUILD_EXIT, function()
		arg_34_0:Go("/home")
	end)
end

function var_0_1.OnTop(arg_37_0)
	arg_37_0:UpdateBar()
end

function var_0_1.OnBehind(arg_38_0)
	manager.windowBar:HideBar()
end

function var_0_1.UpdateBar(arg_39_0)
	arg_39_0:ShowDefaultBar()
	manager.windowBar:RegistBackCallBack(function()
		arg_39_0:Back(1, {
			isSorted = true
		})
	end)
end

function var_0_1.IsInSelfTeam(arg_41_0, arg_41_1)
	for iter_41_0, iter_41_1 in pairs(arg_41_0.params_.heroList) do
		if iter_41_1.type == 1 and iter_41_1.heroId == arg_41_1 then
			return true
		end
	end

	return false
end

function var_0_1.IsHeroInTeam(arg_42_0, arg_42_1, arg_42_2)
	if arg_42_2 then
		for iter_42_0, iter_42_1 in pairs(arg_42_0.params_.heroList) do
			if iter_42_1.type == 2 and iter_42_1.info.assist_hero_id == arg_42_1 and iter_42_1.info.member_id == arg_42_2 then
				return iter_42_0
			end
		end

		return -1
	else
		for iter_42_2, iter_42_3 in pairs(arg_42_0.params_.heroList) do
			if iter_42_3.type == 1 and iter_42_3.heroId == arg_42_1 then
				return iter_42_2
			end
		end

		return -1
	end
end

function var_0_1.GetHeroIdPosOfTeam(arg_43_0, arg_43_1)
	for iter_43_0, iter_43_1 in pairs(arg_43_0.params_.heroList) do
		if iter_43_1.type == 2 then
			if iter_43_1.info.assist_hero_id == arg_43_1 then
				return iter_43_0
			end
		elseif iter_43_1.heroId == arg_43_1 then
			return iter_43_0
		end
	end

	return -1
end

function var_0_1.OnHeroSort(arg_44_0, arg_44_1, arg_44_2, arg_44_3, arg_44_4, arg_44_5)
	if arg_44_0.currentIndex_ == 1 then
		arg_44_0.filterView_:RefreshSort(arg_44_1, arg_44_2, arg_44_3, arg_44_4, arg_44_5)
	else
		arg_44_0.assistFilterView_:RefreshSort(arg_44_1, arg_44_2, arg_44_3, arg_44_4, arg_44_5)
	end

	HeroData:SaveSortValue(arg_44_1, arg_44_2, arg_44_3, arg_44_4, arg_44_5)
end

function var_0_1.OnExit(arg_45_0)
	if arg_45_0.filterView_ and arg_45_0.filterView_.OnExit then
		arg_45_0.filterView_:OnExit()
	end

	arg_45_0:RemoveAllEventListener()
	manager.ui:ResetMainCamera()
	manager.windowBar:HideBar()

	if arg_45_0.heroAvatarView_ then
		arg_45_0.heroAvatarView_:OnExit()
	end

	if arg_45_0.heroDataList_ and #arg_45_0.heroDataList_ <= 0 then
		HeroData:ResetSortValue()
		arg_45_0.filterView_:Reset()
	end

	if arg_45_0.assistantDataList_ and #arg_45_0.assistantDataList_ <= 0 then
		HeroData:ResetSortValue()
		arg_45_0.assistFilterView_:Reset()
	end
end

function var_0_1.OnMainHomeViewTop(arg_46_0)
	if arg_46_0.filterView_ then
		arg_46_0.filterView_:Reset(true)
	end

	if arg_46_0.assistFilterView_ then
		arg_46_0.assistFilterView_:Reset(true)
	end
end

function var_0_1.Dispose(arg_47_0)
	if arg_47_0.assistantHeroList_ then
		arg_47_0.assistantHeroList_:Dispose()

		arg_47_0.assistantHeroList_ = nil
	end

	if arg_47_0.selfHeroList_ then
		arg_47_0.selfHeroList_:Dispose()

		arg_47_0.selfHeroList_ = nil
	end

	if arg_47_0.filterView_ then
		arg_47_0.filterView_:Dispose()

		arg_47_0.filterView_ = nil
	end

	if arg_47_0.heroAvatarView_ then
		arg_47_0.heroAvatarView_:Dispose()

		arg_47_0.heroAvatarView_ = nil
	end

	if arg_47_0.assistFilterView_ then
		arg_47_0.assistFilterView_:Dispose()

		arg_47_0.assistFilterView_ = nil
	end

	var_0_1.super.Dispose(arg_47_0)
end

function var_0_1.OnGuildBossSelfHeroChange(arg_48_0, arg_48_1, arg_48_2)
	if arg_48_2 == nil then
		arg_48_2 = 0
	end

	if arg_48_2 == 0 then
		for iter_48_0 = arg_48_1, 2 do
			arg_48_0.params_.heroList[iter_48_0] = arg_48_0.params_.heroList[iter_48_0 + 1]
		end

		arg_48_0.params_.heroList[3] = nil
	else
		local var_48_0 = arg_48_0.params_.heroList[1]

		if var_48_0 ~= nil and var_48_0.type == 1 and var_48_0.heroId == arg_48_2 and arg_48_0.params_.heroList[arg_48_1] == nil then
			return
		end

		if arg_48_2 ~= nil and arg_48_2 > 0 then
			arg_48_0.params_.heroList[arg_48_1] = {
				type = 1,
				heroId = arg_48_2
			}
		else
			arg_48_0.params_.heroList[arg_48_1] = nil
		end
	end

	arg_48_0:GuildBossChangeHeroTeam(arg_48_0.params_.heroList)
end

function var_0_1.OnGuildBossAssistantHeroChange(arg_49_0, arg_49_1, arg_49_2)
	if arg_49_2 == nil then
		for iter_49_0 = arg_49_1, 2 do
			arg_49_0.params_.heroList[iter_49_0] = arg_49_0.params_.heroList[iter_49_0 + 1]
		end

		arg_49_0.params_.heroList[3] = nil
	else
		local var_49_0 = arg_49_0.params_.heroList[1]

		if var_49_0 ~= nil and var_49_0.type == 2 and var_49_0.info.assist_hero_id == arg_49_2.assist_hero_id and var_49_0.info.member_id == arg_49_2.member_id and arg_49_0.params_.heroList[arg_49_1] == nil then
			return
		end

		if arg_49_2 ~= nil then
			arg_49_0.params_.heroList[arg_49_1] = {
				type = 2,
				info = arg_49_2
			}
		else
			arg_49_0.params_.heroList[arg_49_1] = nil
		end
	end

	arg_49_0:GuildBossChangeHeroTeam(arg_49_0.params_.heroList)
end

function var_0_1.GuildBossChangeHeroTeam(arg_50_0, arg_50_1)
	local var_50_0 = {}
	local var_50_1 = {
		0,
		0,
		0
	}
	local var_50_2 = {}
	local var_50_3 = 1

	for iter_50_0 = 1, 3 do
		if arg_50_1[iter_50_0] and arg_50_1[iter_50_0].heroId ~= 0 then
			local var_50_4 = arg_50_1[iter_50_0]

			if var_50_4.type == 1 then
				var_50_0[var_50_3] = var_50_4.heroId
			elseif var_50_4.type == 2 then
				var_50_0[var_50_3] = var_50_4.info.assist_hero_id
				var_50_2[var_50_3] = var_50_4.info.member_id
			end

			var_50_3 = var_50_3 + 1
		end
	end

	local var_50_5 = ReserveTools.GetReserveTemplateByReserveType(ReserveConst.RESERVE_TYPE.GUILD_BOSS)

	var_50_5:SetHeroList(arg_50_0.params_.reserveParams, var_50_0, var_50_1)
	var_50_5:SetOwnerID(var_50_2)
end

return var_0_1
