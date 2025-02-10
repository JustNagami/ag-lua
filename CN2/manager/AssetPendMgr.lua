local var_0_0 = class("")

function var_0_0.Ctor(arg_1_0)
	arg_1_0.cacheAssetPendList = nil
	arg_1_0.assetPendState = {}
	arg_1_0.assetPendProcess = {}
end

function var_0_0.CheckAssetPend(arg_2_0, arg_2_1)
	if arg_2_1 == nil or arg_2_1 == "" then
		return true
	end

	return AssetPendDownLoadManager.instance:CheckAssetPendDownloaded(arg_2_1)
end

function var_0_0.GetAssetPendSize(arg_3_0, arg_3_1)
	if arg_3_1 == nil or arg_3_1 == "" then
		return ""
	end

	return AssetPendDownLoadManager.instance:GetAssetPendSize(arg_3_1)
end

function var_0_0.GetIsDowndloading(arg_4_0)
	return AssetPendDownLoadManager.instance:GetCurOptionKey() ~= ""
end

function var_0_0.GetDownloadingKey(arg_5_0)
	return AssetPendDownLoadManager.instance:GetCurOptionKey()
end

function var_0_0.GetDownloadProcess(arg_6_0)
	return AssetPendDownLoadManager.instance:GetProcess()
end

function var_0_0.GetDownloadProcessStr(arg_7_0)
	return AssetPendDownLoadManager.instance:GetProcessStr()
end

function var_0_0.GetSpeedStr(arg_8_0)
	return AssetPendDownLoadManager.instance:GetSpeedStr() .. "/S"
end

function var_0_0.GetAssetPendList(arg_9_0)
	if arg_9_0.cacheAssetPendList ~= nil then
		return arg_9_0.cacheAssetPendList
	end

	local var_9_0 = AssetPendDownLoadManager.instance:GetAssetPendList()
	local var_9_1 = var_9_0.Count

	arg_9_0.cacheAssetPendList = {}

	for iter_9_0 = 0, var_9_1 - 1 do
		table.insert(arg_9_0.cacheAssetPendList, var_9_0[iter_9_0])
	end

	return arg_9_0.cacheAssetPendList
end

local var_0_1 = 0

function var_0_0.StartDownload(arg_10_0, arg_10_1, arg_10_2)
	if not arg_10_2 then
		local var_10_0 = Time.realtimeSinceStartup

		if var_10_0 - var_0_1 > 1 then
			var_0_1 = var_10_0
		else
			return
		end
	end

	if AssetPendDownLoadManager.instance:StartAssetPendDownload(arg_10_1, function()
		arg_10_0:OnDownloadSuccess(arg_10_1)
	end, function()
		arg_10_0:OnDownloadFail(arg_10_1)
	end) then
		return true
	else
		return false
	end
end

function var_0_0.StopDownload(arg_13_0, arg_13_1)
	if arg_13_0:GetDownloadingKey() == arg_13_1 then
		arg_13_0.assetPendProcess[arg_13_1] = {
			process = arg_13_0:GetDownloadProcess(),
			processStr = arg_13_0:GetDownloadProcessStr()
		}
	end

	if AssetPendDownLoadManager.instance:StopAssetPendDownload(arg_13_1) then
		arg_13_0.assetPendState[arg_13_1] = "pause"

		manager.notify:CallUpdateFunc(ASSET_PEND_DOWNLOAD_END, arg_13_1, false)
	end
end

function var_0_0.OnDownloadSuccess(arg_14_0, arg_14_1)
	arg_14_0.assetPendState[arg_14_1] = "success"

	manager.notify:CallUpdateFunc(ASSET_PEND_DOWNLOAD_END, arg_14_1, true)
end

function var_0_0.OnDownloadFail(arg_15_0, arg_15_1)
	arg_15_0.assetPendState[arg_15_1] = "fail"

	manager.notify:CallUpdateFunc(ASSET_PEND_DOWNLOAD_END, arg_15_1, false)
end

function var_0_0.GetAssetPendState(arg_16_0, arg_16_1)
	if arg_16_0:CheckAssetPend(arg_16_1) then
		return 0
	end

	if arg_16_1 == AssetPendDownLoadManager.instance:GetCurOptionKey() then
		return 1
	end

	local var_16_0 = arg_16_0.assetPendState[arg_16_1]

	if var_16_0 == "pause" then
		return 3
	elseif var_16_0 == "fail" then
		return 4
	else
		return 2
	end
end

function var_0_0.GetAssetPendCacheProcess(arg_17_0, arg_17_1)
	if arg_17_0.assetPendProcess[arg_17_1] then
		return arg_17_0.assetPendProcess[arg_17_1].process, arg_17_0.assetPendProcess[arg_17_1].processStr
	end

	return 0, ""
end

function var_0_0.CheckLauncherBattle(arg_18_0, arg_18_1, arg_18_2)
	if BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_PLOT == arg_18_1 or BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_SUB_PLOT == arg_18_1 or BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_DAILY == arg_18_1 then
		local var_18_0 = getChapterIDByStageID(arg_18_2)
		local var_18_1 = ChapterCfg[var_18_0] and ChapterCfg[var_18_0].clientID

		if var_18_1 and ChapterClientCfg[var_18_1] then
			local var_18_2 = ChapterClientCfg[var_18_1].asset_pend_key

			return arg_18_0:CheckAssetPend(var_18_2), var_18_2
		end

		return true
	end

	local var_18_3 = AssetPendInfoCfg.get_id_list_by_asset_stage_type[arg_18_1] or {}

	for iter_18_0 = 1, #var_18_3 do
		local var_18_4 = var_18_3[iter_18_0]

		if not arg_18_0:CheckAssetPend(var_18_4) then
			return false, var_18_4
		end
	end

	return true
end

function var_0_0.ShowAssetPendMessageBox(arg_19_0, arg_19_1)
	JumpTools.OpenPageByJump("assetPendPop", {
		assetPend = arg_19_1
	})
end

function var_0_0.CheckJumpToPage(arg_20_0, arg_20_1)
	local var_20_0 = arg_20_1[1]
	local var_20_1 = SystemLinkCfg[var_20_0]

	if not var_20_1 then
		return true
	end

	local var_20_2 = {
		305,
		309,
		310,
		308,
		312,
		307
	}

	if table.indexof(var_20_2, var_20_0) then
		local var_20_3 = arg_20_1[2]
		local var_20_4 = getChapterClientCfgByChapterID(var_20_3)

		if var_20_4 then
			return arg_20_0:CheckAssetPend(var_20_4.asset_pend_key), var_20_4.asset_pend_key
		end
	end

	return arg_20_0:CheckAssetPend(var_20_1.asset_pend_key), var_20_1.asset_pend_key
end

return var_0_0
