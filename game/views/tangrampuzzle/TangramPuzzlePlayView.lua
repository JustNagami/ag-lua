local var_0_0 = class("TangramPuzzlePlayView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return TangramPuzzleTools.GetPlayViewUIName(arg_1_0.params_.activityID)
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0.puzzleItemList_ = {}
	arg_3_0.puzzleGlobalIndexListByRegionTypeAndLocalIndex_ = {}
	arg_3_0.regionContentItemList_ = {}
	arg_3_0.regionItemList_ = {}
	arg_3_0.clueItemList_ = {}
	arg_3_0.statusConst_ = {
		PLAY = 0,
		EDIT = 1,
		FINAL = 2,
		NONE = -1
	}

	arg_3_0:InitUI()
	arg_3_0:AddUIListener()

	arg_3_0.statusController_ = ControllerUtil.GetController(arg_3_0.transform_, "status")
	arg_3_0.autoPutBtnController_ = ControllerUtil.GetController(arg_3_0.autoBtn_.transform, "status")
	arg_3_0.finalRewardController_ = ControllerUtil.GetController(arg_3_0.finalRewardPanelTrans_, "status")
	arg_3_0.dragController_ = ControllerUtil.GetController(arg_3_0.transform_, "drag")
	arg_3_0.beginDragPuzzleHandler_ = handler(arg_3_0, arg_3_0.OnBeginDragPuzzle)
	arg_3_0.endDragPuzzleHandler_ = handler(arg_3_0, arg_3_0.OnDragPuzzleEnd)
	arg_3_0.onClickPuzzleHandler_ = handler(arg_3_0, arg_3_0.OnClickPuzzle)

	arg_3_0:InitAnimNode()
end

function var_0_0.InitUI(arg_4_0)
	arg_4_0:BindCfgUI()
end

function var_0_0.AddUIListener(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.exitEditBtn_, nil, function()
		arg_5_0:ExitEdit()
		arg_5_0:SwitchToPlay()
	end)
	arg_5_0:AddBtnListener(arg_5_0.rollClockwiseBtn_, nil, function()
		if not arg_5_0.editPuzzleIndex_ then
			ShowTips("ACTIVITY_PUZZLE_III_SELECT")

			return
		end

		local var_7_0, var_7_1 = arg_5_0.puzzleItemList_[arg_5_0.editPuzzleIndex_]:GetCurRegion()

		TangramPuzzleAction.RotateRegion(arg_5_0.activityID_, var_7_0, 1)
	end)
	arg_5_0:AddBtnListener(arg_5_0.rollAntiClockwiseBtn_, nil, function()
		if not arg_5_0.editPuzzleIndex_ then
			ShowTips("ACTIVITY_PUZZLE_III_SELECT")

			return
		end

		local var_8_0, var_8_1 = arg_5_0.puzzleItemList_[arg_5_0.editPuzzleIndex_]:GetCurRegion()

		TangramPuzzleAction.RotateRegion(arg_5_0.activityID_, var_8_0, -1)
	end)
	arg_5_0:AddBtnListener(arg_5_0.autoBtn_, nil, function()
		if not arg_5_0:IsActivityTime() then
			return
		end

		if arg_5_0.isPlayingFirstTips_ == true then
			arg_5_0:ClickFirstTips()
		end

		local var_9_0 = arg_5_0.puzzleCfg_.coin_id[1]
		local var_9_1 = var_9_0[1]

		if ItemTools.getItemNum(var_9_1) < var_9_0[2] then
			ShowTips("ACTIVITY_PUZZLE_III_NOT_ENOUGH")

			return
		end

		local var_9_2 = TangramPuzzleData:GetUnlockRegionDic(arg_5_0.activityID_)
		local var_9_3 = TangramPuzzleTools.GetRegionCfg(arg_5_0.activityID_)

		for iter_9_0, iter_9_1 in pairs(var_9_3) do
			if not var_9_2[iter_9_0] then
				ShowTips("ACTIVITY_PUZZLE_III_AUTO_AREA")

				return
			end
		end

		local var_9_4 = false

		for iter_9_2, iter_9_3 in pairs(var_9_3) do
			if TangramPuzzleTools.CheckWrongSideByRegionID(arg_5_0.activityID_, iter_9_2) then
				var_9_4 = true

				break
			end
		end

		if var_9_4 == true then
			TangramPuzzleAction.Operation(arg_5_0.activityID_, TangramPuzzleAction.OPERATION_TYPE.FULL_AUTO_PUT)
		end
	end)
	arg_5_0:AddBtnListener(arg_5_0.rewardBtn_, nil, function()
		if not arg_5_0:IsActivityTime() then
			return
		end

		manager.windowBar:HideBar()
		JumpTools.OpenPageByJump("tangramPuzzleReward", {
			activityID = arg_5_0.activityID_
		})
	end)
	arg_5_0:AddBtnListener(arg_5_0.firstTipsBtn_, nil, function()
		arg_5_0:ClickFirstTips()
	end)

	arg_5_0.clueMaskListener_.isPassEvent = true
	arg_5_0.clueMaskListener_.isPassAll = false
	arg_5_0.clueMaskListener_.isExecuteHierarchy = true

	arg_5_0.clueMaskListener_:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.PointerClick, LuaHelper.EventTriggerAction1(handler(arg_5_0, arg_5_0.OnClickClueMask)))
end

function var_0_0.ClickFirstTips(arg_12_0)
	arg_12_0.isPlayingFirstTips_ = false

	TangramPuzzleData:SetFirstTips(arg_12_0.activityID_, true)
	SetActive(arg_12_0.firstTipsPanelGo_, false)
end

