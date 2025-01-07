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
	GetBackHomeHeadSprite = function(arg_4_0)
		if IdolPveNpcCfg[arg_4_0] then
			arg_4_0 = IdolPveNpcCfg[arg_4_0].icon
		end

		if arg_4_0 then
			return getSpriteViaConfig("DormHeroHeadIcon", arg_4_0)
		end
	end,
	GetHeroIdolMaxProperty = function(arg_5_0, arg_5_1)
		local var_5_0 = {}
		local var_5_1 = BackHomeHeroCfg[arg_5_1]

		for iter_5_0, iter_5_1 in pairs(var_5_1.idol_base_attribute) do
			table.insert(var_5_0, iter_5_1[2])
		end

		return var_5_0
	end,
	GetChapterProgress = function(arg_6_0, arg_6_1)
		local var_6_0 = #IdolTraineeChapterCfg[arg_6_1].section_id_list
		local var_6_1 = IdolTraineeData:GetPveChapterData()[arg_6_1]
		local var_6_2 = 0

		if var_6_1 then
			for iter_6_0, iter_6_1 in pairs(var_6_1) do
				if iter_6_1.pass then
					var_6_2 = var_6_2 + 1
				end
			end
		end

		return var_6_2, var_6_0
	end,
	GetChapterScoreList = function(arg_7_0, arg_7_1)
		return IdolTraineeData:GetPveChapterData()[arg_7_1]
	end,
	GetOpponentData = function(arg_8_0, arg_8_1, arg_8_2, arg_8_3)
		if arg_8_2 == IdolTraineeConst.friendType.friend then
			return IdolTraineeData:GetCacheFriendList()[arg_8_1]
		elseif arg_8_2 == IdolTraineeConst.friendType.stranger then
			return IdolTraineeData:GetCacheOpponentList()[arg_8_1]
		end

		return {}
	end,
	GetEnemyUserData = function(arg_9_0, arg_9_1)
		local var_9_0 = IdolTraineeData:GetCacheFriendList()[arg_9_1] or IdolTraineeData:GetCacheOpponentList()[arg_9_1]

		if not var_9_0 then
			local var_9_1 = IdolTraineeData:GetHistoryBattleData()

			for iter_9_0, iter_9_1 in pairs(var_9_1) do
				if iter_9_1.userID == arg_9_1 then
					var_9_0 = iter_9_1

					break
				end
			end
		end

		return var_9_0
	end
}

local function var_0_1(arg_10_0)
	local var_10_0 = IdolTraineeSkillEffectCfg[arg_10_0]

	if not var_10_0 or var_10_0.valid_probability == 100 then
		return ""
	end

	local var_10_1 = IdolTraineeSkillDescCfg.DEFAULT_ROUND_PROBABILITY

	if not var_10_1 then
		return ""
	end

	return "，" .. string.format(var_10_1.pattern, var_10_0.valid_probability)
end

local function var_0_2(arg_11_0)
	local var_11_0 = IdolTraineeSkillEffectCfg[arg_11_0]

	if not var_11_0 or var_11_0.condition == 0 then
		return ""
	end

	local var_11_1 = "DEFAULT_CONDITION_" .. var_11_0.condition
	local var_11_2 = {}
	local var_11_3 = GetTips(var_11_0.object == 1 and "IDOL_SKILL_DESC_OBJ_0" or "IDOL_SKILL_DESC_OBJ_1")

	table.insert(var_11_2, var_11_3)

	if var_11_0.condition == 1 then
		local var_11_4 = IdolStageSceneCfg[var_11_0.con_param[1]] and IdolStageSceneCfg[var_11_0.con_param[1]].scene_show_name or ""

		table.insert(var_11_2, var_11_4)
	elseif var_11_0.condition == 2 or var_11_0.condition == 4 then
		local var_11_5 = var_11_0.con_param[1] .. ""

		table.insert(var_11_2, var_11_5)
	elseif var_11_0.condition == 5 then
		local var_11_6 = GetTips("IDOL_DANCE_TYPE_TIPS_" .. var_11_0.con_param[1])

		table.insert(var_11_2, var_11_6)
	end

	local var_11_7 = IdolTraineeSkillDescCfg[var_11_1]

	if not var_11_7 then
		return ""
	end

	return string.format(var_11_7.pattern, unpack(var_11_2)) .. "，"
end

