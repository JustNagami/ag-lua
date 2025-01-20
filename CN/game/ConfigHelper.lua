local var_0_0 = {
	{
		ItemCfg,
		ItemCfg2
	},
	{
		ShopCfg,
		ShopCfg2,
		ShopCfg3
	},
	{
		EquipCfg,
		EquipCfg2
	}
}

for iter_0_0, iter_0_1 in pairs(var_0_0) do
	setmetatable(iter_0_1[1], {
		__index = function(arg_1_0, arg_1_1)
			for iter_1_0, iter_1_1 in ipairs(iter_0_1) do
				local var_1_0 = rawget(iter_1_1, arg_1_1)

				if var_1_0 then
					return var_1_0
				end
			end
		end
	})
end

for iter_0_2, iter_0_3 in ipairs(ChapterClientCfg.all) do
	if ChapterClientCfg[iter_0_3].not_chapter_id == false then
		for iter_0_4, iter_0_5 in ipairs(ChapterClientCfg[iter_0_3].chapter_list) do
			ChapterCfg[iter_0_5].clientID = iter_0_3
			ChapterClientCfg[iter_0_3].difficulty = ChapterCfg[iter_0_5].difficulty
		end
	else
		for iter_0_6, iter_0_7 in ipairs(ChapterClientCfg[iter_0_3].chapter_list) do
			ChapterClientCfg[iter_0_7].parentToggle = ChapterClientCfg[iter_0_3].toggle

			for iter_0_8, iter_0_9 in ipairs(ChapterClientCfg[iter_0_7].chapter_list) do
				ChapterCfg[iter_0_9].toggle = ChapterClientCfg[iter_0_7].toggle
			end
		end
	end
end

local var_0_1 = {}

for iter_0_10, iter_0_11 in pairs(ChapterCfg.all) do
	local var_0_2 = ChapterCfg[iter_0_11]

	for iter_0_12, iter_0_13 in ipairs(var_0_2.section_id_list) do
		if not var_0_1[iter_0_13] then
			var_0_1[iter_0_13] = iter_0_11
		end
	end
end

local var_0_3 = {}

for iter_0_14, iter_0_15 in ipairs(ChapterCfg.get_id_list_by_type[BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_PLOT]) do
	local var_0_4 = ChapterCfg[iter_0_15]

	var_0_3[var_0_4.sub_type] = var_0_3[var_0_4.sub_type] or {}
	var_0_3[var_0_4.sub_type][var_0_4.difficulty] = var_0_3[var_0_4.sub_type][var_0_4.difficulty] or {}

	table.insert(var_0_3[var_0_4.sub_type][var_0_4.difficulty], iter_0_15)
end

function getChapterNumList(arg_2_0)
	return var_0_3[arg_2_0]
end

function getChapterList()
	return var_0_3
end

local var_0_5 = {}

for iter_0_16, iter_0_17 in ipairs(ChapterClientCfg.get_id_list_by_toggle[BattleConst.TOGGLE.PLOT]) do
	local var_0_6 = ChapterClientCfg[iter_0_17].chapter_list[1]
	local var_0_7 = ChapterCfg[var_0_6].difficulty

	var_0_5[var_0_7] = var_0_5[var_0_7] or {}

	if #ChapterCfg[var_0_6].section_id_list > 0 then
		table.insert(var_0_5[var_0_7], iter_0_17)
	end
end

function getChapterClientList()
	return var_0_5
end

StageTools.InitStageArchiveCfg()

local function var_0_8(arg_5_0)
	for iter_5_0, iter_5_1 in ipairs(arg_5_0.all) do
		if type(arg_5_0[iter_5_1].next_show_id_list) == "table" then
			for iter_5_2, iter_5_3 in ipairs(arg_5_0[iter_5_1].next_show_id_list) do
				arg_5_0[iter_5_3].pre_show_id_list = arg_5_0[iter_5_3].pre_show_id_list or {}

				table.insert(arg_5_0[iter_5_3].pre_show_id_list, iter_5_1)
			end
		end

		if type(arg_5_0[iter_5_1].next_unlock_id_list) == "table" then
			for iter_5_4, iter_5_5 in ipairs(arg_5_0[iter_5_1].next_unlock_id_list) do
				arg_5_0[iter_5_5].pre_unlock_id_list = arg_5_0[iter_5_5].pre_unlock_id_list or {}

				table.insert(arg_5_0[iter_5_5].pre_unlock_id_list, iter_5_1)
			end
		end
	end
