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
	arg_9_0:UpdateBar()
	arg_9_0:ProcessParams()
	arg_9_0:Reset()
	arg_9_0:SubViewOnEnter()
	arg_9_0:GetHeroTeam()
	arg_9_0:RefreshHeroDataList()
	arg_9_0:RefreshUI()
end

function var_0_0.ReserveCameraEnter(arg_10_0)
	manager.loadScene:SetSceneActive(SceneConst.SCENE_NAME.reserve, true)
	SectionSelectHeroScene.GetInstance():SetALlStateGoActive(false)
end

function var_0_0.ProcessCamera(arg_11_0, arg_11_1)
	local var_11_0 = ReserveCameraConst.VIRTUAL_CAMERA[string.format("heroPos_%s", arg_11_0.params_.selectHeroPos or 1)]

	manager.reserveCamera:SwitchCamera(ReserveCameraConst.CAMERA_TYPE.hero, var_11_0, {
		skinID = arg_11_1
	})
end

function var_0_0.OnTop(arg_12_0)
	manager.windowBar:RegistBackCallBack(function()
		arg_12_0:Back(1, {
			isSorted = true
		})
	end)
end

function var_0_0.OnExit(arg_14_0)
	arg_14_0:SubViewOnExit()

	arg_14_0.params_.curSelectHeroData = arg_14_0.selectHeroData_
	arg_14_0.selectHeroData_ = nil

	manager.windowBar:HideBar()
	manager.loadScene:SetSceneActive(SceneConst.SCENE_NAME.reserve, false)
	SectionSelectHeroScene.GetInstance():DestroyModels()
end

function var_0_0.Dispose(arg_15_0)
	if arg_15_0.filterView_ then
		arg_15_0.filterView_:Dispose()

		arg_15_0.filterView_ = nil
	end

	if arg_15_0.heroHeadList_ then
		arg_15_0.heroHeadList_:Dispose()

		arg_15_0.heroHeadList_ = nil
	end

	if arg_15_0.heroInfoView_ then
		arg_15_0.heroInfoView_:Dispose()

		arg_15_0.heroInfoView_ = nil
	end

	var_0_0.super.Dispose(arg_15_0)
end

function var_0_0.UpdateBar(arg_16_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR
	})
end

function var_0_0.ProcessParams(arg_17_0)
	arg_17_0:ProcessBaseParams()
	arg_17_0:ProcessReserveParams()
	arg_17_0:ProcessProxyParams()
	arg_17_0:ProcessCustomParams()
end

function var_0_0.ProcessBaseParams(arg_18_0)
	arg_18_0.stageID_ = arg_18_0.params_.stageID
	arg_18_0.stageType_ = arg_18_0.params_.stageType or BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_UNDEFINED
	arg_18_0.activityID_ = arg_18_0.params_.activityID
	arg_18_0.params_.selectHeroPos = arg_18_0.params_.selectHeroPos or 1

	if arg_18_0.params_.reorder == nil then
		arg_18_0.params_.reorder = true
	end

	arg_18_0.reorder_ = arg_18_0.params_.reorder

	if arg_18_0.params_.hideInfoBtn == nil then
		arg_18_0.params_.hideInfoBtn = false
	end

	arg_18_0.hideInfoBtn_ = arg_18_0.params_.hideInfoBtn

	if arg_18_0.params_.canCleanTeam == nil then
		arg_18_0.params_.canCleanTeam = false
	end

	arg_18_0.canCleanTeam_ = arg_18_0.params_.canCleanTeam

	if arg_18_0.params_.canUseOwnHero == nil then
		arg_18_0.params_.canUseOwnHero = true
	end

	arg_18_0.canUseOwnHero_ = arg_18_0.params_.canUseOwnHero

	if arg_18_0.params_.canUseMultiMode == nil then
		arg_18_0.params_.canUseMultiMode = SectionSelectHeroTools.CanUseMultiMode(arg_18_0.stageType_, arg_18_0.stageID_)
	end

	arg_18_0.canUseMultiMode_ = arg_18_0.params_.canUseMultiMode
end

function var_0_0.ProcessReserveParams(arg_19_0)
	if not arg_19_0.params_.reserveParams then
		arg_19_0.params_.reserveParams = ReserveTools.GetReserveParams(arg_19_0.stageType_, arg_19_0.stageID_, arg_19_0.activityID_)
	elseif not arg_19_0.params_.reserveParams.customData.activityID then
		arg_19_0.params_.reserveParams.customData.activityID = arg_19_0.activityID_
	end

	arg_19_0.reserveParams_ = arg_19_0.params_.reserveParams
end

function var_0_0.ProcessProxyParams(arg_20_0)
	arg_20_0.params_.heroDataType = arg_20_0.params_.heroDataType or HeroConst.HERO_DATA_TYPE.DEFAULT
	arg_20_0.heroDataType_ = arg_20_0.params_.heroDataType

	if not arg_20_0.params_.sectionProxy then
		arg_20_0.params_.sectionProxy = SectionSelectHeroTools.GetProxy(arg_20_0.params_, arg_20_0.reserveParams_, arg_20_0.heroDataType_)
	end

	arg_20_0.sectionProxy_ = arg_20_0.params_.sectionProxy
	arg_20_0.heroViewProxy_ = arg_20_0.sectionProxy_:GetHeroViewProxy()
	arg_20_0.heroViewProxyDic_ = {}
	arg_20_0.heroViewProxyDic_[arg_20_0.heroDataType_] = arg_20_0.heroViewProxy_
