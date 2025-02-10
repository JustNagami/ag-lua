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
	arg_5_0.cursorScaleSlider_.onValueChanged:AddListener(function(arg_9_0)
		local var_9_0 = arg_9_0 / arg_5_0.cursorScaleSlider_.maxValue

		LuaForCursor.ResizeCursor(var_9_0)
		SettingAction.ChangeGameSetting("cursor_size", arg_9_0)
		PlayerPrefs.SetFloat("PCCursor_CursorScalePercent", var_9_0)
	end)
	arg_5_0:AddPressingByTimeListener(arg_5_0.cursorScaleSubBtn_, 1, 0.5, 0.1, function()
		if arg_5_0.cursorScaleSlider_.value > arg_5_0.cursorScaleSlider_.minValue then
			arg_5_0.cursorScaleSlider_.value = arg_5_0.cursorScaleSlider_.value - 1

			return true
		end

		return false
	end)
	arg_5_0:AddPressingByTimeListener(arg_5_0.cursorScaleAddBtn_, 1, 0.5, 0.1, function()
		if arg_5_0.cursorScaleSlider_.value < arg_5_0.cursorScaleSlider_.maxValue then
			arg_5_0.cursorScaleSlider_.value = arg_5_0.cursorScaleSlider_.value + 1

			return true
		end

		return false
	end)

	for iter_5_0 = 1, 3 do
		arg_5_0:AddToggleListener(arg_5_0["hitNumberTeammate" .. iter_5_0 .. "Tgl_"], function(arg_12_0)
			if not arg_12_0 then
				return
			end

			if arg_5_0.settingData_.battle_hit_num_teammate ~= iter_5_0 - 1 then
				SettingAction.ChangeGameSetting("battle_hit_num_teammate", iter_5_0 - 1)
			end
		end)
	end

	for iter_5_1 = 1, 3 do
		arg_5_0:AddToggleListener(arg_5_0["hitNumberPlayer" .. iter_5_1 .. "Tgl_"], function(arg_13_0)
			if not arg_13_0 then
				return
			end

			if arg_5_0.settingData_.battle_hit_num_mine ~= iter_5_1 - 1 then
				SettingAction.ChangeGameSetting("battle_hit_num_mine", iter_5_1 - 1)
			end
		end)
	end

	arg_5_0:AddToggleListener(arg_5_0.moveableStickOnTgl_, function(arg_14_0)
		if arg_14_0 and arg_5_0.settingData_.moveable_stick ~= 1 then
			SettingAction.ChangeGameSetting("moveable_stick", 1)
		end
	end)
	arg_5_0:AddToggleListener(arg_5_0.moveableStickOffTgl_, function(arg_15_0)
		if arg_15_0 and arg_5_0.settingData_.moveable_stick ~= 0 then
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
		local var_18_0 = arg_5_0.settingData_.hide_main_voice_subtitle == 1 and 0 or 1

		if arg_5_0.settingData_.hide_main_voice_subtitle ~= var_18_0 then
			SettingAction.ChangeGameSetting("hide_main_voice_subtitle", var_18_0)
		end
	end)
	arg_5_0:AddToggleListener(arg_5_0.m_musicNameTgl_, function(arg_19_0)
		local var_19_0
		local var_19_1 = arg_19_0 and 1 or 0

		SettingAction.ChangeGameSetting("show_music_name", var_19_1)
	end)

	for iter_5_2 = 1, 4 do
		arg_5_0:AddBtnListener(arg_5_0["musicTime" .. iter_5_2 .. "Tgl_"], nil, function()
			if arg_5_0.settingData_.music_time ~= var_0_2[iter_5_2] then
				SettingAction.ChangeGameSetting("music_time", var_0_2[iter_5_2])
			end
		end)
	end
end

function var_0_0.RefreshHurtNum(arg_21_0)
	if not arg_21_0.gameObject_.activeSelf then
		for iter_21_0 = 1, 3 do
			arg_21_0["hitNumberPlayer" .. iter_21_0 .. "Tgl_"].isOn = false
		end
	end

	arg_21_0["hitNumberPlayer" .. arg_21_0.settingData_.battle_hit_num_mine + 1 .. "Tgl_"].isOn = true
end

function var_0_0.RefreshHurtNumMate(arg_22_0)
	if not arg_22_0.gameObject_.activeSelf then
		for iter_22_0 = 1, 3 do
			arg_22_0["hitNumberTeammate" .. iter_22_0 .. "Tgl_"].isOn = false
		end
	end

	arg_22_0["hitNumberTeammate" .. arg_22_0.settingData_.battle_hit_num_teammate + 1 .. "Tgl_"].isOn = true