end

local var_0_9 = {
	BattleChapterStageCfg,
	BattleDailyStageCfg,
	BattleActivityStoryStageCfg
}

for iter_0_18, iter_0_19 in pairs(var_0_9) do
	var_0_8(iter_0_19)
end

local var_0_10 = GameSetting.guide_map.value2
local var_0_11 = string.split(var_0_10, ",")
local var_0_12 = {}

for iter_0_20, iter_0_21 in ipairs(var_0_11) do
	local var_0_13 = string.split(iter_0_21, "=")

	if var_0_13[1] and var_0_13[2] then
		var_0_12[tonumber(var_0_13[1])] = tonumber(var_0_13[2])
	end
end

GameSetting.guide_map.value2 = var_0_12

local var_0_14 = {}

for iter_0_22, iter_0_23 in pairs(WarchessHexCfg) do
	if iter_0_23.id then
		local var_0_15 = GridConfig.New()

		var_0_15.id = iter_0_23.id
		var_0_15.walkable = iter_0_23.move
		var_0_15.interact = iter_0_23.interact
		var_0_15.explode = iter_0_23.explode
		var_0_15.stonecanmove = iter_0_23.stonecanmove
		var_0_15.stonecaninteract = iter_0_23.stonecaninteract

		table.insert(var_0_14, var_0_15)
	end
end

WarchessHexCfg.AllGridConfig = var_0_14

local var_0_16 = {}

for iter_0_24, iter_0_25 in pairs(WarchessLevelCfg.all) do
	local var_0_17 = WarchessLevelCfg[iter_0_25]

	if type(var_0_17.trial_stage_list) == "table" then
		for iter_0_26, iter_0_27 in pairs(var_0_17.trial_stage_list) do
			var_0_16[iter_0_27] = var_0_17.id_level
		end
	end
end

function GetChessLevelIDByStageID(arg_6_0)
	return var_0_16[arg_6_0]
end

local var_0_18 = {}

for iter_0_28, iter_0_29 in pairs(BackHomeCfg) do
	if iter_0_29.id then
		local var_0_19 = DormMapCfg.New()

		var_0_19.id = iter_0_29.id
		var_0_19.name = iter_0_29.scene
		var_0_19.previewParams = DormCameraParams.New()
		var_0_19.editParams = DormCameraParams.New()

		local var_0_20 = DormCameraCfg[iter_0_29.camera_preview]

		var_0_19.previewParams.value = Vector2.New(var_0_20.value[1], var_0_20.value[2])
		var_0_19.previewParams.topRig = Vector2.New(var_0_20.toprig[1], var_0_20.toprig[2])
		var_0_19.previewParams.middleRig = Vector2.New(var_0_20.middlerig[1], var_0_20.middlerig[2])
		var_0_19.previewParams.bottomRig = Vector2.New(var_0_20.bottomrig[1], var_0_20.bottomrig[2])
		var_0_19.previewParams.topRigInterval = Vector2.New(var_0_20.toprig_interval[1], var_0_20.toprig_interval[2])

		local var_0_21 = DormCameraCfg[iter_0_29.camera_edit]

		var_0_19.editParams.value = Vector2.New(var_0_21.value[1], var_0_21.value[2])
		var_0_19.editParams.topRig = Vector2.New(var_0_21.toprig[1], var_0_21.toprig[2])
		var_0_19.editParams.middleRig = Vector2.New(var_0_21.middlerig[1], var_0_21.middlerig[2])
		var_0_19.editParams.bottomRig = Vector2.New(var_0_21.bottomrig[1], var_0_21.bottomrig[2])
		var_0_19.editParams.topRigInterval = Vector2.New(var_0_21.toprig_interval[1], var_0_21.toprig_interval[2])

		table.insert(var_0_18, var_0_19)
	end
end

BackHomeCfg.AllMapCfg = var_0_18

local var_0_22 = {}