end

function var_0_0.ProcessCustomParams(arg_21_0)
	return
end

function var_0_0.Reset(arg_22_0)
	if not arg_22_0.params_.isBack then
		if arg_22_0.filterView_ and arg_22_0.autoClearFilter_ then
			arg_22_0.filterView_:Reset(true)
			CommonFilterData:ClearFilter(Filter_Root_Define.Hero_Filter_List.filter_id)
		end

		arg_22_0:ResetSelectMode()
	end
end

function var_0_0.SubViewOnEnter(arg_23_0)
	arg_23_0.filterView_:OnEnter(arg_23_0.heroViewProxy_)

	if arg_23_0.heroInfoView_ then
		arg_23_0.heroInfoView_:OnEnter(arg_23_0.heroViewProxy_)
	end
end

function var_0_0.SubViewOnExit(arg_24_0)
	if arg_24_0.filterView_ and arg_24_0.filterView_.OnExit then
		arg_24_0.filterView_:OnExit()
	end

	if #arg_24_0.heroDataList_ <= 0 then
		HeroData:ResetSortValue()
		arg_24_0.filterView_:Reset()
	end

	arg_24_0.heroInfoView_:OnExit()
end

function var_0_0.ProcessHeroDataList(arg_25_0, arg_25_1, arg_25_2, arg_25_3)
	if arg_25_0.customHeroList_[arg_25_0.params_.selectHeroPos][1] then
		arg_25_0:ProcessCustomHeroData(arg_25_1, arg_25_2)
	else
		arg_25_0:ProcessOwnHeroData(arg_25_1, arg_25_3)
		arg_25_0:ProcessTrialHeroData(arg_25_1, arg_25_2)
	end
end

function var_0_0.RefreshHeroDataList(arg_26_0)
	local var_26_0 = {}

	arg_26_0.allTrialIDList_ = {}
	arg_26_0.customHeroList_, arg_26_0.canSwitchResctrictHeroList_ = SectionSelectHeroTools.GetRestrictHeroList(arg_26_0.stageType_, arg_26_0.stageID_)
	arg_26_0.curCanSwitchRestrictHero_ = arg_26_0.canSwitchResctrictHeroList_[arg_26_0.params_.selectHeroPos] ~= ReserveConst.RESTRICT_HERO_SWITCH_MODE.FORBID

	local var_26_1
	local var_26_2
	local var_26_3, var_26_4 = SectionSelectHeroTools.GetRestrictHeroPosDic(arg_26_0.stageType_, arg_26_0.stageID_)

	arg_26_0:ProcessHeroDataList(var_26_0, var_26_4, var_26_3)

	for iter_26_0, iter_26_1 in pairs(arg_26_0.heroViewProxyDic_) do
		iter_26_1:SetTempHeroList(arg_26_0.allTrialIDList_)
	end

	arg_26_0.heroDataList_ = var_26_0
end

function var_0_0.ProcessCustomHeroData(arg_27_0, arg_27_1, arg_27_2)
	if arg_27_0.curCanSwitchRestrictHero_ == true then
		local var_27_0 = 1
		local var_27_1 = 2

		while var_27_0 <= #arg_27_0.customHeroList_[arg_27_0.params_.selectHeroPos] and var_27_1 <= #arg_27_0.customHeroList_[arg_27_0.params_.selectHeroPos] do
			local var_27_2 = arg_27_0.customHeroList_[arg_27_0.params_.selectHeroPos][var_27_0]
			local var_27_3 = arg_27_0.customHeroList_[arg_27_0.params_.selectHeroPos][var_27_1]

			arg_27_0:InsertHeroDataList(arg_27_1, var_27_2, var_27_3, HeroConst.HERO_DATA_TYPE.TRIAL)

			if arg_27_0.canSwitchResctrictHeroList_[arg_27_0.params_.selectHeroPos] == ReserveConst.RESTRICT_HERO_SWITCH_MODE.OWN_AND_TRIAL and HeroTools.GetHeroIsUnlock(var_27_2) then
				arg_27_0:InsertHeroDataList(arg_27_1, var_27_2, 0, arg_27_0.heroDataType_)
			end

			var_27_0 = var_27_0 + 2
			var_27_1 = var_27_1 + 2
		end
	else
		for iter_27_0, iter_27_1 in pairs(arg_27_2) do
			arg_27_0:InsertHeroDataList(arg_27_1, HeroStandardSystemCfg[iter_27_0].hero_id, iter_27_0, HeroConst.HERO_DATA_TYPE.TRIAL)
		end
	end
end

