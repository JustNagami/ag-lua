local var_0_0 = class("StoreItemInfo", ReduxView)

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_1.transform

	arg_1_0:BindCfgUI()
	arg_1_0:AddListeners()

	arg_1_0.storeHeadInfoView_ = StoreHeadInfo.New(arg_1_0.itemHeadGo_)
	arg_1_0.hideBtnController_ = arg_1_0.controllerEx_:GetController("btnState")
	arg_1_0.btnController_ = arg_1_0.controllerEx_:GetController("btn")
	arg_1_0.switchBtnController_ = arg_1_0.controllerEx_:GetController("tab")
	arg_1_0.uiList_ = LuaList.New(handler(arg_1_0, arg_1_0.IndexSourceItem), arg_1_0.uiListGo_, StoreItemSource)
	arg_1_0.selectInfoType_ = StoreConst.ITEM_INFO_TYPE.DESC
end

function var_0_0.OnEnter(arg_2_0)
	arg_2_0.storeHeadInfoView_:OnEnter()
end

function var_0_0.OnExit(arg_3_0)
	arg_3_0.storeHeadInfoView_:OnExit()
end

function var_0_0.Dispose(arg_4_0)
	var_0_0.super.Dispose(arg_4_0)
	arg_4_0.uiList_:Dispose()

	arg_4_0.uiList_ = nil

	arg_4_0.storeHeadInfoView_:Dispose()

	arg_4_0.storeHeadInfoView_ = nil
end

function var_0_0.AddListeners(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.switchBtn_, nil, function()
		if arg_5_0.selectInfoType_ == StoreConst.ITEM_INFO_TYPE.DESC then
			arg_5_0.selectInfoType_ = StoreConst.ITEM_INFO_TYPE.SOURCE
		else
			arg_5_0.selectInfoType_ = StoreConst.ITEM_INFO_TYPE.DESC
		end

		arg_5_0:RefreshInfo()
	end)
	arg_5_0:AddBtnListener(arg_5_0.useBtn_, nil, function()
		local var_7_0 = ItemCfg[arg_5_0.itemData_.id]
		local var_7_1 = ItemTools.GetItemExpiredTimeByInfo(arg_5_0.itemData_)

		if var_7_1 ~= 0 and var_7_1 <= manager.time:GetServerTime() then
			ShowTips("ITEM_EXPIRE")

			return
		end

		if var_7_0.sub_type == ItemConst.ITEM_SUB_TYPE.OPTIONAL_ITEM or var_7_0.sub_type == ItemConst.ITEM_SUB_TYPE.OPTIONAL_ITEM_LIMIT_TIME then
			local var_7_2 = 1

			JumpTools.OpenPageByJump("optionalItemSelect", {
				popItemInfo = {
					arg_5_0.itemData_.id,
					arg_5_0.itemData_.number,
					0,
					var_7_1
				},
				selectNum = var_7_2
			})

			return
		end

		if var_7_0.type == ItemConst.ITEM_TYPE.GIFT and ItemConst.ITEM_SUB_TYPE.FUKUBUKURO == var_7_0.sub_type then
			JumpTools.OpenPageByJump("popFukubukuroSelect", {
				popItemInfo = {
					arg_5_0.itemData_.id,
					arg_5_0.itemData_.number,
					0,
					arg_5_0.itemData_.timeValid
				},
				instance_id = arg_5_0.itemData_.instance_id
			})

			return
		end

		if var_7_0.sub_type == ItemConst.ITEM_SUB_TYPE.LIMIT_TIME_SKIN_ITEM then
			JumpTools.OpenPageByJump("limitTimeSkinUsePop", {
				itemData = arg_5_0.itemData_
			})

			return
		end

		JumpTools.OpenPageByJump("itemUse", {
			itemData = arg_5_0.itemData_
		})
	end)
	arg_5_0:AddBtnListener(arg_5_0.composeBtn_, nil, function()
		JumpTools.OpenPageByJump("synthesise", {
			id = ItemCfg[arg_5_0.itemData_.id].compose_id
		})
	end)
	arg_5_0:AddBtnListener(arg_5_0.decomposeBtn_, nil, function()
		JumpTools.OpenPageByJump("synthesise", {
			id = ItemCfg[arg_5_0.itemData_.id].decompose_id
		})
	end)
end

function var_0_0.SetData(arg_10_0, arg_10_1, arg_10_2)
	arg_10_0.itemData_ = arg_10_1

	arg_10_0.storeHeadInfoView_:SetData(arg_10_1)

	local var_10_0 = arg_10_1.id

	arg_10_0.descText_.text = ItemTools.getItemDesc(var_10_0)

	local var_10_1 = ItemCfg[var_10_0]
	local var_10_2 = false

	if var_10_1.compose_id ~= 0 and var_10_1.decompose_id ~= 0 then
		arg_10_0.btnController_:SetSelectedState("state3")
	elseif var_10_1.compose_id ~= 0 then
		arg_10_0.btnController_:SetSelectedState("state1")
	elseif var_10_1.decompose_id ~= 0 then
		arg_10_0.btnController_:SetSelectedState("state2")
	elseif ItemTools.isCanUseItem(var_10_0) then
		arg_10_0.btnController_:SetSelectedState("state0")
	else
		var_10_2 = true
	end

	if var_10_2 then
		arg_10_0.hideBtnController_:SetSelectedState("hide")
	else
		arg_10_0.hideBtnController_:SetSelectedState("show")
	end

	if not arg_10_2 then
		arg_10_0.selectInfoType_ = StoreConst.ITEM_INFO_TYPE.DESC
	end

	arg_10_0:RefreshInfo()

	arg_10_0.sourceList_ = ItemTools.GetItemSourceList(var_10_0)

	arg_10_0.uiList_:StartScroll(#arg_10_0.sourceList_)
end

function var_0_0.RefreshInfo(arg_11_0)
	if arg_11_0.selectInfoType_ == StoreConst.ITEM_INFO_TYPE.DESC then
		arg_11_0.switchBtnController_:SetSelectedState("desc")
	else
		arg_11_0.switchBtnController_:SetSelectedState("source")
	end
end

function var_0_0.IndexSourceItem(arg_12_0, arg_12_1, arg_12_2)
	arg_12_2:SetData(arg_12_0.sourceList_[arg_12_1])
end

return var_0_0
