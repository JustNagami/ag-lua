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

	arg_1_0:InitUI()
	arg_1_0:InitUIEvents()
end

function var_0_0.InitUI(arg_2_0)
	arg_2_0.gameObject_ = Object.Instantiate(Asset.Load("Widget/System/Story/StoryUI"), manager.ui.uiStory.transform)
	arg_2_0.transform_ = arg_2_0.gameObject_.transform

	ComponentBinder.GetInstance():BindCfgUI(arg_2_0, arg_2_0.gameObject_)
	arg_2_0:AdaptScreen()

	arg_2_0.iconController_ = ControllerUtil.GetController(arg_2_0.iconTrs_, "conName")
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
	SetActive(arg_2_0.locationGo_, false)
	SetActive(arg_2_0.dialog_, false)

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
	arg_2_0.historyItems_ = {}
	arg_2_0.lastHistoryVoiceIdx_ = nil
	arg_2_0.curHistoryItem_ = nil
	arg_2_0.musicType = {}

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

		local var_9_0 = PlayerData:GetStoryList()
		local var_9_1
		local var_9_2 = var_9_0[arg_3_0.curStory_.id] and 0 or 1

		SDKTools.SendMessageToSDK("story_oper", {
			oper = StoryOperDefine.REPLAY,
			is_first = var_9_2,
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
		local var_12_0, var_12_1 = arg_3_0:CheckCanSkipToEnd()

		if var_12_0 then
			arg_3_0:Skip()
		else
			arg_3_0:JumpToMarker(var_12_1)
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

function var_0_0.OnClickBtnAll(arg_16_0)
	if arg_16_0.state_ == "hiding" then
		arg_16_0.state_ = "waiting"
		arg_16_0.isPlay_ = true

		SetActive(arg_16_0.dialog_, true)
		arg_16_0.hideBtnsController_:SetSelectedState("show")

		arg_16_0.allBtn_.enabled = arg_16_0.allBtnState

		SetActive(arg_16_0.fswbg_, arg_16_0.fullScreenWordFlag_ and true)

		if arg_16_0.fullScreenWordFlag_ == true then
			SetActive(arg_16_0.dialog_, false)
		end
	elseif arg_16_0.state_ == "waiting" and not arg_16_0.choicesGo_.activeSelf then
		arg_16_0.playNext_(1)
	elseif arg_16_0.dialogNext_.activeSelf and arg_16_0.typewriterNext_.activeSelf and not arg_16_0.choicesGo_.activeSelf then
		arg_16_0:JumpToEnd()

		if not arg_16_0.choicesGo_.activeSelf then
			arg_16_0.playNext_(1)
		end
	elseif arg_16_0.state_ == "playing" then
		arg_16_0:JumpToEnd()
	end
end

function var_0_0.JumpToEnd(arg_17_0)
	local var_17_0 = (arg_17_0.duration_ - arg_17_0.time_) / 0.033 + 1

	for iter_17_0 = 1, var_17_0 do
		arg_17_0:Update(0.033)
	end

	if arg_17_0.dialogScrollRect_ then
		arg_17_0.dialogScrollRect_.normalizedPosition = Vector2(0, 0)
	end
end

function var_0_0.JumpToMarker(arg_18_0, arg_18_1)
	while arg_18_1 > arg_18_0.curTalkId_ do
		arg_18_0:JumpToEnd()
		arg_18_0.playNext_(1)
	end

	if arg_18_1 == arg_18_0.curTalkId_ then
		local var_18_0 = (arg_18_0.duration_ - arg_18_0.time_) / 0.033 + 1

		for iter_18_0 = 1, var_18_0 do
			arg_18_0:Update(0.033)

			if arg_18_0.marker ~= "" then
				return
			end
		end
	end

	arg_18_0:Skip()
end

function var_0_0.StopAllVoice(arg_19_0)
	for iter_19_0, iter_19_1 in pairs(arg_19_0.CriAtomExPlaybacks_) do
		if iter_19_1 then
			iter_19_1:Stop()
		end
	end

	arg_19_0.CriAtomExPlaybacks_ = {}
end

function var_0_0.PlayOnlyBgm(arg_20_0)
	for iter_20_0, iter_20_1 in pairs(arg_20_0.CriAtomExPlaybacks_) do
		if iter_20_1 and arg_20_0.musicType.music and not arg_20_0.musicType.music[iter_20_0] == 1 then
			iter_20_1:Stop()
			table.remove(arg_20_0.CriAtomExPlaybacks_, iter_20_0)
		end
	end
end

function var_0_0.Skip(arg_21_0, arg_21_1)
	local var_21_0 = false

	if not arg_21_1 then
		arg_21_1 = StoryOperDefine.PASS
	else
		var_21_0 = true
	end

	local var_21_1 = arg_21_0.curStory_.name
	local var_21_2 = arg_21_0.curStory_.desc

	arg_21_0.isPlay_ = false
	arg_21_0.auto_ = false

	arg_21_0.autoplayController_:SetSelectedState("manual")

	if var_21_2 and var_21_2 ~= "" then
		for iter_21_0, iter_21_1 in pairs(arg_21_0.CriAtomExPlaybacks_) do
			if iter_21_1 then
				iter_21_1:Pause()
			end
		end

		manager.audio:ClearBGMFlag()

		local var_21_3

		if arg_21_0.skipView_ == nil then
			if manager.story:IsStoryPlayed(arg_21_0.curStory_.id) or var_21_0 then
				var_21_3 = "Widget/System/Story/StorySkipUI"

				local var_21_4 = Asset.Load(var_21_3)
				local var_21_5 = Object.Instantiate(var_21_4, manager.ui.uiStory.transform)

				arg_21_0.skipView_ = StoryForceSkipView.New(var_21_5)
			else
				var_21_3 = "Widget/System/Story/StorySkip2UI"

				local var_21_6 = Asset.Load(var_21_3)
				local var_21_7 = Object.Instantiate(var_21_6, manager.ui.uiStory.transform)

				arg_21_0.skipView_ = StorySkip2View.New(var_21_7)
			end
		else
			SetActive(arg_21_0.skipView_.gameObject_, true)
		end

		arg_21_0.skipView_:SetContentTitle(var_21_1, var_21_2)
		arg_21_0.skipView_:SetCallback(handler(arg_21_0, function(arg_22_0, arg_22_1)
			if arg_22_1 then
				arg_21_0.isPlay_ = true

				for iter_22_0, iter_22_1 in pairs(arg_21_0.CriAtomExPlaybacks_) do
					if iter_22_1 then
						iter_22_1:Resume(CriAtomEx.ResumeMode.PausedPlayback)
					end
				end

				if arg_21_0.skipView_ then
					arg_21_0.skipView_:Dispose()

					arg_21_0.skipView_ = nil
				end

				if var_21_3 then
					Asset.Unload(var_21_3)
				end

				return
			end

			local var_22_0 = PlayerData:GetStoryList()
			local var_22_1
			local var_22_2 = var_22_0[arg_21_0.curStory_.id] and 0 or 1

			SDKTools.SendMessageToSDK("story_oper", {
				oper = arg_21_1,
				is_first = var_22_2,
				story_id = string.format(arg_21_0.curStory_.id)
			})

			if BirthdayCfg.get_id_list_by_story_id[arg_21_0.curStory_.id] and var_22_2 == 1 then
				SDKTools.SendMessageToSDK("birthday_viewed", {
					story_skip = 1
				})
			end

			arg_21_0.onStoryFinished_(true)
		end))
	else
		local var_21_8 = PlayerData:GetStoryList()
		local var_21_9
		local var_21_10 = var_21_8[arg_21_0.curStory_.id] and 0 or 1

		SDKTools.SendMessageToSDK("story_oper", {
			oper = arg_21_1,
			is_first = var_21_10,
			story_id = string.format(arg_21_0.curStory_.id)
		})

		if BirthdayCfg.get_id_list_by_story_id[arg_21_0.curStory_.id] and var_21_10 == 1 then
			SDKTools.SendMessageToSDK("birthday_viewed", {
				story_skip = 1
			})
		end

		arg_21_0.onStoryFinished_(true)
	end
end

function var_0_0.SetGaussion(arg_23_0, arg_23_1)
	arg_23_0:SetGaussionBg(arg_23_1)
	manager.ui:SetUISeparateRender(arg_23_1)
	SetActive(arg_23_0.gaussionBgGo_, arg_23_1)
end

function var_0_0.ShowNextGo(arg_24_0, arg_24_1)
	SetActive(arg_24_0.dialogNext_, arg_24_1)
	SetActive(arg_24_0.dialogNextBtnGo_, not arg_24_1)
	SetActive(arg_24_0.typewriterNext_, arg_24_1)
end

function var_0_0.Update(arg_25_0, arg_25_1)
	if not arg_25_0.isPlay_ then
		if arg_25_0.state_ == "hiding" then
			if Input.anyKey then
				arg_25_0.__isAnyKey = true
			elseif arg_25_0.__isAnyKey then
				arg_25_0.__isAnyKey = false

				if not Input.GetMouseButtonUp(0) then
					arg_25_0:OnClickBtnAll()
				end
			end

			arg_25_0.allBtn_.enabled = true
		end

		return
	end

	if arg_25_0.state_ ~= "pause" then
		arg_25_0.time_ = arg_25_0.time_ + arg_25_1
		arg_25_0.frameCnt_ = arg_25_0.frameCnt_ + 1
	end

	if arg_25_0.onSingleLineUpdate_ then
		arg_25_0.onSingleLineUpdate_(arg_25_1)
	end

	if arg_25_0.time_ > arg_25_0.duration_ and arg_25_0.onSingleLineFinish_ then
		arg_25_0.onSingleLineFinish_()

		if arg_25_0.duration_ < 2 then
			arg_25_0.auto_time = 2 - arg_25_0.duration_
		end

		if arg_25_0.auto_time <= 0 then
			arg_25_0.auto_time = 1
		end
	end

	if arg_25_0.state_ == "waiting" and arg_25_0.playNext_ and arg_25_0.auto_ then
		if arg_25_0.auto_time <= 0 and not arg_25_0.choicesGo_.activeSelf then
			arg_25_0.playNext_(1)

			arg_25_0.auto_time = 0
		else
			arg_25_0.auto_time = arg_25_0.auto_time - arg_25_1
		end
	end
end

function var_0_0.FormatText(arg_26_0, arg_26_1)
	arg_26_1 = GetI18NText(arg_26_1)

	local var_26_0 = string.gsub(arg_26_1, "#{(%w+)}#", function(arg_27_0)
		local var_27_0 = arg_26_0.keyword[arg_27_0]

		if var_27_0 then
			return var_27_0
		else
			return arg_27_0
		end
	end)

	return (arg_26_0:ReplaceSpace(var_26_0))
end

function var_0_0.ReplaceSpace(arg_28_0, arg_28_1)
	return arg_28_1
end

function var_0_0.RecordName(arg_29_0, arg_29_1)
	local var_29_0 = "\n<size=32><color=#2ea9f6>【" .. arg_29_1 .. "】</color></size>\n"

	if SettingData:GetCurrentLanguage() == "kr" then
		local var_29_1 = "\n<size=32><color=#2ea9f6>[" .. arg_29_1 .. "]</color></size>\n"
	end

	local var_29_2 = Object.Instantiate(arg_29_0.historyItemGo_, arg_29_0.historyContentTrans_)
	local var_29_3 = StoryHistoryItem.New(var_29_2)

	table.insert(arg_29_0.historyItems_, var_29_3)

	arg_29_0.curHistoryItem_ = var_29_3

	var_29_3:SetTitle(arg_29_1)
end

function var_0_0.RecordContent(arg_30_0, arg_30_1)
	local var_30_0 = arg_30_1 .. "\n"

	arg_30_0.curHistoryItem_:SetContent(var_30_0)
end

function var_0_0.RecordHistoryTalkVoice(arg_31_0, arg_31_1, arg_31_2, arg_31_3)
	arg_31_0.curHistoryItem_:SetVoiceCallback(function(arg_32_0)
		if arg_31_0.voicePlaybackTimer_ == nil then
			arg_31_0.voicePlaybackTimer_ = {}
		end

		if arg_31_0.voicePlaybackTimer_[arg_31_2] then
			return
		end

		arg_31_0:AudioAction("play", "voice", arg_31_1, arg_31_2, arg_31_3)

		local var_32_0 = arg_31_0.CriAtomExPlaybacks_[arg_31_2]

		if var_32_0 then
			local var_32_1

			var_32_1 = FrameTimer.New(function()
				if tonumber(tostring(var_32_0.time)) < 0 then
					arg_32_0:StopVoiceAni()
					var_32_1:Stop()

					arg_31_0.voicePlaybackTimer_[arg_31_2] = nil
				else
					arg_32_0:PlayVoiceAni()
				end
			end, 1, -1)

			var_32_1:Start()

			arg_31_0.voicePlaybackTimer_[arg_31_2] = var_32_1
		end
	end)
end

function var_0_0.GetFullAwbName(arg_34_0, arg_34_1)
	if arg_34_1 ~= "" then
		arg_34_1 = string.format("%s.awb", tostring(arg_34_1))
	end

	return arg_34_1
end

function var_0_0.AudioAction(arg_35_0, arg_35_1, arg_35_2, arg_35_3, arg_35_4, arg_35_5)
	if arg_35_1 == "play" then
		if arg_35_2 == "voice" then
			arg_35_0.CriAtomExPlaybacks_[arg_35_4] = manager.audio:PlayVoice(arg_35_3, arg_35_4, arg_35_0:GetFullAwbName(arg_35_5))
		elseif arg_35_2 == "music" then
			arg_35_0.CriAtomExPlaybacks_[arg_35_4] = manager.audio:PlayBGM(arg_35_3, arg_35_4, arg_35_0:GetFullAwbName(arg_35_5))
		elseif arg_35_2 == "effect" then
			arg_35_0.CriAtomExPlaybacks_[arg_35_4] = manager.audio:PlayEffect(arg_35_3, arg_35_4, arg_35_0:GetFullAwbName(arg_35_5))
		end

		if not arg_35_0.musicType[arg_35_2] then
			arg_35_0.musicType[arg_35_2] = {}
		end

		arg_35_0.musicType[arg_35_2][arg_35_4] = 1
	end

	local var_35_0 = arg_35_0.CriAtomExPlaybacks_[arg_35_4]

	if var_35_0 then
		if arg_35_1 == "pause" then
			var_35_0:Pause()
		elseif arg_35_1 == "resume" then
			var_35_0:Resume(CriAtomEx.ResumeMode.AllPlayback)
		elseif arg_35_1 == "stop" then
			var_35_0:Stop()
		elseif arg_35_1 == "forcestop" then
			var_35_0:Stop(true)
		end
	end
end

function var_0_0.ShowWeapon(arg_36_0, arg_36_1, arg_36_2)
	LuaForUtil.ShowWeapon(arg_36_1, arg_36_2)
end

function var_0_0.CheckSpriteTmpPos(arg_37_0, arg_37_1, arg_37_2)
	arg_37_0.spriteActors_[arg_37_1] = arg_37_2

	for iter_37_0, iter_37_1 in pairs(arg_37_0.spriteActors_) do
		if iter_37_0 ~= arg_37_1 and iter_37_1 == arg_37_2 and not isNil(arg_37_0.actors_[iter_37_0]) then
			arg_37_0.actors_[iter_37_0]:SetActive(false)
		end
	end

	if not isNil(arg_37_0.actors_[arg_37_1]) then
		arg_37_0.actors_[arg_37_1]:SetActive(true)
	end
end

function var_0_0.PlayTimeline(arg_38_0, arg_38_1, arg_38_2)
	if arg_38_0.actors_[arg_38_1] == nil then
		local var_38_0 = Object.Instantiate(Asset.Load("Char/" .. arg_38_1), arg_38_0.stage_.transform)

		var_38_0.name = arg_38_1
		var_38_0.transform.localPosition = Vector3.New(0, 100, 0)
		arg_38_0.actors_[arg_38_1] = var_38_0

		local var_38_1 = var_38_0.transform:Find("Directional Light")

		if var_38_1 then
			SetActive(var_38_1.gameObject, false)
		end

		local var_38_2 = var_38_0:GetComponentInChildren(typeof(CharacterEffect))

		var_38_2.enabled = true

		local var_38_3 = GameObjectTools.GetOrAddComponent(var_38_0, typeof(DynamicBoneHelper))

		if var_38_3 then
			var_38_3:EnableDynamicBone(false)
		end

		arg_38_0:ShowWeapon(var_38_2.transform, false)

		arg_38_0.var_[arg_38_1 .. "Animator"] = var_38_2.gameObject:GetComponent(typeof(UnityEngine.Animator))

		if var_38_1 then
			-- block empty
		end

		arg_38_0.var_[arg_38_1 .. "Animator"].applyRootMotion = true
		arg_38_0.var_[arg_38_1 .. "LipSync"] = var_38_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
	end

	local var_38_4 = arg_38_0.actors_[arg_38_1]
	local var_38_5 = Asset.InstantiateWithoutCache(arg_38_2)

	var_38_5.transform:SetParent(var_38_4.transform)

	local var_38_6 = var_38_5.transform:Find("Timeline").gameObject
	local var_38_7 = var_38_6:GetComponent("PlayableDirector")
	local var_38_8 = arg_38_0.var_[arg_38_1 .. "Animator"]
	local var_38_9 = arg_38_0.var_[arg_38_1 .. "LipSync"]

	if var_38_7 then
		local var_38_10 = var_38_7.playableAsset
		local var_38_11 = var_38_10.outputTrackCount

		for iter_38_0 = 0, var_38_11 - 1 do
			local var_38_12 = var_38_10:GetOutputTrack(iter_38_0)
			local var_38_13 = var_38_12.name

			if (var_38_13 == "Animator" or var_38_13 == "Animator Track") and var_38_8 then
				var_38_7:SetGenericBinding(var_38_12, var_38_8)

				if arg_38_0.var_[arg_38_1 .. "timelineAnimator"] then
					Object.Destroy(arg_38_0.var_[arg_38_1 .. "timelineAnimator"])
				end

				arg_38_0.var_[arg_38_1 .. "timelineAnimator"] = var_38_6
			elseif var_38_13 == "LipSync" and var_38_9 then
				var_38_7:SetGenericBinding(var_38_12, var_38_9)
			elseif var_38_13 == "Story Timeline Enable Render Track" then
				var_38_7:SetGenericBinding(var_38_12, var_38_4)
			end
		end

		var_38_7.time = 0

		var_38_7:Play()

		var_38_7.stopped = var_38_7.stopped + function(arg_39_0)
			Object.Destroy(arg_39_0.transform.parent.gameObject, 0.1)
		end

		table.insert(arg_38_0.timelineDirector, var_38_7)
	end
end

function var_0_0.Dispose(arg_40_0)
	if not isNil(arg_40_0.sceneSettingEffect_) then
		arg_40_0.sceneSettingEffect_.enabled = true
	end

	for iter_40_0, iter_40_1 in pairs(arg_40_0.timelineDirector) do
		if not isNil(iter_40_1) then
			iter_40_1:Stop()
		end
	end

	arg_40_0.timelineDirector = {}

	if arg_40_0.gameObject_ then
		Object.Destroy(arg_40_0.gameObject_)

		arg_40_0.gameObject_ = nil
	end

	for iter_40_2, iter_40_3 in pairs(arg_40_0.bgs_) do
		if iter_40_3 then
			Object.Destroy(iter_40_3)
		end
	end

	for iter_40_4, iter_40_5 in pairs(arg_40_0.actors_) do
		if iter_40_5 then
			Object.Destroy(iter_40_5)
		end
	end

	if arg_40_0.stage_ then
		Object.Destroy(arg_40_0.stage_, 1)

		arg_40_0.stage_ = nil
	end

	for iter_40_6, iter_40_7 in pairs(arg_40_0.CriAtomExPlaybacks_) do
		if iter_40_7 then
			iter_40_7:Stop()
		end
	end

	if arg_40_0.voicePlaybackTimer_ then
		for iter_40_8, iter_40_9 in pairs(arg_40_0.voicePlaybackTimer_) do
			if iter_40_9 then
				iter_40_9:Stop()
			end
		end
	end

	manager.audio:ClearBGMFlag()

	for iter_40_10, iter_40_11 in pairs(arg_40_0.var_) do
		if iter_40_11 and type(iter_40_11) == "userdata" and string.find(iter_40_10, "effect") then
			Object.Destroy(iter_40_11)
		end
	end

	if arg_40_0.skipView_ then
		arg_40_0.skipView_:Dispose()

		arg_40_0.skipView_ = nil
	end

	for iter_40_12, iter_40_13 in ipairs(arg_40_0.historyItems_) do
		iter_40_13:Dispose()
	end

	arg_40_0.curHistoryItem_ = nil
	arg_40_0.CriAtomExPlaybacks_ = {}
	arg_40_0.isPlay_ = false
	arg_40_0.auto_ = false
	arg_40_0.time_ = 0
	arg_40_0.duration_ = 0
	arg_40_0.state_ = ""
	arg_40_0.curStory_ = nil
	arg_40_0.onSingleLineFinish_ = nil
	arg_40_0.onSingleLineUpdate_ = nil
	arg_40_0.onStoryFinished_ = nil
	arg_40_0.playNext_ = nil
	arg_40_0.bgs_ = {}
	arg_40_0.actors_ = {}
	arg_40_0.var_ = {}
	arg_40_0.spriteActors_ = {}

	var_0_0.super.Dispose(arg_40_0)
	arg_40_0:AudioAction("play", "voice", "story_v_empty", "empty", "")
end

function var_0_0.HideSkipBtn(arg_41_0, arg_41_1)
	SetActive(arg_41_0.skipBtn_.gameObject, not arg_41_1)
end

function var_0_0.Play(arg_42_0, arg_42_1)
	manager.guide.weakView:Hide()

	arg_42_0.var_ = {}

	local var_42_0 = _G["Story" .. arg_42_1]

	local function var_42_1()
		arg_42_0.curStory_ = StoryCfg[arg_42_1]

		local var_43_0 = arg_42_0.curStory_.start

		arg_42_0.curStoryInstance_ = var_42_0

		var_42_0["Play" .. var_43_0](var_42_0, arg_42_0)

		arg_42_0.isPlay_ = true

		manager.story:ResetStoryChoice()
		print("开始播放 " .. arg_42_1 .. ", " .. var_43_0)
	end

	arg_42_0:CheckNeedDownloadAssets(var_42_0, var_42_1)
end

function var_0_0.CheckNeedDownloadAssets(arg_44_0, arg_44_1, arg_44_2)
	if AssetDownloadManager.CheckResourcesNeedDownload(arg_44_1.assets) or AssetDownloadManager.CheckVoiceNeedDownload(arg_44_1.voices) then
		SetForceShowQuanquan(true)
		AssetDownloadManager.Create()
		AssetDownloadManager.Instance:AddResourceToDownloadQueue(arg_44_1.assets)
		AssetDownloadManager.Instance:AddVoiceToDownloadQueue(arg_44_1.voices)
		AssetDownloadManager.Instance:Run(nil, function()
			AssetDownloadManager.Destroy()
			arg_44_2()
			SetForceShowQuanquan(false)
		end, function()
			AssetDownloadManager.Destroy()
			SetForceShowQuanquan(false)
			arg_44_0.onStoryFinished_(true)
		end)
	else
		arg_44_2()
	end
end

function var_0_0.RecordAudio(arg_47_0, arg_47_1, arg_47_2)
	arg_47_0.CriAtomExPlaybacks_[arg_47_1] = arg_47_2
end

function var_0_0.GetPercentByPara(arg_48_0, arg_48_1, arg_48_2)
	local var_48_0 = 0
	local var_48_1 = string.split(arg_48_1, "\n\n")

	if table.length(var_48_1) <= 1 then
		var_48_1 = string.split(arg_48_1, "\n")
	end

	arg_48_1 = string.gsub(string.gsub(string.gsub(arg_48_1, "\n\n", ""), "\n", ""), " ", "")

	for iter_48_0 = 1, arg_48_2 do
		local var_48_2 = var_48_1[iter_48_0]
		local var_48_3 = string.gsub(string.gsub(string.gsub(var_48_2, "\n\n", ""), "\n", ""), " ", "")

		var_48_0 = var_48_0 + utf8.len(var_48_3)
	end

	return var_48_0 / utf8.len(arg_48_1), var_48_0
end

function var_0_0.CheckCanSkipToEnd(arg_49_0)
	if arg_49_0.curStoryInstance_.skipMarkers then
		for iter_49_0 = 1, #arg_49_0.curStoryInstance_.skipMarkers do
			if arg_49_0.curStoryInstance_.skipMarkers[iter_49_0] > arg_49_0.curTalkId_ then
				return false, arg_49_0.curStoryInstance_.skipMarkers[iter_49_0]
			end
		end
	end

	return true, nil
end

function var_0_0.GetWordFromCfg(arg_50_0, arg_50_1)
	if StoryWordCfg[arg_50_1] ~= nil then
		return StoryWordCfg[arg_50_1]
	elseif StoryWordCfg2[arg_50_1] ~= nil then
		return StoryWordCfg2[arg_50_1]
	elseif StoryWordCfg3[arg_50_1] ~= nil then
		return StoryWordCfg3[arg_50_1]
	elseif StoryWordCfg4[arg_50_1] ~= nil then
		return StoryWordCfg4[arg_50_1]
	elseif StoryWordCfg5 and StoryWordCfg5[arg_50_1] ~= nil then
		return StoryWordCfg5[arg_50_1]
	end

	error("无法在StoryWordCfg表中找到 " .. arg_50_1)

	return nil
end

return var_0_0
