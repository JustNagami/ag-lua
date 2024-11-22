﻿local var_0_0 = class("SPHeroChallengeMainView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/System/SPHeroChallenge/SPHeroChallengeMainUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.OnCtor(arg_3_0)
	return
end

function var_0_0.Init(arg_4_0)
	arg_4_0:InitUI()
	arg_4_0:AddUIListener()

	arg_4_0.scheduleList = {}

	for iter_4_0 = 1, SpHeroChallengeConst.scheduleNum do
		arg_4_0.scheduleList[iter_4_0] = SPHeroChallengeScheduleItem.New(arg_4_0["scheduleitem" .. iter_4_0 .. "Btn_"].gameObject)
	end
end

function var_0_0.InitUI(arg_5_0)
	arg_5_0:BindCfgUI()
	arg_5_0:InitController()

	arg_5_0.timeLine1 = arg_5_0.gameObject_:GetComponent("PlayableDirector")
	arg_5_0.timeLine2 = arg_5_0.canvasGo_:GetComponent("PlayableDirector")
end

function var_0_0.FinPlayable(arg_6_0)
	if arg_6_0.timeLine1 then
		arg_6_0.timeLine1:Stop()
	end

	if arg_6_0.timeLine2 then
		arg_6_0.timeLine2:Stop()
	end
end

function var_0_0.InitController(arg_7_0)
	local var_7_0 = SPHeroChallengeData:GetActivityID()

	arg_7_0.entrustController = {}

	for iter_7_0 = 1, SPHeroChallengeTools:GetMaxStartEntrustPosNum(var_7_0) do
		arg_7_0.entrustController[iter_7_0] = arg_7_0["entrust" .. iter_7_0 .. "Con"]:GetController("State")
	end

	arg_7_0.spAwardController = arg_7_0.spAwardCon:GetController("chipState")
	arg_7_0.scheduleController = arg_7_0.scheduleCon:GetController("Finish")
	arg_7_0.bossOpenController = arg_7_0.bossopenCon:GetController("bossOpen")
	arg_7_0.animator = arg_7_0.middleGo_:GetComponent("Animator")
	arg_7_0.scheduleSelectController = arg_7_0.scheduleCon:GetController("Select")
	arg_7_0.miniGameSelectController = arg_7_0.entrustCon:GetController("Select")
	arg_7_0.scheduleAniamtor = arg_7_0.scheduleShowCon:GetComponent("Animator")
	arg_7_0.miniGameAniamtor = arg_7_0.miniGameCon:GetComponent("Animator")
end

function var_0_0.OnEnter(arg_8_0)
	arg_8_0.activityID = SPHeroChallengeData:GetActivityID()
	arg_8_0.activityInfo = SPHeroChallengeData:GetCurActivityInfo()

	if arg_8_0.activityInfo then
		arg_8_0.scheduleInfo = arg_8_0.activityInfo.curScheduleList
	end

	arg_8_0.curButtonState = arg_8_0.curButtonState or SPHeroChallengeData:GetPageState() or "schedule"
	arg_8_0.isOpenFlag = true

	arg_8_0:StartTimeLine()
	arg_8_0:RegisterEvents()
	arg_8_0:RefreshView()
	arg_8_0:RefreshAutoInfo()
	arg_8_0:RefreshBar()
	arg_8_0:BindRedPonit()
	arg_8_0:StartEnterTimer()
	arg_8_0:RefreshSelectState()

	if not getData("SPHeroChallengeDes", "showHelp") then
		arg_8_0:GotoHelp()
		saveData("SPHeroChallengeDes", "showHelp", 1)
	end
end

function var_0_0.OnTop(arg_9_0)
	arg_9_0:RefreshBar()
end

function var_0_0.StartTimeLine(arg_10_0)
	if arg_10_0.curButtonState == "schedule" then
		arg_10_0.timeLine1:Play()
	else
		arg_10_0.timeLine2:Play()
	end
end

function var_0_0.BindRedPonit(arg_11_0)
	manager.redPoint:bindUIandKey(arg_11_0.entrustBtn_.transform, RedPointConst.SP_HERO_CHALLENGE_3_1_ENTRUST)
	manager.redPoint:bindUIandKey(arg_11_0.heroChipBtn_.transform, string.format("%s_%s", RedPointConst.ACTIVITY_TASK, SPHeroChallengeData.activityCfg[ActivityConst.ACTIVITY_HERO_CHALLENGE_3_1].heroChipActivityID))
	manager.redPoint:bindUIandKey(arg_11_0.taskBtn_.transform, string.format("%s_%s", RedPointConst.ACTIVITY_TASK, SPHeroChallengeData.activityCfg[ActivityConst.ACTIVITY_HERO_CHALLENGE_3_1].taskActivityID))
end

function var_0_0.UnBindRedPonit(arg_12_0)
	manager.redPoint:unbindUIandKey(arg_12_0.entrustBtn_.transform, RedPointConst.SP_HERO_CHALLENGE_3_1_ENTRUST)
	manager.redPoint:unbindUIandKey(arg_12_0.heroChipBtn_.transform, string.format("%s_%s", RedPointConst.ACTIVITY_TASK, SPHeroChallengeData.activityCfg[ActivityConst.ACTIVITY_HERO_CHALLENGE_3_1].heroChipActivityID))
	manager.redPoint:unbindUIandKey(arg_12_0.taskBtn_.transform, string.format("%s_%s", RedPointConst.ACTIVITY_TASK, SPHeroChallengeData.activityCfg[ActivityConst.ACTIVITY_HERO_CHALLENGE_3_1].taskActivityID))
end

function var_0_0.GotoHelp(arg_13_0)
	local var_13_0 = "hero_challenge_game_describe1"
	local var_13_1 = GameSetting[var_13_0] and GameSetting[var_13_0].value or {}

	JumpTools.OpenPageByJump("gameHelpPro", {
		isPrefab = true,
		pages = var_13_1
	})
end

function var_0_0.RefreshBar(arg_14_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR,
		INFO_BAR,
		CurrencyConst.CURRENCY_HERO_CHALLENGE_COIN_1
	})
	manager.windowBar:SetBarCanClick(CurrencyConst.CURRENCY_HERO_CHALLENGE_COIN_1, true)

	local var_14_0 = SPHeroChallengeData:GetActivityID()
	local var_14_1 = SPHeroChallengeData.activityCfg[var_14_0].helpKey

	manager.windowBar:RegistInfoCallBack(function()
		arg_14_0:GotoHelp()
	end)
