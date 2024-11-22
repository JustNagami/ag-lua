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

function var_0_0.SubViewOnEnter(arg_19_0)
	arg_19_0.heroAvatarView_:OnEnter()

	if not arg_19_0.params_.isBack and arg_19_0.filterView_ and arg_19_0.autoClearFilter_ then
		arg_19_0.filterView_:Reset(true)
		CommonFilterData:ClearFilter(Filter_Root_Define.Hero_Filter_List.filter_id)
	end

	arg_19_0.filterView_:OnEnter(arg_19_0.heroViewProxy_)

	if arg_19_0.heroInfoView_ then
		arg_19_0.heroInfoView_:OnEnter(arg_19_0.heroViewProxy_)
	end
end

function var_0_0.SubViewOnExit(arg_20_0)
	arg_20_0.heroAvatarView_:OnExit()

	if arg_20_0.filterView_ and arg_20_0.filterView_.OnExit then
		arg_20_0.filterView_:OnExit()
	end

	if #arg_20_0.heroDataList_ <= 0 then
		HeroData:ResetSortValue()
		arg_20_0.filterView_:Reset()
	end

	arg_20_0.heroInfoView_:OnExit()
end

function var_0_0.RefreshHeroDataList(arg_21_0)
	local var_21_0 = {}

	arg_21_0.allTrialIDList_ = {}
	arg_21_0.customHeroList_, arg_21_0.canSwitchResctrictHeroList_ = SectionSelectHeroTools.GetRestrictHeroList(arg_21_0.params_.stageType, arg_21_0.params_.stageID)
	arg_21_0.curCanSwitchRestrictHero_ = arg_21_0.canSwitchResctrictHeroList_[arg_21_0.params_.selectHeroPos] ~= ReserveConst.RESTRICT_HERO_SWITCH_MODE.FORBID

	local var_21_1
	local var_21_2
	local var_21_3, var_21_4 = SectionSelectHeroTools.GetRestrictHeroPosDic(arg_21_0.params_.stageType, arg_21_0.params_.stageID)

	if arg_21_0.customHeroList_[arg_21_0.params_.selectHeroPos][1] then
		arg_21_0:ProcessCustomHeroData(var_21_0, var_21_4)
	else
		arg_21_0:ProcessOwnHeroData(var_21_0, var_21_3)
		arg_21_0:ProcessTrialHeroData(var_21_0, var_21_4)
	end

	for iter_21_0, iter_21_1 in pairs(arg_21_0.heroViewProxyDic_) do
		iter_21_1:SetTempHeroList(arg_21_0.allTrialIDList_)
	end

	arg_21_0.filterView_:SetHeroIdList(var_21_0)
end

function var_0_0.ProcessCustomHeroData(arg_22_0, arg_22_1, arg_22_2)
	if arg_22_0.curCanSwitchRestrictHero_ == true then
		local var_22_0 = 1
		local var_22_1 = 2

		while var_22_0 <= #arg_22_0.customHeroList_[arg_22_0.params_.selectHeroPos] and var_22_1 <= #arg_22_0.customHeroList_[arg_22_0.params_.selectHeroPos] do
			local var_22_2 = arg_22_0.customHeroList_[arg_22_0.params_.selectHeroPos][var_22_0]
			local var_22_3 = arg_22_0.customHeroList_[arg_22_0.params_.selectHeroPos][var_22_1]

			arg_22_0:InsertHeroDataList(arg_22_1, var_22_2, var_22_3, HeroConst.HERO_DATA_TYPE.TRIAL)

			if arg_22_0.canSwitchResctrictHeroList_[arg_22_0.params_.selectHeroPos] == ReserveConst.RESTRICT_HERO_SWITCH_MODE.OWN_AND_TRIAL and HeroTools.GetHeroIsUnlock(var_22_2) then
				arg_22_0:InsertHeroDataList(arg_22_1, var_22_2, 0, arg_22_0.heroDataType_)
			end

			var_22_0 = var_22_0 + 2
			var_22_1 = var_22_1 + 2
		end
	else
		for iter_22_0, iter_22_1 in pairs(arg_22_2) do
			arg_22_0:InsertHeroDataList(arg_22_1, HeroStandardSystemCfg[iter_22_0].hero_id, iter_22_0, HeroConst.HERO_DATA_TYPE.TRIAL)
		end
	end
