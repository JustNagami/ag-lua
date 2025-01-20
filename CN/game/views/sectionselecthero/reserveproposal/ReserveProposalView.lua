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

	arg_16_0:CheckHeroList()
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

		arg_19_0:UpdateEditContData()
	else
		arg_19_0.editContID_ = arg_19_0.contIDList_[1]
		arg_19_0.editHeroList_ = clone(arg_19_0.outerHeroList_)
		arg_19_0.editComboSkillID_ = arg_19_0.outerComboSkillID_
		arg_19_0.editMimirID_ = arg_19_0.outerMimirID_
		arg_19_0.editChipList_ = clone(arg_19_0.outerChipList_)
		arg_19_0.editLockHeroList_ = clone(arg_19_0.outerLockHeroList_)
	end

	arg_19_0:UpdateReserveParams()
end

function var_0_0.UpdateEditContData(arg_20_0)
	local var_20_0 = ReserveParams.New(ReserveConst.RESERVE_TYPE.PROPOSAL, arg_20_0.editContID_)

	arg_20_0.editHeroList_ = ReserveTools.GetHeroList(var_20_0)
	arg_20_0.editTrialList_ = {
		0,
		0,
		0
	}
	arg_20_0.editComboSkillID_ = ReserveTools.GetComboSkillID(var_20_0)
	arg_20_0.editMimirID_, arg_20_0.editChipList_ = ReserveTools.GetMimirData(var_20_0)
end

function var_0_0.UpdateReserveParams(arg_21_0)
	arg_21_0.reserveParams_.contID = arg_21_0.editContID_
end

function var_0_0.ProcessSubView(arg_22_0)
	arg_22_0:InitSubView()
	arg_22_0:TryReloadSubView()
	arg_22_0:ProcessSubViewParams()
end

function var_0_0.ProcessSubViewParams(arg_23_0)
	arg_23_0:SubViewCallFunc("SetProxy", arg_23_0.sectionProxy_)
end

function var_0_0.SubViewOnEnter(arg_24_0)
	arg_24_0:SubViewCallFunc("OnEnter")
end

function var_0_0.OnExit(arg_25_0)
	arg_25_0.params_.lastContIDList = arg_25_0.contIDList_
	arg_25_0.params_.lastEditContID = arg_25_0.editContID_

	arg_25_0:RemoveAllEventListener()
	arg_25_0:SubViewOnExit()
	manager.windowBar:HideBar()
	manager.ui:ResetMainCamera()
end

function var_0_0.SubViewOnExit(arg_26_0)
	arg_26_0:SubViewCallFunc("OnExit")
end

function var_0_0.Dispose(arg_27_0)
	arg_27_0:SubViewCallFunc("Dispose")

	for iter_27_0, iter_27_1 in pairs(arg_27_0.subViewDic_) do
		iter_27_1.go = nil
		iter_27_1.instance = nil
	end

	var_0_0.super.Dispose(arg_27_0)
end

function var_0_0.UpdateCamera(arg_28_0)
	manager.ui:SetMainCamera("battleHeroSelect")
	manager.ui:AdaptUIByFOV()
end

function var_0_0.UpdateBar(arg_29_0)
	arg_29_0.sectionProxy_:UpdateBar()
end

function var_0_0.ResetTempData(arg_30_0)
	arg_30_0.subViewDic_.selectHeroView.instance:ResetTempData()
end

function var_0_0.Refresh(arg_31_0)
	arg_31_0:RefreshSubView()
	arg_31_0:RefreshReserveUI()
	arg_31_0:RefreshSwitchList()
	arg_31_0:RefreshBtnPanel()
end

function var_0_0.RefreshSubView(arg_32_0)
	arg_32_0:SubViewCallFunc("Refresh")
end

function var_0_0.RefreshReserveUI(arg_33_0)
	arg_33_0.subViewDic_.selectHeroView.instance:SetContID(arg_33_0.editContID_)
end

function var_0_0.RefreshBtnPanel(arg_34_0)
	arg_34_0.subViewDic_.additionalView.instance:RefreshBtnPanel(arg_34_0.editContID_, arg_34_0.outerHeroList_, arg_34_0.outerComboSkillID_, arg_34_0.outerMimirID_, arg_34_0.outerChipList_)
