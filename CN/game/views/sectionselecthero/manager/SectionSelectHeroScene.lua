local var_0_0 = singletonClass("SectionSelectHeroScene")

function var_0_0.Ctor(arg_1_0)
	arg_1_0.posStateControllerList_ = {}
	arg_1_0.posStateGoList_ = {}
	arg_1_0.needChangeEffect = false
	arg_1_0.needChangeEffectList_ = {}

	arg_1_0:ResetModelParams()
end

function var_0_0.ResetModelParams(arg_2_0)
	arg_2_0.skinIDList_ = {}
	arg_2_0.charModelList_ = {}
	arg_2_0.loadingTaskList_ = {}
end

function var_0_0.SetNeedChangeEffect(arg_3_0, arg_3_1)
	arg_3_0.needChangeEffect = arg_3_1 == true
	arg_3_0.needChangeEffectList_ = {}
end

function var_0_0.LoadHeroModels(arg_4_0, arg_4_1)
	if not arg_4_1 then
		return
	end

	for iter_4_0, iter_4_1 in ipairs(arg_4_0.skinIDList_) do
		if arg_4_1[iter_4_0] ~= iter_4_1 then
			arg_4_0:StopLoadTargetModel(iter_4_0)
			arg_4_0:DestroyTargetModel(iter_4_0)
		end
	end

	for iter_4_2, iter_4_3 in pairs(arg_4_1) do
		arg_4_0:LoadTargetModel(iter_4_2, iter_4_3)
	end

	if not arg_4_0:IsLoadingModel() then
		arg_4_0:OnAllModelLoadEnd()
	end

	arg_4_0:SetALlStateGoActive(true)
end

function var_0_0.LoadTargetModel(arg_5_0, arg_5_1, arg_5_2)
	if arg_5_0.skinIDList_[arg_5_1] == arg_5_2 then
		return
	end

	arg_5_0.skinIDList_[arg_5_1] = arg_5_2

	if arg_5_0.charModelList_[arg_5_1] then
		arg_5_0:DestroyTargetModel(arg_5_1)
	end

	if not arg_5_2 or not SkinCfg[arg_5_2] then
		return
	end

	arg_5_0:StartLoadModel(arg_5_2, arg_5_1)
end

function var_0_0.StartLoadModel(arg_6_0, arg_6_1, arg_6_2)
	manager.ui:UIEventEnabled(false)
	arg_6_0:StopLoadTargetModel(arg_6_2)

	local var_6_0 = {
		skinID = arg_6_1
	}

	arg_6_0.loadingTaskList_[arg_6_2] = var_6_0

	local var_6_1 = SkinCfg[arg_6_1]

	arg_6_0.loadingTaskList_[arg_6_2].loadAsyncIndex = manager.resourcePool:AsyncLoad("Char/" .. var_6_1.ui_modelId, ASSET_TYPE.TPOSE, function(arg_7_0)
		SetActive(arg_7_0, false)
		arg_6_0:InitModel(arg_7_0, arg_6_2)
		arg_6_0:OnTargetModelLoadEnd(arg_7_0, arg_6_2)
	end)
end

function var_0_0.OnTargetModelLoadEnd(arg_8_0, arg_8_1, arg_8_2)
	arg_8_0.loadingTaskList_[arg_8_2] = nil

	if arg_8_0.needChangeEffect then
		arg_8_0.needChangeEffectList_[arg_8_2] = true
	end

	if not arg_8_0:IsLoadingModel() then
		arg_8_0:OnAllModelLoadEnd()
	end
end

function var_0_0.OnAllModelLoadEnd(arg_9_0)
	for iter_9_0, iter_9_1 in pairs(arg_9_0.charModelList_) do
		SetActive(iter_9_1, true)

		if arg_9_0.needChangeEffectList_[iter_9_0] then
			arg_9_0:PlayModelChangeEffect(iter_9_1)
		end
	end

	arg_9_0.needChangeEffectList_ = {}

	manager.ui:UIEventEnabled(true)
	manager.notify:Invoke(SECTION_HERO_MODEL_LOADED)
end

function var_0_0.DestroyModels(arg_10_0)
	arg_10_0:OnlyDestoryModels()
	arg_10_0:ResetModelParams()
	arg_10_0:SetNeedChangeEffect(false)
end

function var_0_0.OnlyDestoryModels(arg_11_0)
	arg_11_0:StopLoadModel()

	for iter_11_0, iter_11_1 in pairs(arg_11_0.charModelList_) do
		arg_11_0:DestroyTargetModel(iter_11_0)
	end
end

function var_0_0.StopLoadModel(arg_12_0)
	manager.ui:UIEventEnabled(true)

	for iter_12_0, iter_12_1 in pairs(arg_12_0.loadingTaskList_) do
		arg_12_0:StopLoadTargetModel(iter_12_0)
	end
end

function var_0_0.StopLoadTargetModel(arg_13_0, arg_13_1)
	if arg_13_0.loadingTaskList_[arg_13_1] then
		manager.resourcePool:StopAsyncQuest(arg_13_0.loadingTaskList_[arg_13_1].loadAsyncIndex)

		arg_13_0.loadingTaskList_[arg_13_1] = nil
	end
end

function var_0_0.DestroyTargetModel(arg_14_0, arg_14_1)
	local var_14_0 = arg_14_0.charModelList_[arg_14_1]

	if var_14_0 then
		manager.resourcePool:DestroyOrReturn(var_14_0, ASSET_TYPE.TPOSE)
	end

	arg_14_0.charModelList_[arg_14_1] = nil
