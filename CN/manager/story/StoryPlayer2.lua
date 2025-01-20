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

	arg_1_0:InitUI()
	arg_1_0:InitUIEvents()
end

function var_0_0.InitUI(arg_2_0)
	arg_2_0.gameObject_ = Object.Instantiate(Asset.Load("Widget/System/Story/StoryUI"), manager.ui.uiStory.transform)
	arg_2_0.transform_ = arg_2_0.gameObject_.transform

	ComponentBinder.GetInstance():BindCfgUI(arg_2_0, arg_2_0.gameObject_)
	arg_2_0:AdaptScreen()

	arg_2_0.settingData = SettingData:GetGameSettingData()
	arg_2_0.iconController_ = ControllerUtil.GetController(arg_2_0.iconTrs_, "conName")
	arg_2_0.musicController = arg_2_0.musicController_:GetController("music")
	arg_2_0.choices_ = {}

	for iter_2_0 = 1, 3 do
		arg_2_0.choices_[iter_2_0] = {
			isShow = true,
			go = arg_2_0["itemGo" .. iter_2_0 .. "_"],
			txt = arg_2_0["itemText" .. iter_2_0 .. "_"]
		}
	end

	arg_2_0.fswtw_ = arg_2_0.typeWritterGo_:GetComponent("UITypewriterEffect")

	arg_2_0.fswbg_:SetActive(false)
	SetActive(arg_2_0.lastBtn_.gameObject, true)
	SetActive(arg_2_0.bgmBtn_.gameObject, true)
	SetActive(arg_2_0.locationGo_, false)
	SetActive(arg_2_0.dialog_, false)
	SetActive(arg_2_0.bgmBtn_.gameObject, arg_2_0.settingData.show_music_name == 1)

	arg_2_0.bgmTxt_.text = ""
	arg_2_0.bgmTxt2_.text = ""

	arg_2_0.musicController:SetSelectedState("hide")

	if SceneSetting.Current then
		arg_2_0.sceneSettingEffect_ = SceneSetting.Current

		arg_2_0.sceneSettingGo_:SetActive(false)
	else
		arg_2_0.sceneSettingGo_:SetActive(true)
	end

	arg_2_0.screenFilterGo_:SetActive(false)

	arg_2_0.screenFilterEffect_ = arg_2_0.screenFilterGo_:GetComponent("Volume")
	arg_2_0.typewritter = arg_2_0.text_.gameObject:GetComponent("UITypewriterEffect")
	arg_2_0.dialogCg_.alpha = 0
	arg_2_0.blackMask_.alpha = 0
	arg_2_0.blackMask_.blocksRaycasts = false

	arg_2_0:ShowNextGo(false)

	arg_2_0.autoplayController_ = arg_2_0.controller_:GetController("autoplay")
	arg_2_0.hideBtnsController_ = arg_2_0.controller_:GetController("hideBtns")
	arg_2_0.callingController_ = arg_2_0.controller_:GetController("Calling")
	arg_2_0.timestampController_ = arg_2_0.controller_:GetController("Timestamp")
	arg_2_0.timestampColorController_ = arg_2_0.timestampControllerexcollection_:GetController("BlueRed")

	arg_2_0.timestampController_:SetSelectedState("hide")

	arg_2_0.historyItems_ = {}
	arg_2_0.lastHistoryVoiceIdx_ = nil
	arg_2_0.curHistoryItem_ = nil
	arg_2_0.musicType = {}
	arg_2_0.niuquEffectActor = {}

	SetActive(arg_2_0.talkGo_, false)
	arg_2_0.autoplayController_:SetSelectedState("manual")
end

