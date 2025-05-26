local var_0_0 = class("NewHeroTeamInfoBaseView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/System/Formation/FormationHeroUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:InitUI()
	arg_3_0:AddUIListener()
end

function var_0_0.InitUI(arg_4_0)
	arg_4_0:BindCfgUI()

	arg_4_0.heroHeadList_ = LuaList.New(handler(arg_4_0, arg_4_0.HeadRenderer), arg_4_0.uiListGo_, arg_4_0:GetHeroHeadClass())

	arg_4_0:InitSubView()
	arg_4_0:InitController()
end

function var_0_0.InitSubView(arg_5_0)
	arg_5_0.filterView_ = arg_5_0:GetFilterClass().New(arg_5_0.filterGo_)

	arg_5_0.filterView_:SetExtraSorter(handler(arg_5_0, arg_5_0.ExtraSorter))
	arg_5_0.filterView_:SetListChangeHandler(handler(arg_5_0, arg_5_0.OnListChange))

	arg_5_0.autoClearFilter_ = true
	arg_5_0.heroAvatarView_ = HeroAvatarView.New(arg_5_0, arg_5_0.displayGo_)
	arg_5_0.heroInfoView_ = SectionHeroInfoView.New(arg_5_0, arg_5_0.heroInfoGo_)
end

function var_0_0.InitController(arg_6_0)
	arg_6_0.emptyController_ = arg_6_0.controller_:GetController("empty")
	arg_6_0.joinBtnController_ = arg_6_0.btnPanelController_:GetController("join")
	arg_6_0.infoBtnController_ = arg_6_0.btnPanelController_:GetController("info")
end

function var_0_0.AddUIListener(arg_7_0)
	arg_7_0:AddBtnListener(arg_7_0.infoBtn_, nil, handler(arg_7_0, arg_7_0.OnInfoBtnClick))
	arg_7_0:AddBtnListener(arg_7_0.joinBtn_, nil, handler(arg_7_0, arg_7_0.OnJoinClick))
end

function var_0_0.OnEnter(arg_8_0)
	arg_8_0:ProcessCamera()
	arg_8_0:UpdateBar()
	arg_8_0:ProcessParams()
	arg_8_0:SubViewOnEnter()
	arg_8_0:GetHeroTeam()
	arg_8_0:RefreshHeroDataList()
	arg_8_0:RefreshHeroList()
end

function var_0_0.OnTop(arg_9_0)
	manager.windowBar:RegistBackCallBack(function()
		arg_9_0:Back(1, {
			isSorted = true
		})
	end)
end

function var_0_0.OnExit(arg_11_0)
	arg_11_0.params_.curSelectHeroData = arg_11_0.selectHeroData_

	manager.ui:ResetMainCamera()
	manager.windowBar:HideBar()
	arg_11_0:SubViewOnExit()
end

function var_0_0.Dispose(arg_12_0)
	if arg_12_0.filterView_ then
		arg_12_0.filterView_:Dispose()

		arg_12_0.filterView_ = nil
	end

	if arg_12_0.heroHeadList_ then
		arg_12_0.heroHeadList_:Dispose()

		arg_12_0.heroHeadList_ = nil
	end

	if arg_12_0.heroAvatarView_ then
		arg_12_0.heroAvatarView_:Dispose()

		arg_12_0.heroAvatarView_ = nil
	end

	if arg_12_0.heroInfoView_ then
		arg_12_0.heroInfoView_:Dispose()

		arg_12_0.heroInfoView_ = nil
	end

	var_0_0.super.Dispose(arg_12_0)
end

function var_0_0.ProcessCamera(arg_13_0)
	manager.ui:SetMainCamera("hero")
end

function var_0_0.UpdateBar(arg_14_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR
	})
end

function var_0_0.ProcessParams(arg_15_0)
	arg_15_0:ProcessBaseParams()
	arg_15_0:ProcessReserveParams()
	arg_15_0:ProcessProxyParams()
	arg_15_0:ProcessCustomParams()
end

function var_0_0.ProcessBaseParams(arg_16_0)
	arg_16_0.stageID_ = arg_16_0.params_.stageID
	arg_16_0.stageType_ = arg_16_0.params_.stageType or BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_UNDEFINED
	arg_16_0.activityID_ = arg_16_0.params_.activityID
	arg_16_0.params_.selectHeroPos = arg_16_0.params_.selectHeroPos or 1