end

function var_0_0.OnExit(arg_16_0)
	manager.windowBar:HideBar()
	arg_16_0:UnBindRedPonit()
	arg_16_0:RemoveAllEventListener()

	if arg_16_0.timer then
		arg_16_0.timer:Stop()

		arg_16_0.timer = nil
	end

	AnimatorTools.Stop()
	arg_16_0:FinPlayable()
	SPHeroChallengeData:SavePageState(arg_16_0.curButtonState)
end

function var_0_0.AddUIListener(arg_17_0)
	arg_17_0:AddBtnListenerScale(arg_17_0.trainBtn_, nil, function()
		if not arg_17_0.playAnimation then
			JumpTools.OpenPageByJump("/spHeroChallengeBattleToggleView", {
				groupIndex = SpHeroChallengeConst.ChapterType.story
			})
		end
	end)
	arg_17_0:AddBtnListenerScale(arg_17_0.shopBtn_, nil, function()
		if arg_17_0.activityID and not arg_17_0.playAnimation then
			local var_19_0 = SPHeroChallengeData.activityCfg[arg_17_0.activityID].shopID

			JumpTools.GoToSystem("/activityShop", {
				shopId = var_19_0,
				showShops = {
					var_19_0
				}
			}, ViewConst.SYSTEM_ID.SHOP)
		end
	end)
	arg_17_0:AddBtnListenerScale(arg_17_0.heroChipBtn_, nil, function()
		if arg_17_0.activityID and not arg_17_0.playAnimation then
			local var_20_0 = SPHeroChallengeData.activityCfg[arg_17_0.activityID].heroChipActivityID

			JumpTools.OpenPageByJump("spHeroChallengeHeroChipTaskView", {
				activityID = var_20_0
			})
		end
	end)
	arg_17_0:AddBtnListenerScale(arg_17_0.taskBtn_, nil, function()
		if arg_17_0.activityID and not arg_17_0.playAnimation then
			local var_21_0 = SPHeroChallengeData.activityCfg[arg_17_0.activityID].taskActivityID

			JumpTools.OpenPageByJump("spHeroChallengeActivityTaskView", {
				activityID = var_21_0
			})
		end
	end)
	arg_17_0:AddBtnListenerScale(arg_17_0.scheduleBtn_, nil, function()
		if arg_17_0.curButtonState == "schedule" then
			if arg_17_0.activityInfo:CheckCurScheduleFinish() and not arg_17_0.activityInfo:CheckDailyScheduleAwardReceived() then
				SPHeroChallengeAction:GetScheduleAward()
			else
				JumpTools.OpenPageByJump("/spHeroChallengeScheduleView")
			end

			return
		end

		if not arg_17_0.playAnimation then
			if arg_17_0.curButtonState == "schedule" then
				arg_17_0:ShowBtnList("schedule", not arg_17_0.isOpenFlag)
			else
				arg_17_0:ExchangePosition()
			end
		end
	end)

	for iter_17_0 = 1, SpHeroChallengeConst.scheduleNum do
		if not arg_17_0.playAnimation then
			arg_17_0:AddBtnListener(arg_17_0["scheduleitem" .. iter_17_0 .. "Btn_"], nil, function()
				arg_17_0:ClickScheduleItem(iter_17_0)
			end)
		end
	end

	arg_17_0:AddBtnListenerScale(arg_17_0.miniGameBtn_, nil, function()
		if not arg_17_0.playAnimation then
			if arg_17_0.curButtonState == "miniGame" then
				arg_17_0:ShowBtnList("miniGame", not arg_17_0.isOpenFlag)
			else
				arg_17_0:ExchangePosition()
			end
		end
	end)
	arg_17_0:AddBtnListenerScale(arg_17_0.entrustBtn_, nil, function()
		if not arg_17_0.playAnimation then
			JumpTools.OpenPageByJump("/spHeroChallengeEntrustView")
		end
	end)
	arg_17_0:AddBtnListenerScale(arg_17_0.barbecueBtn_, nil, function()
		if not arg_17_0.playAnimation then
			SPHeroChallengeTools:JumpSystemByScheduleType(SpHeroChallengeConst.ScheduleSubType.barbuce, nil, arg_17_0.curButtonState)
		end
	end)
	arg_17_0:AddBtnListenerScale(arg_17_0.mysteryBtn_, nil, function()
		if not arg_17_0.playAnimation then
			SPHeroChallengeTools:JumpSystemByScheduleType(SpHeroChallengeConst.ScheduleSubType.decode)
		end
	end)

	local var_17_0 = {
		arg_17_0.scheduleBtn_.gameObject,
		arg_17_0.miniGameBtn_.gameObject,
		arg_17_0.scorllbtnBtn_.gameObject
	}

	for iter_17_1, iter_17_2 in ipairs(var_17_0) do
		arg_17_0:AddPressByTimeListener(iter_17_2, 0.2, function()
			return
		end, function(arg_29_0, arg_29_1, arg_29_2)
			if arg_29_0 == arg_17_0.scheduleBtn_.gameObject and arg_17_0.curButtonState == "miniGame" then
				return
			end

			if arg_29_0 == arg_17_0.miniGameBtn_.gameObject and arg_17_0.curButtonState == "schedule" then
				return
			end

			if not arg_17_0.playAnimation then
				arg_17_0:StartDrag()
			end
		end, function(arg_30_0, arg_30_1, arg_30_2)
			arg_17_0:EndDrag()
		end)
		arg_17_0:AddDragListener(iter_17_2, function()
			return
		end, function()
			arg_17_0:OnDrag()
		end, function()
			return
		end)
	end
