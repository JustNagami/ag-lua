local var_0_0 = class("GameKeyOperationView", ReduxView)
local var_0_1 = require("cjson")
local var_0_2 = {
	PS = "PS4Layout",
	Keyboard = "KeyboardLayout",
	Xbox = "XboxLayout",
	Other = "OtherLayout"
}
local var_0_3 = {
	MiniGame = 7,
	View = 2,
	System = 6,
	Battle = 4,
	SubJoystick = 3,
	Operation = 5,
	Move = 1,
	None = 0
}

function var_0_0.SetActive(arg_1_0, arg_1_1)
	if arg_1_0.gameObject_ then
		SetActive(arg_1_0.gameObject_, arg_1_1)
	end
end

function var_0_0.OnCtor(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	arg_2_0.gameObject_ = arg_2_2
	arg_2_0.transform_ = arg_2_2.transform
	arg_2_0.settingView_ = arg_2_1
	arg_2_0.params_ = arg_2_3

	arg_2_0:Init()
	arg_2_0:OnEnter()
end

function var_0_0.Init(arg_3_0)
	arg_3_0:InitUI()
	arg_3_0:AddUIListener()

	arg_3_0.keysChangeInfo_ = {}
	arg_3_0.cursorSensitivity = {}
	arg_3_0.remapNotice_ = {}
	arg_3_0.oldRemapNotice_ = {}
end

function var_0_0.InitUI(arg_4_0)
	arg_4_0:BindCfgUI()

	arg_4_0.bindings_ = {}
	arg_4_0.bindings_[var_0_3.Move] = GameKeyBindingContent.New(arg_4_0.moveBindingGo_)
	arg_4_0.bindings_[var_0_3.View] = GameKeyBindingContent.New(arg_4_0.viewBindingGo_)
	arg_4_0.bindings_[var_0_3.SubJoystick] = GameKeyBindingContent.New(arg_4_0.subJoyBindingGo_)
	arg_4_0.bindings_[var_0_3.Battle] = GameKeyBindingContent.New(arg_4_0.battleBindingGo_)
	arg_4_0.bindings_[var_0_3.Operation] = GameKeyBindingContent.New(arg_4_0.operBindingGo_)
	arg_4_0.bindings_[var_0_3.System] = GameKeyBindingContent.New(arg_4_0.sysBindingGo_)
	arg_4_0.bindings_[var_0_3.MiniGame] = GameKeyBindingContent.New(arg_4_0.miniGameBindingGo_)

	for iter_4_0, iter_4_1 in pairs(arg_4_0.bindings_) do
		iter_4_1:SetKeyChangedCallback(function(arg_5_0, arg_5_1, arg_5_2)
			arg_4_0:OnKeyChanged(arg_5_0, arg_5_1, arg_5_2)
		end)
	end

	arg_4_0:RegistEventListener(BATTLE_UI_ADJUSTED, handler(arg_4_0, arg_4_0.RefreshBattleUIName))
	arg_4_0:RegistEventListener(JOYSTICK_TYPE_SELECT, handler(arg_4_0, arg_4_0.OnJoystickTypeSelect))

	arg_4_0.remapToggleCon_ = arg_4_0.remapToggleConEx_:GetController("default0")
	arg_4_0.gamepadToggleCon_ = arg_4_0.gamepadToggleConEx_:GetController("default0")
	arg_4_0.hidTypeCon_ = arg_4_0.controllerEx_:GetController("hidType")
end

function var_0_0.AddUIListener(arg_6_0)
	arg_6_0:AddBtnListener(arg_6_0.keyboardBtn_, nil, function()
		arg_6_0:SwitchToHID(HID_TYPES.Keyboard)
	end)
	arg_6_0:AddBtnListener(arg_6_0.gamepadBtn_, nil, function(arg_8_0)
		local var_8_0 = LuaHidTools.GetPlayerSelectJoystick()

		arg_6_0:SwitchToHID(var_8_0 == 0 and HID_TYPES.Xbox or var_8_0)
	end)
	arg_6_0:AddBtnListener(arg_6_0.gamepadSelBtn_, nil, function(arg_9_0)
		local var_9_0 = LuaHidTools.GetPlayerSelectJoystick()

		LuaHidTools.OpenGamepadSelectWin(var_9_0)
	end)
	arg_6_0:AddToggleListener(arg_6_0.gamepadToggle_, function(arg_10_0)
		arg_6_0.gamepadEnable_ = arg_10_0

		arg_6_0.gamepadToggleCon_:SetSelectedState(arg_10_0 and "on" or "off")
		arg_6_0:RefreshSlider()
		arg_6_0:UpdateBindingVisibility()

		if arg_10_0 then
			arg_6_0:RebuildUILayout()
		else
			arg_6_0.remapNoticeToggle_.isOn = false
		end
	end)
	arg_6_0:AddToggleListener(arg_6_0.remapNoticeToggle_, function(arg_11_0)
		arg_6_0:SetRemapNotice(arg_11_0)
	end)
	arg_6_0:AddBtnListener(arg_6_0.battleUiAdjBtn_, nil, function()
		arg_6_0:Go("battleUIAdjust", {})
	end)
	arg_6_0.cursorSenSlider_.onValueChanged:AddListener(function(arg_13_0)
		arg_6_0.cursorSensitivity[arg_6_0.gamepadType_] = arg_13_0

		local var_13_0 = arg_6_0:GetLayoutName(arg_6_0.gamepadType_)

		LuaForGamepad.SetCursorSensitivity(var_13_0, LuaForGamepad.GetDefaultLayoutFileName(var_13_0), arg_13_0)
	end)
	arg_6_0:AddPressingByTimeListener(arg_6_0.cursorSenSubGo_, 3, 0.5, 0.5, function()
		if arg_6_0.cursorSenSlider_.value > 0 then
			arg_6_0.cursorSenSlider_.value = arg_6_0.cursorSenSlider_.value - 1

			return true
		end

		return false
	end)
	arg_6_0:AddPressingByTimeListener(arg_6_0.cursorSenAddGo_, 3, 0.5, 0.5, function()
		if arg_6_0.cursorSenSlider_.value < 100 then
			arg_6_0.cursorSenSlider_.value = arg_6_0.cursorSenSlider_.value + 1

			return true
		end

		return false
	end)
end

function var_0_0.OnEnter(arg_16_0)
	arg_16_0.keysChangeInfo_ = {}
	arg_16_0.gamepadType_ = LuaForGamepad.GetGamepadType()
	arg_16_0.layoutName_ = arg_16_0:GetLayoutName(arg_16_0.gamepadType_)
	arg_16_0.gamepadEnable_ = arg_16_0:IsJoystickEnable()
	arg_16_0.oldGamepadEnable_ = arg_16_0.gamepadEnable_
	arg_16_0.oldGamepadType_ = arg_16_0.gamepadType_
	arg_16_0.oldLayoutJson_ = LuaForGamepad.GetLayoutJson(arg_16_0.layoutName_, LuaForGamepad.GetDefaultLayoutFileName(arg_16_0.layoutName_))
	arg_16_0.oldCursorSensitivity = {}

	arg_16_0:RefreshHIDToggles()
	arg_16_0:RefreshUI()
end

function var_0_0.OnExit(arg_17_0)
	for iter_17_0, iter_17_1 in pairs(arg_17_0.bindings_) do
		iter_17_1:OnExit()
	end

	arg_17_0:StopRebuildTimer()
end

function var_0_0.Dispose(arg_18_0)
	for iter_18_0, iter_18_1 in pairs(arg_18_0.bindings_) do
		iter_18_1:Dispose()
	end

	var_0_0.super.Dispose(arg_18_0)
end

function var_0_0.RefreshUI(arg_19_0)
	arg_19_0:RefreshBattleUIName()
	arg_19_0:RefreshGamepadName()
	arg_19_0:RefreshRemapNoticeToggle()
end

function var_0_0.RefreshBindingUI(arg_20_0)
	local var_20_0 = LuaForGamepad.GetLayoutControlGroups(arg_20_0.layoutName_)

	arg_20_0.controlGroupsData_ = var_0_1.decode(var_20_0)

	arg_20_0:ApplyTmpChanges()

	for iter_20_0, iter_20_1 in ipairs(arg_20_0.controlGroupsData_.groups) do
		local var_20_1 = ""
		local var_20_2 = arg_20_0.bindings_[iter_20_1.controlType]

		var_20_2:SetData(arg_20_0.layoutName_, var_20_1, iter_20_1, arg_20_0.gamepadType_)
		var_20_2:RefreshUI()
	end

	arg_20_0:RebuildUILayout()
end

function var_0_0.StopRebuildTimer(arg_21_0)
	if arg_21_0.timerRebuild_ then
		arg_21_0.timerRebuild_:Stop()

		arg_21_0.timerRebuild_ = nil
	end
end

function var_0_0.ApplyTmpChanges(arg_22_0)
	if #arg_22_0.keysChangeInfo_ <= 0 then
		return
	end

	local var_22_0 = {}

	for iter_22_0, iter_22_1 in ipairs(arg_22_0.controlGroupsData_.groups) do
		local var_22_1 = {}

		for iter_22_2, iter_22_3 in ipairs(iter_22_1.items) do
			var_22_1[iter_22_3.buttonInt] = iter_22_3
		end

		var_22_0[iter_22_1.controlType] = var_22_1
	end

	for iter_22_4, iter_22_5 in ipairs(arg_22_0.keysChangeInfo_) do
		if iter_22_5.layoutName == arg_22_0.layoutName_ then
			local var_22_2 = var_22_0[iter_22_5.controlType]

			if var_22_2 then
				local var_22_3 = var_22_2[iter_22_5.buttonInt]

				if var_22_3 then
					var_22_3.keyName = iter_22_5.keyName
				end
			end
		end
	end
end

function var_0_0.RebuildUILayout(arg_23_0)
	arg_23_0:StopRebuildTimer()

	arg_23_0.timerData_counter = 0
	arg_23_0.timerRebuild_ = FrameTimer.New(function()
		LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_0.contentTrans_)

		arg_23_0.timerData_counter = arg_23_0.timerData_counter + 1

		if arg_23_0.timerData_counter == 3 then
			arg_23_0:StopRebuildTimer()
		end
	end, 1, 3)

	arg_23_0.timerRebuild_:Start()
