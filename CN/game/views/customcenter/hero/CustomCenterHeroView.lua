local var_0_0 = class("CustomCenterHeroView", ReduxView)

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_1.transform

	arg_1_0:BindCfgUI()
	arg_1_0:AddListeners()

	arg_1_0.randomController_ = arg_1_0.controllerEx_:GetController("random")
	arg_1_0.useStateController_ = arg_1_0.controllerEx_:GetController("useState")
	arg_1_0.randomToggleView_ = CustomCenterToggle.New(arg_1_0.randomGo_)

	arg_1_0.randomToggleView_:RegisterClickListener(function()
		local var_2_0 = not CustomCenterTools.IsRandomHero()

		CustomCenterAction.SwitchHeroRandom(var_2_0, function()
			if var_2_0 == true and CustomCenterTools.GetRandomHeroCnt() <= 0 then
				local var_3_0 = PlayerData:GetCacheHeroSkinID(arg_1_0.heroID_)

				CustomCenterTools.UpdateCacheRandomHeroSkinID(var_3_0)
				CustomCenterAction.SaveRandomHeroSkinList(function()
					local var_4_0 = HomeSceneSettingData:GetCurSceneID()

					if not CustomCenterTools.IsRandomScene() and CustomCenterTools.IsDLCScene(var_4_0) then
						HomeSceneSettingAction.SetHomeScene(GameSetting.home_sence_default.value[2], true, true)
					end

					manager.notify:Invoke(CUSTOM_CENTER_UPDATE_RANDOM_HERO_SKIN_LIST)
				end)
			elseif var_2_0 == false then
				manager.notify:Invoke(CUSTOM_CENTER_SWITCH_RANDOM_HERO)
			elseif var_2_0 == true then
				local var_3_1 = HomeSceneSettingData:GetCurSceneID()

				if not CustomCenterTools.IsRandomScene() and CustomCenterTools.IsDLCScene(var_3_1) then
					HomeSceneSettingAction.SetHomeScene(GameSetting.home_sence_default.value[2], true, true)
				end
			end

			manager.notify:Invoke(CUSTOM_CENTER_SWITCH_RANDOM_HERO)
		end)
	end)

	arg_1_0.addToggleView_ = CustomCenterToggle.New(arg_1_0.addGo_)

	arg_1_0.addToggleView_:RegisterClickListener(function()
		local var_5_0 = PlayerData:GetCacheHeroSkinID(arg_1_0.heroID_)

		if CustomCenterTools:GetRandomHeroCnt() <= 1 and CustomCenterTools.IsContentRandomHeroSkinID(var_5_0) then
			ShowMessageBox({
				content = GetTips("RANDOM_ASSIST_TIPS2"),
				OkCallback = function()
					CustomCenterAction.SwitchHeroRandom(false, function()
						manager.notify:Invoke(CUSTOM_CENTER_SWITCH_RANDOM_HERO)
						CustomCenterTools.UpdateCacheRandomHeroSkinID(var_5_0)
						CustomCenterAction.SaveRandomHeroSkinList(function()
							local var_8_0 = PlayerData:GetCacheHeroSkinID(arg_1_0.heroID_)

							if CustomCenterTools.IsContentRandomHeroSkinID(var_8_0) then
								HeroTools.PlayVoice(arg_1_0.heroID_, "assistant")
							end

							manager.notify:Invoke(CUSTOM_CENTER_UPDATE_RANDOM_HERO_SKIN_LIST)
						end)
					end)
				end
			})

			return
		end

		CustomCenterTools.UpdateCacheRandomHeroSkinID(var_5_0)
		CustomCenterAction.SaveRandomHeroSkinList(function()
			local var_9_0 = PlayerData:GetCacheHeroSkinID(arg_1_0.heroID_)

			if CustomCenterTools.IsContentRandomHeroSkinID(var_9_0) then
				HeroTools.PlayVoice(arg_1_0.heroID_, "assistant")
			end

			manager.notify:Invoke(CUSTOM_CENTER_UPDATE_RANDOM_HERO_SKIN_LIST)
		end)
	end)

	arg_1_0.customCenterHeroSkinView_ = CustomCenterHeroSkinPanel.New(arg_1_0.skinPanel_)
	arg_1_0.OnChangePosterGirlHandler_ = handler(arg_1_0, arg_1_0.OnChangePosterGirl)
	arg_1_0.OnSwitchRandomModeHandler_ = handler(arg_1_0, arg_1_0.OnSwitchRandomMode)
end

function var_0_0.OnEnter(arg_10_0)
	manager.notify:RegistListener(CHANGE_POSTER_GIRL, arg_10_0.OnChangePosterGirlHandler_)
	manager.notify:RegistListener(CUSTOM_CENTER_SWITCH_RANDOM_MODE, arg_10_0.OnSwitchRandomModeHandler_)
end

function var_0_0.OnExit(arg_11_0)
	manager.notify:RemoveListener(CHANGE_POSTER_GIRL, arg_11_0.OnChangePosterGirlHandler_)
	manager.notify:RemoveListener(CUSTOM_CENTER_SWITCH_RANDOM_MODE, arg_11_0.OnSwitchRandomModeHandler_)
end

function var_0_0.Dispose(arg_12_0)
	arg_12_0.OnChangePosterGirlHandler_ = nil
	arg_12_0.OnSwitchRandomModeHandler_ = nil

	arg_12_0.randomToggleView_:Dispose()

	arg_12_0.randomToggleView_ = nil

	arg_12_0.addToggleView_:Dispose()

	arg_12_0.addToggleView_ = nil

	arg_12_0.customCenterHeroSkinView_:Dispose()

	arg_12_0.customCenterHeroSkinView_ = nil

	var_0_0.super.Dispose(arg_12_0)
