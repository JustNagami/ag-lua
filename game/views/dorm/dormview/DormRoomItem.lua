local var_0_0 = class("DormRoomItem", ReduxView)

function var_0_0.OnCtor(arg_1_0, arg_1_1)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_1.transform

	arg_1_0:InitUI()
	arg_1_0:AddUIListener()
end

function var_0_0.InitUI(arg_2_0)
	arg_2_0:BindCfgUI()

	arg_2_0.roomStateController = ControllerUtil.GetController(arg_2_0.transform_, "state")
	arg_2_0.roomDetailController = ControllerUtil.GetController(arg_2_0.transform_, "detail")
	arg_2_0.heroIconController = ControllerUtil.GetController(arg_2_0.transform_, "hero")
	arg_2_0.visitController = ControllerUtil.GetController(arg_2_0.transform_, "visit")
	arg_2_0.move = false
	arg_2_0.animation = arg_2_0.gameObject_:GetComponent("Animation")
	arg_2_0.heroItem = BackHomeNewHeroItem.New(arg_2_0.heroItemGo_)

	arg_2_0.heroItem:SetItemFunction({
		showFatigue = true,
		showState = true
	})

	arg_2_0.textCanvas = arg_2_0.detailsGo_:GetComponent("Canvas")
end

function var_0_0.AddUIListener(arg_3_0)
	arg_3_0:AddPressByTimeListener(arg_3_0.buttonBtn_.gameObject, GameDisplayCfg.dorm_area_swap_time.value[1], function()
		if arg_3_0.clickFunc then
			arg_3_0.clickFunc(arg_3_0.roomID, arg_3_0.oriPos)
		end
	end, function(arg_5_0, arg_5_1, arg_5_2)
		if arg_3_0.startDrag then
			arg_3_0.startDrag(arg_3_0)
		end
	end, function(arg_6_0, arg_6_1, arg_6_2)
		if arg_3_0.endDrag then
			arg_3_0.endDrag(arg_3_0)
		end
	end, arg_3_0.oriPos)
	arg_3_0:AddDragListener(arg_3_0.buttonBtn_.gameObject, function()
		return
	end, function()
		if arg_3_0.onDrag then
			arg_3_0.onDrag(arg_3_0)
		end
	end, function()
		return
	end)
	arg_3_0:AddPonitListener(arg_3_0.buttonBtn_.gameObject, function()
		if arg_3_0.changePositionFunc then
			arg_3_0.changePositionFunc(arg_3_0)
		end
	end, function()
		return
	end)
end

function var_0_0.SetPosAndRoomID(arg_12_0, arg_12_1, arg_12_2)
	arg_12_0.oriPos = arg_12_1
	arg_12_0.roomID = arg_12_2
	arg_12_0.curPos = arg_12_1
end

function var_0_0.RefreshItemState(arg_13_0, arg_13_1)
	arg_13_0.roomDetailController:SetSelectedState("false")
	arg_13_0.heroIconController:SetSelectedState("false")
	arg_13_0.visitController:SetSelectedState("false")

	if arg_13_0.roomID then
		local var_13_0 = DormRoomTools:GetPrivateDormRoomState(arg_13_0.roomID)

		if var_13_0 == DormEnum.DormRoomUseState.Lock then
			arg_13_0.roomStateController:SetSelectedState("lock")
		elseif var_13_0 == DormEnum.DormRoomUseState.Unlock then
			arg_13_0.roomStateController:SetSelectedState("unlock")

			if arg_13_1 then
				arg_13_0.animation:Play("DormEntranceUI_item_unlock")
			end
		elseif var_13_0 == DormEnum.DormRoomUseState.HadPlace then
			arg_13_0.roomStateController:SetSelectedState("normal")

			if arg_13_0.roomID == DormVisitTools:GetCurTemplateExhibit() then
				arg_13_0.visitController:SetSelectedState("true")
			end

			local var_13_1 = DormitoryData:GetDormSceneData(arg_13_0.roomID).archiveIDList

			if var_13_1 and #var_13_1 > 0 then
				arg_13_0.roomStateController:SetSelectedState("true")
				arg_13_0.roomDetailController:SetSelectedState("true")

				local var_13_2 = var_13_1[1]
				local var_13_3 = DormData:GetHeroInfoList()[var_13_2]

				arg_13_0.heroID = var_13_3.hero_id
				arg_13_0.comfortNum.text = DormitoryData:GetDormExp(arg_13_0.roomID)
				arg_13_0.levelNum.text = DormitoryData:GetDormLevel(arg_13_0.roomID)
				arg_13_0.heroName.text = HeroRecordCfg[var_13_2].name

				local var_13_4 = var_13_3:GetHeroState()

				if var_13_4 ~= DormEnum.DormHeroState.OutDorm and var_13_4 ~= DormEnum.DormHeroState.InPublicDorm and var_13_4 ~= DormEnum.DormHeroState.InIdolTraineeCamp then
					arg_13_0.heroIconController:SetSelectedState("true")
					arg_13_0.heroItem:RefreshUI(arg_13_0.heroID)
				end
			end
		end
	else
		arg_13_0.roomStateController:SetSelectedState("lock")
	end
end

function var_0_0.ClickItemCallBack(arg_14_0, arg_14_1)
	if arg_14_1 then
		arg_14_0.clickFunc = arg_14_1
	end
end

function var_0_0.StartDrag(arg_15_0, arg_15_1)
	if arg_15_1 then
		arg_15_0.startDrag = arg_15_1
	end
end

function var_0_0.OnDrag(arg_16_0, arg_16_1)
	if arg_16_1 then
		arg_16_0.onDrag = arg_16_1
	end
end

function var_0_0.EndDrag(arg_17_0, arg_17_1)
	if arg_17_1 then
		arg_17_0.endDrag = arg_17_1
	end
end

function var_0_0.ChangePosition(arg_18_0, arg_18_1)
	if arg_18_1 then
		arg_18_0.changePositionFunc = arg_18_1
	end
end

function var_0_0.Dispose(arg_19_0)
	arg_19_0:RemoveAllListeners()
	arg_19_0.heroItem:Dispose()
	var_0_0.super.Dispose(arg_19_0)
end

return var_0_0
