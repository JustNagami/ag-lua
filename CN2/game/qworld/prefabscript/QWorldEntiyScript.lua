local var_0_0 = class("QWorldEntiyScript")

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	arg_1_0.entity = arg_1_1
	arg_1_0.localData = {}
	arg_1_0.type = arg_1_2
	arg_1_0.uniqueId = arg_1_1.uniqueId
	arg_1_0.entityId = arg_1_3 or 0
	arg_1_0.parent = nil
	arg_1_0.children = nil
	arg_1_0.display_name = tostring(arg_1_0.uniqueId)
end

function var_0_0.GetId(arg_2_0)
	return arg_2_0.uniqueId
end

function var_0_0.GetPosition(arg_3_0)
	return arg_3_0.entity:GetPosition()
end

function var_0_0.GetRotation(arg_4_0)
	return arg_4_0.entity:GetRotation()
end

function var_0_0.GetForward(arg_5_0)
	return arg_5_0.entity:GetForward()
end

function var_0_0.GetTeleportId(arg_6_0)
	return arg_6_0.entity:GetTeleportId()
end

function var_0_0.GetTransform(arg_7_0)
	return arg_7_0.entity.transform
end

function var_0_0.AnalyThingCfg(arg_8_0, arg_8_1)
	local var_8_0 = arg_8_1 and SandplayThingCfg[arg_8_1]

	arg_8_0.configId = arg_8_1
	arg_8_0.thingCfg = var_8_0

	if var_8_0 and arg_8_0.entity ~= nil then
		if var_8_0.name ~= "" then
			arg_8_0.entity:SetName(var_8_0.name)

			arg_8_0.display_name = var_8_0.name
		end

		arg_8_0.entity:SetHudDisplay(var_8_0.hud_display)
		arg_8_0.entity:SetDefaultTalk(var_8_0.default_dialogue)

		if var_8_0.model_path ~= "" then
			arg_8_0.entity:SetBuild(var_8_0.model_path)
		end

		if var_8_0.label == nil or var_8_0.label == "" then
			arg_8_0:InitTagSystem(var_8_0.hud, {})
		else
			arg_8_0:InitTagSystem(var_8_0.hud, var_8_0.label)
		end

		arg_8_0.entity:SetBubbbleLookAt(arg_8_0:IsBubbleNeedLookAt())
		arg_8_0:GenerateEffect(arg_8_0.thingCfg.generate_effect, arg_8_0.thingCfg.generate_destroy_time)
	else
		arg_8_0:InitTagSystem(0, {})
	end
end

function var_0_0.GenerateEffect(arg_9_0, arg_9_1, arg_9_2)
	if not string.isNullOrEmpty(arg_9_1) and not isNil(arg_9_0.entity) then
		local var_9_0 = Asset.Instantiate("Effect/Scene/" .. arg_9_1)

		var_9_0.transform.position = arg_9_0:GetPosition()
		var_9_0.transform.rotation = arg_9_0:GetRotation()

		if arg_9_2 and arg_9_2 > 0 then
			QWorldLuaBridge.DestroyQWorldAsset(var_9_0, arg_9_2)
		end
	end
end

function var_0_0.InitTagSystem(arg_10_0, arg_10_1, arg_10_2)
	arg_10_0.tagData = {}
	arg_10_0.hudTag = arg_10_1

	local var_10_0 = arg_10_1

	if var_10_0 then
		arg_10_0:AddTagFromTagSystem(var_10_0)
	end

	local var_10_1 = arg_10_2

	if var_10_1 then
		for iter_10_0, iter_10_1 in ipairs(var_10_1) do
			arg_10_0:AddTagFromTagSystem(iter_10_1)
		end
	end
end

function var_0_0.AddMiniMapEntity(arg_11_0, arg_11_1, arg_11_2)
	if arg_11_0.miniMapUnit == nil then
		arg_11_0.miniMapUnit = arg_11_0:CreateMiniMapEntity()
	end

	arg_11_0.miniMapUnit:AddMini(arg_11_1, arg_11_2)
end

