local var_0_0 = class("AdvanceTestRewardItemView", ReduxView)

function var_0_0.OnCtor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_0.gameObject_.transform
	arg_1_0.index = arg_1_2

	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	arg_2_0:InitUI()
end

function var_0_0.InitUI(arg_3_0)
	arg_3_0:BindCfgUI()

	arg_3_0.itemList_ = LuaList.New(handler(arg_3_0, arg_3_0.IndexItem), arg_3_0.rewardListGo_, CommonItem)
end

function var_0_0.OnTop(arg_4_0)
	return
end

function var_0_0.SetData(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0.startRank = arg_5_1
	arg_5_0.endRank = ActivityPointRewardCfg[arg_5_2].need
	arg_5_0.rewardCfg = ActivityPointRewardCfg[arg_5_2].reward_item_list

	arg_5_0:RefreshUI()
end

function var_0_0.IndexItem(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = arg_6_0.rewardCfg[arg_6_1]

	arg_6_2:RefreshData(formatReward(var_6_0))
	arg_6_2:RegistCallBack(function()
		ShowPopItem(POP_ITEM, var_6_0)
	end)
end

function var_0_0.RefreshUI(arg_8_0)
	arg_8_0.descText_.text = string.format("排名:%s", arg_8_0.startRank .. "-" .. arg_8_0.endRank)

	arg_8_0.itemList_:StartScroll(#arg_8_0.rewardCfg)
end

function var_0_0.OnExit(arg_9_0)
	return
end

function var_0_0.Dispose(arg_10_0)
	if arg_10_0.itemList_ then
		arg_10_0.itemList_:Dispose()

		arg_10_0.itemList_ = nil
	end

	var_0_0.super.Dispose(arg_10_0)
end

return var_0_0
