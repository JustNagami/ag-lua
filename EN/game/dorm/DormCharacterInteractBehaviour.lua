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
	setEntityVisible = function(arg_9_0, arg_9_1)
		Dorm.DormEntityManager.SetEntityVisible(var_0_2(arg_9_0.entity, arg_9_1), arg_9_0.visible)
	end,
	changeScheme = function(arg_10_0, arg_10_1)
		Dorm.DormEntityManager.ChangeEntityAnimeScheme(var_0_2(arg_10_0.entity, arg_10_1), arg_10_0.scheme)
	end,
	setValue = function(arg_11_0, arg_11_1)
		local var_11_0 = var_0_2(arg_11_0.entity, arg_11_1)

		Dorm.storage:GetData(DormEnum.Namespace.EntityData, var_11_0)[arg_11_0.field] = arg_11_0.value
	end,
	setMobility = function(arg_12_0, arg_12_1)
		local var_12_0 = var_0_2(arg_12_0.entity, arg_12_1)

		Dorm.DormEntityManager.SetEntityMobility(var_12_0, arg_12_0.value)
	end,
	setMouth = function(arg_13_0, arg_13_1)
		local var_13_0 = var_0_2(arg_13_0.entity, arg_13_1)

		Dorm.DormEntityManager.SetFacialExpression(var_13_0, arg_13_0.value)
	end,
	restoreMouth = function(arg_14_0, arg_14_1)
		local var_14_0 = var_0_2(arg_14_0.entity, arg_14_1)

		Dorm.DormEntityManager.RestoreFacialExpression(var_14_0)
	end,
	setFace = function(arg_15_0, arg_15_1)
		local var_15_0 = var_0_2(arg_15_0.entity, arg_15_1)

		Dorm.DormEntityManager.PlayNormalFacileExpression(var_15_0, arg_15_0.faceEmoteState, arg_15_0.faceEmoteSubState, arg_15_0.crossFade)
	end,
	keepAsInteract = function(arg_16_0, arg_16_1)
		Dorm.DormEntityManager.KeepAsInteractNotEnd(var_0_2(arg_16_0.entity, arg_16_1), var_0_2(arg_16_0.target, arg_16_1), arg_16_0.value)
	end,
	setSpFace = function(arg_17_0, arg_17_1)
		local var_17_0 = var_0_2(arg_17_0.entity, arg_17_1)

		Dorm.DormEntityManager.PlaySpacialFacileExpression(var_17_0, arg_17_0.faceEfxPath, arg_17_0.duration)
	end,
	playEfx = function(arg_18_0, arg_18_1)
		local var_18_0 = var_0_2(arg_18_0.entity, arg_18_1)

		Dorm.DormEntityManager.PlayEffect(var_18_0, arg_18_0.attachPoint, arg_18_0.efxPath, arg_18_0.offset or Vector3.zero, arg_18_0.rotation or Quaternion.identity, arg_18_0.scale or Vector3.one, arg_18_0.duration)
	end,
	clearEfx = function(arg_19_0, arg_19_1)
		local var_19_0 = var_0_2(arg_19_0.entity, arg_19_1)

		Dorm.DormEntityManager.ClearInteractEffectOnAttachPoint(var_19_0, arg_19_0.attachPoint)
	end,
	playVoice = function(arg_20_0, arg_20_1)
		manager.audio:Play(var_0_3[arg_20_0.playerType], arg_20_0.sheet, arg_20_0.cue, arg_20_0.awb)
	end,
	stopVoice = function(arg_21_0, arg_21_1)
		manager.audio:Stop(var_0_3[arg_21_0.playerType])
	end,
	playSubtitle = function(arg_22_0, arg_22_1)
		local var_22_0 = var_0_2(arg_22_0.entity, arg_22_1)

		manager.notify:Invoke(DORM_CHARACTER_PLAY_SUBTITLE, var_22_0, arg_22_0.subtitleID)
	end
}

