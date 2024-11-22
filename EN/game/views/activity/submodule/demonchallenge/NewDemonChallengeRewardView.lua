local var_0_0 = class("NewDemonChallengeRewardView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return DemonChallengeTools.GetAwardUIName(arg_1_0.params_.activityID)
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiPop.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:InitUI()
	arg_3_0:AddUIListener()
end

function var_0_0.InitUI(arg_4_0)
	arg_4_0:BindCfgUI()

	arg_4_0.scrollHelper_ = LuaList.New(handler(arg_4_0, arg_4_0.IndexItem), arg_4_0.scrollView_, NewDemonChallengeRewardItem)
end

function var_0_0.AddUIListener(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.backMask_, nil, function()
		arg_5_0:Back()
	end)
end

function var_0_0.OnEnter(arg_7_0)
	arg_7_0.activityId_ = arg_7_0.params_.activityID

	arg_7_0:RefreshUI()
end

function var_0_0.RefreshUI(arg_8_0)
	arg_8_0:RefreshLevelName()
	arg_8_0:RefreshScroll()
end

function var_0_0.RefreshLevelName(arg_9_0)
	return
end

function var_0_0.RefreshScroll(arg_10_0)
	arg_10_0.sortedRewardList_ = arg_10_0:GetAwardData()
	arg_10_0.completedDifficultyCountList_ = NewDemonChallengeData:GetCompletedDifficultyCountList(arg_10_0.activityId_)

	arg_10_0.scrollHelper_:StartScroll(#arg_10_0.sortedRewardList_)
end

function var_0_0.IndexItem(arg_11_0, arg_11_1, arg_11_2)
	local var_11_0 = NewDemonChallengeRewardCfg[arg_11_0.sortedRewardList_[arg_11_1]]

	arg_11_2:RefreshData({
		activityId = arg_11_0.activityId_,
		taskId = var_11_0.id,
		completeCount = arg_11_0.completedDifficultyCountList_[var_11_0.difficulty_id]
	})
end

function var_0_0.OnDemonChallengeReceiveReward(arg_12_0, arg_12_1, arg_12_2)
	local var_12_0 = arg_12_0.scrollHelper_:GetItemList()

	for iter_12_0, iter_12_1 in pairs(var_12_0) do
		local var_12_1 = iter_12_1:GetItemInfo()

		if var_12_1.taskId == arg_12_2.id then
			iter_12_1:RefreshData(var_12_1)
		end
	end
end

function var_0_0.OnExit(arg_13_0)
	return
end

function var_0_0.GetAwardData(arg_14_0)
	local var_14_0 = NewDemonChallengeRewardCfg.get_id_list_by_activity_id[arg_14_0.activityId_]
	local var_14_1 = deepClone(var_14_0)

	table.sort(var_14_1, function(arg_15_0, arg_15_1)
		return NewDemonChallengeRewardCfg[arg_15_0].difficulty_id < NewDemonChallengeRewardCfg[arg_15_1].difficulty_id
	end)

	return var_14_1
end

function var_0_0.Dispose(arg_16_0)
	var_0_0.super.Dispose(arg_16_0)
	arg_16_0.scrollHelper_:Dispose()
end

return var_0_0
