local var_0_0 = {
	EIdNamespace = function(arg_1_0)
		return "entity." .. arg_1_0 .. ".eid"
	end,
	IdxNamespace = function(arg_2_0)
		return "entity." .. arg_2_0 .. ".idx"
	end,
	GetEntityData = function(arg_3_0)
		return Dorm.storage:GetData(DormEnum.Namespace.EntityData, arg_3_0)
	end,
	EnumerateInteractEntities = function(arg_4_0)
		return pairs(nullable(DormUtils.GetEntityData(arg_4_0), "interactEntities") or {})
	end,
	CallOnNextUpdate = function(arg_5_0)
		DormCharacterActionManager.taskRunner:NewTimer(arg_5_0, 0):Start()
	end,
	MapSceneItemTagInfo = function()
		for iter_6_0, iter_6_1 in pairs(Dorm.sceneItemInfo) do
			Dorm.storage:MapToData(iter_6_0, iter_6_1)
		end
	end
}

function var_0_0.SetEntityInteractContext(arg_7_0, arg_7_1)
	local var_7_0 = var_0_0.GetEntityData(arg_7_0)

	if var_7_0 then
		var_7_0.interactCtx = arg_7_1
	else
		Debug.LogError(string.format("SetEntityInteractContext(%d) data is nil", arg_7_0))
	end
end

local function var_0_1(arg_8_0, arg_8_1, arg_8_2)
	local var_8_0

	if arg_8_2 then
		var_8_0 = arg_8_0.Length - arg_8_1
	else
		var_8_0 = arg_8_1 - 1
	end

	return arg_8_0[var_8_0]
end

function var_0_0.MoveByPath(arg_9_0, arg_9_1, arg_9_2, arg_9_3)
	local var_9_0 = 1

	if arg_9_2 then
		Dorm.DormEntityManager.PutEntityAt(arg_9_0, var_0_1(arg_9_1, var_9_0, arg_9_3))

		var_9_0 = 2
	end

	for iter_9_0 = var_9_0, arg_9_1.Length do
		Dorm.DormEntityManager.SendMoveCMD(arg_9_0, var_0_1(arg_9_1, iter_9_0, arg_9_3), true, true)
	end
end

local var_0_2 = {
	DormEnum.SpecialVfx.Hungry,
	DormEnum.SpecialVfx.Tired
}
local var_0_3 = {
	[DormEnum.SpecialVfx.Hungry] = {
		attachPoint = "gua_Hp",
		duration = -1,
		path = "Dorm/Effect/houzhai/fx_HZ04_hungry"
	},
	[DormEnum.SpecialVfx.Tired] = {
		attachPoint = "root",
		duration = -1,
		path = "Dorm/Effect/houzhai/fx_nengliang"
	}
}
local var_0_4 = DormEnum.Namespace.HeroShowSpecialVfx
local var_0_5 = {
	[DormEnum.SpecialVfx.Hungry] = function(arg_10_0)
		return not DormVisitTools:CheckCurIsVisitRoom() and DormHeroTools:CheckFeedTime(arg_10_0) and not DormHeroTools:CheckDormFatigueLevel(arg_10_0)
	end,
	[DormEnum.SpecialVfx.Tired] = function(arg_11_0)
		return not DormVisitTools:CheckCurIsVisitRoom() and not DormHeroTools:CheckCanteenFatigueLevel(arg_11_0)
	end
}

local function var_0_6(arg_12_0)
	local var_12_0 = var_0_0.GetEntityData(arg_12_0)
	local var_12_1 = var_12_0.cfgID
	local var_12_2 = var_12_0.heroID

	if var_12_2 == nil then
		return
	end

	local var_12_3 = Dorm.storage:GetData(var_0_4, var_12_2)

	if var_12_3 == nil then
		var_12_3 = {
			vfxStatus = {}
		}

		if Dorm.charaVfxActiveType then
			for iter_12_0, iter_12_1 in ipairs(Dorm.charaVfxActiveType) do
				local var_12_4 = var_0_5[iter_12_1]

				var_12_3.vfxStatus[iter_12_1] = var_12_4 and var_12_4(var_12_2)
			end
		end

		Dorm.storage:RecordData(var_0_4, var_12_2, var_12_3)
	end

	return var_12_3
end

local var_0_7 = "status"

function var_0_0.ShowCharaSpecialVfx(arg_13_0, arg_13_1)
	if arg_13_1 == nil then
		return
	end

	if next(arg_13_1) then
		local var_13_0 = var_0_6(arg_13_0)

		if var_13_0.hideVfx then
			var_13_0.hideVfx = var_13_0.hideVfx - 1

			if var_13_0.hideVfx == 0 then
				var_13_0.hideVfx = nil
			end
		end

		for iter_13_0, iter_13_1 in ipairs(arg_13_1) do
			local var_13_1 = var_0_3[iter_13_1]

			if var_13_1 and var_13_0.vfxStatus[iter_13_1] and not var_13_0.hideVfx then
				Dorm.DormEntityManager.PlayEffect(arg_13_0, var_13_1.attachPoint, var_0_7, var_13_1.path, var_13_1.duration)

				return
			end
		end
	end
end

function var_0_0.ResetCharaSpecialVfx(arg_14_0)
	local var_14_0 = var_0_6(arg_14_0)

	if nullable(var_14_0, "hideVfx") then
		var_14_0.hideVfx = nil

		var_0_0.ShowCharaSpecialVfx(arg_14_0, Dorm.charaVfxActiveType)
	end
end

function var_0_0.HideCharaSpecialVfx(arg_15_0)
	local var_15_0 = var_0_6(arg_15_0)

	if var_15_0 then
		var_15_0.hideVfx = (var_15_0.hideVfx or 0) + 1
	end

	Dorm.DormEntityManager.ClearAllEffect(arg_15_0, var_0_7)
end

function var_0_0.ClearCharaHasSpecialVfx(arg_16_0)
	local var_16_0 = var_0_6(arg_16_0).vfxStatus

	if var_16_0 then
		for iter_16_0, iter_16_1 in ipairs(var_0_2) do
			var_16_0[iter_16_1] = false
		end
	end
end

function var_0_0.ClearSingleSpecialVfx(arg_17_0, arg_17_1)
	local var_17_0 = var_0_6(arg_17_0).vfxStatus

	if var_17_0 then
		for iter_17_0, iter_17_1 in ipairs(var_0_2) do
			if iter_17_1 == arg_17_1 then
				var_17_0[iter_17_1] = false
			end
		end
	end
end

function var_0_0.CharaVfxEnabled()
	return Dorm.charaVfxActiveType and next(Dorm.charaVfxActiveType)
end

return var_0_0