function var_0_0.DriveInteractSequenceNode(arg_23_0, arg_23_1)
	if type(arg_23_0) == "table" then
		for iter_23_0, iter_23_1 in ipairs(arg_23_0) do
			if type(iter_23_1) == "table" then
				local var_23_0 = iter_23_1.action
				local var_23_1 = var_0_4[var_23_0]

				if var_23_1 then
					var_23_1(iter_23_1, arg_23_1)
				end
			else
				iter_23_1(arg_23_1)
			end
		end
	elseif type(arg_23_0) == "function" then
		arg_23_0(arg_23_1)
	end
end

local function var_0_5(arg_24_0)
	return Dorm.storage:GetData(DormEnum.Namespace.EntityData, arg_24_0)
end

local function var_0_6(arg_25_0, arg_25_1)
	local var_25_0 = {}

	for iter_25_0, iter_25_1 in pairs(arg_25_0) do
		table.insert(var_25_0, iter_25_0)
	end

	table.sort(var_25_0, arg_25_1)

	return var_25_0
end

function var_0_0.MakeInteractTask(arg_26_0, arg_26_1, arg_26_2)
	if arg_26_0 then
		local var_26_0 = arg_26_0.sequence
		local var_26_1 = arg_26_0.duration
		local var_26_2 = arg_26_0.keys or var_0_6(var_26_0)

		arg_26_1.duration = var_26_1
		arg_26_2 = arg_26_2 or DormCharacterActionManager.frameTaskRunner

		local var_26_3 = arg_26_2:NewTask({
			start = arg_26_1.startTime or arg_26_2:Now()
		})

		var_26_3:WaitUntil(function(arg_27_0)
			local var_27_0 = arg_27_0.taskDataCtx.task.taskRunner
			local var_27_1 = arg_27_0.taskDataCtx.start
			local var_27_2 = arg_27_0.k
			local var_27_3 = var_27_0:Now() - var_27_1

			while var_27_2 <= #var_26_2 and var_27_3 >= var_26_2[var_27_2] do
				local var_27_4 = var_26_0[var_26_2[var_27_2]]

				var_0_0.DriveInteractSequenceNode(var_27_4, arg_26_1)

				var_27_2 = var_27_2 + 1
			end

			arg_27_0.k = var_27_2
			arg_26_1.playTime = var_27_3

			return var_27_2 > #var_26_2 or var_27_3 >= var_26_1
		end, false, {
			k = 1
		})
		var_26_3:WaitUntil(function(arg_28_0)
			local var_28_0 = arg_28_0.taskDataCtx.task.taskRunner
			local var_28_1 = arg_28_0.taskDataCtx.start

			arg_26_1.playTime = var_28_0:Now() - var_28_1

			return arg_26_1.playTime >= var_26_1
		end)

		if arg_26_0.onAbort then
			var_26_3:SetOnAbort(function()
				arg_26_0.onAbort(arg_26_1)
			end)
		end

		if arg_26_0.onComplete then
			var_26_3:SetOnComplete(function()
				arg_26_1.playTime = arg_26_1.duration

				arg_26_0.onComplete(arg_26_1)
			end)
		end

		return var_26_3
	end
end

local function var_0_7(arg_31_0, arg_31_1)
	local var_31_0 = nullable(DormUtils.GetEntityData(arg_31_0), "interactEntities") or {}

	table.insert(var_31_0, arg_31_1)

	return var_31_0
end

local function var_0_8(arg_32_0, arg_32_1)
	local var_32_0 = nullable(DormUtils.GetEntityData(arg_32_0), "interactEntities")

	if var_32_0 then
		for iter_32_0 = #var_32_0, 1, -1 do
			if var_32_0[iter_32_0] == arg_32_1 then
				table.remove(var_32_0, iter_32_0)

				break
			end
		end
	end
end

