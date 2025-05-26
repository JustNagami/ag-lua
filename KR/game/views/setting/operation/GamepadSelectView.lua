local var_0_0 = class("GamepadSelectView")

function var_0_0.UIName(arg_1_0)
	return "Widget/System/Setting/GameSettinghandleUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiPop.transform
end

function var_0_0.Ctor(arg_3_0, arg_3_1)
	arg_3_0.gameObject_ = Object.Instantiate(Asset.Load(arg_3_0:UIName()), arg_3_0:UIParent())
	arg_3_0.transform_ = arg_3_0.gameObject_.transform
	arg_3_0.gamepadType_ = arg_3_1

	arg_3_0:Init()
	arg_3_0:OnEnter()
end

function var_0_0.Init(arg_4_0)
	arg_4_0:InitUI()
	arg_4_0:AddUIListener()
end

function var_0_0.InitUI(arg_5_0)
	ComponentBinder.GetInstance():BindCfgUI(arg_5_0, arg_5_0.gameObject_)

	arg_5_0.selectController_ = arg_5_0.controllerEx_:GetController("select")
end

function var_0_0.AddUIListener(arg_6_0)
	arg_6_0.confirmBtn_.onClick:AddListener(function()
		local var_7_0 = arg_6_0:GetGamepadType(arg_6_0.selectIdx_)

		LuaHidTools.SetPlayerSelectJoystick(var_7_0)
		arg_6_0:CloseWindow()
		manager.notify:Invoke(JOYSTICK_TYPE_SELECT, var_7_0)
	end)
	arg_6_0.cancelBtn_.onClick:AddListener(function()
		arg_6_0:CloseWindow()
	end)

	for iter_6_0 = 1, 2 do
		local var_6_0 = arg_6_0["btn_" .. iter_6_0]

		if var_6_0 then
			var_6_0.onClick:AddListener(function()
				arg_6_0:SelectGamepad(iter_6_0)
			end)
		end
	end
end

function var_0_0.RemoveUIListeners(arg_10_0)
	arg_10_0.confirmBtn_.onClick:RemoveAllListeners()
	arg_10_0.cancelBtn_.onClick:RemoveAllListeners()

	for iter_10_0 = 1, 2 do
		local var_10_0 = arg_10_0["btn_" .. iter_10_0]

		if var_10_0 then
			var_10_0.onClick:RemoveAllListeners()
		end
	end
end

function var_0_0.OnEnter(arg_11_0)
	arg_11_0:SetGaussionBg()

	local var_11_0 = arg_11_0.gamepadType_

	if PlayerPrefs.HasKey("JoystickType") then
		var_11_0 = LuaHidTools.GetPlayerSelectJoystick()
	end

	local var_11_1 = arg_11_0:GetGamepadIndex(var_11_0)

	arg_11_0:SelectGamepad(var_11_1)
	LuaForCursor.SwitchCursor(true)
end

function var_0_0.SelectGamepad(arg_12_0, arg_12_1)
	arg_12_0.selectController_:SetSelectedState(arg_12_1)

	arg_12_0.selectIdx_ = arg_12_1
end

function var_0_0.GetGamepadIndex(arg_13_0, arg_13_1)
	if arg_13_1 == HID_TYPES.PS4 then
		return 1
	end

	return 2
end

function var_0_0.GetGamepadType(arg_14_0, arg_14_1)
	if arg_14_1 == 1 then
		return HID_TYPES.PS4
	end

	return HID_TYPES.Xbox
end

function var_0_0.CloseWindow(arg_15_0)
	arg_15_0:RevertSeparate()
	arg_15_0:Dispose()

	LuaHidTools.selectWin_ = nil
end

function var_0_0.SetGaussionBg(arg_16_0)
	if not manager.ui:GetUISeparateRender() then
		manager.ui:SetUISeparateRender(true)

		arg_16_0.separateFlag_ = true
	end
end

function var_0_0.RevertSeparate(arg_17_0)
	if arg_17_0.separateFlag_ then
		manager.ui:SetUISeparateRender(false)

		arg_17_0.separateFlag_ = false
	end
end

function var_0_0.Dispose(arg_18_0)
	arg_18_0:RemoveUIListeners()
	Object.Destroy(arg_18_0.gameObject_)

	arg_18_0.transform_ = nil
	arg_18_0.gameObject_ = nil
end

return var_0_0
