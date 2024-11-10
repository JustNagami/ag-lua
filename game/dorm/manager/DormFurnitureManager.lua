local var_0_0 = singletonClass("DormFurnitureManager")

var_0_0.FurnitureState = {
	Placed = 1,
	Editing = 2,
	Hanging = 0
}

local var_0_1 = 0

function var_0_0.Ctor(arg_1_0)
	arg_1_0.listener = EventListener.New()

	local var_1_0 = EntityManager.CreateFurniture.New()

	arg_1_0.entityManager = EntityManager.New(var_1_0, var_0_0.dataCtor)
	arg_1_0.nextIdx = var_0_1
end

function var_0_0.Init(arg_2_0)
	arg_2_0:RegisterEvent()
end

function var_0_0.Reset(arg_3_0)
	arg_3_0:RemoveEvent()
end

function var_0_0.RegisterEvent(arg_4_0)
	return
end

function var_0_0.RemoveEvent(arg_5_0)
	arg_5_0.listener:RemoveAll()
end

function var_0_0.OnBeginStory(arg_6_0, arg_6_1)
	if DormEnum.HasFlag(arg_6_1, DormEnum.BeginStoryFlag.HideFurniture) then
		arg_6_0:Clear()
	end
end

function var_0_0.OnFinishStory(arg_7_0, arg_7_1)
	if DormEnum.HasFlag(arg_7_1, DormEnum.BeginStoryFlag.HideFurniture) then
		DormFurnitureTools:GenerateFurnitureWhenEnterScene()
	end
end

function var_0_0.Generate(arg_8_0, arg_8_1, arg_8_2)
	local var_8_0 = arg_8_0.entityManager:Update(arg_8_0.nextIdx, {
		cfgID = arg_8_1,
		state = arg_8_2 or 0
	})

	arg_8_0.nextIdx = arg_8_0.nextIdx + 1

	return var_8_0
end

function var_0_0.Remove(arg_9_0, arg_9_1)
	arg_9_0.entityManager:Remove(arg_9_1)
end

function var_0_0.Clear(arg_10_0)
	arg_10_0.entityManager:Clear()
	DormLuaBridge.ClearFurnitureOccupy()
	DormLuaBridge.UpdateAllWallMountDitherAlphaControl()

	arg_10_0.nextIdx = var_0_1

	DormLuaBridge.ClearAllSuitEntity()
end

function var_0_0.dataCtor(arg_11_0, arg_11_1, arg_11_2)
	arg_11_2 = arg_11_2 or {}
	arg_11_2.interactEntities = {}

	return arg_11_2
end

local function var_0_2(arg_12_0, arg_12_1)
	arg_12_1 = arg_12_1 + 1

	if arg_12_1 < arg_12_0.Length then
		return arg_12_1, arg_12_0[arg_12_1]
	end
end

function var_0_0.ClearAndGenByFurList(arg_13_0, arg_13_1, arg_13_2, arg_13_3)
	arg_13_0:Clear()

	if arg_13_1 then
		if not arg_13_2 then
			DormLuaBridge.SyncRoomFurniture(arg_13_1)
		end

		for iter_13_0, iter_13_1 in var_0_2, arg_13_1, -1 do
			local var_13_0 = iter_13_1.id
			local var_13_1 = arg_13_0.entityManager:Create(iter_13_0, {
				cfgID = var_13_0,
				state = iter_13_1.state or 0
			})

			if arg_13_2 then
				local var_13_2 = iter_13_1.tileType
				local var_13_3 = iter_13_1.pos
				local var_13_4 = iter_13_1.rotation

				DormLuaBridge.SetFurniturePosition(var_13_1, var_13_2, var_13_3, var_13_4)
				DormLuaBridge.RecoverRoomFurnitureOccupyByLua(var_13_1)
			else
				DormLuaBridge.RecoverRoomFurnitureOccupy(iter_13_0, var_13_1)
			end

			DormLuaBridge.ChangeFurnitureState(var_13_1, var_0_0.FurnitureState.Placed)
		end

		arg_13_0.nextIdx = arg_13_1.Length
	else
		arg_13_0.nextIdx = 0
	end

	if arg_13_3 then
		DormSuitTools:GenerateSuitInfoList(arg_13_3, true)
	end

	DormLuaBridge.UpdateAllWallMountDitherAlphaControl()
	DormLuaBridge.UpdateAllFurnitureInteractAreaEnabled()
	arg_13_0:RefreshAllFurnitureConnection()
end

function var_0_0.FindAndRemove(arg_14_0)
	local var_14_0 = var_0_0.GetInstance()

	EntityManager.FindAndRemoveEntity({
		var_14_0.entityManager
	}, arg_14_0)
end

function var_0_0.GetAllFurniture(arg_15_0)
	return arg_15_0.entityManager.managed
end

function var_0_0.RefreshAllFurnitureConnection(arg_16_0)
	arg_16_0.connectInfo = {}

	local var_16_0 = {}

	for iter_16_0, iter_16_1 in pairs(arg_16_0.entityManager.managed) do
		table.insert(var_16_0, iter_16_1)

		DormUtils.GetEntityData(iter_16_1).connect = {}
	end

	for iter_16_2 = 1, #var_16_0 do
		for iter_16_3 = iter_16_2 + 1, #var_16_0 do
			local var_16_1 = var_16_0[iter_16_2]
			local var_16_2 = var_16_0[iter_16_3]

			if DormLuaBridge.CheckFurnitureConnectReady(var_16_1, var_16_2) then
				table.insert(DormUtils.GetEntityData(var_16_1).connect, var_16_2)
				table.insert(DormUtils.GetEntityData(var_16_2).connect, var_16_1)
			end
		end
	end

	DormMultiFurnitureStructureManager.GetInstance():RefreshAllMultiFurnitureStructure(var_16_0)
end

function Dorm.FurnitureReloadData(arg_17_0, arg_17_1, arg_17_2)
	local var_17_0 = var_0_0.GetInstance()
	local var_17_1 = var_17_0.entityManager:Find(arg_17_0)

	if var_17_1 == nil then
		var_17_1 = var_17_0.nextIdx
		var_17_0.nextIdx = var_17_0.nextIdx + 1
	end

	var_17_0.entityManager:Reload(var_17_1, arg_17_0, {
		cfgID = arg_17_1,
		state = arg_17_2 or 0
	})
end

function Dorm.TestRefreshFurnitureConnection()
	var_0_0.GetInstance():RefreshAllFurnitureConnection()
end

return var_0_0
