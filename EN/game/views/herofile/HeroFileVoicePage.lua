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

local function var_0_1(arg_7_0, arg_7_1)
	if not SDKTools.GetIsOverSea() then
		return false
	end

	if DormHeroTools:IsVoiceNeedUnlock(arg_7_1, arg_7_0) then
		return BackHomeHeroCfg[arg_7_0] == nil
	end

	return false
end

function var_0_0.UpdateVoiceData(arg_8_0)
	arg_8_0.voiceList_ = {}

	local var_8_0 = 1

	for iter_8_0, iter_8_1 in ipairs(HeroVoiceCfg.all) do
		local var_8_1 = HeroTools:IsUnlockVoice(arg_8_0.curHeroID_, iter_8_1)
		local var_8_2

		if not var_0_1(arg_8_0.curHeroID_, iter_8_1) then
			var_8_2 = HeroVoiceDescCfg.Get(arg_8_0.curHeroID_, iter_8_1)
		end

		if var_8_2 ~= nil and var_8_2 ~= "" then
			arg_8_0.voiceList_[var_8_0] = {
				id = iter_8_1,
				unlock = var_8_1
			}
			var_8_0 = var_8_0 + 1
		end
	end

	table.sort(arg_8_0.voiceList_, function(arg_9_0, arg_9_1)
		if (arg_9_0.unlock or arg_9_1.unlock) and arg_9_0.unlock ~= arg_9_1.unlock then
			return arg_9_0.unlock
		end

		return arg_9_0.id < arg_9_1.id
	end)
end

function var_0_0.PlayVoice(arg_10_0, arg_10_1)
	SDKTools.SendMessageToSDK("hero_sound", {
		hero_id = arg_10_0.curHeroID_,
		sound_id = arg_10_1
	})
	arg_10_0:StopVoice()

	if arg_10_0.formID_ then
		arg_10_0.dialogText_.text = HeroVoiceDescCfg.GetByFormID(arg_10_0.formID_, arg_10_1)
	else
		arg_10_0.dialogText_.text = HeroVoiceDescCfg.Get(arg_10_0.curHeroID_, arg_10_1)
	end

	arg_10_0.dialogBoxTrs_:SetSizeDeltaY(math.max(arg_10_0.dialogText_.preferredHeight + 48, 128))
	SetActive(arg_10_0.dialogBoxGo_, true)
	arg_10_0.dialogAni_:Play("HeroFileVoicePageUI", 0)
	arg_10_0.dialogAni_:Update(0)

	arg_10_0.delayPlayTimer_ = Timer.New(function()
		if manager.audio:IsStoppedOfVoice() then
			arg_10_0.delayPlayTimer_:Stop()

			arg_10_0.delayPlayTimer_ = nil

			local var_11_0 = arg_10_0.curHeroID_
			local var_11_1 = false

			print("voiceID:", arg_10_1)

			if HeroVoiceCfg[arg_10_1].use_skin_id and HeroVoiceCfg[arg_10_1].use_skin_id ~= 0 then
				var_11_0 = HeroVoiceCfg[arg_10_1].use_skin_id
				var_11_1 = true
			end

			if arg_10_0.formID_ then
				if var_11_1 then
					local var_11_2 = string.sub(tostring(var_11_0), -2)
					local var_11_3 = tostring(arg_10_0.formID_) .. var_11_2

					var_11_0 = tonumber(var_11_3)
				else
					var_11_0 = arg_10_0.formID_
				end
			end

			HeroTools.PlayVoice(var_11_0, HeroVoiceCfg[arg_10_1].file, HeroVoiceCfg[arg_10_1].type)

			local var_11_4 = HeroTools.GetTalkLength(var_11_0, HeroVoiceCfg[arg_10_1].file, HeroVoiceCfg[arg_10_1].type)
			local var_11_5 = math.max(var_11_4, 0.017)

			arg_10_0.timer_ = TimeTools.StartAfterSeconds(var_11_5 / 1000, function()
				arg_10_0:StopVoice()
			end, {})
		end
	end, 0.033, -1)

	arg_10_0.delayPlayTimer_:Start()

	arg_10_0.playingVoiceID_ = arg_10_1

	for iter_10_0, iter_10_1 in ipairs(arg_10_0.itemList_) do
		if iter_10_1 then
			iter_10_1:StartPlay(arg_10_0.playingVoiceID_)
		end
	end
end

function var_0_0.StopVoice(arg_13_0)
	SetActive(arg_13_0.dialogBoxGo_, false)

	if arg_13_0.delayPlayTimer_ then
		arg_13_0.delayPlayTimer_:Stop()

		arg_13_0.delayPlayTimer_ = nil
	end

	manager.audio:StopVoiceImmediate()

	if arg_13_0.timer_ then
		arg_13_0.timer_:Stop()

		arg_13_0.timer_ = nil
	end

	if arg_13_0.playingVoiceID_ ~= 0 then
		for iter_13_0, iter_13_1 in ipairs(arg_13_0.itemList_) do
			if iter_13_1 then
				iter_13_1:StopPlay()
			end
		end

		arg_13_0.playingVoiceID_ = 0
	end
end

function var_0_0.ForceUpdate(arg_14_0)
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_14_0.content_)
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_14_0.content_)
end

function var_0_0.UpdateView(arg_15_0, arg_15_1, arg_15_2, arg_15_3)
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_0.content_)
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_0.content_)

	arg_15_0.curHeroID_ = arg_15_2

	if arg_15_3 then
		arg_15_0.formID_ = arg_15_3
	else
		arg_15_0.formID_ = nil
	end

	arg_15_0:InitItemList()
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_0.content_)
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_0.content_)
end

function var_0_0.InitItemList(arg_16_0)
	local var_16_0 = 1

	for iter_16_0, iter_16_1 in pairs(HeroVoiceTagCfg.all) do
		if not arg_16_0.itemList_[var_16_0] then
			local var_16_1 = Object.Instantiate(arg_16_0.contentItem_, arg_16_0.content_)

			arg_16_0.itemList_[var_16_0] = HeroFileVoiceContentItem.New(var_16_1)
		end

		arg_16_0.itemList_[var_16_0]:SetIsShow(true)
		arg_16_0.itemList_[var_16_0]:SetData(arg_16_0.curHeroID_, HeroVoiceTagCfg.all[var_16_0], arg_16_0.formID_, function(arg_17_0)
			PlayerAction.CheckHeroVoice(arg_16_0.curHeroID_, function()
				if arg_16_0.playingVoiceID_ == arg_17_0 then
					arg_16_0:StopVoice()
				else
					arg_16_0:PlayVoice(arg_17_0)
				end
			end)
		end, function()
			arg_16_0:ForceUpdate()
		end)
		arg_16_0.itemList_[var_16_0]:ChangeShow(false)
		arg_16_0.itemList_[var_16_0]:StartPlay(arg_16_0.playingVoiceID_)

		var_16_0 = var_16_0 + 1
	end

	for iter_16_2, iter_16_3 in pairs(arg_16_0.itemList_) do
		if var_16_0 <= iter_16_2 or iter_16_3:IsEmpty() then
			iter_16_3:SetIsShow(false)
		end
	end
end

function var_0_0.Dispose(arg_20_0)
	for iter_20_0, iter_20_1 in pairs(arg_20_0.itemList_) do
		iter_20_1:Dispose()
	end

	arg_20_0.itemList_ = {}

	var_0_0.super.Dispose(arg_20_0)
end

return var_0_0
