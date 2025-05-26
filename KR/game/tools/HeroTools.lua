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

function var_0_0.IsVoiceDescValid(arg_11_0, arg_11_1)
	if SDKTools.GetIsOverSea() then
		local var_11_0 = HeroVoiceDescCfg.Get(arg_11_0, arg_11_1)

		if var_11_0 == nil or var_11_0 == "" then
			return false
		end
	end

	return true
end

function var_0_0.CheckInsteractionTalkValid(arg_12_0)
	if arg_12_0 ~= nil and arg_12_0 ~= "" and SDKTools.GetIsOverSea() then
		local var_12_0 = string.split(arg_12_0, "_")
		local var_12_1 = var_12_0[1]
		local var_12_2 = HeroVoiceCfg.get_id_list_by_file[var_12_0[2]][1]
		local var_12_3 = tonumber(var_12_1)

		return var_0_0.IsVoiceDescValid(var_12_3, var_12_2)
	end

	return true
end

function var_0_0.PlayTalk(arg_13_0, arg_13_1, arg_13_2, arg_13_3)
	local var_13_0 = HeroCfg[arg_13_0]

	arg_13_2 = arg_13_2 or 1

	HeroTools.StopTalk()
	manager.audio:PlayUIAudioByVoice(arg_13_1)

	if arg_13_2 == 1 then
		if arg_13_3 ~= nil then
			LuaForUtil.PlayVoiceWithCriLipsync(arg_13_3, string.format("vo_sys_%d", arg_13_0), string.format("v_s_%d_%s", arg_13_0, arg_13_1), string.format("vo_sys_%d.awb", arg_13_0))
		else
			manager.audio:PlayVoice(string.format("vo_sys_%d", arg_13_0), string.format("v_s_%d_%s", arg_13_0, arg_13_1), string.format("vo_sys_%d.awb", arg_13_0))
		end
	else
		manager.audio:PlayVoice(string.format("vo_bat_%d", arg_13_0), string.format("v_b_%d_%s", arg_13_0, arg_13_1), string.format("vo_bat_%d.awb", arg_13_0))
	end

	manager.notify:Invoke(HERO_SOUND_PLAY, arg_13_0, arg_13_1, arg_13_2)
end

function var_0_0.PlayVoice(arg_14_0, arg_14_1, arg_14_2)
	local var_14_0 = HeroCfg[arg_14_0]

	arg_14_2 = arg_14_2 or 1

	HeroTools.StopTalk()

	local var_14_1

	if arg_14_2 == 1 then
		var_14_1 = manager.audio:PlayVoice(string.format("vo_sys_%d", arg_14_0), string.format("v_s_%d_%s", arg_14_0, arg_14_1), string.format("vo_sys_%d.awb", arg_14_0))
	else
		var_14_1 = manager.audio:PlayVoice(string.format("vo_bat_%d", arg_14_0), string.format("v_b_%d_%s", arg_14_0, arg_14_1), string.format("vo_bat_%d.awb", arg_14_0))
	end

	manager.notify:Invoke(HERO_SOUND_PLAY, arg_14_0, arg_14_1, arg_14_2)

	return var_14_1
end

function var_0_0.GetTalkLength(arg_15_0, arg_15_1, arg_15_2)
	arg_15_2 = arg_15_2 or 1

	if arg_15_2 == 1 then
		return manager.audio:GetVoiceLength(string.format("vo_sys_%d", arg_15_0), string.format("v_s_%d_%s", arg_15_0, arg_15_1), string.format("vo_sys_%d.awb", arg_15_0))
	else
		return manager.audio:GetVoiceLength(string.format("vo_bat_%d", arg_15_0), string.format("v_b_%d_%s", arg_15_0, arg_15_1), string.format("vo_bat_%d.awb", arg_15_0))
	end
end

function var_0_0.StopTalk()
	manager.audio:Stop("voice")
end

function var_0_0.GetConstructHero(arg_17_0)
	if arg_17_0.skin > 0 then
		arg_17_0.using_skin = arg_17_0.skin
	else
		arg_17_0.using_skin = arg_17_0.id
	end

	return arg_17_0
end

function var_0_0.InitTransitionByCfg(arg_18_0, arg_18_1)
	local var_18_0 = {}

	arg_18_0 = type(arg_18_0) == "table" and arg_18_0 or {}
	arg_18_1 = type(arg_18_1) == "table" and arg_18_1 or {}

	for iter_18_0, iter_18_1 in pairs(arg_18_0) do
		local var_18_1 = {}
		local var_18_2 = 0

		for iter_18_2, iter_18_3 in pairs(iter_18_1) do
			local var_18_3 = arg_18_1[iter_18_0] and arg_18_1[iter_18_0][iter_18_2] or 0

			var_18_2 = var_18_2 + var_18_3

			table.insert(var_18_1, {
				skill_id = iter_18_3,
				skill_level = var_18_3
			})
		end

		var_18_0[iter_18_0] = {
			slot_id = iter_18_0,
			talent_points = var_18_2,
			skill_list = var_18_1
		}
	end

	return var_18_0
end

function var_0_0.AttributeAdd(arg_19_0, arg_19_1, arg_19_2)
	arg_19_1 = arg_19_1 or 0
	arg_19_2 = arg_19_2 or 0

	if arg_19_0 == HeroConst.SUB_MUL_ATTRIBUTE_ID then
		return HeroConst.ATTRIBUTE_PRECISION - (HeroConst.ATTRIBUTE_PRECISION - arg_19_1) * (HeroConst.ATTRIBUTE_PRECISION - arg_19_2) / HeroConst.ATTRIBUTE_PRECISION
	elseif arg_19_0 == HeroConst.SUB_MUL_INJURY_ID or arg_19_0 == HeroConst.SUB_MUL_SELF_INJURY_ID then
		return (HeroConst.ATTRIBUTE_PRECISION + arg_19_1) * (HeroConst.ATTRIBUTE_PRECISION + arg_19_2) / HeroConst.ATTRIBUTE_PRECISION
	else
		return arg_19_1 + arg_19_2
	end
end

function var_0_0.GetHeroAttribute(arg_20_0)
	local var_20_0 = {}
	local var_20_1 = arg_20_0.star
	local var_20_2 = arg_20_0.id
	local var_20_3 = HeroCfg[var_20_2]
	local var_20_4 = var_20_3.star_up_skill_template
	local var_20_5 = var_0_0.GetStageListWithStarTemplateAndStarSkillType(var_20_4, HeroConst.HERO_STAR_SKILL_TYPE.ATTRIBUTE_UP)
	local var_20_6 = var_0_0.GetStageDicWithStarTemplateAndStarSkillType(var_20_4, HeroConst.HERO_STAR_SKILL_TYPE.ATTRIBUTE_UP)

	for iter_20_0, iter_20_1 in ipairs(var_20_5) do
		if iter_20_1 <= var_20_1 then
			local var_20_7 = var_20_6[iter_20_1]
			local var_20_8 = HeroStarSkillCfg[var_20_7]

			for iter_20_2, iter_20_3 in pairs(var_20_8.params) do
				var_20_0[iter_20_3[1]] = (var_20_0[iter_20_3[1]] or 0) + iter_20_3[2]
			end
		else
			break
		end
	end

	var_20_0[HeroConst.HERO_ATTRIBUTE.CRITICAL] = (var_20_0[HeroConst.HERO_ATTRIBUTE.CRITICAL] or 0) + var_20_3.base_crit2[(arg_20_0.break_level or 0) + 1]

	local var_20_9 = HeroStarCfg[var_20_1].star

	for iter_20_4, iter_20_5 in pairs(PublicAttrCfg.all) do
		local var_20_10 = 0
		local var_20_11 = HeroConst.HERO_ATTRIBUTE_MAP[iter_20_5]

		if var_20_11 then
			if var_20_11.base then
				var_20_10 = var_20_10 + var_20_3[var_20_11.base][var_20_9]
			end

			if var_20_11.grow_fixed then
				var_20_10 = var_20_10 + (arg_20_0.level - 1) * var_20_3[var_20_11.grow_fixed][var_20_9]
			end
		end

		if var_20_0[iter_20_5] == nil then
			var_20_0[iter_20_5] = 0
		end

		var_20_0[iter_20_5] = var_20_0[iter_20_5] + var_20_10
	end

	return var_20_0