function var_0_0.InitUIEvents(arg_3_0)
	arg_3_0:AddBtnListener(arg_3_0.allBtn_, nil, function()
		arg_3_0:OnClickBtnAll()
	end)
	arg_3_0:AddBtnListener(arg_3_0.panelBtn_, nil, function()
		arg_3_0:OnClickBtnAll()
	end)
	arg_3_0:AddBtnListener(arg_3_0.hideBtn_, nil, function()
		if arg_3_0.auto_ then
			arg_3_0.auto_ = false

			arg_3_0.autoplayController_:SetSelectedState("manual")
		end

		SetActive(arg_3_0.dialog_, false)
		arg_3_0.hideBtnsController_:SetSelectedState("hide")

		arg_3_0.allBtnState = arg_3_0.allBtn_.enabled
		arg_3_0.fullScreenWordFlag_ = arg_3_0.fswbg_.activeSelf

		SetActive(arg_3_0.fswbg_, false)

		arg_3_0.state_ = "hiding"
		arg_3_0.isPlay_ = false

		local var_6_0 = PlayerData:GetStoryList()
		local var_6_1
		local var_6_2 = var_6_0[arg_3_0.curStory_.id] and 0 or 1

		SDKTools.SendMessageToSDK("story_oper", {
			oper = StoryOperDefine.HIDE,
			is_first = var_6_2,
			story_id = arg_3_0.curStory_.id
		})
	end)
	arg_3_0:AddBtnListener(arg_3_0.autoBtn_, nil, function()
		arg_3_0.auto_ = true

		arg_3_0.autoplayController_:SetSelectedState("auto")

		local var_7_0 = PlayerData:GetStoryList()
		local var_7_1
		local var_7_2 = var_7_0[arg_3_0.curStory_.id] and 0 or 1

		SDKTools.SendMessageToSDK("story_oper", {
			oper = StoryOperDefine.AUTO,
			is_first = var_7_2,
			story_id = string.format(arg_3_0.curStory_.id)
		})
	end)
	arg_3_0:AddBtnListener(arg_3_0.manualBtn_, nil, function()
		arg_3_0.auto_ = false

		arg_3_0.autoplayController_:SetSelectedState("manual")
	end)
	arg_3_0:AddBtnListener(arg_3_0.bgmBtn_, nil, function()
		if arg_3_0.musicController:GetSelectedState() == "show" then
			arg_3_0.musicController:SetSelectedState("hide")
			arg_3_0.musicAnimator_:Play("back")
		else
			arg_3_0.musicController:SetSelectedState("show")
			arg_3_0.musicAnimator_:Play("open")
		end

		if arg_3_0.bgmTimer then
			arg_3_0.bgmTimer:Stop()

			arg_3_0.bgmTimer = nil
		end
	end)
	SetActive(arg_3_0.history_, true)
	SetActive(arg_3_0.history_, false)
	arg_3_0:AddBtnListener(arg_3_0.lastBtn_, nil, function()
		if SDKTools.GetIsOverSea() then
			arg_3_0:JumpToEnd()
		end

		arg_3_0.isPlay_ = false

		SetActive(arg_3_0.history_, true)
		arg_3_0.hideBtnsController_:SetSelectedState("hide")
		manager.ui:SetUISeparateRender(true)

		arg_3_0.historyRect_.verticalNormalizedPosition = 0

		local var_10_0 = PlayerData:GetStoryList()
		local var_10_1
		local var_10_2 = var_10_0[arg_3_0.curStory_.id] and 0 or 1

		SDKTools.SendMessageToSDK("story_oper", {
			oper = StoryOperDefine.REPLAY,
			is_first = var_10_2,
			story_id = string.format(arg_3_0.curStory_.id)
		})
	end)
	arg_3_0:AddBtnListener(arg_3_0.historyBtn_, nil, function()
		arg_3_0.isPlay_ = true

		SetActive(arg_3_0.history_, false)
		arg_3_0.hideBtnsController_:SetSelectedState("show")
		manager.ui:SetUISeparateRender(false)
	end)

	for iter_3_0 = 1, 3 do
		arg_3_0:AddBtnListener(arg_3_0["itemBtn" .. iter_3_0 .. "_"], nil, function()
			manager.story:SetStoryChoice(iter_3_0)
			arg_3_0.playNext_(iter_3_0)
			SetActive(arg_3_0.choicesGo_, false)
		end)
	end

	arg_3_0:AddBtnListener(arg_3_0.skipBtn_, nil, function()
		local var_13_0, var_13_1 = arg_3_0:CheckCanSkipToEnd()

		if var_13_0 then
			arg_3_0:Skip()
		else
			arg_3_0:JumpToMarker(var_13_1)
		end

		SetActive(arg_3_0.choicesGo_, false)
	end)
	arg_3_0:AddBtnListener(arg_3_0.narrativeSkipBtn_, nil, function()
		arg_3_0.onStoryFinished_(true)
	end)
	arg_3_0:AddBtnListener(arg_3_0.narrativeExitBtn_, nil, function()
		arg_3_0.onStoryFinished_(true)
	end)
	arg_3_0:AddBtnListener(arg_3_0.narrativeContinueBtn_, nil, function()
		arg_3_0.onStoryFinished_(true)
	end)
end

function var_0_0.OnClickBtnAll(arg_17_0)
	if arg_17_0.state_ == "hiding" then
		arg_17_0.state_ = "waiting"
		arg_17_0.isPlay_ = true

		SetActive(arg_17_0.dialog_, true)
		arg_17_0.hideBtnsController_:SetSelectedState("show")

		arg_17_0.allBtn_.enabled = arg_17_0.allBtnState

		SetActive(arg_17_0.fswbg_, arg_17_0.fullScreenWordFlag_ and true)

		if arg_17_0.fullScreenWordFlag_ == true then
			SetActive(arg_17_0.dialog_, false)
		end
	elseif arg_17_0.state_ == "waiting" and not arg_17_0.choicesGo_.activeSelf then
		arg_17_0.playNext_(1)
	elseif arg_17_0.dialogNext_.activeSelf and arg_17_0.typewriterNext_.activeSelf and not arg_17_0.choicesGo_.activeSelf then
		arg_17_0:JumpToEnd()

		if not arg_17_0.choicesGo_.activeSelf then
			arg_17_0.playNext_(1)
		end
	elseif arg_17_0.state_ == "playing" then
		arg_17_0:JumpToEnd()
	end
