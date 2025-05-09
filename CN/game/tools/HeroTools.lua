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

	return var_0_0.LoadSkillAttributeIcon(var_73_0)
end

function var_0_0.LoadSkillAttributeIcon(arg_74_0)
	return getSprite("Atlas/Hero_arrtAtlas", arg_74_0)
end

function var_0_0.GetSkillAttributeName(arg_75_0)
	if SkillElementCfg[arg_75_0] then
		return GetI18NText(SkillElementCfg[arg_75_0].name)
	end

	Debug.LogError("SkillElementCfg不存在该属性: " .. tostring(arg_75_0))
end

function var_0_0.GetHeroSkillMechanismIcon(arg_76_0)
	local var_76_0

	for iter_76_0, iter_76_1 in ipairs(GameDisplayCfg.hero_mechanism_type_tag.value) do
		if iter_76_1[1] == HeroCfg[arg_76_0].mechanism_type[1] then
			var_76_0 = iter_76_1[2]

			break
		end
	end

	return getSprite("Atlas/Hero_arrtAtlas", var_76_0)
end

function var_0_0.GetHeroRareSprite(arg_77_0)
	return var_0_0.GetRareSprite(HeroCfg[arg_77_0].rare)
end

function var_0_0.GetRareSprite(arg_78_0)
	return getSprite("Atlas/SystemHeroGradeAtlas", string.format("star_%s", arg_78_0))
end

function var_0_0.GetHeroCurrentMaxLevel(arg_79_0)
	local var_79_0 = arg_79_0.break_level or 0
	local var_79_1 = HeroCfg[arg_79_0.id]

	return HeroTools.GetHeroBreakConfig(var_79_1.race, var_79_0).max_level
end

