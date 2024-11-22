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
	arg_3_0:AddListeners()

	arg_3_0.switchItemList_ = LuaList.New(handler(arg_3_0, arg_3_0.IndexItem), arg_3_0.switchListGo_, arg_3_0:GetSwitchItemClass())
	arg_3_0.heroTaskList_ = LuaList.New(handler(arg_3_0, arg_3_0.IndexHeroTask), arg_3_0.heroTaskListGo_, arg_3_0:GetHeroTaskClass())
	arg_3_0.accumulateRewardList_ = {}
	arg_3_0.itemDataList_ = {}
	arg_3_0.clickSwitchItemHandler_ = handler(arg_3_0, arg_3_0.OnClickSwitchItem)
	arg_3_0.receivedHeroTaskHandler_ = handler(arg_3_0, arg_3_0.OnReceiveHeroTask)
	arg_3_0.accumulateRewardState_ = ControllerUtil.GetController(arg_3_0.transform_, "accumulateRewardState")
	arg_3_0.dailyRewardState_ = ControllerUtil.GetController(arg_3_0.transform_, "dailyRewardState")
	arg_3_0.allReceiveBtnState_ = ControllerUtil.GetController(arg_3_0.transform_, "allReceive")
	arg_3_0.heroLockState_ = ControllerUtil.GetController(arg_3_0.transform_, "heroLock")
end

function var_0_0.UpdateBar(arg_4_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR
	})
end

function var_0_0.OnEnter(arg_5_0)
	arg_5_0.stopTime_ = ActivityData:GetActivityData(arg_5_0.activityID_).stopTime

	arg_5_0:AddTimer()
	arg_5_0:BindRedPoint()
end