function var_0_0.RemoveMiniMapEntity(arg_12_0, arg_12_1, arg_12_2)
	if arg_12_0.miniMapUnit and arg_12_0.miniMapUnit:RemoveMini(arg_12_1, arg_12_2) then
		arg_12_0.miniMapUnit:Dispose()

		arg_12_0.miniMapUnit = nil
	end
end

function var_0_0.CreateMiniMapEntity(arg_13_0)
	return QWorldEntityMiniMap.New(arg_13_0)
end

local function var_0_1(arg_14_0, arg_14_1, arg_14_2, arg_14_3)
	local var_14_0 = arg_14_0[arg_14_1]

	if not var_14_0 then
		var_14_0 = {}
		arg_14_0[arg_14_1] = var_14_0
	end

	local var_14_1 = var_14_0[arg_14_2]

	if not var_14_1 then
		var_14_1 = {}
		var_14_0[arg_14_2] = var_14_1
	end

	table.insert(var_14_1, arg_14_3)
end

function var_0_0.ListenForEvent(arg_15_0, arg_15_1, arg_15_2, arg_15_3)
	arg_15_3 = arg_15_3 or arg_15_0

	if not arg_15_3.event_listeners then
		arg_15_3.event_listeners = {}
	end

	var_0_1(arg_15_3.event_listeners, arg_15_1, arg_15_0, arg_15_2)

	if not arg_15_0.event_listening then
		arg_15_0.event_listening = {}
	end

	var_0_1(arg_15_0.event_listening, arg_15_1, arg_15_3, arg_15_2)
end

local function var_0_2(arg_16_0, arg_16_1, arg_16_2, arg_16_3)
	if arg_16_0 then
		local var_16_0 = arg_16_0[arg_16_1]

		if var_16_0 then
			local var_16_1 = var_16_0[arg_16_2]

			if var_16_1 then
				table.removebyvalue(var_16_1, arg_16_3)

				if next(var_16_1) == nil then
					var_16_0[arg_16_2] = nil
				end
			end

			if next(var_16_0) == nil then
				arg_16_0[arg_16_1] = nil
			end
		end
	end
end

function var_0_0.RemoveEventCallback(arg_17_0, arg_17_1, arg_17_2, arg_17_3)
	arg_17_3 = arg_17_3 or arg_17_0

	var_0_2(arg_17_3.event_listeners, arg_17_1, arg_17_0, arg_17_2)
	var_0_2(arg_17_0.event_listening, arg_17_1, arg_17_3, arg_17_2)
end

function var_0_0.RemoveAllEventCallbacks(arg_18_0)
	if arg_18_0.event_listening then
		for iter_18_0, iter_18_1 in pairs(arg_18_0.event_listening) do
			for iter_18_2, iter_18_3 in pairs(iter_18_1) do
				if iter_18_2.event_listeners then
					local var_18_0 = iter_18_2.event_listeners[iter_18_0]

					if var_18_0 then
						var_18_0[arg_18_0] = nil
					end
				end
			end
		end

		arg_18_0.event_listening = nil
	end

	if arg_18_0.event_listeners then
		for iter_18_4, iter_18_5 in pairs(arg_18_0.event_listeners) do
			for iter_18_6, iter_18_7 in pairs(iter_18_5) do
				if iter_18_6.event_listening then
					local var_18_1 = iter_18_6.event_listening[iter_18_4]

					if var_18_1 then
						var_18_1[arg_18_0] = nil
					end
				end
			end
		end

		arg_18_0.event_listeners = nil
	end
end

function var_0_0.PushEvent(arg_19_0, arg_19_1, arg_19_2)
	if arg_19_0.event_listeners then
		local var_19_0 = arg_19_0.event_listeners[arg_19_1]

		if var_19_0 then
			for iter_19_0, iter_19_1 in pairs(var_19_0) do
				for iter_19_2, iter_19_3 in ipairs(iter_19_1) do
					iter_19_3(arg_19_0, arg_19_2)
				end
			end
		end
	end
end

function var_0_0.SpawnChild(arg_20_0, arg_20_1, arg_20_2, arg_20_3)
	local var_20_0 = QWorldSpawnPrefab(arg_20_1, arg_20_2, arg_20_3)

	arg_20_0:AddChild(var_20_0)

	return var_20_0
