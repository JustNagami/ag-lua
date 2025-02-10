local var_0_0 = class("PuzzleNewPlayView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return PuzzleNewTools.GetPlayViewUIName(arg_1_0.params_.activityID)
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0.puzzleItemList_ = {}
	arg_3_0.puzzleItemDicByID_ = {}
	arg_3_0.regionItemList_ = {}
	arg_3_0.statusConst_ = {
		PLAY = 0,
		CHECK = 1
	}

	arg_3_0:InitUI()
	arg_3_0:AddUIListener()

	arg_3_0.statusController_ = ControllerUtil.GetController(arg_3_0.transform_, "status")
	arg_3_0.putBtnController_ = ControllerUtil.GetController(arg_3_0.putBtn_.transform, "status")
	arg_3_0.checkBtnController_ = ControllerUtil.GetController(arg_3_0.checkTipsBtn_.transform, "status")
	arg_3_0.checkPointList_ = {}
	arg_3_0.endDragHandler_ = handler(arg_3_0, arg_3_0.OnDragPuzzleEnd)
	arg_3_0.onClickHandler_ = handler(arg_3_0, arg_3_0.OnClick)
end

function var_0_0.InitUI(arg_4_0)
	arg_4_0:BindCfgUI()
end

function var_0_0.AddUIListener(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.autoBtn_, nil, function()
		if not arg_5_0:IsActivityTime() then
			return
		end

		if not PuzzleNewTools.CheckWrongSide(false, arg_5_0.activityID_) then
			ShowTips("ACTIVITY_PUZZLE_GUIDE_ENOUGH")

			return
		end

		local var_6_0 = arg_5_0.puzzleCfg_.coin_id[1]
		local var_6_1 = var_6_0[1]

		if ItemTools.getItemNum(var_6_1) < var_6_0[2] then
			ShowTips("ACTIVITY_PUZZLE_COIN_NOT_ENOUGH")

			return
		end

		SetActive(arg_5_0.maskGo_, true)
		PuzzleNewAction.Operation(arg_5_0.activityID_, PuzzleNewAction.OPERATION_TYPE.AUTO_PUT)
	end)
	arg_5_0:AddBtnListener(arg_5_0.putBtn_, nil, function()
		if not arg_5_0:IsActivityTime() then
			return
		end

		if not PuzzleNewTools.CheckWrongSide(true, arg_5_0.activityID_) then
			ShowTips("ACTIVITY_PUZZLE_ENOUGH")

			return
		end

		local var_7_0 = arg_5_0.puzzleCfg_.fragment_id[1]
		local var_7_1 = var_7_0[1]

		if ItemTools.getItemNum(var_7_1) < var_7_0[2] then
			ShowTips("ACTIVITY_PUZZLE_FRAGMENT_NOT_ENOUGH")

			return
		end

		PuzzleNewData:SetPutBtnSelected(arg_5_0.activityID_)
		SetActive(arg_5_0.maskGo_, true)
		PuzzleNewAction.Operation(arg_5_0.activityID_, PuzzleNewAction.OPERATION_TYPE.PUT)
	end)
	arg_5_0:AddBtnListener(arg_5_0.rewardBtn_, nil, function()
		if not arg_5_0:IsActivityTime() then
			return
		end

		manager.windowBar:HideBar()
		JumpTools.OpenPageByJump("puzzleNewReward", {
			activityID = arg_5_0.activityID_
		})
	end)
	arg_5_0:AddBtnListener(arg_5_0.previewBtn_, nil, function()
		if not arg_5_0:IsActivityTime() then
			return
		end

		manager.windowBar:HideBar()
		JumpTools.OpenPageByJump("puzzleNewPreview", {
			activityID = arg_5_0.activityID_
		})
	end)
	arg_5_0:AddBtnListener(arg_5_0.checkTipsBtn_, nil, function()
		if not arg_5_0:IsActivityTime() then
			return
		end

		local var_10_0 = PuzzleNewData:GetCurCheckList(arg_5_0.activityID_)
		local var_10_1 = PuzzleNewData:GetCheckTipsList(arg_5_0.activityID_)
		local var_10_2 = arg_5_0.puzzleCfg_.clue_id
		local var_10_3 = false
		local var_10_4 = 0

		for iter_10_0, iter_10_1 in ipairs(var_10_2) do
			if var_10_0[iter_10_1] == nil and var_10_1[iter_10_1] == nil then
				var_10_3 = true
				var_10_4 = iter_10_1

				break
			end
		end

		if not var_10_3 then
			ShowTips("ACTIVITY_PUZZLE_CULE")

			return
		end

		local var_10_5 = arg_5_0.puzzleCfg_.clue_tips_id[1]
		local var_10_6 = var_10_5[1]

		if ItemTools.getItemNum(var_10_6) < var_10_5[2] then
			ShowTips("ACTIVITY_PUZZLE_FRAGMENT_NOT_ENOUGH")

			return
		end

		SetActive(arg_5_0.maskGo_, true)
		PuzzleNewAction.Operation(arg_5_0.activityID_, PuzzleNewAction.OPERATION_TYPE.CHECK_TIPS, nil, var_10_4)
	end)
	arg_5_0:AddBtnListener(arg_5_0.checkPreviewBtn_, nil, function()
		if not arg_5_0:IsActivityTime() then
			return
		end

		manager.windowBar:HideBar()
		JumpTools.OpenPageByJump("puzzleNewCheckPreview", {
			activityID = arg_5_0.activityID_
		})
	end)
	arg_5_0:AddBtnListener(arg_5_0.shareBtn_, nil, function()
		manager.share:Share(function()
			arg_5_0:HideAllUI()
		end, function()
			arg_5_0:RecoverAllUI()
		end, function()
			return
		end)
	end)
end

function var_0_0.OnEnter(arg_16_0)
	local var_16_0 = ActivityData:GetActivityData(arg_16_0.params_.activityID)

	arg_16_0.startTime_ = var_16_0.startTime
	arg_16_0.stopTime_ = var_16_0.stopTime

	if arg_16_0.activityID_ ~= arg_16_0.params_.activityID then
		arg_16_0.activityID_ = arg_16_0.params_.activityID
		arg_16_0.puzzleCfg_ = PuzzleNewCfg[arg_16_0.params_.activityID]

		arg_16_0:Spawn()
	end

	arg_16_0.params_.isEnter = true

	arg_16_0:SwitchStatus()
	arg_16_0:AddTimer()
	SetActive(arg_16_0.maskGo_, false)
	manager.redPoint:bindUIandKey(arg_16_0.putBtn_.transform, string.format("%s_%s", RedPointConst.PUZZLE_NEW_PIECE, arg_16_0.activityID_))
end

function var_0_0.OnExit(arg_17_0)
	manager.windowBar:HideBar()

	if arg_17_0.checkAnimtimer_ ~= nil then
		arg_17_0.checkAnimtimer_:Stop()

		arg_17_0.checkAnimtimer_ = nil
	end

	arg_17_0:StopTimer()

	arg_17_0.params_.isEnter = false

	SetActive(arg_17_0.maskGo_, false)
	manager.redPoint:unbindUIandKey(arg_17_0.putBtn_.transform, string.format("%s_%s", RedPointConst.PUZZLE_NEW_PIECE, arg_17_0.activityID_))
end

function var_0_0.OnTop(arg_18_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR,
		arg_18_0.puzzleCfg_.coin_id[1][1],
		arg_18_0.puzzleCfg_.fragment_id[1][1]
	})
	manager.windowBar:SetBarCanClick(arg_18_0.puzzleCfg_.coin_id[1][1], true)
	manager.windowBar:SetBarCanClick(arg_18_0.puzzleCfg_.fragment_id[1][1], true)
