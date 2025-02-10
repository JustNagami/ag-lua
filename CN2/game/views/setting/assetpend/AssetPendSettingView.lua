local var_0_0 = class("AssetPendSettingView", ReduxView)

function var_0_0.SetActive(arg_1_0, arg_1_1)
	if arg_1_1 then
		arg_1_0:OnShow()
	else
		arg_1_0:OnHide()
	end

	if arg_1_0.gameObject_ then
		SetActive(arg_1_0.gameObject_, arg_1_1)
	end
end

function var_0_0.OnCtor(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	arg_2_0.gameObject_ = arg_2_2
	arg_2_0.transform_ = arg_2_2.transform

	arg_2_0:Init()
	arg_2_0:AddUIListener()
end

function var_0_0.Init(arg_3_0)
	arg_3_0:BindCfgUI()

	arg_3_0.list = LuaList.New(handler(arg_3_0, arg_3_0.IndexItem), arg_3_0.m_list, AssetPendSettingItem)
	arg_3_0.type_controller = arg_3_0.m_controller:GetController("type")
end

function var_0_0.AddUIListener(arg_4_0)
	arg_4_0:AddBtnListener(arg_4_0.m_threadBtn, nil, function()
		arg_4_0:SelectType(1)
	end)
	arg_4_0:AddBtnListener(arg_4_0.m_extensionBtn, nil, function()
		arg_4_0:SelectType(2)
	end)
	arg_4_0:AddBtnListener(arg_4_0.m_gameBtn, nil, function()
		arg_4_0:SelectType(3)
	end)
end

function var_0_0.SelectType(arg_8_0, arg_8_1)
	arg_8_0.type_controller:SetSelectedIndex(arg_8_1)

	local var_8_0 = manager.assetPend:GetAssetPendList()

	arg_8_0.assetPendList = {}

	for iter_8_0 = 1, #var_8_0 do
		local var_8_1 = var_8_0[iter_8_0]

		if AssetPendInfoCfg[var_8_1] and arg_8_1 == AssetPendInfoCfg[var_8_1].asset_type then
			table.insert(arg_8_0.assetPendList, var_8_1)
		end
	end

	arg_8_0.list:StartScroll(#arg_8_0.assetPendList)

	arg_8_0.lastIndex = arg_8_1
end

function var_0_0.OnShow(arg_9_0)
	arg_9_0:SelectType(arg_9_0.lastIndex or 1)
	arg_9_0:RemoveTimer()

	if arg_9_0.timer_ == nil then
		arg_9_0.timer_ = Timer.New(function()
			local var_10_0 = arg_9_0.list:GetItemList()

			for iter_10_0, iter_10_1 in pairs(var_10_0) do
				iter_10_1:Refresh()
			end
		end, 0.1, -1)
	end

	arg_9_0.timer_:Start()
end

function var_0_0.RemoveTimer(arg_11_0)
	if arg_11_0.timer_ then
		arg_11_0.timer_:Stop()

		arg_11_0.timer_ = nil
	end
end

function var_0_0.OnHide(arg_12_0)
	arg_12_0:RemoveTimer()
end

function var_0_0.OnExit(arg_13_0)
	arg_13_0:RemoveTimer()
end

function var_0_0.IndexItem(arg_14_0, arg_14_1, arg_14_2)
	local var_14_0 = arg_14_0.assetPendList[arg_14_1]

	arg_14_2:SetData(var_14_0)
end

function var_0_0.Dispose(arg_15_0)
	arg_15_0.list:Dispose()
	var_0_0.super.Dispose(arg_15_0)
end

function var_0_0.OnAssetPendDownloadEnd(arg_16_0, arg_16_1, arg_16_2)
	return
end

return var_0_0
