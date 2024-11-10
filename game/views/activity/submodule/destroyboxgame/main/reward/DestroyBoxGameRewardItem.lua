local var_0_0 = class("DestroyBoxGameRewardItem", ReduxView)

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_1.transform

	arg_1_0:BindCfgUI()
	arg_1_0:AddListeners()

	arg_1_0.list_ = LuaList.New(handler(arg_1_0, arg_1_0.IndexItem), arg_1_0.m_list, CommonItem)
	arg_1_0.buttonController = ControllerUtil.GetController(arg_1_0.m_btnController, "stateBtn")
end

function var_0_0.SetData(arg_2_0, arg_2_1)
	arg_2_0.rewardID_ = arg_2_1

	local var_2_0 = DestroyBoxGameRewardCfg[arg_2_1]

	arg_2_0.m_pointLab.text = string.format(var_2_0.desc, var_2_0.complete_num)
	arg_2_0.rewardList_ = var_2_0 and var_2_0.item_list or {}

	arg_2_0.list_:StartScroll(#arg_2_0.rewardList_)

	if table.keyof(DestroyBoxGameData:GetReceiveRewardList(var_2_0.main_activity_id), arg_2_1) then
		arg_2_0.buttonController:SetSelectedIndex(2)
	elseif DestroyBoxGameTools.IsUnlockReward(arg_2_1) then
		arg_2_0.buttonController:SetSelectedIndex(0)
	else
		arg_2_0.buttonController:SetSelectedIndex(1)
	end
end

function var_0_0.Dispose(arg_3_0)
	arg_3_0.list_:Dispose()

	arg_3_0.list_ = nil

	var_0_0.super.Dispose(arg_3_0)
end

function var_0_0.AddListeners(arg_4_0)
	arg_4_0:AddBtnListener(arg_4_0.m_receiveBtn, nil, function()
		local var_5_0 = DestroyBoxGameRewardCfg[arg_4_0.rewardID_]

		DestroyBoxGameAction.RequestReward(var_5_0.main_activity_id, {
			arg_4_0.rewardID_
		}, function()
			manager.notify:Invoke(DESTROY_BOX_GAME_REWARD_REFRESH)
		end)
	end)
end

function var_0_0.IndexItem(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = arg_7_0.rewardList_[arg_7_1]

	arg_7_2:RefreshData(formatReward(var_7_0))
	arg_7_2:RegistCallBack(function()
		ShowPopItem(POP_ITEM, var_7_0)
	end)
end

return var_0_0