function var_0_0.OnEnter(arg_13_0)
	local var_13_0 = ActivityData:GetActivityData(arg_13_0.params_.activityID)

	arg_13_0.startTime_ = var_13_0.startTime
	arg_13_0.stopTime_ = var_13_0.stopTime

	if arg_13_0.activityID_ ~= arg_13_0.params_.activityID then
		arg_13_0.activityID_ = arg_13_0.params_.activityID
		arg_13_0.puzzleCfg_ = TangramPuzzleCfg[arg_13_0.params_.activityID]

		arg_13_0:Spawn()
	end

	arg_13_0:RefreshUI()
	SetActive(arg_13_0.maskGo_, false)
	SetActive(arg_13_0.autoPutPanelGo_, false)
	arg_13_0.dragController_:SetSelectedState("false")

	local var_13_1, var_13_2 = arg_13_0:CheckFirstEnter()

	if var_13_1 == true then
		for iter_13_0, iter_13_1 in ipairs(var_13_2) do
			TangramPuzzleData:SetFirstEnterRegionType(arg_13_0.activityID_, iter_13_1, true)
		end

		arg_13_0:PlayFirstEnterAnim(var_13_2)
	elseif TangramPuzzleData:GetFirstTips(arg_13_0.activityID_) ~= true then
		SetActive(arg_13_0.firstEnterPanelGo_, false)
		arg_13_0:PlayFirstTipsAnim()
	else
		SetActive(arg_13_0.firstEnterPanelGo_, false)
		SetActive(arg_13_0.firstTipsPanelGo_, false)

		arg_13_0.isPlayingFirstTips_ = false
	end

	arg_13_0:AddTimer()
	arg_13_0:RegistEventListener(ACTIVITY_UPDATE, handler(arg_13_0, arg_13_0.OnPuzzleActivityUpdate))
end

function var_0_0.OnExit(arg_14_0)
	manager.windowBar:HideBar()
	arg_14_0:ExitEdit()
	arg_14_0:StopTimer()

	if arg_14_0.animtimer_ ~= nil then
		arg_14_0.animtimer_:Stop()

		arg_14_0.animtimer_ = nil
	end

	if arg_14_0.firstAnimTimer_ then
		arg_14_0.firstAnimTimer_:Stop()

		arg_14_0.firstAnimTimer_ = nil
	end

	arg_14_0:StopAnimNode()

	for iter_14_0, iter_14_1 in pairs(arg_14_0.regionContentItemList_) do
		iter_14_1:OnExit()
	end

	for iter_14_2, iter_14_3 in pairs(arg_14_0.regionItemList_) do
		iter_14_3:OnExit()
	end

	for iter_14_4, iter_14_5 in pairs(arg_14_0.puzzleItemList_) do
		iter_14_5:OnExit()
	end

	arg_14_0:RemoveAllEventListener()
end

function var_0_0.OnTop(arg_15_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR,
		INFO_BAR,
		arg_15_0.puzzleCfg_.coin_id[1][1]
	})
	manager.windowBar:SetBarCanClick(arg_15_0.puzzleCfg_.coin_id[1][1], true)
	manager.windowBar:RegistBackCallBack(function()
		arg_15_0:OnClickClueMask()
		JumpTools.Back()
	end)
	manager.windowBar:RegistHomeCallBack(function()
		arg_15_0:OnClickClueMask()
		gameContext:Go("/home", nil, nil, true)
	end)
	manager.windowBar:RegistInfoCallBack(function()
		arg_15_0:OnClickClueMask()

		local var_18_0 = arg_15_0.puzzleCfg_.coin_id[1][1]
		local var_18_1 = string.format(GetTips("ACTIVITY_PUZZLE_III_EXPLAIN"), ItemTools.getItemName(var_18_0))

		JumpTools.OpenPageByJump("gameHelp", {
			icon = "icon_i",
			iconColor = Color(1, 1, 1),
			title = GetTips("STAGE_DESCRIPE"),
			content = var_18_1
		})
	end)
end

function var_0_0.Dispose(arg_19_0)
	arg_19_0.beginDragPuzzleHandler_ = nil
	arg_19_0.endDragPuzzleHandler_ = nil
	arg_19_0.onClickPuzzleHandler_ = nil

	arg_19_0.clueMaskListener_:RemoveListenerType(UnityEngine.EventSystems.EventTriggerType.PointerClick)
	arg_19_0:DespawnPuzzle()
	arg_19_0:DespawnClue()
	arg_19_0:DisposeAnimNode()
	var_0_0.super.Dispose(arg_19_0)
end

function var_0_0.Spawn(arg_20_0)
	arg_20_0:DespawnPuzzle()
	arg_20_0:SpawnPuzzle()
	arg_20_0:DespawnClue()
	arg_20_0:SpawnClue()
end

function var_0_0.RefreshUI(arg_21_0)
	if not TangramPuzzleTools.CheckRegionAllRight(arg_21_0.activityID_) then
		arg_21_0:SwitchToPlay()
		arg_21_0:CheckRegionReward()
	else
		arg_21_0:SwitchToFinal()
		arg_21_0:CheckFinalReward()
	end

	arg_21_0.completeImg_.sprite = getSpriteWithoutAtlas(arg_21_0.puzzleCfg_.path .. arg_21_0.puzzleCfg_.album_id)
end

function var_0_0.SwitchToPlay(arg_22_0)
	arg_22_0.curStatus_ = arg_22_0.statusConst_.PLAY

	arg_22_0.statusController_:SetSelectedIndex(arg_22_0.curStatus_)
	arg_22_0:RefreshPlayUI()
end

function var_0_0.SwitchToEdit(arg_23_0)
	arg_23_0.curStatus_ = arg_23_0.statusConst_.EDIT

	arg_23_0.statusController_:SetSelectedIndex(arg_23_0.curStatus_)
	arg_23_0:RefreshEditUI()
end

function var_0_0.SwitchToFinal(arg_24_0)
	arg_24_0.curStatus_ = arg_24_0.statusConst_.FINAL

	arg_24_0.statusController_:SetSelectedIndex(arg_24_0.curStatus_)
	arg_24_0:RefreshFinalUI()
end

function var_0_0.RefreshPlayUI(arg_25_0)
	arg_25_0:RefreshRegionContentList()
	arg_25_0:RefreshRegionList()
	arg_25_0:RefreshPuzzleList()
	arg_25_0:RefreshClueList()
	arg_25_0:RefreshAutoPutCost()
end

