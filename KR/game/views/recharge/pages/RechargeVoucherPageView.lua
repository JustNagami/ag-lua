local var_0_0 = import("game.views.recharge.pages.RechargePageBase")
local var_0_1 = class("RechargeVoucherPageView", var_0_0)

function var_0_1.OnCtor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_1.transform
	arg_1_0.shopID = arg_1_3

	arg_1_0:Init()
end

function var_0_1.InitUI(arg_2_0)
	arg_2_0:BindCfgUI()

	arg_2_0.list_ = LuaList.New(handler(arg_2_0, arg_2_0.indexItem), arg_2_0.listGo_, RechargeVoucherItem)
end

function var_0_1.indexItem(arg_3_0, arg_3_1, arg_3_2)
	arg_3_2:SetData(arg_3_0.shopDataList_[arg_3_1])
end

function var_0_1.AddUIListener(arg_4_0)
	return
end

function var_0_1.OnTop(arg_5_0)
	return
end

function var_0_1.OnEnter(arg_6_0)
	arg_6_0.shopDataList_ = arg_6_0:InitDataList()

	arg_6_0.list_:StartScroll(#arg_6_0.shopDataList_)
end

function var_0_1.OnExit(arg_7_0)
	return
end

function var_0_1.Hide(arg_8_0)
	var_0_1.super.Hide(arg_8_0)
end

function var_0_1.InitDataList(arg_9_0)
	local var_9_0 = ShopTools.FilterShopDataList(arg_9_0.shopID)

	table.sort(var_9_0, function(arg_10_0, arg_10_1)
		local var_10_0 = getShopCfg(arg_10_0.id)
		local var_10_1 = getShopCfg(arg_10_1.id)

		return var_10_0.goods_id < var_10_1.goods_id
	end)

	return var_9_0
end

function var_0_1.Dispose(arg_11_0)
	if arg_11_0.list_ then
		arg_11_0.list_:Dispose()

		arg_11_0.list_ = nil
	end

	var_0_1.super.Dispose(arg_11_0)
end

return var_0_1