for iter_0_30, iter_0_31 in pairs(BackHomeFurniture) do
	if iter_0_31.id and not DormSpecialFurnitureTools:JudgeFurIsSpecialType(iter_0_31.id) then
		local var_0_23 = FurnitureConfig.New()

		var_0_23.id = iter_0_31.id
		var_0_23.prefab = iter_0_31.model
		var_0_23.type = {
			iter_0_31.display_type,
			iter_0_31.sub_type or 0
		}
		var_0_23.width = iter_0_31.title[1]
		var_0_23.height = iter_0_31.title[2]
		var_0_23.depth = iter_0_31.title[3] or 0

		table.insert(var_0_22, var_0_23)
	end
end

BackHomeFurniture.AllFurnitureConfig = var_0_22

local var_0_24 = {}
local var_0_25 = {}

for iter_0_32, iter_0_33 in pairs(HeroSkillCfg.all) do
	local var_0_26 = HeroSkillCfg[iter_0_33]

	if var_0_26.strengthen_desc and var_0_26.strengthen_desc ~= "" then
		for iter_0_34, iter_0_35 in ipairs(var_0_26.strengthen_desc) do
			if iter_0_35[1] then
				var_0_24[iter_0_35[1]] = iter_0_33
			end
		end
	end
end

for iter_0_36, iter_0_37 in pairs(WeaponEffectCfg.all) do
	local var_0_27 = WeaponEffectCfg[iter_0_37]

	if iter_0_37 > 0 and type(var_0_27.strengthen_description) == "table" and var_0_27.strengthen_description[1] then
		var_0_25[var_0_27.strengthen_description[1]] = WeaponServantCfg.get_id_list_by_effect[iter_0_37][1]
	end
end

function getSkillAffectByModule(arg_7_0)
	return var_0_24[arg_7_0]
end

function getWeaponServantAffectByModule(arg_8_0)
	return var_0_25[arg_8_0]
end

local var_0_28 = {}

for iter_0_38, iter_0_39 in pairs(AstrolabeEffectCfg.all) do
	local var_0_29 = AstrolabeEffectCfg[iter_0_39]

	if type(var_0_29.equip_orange_desc) == "table" then
		for iter_0_40, iter_0_41 in pairs(var_0_29.equip_orange_desc) do
			if var_0_28[iter_0_41[3]] == nil then
				var_0_28[iter_0_41[3]] = {}
			end

			var_0_28[iter_0_41[3]][iter_0_41[1]] = var_0_29.id
		end
	end
end

function getAstrolabeID(arg_9_0, arg_9_1)
	if var_0_28[arg_9_0] == nil then
		print("配置错误！检查AstrolabeEffectCfg和WeaponModuleEffectCfg")

		return
	end

	return var_0_28[arg_9_0][arg_9_1]
end

HERO_FRAGMENT_VALUE = 10000

for iter_0_42, iter_0_43 in pairs(ItemCfg.get_id_list_by_type[ItemConst.ITEM_TYPE.HERO]) do
	ItemCfg[iter_0_43].fragment = iter_0_43 + HERO_FRAGMENT_VALUE
end

for iter_0_44, iter_0_45 in pairs(ItemCfg.get_id_list_by_type[ItemConst.ITEM_TYPE.HERO_PIECE]) do
	ItemCfg[iter_0_45].hero_id = iter_0_45 - HERO_FRAGMENT_VALUE
end

for iter_0_46, iter_0_47 in pairs(ActivityPtCfg.all) do
	ItemCfg[ActivityPtCfg[iter_0_47].item_id].activity_id = iter_0_47
end

ActivityPtRepeatCfg.GetCfgFromActivityIdAndStageId = {}

for iter_0_48, iter_0_49 in ipairs(ActivityPtRepeatCfg.all) do
	local var_0_30 = ActivityPtRepeatCfg[iter_0_49]

	if not ActivityPtRepeatCfg.GetCfgFromActivityIdAndStageId[var_0_30.activity_id] then
		ActivityPtRepeatCfg.GetCfgFromActivityIdAndStageId[var_0_30.activity_id] = {}
	end

	ActivityPtRepeatCfg.GetCfgFromActivityIdAndStageId[var_0_30.activity_id][var_0_30.stage_id] = var_0_30
end

