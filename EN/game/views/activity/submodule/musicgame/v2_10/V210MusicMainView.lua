local var_0_0 = class("V210MusicMainView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "UI/VersionUI/JapanRegionUI_2_10/JapanRegionMusicUI/MusicMainUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:InitUI()
	arg_3_0:AddUIListener()

	arg_3_0.pageIndex = 1
end

function var_0_0.InitUI(arg_4_0)
	arg_4_0:BindCfgUI()

	arg_4_0.list_ = LuaList.New(handler(arg_4_0, arg_4_0.IndexItem), arg_4_0.m_list, V210MusicMainItem)
	arg_4_0.lockController = ControllerUtil.GetController(arg_4_0.transform_, "lock")
	arg_4_0.openToggleController = ControllerUtil.GetController(arg_4_0.toggleTrs_, "open")
	arg_4_0.useShowToggleController = ControllerUtil.GetController(arg_4_0.toggleTrs_, "useShow")
end

function var_0_0.AddUIListener(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.m_rewardBtn, nil, function()
		JumpTools.OpenPageByJump("V210MusicReward")
	end)
	arg_5_0:AddBtnListener(arg_5_0.m_settingBtn, nil, function()
		JumpTools.OpenPageByJump("/V210MusicSetting")
	end)
	arg_5_0:AddBtnListener(arg_5_0.m_palyBtn, nil, function()
		local var_8_0 = arg_5_0.musics[arg_5_0.pageIndex]
		local var_8_1 = ActivityMusicCfg.get_id_list_by_activity_id[var_8_0]
		local var_8_2 = MusicData:GetDifficultyIndex(var_8_0) + 1

		MusicAction.Play(var_8_1[var_8_2])
	end)
	arg_5_0:AddBtnListener(arg_5_0.nowmusicBtn_, nil, function()
		arg_5_0:UpdateMusicListShow(0)
	end)
	arg_5_0:AddBtnListener(arg_5_0.backmusicBtn_, nil, function()
		arg_5_0:UpdateMusicListShow(1)
	end)
	arg_5_0:AddBtnListener(arg_5_0.togglebtnBtn_, nil, function()
		local var_11_0 = arg_5_0.openToggleController:GetSelectedState() == "true" and 0 or 1

		arg_5_0.openToggleController:SetSelectedIndex(var_11_0)
	end)
	arg_5_0:AddBtnListener(arg_5_0.togglerootclosebtnBtn_, nil, function()
		arg_5_0.openToggleController:SetSelectedIndex(0)
	end)
	arg_5_0.list_:SetPageChangeHandler(handler(arg_5_0, arg_5_0.OnPageChange))
	arg_5_0.m_scroller.onValueChanged:AddListener(function()
		arg_5_0:OnScrollerMove()
	end)
end

function var_0_0.GetScrollContentValue(arg_14_0)
	return -arg_14_0.contentTrs_.anchoredPosition.x / 1182 + 1
end

function var_0_0.OnScrollerMove(arg_15_0)
	local var_15_0 = arg_15_0:GetScrollContentValue()
	local var_15_1 = arg_15_0.list_:GetItemList()

	for iter_15_0, iter_15_1 in pairs(var_15_1) do
		iter_15_1:MoveAniEffect(var_15_0)
	end
end

function var_0_0.OnTop(arg_16_0)
	local var_16_0 = GameSetting.v210_music_describe and GameSetting.v210_music_describe.value or {}

	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR,
		INFO_BAR
	})
	manager.windowBar:RegistInfoCallBack(function()
		JumpTools.OpenPageByJump("gameHelpPro", {
			isPrefab = true,
			pages = var_16_0
		})
	end)
end

function var_0_0.UpdateMusicListShow(arg_18_0, arg_18_1)
	if (arg_18_0.useShowToggleController:GetSelectedState() == "false" and 0 or 1) == arg_18_1 then
		return
	end

	arg_18_0.openToggleController:SetSelectedIndex(0)
	arg_18_0:UpdateMusicDataByActId(arg_18_1 == 1)