end

function var_0_0.RefreshLockType(arg_23_0)
	local var_23_0 = arg_23_0.settingData_.battle_lock_type

	if var_23_0 == 0 then
		arg_23_0.lockText_.text = GetTips("SYSTEM_SETTING_LOCK_1")
	elseif var_23_0 == 1 then
		arg_23_0.lockText_.text = GetTips("SYSTEM_SETTING_LOCK_2")
	elseif var_23_0 == 2 then
		arg_23_0.lockText_.text = GetTips("SYSTEM_SETTING_LOCK_3")
	end
end

function var_0_0.RefreshMoveableStick(arg_24_0)
	if not arg_24_0.gameObject_.activeSelf then
		arg_24_0.moveableStickOnTgl_.isOn = false
		arg_24_0.moveableStickOffTgl_.isOn = false
	end

	local var_24_0 = arg_24_0.settingData_.moveable_stick

	if var_24_0 and var_24_0 == 1 then
		arg_24_0.moveableStickOnTgl_.isOn = true
	else
		arg_24_0.moveableStickOffTgl_.isOn = true
	end
end

function var_0_0.RefreshCUSFullPlay(arg_25_0)
	local var_25_0 = arg_25_0.settingData_.cus_full_play_controlled_type

	if var_25_0 then
		if var_25_0 == 2 then
			arg_25_0.connectText_.text = GetTips("SYSTEM_SETTING_SKILLCHAIN_1")
		elseif var_25_0 == 3 then
			arg_25_0.connectText_.text = GetTips("SYSTEM_SETTING_SKILLCHAIN_2")
		elseif var_25_0 == 4 then
			arg_25_0.connectText_.text = GetTips("SYSTEM_SETTING_SKILLCHAIN_3")
		elseif var_25_0 == 1 then
			arg_25_0.connectText_.text = GetTips("SYSTEM_SETTING_SKILLCHAIN_4")
		else
			arg_25_0.connectText_.text = GetTips("SYSTEM_SETTING_SKILLCHAIN_5")
		end
	end
end

function var_0_0.RefreshHideMainVoiceSubTitle(arg_26_0)
	local var_26_0 = arg_26_0.settingData_.hide_main_voice_subtitle == 1

	arg_26_0.hideMainVoiceSubtitleCtr_:SetSelectedState(var_26_0 and "on" or "off")
end

function var_0_0.RefreshMusicNameTipReminder(arg_27_0)
	local var_27_0 = arg_27_0.settingData_.show_music_name == 1

	arg_27_0.m_musicNameTgl_.isOn = var_27_0

	arg_27_0.m_musicNameCon_:GetController("default0"):SetSelectedIndex(arg_27_0.settingData_.show_music_name)
end

function var_0_0.RefreshMusicNameShowTime(arg_28_0)
	local var_28_0 = arg_28_0.settingData_.music_time

	for iter_28_0 = 1, 4 do
		SetActive(arg_28_0[string.format("musicTime%dCheck_", iter_28_0)], var_0_3[var_28_0] == iter_28_0)
	end
end

function var_0_0.CheckDataChange(arg_29_0, arg_29_1)
	if arg_29_0.tmpSettingData_ and not table.equal(arg_29_0.tmpSettingData_, arg_29_0.settingData_, "all") then
		return true
	end

	return false
end

function var_0_0.SaveData(arg_30_0)
	if arg_30_0:CheckDataChange() then
		arg_30_0.json_ = require("cjson")

		local var_30_0 = deepClone(arg_30_0.settingData_)

		var_30_0.type = 3

		local var_30_1 = arg_30_0.json_.encode(var_30_0)
		local var_30_2 = {
			cursor_num = arg_30_0.settingData_.cursor_size,
			talk_setting = arg_30_0.settingData_.hide_main_voice_subtitle,
			story_music_set = arg_30_0.settingData_.show_music_name,
			story_music_set_times = arg_30_0.settingData_.music_time
		}

		SDKTools.SendMessageToSDK("game_setting", {
			gamepad_setting = 0,
			main_damage_num = arg_30_0.settingData_.battle_hit_num_mine + 1,
			ass_damage_num = arg_30_0.settingData_.battle_hit_num_teammate + 1,
			lock_setting = arg_30_0.settingData_.battle_lock_type + 1,
			ss_screen = arg_30_0.settingData_.adapter_value,
			other_data = var_30_2
		})
	end

	arg_30_0.tmpSettingData_ = deepClone(arg_30_0.settingData_)
