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
	arg_7_0:StopVoice()

	arg_7_0.playingVoiceID_ = arg_7_1

	arg_7_0:RefreshDialog(arg_7_1)
	arg_7_0:PlayVoiceByDelayTime(arg_7_1)
	arg_7_0:StartItemPlay()
	arg_7_0:SendPlayVoiceMessage(arg_7_1)
end

function var_0_0.RefreshDialog(arg_8_0, arg_8_1)
	if arg_8_0.formID_ then
		arg_8_0.dialogText_.text = HeroVoiceDescCfg.GetByFormID(arg_8_0.formID_, arg_8_1)
	else
		arg_8_0.dialogText_.text = HeroVoiceDescCfg.Get(arg_8_0.curHeroID_, arg_8_1)
	end

	arg_8_0.dialogBoxTrs_:SetSizeDeltaY(math.max(arg_8_0.dialogText_.preferredHeight + 48, 128))

	arg_8_0.scrollRect_.normalizedPosition = Vector2(0, 1)

	SetActive(arg_8_0.dialogBoxGo_, true)
	arg_8_0.dialogAni_:Play("HeroFileVoicePageUI", 0)
	arg_8_0.dialogAni_:Update(0)
end

function var_0_0.PlayVoiceByDelayTime(arg_9_0, arg_9_1)
	arg_9_0:StopDelayTimer()

	arg_9_0.delayPlayTimer_ = Timer.New(function()
		if manager.audio:IsStoppedOfVoice() then
			arg_9_0:StopDelayTimer()

			local var_10_0 = arg_9_0:GetHeroIdForPlayVoice(arg_9_1)

			HeroTools.PlayVoice(var_10_0, HeroVoiceCfg[arg_9_1].file, HeroVoiceCfg[arg_9_1].type)

			local var_10_1 = arg_9_0:GetTalkSeconds(var_10_0, arg_9_1)

			arg_9_0.timer_ = TimeTools.StartAfterSeconds(var_10_1, function()
				arg_9_0:StopVoice()
			end, {})
		end
	end, 0.033, -1)

	arg_9_0.delayPlayTimer_:Start()
end

function var_0_0.GetHeroIdForPlayVoice(arg_12_0, arg_12_1)
	local var_12_0 = arg_12_0.curHeroID_
	local var_12_1 = false

	if HeroVoiceCfg[arg_12_1].use_skin_id and HeroVoiceCfg[arg_12_1].use_skin_id ~= 0 then
		var_12_0 = HeroVoiceCfg[arg_12_1].use_skin_id
		var_12_1 = true
	end

	if arg_12_0.formID_ then
		if var_12_1 then
			local var_12_2 = string.sub(tostring(var_12_0), -2)
			local var_12_3 = tostring(arg_12_0.formID_) .. var_12_2

			var_12_0 = tonumber(var_12_3)
		else
			var_12_0 = arg_12_0.formID_
		end
	end

	return var_12_0
end

function var_0_0.GetTalkSeconds(arg_13_0, arg_13_1, arg_13_2)
	local var_13_0 = HeroTools.GetTalkLength(arg_13_1, HeroVoiceCfg[arg_13_2].file, HeroVoiceCfg[arg_13_2].type)

	return math.max(var_13_0, 0.017) / 1000
end

function var_0_0.StartItemPlay(arg_14_0)
	for iter_14_0, iter_14_1 in ipairs(arg_14_0.itemList_) do
		if iter_14_1 then
			iter_14_1:StartPlay(arg_14_0.playingVoiceID_)
		end
	end
end

function var_0_0.StopVoice(arg_15_0)
	SetActive(arg_15_0.dialogBoxGo_, false)
	arg_15_0:StopDelayTimer()
	manager.audio:StopVoiceImmediate()

	if arg_15_0.timer_ then
		arg_15_0.timer_:Stop()

		arg_15_0.timer_ = nil
	end

	if arg_15_0.playingVoiceID_ ~= 0 then
		for iter_15_0, iter_15_1 in ipairs(arg_15_0.itemList_) do
			if iter_15_1 then
				iter_15_1:StopPlay()
			end
		end

		arg_15_0.playingVoiceID_ = 0
	end
end

function var_0_0.StopDelayTimer(arg_16_0)
	if arg_16_0.delayPlayTimer_ then
		arg_16_0.delayPlayTimer_:Stop()

		arg_16_0.delayPlayTimer_ = nil
	end
end

function var_0_0.ForceUpdate(arg_17_0)
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_17_0.content_)
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_17_0.content_)
end

function var_0_0.UpdateView(arg_18_0, arg_18_1, arg_18_2, arg_18_3)
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_18_0.content_)
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_18_0.content_)

	arg_18_0.curHeroID_ = arg_18_2

	if arg_18_3 then
		arg_18_0.formID_ = arg_18_3
	else
		arg_18_0.formID_ = nil
	end

	arg_18_0:InitItemList()
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_18_0.content_)
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_18_0.content_)
end

function var_0_0.InitItemList(arg_19_0)
	local var_19_0 = 1

	for iter_19_0, iter_19_1 in pairs(HeroVoiceTagCfg.all) do
		if not arg_19_0.itemList_[var_19_0] then
			local var_19_1 = Object.Instantiate(arg_19_0.contentItem_, arg_19_0.content_)

			arg_19_0.itemList_[var_19_0] = HeroFileVoiceContentItem.New(var_19_1)
		end

		arg_19_0.itemList_[var_19_0]:SetIsShow(true)
		arg_19_0.itemList_[var_19_0]:SetData(arg_19_0.curHeroID_, HeroVoiceTagCfg.all[var_19_0], arg_19_0.formID_, function(arg_20_0)
			PlayerAction.CheckHeroVoice(arg_19_0.curHeroID_, function()
				if arg_19_0.playingVoiceID_ == arg_20_0 then
					arg_19_0:StopVoice()
				else
					arg_19_0:PlayVoice(arg_20_0)
				end
			end)
		end, function()
			arg_19_0:ForceUpdate()
		end)
		arg_19_0.itemList_[var_19_0]:ChangeShow(false)
		arg_19_0.itemList_[var_19_0]:StartPlay(arg_19_0.playingVoiceID_)

		var_19_0 = var_19_0 + 1
	end

	for iter_19_2, iter_19_3 in pairs(arg_19_0.itemList_) do
		if var_19_0 <= iter_19_2 or iter_19_3:IsEmpty() then
			iter_19_3:SetIsShow(false)
		end
	end
end

function var_0_0.Dispose(arg_23_0)
	for iter_23_0, iter_23_1 in pairs(arg_23_0.itemList_) do
		iter_23_1:Dispose()
	end

	arg_23_0.itemList_ = {}

	var_0_0.super.Dispose(arg_23_0)
end

function var_0_0.SendPlayVoiceMessage(arg_24_0, arg_24_1)
	SDKTools.SendMessageToSDK("hero_sound", {
		hero_id = arg_24_0.curHeroID_,
		sound_id = arg_24_1
	})
end

return var_0_0
