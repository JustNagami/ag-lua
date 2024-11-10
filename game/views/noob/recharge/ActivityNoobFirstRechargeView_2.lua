local var_0_0 = class("ActivityNoobFirstRechargeView_2", ReduxView)

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = Asset.Load(arg_1_0:GetUIName(arg_1_2))

	arg_1_0.gameObject_ = Object.Instantiate(var_1_0, arg_1_1.transform)
	arg_1_0.transform_ = arg_1_0.gameObject_.transform
	arg_1_0.type_ = arg_1_2

	arg_1_0:BindCfgUI()
	arg_1_0:AddListeners()

	arg_1_0.statusController_ = ControllerUtil.GetController(arg_1_0.transform_, "status")
	arg_1_0.typeController_ = ControllerUtil.GetController(arg_1_0.transform_, "type")
	arg_1_0.rechargeUpdateHandler_ = handler(arg_1_0, arg_1_0.SetData)

	manager.notify:RegistListener(NEWBIE_RECHARGE_UPDATE, arg_1_0.rechargeUpdateHandler_)

	arg_1_0.signItemList_ = {}
end

function var_0_0.GetUIName(arg_2_0, arg_2_1)
	if arg_2_1 == 0 then
		return "Widget/System/Activitynewbie/NewbieRecharge2UI_new"
	else
		return "Widget/System/Activitynewbie/NewbieRecharge2UI_old"
	end
end

function var_0_0.Dispose(arg_3_0)
	var_0_0.super.Dispose(arg_3_0)
	manager.notify:RemoveListener(NEWBIE_RECHARGE_UPDATE, arg_3_0.rechargeUpdateHandler_)

	arg_3_0.rechargeUpdateHandler_ = nil

	for iter_3_0, iter_3_1 in ipairs(arg_3_0.signItemList_) do
		iter_3_1:Dispose()
	end

	arg_3_0.signItemList_ = nil

	Object.Destroy(arg_3_0.gameObject_)

	arg_3_0.gameObject_ = nil
	arg_3_0.transform_ = nil
end

function var_0_0.AddListeners(arg_4_0)
	arg_4_0:AddBtnListener(arg_4_0.sourceBtn_, nil, function()
		local var_5_0 = GameSetting.newbie_first_charge_reward_18.value[2]

		JumpTools.JumpToPage2(var_5_0)
	end)
	arg_4_0:AddBtnListener(arg_4_0.receiveBtn_, nil, function()
		ActivityNewbieTools.ReceiveRechargeReward(1, 1, function(arg_7_0)
			arg_4_0:SetData()
		end)
	end)

	if arg_4_0.heroBtn_ then
		arg_4_0:AddBtnListener(arg_4_0.heroBtn_, nil, function()
			local var_8_0 = GameSetting.newbie_first_charge_reward_6.value[3][1]

			JumpTools.OpenPageByJump("/heroPreviewMain", {
				isEnter = true,
				hid = var_8_0
			})
		end)
	end
end

function var_0_0.SetData(arg_9_0)
	arg_9_0.rewardCfg_ = GameSetting.newbie_first_charge_reward_18.value[3]

	for iter_9_0, iter_9_1 in ipairs(arg_9_0.rewardCfg_) do
		if not arg_9_0.signItemList_[iter_9_0] then
			arg_9_0.signItemList_[iter_9_0] = NoobRechargeSignItem.New(arg_9_0.signItemGo_, arg_9_0.contentTrans_)
		end

		arg_9_0.signItemList_[iter_9_0]:SetData(iter_9_0, iter_9_1)
	end

	local var_9_0 = #arg_9_0.rewardCfg_
	local var_9_1 = ActivityNewbieTools.GetFirstRechargeStatus()
	local var_9_2 = var_9_1.signTimes
	local var_9_3 = var_9_1.lastSignTimestamp

	if not var_9_1.secondGearStatus then
		arg_9_0.statusController_:SetSelectedState("recharge")
	elseif var_9_2 < var_9_0 and var_9_3 < manager.time:GetTodayFreshTime() then
		arg_9_0.statusController_:SetSelectedState("complete")
	else
		arg_9_0.statusController_:SetSelectedState("received")
	end

	if arg_9_0.typeController_ then
		arg_9_0.typeController_:SetSelectedIndex(arg_9_0.type_)
	end

	ActivityNewbieTools.SetSelectFirstRecharge(2)
end

function var_0_0.SetActive(arg_10_0, arg_10_1)
	SetActive(arg_10_0.gameObject_, arg_10_1)
end

return var_0_0
