local var_0_0 = class("VideoPlayMgr", import("game.extend.ReduxView"))

function var_0_0.Ctor(arg_1_0)
	return
end

function var_0_0.InitUI(arg_2_0)
	arg_2_0.gameObject_ = Object.Instantiate(Asset.Load("UI/Stage/VideoPlayUI"), manager.ui.uiStory.transform)
	arg_2_0.transform_ = arg_2_0.gameObject_.transform

	arg_2_0:BindCfgUI()

	arg_2_0.criManaMovieController_ = arg_2_0.goMovie_:GetComponent("CriManaMovieControllerForUI")
	arg_2_0.criplayer_ = arg_2_0.criManaMovieController_.player
	arg_2_0.criplayer_.statusChangeCallback = handler(arg_2_0, arg_2_0.StatusChangeCallback)
end

function var_0_0.AddListeners(arg_3_0)
	arg_3_0:AddBtnListener(arg_3_0.buttonClose_, nil, function()
		return
	end)
	arg_3_0:AddBtnListener(arg_3_0.buttonSkip_, nil, function()
		if Time.realtimeSinceStartup == arg_3_0.lastTime then
			return
		end

		arg_3_0.lastTime = Time.realtimeSinceStartup

		arg_3_0.criManaMovieController_:Pause(true)

		if arg_3_0.onPauseCallback then
			arg_3_0.onPauseCallback(true)
		end

		arg_3_0:RemoveCaptionTimer()
		ShowMessageBox({
			isTop = true,
			title = GetTips("PROMPT"),
			content = GetTips("TIP_SKIP_PLOT"),
			OkCallback = function()
				if not isNil(arg_3_0.criManaMovieController_) then
					arg_3_0.criManaMovieController_:Pause(false)
					arg_3_0.criManaMovieController_:Stop()
				end

				if arg_3_0.onFinishCallback_ then
					arg_3_0.onFinishCallback_(StoryOperDefine.PASS)
				end
			end,
			CancelCallback = function()
				if not isNil(arg_3_0.criManaMovieController_) then
					arg_3_0.criManaMovieController_:Pause(false)
				end

				if arg_3_0.onPauseCallback then
					arg_3_0.onPauseCallback(false)
				end

				arg_3_0:StartCaptionTimer()
			end,
			MaskCallback = function()
				if not isNil(arg_3_0.criManaMovieController_) then
					arg_3_0.criManaMovieController_:Pause(false)
				end

				if arg_3_0.onPauseCallback then
					arg_3_0.onPauseCallback(false)
				end

				arg_3_0:StartCaptionTimer()
			end
		})
	end)
end

function var_0_0.Play(arg_9_0, arg_9_1, arg_9_2, arg_9_3, arg_9_4, arg_9_5, arg_9_6)
	if arg_9_0.gameObject_ == nil then
		arg_9_0:InitUI()
		arg_9_0:AddListeners()
	end

	arg_9_0.startStop_ = false

	if arg_9_3 == nil then
		arg_9_0.autoHide_ = true
	else
		arg_9_0.autoHide_ = arg_9_3
	end

	SetActive(arg_9_0.goSkip_, true)

	local var_9_0 = manager.audio:GetMusicVolume()

	arg_9_0.criplayer_:SetVolume(var_9_0)

	local var_9_1 = manager.audio:GetLocalizationFlag()
	local var_9_2 = 0
	local var_9_3

	for iter_9_0 in string.gmatch(arg_9_1, "[^/]+$") do
		var_9_3 = iter_9_0
	end

	local var_9_4 = VideoTrackCfg[var_9_3]

	if var_9_4 and var_9_4.has_tracks == 1 then
		if var_9_1 == "zh" then
			var_9_2 = 0
		elseif var_9_1 == "ja" then
			var_9_2 = 1
		elseif var_9_1 == "en" then
			var_9_2 = 2
		elseif var_9_1 == "ko" then
			var_9_2 = 3
		end
	end

	arg_9_0.criplayer_:SetAudioTrack(var_9_2)
	arg_9_0.criplayer_:SetSubtitleChannel(var_9_2)

	if arg_9_4 == nil then
		arg_9_0.criplayer_:Loop(false)
	else
		arg_9_0.criplayer_:Loop(arg_9_4)
	end

	SetFile(arg_9_0.criplayer_, nil, arg_9_1)

	arg_9_0.onFinishCallback_ = arg_9_2
	arg_9_0.onPauseCallback = arg_9_5
	arg_9_0.videoId = arg_9_6

	SetActive(arg_9_0.gameObject_, true)

	if not isNil(arg_9_0.criManaMovieController_) then
		arg_9_0.criManaMovieController_:Play()
	end

	arg_9_0:CaptionPlay()
	manager.windowBar:HideBar()
	arg_9_0:AdaptScreen()