end

function var_0_0.StartDrag(arg_34_0)
	arg_34_0.startPos = Vector2.New(Input.mousePosition.x, Input.mousePosition.y)
end

function var_0_0.EndDrag(arg_35_0)
	arg_35_0.startPos = nil
end

function var_0_0.OnDrag(arg_36_0)
	if arg_36_0.startPos then
		local var_36_0 = Vector2.New(Input.mousePosition.x, Input.mousePosition.y)

		if MathTools.GetDistance(arg_36_0.startPos, var_36_0) > GameDisplayCfg.activity_hero_challenge_slide.value[1] then
			local var_36_1 = arg_36_0.startPos - var_36_0

			arg_36_0.playAnimation = true

			if var_36_1.y < 0 then
				if arg_36_0.curButtonState == "schedule" then
					arg_36_0.miniGameSelectController:SetSelectedState("closeTrain")
					arg_36_0:ShowBtnList("schedule", false, function()
						AnimatorTools.PlayAnimatorWithCallback(arg_36_0.animator, "Fx_startScheduleList_counterclockwise", function()
							arg_36_0:ShowBtnList("miniGame", true)

							arg_36_0.curButtonState = "miniGame"

							arg_36_0:RefreshSelectState()
						end, false)
					end)
				else
					arg_36_0:ShowBtnList("miniGame", false, function()
						AnimatorTools.PlayAnimatorWithCallback(arg_36_0.animator, "Fx_miniGameList_counterclockwise", function()
							arg_36_0:ShowBtnList("schedule", true)

							arg_36_0.curButtonState = "schedule"

							arg_36_0:RefreshSelectState()
						end, false)
					end)
				end
			elseif arg_36_0.curButtonState == "schedule" then
				arg_36_0.miniGameSelectController:SetSelectedState("closeTrain")
				arg_36_0:ShowBtnList("schedule", false, function()
					AnimatorTools.PlayAnimatorWithCallback(arg_36_0.animator, "Fx_miniGameList_clockwise", function()
						arg_36_0:ShowBtnList("miniGame", true)

						arg_36_0.curButtonState = "miniGame"

						arg_36_0:RefreshSelectState()
					end, false)
				end)
			else
				arg_36_0:ShowBtnList("miniGame", false, function()
					AnimatorTools.PlayAnimatorWithCallback(arg_36_0.animator, "Fx_startScheduleList_clockwise", function()
						arg_36_0:ShowBtnList("schedule", true)

						arg_36_0.curButtonState = "schedule"

						arg_36_0:RefreshSelectState()
					end, false)
				end)
			end

			arg_36_0:EndDrag()
		end
	end