end

function var_0_0.IsLoadingModel(arg_15_0)
	return table.nums(arg_15_0.loadingTaskList_) > 0
end

function var_0_0.InitModel(arg_16_0, arg_16_1, arg_16_2)
	arg_16_0.charModelList_[arg_16_2] = arg_16_1

	arg_16_0:InitModelTransform(arg_16_1, arg_16_2)
end

function var_0_0.InitModelTransform(arg_17_0, arg_17_1, arg_17_2)
	if arg_17_1 then
		arg_17_1.transform.localEulerAngles = SectionSelectHeroConst.HeroModelTransform[arg_17_2].rotation
		arg_17_1.transform.localPosition = SectionSelectHeroConst.HeroModelTransform[arg_17_2].position
		arg_17_1.transform.localScale = SectionSelectHeroConst.HeroModelTransform[arg_17_2].scale
	end
end

function var_0_0.PlayModelChangeEffect(arg_18_0, arg_18_1)
	LuaForUtil.PlayEffect(arg_18_1.transform, SectionSelectHeroConst.HERO_CHANGE_FX_PATH, Vector3(0, 0, 0), Vector3(1, 1, 1), Vector3(0, 0, 0), Vector3(0, 0, 0), false, 1, 0, 0.8)
end

function var_0_0.ReorderModelByPosList(arg_19_0, arg_19_1)
	local var_19_0 = {}
	local var_19_1 = {}

	for iter_19_0, iter_19_1 in pairs(arg_19_1) do
		local var_19_2 = arg_19_0.charModelList_[iter_19_1]

		var_19_1[iter_19_0], var_19_0[iter_19_0] = arg_19_0.skinIDList_[iter_19_1], var_19_2

		arg_19_0:InitModelTransform(var_19_2, iter_19_0)
	end

	arg_19_0.charModelList_ = var_19_0
	arg_19_0.skinIDList_ = var_19_1
end

function var_0_0.GetModel(arg_20_0, arg_20_1)
	return arg_20_0.charModelList_[arg_20_1]
end

function var_0_0.GetModelLocalPosition(arg_21_0, arg_21_1)
	if arg_21_0.charModelList_[arg_21_1] then
		return arg_21_0.charModelList_[arg_21_1].transform.localPosition
	else
		return nil
	end
end

function var_0_0.SetModelLocalPosition(arg_22_0, arg_22_1, arg_22_2)
	if arg_22_0.charModelList_[arg_22_1] then
		arg_22_0.charModelList_[arg_22_1].transform.localPosition = arg_22_2
	end
end

function var_0_0.OnlyDisplayModel(arg_23_0, arg_23_1)
	for iter_23_0, iter_23_1 in pairs(arg_23_0.charModelList_) do
		SetActive(iter_23_1, iter_23_0 == arg_23_1)
	end
end

function var_0_0.DisplayAllModel(arg_24_0)
	for iter_24_0, iter_24_1 in pairs(arg_24_0.charModelList_) do
		SetActive(iter_24_1, true)
	end
end

function var_0_0.GetModelPowerPointScreenPos(arg_25_0, arg_25_1)
	if arg_25_0.charModelList_[arg_25_1] then
		local var_25_0 = arg_25_0.charModelList_[arg_25_1]:GetHeorModelAttachPointTrans("Bip001 Head")

		if var_25_0 then
			local var_25_1 = UnityEngine.Camera.main:WorldToScreenPoint(var_25_0.position)

			var_25_1.y = var_25_1.y + SectionSelectHeroConst.SCREEN_OFFSET_OF_HERO_INFO_ITEM

			return var_25_1
		end
	end

	return nil
end

function var_0_0.RefreshPositionState(arg_26_0, arg_26_1, arg_26_2)
	if isNil(arg_26_0.posStateControllerList_[arg_26_1]) then
		arg_26_0:RebindController(arg_26_1)
	end

	if not isNil(arg_26_0.posStateControllerList_[arg_26_1]) then
		arg_26_0.posStateControllerList_[arg_26_1]:SetSelectedState(arg_26_2)
	end
end

function var_0_0.RebindController(arg_27_0, arg_27_1)
	local var_27_0 = arg_27_0:GetStateGo(arg_27_1)

	if var_27_0 then
		arg_27_0.posStateControllerList_[arg_27_1] = var_27_0:GetComponent("ControllerExCollection"):GetController("state")
	end
end

function var_0_0.SetALlStateGoActive(arg_28_0, arg_28_1)
	for iter_28_0 = 1, 3 do
		local var_28_0 = arg_28_0:GetStateGo(iter_28_0)

		SetActive(var_28_0, arg_28_1)
	end
end

function var_0_0.GetStateGo(arg_29_0, arg_29_1)
	if isNil(arg_29_0.posStateGoList_[arg_29_1]) then
		local var_29_0 = GameObject.Find(string.format("X104/X104_SceneSteps/X104_Formation_HeroPos_%s", arg_29_1))

		arg_29_0.posStateGoList_[arg_29_1] = var_29_0
	end

	return arg_29_0.posStateGoList_[arg_29_1]
end

function var_0_0.GetStateGoScreenPos(arg_30_0, arg_30_1)
	local var_30_0 = arg_30_0:GetStateGo(arg_30_1)

	if var_30_0 then
		return UnityEngine.Camera.main:WorldToScreenPoint(var_30_0.transform.position)
	end

	return nil
end

return var_0_0