end

function var_0_0.ProcessReserveParams(arg_17_0)
	if not arg_17_0.params_.reserveParams then
		arg_17_0.params_.reserveParams = ReserveTools.GetReserveParams(arg_17_0.stageType_, arg_17_0.stageID_, arg_17_0.activityID_)
	elseif not arg_17_0.params_.reserveParams.customData.activityID then
		arg_17_0.params_.reserveParams.customData.activityID = arg_17_0.activityID_
	end

	arg_17_0.reserveParams_ = arg_17_0.params_.reserveParams
end

function var_0_0.ProcessProxyParams(arg_18_0)
	arg_18_0.params_.heroDataType = arg_18_0.params_.heroDataType or HeroConst.HERO_DATA_TYPE.DEFAULT
	arg_18_0.heroDataType_ = arg_18_0.params_.heroDataType

	if not arg_18_0.params_.sectionProxy then
		arg_18_0.params_.sectionProxy = SectionSelectHeroTools.GetProxy(arg_18_0.params_, arg_18_0.reserveParams_, arg_18_0.heroDataType_)
	end

	arg_18_0.sectionProxy_ = arg_18_0.params_.sectionProxy
	arg_18_0.heroViewProxy_ = arg_18_0.sectionProxy_:GetHeroViewProxy()
	arg_18_0.heroViewProxyDic_ = {}
	arg_18_0.heroViewProxyDic_[arg_18_0.heroDataType_] = arg_18_0.heroViewProxy_
end

function var_0_0.ProcessCustomParams(arg_19_0)
	return
end

function var_0_0.SubViewOnEnter(arg_20_0)
	arg_20_0.heroAvatarView_:OnEnter()

	if not arg_20_0.params_.isBack and arg_20_0.filterView_ and arg_20_0.autoClearFilter_ then
		arg_20_0.filterView_:Reset(true)
		CommonFilterData:ClearFilter(Filter_Root_Define.Hero_Filter_List.filter_id)
	end

	arg_20_0.filterView_:OnEnter(arg_20_0.heroViewProxy_)

	if arg_20_0.heroInfoView_ then
		arg_20_0.heroInfoView_:OnEnter(arg_20_0.heroViewProxy_)
	end
end

function var_0_0.SubViewOnExit(arg_21_0)
	arg_21_0.heroAvatarView_:OnExit()

	if arg_21_0.filterView_ and arg_21_0.filterView_.OnExit then
		arg_21_0.filterView_:OnExit()
	end

	if #arg_21_0.heroDataList_ <= 0 then
		HeroData:ResetSortValue()
		arg_21_0.filterView_:Reset()
	end

	arg_21_0.heroInfoView_:OnExit()
end

function var_0_0.RefreshHeroDataList(arg_22_0)
	local var_22_0 = {}

	arg_22_0.allTrialIDList_ = {}
	arg_22_0.customHeroList_, arg_22_0.canSwitchResctrictHeroList_ = SectionSelectHeroTools.GetRestrictHeroList(arg_22_0.params_.stageType, arg_22_0.params_.stageID)
	arg_22_0.curCanSwitchRestrictHero_ = arg_22_0.canSwitchResctrictHeroList_[arg_22_0.params_.selectHeroPos] ~= ReserveConst.RESTRICT_HERO_SWITCH_MODE.FORBID

	local var_22_1
	local var_22_2
	local var_22_3, var_22_4 = SectionSelectHeroTools.GetRestrictHeroPosDic(arg_22_0.params_.stageType, arg_22_0.params_.stageID)

	if arg_22_0.customHeroList_[arg_22_0.params_.selectHeroPos][1] then
		arg_22_0:ProcessCustomHeroData(var_22_0, var_22_4)
	else
		arg_22_0:ProcessOwnHeroData(var_22_0, var_22_3)
		arg_22_0:ProcessTrialHeroData(var_22_0, var_22_4)
	end

	for iter_22_0, iter_22_1 in pairs(arg_22_0.heroViewProxyDic_) do
		iter_22_1:SetTempHeroList(arg_22_0.allTrialIDList_)
	end

	arg_22_0.filterView_:SetHeroIdList(var_22_0)