local function var_0_9(arg_33_0, arg_33_1, arg_33_2)
	Dorm.DormEntityManager.KeepAsInteractNotEnd(arg_33_1.entityID, arg_33_1.targetID, false)

	local var_33_0 = arg_33_1.entityID
	local var_33_1 = DormUtils.GetEntityData(var_33_0)

	var_33_1.isDuringInteract = true
	arg_33_1.peers = var_0_7(arg_33_1.targetID, arg_33_1.entityID)

	arg_33_0:SetCancellationSrc(function()
		return arg_33_2.canceled
	end)

	local var_33_2 = arg_33_0.onComplete

	arg_33_0:SetOnComplete(function()
		if Dorm.DormEntityManager.IsValidEntityID(var_33_0) then
			var_0_8(arg_33_1.targetID, var_33_0)

			if arg_33_1.continuous then
				Dorm.DormEntityManager.KeepAsInteractNotEnd(var_33_0, arg_33_1.targetID, true)

				var_33_1.isDuringInteract = true
			else
				var_33_1.isDuringInteract = false

				DormUtils.ShowCharaSpecialVfx(var_33_0, Dorm.charaVfxActiveType)
				DormUtils.SetEntityInteractContext(var_33_0, nil)
			end
		end

		arg_33_2:Notify(true)

		if var_33_2 then
			var_33_2()
		end
	end)

	local var_33_3 = arg_33_0.onAbort

	arg_33_0:SetOnAbort(function(arg_36_0)
		if Dorm.DormEntityManager.IsValidEntityID(var_33_0) then
			DormUtils.SetEntityInteractContext(var_33_0, nil)

			if var_33_1.isDuringInteract then
				var_33_1.isDuringInteract = false

				DormUtils.ShowCharaSpecialVfx(var_33_0, Dorm.charaVfxActiveType)
			end

			var_0_8(arg_33_1.targetID, var_33_0)
		end

		arg_33_2:Notify(false)

		if var_33_3 then
			var_33_3()
		end
	end)

	arg_33_1.curActionTask = arg_33_0

	DormUtils.HideCharaSpecialVfx(var_33_0)
	arg_33_0:Start(arg_33_1.waitOneTick)

	return arg_33_0
end

