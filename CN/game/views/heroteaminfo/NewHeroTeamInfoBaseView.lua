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
	arg_4_0:InitSubView()
	arg_4_0:InitController()
	arg_4_0:InitSelectMode()
end

function var_0_0.InitSubView(arg_5_0)
	arg_5_0.heroHeadList_ = LuaList.New(handler(arg_5_0, arg_5_0.HeadRenderer), arg_5_0.uiListGo_, arg_5_0:GetHeroHeadClass())
	arg_5_0.filterView_ = arg_5_0:GetFilterClass().New(arg_5_0.filterGo_)

	arg_5_0.filterView_:SetExtraSorter(handler(arg_5_0, arg_5_0.ExtraSorter))
	arg_5_0.filterView_:SetListChangeHandler(handler(arg_5_0, arg_5_0.OnListChange))

	arg_5_0.autoClearFilter_ = true
	arg_5_0.heroAvatarView_ = HeroAvatarView.New(arg_5_0, arg_5_0.displayGo_)
	arg_5_0.heroInfoView_ = arg_5_0:GetHeroInfoViewClass().New(arg_5_0, arg_5_0.heroInfoGo_)
end

function var_0_0.InitController(arg_6_0)
	arg_6_0.emptyController_ = arg_6_0.controller_:GetController("empty")
	arg_6_0.joinBtnController_ = arg_6_0.btnPanelController_:GetController("join")
	arg_6_0.infoBtnController_ = arg_6_0.btnPanelController_:GetController("info")

	if arg_6_0.multiModeControllerEx_ then
		arg_6_0.selectModeController_ = arg_6_0.multiModeControllerEx_:GetController("selectMode")
	end

	arg_6_0.multiModeActiveController_ = arg_6_0.controller_:GetController("multiModeActive")
end

function var_0_0.InitSelectMode(arg_7_0)
	arg_7_0.selectHeroMode_ = SectionSelectHeroConst.SELECT_HERO_MODE.SINGLE
end

function var_0_0.AddUIListener(arg_8_0)
	arg_8_0:AddBtnListener(arg_8_0.infoBtn_, nil, handler(arg_8_0, arg_8_0.OnInfoBtnClick))
	arg_8_0:AddBtnListener(arg_8_0.joinBtn_, nil, handler(arg_8_0, arg_8_0.OnJoinClick))

	if arg_8_0.multiModeBtn_ then
		arg_8_0:AddBtnListener(arg_8_0.multiModeBtn_, nil, handler(arg_8_0, arg_8_0.OnChangeMultiMode))
	end
end

function var_0_0.OnEnter(arg_9_0)
	arg_9_0:ProcessCamera()
	arg_9_0:UpdateBar()
	arg_9_0:ProcessParams()
	arg_9_0:Reset()
	arg_9_0:SubViewOnEnter()
	arg_9_0:GetHeroTeam()
	arg_9_0:RefreshHeroDataList()
	arg_9_0:RefreshUI()
end

function var_0_0.OnTop(arg_10_0)
	manager.windowBar:RegistBackCallBack(function()
		arg_10_0:Back(1, {
			isSorted = true
		})
	end)
end

function var_0_0.OnExit(arg_12_0)
	arg_12_0.params_.curSelectHeroData = arg_12_0.selectHeroData_

	manager.ui:ResetMainCamera()
	manager.windowBar:HideBar()
	arg_12_0:SubViewOnExit()
end

function var_0_0.Dispose(arg_13_0)
	if arg_13_0.filterView_ then
		arg_13_0.filterView_:Dispose()

		arg_13_0.filterView_ = nil
	end

	if arg_13_0.heroHeadList_ then
		arg_13_0.heroHeadList_:Dispose()

		arg_13_0.heroHeadList_ = nil
	end

	if arg_13_0.heroAvatarView_ then
		arg_13_0.heroAvatarView_:Dispose()

		arg_13_0.heroAvatarView_ = nil
	end

	if arg_13_0.heroInfoView_ then
		arg_13_0.heroInfoView_:Dispose()

		arg_13_0.heroInfoView_ = nil
	end

	var_0_0.super.Dispose(arg_13_0)
end

function var_0_0.ProcessCamera(arg_14_0)
	manager.ui:SetMainCamera("hero")
end

function var_0_0.UpdateBar(arg_15_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR
	})
end

function var_0_0.ProcessParams(arg_16_0)
	arg_16_0:ProcessBaseParams()
	arg_16_0:ProcessReserveParams()
	arg_16_0:ProcessProxyParams()
	arg_16_0:ProcessCustomParams()
end