end

function var_0_0.ProcessCustomHeroData(arg_23_0, arg_23_1, arg_23_2)
	if arg_23_0.curCanSwitchRestrictHero_ == true then
		local var_23_0 = 1
		local var_23_1 = 2

		while var_23_0 <= #arg_23_0.customHeroList_[arg_23_0.params_.selectHeroPos] and var_23_1 <= #arg_23_0.customHeroList_[arg_23_0.params_.selectHeroPos] do
			local var_23_2 = arg_23_0.customHeroList_[arg_23_0.params_.selectHeroPos][var_23_0]
			local var_23_3 = arg_23_0.customHeroList_[arg_23_0.params_.selectHeroPos][var_23_1]

			arg_23_0:InsertHeroDataList(arg_23_1, var_23_2, var_23_3, HeroConst.HERO_DATA_TYPE.TRIAL)

			if arg_23_0.canSwitchResctrictHeroList_[arg_23_0.params_.selectHeroPos] == ReserveConst.RESTRICT_HERO_SWITCH_MODE.OWN_AND_TRIAL and HeroTools.GetHeroIsUnlock(var_23_2) then
				arg_23_0:InsertHeroDataList(arg_23_1, var_23_2, 0, arg_23_0.heroDataType_)
			end

			var_23_0 = var_23_0 + 2
			var_23_1 = var_23_1 + 2
		end
	else
		for iter_23_0, iter_23_1 in pairs(arg_23_2) do
			arg_23_0:InsertHeroDataList(arg_23_1, HeroStandardSystemCfg[iter_23_0].hero_id, iter_23_0, HeroConst.HERO_DATA_TYPE.TRIAL)
		end
	end
end

function var_0_0.ProcessOwnHeroData(arg_24_0, arg_24_1, arg_24_2)
	for iter_24_0, iter_24_1 in pairs(arg_24_0:GetHeroList()) do
		if not arg_24_2[iter_24_1] then
			arg_24_0:InsertHeroDataList(arg_24_1, iter_24_1, 0, arg_24_0.heroDataType_)
		end
	end
end

function var_0_0.ProcessTrialHeroData(arg_25_0, arg_25_1, arg_25_2)
	local var_25_0 = arg_25_0:GetTrialHeroList()

	for iter_25_0, iter_25_1 in pairs(var_25_0) do
		if not arg_25_2[iter_25_1] then
			arg_25_0:InsertHeroDataList(arg_25_1, HeroStandardSystemCfg[iter_25_1].hero_id, iter_25_1, HeroConst.HERO_DATA_TYPE.TRIAL)
		end
	end
end

function var_0_0.InsertHeroDataList(arg_26_0, arg_26_1, arg_26_2, arg_26_3, arg_26_4)
	table.insert(arg_26_1, {
		id = arg_26_2,
		trialID = arg_26_3,
		type = arg_26_4,
		heroViewProxy = arg_26_0:GetHeroViewProxy(arg_26_4)
	})

	if arg_26_3 and arg_26_3 ~= 0 then
		table.insert(arg_26_0.allTrialIDList_, arg_26_3)
	end
end

