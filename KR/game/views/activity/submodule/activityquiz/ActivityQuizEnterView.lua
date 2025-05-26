local var_0_0 = class("ActivityQuizEnterView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return ActivityQuizTools.GetEnterUIName(arg_1_0.params_.activityID)
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:InitUI()
	arg_3_0:AddUIListeners()
end

function var_0_0.InitUI(arg_4_0)
	arg_4_0:BindCfgUI()

	arg_4_0.stateCon_ = ControllerUtil.GetController(arg_4_0.transform_, "state")
	arg_4_0.clearCon_ = ControllerUtil.GetController(arg_4_0.transform_, "clear")
	arg_4_0.scrollHelper_ = LuaList.New(handler(arg_4_0, arg_4_0.IndexItem), arg_4_0.listGo_, ActivityQuizTaskItem)
end

function var_0_0.IndexItem(arg_5_0, arg_5_1, arg_5_2)
	arg_5_2:Refresh(arg_5_0.list_[arg_5_1], arg_5_0.activityID_)

	local var_5_0 = manager.time:GetServerTime()

	arg_5_2:RefreshTime(var_5_0)
end

function var_0_0.AddUIListeners(arg_6_0)
	arg_6_0:AddBtnListener(arg_6_0.startBtn_, nil, function()
		if arg_6_0:IsActivitying() and arg_6_0:IsOpenTime() then
			ActivityQuizAction.StartMarch()
		end
	end)
	arg_6_0:AddBtnListener(arg_6_0.allReceiveBtn_, nil, function()
		local var_8_0 = {}

		for iter_8_0, iter_8_1 in ipairs(arg_6_0.list_) do
			local var_8_1 = iter_8_1.id
			local var_8_2 = AssignmentCfg[var_8_1]

			if iter_8_1.complete_flag < 1 and iter_8_1.progress >= var_8_2.need then
				table.insert(var_8_0, var_8_1)
			end
		end

		TaskAction:SubmitTaskList(var_8_0)
	end)
	arg_6_0:AddBtnListener(arg_6_0.tipBtn_, nil, function()
		local var_9_0 = ActivityQuizTools.GetHelpKey(arg_6_0.activityID_)

		if var_9_0 ~= "" then
			JumpTools.OpenPageByJump("gameHelp", {
				icon = "icon_i",
				iconColor = Color(1, 1, 1),
				title = GetTips("STAGE_DESCRIPE"),
				content = GetTips(var_9_0),
				key = var_9_0
			})
		end
	end)
end

function var_0_0.OnEnter(arg_10_0)
	arg_10_0.activityID_ = arg_10_0.params_.activityID

	arg_10_0:RefreshUI()
	arg_10_0:RegistEventListener(OSIRIS_TASK_UPDATE, handler(arg_10_0, arg_10_0.RefreshTask))

	if arg_10_0:IsOpenTime() then
		manager.redPoint:setTip(RedPointConst.ACTIVITY_QUIZ_OPEN .. "_" .. arg_10_0.activityID_, 0)
		saveData("activity_quiz_enter", tostring(arg_10_0.activityID_), manager.time:GetServerTime())
	end
end

function var_0_0.RefreshUI(arg_11_0)
	arg_11_0:RefreshActivityData()
	arg_11_0:RefreshTime()
	arg_11_0:RefreshTask()
end

function var_0_0.RefreshActivityData(arg_12_0)
	arg_12_0.activityData_ = ActivityData:GetActivityData(arg_12_0.activityID_)
	arg_12_0.startTime_ = arg_12_0.activityData_.startTime
	arg_12_0.stopTime_ = arg_12_0.activityData_.stopTime

	local var_12_0 = GameSetting.activity_quiz_open_time.value

	arg_12_0.openTbl_, arg_12_0.closeTbl_ = var_12_0[1], var_12_0[2]
	arg_12_0.dayOpen_.text = string.format("%02d:%02d-%02d:%02d", arg_12_0.openTbl_[1], arg_12_0.openTbl_[2], arg_12_0.closeTbl_[1], arg_12_0.closeTbl_[2])
end

function var_0_0.RefreshTime(arg_13_0)
	local var_13_0 = manager.time:GetServerTime()

	arg_13_0:StopTimer()

	if var_13_0 < arg_13_0.startTime_ then
		arg_13_0.stateCon_:SetSelectedState("close")

		arg_13_0.timeLable_.text = GetTips("SOLO_NOT_OPEN")
		arg_13_0.timer_ = Timer.New(function()
			if arg_13_0.startTime_ <= manager.time:GetServerTime() then
				arg_13_0:StopTimer()
				arg_13_0:RefreshTime()

				return
			end
		end, 1, -1)

		arg_13_0.timer_:Start()
	elseif var_13_0 < arg_13_0.stopTime_ then
		arg_13_0.stateCon_:SetSelectedState(arg_13_0:IsOpenTime() and "unlock" or "close")

		arg_13_0.timeLable_.text = manager.time:GetLostTimeStr2(arg_13_0.stopTime_)
		arg_13_0.timer_ = Timer.New(function()
			var_13_0 = manager.time:GetServerTime()

			if arg_13_0.stopTime_ <= var_13_0 then
				arg_13_0:StopTimer()
				arg_13_0:RefreshTime()

				return
			else
				arg_13_0.stateCon_:SetSelectedState(arg_13_0:IsOpenTime() and "unlock" or "close")

				arg_13_0.timeLable_.text = manager.time:GetLostTimeStr2(arg_13_0.stopTime_)
			end
		end, 1, -1)

		arg_13_0.timer_:Start()
	else
		arg_13_0.timeLable_.text = GetTips("TIME_OVER")

		arg_13_0.stateCon_:SetSelectedState("close")
	end
end

function var_0_0.StopTimer(arg_16_0)
	if arg_16_0.timer_ then
		arg_16_0.timer_:Stop()

		arg_16_0.timer_ = nil
	end
end

function var_0_0.RefreshTask(arg_17_0)
	local var_17_0 = ActivityQuizTools.GetTaskActivityID(arg_17_0.activityID_)
	local var_17_1 = ActivityData:GetActivityData(var_17_0).subActivityIdList

	arg_17_0.list_ = {}

	local var_17_2 = {}
	local var_17_3 = {}
	local var_17_4 = TaskTools:GetActivityTaskList(var_17_0) or {}

	for iter_17_0, iter_17_1 in pairs(var_17_4) do
		table.insert(var_17_2, iter_17_1)
	end

	for iter_17_2, iter_17_3 in ipairs(var_17_1) do
		if ActivityData:GetActivityData(iter_17_3):IsActivitying() then
			local var_17_5 = TaskTools:GetActivityTaskList(iter_17_3) or {}

			for iter_17_4, iter_17_5 in pairs(var_17_5) do
				table.insert(var_17_2, iter_17_5)
			end
		else
			local var_17_6 = AssignmentCfg.get_id_list_by_activity_id[iter_17_3]

			for iter_17_6, iter_17_7 in ipairs(var_17_6) do
				local var_17_7 = TaskData2:ParserData({
					complete_flag = 0,
					progress = 0,
					id = iter_17_7
				})

				table.insert(var_17_3, var_17_7)
			end
		end
	end

	local var_17_8 = {}
	local var_17_9 = {}
	local var_17_10 = {}

	for iter_17_8, iter_17_9 in pairs(var_17_2) do
		local var_17_11 = iter_17_9.id
		local var_17_12 = AssignmentCfg[var_17_11]

		if iter_17_9.complete_flag >= 1 then
			table.insert(var_17_10, iter_17_9)
		elseif iter_17_9.progress >= var_17_12.need then
			table.insert(var_17_8, iter_17_9)
		else
			table.insert(var_17_9, iter_17_9)
		end
	end

	local function var_17_13(arg_18_0, arg_18_1)
		local var_18_0 = AssignmentCfg[arg_18_0.id]
		local var_18_1 = AssignmentCfg[arg_18_1.id]

		if var_18_0.type ~= var_18_1.type then
			return var_18_0.type < var_18_1.type
		end

		return arg_18_0.id < arg_18_1.id
	end

	table.sort(var_17_8, var_17_13)
	table.sort(var_17_9, var_17_13)
	table.sort(var_17_10, var_17_13)
	table.sort(var_17_3, var_17_13)
	table.insertto(arg_17_0.list_, var_17_8)
	table.insertto(arg_17_0.list_, var_17_9)
	table.insertto(arg_17_0.list_, var_17_10)
	table.insertto(arg_17_0.list_, var_17_3)
	arg_17_0.scrollHelper_:StartScroll(#arg_17_0.list_)

	if #var_17_8 > 0 then
		arg_17_0.clearCon_:SetSelectedState("true")
	else
		arg_17_0.clearCon_:SetSelectedState("false")
	end

	arg_17_0:StartTaskTimer()
end

function var_0_0.StartTaskTimer(arg_19_0)
	arg_19_0:StopTaskTimer()

	arg_19_0.taskTimer_ = Timer.New(function()
		local var_20_0 = manager.time:GetServerTime()

		for iter_20_0, iter_20_1 in ipairs(arg_19_0.scrollHelper_:GetItemList()) do
			iter_20_1:RefreshTime(var_20_0)
		end
	end, 1, -1)

	arg_19_0.taskTimer_:Start()
end

function var_0_0.StopTaskTimer(arg_21_0)
	if arg_21_0.taskTimer_ then
		arg_21_0.taskTimer_:Stop()

		arg_21_0.taskTimer_ = nil
	end
end

function var_0_0.IsActivitying(arg_22_0)
	local var_22_0 = manager.time:GetServerTime()

	if var_22_0 < arg_22_0.startTime_ then
		local var_22_1 = GetTips("OPEN_TIME")

		ShowTips(string.format(var_22_1, manager.time:GetLostTimeStr2(arg_22_0.startTime_, nil, true)))

		return false
	end

	if var_22_0 >= arg_22_0.stopTime_ then
		ShowTips("TIME_OVER")

		return false
	end

	return true
end

function var_0_0.IsOpenTime(arg_23_0)
	local var_23_0 = manager.time:GetServerTime()
	local var_23_1 = tonumber(manager.time:STimeDescS(var_23_0, "!%Y"))
	local var_23_2 = tonumber(manager.time:STimeDescS(var_23_0, "!%m"))
	local var_23_3 = tonumber(manager.time:STimeDescS(var_23_0, "!%d"))
	local var_23_4 = {
		year = var_23_1,
		month = var_23_2,
		day = var_23_3,
		hour = arg_23_0.openTbl_[1],
		min = arg_23_0.openTbl_[2],
		sec = arg_23_0.openTbl_[3]
	}
	local var_23_5 = {
		year = var_23_1,
		month = var_23_2,
		day = var_23_3,
		hour = arg_23_0.closeTbl_[1],
		min = arg_23_0.closeTbl_[2],
		sec = arg_23_0.closeTbl_[3]
	}
	local var_23_6 = manager.time:Table2ServerTime(var_23_4)
	local var_23_7 = manager.time:Table2ServerTime(var_23_5)

	if var_23_6 <= var_23_0 and var_23_0 < var_23_7 then
		return true
	end

	return false
end

function var_0_0.OnActivityQuizStartMarch(arg_24_0)
	ActivityQuizTools.SetCurActivityID(arg_24_0.activityID_)
	JumpTools.OpenPageByJump("activityQuizMatchPop", {
		activityId = arg_24_0.activityID_
	})
end

function var_0_0.OnTop(arg_25_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR
	})
end

function var_0_0.OnExit(arg_26_0)
	arg_26_0:StopTimer()
	arg_26_0:StopTaskTimer()

	for iter_26_0, iter_26_1 in pairs(arg_26_0.scrollHelper_:GetItemList()) do
		iter_26_1:OnExit()
	end
end

function var_0_0.Dispose(arg_27_0)
	arg_27_0:RemoveAllListeners()

	for iter_27_0, iter_27_1 in pairs(arg_27_0.scrollHelper_:GetItemList()) do
		iter_27_1:Dispose()
	end

	arg_27_0.scrollHelper_:Dispose()
	arg_27_0.super.Dispose(arg_27_0)
end

return var_0_0
