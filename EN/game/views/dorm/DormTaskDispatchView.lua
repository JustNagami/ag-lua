local var_0_0 = class("DormTaskDispatchView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/BackHouseUI/canteen/EmptyDreamTaskPop"
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

	arg_4_0.taskScroll_ = LuaList.New(handler(arg_4_0, arg_4_0.indexItem), arg_4_0.taskuilistUilist_, DormDispatchMissionItem)
end

function var_0_0.AddUIListener(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.bgmaskBtn_, nil, function()
		JumpTools.Back()
	end)
end

function var_0_0.RegisterEvent(arg_7_0)
	arg_7_0:RegistEventListener(CANTEEN_REFRESH_ENTRUST_CALLBACK, function(arg_8_0)
		arg_7_0:RefreshListInfo()

		local var_8_0 = CanteenEntrustData:GetUiPosByEntrustPos(arg_8_0)

		if arg_7_0.refreshFlag then
			ShowTips("CANTEEN_TASK_REFRESH_SUCCESS")
		else
			DormRedPointTools:CheckUnLockEntrustRedPoint()
		end

		local var_8_1 = arg_7_0.taskScroll_:GetItemByIndex(var_8_0)
		local var_8_2 = CanteenEntrustData:GetEntrustByPos(arg_8_0)

		var_8_1:RefreshUI(var_8_2)
	end)
	arg_7_0:RegistEventListener(CANTEEN_DISPATCH_ENTRUST_SUCCESS, function(arg_9_0)
		arg_7_0:RefreshListInfo()

		local var_9_0 = CanteenEntrustData:GetUiPosByEntrustPos(arg_9_0)
		local var_9_1 = arg_7_0.taskScroll_:GetItemByIndex(var_9_0)
		local var_9_2 = CanteenEntrustData:GetEntrustByPos(arg_9_0)

		var_9_1:RefreshUI(var_9_2)
	end)
	arg_7_0:RegistEventListener(CANTEEN_DISPATCH_REWARD_VIEW, function()
		JumpTools.OpenPageByJump("/canteenEntrustAwardView", {
			flag = true
		})
	end)
	arg_7_0:RegistEventListener(CANTEEN_DISPATCH_TIME_OVER, function()
		arg_7_0:GetHadFinishEntrustAward()
	end)
end

function var_0_0.indexItem(arg_12_0, arg_12_1, arg_12_2)
	arg_12_2:RefreshUI(arg_12_0.dispatchItemList_[arg_12_1])
	arg_12_2:RegisterConfirmCallBack(function(arg_13_0, arg_13_1, arg_13_2)
		CanteenEntrustData:SetCurDispatchTask(arg_13_0, arg_13_1, arg_13_2)
		JumpTools.OpenPageByJump("/chooseCharacterView", {
			roomID = arg_12_0.roomID
		})
	end)
	arg_12_2:RegisterRefreshCallBack(function(arg_14_0)
		arg_12_0.refreshFlag = true

		CanteenEntrustData:RefreshEntrustData(arg_14_0, arg_12_0.roomID)
	end)
	arg_12_2:RegisterCancelCallBack(function(arg_15_0, arg_15_1)
		CanteenEntrustData:CancelEntrust(arg_15_1, arg_12_0.roomID)
	end)
end

function var_0_0.OnEnter(arg_16_0)
	arg_16_0.roomID = DormConst.CANTEEN_ID

	arg_16_0:RegisterEvent()

	if arg_16_0:GetHadFinishEntrustAward() then
		return
	end

	arg_16_0:RefreshListInfo()
	arg_16_0.taskScroll_:StartScroll(#arg_16_0.dispatchItemList_)

	arg_16_0.refreshFlag = false

	if not arg_16_0.refreshTimer then
		arg_16_0.refreshTimer = Timer.New(function()
			arg_16_0:RefreshItemTime()
		end, 1, -1)
	end

	arg_16_0.refreshTimer:Start()
end

function var_0_0.RefreshListInfo(arg_18_0)
	arg_18_0.dispatchItemList_ = {}

	for iter_18_0, iter_18_1 in ipairs(GameDisplayCfg.canteen_task_id_pos.value) do
		local var_18_0 = CanteenEntrustData:GetEntrustByPos(iter_18_1[2])

		if var_18_0 then
			table.insert(arg_18_0.dispatchItemList_, var_18_0)
		end
	end
end

function var_0_0.RefreshItemTime(arg_19_0)
	if arg_19_0.taskScroll_ then
		for iter_19_0 = 1, #arg_19_0.dispatchItemList_ do
			local var_19_0 = arg_19_0.taskScroll_:GetItemByIndex(iter_19_0)

			if var_19_0 then
				var_19_0:RefreshTimeMessage()
			end
		end
	end
end

function var_0_0.GetHadFinishEntrustAward(arg_20_0)
	local var_20_0 = CanteenEntrustData:CheckHasTimeOverEntrust()

	if #var_20_0 > 0 then
		CanteenAction:ReceiveEntrustAward(arg_20_0.roomID, var_20_0)

		return true
	end

	return false
end

function var_0_0.OnExit(arg_21_0)
	arg_21_0:RemoveAllEventListener()

	if arg_21_0.refreshTimer then
		arg_21_0.refreshTimer:Stop()

		arg_21_0.refreshTimer = nil
	end
end

function var_0_0.Dispose(arg_22_0)
	if arg_22_0.taskScroll_ then
		arg_22_0.taskScroll_:Dispose()

		arg_22_0.taskScroll_ = nil
	end

	if arg_22_0.refreshTimer then
		arg_22_0.refreshTimer:Stop()

		arg_22_0.refreshTimer = nil
	end

	var_0_0.super.Dispose(arg_22_0)
end

return var_0_0
