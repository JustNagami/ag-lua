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
	arg_2_0.size_controller = arg_2_0.m_controller:GetController("size")
end

function var_0_0.AddUIListener(arg_3_0)
	arg_3_0:AddBtnListener(arg_3_0.m_download, nil, function()
		if manager.assetPend:GetIsDowndloading() then
			ShowMessageBox({
				content = GetTips("当前存在下载项,是否暂停并执行新的下载项"),
				OkCallback = function()
					local var_5_0 = manager.assetPend:GetDownloadingKey()

					manager.assetPend:StopDownload(var_5_0)
					TimeTools.StartAfterSeconds(0.5, function()
						manager.assetPend:StartDownload(arg_3_0.key, true)
					end, {})
				end,
				CancelCallback = function()
					return
				end
			})
		else
			manager.assetPend:StartDownload(arg_3_0.key)
		end
	end)
	arg_3_0:AddBtnListener(arg_3_0.m_restoreBtn, nil, function()
		if manager.assetPend:GetIsDowndloading() then
			ShowMessageBox({
				content = GetTips("当前存在下载项,是否暂停并执行新的下载项"),
				OkCallback = function()
					local var_9_0 = manager.assetPend:GetDownloadingKey()

					manager.assetPend:StopDownload(var_9_0)
					TimeTools.StartAfterSeconds(0.5, function()
						manager.assetPend:StartDownload(arg_3_0.key, true)
					end, {})
				end,
				CancelCallback = function()
					return
				end
			})
		else
			manager.assetPend:StartDownload(arg_3_0.key)
		end
	end)
	arg_3_0:AddBtnListener(arg_3_0.m_pauseBtn, nil, function()
		manager.assetPend:StopDownload(arg_3_0.key)
	end)
end

function var_0_0.SetData(arg_13_0, arg_13_1)
	arg_13_0.key = arg_13_1

	local var_13_0 = AssetPendInfoCfg[arg_13_1]

	if var_13_0 then
		arg_13_0.m_title.text = var_13_0.asset_name
		arg_13_0.m_des.text = var_13_0.asset_desc
		arg_13_0.m_size.text = manager.assetPend:GetAssetPendSize(arg_13_1)
	else
		arg_13_0.m_title.text = arg_13_1
		arg_13_0.m_des.text = ""
		arg_13_0.m_size.text = manager.assetPend:GetAssetPendSize(arg_13_1)
	end

	arg_13_0:Refresh()
end

function var_0_0.Refresh(arg_14_0)
	local var_14_0 = arg_14_0.key
	local var_14_1 = manager.assetPend:GetAssetPendState(var_14_0)

	if var_14_1 == 0 then
		arg_14_0.state_controller:SetSelectedIndex(4)
		arg_14_0.size_controller:SetSelectedIndex(0)
	elseif var_14_1 == 1 then
		arg_14_0.state_controller:SetSelectedIndex(2)
		arg_14_0.size_controller:SetSelectedIndex(1)

		arg_14_0.m_speed.text = manager.assetPend:GetSpeedStr()
		arg_14_0.m_processLab.text = manager.assetPend:GetDownloadProcessStr()

		local var_14_2 = manager.assetPend:GetDownloadProcess()

		arg_14_0.m_processFill2.text = string.format("%.1f", var_14_2 * 100) .. "%"
	elseif var_14_1 == 3 then
		arg_14_0.state_controller:SetSelectedIndex(3)
		arg_14_0.size_controller:SetSelectedIndex(2)

		local var_14_3, var_14_4 = manager.assetPend:GetAssetPendCacheProcess(var_14_0)

		arg_14_0.m_processLab.text = var_14_4
		arg_14_0.m_processFill.text = string.format("%.1f", var_14_3 * 100) .. "%"
	else
		arg_14_0.state_controller:SetSelectedIndex(1)
		arg_14_0.size_controller:SetSelectedIndex(3)
	end
end

return var_0_0
