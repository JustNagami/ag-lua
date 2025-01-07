local var_0_0 = class("AssetPendSettingItem", ReduxView)

function var_0_0.OnCtor(arg_1_0, arg_1_1)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_1.transform

	arg_1_0:Init()
	arg_1_0:AddUIListener()
end

function var_0_0.Init(arg_2_0)
	arg_2_0:BindCfgUI()

	arg_2_0.state_controller = arg_2_0.m_controller:GetController("state")
end

function var_0_0.AddUIListener(arg_3_0)
	arg_3_0:AddBtnListener(arg_3_0.m_download, nil, function()
		if not manager.assetPend:StartDownload(arg_3_0.key) then
			ShowTips("StartDownload fail")
		elseif arg_3_0.clickFunc then
			arg_3_0.clickFunc()
		end
	end)
	arg_3_0:AddBtnListener(arg_3_0.m_cancelBtn, nil, function()
		local var_5_0 = manager.assetPend:GetDownloadingKey()

		manager.assetPend:StopDownload(var_5_0)
	end)
end

function var_0_0.SetData(arg_6_0, arg_6_1)
	arg_6_0.key = arg_6_1

	local var_6_0 = AssetPendInfoCfg[arg_6_1]

	if var_6_0 then
		arg_6_0.m_title.text = var_6_0.asset_name
		arg_6_0.m_des.text = var_6_0.asset_desc
		arg_6_0.m_size.text = manager.assetPend:GetAssetPendSize(arg_6_1)
	else
		arg_6_0.m_title.text = arg_6_1
		arg_6_0.m_des.text = ""
		arg_6_0.m_size.text = manager.assetPend:GetAssetPendSize(arg_6_1)
	end

	arg_6_0.m_curProcess.fillAmount = 0
	arg_6_0.m_curSize.text = ""

	local var_6_1 = manager.assetPend:GetAssetPendState(arg_6_1)

	if var_6_1 == 0 then
		arg_6_0.state_controller:SetSelectedIndex(3)
	elseif var_6_1 == 1 then
		arg_6_0.state_controller:SetSelectedIndex(2)
	else
		arg_6_0.state_controller:SetSelectedIndex(1)
	end
end

function var_0_0.RefreshProcess(arg_7_0)
	local var_7_0 = manager.assetPend:GetDownloadingKey()

	if var_7_0 == arg_7_0.key then
		arg_7_0.state_controller:SetSelectedIndex(2)

		arg_7_0.m_curProcess.fillAmount = manager.assetPend:GetDownloadProcess()
		arg_7_0.m_curSize.text = manager.assetPend:GetSpeedStr()
	else
		local var_7_1 = manager.assetPend:GetAssetPendState(var_7_0)

		if var_7_1 == 0 then
			arg_7_0.state_controller:SetSelectedIndex(3)
		elseif var_7_1 == 1 then
			arg_7_0.state_controller:SetSelectedIndex(2)
		else
			arg_7_0.state_controller:SetSelectedIndex(1)
		end
	end
end

function var_0_0.RegistCallBack(arg_8_0, arg_8_1)
	arg_8_0.clickFunc = arg_8_1
end

return var_0_0
