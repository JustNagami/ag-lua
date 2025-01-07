local var_0_0 = class("GameSettingView", ReduxView)
local var_0_1 = require("cjson")
local var_0_2 = {
	0,
	3,
	5,
	10
}
local var_0_3 = {
	[0] = 1,
	nil,
	nil,
	2,
	nil,
	3,
	[10] = 4
}

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
	arg_3_0:InitController()
end

function var_0_0.InitController(arg_4_0)
	arg_4_0.hideMainVoiceSubtitleCtr_ = arg_4_0.hideMainVoiceSubtitleCtrEx_:GetController("default0")
end

function var_0_0.AddUIListener(arg_5_0)
	arg_5_0.sliderSlr_.onValueChanged:AddListener(function()
		SettingAction.ChangeGameSetting("adapter_value", arg_5_0.sliderSlr_.value)
	end)
	arg_5_0:AddPressingByTimeListener(arg_5_0.cutGo_, 3, 0.5, 0.5, function()
		if arg_5_0.sliderSlr_.value > 0 then
			local var_7_0 = arg_5_0.sliderSlr_.value - 1

			SettingAction.ChangeGameSetting("adapter_value", var_7_0)

			return true
		end

		return false
	end)
	arg_5_0:AddPressingByTimeListener(arg_5_0.addGo_, 3, 0.5, 0.5, function()
		if arg_5_0.sliderSlr_.value < 100 then
			local var_8_0 = arg_5_0.sliderSlr_.value + 1

			SettingAction.ChangeGameSetting("adapter_value", var_8_0)

			return true
		end

		return false
	end)

	for iter_5_0 = 1, 3 do
		arg_5_0:AddToggleListener(arg_5_0["hitNumberTeammate" .. iter_5_0 .. "Tgl_"], function(arg_9_0)
			if not arg_9_0 then
				return
			end

			if arg_5_0.settingData_.battle_hit_num_teammate ~= iter_5_0 - 1 then
				SettingAction.ChangeGameSetting("battle_hit_num_teammate", iter_5_0 - 1)
			end
		end)
	end

	for iter_5_1 = 1, 3 do
		arg_5_0:AddToggleListener(arg_5_0["hitNumberPlayer" .. iter_5_1 .. "Tgl_"], function(arg_10_0)
			if not arg_10_0 then
				return
			end

			if arg_5_0.settingData_.battle_hit_num_mine ~= iter_5_1 - 1 then
				SettingAction.ChangeGameSetting("battle_hit_num_mine", iter_5_1 - 1)
			end
		end)
	end

	arg_5_0:AddToggleListener(arg_5_0.moveableStickOnTgl_, function(arg_11_0)
		if arg_11_0 and arg_5_0.settingData_.moveable_stick ~= 1 then
			SettingAction.ChangeGameSetting("moveable_stick", 1)
		end
	end)
	arg_5_0:AddToggleListener(arg_5_0.moveableStickOffTgl_, function(arg_12_0)
		if arg_12_0 and arg_5_0.settingData_.moveable_stick ~= 0 then
			SettingAction.ChangeGameSetting("moveable_stick", 0)
		end
	end)
	arg_5_0:AddBtnListener(arg_5_0.lockBtn_, nil, function()
		JumpTools.OpenPageByJump("gameSettingLock", {
			type = arg_5_0.settingData_.battle_lock_type
		})
	end)
	arg_5_0:AddBtnListener(arg_5_0.connectBtn_, nil, function()
		JumpTools.OpenPageByJump("gameSettingConnect", {
			type = arg_5_0.settingData_.cus_full_play_controlled_type
		})
	end)
	arg_5_0:AddBtnListener(arg_5_0.hideMainVoiceSubtitleBtn_, nil, function()
		local var_15_0 = arg_5_0.settingData_.hide_main_voice_subtitle == 1 and 0 or 1

		if arg_5_0.settingData_.hide_main_voice_subtitle ~= var_15_0 then
			SettingAction.ChangeGameSetting("hide_main_voice_subtitle", var_15_0)
		end
	end)
	arg_5_0:AddToggleListener(arg_5_0.m_musicNameTgl_, function(arg_16_0)
		local var_16_0
		local var_16_1 = arg_16_0 and 1 or 0

		SettingAction.ChangeGameSetting("show_music_name", var_16_1)
	end)

	for iter_5_2 = 1, 4 do
		arg_5_0:AddBtnListener(arg_5_0["musicTime" .. iter_5_2 .. "Tgl_"], nil, function()
			if arg_5_0.settingData_.music_time ~= var_0_2[iter_5_2] then
				SettingAction.ChangeGameSetting("music_time", var_0_2[iter_5_2])
			end
		end)
	end
