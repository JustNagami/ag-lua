local var_0_0 = class("CombineGameMainView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "UI/VersionUI/IndiaUI_2_8/IndiaKf/IndiaKfModeUI_2"
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

	arg_4_0.dailyController = ControllerUtil.GetController(arg_4_0.dailyGo_.transform, "daily")
	arg_4_0.endlessController = ControllerUtil.GetController(arg_4_0.endlessGo_.transform, "endless")
	arg_4_0.rewardController = ControllerUtil.GetController(arg_4_0.dailyGo_.transform, "reward")
	arg_4_0.commonItem = CommonItem.New(arg_4_0.commonGo_)
end

function var_0_0.AddUIListener(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.poolBtn_, nil, function()
		JumpTools.GoToSystem("/CombineGamePoolView")
	end)
	arg_5_0:AddBtnListener(arg_5_0.taskBtn_, nil, function()
		JumpTools.GoToSystem("CombineGameTaskView")
	end)
	arg_5_0:AddBtnListener(arg_5_0.factorBtn_, nil, function()
		JumpTools.GoToSystem("CombineGameWatchFactorView", {
			id = arg_5_0.endlessId
		})
	end)
	arg_5_0:AddBtnListener(arg_5_0.roleBtn_, nil, function()
		JumpTools.GoToSystem("CombineGameRoleView", {
			lv = 999
		})
	end)
	arg_5_0:AddBtnListener(arg_5_0.tutorialBtn_, nil, function()
		JumpTools.GoToSystem("/CombineGameTeachView")
	end)
	arg_5_0:AddBtnListener(arg_5_0.dailyBtn_, nil, function()
		if arg_5_0.isLock then
			ShowTips(string.format(GetTips("ACTIVITY_COMBINE_GAME_OPEN_LIMIT_TIPS"), GetI18NText(ActivityCombineLevelCfg[arg_5_0.idList[1]].name)))

			return
		end

		JumpTools.GoToSystem("/CombineGameDailyView")
	end)
	arg_5_0:AddBtnListener(arg_5_0.endlessBtn_, nil, function()
		if arg_5_0.isLock then
			ShowTips(string.format(GetTips("ACTIVITY_COMBINE_GAME_OPEN_LIMIT_TIPS"), GetI18NText(ActivityCombineLevelCfg[arg_5_0.idList[1]].name)))

			return
		end

		JumpTools.GoToSystem("/CombineGameEndlessView")
	end)
	arg_5_0:AddBtnListener(arg_5_0.tipsBtn_, nil, function()
		local var_13_0 = GetTips("ACTIVITY_COMBINE_GAME_DESC")

		JumpTools.OpenPageByJump("gameHelp", {
			icon = "icon_i",
			iconColor = Color(1, 1, 1),
			title = GetTips("STAGE_DESCRIPE"),
			content = var_13_0
		})
	end)
	arg_5_0.commonItem:RegistCallBack(function(arg_14_0)
		ShowPopItem(POP_ITEM, {
			arg_14_0.id
		})
	end)
end

function var_0_0.OnEnter(arg_15_0)
	arg_15_0.activityId = CombineGameData:GetDataByPara("activityId")

	if not ActivityData:GetActivityIsOpen(arg_15_0.activityId) then
		gameContext:Go("/home", nil, nil, true)
		ShowTips("TIME_OVER")

		return
	end

	arg_15_0:UpdateView()
	arg_15_0:BindRedPoint()
end

function var_0_0.UpdateView(arg_16_0)
	local var_16_0 = ActivityData:GetActivityData(CombineGameData:GetDataByPara("activityId"))

	arg_16_0.startTime_ = var_16_0.startTime
	arg_16_0.stopTime_ = var_16_0.stopTime
	arg_16_0.remainTime_.text = manager.time:GetLostTimeStr2(arg_16_0.stopTime_, nil, true)
	arg_16_0.timer_ = Timer.New(function()
		arg_16_0.remainTime_.text = manager.time:GetLostTimeStr2(arg_16_0.stopTime_, nil, true)
	end, 1, -1)

	arg_16_0.timer_:Start()

	arg_16_0.idList = {}

	for iter_16_0, iter_16_1 in ipairs(ActivityCombineLevelCfg.all) do
		local var_16_1 = ActivityCombineLevelCfg[iter_16_0]

		if var_16_1.type == CombineGameConst.TypeConst.TEACH then
			table.insert(arg_16_0.idList, iter_16_0)
		end

		if var_16_1.type == CombineGameConst.TypeConst.ENDLESS then
			arg_16_0.endlessId = iter_16_0
		end
	end

	local var_16_2 = CombineGameData:GetDataByPara("stageDataTable")

	arg_16_0.isLock = false

	for iter_16_2, iter_16_3 in ipairs(arg_16_0.idList) do
		if var_16_2[iter_16_3] ~= true then
			arg_16_0.isLock = true
		end
	end

	arg_16_0.id = CombineGameData:GetDataByPara("nowDay")
	arg_16_0.cfg = ActivityCombineLevelCfg[arg_16_0.id]

	local var_16_3 = arg_16_0.cfg.reward_list
	local var_16_4 = CombineGameData:GetDataByPara("stageDataTable")[arg_16_0.id]

	arg_16_0.commonItem:RefreshData({
		id = var_16_3[1][1],
		number = var_16_3[1][2]
	})
	arg_16_0.dailyController:SetSelectedState(arg_16_0.isLock and "false" or "true")
	arg_16_0.endlessController:SetSelectedState(arg_16_0.isLock and "false" or "true")
	arg_16_0.rewardController:SetSelectedState(var_16_4 and "true" or "false")

	arg_16_0.techTxt_.text = GetTips("ACTIVITY_COMBINE_GAME_MODE_NAME_1")
	arg_16_0.dailyTxt_.text = GetTips("ACTIVITY_COMBINE_GAME_MODE_NAME_2")
	arg_16_0.endlessTxt_.text = GetTips("ACTIVITY_COMBINE_GAME_MODE_NAME_3")
	arg_16_0.poolTxt_.text = GetTips("ACTIVITY_COMBINE_GAME_POOL_NAME")
	arg_16_0.factorTxt_.text = GetTips("ACTIVITY_COMBINE_GAME_FACTOR")
	arg_16_0.titleName_.text = GetTips("ACTIVITY_COMBINE_GAME_NAME")
	arg_16_0.titleDesc_.text = GetTips("ACTIVITY_COMBINE_GAME_CONTENT")
	arg_16_0.dailyLockTxt_.text = string.format(GetTips("ACTIVITY_COMBINE_GAME_OPEN_LIMIT_TIPS"), GetI18NText(ActivityCombineLevelCfg[arg_16_0.idList[1]].name))
	arg_16_0.endlessLockTxt_.text = string.format(GetTips("ACTIVITY_COMBINE_GAME_OPEN_LIMIT_TIPS"), GetI18NText(ActivityCombineLevelCfg[arg_16_0.idList[1]].name))
end

function var_0_0.BindRedPoint(arg_18_0)
	manager.redPoint:bindUIandKey(arg_18_0.dailyBtn_.transform, string.format("%s%s_DAILY", ActivityTools.GetRedPointKey(arg_18_0.activityId), arg_18_0.activityId), {
		x = 360,
		y = 225
	})
	manager.redPoint:bindUIandKey(arg_18_0.tutorialBtn_.transform, string.format("%s%s_TEACH", ActivityTools.GetRedPointKey(arg_18_0.activityId), arg_18_0.activityId), {
		x = 170,
		y = 225
	})
	manager.redPoint:bindUIandKey(arg_18_0.poolBtn_.transform, RedPointConst.ACTIVITY_SPRING_COMBINE_GAME_POOL, {
		x = 110,
		y = 35
	})
	manager.redPoint:bindUIandKey(arg_18_0.taskBtn_.transform, string.format("%s_%s", RedPointConst.ACTIVITY_TASK, ActivityConst.SPRING_FESTIVAL_ACTIVITY_V2_COMBINE_GAME_TASK), {
		x = 110,
		y = 35
	})
end

function var_0_0.UnbindRedPoint(arg_19_0)
	manager.redPoint:unbindUIandKey(arg_19_0.dailyBtn_.transform, string.format("%s%s_DAILY", ActivityTools.GetRedPointKey(arg_19_0.activityId), arg_19_0.activityId))
	manager.redPoint:unbindUIandKey(arg_19_0.tutorialBtn_.transform, string.format("%s%s_TEACH", ActivityTools.GetRedPointKey(arg_19_0.activityId), arg_19_0.activityId))
	manager.redPoint:unbindUIandKey(arg_19_0.poolBtn_.transform, RedPointConst.ACTIVITY_SPRING_COMBINE_GAME_POOL)
	manager.redPoint:unbindUIandKey(arg_19_0.taskBtn_.transform, string.format("%s_%s", RedPointConst.ACTIVITY_TASK, ActivityConst.SPRING_FESTIVAL_ACTIVITY_V2_COMBINE_GAME_TASK))
end

function var_0_0.OnCombineGameRefresh(arg_20_0)
	arg_20_0.id = CombineGameData:GetDataByPara("nowDay")

	arg_20_0:UpdateView()
end

function var_0_0.OnExit(arg_21_0)
	if arg_21_0.timer_ then
		arg_21_0.timer_:Stop()

		arg_21_0.timer_ = nil
	end

	arg_21_0:UnbindRedPoint()
	manager.windowBar:HideBar()
end

function var_0_0.OnTop(arg_22_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR
	})
end

function var_0_0.Dispose(arg_23_0)
	arg_23_0.commonItem:Dispose()
	var_0_0.super.Dispose(arg_23_0)
	Object.Destroy(arg_23_0.gameObject_)
end

return var_0_0
