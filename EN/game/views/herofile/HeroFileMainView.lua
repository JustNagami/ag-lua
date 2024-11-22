local var_0_0 = class("HeroFileMainView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/System/Hero_files/HeroFileMainUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:InitUI()
	arg_3_0:AddUIListeners()
end

function var_0_0.InitUI(arg_4_0)
	arg_4_0:BindCfgUI()

	arg_4_0.curHeroID_ = 0
	arg_4_0.curRecordID_ = 0
	arg_4_0.roleIndex_ = 0
	arg_4_0.roleTabs_ = {}
	arg_4_0.roleList_ = {}
	arg_4_0.curPageIndex_ = 0
	arg_4_0.subPages_ = {}
	arg_4_0.subPageIndex_ = {
		Archive = 2,
		Information = 1,
		Voice = 4,
		Gift = 3
	}
	arg_4_0.subPagePrefabPath_ = {
		"Widget/System/Hero_files/HeroFileInformationPageUI",
		"Widget/System/Hero_files/HeroFileArchivePageUI",
		"Widget/System/Hero_files/HeroFileGiftPageUI",
		"Widget/System/Hero_files/HeroFileVoicePageUI"
	}
	arg_4_0.subPageClass_ = {
		HeroFileInformationPage,
		HeroFileArchivePage,
		HeroFileGiftPage,
		HeroFileVoicePage
	}
	arg_4_0.subPageTab_ = {
		arg_4_0.informationBtn_,
		arg_4_0.archiveBtn_,
		arg_4_0.giftBtn_,
		arg_4_0.voiceBtn_
	}
	arg_4_0.subPageTabState_ = {
		"Information",
		"Archive",
		"Gift",
		"Voice"
	}
	arg_4_0.tipsLuaUIlist_ = LuaList.New(handler(arg_4_0, arg_4_0.IndexTipsItem), arg_4_0.tipsUIlist_, HeroFileMainTipsItem)
	arg_4_0.subPageTabController_ = arg_4_0.tablistControllerEx_:GetController("tabSelect")
	arg_4_0.favorabilityController_ = arg_4_0.FavorabilityControllerEx_:GetController("favorability")
end

function var_0_0.AddUIListeners(arg_5_0)
	for iter_5_0, iter_5_1 in ipairs(arg_5_0.subPageTab_) do
		arg_5_0:AddBtnListener(iter_5_1, nil, function()
			arg_5_0:SwitchPage(iter_5_0)
		end)
	end

	arg_5_0:AddBtnListener(arg_5_0.FavorabilityBtn_, nil, function()
		arg_5_0:ShowFavorabilityTips()
	end)
	arg_5_0:AddBtnListener(arg_5_0.tipsCloseBtn_, nil, function()
		arg_5_0:HideFavorabilityTips()
	end)
end

function var_0_0.OnEnter(arg_9_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR
	})

	arg_9_0.curHeroID_ = arg_9_0.params_.heroID
	arg_9_0.curRecordID_ = HeroTools.GetHeroOntologyID(arg_9_0.curHeroID_)
	arg_9_0.curPageIndex_ = 0

	arg_9_0:RefreshRoleTab()
	arg_9_0:UpdateAvatarView()
	arg_9_0:RefreshCV()
	arg_9_0:SwitchPage(arg_9_0.params_.pageID or 1)
	arg_9_0:RefreshFavorabilityIcon()
	ArchiveAction.CheckHeroTrustUpLvRedPoint(arg_9_0.curHeroID_)
	arg_9_0:RegistEventListener(HERO_DATA_MODIFY, handler(arg_9_0, arg_9_0.OnHeroModify))
	manager.redPoint:bindUIandKey(arg_9_0.informationTrs_, string.format("%s_%s", RedPointConst.HERO_REALTION, arg_9_0.curHeroID_))
	manager.redPoint:bindUIandKey(arg_9_0.archiveTrs_, RedPointConst.HERO_HEARTLINK_ID .. arg_9_0.curRecordID_)
	manager.redPoint:bindUIandKey(arg_9_0.giftTrs_, string.format("%s_%s", RedPointConst.HERO_TRUST_UP_LEVEL, arg_9_0.curHeroID_))
end

function var_0_0.CameraEnter(arg_10_0)
	manager.heroRaiseTrack:SetViewState(HeroRaiseTrackConst.ViewType.heroRaiseCommon, {
		1,
		3
	})
end

