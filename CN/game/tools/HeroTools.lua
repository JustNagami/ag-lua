HeroSorter = import("game.tools.HeroSorter")

local var_0_0 = {}
local var_0_1 = HeroSorter.New()

function var_0_0.GetNeedPreLoadHeroId()
	local var_1_0 = {}

	if HeroData:GetHeroList() == nil then
		return var_1_0
	end

	local var_1_1 = var_0_0.Sort(HeroData:GetHeroList(), true)
	local var_1_2 = HideInfoData.GetHeroHideList()

	for iter_1_0 = 1, HeroConst.PRELOAD_HERO_NUM do
		if var_1_1[iter_1_0] and var_1_2[var_1_1[iter_1_0]] ~= true then
			var_1_0[var_1_1[iter_1_0]] = true
		end
	end

	var_1_0[PlayerData:GetPlayerInfo().poster_girl] = true

	return var_1_0
end

function var_0_0.Sort(arg_2_0, arg_2_1)
	arg_2_1 = arg_2_1 or false

	local var_2_0 = {}

	for iter_2_0, iter_2_1 in pairs(arg_2_0) do
		if type(iter_2_1) == "table" then
			if arg_2_1 then
				table.insert(var_2_0, iter_2_0)
			elseif iter_2_1.hero_unlock == 1 or iter_2_1.unlock == 1 then
				table.insert(var_2_0, iter_2_0)
			end
		end
	end

	return (var_0_1:SortWithId(var_2_0))
end

function var_0_0.SortHero(arg_3_0)
	local var_3_0 = {}

	for iter_3_0, iter_3_1 in ipairs(arg_3_0) do
		table.insert(var_3_0, iter_3_1)
	end

	return (var_0_1:SetUnlockFirst(true):SortWithId(var_3_0))
end

function var_0_0.Count(arg_4_0)
	local var_4_0 = 0
	local var_4_1 = 0

	for iter_4_0, iter_4_1 in pairs(arg_4_0) do
		if type(iter_4_1) == "table" then
			if iter_4_1.hero_unlock == 1 or iter_4_1.unlock == 1 then
				var_4_0 = var_4_0 + 1
			end

			var_4_1 = var_4_1 + 1
		end
	end

	return var_4_0, var_4_1
end

function var_0_0.GetStarCnt(arg_5_0)
	return math.floor(arg_5_0 / 100)
end

function var_0_0.GetStarCfgId(arg_6_0, arg_6_1)
	return arg_6_0 * 100 + arg_6_1
end

function var_0_0.GetNextStarAndPhase(arg_7_0, arg_7_1)
	if arg_7_0 == HeroConst.MAX_STAR then
		return arg_7_0, arg_7_1
	end

	arg_7_1 = arg_7_1 + 1

	if arg_7_1 > HeroConst.PER_STAR_PHASE then
		return arg_7_0 + 1, 0
	end

	return arg_7_0, arg_7_1
end

function var_0_0.GetCanExchangeHero()
	local var_8_0 = {}

	for iter_8_0, iter_8_1 in pairs(HeroData:GetHeroList()) do
		local var_8_1 = 0
		local var_8_2 = HeroCfg[iter_8_1.id]

		if iter_8_1.unlock == 1 then
			local var_8_3 = HeroStarCfg[iter_8_1.star].star
			local var_8_4 = HeroStarCfg[iter_8_1.star].phase
			local var_8_5 = var_0_0.GetStarCfgId(var_8_3, var_8_4)

			for iter_8_2 = table.keyof(HeroStarCfg.all, var_8_5), #HeroStarCfg.all do
				var_8_1 = var_8_1 + HeroStarCfg[HeroStarCfg.all[iter_8_2]].star_up
			end

			if var_8_1 < iter_8_1.piece then
				table.insert(var_8_0, {
					id = ItemCfg[iter_8_1.id].fragment,
					number = iter_8_1.piece - var_8_1
				})
			end
		end
	end

	return var_8_0
end

function var_0_0.GetHeroIsUnlock(arg_9_0)
	local var_9_0 = HeroData:GetHeroList()[arg_9_0]

	return var_9_0 and var_9_0.unlock ~= 0 or false
end

function var_0_0.GetHeroRecoveryNum(arg_10_0)
	local var_10_0 = HeroCfg[arg_10_0]

	return GameSetting.recovery_fragment.value[var_10_0.rare]
end

local function var_0_2(arg_11_0, arg_11_1)
	if arg_11_1 and arg_11_1 ~= 0 then
		for iter_11_0, iter_11_1 in ipairs(HeroVoiceCfg.get_id_list_by_file[arg_11_0]) do
			local var_11_0 = HeroVoiceCfg[iter_11_1]

			if var_11_0.use_skin_id == arg_11_1 then
				return var_11_0
			end
		end
	end
end

local function var_0_3(arg_12_0, arg_12_1, arg_12_2, arg_12_3, arg_12_4)
	arg_12_3 = arg_12_3 or 1

	HeroTools.StopTalk()
	manager.audio:PlayUIAudioByVoice(arg_12_2)

	local var_12_0 = var_0_2(arg_12_2, arg_12_0)
	local var_12_1

	if var_12_0 then
		var_12_1 = var_12_0.use_skin_id
	else
		var_12_1 = arg_12_1
	end

	if arg_12_3 == 1 then
		if arg_12_4 ~= nil then
			LuaForUtil.PlayVoiceWithCriLipsync(arg_12_4, string.format("vo_sys_%d", var_12_1), string.format("v_s_%d_%s", var_12_1, arg_12_2), string.format("vo_sys_%d.awb", var_12_1))
		else
			manager.audio:PlayVoice(string.format("vo_sys_%d", var_12_1), string.format("v_s_%d_%s", var_12_1, arg_12_2), string.format("vo_sys_%d.awb", var_12_1))
		end
	else
		manager.audio:PlayVoice(string.format("vo_bat_%d", var_12_1), string.format("v_b_%d_%s", var_12_1, arg_12_2), string.format("vo_bat_%d.awb", var_12_1))
	end

	manager.notify:Invoke(HERO_SOUND_PLAY, arg_12_1, arg_12_2, arg_12_3)
end

function var_0_0.PlayTalk(arg_13_0, arg_13_1, arg_13_2, arg_13_3)
	local var_13_0 = HeroData:GetHeroData(arg_13_0)
	local var_13_1 = nullable(var_13_0, "using_skin")

	var_0_3(var_13_1, arg_13_0, arg_13_1, arg_13_2, arg_13_3)
end

function var_0_0.PlayTalkBySkinID(arg_14_0, arg_14_1, arg_14_2, arg_14_3)
	local var_14_0 = SkinCfg[arg_14_0]

	var_0_3(arg_14_0, var_14_0.hero, arg_14_1, arg_14_2, arg_14_3)
end

function var_0_0.PlayVoice(arg_15_0, arg_15_1, arg_15_2)
	local var_15_0 = HeroCfg[arg_15_0]

	arg_15_2 = arg_15_2 or 1

	HeroTools.StopTalk()

	local var_15_1

	if arg_15_2 == 1 then
		var_15_1 = manager.audio:PlayVoice(string.format("vo_sys_%d", arg_15_0), string.format("v_s_%d_%s", arg_15_0, arg_15_1), string.format("vo_sys_%d.awb", arg_15_0))
	else
		var_15_1 = manager.audio:PlayVoice(string.format("vo_bat_%d", arg_15_0), string.format("v_b_%d_%s", arg_15_0, arg_15_1), string.format("vo_bat_%d.awb", arg_15_0))
	end

	manager.notify:Invoke(HERO_SOUND_PLAY, arg_15_0, arg_15_1, arg_15_2)

	return var_15_1
end

function var_0_0.PlaySectionHeroTeamVoice(arg_16_0)
	local var_16_0, var_16_1, var_16_2 = var_0_0.GetSectionHeroTeamVoiceFileName(arg_16_0)

	return manager.audio:PlayVoice(var_16_0, var_16_1, var_16_2)
end

function var_0_0.GetTalkLength(arg_17_0, arg_17_1, arg_17_2)
	arg_17_2 = arg_17_2 or 1

	if arg_17_2 == 1 then
		return manager.audio:GetVoiceLength(string.format("vo_sys_%d", arg_17_0), string.format("v_s_%d_%s", arg_17_0, arg_17_1), string.format("vo_sys_%d.awb", arg_17_0))
	else
		return manager.audio:GetVoiceLength(string.format("vo_bat_%d", arg_17_0), string.format("v_b_%d_%s", arg_17_0, arg_17_1), string.format("vo_bat_%d.awb", arg_17_0))
	end
end

function var_0_0.GetSectionHeroTeamTalkLength(arg_18_0)
	local var_18_0, var_18_1, var_18_2 = var_0_0.GetSectionHeroTeamVoiceFileName(arg_18_0)

	return manager.audio:GetVoiceLength(var_18_0, var_18_1, var_18_2)
end

