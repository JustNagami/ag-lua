local var_0_0 = class("StoryPlayer2", import("game.extend.ReduxView"))

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.isPlay_ = false
	arg_1_0.auto_time = 0
	arg_1_0.time_ = 0
	arg_1_0.frameCnt_ = 0
	arg_1_0.duration_ = 0
	arg_1_0.gameObject_ = nil
	arg_1_0.stage_ = arg_1_1
	arg_1_0.stage_.name = "StoryStage"
	arg_1_0.state_ = ""
	arg_1_0.auto_ = false
	arg_1_0.curStory_ = nil
	arg_1_0.curStoryInstance_ = nil
	arg_1_0.curTalkId_ = nil
	arg_1_0.isInRecall_ = false
	arg_1_0.onSingleLineFinish_ = nil
	arg_1_0.onSingleLineUpdate_ = nil
	arg_1_0.onStoryFinished_ = nil
	arg_1_0.playNext_ = nil
	arg_1_0.bgs_ = {}
	arg_1_0.actors_ = {}
	arg_1_0.spriteActors_ = {}
	arg_1_0.CriAtomExPlaybacks_ = {}
	arg_1_0.timelineDirector = {}
	arg_1_0.marker = ""
	arg_1_0.keyword = {}
	arg_1_0.keyword.nickname = PlayerData:GetPlayerInfo().nick
	arg_1_0.talkMaxDuration = 0
	arg_1_0.typewritterCharCountI18N = 0
	arg_1_0.musicType = {}
	arg_1_0.niuquEffectActor = {}
	arg_1_0.actionList = {}

	arg_1_0:InitUI()
	arg_1_0:InitTimlineBind()
	arg_1_0:InitUIEvents()
end

function var_0_0.InitTimlineBind(arg_2_0)
	if not isNil(arg_2_0.timelineBindMgr) or not arg_2_0.timelineBindMgr then
		arg_2_0.timelineBindMgr = GameObjectTools.GetOrAddComponent(arg_2_0.timelinebindmgrGo_, typeof(BlendTwoTimelines))
	end
end

function var_0_0.InitUI(arg_3_0)
	arg_3_0.gameObject_ = Object.Instantiate(Asset.Load("Widget/System/Story/StoryUI"), manager.ui.uiStory.transform)
	arg_3_0.transform_ = arg_3_0.gameObject_.transform

	ComponentBinder.GetInstance():BindCfgUI(arg_3_0, arg_3_0.gameObject_)
	arg_3_0:AdaptScreen()

	arg_3_0.settingData = SettingData:GetGameSettingData()
	arg_3_0.iconController_ = ControllerUtil.GetController(arg_3_0.iconTrs_, "conName")
	arg_3_0.musicController = arg_3_0.musicController_:GetController("music")
	arg_3_0.choices_ = {}

	for iter_3_0 = 1, 3 do
		arg_3_0.choices_[iter_3_0] = {
			isShow = true,
			go = arg_3_0["itemGo" .. iter_3_0 .. "_"],
			txt = arg_3_0["itemText" .. iter_3_0 .. "_"]
		}
	end

	arg_3_0.choicesID = {}
	arg_3_0.fswtw_ = arg_3_0.typeWritterGo_:GetComponent("UITypewriterEffect")

	arg_3_0.fswbg_:SetActive(false)
	SetActive(arg_3_0.lastBtn_.gameObject, true)
	SetActive(arg_3_0.bgmBtn_.gameObject, true)
	SetActive(arg_3_0.locationGo_, false)
	SetActive(arg_3_0.dialog_, false)
	SetActive(arg_3_0.bgmBtn_.gameObject, arg_3_0.settingData.show_music_name == 1)
	SetActive(arg_3_0.showGo_, false)

	arg_3_0.bgmTxt_.text = ""
	arg_3_0.bgmTxt2_.text = ""

	arg_3_0.musicController:SetSelectedState("hide")

	if SceneSetting.Current then
		arg_3_0.sceneSettingEffect_ = SceneSetting.Current

		arg_3_0.sceneSettingGo_:SetActive(false)
	else
		arg_3_0.sceneSettingGo_:SetActive(true)
	end

	arg_3_0.screenFilterGo_:SetActive(false)

	arg_3_0.screenFilterEffect_ = arg_3_0.screenFilterGo_:GetComponent("Volume")
	arg_3_0.typewritter = arg_3_0.text_.gameObject:GetComponent("UITypewriterEffect")
	arg_3_0.dialogCg_.alpha = 0
	arg_3_0.blackMask_.alpha = 0
	arg_3_0.blackMask_.blocksRaycasts = false

	arg_3_0:ShowNextGo(false)

	arg_3_0.autoplayController_ = arg_3_0.controller_:GetController("autoplay")
	arg_3_0.hideBtnsController_ = arg_3_0.controller_:GetController("hideBtns")
	arg_3_0.hideAllUIController_ = arg_3_0.controller_:GetController("hideAllUI")
	arg_3_0.callingController_ = arg_3_0.controller_:GetController("Calling")
	arg_3_0.timestampController_ = arg_3_0.controller_:GetController("Timestamp")
	arg_3_0.timestampColorController_ = arg_3_0.timestampControllerexcollection_:GetController("BlueRed")

	arg_3_0.timestampController_:SetSelectedState("hide")

	arg_3_0.historyItems_ = {}
	arg_3_0.lastHistoryVoiceIdx_ = nil
	arg_3_0.curHistoryItem_ = nil
	arg_3_0.musicType = {}
	arg_3_0.niuquEffectActor = {}

	SetActive(arg_3_0.talkGo_, false)
	arg_3_0.autoplayController_:SetSelectedState("manual")

	arg_3_0.soundController_ = arg_3_0.soundControllerEx_:GetController("sound")
	arg_3_0.OnSoundSettingSwitchHandler_ = handler(arg_3_0, arg_3_0.OnSoundSettingSwitch)

	manager.notify:RegistListener(SOUND_SETTING_SWICH, arg_3_0.OnSoundSettingSwitchHandler_)
	arg_3_0:RefreshSoundState()

	arg_3_0.OnVoiceLanguageSwitchHandler_ = handler(arg_3_0, arg_3_0.OnVoiceLanguageSwitch)

	manager.notify:RegistListener(STORY_SWITCH_VOICE_LANGUAGE, arg_3_0.OnVoiceLanguageSwitchHandler_)
