local var_0_0 = class("AdvanceTestMainView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "UI/AdvancetestingUI/AtestingMainUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0.mainActivityID = AdvanceTestData:GetMainActivityID()

	arg_3_0:BindCfgUI()
	arg_3_0:AddListeners()

	arg_3_0.stageEasyItem_ = AdvanceTestMainItem.New(arg_3_0.stageEasyGo_, 1)
	arg_3_0.stageNormalItem_ = AdvanceTestMainItem.New(arg_3_0.stageNormalGo_, 2)
	arg_3_0.stageHardItem_ = AdvanceTestMainItem.New(arg_3_0.stageHardGo_, 3)
	arg_3_0.stageItem_ = {
		arg_3_0.stageEasyItem_,
		arg_3_0.stageNormalItem_,
		arg_3_0.stageHardItem_
	}
	arg_3_0.bossItem_ = AdvanceTestBossItem.New(arg_3_0.bossItem_)
	arg_3_0.selectController_ = ControllerUtil.GetController(arg_3_0.transform_, "status")
	arg_3_0.clickItemHandler = handler(arg_3_0, arg_3_0.ChooseItemMode)

	arg_3_0.stageEasyItem_:RegistClickFunc(arg_3_0.clickItemHandler)
	arg_3_0.stageNormalItem_:RegistClickFunc(arg_3_0.clickItemHandler)
	arg_3_0.stageHardItem_:RegistClickFunc(arg_3_0.clickItemHandler)

	arg_3_0.clickBossBtnHandler = handler(arg_3_0, arg_3_0.ClickBtn)

	arg_3_0.bossItem_:RegistClickFunc(arg_3_0.clickBossBtnHandler)
end

function var_0_0.ChooseItemMode(arg_4_0, arg_4_1)
	arg_4_0.chooseIndex_ = arg_4_1

	arg_4_0:RefreshUI()
end

function var_0_0.OnEnter(arg_5_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR,
		INFO_BAR
	})

	local var_5_0 = ActivityData:GetActivityData(arg_5_0.mainActivityID)

	arg_5_0.startTime_ = var_5_0.startTime
	arg_5_0.stopTime_ = var_5_0.stopTime
	arg_5_0.chooseIndex_ = AdvanceTestData:GetLastSelectIndex()
	arg_5_0.goBtn_.enabled = false

	AdvanceTestData:InitDefalutHeroList()
	manager.windowBar:RegistBackCallBack(function()
		if arg_5_0.selectController_:GetSelectedState() == "detail" then
			arg_5_0.selectController_:SetSelectedState("list")
		else
			JumpTools.Back()
		end
	end)
	manager.windowBar:RegistHomeCallBack(function()
		arg_5_0.selectController_:SetSelectedState("list")
		gameContext:Go("/home", nil, nil, true)
	end)
	manager.windowBar:SetGameHelpKey(GetTips("TEST_CHALLENGE_DESCRIBE"))

	local var_5_1 = AdvanceTestCfg.get_id_list_by_activity_id[arg_5_0.mainActivityID]

	for iter_5_0 = 1, 3 do
		SetActive(arg_5_0.stageItem_[iter_5_0].gameObject_, false)
	end

	for iter_5_1 = 1, 3 do
		if var_5_1[iter_5_1] then
			local var_5_2 = AdvanceTestCfg[var_5_1[iter_5_1]]

			SetActive(arg_5_0.stageItem_[var_5_2.stage_type].gameObject_, true)
		end
	end

	arg_5_0:RefreshUI()
	arg_5_0:AddTimer()
end

function var_0_0.OnExit(arg_8_0)
	arg_8_0.chooseIndex_ = nil

	arg_8_0.selectController_:SetSelectedState("list")

	arg_8_0.panelAni_.enabled = true

	arg_8_0:StopTimer()
	manager.windowBar:HideBar()
end

function var_0_0.Dispose(arg_9_0)
	var_0_0.super.Dispose(arg_9_0)

	arg_9_0.clickItemHandler = nil
end