end

function var_0_0.JumpToEnd(arg_18_0)
	local var_18_0 = (arg_18_0.duration_ - arg_18_0.time_) / 0.033 + 1

	for iter_18_0 = 1, var_18_0 do
		arg_18_0:Update(0.033)
	end

	if arg_18_0.dialogScrollRect_ then
		arg_18_0.dialogScrollRect_.normalizedPosition = Vector2(0, 0)
	end
end

function var_0_0.JumpToMarker(arg_19_0, arg_19_1)
	while arg_19_1 > arg_19_0.curTalkId_ do
		arg_19_0:JumpToEnd()
		arg_19_0.playNext_(1)
	end

	if arg_19_1 == arg_19_0.curTalkId_ then
		local var_19_0 = (arg_19_0.duration_ - arg_19_0.time_) / 0.033 + 1

		for iter_19_0 = 1, var_19_0 do
			arg_19_0:Update(0.033)

			if arg_19_0.marker ~= "" then
				return
			end
		end
	end

	arg_19_0:Skip()
end

function var_0_0.StopAllVoice(arg_20_0)
	for iter_20_0, iter_20_1 in pairs(arg_20_0.CriAtomExPlaybacks_) do
		if iter_20_1 then
			iter_20_1:Stop()
		end
	end

	arg_20_0.CriAtomExPlaybacks_ = {}

	arg_20_0:StopBgmTxt()
end

function var_0_0.StopBgmTxt(arg_21_0)
	if arg_21_0.bgmTimer then
		arg_21_0.bgmTimer:Stop()

		arg_21_0.bgmTimer = nil
	end

	if arg_21_0 == nil or isNil(arg_21_0.bgmTxt_) then
		return
	end

	arg_21_0.musicController:SetSelectedState("hide")
	arg_21_0.musicAnimator_:Play("back", 0, 0)

	arg_21_0.bgmTxt_.text = ""
	arg_21_0.bgmTxt2_.text = ""
end

function var_0_0.PlayOnlyBgm(arg_22_0)
	for iter_22_0, iter_22_1 in pairs(arg_22_0.CriAtomExPlaybacks_) do
		if iter_22_1 and arg_22_0.musicType.music and not arg_22_0.musicType.music[iter_22_0] == 1 then
			iter_22_1:Stop()
			table.remove(arg_22_0.CriAtomExPlaybacks_, iter_22_0)
		end
	end
end