end

function var_0_0.RefreshSwitchList(arg_35_0)
	arg_35_0.subViewDic_.additionalView.instance:RefreshSwitchList(arg_35_0.contIDList_, arg_35_0.editContID_, arg_35_0.curSavedProposalNum_)
end

function var_0_0.SaveProposal(arg_36_0)
	ReserveAction.SaveReserveProposal(arg_36_0.saveContID_, handler(arg_36_0, arg_36_0.OnSaveProposal))
end

function var_0_0.SaveName(arg_37_0, arg_37_1)
	ReserveAction.RenameReserveProposal(arg_37_0.saveContID_, arg_37_1, handler(arg_37_0, arg_37_0.OnSaveProposal))
end

function var_0_0.OnSaveProposal(arg_38_0)
	if arg_38_0.saveContID_ == arg_38_0.editContID_ then
		arg_38_0:TryAutoApplyProposal()
	end

	ShowTips("FORMATION_PLAN_SAVED")
	manager.notify:Invoke(INPUT_POP_BACK)
	arg_38_0:RefreshSwitchList()
	arg_38_0:RefreshBtnPanel()
end

function var_0_0.TryAutoApplyProposal(arg_39_0)
	local var_39_0 = false

	if #arg_39_0:GetFilterLockHeroList(arg_39_0.editHeroList_) == 0 and arg_39_0.contIDList_[1] == arg_39_0.editContID_ then
		var_39_0 = true
	end

	if var_39_0 then
		arg_39_0:ApplyProposal()
	end
end

function var_0_0.ApplyProposal(arg_40_0)
	arg_40_0.outerHeroList_ = clone(arg_40_0.editHeroList_)
	arg_40_0.outerTrialList_ = {
		0,
		0,
		0
	}
	arg_40_0.outerComboSkillID_ = arg_40_0.editComboSkillID_
	arg_40_0.outerMimirID_ = arg_40_0.editMimirID_
	arg_40_0.outerChipList_ = clone(arg_40_0.editChipList_)
	arg_40_0.params_.heroList = clone(arg_40_0.outerHeroList_)
	arg_40_0.params_.trialList = clone(arg_40_0.outerTrialList_)
	arg_40_0.params_.comboSkillID = arg_40_0.outerComboSkillID_
	arg_40_0.params_.mimirID = arg_40_0.outerMimirID_
	arg_40_0.params_.chipList = clone(arg_40_0.outerChipList_)

	arg_40_0.outerSectionProxy_:ApplyReserveProposal(arg_40_0.outerHeroList_, arg_40_0.outerTrialList_, arg_40_0.outerComboSkillID_, arg_40_0.outerMimirID_, arg_40_0.outerChipList_)
end

function var_0_0.OnReserveProposalClickSave(arg_41_0)
	local var_41_0 = arg_41_0.reserveTemplate_:GetContDataTemplateById(arg_41_0.editContID_)

	if var_41_0:GetIsTemp() and GameSetting.default_formation_num_max.value[1] == #arg_41_0.curProposalContIDList_ then
		ShowTips("RESERVE_PROPOSAL_SAVE_LIMIT")

		return
	end

	if arg_41_0.editHeroList_[1] == 0 then
		ShowTips("TEAM_SET_NEEDED")

		return
	end

	for iter_41_0, iter_41_1 in ipairs(arg_41_0.curProposalContIDList_) do
		if iter_41_1 ~= arg_41_0.editContID_ and SectionSelectHeroTools.IsReserveProposalEqual(iter_41_1, arg_41_0.editHeroList_, arg_41_0.editComboSkillID_, arg_41_0.editMimirID_, arg_41_0.editChipList_, true) then
			ShowTips("RESERVE_PROPOSAL_SAME")

			return
		end
	end

	arg_41_0.saveContID_ = arg_41_0.editContID_

	if var_41_0:GetName() == "" then
		JumpTools.OpenPageByJump("ProposalPopup")
	else
		arg_41_0:SaveProposal()
	end
end