end

function var_0_0.RefreshHIDToggles(arg_25_0)
	arg_25_0:SwitchToHID(arg_25_0.gamepadType_)

	arg_25_0.gamepadToggle_.isOn = arg_25_0.gamepadEnable_
end

function var_0_0.RefreshSlider(arg_26_0)
	local var_26_0 = arg_26_0.gamepadType_ == HID_TYPES.Xbox or arg_26_0.gamepadType_ == HID_TYPES.PS4

	SetActive(arg_26_0.cursorSenGo_, var_26_0 and arg_26_0.gamepadEnable_)

	if not var_26_0 then
		return
	end

	if arg_26_0.oldCursorSensitivity[arg_26_0.gamepadType_] == nil then
		local var_26_1 = LuaForGamepad.GetCursorSensitivity(arg_26_0.layoutName_, LuaForGamepad.GetDefaultLayoutFileName(arg_26_0.layoutName_))

		arg_26_0.oldCursorSensitivity[arg_26_0.gamepadType_] = var_26_1
	end

	if arg_26_0.cursorSensitivity[arg_26_0.gamepadType_] == nil then
		arg_26_0.cursorSensitivity[arg_26_0.gamepadType_] = arg_26_0.oldCursorSensitivity[arg_26_0.gamepadType_]
	end

	arg_26_0.cursorSenSlider_.value = arg_26_0.cursorSensitivity[arg_26_0.gamepadType_]
