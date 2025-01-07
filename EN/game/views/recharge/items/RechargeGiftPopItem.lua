local var_0_0 = class("RechargeGiftPopItem", ReduxView)

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

	arg_3_0.commonItem = CommonItemView.New(arg_3_0.iconGo_, true)
	arg_3_0.CommonData = clone(ItemTemplateData)
	arg_3_0.controller = arg_3_0.controller_:GetController("have")
end

function var_0_0.AddUIListener(arg_4_0)
	return
end

function var_0_0.SetData(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	arg_5_0.id = arg_5_1
	arg_5_0.number = arg_5_2
	arg_5_0.count = arg_5_3

	arg_5_0:UpdateView()
end

function var_0_0.UpdateView(arg_6_0)
	CommonTools.SetCommonData(arg_6_0.commonItem, {
		id = arg_6_0.id,
		clickFun = function(arg_7_0)
			ShowPopItem(POP_ITEM, {
				arg_7_0.id
			})
		end
	}, arg_6_0.CommonData1)

	arg_6_0.limitLabel_.text = "X" .. arg_6_0.number
	arg_6_0.nameLabel_.text = ItemTools.getItemName(arg_6_0.id)

	local var_6_0 = ItemCfg[arg_6_0.id]

	if var_6_0.num_exchange_item then
		arg_6_0.controller:SetSelectedState(tostring(ItemTools.getItemNum(arg_6_0.id) >= var_6_0.limit))
	else
		arg_6_0.controller:SetSelectedState("false")
	end
end

function var_0_0.OnEnter(arg_8_0)
	return
end

function var_0_0.OnExit(arg_9_0)
	return
end

function var_0_0.Dispose(arg_10_0)
	if arg_10_0.commonItem then
		arg_10_0.commonItem:Dispose()

		arg_10_0.commonItem = nil
	end

	var_0_0.super.Dispose(arg_10_0)
end

return var_0_0
