local var_0_0 = class("RoomEditView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/BackHouseUI/Dorm/DormEditstatusUI"
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
	arg_5_0.choiceController = ControllerUtil.GetController(arg_5_0.screeningswitchTrs_, "choice")
	arg_5_0.switchController = ControllerUtil.GetController(arg_5_0.screeningswitchTrs_, "switch")
	arg_5_0.canPlaceController = ControllerUtil.GetController(arg_5_0.canPlace.transform, "name")
	arg_5_0.notPresentedController = ControllerUtil.GetController(arg_5_0.notPresented.transform, "name")
	arg_5_0.hadPlaceController = ControllerUtil.GetController(arg_5_0.hadPlace.transform, "name")
	arg_5_0.otherHadPlaceController = ControllerUtil.GetController(arg_5_0.otherHadPlace.transform, "name")
	arg_5_0.descController = ControllerUtil.GetController(arg_5_0.transform_, "desc")
	arg_5_0.descText.text = GetTips("DORM_FURNITURE_EDIT_INFO")
	arg_5_0.devController = ControllerUtil.GetController(arg_5_0.transform_, "devState")
	arg_5_0.suitController = ControllerUtil.GetController(arg_5_0.transform_, "suitPage")
end

function var_0_0.OnEnter(arg_6_0)
	arg_6_0.roomID = DormData:GetCurrectSceneID()
	arg_6_0.roomData = DormitoryData:GetDormSceneData(arg_6_0.roomID)

	DormLuaBridge.ChangeCameraMode(1, true)
	DormLuaBridge.SetIsCanEditTag(true)

	arg_6_0.selectIndex_ = arg_6_0.params_.index or DormConst.FLOOR_TYPE_NUM
	arg_6_0.params_.index = arg_6_0.selectIndex_
	arg_6_0.filterShow = false

	arg_6_0:RegisterEvents()
	arg_6_0:BindRedPoint()
end

function var_0_0.OnTop(arg_7_0)
	arg_7_0:RefreshView(true)
end

function var_0_0.OnExit(arg_8_0)
	arg_8_0:RemoveAllEventListener()
	arg_8_0:UnBindRedPoint()
end

function var_0_0.RegisterEvents(arg_9_0)
	arg_9_0:RegistEventListener(DORM_REFRESH_GIFT_FUR_LIST, function()
		if arg_9_0.scrollHelper_ then
			arg_9_0:RefreshView(true)
		end
	end)
end

function var_0_0.BindRedPoint(arg_11_0)
	for iter_11_0 = DormConst.DORM_FUR_TYPE_START, DormConst.DORM_FUR_TYPE_END - 1 do
		manager.redPoint:bindUIandKey(arg_11_0["item_" .. iter_11_0 .. "icon"], string.format("%s_%s", RedPointConst.DORM_FURNITURE, tostring(iter_11_0)))
	end

	manager.redPoint:bindUIandKey(arg_11_0["item_" .. 28 .. "icon"], RedPointConst.DORM_SUIT)

	local var_11_0 = BackHomeCfg[arg_11_0.roomID].type

	if var_11_0 == DormConst.BACKHOME_TYPE.PublicDorm then
		manager.redPoint:bindUIandKey(arg_11_0.suitBtn1.transform, RedPointConst.DORM_FULL_PUBLIC_SUIT)
	elseif var_11_0 == DormConst.BACKHOME_TYPE.PrivateDorm then
		manager.redPoint:bindUIandKey(arg_11_0.suitBtn1.transform, RedPointConst.DORM_FULL_PRIVATE_SUIT)
	end

	manager.redPoint:bindUIandKey(arg_11_0.suitBtn2.transform, RedPointConst.DORM_PART_SUIT)
end

function var_0_0.UnBindRedPoint(arg_12_0)
	for iter_12_0 = DormConst.DORM_FUR_TYPE_START, DormConst.DORM_FUR_TYPE_END - 1 do
		manager.redPoint:unbindUIandKey(arg_12_0["item_" .. iter_12_0 .. "icon"], string.format("%s_%s", RedPointConst.DORM_FURNITURE, tostring(iter_12_0)))
	end

	manager.redPoint:unbindUIandKey(arg_12_0["item_" .. 28 .. "icon"], RedPointConst.DORM_SUIT)

	local var_12_0 = BackHomeCfg[arg_12_0.roomID].type

	if var_12_0 == DormConst.BACKHOME_TYPE.PublicDorm then
		manager.redPoint:unbindUIandKey(arg_12_0.suitBtn1.transform, RedPointConst.DORM_FULL_PUBLIC_SUIT)
	elseif var_12_0 == DormConst.BACKHOME_TYPE.PrivateDorm then
		manager.redPoint:unbindUIandKey(arg_12_0.suitBtn1.transform, RedPointConst.DORM_FULL_PRIVATE_SUIT)
	end

	manager.redPoint:unbindUIandKey(arg_12_0.suitBtn2.gameObject.transform, RedPointConst.DORM_PART_SUIT)

	if arg_12_0.scrollHelper_ then
		local var_12_1 = arg_12_0.scrollHelper_:GetItemList()

		for iter_12_1, iter_12_2 in pairs(var_12_1) do
			manager.redPoint:unbindUIandKey(iter_12_2.transform_)
		end
	end
end

function var_0_0.RefreshView(arg_13_0, arg_13_1)
	arg_13_0:InitRoomCanUseFurList()
	arg_13_0:OnGroupSelect(arg_13_0.selectIndex_, arg_13_1)
	arg_13_0:UpdataHasPlaceFurNum()
	arg_13_0:RefreshEditTypeSwichBar()
	arg_13_0:RefreshDevInfo()
end

function var_0_0.UpdataHasPlaceFurNum(arg_14_0)
	local var_14_0 = DormFurnitureTools:GetHasPlaceFurNumInfoInMap(arg_14_0.roomID)
	local var_14_1 = DormFurEditStateData:GetCacheFurTotalNum()

	arg_14_0.curNum.text = var_14_0 + var_14_1 + DormConst.DORM_SPECIAL_FURNITURE_NUM

	local var_14_2 = 0

	if BackHomeCfg[arg_14_0.roomID].type == DormConst.BACKHOME_TYPE.PublicDorm then
		var_14_2 = GameSetting.dorm_lobby_furniture_limited.value[1]
	elseif BackHomeCfg[arg_14_0.roomID].type == DormConst.BACKHOME_TYPE.PrivateDorm then
		local var_14_3 = DormitoryData:GetDormLevel(arg_14_0.roomID)

		var_14_2 = BackHomeDormLevel[var_14_3].furniture_max
	end

	arg_14_0.totalNum.text = "/" .. var_14_2
end

function var_0_0.InitRoomCanUseFurList(arg_15_0)
	arg_15_0.furList = {}

	local var_15_0 = DormFurnitureTools:GetFurEditFlag()

	if var_15_0.canPlaceFlag then
		arg_15_0.canPlaceList = DormFurnitureTools:GetRoomCanPlaceFurList(arg_15_0.roomID)

		for iter_15_0, iter_15_1 in ipairs(arg_15_0.canPlaceList) do
			local var_15_1 = {
				furID = iter_15_1,
				type = DormConst.DORM_FUR_EDITVIEW_TYPE.CanPlace
			}

			table.insert(arg_15_0.furList, var_15_1)
		end
	end

	if var_15_0.notPresentedFlag then
		arg_15_0.notPresentedList = DormFurnitureTools:GetNotPresentedFurInRoom(arg_15_0.roomID)

		for iter_15_2, iter_15_3 in ipairs(arg_15_0.notPresentedList) do
			local var_15_2 = {
				furID = iter_15_3,
				type = DormConst.DORM_FUR_EDITVIEW_TYPE.NotPresented
			}

			table.insert(arg_15_0.furList, var_15_2)
		end
	end

	if var_15_0.hadPlaceFlag then
		arg_15_0.hadPlaceFurList = DormFurEditStateData:GetHadPlaceFurNumInRoom(arg_15_0.roomID)

		for iter_15_4, iter_15_5 in ipairs(arg_15_0.hadPlaceFurList) do
			local var_15_3 = {
				furID = iter_15_5,
				type = DormConst.DORM_FUR_EDITVIEW_TYPE.HadPlace
			}

			table.insert(arg_15_0.furList, var_15_3)
		end
	end

	if var_15_0.otherHadPlaceFlag then
		arg_15_0.otherHadPlaceFurList = DormFurnitureTools:GetHadPlaceFlagFurInRoom(arg_15_0.roomID)

		for iter_15_6, iter_15_7 in ipairs(arg_15_0.otherHadPlaceFurList) do
			local var_15_4 = {
				furID = iter_15_7,
				type = DormConst.DORM_FUR_EDITVIEW_TYPE.OtherHadPlace
			}

			table.insert(arg_15_0.furList, var_15_4)
		end
	end
end

function var_0_0.RefreshEditTypeSwichBar(arg_16_0)
	if arg_16_0.filterShow then
		arg_16_0.switchController:SetSelectedState("on")
		arg_16_0:RefreshFurEditTypeController()
	else
		arg_16_0.switchController:SetSelectedState("off")
	end

	local var_16_0 = DormFurnitureTools:GetFurEditFlag()

	for iter_16_0, iter_16_1 in pairs(var_16_0) do
		if not var_16_0[iter_16_0] then
			arg_16_0.choiceController:SetSelectedState("single")

			arg_16_0.singleTxt_.text = GetTips("ROLE_FILTERING")

			return
		end
	end

	arg_16_0.choiceController:SetSelectedState("all")

	arg_16_0.singleTxt_.text = GetTips("ALL")
end

function var_0_0.OnGroupSelect(arg_17_0, arg_17_1, arg_17_2)
	if arg_17_0.selectIndex_ == arg_17_1 and not arg_17_2 then
		return
	end

	arg_17_0:ClickCurSuitListRedPoint()
	arg_17_0.descController:SetSelectedState("false")

	arg_17_0.selectIndex_ = arg_17_1
	arg_17_0.params_.index = arg_17_0.selectIndex_
	arg_17_0["item_" .. arg_17_0.selectIndex_ .. "Tgl_"].isOn = true
	arg_17_0.dataList_ = {}

	if arg_17_0.selectIndex_ == DormConst.DORM_SUIT_TYPE then
		arg_17_0.suitController:SetSelectedState("true")
		arg_17_0:SelectEditSuitSetType(arg_17_0.suitTypeIndex or 1)
	else
		arg_17_0.selItem_ = nil

		arg_17_0.suitController:SetSelectedState("false")

		if arg_17_0.furList then
			for iter_17_0, iter_17_1 in ipairs(arg_17_0.furList) do
				if BackHomeFurniture[iter_17_1.furID].type == arg_17_1 then
					table.insert(arg_17_0.dataList_, iter_17_1)
				end
			end
		end

		arg_17_0.scrollHelper_:StartScroll(#arg_17_0.dataList_)

		if arg_17_0.selIndex then
			arg_17_0.scrollHelper_:ScrollToIndex(arg_17_0.selIndex, true, false)
		end

		arg_17_0.redPointList = {}

		for iter_17_2, iter_17_3 in ipairs(arg_17_0.dataList_) do
			if iter_17_3.type == DormConst.DORM_FUR_EDITVIEW_TYPE.CanPlace then
				table.insert(arg_17_0.redPointList, iter_17_3)
			end
		end

		DormRedPointTools:CloseDormFurRedPoint(arg_17_0.roomID, arg_17_0.selectIndex_, arg_17_0.redPointList)
	end
end

function var_0_0.indexItem(arg_18_0, arg_18_1, arg_18_2)
	if arg_18_0.selectIndex_ == DormConst.DORM_SUIT_TYPE then
		arg_18_2:RefreshUI(arg_18_0.dataList_[arg_18_1], arg_18_0.selItem_, DormEnum.FurItemType.SuitEdit, nil, arg_18_1, arg_18_0.suitTypeIndex)
	else
		arg_18_2:RefreshUI(arg_18_0.dataList_[arg_18_1], arg_18_0.selItem_, DormEnum.FurItemType.Edit, nil, arg_18_1)
	end

	arg_18_2:OnPointerDown(function(arg_19_0, arg_19_1, arg_19_2)
		arg_18_0.furType = arg_19_2

		if arg_19_2 == DormConst.DORM_FUR_EDITVIEW_TYPE.CanPlace or DormSuitData:CheckIsSuit(arg_19_0) then
			arg_18_0.selItem_ = arg_19_0
			arg_18_0.selIndex = arg_19_1

			arg_18_0.scrollHelper_:Refresh()
			arg_18_0.descController:SetSelectedState("true")
		end

		if DormSpecialFurnitureTools:JudgeFurIsSpecialType(arg_19_0) and arg_19_2 == DormConst.DORM_FUR_EDITVIEW_TYPE.CanPlace then
			JumpTools.OpenPageByJump("/furnitureEdit", {
				type = "drag",
				itemId = arg_19_0,
				itemType = arg_18_0.selItemType
			})
		else
			local var_19_0, var_19_1 = DormSuitData:CheckIsSuit(arg_19_0)

			if var_19_0 then
				DormRedPointTools:ClickSuitIconRedPoint(arg_19_0)

				if var_19_1 == DormSuitTools.DORM_SUIT_TYPE.FULL_SET then
					DormSuitEditData:EnterFullSuitEditMode()
					DormFurnitureTools:SetEditFurFlag(true)
					DormSuitTools:GenerateFullSetFurSuit(arg_19_0)
					JumpTools.OpenPageByJump("/dormSuitFurInfoView", {
						suitID = arg_19_0
					})
				end
			end
		end
	end)
	arg_18_2:GrayCallBack(function(arg_20_0, arg_20_1, arg_20_2, arg_20_3, arg_20_4)
		local var_20_0, var_20_1 = DormSuitData:CheckIsSuit(arg_20_0)

		if var_20_0 then
			arg_18_0.selItem_ = arg_20_0

			arg_18_0.scrollHelper_:Refresh()

			if var_20_1 == DormSuitTools.DORM_SUIT_TYPE.FULL_SET then
				DormSuitEditData:EnterFullSuitEditMode()
				DormSuitTools:GenerateFullSetFurSuit(arg_20_0)
				JumpTools.OpenPageByJump("/dormSuitFurInfoView", {
					suitID = arg_20_0
				})
			elseif var_20_1 == DormSuitTools.DORM_SUIT_TYPE.PART_SET then
				JumpTools.OpenPageByJump("dormPartSuitInfoPopView", {
					suitID = arg_20_0
				})
			end

			DormRedPointTools:ClickSuitIconRedPoint(arg_20_0)
		else
			local var_20_2 = BackHomeCfg[arg_18_0.roomID].type

			arg_18_0.selIndex = arg_20_1
			arg_18_0.params_.index = arg_18_0.selectIndex_

			if var_20_2 == DormConst.BACKHOME_TYPE.PublicDorm then
				JumpTools.OpenPageByJump("dormFurBuyAndGiftView", {
					state = "gift",
					furID = arg_20_0
				})
			elseif var_20_2 == DormConst.BACKHOME_TYPE.PrivateDorm then
				JumpTools.OpenPageByJump("dormFurBuyAndGiftView", {
					state = "gift",
					furID = arg_20_0
				})
			end
		end
	end)
	arg_18_2:ItemInfoCallBack(function(arg_21_0)
		arg_18_0.selItem_ = arg_21_0

		arg_18_0.scrollHelper_:Refresh()
		JumpTools.OpenPageByJump("dormPartSuitInfoPopView", {
			suitID = arg_21_0
		})
	end)
end

function var_0_0.AddUIListener(arg_22_0)
	arg_22_0:AddBtnListenerScale(arg_22_0.saveBtn_, nil, function()
		if DormData:GetDevModelFlag() then
			local function var_23_0(arg_24_0)
				if not string.isNullOrEmpty(arg_24_0) then
					DormSuitData:SetSuitSerializeData(arg_24_0)
					arg_22_0:SaveFurEditList()
				end
			end

			JumpTools.OpenPageByJump("dormChangeTemplateNameView", {
				showText = "",
				callBack = var_23_0
			})
		else
			arg_22_0:SaveFurEditList()
		end
	end)
	arg_22_0:AddBtnListenerScale(arg_22_0.resetBtn_, nil, function()
		ShowMessageBox({
			isTop = true,
			content = GetTips("DORM_EDIT_CLEAN"),
			OkCallback = function()
				DormFurnitureTools:SetEditFurFlag(true)
				DormFurEditStateData:RestoreRoomAllFurniture()
				DormFurnitureManager.GetInstance():ClearAndGenByFurList()
				arg_22_0:RefreshView(true)
			end,
			CancelCallback = function()
				return
			end
		})
	end)
	arg_22_0:AddBtnListenerScale(arg_22_0.cancelBtn_, nil, function()
		if DormFurnitureTools:GetEditFurFlag() then
			ShowMessageBox({
				isTop = true,
				content = GetTips("DORM_EDIT_CANCEL"),
				OkCallback = function()
					DormFurnitureTools:GenerateFurnitureWhenEnterScene()
					arg_22_0:BackToDormHomeView()
				end,
				CancelCallback = function()
					return
				end
			})
		else
			arg_22_0:BackToDormHomeView()
		end
	end)

	for iter_22_0 = DormConst.DORM_FUR_TYPE_START, DormConst.DORM_FUR_TYPE_END do
		arg_22_0:AddToggleListener(arg_22_0["item_" .. iter_22_0 .. "Tgl_"], function(arg_31_0)
			if arg_31_0 then
				arg_22_0:OnGroupSelect(iter_22_0)
			end
		end)
	end

	arg_22_0.uilistSrex_.ExitScrollArea:AddListener(function()
		if arg_22_0.selItem_ then
			if not DormFurnitureTools:GetIsOverLoad(arg_22_0.roomID) then
				ShowTips(GetTips("DORM_FURNITURE_SET_MAX"))

				return
			end

			local var_32_0 = false

			if DormSuitData:CheckIsSuit(arg_22_0.selItem_) then
				if DormSuitData:CheckSuitCanUseInRoom(arg_22_0.selItem_, arg_22_0.roomID) then
					var_32_0 = true
				end
			elseif arg_22_0.furType == DormConst.DORM_FUR_EDITVIEW_TYPE.CanPlace then
				var_32_0 = true
			end

			if var_32_0 then
				JumpTools.OpenPageByJump("/furnitureEdit", {
					type = "drag",
					itemId = arg_22_0.selItem_,
					itemType = arg_22_0.selItemType
				})
				DormTools:PlayDormAudioEffect(DormConst.DORM_AUDIO_EFFECT.PlaceFur)
			end
		end
	end)
	arg_22_0:AddBtnListenerScale(arg_22_0.filterbtn_, nil, function()
		if not arg_22_0.filterShow then
			arg_22_0.filterShow = true
		else
			arg_22_0.filterShow = false
		end

		arg_22_0:RefreshEditTypeSwichBar()
	end)
	arg_22_0:AddBtnListenerScale(arg_22_0.canPlacebtn_, nil, function()
		local var_34_0 = DormFurnitureTools:GetFurEditFlag()

		if var_34_0.canPlaceFlag then
			var_34_0.canPlaceFlag = false
		else
			var_34_0.canPlaceFlag = true
		end

		arg_22_0.selIndex = nil

		arg_22_0:RefreshView(true)
	end)
	arg_22_0:AddBtnListenerScale(arg_22_0.hadPlacebtn_, nil, function()
		local var_35_0 = DormFurnitureTools:GetFurEditFlag()

		if var_35_0.hadPlaceFlag then
			var_35_0.hadPlaceFlag = false
		else
			var_35_0.hadPlaceFlag = true
		end

		arg_22_0.selIndex = nil

		arg_22_0:RefreshView(true)
	end)
	arg_22_0:AddBtnListenerScale(arg_22_0.otherHadPlacebtn_, nil, function()
		local var_36_0 = DormFurnitureTools:GetFurEditFlag()

		if var_36_0.otherHadPlaceFlag then
			var_36_0.otherHadPlaceFlag = false
		else
			var_36_0.otherHadPlaceFlag = true
		end

		arg_22_0.selIndex = nil

		arg_22_0:RefreshView(true)
	end)
	arg_22_0:AddBtnListenerScale(arg_22_0.notPresentedbtn_, nil, function()
		local var_37_0 = DormFurnitureTools:GetFurEditFlag()

		if var_37_0.notPresentedFlag then
			var_37_0.notPresentedFlag = false
		else
			var_37_0.notPresentedFlag = true
		end

		arg_22_0.selIndex = nil

		arg_22_0:RefreshView(true)
	end)

	for iter_22_1 = 1, 2 do
		arg_22_0:AddToggleListener(arg_22_0["suitBtn" .. iter_22_1], function(arg_38_0)
			if arg_38_0 then
				arg_22_0:SelectEditSuitSetType(iter_22_1)
			end
		end)
	end

	for iter_22_2 = 1, 2 do
		arg_22_0:AddToggleListener(arg_22_0["stateBtn" .. iter_22_2], function(arg_39_0)
			if arg_39_0 then
				arg_22_0:OnSuitSetType(iter_22_2)
			end
		end)
	end
end

function var_0_0.BackToDormHomeView(arg_40_0)
	DormLuaBridge.ChangeCameraMode(0, true)
	gameContext:Go("/dorm")

	arg_40_0.selIndex = nil
	arg_40_0.suitTypeIndex = nil

	DormLuaBridge.SetIsCanEditTag(false)
	DormHeroTools:GenerateHeroWhenEnterScene()
	DormFurEditStateData:ExitEditState()
	DormFurnitureTools:SetEditFurFlag(nil)
	arg_40_0:ClickCurSuitListRedPoint()
end

function var_0_0.SaveFurEditList(arg_41_0)
	local var_41_0, var_41_1, var_41_2 = DormFurEditStateData:GetHadPlaceFurInfoList()
	local var_41_3 = {
		furInfoList = var_41_0,
		specialInfo = var_41_1,
		suitInfo = var_41_2
	}

	DormAction:SetFurListInMap(arg_41_0.roomID, nil, var_41_3)
	arg_41_0:BackToDormHomeView()
end

function var_0_0.SelectEditSuitSetType(arg_42_0, arg_42_1)
	arg_42_0:ClickCurSuitListRedPoint()

	arg_42_0["suitBtn" .. arg_42_1].isOn = true
	arg_42_0.suitTypeIndex = arg_42_1

	local var_42_0 = DormSuitData:GetCanUseFurSuitIDList(arg_42_0.roomID, arg_42_1)

	arg_42_0.dataList_ = {}

	for iter_42_0, iter_42_1 in ipairs(var_42_0) do
		local var_42_1 = {
			type = DormConst.DORM_FUR_EDITVIEW_TYPE.CanPlace,
			furID = iter_42_1
		}

		table.insert(arg_42_0.dataList_, var_42_1)
	end

	arg_42_0.scrollHelper_:StartScroll(#arg_42_0.dataList_)

	if arg_42_0.selIndex then
		arg_42_0.scrollHelper_:ScrollToIndex(arg_42_0.selIndex, false, false)
	end
end

function var_0_0.ClickCurSuitListRedPoint(arg_43_0)
	if arg_43_0.selectIndex_ == DormConst.DORM_SUIT_TYPE and arg_43_0.dataList_ then
		for iter_43_0, iter_43_1 in ipairs(arg_43_0.dataList_) do
			DormRedPointTools:ClickSuitIconRedPoint(iter_43_1.furID)
		end
	end
end

function var_0_0.RefreshFurEditTypeController(arg_44_0)
	local var_44_0 = DormFurnitureTools:GetFurEditFlag()

	if var_44_0.otherHadPlaceFlag then
		arg_44_0.otherHadPlaceController:SetSelectedState("on")
	else
		arg_44_0.otherHadPlaceController:SetSelectedState("off")
	end

	if var_44_0.hadPlaceFlag then
		arg_44_0.hadPlaceController:SetSelectedState("on")
	else
		arg_44_0.hadPlaceController:SetSelectedState("off")
	end

	if var_44_0.canPlaceFlag then
		arg_44_0.canPlaceController:SetSelectedState("on")
	else
		arg_44_0.canPlaceController:SetSelectedState("off")
	end

	if var_44_0.notPresentedFlag then
		arg_44_0.notPresentedController:SetSelectedState("on")
	else
		arg_44_0.notPresentedController:SetSelectedState("off")
	end
end

function var_0_0.CheckFurNum(arg_45_0)
	local var_45_0

	if BackHomeCfg[arg_45_0.roomID].type == DormConst.BACKHOME_TYPE.PublicDorm then
		var_45_0 = GameSetting.dorm_lobby_furniture_limited.value[1]
	else
		local var_45_1 = DormitoryData:GetDormLevel(arg_45_0.roomID)

		var_45_0 = BackHomeCfg[arg_45_0.roomID].load_max[var_45_1]
	end

	local var_45_2 = DormFurnitureTools:GetHasPlaceFurNumInfoInMap(arg_45_0.roomID) + DormFurEditStateData:GetCacheFurTotalNum() + DormConst.DORM_SPECIAL_FURNITURE_NUM

	if var_45_0 then
		if var_45_0 <= var_45_2 then
			return false
		else
			return true
		end
	end
end

function var_0_0.RefreshDevInfo(arg_46_0)
	if DormData:GetDevModelFlag() then
		arg_46_0.devController:SetSelectedState("edit")

		local var_46_0 = DormSuitData:GetSuitType()

		arg_46_0:OnSuitSetType(var_46_0)
	else
		arg_46_0.devController:SetSelectedState("player")
	end
end

function var_0_0.OnSuitSetType(arg_47_0, arg_47_1)
	arg_47_0["stateBtn" .. arg_47_1].isOn = true

	DormSuitData:SetSuitType(arg_47_1)
end

function var_0_0.Dispose(arg_48_0)
	if arg_48_0.scrollHelper_ then
		arg_48_0.scrollHelper_:Dispose()
	end

	arg_48_0.uilistSrex_.ExitScrollArea:RemoveAllListeners()
	var_0_0.super.Dispose(arg_48_0)
end

return var_0_0