end

function var_0_0.UpdateMusicDataByActId(arg_19_0, arg_19_1)
	arg_19_0.useShowToggleController:SetSelectedIndex(arg_19_1 and 1 or 0)

	local var_19_0 = ActivityCfg[arg_19_0.activity_id]

	arg_19_0.musics = {}

	local var_19_1 = {}

	for iter_19_0, iter_19_1 in ipairs(var_19_0.sub_activity_list) do
		if ActivityCfg[iter_19_1] and ActivityTemplateConst.ACTIVITY_MUSIC_GAME then
			table.insert(var_19_1, iter_19_1)
		end
	end

	if arg_19_1 then
		local var_19_2 = {}

		for iter_19_2, iter_19_3 in pairs(var_19_1) do
			var_19_2[iter_19_3] = true
		end

		for iter_19_4, iter_19_5 in pairs(ActivityMusicCfg.get_id_list_by_activity_id) do
			if not var_19_2[iter_19_4] then
				table.insert(arg_19_0.musics, iter_19_4)
			end
		end

		table.sort(arg_19_0.musics, function(arg_20_0, arg_20_1)
			return arg_20_0 < arg_20_1
		end)
	else
		arg_19_0.musics = var_19_1
	end

	arg_19_0.isLookBack = arg_19_1

	arg_19_0.list_:StartScroll(#arg_19_0.musics, arg_19_0.pageIndex, true, false)
	arg_19_0.list_:SwitchToPage(arg_19_0.pageIndex)
	arg_19_0.musicmainuiAni_:Play("MusicGameUI 1", 0, 0)
end

function var_0_0.OnEnter(arg_21_0)
	local var_21_0 = SettingData:GetSoundSettingData()

	if var_21_0 and var_21_0.music then
		manager.audio:SetVolume("music", var_21_0.music / 100)
	end

	arg_21_0.activity_id = arg_21_0.params_.activity_id
	arg_21_0.isLookBack = arg_21_0.isLookBack or MusicData:GetLookBackState()
	arg_21_0.pageIndex = MusicData:GetSelectIndex(arg_21_0.activity_id)

	arg_21_0:UpdateMusicDataByActId(arg_21_0.isLookBack)

	arg_21_0.BGMID = 0

	local var_21_1 = arg_21_0.musics[arg_21_0.pageIndex]
	local var_21_2 = MusicData:GetDifficultyIndex(var_21_1)
	local var_21_3 = math.min(var_21_2, 1)

	MusicData:SetDifficultIndex(var_21_1, var_21_3)
	arg_21_0:OnPageChange(arg_21_0.pageIndex)
	arg_21_0:RefrenTime()

	arg_21_0.timer = Timer.New(function()
		arg_21_0:RefrenTime()
		arg_21_0:RefrenBGM()
	end, 1, -1)

	arg_21_0.timer:Start()
	MusicAction.SetMusicRead(arg_21_0.activity_id)
	manager.redPoint:bindUIandKey(arg_21_0.m_rewardBtn.transform, string.format("%s_%s", RedPointConst.MUSIC_REWARD, arg_21_0.activity_id))

	if not getData("EnternalMusic", "showHelp") then
		local var_21_4 = GameSetting.v210_music_describe and GameSetting.v210_music_describe.value or {}

		JumpTools.OpenPageByJump("gameHelpPro", {
			isPrefab = true,
			pages = var_21_4
		})
		saveData("EnternalMusic", "showHelp", 1)
	end
end

function var_0_0.OnExit(arg_23_0)
	MusicData:SetLookBackState(arg_23_0.isLookBack)
	manager.windowBar:HideBar()

	if arg_23_0.timer then
		arg_23_0.timer:Stop()

		arg_23_0.timer = nil
	end

	manager.redPoint:unbindUIandKey(arg_23_0.m_rewardBtn.transform, string.format("%s_%s", RedPointConst.MUSIC_REWARD, arg_23_0.activity_id))
end

function var_0_0.RefrenTime(arg_24_0)
	local var_24_0 = ActivityData:GetActivityData(arg_24_0.activity_id)

	if var_24_0 and var_24_0:IsActivitying() then
		arg_24_0.m_timeLab.text = manager.time:GetLostTimeStr(var_24_0.stopTime)
	else
		arg_24_0.m_timeLab.text = GetTips("TIME_OVER")

		JumpTools.Back()

		return
	end

	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_24_0.m_timeLab.transform)

	local var_24_1 = arg_24_0.list_:GetItemList()

	for iter_24_0, iter_24_1 in pairs(var_24_1) do
		iter_24_1:RefrenTime()
	end

	local var_24_2 = arg_24_0.musics[arg_24_0.pageIndex]

	if ActivityData:GetActivityIsOpen(var_24_2) or arg_24_0.isLookBack then
		arg_24_0.lockController:SetSelectedIndex(1)
	else
		arg_24_0.lockController:SetSelectedIndex(0)
	end