end

function var_0_0.Dispose(arg_19_0)
	arg_19_0:StopTimer()

	arg_19_0.endDragHandler_ = nil
	arg_19_0.onClickHandler_ = nil

	arg_19_0:DespawnPuzzle()
	arg_19_0:DespawnRegion()
	arg_19_0:DespawnCheckPoint()
	var_0_0.super.Dispose(arg_19_0)
end

function var_0_0.Spawn(arg_20_0)
	if not PuzzleNewData:IsCompleted(arg_20_0.activityID_) then
		arg_20_0:DespawnPuzzle()
		arg_20_0:SpawnPuzzle()
		arg_20_0:DespawnRegion()
		arg_20_0:SpawnRegion()

		return
	end

	arg_20_0:DespawnCheckPoint()
	arg_20_0:SpawnCheckPoint()
end

function var_0_0.SwitchStatus(arg_21_0)
	if not PuzzleNewData:IsCompleted(arg_21_0.activityID_) then
		arg_21_0:SwitchToPlay()

		return
	end

	arg_21_0:SwitchToCheck()
end

function var_0_0.SwitchToPlay(arg_22_0)
	arg_22_0.statusController_:SetSelectedIndex(arg_22_0.statusConst_.PLAY)
	arg_22_0:RefreshPuzzle()
	arg_22_0:CheckRegionResult()