function var_0_0.OnReserveProposalClickApply(arg_42_0)
	local var_42_0 = arg_42_0:GetFilterLockHeroList(arg_42_0.editHeroList_)

	if #var_42_0 > 0 then
		JumpTools.OpenPageByJump("filterLockHero", {
			heroIDList = var_42_0,
			type = SectionSelectHeroConst.DISPLAY_FILTER_LOCK_HERO_TYPE.PROPOSAL
		})

		return
	end

	arg_42_0:ApplyProposal()
	arg_42_0:OnApplyProposalSuccess()
end

function var_0_0.GetFilterLockHeroList(arg_43_0, arg_43_1)
	local var_43_0 = {}

	for iter_43_0, iter_43_1 in ipairs(arg_43_1) do
		if iter_43_1 ~= 0 and table.indexof(arg_43_0.outerLockHeroList_, iter_43_1) then
			var_43_0[#var_43_0 + 1] = iter_43_1
		end
	end

	return var_43_0
end

function var_0_0.OnApplyProposalSuccess(arg_44_0)
	ShowTips("RESERVE_PROPOSAL_SELECT_SUCCESS")
	arg_44_0:Back()
end

function var_0_0.OnReserveProposalClickDelete(arg_45_0)
	local var_45_0 = arg_45_0.reserveTemplate_:GetContDataTemplateById(arg_45_0.editContID_):GetName()

	ShowMessageBox({
		title = GetTips("PROMPT"),
		content = string.format(GetTips("FORMATION_PLAN_DELETE_CONFIRM"), var_45_0),
		OkCallback = function()
			arg_45_0.sectionProxy_:ResetTeam()
		end
	})
end

function var_0_0.OnReserveProposalClickProposal(arg_47_0, arg_47_1)
	if arg_47_1 == arg_47_0.editContID_ then
		return
	end

	arg_47_0.editContID_ = arg_47_1

	arg_47_0:UpdateEditContData()
	arg_47_0:UpdateReserveParams()
	arg_47_0:RefreshSubView()
	arg_47_0:RefreshReserveUI()
	arg_47_0:RefreshBtnPanel()
	arg_47_0.subViewDic_.additionalView.instance:RefreshSelect(arg_47_0.editContID_)
end

function var_0_0.OnReserveProposalClickRename(arg_48_0, arg_48_1)
	arg_48_0.saveContID_ = arg_48_1

	JumpTools.OpenPageByJump("ProposalPopup")
end

function var_0_0.OnSectionClickHero(arg_49_0, arg_49_1)
	arg_49_0.sectionProxy_:GotoHeroInfoUI(arg_49_1)
end

function var_0_0.OnChangeHeroTeam(arg_50_0, arg_50_1, arg_50_2)
	arg_50_0.editHeroList_ = clone(arg_50_1)

	arg_50_0:RefreshSwitchList()
	arg_50_0:RefreshBtnPanel()
end

function var_0_0.OnChangeComboSkill(arg_51_0, arg_51_1)
	arg_51_0.editComboSkillID_ = arg_51_1

	arg_51_0:RefreshBtnPanel()
end

function var_0_0.OnInput(arg_52_0, arg_52_1, arg_52_2)
	if arg_52_1 == "" then
		ShowTips("INPUT_EQUIP_PROPOSAL_NAME")

		return
	end

	if IsAllSpace(arg_52_1) then
		ShowTips("INPUT_CHAT_CONTENT")

		arg_52_2.text = ""

		return
	end

	local var_52_0, var_52_1 = textLimit(arg_52_1, GameSetting.user_name_max.value[1])

	arg_52_2.text = var_52_0
	arg_52_1 = var_52_0

	if not nameRule(arg_52_1) then
		ShowTips("ERROR_USER_NAME_SYMBOL_WORD")

		arg_52_2.text = ""

		return
	end

	WordVerifyBySDK(arg_52_1, function(arg_53_0)
		if not arg_53_0 then
			ShowTips("SENSITIVE_WORD")

			arg_52_2.text = ""

			return
		else
			if not var_52_1 then
				return
			end

			arg_52_0:SaveName(arg_52_1)
		end
	end, JUDGE_MESSAGE_TYPE.OTHER)
end

function var_0_0.OnDeleteProposal(arg_54_0, arg_54_1, arg_54_2)
	ShowTips("FORMATION_PLAN_DELETED")
	arg_54_0.reserveTemplate_:DeleteProposal(arg_54_2)

	local var_54_0 = arg_54_0.reserveTemplate_:GetProposalContIDList()

	arg_54_0.curProposalContIDList_ = var_54_0
	arg_54_0.curSavedProposalNum_ = #var_54_0

	local var_54_1 = table.indexof(arg_54_0.contIDList_, arg_54_2)

	table.remove(arg_54_0.contIDList_, var_54_1)

	if #arg_54_0.contIDList_ == 0 then
		arg_54_0.contIDList_[1] = arg_54_0:CreateTempProposal()
	end

	arg_54_0.editContID_ = arg_54_0.contIDList_[1]

	arg_54_0:UpdateEditContData()
	arg_54_0:UpdateReserveParams()
	arg_54_0:Refresh()
end

function var_0_0.CheckHeroList(arg_55_0)
	local var_55_0 = false

	for iter_55_0, iter_55_1 in ipairs(arg_55_0.outerTrialList_) do
		if iter_55_1 ~= 0 then
			var_55_0 = true
			arg_55_0.outerHeroList_[iter_55_0] = 0
			arg_55_0.outerTrialList_[iter_55_0] = 0
		end
	end

	if var_55_0 then
		for iter_55_2 = 1, 2 do
			for iter_55_3 = iter_55_2 + 1, 3 do
				if arg_55_0.outerHeroList_[iter_55_2] == 0 then
					arg_55_0.outerHeroList_[iter_55_2] = arg_55_0.outerHeroList_[iter_55_3]
					arg_55_0.outerHeroList_[iter_55_3] = 0
					arg_55_0.outerTrialList_[iter_55_2] = arg_55_0.outerTrialList_[iter_55_3]
					arg_55_0.outerTrialList_[iter_55_3] = 0

					break
				end
			end
		end

		local var_55_1 = arg_55_0.outerComboSkillID_

		if var_55_1 == 0 or not ComboSkillTools.IsAllMatch(var_55_1, arg_55_0.outerHeroList_) then
			arg_55_0.outerComboSkillID_ = ComboSkillTools.GetRecommendSkillID(arg_55_0.outerHeroList_, true)
		end
	end
end

function var_0_0.GetSelectHeroViewClass(arg_56_0)
	return arg_56_0.sectionProxy_:GetSelectHeroViewClass()
end

function var_0_0.GetAdditionalViewClass(arg_57_0)
	return arg_57_0.sectionProxy_:GetAdditionalViewClass()
end

function var_0_0.InitSubView(arg_58_0)
	if not arg_58_0.createdSubview_ then
		arg_58_0.createdSubview_ = true

		for iter_58_0, iter_58_1 in pairs(arg_58_0.subViewDic_) do
			local var_58_0 = iter_58_1.go

			iter_58_1.instance = iter_58_1.getClassFunc().New(var_58_0)

			if iter_58_1.initFunc then
				iter_58_1.initFunc()
			end
		end
	end
end

function var_0_0.TryReloadSubView(arg_59_0)
	for iter_59_0, iter_59_1 in pairs(arg_59_0.subViewDic_) do
		if SectionSelectHeroTools.IsDiffViewClass(iter_59_1.instance, iter_59_1.getClassFunc()) then
			iter_59_1.instance = SectionSelectHeroTools.ReloadView(iter_59_1.instance, iter_59_1.getClassFunc())

			if iter_59_1.initFunc then
				iter_59_1.initFunc()
			end
		end
	end
end

function var_0_0.SubViewCallFunc(arg_60_0, arg_60_1, ...)
	for iter_60_0, iter_60_1 in pairs(arg_60_0.subViewDic_) do
		local var_60_0 = iter_60_1.instance

		if var_60_0 and var_60_0[arg_60_1] then
			var_60_0[arg_60_1](var_60_0, ...)
		end
	end
end

return var_0_0
