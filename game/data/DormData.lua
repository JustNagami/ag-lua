require("game.data.DormDataTemplate")

local var_0_0 = import("game.dorm.DormEnum")
local var_0_1 = singletonClass("DormData")
local var_0_2
local var_0_3
local var_0_4
local var_0_5

function var_0_1.InitSimplaDormData(arg_1_0, arg_1_1)
	var_0_1:InitHeroInfo(arg_1_1)
	BackHomeNpcData:InitNpcInfo(arg_1_1)
	var_0_1:InitFurnitureInfoList(arg_1_1.furnitures)
end

function var_0_1.InitDetailDormData(arg_2_0, arg_2_1)
	var_0_1:InitFurnitureInfoList(arg_2_1.furnitures)
end

function var_0_1.RefreshDailyZero(arg_3_0)
	if var_0_2 then
		for iter_3_0, iter_3_1 in pairs(var_0_2) do
			iter_3_1:ResetFeedTime()
		end
	end
end

function var_0_1.Init(arg_4_0)
	var_0_5 = false
	var_0_4 = nil
end

function var_0_1.InitHeroInfo(arg_5_0, arg_5_1)
	var_0_2 = {}

	if arg_5_1.backhome_hero then
		for iter_5_0, iter_5_1 in ipairs(arg_5_1.backhome_hero) do
			local var_5_0 = {
				archives_id = iter_5_1.archives_id,
				hero_id = iter_5_1.hero_id,
				feed_times = iter_5_1.feed_times or 0,
				fatigue = iter_5_1.fatigue,
				totalFeedTime = iter_5_1.total_feed_times
			}

			if DormHeroTools:GetTemplateIDInDorm(iter_5_1.archives_id) then
				local var_5_1 = DormHeroTemplate.New(var_5_0)

				var_0_2[iter_5_1.archives_id] = var_5_1
			end
		end
	end

	if arg_5_1.hero_setting then
		for iter_5_2, iter_5_3 in ipairs(arg_5_1.hero_setting) do
			local var_5_2 = iter_5_3.hero_id
			local var_5_3 = HeroRecordCfg.get_id_list_by_hero_id[var_5_2][1]

			var_0_2[var_5_3]:SetHeroSkinID(var_5_2, iter_5_3.skin_id)
		end
	end
end

function var_0_1.GetHeroInfoList(arg_6_0)
	return var_0_2
end

function var_0_1.GetHeroInfo(arg_7_0, arg_7_1)
	if var_0_2 and DormHeroTools:GetTemplateIDInDorm(arg_7_1) then
		if not var_0_2[arg_7_1] then
			local var_7_0 = {
				archives_id = arg_7_1
			}

			if DormHeroTools:GetAllCanUseHeroIDInDorm(arg_7_1)[1] then
				var_0_2[arg_7_1] = DormHeroTemplate.New(var_7_0)
			end
		end

		return var_0_2[arg_7_1]
	else
		print(string.format("后宅不存在档案id为%s的可用角色", tostring(arg_7_1)))
	end
end

function var_0_1.GetHeroTemplateInfo(arg_8_0, arg_8_1)
	local var_8_0 = arg_8_0:GetHeroArchiveID(arg_8_1)

	return (arg_8_0:GetHeroInfo(var_8_0))
end

function var_0_1.GetCharacterInfo(arg_9_0, arg_9_1)
	if DormNpcTools:CheckIDIsNpc(arg_9_1) then
		return BackHomeNpcData:GetBackHomeNpcInfoList()[arg_9_1]
	else
		return var_0_1:GetHeroTemplateInfo(arg_9_1)
	end
end

function var_0_1.GetHeroFatigue(arg_10_0, arg_10_1)
	local var_10_0 = arg_10_0:GetHeroArchiveID(arg_10_1)
	local var_10_1 = arg_10_0:GetHeroInfo(var_10_0)

	if var_10_1 then
		return var_10_1.fatigue
	else
		return 0
	end
end

function var_0_1.SetHeroFatigue(arg_11_0, arg_11_1, arg_11_2)
	local var_11_0 = arg_11_0:GetHeroArchiveID(arg_11_1)

	if not var_0_2 then
		var_0_2 = {}
	end

	if DormHeroTools:GetTemplateIDInDorm(var_11_0) then
		if not var_0_2[var_11_0] then
			local var_11_1 = {
				archives_id = var_11_0
			}

			var_0_2[var_11_0] = DormHeroTemplate.New(var_11_1)
		end

		var_0_2[var_11_0]:SetFatigue(arg_11_2)
	else
		print(string.format("后宅不存在档案id为%s的可用角色", tostring(var_11_0)))
	end
end

