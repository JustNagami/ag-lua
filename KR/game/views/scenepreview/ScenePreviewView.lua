local var_0_0 = class("ScenePreviewView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/System/Main/SceneChange_new"
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

	arg_4_0.bg_.immediate = true
	arg_4_0.effectTgl_ = {}

	for iter_4_0, iter_4_1 in ipairs(HomeSceneTagCfg.all) do
		arg_4_0.effectTgl_[iter_4_1] = arg_4_0["effectTgl_" .. iter_4_1]
	end

	arg_4_0.btnController_ = arg_4_0.mainControllerEx_:GetController("btn")
	arg_4_0.recommandController_ = arg_4_0.mainControllerEx_:GetController("recommandState")
	arg_4_0.tabController_ = arg_4_0.tabControllerEx_:GetController("tab")
	arg_4_0.setting_ = {
		[HomeSceneSettingConst.SETTING.SOUND_EFFECT] = "sound_effect",
		[HomeSceneSettingConst.SETTING.CAMERA_FOLLOW] = "camera_follow",
		[HomeSceneSettingConst.SETTING.SCENE_BGM] = "scene_bgm"
	}
	arg_4_0.settingBtn_ = {}
	arg_4_0.settingCon_ = {}
	arg_4_0.settingItem_ = {}

	for iter_4_2, iter_4_3 in ipairs(arg_4_0.setting_) do
		arg_4_0.settingBtn_[iter_4_2] = arg_4_0["settingBtn_" .. iter_4_2]
		arg_4_0.settingItem_[iter_4_2] = arg_4_0["settingItem_" .. iter_4_2]

		if arg_4_0.settingItem_[iter_4_2] then
			arg_4_0.settingCon_[iter_4_2] = arg_4_0.settingBtn_[iter_4_2].transform:GetComponent("ControllerExCollection"):GetController("type")
		end
	end

	arg_4_0.sceneScrollHelper_ = LuaList.New(handler(arg_4_0, arg_4_0.SceneIndexItem), arg_4_0.listGo_, ScenePreviewItem)
	arg_4_0.dlcScrollHelper_ = LuaList.New(handler(arg_4_0, arg_4_0.DlcIndexItem), arg_4_0.dlcListGo_, ScenePreviewDlcItem)
end

function var_0_0.SceneIndexItem(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = arg_5_0.sceneList_[arg_5_1]

	arg_5_2:RefreshData(var_5_0, arg_5_0.sceneData_[var_5_0], var_5_0 == arg_5_0.curSceneID_)
	arg_5_2:RegistClickFunc(function()
		arg_5_0:ChangeCurScene(1, var_5_0)
	end)
end

function var_0_0.DlcIndexItem(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = arg_7_0.dlcList_[arg_7_1]

	arg_7_2:RefreshData(var_7_0, arg_7_0.dlcData_[var_7_0], var_7_0 == arg_7_0.curSceneID_)
	arg_7_2:RegistClickFunc(function()
		arg_7_0:ChangeCurScene(2, var_7_0)
	end)
end

function var_0_0.ChangeCurScene(arg_9_0, arg_9_1, arg_9_2)
	arg_9_0.curPage_ = arg_9_1
	arg_9_0.curSceneID_ = arg_9_2

	arg_9_0:RefreshRight()

	if arg_9_1 == 1 then
		arg_9_0.sceneScrollHelper_:Refresh()
	else
		arg_9_0.dlcScrollHelper_:Refresh()
	end
end

function var_0_0.SelectPage(arg_10_0, arg_10_1)
	local var_10_0 = HomeSceneSettingData:GetCurScene()
	local var_10_1 = HomeSceneSettingCfg[var_10_0]

	if arg_10_1 == 1 then
		if var_10_1 and var_10_1.limit_display == 1 then
			arg_10_0:ChangeCurScene(arg_10_1, var_10_0)
		else
			arg_10_0:ChangeCurScene(arg_10_1, arg_10_0.sceneList_[1])
		end
	else
		local var_10_2 = PlayerData:GetPosterGirlHeroId()
		local var_10_3 = HeroTools.HeroUsingSkinInfo(var_10_2).id
		local var_10_4
		local var_10_5

		if var_10_3 and SkinSceneActionCfg[var_10_3] then
			var_10_4 = SkinSceneActionCfg[var_10_3].special_scene_id
		end

		if var_10_4 then
			for iter_10_0, iter_10_1 in ipairs(arg_10_0.dlcList_) do
				if iter_10_1 == var_10_4 then
					var_10_5 = iter_10_0

					break
				end
			end
		end

		if var_10_1 and var_10_1.limit_display == 0 then
			arg_10_0:ChangeCurScene(arg_10_1, var_10_0)
		elseif var_10_4 and var_10_5 then
			arg_10_0:ChangeCurScene(arg_10_1, var_10_4)
		else
			arg_10_0:ChangeCurScene(arg_10_1, arg_10_0.dlcList_[1])
		end
	end
end

function var_0_0.AddUIListeners(arg_11_0)
	arg_11_0:AddBtnListener(arg_11_0.recommandBtn_, nil, function()
		local var_12_0 = arg_11_0.recommandController_:GetSelectedIndex()

		if var_12_0 == 2 then
			return
		end

		if var_12_0 == 1 then
			arg_11_0.recommandController_:SetSelectedIndex(0)
		else
			arg_11_0.recommandController_:SetSelectedIndex(1)
		end
	end)
	arg_11_0:AddBtnListener(arg_11_0.sceneBtn_, nil, function()
		if arg_11_0.curPage_ == 1 then
			return
		end

		arg_11_0.curPage_ = 1

		arg_11_0:SelectPage(1)
		arg_11_0:RefreshUI()
	end)
	arg_11_0:AddBtnListener(arg_11_0.dlcBtn_, nil, function()
		if arg_11_0.curPage_ == 2 then
			return
		end

		if arg_11_0.dlcList_ and #arg_11_0.dlcList_ > 0 then
			arg_11_0.curPage_ = 2

			arg_11_0:SelectPage(2)
			arg_11_0:RefreshUI()
		else
			ShowTips(GetTips("HOME_SCENE_COUNT_INVALID"))
		end
	end)
	arg_11_0:AddBtnListener(arg_11_0.useBtn_, nil, function()
		if arg_11_0.curPage_ == 1 then
			arg_11_0:UseScene(arg_11_0.curSceneID_)
		else
			local var_15_0 = SkinSceneActionCfg.get_id_list_by_special_scene_id[arg_11_0.curSceneID_][1]
			local var_15_1 = SkinCfg[var_15_0].hero

			if var_15_1 and HeroTools.GetHeroIsUnlock(var_15_1) and var_15_0 and HeroTools.GetHasOwnedSkin(var_15_0) then
				if PlayerData:IsRandomHero() then
					ShowMessageBox({
						title = GetTips("PROMPT"),
						content = GetTips("RANDOM_ASSIST_TIPS"),
						OkCallback = function()
							PlayerAction.SetIsRandomHero(false, function()
								return
							end)
							HeroAction.SelectSkin(var_15_1, var_15_0)
							PlayerAction.ChangePosterGirl(var_15_1)
						end
					})
				else
					HeroAction.SelectSkin(var_15_1, var_15_0)
					PlayerAction.ChangePosterGirl(var_15_1)
				end
			end
		end
	end)
	arg_11_0:AddBtnListener(arg_11_0.trialBtn_, nil, function()
		if arg_11_0.curPage_ == 1 then
			arg_11_0:UseScene(arg_11_0.curSceneID_)
		else
			local var_18_0 = SkinSceneActionCfg.get_id_list_by_special_scene_id[arg_11_0.curSceneID_][1]
			local var_18_1 = SkinCfg[var_18_0].hero

			if var_18_1 and HeroTools.GetHeroIsUnlock(var_18_1) and var_18_0 and (HeroTools.GetHasOwnedSkin(var_18_0) or HeroTools.GetIsLimitTimeSkin(var_18_0)) then
				if PlayerData:IsRandomHero() then
					ShowMessageBox({
						title = GetTips("PROMPT"),
						content = GetTips("RANDOM_ASSIST_TIPS"),
						OkCallback = function()
							PlayerAction.SetIsRandomHero(false, function()
								return
							end)
							HeroAction.SelectSkin(var_18_1, var_18_0)
							PlayerAction.ChangePosterGirl(var_18_1)
						end
					})
				else
					HeroAction.SelectSkin(var_18_1, var_18_0)
					PlayerAction.ChangePosterGirl(var_18_1)
				end
			end
		end
	end)
	arg_11_0:AddBtnListener(arg_11_0.getBtn_, nil, function()
		if arg_11_0:IsCanGet() then
			JumpTools.JumpToPage2(arg_11_0.cfg_.obtain_way)
		else
			ShowTips("HOME_NO_GET_WAY")
		end
	end)
	arg_11_0:AddBtnListener(arg_11_0.noGetBtn_, nil, function()
		if arg_11_0.curPage_ == 1 then
			if not arg_11_0:IsCanGet() then
				ShowTips("HOME_NO_GET_WAY")
			end
		else
			local var_22_0 = SkinSceneActionCfg.get_id_list_by_special_scene_id[arg_11_0.curSceneID_][1]
			local var_22_1 = SkinCfg[var_22_0].hero

			if not var_22_1 or not HeroTools.GetHeroIsUnlock(var_22_1) then
				if CharactorParamCfg[var_22_1] then
					ShowTips(GetTipsF("HOME_SCENE_UNAVAILABLE", GetI18NText(CharactorParamCfg[var_22_1].Name)))
				end
			elseif not var_22_0 or not HeroTools.GetHasOwnedSkin(var_22_0) then
				ShowTips(GetTipsF("HOME_SCENE_UNAVAILABLE", GetI18NText(SkinCfg[var_22_0].name)))
			end
		end
	end)
	arg_11_0:AddBtnListener(arg_11_0.previewBtn_, nil, function()
		arg_11_0.params_.sceneID = arg_11_0.curSceneID_

		local var_23_0 = HomeSceneSettingData:SetPreviewScene(arg_11_0.curSceneID_)

		HomeSceneSettingData:SetPreviewSceneParams(var_23_0)
		OpenPageUntilLoaded("/homePreview", var_23_0)
	end)
	arg_11_0:AddBtnListener(arg_11_0.randomSceneBtn_, nil, function()
		JumpTools.GoToSystem("/randomScene", {})
	end)

	for iter_11_0, iter_11_1 in ipairs(arg_11_0.setting_) do
		if arg_11_0.settingBtn_[iter_11_0] then
			arg_11_0:AddBtnListener(arg_11_0.settingBtn_[iter_11_0], nil, function()
				local var_25_0 = "home_scene_" .. iter_11_1
				local var_25_1 = 1 - arg_11_0.settingData_[var_25_0]

				SettingAction.ChangeHomeSceneSetting(var_25_0, var_25_1)
			end)
		end
	end

	for iter_11_2, iter_11_3 in ipairs(HomeSceneTagCfg.all) do
		arg_11_0:AddToggleListener(arg_11_0["effectTgl_" .. iter_11_3], function(arg_26_0)
			if arg_26_0 then
				arg_11_0:AddClickTimer()

				local var_26_0 = HomeSceneTagCfg[iter_11_3]

				arg_11_0.tglTitle_.text = var_26_0.tag_desc
				arg_11_0.tglDesc_.text = var_26_0.tag_detail

				SetActive(arg_11_0.tglPanelGo_, true)
			end
		end)
	end
end

function var_0_0.OnEnter(arg_27_0)
	if arg_27_0.params_._BackFromRandomScene then
		arg_27_0.params_._BackFromRandomScene = nil

		return
	end

	HomeSceneSettingData:DealOverdueScene()

	if arg_27_0.params_.sceneID then
		arg_27_0.curSceneID_ = arg_27_0.params_.sceneID
	else
		arg_27_0.curSceneID_ = HomeSceneSettingData:GetCurScene()
	end

	local var_27_0 = arg_27_0.curSceneID_ or HomeSceneSettingData:GetCurScene()
	local var_27_1 = HomeSceneSettingCfg[var_27_0]

	if not id and HomeSceneSettingData:GetUsedState(var_27_0) == SceneConst.HOME_SCENE_TYPE.LOCK then
		local var_27_2 = GameSetting.home_sence_default.value[1]
		local var_27_3 = HomeSceneSettingCfg[var_27_2]

		HomeSceneSettingAction.SetHomeScene(var_27_2)

		arg_27_0.curSceneID_ = var_27_2
	end

	arg_27_0.curPage_ = 1

	local var_27_4 = HomeSceneSettingCfg[arg_27_0.curSceneID_]

	if var_27_4 and var_27_4.limit_display == 0 then
		arg_27_0.curPage_ = 2
	end

	arg_27_0:RefreshUI()
end

function var_0_0.RefreshUI(arg_28_0)
	arg_28_0:RefreshList()
	arg_28_0:RefreshRight()
end

function var_0_0.RefreshList(arg_29_0)
	arg_29_0.sceneData_ = {}
	arg_29_0.sceneList_ = {}

	for iter_29_0, iter_29_1 in ipairs(HomeSceneSettingCfg.all) do
		if HomeSceneSettingCfg[iter_29_1].limit_display == 1 then
			table.insert(arg_29_0.sceneList_, iter_29_1)

			local var_29_0 = HomeSceneSettingData:GetUsedState(iter_29_1)

			arg_29_0.sceneData_[iter_29_1] = var_29_0
		end
	end

	table.sort(arg_29_0.sceneList_, function(arg_30_0, arg_30_1)
		if arg_29_0.sceneData_[arg_30_0] ~= arg_29_0.sceneData_[arg_30_1] then
			return arg_29_0.sceneData_[arg_30_0] > arg_29_0.sceneData_[arg_30_1]
		end

		return arg_30_0 < arg_30_1
	end)
	arg_29_0.sceneScrollHelper_:StartScroll(#arg_29_0.sceneList_, table.indexof(arg_29_0.sceneList_, arg_29_0.curSceneID_))

	arg_29_0.dlcData_ = {}
	arg_29_0.dlcList_ = {}

	for iter_29_2, iter_29_3 in pairs(SkinSceneActionCfg.get_id_list_by_special_scene_id) do
		if HomeSceneSettingCfg[iter_29_2].limit_display == 0 and (ShopTools.CheckDlcPurchasedByItemID(iter_29_2) or ShopTools.CheckDlcTrialByItemID(iter_29_2)) then
			local var_29_1 = iter_29_3[1]

			table.insert(arg_29_0.dlcList_, iter_29_2)

			local var_29_2 = 0
			local var_29_3 = SkinCfg[var_29_1].hero

			if var_29_3 and HeroTools.GetHeroIsUnlock(var_29_3) and var_29_1 and HeroTools.GetHasOwnedSkin(var_29_1) then
				var_29_2 = 2
			end

			if var_29_3 and HeroTools.GetHeroIsUnlock(var_29_3) and ShopTools.CheckDlcTrialByItemID(iter_29_2) then
				var_29_2 = 1
			end

			arg_29_0.dlcData_[iter_29_2] = var_29_2
		end
	end

	CommonTools.UniversalSortEx(arg_29_0.dlcList_, {
		map = function(arg_31_0)
			local var_31_0 = SkinSceneActionCfg.get_id_list_by_special_scene_id[arg_31_0][1]
			local var_31_1 = SkinCfg[var_31_0].hero

			if var_31_1 and HeroTools.GetHeroIsUnlock(var_31_1) and var_31_0 and (HeroTools.GetHasOwnedSkin(var_31_0) or HeroTools.GetIsLimitTimeSkin(var_31_0)) then
				return 1
			end

			return 0
		end
	}, {
		map = function(arg_32_0)
			return arg_32_0
		end
	})
	arg_29_0.dlcScrollHelper_:StartScroll(#arg_29_0.dlcList_, table.indexof(arg_29_0.dlcList_, arg_29_0.curSceneID_))
end

function var_0_0.RefreshRight(arg_33_0)
	arg_33_0.tabController_:SetSelectedIndex(arg_33_0.curPage_ - 1)

	arg_33_0.cfg_ = HomeSceneSettingCfg[arg_33_0.curSceneID_]
	arg_33_0.title_.text = arg_33_0.cfg_.title
	arg_33_0.desc_.text = arg_33_0.cfg_.desc

	if arg_33_0.curPage_ == 1 then
		arg_33_0.bg_.spriteSync = "TextureConfig/SceneChangeUI/bg/" .. arg_33_0.curSceneID_

		SetActive(arg_33_0.randomSceneBtn_.transform, true)
	else
		local var_33_0 = SkinSceneActionCfg.get_id_list_by_special_scene_id[arg_33_0.curSceneID_][1]

		arg_33_0.bg_.spriteSync = "TextureConfig/Character/PortraitDLC/" .. var_33_0

		SetActive(arg_33_0.randomSceneBtn_.transform, false)
	end

	arg_33_0:ResetTgl()
	arg_33_0:RefreshSetting()
	arg_33_0:RefreshType()
	arg_33_0:RefreshRedPoint()
end

function var_0_0.ResetTgl(arg_34_0)
	arg_34_0:HideMessage()

	local var_34_0 = arg_34_0.cfg_.scene_tag

	for iter_34_0, iter_34_1 in ipairs(HomeSceneTagCfg.all) do
		if arg_34_0["effectGo_" .. iter_34_1] then
			if table.indexof(var_34_0, iter_34_1) then
				SetActive(arg_34_0["effectGo_" .. iter_34_1], true)
			else
				SetActive(arg_34_0["effectGo_" .. iter_34_1], false)
			end

			arg_34_0["effectTgl_" .. iter_34_1].isOn = false
		end
	end

	if arg_34_0.cfg_.scene_tag == "" or #arg_34_0.cfg_.scene_tag == 0 then
		arg_34_0.recommandController_:SetSelectedIndex(2)
	else
		arg_34_0.recommandController_:SetSelectedIndex(1)
	end
end

function var_0_0.HideMessage(arg_35_0)
	SetActive(arg_35_0.tglPanelGo_, false)
end

function var_0_0.RefreshSetting(arg_36_0)
	local var_36_0 = arg_36_0.cfg_.scene_setting

	for iter_36_0, iter_36_1 in ipairs(arg_36_0.setting_) do
		if table.indexof(var_36_0, iter_36_0) then
			SetActive(arg_36_0.settingItem_[iter_36_0], true)
		else
			SetActive(arg_36_0.settingItem_[iter_36_0], false)
		end
	end

	arg_36_0.settingData_ = SettingData:GetHomeSceneSettingData()

	arg_36_0:RefreshSoundEffect()
	arg_36_0:RefreshSceneBgm()
end

function var_0_0.RefreshSoundEffect(arg_37_0)
	local var_37_0 = arg_37_0.settingData_.home_scene_sound_effect == 1

	arg_37_0.settingCon_[1]:SetSelectedState(var_37_0 and "on" or "off")
end

function var_0_0.RefreshSceneBgm(arg_38_0)
	local var_38_0 = arg_38_0.settingData_.home_scene_scene_bgm == 1

	arg_38_0.settingCon_[HomeSceneSettingConst.SETTING.SCENE_BGM]:SetSelectedState(var_38_0 and "on" or "off")
end

function var_0_0.RefreshType(arg_39_0)
	arg_39_0:StopTimer()

	if arg_39_0.curPage_ == 1 then
		local var_39_0 = arg_39_0.sceneData_[arg_39_0.curSceneID_]
		local var_39_1 = HomeSceneSettingData:GetCurScene()

		if var_39_0 == 0 then
			local var_39_2 = arg_39_0:IsCanGet()

			arg_39_0.btnController_:SetSelectedState(var_39_2 and "get" or "ban")

			arg_39_0.tip_.text = GetI18NText(arg_39_0.cfg_.unlock_description)
			arg_39_0.banText_.text = GetI18NText(arg_39_0.cfg_.unlock_description)
		elseif var_39_0 == 1 then
			arg_39_0.btnController_:SetSelectedState(arg_39_0.curSceneID_ == var_39_1 and "trialing" or "trial")
			arg_39_0:RefreshTime()
		elseif var_39_0 == 2 then
			arg_39_0.btnController_:SetSelectedState(arg_39_0.curSceneID_ == var_39_1 and "using" or "use")
		end
	else
		local var_39_3 = arg_39_0.dlcData_[arg_39_0.curSceneID_]
		local var_39_4 = HomeSceneSettingData:GetCurScene()

		if var_39_3 == 0 then
			arg_39_0.btnController_:SetSelectedState("ban")

			local var_39_5 = SkinSceneActionCfg.get_id_list_by_special_scene_id[arg_39_0.curSceneID_][1]
			local var_39_6 = SkinCfg[var_39_5].hero

			if not var_39_6 or not HeroTools.GetHeroIsUnlock(var_39_6) then
				if CharactorParamCfg[var_39_6] then
					arg_39_0.banText_.text = GetTipsF("HOME_SCENE_UNAVAILABLE", GetI18NText(CharactorParamCfg[var_39_6].Name))
				end
			elseif not var_39_5 or not HeroTools.GetHasOwnedSkin(var_39_5) then
				arg_39_0.banText_.text = GetTipsF("HOME_SCENE_UNAVAILABLE", GetI18NText(SkinCfg[var_39_5].name))
			end
		elseif var_39_3 == 1 then
			arg_39_0.btnController_:SetSelectedState(arg_39_0.curSceneID_ == var_39_4 and "trialing" or "trial")
			arg_39_0:RefreshTime()
		elseif var_39_3 == 2 then
			arg_39_0.btnController_:SetSelectedState(arg_39_0.curSceneID_ == var_39_4 and "using" or "use")
		end
	end

	LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_0.tglContent_)
	LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_0.tglContent_)
end

function var_0_0.IsCanGet(arg_40_0)
	local var_40_0 = arg_40_0.cfg_.obtain_way

	return arg_40_0.cfg_.obtain_way and #arg_40_0.cfg_.obtain_way > 0 and not JumpTools.NeedHide(var_40_0, arg_40_0.curSceneID_) and not JumpTools.GetLinkIsLocked(arg_40_0.cfg_.obtain_way)
end

function var_0_0.RefreshTime(arg_41_0)
	arg_41_0:StopTimer()

	local var_41_0 = manager.time:GetServerTime()
	local var_41_1 = HomeSceneSettingData:GetSceneTimeStamp(arg_41_0.curSceneID_)

	arg_41_0.time_.text = string.format(GetTips("TIME_DISPLAY_12"), TimeMgr.GetInstance():STimeDescS(var_41_1, "!%Y/%m/%d %H:%M"))
	arg_41_0.timer_ = Timer.New(function()
		if var_41_1 and var_41_0 <= var_41_1 then
			arg_41_0.time_.text = string.format(GetTips("TIME_DISPLAY_12"), TimeMgr.GetInstance():STimeDescS(var_41_1, "!%Y/%m/%d %H:%M"))
		else
			HomeSceneSettingAction.SetHomeScene(GameSetting.home_sence_default.value[1])

			arg_41_0.curSceneID_ = HomeSceneSettingData:GetCurScene()

			local var_42_0 = HomeSceneSettingCfg[arg_41_0.curSceneID_]

			if var_42_0 and var_42_0.limit_display == 0 then
				arg_41_0.curPage_ = 2
			else
				arg_41_0.curPage_ = 1
			end

			arg_41_0:RefreshUI()
		end
	end, 1, -1)

	arg_41_0.timer_:Start()
end

function var_0_0.RefreshRedPoint(arg_43_0)
	local var_43_0 = arg_43_0.curSceneID_

	saveData("scene", tostring(var_43_0), 0)
	manager.redPoint:setTip(RedPointConst.SCENE .. "_" .. var_43_0, 0)
end

function var_0_0.StopTimer(arg_44_0)
	if arg_44_0.timer_ then
		arg_44_0.timer_:Stop()

		arg_44_0.timer_ = nil
	end
end

function var_0_0.AddClickTimer(arg_45_0)
	arg_45_0:StopClickTimer()

	arg_45_0.buttonUp_ = 0
	arg_45_0.clickTimer_ = FuncTimerManager.inst:CreateFuncFrameTimer(function()
		if Input.GetMouseButtonUp(0) then
			arg_45_0.buttonUp_ = arg_45_0.buttonUp_ + 1

			if arg_45_0.buttonUp_ >= 2 then
				for iter_46_0, iter_46_1 in ipairs(HomeSceneTagCfg.all) do
					if arg_45_0["effectTgl_" .. iter_46_1] then
						arg_45_0["effectTgl_" .. iter_46_1].isOn = false
					end
				end

				arg_45_0:HideMessage()

				if arg_45_0.clickTimer_ then
					FuncTimerManager.inst:RemoveFuncTimer(arg_45_0.clickTimer_)

					arg_45_0.clickTimer_ = nil
				end
			end
		end
	end, -1, true)
end

function var_0_0.StopClickTimer(arg_47_0)
	if arg_47_0.clickTimer_ then
		FuncTimerManager.inst:RemoveFuncTimer(arg_47_0.clickTimer_)

		arg_47_0.clickTimer_ = nil
	end
end

function var_0_0.CheckPlayBgm(arg_48_0)
	local var_48_0 = HomeSceneSettingData:GetCurScene()
	local var_48_1 = HomeSceneSettingCfg[var_48_0]
	local var_48_2 = var_48_1.scene_setting
	local var_48_3 = var_48_1.default_music

	if var_48_3 ~= 0 and arg_48_0.settingData_.home_scene_scene_bgm == 1 and table.indexof(var_48_2, HomeSceneSettingConst.SETTING.SCENE_BGM) then
		IllustratedAction.QuerySetBgm(var_48_3)
	end
end

function var_0_0.OnHomeSceneChange(arg_49_0)
	arg_49_0:RefreshUI()
end

function var_0_0.OnChangePosterGirl(arg_50_0)
	arg_50_0:RefreshUI()
end

function var_0_0.OnHomeSceneSettingChange(arg_51_0, arg_51_1, arg_51_2)
	if arg_51_2.key == "allData" then
		arg_51_0:RefreshSoundEffect()
	elseif arg_51_2.key == "home_scene_sound_effect" then
		arg_51_0:RefreshSoundEffect()
	elseif arg_51_2.key == "home_scene_camera_follow" then
		-- block empty
	elseif arg_51_2.key == "home_scene_scene_bgm" then
		arg_51_0:RefreshSceneBgm()
	end
end

function var_0_0.OnTop(arg_52_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR
	})
	manager.windowBar:RegistBackCallBack(function()
		gameContext:Go("/home", nil, nil, true)
	end)
end

function var_0_0.OnExit(arg_54_0)
	arg_54_0:StopTimer()

	for iter_54_0, iter_54_1 in ipairs(arg_54_0.sceneScrollHelper_:GetItemList()) do
		iter_54_1:OnExit()
	end

	for iter_54_2, iter_54_3 in ipairs(arg_54_0.dlcScrollHelper_:GetItemList()) do
		iter_54_3:OnExit()
	end

	manager.windowBar:HideBar()
end

function var_0_0.UseScene(arg_55_0, arg_55_1)
	if HomeSceneSettingData:IsRandomScene() then
		ShowMessageBox({
			title = GetTips("PROMPT"),
			content = GetTips("RANDOM_SCENE_TIPS"),
			OkCallback = function()
				HomeSceneSettingAction.SetIsRandomScene(false, function()
					return
				end)
				HomeSceneSettingAction.SetHomeScene(arg_55_1)
			end
		})
	else
		local var_55_0 = HomeSceneSettingCfg[arg_55_1]

		if var_55_0 and var_55_0.limit_display == 1 and PlayerData:IsRandomHero() and PlayerData:IsRandomHeroUseDlcScene() then
			HomeSceneSettingData:SetIsUseDlcScene(false)
		end

		if HomeSceneSettingData:GetCurScene() == arg_55_1 then
			arg_55_0:RefreshUI()
		end

		HomeSceneSettingAction.SetHomeScene(arg_55_1)
	end

	if PosterGirlTools.SceneHasTimeEffect(arg_55_1) then
		HomeSceneSettingData:SetIsTimeScene(false)
	end
end

function var_0_0.Dispose(arg_58_0)
	arg_58_0:RemoveAllListeners()

	if arg_58_0.sceneScrollHelper_ then
		arg_58_0.sceneScrollHelper_:Dispose()

		arg_58_0.sceneScrollHelper_ = nil
	end

	if arg_58_0.dlcScrollHelper_ then
		arg_58_0.dlcScrollHelper_:Dispose()

		arg_58_0.dlcScrollHelper_ = nil
	end

	var_0_0.super.Dispose(arg_58_0)
end

return var_0_0
