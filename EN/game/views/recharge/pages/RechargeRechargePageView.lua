﻿local var_0_0 = import("game.views.recharge.pages.RechargePageBase")
local var_0_1 = class("RechargeRechargePageView", var_0_0)

function var_0_1.OnCtor(arg_1_0, arg_1_1)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_1.transform

	arg_1_0:InitConfig()
	arg_1_0:Init()
end

function var_0_1.InitConfig(arg_2_0)
	arg_2_0.rechargeDataList_ = {}

	for iter_2_0, iter_2_1 in ipairs(RechargeCfg.all) do
		table.insert(arg_2_0.rechargeDataList_, RechargeCfg[iter_2_1])
	end
end

function var_0_1.InitUI(arg_3_0)
	arg_3_0:BindCfgUI()

	arg_3_0.list_ = LuaList.New(handler(arg_3_0, arg_3_0.indexItem), arg_3_0.uiListGo_, RechargeRechargeItemView)
end

function var_0_1.indexItem(arg_4_0, arg_4_1, arg_4_2)
	arg_4_2:SetData(arg_4_0.rechargeDataList_[arg_4_1], {})
end

function var_0_1.AddUIListener(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.fundsettlementmethodBtn_, nil, function()
		local var_6_0 = "Payment_Services_Act_Url"
		local var_6_1 = OperationAction.GetOperationUrl(var_6_0)
		local var_6_2 = EncodeURL(var_6_1)

		print("url : ", var_6_2)

		local var_6_3 = OperationConst.URL_OPEN_WAY.NORMAL

		OperationAction.OpenUrl(var_6_2, var_6_3, nil)
	end)
	arg_5_0:AddBtnListener(arg_5_0.commercialBtn_, nil, function()
		local var_7_0 = "Specified_Commercial_Transactions_Url"
		local var_7_1 = OperationAction.GetOperationUrl(var_7_0)
		local var_7_2 = EncodeURL(var_7_1)

		print("url : ", var_7_2)

		local var_7_3 = OperationConst.URL_OPEN_WAY.NORMAL

		OperationAction.OpenUrl(var_7_2, var_7_3, nil)
	end)

	if SDKTools.GetIsInputServer("kr") then
		arg_5_0:AddBtnListener(arg_5_0.refundbtn_, nil, function()
			JumpTools.OpenPageByJump("gameHelpPro", {
				hideHomeBtn = 1,
				isPrefab = true,
				pages = {
					"Widget/System/Recharge/RefundPolicyKR_01"
				}
			})
		end)
	end
end

function var_0_1.OnTop(arg_9_0)
	return
end

function var_0_1.OnEnter(arg_10_0)
	arg_10_0.list_:StartScroll(#arg_10_0.rechargeDataList_)
	SetActive(arg_10_0.btnsGo_, GameToSDK.CURRENT_SERVER == SERVER_REGION.JAPAN)
	SetActive(arg_10_0.refundGo_, false)
	SetActive(arg_10_0.refundbtn_.gameObject, GameToSDK.CURRENT_SERVER == "kr")
end

function var_0_1.OnExit(arg_11_0)
	return
end

function var_0_1.Dispose(arg_12_0)
	if arg_12_0.list_ then
		arg_12_0.list_:Dispose()

		arg_12_0.list_ = nil
	end

	var_0_1.super.Dispose(arg_12_0)
end

return var_0_1
