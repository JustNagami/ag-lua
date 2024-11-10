local var_0_0 = class("SkinDrawInfoView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return ActivitySkinDrawTools.GetDrawInfoUIName(arg_1_0.params_.activityID)
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiPop.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:InitUI()
	arg_3_0:AddUIListeners()
end

function var_0_0.InitUI(arg_4_0)
	arg_4_0:BindCfgUI()

	arg_4_0.mainRewardItems_ = {}
	arg_4_0.baseRewardItems_ = {}
	arg_4_0.rewardItems_ = {}
end

function var_0_0.AddUIListeners(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.bgBtn_, nil, function()
		arg_5_0:Back()
	end)
end

function var_0_0.OnEnter(arg_7_0)
	arg_7_0:RefreshUI()
end

function var_0_0.RefreshUI(arg_8_0)
	arg_8_0.poolID_ = arg_8_0.params_.poolID
	arg_8_0.activityID_ = arg_8_0.params_.poolActivityID

	local var_8_0 = ActivityLimitedDrawPoolCfg.get_id_list_by_pool_id[arg_8_0.poolID_]
	local var_8_1 = {}
	local var_8_2 = {}
	local var_8_3 = {}

	for iter_8_0, iter_8_1 in ipairs(ActivityLimitedDrawPoolListCfg[arg_8_0.poolID_].main_icon_info) do
		table.insert(var_8_3, iter_8_1[1])
	end

	for iter_8_2, iter_8_3 in ipairs(var_8_0) do
		local var_8_4 = ActivityLimitedDrawPoolCfg[iter_8_3].minimum_guarantee

		if var_8_4 == 1 then
			table.insert(var_8_1, iter_8_3)
		elseif var_8_4 == 2 and not table.indexof(var_8_3, iter_8_3) then
			table.insert(var_8_2, iter_8_3)
		end
	end

	arg_8_0:RefreshMainReward(var_8_3)
	arg_8_0:RefreshBaseReward(var_8_2)
	arg_8_0:RefreshOtherReward(var_8_1)

	local var_8_5 = ActivityLimitedDrawPoolListCfg[arg_8_0.poolID_]

	arg_8_0.desc_.text = var_8_5.detail_note

	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_8_0.content1_)
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_8_0.content2_)
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_8_0.content3_)
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_8_0.content4_)
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_8_0.content_)
end

function var_0_0.RefreshMainReward(arg_9_0, arg_9_1)
	for iter_9_0, iter_9_1 in ipairs(arg_9_1) do
		local var_9_0 = ActivityLimitedDrawPoolCfg[iter_9_1]
		local var_9_1 = var_9_0.reward[1][1]
		local var_9_2 = var_9_0.reward[1][2]

		if not arg_9_0.mainRewardItems_[iter_9_0] then
			local var_9_3 = Object.Instantiate(arg_9_0.template_, arg_9_0.content1_)

			arg_9_0.mainRewardItems_[iter_9_0] = SkinDrawInfoItem.New(var_9_3)
		end

		arg_9_0.mainRewardItems_[iter_9_0]:RefreshData(var_9_1, var_9_2)

		local var_9_4 = var_9_0.total
		local var_9_5 = ActivitySkinDrawData:GetDrawInfo(arg_9_0.activityID_, iter_9_1)
		local var_9_6 = var_9_5 and var_9_5.num or var_9_4

		arg_9_0.mainRewardItems_[iter_9_0]:SetBottomText(var_9_6 .. "/" .. var_9_4)
		SetActive(arg_9_0.mainRewardItems_[iter_9_0].gameObject_, true)
	end

	for iter_9_2 = #arg_9_1 + 1, #arg_9_0.mainRewardItems_ do
		SetActive(arg_9_0.mainRewardItems_[iter_9_2].gameObject_, false)
	end
end