end

function var_0_0.InitUIEvents(arg_4_0)
	arg_4_0:AddBtnListener(arg_4_0.allBtn_, nil, function()
		arg_4_0:OnClickBtnAll()
	end)
	arg_4_0:AddBtnListener(arg_4_0.panelBtn_, nil, function()
		arg_4_0:OnClickBtnAll()
	end)
	arg_4_0:AddBtnListener(arg_4_0.hideBtn_, nil, function()
		if arg_4_0.auto_ then
			arg_4_0.auto_ = false

			arg_4_0.autoplayController_:SetSelectedState("manual")
		end

		SetActive(arg_4_0.dialog_, false)
		arg_4_0.hideBtnsController_:SetSelectedState("hide")

		arg_4_0.allBtnState = arg_4_0.allBtn_.enabled
		arg_4_0.fullScreenWordFlag_ = arg_4_0.fswbg_.activeSelf

		SetActive(arg_4_0.fswbg_, false)

		arg_4_0.state_ = "hiding"
		arg_4_0.isPlay_ = false

		local var_7_0 = PlayerData:GetStoryList()
		local var_7_1
		local var_7_2 = var_7_0[arg_4_0.curStory_.id] and 0 or 1

		SDKTools.SendMessageToSDK("story_oper", {
			oper = StoryOperDefine.HIDE,
			is_first = var_7_2,
			story_id = arg_4_0.curStory_.id
		})
	end)
	arg_4_0:AddBtnListener(arg_4_0.autoBtn_, nil, function()
		arg_4_0.auto_ = true

		arg_4_0.autoplayController_:SetSelectedState("auto")

		local var_8_0 = PlayerData:GetStoryList()
		local var_8_1
		local var_8_2 = var_8_0[arg_4_0.curStory_.id] and 0 or 1

		SDKTools.SendMessageToSDK("story_oper", {
			oper = StoryOperDefine.AUTO,
			is_first = var_8_2,
			story_id = string.format(arg_4_0.curStory_.id)
		})
	end)
	arg_4_0:AddBtnListener(arg_4_0.manualBtn_, nil, function()
		arg_4_0.auto_ = false

		arg_4_0.autoplayController_:SetSelectedState("manual")
	end)
	arg_4_0:AddBtnListener(arg_4_0.bgmBtn_, nil, function()
		if arg_4_0.musicController:GetSelectedState() == "show" then
			arg_4_0.musicController:SetSelectedState("hide")
			arg_4_0.musicAnimator_:Play("back")
		else
			arg_4_0.musicController:SetSelectedState("show")
			arg_4_0.musicAnimator_:Play("open")
		end

		if arg_4_0.bgmTimer then
			arg_4_0.bgmTimer:Stop()

			arg_4_0.bgmTimer = nil
		end
	end)
	SetActive(arg_4_0.history_, true)
	SetActive(arg_4_0.history_, false)
	arg_4_0:AddBtnListener(arg_4_0.lastBtn_, nil, function()
		if SDKTools.GetIsOverSea() then
			arg_4_0:JumpToEnd()
		end

		arg_4_0.isPlay_ = false

		SetActive(arg_4_0.history_, true)
		arg_4_0.hideBtnsController_:SetSelectedState("hide")
		manager.ui:SetUISeparateRender(true)

		arg_4_0.historyRect_.verticalNormalizedPosition = 0

		local var_11_0 = PlayerData:GetStoryList()
		local var_11_1
		local var_11_2 = var_11_0[arg_4_0.curStory_.id] and 0 or 1

		SDKTools.SendMessageToSDK("story_oper", {
			oper = StoryOperDefine.REPLAY,
			is_first = var_11_2,
			story_id = string.format(arg_4_0.curStory_.id)
		})
	end)
	arg_4_0:AddBtnListener(arg_4_0.historyBtn_, nil, function()
		arg_4_0.isPlay_ = true

		SetActive(arg_4_0.history_, false)
		arg_4_0.hideBtnsController_:SetSelectedState("show")
		manager.ui:SetUISeparateRender(false)
	end)

	for iter_4_0 = 1, 3 do
		arg_4_0:AddBtnListener(arg_4_0["itemBtn" .. iter_4_0 .. "_"], nil, function()
			manager.story:SetStoryChoice(iter_4_0)
			arg_4_0.playNext_(iter_4_0)
			SetActive(arg_4_0.choicesGo_, false)

			local var_13_0 = PlayerData:GetStoryList()
			local var_13_1
			local var_13_2 = var_13_0[arg_4_0.curStory_.id] and 0 or 1
			local var_13_3 = arg_4_0.choicesID[tonumber(arg_4_0.curChoiseId)] and arg_4_0.choicesID[tonumber(arg_4_0.curChoiseId)][iter_4_0] or ""

			SDKTools.SendMessageToSDK("story_oper", {
				story_id = arg_4_0.curStory_.id,
				is_first = var_13_2,
				oper = StoryOperDefine.OPTION,
				param_id = arg_4_0.curChoiseId,
				params_list = arg_4_0:GetChoiceLog(arg_4_0.curChoiseId),
				params_select = var_13_3
			})
		end)
	end

	arg_4_0:AddBtnListener(arg_4_0.skipBtn_, nil, function()
		local var_14_0, var_14_1 = arg_4_0:CheckCanSkipToEnd()

		if var_14_0 then
			arg_4_0:Skip()
		else
			arg_4_0:JumpToMarker(var_14_1)
		end

		SetActive(arg_4_0.choicesGo_, false)
	end)
	arg_4_0:AddBtnListener(arg_4_0.narrativeSkipBtn_, nil, function()
		arg_4_0.onStoryFinished_(true)
	end)
	arg_4_0:AddBtnListener(arg_4_0.narrativeExitBtn_, nil, function()
		arg_4_0.onStoryFinished_(true)
	end)
	arg_4_0:AddBtnListener(arg_4_0.narrativeContinueBtn_, nil, function()
		arg_4_0.onStoryFinished_(true)
	end)
	arg_4_0:AddBtnListener(arg_4_0.soundBtn_, nil, function()
		arg_4_0:Go("storySoundSetting")
	end)
