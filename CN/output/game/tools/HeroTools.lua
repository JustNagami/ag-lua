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

function var_0_0.PlayTalk(arg_11_0, arg_11_1, arg_11_2, arg_11_3)
	local var_11_0 = HeroCfg[arg_11_0]

	arg_11_2 = arg_11_2 or 1

	HeroTools.StopTalk()
	manager.audio:PlayUIAudioByVoice(arg_11_1)

	if arg_11_2 == 1 then
		if arg_11_3 ~= nil then
			LuaForUtil.PlayVoiceWithCriLipsync(arg_11_3, string.format("vo_sys_%d", arg_11_0), string.format("v_s_%d_%s", arg_11_0, arg_11_1), string.format("vo_sys_%d.awb", arg_11_0))
		else
			manager.audio:PlayVoice(string.format("vo_sys_%d", arg_11_0), string.format("v_s_%d_%s", arg_11_0, arg_11_1), string.format("vo_sys_%d.awb", arg_11_0))
		end
	else
		manager.audio:PlayVoice(string.format("vo_bat_%d", arg_11_0), string.format("v_b_%d_%s", arg_11_0, arg_11_1), string.format("vo_bat_%d.awb", arg_11_0))
	end

	manager.notify:Invoke(HERO_SOUND_PLAY, arg_11_0, arg_11_1, arg_11_2)
end

function var_0_0.PlayVoice(arg_12_0, arg_12_1, arg_12_2)
	local var_12_0 = HeroCfg[arg_12_0]

	arg_12_2 = arg_12_2 or 1

	HeroTools.StopTalk()

	local var_12_1

	if arg_12_2 == 1 then
		var_12_1 = manager.audio:PlayVoice(string.format("vo_sys_%d", arg_12_0), string.format("v_s_%d_%s", arg_12_0, arg_12_1), string.format("vo_sys_%d.awb", arg_12_0))
	else
		var_12_1 = manager.audio:PlayVoice(string.format("vo_bat_%d", arg_12_0), string.format("v_b_%d_%s", arg_12_0, arg_12_1), string.format("vo_bat_%d.awb", arg_12_0))
	end

	manager.notify:Invoke(HERO_SOUND_PLAY, arg_12_0, arg_12_1, arg_12_2)

	return var_12_1
end

function var_0_0.GetTalkLength(arg_13_0, arg_13_1, arg_13_2)
	arg_13_2 = arg_13_2 or 1

	if arg_13_2 == 1 then
		return manager.audio:GetVoiceLength(string.format("vo_sys_%d", arg_13_0), string.format("v_s_%d_%s", arg_13_0, arg_13_1), string.format("vo_sys_%d.awb", arg_13_0))
	else
		return manager.audio:GetVoiceLength(string.format("vo_bat_%d", arg_13_0), string.format("v_b_%d_%s", arg_13_0, arg_13_1), string.format("vo_bat_%d.awb", arg_13_0))
	end
end

function var_0_0.StopTalk()
	manager.audio:Stop("voice")
end

function var_0_0.GetConstructHero(arg_15_0)
	if arg_15_0.skin > 0 then
		arg_15_0.using_skin = arg_15_0.skin
	else
		arg_15_0.using_skin = arg_15_0.id
	end

	return arg_15_0
end

function var_0_0.InitTransitionByCfg(arg_16_0, arg_16_1)
	local var_16_0 = {}

	arg_16_0 = type(arg_16_0) == "table" and arg_16_0 or {}
	arg_16_1 = type(arg_16_1) == "table" and arg_16_1 or {}

	for iter_16_0, iter_16_1 in pairs(arg_16_0) do
		local var_16_1 = {}
		local var_16_2 = 0

		for iter_16_2, iter_16_3 in pairs(iter_16_1) do
			local var_16_3 = arg_16_1[iter_16_0] and arg_16_1[iter_16_0][iter_16_2] or 0

			var_16_2 = var_16_2 + var_16_3

			table.insert(var_16_1, {
				skill_id = iter_16_3,
				skill_level = var_16_3
			})
		end

		var_16_0[iter_16_0] = {
			slot_id = iter_16_0,
			talent_points = var_16_2,
			skill_list = var_16_1
		}
	end

	return var_16_0
end

function var_0_0.AttributeAdd(arg_17_0, arg_17_1, arg_17_2)
	arg_17_1 = arg_17_1 or 0
	arg_17_2 = arg_17_2 or 0

	if arg_17_0 == HeroConst.SUB_MUL_ATTRIBUTE_ID then
		return HeroConst.ATTRIBUTE_PRECISION - (HeroConst.ATTRIBUTE_PRECISION - arg_17_1) * (HeroConst.ATTRIBUTE_PRECISION - arg_17_2) / HeroConst.ATTRIBUTE_PRECISION
	elseif arg_17_0 == HeroConst.SUB_MUL_INJURY_ID or arg_17_0 == HeroConst.SUB_MUL_SELF_INJURY_ID then
		return (HeroConst.ATTRIBUTE_PRECISION + arg_17_1) * (HeroConst.ATTRIBUTE_PRECISION + arg_17_2) / HeroConst.ATTRIBUTE_PRECISION
	else
		return arg_17_1 + arg_17_2
	end
end

function var_0_0.GetHeroAttribute(arg_18_0)
	local var_18_0 = {}
	local var_18_1 = arg_18_0.star
	local var_18_2 = arg_18_0.id
	local var_18_3 = HeroCfg[var_18_2]
	local var_18_4 = var_18_3.star_up_skill_template
	local var_18_5 = var_0_0.GetStageListWithStarTemplateAndStarSkillType(var_18_4, HeroConst.HERO_STAR_SKILL_TYPE.ATTRIBUTE_UP)
	local var_18_6 = var_0_0.GetStageDicWithStarTemplateAndStarSkillType(var_18_4, HeroConst.HERO_STAR_SKILL_TYPE.ATTRIBUTE_UP)

	for iter_18_0, iter_18_1 in ipairs(var_18_5) do
		if iter_18_1 <= var_18_1 then
			local var_18_7 = var_18_6[iter_18_1]
			local var_18_8 = HeroStarSkillCfg[var_18_7]

			for iter_18_2, iter_18_3 in pairs(var_18_8.params) do
				var_18_0[iter_18_3[1]] = (var_18_0[iter_18_3[1]] or 0) + iter_18_3[2]
			end
		else
			break
		end
	end

	var_18_0[HeroConst.HERO_ATTRIBUTE.CRITICAL] = (var_18_0[HeroConst.HERO_ATTRIBUTE.CRITICAL] or 0) + var_18_3.base_crit2[(arg_18_0.break_level or 0) + 1]

	local var_18_9 = HeroStarCfg[var_18_1].star

	for iter_18_4, iter_18_5 in pairs(PublicAttrCfg.all) do
		local var_18_10 = 0
		local var_18_11 = HeroConst.HERO_ATTRIBUTE_MAP[iter_18_5]

		if var_18_11 then
			if var_18_11.base then
				var_18_10 = var_18_10 + var_18_3[var_18_11.base][var_18_9]
			end

			if var_18_11.grow_fixed then
				var_18_10 = var_18_10 + (arg_18_0.level - 1) * var_18_3[var_18_11.grow_fixed][var_18_9]
			end
		end

		if var_18_0[iter_18_5] == nil then
			var_18_0[iter_18_5] = 0
		end

		var_18_0[iter_18_5] = var_18_0[iter_18_5] + var_18_10
	end

	return var_18_0
end

