local var_0_0 = class("IlluMusicView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/System/IllustratedHandbook/IlluMusicAlbumUI"
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

	arg_4_0.common_list = LuaList.New(handler(arg_4_0, arg_4_0.IndexCommonItem), arg_4_0.m_common_list, IlluMusicAlbumItem)
	arg_4_0.detail_list = LuaList.New(handler(arg_4_0, arg_4_0.IndexDetailItem), arg_4_0.m_detail_list, IlluMusicInfoItem)
	arg_4_0.pauseController = ControllerUtil.GetController(arg_4_0.transform_, "pause")
	arg_4_0.bgmController = ControllerUtil.GetController(arg_4_0.transform_, "bgm")
	arg_4_0.statusController = ControllerUtil.GetController(arg_4_0.transform_, "status")

	SetActive(arg_4_0.m_musicName.gameObject, false)
	SetActive(arg_4_0.m_author.gameObject, false)
	TimeTools.StartAfterSeconds(0.1, function()
		arg_4_0.m_musicName.alignment = UnityEngine.TextAnchor.MiddleLeft
		arg_4_0.m_author.alignment = UnityEngine.TextAnchor.MiddleLeft

		SetActive(arg_4_0.m_musicName.gameObject, true)
		SetActive(arg_4_0.m_author.gameObject, true)
	end, {})
end

function var_0_0.AddUIListener(arg_6_0)
	arg_6_0.m_scroller.onValueChanged:AddListener(function()
		return
	end)
	arg_6_0:AddBtnListener(arg_6_0.m_nextBtn, nil, function()
		arg_6_0:ChangeMusic(1)
	end)
	arg_6_0:AddBtnListener(arg_6_0.m_lastBtn, nil, function()
		arg_6_0:ChangeMusic(-1)
	end)
	arg_6_0:AddBtnListener(arg_6_0.m_playBtn, nil, function()
		if arg_6_0.player then
			arg_6_0.player:Pause(false)
		end

		arg_6_0:RefreshState()
	end)
	arg_6_0:AddBtnListener(arg_6_0.m_pauseBtn, nil, function()
		if arg_6_0.player then
			arg_6_0.player:Pause(true)
		end

		arg_6_0:RefreshState()
	end)
	arg_6_0:AddBtnListener(arg_6_0.m_setBgmBtn, nil, function()
		IllustratedAction.QuerySetBgm(arg_6_0.music_id)
	end)
	arg_6_0:AddBtnListener(arg_6_0.m_detailMask, nil, function()
		arg_6_0:SwitchToCommon()
	end)
	arg_6_0:AddBtnListener(arg_6_0.m_mask, nil, function()
		arg_6_0:SwitchToCommon()
	end)
	arg_6_0.detail_list:SetPageChangeHandler(handler(arg_6_0, arg_6_0.OnDetailPageChange))
end

function var_0_0.OnTop(arg_15_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR
	})
end

function var_0_0.SwitchToCommon(arg_16_0)
	if arg_16_0.statusController:GetSelectedState() == "detail" then
		arg_16_0.statusController:SetSelectedState("common")

		local var_16_0 = arg_16_0.common_list:GetItemList()

		for iter_16_0, iter_16_1 in pairs(var_16_0) do
			iter_16_1:UpdateAnima(arg_16_0.pageIndex)
		end
	end
end

function var_0_0.OnDetailPageChange(arg_17_0, arg_17_1)
	if arg_17_1 <= #arg_17_0.albums then
		arg_17_0.pageIndex = arg_17_1

		if arg_17_0.statusController:GetSelectedState() == "detail" then
			arg_17_0.common_list:SwitchToPage(arg_17_1)
		end

		local var_17_0 = arg_17_0.detail_list:GetItemList()

		for iter_17_0, iter_17_1 in pairs(var_17_0) do
			iter_17_1:UpdateState(arg_17_0.pageIndex)
		end
	end
end

function var_0_0.OnCommonPageChange(arg_18_0, arg_18_1)
	if arg_18_1 <= #arg_18_0.albums then
		arg_18_0.pageIndex = arg_18_1

		if arg_18_0.statusController:GetSelectedState() == "common" then
			arg_18_0.detail_list:SwitchToPage(arg_18_1)
		end
	end
end

