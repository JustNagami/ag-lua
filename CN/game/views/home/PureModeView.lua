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
		arg_5_0:Back(1, {
			isPureMode = true
		})
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
end

function var_0_0.RefreshBattery(arg_10_0)
	arg_10_0.batteryLevel = UnityEngine.SystemInfo.batteryLevel

	local var_10_0 = "fill14"

	for iter_10_0, iter_10_1 in ipairs(arg_10_0.batteryCfg) do
		if arg_10_0.batteryLevel > iter_10_1.max then
			var_10_0 = iter_10_1.value
		end
	end

	arg_10_0.batteryControll:SetSelectedState(var_10_0)
end

function var_0_0.StartViewHideTimer(arg_11_0)
	arg_11_0:StopViewHideTimer()
	SetActive(arg_11_0.bg01Btn_.gameObject, false)

	arg_11_0.viewHideTimer_ = Timer.New(function()
		SetActive(arg_11_0.bg01Btn_.gameObject, true)
		arg_11_0:StopViewHideTimer()
		manager.windowBar:SwitchBar({})
	end, 5, 1)

	arg_11_0.viewHideTimer_:Start()
end

function var_0_0.StopViewHideTimer(arg_13_0)
	if arg_13_0.viewHideTimer_ then
		arg_13_0.viewHideTimer_:Stop()

		arg_13_0.viewHideTimer_ = nil
	end
end

function var_0_0.UpdateTimeTxt(arg_14_0)
	local var_14_0 = os.time()
	local var_14_1 = os.difftime(var_14_0, os.time(os.date("!*t", var_14_0)))
	local var_14_2 = os.date("!*t", var_14_0 + var_14_1)

	arg_14_0.texttime2Text_.text = string.format("%s/%s/%s", var_14_2.year, var_14_2.month, var_14_2.day)
	arg_14_0.texttime3Text_.text = GetTips("WEEK_DES_" .. (var_14_2.wday == 1 and 7 or var_14_2.wday - 1))
	arg_14_0.texttimeText_.text = string.format("%02d:%02d", tonumber(var_14_2.hour), tonumber(var_14_2.min))
end

function var_0_0.RefreshMusic(arg_15_0)
	local var_15_0 = MusicRecordCfg.all[1]
	local var_15_1 = GetHomeMusicID()

	if var_15_1 ~= 0 and MusicRecordCfg[var_15_1] then
		var_15_0 = var_15_1
	else
		local var_15_2 = manager.audio:GetBgmPlayer()

		if var_15_2 then
			local var_15_3 = var_15_2.cueName or ""
			local var_15_4 = var_15_2.cueSheet or ""

			if var_15_3 ~= "" and var_15_4 ~= "" then
				local var_15_5 = MusicRecordCfg.all

				for iter_15_0, iter_15_1 in ipairs(var_15_5) do
					local var_15_6 = MusicRecordCfg[iter_15_1]

					if var_15_6.cueName == var_15_3 and var_15_6.cuesheet == var_15_4 then
						var_15_0 = iter_15_1
					end
				end
			end
		end
	end

	arg_15_0.text2Text_.text = GetI18NText(MusicRecordCfg[var_15_0].musicName)
end

function var_0_0.OnExit(arg_16_0)
	var_0_0.super.OnExit(arg_16_0)
	arg_16_0:StopTimer()
	arg_16_0:StopViewHideTimer()
	arg_16_0:RecordPureModeLog(false)
	manager.windowBar:HideBar()

	if arg_16_0.enterMode_ == PureModeConst.EnterMode.mode3 or arg_16_0.enterMode_ == PureModeConst.EnterMode.mode4 then
		SDKTools.SendMessageToSDK("duration", {
			opt = 1,
			duration_name = "homepage_heroshow_enjoy",
			type = PureModeConst.EnterMode.mode5
		})
	end
end

function var_0_0.OnExitInput(arg_17_0)
	JumpTools.Back()

	return true
end

function var_0_0.StopTimer(arg_18_0)
	if arg_18_0.timer then
		arg_18_0.timer:Stop()

		arg_18_0.timer = nil
	end
end

function var_0_0.AddUIListener(arg_19_0)
	arg_19_0:AddBtnListener(arg_19_0.bg01Btn_, nil, function()
		arg_19_0:ChangeBar()
		arg_19_0:StartViewHideTimer()
	end)
	arg_19_0:AddBtnListener(arg_19_0.btn_arrow_hide2Btn_, nil, function()
		arg_19_0:StopTimer()
		arg_19_0:StopViewHideTimer()
		arg_19_0:RecordPureModeLog(false)
		JumpTools.OpenPageByJump("illuMusic", {})
	end)
end

function var_0_0.RecordPureModeLog(arg_22_0, arg_22_1, arg_22_2)
	local var_22_0 = manager.posterGirl:GetInteractionsTimes()
	local var_22_1 = manager.time:GetServerTime()

	if arg_22_1 then
		SDKTools.SendMessageToSDK("duration", {
			opt = 1,
			duration_name = "homepage_heroshow_desk",
			type = arg_22_2
		})
	else
		local var_22_2 = var_22_0 - (arg_22_0.lastInteractionsTimes or 0)
		local var_22_3 = arg_22_0.lastPureModeTime and var_22_1 - arg_22_0.lastPureModeTime or 0

		SDKTools.SendMessageToSDK("duration", {
			opt = 2,
			duration_name = "homepage_heroshow_desk",
			touch_times = var_22_2,
			duration = var_22_3
		})
	end

	arg_22_0.lastInteractionsTimes = var_22_0
	arg_22_0.lastPureModeTime = var_22_1
end

function var_0_0.Dispose(arg_23_0)
	var_0_0.super.Dispose(arg_23_0)
end

return var_0_0
