local var_0_0 = class("GameSettingView", ReduxView)
local var_0_1 = require("cjson")

function var_0_0.SetActive(arg_1_0, arg_1_1)
	if arg_1_0.gameObject_ then
		SetActive(arg_1_0.gameObject_, arg_1_1)
	end
end

function var_0_0.Ctor(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	arg_2_0.hander_ = arg_2_1
	arg_2_0.transform_ = arg_2_2.transform
	arg_2_0.gameObject_ = arg_2_2
	arg_2_0.info_ = arg_2_3

	arg_2_0:Init()
end

function var_0_0.InitUI(arg_3_0)
	arg_3_0:BindCfgUI()
end

function var_0_0.AddUIListener(arg_4_0)
	arg_4_0.sliderSlr_.onValueChanged:AddListener(function()
		SettingAction.ChangeGameSetting("adapter_value", arg_4_0.sliderSlr_.value)
	end)
	arg_4_0:AddPressingByTimeListener(arg_4_0.cutGo_, 3, 0.5, 0.5, function()
		if arg_4_0.sliderSlr_.value > 0 then
			local var_6_0 = arg_4_0.sliderSlr_.value - 1

			SettingAction.ChangeGameSetting("adapter_value", var_6_0)

			return true
		end

		return false
	end)
	arg_4_0:AddPressingByTimeListener(arg_4_0.addGo_, 3, 0.5, 0.5, function()
		if arg_4_0.sliderSlr_.value < 100 then
			local var_7_0 = arg_4_0.sliderSlr_.value + 1

			SettingAction.ChangeGameSetting("adapter_value", var_7_0)

			return true
		end

		return false
	end)

	for iter_4_0 = 1, 3 do
		arg_4_0:AddToggleListener(arg_4_0["hitNumberTeammate" .. iter_4_0 .. "Tgl_"], function(arg_8_0)
			if not arg_8_0 then
				return
			end

			if arg_4_0.settingData_.battle_hit_num_teammate ~= iter_4_0 - 1 then
				SettingAction.ChangeGameSetting("battle_hit_num_teammate", iter_4_0 - 1)
			end
		end)
	end

	for iter_4_1 = 1, 3 do
		arg_4_0:AddToggleListener(arg_4_0["hitNumberPlayer" .. iter_4_1 .. "Tgl_"], function(arg_9_0)
			if not arg_9_0 then
				return
			end

			if arg_4_0.settingData_.battle_hit_num_mine ~= iter_4_1 - 1 then
				SettingAction.ChangeGameSetting("battle_hit_num_mine", iter_4_1 - 1)
			end
		end)
	end

	arg_4_0:AddToggleListener(arg_4_0.moveableStickOnTgl_, function(arg_10_0)
		if arg_10_0 and arg_4_0.settingData_.moveable_stick ~= 1 then
			SettingAction.ChangeGameSetting("moveable_stick", 1)
		end
	end)
	arg_4_0:AddToggleListener(arg_4_0.moveableStickOffTgl_, function(arg_11_0)
		if arg_11_0 and arg_4_0.settingData_.moveable_stick ~= 0 then
			SettingAction.ChangeGameSetting("moveable_stick", 0)
		end
	end)
	arg_4_0:AddBtnListener(arg_4_0.lockBtn_, nil, function()
		JumpTools.OpenPageByJump("gameSettingLock", {
			type = arg_4_0.settingData_.battle_lock_type
		})
	end)
	arg_4_0:AddBtnListener(arg_4_0.connectBtn_, nil, function()
		JumpTools.OpenPageByJump("gameSettingConnect", {
			type = arg_4_0.settingData_.cus_full_play_controlled_type
		})
	end)
end

function var_0_0.RefreshHurtNum(arg_14_0)
	if not arg_14_0.gameObject_.activeSelf then
		for iter_14_0 = 1, 3 do
			arg_14_0["hitNumberPlayer" .. iter_14_0 .. "Tgl_"].isOn = false
		end
	end

	arg_14_0["hitNumberPlayer" .. arg_14_0.settingData_.battle_hit_num_mine + 1 .. "Tgl_"].isOn = true
end

function var_0_0.RefreshHurtNumMate(arg_15_0)
	if not arg_15_0.gameObject_.activeSelf then
		for iter_15_0 = 1, 3 do
			arg_15_0["hitNumberTeammate" .. iter_15_0 .. "Tgl_"].isOn = false
		end
	end

	arg_15_0["hitNumberTeammate" .. arg_15_0.settingData_.battle_hit_num_teammate + 1 .. "Tgl_"].isOn = true
end

function var_0_0.RefreshLockType(arg_16_0)
	local var_16_0 = arg_16_0.settingData_.battle_lock_type

	if var_16_0 == 0 then
		arg_16_0.lockText_.text = GetTips("SYSTEM_SETTING_LOCK_1")
	elseif var_16_0 == 1 then
		arg_16_0.lockText_.text = GetTips("SYSTEM_SETTING_LOCK_2")
	elseif var_16_0 == 2 then
		arg_16_0.lockText_.text = GetTips("SYSTEM_SETTING_LOCK_3")
	end
end

function var_0_0.RefreshMoveableStick(arg_17_0)
	if not arg_17_0.gameObject_.activeSelf then
		arg_17_0.moveableStickOnTgl_.isOn = false
		arg_17_0.moveableStickOffTgl_.isOn = false
	end

	local var_17_0 = arg_17_0.settingData_.moveable_stick

	if var_17_0 and var_17_0 == 1 then
		arg_17_0.moveableStickOnTgl_.isOn = true
	else
		arg_17_0.moveableStickOffTgl_.isOn = true
	end
end

function var_0_0.RefreshCUSFullPlay(arg_18_0)
	local var_18_0 = arg_18_0.settingData_.cus_full_play_controlled_type

	if var_18_0 then
		if var_18_0 == 2 then
			arg_18_0.connectText_.text = GetTips("SYSTEM_SETTING_SKILLCHAIN_1")
		elseif var_18_0 == 3 then
			arg_18_0.connectText_.text = GetTips("SYSTEM_SETTING_SKILLCHAIN_2")
		elseif var_18_0 == 4 then
			arg_18_0.connectText_.text = GetTips("SYSTEM_SETTING_SKILLCHAIN_3")
		elseif var_18_0 == 1 then
			arg_18_0.connectText_.text = GetTips("SYSTEM_SETTING_SKILLCHAIN_4")
		else
			arg_18_0.connectText_.text = GetTips("SYSTEM_SETTING_SKILLCHAIN_5")
		end
	end
end

function var_0_0.CheckDataChange(arg_19_0, arg_19_1)
	if arg_19_0.tmpSettingData_ and not table.equal(arg_19_0.tmpSettingData_, arg_19_0.settingData_, "all") then
		return true
	end

	return false
end

function var_0_0.SaveData(arg_20_0)
	if arg_20_0:CheckDataChange() then
		arg_20_0.json_ = require("cjson")

		local var_20_0 = deepClone(arg_20_0.settingData_)

		var_20_0.type = 3

		local var_20_1 = arg_20_0.json_.encode(var_20_0)

		SDKTools.SendMessageToSDK("game_setting", {
			gamepad_setting = 0,
			main_damage_num = arg_20_0.settingData_.battle_hit_num_mine + 1,
			ass_damage_num = arg_20_0.settingData_.battle_hit_num_teammate + 1,
			lock_setting = arg_20_0.settingData_.battle_lock_type + 1,
			ss_screen = arg_20_0.settingData_.adapter_value
		})
	end

	arg_20_0.tmpSettingData_ = deepClone(arg_20_0.settingData_)
end

function var_0_0.RecoverTmpData(arg_21_0)
	if arg_21_0:CheckDataChange() then
		SettingAction.ChangeGameSetting("allData", arg_21_0.tmpSettingData_)
	end
end

function var_0_0.RefreshAdapterValue(arg_22_0)
	local var_22_0 = arg_22_0.settingData_.adapter_value

	arg_22_0.sliderSlr_.value = var_22_0
	ReduxView.VIEW_ADAPT_DISTANCE = arg_22_0.settingData_.adapter_value
end

function var_0_0.OnGameSettingChange(arg_23_0, arg_23_1, arg_23_2)
	if arg_23_2.key == "allData" then
		arg_23_0:RefreshHurtNum()
		arg_23_0:RefreshHurtNumMate()
		arg_23_0:RefreshLockType()
		arg_23_0:RefreshMoveableStick()
		arg_23_0:RefreshCUSFullPlay()
		arg_23_0:RefreshAdapterValue()
	elseif arg_23_2.key == "battle_hit_num_mine" then
		arg_23_0:RefreshHurtNum()
	elseif arg_23_2.key == "battle_hit_num_teammate" then
		arg_23_0:RefreshHurtNumMate()
	elseif arg_23_2.key == "battle_lock_type" then
		arg_23_0:RefreshLockType()
	elseif arg_23_2.key == "adapter_value" then
		arg_23_0:RefreshAdapterValue()
	elseif arg_23_2.key == "moveable_stick" then
		arg_23_0:RefreshMoveableStick()
	elseif arg_23_2.key == "cus_full_play_controlled_type" then
		arg_23_0:RefreshCUSFullPlay()
	end
end

function var_0_0.Init(arg_24_0)
	arg_24_0:InitUI()
	arg_24_0:AddUIListener()
	arg_24_0:OnEnter()
end

function var_0_0.OnTop(arg_25_0)
	arg_25_0:RefreshLockType()
	arg_25_0:RefreshCUSFullPlay()
end

function var_0_0.OnEnter(arg_26_0)
	arg_26_0.settingData_ = SettingData:GetGameSettingData()

	arg_26_0:RefreshHurtNum()
	arg_26_0:RefreshHurtNumMate()
	arg_26_0:RefreshLockType()
	arg_26_0:RefreshAdapterValue()
	arg_26_0:RefreshMoveableStick()
	arg_26_0:RefreshCUSFullPlay()

	arg_26_0.tmpSettingData_ = deepClone(arg_26_0.settingData_)

	local var_26_0 = (arg_26_0.info_.setType or SettingConst.SETTING_TYPE.SYSTEM) == SettingConst.SETTING_TYPE.SYSTEM

	SetActive(arg_26_0.adapterGo_, var_26_0)
end

function var_0_0.OnExit(arg_27_0)
	return
end

function var_0_0.Dispose(arg_28_0)
	arg_28_0.hander_ = nil

	var_0_0.super.Dispose(arg_28_0)
end

function var_0_0.OnSoundSettingChange(arg_29_0)
	arg_29_0:RefreshLockType()
end

return var_0_0