end

function var_0_0.SwitchToCheck(arg_23_0)
	arg_23_0.statusController_:SetSelectedIndex(arg_23_0.statusConst_.CHECK)
	arg_23_0:RefreshCheckPoint()
	arg_23_0.checkAnim_:Play("puzzlePieceTemplate_ImagePanel", -1, 999)

	for iter_23_0, iter_23_1 in ipairs(arg_23_0.puzzleItemList_) do
		iter_23_1:StopAnim()
	end
end

function var_0_0.OnPuzzleNewUpdate(arg_24_0)
	SetActive(arg_24_0.maskGo_, false)
	arg_24_0:RefreshPuzzle()
	arg_24_0:CheckRegionResult()
end

function var_0_0.RefreshPuzzle(arg_25_0)
	local var_25_0 = arg_25_0.params_.isEnter

	arg_25_0.params_.isEnter = false

	local var_25_1 = PuzzleNewData:GetCurPuzzleList(arg_25_0.activityID_)

	for iter_25_0, iter_25_1 in ipairs(arg_25_0.puzzleItemList_) do
		if var_25_1[iter_25_0] then
			arg_25_0.puzzleItemList_[iter_25_0]:SetData(var_25_1[iter_25_0], arg_25_0.activityID_, not var_25_0)
		else
			arg_25_0.puzzleItemList_[iter_25_0]:SetData(0, arg_25_0.activityID_, false)
		end
	end

	arg_25_0:RefreshPuzzleCost()
end

function var_0_0.MovePuzzle(arg_26_0, arg_26_1, arg_26_2)
	SetActive(arg_26_0.maskGo_, true)

	local var_26_0 = arg_26_0.puzzleItemList_[arg_26_1]:GetCurID()

	PuzzleNewAction.MovePuzzle(arg_26_0.activityID_, var_26_0, arg_26_2, function()
		SetActive(arg_26_0.maskGo_, false)

		local var_27_0 = arg_26_0.puzzleItemList_[arg_26_1]
		local var_27_1 = arg_26_0.puzzleItemList_[arg_26_2]
		local var_27_2 = var_27_0:GetCurID()

		var_27_0:SetData(var_27_1:GetCurID(), arg_26_0.activityID_, true)
		var_27_1:SetData(var_27_2, arg_26_0.activityID_, true)
		PuzzleNewData:SetPuzzle(arg_26_0.activityID_, var_27_0:GetCurID(), arg_26_1)
		PuzzleNewData:SetPuzzle(arg_26_0.activityID_, var_27_1:GetCurID(), arg_26_2)
		arg_26_0:CheckRegionResult()
	end)