end

function var_0_0.OnClickBtnAll(arg_19_0)
	if arg_19_0.state_ == "hiding" then
		arg_19_0.state_ = "waiting"
		arg_19_0.isPlay_ = true

		SetActive(arg_19_0.dialog_, true)
		arg_19_0.hideBtnsController_:SetSelectedState("show")

		arg_19_0.allBtn_.enabled = arg_19_0.allBtnState

		SetActive(arg_19_0.fswbg_, arg_19_0.fullScreenWordFlag_ and true)

		if arg_19_0.fullScreenWordFlag_ == true then
			SetActive(arg_19_0.dialog_, false)
		end
	elseif arg_19_0.state_ == "waiting" and not arg_19_0.choicesGo_.activeSelf then
		arg_19_0:StopWaitVoiceLanguageTimer()
		arg_19_0.playNext_(1)
	elseif arg_19_0.dialogNext_.activeSelf and arg_19_0.typewriterNext_.activeSelf and not arg_19_0.choicesGo_.activeSelf then
		arg_19_0:JumpToEnd()

		if not arg_19_0.choicesGo_.activeSelf then
			arg_19_0.playNext_(1)
		end
	elseif arg_19_0.state_ == "playing" then
		arg_19_0:JumpToEnd()
	end
end

function var_0_0.JumpToEnd(arg_20_0)
	local var_20_0 = (arg_20_0.duration_ - arg_20_0.time_) / 0.033 + 1

	for iter_20_0 = 1, var_20_0 do
		arg_20_0:Update(0.033)
	end

	if arg_20_0.dialogScrollRect_ then
		arg_20_0.dialogScrollRect_.normalizedPosition = Vector2(0, 0)
	end
end

function var_0_0.JumpToMarker(arg_21_0, arg_21_1)
	while arg_21_1 > arg_21_0.curTalkId_ do
		arg_21_0:JumpToEnd()
		arg_21_0.playNext_(1)
	end

	if arg_21_1 == arg_21_0.curTalkId_ then
		local var_21_0 = (arg_21_0.duration_ - arg_21_0.time_) / 0.033 + 1

		for iter_21_0 = 1, var_21_0 do
			arg_21_0:Update(0.033)

			if arg_21_0.marker ~= "" then
				return
			end
		end
	end

	arg_21_0:Skip()
end

function var_0_0.StopAllVoice(arg_22_0)
	for iter_22_0, iter_22_1 in pairs(arg_22_0.CriAtomExPlaybacks_) do
		if iter_22_1 then
			iter_22_1:Stop()
		end
	end

	arg_22_0.CriAtomExPlaybacks_ = {}

	arg_22_0:StopBgmTxt()
end

function var_0_0.StopBgmTxt(arg_23_0)
	if arg_23_0.bgmTimer then
		arg_23_0.bgmTimer:Stop()

		arg_23_0.bgmTimer = nil
	end

	if arg_23_0 == nil or isNil(arg_23_0.bgmTxt_) then
		return
	end

	arg_23_0.musicController:SetSelectedState("hide")
	arg_23_0.musicAnimator_:Play("back", 0, 0)

	arg_23_0.bgmTxt_.text = ""
	arg_23_0.bgmTxt2_.text = ""
end

function var_0_0.PlayOnlyBgm(arg_24_0)
	for iter_24_0, iter_24_1 in pairs(arg_24_0.CriAtomExPlaybacks_) do
		if iter_24_1 and arg_24_0.musicType.music and not arg_24_0.musicType.music[iter_24_0] == 1 then
			iter_24_1:Stop()
			table.remove(arg_24_0.CriAtomExPlaybacks_, iter_24_0)
		end
	end
end