function var_0_0.Skip(arg_23_0, arg_23_1)
	local var_23_0 = false

	if not arg_23_1 then
		arg_23_1 = StoryOperDefine.PASS
	else
		var_23_0 = true
	end

	local var_23_1 = arg_23_0.curStory_.name
	local var_23_2 = arg_23_0.curStory_.desc

	arg_23_0.isPlay_ = false
	arg_23_0.auto_ = false

	arg_23_0.autoplayController_:SetSelectedState("manual")

	if var_23_2 and var_23_2 ~= "" then
		for iter_23_0, iter_23_1 in pairs(arg_23_0.CriAtomExPlaybacks_) do
			if iter_23_1 then
				iter_23_1:Pause()
			end
		end

		manager.audio:ClearBGMFlag()

		local var_23_3 = manager.story:IsStoryPlayed(arg_23_0.curStory_.id)
		local var_23_4

		if arg_23_0.skipView_ == nil then
			if var_23_3 or var_23_0 then
				var_23_4 = "Widget/System/Story/StorySkipUI"

				local var_23_5 = Asset.Load(var_23_4)
				local var_23_6 = Object.Instantiate(var_23_5, manager.ui.uiStory.transform)

				arg_23_0.skipView_ = StoryForceSkipView.New(var_23_6)
			else
				var_23_4 = "Widget/System/Story/StorySkip2UI"

				local var_23_7 = Asset.Load(var_23_4)
				local var_23_8 = Object.Instantiate(var_23_7, manager.ui.uiStory.transform)

				arg_23_0.skipView_ = StorySkip2View.New(var_23_8)
			end
		else
			SetActive(arg_23_0.skipView_.gameObject_, true)
		end

		if not var_23_3 and not var_23_0 then
			manager.ui:SetUISeparateRender(true)
		end

		arg_23_0.skipView_:SetContentTitle(var_23_1, var_23_2)
		arg_23_0.skipView_:SetCallback(handler(arg_23_0, function(arg_24_0, arg_24_1)
			if arg_24_1 then
				arg_23_0.isPlay_ = true

				for iter_24_0, iter_24_1 in pairs(arg_23_0.CriAtomExPlaybacks_) do
					if iter_24_1 then
						iter_24_1:Resume(CriAtomEx.ResumeMode.PausedPlayback)
					end
				end

				if arg_23_0.skipView_ then
					arg_23_0.skipView_:Dispose()

					arg_23_0.skipView_ = nil
				end

				if var_23_4 then
					Asset.Unload(var_23_4)
				end

				return
			end

			local var_24_0 = PlayerData:GetStoryList()
			local var_24_1
			local var_24_2 = var_24_0[arg_23_0.curStory_.id] and 0 or 1

			SDKTools.SendMessageToSDK("story_oper", {
				oper = arg_23_1,
				is_first = var_24_2,
				story_id = string.format(arg_23_0.curStory_.id)
			})

			if BirthdayCfg.get_id_list_by_story_id[arg_23_0.curStory_.id] and var_24_2 == 1 then
				SDKTools.SendMessageToSDK("birthday_viewed", {
					story_skip = 1
				})
			end

			arg_23_0:StopPassVoice()
			arg_23_0.onStoryFinished_(true)
		end))
	else
		local var_23_9 = PlayerData:GetStoryList()
		local var_23_10
		local var_23_11 = var_23_9[arg_23_0.curStory_.id] and 0 or 1

		SDKTools.SendMessageToSDK("story_oper", {
			oper = arg_23_1,
			is_first = var_23_11,
			story_id = string.format(arg_23_0.curStory_.id)
		})

		if BirthdayCfg.get_id_list_by_story_id[arg_23_0.curStory_.id] and var_23_11 == 1 then
			SDKTools.SendMessageToSDK("birthday_viewed", {
				story_skip = 1
			})
		end

		arg_23_0:StopPassVoice()
		arg_23_0.onStoryFinished_(true)
	end
end

function var_0_0.StopPassVoice(arg_25_0)
	manager.audio:PlayBGM("ui_skip", "ui_reset_filter")
	manager.audio:PlayEffect("ui_skip", "ui_reset", "")
	manager.audio:PlayEffect("se_story_activity_1_2_summer1", "se_story_activity_1_2_lowpass_stop", "")
end

function var_0_0.SetGaussion(arg_26_0, arg_26_1)
	arg_26_0:SetGaussionBg(arg_26_1)
	manager.ui:SetUISeparateRender(arg_26_1)
	SetActive(arg_26_0.gaussionBgGo_, arg_26_1)
end

function var_0_0.ShowNextGo(arg_27_0, arg_27_1)
	SetActive(arg_27_0.dialogNext_, arg_27_1)
	SetActive(arg_27_0.dialogNextBtnGo_, not arg_27_1)
	SetActive(arg_27_0.typewriterNext_, arg_27_1)
end

function var_0_0.Update(arg_28_0, arg_28_1)
	if not arg_28_0.isPlay_ then
		if arg_28_0.state_ == "hiding" then
			if Input.anyKey then
				arg_28_0.__isAnyKey = true
			elseif arg_28_0.__isAnyKey then
				arg_28_0.__isAnyKey = false

				if not Input.GetMouseButtonUp(0) then
					arg_28_0:OnClickBtnAll()
				end
			end

			arg_28_0.allBtn_.enabled = true
		end

		return
	end

	if arg_28_0.state_ ~= "pause" then
		arg_28_0.time_ = arg_28_0.time_ + arg_28_1
		arg_28_0.frameCnt_ = arg_28_0.frameCnt_ + 1
	end

	if arg_28_0.onSingleLineUpdate_ then
		arg_28_0.onSingleLineUpdate_(arg_28_1)
	end

	if arg_28_0.time_ > arg_28_0.duration_ and arg_28_0.onSingleLineFinish_ then
		arg_28_0.onSingleLineFinish_()

		if arg_28_0.duration_ < 2 then
			arg_28_0.auto_time = 2 - arg_28_0.duration_
		end

		if arg_28_0.auto_time <= 0 then
			arg_28_0.auto_time = 1
		end
	end

	if arg_28_0.state_ == "waiting" and arg_28_0.playNext_ and arg_28_0.auto_ then
		if arg_28_0.auto_time <= 0 and not arg_28_0.choicesGo_.activeSelf then
			arg_28_0.playNext_(1)

			arg_28_0.auto_time = 0
		else
			arg_28_0.auto_time = arg_28_0.auto_time - arg_28_1
		end
	end
end