function var_0_0.AddListeners(arg_6_0)
	arg_6_0:AddBtnListener(arg_6_0.unlockHeroBtn_, nil, function()
		if not ActivityData:GetActivityIsOpen(arg_6_0.activityID_) then
			ShowTips("TIME_OVER")

			return
		end

		local var_7_0 = arg_6_0.selectHeroID_
		local var_7_1 = arg_6_0.heroList_
		local var_7_2 = table.indexof(var_7_1, var_7_0) or 1
		local var_7_3 = ActivityCultivateHeroCfg[arg_6_0.activityID_].source[var_7_2]

		JumpTools.JumpToPage2(var_7_3)
	end)
	arg_6_0:AddBtnListener(arg_6_0.rewardPreviewBtn_, nil, function()
		if not ActivityData:GetActivityIsOpen(arg_6_0.activityID_) then
			ShowTips("TIME_OVER")

			return
		end

		JumpTools.OpenPageByJump("cultivateAccumulateReward", {
			activityID = arg_6_0.activityID_
		})
	end)
	arg_6_0:AddBtnListener(arg_6_0.receiveAccumulateBtn_, nil, function()
		if not ActivityData:GetActivityIsOpen(arg_6_0.activityID_) then
			ShowTips("TIME_OVER")

			return
		end

		CultivateHeroAction.RequireReceiveAccumulateTask(arg_6_0.activityID_, arg_6_0.firstAccumulateTaskID_, function()
			arg_6_0:RefreshAccumulateTask()
		end)
	end)
	arg_6_0:AddBtnListener(arg_6_0.receiveDailyBtn_, nil, function()
		if not ActivityData:GetActivityIsOpen(arg_6_0.activityID_) then
			ShowTips("TIME_OVER")

			return
		end

		local var_11_0 = ActivityCultivateHeroCfg[arg_6_0.activityID_].daily_reward

		if arg_6_0.canReceiveDaily_ == true then
			CultivateHeroAction.RequireReceiveDailyTask(arg_6_0.activityID_, function()
				arg_6_0:RefreshDailyTask()
				arg_6_0:RefreshAccumulateTask()
			end)
		else
			local var_11_1 = {}

			for iter_11_0, iter_11_1 in pairs(var_11_0) do
				if not var_11_1[iter_11_1[1]] then
					var_11_1[iter_11_1[1]] = {}
				end
			end

			JumpTools.OpenPageByJump("rewardPreview", {
				rewardList = var_11_0,
				extraItemTemplateDataList = var_11_1
			}, ViewConst.SYSTEM_ID.REWARD_PREVIEW)
		end
	end)
	arg_6_0:AddBtnListener(arg_6_0.receiveAllHeroTaskBtn_, nil, function()
		if not ActivityData:GetActivityIsOpen(arg_6_0.activityID_) then
			ShowTips("TIME_OVER")

			return
		end

		local var_13_0 = CultivateHeroData:GetHeroTaskInfoList(arg_6_0.activityID_)
		local var_13_1 = CultivateHeroTaskCfg.get_id_list_by_group_id[arg_6_0.selectHeroID_]
		local var_13_2 = {}

		for iter_13_0, iter_13_1 in ipairs(var_13_1) do
			if var_13_0[iter_13_1].isCompleted == true and not var_13_0[iter_13_1].isReceived then
				var_13_2[#var_13_2 + 1] = iter_13_1
			end
		end

		CultivateHeroAction.RequireReceiveHeroTaskList(arg_6_0.activityID_, var_13_2, function()
			arg_6_0:OnReceiveHeroTask()
		end)
	end)
	arg_6_0:AddBtnListener(arg_6_0.descBtn_, nil, function()
		local var_15_0 = GetTips("CULTIVATE_HERO_DESC")

		JumpTools.OpenPageByJump("gameHelp", {
			icon = "icon_i",
			key = "CULTIVATE_HERO_DESC",
			iconColor = Color(1, 1, 1),
			title = GetTips("STAGE_DESCRIPE"),
			content = var_15_0
		})
	end)
end

function var_0_0.RefreshUI(arg_16_0)
	arg_16_0.heroList_ = ActivityCultivateHeroCfg[arg_16_0.activityID_].group

	local var_16_0 = CultivateHeroData:GetSelectHeroID(arg_16_0.activityID_) or arg_16_0.heroList_[1]

	arg_16_0.selectHeroID_ = var_16_0

	if var_16_0 == nil then
		return
	end

	CultivateHeroData:SetSelectHeroID(arg_16_0.activityID_, var_16_0)

	local var_16_1 = CultivateHeroTaskCfg.get_id_list_by_group_id[var_16_0][1]
	local var_16_2 = CultivateHeroTaskCfg[var_16_1].hero
	local var_16_3 = not HeroTools.GetHeroIsUnlock(var_16_2)

	arg_16_0.heroLockState_:SetSelectedState(tostring(var_16_3))
	arg_16_0:RefreshSwitchItem()
	arg_16_0:RefreshRoleImage()
	arg_16_0:RefreshDesc()
	arg_16_0:RefreshHeroTask()
	arg_16_0:RefreshAccumulateTask()
	arg_16_0:RefreshDailyTask()
end

function var_0_0.RefreshSwitchItem(arg_17_0)
	local var_17_0 = arg_17_0.selectHeroID_
	local var_17_1 = arg_17_0.heroList_
	local var_17_2 = table.indexof(var_17_1, var_17_0) or 1

	arg_17_0.switchItemList_:StartScroll(#var_17_1, var_17_2)
end

function var_0_0.GetSwitchItemClass(arg_18_0)
	return CultivateHeroTools.GetSwitchItemClass(arg_18_0.activityID_)
end

function var_0_0.IndexItem(arg_19_0, arg_19_1, arg_19_2)
	local var_19_0 = arg_19_0.heroList_[arg_19_1]

	arg_19_2:SetData(arg_19_0.activityID_, var_19_0)
	arg_19_2:SetClickCallBack(arg_19_0.clickSwitchItemHandler_)
	arg_19_2:RefreshSelect(arg_19_0.selectHeroID_)
end

function var_0_0.OnClickSwitchItem(arg_20_0, arg_20_1)
	if arg_20_0.selectHeroID_ == arg_20_1 then
		return
	end

	CultivateHeroData:SetSelectHeroID(arg_20_0.activityID_, arg_20_1)

	arg_20_0.selectHeroID_ = arg_20_1

	local var_20_0 = arg_20_0.switchItemList_:GetItemList()

	for iter_20_0, iter_20_1 in ipairs(var_20_0) do
		iter_20_1:RefreshSelect(arg_20_1)
	end

	arg_20_0:RefreshRoleImage()
	arg_20_0:RefreshHeroTask()

	local var_20_1 = CultivateHeroTaskCfg.get_id_list_by_group_id[arg_20_1][1]
	local var_20_2 = CultivateHeroTaskCfg[var_20_1].hero
	local var_20_3 = HeroData:GetHeroData(var_20_2).unlock == 0

	arg_20_0.heroLockState_:SetSelectedState(tostring(var_20_3))
end

function var_0_0.RefreshHeroTask(arg_21_0)
	local var_21_0
	local var_21_1

	arg_21_0.sortedTaskIDList_, var_21_1 = CultivateHeroData:GetSortHeroTaskList(arg_21_0.selectHeroID_, arg_21_0.activityID_)

	arg_21_0.allReceiveBtnState_:SetSelectedState(tostring(var_21_1))

	local var_21_2 = CultivateHeroTaskCfg[arg_21_0.sortedTaskIDList_[1]].hero

	arg_21_0.heroNameText_.text = string.format("%s·%s", GetI18NText(HeroCfg[var_21_2].name), GetI18NText(HeroCfg[var_21_2].suffix))

	arg_21_0.heroTaskList_:StartScroll(#arg_21_0.sortedTaskIDList_)
end

function var_0_0.GetHeroTaskClass(arg_22_0)
	return CultivateHeroTaskItem
end

function var_0_0.IndexHeroTask(arg_23_0, arg_23_1, arg_23_2)
	local var_23_0 = arg_23_0.sortedTaskIDList_[arg_23_1]

	arg_23_2:SetData(arg_23_0.activityID_, var_23_0)
	arg_23_2:SetReveivedHandler(arg_23_0.receivedHeroTaskHandler_)
end

function var_0_0.OnReceiveHeroTask(arg_24_0)
	arg_24_0:RefreshHeroTask()
	arg_24_0:RefreshAccumulateTask()
end

function var_0_0.RefreshAccumulateTask(arg_25_0)
	local var_25_0 = ActivityPointRewardCfg.get_id_list_by_activity_id[arg_25_0.activityID_]
	local var_25_1 = ItemTools.getItemNum(ActivityCultivateHeroCfg[arg_25_0.activityID_].coin_id)
	local var_25_2 = CultivateHeroData:GetAccumulateTaskInfoList(arg_25_0.activityID_)
	local var_25_3 = 0
	local var_25_4 = #var_25_0
	local var_25_5 = 0

	arg_25_0.firstAccumulateTaskID_ = nil

	for iter_25_0, iter_25_1 in ipairs(var_25_0) do
		local var_25_6 = ActivityPointRewardCfg[iter_25_1]
		local var_25_7 = var_25_2[iter_25_1] and var_25_2[iter_25_1].isReceived == true

		if var_25_1 < var_25_6.need then
			var_25_3 = 0

			if arg_25_0.firstAccumulateTaskID_ == nil then
				arg_25_0.firstAccumulateTaskID_ = iter_25_1
			end
		elseif not var_25_7 then
			var_25_3 = 1
			arg_25_0.firstAccumulateTaskID_ = iter_25_1

			break
		else
			var_25_5 = var_25_5 + 1
		end

		if iter_25_0 == var_25_4 and var_25_7 then
			arg_25_0.firstAccumulateTaskID_ = iter_25_1
			var_25_3 = 2
		end
	end

	arg_25_0.totalAccumulateProgressText_.text = string.format(GetTips("VERIFY_ASSETS_PROCESSING_RATE"), var_25_5, var_25_4)

	local var_25_8 = ActivityPointRewardCfg[arg_25_0.firstAccumulateTaskID_]
	local var_25_9 = var_25_8.need

	arg_25_0.curAccumulateProgressText_.text = string.format(GetTips("VERIFY_ASSETS_PROCESSING_RATE"), var_25_1, var_25_9)
	arg_25_0.coinImage_.sprite = ItemTools.getItemSprite(ActivityCultivateHeroCfg[arg_25_0.activityID_].coin_id)

	local var_25_10 = var_25_8.reward_item_list

	for iter_25_2, iter_25_3 in ipairs(var_25_10) do
		if not arg_25_0.accumulateRewardList_[iter_25_2] then
			arg_25_0.accumulateRewardList_[iter_25_2] = CommonItemPool.New(arg_25_0.goRewardPanel_, nil, true)
			arg_25_0.itemDataList_[iter_25_2] = clone(ItemTemplateData)
			arg_25_0.itemDataList_[iter_25_2].clickFun = function(arg_26_0)
				ShowPopItem(POP_ITEM, {
					arg_26_0.id,
					arg_26_0.number
				})
			end
		end

		arg_25_0.itemDataList_[iter_25_2].id = iter_25_3[1]
		arg_25_0.itemDataList_[iter_25_2].number = iter_25_3[2]

		arg_25_0.accumulateRewardList_[iter_25_2]:Show(true)
		arg_25_0.accumulateRewardList_[iter_25_2]:SetData(arg_25_0.itemDataList_[iter_25_2])
	end

	for iter_25_4 = #var_25_10 + 1, #arg_25_0.accumulateRewardList_ do
		arg_25_0.accumulateRewardList_[iter_25_4]:Show(false)
	end

	if var_25_3 == 0 then
		arg_25_0.accumulateRewardState_:SetSelectedState("uncompleted")
	elseif var_25_3 == 2 then
		arg_25_0.accumulateRewardState_:SetSelectedState("received")
	else
		arg_25_0.accumulateRewardState_:SetSelectedState("unreceived")
	end
end

function var_0_0.RefreshDailyTask(arg_27_0)
	local var_27_0 = 100
	local var_27_1 = ActivityPtData:GetCurrentActivityPt(ActivityPtConst.TASK_DAILY_ACTIVITY_PT)

	if CultivateHeroData:GetDailyTaskStatus()[arg_27_0.activityID_] then
		arg_27_0.dailyRewardState_:SetSelectedState("received")
	elseif var_27_0 <= var_27_1 then
		arg_27_0.canReceiveDaily_ = true

		arg_27_0.dailyRewardState_:SetSelectedState("unreceive")
	else
		arg_27_0.canReceiveDaily_ = false

		arg_27_0.dailyRewardState_:SetSelectedState("uncomplete")
	end

	arg_27_0.dailyPrograssText_.text = string.format(GetTips("VERIFY_ASSETS_PROCESSING_RATE"), var_27_1, var_27_0)
end

function var_0_0.OnActivityPtUpdate(arg_28_0)
	arg_28_0:RefreshDailyTask()
end

function var_0_0.RefreshRoleImage(arg_29_0)
	local var_29_0 = CultivateHeroTaskCfg.get_id_list_by_group_id[arg_29_0.selectHeroID_]
	local var_29_1 = CultivateHeroTaskCfg[var_29_0[1]].hero

	arg_29_0.roleImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Character/Portrait/" .. var_29_1)
end

function var_0_0.RefreshDesc(arg_30_0)
	arg_30_0.descText_.text = GetTips("CULTIVATE_HERO_CONTENT")
end

function var_0_0.AddTimer(arg_31_0)
	if manager.time:GetServerTime() >= arg_31_0.stopTime_ then
		arg_31_0.textTime_.text = GetTips("TIME_OVER")

		return
	end

	arg_31_0:StopTimer()

	arg_31_0.textTime_.text = manager.time:GetLostTimeStrWith2Unit(arg_31_0.stopTime_)
	arg_31_0.timer_ = Timer.New(function()
		if manager.time:GetServerTime() >= arg_31_0.stopTime_ then
			arg_31_0:StopTimer()

			arg_31_0.textTime_.text = GetTips("TIME_OVER")

			return
		end

		arg_31_0.textTime_.text = manager.time:GetLostTimeStrWith2Unit(arg_31_0.stopTime_)
	end, 1, -1)

	arg_31_0.timer_:Start()
end

function var_0_0.StopTimer(arg_33_0)
	if arg_33_0.timer_ then
		arg_33_0.timer_:Stop()

		arg_33_0.timer_ = nil
	end
end

function var_0_0.OnExit(arg_34_0)
	arg_34_0:UnbindRedPoint()
	arg_34_0:StopTimer()
end

function var_0_0.Dispose(arg_35_0)
	var_0_0.super.Dispose(arg_35_0)
	arg_35_0:StopTimer()

	if arg_35_0.switchItemList_ then
		arg_35_0.switchItemList_:Dispose()

		arg_35_0.switchItemList_ = nil
	end

	if arg_35_0.heroTaskList_ then
		arg_35_0.heroTaskList_:Dispose()

		arg_35_0.heroTaskList_ = nil
	end

	if arg_35_0.accumulateRewardList_ then
		for iter_35_0, iter_35_1 in ipairs(arg_35_0.accumulateRewardList_) do
			iter_35_1:Dispose()
		end

		arg_35_0.accumulateRewardList_ = nil
	end

	arg_35_0.clickSwitchItemHandler_ = nil
	arg_35_0.receivedHeroTaskHandler_ = nil

	Object.Destroy(arg_35_0.gameObject_)

	arg_35_0.transform_ = nil
	arg_35_0.gameObject_ = nil
end

function var_0_0.BindRedPoint(arg_36_0)
	local var_36_0 = string.format("%s_%s_Daily_Reward", RedPointConst.CULTIVATE_HERO, arg_36_0.activityID_)

	manager.redPoint:bindUIandKey(arg_36_0.receiveDailyBtn_.transform, var_36_0)
end

function var_0_0.UnbindRedPoint(arg_37_0)
	local var_37_0 = string.format("%s_%s_Daily_Reward", RedPointConst.CULTIVATE_HERO, arg_37_0.activityID_)

	manager.redPoint:unbindUIandKey(arg_37_0.receiveDailyBtn_.transform, var_37_0)
end

function var_0_0.Show(arg_38_0, arg_38_1)
	SetActive(arg_38_0.gameObject_, arg_38_1)

	if arg_38_1 == true then
		arg_38_0:RefreshUI()
		arg_38_0:RegistEventListener(NEW_DAY, handler(arg_38_0, arg_38_0.OnNewDay))
	else
		arg_38_0:RemoveAllEventListener()
	end
end

function var_0_0.OnNewDay(arg_39_0)
	arg_39_0:RefreshUI()
end

return var_0_0
