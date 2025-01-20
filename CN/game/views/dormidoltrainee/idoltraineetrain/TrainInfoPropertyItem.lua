local var_0_0 = class("TrainInfoPropertyItem", ReduxView)

function var_0_0.OnCtor(arg_1_0, arg_1_1)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_1.transform

	arg_1_0:InitUI()
end

function var_0_0.InitUI(arg_2_0)
	arg_2_0:BindCfgUI()
	arg_2_0:AddUIListener()
end

function var_0_0.AddUIListener(arg_3_0)
	return
end

function var_0_0.SetData(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.value_.text = arg_4_1
	arg_4_0.total_.text = "/" .. arg_4_2
	arg_4_0.bar_.value = arg_4_1 / arg_4_2
end

function var_0_0.Dispose(arg_5_0)
	var_0_0.super.Dispose(arg_5_0)
end

return var_0_0