function var_0_0.FormatText(arg_29_0, arg_29_1)
	arg_29_1 = GetI18NText(arg_29_1)

	local var_29_0 = string.gsub(arg_29_1, "#{(%w+)}#", function(arg_30_0)
		local var_30_0 = arg_29_0.keyword[arg_30_0]

		if var_30_0 then
			return var_30_0
		else
			return arg_30_0
		end
	end)

	return (arg_29_0:ReplaceSpace(var_29_0))
end

function var_0_0.ReplaceSpace(arg_31_0, arg_31_1)
	return arg_31_1
end

function var_0_0.RecordName(arg_32_0, arg_32_1)
	local var_32_0 = "\n<size=32><color=#2ea9f6>【" .. arg_32_1 .. "】</color></size>\n"

	if SettingData:GetCurrentLanguage() == "kr" then
		local var_32_1 = "\n<size=32><color=#2ea9f6>[" .. arg_32_1 .. "]</color></size>\n"
	end

	local var_32_2 = Object.Instantiate(arg_32_0.historyItemGo_, arg_32_0.historyContentTrans_)
	local var_32_3 = StoryHistoryItem.New(var_32_2)

	table.insert(arg_32_0.historyItems_, var_32_3)

	arg_32_0.curHistoryItem_ = var_32_3

	var_32_3:SetTitle(arg_32_1)
end

function var_0_0.RecordContent(arg_33_0, arg_33_1)
	local var_33_0 = arg_33_1 .. "\n"

	arg_33_0.curHistoryItem_:SetContent(var_33_0)
end

function var_0_0.RecordHistoryTalkVoice(arg_34_0, arg_34_1, arg_34_2, arg_34_3)
	arg_34_0.curHistoryItem_:SetVoiceCallback(function(arg_35_0)
		if arg_34_0.voicePlaybackTimer_ == nil then
			arg_34_0.voicePlaybackTimer_ = {}
		end

		if arg_34_0.voicePlaybackTimer_[arg_34_2] then
			return
		end

		arg_34_0:AudioAction("play", "voice", arg_34_1, arg_34_2, arg_34_3)

		local var_35_0 = arg_34_0.CriAtomExPlaybacks_[arg_34_2]

		if var_35_0 then
			local var_35_1

			var_35_1 = FrameTimer.New(function()
				if tonumber(tostring(var_35_0.time)) < 0 then
					arg_35_0:StopVoiceAni()
					var_35_1:Stop()

					arg_34_0.voicePlaybackTimer_[arg_34_2] = nil
				else
					arg_35_0:PlayVoiceAni()
				end
			end, 1, -1)

			var_35_1:Start()

			arg_34_0.voicePlaybackTimer_[arg_34_2] = var_35_1
		end
	end)
end

function var_0_0.GetFullAwbName(arg_37_0, arg_37_1)
	if arg_37_1 ~= "" then
		arg_37_1 = string.format("%s.awb", tostring(arg_37_1))
	end

	return arg_37_1
end

function var_0_0.AudioAction(arg_38_0, arg_38_1, arg_38_2, arg_38_3, arg_38_4, arg_38_5)
	if arg_38_1 == "play" then
		if arg_38_2 == "voice" then
			arg_38_0.CriAtomExPlaybacks_[arg_38_4] = manager.audio:PlayVoice(arg_38_3, arg_38_4, arg_38_0:GetFullAwbName(arg_38_5))
		elseif arg_38_2 == "music" then
			arg_38_0.CriAtomExPlaybacks_[arg_38_4] = manager.audio:PlayBGM(arg_38_3, arg_38_4, arg_38_0:GetFullAwbName(arg_38_5))
		elseif arg_38_2 == "effect" then
			arg_38_0.CriAtomExPlaybacks_[arg_38_4] = manager.audio:PlayEffect(arg_38_3, arg_38_4, arg_38_0:GetFullAwbName(arg_38_5))
		end

		if not arg_38_0.musicType[arg_38_2] then
			arg_38_0.musicType[arg_38_2] = {}
		end

		arg_38_0.musicType[arg_38_2][arg_38_4] = 1
	end

	local var_38_0 = arg_38_0.CriAtomExPlaybacks_[arg_38_4]

	if var_38_0 then
		if arg_38_1 == "pause" then
			var_38_0:Pause()
		elseif arg_38_1 == "resume" then
			var_38_0:Resume(CriAtomEx.ResumeMode.AllPlayback)
		elseif arg_38_1 == "stop" then
			var_38_0:Stop()
		elseif arg_38_1 == "forcestop" then
			var_38_0:Stop(true)
		end
	end
end

function var_0_0.ShowWeapon(arg_39_0, arg_39_1, arg_39_2)
	LuaForUtil.ShowWeapon(arg_39_1, arg_39_2)
end

