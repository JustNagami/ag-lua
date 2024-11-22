local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = 0

	for iter_1_0, iter_1_1 in ipairs(arg_1_1) do
		var_1_0 = var_1_0 + iter_1_1
	end

	if var_1_0 > 0 then
		local var_1_1 = math.random() * var_1_0
		local var_1_2 = 1

		while var_1_1 > arg_1_1[var_1_2] do
			var_1_1 = var_1_1 - arg_1_1[var_1_2]
			var_1_2 = var_1_2 + 1
		end

		return arg_1_0[var_1_2], var_1_2
	end
end

local function var_0_1(arg_2_0)
	local var_2_0 = nullable(BackHomeHeroSkinVariantCfg, arg_2_0)

	if var_2_0 and math.random() <= var_2_0.chance then
		return var_0_0(var_2_0.asset_list, var_2_0.weight_list)
	end

	return nil
end

local function var_0_2(arg_3_0)
	local var_3_0 = BackHomeHeroSkinCfg[arg_3_0].hero_id
	local var_3_1 = DormHeroTools:GetDormHeroNextCanUseSkin(var_3_0, arg_3_0)

	return var_3_1, var_0_1(var_3_1)
end

local var_0_3 = "change_skin_end"
local var_0_4 = {}

var_0_4.fps = 30

local var_0_5 = 43 / var_0_4.fps
local var_0_6 = 1.18

var_0_4.duration = var_0_5
var_0_4.sequence = {
	[0] = function(arg_4_0)
		local var_4_0 = arg_4_0.nextSkin
		local var_4_1 = arg_4_0.entityID
		local var_4_2, var_4_3 = DormCharacterManager.GetInstance():Generate(var_4_0, true, {
			skinOverride = arg_4_0.nextSkinOverride
		}, {
			skinVariant = arg_4_0.nextSkinOverrideIdx
		})

		arg_4_0.newCharaEID = var_4_2

		local var_4_4 = DormUtils.GetEntityData(var_4_1)

		Dorm.DormEntityManager.PutEntityAt(var_4_2, var_4_1, "root")

		local var_4_5 = nullable(var_4_4, "interactCtx", "exitPos")
		local var_4_6 = DormCharacterInteractBehaviour.MakeCtxForInternalAction(var_4_2, arg_4_0.targetID, var_0_3, {
			oldCharaEID = var_4_1,
			exitPos = var_4_5,
			startTime = nullable(arg_4_0.curActionTask, "taskDataCtx", "start")
		})

		DormUtils.SetEntityInteractContext(var_4_2, var_4_6)
		Dorm.DormEntityManager.TryExecuteInteractToEntityImmediate(var_4_2, arg_4_0.targetID)

		if var_4_5 then
			Dorm.DormEntityManager.SendMoveLookToDirCMD(var_4_2, var_4_5, true, true)
		end

		DormHeroAI:SwitchControl(var_4_1, DormEnum.ControlType.Player)
		Dorm.DormEntityManager.PlayAnimeDuringInteract(var_4_1, "dressingroom", "01", 0)
		Dorm.DormEntityManager.PlayAnimeDuringInteract(arg_4_0.targetID, "dressingroom", "01", 0)
	end,
	[var_0_6] = function(arg_5_0)
		local var_5_0 = arg_5_0.entityID

		Dorm.DormEntityManager.SetPlayerMainColliderEnabled(var_5_0, false)
	end,
	[var_0_5] = function(arg_6_0)
		if arg_6_0.newCharaEID then
			local var_6_0 = arg_6_0.entityID
			local var_6_1 = arg_6_0.newCharaEID

			arg_6_0.newCharaEID = nil

			Dorm.DormEntityManager.SetFadeCMD(var_6_0, 0)
			Dorm.DormEntityManager.SetFadeCMD(var_6_1, 1)
		end
	end
}

function var_0_4.onAbort(arg_7_0)
	DormUtils.CallOnNextUpdate(function()
		if arg_7_0.newCharaEID then
			DormCharacterManager.FindAndRemove(arg_7_0.newCharaEID)
		end
	end)
end

function var_0_4.onComplete(arg_9_0)
	DormUtils.CallOnNextUpdate(function()
		DormCharacterManager.FindAndRemove(arg_9_0.entityID)
	end)
end

local var_0_7 = {
	sequence = {
		[0] = function(arg_11_0)
			Dorm.DormEntityManager.PlayAnimeDuringInteract(arg_11_0.entityID, "dressingroom", "02", 0)
			Dorm.DormEntityManager.PlayAnimeDuringInteract(arg_11_0.targetID, "dressingroom", "02", 0)
		end
	}
}

var_0_7.duration = 3.467

local function var_0_8(arg_12_0)
	local var_12_0 = arg_12_0.entityCfg or DormUtils.GetEntityData(arg_12_0.entityID).cfgID
	local var_12_1, var_12_2, var_12_3 = var_0_2(var_12_0)

	if var_12_1 then
		arg_12_0.nextSkin = var_12_1
		arg_12_0.nextSkinOverride = var_12_2
		arg_12_0.nextSkinOverrideIdx = var_12_3
		arg_12_0.continuous = true

		return var_0_4
	else
		arg_12_0.continuous = false

		return var_0_7
	end
end

return function(arg_13_0, arg_13_1)
	if arg_13_1 then
		return var_0_7
	end

	local var_13_0 = var_0_8(arg_13_0)

	return DormCharacterInteractBehaviour.MakeInteractTask(var_13_0, arg_13_0)
end
