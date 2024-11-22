local var_0_0 = class("GameKeyOperationView", ReduxView)
local var_0_1 = require("cjson")
local var_0_2 = {
	KeyMouse = "KeyMouseLayout",
	Keyboard = "KeyboardLayout",
	Other = "OtherLayout",
	PS = "PS4Layout",
	Xbox = "XboxLayout"
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

	arg_3_0:InitDropdownData()
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
	arg_4_0.autoHideToggleCon_ = arg_4_0.autoHideToggleConEx_:GetController("default0")
	arg_4_0.hidTypeCon_ = arg_4_0.controllerEx_:GetController("hidType")
end

function var_0_0.AddUIListener(arg_6_0)
	arg_6_0:AddBtnListener(arg_6_0.keyboardBtn_, nil, function()
		local var_7_0 = LuaHidTools.GetPlayerSelectKeyboard()

		arg_6_0:SwitchToHID(var_7_0 == 0 and HID_TYPES.KeyMouse or var_7_0)
	end)
	arg_6_0:AddBtnListener(arg_6_0.gamepadBtn_, nil, function(arg_8_0)
		local var_8_0 = LuaHidTools.GetPlayerSelectJoystick()

		arg_6_0:SwitchToHID(var_8_0 == 0 and HID_TYPES.Xbox or var_8_0)
	end)
	arg_6_0:AddBtnListener(arg_6_0.gamepadSelBtn_, nil, function(arg_9_0)
		local var_9_0 = LuaHidTools.GetPlayerSelectJoystick()

		LuaHidTools.OpenGamepadSelectWin(var_9_0)
	end)
	arg_6_0:AddToggleListener(arg_6_0.keyboardDropdown_, function(arg_10_0)
		arg_6_0:SwitchToHID(arg_10_0 == 0 and HID_TYPES.Keyboard or HID_TYPES.KeyMouse)
		LuaHidTools.SetPlayerSelectKeyboard(arg_6_0.gamepadType_)
		arg_6_0:RefreshControlTypeName()
	end)
	arg_6_0:AddToggleListener(arg_6_0.gamepadToggle_, function(arg_11_0)
		arg_6_0.gamepadEnable_ = arg_11_0

		arg_6_0.gamepadToggleCon_:SetSelectedState(arg_11_0 and "on" or "off")
		arg_6_0:RefreshSlider()
		arg_6_0:UpdateBindingVisibility()

		if arg_11_0 then
			arg_6_0:RebuildUILayout()
		else
			arg_6_0.remapNoticeToggle_.isOn = false
		end
	end)
	arg_6_0:AddToggleListener(arg_6_0.remapNoticeToggle_, function(arg_12_0)
		arg_6_0:SetRemapNotice(arg_12_0)
	end)
	arg_6_0:AddToggleListener(arg_6_0.autoHideToggle_, function(arg_13_0)
		LuaForCursor.SetKeyboardAutoHide(arg_13_0)
		arg_6_0.autoHideToggleCon_:SetSelectedState(arg_13_0 and "on" or "off")
		arg_6_0:RefreshHIDToggles()
	end)
	arg_6_0:AddBtnListener(arg_6_0.battleUiAdjBtn_, nil, function()
		arg_6_0:Go("battleUIAdjust", {})
	end)
	arg_6_0.cursorSenSlider_.onValueChanged:AddListener(function(arg_15_0)
		arg_6_0.cursorSensitivity[arg_6_0.gamepadType_] = arg_15_0

		local var_15_0 = arg_6_0:GetLayoutName(arg_6_0.gamepadType_)

		LuaForGamepad.SetCursorSensitivity(var_15_0, LuaForGamepad.GetDefaultLayoutFileName(var_15_0), arg_15_0)
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

function var_0_0.OnEnter(arg_18_0)
	arg_18_0.keysChangeInfo_ = {}
	arg_18_0.gamepadType_ = LuaForGamepad.GetGamepadType()

	if arg_18_0.gamepadType_ == HID_TYPES.None then
		arg_18_0.gamepadType_ = HID_TYPES.Keyboard
	end

	arg_18_0.layoutName_ = arg_18_0:GetLayoutName(arg_18_0.gamepadType_)
	arg_18_0.gamepadEnable_ = arg_18_0:IsJoystickEnable()
	arg_18_0.oldGamepadEnable_ = arg_18_0.gamepadEnable_
	arg_18_0.oldGamepadType_ = arg_18_0.gamepadType_
	arg_18_0.oldLayoutJson_ = LuaForGamepad.GetLayoutJson(arg_18_0.layoutName_, LuaForGamepad.GetDefaultLayoutFileName(arg_18_0.layoutName_))
	arg_18_0.oldCursorSensitivity = {}

	arg_18_0:RefreshHIDToggles()
	arg_18_0:RefreshUI()
end

function var_0_0.InitDropdownData(arg_19_0)
	arg_19_0.keyboardDropdown_.options:Clear()

	local var_19_0 = {
		"KEYBOARD_CONTROL_MODE_1",
		"KEYBOARD_CONTROL_MODE_2"
	}

	for iter_19_0, iter_19_1 in ipairs(var_19_0) do
		arg_19_0.keyboardDropdown_.options:Add(UnityEngine.UI.Dropdown.OptionData.New(GetTips(iter_19_1), nil))
	end

	arg_19_0.keyboardDropdown_:RefreshShownValue()

	local var_19_1 = LuaHidTools.GetPlayerSelectKeyboard()

	arg_19_0.keyboardDropdown_.value = (var_19_1 == HID_TYPES.Keyboard and 1 or 2) - 1
end

function var_0_0.OnExit(arg_20_0)
	for iter_20_0, iter_20_1 in pairs(arg_20_0.bindings_) do
		iter_20_1:OnExit()
	end

	arg_20_0:StopRebuildTimer()
end

function var_0_0.Dispose(arg_21_0)
	for iter_21_0, iter_21_1 in pairs(arg_21_0.bindings_) do
		iter_21_1:Dispose()
	end

	var_0_0.super.Dispose(arg_21_0)
end

function var_0_0.RefreshUI(arg_22_0)
	arg_22_0:RefreshBattleUIName()
	arg_22_0:RefreshControlTypeName()
	arg_22_0:RefreshRemapNoticeToggle()
end

function var_0_0.RefreshBindingUI(arg_23_0)
	local var_23_0 = LuaForGamepad.GetLayoutControlGroups(arg_23_0.layoutName_)

	arg_23_0.controlGroupsData_ = var_0_1.decode(var_23_0)

	arg_23_0:ApplyTmpChanges()

	for iter_23_0, iter_23_1 in ipairs(arg_23_0.controlGroupsData_.groups) do
		local var_23_1 = ""
		local var_23_2 = arg_23_0.bindings_[iter_23_1.controlType]

		var_23_2:SetData(arg_23_0.layoutName_, var_23_1, iter_23_1, arg_23_0.gamepadType_)
		var_23_2:RefreshUI()
	end

	arg_23_0:RebuildUILayout()
end

function var_0_0.StopRebuildTimer(arg_24_0)
	if arg_24_0.timerRebuild_ then
		arg_24_0.timerRebuild_:Stop()

		arg_24_0.timerRebuild_ = nil
	end
end

function var_0_0.ApplyTmpChanges(arg_25_0)
	if #arg_25_0.keysChangeInfo_ <= 0 then
		return
	end

	local var_25_0 = {}

	for iter_25_0, iter_25_1 in ipairs(arg_25_0.controlGroupsData_.groups) do
		local var_25_1 = {}

		for iter_25_2, iter_25_3 in ipairs(iter_25_1.items) do
			var_25_1[iter_25_3.buttonInt] = iter_25_3
		end

		var_25_0[iter_25_1.controlType] = var_25_1
	end

	for iter_25_4, iter_25_5 in ipairs(arg_25_0.keysChangeInfo_) do
		if iter_25_5.layoutName == arg_25_0.layoutName_ then
			local var_25_2 = var_25_0[iter_25_5.controlType]

			if var_25_2 then
				local var_25_3 = var_25_2[iter_25_5.buttonInt]

				if var_25_3 then
					var_25_3.keyName = iter_25_5.keyName
				end
			end
		end
	end
end

function var_0_0.RebuildUILayout(arg_26_0)
	arg_26_0:StopRebuildTimer()

	arg_26_0.timerData_counter = 0
	arg_26_0.timerRebuild_ = FrameTimer.New(function()
		LayoutRebuilder.ForceRebuildLayoutImmediate(arg_26_0.contentTrans_)

		arg_26_0.timerData_counter = arg_26_0.timerData_counter + 1

		if arg_26_0.timerData_counter == 3 then
			arg_26_0:StopRebuildTimer()
		end
	end, 1, 3)

	arg_26_0.timerRebuild_:Start()
end

function var_0_0.RefreshHIDToggles(arg_28_0)
	arg_28_0:SwitchToHID(arg_28_0.gamepadType_)

	arg_28_0.gamepadToggle_.isOn = arg_28_0.gamepadEnable_
	arg_28_0.autoHideToggle_.isOn = LuaForCursor.GetKeyboardAutoHide()
end

function var_0_0.RefreshSlider(arg_29_0)
	local var_29_0 = arg_29_0.gamepadType_ == HID_TYPES.Xbox or arg_29_0.gamepadType_ == HID_TYPES.PS4

	SetActive(arg_29_0.cursorSenGo_, var_29_0 and arg_29_0.gamepadEnable_)

	if not var_29_0 then
		return
	end

	if arg_29_0.oldCursorSensitivity[arg_29_0.gamepadType_] == nil then
		local var_29_1 = LuaForGamepad.GetCursorSensitivity(arg_29_0.layoutName_, LuaForGamepad.GetDefaultLayoutFileName(arg_29_0.layoutName_))

		arg_29_0.oldCursorSensitivity[arg_29_0.gamepadType_] = var_29_1
	end

	if arg_29_0.cursorSensitivity[arg_29_0.gamepadType_] == nil then
		arg_29_0.cursorSensitivity[arg_29_0.gamepadType_] = arg_29_0.oldCursorSensitivity[arg_29_0.gamepadType_]
	end

	arg_29_0.cursorSenSlider_.value = arg_29_0.cursorSensitivity[arg_29_0.gamepadType_]
end

function var_0_0.SwitchToHID(arg_30_0, arg_30_1)
	if arg_30_1 == HID_TYPES.Keyboard or arg_30_1 == HID_TYPES.KeyMouse then
		local var_30_0 = GameToSDK.IsEditorOrPcPlatform()

		arg_30_0.hidTypeCon_:SetSelectedState(var_30_0 and "keyboard" or "keyboard_mobile")
	elseif arg_30_1 == HID_TYPES.Xbox or arg_30_1 == HID_TYPES.PS4 then
		arg_30_0.hidTypeCon_:SetSelectedState("gamepad")
	else
		arg_30_0.hidTypeCon_:SetSelectedState("none")
	end

	arg_30_0:SetHidType(arg_30_1)
	arg_30_0:RefreshSlider()
	arg_30_0:RefreshRemapNoticeToggle()
	arg_30_0:RefreshBindingUI()
	arg_30_0:UpdateBindingVisibility()
end

function var_0_0.SwitchBindingVisibility(arg_31_0, arg_31_1)
	for iter_31_0, iter_31_1 in pairs(arg_31_0.bindings_) do
		if arg_31_1 then
			local var_31_0 = arg_31_0.controlGroupsData_.groups[iter_31_0]

			SetActive(iter_31_1.gameObject_, var_31_0 and #var_31_0.items > 0)
		else
			SetActive(iter_31_1.gameObject_, false)
		end
	end
end

function var_0_0.UpdateBindingVisibility(arg_32_0)
	local var_32_0 = arg_32_0.gamepadType_

	SetActive(arg_32_0.autoHideGo_, var_32_0 == HID_TYPES.Keyboard)

	if var_32_0 == HID_TYPES.Keyboard or var_32_0 == HID_TYPES.KeyMouse then
		arg_32_0:SwitchBindingVisibility(true)
		SetActive(arg_32_0.remapNoticeGo_, true)
	elseif var_32_0 == HID_TYPES.Xbox or var_32_0 == HID_TYPES.PS4 then
		arg_32_0:SwitchBindingVisibility(arg_32_0.gamepadEnable_)
		SetActive(arg_32_0.gamepadGo_, arg_32_0.gamepadEnable_)
		SetActive(arg_32_0.remapNoticeGo_, arg_32_0.gamepadEnable_)
	else
		arg_32_0:SwitchBindingVisibility(false)
	end
end

function var_0_0.OnKeyChanged(arg_33_0, arg_33_1, arg_33_2, arg_33_3)
	local var_33_0 = true

	for iter_33_0, iter_33_1 in ipairs(arg_33_0.controlGroupsData_.groups) do
		if iter_33_1.conflictGroup == arg_33_3.conflictGroup then
			for iter_33_2, iter_33_3 in ipairs(iter_33_1.items) do
				if iter_33_3.keyName == arg_33_3.keyName and iter_33_3.buttonInt ~= arg_33_3.buttonInt then
					var_33_0 = false

					if LuaHidTools.IsOpNotAllow(arg_33_0.gamepadType_, iter_33_3.buttonName) then
						local var_33_1 = GetTipsF("INPUT_KEY_NOT_ALLOW", GetKeyCodeMappedName(arg_33_3.keyName))

						ShowTips(var_33_1)
						arg_33_2:StartListeningNewKey()

						return
					end

					local function var_33_2(arg_34_0)
						if not arg_34_0 then
							arg_33_2:StartListeningNewKey()

							return
						end

						arg_33_0:AddKeyChangeInfo({
							conflictGroup = iter_33_1.conflictGroup,
							controlType = iter_33_1.controlType,
							layoutName = arg_33_0.layoutName_,
							buttonInt = iter_33_3.buttonInt,
							key = arg_33_3.oldKey,
							keyName = arg_33_3.oldKeyName
						})
						arg_33_0:AddKeyChangeInfo(arg_33_3)
						arg_33_0:RefreshBindingUI()
					end

					JumpTools.Back()
					arg_33_0:Go("gameKeyConflict", {
						listenCallback = var_33_2,
						opName = arg_33_3.buttonName,
						conflictOpName = iter_33_3.buttonName,
						key = arg_33_3.key,
						keyName = arg_33_3.keyName,
						gamepadType = arg_33_0.gamepadType_
					})

					return
				end
			end
		end
	end

	if var_33_0 then
		arg_33_0:AddKeyChangeInfo(arg_33_3)
		arg_33_0:RefreshBindingUI()
	end

	JumpTools.Back()
end

function var_0_0.AddKeyChangeInfo(arg_35_0, arg_35_1)
	arg_35_0:RemoveChangesIf(function(arg_36_0)
		return arg_36_0.conflictGroup == arg_35_1.conflictGroup and arg_36_0.buttonInt == arg_35_1.buttonInt
	end)
	table.insert(arg_35_0.keysChangeInfo_, arg_35_1)
end

function var_0_0.RemoveChangesIf(arg_37_0, arg_37_1)
	local var_37_0 = {}

	for iter_37_0, iter_37_1 in ipairs(arg_37_0.keysChangeInfo_) do
		if arg_37_1(iter_37_1) then
			table.insert(var_37_0, iter_37_1)
		end
	end

	for iter_37_2, iter_37_3 in ipairs(var_37_0) do
		table.removebyvalue(arg_37_0.keysChangeInfo_, iter_37_3)
	end
end

function var_0_0.SaveData(arg_38_0)
	for iter_38_0, iter_38_1 in ipairs(arg_38_0.keysChangeInfo_) do
		LuaForGamepad.SetLayoutItem(iter_38_1.layoutName, LuaForGamepad.GetDefaultLayoutFileName(iter_38_1.layoutName), iter_38_1.buttonInt, iter_38_1.key)
	end

	for iter_38_2, iter_38_3 in pairs(arg_38_0.cursorSensitivity) do
		local var_38_0 = arg_38_0:GetLayoutName(iter_38_2)

		LuaForGamepad.SetCursorSensitivity(var_38_0, LuaForGamepad.GetDefaultLayoutFileName(var_38_0), iter_38_3)
	end

	arg_38_0:SendSDK()
	LuaForGamepad.ReloadLayout()

	arg_38_0.keysChangeInfo_ = {}

	local var_38_1 = arg_38_0:GetRemapNotice()

	arg_38_0.oldGamepadType_ = arg_38_0.gamepadType_
	arg_38_0.oldLayoutJson_ = LuaForGamepad.GetLayoutJson(arg_38_0.layoutName_, LuaForGamepad.GetDefaultLayoutFileName(arg_38_0.layoutName_))

	LuaForGamepad.SetDeviceEnable(HID_TYPES.Xbox, arg_38_0.gamepadEnable_)
	LuaForGamepad.SetDeviceEnable(HID_TYPES.PS4, arg_38_0.gamepadEnable_)

	arg_38_0.oldGamepadEnable_ = arg_38_0.gamepadEnable_
	arg_38_0.cursorSensitivity = {}
	arg_38_0.oldCursorSensitivity = {}

	arg_38_0:RefreshHIDToggles()

	for iter_38_4, iter_38_5 in pairs(arg_38_0.remapNotice_) do
		LuaHidTools.SetRemapNotice(iter_38_4, iter_38_5)
	end

	arg_38_0.remapNotice_ = {}
	arg_38_0.oldRemapNotice_ = {}
	arg_38_0.remapNoticeToggle_.isOn = var_38_1

	arg_38_0:NotifyKeyChange()
end

function var_0_0.RecoverTmpData(arg_39_0)
	for iter_39_0, iter_39_1 in pairs(arg_39_0.oldCursorSensitivity) do
		local var_39_0 = arg_39_0:GetLayoutName(iter_39_0)

		LuaForGamepad.SetCursorSensitivity(var_39_0, LuaForGamepad.GetDefaultLayoutFileName(var_39_0), iter_39_1)
	end

	arg_39_0.keysChangeInfo_ = {}
	arg_39_0.gamepadType_ = arg_39_0.oldGamepadType_
	arg_39_0.layoutName_ = arg_39_0:GetLayoutName(arg_39_0.gamepadType_)
	arg_39_0.gamepadEnable_ = arg_39_0.oldGamepadEnable_
	arg_39_0.cursorSensitivity = {}

	arg_39_0:RefreshHIDToggles()

	for iter_39_2, iter_39_3 in pairs(arg_39_0.oldRemapNotice_) do
		LuaHidTools.SetRemapNotice(iter_39_2, iter_39_3)
	end

	arg_39_0.remapNotice_ = {}
	arg_39_0.oldRemapNotice_ = {}

	arg_39_0:RefreshRemapNoticeToggle()
end

function var_0_0.ResetDefaultData(arg_40_0)
	LuaForGamepad.DeleteLayoutJson(arg_40_0.layoutName_)
	LuaForGamepad.ReloadLayout()
	LuaForGamepad.SetDeviceEnable(HID_TYPES.Xbox, true)
	LuaForGamepad.SetDeviceEnable(HID_TYPES.PS4, true)

	arg_40_0.gamepadToggle_.isOn = true
	arg_40_0.keysChangeInfo_ = {}
	arg_40_0.cursorSensitivity = {}
	arg_40_0.oldCursorSensitivity = {}

	arg_40_0:RefreshSlider()
	arg_40_0:RefreshBindingUI()

	arg_40_0.remapNotice_ = {}
	arg_40_0.oldRemapNotice_ = {}

	LuaHidTools.ResetRemapNotice()
	arg_40_0:RefreshRemapNoticeToggle()
	arg_40_0:NotifyKeyChange()
end

function var_0_0.CheckDataChange(arg_41_0)
	local var_41_0 = arg_41_0.cursorSensitivity[HID_TYPES.Xbox] ~= arg_41_0.oldCursorSensitivity[HID_TYPES.Xbox] or arg_41_0.cursorSensitivity[HID_TYPES.PS4] ~= arg_41_0.oldCursorSensitivity[HID_TYPES.PS4]
	local var_41_1 = arg_41_0.remapNotice_[HID_TYPES.Keyboard] ~= arg_41_0.oldRemapNotice_[HID_TYPES.Keyboard] or arg_41_0.remapNotice_[HID_TYPES.KeyMouse] ~= arg_41_0.oldRemapNotice_[HID_TYPES.KeyMouse] or arg_41_0.remapNotice_[HID_TYPES.Xbox] ~= arg_41_0.oldRemapNotice_[HID_TYPES.Xbox] or arg_41_0.remapNotice_[HID_TYPES.PS4] ~= arg_41_0.oldRemapNotice_[HID_TYPES.PS4]

	return #arg_41_0.keysChangeInfo_ > 0 or arg_41_0.gamepadEnable_ ~= arg_41_0.oldGamepadEnable_ or var_41_1 or var_41_0
end

function var_0_0.SetRemapNotice(arg_42_0, arg_42_1)
	arg_42_0.remapToggleCon_:SetSelectedState(arg_42_1 and "on" or "off")

	if arg_42_0.gamepadType_ == HID_TYPES.Xbox or arg_42_0.gamepadType_ == HID_TYPES.PS4 then
		arg_42_0.remapNotice_[HID_TYPES.Xbox] = arg_42_1
		arg_42_0.remapNotice_[HID_TYPES.PS4] = arg_42_1

		LuaHidTools.SetRemapNotice(HID_TYPES.Xbox, arg_42_1)
		LuaHidTools.SetRemapNotice(HID_TYPES.PS4, arg_42_1)
	elseif arg_42_0.gamepadType_ == HID_TYPES.Keyboard or arg_42_0.gamepadType_ == HID_TYPES.KeyMouse then
		arg_42_0.remapNotice_[HID_TYPES.Keyboard] = arg_42_1
		arg_42_0.remapNotice_[HID_TYPES.KeyMouse] = arg_42_1

		LuaHidTools.SetRemapNotice(HID_TYPES.Keyboard, arg_42_1)
		LuaHidTools.SetRemapNotice(HID_TYPES.KeyMouse, arg_42_1)
	end
end

function var_0_0.GetRemapNotice(arg_43_0)
	local var_43_0 = LuaHidTools.GetRemapNotice(arg_43_0.gamepadType_)

	if arg_43_0.oldRemapNotice_[arg_43_0.gamepadType_] == nil then
		if arg_43_0.gamepadType_ == HID_TYPES.Xbox or arg_43_0.gamepadType_ == HID_TYPES.PS4 then
			arg_43_0.oldRemapNotice_[HID_TYPES.Xbox] = var_43_0
			arg_43_0.oldRemapNotice_[HID_TYPES.PS4] = var_43_0
		elseif arg_43_0.gamepadType_ == HID_TYPES.Keyboard or arg_43_0.gamepadType_ == HID_TYPES.KeyMouse then
			arg_43_0.oldRemapNotice_[HID_TYPES.Keyboard] = var_43_0
			arg_43_0.oldRemapNotice_[HID_TYPES.KeyMouse] = var_43_0
		end
	end

	return var_43_0
end

function var_0_0.RefreshRemapNoticeToggle(arg_44_0)
	arg_44_0.remapNoticeToggle_.isOn = arg_44_0:GetRemapNotice()
end

function var_0_0.IsJoystickEnable(arg_45_0)
	local var_45_0 = LuaHidTools.GetPlayerSelectJoystick()

	return LuaForGamepad.IsDeviceEnable(var_45_0)
end

function var_0_0.NotifyKeyChange(arg_46_0)
	if not arg_46_0.remapNoticeToggle_.isOn then
		return
	end

	LuaHidTools.SetRemapNotice(arg_46_0.gamepadType_, false)
	FrameTimer.New(function()
		LuaHidTools.SetRemapNotice(arg_46_0.gamepadType_, true)
	end, 1, 1):Start()
end

function var_0_0.RefreshBattleUIName(arg_48_0)
	local var_48_0 = ""
	local var_48_1 = SettingData:GetBattleUISettingData()

	if var_48_1.battle_ui_cur_type == var_48_1.battle_ui_type_0 then
		var_48_0 = GetTips("BATTLE_UI_DEFAULT_PRESET")
	elseif var_48_1.battle_ui_cur_type == var_48_1.battle_ui_type_1 then
		var_48_0 = string.format(GetTips("BATTLE_UI_SCHEME_INDEX"), 1)
	elseif var_48_1.battle_ui_cur_type == var_48_1.battle_ui_type_2 then
		var_48_0 = string.format(GetTips("BATTLE_UI_SCHEME_INDEX"), 2)
	elseif var_48_1.battle_ui_cur_type == var_48_1.battle_ui_type_3 then
		var_48_0 = string.format(GetTips("BATTLE_UI_SCHEME_INDEX"), 3)
	else
		var_48_0 = GetTips("BATTLE_UI_DEFAULT_PRESET")
	end

	arg_48_0.battleUiText_.text = var_48_0
end

function var_0_0.RefreshGamepadName(arg_49_0)
	local var_49_0 = LuaHidTools.GetPlayerSelectJoystick() == HID_TYPES.Xbox and 2 or 1

	arg_49_0.gamepadSelText_.text = GetTips("GAMEPAD_ICON_PATTERN_" .. var_49_0)
end

function var_0_0.RefreshKeyboardName(arg_50_0)
	local var_50_0

	var_50_0 = LuaHidTools.GetPlayerSelectKeyboard() == HID_TYPES.KeyMouse and 2 or 1
end

function var_0_0.RefreshControlTypeName(arg_51_0)
	local var_51_0 = arg_51_0.gamepadType_

	if var_51_0 == HID_TYPES.Keyboard or var_51_0 == HID_TYPES.KeyMouse then
		arg_51_0:RefreshKeyboardName()
	elseif var_51_0 == HID_TYPES.Xbox or var_51_0 == HID_TYPES.PS4 then
		arg_51_0:RefreshGamepadName()
	end
end

function var_0_0.OnJoystickTypeSelect(arg_52_0, arg_52_1)
	arg_52_0:RefreshControlTypeName()
	arg_52_0:SwitchToHID(arg_52_1)
end

function var_0_0.SetHidType(arg_53_0, arg_53_1)
	arg_53_0.gamepadType_ = arg_53_1
	arg_53_0.layoutName_ = arg_53_0:GetLayoutName(arg_53_0.gamepadType_)
end

function var_0_0.GetLayoutName(arg_54_0, arg_54_1)
	if arg_54_1 == HID_TYPES.Keyboard then
		return var_0_2.Keyboard
	elseif arg_54_1 == HID_TYPES.KeyMouse then
		return var_0_2.KeyMouse
	elseif arg_54_1 == HID_TYPES.Xbox then
		return var_0_2.Xbox
	elseif arg_54_1 == HID_TYPES.PS4 then
		return var_0_2.PS
	else
		return var_0_2.Other
	end
end

function var_0_0.SendSDK(arg_55_0)
	if not GameToSDK.IsEditorOrPcPlatform() then
		return
	end

	local var_55_0 = {}

	for iter_55_0, iter_55_1 in ipairs(arg_55_0.keysChangeInfo_) do
		local var_55_1 = var_55_0[iter_55_1.layoutName]

		if not var_55_1 then
			var_55_1 = {}
			var_55_0[iter_55_1.layoutName] = var_55_1
		end

		table.insert(var_55_1, {
			buttonType = tostring(iter_55_1.buttonInt),
			value = iter_55_1.key
		})
	end

	local var_55_2 = {
		HID_TYPES.Keyboard,
		HID_TYPES.Xbox,
		HID_TYPES.PS4,
		HID_TYPES.KeyMouse
	}

	for iter_55_2, iter_55_3 in ipairs(var_55_2) do
		local var_55_3 = var_55_0[arg_55_0:GetLayoutName(iter_55_3)]

		if var_55_3 then
			local var_55_4 = iter_55_3

			if var_55_4 > HID_TYPES.Other then
				var_55_4 = var_55_4 - 1
			end

			SDKTools.SendMessageToSDK("keymap_setting", {
				type = var_55_4,
				other_arrayobject = var_55_3
			})
		end
	end
end

return var_0_0
