local var_0_0 = {}

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

		if var_5_1 ~= var_5_0 then
			local var_5_6 = var_0_0:CreateDormDataForExchange(arg_5_1)

			DormLuaBridge.ChangeDormScene(var_5_6, var_5_5)
		else
			var_5_5()
		end
	else
		local var_5_7 = var_0_0:CreateDormDataForExchange(arg_5_1)

		StartDormMode(var_5_7)
	end
end

function var_0_0.CreateDormDataForExchange(arg_7_0, arg_7_1)
	local var_7_0 = GetDormDataForExcehange()
	local var_7_1 = BackHomeCfg[arg_7_1]

	var_7_0.sceneName = var_7_1.scene
	var_7_0.dormMapCfg = BackHomeCfg.AllMapCfg

	if var_7_1.type == DormConst.BACKHOME_TYPE.VISITPUBLICDORM then
		var_7_0.sceneType = DormConst.BACKHOME_TYPE.PublicDorm
	elseif var_7_1.type == DormConst.BACKHOME_TYPE.VISITPRIVATEDORM then
		var_7_0.sceneType = DormConst.BACKHOME_TYPE.PrivateDorm
	else
		var_7_0.sceneType = var_7_1.type
	end

	var_7_0.furnitureConfigs = BackHomeFurniture.AllFurnitureConfig
	var_7_0.mapFurnitureInfoS = RoomInfo.New()
	var_7_0.mapFurnitureInfoS.id = arg_7_1
	var_7_0.mapFurnitureInfoS.sceneName = var_7_1.scene
	var_7_0.mapFurnitureInfoS.furnitureInfoS = DormData:GetDormSceneData(arg_7_1).roomInfo.furnitureInfoS

	return var_7_0
end

manager.net:Bind(58001, function(arg_8_0)
	BackHomeDataManager:InitAllSampleData(arg_8_0)
	DormRedPointTools:UpdataGlobalRedPoint()
end)

local var_0_3
local var_0_4

function var_0_0.GetAllDetailInfo(arg_9_0, arg_9_1, arg_9_2)
	var_0_3 = arg_9_2
	var_0_4 = arg_9_1

	manager.net:SendWithLoadingNew(58002, {
		nothing = 1
	}, 58003, var_0_0.GetAllDetailInfoCallBack)
end

function var_0_0.GetAllDetailInfoCallBack(arg_10_0)
	if isSuccess(arg_10_0.result) then
		BackHomeDataManager:InitAllDetailData(arg_10_0)
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

return var_0_0
