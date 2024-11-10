local var_0_0 = class("RechargeTotalRechargeView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/System/Recharge/RechargeTotalRechargeUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:InitUI()
	arg_3_0:AddUIListener()
end

function var_0_0.InitUI(arg_4_0)
	arg_4_0:BindCfgUI()

	arg_4_0.list_ = LuaList.New(handler(arg_4_0, arg_4_0.indexItem), arg_4_0.listGo_, RechargeTotalRechargeItem)

	local var_4_0 = getData("totalRecharge", "seeToggle")

	if var_4_0 ~= nil then
		arg_4_0.seeToggle_.isOn = var_4_0 == 1 and true or false
	end
end

function var_0_0.indexItem(arg_5_0, arg_5_1, arg_5_2)
	arg_5_2:SetData(table.indexof(arg_5_0.oriDataList_, arg_5_0.dataList_[arg_5_1]), arg_5_0.dataList_[arg_5_1])
end

function var_0_0.AddUIListener(arg_6_0)
	arg_6_0:AddToggleListener(arg_6_0.seeToggle_, function(arg_7_0)
		saveData("totalRecharge", "seeToggle", arg_7_0 and 1 or 0)
	end)
end

function var_0_0.OnTop(arg_8_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR
	})
end

function var_0_0.OnEnter(arg_9_0)
	arg_9_0:UpdateList()
	arg_9_0:UpdateView()
	arg_9_0:RegistEventListener(TOTAL_RECHARGE_UPDATE, function(arg_10_0)
		arg_9_0:UpdateView()
	end)
	arg_9_0:RegistEventListener(GET_TOTAL_RECHARGE_BONUS, function(arg_11_0)
		arg_9_0:UpdateList()
		arg_9_0:UpdateView()
	end)
end

function var_0_0.UpdateList(arg_12_0)
	arg_12_0.dataList_ = {}
	arg_12_0.oriDataList_ = {}
	arg_12_0.jumpIndex_ = 0

	for iter_12_0, iter_12_1 in ipairs(TotalRechargeCfg.all) do
		table.insert(arg_12_0.dataList_, iter_12_1)
		table.insert(arg_12_0.oriDataList_, iter_12_1)

		if RechargeData:HaveGetTotalRechargeBonus(iter_12_1) == false and arg_12_0.jumpIndex_ == 0 then
			arg_12_0.jumpIndex_ = iter_12_0
		end
	end
end

function var_0_0.UpdateView(arg_13_0)
	arg_13_0.list_:StartScroll(#arg_13_0.dataList_, arg_13_0.jumpIndex_)

	arg_13_0.currentLabel_.text = RechargeData:GetTotalRechargeNum()

	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_13_0.currencyLayout_)
end

function var_0_0.OnExit(arg_14_0)
	arg_14_0:RemoveAllEventListener()
	manager.windowBar:HideBar()
end

function var_0_0.Dispose(arg_15_0)
	if arg_15_0.list_ then
		arg_15_0.list_:Dispose()

		arg_15_0.list_ = nil
	end

	var_0_0.super.Dispose(arg_15_0)
end

return var_0_0
