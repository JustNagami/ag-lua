﻿local var_0_0 = class("RegressionSignView", ReduxView)

function var_0_0.OnCtor(arg_1_0, arg_1_1)
	local var_1_0 = Asset.Load("Widget/System/ReturnThree/RT3rd_SignUI")
	local var_1_1 = Object.Instantiate(var_1_0, arg_1_1)

	arg_1_0.gameObject_ = var_1_1
	arg_1_0.transform_ = var_1_1.transform

	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	arg_2_0:InitUI()
	arg_2_0:AddUIListener()
end

function var_0_0.InitUI(arg_3_0)
	arg_3_0:BindCfgUI()

	arg_3_0.list = LuaList.New(handler(arg_3_0, arg_3_0.IndexItem), arg_3_0.m_list, RegressionSignItem)
	arg_3_0.descText_.text = GetTips("NEW_REGRESSION_SIGN_DESC")
end

function var_0_0.AddUIListener(arg_4_0)
	return
end

function var_0_0.SetActive(arg_5_0, arg_5_1)
	SetActive(arg_5_0.gameObject_, arg_5_1)
end

function var_0_0.SetData(arg_6_0)
	arg_6_0.index = RegressionDataNew:GetSignIndex()

	local var_6_0 = RegressionDataNew:GetRegressionSystemID()

	arg_6_0.rewards = ReturnCfg[var_6_0] and ReturnCfg[var_6_0].sign_id or {}

	arg_6_0.list:StartScroll(#arg_6_0.rewards)

	if not getData("Regression", "First" .. RedPointConst.NEW_REGRESSION_SIGN .. RegressionDataNew:GetRegressionEndTime()) then
		saveData("Regression", "First" .. RedPointConst.NEW_REGRESSION_SIGN .. RegressionDataNew:GetRegressionEndTime(), true)
		manager.redPoint:setTip(RedPointConst.NEW_REGRESSION_SIGN_FIRST, 0)
	end
end

function var_0_0.IndexItem(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = arg_7_0.rewards[arg_7_1]

	arg_7_2:SetData(arg_7_1, var_7_0)
	arg_7_2:RegistCallBack(handler(arg_7_0, arg_7_0.OnItemClick))
end

function var_0_0.OnItemClick(arg_8_0, arg_8_1)
	RegressionActionNew.QuerySign(arg_8_1)
end

function var_0_0.RefreshTime(arg_9_0, arg_9_1)
	if arg_9_0.index ~= RegressionData:GetSignIndex() then
		local var_9_0 = arg_9_0.list:GetItemList()

		for iter_9_0, iter_9_1 in ipairs(var_9_0) do
			iter_9_1:Refresh()
		end
	end

	arg_9_0.countDownTxt_.text = string.format(GetTips("LEFT_TIME"), manager.time:GetLostTimeStrWith2Unit(arg_9_1))
end

function var_0_0.OnRegressionSign(arg_10_0)
	local var_10_0 = arg_10_0.list:GetItemList()

	for iter_10_0, iter_10_1 in ipairs(var_10_0) do
		iter_10_1:Refresh()
	end
end

function var_0_0.SetActive(arg_11_0, arg_11_1)
	SetActive(arg_11_0.gameObject_, arg_11_1)
end

function var_0_0.Dispose(arg_12_0)
	if arg_12_0.list then
		arg_12_0.list:Dispose()

		arg_12_0.list = nil
	end

	var_0_0.super.Dispose(arg_12_0)
end

return var_0_0
