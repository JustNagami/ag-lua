local var_0_0 = singletonClass("LianLianKanGameManager")
local var_0_1 = {
	previewItemRemove = "Dorm/Effect/lianliankan/Fx_daoju_cx",
	itemNotMatch = "Dorm/Effect/lianliankan/Fx_effect_cuowu",
	itemEnter = "Dorm/Effect/lianliankan/Fx_effect_cai_xinzeng",
	itemRemove = "Dorm/Effect/lianliankan/Fx_gezi_effect"
}
local var_0_2 = "minigame_activity_2_1"
local var_0_3 = {
	ItemNotMatch = "minigame_activity_2_1_connect_fail",
	ItemPreviewClear = "minigame_activity_2_1_connect_tool02",
	Select = "minigame_activity_2_1_connect_choose",
	ItemMatch = "minigame_activity_2_1_connect_link",
	CancelSelect = "minigame_activity_2_1_connect_cancel"
}
local var_0_4 = "Dorm/Dormitory/HZ07_placeholder"
local var_0_5 = "Dorm/Dormitory/HZ07_lianliankan_gezi"
local var_0_6 = "Dorm/Dormitory/HZ07_item_preview"
local var_0_7 = "Dorm/Food/120"

local function var_0_8(arg_1_0)
	return arg_1_0.model
end

local function var_0_9(arg_2_0)
	if arg_2_0.type ~= nil then
		local var_2_0 = "lianliankan.pos." .. arg_2_0.type
		local var_2_1 = Dorm.storage:GetData(var_2_0, "#") or 0

		if var_2_1 ~= 0 then
			local var_2_2 = ((arg_2_0.spawnAt or 1) - 1) % var_2_1 + 1
			local var_2_3 = Dorm.storage:GetData(var_2_0, var_2_2) or Dorm.storage:PickData(var_2_0)

			return nullable(var_2_3, "transform")
		end
	end
end

