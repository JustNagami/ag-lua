local var_0_0 = class("NewSectionSelectHeroBaseView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/System/Formation/FormationMainUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:InitUI()
	arg_3_0:AddListener()
end

function var_0_0.InitUI(arg_4_0)
	arg_4_0:BindCfgUI()

	arg_4_0.selectHeroView_ = nil
	arg_4_0.stageInfoView_ = nil
	arg_4_0.reserveBtnController_ = arg_4_0.controllerExCollection_:GetController("reserveActive")
	arg_4_0.totalEnergyController_ = arg_4_0.controllerExCollection_:GetController("totalEnergy")
end

function var_0_0.AddListener(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.startBtn_, nil, function()
		arg_5_0:OnClickStartBattle()
	end)
	arg_5_0:AddBtnListener(arg_5_0.reservesBtn_, nil, function()
		if not arg_5_0.sectionProxy_.canChangeReserveProposal then
			return
		end

		arg_5_0:GotoReservesProposalUI()
	end)
end

function var_0_0.GotoReservesProposalUI(arg_8_0)
	arg_8_0.sectionProxy_:GotoReservesProposalUI()
end

function var_0_0.OnEnter(arg_9_0)
	arg_9_0:UpdateDefaultParams()
	arg_9_0:UpdateSubViewParams()
	arg_9_0:UpdateBar()
	arg_9_0:UpdateCamera()
	arg_9_0:ResetTempData()
	arg_9_0:SubViewOnEnter()
	arg_9_0:RefreshUI()
	arg_9_0:RefreshCustomUI()
	print(arg_9_0.stageID_)
end

function var_0_0.UpdateSubViewParams(arg_10_0)
	arg_10_0.selectHeroView_:SetProxy(arg_10_0.sectionProxy_)
	arg_10_0.stageInfoView_:SetProxy(arg_10_0.sectionProxy_)
end

function var_0_0.SubViewOnEnter(arg_11_0)
	arg_11_0.sectionProxy_:OnSectionSelectEnter()
	arg_11_0.selectHeroView_:OnEnter()
	arg_11_0.stageInfoView_:OnEnter()
end

function var_0_0.OnExit(arg_12_0)
	arg_12_0:RemoveAllEventListener()
	arg_12_0:SubViewOnExit()

	arg_12_0.params_.isSorted = false

	manager.windowBar:HideBar()
	manager.ui:ResetMainCamera()
end

function var_0_0.SubViewOnExit(arg_13_0)
	arg_13_0.sectionProxy_:OnSectionSelectExit()
	arg_13_0.selectHeroView_:OnExit()
	arg_13_0.stageInfoView_:OnExit()
end

function var_0_0.Dispose(arg_14_0)
	arg_14_0.selectHeroView_:Dispose()

	arg_14_0.selectHeroView_ = nil

	arg_14_0.stageInfoView_:Dispose()

	arg_14_0.stageInfoView_ = nil

	var_0_0.super.Dispose(arg_14_0)
end

function var_0_0.UpdateCamera(arg_15_0)
	manager.ui:SetMainCamera("battleHeroSelect")
	manager.ui:AdaptUIByFOV()
end

function var_0_0.UpdateBar(arg_16_0)
	arg_16_0.sectionProxy_:UpdateBar()
	manager.windowBar:RegistBackCallBack(function()
		CommonFilterData:ClearFilter(Filter_Root_Define.Hero_Filter_List.filter_id)
		arg_16_0:Back()
	end)
end

function var_0_0.UpdateDefaultParams(arg_18_0)
	arg_18_0.multiple_ = arg_18_0.params_.multiple or 1
	arg_18_0.stageID_ = arg_18_0.params_.section
	arg_18_0.stageType_ = arg_18_0.params_.sectionType or BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_UNDEFINED
	arg_18_0.activityID_ = arg_18_0.params_.activityID

	if not arg_18_0.params_.reserveParams then
		arg_18_0.params_.reserveParams = ReserveTools.GetReserveParams(arg_18_0.stageType_, arg_18_0.stageID_, arg_18_0.activityID_)
	elseif not arg_18_0.params_.reserveParams.customData.activityID then
		arg_18_0.params_.reserveParams.customData.activityID = arg_18_0.activityID_
	end

	arg_18_0.reserveParams_ = arg_18_0.params_.reserveParams

	if not arg_18_0.params_.sectionProxy then
		local var_18_0 = arg_18_0.params_.heroDataType or HeroConst.HERO_DATA_TYPE.DEFAULT

		arg_18_0.params_.sectionProxy = SectionSelectHeroTools.GetProxy(arg_18_0.params_, arg_18_0.reserveParams_, var_18_0)
	end

	arg_18_0.sectionProxy_ = arg_18_0.params_.sectionProxy

	arg_18_0:TryReload()
end

function var_0_0.ResetTempData(arg_19_0)
	arg_19_0.selectHeroView_:ResetTempData()
end

function var_0_0.RefreshUI(arg_20_0)
	arg_20_0:RefreshReservesBtn()
	arg_20_0:RefreshSortType()
end

function var_0_0.RefreshCustomUI(arg_21_0)
	return
end

function var_0_0.RefreshSortType(arg_22_0)
	if not arg_22_0.params_.isSorted then
		HeroData:ResetSortValue()
	end
end

function var_0_0.RefreshReservesBtn(arg_23_0)
	local var_23_0 = true
	local var_23_1 = arg_23_0.sectionProxy_:GetLockStateList() or {}

	for iter_23_0 = 1, 3 do
		if var_23_1[iter_23_0] then
			var_23_0 = false
		end
	end

	if arg_23_0.sectionProxy_.canChangeTeam == false then
		var_23_0 = false
	end

	arg_23_0.sectionProxy_.needReserveProposalPanel = var_23_0
	arg_23_0.sectionProxy_.canChangeReserveProposal = var_23_0

	arg_23_0.reserveBtnController_:SetSelectedState(tostring(arg_23_0.sectionProxy_.needReserveProposalPanel))
end

function var_0_0.OnSectionClickHero(arg_24_0, arg_24_1)
	arg_24_0.sectionProxy_:GotoHeroInfoUI(arg_24_1)
end

function var_0_0.OnClickStartBattle(arg_25_0)
	local var_25_0, var_25_1 = arg_25_0.selectHeroView_:CheckCanStartBattle()

	if var_25_0 then
		arg_25_0:StartBattle()
	elseif var_25_1 then
		ShowTips(var_25_1)
	end
end

function var_0_0.StartBattle(arg_26_0)
	arg_26_0.sectionProxy_:StartBattle()
end

function var_0_0.GetStageInfoClass(arg_27_0)
	return arg_27_0.sectionProxy_:GetStageInfoClass()
end

function var_0_0.GetSelectHeroViewClass(arg_28_0)
	return arg_28_0.sectionProxy_:GetSelectHeroViewClass()
end

function var_0_0.TryReload(arg_29_0)
	if not arg_29_0.createdSubview_ then
		arg_29_0.createdSubview_ = true
		arg_29_0.selectHeroView_ = arg_29_0:GetSelectHeroViewClass().New(arg_29_0.selectHeroGo_)
		arg_29_0.stageInfoView_ = arg_29_0:GetStageInfoClass().New(arg_29_0.stageInfoGo_)
	end

	arg_29_0.selectHeroView_ = SectionSelectHeroTools.ReloadView(arg_29_0.selectHeroView_, arg_29_0.sectionProxy_:GetSelectHeroViewClass())
	arg_29_0.stageInfoView_ = SectionSelectHeroTools.ReloadView(arg_29_0.stageInfoView_, arg_29_0.sectionProxy_:GetStageInfoClass())
end

return var_0_0