function var_0_0.ProcessOwnHeroData(arg_28_0, arg_28_1, arg_28_2)
	for iter_28_0, iter_28_1 in pairs(arg_28_0:GetHeroList()) do
		if not arg_28_2[iter_28_1] then
			arg_28_0:InsertHeroDataList(arg_28_1, iter_28_1, 0, arg_28_0.heroDataType_)
		end
	end
end

function var_0_0.ProcessTrialHeroData(arg_29_0, arg_29_1, arg_29_2)
	local var_29_0 = arg_29_0:GetTrialHeroList()

	for iter_29_0, iter_29_1 in pairs(var_29_0) do
		if not arg_29_2[iter_29_1] then
			arg_29_0:InsertHeroDataList(arg_29_1, HeroStandardSystemCfg[iter_29_1].hero_id, iter_29_1, HeroConst.HERO_DATA_TYPE.TRIAL)
		end
	end
end

function var_0_0.InsertHeroDataList(arg_30_0, arg_30_1, arg_30_2, arg_30_3, arg_30_4)
	table.insert(arg_30_1, {
		id = arg_30_2,
		trialID = arg_30_3,
		type = arg_30_4,
		heroViewProxy = arg_30_0:GetHeroViewProxy(arg_30_4)
	})

	if arg_30_3 and arg_30_3 ~= 0 then
		table.insert(arg_30_0.allTrialIDList_, arg_30_3)
	end
end

function var_0_0.GetSelectHeroData(arg_31_0)
	if arg_31_0.params_.isEnter then
		arg_31_0.params_.isEnter = false

		local var_31_0 = arg_31_0.heroTeam_[arg_31_0.params_.selectHeroPos] or 0
		local var_31_1 = arg_31_0.heroTrialList_[arg_31_0.params_.selectHeroPos] or 0

		if var_31_0 ~= 0 then
			for iter_31_0, iter_31_1 in ipairs(arg_31_0.heroDataList_) do
				if iter_31_1.id == var_31_0 and iter_31_1.trialID == var_31_1 then
					return iter_31_1, iter_31_0
				end
			end
		end
	end

	if arg_31_0.params_.curSelectHeroData and arg_31_0.params_.curSelectHeroData.id ~= 0 then
		for iter_31_2, iter_31_3 in ipairs(arg_31_0.heroDataList_) do
			if iter_31_3.id == arg_31_0.params_.curSelectHeroData.id and iter_31_3.trialID == arg_31_0.params_.curSelectHeroData.trialID then
				return arg_31_0.params_.curSelectHeroData, iter_31_2
			end
		end
	end

	if arg_31_0.selectHeroData_ then
		for iter_31_4, iter_31_5 in ipairs(arg_31_0.heroDataList_) do
			if iter_31_5.id == arg_31_0.selectHeroData_.id and iter_31_5.trialID == arg_31_0.selectHeroData_.trialID then
				return arg_31_0.selectHeroData_, iter_31_4
			end
		end
	end

	for iter_31_6, iter_31_7 in ipairs(arg_31_0.heroDataList_) do
		local var_31_2 = iter_31_7.id
		local var_31_3 = iter_31_7.trialID

		if not arg_31_0:IsInTeam(var_31_2, iter_31_7.trialID) and not arg_31_0:IsHeroLock(var_31_2, var_31_3) then
			return iter_31_7, iter_31_6
		end
	end

	if #arg_31_0.heroDataList_ > 0 then
		return arg_31_0.heroDataList_[1], 1
	end

	return nil, 1
end

function var_0_0.RefreshUI(arg_32_0)
	arg_32_0.filterView_:SetHeroIdList(arg_32_0.heroDataList_)
end

function var_0_0.RefreshSelectModeUI(arg_33_0)
	arg_33_0:RefreshMultiModeBtn()

	if arg_33_0.selectHeroMode_ == SectionSelectHeroConst.SELECT_HERO_MODE.SINGLE then
		arg_33_0:RefreshSingleModeUI()
	else
		arg_33_0:RefreshMultiModeUI()
	end
end

function var_0_0.RefreshSingleModeUI(arg_34_0)
	arg_34_0:RefreshSingleModeHeadItem()
	arg_34_0:UpdateHeroView()
	arg_34_0:RefreshJoinBtn()
end

function var_0_0.RefreshSingleModeHeadItem(arg_35_0)
	for iter_35_0, iter_35_1 in pairs(arg_35_0.heroHeadList_:GetItemList()) do
		iter_35_1:SetSelected(iter_35_1.heroId_ == arg_35_0.selectHeroData_.id and iter_35_1.trialID_ == arg_35_0.selectHeroData_.trialID)
	end
end

