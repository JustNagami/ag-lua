local var_0_0 = {}
local var_0_1
local var_0_2

function var_0_0.SetFurListInMap(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4)
	if arg_1_2 == nil then
		local var_1_0 = {}
		local var_1_1 = arg_1_3.furInfoList

		var_0_1 = arg_1_3.furInfoList

		local var_1_2 = {}
		local var_1_3 = {}
		local var_1_4 = {}
		local var_1_5 = {}
		local var_1_6 = {}
		local var_1_7 = {
			architecture_id = arg_1_1,
			furniture_layout = {
				temp_id = 0
			},
			picture_link = arg_1_4 or ""
		}

		for iter_1_0 = 0, var_1_1.Length - 1 do
			local var_1_8 = {
				furniture_id = var_1_1[iter_1_0].id,
				x = math.floor(var_1_1[iter_1_0].pos.x * DormConst.POS_PRECISION),
				y = math.floor(var_1_1[iter_1_0].pos.y * DormConst.POS_PRECISION),
				rotation = math.floor(var_1_1[iter_1_0].rotation * DormConst.POS_PRECISION)
			}

			if DormFurnitureTools:CheckFurTileType(var_1_1[iter_1_0].id, var_1_1[iter_1_0].tileType) then
				if var_1_1[iter_1_0].tileType == DormConst.TILE_TYPE.FLOOR then
					table.insert(var_1_6, var_1_8)
				elseif var_1_1[iter_1_0].tileType == DormConst.TILE_TYPE.WALL_LEFT then
					table.insert(var_1_2, var_1_8)
				elseif var_1_1[iter_1_0].tileType == DormConst.TILE_TYPE.WALL_RIGHT then
					table.insert(var_1_3, var_1_8)
				elseif var_1_1[iter_1_0].tileType == DormConst.TILE_TYPE.WALL_BEHIND then
					table.insert(var_1_5, var_1_8)
				elseif var_1_1[iter_1_0].tileType == DormConst.TILE_TYPE.WALL_FRONT then
					table.insert(var_1_4, var_1_8)
				end
			else
				var_0_1 = nil

				print("同步家具失败，" .. var_1_1[iter_1_0].id .. "家具所在地块和配置地块不匹配")

				return
			end
		end

		local var_1_9 = arg_1_3.specialInfo

		if var_1_9 then
			for iter_1_1, iter_1_2 in pairs(var_1_9) do
				local var_1_10 = {
					rotation = 0,
					x = 0,
					y = 0,
					furniture_id = iter_1_2
				}

				table.insert(var_1_6, var_1_10)
			end
		end

		if arg_1_3.suitInfo then
			var_0_2 = arg_1_3.suitInfo

			local var_1_11 = arg_1_3.suitInfo
			local var_1_12 = {}

			for iter_1_3, iter_1_4 in pairs(var_1_11) do
				if iter_1_3 > 1000 then
					local var_1_13 = {
						furniture_id = iter_1_3,
						x = math.floor(iter_1_4.pos.x * DormConst.POS_PRECISION),
						y = math.floor(iter_1_4.pos.y * DormConst.POS_PRECISION),
						rotation = math.floor(iter_1_4.pos.rotation * DormConst.POS_PRECISION)
					}

					table.insert(var_1_6, var_1_13)
					table.insert(var_1_12, iter_1_3)
				end
			end

			SDKTools.SendMessageToSDK("backhome_dorm_edit", {
				suit_list = var_1_12
			})
		end

		var_1_7.furniture_layout.furniture_pos_list = {
			{
				default_suit_id = 0,
				type = 1,
				furniture_pos = var_1_2
			},
			{
				default_suit_id = 0,
				type = 2,
				furniture_pos = var_1_3
			},
			{
				default_suit_id = 0,
				type = 3,
				furniture_pos = var_1_4
			},
			{
				default_suit_id = 0,
				type = 4,
				furniture_pos = var_1_5
			},
			{
				default_suit_id = 0,
				type = 5,
				furniture_pos = var_1_6
			}
		}

		if arg_1_3.suitInfo then
			local var_1_14 = arg_1_3.suitInfo
			local var_1_15 = 100

			for iter_1_5, iter_1_6 in pairs(var_1_14) do
				if iter_1_5 < 1000 then
					local var_1_16 = {
						type = var_1_15
					}
					local var_1_17 = {}

					for iter_1_7 = 0, iter_1_6.furList.Length - 1 do
						local var_1_18 = {
							furniture_id = iter_1_6.furList[iter_1_7].id,
							x = math.floor(iter_1_6.furList[iter_1_7].pos.x * DormConst.POS_PRECISION),
							y = math.floor(iter_1_6.furList[iter_1_7].pos.y * DormConst.POS_PRECISION),
							rotation = math.floor(iter_1_6.furList[iter_1_7].rotation * DormConst.POS_PRECISION)
						}

						table.insert(var_1_17, var_1_18)
					end

					var_1_16.furniture_pos = var_1_17

					if iter_1_6.oriSuitID then
						var_1_16.default_suit_id = iter_1_6.oriSuitID
					else
						var_1_16.default_suit_id = 0
					end

					var_1_15 = var_1_15 + 1

					table.insert(var_1_7.furniture_layout.furniture_pos_list, var_1_16)
				end
			end
		end

		if DormData:GetDevModelFlag() then
			local var_1_19 = DormSuitData:GetSuitSerializeData()
			local var_1_20 = clone(var_1_7.furniture_layout.furniture_pos_list)

			DormSuitTools:SerializeDormSuitData(var_1_20, var_1_19)
		end

		manager.net:SendWithLoadingNew(58010, var_1_7, 58011, var_0_0.SetFurListInMapCallBack)
	else
		manager.net:SendWithLoadingNew(58010, {
			architecture_id = arg_1_1,
			furniture_layout = {
				temp_id = arg_1_2,
				furniture_pos_list = {}
			},
			picture_link = arg_1_4 or ""
		}, 58011, var_0_0.SetFurListInMapCallBack)
	end
