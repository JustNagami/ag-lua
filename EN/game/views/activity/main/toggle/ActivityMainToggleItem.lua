local var_0_0 = class("ActivityMainToggleItem", ReduxView)

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4, arg_1_5)
	arg_1_0.gameObject_ = Object.Instantiate(arg_1_1, arg_1_2.transform)
	arg_1_0.transform_ = arg_1_0.gameObject_.transform
	arg_1_0.toggleID_ = arg_1_3
	arg_1_0.activityID_ = arg_1_4
	arg_1_0.redPointActivityID_ = arg_1_5 or arg_1_4

	arg_1_0:BindCfgUI()
	arg_1_0:AddListeners()

	arg_1_0.controller_ = ControllerUtil.GetController(arg_1_0.transform_, "lock")
	arg_1_0.selectController_ = ControllerUtil.GetController(arg_1_0.transform_, "select")
	arg_1_0.subTitleController_ = ControllerUtil.GetController(arg_1_0.transform_, "subTitle")
	arg_1_0.updateHandler_ = handler(arg_1_0, arg_1_0.UpdateActivity)

	arg_1_0:RefreshUI()
end

function var_0_0.OnEnter(arg_2_0)
	arg_2_0.activiteData_ = ActivityData:GetActivityData(arg_2_0.activityID_)
	arg_2_0.startTime_ = arg_2_0.activiteData_.startTime

	if ActivityShopCfg[arg_2_0.activityID_] then
		local var_2_0 = ActivityShopCfg[arg_2_0.activityID_].shop_id
		local var_2_1 = ShopListCfg[var_2_0].activity_id

		arg_2_0.stopTime_ = ActivityData:GetActivityData(var_2_1).stopTime
	else
		arg_2_0.stopTime_ = arg_2_0.activiteData_.stopTime
	end

	manager.notify:RegistListener(ACTIVITY_UPDATE, arg_2_0.updateHandler_)
	manager.redPoint:bindUIandKey(arg_2_0.transform_, ActivityTools.GetRedPointKey(arg_2_0.redPointActivityID_) .. arg_2_0.redPointActivityID_)
	arg_2_0:AddTimer()
end

function var_0_0.OnExit(arg_3_0)
	manager.redPoint:unbindUIandKey(arg_3_0.transform_, ActivityTools.GetRedPointKey(arg_3_0.redPointActivityID_) .. arg_3_0.redPointActivityID_)
	manager.notify:RemoveListener(ACTIVITY_UPDATE, arg_3_0.updateHandler_)
	arg_3_0:StopTimer()
end

function var_0_0.Dispose(arg_4_0)
	var_0_0.super.Dispose(arg_4_0)

	arg_4_0.updateHandler_ = nil

	Object.Destroy(arg_4_0.gameObject_)

	arg_4_0.gameObject_ = nil
end

function var_0_0.AddListeners(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.button_, nil, function()
		if manager.time:GetServerTime() < arg_5_0.startTime_ then
			local var_6_0 = GetTips("OPEN_TIME")

			ShowTips(string.format(var_6_0, manager.time:GetLostTimeStr(arg_5_0.startTime_)))

			return
		end

		if manager.time:GetServerTime() >= arg_5_0.stopTime_ then
			ShowTips("TIME_OVER")

			return
		end

		manager.notify:Invoke(ACTIVITY_MAIN_TOGGLE_CLICK, arg_5_0.activityID_)
	end)
end

function var_0_0.SdkRecord(arg_7_0)
	local var_7_0 = getData("activity_last_click", "activity_" .. arg_7_0.activityID_) or 0

	if not manager.time:IsToday(var_7_0) then
		OperationRecorder.RecordButtonTouch("activity_homepage_" .. arg_7_0.activityID_)

		local var_7_1 = manager.time:GetServerTime()

		saveData("activity_last_click", "activity_" .. arg_7_0.activityID_, var_7_1)
	end
end

function var_0_0.OnSelect(arg_8_0, arg_8_1)
	arg_8_0.selectController_:SetSelectedState(tostring(arg_8_1))

	if arg_8_1 then
		ActivityRedPoint:CancelSubActivityNewTag(arg_8_0.activityID_)
	end

	if arg_8_1 then
		arg_8_0:SdkRecord()
	end