function var_0_0.Skip(arg_25_0, arg_25_1)
	local var_25_0 = false

	if not arg_25_1 then
		arg_25_1 = StoryOperDefine.PASS
	else
		var_25_0 = true
	end

	local var_25_1 = arg_25_0.curStory_.name
	local var_25_2 = arg_25_0.curStory_.desc

	arg_25_0.isPlay_ = false
	arg_25_0.auto_ = false

	arg_25_0.autoplayController_:SetSelectedState("manual")

	if var_25_2 and var_25_2 ~= "" then
		for iter_25_0, iter_25_1 in pairs(arg_25_0.CriAtomExPlaybacks_) do
			if iter_25_1 then
				iter_25_1:Pause()
			end
		end

		manager.audio:ClearBGMFlag()

		local var_25_3 = manager.story:IsStoryPlayed(arg_25_0.curStory_.id)
		local var_25_4

		if arg_25_0.skipView_ == nil then
			if var_25_3 or var_25_0 then
				var_25_4 = "Widget/System/Story/StorySkipUI"

				local var_25_5 = Asset.Load(var_25_4)
				local var_25_6 = Object.Instantiate(var_25_5, manager.ui.uiStory.transform)

				arg_25_0.skipView_ = StoryForceSkipView.New(var_25_6)
			else
				var_25_4 = "Widget/System/Story/StorySkip2UI"

				local var_25_7 = Asset.Load(var_25_4)
				local var_25_8 = Object.Instantiate(var_25_7, manager.ui.uiStory.transform)

				arg_25_0.skipView_ = StorySkip2View.New(var_25_8)
			end
		else
			SetActive(arg_25_0.skipView_.gameObject_, true)
		end

		if not var_25_3 and not var_25_0 then
			manager.ui:SetUISeparateRender(true)
		end

		arg_25_0.skipView_:SetContentTitle(var_25_1, var_25_2)
		arg_25_0.skipView_:SetCallback(handler(arg_25_0, function(arg_26_0, arg_26_1)
			if arg_26_1 then
				arg_25_0.isPlay_ = true

				for iter_26_0, iter_26_1 in pairs(arg_25_0.CriAtomExPlaybacks_) do
					if iter_26_1 then
						iter_26_1:Resume(CriAtomEx.ResumeMode.PausedPlayback)
					end
				end

				if arg_25_0.skipView_ then
					arg_25_0.skipView_:Dispose()

					arg_25_0.skipView_ = nil
				end

				if var_25_4 then
					Asset.Unload(var_25_4)
				end

				return
			end

			local var_26_0 = PlayerData:GetStoryList()
			local var_26_1
			local var_26_2 = var_26_0[arg_25_0.curStory_.id] and 0 or 1

			SDKTools.SendMessageToSDK("story_oper", {
				oper = arg_25_1,
				is_first = var_26_2,
				story_id = string.format(arg_25_0.curStory_.id)
			})

			if BirthdayCfg.get_id_list_by_story_id[arg_25_0.curStory_.id] and var_26_2 == 1 then
				SDKTools.SendMessageToSDK("birthday_viewed", {
					story_skip = 1
				})
			end

			arg_25_0:StopPassVoice()
			arg_25_0.onStoryFinished_(true)
		end))
	else
		local var_25_9 = PlayerData:GetStoryList()
		local var_25_10
		local var_25_11 = var_25_9[arg_25_0.curStory_.id] and 0 or 1

		SDKTools.SendMessageToSDK("story_oper", {
			oper = arg_25_1,
			is_first = var_25_11,
			story_id = string.format(arg_25_0.curStory_.id)
		})

		if BirthdayCfg.get_id_list_by_story_id[arg_25_0.curStory_.id] and var_25_11 == 1 then
			SDKTools.SendMessageToSDK("birthday_viewed", {
				story_skip = 1
			})
		end

		arg_25_0:StopPassVoice()
		arg_25_0.onStoryFinished_(true)
	end
end

function var_0_0.StopPassVoice(arg_27_0)
	manager.audio:PlayBGM("ui_skip", "ui_reset_filter")
	manager.audio:PlayEffect("ui_skip", "ui_reset", "")
	manager.audio:PlayEffect("se_story_activity_1_2_summer1", "se_story_activity_1_2_lowpass_stop", "")
end

function var_0_0.SetGaussion(arg_28_0, arg_28_1)
	arg_28_0:SetGaussionBg(arg_28_1)
	manager.ui:SetUISeparateRender(arg_28_1)
	SetActive(arg_28_0.gaussionBgGo_, arg_28_1)
end

function var_0_0.ShowNextGo(arg_29_0, arg_29_1)
	SetActive(arg_29_0.dialogNext_, arg_29_1)
	SetActive(arg_29_0.dialogNextBtnGo_, not arg_29_1)
	SetActive(arg_29_0.typewriterNext_, arg_29_1)
end

function var_0_0.Update(arg_30_0, arg_30_1)
	if not arg_30_0.isPlay_ then
		if arg_30_0.state_ == "hiding" then
			if Input.anyKey then
				arg_30_0.__isAnyKey = true
			elseif arg_30_0.__isAnyKey then
				arg_30_0.__isAnyKey = false

				if not Input.GetMouseButtonUp(0) then
					arg_30_0:OnClickBtnAll()
				end
			end

			arg_30_0.allBtn_.enabled = true
		end

		return
	end

	if arg_30_0.state_ ~= "pause" then
		arg_30_0.time_ = arg_30_0.time_ + arg_30_1
		arg_30_0.frameCnt_ = arg_30_0.frameCnt_ + 1
	end

	if arg_30_0.onSingleLineUpdate_ then
		arg_30_0.onSingleLineUpdate_(arg_30_1)
	end

	if arg_30_0.time_ > arg_30_0.duration_ and arg_30_0.onSingleLineFinish_ then
		arg_30_0.onSingleLineFinish_()

		if arg_30_0.duration_ < 2 then
			arg_30_0.auto_time = 2 - arg_30_0.duration_
		end

		if arg_30_0.auto_time <= 0 then
			arg_30_0.auto_time = 1
		end
	end

	if arg_30_0.state_ == "waiting" and arg_30_0.playNext_ and arg_30_0.auto_ then
		if arg_30_0.auto_time <= 0 and not arg_30_0.choicesGo_.activeSelf then
			arg_30_0:StopWaitVoiceLanguageTimer()
			arg_30_0.playNext_(1)

			arg_30_0.auto_time = 0
		else
			arg_30_0.auto_time = arg_30_0.auto_time - arg_30_1
		end
	end
end

function var_0_0.FormatText(arg_31_0, arg_31_1)
	arg_31_1 = GetI18NText(arg_31_1)

	local var_31_0 = string.gsub(arg_31_1, "#{(%w+)}#", function(arg_32_0)
		local var_32_0 = arg_31_0.keyword[arg_32_0]

		if var_32_0 then
			return var_32_0
		else
			return arg_32_0
		end
	end)

	return (arg_31_0:ReplaceSpace(var_31_0))
end

function var_0_0.ReplaceSpace(arg_33_0, arg_33_1)
	return arg_33_1
end

