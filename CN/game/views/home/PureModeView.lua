local var_0_0 = class("PureModeView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/System/Main/DesktopUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:InitUI()
	arg_3_0:AddUIListener()
end

function var_0_0.InitUI(arg_4_0)
	arg_4_0:BindCfgUI()

	arg_4_0.batteryCfg = {
		{
			value = "fill11",
			max = 0
		},
		{
			value = "fill12",
			max = 0.25
		},
		{
			value = "fill13",
			max = 0.5
		},
		{
			value = "fill14",
			max = 0.75
		}
	}
	arg_4_0.batteryControll = arg_4_0.fillbgControllerexcollection_:GetController("fillbg")
end

function var_0_0.ChangeBar(arg_5_0)
	manager.windowBar:SwitchBar({
		BACK_BAR
	})
	manager.windowBar:RegistBackCallBack(function()
		arg_5_0:Back(1)
	end)
end

function var_0_0.OnEnter(arg_7_0)
	return
end

function var_0_0.OnTop(arg_8_0)
	local var_8_0 = arg_8_0.params_ and arg_8_0.params_.enterType or 2

	arg_8_0:ChangeBar()
	arg_8_0:RefreshBattery()
	arg_8_0:RefreshMusic()
	arg_8_0:StopTimer()

	arg_8_0.timer = Timer.New(function()
		arg_8_0:UpdateTimeTxt()
		arg_8_0:RefreshBattery()
	end, 1, -1)

	arg_8_0.timer:Start()
	arg_8_0:UpdateTimeTxt()
	arg_8_0:StartViewHideTimer()
	SetActive(arg_8_0.bg01Btn_.gameObject, true)
	arg_8_0:RecordPureModeLog(true, var_8_0)

	arg_8_0.enterMode_ = var_8_0

	PlayerData:SetIsDeskMode(true)
	arg_8_0:RegistEventListener(ON_GAME_IN, function(arg_10_0)
		JumpTools.Back()
		manager.posterGirl:EnterMiniGame(arg_10_0)
	end)
end

function var_0_0.OnBehind(arg_11_0)
	manager.windowBar:HideBar()
end

function var_0_0.RefreshBattery(arg_12_0)
	arg_12_0.batteryLevel = UnityEngine.SystemInfo.batteryLevel

	local var_12_0 = "fill14"

	for iter_12_0, iter_12_1 in ipairs(arg_12_0.batteryCfg) do
		if arg_12_0.batteryLevel > iter_12_1.max then
			var_12_0 = iter_12_1.value
		end
	end

	arg_12_0.batteryControll:SetSelectedState(var_12_0)
end

function var_0_0.StartViewHideTimer(arg_13_0)
	arg_13_0:StopViewHideTimer()
	SetActive(arg_13_0.bg01Btn_.gameObject, false)

	arg_13_0.viewHideTimer_ = Timer.New(function()
		SetActive(arg_13_0.bg01Btn_.gameObject, true)
		arg_13_0:StopViewHideTimer()
		manager.windowBar:SwitchBar({})
	end, 5, 1)

	arg_13_0.viewHideTimer_:Start()
end

function var_0_0.StopViewHideTimer(arg_15_0)
	if arg_15_0.viewHideTimer_ then
		arg_15_0.viewHideTimer_:Stop()

		arg_15_0.viewHideTimer_ = nil
	end
end

function var_0_0.UpdateTimeTxt(arg_16_0)
	local var_16_0 = os.time()
	local var_16_1 = os.difftime(var_16_0, os.time(os.date("!*t", var_16_0)))
	local var_16_2 = os.date("!*t", var_16_0 + var_16_1)

	arg_16_0.texttime2Text_.text = string.format("%s/%s/%s", var_16_2.year, var_16_2.month, var_16_2.day)
	arg_16_0.texttime3Text_.text = GetTips("WEEK_DES_" .. (var_16_2.wday == 1 and 7 or var_16_2.wday - 1))
	arg_16_0.texttimeText_.text = string.format("%02d:%02d", tonumber(var_16_2.hour), tonumber(var_16_2.min))
end

function var_0_0.RefreshMusic(arg_17_0)
	local var_17_0 = MusicRecordCfg.all[1]
	local var_17_1 = GetHomeMusicID()

	if var_17_1 ~= 0 and MusicRecordCfg[var_17_1] then
		var_17_0 = var_17_1
	else
		local var_17_2 = manager.audio:GetBgmPlayer()

		if var_17_2 then
			local var_17_3 = var_17_2.cueName or ""
			local var_17_4 = var_17_2.cueSheet or ""

			if var_17_3 ~= "" and var_17_4 ~= "" then
				local var_17_5 = MusicRecordCfg.all

				for iter_17_0, iter_17_1 in ipairs(var_17_5) do
					local var_17_6 = MusicRecordCfg[iter_17_1]

					if var_17_6.cueName == var_17_3 and var_17_6.cuesheet == var_17_4 then
						var_17_0 = iter_17_1
					end
				end
			end
		end
	end

	arg_17_0.text2Text_.text = GetI18NText(MusicRecordCfg[var_17_0].musicName)
end

function var_0_0.OnExit(arg_18_0)
	var_0_0.super.OnExit(arg_18_0)
	arg_18_0:StopTimer()
	arg_18_0:StopViewHideTimer()
	arg_18_0:RecordPureModeLog(false)
	manager.windowBar:HideBar()
	arg_18_0:RemoveAllEventListener()
end

function var_0_0.OnExitInput(arg_19_0)
	JumpTools.Back()

	return true
end

function var_0_0.StopTimer(arg_20_0)
	if arg_20_0.timer then
		arg_20_0.timer:Stop()

		arg_20_0.timer = nil
	end
end

function var_0_0.AddUIListener(arg_21_0)
	arg_21_0:AddBtnListener(arg_21_0.bg01Btn_, nil, function()
		arg_21_0:ChangeBar()
		arg_21_0:StartViewHideTimer()
	end)
	arg_21_0:AddBtnListener(arg_21_0.btn_arrow_hide2Btn_, nil, function()
		arg_21_0:StopTimer()
		arg_21_0:StopViewHideTimer()
		JumpTools.OpenPageByJump("/illuMusic", {})
	end)
end

function var_0_0.RecordPureModeLog(arg_24_0, arg_24_1, arg_24_2)
	local var_24_0 = manager.posterGirl:GetInteractionsTimes()
	local var_24_1 = manager.time:GetServerTime()

	if arg_24_1 then
		SDKTools.SendMessageToSDK("duration", {
			opt = 1,
			duration_name = "homepage_heroshow_desk",
			type = arg_24_2
		})
	else
		local var_24_2 = var_24_0 - (arg_24_0.lastInteractionsTimes or 0)
		local var_24_3 = arg_24_0.lastPureModeTime and var_24_1 - arg_24_0.lastPureModeTime or 0

		SDKTools.SendMessageToSDK("duration", {
			opt = 2,
			duration_name = "homepage_heroshow_desk",
			touch_times = var_24_2,
			duration = var_24_3
		})
	end

	arg_24_0.lastInteractionsTimes = var_24_0
	arg_24_0.lastPureModeTime = var_24_1
end

function var_0_0.Dispose(arg_25_0)
	var_0_0.super.Dispose(arg_25_0)
end

return var_0_0
