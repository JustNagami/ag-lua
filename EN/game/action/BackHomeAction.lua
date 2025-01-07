﻿local var_0_0 = {}

manager.notify:RegistListener(ZERO_REFRESH, function()
	CanteenData:RefreshCanteenDailyZero()
	DormitoryData:RefreshDormDailyZero()
	BackHomeCricketBattleData:RefreshCricketBattleDailyZero()
	DormData:RefreshDailyZero()
end)

function var_0_0.CheckToEnterDormScene(arg_2_0, arg_2_1)
	var_0_0:EnterDormMap(arg_2_1)
end

local function var_0_1(arg_3_0)
	return nullable(BackHomeCfg, arg_3_0, "type")
end

local function var_0_2(arg_4_0)
	return arg_4_0 == DormConst.BACKHOME_TYPE.PrivateDorm or arg_4_0 == DormConst.BACKHOME_TYPE.PublicDorm or arg_4_0 == DormConst.BACKHOME_TYPE.VISITPUBLICDORM or arg_4_0 == DormConst.BACKHOME_TYPE.VISITPRIVATEDORM
end

function var_0_0.EnterDormMap(arg_5_0, arg_5_1)
	local var_5_0 = var_0_1(DormData.GetInstance():GetCurrectSceneID())
	local var_5_1 = var_0_1(arg_5_1)

	DormData:SetCurrentScene(arg_5_1)

	if var_0_2(var_5_0) and var_0_2(var_5_1) then
		local var_5_2 = UnityEngine.Camera.main.transform
		local var_5_3 = var_5_2.localPosition
		local var_5_4 = var_5_2.localEulerAngles

		OnExitDormScene()

		local function var_5_5()
			OnEnterDormScene()
			manager.ui:SetMainCameraPos(var_5_3)
			manager.ui:SetMainCameraRot(var_5_4)
		end

		arg_5_0:GetVisitData(function()
			if var_5_1 ~= var_5_0 then
				local var_7_0 = var_0_0:CreateDormDataForExchange(arg_5_1)

				DormLuaBridge.ChangeDormScene(var_7_0, var_5_5)
			else
				var_5_5()
			end
		end)
	else
		arg_5_0:GetVisitData(function()
			local var_8_0 = var_0_0:CreateDormDataForExchange(arg_5_1)

			StartDormMode(var_8_0)
		end)
	end
end

function var_0_0.CreateDormDataForExchange(arg_9_0, arg_9_1)
	local var_9_0 = GetDormDataForExcehange()
	local var_9_1 = BackHomeCfg[arg_9_1]

	var_9_0.sceneName = var_9_1.scene
	var_9_0.dormMapCfg = BackHomeCfg.AllMapCfg

	if var_9_1.type == DormConst.BACKHOME_TYPE.VISITPUBLICDORM then
		var_9_0.sceneType = DormConst.BACKHOME_TYPE.PublicDorm
	elseif var_9_1.type == DormConst.BACKHOME_TYPE.VISITPRIVATEDORM then
		var_9_0.sceneType = DormConst.BACKHOME_TYPE.PrivateDorm
	else
		var_9_0.sceneType = var_9_1.type
	end

	var_9_0.furnitureConfigs = BackHomeFurniture.AllFurnitureConfig
	var_9_0.mapFurnitureInfoS = RoomInfo.New()
	var_9_0.mapFurnitureInfoS.id = arg_9_1
	var_9_0.mapFurnitureInfoS.sceneName = var_9_1.scene
	var_9_0.mapFurnitureInfoS.furnitureInfoS = DormData:GetDormSceneData(arg_9_1).roomInfo.furnitureInfoS

	return var_9_0
end

manager.net:Bind(58001, function(arg_10_0)
	BackHomeDataManager:InitAllSampleData(arg_10_0)
	DormRedPointTools:UpdataGlobalRedPoint()
end)

local var_0_3
local var_0_4

function var_0_0.GetAllDetailInfo(arg_11_0, arg_11_1, arg_11_2)
	var_0_3 = arg_11_2
	var_0_4 = arg_11_1

	manager.net:SendWithLoadingNew(58002, {
		nothing = 1
	}, 58003, var_0_0.GetAllDetailInfoCallBack)
end

function var_0_0.GetAllDetailInfoCallBack(arg_12_0)
	if isSuccess(arg_12_0.result) then
		BackHomeDataManager:InitAllDetailData(arg_12_0)
		DormRedPointTools:UpdataGlobalRedPoint()

		if var_0_4 then
			var_0_4(var_0_3)

			var_0_4 = nil
			var_0_3 = nil
		end
	else
		print("获取后宅详情失败")
	end
end

local var_0_5
local var_0_6

function var_0_0.GetVisitData(arg_13_0, arg_13_1, arg_13_2)
	var_0_6 = arg_13_1
	var_0_5 = arg_13_2

	manager.net:SendWithLoadingNew(58058, {}, 58059, var_0_0.GetAllVisitDataResponse)
end

function var_0_0.GetAllVisitDataResponse(arg_14_0)
	if isSuccess(arg_14_0.result) then
		BackHomeDataManager:InitAllVisitData(arg_14_0)

		if var_0_6 then
			var_0_6(var_0_5)

			var_0_6 = nil
			var_0_5 = nil
		end
	else
		print("获取后宅访问数据失败")
	end
end

local var_0_7

function var_0_0.RequestReward(arg_15_0, arg_15_1)
	var_0_7 = arg_15_1

	manager.net:SendWithLoadingNew(58060, {}, 58061, var_0_0.GetRewardRensponse)
end

function var_0_0.GetRewardRensponse(arg_16_0)
	if isSuccess(arg_16_0.result) then
		local var_16_0 = {}

		for iter_16_0, iter_16_1 in ipairs(arg_16_0.be_visited_reward_list) do
			local var_16_1 = iter_16_1.reward_list

			for iter_16_2, iter_16_3 in ipairs(var_16_1) do
				table.insert(var_16_0, {
					user = {
						id = iter_16_1.user_id,
						name = iter_16_1.profile_base.nick,
						icon = iter_16_1.profile_base.icon,
						icon_frame = iter_16_1.profile_base.icon_frame
					},
					name = iter_16_1.profile_base.nick,
					id = iter_16_3.id,
					num = iter_16_3.num
				})
			end

			local var_16_2 = DormData:GetWeekReceivedGiftNum() + #var_16_0

			DormData:UpdateReceivedWeekGiftNum(var_16_2)
		end

		if var_0_7 then
			var_0_7(var_16_0)

			var_0_7 = nil
		end
	else
		print("获取后宅详情失败")
	end
end

manager.net:Bind(58065, function(arg_17_0)
	BackHomeDataManager:InitAllVisitData(arg_17_0)
end)

return var_0_0
