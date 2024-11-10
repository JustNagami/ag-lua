local var_0_0 = class("SequentialBattleRewardPanel", ReduxView)

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_1.transform

	arg_1_0:BindCfgUI()

	arg_1_0.rewardUIList_ = LuaList.New(handler(arg_1_0, arg_1_0.RefreshItem), arg_1_0.listgo_, SequentialBattleRewardItem)
	arg_1_0.refreshRewardHandler_ = handler(arg_1_0, arg_1_0.RefreshReward)

	manager.notify:RegistListener(SEQUENTIAL_BATTLE_REWARD, arg_1_0.refreshRewardHandler_)
end

function var_0_0.Dispose(arg_2_0)
	var_0_0.super.Dispose(arg_2_0)
	manager.notify:RemoveListener(SEQUENTIAL_BATTLE_REWARD, arg_2_0.refreshRewardHandler_)

	arg_2_0.refreshRewardHandler_ = nil

	arg_2_0.rewardUIList_:Dispose()

	arg_2_0.rewardUIList_ = nil
end

function var_0_0.SetData(arg_3_0, arg_3_1)
	arg_3_0.activityID_ = arg_3_1

	local var_3_0 = SequentialBattleChapterCfg[arg_3_0.activityID_]

	arg_3_0.rewardUIList_:StartScroll(#var_3_0.reward_item_list)
end

function var_0_0.RefreshItem(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0 = SequentialBattleData:GetSortRewardList(arg_4_0.activityID_)[arg_4_1]

	arg_4_2:SetData(arg_4_0.activityID_, var_4_0)

	arg_4_0.title_.text = GetI18NText(SequentialBattleChapterCfg[arg_4_0.activityID_].stage_name)
end

function var_0_0.RefreshReward(arg_5_0)
	local var_5_0 = SequentialBattleChapterCfg[arg_5_0.activityID_]

	arg_5_0.rewardUIList_:StartScroll(#var_5_0.reward_item_list)
end

return var_0_0
