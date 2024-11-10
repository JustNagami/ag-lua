Dorm.timer = {}

function Dorm.NewTimer(...)
	local var_1_0 = Timer.New(...)

	table.insert(Dorm.timer, var_1_0)

	return var_1_0
end

local function var_0_0(arg_2_0)
	Dorm.heroSpecialVfxInfo = {}

	Dorm.storage:MapToData(DormEnum.Namespace.HeroShowSpecialVfx, Dorm.heroSpecialVfxInfo)

	Dorm.charaVfxActiveType = arg_2_0
end

function OnEnterDormScene(arg_3_0)
	gameContext:SetSystemLayer("battle")
	DormLuaBridge.CalcDormSpawnBounds()

	if DormData:GetCurrectSceneID() >= DormConst.DORM_VISIT_ROOM_MIN then
		Dorm.DormEntityManager.EnablePlayerInput = false
	else
		Dorm.DormEntityManager.EnablePlayerInput = true
	end

	Dorm.storage = DormStorage.GetInstance()

	Dorm.storage:Reset()
	LuaForUtil.UpdateCameraSetting()

	if not arg_3_0 then
		manager.uiInit()
	end

	Dorm.subtitleViewStack = {}
	Dorm.globalSubtitleView = SubtitleBubbleView.New()

	Dorm.globalSubtitleView:OnEnter()
	DormRegisterCMDEvent()
	var_0_0({
		DormEnum.SpecialVfx.Hungry
	})
	DormFurnitureManager.GetInstance():Init()
	DormCharacterManager.GetInstance():Init()
	DormCharacterActionManager:Init()
	DormCharacterInteractBehaviour:Init()

	local var_3_0 = DormData:GetCurrectSceneID()
	local var_3_1 = BackHomeCfg[var_3_0].type

	if var_3_1 == DormConst.BACKHOME_TYPE.PublicDorm or var_3_1 == DormConst.BACKHOME_TYPE.PrivateDorm then
		DormAction.AskDormRoomLikeNum(var_3_0)
	end

	if DormitoryData:GetFlag() then
		gameContext:Go("/dormVisitView")
		DormitoryData:VisitFlag(nil)
	else
		gameContext:Go("/dorm")
	end

	manager.windowBar:SetWhereTag("dorm")
	DormFurnitureTools:GenerateFurnitureWhenEnterScene()
	DormHeroTools:GenerateHeroWhenEnterScene()
	Dorm.Enter()
end

function OnExitDormScene(arg_4_0)
	Dorm.Leave()
	manager.audio:StopAll()
	manager.windowBar:ClearWhereTag()
	Dorm.globalSubtitleView:OnExit()

	Dorm.globalSubtitleView = Dorm.globalSubtitleView:Dispose()
	Dorm.subtitleViewStack = nil

	if arg_4_0 then
		gameContext:DestroyCurRoutes()
	else
		DestroyLua()
	end

	DormCharacterManager.GetInstance():Reset()
	DormFurnitureManager.GetInstance():Reset()
	DormCharacterInteractBehaviour:Reset()
	DormCharacterActionManager:Reset()

	Dorm.charaVfxActiveType = nil
	Dorm.heroSpecialVfxInfo = nil
end

function OnClickFurniture(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0

	if arg_5_2 and arg_5_2 >= 0 then
		var_5_0 = arg_5_2
	end

	JumpTools.OpenPageByJump("/furnitureEdit", {
		type = "edit",
		itemId = arg_5_0,
		furEntityID = arg_5_1,
		furSuitEid = var_5_0
	})
end

function OnClickIllegalSuitFurniture(arg_6_0, arg_6_1, arg_6_2)
	if arg_6_2 == "otherSuit" then
		ShowTips("DORM_FURNITURE_CANT_ADD_OTHER_SUIT")
	elseif arg_6_2 == "cantPlace" then
		ShowTips("DORM_SUIT_CANT_PlACE_ADD_FURNITURE")
	elseif arg_6_2 == "wallFur" then
		ShowTips("DORM_FURNITURE_CANT_ADD_SUIT")
	end
end

function EnterSuitAllEditMode(arg_7_0, arg_7_1, arg_7_2)
	manager.notify:Invoke(DORM_ENTER_SUIT_EDIT_MODE, arg_7_0, arg_7_1, arg_7_2)
end

function OnEnterCanteenScene()
	gameContext:SetSystemLayer("battle")

	Dorm.DormEntityManager.EnablePlayerInput = false
	Dorm.sceneItemInfo = {}
	Dorm.charaVfxActiveType = {
		DormEnum.SpecialVfx.Tired
	}

	DormLuaBridge.RecordInfoFromDormTag()

	Dorm.timer = {}
	Dorm.storage = DormStorage.GetInstance()

	Dorm.storage:Reset()

	Dorm.restaurant = CanteenManager.GetInstance()

	LuaForUtil.UpdateCameraSetting()
	manager.uiInit()
	DormRegisterCMDEvent()
	manager.windowBar:SetWhereTag("canteen")
	var_0_0({
		DormEnum.SpecialVfx.Tired
	})
	Dorm.restaurant:RegisterEvent()
	Dorm.restaurant:Init()
	gameContext:Go("/restaurantMain")
	DormRedPointTools:ConsumeNotification(RedPointConst.CANTEEN_BUSINESS_STOPPED, DormRedPointTools.RedPointType.Session)
	CanteenTools:SwitchCanteenBgm(DormEnum.RestaurantMode.Start)
	Dorm.Enter()
end

function OnExitCanteenScene()
	Dorm.Leave()

	for iter_9_0, iter_9_1 in pairs(Dorm.timer) do
		iter_9_1:Stop()
	end

	manager.audio:StopAll()
	manager.windowBar:ClearWhereTag()
	Dorm.restaurant:RemoveEvent()
	Dorm.restaurant:Reset()

	Dorm.sceneItemInfo = nil
	Dorm.charaVfxActiveType = nil
	Dorm.heroSpecialVfxInfo = nil

	DestroyLua()
end

function ChangeDormScene()
	DestroyLua()
end

function ChangeDormBackGround()
	local var_11_0 = GameDisplayCfg.dorm_loading_tips
	local var_11_1 = GameDisplayCfg.dorm_loading_picture

	if var_11_0 and var_11_1 then
		local var_11_2 = math.random(1, #var_11_0.value)
		local var_11_3 = math.random(1, #var_11_1.value)
		local var_11_4 = GetTips(var_11_0.value[var_11_2][1]) or ""
		local var_11_5 = GetTips(var_11_0.value[var_11_2][2]) or ""
		local var_11_6 = var_11_1.value[var_11_3] or "loading_11"

		LoadingUIManager.inst:UpdateLoadingInfo(var_11_4, var_11_5, var_11_6)
	end
end
