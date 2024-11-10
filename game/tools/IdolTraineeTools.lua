local var_0_0 = {
	CheckHeroIsAttack = function(arg_1_0, arg_1_1)
		return IdolTraineeData:GetCurAttackHero()[arg_1_1]
	end,
	CheckHeroIsDefine = function(arg_2_0, arg_2_1)
		return IdolTraineeData:GetCurDefendHero()[arg_2_1]
	end,
	CheckHeroRaceBuff = function(arg_3_0, arg_3_1)
		return IdolTraineeData:GetCurBuffCamp()[HeroCfg[arg_3_1].race]
	end,
	GetHeroIdolMaxProperty = function(arg_4_0, arg_4_1)
		local var_4_0 = {}
		local var_4_1 = BackHomeHeroCfg[arg_4_1]

		for iter_4_0, iter_4_1 in pairs(var_4_1.idol_base_attribute) do
			table.insert(var_4_0, iter_4_1[2])
		end

		return var_4_0
	end,
	GetChapterProgress = function(arg_5_0, arg_5_1)
		local var_5_0 = #IdolTraineeChapterCfg[arg_5_1].section_id_list
		local var_5_1 = IdolTraineeData:GetPveChapterData()[arg_5_1]
		local var_5_2 = 0

		if var_5_1 then
			for iter_5_0, iter_5_1 in pairs(var_5_1) do
				if iter_5_1.pass then
					var_5_2 = var_5_2 + 1
				end
			end
		end

		return var_5_2, var_5_0
	end,
	GetChapterScoreList = function(arg_6_0, arg_6_1)
		return IdolTraineeData:GetPveChapterData()[arg_6_1]
	end,
	GetOpponentData = function(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
		if arg_7_2 == IdolTraineeConst.friendType.friend then
			return IdolTraineeData:GetCacheFriendList()[arg_7_1]
		elseif arg_7_2 == IdolTraineeConst.friendType.stranger then
			return IdolTraineeData:GetCacheOpponentList()[arg_7_1]
		end

		return {}
	end,
	GetEnemyUserData = function(arg_8_0, arg_8_1)
		local var_8_0 = IdolTraineeData:GetCacheFriendList()[arg_8_1] or IdolTraineeData:GetCacheOpponentList()[arg_8_1]

		if not var_8_0 then
			local var_8_1 = IdolTraineeData:GetHistoryBattleData()

			for iter_8_0, iter_8_1 in pairs(var_8_1) do
				if iter_8_1.userID == arg_8_1 then
					var_8_0 = iter_8_1

					break
				end
			end
		end

		return var_8_0
	end
}

local function var_0_1(arg_9_0, arg_9_1, arg_9_2, arg_9_3)
	local var_9_0 = IdolTraineeSkillEffectCfg[arg_9_0]
	local var_9_1 = var_9_0.effect_type
	local var_9_2 = arg_9_1 or var_9_0.probability >= 100
	local var_9_3 = {
		args = {},
		effect = var_9_1,
		target = var_9_0.object
	}

	if not arg_9_2 and var_9_0.trigger_time ~= 0 then
		var_9_3.delay = var_9_0.trigger_time
	end

	if not arg_9_3 then
		var_9_3.round = var_9_0.round
	end

	if not var_9_2 then
		var_9_3.chance = var_9_0.probability
	end

	if var_9_1 == 1 then
		var_9_3.args[1] = GetTips("IDOL_SKILL_ATTRIBUTE_" .. var_9_0.unique[1])
		var_9_3.positive = var_9_0.unique[2] >= 0
		var_9_3.buffValue = var_9_0.unique[2]
	elseif var_9_1 == 2 then
		var_9_3.args[1] = GetTips("IDOL_DANCE_TYPE_TIPS_" .. var_9_0.unique[1])
		var_9_3.positive = var_9_0.unique[2] >= 0
		var_9_3.buffValue = var_9_0.unique[2]
	elseif var_9_1 == 3 or var_9_1 == 4 or var_9_1 == 5 or var_9_1 == 6 or var_9_1 == 7 then
		var_9_3.positive = var_9_0.unique[1] >= 0
		var_9_3.buffValue = var_9_0.unique[1]
	elseif var_9_1 == 8 then
		var_9_3.args[1] = GetTips("IDOL_SKILL_ATTRIBUTE_" .. var_9_0.unique[1])
		var_9_3.positive = var_9_0.unique[2] >= 0
		var_9_3.buffValue = var_9_0.unique[2]
	else
		Debug.LogError("idol_trainee_skill_desc表中有类型程序未指定拼接描述规则" .. descCfg.id)

		var_9_3.invalid = true
	end

	if var_9_3.buffValue then
		var_9_3.absBuffValue = math.abs(var_9_3.buffValue)
	end

	return var_9_3
end

local function var_0_2(arg_10_0, arg_10_1)
	local var_10_0 = {}

	for iter_10_0, iter_10_1 in ipairs(arg_10_0) do
		table.insert(var_10_0, arg_10_1(iter_10_1))
	end

	for iter_10_2, iter_10_3 in ipairs(var_10_0) do
		table.insert(arg_10_0, iter_10_3)
	end
end

local function var_0_3(arg_11_0)
	local var_11_0 = "BUFF_EFFECT"
	local var_11_1 = "_" .. arg_11_0.effect
	local var_11_2 = {
		var_11_0
	}
	local var_11_3 = "_DELAY"
	local var_11_4 = "_ROUND"
	local var_11_5 = "_RNG"
	local var_11_6 = "_POS"
	local var_11_7 = "_NEG"
	local var_11_8 = "_FULL"

	if arg_11_0.delay then
		var_0_2(var_11_2, function(arg_12_0)
			return arg_12_0 .. var_11_3
		end)
	end

	if arg_11_0.round then
		var_0_2(var_11_2, function(arg_13_0)
			return arg_13_0 .. var_11_4
		end)
	end

	if arg_11_0.chance then
		var_0_2(var_11_2, function(arg_14_0)
			return arg_14_0 .. var_11_5
		end)
	end

	if arg_11_0.delay and arg_11_0.round and arg_11_0.chance then
		table.insert(var_11_2, var_11_0 .. var_11_8)
	end

	local var_11_9 = arg_11_0.positive and var_11_6 or var_11_7

	for iter_11_0 = #var_11_2, 1, -1 do
		local var_11_10 = var_11_2[iter_11_0]
		local var_11_11 = IdolTraineeSkillDescCfg[var_11_10 .. var_11_9 .. var_11_1] or IdolTraineeSkillDescCfg[var_11_10 .. var_11_1]

		if var_11_11 then
			local var_11_12 = GetI18NText(var_11_11.pattern)

			if not var_11_11.is_full_info and (arg_11_0.chance or arg_11_0.round) then
				local var_11_13

				if arg_11_0.chance and arg_11_0.round then
					var_11_13 = GetI18NText(IdolTraineeSkillDescCfg.DEFAULT_JOIN.pattern)
				elseif arg_11_0.chance then
					var_11_13 = GetI18NText(IdolTraineeSkillDescCfg.DEFAULT_JOIN_NO_SUFFIX.pattern)
				else
					var_11_13 = GetI18NText(IdolTraineeSkillDescCfg.DEFAULT_JOIN_NO_PREFIX.pattern)
				end

				var_11_12 = LuaExchangeHelper.GetDescription(var_11_13, {
					GetI18NText(IdolTraineeSkillDescCfg.DEFAULT_PREFIX.pattern),
					GetI18NText(var_11_12),
					GetI18NText(IdolTraineeSkillDescCfg.DEFAULT_SUFFIX.pattern)
				})
			end

			return var_11_12
		end
	end

	return ""
end

local function var_0_4(arg_15_0)
	local var_15_0 = arg_15_0

	if not var_15_0.invalid then
		local var_15_1 = var_0_3(var_15_0)
		local var_15_2 = GetTips(var_15_0.target == 1 and "IDOL_SKILL_DESC_OBJ_0" or "IDOL_SKILL_DESC_OBJ_1")
		local var_15_3 = {
			var_15_2,
			var_15_0.buffValue,
			var_15_0.absBuffValue,
			var_15_0.chance or "",
			var_15_0.delay or "",
			var_15_0.round or "",
			unpack(var_15_0.args)
		}

		return LuaExchangeHelper.GetDescription(var_15_1, var_15_3)
	end

	return ""
end

function var_0_0.GetBuffDescString(arg_16_0, arg_16_1, arg_16_2, arg_16_3, arg_16_4)
	local var_16_0 = var_0_1(arg_16_1, arg_16_2, arg_16_3, arg_16_4)

	return (var_0_4(var_16_0))
end

function var_0_0.GetSkillDescString(arg_17_0, arg_17_1)
	local var_17_0 = IdolTraineeSkillCfg[arg_17_1]
	local var_17_1 = ""

	for iter_17_0, iter_17_1 in ipairs(var_17_0.skill_effect) do
		local var_17_2 = ""

		if iter_17_0 ~= #var_17_0.skill_effect then
			var_17_2 = "\n"
		end

		local var_17_3 = arg_17_0:GetBuffDescString(iter_17_1) .. var_17_2

		var_17_1 = var_17_1 .. var_17_3
	end

	return var_17_1
end

function var_0_0.GetSkillEffect(arg_18_0, arg_18_1)
	local var_18_0 = IdolTraineeSkillEffectCfg[arg_18_1]

	if var_18_0.effect_type == 1 then
		local var_18_1 = var_18_0.unique[1]
		local var_18_2 = var_18_0.unique[2]

		return var_18_1, var_18_2
	end

	return nil
end

function var_0_0.GetCurQuestRankInfo(arg_19_0)
	local var_19_0 = IdolTraineeData:GetQuestRankInfo()
	local var_19_1 = IdolTraineeRewardRankCfg[var_19_0]
	local var_19_2 = ItemTools.getItemNum(var_19_1.item_id[1])
	local var_19_3 = var_19_1.item_id[2]

	return var_19_0, var_19_2, var_19_3
end

function var_0_0.GetCurTrainMaxTimes(arg_20_0)
	local var_20_0 = DormRoomTools:GetUnlockRoomNum()
	local var_20_1 = 0

	for iter_20_0, iter_20_1 in pairs(GameSetting.dorm_idol_hero_exercise_times_limit.value) do
		if var_20_0 >= iter_20_1[1] then
			var_20_1 = iter_20_1[2]
		end
	end

	return var_20_1
end

function var_0_0.GetOpponentList(arg_21_0, arg_21_1)
	local var_21_0 = {}
	local var_21_1 = {}

	if arg_21_1 == IdolTraineeConst.friendType.friend then
		var_21_1 = IdolTraineeData:GetCacheFriendList()
	elseif arg_21_1 == IdolTraineeConst.friendType.stranger then
		var_21_1 = IdolTraineeData:GetCacheOpponentList()
	end

	for iter_21_0, iter_21_1 in pairs(var_21_1) do
		table.insert(var_21_0, iter_21_0)
	end

	return var_21_0
end

function var_0_0.GetHeroBattleInfoTemplate(arg_22_0, arg_22_1, arg_22_2, arg_22_3, arg_22_4)
	local var_22_0 = {
		heroIcon = "",
		heroID = 0,
		propertyData = {},
		propertyMax = {},
		skill = {}
	}

	if IdolTraineeConst.friendType.npc == arg_22_3 then
		local var_22_1, var_22_2 = IdolTraineeData:GetNpcPropertyByStageID(arg_22_4)

		var_22_0.heroID = var_22_2
		var_22_0.heroIcon = DormHeroTools.GetBackHomeHeadSprite(var_22_2)
		var_22_0.propertyData = var_22_1
		var_22_0.propertyMax = var_22_1
		var_22_0.skill = IdolTraineeData:GetIdolHeroSkillList(var_22_2)

		return var_22_0
	end

	if arg_22_2 then
		local var_22_3

		if arg_22_3 == IdolTraineeConst.friendType.friend then
			var_22_3 = IdolTraineeData:GetCacheFriendList()[arg_22_2]
		else
			var_22_3 = IdolTraineeData:GetCacheOpponentList()[arg_22_2]
		end

		var_22_0.heroID = var_22_3.hero_id
		var_22_0.heroIcon = DormHeroTools.GetBackHomeHeadSprite(var_22_3.hero_id)
		var_22_0.propertyData = var_22_3.property
		var_22_0.propertyMax = IdolTraineeTools:GetHeroIdolMaxProperty(var_22_3.hero_id)
		var_22_0.skill = IdolTraineeData:GetIdolHeroSkillList(var_22_3.hero_id)
	else
		var_22_0.heroID = arg_22_1
		var_22_0.heroIcon = DormHeroTools.GetBackHomeHeadSprite(arg_22_1)
		var_22_0.propertyData = IdolTraineeData:GetIdolHeroData(arg_22_1)
		var_22_0.propertyMax = IdolTraineeTools:GetHeroIdolMaxProperty(arg_22_1)
		var_22_0.skill = IdolTraineeData:GetIdolHeroSkillList(arg_22_1)
	end

	return var_22_0
end

function var_0_0.GetAbilityIcon(arg_23_0, arg_23_1)
	return
end

function var_0_0.GetBuffIcon(arg_24_0, arg_24_1)
	local var_24_0 = IdolTraineeSkillEffectCfg[arg_24_1]

	if not var_24_0.effect_icon then
		return nil
	end

	return getSpriteWithoutAtlas(SpritePathCfg.IdolDanceBuffIcon.path .. var_24_0.effect_icon)
end

function var_0_0.GetSkillIcon(arg_25_0, arg_25_1)
	local var_25_0 = IdolTraineeSkillCfg[arg_25_1]

	if not var_25_0.icon then
		return nil
	end

	return getSpriteWithoutAtlas(SpritePathCfg.IdolDanceSkillIcon.path .. var_25_0.icon)
end

function var_0_0.CheckDanceTaskComplete(arg_26_0)
	local var_26_0 = TaskTools:GetIdolTraineeTaskSortList()

	for iter_26_0, iter_26_1 in pairs(var_26_0) do
		local var_26_1 = TaskData2:GetTaskComplete(iter_26_1)

		if TaskData2:GetTaskProgress(iter_26_1) >= AssignmentCfg[iter_26_1].need and not var_26_1 then
			return true
		end
	end
end

function var_0_0.GetPveStageChapter(arg_27_0, arg_27_1)
	for iter_27_0, iter_27_1 in ipairs(IdolTraineeChapterCfg.all) do
		local var_27_0 = IdolTraineeChapterCfg[iter_27_1]

		if table.keyof(var_27_0.section_id_list, arg_27_1) ~= nil then
			return iter_27_1
		end
	end

	return nil
end

return var_0_0