end

function var_0_0.SetFurListInMapCallBack(arg_2_0, arg_2_1)
	if isSuccess(arg_2_0.result) then
		local var_2_0

		if not var_0_1 then
			local var_2_1 = arg_2_1.furniture_layout.temp_id
			local var_2_2 = DormFurnitureTemplateData:GetDormTemplateInfo(var_2_1)

			var_0_1 = var_2_2:GetDormTemplateFurList()

			local var_2_3 = var_2_2:GetTemplateWallAndFloorInfo()

			var_2_0 = {}

			for iter_2_0, iter_2_1 in pairs(var_2_3) do
				local var_2_4 = {
					furniture_id = iter_2_1
				}

				table.insert(var_2_0, var_2_4)
			end
		end

		DormFurEditStateData:SyncRoomFurniture(arg_2_1, var_0_1, var_2_0, var_0_2)
		DormLuaBridge.SyncRoomFurniture(var_0_1)

		var_0_1 = nil
		var_0_2 = nil
	end
end

function var_0_0.UnLockDormArchitecture(arg_3_0, arg_3_1, arg_3_2)
	manager.net:SendWithLoadingNew(58130, {
		architecture_id = arg_3_1,
		pos_id = arg_3_2
	}, 58131, var_0_0.UnLockDormArchitectureCallBack)
end

function var_0_0.UnLockDormArchitectureCallBack(arg_4_0, arg_4_1)
	if isSuccess(arg_4_0.result) then
		DormitoryData:UnLockDormArchitecture(arg_4_1.architecture_id, arg_4_1.pos_id)
		DormRedPointTools:CheckUnLockEntrustRedPoint()
		manager.notify:Invoke(DORM_PRIVATE_DORM_CHANGE, arg_4_1.architecture_id)
	else
		ShowTips(arg_4_0.result)
	end
end

local var_0_3