end

function var_0_0.CaculateHeroAttribute(arg_21_0, arg_21_1)
	local var_21_0 = {}
	local var_21_1 = arg_21_0.star or arg_21_0.hero_star
	local var_21_2 = arg_21_0.hero_level or arg_21_0.level or var_0_0.CheckExp(1, arg_21_0.exp) or 1
	local var_21_3 = arg_21_0.hero_id or arg_21_0.id
	local var_21_4 = HeroCfg[var_21_3]

	for iter_21_0, iter_21_1 in pairs(arg_21_1) do
		var_21_0[iter_21_0] = (var_21_0[iter_21_0] or 0) + iter_21_1
	end

	local var_21_5 = var_21_4.star_up_skill_template
	local var_21_6 = var_0_0.GetStageListWithStarTemplateAndStarSkillType(var_21_5, HeroConst.HERO_STAR_SKILL_TYPE.ATTRIBUTE_UP)
	local var_21_7 = var_0_0.GetStageDicWithStarTemplateAndStarSkillType(var_21_5, HeroConst.HERO_STAR_SKILL_TYPE.ATTRIBUTE_UP)

	for iter_21_2, iter_21_3 in ipairs(var_21_6) do
		if iter_21_3 <= var_21_1 then
			local var_21_8 = var_21_7[iter_21_3]
			local var_21_9 = HeroStarSkillCfg[var_21_8]

			for iter_21_4, iter_21_5 in pairs(var_21_9.params) do
				var_21_0[iter_21_5[1]] = (var_21_0[iter_21_5[1]] or 0) + iter_21_5[2]
			end
		else
			break
		end
	end

	var_21_0[HeroConst.HERO_ATTRIBUTE.CRITICAL] = (var_21_0[HeroConst.HERO_ATTRIBUTE.CRITICAL] or 0) + var_21_4.base_crit2[(arg_21_0.break_level or 0) + 1]

	local var_21_10 = {}
	local var_21_11 = arg_21_0:GetWeaponInfo()
	local var_21_12 = arg_21_0:GetServantInfo()

	if var_21_11 then
		local var_21_13

		var_21_10[1], var_21_13 = WeaponTools.WeaponAtk(var_21_11.level, var_21_11.breakthrough), HeroCfg[var_21_3].weapon_break_attribute[var_21_11.breakthrough + 1]
		var_21_10[var_21_13[1]] = var_21_13[2]

		if var_21_12.id ~= 0 then
			local var_21_14 = WeaponServantCfg[var_21_12.id].attrib_addition
			local var_21_15 = WeaponServantCfg[var_21_12.id].attribute

			var_21_10[1] = var_21_10[1] + var_21_10[1] * var_21_14 / 100
			var_21_10[var_21_15[1]] = var_21_10[var_21_15[1]] + var_21_15[2]
		end

		for iter_21_6, iter_21_7 in pairs(var_21_10) do
			if not var_21_0[iter_21_6] then
				var_21_0[iter_21_6] = iter_21_7
			end

			var_21_0[iter_21_6] = var_21_0[iter_21_6] + iter_21_7
		end
	end

	local var_21_16 = HeroStarCfg[var_21_1].star

	for iter_21_8, iter_21_9 in pairs(PublicAttrCfg.all) do
		local var_21_17 = 0
		local var_21_18 = HeroConst.HERO_ATTRIBUTE_MAP[iter_21_9]

		if var_21_18 then
			if var_21_18.base then
				var_21_17 = var_21_17 + var_21_4[var_21_18.base][var_21_16]
			end

			if var_21_18.grow_fixed then
				var_21_17 = var_21_17 + (var_21_2 - 1) * var_21_4[var_21_18.grow_fixed][var_21_16]
			end
		end

		if var_21_0[iter_21_9] == nil then
			var_21_0[iter_21_9] = 0
		end

		var_21_0[iter_21_9] = var_21_0[iter_21_9] + var_21_17
	end

	return var_21_0
end

function var_0_0.CalFinalAttribute(arg_22_0)
	for iter_22_0, iter_22_1 in pairs(HeroConst.HERO_ATTRIBUTE_MAP) do
		if iter_22_1.ratio and arg_22_0[iter_22_0] then
			arg_22_0[iter_22_0] = arg_22_0[iter_22_0] * (1 + (arg_22_0[iter_22_1.ratio] / GameSetting.hp_ratio_percent.value[1] or 1))
		end
	end

	for iter_22_2, iter_22_3 in ipairs(arg_22_0) do
		local var_22_0 = PublicAttrCfg[iter_22_2]

		if var_22_0.percent and var_22_0.percent == 1 then
			arg_22_0[iter_22_2] = arg_22_0[iter_22_2]
		else
			arg_22_0[iter_22_2] = math.floor(arg_22_0[iter_22_2])
		end
	end
end

function var_0_0.Format(arg_23_0, arg_23_1)
	local var_23_0 = {}

	for iter_23_0, iter_23_1 in ipairs(arg_23_0) do
		var_23_0[iter_23_0] = {}

		for iter_23_2, iter_23_3 in ipairs(arg_23_1) do
			var_23_0[iter_23_0][iter_23_3] = iter_23_1[iter_23_3]
		end
	end

	return var_23_0
end

function var_0_0.CheckBlankTable(arg_24_0)
	local var_24_0 = true

	for iter_24_0, iter_24_1 in pairs(arg_24_0 or {}) do
		var_24_0 = false

		break
	end

	return var_24_0
end

function var_0_0.GetEquipMap(arg_25_0)
	local var_25_0 = {}

	for iter_25_0, iter_25_1 in pairs(arg_25_0) do
		if type(iter_25_1) == "table" then
			for iter_25_2, iter_25_3 in pairs(iter_25_1.equip) do
				var_25_0[iter_25_3.equip_id] = iter_25_0
			end
		end
	end

	return var_25_0
end

function var_0_0.GetHeroEquipS(arg_26_0)
	local var_26_0 = HeroData:GetHeroData(arg_26_0)

	return deepClone(var_26_0.equip)
end

function var_0_0.CheckExp(arg_27_0, arg_27_1)
	local var_27_0 = GameLevelSetting[arg_27_0]
	local var_27_1 = GameLevelSetting[arg_27_0 + 1]

	if var_27_0 == nil or var_27_1 == nil then
		return arg_27_0
	end

	local var_27_2 = var_27_0.hero_level_exp1

	if var_27_2 <= arg_27_1 then
		return var_0_0.CheckExp(arg_27_0 + 1, arg_27_1 - var_27_2)
	else
		return arg_27_0
	end
end

function var_0_0.GetUnlockSkill(arg_28_0)
	local var_28_0 = {}
	local var_28_1 = HeroData:GetHeroList()[arg_28_0].skill

	table.insert(var_28_0, {
		lv = 1,
		id = arg_28_0,
		type = HeroConst.SKILL_TYPE.ATTACK
	})

	local var_28_2 = #var_28_1

	for iter_28_0 = 1, var_28_2 do
		local var_28_3 = {
			id = var_28_1[iter_28_0].skill_id,
			lv = var_28_1[iter_28_0].lv or 0,
			type = HeroConst.SKILL_TYPE.SKILL
		}

		table.insert(var_28_0, var_28_3)
	end

	return var_28_0
