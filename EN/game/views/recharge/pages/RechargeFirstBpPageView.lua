local var_0_0 = import("game.views.recharge.pages.RechargePageBase")
local var_0_1 = class("ActivityNoobBpRechargeView", var_0_0)

function var_0_1.Ctor(arg_1_0, arg_1_1)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_0.gameObject_.transform

	arg_1_0:BindCfgUI()
	arg_1_0:AddListeners()

	arg_1_0.statusController_ = ControllerUtil.GetController(arg_1_0.transform_, "status")
	arg_1_0.typeController_ = ControllerUtil.GetController(arg_1_0.transform_, "type")
end

function var_0_1.Dispose(arg_2_0)
	var_0_1.super.Dispose(arg_2_0)
	Object.Destroy(arg_2_0.gameObject_)

	arg_2_0.gameObject_ = nil
	arg_2_0.transform_ = nil

	arg_2_0.commonItem_:Dispose()

	arg_2_0.commonItem_ = nil
end

function var_0_1.AddListeners(arg_3_0)
	arg_3_0:AddBtnListener(arg_3_0.sourceBtn_, nil, function()
		if TimeMgr.GetInstance():GetServerTime() < PassportData:GetStartTimestamp() then
			ShowTips("SYSTEM_LOCK")

			return
		end

		if TimeMgr.GetInstance():GetServerTime() >= PassportData:GetEndTimestamp() then
			ShowTips("NO_ACTIVE_BATTLEPASS")

			return
		end

		local var_4_0 = GameSetting.first_battle_pass_reward.value[2]

		JumpTools.JumpToPage2(var_4_0)
	end)
	arg_3_0:AddBtnListener(arg_3_0.receiveBtn_, nil, function()
		ActivityNewbieTools.ReceiveRechargeReward(3, 0, function(arg_6_0)
			arg_3_0:RefreshStatus()
		end)
	end)
end

function var_0_1.OnEnter(arg_7_0)
	arg_7_0:RefreshUI()
end

function var_0_1.RefreshUI(arg_8_0)
	arg_8_0.rewardCfg_ = GameSetting.first_battle_pass_reward.value[1]

	if not arg_8_0.commonItem_ then
		local var_8_0 = clone(ItemTemplateData)

		var_8_0.id = arg_8_0.rewardCfg_[1]
		var_8_0.number = arg_8_0.rewardCfg_[2]

		function var_8_0.clickFun(arg_9_0)
			ShowPopItem(POP_ITEM, arg_8_0.rewardCfg_)
		end

		arg_8_0.commonItem_ = CommonItemView.New(arg_8_0.commonGo_)

		arg_8_0.commonItem_:SetData(var_8_0)
	end

	arg_8_0:RefreshStatus()
	arg_8_0.typeController_:SetSelectedIndex(1)
	ActivityNewbieTools.SetSelectBpRecharge()
end

function var_0_1.Show(arg_10_0)
	SetActive(arg_10_0.gameObject_, true)
	arg_10_0:RefreshUI()
end

function var_0_1.RefreshStatus(arg_11_0)
	arg_11_0.status_ = ActivityNewbieTools.GetBpRewardStatus()

	arg_11_0.statusController_:SetSelectedIndex(arg_11_0.status_)
end

return var_0_1