end

function var_0_0.RecoverTmpData(arg_31_0)
	if arg_31_0:CheckDataChange() then
		SettingAction.ChangeGameSetting("allData", arg_31_0.tmpSettingData_)
	end
end

function var_0_0.RefreshAdapterValue(arg_32_0)
	local var_32_0 = arg_32_0.settingData_.adapter_value

	arg_32_0.sliderSlr_.value = var_32_0
	ReduxView.VIEW_ADAPT_DISTANCE = arg_32_0.settingData_.adapter_value
end

function var_0_0.RefreshCursorSizeValue(arg_33_0)
	if GameToSDK.PLATFORM_ID ~= 3 then
		SetActive(arg_33_0.cursorScalerGo_, false)
	else
		SetActive(arg_33_0.cursorScalerGo_, true)
	end

	local var_33_0 = arg_33_0.settingData_.cursor_size

	arg_33_0.cursorScaleSlider_.value = var_33_0
end

function var_0_0.OnGameSettingChange(arg_34_0, arg_34_1, arg_34_2)
	if arg_34_2.key == "allData" then
		arg_34_0:RefreshHurtNum()
		arg_34_0:RefreshHurtNumMate()
		arg_34_0:RefreshLockType()
		arg_34_0:RefreshMoveableStick()
		arg_34_0:RefreshCUSFullPlay()
		arg_34_0:RefreshAdapterValue()
		arg_34_0:RefreshCursorSizeValue()
		arg_34_0:RefreshHideMainVoiceSubTitle()
		arg_34_0:RefreshMusicNameTipReminder()
		arg_34_0:RefreshMusicNameShowTime()
	elseif arg_34_2.key == "battle_hit_num_mine" then
		arg_34_0:RefreshHurtNum()
	elseif arg_34_2.key == "battle_hit_num_teammate" then
		arg_34_0:RefreshHurtNumMate()
	elseif arg_34_2.key == "battle_lock_type" then
		arg_34_0:RefreshLockType()
	elseif arg_34_2.key == "adapter_value" then
		arg_34_0:RefreshAdapterValue()
	elseif arg_34_2.key == "cursor_size" then
		arg_34_0:RefreshCursorSizeValue()
	elseif arg_34_2.key == "moveable_stick" then
		arg_34_0:RefreshMoveableStick()
	elseif arg_34_2.key == "cus_full_play_controlled_type" then
		arg_34_0:RefreshCUSFullPlay()
	elseif arg_34_2.key == "hide_main_voice_subtitle" then
		arg_34_0:RefreshHideMainVoiceSubTitle()
	elseif arg_34_2.key == "show_music_name" then
		arg_34_0:RefreshMusicNameTipReminder()
	elseif arg_34_2.key == "music_time" then
		arg_34_0:RefreshMusicNameShowTime()
	end
end

function var_0_0.Init(arg_35_0)
	arg_35_0:InitUI()
	arg_35_0:AddUIListener()
	arg_35_0:OnEnter()
end

function var_0_0.OnTop(arg_36_0)
	arg_36_0:RefreshLockType()
	arg_36_0:RefreshCUSFullPlay()
end

function var_0_0.OnEnter(arg_37_0)
	arg_37_0.settingData_ = SettingData:GetGameSettingData()

	arg_37_0:RefreshHurtNum()
	arg_37_0:RefreshHurtNumMate()
	arg_37_0:RefreshLockType()
	arg_37_0:RefreshAdapterValue()
	arg_37_0:RefreshCursorSizeValue()
	arg_37_0:RefreshMoveableStick()
	arg_37_0:RefreshCUSFullPlay()
	arg_37_0:RefreshHideMainVoiceSubTitle()
	arg_37_0:RefreshMusicNameTipReminder()
	arg_37_0:RefreshMusicNameShowTime()

	arg_37_0.tmpSettingData_ = deepClone(arg_37_0.settingData_)

	local var_37_0 = (arg_37_0.info_.setType or SettingConst.SETTING_TYPE.SYSTEM) == SettingConst.SETTING_TYPE.SYSTEM

	SetActive(arg_37_0.adapterGo_, var_37_0)
end

function var_0_0.OnExit(arg_38_0)
	return
end

function var_0_0.Dispose(arg_39_0)
	arg_39_0.hander_ = nil

	var_0_0.super.Dispose(arg_39_0)
end

function var_0_0.OnSoundSettingChange(arg_40_0)
	arg_40_0:RefreshLockType()
end

return var_0_0