function var_0_0.RefreshBaseReward(arg_10_0, arg_10_1)
	for iter_10_0, iter_10_1 in ipairs(arg_10_1) do
		local var_10_0 = ActivityLimitedDrawPoolCfg[iter_10_1]
		local var_10_1 = var_10_0.reward[1][1]
		local var_10_2 = var_10_0.reward[1][2]

		if not arg_10_0.baseRewardItems_[iter_10_0] then
			local var_10_3 = Object.Instantiate(arg_10_0.template_, arg_10_0.content2_)

			arg_10_0.baseRewardItems_[iter_10_0] = SkinDrawInfoItem.New(var_10_3)
		end

		arg_10_0.baseRewardItems_[iter_10_0]:RefreshData(var_10_1, var_10_2)

		local var_10_4 = var_10_0.total
		local var_10_5 = ActivitySkinDrawData:GetDrawInfo(arg_10_0.activityID_, iter_10_1)
		local var_10_6 = var_10_5 and var_10_5.num or var_10_4

		arg_10_0.baseRewardItems_[iter_10_0]:SetBottomText(var_10_6 .. "/" .. var_10_4)
		SetActive(arg_10_0.baseRewardItems_[iter_10_0].gameObject_, true)
	end

	for iter_10_2 = #arg_10_1 + 1, #arg_10_0.baseRewardItems_ do
		SetActive(arg_10_0.baseRewardItems_[iter_10_2].gameObject_, false)
	end
end

function var_0_0.RefreshOtherReward(arg_11_0, arg_11_1)
	for iter_11_0, iter_11_1 in ipairs(arg_11_1) do
		local var_11_0 = ActivityLimitedDrawPoolCfg[iter_11_1]
		local var_11_1 = var_11_0.reward[1][1]
		local var_11_2 = var_11_0.reward[1][2]

		if not arg_11_0.rewardItems_[iter_11_0] then
			local var_11_3 = Object.Instantiate(arg_11_0.template_, arg_11_0.content3_)

			arg_11_0.rewardItems_[iter_11_0] = SkinDrawInfoItem.New(var_11_3)
		end

		arg_11_0.rewardItems_[iter_11_0]:RefreshData(var_11_1, var_11_2)

		local var_11_4 = var_11_0.total
		local var_11_5 = ActivitySkinDrawData:GetDrawInfo(arg_11_0.activityID_, iter_11_1)
		local var_11_6 = var_11_5 and var_11_5.num or var_11_4

		arg_11_0.rewardItems_[iter_11_0]:SetBottomText(var_11_6 .. "/" .. var_11_4)
		SetActive(arg_11_0.rewardItems_[iter_11_0].gameObject_, true)
	end

	for iter_11_2 = #arg_11_1 + 1, #arg_11_0.rewardItems_ do
		SetActive(arg_11_0.rewardItems_[iter_11_2].gameObject_, false)
	end
end

function var_0_0.OnExit(arg_12_0)
	for iter_12_0 = 1, #arg_12_0.mainRewardItems_ do
		arg_12_0.mainRewardItems_[iter_12_0]:OnExit()
	end

	for iter_12_1 = 1, #arg_12_0.baseRewardItems_ do
		arg_12_0.baseRewardItems_[iter_12_1]:OnExit()
	end

	for iter_12_2 = 1, #arg_12_0.rewardItems_ do
		arg_12_0.rewardItems_[iter_12_2]:OnExit()
	end
end

function var_0_0.Dispose(arg_13_0)
	arg_13_0:RemoveAllListeners()

	for iter_13_0 = 1, #arg_13_0.mainRewardItems_ do
		arg_13_0.mainRewardItems_[iter_13_0]:Dispose()
	end

	for iter_13_1 = 1, #arg_13_0.baseRewardItems_ do
		arg_13_0.baseRewardItems_[iter_13_1]:Dispose()
	end

	for iter_13_2 = 1, #arg_13_0.rewardItems_ do
		arg_13_0.rewardItems_[iter_13_2]:Dispose()
	end

	arg_13_0.super.Dispose(arg_13_0)
end

return var_0_0
