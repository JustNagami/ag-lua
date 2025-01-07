local var_0_0 = singletonClass("CanteenCharacterManager")

local function var_0_1(arg_1_0)
	return function(arg_2_0)
		return "CharDorm/" .. nullable(arg_1_0, nullable(arg_2_0, "heroID"), "model")
	end
end

local function var_0_2(arg_3_0)
	return function(arg_4_0)
		local var_4_0 = CanteenData:GetCanteenVisitor()

		if #var_4_0 > 0 then
			local var_4_1 = math.random(1, #var_4_0)

			CanteenData:SetVisitedHero(var_4_0[var_4_1])

			return "CharDorm/" .. nullable(BackHomeHeroSkinCfg, var_4_0[var_4_1], "model")
		else
			return "CharDorm/" .. nullable(arg_3_0, nullable(arg_4_0, "heroID"), "model")
		end
	end
end

local var_0_3 = var_0_1(BackHomeHeroSkinCfg)
local var_0_4 = var_0_1(BackHomeNpcCfg)
local var_0_5 = var_0_2(BackHomeCustomerCfg)

local function var_0_6(arg_5_0)
	local var_5_0 = CanteenManager.PosNamespace(arg_5_0.jobID)
	local var_5_1 = arg_5_0.jobCharaIndex or 1
	local var_5_2 = Dorm.storage:GetData(var_5_0, var_5_1) or Dorm.storage:PickData(var_5_0)

	return nullable(var_5_2, "transform")
end

local var_0_7 = 1.25
local var_0_8 = {
	[DormEnum.CharacterType.RestaurantCook] = DORM_RESTAURANT_NEW_COOK,
	[DormEnum.CharacterType.RestaurantWaiter] = DORM_RESTAURANT_NEW_WAITER,
	[DormEnum.CharacterType.RestaurantCashier] = DORM_RESTAURANT_NEW_CASHIER,
	[DormEnum.CharacterType.RestaurantNormalCustomer] = DORM_RESTAURANT_NEW_CUSTOMER
}

function var_0_0.Ctor(arg_6_0)
	local var_6_0 = EntityManager.CreateModel.New(function(arg_7_0)
		if arg_7_0.isNpc then
			return var_0_4(arg_7_0)
		else
			return var_0_3(arg_7_0)
		end
	end, var_0_6)
	local var_6_1 = EntityManager.CreateModel.New(var_0_5, var_0_6)

	arg_6_0.workingCharaManagers = {}

	for iter_6_0, iter_6_1 in pairs(DormEnum.CharacterType) do
		local var_6_2 = var_6_0

		if iter_6_0 == DormEnum.CharacterType.RestaurantNormalCustomer then
			var_6_2 = var_6_1
		end

		local var_6_3 = EntityManager.New(var_6_2)

		function var_6_3.OnCreate(arg_8_0, arg_8_1, arg_8_2)
			Dorm.DormEntityManager.StartFadeInCMD(arg_8_1, var_0_7, function()
				if iter_6_0 ~= DormEnum.CharacterType.RestaurantNormalCustomer then
					DormUtils.ShowCharaSpecialVfx(arg_8_1, Dorm.charaVfxActiveType)
				end
			end)
			arg_6_0:RecordEntityInfo(arg_8_1, arg_8_2)
			manager.notify:Invoke(var_0_8[iter_6_0], arg_8_1)
		end

		function var_6_3.OnRemove(arg_10_0, arg_10_1)
			arg_6_0:RemoveEntityInfo(arg_10_1)
			manager.notify:Invoke(DORM_CHARACTER_DISPOSE, arg_10_1, iter_6_0)
		end

		arg_6_0.workingCharaManagers[iter_6_0] = var_6_3
	end

	arg_6_0.listener = EventListener.New()
	arg_6_0.nextCustomerIdx = 1
end

function var_0_0.RegisterEvents(arg_11_0)
	local var_11_0 = {
		[DORM_RESTAURANT_START_INIT] = handler(arg_11_0, arg_11_0.Init),
		[DORM_RESTAURANT_UPDATE_CHARACTER_BY_TYPE] = handler(arg_11_0, arg_11_0.UpdateJobCharacter)
	}

	for iter_11_0, iter_11_1 in pairs(var_11_0) do
		arg_11_0.listener:Register(iter_11_0, iter_11_1)
	end
end

function var_0_0.RemoveEvents(arg_12_0)
	arg_12_0.listener:RemoveAll()
end

function var_0_0.CheckFoodEnoughGenCustomer()
	local var_13_0 = 0

	for iter_13_0, iter_13_1 in pairs(CanteenManager.CalcCanOrderFoodList()) do
		var_13_0 = var_13_0 + 1
	end

	local var_13_1

	if CanteenAIFunction:GetCurCanteenMode() == DormEnum.RestaurantMode.RestaurantManual then
		var_13_1 = DormConst.ORDER_FOOD_NUM
	else
		var_13_1 = DormConst.ORDER_FOOD_AUTO_NUM
	end

	return var_13_1 <= var_13_0
end

local function var_0_9(arg_14_0)
	return arg_14_0 > CanteenManager.GetInstance():GetCustomerGroupCount() and var_0_0.CheckFoodEnoughGenCustomer()
end

local var_0_10

local function var_0_11()
	local var_15_0 = CanteenManager.GetInstance():GetCurPopularity()

	if var_0_10 == nil then
		local var_15_1 = {}
		local var_15_2 = GameSetting.dorm_canteen_customer_time.value
		local var_15_3

		for iter_15_0 = #var_15_2, 1, -1 do
			local var_15_4 = var_15_2[iter_15_0][1]

			table.insert(var_15_1, {
				l = var_15_4,
				r = var_15_3,
				cd = var_15_2[iter_15_0][2]
			})

			var_15_3 = var_15_4
		end

		var_0_10 = var_15_1
	end

	for iter_15_1, iter_15_2 in ipairs(var_0_10) do
		if var_15_0 >= iter_15_2.l and (iter_15_2.r == nil or var_15_0 < iter_15_2.r) then
			return iter_15_2.cd
		end
	end

	error(string.format("人气值%d不在有效区间内，无法找到对应的客人生成间隔时间信息"))
end

function var_0_0.StartGenCustomerTask(arg_16_0, arg_16_1)
	if arg_16_0.genCustomerTask then
		arg_16_0:StopGenCustomerTask()
	end

	local var_16_0 = DormCharacterActionManager.taskRunner

	arg_16_0.genCustomerTask = var_16_0:NewTask():WaitUntil(function(arg_17_0)
		local var_17_0 = arg_17_0.timer
		local var_17_1 = not var_17_0 or not var_17_0:IsRunning()
		local var_17_2 = arg_16_1()

		if CanteenTools:AutoModeReadyForBusiness() and var_17_1 and var_0_9(var_17_2) then
			arg_17_0.timer = var_16_0:NewTimer(nil, var_0_11(), false, false)

			arg_17_0.timer:Start()
			arg_16_0:GenCustomer()
		end

		return false
	end, {})

	arg_16_0.genCustomerTask:Start()
end

function var_0_0.StopGenCustomerTask(arg_18_0)
	if arg_18_0.genCustomerTask then
		arg_18_0.genCustomerTask:Abort()

		arg_18_0.genCustomerTask = nil
	end
end

local function var_0_12()
	local var_19_0 = {}
	local var_19_1 = {}

	for iter_19_0, iter_19_1 in pairs(BackHomeCustomerCfg.all) do
		local var_19_2 = BackHomeCustomerCfg[iter_19_1]

		if next(var_19_2.food_list) then
			for iter_19_2, iter_19_3 in pairs(var_19_2.food_list) do
				var_19_0[iter_19_3] = var_19_0[iter_19_3] or {}

				table.insert(var_19_0[iter_19_3], iter_19_1)
			end
		else
			table.insert(var_19_1, iter_19_1)
		end
	end

	return var_19_0, var_19_1
end

local function var_0_13(arg_20_0)
	local var_20_0 = 0
	local var_20_1 = {}

	for iter_20_0, iter_20_1 in pairs(arg_20_0) do
		local var_20_2 = BackHomeCustomerCfg[iter_20_1].weight

		var_20_0 = var_20_0 + var_20_2
		var_20_1[iter_20_1] = var_20_2
	end

	local var_20_3 = math.random(1, var_20_0)
	local var_20_4

	for iter_20_2, iter_20_3 in pairs(var_20_1) do
		if var_20_3 > 0 then
			var_20_3 = var_20_3 - iter_20_3
			var_20_4 = iter_20_2
		else
			break
		end
	end

	return var_20_4
end

local function var_0_14(arg_21_0, arg_21_1)
	local var_21_0 = CanteenManager.CalcCanOrderFoodList()
	local var_21_1 = {}
	local var_21_2, var_21_3 = var_0_12()

	while arg_21_1 > #var_21_1 do
		if arg_21_0 <= #var_21_1 and next(var_21_0) == nil and math.random() >= 0.5 then
			break
		end

		local var_21_4
		local var_21_5 = {}

		for iter_21_0, iter_21_1 in pairs(var_21_0) do
			table.insert(var_21_5, iter_21_0)
		end

		if next(var_21_5) then
			var_21_4 = var_21_2[var_21_5[math.random(#var_21_5)]]

			if var_21_4 == nil or next(var_21_4) == nil or #var_21_1 == arg_21_1 - 1 and #var_21_5 > 1 then
				var_21_4 = var_21_3
				var_21_0 = {}
			end
		else
			var_21_4 = BackHomeCustomerCfg.all
		end

		local var_21_6 = var_0_13(var_21_4)

		table.insert(var_21_1, var_21_6)

		for iter_21_2, iter_21_3 in pairs(BackHomeCustomerCfg[var_21_6].food_list) do
			var_21_0[iter_21_3] = nil
		end
	end

	return var_21_1
end

function var_0_0.GenCustomer(arg_22_0)
	local var_22_0 = DormEnum.CharacterType.RestaurantNormalCustomer
	local var_22_1 = CanteenManager.ArrangeDinningTableForCustomer()
	local var_22_2 = CanteenAIFunction:GetEntityData(var_22_1)
	local var_22_3 = var_22_2.group
	local var_22_4 = CanteenItemManager.GetItemsInItemGroup(DormEnum.ItemType.DinningChair, var_22_3)
	local var_22_5 = var_0_14(1, #var_22_4)
	local var_22_6 = #var_22_5
	local var_22_7 = math.random(1, var_22_6)
	local var_22_8 = {}

	for iter_22_0 = 1, var_22_6 do
		local var_22_9 = math.random(1, #var_22_4)

		var_22_4[var_22_9], var_22_4[#var_22_4] = var_22_4[#var_22_4], var_22_4[var_22_9]

		local var_22_10 = table.remove(var_22_4)
		local var_22_11 = {
			cfgID = var_22_5[iter_22_0],
			tableEid = var_22_1,
			chairEid = var_22_10,
			pay = iter_22_0 == var_22_7
		}
		local var_22_12 = arg_22_0:GenerateCharacterEntity(var_22_0, arg_22_0.nextCustomerIdx, {
			complex = true,
			heroID = var_22_5[iter_22_0],
			jobID = var_22_0,
			jobCharaIndex = iter_22_0
		}, var_22_11)

		table.insert(var_22_8, var_22_12)

		arg_22_0.nextCustomerIdx = arg_22_0.nextCustomerIdx + 1

		if CanteenData:GetCanteenState() == DormEnum.RestaurantMode.RestaurantManual then
			CanteenManualData:RecordManualGenCustomerNum(1)
		end
	end

	for iter_22_1, iter_22_2 in ipairs(var_22_8) do
		arg_22_0.GetEntityData(iter_22_2).peer = var_22_8
	end

	var_22_2.booked = var_22_8

	CanteenManager.GetInstance():OnCustomerCome()
end

local var_0_15 = DormEnum.RestaurantJobToClientMap

var_0_0.EIdNamespace = DormUtils.EIdNamespace
var_0_0.IdxNamespace = DormUtils.IdxNamespace

function var_0_0.Init(arg_23_0)
	arg_23_0:RegisterEvents()

	for iter_23_0, iter_23_1 in pairs(arg_23_0.workingCharaManagers) do
		iter_23_1:Clear()
		iter_23_1:MapToDormStorageData(var_0_0.EIdNamespace(iter_23_0), var_0_0.IdxNamespace(iter_23_0))
	end

	arg_23_0:GenerateJobCharacter(var_0_15)
end

function var_0_0.UpdateJobCharacter(arg_24_0, arg_24_1)
	local var_24_0 = arg_24_0.workingCharaManagers[arg_24_1]

	if var_24_0 then
		var_24_0:Clear()
		arg_24_0:GenerateJobCharacter({
			arg_24_1
		})
	end
end

function var_0_0.GenerateJobCharacter(arg_25_0, arg_25_1)
	local var_25_0 = CanteenHeroTools:GetCanteenJobList()

	for iter_25_0, iter_25_1 in pairs(arg_25_1) do
		local var_25_1 = var_25_0[DormEnum.RestaurantJobToServerMap[iter_25_1]]
		local var_25_2 = var_25_1.heroID
		local var_25_3 = var_25_1.skinID

		if var_25_3 then
			local var_25_4 = nullable(BackHomeNpcCfg, var_25_2)
			local var_25_5 = {
				complex = true,
				isNpc = var_25_4,
				heroID = var_25_3,
				jobID = iter_25_1
			}
			local var_25_6 = arg_25_0:GenerateCharacterEntity(iter_25_1, 1, var_25_5, {
				cfgID = var_25_3,
				heroID = var_25_2
			})
			local var_25_7 = var_25_4 and BackHomeNpcCfg or BackHomeHeroCfg

			Dorm.DormEntityManager.SetEntitySpeed(var_25_6, var_25_7[var_25_2].speed)
		end
	end
end

function var_0_0.GenerateCharacterEntity(arg_26_0, arg_26_1, arg_26_2, arg_26_3, arg_26_4)
	local var_26_0 = arg_26_0.workingCharaManagers[arg_26_1]

	arg_26_4 = arg_26_4 or {}

	local var_26_1 = var_26_0:Create(arg_26_2, arg_26_3, arg_26_4)
	local var_26_2 = true

	arg_26_4.eid = var_26_1

	return var_26_1, var_26_2
end

function var_0_0.RecordEntityInfo(arg_27_0, arg_27_1, arg_27_2)
	local var_27_0 = Dorm.storage
	local var_27_1 = DormEnum.Namespace.EntityType

	var_27_0:RecordData(var_27_1, arg_27_1, nullable(arg_27_2, "jobID"))
end

function var_0_0.RemoveEntityInfo(arg_28_0, arg_28_1)
	local var_28_0 = Dorm.storage
	local var_28_1 = DormEnum.Namespace.EntityType

	var_28_0:RecordData(var_28_1, arg_28_1, nil)
end

function var_0_0.Reset(arg_29_0)
	arg_29_0:RemoveEvents()
	arg_29_0:StopGenCustomerTask()

	for iter_29_0, iter_29_1 in pairs(arg_29_0.workingCharaManagers) do
		iter_29_1:Clear()
	end
end

function var_0_0.GetCharacterCount(arg_30_0, arg_30_1)
	return arg_30_0.workingCharaManagers[arg_30_1]:EntityNum()
end

function var_0_0.FindAndRemoveEntity(arg_31_0)
	local var_31_0 = var_0_0.GetInstance()

	EntityManager.FindAndRemoveEntity(var_31_0.workingCharaManagers, arg_31_0)
end

function var_0_0.GetEntityData(arg_32_0)
	return Dorm.storage:GetData(DormEnum.Namespace.EntityData, arg_32_0)
end

return var_0_0