function var_0_0.RefreshEditUI(arg_26_0)
	local var_26_0 = arg_26_0.puzzleItemList_[arg_26_0.editPuzzleIndex_]

	var_26_0:SetSelect(true)

	local var_26_1, var_26_2 = var_26_0:GetCurRegion()
	local var_26_3 = TangramPuzzleTools.GetRegionType(arg_26_0.activityID_, var_26_1)

	arg_26_0.curValidPuzzleList_ = arg_26_0.puzzleGlobalIndexListByRegionTypeAndLocalIndex_[var_26_3][var_26_2]

	for iter_26_0, iter_26_1 in ipairs(arg_26_0.curValidPuzzleList_) do
		local var_26_4 = arg_26_0.puzzleItemList_[iter_26_1]

		if var_26_4 ~= var_26_0 then
			var_26_4:SetHighLight(true)
		end
	end
end

function var_0_0.CanEnterEdit(arg_27_0, arg_27_1)
	local var_27_0, var_27_1 = arg_27_0.puzzleItemList_[arg_27_1]:GetCurRegion()
	local var_27_2 = TangramPuzzleTools.GetRegionType(arg_27_0.activityID_, var_27_0)

	if TangramPuzzleTools.CheckRegionAllRightByType(arg_27_0.activityID_, var_27_2) then
		return false
	end

	return true
end

function var_0_0.EnterEdit(arg_28_0, arg_28_1)
	arg_28_0.editPuzzleIndex_ = arg_28_1

	arg_28_0:SwitchToEdit()
end

function var_0_0.ExitEdit(arg_29_0)
	if arg_29_0.curStatus_ == arg_29_0.statusConst_.EDIT then
		arg_29_0:ResetEditPuzzle()

		arg_29_0.curStatus_ = arg_29_0.statusConst_.NONE
	end
end

function var_0_0.SwitchEditTarget(arg_30_0, arg_30_1)
	if arg_30_0.curStatus_ == arg_30_0.statusConst_.EDIT then
		arg_30_0:ResetEditPuzzle()

		arg_30_0.editPuzzleIndex_ = arg_30_1

		arg_30_0:RefreshEditUI()
	end
end

function var_0_0.ResetEditPuzzle(arg_31_0)
	if arg_31_0.curValidPuzzleList_ then
		for iter_31_0, iter_31_1 in ipairs(arg_31_0.curValidPuzzleList_) do
			arg_31_0.puzzleItemList_[iter_31_1]:SetHighLight(false)
		end

		arg_31_0.curValidPuzzleList_ = nil
	end

	if arg_31_0.editPuzzleIndex_ then
		arg_31_0.puzzleItemList_[arg_31_0.editPuzzleIndex_]:SetSelect(false)

		arg_31_0.editPuzzleIndex_ = nil
	end
end

function var_0_0.RefreshFinalUI(arg_32_0)
	arg_32_0:RefreshClueList()

	local var_32_0 = arg_32_0.puzzleCfg_.final_reward[1][1]
	local var_32_1 = arg_32_0.puzzleCfg_.final_reward[1][2]

	arg_32_0.finalRewardIcon_.sprite = ItemTools.getItemSprite(var_32_0)

	if TangramPuzzleTools.IsAllClueCompleted(arg_32_0.activityID_) then
		if TangramPuzzleData:GetRegionReceivedDic(arg_32_0.activityID_)[0] then
			arg_32_0.finalRewardTipsText_.text = string.format(GetTips("ACTIVITY_PUZZLE_III_FINALREWARD_GET"), var_32_1)

			arg_32_0.finalRewardController_:SetSelectedState("received")
		end
	else
		arg_32_0.finalRewardTipsText_.text = string.format(GetTips("ACTIVITY_PUZZLE_III_FINALREWARD_SHOW"), var_32_1)

		arg_32_0.finalRewardController_:SetSelectedState("normal")
	end
end

function var_0_0.OnPuzzleActivityUpdate(arg_33_0, arg_33_1)
	if arg_33_1 == arg_33_0.activityID_ then
		arg_33_0:RefreshPlayUI()
	end
end

function var_0_0.OnPuzzleAutoPut(arg_34_0)
	arg_34_0:ExitEdit()

	arg_34_0.blackboard_.isAutoPutPuzzle_ = true

	if not arg_34_0:CheckRegionReward() then
		arg_34_0:CreateAnimNodeList()
		arg_34_0:StartRunAnimNode()
	end
end

function var_0_0.RefreshPuzzleList(arg_35_0)
	local var_35_0 = TangramPuzzleData:GetCurPuzzleDic(arg_35_0.activityID_)

	for iter_35_0, iter_35_1 in ipairs(arg_35_0.puzzleItemList_) do
		if var_35_0[iter_35_0] then
			arg_35_0.puzzleItemList_[iter_35_0]:SetData(var_35_0[iter_35_0], arg_35_0.activityID_)
		else
			arg_35_0.puzzleItemList_[iter_35_0]:SetData(0, arg_35_0.activityID_)
		end
	end
end

function var_0_0.RefreshAutoPutCost(arg_36_0)
	local var_36_0 = arg_36_0.puzzleCfg_.coin_id[1]
	local var_36_1 = var_36_0[2]

	arg_36_0.autoPutCostText_.text = "x" .. var_36_1
	arg_36_0.autoPutCostImg_.sprite = ItemTools.getItemSprite(var_36_0[1])

	local var_36_2 = ItemTools.getItemNum(var_36_0[1])

	arg_36_0.autoPutBtnController_:SetSelectedIndex(var_36_2 < var_36_1 and 1 or 0)
end

function var_0_0.MovePuzzle(arg_37_0, arg_37_1, arg_37_2, arg_37_3)
	arg_37_0.blackboard_.isMoveImmediately_ = arg_37_3

	TangramPuzzleAction.MovePuzzle(arg_37_0.activityID_, arg_37_1, arg_37_2)
end

