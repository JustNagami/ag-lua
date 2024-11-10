local var_0_0 = class("DromPrivateRoomItem", ReduxView)

function var_0_0.OnCtor(arg_1_0, arg_1_1)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_1.transform

	arg_1_0:InitUI()
end

function var_0_0.InitUI(arg_2_0)
	arg_2_0:BindCfgUI()

	arg_2_0.publicHeroScroll = LuaList.New(handler(arg_2_0, arg_2_0.indexHeroItem), arg_2_0.uilistGo_, BackHomeNewHeroItem)
	arg_2_0.publicStateController = ControllerUtil.GetController(arg_2_0.transform_, "roomType")
	arg_2_0.emptyController = ControllerUtil.GetController(arg_2_0.uilistGo_.transform, "empty")
	arg_2_0.publicVisitController = ControllerUtil.GetController(arg_2_0.publicGo_.transform, "visit")
	arg_2_0.floorAniamtion = arg_2_0.dimianGo_:GetComponent("Animation")
	arg_2_0.edit = false
	arg_2_0.time = 2 / GameDisplayCfg.dorm_area_swap_speed.value[1]

	arg_2_0:InitPrivateRoomItemInfo()
	arg_2_0:RegisterEvents()
	arg_2_0:AddUIListener()
end

function var_0_0.InitPrivateRoomItemInfo(arg_3_0)
	arg_3_0.itemPosition = {}
	arg_3_0.item = {}

	for iter_3_0 = 1, DormConst.DORM_FLOOR_ROOM_NUM do
		arg_3_0.item[iter_3_0] = DormRoomItem.New(arg_3_0["item" .. iter_3_0 .. "Go_"])

		arg_3_0.item[iter_3_0]:SetPosAndRoomID(iter_3_0)
		arg_3_0:AddBtnCallBack(arg_3_0.item[iter_3_0])

		arg_3_0.itemPosition[iter_3_0] = {}
		arg_3_0.itemPosition[iter_3_0].has = true
		arg_3_0.itemPosition[iter_3_0].pos = Vector3.New(arg_3_0.item[iter_3_0].transform_.localPosition.x, arg_3_0.item[iter_3_0].transform_.localPosition.y, arg_3_0.item[iter_3_0].transform_.localPosition.z)
	end

	arg_3_0.itemPosition[1].slibing = 6
	arg_3_0.itemPosition[2].slibing = 2
	arg_3_0.itemPosition[3].slibing = 5
	arg_3_0.itemPosition[4].slibing = 7
	arg_3_0.itemPosition[5].slibing = 3
	arg_3_0.itemPosition[6].slibing = 1
	arg_3_0.itemPosition[7].slibing = 4
	arg_3_0.itemPosition[8].slibing = 8
	arg_3_0.itemPosition[9].slibing = 8
	arg_3_0.itemPosition[10].slibing = 8
	arg_3_0.itemPosition[11].slibing = 8

	for iter_3_1 = 1, DormConst.DORM_FIRST_FLOOR_ROOM_NUM do
		arg_3_0.item[iter_3_1].transform_:SetSiblingIndex(arg_3_0.itemPosition[iter_3_1].slibing)
	end
end

function var_0_0.OnBehind(arg_4_0)
	arg_4_0:SetItemCanvasSortOrder(false)
end

function var_0_0.SetItemCanvasSortOrder(arg_5_0, arg_5_1)
	if arg_5_0.item then
		for iter_5_0, iter_5_1 in ipairs(arg_5_0.item) do
			if iter_5_1.curPos ~= 5 then
				iter_5_1.textCanvas.overrideSorting = arg_5_1

				if arg_5_1 then
					iter_5_1.textCanvas.sortingOrder = 1
				end
			end
		end
	end
end

function var_0_0.OnEnter(arg_6_0)
	if manager.guide:IsPlaying() then
		arg_6_0:SetItemCanvasSortOrder(false)
	else
		arg_6_0:SetItemCanvasSortOrder(true)
	end
end

function var_0_0.OnTop(arg_7_0)
	if manager.guide:IsPlaying() then
		arg_7_0:SetItemCanvasSortOrder(false)
	else
		arg_7_0:SetItemCanvasSortOrder(true)
	end
end

function var_0_0.OnUpdate(arg_8_0)
	return