ActivityPt2Cfg.GetCfgFromActivityIdAndStageId = {}

for iter_0_50, iter_0_51 in ipairs(ActivityPt2Cfg.all) do
	local var_0_31 = ActivityPt2Cfg[iter_0_51]

	if not ActivityPt2Cfg.GetCfgFromActivityIdAndStageId[var_0_31.activity_id] then
		ActivityPt2Cfg.GetCfgFromActivityIdAndStageId[var_0_31.activity_id] = {}
	end

	ActivityPt2Cfg.GetCfgFromActivityIdAndStageId[var_0_31.activity_id][var_0_31.stage_id] = var_0_31
end

ShopListCfg.get_id_list_by_system_and_group = {}

for iter_0_52, iter_0_53 in pairs(ShopListCfg.get_id_list_by_system) do
	local var_0_32 = {}

	for iter_0_54, iter_0_55 in ipairs(iter_0_53) do
		local var_0_33 = ShopListCfg[iter_0_55]

		if not var_0_32[var_0_33.display_group] then
			var_0_32[var_0_33.display_group] = {}
		end

		table.insert(var_0_32[var_0_33.display_group], var_0_33)
	end

	ShopListCfg.get_id_list_by_system_and_group[iter_0_52] = var_0_32
end

function UpdateShopCfg(arg_10_0)
	local var_10_0 = arg_10_0.shop_id
	local var_10_1 = arg_10_0.goods_list

	for iter_10_0, iter_10_1 in ipairs(var_10_1) do
		local var_10_2 = {}

		for iter_10_2, iter_10_3 in ipairs(iter_10_1.give_back_list or {}) do
			table.insert(var_10_2, {
				id = iter_10_3.id,
				num = iter_10_3.num
			})
		end

		ShopCfg[iter_10_1.goods_id] = {
			taken_down = 0,
			position = 0,
			shop_refresh = 3,
			goods_id = iter_10_1.goods_id,
			shop_id = var_10_0,
			shop_sort = iter_10_1.shop_sort,
			give_id = iter_10_1.give_id,
			description = iter_10_1.description,
			give = iter_10_1.give,
			cost_type = iter_10_1.cost_type,
			cost_id = iter_10_1.cost_id,
			cost = iter_10_1.cost,
			cheap_cost_id = iter_10_1.cheap_cost_id,
			cheap_cost = iter_10_1.cheap_cost,
			discount = iter_10_1.discount,
			limit_num = iter_10_1.limit_num,
			level_limit = cleanProtoTable(iter_10_1.level_limit),
			limit_display = iter_10_1.limit_display,
			pre_goods_id = cleanProtoTable(iter_10_1.pre_goods_id),
			refresh_cycle = iter_10_1.refresh_cycle,
			open_time = {},
			close_time = {},
			is_limit_time_discount = iter_10_1.is_limit_time_discount,
			cheap_open_time = {},
			cheap_close_time = {},
			tag = iter_10_1.tag,
			backhome_tag = iter_10_1.backhome_tag,
			next_goods_id = cleanProtoTable(iter_10_1.next_goods_id),
			give_back_list = var_10_2,
			dlc = iter_10_1.dlc
		}

		if iter_10_1.open_time and iter_10_1.open_time.year ~= 0 then
			local var_10_3 = iter_10_1.open_time

			ShopCfg[iter_10_1.goods_id].open_time = {
				{
					var_10_3.year,
					var_10_3.month,
					var_10_3.day
				},
				{
					var_10_3.hour,
					var_10_3.minute,
					var_10_3.second
				}
			}
		end

		if iter_10_1.close_time and iter_10_1.close_time.year ~= 0 then
			local var_10_4 = iter_10_1.close_time

			ShopCfg[iter_10_1.goods_id].close_time = {
				{
					var_10_4.year,
					var_10_4.month,
					var_10_4.day
				},
				{
					var_10_4.hour,
					var_10_4.minute,
					var_10_4.second
				}
			}
		end

		if iter_10_1.cheap_open_time and iter_10_1.cheap_open_time.year ~= 0 then
			local var_10_5 = iter_10_1.cheap_open_time

			ShopCfg[iter_10_1.goods_id].cheap_open_time = {
				{
					var_10_5.year,
					var_10_5.month,
					var_10_5.day
				},
				{
					var_10_5.hour,
					var_10_5.minute,
					var_10_5.second
				}
			}
		end

		if iter_10_1.cheap_close_time and iter_10_1.cheap_close_time.year ~= 0 then
			local var_10_6 = iter_10_1.cheap_close_time

			ShopCfg[iter_10_1.goods_id].cheap_close_time = {
				{
					var_10_6.year,
					var_10_6.month,
					var_10_6.day
				},
				{
					var_10_6.hour,
					var_10_6.minute,
					var_10_6.second
				}
			}
		end

		ShopCfg.get_id_list_by_shop_id[var_10_0] = ShopCfg.get_id_list_by_shop_id[var_10_0] or {}

		if not table.indexof(ShopCfg.get_id_list_by_shop_id[var_10_0]) then
			table.insert(ShopCfg.get_id_list_by_shop_id[var_10_0], iter_10_1.goods_id)
		end

		ShopCfg.get_id_list_by_cost_id[iter_10_1.cost_id] = ShopCfg.get_id_list_by_cost_id[iter_10_1.cost_id] or {}

		if not table.indexof(ShopCfg.get_id_list_by_cost_id[iter_10_1.cost_id]) then
			table.insert(ShopCfg.get_id_list_by_cost_id[iter_10_1.cost_id], iter_10_1.goods_id)
		end
	end
