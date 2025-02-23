local var_0_0 = class("HeroFileVoicePage", ReduxView)

function var_0_0.OnCtor(arg_1_0, arg_1_1)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_1.transform

	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	arg_2_0:InitUI()
end

function var_0_0.InitUI(arg_3_0)
	arg_3_0:BindCfgUI()

	arg_3_0.curHeroID_ = 0
	arg_3_0.playingVoiceID_ = 0
	arg_3_0.openItem = 0
	arg_3_0.itemList_ = {}
end

function var_0_0.CameraEnter(arg_4_0)
	manager.heroRaiseTrack:SetViewState(HeroRaiseTrackConst.ViewType.heroRaiseCommon, {
		1,
		3
	})
end

function var_0_0.Show(arg_5_0, arg_5_1, arg_5_2, arg_5_3, arg_5_4)
	arg_5_0:UpdateView(arg_5_1, arg_5_2, arg_5_4)
	SetActive(arg_5_0.dialogBoxGo_, false)
	SetActive(arg_5_0.gameObject_, true)
end

function var_0_0.Hide(arg_6_0)
	arg_6_0:StopVoice()
	SetActive(arg_6_0.gameObject_, false)
end

function var_0_0.PlayVoice(arg_7_0, arg_7_1)
	SDKTools.SendMessageToSDK("hero_sound", {
		hero_id = arg_7_0.curHeroID_,
		sound_id = arg_7_1
	})
	arg_7_0:StopVoice()

	if arg_7_0.formID_ then
		arg_7_0.dialogText_.text = HeroVoiceDescCfg.GetByFormID(arg_7_0.formID_, arg_7_1)
	else
		arg_7_0.dialogText_.text = HeroVoiceDescCfg.Get(arg_7_0.curHeroID_, arg_7_1)
	end

	arg_7_0.dialogBoxTrs_:SetSizeDeltaY(math.max(arg_7_0.dialogText_.preferredHeight + 48, 128))

	arg_7_0.scrollRect_.normalizedPosition = Vector2(0, 1)

	SetActive(arg_7_0.dialogBoxGo_, true)
	arg_7_0.dialogAni_:Update(0)

	arg_7_0.delayPlayTimer_ = Timer.New(function()
		if manager.audio:IsStoppedOfVoice() then
			arg_7_0.delayPlayTimer_:Stop()

			arg_7_0.delayPlayTimer_ = nil

			local var_8_0 = arg_7_0.curHeroID_
			local var_8_1 = false

			if HeroVoiceCfg[arg_7_1].use_skin_id and HeroVoiceCfg[arg_7_1].use_skin_id ~= 0 then
				var_8_0 = HeroVoiceCfg[arg_7_1].use_skin_id
				var_8_1 = true
			end

			if arg_7_0.formID_ then
				if var_8_1 then
					local var_8_2 = string.sub(tostring(var_8_0), -2)
					local var_8_3 = tostring(arg_7_0.formID_) .. var_8_2

					var_8_0 = tonumber(var_8_3)
				else
					var_8_0 = arg_7_0.formID_
				end
			end

			HeroTools.PlayVoice(var_8_0, HeroVoiceCfg[arg_7_1].file, HeroVoiceCfg[arg_7_1].type)

			local var_8_4 = HeroTools.GetTalkLength(var_8_0, HeroVoiceCfg[arg_7_1].file, HeroVoiceCfg[arg_7_1].type)
			local var_8_5 = math.max(var_8_4, 0.017)

			arg_7_0.timer_ = TimeTools.StartAfterSeconds(var_8_5 / 1000, function()
				arg_7_0:StopVoice()
			end, {})
		end
	end, 0.033, -1)

	arg_7_0.delayPlayTimer_:Start()

	arg_7_0.playingVoiceID_ = arg_7_1

	for iter_7_0, iter_7_1 in ipairs(arg_7_0.itemList_) do
		if iter_7_1 then
			iter_7_1:StartPlay(arg_7_0.playingVoiceID_)
		end
	end
end

function var_0_0.StopVoice(arg_10_0)
	SetActive(arg_10_0.dialogBoxGo_, false)

	if arg_10_0.delayPlayTimer_ then
		arg_10_0.delayPlayTimer_:Stop()

		arg_10_0.delayPlayTimer_ = nil
	end

	manager.audio:StopVoiceImmediate()

	if arg_10_0.timer_ then
		arg_10_0.timer_:Stop()

		arg_10_0.timer_ = nil
	end

	if arg_10_0.playingVoiceID_ ~= 0 then
		for iter_10_0, iter_10_1 in ipairs(arg_10_0.itemList_) do
			if iter_10_1 then
				iter_10_1:StopPlay()
			end
		end

		arg_10_0.playingVoiceID_ = 0
	end
end

function var_0_0.ForceUpdate(arg_11_0)
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_0.content_)
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_0.content_)
end

function var_0_0.UpdateView(arg_12_0, arg_12_1, arg_12_2, arg_12_3)
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_12_0.content_)
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_12_0.content_)

	arg_12_0.curHeroID_ = arg_12_2

	if arg_12_3 then
		arg_12_0.formID_ = arg_12_3
	else
		arg_12_0.formID_ = nil
	end

	arg_12_0:InitItemList()
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_12_0.content_)
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_12_0.content_)
end

function var_0_0.InitItemList(arg_13_0)
	local var_13_0 = 1

	for iter_13_0, iter_13_1 in pairs(HeroVoiceTagCfg.all) do
		if not arg_13_0.itemList_[var_13_0] then
			local var_13_1 = Object.Instantiate(arg_13_0.contentItem_, arg_13_0.content_)

			arg_13_0.itemList_[var_13_0] = HeroFileVoiceContentItem.New(var_13_1)
		end

		arg_13_0.itemList_[var_13_0]:SetIsShow(true)
		arg_13_0.itemList_[var_13_0]:SetData(arg_13_0.curHeroID_, HeroVoiceTagCfg.all[var_13_0], arg_13_0.formID_, function(arg_14_0)
			PlayerAction.CheckHeroVoice(arg_13_0.curHeroID_, function()
				if arg_13_0.playingVoiceID_ == arg_14_0 then
					arg_13_0:StopVoice()
				else
					arg_13_0:PlayVoice(arg_14_0)
				end
			end)
		end, function()
			arg_13_0:ForceUpdate()
		end)
		arg_13_0.itemList_[var_13_0]:ChangeShow(false)
		arg_13_0.itemList_[var_13_0]:StartPlay(arg_13_0.playingVoiceID_)

		var_13_0 = var_13_0 + 1
	end

	for iter_13_2, iter_13_3 in pairs(arg_13_0.itemList_) do
		if var_13_0 <= iter_13_2 or iter_13_3:IsEmpty() then
			iter_13_3:SetIsShow(false)
		end
	end
end

function var_0_0.Dispose(arg_17_0)
	for iter_17_0, iter_17_1 in pairs(arg_17_0.itemList_) do
		iter_17_1:Dispose()
	end

	arg_17_0.itemList_ = {}

	var_0_0.super.Dispose(arg_17_0)
end

return var_0_0
