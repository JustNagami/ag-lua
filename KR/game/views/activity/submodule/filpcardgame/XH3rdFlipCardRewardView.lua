local var_0_0 = class("XH3rdFlipCardRewardView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return XH3rdFlipCardTool:GetRewardUI()
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

	arg_4_0.scrollHelper_ = LuaList.New(handler(arg_4_0, arg_4_0.IndexItem), arg_4_0.uiListGo_, XH3rdFlipCardRewardItem)
end

function var_0_0.AddUIListener(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.bgBtn_, nil, function()
		arg_5_0:Back()
	end)
end

function var_0_0.OnEnter(arg_7_0)
	arg_7_0.activityId = arg_7_0.params_.activityId

	arg_7_0:RefreshUI()
end

function var_0_0.RefreshUI(arg_8_0)
	arg_8_0:RefreshScroll()
end

function var_0_0.RefreshScroll(arg_9_0)
	local var_9_0 = TaskData2:GetActivityTaskSortList(arg_9_0.activityId)

	arg_9_0.rewardList = {}

	for iter_9_0, iter_9_1 in pairs(var_9_0) do
		table.insert(arg_9_0.rewardList, iter_9_1.id)
	end

	table.sort(arg_9_0.rewardList, function(arg_10_0, arg_10_1)
		local var_10_0 = TaskData2:GetTask(arg_10_0)
		local var_10_1 = TaskData2:GetTask(arg_10_1)
		local var_10_2 = var_10_0.progress >= AssignmentCfg[arg_10_0].need
		local var_10_3 = var_10_1.progress >= AssignmentCfg[arg_10_1].need

		if var_10_0.complete_flag ~= var_10_1.complete_flag then
			return var_10_0.complete_flag < var_10_1.complete_flag
		elseif var_10_2 ~= var_10_3 then
			return var_10_2 and not var_10_3
		else
			return arg_10_0 < arg_10_1
		end
	end)
	arg_9_0.scrollHelper_:StartScroll(#arg_9_0.rewardList)
end

function var_0_0.IndexItem(arg_11_0, arg_11_1, arg_11_2)
	arg_11_2:SetData(arg_11_0.rewardList[arg_11_1])
	arg_11_2:SetReveivedHandler(handler(arg_11_0, arg_11_0.RefreshScroll))
end

function var_0_0.Dispose(arg_12_0)
	if arg_12_0.scrollHelper_ then
		arg_12_0.scrollHelper_:Dispose()

		arg_12_0.scrollHelper_ = nil
	end

	var_0_0.super.Dispose(arg_12_0)
end

return var_0_0