function var_0_0.RecordName(arg_34_0, arg_34_1)
	local var_34_0 = "\n<size=32><color=#2ea9f6>【" .. arg_34_1 .. "】</color></size>\n"

	if SettingData:GetCurrentLanguage() == "kr" then
		local var_34_1 = "\n<size=32><color=#2ea9f6>[" .. arg_34_1 .. "]</color></size>\n"
	end

	local var_34_2 = Object.Instantiate(arg_34_0.historyItemGo_, arg_34_0.historyContentTrans_)
	local var_34_3 = StoryHistoryItem.New(var_34_2)

	table.insert(arg_34_0.historyItems_, var_34_3)

	arg_34_0.curHistoryItem_ = var_34_3

	var_34_3:SetTitle(arg_34_1)
end

function var_0_0.RecordContent(arg_35_0, arg_35_1)
	local var_35_0 = arg_35_1 .. "\n"

	arg_35_0.curHistoryItem_:SetContent(var_35_0)
end

function var_0_0.RecordHistoryTalkVoice(arg_36_0, arg_36_1, arg_36_2, arg_36_3)
	arg_36_0.curHistoryItem_:SetVoiceCallback(function(arg_37_0)
		arg_36_0:StopWaitVoiceLanguageTimer()

		if arg_36_0.voicePlaybackTimer_ == nil then
			arg_36_0.voicePlaybackTimer_ = {}
		end

		if arg_36_0.voicePlaybackTimer_[arg_36_2] then
			return
		end

		arg_36_0:AudioAction("play", "voice", arg_36_1, arg_36_2, arg_36_3)

		local var_37_0 = arg_36_0.CriAtomExPlaybacks_[arg_36_2]

		if var_37_0 then
			arg_36_0.playingRecord_ = true

			local var_37_1

			var_37_1 = FrameTimer.New(function()
				if tonumber(tostring(var_37_0.time)) < 0 then
					arg_36_0.playingRecord_ = false

					arg_37_0:StopVoiceAni()
					var_37_1:Stop()

					arg_36_0.voicePlaybackTimer_[arg_36_2] = nil
				else
					arg_37_0:PlayVoiceAni()
				end
			end, 1, -1)

			var_37_1:Start()

			arg_36_0.voicePlaybackTimer_[arg_36_2] = var_37_1
		end
	end)
end

function var_0_0.GetFullAwbName(arg_39_0, arg_39_1)
	if arg_39_1 ~= "" then
		arg_39_1 = string.format("%s.awb", tostring(arg_39_1))
	end

	return arg_39_1
end

function var_0_0.AudioAction(arg_40_0, arg_40_1, arg_40_2, arg_40_3, arg_40_4, arg_40_5)
	if arg_40_1 == "play" then
		if arg_40_2 == "voice" then
			arg_40_0.CriAtomExPlaybacks_[arg_40_4] = manager.audio:PlayVoice(arg_40_3, arg_40_4, arg_40_0:GetFullAwbName(arg_40_5))
		elseif arg_40_2 == "music" then
			arg_40_0.CriAtomExPlaybacks_[arg_40_4] = manager.audio:PlayBGM(arg_40_3, arg_40_4, arg_40_0:GetFullAwbName(arg_40_5))
		elseif arg_40_2 == "effect" then
			arg_40_0.CriAtomExPlaybacks_[arg_40_4] = manager.audio:PlayEffect(arg_40_3, arg_40_4, arg_40_0:GetFullAwbName(arg_40_5))
		end

		if not arg_40_0.musicType[arg_40_2] then
			arg_40_0.musicType[arg_40_2] = {}
		end

		arg_40_0.musicType[arg_40_2][arg_40_4] = 1
	end

	local var_40_0 = arg_40_0.CriAtomExPlaybacks_[arg_40_4]

	if var_40_0 then
		if arg_40_1 == "pause" then
			var_40_0:Pause()
		elseif arg_40_1 == "resume" then
			var_40_0:Resume(CriAtomEx.ResumeMode.AllPlayback)
		elseif arg_40_1 == "stop" then
			var_40_0:Stop()
		elseif arg_40_1 == "forcestop" then
			var_40_0:Stop(true)
		end
	end
end

function var_0_0.ShowWeapon(arg_41_0, arg_41_1, arg_41_2)
	LuaForUtil.ShowWeapon(arg_41_1, arg_41_2)
end

function var_0_0.CheckSpriteTmpPos(arg_42_0, arg_42_1, arg_42_2)
	arg_42_0.spriteActors_[arg_42_1] = arg_42_2

	for iter_42_0, iter_42_1 in pairs(arg_42_0.spriteActors_) do
		if iter_42_0 ~= arg_42_1 and iter_42_1 == arg_42_2 and not isNil(arg_42_0.actors_[iter_42_0]) then
			arg_42_0.actors_[iter_42_0]:SetActive(false)
		end
	end

	if not isNil(arg_42_0.actors_[arg_42_1]) then
		arg_42_0.actors_[arg_42_1]:SetActive(true)
	end
end