function var_0_0.RefreshJoinBtn(arg_36_0)
	arg_36_0.joinBtn_.interactable = true

	if arg_36_0:IsPosLocked(arg_36_0.params_.selectHeroPos) then
		arg_36_0.joinBtnController_:SetSelectedState("lock")

		arg_36_0.joinBtn_.interactable = false
	elseif arg_36_0:IsHeroLock(arg_36_0.selectHeroData_.id, arg_36_0.selectHeroData_.trialID) then
		arg_36_0.joinBtnController_:SetSelectedState("lock")

		arg_36_0.joinBtn_.interactable = false
	elseif arg_36_0:IsSameHeroInTeam(arg_36_0.selectHeroData_.id) and not arg_36_0:IsInTeam(arg_36_0.selectHeroData_.id, arg_36_0.selectHeroData_.trialID) then
		if arg_36_0.heroTeam_[arg_36_0.params_.selectHeroPos] ~= arg_36_0.selectHeroData_.id then
			arg_36_0.joinBtnController_:SetSelectedState("lock")

			arg_36_0.joinBtn_.interactable = false
		else
			arg_36_0.joinBtnController_:SetSelectedState("change")
		end
	elseif arg_36_0.heroTeam_[arg_36_0.params_.selectHeroPos] == 0 then
		if arg_36_0:IsInTeam(arg_36_0.selectHeroData_.id, arg_36_0.selectHeroData_.trialID) then
			arg_36_0.joinBtnController_:SetSelectedState("change")
		else
			arg_36_0.joinBtnController_:SetSelectedState("add")
		end
	elseif arg_36_0.selectHeroData_.id == arg_36_0.heroTeam_[arg_36_0.params_.selectHeroPos] then
		if arg_36_0.customHeroList_[arg_36_0.params_.selectHeroPos][1] and arg_36_0.curCanSwitchRestrictHero_ == true then
			arg_36_0.joinBtnController_:SetSelectedState("cantRemove")

			arg_36_0.joinBtn_.interactable = false
		else
			local var_36_0 = 0

			for iter_36_0, iter_36_1 in pairs(arg_36_0.heroTeam_) do
				if iter_36_1 ~= 0 then
					var_36_0 = var_36_0 + 1
				end
			end

			if var_36_0 == 1 and not arg_36_0.canCleanTeam_ then
				arg_36_0.joinBtn_.interactable = false

				arg_36_0.joinBtnController_:SetSelectedState("cantRemove")
			else
				arg_36_0.joinBtnController_:SetSelectedState("out")
			end
		end
	else
		arg_36_0.joinBtnController_:SetSelectedState("change")
	end
end

function var_0_0.UpdateHeroView(arg_37_0)
	arg_37_0:UpdateHeroModel()
	arg_37_0:UpdateHeroInfoView()
end

function var_0_0.UpdateHeroModel(arg_38_0)
	local var_38_0 = arg_38_0.selectHeroData_.id
	local var_38_1 = arg_38_0.selectHeroData_.heroViewProxy:GetHeroUsingSkinInfo(var_38_0, {
		arg_38_0.selectHeroData_.trialID
	}).id

	arg_38_0:LoadHeroModel(var_38_1)
	arg_38_0:ProcessCamera(var_38_1)
end

function var_0_0.LoadHeroModel(arg_39_0, arg_39_1)
	print("LoadHeroModel: " .. arg_39_1)

	local var_39_0 = arg_39_0.params_.selectHeroPos or 1

	SectionSelectHeroScene.GetInstance():OnlyDisplayModel(var_39_0)
	SectionSelectHeroScene.GetInstance():LoadTargetModel(var_39_0, arg_39_1)
end

function var_0_0.UpdateHeroInfoView(arg_40_0)
	local var_40_0 = arg_40_0.selectHeroData_.id
	local var_40_1 = arg_40_0.selectHeroData_.heroViewProxy:GetHeroData(var_40_0, {
		arg_40_0.selectHeroData_.trialID
	})

	arg_40_0.heroInfoView_:SetProxy(arg_40_0.selectHeroData_.heroViewProxy)
	arg_40_0.heroInfoView_:SetHeroInfo(var_40_1)
	arg_40_0.heroInfoView_:UpdateView()
end

function var_0_0.RefreshMultiModeUI(arg_41_0)
	arg_41_0:RefreshMultiModeHeadItem()
	arg_41_0:UpdateHeroView()
	arg_41_0:RefreshMultiJoinBtn()
end

function var_0_0.RefreshMultiModeHeadItem(arg_42_0)
	for iter_42_0, iter_42_1 in pairs(arg_42_0.heroHeadList_:GetItemList()) do
		iter_42_1:SetSelected(iter_42_1.heroId_ == arg_42_0.selectHeroData_.id and iter_42_1.trialID_ == arg_42_0.selectHeroData_.trialID)
		iter_42_1:SetMultiPos(arg_42_0:IsInTeam(iter_42_1.heroId_, iter_42_1.trialID_))
	end
end

function var_0_0.RefreshMultiJoinBtn(arg_43_0)
	arg_43_0.joinBtn_.interactable = true

	arg_43_0.joinBtnController_:SetSelectedState("add")
end

function var_0_0.RefreshInfoBtn(arg_44_0)
	if arg_44_0.hideInfoBtn_ or HeroTools.NeedHideInfo(arg_44_0.selectHeroData_.id) or HeroTools.IsNPC(arg_44_0.selectHeroData_.id) then
		arg_44_0.infoBtnController_:SetSelectedState("off")
	else
		arg_44_0.infoBtnController_:SetSelectedState("on")
	end
end

