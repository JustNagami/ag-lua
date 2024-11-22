local var_0_0 = class("RaceTrialScoreRewardPopView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return RaceTrialTools.GetFirstRewardPopUIName(arg_1_0.params_.mainActivityID)
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiPop.transform
end

function var_0_0.OnCtor(arg_3_0)
	return
end

function var_0_0.Init(arg_4_0)
	arg_4_0:InitUI()
	arg_4_0:AddUIListeners()
end

function var_0_0.InitUI(arg_5_0)
	arg_5_0:BindCfgUI()

	arg_5_0.scrollHelper_ = LuaList.New(handler(arg_5_0, arg_5_0.IndexItem), arg_5_0.listGo_, RaceTrialFirstRewardItem)
end

function var_0_0.IndexItem(arg_6_0, arg_6_1, arg_6_2)
	arg_6_2:RefreshUI(arg_6_0.list_[arg_6_1], arg_6_0.subActivityList_[arg_6_1])
end

function var_0_0.AddUIListeners(arg_7_0)
	arg_7_0:AddBtnListener(arg_7_0.bgBtn_, nil, function()
		arg_7_0:Back()
	end)
end

function var_0_0.OnEnter(arg_9_0)
	arg_9_0:RefreshUI()
end

function var_0_0.RefreshUI(arg_10_0)
	arg_10_0.list_ = RaceTrialData:GetFirstRewardSortList(arg_10_0.params_.mainActivityID)
	arg_10_0.subActivityList_ = ActivityData:GetActivityData(arg_10_0.params_.mainActivityID).subActivityIdList

	arg_10_0.scrollHelper_:StartScroll(#arg_10_0.list_)
end

function var_0_0.OnFirstReceive(arg_11_0)
	arg_11_0:RefreshUI()
end

function var_0_0.OnExit(arg_12_0)
	return
end

function var_0_0.Dispose(arg_13_0)
	arg_13_0:RemoveAllListeners()
	arg_13_0.scrollHelper_:Dispose()
	var_0_0.super.Dispose(arg_13_0)
end

return var_0_0