function var_0_0.ProcessBaseParams(arg_17_0)
	arg_17_0.stageID_ = arg_17_0.params_.stageID
	arg_17_0.stageType_ = arg_17_0.params_.stageType or BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_UNDEFINED
	arg_17_0.activityID_ = arg_17_0.params_.activityID
	arg_17_0.params_.selectHeroPos = arg_17_0.params_.selectHeroPos or 1

	if arg_17_0.params_.reorder == nil then
		arg_17_0.params_.reorder = true
	end

	arg_17_0.reorder_ = arg_17_0.params_.reorder

	if arg_17_0.params_.hideInfoBtn == nil then
		arg_17_0.params_.hideInfoBtn = false
	end

	arg_17_0.hideInfoBtn_ = arg_17_0.params_.hideInfoBtn

	if arg_17_0.params_.canCleanTeam == nil then
		arg_17_0.params_.canCleanTeam = false
	end

	arg_17_0.canCleanTeam_ = arg_17_0.params_.canCleanTeam

	if arg_17_0.params_.canUseOwnHero == nil then
		arg_17_0.params_.canUseOwnHero = true
	end

	arg_17_0.canUseOwnHero_ = arg_17_0.params_.canUseOwnHero

	if arg_17_0.params_.canUseMultiMode == nil then
		arg_17_0.params_.canUseMultiMode = SectionSelectHeroTools.CanUseMultiMode(arg_17_0.stageType_, arg_17_0.stageID_)
	end

	arg_17_0.canUseMultiMode_ = arg_17_0.params_.canUseMultiMode
end

function var_0_0.ProcessReserveParams(arg_18_0)
	if not arg_18_0.params_.reserveParams then
		arg_18_0.params_.reserveParams = ReserveTools.GetReserveParams(arg_18_0.stageType_, arg_18_0.stageID_, arg_18_0.activityID_)
	elseif not arg_18_0.params_.reserveParams.customData.activityID then
		arg_18_0.params_.reserveParams.customData.activityID = arg_18_0.activityID_
	end

	arg_18_0.reserveParams_ = arg_18_0.params_.reserveParams
end

function var_0_0.ProcessProxyParams(arg_19_0)
	arg_19_0.params_.heroDataType = arg_19_0.params_.heroDataType or HeroConst.HERO_DATA_TYPE.DEFAULT
	arg_19_0.heroDataType_ = arg_19_0.params_.heroDataType

	if not arg_19_0.params_.sectionProxy then
		arg_19_0.params_.sectionProxy = SectionSelectHeroTools.GetProxy(arg_19_0.params_, arg_19_0.reserveParams_, arg_19_0.heroDataType_)
	end

	arg_19_0.sectionProxy_ = arg_19_0.params_.sectionProxy
	arg_19_0.heroViewProxy_ = arg_19_0.sectionProxy_:GetHeroViewProxy()
	arg_19_0.heroViewProxyDic_ = {}
	arg_19_0.heroViewProxyDic_[arg_19_0.heroDataType_] = arg_19_0.heroViewProxy_
end

function var_0_0.ProcessCustomParams(arg_20_0)
	return
end

function var_0_0.Reset(arg_21_0)
	if not arg_21_0.params_.isBack then
		if arg_21_0.filterView_ and arg_21_0.autoClearFilter_ then
			arg_21_0.filterView_:Reset(true)
			CommonFilterData:ClearFilter(Filter_Root_Define.Hero_Filter_List.filter_id)
		end

		arg_21_0:ResetSelectMode()
	end
end

function var_0_0.SubViewOnEnter(arg_22_0)
	arg_22_0.filterView_:OnEnter(arg_22_0.heroViewProxy_)
	arg_22_0.heroAvatarView_:OnEnter()

	if arg_22_0.heroInfoView_ then
		arg_22_0.heroInfoView_:OnEnter(arg_22_0.heroViewProxy_)
	end
end

function var_0_0.SubViewOnExit(arg_23_0)
	if arg_23_0.filterView_ and arg_23_0.filterView_.OnExit then
		arg_23_0.filterView_:OnExit()
	end

	if #arg_23_0.heroDataList_ <= 0 then
		HeroData:ResetSortValue()
		arg_23_0.filterView_:Reset()
	end

	arg_23_0.heroAvatarView_:OnExit()
	arg_23_0.heroInfoView_:OnExit()
end

function var_0_0.ProcessHeroDataList(arg_24_0, arg_24_1, arg_24_2, arg_24_3)
	if arg_24_0.customHeroList_[arg_24_0.params_.selectHeroPos][1] then
		arg_24_0:ProcessCustomHeroData(arg_24_1, arg_24_2)
	else
		arg_24_0:ProcessOwnHeroData(arg_24_1, arg_24_3)
		arg_24_0:ProcessTrialHeroData(arg_24_1, arg_24_2)
	end
end

function var_0_0.RefreshHeroDataList(arg_25_0)
	local var_25_0 = {}

	arg_25_0.allTrialIDList_ = {}
	arg_25_0.customHeroList_, arg_25_0.canSwitchResctrictHeroList_ = SectionSelectHeroTools.GetRestrictHeroList(arg_25_0.stageType_, arg_25_0.stageID_)
	arg_25_0.curCanSwitchRestrictHero_ = arg_25_0.canSwitchResctrictHeroList_[arg_25_0.params_.selectHeroPos] ~= ReserveConst.RESTRICT_HERO_SWITCH_MODE.FORBID

	local var_25_1
	local var_25_2
	local var_25_3, var_25_4 = SectionSelectHeroTools.GetRestrictHeroPosDic(arg_25_0.stageType_, arg_25_0.stageID_)

	arg_25_0:ProcessHeroDataList(var_25_0, var_25_4, var_25_3)

	for iter_25_0, iter_25_1 in pairs(arg_25_0.heroViewProxyDic_) do
		iter_25_1:SetTempHeroList(arg_25_0.allTrialIDList_)
	end

	arg_25_0.filterView_:SetHeroIdList(var_25_0)
end