end

function var_0_0.GetExSkillId(arg_29_0)
	return arg_29_0 * 1000 + 209
end

function var_0_0.GetTotalSkillLv(arg_30_0, arg_30_1)
	return var_0_0.GetSkillLv(arg_30_0, arg_30_1) + var_0_0.GetHeroSkillAddLevel(HeroData:GetHeroData(arg_30_0), arg_30_1)
end

function var_0_0.GetSkillLv(arg_31_0, arg_31_1)
	local var_31_0
	local var_31_1 = HeroData:GetHeroData(arg_31_0)

	for iter_31_0, iter_31_1 in ipairs(var_31_1.skill) do
		if iter_31_1.skill_id == arg_31_1 then
			return iter_31_1.skill_level
		end
	end

	return 0
end

function var_0_0.GetSkillAttrLv(arg_32_0, arg_32_1)
	local var_32_0
	local var_32_1 = HeroData:GetHeroData(arg_32_0)

	for iter_32_0, iter_32_1 in ipairs(var_32_1.skillAttrList or {}) do
		if iter_32_1.index == arg_32_1 then
			return iter_32_1.level
		end
	end

	return 0
end

function var_0_0.GetIsCanSkillUpNew(arg_33_0, arg_33_1)
	local var_33_0 = HeroData:GetHeroData(arg_33_0)

	for iter_33_0, iter_33_1 in ipairs(var_33_0.skill) do
		if SkillTools.GetIsCanUpNew(iter_33_1.skill_id, iter_33_1.skill_level, arg_33_1) then
			return true
		end
	end

	return false
end

function var_0_0.GetHeroSkillInfo(arg_34_0, arg_34_1)
	local var_34_0 = {}
	local var_34_1 = HeroData:GetHeroData(arg_34_0)

	for iter_34_0, iter_34_1 in ipairs(var_34_1.skill) do
		var_34_0[iter_34_1.skill_id] = iter_34_1.skill_level
	end

	local var_34_2 = {}

	for iter_34_2, iter_34_3 in ipairs(HeroCfg[arg_34_0].skills) do
		local var_34_3 = var_0_0.GetHeroSkillAddLevel(var_34_1, iter_34_3)

		if SkillTools.GetIsDodgeSkill(iter_34_3) then
			var_34_3 = 0
		end

		table.insert(var_34_2, {
			id = iter_34_3,
			heroId = arg_34_0,
			lv = var_34_0[iter_34_3],
			isCanUp = SkillTools.GetIsCanUp(iter_34_3, var_34_0[iter_34_3]),
			addSkillLv = var_34_3
		})
	end

	if arg_34_1 == true then
		for iter_34_4, iter_34_5 in ipairs(var_34_2) do
			iter_34_5.lv = 1
			iter_34_5.isCanUp = false
			iter_34_5.addSkillLv = 0
		end
	end

	return var_34_2
end

function var_0_0.GetHeroSkillAddLevel(arg_35_0, arg_35_1)
	local var_35_0 = arg_35_0.id or arg_35_0.hero_id
	local var_35_1 = HeroCfg[var_35_0]
	local var_35_2 = table.indexof(var_35_1.skills, arg_35_1)

	if var_35_2 then
		local var_35_3 = arg_35_0.star
		local var_35_4 = {}
		local var_35_5 = var_35_1.star_up_skill_template
		local var_35_6 = var_0_0.GetStageListWithStarTemplateAndStarSkillType(var_35_5, HeroConst.HERO_STAR_SKILL_TYPE.SKILL_UP)
		local var_35_7 = var_0_0.GetStageDicWithStarTemplateAndStarSkillType(var_35_5, HeroConst.HERO_STAR_SKILL_TYPE.SKILL_UP)

		for iter_35_0, iter_35_1 in ipairs(var_35_6) do
			if iter_35_1 <= var_35_3 then
				local var_35_8 = var_35_7[iter_35_1]
				local var_35_9 = HeroStarSkillCfg[var_35_8]

				for iter_35_2, iter_35_3 in pairs(var_35_9.params) do
					var_35_4[iter_35_3[1]] = (var_35_4[iter_35_3[1]] or 0) + iter_35_3[2]
				end
			else
				break
			end
		end

		return var_35_4[var_35_2] or 0
	end

	return 0
end

function var_0_0.CountTransitionTotalSkill(arg_36_0, arg_36_1)
	local var_36_0 = HeroTools.GetHeroEquipSkillAddLevel(arg_36_0)
	local var_36_1 = arg_36_0.transition
	local var_36_2 = {}
	local var_36_3 = {}

	for iter_36_0, iter_36_1 in ipairs(arg_36_1 or {}) do
		if iter_36_1.prefab_id ~= 0 then
			var_36_3[EquipCfg[iter_36_1.prefab_id].pos] = iter_36_1
		end
	end

	local var_36_4 = GameSetting.exclusive_open_need.value[1]

	for iter_36_2, iter_36_3 in ipairs(var_36_1) do
		local var_36_5 = var_36_3[iter_36_3.slot_id]

		if var_36_5 and var_36_4 <= var_36_5:GetLevel() then
			local var_36_6 = iter_36_3.skill_list

			for iter_36_4, iter_36_5 in ipairs(var_36_6) do
				local var_36_7 = iter_36_5.skill_id

				if not var_36_2[var_36_7] then
					var_36_2[var_36_7] = 0
				end

				var_36_2[var_36_7] = var_36_2[var_36_7] + iter_36_5.skill_level
			end
		end
	end

	local var_36_8 = 0

	for iter_36_6, iter_36_7 in pairs(var_36_2) do
		var_36_8 = var_36_8 + iter_36_7 + var_36_0
	end

	return var_36_8
end

function var_0_0.CalTransitionSkillAttribute(arg_37_0, arg_37_1)
	local var_37_0 = {}
	local var_37_1 = {}
	local var_37_2 = {}
	local var_37_3 = arg_37_0.transition
	local var_37_4 = HeroTools.GetHeroEquipSkillAddLevel(arg_37_0)
	local var_37_5 = GameSetting.exclusive_skill_level_up_type.value
	local var_37_6 = {}

	for iter_37_0, iter_37_1 in ipairs(arg_37_1) do
		if iter_37_1.prefab_id ~= 0 then
			var_37_6[EquipCfg[iter_37_1.prefab_id].pos] = iter_37_1
		end
	end

	local var_37_7 = {}
	local var_37_8 = {}
	local var_37_9 = {}

	for iter_37_2, iter_37_3 in pairs(var_37_3) do
		local var_37_10 = var_37_6[iter_37_2]

		if var_37_10 and EquipTools.CountEquipLevel(var_37_10) >= GameSetting.exclusive_open_need.value[1] then
			for iter_37_4, iter_37_5 in ipairs(iter_37_3.skill_list) do
				local var_37_11 = iter_37_5.skill_id

				if EquipSkillCfg[var_37_11].equip_effect_id == 0 then
					local var_37_12 = false

					for iter_37_6, iter_37_7 in ipairs(var_37_5) do
						if var_37_11 == iter_37_7[1] then
							var_37_12 = iter_37_7[2]

							break
						end
					end

					if var_37_12 then
						var_37_9[var_37_11] = (var_37_9[var_37_11] or 0) + iter_37_5.skill_level
					else
						var_37_7[var_37_11] = (var_37_7[var_37_11] or 0) + iter_37_5.skill_level
					end
				else
					var_37_8[var_37_11] = (var_37_8[var_37_11] or 0) + iter_37_5.skill_level
				end
			end
		end
	end

	for iter_37_8, iter_37_9 in pairs(var_37_7) do
		local var_37_13 = EquipSkillCfg[iter_37_8]
		local var_37_14 = var_37_13.attribute
		local var_37_15 = var_37_13.upgrade * (iter_37_9 + var_37_4)

		var_37_0[var_37_14] = (var_37_0[var_37_14] or 0) + var_37_15
	end

	for iter_37_10, iter_37_11 in pairs(var_37_8) do
		local var_37_16 = EquipSkillCfg[iter_37_10]
		local var_37_17 = iter_37_11 + var_37_4

		var_37_1[iter_37_10] = (var_37_1[iter_37_10] or 0) + var_37_17
	end

	local var_37_18 = HeroCfg[arg_37_0.id].skills

	for iter_37_12, iter_37_13 in pairs(var_37_9) do
		local var_37_19 = EquipSkillCfg[iter_37_12]
		local var_37_20 = iter_37_13 + var_37_4

		for iter_37_14, iter_37_15 in ipairs(var_37_5) do
			if iter_37_12 == iter_37_15[1] then
				var_37_2[var_37_18[iter_37_15[2]]] = var_37_19.upgrade * var_37_20

				break
			end
		end
	end

	return var_37_0, var_37_1, var_37_2
