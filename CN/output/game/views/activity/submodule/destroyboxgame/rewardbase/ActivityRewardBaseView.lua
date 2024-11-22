local var_0_0 = class("ActivityRewardBaseView", ReduxView)

var_0_0.OBJECT_TYPE = {
	ITEM = 2,
	TITLE = 1
}

function var_0_0.UIName(arg_1_0)
	return ""
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiPop.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:BindCfgUI()
	arg_3_0:AddListeners()

	arg_3_0.refreshHandler_ = handler(arg_3_0, arg_3_0.OnUpdateUI)

	local var_3_0 = arg_3_0.contentTf_.rect.height
	local var_3_1 = arg_3_0.gridTrs_:GetComponent("VerticalLayoutGroup").spacing

	arg_3_0.loopScrollView_ = LoopScrollView.New(arg_3_0, arg_3_0.scrollRectEx_, arg_3_0.gridTrs_, arg_3_0.contentTf_, var_3_0, var_3_1)
	arg_3_0.titleItemPool_ = {}
	arg_3_0.taskItemPool_ = {}
	arg_3_0.receiveAllController_ = arg_3_0.controllerEx_:GetController("receiveAll")
end

function var_0_0.OnEnter(arg_4_0)
	arg_4_0:InitData()
	arg_4_0:RefreshUI()
	manager.notify:RegistListener(ACTIVITY_REWARD_REFRESH, arg_4_0.refreshHandler_)
end

function var_0_0.OnExit(arg_5_0)
	manager.notify:RemoveListener(ACTIVITY_REWARD_REFRESH, arg_5_0.refreshHandler_)
end

function var_0_0.Dispose(arg_6_0)
	arg_6_0.refreshHandler_ = nil

	for iter_6_0, iter_6_1 in ipairs(arg_6_0.titleItemPool_) do
		iter_6_1.itemView:Dispose()
	end

	arg_6_0.titleItemPool_ = nil

	for iter_6_2, iter_6_3 in ipairs(arg_6_0.taskItemPool_) do
		iter_6_3.itemView:Dispose()
	end

	arg_6_0.taskItemPool_ = nil

	arg_6_0.loopScrollView_:Dispose()

	arg_6_0.loopScrollView_ = nil

	var_0_0.super.Dispose(arg_6_0)
end

function var_0_0.AddListeners(arg_7_0)
	arg_7_0:AddBtnListener(arg_7_0.bgBtn_, nil, function()
		arg_7_0:Back()
	end)
	arg_7_0:AddBtnListener(arg_7_0.receiveBtn_, nil, function()
		arg_7_0:OnClickReceiveBtn()
	end)
end

function var_0_0.RefreshUI(arg_10_0)
	arg_10_0:RefreshText()
	arg_10_0.loopScrollView_:NavigateIndex(1)
end

function var_0_0.RefreshText(arg_11_0)
	arg_11_0.getLabel1_.text = arg_11_0:GetFinishRewardCnt()
	arg_11_0.getLabel2_.text = string.format("/%s", arg_11_0:GetMaxTaskCnt())

	if #arg_11_0.canReceiveRewardList_ > 0 then
		arg_11_0.receiveAllController_:SetSelectedState("true")
	else
		arg_11_0.receiveAllController_:SetSelectedState("false")
	end
end

function var_0_0.OnUpdateUI(arg_12_0)
	arg_12_0.canReceiveRewardList_ = DestroyBoxGameTools.GetCanReceiveRewardList(arg_12_0.mainActivityID_)

	arg_12_0:RefreshText()

	for iter_12_0, iter_12_1 in ipairs(arg_12_0.loopScrollView_:GetItemList()) do
		iter_12_1.itemView:Update()
	end
end

function var_0_0.InitData(arg_13_0)
	arg_13_0.uiDataList_ = {}
end

function var_0_0.GetMaxTaskCnt(arg_14_0)
	return 0
end

function var_0_0.GetFinishRewardCnt(arg_15_0)
	return 0
end

function var_0_0.GetTaskItemClass(arg_16_0)
	return ActivityRewardItemBase
end

function var_0_0.OnClickReceiveBtn(arg_17_0)
	return
end

function var_0_0.LsAddItem(arg_18_0, arg_18_1, arg_18_2)
	local var_18_0 = arg_18_1.objectType
	local var_18_1

	if var_18_0 == var_0_0.OBJECT_TYPE.TITLE then
		var_18_1 = arg_18_0:GetFreeItem(arg_18_0.titleItemPool_, function()
			return ActivityRewardTitleItem.New(arg_18_0.titleItem_, arg_18_0.parent_)
		end)
	else
		var_18_1 = arg_18_0:GetFreeItem(arg_18_0.taskItemPool_, function()
			return arg_18_0:GetTaskItemClass().New(arg_18_0.taskItem_, arg_18_0.parent_)
		end)
	end

	var_18_1.itemView:SetData(arg_18_1.data, arg_18_2)

	return var_18_1
end

function var_0_0.LsRemoveItem(arg_21_0, arg_21_1, arg_21_2)
	arg_21_1.itemView:Show(false)

	arg_21_1.isFree = true
end

function var_0_0.LsGetItemData(arg_22_0)
	return arg_22_0.uiDataList_
end

function var_0_0.GetFreeItem(arg_23_0, arg_23_1, arg_23_2)
	for iter_23_0, iter_23_1 in pairs(arg_23_1) do
		if iter_23_1.isFree == true then
			iter_23_1.isFree = false

			return iter_23_1
		end
	end

	local var_23_0 = {
		isFree = false,
		itemView = arg_23_2()
	}

	table.insert(arg_23_1, var_23_0)

	return var_23_0
end

return var_0_0
