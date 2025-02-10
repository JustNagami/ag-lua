local var_0_0 = class("QWorldEntityMgr")

QWORLD_ENTITY_TYPE = {
	FUNITURE = 2,
	ZONE = 3,
	DEFAULT = 0,
	NPC = 1
}

local var_0_1 = {}

function var_0_0.Init(arg_1_0)
	arg_1_0.Ents = {}
	arg_1_0._Ents4EntityId = {}
	arg_1_0.track_entity_id = 0
	arg_1_0.track_quest_entity_id_list = {}
	arg_1_0.track_disable_id_list = {}
	arg_1_0.spawn_after_quest_entitys = {}
	arg_1_0.questUpdateHandle = handler(arg_1_0, arg_1_0.OnQuestFinish)

	manager.notify:RegistListener(QWORLD_SUB_QUEST_FINISH, arg_1_0.questUpdateHandle)
	manager.redPoint:addGroup(RedPointConst.QWORLD_MINI_MAP, {}, true)
end

function var_0_0.Dispose(arg_2_0)
	for iter_2_0, iter_2_1 in pairs(arg_2_0.Ents) do
		iter_2_1:Remove()
	end

	arg_2_0.Ents = {}
	arg_2_0._Ents4EntityId = {}
	arg_2_0.track_entity_id = 0
	arg_2_0.track_quest_entity_id_list = {}
	arg_2_0.track_disable_id_list = {}
	arg_2_0.spawn_after_quest_entitys = {}

	manager.notify:RemoveListener(QWORLD_SUB_QUEST_FINISH, arg_2_0.questUpdateHandle)

	arg_2_0.questUpdateHandle = nil
end

function var_0_0.GetEnt(arg_3_0, arg_3_1)
	return arg_3_0.Ents[arg_3_1]
end

function var_0_0.OnRemoveEntity(arg_4_0, arg_4_1)
	local var_4_0 = arg_4_0.Ents[arg_4_1]

	if var_4_0 then
		arg_4_0:RaiseOnRemoveEntity(var_4_0)
		QWorldLuaBridge.RemoveMapEntity(arg_4_1)

		local var_4_1 = var_4_0.entityId

		arg_4_0.Ents[arg_4_1] = nil
		arg_4_0._Ents4EntityId[var_4_1] = nil

		arg_4_0:RemoveTrack(var_4_1)
	end
end