end

function var_0_0.RemoveChild(arg_21_0, arg_21_1)
	arg_21_1.parent = nil

	if arg_21_0.children then
		arg_21_0.children[arg_21_1] = nil
	end
end

function var_0_0.AddChild(arg_22_0, arg_22_1)
	if arg_22_1.parent then
		arg_22_1.parent:RemoveChild(arg_22_1)
	end

	arg_22_1.parent = arg_22_0

	if not arg_22_0.children then
		arg_22_0.children = {}
	end

	arg_22_0.children[arg_22_1] = true
end

function var_0_0.Remove(arg_23_0)
	if arg_23_0.parent then
		arg_23_0.parent:RemoveChild(arg_23_0)
	end

	if arg_23_0.thingCfg then
		arg_23_0:GenerateEffect(arg_23_0.thingCfg.disappear_effect, arg_23_0.thingCfg.dissappear_destroy_time)
	end

	if arg_23_0.children then
		for iter_23_0, iter_23_1 in pairs(arg_23_0.children) do
			iter_23_0.parent = nil

			iter_23_0:Remove()
		end
	end

	arg_23_0:RemoveAllEventCallbacks()

	if arg_23_0.OnRemoveEntity then
		arg_23_0.OnRemoveEntity(arg_23_0)
	end

	if arg_23_0.miniMapUnit then
		arg_23_0.miniMapUnit:Dispose()

		arg_23_0.miniMapUnit = nil
	end

	QWorldMgr:GetQWorldEntityMgr():OnRemoveEntity(arg_23_0.uniqueId)
end

function var_0_0.AddQuestTag(arg_24_0, arg_24_1, arg_24_2, arg_24_3)
	local var_24_0 = {
		type = QWorldConst.TagType.Quest,
		id = arg_24_1,
		title = arg_24_2,
		action = arg_24_3
	}

	arg_24_0:AddTag(QWorldConst.TagType.Quest, var_24_0)
end

function var_0_0.RemoveQuestTag(arg_25_0, arg_25_1)
	arg_25_0:RemoveTag(QWorldConst.TagType.Quest, arg_25_1)
end

function var_0_0.AddTagFromTagSystem(arg_26_0, arg_26_1)
	local var_26_0 = false

	if arg_26_0.hudTag and arg_26_1 == arg_26_0.hudTag then
		var_26_0 = true
	end

	local var_26_1 = SandplayTagCfg[arg_26_1]

	if var_26_1 then
		QWorldMgr:GetQWorldTagMgr():RegisterTagEntity(arg_26_1, arg_26_0.entityId)

		if not QWorldMgr:GetQWorldTagMgr():CheckTagCanOpen(arg_26_1) then
			return
		end

		local var_26_2 = var_26_0 and QWorldConst.TagType.HudTag or QWorldConst.TagType.TagSystem
		local var_26_3 = {
			type = var_26_2,
			id = arg_26_1,
			title = var_26_1.tag_name,
			action = function(arg_27_0)
				QWorldMgr:GetQWorldTagMgr():GotoTag(arg_26_1, arg_26_0.entityId, arg_27_0)
			end
		}

		arg_26_0:AddTag(var_26_2, var_26_3)

		if var_26_0 then
			arg_26_0:AddMiniMapEntity(QWorldEntityMiniMapTag.Hud, arg_26_1)
			QWorldLuaBridge.EntityShowCommonHud(arg_26_0.entity, "TextureConfig/SandPlay/MiniIcon/" .. var_26_1.map_icon, var_26_1.deputy_name)
		end
	end
end

function var_0_0.RemoveTagFromTagSystem(arg_28_0, arg_28_1)
	local var_28_0 = false

	if arg_28_0.hudTag and arg_28_1 == arg_28_0.hudTag then
		var_28_0 = true
	end

	local var_28_1 = var_28_0 and QWorldConst.TagType.HudTag or QWorldConst.TagType.TagSystem

	arg_28_0:RemoveTag(var_28_1, arg_28_1)

	if var_28_0 then
		arg_28_0:RemoveMiniMapEntity(QWorldEntityMiniMapTag.Hud, arg_28_1)
		QWorldLuaBridge.EntityShowCommonHud(arg_28_0.entity, "", "")
	end
