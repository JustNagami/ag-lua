local var_0_0 = class("ActivityNoobBpRechargeView", ReduxView)

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = Asset.Load(arg_1_0:GetUIName(arg_1_2))

	arg_1_0.gameObject_ = Object.Instantiate(var_1_0, arg_1_1.transform)
	arg_1_0.transform_ = arg_1_0.gameObject_.transform
	arg_1_0.type_ = arg_1_2

	arg_1_0:BindCfgUI()
	arg_1_0:AddListeners()

	arg_1_0.statusController_ = ControllerUtil.GetController(arg_1_0.transform_, "status")
	arg_1_0.typeController_ = ControllerUtil.GetController(arg_1_0.transform_, "type")
end

function var_0_0.GetUIName(arg_2_0, arg_2_1)
	if arg_2_1 == 0 then
		return "Widget/System/Activitynewbie/NewbieBpRechargeUI"
	else
		return "Widget/System/Activitynewbie/NewbieBpRechargeUI_old"
	end
end

function var_0_0.Dispose(arg_3_0)
	var_0_0.super.Dispose(arg_3_0)
	Object.Destroy(arg_3_0.gameObject_)

	arg_3_0.gameObject_ = nil
	arg_3_0.transform_ = nil

	arg_3_0.commonItem_:Dispose()

	arg_3_0.commonItem_ = nil
end

function var_0_0.AddListeners(arg_4_0)
	arg_4_0:AddBtnListener(arg_4_0.sourceBtn_, nil, function()
		if TimeMgr.GetInstance():GetServerTime() < PassportData:GetStartTimestamp() then
			ShowTips("SYSTEM_LOCK")

			return
		end

		if TimeMgr.GetInstance():GetServerTime() >= PassportData:GetEndTimestamp() then
			ShowTips("NO_ACTIVE_BATTLEPASS")

			return
		end

		local var_5_0 = GameSetting.first_battle_pass_reward.value[2]

		JumpTools.JumpToPage2(var_5_0)
	end)
	arg_4_0:AddBtnListener(arg_4_0.receiveBtn_, nil, function()
		ActivityNewbieTools.ReceiveRechargeReward(3, 0, function(arg_7_0)
			arg_4_0:RefreshStatus()
		end)
	end)
end

function var_0_0.SetData(arg_8_0)
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

	if arg_8_0.typeController_ then
		arg_8_0.typeController_:SetSelectedIndex(arg_8_0.type_)
	end

	ActivityNewbieTools.SetSelectBpRecharge()
end

function var_0_0.RefreshStatus(arg_10_0)
	arg_10_0.status_ = ActivityNewbieTools.GetBpRewardStatus()

	arg_10_0.statusController_:SetSelectedIndex(arg_10_0.status_)
end

function var_0_0.SetActive(arg_11_0, arg_11_1)
	SetActive(arg_11_0.gameObject_, arg_11_1)
end

return var_0_0
