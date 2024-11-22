local var_0_0 = class("NewDemonChallengeRewardItem", ReduxView)
local var_0_1 = import("game.tools.JumpTools")

function var_0_0.OnCtor(arg_1_0, arg_1_1)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_0.gameObject_.transform

	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	arg_2_0:InitUI()
	arg_2_0:AddListeners()

	arg_2_0.itemList_ = LuaList.New(handler(arg_2_0, arg_2_0.IndexItem), arg_2_0.itemListGo_, CommonItem)
	arg_2_0.controller_ = ControllerUtil.GetController(arg_2_0.transform_, "conName")
end

function var_0_0.RefreshData(arg_3_0, arg_3_1)
	arg_3_0.itemInfo_ = arg_3_1

	arg_3_0:RefreshUI()
end

function var_0_0.InitUI(arg_4_0)
	arg_4_0:BindCfgUI()
end

function var_0_0.AddListeners(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.receiveBtn_, nil, function()
		NewDemonChallengeAction.GetChallengeReward(arg_5_0.itemInfo_.taskId, arg_5_0.itemInfo_.activityId)
	end)
end

function var_0_0.RefreshUI(arg_7_0)
	local var_7_0 = NewDemonChallengeRewardCfg[arg_7_0.itemInfo_.taskId].difficulty_id
	local var_7_1 = NewDemonChallengeRewardCfg[arg_7_0.itemInfo_.taskId].complete_num
	local var_7_2 = ""

	if var_7_0 == 1 then
		var_7_2 = GetTips("DEMON_CLEAR_NORMAL_DIFFICULTY")
	elseif var_7_0 == 2 then
		var_7_2 = GetTips("DEMON_CLEAR_DIFFICULTY")
	else
		var_7_2 = GetTips("DEMON_CLEAR_EXTREME_DIFFICULTY")
	end

	arg_7_0.Desctext_.text = string.format(var_7_2, tostring(var_7_1))

	arg_7_0:RefreshState()
	arg_7_0:RefreshItem()
end

function var_0_0.RefreshState(arg_8_0)
	local var_8_0 = arg_8_0.itemInfo_.completeCount or 0
	local var_8_1 = NewDemonChallengeData:GetRewardStateList(arg_8_0.itemInfo_.activityId)[arg_8_0.itemInfo_.taskId] or 0
	local var_8_2 = NewDemonChallengeRewardCfg[arg_8_0.itemInfo_.taskId].complete_num
	local var_8_3 = 0

	if var_8_0 < var_8_2 then
		var_8_3 = 0
	elseif var_8_2 <= var_8_0 and var_8_1 == ActivityConst.DEMON_CHALLENGE_REWARD_STATE.UNRECEIVE then
		var_8_3 = 1
	elseif var_8_1 == ActivityConst.DEMON_CHALLENGE_REWARD_STATE.RECEIVED then
		var_8_3 = 2
	end

	arg_8_0.controller_:SetSelectedState(tostring(var_8_3))
end

function var_0_0.RefreshItem(arg_9_0)
	arg_9_0.rewardCfg_ = NewDemonChallengeRewardCfg[arg_9_0.itemInfo_.taskId].item_list

	arg_9_0.itemList_:StartScroll(#arg_9_0.rewardCfg_)
end

function var_0_0.IndexItem(arg_10_0, arg_10_1, arg_10_2)
	local var_10_0 = arg_10_0.rewardCfg_[arg_10_1]

	arg_10_2:RefreshData(formatReward(var_10_0))
	arg_10_2:RegistCallBack(function()
		ShowPopItem(POP_ITEM, var_10_0)
	end)
	arg_10_2:Show(true)
end

function var_0_0.GetItemInfo(arg_12_0)
	return arg_12_0.itemInfo_
end

function var_0_0.Dispose(arg_13_0)
	if arg_13_0.itemList_ then
		arg_13_0.itemList_:Dispose()
	end

	var_0_0.super.Dispose(arg_13_0)
end

return var_0_0