end

function var_0_0.AddTag(arg_29_0, arg_29_1, arg_29_2)
	if not arg_29_0.tagData[arg_29_1] then
		arg_29_0.tagData[arg_29_1] = {}
	end

	arg_29_0.tagData[arg_29_1][arg_29_2.id] = arg_29_2
end

function var_0_0.RemoveTag(arg_30_0, arg_30_1, arg_30_2)
	if arg_30_0.tagData[arg_30_1] then
		arg_30_0.tagData[arg_30_1][arg_30_2] = nil
	end
end

function var_0_0.GetHudTag(arg_31_0)
	local var_31_0 = arg_31_0.tagData[QWorldConst.TagType.HudTag]

	if var_31_0 then
		for iter_31_0, iter_31_1 in pairs(var_31_0) do
			if iter_31_1 then
				return iter_31_1
			end
		end
	end

	return nil
end

function var_0_0.HasNotHudTag(arg_32_0)
	for iter_32_0, iter_32_1 in pairs(arg_32_0.tagData) do
		if iter_32_1 and iter_32_0 ~= QWorldConst.TagType.HudTag then
			for iter_32_2, iter_32_3 in pairs(iter_32_1) do
				if iter_32_3 then
					return true
				end
			end
		end
	end

	return false
end

function var_0_0.HudLogic(arg_33_0, arg_33_1)
	local var_33_0 = arg_33_0:GetHudTag()

	if var_33_0 then
		if arg_33_0:HasNotHudTag() then
			return false
		else
			if SandplayTagCfg[arg_33_0.hudTag].options_switch == 1 then
				return false
			end

			QWorldTools.SendMessageToSDK(QWorldMgr:GetActivityId(), QWorldMgr:GetMapId(), QWorldMessageType.TAG_OPERATION, var_33_0.id, "", arg_33_0.entityId)
			var_33_0.action(arg_33_1)

			return true
		end
	end

	return false
end

function var_0_0.GetAllTalkTag(arg_34_0)
	local var_34_0 = arg_34_0.tagData[QWorldConst.TagType.Quest]
	local var_34_1 = {}

	if var_34_0 then
		for iter_34_0, iter_34_1 in pairs(var_34_0) do
			table.insert(var_34_1, iter_34_1)
		end
	end

	local var_34_2 = arg_34_0.tagData[QWorldConst.TagType.TagSystem]

	if var_34_2 then
		for iter_34_2, iter_34_3 in pairs(var_34_2) do
			if SandplayTagCfg[iter_34_3.id].options_switch == 1 then
				table.insert(var_34_1, iter_34_3)
			end
		end
	end

	local var_34_3 = arg_34_0.tagData[QWorldConst.TagType.HudTag]

	if var_34_3 then
		for iter_34_4, iter_34_5 in pairs(var_34_3) do
			if SandplayTagCfg[iter_34_5.id].options_switch == 1 then
				table.insert(var_34_1, iter_34_5)
			end
		end
	end

	return var_34_1
end

function var_0_0.GetBubbleIcon(arg_35_0)
	local var_35_0 = ""

	if arg_35_0.thingCfg then
		var_35_0 = GetQWorldBubbleIconPath() .. arg_35_0.thingCfg.bubble_icon
	end

	return var_35_0
end

function var_0_0.GetName(arg_36_0)
	if arg_36_0.display_name and arg_36_0.display_name ~= "" then
		return GetI18NText(arg_36_0.display_name)
	end

	return ""
end

function var_0_0.IsBubbleNeedLookAt(arg_37_0)
	if not arg_37_0.thingCfg then
		return false
	end

	local var_37_0 = arg_37_0.thingCfg.target_orientation

	if not var_37_0 or var_37_0 == 0 then
		return false
	end

	return true
end

function var_0_0.InvokeBubbleProxy(arg_38_0)
	if arg_38_0.entity ~= nil then
		arg_38_0.entity:InvokeBubbleClick()
	end
end

return var_0_0