function var_0_0.RefreshMultiModeBtn(arg_45_0)
	if arg_45_0.multiModeActiveController_ then
		arg_45_0.multiModeActiveController_:SetSelectedState(arg_45_0.canUseMultiMode_ and "on" or "off")
	end

	if arg_45_0.selectModeController_ then
		arg_45_0.selectModeController_:SetSelectedState(arg_45_0.selectHeroMode_ == SectionSelectHeroConst.SELECT_HERO_MODE.SINGLE and "single" or "multi")
	end
end

function var_0_0.OnChangeMultiMode(arg_46_0)
	if arg_46_0.selectHeroMode_ == SectionSelectHeroConst.SELECT_HERO_MODE.SINGLE then
		arg_46_0:SwitchSelectMode(SectionSelectHeroConst.SELECT_HERO_MODE.MULTI)
	else
		arg_46_0:SwitchSelectMode(SectionSelectHeroConst.SELECT_HERO_MODE.SINGLE)
	end

	arg_46_0:RecordMultiButtonTouch()
end

function var_0_0.SwitchSelectMode(arg_47_0, arg_47_1)
	arg_47_0.selectHeroMode_ = arg_47_1

	if arg_47_0.selectHeroMode_ == SectionSelectHeroConst.SELECT_HERO_MODE.SINGLE then
		arg_47_0:SwitchToSingleMode()
	else
		arg_47_0:SwitchToMultiMode()
	end

	arg_47_0:RefreshSelectModeUI()
end

function var_0_0.SwitchToMultiMode(arg_48_0)
	arg_48_0:ResetMultiModeTeam()
	arg_48_0.heroHeadList_:Refresh()
end

function var_0_0.ResetMultiModeTeam(arg_49_0)
	arg_49_0.multiModeHeroList_ = deepClone(arg_49_0.heroTeam_)
	arg_49_0.multiModeTrialList_ = deepClone(arg_49_0.heroTrialList_)
end

function var_0_0.SwitchToSingleMode(arg_50_0)
	arg_50_0.heroHeadList_:Refresh()
end

function var_0_0.RefreshMultiModeTeam(arg_51_0, arg_51_1)
	local var_51_0 = arg_51_1.id
	local var_51_1 = arg_51_1.trialID
	local var_51_2, var_51_3, var_51_4 = arg_51_0:IsInTeam(var_51_0, var_51_1)

	if var_51_2 then
		arg_51_0.multiModeHeroList_[var_51_4] = 0
		arg_51_0.multiModeTrialList_[var_51_4] = 0
	else
		local var_51_5, var_51_6 = arg_51_0:CheckMultiModeCanAddHero(arg_51_1)

		if not var_51_5 then
			if var_51_6 then
				ShowTips(var_51_6)
			end

			return
		end

		local var_51_7 = arg_51_0:FindMultiModeNextValidTeamPos()

		if var_51_7 then
			arg_51_0.multiModeHeroList_[var_51_7] = var_51_0
			arg_51_0.multiModeTrialList_[var_51_7] = var_51_1
		end
	end
end

function var_0_0.CheckMultiModeCanAddHero(arg_52_0, arg_52_1)
	local var_52_0 = true
	local var_52_1 = ""

	if arg_52_0:IsHeroLock(arg_52_1.id, arg_52_1.trialID) then
		var_52_0 = false
		var_52_1 = nil
	elseif arg_52_0:IsMultiModeTeamFull() then
		var_52_0 = false
		var_52_1 = "THE_TEAM_IS_FULL"
	elseif arg_52_0:IsSameHeroInTeam(arg_52_1.id) then
		var_52_0 = false
		var_52_1 = "SELECT_SAME_HERO"
	end

	return var_52_0, var_52_1
end

function var_0_0.FindMultiModeNextValidTeamPos(arg_53_0)
	for iter_53_0, iter_53_1 in ipairs(arg_53_0.multiModeHeroList_) do
		if iter_53_1 == 0 and not arg_53_0.lockStateList_[iter_53_0] then
			return iter_53_0
		end
	end

	return nil
end

function var_0_0.IsMultiModeTeamFull(arg_54_0)
	for iter_54_0, iter_54_1 in ipairs(arg_54_0.multiModeHeroList_) do
		if iter_54_1 == 0 and not arg_54_0.lockStateList_[iter_54_0] then
			return false
		end
	end

	return true
end

function var_0_0.ResetSelectMode(arg_55_0)
	arg_55_0.selectHeroMode_ = SectionSelectHeroConst.SELECT_HERO_MODE.SINGLE

	arg_55_0:RefreshMultiModeBtn()
end

function var_0_0.GetTargetScrollIndex(arg_56_0)
	local var_56_0 = 1

	for iter_56_0, iter_56_1 in ipairs(arg_56_0.heroDataList_) do
		if iter_56_1.id == arg_56_0.selectHeroData_.id and iter_56_1.trialID == arg_56_0.selectHeroData_.trialID then
			var_56_0 = iter_56_0

			break
		end
	end

	return var_56_0
end

