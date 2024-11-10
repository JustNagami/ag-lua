local var_0_0 = class("EntityManager")
local var_0_1 = class("EntityManager.SpawnImpl")

function var_0_1.OnSpawn(arg_1_0, arg_1_1)
	return
end

function var_0_1.OnRemove(arg_2_0, arg_2_1)
	Dorm.DormEntityManager.Instance:RemoveEntity(arg_2_1)
end

local function var_0_2()
	return nil
end

local var_0_3 = class("EntityManager.CreateModel", var_0_1)

function var_0_3.Ctor(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
	arg_4_0.modelPathGetter = arg_4_1
	arg_4_0.spawnPosGetter = arg_4_2 or var_0_2
	arg_4_0.delay = arg_4_3 or 0
end

function var_0_3.OnSpawn(arg_5_0, arg_5_1)
	local var_5_0 = arg_5_0.modelPathGetter(arg_5_1)
	local var_5_1 = arg_5_0.spawnPosGetter(arg_5_1)

	return Dorm.DormEntityManager.Instance:SpawnEntity(var_5_0, var_5_1, arg_5_1.complex or false, arg_5_1.pooled or false)
end

function var_0_3.OnRemove(arg_6_0, arg_6_1, arg_6_2)
	if arg_6_0.delay == nil or arg_6_0.delay == 0 or arg_6_2 then
		Dorm.DormEntityManager.Instance:RemoveEntity(arg_6_1)
	else
		local var_6_0 = arg_6_0.delay

		if type(var_6_0) == "function" then
			var_6_0 = var_6_0()
		end

		Dorm.DormEntityManager.Instance:RemoveEntity(arg_6_1, var_6_0)
	end
end

var_0_0.CreateModel = var_0_3

local var_0_4 = class("EntityManager.CreatePlayer", var_0_1)

function var_0_4.Ctor(arg_7_0, arg_7_1, arg_7_2)
	arg_7_0.modelPathGetter = arg_7_1
	arg_7_0.spawnPosGetter = arg_7_2 or var_0_2
end

function var_0_4.OnSpawn(arg_8_0, arg_8_1)
	local var_8_0 = arg_8_0.modelPathGetter(arg_8_1)
	local var_8_1 = arg_8_0.spawnPosGetter(arg_8_1)

	return Dorm.DormEntityManager.Instance:SpawnPlayerEntity(var_8_0, var_8_1)
end

var_0_0.CreatePlayer = var_0_4

local var_0_5 = class("EntityManager.CreateFurniture", var_0_1)

function var_0_5.OnSpawn(arg_9_0, arg_9_1)
	local var_9_0 = arg_9_1.cfgID
	local var_9_1 = arg_9_1.state or 0
	local var_9_2 = nullable(BackHomeFurnitureSubtype, nullable(BackHomeFurnitureSubtype, "get_id_list_by_furniture_cfg", var_9_0, var_9_1)) or BackHomeFurniture[var_9_0]
	local var_9_3 = var_9_1 ~= 0 and var_9_2.tile_size or var_9_2.title
	local var_9_4 = DormLuaBridge.GenerateFurniture(var_9_0, var_9_1, var_9_2.model, var_9_3[1], var_9_3[2], var_9_3[3], var_9_2.sub_type ~= 0)

	if var_9_2.display_type ~= 0 then
		DormLuaBridge.SnapWallMountFurniture(var_9_4)
	end

	return var_9_4
end

function var_0_5.OnRemove(arg_10_0, arg_10_1)
	local var_10_0 = DormUtils.GetEntityData(arg_10_1)
	local var_10_1 = false

	if var_10_0 then
		var_10_1 = var_10_0.noOccupy or false
	end

	DormLuaBridge.RemoveFurniture(arg_10_1, not var_10_1)
end

var_0_0.CreateFurniture = var_0_5

local var_0_6 = class("EntityManager.AttachToModel", var_0_1)

function var_0_6.Ctor(arg_11_0, arg_11_1)
	arg_11_0.attachRootGetter = arg_11_1
end

function var_0_6.OnSpawn(arg_12_0, arg_12_1)
	local var_12_0 = arg_12_0.attachRootGetter(arg_12_1)

	return Dorm.DormEntityManager.Instance:MakeModelEntity(var_12_0)
end

var_0_0.AttachToModel = var_0_6
var_0_0.all = {}

setmetatable(var_0_0.all, {
	__mode = "v"
})

function var_0_0.Ctor(arg_13_0, arg_13_1, arg_13_2)
	arg_13_0.managedEntityNum = 0
	arg_13_0.managed = {}
	arg_13_0.reverseQuery = {}
	arg_13_0.spawnImpl = arg_13_1
	arg_13_0.dataCtor = arg_13_2

	table.insert(var_0_0.all, arg_13_0)
end

function var_0_0.Create(arg_14_0, arg_14_1, arg_14_2, arg_14_3)
	local var_14_0 = arg_14_0.spawnImpl:OnSpawn(arg_14_2)

	arg_14_0.managed[arg_14_1] = var_14_0
	arg_14_0.reverseQuery[var_14_0] = arg_14_1
	arg_14_0.managedEntityNum = arg_14_0.managedEntityNum + 1
	arg_14_3 = arg_14_0:RecordNewEntityData(arg_14_1, var_14_0, arg_14_3 or arg_14_2)

	if arg_14_0.OnCreate then
		arg_14_0.OnCreate(arg_14_1, var_14_0, arg_14_2, arg_14_3)
	end

	return var_14_0
end

function var_0_0.Reload(arg_15_0, arg_15_1, arg_15_2, arg_15_3)
	local var_15_0 = arg_15_0.reverseQuery[arg_15_2]

	if var_15_0 == nil then
		arg_15_0.managedEntityNum = arg_15_0.managedEntityNum + 1
	else
		arg_15_1 = var_15_0
	end

	arg_15_0.managed[arg_15_1] = arg_15_2
	arg_15_0.reverseQuery[arg_15_2] = arg_15_1

	arg_15_0:RecordNewEntityData(arg_15_1, arg_15_2, arg_15_3)
end

function var_0_0.Remove(arg_16_0, arg_16_1)
	local var_16_0 = arg_16_0.managed[arg_16_1]

	if var_16_0 then
		if arg_16_0.OnRemove then
			arg_16_0.OnRemove(arg_16_1, var_16_0)
		end

		arg_16_0.spawnImpl:OnRemove(var_16_0)
		arg_16_0:RemoveEntityData(var_16_0)

		arg_16_0.managed[arg_16_1] = nil
		arg_16_0.reverseQuery[var_16_0] = nil
		arg_16_0.managedEntityNum = arg_16_0.managedEntityNum - 1
	end

	return var_16_0
end

function var_0_0.Update(arg_17_0, arg_17_1, arg_17_2, arg_17_3)
	local var_17_0 = arg_17_0.managed[arg_17_1]
	local var_17_1

	if var_17_0 then
		arg_17_0:Remove(arg_17_1)
	end

	if arg_17_2 then
		var_17_1 = arg_17_0:Create(arg_17_1, arg_17_2, arg_17_3)
	end

	return var_17_1, var_17_0
end

function var_0_0.GetEntityID(arg_18_0, arg_18_1)
	return arg_18_0.managed[arg_18_1]
end

function var_0_0.Find(arg_19_0, arg_19_1)
	return arg_19_0.reverseQuery[arg_19_1]
end

function var_0_0.Clear(arg_20_0, arg_20_1)
	for iter_20_0, iter_20_1 in pairs(arg_20_0.managed) do
		if arg_20_0.OnRemove then
			arg_20_0.OnRemove(iter_20_0, iter_20_1)
		end

		arg_20_0:RemoveEntityData(iter_20_1)
		arg_20_0.spawnImpl:OnRemove(iter_20_1, arg_20_1)

		arg_20_0.managed[iter_20_0] = nil
		arg_20_0.reverseQuery[iter_20_1] = nil
	end

	arg_20_0.managedEntityNum = 0
end

function var_0_0.EntityNum(arg_21_0)
	return arg_21_0.managedEntityNum
end

function var_0_0.RecordNewEntityData(arg_22_0, arg_22_1, arg_22_2, arg_22_3)
	local var_22_0 = DormEnum.Namespace.EntityData

	if arg_22_0.dataCtor then
		arg_22_3 = arg_22_0.dataCtor(arg_22_1, arg_22_2, arg_22_3)
	end

	Dorm.storage:RecordData(var_22_0, arg_22_2, arg_22_3 or {})

	return arg_22_3
end

function var_0_0.RemoveAllEntityData(arg_23_0)
	for iter_23_0, iter_23_1 in pairs(arg_23_0.managed) do
		arg_23_0:RemoveEntityData(iter_23_1)
	end
end

function var_0_0.RemoveEntityData(arg_24_0, arg_24_1)
	local var_24_0 = DormEnum.Namespace.EntityData

	Dorm.storage:RecordData(var_24_0, arg_24_1, nil)
end

function var_0_0.MapToDormStorageData(arg_25_0, arg_25_1, arg_25_2)
	if arg_25_1 then
		Dorm.storage:MapToData(arg_25_1, arg_25_0.managed)
	end

	if arg_25_2 then
		Dorm.storage:MapToData(arg_25_2, arg_25_0.reverseQuery)
	end
end

function var_0_0.FindAndRemoveEntity(arg_26_0, arg_26_1)
	for iter_26_0, iter_26_1 in pairs(arg_26_0) do
		local var_26_0 = iter_26_1:Find(arg_26_1)

		if var_26_0 then
			return iter_26_1:Remove(var_26_0)
		end
	end
end

function var_0_0.ValidateEntity(arg_27_0, arg_27_1)
	for iter_27_0, iter_27_1 in pairs(arg_27_0) do
		local var_27_0 = iter_27_1:Find(arg_27_1)

		if var_27_0 then
			return var_27_0, iter_27_1
		end
	end
end

return var_0_0
