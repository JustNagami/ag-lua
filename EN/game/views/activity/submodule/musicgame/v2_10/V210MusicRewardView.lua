local var_0_0 = class("V210MusicRewardView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "UI/VersionUI/JapanRegionUI_2_10/JapanRegionMusicUI/MusicRewardUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiPop.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0.rewardItemList = {}

	arg_3_0:InitUI()
	arg_3_0:AddUIListener()
end

function var_0_0.InitUI(arg_4_0)
	arg_4_0:BindCfgUI()
end

function var_0_0.AddUIListener(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.m_mask, nil, function()
		arg_5_0:Back()
	end)
end

function var_0_0.OnTop(arg_7_0)
	manager.windowBar:SwitchBar({})
end

function var_0_0.OnEnter(arg_8_0)
	arg_8_0.activity_id = arg_8_0.params_.activity_id

	arg_8_0:UpdateMusicRewardList()
end

function var_0_0.GetState(arg_9_0, arg_9_1)
	local var_9_0 = ActivityMusicCfg.get_id_list_by_activity_id[arg_9_1]

	for iter_9_0, iter_9_1 in ipairs(var_9_0) do
		local var_9_1 = ActivityMusicCfg[iter_9_1]

		if var_9_1.difficult == 1 or var_9_1.difficult == 2 then
			if MusicData:GetRewardState(iter_9_1) == 1 then
				return 1
			elseif MusicData:GetRewardState(iter_9_1) == 2 then
				return -1
			end
		end
	end

	return 0
end

function var_0_0.OnExit(arg_10_0)
	manager.windowBar:HideBar()
end

function var_0_0.Dispose(arg_11_0)
	for iter_11_0, iter_11_1 in pairs(arg_11_0.rewardItemList) do
		iter_11_1:Dispose()
	end

	var_0_0.super.Dispose(arg_11_0)
end

function var_0_0.GetHeight(arg_12_0, arg_12_1)
	local var_12_0 = ActivityMusicCfg.get_id_list_by_activity_id[arg_12_1] or {}
	local var_12_1 = 360.90999999999997
	local var_12_2 = {}

	for iter_12_0, iter_12_1 in ipairs(var_12_0) do
		if ActivityMusicCfg[iter_12_1] and #ActivityMusicCfg[iter_12_1].reward > 0 then
			table.insert(var_12_2, iter_12_1)
		end
	end

	if #var_12_2 == 1 then
		var_12_1 = var_12_1 - 130
	end

	return var_12_1
end

function var_0_0.UpdateMusicRewardList(arg_13_0)
	local var_13_0 = ActivityCfg[arg_13_0.activity_id]

	arg_13_0.musics = {}

	for iter_13_0, iter_13_1 in ipairs(var_13_0.sub_activity_list) do
		if ActivityCfg[iter_13_1] and ActivityTemplateConst.ACTIVITY_MUSIC_GAME then
			table.insert(arg_13_0.musics, iter_13_1)
		end
	end

	table.sort(arg_13_0.musics, function(arg_14_0, arg_14_1)
		local var_14_0 = arg_13_0:GetState(arg_14_0)
		local var_14_1 = arg_13_0:GetState(arg_14_1)

		if var_14_0 ~= var_14_1 then
			return var_14_1 < var_14_0
		else
			return arg_14_0 < arg_14_1
		end
	end)

	if #arg_13_0.rewardItemList == 0 then
		local var_13_1 = 0

		for iter_13_2, iter_13_3 in pairs(arg_13_0.musics) do
			arg_13_0:CreateRewardItem(iter_13_2)

			arg_13_0.rewardItemList[iter_13_2].transform_.anchoredPosition = Vector2(0, -var_13_1)
			var_13_1 = var_13_1 + arg_13_0:GetHeight(iter_13_3)
		end

		arg_13_0.contentTrs_.sizeDelta = Vector2(1221, var_13_1)
	end

	for iter_13_4, iter_13_5 in pairs(arg_13_0.musics) do
		arg_13_0:UpdateRewardItem(arg_13_0.rewardItemList[iter_13_4], iter_13_5)
	end
end

function var_0_0.CreateRewardItem(arg_15_0, arg_15_1, arg_15_2)
	local var_15_0 = GameObject.Instantiate(arg_15_0.songitemGo_, arg_15_0.contentTrs_)

	SetActive(var_15_0, true)

	arg_15_0.rewardItemList[arg_15_1] = VolumeMusicSongItem.New(var_15_0)
end

function var_0_0.UpdateRewardItem(arg_16_0, arg_16_1, arg_16_2)
	if not arg_16_1 or not arg_16_2 then
		return
	end

	arg_16_1:SetData(arg_16_2)
end

function var_0_0.OnMusicRewardUpdate(arg_17_0)
	for iter_17_0, iter_17_1 in pairs(arg_17_0.musics) do
		arg_17_0:UpdateRewardItem(arg_17_0.rewardItemList[iter_17_0], iter_17_1)
	end
end

return var_0_0
