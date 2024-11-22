local var_0_0 = class("HeroFileArchivePage", ReduxView)

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
	arg_3_0.curRecordID_ = 0
	arg_3_0.linkTabItems_ = {}
	arg_3_0.curTabIndex_ = 0
	arg_3_0.curTabLockState_ = {}
	arg_3_0.voiceCoolDown_ = false
	arg_3_0.lockController = arg_3_0.lockControllerEx_:GetController("lock")
	arg_3_0.contentSizeFitter_ = arg_3_0.detailTrs_:GetComponent("ContentSizeFitter")
end

function var_0_0.AddUIListener(arg_4_0)
	return
end

function var_0_0.CameraEnter(arg_5_0)
	manager.heroRaiseTrack:SetViewState(HeroRaiseTrackConst.ViewType.heroRaiseCommon, {
		1,
		3
	})
end

function var_0_0.SwitchTab(arg_6_0, arg_6_1, arg_6_2)
	if arg_6_1 == arg_6_0.curTabIndex_ then
		return
	end

	if arg_6_0.linkTabItems_[arg_6_0.curTabIndex_] then
		arg_6_0.linkTabItems_[arg_6_0.curTabIndex_]:SetSelectState(false)
	end

	arg_6_0.linkTabItems_[arg_6_1]:SetSelectState(true)
	arg_6_0.detailTrs_:SetAnchoredPositionY(0)

	arg_6_0.contentSizeFitter_.verticalFit = ContentSizeFitter.FitMode.Unconstrained
	arg_6_0.contentSizeTimer_ = Timer.New(function()
		arg_6_0.contentSizeFitter_.verticalFit = ContentSizeFitter.FitMode.PreferredSize

		if arg_6_0.contentSizeTimer_ then
			arg_6_0.contentSizeTimer_:Stop()

			arg_6_0.contentSizeTimer_ = nil
		end
	end, 0.2, 1)

	arg_6_0.contentSizeTimer_:Start()

	arg_6_0.titleText_.text = string.format(GetTips("HERO_RECORD_HEART_CHAIN"), arg_6_1)

	if arg_6_0.curTabLockState_[arg_6_1] then
		arg_6_0.lockController:SetSelectedState("lock")

		arg_6_0.lockTipsText_.text = string.format(GetTips("HERO_HEART_CHAIN_PLOT_UNLOCK_LOVE"), arg_6_1)
	else
		arg_6_0.lockController:SetSelectedState("unlock")

		local var_6_0 = HeroRecordCfg[arg_6_0.curRecordID_]

		arg_6_0.detailText_.text = var_6_0["heart_chain" .. arg_6_1]

		if arg_6_2 then
			arg_6_0:PlayVoice(arg_6_1)
		end

		if not ArchiveData:IsHeartRead(arg_6_0.curRecordID_, arg_6_1) then
			HeroAction.ReadHeartLink(arg_6_0.curRecordID_, arg_6_1)
			manager.redPoint:setTip(RedPointConst.HERO_HEARTLINK_ID .. arg_6_0.curRecordID_ .. "_" .. arg_6_1, 0)
		end
	end

	arg_6_0.curTabIndex_ = arg_6_1
end

function var_0_0.Show(arg_8_0, arg_8_1, arg_8_2)
	arg_8_0:UpdateView(arg_8_1, arg_8_2)
	SetActive(arg_8_0.gameObject_, true)
end

function var_0_0.BindRedPoint(arg_9_0, arg_9_1, arg_9_2)
	manager.redPoint:bindUIandKey(arg_9_1.transform_, RedPointConst.HERO_HEARTLINK_ID .. arg_9_0.curRecordID_ .. "_" .. arg_9_2)
end

function var_0_0.Hide(arg_10_0)
	for iter_10_0 = 1, #arg_10_0.linkTabItems_ do
		manager.redPoint:unbindUIandKey(arg_10_0.linkTabItems_[iter_10_0].transform_)
	end

	arg_10_0:StopVoice()

	if arg_10_0.contentSizeTimer_ then
		arg_10_0.contentSizeTimer_:Stop()

		arg_10_0.contentSizeTimer_ = nil
	end

	SetActive(arg_10_0.gameObject_, false)
