local var_0_0 = class("CivilizationGameMainView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/Version/V4_2_GodEaterUI/V4_2_GodEaterUI_Culture/V4_2_GodEaterUI_Culture_MainUI"
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

	arg_4_0.selectController_ = arg_4_0.mainControllerEx_:GetController("tips")
	arg_4_0.heroEmptyController_ = arg_4_0.mainControllerEx_:GetController("empty")
	arg_4_0.heroController_ = arg_4_0.selectControllerEx_:GetController("Toggle")
end

function var_0_0.AddUIListener(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.heroBtn_, nil, function()
		arg_5_0.selectController_:SetSelectedState("on")
	end)
	arg_5_0:AddBtnListener(arg_5_0.maskBtn_, nil, function()
		arg_5_0.selectController_:SetSelectedState("off")
	end)
	arg_5_0:AddBtnListener(arg_5_0.taskBtn_, nil, function()
		GodEaterTool.GotoMilestone(ActivityConst.ACTIVITY_CIVILIZATION)
	end)
	arg_5_0:AddBtnListener(arg_5_0.illuBtn_, nil, function()
		JumpTools.OpenPageByJump("/civilizationGameIlluView")
	end)
	arg_5_0:AddBtnListener(arg_5_0.playBtn_, nil, function()
		if arg_5_0:GetHeroID() == 0 then
			ShowTips("GODEATER_CIVILIZATION_GAME_NOT_SELECTED_HERO")
			arg_5_0.selectController_:SetSelectedState("on")
		else
			arg_5_0.selectController_:SetSelectedState("off")
			CivilizationGameTools.EnterGameView(arg_5_0:GetHeroID(), ActivityCivilizationStageCfg.all[1])
		end
	end)
	arg_5_0:AddBtnListener(arg_5_0.teachBtn_, nil, function()
		if arg_5_0:GetHeroID() == 0 then
			ShowTips("GODEATER_CIVILIZATION_GAME_NOT_SELECTED_HERO")
			arg_5_0.selectController_:SetSelectedState("on")
		else
			arg_5_0.selectController_:SetSelectedState("off")
			CivilizationGameTools.EnterGameView(arg_5_0:GetHeroID(), ActivityCivilizationStageCfg.all[2])
		end
	end)
	arg_5_0:AddBtnListener(arg_5_0.select1Btn_, nil, function()
		if arg_5_0:GetHeroID() == 1 then
			return
		end

		arg_5_0:SetHeroID(1)
		arg_5_0:UpdateView()
	end)
	arg_5_0:AddBtnListener(arg_5_0.select2Btn_, nil, function()
		if arg_5_0:GetHeroID() == 2 then
			return
		end

		arg_5_0:SetHeroID(2)
		arg_5_0:UpdateView()
	end)
end

function var_0_0.OnEnter(arg_14_0)
	arg_14_0.activityID_ = ActivityConst.ACTIVITY_CIVILIZATION

	local var_14_0 = ActivityData:GetActivityData(arg_14_0.activityID_)

	if not var_14_0 then
		JumpTools.Back()
		ShowTips("TIME_OVER")

		return
	end

	arg_14_0.startTime_ = var_14_0.startTime
	arg_14_0.stopTime_ = var_14_0.stopTime

	arg_14_0:StopTimer()
	arg_14_0:RefreshTimeText()

	arg_14_0.timer = Timer.New(function()
		if manager.time:GetServerTime() > arg_14_0.stopTime_ then
			return
		end

		arg_14_0:RefreshTimeText()
	end, 1)

	arg_14_0.timer:Start()
	arg_14_0:UpdateView()
	arg_14_0:BindRedPoint()
end

function var_0_0.UpdateView(arg_16_0)
	local var_16_0 = arg_16_0:GetHeroID()

	if var_16_0 == 0 then
		arg_16_0.heroEmptyController_:SetSelectedState("empty")
		arg_16_0.heroController_:SetSelectedIndex(2)

		arg_16_0.heroNameText_.text = GetTips("GODEATER_CIVILIZATION_GAME_NOT_SELECTED_HERO_TIPS")
		arg_16_0.descText_.text = ""
	else
		arg_16_0.heroEmptyController_:SetSelectedIndex(var_16_0)
		arg_16_0.heroController_:SetSelectedIndex(var_16_0 == 1 and 0 or 1)

		local var_16_1 = ActivityCivilizationHeroCfg[var_16_0]

		arg_16_0.descText_.text = var_16_1.description
	end

	for iter_16_0 = 1, 2 do
		local var_16_2 = ActivityCivilizationHeroCfg[iter_16_0]

		arg_16_0["hero" .. iter_16_0 .. "NameText_"].text = var_16_2.name
		arg_16_0["hero" .. iter_16_0 .. "DescText_"].text = var_16_2.description

		if var_16_0 == iter_16_0 then
			arg_16_0.heroNameText_.text = var_16_2.name
		end
	end
end

function var_0_0.GetHeroID(arg_17_0)
	return getData("civilizationGame", "heroID") or 0
end

function var_0_0.SetHeroID(arg_18_0, arg_18_1)
	saveData("civilizationGame", "heroID", arg_18_1)
end

function var_0_0.RefreshTimeText(arg_19_0)
	arg_19_0.timeText_.text = string.format(GetTips("GODEATER_CIVILIZATION_TIME"), manager.time:GetLostTimeStrWith2Unit(arg_19_0.stopTime_))
end

function var_0_0.BindRedPoint(arg_20_0)
	return
end

function var_0_0.UnbindRedPoint(arg_21_0)
	return
end

function var_0_0.StopTimer(arg_22_0)
	if arg_22_0.timer_ then
		arg_22_0.timer_:Stop()

		arg_22_0.timer_ = nil
	end
end

function var_0_0.OnExit(arg_23_0)
	arg_23_0:StopTimer()
	arg_23_0:UnbindRedPoint()
	manager.windowBar:HideBar()
end

function var_0_0.OnTop(arg_24_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR,
		INFO_BAR
	})
	manager.windowBar:SetGameHelpKey("GODEATER_CIVILIZATION_GAME_DESC")
end

function var_0_0.Dispose(arg_25_0)
	var_0_0.super.Dispose(arg_25_0)
	Object.Destroy(arg_25_0.gameObject_)
end

return var_0_0
