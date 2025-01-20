local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = QWorldMgr:GetQWorldEntityMgr():CreateEntity(arg_1_0, QWORLD_ENTITY_TYPE.ZONE)

	var_1_0.isZone = true

	var_1_0:AnalyThingCfg(arg_1_1)

	function var_1_0.CreateMiniMapEntity()
		local var_2_0 = QWorldEntityMiniMap.New(var_1_0)

		var_2_0:SetMiniType(1)

		return var_2_0
	end

	return var_1_0
end

return QWorldPrefab.New("QWZone", var_0_0)
