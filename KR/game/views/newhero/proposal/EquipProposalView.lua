local var_0_0 = class("EquipProposalView", ReduxView)
local var_0_1 = {
	"存为新方案",
	"装备",
	"已装备"
}
local var_0_2 = {
	"detail",
	"rough"
}

function var_0_0.UIName(arg_1_0)
	return "Widget/System/Hero_equip/HeroEquipOptionUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0.selectItem_ = nil
	arg_3_0.heroEquipProposal_ = 0
	arg_3_0.proposalState_ = 1
	arg_3_0.panelState_ = 1

	arg_3_0:InitUI()
	arg_3_0:AddUIListener()

	arg_3_0.inputHandler_ = handler(arg_3_0, arg_3_0.OnInput)
	arg_3_0.inputCancelHandler_ = handler(arg_3_0, arg_3_0.OnInputCancel)
end

function var_0_0.InitUI(arg_4_0)
	arg_4_0:BindCfgUI()

	arg_4_0.gridScroll_ = LuaList.New(handler(arg_4_0, arg_4_0.indexItem), arg_4_0.proposalList_, ProposalItem)
	arg_4_0.equipDisc_ = EquipDisc.New(arg_4_0.discGo_)
	arg_4_0.equipOverrall_ = EquipOverall.New(arg_4_0.equipoverrallGo_)

	arg_4_0.equipOverrall_:RegistSkillClick(handler(arg_4_0, arg_4_0.SkillClick))
	arg_4_0.equipOverrall_:RegistOptionButton(handler(arg_4_0, arg_4_0.SaveOptionFunc), handler(arg_4_0, arg_4_0.EquipOptionFunc), handler(arg_4_0, arg_4_0.DeleteOptionFunc))

	arg_4_0.equipSkillPop_ = EquipNewSkillInfoView.New(arg_4_0.equipSkillGo_)
	arg_4_0.skillPopController_ = arg_4_0.transCon_:GetController("skill")
end

function var_0_0.AddUIListener(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.btnPopMask_, nil, function()
		arg_5_0:HideMaskMessage()
	end)
end

function var_0_0.OnEnter(arg_7_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR
	})

	arg_7_0.heroID_ = arg_7_0.params_.heroID
	arg_7_0.proposalList_ = ProposalData:GetProposalData()
	arg_7_0.heroInfo_ = HeroData:GetHeroData(arg_7_0.heroID_)

	arg_7_0.equipOverrall_:OnEnter(arg_7_0.params_.proxy)
	arg_7_0.equipDisc_:OnEnter({
		isShowDetail = true
	})
	arg_7_0:HideMaskMessage()
	manager.notify:RegistListener(INPUT_POP_CLICK_OK, arg_7_0.inputHandler_)
	manager.notify:RegistListener(INPUT_POP_CLICK_CLOSE, arg_7_0.inputCancelHandler_)
	manager.notify:RegistListener(INPUT_POP_CLICK_CANCEL, arg_7_0.inputCancelHandler_)
	arg_7_0:RefreshUI()
end

