local var_0_0 = class("ActivityCultivateHeroMainView", ReduxView)

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = Asset.Load(arg_1_0:UIName(arg_1_2))

	arg_1_0.gameObject_ = Object.Instantiate(var_1_0, arg_1_1.transform)
	arg_1_0.transform_ = arg_1_0.gameObject_.transform
	arg_1_0.activityID_ = arg_1_2

	arg_1_0:Init()
end

function var_0_0.UIName(arg_2_0, arg_2_1)
	return CultivateHeroTools.GetMainUIName(arg_2_1)
end

function var_0_0.Init(arg_3_0)
	arg_3_0:BindCfgUI()

	arg_3_0.roleImage_.immediate = true

	arg_3_0:AddListeners()

	arg_3_0.switchItemList_ = LuaList.New(handler(arg_3_0, arg_3_0.IndexItem), arg_3_0.switchListGo_, arg_3_0:GetSwitchItemClass())
	arg_3_0.heroTaskList_ = LuaList.New(handler(arg_3_0, arg_3_0.IndexHeroTask), arg_3_0.heroTaskListGo_, arg_3_0:GetHeroTaskClass())
	arg_3_0.accumulateRewardList_ = {}
	arg_3_0.itemDataList_ = {}
	arg_3_0.clickSwitchItemHandler_ = handler(arg_3_0, arg_3_0.OnClickSwitchItem)
	arg_3_0.receivedHeroTaskHandler_ = handler(arg_3_0, arg_3_0.OnReceiveHeroTask)

	arg_3_0:InitController()
end

function var_0_0.InitController(arg_4_0)
	arg_4_0.accumulateRewardState_ = ControllerUtil.GetController(arg_4_0.transform_, "accumulateRewardState")
	arg_4_0.dailyRewardState_ = ControllerUtil.GetController(arg_4_0.transform_, "dailyRewardState")
	arg_4_0.allReceiveBtnState_ = ControllerUtil.GetController(arg_4_0.transform_, "allReceive")
	arg_4_0.heroLockState_ = ControllerUtil.GetController(arg_4_0.transform_, "heroLock")
end

function var_0_0.UpdateBar(arg_5_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR
	})
end

function var_0_0.OnEnter(arg_6_0)
	arg_6_0.stopTime_ = ActivityData:GetActivityData(arg_6_0.activityID_).stopTime

	arg_6_0:AddTimer()
	arg_6_0:BindRedPoint()
end