function var_0_0.OnExit(arg_11_0)
	manager.windowBar:HideBar()
	manager.ui:ResetMainCamera()
	arg_11_0:HideFavorabilityTips()
	arg_11_0:RemoveAllEventListener()
	manager.redPoint:unbindUIandKey(arg_11_0.informationTrs_)
	manager.redPoint:unbindUIandKey(arg_11_0.archiveTrs_)
	manager.redPoint:unbindUIandKey(arg_11_0.giftTrs_)

	if arg_11_0.subPages_[arg_11_0.curPageIndex_] then
		arg_11_0.subPages_[arg_11_0.curPageIndex_]:Hide()
	end

	arg_11_0.curPageIndex_ = 0
	arg_11_0.params_.heroID = arg_11_0.curHeroID_

	HeroTools.StopTalk()
end

function var_0_0.IndexTipsItem(arg_12_0, arg_12_1, arg_12_2)
	arg_12_2:SetData(arg_12_1, arg_12_0.curHeroID_)
end

function var_0_0.SwitchPage(arg_13_0, arg_13_1)
	if arg_13_1 == arg_13_0.subPageIndex_.Voice and not HeroTools.GetHeroIsUnlock(arg_13_0.curHeroID_) then
		ShowTips("ERROR_HERO_NOT_UNLOCK")

		return
	end

	if arg_13_1 == arg_13_0.curPageIndex_ then
		return
	end

	if arg_13_0.subPages_[arg_13_0.curPageIndex_] then
		arg_13_0.subPages_[arg_13_0.curPageIndex_]:Hide()
	end

	arg_13_0.subPageTabController_:SetSelectedState(arg_13_0.subPageTabState_[arg_13_1])

	if not arg_13_0.subPages_[arg_13_1] then
		local var_13_0 = Asset.Load(arg_13_0.subPagePrefabPath_[arg_13_1])
		local var_13_1 = Object.Instantiate(var_13_0, arg_13_0.pagecontentTrs_)

		arg_13_0.subPages_[arg_13_1] = arg_13_0.subPageClass_[arg_13_1].New(var_13_1, function(arg_14_0)
			arg_13_0:RefreshFavorabilityIcon(arg_14_0)
		end)
	end

	arg_13_0.subPages_[arg_13_1]:Show(arg_13_0.curRecordID_, arg_13_0.curHeroID_)

	arg_13_0.curPageIndex_ = arg_13_1
	arg_13_0.params_.pageID = arg_13_1
end

function var_0_0.RefreshFavorabilityIcon(arg_15_0, arg_15_1)
	local var_15_0 = {
		"Ⅰ",
		"Ⅱ",
		"Ⅲ",
		"Ⅳ",
		"Ⅴ",
		"Ⅵ",
		"Ⅶ",
		"Ⅷ",
		"Ⅸ"
	}

	if arg_15_1 then
		arg_15_0.likeLvText_.text = var_15_0[arg_15_1]
	else
		local var_15_1 = ArchiveData:GetTrustLevel(arg_15_0.curHeroID_)

		if var_15_1 > 0 then
			arg_15_0.favorabilityController_:SetSelectedState("Trust")

			arg_15_0.trustLvText_.text = ArchiveTools.GetTrustLvDes(var_15_1)
		else
			arg_15_0.favorabilityController_:SetSelectedState("Like")

			local var_15_2 = LvTools.LoveExpToLevel(ArchiveData:GetArchive(arg_15_0.curRecordID_).exp)

			arg_15_0.likeLvText_.text = var_15_0[var_15_2]
		end
	end
end

function var_0_0.RefreshRoleTab(arg_16_0)
	arg_16_0.roleList_ = {}

	for iter_16_0, iter_16_1 in ipairs(HeroRecordCfg[arg_16_0.curRecordID_].hero_id) do
		if HeroCfg[iter_16_1].private ~= 1 and not HeroTools.GetIsHide(iter_16_1) then
			table.insert(arg_16_0.roleList_, iter_16_1)
		end
	end

	for iter_16_2 = 1, #arg_16_0.roleTabs_ do
		arg_16_0.roleTabs_[iter_16_2]:Hide()
		arg_16_0.roleTabs_[iter_16_2]:SetSelectState(false)
	end

	for iter_16_3 = 1, #arg_16_0.roleList_ do
		if not arg_16_0.roleTabs_[iter_16_3] then
			local var_16_0 = Object.Instantiate(arg_16_0.heroItemGo_, arg_16_0.heroTabTrs_)

			arg_16_0.roleTabs_[iter_16_3] = HeroFileRoleTabItem.New(var_16_0, function()
				arg_16_0:OnClickRoleTab(iter_16_3)
			end)
		end

		arg_16_0.roleTabs_[iter_16_3]:Show(arg_16_0.roleList_[iter_16_3])

		if arg_16_0.roleList_[iter_16_3] == arg_16_0.curHeroID_ then
			arg_16_0.roleTabs_[iter_16_3]:SetSelectState(true)

			arg_16_0.roleIndex_ = iter_16_3
		end
	end