function var_0_0.ProcessCustomHeroData(arg_26_0, arg_26_1, arg_26_2)
	if arg_26_0.curCanSwitchRestrictHero_ == true then
		local var_26_0 = 1
		local var_26_1 = 2

		while var_26_0 <= #arg_26_0.customHeroList_[arg_26_0.params_.selectHeroPos] and var_26_1 <= #arg_26_0.customHeroList_[arg_26_0.params_.selectHeroPos] do
			local var_26_2 = arg_26_0.customHeroList_[arg_26_0.params_.selectHeroPos][var_26_0]
			local var_26_3 = arg_26_0.customHeroList_[arg_26_0.params_.selectHeroPos][var_26_1]

			arg_26_0:InsertHeroDataList(arg_26_1, var_26_2, var_26_3, HeroConst.HERO_DATA_TYPE.TRIAL)

			if arg_26_0.canSwitchResctrictHeroList_[arg_26_0.params_.selectHeroPos] == ReserveConst.RESTRICT_HERO_SWITCH_MODE.OWN_AND_TRIAL and HeroTools.GetHeroIsUnlock(var_26_2) then
				arg_26_0:InsertHeroDataList(arg_26_1, var_26_2, 0, arg_26_0.heroDataType_)
			end

			var_26_0 = var_26_0 + 2
			var_26_1 = var_26_1 + 2
		end
	else
		for iter_26_0, iter_26_1 in pairs(arg_26_2) do
			arg_26_0:InsertHeroDataList(arg_26_1, HeroStandardSystemCfg[iter_26_0].hero_id, iter_26_0, HeroConst.HERO_DATA_TYPE.TRIAL)
		end
	end
end

function var_0_0.ProcessOwnHeroData(arg_27_0, arg_27_1, arg_27_2)
	for iter_27_0, iter_27_1 in pairs(arg_27_0:GetHeroList()) do
		if not arg_27_2[iter_27_1] then
			arg_27_0:InsertHeroDataList(arg_27_1, iter_27_1, 0, arg_27_0.heroDataType_)
		end
	end
end

function var_0_0.ProcessTrialHeroData(arg_28_0, arg_28_1, arg_28_2)
	local var_28_0 = arg_28_0:GetTrialHeroList()

	for iter_28_0, iter_28_1 in pairs(var_28_0) do
		if not arg_28_2[iter_28_1] then
			arg_28_0:InsertHeroDataList(arg_28_1, HeroStandardSystemCfg[iter_28_1].hero_id, iter_28_1, HeroConst.HERO_DATA_TYPE.TRIAL)
		end
	end
end

function var_0_0.InsertHeroDataList(arg_29_0, arg_29_1, arg_29_2, arg_29_3, arg_29_4)
	table.insert(arg_29_1, {
		id = arg_29_2,
		trialID = arg_29_3,
		type = arg_29_4,
		heroViewProxy = arg_29_0:GetHeroViewProxy(arg_29_4)
	})

	if arg_29_3 and arg_29_3 ~= 0 then
		table.insert(arg_29_0.allTrialIDList_, arg_29_3)
	end
end

function var_0_0.GetDefaultHeroData(arg_30_0)
	if arg_30_0.params_.curSelectHeroData and arg_30_0.params_.curSelectHeroData.id ~= 0 then
		for iter_30_0, iter_30_1 in ipairs(arg_30_0.heroDataList_) do
			if iter_30_1.id == arg_30_0.params_.curSelectHeroData.id and iter_30_1.trialID == arg_30_0.params_.curSelectHeroData.trialID then
				return arg_30_0.params_.curSelectHeroData
			end
		end
	end

	if not arg_30_0.params_.isBack then
		local var_30_0 = arg_30_0.heroTeam_[arg_30_0.params_.selectHeroPos] or 0
		local var_30_1 = arg_30_0.heroTrialList_[arg_30_0.params_.selectHeroPos] or 0

		if var_30_0 ~= 0 then
			for iter_30_2, iter_30_3 in ipairs(arg_30_0.heroDataList_) do
				if iter_30_3.id == var_30_0 and iter_30_3.trialID == var_30_1 then
					return iter_30_3
				end
			end

			return {
				id = var_30_0,
				trialID = var_30_1,
				type = arg_30_0.heroDataType_,
				heroViewProxy = arg_30_0:GetHeroViewProxy(arg_30_0.heroDataType_)
			}
		end
	end

	for iter_30_4, iter_30_5 in ipairs(arg_30_0.heroDataList_) do
		local var_30_2 = iter_30_5.id
		local var_30_3 = iter_30_5.trialID

		if not arg_30_0:IsInTeam(var_30_2, iter_30_5.trialID) and not arg_30_0:IsHeroLock(var_30_2, var_30_3) then
			return iter_30_5
		end
	end

	if #arg_30_0.heroDataList_ > 0 then
		return arg_30_0.heroDataList_[1]
	end

	return nil
end

function var_0_0.RefreshUI(arg_31_0)
	arg_31_0:RefreshSelectModeUI()
	arg_31_0:RefreshHeroList()
end

function var_0_0.RefreshSelectModeUI(arg_32_0)
	arg_32_0:RefreshMultiModeBtn()

	if arg_32_0.selectHeroMode_ == SectionSelectHeroConst.SELECT_HERO_MODE.SINGLE then
		arg_32_0:RefreshSingleModeUI()
	else
		arg_32_0:RefreshMultiModeUI()
	end