end

function var_0_0.OnDragPuzzleEnd(arg_28_0, arg_28_1, arg_28_2)
	local var_28_0, var_28_1 = PuzzleNewTools.FindPuzzleByScreenPos(arg_28_0.puzzleContentTrans_, arg_28_0.col_, arg_28_0.row_, arg_28_2)

	if var_28_0 == true then
		local var_28_2 = arg_28_0.puzzleItemList_[var_28_1]

		if arg_28_1 ~= var_28_1 and not var_28_2:IsRightSide() then
			arg_28_0:MovePuzzle(arg_28_1, var_28_1)
		else
			arg_28_0.puzzleItemList_[arg_28_1]:Recover()
		end
	else
		arg_28_0.puzzleItemList_[arg_28_1]:Recover()
	end
end

function var_0_0.SpawnPuzzle(arg_29_0)
	arg_29_0.row_ = arg_29_0.puzzleCfg_.size[1]
	arg_29_0.col_ = arg_29_0.puzzleCfg_.size[2]

	local var_29_0 = arg_29_0.puzzleCfg_.correct_array
	local var_29_1 = arg_29_0.puzzleContentTrans_.childCount

	arg_29_0.puzzleItemList_ = arg_29_0.puzzleItemList_ or {}

	for iter_29_0 = 1, var_29_1 do
		local var_29_2 = arg_29_0.puzzleContentTrans_:GetChild(iter_29_0 - 1)

		if not arg_29_0.puzzleItemList_[iter_29_0] then
			local var_29_3 = var_29_0[iter_29_0]

			arg_29_0.puzzleItemList_[iter_29_0] = PuzzleNewPiece.New(arg_29_0.puzzleContentTrans_, var_29_2, iter_29_0, var_29_3)

			arg_29_0.puzzleItemList_[iter_29_0]:RegistEndDragCallback(arg_29_0.endDragHandler_)

			arg_29_0.puzzleItemDicByID_[var_29_3] = arg_29_0.puzzleItemList_[iter_29_0]
		end
	end
end

function var_0_0.DespawnPuzzle(arg_30_0)
	for iter_30_0, iter_30_1 in pairs(arg_30_0.puzzleItemList_) do
		iter_30_1:Dispose()
	end

	arg_30_0.puzzleItemList_ = nil
end

function var_0_0.RefreshPuzzleCost(arg_31_0)
	local var_31_0 = arg_31_0.puzzleCfg_.fragment_id[1]
	local var_31_1 = var_31_0[2]

	arg_31_0.putCostText_.text = "x" .. var_31_1
	arg_31_0.putCostImg_.sprite = ItemTools.getItemSprite(var_31_0[1])

	local var_31_2 = ItemTools.getItemNum(var_31_0[1])

	arg_31_0.putBtnController_:SetSelectedIndex(var_31_2 < var_31_1 and 1 or 0)
end

function var_0_0.SpawnRegion(arg_32_0)
	local var_32_0 = arg_32_0.puzzleCfg_.area_fragment_list
	local var_32_1 = arg_32_0.puzzleCfg_.reward_area_list
	local var_32_2 = PuzzleNewTools.GetRegionPosDic(arg_32_0.activityID_)

	arg_32_0.regionItemList_ = arg_32_0.regionItemList_ or {}

	local var_32_3 = arg_32_0.regionPanelTrans_.childCount

	for iter_32_0 = 1, var_32_3 do
		local var_32_4 = arg_32_0.regionPanelTrans_:GetChild(iter_32_0 - 1)
		local var_32_5 = tonumber(var_32_4.name)
		local var_32_6 = var_32_0[var_32_2[var_32_5]][2]

		if not arg_32_0.regionItemList_[var_32_5] then
			arg_32_0.regionItemList_[var_32_5] = PuzzleNewRegionAnimItem.New(var_32_4)
		end

		for iter_32_1, iter_32_2 in ipairs(var_32_6) do
			arg_32_0.puzzleItemDicByID_[iter_32_2]:SetRegionID(var_32_5)
		end
	end