end

function var_0_0.IndexItem(arg_25_0, arg_25_1, arg_25_2)
	local var_25_0 = arg_25_0.musics[arg_25_1]

	arg_25_2:SetData(arg_25_1, var_25_0, arg_25_0.isLookBack)
	arg_25_2:MoveAniEffect(arg_25_0:GetScrollContentValue())
end

function var_0_0.OnPageChange(arg_26_0, arg_26_1)
	if arg_26_1 > #arg_26_0.musics then
		arg_26_1 = #arg_26_0.musics
	end

	arg_26_0.pageIndex = arg_26_1

	MusicData:SetSelectIndex(arg_26_0.pageIndex)

	local var_26_0 = arg_26_0.musics[arg_26_1]

	if ActivityData:GetActivityIsOpen(var_26_0) or arg_26_0.isLookBack then
		arg_26_0.lockController:SetSelectedIndex(1)
	else
		arg_26_0.lockController:SetSelectedIndex(0)
	end

	arg_26_0:PlayBg()
end

function var_0_0.PlayBg(arg_27_0)
	manager.audio:ClearBGMFlag()

	local var_27_0 = arg_27_0.musics[arg_27_0.pageIndex]

	if not var_27_0 then
		return
	end

	local var_27_1 = ActivityData:GetActivityData(var_27_0)

	if (not var_27_1 or not var_27_1:IsActivitying()) and not arg_27_0.isLookBack then
		manager.audio:StopBgmImmediate()

		return
	end

	local var_27_2 = ActivityMusicCfg.get_id_list_by_activity_id[var_27_0]
	local var_27_3 = var_27_2[MusicData:GetDifficultyIndex(var_27_0) + 1] or var_27_2[1]
	local var_27_4 = ActivityMusicCfg[var_27_3]

	if var_27_4.aisacKey ~= "" then
		AudioManager.Instance:SetAisacControlOfCategory("music", var_27_4.aisacKey, var_27_4.aisacValue)
	end

	arg_27_0.BGMID = var_27_3

	manager.audio:PlayBGM(var_27_4.cueSheetName, var_27_4.cueName, var_27_4.awbFile)
end

function var_0_0.RefrenBGM(arg_28_0)
	local var_28_0 = arg_28_0.musics[arg_28_0.pageIndex]

	if not var_28_0 then
		return
	end

	local var_28_1 = ActivityMusicCfg.get_id_list_by_activity_id[var_28_0]
	local var_28_2 = var_28_1[MusicData:GetDifficultyIndex(var_28_0) + 1] or var_28_1[1]

	if arg_28_0.BGMID == var_28_2 then
		return
	end

	arg_28_0:PlayBg()
end

function var_0_0.Dispose(arg_29_0)
	arg_29_0.list_:Dispose()
	var_0_0.super.Dispose(arg_29_0)
end

return var_0_0