end

function var_0_0.RefreshSingleModeUI(arg_33_0)
	arg_33_0:RefreshSingleModeHeadItem()
	arg_33_0:UpdateHeroView()
	arg_33_0:RefreshJoinBtn()
end

function var_0_0.RefreshSingleModeHeadItem(arg_34_0)
	for iter_34_0, iter_34_1 in pairs(arg_34_0.heroHeadList_:GetItemList()) do
		iter_34_1:SetSelected(iter_34_1.heroId_ == arg_34_0.selectHeroData_.id and iter_34_1.trialID_ == arg_34_0.selectHeroData_.trialID)
	end
end

function var_0_0.RefreshJoinBtn(arg_35_0)
	arg_35_0.joinBtn_.interactable = true

	if arg_35_0:IsPosLocked(arg_35_0.params_.selectHeroPos) then
		arg_35_0.joinBtnController_:SetSelectedState("lock")

		arg_35_0.joinBtn_.interactable = false
	elseif arg_35_0:IsHeroLock(arg_35_0.selectHeroData_.id, arg_35_0.selectHeroData_.trialID) then
		arg_35_0.joinBtnController_:SetSelectedState("lock")

		arg_35_0.joinBtn_.interactable = false
	elseif arg_35_0:IsSameHeroInTeam(arg_35_0.selectHeroData_.id) and not arg_35_0:IsInTeam(arg_35_0.selectHeroData_.id, arg_35_0.selectHeroData_.trialID) then
		if arg_35_0.heroTeam_[arg_35_0.params_.selectHeroPos] ~= arg_35_0.selectHeroData_.id then
			arg_35_0.joinBtnController_:SetSelectedState("lock")

			arg_35_0.joinBtn_.interactable = false
		else
			arg_35_0.joinBtnController_:SetSelectedState("change")
		end
	elseif arg_35_0.heroTeam_[arg_35_0.params_.selectHeroPos] == 0 then
		if arg_35_0:IsInTeam(arg_35_0.selectHeroData_.id, arg_35_0.selectHeroData_.trialID) then
			arg_35_0.joinBtnController_:SetSelectedState("change")
		else
			arg_35_0.joinBtnController_:SetSelectedState("add")
		end
	elseif arg_35_0.selectHeroData_.id == arg_35_0.heroTeam_[arg_35_0.params_.selectHeroPos] then
		if arg_35_0.customHeroList_[arg_35_0.params_.selectHeroPos][1] and arg_35_0.curCanSwitchRestrictHero_ == true then
			arg_35_0.joinBtnController_:SetSelectedState("cantRemove")

			arg_35_0.joinBtn_.interactable = false
		else
			local var_35_0 = 0

			for iter_35_0, iter_35_1 in pairs(arg_35_0.heroTeam_) do
				if iter_35_1 ~= 0 then
					var_35_0 = var_35_0 + 1
				end
			end

			if var_35_0 == 1 and not arg_35_0.canCleanTeam_ then
				arg_35_0.joinBtn_.interactable = false

				arg_35_0.joinBtnController_:SetSelectedState("cantRemove")
			else
				arg_35_0.joinBtnController_:SetSelectedState("out")
			end
		end
	else
		arg_35_0.joinBtnController_:SetSelectedState("change")
	end
end

function var_0_0.UpdateHeroView(arg_36_0)
	arg_36_0:UpdateHeroAvatarView()
	arg_36_0:UpdateHeroInfoView()
end

function var_0_0.UpdateHeroAvatarView(arg_37_0)
	local var_37_0 = arg_37_0.selectHeroData_.id
	local var_37_1 = arg_37_0.selectHeroData_.heroViewProxy:GetHeroUsingSkinInfo(var_37_0, {
		arg_37_0.selectHeroData_.trialID
	}).id

	arg_37_0.heroAvatarView_:SetSkinId(var_37_1)
end

function var_0_0.UpdateHeroInfoView(arg_38_0)
	local var_38_0 = arg_38_0.selectHeroData_.id
	local var_38_1 = arg_38_0.selectHeroData_.heroViewProxy:GetHeroData(var_38_0, {
		arg_38_0.selectHeroData_.trialID
	})

	arg_38_0.heroInfoView_:SetProxy(arg_38_0.selectHeroData_.heroViewProxy)
	arg_38_0.heroInfoView_:SetHeroInfo(var_38_1)
	arg_38_0.heroInfoView_:UpdateView()
end

function var_0_0.RefreshMultiModeUI(arg_39_0)
	arg_39_0:RefreshMultiModeHeadItem()
	arg_39_0:UpdateHeroView()
	arg_39_0:RefreshMultiJoinBtn()
end

function var_0_0.RefreshMultiModeHeadItem(arg_40_0)
	for iter_40_0, iter_40_1 in pairs(arg_40_0.heroHeadList_:GetItemList()) do
		iter_40_1:SetSelected(iter_40_1.heroId_ == arg_40_0.selectHeroData_.id and iter_40_1.trialID_ == arg_40_0.selectHeroData_.trialID)
		iter_40_1:SetMultiPos(arg_40_0:IsInTeam(iter_40_1.heroId_, iter_40_1.trialID_))
	end
end

function var_0_0.RefreshMultiJoinBtn(arg_41_0)
	arg_41_0.joinBtn_.interactable = true

	arg_41_0.joinBtnController_:SetSelectedState("add")