function var_0_0.CheckSpriteTmpPos(arg_40_0, arg_40_1, arg_40_2)
	arg_40_0.spriteActors_[arg_40_1] = arg_40_2

	for iter_40_0, iter_40_1 in pairs(arg_40_0.spriteActors_) do
		if iter_40_0 ~= arg_40_1 and iter_40_1 == arg_40_2 and not isNil(arg_40_0.actors_[iter_40_0]) then
			arg_40_0.actors_[iter_40_0]:SetActive(false)
		end
	end

	if not isNil(arg_40_0.actors_[arg_40_1]) then
		arg_40_0.actors_[arg_40_1]:SetActive(true)
	end
end

function var_0_0.SetSpriteNiuquEffect(arg_41_0, arg_41_1, arg_41_2)
	arg_41_0.niuquAnimator = arg_41_0.niuqueffectGo_:GetComponent(typeof(Animator))
	arg_41_0.niuquEffectActor[arg_41_1] = arg_41_2

	if not isNil(arg_41_0.actors_[arg_41_1]) then
		local var_41_0 = arg_41_0.actors_[arg_41_1]
		local var_41_1 = arg_41_0.actors_[arg_41_1].transform.childCount
		local var_41_2 = GameObjectTools.GetOrAddComponent(var_41_0, typeof(Animator))
		local var_41_3

		for iter_41_0 = 0, var_41_1 - 1 do
			local var_41_4 = var_41_0.transform:GetChild(iter_41_0)

			if var_41_4.name == "common" then
				local var_41_5 = var_41_4
			end

			local var_41_6 = GameObjectTools.GetOrAddComponent(var_41_4.gameObject, typeof(UI_Shader_Wrap.UIImageGlitch))
			local var_41_7 = var_41_4:GetComponent(typeof(Image))

			if var_41_4.name == "common" then
				local var_41_8 = arg_41_0.niuqucommonGo_:GetComponent(typeof(Image)).material

				var_41_7.material = arg_41_2 and var_41_8 or arg_41_0.commoneffectImg_.material
			else
				local var_41_9 = arg_41_0.niuqueffectGo_:GetComponent(typeof(Image)).material

				var_41_7.material = arg_41_2 and var_41_9 or arg_41_0.spliteffectImg_.material
			end

			var_41_6.enabled = arg_41_2
			var_41_6._BlurSize = 0

			if not arg_41_2 then
				var_41_7.color = Color(1, 1, 1)
			else
				var_41_6._AbberationColor1 = Color(0.76, 1, 0.97)
				var_41_6._AbberationColor2 = Color(0.77, 1, 0.91)
				var_41_6.colorPlus = Color(0.58, 0.76, 1)
				var_41_6.colorPlusIntensity = 1.23
				var_41_6.mainPlusStrength = 0.124
				var_41_6._Segment = 20
				var_41_6._AlphaStrength = 1
				var_41_6._ColorIntensity = 2.43
				var_41_6.mainPlusRotation = 90
				var_41_6.mainPlusTex_ST = Vector4(15, 1, 0, 0)
				var_41_7.color = Color(0.73, 0.9, 1)
			end
		end

		var_41_2.runtimeAnimatorController = Asset.Load("AnimatorController/niuqu")
		var_41_2.enabled = arg_41_2
	end
end

function var_0_0.ResetNiuquEffect(arg_42_0)
	for iter_42_0, iter_42_1 in ipairs(arg_42_0.niuquEffectActor) do
		if not isNil(arg_42_0.actors_[iter_42_0]) and iter_42_1 then
			arg_42_0:SetSpriteNiuquEffect(iter_42_0, false)
		end
	end
end

