local function var_0_0(arg_1_0)
	local var_1_0 = BackHomeHeroSkinCfg[arg_1_0].hero_id

	return DormHeroTools:GetDormHeroNextCanUseSkin(var_1_0, arg_1_0)
end

local var_0_1 = "change_skin_end"
local var_0_2 = {}

var_0_2.fps = 30

local var_0_3 = 43 / var_0_2.fps
local var_0_4 = 1.18

var_0_2.duration = var_0_3
var_0_2.sequence = {
	[0] = function(arg_2_0)
		local var_2_0 = arg_2_0.nextSkin
		local var_2_1 = arg_2_0.entityID
		local var_2_2, var_2_3 = DormCharacterManager.GetInstance():Generate(var_2_0, true)

		arg_2_0.newCharaEID = var_2_2

		local var_2_4 = DormUtils.GetEntityData(var_2_1)

		Dorm.DormEntityManager.PutEntityAt(var_2_2, var_2_1, "root")

		local var_2_5 = nullable(var_2_4, "interactCtx", "exitPos")
		local var_2_6 = DormCharacterInteractBehaviour.MakeCtxForInternalAction(var_2_2, arg_2_0.targetID, var_0_1, {
			oldCharaEID = var_2_1,
			exitPos = var_2_5,
			startTime = nullable(arg_2_0.curActionTask, "taskDataCtx", "start")
		})

		DormUtils.SetEntityInteractContext(var_2_2, var_2_6)
		Dorm.DormEntityManager.TryExecuteInteractToEntityImmediate(var_2_2, arg_2_0.targetID)

		if var_2_5 then
			Dorm.DormEntityManager.SendMoveLookToDirCMD(var_2_2, var_2_5, true, true)
		end

		DormHeroAI:SwitchControl(var_2_1, DormEnum.ControlType.Player)
		Dorm.DormEntityManager.PlayAnimeDuringInteract(var_2_1, "dressingroom", "01", 0)
		Dorm.DormEntityManager.PlayAnimeDuringInteract(arg_2_0.targetID, "dressingroom", "01", 0)
	end,
	[var_0_4] = function(arg_3_0)
		local var_3_0 = arg_3_0.entityID

		Dorm.DormEntityManager.SetPlayerMainColliderEnabled(var_3_0, false)
	end,
	[var_0_3] = function(arg_4_0)
		if arg_4_0.newCharaEID then
			local var_4_0 = arg_4_0.entityID
			local var_4_1 = arg_4_0.newCharaEID

			arg_4_0.newCharaEID = nil

			Dorm.DormEntityManager.SetFadeCMD(var_4_0, 0)
			Dorm.DormEntityManager.SetFadeCMD(var_4_1, 1)
		end
	end
}

function var_0_2.onAbort(arg_5_0)
	DormUtils.CallOnNextUpdate(function()
		if arg_5_0.newCharaEID then
			DormCharacterManager.FindAndRemove(arg_5_0.newCharaEID)
		end
	end)
end

function var_0_2.onComplete(arg_7_0)
	DormUtils.CallOnNextUpdate(function()
		DormCharacterManager.FindAndRemove(arg_7_0.entityID)
	end)
end

local var_0_5 = {
	sequence = {
		[0] = function(arg_9_0)
			Dorm.DormEntityManager.PlayAnimeDuringInteract(arg_9_0.entityID, "dressingroom", "02", 0)
			Dorm.DormEntityManager.PlayAnimeDuringInteract(arg_9_0.targetID, "dressingroom", "02", 0)
		end
	}
}

var_0_5.duration = 3.467

local function var_0_6(arg_10_0)
	local var_10_0 = arg_10_0.entityCfg or DormUtils.GetEntityData(arg_10_0.entityID).cfgID
	local var_10_1 = var_0_0(var_10_0)

	if var_10_1 then
		arg_10_0.nextSkin = var_10_1
		arg_10_0.continuous = true

		return var_0_2
	else
		arg_10_0.continuous = false

		return var_0_5
	end
end

return function(arg_11_0)
	local var_11_0 = var_0_6(arg_11_0)

	return DormCharacterInteractBehaviour.MakeInteractTask(var_11_0, arg_11_0)
end