local function var_0_3(arg_12_0, arg_12_1, arg_12_2, arg_12_3)
	local var_12_0 = IdolTraineeSkillEffectCfg[arg_12_0]
	local var_12_1 = var_12_0.effect_type
	local var_12_2 = arg_12_1 or var_12_0.probability >= 100
	local var_12_3 = {
		args = {},
		effect = var_12_1,
		target = var_12_0.object
	}

	if not arg_12_2 and var_12_0.trigger_time ~= 0 then
		var_12_3.delay = var_12_0.trigger_time
	end

	if not arg_12_3 and var_12_0.round ~= -1 then
		var_12_3.round = var_12_0.round
	end

	if not var_12_2 then
		var_12_3.chance = var_12_0.probability
	end

	if var_12_1 == 1 then
		var_12_3.args[1] = GetTips("IDOL_SKILL_ATTRIBUTE_" .. var_12_0.unique[1])
		var_12_3.positive = var_12_0.unique[2] >= 0
		var_12_3.buffValue = var_12_0.unique[2]
	elseif var_12_1 == 2 then
		var_12_3.args[1] = GetTips("IDOL_DANCE_TYPE_TIPS_" .. var_12_0.unique[1])
		var_12_3.positive = var_12_0.unique[2] >= 0
		var_12_3.buffValue = var_12_0.unique[2]
	elseif var_12_1 == 3 or var_12_1 == 4 or var_12_1 == 5 or var_12_1 == 6 or var_12_1 == 7 then
		var_12_3.positive = var_12_0.unique[1] >= 0
		var_12_3.buffValue = var_12_0.unique[1]
	elseif var_12_1 == 8 then
		var_12_3.args[1] = GetTips("IDOL_SKILL_ATTRIBUTE_" .. var_12_0.unique[1])
		var_12_3.positive = var_12_0.unique[2] >= 0
		var_12_3.buffValue = var_12_0.unique[2]
	else
		Debug.LogError("idol_trainee_skill_desc表中有类型程序未指定拼接描述规则" .. var_12_0.id)

		var_12_3.invalid = true
	end

	if var_12_3.buffValue then
		var_12_3.absBuffValue = math.abs(var_12_3.buffValue)
	end

	return var_12_3
end

local function var_0_4(arg_13_0, arg_13_1)
	local var_13_0 = {}

	for iter_13_0, iter_13_1 in ipairs(arg_13_0) do
		table.insert(var_13_0, arg_13_1(iter_13_1))
	end

	for iter_13_2, iter_13_3 in ipairs(var_13_0) do
		table.insert(arg_13_0, iter_13_3)
	end
end

local function var_0_5(arg_14_0)
	local var_14_0 = "BUFF_EFFECT"
	local var_14_1 = "_" .. arg_14_0.effect
	local var_14_2 = {
		var_14_0
	}
	local var_14_3 = "_DELAY"
	local var_14_4 = "_ROUND"
	local var_14_5 = "_RNG"
	local var_14_6 = "_POS"
	local var_14_7 = "_NEG"
	local var_14_8 = "_FULL"

	if arg_14_0.delay then
		var_0_4(var_14_2, function(arg_15_0)
			return arg_15_0 .. var_14_3
		end)
	end

	if arg_14_0.round then
		var_0_4(var_14_2, function(arg_16_0)
			return arg_16_0 .. var_14_4
		end)
	end

	if arg_14_0.chance then
		var_0_4(var_14_2, function(arg_17_0)
			return arg_17_0 .. var_14_5
		end)
	end

	if arg_14_0.delay and arg_14_0.round and arg_14_0.chance then
		table.insert(var_14_2, var_14_0 .. var_14_8)
	end

	local var_14_9 = arg_14_0.positive and var_14_6 or var_14_7

	for iter_14_0 = #var_14_2, 1, -1 do
		local var_14_10 = var_14_2[iter_14_0]
		local var_14_11 = IdolTraineeSkillDescCfg[var_14_10 .. var_14_9 .. var_14_1] or IdolTraineeSkillDescCfg[var_14_10 .. var_14_1]

		if var_14_11 then
			local var_14_12 = GetI18NText(var_14_11.pattern)

			if not var_14_11.is_full_info and (arg_14_0.chance or arg_14_0.round) then
				local var_14_13

				if arg_14_0.chance and arg_14_0.round then
					var_14_13 = GetI18NText(IdolTraineeSkillDescCfg.DEFAULT_JOIN.pattern)
				elseif arg_14_0.chance then
					var_14_13 = GetI18NText(IdolTraineeSkillDescCfg.DEFAULT_JOIN_NO_SUFFIX.pattern)
				else
					var_14_13 = GetI18NText(IdolTraineeSkillDescCfg.DEFAULT_JOIN_NO_PREFIX.pattern)
				end

				var_14_12 = LuaExchangeHelper.GetDescription(var_14_13, {
					GetI18NText(IdolTraineeSkillDescCfg.DEFAULT_PREFIX.pattern),
					GetI18NText(var_14_12),
					GetI18NText(IdolTraineeSkillDescCfg.DEFAULT_SUFFIX.pattern)
				})
			end

			return var_14_12
		end
	end

	return ""