end

function var_0_0.ProcessOwnHeroData(arg_23_0, arg_23_1, arg_23_2)
	for iter_23_0, iter_23_1 in pairs(arg_23_0:GetHeroList()) do
		if not arg_23_2[iter_23_1] then
			arg_23_0:InsertHeroDataList(arg_23_1, iter_23_1, 0, arg_23_0.heroDataType_)
		end
	end
end

function var_0_0.ProcessTrialHeroData(arg_24_0, arg_24_1, arg_24_2)
	local var_24_0 = arg_24_0:GetTrialHeroList()

	for iter_24_0, iter_24_1 in pairs(var_24_0) do
		if not arg_24_2[iter_24_1] then
			arg_24_0:InsertHeroDataList(arg_24_1, HeroStandardSystemCfg[iter_24_1].hero_id, iter_24_1, HeroConst.HERO_DATA_TYPE.TRIAL)
		end
	end
end

function var_0_0.InsertHeroDataList(arg_25_0, arg_25_1, arg_25_2, arg_25_3, arg_25_4)
	table.insert(arg_25_1, {
		id = arg_25_2,
		trialID = arg_25_3,
		type = arg_25_4,
		heroViewProxy = arg_25_0:GetHeroViewProxy(arg_25_4)
	})

	if arg_25_3 and arg_25_3 ~= 0 then
		table.insert(arg_25_0.allTrialIDList_, arg_25_3)
	end
end