end

function var_0_0.AddListeners(arg_13_0)
	arg_13_0:AddBtnListener(arg_13_0.clearBtn_, nil, function()
		ShowMessageBox({
			content = GetTips("CUSTOM_CENTER_CLEAR_HERO"),
			OkCallback = function()
				manager.notify:Invoke(CUSTOM_CENTER_CLEAR_HERO)
				manager.notify:Invoke(CUSTOM_CENTER_UPDATE_RANDOM_HERO_SKIN_LIST)
			end
		})
	end)
	arg_13_0:AddBtnListener(arg_13_0.randomBtn_, nil, function()
		JumpTools.OpenPageByJump("randomHeroModePop", {
			type = PlayerData:GetRandomHeroMode()
		})
	end)
	arg_13_0:AddBtnListener(arg_13_0.useBtn_, nil, function()
		local var_17_0 = PlayerData:GetCacheHeroSkinID(arg_13_0.heroID_)
		local var_17_1 = SkinCfg[var_17_0].hero

		HeroAction.SelectSkinWithCallback(var_17_1, var_17_0, function()
			return
		end)

		if CustomCenterTools.IsRandomScene() and CustomCenterTools.HasDLCScene(var_17_0) then
			ShowMessageBox({
				title = GetTips("PROMPT"),
				content = GetTips("RANDOM_SCENE_TIPS"),
				OkCallback = function()
					CustomCenterAction.SwitchSceneRandom(false, function()
						PlayerAction.ChangePosterGirlWithCallback(var_17_1, function()
							CustomCenterTools.SetUseSelectedScene()
						end)
					end)
				end,
				CancelCallback = function()
					PlayerAction.ChangePosterGirlWithCallback(var_17_1)
				end
			})
		else
			local var_17_2 = HomeSceneSettingData:GetCacheSceneID()

			PlayerAction.ChangePosterGirlWithCallback(var_17_1, function()
				HomeSceneSettingAction.SetHomeScene(HomeSceneSettingData:GetCacheSceneID(), true)
				HeroTools.PlayVoice(var_17_1, "assistant")
			end)
		end
	end)
end

function var_0_0.Show(arg_24_0, arg_24_1, arg_24_2)
	arg_24_0.heroID_ = arg_24_2

	if arg_24_1 then
		arg_24_0.customCenterHeroSkinView_:RefreshUI(arg_24_2)
		arg_24_0:RefreshUI()
	end

	SetActive(arg_24_0.gameObject_, arg_24_1)
end

function var_0_0.RefreshUI(arg_25_0)
	arg_25_0:RefreshRandomPanel()
end

function var_0_0.RefreshRandomPanel(arg_26_0)
	if CustomCenterTools.IsRandomHero() then
		arg_26_0.randomController_:SetSelectedState("true")
		arg_26_0.randomToggleView_:SetSelectedState(true)
		arg_26_0:RefreshRandomText()
		arg_26_0:RefreshRandomCnt()
		arg_26_0:RefreshAddBtn()
		arg_26_0.customCenterHeroSkinView_:UpdateSkinItem()
	else
		arg_26_0.randomController_:SetSelectedState("false")
		arg_26_0.randomToggleView_:SetSelectedState(false)
		arg_26_0:RefreshUseBtn()
	end
end

function var_0_0.RefreshRandomCnt(arg_27_0)
	arg_27_0.numText_.text = CustomCenterTools.GetRandomHeroCnt()
end

function var_0_0.RefreshRandomText(arg_28_0)
	local var_28_0 = PlayerData:GetRandomHeroMode()

	if var_28_0 == HomeSceneSettingConst.RANDOM_MODE.EACH_DAY then
		arg_28_0.randomModeText_.text = GetTips("RANDOM_MODE_SETTING_PERDAY")
	elseif var_28_0 == HomeSceneSettingConst.RANDOM_MODE.EACH_LOGIN then
		arg_28_0.randomModeText_.text = GetTips("RANDOM_MODE_SETTING_PERTIME")
	elseif var_28_0 == HomeSceneSettingConst.RANDOM_MODE.EACH_ENTER then
		arg_28_0.randomModeText_.text = GetTips("RANDOM_MODE_SETTING_PERPLAY")
	else
		arg_28_0.randomModeText_.text = "unknown"
	end
end

function var_0_0.RefreshUseBtn(arg_29_0)
	if arg_29_0.heroID_ == nil then
		return
	end

	if PlayerData:GetCacheHeroSkinID(arg_29_0.heroID_) == PlayerData:GetPosterGirlHeroSkinId() then
		arg_29_0.useStateController_:SetSelectedState("true")
	else
		arg_29_0.useStateController_:SetSelectedState("false")
	end
end

function var_0_0.RefreshAddBtn(arg_30_0)
	local var_30_0 = PlayerData:GetCacheHeroSkinID(arg_30_0.heroID_)
	local var_30_1 = CustomCenterTools.IsContentRandomHeroSkinID(var_30_0)

	arg_30_0.addToggleView_:SetSelectedState(var_30_1)
end

function var_0_0.OnChangePosterGirl(arg_31_0)
	arg_31_0:RefreshUseBtn()
	arg_31_0.customCenterHeroSkinView_:UpdateSkinItem()
end

function var_0_0.OnSwitchRandomMode(arg_32_0)
	arg_32_0:RefreshRandomText()
end

return var_0_0
