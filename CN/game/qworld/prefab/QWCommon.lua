local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = QWorldMgr:GetQWorldEntityMgr():CreateEntity(arg_1_0, QWORLD_ENTITY_TYPE.DEFAULT)

	var_1_0:AnalyThingCfg(arg_1_1)

	return var_1_0
end

return QWorldPrefab.New("QWCommon", var_0_0)