end

function var_0_0.GetHeroEquipSkillAddLevel(arg_38_0)
	local var_38_0 = arg_38_0.id or arg_38_0.hero_id
	local var_38_1 = HeroCfg[var_38_0]
	local var_38_2 = arg_38_0.star
	local var_38_3 = var_38_1.star_up_skill_template

	if var_38_2 >= var_0_0.GetStageListWithStarTemplateAndStarSkillType(var_38_3, HeroConst.HERO_STAR_SKILL_TYPE.EQUIP_UP)[1] then
		return 1
	end

	return 0
end

function var_0_0.GetHeroWeaponAddLevel(arg_39_0)
	local var_39_0 = arg_39_0.id
	local var_39_1 = HeroCfg[var_39_0]
	local var_39_2 = arg_39_0.star
	local var_39_3 = var_39_1.star_up_skill_template

	if var_39_2 >= var_0_0.GetStageListWithStarTemplateAndStarSkillType(var_39_3, HeroConst.HERO_STAR_SKILL_TYPE.WEAPON_UP)[1] then
		return 2
	end

	return 0
end

function var_0_0.GetIsSuitNumCut(arg_40_0)
	if not arg_40_0 then
		return false
	end

	local var_40_0 = arg_40_0.id or arg_40_0.hero_id
	local var_40_1 = HeroCfg[var_40_0]
	local var_40_2 = arg_40_0.star or arg_40_0.hero_star

	if var_40_2 and HeroStarCfg[var_40_2] then
		local var_40_3 = var_40_1.star_up_skill_template

		if var_40_2 >= var_0_0.GetStageListWithStarTemplateAndStarSkillType(var_40_3, HeroConst.HERO_STAR_SKILL_TYPE.EQUIP_SUIT)[1] then
			return true
		end
	end

	return false
end

function var_0_0.CountHeroTotalSkilllv(arg_41_0)
	local var_41_0 = HeroData:GetHeroList()[arg_41_0]
	local var_41_1 = 0

	for iter_41_0, iter_41_1 in ipairs(var_41_0.skill) do
		local var_41_2 = var_0_0.GetHeroSkillAddLevel(var_41_0, iter_41_1.skill_id)

		var_41_1 = var_41_1 + iter_41_1.skill_level + var_41_2
	end

	return var_41_1
end

function var_0_0.GetEquipSuitEffect(arg_42_0)
	local var_42_0 = {}

	for iter_42_0, iter_42_1 in ipairs(arg_42_0) do
		if iter_42_1.equip_id ~= 0 then
			local var_42_1 = EquipData:GetEquipList()[iter_42_1.equip_id].prefab_id
			local var_42_2 = EquipCfg[var_42_1].type

			var_42_0[var_42_2] = (var_42_0[var_42_2] or 0) + 1
		end
	end

	local var_42_3 = {}
	local var_42_4 = 0

	for iter_42_2, iter_42_3 in pairs(var_42_0) do
		local var_42_5 = EquipSuitCfg.get_id_list_by_suit[iter_42_2]

		for iter_42_4, iter_42_5 in ipairs(var_42_5) do
			local var_42_6 = EquipSuitCfg[iter_42_5]

			if iter_42_3 >= var_42_6.need then
				if var_42_3[var_42_6.suit] == nil then
					var_42_3[var_42_6.suit] = {}
					var_42_4 = var_42_4 + 1
				end

				table.insert(var_42_3[var_42_6.suit], var_42_6)
			end
		end
	end

	return var_42_3, var_42_4
end

function var_0_0.GetIsCanSkillUp(arg_43_0)
	local var_43_0 = HeroCfg[arg_43_0.id]

	if arg_43_0.unlock == 0 then
		return false
	end

	local var_43_1 = {}

	for iter_43_0, iter_43_1 in ipairs(arg_43_0.skill) do
		var_43_1[iter_43_1.skill_id] = iter_43_1.skill_level
	end

	for iter_43_2, iter_43_3 in ipairs(var_43_0.skills) do
		if SkillTools.GetIsCanUp(iter_43_3, var_43_1[iter_43_3]) then
			return true
		end
	end

	return false
end

function var_0_0.GetIsCanUpStar(arg_44_0)
	local var_44_0 = HeroCfg[arg_44_0.id]

	if arg_44_0.unlock == 0 then
		if GameSetting.unlock_hero_need.value[var_44_0.rare] <= arg_44_0.piece then
			return true
		end
	else
		local var_44_1 = arg_44_0.star

		if var_44_1 >= HeroConst.MAX_STAR_UP_ID then
			return false
		end

		local var_44_2 = ItemTools.getItemNum(CurrencyConst.CURRENCY_TYPE_GOLD)
		local var_44_3 = HeroStarCfg[var_44_1].star_up
		local var_44_4 = HeroStarCfg[var_44_1].gold_cost

		if var_44_3 <= arg_44_0.piece and var_44_4 <= var_44_2 then
			return true
		end
	end

	return false
end

function var_0_0.SortByChat(arg_45_0, arg_45_1, arg_45_2)
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

	if var_0_0.lastList then
		local var_45_2 = arg_45_2 - arg_45_1
		local var_45_3 = var_0_0.lastList[var_45_2]

		if var_45_3 and var_45_3 ~= var_45_0[var_45_2] then
			local var_45_4 = table.indexof(var_45_0, var_45_3)

			if var_45_4 then
				table.remove(var_45_0, var_45_4)
				table.insert(var_45_0, var_45_2, var_45_3)
			end
		end
	end

	var_0_0.lastList = var_45_0

	return var_45_0
end

function var_0_0.SortByChat2(arg_47_0)
	if var_0_0.chatList then
		return var_0_0.chatList
	end

	local var_47_0 = {}
	local var_47_1 = {}

	for iter_47_0, iter_47_1 in pairs(arg_47_0) do
		if type(iter_47_1) == "table" and iter_47_1.unlock == 1 then
			var_47_1[iter_47_0] = iter_47_1.chat_unread

			table.insert(var_47_0, iter_47_0)
		end
	end

	table.sort(var_47_0)
	table.sort(var_47_0, function(arg_48_0, arg_48_1)
		return var_47_1[arg_48_0] > var_47_1[arg_48_1]
	end)

	var_0_0.chatList = var_47_0

	return var_47_0
end

