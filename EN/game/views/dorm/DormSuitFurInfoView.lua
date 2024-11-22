local var_0_0 = class("DormSuitFurInfoView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/BackHouseUI/Dorm/DormSuitPreviewUI"
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

	arg_5_0.scrollHelper_ = LuaList.New(handler(arg_5_0, arg_5_0.indexItem), arg_5_0.uilistGo_, FurnitureItem)
end

function var_0_0.OnEnter(arg_6_0)
	arg_6_0.suitID = arg_6_0.params_.suitID
	arg_6_0.templateID = arg_6_0.params_.templateID

	arg_6_0:RefreshView()
	arg_6_0:RegisterEvents()
end

function var_0_0.OnExit(arg_7_0)
	arg_7_0:RemoveAllEventListener()
end

function var_0_0.AddUIListener(arg_8_0)
	arg_8_0:AddBtnListenerScale(arg_8_0.useBtn_, nil, function()
		if arg_8_0.suitID then
			arg_8_0:UseSuit()
		elseif arg_8_0.templateID then
			arg_8_0:UseTemplate()
		end

		arg_8_0.params_.suitID = nil
		arg_8_0.params_.templateID = nil
	end)
	arg_8_0:AddBtnListenerScale(arg_8_0.cancelBtn_, nil, function()
		if arg_8_0.suitID then
			DormSuitEditData:RecoverSceneBeforeEdit()
		elseif arg_8_0.templateID then
			local var_10_0 = DormData:GetCurrectSceneID()

			DormFurnitureTemplateData:CancelPreviewDormSceneTemplate(var_10_0)
		end

		JumpTools.Back()

		arg_8_0.params_.suitID = nil
		arg_8_0.params_.templateID = nil
	end)
end

function var_0_0.UseSuit(arg_11_0)
	local var_11_0 = DormData:GetCurrectSceneID()

	if DormSuitData:CheckSuitCanUseInRoom(arg_11_0.suitID, var_11_0) then
		local var_11_1 = DormData:GetCurrectSceneID()
		local var_11_2 = DormSuitData:GetSuitFurInfo(arg_11_0.suitID)
		local var_11_3 = {
			furInfoList = var_11_2.furList,
			specialInfo = var_11_2.specialFur
		}

		DormAction:SetFurListInMap(var_11_1, nil, var_11_3)
		DormLuaBridge.ChangeCameraMode(0, true)
		DormFurEditStateData:ExitEditState()
		DormSuitEditData:ExitFullSuitEditMode()
		DormHeroTools:GenerateHeroWhenEnterScene()
		JumpTools.OpenPageByJump("/dorm")
		SDKTools.SendMessageToSDK("backhome_dorm_edit", {
			suit_list = {
				arg_11_0.suitID
			}
		})
		ShowTips("DORM_SUIT_USE_SUCCEED")
	else
		ShowTips("DORM_SUIT_FURNTTURE_NUM_LACK")
	end
end

function var_0_0.UseTemplate(arg_12_0)
	local var_12_0 = DormData:GetCurrectSceneID()
	local var_12_1, var_12_2 = DormFurnitureTemplateData:CheckFurNumSuitTemplate(arg_12_0.templateID, var_12_0)

	if not var_12_1 then
		ShowMessageBox({
			isTop = true,
			content = GetTips("DORM_MOULD_NOT_ENOUGH"),
			OkCallback = function()
				local var_13_0, var_13_1 = DormFurnitureTemplateData:ReduceTemplateLackFurInfoS(arg_12_0.templateID, var_12_2)

				DormFurnitureTools:GenFurListInCurRoom(var_13_0)
				DormSpecialFurnitureTools:ChangeDormFloorOrWallData(var_13_1)

				local var_13_2 = {
					furInfoList = var_13_0,
					specialInfo = var_13_1
				}

				DormFurnitureTemplateData:ConfirmUseTemplateInRoom(arg_12_0.templateID, var_12_0, var_12_1, var_13_2)
				JumpTools.OpenPageByJump("/dorm")
				DormHeroTools:GenerateHeroWhenEnterScene()
				ShowTips(GetTips("DORM_MOULD_SET_SUCCESS"))
			end,
			CancelCallback = function()
				return
			end
		})
	else
		DormFurnitureTemplateData:ConfirmUseTemplateInRoom(arg_12_0.templateID, var_12_0, var_12_1)
		JumpTools.OpenPageByJump("/dorm")
		DormHeroTools:GenerateHeroWhenEnterScene()
		ShowTips(GetTips("DORM_MOULD_SET_SUCCESS"))
	end
end

function var_0_0.RefreshView(arg_15_0)
	arg_15_0:RefreshFurInfoList()
end

function var_0_0.OnTop(arg_16_0)
	arg_16_0.scrollHelper_:Refresh()
end

function var_0_0.RegisterEvents(arg_17_0)
	arg_17_0:RegistEventListener(DORM_REFRESH_GIFT_FUR_LIST, function(arg_18_0)
		if arg_17_0.selIndex then
			local var_18_0 = arg_17_0.scrollHelper_:GetItemByIndex(arg_17_0.selIndex)

			if arg_17_0.suitID then
				var_18_0:RefreshUI(arg_17_0.furInfoList[arg_17_0.selIndex], nil, DormEnum.FurItemType.SuitFurShow, nil, arg_17_0.selIndex)
			elseif arg_17_0.templateID then
				var_18_0:RefreshUI(arg_17_0.furInfoList[arg_17_0.selIndex], nil, DormEnum.FurItemType.TemplateShow, nil, arg_17_0.selIndex)
			end
		end
	end)
end

function var_0_0.RefreshFurInfoList(arg_19_0)
	local var_19_0 = DormData:GetCurrectSceneID()

	arg_19_0.furInfoList = {}

	if arg_19_0.suitID then
		local var_19_1 = BackHomeSuitCfg[arg_19_0.suitID].suit_num

		for iter_19_0, iter_19_1 in ipairs(var_19_1) do
			local var_19_2 = {
				furID = iter_19_1[1],
				suitID = arg_19_0.suitID
			}

			table.insert(arg_19_0.furInfoList, var_19_2)
		end

		arg_19_0.scrollHelper_:StartScroll(#arg_19_0.furInfoList)

		arg_19_0.suitName.text = ItemCfg[arg_19_0.suitID].name or ""
	elseif arg_19_0.templateID then
		local var_19_3 = DormFurnitureTemplateData:GetDormTemplateInfo(arg_19_0.templateID)
		local var_19_4 = var_19_3.furnitureInfoS
		local var_19_5 = {}

		for iter_19_2 = 0, var_19_4.Length - 1 do
			var_19_5[var_19_4[iter_19_2].id] = var_19_5[var_19_4[iter_19_2].id] or 0
			var_19_5[var_19_4[iter_19_2].id] = var_19_5[var_19_4[iter_19_2].id] + 1
		end

		local var_19_6 = var_19_3.specialFur

		for iter_19_3, iter_19_4 in pairs(var_19_6) do
			var_19_5[iter_19_4] = var_19_5[iter_19_4] or 0
			var_19_5[iter_19_4] = var_19_5[iter_19_4] + 1
		end

		for iter_19_5, iter_19_6 in pairs(var_19_5) do
			local var_19_7 = {
				furID = iter_19_5,
				needNum = iter_19_6
			}

			table.insert(arg_19_0.furInfoList, var_19_7)
		end

		arg_19_0.scrollHelper_:StartScroll(#arg_19_0.furInfoList)

		arg_19_0.suitName.text = var_19_3:GetTemplateName() or ""
	end
end

function var_0_0.indexItem(arg_20_0, arg_20_1, arg_20_2)
	if arg_20_0.suitID then
		arg_20_2:RefreshUI(arg_20_0.furInfoList[arg_20_1], nil, DormEnum.FurItemType.SuitFurShow, nil, arg_20_1)
	elseif arg_20_0.templateID then
		arg_20_2:RefreshUI(arg_20_0.furInfoList[arg_20_1], nil, DormEnum.FurItemType.TemplateShow, nil, arg_20_1)
	end

	arg_20_2:OnClickBtn(function(arg_21_0, arg_21_1, arg_21_2, arg_21_3, arg_21_4)
		local var_21_0 = DormData:GetFurNumInfo(arg_21_0)

		arg_20_0.selIndex = arg_21_1

		local var_21_1 = 0

		if arg_21_3 == "enough" then
			if var_21_0 then
				var_21_1 = var_21_0.num
			end

			ShowPopItem(POP_ITEM, {
				arg_21_0,
				var_21_1
			})
		elseif arg_21_3 == "canGift" then
			JumpTools.OpenPageByJump("dormFurBuyAndGiftView", {
				state = "gift",
				furID = arg_21_0,
				needNum = arg_21_4,
				defaultNum = arg_21_4
			})
		elseif arg_21_3 == "noEnough" then
			local var_21_2 = {}
			local var_21_3 = ShopListCfg[ShopConst.SHOP_ID.FURNITURE_SHOP].display_group

			for iter_21_0, iter_21_1 in ipairs(ShopListCfg.all) do
				if ShopListCfg[iter_21_1].display_group == var_21_3 then
					table.insert(var_21_2, iter_21_1)
				end
			end

			local var_21_4 = getGoodListByGiveID(arg_21_0)
			local var_21_5 = false
			local var_21_6

			for iter_21_2, iter_21_3 in ipairs(var_21_4) do
				for iter_21_4, iter_21_5 in ipairs(var_21_2) do
					if ShopTools.IsGoodCanBuy(iter_21_5, iter_21_3) then
						var_21_5 = true

						local var_21_7 = iter_21_3

						break
					end
				end
			end

			if var_21_5 then
				JumpTools.OpenPageByJump("dormFurBuyAndGiftView", {
					state = "buy",
					furID = arg_21_0,
					needNum = arg_21_4,
					defaultNum = arg_21_4
				})
			else
				ShowPopItem(POP_ITEM, {
					arg_21_0,
					var_21_1
				})
			end
		end
	end)
	arg_20_2:GrayCallBack(function(arg_22_0, arg_22_1, arg_22_2, arg_22_3, arg_22_4)
		arg_20_0.selIndex = arg_22_1

		JumpTools.OpenPageByJump("dormFurBuyAndGiftView", {
			state = "gift",
			furID = arg_22_0,
			needNum = arg_22_4,
			defaultNum = arg_22_4
		})
	end)
end

function var_0_0.Dispose(arg_23_0)
	if arg_23_0.scrollHelper_ then
		arg_23_0.scrollHelper_:Dispose()
	end

	var_0_0.super.Dispose(arg_23_0)
end

return var_0_0
