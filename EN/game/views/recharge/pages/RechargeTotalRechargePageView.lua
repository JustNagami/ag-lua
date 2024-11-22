local var_0_0 = import("game.views.recharge.pages.RechargePageBase")
local var_0_1 = class("RechargeTotalRechargePageView", var_0_0)

function var_0_1.OnCtor(arg_1_0, arg_1_1)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_1.transform

	arg_1_0:Init()
end

function var_0_1.InitUI(arg_2_0)
	arg_2_0:BindCfgUI()

	arg_2_0.list_ = LuaList.New(handler(arg_2_0, arg_2_0.indexItem), arg_2_0.listGo_, RechargeTotalRechargeItem)
end

function var_0_1.indexItem(arg_3_0, arg_3_1, arg_3_2)
	return
end

function var_0_1.AddUIListener(arg_4_0)
	return
end

function var_0_1.OnTop(arg_5_0)
	return
end

function var_0_1.OnEnter(arg_6_0)
	return
end

function var_0_1.OnExit(arg_7_0)
	return
end

function var_0_1.Hide(arg_8_0)
	var_0_1.super.Hide(arg_8_0)
end

function var_0_1.Dispose(arg_9_0)
	if arg_9_0.list_ then
		arg_9_0.list_:Dispose()

		arg_9_0.list_ = nil
	end

	var_0_1.super.Dispose(arg_9_0)
end

return var_0_1