end

function var_0_0.RefreshInfoBtn(arg_42_0)
	if arg_42_0.hideInfoBtn_ or HeroTools.NeedHideInfo(arg_42_0.selectHeroData_.id) or HeroTools.IsNPC(arg_42_0.selectHeroData_.id) then
		arg_42_0.infoBtnController_:SetSelectedState("off")
	else
		arg_42_0.infoBtnController_:SetSelectedState("on")
	end
end

function var_0_0.RefreshMultiModeBtn(arg_43_0)
	if arg_43_0.multiModeActiveController_ then
		arg_43_0.multiModeActiveController_:SetSelectedState(arg_43_0.canUseMultiMode_ and "on" or "off")
	end

	if arg_43_0.selectModeController_ then
		arg_43_0.selectModeController_:SetSelectedState(arg_43_0.selectHeroMode_ == SectionSelectHeroConst.SELECT_HERO_MODE.SINGLE and "single" or "multi")
	end
end

function var_0_0.OnChangeMultiMode(arg_44_0)
	if arg_44_0.selectHeroMode_ == SectionSelectHeroConst.SELECT_HERO_MODE.SINGLE then
		arg_44_0:SwitchSelectMode(SectionSelectHeroConst.SELECT_HERO_MODE.MULTI)
	else
		arg_44_0:SwitchSelectMode(SectionSelectHeroConst.SELECT_HERO_MODE.SINGLE)
	end

	arg_44_0:RecordMultiButtonTouch()
end

function var_0_0.SwitchSelectMode(arg_45_0, arg_45_1)
	arg_45_0.selectHeroMode_ = arg_45_1

	if arg_45_0.selectHeroMode_ == SectionSelectHeroConst.SELECT_HERO_MODE.SINGLE then
		arg_45_0:SwitchToSingleMode()
	else
		arg_45_0:SwitchToMultiMode()
	end

	arg_45_0:RefreshSelectModeUI()
end

function var_0_0.SwitchToMultiMode(arg_46_0)
	arg_46_0:ResetMultiModeTeam()
	arg_46_0.heroHeadList_:Refresh()
end

function var_0_0.ResetMultiModeTeam(arg_47_0)
	arg_47_0.multiModeHeroList_ = deepClone(arg_47_0.heroTeam_)
	arg_47_0.multiModeTrialList_ = deepClone(arg_47_0.heroTrialList_)
end

function var_0_0.SwitchToSingleMode(arg_48_0)
	arg_48_0.heroHeadList_:Refresh()
end

function var_0_0.RefreshMultiModeTeam(arg_49_0, arg_49_1)
	local var_49_0 = arg_49_1.id
	local var_49_1 = arg_49_1.trialID
	local var_49_2, var_49_3, var_49_4 = arg_49_0:IsInTeam(var_49_0, var_49_1)

	if var_49_2 then
		arg_49_0.multiModeHeroList_[var_49_4] = 0
		arg_49_0.multiModeTrialList_[var_49_4] = 0
	else
		local var_49_5, var_49_6 = arg_49_0:CheckMultiModeCanAddHero(arg_49_1)

		if not var_49_5 then
			if var_49_6 then
				ShowTips(var_49_6)
			end

			return
		end

		local var_49_7 = arg_49_0:FindMultiModeNextValidTeamPos()

		if var_49_7 then
			arg_49_0.multiModeHeroList_[var_49_7] = var_49_0
			arg_49_0.multiModeTrialList_[var_49_7] = var_49_1
		end
	end
end

function var_0_0.CheckMultiModeCanAddHero(arg_50_0, arg_50_1)
	local var_50_0 = true
	local var_50_1 = ""

	if arg_50_0:IsHeroLock(arg_50_1.id, arg_50_1.trialID) then
		var_50_0 = false
		var_50_1 = nil
	elseif arg_50_0:IsMultiModeTeamFull() then
		var_50_0 = false
		var_50_1 = "THE_TEAM_IS_FULL"
	elseif arg_50_0:IsSameHeroInTeam(arg_50_1.id) then
		var_50_0 = false
		var_50_1 = "SELECT_SAME_HERO"
	end

	return var_50_0, var_50_1
end

function var_0_0.FindMultiModeNextValidTeamPos(arg_51_0)
	for iter_51_0, iter_51_1 in ipairs(arg_51_0.multiModeHeroList_) do
		if iter_51_1 == 0 and not arg_51_0.lockStateList_[iter_51_0] then
			return iter_51_0
		end
	end

	return nil
end

function var_0_0.IsMultiModeTeamFull(arg_52_0)
	for iter_52_0, iter_52_1 in ipairs(arg_52_0.multiModeHeroList_) do
		if iter_52_1 == 0 and not arg_52_0.lockStateList_[iter_52_0] then
			return false
		end
	end

	return true
end

function var_0_0.ResetSelectMode(arg_53_0)
	arg_53_0.selectHeroMode_ = SectionSelectHeroConst.SELECT_HERO_MODE.SINGLE

	arg_53_0:RefreshMultiModeBtn()
end