end

function var_0_0.RefreshHurtNum(arg_18_0)
	if not arg_18_0.gameObject_.activeSelf then
		for iter_18_0 = 1, 3 do
			arg_18_0["hitNumberPlayer" .. iter_18_0 .. "Tgl_"].isOn = false
		end
	end

	arg_18_0["hitNumberPlayer" .. arg_18_0.settingData_.battle_hit_num_mine + 1 .. "Tgl_"].isOn = true
end

function var_0_0.RefreshHurtNumMate(arg_19_0)
	if not arg_19_0.gameObject_.activeSelf then
		for iter_19_0 = 1, 3 do
			arg_19_0["hitNumberTeammate" .. iter_19_0 .. "Tgl_"].isOn = false
		end
	end

	arg_19_0["hitNumberTeammate" .. arg_19_0.settingData_.battle_hit_num_teammate + 1 .. "Tgl_"].isOn = true
end

function var_0_0.RefreshLockType(arg_20_0)
	local var_20_0 = arg_20_0.settingData_.battle_lock_type

	if var_20_0 == 0 then
		arg_20_0.lockText_.text = GetTips("SYSTEM_SETTING_LOCK_1")
	elseif var_20_0 == 1 then
		arg_20_0.lockText_.text = GetTips("SYSTEM_SETTING_LOCK_2")
	elseif var_20_0 == 2 then
		arg_20_0.lockText_.text = GetTips("SYSTEM_SETTING_LOCK_3")
	end
end

function var_0_0.RefreshMoveableStick(arg_21_0)
	if not arg_21_0.gameObject_.activeSelf then
		arg_21_0.moveableStickOnTgl_.isOn = false
		arg_21_0.moveableStickOffTgl_.isOn = false
	end

	local var_21_0 = arg_21_0.settingData_.moveable_stick

	if var_21_0 and var_21_0 == 1 then
		arg_21_0.moveableStickOnTgl_.isOn = true
	else
		arg_21_0.moveableStickOffTgl_.isOn = true
	end
end

function var_0_0.RefreshCUSFullPlay(arg_22_0)
	local var_22_0 = arg_22_0.settingData_.cus_full_play_controlled_type

	if var_22_0 then
		if var_22_0 == 2 then
			arg_22_0.connectText_.text = GetTips("SYSTEM_SETTING_SKILLCHAIN_1")
		elseif var_22_0 == 3 then
			arg_22_0.connectText_.text = GetTips("SYSTEM_SETTING_SKILLCHAIN_2")
		elseif var_22_0 == 4 then
			arg_22_0.connectText_.text = GetTips("SYSTEM_SETTING_SKILLCHAIN_3")
		elseif var_22_0 == 1 then
			arg_22_0.connectText_.text = GetTips("SYSTEM_SETTING_SKILLCHAIN_4")
		else
			arg_22_0.connectText_.text = GetTips("SYSTEM_SETTING_SKILLCHAIN_5")
		end
	end
end

function var_0_0.RefreshHideMainVoiceSubTitle(arg_23_0)
	local var_23_0 = arg_23_0.settingData_.hide_main_voice_subtitle == 1

	arg_23_0.hideMainVoiceSubtitleCtr_:SetSelectedState(var_23_0 and "on" or "off")
end

function var_0_0.RefreshMusicNameTipReminder(arg_24_0)
	local var_24_0 = arg_24_0.settingData_.show_music_name == 1

	arg_24_0.m_musicNameTgl_.isOn = var_24_0

	arg_24_0.m_musicNameCon_:GetController("default0"):SetSelectedIndex(arg_24_0.settingData_.show_music_name)
end

function var_0_0.RefreshMusicNameShowTime(arg_25_0)
	local var_25_0 = arg_25_0.settingData_.music_time

	for iter_25_0 = 1, 4 do
		SetActive(arg_25_0[string.format("musicTime%dCheck_", iter_25_0)], var_0_3[var_25_0] == iter_25_0)
	end
end

function var_0_0.CheckDataChange(arg_26_0, arg_26_1)
	if arg_26_0.tmpSettingData_ and not table.equal(arg_26_0.tmpSettingData_, arg_26_0.settingData_, "all") then
		return true
	end

	return false
end