end

function var_0_0.DespawnRegion(arg_33_0)
	for iter_33_0, iter_33_1 in pairs(arg_33_0.regionItemList_) do
		iter_33_1:Dispose()
	end

	arg_33_0.regionItemList_ = nil
end

function var_0_0.OnRegionReceived(arg_34_0, arg_34_1, arg_34_2)
	for iter_34_0 = 1, #arg_34_1 do
		if iter_34_0 == #arg_34_1 then
			arg_34_0.regionItemList_[arg_34_1[iter_34_0]]:PlayAnim(function()
				SetActive(arg_34_0.maskGo_, false)
				arg_34_0:OnRegionAnimEnd(arg_34_2)
			end)
		else
			arg_34_0.regionItemList_[iter_34_0]:PlayAnim()
		end
	end
end

function var_0_0.OnRegionAnimEnd(arg_36_0, arg_36_1)
	getReward2(arg_36_1, nil, function()
		if PuzzleNewData:IsCompleted(arg_36_0.activityID_) then
			arg_36_0:Spawn()
			arg_36_0:SwitchStatus()
			SetActive(arg_36_0.maskGo_, true)

			local var_37_0 = "puzzlePieceTemplate_ImagePanel"

			arg_36_0.checkAnim_:Play(var_37_0, -1, 0)
			arg_36_0.checkAnim_:Update(0)

			arg_36_0.checkAnimtimer_ = Timer.New(function()
				local var_38_0 = arg_36_0.checkAnim_:GetCurrentAnimatorStateInfo(0)

				if var_38_0:IsName(var_37_0) and var_38_0.normalizedTime >= 1 then
					if arg_36_0.checkAnimtimer_ ~= nil then
						arg_36_0.checkAnimtimer_:Stop()

						arg_36_0.checkAnimtimer_ = nil
					end

					SetActive(arg_36_0.maskGo_, false)
				end
			end, 0.033, -1)

			arg_36_0.checkAnimtimer_:Start()
			manager.audio:PlayEffect("minigame_activity_2_1", "minigame_activity_2_1_puzzle_complete", "")
		end
	end)
end

function var_0_0.CheckRegionResult(arg_39_0)
	local var_39_0, var_39_1 = PuzzleNewTools.CheckRegionResult(arg_39_0.activityID_)

	if #var_39_0 > 0 then
		SetActive(arg_39_0.maskGo_, true)
		PuzzleNewAction.ReceiveRegionReward(arg_39_0.activityID_, var_39_0, var_39_1)

		for iter_39_0, iter_39_1 in pairs(arg_39_0.puzzleItemList_) do
			iter_39_1:StopAnim()
		end
	end
end

function var_0_0.OnPuzzleNewCheckUpdate(arg_40_0)
	SetActive(arg_40_0.maskGo_, false)
	arg_40_0:RefreshCheckPoint()
end

function var_0_0.RefreshCheckPoint(arg_41_0)
	for iter_41_0, iter_41_1 in pairs(arg_41_0.checkPointList_) do
		iter_41_1:SetData(arg_41_0.activityID_, iter_41_0)
	end

	arg_41_0:RefreshCheckProgress()
	arg_41_0:RefreshCheckCost()
end

function var_0_0.RefreshCheckProgress(arg_42_0)
	local var_42_0 = #arg_42_0.puzzleCfg_.clue_id
	local var_42_1 = PuzzleNewData:GetCurCheckList(arg_42_0.activityID_)
	local var_42_2 = 0

	for iter_42_0, iter_42_1 in pairs(var_42_1) do
		var_42_2 = var_42_2 + 1
	end

	arg_42_0.progressText_.text = string.format("%d/%d", var_42_2, var_42_0)
end

