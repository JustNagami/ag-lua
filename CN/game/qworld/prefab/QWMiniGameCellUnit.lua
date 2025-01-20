local var_0_0 = "Effect/Scene/fx_X510_Props_lattice_white_start"
local var_0_1 = "Effect/Scene/fx_X510_Props_lattice_white"
local var_0_2 = "Effect/Scene/fx_X510_Props_lattice_blue_02_start"
local var_0_3 = "Effect/Scene/fx_X510_Props_lattice_blue_02_loop"
local var_0_4 = "Effect/Scene/fx_X510_Props_lattice_blue_01"
local var_0_5 = "Effect/Scene/fx_X510_Props_lattice_red_start"
local var_0_6 = "Effect/Scene/fx_X510_Props_lattice_green_start"

local function var_0_7(arg_1_0)
	if not isNil(arg_1_0.localData.effect) then
		QWorldLuaBridge.DestroyQWorldAsset(arg_1_0.localData.effect)
	end

	arg_1_0.localData.effect = nil
end

local function var_0_8(arg_2_0, arg_2_1)
	var_0_7(arg_2_0)

	if not isNil(arg_2_0.entity) then
		local var_2_0 = Asset.Instantiate(arg_2_1)

		var_2_0.transform.position = arg_2_0:GetPosition()
		var_2_0.transform.rotation = arg_2_0:GetRotation()

		return var_2_0
	end
end

local function var_0_9(arg_3_0, arg_3_1)
	if arg_3_1 then
		arg_3_0:PushEvent("cell_state", {
			cell_uniqueId = arg_3_0.uniqueId
		})
	end
end

local function var_0_10(arg_4_0, arg_4_1)
	local var_4_0 = var_0_8(arg_4_0, var_0_2)

	QWorldLuaBridge.DestroyQWorldAsset(var_4_0, 1)

	arg_4_0.localData.effect = var_0_8(arg_4_0, var_0_3)
end

local function var_0_11(arg_5_0, arg_5_1)
	arg_5_0.localData.effect = var_0_8(arg_5_0, var_0_4)
end

local function var_0_12(arg_6_0, arg_6_1)
	local var_6_0 = var_0_8(arg_6_0, var_0_6)

	QWorldLuaBridge.DestroyQWorldAsset(var_6_0, 1)
end

local function var_0_13(arg_7_0, arg_7_1)
	local var_7_0 = var_0_8(arg_7_0, var_0_5)

	QWorldLuaBridge.DestroyQWorldAsset(var_7_0, 1)
end

local function var_0_14(arg_8_0)
	var_0_7(arg_8_0)
end

local function var_0_15(arg_9_0)
	arg_9_0.localData.effect = var_0_8(arg_9_0, var_0_0)

	local var_9_0

	var_9_0 = Timer.New(function()
		arg_9_0.localData.effect = var_0_8(arg_9_0, var_0_1)

		var_9_0:Stop()

		var_9_0 = nil
	end, 0.3, 1)

	var_9_0:Start()
end

local function var_0_16(arg_11_0, arg_11_1)
	local var_11_0 = QWorldMgr:GetQWorldEntityMgr():CreateEntity(arg_11_0, QWORLD_ENTITY_TYPE.DEFAULT)

	var_11_0:AnalyThingCfg(arg_11_1)
	var_11_0.entity:AddComponent("QWBoxTriggerArea")

	var_11_0.OnQWBoxTriggerArea = var_0_9

	var_11_0:ListenForEvent("cell_game_success", var_0_12)
	var_11_0:ListenForEvent("cell_game_fail", var_0_13)
	var_11_0:ListenForEvent("cell_correct", var_0_10)
	var_11_0:ListenForEvent("cell_correct_level", var_0_11)

	var_11_0.OnRemoveEntity = var_0_14

	var_0_15(var_11_0)

	return var_11_0
end

return QWorldPrefab.New("QWMiniGameCellUnit", var_0_16)
