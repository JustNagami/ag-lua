local var_0_0 = class("PuzzleNewRewardView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return PuzzleNewTools.GetRewardViewUIName(arg_1_0.params_.activityID)
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
end

function var_0_0.AddUIListener(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.backMask_, nil, function()
		arg_5_0:Back()
	end)
end

function var_0_0.OnEnter(arg_7_0)
	if arg_7_0.activityID_ ~= arg_7_0.params_.activityID then
		arg_7_0:DispawnRegion()
		arg_7_0:SpawnRegion(arg_7_0.params_.activityID)
	end

	arg_7_0.activityID_ = arg_7_0.params_.activityID

	arg_7_0:RefreshUI()
end

function var_0_0.Dispose(arg_8_0)
	arg_8_0:DispawnRegion()
	var_0_0.super.Dispose(arg_8_0)
end

function var_0_0.RefreshUI(arg_9_0)
	local var_9_0 = PuzzleNewCfg[arg_9_0.activityID_]

	for iter_9_0, iter_9_1 in pairs(arg_9_0.regionList_) do
		iter_9_1:SetData(arg_9_0.activityID_)
	end

	local var_9_1 = PuzzleNewData:GetCurPuzzleList(arg_9_0.activityID_)

	for iter_9_2, iter_9_3 in ipairs(arg_9_0.maskList_) do
		SetActive(iter_9_3, var_9_1[iter_9_2] == nil or var_9_1[iter_9_2] ~= var_9_0.correct_array[iter_9_2])
	end
end

function var_0_0.SpawnRegion(arg_10_0, arg_10_1)
	local var_10_0 = PuzzleNewCfg[arg_10_1]
	local var_10_1 = PuzzleNewTools.GetPuzzlePosDic(arg_10_1)
	local var_10_2 = PuzzleNewTools.GetRegionPosDic(arg_10_1)
	local var_10_3 = var_10_0.area_fragment_list
	local var_10_4 = var_10_0.reward_area_list

	arg_10_0.regionList_ = arg_10_0.regionList_ or {}

	local var_10_5 = arg_10_0.regionContentTrans_.childCount

	for iter_10_0 = 1, var_10_5 do
		local var_10_6 = arg_10_0.regionContentTrans_:GetChild(iter_10_0 - 1)
		local var_10_7 = tonumber(var_10_6.name)
		local var_10_8 = var_10_2[var_10_7]
		local var_10_9 = var_10_3[var_10_8]
		local var_10_10 = var_10_9[2]
		local var_10_11 = var_10_4[var_10_8][2]

		if not arg_10_0.regionList_[var_10_7] then
			arg_10_0.regionList_[var_10_7] = PuzzleNewRegionItem.New(var_10_6, var_10_9, var_10_1, var_10_11)
		end
	end

	arg_10_0.maskList_ = arg_10_0.maskList_ or {}

	local var_10_12 = arg_10_0.maskPanelTrans_.childCount

	for iter_10_1 = 1, var_10_12 do
		local var_10_13 = arg_10_0.maskPanelTrans_:GetChild(iter_10_1 - 1)

		arg_10_0.maskList_[iter_10_1] = var_10_13
	end
end

function var_0_0.DispawnRegion(arg_11_0)
	if arg_11_0.regionList_ then
		for iter_11_0, iter_11_1 in pairs(arg_11_0.regionList_) do
			iter_11_1:Dispose()
		end

		arg_11_0.regionList_ = nil
	end

	arg_11_0.maskList_ = nil
end

return var_0_0
