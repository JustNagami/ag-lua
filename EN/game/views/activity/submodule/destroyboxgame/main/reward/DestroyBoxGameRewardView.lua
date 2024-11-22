local var_0_0 = class("DestroyBoxGameRewardView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "UI/VersionUI/JapanRegionUI_2_6/JapanRegionBoxUI/JapanRegionBoxRewardUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiPop.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:BindCfgUI()
	arg_3_0:AddListeners()

	arg_3_0.refreshHandler_ = handler(arg_3_0, arg_3_0.RefreshPanel)
	arg_3_0.uiList_ = LuaList.New(handler(arg_3_0, arg_3_0.IndexItem), arg_3_0.uiListGo_, DestroyBoxGameRewardPanel)
	arg_3_0.controller_ = ControllerUtil.GetController(arg_3_0.transform_, "receiveAll")
end

function var_0_0.OnEnter(arg_4_0)
	arg_4_0.mainActivityID_ = arg_4_0.params_.mainActivityID
	arg_4_0.rewardPanelList_ = DestroyBoxGameTools.GetRewardPanelList(arg_4_0.mainActivityID_)

	arg_4_0:RefreshPanel()
	manager.notify:RegistListener(DESTROY_BOX_GAME_REWARD_REFRESH, arg_4_0.refreshHandler_)
end

function var_0_0.OnExit(arg_5_0)
	manager.notify:RemoveListener(DESTROY_BOX_GAME_REWARD_REFRESH, arg_5_0.refreshHandler_)
end

function var_0_0.Dispose(arg_6_0)
	arg_6_0.refreshHandler_ = nil

	arg_6_0.uiList_:Dispose()

	arg_6_0.uiList_ = nil

	var_0_0.super.Dispose(arg_6_0)
end

function var_0_0.AddListeners(arg_7_0)
	arg_7_0:AddBtnListener(arg_7_0.m_maskBtn, nil, function()
		arg_7_0:Back()
	end)
	arg_7_0:AddBtnListener(arg_7_0.receiveAllBtn_, nil, function()
		DestroyBoxGameAction.RequestReward(arg_7_0.mainActivityID_, arg_7_0.canReceiveRewardList_, function()
			manager.notify:Invoke(DESTROY_BOX_GAME_REWARD_REFRESH)
		end)
	end)
end

function var_0_0.RefreshPanel(arg_11_0)
	arg_11_0:RefreshData()
	arg_11_0:RefreshUI()
end

function var_0_0.RefreshData(arg_12_0)
	arg_12_0.sortPanelList_ = DestroyBoxGameTools.GetSortRewardPanel(arg_12_0.mainActivityID_, arg_12_0.rewardPanelList_)
	arg_12_0.canReceiveRewardList_ = DestroyBoxGameTools.GetCanReceiveRewardList(arg_12_0.mainActivityID_)
end

function var_0_0.RefreshUI(arg_13_0)
	local var_13_0 = 0

	for iter_13_0, iter_13_1 in ipairs(arg_13_0.sortPanelList_) do
		var_13_0 = var_13_0 + #arg_13_0.rewardPanelList_[iter_13_1]
	end

	arg_13_0.m_receiveLab.text = string.format("%s/%s", DestroyBoxGameTools.GetFinishRewardCnt(arg_13_0.mainActivityID_), var_13_0)

	arg_13_0.uiList_:StartScroll(#arg_13_0.sortPanelList_)

	if #arg_13_0.canReceiveRewardList_ > 0 then
		arg_13_0.controller_:SetSelectedState("true")
	else
		arg_13_0.controller_:SetSelectedState("false")
	end
end

function var_0_0.IndexItem(arg_14_0, arg_14_1, arg_14_2)
	local var_14_0 = arg_14_0.sortPanelList_[arg_14_1]

	arg_14_2:SetData(var_14_0, arg_14_0.rewardPanelList_[var_14_0])
end

return var_0_0