function var_0_0.AddListeners(arg_10_0)
	arg_10_0:AddBtnListener(arg_10_0.goBtn_, nil, function()
		arg_10_0.selectController_:SetSelectedState("detail")
	end)
	arg_10_0:AddBtnListener(arg_10_0.rankBtn_, nil, function()
		local var_12_0 = AdvanceTestData:GetCurActivityID()
		local var_12_1 = manager.time:GetServerTime()

		if var_12_0 ~= 0 then
			local var_12_2 = ActivityData:GetActivityData(var_12_0)
			local var_12_3 = var_12_2.stopTime

			if var_12_1 > var_12_2.startTime and var_12_1 < var_12_3 then
				gameContext:Go("/advanceTestRank", {
					activityID = var_12_0,
					stageType = arg_10_0.chooseIndex_
				})

				return
			end
		end

		ShowTips("SOLO_NOT_OPEN")
	end)
end

function var_0_0.ClickBtn(arg_13_0)
	AdvanceTestData:SetLastSelectIndex(arg_13_0.chooseIndex_)

	local var_13_0 = AdvanceTestData:GetCurCfgByIndex(arg_13_0.chooseIndex_)

	AdvanceTestData:SetHeroListByDifficult(var_13_0.stage_type)
	gameContext:Go("/sectionSelectHero", {
		section = var_13_0.stage_id,
		sectionType = BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_ADVANCE_TEST,
		stageDifficult = var_13_0.stage_type,
		activityID = arg_13_0.mainActivityID,
		dest = var_13_0.id
	})
end

function var_0_0.RefreshUI(arg_14_0)
	SetActive(arg_14_0.panelGo_, true)

	local var_14_0 = string.split(GetTips("TEST_CHALLENGE_TIPS_1"), ",")
	local var_14_1 = AdvanceTestData:GetCurCfgByIndex(arg_14_0.chooseIndex_)

	if var_14_0 ~= nil then
		arg_14_0.tipTopText_.text = string.format(var_14_0[1], arg_14_0:GetStrByIndex(arg_14_0.chooseIndex_))
		arg_14_0.tipBottomText_.text = string.format(var_14_0[2], var_14_1.weapon)
	end

	arg_14_0.chooseIndex_ = arg_14_0.chooseIndex_

	arg_14_0.stageEasyItem_:RefreshUI(arg_14_0.chooseIndex_)
	arg_14_0.stageNormalItem_:RefreshUI(arg_14_0.chooseIndex_)
	arg_14_0.stageHardItem_:RefreshUI(arg_14_0.chooseIndex_)
	arg_14_0.bossItem_:RefreshUI(arg_14_0.chooseIndex_)
end

function var_0_0.GetStrByIndex(arg_15_0, arg_15_1)
	local var_15_0

	if arg_15_1 == 1 then
		var_15_0 = "SS"
	elseif arg_15_1 == 2 then
		var_15_0 = "SSS"
	elseif arg_15_1 == 3 then
		var_15_0 = "Ω"
	end

	return var_15_0
end

function var_0_0.AddTimer(arg_16_0)
	arg_16_0:StopTimer()

	arg_16_0.leftTimeText_.text = GetTips("REMAINING_TIME") .. manager.time:GetLostTimeStr2(arg_16_0.stopTime_, nil, true)
	arg_16_0.timer_ = Timer.New(function()
		if manager.time:GetServerTime() > arg_16_0.stopTime_ then
			return
		end

		arg_16_0.leftTimeText_.text = GetTips("REMAINING_TIME") .. manager.time:GetLostTimeStr2(arg_16_0.stopTime_, nil, true)
	end, 1, -1)

	arg_16_0.timer_:Start()

	arg_16_0.aniTimer_ = Timer.New(function()
		arg_16_0.panelAni_.enabled = false
		arg_16_0.goBtn_.enabled = true
	end, 0.5, 1)

	arg_16_0.aniTimer_:Start()
end

function var_0_0.StopTimer(arg_19_0)
	if arg_19_0.timer_ then
		arg_19_0.timer_:Stop()

		arg_19_0.timer_ = nil
	end
end

return var_0_0