function var_0_0.CaculateHeroAttribute(arg_19_0, arg_19_1)
	local var_19_0 = {}
	local var_19_1 = arg_19_0.star or arg_19_0.hero_star
	local var_19_2 = arg_19_0.hero_level or arg_19_0.level or var_0_0.CheckExp(1, arg_19_0.exp) or 1
	local var_19_3 = arg_19_0.hero_id or arg_19_0.id
	local var_19_4 = HeroCfg[var_19_3]

	for iter_19_0, iter_19_1 in pairs(arg_19_1) do
		var_19_0[iter_19_0] = (var_19_0[iter_19_0] or 0) + iter_19_1
	end

	local var_19_5 = var_19_4.star_up_skill_template
	local var_19_6 = var_0_0.GetStageListWithStarTemplateAndStarSkillType(var_19_5, HeroConst.HERO_STAR_SKILL_TYPE.ATTRIBUTE_UP)
	local var_19_7 = var_0_0.GetStageDicWithStarTemplateAndStarSkillType(var_19_5, HeroConst.HERO_STAR_SKILL_TYPE.ATTRIBUTE_UP)

	for iter_19_2, iter_19_3 in ipairs(var_19_6) do
		if iter_19_3 <= var_19_1 then
			local var_19_8 = var_19_7[iter_19_3]
			local var_19_9 = HeroStarSkillCfg[var_19_8]

			for iter_19_4, iter_19_5 in pairs(var_19_9.params) do
				var_19_0[iter_19_5[1]] = (var_19_0[iter_19_5[1]] or 0) + iter_19_5[2]
			end
		else
			break
		end
	end

	var_19_0[HeroConst.HERO_ATTRIBUTE.CRITICAL] = (var_19_0[HeroConst.HERO_ATTRIBUTE.CRITICAL] or 0) + var_19_4.base_crit2[(arg_19_0.break_level or 0) + 1]

	local var_19_10 = {}
	local var_19_11 = arg_19_0:GetWeaponInfo()
	local var_19_12 = arg_19_0:GetServantInfo()

	if var_19_11 then
		local var_19_13

		var_19_10[1], var_19_13 = WeaponTools.WeaponAtk(var_19_11.level, var_19_11.breakthrough), HeroCfg[var_19_3].weapon_break_attribute[var_19_11.breakthrough + 1]
		var_19_10[var_19_13[1]] = var_19_13[2]

		if var_19_12.id ~= 0 then
			local var_19_14 = WeaponServantCfg[var_19_12.id].attrib_addition
			local var_19_15 = WeaponServantCfg[var_19_12.id].attribute

			var_19_10[1] = var_19_10[1] + var_19_10[1] * var_19_14 / 100
			var_19_10[var_19_15[1]] = var_19_10[var_19_15[1]] + var_19_15[2]
		end

		for iter_19_6, iter_19_7 in pairs(var_19_10) do
			if not var_19_0[iter_19_6] then
				var_19_0[iter_19_6] = iter_19_7
			end

			var_19_0[iter_19_6] = var_19_0[iter_19_6] + iter_19_7
		end
	end

	local var_19_16 = HeroStarCfg[var_19_1].star

	for iter_19_8, iter_19_9 in pairs(PublicAttrCfg.all) do
		local var_19_17 = 0
		local var_19_18 = HeroConst.HERO_ATTRIBUTE_MAP[iter_19_9]

		if var_19_18 then
			if var_19_18.base then
				var_19_17 = var_19_17 + var_19_4[var_19_18.base][var_19_16]
			end

			if var_19_18.grow_fixed then
				var_19_17 = var_19_17 + (var_19_2 - 1) * var_19_4[var_19_18.grow_fixed][var_19_16]
			end
		end

		if var_19_0[iter_19_9] == nil then
			var_19_0[iter_19_9] = 0
		end

		var_19_0[iter_19_9] = var_19_0[iter_19_9] + var_19_17
	end

	return var_19_0
end

function var_0_0.CalFinalAttribute(arg_20_0)
	for iter_20_0, iter_20_1 in pairs(HeroConst.HERO_ATTRIBUTE_MAP) do
		if iter_20_1.ratio and arg_20_0[iter_20_0] then
			arg_20_0[iter_20_0] = arg_20_0[iter_20_0] * (1 + (arg_20_0[iter_20_1.ratio] / GameSetting.hp_ratio_percent.value[1] or 1))
		end
	end

	for iter_20_2, iter_20_3 in ipairs(arg_20_0) do
		local var_20_0 = PublicAttrCfg[iter_20_2]

		if var_20_0.percent and var_20_0.percent == 1 then
			arg_20_0[iter_20_2] = arg_20_0[iter_20_2]
		else
			arg_20_0[iter_20_2] = math.floor(arg_20_0[iter_20_2])
		end
	end
end

function var_0_0.Format(arg_21_0, arg_21_1)
	local var_21_0 = {}

	for iter_21_0, iter_21_1 in ipairs(arg_21_0) do
		var_21_0[iter_21_0] = {}

		for iter_21_2, iter_21_3 in ipairs(arg_21_1) do
			var_21_0[iter_21_0][iter_21_3] = iter_21_1[iter_21_3]
		end
	end

	return var_21_0
end

function var_0_0.CheckBlankTable(arg_22_0)
	local var_22_0 = true

	for iter_22_0, iter_22_1 in pairs(arg_22_0 or {}) do
		var_22_0 = false

		break
	end

	return var_22_0
end

function var_0_0.GetEquipMap(arg_23_0)
	local var_23_0 = {}

	for iter_23_0, iter_23_1 in pairs(arg_23_0) do
		if type(iter_23_1) == "table" then
			for iter_23_2, iter_23_3 in pairs(iter_23_1.equip) do
				var_23_0[iter_23_3.equip_id] = iter_23_0
			end
		end
	end

	return var_23_0
end

function var_0_0.GetHeroEquipS(arg_24_0)
	local var_24_0 = HeroData:GetHeroData(arg_24_0)

	return deepClone(var_24_0.equip)
end

function var_0_0.CheckExp(arg_25_0, arg_25_1)
	local var_25_0 = GameLevelSetting[arg_25_0]
	local var_25_1 = GameLevelSetting[arg_25_0 + 1]

	if var_25_0 == nil or var_25_1 == nil then
		return arg_25_0
	end

	local var_25_2 = var_25_0.hero_level_exp1

	if var_25_2 <= arg_25_1 then
		return var_0_0.CheckExp(arg_25_0 + 1, arg_25_1 - var_25_2)
	else
		return arg_25_0
	end
end

function var_0_0.GetUnlockSkill(arg_26_0)
	local var_26_0 = {}
	local var_26_1 = HeroData:GetHeroList()[arg_26_0].skill

	table.insert(var_26_0, {
		lv = 1,
		id = arg_26_0,
		type = HeroConst.SKILL_TYPE.ATTACK
	})

	local var_26_2 = #var_26_1

	for iter_26_0 = 1, var_26_2 do
		local var_26_3 = {
			id = var_26_1[iter_26_0].skill_id,
			lv = var_26_1[iter_26_0].lv or 0,
			type = HeroConst.SKILL_TYPE.SKILL
		}

		table.insert(var_26_0, var_26_3)
	end

	return var_26_0
end

function var_0_0.GetExSkillId(arg_27_0)
	return arg_27_0 * 1000 + 209
end

function var_0_0.GetTotalSkillLv(arg_28_0, arg_28_1)
	return var_0_0.GetSkillLv(arg_28_0, arg_28_1) + var_0_0.GetHeroSkillAddLevel(HeroData:GetHeroData(arg_28_0), arg_28_1)
end