function var_0_0.RefreshHeroList(arg_27_0)
	if #arg_27_0.heroDataList_ <= 0 then
		return
	end

	arg_27_0.selectHeroData_ = arg_27_0:GetDefaultHeroData()

	local var_27_0 = 1

	for iter_27_0, iter_27_1 in ipairs(arg_27_0.heroDataList_) do
		if iter_27_1.id == arg_27_0.selectHeroData_.id and iter_27_1.trialID == arg_27_0.selectHeroData_.trialID then
			var_27_0 = iter_27_0

			break
		end
	end

	arg_27_0.heroHeadList_:StartScroll(#arg_27_0.heroDataList_, var_27_0)
	arg_27_0:SelectHero(arg_27_0.selectHeroData_)
end

function var_0_0.SelectHero(arg_28_0, arg_28_1)
	arg_28_0.selectHeroData_ = arg_28_1

	for iter_28_0, iter_28_1 in pairs(arg_28_0.heroHeadList_:GetItemList()) do
		iter_28_1:SetSelected(iter_28_1.heroId_ == arg_28_0.selectHeroData_.id and iter_28_1.trialID_ == arg_28_0.selectHeroData_.trialID)
	end

	arg_28_0:RefreshInfoBtn()
	arg_28_0:UpdateHeroView()
	arg_28_0:RefreshJoinBtn()
end

function var_0_0.RefreshInfoBtn(arg_29_0)
	if arg_29_0.params_.hideInfoBtn or HeroTools.NeedHideInfo(arg_29_0.selectHeroData_.id) or HeroTools.IsNPC(arg_29_0.selectHeroData_.id) then
		arg_29_0.infoBtnController_:SetSelectedState("off")
	else
		arg_29_0.infoBtnController_:SetSelectedState("on")
	end
end

function var_0_0.UpdateHeroView(arg_30_0)
	local var_30_0 = arg_30_0.selectHeroData_.id
	local var_30_1 = arg_30_0.selectHeroData_.heroViewProxy:GetHeroData(var_30_0, {
		arg_30_0.selectHeroData_.trialID
	})
	local var_30_2 = arg_30_0.selectHeroData_.heroViewProxy:GetHeroUsingSkinInfo(var_30_0, {
		arg_30_0.selectHeroData_.trialID
	}).id

	arg_30_0.heroAvatarView_:SetSkinId(var_30_2)
	arg_30_0.heroInfoView_:SetProxy(arg_30_0.selectHeroData_.heroViewProxy)
	arg_30_0.heroInfoView_:SetHeroInfo(var_30_1)
	arg_30_0.heroInfoView_:UpdateView()
end

function var_0_0.RefreshJoinBtn(arg_31_0)
	arg_31_0.joinBtn_.interactable = true

	if arg_31_0.lockStateList_[arg_31_0.params_.selectHeroPos] == true then
		arg_31_0.joinBtnController_:SetSelectedState("lock")

		arg_31_0.joinBtn_.interactable = false
	elseif table.keyof(arg_31_0.lockHeroList_, arg_31_0.selectHeroData_.id) or table.keyof(arg_31_0.lockHeroList_, arg_31_0.selectHeroData_.trialID) then
		arg_31_0.joinBtnController_:SetSelectedState("lock")

		arg_31_0.joinBtn_.interactable = false
	elseif arg_31_0:IsSameHeroInTeam(arg_31_0.selectHeroData_.id) and not arg_31_0:IsInTeam(arg_31_0.selectHeroData_.id, arg_31_0.selectHeroData_.trialID) then
		if arg_31_0.heroTeam_[arg_31_0.params_.selectHeroPos] ~= arg_31_0.selectHeroData_.id then
			arg_31_0.joinBtnController_:SetSelectedState("lock")

			arg_31_0.joinBtn_.interactable = false
		else
			arg_31_0.joinBtnController_:SetSelectedState("change")
		end
	elseif arg_31_0.heroTeam_[arg_31_0.params_.selectHeroPos] == 0 then
		if arg_31_0:IsInTeam(arg_31_0.selectHeroData_.id, arg_31_0.selectHeroData_.trialID) then
			arg_31_0.joinBtnController_:SetSelectedState("change")
		else
			arg_31_0.joinBtnController_:SetSelectedState("add")
		end
	elseif arg_31_0.selectHeroData_.id == arg_31_0.heroTeam_[arg_31_0.params_.selectHeroPos] then
		if arg_31_0.customHeroList_[arg_31_0.params_.selectHeroPos][1] and arg_31_0.curCanSwitchRestrictHero_ == true then
			arg_31_0.joinBtnController_:SetSelectedState("cantRemove")

			arg_31_0.joinBtn_.interactable = false
		else
			local var_31_0 = 0

			for iter_31_0, iter_31_1 in pairs(arg_31_0.heroTeam_) do
				if iter_31_1 ~= 0 then
					var_31_0 = var_31_0 + 1
				end
			end

			if var_31_0 == 1 and not arg_31_0.params_.canCleanTeam then
				arg_31_0.joinBtn_.interactable = false

				arg_31_0.joinBtnController_:SetSelectedState("cantRemove")
			else
				arg_31_0.joinBtnController_:SetSelectedState("out")
			end
		end
	else
		arg_31_0.joinBtnController_:SetSelectedState("change")
	end
end

function var_0_0.GetHeroTeam(arg_32_0)
	arg_32_0.heroTeam_, arg_32_0.lockStateList_, arg_32_0.lockHeroList_, arg_32_0.heroTrialList_ = arg_32_0.sectionProxy_:CustomGetTeamData()
end

function var_0_0.GetHeroList(arg_33_0)
	local var_33_0 = {}

	if arg_33_0.params_.canUseOwnHero ~= false then
		var_33_0 = HeroTools.Sort(HeroData:GetHeroList())
	end

	return var_33_0
end

function var_0_0.GetDefaultHeroData(arg_34_0)
	if arg_34_0.params_.curSelectHeroData and arg_34_0.params_.curSelectHeroData.id ~= 0 then
		for iter_34_0, iter_34_1 in ipairs(arg_34_0.heroDataList_) do
			if iter_34_1.id == arg_34_0.params_.curSelectHeroData.id and iter_34_1.trialID == arg_34_0.params_.curSelectHeroData.trialID then
				return arg_34_0.params_.curSelectHeroData
			end
		end
	end

	if not arg_34_0.params_.isBack then
		local var_34_0 = arg_34_0.heroTeam_[arg_34_0.params_.selectHeroPos] or 0
		local var_34_1 = arg_34_0.heroTrialList_[arg_34_0.params_.selectHeroPos] or 0

		if var_34_0 ~= 0 then
			for iter_34_2, iter_34_3 in ipairs(arg_34_0.heroDataList_) do
				if iter_34_3.id == var_34_0 and iter_34_3.trialID == var_34_1 then
					return iter_34_3
				end
			end

			return {
				id = var_34_0,
				trialID = var_34_1,
				type = arg_34_0.heroDataType_,
				heroViewProxy = arg_34_0:GetHeroViewProxy(arg_34_0.heroDataType_)
			}
		end
	end

	for iter_34_4, iter_34_5 in ipairs(arg_34_0.heroDataList_) do
		local var_34_2 = iter_34_5.id
		local var_34_3 = iter_34_5.trialID

		if not arg_34_0:IsInTeam(var_34_2, iter_34_5.trialID) and not table.keyof(arg_34_0.lockHeroList_, var_34_2) and not table.keyof(arg_34_0.lockHeroList_, var_34_3) then
			return iter_34_5
		end
	end

	if #arg_34_0.heroDataList_ > 0 then
		return arg_34_0.heroDataList_[1]
	end

	return nil
end

function var_0_0.OnInfoBtnClick(arg_35_0)
	arg_35_0:Go("/newHero", {
		isEnter = true,
		hid = arg_35_0.selectHeroData_.trialID ~= 0 and arg_35_0.selectHeroData_.trialID or arg_35_0.selectHeroData_.id,
		type = arg_35_0.selectHeroData_.trialID ~= 0 and HeroConst.HERO_DATA_TYPE.TRIAL or arg_35_0.heroDataType_,
		tempHeroList = arg_35_0:GetValidTrailList()
	})
end

function var_0_0.GetValidTrailList(arg_36_0)
	local var_36_0 = {}

	if arg_36_0.selectHeroData_.trialID ~= 0 then
		for iter_36_0, iter_36_1 in pairs(arg_36_0.allTrialIDList_) do
			local var_36_1 = HeroStandardSystemCfg[iter_36_1]

			if not HeroTools.IsNPC(var_36_1.hero_id) and not HeroTools.NeedHideInfo(var_36_1.hero_id) then
				table.insert(var_36_0, iter_36_1)
			end
		end
	end

	return var_36_0
end

function var_0_0.OnJoinClick(arg_37_0)
	local var_37_0 = arg_37_0.heroTeam_
	local var_37_1 = arg_37_0.heroTrialList_
	local var_37_2 = arg_37_0:IsSameHeroInTeam(arg_37_0.selectHeroData_.id)

	if arg_37_0.selectHeroData_.id == var_37_0[arg_37_0.params_.selectHeroPos] and arg_37_0.selectHeroData_.trialID == var_37_1[arg_37_0.params_.selectHeroPos] and var_37_2 then
		var_37_0[arg_37_0.params_.selectHeroPos] = 0
		var_37_1[arg_37_0.params_.selectHeroPos] = 0
	elseif var_37_2 then
		local var_37_3 = 1

		for iter_37_0, iter_37_1 in pairs(var_37_0) do
			if iter_37_1 == arg_37_0.selectHeroData_.id then
				var_37_3 = iter_37_0

				break
			end
		end

		if var_37_0[var_37_3] == arg_37_0.selectHeroData_.id and var_37_1[var_37_3] ~= arg_37_0.selectHeroData_.trialID then
			var_37_0[var_37_3] = arg_37_0.selectHeroData_.id
			var_37_1[var_37_3] = arg_37_0.selectHeroData_.trialID
		end

		local var_37_4 = var_37_0[var_37_3]

		var_37_0[var_37_3] = var_37_0[arg_37_0.params_.selectHeroPos]
		var_37_0[arg_37_0.params_.selectHeroPos] = var_37_4

		local var_37_5 = var_37_1[var_37_3]

		var_37_1[var_37_3] = var_37_1[arg_37_0.params_.selectHeroPos]
		var_37_1[arg_37_0.params_.selectHeroPos] = var_37_5

		HeroTools.PlayTalk(arg_37_0.selectHeroData_.id, "team")
	else
		var_37_0[arg_37_0.params_.selectHeroPos] = arg_37_0.selectHeroData_.id
		var_37_1[arg_37_0.params_.selectHeroPos] = arg_37_0.selectHeroData_.trialID

		HeroTools.PlayTalk(arg_37_0.selectHeroData_.id, "team")
	end

	if arg_37_0.canSwitchResctrictHeroList_[arg_37_0.params_.selectHeroPos] == ReserveConst.RESTRICT_HERO_SWITCH_MODE.FORBID and (arg_37_0.params_.reorder == nil or arg_37_0.params_.reorder == true) then
		arg_37_0:ReorderHeroTeam(var_37_0, var_37_1, arg_37_0.canSwitchResctrictHeroList_)
	end

	arg_37_0:TryToChangeTeam(var_37_0, var_37_1)
end

function var_0_0.TryToChangeTeam(arg_38_0, arg_38_1, arg_38_2)
	arg_38_0:ChangeTeam(arg_38_1, arg_38_2)
	arg_38_0:OnChangeTeamSuccess()
end

function var_0_0.ChangeTeam(arg_39_0, arg_39_1, arg_39_2)
	arg_39_0.sectionProxy_:ChangeHeroTeam(arg_39_1, arg_39_2)
end

function var_0_0.OnChangeTeamSuccess(arg_40_0)
	arg_40_0.heroAvatarView_:RemoveTween()
	arg_40_0:Back(1, {
		isSorted = true
	})
end

function var_0_0.IsInTeam(arg_41_0, arg_41_1, arg_41_2)
	return SectionSelectHeroTools.IsInTeam(arg_41_1, arg_41_2, arg_41_0.heroTeam_, arg_41_0.heroTrialList_)
end

function var_0_0.IsSameHeroInTeam(arg_42_0, arg_42_1)
	return SectionSelectHeroTools.IsSameHeroInTeam(arg_42_1, arg_42_0.heroTeam_)
end

function var_0_0.ReorderHeroTeam(arg_43_0, arg_43_1, arg_43_2, arg_43_3)
	SectionSelectHeroTools.ReorderHeroTeam(arg_43_1, arg_43_2, arg_43_3)
end

function var_0_0.GetHeroHeadClass(arg_44_0)
	return SectionHeroTeamHeadItem
end

function var_0_0.HeadRenderer(arg_45_0, arg_45_1, arg_45_2)
	local var_45_0 = arg_45_0.heroDataList_[arg_45_1].id
	local var_45_1 = arg_45_0.heroDataList_[arg_45_1].trialID

	arg_45_2:SetSectionHeroData(arg_45_0.heroDataList_[arg_45_1])
	arg_45_2:SetSelected(arg_45_2.heroId_ == arg_45_0.selectHeroData_.id and arg_45_2.trialID_ == arg_45_0.selectHeroData_.trialID)
	arg_45_2:RegisterClickListener(function()
		arg_45_0:SelectHero(arg_45_0.heroDataList_[arg_45_1])
	end)
	arg_45_2:SetInTeamFlag(arg_45_0:IsInTeam(var_45_0, var_45_1))
	arg_45_2:SetHeroLock(table.keyof(arg_45_0.lockHeroList_, var_45_0) ~= nil or table.keyof(arg_45_0.lockHeroList_, var_45_1) ~= nil)
end

function var_0_0.GetHeroViewProxy(arg_47_0, arg_47_1)
	if not arg_47_0.heroViewProxyDic_[arg_47_1] then
		arg_47_0.heroViewProxyDic_[arg_47_1] = HeroViewDataProxy.New(arg_47_1)
	end

	return arg_47_0.heroViewProxyDic_[arg_47_1]
end

function var_0_0.GetFilterClass(arg_48_0)
	return NewHeroListFilterView
end

function var_0_0.ExtraSorter(arg_49_0, arg_49_1, arg_49_2, arg_49_3, arg_49_4)
	local var_49_0, var_49_1, var_49_2 = SectionSelectHeroTools.IsInTeam(arg_49_1.id, arg_49_1.trialID, arg_49_0.heroTeam_, arg_49_0.heroTrialList_)
	local var_49_3, var_49_4, var_49_5 = SectionSelectHeroTools.IsInTeam(arg_49_2.id, arg_49_2.trialID, arg_49_0.heroTeam_, arg_49_0.heroTrialList_)

	if var_49_0 ~= var_49_3 then
		if var_49_0 and not var_49_3 then
			return true, true
		elseif not var_49_0 and var_49_3 then
			return true, false
		else
			return true, var_49_2 < var_49_5
		end
	end

	if arg_49_1.trialID ~= 0 or arg_49_2.trialID ~= 0 then
		if arg_49_1.trialID ~= 0 and arg_49_2.trialID ~= 0 then
			if arg_49_3 == 0 and arg_49_1.star ~= arg_49_2.star then
				if arg_49_0.curOrder_ == "desc" then
					return true, arg_49_1.star > arg_49_2.star
				else
					return true, arg_49_1.star < arg_49_2.star
				end
			end

			local var_49_6 = getHeroPower(arg_49_1.trialID, true)
			local var_49_7 = getHeroPower(arg_49_2.trialID, true)

			if var_49_6 ~= var_49_7 then
				if arg_49_4 == "desc" then
					return true, var_49_7 < var_49_6
				else
					return true, var_49_6 < var_49_7
				end
			else
				return true, arg_49_1.trialID > arg_49_2.trialID
			end
		else
			return true, arg_49_1.trialID > arg_49_2.trialID
		end
	end

	return false, false
end

function var_0_0.OnListChange(arg_50_0, arg_50_1, arg_50_2)
	arg_50_0.heroDataList_ = arg_50_2
	arg_50_0.selectHeroData_ = arg_50_0.heroDataList_[1]

	arg_50_0.heroHeadList_:StartScroll(#arg_50_0.heroDataList_)

	if #arg_50_0.heroDataList_ == 0 then
		arg_50_0.emptyController_:SetSelectedState("true")
		arg_50_0.heroAvatarView_:ShowHeroModel(false)
	else
		arg_50_0.emptyController_:SetSelectedState("false")
		arg_50_0.heroAvatarView_:ShowHeroModel(true)

		if not arg_50_0.params_.isEnter then
			arg_50_0:SelectHero(arg_50_0.heroDataList_[1])
		else
			arg_50_0.params_.isEnter = false
		end
	end
end

function var_0_0.OnHeroSort(arg_51_0, arg_51_1, arg_51_2, arg_51_3, arg_51_4, arg_51_5)
	arg_51_0.filterView_:RefreshSort(arg_51_1, arg_51_2, arg_51_3, arg_51_4, arg_51_5)
	HeroData:SaveSortValue(arg_51_1, arg_51_2, arg_51_3, arg_51_4, arg_51_5)
end

function var_0_0.GetTrialHeroList(arg_52_0)
	return GetTrialHeroList(arg_52_0.params_.stageType, arg_52_0.params_.stageID, arg_52_0.params_.activityID)
end

return var_0_0
