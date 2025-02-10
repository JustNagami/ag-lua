local var_0_0 = class("MimirChipManagerInfoView", ReduxView)

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_1.transform
	arg_1_0.ctrl = arg_1_2

	arg_1_0:InitUI()
end

function var_0_0.InitUI(arg_2_0)
	arg_2_0:BindCfgUI()
	arg_2_0:AddListeners()

	arg_2_0.btnState = arg_2_0.btnControllerexcollection_:GetController("btn")
	arg_2_0.tabControl = arg_2_0.tabControllerexcollection_:GetController("select")
	arg_2_0.chipManagerLockView_ = ChipManagerLockView.New(arg_2_0.lockPanel_)
end

function var_0_0.OnEnter(arg_3_0)
	return
end

function var_0_0.SetTemplateData(arg_4_0, arg_4_1)
	arg_4_0.chipManagerDataTemplate_ = arg_4_1
end

function var_0_0.RefreshData(arg_5_0, arg_5_1)
	arg_5_0.chipManagerID = arg_5_1

	local var_5_0 = ChipCfg[arg_5_0.chipManagerID]

	arg_5_0.chipManagerName_.text = GetI18NText(var_5_0.suit_name)
	arg_5_0.skillText_.text = GetI18NText(var_5_0.desc)

	local var_5_1, var_5_2, var_5_3 = IsConditionAchieved(var_5_0.new_condition)
	local var_5_4 = arg_5_0.chipManagerDataTemplate_:GetChipManagerIsUnLock(arg_5_0.chipManagerID)

	arg_5_0.isUnlock_ = var_5_1

	arg_5_0.chipManagerLockView_:SetChipManagerID(arg_5_0.chipManagerID)
	arg_5_0.chipManagerLockView_:SetActive(not var_5_4)

	if var_5_4 == false then
		if arg_5_0.isUnlock_ then
			arg_5_0.btnState:SetSelectedState("unLock2")
		else
			arg_5_0.btnState:SetSelectedState("unLock1")
		end
	else
		arg_5_0.btnState:SetSelectedState("unlocked")
	end

	if arg_5_0.lastIndex then
		arg_5_0:SelectTab(arg_5_0.lastIndex)
	end
end

function var_0_0.AddListeners(arg_6_0)
	arg_6_0:AddBtnListener(arg_6_0.btn_unlock2Btn_, nil, function()
		if arg_6_0.isUnlock_ then
			ChipAction.UnlockChipManager(arg_6_0.chipManagerID)
		else
			ShowTips("CHIP_MANAGER_UNLOCK_FAILED")
		end
	end)
	arg_6_0:AddBtnListener(arg_6_0.btn_unlock1Btn_, nil, function()
		ShowTips("CHIP_MANAGER_UNLOCK_FAILED")
	end)

	for iter_6_0 = 1, 2 do
		arg_6_0:AddBtnListener(arg_6_0[string.format("btnTab%s_", iter_6_0)], nil, function()
			arg_6_0:SelectTab(iter_6_0)
		end)
	end
end

function var_0_0.SelectTab(arg_10_0, arg_10_1)
	local var_10_0 = ChipCfg[arg_10_0.chipManagerID]

	if arg_10_1 == 1 then
		OperationRecorder.Record("chipManager", "pageDetail")

		arg_10_0.skillText_.text = GetI18NText(var_10_0.desc)
		arg_10_0.lastIndex = arg_10_1
	elseif arg_10_1 == 2 then
		OperationRecorder.Record("chipManager", "pageStory")

		arg_10_0.skillText_.text = GetI18NText(var_10_0.story)
		arg_10_0.lastIndex = arg_10_1
	end

	arg_10_0.tabControl:SetSelectedState(string.format("select%s", arg_10_1))
end

function var_0_0.RemoveListeners(arg_11_0)
	return
end

function var_0_0.Dispose(arg_12_0)
	var_0_0.super.Dispose(arg_12_0)
	arg_12_0:RemoveListeners()

	if arg_12_0.chipManagerLockView_ then
		arg_12_0.chipManagerLockView_:Dispose()

		arg_12_0.chipManagerLockView_ = nil
	end

	if arg_12_0.chipManagerUnlockView_ then
		arg_12_0.chipManagerUnlockView_:Dispose()

		arg_12_0.chipManagerUnlockView_ = nil
	end

	arg_12_0.ctrl = nil
end

return var_0_0