function var_0_0.OnEnter(arg_19_0)
	arg_19_0.player = manager.audio:GetBgmPlayer()
	arg_19_0.music_id = arg_19_0:GetMusicId()

	arg_19_0:RefreshState()

	arg_19_0.albums = MusicAlbumRecordCfg.all

	arg_19_0.statusController:SetSelectedState("common")

	local var_19_0 = MusicRecordCfg[arg_19_0.music_id].album

	arg_19_0.pageIndex = table.indexof(arg_19_0.albums, var_19_0) or 1

	arg_19_0.common_list:StartScroll(#arg_19_0.albums, arg_19_0.pageIndex, true, false)
	arg_19_0.detail_list:StartScroll(#arg_19_0.albums, arg_19_0.pageIndex, true, false)
end

function var_0_0.OnExit(arg_20_0)
	manager.windowBar:HideBar()

	if arg_20_0.player then
		arg_20_0.player:Pause(false)
	end
end

function var_0_0.Dispose(arg_21_0)
	arg_21_0.common_list:Dispose()
	arg_21_0.detail_list:Dispose()
	var_0_0.super.Dispose(arg_21_0)
end

function var_0_0.IndexCommonItem(arg_22_0, arg_22_1, arg_22_2)
	local var_22_0 = arg_22_0.albums[arg_22_1]

	arg_22_2:SetData(var_22_0, arg_22_0.music_id, arg_22_1)
	arg_22_2:RegistCallBack(handler(arg_22_0, arg_22_0.OnAlbumClick))
end

function var_0_0.IndexDetailItem(arg_23_0, arg_23_1, arg_23_2)
	local var_23_0 = arg_23_0.albums[arg_23_1]

	arg_23_2:SetData(var_23_0, arg_23_0.music_id, arg_23_1)
	arg_23_2:UpdateState(arg_23_0.pageIndex)
	arg_23_2:RegistCallBack(handler(arg_23_0, arg_23_0.PlayMusic))
	arg_23_2:RegistMaskCallBack(handler(arg_23_0, arg_23_0.ChangePageIndex))
	arg_23_2:RegistCdCallBack(handler(arg_23_0, arg_23_0.SwitchToCommon))
end

function var_0_0.ChangePageIndex(arg_24_0, arg_24_1)
	arg_24_0.detail_list:SwitchToPage(arg_24_1)
end

function var_0_0.OnAlbumClick(arg_25_0, arg_25_1)
	arg_25_0.statusController:SetSelectedState("detail")

	arg_25_0.pageIndex = arg_25_1

	arg_25_0.detail_list:ScrollToIndex(arg_25_0.pageIndex, true, false)

	local var_25_0 = arg_25_0.detail_list:GetItemList()

	for iter_25_0, iter_25_1 in pairs(var_25_0) do
		iter_25_1:UpdateAnima(arg_25_0.pageIndex)
	end

	arg_25_0:OnDetailPageChange(arg_25_0.pageIndex)
end

function var_0_0.GetMusicId(arg_26_0)
	local var_26_0 = GetHomeMusicID()

	if var_26_0 ~= 0 and MusicRecordCfg[var_26_0] then
		return var_26_0
	else
		if arg_26_0.player then
			local var_26_1 = arg_26_0.player.cueName or ""
			local var_26_2 = arg_26_0.player.cueSheet or ""

			if var_26_1 ~= "" and var_26_2 ~= "" then
				local var_26_3 = MusicRecordCfg.all

				for iter_26_0, iter_26_1 in ipairs(var_26_3) do
					local var_26_4 = MusicRecordCfg[iter_26_1]

					if var_26_4.cueName == var_26_1 and var_26_4.cuesheet == var_26_2 then
						return iter_26_1
					end
				end
			end
		end

		return MusicRecordCfg.all[1]
	end
end

function var_0_0.ChangeMusic(arg_27_0, arg_27_1)
	local var_27_0 = MusicRecordCfg[arg_27_0.music_id]
	local var_27_1 = MusicRecordCfg.get_id_list_by_album[var_27_0.album]
	local var_27_2 = #var_27_1
	local var_27_3 = (table.indexof(var_27_1, arg_27_0.music_id) + var_27_2 + arg_27_1) % var_27_2

	if var_27_3 == 0 then
		var_27_3 = var_27_2
	end

	arg_27_0:PlayMusic(var_27_1[var_27_3])
end

function var_0_0.PlayMusic(arg_28_0, arg_28_1)
	if arg_28_1 == arg_28_0.music_id then
		return
	end

	manager.audio:StopBgmImmediate()

	arg_28_0.music_id = arg_28_1

	local var_28_0 = MusicRecordCfg[arg_28_0.music_id]

	if arg_28_0.player then
		arg_28_0.player:Pause(false)

		local var_28_1 = MusicData:GetAisacSet(arg_28_0.music_id)

		for iter_28_0, iter_28_1 in pairs(var_28_1) do
			AudioManager.Instance:SetAisacControlOfCategory("music", iter_28_0, iter_28_1)
		end
	end

	manager.audio:PlayBGM(var_28_0.cuesheet, var_28_0.cueName, var_28_0.awbName)
	arg_28_0:RefreshState()
end

function var_0_0.RefreshState(arg_29_0)
	if arg_29_0.player and not arg_29_0.player:IsPaused() then
		arg_29_0.pauseController:SetSelectedIndex(0)
	else
		arg_29_0.pauseController:SetSelectedIndex(1)
	end

	local var_29_0 = MusicRecordCfg[arg_29_0.music_id]

	arg_29_0.m_musicName.text = GetI18NText(var_29_0.musicName)
	arg_29_0.m_author.text = GetI18NText(var_29_0.authorName)

	local var_29_1 = arg_29_0.detail_list:GetItemList()

	for iter_29_0, iter_29_1 in pairs(var_29_1) do
		iter_29_1:RefreshSongsState(arg_29_0.music_id)
	end

	local var_29_2 = GetHomeMusicID()

	if arg_29_0.music_id == var_29_2 then
		arg_29_0.bgmController:SetSelectedIndex(0)
	elseif var_29_0.ableBGM == 1 then
		arg_29_0.bgmController:SetSelectedIndex(1)
	else
		arg_29_0.bgmController:SetSelectedIndex(2)
	end
end

function var_0_0.OnSetBgmSuccess(arg_30_0)
	arg_30_0:RefreshState()
end

return var_0_0