end

function var_0_0.PlayVoice(arg_11_0, arg_11_1)
	if arg_11_0.voiceCoolDown_ then
		return
	end

	arg_11_0.voiceCoolDown_ = true

	local var_11_0 = HeroVoiceCfg.get_id_list_by_file["trust" .. arg_11_1][1]

	SDKTools.SendMessageToSDK("hero_sound", {
		hero_id = arg_11_0.curHeroID_,
		sound_id = var_11_0
	})
	arg_11_0:StopVoice()

	arg_11_0.delayPlayTimer_ = Timer.New(function()
		if manager.audio:IsStoppedOfVoice() then
			arg_11_0.delayPlayTimer_:Stop()

			arg_11_0.delayPlayTimer_ = nil

			local var_12_0 = arg_11_0.curHeroID_

			if HeroVoiceCfg[var_11_0].use_skin_id and HeroVoiceCfg[var_11_0].use_skin_id ~= 0 then
				var_12_0 = HeroVoiceCfg[var_11_0].use_skin_id
			end

			HeroTools.PlayVoice(var_12_0, HeroVoiceCfg[var_11_0].file, HeroVoiceCfg[var_11_0].type)

			local var_12_1 = HeroTools.GetTalkLength(var_12_0, HeroVoiceCfg[var_11_0].file, HeroVoiceCfg[var_11_0].type)
			local var_12_2 = math.max(var_12_1, 0.017)

			arg_11_0.timer_ = TimeTools.StartAfterSeconds(var_12_2 / 1000, function()
				arg_11_0:StopVoice()
			end, {})
		end
	end, 0.033, -1)

	arg_11_0.delayPlayTimer_:Start()
end

function var_0_0.UpdateView(arg_14_0, arg_14_1, arg_14_2)
	arg_14_0.curHeroID_ = arg_14_2
	arg_14_0.curRecordID_ = arg_14_1

	if #arg_14_0.linkTabItems_ == 0 then
		for iter_14_0 = 1, HeroConst.HERO_HEARTLINK_STORY_MAX_COUNT do
			local var_14_0 = Object.Instantiate(arg_14_0.linktabitemGo_, arg_14_0.linktabTrs_)

			SetActive(var_14_0, true)

			arg_14_0.linkTabItems_[iter_14_0] = HeroFileArchiveTabItem.New(var_14_0, iter_14_0, function()
				arg_14_0:SwitchTab(iter_14_0, true)
			end)
		end
	end

	for iter_14_1 = 1, HeroConst.HERO_HEARTLINK_STORY_MAX_COUNT do
		local var_14_1 = GameSetting.heart_chain_unlock_condition.value[iter_14_1]
		local var_14_2 = not IsConditionAchieved(var_14_1, {
			heroId = arg_14_0.curRecordID_
		})

		arg_14_0.curTabLockState_[iter_14_1] = var_14_2

		arg_14_0.linkTabItems_[iter_14_1]:SetLockState(var_14_2)
		arg_14_0.linkTabItems_[iter_14_1]:SetSelectState(false)
		arg_14_0:BindRedPoint(arg_14_0.linkTabItems_[iter_14_1], iter_14_1)
	end

	arg_14_0.curTabIndex_ = 0

	arg_14_0:SwitchTab(1)
end

function var_0_0.StopVoice(arg_16_0)
	if arg_16_0.delayPlayTimer_ then
		arg_16_0.delayPlayTimer_:Stop()

		arg_16_0.delayPlayTimer_ = nil
	end

	manager.audio:StopVoiceImmediate()

	if arg_16_0.timer_ then
		arg_16_0.timer_:Stop()

		arg_16_0.timer_ = nil
		arg_16_0.voiceCoolDown_ = false
	end
end

function var_0_0.Dispose(arg_17_0)
	for iter_17_0 = 1, #arg_17_0.linkTabItems_ do
		arg_17_0.linkTabItems_[iter_17_0]:Dispose()
	end

	var_0_0.super.Dispose(arg_17_0)
end

return var_0_0