function var_0_0.RefreshHeroList(arg_54_0)
	if #arg_54_0.heroDataList_ <= 0 then
		return
	end

	arg_54_0.selectHeroData_ = arg_54_0:GetDefaultHeroData()

	arg_54_0.heroHeadList_:StartScroll(#arg_54_0.heroDataList_, arg_54_0:GetTargetScrollIndex())
	arg_54_0:SelectHero(arg_54_0.selectHeroData_)
end

function var_0_0.GetTargetScrollIndex(arg_55_0)
	local var_55_0 = 1

	for iter_55_0, iter_55_1 in ipairs(arg_55_0.heroDataList_) do
		if iter_55_1.id == arg_55_0.selectHeroData_.id and iter_55_1.trialID == arg_55_0.selectHeroData_.trialID then
			var_55_0 = iter_55_0

			break
		end
	end

	return var_55_0
end

function var_0_0.SelectHero(arg_56_0, arg_56_1)
	if arg_56_0.selectHeroMode_ == SectionSelectHeroConst.SELECT_HERO_MODE.SINGLE then
		arg_56_0:SingleModeSelectHero(arg_56_1)
	else
		arg_56_0:MultiModeSelectHero(arg_56_1)
	end
end

function var_0_0.SingleModeSelectHero(arg_57_0, arg_57_1)
	arg_57_0.selectHeroData_ = arg_57_1

	arg_57_0:RefreshSingleModeUI()
	arg_57_0:RefreshInfoBtn()
end

function var_0_0.MultiModeSelectHero(arg_58_0, arg_58_1)
	arg_58_0.selectHeroData_ = arg_58_1

	arg_58_0:RefreshMultiModeUI()
	arg_58_0:RefreshInfoBtn()
end

function var_0_0.MultiModeChangeTeam(arg_59_0, arg_59_1)
	arg_59_0:RefreshMultiModeTeam(arg_59_1)
	arg_59_0:MultiModeSelectHero(arg_59_1)
end

function var_0_0.GetHeroTeam(arg_60_0)
	arg_60_0.heroTeam_, arg_60_0.lockStateList_, arg_60_0.lockHeroList_, arg_60_0.heroTrialList_ = arg_60_0.sectionProxy_:CustomGetTeamData()
end

function var_0_0.GetHeroList(arg_61_0)
	local var_61_0 = {}

	if arg_61_0.canUseOwnHero_ ~= false then
		var_61_0 = HeroTools.Sort(HeroData:GetHeroList())
	end

	return var_61_0
end

function var_0_0.OnInfoBtnClick(arg_62_0)
	arg_62_0:Go("/newHero", {
		isEnter = true,
		hid = arg_62_0.selectHeroData_.trialID ~= 0 and arg_62_0.selectHeroData_.trialID or arg_62_0.selectHeroData_.id,
		type = arg_62_0.selectHeroData_.trialID ~= 0 and HeroConst.HERO_DATA_TYPE.TRIAL or arg_62_0.heroDataType_,
		tempHeroList = arg_62_0:GetValidTrailList()
	})
end

function var_0_0.GetValidTrailList(arg_63_0)
	local var_63_0 = {}

	if arg_63_0.selectHeroData_.trialID ~= 0 then
		for iter_63_0, iter_63_1 in pairs(arg_63_0.allTrialIDList_) do
			local var_63_1 = HeroStandardSystemCfg[iter_63_1]

			if not HeroTools.IsNPC(var_63_1.hero_id) and not HeroTools.NeedHideInfo(var_63_1.hero_id) then
				table.insert(var_63_0, iter_63_1)
			end
		end
	end

	return var_63_0
end

function var_0_0.OnJoinClick(arg_64_0)
	local var_64_0
	local var_64_1
	local var_64_2

	if arg_64_0.selectHeroMode_ == SectionSelectHeroConst.SELECT_HERO_MODE.SINGLE then
		var_64_0, var_64_1, var_64_2 = arg_64_0:TryToChangeSingleHero(arg_64_0.selectHeroData_.id, arg_64_0.selectHeroData_.trialID, arg_64_0.params_.selectHeroPos)
	else
		var_64_0, var_64_1, var_64_2 = arg_64_0:TryToChangeMultiHero()
	end

	if var_64_0 then
		arg_64_0:TryToReoerderTeam(var_64_1, var_64_2)
		arg_64_0:TryToChangeTeam(var_64_1, var_64_2)
	end
end

function var_0_0.TryToChangeSingleHero(arg_65_0, arg_65_1, arg_65_2, arg_65_3)
	local var_65_0 = true
	local var_65_1, var_65_2 = arg_65_0:IsSameHeroInTeam(arg_65_1)
	local var_65_3 = deepClone(arg_65_0.heroTeam_)
	local var_65_4 = deepClone(arg_65_0.heroTrialList_)

	if var_65_1 then
		if var_65_2 == arg_65_3 then
			if arg_65_1 == var_65_3[var_65_2] then
				if arg_65_2 == var_65_4[var_65_2] then
					arg_65_0:RemoveHero(var_65_2, var_65_3, var_65_4)
				else
					var_65_0 = arg_65_0:AddHero(arg_65_3, arg_65_1, arg_65_2, var_65_3, var_65_4)

					if not var_65_0 then
						return var_65_0
					end

					HeroTools.PlayTalk(arg_65_1, "team")
				end
			end
		else
			arg_65_0:Swap(var_65_2, arg_65_3, var_65_3)
			arg_65_0:Swap(var_65_2, arg_65_3, var_65_4)
			HeroTools.PlayTalk(arg_65_1, "team")
		end
	else
		var_65_0 = arg_65_0:AddHero(arg_65_3, arg_65_1, arg_65_2, var_65_3, var_65_4)

		if not var_65_0 then
			return var_65_0
		end

		HeroTools.PlayTalk(arg_65_1, "team")
	end

	return var_65_0, var_65_3, var_65_4
end

function var_0_0.RemoveHero(arg_66_0, arg_66_1, arg_66_2, arg_66_3)
	arg_66_2[arg_66_1] = 0
	arg_66_3[arg_66_1] = 0
end

function var_0_0.AddHero(arg_67_0, arg_67_1, arg_67_2, arg_67_3, arg_67_4, arg_67_5)
	local var_67_0 = true

	arg_67_4[arg_67_1] = arg_67_2
	arg_67_5[arg_67_1] = arg_67_3

	return var_67_0
end

function var_0_0.Swap(arg_68_0, arg_68_1, arg_68_2, arg_68_3)
	arg_68_3[arg_68_2], arg_68_3[arg_68_1] = arg_68_3[arg_68_1], arg_68_3[arg_68_2]
end

function var_0_0.TryToReoerderTeam(arg_69_0, arg_69_1, arg_69_2)
	if arg_69_0:IsNeedReorder() then
		arg_69_0:ReorderHeroTeam(arg_69_1, arg_69_2, arg_69_0.canSwitchResctrictHeroList_)
	end
end

function var_0_0.IsNeedReorder(arg_70_0)
	return arg_70_0.canSwitchResctrictHeroList_[arg_70_0.params_.selectHeroPos] == ReserveConst.RESTRICT_HERO_SWITCH_MODE.FORBID and arg_70_0.reorder_ == true
end

function var_0_0.TryToChangeMultiHero(arg_71_0)
	local var_71_0 = true
	local var_71_1 = {}
	local var_71_2 = {}

	for iter_71_0, iter_71_1 in ipairs(arg_71_0.multiModeHeroList_) do
		var_71_0 = arg_71_0:AddHero(iter_71_0, iter_71_1, arg_71_0.multiModeTrialList_[iter_71_0], var_71_1, var_71_2)

		if not var_71_0 then
			return var_71_0
		end
	end

	return var_71_0, var_71_1, var_71_2
end

function var_0_0.TryToChangeTeam(arg_72_0, arg_72_1, arg_72_2)
	arg_72_0:ChangeTeam(arg_72_1, arg_72_2)
	arg_72_0:OnChangeTeamSuccess()
end

function var_0_0.ChangeTeam(arg_73_0, arg_73_1, arg_73_2)
	arg_73_0.sectionProxy_:ChangeHeroTeam(arg_73_1, arg_73_2)
end

function var_0_0.OnChangeTeamSuccess(arg_74_0)
	arg_74_0.heroAvatarView_:RemoveTween()
	arg_74_0:Back(1, {
		isSorted = true
	})
end

function var_0_0.IsInTeam(arg_75_0, arg_75_1, arg_75_2)
	local var_75_0 = {}
	local var_75_1 = {}

	if arg_75_0.selectHeroMode_ == SectionSelectHeroConst.SELECT_HERO_MODE.SINGLE then
		var_75_0 = arg_75_0.heroTeam_
		var_75_1 = arg_75_0.heroTrialList_
	else
		var_75_0 = arg_75_0.multiModeHeroList_
		var_75_1 = arg_75_0.multiModeTrialList_
	end

	return SectionSelectHeroTools.IsInTeam(arg_75_1, arg_75_2, var_75_0, var_75_1)
end

function var_0_0.IsSameHeroInTeam(arg_76_0, arg_76_1)
	local var_76_0 = {}

	if arg_76_0.selectHeroMode_ == SectionSelectHeroConst.SELECT_HERO_MODE.SINGLE then
		var_76_0 = arg_76_0.heroTeam_
	else
		var_76_0 = arg_76_0.multiModeHeroList_
	end

	return SectionSelectHeroTools.IsSameHeroInTeam(arg_76_1, var_76_0)
end

function var_0_0.ReorderHeroTeam(arg_77_0, arg_77_1, arg_77_2, arg_77_3)
	SectionSelectHeroTools.ReorderHeroTeam(arg_77_1, arg_77_2, arg_77_3)
end

function var_0_0.IsPosLocked(arg_78_0, arg_78_1)
	return arg_78_0.lockStateList_[arg_78_1] == true
end

function var_0_0.IsHeroLock(arg_79_0, arg_79_1, arg_79_2)
	return table.keyof(arg_79_0.lockHeroList_, arg_79_1) ~= nil or table.keyof(arg_79_0.lockHeroList_, arg_79_2) ~= nil
end

function var_0_0.GetHeroHeadClass(arg_80_0)
	return SectionHeroTeamHeadItem
end

function var_0_0.HeadRenderer(arg_81_0, arg_81_1, arg_81_2)
	local var_81_0 = arg_81_0.heroDataList_[arg_81_1].id
	local var_81_1 = arg_81_0.heroDataList_[arg_81_1].trialID

	arg_81_2:SetSectionHeroData(arg_81_0.heroDataList_[arg_81_1])
	arg_81_2:RegisterClickListener(function()
		if arg_81_0.selectHeroMode_ == SectionSelectHeroConst.SELECT_HERO_MODE.SINGLE then
			arg_81_0:SingleModeSelectHero(arg_81_0.heroDataList_[arg_81_1])
		else
			arg_81_0:MultiModeChangeTeam(arg_81_0.heroDataList_[arg_81_1])
		end
	end)
	arg_81_2:SetHeroLock(arg_81_0:IsHeroLock(var_81_0, var_81_1))
	arg_81_2:SetSelected(arg_81_2.heroId_ == arg_81_0.selectHeroData_.id and arg_81_2.trialID_ == arg_81_0.selectHeroData_.trialID)

	if arg_81_0.selectHeroMode_ == SectionSelectHeroConst.SELECT_HERO_MODE.SINGLE then
		arg_81_2:SetInTeamFlag(arg_81_0:IsInTeam(var_81_0, var_81_1))
		arg_81_2:SetMultiPos(false)
	else
		arg_81_2:SetInTeamFlag(false)
		arg_81_2:SetMultiPos(arg_81_0:IsInTeam(var_81_0, var_81_1))
	end
end

function var_0_0.GetHeroViewProxy(arg_83_0, arg_83_1)
	if not arg_83_0.heroViewProxyDic_[arg_83_1] then
		arg_83_0.heroViewProxyDic_[arg_83_1] = HeroViewDataProxy.New(arg_83_1)
	end

	return arg_83_0.heroViewProxyDic_[arg_83_1]
end

function var_0_0.GetFilterClass(arg_84_0)
	return NewHeroListFilterView
end

function var_0_0.ExtraSorter(arg_85_0, arg_85_1, arg_85_2, arg_85_3, arg_85_4)
	local var_85_0, var_85_1, var_85_2 = SectionSelectHeroTools.IsInTeam(arg_85_1.id, arg_85_1.trialID, arg_85_0.heroTeam_, arg_85_0.heroTrialList_)
	local var_85_3, var_85_4, var_85_5 = SectionSelectHeroTools.IsInTeam(arg_85_2.id, arg_85_2.trialID, arg_85_0.heroTeam_, arg_85_0.heroTrialList_)

	if var_85_0 ~= var_85_3 then
		if var_85_0 and not var_85_3 then
			return true, true
		elseif not var_85_0 and var_85_3 then
			return true, false
		else
			return true, var_85_2 < var_85_5
		end
	end

	if arg_85_1.trialID ~= 0 or arg_85_2.trialID ~= 0 then
		if arg_85_1.trialID ~= 0 and arg_85_2.trialID ~= 0 then
			if arg_85_3 == 0 and arg_85_1.star ~= arg_85_2.star then
				if arg_85_0.curOrder_ == "desc" then
					return true, arg_85_1.star > arg_85_2.star
				else
					return true, arg_85_1.star < arg_85_2.star
				end
			end

			local var_85_6 = getHeroPower(arg_85_1.trialID, true)
			local var_85_7 = getHeroPower(arg_85_2.trialID, true)

			if var_85_6 ~= var_85_7 then
				if arg_85_4 == "desc" then
					return true, var_85_7 < var_85_6
				else
					return true, var_85_6 < var_85_7
				end
			else
				return true, arg_85_1.trialID > arg_85_2.trialID
			end
		else
			return true, arg_85_1.trialID > arg_85_2.trialID
		end
	end

	return false, false
end

function var_0_0.OnListChange(arg_86_0, arg_86_1, arg_86_2)
	arg_86_0.heroDataList_ = arg_86_2
	arg_86_0.selectHeroData_ = arg_86_0.heroDataList_[1]

	arg_86_0.heroHeadList_:StartScroll(#arg_86_0.heroDataList_)

	if #arg_86_0.heroDataList_ == 0 then
		arg_86_0.emptyController_:SetSelectedState("true")
		arg_86_0.heroAvatarView_:ShowHeroModel(false)
	else
		arg_86_0.emptyController_:SetSelectedState("false")
		arg_86_0.heroAvatarView_:ShowHeroModel(true)

		if not arg_86_0.params_.isEnter then
			arg_86_0:SelectHero(arg_86_0.heroDataList_[1])
		else
			arg_86_0.params_.isEnter = false
		end
	end
end

function var_0_0.OnHeroSort(arg_87_0, arg_87_1, arg_87_2, arg_87_3, arg_87_4, arg_87_5)
	arg_87_0.filterView_:RefreshSort(arg_87_1, arg_87_2, arg_87_3, arg_87_4, arg_87_5)
	HeroData:SaveSortValue(arg_87_1, arg_87_2, arg_87_3, arg_87_4, arg_87_5)
end

function var_0_0.GetTrialHeroList(arg_88_0)
	return GetTrialHeroList(arg_88_0.stageType_, arg_88_0.stageID_, arg_88_0.activityID_)
end

function var_0_0.GetHeroInfoViewClass(arg_89_0)
	return SectionHeroInfoView
end

function var_0_0.RecordMultiButtonTouch(arg_90_0)
	local var_90_0 = arg_90_0.selectHeroMode_ == SectionSelectHeroConst.SELECT_HERO_MODE.SINGLE and "combat_team_edit_morehero_close" or "combat_team_edit_morehero_open"

	OperationRecorder.RecordButtonTouch({
		button_name = var_90_0,
		stage_id = arg_90_0.stageID_
	})
end

return var_0_0
