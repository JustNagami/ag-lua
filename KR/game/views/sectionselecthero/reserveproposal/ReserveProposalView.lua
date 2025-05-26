local var_0_0 = class("ReserveProposalView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/System/Formation/FormationReserveView"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:InitUI()
end

function var_0_0.InitUI(arg_4_0)
	arg_4_0:BindCfgUI()
	arg_4_0:InitSubViewCfg()
	arg_4_0:InitHandler()
end

function var_0_0.InitSubViewCfg(arg_5_0)
	arg_5_0.subViewDic_ = {
		selectHeroView = {
			go = arg_5_0.selectHeroGo_,
			getClassFunc = handler(arg_5_0, arg_5_0.GetSelectHeroViewClass)
		},
		additionalView = {
			go = arg_5_0.additionalGo_,
			getClassFunc = handler(arg_5_0, arg_5_0.GetAdditionalViewClass)
		}
	}
end

function var_0_0.InitHandler(arg_6_0)
	arg_6_0.clickHeroHandler_ = handler(arg_6_0, arg_6_0.OnSectionClickHero)
	arg_6_0.inputHandler_ = handler(arg_6_0, arg_6_0.OnInput)
	arg_6_0.deleteProposalHandler_ = handler(arg_6_0, arg_6_0.OnDeleteProposal)
	arg_6_0.changeHeroTeamHandler_ = handler(arg_6_0, arg_6_0.OnChangeHeroTeam)
	arg_6_0.changeComboSkillHander_ = handler(arg_6_0, arg_6_0.OnChangeComboSkill)
end

function var_0_0.OnTop(arg_7_0)
	arg_7_0:UpdateBar()
end

function var_0_0.OnBehind(arg_8_0)
	manager.windowBar:HideBar()
end

function var_0_0.OnEnter(arg_9_0)
	arg_9_0:AddEventListener()
	arg_9_0:ProcessParams()
	arg_9_0:ProcessSubView()
	arg_9_0:UpdateCamera()
	arg_9_0:ResetTempData()
	arg_9_0:SubViewOnEnter()
	arg_9_0:InitCurSelectContID()
	arg_9_0:Refresh()
end

function var_0_0.AddEventListener(arg_10_0)
	arg_10_0:RegistEventListener(SECTION_CLICK_HERO, arg_10_0.clickHeroHandler_)
	arg_10_0:RegistEventListener(INPUT_POP_CLICK_OK, arg_10_0.inputHandler_)
	arg_10_0:RegistEventListener(RESERVE_RESET_CONT_DATA, arg_10_0.deleteProposalHandler_)
	arg_10_0:RegistEventListener(SECTION_CHANGE_HERO_TEAM, arg_10_0.changeHeroTeamHandler_)
	arg_10_0:RegistEventListener(COMBO_SKILL_SELECT, arg_10_0.changeComboSkillHander_)
end

function var_0_0.ProcessParams(arg_11_0)
	arg_11_0:ProcessBaseParams()
	arg_11_0:ProcessReserveParams()
	arg_11_0:ProcessProxyParams()
	arg_11_0:ProcessProposalParams()
end

function var_0_0.ProcessBaseParams(arg_12_0)
	arg_12_0.stageID_ = arg_12_0.params_.stage_id
	arg_12_0.stageType_ = arg_12_0.params_.stage_type or BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_UNDEFINED
	arg_12_0.targetSectionProxy_ = arg_12_0.params_.sectionProxy
end

function var_0_0.ProcessReserveParams(arg_13_0)
	if not arg_13_0.reserveParams_ then
		arg_13_0.reserveParams_ = ReserveParams.New(ReserveConst.RESERVE_TYPE.PROPOSAL, 1)
	end
end

function var_0_0.ProcessProxyParams(arg_14_0)
	if not arg_14_0.sectionProxy_ then
		arg_14_0.sectionProxy_ = ReserveProposalSelectHeroProxy.New({
			outerLockHeroList = clone(arg_14_0.params_.lockHeroList)
		}, arg_14_0.reserveParams_, HeroConst.HERO_DATA_TYPE.DEFAULT)
	end

	arg_14_0.sectionProxy_:SetOuterLockHeroList(clone(arg_14_0.params_.lockHeroList))
end

function var_0_0.ProcessProposalParams(arg_15_0)
	if not arg_15_0.params_.isBack then
		ReserveTools.CleanCacheData(ReserveConst.RESERVE_TYPE.PROPOSAL)
	end

	arg_15_0.curHeroList_ = clone(arg_15_0.params_.heroList)
	arg_15_0.curTrialList_ = clone(arg_15_0.params_.trialList)
	arg_15_0.curComboSkillID_ = arg_15_0.params_.comboSkillID
	arg_15_0.curMimirID_ = arg_15_0.params_.mimirID
	arg_15_0.curChipList_ = clone(arg_15_0.params_.chipList)
	arg_15_0.curLockHeroList_ = clone(arg_15_0.params_.lockHeroList)

	arg_15_0:CheckHeroList()
	arg_15_0:GetContIDList()
	arg_15_0:UpdateTempContData()
end

function var_0_0.ProcessSubView(arg_16_0)
	arg_16_0:InitSubView()
	arg_16_0:TryReloadSubView()
	arg_16_0:ProcessSubViewParams()
end

function var_0_0.ProcessSubViewParams(arg_17_0)
	arg_17_0:SubViewCallFunc("SetProxy", arg_17_0.sectionProxy_)
end

function var_0_0.SubViewOnEnter(arg_18_0)
	arg_18_0:SubViewCallFunc("OnEnter")
end

function var_0_0.OnExit(arg_19_0)
	arg_19_0.params_.lastTempContID = arg_19_0.tempContID_

	arg_19_0:RemoveAllEventListener()
	arg_19_0:SubViewOnExit()
	manager.windowBar:HideBar()
	manager.ui:ResetMainCamera()
end

function var_0_0.SubViewOnExit(arg_20_0)
	arg_20_0:SubViewCallFunc("OnExit")
end

function var_0_0.Dispose(arg_21_0)
	arg_21_0:SubViewCallFunc("Dispose")

	for iter_21_0, iter_21_1 in pairs(arg_21_0.subViewDic_) do
		iter_21_1.go = nil
		iter_21_1.instance = nil
	end

	var_0_0.super.Dispose(arg_21_0)
end

function var_0_0.UpdateCamera(arg_22_0)
	manager.ui:SetMainCamera("battleHeroSelect")
	manager.ui:AdaptUIByFOV()
end

function var_0_0.UpdateBar(arg_23_0)
	arg_23_0.sectionProxy_:UpdateBar()
end

function var_0_0.ResetTempData(arg_24_0)
	arg_24_0.subViewDic_.selectHeroView.instance:ResetTempData()
end

function var_0_0.UpdateTempContData(arg_25_0)
	if arg_25_0.tempContID_ then
		local var_25_0 = ReserveParams.New(ReserveConst.RESERVE_TYPE.PROPOSAL, arg_25_0.tempContID_)

		if not arg_25_0.params_.isBack then
			arg_25_0.tempHeroList_ = clone(arg_25_0.curHeroList_)
			arg_25_0.tempTrialList_ = {
				0,
				0,
				0
			}
			arg_25_0.tempComboSkillID_ = arg_25_0.curComboSkillID_
			arg_25_0.tempMimirID_ = arg_25_0.curMimirID_
			arg_25_0.tempChipList_ = clone(arg_25_0.curChipList_)

			ReserveTools.SetTeam(var_25_0, arg_25_0.tempHeroList_, arg_25_0.tempTrialList_, arg_25_0.tempComboSkillID_, arg_25_0.tempMimirID_, arg_25_0.tempChipList_)
		elseif arg_25_0.params_.lastTempContID ~= arg_25_0.tempContID_ then
			local var_25_1 = ReserveParams.New(ReserveConst.RESERVE_TYPE.PROPOSAL, arg_25_0.params_.lastTempContID)

			arg_25_0.tempHeroList_ = ReserveTools.GetHeroList(var_25_1)
			arg_25_0.tempTrialList_ = {
				0,
				0,
				0
			}
			arg_25_0.tempComboSkillID_ = ReserveTools.GetComboSkillID(var_25_1)
			arg_25_0.tempMimirID_, arg_25_0.tempChipList_ = ReserveTools.GetMimirData(var_25_1)

			ReserveTools.SetTeam(var_25_0, arg_25_0.tempHeroList_, arg_25_0.tempTrialList_, arg_25_0.tempComboSkillID_, arg_25_0.tempMimirID_, arg_25_0.tempChipList_)
		else
			arg_25_0.tempHeroList_ = ReserveTools.GetHeroList(var_25_0)
			arg_25_0.tempComboSkillID_ = ReserveTools.GetComboSkillID(var_25_0)
			arg_25_0.tempMimirID_, arg_25_0.tempChipList_ = ReserveTools.GetMimirData(var_25_0)
		end
	end
end

function var_0_0.InitCurSelectContID(arg_26_0)
	if arg_26_0.params_.isEnter then
		arg_26_0.params_.isEnter = false
		arg_26_0.curSelectContID_ = arg_26_0.contIDList_[1]
		arg_26_0.params_.lastSelectContID = arg_26_0.contIDList_[1]
	else
		arg_26_0.curSelectContID_ = arg_26_0.params_.lastSelectContID or arg_26_0.contIDList_[1]
	end

	arg_26_0.params_.lastSelectContID = arg_26_0.curSelectContID_

	arg_26_0:UpdateReserveParams()
end

function var_0_0.UpdateReserveParams(arg_27_0)
	arg_27_0.reserveParams_.contID = arg_27_0.curSelectContID_
end

function var_0_0.Refresh(arg_28_0)
	arg_28_0:RefreshSubView()
	arg_28_0:RefreshReserveUI()
	arg_28_0:RefreshSwitchList()
	arg_28_0:RefreshBtnPanel()
end

function var_0_0.RefreshSubView(arg_29_0)
	arg_29_0:SubViewCallFunc("Refresh")
end

function var_0_0.RefreshReserveUI(arg_30_0)
	if arg_30_0.params_.isEnter then
		arg_30_0.params_.isEnter = false
		arg_30_0.curSelectContID_ = arg_30_0.contIDList_[1]
		arg_30_0.params_.lastSelectContID = arg_30_0.contIDList_[1]
	else
		arg_30_0.curSelectContID_ = arg_30_0.params_.lastSelectContID or arg_30_0.contIDList_[1]
	end

	arg_30_0.params_.lastSelectContID = arg_30_0.curSelectContID_

	arg_30_0.subViewDic_.selectHeroView.instance:SetContID(arg_30_0.curSelectContID_)
end

function var_0_0.RefreshBtnPanel(arg_31_0)
	arg_31_0.subViewDic_.additionalView.instance:RefreshBtnPanel(arg_31_0.curSelectContID_, arg_31_0.curHeroList_, arg_31_0.curComboSkillID_, arg_31_0.curMimirID_, arg_31_0.curChipList_)
end

function var_0_0.RefreshSwitchList(arg_32_0)
	arg_32_0.subViewDic_.additionalView.instance:RefreshSwitchList(arg_32_0.contIDList_, arg_32_0.curSelectContID_, arg_32_0.tempContID_, arg_32_0.curSavedProposalNum_)
end

function var_0_0.GetContIDList(arg_33_0)
	local var_33_0 = ReserveTools.GetReserveTemplateByReserveType(ReserveConst.RESERVE_TYPE.PROPOSAL)
	local var_33_1 = var_33_0:GetProposalContIDList()
	local var_33_2 = {}

	arg_33_0.params_.lastTempContID = arg_33_0.tempContID_ or arg_33_0.params_.lastTempContID
	arg_33_0.tempContID_ = nil
	arg_33_0.curUseProposalContID_ = nil

	for iter_33_0, iter_33_1 in ipairs(var_33_1) do
		if SectionSelectHeroTools.IsReserveProposalEqual(iter_33_1, arg_33_0.curHeroList_, arg_33_0.curComboSkillID_, arg_33_0.curMimirID_, arg_33_0.curChipList_) then
			arg_33_0.curUseProposalContID_ = iter_33_1

			break
		end
	end

	if arg_33_0.curUseProposalContID_ then
		var_33_2[1] = arg_33_0.curUseProposalContID_
	else
		arg_33_0.tempContID_ = var_33_0:GetTempContID()
		var_33_2[1] = arg_33_0.tempContID_
	end

	for iter_33_2, iter_33_3 in ipairs(var_33_1) do
		if iter_33_3 ~= var_33_2[1] then
			var_33_2[#var_33_2 + 1] = iter_33_3
		end
	end

	arg_33_0.contIDList_ = var_33_2
	arg_33_0.curProposalContIDList_ = var_33_1
	arg_33_0.curSavedProposalNum_ = #var_33_1
end

function var_0_0.SaveProposal(arg_34_0)
	ReserveAction.SaveReserveProposal(arg_34_0.saveContID_, handler(arg_34_0, arg_34_0.OnSaveProposal))
end

function var_0_0.SaveName(arg_35_0, arg_35_1)
	ReserveAction.RenameReserveProposal(arg_35_0.saveContID_, arg_35_1, handler(arg_35_0, arg_35_0.OnSaveProposal))
end

function var_0_0.OnSaveProposal(arg_36_0)
	arg_36_0:TryAutoApplyProposal(arg_36_0.saveContID_)

	if arg_36_0.saveContID_ == arg_36_0.tempContID_ then
		arg_36_0.tempContID_ = nil
	end

	arg_36_0.saveContID_ = nil

	ShowTips("FORMATION_PLAN_SAVED")
	manager.notify:Invoke(INPUT_POP_BACK)
	arg_36_0:GetContIDList()
	arg_36_0:UpdateTempContData()
	arg_36_0:RefreshSwitchList()
	arg_36_0:RefreshBtnPanel()
end

function var_0_0.ApplyProposal(arg_37_0)
	arg_37_0.curUseProposalContID_ = arg_37_0.curSelectContID_
	arg_37_0.curHeroList_ = arg_37_0.sectionProxy_:GetHeroIDList()
	arg_37_0.curTrialList_ = {
		0,
		0,
		0
	}
	arg_37_0.curComboSkillID_ = arg_37_0.sectionProxy_:GetComboSkillID()
	arg_37_0.curMimirID_ = arg_37_0.sectionProxy_:GetMimirID()
	arg_37_0.curChipList_ = arg_37_0.sectionProxy_:GetMimirChipList()
	arg_37_0.params_.heroList = clone(arg_37_0.curHeroList_)
	arg_37_0.params_.trialList = clone(arg_37_0.curTrialList_)
	arg_37_0.params_.comboSkillID = arg_37_0.curComboSkillID_
	arg_37_0.params_.mimirID = arg_37_0.curMimirID_
	arg_37_0.params_.chipList = clone(arg_37_0.curChipList_)

	arg_37_0.targetSectionProxy_:ApplyReserveProposal(arg_37_0.curHeroList_, arg_37_0.curTrialList_, arg_37_0.curComboSkillID_, arg_37_0.curMimirID_, arg_37_0.curChipList_)
end

function var_0_0.TryAutoApplyProposal(arg_38_0, arg_38_1)
	local var_38_0 = false

	if #arg_38_0:GetFilterLockHeroList(arg_38_0.sectionProxy_:GetHeroIDList()) == 0 and (arg_38_0.saveContID_ == arg_38_0.curUseProposalContID_ or arg_38_0.saveContID_ == arg_38_0.tempContID_) then
		var_38_0 = true
	end

	if var_38_0 then
		arg_38_0:ApplyProposal()
	end
end

function var_0_0.OnReserveProposalClickSave(arg_39_0)
	if arg_39_0.curSelectContID_ == arg_39_0.tempContID_ and GameSetting.default_formation_num_max.value[1] == #arg_39_0.curProposalContIDList_ then
		ShowTips("RESERVE_PROPOSAL_SAVE_LIMIT")

		return
	end

	if arg_39_0.sectionProxy_:GetHeroIDList()[1] == 0 then
		ShowTips("TEAM_SET_NEEDED")

		return
	end

	local var_39_0 = arg_39_0.sectionProxy_:GetHeroIDList()
	local var_39_1 = arg_39_0.sectionProxy_:GetComboSkillID()
	local var_39_2 = arg_39_0.sectionProxy_:GetMimirID()
	local var_39_3 = arg_39_0.sectionProxy_:GetMimirChipList()

	for iter_39_0, iter_39_1 in ipairs(arg_39_0.curProposalContIDList_) do
		if iter_39_1 ~= arg_39_0.curSelectContID_ and SectionSelectHeroTools.IsReserveProposalEqual(iter_39_1, var_39_0, var_39_1, var_39_2, var_39_3) then
			ShowTips("RESERVE_PROPOSAL_SAME")

			return
		end
	end

	arg_39_0.saveContID_ = arg_39_0.curSelectContID_

	if ReserveTools.GetReserveTemplateByReserveType(ReserveConst.RESERVE_TYPE.PROPOSAL):GetContDataTemplateById(arg_39_0.curSelectContID_):GetName() == "" then
		JumpTools.OpenPageByJump("ProposalPopup")
	else
		arg_39_0:SaveProposal()
	end
end

function var_0_0.OnReserveProposalClickApply(arg_40_0)
	local var_40_0 = arg_40_0.sectionProxy_:GetHeroIDList()
	local var_40_1 = arg_40_0:GetFilterLockHeroList(var_40_0)

	if #var_40_1 > 0 then
		JumpTools.OpenPageByJump("filterLockHero", {
			heroIDList = var_40_1,
			type = SectionSelectHeroConst.DISPLAY_FILTER_LOCK_HERO_TYPE.PROPOSAL
		})

		return
	end

	arg_40_0:ApplyProposal()
	arg_40_0:OnApplyProposalSuccess()
end

function var_0_0.GetFilterLockHeroList(arg_41_0, arg_41_1)
	local var_41_0 = {}

	for iter_41_0, iter_41_1 in ipairs(arg_41_1) do
		if iter_41_1 ~= 0 and table.indexof(arg_41_0.curLockHeroList_, iter_41_1) then
			var_41_0[#var_41_0 + 1] = iter_41_1
		end
	end

	return var_41_0
end

function var_0_0.OnApplyProposalSuccess(arg_42_0)
	ShowTips("RESERVE_PROPOSAL_SELECT_SUCCESS")
	arg_42_0:Back()
end

function var_0_0.OnReserveProposalClickDelete(arg_43_0)
	local var_43_0 = ReserveTools.GetReserveTemplateByReserveType(ReserveConst.RESERVE_TYPE.PROPOSAL):GetContDataTemplateById(arg_43_0.curSelectContID_):GetName()

	ShowMessageBox({
		title = GetTips("PROMPT"),
		content = string.format(GetTips("FORMATION_PLAN_DELETE_CONFIRM"), var_43_0),
		OkCallback = function()
			arg_43_0.sectionProxy_:ResetTeam()
		end
	})
end

function var_0_0.OnReserveProposalClickProposal(arg_45_0, arg_45_1)
	if arg_45_1 == arg_45_0.curSelectContID_ then
		return
	end

	arg_45_0.curSelectContID_ = arg_45_1
	arg_45_0.params_.lastSelectContID = arg_45_0.curSelectContID_

	arg_45_0:UpdateReserveParams()
	arg_45_0:RefreshSubView()
	arg_45_0:RefreshReserveUI()
	arg_45_0:RefreshBtnPanel()
	arg_45_0.subViewDic_.additionalView.instance:RefreshSelect(arg_45_0.curSelectContID_)
end

function var_0_0.OnReserveProposalClickRename(arg_46_0, arg_46_1)
	arg_46_0.saveContID_ = arg_46_1

	JumpTools.OpenPageByJump("ProposalPopup")
end

function var_0_0.OnSectionClickHero(arg_47_0, arg_47_1)
	arg_47_0.sectionProxy_:GotoHeroInfoUI(arg_47_1)
end

function var_0_0.OnChangeHeroTeam(arg_48_0, arg_48_1, arg_48_2)
	if arg_48_0.curSelectContID_ == arg_48_0.tempContID_ then
		arg_48_0.tempHeroList_ = clone(arg_48_1)
		arg_48_0.tempTrialList_ = clone(arg_48_2)
	end

	arg_48_0:RefreshSwitchList()
	arg_48_0:RefreshBtnPanel()
end

function var_0_0.OnChangeComboSkill(arg_49_0, arg_49_1)
	if arg_49_0.curSelectContID_ == arg_49_0.tempContID_ then
		arg_49_0.tempComboSkillID_ = arg_49_1
	end

	arg_49_0:RefreshBtnPanel()
end

function var_0_0.OnInput(arg_50_0, arg_50_1, arg_50_2)
	if arg_50_1 == "" then
		ShowTips("INPUT_EQUIP_PROPOSAL_NAME")

		return
	end

	if IsAllSpace(arg_50_1) then
		ShowTips("INPUT_CHAT_CONTENT")

		arg_50_2.text = ""

		return
	end

	local var_50_0, var_50_1 = textLimit(arg_50_1, GameSetting.user_name_max.value[1])

	arg_50_2.text = var_50_0
	arg_50_1 = var_50_0

	if not nameRule(arg_50_1) then
		ShowTips("ERROR_USER_NAME_SYMBOL_WORD")

		arg_50_2.text = ""

		return
	end

	WordVerifyBySDK(arg_50_1, function(arg_51_0)
		if not arg_51_0 then
			ShowTips("SENSITIVE_WORD")

			arg_50_2.text = ""

			return
		else
			if not var_50_1 then
				return
			end

			arg_50_0:SaveName(arg_50_1)
		end
	end, JUDGE_MESSAGE_TYPE.OTHER)
end

function var_0_0.OnDeleteProposal(arg_52_0, arg_52_1, arg_52_2)
	ShowTips("FORMATION_PLAN_DELETED")

	arg_52_0.params_.lastSelectContID = nil

	ReserveTools.GetReserveTemplateByReserveType(ReserveConst.RESERVE_TYPE.PROPOSAL):DeleteProposal(arg_52_2)
	arg_52_0:GetContIDList()
	arg_52_0:UpdateTempContData()
	arg_52_0:InitCurSelectContID()
	arg_52_0:Refresh()
end

function var_0_0.CheckHeroList(arg_53_0)
	local var_53_0 = false

	for iter_53_0, iter_53_1 in ipairs(arg_53_0.curTrialList_) do
		if iter_53_1 ~= 0 then
			var_53_0 = true
			arg_53_0.curHeroList_[iter_53_0] = 0
			arg_53_0.curTrialList_[iter_53_0] = 0
		end
	end

	if var_53_0 then
		for iter_53_2 = 1, 2 do
			for iter_53_3 = iter_53_2 + 1, 3 do
				if arg_53_0.curHeroList_[iter_53_2] == 0 then
					arg_53_0.curHeroList_[iter_53_2] = arg_53_0.curHeroList_[iter_53_3]
					arg_53_0.curHeroList_[iter_53_3] = 0
					arg_53_0.curTrialList_[iter_53_2] = arg_53_0.curTrialList_[iter_53_3]
					arg_53_0.curTrialList_[iter_53_3] = 0

					break
				end
			end
		end

		local var_53_1 = arg_53_0.curComboSkillID_

		if var_53_1 == 0 or not ComboSkillTools.IsAllMatch(var_53_1, arg_53_0.curHeroList_) then
			arg_53_0.curComboSkillID_ = ComboSkillTools.GetRecommendSkillID(arg_53_0.curHeroList_, true)
		end
	end
end

function var_0_0.GetSelectHeroViewClass(arg_54_0)
	return arg_54_0.sectionProxy_:GetSelectHeroViewClass()
end

function var_0_0.GetAdditionalViewClass(arg_55_0)
	return arg_55_0.sectionProxy_:GetAdditionalViewClass()
end

function var_0_0.InitSubView(arg_56_0)
	if not arg_56_0.createdSubview_ then
		arg_56_0.createdSubview_ = true

		for iter_56_0, iter_56_1 in pairs(arg_56_0.subViewDic_) do
			local var_56_0 = iter_56_1.go

			iter_56_1.instance = iter_56_1.getClassFunc().New(var_56_0)

			if iter_56_1.initFunc then
				iter_56_1.initFunc()
			end
		end
	end
end

function var_0_0.TryReloadSubView(arg_57_0)
	for iter_57_0, iter_57_1 in pairs(arg_57_0.subViewDic_) do
		if SectionSelectHeroTools.IsDiffViewClass(iter_57_1.instance, iter_57_1.getClassFunc()) then
			iter_57_1.instance = SectionSelectHeroTools.ReloadView(iter_57_1.instance, iter_57_1.getClassFunc())

			if iter_57_1.initFunc then
				iter_57_1.initFunc()
			end
		end
	end
end

function var_0_0.SubViewCallFunc(arg_58_0, arg_58_1, ...)
	for iter_58_0, iter_58_1 in pairs(arg_58_0.subViewDic_) do
		local var_58_0 = iter_58_1.instance

		if var_58_0 and var_58_0[arg_58_1] then
			var_58_0[arg_58_1](var_58_0, ...)
		end
	end
end

return var_0_0
