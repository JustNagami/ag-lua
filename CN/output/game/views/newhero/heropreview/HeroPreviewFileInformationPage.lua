local var_0_0 = class("HeroPreviewFileInformationPage", HeroFileInformationPage)

function var_0_0.InitUI(arg_1_0)
	arg_1_0:BindCfgUI()
	arg_1_0:AddBtnListeners()

	arg_1_0.curHeroID_ = 0
	arg_1_0.curRecordID_ = 0
	arg_1_0.relationNetController_ = arg_1_0.rightControllerEx_:GetController("relationNet")
	arg_1_0.lockController_ = arg_1_0.controller_:GetController("lock")
	arg_1_0.recommendController_ = arg_1_0.controller_:GetController("recommend")
	arg_1_0.items = {}
end

function var_0_0.AddBtnListeners(arg_2_0)
	arg_2_0:AddBtnListener(arg_2_0.portraitBtn_, nil, function()
		arg_2_0:Go("heroPortrait", {
			heroID = arg_2_0.curHeroID_
		})
	end)
	arg_2_0:AddBtnListener(arg_2_0.poltBtn_, nil, function()
		if ObtainHeroMovieCfg[arg_2_0.curHeroID_] then
			arg_2_0:Go("/heroMovieReplay", {
				heroID = arg_2_0.curHeroID_
			})
			OperationRecorder.RecordButtonTouch("video_play_recruit_illustration" .. arg_2_0.curHeroID_)
		end
	end)
	arg_2_0:AddBtnListener(arg_2_0.recommendBtn_, nil, function()
		arg_2_0.recommendController_:SetSelectedState("true")
	end)
	arg_2_0:AddBtnListener(arg_2_0.bgmask_, nil, function()
		arg_2_0.recommendController_:SetSelectedState("false")
	end)
	arg_2_0:AddBtnListener(arg_2_0.cooperationBtn_, nil, function()
		OperationRecorder.RecordButtonTouch("video_play_comboskill_illustration")
		DestroyLua()

		HeroCooperationBridge.heroId = arg_2_0.curHeroID_
		HeroCooperationBridge.entrance = ViewConst.SYSTEM_ID.ILLUSTRATION

		CooperateSkillBridge.Launcher()
	end)
end

function var_0_0.Show(arg_8_0, arg_8_1, arg_8_2, arg_8_3)
	if arg_8_2 ~= arg_8_0.curHeroID_ then
		local var_8_0 = HeroCfg[arg_8_2]

		arg_8_0.heroCfg_ = var_8_0
		arg_8_0.lableText_.text = GetI18NText(var_8_0.name)
		arg_8_0.summaryText_.text = GetI18NText(var_8_0.hero_desc)
		arg_8_0.campImg_.sprite = HeroTools.GetRaceIcon(var_8_0.race)
		arg_8_0.attackTypeImg_.sprite = HeroTools.GetHeroSkillAttributeIcon(arg_8_0.heroCfg_.id)

		arg_8_0:RefreshChargeType()

		arg_8_0.rareImg_.sprite = getSprite("Atlas/Common", "star_" .. var_8_0.rare)
		arg_8_0.rangeTypeText_.text = CharactorParamCfg[arg_8_0.heroCfg_.id].RangeType == 0 and GetTips("RANGETYPE_CLOSE") or GetTips("RANGETYPE_LONG")
		arg_8_0.lockSummaryText_.text = GetI18NText(var_8_0.hero_desc)
		arg_8_0.curHeroID_ = arg_8_2
	end

	if arg_8_1 ~= arg_8_0.curRecordID_ then
		local var_8_1 = HeroRecordCfg[arg_8_1]

		arg_8_0.nameText_.text = GetI18NText(var_8_1.name)
		arg_8_0.heightText_.text = GetI18NText(var_8_1.height)
		arg_8_0.weightText_.text = GetI18NText(var_8_1.weight)
		arg_8_0.birthdayText_.text = GetI18NText(var_8_1.birthday)
		arg_8_0.organizationText_.text = GetI18NText(var_8_1.organization)
		arg_8_0.hobbyText_.text = GetI18NText(var_8_1.like)
		arg_8_0.curRecordID_ = arg_8_1
	end

	arg_8_0.lockController_:SetSelectedState("false")
	SetActive(arg_8_0.portraitBtn_.gameObject, HeroData:GetHeroData(arg_8_2).unlock == 1)

	if HeroData:GetHeroData(arg_8_2).unlock == 1 then
		arg_8_0.plotTxt_.text = GetTips("PULL_ANIMATION_REPLAY")
	else
		arg_8_0.plotTxt_.text = GetTips("PULL_ANIMATION_PREVIEW")
	end

	arg_8_0.scroll_.enabled = false
	arg_8_0.scroll_.enabled = true

	LayoutRebuilder.ForceRebuildLayoutImmediate(arg_8_0.summaryContent_)
	arg_8_0.relationNetController_:SetSelectedState("lock")
	SetActive(arg_8_0.poltBtn_.gameObject, ObtainHeroMovieCfg[arg_8_0.curHeroID_] ~= nil)
	SetActive(arg_8_0.gameObject_, true)
	arg_8_0:RefreshRecommend(arg_8_3)