function var_0_0.SelectHero(arg_57_0, arg_57_1)
	if arg_57_0.selectHeroMode_ == SectionSelectHeroConst.SELECT_HERO_MODE.SINGLE then
		arg_57_0:SingleModeSelectHero(arg_57_1)
	else
		arg_57_0:MultiModeSelectHero(arg_57_1)
	end
end

function var_0_0.SingleModeSelectHero(arg_58_0, arg_58_1)
	arg_58_0.selectHeroData_ = arg_58_1

	arg_58_0:RefreshSingleModeUI()
	arg_58_0:RefreshInfoBtn()
end

function var_0_0.MultiModeSelectHero(arg_59_0, arg_59_1)
	arg_59_0.selectHeroData_ = arg_59_1

	arg_59_0:RefreshMultiModeUI()
	arg_59_0:RefreshInfoBtn()
end

function var_0_0.MultiModeChangeTeam(arg_60_0, arg_60_1)
	arg_60_0:RefreshMultiModeTeam(arg_60_1)
	arg_60_0:MultiModeSelectHero(arg_60_1)
end

function var_0_0.GetHeroTeam(arg_61_0)
	arg_61_0.heroTeam_, arg_61_0.lockStateList_, arg_61_0.lockHeroList_, arg_61_0.heroTrialList_ = arg_61_0.sectionProxy_:CustomGetTeamData()
end

function var_0_0.GetHeroList(arg_62_0)
	local var_62_0 = {}

	if arg_62_0.canUseOwnHero_ ~= false then
		var_62_0 = HeroTools.Sort(HeroData:GetHeroList())
	end

	return var_62_0
end

function var_0_0.OnInfoBtnClick(arg_63_0)
	arg_63_0:Go("/newHero", {
		isEnter = true,
		hid = arg_63_0.selectHeroData_.trialID ~= 0 and arg_63_0.selectHeroData_.trialID or arg_63_0.selectHeroData_.id,
		type = arg_63_0.selectHeroData_.trialID ~= 0 and HeroConst.HERO_DATA_TYPE.TRIAL or arg_63_0.heroDataType_,
		tempHeroList = arg_63_0:GetValidTrailList()
	})
end

function var_0_0.GetValidTrailList(arg_64_0)
	local var_64_0 = {}

	if arg_64_0.selectHeroData_.trialID ~= 0 then
		for iter_64_0, iter_64_1 in pairs(arg_64_0.allTrialIDList_) do
			local var_64_1 = HeroStandardSystemCfg[iter_64_1]

			if not HeroTools.IsNPC(var_64_1.hero_id) and not HeroTools.NeedHideInfo(var_64_1.hero_id) then
				table.insert(var_64_0, iter_64_1)
			end
		end
	end

	return var_64_0
end

function var_0_0.OnJoinClick(arg_65_0)
	local var_65_0
	local var_65_1
	local var_65_2

	if arg_65_0.selectHeroMode_ == SectionSelectHeroConst.SELECT_HERO_MODE.SINGLE then
		var_65_0, var_65_1, var_65_2 = arg_65_0:TryToChangeSingleHero(arg_65_0.selectHeroData_.id, arg_65_0.selectHeroData_.trialID, arg_65_0.params_.selectHeroPos)
	else
		var_65_0, var_65_1, var_65_2 = arg_65_0:TryToChangeMultiHero()
	end

	if var_65_0 then
		arg_65_0:TryToReoerderTeam(var_65_1, var_65_2)
		arg_65_0:TryToChangeTeam(var_65_1, var_65_2)
	end
end

function var_0_0.TryToChangeSingleHero(arg_66_0, arg_66_1, arg_66_2, arg_66_3)
	local var_66_0 = true
	local var_66_1, var_66_2 = arg_66_0:IsSameHeroInTeam(arg_66_1)
	local var_66_3 = deepClone(arg_66_0.heroTeam_)
	local var_66_4 = deepClone(arg_66_0.heroTrialList_)

	if var_66_1 then
		if var_66_2 == arg_66_3 then
			if arg_66_1 == var_66_3[var_66_2] then
				if arg_66_2 == var_66_4[var_66_2] then
					arg_66_0:RemoveHero(var_66_2, var_66_3, var_66_4)
				else
					var_66_0 = arg_66_0:AddHero(arg_66_3, arg_66_1, arg_66_2, var_66_3, var_66_4)

					if not var_66_0 then
						return var_66_0
					end

					SectionSelectHeroVoiceManager.GetInstance():SetNeedApperanceVoiceHeroId(arg_66_1)
				end
			end
		else
			arg_66_0:Swap(var_66_2, arg_66_3, var_66_3)
			arg_66_0:Swap(var_66_2, arg_66_3, var_66_4)
			SectionSelectHeroVoiceManager.GetInstance():SetNeedApperanceVoiceHeroId(arg_66_1)
		end
	else
		var_66_0 = arg_66_0:AddHero(arg_66_3, arg_66_1, arg_66_2, var_66_3, var_66_4)

		if not var_66_0 then
			return var_66_0
		end

		SectionSelectHeroVoiceManager.GetInstance():SetNeedApperanceVoiceHeroId(arg_66_1)
	end

	return var_66_0, var_66_3, var_66_4
