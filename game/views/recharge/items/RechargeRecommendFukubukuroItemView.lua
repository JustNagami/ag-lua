local var_0_0 = class("RechargeRecommendFukubukuroItemView", RechargeRecommendBgItemView)

function var_0_0.InitUI(arg_1_0)
	var_0_0.super.InitUI(arg_1_0)

	arg_1_0.list = LuaList.New(handler(arg_1_0, arg_1_0.IndexItem), arg_1_0.m_list, CommonItem)
end

function var_0_0.AddUIListener(arg_2_0)
	var_0_0.super.AddUIListener(arg_2_0)
	arg_2_0:AddBtnListener(nil, arg_2_0.m_rareBtn, function()
		JumpTools.OpenPageByJump("popFukubukuroProbability", {
			itemId = arg_2_0.itemId
		})
	end)
end

function var_0_0.UpdateView(arg_4_0)
	var_0_0.super.UpdateView(arg_4_0)

	arg_4_0.itemId = 30041
	arg_4_0.items = ItemCfg[arg_4_0.itemId].param

	arg_4_0.list:StartScroll(#arg_4_0.items)
end

function var_0_0.IndexItem(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = arg_5_0.items[arg_5_1]

	arg_5_2:RefreshData({
		id = var_5_0[1],
		number = var_5_0[2]
	})
	arg_5_2:RegistCallBack(function(arg_6_0)
		ShowPopItem(POP_ITEM, {
			arg_6_0.id,
			arg_6_0.number
		})
	end)
end

function var_0_0.Dispose(arg_7_0)
	arg_7_0.list:Dispose()
	var_0_0.super.Dispose(arg_7_0)
end

return var_0_0