end

function var_0_0.RefreshLock(arg_9_0)
	local var_9_0 = manager.time:GetServerTime() < arg_9_0.startTime_
	local var_9_1 = manager.time:GetServerTime() >= arg_9_0.stopTime_

	if arg_9_0.controller_ then
		if var_9_1 then
			arg_9_0.controller_:SetSelectedState("end")
		else
			arg_9_0.controller_:SetSelectedState(tostring(var_9_0))
		end
	end

	if var_9_0 or var_9_1 then
		if arg_9_0.gameObject_.activeSelf == true then
			SetActive(arg_9_0.gameObject_, false)
		end
	elseif arg_9_0.gameObject_.activeSelf == false then
		SetActive(arg_9_0.gameObject_, true)
	end
end

function var_0_0.RefreshTime(arg_10_0)
	if arg_10_0.textTime_ then
		arg_10_0.textTime_.text = manager.time:GetLostTimeStr(arg_10_0.stopTime_)
	end
end

function var_0_0.UpdateActivity(arg_11_0, arg_11_1)
	local var_11_0 = arg_11_0:GetTempActivityID()

	if var_11_0 == arg_11_1 then
		local var_11_1 = ActivityData:GetActivityData(var_11_0)

		arg_11_0.startTime_ = var_11_1.startTime
		arg_11_0.stopTime_ = var_11_1.stopTime

		arg_11_0:AddTimer()
	end
end

function var_0_0.GetTempActivityID(arg_12_0)
	if ActivityShopCfg[arg_12_0.activityID_] then
		local var_12_0 = ActivityShopCfg[arg_12_0.activityID_].shop_id

		return ShopListCfg[var_12_0].activity_id
	end

	return arg_12_0.activityID_
end

function var_0_0.AddTimer(arg_13_0)
	arg_13_0:StopTimer()
	arg_13_0:RefreshLock()
	arg_13_0:RefreshTime()

	local var_13_0 = manager.time:GetServerTime() < arg_13_0.startTime_

	if manager.time:GetServerTime() >= arg_13_0.stopTime_ then
		manager.notify:Invoke(ACTIVITY_MAIN_TOGGLE_OVER, arg_13_0.activityID_)

		return
	end

	arg_13_0.timer_ = Timer.New(function()
		local var_14_0 = manager.time:GetServerTime()

		if var_13_0 and var_14_0 > arg_13_0.startTime_ then
			arg_13_0:RefreshLock()

			var_13_0 = false
		elseif var_14_0 >= arg_13_0.stopTime_ then
			arg_13_0:RefreshLock()
			arg_13_0:StopTimer()
			manager.notify:Invoke(ACTIVITY_MAIN_TOGGLE_OVER, arg_13_0.activityID_)

			return
		end

		arg_13_0:RefreshTime()
	end, 1, -1)

	arg_13_0.timer_:Start()
end

function var_0_0.StopTimer(arg_15_0)
	if arg_15_0.timer_ then
		arg_15_0.timer_:Stop()

		arg_15_0.timer_ = nil
	end
end

function var_0_0.RefreshUI(arg_16_0)
	local var_16_0 = ActivityToggleCfg[arg_16_0.toggleID_]
	local var_16_1 = var_16_0.sub_title_type

	if var_16_1 == 0 then
		arg_16_0.subTitleController_:SetSelectedState("false")
	else
		arg_16_0.subTitleController_:SetSelectedState("true")

		if var_16_1 == 1 then
			arg_16_0.subTitleText_.text = GetTips("MAIN_PLOT_TEXT")
		elseif var_16_1 == 2 then
			arg_16_0.subTitleText_.text = GetTips("SUB_PLOT_TEXT")
		end
	end

	arg_16_0.nameText_.text = GetI18NText(var_16_0.name)
	arg_16_0.iconImage_.sprite = getSpriteWithoutAtlas("TextureConfig/VersionUI/ActivityiconUI/" .. var_16_0.icon)
end

function var_0_0.Show(arg_17_0, arg_17_1)
	SetActive(arg_17_0.gameObject_, arg_17_1)
end

return var_0_0
