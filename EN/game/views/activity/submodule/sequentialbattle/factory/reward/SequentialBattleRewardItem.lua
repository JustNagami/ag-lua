local var_0_0 = class("SequentialBattleRewardItem", ReduxView)

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_1.transform

	arg_1_0:BindCfgUI()
	arg_1_0:AddLisetners()

	arg_1_0.controller_ = ControllerUtil.GetController(arg_1_0.transform_, "statu")
	arg_1_0.rewardItemList_ = {}
end

function var_0_0.Dispose(arg_2_0)
	var_0_0.super.Dispose(arg_2_0)

	for iter_2_0, iter_2_1 in pairs(arg_2_0.rewardItemList_) do
		iter_2_1:Dispose()
	end

	arg_2_0.rewardItemList_ = nil
end

function var_0_0.SetData(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.activityID_ = arg_3_1
	arg_3_0.rewardID_ = arg_3_2

	arg_3_0:RefreshRewardItem()
	arg_3_0:RefreshBtnStatus()
end

function var_0_0.AddLisetners(arg_4_0)
	arg_4_0:AddBtnListener(arg_4_0.btn_, nil, function()
		SequentialBattleAction.ReceiveReward(arg_4_0.activityID_, arg_4_0.rewardID_, function(arg_6_0)
			if isSuccess(arg_6_0.result) then
				local var_6_0 = arg_6_0.reward_list

				getReward2(var_6_0)
				SequentialBattleData:ReceiveReward(arg_4_0.activityID_, arg_4_0.rewardID_)
				manager.notify:Invoke(SEQUENTIAL_BATTLE_REWARD)
			else
				ShowTips(arg_6_0.result)
			end
		end)
	end)
end

function var_0_0.RefreshBtnStatus(arg_7_0)
	local var_7_0 = SequentialBattleChapterCfg[arg_7_0.activityID_].reward_item_list[arg_7_0.rewardID_]
	local var_7_1 = SequentialBattleData:GetRewadList(arg_7_0.activityID_)
	local var_7_2 = table.length(SequentialBattleData:GetFinishStageList(arg_7_0.activityID_))

	if table.keyof(var_7_1, arg_7_0.rewardID_) then
		arg_7_0.controller_:SetSelectedState("finished")
	elseif var_7_2 >= var_7_0[1] then
		arg_7_0.controller_:SetSelectedState("normal")
	else
		arg_7_0.controller_:SetSelectedState("unfinished")
	end
end

function var_0_0.RefreshRewardItem(arg_8_0)
	local var_8_0 = SequentialBattleChapterCfg[arg_8_0.activityID_]
	local var_8_1 = var_8_0.reward_item_list[arg_8_0.rewardID_]

	for iter_8_0, iter_8_1 in ipairs(var_8_1[2]) do
		if arg_8_0.rewardItemList_[iter_8_0] then
			arg_8_0.rewardItemList_[iter_8_0]:SetData(iter_8_1)
		else
			arg_8_0.rewardItemList_[iter_8_0] = RewardPoolFactoryItem.New(arg_8_0.rewardPanel_, iter_8_1, true)
		end
	end

	for iter_8_2 = #var_8_1[2] + 1, #arg_8_0.rewardItemList_ do
		arg_8_0.rewardItemList_[iter_8_2]:Show(false)
	end

	local var_8_2 = var_8_1[1]

	if var_8_2 >= #var_8_0.stage_id then
		arg_8_0.text_.text = GetTips("PASS_ALL")
	else
		local var_8_3 = GetTips("AT_LAST_CNT")

		arg_8_0.text_.text = string.format(var_8_3, var_8_2)
	end
end

return var_0_0