end

local function var_0_6(arg_18_0)
	local var_18_0 = arg_18_0

	if not var_18_0.invalid then
		local var_18_1 = var_0_5(var_18_0)
		local var_18_2 = GetTips(var_18_0.target == 1 and "IDOL_SKILL_DESC_OBJ_0" or "IDOL_SKILL_DESC_OBJ_1")
		local var_18_3 = {
			var_18_2,
			var_18_0.buffValue,
			var_18_0.absBuffValue,
			var_18_0.chance or "",
			var_18_0.delay or "",
			var_18_0.round or "",
			unpack(var_18_0.args)
		}

		return LuaExchangeHelper.GetDescription(var_18_1, var_18_3)
	end

	return ""
end

function var_0_0.GetBuffDescString(arg_19_0, arg_19_1, arg_19_2, arg_19_3, arg_19_4, arg_19_5)
	local var_19_0
	local var_19_1 = arg_19_5 and "" or var_0_2(arg_19_1)
	local var_19_2 = var_0_1(arg_19_1)
	local var_19_3 = var_0_3(arg_19_1, arg_19_2, arg_19_3, arg_19_4)
	local var_19_4 = var_0_6(var_19_3)

	return var_19_1 .. var_19_4 .. var_19_2
end

function var_0_0.GetSkillDescString(arg_20_0, arg_20_1)
	local var_20_0 = IdolTraineeSkillCfg[arg_20_1]
	local var_20_1 = ""

	for iter_20_0, iter_20_1 in ipairs(var_20_0.skill_effect) do
		local var_20_2 = ""

		if iter_20_0 ~= #var_20_0.skill_effect then
			var_20_2 = "\n"
		end

		local var_20_3 = arg_20_0:GetBuffDescString(iter_20_1) .. var_20_2

		var_20_1 = var_20_1 .. var_20_3
	end

	return var_20_1
end

function var_0_0.GetSkillEffect(arg_21_0, arg_21_1)
	local var_21_0 = IdolTraineeSkillEffectCfg[arg_21_1]

	if var_21_0.effect_type == 1 then
		local var_21_1 = var_21_0.unique[1]
		local var_21_2 = var_21_0.unique[2]

		return var_21_1, var_21_2
	end

	return nil
end

function var_0_0.GetCurQuestRankInfo(arg_22_0)
	local var_22_0 = IdolTraineeData:GetQuestRankInfo()
	local var_22_1 = IdolTraineeRewardRankCfg[var_22_0]
	local var_22_2 = ItemTools.getItemNum(var_22_1.item_id[1])
	local var_22_3 = var_22_1.item_id[2]

	return var_22_0, var_22_2, var_22_3
end

function var_0_0.GetCurTrainMaxTimes(arg_23_0)
	local var_23_0 = DormRoomTools:GetUnlockRoomNum()
	local var_23_1 = 0

	for iter_23_0, iter_23_1 in pairs(GameSetting.dorm_idol_hero_exercise_times_limit.value) do
		if var_23_0 >= iter_23_1[1] then
			var_23_1 = iter_23_1[2]
		end
	end

	return var_23_1
end

function var_0_0.GetOpponentList(arg_24_0, arg_24_1)
	local var_24_0 = {}
	local var_24_1 = {}

	if arg_24_1 == IdolTraineeConst.friendType.friend then
		var_24_1 = IdolTraineeData:GetCacheFriendList()
	elseif arg_24_1 == IdolTraineeConst.friendType.stranger then
		var_24_1 = IdolTraineeData:GetCacheOpponentList()
	end

	for iter_24_0, iter_24_1 in pairs(var_24_1) do
		table.insert(var_24_0, iter_24_0)
	end

	return var_24_0
end

