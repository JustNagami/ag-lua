local var_0_0 = class("DestroyBoxGameView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "UI/VersionUI/JapanRegionUI_2_6/JapanRegionBoxUI/JapanRegionBoxUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:BindCfgUI()
	arg_3_0:AddListeners()

	arg_3_0.viewList_ = {
		DestroyBoxGameNormalView.New(arg_3_0.challengeGo3_),
		DestroyBoxGameChallengeView.New(arg_3_0.challengeGo1_, 1),
		DestroyBoxGameChallengeView.New(arg_3_0.challengeGo2_, 2)
	}
	arg_3_0.switchSelectItemHandler_ = handler(arg_3_0, arg_3_0.SwitchSelectItem)
end

function var_0_0.OnEnter(arg_4_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR,
		INFO_BAR
	})
	manager.windowBar:SetGameHelpKey("DESTROY_BOX_GAME_DESC")

	arg_4_0.mainActivityID_ = arg_4_0.params_.activityID

	arg_4_0:RefreshTime()

	for iter_4_0, iter_4_1 in ipairs(arg_4_0.viewList_) do
		iter_4_1:OnEnter(arg_4_0.mainActivityID_)
	end

	arg_4_0:SwitchSelectItem()
	manager.notify:RegistListener(DESTROY_BOX_GAME_SELECT_STAGE, arg_4_0.switchSelectItemHandler_)
	manager.redPoint:bindUIandKey(arg_4_0.rewardBtn_.transform, string.format("%s_%s", RedPointConst.DESTROY_BOX_GAME_REWARD, arg_4_0.mainActivityID_))
end

function var_0_0.OnExit(arg_5_0)
	manager.redPoint:unbindUIandKey(arg_5_0.rewardBtn_.transform, string.format("%s_%s", RedPointConst.DESTROY_BOX_GAME_REWARD, arg_5_0.mainActivityID_))
	manager.notify:RemoveListener(DESTROY_BOX_GAME_SELECT_STAGE, arg_5_0.switchSelectItemHandler_)
	manager.windowBar:HideBar()
	arg_5_0:StopTimer()

	for iter_5_0, iter_5_1 in ipairs(arg_5_0.viewList_) do
		iter_5_1:OnExit()
	end
end

function var_0_0.Dispose(arg_6_0)
	arg_6_0.switchSelectHandler_ = nil

	for iter_6_0, iter_6_1 in ipairs(arg_6_0.viewList_) do
		iter_6_1:Dispose()
	end

	arg_6_0.viewList_ = nil

	var_0_0.super.Dispose(arg_6_0)
end

function var_0_0.AddListeners(arg_7_0)
	arg_7_0:AddBtnListener(arg_7_0.rewardBtn_, nil, function()
		JumpTools.OpenPageByJump("destroyBoxGameReward", {
			mainActivityID = arg_7_0.mainActivityID_
		})
	end)
	arg_7_0:AddBtnListener(arg_7_0.battleBtn_, nil, function()
		local var_9_0 = ActivityData:GetActivityData(arg_7_0.mainActivityID_)
		local var_9_1 = manager.time:GetServerTime()

		if var_9_1 < var_9_0.startTime then
			local var_9_2 = GetTips("OPEN_TIME")

			ShowTips(string.format(var_9_2, manager.time:GetLostTimeStr2(var_9_0.startTime, nil, true)))

			return
		elseif var_9_1 >= var_9_0.stopTime then
			ShowTips("TIME_OVER")

			return
		end

		local var_9_3 = DestroyBoxGameData:GetSelectID(arg_7_0.mainActivityID_)
		local var_9_4 = DestroyBoxGameCfg[var_9_3]

		if ActivityTools.GetActivityStatus(var_9_4.activity_id) ~= 1 then
			local var_9_5 = ActivityData:GetActivityData(var_9_4.activity_id)
			local var_9_6 = manager.time:GetServerTime()

			if var_9_6 < var_9_5.startTime then
				local var_9_7 = GetTips("OPEN_TIME")

				ShowTips(string.format(var_9_7, manager.time:GetLostTimeStr2(var_9_5.startTime, nil, true)))
			elseif var_9_6 >= var_9_5.stopTime then
				ShowTips("TIME_OVER")
			end

			return
		elseif not DestroyBoxGameData:IsFinishPreStage(var_9_3) then
			ShowTips("STAGE_LOCK")

			return
		end

		DestroyBoxGameAction.ClickBoxStageItem(var_9_4.activity_id, var_9_3)
		arg_7_0:Go("/sectionSelectHero", {
			canChangeTeam = false,
			activityID = var_9_4.activity_id,
			section = var_9_4.stage_id,
			sectionType = BattleConst.STAGE_TYPE_NEW.DESTROY_BOX_GAME
		})
	end)
end

function var_0_0.SwitchSelectItem(arg_10_0)
	local var_10_0 = DestroyBoxGameData:GetSelectID(arg_10_0.mainActivityID_)

	for iter_10_0, iter_10_1 in ipairs(arg_10_0.viewList_) do
		iter_10_1:SwitchSelectItem(var_10_0)
	end
end

function var_0_0.RefreshTime(arg_11_0)
	arg_11_0:StopTimer()

	local var_11_0 = ActivityData:GetActivityData(arg_11_0.mainActivityID_).stopTime

	arg_11_0.timeText_.text = manager.time:GetLostTimeStr2(var_11_0, nil, true)
	arg_11_0.timer_ = Timer.New(function()
		arg_11_0.timeText_.text = manager.time:GetLostTimeStr2(var_11_0, nil, true)
	end, 1, -1)

	arg_11_0.timer_:Start()
end

function var_0_0.StopTimer(arg_13_0)
	if arg_13_0.timer_ then
		arg_13_0.timer_:Stop()

		arg_13_0.timer_ = nil
	end
end

return var_0_0