function var_0_0.GetSkillLv(arg_29_0, arg_29_1)
	local var_29_0
	local var_29_1 = HeroData:GetHeroData(arg_29_0)

	for iter_29_0, iter_29_1 in ipairs(var_29_1.skill) do
		if iter_29_1.skill_id == arg_29_1 then
			return iter_29_1.skill_level
		end
	end

	return 0
end

function var_0_0.GetSkillAttrLv(arg_30_0, arg_30_1)
	local var_30_0
	local var_30_1 = HeroData:GetHeroData(arg_30_0)

	for iter_30_0, iter_30_1 in ipairs(var_30_1.skillAttrList or {}) do
		if iter_30_1.index == arg_30_1 then
			return iter_30_1.level
		end
	end

	return 0
end

function var_0_0.GetIsCanSkillUpNew(arg_31_0, arg_31_1)
	local var_31_0 = HeroData:GetHeroData(arg_31_0)

	for iter_31_0, iter_31_1 in ipairs(var_31_0.skill) do
		if SkillTools.GetIsCanUpNew(iter_31_1.skill_id, iter_31_1.skill_level, arg_31_1) then
			return true
		end
	end

	return false
end

function var_0_0.GetHeroSkillInfo(arg_32_0, arg_32_1)
	local var_32_0 = {}
	local var_32_1 = HeroData:GetHeroData(arg_32_0)

	for iter_32_0, iter_32_1 in ipairs(var_32_1.skill) do
		var_32_0[iter_32_1.skill_id] = iter_32_1.skill_level
	end

	local var_32_2 = {}

	for iter_32_2, iter_32_3 in ipairs(HeroCfg[arg_32_0].skills) do
		local var_32_3 = var_0_0.GetHeroSkillAddLevel(var_32_1, iter_32_3)

		if SkillTools.GetIsDodgeSkill(iter_32_3) then
			var_32_3 = 0
		end

		table.insert(var_32_2, {
			id = iter_32_3,
			heroId = arg_32_0,
			lv = var_32_0[iter_32_3],
			isCanUp = SkillTools.GetIsCanUp(iter_32_3, var_32_0[iter_32_3]),
			addSkillLv = var_32_3
		})
	end

	if arg_32_1 == true then
		for iter_32_4, iter_32_5 in ipairs(var_32_2) do
			iter_32_5.lv = 1
			iter_32_5.isCanUp = false
			iter_32_5.addSkillLv = 0
		end
	end

	return var_32_2
end

function var_0_0.GetHeroSkillAddLevel(arg_33_0, arg_33_1)
	local var_33_0 = arg_33_0.id or arg_33_0.hero_id
	local var_33_1 = HeroCfg[var_33_0]
	local var_33_2 = table.indexof(var_33_1.skills, arg_33_1)

	if var_33_2 then
		local var_33_3 = arg_33_0.star
		local var_33_4 = {}
		local var_33_5 = var_33_1.star_up_skill_template
		local var_33_6 = var_0_0.GetStageListWithStarTemplateAndStarSkillType(var_33_5, HeroConst.HERO_STAR_SKILL_TYPE.SKILL_UP)
		local var_33_7 = var_0_0.GetStageDicWithStarTemplateAndStarSkillType(var_33_5, HeroConst.HERO_STAR_SKILL_TYPE.SKILL_UP)

		for iter_33_0, iter_33_1 in ipairs(var_33_6) do
			if iter_33_1 <= var_33_3 then
				local var_33_8 = var_33_7[iter_33_1]
				local var_33_9 = HeroStarSkillCfg[var_33_8]

				for iter_33_2, iter_33_3 in pairs(var_33_9.params) do
					var_33_4[iter_33_3[1]] = (var_33_4[iter_33_3[1]] or 0) + iter_33_3[2]
				end
			else
				break
			end
		end

		return var_33_4[var_33_2] or 0
	end

	return 0
end

function var_0_0.CountTransitionTotalSkill(arg_34_0, arg_34_1)
	local var_34_0 = HeroTools.GetHeroEquipSkillAddLevel(arg_34_0)
	local var_34_1 = arg_34_0.transition
	local var_34_2 = {}
	local var_34_3 = {}

	for iter_34_0, iter_34_1 in ipairs(arg_34_1 or {}) do
		if iter_34_1.prefab_id ~= 0 then
			var_34_3[EquipCfg[iter_34_1.prefab_id].pos] = iter_34_1
		end
	end

	local var_34_4 = GameSetting.exclusive_open_need.value[1]

	for iter_34_2, iter_34_3 in ipairs(var_34_1) do
		local var_34_5 = var_34_3[iter_34_3.slot_id]

		if var_34_5 and var_34_4 <= var_34_5:GetLevel() then
			local var_34_6 = iter_34_3.skill_list

			for iter_34_4, iter_34_5 in ipairs(var_34_6) do
				local var_34_7 = iter_34_5.skill_id

				if not var_34_2[var_34_7] then
					var_34_2[var_34_7] = 0
				end

				var_34_2[var_34_7] = var_34_2[var_34_7] + iter_34_5.skill_level
			end
		end
	end

	local var_34_8 = 0

	for iter_34_6, iter_34_7 in pairs(var_34_2) do
		var_34_8 = var_34_8 + iter_34_7 + var_34_0
	end

	return var_34_8
end

function var_0_0.CalTransitionSkillAttribute(arg_35_0, arg_35_1)
	local var_35_0 = {}
	local var_35_1 = {}
	local var_35_2 = {}
	local var_35_3 = arg_35_0.transition
	local var_35_4 = HeroTools.GetHeroEquipSkillAddLevel(arg_35_0)
	local var_35_5 = GameSetting.exclusive_skill_level_up_type.value
	local var_35_6 = {}

	for iter_35_0, iter_35_1 in ipairs(arg_35_1) do
		if iter_35_1.prefab_id ~= 0 then
			var_35_6[EquipCfg[iter_35_1.prefab_id].pos] = iter_35_1
		end
	end

	local var_35_7 = {}
	local var_35_8 = {}
	local var_35_9 = {}

	for iter_35_2, iter_35_3 in pairs(var_35_3) do
		local var_35_10 = var_35_6[iter_35_2]

		if var_35_10 and EquipTools.CountEquipLevel(var_35_10) >= GameSetting.exclusive_open_need.value[1] then
			for iter_35_4, iter_35_5 in ipairs(iter_35_3.skill_list) do
				local var_35_11 = iter_35_5.skill_id

				if EquipSkillCfg[var_35_11].equip_effect_id == 0 then
					local var_35_12 = false

					for iter_35_6, iter_35_7 in ipairs(var_35_5) do
						if var_35_11 == iter_35_7[1] then
							var_35_12 = iter_35_7[2]

							break
						end
					end

					if var_35_12 then
						var_35_9[var_35_11] = (var_35_9[var_35_11] or 0) + iter_35_5.skill_level
					else
						var_35_7[var_35_11] = (var_35_7[var_35_11] or 0) + iter_35_5.skill_level
					end
				else
					var_35_8[var_35_11] = (var_35_8[var_35_11] or 0) + iter_35_5.skill_level
				end
			end
		end
	end

	for iter_35_8, iter_35_9 in pairs(var_35_7) do
		local var_35_13 = EquipSkillCfg[iter_35_8]
		local var_35_14 = var_35_13.attribute
		local var_35_15 = var_35_13.upgrade * (iter_35_9 + var_35_4)

		var_35_0[var_35_14] = (var_35_0[var_35_14] or 0) + var_35_15
	end

	for iter_35_10, iter_35_11 in pairs(var_35_8) do
		local var_35_16 = EquipSkillCfg[iter_35_10]
		local var_35_17 = iter_35_11 + var_35_4

		var_35_1[iter_35_10] = (var_35_1[iter_35_10] or 0) + var_35_17
	end

	local var_35_18 = HeroCfg[arg_35_0.id].skills

	for iter_35_12, iter_35_13 in pairs(var_35_9) do
		local var_35_19 = EquipSkillCfg[iter_35_12]
		local var_35_20 = iter_35_13 + var_35_4

		for iter_35_14, iter_35_15 in ipairs(var_35_5) do
			if iter_35_12 == iter_35_15[1] then
				var_35_2[var_35_18[iter_35_15[2]]] = var_35_19.upgrade * var_35_20

				break
			end
		end
	end

	return var_35_0, var_35_1, var_35_2
