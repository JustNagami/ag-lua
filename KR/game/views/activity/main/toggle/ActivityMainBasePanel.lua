local var_0_0 = class("ActivityMainBasePanel", ReduxView)

function var_0_0.GetUIName(arg_1_0)
	return
end

function var_0_0.Ctor(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.activityID_ = arg_2_2

	local var_2_0 = Asset.Load(arg_2_0:GetUIName())

	arg_2_0.gameObject_ = Object.Instantiate(var_2_0, arg_2_1.transform)
	arg_2_0.transform_ = arg_2_0.gameObject_.transform

	arg_2_0:Init()
end

function var_0_0.Init(arg_3_0)
	arg_3_0:BindCfgUI()
	arg_3_0:AddListeners()
end

function var_0_0.OnEnter(arg_4_0)
	local var_4_0 = ActivityData:GetActivityData(arg_4_0.activityID_)

	arg_4_0.startTime_ = var_4_0.startTime
	arg_4_0.stopTime_ = var_4_0.stopTime

	arg_4_0:AddTimer()
	arg_4_0:HideRedPoint()
end

function var_0_0.OnExit(arg_5_0)
	arg_5_0:StopTimer()
end

function var_0_0.OnTop(arg_6_0)
	return
end

function var_0_0.UpdateBar(arg_7_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR
	})
end

function var_0_0.Dispose(arg_8_0)
	var_0_0.super.Dispose(arg_8_0)
	Object.Destroy(arg_8_0.gameObject_)

	arg_8_0.transform_ = nil
	arg_8_0.gameObject_ = nil
end

function var_0_0.AddListeners(arg_9_0)
	return
end

function var_0_0.Show(arg_10_0, arg_10_1)
	SetActive(arg_10_0.gameObject_, arg_10_1)
end

function var_0_0.HideRedPoint(arg_11_0)
	return
end

function var_0_0.AddTimer(arg_12_0)
	arg_12_0:StopTimer()
	arg_12_0:RefreshTimeText()

	arg_12_0.timer_ = Timer.New(function()
		if manager.time:GetServerTime() > arg_12_0.stopTime_ then
			return
		end

		arg_12_0:RefreshTimeText()
	end, 1, -1)

	arg_12_0.timer_:Start()
end

function var_0_0.StopTimer(arg_14_0)
	if arg_14_0.timer_ then
		arg_14_0.timer_:Stop()

		arg_14_0.timer_ = nil
	end
end

function var_0_0.RefreshTimeText(arg_15_0)
	if arg_15_0.timeText_ then
		arg_15_0.timeText_.text = manager.time:GetLostTimeStrWith2Unit(arg_15_0.stopTime_, true)
	end
end

function var_0_0.IsActivityTime(arg_16_0)
	if manager.time:GetServerTime() < arg_16_0.startTime_ then
		local var_16_0 = GetTips("OPEN_TIME")

		ShowTips(string.format(var_16_0, manager.time:GetLostTimeStrWith2Unit(arg_16_0.startTime_, true)))

		return false
	end

	if manager.time:GetServerTime() >= arg_16_0.stopTime_ then
		ShowTips("TIME_OVER")

		return false
	end

	return true
end

return var_0_0