function var_0_0.RefreshHeroList(arg_26_0)
	if #arg_26_0.heroDataList_ <= 0 then
		return
	end

	arg_26_0.selectHeroData_ = arg_26_0:GetDefaultHeroData()

	local var_26_0 = 1

	for iter_26_0, iter_26_1 in ipairs(arg_26_0.heroDataList_) do
		if iter_26_1.id == arg_26_0.selectHeroData_.id and iter_26_1.trialID == arg_26_0.selectHeroData_.trialID then
			var_26_0 = iter_26_0

			break
		end
	end

	arg_26_0.heroHeadList_:StartScroll(#arg_26_0.heroDataList_, var_26_0)
	arg_26_0:SelectHero(arg_26_0.selectHeroData_)
end

function var_0_0.SelectHero(arg_27_0, arg_27_1)
	arg_27_0.selectHeroData_ = arg_27_1

	for iter_27_0, iter_27_1 in pairs(arg_27_0.heroHeadList_:GetItemList()) do
		iter_27_1:SetSelected(iter_27_1.heroId_ == arg_27_0.selectHeroData_.id and iter_27_1.trialID_ == arg_27_0.selectHeroData_.trialID)
	end

	arg_27_0:RefreshInfoBtn()
	arg_27_0:UpdateHeroView()
	arg_27_0:RefreshJoinBtn()
end

function var_0_0.RefreshInfoBtn(arg_28_0)
	if arg_28_0.params_.hideInfoBtn or HeroTools.NeedHideInfo(arg_28_0.selectHeroData_.id) or HeroTools.IsNPC(arg_28_0.selectHeroData_.id) then
		arg_28_0.infoBtnController_:SetSelectedState("off")
	else
		arg_28_0.infoBtnController_:SetSelectedState("on")
	end
end

function var_0_0.UpdateHeroView(arg_29_0)
	local var_29_0 = arg_29_0.selectHeroData_.id
	local var_29_1 = arg_29_0.selectHeroData_.heroViewProxy:GetHeroData(var_29_0, {
		arg_29_0.selectHeroData_.trialID
	})
	local var_29_2 = arg_29_0.selectHeroData_.heroViewProxy:GetHeroUsingSkinInfo(var_29_0, {
		arg_29_0.selectHeroData_.trialID
	}).id

	arg_29_0.heroAvatarView_:SetSkinId(var_29_2)
	arg_29_0.heroInfoView_:SetProxy(arg_29_0.selectHeroData_.heroViewProxy)
	arg_29_0.heroInfoView_:SetHeroInfo(var_29_1)
	arg_29_0.heroInfoView_:UpdateView()
end

function var_0_0.RefreshJoinBtn(arg_30_0)
	arg_30_0.joinBtn_.interactable = true

	if arg_30_0.lockStateList_[arg_30_0.params_.selectHeroPos] == true then
		arg_30_0.joinBtnController_:SetSelectedState("lock")

		arg_30_0.joinBtn_.interactable = false
	elseif table.keyof(arg_30_0.lockHeroList_, arg_30_0.selectHeroData_.id) or table.keyof(arg_30_0.lockHeroList_, arg_30_0.selectHeroData_.trialID) then
		arg_30_0.joinBtnController_:SetSelectedState("lock")

		arg_30_0.joinBtn_.interactable = false
	elseif arg_30_0:IsSameHeroInTeam(arg_30_0.selectHeroData_.id) and not arg_30_0:IsInTeam(arg_30_0.selectHeroData_.id, arg_30_0.selectHeroData_.trialID) then
		if arg_30_0.heroTeam_[arg_30_0.params_.selectHeroPos] ~= arg_30_0.selectHeroData_.id then
			arg_30_0.joinBtnController_:SetSelectedState("lock")

			arg_30_0.joinBtn_.interactable = false
		else
			arg_30_0.joinBtnController_:SetSelectedState("change")
		end
	elseif arg_30_0.heroTeam_[arg_30_0.params_.selectHeroPos] == 0 then
		if arg_30_0:IsInTeam(arg_30_0.selectHeroData_.id, arg_30_0.selectHeroData_.trialID) then
			arg_30_0.joinBtnController_:SetSelectedState("change")
		else
			arg_30_0.joinBtnController_:SetSelectedState("add")
		end
	elseif arg_30_0.selectHeroData_.id == arg_30_0.heroTeam_[arg_30_0.params_.selectHeroPos] then
		if arg_30_0.customHeroList_[arg_30_0.params_.selectHeroPos][1] and arg_30_0.curCanSwitchRestrictHero_ == true then
			arg_30_0.joinBtnController_:SetSelectedState("cantRemove")

			arg_30_0.joinBtn_.interactable = false
		else
			local var_30_0 = 0

			for iter_30_0, iter_30_1 in pairs(arg_30_0.heroTeam_) do
				if iter_30_1 ~= 0 then
					var_30_0 = var_30_0 + 1
				end
			end

			if var_30_0 == 1 and not arg_30_0.params_.canCleanTeam then
				arg_30_0.joinBtn_.interactable = false

				arg_30_0.joinBtnController_:SetSelectedState("cantRemove")
			else
				arg_30_0.joinBtnController_:SetSelectedState("out")
			end
		end
	else
		arg_30_0.joinBtnController_:SetSelectedState("change")
	end
end

function var_0_0.GetHeroTeam(arg_31_0)
	arg_31_0.heroTeam_, arg_31_0.lockStateList_, arg_31_0.lockHeroList_, arg_31_0.heroTrialList_ = arg_31_0.sectionProxy_:CustomGetTeamData()
end

function var_0_0.GetHeroList(arg_32_0)
	local var_32_0 = {}

	if arg_32_0.params_.canUseOwnHero ~= false then
		var_32_0 = HeroTools.Sort(HeroData:GetHeroList())
	end

	return var_32_0
end

function var_0_0.GetDefaultHeroData(arg_33_0)
	if arg_33_0.params_.curSelectHeroData and arg_33_0.params_.curSelectHeroData.id ~= 0 then
		for iter_33_0, iter_33_1 in ipairs(arg_33_0.heroDataList_) do
			if iter_33_1.id == arg_33_0.params_.curSelectHeroData.id and iter_33_1.trialID == arg_33_0.params_.curSelectHeroData.trialID then
				return arg_33_0.params_.curSelectHeroData
			end
		end
	end

	if not arg_33_0.params_.isBack then
		local var_33_0 = arg_33_0.heroTeam_[arg_33_0.params_.selectHeroPos] or 0
		local var_33_1 = arg_33_0.heroTrialList_[arg_33_0.params_.selectHeroPos] or 0

		if var_33_0 ~= 0 then
			for iter_33_2, iter_33_3 in ipairs(arg_33_0.heroDataList_) do
				if iter_33_3.id == var_33_0 and iter_33_3.trialID == var_33_1 then
					return iter_33_3
				end
			end

			return {
				id = var_33_0,
				trialID = var_33_1,
				type = arg_33_0.heroDataType_,
				heroViewProxy = arg_33_0:GetHeroViewProxy(arg_33_0.heroDataType_)
			}
		end
	end

	for iter_33_4, iter_33_5 in ipairs(arg_33_0.heroDataList_) do
		local var_33_2 = iter_33_5.id
		local var_33_3 = iter_33_5.trialID

		if not arg_33_0:IsInTeam(var_33_2, iter_33_5.trialID) and not table.keyof(arg_33_0.lockHeroList_, var_33_2) and not table.keyof(arg_33_0.lockHeroList_, var_33_3) then
			return iter_33_5
		end
	end

	if #arg_33_0.heroDataList_ > 0 then
		return arg_33_0.heroDataList_[1]
	end

	return nil
end

function var_0_0.OnInfoBtnClick(arg_34_0)
	arg_34_0:Go("/newHero", {
		isEnter = true,
		hid = arg_34_0.selectHeroData_.trialID ~= 0 and arg_34_0.selectHeroData_.trialID or arg_34_0.selectHeroData_.id,
		type = arg_34_0.selectHeroData_.trialID ~= 0 and HeroConst.HERO_DATA_TYPE.TRIAL or arg_34_0.heroDataType_,
		tempHeroList = arg_34_0:GetValidTrailList()
	})
end

function var_0_0.GetValidTrailList(arg_35_0)
	local var_35_0 = {}

	if arg_35_0.selectHeroData_.trialID ~= 0 then
		for iter_35_0, iter_35_1 in pairs(arg_35_0.allTrialIDList_) do
			local var_35_1 = HeroStandardSystemCfg[iter_35_1]

			if not HeroTools.IsNPC(var_35_1.hero_id) and not HeroTools.NeedHideInfo(var_35_1.hero_id) then
				table.insert(var_35_0, iter_35_1)
			end
		end
	end

	return var_35_0
end

function var_0_0.OnJoinClick(arg_36_0)
	local var_36_0 = arg_36_0.heroTeam_
	local var_36_1 = arg_36_0.heroTrialList_
	local var_36_2 = arg_36_0:IsSameHeroInTeam(arg_36_0.selectHeroData_.id)

	if arg_36_0.selectHeroData_.id == var_36_0[arg_36_0.params_.selectHeroPos] and arg_36_0.selectHeroData_.trialID == var_36_1[arg_36_0.params_.selectHeroPos] and var_36_2 then
		var_36_0[arg_36_0.params_.selectHeroPos] = 0
		var_36_1[arg_36_0.params_.selectHeroPos] = 0
	elseif var_36_2 then
		local var_36_3 = 1

		for iter_36_0, iter_36_1 in pairs(var_36_0) do
			if iter_36_1 == arg_36_0.selectHeroData_.id then
				var_36_3 = iter_36_0

				break
			end
		end

		if var_36_0[var_36_3] == arg_36_0.selectHeroData_.id and var_36_1[var_36_3] ~= arg_36_0.selectHeroData_.trialID then
			var_36_0[var_36_3] = arg_36_0.selectHeroData_.id
			var_36_1[var_36_3] = arg_36_0.selectHeroData_.trialID
		end

		local var_36_4 = var_36_0[var_36_3]

		var_36_0[var_36_3] = var_36_0[arg_36_0.params_.selectHeroPos]
		var_36_0[arg_36_0.params_.selectHeroPos] = var_36_4

		local var_36_5 = var_36_1[var_36_3]

		var_36_1[var_36_3] = var_36_1[arg_36_0.params_.selectHeroPos]
		var_36_1[arg_36_0.params_.selectHeroPos] = var_36_5

		HeroTools.PlayTalk(arg_36_0.selectHeroData_.id, "team")
	else
		var_36_0[arg_36_0.params_.selectHeroPos] = arg_36_0.selectHeroData_.id
		var_36_1[arg_36_0.params_.selectHeroPos] = arg_36_0.selectHeroData_.trialID

		HeroTools.PlayTalk(arg_36_0.selectHeroData_.id, "team")
	end

	if arg_36_0.canSwitchResctrictHeroList_[arg_36_0.params_.selectHeroPos] == ReserveConst.RESTRICT_HERO_SWITCH_MODE.FORBID and (arg_36_0.params_.reorder == nil or arg_36_0.params_.reorder == true) then
		arg_36_0:ReorderHeroTeam(var_36_0, var_36_1, arg_36_0.canSwitchResctrictHeroList_)
	end

	arg_36_0:TryToChangeTeam(var_36_0, var_36_1)
end

function var_0_0.TryToChangeTeam(arg_37_0, arg_37_1, arg_37_2)
	arg_37_0:ChangeTeam(arg_37_1, arg_37_2)
	arg_37_0:OnChangeTeamSuccess()
end

function var_0_0.ChangeTeam(arg_38_0, arg_38_1, arg_38_2)
	arg_38_0.sectionProxy_:ChangeHeroTeam(arg_38_1, arg_38_2)
end

function var_0_0.OnChangeTeamSuccess(arg_39_0)
	arg_39_0.heroAvatarView_:RemoveTween()
	arg_39_0:Back(1, {
		isSorted = true
	})
end

function var_0_0.IsInTeam(arg_40_0, arg_40_1, arg_40_2)
	return SectionSelectHeroTools.IsInTeam(arg_40_1, arg_40_2, arg_40_0.heroTeam_, arg_40_0.heroTrialList_)
end

function var_0_0.IsSameHeroInTeam(arg_41_0, arg_41_1)
	return SectionSelectHeroTools.IsSameHeroInTeam(arg_41_1, arg_41_0.heroTeam_)
end

function var_0_0.ReorderHeroTeam(arg_42_0, arg_42_1, arg_42_2, arg_42_3)
	SectionSelectHeroTools.ReorderHeroTeam(arg_42_1, arg_42_2, arg_42_3)
end

function var_0_0.GetHeroHeadClass(arg_43_0)
	return SectionHeroTeamHeadItem
end

function var_0_0.HeadRenderer(arg_44_0, arg_44_1, arg_44_2)
	local var_44_0 = arg_44_0.heroDataList_[arg_44_1].id
	local var_44_1 = arg_44_0.heroDataList_[arg_44_1].trialID

	arg_44_2:SetSectionHeroData(arg_44_0.heroDataList_[arg_44_1])
	arg_44_2:SetSelected(arg_44_2.heroId_ == arg_44_0.selectHeroData_.id and arg_44_2.trialID_ == arg_44_0.selectHeroData_.trialID)
	arg_44_2:RegisterClickListener(function()
		arg_44_0:SelectHero(arg_44_0.heroDataList_[arg_44_1])
	end)
	arg_44_2:SetInTeamFlag(arg_44_0:IsInTeam(var_44_0, var_44_1))
	arg_44_2:SetHeroLock(table.keyof(arg_44_0.lockHeroList_, var_44_0) ~= nil or table.keyof(arg_44_0.lockHeroList_, var_44_1) ~= nil)
end

function var_0_0.GetHeroViewProxy(arg_46_0, arg_46_1)
	if not arg_46_0.heroViewProxyDic_[arg_46_1] then
		arg_46_0.heroViewProxyDic_[arg_46_1] = HeroViewDataProxy.New(arg_46_1)
	end

	return arg_46_0.heroViewProxyDic_[arg_46_1]
end

function var_0_0.GetFilterClass(arg_47_0)
	return NewHeroListFilterView
end

function var_0_0.ExtraSorter(arg_48_0, arg_48_1, arg_48_2, arg_48_3, arg_48_4)
	local var_48_0, var_48_1, var_48_2 = SectionSelectHeroTools.IsInTeam(arg_48_1.id, arg_48_1.trialID, arg_48_0.heroTeam_, arg_48_0.heroTrialList_)
	local var_48_3, var_48_4, var_48_5 = SectionSelectHeroTools.IsInTeam(arg_48_2.id, arg_48_2.trialID, arg_48_0.heroTeam_, arg_48_0.heroTrialList_)

	if var_48_0 ~= var_48_3 then
		if var_48_0 and not var_48_3 then
			return true, true
		elseif not var_48_0 and var_48_3 then
			return true, false
		else
			return true, var_48_2 < var_48_5
		end
	end

	if arg_48_1.trialID ~= 0 or arg_48_2.trialID ~= 0 then
		if arg_48_1.trialID ~= 0 and arg_48_2.trialID ~= 0 then
			if arg_48_3 == 0 and arg_48_1.star ~= arg_48_2.star then
				if arg_48_0.curOrder_ == "desc" then
					return true, arg_48_1.star > arg_48_2.star
				else
					return true, arg_48_1.star < arg_48_2.star
				end
			end

			local var_48_6 = getHeroPower(arg_48_1.trialID, true)
			local var_48_7 = getHeroPower(arg_48_2.trialID, true)

			if var_48_6 ~= var_48_7 then
				if arg_48_4 == "desc" then
					return true, var_48_7 < var_48_6
				else
					return true, var_48_6 < var_48_7
				end
			else
				return true, arg_48_1.trialID > arg_48_2.trialID
			end
		else
			return true, arg_48_1.trialID > arg_48_2.trialID
		end
	end

	return false, false
end

function var_0_0.OnListChange(arg_49_0, arg_49_1, arg_49_2)
	arg_49_0.heroDataList_ = arg_49_2
	arg_49_0.selectHeroData_ = arg_49_0.heroDataList_[1]

	arg_49_0.heroHeadList_:StartScroll(#arg_49_0.heroDataList_)

	if #arg_49_0.heroDataList_ == 0 then
		arg_49_0.emptyController_:SetSelectedState("true")
		arg_49_0.heroAvatarView_:ShowHeroModel(false)
	else
		arg_49_0.emptyController_:SetSelectedState("false")
		arg_49_0.heroAvatarView_:ShowHeroModel(true)

		if not arg_49_0.params_.isEnter then
			arg_49_0:SelectHero(arg_49_0.heroDataList_[1])
		else
			arg_49_0.params_.isEnter = false
		end
	end
end

function var_0_0.OnHeroSort(arg_50_0, arg_50_1, arg_50_2, arg_50_3, arg_50_4, arg_50_5)
	arg_50_0.filterView_:RefreshSort(arg_50_1, arg_50_2, arg_50_3, arg_50_4, arg_50_5)
	HeroData:SaveSortValue(arg_50_1, arg_50_2, arg_50_3, arg_50_4, arg_50_5)
end

function var_0_0.GetTrialHeroList(arg_51_0)
	return GetTrialHeroList(arg_51_0.params_.stageType, arg_51_0.params_.stageID, arg_51_0.params_.activityID)
end

return var_0_0