function var_0_0.GetHeroBattleInfoTemplate(arg_25_0, arg_25_1, arg_25_2, arg_25_3, arg_25_4)
	local var_25_0 = {
		heroIcon = "",
		heroID = 0,
		propertyData = {},
		propertyMax = {},
		skill = {}
	}

	if IdolTraineeConst.friendType.npc == arg_25_3 then
		local var_25_1, var_25_2 = IdolTraineeData:GetNpcPropertyByStageID(arg_25_4)

		var_25_0.heroID = var_25_2
		var_25_0.skinID = var_25_2
		var_25_0.heroIcon = DormHeroTools.GetBackHomeHeadSprite(var_25_2)
		var_25_0.propertyData = var_25_1
		var_25_0.propertyMax = var_25_1
		var_25_0.skill = IdolTraineeData:GetIdolHeroSkillList(var_25_2)
	elseif arg_25_2 then
		local var_25_3

		if arg_25_3 == IdolTraineeConst.friendType.friend then
			var_25_3 = IdolTraineeData:GetCacheFriendList()[arg_25_2]
		else
			var_25_3 = IdolTraineeData:GetCacheOpponentList()[arg_25_2]
		end

		var_25_0.heroID = var_25_3.hero_id
		var_25_0.skinID = var_25_3.skin_id
		var_25_0.heroIcon = IdolTraineeTools.GetBackHomeHeadSprite(var_25_3.skin_id)
		var_25_0.propertyData = var_25_3.property
		var_25_0.propertyMax = IdolTraineeTools:GetHeroIdolMaxProperty(var_25_3.hero_id)
		var_25_0.skill = IdolTraineeData:GetIdolHeroSkillList(var_25_3.hero_id)
	else
		var_25_0.heroID = arg_25_1
		var_25_0.skinID = DormHeroTools:GetCurSkinID(arg_25_1)
		var_25_0.heroIcon = IdolTraineeTools.GetBackHomeHeadSprite(var_25_0.skinID)
		var_25_0.propertyData = IdolTraineeData:GetIdolHeroData(arg_25_1)
		var_25_0.propertyMax = IdolTraineeTools:GetHeroIdolMaxProperty(arg_25_1)
		var_25_0.skill = IdolTraineeData:GetIdolHeroSkillList(arg_25_1)
	end

	return var_25_0
end

function var_0_0.GetAbilityIcon(arg_26_0, arg_26_1)
	return
end

function var_0_0.GetBuffIcon(arg_27_0, arg_27_1)
	local var_27_0 = IdolTraineeSkillEffectCfg[arg_27_1]

	if not var_27_0.effect_icon then
		return nil
	end

	return getSpriteWithoutAtlas(SpritePathCfg.IdolDanceBuffIcon.path .. var_27_0.effect_icon)
end

function var_0_0.GetSkillIcon(arg_28_0, arg_28_1)
	local var_28_0 = IdolTraineeSkillCfg[arg_28_1]

	if not var_28_0.icon then
		return nil
	end

	return getSpriteWithoutAtlas(SpritePathCfg.IdolDanceSkillIcon.path .. var_28_0.icon)
end

function var_0_0.CheckDanceTaskComplete(arg_29_0)
	local var_29_0 = TaskTools:GetIdolTraineeTaskSortList()

	for iter_29_0, iter_29_1 in pairs(var_29_0) do
		local var_29_1 = TaskData2:GetTaskComplete(iter_29_1)

		if TaskData2:GetTaskProgress(iter_29_1) >= AssignmentCfg[iter_29_1].need and not var_29_1 then
			return true
		end
	end
end

function var_0_0.GetPveStageChapter(arg_30_0, arg_30_1)
	for iter_30_0, iter_30_1 in ipairs(IdolTraineeChapterCfg.all) do
		local var_30_0 = IdolTraineeChapterCfg[iter_30_1]

		if table.keyof(var_30_0.section_id_list, arg_30_1) ~= nil then
			return iter_30_1
		end
	end

	return nil
end

local var_0_7 = 2

function var_0_0.GetMusicDuration(arg_31_0)
	local var_31_0 = IdolStageMusicCfg[arg_31_0]

	if var_31_0 then
		local var_31_1 = var_31_0.music_duration

		if var_31_1 then
			return var_31_1
		end

		local var_31_2 = var_31_0.music_json
		local var_31_3 = AssetEx.LoadText(var_31_2)
		local var_31_4 = require("cjson").decode(var_31_3)
		local var_31_5 = 0

		for iter_31_0 = 1, var_0_7 do
			local var_31_6 = var_31_4["track" .. iter_31_0]

			for iter_31_1, iter_31_2 in pairs(var_31_6) do
				local var_31_7 = math.max(unpack(iter_31_2))

				if var_31_5 < var_31_7 then
					var_31_5 = var_31_7
				end
			end
		end

		return var_31_5 / 1000
	end

	return nil
end