end

function var_0_0.RefreshCV(arg_18_0)
	local var_18_0 = SettingData:GetSoundSettingData().voice_language
	local var_18_1 = VoiceLanguageCfg[var_18_0].affix

	arg_18_0.cvText_.text = "CV " .. (GetI18NText(HeroRecordCfg[arg_18_0.curRecordID_]["cv_" .. var_18_1]) or "")
end

function var_0_0.OnClickRoleTab(arg_19_0, arg_19_1)
	if arg_19_0.curPageIndex_ == arg_19_0.subPageIndex_.Voice and not HeroTools.GetHeroIsUnlock(arg_19_0.roleList_[arg_19_1]) then
		ShowTips("ERROR_HERO_NOT_UNLOCK")

		return
	end

	if arg_19_1 == arg_19_0.roleIndex_ then
		return
	end

	if arg_19_0.roleTabs_[arg_19_0.roleIndex_] then
		arg_19_0.roleTabs_[arg_19_0.roleIndex_]:SetSelectState(false)
	end

	arg_19_0.roleTabs_[arg_19_1]:SetSelectState(true)

	arg_19_0.roleIndex_ = arg_19_1
	arg_19_0.curHeroID_ = arg_19_0.roleList_[arg_19_1]

	arg_19_0.subPages_[arg_19_0.curPageIndex_]:Show(arg_19_0.curRecordID_, arg_19_0.curHeroID_)
	arg_19_0:RefreshFavorabilityIcon()
	arg_19_0:UpdateAvatarView()
	ArchiveAction.CheckHeroTrustUpLvRedPoint(arg_19_0.curHeroID_)
	manager.redPoint:bindUIandKey(arg_19_0.informationTrs_, string.format("%s_%s", RedPointConst.HERO_REALTION, arg_19_0.curHeroID_))
	manager.redPoint:bindUIandKey(arg_19_0.giftTrs_, string.format("%s_%s", RedPointConst.HERO_TRUST_UP_LEVEL, arg_19_0.curHeroID_))
	OperationRecorder.Record("hero", "hero_record_switch")
end

function var_0_0.UpdateAvatarView(arg_20_0)
	local var_20_0 = HeroTools.HeroUsingSkinInfo(arg_20_0.curHeroID_).id

	manager.heroRaiseTrack:SetModelState(var_20_0)
end

function var_0_0.ShowFavorabilityTips(arg_21_0)
	if ArchiveData:GetTrustLevel(arg_21_0.curHeroID_) > 0 then
		arg_21_0.tipsLuaUIlist_:StartScroll(HeroConst.HERO_TRUST_LV_MAX)
		SetActive(arg_21_0.FavorabilityTipsGo_, true)
	end
end

function var_0_0.HideFavorabilityTips(arg_22_0)
	SetActive(arg_22_0.FavorabilityTipsGo_, false)
end

function var_0_0.OnHeroTrustUpdate(arg_23_0)
	if arg_23_0.subPages_[arg_23_0.subPageIndex_.Gift] then
		arg_23_0.subPages_[arg_23_0.subPageIndex_.Gift]:OnHeroTrustUpdate()
	end

	arg_23_0:RefreshFavorabilityIcon()
end

function var_0_0.OnSendGift(arg_24_0, arg_24_1, arg_24_2)
	if arg_24_0.subPages_[arg_24_0.subPageIndex_.Gift] then
		arg_24_0.subPages_[arg_24_0.subPageIndex_.Gift]:OnSendGift()
	end

	arg_24_0:RefreshFavorabilityIcon()
end

function var_0_0.OnHeroModify(arg_25_0)
	if arg_25_0.subPages_[arg_25_0.subPageIndex_.Gift] then
		arg_25_0.subPages_[arg_25_0.subPageIndex_.Gift]:OnHeroModify()
	end
end

function var_0_0.Dispose(arg_26_0)
	for iter_26_0, iter_26_1 in pairs(arg_26_0.subPages_) do
		iter_26_1:Dispose()
	end

	for iter_26_2, iter_26_3 in pairs(arg_26_0.roleTabs_) do
		iter_26_3:Dispose()
	end

	arg_26_0.tipsLuaUIlist_:Dispose()
	var_0_0.super.Dispose(arg_26_0)
end

return var_0_0