function var_0_0.SetSpriteNiuquEffect(arg_43_0, arg_43_1, arg_43_2)
	arg_43_0.niuquAnimator = arg_43_0.niuqueffectGo_:GetComponent(typeof(Animator))
	arg_43_0.niuquEffectActor[arg_43_1] = arg_43_2

	if not isNil(arg_43_0.actors_[arg_43_1]) then
		local var_43_0 = arg_43_0.actors_[arg_43_1]
		local var_43_1 = arg_43_0.actors_[arg_43_1].transform.childCount
		local var_43_2 = GameObjectTools.GetOrAddComponent(var_43_0, typeof(Animator))
		local var_43_3

		for iter_43_0 = 0, var_43_1 - 1 do
			local var_43_4 = var_43_0.transform:GetChild(iter_43_0)

			if var_43_4.name == "common" then
				local var_43_5 = var_43_4
			end

			local var_43_6 = GameObjectTools.GetOrAddComponent(var_43_4.gameObject, typeof(UI_Shader_Wrap.UIImageGlitch))
			local var_43_7 = var_43_4:GetComponent(typeof(Image))

			if var_43_4.name == "common" then
				local var_43_8 = arg_43_0.niuqucommonGo_:GetComponent(typeof(Image)).material

				var_43_7.material = arg_43_2 and var_43_8 or arg_43_0.commoneffectImg_.material
			else
				local var_43_9 = arg_43_0.niuqueffectGo_:GetComponent(typeof(Image)).material

				var_43_7.material = arg_43_2 and var_43_9 or arg_43_0.spliteffectImg_.material
			end

			var_43_6.enabled = arg_43_2
			var_43_6._BlurSize = 0

			if not arg_43_2 then
				var_43_7.color = Color(1, 1, 1)
			else
				var_43_6._AbberationColor1 = Color(0.76, 1, 0.97)
				var_43_6._AbberationColor2 = Color(0.77, 1, 0.91)
				var_43_6.colorPlus = Color(0.58, 0.76, 1)
				var_43_6.colorPlusIntensity = 1.23
				var_43_6.mainPlusStrength = 0.124
				var_43_6._Segment = 20
				var_43_6._AlphaStrength = 1
				var_43_6._ColorIntensity = 2.43
				var_43_6.mainPlusRotation = 90
				var_43_6.mainPlusTex_ST = Vector4(15, 1, 0, 0)
				var_43_7.color = Color(0.73, 0.9, 1)
			end
		end

		var_43_2.runtimeAnimatorController = Asset.Load("AnimatorController/niuqu")
		var_43_2.enabled = arg_43_2
	end
end

function var_0_0.ResetNiuquEffect(arg_44_0)
	for iter_44_0, iter_44_1 in ipairs(arg_44_0.niuquEffectActor) do
		if not isNil(arg_44_0.actors_[iter_44_0]) and iter_44_1 then
			arg_44_0:SetSpriteNiuquEffect(iter_44_0, false)
		end
	end
end

function var_0_0.PlayTimeline(arg_45_0, arg_45_1, arg_45_2, arg_45_3)
	if arg_45_0.actors_[arg_45_1] == nil then
		local var_45_0 = Object.Instantiate(Asset.Load("Char/" .. arg_45_1), arg_45_0.stage_.transform)

		var_45_0.name = arg_45_1
		var_45_0.transform.localPosition = Vector3.New(0, 100, 0)
		arg_45_0.actors_[arg_45_1] = var_45_0

		local var_45_1 = var_45_0.transform:Find("Directional Light")

		if var_45_1 then
			SetActive(var_45_1.gameObject, false)
		end

		local var_45_2 = var_45_0:GetComponentInChildren(typeof(CharacterEffect))

		var_45_2.enabled = true

		local var_45_3 = GameObjectTools.GetOrAddComponent(var_45_0, typeof(DynamicBoneHelper))

		if var_45_3 then
			var_45_3:EnableDynamicBone(false)
		end

		arg_45_0:ShowWeapon(var_45_2.transform, false)

		arg_45_0.var_[arg_45_1 .. "Animator"] = var_45_2.gameObject:GetComponent(typeof(UnityEngine.Animator))

		if var_45_1 then
			-- block empty
		end

		arg_45_0.var_[arg_45_1 .. "Animator"].applyRootMotion = true
		arg_45_0.var_[arg_45_1 .. "LipSync"] = var_45_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
	end

	local var_45_4 = "ActionTimelineAnimator"

	if arg_45_3 ~= nil then
		var_45_4 = "EmotionTimelineAnimator"
	end

	local var_45_5 = arg_45_0.actors_[arg_45_1]
	local var_45_6 = var_45_4 == "EmotionTimelineAnimator"
	local var_45_7 = Asset.InstantiateWithoutCache(arg_45_2)

	var_45_7.transform:SetParent(var_45_5.transform)

	local var_45_8 = var_45_7.transform:Find("Timeline").gameObject
	local var_45_9 = var_45_8:GetComponent("PlayableDirector")

	if var_45_6 and arg_45_0.var_[arg_45_1 .. var_45_4] and not isNil(arg_45_0.var_[arg_45_1 .. var_45_4]) then
		SetActive(var_45_8.gameObject, false)

		local var_45_10 = arg_45_0.var_[arg_45_1 .. var_45_4]:GetComponent("PlayableDirector")

		arg_45_0.timelineBindMgr.directorA = arg_45_0.var_[arg_45_1 .. var_45_4]:GetComponent("PlayableDirector")
		arg_45_0.timelineBindMgr.directorB = var_45_9:GetComponent("PlayableDirector")
		arg_45_0.timelineBindMgr.tpose_Object = arg_45_0.var_[arg_45_1 .. "Animator"].gameObject

		function arg_45_0.timelineBindMgr.callBack()
			SetActive(var_45_8.gameObject, true)

			var_45_9.time = 0

			var_45_9:Play()
		end

		arg_45_0.timelineBindMgr:GetmationParam()
		arg_45_0.timelineBindMgr:startLerp()
	end

	local var_45_11 = arg_45_0.var_[arg_45_1 .. "Animator"]
	local var_45_12 = arg_45_0.var_[arg_45_1 .. "LipSync"]

	if var_45_9 then
		local var_45_13 = var_45_9.playableAsset
		local var_45_14 = var_45_13.outputTrackCount

		for iter_45_0 = 0, var_45_14 - 1 do
			local var_45_15 = var_45_13:GetOutputTrack(iter_45_0)
			local var_45_16 = var_45_15.name

			if (var_45_16 == "Animator" or var_45_16 == "Animator Track") and var_45_11 then
				animationClip = var_45_15:GetClips()

				var_45_9:SetGenericBinding(var_45_15, var_45_11)

				if arg_45_0.var_[arg_45_1 .. var_45_4] then
					Object.Destroy(arg_45_0.var_[arg_45_1 .. var_45_4], var_45_6 and 0.3 or 0)
				end

				arg_45_0.var_[arg_45_1 .. var_45_4] = var_45_8
			elseif var_45_16 == "LipSync" and var_45_12 then
				var_45_9:SetGenericBinding(var_45_15, var_45_12)
			elseif var_45_16 == "Story Timeline Enable Render Track" then
				var_45_9:SetGenericBinding(var_45_15, var_45_5)
			end
		end

		if not var_45_6 then
			var_45_9.time = 0

			var_45_9:Play()
		end

		var_45_9.stopped = var_45_9.stopped + function(arg_47_0)
			Object.Destroy(arg_47_0.transform.parent.gameObject, 0.1)
		end

		table.insert(arg_45_0.timelineDirector, var_45_9)
	end