function var_0_0.GetDanceDIYActionUnlockDesc(arg_32_0)
	local var_32_0 = IdolDanceDIYActionCfg[arg_32_0].unlock_condition

	if var_32_0 == 0 then
		return nil
	end

	local var_32_1 = nullable(ConditionCfg, var_32_0, "desc")

	if var_32_1 then
		return GetTipsF(var_32_1, IdolDanceDIYActionCfg[arg_32_0].need)
	else
		return ""
	end
end

function var_0_0.GetDIYDataFromLoadInfo(arg_33_0)
	if arg_33_0 == nil then
		return nil
	elseif arg_33_0.source == IdolTraineeConst.DataSource.MyData then
		return IdolTraineeData:GetDanceDIYSequence(arg_33_0.id)
	elseif arg_33_0.source == IdolTraineeConst.DataSource.MySharedData then
		return arg_33_0.data or IdolTraineeData:GetSharedDanceDIYSequence(arg_33_0.id)
	else
		return arg_33_0.data
	end
end

function var_0_0.GetDIYDanceDataName(arg_34_0)
	return GetTipsF("IDOL_DANCE_EDIT_SEQ_NAME", arg_34_0)
end

function var_0_0.GetSharedDIYDanceDataName(arg_35_0)
	return GetTipsF("IDOL_DANCE_EDIT_SHOW_SHARED_AUTHOR_NAME", arg_35_0 or "--")
end

function var_0_0.CalculateActionCount(arg_36_0)
	local var_36_0 = 0

	if arg_36_0 then
		for iter_36_0, iter_36_1 in ipairs(arg_36_0) do
			if iter_36_1 and iter_36_1 ~= 0 then
				var_36_0 = var_36_0 + 1
			end
		end
	end

	return var_36_0
end

local function var_0_8(arg_37_0, arg_37_1, arg_37_2)
	if CommonFilterData:AtLeastOneChooseGroup(arg_37_0.filter_id, arg_37_1.groupID) and not CommonFilterData:HasIndexFlag(arg_37_0.filter_id, arg_37_1.groupID, arg_37_2) then
		return false
	end

	return true
end

function var_0_0.FilterDIYDanceAction(arg_38_0)
	local var_38_0 = IdolDanceDIYActionCfg[arg_38_0]
	local var_38_1 = Filter_Root_Define.IDOL_DANCE_ACTION_Filter_List
	local var_38_2 = Filter_Group_Define.IDOL_DANCE_ACTION_STYLE
	local var_38_3 = Filter_Group_Define.IDOL_DANCE_ACTION_BEAT

	if not var_0_8(var_38_1, var_38_2, var_38_2.tags[var_38_0.type]) then
		return false
	end

	if not var_0_8(var_38_1, var_38_3, Filter_Tags_Define["IdolDanceBeat" .. var_38_0.beat]) then
		return false
	end

	return true
end

function var_0_0.ViewSharedDIY(arg_39_0)
	IdolTraineeAction.GetSharedDanceDIYSequenceDetail(arg_39_0.id, function(arg_40_0)
		IdolTraineeData.ParseDanceDIYSequence(arg_40_0.base_sequence, arg_39_0.data)
		IdolTraineeData.UpdateDIYStatistics(arg_39_0.data, arg_40_0)

		arg_39_0.data.myTodayLiked = arg_40_0.own_today_liked_num

		DIYBridge.EnterDIY(arg_39_0)
	end)
end

function var_0_0.FetchSharedDIY(arg_41_0, arg_41_1, arg_41_2)
	local var_41_0 = IdolTraineeData:BriefListCacheAvailable(arg_41_1)

	if arg_41_0 or not var_41_0 then
		IdolTraineeAction.GetSharedDanceDIYBriefList(arg_41_1, function(arg_42_0)
			IdolTraineeData.cachedAuthorInfo = IdolTraineeAction.ProcessAuthorInfo(arg_42_0, IdolTraineeData.cachedAuthorInfo)

			local var_42_0 = IdolTraineeAction.ProcessBriefList(arg_42_0, IdolTraineeData.cachedAuthorInfo)

			table.sort(var_42_0, function(arg_43_0, arg_43_1)
				return arg_43_0.recommend > arg_43_1.recommend
			end)
			IdolTraineeData:CacheBriefList(arg_41_1, var_42_0)

			if arg_41_2 then
				arg_41_2(var_42_0)
			end
		end, function()
			if arg_41_2 then
				arg_41_2(var_41_0 or {})
			end
		end)
	elseif arg_41_2 then
		arg_41_2(var_41_0)
	end
end

return var_0_0
