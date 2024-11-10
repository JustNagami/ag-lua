local var_0_0 = class("RaceTrialScoreRewardPopView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return RaceTrialTools.GetScoreRewardUIName(arg_1_0.params_.mainActivityID)
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

	arg_5_0.scrollHelper_ = LuaList.New(handler(arg_5_0, arg_5_0.IndexItem), arg_5_0.listGo_, arg_5_0:GetRewardItemClass())
end

function var_0_0.GetRewardItemClass(arg_6_0)
	return RaceTrialScoreRewardItem
end

function var_0_0.IndexItem(arg_7_0, arg_7_1, arg_7_2)
	arg_7_2:RefreshUI(arg_7_0.list_[arg_7_1], arg_7_0.scoreNum_, arg_7_0.params_.mainActivityID)
end

function var_0_0.AddUIListeners(arg_8_0)
	arg_8_0:AddBtnListener(arg_8_0.bgBtn_, nil, function()
		arg_8_0:Back()
	end)
end

function var_0_0.OnEnter(arg_10_0)
	arg_10_0:RefreshUI()
end

function var_0_0.RefreshUI(arg_11_0)
	arg_11_0.list_ = RaceTrialData:GetScoreRewardSortList(arg_11_0.params_.mainActivityID)
	arg_11_0.scoreNum_ = RaceTrialData:GetTotalScore(arg_11_0.params_.mainActivityID)
	arg_11_0.score_.text = arg_11_0.scoreNum_

	arg_11_0.scrollHelper_:StartScroll(#arg_11_0.list_)
end

function var_0_0.OnPointReceive(arg_12_0)
	arg_12_0:RefreshUI()
end

function var_0_0.OnExit(arg_13_0)
	return
end

function var_0_0.Dispose(arg_14_0)
	arg_14_0:RemoveAllListeners()
	arg_14_0.scrollHelper_:Dispose()
	var_0_0.super.Dispose(arg_14_0)
end

return var_0_0