end

function var_0_0.GetHeroEquipSkillAddLevel(arg_36_0)
	local var_36_0 = arg_36_0.id or arg_36_0.hero_id
	local var_36_1 = HeroCfg[var_36_0]
	local var_36_2 = arg_36_0.star
	local var_36_3 = var_36_1.star_up_skill_template

	if var_36_2 >= var_0_0.GetStageListWithStarTemplateAndStarSkillType(var_36_3, HeroConst.HERO_STAR_SKILL_TYPE.EQUIP_UP)[1] then
		return 1
	end

	return 0
end

function var_0_0.GetHeroWeaponAddLevel(arg_37_0)
	local var_37_0 = arg_37_0.id
	local var_37_1 = HeroCfg[var_37_0]
	local var_37_2 = arg_37_0.star
	local var_37_3 = var_37_1.star_up_skill_template

	if var_37_2 >= var_0_0.GetStageListWithStarTemplateAndStarSkillType(var_37_3, HeroConst.HERO_STAR_SKILL_TYPE.WEAPON_UP)[1] then
		return 2
	end

	return 0
end

function var_0_0.GetIsSuitNumCut(arg_38_0)
	if not arg_38_0 then
		return false
	end

	local var_38_0 = arg_38_0.id or arg_38_0.hero_id
	local var_38_1 = HeroCfg[var_38_0]
	local var_38_2 = arg_38_0.star or arg_38_0.hero_star

	if var_38_2 and HeroStarCfg[var_38_2] then
		local var_38_3 = var_38_1.star_up_skill_template

		if var_38_2 >= var_0_0.GetStageListWithStarTemplateAndStarSkillType(var_38_3, HeroConst.HERO_STAR_SKILL_TYPE.EQUIP_SUIT)[1] then
			return true
		end
	end

	return false
end

function var_0_0.CountHeroTotalSkilllv(arg_39_0)
	local var_39_0 = HeroData:GetHeroList()[arg_39_0]
	local var_39_1 = 0

	for iter_39_0, iter_39_1 in ipairs(var_39_0.skill) do
		local var_39_2 = var_0_0.GetHeroSkillAddLevel(var_39_0, iter_39_1.skill_id)

		var_39_1 = var_39_1 + iter_39_1.skill_level + var_39_2
	end

	return var_39_1
end

function var_0_0.GetEquipSuitEffect(arg_40_0)
	local var_40_0 = {}

	for iter_40_0, iter_40_1 in ipairs(arg_40_0) do
		if iter_40_1.equip_id ~= 0 then
			local var_40_1 = EquipData:GetEquipList()[iter_40_1.equip_id].prefab_id
			local var_40_2 = EquipCfg[var_40_1].type

			var_40_0[var_40_2] = (var_40_0[var_40_2] or 0) + 1
		end
	end

	local var_40_3 = {}
	local var_40_4 = 0

	for iter_40_2, iter_40_3 in pairs(var_40_0) do
		local var_40_5 = EquipSuitCfg.get_id_list_by_suit[iter_40_2]

		for iter_40_4, iter_40_5 in ipairs(var_40_5) do
			local var_40_6 = EquipSuitCfg[iter_40_5]

			if iter_40_3 >= var_40_6.need then
				if var_40_3[var_40_6.suit] == nil then
					var_40_3[var_40_6.suit] = {}
					var_40_4 = var_40_4 + 1
				end

				table.insert(var_40_3[var_40_6.suit], var_40_6)
			end
		end
	end

	return var_40_3, var_40_4
end

function var_0_0.GetIsCanSkillUp(arg_41_0)
	local var_41_0 = HeroCfg[arg_41_0.id]

	if arg_41_0.unlock == 0 then
		return false
	end

	local var_41_1 = {}

	for iter_41_0, iter_41_1 in ipairs(arg_41_0.skill) do
		var_41_1[iter_41_1.skill_id] = iter_41_1.skill_level
	end

	for iter_41_2, iter_41_3 in ipairs(var_41_0.skills) do
		if SkillTools.GetIsCanUp(iter_41_3, var_41_1[iter_41_3]) then
			return true
		end
	end

	return false
end

function var_0_0.GetIsCanUpStar(arg_42_0)
	local var_42_0 = HeroCfg[arg_42_0.id]

	if arg_42_0.unlock == 0 then
		if GameSetting.unlock_hero_need.value[var_42_0.rare] <= arg_42_0.piece then
			return true
		end
	else
		local var_42_1 = arg_42_0.star

		if var_42_1 >= HeroConst.MAX_STAR_UP_ID then
			return false
		end

		local var_42_2 = ItemTools.getItemNum(CurrencyConst.CURRENCY_TYPE_GOLD)
		local var_42_3 = HeroStarCfg[var_42_1].star_up
		local var_42_4 = HeroStarCfg[var_42_1].gold_cost

		if var_42_3 <= arg_42_0.piece and var_42_4 <= var_42_2 then
			return true
		end
	end

	return false
end

function var_0_0.SortByChat(arg_43_0, arg_43_1, arg_43_2)
	local var_43_0 = {}
	local var_43_1 = {}

	for iter_43_0, iter_43_1 in pairs(arg_43_0) do
		if type(iter_43_1) == "table" and iter_43_1.unlock == 1 then
			var_43_1[iter_43_0] = iter_43_1.chat_unread

			table.insert(var_43_0, iter_43_0)
		end
	end

	table.sort(var_43_0)
	table.sort(var_43_0, function(arg_44_0, arg_44_1)
		return var_43_1[arg_44_0] > var_43_1[arg_44_1]
	end)

	if var_0_0.lastList then
		local var_43_2 = arg_43_2 - arg_43_1
		local var_43_3 = var_0_0.lastList[var_43_2]

		if var_43_3 and var_43_3 ~= var_43_0[var_43_2] then
			local var_43_4 = table.indexof(var_43_0, var_43_3)

			if var_43_4 then
				table.remove(var_43_0, var_43_4)
				table.insert(var_43_0, var_43_2, var_43_3)
			end
		end
	end

	var_0_0.lastList = var_43_0

	return var_43_0
end

function var_0_0.SortByChat2(arg_45_0)
	if var_0_0.chatList then
		return var_0_0.chatList
	end

	local var_45_0 = {}
	local var_45_1 = {}

	for iter_45_0, iter_45_1 in pairs(arg_45_0) do
		if type(iter_45_1) == "table" and iter_45_1.unlock == 1 then
			var_45_1[iter_45_0] = iter_45_1.chat_unread

			table.insert(var_45_0, iter_45_0)
		end
	end

	table.sort(var_45_0)
	table.sort(var_45_0, function(arg_46_0, arg_46_1)
		return var_45_1[arg_46_0] > var_45_1[arg_46_1]
	end)

	var_0_0.chatList = var_45_0

	return var_45_0
end

