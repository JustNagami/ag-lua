local var_0_0 = class("HeroPreviewFileInformationPage", HeroFileInformationPage)

function var_0_0.InitUI(arg_1_0)
	arg_1_0:BindCfgUI()
	arg_1_0:AddBtnListeners()

	arg_1_0.curHeroID_ = 0
	arg_1_0.curRecordID_ = 0
	arg_1_0.relationNetController_ = arg_1_0.rightControllerEx_:GetController("relationNet")
	arg_1_0.lockController_ = arg_1_0.controller_:GetController("lock")
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
		end
	end)
end

function var_0_0.Show(arg_5_0, arg_5_1, arg_5_2)
	if arg_5_2 ~= arg_5_0.curHeroID_ then
		local var_5_0 = HeroCfg[arg_5_2]

		arg_5_0.heroCfg_ = var_5_0
		arg_5_0.lableText_.text = GetI18NText(var_5_0.name)
		arg_5_0.summaryText_.text = GetI18NText(var_5_0.hero_desc)
		arg_5_0.campImg_.sprite = HeroTools.GetRaceIcon(var_5_0.race)
		arg_5_0.attackTypeImg_.sprite = HeroTools.GetHeroSkillAttributeIcon(arg_5_0.heroCfg_.id)

		arg_5_0:RefreshChargeType()

		arg_5_0.rareImg_.sprite = getSprite("Atlas/Common", "star_" .. var_5_0.rare)
		arg_5_0.rangeTypeText_.text = CharactorParamCfg[arg_5_0.heroCfg_.id].RangeType == 0 and GetTips("RANGETYPE_CLOSE") or GetTips("RANGETYPE_LONG")
		arg_5_0.lockSummaryText_.text = GetI18NText(var_5_0.hero_desc)
		arg_5_0.curHeroID_ = arg_5_2
	end

	if arg_5_1 ~= arg_5_0.curRecordID_ then
		local var_5_1 = HeroRecordCfg[arg_5_1]

		arg_5_0.nameText_.text = GetI18NText(var_5_1.name)
		arg_5_0.heightText_.text = GetI18NText(var_5_1.height)
		arg_5_0.weightText_.text = GetI18NText(var_5_1.weight)
		arg_5_0.birthdayText_.text = GetI18NText(var_5_1.birthday)
		arg_5_0.organizationText_.text = GetI18NText(var_5_1.organization)
		arg_5_0.hobbyText_.text = GetI18NText(var_5_1.like)
		arg_5_0.curRecordID_ = arg_5_1
	end

	arg_5_0.lockController_:SetSelectedState(tostring(HeroData:GetHeroData(arg_5_2).unlock ~= 1))

	arg_5_0.scroll_.enabled = false
	arg_5_0.scroll_.enabled = true

	LayoutRebuilder.ForceRebuildLayoutImmediate(arg_5_0.summaryContent_)
	arg_5_0.relationNetController_:SetSelectedState("lock")
	SetActive(arg_5_0.poltBtn_.gameObject, ObtainHeroMovieCfg[arg_5_0.curHeroID_] ~= nil)
	SetActive(arg_5_0.gameObject_, true)
end

function var_0_0.UpdateView(arg_6_0, arg_6_1, arg_6_2)
	var_0_0.super.UpdateView(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0.relationNetController_:SetSelectedState("lock")
end

function var_0_0.RefreshChargeType(arg_7_0)
	local var_7_0 = arg_7_0.heroCfg_.mechanism_type[1]

	if var_7_0 == HeroConst.HERO_CHARGE_TYPE.RAGE then
		arg_7_0.chargeTypeText_.text = GetTips("NOTE_ENERGYTYPE_1")
	elseif var_7_0 == HeroConst.HERO_CHARGE_TYPE.ENERGY then
		arg_7_0.chargeTypeText_.text = GetTips("NOTE_ENERGYTYPE_2")
	elseif var_7_0 == HeroConst.HERO_CHARGE_TYPE.TRACES then
		arg_7_0.chargeTypeText_.text = GetTips("NOTE_ENERGYTYPE_3")
	elseif var_7_0 == HeroConst.HERO_CHARGE_TYPE.DIVINE_GRACE then
		arg_7_0.chargeTypeText_.text = GetTips("NOTE_ENERGYTYPE_4")
	end
end

function var_0_0.CameraEnter(arg_8_0)
	manager.heroRaiseTrack:SetViewState(HeroRaiseTrackConst.ViewType.heroRaiseCommon, {
		1,
		0,
		1
	}, arg_8_0.displayGo_)
end

return var_0_0