end

function var_0_0.RegisterEvents(arg_45_0)
	arg_45_0:RegistEventListener(SP_HERO_CHALLENGE_UPDATE_SCHEDULE, function()
		arg_45_0:RefreshView()
	end)
	arg_45_0:RegistEventListener(SP_HERO_CHALLENGE_GET_SCHEDULE_AWARD, function()
		arg_45_0:RefreshScheduleState()
	end)
	arg_45_0:RegistEventListener(ON_TASK_SUBMIT_RESPONSE, function()
		arg_45_0:RefreshHeroChipInfo()
	end)
	arg_45_0:RegistEventListener(SP_HERO_CHALLENGE_SCHEDULE_CONFIRM, function()
		arg_45_0:RefreshView()
	end)
end

function var_0_0.Dispose(arg_50_0)
	if arg_50_0.scheduleList then
		for iter_50_0, iter_50_1 in pairs(arg_50_0.scheduleList) do
			iter_50_1:Dispose()
		end

		arg_50_0.scheduleList = nil
	end

	if arg_50_0.timer then
		arg_50_0.timer:Stop()

		arg_50_0.timer = nil
	end

	AnimatorTools.Stop()
	arg_50_0:FinPlayable()
	var_0_0.super.Dispose(arg_50_0)
end

function var_0_0.RefreshView(arg_51_0)
	arg_51_0:RefreshHeroChipInfo()
	arg_51_0:RefreshButtonLayer()
	arg_51_0:RefreshEntrustState()
	arg_51_0:RefreshScheduleState()
	arg_51_0:RefreshBossOpenState()
end