function var_0_0.HeroUsingSkinInfo(arg_49_0)
	local var_49_0 = arg_49_0
	local var_49_1 = HeroData:GetHeroData(arg_49_0)
	local var_49_2 = var_49_1 and var_49_1.using_skin or 0

	if var_49_2 == 0 then
		var_49_2 = var_49_0
	end

	return SkinCfg[var_49_2]
end

function var_0_0.SetHeroModelWeaponActivity(arg_50_0, arg_50_1)
	LuaForUtil.ShowWeapon(arg_50_0, arg_50_1)
end

function var_0_0.HeroUnlockSkinS(arg_51_0)
	local var_51_0 = HeroData:GetHeroData(arg_51_0)
	local var_51_1 = {}

	for iter_51_0, iter_51_1 in ipairs(var_51_0.unlocked_skin) do
		table.insert(var_51_1, iter_51_1.skin_id)
	end

	table.insert(var_51_1, arg_51_0)

	return var_51_1
end

function var_0_0.CanChangeSkin(arg_52_0)
	if var_0_0.GetSkinIsUnlock(arg_52_0) then
		return false
	end

	local var_52_0 = var_0_0.GetSkinChangeItem(arg_52_0)

	if not var_52_0 then
		return false
	end

	if ItemTools.getItemNum(var_52_0) > 0 then
		return true
	end
end

function var_0_0.GetSkinIsUnlock(arg_53_0)
	local var_53_0 = SkinCfg[arg_53_0].hero
	local var_53_1 = HeroTools.HeroUnlockSkinS(var_53_0)

	for iter_53_0, iter_53_1 in ipairs(var_53_1) do
		if iter_53_1 == arg_53_0 then
			return true
		end
	end

	return false
end

function var_0_0.GetSkinIsCanUnLock(arg_54_0)
	if SkinCfg[arg_54_0].unlock_id_list[1] then
		return true
	end

	return false
end

function var_0_0.GetHasOwnedSkin(arg_55_0)
	local var_55_0 = SkinCfg[arg_55_0].hero
	local var_55_1 = HeroData:GetHeroData(var_55_0)
	local var_55_2 = {}

	if arg_55_0 == var_55_0 then
		return true
	end

	for iter_55_0, iter_55_1 in ipairs(var_55_1.unlocked_skin) do
		if iter_55_1.skin_id == arg_55_0 and iter_55_1.time == 0 then
			return true
		end
	end

	return false
end

function var_0_0.GetIsLimitTimeSkin(arg_56_0)
	local var_56_0 = SkinCfg[arg_56_0].hero
	local var_56_1 = HeroData:GetHeroData(var_56_0)
	local var_56_2 = {}

	for iter_56_0, iter_56_1 in ipairs(var_56_1.unlocked_skin) do
		if iter_56_1.skin_id == arg_56_0 and iter_56_1.time ~= 0 then
			return true
		end
	end

	return false
end

function var_0_0.GetSkinChangeItem(arg_57_0)
	return SkinCfg[arg_57_0].change_item
end

function var_0_0.GetHeadSprite(arg_58_0)
	return getSpriteViaConfig("HeroLittleIcon", arg_58_0)
end

function var_0_0.GetSmallHeadSprite(arg_59_0)
	return getSpriteViaConfig("HeroItemshead", arg_59_0)
end

function var_0_0.GetHeroAttackRangeIcon(arg_60_0)
	local var_60_0

	for iter_60_0, iter_60_1 in ipairs(GameDisplayCfg.hero_range_type_tag.value) do
		if iter_60_1[1] == CharactorParamCfg[arg_60_0].RangeType then
			var_60_0 = iter_60_1[2]

			break
		end
	end

	return getSprite("Atlas/Hero_arrtAtlas", var_60_0)
end

function var_0_0.GetHeroRaceIcon(arg_61_0)
	local var_61_0 = HeroCfg[arg_61_0].race

	return var_0_0.GetRaceIcon(var_61_0)
end

function var_0_0.GetRaceIcon(arg_62_0)
	local var_62_0

	for iter_62_0, iter_62_1 in ipairs(GameDisplayCfg.hero_race_type_tag.value) do
		if iter_62_1[1] == arg_62_0 then
			var_62_0 = iter_62_1[2]
		end
	end

	return getSprite("Atlas/CampItemAtlas", var_62_0)
end

function var_0_0.GetHeroSkillAttributeIcon(arg_63_0, arg_63_1)
	if type(HeroCfg[arg_63_0].ATK_attribute) ~= "table" or not HeroCfg[arg_63_0].ATK_attribute[1] then
		print(string.format("%s角色表未配置ATK_attribute", arg_63_0))

		return nil
	end

	return var_0_0.GetSkillAttributeIcon(HeroCfg[arg_63_0].ATK_attribute[1], arg_63_1)
end

function var_0_0.GetSkillAttributeIcon(arg_64_0, arg_64_1)
	if not arg_64_0 then
		return getSprite("Atlas/Hero_arrtAtlas", "icon_none")
	end

	local var_64_0

	if arg_64_1 then
		for iter_64_0, iter_64_1 in ipairs(GameDisplayCfg.hero_atack_type_white_tag.value) do
			if iter_64_1[1] == arg_64_0 then
				var_64_0 = iter_64_1[2]

				break
			end
		end
	else
		for iter_64_2, iter_64_3 in ipairs(GameDisplayCfg.hero_atack_type_tag.value) do
			if iter_64_3[1] == arg_64_0 then
				var_64_0 = iter_64_3[2]

				break
			end
		end
	end

	return getSprite("Atlas/Hero_arrtAtlas", var_64_0)
end

function var_0_0.GetHeroSkillMechanismIcon(arg_65_0)
	local var_65_0

	for iter_65_0, iter_65_1 in ipairs(GameDisplayCfg.hero_mechanism_type_tag.value) do
		if iter_65_1[1] == HeroCfg[arg_65_0].mechanism_type[1] then
			var_65_0 = iter_65_1[2]

			break
		end
	end

	return getSprite("Atlas/Hero_arrtAtlas", var_65_0)
end

function var_0_0.GetHeroRareSprite(arg_66_0)
	return var_0_0.GetRareSprite(HeroCfg[arg_66_0].rare)
end

function var_0_0.GetRareSprite(arg_67_0)
	return getSprite("Atlas/SystemHeroGradeAtlas", string.format("star_%s", arg_67_0))
end

function var_0_0.GetHeroCurrentMaxLevel(arg_68_0)
	local var_68_0 = arg_68_0.break_level or 0
	local var_68_1 = HeroCfg[arg_68_0.id]

	return HeroTools.GetHeroBreakConfig(var_68_1.race, var_68_0).max_level
end