function var_0_0.HeroUsingSkinInfo(arg_47_0)
	local var_47_0 = arg_47_0
	local var_47_1 = HeroData:GetHeroData(arg_47_0)
	local var_47_2 = var_47_1 and var_47_1.using_skin or 0

	if var_47_2 == 0 then
		var_47_2 = var_47_0
	end

	return SkinCfg[var_47_2]
end

function var_0_0.SetHeroModelWeaponActivity(arg_48_0, arg_48_1)
	LuaForUtil.ShowWeapon(arg_48_0, arg_48_1)
end

function var_0_0.HeroUnlockSkinS(arg_49_0)
	local var_49_0 = HeroData:GetHeroData(arg_49_0)
	local var_49_1 = {}

	for iter_49_0, iter_49_1 in ipairs(var_49_0.unlocked_skin) do
		table.insert(var_49_1, iter_49_1.skin_id)
	end

	table.insert(var_49_1, arg_49_0)

	return var_49_1
end

function var_0_0.CanChangeSkin(arg_50_0)
	if var_0_0.GetSkinIsUnlock(arg_50_0) then
		return false
	end

	local var_50_0 = var_0_0.GetSkinChangeItem(arg_50_0)

	if not var_50_0 then
		return false
	end

	if ItemTools.getItemNum(var_50_0) > 0 then
		return true
	end
end

function var_0_0.GetSkinIsUnlock(arg_51_0)
	local var_51_0 = SkinCfg[arg_51_0].hero
	local var_51_1 = HeroTools.HeroUnlockSkinS(var_51_0)

	for iter_51_0, iter_51_1 in ipairs(var_51_1) do
		if iter_51_1 == arg_51_0 then
			return true
		end
	end

	return false
end

function var_0_0.GetSkinIsCanUnLock(arg_52_0)
	if SkinCfg[arg_52_0].unlock_id_list[1] then
		return true
	end

	return false
end

function var_0_0.GetHasOwnedSkin(arg_53_0)
	local var_53_0 = SkinCfg[arg_53_0].hero
	local var_53_1 = HeroData:GetHeroData(var_53_0)
	local var_53_2 = {}

	if arg_53_0 == var_53_0 then
		return true
	end

	for iter_53_0, iter_53_1 in ipairs(var_53_1.unlocked_skin) do
		if iter_53_1.skin_id == arg_53_0 and iter_53_1.time == 0 then
			return true
		end
	end

	return false
end

function var_0_0.GetIsLimitTimeSkin(arg_54_0)
	local var_54_0 = SkinCfg[arg_54_0].hero
	local var_54_1 = HeroData:GetHeroData(var_54_0)
	local var_54_2 = {}

	for iter_54_0, iter_54_1 in ipairs(var_54_1.unlocked_skin) do
		if iter_54_1.skin_id == arg_54_0 and iter_54_1.time ~= 0 then
			return true
		end
	end

	return false
end

function var_0_0.GetSkinChangeItem(arg_55_0)
	return SkinCfg[arg_55_0].change_item
end

function var_0_0.GetHeadSprite(arg_56_0)
	return getSpriteViaConfig("HeroLittleIcon", arg_56_0)
end

function var_0_0.GetSmallHeadSprite(arg_57_0)
	return getSpriteViaConfig("HeroItemshead", arg_57_0)
end

function var_0_0.GetHeroAttackRangeIcon(arg_58_0)
	local var_58_0

	for iter_58_0, iter_58_1 in ipairs(GameDisplayCfg.hero_range_type_tag.value) do
		if iter_58_1[1] == CharactorParamCfg[arg_58_0].RangeType then
			var_58_0 = iter_58_1[2]

			break
		end
	end

	return getSprite("Atlas/Hero_arrtAtlas", var_58_0)
end

function var_0_0.GetHeroRaceIcon(arg_59_0)
	local var_59_0 = HeroCfg[arg_59_0].race

	return var_0_0.GetRaceIcon(var_59_0)
end

function var_0_0.GetRaceIcon(arg_60_0)
	local var_60_0

	for iter_60_0, iter_60_1 in ipairs(GameDisplayCfg.hero_race_type_tag.value) do
		if iter_60_1[1] == arg_60_0 then
			var_60_0 = iter_60_1[2]
		end
	end

	return getSprite("Atlas/CampItemAtlas", var_60_0)
end

function var_0_0.GetHeroSkillAttributeIcon(arg_61_0, arg_61_1)
	if type(HeroCfg[arg_61_0].ATK_attribute) ~= "table" or not HeroCfg[arg_61_0].ATK_attribute[1] then
		print(string.format("%s角色表未配置ATK_attribute", arg_61_0))

		return nil
	end

	return var_0_0.GetSkillAttributeIcon(HeroCfg[arg_61_0].ATK_attribute[1], arg_61_1)
end

function var_0_0.GetSkillAttributeIcon(arg_62_0, arg_62_1)
	if not arg_62_0 then
		return getSprite("Atlas/Hero_arrtAtlas", "icon_none")
	end

	local var_62_0

	if arg_62_1 then
		for iter_62_0, iter_62_1 in ipairs(GameDisplayCfg.hero_atack_type_white_tag.value) do
			if iter_62_1[1] == arg_62_0 then
				var_62_0 = iter_62_1[2]

				break
			end
		end
	else
		for iter_62_2, iter_62_3 in ipairs(GameDisplayCfg.hero_atack_type_tag.value) do
			if iter_62_3[1] == arg_62_0 then
				var_62_0 = iter_62_3[2]

				break
			end
		end
	end

	return getSprite("Atlas/Hero_arrtAtlas", var_62_0)
end

function var_0_0.GetHeroSkillMechanismIcon(arg_63_0)
	local var_63_0

	for iter_63_0, iter_63_1 in ipairs(GameDisplayCfg.hero_mechanism_type_tag.value) do
		if iter_63_1[1] == HeroCfg[arg_63_0].mechanism_type[1] then
			var_63_0 = iter_63_1[2]

			break
		end
	end

	return getSprite("Atlas/Hero_arrtAtlas", var_63_0)
end

function var_0_0.GetHeroRareSprite(arg_64_0)
	return var_0_0.GetRareSprite(HeroCfg[arg_64_0].rare)
end

function var_0_0.GetRareSprite(arg_65_0)
	return getSprite("Atlas/SystemHeroGradeAtlas", string.format("star_%s", arg_65_0))
end

function var_0_0.GetHeroCurrentMaxLevel(arg_66_0)
	local var_66_0 = arg_66_0.break_level or 0
	local var_66_1 = HeroCfg[arg_66_0.id]

	return HeroTools.GetHeroBreakConfig(var_66_1.race, var_66_0).max_level
end

