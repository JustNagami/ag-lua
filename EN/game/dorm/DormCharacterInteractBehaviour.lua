local var_0_0 = {}
local var_0_1 = {
	AnyPeer = 2,
	Source = 0,
	Target = 1
}

local function var_0_2(arg_1_0, arg_1_1)
	if arg_1_0 == var_0_1.Source then
		return arg_1_1.entityID
	elseif arg_1_0 == var_0_1.Target then
		return arg_1_1.targetID
	elseif arg_1_1.peerIDs and #arg_1_1.peerIDs > 0 then
		return arg_1_1.peerIDs[math.random(#arg_1_1.peerIDs)]
	end

	return nil
end

local var_0_3 = {
	[0] = "music",
	"voice",
	"effect"
}
local var_0_4 = {
	play = function(arg_2_0, arg_2_1)
		Dorm.DormEntityManager.PlayAnimeDuringInteract(var_0_2(arg_2_0.entity, arg_2_1), arg_2_0.animeActionName, arg_2_0.animeActionSubName, arg_2_0.crossFade)
	end,
	putAt = function(arg_3_0, arg_3_1)
		Dorm.DormEntityManager.PutEntityAt(var_0_2(arg_3_0.entity, arg_3_1), var_0_2(arg_3_0.referenceTarget, arg_3_1), arg_3_0.referencePointName)
	end,
	attachTo = function(arg_4_0, arg_4_1)
		Dorm.DormEntityManager.AttachToEntityCMD(var_0_2(arg_4_0.itemEntity, arg_4_1), var_0_2(arg_4_0.attachTo, arg_4_1), arg_4_0.attachPoint)
	end,
	detachFrom = function(arg_5_0, arg_5_1)
		Dorm.DormEntityManager.DetachFromEntityCMD(var_0_2(arg_5_0.itemEntity, arg_5_1), arg_5_0.resetFacingDirection)
	end,
	grabPart = function(arg_6_0, arg_6_1)
		Dorm.DormEntityManager.GrabItemPartCMD(var_0_2(arg_6_0.grabBy, arg_6_1), var_0_2(arg_6_0.grabFrom, arg_6_1), arg_6_0.itemPartName, arg_6_0.attachPoint)
	end,
	restorePart = function(arg_7_0, arg_7_1)
		Dorm.DormEntityManager.RestoreItemPartCMD(var_0_2(arg_7_0.itemPartHost, arg_7_1), arg_7_0.itemPartName)
	end,
	setPartVisible = function(arg_8_0, arg_8_1)
		Dorm.DormEntityManager.SetPartVisible(var_0_2(arg_8_0.entity, arg_8_1), arg_8_0.itemPartName, arg_8_0.visible)
	end,
	changeScheme = function(arg_9_0, arg_9_1)
		Dorm.DormEntityManager.ChangeEntityAnimeScheme(var_0_2(arg_9_0.entity, arg_9_1), arg_9_0.scheme)
	end,
	setValue = function(arg_10_0, arg_10_1)
		local var_10_0 = var_0_2(arg_10_0.entity, arg_10_1)

		Dorm.storage:GetData(DormEnum.Namespace.EntityData, var_10_0)[arg_10_0.field] = arg_10_0.value
	end,
	setMobility = function(arg_11_0, arg_11_1)
		local var_11_0 = var_0_2(arg_11_0.entity, arg_11_1)

		Dorm.DormEntityManager.SetEntityMobility(var_11_0, arg_11_0.value)
	end,
	setMouth = function(arg_12_0, arg_12_1)
		local var_12_0 = var_0_2(arg_12_0.entity, arg_12_1)

		Dorm.DormEntityManager.SetFacialExpression(var_12_0, arg_12_0.value)
	end,
	restoreMouth = function(arg_13_0, arg_13_1)
		local var_13_0 = var_0_2(arg_13_0.entity, arg_13_1)

		Dorm.DormEntityManager.RestoreFacialExpression(var_13_0)
	end,
	setFace = function(arg_14_0, arg_14_1)
		local var_14_0 = var_0_2(arg_14_0.entity, arg_14_1)

		Dorm.DormEntityManager.PlayNormalFacileExpression(var_14_0, arg_14_0.faceEmoteState, arg_14_0.faceEmoteSubState, arg_14_0.crossFade)
	end,
	keepAsInteract = function(arg_15_0, arg_15_1)
		Dorm.DormEntityManager.KeepAsInteractNotEnd(var_0_2(arg_15_0.entity, arg_15_1), var_0_2(arg_15_0.target, arg_15_1), arg_15_0.value)
	end,
	setSpFace = function(arg_16_0, arg_16_1)
		local var_16_0 = var_0_2(arg_16_0.entity, arg_16_1)

		Dorm.DormEntityManager.PlaySpacialFacileExpression(var_16_0, arg_16_0.faceEfxPath, arg_16_0.duration)
	end,
	playEfx = function(arg_17_0, arg_17_1)
		local var_17_0 = var_0_2(arg_17_0.entity, arg_17_1)

		Dorm.DormEntityManager.PlayEffect(var_17_0, arg_17_0.attachPoint, arg_17_0.efxPath, arg_17_0.offset or Vector3.zero, arg_17_0.rotation or Quaternion.identity, arg_17_0.scale or Vector3.one, arg_17_0.duration)
	end,
	clearEfx = function(arg_18_0, arg_18_1)
		local var_18_0 = var_0_2(arg_18_0.entity, arg_18_1)

		Dorm.DormEntityManager.ClearInteractEffectOnAttachPoint(var_18_0, arg_18_0.attachPoint)
	end,
	playVoice = function(arg_19_0, arg_19_1)
		manager.audio:Play(var_0_3[arg_19_0.playerType], arg_19_0.sheet, arg_19_0.cue, arg_19_0.awb)
	end,
	stopVoice = function(arg_20_0, arg_20_1)
		manager.audio:Stop(var_0_3[arg_20_0.playerType])
	end,
	playSubtitle = function(arg_21_0, arg_21_1)
		local var_21_0 = var_0_2(arg_21_0.entity, arg_21_1)

		manager.notify:Invoke(DORM_CHARACTER_PLAY_SUBTITLE, var_21_0, arg_21_0.subtitleID)
	end
}

function var_0_0.DriveInteractSequenceNode(arg_22_0, arg_22_1)
	if type(arg_22_0) == "table" then
		for iter_22_0, iter_22_1 in ipairs(arg_22_0) do
			if type(iter_22_1) == "table" then
				local var_22_0 = iter_22_1.action
				local var_22_1 = var_0_4[var_22_0]

				if var_22_1 then
					var_22_1(iter_22_1, arg_22_1)
				end
			else
				iter_22_1(arg_22_1)
			end
		end
	elseif type(arg_22_0) == "function" then
		arg_22_0(arg_22_1)
	end
end

local function var_0_5(arg_23_0)
	return Dorm.storage:GetData(DormEnum.Namespace.EntityData, arg_23_0)
end

local function var_0_6(arg_24_0, arg_24_1)
	local var_24_0 = {}

	for iter_24_0, iter_24_1 in pairs(arg_24_0) do
		table.insert(var_24_0, iter_24_0)
	end

	table.sort(var_24_0, arg_24_1)

	return var_24_0
end

function var_0_0.MakeInteractTask(arg_25_0, arg_25_1, arg_25_2)
	if arg_25_0 then
		local var_25_0 = arg_25_0.sequence
		local var_25_1 = arg_25_0.duration
		local var_25_2 = arg_25_0.keys or var_0_6(var_25_0)

		arg_25_1.duration = var_25_1
		arg_25_2 = arg_25_2 or DormCharacterActionManager.frameTaskRunner

		local var_25_3 = arg_25_2:NewTask({
			start = arg_25_1.startTime or arg_25_2:Now()
		})

		var_25_3:WaitUntil(function(arg_26_0)
			local var_26_0 = arg_26_0.taskDataCtx.task.taskRunner
			local var_26_1 = arg_26_0.taskDataCtx.start
			local var_26_2 = arg_26_0.k
			local var_26_3 = var_26_0:Now() - var_26_1

			while var_26_2 <= #var_25_2 and var_26_3 >= var_25_2[var_26_2] do
				local var_26_4 = var_25_0[var_25_2[var_26_2]]

				var_0_0.DriveInteractSequenceNode(var_26_4, arg_25_1)

				var_26_2 = var_26_2 + 1
			end

			arg_26_0.k = var_26_2
			arg_25_1.playTime = var_26_3

			return var_26_2 > #var_25_2 or var_26_3 >= var_25_1
		end, false, {
			k = 1
		})
		var_25_3:WaitUntil(function(arg_27_0)
			local var_27_0 = arg_27_0.taskDataCtx.task.taskRunner
			local var_27_1 = arg_27_0.taskDataCtx.start

			arg_25_1.playTime = var_27_0:Now() - var_27_1

			return arg_25_1.playTime >= var_25_1
		end)

		if arg_25_0.onAbort then
			var_25_3:SetOnAbort(function()
				arg_25_0.onAbort(arg_25_1)
			end)
		end

		if arg_25_0.onComplete then
			var_25_3:SetOnComplete(function()
				arg_25_1.playTime = arg_25_1.duration

				arg_25_0.onComplete(arg_25_1)
			end)
		end

		return var_25_3
	end
end

local function var_0_7(arg_30_0, arg_30_1)
	local var_30_0 = nullable(DormUtils.GetEntityData(arg_30_0), "interactEntities") or {}

	table.insert(var_30_0, arg_30_1)

	return var_30_0
end

local function var_0_8(arg_31_0, arg_31_1)
	local var_31_0 = nullable(DormUtils.GetEntityData(arg_31_0), "interactEntities")

	if var_31_0 then
		for iter_31_0 = #var_31_0, 1, -1 do
			if var_31_0[iter_31_0] == arg_31_1 then
				table.remove(var_31_0, iter_31_0)

				break
			end
		end
	end
end

local function var_0_9(arg_32_0, arg_32_1, arg_32_2)
	Dorm.DormEntityManager.KeepAsInteractNotEnd(arg_32_1.entityID, arg_32_1.targetID, false)

	local var_32_0 = arg_32_1.entityID
	local var_32_1 = DormUtils.GetEntityData(var_32_0)

	var_32_1.isDuringInteract = true
	arg_32_1.peers = var_0_7(arg_32_1.targetID, arg_32_1.entityID)

	arg_32_0:SetCancellationSrc(function()
		return arg_32_2.canceled
	end)

	local var_32_2 = arg_32_0.onComplete

	arg_32_0:SetOnComplete(function()
		var_0_8(arg_32_1.targetID, var_32_0)

		if arg_32_1.continuous then
			Dorm.DormEntityManager.KeepAsInteractNotEnd(var_32_0, arg_32_1.targetID, true)

			var_32_1.isDuringInteract = true
		else
			var_32_1.isDuringInteract = false

			DormUtils.ShowCharaSpecialVfx(var_32_0, Dorm.charaVfxActiveType)
			DormUtils.SetEntityInteractContext(var_32_0, nil)
		end

		arg_32_2:Notify(true)

		if var_32_2 then
			var_32_2()
		end
	end)

	local var_32_3 = arg_32_0.onAbort

	arg_32_0:SetOnAbort(function(arg_35_0)
		if Dorm.DormEntityManager.IsValidEntityID(var_32_0) then
			DormUtils.SetEntityInteractContext(var_32_0, nil)

			if var_32_1.isDuringInteract then
				var_32_1.isDuringInteract = false

				DormUtils.ShowCharaSpecialVfx(var_32_0, Dorm.charaVfxActiveType)
			end

			var_0_8(arg_32_1.targetID, var_32_0)
		end

		arg_32_2:Notify(false)

		if var_32_3 then
			var_32_3()
		end
	end)
	arg_32_0:Start(arg_32_1.waitOneTick)

	arg_32_1.curActionTask = arg_32_0

	DormUtils.HideCharaSpecialVfx(var_32_0)

	return arg_32_0
end

function var_0_0.GetNextAction(arg_36_0)
	local var_36_0 = nullable(DormInteractSequence, arg_36_0, "next_action")

	if var_36_0 and next(var_36_0) then
		local var_36_1 = var_36_0[math.random(#var_36_0)]

		return true, nullable(var_36_1, 1), nullable(var_36_1, 2)
	end

	return false
end

function var_0_0.MakeCtx(arg_37_0, arg_37_1, arg_37_2)
	local var_37_0 = arg_37_2 or {}

	var_37_0.entityID = arg_37_0
	var_37_0.targetID = arg_37_1

	return var_37_0
end

function var_0_0.MakeDefaultCtx(arg_38_0, arg_38_1, arg_38_2, arg_38_3)
	local var_38_0, var_38_1, var_38_2 = var_0_0.GetNextAction(arg_38_2)
	local var_38_3 = {
		nextAction = var_38_1,
		nextActionWaitTime = var_38_2,
		continuous = var_38_0
	}

	if arg_38_3 ~= nil then
		for iter_38_0, iter_38_1 in pairs(arg_38_3) do
			var_38_3[iter_38_0] = iter_38_1
		end
	end

	return (var_0_0.MakeCtx(arg_38_0, arg_38_1, var_38_3))
end

local function var_0_10(arg_39_0, arg_39_1)
	if type(arg_39_0) == "function" then
		return arg_39_0(arg_39_1)
	else
		return var_0_0.MakeInteractTask(arg_39_0, arg_39_1)
	end
end

function var_0_0.MakeCtxForInternalAction(arg_40_0, arg_40_1, arg_40_2, arg_40_3)
	arg_40_3 = arg_40_3 or {}

	local var_40_0 = nullable(var_0_5(arg_40_0), "cfgID")
	local var_40_1 = nullable(var_0_5(arg_40_1), "cfgID")

	arg_40_3.entityCfg, arg_40_3.targetCfg = var_40_0, var_40_1

	local var_40_2 = var_0_0.GetSequence(var_40_0, var_40_1, arg_40_2)
	local var_40_3 = var_0_0.MakeCtx(arg_40_0, arg_40_1, arg_40_3)

	var_40_3.curActionTask = var_0_10(var_40_2, var_40_3)

	return var_40_3, var_40_2
end

function var_0_0.ValidateAction(arg_41_0, arg_41_1, arg_41_2)
	local var_41_0 = nullable(var_0_5(arg_41_0), "cfgID")
	local var_41_1 = nullable(var_0_5(arg_41_1), "cfgID")
	local var_41_2 = nullable(DormInteractSequence, arg_41_2, "name")

	return var_0_0.GetSequence(var_41_0, var_41_1, var_41_2)
end

function var_0_0.Interact(arg_42_0, arg_42_1, arg_42_2, arg_42_3)
	local var_42_0 = var_0_5(arg_42_0).interactCtx
	local var_42_1 = nullable(var_42_0, "curActionTask")

	if not var_42_1 then
		var_42_0 = var_42_0 or var_0_0.MakeDefaultCtx(arg_42_0, arg_42_1, arg_42_3)

		local var_42_2 = var_0_0.ValidateAction(arg_42_0, arg_42_1, arg_42_3)

		var_42_1 = var_42_0.curActionTask or var_0_10(var_42_2, var_42_0)
	end

	if var_42_1 then
		var_0_9(var_42_1, var_42_0, arg_42_2)
	else
		arg_42_2:Notify(false)
	end
end

function var_0_0.GetSequencePath(arg_43_0, arg_43_1, arg_43_2, arg_43_3)
	arg_43_3 = arg_43_3 or "game.dorm.interacts"

	if arg_43_2 ~= nil then
		local var_43_0 = {}

		if arg_43_0 then
			if arg_43_1 then
				table.insert(var_43_0, string.format("%s.%d.%d_%s", arg_43_3, arg_43_0, arg_43_1, arg_43_2))
			end

			local var_43_1 = BackHomeHeroSkinCfg[arg_43_0]
			local var_43_2 = arg_43_0
			local var_43_3

			if var_43_1 then
				var_43_2, var_43_3 = var_43_1.hero_id, var_43_1.style
			end

			table.insert(var_43_0, string.format("%s.%d.%s", arg_43_3, arg_43_0, arg_43_2))
			table.insert(var_43_0, string.format("%s.%d.%s", arg_43_3, var_43_2, arg_43_2))

			if var_43_3 then
				table.insert(var_43_0, string.format("%s.%s.%s", arg_43_3, var_43_3, arg_43_2))
			end
		end

		table.insert(var_43_0, string.format("%s.%s", arg_43_3, arg_43_2))

		return var_43_0
	end
end

function var_0_0.GetSequenceGroup(arg_44_0, arg_44_1, arg_44_2, arg_44_3, arg_44_4)
	arg_44_4 = arg_44_4 or Dorm.InteractionGrouping

	local var_44_0 = var_0_0.GetSequencePath(arg_44_0, arg_44_1, arg_44_2, arg_44_3)

	if var_44_0 then
		for iter_44_0, iter_44_1 in ipairs(var_44_0) do
			local var_44_1 = arg_44_4[iter_44_1]

			if var_44_1 then
				return var_44_1
			end
		end
	end
end

function var_0_0.GetSequence(arg_45_0, arg_45_1, arg_45_2, arg_45_3, arg_45_4)
	local var_45_0 = var_0_0.GetSequencePath(arg_45_0, arg_45_1, arg_45_2, arg_45_3)

	arg_45_4 = arg_45_4 or Dorm.InteractionGrouping

	if var_45_0 then
		for iter_45_0, iter_45_1 in ipairs(var_45_0) do
			local var_45_1 = package.loaded[iter_45_1]

			if var_45_1 == nil then
				local var_45_2 = arg_45_4[iter_45_1]

				if var_45_2 then
					var_45_1 = var_45_2[math.random(#var_45_2)]
				end
			end

			if var_45_1 then
				return var_45_1
			end
		end
	end
end

function var_0_0.Init(arg_46_0)
	manager.notify:RegistListener(ON_DORM_CHARACTER_INTERACT, arg_46_0.Interact)
	manager.notify:RegistListener(ON_DORM_CHARACTER_GRAB_STARTED, arg_46_0.OnCharaGrab)
	manager.notify:RegistListener(ON_DORM_CHARACTER_INTERACT_ABORTED, arg_46_0.OnInteractAborted)
end

function var_0_0.Reset(arg_47_0)
	manager.notify:RemoveListener(ON_DORM_CHARACTER_INTERACT, arg_47_0.Interact)
	manager.notify:RemoveListener(ON_DORM_CHARACTER_GRAB_STARTED, arg_47_0.OnCharaGrab)
	manager.notify:RemoveListener(ON_DORM_CHARACTER_INTERACT_ABORTED, arg_47_0.OnInteractAborted)
end

function var_0_0.OnCharaGrab(arg_48_0)
	local var_48_0 = DormUtils.GetEntityData(arg_48_0)

	if var_48_0.isDuringInteract then
		DormUtils.ShowCharaSpecialVfx(arg_48_0, Dorm.charaVfxActiveType)

		var_48_0.isDuringInteract = false
	end
end

function var_0_0.OnInteractAborted(arg_49_0, arg_49_1)
	local var_49_0 = DormUtils.GetEntityData(arg_49_0)

	if var_49_0 == nil then
		return
	end

	local var_49_1 = nullable(var_49_0, "interactCtx", "curActionTask")

	if var_49_1 then
		var_49_1:Abort()
	end

	DormUtils.SetEntityInteractContext(arg_49_0, nil)
end

return var_0_0
