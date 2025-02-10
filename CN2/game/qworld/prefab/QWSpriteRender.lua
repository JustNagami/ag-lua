local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = QWorldMgr:GetQWorldEntityMgr():CreateEntity(arg_1_0, QWORLD_ENTITY_TYPE.DEFAULT)
	local var_1_1 = Asset.Instantiate("QWWorld/Game/Props_lattice_wall_1")

	var_1_1.transform.parent = var_1_0:GetTransform()
	var_1_1.transform.localPosition = Vector3.zero
	var_1_1.transform.localRotation = Quaternion.identity
	var_1_1:GetComponent("SpriteRenderer").size = QWorldLuaBridge.GetMapEntityData(arg_1_0).size

	return var_1_0
end

return QWorldPrefab.New("QWSpriteRender", var_0_0)