function var_0_0.RefreshAutoInfo(arg_52_0)
	if SPHeroChallengeTools:ShowAutoScheduleTips(arg_52_0.activityID) then
		local var_52_0 = getData("SPHeroChallenge", "AutoTime")
		local var_52_1 = manager.time:GetServerTime()

		if not var_52_0 or not manager.time:CheckIsToday(var_52_0, var_52_1) then
			saveData("SPHeroChallenge", "AutoTime", var_52_1)
			ShowMessageBox({
				title = GetTips("PROMPT"),
				content = GetTips("ACTIVITY_HERO_CHALLENGE_SCHEDULE_AUTO_TIPS"),
				OkCallback = function()
					SPHeroChallengeTools:AutoChooseSchedule()

					local var_53_0 = arg_52_0.activityInfo:GetScheduleDailyList()

					SPHeroChallengeAction:ConfirmScheduleList(var_53_0, true)
				end,
				CancelCallback = function()
					JumpTools.OpenPageByJump("/spHeroChallengeScheduleView")
				end
			})
		end
	end
end

function var_0_0.RefreshHeroChipInfo(arg_55_0)
	local var_55_0, var_55_1, var_55_2, var_55_3 = arg_55_0.activityInfo:CheckCanGetHeroChipTaskAward()

	if var_55_1 then
		arg_55_0.spAwardController:SetSelectedState("received")
	elseif var_55_3 < var_55_2 then
		arg_55_0.spAwardController:SetSelectedState("unavaliable")
	else
		arg_55_0.spAwardController:SetSelectedState("obtainable")
	end

	arg_55_0.heroChipText.text = string.format(GetTips("ACTIVITY_HERO_CLUE_COLLECT"), tostring(var_55_3), tostring(var_55_2))
end

function var_0_0.RefreshBossOpenState(arg_56_0)
	local var_56_0 = SPHeroChallengeData.activityCfg[arg_56_0.activityID].bossActivityID

	if ActivityData:GetActivityIsOpen(var_56_0) and arg_56_0.activityInfo.bossStart then
		arg_56_0.bossOpenController:SetSelectedState("open")
	else
		arg_56_0.bossOpenController:SetSelectedState("close")
	end
end

function var_0_0.RefreshButtonLayer(arg_57_0)
	if arg_57_0.isOpenFlag then
		arg_57_0:RefreshEntrustState()
		arg_57_0:RefreshScheduleList()
	end
end

function var_0_0.ShowBtnList(arg_58_0, arg_58_1, arg_58_2, arg_58_3)
	arg_58_0.playAnimation = true

	if arg_58_1 == "schedule" then
		if arg_58_2 then
			AnimatorTools.PlayAnimatorWithCallback(arg_58_0.scheduleAniamtor, "Fx_activityHeroChallengeScheduleBtn_cx", function()
				if arg_58_3 then
					arg_58_3()
				else
					arg_58_0.playAnimation = false
				end
			end, false)
		else
			AnimatorTools.PlayAnimatorWithCallback(arg_58_0.scheduleAniamtor, "Fx_activityHeroChallengeScheduleBtn_xs", function()
				if arg_58_3 then
					arg_58_3()
				else
					arg_58_0.playAnimation = false
				end
			end, false)
		end
	elseif arg_58_1 == "miniGame" then
		if arg_58_2 then
			AnimatorTools.PlayAnimatorWithCallback(arg_58_0.miniGameAniamtor, "Fx_activityHeroChallengeMiniGameBtn_cx", function()
				if arg_58_3 then
					arg_58_3()
				else
					arg_58_0.playAnimation = false
				end
			end, false)
		else
			AnimatorTools.PlayAnimatorWithCallback(arg_58_0.miniGameAniamtor, "Fx_activityHeroChallengeMiniGameBtn_xs", function()
				if arg_58_3 then
					arg_58_3()
				else
					arg_58_0.playAnimation = false
				end
			end, false)
		end
	end

	arg_58_0.isOpenFlag = arg_58_2

	arg_58_0:RefreshButtonLayer()
end

function var_0_0.RefreshScheduleList(arg_63_0)
	if arg_63_0.scheduleList then
		for iter_63_0, iter_63_1 in pairs(arg_63_0.scheduleList) do
			iter_63_1:RefreshUI(iter_63_0)
		end
	end
