local var_0_0 = class("SequentialBattleRewardView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "UI/MardukUI/continuousBattle/MardukContinuousRewardUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiPop.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:BindCfgUI()
	arg_3_0:AddListeners()

	arg_3_0.refreshRewardHandler_ = handler(arg_3_0, arg_3_0.RefreshReward)
	arg_3_0.rewardUIList_ = LuaList.New(handler(arg_3_0, arg_3_0.RefreshItem), arg_3_0.listgo_, SequentialBattleRewardPanel)
end

function var_0_0.OnEnter(arg_4_0)
	arg_4_0.activityID_ = arg_4_0.params_.activityID

	arg_4_0.rewardUIList_:StartScroll(1)
	manager.notify:RegistListener(SEQUENTIAL_BATTLE_REWARD, arg_4_0.refreshRewardHandler_)
	arg_4_0:RefreshCnt()

	arg_4_0.alltext_.text = string.format("/%s", #SequentialBattleChapterCfg[arg_4_0.activityID_].reward_item_list)
end

function var_0_0.OnExit(arg_5_0)
	manager.notify:RemoveListener(SEQUENTIAL_BATTLE_REWARD, arg_5_0.refreshRewardHandler_)
end

function var_0_0.Dispose(arg_6_0)
	var_0_0.super.Dispose(arg_6_0)

	arg_6_0.refreshRewardHandler_ = nil

	arg_6_0.rewardUIList_:Dispose()

	arg_6_0.rewardUIList_ = nil
end

function var_0_0.AddListeners(arg_7_0)
	arg_7_0:AddBtnListener(arg_7_0.closeBtn_, nil, function()
		arg_7_0:Back()
	end)
end

function var_0_0.RefreshItem(arg_9_0, arg_9_1, arg_9_2)
	arg_9_2:SetData(arg_9_0.activityID_)
end

function var_0_0.RefreshCnt(arg_10_0)
	local var_10_0 = SequentialBattleData:GetRewadList(arg_10_0.activityID_)

	arg_10_0.gettext_.text = table.length(var_10_0)
end

function var_0_0.RefreshReward(arg_11_0)
	arg_11_0:RefreshCnt()
end

return var_0_0
