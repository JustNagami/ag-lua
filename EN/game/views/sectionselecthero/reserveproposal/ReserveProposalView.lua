local var_0_0 = class("ReserveProposalView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/System/Formation/FormationReserveView"
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
	arg_4_0.btnStateController_ = arg_4_0.controllerExCollection_:GetController("btnState")
	arg_4_0.schemeSwitchList_ = LuaList.New(handler(arg_4_0, arg_4_0.IndexItem), arg_4_0.switchListGo_, ReserveProposalSwitchItem)
	arg_4_0.clickSchemeHandler_ = handler(arg_4_0, arg_4_0.OnClickScheme)
	arg_4_0.renameSchemeHandler_ = handler(arg_4_0, arg_4_0.OnRenameScheme)
	arg_4_0.inputHandler_ = handler(arg_4_0, arg_4_0.OnInput)
	arg_4_0.deleteProposalHandler_ = handler(arg_4_0, arg_4_0.OnDeleteProposal)
	arg_4_0.changeHeroTeamHandler_ = handler(arg_4_0, arg_4_0.OnChangeHeroTeam)
	arg_4_0.changeComboSkillHander_ = handler(arg_4_0, arg_4_0.OnChangeComboSkill)
end

function var_0_0.AddListener(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.saveBtn_, nil, function()
		if arg_5_0.curSelectContID_ == arg_5_0.tempContID_ and GameSetting.default_formation_num_max.value[1] == #arg_5_0.curProposalContIDList_ then
			ShowTips("RESERVE_PROPOSAL_SAVE_LIMIT")

			return
		end

		if arg_5_0.sectionProxy_:GetHeroIDList()[1] == 0 then
			ShowTips("TEAM_SET_NEEDED")

			return
		end

		local var_6_0 = arg_5_0.sectionProxy_:GetHeroIDList()
		local var_6_1 = arg_5_0.sectionProxy_:GetComboSkillID()
		local var_6_2 = arg_5_0.sectionProxy_:GetMimirID()
		local var_6_3 = arg_5_0.sectionProxy_:GetMimirChipList()

		for iter_6_0, iter_6_1 in ipairs(arg_5_0.curProposalContIDList_) do
			if iter_6_1 ~= arg_5_0.curSelectContID_ and arg_5_0:IsReserveProposalEqual(iter_6_1, var_6_0, var_6_1, var_6_2, var_6_3) then
				ShowTips("RESERVE_PROPOSAL_SAME")

				return
			end
		end

		arg_5_0.saveContID_ = arg_5_0.curSelectContID_

		if ReserveTools.GetReserveTemplateByReserveType(ReserveConst.RESERVE_TYPE.PROPOSAL):GetContDataTemplateById(arg_5_0.curSelectContID_):GetName() == "" then
			JumpTools.OpenPageByJump("ProposalPopup")
		else
			arg_5_0:SaveProposal()
		end
	end)
	arg_5_0:AddBtnListener(arg_5_0.selectBtn_, nil, function()
		local var_7_0 = arg_5_0.sectionProxy_:GetHeroIDList()

		for iter_7_0, iter_7_1 in ipairs(var_7_0) do
			if iter_7_1 ~= 0 and table.indexof(arg_5_0.curLockHeroList_, iter_7_1) then
				ShowTips("FORMATION_PLAN_CHANGE_FAILED")

				return
			end
		end

		arg_5_0:ApplyProposal()
		ShowTips("RESERVE_PROPOSAL_SELECT_SUCCESS")
		arg_5_0:Back()
	end)
	arg_5_0:AddBtnListener(arg_5_0.deleteBtn_, nil, function()
		local var_8_0 = ReserveTools.GetReserveTemplateByReserveType(ReserveConst.RESERVE_TYPE.PROPOSAL):GetContDataTemplateById(arg_5_0.curSelectContID_):GetName()

		ShowMessageBox({
			title = GetTips("PROMPT"),
			content = string.format(GetTips("FORMATION_PLAN_DELETE_CONFIRM"), var_8_0),
			OkCallback = function()
				arg_5_0.sectionProxy_:ResetTeam()
			end
		})
	end)
end

function var_0_0.OnEnter(arg_10_0)
	arg_10_0:RegistEventListener(INPUT_POP_CLICK_OK, arg_10_0.inputHandler_)
	arg_10_0:RegistEventListener(RESERVE_RESET_CONT_DATA, arg_10_0.deleteProposalHandler_)
	arg_10_0:RegistEventListener(SECTION_CHANGE_HERO_TEAM, arg_10_0.changeHeroTeamHandler_)
	arg_10_0:RegistEventListener(COMBO_SKILL_SELECT, arg_10_0.changeComboSkillHander_)
	arg_10_0:UpdateDefaultParams()
	arg_10_0:TryReload()
	arg_10_0:UpdateSubViewParams()
	arg_10_0:UpdateBar()
	arg_10_0:UpdateCamera()
	arg_10_0:ResetTempData()
	arg_10_0:SubViewOnEnter()
	arg_10_0:RefreshUI()
end

function var_0_0.UpdateSubViewParams(arg_11_0)
	arg_11_0.selectHeroView_:SetProxy(arg_11_0.sectionProxy_)
end

function var_0_0.SubViewOnEnter(arg_12_0)
	arg_12_0.selectHeroView_:OnEnter()
end

function var_0_0.OnExit(arg_13_0)
	arg_13_0.params_.lastTempContID = arg_13_0.tempContID_

	arg_13_0:RemoveAllEventListener()
	arg_13_0:SubViewOnExit()
	manager.windowBar:HideBar()
	manager.ui:ResetMainCamera()
end

function var_0_0.SubViewOnExit(arg_14_0)
	arg_14_0.selectHeroView_:OnExit()
end

function var_0_0.Dispose(arg_15_0)
	arg_15_0.schemeSwitchList_:Dispose()

	arg_15_0.schemeSwitchList_ = nil

	arg_15_0.selectHeroView_:Dispose()

	arg_15_0.selectHeroView_ = nil

	var_0_0.super.Dispose(arg_15_0)
end

function var_0_0.UpdateCamera(arg_16_0)
	manager.ui:SetMainCamera("battleHeroSelect")
	manager.ui:AdaptUIByFOV()
end

function var_0_0.UpdateBar(arg_17_0)
	arg_17_0.sectionProxy_:UpdateBar()
end

function var_0_0.UpdateDefaultParams(arg_18_0)
	arg_18_0.stageID_ = arg_18_0.params_.stage_id
	arg_18_0.stageType_ = arg_18_0.params_.stage_type or BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_UNDEFINED
	arg_18_0.targetSectionProxy_ = arg_18_0.params_.sectionProxy

	if not arg_18_0.reserveParams_ then
		arg_18_0.reserveParams_ = ReserveParams.New(ReserveConst.RESERVE_TYPE.PROPOSAL, 1)
	end

	if not arg_18_0.sectionProxy_ then
		arg_18_0.sectionProxy_ = ReserveProposalSelectHeroProxy.New({}, arg_18_0.reserveParams_, HeroConst.HERO_DATA_TYPE.DEFAULT)
	end

	arg_18_0.curHeroList_ = clone(arg_18_0.params_.heroList)
	arg_18_0.curTrialList_ = clone(arg_18_0.params_.trialList)
	arg_18_0.curComboSkillID_ = arg_18_0.params_.comboSkillID
	arg_18_0.curMimirID_ = arg_18_0.params_.mimirID
	arg_18_0.curChipList_ = clone(arg_18_0.params_.chipList)
	arg_18_0.curLockHeroList_ = clone(arg_18_0.params_.lockHeroList)

	arg_18_0:CheckHeroList()

	if not arg_18_0.params_.isBack then
		ReserveTools.CleanCacheData(ReserveConst.RESERVE_TYPE.PROPOSAL)
	end

	arg_18_0:GetContIDList()
	arg_18_0:UpdateTempContData()
end

function var_0_0.ResetTempData(arg_19_0)
	arg_19_0.selectHeroView_:ResetTempData()
end

function var_0_0.UpdateTempContData(arg_20_0)
	if arg_20_0.tempContID_ then
		local var_20_0 = ReserveParams.New(ReserveConst.RESERVE_TYPE.PROPOSAL, arg_20_0.tempContID_)

		if not arg_20_0.params_.isBack then
			arg_20_0.tempHeroList_ = clone(arg_20_0.curHeroList_)
			arg_20_0.tempTrialList_ = {
				0,
				0,
				0
			}
			arg_20_0.tempComboSkillID_ = arg_20_0.curComboSkillID_
			arg_20_0.tempMimirID_ = arg_20_0.curMimirID_
			arg_20_0.tempChipList_ = clone(arg_20_0.curChipList_)

			ReserveTools.SetTeam(var_20_0, arg_20_0.tempHeroList_, arg_20_0.tempTrialList_, arg_20_0.tempComboSkillID_, arg_20_0.tempMimirID_, arg_20_0.tempChipList_)
		elseif arg_20_0.params_.lastTempContID ~= arg_20_0.tempContID_ then
			local var_20_1 = ReserveParams.New(ReserveConst.RESERVE_TYPE.PROPOSAL, arg_20_0.params_.lastTempContID)

			arg_20_0.tempHeroList_ = ReserveTools.GetHeroList(var_20_1)
			arg_20_0.tempTrialList_ = {
				0,
				0,
				0
			}
			arg_20_0.tempComboSkillID_ = ReserveTools.GetComboSkillID(var_20_1)
			arg_20_0.tempMimirID_, arg_20_0.tempChipList_ = ReserveTools.GetMimirData(var_20_1)

			ReserveTools.SetTeam(var_20_0, arg_20_0.tempHeroList_, arg_20_0.tempTrialList_, arg_20_0.tempComboSkillID_, arg_20_0.tempMimirID_, arg_20_0.tempChipList_)
		else
			arg_20_0.tempHeroList_ = ReserveTools.GetHeroList(var_20_0)
			arg_20_0.tempComboSkillID_ = ReserveTools.GetComboSkillID(var_20_0)
			arg_20_0.tempMimirID_, arg_20_0.tempChipList_ = ReserveTools.GetMimirData(var_20_0)
		end
	end
end

function var_0_0.RefreshUI(arg_21_0)
	arg_21_0:RefreshReserveUI()
	arg_21_0:RefreshSwitchList()
	arg_21_0:RefreshBtnPanel()
end

function var_0_0.RefreshBtnPanel(arg_22_0)
	if ReserveTools.GetReserveTemplateByReserveType(ReserveConst.RESERVE_TYPE.PROPOSAL):GetContDataTemplateById(arg_22_0.curSelectContID_):GetIsDirty() == true then
		arg_22_0.btnStateController_:SetSelectedState("save")
	elseif arg_22_0:IsReserveProposalEqual(arg_22_0.curSelectContID_, arg_22_0.curHeroList_, arg_22_0.curComboSkillID_, arg_22_0.curMimirID_, arg_22_0.curChipList_) then
		arg_22_0.btnStateController_:SetSelectedState("cur")
	else
		arg_22_0.btnStateController_:SetSelectedState("normal")
	end
end

function var_0_0.RefreshSwitchList(arg_23_0)
	local var_23_0 = table.indexof(arg_23_0.contIDList_, arg_23_0.curSelectContID_) or 1

	arg_23_0.schemeSwitchList_:StartScroll(#arg_23_0.contIDList_, var_23_0)

	arg_23_0.progressText_.text = string.format(GetTips("RESERVE_PROPOSAL_NUM"), arg_23_0.curSchemeNum_, GameSetting.default_formation_num_max.value[1])
end

function var_0_0.RefreshReserveUI(arg_24_0)
	if arg_24_0.params_.isEnter then
		arg_24_0.params_.isEnter = false
		arg_24_0.curSelectContID_ = arg_24_0.contIDList_[1]
		arg_24_0.params_.lastSelectContID = arg_24_0.contIDList_[1]
	else
		arg_24_0.curSelectContID_ = arg_24_0.params_.lastSelectContID or arg_24_0.contIDList_[1]
	end

	arg_24_0.params_.lastSelectContID = arg_24_0.curSelectContID_

	arg_24_0.selectHeroView_:SetContID(arg_24_0.curSelectContID_)
end

function var_0_0.IndexItem(arg_25_0, arg_25_1, arg_25_2)
	local var_25_0 = arg_25_0.contIDList_[arg_25_1]
	local var_25_1 = var_25_0 == arg_25_0.tempContID_

	arg_25_2:SetData(var_25_0, var_25_1)
	arg_25_2:RegisterClickCallback(arg_25_0.clickSchemeHandler_)
	arg_25_2:RegistRenameCallback(arg_25_0.renameSchemeHandler_)
	arg_25_2:SetSelect(arg_25_0.curSelectContID_)
end

function var_0_0.OnClickScheme(arg_26_0, arg_26_1)
	if arg_26_1 == arg_26_0.curSelectContID_ then
		return
	end

	arg_26_0.curSelectContID_ = arg_26_1
	arg_26_0.params_.lastSelectContID = arg_26_0.curSelectContID_

	for iter_26_0, iter_26_1 in pairs(arg_26_0.schemeSwitchList_:GetItemList()) do
		iter_26_1:SetSelect(arg_26_0.curSelectContID_)
	end

	arg_26_0:RefreshReserveUI()
	arg_26_0:RefreshBtnPanel()
end

function var_0_0.GetContIDList(arg_27_0)
	local var_27_0 = ReserveTools.GetReserveTemplateByReserveType(ReserveConst.RESERVE_TYPE.PROPOSAL)
	local var_27_1 = var_27_0:GetProposalContIDList()
	local var_27_2 = {}

	arg_27_0.params_.lastTempContID = arg_27_0.tempContID_ or arg_27_0.params_.lastTempContID
	arg_27_0.tempContID_ = nil
	arg_27_0.curUseProposalContID_ = nil

	for iter_27_0, iter_27_1 in ipairs(var_27_1) do
		if arg_27_0:IsReserveProposalEqual(iter_27_1, arg_27_0.curHeroList_, arg_27_0.curComboSkillID_, arg_27_0.curMimirID_, arg_27_0.curChipList_) then
			arg_27_0.curUseProposalContID_ = iter_27_1

			break
		end
	end

	if arg_27_0.curUseProposalContID_ then
		var_27_2[1] = arg_27_0.curUseProposalContID_
	else
		arg_27_0.tempContID_ = var_27_0:GetTempContID()
		var_27_2[1] = arg_27_0.tempContID_
	end

	for iter_27_2, iter_27_3 in ipairs(var_27_1) do
		if iter_27_3 ~= var_27_2[1] then
			var_27_2[#var_27_2 + 1] = iter_27_3
		end
	end

	arg_27_0.contIDList_ = var_27_2
	arg_27_0.curProposalContIDList_ = var_27_1
	arg_27_0.curSchemeNum_ = #var_27_1
end

function var_0_0.SaveProposal(arg_28_0)
	ReserveAction.SaveReserveProposal(arg_28_0.saveContID_, handler(arg_28_0, arg_28_0.OnSaveProposal))
end

function var_0_0.SaveName(arg_29_0, arg_29_1)
	ReserveAction.RenameReserveProposal(arg_29_0.saveContID_, arg_29_1, handler(arg_29_0, arg_29_0.OnSaveProposal))
end

function var_0_0.OnSaveProposal(arg_30_0)
	arg_30_0:TryAutoApplyProposal(arg_30_0.saveContID_)

	if arg_30_0.saveContID_ == arg_30_0.tempContID_ then
		arg_30_0.tempContID_ = nil
	end

	arg_30_0.saveContID_ = nil

	ShowTips("FORMATION_PLAN_SAVED")
	manager.notify:Invoke(INPUT_POP_BACK)
	arg_30_0:GetContIDList()
	arg_30_0:UpdateTempContData()
	arg_30_0:RefreshSwitchList()
	arg_30_0:RefreshBtnPanel()
end

function var_0_0.ApplyProposal(arg_31_0)
	arg_31_0.curUseProposalContID_ = arg_31_0.curSelectContID_
	arg_31_0.curHeroList_ = arg_31_0.sectionProxy_:GetHeroIDList()
	arg_31_0.curTrialList_ = {
		0,
		0,
		0
	}
	arg_31_0.curComboSkillID_ = arg_31_0.sectionProxy_:GetComboSkillID()
	arg_31_0.curMimirID_ = arg_31_0.sectionProxy_:GetMimirID()
	arg_31_0.curChipList_ = arg_31_0.sectionProxy_:GetMimirChipList()
	arg_31_0.params_.heroList = clone(arg_31_0.curHeroList_)
	arg_31_0.params_.trialList = clone(arg_31_0.curTrialList_)
	arg_31_0.params_.comboSkillID = arg_31_0.curComboSkillID_
	arg_31_0.params_.mimirID = arg_31_0.curMimirID_
	arg_31_0.params_.chipList = clone(arg_31_0.curChipList_)

	arg_31_0.targetSectionProxy_:ApplyReserveProposal(arg_31_0.curHeroList_, arg_31_0.curTrialList_, arg_31_0.curComboSkillID_, arg_31_0.curMimirID_, arg_31_0.curChipList_)
end

function var_0_0.TryAutoApplyProposal(arg_32_0, arg_32_1)
	if arg_32_0.saveContID_ == arg_32_0.curUseProposalContID_ or arg_32_0.saveContID_ == arg_32_0.tempContID_ then
		arg_32_0:ApplyProposal()
	end
end

function var_0_0.OnSectionClickHero(arg_33_0, arg_33_1)
	arg_33_0.sectionProxy_:GotoHeroInfoUI(arg_33_1)
end

function var_0_0.OnChangeHeroTeam(arg_34_0, arg_34_1, arg_34_2)
	if arg_34_0.curSelectContID_ == arg_34_0.tempContID_ then
		arg_34_0.tempHeroList_ = clone(arg_34_1)
		arg_34_0.tempTrialList_ = clone(arg_34_2)
	end

	arg_34_0:RefreshSwitchList()
	arg_34_0:RefreshBtnPanel()
end

function var_0_0.OnChangeComboSkill(arg_35_0, arg_35_1)
	if arg_35_0.curSelectContID_ == arg_35_0.tempContID_ then
		arg_35_0.tempComboSkillID_ = arg_35_1
	end

	arg_35_0:RefreshBtnPanel()
end

function var_0_0.OnRenameScheme(arg_36_0, arg_36_1)
	arg_36_0.saveContID_ = arg_36_1

	JumpTools.OpenPageByJump("ProposalPopup")
end

function var_0_0.OnInput(arg_37_0, arg_37_1, arg_37_2)
	if arg_37_1 == "" then
		ShowTips("INPUT_EQUIP_PROPOSAL_NAME")

		return
	end

	if IsAllSpace(arg_37_1) then
		ShowTips("INPUT_CHAT_CONTENT")

		arg_37_2.text = ""

		return
	end

	local var_37_0, var_37_1 = textLimit(arg_37_1, GameSetting.user_name_max.value[1])

	arg_37_2.text = var_37_0
	arg_37_1 = var_37_0

	if not nameRule(arg_37_1) then
		ShowTips("ERROR_USER_NAME_SYMBOL_WORD")

		arg_37_2.text = ""

		return
	end

	WordVerifyBySDK(arg_37_1, function(arg_38_0)
		if not arg_38_0 then
			ShowTips("SENSITIVE_WORD")

			arg_37_2.text = ""

			return
		else
			if not var_37_1 then
				return
			end

			arg_37_0:SaveName(arg_37_1)
		end
	end, JUDGE_MESSAGE_TYPE.OTHER)
end

function var_0_0.OnDeleteProposal(arg_39_0, arg_39_1, arg_39_2)
	ShowTips("FORMATION_PLAN_DELETED")
	ReserveTools.GetReserveTemplateByReserveType(ReserveConst.RESERVE_TYPE.PROPOSAL):DeleteProposal(arg_39_2)

	arg_39_0.params_.lastSelectContID = nil

	arg_39_0:GetContIDList()
	arg_39_0:UpdateTempContData()
	arg_39_0:RefreshUI()
end

function var_0_0.IsReserveProposalEqual(arg_40_0, arg_40_1, arg_40_2, arg_40_3, arg_40_4, arg_40_5)
	local var_40_0 = ReserveParams.New(ReserveConst.RESERVE_TYPE.PROPOSAL, arg_40_1)
	local var_40_1 = ReserveTools.GetReserveTemplateByReserveType(ReserveConst.RESERVE_TYPE.PROPOSAL, true)
	local var_40_2 = var_40_1:GetHeroList(var_40_0)

	for iter_40_0, iter_40_1 in ipairs(arg_40_2) do
		if iter_40_1 ~= var_40_2[iter_40_0] then
			return false
		end
	end

	if arg_40_3 ~= var_40_1:GetComboSkillID(var_40_0) then
		return false
	end

	local var_40_3, var_40_4 = var_40_1:GetMimirData(var_40_0)

	if arg_40_4 ~= var_40_3 then
		return false
	end

	if #arg_40_5 ~= #var_40_4 then
		return false
	end

	local var_40_5 = {}

	for iter_40_2, iter_40_3 in ipairs(var_40_4) do
		var_40_5[iter_40_3] = true
	end

	for iter_40_4, iter_40_5 in ipairs(arg_40_5) do
		if not var_40_5[iter_40_5] then
			return false
		end
	end

	return true
end

function var_0_0.CheckHeroList(arg_41_0)
	local var_41_0 = false

	for iter_41_0, iter_41_1 in ipairs(arg_41_0.curTrialList_) do
		if iter_41_1 ~= 0 then
			var_41_0 = true
			arg_41_0.curHeroList_[iter_41_0] = 0
			arg_41_0.curTrialList_[iter_41_0] = 0
		end
	end

	if var_41_0 then
		for iter_41_2 = 1, 2 do
			for iter_41_3 = iter_41_2 + 1, 3 do
				if arg_41_0.curHeroList_[iter_41_2] == 0 then
					arg_41_0.curHeroList_[iter_41_2] = arg_41_0.curHeroList_[iter_41_3]
					arg_41_0.curHeroList_[iter_41_3] = 0
					arg_41_0.curTrialList_[iter_41_2] = arg_41_0.curTrialList_[iter_41_3]
					arg_41_0.curTrialList_[iter_41_3] = 0

					break
				end
			end
		end

		local var_41_1 = arg_41_0.curComboSkillID_

		if var_41_1 == 0 or not ComboSkillTools.IsAllMatch(var_41_1, arg_41_0.curHeroList_) then
			arg_41_0.curComboSkillID_ = ComboSkillTools.GetRecommendSkillID(arg_41_0.curHeroList_, true)
		end
	end
end

function var_0_0.GetSelectHeroViewClass(arg_42_0)
	return arg_42_0.sectionProxy_:GetSelectHeroViewClass()
end

function var_0_0.TryReload(arg_43_0)
	if not arg_43_0.createdSubview_ then
		arg_43_0.createdSubview_ = true
		arg_43_0.selectHeroView_ = arg_43_0:GetSelectHeroViewClass().New(arg_43_0.selectHeroGo_)
	end

	arg_43_0.selectHeroView_ = SectionSelectHeroTools.ReloadView(arg_43_0.selectHeroView_, arg_43_0.sectionProxy_:GetSelectHeroViewClass())
end

return var_0_0
