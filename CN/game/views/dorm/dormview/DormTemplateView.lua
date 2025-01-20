local var_0_0 = class("DormTemplateView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/BackHouseUI/Dorm/DormEditschemeUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.OnCtor(arg_3_0)
	return
end

function var_0_0.Init(arg_4_0)
	arg_4_0:InitUI()
	arg_4_0:AddUIListener()
end

function var_0_0.InitUI(arg_5_0)
	arg_5_0:BindCfgUI()

	arg_5_0.scrollHelper_ = LuaList.New(handler(arg_5_0, arg_5_0.indexTemplate), arg_5_0.uilistUilist_, DormFurTemplateItem)
	arg_5_0.templateID = nil
	arg_5_0.choiceController = ControllerUtil.GetController(arg_5_0.shareswitchTrs_, "choice")
	arg_5_0.switchController = ControllerUtil.GetController(arg_5_0.shareswitchTrs_, "switch")
end

function var_0_0.OnEnter(arg_6_0)
	arg_6_0.canPreview = arg_6_0.params_.canPreview

	if arg_6_0.canPreview == nil then
		arg_6_0.canPreview = true
	end

	arg_6_0.pos = arg_6_0.params_.pos or arg_6_0.pos
	arg_6_0.params_.pos = nil

	arg_6_0:RefreshDormFurTemplateList()
	arg_6_0:RegisterEvents()

	arg_6_0.switchFlag = false

	arg_6_0:RefreshCanSaveView()
	arg_6_0:RefreshCanSaveFlag()
end

function var_0_0.OnExit(arg_7_0)
	arg_7_0:RemoveAllEventListener()
end

function var_0_0.AddUIListener(arg_8_0)
	arg_8_0:AddBtnListener(arg_8_0.bgmaskBtn_, nil, function()
		JumpTools.Back()
	end)
	arg_8_0:AddBtnListenerScale(arg_8_0.infoBtn_, nil, function()
		JumpTools.OpenPageByJump("gameHelp", {
			content = GetTips("DORM_TEMPLATE_GAME_HELP"),
			title = GetTips("DORM_TEMPLATE_GAME_TITLE")
		})
	end)
	arg_8_0:AddBtnListener(arg_8_0.switchBtn, nil, function()
		arg_8_0.switchFlag = not arg_8_0.switchFlag

		arg_8_0:RefreshCanSaveFlag()
	end)

	for iter_8_0 = 1, 2 do
		arg_8_0:AddToggleListener(arg_8_0["label_" .. iter_8_0 .. "Tgl_"], function(arg_12_0)
			if arg_12_0 then
				arg_8_0:SelectSaveType(iter_8_0)
			end
		end)
	end
end

function var_0_0.RegisterEvents(arg_13_0)
	arg_13_0:RegistEventListener(DORM_TEMPLATE_CHANGE, function()
		arg_13_0:RefreshDormFurTemplateList()
	end)
	arg_13_0:RegistEventListener(DOMR_RENAME_TEMPLATE_SUCCESS, function()
		arg_13_0:RefreshDormFurTemplateList()
	end)
	arg_13_0:RegistEventListener(DOMR_SAVE_FLAG_CHANGE, function()
		if DormFurnitureTemplateData:GetOtherCanSave() then
			arg_13_0.saveText.text = GetTips("DORM_TEMPLATE_SHAREABLE")
		else
			arg_13_0.saveText.text = GetTips("DORM_TEMPLATE_CANNOT_SHAREABLE")
		end

		ShowTips("DORM_SUCCESS_SET")
	end)
end

function var_0_0.indexTemplate(arg_17_0, arg_17_1, arg_17_2)
	arg_17_2:RefreshUI(arg_17_0.templateData[arg_17_1], arg_17_1, arg_17_0.canPreview)
	arg_17_2:RegisterUseTemplateCallBack(function(arg_18_0)
		if not arg_17_0.canPreview or arg_18_0 < 0 then
			ShowTips(GetTips("DORM_MOULD_CANT_USE"))

			return
		end

		local var_18_0 = DormData:GetCurrectSceneID()
		local var_18_1 = DormFurnitureTemplateData:GetDormTemplateInfo(arg_18_0)
		local var_18_2, var_18_3 = DormFurnitureTemplateData:CheckFurNumSuitTemplate(arg_18_0, var_18_0)

		DormHeroTools.HideAllCharacter()

		if not var_18_2 then
			ShowMessageBox({
				isTop = true,
				content = GetTips("DORM_MOULD_NOT_ENOUGH"),
				OkCallback = function()
					local var_19_0, var_19_1 = DormFurnitureTemplateData:ReduceTemplateLackFurInfoS(arg_18_0, var_18_3)

					DormFurnitureTools:GenFurListInCurRoom(var_19_0)
					DormSpecialFurnitureTools:ChangeDormFloorOrWallData(var_19_1)

					local var_19_2 = {
						furInfoList = var_19_0,
						specialInfo = var_19_1
					}

					DormFurnitureTemplateData:ConfirmUseTemplateInRoom(arg_18_0, var_18_0, var_18_2, var_19_2)
					ShowTips(GetTips("DORM_MOULD_SET_SUCCESS"))
					JumpTools.OpenPageByJump("/dorm")
					DormHeroTools:GenerateHeroWhenEnterScene()
				end,
				CancelCallback = function()
					return
				end
			})
		else
			if var_18_1 then
				local var_18_4 = var_18_1.furnitureInfoS

				DormFurnitureTools:GenFurListInCurRoom(var_18_4)
				DormSpecialFurnitureTools:ChangeDormFloorOrWallData(var_18_1.specialFur)
				DormFurnitureTemplateData:ConfirmUseTemplateInRoom(arg_18_0, var_18_0, var_18_2)
				ShowTips(GetTips("DORM_MOULD_SET_SUCCESS"))
				JumpTools.OpenPageByJump("/dorm")
			else
				print("未找到模板信息,id为" .. arg_18_0)
			end

			DormHeroTools:GenerateHeroWhenEnterScene()
		end
	end)
	arg_17_2:RegisterPreviewCallBack(function(arg_21_0, arg_21_1)
		if not arg_17_0.canPreview then
			ShowTips(GetTips("DORM_MOULD_CANT_USE"))

			return
		end

		if arg_21_0 < 0 then
			ShowTips(GetTips("DORM_MOULD_CANT_USE"))

			return
		end

		arg_17_0.pos = arg_21_1

		DormFurnitureTemplateData:PreviewDormSceneTemplate(arg_21_0)
		JumpTools.OpenPageByJump("/dormSuitFurInfoView", {
			templateID = arg_21_0
		})
	end)
	arg_17_2:SaveTemplateCallBack(function(arg_22_0, arg_22_1)
		local var_22_0 = DormData:GetCurrectSceneID()
		local var_22_1 = DormitoryData:GetDormSceneData(var_22_0)

		if arg_22_1 then
			arg_17_0.pos = arg_22_1

			if arg_22_0 > 0 then
				ShowMessageBox({
					isTop = true,
					content = GetTips("DORM_MOULD_COVER"),
					OkCallback = function()
						local var_23_0 = BackHomeCfg[var_22_0].type
						local var_23_1 = DormFurnitureTemplateData:GetDormTemplateInfo(arg_22_0):GetTemplateName()

						DormFurnitureTemplateData:SaveDormSceneTemplate(arg_22_0, var_23_0, var_23_1, var_22_0, arg_22_1)
					end,
					CancelCallback = function()
						return
					end
				})
			else
				local var_22_2 = BackHomeCfg[var_22_0].type
				local var_22_3 = string.format(GetTips("DORM_MOULD_DEFAULT_NAME"), tostring(arg_22_1))
				local var_22_4 = DormFurnitureTemplateData:GetCanUseTemplateID()

				DormFurnitureTemplateData:SaveDormSceneTemplate(var_22_4, var_22_2, var_22_3, var_22_0, arg_22_1)
			end
		end
	end)
	arg_17_2:ReviseNameCallBack(function(arg_25_0, arg_25_1)
		if arg_25_0 < 0 then
			ShowTips(GetTips("DORM_MOULD_DATA_NULL"))

			return
		end

		arg_17_0.pos = arg_25_1

		local function var_25_0(arg_26_0)
			DormAction:ReviseFurTemplateName(arg_25_0, arg_26_0)
		end

		JumpTools.OpenPageByJump("dormChangeTemplateNameView", {
			callBack = var_25_0,
			template_ID = arg_25_0,
			oldName = DormFurnitureTemplateData:GetDormTemplateInfo(arg_25_0).name,
			showText = GetTips("DORM_MOULD_NAME_SET_TIPS")
		})
	end)
	arg_17_2:DelTemplateCallBack(function(arg_27_0, arg_27_1)
		if arg_27_0 < 0 then
			ShowTips(GetTips("DORM_MOULD_DATA_NULL"))

			return
		end

		ShowMessageBox({
			isTop = true,
			content = GetTips("DORM_DELETE_TEMPLATE"),
			OkCallback = function()
				arg_17_0.pos = arg_27_1

				DormAction:DeleteFurTemplate(arg_27_0)
			end,
			CancelCallback = function()
				return
			end
		})
	end)
end

function var_0_0.RefreshDormFurTemplateList(arg_30_0)
	local var_30_0 = DormData:GetCurrectSceneID()
	local var_30_1 = BackHomeCfg[var_30_0].type

	if var_30_1 == DormConst.BACKHOME_TYPE.VISITPUBLICDORM then
		var_30_1 = DormConst.BACKHOME_TYPE.PublicDorm
	elseif var_30_1 == DormConst.BACKHOME_TYPE.VISITPRIVATEDORM then
		var_30_1 = DormConst.BACKHOME_TYPE.PrivateDorm
	end

	arg_30_0.templateData = {}

	local var_30_2

	if var_30_1 == DormConst.BACKHOME_TYPE.PublicDorm then
		var_30_2 = DormConst.DORM_TEMPLATE_NUM_MAX
	else
		var_30_2 = DormConst.DORM_TEMPLATE_PRIVATE_NUM_MAX
	end

	for iter_30_0 = 1, var_30_2 do
		local var_30_3 = DormFurnitureTemplateData:GetDormTemplateInfoByPosID(iter_30_0, var_30_1)

		if var_30_3 then
			table.insert(arg_30_0.templateData, var_30_3)
		else
			table.insert(arg_30_0.templateData, -1)
		end
	end

	arg_30_0.scrollHelper_:StartScroll(#arg_30_0.templateData)

	if arg_30_0.pos then
		arg_30_0.scrollHelper_:ScrollToIndex(arg_30_0.pos, true, false)
	end
end

function var_0_0.RefreshCanSaveView(arg_31_0)
	arg_31_0.tgl1.text = GetTips("DORM_TEMPLATE_CANNOT_SHAREABLE")
	arg_31_0.tgl2.text = GetTips("DORM_TEMPLATE_SHAREABLE")
end

function var_0_0.RefreshCanSaveFlag(arg_32_0)
	local var_32_0 = DormFurnitureTemplateData:GetOtherCanSave()

	if var_32_0 then
		arg_32_0.saveText.text = GetTips("DORM_TEMPLATE_SHAREABLE")
	else
		arg_32_0.saveText.text = GetTips("DORM_TEMPLATE_CANNOT_SHAREABLE")
	end

	if arg_32_0.switchFlag then
		arg_32_0.switchController:SetSelectedState("on")

		if var_32_0 then
			arg_32_0["label_" .. 2 .. "Tgl_"].isOn = true
		else
			arg_32_0["label_" .. 1 .. "Tgl_"].isOn = true
		end
	else
		arg_32_0.switchController:SetSelectedState("off")
	end
end

function var_0_0.SelectSaveType(arg_33_0, arg_33_1)
	local var_33_0 = DormFurnitureTemplateData:GetOtherCanSave()

	if arg_33_1 == 1 and var_33_0 then
		DormAction.SetFurnitureTemplatCanSave(false)
	elseif arg_33_1 == 2 and not var_33_0 then
		DormAction.SetFurnitureTemplatCanSave(true)
	end
end

function var_0_0.Dispose(arg_34_0)
	if arg_34_0.scrollHelper_ then
		arg_34_0.scrollHelper_:Dispose()

		arg_34_0.scrollHelper_ = nil
	end

	var_0_0.super.Dispose(arg_34_0)
end

return var_0_0