function var_0_0.PlayTimeline(arg_43_0, arg_43_1, arg_43_2, arg_43_3)
	if arg_43_0.actors_[arg_43_1] == nil then
		local var_43_0 = Object.Instantiate(Asset.Load("Char/" .. arg_43_1), arg_43_0.stage_.transform)

		var_43_0.name = arg_43_1
		var_43_0.transform.localPosition = Vector3.New(0, 100, 0)
		arg_43_0.actors_[arg_43_1] = var_43_0

		local var_43_1 = var_43_0.transform:Find("Directional Light")

		if var_43_1 then
			SetActive(var_43_1.gameObject, false)
		end

		local var_43_2 = var_43_0:GetComponentInChildren(typeof(CharacterEffect))

		var_43_2.enabled = true

		local var_43_3 = GameObjectTools.GetOrAddComponent(var_43_0, typeof(DynamicBoneHelper))

		if var_43_3 then
			var_43_3:EnableDynamicBone(false)
		end

		arg_43_0:ShowWeapon(var_43_2.transform, false)

		arg_43_0.var_[arg_43_1 .. "Animator"] = var_43_2.gameObject:GetComponent(typeof(UnityEngine.Animator))

		if var_43_1 then
			-- block empty
		end

		arg_43_0.var_[arg_43_1 .. "Animator"].applyRootMotion = true
		arg_43_0.var_[arg_43_1 .. "LipSync"] = var_43_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
	end

	local var_43_4 = arg_43_0.actors_[arg_43_1]
	local var_43_5 = Asset.InstantiateWithoutCache(arg_43_2)

	var_43_5.transform:SetParent(var_43_4.transform)

	local var_43_6 = var_43_5.transform:Find("Timeline").gameObject
	local var_43_7 = var_43_6:GetComponent("PlayableDirector")
	local var_43_8 = arg_43_0.var_[arg_43_1 .. "Animator"]
	local var_43_9 = arg_43_0.var_[arg_43_1 .. "LipSync"]
	local var_43_10 = "ActionTimelineAnimator"

	if arg_43_3 ~= nil then
		var_43_10 = "EmotionTimelineAnimator"
	end

	if var_43_7 then
		local var_43_11 = var_43_7.playableAsset
		local var_43_12 = var_43_11.outputTrackCount

		for iter_43_0 = 0, var_43_12 - 1 do
			local var_43_13 = var_43_11:GetOutputTrack(iter_43_0)
			local var_43_14 = var_43_13.name

			if (var_43_14 == "Animator" or var_43_14 == "Animator Track") and var_43_8 then
				var_43_7:SetGenericBinding(var_43_13, var_43_8)

				if arg_43_0.var_[arg_43_1 .. var_43_10] then
					Object.Destroy(arg_43_0.var_[arg_43_1 .. var_43_10])
				end

				arg_43_0.var_[arg_43_1 .. var_43_10] = var_43_6
			elseif var_43_14 == "LipSync" and var_43_9 then
				var_43_7:SetGenericBinding(var_43_13, var_43_9)
			elseif var_43_14 == "Story Timeline Enable Render Track" then
				var_43_7:SetGenericBinding(var_43_13, var_43_4)
			end
		end

		var_43_7.time = 0

		var_43_7:Play()

		var_43_7.stopped = var_43_7.stopped + function(arg_44_0)
			Object.Destroy(arg_44_0.transform.parent.gameObject, 0.1)
		end

		table.insert(arg_43_0.timelineDirector, var_43_7)
	end
end

function var_0_0.Dispose(arg_45_0)
	if not isNil(arg_45_0.sceneSettingEffect_) then
		arg_45_0.sceneSettingEffect_.enabled = true
	end

	for iter_45_0, iter_45_1 in pairs(arg_45_0.timelineDirector) do
		if not isNil(iter_45_1) then
			iter_45_1:Stop()
		end
	end

	arg_45_0.timelineDirector = {}

	if arg_45_0.gameObject_ then
		Object.Destroy(arg_45_0.gameObject_)

		arg_45_0.gameObject_ = nil
	end

	for iter_45_2, iter_45_3 in pairs(arg_45_0.bgs_) do
		if iter_45_3 then
			Object.Destroy(iter_45_3)
		end
	end

	for iter_45_4, iter_45_5 in pairs(arg_45_0.actors_) do
		if iter_45_5 then
			Object.Destroy(iter_45_5)
		end
	end

	if arg_45_0.stage_ then
		Object.Destroy(arg_45_0.stage_, 1)

		arg_45_0.stage_ = nil
	end

	for iter_45_6, iter_45_7 in pairs(arg_45_0.CriAtomExPlaybacks_) do
		if iter_45_7 then
			iter_45_7:Stop()
		end
	end

	if arg_45_0.voicePlaybackTimer_ then
		for iter_45_8, iter_45_9 in pairs(arg_45_0.voicePlaybackTimer_) do
			if iter_45_9 then
				iter_45_9:Stop()
			end
		end
	end

	manager.audio:ClearBGMFlag()
	manager.uiTime:OnExitStory(arg_45_0.storyId_)

	for iter_45_10, iter_45_11 in pairs(arg_45_0.var_) do
		if iter_45_11 and type(iter_45_11) == "userdata" and string.find(iter_45_10, "effect") then
			Object.Destroy(iter_45_11)
		end
	end

	if arg_45_0.skipView_ then
		arg_45_0.skipView_:Dispose()

		arg_45_0.skipView_ = nil
	end

	for iter_45_12, iter_45_13 in ipairs(arg_45_0.historyItems_) do
		iter_45_13:Dispose()
	end

	arg_45_0.curHistoryItem_ = nil
	arg_45_0.CriAtomExPlaybacks_ = {}
	arg_45_0.isPlay_ = false
	arg_45_0.auto_ = false
	arg_45_0.time_ = 0
	arg_45_0.duration_ = 0
	arg_45_0.state_ = ""
	arg_45_0.curStory_ = nil
	arg_45_0.isInRecall_ = false
	arg_45_0.onSingleLineFinish_ = nil
	arg_45_0.onSingleLineUpdate_ = nil
	arg_45_0.onStoryFinished_ = nil
	arg_45_0.playNext_ = nil
	arg_45_0.bgs_ = {}
	arg_45_0.actors_ = {}
	arg_45_0.var_ = {}
	arg_45_0.spriteActors_ = {}

	AnimatorTools.Stop()
	var_0_0.super.Dispose(arg_45_0)
	arg_45_0:AudioAction("play", "voice", "story_v_empty", "empty", "")