function var_0_0.OnMovePuzzle(arg_38_0, arg_38_1, arg_38_2)
	arg_38_0:ExitEdit()

	arg_38_0.blackboard_.isMovePuzzle_ = true
	arg_38_0.blackboard_.moveOriginPuzzleIndex_ = arg_38_1
	arg_38_0.blackboard_.moveTargetPuzzleIndex_ = arg_38_2

	local var_38_0 = arg_38_0.puzzleItemList_[arg_38_1]:GetCurRegion()
	local var_38_1 = TangramPuzzleTools.GetRegionType(arg_38_0.activityID_, var_38_0)

	arg_38_0.blackboard_.needCheckAllRightRegionType_ = true
	arg_38_0.blackboard_.checkAllRightRegionTypeDic_ = arg_38_0.blackboard_.checkAllRightRegionTypeDic_ or {}
	arg_38_0.blackboard_.checkAllRightRegionTypeDic_[var_38_1] = true

	if not arg_38_0:CheckRegionReward() then
		arg_38_0:CreateAnimNodeList()
		arg_38_0:StartRunAnimNode()
	end
end

function var_0_0.UpdatePuzzleData(arg_39_0, arg_39_1)
	local var_39_0 = TangramPuzzleData:GetCurPuzzleDic(arg_39_0.activityID_)[arg_39_1] or 0
	local var_39_1 = arg_39_0.puzzleItemList_[arg_39_1]

	var_39_1:SetData(var_39_0, arg_39_0.activityID_)
	var_39_1:RecoverTrans()
end