function var_0_0.OnClick(arg_43_0, arg_43_1)
	arg_43_0:RefreshCheckProgress()
end

function var_0_0.SpawnCheckPoint(arg_44_0)
	local var_44_0 = arg_44_0.puzzleCfg_.clue_id
	local var_44_1 = arg_44_0.checkPointContent_.childCount

	arg_44_0.checkPointList_ = arg_44_0.checkPointList_ or {}

	for iter_44_0 = 1, var_44_1 do
		local var_44_2 = arg_44_0.checkPointContent_:GetChild(iter_44_0 - 1)
		local var_44_3 = var_44_0[iter_44_0]

		if not arg_44_0.checkPointList_[var_44_3] then
			arg_44_0.checkPointList_[var_44_3] = PuzzleNewCheckPoint.New(var_44_2)
		end
	end

	arg_44_0.originImage_.sprite = getSpriteWithoutAtlas(arg_44_0.puzzleCfg_.preview_album_id)
	arg_44_0.checkPanelImage_.sprite = getSpriteWithoutAtlas(arg_44_0.puzzleCfg_.album_id)
end

function var_0_0.DespawnCheckPoint(arg_45_0)
	for iter_45_0, iter_45_1 in pairs(arg_45_0.checkPointList_) do
		iter_45_1:Dispose()
	end

	arg_45_0.checkPointList_ = nil
end

function var_0_0.RefreshCheckCost(arg_46_0)
	local var_46_0 = arg_46_0.puzzleCfg_.clue_tips_id[1]
	local var_46_1 = var_46_0[2]

	arg_46_0.checkCostText_.text = "x" .. var_46_1
	arg_46_0.checkCostImg_.sprite = ItemTools.getItemSprite(var_46_0[1])

	local var_46_2 = ItemTools.getItemNum(var_46_0[1])

	arg_46_0.checkBtnController_:SetSelectedIndex(var_46_2 < var_46_1 and 1 or 0)
end

function var_0_0.HideAllUI(arg_47_0)
	manager.windowBar:HideBar()
	SetActive(arg_47_0.btnPanelGo_, false)
	SetActive(arg_47_0.titlePanelGo_, false)
end

function var_0_0.RecoverAllUI(arg_48_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR,
		arg_48_0.puzzleCfg_.coin_id[1][1],
		arg_48_0.puzzleCfg_.fragment_id[1][1]
	})
	SetActive(arg_48_0.btnPanelGo_, true)
	SetActive(arg_48_0.titlePanelGo_, true)
end

function var_0_0.AddTimer(arg_49_0)
	arg_49_0:StopTimer()
	arg_49_0:RefreshTimeText()

	arg_49_0.timer_ = Timer.New(function()
		if manager.time:GetServerTime() > arg_49_0.stopTime_ then
			arg_49_0.timeText_.text = GetTips("TIME_OVER")

			return
		end

		arg_49_0:RefreshTimeText()
	end, 1, -1)

	arg_49_0.timer_:Start()
end

function var_0_0.StopTimer(arg_51_0)
	if arg_51_0.timer_ then
		arg_51_0.timer_:Stop()

		arg_51_0.timer_ = nil
	end
end

function var_0_0.RefreshTimeText(arg_52_0)
	if arg_52_0.timeText_ then
		arg_52_0.timeText_.text = manager.time:GetLostTimeStr2(arg_52_0.stopTime_, nil, true)
	end
end

function var_0_0.IsActivityTime(arg_53_0)
	if manager.time:GetServerTime() < arg_53_0.startTime_ then
		local var_53_0 = GetTips("OPEN_TIME")

		ShowTips(string.format(var_53_0, manager.time:GetLostTimeStr2(arg_53_0.startTime_, nil, true)))

		return false
	end

	if manager.time:GetServerTime() >= arg_53_0.stopTime_ then
		ShowTips("TIME_OVER")

		return false
	end

	return true
end

return var_0_0
