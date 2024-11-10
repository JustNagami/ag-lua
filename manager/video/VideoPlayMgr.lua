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
	arg_9_1 = manager.video:GetI18NVideoPath(arg_9_1)

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

	local var_9_1 = manager.video:GetVedioTrackIndex(arg_9_1)

	arg_9_0.criplayer_:SetAudioTrack(var_9_1)
	arg_9_0.criplayer_:SetSubtitleChannel(var_9_1)

	if arg_9_4 == nil then
		arg_9_0.criplayer_:Loop(false)
	else
		arg_9_0.criplayer_:Loop(arg_9_4)
	end

	arg_9_0.criplayer_:SetFile(nil, arg_9_1)

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

			local var_13_0 = tonumber(tostring(arg_11_0.criplayer_:GetTime()) / 1000000)

			arg_11_0.time = var_13_0
			arg_11_0.lastTime = arg_11_0.time

			local var_13_1 = ""

			for iter_13_0, iter_13_1 in ipairs(var_11_1) do
				if arg_11_0.time > iter_13_1.start and arg_11_0.time < iter_13_1.endTime then
					var_13_1 = var_13_1 .. GetI18NText(iter_13_1.content) .. "\n"
				end
			end

			if arg_11_0.time >= var_11_1[#var_11_1].endTime then
				arg_11_0:RemoveCaptionTimer()

				return
			end

			arg_11_0.text_.text = var_13_1
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

function var_0_0.GetVedioFileName(arg_20_0, arg_20_1)
	local var_20_0 = arg_20_1

	for iter_20_0 in string.gmatch(arg_20_1, "[^/]+$") do
		var_20_0 = iter_20_0
	end

	return var_20_0
end

function var_0_0.GetVedioTrackIndex(arg_21_0, arg_21_1)
	local var_21_0 = arg_21_0:GetVedioFileName(arg_21_1)
	local var_21_1 = 0
	local var_21_2 = manager.audio:GetLocalizationFlag()
	local var_21_3 = VideoTrackCfg[var_21_0]

	if var_21_3 and var_21_3.has_tracks == 1 then
		if var_21_2 == "zh" then
			var_21_1 = 0
		elseif var_21_2 == "ja" then
			var_21_1 = 1
		elseif var_21_2 == "en" then
			var_21_1 = 2
		elseif var_21_2 == "ko" then
			var_21_1 = 3
		end
	end

	return var_21_1
end

local var_0_1 = {
	"en",
	"ja",
	"ko",
	"tw"
}

function var_0_0.GetI18NVideoPath(arg_22_0, arg_22_1)
	local var_22_0 = arg_22_0:GetVedioFileName(arg_22_1)

	if not VideoTrackCfg[var_22_0] or type(VideoTrackCfg[var_22_0].i18n_video_list) ~= "table" or #VideoTrackCfg[var_22_0].i18n_video_list == 0 then
		return arg_22_1
	end

	local var_22_1 = VideoTrackCfg[var_22_0].i18n_video_list
	local var_22_2 = string.gsub(arg_22_1, ".usm", "")

	if SDKTools.GetIsEnglish() and table.indexof(var_22_1, 1) then
		var_22_2 = var_22_2 .. "_" .. var_0_1[1]
	elseif SDKTools.GetIsJapan() and table.indexof(var_22_1, 2) then
		var_22_2 = var_22_2 .. "_" .. var_0_1[2]
	elseif SDKTools.GetIsKorea() and table.indexof(var_22_1, 3) then
		var_22_2 = var_22_2 .. "_" .. var_0_1[3]
	elseif SDKTools.GetIsTw() and table.indexof(var_22_1, 4) then
		var_22_2 = var_22_2 .. "_" .. var_0_1[4]
	end

	return var_22_2 .. ".usm"
end

return var_0_0