function var_0_0.Ctor(arg_3_0)
	arg_3_0.workerIdx = {}
	arg_3_0.previewItemQueueCap = 10
	arg_3_0.entityManagers = {}

	local var_3_0 = EntityManager.CreateModel.New(var_0_8, var_0_9)
	local var_3_1 = EntityManager.CreateModel.New(var_0_8, var_0_9, 0.4)

	arg_3_0.placeholderEntityManager = EntityManager.New(var_3_0)
	arg_3_0.itemEntityManager = EntityManager.New(var_3_0)
	arg_3_0.customerFoodEntityManager = EntityManager.New(var_3_0)
	arg_3_0.previewEntityManager = EntityManager.New(var_3_1)
	arg_3_0.customerEntityManager = EntityManager.New(var_3_0)
	arg_3_0.workerEntityManager = EntityManager.New(var_3_0)

	table.insert(arg_3_0.entityManagers, arg_3_0.placeholderEntityManager)
	table.insert(arg_3_0.entityManagers, arg_3_0.itemEntityManager)
	table.insert(arg_3_0.entityManagers, arg_3_0.customerFoodEntityManager)
	table.insert(arg_3_0.entityManagers, arg_3_0.previewEntityManager)
	table.insert(arg_3_0.entityManagers, arg_3_0.customerEntityManager)
	table.insert(arg_3_0.entityManagers, arg_3_0.workerEntityManager)

	arg_3_0.itemEntityManager.OnCreate = handler(arg_3_0, arg_3_0.OnItemCreate)
	arg_3_0.itemEntityManager.OnRemove = handler(arg_3_0, arg_3_0.OnItemRemoved)

	function arg_3_0.customerFoodEntityManager.OnCreate(arg_4_0)
		DormCharacterActionManager.taskRunner:NewTask():WaitForSec(5):Then(function()
			arg_3_0.customerFoodEntityManager:Remove(arg_4_0)
		end):Start()
	end

	function arg_3_0.previewEntityManager.OnCreate(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
		local var_6_0 = Dorm.storage:GetData("lianliankan.path.preview", arg_6_0)

		Dorm.DormEntityManager.SetEntitySpeed(arg_6_1, 0.5)
		DormUtils.MoveByPath(arg_6_1, var_6_0, true)

		local var_6_1 = ActivityLinkGameCellCfg[arg_6_3.itemID]

		Dorm.LuaBridge.MiniGameBridge.SetupItemSprite(arg_6_1, var_6_1.path .. "/" .. var_6_1.album_id)
	end

	function arg_3_0.customerEntityManager.OnCreate(arg_7_0, arg_7_1)
		Dorm.DormEntityManager.ChangeEntityAnimeScheme(arg_7_1, "sit")
	end

	arg_3_0.listener = EventListener.New()
	arg_3_0.turn = 2
end

var_0_0.ItemQueueNamespace = "lianliankan.itemQueue"

function var_0_0.RegForwardAIEvent(arg_8_0, arg_8_1, arg_8_2)
	arg_8_0.listener:Register(arg_8_1, function(...)
		arg_8_0.ForwardToAI(arg_8_1, ...)

		if arg_8_2 then
			arg_8_2(...)
		end
	end)
end

function var_0_0.Init(arg_10_0, arg_10_1)
	arg_10_0.level = arg_10_1
	arg_10_0.gridMap = GridMap.New(8, 7)

	arg_10_0:RegisterEvents()

	arg_10_0.preparedSortInfo = nil
	arg_10_0.gridCoordOrigin = Dorm.storage:PickData("lianliankan.pos.origin").transform
	arg_10_0.items = {}

	for iter_10_0, iter_10_1 in Dorm.storage:ForeachData("lianliankan.pos.Pan", pairs) do
		local var_10_0 = iter_10_1.transform
		local var_10_1 = Dorm.DormEntityManager.Instance:MakeModelEntity(var_10_0)

		table.insert(arg_10_0.items, var_10_1)
		Dorm.storage:RecordData(var_0_0.ItemEidNameSpace(DormEnum.ItemType.Pan), iter_10_0, var_10_1)
	end

	local var_10_2 = Dorm.storage:PickData("lianliankan.pos.chuansongdai").transform

	chuansongdai = Dorm.DormEntityManager.Instance:MakeModelEntity(var_10_2)

	table.insert(arg_10_0.items, chuansongdai)

	arg_10_0.chuansongdai = chuansongdai

	arg_10_0.previewEntityManager:MapToDormStorageData(arg_10_0.ItemQueueNamespace, nil)

	local var_10_3 = DormUtils.EIdNamespace(DormEnum.CharacterType.RestaurantNormalCustomer)

	arg_10_0.customerEntityManager:MapToDormStorageData(var_10_3, nil)

	arg_10_0.workerIdx = {}

	arg_10_0:GenWorkerEntity(arg_10_1)
	arg_10_0:GenCustomerEntity(arg_10_1)

	local var_10_4 = ActivityLinkGameCfg[arg_10_1]

	arg_10_0.placeholderEntityManager:Clear()

	for iter_10_2, iter_10_3 in ipairs(var_10_4.blank_pos) do
		local var_10_5 = Vector2(unpack(iter_10_3))

		arg_10_0:AddPlaceHolder(var_10_5)
	end
end

function var_0_0.Reset(arg_11_0)
	manager.audio:StopAll()

	arg_11_0.workerIdx = nil
	arg_11_0.lastSelect = nil
	arg_11_0.itemGenDistribution = nil

	for iter_11_0, iter_11_1 in pairs(arg_11_0.items) do
		Dorm.DormEntityManager.Instance:RemoveEntity(iter_11_1)
	end

	arg_11_0.items = nil
	arg_11_0.chuansongdai = nil

	LianLianKan.AI[DormEnum.CharacterType.RestaurantNormalCustomer].Clear()
	LianLianKan.AI[DormEnum.CharacterType.RestaurantCook].Clear()
	Dorm.storage:ClearData(var_0_0.ItemEidNameSpace(DormEnum.ItemType.Pan))

	for iter_11_2, iter_11_3 in ipairs(arg_11_0.entityManagers) do
		iter_11_3:Clear()
	end

	arg_11_0.listener:RemoveAll()

	arg_11_0.preparedSortInfo = nil
end

function var_0_0.Start(arg_12_0)
	arg_12_0:GenItemOnStart(arg_12_0.level)
end

function var_0_0.ResetCurLevel(arg_13_0)
	manager.audio:StopAll()

	arg_13_0.lastSelect = nil

	local var_13_0 = arg_13_0.level

	arg_13_0.previewEntityManager:Clear()
	arg_13_0.itemEntityManager:Clear()

	arg_13_0.workerIdx = {}

	arg_13_0:GenWorkerEntity(var_13_0)
	arg_13_0:GenCustomerEntity(var_13_0)
end

function var_0_0.RegisterEvents(arg_14_0)
	arg_14_0.listener:Register(DORM_CLICK_ENTITY, handler(arg_14_0, arg_14_0.OnClickEntity))
	arg_14_0.listener:Register(LIANLIANKAN_PREVIEW_APPEAR, handler(arg_14_0, arg_14_0.OnPreviewItemCreate))
	arg_14_0.listener:Register(LIANLIANKAN_AUTO_MATCH, handler(arg_14_0, arg_14_0.AutoMatch))
	arg_14_0.listener:Register(LIANLIANKAN_SHUFFLE, handler(arg_14_0, arg_14_0.Shuffle))
	arg_14_0.listener:Register(LIANLIANKAN_GAME_START, handler(arg_14_0, arg_14_0.Start))
	arg_14_0.listener:Register(LIANLIANKAN_GAME_RESET, handler(arg_14_0, arg_14_0.ResetCurLevel))
	arg_14_0:RegForwardAIEvent(ON_DORM_CHARACTER_WAIT_CMD)
	arg_14_0:RegForwardAIEvent(ON_DORM_CHARACTER_INTERACT)
	arg_14_0:RegForwardAIEvent(LIANLIANKAN_USE_ITEM)
	arg_14_0:RegForwardAIEvent(LIANLIANKAN_ITEM_OVERFLOW)
	arg_14_0:RegForwardAIEvent(LIANLIANKAN_CUSTOMER_EAT, handler(arg_14_0, arg_14_0.GenFoodForCustomer))
	arg_14_0:RegForwardAIEvent(LIANLIANKAN_PREVIEW_REMOVE_ALL, handler(arg_14_0, arg_14_0.ClearItemQueue))
end

function var_0_0.PlaySoundEffect(arg_15_0, arg_15_1)
	manager.audio:PlayEffect(var_0_2, arg_15_1)
end

local function var_0_10(arg_16_0, arg_16_1, arg_16_2, arg_16_3)
	local var_16_0

	if arg_16_3 then
		var_16_0 = arg_16_0.gridMap:Put(arg_16_3.x, arg_16_3.y, arg_16_2)
		arg_16_2.gridCoord = arg_16_3
	else
		var_16_0 = arg_16_0.gridMap:RndPut(arg_16_2)

		local var_16_1, var_16_2 = arg_16_0.gridMap:ToCoord(var_16_0)

		arg_16_2.gridCoord = Vector2(var_16_1, var_16_2)
	end

	if var_16_0 then
		arg_16_2.idx = var_16_0

		return (arg_16_2.isPlaceholder and arg_16_0.placeholderEntityManager or arg_16_0.itemEntityManager):Update(var_16_0, arg_16_1, arg_16_2), var_16_0
	end
end

function var_0_0.AddPlaceHolder(arg_17_0, arg_17_1)
	local var_17_0 = {
		model = var_0_4
	}
	local var_17_1, var_17_2 = var_0_10(arg_17_0, var_17_0, {
		itemID = "placeholder",
		isPlaceholder = true
	}, arg_17_1)

	Dorm.DormEntityManager.PutEntityLookToDir(var_17_1, arg_17_0:GridCoordToPos(Vector2(arg_17_0.gridMap:ToCoord(var_17_2))), Vector3.forward)
end

local function var_0_11(arg_18_0, arg_18_1, arg_18_2)
	local var_18_0 = {
		Vector2.left,
		Vector2.up,
		Vector2.right,
		Vector2.down
	}
	local var_18_1 = {
		{
			arg_18_1
		}
	}

	while next(var_18_1) do
		local var_18_2 = table.remove(var_18_1)
		local var_18_3 = var_18_2[2]
		local var_18_4 = var_18_2[3] or 0

		for iter_18_0, iter_18_1 in pairs(var_18_0) do
			local var_18_5 = var_18_3 and var_18_3 ~= iter_18_1 and var_18_3 + iter_18_1 ~= Vector2.zero

			if not var_18_5 or not (var_18_4 < arg_18_2) then
				local var_18_6 = var_18_2[1] + iter_18_1

				if arg_18_0:IsGridInMap(var_18_6.x, var_18_6.y) then
					local var_18_7 = arg_18_0:Get(var_18_6.x, var_18_6.y)

					if var_18_7 == nil then
						return var_18_6
					elseif var_18_7.isPlaceholder then
						table.insert(var_18_1, {
							var_18_6,
							iter_18_1,
							var_18_5 and var_18_4 + 1 or var_18_4
						})
					end
				end
			end
		end
	end
end

local var_0_12 = {
	pooled = true,
	model = var_0_5
}

function var_0_0.Add2Item(arg_19_0, arg_19_1)
	local var_19_0 = {
		itemID = arg_19_1
	}
	local var_19_1 = var_0_10(arg_19_0, var_0_12, var_19_0)
	local var_19_2
	local var_19_3 = var_0_10(arg_19_0, var_0_12, {
		itemID = arg_19_1
	}, var_19_2)

	return var_19_1, var_19_3
end

function var_0_0.OnPreviewItemCreate(arg_20_0)
	if arg_20_0.previewEntityManager.managedEntityNum >= arg_20_0.previewItemQueueCap then
		arg_20_0:FlushPreviewItem()

		if arg_20_0:Find() == nil then
			arg_20_0:Shuffle()
		end
	end

	arg_20_0:GenPreviewItem()
end

function var_0_0.FlushPreviewItem(arg_21_0)
	while arg_21_0.gridMap:HasGridEmpty(2) and #arg_21_0.itemQueue > 0 do
		local var_21_0 = table.remove(arg_21_0.itemQueue, 1)

		arg_21_0.itemGenDistribution:Pop(var_21_0, 2)
		arg_21_0:Add2Item(var_21_0)
	end

	arg_21_0:SortItems()

	local var_21_1 = arg_21_0.itemQueue

	arg_21_0:ClearItemQueue(true)

	if #var_21_1 > 0 then
		manager.notify:Invoke(LIANLIANKAN_ITEM_OVERFLOW, var_21_1)
	end
end

local function var_0_13(arg_22_0, arg_22_1, arg_22_2)
	local var_22_0 = arg_22_1.x + arg_22_2.x
	local var_22_1 = arg_22_1.y + arg_22_2.y
	local var_22_2 = arg_22_1.x
	local var_22_3 = arg_22_1.y

	while arg_22_0:IsGridInMap(var_22_0, var_22_1) do
		if arg_22_0:IsGridEmpty(var_22_0, var_22_1) then
			var_22_2, var_22_3 = var_22_0, var_22_1
			var_22_0, var_22_1 = var_22_0 + arg_22_2.x, var_22_1 + arg_22_2.y
		else
			break
		end
	end

	return Vector2(var_22_2, var_22_3)
end

local var_0_14 = {
	step = 0,
	sortedGrids = {}
}

local function var_0_15(arg_23_0)
	local var_23_0 = arg_23_0.width
	local var_23_1 = arg_23_0.height
	local var_23_2
	local var_23_3 = {}

	for iter_23_0 = 0, var_23_0 - 1 do
		for iter_23_1 = 0, var_23_1 - 1 do
			table.insert(var_23_3, Vector2(iter_23_0, iter_23_1))
		end
	end

	return var_23_3
end

function var_0_0.SortItems(arg_24_0)
	local var_24_0
	local var_24_1

	if arg_24_0.preparedSortInfo == nil then
		local var_24_2 = arg_24_0.level
		local var_24_3 = ActivityLinkGameCfg[var_24_2].sort_func or 0

		if var_24_3 == 0 then
			arg_24_0.preparedSortInfo = var_0_14

			return
		end

		if var_24_3 == 1 then
			var_24_0 = Vector2(-1, 0)
		elseif var_24_3 == 2 then
			var_24_0 = Vector2(1, 0)
		elseif var_24_3 == 3 then
			var_24_0 = Vector2(0, -1)
		else
			var_24_0 = Vector2(0, 1)
		end

		var_24_1 = var_0_15(arg_24_0.gridMap)

		CommonTools.UniversalSortEx(var_24_1, {
			map = function(arg_25_0)
				return Vector2.Dot(arg_25_0, var_24_0)
			end
		})

		arg_24_0.preparedSortInfo = {
			step = var_24_0,
			sortedGrids = var_24_1
		}
	else
		var_24_0 = arg_24_0.preparedSortInfo.step or Vector2.right
		var_24_1 = arg_24_0.preparedSortInfo.sortedGrids or {}
	end

	for iter_24_0, iter_24_1 in pairs(var_24_1) do
		local var_24_4 = arg_24_0:QueryEntityID(iter_24_1.x, iter_24_1.y)

		if var_24_4 then
			local var_24_5 = DormUtils.GetEntityData(var_24_4)
			local var_24_6 = var_0_13(arg_24_0.gridMap, var_24_5.gridCoord, var_24_0)

			arg_24_0:SwapItemToPos(var_24_5, var_24_6)
		end
	end
end

function var_0_0.PrepareNextGenQueue(arg_26_0)
	arg_26_0.itemQueue = arg_26_0.itemGenDistribution:Peek(arg_26_0.previewItemQueueCap, 2)
end

function var_0_0.GenFoodForCustomer(arg_27_0, arg_27_1)
	local var_27_0 = arg_27_0.customerFoodEntityManager

	if var_27_0:GetEntityID(arg_27_1) == nil then
		var_27_0:Create(arg_27_1, {
			pooled = true,
			model = var_0_7,
			type = DormEnum.ItemType.Food,
			spawnAt = arg_27_1
		})
	end
end

function var_0_0.GenPreviewItem(arg_28_0)
	local var_28_0 = {
		complex = true,
		pooled = true,
		model = var_0_6
	}
	local var_28_1 = arg_28_0.previewEntityManager.managedEntityNum + 1

	arg_28_0.previewEntityManager:Update(var_28_1, var_28_0, {
		itemID = arg_28_0.itemQueue[var_28_1]
	})
end

local var_0_16 = 1

function var_0_0.GridCoordToPos(arg_29_0, arg_29_1)
	local var_29_0 = arg_29_1.x
	local var_29_1 = arg_29_1.y
	local var_29_2 = arg_29_0.gridCoordOrigin.position
	local var_29_3 = arg_29_0.gridMap.width
	local var_29_4 = arg_29_0.gridMap.height
	local var_29_5 = var_0_16 * 0.5

	return var_29_2 - Vector3(var_29_0 - 0.5 * var_29_3, 0, var_29_1 - 0.5 * var_29_4) * var_29_5 - Vector3(var_29_5 * 0.5, 0, var_29_5 * 0.5)
end

function var_0_0.ItemEidNameSpace(arg_30_0)
	return "lianliankan.item." .. arg_30_0 .. ".eid"
end

function var_0_0.OnItemCreate(arg_31_0, arg_31_1, arg_31_2, arg_31_3, arg_31_4)
	local var_31_0 = arg_31_4.itemID
	local var_31_1 = var_0_0.ItemEidNameSpace(var_31_0)

	Dorm.storage:RecordData(var_31_1, arg_31_1, arg_31_2)
	Dorm.LuaBridge.MiniGameBridge.SetupClickTriggerForEntity(arg_31_2, var_0_16)

	local var_31_2 = ActivityLinkGameCellCfg[var_31_0]

	Dorm.LuaBridge.MiniGameBridge.SetupItemSprite(arg_31_2, var_31_2.path .. "/" .. var_31_2.album_id)
	arg_31_0:SetItemHighlight(arg_31_2, false)
	Dorm.DormEntityManager.PutEntityLookToDir(arg_31_2, arg_31_0:GridCoordToPos(arg_31_4.gridCoord), Vector3.forward)
	Dorm.DormEntityManager.PlayEffectDetached(arg_31_2, "root", var_0_1.itemEnter, 0.7)
end

function var_0_0.OnItemRemoved(arg_32_0, arg_32_1, arg_32_2)
	Dorm.LuaBridge.MiniGameBridge.MuteClickTriggerForEntity(arg_32_2)

	local var_32_0 = DormUtils.GetEntityData(arg_32_2).itemID
	local var_32_1 = var_0_0.ItemEidNameSpace(var_32_0)

	Dorm.storage:RecordData(var_32_1, arg_32_1, nil)
	arg_32_0.gridMap:RemoveByIdx(arg_32_1)
end

function var_0_0.SetItemHighlight(arg_33_0, arg_33_1, arg_33_2)
	Dorm.DormEntityManager.SetHighlighted(arg_33_1, arg_33_2)

	if arg_33_2 then
		Dorm.DormEntityManager.GrabItemPartCMD(arg_33_1, arg_33_1, "gezi_normal", "gua_hide")
		Dorm.DormEntityManager.GrabItemPartCMD(arg_33_1, arg_33_1, "gezi_highlight", "root")
	else
		Dorm.DormEntityManager.RestoreItemPartCMD(arg_33_1, "gezi_normal")
		Dorm.DormEntityManager.RestoreItemPartCMD(arg_33_1, "gezi_highlight")
	end
end

function var_0_0.SwapItemToPos(arg_34_0, arg_34_1, arg_34_2)
	local var_34_0 = arg_34_1.itemID
	local var_34_1 = arg_34_1.gridCoord

	if var_34_1 == arg_34_2 then
		return
	end

	local var_34_2

	if not arg_34_0.gridMap:IsGridEmpty(arg_34_2.x, arg_34_2.y) then
		local var_34_3 = arg_34_0.gridMap:Get(arg_34_2.x, arg_34_2.y)

		var_34_2 = var_34_3.itemID

		arg_34_0.itemEntityManager:Remove(var_34_3.idx)
	end

	arg_34_0.itemEntityManager:Remove(arg_34_1.idx)
	var_0_10(arg_34_0, var_0_12, {
		itemID = var_34_0
	}, arg_34_2)

	if var_34_2 then
		local var_34_4 = var_0_10(arg_34_0, var_0_12, {
			itemID = var_34_2
		}, var_34_1)
	end
end

function var_0_0.Find(arg_35_0)
	for iter_35_0, iter_35_1 in pairs(arg_35_0.itemGenDistribution.weights) do
		local var_35_0 = {}

		for iter_35_2, iter_35_3 in Dorm.storage:ForeachData(arg_35_0.ItemEidNameSpace(iter_35_0), pairs) do
			table.insert(var_35_0, iter_35_3)
		end

		for iter_35_4 = 1, #var_35_0 - 1 do
			for iter_35_5 = iter_35_4 + 1, #var_35_0 do
				local var_35_1 = var_35_0[iter_35_4]
				local var_35_2 = var_35_0[iter_35_5]
				local var_35_3 = DormUtils.GetEntityData(var_35_1)
				local var_35_4 = DormUtils.GetEntityData(var_35_2)
				local var_35_5 = var_35_3.gridCoord
				local var_35_6 = var_35_4.gridCoord
				local var_35_7 = arg_35_0:TestConnectivity(var_35_5, var_35_6)

				if var_35_7 then
					return var_35_7, var_35_5, var_35_6
				end
			end
		end
	end

	return nil
end

function var_0_0.Shuffle(arg_36_0)
	ShowTips("LIANLIANKAN_NO_SOLUTION_SHUFFLE")

	if arg_36_0.lastSelect and Dorm.DormEntityManager.IsValidEntityID(arg_36_0.lastSelect) then
		arg_36_0:SetItemHighlight(arg_36_0.lastSelect, false)

		arg_36_0.lastSelect = nil
	end

	local var_36_0 = {}

	for iter_36_0, iter_36_1 in pairs(arg_36_0.itemEntityManager.managed) do
		local var_36_1 = DormUtils.GetEntityData(iter_36_1)
		local var_36_2 = (var_36_0[var_36_1.itemID] or 0) + 1

		var_36_0[var_36_1.itemID] = var_36_2
	end

	for iter_36_2, iter_36_3 in pairs(var_36_0) do
		-- block empty
	end

	arg_36_0.itemEntityManager:Clear()

	while next(var_36_0) do
		for iter_36_4, iter_36_5 in pairs(var_36_0) do
			arg_36_0:Add2Item(iter_36_4)

			if iter_36_5 > 2 then
				var_36_0[iter_36_4] = iter_36_5 - 2
			else
				var_36_0[iter_36_4] = nil
			end
		end
	end

	arg_36_0:SortItems()
	arg_36_0:EnsureSolution()
end

function var_0_0.QueryEntityID(arg_37_0, arg_37_1, arg_37_2)
	local var_37_0 = arg_37_0.gridMap:ToIdx(arg_37_1, arg_37_2)

	return arg_37_0.itemEntityManager:GetEntityID(var_37_0)
end

function var_0_0.AutoMatch(arg_38_0)
	local var_38_0, var_38_1, var_38_2 = arg_38_0:Find()
	local var_38_3 = arg_38_0.gridMap:Get(var_38_1.x, var_38_1.y)
	local var_38_4 = arg_38_0.gridMap:Get(var_38_2.x, var_38_2.y)
	local var_38_5 = arg_38_0:QueryEntityID(var_38_1.x, var_38_1.y)
	local var_38_6 = arg_38_0:QueryEntityID(var_38_2.x, var_38_2.y)

	arg_38_0:OnConnectItemSuccess(var_38_0, var_38_5, var_38_6, var_38_3, var_38_4)
end

function var_0_0.TestConnectivity(arg_39_0, arg_39_1, arg_39_2)
	return LianLianKanUtil.TestConnectivity(arg_39_0.gridMap, arg_39_1.x, arg_39_1.y, arg_39_2.x, arg_39_2.y, arg_39_0.turn)
end

function var_0_0.OnClickEntity(arg_40_0, arg_40_1)
	if arg_40_0.lastSelect == nil or not Dorm.DormEntityManager.IsValidEntityID(arg_40_0.lastSelect) then
		arg_40_0:SetItemHighlight(arg_40_1, true)

		arg_40_0.lastSelect = arg_40_1

		arg_40_0:PlaySoundEffect(var_0_3.Select)
	elseif arg_40_1 == arg_40_0.lastSelect then
		arg_40_0:SetItemHighlight(arg_40_1, false)

		arg_40_0.lastSelect = nil

		arg_40_0:PlaySoundEffect(var_0_3.CancelSelect)
	else
		local var_40_0 = DormUtils.GetEntityData(arg_40_0.lastSelect)
		local var_40_1 = DormUtils.GetEntityData(arg_40_1)
		local var_40_2 = var_40_0.itemID
		local var_40_3 = var_40_1.itemID
		local var_40_4

		if var_40_2 == var_40_3 then
			local var_40_5 = var_40_0.gridCoord
			local var_40_6 = var_40_1.gridCoord

			var_40_4 = arg_40_0:TestConnectivity(var_40_5, var_40_6)
		end

		if var_40_4 then
			arg_40_0:OnConnectItemSuccess(var_40_4, arg_40_0.lastSelect, arg_40_1, var_40_0, var_40_1)
		else
			Dorm.DormEntityManager.PlayEffect(arg_40_0.lastSelect, "root", var_0_1.itemNotMatch, 0.6)
			Dorm.DormEntityManager.PlayEffect(arg_40_1, "root", var_0_1.itemNotMatch, 0.6)
			arg_40_0:SetItemHighlight(arg_40_0.lastSelect, false)
			arg_40_0:PlaySoundEffect(var_0_3.ItemNotMatch)
		end

		arg_40_0.lastSelect = nil
	end
end

local var_0_17 = Vector3(0, 0.25, 0)

function var_0_0.OnConnectItemSuccess(arg_41_0, arg_41_1, arg_41_2, arg_41_3, arg_41_4, arg_41_5)
	local var_41_0 = arg_41_4.gridCoord
	local var_41_1 = arg_41_5.gridCoord
	local var_41_2 = {}

	table.insert(var_41_2, arg_41_0:GridCoordToPos(var_41_0) + var_0_17)

	for iter_41_0, iter_41_1 in ipairs(arg_41_1) do
		table.insert(var_41_2, arg_41_0:GridCoordToPos(iter_41_1) + var_0_17)
	end

	table.insert(var_41_2, arg_41_0:GridCoordToPos(var_41_1) + var_0_17)
	Dorm.LuaBridge.MiniGameBridge.ShowConnectLine(var_41_2, 0.3)
	arg_41_0.itemGenDistribution:Return(arg_41_4.itemID, 2)
	manager.notify:Invoke(LIANLIANKAN_ITEM_MATCH, arg_41_4.itemID)
	Dorm.DormEntityManager.PlayEffectDetached(arg_41_2, "gua_fx", var_0_1.itemRemove, 0.5)
	Dorm.DormEntityManager.PlayEffectDetached(arg_41_3, "gua_fx", var_0_1.itemRemove, 0.5)
	arg_41_0:PlaySoundEffect(var_0_3.ItemMatch)
	arg_41_0.itemEntityManager:Remove(arg_41_4.idx)
	arg_41_0.itemEntityManager:Remove(arg_41_5.idx)

	if arg_41_0.itemEntityManager.managedEntityNum == 0 then
		manager.notify:Invoke(LIANLIANKAN_GAME_CLEAR)
	elseif arg_41_0:Find() == nil then
		arg_41_0:Shuffle()
	else
		arg_41_0:SortItems()
	end
end

function var_0_0.ClearItemQueue(arg_42_0, arg_42_1)
	if arg_42_1 then
		arg_42_0:PrepareNextGenQueue()
	end

	if arg_42_0.previewEntityManager.managedEntityNum > 0 then
		Dorm.DormEntityManager.PlayEffectDetached(arg_42_0.chuansongdai, "gua_flush_fx", var_0_1.previewItemRemove, 1)
		arg_42_0:PlaySoundEffect(var_0_3.ItemPreviewClear)
	end

	arg_42_0.previewEntityManager:Clear()
end

local var_0_18 = {
	DormEnum.CharacterType.RestaurantCook,
	DormEnum.CharacterType.RestaurantCook,
	DormEnum.CharacterType.RestaurantWaiter
}

function var_0_0.GenItemOnStart(arg_43_0, arg_43_1)
	arg_43_0.itemGenDistribution = arg_43_0:PrepareGenDistribution(arg_43_1)

	arg_43_0:ClearItemQueue(true)
	arg_43_0.itemEntityManager:Clear()

	while arg_43_0.gridMap:HasGridEmpty(2) do
		local var_43_0 = arg_43_0.itemGenDistribution:Take(2)

		arg_43_0:Add2Item(var_43_0)
	end
end

function var_0_0.GenWorkerEntity(arg_44_0, arg_44_1)
	local var_44_0 = ActivityLinkGameCfg[arg_44_1]

	for iter_44_0, iter_44_1 in ipairs(var_0_18) do
		local var_44_1 = var_44_0.hero_id[iter_44_0]
		local var_44_2 = {
			complex = true,
			model = "CharDorm/" .. BackHomeHeroSkinCfg[var_44_1].model,
			type = iter_44_1,
			spawnAt = arg_44_0.workerIdx[iter_44_1] or 1
		}
		local var_44_3 = arg_44_0.workerEntityManager:Update(iter_44_0, var_44_2, {
			cfgID = var_44_1
		})
		local var_44_4 = LianLianKan.AI[iter_44_1]

		if var_44_4 then
			var_44_4.SetEntity(var_44_3, iter_44_0)
		end

		arg_44_0.workerIdx[iter_44_1] = var_44_2.spawnAt + 1
	end
end

function var_0_0.GenCustomerEntity(arg_45_0, arg_45_1)
	local var_45_0 = ActivityLinkGameCfg[arg_45_1]

	for iter_45_0, iter_45_1 in ipairs(var_45_0.customer_id) do
		local var_45_1 = DormEnum.CharacterType.RestaurantNormalCustomer
		local var_45_2 = arg_45_0.customerEntityManager:Update(iter_45_0, {
			complex = true,
			model = "CharDorm/" .. BackHomeHeroSkinCfg[iter_45_1].model,
			type = var_45_1,
			spawnAt = iter_45_0
		}, {
			cfgID = iter_45_1
		})

		LianLianKan.AI[var_45_1].SetEntity(var_45_2, iter_45_0)
	end
end

function var_0_0.PrepareGenDistribution(arg_46_0, arg_46_1)
	local var_46_0 = ActivityLinkGameCfg[arg_46_1]
	local var_46_1 = arg_46_0.gridMap.width * arg_46_0.gridMap.height

	return LianLianKanItemGen.New(var_46_1, var_46_0.food_weight)
end

function var_0_0.ForwardToAI(arg_47_0, ...)
	for iter_47_0, iter_47_1 in pairs(LianLianKan.AI) do
		local var_47_0 = nullable(iter_47_1, "events", arg_47_0)

		if var_47_0 then
			var_47_0(...)
		end
	end
end

function var_0_0.EnsureSolution(arg_48_0)
	for iter_48_0, iter_48_1 in pairs(arg_48_0.itemGenDistribution.weights) do
		local var_48_0 = {}

		for iter_48_2, iter_48_3 in Dorm.storage:ForeachData(arg_48_0.ItemEidNameSpace(iter_48_0), pairs) do
			table.insert(var_48_0, iter_48_3)
		end

		if #var_48_0 >= 2 then
			local var_48_1 = 1
			local var_48_2 = 2
			local var_48_3 = var_48_0[var_48_1]
			local var_48_4 = var_48_0[var_48_2]
			local var_48_5 = DormUtils.GetEntityData(var_48_3)
			local var_48_6 = DormUtils.GetEntityData(var_48_4)
			local var_48_7 = var_0_11(arg_48_0.gridMap, var_48_5.gridCoord, arg_48_0.turn)

			arg_48_0:SwapItemToPos(var_48_6, var_48_7)

			return
		end
	end
end

return var_0_0