end

function var_0_0.RefreshRecommend(arg_9_0, arg_9_1)
	arg_9_0.recommendController_:SetSelectedState("false")

	local var_9_0 = HeroCfg[arg_9_0.curHeroID_].recommend_team

	if var_9_0 and #var_9_0 > 0 and arg_9_1 then
		SetActive(arg_9_0.recommendBtn_.gameObject, true)

		for iter_9_0 = 1, #var_9_0 do
			if not arg_9_0.items[iter_9_0] then
				local var_9_1 = Object.Instantiate(arg_9_0.boxGo_, arg_9_0.boxParent_)

				arg_9_0.items[iter_9_0] = HeroPreviewReCommendItem.New(var_9_1)
			end

			arg_9_0.items[iter_9_0]:RefreshData(var_9_0[iter_9_0], arg_9_0.curHeroID_)
		end

		for iter_9_1 = #var_9_0 + 1, #arg_9_0.items do
			arg_9_0.items[iter_9_1]:Show(false)
		end
	else
		SetActive(arg_9_0.recommendBtn_.gameObject, false)
	end
end

function var_0_0.UpdateView(arg_10_0, arg_10_1, arg_10_2, arg_10_3)
	var_0_0.super.UpdateView(arg_10_0, arg_10_1, arg_10_2)
	arg_10_0.relationNetController_:SetSelectedState("lock")
	arg_10_0:RefreshRecommend(arg_10_3)
end

function var_0_0.RefreshChargeType(arg_11_0)
	local var_11_0 = arg_11_0.heroCfg_.mechanism_type[1]

	if var_11_0 == HeroConst.HERO_CHARGE_TYPE.RAGE then
		arg_11_0.chargeTypeText_.text = GetTips("NOTE_ENERGYTYPE_1")
	elseif var_11_0 == HeroConst.HERO_CHARGE_TYPE.ENERGY then
		arg_11_0.chargeTypeText_.text = GetTips("NOTE_ENERGYTYPE_2")
	elseif var_11_0 == HeroConst.HERO_CHARGE_TYPE.TRACES then
		arg_11_0.chargeTypeText_.text = GetTips("NOTE_ENERGYTYPE_3")
	elseif var_11_0 == HeroConst.HERO_CHARGE_TYPE.DIVINE_GRACE then
		arg_11_0.chargeTypeText_.text = GetTips("NOTE_ENERGYTYPE_4")
	end
end

function var_0_0.CameraEnter(arg_12_0)
	manager.heroRaiseTrack:SetViewState(HeroRaiseTrackConst.ViewType.heroRaiseCommon, {
		1,
		0,
		1
	}, arg_12_0.displayGo_)
end

function var_0_0.Dispose(arg_13_0)
	if arg_13_0.items then
		for iter_13_0, iter_13_1 in ipairs(arg_13_0.items) do
			iter_13_1:Dispose()
		end

		arg_13_0.items = nil
	end

	var_0_0.super.Dispose(arg_13_0)
end

return var_0_0