function var_0_1.GetHeroArchiveID(arg_12_0, arg_12_1)
	if HeroRecordCfg.get_id_list_by_hero_id[arg_12_1] then
		return HeroRecordCfg.get_id_list_by_hero_id[arg_12_1][1]
	end

	return arg_12_1
end

function var_0_1.RefreshInDormHeroInfo(arg_13_0, arg_13_1, arg_13_2, arg_13_3)
	if not arg_13_1 or not arg_13_2 then
		return
	end

	local var_13_0 = DormitoryData:GetDormSceneData(arg_13_1)
	local var_13_1 = arg_13_0:GetHeroInfoList()

	if BackHomeCfg[arg_13_1].type == DormConst.BACKHOME_TYPE.PublicDorm then
		var_13_0.archiveIDList = {}

		for iter_13_0, iter_13_1 in ipairs(arg_13_2) do
			local var_13_2 = DormData:GetHeroArchiveID(iter_13_1)
			local var_13_3 = arg_13_0:GetHeroTemplateInfo(var_13_2)

			var_13_3:SetCurHeroID(iter_13_1)

			var_13_3.dancePos = nil

			table.insert(var_13_0.archiveIDList, var_13_2)
			var_13_1[var_13_2]:ResetHeroSkill()
		end
	elseif BackHomeCfg[arg_13_1].type == DormConst.BACKHOME_TYPE.PrivateDorm then
		local var_13_4 = arg_13_2[1]
		local var_13_5 = DormData:GetHeroArchiveID(var_13_4)

		if var_13_0.archiveIDList[1] ~= var_13_5 and var_13_0.archiveIDList and #var_13_0.archiveIDList > 0 then
			print("该房间已被其他角色使用")

			return
		end

		var_13_0.archiveIDList = {}

		table.insert(var_13_0.archiveIDList, var_13_5)

		local var_13_6 = arg_13_0:GetHeroTemplateInfo(var_13_5)

		if not arg_13_3 then
			var_13_6:SetCurHeroID(var_13_4)

			var_13_6.dancePos = nil
		end

		var_13_1[var_13_5]:ResetHeroSkill()
	end
end

function var_0_1.SetCurrentScene(arg_14_0, arg_14_1)
	var_0_4 = arg_14_1
end

function var_0_1.GetCurrectSceneID(arg_15_0)
	return var_0_4
end

function var_0_1.GetDormSceneData(arg_16_0, arg_16_1)
	if arg_16_1 then
		local var_16_0 = BackHomeCfg[arg_16_1]

		if var_16_0 then
			local var_16_1 = var_16_0.type

			if var_16_1 == DormConst.BACKHOME_TYPE.Canteen then
				return CanteenData:GetCanteenSceneData()
			elseif var_16_1 == DormConst.BACKHOME_TYPE.PublicDorm or var_16_1 == DormConst.BACKHOME_TYPE.PrivateDorm or var_16_1 == DormConst.BACKHOME_TYPE.VISITPUBLICDORM or var_16_1 == DormConst.BACKHOME_TYPE.VISITPRIVATEDORM then
				return DormitoryData:GetDormMapList()[arg_16_1]
			end
		else
			Debug.LogError("不存在" .. arg_16_1 .. "场景的配置信息")
		end
	else
		Debug.LogError("id为空")
	end
end

function var_0_1.GetDormSceneDataList(arg_17_0, arg_17_1)
	if arg_17_1 == var_0_0.DormSystemType.Canteen then
		return {
			CanteenData:GetCanteenSceneData()
		}
	elseif arg_17_1 == var_0_0.DormSystemType.Dormitory then
		return (DormitoryData:GetDormMapList())
	end
end

function var_0_1.InitFurnitureInfoList(arg_18_0, arg_18_1)
	var_0_3 = {}

	for iter_18_0, iter_18_1 in ipairs(arg_18_1) do
		var_0_3[iter_18_1.furniture_id] = {}
		var_0_3[iter_18_1.furniture_id].num = iter_18_1.num
		var_0_3[iter_18_1.furniture_id].give_num = iter_18_1.give_num or 0
		var_0_3[iter_18_1.furniture_id].hasPlaceNum = 0
	end
end

function var_0_1.GetFurnitureInfoList(arg_19_0)
	return var_0_3
end

function var_0_1.GetFurNumInfo(arg_20_0, arg_20_1)
	if not var_0_3 then
		var_0_3 = {}
	end

	if var_0_3[arg_20_1] then
		return var_0_3[arg_20_1]
	else
		var_0_3[arg_20_1] = {
			hasPlaceNum = 0,
			num = 0,
			give_num = 0
		}

		return var_0_3[arg_20_1]
	end
end

