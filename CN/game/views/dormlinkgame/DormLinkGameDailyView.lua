ActivityMainBasePanel = import("game.views.activity.Main.toggle.ActivityMainBasePanel")

local var_0_0 = class("DormLinkGameDailyView", ActivityMainBasePanel)

function var_0_0.GetUIName(arg_1_0)
	return DormLinkGameTools:GetMainUIName(arg_1_0.activityID_)
end

function var_0_0.Init(arg_2_0)
	arg_2_0:InitUI()
	arg_2_0:AddUIListener()
end

function var_0_0.InitUI(arg_3_0)
	arg_3_0:BindCfgUI()

	arg_3_0.scrollHelper_ = LuaList.New(handler(arg_3_0, arg_3_0.indexDailyItemList), arg_3_0.listGo_, DormLinkGameDailyItem)
	arg_3_0.clearCon_ = ControllerUtil.GetController(arg_3_0.taskRect_, "clear")
	arg_3_0.stateCon_ = ControllerUtil.GetController(arg_3_0.transform_, "state")
end

function var_0_0.indexDailyItemList(arg_4_0, arg_4_1, arg_4_2)
	arg_4_2:RefreshUI(arg_4_0.list_[arg_4_1], arg_4_0.activityID_)
end

function var_0_0.AddUIListener(arg_5_0)
	arg_5_0:AddBtnListenerScale(arg_5_0.goBtn_, nil, function()
		JumpTools.OpenPageByJump("/dormLinkGameLevelView", {
			activityID_ = arg_5_0.activityID_
		})
	end)
	arg_5_0:AddBtnListenerScale(arg_5_0.allReceiveBtn_, nil, function()
		local var_7_0 = {}
		local var_7_1 = DormLinkGameTools:GetTaskActivityID(arg_5_0.activityID_)

		for iter_7_0, iter_7_1 in ipairs(arg_5_0.list_) do
			local var_7_2 = AssignmentCfg[iter_7_1]
			local var_7_3 = TaskData2:GetTask(iter_7_1)

			if var_7_3.complete_flag < 1 and var_7_3.progress >= var_7_2.need then
				table.insert(var_7_0, iter_7_1)
			end
		end

		TaskAction:SubmitTaskList(var_7_0)
	end)
	arg_5_0:AddBtnListener(arg_5_0.tipBtn_, nil, DormLinkGameTools.OpenGameTips)
end

function var_0_0.HideRedPoint(arg_8_0)
	return
end

function var_0_0.OnEnter(arg_9_0)
	var_0_0.super.OnEnter(arg_9_0)
	arg_9_0:RefreshView()
	arg_9_0:RegisterEvents()
	manager.redPoint:bindUIandKey(arg_9_0.goBtn_.transform, DormLinkGameData:RedPointKey(DormLinkGameData.LIANLIANKAN_IN_GAME))
end

function var_0_0.UpdateBar(arg_10_0)
	local var_10_0 = DormLinkGameTools:GetCurrencyID(arg_10_0.activityID_)

	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR,
		var_10_0
	})
	manager.windowBar:SetBarCanClick(var_10_0, true)
end

function var_0_0.RegisterEvents(arg_11_0)
	arg_11_0:RegistEventListener(OSIRIS_TASK_UPDATE, function()
		arg_11_0:RefreshTask()
	end)
end

function var_0_0.RefreshView(arg_13_0)
	arg_13_0:RefreshTask()
end

function var_0_0.RefreshTask(arg_14_0)
	local var_14_0 = DormLinkGameTools:GetTaskActivityID(arg_14_0.activityID_)

	arg_14_0.list_ = {}

	local var_14_1 = TaskTools:GetActivityTaskList(var_14_0) or {}

	local function var_14_2(arg_15_0, arg_15_1)
		local var_15_0 = AssignmentCfg[arg_15_0]
		local var_15_1 = AssignmentCfg[arg_15_1]

		if var_15_0.type ~= var_15_1.type then
			return var_15_0.type < var_15_1.type
		end

		return arg_15_0 < arg_15_1
	end

	local var_14_3 = {}
	local var_14_4 = {}
	local var_14_5 = {}

	for iter_14_0, iter_14_1 in pairs(var_14_1) do
		local var_14_6 = iter_14_1.id
		local var_14_7 = AssignmentCfg[var_14_6]

		if var_14_7.activity_id == var_14_0 then
			if iter_14_1.complete_flag >= 1 then
				table.insert(var_14_5, var_14_6)
			elseif iter_14_1.progress >= var_14_7.need then
				table.insert(var_14_3, var_14_6)
			else
				table.insert(var_14_4, var_14_6)
			end
		end
	end

	table.sort(var_14_3, var_14_2)
	table.sort(var_14_4, var_14_2)
	table.sort(var_14_5, var_14_2)
	table.insertto(arg_14_0.list_, var_14_3)
	table.insertto(arg_14_0.list_, var_14_4)
	table.insertto(arg_14_0.list_, var_14_5)
	arg_14_0.scrollHelper_:StartScroll(#arg_14_0.list_)

	if #var_14_3 > 0 then
		arg_14_0.clearCon_:SetSelectedState("true")
	else
		arg_14_0.clearCon_:SetSelectedState("false")
	end
end

local function var_0_1(arg_16_0)
	local var_16_0
	local var_16_1 = manager.time:GetServerTime()
	local var_16_2 = ActivityData:GetActivityData(arg_16_0)
	local var_16_3 = var_16_2.startTime
	local var_16_4 = var_16_2.stopTime

	if var_16_1 < var_16_3 then
		return GetTips("SOLO_NOT_OPEN")
	elseif var_16_4 < var_16_1 then
		return GetTips("TIME_OVER")
	else
		return manager.time:GetLostTimeStrWith2Unit(var_16_4), true
	end
end

function var_0_0.RefreshTimeText(arg_17_0)
	arg_17_0.timeLable_.text, isActivityOpen = var_0_1(arg_17_0.activityID_)

	if isActivityOpen then
		if not ActivityTools.IsUnlockActivity(arg_17_0.activityID_) then
			arg_17_0.stateCon_:SetSelectedState("lock")
		else
			arg_17_0.stateCon_:SetSelectedState("unlock")
		end
	else
		arg_17_0.stateCon_:SetSelectedState("close")
	end

	arg_17_0.questTimeLable_.text = var_0_1(DormLinkGameTools:GetTaskActivityID(arg_17_0.activityID_))
end

function var_0_0.OnExit(arg_18_0)
	manager.redPoint:unbindUIandKey(arg_18_0.goBtn_.transform, DormLinkGameData:RedPointKey(DormLinkGameData.LIANLIANKAN_IN_GAME))
	arg_18_0:RemoveAllEventListener()
	var_0_0.super.OnExit(arg_18_0)
end

function var_0_0.Dispose(arg_19_0)
	if arg_19_0.scrollHelper_ then
		arg_19_0.scrollHelper_:Dispose()

		arg_19_0.scrollHelper_ = nil
	end

	var_0_0.super.Dispose(arg_19_0)
end

return var_0_0