function var_0_0.GetHeroMaxLevel(arg_69_0)
	local var_69_0 = HeroCfg[arg_69_0.id]

	return HeroBreakCfg[HeroBreakCfg.get_id_list_by_race[var_69_0.race][#HeroBreakCfg.get_id_list_by_race[var_69_0.race]]].max_level
end

function var_0_0.GetHeroBreakConfig(arg_70_0, arg_70_1)
	for iter_70_0, iter_70_1 in ipairs(HeroBreakCfg.all) do
		if HeroBreakCfg[iter_70_1].race == arg_70_0 and HeroBreakCfg[iter_70_1].break_times == arg_70_1 then
			return HeroBreakCfg[iter_70_1]
		end
	end

	error(string.format("在hero_break.csv中找不到race=%d,breakLevel=%d的项", arg_70_0, arg_70_1))

	return nil
end

function var_0_0.GetHeroServantInfo(arg_71_0)
	local var_71_0 = WeaponServantData.GetWeaponServantList()
	local var_71_1 = HeroData:GetHeroList()[arg_71_0].servant_uid

	if var_71_1 == 0 then
		return nil
	end

	return var_71_0[var_71_1]
end

function var_0_0.GetHeroSpecServant(arg_72_0)
	return HeroCfg[arg_72_0].spec_servant
end

function var_0_0.GetHeroProficiency(arg_73_0)
	local var_73_0 = HeroData:GetHeroData(arg_73_0).clear_times

	return (math.min(var_73_0, GameSetting.mastery_level_max.value[1]))
end

function var_0_0.CanBreakHero(arg_74_0)
	local var_74_0 = HeroCfg[arg_74_0]
	local var_74_1 = HeroData:GetHeroData(arg_74_0)

	if var_74_1.unlock and var_74_1.level < HeroConst.HERO_LV_MAX and var_74_1.level >= HeroTools.GetHeroCurrentMaxLevel(var_74_1) then
		-- block empty
	else
		return false
	end

	local var_74_2 = HeroTools.GetHeroBreakConfig(var_74_0.race, var_74_1.break_level or 0)

	if PlayerData:GetPlayerInfo().userLevel < var_74_2.user_level then
		return false
	end

	local var_74_3 = #var_74_2.cost

	for iter_74_0 = 1, var_74_3 do
		local var_74_4 = var_74_2.cost[iter_74_0]

		if not (ItemTools.getItemNum(var_74_4[1]) >= var_74_4[2]) then
			return false
		end
	end

	if ItemTools.getItemNum(CurrencyConst.CURRENCY_TYPE_GOLD) < var_74_2.cost_gold then
		return false
	end

	return true
end

function var_0_0.GetHeroOntologyID(arg_75_0)
	for iter_75_0, iter_75_1 in ipairs(HeroRecordCfg.all) do
		local var_75_0 = HeroRecordCfg[iter_75_1]

		if arg_75_0 == iter_75_1 then
			return iter_75_1, true
		end

		for iter_75_2, iter_75_3 in ipairs(var_75_0.hero_id) do
			if arg_75_0 == iter_75_3 then
				return iter_75_1, false
			end
		end
	end
end

function var_0_0.GetHeroTeachVideo(arg_76_0)
	local var_76_0 = HeroCfg[arg_76_0]

	if HeroData:GetHeroData(arg_76_0).unlock == 0 then
		return nil
	end

	local var_76_1 = var_76_0.study_stage[1]

	if var_76_1 then
		local var_76_2 = TeachStageExInfoCfg[var_76_1]

		if var_76_2 and var_76_2.video_url then
			return var_76_2.video_url
		end
	end
end

function var_0_0.IsSkinUnlock(arg_77_0)
	local var_77_0 = SkinCfg[arg_77_0].hero
	local var_77_1 = HeroTools.HeroUnlockSkinS(var_77_0)

	for iter_77_0, iter_77_1 in ipairs(var_77_1) do
		if iter_77_1 == arg_77_0 then
			return true
		end
	end

	return false
end

function var_0_0.GetShopIdBySkinId(arg_78_0)
	local var_78_0 = SkinIDToGoodIDCfg[arg_78_0]

	if var_78_0 == nil then
		return 0
	end

	for iter_78_0, iter_78_1 in ipairs(var_78_0.goods_id) do
		local var_78_1 = getShopCfg(iter_78_1)

		if var_78_1 and var_78_1.shop_refresh == 3 then
			return iter_78_1
		end
	end

	return 0
end

function var_0_0.IsSkinOnlySellDLC(arg_79_0)
	return var_0_0.GetShopIdBySkinId(arg_79_0) < 0 and true or false
end

function var_0_0.IsSkinOutOfDate(arg_80_0)
	local var_80_0 = var_0_0.GetShopIdBySkinId(arg_80_0)

	if var_80_0 and var_80_0 > 0 then
		local var_80_1 = getShopCfg(var_80_0).shop_id

		return ShopData.IsGoodOutOfDate(var_80_0, var_80_1)
	else
		return true
	end
end

function var_0_0.CanBeDraw(arg_81_0, arg_81_1)
	local var_81_0 = ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.DRAW] or {}

	for iter_81_0, iter_81_1 in ipairs(var_81_0) do
		if ActivityData:GetActivityIsOpen(iter_81_1) then
			local var_81_1 = ActivityDrawPoolCfg[iter_81_1]

			if var_81_1 then
				for iter_81_2, iter_81_3 in ipairs(var_81_1.config_list) do
					if arg_81_1 == iter_81_3 then
						return true
					end
				end
			end
		end
	end

	return false
end

function var_0_0.GetIsHide(arg_82_0)
	return HideInfoData:GetHeroHideList()[arg_82_0] or false
end

function var_0_0.GetIsSkinHide(arg_83_0)
	return HideInfoData:GetSkinHideList()[arg_83_0] or false
end

function var_0_0.GetSkinIsCanUnlockAndGet(arg_84_0)
	if SkinCfg[arg_84_0].unlock_id_list[1] then
		for iter_84_0, iter_84_1 in pairs(SkinCfg[arg_84_0].unlock_id_list) do
			local var_84_0, var_84_1, var_84_2 = IsConditionAchieved(iter_84_1, {
				heroId = SkinCfg[arg_84_0].hero
			})

			if not var_84_0 then
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

local function var_0_5(arg_86_0)
	local var_86_0 = false

	for iter_86_0 = var_0_3 + 1, #HeroRecordCfg.all do
		local var_86_1 = HeroRecordCfg.all[iter_86_0]
		local var_86_2 = HeroRecordCfg[var_86_1].hero_id

		for iter_86_1, iter_86_2 in pairs(var_86_2) do
			var_0_2[iter_86_2] = var_86_1

			if arg_86_0 == iter_86_2 then
				var_86_0 = true
			end
		end

		var_0_3 = iter_86_0

		if var_86_0 then
			return var_86_1
		end
	end

	return nil
end

local function var_0_6(arg_87_0)
	local var_87_0 = var_0_2[arg_87_0]

	if var_87_0 == nil then
		var_87_0 = var_0_5(arg_87_0)
	end

	return var_87_0
end

function var_0_0.IsSamePerson(arg_88_0, arg_88_1)
	local var_88_0 = var_0_6(arg_88_0)
	local var_88_1 = var_0_6(arg_88_1)

	return var_88_0 ~= nil and var_88_1 ~= nil and var_88_0 == var_88_1
end

function var_0_0.GetInteractionVoiceFileName(arg_89_0)
	local var_89_0 = string.find(arg_89_0, "_")

	return var_89_0 and string.sub(arg_89_0, var_89_0 + 1) or nil
end

function var_0_0.GetUnlockInteractionCfg(arg_90_0, arg_90_1, arg_90_2)
	local var_90_0 = HeroInteractionCfg[arg_90_1]
	local var_90_1 = {}

	for iter_90_0, iter_90_1 in pairs(var_90_0) do
		if string.find(iter_90_0, "_talk") then
			local var_90_2 = var_90_0[iter_90_0]
			local var_90_3 = string.split(iter_90_0, "_")[1]
			local var_90_4 = var_90_0[var_90_3]
			local var_90_5 = var_90_0[var_90_3 .. "_talk"]
			local var_90_6 = var_90_0[var_90_3 .. "_delay"]
			local var_90_7 = var_90_0[var_90_3 .. "_weight"]
			local var_90_8 = {}
			local var_90_9 = {}
			local var_90_10 = {}
			local var_90_11 = {}

			var_90_1[var_90_3] = var_90_8
			var_90_1[var_90_3 .. "_talk"] = var_90_9
			var_90_1[var_90_3 .. "_delay"] = var_90_10
			var_90_1[var_90_3 .. "_weight"] = var_90_11

			for iter_90_2, iter_90_3 in ipairs(var_90_2) do
				local var_90_12 = HeroTools.GetInteractionVoiceFileName(iter_90_3)

				if HeroVoiceCfg.get_id_list_by_file[var_90_12] then
					local var_90_13 = HeroVoiceCfg.get_id_list_by_file[var_90_12][1]

					if HeroVoiceCfg[var_90_13].use_skin_id == 0 and not arg_90_0:IsUnlockVoice(arg_90_1, var_90_13) then
						-- block empty
					else
						local var_90_14 = var_90_4[iter_90_2]
						local var_90_15 = string.split(var_90_14, "__")
						local var_90_16 = true

						if var_90_15[2] then
							if #arg_90_2 > 0 then
								local var_90_17 = string.split(var_90_15[2], "_")

								for iter_90_4, iter_90_5 in ipairs(arg_90_2) do
									if not table.indexof(var_90_17, iter_90_5) then
										var_90_16 = false

										break
									end
								end
							else
								var_90_16 = false
							end
						end

						if var_90_16 then
							table.insert(var_90_8, var_90_14)
							table.insert(var_90_9, var_90_5[iter_90_2])

							if var_90_6 then
								table.insert(var_90_10, var_90_6[iter_90_2])
							end

							if var_90_7 then
								table.insert(var_90_11, var_90_7[iter_90_2])
							end
						end
					end
				end
			end
		end
	end

	return var_90_1
end

function var_0_0.IsUnlockVoice(arg_91_0, arg_91_1, arg_91_2)
	if DormHeroTools:IsVoiceNeedUnlock(arg_91_2, arg_91_1) then
		if BackHomeHeroCfg[arg_91_1] == nil then
			return false
		end

		if DormHeroTools:GetDormLevelByHeroID(arg_91_1) < DormHeroTools:GetVoiceUnlockLevel(arg_91_1, arg_91_2) then
			return false
		end
	end

	if not var_0_0.IsVoiceDescValid(arg_91_1, arg_91_2) then
		return false
	end

	local var_91_0 = HeroVoiceCfg[arg_91_2].unlock_condition

	if var_91_0 == 0 then
		return true
	else
		return IsConditionAchieved(var_91_0, {
			heroId = arg_91_1
		})
	end
end

function var_0_0.GetModuleAttribute(arg_92_0)
	local var_92_0 = arg_92_0.id
	local var_92_1 = {
		0,
		0,
		0,
		0
	}
	local var_92_2 = HeroTools.GetModuleEffectByHeroAndLevel(var_92_0, arg_92_0.weapon_module_level)

	for iter_92_0, iter_92_1 in pairs(var_92_2) do
		local var_92_3 = WeaponModuleEffectCfg[iter_92_1]

		if var_92_3.type == 1 then
			for iter_92_2, iter_92_3 in pairs(var_92_3.attributes) do
				var_92_1[iter_92_3[1]] = var_92_1[iter_92_3[1]] + iter_92_3[2]
			end
		end
	end

	return var_92_1
end

function var_0_0.GetSkillAttribute(arg_93_0)
	local var_93_0 = arg_93_0.id
	local var_93_1 = {}

	for iter_93_0, iter_93_1 in ipairs(arg_93_0.skillAttrList) do
		local var_93_2 = SkillTools.GetSkillAttrCfg(var_93_0, iter_93_1.index, iter_93_1.level)

		if var_93_2 then
			for iter_93_2, iter_93_3 in pairs(var_93_2.attr) do
				var_93_1[iter_93_3[1]] = iter_93_3[2]
			end
		end
	end

	return var_93_1
end

local function var_0_7(arg_94_0, arg_94_1, arg_94_2)
	if arg_94_1 == nil then
		return arg_94_0
	end

	arg_94_2 = arg_94_2 or "\n"

	if arg_94_0 == nil then
		return arg_94_1
	else
		return arg_94_0 .. arg_94_2 .. arg_94_1
	end
end

function var_0_0.GetModuleAllDes(arg_95_0, arg_95_1, arg_95_2)
	local var_95_0
	local var_95_1
	local var_95_2
	local var_95_3
	local var_95_4 = HeroData:GetHeroList()[arg_95_1].servant_uid

	if var_95_4 ~= HeroTools.GetHeroSpecServant(arg_95_1) then
		var_95_4 = 0
	end

	for iter_95_0, iter_95_1 in pairs(arg_95_0) do
		local var_95_5 = WeaponModuleEffectCfg[iter_95_1].type

		if var_95_5 == 1 then
			if var_95_0 == nil then
				var_95_0 = {
					iter_95_1
				}
			else
				table.insert(var_95_0, iter_95_1)
			end
		elseif var_95_5 == 2 then
			var_95_1 = var_0_7(var_95_1, SkillTools.GetSkillModuleDes(iter_95_1))
		elseif var_95_5 == 3 then
			var_95_2 = var_0_7(var_95_2, AstrolabeTools.GetAstrolabeModuleDes(iter_95_1, var_95_4), "\n\n")
		elseif var_95_5 == 4 then
			var_95_3 = var_0_7(var_95_3, WeaponTools.GetWeaponModuleDes(iter_95_1, arg_95_2), "\n\n")
		elseif var_95_5 == 5 then
			var_95_1 = var_0_7(var_95_1, SkillTools.GetServantSkillModuleDes(iter_95_1))
		elseif var_95_5 == 6 then
			var_95_1 = var_0_7(var_95_1, SkillTools.GetAstrolabeSkillModuleDes(iter_95_1))
		end
	end

	return var_95_0, var_95_1, var_95_2, var_95_3
end

function var_0_0.MergeModuleAttribute(arg_96_0)
	local var_96_0 = {}

	for iter_96_0, iter_96_1 in pairs(arg_96_0) do
		local var_96_1 = WeaponModuleEffectCfg[iter_96_1].attributes

		for iter_96_2, iter_96_3 in pairs(var_96_1) do
			if var_96_0[iter_96_3[1]] then
				var_96_0[iter_96_3[1]] = var_96_0[iter_96_3[1]] + iter_96_3[2]
			else
				var_96_0[iter_96_3[1]] = iter_96_3[2]
			end
		end
	end

	return var_96_0
end

function var_0_0.CheckModulePieceCanEnter()
	local var_97_0 = ItemCfg.get_id_list_by_sub_type[ItemConst.ITEM_SUB_TYPE.MODULE_PIECE]

	for iter_97_0, iter_97_1 in pairs(var_97_0) do
		if ItemTools.getItemNum(iter_97_1) > 0 then
			return true
		end
	end

	return false
end

function var_0_0.GetModuleEffectByHeroAndLevel(arg_98_0, arg_98_1)
	local var_98_0 = {}

	if arg_98_0 and arg_98_1 then
		local var_98_1 = WeaponModuleCfg[arg_98_0]

		if var_98_1 then
			for iter_98_0 = 1, arg_98_1 do
				for iter_98_1, iter_98_2 in pairs(var_98_1.skill[iter_98_0]) do
					table.insert(var_98_0, iter_98_2)
				end
			end
		end
	end

	return var_98_0
end

function var_0_0.GetStageDicWithStarTemplateAndStarSkillType(arg_99_0, arg_99_1)
	if HeroStarUpTemplateCfg.template_dic[arg_99_0] and HeroStarUpTemplateCfg.template_dic[arg_99_0][arg_99_1] then
		return HeroStarUpTemplateCfg.template_dic[arg_99_0][arg_99_1].stage_dic
	end

	return {}
end

function var_0_0.GetStageListWithStarTemplateAndStarSkillType(arg_100_0, arg_100_1)
	if HeroStarUpTemplateCfg.template_dic[arg_100_0] and HeroStarUpTemplateCfg.template_dic[arg_100_0][arg_100_1] then
		return HeroStarUpTemplateCfg.template_dic[arg_100_0][arg_100_1].stage_list
	end

	return {}
end

function var_0_0.GetHeroNameLinkChar()
	local var_101_0
	local var_101_1 = SettingData:GetCurrentLanguage()

	return (var_101_1 == "en" or var_101_1 == "fr" or var_101_1 == "de") and " - " or var_101_1 == "jp" and "·" or "·"
end

function var_0_0.GetHeroFullName(arg_102_0)
	local var_102_0 = HeroCfg[arg_102_0]

	return GetI18NText(var_102_0.name) .. HeroTools.GetHeroNameLinkChar() .. GetI18NText(var_102_0.suffix)
end

function var_0_0.GetModulePowersByHeroIDAndLevel(arg_103_0, arg_103_1, arg_103_2)
	local var_103_0 = {}
	local var_103_1 = WeaponModuleCfg[arg_103_1]

	if var_103_1 then
		for iter_103_0 = 1, arg_103_2 do
			local var_103_2 = var_103_1.skill[iter_103_0]

			for iter_103_1, iter_103_2 in pairs(var_103_2) do
				table.insert(var_103_0, iter_103_2)
			end
		end
	end

	return var_103_0
end

function var_0_0.SetHeroNewTagRed(arg_104_0, arg_104_1, arg_104_2, arg_104_3)
	local var_104_0 = getData("heroNew", arg_104_1) or {}

	if var_104_0 then
		local var_104_1 = 0

		for iter_104_0, iter_104_1 in ipairs(var_104_0) do
			if iter_104_1 == arg_104_0 then
				var_104_1 = iter_104_0

				break
			end
		end

		local var_104_2 = false

		if var_104_1 > 0 then
			if not arg_104_3 then
				var_104_2 = true

				table.remove(var_104_0, var_104_1)
				manager.redPoint:setTip(arg_104_2, 0, RedPointStyle.SHOW_NEW_TAG)
			end
		elseif arg_104_3 then
			var_104_2 = true

			table.insert(var_104_0, arg_104_0)
			manager.redPoint:setTip(arg_104_2, 1, RedPointStyle.SHOW_NEW_TAG)
		end

		if var_104_2 then
			saveData("heroNew", arg_104_1, var_104_0)
		end
	end
end

function var_0_0.DispatchAllHeroNewRed(arg_105_0, arg_105_1)
	local var_105_0 = getData("heroNew", arg_105_0) or {}

	for iter_105_0, iter_105_1 in ipairs(var_105_0) do
		local var_105_1 = arg_105_1 .. iter_105_1

		manager.redPoint:setTip(var_105_1, 1, RedPointStyle.SHOW_NEW_TAG)
	end
end

function var_0_0.GetHeroShowData(arg_106_0, arg_106_1)
	local var_106_0 = {}

	if arg_106_1 then
		CommonFilterData:ClearFilter(Filter_Root_Define.Hero_Filter_List.filter_id)
	end

	local var_106_1 = CommonFilterData:IsAll(Filter_Root_Define.Hero_Filter_List.filter_id) or arg_106_1

	for iter_106_0, iter_106_1 in pairs(arg_106_0) do
		local var_106_2 = not var_0_0.GetIsHide(iter_106_1.id)

		if var_106_2 and not var_106_1 then
			local var_106_3 = HeroCfg[iter_106_1.id]
			local var_106_4 = CommonFilterData:SpecificHasFlag(Filter_Root_Define.Hero_Filter_List.filter_id, Filter_Group_Define.RACE.groupID, {
				Filter_Tags_Define["Race" .. var_106_3.race]
			})
			local var_106_5 = CommonFilterData:SpecificHasFlag(Filter_Root_Define.Hero_Filter_List.filter_id, Filter_Group_Define.ARRT.groupID, {
				Filter_Tags_Define["ARRT" .. var_106_3.ATK_attribute[1]]
			})
			local var_106_6 = CommonFilterData:SpecificHasFlag(Filter_Root_Define.Hero_Filter_List.filter_id, Filter_Group_Define.MECHAINISMTYPE.groupID, {
				Filter_Tags_Define["MECHAINISM" .. var_106_3.mechanism_type[1]]
			})

			var_106_2 = var_106_4 and var_106_5 and var_106_6
		end

		if var_106_2 then
			table.insert(var_106_0, iter_106_1)
		end
	end

	return var_106_0
end

function var_0_0.GetHeroShowIDList(arg_107_0, arg_107_1)
	local var_107_0 = {}

	if arg_107_1 then
		CommonFilterData:ClearFilter(Filter_Root_Define.Hero_Filter_List.filter_id)
	end

	local var_107_1 = CommonFilterData:IsAll(Filter_Root_Define.Hero_Filter_List.filter_id) or arg_107_1

	if var_107_1 then
		return arg_107_0
	end

	for iter_107_0, iter_107_1 in pairs(arg_107_0) do
		local var_107_2 = not var_0_0.GetIsHide(iter_107_1)

		if var_107_2 and not var_107_1 then
			local var_107_3 = HeroCfg[iter_107_1]
			local var_107_4 = CommonFilterData:SpecificHasFlag(Filter_Root_Define.Hero_Filter_List.filter_id, Filter_Group_Define.RACE.groupID, {
				Filter_Tags_Define["Race" .. var_107_3.race]
			})
			local var_107_5 = CommonFilterData:SpecificHasFlag(Filter_Root_Define.Hero_Filter_List.filter_id, Filter_Group_Define.ARRT.groupID, {
				Filter_Tags_Define["ARRT" .. var_107_3.ATK_attribute[1]]
			})
			local var_107_6 = CommonFilterData:SpecificHasFlag(Filter_Root_Define.Hero_Filter_List.filter_id, Filter_Group_Define.MECHAINISMTYPE.groupID, {
				Filter_Tags_Define["MECHAINISM" .. var_107_3.mechanism_type[1]]
			})

			var_107_2 = var_107_4 and var_107_5 and var_107_6
		end

		if var_107_2 then
			table.insert(var_107_0, iter_107_1)
		end
	end

	return var_107_0
end

function var_0_0.IsSpHero(arg_108_0)
	local var_108_0 = HeroCfg[arg_108_0]

	if var_108_0 then
		return var_108_0.role_type == 1
	end

	return false
end

function var_0_0.FormatFilterHeroDataList(arg_109_0, arg_109_1, arg_109_2, arg_109_3)
	local var_109_0 = HeroViewDataProxy.New(arg_109_0)

	var_109_0:SetTempHeroList(arg_109_3)

	local var_109_1 = {}

	for iter_109_0, iter_109_1 in ipairs(arg_109_1) do
		local var_109_2 = var_109_0:GetHeroData(iter_109_1).tempID

		var_109_1[iter_109_0] = {
			id = iter_109_1,
			trialID = var_109_2,
			type = arg_109_2,
			heroViewProxy = var_109_0
		}
	end

	return var_109_1
end

function var_0_0.IsNPC(arg_110_0)
	if arg_110_0 and HeroCfg[arg_110_0] then
		return HeroCfg[arg_110_0].private ~= 0
	end

	return false
end

function var_0_0.NeedHideInfo(arg_111_0)
	if arg_111_0 and HeroCfg[arg_111_0] then
		return HeroCfg[arg_111_0].hide_info == 1
	end

	return false
end

function var_0_0.IsNeedDisplayAdult(arg_112_0)
	return SDKTools.GetIsEnglish() and HeroRecordCfg[arg_112_0].age_en ~= ""
end

return var_0_0
