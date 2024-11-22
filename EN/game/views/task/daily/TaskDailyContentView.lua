local var_0_0 = class("TaskDailyContentView", ReduxView)

function var_0_0.OnCtor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_0.gameObject_.transform
	arg_1_0.taskType_ = arg_1_2
	arg_1_0.pointType_ = arg_1_3
	arg_1_0.isShow = false

	arg_1_0:InitUI()

	arg_1_0.giftItems_ = {}
end

function var_0_0.InitUI(arg_2_0)
	arg_2_0:BindCfgUI()

	arg_2_0.scrollHelper_ = LuaList.New(handler(arg_2_0, arg_2_0.indexItem), arg_2_0.scrollView_, TaskDailyItemView)
	arg_2_0.receiveBtnController_ = ControllerUtil.GetController(arg_2_0.transform_, "receiveBtn_all")
	arg_2_0.rectTrans = arg_2_0.scrollView_:GetComponent(typeof(RectTransform))
end

function var_0_0.Init(arg_3_0)
	arg_3_0:GetTaskIDList()

	arg_3_0._finishList = TaskTools:GetFinishTaskIds(arg_3_0.taskType_)

	arg_3_0:RefreshActivityPoint()
	arg_3_0:RefreshTimeText()
	arg_3_0:RefreshGiftItems()
	arg_3_0:RefreshRecivedAll()
end

function var_0_0.GetTaskIDList(arg_4_0)
	arg_4_0._taskIDList = TaskData2:GetTypedTaskSortListCommonFilter(arg_4_0.taskType_)

	arg_4_0:ProcessTaskIDList()
end