end

function var_0_0.StartGuide(arg_9_0)
	if manager.guide:IsPlaying() then
		arg_9_0:SetItemCanvasSortOrder(false)
	else
		arg_9_0:SetItemCanvasSortOrder(true)
	end
end

function var_0_0.OnExit(arg_10_0)
	arg_10_0:SetItemCanvasSortOrder(false)
end

function var_0_0.RefreshUI(arg_11_0, arg_11_1)
	arg_11_0.floor = arg_11_1

	if arg_11_1 == GameDisplayCfg.dorm_lobby_layer.value[1] then
		arg_11_0.publicStateController:SetSelectedState("public")
		arg_11_0:RefreshPublicRoomHeroList()
	else
		arg_11_0.publicStateController:SetSelectedState("private")
	end

	arg_11_0:InitRoomPos()

	for iter_11_0 = 1, DormConst.DORM_FLOOR_ROOM_NUM do
		arg_11_0.item[iter_11_0]:RefreshItemState()
	end
end

function var_0_0.InitRoomPos(arg_12_0)
	for iter_12_0 = 1, DormConst.DORM_FLOOR_ROOM_NUM do
		local var_12_0 = arg_12_0.item[iter_12_0].curPos
		local var_12_1 = DormitoryData:GetRoomIDByPosID(arg_12_0:ChangItemPosToServerPosID(var_12_0))

		arg_12_0.item[iter_12_0]:SetPosAndRoomID(var_12_0, var_12_1)
	end
end

function var_0_0.AddBtnCallBack(arg_13_0, arg_13_1)
	arg_13_1:ClickItemCallBack(handler(arg_13_0, arg_13_0.ClickRoom))
	arg_13_1:StartDrag(handler(arg_13_0, arg_13_0.StartDrag))
	arg_13_1:OnDrag(handler(arg_13_0, arg_13_0.OnDrag))
	arg_13_1:EndDrag(handler(arg_13_0, arg_13_0.EndDrag))
	arg_13_1:ChangePosition(handler(arg_13_0, arg_13_0.RayPoint))
end

function var_0_0.ClickRoom(arg_14_0, arg_14_1, arg_14_2)
	if not arg_14_0.edit then
		arg_14_0.selPos = arg_14_2

		if arg_14_1 then
			if DormData:GetCurrectSceneID() == arg_14_1 then
				JumpTools.OpenPageByJump("/dorm")

				return
			end

			if BackHomeCfg[arg_14_1].type == DormConst.BACKHOME_TYPE.PublicDorm then
				BackHomeTools:GotoBackHomeRoom(arg_14_1)
			elseif BackHomeCfg[arg_14_1].type == DormConst.BACKHOME_TYPE.PrivateDorm then
				local var_14_0 = DormRoomTools:GetPrivateDormRoomState(arg_14_1)

				if var_14_0 == DormEnum.DormRoomUseState.Unlock then
					JumpTools.OpenPageByJump("dormUnLockRoomConfirmView", {
						roomID = arg_14_1
					})
				elseif var_14_0 == DormEnum.DormRoomUseState.HadPlace then
					BackHomeTools:GotoBackHomeRoom(arg_14_1)
				end
			end
		else
			if arg_14_0.unLockRoomID then
				return
			end

			arg_14_0.unLockRoomID = DormRoomTools:GetUnlockRoomNum() + DormConst.PUBLIC_DORM_ID + 1

			local var_14_1 = arg_14_0:ChangItemPosToServerPosID(arg_14_2)
			local var_14_2 = BackHomeCfg[arg_14_0.unLockRoomID].unlock_cost[1]

			if arg_14_0.unLockRoomID then
				if var_14_2 then
					ShowMessageBox({
						title = GetTips("PROMPT"),
						content = string.format(GetTips("TIP_ITEM_COST"), ItemTools.getItemName(var_14_2[1]), var_14_2[2], GetTips("DORM_UNLOCK_COST_TIPS2")),
						OkCallback = function()
							arg_14_0:PopCostCallBack()
						end,
						CancelCallback = function()
							arg_14_0.unLockRoomID = nil
						end
					})
				else
					DormAction:UnLockDormArchitecture(arg_14_0.unLockRoomID, var_14_1)

					arg_14_0.unLockRoomID = nil
				end
			end
		end
	end