end

for iter_0_56, iter_0_57 in ipairs(ItemCfg.get_id_list_by_type[ItemConst.ITEM_TYPE.SKIN_CHANGE]) do
	local var_0_34 = ItemCfg[iter_0_57].param[1]

	SkinCfg[var_0_34].change_item = iter_0_57
end

function getChapterIDByStageID(arg_11_0)
	return var_0_1[arg_11_0]
end

function getChapterClientCfgByChapterID(arg_12_0)
	local var_12_0 = ChapterCfg[arg_12_0]

	return ChapterClientCfg[var_12_0.clientID]
end

function getChapterClientCfgByStageID(arg_13_0)
	local var_13_0 = getChapterIDByStageID(arg_13_0)

	return getChapterClientCfgByChapterID(var_13_0)
end

function getChapterAndSectionID(arg_14_0)
	local var_14_0 = getChapterIDByStageID(arg_14_0)
	local var_14_1 = ChapterCfg[var_14_0]
	local var_14_2 = var_14_1.section_id_list ~= "" and table.keyof(var_14_1.section_id_list, arg_14_0) or 1

	return var_14_0, var_14_2
end

function getChapterToggle(arg_15_0)
	return ChapterClientCfg[arg_15_0].parentToggle or ChapterClientCfg[arg_15_0].toggle
end

function getChapterDifficulty(arg_16_0)
	local var_16_0 = BattleStageTools.GetChapterByStageId(BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_PLOT, arg_16_0)
	local var_16_1 = ChapterCfg[var_16_0]

	if not var_16_1 then
		error("错误的难度参数")
	end

	local var_16_2 = var_16_1.difficulty

	if var_16_2 == 1 then
		return GetTips("HARDLEVEL_EASY")
	elseif var_16_2 == 2 then
		return GetTips("HARDLEVEL_HARD_2")
	end
end

function getStageViaStoryID(arg_17_0)
	return StoryCfg[arg_17_0].trigger[2]
end

local var_0_35 = {}

function getChapterListByDifficulty(arg_18_0, arg_18_1)
	arg_18_1 = arg_18_1 or "all"

	if not var_0_35[arg_18_0] then
		local var_18_0 = {}
		local var_18_1 = ChapterCfg.get_id_list_by_type[arg_18_0]

		for iter_18_0, iter_18_1 in ipairs(var_18_1) do
			local var_18_2 = ChapterCfg[iter_18_1].difficulty

			var_18_0[var_18_2] = var_18_0[var_18_2] or {}
			var_18_0.all = var_18_0.all or {}

			table.insert(var_18_0.all, iter_18_1)
			table.insert(var_18_0[var_18_2], iter_18_1)
		end

		var_0_35[arg_18_0] = var_18_0
	end

	return var_0_35[arg_18_0][arg_18_1] or {}
end

local var_0_36 = {}

