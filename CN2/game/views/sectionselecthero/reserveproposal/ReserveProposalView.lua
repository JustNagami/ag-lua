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
	arg_12_0.outerSectionProxy_ = arg_12_0.params_.sectionProxy
end

function var_0_0.ProcessReserveParams(arg_13_0)
	if not arg_13_0.reserveParams_ then
		arg_13_0.reserveParams_ = ReserveParams.New(ReserveConst.RESERVE_TYPE.PROPOSAL, 1)
	end

	arg_13_0.reserveTemplate_ = ReserveTools.GetReserveTemplateByReserveType(ReserveConst.RESERVE_TYPE.PROPOSAL)
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

	arg_15_0:ProcessOuterTeam()
	arg_15_0:InitContIDList()
	arg_15_0:InitEditContData()
end

function var_0_0.ProcessOuterTeam(arg_16_0)
	arg_16_0.outerHeroList_ = clone(arg_16_0.params_.heroList)
	arg_16_0.outerTrialList_ = clone(arg_16_0.params_.trialList)
	arg_16_0.outerComboSkillID_ = arg_16_0.params_.comboSkillID
	arg_16_0.outerMimirID_ = arg_16_0.params_.mimirID
	arg_16_0.outerChipList_ = clone(arg_16_0.params_.chipList)
	arg_16_0.outerLockHeroList_ = clone(arg_16_0.params_.lockHeroList)

	arg_16_0:CheckOuterHeroList()
end