function var_0_0.OnBeginDragPuzzle(arg_40_0, arg_40_1)
	arg_40_0.dragController_:SetSelectedState("true")

	if arg_40_0.isPlayingFirstTips_ == true then
		arg_40_0:ClickFirstTips()
	end

	arg_40_0:OnClickClueMask()

	if arg_40_0:CanEnterEdit(arg_40_1) then
		if arg_40_0.curStatus_ == arg_40_0.statusConst_.EDIT then
			arg_40_0:SwitchEditTarget(arg_40_1)
		else
			arg_40_0:EnterEdit(arg_40_1)
		end

		local var_40_0 = arg_40_0.puzzleItemList_[arg_40_1]
		local var_40_1, var_40_2 = var_40_0:GetCurRegion()
		local var_40_3 = TangramPuzzleTools.GetRegionType(arg_40_0.activityID_, var_40_1)

		arg_40_0.curValidPuzzleList_ = arg_40_0.puzzleGlobalIndexListByRegionTypeAndLocalIndex_[var_40_3][var_40_2]
		arg_40_0.curValidPuzzlePosList_ = {}

		for iter_40_0, iter_40_1 in ipairs(arg_40_0.curValidPuzzleList_) do
			arg_40_0.curValidPuzzlePosList_[#arg_40_0.curValidPuzzlePosList_ + 1] = arg_40_0.puzzleItemList_[iter_40_1].transform_.position
		end

		var_40_0:SetTransParent(arg_40_0.dragPanelTrans_)

		return true
	else
		return false
	end
end

function var_0_0.OnDragPuzzleEnd(arg_41_0, arg_41_1, arg_41_2)
	arg_41_0.dragController_:SetSelectedState("false")

	local var_41_0 = arg_41_0.puzzleItemList_[arg_41_1]
	local var_41_1, var_41_2 = TangramPuzzleTools.FindClosestTarget(arg_41_0.curValidPuzzlePosList_, arg_41_2)
	local var_41_3 = arg_41_0.curValidPuzzleList_[var_41_1]
	local var_41_4 = arg_41_0.puzzleItemList_[var_41_3]

	if var_41_2 > arg_41_0.puzzleCfg_.puzzle_distance or var_41_4 == var_41_0 then
		var_41_0:RecoverTrans()
	else
		local var_41_5 = var_41_4:GetGlobalIndex()

		arg_41_0:MovePuzzle(arg_41_1, var_41_5, true)
	end
end

function var_0_0.OnClickPuzzle(arg_42_0, arg_42_1)
	if arg_42_0.isPlayingFirstTips_ == true then
		arg_42_0:ClickFirstTips()
	end

	arg_42_0:OnClickClueMask()

	if arg_42_0.curStatus_ == arg_42_0.statusConst_.PLAY and arg_42_0.curStatus_ ~= arg_42_0.statusConst_.EDIT then
		if arg_42_0:CanEnterEdit(arg_42_1) then
			arg_42_0:EnterEdit(arg_42_1)
		end
	elseif arg_42_0.puzzleItemList_[arg_42_1] ~= arg_42_0.puzzleItemList_[arg_42_0.editPuzzleIndex_] then
		arg_42_0:SwitchEditTarget(arg_42_1)
	else
		arg_42_0:ExitEdit()
		arg_42_0:SwitchToPlay()
	end
end

function var_0_0.SpawnPuzzle(arg_43_0)
	local var_43_0 = arg_43_0.puzzleCfg_.area_type_list

	arg_43_0.regionContentItemList_ = arg_43_0.regionContentItemList_ or {}
	arg_43_0.regionItemList_ = arg_43_0.regionItemList_ or {}
	arg_43_0.puzzleItemList_ = arg_43_0.puzzleItemList_ or {}

	local var_43_1 = 0
	local var_43_2 = 0
	local var_43_3 = arg_43_0.regionContetnPanelTrans_.childCount

	for iter_43_0 = 1, var_43_3 do
		local var_43_4 = arg_43_0.regionContetnPanelTrans_:GetChild(iter_43_0 - 1).gameObject
		local var_43_5 = var_43_0[iter_43_0][1]
		local var_43_6 = var_43_0[iter_43_0][2]

		if not arg_43_0.regionContentItemList_[var_43_5] then
			arg_43_0.regionContentItemList_[var_43_5] = TangramRegionContentItem.New(var_43_4, var_43_5, var_43_6)
		end

		local var_43_7 = arg_43_0.regionContentItemList_[var_43_5]:GetRegionContentTrans()
		local var_43_8 = var_43_7.childCount

		for iter_43_1 = 1, var_43_8 do
			var_43_1 = var_43_1 + 1

			local var_43_9 = var_43_7:GetChild(iter_43_1 - 1).gameObject
			local var_43_10 = var_43_6[iter_43_1]

			if not arg_43_0.regionItemList_[var_43_10] then
				arg_43_0.regionItemList_[var_43_10] = TangramRegionItem.New(var_43_9)
			end

			arg_43_0.regionItemList_[var_43_10].gameObject_.name = var_43_10

			local var_43_11 = arg_43_0.puzzleCfg_.correct_array[var_43_1]
			local var_43_12 = arg_43_0.regionItemList_[var_43_10]:GetPuzzleContent()
			local var_43_13 = var_43_12.childCount

			for iter_43_2 = 1, var_43_13 do
				var_43_2 = var_43_2 + 1

				local var_43_14 = var_43_12:GetChild(iter_43_2 - 1).gameObject

				if not arg_43_0.puzzleItemList_[var_43_2] then
					local var_43_15 = var_43_11[iter_43_2]
					local var_43_16 = TangramPuzzlePiece.New(var_43_14, var_43_2, var_43_15)

					var_43_16:RegistBeginDragCallback(arg_43_0.beginDragPuzzleHandler_)
					var_43_16:RegistEndDragCallback(arg_43_0.endDragPuzzleHandler_)
					var_43_16:RegistClickCallback(arg_43_0.onClickPuzzleHandler_)
					var_43_16:SetRegionID(var_43_10, iter_43_2)

					var_43_16.gameObject_.name = var_43_2
					arg_43_0.puzzleItemList_[var_43_2] = var_43_16
					arg_43_0.puzzleGlobalIndexListByRegionTypeAndLocalIndex_[var_43_5] = arg_43_0.puzzleGlobalIndexListByRegionTypeAndLocalIndex_[var_43_5] or {}
					arg_43_0.puzzleGlobalIndexListByRegionTypeAndLocalIndex_[var_43_5][iter_43_2] = arg_43_0.puzzleGlobalIndexListByRegionTypeAndLocalIndex_[var_43_5][iter_43_2] or {}

					table.insert(arg_43_0.puzzleGlobalIndexListByRegionTypeAndLocalIndex_[var_43_5][iter_43_2], var_43_2)
				end
			end
		end
	end
end

function var_0_0.DespawnPuzzle(arg_44_0)
	for iter_44_0, iter_44_1 in pairs(arg_44_0.regionContentItemList_) do
		iter_44_1:Dispose()
	end

	arg_44_0.regionContentItemList_ = nil

	for iter_44_2, iter_44_3 in pairs(arg_44_0.regionItemList_) do
		iter_44_3:Dispose()
	end

	arg_44_0.regionItemList_ = nil

	for iter_44_4, iter_44_5 in pairs(arg_44_0.puzzleItemList_) do
		iter_44_5:Dispose()
	end

	arg_44_0.puzzleItemList_ = nil
end

function var_0_0.RefreshRegionContentList(arg_45_0)
	for iter_45_0, iter_45_1 in ipairs(arg_45_0.regionContentItemList_) do
		iter_45_1:SetData(arg_45_0.activityID_)
	end
end

function var_0_0.RefreshRegionList(arg_46_0)
	for iter_46_0, iter_46_1 in ipairs(arg_46_0.regionItemList_) do
		iter_46_1:SetData(arg_46_0.activityID_)
	end
end

function var_0_0.OnRegionRotate(arg_47_0, arg_47_1, arg_47_2)
	local var_47_0, var_47_1 = arg_47_0.puzzleItemList_[arg_47_0.editPuzzleIndex_]:GetCurRegion()
	local var_47_2 = TangramPuzzleTools.GetPuzzleGlobalIndexListByRegionID(arg_47_0.activityID_)[arg_47_1]
	local var_47_3 = #var_47_2
	local var_47_4 = arg_47_2 > 0
	local var_47_5 = var_47_1 + arg_47_2

	if var_47_4 == true and var_47_3 < var_47_5 then
		var_47_5 = var_47_5 % var_47_3
	elseif var_47_4 == false and var_47_5 <= 0 then
		var_47_5 = var_47_5 + var_47_3
	end

	local var_47_6 = var_47_2[var_47_5]

	arg_47_0.blackboard_.newEditIndex_ = var_47_6

	arg_47_0:ExitEdit()

	arg_47_0.blackboard_.isRotateRegion_ = true
	arg_47_0.blackboard_.rotateRegionID_ = arg_47_1
	arg_47_0.blackboard_.rotateTimes_ = arg_47_2

	local var_47_7 = TangramPuzzleTools.GetRegionType(arg_47_0.activityID_, arg_47_1)

	arg_47_0.blackboard_.needCheckAllRightRegionType_ = true
	arg_47_0.blackboard_.checkAllRightRegionTypeDic_ = arg_47_0.blackboard_.checkAllRightRegionTypeDic_ or {}
	arg_47_0.blackboard_.checkAllRightRegionTypeDic_[var_47_7] = true

	if not arg_47_0:CheckRegionReward() then
		arg_47_0:CreateAnimNodeList()
		arg_47_0:StartRunAnimNode()
	end
end

function var_0_0.OnRegionReceived(arg_48_0, arg_48_1, arg_48_2)
	arg_48_0.blackboard_.isReceivedRegionReward_ = true
	arg_48_0.blackboard_.receivedRegionList_ = arg_48_1
	arg_48_0.blackboard_.rewardList_ = arg_48_2
	arg_48_0.blackboard_.needCheckAllRightRegionType_ = true
	arg_48_0.blackboard_.checkAllRightRegionTypeDic_ = arg_48_0.blackboard_.checkAllRightRegionTypeDic_ or {}

	for iter_48_0, iter_48_1 in ipairs(arg_48_1) do
		local var_48_0 = TangramPuzzleTools.GetRegionType(arg_48_0.activityID_, iter_48_1)

		arg_48_0.blackboard_.checkAllRightRegionTypeDic_[var_48_0] = true
	end

	arg_48_0:CreateAnimNodeList()
	arg_48_0:StartRunAnimNode()
end

function var_0_0.CheckRegionAllRgithByRegionType(arg_49_0, arg_49_1)
	return (TangramPuzzleTools.CheckRegionAllRightByType(arg_49_0.activityID_, arg_49_1))
end

function var_0_0.CheckRegionAllRight(arg_50_0)
	return (TangramPuzzleTools.CheckRegionAllRight(arg_50_0.activityID_))
end

function var_0_0.CheckRegionReward(arg_51_0)
	local var_51_0, var_51_1 = TangramPuzzleTools.CheckRegionReward(arg_51_0.activityID_)

	if #var_51_0 > 0 then
		TangramPuzzleAction.ReceiveRegionReward(arg_51_0.activityID_, var_51_0, var_51_1)

		return true
	end

	return false
end

function var_0_0.OnClueUpdate(arg_52_0)
	arg_52_0:CheckFinalReward()
end

function var_0_0.RefreshClueList(arg_53_0)
	for iter_53_0, iter_53_1 in pairs(arg_53_0.clueItemList_) do
		iter_53_1:SetData(arg_53_0.activityID_, iter_53_0)
	end
end

function var_0_0.OnClickClueMask(arg_54_0)
	for iter_54_0, iter_54_1 in pairs(arg_54_0.clueItemList_) do
		iter_54_1:SetTipsController(false)
	end
end

function var_0_0.CheckFinalReward(arg_55_0)
	if TangramPuzzleTools.IsAllClueCompleted(arg_55_0.activityID_) and not TangramPuzzleData:IsReceivedFinalReward(arg_55_0.activityID_) then
		TangramPuzzleAction.ReceiveFinalReward(arg_55_0.activityID_)
	end
end

function var_0_0.OnReceivedFinalReward(arg_56_0)
	arg_56_0:RefreshFinalUI()
end

function var_0_0.SpawnClue(arg_57_0)
	arg_57_0.clueItemList_ = {}

	local var_57_0 = arg_57_0.cluePanelTrans_.childCount

	for iter_57_0 = 1, var_57_0 do
		local var_57_1 = arg_57_0.cluePanelTrans_:GetChild(iter_57_0 - 1).gameObject
		local var_57_2 = tonumber(var_57_1.name)

		if not arg_57_0.clueItemList_[var_57_2] then
			arg_57_0.clueItemList_[var_57_2] = TangramPuzzleClueItem.New(var_57_1)
		end
	end
end

function var_0_0.DespawnClue(arg_58_0)
	for iter_58_0, iter_58_1 in pairs(arg_58_0.clueItemList_) do
		iter_58_1:Dispose()
	end

	arg_58_0.clueItemList_ = nil
end

function var_0_0.CheckFirstEnter(arg_59_0)
	local var_59_0 = false
	local var_59_1 = {}
	local var_59_2 = TangramPuzzleData:GetUnlockRegionDic(arg_59_0.activityID_)
	local var_59_3 = TangramPuzzleTools.GetRegionListByType(arg_59_0.activityID_)

	for iter_59_0, iter_59_1 in pairs(var_59_3) do
		if not TangramPuzzleData:GetFirstEnterRegionType(arg_59_0.activityID_, iter_59_0) then
			local var_59_4 = true

			for iter_59_2, iter_59_3 in ipairs(iter_59_1) do
				if not var_59_2[iter_59_3] then
					var_59_4 = false

					break
				end
			end

			if var_59_4 == true and not TangramPuzzleTools.IsAllRegionReceived(arg_59_0.activityID_, iter_59_0) then
				var_59_0 = true
				var_59_1[#var_59_1 + 1] = iter_59_0
			end
		end
	end

	return var_59_0, var_59_1
end

function var_0_0.PlayFirstEnterAnim(arg_60_0, arg_60_1)
	SetActive(arg_60_0.maskGo_, true)
	SetActive(arg_60_0.firstEnterPanelGo_, false)

	local var_60_0 = {}
	local var_60_1 = TangramPuzzleTools.GetRegionListByType(arg_60_0.activityID_)

	for iter_60_0, iter_60_1 in ipairs(arg_60_1) do
		local var_60_2 = var_60_1[iter_60_1]

		for iter_60_2, iter_60_3 in ipairs(var_60_2) do
			local var_60_3 = TangramPuzzleTools.GetPuzzleGlobalIndexListByRegionID(arg_60_0.activityID_)[iter_60_3]

			for iter_60_4, iter_60_5 in ipairs(var_60_3) do
				var_60_0[#var_60_0 + 1] = arg_60_0.puzzleItemList_[iter_60_5]
			end
		end
	end

	if #var_60_0 == 0 then
		return
	end

	for iter_60_6, iter_60_7 in ipairs(var_60_0) do
		iter_60_7:SetActive(false)
	end

	arg_60_0:PlayPuzzlePieceEnterAnim(var_60_0, 1)

	arg_60_0.firstTipsText_.text = GetTips("ACTIVITY_PUZZLE_III_FIRSTSHOW")
end

function var_0_0.PlayPuzzlePieceEnterAnim(arg_61_0, arg_61_1, arg_61_2)
	if arg_61_2 > #arg_61_1 then
		SetActive(arg_61_0.firstEnterPanelGo_, true)
		arg_61_0:PlayAnim(arg_61_0.firstEnterAnim_, "JigsawPuzzleUI_firstEnterPanel", function()
			SetActive(arg_61_0.firstEnterPanelGo_, false)
			SetActive(arg_61_0.maskGo_, false)
			arg_61_0:PlayFirstTipsAnim()
		end)

		return
	end

	arg_61_1[arg_61_2]:PlayEnterAnim(function()
		arg_61_2 = arg_61_2 + 1

		arg_61_0:PlayPuzzlePieceEnterAnim(arg_61_1, arg_61_2)
	end)
	manager.audio:PlayEffect("minigame_activity_2_1", "minigame_activity_2_1_connect_cancel", "")
end

function var_0_0.PlayFirstTipsAnim(arg_64_0)
	arg_64_0.isPlayingFirstTips_ = true

	SetActive(arg_64_0.firstTipsPanelGo_, true)

	arg_64_0.firstTipsText_.text = GetTips("ACTIVITY_PUZZLE_III_FIRSTSHOW")
end

function var_0_0.PlayAnim(arg_65_0, arg_65_1, arg_65_2, arg_65_3)
	if not arg_65_1 then
		if arg_65_3 then
			arg_65_3()
		end

		return
	end

	SetActive(arg_65_0.maskGo_, true)

	arg_65_1.enabled = true

	arg_65_1:Play(arg_65_2, -1, 0)
	arg_65_1:Update(0)

	if arg_65_0.animtimer_ then
		arg_65_0.animtimer_:Stop()

		arg_65_0.animtimer_ = nil
	end

	arg_65_0.animtimer_ = Timer.New(function()
		local var_66_0 = arg_65_1:GetCurrentAnimatorStateInfo(0)

		if var_66_0:IsName(arg_65_2) and var_66_0.normalizedTime >= 1 then
			if arg_65_0.animtimer_ ~= nil then
				arg_65_0.animtimer_:Stop()

				arg_65_0.animtimer_ = nil
			end

			SetActive(arg_65_0.maskGo_, false)

			if arg_65_3 then
				arg_65_3()
			end
		end
	end, 0.033, -1)

	arg_65_0.animtimer_:Start()
end

function var_0_0.InitAnimNode(arg_67_0)
	arg_67_0.blackboard_ = TangramPuzzleBlackboard.New()
	arg_67_0.nodeDic_ = {}
	arg_67_0.nodeDic_.autoPutNode = TangramAutoPutNode.New(arg_67_0, arg_67_0.blackboard_)
	arg_67_0.nodeDic_.movePuzzleNode = TangramMovePuzzleNode.New(arg_67_0, arg_67_0.blackboard_)
	arg_67_0.nodeDic_.movePuzzleImmediateltNode = TangramMovePuzzleImmediatelyNode.New(arg_67_0, arg_67_0.blackboard_)
	arg_67_0.nodeDic_.rotateRegionNode = TangramRotateRegionNode.New(arg_67_0, arg_67_0.blackboard_)
	arg_67_0.nodeDic_.receiveRegionNode = TangramRegionReceiveNode.New(arg_67_0, arg_67_0.blackboard_)
	arg_67_0.nodeDic_.regionTypeAllRightNode = TangramRegionTypeAllRightNode.New(arg_67_0, arg_67_0.blackboard_)
	arg_67_0.nodeDic_.switchToPlayNode = TangramSwitchToPlayNode.New(arg_67_0, arg_67_0.blackboard_)
	arg_67_0.nodeDic_.switchToEditNode = TangramSwitchToEditNode.New(arg_67_0, arg_67_0.blackboard_)
	arg_67_0.nodeDic_.switchToFinalNode = TangramSwitchToFinalNode.New(arg_67_0, arg_67_0.blackboard_)
end

function var_0_0.CreateAnimNodeList(arg_68_0)
	arg_68_0.nodeList_ = {}

	if arg_68_0.blackboard_.isAutoPutPuzzle_ == true then
		local var_68_0 = TangramAnimGroup.New()

		var_68_0:Init(arg_68_0, arg_68_0.blackboard_, arg_68_0)

		local var_68_1 = arg_68_0:TryToCreateAutoPutNode()

		var_68_1:Init(var_68_0, arg_68_0.blackboard_, arg_68_0)

		local var_68_2 = arg_68_0:TryToCreateRegionTypeAllRightNode()

		var_68_2:Init(var_68_0, arg_68_0.blackboard_, arg_68_0)
		var_68_0:Add(var_68_1)
		var_68_0:Add(var_68_2)

		arg_68_0.nodeList_[#arg_68_0.nodeList_ + 1] = var_68_0
		arg_68_0.blackboard_.isOnlyRegionRewardPop_ = true

		local var_68_3 = arg_68_0:TryToCreateReceiveRegionNode()

		if var_68_3 then
			var_68_3:Init(arg_68_0, arg_68_0.blackboard_, arg_68_0)

			arg_68_0.nodeList_[#arg_68_0.nodeList_ + 1] = var_68_3
		end

		arg_68_0.blackboard_.needSwitchToPlay_ = false
		arg_68_0.blackboard_.needSwitchToEdit_ = false
		arg_68_0.blackboard_.needSwitchToFinal_ = true

		local var_68_4 = arg_68_0:TryToCreateSwitchNode()

		if var_68_4 then
			var_68_4:Init(arg_68_0, arg_68_0.blackboard_, arg_68_0)

			arg_68_0.nodeList_[#arg_68_0.nodeList_ + 1] = var_68_4
		end

		return
	end

	local var_68_5 = arg_68_0:TryToCreateMovePuzzleNode()

	if var_68_5 then
		arg_68_0.nodeList_[#arg_68_0.nodeList_ + 1] = var_68_5
	end

	local var_68_6 = arg_68_0:TryToCreateRotateRegionNode()

	if var_68_6 then
		arg_68_0.nodeList_[#arg_68_0.nodeList_ + 1] = var_68_6
	end

	local var_68_7 = arg_68_0:TryToCreateReceiveRegionNode()

	if var_68_7 then
		arg_68_0.nodeList_[#arg_68_0.nodeList_ + 1] = var_68_7
	end

	local var_68_8 = arg_68_0:TryToCreateRegionTypeAllRightNode()

	if var_68_8 then
		arg_68_0.nodeList_[#arg_68_0.nodeList_ + 1] = var_68_8
	end

	local var_68_9 = arg_68_0:TryToCreateSwitchNode()

	if var_68_9 then
		arg_68_0.nodeList_[#arg_68_0.nodeList_ + 1] = var_68_9
	end

	for iter_68_0, iter_68_1 in ipairs(arg_68_0.nodeList_) do
		iter_68_1:Init(arg_68_0, arg_68_0.blackboard_, arg_68_0)
	end
end

function var_0_0.TryToCreateAutoPutNode(arg_69_0)
	if arg_69_0.blackboard_.isAutoPutPuzzle_ == true then
		arg_69_0.blackboard_.isAutoPutPuzzle_ = false
		arg_69_0.blackboard_.needSwitchToFinal_ = true

		return arg_69_0.nodeDic_.autoPutNode
	end
end

function var_0_0.TryToCreateMovePuzzleNode(arg_70_0)
	if arg_70_0.blackboard_.isMovePuzzle_ == true then
		arg_70_0.blackboard_.isMovePuzzle_ = false
		arg_70_0.blackboard_.needSwitchToPlay_ = true

		local var_70_0

		if arg_70_0.blackboard_.isMoveImmediately_ == true then
			var_70_0 = arg_70_0.nodeDic_.movePuzzleImmediateltNode
		else
			var_70_0 = arg_70_0.nodeDic_.movePuzzleNode
		end

		return var_70_0
	end
end

function var_0_0.TryToCreateRotateRegionNode(arg_71_0)
	if arg_71_0.blackboard_.isRotateRegion_ == true then
		arg_71_0.blackboard_.isRotateRegion_ = false
		arg_71_0.blackboard_.needSwitchToEdit_ = true

		return arg_71_0.nodeDic_.rotateRegionNode
	end
end

function var_0_0.TryToCreateReceiveRegionNode(arg_72_0)
	if arg_72_0.blackboard_.isReceivedRegionReward_ == true then
		arg_72_0.blackboard_.isReceivedRegionReward_ = false
		arg_72_0.blackboard_.needSwitchToPlay_ = true

		return arg_72_0.nodeDic_.receiveRegionNode
	end
end

function var_0_0.TryToCreateRegionTypeAllRightNode(arg_73_0)
	if arg_73_0.blackboard_.needCheckAllRightRegionType_ == true then
		arg_73_0.blackboard_.needCheckAllRightRegionType_ = false

		local var_73_0 = {}

		for iter_73_0, iter_73_1 in pairs(arg_73_0.blackboard_.checkAllRightRegionTypeDic_) do
			if arg_73_0:CheckRegionAllRgithByRegionType(iter_73_0) == true then
				table.insert(var_73_0, iter_73_0)
			end
		end

		if #var_73_0 > 0 then
			arg_73_0.blackboard_.allRightRegionTypeList_ = var_73_0
			arg_73_0.blackboard_.needSwitchToPlay_ = true

			if arg_73_0:CheckRegionAllRight() == true then
				arg_73_0.blackboard_.needSwitchToPlay_ = false
				arg_73_0.blackboard_.needSwitchToEdit_ = false
				arg_73_0.blackboard_.needSwitchToFinal_ = true
			end

			return arg_73_0.nodeDic_.regionTypeAllRightNode
		end
	end
end

function var_0_0.TryToCreateSwitchNode(arg_74_0)
	if arg_74_0.blackboard_.needSwitchToPlay_ == true then
		arg_74_0.blackboard_.needSwitchToPlay_ = false

		return arg_74_0.nodeDic_.switchToPlayNode
	elseif arg_74_0.blackboard_.needSwitchToEdit_ == true then
		arg_74_0.blackboard_.needSwitchToEdit_ = false

		return arg_74_0.nodeDic_.switchToEditNode
	elseif arg_74_0.blackboard_.needSwitchToFinal_ == true then
		arg_74_0.blackboard_.needSwitchToFinal_ = false

		return arg_74_0.nodeDic_.switchToFinalNode
	end
end

function var_0_0.StartRunAnimNode(arg_75_0)
	SetActive(arg_75_0.maskGo_, true)

	arg_75_0.animNodeRunning_ = true
	arg_75_0.curNodeIndex_ = 0

	arg_75_0:RunNode()
end

function var_0_0.StopAnimNode(arg_76_0)
	SetActive(arg_76_0.maskGo_, false)

	arg_76_0.animNodeRunning_ = false
	arg_76_0.nodeList_ = nil

	arg_76_0.blackboard_:Reset()
end

function var_0_0.RunNode(arg_77_0)
	if not arg_77_0.animNodeRunning_ then
		return
	end

	arg_77_0.curNodeIndex_ = arg_77_0.curNodeIndex_ + 1

	arg_77_0.nodeList_[arg_77_0.curNodeIndex_]:RunFunc()
end

function var_0_0.SetNodeRunComplete(arg_78_0)
	if not arg_78_0.animNodeRunning_ or arg_78_0.curNodeIndex_ >= #arg_78_0.nodeList_ then
		arg_78_0:StopAnimNode()

		return
	end

	arg_78_0:RunNode()
end

function var_0_0.DisposeAnimNode(arg_79_0)
	if arg_79_0.nodeDic_ then
		for iter_79_0, iter_79_1 in pairs(arg_79_0.nodeDic_) do
			iter_79_1:Dispose()
		end

		arg_79_0.nodeDic_ = nil
	end
end

function var_0_0.AddTimer(arg_80_0)
	arg_80_0:StopTimer()
	arg_80_0:RefreshTimeText()

	arg_80_0.timer_ = Timer.New(function()
		if manager.time:GetServerTime() > arg_80_0.stopTime_ then
			arg_80_0.timeText_.text = GetTips("TIME_OVER")

			return
		end

		arg_80_0:RefreshTimeText()
	end, 1, -1)

	arg_80_0.timer_:Start()
end

function var_0_0.StopTimer(arg_82_0)
	if arg_82_0.timer_ then
		arg_82_0.timer_:Stop()

		arg_82_0.timer_ = nil
	end
end

function var_0_0.RefreshTimeText(arg_83_0)
	if arg_83_0.timeText_ then
		arg_83_0.timeText_.text = GetTips("REMAINING_TIME") .. manager.time:GetLostTimeStr2(arg_83_0.stopTime_, nil, true)
	end
end

function var_0_0.IsActivityTime(arg_84_0)
	if manager.time:GetServerTime() < arg_84_0.startTime_ then
		local var_84_0 = GetTips("OPEN_TIME")

		ShowTips(string.format(var_84_0, manager.time:GetLostTimeStr2(arg_84_0.startTime_, nil, true)))

		return false
	end

	if manager.time:GetServerTime() >= arg_84_0.stopTime_ then
		ShowTips("TIME_OVER")

		return false
	end

	return true
end

return var_0_0
