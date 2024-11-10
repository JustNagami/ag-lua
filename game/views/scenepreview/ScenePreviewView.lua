local var_0_0 = class("ScenePreviewView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/System/Main/SceneChange1"
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

	arg_4_0.effectTgl_ = {}

	for iter_4_0, iter_4_1 in ipairs(HomeSceneTagCfg.all) do
		arg_4_0.effectTgl_[iter_4_1] = arg_4_0["effectTgl_" .. iter_4_1]
	end

	arg_4_0.btnCon_ = ControllerUtil.GetController(arg_4_0.transform_, "btn")
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
		arg_4_0.settingCon_[iter_4_2] = ControllerUtil.GetController(arg_4_0.settingItem_[iter_4_2].transform, "type")
	end

	arg_4_0.scrollHelper_ = LuaList.New(handler(arg_4_0, arg_4_0.IndexItem), arg_4_0.listGo_, ScenePreviewItem)
end

function var_0_0.IndexItem(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = arg_5_0.list_[arg_5_1]

	arg_5_2:RefreshData(var_5_0, arg_5_0.data_[var_5_0], var_5_0 == arg_5_0.curSceneID_)
	arg_5_2:RegistClickFunc(function()
		arg_5_0.curSceneID_ = var_5_0

		arg_5_0:RefreshRight()
		arg_5_0.scrollHelper_:Refresh()
	end)
end

function var_0_0.AddUIListeners(arg_7_0)
	arg_7_0:AddBtnListener(arg_7_0.useBtn_, nil, function()
		HomeSceneSettingAction.SetHomeScene(arg_7_0.curSceneID_)
	end)
	arg_7_0:AddBtnListener(arg_7_0.trialBtn_, nil, function()
		HomeSceneSettingAction.SetHomeScene(arg_7_0.curSceneID_)
	end)
	arg_7_0:AddBtnListener(arg_7_0.getBtn_, nil, function()
		if arg_7_0:IsCanGet() then
			JumpTools.JumpToPage2(arg_7_0.cfg_.obtain_way)
		else
			ShowTips("HOME_NO_GET_WAY")
		end
	end)
	arg_7_0:AddBtnListener(arg_7_0.noGetBtn_, nil, function()
		if not arg_7_0:IsCanGet() then
			ShowTips("HOME_NO_GET_WAY")
		end
	end)
	arg_7_0:AddBtnListener(arg_7_0.previewBtn_, nil, function()
		arg_7_0.params_.sceneID = arg_7_0.curSceneID_

		local var_12_0 = HomeSceneSettingData:SetPreviewScene(arg_7_0.curSceneID_)

		HomeSceneSettingData:SetPreviewSceneParams(var_12_0)
		OpenPageUntilLoaded("/homePreview", var_12_0)
	end)

	for iter_7_0, iter_7_1 in ipairs(arg_7_0.setting_) do
		arg_7_0:AddBtnListener(arg_7_0.settingBtn_[iter_7_0], nil, function()
			local var_13_0 = "home_scene_" .. iter_7_1
			local var_13_1 = 1 - arg_7_0.settingData_[var_13_0]

			SettingAction.ChangeHomeSceneSetting(var_13_0, var_13_1)
		end)
	end

	for iter_7_2, iter_7_3 in ipairs(HomeSceneTagCfg.all) do
		arg_7_0:AddToggleListener(arg_7_0["effectTgl_" .. iter_7_3], function(arg_14_0)
			if arg_14_0 then
				arg_7_0:AddClickTimer()

				local var_14_0 = HomeSceneTagCfg[iter_7_3]

				arg_7_0.tglTitle_.text = var_14_0.tag_desc
				arg_7_0.tglDesc_.text = var_14_0.tag_detail

				arg_7_0.tglPanelGo_.transform:SetParent(arg_7_0["effectTgl_" .. iter_7_3].transform)

				arg_7_0.tglPanelGo_.transform:GetComponent("RectTransform").anchoredPosition = Vector3.New(0, 60, 0)

				SetActive(arg_7_0.tglPanelGo_, true)
			end
		end)
	end
end

function var_0_0.OnEnter(arg_15_0)
	HomeSceneSettingData:DealOverdueScene()

	arg_15_0.curSceneID_ = arg_15_0.params_.sceneID

	local var_15_0 = HomeSceneSettingCfg[arg_15_0.curSceneID_]

	if var_15_0 and var_15_0.limit_display == 0 then
		arg_15_0.curSceneID_ = 6000
	end

	arg_15_0:RefreshUI()
end

function var_0_0.RefreshUI(arg_16_0)
	arg_16_0:RefreshList()
	arg_16_0:RefreshRight()
end

function var_0_0.RefreshList(arg_17_0)
	arg_17_0.data_ = {}
	arg_17_0.list_ = {}

	for iter_17_0, iter_17_1 in ipairs(HomeSceneSettingCfg.all) do
		if HomeSceneSettingCfg[iter_17_1].limit_display == 1 then
			table.insert(arg_17_0.list_, iter_17_1)

			local var_17_0 = HomeSceneSettingData:GetUsedState(iter_17_1)

			arg_17_0.data_[iter_17_1] = var_17_0
		end
	end

	table.sort(arg_17_0.list_, function(arg_18_0, arg_18_1)
		if arg_17_0.data_[arg_18_0] ~= arg_17_0.data_[arg_18_1] then
			return arg_17_0.data_[arg_18_0] > arg_17_0.data_[arg_18_1]
		end

		return arg_18_0 < arg_18_1
	end)
	arg_17_0.scrollHelper_:StartScroll(#arg_17_0.list_, table.indexof(arg_17_0.list_, arg_17_0.curSceneID_))
end

function var_0_0.RefreshRight(arg_19_0)
	arg_19_0.cfg_ = HomeSceneSettingCfg[arg_19_0.curSceneID_]
	arg_19_0.title_.text = arg_19_0.cfg_.title
	arg_19_0.desc_.text = arg_19_0.cfg_.desc
	arg_19_0.bg_.sprite = getSpriteWithoutAtlas("TextureConfig/SceneChangeUI/bg/" .. arg_19_0.curSceneID_)

	arg_19_0:ResetTgl()
	arg_19_0:RefreshSetting()
	arg_19_0:RefreshType()
	arg_19_0:RefreshRedPoint()
end

function var_0_0.ResetTgl(arg_20_0)
	arg_20_0:HideMessage()

	local var_20_0 = arg_20_0.cfg_.scene_tag

	for iter_20_0, iter_20_1 in ipairs(HomeSceneTagCfg.all) do
		if arg_20_0["effectTgl_" .. iter_20_1] then
			if table.indexof(var_20_0, iter_20_1) then
				SetActive(arg_20_0["effectTgl_" .. iter_20_1].gameObject, true)
			else
				SetActive(arg_20_0["effectTgl_" .. iter_20_1].gameObject, false)
			end

			arg_20_0["effectTgl_" .. iter_20_1].isOn = false
		end
	end
end

function var_0_0.HideMessage(arg_21_0)
	SetActive(arg_21_0.tglPanelGo_, false)
end

function var_0_0.RefreshSetting(arg_22_0)
	local var_22_0 = arg_22_0.cfg_.scene_setting

	for iter_22_0, iter_22_1 in ipairs(arg_22_0.setting_) do
		if table.indexof(var_22_0, iter_22_0) then
			SetActive(arg_22_0.settingItem_[iter_22_0], true)
		else
			SetActive(arg_22_0.settingItem_[iter_22_0], false)
		end
	end

	arg_22_0.settingData_ = SettingData:GetHomeSceneSettingData()

	arg_22_0:RefreshSoundEffect()
	arg_22_0:RefreshSceneBgm()
end

function var_0_0.RefreshSoundEffect(arg_23_0)
	local var_23_0 = arg_23_0.settingData_.home_scene_sound_effect == 1

	arg_23_0.settingCon_[1]:SetSelectedState(var_23_0 and "on" or "off")
end

function var_0_0.RefreshCameraFollow(arg_24_0)
	local var_24_0 = arg_24_0.settingData_.home_scene_camera_follow == 1

	arg_24_0.settingCon_[2]:SetSelectedState(var_24_0 and "on" or "off")
end

function var_0_0.RefreshSceneBgm(arg_25_0)
	local var_25_0 = arg_25_0.settingData_.home_scene_scene_bgm == 1

	arg_25_0.settingCon_[3]:SetSelectedState(var_25_0 and "on" or "off")
end

function var_0_0.RefreshType(arg_26_0)
	arg_26_0:StopTimer()

	local var_26_0 = arg_26_0.data_[arg_26_0.curSceneID_]
	local var_26_1 = HomeSceneSettingData:GetCurScene()

	if var_26_0 == 0 then
		local var_26_2 = arg_26_0:IsCanGet()

		arg_26_0.btnCon_:SetSelectedState(var_26_2 and "get" or "ban")

		arg_26_0.tip_.text = arg_26_0.cfg_.unlock_description
	elseif var_26_0 == 1 then
		arg_26_0.btnCon_:SetSelectedState(arg_26_0.curSceneID_ == var_26_1 and "trialing" or "trial")
		arg_26_0:RefreshTime()
	elseif var_26_0 == 2 then
		arg_26_0.btnCon_:SetSelectedState(arg_26_0.curSceneID_ == var_26_1 and "using" or "use")
	end

	SetActive(arg_26_0.unlockGo_, var_26_0 == 0 and arg_26_0.cfg_.unlock_description ~= "")
	SetActive(arg_26_0.timeGo_, var_26_0 == 1)
	LayoutRebuilder.ForceRebuildLayoutImmediate(arg_26_0.tglContent_)
	LayoutRebuilder.ForceRebuildLayoutImmediate(arg_26_0.tglContent_)
end

function var_0_0.IsCanGet(arg_27_0)
	local var_27_0 = arg_27_0.cfg_.obtain_way

	return arg_27_0.cfg_.obtain_way and #arg_27_0.cfg_.obtain_way > 0 and not JumpTools.NeedHide(var_27_0, arg_27_0.curSceneID_) and not JumpTools.GetLinkIsLocked(arg_27_0.cfg_.obtain_way)
end

function var_0_0.RefreshTime(arg_28_0)
	arg_28_0:StopTimer()

	local var_28_0 = manager.time:GetServerTime()
	local var_28_1 = HomeSceneSettingData:GetSceneTimeStamp(arg_28_0.curSceneID_)

	arg_28_0.time_.text = manager.time:GetLostTimeStr2(var_28_1)
	arg_28_0.timer_ = Timer.New(function()
		if var_28_1 and var_28_0 <= var_28_1 then
			arg_28_0.time_.text = manager.time:GetLostTimeStr2(var_28_1)
		else
			HomeSceneSettingAction.SetHomeScene(GameSetting.home_sence_default.value[1])
		end
	end, 1, -1)

	arg_28_0.timer_:Start()
end

function var_0_0.RefreshRedPoint(arg_30_0)
	local var_30_0 = arg_30_0.curSceneID_

	saveData("scene", tostring(var_30_0), 0)
	manager.redPoint:setTip(RedPointConst.SCENE .. "_" .. var_30_0, 0)
end

function var_0_0.StopTimer(arg_31_0)
	if arg_31_0.timer_ then
		arg_31_0.timer_:Stop()

		arg_31_0.timer_ = nil
	end
end

function var_0_0.AddClickTimer(arg_32_0)
	arg_32_0:StopClickTimer()

	arg_32_0.buttonUp_ = 0
	arg_32_0.clickTimer_ = FuncTimerManager.inst:CreateFuncFrameTimer(function()
		if Input.GetMouseButtonUp(0) then
			arg_32_0.buttonUp_ = arg_32_0.buttonUp_ + 1

			if arg_32_0.buttonUp_ >= 2 then
				for iter_33_0, iter_33_1 in ipairs(HomeSceneTagCfg.all) do
					if arg_32_0["effectTgl_" .. iter_33_1] then
						arg_32_0["effectTgl_" .. iter_33_1].isOn = false
					end
				end

				arg_32_0:HideMessage()

				if arg_32_0.clickTimer_ then
					FuncTimerManager.inst:RemoveFuncTimer(arg_32_0.clickTimer_)

					arg_32_0.clickTimer_ = nil
				end
			end
		end
	end, -1, true)
end

function var_0_0.StopClickTimer(arg_34_0)
	if arg_34_0.clickTimer_ then
		FuncTimerManager.inst:RemoveFuncTimer(arg_34_0.clickTimer_)

		arg_34_0.clickTimer_ = nil
	end
end

function var_0_0.CheckPlayBgm(arg_35_0)
	local var_35_0 = HomeSceneSettingData:GetCurScene()
	local var_35_1 = HomeSceneSettingCfg[var_35_0]
	local var_35_2 = var_35_1.scene_setting
	local var_35_3 = var_35_1.default_music

	if var_35_3 ~= 0 and arg_35_0.settingData_.home_scene_scene_bgm == 1 and table.indexof(var_35_2, HomeSceneSettingConst.SETTING.SCENE_BGM) then
		IllustratedAction.QuerySetBgm(var_35_3)
	end
end

function var_0_0.OnHomeSceneChange(arg_36_0)
	arg_36_0:RefreshUI()
end

function var_0_0.OnHomeSceneSettingChange(arg_37_0, arg_37_1, arg_37_2)
	if arg_37_2.key == "allData" then
		arg_37_0:RefreshSoundEffect()
		arg_37_0:RefreshCameraFollow()
	elseif arg_37_2.key == "home_scene_sound_effect" then
		arg_37_0:RefreshSoundEffect()
	elseif arg_37_2.key == "home_scene_camera_follow" then
		arg_37_0:RefreshCameraFollow()
	elseif arg_37_2.key == "home_scene_scene_bgm" then
		arg_37_0:RefreshSceneBgm()
	end
end

function var_0_0.OnTop(arg_38_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR
	})
	manager.windowBar:RegistBackCallBack(function()
		gameContext:Go("/home", nil, nil, true)
	end)
end

function var_0_0.OnExit(arg_40_0)
	arg_40_0:StopTimer()

	for iter_40_0, iter_40_1 in ipairs(arg_40_0.scrollHelper_:GetItemList()) do
		iter_40_1:OnExit()
	end

	manager.windowBar:HideBar()
end

function var_0_0.Dispose(arg_41_0)
	arg_41_0:RemoveAllListeners()

	if arg_41_0.scrollHelper_ then
		arg_41_0.scrollHelper_:Dispose()

		arg_41_0.scrollHelper_ = nil
	end

	var_0_0.super.Dispose(arg_41_0)
end

return var_0_0