end

function var_0_0.RemoveHero(arg_67_0, arg_67_1, arg_67_2, arg_67_3)
	arg_67_2[arg_67_1] = 0
	arg_67_3[arg_67_1] = 0
end

function var_0_0.AddHero(arg_68_0, arg_68_1, arg_68_2, arg_68_3, arg_68_4, arg_68_5)
	local var_68_0 = true

	arg_68_4[arg_68_1] = arg_68_2
	arg_68_5[arg_68_1] = arg_68_3

	return var_68_0
end

function var_0_0.Swap(arg_69_0, arg_69_1, arg_69_2, arg_69_3)
	arg_69_3[arg_69_2], arg_69_3[arg_69_1] = arg_69_3[arg_69_1], arg_69_3[arg_69_2]
end

function var_0_0.TryToReoerderTeam(arg_70_0, arg_70_1, arg_70_2)
	if arg_70_0:IsNeedReorder() then
		arg_70_0:ReorderHeroTeam(arg_70_1, arg_70_2, arg_70_0.canSwitchResctrictHeroList_)
	end
end

function var_0_0.IsNeedReorder(arg_71_0)
	return arg_71_0.canSwitchResctrictHeroList_[arg_71_0.params_.selectHeroPos] == ReserveConst.RESTRICT_HERO_SWITCH_MODE.FORBID and arg_71_0.reorder_ == true
end

function var_0_0.TryToChangeMultiHero(arg_72_0)
	local var_72_0 = true
	local var_72_1 = {}
	local var_72_2 = {}

	for iter_72_0, iter_72_1 in ipairs(arg_72_0.multiModeHeroList_) do
		var_72_0 = arg_72_0:AddHero(iter_72_0, iter_72_1, arg_72_0.multiModeTrialList_[iter_72_0], var_72_1, var_72_2)

		if not var_72_0 then
			return var_72_0
		end
	end

	return var_72_0, var_72_1, var_72_2
end

function var_0_0.TryToChangeTeam(arg_73_0, arg_73_1, arg_73_2)
	arg_73_0:ChangeTeam(arg_73_1, arg_73_2)
	arg_73_0:OnChangeTeamSuccess()
end

function var_0_0.ChangeTeam(arg_74_0, arg_74_1, arg_74_2)
	arg_74_0.sectionProxy_:ChangeHeroTeam(arg_74_1, arg_74_2)
end

function var_0_0.OnChangeTeamSuccess(arg_75_0)
	arg_75_0:Back(1, {
		isSorted = true
	})
end

function var_0_0.IsInTeam(arg_76_0, arg_76_1, arg_76_2)
	local var_76_0 = {}
	local var_76_1 = {}

	if arg_76_0.selectHeroMode_ == SectionSelectHeroConst.SELECT_HERO_MODE.SINGLE then
		var_76_0 = arg_76_0.heroTeam_
		var_76_1 = arg_76_0.heroTrialList_
	else
		var_76_0 = arg_76_0.multiModeHeroList_
		var_76_1 = arg_76_0.multiModeTrialList_
	end

	return SectionSelectHeroTools.IsInTeam(arg_76_1, arg_76_2, var_76_0, var_76_1)
end

function var_0_0.IsSameHeroInTeam(arg_77_0, arg_77_1)
	local var_77_0 = {}

	if arg_77_0.selectHeroMode_ == SectionSelectHeroConst.SELECT_HERO_MODE.SINGLE then
		var_77_0 = arg_77_0.heroTeam_
	else
		var_77_0 = arg_77_0.multiModeHeroList_
	end

	return SectionSelectHeroTools.IsSameHeroInTeam(arg_77_1, var_77_0)
end

function var_0_0.ReorderHeroTeam(arg_78_0, arg_78_1, arg_78_2, arg_78_3)
	SectionSelectHeroTools.ReorderHeroTeam(arg_78_1, arg_78_2, arg_78_3)
end

function var_0_0.IsPosLocked(arg_79_0, arg_79_1)
	return arg_79_0.lockStateList_[arg_79_1] == true
end

function var_0_0.IsHeroLock(arg_80_0, arg_80_1, arg_80_2)
	return table.keyof(arg_80_0.lockHeroList_, arg_80_1) ~= nil or table.keyof(arg_80_0.lockHeroList_, arg_80_2) ~= nil
end

function var_0_0.GetHeroHeadClass(arg_81_0)
	return SectionHeroTeamHeadItem
end

