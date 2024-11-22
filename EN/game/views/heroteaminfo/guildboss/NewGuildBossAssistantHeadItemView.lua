local var_0_0 = import("game.views.heroTeamInfo.SectionHeroTeamHeadItem")
local var_0_1 = class("NewGuildBossAssistantHeadItemView", var_0_0)

function var_0_1.InitProxy(arg_1_0)
	var_0_1.super.InitProxy(arg_1_0)

	arg_1_0.positionController_ = ControllerUtil.GetController(arg_1_0.transform_, "position")
end

function var_0_1.SetSectionHeroData(arg_2_0, arg_2_1)
	arg_2_0.assistantData_ = arg_2_1

	local var_2_0 = arg_2_0.assistantData_.assist_hero_id

	arg_2_0.gameObject_.name = tostring(var_2_0)

	arg_2_0:SetHeroData(var_2_0)
	arg_2_0:SetRedPointEnable(false)
end

function var_0_1.SetHeroId(arg_3_0, arg_3_1)
	arg_3_0:SetHeroData(arg_3_1)
end

function var_0_1.SetHeroData(arg_4_0, arg_4_1)
	arg_4_0.heroId_ = arg_4_1
	arg_4_0.trialID_ = 0
	arg_4_0.heroCfg_ = HeroCfg[arg_4_1]

	arg_4_0:UpdateView()
end

function var_0_1.UpdateView(arg_5_0)
	local var_5_0 = HeroCfg[arg_5_0.heroId_]
	local var_5_1

	if arg_5_0.assistantData_.assist_hero_skin ~= 0 then
		var_5_1 = arg_5_0.assistantData_.assist_hero_skin
	else
		var_5_1 = arg_5_0.heroId_
	end

	arg_5_0.headIcon_.sprite = HeroTools.GetHeadSprite(var_5_1)

	arg_5_0.headIcon_:SetNativeSize()

	arg_5_0.campLogo_.sprite = HeroTools.GetRaceIcon(var_5_0.race)
	arg_5_0.attackType_.sprite = HeroTools.GetHeroSkillAttributeIcon(arg_5_0.heroId_)
	arg_5_0.rareImg_.sprite = HeroTools.GetRareSprite(math.floor(arg_5_0.assistantData_.hero_rare / 100))

	arg_5_0:SetLevel(arg_5_0.assistantData_.hero_level or 1)

	arg_5_0.nickLabel_.text = GetI18NText(arg_5_0.assistantData_.nick)
	arg_5_0.fightPowerLabel_.text = arg_5_0.assistantData_.fight_capacity

	arg_5_0.positionController_:SetSelectedState(tostring(arg_5_0.assistantData_.member_post))

	if tostring(arg_5_0.assistantData_.member_post) == "1" then
		arg_5_0.clubMemberLabel_.text = GetTips("CLUB_CHAIR_MAN")
	elseif tostring(arg_5_0.assistantData_.member_post) == "2" then
		arg_5_0.clubMemberLabel_.text = GetTips("CLUB_VICE_CHAIR_MAN")
	elseif tostring(arg_5_0.assistantData_.member_post) == "3" then
		arg_5_0.clubMemberLabel_.text = GetTips("CLUB_MEMBER")
	elseif tostring(arg_5_0.assistantData_.member_post) == "4" then
		arg_5_0.clubMemberLabel_.text = GetTips("CLUB_NOVICIATE")
	end
end

function var_0_1.GetHeroId(arg_6_0)
	return arg_6_0.assistantData_.assist_hero_id
end

function var_0_1.GetOwnerId(arg_7_0)
	return arg_7_0.assistantData_.member_id
end

function var_0_1.SetSelected(arg_8_0, arg_8_1)
	SetActive(arg_8_0.sectionSelectGo_, arg_8_1 == true)
end

return var_0_1
