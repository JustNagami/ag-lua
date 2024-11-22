local var_0_0 = {
	HZ07_lianliankan = LianLianKanBridge,
	HZ07_diaoyu1 = FishingGameBridge,
	HZ07_xueqiu1 = SnowballGameBridge,
	HZ07_tuanxue1 = PushSnowBallGameBridge,
	WT_RK = IdolTraineeCampBridge,
	HZ07_kaorou1 = BarbuceGameBridge
}

function OnEnterMiniGameScene(arg_1_0)
	Dorm.Enter()
	LuaForUtil.UpdateCameraSetting()
	manager.uiInit()
	manager.windowBar:SetWhereTag("minigame")

	Dorm.storage = DormStorage.GetInstance()

	Dorm.storage:Reset()

	Dorm.sceneItemInfo = {}
	Dorm.subtitleViewStack = {}

	DormLuaBridge.RecordInfoFromDormTag()
	DormUtils.MapSceneItemTagInfo()
	DormCharacterActionManager:Init()
	DormCharacterInteractBehaviour:Init()

	local var_1_0 = nullable(Dorm.minigame, "Enter")

	if var_1_0 then
		var_1_0(Dorm.minigame, arg_1_0)
	end
end

function OnExitMiniGameScene(arg_2_0, arg_2_1)
	if Dorm.lastMinigame == nil then
		Dorm.lastMinigame, Dorm.minigame = Dorm.minigame
	end

	local var_2_0 = Dorm.lastMinigame
	local var_2_1 = nullable(var_2_0, "Exit")

	if var_2_1 then
		var_2_1(var_2_0, arg_2_0, arg_2_1)
	end

	Dorm.subtitleViewStack = nil
	Dorm.lastMinigame = nil

	DormCharacterInteractBehaviour:Reset()
	DormCharacterActionManager:Reset()
	Dorm.storage:Reset()

	Dorm.sceneItemInfo = nil

	manager.windowBar:ClearWhereTag()
	DestroyLua()
	Dorm.Leave()
end

DormMinigame = {}

function DormMinigame.Launch(arg_3_0, arg_3_1)
	Dorm.lastMinigame, Dorm.minigame = Dorm.minigame, arg_3_1 or var_0_0[arg_3_0]

	Dorm.LuaBridge.MiniGameBridge.Launch(arg_3_0)
	DestroyLua()
	gameContext:SetSystemLayer("battle")
end

function DormMinigame.Exit()
	DestroyLua()
	LuaExchangeHelper.GoToMain()
	OpenPageUntilLoaded("/home")
end

function DormMinigame.AdjustCameraFOV(arg_5_0, arg_5_1)
	local var_5_0 = 1 / arg_5_0 / (Screen.width / Screen.height)
	local var_5_1 = arg_5_1 or manager.ui.mainCameraCom_.fieldOfView
	local var_5_2 = math.max(var_5_0 * var_5_1, var_5_1)

	manager.ui.mainCameraCom_.fieldOfView = var_5_2
end
