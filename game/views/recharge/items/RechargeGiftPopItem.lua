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
end

function var_0_0.AddUIListener(arg_4_0)
	return
end

function var_0_0.SetData(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0.id = arg_5_1
	arg_5_0.number = arg_5_2

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
