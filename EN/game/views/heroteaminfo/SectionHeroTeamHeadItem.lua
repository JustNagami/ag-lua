local var_0_0 = import("game.views.newHero.HeroLongHead")
local var_0_1 = class("SectionHeroTeamHeadItem", var_0_0)

function var_0_1.Ctor(arg_1_0, arg_1_1)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_1.transform

	local var_1_0 = arg_1_1

	arg_1_0:InitProxy()

	arg_1_0.gameObject_ = arg_1_0.realGo_
	arg_1_0.transform_ = arg_1_0.realGo_.transform

	arg_1_0:Init()

	arg_1_0.gameObject_ = var_1_0
	arg_1_0.transform_ = var_1_0.transform
end

function var_0_1.InitProxy(arg_2_0)
	arg_2_0:BindCfgUI()

	arg_2_0.sectionLockTypeController_ = arg_2_0.sectionController_:GetController("sectionLockType")
	arg_2_0.sectionTeamMarkBgStyleController_ = arg_2_0.sectionController_:GetController("sectionTeamMarkBgStyle")
	arg_2_0.sectionEnergyController_ = arg_2_0.sectionController_:GetController("sectionEnergy")
	arg_2_0.sectionLockingController_ = arg_2_0.sectionController_:GetController("sectionLocking")
	arg_2_0.sectionHPController_ = arg_2_0.sectionController_:GetController("sectionHP")
end

function var_0_1.Init(arg_3_0)
	arg_3_0:InitUI()
	arg_3_0:AddUIListener()
end

function var_0_1.SetSectionHeroData(arg_4_0, arg_4_1)
	arg_4_0.sectionHeroData_ = arg_4_1

	local var_4_0 = arg_4_0.sectionHeroData_.id
	local var_4_1 = arg_4_0.sectionHeroData_.trialID
	local var_4_2 = arg_4_0.sectionHeroData_.type
	local var_4_3 = arg_4_0.sectionHeroData_.heroViewProxy

	arg_4_0.gameObject_.name = tostring(var_4_0)

	arg_4_0:SetProxy(var_4_3)
	arg_4_0:SetHeroId(var_4_0, var_4_2, var_4_3.tempHeroList)
	arg_4_0:SetRedPointEnable(false)
	arg_4_0:RefreshSectionUI()
end

function var_0_1.RefreshSectionUI(arg_5_0)
	local var_5_0 = arg_5_0.sectionHeroData_.type

	if var_5_0 == HeroConst.HERO_DATA_TYPE.DEFAULT then
		arg_5_0:SetTrial(false)
	elseif var_5_0 == HeroConst.HERO_DATA_TYPE.TRIAL then
		arg_5_0:SetTrial(true)
	elseif var_5_0 == HeroConst.HERO_DATA_TYPE.CUSTOM then
		arg_5_0:SetTrial(true)
	elseif var_5_0 == HeroConst.HERO_DATA_TYPE.ADVANCETEST then
		arg_5_0:SetTrial(false)
	end
end

function var_0_1.SetEnergy(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0.sectionEnergyController_:SetSelectedState(arg_6_1 and "on" or "off")

	arg_6_0.sectionEnergyLabel_.text = arg_6_2
end

function var_0_1.SetTeamMarkBg(arg_7_0, arg_7_1)
	arg_7_0.sectionTeamMarkBgStyleController_:SetSelectedState(arg_7_1)
end

function var_0_1.SetTeamMark(arg_8_0, arg_8_1, arg_8_2)
	SetActive(arg_8_0.sectionTeamMarkGo_, arg_8_1)

	if arg_8_1 then
		arg_8_0.sectionTeamMarkText_.text = GetI18NText(arg_8_2)

		LayoutRebuilder.ForceRebuildLayoutImmediate(arg_8_0.sectionTeamMarkTransform_)
	end
end

function var_0_1.SetInTeamFlag(arg_9_0, arg_9_1, arg_9_2)
	SetActive(arg_9_0.sectionTeamMarkGo_, arg_9_1)

	if arg_9_1 then
		if arg_9_2 then
			arg_9_0.sectionTeamMarkText_.text = GetTips("IS_CAPTAIN")
		else
			arg_9_0.sectionTeamMarkText_.text = GetTips("IN_TEAM")
		end
	end
end

function var_0_1.SetInShowFlag(arg_10_0, arg_10_1)
	SetActive(arg_10_0.sectionTeamMarkGo_, arg_10_1)

	arg_10_0.sectionTeamMarkText_.text = GetTips("DISPLAY")
end

function var_0_1.SetHeroLock(arg_11_0, arg_11_1)
	arg_11_0:SetLocking(arg_11_1)
end

function var_0_1.SetHeroLockType(arg_12_0, arg_12_1)
	arg_12_0.sectionLockTypeController_:SetSelectedState(arg_12_1)
end

function var_0_1.SetHeroLockText(arg_13_0, arg_13_1)
	arg_13_0.sectionLockLabelText_.text = GetI18NText(arg_13_1)
end

function var_0_1.SetChallengeFlag(arg_14_0, arg_14_1)
	SetActive(arg_14_0.sectionBossChallengeGo_, arg_14_1)
end

function var_0_1.SetHp(arg_15_0, arg_15_1)
	arg_15_0.sectionHPController_:SetSelectedState(arg_15_1 and "on" or "off")
end

function var_0_1.RefreshHpValue(arg_16_0, arg_16_1)
	arg_16_0.sectionHPImg_.fillAmount = arg_16_1 / 100
	arg_16_0.sectionHPText_.text = arg_16_1 .. "%"
end

function var_0_1.SetLocking(arg_17_0, arg_17_1)
	arg_17_0.sectionLockingController_:SetSelectedState(arg_17_1 and "on" or "off")
end

function var_0_1.SetTrial(arg_18_0, arg_18_1)
	arg_18_0.trialController_:SetSelectedState(tostring(arg_18_1))
end

function var_0_1.SetSoloChallengeIndex(arg_19_0, arg_19_1)
	if arg_19_1 ~= -1 then
		SetActive(arg_19_0.sectionTeamMarkGo_, false)
		SetActive(arg_19_0.sectionTeamOrderGo_, true)

		arg_19_0.sectionTeamOrderText_.text = GetTips(string.format("TEAM_%d", arg_19_1))
	else
		SetActive(arg_19_0.teamOrder_, false)
	end
end

return var_0_1