function var_0_0.GetHeroMaxLevel(arg_80_0)
	local var_80_0 = HeroCfg[arg_80_0.id]

	return HeroBreakCfg[HeroBreakCfg.get_id_list_by_race[var_80_0.race][#HeroBreakCfg.get_id_list_by_race[var_80_0.race]]].max_level
end

function var_0_0.GetHeroBreakConfig(arg_81_0, arg_81_1)
	for iter_81_0, iter_81_1 in ipairs(HeroBreakCfg.all) do
		if HeroBreakCfg[iter_81_1].race == arg_81_0 and HeroBreakCfg[iter_81_1].break_times == arg_81_1 then
			return HeroBreakCfg[iter_81_1]
		end
	end

	error(string.format("在hero_break.csv中找不到race=%d,breakLevel=%d的项", arg_81_0, arg_81_1))

	return nil
end

function var_0_0.GetHeroServantInfo(arg_82_0)
	local var_82_0 = WeaponServantData.GetWeaponServantList()
	local var_82_1 = HeroData:GetHeroList()[arg_82_0].servant_uid

	if var_82_1 == 0 then
		return nil
	end

	return var_82_0[var_82_1]
end

function var_0_0.GetHeroSpecServant(arg_83_0)
	return HeroCfg[arg_83_0].spec_servant
end

function var_0_0.GetHeroProficiency(arg_84_0)
	local var_84_0 = HeroData:GetHeroData(arg_84_0).clear_times

	return (math.min(var_84_0, GameSetting.mastery_level_max.value[1]))
end

function var_0_0.CanBreakHero(arg_85_0)
	local var_85_0 = HeroCfg[arg_85_0]
	local var_85_1 = HeroData:GetHeroData(arg_85_0)

	if var_85_1.unlock and var_85_1.level < HeroConst.HERO_LV_MAX and var_85_1.level >= HeroTools.GetHeroCurrentMaxLevel(var_85_1) then
		-- block empty
	else
		return false
	end

	local var_85_2 = HeroTools.GetHeroBreakConfig(var_85_0.race, var_85_1.break_level or 0)

	if PlayerData:GetPlayerInfo().userLevel < var_85_2.user_level then
		return false
	end

	local var_85_3 = #var_85_2.cost

	for iter_85_0 = 1, var_85_3 do
		local var_85_4 = var_85_2.cost[iter_85_0]

		if not (ItemTools.getItemNum(var_85_4[1]) >= var_85_4[2]) then
			return false
		end
	end

	if ItemTools.getItemNum(CurrencyConst.CURRENCY_TYPE_GOLD) < var_85_2.cost_gold then
		return false
	end

	return true
end

function var_0_0.GetHeroOntologyID(arg_86_0)
	for iter_86_0, iter_86_1 in ipairs(HeroRecordCfg.all) do
		local var_86_0 = HeroRecordCfg[iter_86_1]

		if arg_86_0 == iter_86_1 then
			return iter_86_1, true
		end

		for iter_86_2, iter_86_3 in ipairs(var_86_0.hero_id) do
			if arg_86_0 == iter_86_3 then
				return iter_86_1, false
			end
		end
	end
end

function var_0_0.GetHeroTeachVideo(arg_87_0)
	local var_87_0 = HeroCfg[arg_87_0]

	if HeroData:GetHeroData(arg_87_0).unlock == 0 then
		return nil
	end

	local var_87_1 = var_87_0.study_stage[1]

	if var_87_1 then
		local var_87_2 = TeachStageExInfoCfg[var_87_1]

		if var_87_2 and var_87_2.video_url then
			return var_87_2.video_url
		end
	end
end

function var_0_0.IsSkinUnlock(arg_88_0)
	local var_88_0 = SkinCfg[arg_88_0].hero
	local var_88_1 = HeroTools.HeroUnlockSkinS(var_88_0)

	for iter_88_0, iter_88_1 in ipairs(var_88_1) do
		if iter_88_1 == arg_88_0 then
			return true
		end
	end

	return false
end

function var_0_0.GetShopIdBySkinId(arg_89_0)
	local var_89_0 = SkinIDToGoodIDCfg[arg_89_0]

	if var_89_0 == nil then
		return 0
	end

	for iter_89_0, iter_89_1 in ipairs(var_89_0.goods_id) do
		local var_89_1 = getShopCfg(iter_89_1)

		if var_89_1 and var_89_1.shop_refresh == 3 then
			return iter_89_1
		end
	end

	return 0
end

function var_0_0.IsSkinOnlySellDLC(arg_90_0)
	return var_0_0.GetShopIdBySkinId(arg_90_0) < 0 and true or false
end

function var_0_0.IsSkinOutOfDate(arg_91_0)
	local var_91_0 = var_0_0.GetShopIdBySkinId(arg_91_0)

	if var_91_0 and var_91_0 > 0 then
		local var_91_1 = getShopCfg(var_91_0).shop_id

		return ShopData.IsGoodOutOfDate(var_91_0, var_91_1)
	else
		return true
	end
end

function var_0_0.CanBeDraw(arg_92_0, arg_92_1)
	local var_92_0 = ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.DRAW] or {}

	for iter_92_0, iter_92_1 in ipairs(var_92_0) do
		if ActivityData:GetActivityIsOpen(iter_92_1) then
			local var_92_1 = ActivityDrawPoolCfg[iter_92_1]

			if var_92_1 then
				for iter_92_2, iter_92_3 in ipairs(var_92_1.config_list) do
					if arg_92_1 == iter_92_3 then
						return true
					end
				end
			end
		end
	end

	return false
end

function var_0_0.GetIsHide(arg_93_0)
	return HideInfoData:GetHeroHideList()[arg_93_0] or false
end

function var_0_0.GetIsSkinHide(arg_94_0)
	return HideInfoData:GetSkinHideList()[arg_94_0] or false
end

function var_0_0.GetSkinIsCanUnlockAndGet(arg_95_0)
	if SkinCfg[arg_95_0].unlock_id_list[1] then
		for iter_95_0, iter_95_1 in pairs(SkinCfg[arg_95_0].unlock_id_list) do
			local var_95_0, var_95_1, var_95_2 = IsConditionAchieved(iter_95_1, {
				heroId = SkinCfg[arg_95_0].hero
			})

			if not var_95_0 then
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

local function var_0_7(arg_97_0)
	local var_97_0 = false

	for iter_97_0 = var_0_5 + 1, #HeroRecordCfg.all do
		local var_97_1 = HeroRecordCfg.all[iter_97_0]
		local var_97_2 = HeroRecordCfg[var_97_1].hero_id

		for iter_97_1, iter_97_2 in pairs(var_97_2) do
			var_0_4[iter_97_2] = var_97_1

			if arg_97_0 == iter_97_2 then
				var_97_0 = true
			end
		end

		var_0_5 = iter_97_0

		if var_97_0 then
			return var_97_1
		end
	end

	return nil
end

local function var_0_8(arg_98_0)
	local var_98_0 = var_0_4[arg_98_0]

	if var_98_0 == nil then
		var_98_0 = var_0_7(arg_98_0)
	end

	return var_98_0
end

function var_0_0.IsSamePerson(arg_99_0, arg_99_1)
	local var_99_0 = var_0_8(arg_99_0)
	local var_99_1 = var_0_8(arg_99_1)

	return var_99_0 ~= nil and var_99_1 ~= nil and var_99_0 == var_99_1
end

function var_0_0.GetInteractionVoiceFileName(arg_100_0)
	if arg_100_0 == nil then
		return nil
	end

	local var_100_0 = string.find(arg_100_0, "_")

	return var_100_0 and string.sub(arg_100_0, var_100_0 + 1) or nil
end

local function var_0_9(arg_101_0, arg_101_1)
	if arg_101_1 == nil or next(arg_101_1) == nil then
		return arg_101_0[math.random(#arg_101_0)]
	end

	local var_101_0 = 0

	for iter_101_0, iter_101_1 in ipairs(arg_101_1) do
		var_101_0 = var_101_0 + iter_101_1
	end

	if var_101_0 > 0 then
		local var_101_1 = math.random() * var_101_0
		local var_101_2 = 1

		while var_101_1 > arg_101_1[var_101_2] do
			var_101_1 = var_101_1 - arg_101_1[var_101_2]
			var_101_2 = var_101_2 + 1
		end

		return arg_101_0[var_101_2], var_101_2
	end
end

local function var_0_10(arg_102_0, arg_102_1)
	local var_102_0 = HeroInteractionCfg[arg_102_0]

	if var_102_0 then
		local var_102_1 = var_102_0[arg_102_1 .. "_talk"]

		if var_102_1 then
			local var_102_2 = var_102_0[arg_102_1 .. "_delay"]
			local var_102_3 = var_102_0[arg_102_1 .. "_weight"]
			local var_102_4, var_102_5 = var_0_9(var_102_1, var_102_3)

			if var_102_4 and var_102_5 then
				return var_102_4, var_102_2[var_102_5]
			end
		end
	end

	local var_102_6 = nullable(ExtraHeroInteractionCfg.get_id_list_by_interaction_type_skinId, arg_102_1, arg_102_0, 1)

	if var_102_6 then
		local var_102_7 = ExtraHeroInteractionCfg[var_102_6]
		local var_102_8, var_102_9 = var_0_9(var_102_7.interaction_talk, var_102_7.interaction_weight)

		if var_102_8 and var_102_9 then
			return var_102_8, var_102_7.interaction_delay[var_102_9]
		end
	end

	return nil, 0
end

local function var_0_11(arg_103_0, arg_103_1, arg_103_2)
	local var_103_0 = HeroInteractionCfg[arg_103_0]

	if var_103_0 then
		local var_103_1 = var_103_0[arg_103_1 .. "_talk"]

		if var_103_1 then
			local var_103_2 = var_103_0[arg_103_1]
			local var_103_3 = var_103_0[arg_103_1 .. "_delay"]
			local var_103_4 = table.indexof(var_103_2, arg_103_2)

			if var_103_4 then
				return var_103_1[var_103_4], var_103_3[var_103_4]
			end
		end
	end

	local var_103_5 = nullable(ExtraHeroInteractionCfg.get_id_list_by_interaction_type_skinId, arg_103_1, arg_103_0, 1)

	if var_103_5 then
		local var_103_6 = ExtraHeroInteractionCfg[var_103_5]
		local var_103_7 = table.indexof(var_103_6.interaction_id, arg_103_2)

		if var_103_7 then
			return var_103_6.interaction_talk[var_103_7], var_103_6.interaction_delay[var_103_7]
		end
	end

	return nil, 0
end

function var_0_0.GetTalkInfoFromInteractionCfg(arg_104_0, arg_104_1, arg_104_2)
	if arg_104_2 then
		return var_0_11(arg_104_0, arg_104_1, arg_104_2)
	else
		return var_0_10(arg_104_0, arg_104_1)
	end
end

function var_0_0.GetUnlockInteractionCfg(arg_105_0, arg_105_1, arg_105_2)
	local var_105_0 = HeroInteractionCfg[arg_105_1]
	local var_105_1 = {}

	for iter_105_0, iter_105_1 in pairs(var_105_0) do
		if string.find(iter_105_0, "_talk") then
			local var_105_2 = var_105_0[iter_105_0]
			local var_105_3 = string.split(iter_105_0, "_")[1]
			local var_105_4 = var_105_0[var_105_3]
			local var_105_5 = var_105_0[var_105_3 .. "_talk"]
			local var_105_6 = var_105_0[var_105_3 .. "_delay"]
			local var_105_7 = var_105_0[var_105_3 .. "_weight"]
			local var_105_8 = {}
			local var_105_9 = {}
			local var_105_10 = {}
			local var_105_11 = {}

			var_105_1[var_105_3] = var_105_8
			var_105_1[var_105_3 .. "_talk"] = var_105_9
			var_105_1[var_105_3 .. "_delay"] = var_105_10
			var_105_1[var_105_3 .. "_weight"] = var_105_11

			for iter_105_2, iter_105_3 in ipairs(var_105_2) do
				local var_105_12 = HeroTools.GetInteractionVoiceFileName(iter_105_3)

				if HeroVoiceCfg.get_id_list_by_file[var_105_12] then
					local var_105_13 = HeroVoiceCfg.get_id_list_by_file[var_105_12][1]

					if HeroVoiceCfg[var_105_13].use_skin_id == 0 and not arg_105_0:IsUnlockVoice(arg_105_1, var_105_13) then
						-- block empty
					else
						local var_105_14 = var_105_4[iter_105_2]
						local var_105_15 = string.split(var_105_14, "__")
						local var_105_16 = true

						if var_105_15[2] then
							if #arg_105_2 > 0 then
								local var_105_17 = string.split(var_105_15[2], "_")

								for iter_105_4, iter_105_5 in ipairs(arg_105_2) do
									if not table.indexof(var_105_17, iter_105_5) then
										var_105_16 = false

										break
									end
								end
							else
								var_105_16 = false
							end
						end

						if var_105_16 then
							table.insert(var_105_8, var_105_14)
							table.insert(var_105_9, var_105_5[iter_105_2])

							if var_105_6 then
								table.insert(var_105_10, var_105_6[iter_105_2])
							end

							if var_105_7 then
								table.insert(var_105_11, var_105_7[iter_105_2])
							end
						end
					end
				end
			end
		end
	end

	return var_105_1
end

function var_0_0.IsUnlockVoice(arg_106_0, arg_106_1, arg_106_2)
	if DormHeroTools:IsVoiceNeedUnlock(arg_106_2, arg_106_1) and DormHeroTools:GetDormLevelByHeroID(arg_106_1) < DormHeroTools:GetVoiceUnlockLevel(arg_106_1, arg_106_2) then
		return false
	end

	local var_106_0 = HeroVoiceCfg[arg_106_2].unlock_condition

	if var_106_0 == 0 then
		return true
	else
		return IsConditionAchieved(var_106_0, {
			heroId = arg_106_1
		})
	end
end

function var_0_0.GetModuleAttribute(arg_107_0)
	local var_107_0 = arg_107_0.id
	local var_107_1 = {
		0,
		0,
		0,
		0
	}
	local var_107_2 = HeroTools.GetModuleEffectByHeroAndLevel(var_107_0, arg_107_0.weapon_module_level)

	for iter_107_0, iter_107_1 in pairs(var_107_2) do
		local var_107_3 = WeaponModuleEffectCfg[iter_107_1]

		if var_107_3.type == 1 then
			for iter_107_2, iter_107_3 in pairs(var_107_3.attributes) do
				var_107_1[iter_107_3[1]] = var_107_1[iter_107_3[1]] + iter_107_3[2]
			end
		end
	end

	return var_107_1
end

function var_0_0.GetSkillAttribute(arg_108_0)
	local var_108_0 = arg_108_0.id
	local var_108_1 = {}

	for iter_108_0, iter_108_1 in ipairs(arg_108_0.skillAttrList) do
		local var_108_2 = SkillTools.GetSkillAttrCfg(var_108_0, iter_108_1.index, iter_108_1.level)

		if var_108_2 then
			for iter_108_2, iter_108_3 in pairs(var_108_2.attr) do
				var_108_1[iter_108_3[1]] = iter_108_3[2]
			end
		end
	end

	return var_108_1
end

local function var_0_12(arg_109_0, arg_109_1, arg_109_2)
	if arg_109_1 == nil then
		return arg_109_0
	end

	arg_109_2 = arg_109_2 or "\n"

	if arg_109_0 == nil then
		return arg_109_1
	else
		return arg_109_0 .. arg_109_2 .. arg_109_1
	end
end

function var_0_0.GetModuleAllDes(arg_110_0, arg_110_1, arg_110_2)
	local var_110_0
	local var_110_1
	local var_110_2
	local var_110_3
	local var_110_4 = HeroData:GetHeroList()[arg_110_1].servant_uid

	if var_110_4 ~= HeroTools.GetHeroSpecServant(arg_110_1) then
		var_110_4 = 0
	end

	for iter_110_0, iter_110_1 in pairs(arg_110_0) do
		local var_110_5 = WeaponModuleEffectCfg[iter_110_1].type

		if var_110_5 == 1 then
			if var_110_0 == nil then
				var_110_0 = {
					iter_110_1
				}
			else
				table.insert(var_110_0, iter_110_1)
			end
		elseif var_110_5 == 2 then
			var_110_1 = var_0_12(var_110_1, SkillTools.GetSkillModuleDes(iter_110_1))
		elseif var_110_5 == 3 then
			var_110_2 = var_0_12(var_110_2, AstrolabeTools.GetAstrolabeModuleDes(iter_110_1, var_110_4), "\n\n")
		elseif var_110_5 == 4 then
			var_110_3 = var_0_12(var_110_3, WeaponTools.GetWeaponModuleDes(iter_110_1, arg_110_2), "\n\n")
		elseif var_110_5 == 5 then
			var_110_1 = var_0_12(var_110_1, SkillTools.GetServantSkillModuleDes(iter_110_1))
		elseif var_110_5 == 6 then
			var_110_1 = var_0_12(var_110_1, SkillTools.GetAstrolabeSkillModuleDes(iter_110_1))
		end
	end

	return var_110_0, var_110_1, var_110_2, var_110_3
end

function var_0_0.MergeModuleAttribute(arg_111_0)
	local var_111_0 = {}

	for iter_111_0, iter_111_1 in pairs(arg_111_0) do
		local var_111_1 = WeaponModuleEffectCfg[iter_111_1].attributes

		for iter_111_2, iter_111_3 in pairs(var_111_1) do
			if var_111_0[iter_111_3[1]] then
				var_111_0[iter_111_3[1]] = var_111_0[iter_111_3[1]] + iter_111_3[2]
			else
				var_111_0[iter_111_3[1]] = iter_111_3[2]
			end
		end
	end

	return var_111_0
end

function var_0_0.CheckModulePieceCanEnter()
	local var_112_0 = ItemCfg.get_id_list_by_sub_type[ItemConst.ITEM_SUB_TYPE.MODULE_PIECE]

	for iter_112_0, iter_112_1 in pairs(var_112_0) do
		if ItemTools.getItemNum(iter_112_1) > 0 then
			return true
		end
	end

	return false
end

function var_0_0.GetModuleEffectByHeroAndLevel(arg_113_0, arg_113_1)
	local var_113_0 = {}

	if arg_113_0 and arg_113_1 then
		local var_113_1 = WeaponModuleCfg[arg_113_0]

		if var_113_1 then
			for iter_113_0 = 1, arg_113_1 do
				for iter_113_1, iter_113_2 in pairs(var_113_1.skill[iter_113_0]) do
					table.insert(var_113_0, iter_113_2)
				end
			end
		end
	end

	return var_113_0
end

function var_0_0.GetStageDicWithStarTemplateAndStarSkillType(arg_114_0, arg_114_1)
	if HeroStarUpTemplateCfg.template_dic[arg_114_0] and HeroStarUpTemplateCfg.template_dic[arg_114_0][arg_114_1] then
		return HeroStarUpTemplateCfg.template_dic[arg_114_0][arg_114_1].stage_dic
	end

	return {}
end

function var_0_0.GetStageListWithStarTemplateAndStarSkillType(arg_115_0, arg_115_1)
	if HeroStarUpTemplateCfg.template_dic[arg_115_0] and HeroStarUpTemplateCfg.template_dic[arg_115_0][arg_115_1] then
		return HeroStarUpTemplateCfg.template_dic[arg_115_0][arg_115_1].stage_list
	end

	return {}
end

function var_0_0.GetHeroNameLinkChar()
	local var_116_0
	local var_116_1 = SettingData:GetCurrentLanguage()

	return (var_116_1 == "en" or var_116_1 == "fr" or var_116_1 == "de") and " - " or var_116_1 == "jp" and "·" or "·"
end

function var_0_0.GetHeroFullName(arg_117_0)
	local var_117_0 = HeroCfg[arg_117_0]

	return GetI18NText(var_117_0.name) .. HeroTools.GetHeroNameLinkChar() .. GetI18NText(var_117_0.suffix)
end

function var_0_0.GetModulePowersByHeroIDAndLevel(arg_118_0, arg_118_1, arg_118_2)
	local var_118_0 = {}
	local var_118_1 = WeaponModuleCfg[arg_118_1]

	if var_118_1 then
		for iter_118_0 = 1, arg_118_2 do
			local var_118_2 = var_118_1.skill[iter_118_0]

			for iter_118_1, iter_118_2 in pairs(var_118_2) do
				table.insert(var_118_0, iter_118_2)
			end
		end
	end

	return var_118_0
end

function var_0_0.SetHeroNewTagRed(arg_119_0, arg_119_1, arg_119_2, arg_119_3)
	local var_119_0 = getData("heroNew", arg_119_1) or {}

	if var_119_0 then
		local var_119_1 = 0

		for iter_119_0, iter_119_1 in ipairs(var_119_0) do
			if iter_119_1 == arg_119_0 then
				var_119_1 = iter_119_0

				break
			end
		end

		local var_119_2 = false

		if var_119_1 > 0 then
			if not arg_119_3 then
				var_119_2 = true

				table.remove(var_119_0, var_119_1)
				manager.redPoint:setTip(arg_119_2, 0, RedPointStyle.SHOW_NEW_TAG)
			end
		elseif arg_119_3 then
			var_119_2 = true

			table.insert(var_119_0, arg_119_0)
			manager.redPoint:setTip(arg_119_2, 1, RedPointStyle.SHOW_NEW_TAG)
		end

		if var_119_2 then
			saveData("heroNew", arg_119_1, var_119_0)
		end
	end
end

function var_0_0.DispatchAllHeroNewRed(arg_120_0, arg_120_1)
	local var_120_0 = getData("heroNew", arg_120_0) or {}

	for iter_120_0, iter_120_1 in ipairs(var_120_0) do
		local var_120_1 = arg_120_1 .. iter_120_1

		manager.redPoint:setTip(var_120_1, 1, RedPointStyle.SHOW_NEW_TAG)
	end
end

function var_0_0.GetHeroShowData(arg_121_0, arg_121_1, arg_121_2)
	local var_121_0 = arg_121_2 or Filter_Root_Define.Hero_Filter_List.filter_id
	local var_121_1 = {}

	if arg_121_1 then
		CommonFilterData:ClearFilter(var_121_0)
	end

	local var_121_2 = CommonFilterData:IsAll(var_121_0) or arg_121_1

	if var_121_2 then
		return arg_121_0
	end

	for iter_121_0, iter_121_1 in pairs(arg_121_0) do
		local var_121_3 = not var_0_0.GetIsHide(iter_121_1.id)

		if var_121_3 and not var_121_2 then
			local var_121_4 = HeroCfg[iter_121_1.id]
			local var_121_5 = CommonFilterData:SpecificHasFlag(var_121_0, Filter_Group_Define.RACE.groupID, {
				Filter_Tags_Define["Race" .. var_121_4.race]
			})
			local var_121_6 = CommonFilterData:SpecificHasFlag(var_121_0, Filter_Group_Define.ARRT.groupID, {
				Filter_Tags_Define["ARRT" .. var_121_4.ATK_attribute[1]]
			})
			local var_121_7 = CommonFilterData:SpecificHasFlag(var_121_0, Filter_Group_Define.MECHAINISMTYPE.groupID, {
				Filter_Tags_Define["MECHAINISM" .. var_121_4.mechanism_type[1]]
			})

			var_121_3 = var_121_5 and var_121_6 and var_121_7

			if var_121_0 == Filter_Root_Define.Osiris_Hero_Filter_List.filter_id then
				local var_121_8 = ActivityGeneralityCharactorCfg[iter_121_1.id].generality
				local var_121_9 = {}

				for iter_121_2 = 1, #var_121_8 do
					local var_121_10 = Filter_Tags_Define["OsirisPlayGameTag" .. var_121_8[iter_121_2]]

					table.insert(var_121_9, var_121_10)
				end

				local var_121_11 = CommonFilterData:SpecificHasFlag(var_121_0, Filter_Group_Define.OSIRIS_PLAY_GAME_TAG.groupID, var_121_9)

				var_121_3 = var_121_5 and var_121_6 and var_121_7 and var_121_11
			end
		end

		if var_121_3 then
			table.insert(var_121_1, iter_121_1)
		end
	end

	return var_121_1
end

function var_0_0.GetHeroShowIDList(arg_122_0, arg_122_1)
	local var_122_0 = {}

	if arg_122_1 then
		CommonFilterData:ClearFilter(Filter_Root_Define.Hero_Filter_List.filter_id)
	end

	local var_122_1 = CommonFilterData:IsAll(Filter_Root_Define.Hero_Filter_List.filter_id) or arg_122_1

	if var_122_1 then
		return arg_122_0
	end

	for iter_122_0, iter_122_1 in pairs(arg_122_0) do
		local var_122_2 = not var_0_0.GetIsHide(iter_122_1)

		if var_122_2 and not var_122_1 then
			local var_122_3 = HeroCfg[iter_122_1]
			local var_122_4 = CommonFilterData:SpecificHasFlag(Filter_Root_Define.Hero_Filter_List.filter_id, Filter_Group_Define.RACE.groupID, {
				Filter_Tags_Define["Race" .. var_122_3.race]
			})
			local var_122_5 = CommonFilterData:SpecificHasFlag(Filter_Root_Define.Hero_Filter_List.filter_id, Filter_Group_Define.ARRT.groupID, {
				Filter_Tags_Define["ARRT" .. var_122_3.ATK_attribute[1]]
			})
			local var_122_6 = CommonFilterData:SpecificHasFlag(Filter_Root_Define.Hero_Filter_List.filter_id, Filter_Group_Define.MECHAINISMTYPE.groupID, {
				Filter_Tags_Define["MECHAINISM" .. var_122_3.mechanism_type[1]]
			})

			var_122_2 = var_122_4 and var_122_5 and var_122_6
		end

		if var_122_2 then
			table.insert(var_122_0, iter_122_1)
		end
	end

	return var_122_0
end

function var_0_0.IsSpHero(arg_123_0)
	local var_123_0 = HeroCfg[arg_123_0]

	if var_123_0 then
		return var_123_0.role_type == 1
	end

	return false
end

function var_0_0.FormatFilterHeroDataList(arg_124_0, arg_124_1, arg_124_2, arg_124_3)
	local var_124_0 = HeroViewDataProxy.New(arg_124_0)

	var_124_0:SetTempHeroList(arg_124_3)

	local var_124_1 = {}

	for iter_124_0, iter_124_1 in ipairs(arg_124_1) do
		local var_124_2 = var_124_0:GetHeroData(iter_124_1).tempID

		var_124_1[iter_124_0] = {
			id = iter_124_1,
			trialID = var_124_2,
			type = arg_124_2,
			heroViewProxy = var_124_0
		}
	end

	return var_124_1
end

function var_0_0.IsNPC(arg_125_0)
	if arg_125_0 and HeroCfg[arg_125_0] then
		return HeroCfg[arg_125_0].private ~= 0
	end

	return false
end

function var_0_0.NeedHideInfo(arg_126_0)
	if arg_126_0 and HeroCfg[arg_126_0] then
		return HeroCfg[arg_126_0].hide_info == 1
	end

	return false
end

function var_0_0.GetSectionHeroTeamVoiceIDList(arg_127_0)
	return (var_0_0.TryGetCacheSectionHeroTeamVoiceList(arg_127_0))
end

function var_0_0.GetCacheKeyOfSectionHeroTeamVoice(arg_128_0)
	local var_128_0 = clone(arg_128_0)

	table.sort(var_128_0, function(arg_129_0, arg_129_1)
		return arg_129_0 < arg_129_1
	end)

	local var_128_1 = ""

	for iter_128_0, iter_128_1 in ipairs(var_128_0) do
		if iter_128_1 ~= 0 then
			var_128_1 = var_128_1 .. "_" .. iter_128_1
		end
	end

	return var_128_1
end

function var_0_0.TryGetCacheSectionHeroTeamVoiceList(arg_130_0)
	var_0_0.cacheHeroTeamVoiceDic = var_0_0.cacheHeroTeamVoiceDic or {}

	local var_130_0 = var_0_0.GetCacheKeyOfSectionHeroTeamVoice(arg_130_0)

	if var_0_0.cacheHeroTeamVoiceDic[var_130_0] then
		return var_0_0.cacheHeroTeamVoiceDic[var_130_0]
	end

	local var_130_1 = var_0_0.GetMatchSectionHeroTeamVoiceList(arg_130_0)

	var_0_0.SetCacheSectionHeroTeamVoiceList(var_130_0, var_130_1)

	return var_130_1
end

function var_0_0.SetCacheSectionHeroTeamVoiceList(arg_131_0, arg_131_1)
	var_0_0.cacheHeroTeamVoiceDic = var_0_0.cacheHeroTeamVoiceDic or {}
	var_0_0.cacheHeroTeamVoiceDic[arg_131_0] = arg_131_1
end

function var_0_0.GetMatchSectionHeroTeamVoiceList(arg_132_0)
	local var_132_0 = {}
	local var_132_1 = {}

	for iter_132_0, iter_132_1 in pairs(arg_132_0) do
		if iter_132_1 ~= 0 then
			var_132_1[iter_132_1] = true
		end
	end

	for iter_132_2, iter_132_3 in pairs(var_132_1) do
		if HeroVoiceDescCfg.get_id_list_by_chara_id[iter_132_2] then
			local var_132_2 = HeroVoiceDescCfg.get_id_list_by_chara_id[iter_132_2]

			for iter_132_4, iter_132_5 in ipairs(var_132_2) do
				if type(HeroVoiceDescCfg[iter_132_5].team_hero_id_list) == "table" then
					local var_132_3 = HeroVoiceDescCfg[iter_132_5].team_hero_id_list
					local var_132_4 = true

					for iter_132_6, iter_132_7 in ipairs(var_132_3) do
						if not var_132_1[iter_132_7] then
							var_132_4 = false

							break
						end
					end

					if var_132_4 then
						var_132_0[#var_132_0 + 1] = iter_132_5
					end
				end
			end
		end
	end

	return var_132_0
end

return var_0_0