end

function var_0_0.HideSkipBtn(arg_46_0, arg_46_1)
	SetActive(arg_46_0.skipBtn_.gameObject, not arg_46_1)
end

function var_0_0.Play(arg_47_0, arg_47_1)
	manager.guide.weakView:Hide()
	manager.uiTime:OnEnterStory(arg_47_1)

	arg_47_0.storyId_ = arg_47_1
	arg_47_0.var_ = {}

	local var_47_0 = _G["Story" .. arg_47_1]

	local function var_47_1()
		arg_47_0.curStory_ = StoryCfg[arg_47_1]

		local var_48_0 = arg_47_0.curStory_.start

		arg_47_0.curStoryInstance_ = var_47_0

		var_47_0["Play" .. var_48_0](var_47_0, arg_47_0)

		arg_47_0.isPlay_ = true

		manager.story:ResetStoryChoice()
		print("开始播放 " .. arg_47_1 .. ", " .. var_48_0)
	end

	arg_47_0:CheckNeedDownloadAssets(var_47_0, var_47_1)
end

function var_0_0.CheckNeedDownloadAssets(arg_49_0, arg_49_1, arg_49_2)
	if AssetDownloadManager.CheckResourcesNeedDownload(arg_49_1.assets) or AssetDownloadManager.CheckVoiceNeedDownload(arg_49_1.voices) then
		SetForceShowQuanquan(true)
		AssetDownloadManager.Create()
		AssetDownloadManager.Instance:AddResourceToDownloadQueue(arg_49_1.assets)
		AssetDownloadManager.Instance:AddVoiceToDownloadQueue(arg_49_1.voices)
		AssetDownloadManager.Instance:Run(nil, function()
			AssetDownloadManager.Destroy()
			arg_49_2()
			SetForceShowQuanquan(false)
		end, function()
			AssetDownloadManager.Destroy()
			SetForceShowQuanquan(false)
			arg_49_0.onStoryFinished_(true)
		end)
	else
		arg_49_2()
	end
end

function var_0_0.RecordAudio(arg_52_0, arg_52_1, arg_52_2)
	arg_52_0.CriAtomExPlaybacks_[arg_52_1] = arg_52_2
end

function var_0_0.GetPercentByPara(arg_53_0, arg_53_1, arg_53_2)
	local var_53_0 = 0
	local var_53_1 = string.split(arg_53_1, "\n\n")

	if table.length(var_53_1) <= 1 then
		var_53_1 = string.split(arg_53_1, "\n")
	end

	arg_53_1 = string.gsub(string.gsub(string.gsub(arg_53_1, "\n\n", ""), "\n", ""), " ", "")

	for iter_53_0 = 1, arg_53_2 do
		local var_53_2 = var_53_1[iter_53_0]
		local var_53_3 = string.gsub(string.gsub(string.gsub(var_53_2, "\n\n", ""), "\n", ""), " ", "")

		var_53_0 = var_53_0 + utf8.len(var_53_3)
	end

	return var_53_0 / utf8.len(arg_53_1), var_53_0
end

function var_0_0.CheckCanSkipToEnd(arg_54_0)
	if arg_54_0.curStoryInstance_.skipMarkers then
		for iter_54_0 = 1, #arg_54_0.curStoryInstance_.skipMarkers do
			if arg_54_0.curStoryInstance_.skipMarkers[iter_54_0] > arg_54_0.curTalkId_ then
				return false, arg_54_0.curStoryInstance_.skipMarkers[iter_54_0]
			end
		end
	end

	return true, nil
end

function var_0_0.GetWordFromCfg(arg_55_0, arg_55_1)
	if StoryWordCfg[arg_55_1] ~= nil then
		return StoryWordCfg[arg_55_1]
	else
		local var_55_0 = 1
		local var_55_1

		repeat
			var_55_0 = var_55_0 + 1

			local var_55_2 = string.format("StoryWordCfg%d", var_55_0)

			if _G[var_55_2] and _G[var_55_2][arg_55_1] then
				return _G[var_55_2][arg_55_1]
			end
		until _G[var_55_2] == nil
	end

	error("无法在StoryWordCfg表中找到 " .. arg_55_1)

	return nil
end

return var_0_0