function var_0_0.GetHeroMaxLevel(arg_67_0)
	local var_67_0 = HeroCfg[arg_67_0.id]

	return HeroBreakCfg[HeroBreakCfg.get_id_list_by_race[var_67_0.race][#HeroBreakCfg.get_id_list_by_race[var_67_0.race]]].max_level
end

function var_0_0.GetHeroBreakConfig(arg_68_0, arg_68_1)
	for iter_68_0, iter_68_1 in ipairs(HeroBreakCfg.all) do
		if HeroBreakCfg[iter_68_1].race == arg_68_0 and HeroBreakCfg[iter_68_1].break_times == arg_68_1 then
			return HeroBreakCfg[iter_68_1]
		end
	end

	error(string.format("在hero_break.csv中找不到race=%d,breakLevel=%d的项", arg_68_0, arg_68_1))

	return nil
end

function var_0_0.GetHeroServantInfo(arg_69_0)
	local var_69_0 = WeaponServantData.GetWeaponServantList()
	local var_69_1 = HeroData:GetHeroList()[arg_69_0].servant_uid

	if var_69_1 == 0 then
		return nil
	end

	return var_69_0[var_69_1]
end

function var_0_0.GetHeroSpecServant(arg_70_0)
	return HeroCfg[arg_70_0].spec_servant
end

function var_0_0.GetHeroProficiency(arg_71_0)
	local var_71_0 = HeroData:GetHeroData(arg_71_0).clear_times

	return (math.min(var_71_0, GameSetting.mastery_level_max.value[1]))
end

function var_0_0.CanBreakHero(arg_72_0)
	local var_72_0 = HeroCfg[arg_72_0]
	local var_72_1 = HeroData:GetHeroData(arg_72_0)

	if var_72_1.unlock and var_72_1.level < HeroConst.HERO_LV_MAX and var_72_1.level >= HeroTools.GetHeroCurrentMaxLevel(var_72_1) then
		-- block empty
	else
		return false
	end

	local var_72_2 = HeroTools.GetHeroBreakConfig(var_72_0.race, var_72_1.break_level or 0)

	if PlayerData:GetPlayerInfo().userLevel < var_72_2.user_level then
		return false
	end

	local var_72_3 = #var_72_2.cost

	for iter_72_0 = 1, var_72_3 do
		local var_72_4 = var_72_2.cost[iter_72_0]

		if not (ItemTools.getItemNum(var_72_4[1]) >= var_72_4[2]) then
			return false
		end
	end

	if ItemTools.getItemNum(CurrencyConst.CURRENCY_TYPE_GOLD) < var_72_2.cost_gold then
		return false
	end

	return true
end

function var_0_0.GetHeroOntologyID(arg_73_0)
	for iter_73_0, iter_73_1 in ipairs(HeroRecordCfg.all) do
		local var_73_0 = HeroRecordCfg[iter_73_1]

		if arg_73_0 == iter_73_1 then
			return iter_73_1, true
		end

		for iter_73_2, iter_73_3 in ipairs(var_73_0.hero_id) do
			if arg_73_0 == iter_73_3 then
				return iter_73_1, false
			end
		end
	end
end

function var_0_0.GetHeroTeachVideo(arg_74_0)
	local var_74_0 = HeroCfg[arg_74_0]

	if HeroData:GetHeroData(arg_74_0).unlock == 0 then
		return nil
	end

	local var_74_1 = var_74_0.study_stage[1]

	if var_74_1 then
		local var_74_2 = TeachStageExInfoCfg[var_74_1]

		if var_74_2 and var_74_2.video_url then
			return var_74_2.video_url
		end
	end
end

function var_0_0.IsSkinUnlock(arg_75_0)
	local var_75_0 = SkinCfg[arg_75_0].hero
	local var_75_1 = HeroTools.HeroUnlockSkinS(var_75_0)

	for iter_75_0, iter_75_1 in ipairs(var_75_1) do
		if iter_75_1 == arg_75_0 then
			return true
		end
	end

	return false
end

function var_0_0.GetShopIdBySkinId(arg_76_0)
	local var_76_0 = SkinIDToGoodIDCfg[arg_76_0]

	if var_76_0 == nil then
		return 0
	end

	for iter_76_0, iter_76_1 in ipairs(var_76_0.goods_id) do
		local var_76_1 = getShopCfg(iter_76_1)

		if var_76_1 and var_76_1.shop_refresh == 3 then
			return iter_76_1
		end
	end

	return 0
end

function var_0_0.IsSkinOnlySellDLC(arg_77_0)
	return var_0_0.GetShopIdBySkinId(arg_77_0) < 0 and true or false
end

function var_0_0.IsSkinOutOfDate(arg_78_0)
	local var_78_0 = var_0_0.GetShopIdBySkinId(arg_78_0)

	if var_78_0 and var_78_0 > 0 then
		local var_78_1 = getShopCfg(var_78_0).shop_id

		return ShopData.IsGoodOutOfDate(var_78_0, var_78_1)
	else
		return true
	end
end

function var_0_0.CanBeDraw(arg_79_0, arg_79_1)
	local var_79_0 = ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.DRAW] or {}

	for iter_79_0, iter_79_1 in ipairs(var_79_0) do
		if ActivityData:GetActivityIsOpen(iter_79_1) then
			local var_79_1 = ActivityDrawPoolCfg[iter_79_1]

			if var_79_1 then
				for iter_79_2, iter_79_3 in ipairs(var_79_1.config_list) do
					if arg_79_1 == iter_79_3 then
						return true
					end
				end
			end
		end
	end

	return false
end

function var_0_0.GetIsHide(arg_80_0)
	return HideInfoData:GetHeroHideList()[arg_80_0] or false
end

function var_0_0.GetIsSkinHide(arg_81_0)
	return HideInfoData:GetSkinHideList()[arg_81_0] or false
end

function var_0_0.GetSkinIsCanUnlockAndGet(arg_82_0)
	if SkinCfg[arg_82_0].unlock_id_list[1] then
		for iter_82_0, iter_82_1 in pairs(SkinCfg[arg_82_0].unlock_id_list) do
			local var_82_0, var_82_1, var_82_2 = IsConditionAchieved(iter_82_1, {
				heroId = SkinCfg[arg_82_0].hero
			})

			if not var_82_0 then
				return false
			end
		end

		return true
	else
		return false
	end
end

local var_0_2 = {}
local var_0_3 = 0

local function var_0_4()
	return var_0_3 < #HeroRecordCfg.all
end

local function var_0_5(arg_84_0)
	local var_84_0 = false

	for iter_84_0 = var_0_3 + 1, #HeroRecordCfg.all do
		local var_84_1 = HeroRecordCfg.all[iter_84_0]
		local var_84_2 = HeroRecordCfg[var_84_1].hero_id

		for iter_84_1, iter_84_2 in pairs(var_84_2) do
			var_0_2[iter_84_2] = var_84_1

			if arg_84_0 == iter_84_2 then
				var_84_0 = true
			end
		end

		var_0_3 = iter_84_0

		if var_84_0 then
			return var_84_1
		end
	end

	return nil
end

local function var_0_6(arg_85_0)
	local var_85_0 = var_0_2[arg_85_0]

	if var_85_0 == nil then
		var_85_0 = var_0_5(arg_85_0)
	end

	return var_85_0
end

function var_0_0.IsSamePerson(arg_86_0, arg_86_1)
	local var_86_0 = var_0_6(arg_86_0)
	local var_86_1 = var_0_6(arg_86_1)

	return var_86_0 ~= nil and var_86_1 ~= nil and var_86_0 == var_86_1
end

function var_0_0.GetInteractionVoiceFileName(arg_87_0)
	local var_87_0 = string.find(arg_87_0, "_")

	return var_87_0 and string.sub(arg_87_0, var_87_0 + 1) or nil
end

function var_0_0.GetUnlockInteractionCfg(arg_88_0, arg_88_1, arg_88_2)
	local var_88_0 = HeroInteractionCfg[arg_88_1]
	local var_88_1 = {}

	for iter_88_0, iter_88_1 in pairs(var_88_0) do
		if string.find(iter_88_0, "_talk") then
			local var_88_2 = var_88_0[iter_88_0]
			local var_88_3 = string.split(iter_88_0, "_")[1]
			local var_88_4 = var_88_0[var_88_3]
			local var_88_5 = var_88_0[var_88_3 .. "_talk"]
			local var_88_6 = var_88_0[var_88_3 .. "_delay"]
			local var_88_7 = var_88_0[var_88_3 .. "_weight"]
			local var_88_8 = {}
			local var_88_9 = {}
			local var_88_10 = {}
			local var_88_11 = {}

			var_88_1[var_88_3] = var_88_8
			var_88_1[var_88_3 .. "_talk"] = var_88_9
			var_88_1[var_88_3 .. "_delay"] = var_88_10
			var_88_1[var_88_3 .. "_weight"] = var_88_11

			for iter_88_2, iter_88_3 in ipairs(var_88_2) do
				local var_88_12 = HeroTools.GetInteractionVoiceFileName(iter_88_3)

				if HeroVoiceCfg.get_id_list_by_file[var_88_12] then
					local var_88_13 = HeroVoiceCfg.get_id_list_by_file[var_88_12][1]

					if HeroVoiceCfg[var_88_13].use_skin_id == 0 and not arg_88_0:IsUnlockVoice(arg_88_1, var_88_13) then
						-- block empty
					else
						local var_88_14 = var_88_4[iter_88_2]
						local var_88_15 = string.split(var_88_14, "__")
						local var_88_16 = true

						if var_88_15[2] then
							if #arg_88_2 > 0 then
								local var_88_17 = string.split(var_88_15[2], "_")

								for iter_88_4, iter_88_5 in ipairs(arg_88_2) do
									if not table.indexof(var_88_17, iter_88_5) then
										var_88_16 = false

										break
									end
								end
							else
								var_88_16 = false
							end
						end

						if var_88_16 then
							table.insert(var_88_8, var_88_14)
							table.insert(var_88_9, var_88_5[iter_88_2])

							if var_88_6 then
								table.insert(var_88_10, var_88_6[iter_88_2])
							end

							if var_88_7 then
								table.insert(var_88_11, var_88_7[iter_88_2])
							end
						end
					end
				end
			end
		end
	end

	return var_88_1
end

function var_0_0.IsUnlockVoice(arg_89_0, arg_89_1, arg_89_2)
	if DormHeroTools:IsVoiceNeedUnlock(arg_89_2, arg_89_1) and DormHeroTools:GetDormLevelByHeroID(arg_89_1) < DormHeroTools:GetVoiceUnlockLevel(arg_89_1, arg_89_2) then
		return false
	end

	local var_89_0 = HeroVoiceCfg[arg_89_2].unlock_condition

	if var_89_0 == 0 then
		return true
	else
		return IsConditionAchieved(var_89_0, {
			heroId = arg_89_1
		})
	end
end

function var_0_0.GetModuleAttribute(arg_90_0)
	local var_90_0 = arg_90_0.id
	local var_90_1 = {
		0,
		0,
		0,
		0
	}
	local var_90_2 = HeroTools.GetModuleEffectByHeroAndLevel(var_90_0, arg_90_0.weapon_module_level)

	for iter_90_0, iter_90_1 in pairs(var_90_2) do
		local var_90_3 = WeaponModuleEffectCfg[iter_90_1]

		if var_90_3.type == 1 then
			for iter_90_2, iter_90_3 in pairs(var_90_3.attributes) do
				var_90_1[iter_90_3[1]] = var_90_1[iter_90_3[1]] + iter_90_3[2]
			end
		end
	end

	return var_90_1
end

function var_0_0.GetSkillAttribute(arg_91_0)
	local var_91_0 = arg_91_0.id
	local var_91_1 = {}

	for iter_91_0, iter_91_1 in ipairs(arg_91_0.skillAttrList) do
		local var_91_2 = SkillTools.GetSkillAttrCfg(var_91_0, iter_91_1.index, iter_91_1.level)

		if var_91_2 then
			for iter_91_2, iter_91_3 in pairs(var_91_2.attr) do
				var_91_1[iter_91_3[1]] = iter_91_3[2]
			end
		end
	end

	return var_91_1
end

local function var_0_7(arg_92_0, arg_92_1, arg_92_2)
	if arg_92_1 == nil then
		return arg_92_0
	end

	arg_92_2 = arg_92_2 or "\n"

	if arg_92_0 == nil then
		return arg_92_1
	else
		return arg_92_0 .. arg_92_2 .. arg_92_1
	end
end

function var_0_0.GetModuleAllDes(arg_93_0, arg_93_1, arg_93_2)
	local var_93_0
	local var_93_1
	local var_93_2
	local var_93_3
	local var_93_4 = HeroData:GetHeroList()[arg_93_1].servant_uid

	if var_93_4 ~= HeroTools.GetHeroSpecServant(arg_93_1) then
		var_93_4 = 0
	end

	for iter_93_0, iter_93_1 in pairs(arg_93_0) do
		local var_93_5 = WeaponModuleEffectCfg[iter_93_1].type

		if var_93_5 == 1 then
			if var_93_0 == nil then
				var_93_0 = {
					iter_93_1
				}
			else
				table.insert(var_93_0, iter_93_1)
			end
		elseif var_93_5 == 2 then
			var_93_1 = var_0_7(var_93_1, SkillTools.GetSkillModuleDes(iter_93_1))
		elseif var_93_5 == 3 then
			var_93_2 = var_0_7(var_93_2, AstrolabeTools.GetAstrolabeModuleDes(iter_93_1, var_93_4), "\n\n")
		elseif var_93_5 == 4 then
			var_93_3 = var_0_7(var_93_3, WeaponTools.GetWeaponModuleDes(iter_93_1, arg_93_2), "\n\n")
		elseif var_93_5 == 5 then
			var_93_1 = var_0_7(var_93_1, SkillTools.GetServantSkillModuleDes(iter_93_1))
		elseif var_93_5 == 6 then
			var_93_1 = var_0_7(var_93_1, SkillTools.GetAstrolabeSkillModuleDes(iter_93_1))
		end
	end

	return var_93_0, var_93_1, var_93_2, var_93_3
end

function var_0_0.MergeModuleAttribute(arg_94_0)
	local var_94_0 = {}

	for iter_94_0, iter_94_1 in pairs(arg_94_0) do
		local var_94_1 = WeaponModuleEffectCfg[iter_94_1].attributes

		for iter_94_2, iter_94_3 in pairs(var_94_1) do
			if var_94_0[iter_94_3[1]] then
				var_94_0[iter_94_3[1]] = var_94_0[iter_94_3[1]] + iter_94_3[2]
			else
				var_94_0[iter_94_3[1]] = iter_94_3[2]
			end
		end
	end

	return var_94_0
end

function var_0_0.CheckModulePieceCanEnter()
	local var_95_0 = ItemCfg.get_id_list_by_sub_type[ItemConst.ITEM_SUB_TYPE.MODULE_PIECE]

	for iter_95_0, iter_95_1 in pairs(var_95_0) do
		if ItemTools.getItemNum(iter_95_1) > 0 then
			return true
		end
	end

	return false
end

function var_0_0.GetModuleEffectByHeroAndLevel(arg_96_0, arg_96_1)
	local var_96_0 = {}

	if arg_96_0 and arg_96_1 then
		local var_96_1 = WeaponModuleCfg[arg_96_0]

		if var_96_1 then
			for iter_96_0 = 1, arg_96_1 do
				for iter_96_1, iter_96_2 in pairs(var_96_1.skill[iter_96_0]) do
					table.insert(var_96_0, iter_96_2)
				end
			end
		end
	end

	return var_96_0
end

function var_0_0.GetStageDicWithStarTemplateAndStarSkillType(arg_97_0, arg_97_1)
	if HeroStarUpTemplateCfg.template_dic[arg_97_0] and HeroStarUpTemplateCfg.template_dic[arg_97_0][arg_97_1] then
		return HeroStarUpTemplateCfg.template_dic[arg_97_0][arg_97_1].stage_dic
	end

	return {}
end

function var_0_0.GetStageListWithStarTemplateAndStarSkillType(arg_98_0, arg_98_1)
	if HeroStarUpTemplateCfg.template_dic[arg_98_0] and HeroStarUpTemplateCfg.template_dic[arg_98_0][arg_98_1] then
		return HeroStarUpTemplateCfg.template_dic[arg_98_0][arg_98_1].stage_list
	end

	return {}
end

function var_0_0.GetHeroNameLinkChar()
	local var_99_0
	local var_99_1 = SettingData:GetCurrentLanguage()

	return (var_99_1 == "en" or var_99_1 == "fr" or var_99_1 == "de") and " - " or var_99_1 == "jp" and "·" or "·"
end

function var_0_0.GetHeroFullName(arg_100_0)
	local var_100_0 = HeroCfg[arg_100_0]

	return GetI18NText(var_100_0.name) .. HeroTools.GetHeroNameLinkChar() .. GetI18NText(var_100_0.suffix)
end

function var_0_0.GetModulePowersByHeroIDAndLevel(arg_101_0, arg_101_1, arg_101_2)
	local var_101_0 = {}
	local var_101_1 = WeaponModuleCfg[arg_101_1]

	if var_101_1 then
		for iter_101_0 = 1, arg_101_2 do
			local var_101_2 = var_101_1.skill[iter_101_0]

			for iter_101_1, iter_101_2 in pairs(var_101_2) do
				table.insert(var_101_0, iter_101_2)
			end
		end
	end

	return var_101_0
end

function var_0_0.SetHeroNewTagRed(arg_102_0, arg_102_1, arg_102_2, arg_102_3)
	local var_102_0 = getData("heroNew", arg_102_1) or {}

	if var_102_0 then
		local var_102_1 = 0

		for iter_102_0, iter_102_1 in ipairs(var_102_0) do
			if iter_102_1 == arg_102_0 then
				var_102_1 = iter_102_0

				break
			end
		end

		local var_102_2 = false

		if var_102_1 > 0 then
			if not arg_102_3 then
				var_102_2 = true

				table.remove(var_102_0, var_102_1)
				manager.redPoint:setTip(arg_102_2, 0, RedPointStyle.SHOW_NEW_TAG)
			end
		elseif arg_102_3 then
			var_102_2 = true

			table.insert(var_102_0, arg_102_0)
			manager.redPoint:setTip(arg_102_2, 1, RedPointStyle.SHOW_NEW_TAG)
		end

		if var_102_2 then
			saveData("heroNew", arg_102_1, var_102_0)
		end
	end
end

function var_0_0.DispatchAllHeroNewRed(arg_103_0, arg_103_1)
	local var_103_0 = getData("heroNew", arg_103_0) or {}

	for iter_103_0, iter_103_1 in ipairs(var_103_0) do
		local var_103_1 = arg_103_1 .. iter_103_1

		manager.redPoint:setTip(var_103_1, 1, RedPointStyle.SHOW_NEW_TAG)
	end
end

function var_0_0.GetHeroShowData(arg_104_0, arg_104_1)
	local var_104_0 = {}

	if arg_104_1 then
		CommonFilterData:ClearFilter(Filter_Root_Define.Hero_Filter_List.filter_id)
	end

	local var_104_1 = CommonFilterData:IsAll(Filter_Root_Define.Hero_Filter_List.filter_id) or arg_104_1

	if var_104_1 then
		return arg_104_0
	end

	for iter_104_0, iter_104_1 in pairs(arg_104_0) do
		local var_104_2 = not var_0_0.GetIsHide(iter_104_1.id)

		if var_104_2 and not var_104_1 then
			local var_104_3 = HeroCfg[iter_104_1.id]
			local var_104_4 = CommonFilterData:SpecificHasFlag(Filter_Root_Define.Hero_Filter_List.filter_id, Filter_Group_Define.RACE.groupID, {
				Filter_Tags_Define["Race" .. var_104_3.race]
			})
			local var_104_5 = CommonFilterData:SpecificHasFlag(Filter_Root_Define.Hero_Filter_List.filter_id, Filter_Group_Define.ARRT.groupID, {
				Filter_Tags_Define["ARRT" .. var_104_3.ATK_attribute[1]]
			})
			local var_104_6 = CommonFilterData:SpecificHasFlag(Filter_Root_Define.Hero_Filter_List.filter_id, Filter_Group_Define.MECHAINISMTYPE.groupID, {
				Filter_Tags_Define["MECHAINISM" .. var_104_3.mechanism_type[1]]
			})

			var_104_2 = var_104_4 and var_104_5 and var_104_6
		end

		if var_104_2 then
			table.insert(var_104_0, iter_104_1)
		end
	end

	return var_104_0
end

function var_0_0.GetHeroShowIDList(arg_105_0, arg_105_1)
	local var_105_0 = {}

	if arg_105_1 then
		CommonFilterData:ClearFilter(Filter_Root_Define.Hero_Filter_List.filter_id)
	end

	local var_105_1 = CommonFilterData:IsAll(Filter_Root_Define.Hero_Filter_List.filter_id) or arg_105_1

	if var_105_1 then
		return arg_105_0
	end

	for iter_105_0, iter_105_1 in pairs(arg_105_0) do
		local var_105_2 = not var_0_0.GetIsHide(iter_105_1)

		if var_105_2 and not var_105_1 then
			local var_105_3 = HeroCfg[iter_105_1]
			local var_105_4 = CommonFilterData:SpecificHasFlag(Filter_Root_Define.Hero_Filter_List.filter_id, Filter_Group_Define.RACE.groupID, {
				Filter_Tags_Define["Race" .. var_105_3.race]
			})
			local var_105_5 = CommonFilterData:SpecificHasFlag(Filter_Root_Define.Hero_Filter_List.filter_id, Filter_Group_Define.ARRT.groupID, {
				Filter_Tags_Define["ARRT" .. var_105_3.ATK_attribute[1]]
			})
			local var_105_6 = CommonFilterData:SpecificHasFlag(Filter_Root_Define.Hero_Filter_List.filter_id, Filter_Group_Define.MECHAINISMTYPE.groupID, {
				Filter_Tags_Define["MECHAINISM" .. var_105_3.mechanism_type[1]]
			})

			var_105_2 = var_105_4 and var_105_5 and var_105_6
		end

		if var_105_2 then
			table.insert(var_105_0, iter_105_1)
		end
	end

	return var_105_0
end

function var_0_0.IsSpHero(arg_106_0)
	local var_106_0 = HeroCfg[arg_106_0]

	if var_106_0 then
		return var_106_0.role_type == 1
	end

	return false
end

function var_0_0.FormatFilterHeroDataList(arg_107_0, arg_107_1, arg_107_2, arg_107_3)
	local var_107_0 = HeroViewDataProxy.New(arg_107_0)

	var_107_0:SetTempHeroList(arg_107_3)

	local var_107_1 = {}

	for iter_107_0, iter_107_1 in ipairs(arg_107_1) do
		local var_107_2 = var_107_0:GetHeroData(iter_107_1).tempID

		var_107_1[iter_107_0] = {
			id = iter_107_1,
			trialID = var_107_2,
			type = arg_107_2,
			heroViewProxy = var_107_0
		}
	end

	return var_107_1
end

function var_0_0.IsNPC(arg_108_0)
	if arg_108_0 and HeroCfg[arg_108_0] then
		return HeroCfg[arg_108_0].private ~= 0
	end

	return false
end

function var_0_0.NeedHideInfo(arg_109_0)
	if arg_109_0 and HeroCfg[arg_109_0] then
		return HeroCfg[arg_109_0].hide_info == 1
	end

	return false
end

return var_0_0