end

function var_0_0.Dispose(arg_48_0)
	manager.notify:RemoveListener(SOUND_SETTING_SWICH, arg_48_0.OnSoundSettingSwitchHandler_)

	arg_48_0.OnSoundSettingSwitchHandler_ = nil

	manager.notify:RemoveListener(STORY_SWITCH_VOICE_LANGUAGE, arg_48_0.OnVoiceLanguageSwitchHandler_)

	arg_48_0.OnVoiceLanguageSwitchHandler_ = nil

	arg_48_0:StopWaitVoiceLanguageTimer()

	if arg_48_0.isInLoopVideo then
		manager.video:Dispose()
	end

	if not isNil(arg_48_0.sceneSettingEffect_) then
		arg_48_0.sceneSettingEffect_.enabled = true
	end

	for iter_48_0, iter_48_1 in pairs(arg_48_0.timelineDirector) do
		if not isNil(iter_48_1) then
			iter_48_1:Stop()
		end
	end

	arg_48_0.timelineDirector = {}

	if arg_48_0.gameObject_ then
		Object.Destroy(arg_48_0.gameObject_)

		arg_48_0.gameObject_ = nil
	end

	for iter_48_2, iter_48_3 in pairs(arg_48_0.bgs_) do
		if iter_48_3 then
			Object.Destroy(iter_48_3)
		end
	end

	for iter_48_4, iter_48_5 in pairs(arg_48_0.actors_) do
		if iter_48_5 then
			Object.Destroy(iter_48_5)
		end
	end

	if arg_48_0.stage_ then
		Object.Destroy(arg_48_0.stage_, 1)

		arg_48_0.stage_ = nil
	end

	for iter_48_6, iter_48_7 in pairs(arg_48_0.CriAtomExPlaybacks_) do
		if iter_48_7 then
			iter_48_7:Stop()
		end
	end

	if arg_48_0.voicePlaybackTimer_ then
		for iter_48_8, iter_48_9 in pairs(arg_48_0.voicePlaybackTimer_) do
			if iter_48_9 then
				arg_48_0.playingRecord_ = false

				iter_48_9:Stop()
			end
		end
	end

	for iter_48_10, iter_48_11 in pairs(arg_48_0.actionList) do
		if iter_48_11.Dispose then
			iter_48_11:Dispose()
		end
	end

	manager.audio:ClearBGMFlag()
	manager.uiTime:OnExitStory(arg_48_0.storyId_)

	for iter_48_12, iter_48_13 in pairs(arg_48_0.var_) do
		if iter_48_13 and type(iter_48_13) == "userdata" and string.find(iter_48_12, "effect") then
			Object.Destroy(iter_48_13)
		end
	end

	if arg_48_0.skipView_ then
		arg_48_0.skipView_:Dispose()

		arg_48_0.skipView_ = nil
	end

	for iter_48_14, iter_48_15 in ipairs(arg_48_0.historyItems_) do
		iter_48_15:Dispose()
	end

	arg_48_0.curHistoryItem_ = nil
	arg_48_0.CriAtomExPlaybacks_ = {}
	arg_48_0.isPlay_ = false
	arg_48_0.auto_ = false
	arg_48_0.time_ = 0
	arg_48_0.duration_ = 0
	arg_48_0.state_ = ""
	arg_48_0.curStory_ = nil
	arg_48_0.isInRecall_ = false
	arg_48_0.onSingleLineFinish_ = nil
	arg_48_0.onSingleLineUpdate_ = nil
	arg_48_0.onStoryFinished_ = nil
	arg_48_0.playNext_ = nil

	if arg_48_0.timelineBindMgr then
		arg_48_0.timelineBindMgr:Dispose()

		arg_48_0.timelineBindMgr = nil
	end

	arg_48_0.bgs_ = {}
	arg_48_0.actors_ = {}
	arg_48_0.var_ = {}
	arg_48_0.spriteActors_ = {}

	AnimatorTools.Stop()
	var_0_0.super.Dispose(arg_48_0)
	arg_48_0:AudioAction("play", "voice", "story_v_empty", "empty", "")
end

function var_0_0.HideSkipBtn(arg_49_0, arg_49_1)
	SetActive(arg_49_0.skipBtn_.gameObject, not arg_49_1)
end

function var_0_0.Play(arg_50_0, arg_50_1)
	manager.guide.weakView:Hide()
	manager.uiTime:OnEnterStory(arg_50_1)

	arg_50_0.storyId_ = arg_50_1
	arg_50_0.var_ = {}

	local var_50_0 = _G["Story" .. arg_50_1]

	local function var_50_1()
		arg_50_0.curStory_ = StoryCfg[arg_50_1]

		local var_51_0 = arg_50_0.curStory_.start

		arg_50_0.curStoryInstance_ = var_50_0

		var_50_0["Play" .. var_51_0](var_50_0, arg_50_0)

		arg_50_0.isPlay_ = true

		manager.story:ResetStoryChoice()
		print("开始播放 " .. arg_50_1 .. ", " .. var_51_0)
	end

	arg_50_0:CheckNeedDownloadAssets(var_50_0, var_50_1)
end