end

function var_0_0.OnDrag(arg_17_0, arg_17_1)
	if arg_17_1.heroID and arg_17_0.edit then
		local var_17_0 = Vector2.New(Input.mousePosition.x, Input.mousePosition.y)
		local var_17_1 = manager.ui.canvas:GetComponent(typeof(Canvas)).worldCamera
		local var_17_2 = {}
		local var_17_3, var_17_4 = UnityEngine.RectTransformUtility.ScreenPointToLocalPointInRectangle(arg_17_0.fatherTrs, var_17_0, var_17_1, var_17_2)

		arg_17_1.transform_.localPosition = var_17_4
	end
end

function var_0_0.RayPoint(arg_18_0, arg_18_1)
	if arg_18_0.edit and arg_18_0.dragPos ~= arg_18_1.oriPos and not arg_18_1.move then
		for iter_18_0, iter_18_1 in pairs(arg_18_0.itemPosition) do
			if not iter_18_1.has then
				local var_18_0 = arg_18_1.curPos

				arg_18_1.move = true
				arg_18_0.itemPosition[var_18_0].has = false
				iter_18_1.has = true
				arg_18_0.tweenValue_ = LeanTween.value(0, 1, arg_18_0.time):setOnUpdate(LuaHelper.FloatAction(function(arg_19_0)
					local var_19_0 = Vector3(Mathf.Lerp(arg_18_1.transform_.localPosition.x, arg_18_0.itemPosition[iter_18_0].pos.x, arg_19_0), Mathf.Lerp(arg_18_1.transform_.localPosition.y, arg_18_0.itemPosition[iter_18_0].pos.y, arg_19_0), Mathf.Lerp(arg_18_1.transform_.localPosition.z, arg_18_0.itemPosition[iter_18_0].pos.z, arg_19_0))

					arg_18_1.transform_.localPosition = var_19_0
				end)):setOnComplete(LuaHelper.VoidAction(function()
					arg_18_1.curPos = iter_18_0

					if iter_18_0 > DormConst.DORM_FIRST_FLOOR_ROOM_NUM then
						arg_18_1.transform_:SetParent(arg_18_0.centerTrs, false)
					else
						arg_18_1.transform_:SetParent(arg_18_0.fatherTrs, false)
					end

					arg_18_1.move = false

					arg_18_1.transform_:SetSiblingIndex(arg_18_0.itemPosition[iter_18_0].slibing)
				end)):setEase(LeanTweenType.easeOutQuad)

				return
			end
		end
	end
end

function var_0_0.StartDrag(arg_21_0, arg_21_1)
	if not arg_21_0.edit and arg_21_1.heroID and DormRoomTools:GetPrivateDormRoomState(arg_21_1.roomID) == DormEnum.DormRoomUseState.HadPlace then
		arg_21_0.edit = true
		arg_21_0.dragPos = arg_21_1.curPos

		arg_21_1.roomStateController:SetSelectedState("select")
		arg_21_1.transform_:SetParent(arg_21_0.fatherTrs, false)
		arg_21_1.transform_:SetAsFirstSibling()

		arg_21_0.itemPosition[arg_21_1.oriPos].has = false

		arg_21_0:SetItemCanvasSortOrder(false)
	end
end

function var_0_0.EndDrag(arg_22_0, arg_22_1)
	if arg_22_0.edit and arg_22_1.heroID then
		arg_22_1.roomStateController:SetSelectedState("normal")

		for iter_22_0, iter_22_1 in pairs(arg_22_0.itemPosition) do
			if not iter_22_1.has then
				iter_22_1.has = true
				arg_22_0.tweenValue_ = LeanTween.value(0, 1, arg_22_0.time):setOnUpdate(LuaHelper.FloatAction(function(arg_23_0)
					local var_23_0 = Vector3(Mathf.Lerp(arg_22_1.transform_.localPosition.x, arg_22_0.itemPosition[iter_22_0].pos.x, arg_23_0), Mathf.Lerp(arg_22_1.transform_.localPosition.y, arg_22_0.itemPosition[iter_22_0].pos.y, arg_23_0), Mathf.Lerp(arg_22_1.transform_.localPosition.z, arg_22_0.itemPosition[iter_22_0].pos.z, arg_23_0))

					arg_22_1.transform_.localPosition = var_23_0
				end)):setOnComplete(LuaHelper.VoidAction(function()
					arg_22_1.curPos = iter_22_0

					if iter_22_0 > DormConst.DORM_FIRST_FLOOR_ROOM_NUM then
						arg_22_1.transform_:SetParent(arg_22_0.centerTrs, false)
					else
						arg_22_1.transform_:SetParent(arg_22_0.fatherTrs, false)
					end

					arg_22_1.transform_:SetSiblingIndex(arg_22_0.itemPosition[iter_22_0].slibing)
					arg_22_0.centerTrs:SetAsLastSibling()

					arg_22_0.edit = false
					arg_22_0.dragPos = nil

					arg_22_0:RevisePrivateDormPos()
					arg_22_0:SetItemCanvasSortOrder(true)
				end)):setEase(LeanTweenType.easeOutQuad)

				return
			end
		end
	end