function var_0_1.AddFurTotalNum(arg_21_0, arg_21_1, arg_21_2, arg_21_3)
	if var_0_3 then
		local var_21_0 = arg_21_0:GetFurNumInfo(arg_21_1)

		var_21_0.num = arg_21_2
		var_21_0.give_num = arg_21_3
	end

	if BackHomeFurniture[arg_21_1].is_give == DormConst.BACKHOME_FUR_GIVE_TYPE.SPECIFY then
		local var_21_1 = BackHomeFurniture[arg_21_1].hero_id
		local var_21_2 = DormRoomTools:GetDormIDViaArchive(var_21_1)

		if var_21_2 then
			local var_21_3 = DormitoryData:GetDormLevel(var_21_2)

			DormRoomTools:RefreshDormExp(var_21_2, arg_21_1, arg_21_2)

			local var_21_4 = DormitoryData:GetDormLevel(var_21_2)

			if var_21_3 ~= var_21_4 then
				DormRoomTools:GetDormLevelAward(var_21_1, var_21_3, var_21_4)
				manager.notify:Invoke(DORM_PRIVATE_LEVEL_UP, var_21_2, var_21_1)
			end
		end
	end
end

local function var_0_6()
	for iter_22_0, iter_22_1 in pairs(var_0_3) do
		if not DormSpecialFurnitureTools:JudgeFurIsSpecialType(iter_22_0) then
			iter_22_1.hasPlaceNum = 0
		end
	end

	local var_22_0 = DormitoryData:GetDormMapList()

	for iter_22_2, iter_22_3 in pairs(var_22_0) do
		local var_22_1, var_22_2 = DormFurnitureTools:GetHasPlaceFurNumInfoInMap(iter_22_2)

		for iter_22_4, iter_22_5 in pairs(var_22_2) do
			if not var_0_3[iter_22_4] then
				var_0_3[iter_22_4] = {
					hasPlaceNum = 0,
					num = 0,
					give_num = 0
				}
			end

			if not var_0_3[iter_22_4].hasPlaceNum then
				var_0_3[iter_22_4].hasPlaceNum = 0
			end

			var_0_3[iter_22_4].hasPlaceNum = var_0_3[iter_22_4].hasPlaceNum + iter_22_5
		end
	end
end

local function var_0_7()
	local var_23_0 = DormitoryData:GetDormMapList()

	for iter_23_0, iter_23_1 in pairs(var_0_3) do
		if DormSpecialFurnitureTools:JudgeFurIsSpecialType(iter_23_0) then
			iter_23_1.hasPlaceNum = 0
		end
	end

	for iter_23_2, iter_23_3 in pairs(var_23_0) do
		local var_23_1 = var_23_0[iter_23_2].specialFur

		for iter_23_4, iter_23_5 in pairs(var_23_1) do
			if not var_0_3[iter_23_5] then
				var_0_3[iter_23_5] = {
					hasPlaceNum = 0,
					num = 0,
					give_num = 0
				}
			end

			var_0_3[iter_23_5].hasPlaceNum = var_0_3[iter_23_5].hasPlaceNum + 1
		end
	end
end

local function var_0_8()
	local var_24_0 = DormitoryData:GetDormMapList()

	for iter_24_0, iter_24_1 in pairs(var_24_0) do
		local var_24_1 = var_24_0[iter_24_0].suitInfo

		for iter_24_2, iter_24_3 in pairs(var_24_1) do
			local var_24_2 = DormSuitData:GetNeedUseFurNumInfoBySuitID(iter_24_2)

			if var_24_2 then
				for iter_24_4, iter_24_5 in ipairs(var_24_2) do
					if not var_0_3[iter_24_5[1]] then
						var_0_3[iter_24_5[1]] = {
							hasPlaceNum = 0,
							num = 0,
							give_num = 0
						}
					end

					var_0_3[iter_24_5[1]].hasPlaceNum = var_0_3[iter_24_5[1]].hasPlaceNum + iter_24_5[2]
				end
			else
				for iter_24_6 = 0, iter_24_3.furList.Length - 1 do
					local var_24_3 = iter_24_3.furList[iter_24_6]

					if not var_0_3[var_24_3.id] then
						var_0_3[var_24_3.id] = {
							hasPlaceNum = 0,
							num = 0,
							give_num = 0
						}
					end

					var_0_3[var_24_3.id].hasPlaceNum = var_0_3[var_24_3.id].hasPlaceNum + 1
				end
			end
		end
	end
end

function var_0_1.UpdateAllPlaceFurNumList(arg_25_0)
	var_0_6()
	var_0_7()
	var_0_8()
end

function var_0_1.ChangeDevModelFlag(arg_26_0, arg_26_1)
	if Application.isEditor then
		var_0_5 = arg_26_1
	end
end

function var_0_1.GetDevModelFlag(arg_27_0)
	if Application.isEditor then
		return var_0_5
	end
end

return var_0_1