function var_0_0.RefreshUI(arg_8_0)
	arg_8_0:UpdateData()

	arg_8_0.selectItem_ = 1

	arg_8_0.gridScroll_:StartScroll(#arg_8_0.sortedList_)
	arg_8_0:RefreshRight(1)

	local var_8_0 = #arg_8_0.sortedList_ - (arg_8_0.heroEquipProposal_ == 0 and 1 or 0)

	arg_8_0.curproposalText_.text = GetTips("EQUIP_PROPOSAL") .. string.format("：%s/%s", var_8_0, GameSetting.equip_proposal_num_max.value[1])
end

function var_0_0.UpdateData(arg_9_0)
	arg_9_0.sortedList_ = {}

	local var_9_0 = HeroTools.GetHeroEquipS(arg_9_0.heroID_)
	local var_9_1

	for iter_9_0, iter_9_1 in pairs(arg_9_0.proposalList_) do
		if table.equal(iter_9_1.equip_list, var_9_0, "all") then
			var_9_1 = iter_9_1
			arg_9_0.sortedList_[1] = iter_9_1
		end
	end

	if var_9_1 then
		arg_9_0.sortedList_[1] = var_9_1
	else
		arg_9_0.sortedList_[1] = {
			proposal_id = 0,
			proposal_name = GetTips("CURRENT_SCHEME"),
			equip_list = var_9_0
		}
	end

	local var_9_2 = 2

	for iter_9_2, iter_9_3 in pairs(arg_9_0.proposalList_) do
		if var_9_1 then
			if iter_9_3.proposal_id ~= var_9_1.proposal_id then
				arg_9_0.sortedList_[var_9_2] = iter_9_3
				var_9_2 = var_9_2 + 1
			end
		else
			arg_9_0.sortedList_[var_9_2] = iter_9_3
			var_9_2 = var_9_2 + 1
		end
	end

	arg_9_0.heroEquipProposal_ = var_9_1 and var_9_1.proposal_id or 0
end

function var_0_0.indexItem(arg_10_0, arg_10_1, arg_10_2)
	arg_10_2:ShowSelect(arg_10_0.selectItem_ == arg_10_1)
	arg_10_2:RefreshUI(arg_10_0.sortedList_[arg_10_1])

	local function var_10_0()
		arg_10_0:SelectItem(arg_10_1)
	end

	local function var_10_1()
		arg_10_0.renameFlag_ = true

		JumpTools.OpenPageByJump("ProposalPopup")
	end

	arg_10_2:RegistCallBack(var_10_0, var_10_1)
end

function var_0_0.RefreshRight(arg_13_0, arg_13_1)
	arg_13_0:RefreshButtonState(arg_13_0.sortedList_[arg_13_1].proposal_id)
	arg_13_0.equipOverrall_:RefreshHeroInfo(arg_13_0.heroInfo_, arg_13_0.sortedList_[arg_13_1].equip_list, arg_13_0.proposalState_)

	arg_13_0.equipDataList_ = EquipTools.GetEquipDataList(arg_13_0.sortedList_[arg_13_1].equip_list)

	arg_13_0.equipDisc_:RefreshItem(arg_13_0.equipDataList_)
end

function var_0_0.SelectItem(arg_14_0, arg_14_1)
	local var_14_0, var_14_1 = arg_14_0.gridScroll_:GetHeadAndTail()

	if arg_14_0.selectItem_ and var_14_0 <= arg_14_0.selectItem_ and var_14_1 >= arg_14_0.selectItem_ then
		arg_14_0.gridScroll_:GetItemByIndex(arg_14_0.selectItem_):ShowSelect(false)
	end

	arg_14_0.selectItem_ = arg_14_1

	arg_14_0.gridScroll_:GetItemByIndex(arg_14_0.selectItem_):ShowSelect(true)
	arg_14_0:RefreshRight(arg_14_1)
end

function var_0_0.OnEquipQuickDressOn(arg_15_0, arg_15_1, arg_15_2)
	for iter_15_0 = 1, 6 do
		HeroAction.HeroChangeEquip(arg_15_2.hero_id, arg_15_2.use_equip_list[iter_15_0].equip_id, arg_15_2.use_equip_list[iter_15_0].pos)
	end

	arg_15_0:RefreshUI()
	ShowTips("SUCCESS_EQUIP_PROPOSAL")
end

function var_0_0.OnAddProposal(arg_16_0)
	arg_16_0:RefreshUI()
	ShowTips("SUCCESS_SAVE_EQUIP_PROPOSAL")
end

function var_0_0.OnModifyProposal(arg_17_0)
	local var_17_0, var_17_1 = arg_17_0.gridScroll_:GetHeadAndTail()

	if arg_17_0.selectItem_ and var_17_0 <= arg_17_0.selectItem_ and var_17_1 >= arg_17_0.selectItem_ then
		arg_17_0.gridScroll_:GetItemByIndex(arg_17_0.selectItem_):RefreshUI(arg_17_0.sortedList_[arg_17_0.selectItem_])
	end

	ShowTips("SUCCESS_SAVE_EQUIP_PROPOSAL")
end

function var_0_0.OnDeleteProposal(arg_18_0)
	arg_18_0:RefreshUI()
end

function var_0_0.EquipOptionFunc(arg_19_0)
	if arg_19_0.proposalState_ == "notEquip" then
		local var_19_0 = arg_19_0.sortedList_[arg_19_0.selectItem_].equip_list
		local var_19_1 = {}
		local var_19_2 = HeroData:GetEquipMap()
		local var_19_3 = 0

		for iter_19_0, iter_19_1 in ipairs(var_19_0) do
			local var_19_4 = var_19_2[iter_19_1.equip_id]

			var_19_1[iter_19_0] = {
				equip_id = iter_19_1.equip_id,
				pos = iter_19_1.pos
			}

			if var_19_4 and var_19_4 ~= arg_19_0.heroID_ then
				var_19_3 = var_19_3 + 1
				var_19_1[iter_19_0].equiping = var_19_4
			end
		end

		if var_19_3 ~= 0 then
			arg_19_0:Go("ProposalCheck", {
				equipS = var_19_1
			})
		else
			local var_19_5 = {}

			for iter_19_2 = 1, #var_19_1 do
				var_19_5[iter_19_2] = {
					pos = var_19_1[iter_19_2].pos,
					equip_id = var_19_1[iter_19_2].equip_id
				}
			end

			EquipAction.EquipQuickDressOn(arg_19_0.heroID_, var_19_5)
		end
	end
end

function var_0_0.SaveOptionFunc(arg_20_0)
	if arg_20_0.proposalState_ == "notSave" then
		if #arg_20_0.sortedList_ > GameSetting.equip_proposal_num_max.value[1] then
			ShowTips("ERROR_EQUIP_PROPOSAL_NUM_LIMIT")

			return
		end

		arg_20_0.saveFlag_ = true

		JumpTools.OpenPageByJump("ProposalPopup")
	end
end

function var_0_0.DeleteOptionFunc(arg_21_0)
	local var_21_0 = arg_21_0.sortedList_[arg_21_0.selectItem_].proposal_id

	ProposalAction.DeleteProposal(var_21_0)
end

function var_0_0.SkillClick(arg_22_0, arg_22_1, arg_22_2)
	arg_22_0.equipSkillPop_:RefreshData(arg_22_0, arg_22_2)
	arg_22_0.skillPopController_:SetSelectedState("show")
end

function var_0_0.HideMaskMessage(arg_23_0)
	arg_23_0.skillPopController_:SetSelectedState("hide")
	arg_23_0.equipOverrall_:DeSelect()
end

function var_0_0.RefreshButtonState(arg_24_0, arg_24_1)
	local var_24_0

	arg_24_0.proposalState_ = arg_24_1 == 0 and "notSave" or arg_24_1 ~= arg_24_0.heroEquipProposal_ and "notEquip" or "equipping"
end

function var_0_0.OnInput(arg_25_0, arg_25_1, arg_25_2)
	if not arg_25_0.renameFlag_ and not arg_25_0.saveFlag_ then
		return
	end

	if arg_25_1 == "" then
		ShowTips("INPUT_EQUIP_PROPOSAL_NAME")

		return
	end

	if IsAllSpace(arg_25_1) then
		ShowTips("INPUT_CHAT_CONTENT")

		arg_25_2.text = ""

		return
	end

	local var_25_0, var_25_1 = textLimit(arg_25_1, GameSetting.user_name_max.value[1])

	arg_25_2.text = var_25_0
	arg_25_1 = var_25_0

	if not nameRule(arg_25_1) then
		ShowTips("ERROR_USER_NAME_SYMBOL_WORD")

		arg_25_2.text = ""

		return
	end

	WordVerifyBySDK(arg_25_1, function(arg_26_0)
		if not arg_26_0 then
			ShowTips("SENSITIVE_WORD")

			arg_25_2.text = ""

			return
		else
			if not var_25_1 then
				return
			end

			if arg_25_0.renameFlag_ then
				local var_26_0 = arg_25_0.sortedList_[arg_25_0.selectItem_].proposal_id

				ProposalAction.ModifyProposal(arg_25_0.heroID_, arg_25_1, var_26_0)
			else
				ProposalAction.AddProposal(arg_25_0.heroID_, arg_25_1, 0)
			end

			arg_25_0.renameFlag_ = false
			arg_25_0.saveFlag_ = false

			manager.notify:Invoke(INPUT_POP_BACK)
		end
	end, JUDGE_MESSAGE_TYPE.OTHER)
end

function var_0_0.OnInputCancel(arg_27_0)
	arg_27_0.renameFlag_ = false
	arg_27_0.saveFlag_ = false
end

function var_0_0.OnExit(arg_28_0)
	manager.windowBar:HideBar()
	arg_28_0.equipOverrall_:OnExit()
	arg_28_0.equipDisc_:OnExit()
	arg_28_0:OnInputCancel()
	manager.notify:RemoveListener(INPUT_POP_CLICK_OK, arg_28_0.inputHandler_)
	manager.notify:RemoveListener(INPUT_POP_CLICK_CLOSE, arg_28_0.inputHandler_)
	manager.notify:RemoveListener(INPUT_POP_CLICK_CANCEL, arg_28_0.inputCancelHandler_)
end

function var_0_0.Dispose(arg_29_0)
	arg_29_0:RemoveAllListeners()
	arg_29_0.equipSkillPop_:Dispose()
	arg_29_0.equipOverrall_:Dispose()
	arg_29_0.equipDisc_:Dispose()
	arg_29_0.gridScroll_:Dispose()

	arg_29_0.inputHandler_ = nil
	arg_29_0.inputCancelHandler_ = nil

	var_0_0.super.Dispose(arg_29_0)
end

return var_0_0