for iter_0_58, iter_0_59 in pairs(StoryCfg) do
	local var_0_37 = iter_0_59.trigger[2]

	if var_0_37 then
		if not var_0_36[var_0_37] then
			var_0_36[var_0_37] = {}
		end

		local var_0_38 = iter_0_59.trigger[3]

		var_0_36[var_0_37][var_0_38] = iter_0_59.id
	end
end

function getStoryViaStageID(arg_19_0, arg_19_1)
	if not var_0_36[arg_19_0] then
		return false
	end

	return var_0_36[arg_19_0][arg_19_1]
end

for iter_0_60, iter_0_61 in ipairs(WeaponServantCfg.all) do
	local var_0_39 = ServantTools.GetServantSpecHero(iter_0_61)

	if var_0_39 then
		HeroCfg[var_0_39].spec_servant = iter_0_61
	end
end

local var_0_40 = {}

for iter_0_62, iter_0_63 in pairs(ItemCfg.get_id_list_by_type[14]) do
	var_0_40[ItemCfg[iter_0_63].param[1]] = iter_0_63
end

function getTicketIDBySkinID(arg_20_0)
	return var_0_40[arg_20_0]
end

TalentTreeCfg.get_id_list_by_activity_id_and_race = {}

for iter_0_64, iter_0_65 in pairs(TalentTreeCfg.get_id_list_by_activity_id) do
	TalentTreeCfg.get_id_list_by_activity_id_and_race[iter_0_64] = {}

	local var_0_41

	for iter_0_66, iter_0_67 in ipairs(iter_0_65) do
		local var_0_42 = TalentTreeCfg[iter_0_67].race

		if TalentTreeCfg.get_id_list_by_activity_id_and_race[iter_0_64][var_0_42] == nil then
			TalentTreeCfg.get_id_list_by_activity_id_and_race[iter_0_64][var_0_42] = {}
		end

		table.insert(TalentTreeCfg.get_id_list_by_activity_id_and_race[iter_0_64][var_0_42], iter_0_67)
	end
end

for iter_0_68, iter_0_69 in ipairs(ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.ACTIVITY_CULTIVATE_HERO]) do
	if ActivityCultivateHeroCfg[iter_0_69] then
		local var_0_43 = ActivityCultivateHeroCfg[iter_0_69].group

		for iter_0_70, iter_0_71 in ipairs(var_0_43) do
			local var_0_44 = CultivateHeroTaskCfg.get_id_list_by_group_id[iter_0_71]

			for iter_0_72, iter_0_73 in ipairs(var_0_44) do
				CultivateHeroTaskCfg[iter_0_73].activity_id = iter_0_69
			end
		end
	end
end

local function var_0_45(arg_21_0, arg_21_1)
	local var_21_0 = _G[arg_21_0 .. "_" .. arg_21_1]

	if var_21_0 then
		local var_21_1 = _G[arg_21_0]

		setmetatable(var_21_0, {
			__index = var_21_1
		})

		_G[arg_21_0] = var_21_0
	end
end

function DealAreaDifferenceCfg(arg_22_0)
	if arg_22_0 == nil or arg_22_0 == "" or arg_22_0 == "zh_cn" then
		return
	end

	if _G["WordVerifyCfg" .. arg_22_0] then
		WordVerifyCfg = _G["WordVerifyCfg" .. arg_22_0]
		WordVerifyCfg2 = _G["WordVerifyCfg2" .. arg_22_0]
		WordVerifyCfg3 = _G["WordVerifyCfg3" .. arg_22_0]
		WordVerifyCfg4 = _G["WordVerifyCfg4" .. arg_22_0]
		WordVerifyCfg5 = _G["WordVerifyCfg5" .. arg_22_0]
		WordVerifyCfg6 = _G["WordVerifyCfg6" .. arg_22_0]
		WordVerifyCfg7 = _G["WordVerifyCfg7" .. arg_22_0]
		WordVerifyCfg8 = _G["WordVerifyCfg8" .. arg_22_0]
		WordVerifyCfg9 = _G["WordVerifyCfg9" .. arg_22_0]
		WordVerifyCfg10 = _G["WordVerifyCfg10" .. arg_22_0]
	end

	if _G["PaymentCfg" .. arg_22_0] then
		PaymentCfg = _G["PaymentCfg" .. arg_22_0]
	end

	if _G["TotalRechargeCfg" .. arg_22_0] then
		TotalRechargeCfg = _G["TotalRechargeCfg" .. arg_22_0]
	end

	if _G["RechargeCfg" .. arg_22_0] then
		RechargeCfg = _G["RechargeCfg" .. arg_22_0]
	end

	var_0_45("GameDisplayCfg", arg_22_0)