function var_0_0.SpawnPrefab(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	if var_0_1[arg_5_1] == nil then
		var_0_1[arg_5_1] = import(string.format("game.qworld.prefab.%s", arg_5_1))
	end

	if arg_5_2 == nil then
		arg_5_2 = 0
	end

	local var_5_0 = var_0_1[arg_5_1]

	if var_5_0 then
		local var_5_1 = var_5_0.fn(arg_5_2, arg_5_3)

		if var_5_1 ~= nil then
			var_5_1.entityId = arg_5_2

			arg_5_0:RaiseOnSpawnEntity(var_5_1)

			local var_5_2 = var_5_1.entity.uniqueId

			return arg_5_0.Ents[var_5_2]
		else
			print("Failed to spawn", arg_5_1)

			return nil
		end
	end
end

function var_0_0.CreateEntity(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = QWorldLuaBridge.CreateMapEntity(arg_6_1, arg_6_2)
	local var_6_1 = var_6_0.uniqueId
	local var_6_2 = QWorldEntiyScript.New(var_6_0, arg_6_2, arg_6_1)

	arg_6_0.Ents[var_6_1] = var_6_2
	arg_6_0._Ents4EntityId[arg_6_1] = var_6_2

	return var_6_2
end

function var_0_0.GetEntByEntityId(arg_7_0, arg_7_1)
	return arg_7_0._Ents4EntityId[arg_7_1]
end

function var_0_0.RegistSpawnEntityAfterQuest(arg_8_0, arg_8_1, arg_8_2)
	if arg_8_0.spawn_after_quest_entitys[arg_8_1] == nil then
		arg_8_0.spawn_after_quest_entitys[arg_8_1] = {}
	end

	table.insert(arg_8_0.spawn_after_quest_entitys[arg_8_1], arg_8_2)
end

function var_0_0.OnQuestFinish(arg_9_0, arg_9_1)
	if arg_9_0.spawn_after_quest_entitys[arg_9_1] then
		for iter_9_0, iter_9_1 in ipairs(arg_9_0.spawn_after_quest_entitys[arg_9_1]) do
			QWorldSpawnPrefabByEntityId(iter_9_1)
		end

		arg_9_0.spawn_after_quest_entitys[arg_9_1] = nil
	end
end

function var_0_0.GetMiniMapBoardList(arg_10_0)
	local var_10_0 = {}

	for iter_10_0, iter_10_1 in pairs(arg_10_0.Ents) do
		if iter_10_1.miniMapUnit then
			local var_10_1 = iter_10_1.miniMapUnit:GetBoardDict()

			for iter_10_2, iter_10_3 in pairs(var_10_1) do
				table.insert(var_10_0, iter_10_3)
			end
		end
	end

	table.sort(var_10_0, function(arg_11_0, arg_11_1)
		if arg_11_0.tag == arg_11_1.tag and QWorldEntityMiniMapTag.Hud == arg_11_0.tag then
			local var_11_0 = SandplayTagCfg[arg_11_0.param]
			local var_11_1 = SandplayTagCfg[arg_11_1.param]

			if var_11_0.sort ~= var_11_1.sort then
				return var_11_0.sort > var_11_1.sort
			else
				return arg_11_0.param < arg_11_1.param
			end
		end

		return arg_11_0.tag > arg_11_1.tag
	end)

	return var_10_0
end

function var_0_0.TrackId(arg_12_0, arg_12_1)
	if table.indexof(arg_12_0.track_quest_entity_id_list, arg_12_1) then
		return
	end

	arg_12_0.track_entity_id = arg_12_1

	arg_12_0:UpdateTrack()
end

function var_0_0.TrackQuest(arg_13_0, arg_13_1)
	if table.indexof(arg_13_1, arg_13_0.track_entity_id) then
		arg_13_0.track_entity_id = 0
	end

	arg_13_0.track_quest_entity_id_list = arg_13_1

	arg_13_0:UpdateTrack()
end

function var_0_0.IsTrack(arg_14_0, arg_14_1)
	if arg_14_1 == arg_14_0.track_entity_id then
		return true
	end

	return table.indexof(arg_14_0.track_quest_entity_id_list, arg_14_1)
end

function var_0_0.RemoveTrack(arg_15_0, arg_15_1)
	if arg_15_1 == arg_15_0.track_entity_id then
		arg_15_0.track_entity_id = 0

		arg_15_0:UpdateTrack()

		return
	end

	local var_15_0 = table.indexof(arg_15_0.track_quest_entity_id_list, arg_15_1)

	if var_15_0 then
		table.remove(arg_15_0.track_quest_entity_id_list, var_15_0)
		arg_15_0:UpdateTrack()

		return
	end
end

function var_0_0.CancelTrack(arg_16_0, arg_16_1)
	if arg_16_1 == arg_16_0.track_entity_id then
		arg_16_0.track_entity_id = 0

		arg_16_0:UpdateTrack()

		return
	end

	if table.indexof(arg_16_0.track_quest_entity_id_list, arg_16_1) then
		local var_16_0 = QWorldQuestTool.GetMainQuestTrackingId()

		QWorldQuestAction.UpdateTrackingMainQuestId(-1)

		if var_16_0 ~= -1 then
			QWorldQuestAction.SendUpdateQuestTrackToSdk(var_16_0, QWorldQuestConst.SDK_QUEST_TRACK_TYPE.UNTRACK)
		end
	end
end

function var_0_0.SetTrackEnable(arg_17_0, arg_17_1, arg_17_2)
	local var_17_0 = table.indexof(arg_17_0.track_disable_id_list, arg_17_1)

	if arg_17_2 then
		if var_17_0 then
			table.remove(arg_17_0.track_disable_id_list, var_17_0)

			if table.indexof(arg_17_0.track_quest_entity_id_list, arg_17_1) then
				arg_17_0:UpdateTrack()
			end
		end
	elseif not var_17_0 then
		table.insert(arg_17_0.track_disable_id_list, arg_17_1)

		if table.indexof(arg_17_0.track_quest_entity_id_list, arg_17_1) then
			arg_17_0:UpdateTrack()
		end
	end
end

function var_0_0.GetTrackEntityIds(arg_18_0)
	if arg_18_0.track_entity_id == 0 and #arg_18_0.track_quest_entity_id_list == 0 then
		return {}
	elseif arg_18_0.track_entity_id == 0 then
		if #arg_18_0.track_disable_id_list > 0 then
			local var_18_0 = {}

			for iter_18_0, iter_18_1 in ipairs(arg_18_0.track_quest_entity_id_list) do
				if not table.indexof(arg_18_0.track_disable_id_list, iter_18_1) then
					table.insert(var_18_0, iter_18_1)
				end
			end

			return var_18_0
		else
			return arg_18_0.track_quest_entity_id_list
		end
	else
		local var_18_1 = {}

		table.insert(var_18_1, arg_18_0.track_entity_id)

		for iter_18_2, iter_18_3 in ipairs(arg_18_0.track_quest_entity_id_list) do
			if not table.indexof(arg_18_0.track_disable_id_list, iter_18_3) then
				table.insert(var_18_1, iter_18_3)
			end
		end

		return var_18_1
	end
end

function var_0_0.UpdateTrack(arg_19_0)
	QWorldLuaBridge.TrackMapEntity(arg_19_0:GetTrackEntityIds())
	manager.notify:CallUpdateFunc(QWORLD_TRACK_UPDATE)
end

function var_0_0.RebuildEntity(arg_20_0, arg_20_1)
	for iter_20_0, iter_20_1 in pairs(arg_20_0.Ents) do
		if iter_20_1.type == arg_20_1 and iter_20_1.thingCfg and iter_20_1.thingCfg.model_path and iter_20_1.thingCfg.model_path ~= "" then
			iter_20_1.entity:SetBuild(iter_20_1.thingCfg.model_path)
		end
	end
end

function var_0_0.RaiseOnSpawnEntity(arg_21_0, arg_21_1)
	if QWorldMgr:GetQWorldQuestMgr() then
		QWorldMgr:GetQWorldQuestMgr():OnSpawnEntity(arg_21_1)
	end
end

function var_0_0.RaiseOnRemoveEntity(arg_22_0, arg_22_1)
	if QWorldMgr:GetQWorldQuestMgr() then
		QWorldMgr:GetQWorldQuestMgr():OnRemoveEntity(arg_22_1)
	end
end

return var_0_0
