local var_0_0 = class("HeroFileVoicePage", ReduxView)

function var_0_0.OnCtor(arg_1_0, arg_1_1)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_1.transform

	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	arg_2_0:InitUI()
	arg_2_0:AddUIListener()
end

function var_0_0.InitUI(arg_3_0)
	arg_3_0:BindCfgUI()

	arg_3_0.curHeroID_ = 0
	arg_3_0.voiceList_ = {}
	arg_3_0.playingVoiceIndex_ = 0
	arg_3_0.voiceLuaUiList_ = LuaList.New(handler(arg_3_0, arg_3_0.IndexVoiceItem), arg_3_0.voiceUilist_, HeroFileVoiceItem)
end

function var_0_0.CameraEnter(arg_4_0)
	manager.heroRaiseTrack:SetViewState(HeroRaiseTrackConst.ViewType.heroRaiseCommon, {
		1,
		3
	})
end

function var_0_0.AddUIListener(arg_5_0)
	return
end

function var_0_0.IndexVoiceItem(arg_6_0, arg_6_1, arg_6_2)
	arg_6_2:SetData(arg_6_0.curHeroID_, arg_6_0.voiceList_[arg_6_1], function()
		PlayerAction.CheckHeroVoice(arg_6_0.curHeroID_, function()
			if arg_6_0.playingVoiceIndex_ == arg_6_1 then
				arg_6_0:StopVoice()
			else
				arg_6_0:PlayVoice(arg_6_1, arg_6_0.voiceList_[arg_6_1].id)
			end
		end)
	end)

	if arg_6_1 == arg_6_0.playingVoiceIndex_ then
		arg_6_2:StartPlay()
	else
		arg_6_2:StopPlay()
	end
end

function var_0_0.Show(arg_9_0, arg_9_1, arg_9_2)
	arg_9_0:UpdateView(arg_9_1, arg_9_2)
	arg_9_0.voiceLuaUiList_:StartScroll(#arg_9_0.voiceList_)
	SetActive(arg_9_0.dialogBoxGo_, false)
	SetActive(arg_9_0.gameObject_, true)
end

function var_0_0.Hide(arg_10_0)
	arg_10_0:StopVoice()
	SetActive(arg_10_0.gameObject_, false)
end

local function var_0_1(arg_11_0, arg_11_1)
	if not SDKTools.GetIsOverSea() then
		return false
	end

	if DormHeroTools:IsVoiceNeedUnlock(arg_11_1, arg_11_0) then
		return BackHomeHeroCfg[arg_11_0] == nil
	end

	return false
end

function var_0_0.UpdateVoiceData(arg_12_0)
	arg_12_0.voiceList_ = {}

	local var_12_0 = 1

	for iter_12_0, iter_12_1 in ipairs(HeroVoiceCfg.all) do
		local var_12_1 = HeroTools.IsUnlockVoice(arg_12_0.curHeroID_, iter_12_1)
		local var_12_2

		if not var_0_1(arg_12_0.curHeroID_, iter_12_1) then
			var_12_2 = HeroVoiceDescCfg.Get(arg_12_0.curHeroID_, iter_12_1)
		end

		if var_12_2 ~= nil and var_12_2 ~= "" then
			arg_12_0.voiceList_[var_12_0] = {
				id = iter_12_1,
				unlock = var_12_1
			}
			var_12_0 = var_12_0 + 1
		end
	end

	table.sort(arg_12_0.voiceList_, function(arg_13_0, arg_13_1)
		if (arg_13_0.unlock or arg_13_1.unlock) and arg_13_0.unlock ~= arg_13_1.unlock then
			return arg_13_0.unlock
		end

		return arg_13_0.id < arg_13_1.id
	end)
end

function var_0_0.PlayVoice(arg_14_0, arg_14_1, arg_14_2)
	SDKTools.SendMessageToSDK("hero_sound", {
		hero_id = arg_14_0.curHeroID_,
		sound_id = arg_14_2
	})
	arg_14_0:StopVoice()

	arg_14_0.dialogText_.text = HeroVoiceDescCfg.Get(arg_14_0.curHeroID_, arg_14_2)

	arg_14_0.dialogBoxTrs_:SetSizeDeltaY(math.max(arg_14_0.dialogText_.preferredHeight + 48, 128))
	SetActive(arg_14_0.dialogBoxGo_, true)
	arg_14_0.dialogAni_:Play("HeroFileVoicePageUI", 0)
	arg_14_0.dialogAni_:Update(0)

	arg_14_0.delayPlayTimer_ = Timer.New(function()
		if manager.audio:IsStoppedOfVoice() then
			arg_14_0.delayPlayTimer_:Stop()

			arg_14_0.delayPlayTimer_ = nil

			local var_15_0 = arg_14_0.curHeroID_

			if HeroVoiceCfg[arg_14_2].use_skin_id and HeroVoiceCfg[arg_14_2].use_skin_id ~= 0 then
				var_15_0 = HeroVoiceCfg[arg_14_2].use_skin_id
			end

			HeroTools.PlayVoice(var_15_0, HeroVoiceCfg[arg_14_2].file, HeroVoiceCfg[arg_14_2].type)

			local var_15_1 = HeroTools.GetTalkLength(var_15_0, HeroVoiceCfg[arg_14_2].file, HeroVoiceCfg[arg_14_2].type)
			local var_15_2 = math.max(var_15_1, 0.017)

			arg_14_0.timer_ = TimeTools.StartAfterSeconds(var_15_2 / 1000, function()
				arg_14_0:StopVoice()
			end, {})
		end
	end, 0.033, -1)

	arg_14_0.delayPlayTimer_:Start()

	arg_14_0.playingVoiceIndex_ = arg_14_1

	local var_14_0 = arg_14_0.voiceLuaUiList_:GetItemByIndex(arg_14_1)

	if var_14_0 then
		var_14_0:StartPlay()
	end
end

function var_0_0.StopVoice(arg_17_0)
	SetActive(arg_17_0.dialogBoxGo_, false)

	if arg_17_0.delayPlayTimer_ then
		arg_17_0.delayPlayTimer_:Stop()

		arg_17_0.delayPlayTimer_ = nil
	end

	manager.audio:StopVoiceImmediate()

	if arg_17_0.timer_ then
		arg_17_0.timer_:Stop()

		arg_17_0.timer_ = nil
	end

	if arg_17_0.playingVoiceIndex_ ~= 0 then
		local var_17_0 = arg_17_0.voiceLuaUiList_:GetItemByIndex(arg_17_0.playingVoiceIndex_)

		if var_17_0 then
			var_17_0:StopPlay()
		end

		arg_17_0.playingVoiceIndex_ = 0
	end
end

function var_0_0.UpdateView(arg_18_0, arg_18_1, arg_18_2)
	arg_18_0.curHeroID_ = arg_18_2

	arg_18_0:UpdateVoiceData()
end

function var_0_0.Dispose(arg_19_0)
	arg_19_0.voiceLuaUiList_:Dispose()
	var_0_0.super.Dispose(arg_19_0)
end

return var_0_0