function var_0_0.ProcessTaskIDList(arg_5_0)
	if SDKTools.GetIsJapan() or SDKTools.GetIsEnglish() then
		local var_5_0 = {}

		for iter_5_0, iter_5_1 in ipairs(arg_5_0._taskIDList) do
			if iter_5_1.id ~= 6014 then
				var_5_0[#var_5_0 + 1] = iter_5_1
			end
		end

		arg_5_0._taskIDList = var_5_0
	end
end

function var_0_0.RefreshScroll(arg_6_0, arg_6_1)
	arg_6_0:UpdateData()

	if arg_6_1 then
		if arg_6_0.lastPosition_ then
			local var_6_0 = clone(arg_6_0.lastPosition_)
			local var_6_1

			var_6_1 = FrameTimer.New(function()
				if isNil(arg_6_0.gameObject_) then
					return
				end

				arg_6_0.scrollHelper_:StartScrollWithoutAnimator(#arg_6_0._taskIDList, var_6_0)
				var_6_1:Stop()

				var_6_1 = nil
			end, 1, 1)

			var_6_1:Start()
		else
			arg_6_0.scrollHelper_:StartScrollWithoutAnimator(#arg_6_0._taskIDList)
		end
	else
		arg_6_0.scrollHelper_:StartScroll(#arg_6_0._taskIDList)
	end
end

function var_0_0.indexItem(arg_8_0, arg_8_1, arg_8_2)
	local var_8_0 = arg_8_0._taskIDList[arg_8_1].id

	arg_8_2:ReEnter(var_8_0)
end

function var_0_0.Show(arg_9_0, arg_9_1, arg_9_2)
	if arg_9_0.isShow == arg_9_1 then
		return
	end

	arg_9_0.isShow = arg_9_1

	if arg_9_1 and (not arg_9_2 or true) then
		arg_9_0:OnEnter()
	else
		arg_9_0:OnExit(true)
	end
end

function var_0_0.OnEnter(arg_10_0)
	arg_10_0.isShow = true

	arg_10_0:Init()
	arg_10_0:OnTaskListChange(true)
	SetActive(arg_10_0.gameObject_, true)
end

function var_0_0.OnExit(arg_11_0, arg_11_1)
	arg_11_0.isShow = false

	if arg_11_0.dailyTimer_ then
		arg_11_0.dailyTimer_:Stop()

		arg_11_0.dailyTimer_ = nil
	end

	if not arg_11_1 then
		arg_11_0.lastPosition_ = arg_11_0.scrollHelper_:GetScrolledPosition()
	end

	SetActive(arg_11_0.gameObject_, false)
end

function var_0_0.ClearCache(arg_12_0)
	arg_12_0.lastPosition_ = nil
end

function var_0_0.Dispose(arg_13_0)
	arg_13_0.scrollHelper_:Dispose()

	if arg_13_0.giftItems_ then
		for iter_13_0, iter_13_1 in pairs(arg_13_0.giftItems_) do
			iter_13_1:Dispose()
		end
	end

	if arg_13_0.dailyTimer_ then
		arg_13_0.dailyTimer_:Stop()

		arg_13_0.dailyTimer_ = nil
	end

	arg_13_0.giftItems_ = nil
	arg_13_0.rectTrans = nil

	var_0_0.super.Dispose(arg_13_0)
end

function var_0_0.UpdateData(arg_14_0)
	arg_14_0:GetTaskIDList()
end

function var_0_0.OnTaskListChange(arg_15_0, arg_15_1)
	if arg_15_0.isShow then
		arg_15_0._finishList = TaskTools:GetFinishTaskIds(arg_15_0.taskType_)

		arg_15_0:RefreshRecivedAll()

		if not arg_15_1 then
			arg_15_0:RefreshScroll(true)
		else
			arg_15_0:RefreshScroll(false)
		end

		arg_15_0.lastPosition_ = nil
	end
end

function var_0_0.OnSubActivityPtUpdate(arg_16_0)
	if arg_16_0.isShow then
		for iter_16_0, iter_16_1 in pairs(arg_16_0.giftItems_) do
			iter_16_1:RefreshGift()
		end

		arg_16_0:RefreshActivityPoint()
		arg_16_0:RefreshRecivedAll()
	end
end

function var_0_0.RefreshActivityPoint(arg_17_0)
	local var_17_0 = ActivityPtData:GetCurrentActivityPt(arg_17_0.pointType_)
	local var_17_1 = ActivityPtCfg[arg_17_0.pointType_].target[#ActivityPtCfg[arg_17_0.pointType_].target]

	arg_17_0.ptNumberText_.text = var_17_0 or 0
	arg_17_0.ptprogressbarImg_.value = Mathf.Clamp(var_17_0 / var_17_1, 0, 1)
end

function var_0_0.RefreshTimeText(arg_18_0)
	local var_18_0 = GameSetting.refresh_time1.value[1][1]
	local var_18_1 = TimeMgr.GetInstance():GetNextTime(var_18_0, 0, 0)
	local var_18_2 = var_18_1 - TimeMgr.GetInstance():GetServerTime()

	arg_18_0.timeText_.text = string.format(GetTips("TIME_DISPLAY_1"), arg_18_0:GetTimeText(var_18_2))

	if arg_18_0.dailyTimer_ then
		arg_18_0.dailyTimer_:Stop()
	end

	arg_18_0.dailyTimer_ = Timer.New(function()
		var_18_2 = var_18_1 - TimeMgr.GetInstance():GetServerTime()

		if var_18_2 < 0 then
			local var_19_0 = GameSetting.refresh_time1.value[1][1]

			var_18_2 = TimeMgr.GetInstance():GetNextTime(var_19_0, 0, 0) - TimeMgr.GetInstance():GetServerTime()
		end

		arg_18_0.timeText_.text = string.format(GetTips("TIME_DISPLAY_1"), arg_18_0:GetTimeText(var_18_2))
	end, 1, -1)

	arg_18_0.dailyTimer_:Start()
end

function var_0_0.RefreshGiftItems(arg_20_0)
	for iter_20_0, iter_20_1 in ipairs(ActivityPtCfg[arg_20_0.pointType_].target) do
		if arg_20_0.giftItems_[iter_20_0] then
			arg_20_0.giftItems_[iter_20_0]:SetIndex(iter_20_0)
		else
			arg_20_0.giftItems_[iter_20_0] = TaskDailyGiftItem.New(arg_20_0.ptGiftItem_, arg_20_0.ptGiftParent_, iter_20_0, arg_20_0.pointType_)
		end
	end
end

function var_0_0.IsGiftCanReceive(arg_21_0)
	local var_21_0 = ActivityPtCfg[arg_21_0.pointType_]

	for iter_21_0 = 1, #var_21_0.target do
		local var_21_1 = TaskTools.ActivityPtIsReceived(arg_21_0.pointType_, iter_21_0)
		local var_21_2 = TaskTools.ActivityPtCanReceive(arg_21_0.pointType_, iter_21_0)

		if not var_21_1 and var_21_2 then
			return true
		end
	end
end

function var_0_0.RefreshRecivedAll(arg_22_0)
	if #arg_22_0._finishList > 0 or arg_22_0:IsGiftCanReceive() then
		arg_22_0:RefreshOnceState(true)
	else
		arg_22_0:RefreshOnceState(false)
	end
end

function var_0_0.GetTimeText(arg_23_0, arg_23_1)
	local var_23_0 = math.ceil(arg_23_1 / 3600 / 24)
	local var_23_1 = math.floor(arg_23_1 / 3600)
	local var_23_2 = math.floor(arg_23_1 / 60 % 60)
	local var_23_3 = math.floor(arg_23_1 % 60)

	if var_23_0 > 1 then
		return var_23_0 .. GetTips("DAY")
	end

	if var_23_3 < 10 then
		var_23_3 = "0" .. var_23_3
	end

	if var_23_2 < 10 then
		var_23_2 = "0" .. var_23_2
	end

	if var_23_1 < 10 then
		var_23_1 = "0" .. var_23_1
	end

	return table.concat({
		var_23_1,
		":",
		var_23_2,
		":",
		var_23_3
	})
end

function var_0_0.RegisterRefreshOnceStateCallback(arg_24_0, arg_24_1)
	arg_24_0.refreshOnceCallback = arg_24_1
end

function var_0_0.RefreshOnceState(arg_25_0, arg_25_1)
	if arg_25_0.refreshOnceCallback then
		arg_25_0.refreshOnceCallback(arg_25_1)
	end

	local var_25_0 = arg_25_0.rectTrans.offsetMin.x

	if arg_25_1 then
		arg_25_0.rectTrans.offsetMin = Vector2.New(var_25_0, 70)
	else
		arg_25_0.rectTrans.offsetMin = Vector2.New(var_25_0, 0)
	end
end

function var_0_0.OnOnceClick(arg_26_0)
	TaskAction:SubmitTaskList(TaskTools:GetFinishTaskIds(arg_26_0.taskType_), arg_26_0.taskType_)
end

return var_0_0