function var_0_0.InitContIDList(arg_17_0)
	local var_17_0 = arg_17_0.reserveTemplate_:GetProposalContIDList()

	if arg_17_0.params_.lastContIDList then
		arg_17_0.contIDList_ = arg_17_0.params_.lastContIDList
	else
		local var_17_1 = {}
		local var_17_2

		for iter_17_0, iter_17_1 in ipairs(var_17_0) do
			if SectionSelectHeroTools.IsReserveProposalEqual(iter_17_1, arg_17_0.outerHeroList_, arg_17_0.outerComboSkillID_, arg_17_0.outerMimirID_, arg_17_0.outerChipList_) then
				var_17_2 = iter_17_1

				break
			end
		end

		var_17_2 = var_17_2 or arg_17_0:CreateTempProposal()
		var_17_1[1] = var_17_2

		for iter_17_2, iter_17_3 in ipairs(var_17_0) do
			if iter_17_3 ~= var_17_1[1] then
				var_17_1[#var_17_1 + 1] = iter_17_3
			end
		end

		arg_17_0.contIDList_ = var_17_1
	end

	arg_17_0.curProposalContIDList_ = var_17_0
	arg_17_0.curSavedProposalNum_ = #var_17_0
end

function var_0_0.CreateTempProposal(arg_18_0)
	local var_18_0 = arg_18_0.reserveTemplate_:GreateTempContID()
	local var_18_1 = ReserveParams.New(ReserveConst.RESERVE_TYPE.PROPOSAL, var_18_0)

	ReserveTools.SetTeam(var_18_1, arg_18_0.outerHeroList_, {
		0,
		0,
		0
	}, arg_18_0.outerComboSkillID_, arg_18_0.outerMimirID_, arg_18_0.outerChipList_)

	return var_18_0
end

function var_0_0.InitEditContData(arg_19_0)
	if arg_19_0.params_.lastEditContID then
		arg_19_0.editContID_ = arg_19_0.params_.lastEditContID
	else
		arg_19_0.editContID_ = arg_19_0.contIDList_[1]
	end

	arg_19_0:UpdateEditContData()
end

function var_0_0.UpdateEditContData(arg_20_0)
	arg_20_0.reserveParams_.contID = arg_20_0.editContID_
	arg_20_0.editHeroList_ = arg_20_0.sectionProxy_:GetHeroTeam()
	arg_20_0.editTrialList_ = {
		0,
		0,
		0
	}
	arg_20_0.editComboSkillID_ = arg_20_0.sectionProxy_:GetComboSkillID()
	arg_20_0.editMimirID_, arg_20_0.editChipList_ = arg_20_0.sectionProxy_:GetMimirData()
end

function var_0_0.ProcessSubView(arg_21_0)
	arg_21_0:InitSubView()
	arg_21_0:TryReloadSubView()
	arg_21_0:ProcessSubViewParams()
end

function var_0_0.ProcessSubViewParams(arg_22_0)
	arg_22_0:SubViewCallFunc("SetProxy", arg_22_0.sectionProxy_)
end

function var_0_0.SubViewOnEnter(arg_23_0)
	arg_23_0:SubViewCallFunc("OnEnter")
end

function var_0_0.OnExit(arg_24_0)
	arg_24_0.params_.lastContIDList = arg_24_0.contIDList_
	arg_24_0.params_.lastEditContID = arg_24_0.editContID_

	arg_24_0:RemoveAllEventListener()
	arg_24_0:SubViewOnExit()
	manager.windowBar:HideBar()
	manager.ui:ResetMainCamera()
end

function var_0_0.SubViewOnExit(arg_25_0)
	arg_25_0:SubViewCallFunc("OnExit")
end

function var_0_0.Dispose(arg_26_0)
	arg_26_0:SubViewCallFunc("Dispose")

	for iter_26_0, iter_26_1 in pairs(arg_26_0.subViewDic_) do
		iter_26_1.go = nil
		iter_26_1.instance = nil
	end

	var_0_0.super.Dispose(arg_26_0)
end

function var_0_0.UpdateCamera(arg_27_0)
	manager.ui:SetMainCamera("battleHeroSelect")
	manager.ui:AdaptUIByFOV()
end

function var_0_0.UpdateBar(arg_28_0)
	arg_28_0.sectionProxy_:UpdateBar()
end

function var_0_0.ResetTempData(arg_29_0)
	arg_29_0.subViewDic_.selectHeroView.instance:ResetTempData()
end

function var_0_0.Refresh(arg_30_0)
	arg_30_0:RefreshSubView()
	arg_30_0:RefreshReserveUI()
	arg_30_0:RefreshSwitchList()
	arg_30_0:RefreshBtnPanel()
end

function var_0_0.RefreshSubView(arg_31_0)
	arg_31_0:SubViewCallFunc("Refresh")
end

function var_0_0.RefreshReserveUI(arg_32_0)
	arg_32_0.subViewDic_.selectHeroView.instance:SetContID(arg_32_0.editContID_)
end

function var_0_0.RefreshBtnPanel(arg_33_0)
	arg_33_0.subViewDic_.additionalView.instance:RefreshBtnPanel(arg_33_0.editContID_, arg_33_0.outerHeroList_, arg_33_0.outerComboSkillID_, arg_33_0.outerMimirID_, arg_33_0.outerChipList_)
end

function var_0_0.RefreshSwitchList(arg_34_0)
	arg_34_0.subViewDic_.additionalView.instance:RefreshSwitchList(arg_34_0.contIDList_, arg_34_0.editContID_, arg_34_0.curSavedProposalNum_)
end

function var_0_0.SaveProposal(arg_35_0)
	ReserveAction.SaveReserveProposal(arg_35_0.saveContID_, handler(arg_35_0, arg_35_0.OnSaveProposal))
end

function var_0_0.SaveName(arg_36_0, arg_36_1)
	ReserveAction.RenameReserveProposal(arg_36_0.saveContID_, arg_36_1, handler(arg_36_0, arg_36_0.OnSaveProposal))
end

function var_0_0.OnSaveProposal(arg_37_0)
	if arg_37_0.saveContID_ == arg_37_0.editContID_ then
		arg_37_0:TryAutoApplyProposal()
	end

	ShowTips("FORMATION_PLAN_SAVED")
	manager.notify:Invoke(INPUT_POP_BACK)
	arg_37_0:RefreshSwitchList()
	arg_37_0:RefreshBtnPanel()
end

function var_0_0.TryAutoApplyProposal(arg_38_0)
	local var_38_0 = false

	if #arg_38_0:GetFilterLockHeroList(arg_38_0.editHeroList_) == 0 and arg_38_0.contIDList_[1] == arg_38_0.editContID_ then
		var_38_0 = true
	end

	if var_38_0 then
		arg_38_0:ApplyProposal()
	end
end

function var_0_0.ApplyProposal(arg_39_0)
	arg_39_0.outerHeroList_ = clone(arg_39_0.editHeroList_)
	arg_39_0.outerTrialList_ = {
		0,
		0,
		0
	}
	arg_39_0.outerComboSkillID_ = arg_39_0.editComboSkillID_
	arg_39_0.outerMimirID_ = arg_39_0.editMimirID_
	arg_39_0.outerChipList_ = clone(arg_39_0.editChipList_)
	arg_39_0.params_.heroList = clone(arg_39_0.outerHeroList_)
	arg_39_0.params_.trialList = clone(arg_39_0.outerTrialList_)
	arg_39_0.params_.comboSkillID = arg_39_0.outerComboSkillID_
	arg_39_0.params_.mimirID = arg_39_0.outerMimirID_
	arg_39_0.params_.chipList = clone(arg_39_0.outerChipList_)

	arg_39_0.outerSectionProxy_:ApplyReserveProposal(arg_39_0.outerHeroList_, arg_39_0.outerTrialList_, arg_39_0.outerComboSkillID_, arg_39_0.outerMimirID_, arg_39_0.outerChipList_)
end

function var_0_0.OnReserveProposalClickSave(arg_40_0)
	local var_40_0 = arg_40_0.reserveTemplate_:GetContDataTemplateById(arg_40_0.editContID_)

	if var_40_0:GetIsTemp() and GameSetting.default_formation_num_max.value[1] == #arg_40_0.curProposalContIDList_ then
		ShowTips("RESERVE_PROPOSAL_SAVE_LIMIT")

		return
	end

	if arg_40_0.editHeroList_[1] == 0 then
		ShowTips("TEAM_SET_NEEDED")

		return
	end

	for iter_40_0, iter_40_1 in ipairs(arg_40_0.curProposalContIDList_) do
		if iter_40_1 ~= arg_40_0.editContID_ and SectionSelectHeroTools.IsReserveProposalEqual(iter_40_1, arg_40_0.editHeroList_, arg_40_0.editComboSkillID_, arg_40_0.editMimirID_, arg_40_0.editChipList_, true) then
			ShowTips("RESERVE_PROPOSAL_SAME")

			return
		end
	end

	arg_40_0.saveContID_ = arg_40_0.editContID_

	if var_40_0:GetName() == "" then
		JumpTools.OpenPageByJump("ProposalPopup")
	else
		arg_40_0:SaveProposal()
	end
end

function var_0_0.OnReserveProposalClickApply(arg_41_0)
	local var_41_0 = arg_41_0:GetFilterLockHeroList(arg_41_0.editHeroList_)

	if #var_41_0 > 0 then
		JumpTools.OpenPageByJump("filterLockHero", {
			heroIDList = var_41_0,
			type = SectionSelectHeroConst.DISPLAY_FILTER_LOCK_HERO_TYPE.PROPOSAL
		})

		return
	end

	arg_41_0:ApplyProposal()
	arg_41_0:OnApplyProposalSuccess()
end

function var_0_0.GetFilterLockHeroList(arg_42_0, arg_42_1)
	local var_42_0 = {}

	for iter_42_0, iter_42_1 in ipairs(arg_42_1) do
		if iter_42_1 ~= 0 and table.indexof(arg_42_0.outerLockHeroList_, iter_42_1) then
			var_42_0[#var_42_0 + 1] = iter_42_1
		end
	end

	return var_42_0
end

function var_0_0.OnApplyProposalSuccess(arg_43_0)
	ShowTips("RESERVE_PROPOSAL_SELECT_SUCCESS")
	arg_43_0:Back()
end

function var_0_0.OnReserveProposalClickDelete(arg_44_0)
	local var_44_0 = arg_44_0.reserveTemplate_:GetContDataTemplateById(arg_44_0.editContID_):GetName()

	ShowMessageBox({
		title = GetTips("PROMPT"),
		content = string.format(GetTips("FORMATION_PLAN_DELETE_CONFIRM"), var_44_0),
		OkCallback = function()
			arg_44_0.sectionProxy_:ResetTeam()
		end
	})
end

function var_0_0.OnReserveProposalClickProposal(arg_46_0, arg_46_1)
	if arg_46_1 == arg_46_0.editContID_ then
		return
	end

	arg_46_0.editContID_ = arg_46_1

	arg_46_0:UpdateEditContData()
	arg_46_0:RefreshSubView()
	arg_46_0:RefreshReserveUI()
	arg_46_0:RefreshBtnPanel()
	arg_46_0.subViewDic_.additionalView.instance:RefreshSelect(arg_46_0.editContID_)
end

function var_0_0.OnReserveProposalClickRename(arg_47_0, arg_47_1)
	arg_47_0.saveContID_ = arg_47_1

	JumpTools.OpenPageByJump("ProposalPopup")
end

function var_0_0.OnSectionClickHero(arg_48_0, arg_48_1)
	arg_48_0.sectionProxy_:GotoHeroInfoUI(arg_48_1)
end

function var_0_0.OnChangeHeroTeam(arg_49_0, arg_49_1, arg_49_2)
	arg_49_0.editHeroList_ = clone(arg_49_1)

	arg_49_0:RefreshSwitchList()
	arg_49_0:RefreshBtnPanel()
end

function var_0_0.OnChangeComboSkill(arg_50_0, arg_50_1)
	arg_50_0.editComboSkillID_ = arg_50_1

	arg_50_0:RefreshBtnPanel()
end

function var_0_0.OnInput(arg_51_0, arg_51_1, arg_51_2)
	if arg_51_1 == "" then
		ShowTips("INPUT_EQUIP_PROPOSAL_NAME")

		return
	end

	if IsAllSpace(arg_51_1) then
		ShowTips("INPUT_CHAT_CONTENT")

		arg_51_2.text = ""

		return
	end

	local var_51_0, var_51_1 = textLimit(arg_51_1, GameSetting.user_name_max.value[1])

	arg_51_2.text = var_51_0
	arg_51_1 = var_51_0

	if not nameRule(arg_51_1) then
		ShowTips("ERROR_USER_NAME_SYMBOL_WORD")

		arg_51_2.text = ""

		return
	end

	WordVerifyBySDK(arg_51_1, function(arg_52_0)
		if not arg_52_0 then
			ShowTips("SENSITIVE_WORD")

			arg_51_2.text = ""

			return
		else
			if not var_51_1 then
				return
			end

			arg_51_0:SaveName(arg_51_1)
		end
	end, JUDGE_MESSAGE_TYPE.OTHER)
end

function var_0_0.OnDeleteProposal(arg_53_0, arg_53_1, arg_53_2)
	ShowTips("FORMATION_PLAN_DELETED")
	arg_53_0.reserveTemplate_:DeleteProposal(arg_53_2)

	local var_53_0 = arg_53_0.reserveTemplate_:GetProposalContIDList()

	arg_53_0.curProposalContIDList_ = var_53_0
	arg_53_0.curSavedProposalNum_ = #var_53_0

	local var_53_1 = table.indexof(arg_53_0.contIDList_, arg_53_2)

	table.remove(arg_53_0.contIDList_, var_53_1)

	if #arg_53_0.contIDList_ == 0 then
		arg_53_0.contIDList_[1] = arg_53_0:CreateTempProposal()
	end

	arg_53_0.editContID_ = arg_53_0.contIDList_[1]

	arg_53_0:UpdateEditContData()
	arg_53_0:Refresh()
end

function var_0_0.CheckOuterHeroList(arg_54_0)
	local var_54_0 = false

	for iter_54_0, iter_54_1 in ipairs(arg_54_0.outerTrialList_) do
		if iter_54_1 ~= 0 then
			var_54_0 = true
			arg_54_0.outerHeroList_[iter_54_0] = 0
			arg_54_0.outerTrialList_[iter_54_0] = 0
		end
	end

	if var_54_0 then
		for iter_54_2 = 1, 2 do
			for iter_54_3 = iter_54_2 + 1, 3 do
				if arg_54_0.outerHeroList_[iter_54_2] == 0 then
					arg_54_0.outerHeroList_[iter_54_2] = arg_54_0.outerHeroList_[iter_54_3]
					arg_54_0.outerHeroList_[iter_54_3] = 0
					arg_54_0.outerTrialList_[iter_54_2] = arg_54_0.outerTrialList_[iter_54_3]
					arg_54_0.outerTrialList_[iter_54_3] = 0

					break
				end
			end
		end

		local var_54_1 = arg_54_0.outerComboSkillID_

		if var_54_1 == 0 or not ComboSkillTools.IsAllMatch(var_54_1, arg_54_0.outerHeroList_) then
			arg_54_0.outerComboSkillID_ = ComboSkillTools.GetRecommendSkillID(arg_54_0.outerHeroList_, true)
		end
	end
end

function var_0_0.GetSelectHeroViewClass(arg_55_0)
	return arg_55_0.sectionProxy_:GetSelectHeroViewClass()
end

function var_0_0.GetAdditionalViewClass(arg_56_0)
	return arg_56_0.sectionProxy_:GetAdditionalViewClass()
end

function var_0_0.InitSubView(arg_57_0)
	if not arg_57_0.createdSubview_ then
		arg_57_0.createdSubview_ = true

		for iter_57_0, iter_57_1 in pairs(arg_57_0.subViewDic_) do
			local var_57_0 = iter_57_1.go

			iter_57_1.instance = iter_57_1.getClassFunc().New(var_57_0)

			if iter_57_1.initFunc then
				iter_57_1.initFunc()
			end
		end
	end
end

function var_0_0.TryReloadSubView(arg_58_0)
	for iter_58_0, iter_58_1 in pairs(arg_58_0.subViewDic_) do
		if SectionSelectHeroTools.IsDiffViewClass(iter_58_1.instance, iter_58_1.getClassFunc()) then
			iter_58_1.instance = SectionSelectHeroTools.ReloadView(iter_58_1.instance, iter_58_1.getClassFunc())

			if iter_58_1.initFunc then
				iter_58_1.initFunc()
			end
		end
	end
end

function var_0_0.SubViewCallFunc(arg_59_0, arg_59_1, ...)
	for iter_59_0, iter_59_1 in pairs(arg_59_0.subViewDic_) do
		local var_59_0 = iter_59_1.instance

		if var_59_0 and var_59_0[arg_59_1] then
			var_59_0[arg_59_1](var_59_0, ...)
		end
	end
end

return var_0_0