function var_0_0.SaveData(arg_27_0)
	if arg_27_0:CheckDataChange() then
		arg_27_0.json_ = require("cjson")

		local var_27_0 = deepClone(arg_27_0.settingData_)

		var_27_0.type = 3

		local var_27_1 = arg_27_0.json_.encode(var_27_0)

		SDKTools.SendMessageToSDK("game_setting", {
			gamepad_setting = 0,
			main_damage_num = arg_27_0.settingData_.battle_hit_num_mine + 1,
			ass_damage_num = arg_27_0.settingData_.battle_hit_num_teammate + 1,
			lock_setting = arg_27_0.settingData_.battle_lock_type + 1,
			ss_screen = arg_27_0.settingData_.adapter_value
		})
	end

	arg_27_0.tmpSettingData_ = deepClone(arg_27_0.settingData_)
end

function var_0_0.RecoverTmpData(arg_28_0)
	if arg_28_0:CheckDataChange() then
		SettingAction.ChangeGameSetting("allData", arg_28_0.tmpSettingData_)
	end
end

function var_0_0.RefreshAdapterValue(arg_29_0)
	local var_29_0 = arg_29_0.settingData_.adapter_value

	arg_29_0.sliderSlr_.value = var_29_0
	ReduxView.VIEW_ADAPT_DISTANCE = arg_29_0.settingData_.adapter_value
end

function var_0_0.OnGameSettingChange(arg_30_0, arg_30_1, arg_30_2)
	if arg_30_2.key == "allData" then
		arg_30_0:RefreshHurtNum()
		arg_30_0:RefreshHurtNumMate()
		arg_30_0:RefreshLockType()
		arg_30_0:RefreshMoveableStick()
		arg_30_0:RefreshCUSFullPlay()
		arg_30_0:RefreshAdapterValue()
		arg_30_0:RefreshHideMainVoiceSubTitle()
		arg_30_0:RefreshMusicNameTipReminder()
		arg_30_0:RefreshMusicNameShowTime()
	elseif arg_30_2.key == "battle_hit_num_mine" then
		arg_30_0:RefreshHurtNum()
	elseif arg_30_2.key == "battle_hit_num_teammate" then
		arg_30_0:RefreshHurtNumMate()
	elseif arg_30_2.key == "battle_lock_type" then
		arg_30_0:RefreshLockType()
	elseif arg_30_2.key == "adapter_value" then
		arg_30_0:RefreshAdapterValue()
	elseif arg_30_2.key == "moveable_stick" then
		arg_30_0:RefreshMoveableStick()
	elseif arg_30_2.key == "cus_full_play_controlled_type" then
		arg_30_0:RefreshCUSFullPlay()
	elseif arg_30_2.key == "hide_main_voice_subtitle" then
		arg_30_0:RefreshHideMainVoiceSubTitle()
	elseif arg_30_2.key == "show_music_name" then
		arg_30_0:RefreshMusicNameTipReminder()
	elseif arg_30_2.key == "music_time" then
		arg_30_0:RefreshMusicNameShowTime()
	end
end

function var_0_0.Init(arg_31_0)
	arg_31_0:InitUI()
	arg_31_0:AddUIListener()
	arg_31_0:OnEnter()
end

function var_0_0.OnTop(arg_32_0)
	arg_32_0:RefreshLockType()
	arg_32_0:RefreshCUSFullPlay()
end

function var_0_0.OnEnter(arg_33_0)
	arg_33_0.settingData_ = SettingData:GetGameSettingData()

	arg_33_0:RefreshHurtNum()
	arg_33_0:RefreshHurtNumMate()
	arg_33_0:RefreshLockType()
	arg_33_0:RefreshAdapterValue()
	arg_33_0:RefreshMoveableStick()
	arg_33_0:RefreshCUSFullPlay()
	arg_33_0:RefreshHideMainVoiceSubTitle()
	arg_33_0:RefreshMusicNameTipReminder()
	arg_33_0:RefreshMusicNameShowTime()

	arg_33_0.tmpSettingData_ = deepClone(arg_33_0.settingData_)

	local var_33_0 = (arg_33_0.info_.setType or SettingConst.SETTING_TYPE.SYSTEM) == SettingConst.SETTING_TYPE.SYSTEM

	SetActive(arg_33_0.adapterGo_, var_33_0)
end

function var_0_0.OnExit(arg_34_0)
	return
end

function var_0_0.Dispose(arg_35_0)
	arg_35_0.hander_ = nil

	var_0_0.super.Dispose(arg_35_0)
end

function var_0_0.OnSoundSettingChange(arg_36_0)
	arg_36_0:RefreshLockType()
end

return var_0_0