function var_0_0.HeadRenderer(arg_82_0, arg_82_1, arg_82_2)
	local var_82_0 = arg_82_0.heroDataList_[arg_82_1].id
	local var_82_1 = arg_82_0.heroDataList_[arg_82_1].trialID

	arg_82_2:SetSectionHeroData(arg_82_0.heroDataList_[arg_82_1])
	arg_82_2:RegisterClickListener(function()
		if arg_82_0.selectHeroMode_ == SectionSelectHeroConst.SELECT_HERO_MODE.SINGLE then
			arg_82_0:SingleModeSelectHero(arg_82_0.heroDataList_[arg_82_1])
		else
			arg_82_0:MultiModeChangeTeam(arg_82_0.heroDataList_[arg_82_1])
		end
	end)
	arg_82_2:SetHeroLock(arg_82_0:IsHeroLock(var_82_0, var_82_1))
	arg_82_2:SetSelected(arg_82_2.heroId_ == arg_82_0.selectHeroData_.id and arg_82_2.trialID_ == arg_82_0.selectHeroData_.trialID)

	if arg_82_0.selectHeroMode_ == SectionSelectHeroConst.SELECT_HERO_MODE.SINGLE then
		arg_82_2:SetInTeamFlag(arg_82_0:IsInTeam(var_82_0, var_82_1))
		arg_82_2:SetMultiPos(false)
	else
		arg_82_2:SetInTeamFlag(false)
		arg_82_2:SetMultiPos(arg_82_0:IsInTeam(var_82_0, var_82_1))
	end
end

function var_0_0.GetHeroViewProxy(arg_84_0, arg_84_1)
	if not arg_84_0.heroViewProxyDic_[arg_84_1] then
		arg_84_0.heroViewProxyDic_[arg_84_1] = HeroViewDataProxy.New(arg_84_1)
	end

	return arg_84_0.heroViewProxyDic_[arg_84_1]
end

function var_0_0.GetFilterClass(arg_85_0)
	return NewHeroListFilterView
end

function var_0_0.ExtraSorter(arg_86_0, arg_86_1, arg_86_2, arg_86_3, arg_86_4)
	local var_86_0, var_86_1, var_86_2 = SectionSelectHeroTools.IsInTeam(arg_86_1.id, arg_86_1.trialID, arg_86_0.heroTeam_, arg_86_0.heroTrialList_)
	local var_86_3, var_86_4, var_86_5 = SectionSelectHeroTools.IsInTeam(arg_86_2.id, arg_86_2.trialID, arg_86_0.heroTeam_, arg_86_0.heroTrialList_)

	if var_86_0 ~= var_86_3 then
		if var_86_0 and not var_86_3 then
			return true, true
		elseif not var_86_0 and var_86_3 then
			return true, false
		else
			return true, var_86_2 < var_86_5
		end
	end

	if arg_86_1.trialID ~= 0 or arg_86_2.trialID ~= 0 then
		if arg_86_1.trialID ~= 0 and arg_86_2.trialID ~= 0 then
			if arg_86_3 == 0 and arg_86_1.star ~= arg_86_2.star then
				if arg_86_0.curOrder_ == "desc" then
					return true, arg_86_1.star > arg_86_2.star
				else
					return true, arg_86_1.star < arg_86_2.star
				end
			end

			local var_86_6 = getHeroPower(arg_86_1.trialID, true)
			local var_86_7 = getHeroPower(arg_86_2.trialID, true)

			if var_86_6 ~= var_86_7 then
				if arg_86_4 == "desc" then
					return true, var_86_7 < var_86_6
				else
					return true, var_86_6 < var_86_7
				end
			else
				return true, arg_86_1.trialID > arg_86_2.trialID
			end
		else
			return true, arg_86_1.trialID > arg_86_2.trialID
		end
	end

	return false, false
end

function var_0_0.OnListChange(arg_87_0, arg_87_1, arg_87_2)
	arg_87_0.heroDataList_ = arg_87_2
	arg_87_0.selectHeroData_, scrollIndex = arg_87_0:GetSelectHeroData()

	arg_87_0.heroHeadList_:StartScroll(#arg_87_0.heroDataList_, scrollIndex)

	if #arg_87_0.heroDataList_ == 0 then
		arg_87_0.emptyController_:SetSelectedState("true")
	else
		arg_87_0.emptyController_:SetSelectedState("false")

		if arg_87_0.selectHeroData_ then
			arg_87_0:SelectHero(arg_87_0.selectHeroData_)
		end
	end
end

function var_0_0.OnHeroSort(arg_88_0, arg_88_1, arg_88_2, arg_88_3, arg_88_4, arg_88_5)
	arg_88_0.filterView_:RefreshSort(arg_88_1, arg_88_2, arg_88_3, arg_88_4, arg_88_5)
	HeroData:SaveSortValue(arg_88_1, arg_88_2, arg_88_3, arg_88_4, arg_88_5)
end

function var_0_0.GetTrialHeroList(arg_89_0)
	return GetTrialHeroList(arg_89_0.stageType_, arg_89_0.stageID_, arg_89_0.activityID_)
end

function var_0_0.GetHeroInfoViewClass(arg_90_0)
	return SectionHeroInfoView
end

function var_0_0.RecordMultiButtonTouch(arg_91_0)
	local var_91_0 = arg_91_0.selectHeroMode_ == SectionSelectHeroConst.SELECT_HERO_MODE.SINGLE and "combat_team_edit_morehero_close" or "combat_team_edit_morehero_open"

	OperationRecorder.RecordButtonTouch({
		button_name = var_91_0,
		stage_id = arg_91_0.stageID_
	})
end

return var_0_0
