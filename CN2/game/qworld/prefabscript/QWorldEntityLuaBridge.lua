function QWorldSpawnPrefab(arg_1_0, arg_1_1, arg_1_2)
	return (QWorldMgr:GetQWorldEntityMgr():SpawnPrefab(arg_1_0, arg_1_1, arg_1_2))
end

function QWorldSpawnPrefabAterQuestId(arg_2_0, arg_2_1)
	local var_2_0 = QWorldQuestData:GetQuestData(arg_2_0)

	if var_2_0 and var_2_0.status == QWorldQuestConst.QUEST_STATUS.FINISH then
		QWorldSpawnPrefabByEntityId(arg_2_1)
	else
		QWorldMgr:GetQWorldEntityMgr():RegistSpawnEntityAfterQuest(arg_2_0, arg_2_1)
	end
end

function QWorldSpawnPrefabByEntityId(arg_3_0)
	if QWorldMgr:GetQWorldEntityMgr():GetEntByEntityId(arg_3_0) ~= nil then
		return true
	end

	local var_3_0 = QWorldLuaBridge.GetMapEntityData(arg_3_0)

	if var_3_0 == nil then
		return false
	end

	QWorldSpawnPrefab(var_3_0.script_name, var_3_0.id, var_3_0.configId)
	manager.notify:CallUpdateFunc(QWORLD_TRACK_UPDATE)

	return true
end

function QWorldRemovePrefabByEntityId(arg_4_0)
	local var_4_0 = QWorldMgr:GetQWorldEntityMgr():GetEntByEntityId(arg_4_0)

	if var_4_0 ~= nil then
		var_4_0:Remove()

		return true
	end

	return false
end

function QWBoxTriggerAreaFunc(arg_5_0, arg_5_1)
	local var_5_0 = QWorldMgr:GetQWorldEntityMgr():GetEnt(arg_5_0)

	if var_5_0 and var_5_0.OnQWBoxTriggerArea then
		var_5_0:OnQWBoxTriggerArea(arg_5_1)
	end
end