end

function var_0_0.SwitchToHID(arg_27_0, arg_27_1)
	if arg_27_1 == HID_TYPES.Keyboard then
		arg_27_0.hidTypeCon_:SetSelectedState("keyboard")
	elseif arg_27_1 == HID_TYPES.Xbox then
		arg_27_0.hidTypeCon_:SetSelectedState("gamepad")
	elseif arg_27_1 == HID_TYPES.PS4 then
		arg_27_0.hidTypeCon_:SetSelectedState("gamepad")
	else
		arg_27_0.hidTypeCon_:SetSelectedState("none")
	end

	arg_27_0:SetHidType(arg_27_1)
	arg_27_0:RefreshSlider()
	arg_27_0:RefreshRemapNoticeToggle()
	arg_27_0:RefreshBindingUI()
	arg_27_0:UpdateBindingVisibility()
end

function var_0_0.SwitchBindingVisibility(arg_28_0, arg_28_1)
	for iter_28_0, iter_28_1 in pairs(arg_28_0.bindings_) do
		if arg_28_1 then
			local var_28_0 = arg_28_0.controlGroupsData_.groups[iter_28_0]

			SetActive(iter_28_1.gameObject_, var_28_0 and #var_28_0.items > 0)
		else
			SetActive(iter_28_1.gameObject_, false)
		end
	end
end

function var_0_0.UpdateBindingVisibility(arg_29_0)
	local var_29_0 = arg_29_0.gamepadType_

	if var_29_0 == HID_TYPES.Keyboard then
		arg_29_0:SwitchBindingVisibility(true)
		SetActive(arg_29_0.remapNoticeGo_, true)
	elseif var_29_0 == HID_TYPES.Xbox then
		arg_29_0:SwitchBindingVisibility(arg_29_0.gamepadEnable_)
		SetActive(arg_29_0.gamepadGo_, arg_29_0.gamepadEnable_)
		SetActive(arg_29_0.remapNoticeGo_, arg_29_0.gamepadEnable_)
	elseif var_29_0 == HID_TYPES.PS4 then
		arg_29_0:SwitchBindingVisibility(arg_29_0.gamepadEnable_)
		SetActive(arg_29_0.gamepadGo_, arg_29_0.gamepadEnable_)
		SetActive(arg_29_0.remapNoticeGo_, arg_29_0.gamepadEnable_)
	else
		arg_29_0:SwitchBindingVisibility(false)
	end
end

function var_0_0.OnKeyChanged(arg_30_0, arg_30_1, arg_30_2, arg_30_3)
	local var_30_0 = true

	for iter_30_0, iter_30_1 in ipairs(arg_30_0.controlGroupsData_.groups) do
		if iter_30_1.conflictGroup == arg_30_3.conflictGroup then
			for iter_30_2, iter_30_3 in ipairs(iter_30_1.items) do
				if iter_30_3.keyName == arg_30_3.keyName and iter_30_3.buttonInt ~= arg_30_3.buttonInt then
					var_30_0 = false

					if LuaHidTools.IsOpNotAllow(arg_30_0.gamepadType_, iter_30_3.buttonName) then
						local var_30_1 = GetTipsF("INPUT_KEY_NOT_ALLOW", GetKeyCodeMappedName(arg_30_3.keyName))

						ShowTips(var_30_1)
						arg_30_2:StartListeningNewKey()

						return
					end

					local function var_30_2(arg_31_0)
						if not arg_31_0 then
							arg_30_2:StartListeningNewKey()

							return
						end

						arg_30_0:AddKeyChangeInfo({
							conflictGroup = iter_30_1.conflictGroup,
							controlType = iter_30_1.controlType,
							layoutName = arg_30_0.layoutName_,
							buttonInt = iter_30_3.buttonInt,
							key = arg_30_3.oldKey,
							keyName = arg_30_3.oldKeyName
						})
						arg_30_0:AddKeyChangeInfo(arg_30_3)
						arg_30_0:RefreshBindingUI()
					end

					JumpTools.Back()
					arg_30_0:Go("gameKeyConflict", {
						listenCallback = var_30_2,
						opName = arg_30_3.buttonName,
						conflictOpName = iter_30_3.buttonName,
						key = arg_30_3.key,
						keyName = arg_30_3.keyName,
						gamepadType = arg_30_0.gamepadType_
					})

					return
				end
			end
		end
	end

	if var_30_0 then
		arg_30_0:AddKeyChangeInfo(arg_30_3)
		arg_30_0:RefreshBindingUI()
	end

	JumpTools.Back()
end

function var_0_0.AddKeyChangeInfo(arg_32_0, arg_32_1)
	arg_32_0:RemoveChangesIf(function(arg_33_0)
		return arg_33_0.conflictGroup == arg_32_1.conflictGroup and arg_33_0.buttonInt == arg_32_1.buttonInt
	end)
	table.insert(arg_32_0.keysChangeInfo_, arg_32_1)
end

function var_0_0.RemoveChangesIf(arg_34_0, arg_34_1)
	local var_34_0 = {}

	for iter_34_0, iter_34_1 in ipairs(arg_34_0.keysChangeInfo_) do
		if arg_34_1(iter_34_1) then
			table.insert(var_34_0, iter_34_1)
		end
	end

	for iter_34_2, iter_34_3 in ipairs(var_34_0) do
		table.removebyvalue(arg_34_0.keysChangeInfo_, iter_34_3)
	end
end

function var_0_0.SaveData(arg_35_0)
	for iter_35_0, iter_35_1 in ipairs(arg_35_0.keysChangeInfo_) do
		LuaForGamepad.SetLayoutItem(iter_35_1.layoutName, LuaForGamepad.GetDefaultLayoutFileName(iter_35_1.layoutName), iter_35_1.buttonInt, iter_35_1.key)
	end

	for iter_35_2, iter_35_3 in pairs(arg_35_0.cursorSensitivity) do
		local var_35_0 = arg_35_0:GetLayoutName(iter_35_2)

		LuaForGamepad.SetCursorSensitivity(var_35_0, LuaForGamepad.GetDefaultLayoutFileName(var_35_0), iter_35_3)
	end

	arg_35_0:SendSDK()
	LuaForGamepad.ReloadLayout()

	arg_35_0.keysChangeInfo_ = {}

	local var_35_1 = arg_35_0:GetRemapNotice()

	arg_35_0.oldGamepadType_ = arg_35_0.gamepadType_
	arg_35_0.oldLayoutJson_ = LuaForGamepad.GetLayoutJson(arg_35_0.layoutName_, LuaForGamepad.GetDefaultLayoutFileName(arg_35_0.layoutName_))

	LuaForGamepad.SetDeviceEnable(HID_TYPES.Xbox, arg_35_0.gamepadEnable_)
	LuaForGamepad.SetDeviceEnable(HID_TYPES.PS4, arg_35_0.gamepadEnable_)

	arg_35_0.oldGamepadEnable_ = arg_35_0.gamepadEnable_
	arg_35_0.cursorSensitivity = {}
	arg_35_0.oldCursorSensitivity = {}

	arg_35_0:RefreshHIDToggles()

	for iter_35_4, iter_35_5 in pairs(arg_35_0.remapNotice_) do
		LuaHidTools.SetRemapNotice(iter_35_4, iter_35_5)
	end

	arg_35_0.remapNotice_ = {}
	arg_35_0.oldRemapNotice_ = {}
	arg_35_0.remapNoticeToggle_.isOn = var_35_1

	arg_35_0:NotifyKeyChange()
end

function var_0_0.RecoverTmpData(arg_36_0)
	for iter_36_0, iter_36_1 in pairs(arg_36_0.oldCursorSensitivity) do
		local var_36_0 = arg_36_0:GetLayoutName(iter_36_0)

		LuaForGamepad.SetCursorSensitivity(var_36_0, LuaForGamepad.GetDefaultLayoutFileName(var_36_0), iter_36_1)
	end

	arg_36_0.keysChangeInfo_ = {}
	arg_36_0.gamepadType_ = arg_36_0.oldGamepadType_
	arg_36_0.layoutName_ = arg_36_0:GetLayoutName(arg_36_0.gamepadType_)
	arg_36_0.gamepadEnable_ = arg_36_0.oldGamepadEnable_
	arg_36_0.cursorSensitivity = {}

	arg_36_0:RefreshHIDToggles()

	for iter_36_2, iter_36_3 in pairs(arg_36_0.oldRemapNotice_) do
		LuaHidTools.SetRemapNotice(iter_36_2, iter_36_3)
	end

	arg_36_0.remapNotice_ = {}
	arg_36_0.oldRemapNotice_ = {}

	arg_36_0:RefreshRemapNoticeToggle()
end

function var_0_0.ResetDefaultData(arg_37_0)
	LuaForGamepad.DeleteLayoutJson(arg_37_0.layoutName_)
	LuaForGamepad.ReloadLayout()
	LuaForGamepad.SetDeviceEnable(HID_TYPES.Xbox, true)
	LuaForGamepad.SetDeviceEnable(HID_TYPES.PS4, true)

	arg_37_0.gamepadToggle_.isOn = true
	arg_37_0.keysChangeInfo_ = {}
	arg_37_0.cursorSensitivity = {}
	arg_37_0.oldCursorSensitivity = {}

	arg_37_0:RefreshSlider()
	arg_37_0:RefreshBindingUI()

	arg_37_0.remapNotice_ = {}
	arg_37_0.oldRemapNotice_ = {}

	LuaHidTools.ResetRemapNotice()
	arg_37_0:RefreshRemapNoticeToggle()
	arg_37_0:NotifyKeyChange()
end

function var_0_0.CheckDataChange(arg_38_0)
	local var_38_0 = arg_38_0.cursorSensitivity[HID_TYPES.Xbox] ~= arg_38_0.oldCursorSensitivity[HID_TYPES.Xbox] or arg_38_0.cursorSensitivity[HID_TYPES.PS4] ~= arg_38_0.oldCursorSensitivity[HID_TYPES.PS4]
	local var_38_1 = arg_38_0.remapNotice_[HID_TYPES.Keyboard] ~= arg_38_0.oldRemapNotice_[HID_TYPES.Keyboard] or arg_38_0.remapNotice_[HID_TYPES.Xbox] ~= arg_38_0.oldRemapNotice_[HID_TYPES.Xbox] or arg_38_0.remapNotice_[HID_TYPES.PS4] ~= arg_38_0.oldRemapNotice_[HID_TYPES.PS4]

	return #arg_38_0.keysChangeInfo_ > 0 or arg_38_0.gamepadEnable_ ~= arg_38_0.oldGamepadEnable_ or var_38_1 or var_38_0
end

function var_0_0.SetRemapNotice(arg_39_0, arg_39_1)
	arg_39_0.remapToggleCon_:SetSelectedState(arg_39_1 and "on" or "off")

	if arg_39_0.gamepadType_ == HID_TYPES.Xbox or arg_39_0.gamepadType_ == HID_TYPES.PS4 then
		arg_39_0.remapNotice_[HID_TYPES.Xbox] = arg_39_1
		arg_39_0.remapNotice_[HID_TYPES.PS4] = arg_39_1

		LuaHidTools.SetRemapNotice(HID_TYPES.Xbox, arg_39_1)
		LuaHidTools.SetRemapNotice(HID_TYPES.PS4, arg_39_1)
	else
		LuaHidTools.SetRemapNotice(arg_39_0.gamepadType_, arg_39_1)

		arg_39_0.remapNotice_[arg_39_0.gamepadType_] = arg_39_1
	end
end

function var_0_0.GetRemapNotice(arg_40_0)
	local var_40_0 = LuaHidTools.GetRemapNotice(arg_40_0.gamepadType_)

	if arg_40_0.oldRemapNotice_[arg_40_0.gamepadType_] == nil then
		if arg_40_0.gamepadType_ == HID_TYPES.Xbox or arg_40_0.gamepadType_ == HID_TYPES.PS4 then
			arg_40_0.oldRemapNotice_[HID_TYPES.Xbox] = var_40_0
			arg_40_0.oldRemapNotice_[HID_TYPES.PS4] = var_40_0
		else
			arg_40_0.oldRemapNotice_[arg_40_0.gamepadType_] = var_40_0
		end
	end

	return var_40_0
end

function var_0_0.RefreshRemapNoticeToggle(arg_41_0)
	arg_41_0.remapNoticeToggle_.isOn = arg_41_0:GetRemapNotice()
end

function var_0_0.IsJoystickEnable(arg_42_0)
	local var_42_0 = LuaHidTools.GetPlayerSelectJoystick()

	return LuaForGamepad.IsDeviceEnable(var_42_0)
end

function var_0_0.NotifyKeyChange(arg_43_0)
	if not arg_43_0.remapNoticeToggle_.isOn then
		return
	end

	LuaHidTools.SetRemapNotice(arg_43_0.gamepadType_, false)
	FrameTimer.New(function()
		LuaHidTools.SetRemapNotice(arg_43_0.gamepadType_, true)
	end, 1, 1):Start()
end

function var_0_0.RefreshBattleUIName(arg_45_0)
	local var_45_0 = ""
	local var_45_1 = SettingData:GetBattleUISettingData()

	if var_45_1.battle_ui_cur_type == var_45_1.battle_ui_type_0 then
		var_45_0 = GetTips("BATTLE_UI_DEFAULT_PRESET")
	elseif var_45_1.battle_ui_cur_type == var_45_1.battle_ui_type_1 then
		var_45_0 = string.format(GetTips("BATTLE_UI_SCHEME_INDEX"), 1)
	elseif var_45_1.battle_ui_cur_type == var_45_1.battle_ui_type_2 then
		var_45_0 = string.format(GetTips("BATTLE_UI_SCHEME_INDEX"), 2)
	elseif var_45_1.battle_ui_cur_type == var_45_1.battle_ui_type_3 then
		var_45_0 = string.format(GetTips("BATTLE_UI_SCHEME_INDEX"), 3)
	else
		var_45_0 = GetTips("BATTLE_UI_DEFAULT_PRESET")
	end

	arg_45_0.battleUiText_.text = var_45_0
end

function var_0_0.RefreshGamepadName(arg_46_0)
	local var_46_0 = LuaHidTools.GetPlayerSelectJoystick() == HID_TYPES.Xbox and 2 or 1

	arg_46_0.gamepadSelText_.text = GetTips("GAMEPAD_ICON_PATTERN_" .. var_46_0)
end

function var_0_0.OnJoystickTypeSelect(arg_47_0, arg_47_1)
	arg_47_0:RefreshGamepadName()
	arg_47_0:SwitchToHID(arg_47_1)
end

function var_0_0.SetHidType(arg_48_0, arg_48_1)
	arg_48_0.gamepadType_ = arg_48_1
	arg_48_0.layoutName_ = arg_48_0:GetLayoutName(arg_48_0.gamepadType_)
end

function var_0_0.GetLayoutName(arg_49_0, arg_49_1)
	if arg_49_1 == HID_TYPES.Keyboard then
		return var_0_2.Keyboard
	elseif arg_49_1 == HID_TYPES.Xbox then
		return var_0_2.Xbox
	elseif arg_49_1 == HID_TYPES.PS4 then
		return var_0_2.PS
	else
		return var_0_2.Other
	end
end

function var_0_0.SendSDK(arg_50_0)
	local var_50_0 = {}

	for iter_50_0, iter_50_1 in ipairs(arg_50_0.keysChangeInfo_) do
		local var_50_1 = var_50_0[iter_50_1.layoutName]

		if not var_50_1 then
			var_50_1 = {}
			var_50_0[iter_50_1.layoutName] = var_50_1
		end

		table.insert(var_50_1, {
			buttonType = tostring(iter_50_1.buttonInt),
			value = iter_50_1.key
		})
	end

	local var_50_2 = {
		HID_TYPES.Keyboard,
		HID_TYPES.Xbox,
		HID_TYPES.PS4
	}

	for iter_50_2, iter_50_3 in ipairs(var_50_2) do
		local var_50_3 = var_50_0[arg_50_0:GetLayoutName(iter_50_3)]

		if var_50_3 then
			SDKTools.SendMessageToSDK("keymap_setting", {
				type = iter_50_3,
				other_arrayobject = var_50_3
			})
		end
	end
end

return var_0_0
