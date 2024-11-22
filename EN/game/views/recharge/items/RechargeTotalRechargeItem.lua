local var_0_0 = class("RechargeVoucherItem", ReduxView)

function var_0_0.OnCtor(arg_1_0, arg_1_1)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_1.transform

	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	arg_2_0:InitUI()
	arg_2_0:AddUIListener()
end

function var_0_0.InitUI(arg_3_0)
	arg_3_0:BindCfgUI()

	arg_3_0.statusController_ = ControllerUtil.GetController(arg_3_0.gameObject_.transform, "status")
	arg_3_0.commonItem1_ = CommonItemView.New(arg_3_0.itemGo1_)
	arg_3_0.commonItem2_ = CommonItemView.New(arg_3_0.itemGo2_)
	arg_3_0.commonItem3_ = CommonItemView.New(arg_3_0.itemGo3_)
	arg_3_0.CommonData1 = clone(ItemTemplateData)
	arg_3_0.CommonData2 = clone(ItemTemplateData)
	arg_3_0.CommonData3 = clone(ItemTemplateData)
	arg_3_0.commonItems_ = {
		arg_3_0.commonItem1_,
		arg_3_0.commonItem2_,
		arg_3_0.commonItem3_
	}
	arg_3_0.commonItemData = {
		arg_3_0.CommonData1,
		arg_3_0.CommonData2,
		arg_3_0.CommonData3
	}
end

function var_0_0.AddUIListener(arg_4_0)
	arg_4_0:AddBtnListener(arg_4_0.getBtn_, nil, function()
		PayAction.GetTotalRechargeBonus(arg_4_0.cfg_.id)
	end)

	for iter_4_0, iter_4_1 in ipairs(arg_4_0.commonItemData) do
		function iter_4_1.clickFun(arg_6_0)
			ShowPopItem(POP_ITEM, {
				arg_6_0.id,
				arg_6_0.number
			})
		end
	end
end

function var_0_0.OnEnter(arg_7_0)
	return
end

function var_0_0.OnExit(arg_8_0)
	return
end

function var_0_0.SetData(arg_9_0, arg_9_1, arg_9_2)
	arg_9_0.index_ = arg_9_1
	arg_9_0.cfg_ = TotalRechargeCfg[arg_9_2]

	arg_9_0:UpdateView()
end

function var_0_0.UpdateView(arg_10_0)
	arg_10_0.nameLabel_.text = string.format("%02d", arg_10_0.index_)
	arg_10_0.descLabel_.text = string.format(GetTips("PAYMENT_TOTAL_POINT"), arg_10_0.cfg_.num)

	for iter_10_0 = 1, 3 do
		if arg_10_0.cfg_.reward[iter_10_0] then
			SetActive(arg_10_0.commonItems_[iter_10_0].gameObject_, true)
			CommonTools.SetCommonData(arg_10_0.commonItems_[iter_10_0], {
				id = arg_10_0.cfg_.reward[iter_10_0][1],
				number = arg_10_0.cfg_.reward[iter_10_0][2]
			}, arg_10_0.commonItemData[iter_10_0])
		else
			SetActive(arg_10_0.commonItems_[iter_10_0].gameObject_, false)
		end
	end

	if RechargeData:HaveGetTotalRechargeBonus(arg_10_0.cfg_.id) then
		arg_10_0.statusController_:SetSelectedState("already_received")
	elseif RechargeData:GetTotalRechargeNum() >= arg_10_0.cfg_.num then
		arg_10_0.statusController_:SetSelectedState("receive")
	else
		arg_10_0.statusController_:SetSelectedState("not_reach")
	end
end

function var_0_0.Dispose(arg_11_0)
	if arg_11_0.commonItem1_ then
		arg_11_0.commonItem1_:Dispose()

		arg_11_0.commonItem1_ = nil
	end

	if arg_11_0.commonItem2_ then
		arg_11_0.commonItem2_:Dispose()

		arg_11_0.commonItem2_ = nil
	end

	if arg_11_0.commonItem3_ then
		arg_11_0.commonItem3_:Dispose()

		arg_11_0.commonItem3_ = nil
	end

	var_0_0.super.Dispose(arg_11_0)
end

return var_0_0