function var_0_0.AddListeners(arg_7_0)
	arg_7_0:AddBtnListener(arg_7_0.unlockHeroBtn_, nil, function()
		if not ActivityData:GetActivityIsOpen(arg_7_0.activityID_) then
			ShowTips("TIME_OVER")

			return
		end

		local var_8_0 = arg_7_0.selectHeroID_
		local var_8_1 = arg_7_0.heroList_
		local var_8_2 = table.indexof(var_8_1, var_8_0) or 1
		local var_8_3 = ActivityCultivateHeroCfg[arg_7_0.activityID_].source[var_8_2]

		JumpTools.JumpToPage2(var_8_3)
	end)
	arg_7_0:AddBtnListener(arg_7_0.rewardPreviewBtn_, nil, function()
		if not ActivityData:GetActivityIsOpen(arg_7_0.activityID_) then
			ShowTips("TIME_OVER")

			return
		end

		JumpTools.OpenPageByJump("cultivateAccumulateReward", {
			rewardActivityID = arg_7_0.activityID_
		})
	end)
	arg_7_0:AddBtnListener(arg_7_0.receiveAccumulateBtn_, nil, function()
		if not ActivityData:GetActivityIsOpen(arg_7_0.activityID_) then
			ShowTips("TIME_OVER")

			return
		end

		CultivateHeroAction.RequireReceiveAccumulateTask(arg_7_0.activityID_, arg_7_0.firstAccumulateTaskID_, function()
			arg_7_0:RefreshAccumulateTask()
		end)
	end)
	arg_7_0:AddBtnListener(arg_7_0.receiveDailyBtn_, nil, function()
		if not ActivityData:GetActivityIsOpen(arg_7_0.activityID_) then
			ShowTips("TIME_OVER")

			return
		end

		local var_12_0 = ActivityCultivateHeroCfg[arg_7_0.activityID_].daily_reward

		if arg_7_0.canReceiveDaily_ == true then
			CultivateHeroAction.RequireReceiveDailyTask(arg_7_0.activityID_, function()
				arg_7_0:RefreshDailyTask()
				arg_7_0:RefreshAccumulateTask()
			end)
		else
			local var_12_1 = {}

			for iter_12_0, iter_12_1 in pairs(var_12_0) do
				if not var_12_1[iter_12_1[1]] then
					var_12_1[iter_12_1[1]] = {}
				end
			end

			JumpTools.OpenPageByJump("rewardPreview", {
				rewardList = var_12_0,
				extraItemTemplateDataList = var_12_1
			}, ViewConst.SYSTEM_ID.REWARD_PREVIEW)
		end
	end)
	arg_7_0:AddBtnListener(arg_7_0.receiveAllHeroTaskBtn_, nil, function()
		if not ActivityData:GetActivityIsOpen(arg_7_0.activityID_) then
			ShowTips("TIME_OVER")

			return
		end

		local var_14_0 = CultivateHeroData:GetHeroTaskInfoList(arg_7_0.activityID_)
		local var_14_1 = CultivateHeroTaskCfg.get_id_list_by_group_id[arg_7_0.selectHeroID_]
		local var_14_2 = {}

		for iter_14_0, iter_14_1 in ipairs(var_14_1) do
			if var_14_0[iter_14_1].isCompleted == true and not var_14_0[iter_14_1].isReceived then
				var_14_2[#var_14_2 + 1] = iter_14_1
			end
		end

		CultivateHeroAction.RequireReceiveHeroTaskList(arg_7_0.activityID_, var_14_2, function()
			arg_7_0:OnReceiveHeroTask()
		end)
	end)
	arg_7_0:AddBtnListener(arg_7_0.descBtn_, nil, function()
		local var_16_0 = GetTips("CULTIVATE_HERO_DESC")

		JumpTools.OpenPageByJump("gameHelp", {
			icon = "icon_i",
			key = "CULTIVATE_HERO_DESC",
			iconColor = Color(1, 1, 1),
			title = GetTips("STAGE_DESCRIPE"),
			content = var_16_0
		})
	end)
end

function var_0_0.RefreshUI(arg_17_0)
	arg_17_0.heroList_ = ActivityCultivateHeroCfg[arg_17_0.activityID_].group

	local var_17_0 = CultivateHeroData:GetSelectHeroID(arg_17_0.activityID_) or arg_17_0.heroList_[1]

	arg_17_0.selectHeroID_ = var_17_0

	if var_17_0 == nil then
		return
	end

	CultivateHeroData:SetSelectHeroID(arg_17_0.activityID_, var_17_0)

	local var_17_1 = CultivateHeroTaskCfg.get_id_list_by_group_id[var_17_0][1]
	local var_17_2 = CultivateHeroTaskCfg[var_17_1].hero
	local var_17_3 = not HeroTools.GetHeroIsUnlock(var_17_2)

	arg_17_0.heroLockState_:SetSelectedState(tostring(var_17_3))
	arg_17_0:RefreshSwitchItem()
	arg_17_0:RefreshRoleImage()
	arg_17_0:RefreshDesc()
	arg_17_0:RefreshHeroTask()
	arg_17_0:RefreshAccumulateTask()
	arg_17_0:RefreshDailyTask()
end

function var_0_0.RefreshSwitchItem(arg_18_0)
	local var_18_0 = arg_18_0.selectHeroID_
	local var_18_1 = arg_18_0.heroList_
	local var_18_2 = table.indexof(var_18_1, var_18_0) or 1

	arg_18_0.switchItemList_:StartScroll(#var_18_1, var_18_2)
end

function var_0_0.GetSwitchItemClass(arg_19_0)
	return CultivateHeroTools.GetSwitchItemClass(arg_19_0.activityID_)
end

function var_0_0.IndexItem(arg_20_0, arg_20_1, arg_20_2)
	local var_20_0 = arg_20_0.heroList_[arg_20_1]

	arg_20_2:SetData(arg_20_0.activityID_, var_20_0)
	arg_20_2:SetClickCallBack(arg_20_0.clickSwitchItemHandler_)
	arg_20_2:RefreshSelect(arg_20_0.selectHeroID_)
end

function var_0_0.OnClickSwitchItem(arg_21_0, arg_21_1)
	if arg_21_0.selectHeroID_ == arg_21_1 then
		return
	end

	CultivateHeroData:SetSelectHeroID(arg_21_0.activityID_, arg_21_1)

	arg_21_0.selectHeroID_ = arg_21_1

	local var_21_0 = arg_21_0.switchItemList_:GetItemList()

	for iter_21_0, iter_21_1 in ipairs(var_21_0) do
		iter_21_1:RefreshSelect(arg_21_1)
	end

	arg_21_0:RefreshRoleImage()
	arg_21_0:RefreshHeroTask()

	local var_21_1 = CultivateHeroTaskCfg.get_id_list_by_group_id[arg_21_1][1]
	local var_21_2 = CultivateHeroTaskCfg[var_21_1].hero
	local var_21_3 = HeroData:GetHeroData(var_21_2).unlock == 0

	arg_21_0.heroLockState_:SetSelectedState(tostring(var_21_3))
end

function var_0_0.RefreshHeroTask(arg_22_0)
	local var_22_0
	local var_22_1

	arg_22_0.sortedTaskIDList_, var_22_1 = CultivateHeroData:GetSortHeroTaskList(arg_22_0.selectHeroID_, arg_22_0.activityID_)

	arg_22_0.allReceiveBtnState_:SetSelectedState(tostring(var_22_1))

	local var_22_2 = CultivateHeroTaskCfg[arg_22_0.sortedTaskIDList_[1]].hero

	arg_22_0.heroNameText_.text = HeroTools.GetHeroFullName(var_22_2)

	arg_22_0.heroTaskList_:StartScroll(#arg_22_0.sortedTaskIDList_)
end

function var_0_0.GetHeroTaskClass(arg_23_0)
	return CultivateHeroTools.GetTaskItemClass(arg_23_0.activityID_)
end

function var_0_0.IndexHeroTask(arg_24_0, arg_24_1, arg_24_2)
	local var_24_0 = arg_24_0.sortedTaskIDList_[arg_24_1]

	arg_24_2:SetData(arg_24_0.activityID_, var_24_0)
	arg_24_2:SetReveivedHandler(arg_24_0.receivedHeroTaskHandler_)
end

function var_0_0.OnReceiveHeroTask(arg_25_0)
	arg_25_0:RefreshHeroTask()
	arg_25_0:RefreshAccumulateTask()
end

function var_0_0.RefreshAccumulateTask(arg_26_0)
	local var_26_0 = ActivityPointRewardCfg.get_id_list_by_activity_id[arg_26_0.activityID_]
	local var_26_1 = ItemTools.getItemNum(ActivityCultivateHeroCfg[arg_26_0.activityID_].coin_id)
	local var_26_2 = CultivateHeroData:GetAccumulateTaskInfoList(arg_26_0.activityID_)

	arg_26_0.accumulateStatus_ = 0

	local var_26_3 = #var_26_0
	local var_26_4 = 0

	arg_26_0.firstAccumulateTaskID_ = nil

	for iter_26_0, iter_26_1 in ipairs(var_26_0) do
		local var_26_5 = ActivityPointRewardCfg[iter_26_1]
		local var_26_6 = var_26_2[iter_26_1] and var_26_2[iter_26_1].isReceived == true

		if var_26_1 < var_26_5.need then
			arg_26_0.accumulateStatus_ = 0

			if arg_26_0.firstAccumulateTaskID_ == nil then
				arg_26_0.firstAccumulateTaskID_ = iter_26_1
			end
		elseif not var_26_6 then
			arg_26_0.accumulateStatus_ = 1
			arg_26_0.firstAccumulateTaskID_ = iter_26_1

			break
		else
			var_26_4 = var_26_4 + 1
		end

		if iter_26_0 == var_26_3 and var_26_6 then
			arg_26_0.firstAccumulateTaskID_ = iter_26_1
			arg_26_0.accumulateStatus_ = 2
		end
	end

	local var_26_7 = ActivityPointRewardCfg[arg_26_0.firstAccumulateTaskID_]
	local var_26_8 = var_26_7.need

	arg_26_0.curAccumulateProgressText_.text = string.format(GetTips("VERIFY_ASSETS_PROCESSING_RATE"), var_26_1, var_26_8)
	arg_26_0.coinImage_.sprite = ItemTools.getItemSprite(ActivityCultivateHeroCfg[arg_26_0.activityID_].coin_id)

	arg_26_0:RefreshTotalAccumulateProgress(var_26_4, var_26_3)
	arg_26_0:RefreshAccumulateRewardItem(var_26_7)
	arg_26_0:RefreshAccumulateRewardState()
end

function var_0_0.RefreshTotalAccumulateProgress(arg_27_0, arg_27_1, arg_27_2)
	arg_27_0.totalAccumulateProgressText_.text = string.format(GetTips("VERIFY_ASSETS_PROCESSING_RATE"), arg_27_1, arg_27_2)
end

function var_0_0.RefreshAccumulateRewardItem(arg_28_0, arg_28_1)
	local var_28_0 = arg_28_1.reward_item_list

	for iter_28_0, iter_28_1 in ipairs(var_28_0) do
		if not arg_28_0.accumulateRewardList_[iter_28_0] then
			arg_28_0.accumulateRewardList_[iter_28_0] = CommonItemPool.New(arg_28_0.goRewardPanel_, nil, true)
			arg_28_0.itemDataList_[iter_28_0] = clone(ItemTemplateData)
			arg_28_0.itemDataList_[iter_28_0].clickFun = function(arg_29_0)
				ShowPopItem(POP_ITEM, {
					arg_29_0.id,
					arg_29_0.number
				})
			end
		end

		arg_28_0.itemDataList_[iter_28_0].id = iter_28_1[1]
		arg_28_0.itemDataList_[iter_28_0].number = iter_28_1[2]

		arg_28_0.accumulateRewardList_[iter_28_0]:Show(true)
		arg_28_0.accumulateRewardList_[iter_28_0]:SetData(arg_28_0.itemDataList_[iter_28_0])
	end

	for iter_28_2 = #var_28_0 + 1, #arg_28_0.accumulateRewardList_ do
		arg_28_0.accumulateRewardList_[iter_28_2]:Show(false)
	end
end

function var_0_0.RefreshAccumulateRewardState(arg_30_0)
	if arg_30_0.accumulateStatus_ == 0 then
		arg_30_0.accumulateRewardState_:SetSelectedState("uncompleted")
	elseif arg_30_0.accumulateStatus_ == 2 then
		arg_30_0.accumulateRewardState_:SetSelectedState("received")
	else
		arg_30_0.accumulateRewardState_:SetSelectedState("unreceived")
	end
end

function var_0_0.RefreshDailyTask(arg_31_0)
	arg_31_0:RefreshDailyProgress()
	arg_31_0:RefreshDailyRewardState()
end

function var_0_0.RefreshDailyProgress(arg_32_0)
	local var_32_0 = 100
	local var_32_1 = ActivityPtData:GetCurrentActivityPt(ActivityPtConst.TASK_DAILY_ACTIVITY_PT)

	arg_32_0.dailyPrograssText_.text = string.format(GetTips("VERIFY_ASSETS_PROCESSING_RATE"), var_32_1, var_32_0)
end

function var_0_0.RefreshDailyRewardState(arg_33_0)
	local var_33_0 = 100
	local var_33_1 = ActivityPtData:GetCurrentActivityPt(ActivityPtConst.TASK_DAILY_ACTIVITY_PT)

	if CultivateHeroData:GetDailyTaskStatus()[arg_33_0.activityID_] then
		arg_33_0.dailyRewardState_:SetSelectedState("received")
	elseif var_33_0 <= var_33_1 then
		arg_33_0.canReceiveDaily_ = true

		arg_33_0.dailyRewardState_:SetSelectedState("unreceive")
	else
		arg_33_0.canReceiveDaily_ = false

		arg_33_0.dailyRewardState_:SetSelectedState("uncomplete")
	end
end

function var_0_0.OnActivityPtUpdate(arg_34_0)
	arg_34_0:RefreshDailyTask()
end

function var_0_0.RefreshRoleImage(arg_35_0)
	local var_35_0 = CultivateHeroTaskCfg.get_id_list_by_group_id[arg_35_0.selectHeroID_]
	local var_35_1 = CultivateHeroTaskCfg[var_35_0[1]].hero

	arg_35_0.roleImage_.spriteSync = "TextureConfig/Character/Portrait/" .. var_35_1
end

function var_0_0.RefreshDesc(arg_36_0)
	arg_36_0.descText_.text = GetTips("CULTIVATE_HERO_CONTENT")
end

function var_0_0.AddTimer(arg_37_0)
	if manager.time:GetServerTime() >= arg_37_0.stopTime_ then
		arg_37_0.textTime_.text = GetTips("TIME_OVER")

		return
	end

	arg_37_0:StopTimer()

	arg_37_0.textTime_.text = string.format(GetTips("LEFT_TIME"), manager.time:GetLostTimeStrWith2Unit(arg_37_0.stopTime_))
	arg_37_0.timer_ = Timer.New(function()
		if manager.time:GetServerTime() >= arg_37_0.stopTime_ then
			arg_37_0:StopTimer()

			arg_37_0.textTime_.text = GetTips("TIME_OVER")

			return
		end

		arg_37_0.textTime_.text = string.format(GetTips("LEFT_TIME"), manager.time:GetLostTimeStrWith2Unit(arg_37_0.stopTime_))
	end, 1, -1)

	arg_37_0.timer_:Start()
end

function var_0_0.StopTimer(arg_39_0)
	if arg_39_0.timer_ then
		arg_39_0.timer_:Stop()

		arg_39_0.timer_ = nil
	end
end

function var_0_0.OnExit(arg_40_0)
	arg_40_0:UnbindRedPoint()
	arg_40_0:StopTimer()
end

function var_0_0.Dispose(arg_41_0)
	var_0_0.super.Dispose(arg_41_0)
	arg_41_0:StopTimer()

	if arg_41_0.switchItemList_ then
		arg_41_0.switchItemList_:Dispose()

		arg_41_0.switchItemList_ = nil
	end

	if arg_41_0.heroTaskList_ then
		arg_41_0.heroTaskList_:Dispose()

		arg_41_0.heroTaskList_ = nil
	end

	if arg_41_0.accumulateRewardList_ then
		for iter_41_0, iter_41_1 in ipairs(arg_41_0.accumulateRewardList_) do
			iter_41_1:Dispose()
		end

		arg_41_0.accumulateRewardList_ = nil
	end

	arg_41_0.clickSwitchItemHandler_ = nil
	arg_41_0.receivedHeroTaskHandler_ = nil

	Object.Destroy(arg_41_0.gameObject_)

	arg_41_0.transform_ = nil
	arg_41_0.gameObject_ = nil
end

function var_0_0.BindRedPoint(arg_42_0)
	local var_42_0 = string.format("%s_%s_Daily_Reward", RedPointConst.CULTIVATE_HERO, arg_42_0.activityID_)

	manager.redPoint:bindUIandKey(arg_42_0.receiveDailyBtn_.transform, var_42_0)
end

function var_0_0.UnbindRedPoint(arg_43_0)
	local var_43_0 = string.format("%s_%s_Daily_Reward", RedPointConst.CULTIVATE_HERO, arg_43_0.activityID_)

	manager.redPoint:unbindUIandKey(arg_43_0.receiveDailyBtn_.transform, var_43_0)
end

function var_0_0.Show(arg_44_0, arg_44_1)
	SetActive(arg_44_0.gameObject_, arg_44_1)

	if arg_44_1 == true then
		arg_44_0:RefreshUI()
		arg_44_0:RegistEventListener(NEW_DAY, handler(arg_44_0, arg_44_0.OnNewDay))
	else
		arg_44_0:RemoveAllEventListener()
	end
end

function var_0_0.OnNewDay(arg_45_0)
	arg_45_0:RefreshUI()
end

return var_0_0
