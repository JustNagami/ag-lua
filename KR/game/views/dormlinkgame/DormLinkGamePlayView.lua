local var_0_0 = class("DormLinkGamePlayView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/Version/NorseUI_3_2/NorseUI_3_2_LinkGame/NorseUI_3_2_LGPlay"
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
end

function var_0_0.InitUI(arg_5_0)
	arg_5_0:BindCfgUI()

	arg_5_0.itemScroll = LuaList.New(handler(arg_5_0, arg_5_0.indexSkillItemList), arg_5_0.itemList_, DormLinkGameSkillItem)
	arg_5_0.passTableStateController = ControllerUtil.GetController(arg_5_0.statusGo_.transform, "status")
	arg_5_0.countDowmController = ControllerUtil.GetController(arg_5_0.countdownGo_.transform, "state")
	arg_5_0.batterController = ControllerUtil.GetController(arg_5_0.transform_, "batter")
	arg_5_0.useItemController = ControllerUtil.GetController(arg_5_0.transform_, "useItem")
	arg_5_0.showCountController = ControllerUtil.GetController(arg_5_0.transform_, "showCount")
	arg_5_0.startCountController = ControllerUtil.GetController(arg_5_0.transform_, "start")
	arg_5_0.diffController = ControllerUtil.GetController(arg_5_0.startgame1Go_.transform, "mode")
	arg_5_0.maskController = ControllerUtil.GetController(arg_5_0.transform_, "mask")
	arg_5_0.reduceController = ControllerUtil.GetController(arg_5_0.transform_, "reducePoint")
	arg_5_0.listController = ControllerUtil.GetController(arg_5_0.transform_, "listShow")
	arg_5_0.numAnimaton = arg_5_0.numGo_:GetComponent("Animation")
	arg_5_0.comboAnimaton = arg_5_0.comboGo_:GetComponent("Animation")
	arg_5_0.extendAnimaton = arg_5_0.extendNumGo_:GetComponent("Animation")
end

function var_0_0.AddUIListener(arg_6_0)
	arg_6_0:AddBtnListenerScale(arg_6_0.startbtnBtn_, nil, function()
		arg_6_0:StartGame()
	end)
end

function var_0_0.OnEnter(arg_8_0)
	arg_8_0.levelID = DormLinkGameData:GetCurLevelID()
	arg_8_0.canInteractFlag = false

	arg_8_0.maskController:SetSelectedState("false")
	arg_8_0:RegisterEvents()
	arg_8_0:RefreshStartView()
	arg_8_0:RefreshCustomerBubble()
	arg_8_0:ResetView()
end

function var_0_0.OnTop(arg_9_0)
	manager.windowBar:SwitchBar({
		BACK_BAR
	})
	manager.windowBar:RegistBackCallBack(function()
		ShowMessageBox({
			isTop = true,
			content = GetTips("ACTIVITY_LINKGAME_STOP_TIPS"),
			OkCallback = function()
				arg_9_0:DisposeTimer()
				DormLinkGameData:StopGame(DormLinkGameConst.StopGameType.fail)
			end
		})
	end)
	manager.windowBar:SetGameHelpKey(DormLinkGameTools.GetGameHelpKey())
end

function var_0_0.OnBehind(arg_12_0)
	manager.windowBar:HideBar()
end

function var_0_0.RegisterEvents(arg_13_0)
	arg_13_0:RegistEventListener(DORM_LINK_START_PLAY, function()
		arg_13_0.countDowmController:SetSelectedState("start")

		arg_13_0.canInteractFlag = true
	end)
	arg_13_0:RegistEventListener(DORM_LINK_END_GAME, function(arg_15_0, arg_15_1)
		arg_13_0:DisposeTimer()

		if arg_13_0.bubbleList then
			for iter_15_0, iter_15_1 in pairs(arg_13_0.bubbleList) do
				iter_15_1:SetActive(false)
			end
		end

		if arg_15_0 == DormLinkGameConst.StopGameType.success then
			DormLinkGameTools:PlaySpecialVoice(DormLinkGameConst.SpecialVoiceType.SuccssfulLevel)
			JumpTools.OpenPageByJump("/dormLinkGameSuccessView", {
				data = arg_15_1
			})
		elseif arg_15_0 == DormLinkGameConst.StopGameType.fail then
			DormLinkGameTools:PlaySpecialVoice(DormLinkGameConst.SpecialVoiceType.FaileLevel)
			JumpTools.OpenPageByJump("/dormLinkGameFailView")
		end
	end)
	arg_13_0:RegistEventListener(DORM_LINK_REFRESH_GAME_TIME, function(arg_16_0)
		arg_13_0:RefreshLastTime(arg_16_0)
	end)
	arg_13_0:RegistEventListener(LIANLIANKAN_ITEM_MATCH, function(arg_17_0)
		DormLinkGameData:EliminateMaterial(arg_17_0)
	end)
	arg_13_0:RegistEventListener(DORM_LINK_REFRESH_BATTER_NUM, function()
		arg_13_0:RefreshBatterNum()
		arg_13_0:RefreshExtendPoint()
	end)
	arg_13_0:RegistEventListener(DORM_LINK_REFRESH_CUSTOMER_BUBBLE, function(arg_19_0, arg_19_1)
		if arg_13_0.bubbleList and arg_13_0.bubbleList[arg_19_0] then
			arg_13_0.bubbleList[arg_19_0]:RefreshBubbleInfo(arg_19_1)
		end
	end)
	arg_13_0:RegistEventListener(LIANLIANKAN_ITEM_OVERFLOW, function(arg_20_0)
		DormLinkGameData:DrainMaterial(arg_20_0)
	end)
	arg_13_0:RegistEventListener(LIANLIANKAN_GAME_CLEAR, function()
		DormLinkGameData:StopGame(DormLinkGameConst.StopGameType.success)
	end)
	arg_13_0:RegistEventListener(DORM_LINK_REFRESH_DRAIN_MATERIAL, function(arg_22_0)
		arg_13_0:RefreshExtendPoint()
		arg_13_0:RefreshDrainPoint(arg_22_0)
	end)
	arg_13_0:RegistEventListener(DORM_LINK_REFRESH_EXTEND_ADDITION, function()
		arg_13_0:RefreshExtendAddition()
	end)
	arg_13_0:RegistEventListener(DORM_LINK_REFRESH_MATERIAL_TIME, function(arg_24_0)
		arg_13_0:RefreshMaterialTime(arg_24_0)
	end)
	arg_13_0:RegistEventListener(DORM_LINK_REFRESH_CUSTOMER_SATIETY, function(arg_25_0)
		arg_13_0.bubbleList[arg_25_0]:RefreshSatiety()
	end)
end

local function var_0_1(arg_26_0)
	return nullable(ActivityCfg, ActivityLinkGameCfg[arg_26_0].activity_id, "remark")
end

function var_0_0.RefreshRunView(arg_27_0)
	if arg_27_0.bubbleList then
		for iter_27_0, iter_27_1 in pairs(arg_27_0.bubbleList) do
			iter_27_1:SetActive(true)
			iter_27_1:RefreshTransPosition()
			iter_27_1:RefreshBubbleInfo()
			iter_27_1:RefreshSatiety()
		end
	end

	arg_27_0.levelText_.text = var_0_1(arg_27_0.levelID)

	arg_27_0:RefreshLastTime()
	arg_27_0:RefreshExtendPoint()
	arg_27_0:RefreshExtendAddition()
	arg_27_0:RefreshBatterNum()
	arg_27_0:RefreshMaterialTime()
	arg_27_0:RefreshSkillItemList(false)
end

function var_0_0.RefreshStartView(arg_28_0)
	arg_28_0.startCountController:SetSelectedState("true")
	arg_28_0.reduceController:SetSelectedState("false")

	arg_28_0.startTitleText.text = var_0_1(arg_28_0.levelID)

	local var_28_0 = ActivityLinkGameCfg[arg_28_0.levelID].time_limit

	arg_28_0.startTimeText.text = string.format(GetTips("ACTIVITY_LINKGAME_TIME"), tostring(var_28_0))

	local var_28_1 = DormLinkGameData:GetSceneData().difficultyLevel

	if var_28_1 == 1 then
		arg_28_0.diffController:SetSelectedState("eazy")
	elseif var_28_1 == 2 then
		arg_28_0.diffController:SetSelectedState("hard")
	elseif var_28_1 == 9 then
		arg_28_0.diffController:SetSelectedState("SP")
	end

	arg_28_0:RefreshSkillItemList(true)
end

function var_0_0.RefreshLastTime(arg_29_0, arg_29_1)
	arg_29_1 = arg_29_1 or DormLinkGameData:GetSceneData().limitTime
	arg_29_0.lastTimeText_.text = string.format(GetTips("ACTIVITY_LINKGAME_REST_TIME"), arg_29_1)
end

function var_0_0.RefreshSkillItemList(arg_30_0, arg_30_1)
	arg_30_0.skillItemState = arg_30_1

	if ActivityLinkGameCfg[arg_30_0.levelID].property_limit == 1 then
		arg_30_0.listController:SetSelectedState("true")

		arg_30_0.skillItemList = ActivityLinkGameGoodsCfg.all

		arg_30_0.itemScroll:StartScroll(#arg_30_0.skillItemList)
	else
		arg_30_0.listController:SetSelectedState("false")
	end
end

function var_0_0.indexSkillItemList(arg_31_0, arg_31_1, arg_31_2)
	arg_31_2:RefreshUI(arg_31_0.skillItemList[arg_31_1], arg_31_0.skillItemState)
	arg_31_2:UseItem(function(arg_32_0)
		if arg_31_0.canInteractFlag then
			if ActivityLinkGameGoodsCfg[arg_32_0].coin_num <= DormLinkGameData:GetCurCnaUseTokenNum() then
				DormLinkGameTools:UseSkillItem(arg_32_0)
				arg_31_0:ShowUseItemTips(arg_32_0)
				arg_31_0.itemScroll:Refresh()
			else
				ShowTips(GetTips("ACTIVITY_LINKGAME_COIN_NOT_ENOUGH"))
			end
		end
	end)
end

function var_0_0.RefreshMaterialTime(arg_33_0, arg_33_1)
	if arg_33_1 then
		arg_33_0.countdownText_.text = string.format(GetTips("ACTIVITY_LINKGAME_CELL_PUSH"), arg_33_1)
	else
		arg_33_1 = DormLinkGameData:GetGameCacheInfo().generateInterval
		arg_33_0.countdownText_.text = string.format(GetTips("ACTIVITY_LINKGAME_CELL_PUSH"), GameSetting.linkgame_count_down.value[1] + arg_33_1)
	end
end

function var_0_0.RefreshExtendPoint(arg_34_0)
	if not arg_34_0.extendNum then
		local var_34_0 = 0
	end

	local var_34_1 = DormLinkGameData:GetGameCacheInfo()

	arg_34_0.extendNum = var_34_1.extendPoint - var_34_1.drainPoint
	arg_34_0.extendNumText_.text = var_34_1.extendPoint - var_34_1.drainPoint
end

function var_0_0.RefreshDrainPoint(arg_35_0, arg_35_1)
	arg_35_0.reduceController:SetSelectedState("true")
	arg_35_0.extendAnimaton:Play()

	arg_35_0.reduceNum.text = -1 * arg_35_1

	if not arg_35_0.reduceTimer then
		local var_35_0 = GameSetting.linkgame_score_tips_time.value[1]

		arg_35_0.reduceTimer = Timer.New(function()
			arg_35_0.reduceController:SetSelectedState("false")
		end, var_35_0, 1)
	else
		arg_35_0.reduceTimer:Reset()
	end

	arg_35_0.reduceTimer:Start()
end

function var_0_0.RefreshExtendAddition(arg_37_0)
	arg_37_0.extendAdditionText_.text = string.format("+%d", DormLinkGameData:GetExtendAddition()) .. "%"
end

function var_0_0.RefreshBatterNum(arg_38_0)
	if DormLinkGameData:GetBatterNum() > 0 then
		arg_38_0.batterController:SetSelectedState("true")

		arg_38_0.BatterNum.text = string.format(GetTips("ACTIVITY_LINKGAME_HIT"), DormLinkGameData:GetBatterNum())

		arg_38_0.comboAnimaton:Play()
	else
		arg_38_0.batterController:SetSelectedState("false")
	end
end

function var_0_0.RefreshCustomerBubble(arg_39_0)
	if not arg_39_0.bubbleList then
		arg_39_0.bubbleList = {}

		local var_39_0 = DormLinkGameData:GetCustomerList()

		for iter_39_0, iter_39_1 in pairs(var_39_0) do
			arg_39_0.bubbleList[iter_39_0] = DormLinkGameBubbleItem.New(arg_39_0.bubbleGo_, iter_39_0, arg_39_0.transform_)

			arg_39_0.bubbleList[iter_39_0]:RefreshBubbleInfo()
		end
	end
end

function var_0_0.ShowUseItemTips(arg_40_0, arg_40_1)
	local var_40_0 = ActivityLinkGameGoodsCfg[arg_40_1]

	if var_40_0 then
		arg_40_0.useItemController:SetSelectedState("true")

		local var_40_1 = var_40_0.name
		local var_40_2 = var_40_0.coin_num
		local var_40_3 = DormLinkGameData:GetMainActivityID()
		local var_40_4 = DormLinkGameTools:GetCurrencyID(var_40_3)

		arg_40_0.revokeIcon.sprite = ItemTools.getItemSprite(var_40_4)
		arg_40_0.revokeText.text = string.format(GetTips("ACTIVITY_LINKGAME_COST_TIPS"), var_40_2, GetI18NText(var_40_1))

		if arg_40_0.itemShowTimer then
			arg_40_0.itemShowTimer:Stop()

			arg_40_0.itemShowTimer = nil
		end

		local var_40_5 = GameSetting.linkgame_tips_time.value[1]

		arg_40_0.itemShowTimer = Timer.New(function()
			arg_40_0.useItemController:SetSelectedState("false")
		end, var_40_5, 1)

		arg_40_0.itemShowTimer:Start()
	end
end

function var_0_0.StartGame(arg_42_0)
	manager.notify:Invoke(LIANLIANKAN_GAME_START)
	arg_42_0.startCountController:SetSelectedState("false")
	arg_42_0:RefreshRunView()
	arg_42_0:StartCountDownShow()
end

function var_0_0.StartCountDownShow(arg_43_0)
	arg_43_0.showCountController:SetSelectedState("true")
	arg_43_0.numAnimaton:Play()
	arg_43_0.countDowmController:SetSelectedState("num")

	if not arg_43_0.countTimer then
		arg_43_0.countDownTime = GameSetting.linkgame_start_time.value[1]
		arg_43_0.countDownText.text = arg_43_0.countDownTime
		arg_43_0.countTimer = Timer.New(function()
			arg_43_0.countDownTime = arg_43_0.countDownTime - 1

			if arg_43_0.countDownTime > 0 then
				arg_43_0.countDownText.text = arg_43_0.countDownTime

				arg_43_0.numAnimaton:Play()
			else
				arg_43_0.countDowmController:SetSelectedState("start")
				arg_43_0:StartCountDownTextShow()
			end
		end, 1, -1)
	else
		arg_43_0.countTimer:Reset()
	end

	arg_43_0.countTimer:Start()
	arg_43_0.maskController:SetSelectedState("true")
end

function var_0_0.DisposeTimer(arg_45_0)
	if arg_45_0.countTimer then
		arg_45_0.countTimer:Stop()

		arg_45_0.countTimer = nil
	end

	if arg_45_0.textCountTimer then
		arg_45_0.textCountTimer:Stop()

		arg_45_0.textCountTimer = nil
	end
end

function var_0_0.ResetView(arg_46_0)
	arg_46_0.showCountController:SetSelectedState("false")
	arg_46_0.batterController:SetSelectedState("false")
	arg_46_0.useItemController:SetSelectedState("false")
	arg_46_0.reduceController:SetSelectedState("false")
end

function var_0_0.StartCountDownTextShow(arg_47_0)
	if arg_47_0.countTimer then
		arg_47_0.countTimer:Stop()
	end

	if not arg_47_0.textCountTimer then
		arg_47_0.textCountDownTime = GameSetting.linkgame_word_disappear_time.value[1] / 100
		arg_47_0.textCountTimer = Timer.New(function()
			arg_47_0.showCountController:SetSelectedState("false")
			arg_47_0.maskController:SetSelectedState("false")
			DormLinkGameData:PlayerStartGame()
		end, arg_47_0.textCountDownTime, 1)
	else
		arg_47_0.textCountTimer:Reset()
	end

	arg_47_0.textCountTimer:Start()
end

function var_0_0.OnExit(arg_49_0)
	arg_49_0:RemoveAllEventListener()
end

function var_0_0.Dispose(arg_50_0)
	arg_50_0:DisposeTimer()

	if arg_50_0.itemScroll then
		arg_50_0.itemScroll:Dispose()

		arg_50_0.itemScroll = nil
	end

	if arg_50_0.bubbleList then
		for iter_50_0, iter_50_1 in pairs(arg_50_0.bubbleList) do
			iter_50_1:Dispose()
		end
	end

	var_0_0.super.Dispose(arg_50_0)
end

return var_0_0