end

function var_0_0.RegisterEvents(arg_25_0)
	arg_25_0:RegistEventListener(DORM_PRIVATE_DORM_CHANGE, function(arg_26_0)
		local var_26_0 = DormitoryData:GetDormSceneData(arg_26_0).pos_id
		local var_26_1 = var_26_0 - DormConst.DORM_POS_ID_OFFSET
		local var_26_2 = arg_25_0:ChangServerPosIDToItemPos(var_26_0)
		local var_26_3
		local var_26_4
		local var_26_5

		if arg_25_0.floor == 1 then
			var_26_3 = DormConst.DORM_FIRST_FLOOR_ROOM_NUM
			var_26_5 = 1
		else
			var_26_3 = DormConst.DORM_FIRST_FLOOR_ROOM_NUM + (arg_25_0.floor - 1) * DormConst.DORM_FLOOR_ROOM_NUM
			var_26_5 = var_26_3 - DormConst.DORM_FLOOR_ROOM_NUM + 1
		end

		if var_26_5 <= var_26_1 and var_26_1 <= var_26_3 then
			local var_26_6 = arg_25_0:GetItemByCurPos(var_26_2)

			if var_26_6 then
				var_26_6.roomID = arg_26_0

				if BackHomeCfg[arg_26_0].type == DormConst.BACKHOME_TYPE.PublicDorm and arg_25_0.floor == 1 then
					arg_25_0:RefreshPublicRoomHeroList()
				elseif BackHomeCfg[arg_26_0].type == DormConst.BACKHOME_TYPE.PrivateDorm then
					arg_25_0:GetItemByCurPos(var_26_2):RefreshItemState(true)
				end
			end
		end
	end)
end

function var_0_0.AddUIListener(arg_27_0)
	arg_27_0:AddBtnListener(arg_27_0.publicBtn_, nil, function()
		arg_27_0:ClickRoom(DormConst.PUBLIC_DORM_ID)
	end)
end

function var_0_0.GetItemByCurPos(arg_29_0, arg_29_1)
	if arg_29_0.item then
		for iter_29_0, iter_29_1 in pairs(arg_29_0.item) do
			if iter_29_1.oriPos == arg_29_1 then
				return iter_29_1
			end
		end

		print("未找到对应item")
	end
end

function var_0_0.RevisePrivateDormPos(arg_30_0)
	local var_30_0 = {}

	for iter_30_0, iter_30_1 in pairs(arg_30_0.item) do
		if iter_30_1.oriPos ~= iter_30_1.curPos then
			iter_30_1.oriPos = iter_30_1.curPos

			local var_30_1 = arg_30_0:ChangItemPosToServerPosID(iter_30_1.curPos)

			if iter_30_1.roomID then
				local var_30_2 = {
					roomID = iter_30_1.roomID,
					posID = var_30_1
				}
				local var_30_3 = DormitoryData:GetDormSceneData(iter_30_1.roomID)

				if DormRoomTools:CheckRoomPosSameLevel(var_30_3.pos_id, var_30_1) then
					table.insert(var_30_0, var_30_2)
				end
			end
		end
	end

	if #var_30_0 > 0 then
		DormAction:RevisePrivateDormPos(var_30_0)
	end
end

