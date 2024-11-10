local var_0_0 = class("IlluMusicInfoItem", ReduxView)

function var_0_0.OnCtor(arg_1_0, arg_1_1)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_1.transform

	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	arg_2_0:InitUI()
	arg_2_0:AddUIListener()
end

function var_0_0.InitUI(arg_3_0)
	arg_3_0:BindCfgUI()

	arg_3_0.songItems = {}
end

function var_0_0.AddUIListener(arg_4_0)
	arg_4_0:AddBtnListener(arg_4_0.m_mask, nil, function()
		if arg_4_0.maskClickFunc then
			arg_4_0.maskClickFunc(arg_4_0.index)
		end
	end)
	arg_4_0:AddBtnListener(arg_4_0.m_cdBtn, nil, function()
		if arg_4_0.cdClickFunc then
			arg_4_0.cdClickFunc()
		end
	end)
end

function var_0_0.SetData(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
	arg_7_0.album = arg_7_1
	arg_7_0.index = arg_7_3

	local var_7_0 = MusicAlbumRecordCfg[arg_7_1]

	arg_7_0.m_icon.sprite = getSpriteWithoutAtlas("TextureConfig/IllustratedHandbook/musicCD/" .. var_7_0.cover)
	arg_7_0.songs = MusicRecordCfg.get_id_list_by_album[arg_7_0.album] or {}

	arg_7_0:RefreshSongs()
	arg_7_0:RefreshSongsState(arg_7_2)

	arg_7_0.m_verName.text = GetI18NText(var_7_0.verName)
	arg_7_0.m_albumName.text = GetI18NText(var_7_0.albumName)
end

function var_0_0.UpdateAnima(arg_8_0, arg_8_1)
	if arg_8_1 == arg_8_0.index then
		arg_8_0.m_animator:Play("detail_item_on", -1, 0)
	else
		arg_8_0.m_animator:Play("detail_item_on", -1, 1)
	end
end

function var_0_0.UpdateState(arg_9_0, arg_9_1)
	if arg_9_0.index == arg_9_1 then
		SetActive(arg_9_0.m_mask.gameObject, false)
	else
		SetActive(arg_9_0.m_mask.gameObject, true)
	end
end

function var_0_0.RefreshSongs(arg_10_0)
	for iter_10_0, iter_10_1 in ipairs(arg_10_0.songs) do
		if not arg_10_0.songItems[iter_10_0] then
			local var_10_0 = Object.Instantiate(arg_10_0.m_songItem, arg_10_0.m_songContent)

			arg_10_0.songItems[iter_10_0] = IlluMusicSongItem.New(var_10_0, arg_10_0)
		end

		arg_10_0.songItems[iter_10_0]:SetActive(true)
		arg_10_0.songItems[iter_10_0]:RefreshUI(iter_10_1)
	end

	for iter_10_2 = #arg_10_0.songs + 1, #arg_10_0.songItems do
		arg_10_0.songItems[iter_10_2]:SetActive(false)
	end
end

function var_0_0.RefreshSongsState(arg_11_0, arg_11_1)
	for iter_11_0, iter_11_1 in ipairs(arg_11_0.songItems) do
		iter_11_1:RefreshSongsState(arg_11_1)
	end
end

function var_0_0.RegistCallBack(arg_12_0, arg_12_1)
	arg_12_0.clickFunc = arg_12_1
end

function var_0_0.PlayMusic(arg_13_0, arg_13_1)
	if arg_13_0.clickFunc then
		arg_13_0.clickFunc(arg_13_1)
	end
end

function var_0_0.RegistMaskCallBack(arg_14_0, arg_14_1)
	arg_14_0.maskClickFunc = arg_14_1
end

function var_0_0.RegistCdCallBack(arg_15_0, arg_15_1)
	arg_15_0.cdClickFunc = arg_15_1
end

function var_0_0.ForceRebuild(arg_16_0)
	LayoutRebuilder.ForceRebuildLayoutImmediate(arg_16_0.m_songContent)
end

function var_0_0.Dispose(arg_17_0)
	for iter_17_0, iter_17_1 in ipairs(arg_17_0.songItems) do
		iter_17_1:Dispose()
	end

	arg_17_0.songItems = {}

	var_0_0.super.Dispose(arg_17_0)
end

return var_0_0