function var_0_0.GetNextAction(arg_37_0)
	local var_37_0 = nullable(DormInteractSequence, arg_37_0, "next_action")

	if var_37_0 and next(var_37_0) then
		local var_37_1 = var_37_0[math.random(#var_37_0)]

		return true, nullable(var_37_1, 1), nullable(var_37_1, 2)
	end

	return false
end

function var_0_0.MakeCtx(arg_38_0, arg_38_1, arg_38_2)
	local var_38_0 = arg_38_2 or {}

	var_38_0.entityID = arg_38_0
	var_38_0.targetID = arg_38_1

	return var_38_0
end

function var_0_0.MakeDefaultCtx(arg_39_0, arg_39_1, arg_39_2, arg_39_3)
	local var_39_0, var_39_1, var_39_2 = var_0_0.GetNextAction(arg_39_2)
	local var_39_3 = {
		nextAction = var_39_1,
		nextActionWaitTime = var_39_2,
		continuous = var_39_0
	}

	if arg_39_3 ~= nil then
		for iter_39_0, iter_39_1 in pairs(arg_39_3) do
			var_39_3[iter_39_0] = iter_39_1
		end
	end

	return (var_0_0.MakeCtx(arg_39_0, arg_39_1, var_39_3))
end

local function var_0_10(arg_40_0, arg_40_1)
	if type(arg_40_0) == "function" then
		return arg_40_0(arg_40_1)
	else
		return var_0_0.MakeInteractTask(arg_40_0, arg_40_1)
	end
end

function var_0_0.MakeCtxForInternalAction(arg_41_0, arg_41_1, arg_41_2, arg_41_3)
	arg_41_3 = arg_41_3 or {}

	local var_41_0 = nullable(var_0_5(arg_41_0), "cfgID")
	local var_41_1 = nullable(var_0_5(arg_41_1), "cfgID")

	arg_41_3.entityCfg, arg_41_3.targetCfg = var_41_0, var_41_1

	local var_41_2 = var_0_0.GetSequence(var_41_0, var_41_1, arg_41_2)
	local var_41_3 = var_0_0.MakeCtx(arg_41_0, arg_41_1, arg_41_3)

	var_41_3.curActionTask = var_0_10(var_41_2, var_41_3)

	return var_41_3, var_41_2
end

local var_0_11 = -1
local var_0_12
local var_0_13

local function var_0_14(arg_42_0)
	local var_42_0 = var_0_13[arg_42_0]

	if type(var_42_0) == "function" then
		return var_0_0.SimpleCustomInteractAction(var_42_0)
	end

	return var_42_0
end

function var_0_0.ValidateAction(arg_43_0, arg_43_1, arg_43_2)
	local var_43_0 = nullable(DormInteractSequence, arg_43_2, "name")

	return var_0_0.GetSequence(arg_43_0, arg_43_1, var_43_0) or var_0_14(arg_43_2)
end

function var_0_0.Interact(arg_44_0, arg_44_1, arg_44_2, arg_44_3)
	local var_44_0 = var_0_5(arg_44_0).interactCtx
	local var_44_1 = nullable(var_44_0, "curActionTask")

	if not var_44_1 then
		var_44_0 = var_44_0 or var_0_0.MakeDefaultCtx(arg_44_0, arg_44_1, arg_44_3)

		local var_44_2 = var_0_0.ValidateAction(arg_44_0, arg_44_1, arg_44_3)

		var_44_1 = var_44_0.curActionTask or var_0_10(var_44_2, var_44_0)
	end

	if var_44_1 then
		var_0_9(var_44_1, var_44_0, arg_44_2)
	else
		arg_44_2:Notify(false)
	end
end

function var_0_0.SendCustomInteract(arg_45_0, arg_45_1, arg_45_2, arg_45_3)
	local var_45_0 = var_0_12[arg_45_2]

	if var_45_0 == nil then
		var_45_0 = var_0_11
		var_0_12[arg_45_2] = var_45_0
		var_0_13[var_45_0] = arg_45_2
		var_0_11 = var_0_11 - 1
	end

	Dorm.DormEntityManager.SendInteractToEntityCMD(arg_45_0, arg_45_1, var_45_0, arg_45_3)
end

function var_0_0.SimpleCustomInteractAction(arg_46_0)
	return {
		duration = 0,
		sequence = {
			[0] = arg_46_0
		}
	}
end

local function var_0_15(arg_47_0, arg_47_1, arg_47_2, arg_47_3, arg_47_4)
	if arg_47_2 then
		table.insert(arg_47_0, string.format("%s.%s.%d_%s", arg_47_3, arg_47_1, arg_47_2, arg_47_4))
	end

	table.insert(arg_47_0, string.format("%s.%s.%s", arg_47_3, arg_47_1, arg_47_4))
end

function var_0_0.GetSequencePath(arg_48_0, arg_48_1, arg_48_2, arg_48_3)
	arg_48_3 = arg_48_3 or "game.dorm.interacts"

	if arg_48_2 ~= nil then
		local var_48_0 = DormUtils.GetEntityData(arg_48_0)
		local var_48_1 = DormUtils.GetEntityData(arg_48_1)
		local var_48_2 = nullable(var_48_0, "cfgID")
		local var_48_3 = nullable(var_48_1, "cfgID")
		local var_48_4 = {}

		if var_48_2 then
			local var_48_5 = BackHomeHeroSkinCfg[var_48_2]
			local var_48_6 = var_48_2
			local var_48_7
			local var_48_8 = var_48_0.skinVariant

			if var_48_5 then
				var_48_6, var_48_7 = var_48_5.hero_id, var_48_5.style
			end

			if var_48_8 then
				local var_48_9 = string.format("%d_%02d", var_48_2, var_48_8)

				var_0_15(var_48_4, var_48_9, var_48_3, arg_48_3, arg_48_2)
			end

			var_0_15(var_48_4, var_48_2, var_48_3, arg_48_3, arg_48_2)
			table.insert(var_48_4, string.format("%s.%d.%s", arg_48_3, var_48_6, arg_48_2))

			if var_48_7 then
				table.insert(var_48_4, string.format("%s.%s.%s", arg_48_3, var_48_7, arg_48_2))
			end
		end

		table.insert(var_48_4, string.format("%s.%s", arg_48_3, arg_48_2))

		return var_48_4
	end
end

function var_0_0.GetSequenceGroup(arg_49_0, arg_49_1, arg_49_2, arg_49_3, arg_49_4)
	arg_49_4 = arg_49_4 or Dorm.InteractionGrouping

	local var_49_0 = var_0_0.GetSequencePath(arg_49_0, arg_49_1, arg_49_2, arg_49_3)

	if var_49_0 then
		for iter_49_0, iter_49_1 in ipairs(var_49_0) do
			local var_49_1 = arg_49_4[iter_49_1]

			if var_49_1 then
				return var_49_1
			end
		end
	end
end

function var_0_0.GetSequence(arg_50_0, arg_50_1, arg_50_2, arg_50_3, arg_50_4)
	local var_50_0 = var_0_0.GetSequencePath(arg_50_0, arg_50_1, arg_50_2, arg_50_3)

	arg_50_4 = arg_50_4 or Dorm.InteractionGrouping

	if var_50_0 then
		for iter_50_0, iter_50_1 in ipairs(var_50_0) do
			local var_50_1 = package.loaded[iter_50_1]

			if var_50_1 == nil then
				local var_50_2 = arg_50_4[iter_50_1]

				if var_50_2 then
					var_50_1 = var_50_2[math.random(#var_50_2)]
				end
			end

			if var_50_1 then
				return var_50_1
			end
		end
	end
end

function var_0_0.Init(arg_51_0)
	var_0_12, var_0_13 = {}, {}

	manager.notify:RegistListener(ON_DORM_CHARACTER_INTERACT, arg_51_0.Interact)
	manager.notify:RegistListener(ON_DORM_CHARACTER_GRAB_STARTED, arg_51_0.OnCharaGrab)
	manager.notify:RegistListener(ON_DORM_CHARACTER_INTERACT_ABORTED, arg_51_0.OnInteractAborted)
end

function var_0_0.Reset(arg_52_0)
	var_0_12, var_0_13 = nil

	manager.notify:RemoveListener(ON_DORM_CHARACTER_INTERACT, arg_52_0.Interact)
	manager.notify:RemoveListener(ON_DORM_CHARACTER_GRAB_STARTED, arg_52_0.OnCharaGrab)
	manager.notify:RemoveListener(ON_DORM_CHARACTER_INTERACT_ABORTED, arg_52_0.OnInteractAborted)
end

function var_0_0.OnCharaGrab(arg_53_0)
	local var_53_0 = DormUtils.GetEntityData(arg_53_0)

	if var_53_0.isDuringInteract then
		DormUtils.ShowCharaSpecialVfx(arg_53_0, Dorm.charaVfxActiveType)

		var_53_0.isDuringInteract = false
	end
end

function var_0_0.OnInteractAborted(arg_54_0, arg_54_1)
	local var_54_0 = DormUtils.GetEntityData(arg_54_0)

	if var_54_0 == nil then
		return
	end

	local var_54_1 = nullable(var_54_0, "interactCtx", "curActionTask")

	if var_54_1 then
		var_54_1:Abort()
	end

	DormUtils.SetEntityInteractContext(arg_54_0, nil)
end

return var_0_0