end

function var_0_0.CaptionPlay(arg_10_0)
	arg_10_0.time = 0
	arg_10_0.lastTime = 0
	arg_10_0.currentPlayId = 1

	arg_10_0:StartCaptionTimer()
end

function var_0_0.StartCaptionTimer(arg_11_0)
	if arg_11_0.videoId == nil or arg_11_0.videoId == 0 then
		arg_11_0.text_.text = ""

		return
	end

	local var_11_0 = SettingData:GetCurrentLanguage()
	local var_11_1 = import("game.subtitle.subtitle" .. arg_11_0.videoId)

	if var_11_1 == nil then
		arg_11_0:RemoveCaptionTimer()

		return
	else
		var_11_1 = var_11_1[var_11_0]
	end

	table.sort(var_11_1, function(arg_12_0, arg_12_1)
		return arg_12_0.start < arg_12_1.start
	end)

	if not arg_11_0.captionTimer then
		arg_11_0.captionTimer = FuncTimerManager.inst:CreateFuncFrameTimer(function()
			arg_11_0.text_.text = ""
			arg_11_0.time = arg_11_0.time + Time.deltaTime

			if arg_11_0.lastTime + 3 < arg_11_0.time then
				local var_13_0 = tonumber(tostring(arg_11_0.criplayer_:GetTime()) / 1000000)

				arg_11_0.time = var_13_0
				arg_11_0.lastTime = arg_11_0.time
			end

			local var_13_1 = var_11_1[arg_11_0.currentPlayId]

			if var_13_1 == nil then
				arg_11_0:RemoveCaptionTimer()

				return
			end

			if arg_11_0.time < var_13_1.endTime and arg_11_0.time > var_13_1.start then
				arg_11_0.text_.text = GetI18NText(var_13_1.content)
			elseif arg_11_0.time > var_13_1.endTime then
				arg_11_0.currentPlayId = arg_11_0.currentPlayId + 1
			end
		end, -1, true)
	end
end

function var_0_0.PauseCaptionTimer(arg_14_0)
	if arg_14_0.captionTimer then
		FuncTimerManager.inst:RemoveFuncTimer(arg_14_0.captionTimer)

		arg_14_0.captionTimer = nil
	end
end

function var_0_0.RemoveCaptionTimer(arg_15_0)
	if arg_15_0.captionTimer then
		FuncTimerManager.inst:RemoveFuncTimer(arg_15_0.captionTimer)

		arg_15_0.captionTimer = nil
	end
end

function var_0_0.Dispose(arg_16_0)
	var_0_0.super.Dispose(arg_16_0)

	if arg_16_0.gameObject_ then
		arg_16_0.criplayer_.statusChangeCallback = nil

		arg_16_0:RemoveCaptionTimer()
		Object.Destroy(arg_16_0.gameObject_)

		arg_16_0.gameObject_ = nil
		arg_16_0.transform_ = nil
		arg_16_0.onFinishCallback_ = nil
		arg_16_0.onPauseCallback = nil
	end
end

function var_0_0.StatusChangeCallback(arg_17_0, arg_17_1)
	local var_17_0 = tostring(arg_17_1)

	if var_17_0 == "PlayEnd" then
		if not isNil(arg_17_0.criManaMovieController_) then
			arg_17_0.criManaMovieController_:Stop()
		end

		arg_17_0:RemoveCaptionTimer()

		if arg_17_0.onFinishCallback_ then
			arg_17_0.onFinishCallback_(StoryOperDefine.NORMAL)
		end
	elseif var_17_0 == "StopProcessing" then
		arg_17_0.startStop_ = true

		return
	elseif var_17_0 == "Stop" and arg_17_0.startStop_ and arg_17_0.autoHide_ then
		SetActive(arg_17_0.gameObject_, false)
	end

	arg_17_0.startStop_ = false
end

function var_0_0.HidePlayer(arg_18_0)
	if arg_18_0.startStop_ then
		arg_18_0.autoHide_ = true

		return
	end

	if arg_18_0.gameObject_ then
		SetActive(arg_18_0.gameObject_, false)
	end

	arg_18_0.autoHide_ = true
end

function var_0_0.AdaptRight(arg_19_0)
	if arg_19_0.rightTrs_ == nil then
		arg_19_0.rightGo_ = arg_19_0.goSkip_
		arg_19_0.rightTrs_ = arg_19_0.rightGo_:GetComponent(typeof(RectTransform))
		arg_19_0.needAdaptRight_ = false
	end

	var_0_0.super.AdaptRight(arg_19_0)
end

return var_0_0