end

function GetCfgDescription(arg_23_0, arg_23_1, arg_23_2, arg_23_3, arg_23_4, arg_23_5)
	if arg_23_2 == nil then
		arg_23_2 = 1
	end

	local function var_23_0(arg_24_0, arg_24_1)
		if arg_24_1 then
			return math.floor(arg_24_0 * 10^arg_24_1 + 0.5) / 10^arg_24_1
		else
			return math.floor(arg_24_0 + 0.5)
		end
	end

	local var_23_1 = DescriptionCfg[arg_23_0]

	if not var_23_1 then
		print("错误, 找不到对应id的描述配置 " .. arg_23_0 .. " description.csv 表")

		return "错误, 找不到对应id的描述配置 " .. arg_23_0 .. " description.csv 表"
	end

	local var_23_2 = GetI18NText(var_23_1.description)
	local var_23_3 = arg_23_1

	if arg_23_1 == nil then
		arg_23_1 = 1
	end

	if arg_23_3 == nil then
		arg_23_3 = var_23_1.maxLv
	end

	if var_23_1.type == 1 then
		if arg_23_1 > var_23_1.maxLv or arg_23_1 < 1 then
			print("错误, 找不到对应等级的描述配置 id = " .. arg_23_0 .. " description.csv 表 level = " .. arg_23_1)

			return "错误, 找不到对应等级的描述配置 id = " .. arg_23_0 .. " description.csv 表 level = " .. arg_23_1
		end

		local var_23_4 = var_23_1.param

		if #var_23_4 >= 1 then
			local var_23_5 = {
				"0"
			}

			for iter_23_0, iter_23_1 in ipairs(var_23_4) do
				local var_23_6 = iter_23_1[1]
				local var_23_7 = iter_23_1[2]
				local var_23_8 = iter_23_1[4]
				local var_23_9 = iter_23_1[3]

				if arg_23_4 then
					var_23_9 = false
				end

				local var_23_10 = var_23_0(var_23_6 + var_23_7 * (arg_23_1 - 1), arg_23_2)

				if var_23_10 % 1 == 0 then
					var_23_10 = string.format("%.0f", var_23_10) .. var_23_8
				else
					var_23_10 = string.format("%." .. arg_23_2 .. "f", var_23_10) .. var_23_8
				end

				local var_23_11 = var_23_10

				if var_23_9 and arg_23_1 < arg_23_3 then
					local var_23_12 = var_23_0(var_23_6 + var_23_7 * arg_23_1, arg_23_2)

					if var_23_12 % 1 == 0 then
						var_23_12 = string.format("%.0f", var_23_12) .. var_23_8
					else
						var_23_12 = string.format("%." .. arg_23_2 .. "f", var_23_12) .. var_23_8
					end

					var_23_11 = GetTipsF("DESCRIPTION_NEXT_LEVEL", var_23_10, var_23_12)
				end

				if arg_23_4 then
					var_23_11 = ""

					for iter_23_2 = 1, arg_23_3 do
						local var_23_13 = var_23_0(var_23_6 + var_23_7 * (iter_23_2 - 1), arg_23_2)

						if var_23_13 % 1 == 0 then
							var_23_13 = string.format("%.0f", var_23_13) .. var_23_8
						else
							var_23_13 = string.format("%." .. arg_23_2 .. "f", var_23_13) .. var_23_8
						end

						if arg_23_5 and var_23_3 == iter_23_2 then
							var_23_13 = "<color=#E78300>" .. var_23_13 .. "</color>"
						end

						if var_23_7 ~= 0 then
							if iter_23_2 > 1 then
								var_23_11 = var_23_11 .. "/" .. var_23_13
							else
								var_23_11 = var_23_13
							end
						else
							var_23_11 = var_23_13
						end
					end
				end

				table.insert(var_23_5, var_23_11)
			end

			return LuaExchangeHelper.GetDescription(var_23_2, var_23_5)
		else
			return var_23_2
		end
	else
		local var_23_14 = var_23_1.param[arg_23_1]

		if not var_23_14 then
			print("错误, 找不到对应等级的描述配置 id = " .. arg_23_0 .. " description.csv 表 level = " .. arg_23_1)

			return "错误, 找不到对应等级的描述配置 id = " .. arg_23_0 .. " description.csv 表 level = " .. arg_23_1
		end

		if #var_23_14 > 1 then
			if arg_23_4 then
				return LuaExchangeHelper.GetDescription(var_23_2, var_23_1.extra_param)
			end

			return LuaExchangeHelper.GetDescription(var_23_2, var_23_14)
		else
			return var_23_2
		end
	end