function var_0_0.CheckNeedDownloadAssets(arg_52_0, arg_52_1, arg_52_2)
	if AssetDownloadManager.CheckResourcesNeedDownload(arg_52_1.assets) or AssetDownloadManager.CheckVoiceNeedDownload(arg_52_1.voices) then
		SetForceShowQuanquan(true)
		AssetDownloadManager.Create()
		AssetDownloadManager.Instance:AddResourceToDownloadQueue(arg_52_1.assets)
		AssetDownloadManager.Instance:AddVoiceToDownloadQueue(arg_52_1.voices)
		AssetDownloadManager.Instance:Run(nil, function()
			AssetDownloadManager.Destroy()
			arg_52_2()
			SetForceShowQuanquan(false)
		end, function()
			AssetDownloadManager.Destroy()
			SetForceShowQuanquan(false)
			arg_52_0.onStoryFinished_(true)
		end)
	else
		arg_52_2()
	end
end

function var_0_0.RecordAudio(arg_55_0, arg_55_1, arg_55_2)
	arg_55_0.CriAtomExPlaybacks_[arg_55_1] = arg_55_2
end

function var_0_0.GetPercentByPara(arg_56_0, arg_56_1, arg_56_2)
	local var_56_0 = 0
	local var_56_1 = string.split(arg_56_1, "\n\n")

	if table.length(var_56_1) <= 1 then
		var_56_1 = string.split(arg_56_1, "\n")
	end

	arg_56_1 = string.gsub(string.gsub(string.gsub(arg_56_1, "\n\n", ""), "\n", ""), " ", "")

	for iter_56_0 = 1, arg_56_2 do
		local var_56_2 = var_56_1[iter_56_0]
		local var_56_3 = string.gsub(string.gsub(string.gsub(var_56_2, "\n\n", ""), "\n", ""), " ", "")

		var_56_0 = var_56_0 + utf8.len(var_56_3)
	end

	return var_56_0 / utf8.len(arg_56_1), var_56_0
end

function var_0_0.CheckCanSkipToEnd(arg_57_0)
	if arg_57_0.curStoryInstance_.skipMarkers then
		for iter_57_0 = 1, #arg_57_0.curStoryInstance_.skipMarkers do
			if arg_57_0.curStoryInstance_.skipMarkers[iter_57_0] > arg_57_0.curTalkId_ then
				return false, arg_57_0.curStoryInstance_.skipMarkers[iter_57_0]
			end
		end
	end

	return true, nil
end

function var_0_0.GetWordFromCfg(arg_58_0, arg_58_1)
	if StoryWordCfg[arg_58_1] ~= nil then
		return StoryWordCfg[arg_58_1]
	else
		local var_58_0 = 1
		local var_58_1

		repeat
			var_58_0 = var_58_0 + 1

			local var_58_2 = string.format("StoryWordCfg%d", var_58_0)

			if _G[var_58_2] and _G[var_58_2][arg_58_1] then
				return _G[var_58_2][arg_58_1]
			end
		until _G[var_58_2] == nil
	end

	error("无法在StoryWordCfg表中找到 " .. arg_58_1)

	return nil
end

function var_0_0.RefreshSoundState(arg_59_0)
	if SettingData:GetSoundSettingData().sound_open == 1 then
		arg_59_0.soundController_:SetSelectedState("on")
	else
		arg_59_0.soundController_:SetSelectedState("off")
	end
end

function var_0_0.OnSoundSettingSwitch(arg_60_0)
	arg_60_0:RefreshSoundState()
end

function var_0_0.OnVoiceLanguageSwitch(arg_61_0, arg_61_1)
	arg_61_0.voiceLanguage_ = arg_61_1

	if arg_61_0.state_ == "waiting" and not arg_61_0.playingRecord_ then
		SettingData:SetStoryVoiceLanguageCache()
		SettingAction.ChangeSoundSetting("voice_language", arg_61_0.voiceLanguage_)
	else
		arg_61_0:AddWaitVoiceLanguageTimer()
	end

	SettingData:SetStoryVoiceLanguageCache()
	SettingAction.ChangeSoundSetting("voice_language", arg_61_1)
end

function var_0_0.AddWaitVoiceLanguageTimer(arg_62_0)
	arg_62_0.voiceLanguageTimer_ = FrameTimer.New(function()
		if arg_62_0.state_ == "waiting" and not arg_62_0.playingRecord_ then
			arg_62_0:StopWaitVoiceLanguageTimer()
		end
	end, 1, -1)

	arg_62_0.voiceLanguageTimer_:Start()
end

function var_0_0.StopWaitVoiceLanguageTimer(arg_64_0)
	if arg_64_0.voiceLanguageTimer_ then
		arg_64_0.playingRecord_ = false

		SettingData:SetStoryVoiceLanguageCache()
		SettingAction.ChangeSoundSetting("voice_language", arg_64_0.voiceLanguage_)
		arg_64_0.voiceLanguageTimer_:Stop()

		arg_64_0.voiceLanguageTimer_ = nil
	end
end

function var_0_0.RecordChoiceLog(arg_65_0, arg_65_1, arg_65_2, arg_65_3, arg_65_4)
	arg_65_0.curChoiseId = tonumber(arg_65_1)

	if not arg_65_0.choicesID[tonumber(arg_65_1)] then
		arg_65_0.choicesID[tonumber(arg_65_1)] = {
			arg_65_2,
			arg_65_3,
			arg_65_4
		}
	end
end

function var_0_0.GetChoiceLog(arg_66_0, arg_66_1)
	local var_66_0 = "["

	if arg_66_0.choicesID[tonumber(arg_66_1)] then
		for iter_66_0, iter_66_1 in ipairs(arg_66_0.choicesID[tonumber(arg_66_1)]) do
			if iter_66_0 == 1 then
				var_66_0 = var_66_0 .. iter_66_1
			else
				var_66_0 = var_66_0 .. "," .. iter_66_1
			end
		end

		return var_66_0 .. "]"
	end

	return ""
end

return var_0_0