function var_0_0.GetSectionHeroTeamVoiceFileName(arg_19_0)
	local var_19_0 = arg_19_0[1]
	local var_19_1 = {}

	for iter_19_0 = 2, #arg_19_0 do
		var_19_1[#var_19_1 + 1] = arg_19_0[iter_19_0]
	end

	table.sort(var_19_1, function(arg_20_0, arg_20_1)
		return arg_20_0 < arg_20_1
	end)

	local var_19_2 = string.format("vo_sys_%d", var_19_0)
	local var_19_3 = ""

	for iter_19_1, iter_19_2 in ipairs(var_19_1) do
		var_19_3 = var_19_3 .. "_" .. iter_19_2
	end

	local var_19_4 = string.format("v_s_%d_tag%s", var_19_0, var_19_3)
	local var_19_5 = string.format("vo_sys_%d.awb", var_19_0)

	return var_19_2, var_19_4, var_19_5
end

function var_0_0.StopTalk()
	manager.audio:Stop("voice")
end

function var_0_0.GetConstructHero(arg_22_0)
	if arg_22_0.skin > 0 then
		arg_22_0.using_skin = arg_22_0.skin
	else
		arg_22_0.using_skin = arg_22_0.id
	end

	return arg_22_0
end

function var_0_0.InitTransitionByCfg(arg_23_0, arg_23_1)
	local var_23_0 = {}

	arg_23_0 = type(arg_23_0) == "table" and arg_23_0 or {}
	arg_23_1 = type(arg_23_1) == "table" and arg_23_1 or {}

	for iter_23_0, iter_23_1 in pairs(arg_23_0) do
		local var_23_1 = {}
		local var_23_2 = 0

		for iter_23_2, iter_23_3 in pairs(iter_23_1) do
			local var_23_3 = arg_23_1[iter_23_0] and arg_23_1[iter_23_0][iter_23_2] or 0

			var_23_2 = var_23_2 + var_23_3

			table.insert(var_23_1, {
				skill_id = iter_23_3,
				skill_level = var_23_3
			})
		end

		var_23_0[iter_23_0] = {
			slot_id = iter_23_0,
			talent_points = var_23_2,
			skill_list = var_23_1
		}
	end

	return var_23_0
end

function var_0_0.AttributeAdd(arg_24_0, arg_24_1, arg_24_2)
	arg_24_1 = arg_24_1 or 0
	arg_24_2 = arg_24_2 or 0

	if arg_24_0 == HeroConst.SUB_MUL_ATTRIBUTE_ID then
		return HeroConst.ATTRIBUTE_PRECISION - (HeroConst.ATTRIBUTE_PRECISION - arg_24_1) * (HeroConst.ATTRIBUTE_PRECISION - arg_24_2) / HeroConst.ATTRIBUTE_PRECISION
	elseif arg_24_0 == HeroConst.SUB_MUL_INJURY_ID or arg_24_0 == HeroConst.SUB_MUL_SELF_INJURY_ID then
		return (HeroConst.ATTRIBUTE_PRECISION + arg_24_1) * (HeroConst.ATTRIBUTE_PRECISION + arg_24_2) / HeroConst.ATTRIBUTE_PRECISION
	else
		return arg_24_1 + arg_24_2
	end
end

function var_0_0.GetHeroAttribute(arg_25_0)
	local var_25_0 = {}
	local var_25_1 = arg_25_0.star
	local var_25_2 = arg_25_0.id
	local var_25_3 = HeroCfg[var_25_2]
	local var_25_4 = var_25_3.star_up_skill_template
	local var_25_5 = var_0_0.GetStageListWithStarTemplateAndStarSkillType(var_25_4, HeroConst.HERO_STAR_SKILL_TYPE.ATTRIBUTE_UP)
	local var_25_6 = var_0_0.GetStageDicWithStarTemplateAndStarSkillType(var_25_4, HeroConst.HERO_STAR_SKILL_TYPE.ATTRIBUTE_UP)

	for iter_25_0, iter_25_1 in ipairs(var_25_5) do
		if iter_25_1 <= var_25_1 then
			local var_25_7 = var_25_6[iter_25_1]
			local var_25_8 = HeroStarSkillCfg[var_25_7]

			for iter_25_2, iter_25_3 in pairs(var_25_8.params) do
				var_25_0[iter_25_3[1]] = (var_25_0[iter_25_3[1]] or 0) + iter_25_3[2]
			end
		else
			break
		end
	end

	var_25_0[HeroConst.HERO_ATTRIBUTE.CRITICAL] = (var_25_0[HeroConst.HERO_ATTRIBUTE.CRITICAL] or 0) + var_25_3.base_crit2[(arg_25_0.break_level or 0) + 1]

	local var_25_9 = HeroStarCfg[var_25_1].star

	for iter_25_4, iter_25_5 in pairs(PublicAttrCfg.all) do
		local var_25_10 = 0
		local var_25_11 = HeroConst.HERO_ATTRIBUTE_MAP[iter_25_5]

		if var_25_11 then
			if var_25_11.base then
				var_25_10 = var_25_10 + var_25_3[var_25_11.base][var_25_9]
			end

			if var_25_11.grow_fixed then
				var_25_10 = var_25_10 + (arg_25_0.level - 1) * var_25_3[var_25_11.grow_fixed][var_25_9]
			end
		end

		if var_25_0[iter_25_5] == nil then
			var_25_0[iter_25_5] = 0
		end

		var_25_0[iter_25_5] = var_25_0[iter_25_5] + var_25_10
	end

	return var_25_0
end

function var_0_0.CaculateHeroAttribute(arg_26_0, arg_26_1)
	local var_26_0 = {}
	local var_26_1 = arg_26_0.star or arg_26_0.hero_star
	local var_26_2 = arg_26_0.hero_level or arg_26_0.level or var_0_0.CheckExp(1, arg_26_0.exp) or 1
	local var_26_3 = arg_26_0.hero_id or arg_26_0.id
	local var_26_4 = HeroCfg[var_26_3]

	for iter_26_0, iter_26_1 in pairs(arg_26_1) do
		var_26_0[iter_26_0] = (var_26_0[iter_26_0] or 0) + iter_26_1
	end

	local var_26_5 = var_26_4.star_up_skill_template
	local var_26_6 = var_0_0.GetStageListWithStarTemplateAndStarSkillType(var_26_5, HeroConst.HERO_STAR_SKILL_TYPE.ATTRIBUTE_UP)
	local var_26_7 = var_0_0.GetStageDicWithStarTemplateAndStarSkillType(var_26_5, HeroConst.HERO_STAR_SKILL_TYPE.ATTRIBUTE_UP)

	for iter_26_2, iter_26_3 in ipairs(var_26_6) do
		if iter_26_3 <= var_26_1 then
			local var_26_8 = var_26_7[iter_26_3]
			local var_26_9 = HeroStarSkillCfg[var_26_8]

			for iter_26_4, iter_26_5 in pairs(var_26_9.params) do
				var_26_0[iter_26_5[1]] = (var_26_0[iter_26_5[1]] or 0) + iter_26_5[2]
			end
		else
			break
		end
	end

	var_26_0[HeroConst.HERO_ATTRIBUTE.CRITICAL] = (var_26_0[HeroConst.HERO_ATTRIBUTE.CRITICAL] or 0) + var_26_4.base_crit2[(arg_26_0.break_level or 0) + 1]

	local var_26_10 = {}
	local var_26_11 = arg_26_0:GetWeaponInfo()
	local var_26_12 = arg_26_0:GetServantInfo()

	if var_26_11 then
		local var_26_13

		var_26_10[1], var_26_13 = WeaponTools.WeaponAtk(var_26_11.level, var_26_11.breakthrough), HeroCfg[var_26_3].weapon_break_attribute[var_26_11.breakthrough + 1]
		var_26_10[var_26_13[1]] = var_26_13[2]

		if var_26_12.id ~= 0 then
			local var_26_14 = WeaponServantCfg[var_26_12.id].attrib_addition
			local var_26_15 = WeaponServantCfg[var_26_12.id].attribute

			var_26_10[1] = var_26_10[1] + var_26_10[1] * var_26_14 / 100
			var_26_10[var_26_15[1]] = var_26_10[var_26_15[1]] + var_26_15[2]
		end

		for iter_26_6, iter_26_7 in pairs(var_26_10) do
			if not var_26_0[iter_26_6] then
				var_26_0[iter_26_6] = iter_26_7
			end

			var_26_0[iter_26_6] = var_26_0[iter_26_6] + iter_26_7
		end
	end

	local var_26_16 = HeroStarCfg[var_26_1].star

	for iter_26_8, iter_26_9 in pairs(PublicAttrCfg.all) do
		local var_26_17 = 0
		local var_26_18 = HeroConst.HERO_ATTRIBUTE_MAP[iter_26_9]

		if var_26_18 then
			if var_26_18.base then
				var_26_17 = var_26_17 + var_26_4[var_26_18.base][var_26_16]
			end

			if var_26_18.grow_fixed then
				var_26_17 = var_26_17 + (var_26_2 - 1) * var_26_4[var_26_18.grow_fixed][var_26_16]
			end
		end

		if var_26_0[iter_26_9] == nil then
			var_26_0[iter_26_9] = 0
		end

		var_26_0[iter_26_9] = var_26_0[iter_26_9] + var_26_17
	end

	return var_26_0
end

function var_0_0.CalFinalAttribute(arg_27_0)
	for iter_27_0, iter_27_1 in pairs(HeroConst.HERO_ATTRIBUTE_MAP) do
		if iter_27_1.ratio and arg_27_0[iter_27_0] then
			arg_27_0[iter_27_0] = arg_27_0[iter_27_0] * (1 + (arg_27_0[iter_27_1.ratio] / GameSetting.hp_ratio_percent.value[1] or 1))
		end
	end

	for iter_27_2, iter_27_3 in ipairs(arg_27_0) do
		local var_27_0 = PublicAttrCfg[iter_27_2]

		if var_27_0.percent and var_27_0.percent == 1 then
			arg_27_0[iter_27_2] = arg_27_0[iter_27_2]
		else
			arg_27_0[iter_27_2] = math.floor(arg_27_0[iter_27_2])
		end
	end
end

function var_0_0.Format(arg_28_0, arg_28_1)
	local var_28_0 = {}

	for iter_28_0, iter_28_1 in ipairs(arg_28_0) do
		var_28_0[iter_28_0] = {}

		for iter_28_2, iter_28_3 in ipairs(arg_28_1) do
			var_28_0[iter_28_0][iter_28_3] = iter_28_1[iter_28_3]
		end
	end

	return var_28_0
end

function var_0_0.CheckBlankTable(arg_29_0)
	local var_29_0 = true

	for iter_29_0, iter_29_1 in pairs(arg_29_0 or {}) do
		var_29_0 = false

		break
	end

	return var_29_0
end

function var_0_0.GetEquipMap(arg_30_0)
	local var_30_0 = {}

	for iter_30_0, iter_30_1 in pairs(arg_30_0) do
		if type(iter_30_1) == "table" then
			for iter_30_2, iter_30_3 in pairs(iter_30_1.equip) do
				var_30_0[iter_30_3.equip_id] = iter_30_0
			end
		end
	end

	return var_30_0
end

function var_0_0.GetHeroEquipS(arg_31_0)
	local var_31_0 = HeroData:GetHeroData(arg_31_0)

	return deepClone(var_31_0.equip)
end

function var_0_0.CheckExp(arg_32_0, arg_32_1)
	local var_32_0 = GameLevelSetting[arg_32_0]
	local var_32_1 = GameLevelSetting[arg_32_0 + 1]

	if var_32_0 == nil or var_32_1 == nil then
		return arg_32_0
	end

	local var_32_2 = var_32_0.hero_level_exp1

	if var_32_2 <= arg_32_1 then
		return var_0_0.CheckExp(arg_32_0 + 1, arg_32_1 - var_32_2)
	else
		return arg_32_0
	end
end

function var_0_0.GetUnlockSkill(arg_33_0)
	local var_33_0 = {}
	local var_33_1 = HeroData:GetHeroList()[arg_33_0].skill

	table.insert(var_33_0, {
		lv = 1,
		id = arg_33_0,
		type = HeroConst.SKILL_TYPE.ATTACK
	})

	local var_33_2 = #var_33_1

	for iter_33_0 = 1, var_33_2 do
		local var_33_3 = {
			id = var_33_1[iter_33_0].skill_id,
			lv = var_33_1[iter_33_0].lv or 0,
			type = HeroConst.SKILL_TYPE.SKILL
		}

		table.insert(var_33_0, var_33_3)
	end

	return var_33_0
end

function var_0_0.GetExSkillId(arg_34_0)
	return arg_34_0 * 1000 + 209
end

function var_0_0.GetTotalSkillLv(arg_35_0, arg_35_1)
	return var_0_0.GetSkillLv(arg_35_0, arg_35_1) + var_0_0.GetHeroSkillAddLevel(HeroData:GetHeroData(arg_35_0), arg_35_1)
end

function var_0_0.GetSkillLv(arg_36_0, arg_36_1)
	local var_36_0
	local var_36_1 = HeroData:GetHeroData(arg_36_0)

	for iter_36_0, iter_36_1 in ipairs(var_36_1.skill) do
		if iter_36_1.skill_id == arg_36_1 then
			return iter_36_1.skill_level
		end
	end

	return 0
end

function var_0_0.GetSkillAttrLv(arg_37_0, arg_37_1)
	local var_37_0
	local var_37_1 = HeroData:GetHeroData(arg_37_0)

	for iter_37_0, iter_37_1 in ipairs(var_37_1.skillAttrList or {}) do
		if iter_37_1.index == arg_37_1 then
			return iter_37_1.level
		end
	end

	return 0
end

function var_0_0.GetIsCanSkillUpNew(arg_38_0, arg_38_1)
	local var_38_0 = HeroData:GetHeroData(arg_38_0)

	for iter_38_0, iter_38_1 in ipairs(var_38_0.skill) do
		if SkillTools.GetIsCanUpNew(iter_38_1.skill_id, iter_38_1.skill_level, arg_38_1) then
			return true
		end
	end

	return false
end

function var_0_0.GetHeroSkillInfo(arg_39_0, arg_39_1)
	local var_39_0 = {}
	local var_39_1 = HeroData:GetHeroData(arg_39_0)

	for iter_39_0, iter_39_1 in ipairs(var_39_1.skill) do
		var_39_0[iter_39_1.skill_id] = iter_39_1.skill_level
	end

	local var_39_2 = {}

	for iter_39_2, iter_39_3 in ipairs(HeroCfg[arg_39_0].skills) do
		local var_39_3 = var_0_0.GetHeroSkillAddLevel(var_39_1, iter_39_3)

		if SkillTools.GetIsDodgeSkill(iter_39_3) then
			var_39_3 = 0
		end

		table.insert(var_39_2, {
			id = iter_39_3,
			heroId = arg_39_0,
			lv = var_39_0[iter_39_3],
			isCanUp = SkillTools.GetIsCanUp(iter_39_3, var_39_0[iter_39_3]),
			addSkillLv = var_39_3
		})
	end

	if arg_39_1 == true then
		for iter_39_4, iter_39_5 in ipairs(var_39_2) do
			iter_39_5.lv = 1
			iter_39_5.isCanUp = false
			iter_39_5.addSkillLv = 0
		end
	end

	return var_39_2
end

function var_0_0.GetHeroSkillAddLevel(arg_40_0, arg_40_1)
	local var_40_0 = arg_40_0.id or arg_40_0.hero_id
	local var_40_1 = HeroCfg[var_40_0]
	local var_40_2 = table.indexof(var_40_1.skills, arg_40_1)

	if var_40_2 then
		local var_40_3 = arg_40_0.star
		local var_40_4 = {}
		local var_40_5 = var_40_1.star_up_skill_template
		local var_40_6 = var_0_0.GetStageListWithStarTemplateAndStarSkillType(var_40_5, HeroConst.HERO_STAR_SKILL_TYPE.SKILL_UP)
		local var_40_7 = var_0_0.GetStageDicWithStarTemplateAndStarSkillType(var_40_5, HeroConst.HERO_STAR_SKILL_TYPE.SKILL_UP)

		for iter_40_0, iter_40_1 in ipairs(var_40_6) do
			if iter_40_1 <= var_40_3 then
				local var_40_8 = var_40_7[iter_40_1]
				local var_40_9 = HeroStarSkillCfg[var_40_8]

				for iter_40_2, iter_40_3 in pairs(var_40_9.params) do
					var_40_4[iter_40_3[1]] = (var_40_4[iter_40_3[1]] or 0) + iter_40_3[2]
				end
			else
				break
			end
		end

		return var_40_4[var_40_2] or 0
	end

	return 0
end

function var_0_0.CountTransitionTotalSkill(arg_41_0, arg_41_1)
	local var_41_0 = HeroTools.GetHeroEquipSkillAddLevel(arg_41_0)
	local var_41_1 = arg_41_0.transition
	local var_41_2 = {}
	local var_41_3 = {}

	for iter_41_0, iter_41_1 in ipairs(arg_41_1 or {}) do
		if iter_41_1.prefab_id ~= 0 then
			var_41_3[EquipCfg[iter_41_1.prefab_id].pos] = iter_41_1
		end
	end

	local var_41_4 = GameSetting.exclusive_open_need.value[1]

	for iter_41_2, iter_41_3 in ipairs(var_41_1) do
		local var_41_5 = var_41_3[iter_41_3.slot_id]

		if var_41_5 and var_41_4 <= var_41_5:GetLevel() then
			local var_41_6 = iter_41_3.skill_list

			for iter_41_4, iter_41_5 in ipairs(var_41_6) do
				local var_41_7 = iter_41_5.skill_id

				if not var_41_2[var_41_7] then
					var_41_2[var_41_7] = 0
				end

				var_41_2[var_41_7] = var_41_2[var_41_7] + iter_41_5.skill_level
			end
		end
	end

	local var_41_8 = 0

	for iter_41_6, iter_41_7 in pairs(var_41_2) do
		var_41_8 = var_41_8 + iter_41_7 + var_41_0
	end

	return var_41_8
end

function var_0_0.CalTransitionSkillAttribute(arg_42_0, arg_42_1)
	local var_42_0 = {}
	local var_42_1 = {}
	local var_42_2 = {}
	local var_42_3 = arg_42_0.transition
	local var_42_4 = HeroTools.GetHeroEquipSkillAddLevel(arg_42_0)
	local var_42_5 = GameSetting.exclusive_skill_level_up_type.value
	local var_42_6 = {}

	for iter_42_0, iter_42_1 in ipairs(arg_42_1) do
		if iter_42_1.prefab_id ~= 0 then
			var_42_6[EquipCfg[iter_42_1.prefab_id].pos] = iter_42_1
		end
	end

	local var_42_7 = {}
	local var_42_8 = {}
	local var_42_9 = {}

	for iter_42_2, iter_42_3 in pairs(var_42_3) do
		local var_42_10 = var_42_6[iter_42_2]

		if var_42_10 and EquipTools.CountEquipLevel(var_42_10) >= GameSetting.exclusive_open_need.value[1] then
			for iter_42_4, iter_42_5 in ipairs(iter_42_3.skill_list) do
				local var_42_11 = iter_42_5.skill_id

				if EquipSkillCfg[var_42_11].equip_effect_id == 0 then
					local var_42_12 = false

					for iter_42_6, iter_42_7 in ipairs(var_42_5) do
						if var_42_11 == iter_42_7[1] then
							var_42_12 = iter_42_7[2]

							break
						end
					end

					if var_42_12 then
						var_42_9[var_42_11] = (var_42_9[var_42_11] or 0) + iter_42_5.skill_level
					else
						var_42_7[var_42_11] = (var_42_7[var_42_11] or 0) + iter_42_5.skill_level
					end
				else
					var_42_8[var_42_11] = (var_42_8[var_42_11] or 0) + iter_42_5.skill_level
				end
			end
		end
	end

	for iter_42_8, iter_42_9 in pairs(var_42_7) do
		local var_42_13 = EquipSkillCfg[iter_42_8]
		local var_42_14 = var_42_13.attribute
		local var_42_15 = var_42_13.upgrade * (iter_42_9 + var_42_4)

		var_42_0[var_42_14] = (var_42_0[var_42_14] or 0) + var_42_15
	end

	for iter_42_10, iter_42_11 in pairs(var_42_8) do
		local var_42_16 = EquipSkillCfg[iter_42_10]
		local var_42_17 = iter_42_11 + var_42_4

		var_42_1[iter_42_10] = (var_42_1[iter_42_10] or 0) + var_42_17
	end

	local var_42_18 = HeroCfg[arg_42_0.id].skills

	for iter_42_12, iter_42_13 in pairs(var_42_9) do
		local var_42_19 = EquipSkillCfg[iter_42_12]
		local var_42_20 = iter_42_13 + var_42_4

		for iter_42_14, iter_42_15 in ipairs(var_42_5) do
			if iter_42_12 == iter_42_15[1] then
				var_42_2[var_42_18[iter_42_15[2]]] = var_42_19.upgrade * var_42_20

				break
			end
		end
	end

	return var_42_0, var_42_1, var_42_2
end

function var_0_0.GetHeroEquipSkillAddLevel(arg_43_0)
	local var_43_0 = arg_43_0.id or arg_43_0.hero_id
	local var_43_1 = HeroCfg[var_43_0]
	local var_43_2 = arg_43_0.star
	local var_43_3 = var_43_1.star_up_skill_template

	if var_43_2 >= var_0_0.GetStageListWithStarTemplateAndStarSkillType(var_43_3, HeroConst.HERO_STAR_SKILL_TYPE.EQUIP_UP)[1] then
		return 1
	end

	return 0
end

function var_0_0.GetHeroWeaponAddLevel(arg_44_0)
	local var_44_0 = arg_44_0.id
	local var_44_1 = HeroCfg[var_44_0]
	local var_44_2 = arg_44_0.star
	local var_44_3 = var_44_1.star_up_skill_template

	if var_44_2 >= var_0_0.GetStageListWithStarTemplateAndStarSkillType(var_44_3, HeroConst.HERO_STAR_SKILL_TYPE.WEAPON_UP)[1] then
		return 2
	end

	return 0
end

function var_0_0.GetIsSuitNumCut(arg_45_0)
	if not arg_45_0 then
		return false
	end

	local var_45_0 = arg_45_0.id or arg_45_0.hero_id
	local var_45_1 = HeroCfg[var_45_0]
	local var_45_2 = arg_45_0.star or arg_45_0.hero_star

	if var_45_2 and HeroStarCfg[var_45_2] then
		local var_45_3 = var_45_1.star_up_skill_template

		if var_45_2 >= var_0_0.GetStageListWithStarTemplateAndStarSkillType(var_45_3, HeroConst.HERO_STAR_SKILL_TYPE.EQUIP_SUIT)[1] then
			return true
		end
	end

	return false
end

function var_0_0.CountHeroTotalSkilllv(arg_46_0)
	local var_46_0 = HeroData:GetHeroList()[arg_46_0]
	local var_46_1 = 0

	for iter_46_0, iter_46_1 in ipairs(var_46_0.skill) do
		local var_46_2 = var_0_0.GetHeroSkillAddLevel(var_46_0, iter_46_1.skill_id)

		var_46_1 = var_46_1 + iter_46_1.skill_level + var_46_2
	end

	return var_46_1
end

function var_0_0.GetEquipSuitEffect(arg_47_0)
	local var_47_0 = {}

	for iter_47_0, iter_47_1 in ipairs(arg_47_0) do
		if iter_47_1.equip_id ~= 0 then
			local var_47_1 = EquipData:GetEquipList()[iter_47_1.equip_id].prefab_id
			local var_47_2 = EquipCfg[var_47_1].type

			var_47_0[var_47_2] = (var_47_0[var_47_2] or 0) + 1
		end
	end

	local var_47_3 = {}
	local var_47_4 = 0

	for iter_47_2, iter_47_3 in pairs(var_47_0) do
		local var_47_5 = EquipSuitCfg.get_id_list_by_suit[iter_47_2]

		for iter_47_4, iter_47_5 in ipairs(var_47_5) do
			local var_47_6 = EquipSuitCfg[iter_47_5]

			if iter_47_3 >= var_47_6.need then
				if var_47_3[var_47_6.suit] == nil then
					var_47_3[var_47_6.suit] = {}
					var_47_4 = var_47_4 + 1
				end

				table.insert(var_47_3[var_47_6.suit], var_47_6)
			end
		end
	end

	return var_47_3, var_47_4
end

function var_0_0.GetIsCanSkillUp(arg_48_0)
	local var_48_0 = HeroCfg[arg_48_0.id]

	if arg_48_0.unlock == 0 then
		return false
	end

	local var_48_1 = {}

	for iter_48_0, iter_48_1 in ipairs(arg_48_0.skill) do
		var_48_1[iter_48_1.skill_id] = iter_48_1.skill_level
	end

	for iter_48_2, iter_48_3 in ipairs(var_48_0.skills) do
		if SkillTools.GetIsCanUp(iter_48_3, var_48_1[iter_48_3]) then
			return true
		end
	end

	return false
end

function var_0_0.GetIsCanUpStar(arg_49_0)
	local var_49_0 = HeroCfg[arg_49_0.id]

	if arg_49_0.unlock == 0 then
		if GameSetting.unlock_hero_need.value[var_49_0.rare] <= arg_49_0.piece then
			return true
		end
	else
		local var_49_1 = arg_49_0.star

		if var_49_1 >= HeroConst.MAX_STAR_UP_ID then
			return false
		end

		local var_49_2 = ItemTools.getItemNum(CurrencyConst.CURRENCY_TYPE_GOLD)
		local var_49_3 = HeroStarCfg[var_49_1].star_up
		local var_49_4 = HeroStarCfg[var_49_1].gold_cost

		if var_49_3 <= arg_49_0.piece and var_49_4 <= var_49_2 then
			return true
		end
	end

	return false
end

function var_0_0.SortByChat(arg_50_0, arg_50_1, arg_50_2)
	local var_50_0 = {}
	local var_50_1 = {}

	for iter_50_0, iter_50_1 in pairs(arg_50_0) do
		if type(iter_50_1) == "table" and iter_50_1.unlock == 1 then
			var_50_1[iter_50_0] = iter_50_1.chat_unread

			table.insert(var_50_0, iter_50_0)
		end
	end

	table.sort(var_50_0)
	table.sort(var_50_0, function(arg_51_0, arg_51_1)
		return var_50_1[arg_51_0] > var_50_1[arg_51_1]
	end)

	if var_0_0.lastList then
		local var_50_2 = arg_50_2 - arg_50_1
		local var_50_3 = var_0_0.lastList[var_50_2]

		if var_50_3 and var_50_3 ~= var_50_0[var_50_2] then
			local var_50_4 = table.indexof(var_50_0, var_50_3)

			if var_50_4 then
				table.remove(var_50_0, var_50_4)
				table.insert(var_50_0, var_50_2, var_50_3)
			end
		end
	end

	var_0_0.lastList = var_50_0

	return var_50_0
end

function var_0_0.SortByChat2(arg_52_0)
	if var_0_0.chatList then
		return var_0_0.chatList
	end

	local var_52_0 = {}
	local var_52_1 = {}

	for iter_52_0, iter_52_1 in pairs(arg_52_0) do
		if type(iter_52_1) == "table" and iter_52_1.unlock == 1 then
			var_52_1[iter_52_0] = iter_52_1.chat_unread

			table.insert(var_52_0, iter_52_0)
		end
	end

	table.sort(var_52_0)
	table.sort(var_52_0, function(arg_53_0, arg_53_1)
		return var_52_1[arg_53_0] > var_52_1[arg_53_1]
	end)

	var_0_0.chatList = var_52_0

	return var_52_0
end

function var_0_0.HeroUsingSkinInfo(arg_54_0)
	local var_54_0 = arg_54_0
	local var_54_1 = HeroData:GetHeroData(arg_54_0)
	local var_54_2 = var_54_1 and var_54_1.using_skin or 0

	if var_54_2 == 0 then
		var_54_2 = var_54_0
	end

	return SkinCfg[var_54_2]
end

function var_0_0.SetHeroModelWeaponActivity(arg_55_0, arg_55_1)
	LuaForUtil.ShowWeapon(arg_55_0, arg_55_1)
end

function var_0_0.HeroUnlockSkinS(arg_56_0)
	local var_56_0 = HeroData:GetHeroData(arg_56_0)
	local var_56_1 = {}

	for iter_56_0, iter_56_1 in ipairs(var_56_0.unlocked_skin) do
		table.insert(var_56_1, iter_56_1.skin_id)
	end

	table.insert(var_56_1, arg_56_0)

	return var_56_1
end

function var_0_0.CanChangeSkin(arg_57_0)
	if var_0_0.GetSkinIsUnlock(arg_57_0) then
		return false
	end

	local var_57_0 = var_0_0.GetSkinChangeItem(arg_57_0)

	if not var_57_0 then
		return false
	end

	if ItemTools.getItemNum(var_57_0) > 0 then
		return true
	end
end

function var_0_0.GetSkinIsUnlock(arg_58_0)
	local var_58_0 = SkinCfg[arg_58_0].hero
	local var_58_1 = HeroTools.HeroUnlockSkinS(var_58_0)

	for iter_58_0, iter_58_1 in ipairs(var_58_1) do
		if iter_58_1 == arg_58_0 then
			return true
		end
	end

	return false
end

function var_0_0.GetSkinIsCanUnLock(arg_59_0)
	if SkinCfg[arg_59_0].unlock_id_list[1] then
		return true
	end

	return false
end

function var_0_0.GetHasOwnedSkin(arg_60_0)
	local var_60_0 = SkinCfg[arg_60_0].hero
	local var_60_1 = HeroData:GetHeroData(var_60_0)
	local var_60_2 = {}

	if arg_60_0 == var_60_0 then
		return true
	end

	for iter_60_0, iter_60_1 in ipairs(var_60_1.unlocked_skin) do
		if iter_60_1.skin_id == arg_60_0 and iter_60_1.time == 0 then
			return true
		end
	end

	return false
end

function var_0_0.GetIsLimitTimeSkin(arg_61_0)
	local var_61_0 = SkinCfg[arg_61_0].hero
	local var_61_1 = HeroData:GetHeroData(var_61_0)
	local var_61_2 = {}

	for iter_61_0, iter_61_1 in ipairs(var_61_1.unlocked_skin) do
		if iter_61_1.skin_id == arg_61_0 and iter_61_1.time ~= 0 then
			return true
		end
	end

	return false
end

function var_0_0.GetSkinChangeItem(arg_62_0)
	return SkinCfg[arg_62_0].change_item
end

function var_0_0.GetHeadSprite(arg_63_0)
	return getSpriteViaConfig("HeroLittleIcon", arg_63_0)
end

function var_0_0.GetSmallHeadSprite(arg_64_0)
	return getSpriteViaConfig("HeroItemshead", arg_64_0)
end

function var_0_0.GetHeroAttackRangeIcon(arg_65_0)
	local var_65_0

	for iter_65_0, iter_65_1 in ipairs(GameDisplayCfg.hero_range_type_tag.value) do
		if iter_65_1[1] == CharactorParamCfg[arg_65_0].RangeType then
			var_65_0 = iter_65_1[2]

			break
		end
	end

	return getSprite("Atlas/Hero_arrtAtlas", var_65_0)
end

function var_0_0.GetHeroRaceIcon(arg_66_0)
	local var_66_0 = HeroCfg[arg_66_0].race

	return var_0_0.GetRaceIcon(var_66_0)
end

function var_0_0.GetRaceIcon(arg_67_0)
	local var_67_0

	for iter_67_0, iter_67_1 in ipairs(GameDisplayCfg.hero_race_type_tag.value) do
		if iter_67_1[1] == arg_67_0 then
			var_67_0 = iter_67_1[2]
		end
	end

	return getSprite("Atlas/CampItemAtlas", var_67_0)
end

function var_0_0.GetHeroNormalAtkAttributeIdList()
	local var_68_0 = {}

	for iter_68_0, iter_68_1 in pairs(HeroConst.HERO_ATTACK_TYPE) do
		if var_0_0.IsNormalAtkAttributeId(iter_68_1) then
			table.insert(var_68_0, iter_68_1)
		end
	end

	return var_68_0
end

function var_0_0.IsNormalAtkAttributeId(arg_69_0)
	return arg_69_0 ~= HeroConst.HERO_ATTACK_TYPE.MIX and arg_69_0 ~= HeroConst.HERO_ATTACK_TYPE.RANDOM and arg_69_0 ~= HeroConst.HERO_ATTACK_TYPE.ALL
end

function var_0_0.GetHeroBattleAtkAttributeId(arg_70_0)
	if not HeroCfg[arg_70_0] then
		Debug.LogError("不存在该英雄：" .. arg_70_0)

		return nil
	end

	local var_70_0 = HeroCfg[arg_70_0].ATK_attribute

	if type(var_70_0) == "table" then
		local var_70_1 = var_70_0[1]

		if var_70_1 == HeroConst.HERO_ATTACK_TYPE.RANDOM then
			local var_70_2 = HeroTools.GetHeroNormalAtkAttributeIdList()

			return var_70_2[math.random(1, #var_70_2)]
		else
			return var_70_1
		end
	else
		Debug.LogError("不存在该英雄的攻击属性：" .. arg_70_0)

		return nil
	end
end

function var_0_0.IsRandomAtkAttribute(arg_71_0)
	local var_71_0 = HeroCfg[arg_71_0]

	if type(var_71_0.ATK_attribute) == "table" then
		for iter_71_0, iter_71_1 in ipairs(var_71_0.ATK_attribute) do
			if iter_71_1 == HeroConst.HERO_ATTACK_TYPE.RANDOM then
				return true
			end
		end
	end

	return false
end

function var_0_0.GetHeroSkillAttributeIcon(arg_72_0, arg_72_1)
	if type(HeroCfg[arg_72_0].ATK_attribute) ~= "table" or not HeroCfg[arg_72_0].ATK_attribute[1] then
		print(string.format("%s角色表未配置ATK_attribute", arg_72_0))

		return nil
	end

	return var_0_0.GetSkillAttributeIcon(HeroCfg[arg_72_0].ATK_attribute[1], arg_72_1)
end

function var_0_0.GetSkillAttributeIcon(arg_73_0, arg_73_1)
	if not arg_73_0 then
		return getSprite("Atlas/Hero_arrtAtlas", "icon_none")
	end

	if not SkillElementCfg[arg_73_0] then
		Debug.LogError("SkillElementCfg不存在该属性: " .. tostring(arg_73_0))

		return nil
	end

	local var_73_0

	if arg_73_1 then
		var_73_0 = SkillElementCfg[arg_73_0].icon_white
	else
		var_73_0 = SkillElementCfg[arg_73_0].icon
	end

	return getSprite("Atlas/Hero_arrtAtlas", var_73_0)
end

function var_0_0.GetSkillAttributeName(arg_74_0)
	if SkillElementCfg[arg_74_0] then
		return GetI18NText(SkillElementCfg[arg_74_0].name)
	end

	Debug.LogError("SkillElementCfg不存在该属性: " .. tostring(arg_74_0))
end

function var_0_0.GetHeroSkillMechanismIcon(arg_75_0)
	local var_75_0

	for iter_75_0, iter_75_1 in ipairs(GameDisplayCfg.hero_mechanism_type_tag.value) do
		if iter_75_1[1] == HeroCfg[arg_75_0].mechanism_type[1] then
			var_75_0 = iter_75_1[2]

			break
		end
	end

	return getSprite("Atlas/Hero_arrtAtlas", var_75_0)
end

function var_0_0.GetHeroRareSprite(arg_76_0)
	return var_0_0.GetRareSprite(HeroCfg[arg_76_0].rare)
end

function var_0_0.GetRareSprite(arg_77_0)
	return getSprite("Atlas/SystemHeroGradeAtlas", string.format("star_%s", arg_77_0))
end

function var_0_0.GetHeroCurrentMaxLevel(arg_78_0)
	local var_78_0 = arg_78_0.break_level or 0
	local var_78_1 = HeroCfg[arg_78_0.id]

	return HeroTools.GetHeroBreakConfig(var_78_1.race, var_78_0).max_level
end

function var_0_0.GetHeroMaxLevel(arg_79_0)
	local var_79_0 = HeroCfg[arg_79_0.id]

	return HeroBreakCfg[HeroBreakCfg.get_id_list_by_race[var_79_0.race][#HeroBreakCfg.get_id_list_by_race[var_79_0.race]]].max_level
end

function var_0_0.GetHeroBreakConfig(arg_80_0, arg_80_1)
	for iter_80_0, iter_80_1 in ipairs(HeroBreakCfg.all) do
		if HeroBreakCfg[iter_80_1].race == arg_80_0 and HeroBreakCfg[iter_80_1].break_times == arg_80_1 then
			return HeroBreakCfg[iter_80_1]
		end
	end

	error(string.format("在hero_break.csv中找不到race=%d,breakLevel=%d的项", arg_80_0, arg_80_1))

	return nil
end

function var_0_0.GetHeroServantInfo(arg_81_0)
	local var_81_0 = WeaponServantData.GetWeaponServantList()
	local var_81_1 = HeroData:GetHeroList()[arg_81_0].servant_uid

	if var_81_1 == 0 then
		return nil
	end

	return var_81_0[var_81_1]
end

function var_0_0.GetHeroSpecServant(arg_82_0)
	return HeroCfg[arg_82_0].spec_servant
end

function var_0_0.GetHeroProficiency(arg_83_0)
	local var_83_0 = HeroData:GetHeroData(arg_83_0).clear_times

	return (math.min(var_83_0, GameSetting.mastery_level_max.value[1]))
end

function var_0_0.CanBreakHero(arg_84_0)
	local var_84_0 = HeroCfg[arg_84_0]
	local var_84_1 = HeroData:GetHeroData(arg_84_0)

	if var_84_1.unlock and var_84_1.level < HeroConst.HERO_LV_MAX and var_84_1.level >= HeroTools.GetHeroCurrentMaxLevel(var_84_1) then
		-- block empty
	else
		return false
	end

	local var_84_2 = HeroTools.GetHeroBreakConfig(var_84_0.race, var_84_1.break_level or 0)

	if PlayerData:GetPlayerInfo().userLevel < var_84_2.user_level then
		return false
	end

	local var_84_3 = #var_84_2.cost

	for iter_84_0 = 1, var_84_3 do
		local var_84_4 = var_84_2.cost[iter_84_0]

		if not (ItemTools.getItemNum(var_84_4[1]) >= var_84_4[2]) then
			return false
		end
	end

	if ItemTools.getItemNum(CurrencyConst.CURRENCY_TYPE_GOLD) < var_84_2.cost_gold then
		return false
	end

	return true
end

function var_0_0.GetHeroOntologyID(arg_85_0)
	for iter_85_0, iter_85_1 in ipairs(HeroRecordCfg.all) do
		local var_85_0 = HeroRecordCfg[iter_85_1]

		if arg_85_0 == iter_85_1 then
			return iter_85_1, true
		end

		for iter_85_2, iter_85_3 in ipairs(var_85_0.hero_id) do
			if arg_85_0 == iter_85_3 then
				return iter_85_1, false
			end
		end
	end
end

function var_0_0.GetHeroTeachVideo(arg_86_0)
	local var_86_0 = HeroCfg[arg_86_0]

	if HeroData:GetHeroData(arg_86_0).unlock == 0 then
		return nil
	end

	local var_86_1 = var_86_0.study_stage[1]

	if var_86_1 then
		local var_86_2 = TeachStageExInfoCfg[var_86_1]

		if var_86_2 and var_86_2.video_url then
			return var_86_2.video_url
		end
	end
end

function var_0_0.IsSkinUnlock(arg_87_0)
	local var_87_0 = SkinCfg[arg_87_0].hero
	local var_87_1 = HeroTools.HeroUnlockSkinS(var_87_0)

	for iter_87_0, iter_87_1 in ipairs(var_87_1) do
		if iter_87_1 == arg_87_0 then
			return true
		end
	end

	return false
end

function var_0_0.GetShopIdBySkinId(arg_88_0)
	local var_88_0 = SkinIDToGoodIDCfg[arg_88_0]

	if var_88_0 == nil then
		return 0
	end

	for iter_88_0, iter_88_1 in ipairs(var_88_0.goods_id) do
		local var_88_1 = getShopCfg(iter_88_1)

		if var_88_1 and var_88_1.shop_refresh == 3 then
			return iter_88_1
		end
	end

	return 0
end

function var_0_0.IsSkinOnlySellDLC(arg_89_0)
	return var_0_0.GetShopIdBySkinId(arg_89_0) < 0 and true or false
end

function var_0_0.IsSkinOutOfDate(arg_90_0)
	local var_90_0 = var_0_0.GetShopIdBySkinId(arg_90_0)

	if var_90_0 and var_90_0 > 0 then
		local var_90_1 = getShopCfg(var_90_0).shop_id

		return ShopData.IsGoodOutOfDate(var_90_0, var_90_1)
	else
		return true
	end
end

function var_0_0.CanBeDraw(arg_91_0, arg_91_1)
	local var_91_0 = ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.DRAW] or {}

	for iter_91_0, iter_91_1 in ipairs(var_91_0) do
		if ActivityData:GetActivityIsOpen(iter_91_1) then
			local var_91_1 = ActivityDrawPoolCfg[iter_91_1]

			if var_91_1 then
				for iter_91_2, iter_91_3 in ipairs(var_91_1.config_list) do
					if arg_91_1 == iter_91_3 then
						return true
					end
				end
			end
		end
	end

	return false
end

function var_0_0.GetIsHide(arg_92_0)
	return HideInfoData:GetHeroHideList()[arg_92_0] or false
end

function var_0_0.GetIsSkinHide(arg_93_0)
	return HideInfoData:GetSkinHideList()[arg_93_0] or false
end

function var_0_0.GetSkinIsCanUnlockAndGet(arg_94_0)
	if SkinCfg[arg_94_0].unlock_id_list[1] then
		for iter_94_0, iter_94_1 in pairs(SkinCfg[arg_94_0].unlock_id_list) do
			local var_94_0, var_94_1, var_94_2 = IsConditionAchieved(iter_94_1, {
				heroId = SkinCfg[arg_94_0].hero
			})

			if not var_94_0 then
				return false
			end
		end

		return true
	else
		return false
	end
end

local var_0_4 = {}
local var_0_5 = 0

local function var_0_6()
	return var_0_5 < #HeroRecordCfg.all
end

local function var_0_7(arg_96_0)
	local var_96_0 = false

	for iter_96_0 = var_0_5 + 1, #HeroRecordCfg.all do
		local var_96_1 = HeroRecordCfg.all[iter_96_0]
		local var_96_2 = HeroRecordCfg[var_96_1].hero_id

		for iter_96_1, iter_96_2 in pairs(var_96_2) do
			var_0_4[iter_96_2] = var_96_1

			if arg_96_0 == iter_96_2 then
				var_96_0 = true
			end
		end

		var_0_5 = iter_96_0

		if var_96_0 then
			return var_96_1
		end
	end

	return nil
end

local function var_0_8(arg_97_0)
	local var_97_0 = var_0_4[arg_97_0]

	if var_97_0 == nil then
		var_97_0 = var_0_7(arg_97_0)
	end

	return var_97_0
end

function var_0_0.IsSamePerson(arg_98_0, arg_98_1)
	local var_98_0 = var_0_8(arg_98_0)
	local var_98_1 = var_0_8(arg_98_1)

	return var_98_0 ~= nil and var_98_1 ~= nil and var_98_0 == var_98_1
end

function var_0_0.GetInteractionVoiceFileName(arg_99_0)
	local var_99_0 = string.find(arg_99_0, "_")

	return var_99_0 and string.sub(arg_99_0, var_99_0 + 1) or nil
end

function var_0_0.GetUnlockInteractionCfg(arg_100_0, arg_100_1, arg_100_2)
	local var_100_0 = HeroInteractionCfg[arg_100_1]
	local var_100_1 = {}

	for iter_100_0, iter_100_1 in pairs(var_100_0) do
		if string.find(iter_100_0, "_talk") then
			local var_100_2 = var_100_0[iter_100_0]
			local var_100_3 = string.split(iter_100_0, "_")[1]
			local var_100_4 = var_100_0[var_100_3]
			local var_100_5 = var_100_0[var_100_3 .. "_talk"]
			local var_100_6 = var_100_0[var_100_3 .. "_delay"]
			local var_100_7 = var_100_0[var_100_3 .. "_weight"]
			local var_100_8 = {}
			local var_100_9 = {}
			local var_100_10 = {}
			local var_100_11 = {}

			var_100_1[var_100_3] = var_100_8
			var_100_1[var_100_3 .. "_talk"] = var_100_9
			var_100_1[var_100_3 .. "_delay"] = var_100_10
			var_100_1[var_100_3 .. "_weight"] = var_100_11

			for iter_100_2, iter_100_3 in ipairs(var_100_2) do
				local var_100_12 = HeroTools.GetInteractionVoiceFileName(iter_100_3)

				if HeroVoiceCfg.get_id_list_by_file[var_100_12] then
					local var_100_13 = HeroVoiceCfg.get_id_list_by_file[var_100_12][1]

					if HeroVoiceCfg[var_100_13].use_skin_id == 0 and not arg_100_0:IsUnlockVoice(arg_100_1, var_100_13) then
						-- block empty
					else
						local var_100_14 = var_100_4[iter_100_2]
						local var_100_15 = string.split(var_100_14, "__")
						local var_100_16 = true

						if var_100_15[2] then
							if #arg_100_2 > 0 then
								local var_100_17 = string.split(var_100_15[2], "_")

								for iter_100_4, iter_100_5 in ipairs(arg_100_2) do
									if not table.indexof(var_100_17, iter_100_5) then
										var_100_16 = false

										break
									end
								end
							else
								var_100_16 = false
							end
						end

						if var_100_16 then
							table.insert(var_100_8, var_100_14)
							table.insert(var_100_9, var_100_5[iter_100_2])

							if var_100_6 then
								table.insert(var_100_10, var_100_6[iter_100_2])
							end

							if var_100_7 then
								table.insert(var_100_11, var_100_7[iter_100_2])
							end
						end
					end
				end
			end
		end
	end

	return var_100_1
end

function var_0_0.IsUnlockVoice(arg_101_0, arg_101_1, arg_101_2)
	if DormHeroTools:IsVoiceNeedUnlock(arg_101_2, arg_101_1) and DormHeroTools:GetDormLevelByHeroID(arg_101_1) < DormHeroTools:GetVoiceUnlockLevel(arg_101_1, arg_101_2) then
		return false
	end

	local var_101_0 = HeroVoiceCfg[arg_101_2].unlock_condition

	if var_101_0 == 0 then
		return true
	else
		return IsConditionAchieved(var_101_0, {
			heroId = arg_101_1
		})
	end
end

function var_0_0.GetModuleAttribute(arg_102_0)
	local var_102_0 = arg_102_0.id
	local var_102_1 = {
		0,
		0,
		0,
		0
	}
	local var_102_2 = HeroTools.GetModuleEffectByHeroAndLevel(var_102_0, arg_102_0.weapon_module_level)

	for iter_102_0, iter_102_1 in pairs(var_102_2) do
		local var_102_3 = WeaponModuleEffectCfg[iter_102_1]

		if var_102_3.type == 1 then
			for iter_102_2, iter_102_3 in pairs(var_102_3.attributes) do
				var_102_1[iter_102_3[1]] = var_102_1[iter_102_3[1]] + iter_102_3[2]
			end
		end
	end

	return var_102_1
end

function var_0_0.GetSkillAttribute(arg_103_0)
	local var_103_0 = arg_103_0.id
	local var_103_1 = {}

	for iter_103_0, iter_103_1 in ipairs(arg_103_0.skillAttrList) do
		local var_103_2 = SkillTools.GetSkillAttrCfg(var_103_0, iter_103_1.index, iter_103_1.level)

		if var_103_2 then
			for iter_103_2, iter_103_3 in pairs(var_103_2.attr) do
				var_103_1[iter_103_3[1]] = iter_103_3[2]
			end
		end
	end

	return var_103_1
end

local function var_0_9(arg_104_0, arg_104_1, arg_104_2)
	if arg_104_1 == nil then
		return arg_104_0
	end

	arg_104_2 = arg_104_2 or "\n"

	if arg_104_0 == nil then
		return arg_104_1
	else
		return arg_104_0 .. arg_104_2 .. arg_104_1
	end
end

function var_0_0.GetModuleAllDes(arg_105_0, arg_105_1, arg_105_2)
	local var_105_0
	local var_105_1
	local var_105_2
	local var_105_3
	local var_105_4 = HeroData:GetHeroList()[arg_105_1].servant_uid

	if var_105_4 ~= HeroTools.GetHeroSpecServant(arg_105_1) then
		var_105_4 = 0
	end

	for iter_105_0, iter_105_1 in pairs(arg_105_0) do
		local var_105_5 = WeaponModuleEffectCfg[iter_105_1].type

		if var_105_5 == 1 then
			if var_105_0 == nil then
				var_105_0 = {
					iter_105_1
				}
			else
				table.insert(var_105_0, iter_105_1)
			end
		elseif var_105_5 == 2 then
			var_105_1 = var_0_9(var_105_1, SkillTools.GetSkillModuleDes(iter_105_1))
		elseif var_105_5 == 3 then
			var_105_2 = var_0_9(var_105_2, AstrolabeTools.GetAstrolabeModuleDes(iter_105_1, var_105_4), "\n\n")
		elseif var_105_5 == 4 then
			var_105_3 = var_0_9(var_105_3, WeaponTools.GetWeaponModuleDes(iter_105_1, arg_105_2), "\n\n")
		elseif var_105_5 == 5 then
			var_105_1 = var_0_9(var_105_1, SkillTools.GetServantSkillModuleDes(iter_105_1))
		elseif var_105_5 == 6 then
			var_105_1 = var_0_9(var_105_1, SkillTools.GetAstrolabeSkillModuleDes(iter_105_1))
		end
	end

	return var_105_0, var_105_1, var_105_2, var_105_3
end

function var_0_0.MergeModuleAttribute(arg_106_0)
	local var_106_0 = {}

	for iter_106_0, iter_106_1 in pairs(arg_106_0) do
		local var_106_1 = WeaponModuleEffectCfg[iter_106_1].attributes

		for iter_106_2, iter_106_3 in pairs(var_106_1) do
			if var_106_0[iter_106_3[1]] then
				var_106_0[iter_106_3[1]] = var_106_0[iter_106_3[1]] + iter_106_3[2]
			else
				var_106_0[iter_106_3[1]] = iter_106_3[2]
			end
		end
	end

	return var_106_0
end

function var_0_0.CheckModulePieceCanEnter()
	local var_107_0 = ItemCfg.get_id_list_by_sub_type[ItemConst.ITEM_SUB_TYPE.MODULE_PIECE]

	for iter_107_0, iter_107_1 in pairs(var_107_0) do
		if ItemTools.getItemNum(iter_107_1) > 0 then
			return true
		end
	end

	return false
end

function var_0_0.GetModuleEffectByHeroAndLevel(arg_108_0, arg_108_1)
	local var_108_0 = {}

	if arg_108_0 and arg_108_1 then
		local var_108_1 = WeaponModuleCfg[arg_108_0]

		if var_108_1 then
			for iter_108_0 = 1, arg_108_1 do
				for iter_108_1, iter_108_2 in pairs(var_108_1.skill[iter_108_0]) do
					table.insert(var_108_0, iter_108_2)
				end
			end
		end
	end

	return var_108_0
end

function var_0_0.GetStageDicWithStarTemplateAndStarSkillType(arg_109_0, arg_109_1)
	if HeroStarUpTemplateCfg.template_dic[arg_109_0] and HeroStarUpTemplateCfg.template_dic[arg_109_0][arg_109_1] then
		return HeroStarUpTemplateCfg.template_dic[arg_109_0][arg_109_1].stage_dic
	end

	return {}
end

function var_0_0.GetStageListWithStarTemplateAndStarSkillType(arg_110_0, arg_110_1)
	if HeroStarUpTemplateCfg.template_dic[arg_110_0] and HeroStarUpTemplateCfg.template_dic[arg_110_0][arg_110_1] then
		return HeroStarUpTemplateCfg.template_dic[arg_110_0][arg_110_1].stage_list
	end

	return {}
end

function var_0_0.GetHeroNameLinkChar()
	local var_111_0
	local var_111_1 = SettingData:GetCurrentLanguage()

	return (var_111_1 == "en" or var_111_1 == "fr" or var_111_1 == "de") and " - " or var_111_1 == "jp" and "·" or "·"
end

function var_0_0.GetHeroFullName(arg_112_0)
	local var_112_0 = HeroCfg[arg_112_0]

	return GetI18NText(var_112_0.name) .. HeroTools.GetHeroNameLinkChar() .. GetI18NText(var_112_0.suffix)
end

function var_0_0.GetModulePowersByHeroIDAndLevel(arg_113_0, arg_113_1, arg_113_2)
	local var_113_0 = {}
	local var_113_1 = WeaponModuleCfg[arg_113_1]

	if var_113_1 then
		for iter_113_0 = 1, arg_113_2 do
			local var_113_2 = var_113_1.skill[iter_113_0]

			for iter_113_1, iter_113_2 in pairs(var_113_2) do
				table.insert(var_113_0, iter_113_2)
			end
		end
	end

	return var_113_0
end

function var_0_0.SetHeroNewTagRed(arg_114_0, arg_114_1, arg_114_2, arg_114_3)
	local var_114_0 = getData("heroNew", arg_114_1) or {}

	if var_114_0 then
		local var_114_1 = 0

		for iter_114_0, iter_114_1 in ipairs(var_114_0) do
			if iter_114_1 == arg_114_0 then
				var_114_1 = iter_114_0

				break
			end
		end

		local var_114_2 = false

		if var_114_1 > 0 then
			if not arg_114_3 then
				var_114_2 = true

				table.remove(var_114_0, var_114_1)
				manager.redPoint:setTip(arg_114_2, 0, RedPointStyle.SHOW_NEW_TAG)
			end
		elseif arg_114_3 then
			var_114_2 = true

			table.insert(var_114_0, arg_114_0)
			manager.redPoint:setTip(arg_114_2, 1, RedPointStyle.SHOW_NEW_TAG)
		end

		if var_114_2 then
			saveData("heroNew", arg_114_1, var_114_0)
		end
	end
end

function var_0_0.DispatchAllHeroNewRed(arg_115_0, arg_115_1)
	local var_115_0 = getData("heroNew", arg_115_0) or {}

	for iter_115_0, iter_115_1 in ipairs(var_115_0) do
		local var_115_1 = arg_115_1 .. iter_115_1

		manager.redPoint:setTip(var_115_1, 1, RedPointStyle.SHOW_NEW_TAG)
	end
end

function var_0_0.GetHeroShowData(arg_116_0, arg_116_1)
	local var_116_0 = {}

	if arg_116_1 then
		CommonFilterData:ClearFilter(Filter_Root_Define.Hero_Filter_List.filter_id)
	end

	local var_116_1 = CommonFilterData:IsAll(Filter_Root_Define.Hero_Filter_List.filter_id) or arg_116_1

	if var_116_1 then
		return arg_116_0
	end

	for iter_116_0, iter_116_1 in pairs(arg_116_0) do
		local var_116_2 = not var_0_0.GetIsHide(iter_116_1.id)

		if var_116_2 and not var_116_1 then
			local var_116_3 = HeroCfg[iter_116_1.id]
			local var_116_4 = CommonFilterData:SpecificHasFlag(Filter_Root_Define.Hero_Filter_List.filter_id, Filter_Group_Define.RACE.groupID, {
				Filter_Tags_Define["Race" .. var_116_3.race]
			})
			local var_116_5 = CommonFilterData:SpecificHasFlag(Filter_Root_Define.Hero_Filter_List.filter_id, Filter_Group_Define.ARRT.groupID, {
				Filter_Tags_Define["ARRT" .. var_116_3.ATK_attribute[1]]
			})
			local var_116_6 = CommonFilterData:SpecificHasFlag(Filter_Root_Define.Hero_Filter_List.filter_id, Filter_Group_Define.MECHAINISMTYPE.groupID, {
				Filter_Tags_Define["MECHAINISM" .. var_116_3.mechanism_type[1]]
			})

			var_116_2 = var_116_4 and var_116_5 and var_116_6
		end

		if var_116_2 then
			table.insert(var_116_0, iter_116_1)
		end
	end

	return var_116_0
end

function var_0_0.GetHeroShowIDList(arg_117_0, arg_117_1)
	local var_117_0 = {}

	if arg_117_1 then
		CommonFilterData:ClearFilter(Filter_Root_Define.Hero_Filter_List.filter_id)
	end

	local var_117_1 = CommonFilterData:IsAll(Filter_Root_Define.Hero_Filter_List.filter_id) or arg_117_1

	if var_117_1 then
		return arg_117_0
	end

	for iter_117_0, iter_117_1 in pairs(arg_117_0) do
		local var_117_2 = not var_0_0.GetIsHide(iter_117_1)

		if var_117_2 and not var_117_1 then
			local var_117_3 = HeroCfg[iter_117_1]
			local var_117_4 = CommonFilterData:SpecificHasFlag(Filter_Root_Define.Hero_Filter_List.filter_id, Filter_Group_Define.RACE.groupID, {
				Filter_Tags_Define["Race" .. var_117_3.race]
			})
			local var_117_5 = CommonFilterData:SpecificHasFlag(Filter_Root_Define.Hero_Filter_List.filter_id, Filter_Group_Define.ARRT.groupID, {
				Filter_Tags_Define["ARRT" .. var_117_3.ATK_attribute[1]]
			})
			local var_117_6 = CommonFilterData:SpecificHasFlag(Filter_Root_Define.Hero_Filter_List.filter_id, Filter_Group_Define.MECHAINISMTYPE.groupID, {
				Filter_Tags_Define["MECHAINISM" .. var_117_3.mechanism_type[1]]
			})

			var_117_2 = var_117_4 and var_117_5 and var_117_6
		end

		if var_117_2 then
			table.insert(var_117_0, iter_117_1)
		end
	end

	return var_117_0
end

function var_0_0.IsSpHero(arg_118_0)
	local var_118_0 = HeroCfg[arg_118_0]

	if var_118_0 then
		return var_118_0.role_type == 1
	end

	return false
end

function var_0_0.FormatFilterHeroDataList(arg_119_0, arg_119_1, arg_119_2, arg_119_3)
	local var_119_0 = HeroViewDataProxy.New(arg_119_0)

	var_119_0:SetTempHeroList(arg_119_3)

	local var_119_1 = {}

	for iter_119_0, iter_119_1 in ipairs(arg_119_1) do
		local var_119_2 = var_119_0:GetHeroData(iter_119_1).tempID

		var_119_1[iter_119_0] = {
			id = iter_119_1,
			trialID = var_119_2,
			type = arg_119_2,
			heroViewProxy = var_119_0
		}
	end

	return var_119_1
end

function var_0_0.IsNPC(arg_120_0)
	if arg_120_0 and HeroCfg[arg_120_0] then
		return HeroCfg[arg_120_0].private ~= 0
	end

	return false
end

function var_0_0.NeedHideInfo(arg_121_0)
	if arg_121_0 and HeroCfg[arg_121_0] then
		return HeroCfg[arg_121_0].hide_info == 1
	end

	return false
end

function var_0_0.GetSectionHeroTeamVoiceIDList(arg_122_0)
	return (var_0_0.TryGetCacheSectionHeroTeamVoiceList(arg_122_0))
end

function var_0_0.GetCacheKeyOfSectionHeroTeamVoice(arg_123_0)
	local var_123_0 = clone(arg_123_0)

	table.sort(var_123_0, function(arg_124_0, arg_124_1)
		return arg_124_0 < arg_124_1
	end)

	local var_123_1 = ""

	for iter_123_0, iter_123_1 in ipairs(var_123_0) do
		if iter_123_1 ~= 0 then
			var_123_1 = var_123_1 .. "_" .. iter_123_1
		end
	end

	return var_123_1
end

function var_0_0.TryGetCacheSectionHeroTeamVoiceList(arg_125_0)
	var_0_0.cacheHeroTeamVoiceDic = var_0_0.cacheHeroTeamVoiceDic or {}

	local var_125_0 = var_0_0.GetCacheKeyOfSectionHeroTeamVoice(arg_125_0)

	if var_0_0.cacheHeroTeamVoiceDic[var_125_0] then
		return var_0_0.cacheHeroTeamVoiceDic[var_125_0]
	end

	local var_125_1 = var_0_0.GetMatchSectionHeroTeamVoiceList(arg_125_0)

	var_0_0.SetCacheSectionHeroTeamVoiceList(var_125_0, var_125_1)

	return var_125_1
end

function var_0_0.SetCacheSectionHeroTeamVoiceList(arg_126_0, arg_126_1)
	var_0_0.cacheHeroTeamVoiceDic = var_0_0.cacheHeroTeamVoiceDic or {}
	var_0_0.cacheHeroTeamVoiceDic[arg_126_0] = arg_126_1
end

function var_0_0.GetMatchSectionHeroTeamVoiceList(arg_127_0)
	local var_127_0 = {}
	local var_127_1 = {}

	for iter_127_0, iter_127_1 in pairs(arg_127_0) do
		if iter_127_1 ~= 0 then
			var_127_1[iter_127_1] = true
		end
	end

	for iter_127_2, iter_127_3 in pairs(var_127_1) do
		if HeroVoiceDescCfg.get_id_list_by_chara_id[iter_127_2] then
			local var_127_2 = HeroVoiceDescCfg.get_id_list_by_chara_id[iter_127_2]

			for iter_127_4, iter_127_5 in ipairs(var_127_2) do
				if type(HeroVoiceDescCfg[iter_127_5].team_hero_id_list) == "table" then
					local var_127_3 = HeroVoiceDescCfg[iter_127_5].team_hero_id_list
					local var_127_4 = true

					for iter_127_6, iter_127_7 in ipairs(var_127_3) do
						if not var_127_1[iter_127_7] then
							var_127_4 = false

							break
						end
					end

					if var_127_4 then
						var_127_0[#var_127_0 + 1] = iter_127_5
					end
				end
			end
		end
	end

	return var_127_0
end

return var_0_0