function var_0_0.DeployHeroInRoom(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	var_0_3 = arg_5_3

	manager.net:SendWithLoadingNew(58132, {
		architecture_id = arg_5_1,
		hero_id = arg_5_2
	}, 58133, var_0_0.DeployHeroInRoomCallBack)
end

function var_0_0.DeployHeroInRoomCallBack(arg_6_0, arg_6_1)
	if isSuccess(arg_6_0.result) then
		if var_0_3 == DormEnum.DormDeployType.Place then
			DormData:RefreshInDormHeroInfo(arg_6_1.architecture_id, arg_6_1.hero_id)
			manager.notify:Invoke(DORM_DRAG_HERO_SUCCESS)
			manager.notify:Invoke(DORM_REGENERATE_HERO)
			manager.notify:Invoke(DORM_REFRESH_HERO_DEPLOY_LIST)
		elseif var_0_3 == DormEnum.DormDeployType.ReCall then
			DormData:RefreshInDormHeroInfo(arg_6_1.architecture_id, arg_6_1.hero_id)
			manager.notify:Invoke(DORM_REGENERATE_HERO)
			manager.notify:Invoke(DORM_REFRESH_HERO_DEPLOY_LIST)
		elseif var_0_3 == DormEnum.DormDeployType.Occupy then
			DormData:RefreshInDormHeroInfo(arg_6_1.architecture_id, arg_6_1.hero_id, true)

			local var_6_0 = arg_6_1.hero_id[1]
			local var_6_1 = DormData:GetHeroArchiveID(var_6_0)

			DormData:GetHeroInfo(var_6_1):InitHeroRoomID(arg_6_1.architecture_id)
			DormRoomTools:GetDormLevelAward(var_6_1, 0, 1)
			DormitoryData:UpdatePrivateDormRedPoint()

			local var_6_2 = DormitoryData:GetDormLevel(arg_6_1.architecture_id)

			DormRoomTools:RefreshDormExp(arg_6_1.architecture_id)

			local var_6_3 = DormitoryData:GetDormLevel(arg_6_1.architecture_id)

			if var_6_2 ~= var_6_3 then
				DormRoomTools:GetDormLevelAward(var_6_1, var_6_2, var_6_3)
				manager.notify:Invoke(DORM_PRIVATE_LEVEL_UP, arg_6_1.architecture_id, var_6_1)
			end

			manager.notify:Invoke(DORM_HERO_OCCUPY, {
				var_6_1
			})
		end

		var_0_3 = nil
	else
		ShowTips(arg_6_0.result)
	end
end

function var_0_0.RecallHeroInPrivateDorm(arg_7_0, arg_7_1, arg_7_2)
	manager.net:SendWithLoadingNew(58134, {
		architecture_id = arg_7_1,
		hero_id = arg_7_2
	}, 58135, var_0_0.RecallHeroInPrivateDormCallBack)
end

function var_0_0.RecallHeroInPrivateDormCallBack(arg_8_0, arg_8_1)
	if isSuccess(arg_8_0.result) then
		local var_8_0 = DormitoryData:GetDormMapList()[arg_8_1.architecture_id].archiveIDList[1]
		local var_8_1 = 0

		for iter_8_0, iter_8_1 in ipairs(BackHomeCfg.all) do
			if BackHomeCfg[iter_8_1].type == DormConst.BACKHOME_TYPE.PublicDorm then
				var_8_1 = iter_8_1

				break
			end
		end

		local var_8_2 = DormitoryData:GetDormSceneData(var_8_1)

		for iter_8_2 = 1, #var_8_2.archiveIDList do
			if var_8_2.archiveIDList[iter_8_2] == var_8_0 then
				table.remove(var_8_2.archiveIDList, iter_8_2)

				break
			end
		end

		DormData:RefreshInDormHeroInfo(arg_8_1.architecture_id, {
			arg_8_1.hero_id
		})
		manager.notify:Invoke(DORM_REFRESH_HERO_DEPLOY_LIST)
	else
		ShowTips(arg_8_0.result)
	end
end

local var_0_4

function var_0_0.GiftFurToHero(arg_9_0, arg_9_1, arg_9_2, arg_9_3)
	local var_9_0 = {}

	var_0_4 = arg_9_3

	for iter_9_0, iter_9_1 in pairs(arg_9_2) do
		local var_9_1 = {
			id = iter_9_0,
			num = iter_9_1
		}

		table.insert(var_9_0, var_9_1)
	end

	manager.net:SendWithLoadingNew(58136, {
		hero_id = arg_9_1,
		furniture = var_9_0
	}, 58137, var_0_0.GiftFurToHeroCallBack)
end

function var_0_0.GiftFurToHeroCallBack(arg_10_0, arg_10_1)
	if isSuccess(arg_10_0.result) then
		local var_10_0 = arg_10_1.hero_id
		local var_10_1 = DormData:GetHeroTemplateInfo(var_10_0)
		local var_10_2 = DormRoomTools:GetDormIDViaArchive(var_10_0)

		for iter_10_0, iter_10_1 in ipairs(arg_10_1.furniture) do
			local var_10_3 = iter_10_1.id
			local var_10_4 = iter_10_1.num

			var_10_1:GiftFur(var_10_3, var_10_4, var_0_4)
		end

		var_0_4 = nil

		if not var_10_2 then
			Debug.LogError("未获取到场景id")

			return
		end

		manager.notify:Invoke(DORM_REFRESH_GIFT_FUR_LIST, arg_10_1.furniture)

		local var_10_5 = DormitoryData:GetDormLevel(var_10_2)

		DormRoomTools:RefreshDormExp(var_10_2)

		local var_10_6 = DormitoryData:GetDormLevel(var_10_2)

		if var_10_5 ~= var_10_6 then
			DormRoomTools:GetDormLevelAward(var_10_0, var_10_5, var_10_6)
			manager.notify:Invoke(DORM_PRIVATE_LEVEL_UP, var_10_2, var_10_0)
		end
	else
		ShowTips(arg_10_0.result)
	end
end

function var_0_0.GiftFoodToHero(arg_11_0, arg_11_1, arg_11_2, arg_11_3, arg_11_4, arg_11_5)
	manager.net:SendWithLoadingNew(58138, {
		type = arg_11_3,
		hero_id = arg_11_3 == 1 and 0 or arg_11_1
	}, 58139, var_0_0.GiftFoodToHeroCallBack(arg_11_4, arg_11_1, arg_11_2, arg_11_5))
end

function var_0_0.GiftFoodToHeroCallBack(arg_12_0, arg_12_1, arg_12_2, arg_12_3)
	return function(arg_13_0, arg_13_1)
		if isSuccess(arg_13_0.result) then
			if arg_12_0 then
				arg_12_0(arg_13_1.type, arg_12_1, arg_12_2)
			end

			for iter_13_0, iter_13_1 in ipairs(arg_13_0.fatigue_list) do
				local var_13_0 = DormData:GetHeroInfo(iter_13_1.archives_id)

				if var_13_0:GetFatigue() ~= iter_13_1.fatigue then
					var_13_0:FeedFoodTime(1)
				end

				var_13_0:SetFatigue(iter_13_1.fatigue)
			end

			manager.notify:Invoke(BACKHOME_HERO_FATIGUR_REFRESH)
		elseif arg_12_3 then
			arg_12_3()
		else
			ShowTips(arg_13_0.result)
		end
	end
end

function var_0_0.SaveFurTemplate(arg_14_0, arg_14_1, arg_14_2, arg_14_3, arg_14_4, arg_14_5, arg_14_6, arg_14_7, arg_14_8)
	local var_14_0

	if arg_14_8 then
		var_14_0 = {
			user_id = arg_14_8.user_id or PlayerData.INVALID_PLAYER,
			layout_uid = tonumber(arg_14_8.layout_uid) or 0
		}
	end

	local var_14_1 = {
		id = arg_14_1,
		type = arg_14_2,
		name = arg_14_3,
		architecture_id = arg_14_4,
		furniture_pos_list = {},
		pos = arg_14_6,
		host_info = var_14_0
	}

	if arg_14_4 == 0 or arg_14_4 > 1000 then
		var_14_1.architecture_id = 0

		local var_14_2, var_14_3, var_14_4, var_14_5, var_14_6, var_14_7 = arg_14_0:SwitchFurInfoToLayout(arg_14_5)

		if var_14_7 then
			for iter_14_0, iter_14_1 in pairs(arg_14_7) do
				if iter_14_1 then
					local var_14_8 = {
						rotation = 0,
						x = 0,
						y = 0,
						furniture_id = iter_14_1
					}

					table.insert(var_14_6, var_14_8)
				end
			end

			var_14_1.furniture_pos_list = {
				{
					default_suit_id = 0,
					type = 1,
					furniture_pos = var_14_2
				},
				{
					default_suit_id = 0,
					type = 2,
					furniture_pos = var_14_3
				},
				{
					default_suit_id = 0,
					type = 3,
					furniture_pos = var_14_4
				},
				{
					default_suit_id = 0,
					type = 4,
					furniture_pos = var_14_5
				},
				{
					default_suit_id = 0,
					type = 5,
					furniture_pos = var_14_6
				}
			}
		else
			print("家具所在墙面类型错误")

			return
		end
	end

	manager.net:SendWithLoadingNew(58040, var_14_1, 58041, var_0_0.SaveFurTemplateCallBack)
end

function var_0_0.SwitchFurInfoToLayout(arg_15_0, arg_15_1)
	local var_15_0 = {}
	local var_15_1 = {}
	local var_15_2 = {}
	local var_15_3 = {}
	local var_15_4 = {}
	local var_15_5 = true

	for iter_15_0 = 0, arg_15_1.Length - 1 do
		local var_15_6 = {
			furniture_id = arg_15_1[iter_15_0].id,
			x = math.floor(arg_15_1[iter_15_0].pos.x * DormConst.POS_PRECISION),
			y = math.floor(arg_15_1[iter_15_0].pos.y * DormConst.POS_PRECISION),
			rotation = math.floor(arg_15_1[iter_15_0].rotation * DormConst.POS_PRECISION)
		}

		if DormFurnitureTools:CheckFurTileType(arg_15_1[iter_15_0].id, arg_15_1[iter_15_0].tileType) then
			if arg_15_1[iter_15_0].tileType == DormConst.TILE_TYPE.FLOOR then
				table.insert(var_15_4, var_15_6)
			elseif arg_15_1[iter_15_0].tileType == DormConst.TILE_TYPE.WALL_LEFT then
				table.insert(var_15_0, var_15_6)
			elseif arg_15_1[iter_15_0].tileType == DormConst.TILE_TYPE.WALL_RIGHT then
				table.insert(var_15_1, var_15_6)
			elseif arg_15_1[iter_15_0].tileType == DormConst.TILE_TYPE.WALL_BEHIND then
				table.insert(var_15_2, var_15_6)
			elseif arg_15_1[iter_15_0].tileType == DormConst.TILE_TYPE.WALL_FRONT then
				table.insert(var_15_3, var_15_6)
			end
		else
			var_15_5 = false

			break
		end
	end

	return var_15_0, var_15_1, var_15_2, var_15_3, var_15_4, var_15_5
end

function var_0_0.SaveFurTemplateCallBack(arg_16_0, arg_16_1)
	if isSuccess(arg_16_0.result) then
		DormFurnitureTemplateData:SaveFurTemplateInfo(arg_16_1)
		manager.notify:Invoke(DORM_TEMPLATE_CHANGE)
		ShowTips(GetTips("DORM_MOULD_SAVE_SUCCESS"))
	else
		ShowTips(arg_16_0.result)
	end
end

function var_0_0.ReviseFurTemplateName(arg_17_0, arg_17_1, arg_17_2)
	manager.net:SendWithLoadingNew(58142, {
		id = arg_17_1,
		name = arg_17_2
	}, 58143, var_0_0.ReviseFurTemplateNameCallBack)
end

function var_0_0.ReviseFurTemplateNameCallBack(arg_18_0, arg_18_1)
	if isSuccess(arg_18_0.result) then
		local var_18_0 = DormFurnitureTemplateData:GetDormTemplateInfo(arg_18_1.id)
		local var_18_1 = arg_18_1.name

		var_18_0:ReviseFurTemplateNameInfo(var_18_1)
		manager.notify:Invoke(DOMR_RENAME_TEMPLATE_SUCCESS)
	else
		ShowTips(arg_18_0.result)
	end
end

function var_0_0.DeleteFurTemplate(arg_19_0, arg_19_1)
	manager.net:SendWithLoadingNew(58144, {
		id = arg_19_1
	}, 58145, var_0_0.DeleteFurTemplateCallBack)
end

function var_0_0.DeleteFurTemplateCallBack(arg_20_0, arg_20_1)
	if isSuccess(arg_20_0.result) then
		DormFurnitureTemplateData:DeleteDormTemplateInfo(arg_20_1.id)
		manager.notify:Invoke(DORM_TEMPLATE_CHANGE)
	else
		ShowTips(arg_20_0.result)
	end
end

function var_0_0.RevisePrivateDormPos(arg_21_0, arg_21_1)
	local var_21_0 = {}

	for iter_21_0, iter_21_1 in ipairs(arg_21_1) do
		local var_21_1 = {
			architecture_id = iter_21_1.roomID,
			pos_id = iter_21_1.posID
		}

		table.insert(var_21_0, var_21_1)
	end

	manager.net:SendWithLoadingNew(58146, {
		dorm_pos_list = var_21_0
	}, 58147, var_0_0.RevisePrivateDormPosCallBack)
end

function var_0_0.RevisePrivateDormPosCallBack(arg_22_0, arg_22_1)
	if isSuccess(arg_22_0.result) then
		DormitoryData:RevisePrivateDormPosData(arg_22_1)
	else
		ShowTips(arg_22_0.result)
	end
end

function var_0_0.AskFurTemplateExhibitList(arg_23_0, arg_23_1)
	manager.net:SendWithLoadingNew(58148, {
		type = arg_23_1
	}, 58149, var_0_0.AskFurTemplateExhibitListCallBack)
end

function var_0_0.AskFurTemplateExhibitListCallBack(arg_24_0, arg_24_1)
	if isSuccess(arg_24_0.result) then
		DormVisitTools:RefreshTemplateExhibit(arg_24_0.exhibition_brief, arg_24_1.type)
		manager.notify:Invoke(DORM_REFRESH_TEMPLATE_EXHI, #arg_24_0.exhibition_brief, arg_24_1.type)
	else
		ShowTips(arg_24_0.result)
	end
end

local var_0_5

function var_0_0.AskSingleFurTemplateExhibit(arg_25_0, arg_25_1)
	var_0_5 = arg_25_1

	local function var_25_0()
		local var_26_0 = {
			user_id = arg_25_1
		}

		manager.net:SendWithLoadingNew(58050, var_26_0, 58051, function(arg_27_0)
			if isSuccess(arg_27_0.result) then
				DormVisitTools:RefreshCurTemplateExhibit(arg_27_0, arg_25_1, false)

				if arg_27_0.architecture_id then
					local var_27_0 = BackHomeCfg[arg_27_0.architecture_id].type

					if var_27_0 == DormConst.BACKHOME_TYPE.PublicDorm then
						BackHomeDataManager:GotoBackHomeScene(DormConst.DORM_VISIT_LOBBY)
					elseif var_27_0 == DormConst.BACKHOME_TYPE.PrivateDorm then
						BackHomeDataManager:GotoBackHomeScene(DormConst.DORM_VISIT_PRIVATE)
					end
				end
			else
				ShowTips(arg_27_0.result)
			end
		end)
	end

	BackHomeAction:GetAllDetailInfo(var_25_0)
end

function var_0_0.OtherSystemAskSingleFurTemplateExhibit(arg_28_0, arg_28_1)
	local function var_28_0()
		local var_29_0 = {
			user_id = arg_28_1
		}

		manager.net:SendWithLoadingNew(58050, var_29_0, 58051, function(arg_30_0)
			if isSuccess(arg_30_0.result) then
				DormVisitTools:RefreshCurTemplateExhibit(arg_30_0, arg_28_1, true)

				if arg_30_0.architecture_id then
					local var_30_0 = BackHomeCfg[arg_30_0.architecture_id].type

					if var_30_0 == DormConst.BACKHOME_TYPE.PublicDorm then
						BackHomeDataManager:GotoBackHomeScene(DormConst.DORM_VISIT_LOBBY)
					elseif var_30_0 == DormConst.BACKHOME_TYPE.PrivateDorm then
						BackHomeDataManager:GotoBackHomeScene(DormConst.DORM_VISIT_PRIVATE)
					end
				end
			else
				ShowTips(arg_30_0.result)
			end
		end)
	end

	BackHomeAction:GetAllDetailInfo(var_28_0)
end

function var_0_0.SetFurTemplateExhibit(arg_31_0, arg_31_1, arg_31_2)
	manager.net:SendWithLoadingNew(58152, {
		architecture_id = arg_31_1,
		picture_link = arg_31_2 or ""
	}, 58153, var_0_0.SetFurTemplateExhibitCallBack)
end

function var_0_0.SetFurTemplateExhibitCallBack(arg_32_0, arg_32_1)
	if isSuccess(arg_32_0.result) then
		DormVisitTools:SetCurTemplateExhibit(arg_32_1.architecture_id)
		manager.notify:Invoke(DORM_REFRESH_EXIBIT)
	else
		ShowTips(arg_32_0.result)
	end
end

function var_0_0.WatchTheatre(arg_33_0, arg_33_1)
	manager.net:SendWithLoadingNew(58128, {
		theatrical_id = arg_33_1
	}, 58129, var_0_0.WatchTheatreCallBack)
end

function var_0_0.WatchTheatreCallBack(arg_34_0, arg_34_1)
	if isSuccess(arg_34_0.result) then
		manager.notify:Invoke(DORM_BIRTHDAY_THEATRE_WATCHED, arg_34_1.theatrical_id)
	else
		ShowTips(arg_34_0.result)
	end
end

function var_0_0.SettlementRhythmGame(arg_35_0, arg_35_1)
	manager.net:SendWithLoadingNew(58154, {
		stage_id = arg_35_1.stage_id,
		percentage_complete = arg_35_1.percentage_complete,
		hero_id = arg_35_1.hero_id
	}, 58155, var_0_0.SettlementRhythmGameCallBack)
end

function var_0_0.SettlementRhythmGameCallBack(arg_36_0, arg_36_1)
	if isSuccess(arg_36_0.result) then
		DormData:GetHeroTemplateInfo(arg_36_1.hero_id):SetFatigue(arg_36_0.fatigue)
		manager.notify:Invoke(BACKHOME_HERO_FATIGUR_REFRESH)

		local var_36_0 = {}

		for iter_36_0, iter_36_1 in ipairs(arg_36_0.reward_list) do
			local var_36_1 = {
				id = iter_36_1.id,
				num = iter_36_1.num
			}

			table.insert(var_36_0, var_36_1)
		end

		if var_36_0[1] then
			DormitoryData:AddDailCurrencyNum(var_36_0[1].num)
		else
			DormitoryData:AddDailCurrencyNum(0)
		end

		manager.notify:Invoke(DORM_STOP_RHYTHM_GAME, true, var_36_0 or {})
	else
		ShowTips(arg_36_0.result)
	end
end

function var_0_0.SetHeroSkin(arg_37_0, arg_37_1, arg_37_2)
	if BackHomeHeroSkinCfg[arg_37_1] then
		local var_37_0 = BackHomeHeroSkinCfg[arg_37_1].hero_id
		local var_37_1 = {
			hero_id = var_37_0,
			skin_id = arg_37_1,
			source = arg_37_2
		}

		manager.net:SendWithLoadingNew(58126, var_37_1, 58127, var_0_0.SetHeroSkinCallBack)
	else
		print("不存在的皮肤配置信息" .. arg_37_1)
	end
end

function var_0_0.SetHeroSkinCallBack(arg_38_0, arg_38_1)
	if isSuccess(arg_38_0.result) then
		local var_38_0 = arg_38_1.skin_id
		local var_38_1 = BackHomeHeroSkinCfg[var_38_0].hero_id

		DormData:GetHeroTemplateInfo(var_38_1):SetHeroSkinID(var_38_1, var_38_0)
		manager.notify:Invoke(DORM_HERO_SKIN_CHANGE, var_38_0)
		ShowTips("DORM_HERO_SKIN_CHANGE_SUCCESS")
	else
		ShowTips(arg_38_0.result)
	end
end

manager.net:Bind(58157, function(arg_39_0)
	DormSuitData:RefreshUnLockSuitList(arg_39_0.suit_id_list)
end)

function var_0_0.SetFurnitureTemplatCanSave(arg_40_0)
	manager.net:SendWithLoadingNew(58158, {
		is_open = arg_40_0
	}, 58159, var_0_0.SetFurnitureTemplatCanSaveCallBack)
end

function var_0_0.SetFurnitureTemplatCanSaveCallBack(arg_41_0, arg_41_1)
	if isSuccess(arg_41_0.result) then
		DormFurnitureTemplateData:SetOtherCanSave(arg_41_1.is_open)
		manager.notify:Invoke(DOMR_SAVE_FLAG_CHANGE)
	else
		ShowTips(arg_41_0.result)
	end
end

function var_0_0.ModifyFurniture(arg_42_0, arg_42_1, arg_42_2)
	DormData:AddFurTotalNum(arg_42_0, arg_42_1, arg_42_2)
end

function var_0_0.LikeDormRoom(arg_43_0, arg_43_1, arg_43_2)
	manager.net:SendWithLoadingNew(58052, {
		user_id = arg_43_0,
		architecture_id = arg_43_1
	}, 58053, function(arg_44_0, arg_44_1)
		if isSuccess(arg_44_0.result) then
			local var_44_0, var_44_1 = DormVisitTools:GetExhibitListByUserID(arg_43_0)

			if var_44_0 and var_44_1 then
				var_44_0.likeNum = var_44_0.likeNum + 1
			end

			local var_44_2 = DormVisitTools:GetCurVisitRoomData()

			var_44_2.likeNum = var_44_2.likeNum + 1
			var_44_2.todayLikeNum = var_44_2.todayLikeNum + 1

			manager.notify:Invoke(DORM_LIKE_NUM_REFRESH)

			if arg_43_2 then
				arg_43_2(arg_44_0, arg_44_1)
			end
		else
			ShowTips(arg_44_0.result)
		end
	end)
end

function var_0_0.AskDormRoomLikeNum(arg_45_0, arg_45_1)
	manager.net:SendWithLoadingNew(58054, {
		architecture_id = arg_45_0
	}, 58055, function(arg_46_0, arg_46_1)
		if isSuccess(arg_46_0.result) then
			local var_46_0 = DormitoryData:GetDormSceneData(arg_46_1.architecture_id)

			if var_46_0 then
				var_46_0.likeNum = arg_46_0.liked_num
			end

			manager.notify:Invoke(DORM_LIKE_NUM_REFRESH)

			if arg_45_1 then
				arg_45_1()
			end
		else
			ShowTips(arg_46_0.result)
		end
	end)
end

manager.net:Bind(58063, function(arg_47_0)
	DormInfomationData:RefreshData(arg_47_0)
end)

return var_0_0