end

function var_0_0.RefreshEntrustState(arg_64_0)
	local var_64_0

	for iter_64_0 = 1, SPHeroChallengeTools:GetMaxStartEntrustPosNum(arg_64_0.activityID) do
		local var_64_1 = SPHeroChallengeTools:GetEntrustPosState(arg_64_0.activityID, iter_64_0)

		if arg_64_0.entrustController and arg_64_0.entrustController[iter_64_0] then
			arg_64_0.entrustController[iter_64_0]:SetSelectedState(var_64_1)

			if var_64_1 == SpHeroChallengeConst.EntrustPosState.empty or var_64_1 == SpHeroChallengeConst.EntrustPosState.fin then
				local var_64_2 = SpHeroChallengeConst.EntrustPosState.empty
			end
		end
	end
end

function var_0_0.RefreshScheduleState(arg_65_0)
	if arg_65_0.activityInfo:CheckCurScheduleFinish() then
		if arg_65_0.activityInfo:CheckDailyScheduleAwardReceived() then
			arg_65_0.scheduleController:SetSelectedState("recived")
		else
			arg_65_0.scheduleController:SetSelectedState("award")
		end
	else
		arg_65_0.scheduleController:SetSelectedState("none")
	end
end

function var_0_0.ClickScheduleItem(arg_66_0, arg_66_1)
	if arg_66_0.scheduleInfo and arg_66_0.scheduleInfo[arg_66_1] then
		if arg_66_0.scheduleInfo[arg_66_1].isFinish then
			return
		end

		local var_66_0 = arg_66_0.scheduleInfo[arg_66_1].scheduleID
		local var_66_1 = ActivityHeroChallengeScheduleCfg[var_66_0].server_type

		SPHeroChallengeTools:JumpSystemByScheduleType(var_66_1, true, arg_66_0.curButtonState)
	else
		JumpTools.OpenPageByJump("/spHeroChallengeScheduleView")
	end
end

function var_0_0.StartEnterTimer(arg_67_0)
	if arg_67_0.timer then
		arg_67_0.timer:Stop()

		arg_67_0.timer = nil
	end

	arg_67_0.playAnimation = true
	arg_67_0.timer = Timer.New(function()
		arg_67_0.timer:Stop()

		arg_67_0.timer = nil
		arg_67_0.playAnimation = false
	end, 1, 1)

	arg_67_0.timer:Start()
end

function var_0_0.ExchangePosition(arg_69_0)
	if arg_69_0.curButtonState == "schedule" then
		arg_69_0.miniGameSelectController:SetSelectedState("closeTrain")
		arg_69_0:ShowBtnList("schedule", false, function()
			arg_69_0.playAnimation = true

			AnimatorTools.PlayAnimatorWithCallback(arg_69_0.animator, "Fx_miniGameList_clockwise", function()
				arg_69_0:ShowBtnList("miniGame", true)

				arg_69_0.curButtonState = "miniGame"

				arg_69_0:RefreshSelectState()
			end, false)
		end)
	else
		arg_69_0:ShowBtnList("miniGame", false, function()
			arg_69_0.playAnimation = true

			AnimatorTools.PlayAnimatorWithCallback(arg_69_0.animator, "Fx_startScheduleList_clockwise", function()
				arg_69_0:ShowBtnList("schedule", true)

				arg_69_0.curButtonState = "schedule"

				arg_69_0:RefreshSelectState()
			end, false)
		end)
	end
end

function var_0_0.RefreshSelectState(arg_74_0)
	if arg_74_0.curButtonState == "schedule" then
		arg_74_0.scheduleSelectController:SetSelectedState("Selected")

		if SPHeroChallengeTools:CheckBossActivityIsOpen() then
			arg_74_0.miniGameSelectController:SetSelectedState("UnSelected")
		else
			arg_74_0.miniGameSelectController:SetSelectedState("closeTrain")
		end
	else
		arg_74_0.scheduleSelectController:SetSelectedState("UnSelected")
		arg_74_0.miniGameSelectController:SetSelectedState("Selected")
	end
end

return var_0_0