function var_0_0.PopCostCallBack(arg_31_0)
	if arg_31_0.unLockRoomID then
		local var_31_0 = BackHomeCfg[arg_31_0.unLockRoomID].unlock_cost[1]
		local var_31_1 = ItemTools.getItemNum(var_31_0[1])

		arg_31_0.unLockRoomID = nil

		if var_31_1 < var_31_0[2] then
			ShowTips(GetTips("DORM_UNLOCK_ITEM_NOT_ENOUGH"))

			return
		end

		local var_31_2 = DormRoomTools:GetUnlockRoomNum() + DormConst.PUBLIC_DORM_ID + 1
		local var_31_3 = arg_31_0:ChangItemPosToServerPosID(arg_31_0.selPos)

		if var_31_2 and var_31_3 then
			DormAction:UnLockDormArchitecture(var_31_2, var_31_3)
		end
	end
end

function var_0_0.ChangItemPosToServerPosID(arg_32_0, arg_32_1)
	if arg_32_1 then
		local var_32_0 = DormConst.DORM_POS_ID_OFFSET

		if arg_32_0.floor <= 1 then
			var_32_0 = var_32_0 + arg_32_1
		else
			var_32_0 = var_32_0 + DormConst.DORM_FIRST_FLOOR_ROOM_NUM + (arg_32_0.floor - 2) * DormConst.DORM_FLOOR_ROOM_NUM + arg_32_1
		end

		return var_32_0
	end
end

function var_0_0.ChangServerPosIDToItemPos(arg_33_0, arg_33_1)
	if arg_33_1 then
		local var_33_0 = DormConst.DORM_POS_ID_OFFSET

		if arg_33_0.floor <= 1 then
			var_33_0 = arg_33_1 - var_33_0
		else
			var_33_0 = arg_33_1 - DormConst.DORM_FIRST_FLOOR_ROOM_NUM - (arg_33_0.floor - 2) * DormConst.DORM_FLOOR_ROOM_NUM - var_33_0
		end

		return var_33_0
	end
end

function var_0_0.indexHeroItem(arg_34_0, arg_34_1, arg_34_2)
	arg_34_2:SetItemFunction({
		showFatigue = true,
		showJobState = true
	})
	arg_34_2:RefreshUI(arg_34_0.heroList[arg_34_1])
end

function var_0_0.RefreshPublicRoomHeroList(arg_35_0)
	local var_35_0 = DormConst.PUBLIC_DORM_ID
	local var_35_1 = DormitoryData:GetDormSceneData(var_35_0).archiveIDList

	arg_35_0.heroList = {}

	for iter_35_0, iter_35_1 in ipairs(var_35_1) do
		local var_35_2 = DormData:GetHeroInfo(iter_35_1):GetHeroId()

		table.insert(arg_35_0.heroList, var_35_2)
	end

	arg_35_0.publicHeroScroll:StartScroll(#arg_35_0.heroList)

	if #arg_35_0.heroList == 0 then
		arg_35_0.emptyController:SetSelectedState("false")
	end

	arg_35_0.publicNum.text = string.format("%s/%s", #arg_35_0.heroList, GameSetting.dorm_lobby_hero_max.value[1])

	if DormVisitTools:GetCurTemplateExhibit() == var_35_0 then
		arg_35_0.publicVisitController:SetSelectedState("true")
	else
		arg_35_0.publicVisitController:SetSelectedState("false")
	end
end

function var_0_0.PlayFloorAnimation(arg_36_0)
	for iter_36_0, iter_36_1 in ipairs(arg_36_0.item) do
		if iter_36_1.curPos <= DormConst.DORM_FIRST_FLOOR_ROOM_NUM then
			iter_36_1.animation:Play("DormEntranceUI_item_cx", 0)
		elseif arg_36_0.floor ~= GameDisplayCfg.dorm_lobby_layer.value[1] then
			iter_36_1.animation:Play("DormEntranceUI_item_cx", 0)
		end
	end
end

function var_0_0.Dispose(arg_37_0)
	arg_37_0:RemoveAllEventListener()

	if arg_37_0.publicHeroScroll then
		arg_37_0.publicHeroScroll:Dispose()
	end

	if arg_37_0.item then
		for iter_37_0, iter_37_1 in pairs(arg_37_0.item) do
			iter_37_1:Dispose()
		end
	end

	var_0_0.super.Dispose(arg_37_0)
end

return var_0_0