end

function GetCfgDescriptionWithValue(arg_25_0, arg_25_1)
	local var_25_0 = DescriptionCfg[arg_25_0]

	if not var_25_0 then
		print("错误, 找不到对应id的描述配置 " .. arg_25_0 .. " description.csv 表")

		return "错误, 找不到对应id的描述配置 " .. arg_25_0 .. " description.csv 表"
	end

	local var_25_1 = GetI18NText(var_25_0.description)
	local var_25_2 = {
		""
	}

	if type(arg_25_1) ~= "table" then
		table.insert(var_25_2, arg_25_1)
	else
		table.insertto(var_25_2, arg_25_1)
	end

	return LuaExchangeHelper.GetDescription(var_25_1, var_25_2)
end

ActivityReprintExCfg = {}

for iter_0_74, iter_0_75 in ipairs(ActivityReprintCfg.all) do
	for iter_0_76, iter_0_77 in pairs(ActivityReprintCfg[iter_0_75]) do
		if iter_0_76 ~= "id" then
			ActivityReprintExCfg[iter_0_77] = {
				originActivityID = iter_0_75
			}
		end
	end
end

HeroStarUpTemplateCfg.template_dic = {}

for iter_0_78, iter_0_79 in pairs(HeroStarUpTemplateCfg.get_id_list_by_template) do
	local var_0_46 = {}

	for iter_0_80, iter_0_81 in ipairs(iter_0_79) do
		local var_0_47 = HeroStarUpTemplateCfg[iter_0_81].skill_id
		local var_0_48 = HeroStarUpTemplateCfg[iter_0_81].stage
		local var_0_49 = HeroStarSkillCfg[var_0_47].type

		var_0_46[var_0_49] = var_0_46[var_0_49] or {}
		var_0_46[var_0_49].stage_dic = var_0_46[var_0_49].stage_dic or {}
		var_0_46[var_0_49].stage_dic[var_0_48] = var_0_47
	end

	for iter_0_82, iter_0_83 in pairs(var_0_46) do
		local var_0_50 = {}
		local var_0_51 = iter_0_83.stage_dic

		for iter_0_84, iter_0_85 in pairs(var_0_51) do
			var_0_50[#var_0_50 + 1] = iter_0_84
		end

		table.sort(var_0_50)

		var_0_46[iter_0_82].stage_list = var_0_50
	end

	HeroStarUpTemplateCfg.template_dic[iter_0_78] = var_0_46
end

function HeroVoiceDescCfg.Get(arg_26_0, arg_26_1)
	return nullable(HeroVoiceDescCfg, nullable(HeroVoiceDescCfg.get_id_list_by_chara_id_subtitle_id, arg_26_0, arg_26_1, 1), "content")
end

function HeroVoiceDescCfg.GetByFormID(arg_27_0, arg_27_1)
	for iter_27_0, iter_27_1 in ipairs(HeroVoiceDescCfg.get_id_list_by_form_id[arg_27_0]) do
		if HeroVoiceDescCfg[iter_27_1].subtitle_id == arg_27_1 then
			return HeroVoiceDescCfg[iter_27_1].content
		end
	end

	return nil
end

function ConfigHelper_GetCfg(arg_28_0, arg_28_1, arg_28_2)
	return _G[arg_28_0][arg_28_1][arg_28_2]
end
