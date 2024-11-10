local var_0_0 = class("DormItemPopView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/BackHouseUI/Dorm/DormFurnitureInfoPopUI_02"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiPop.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:InitUI()
	arg_3_0:AddListeners()
end

function var_0_0.InitUI(arg_4_0)
	arg_4_0:BindCfgUI()
end

function var_0_0.AddListeners(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.maskBtn_, nil, function()
		arg_5_0:Back()
	end)
end

function var_0_0.OnEnter(arg_7_0)
	arg_7_0.itemID = arg_7_0.params_.id

	arg_7_0:RefreshView()
end

function var_0_0.RefreshView(arg_8_0)
	arg_8_0:RefreshCommonItem()
	arg_8_0:RefreshItemInfo()
	arg_8_0:RefreshLableContent()
end

function var_0_0.RefreshCommonItem(arg_9_0)
	if not arg_9_0.commonItemView_ then
		arg_9_0.commonItemView_ = CommonItemView.New(arg_9_0.commonItem_)
	end

	arg_9_0.commonItemView_:SetData({
		id = arg_9_0.itemID
	})
end

function var_0_0.RefreshItemInfo(arg_10_0)
	local var_10_0 = DormData:GetFurNumInfo(arg_10_0.itemID)

	arg_10_0.holdNum.text = tostring(var_10_0.num)
end

function var_0_0.RefreshLableContent(arg_11_0)
	if ItemCfg[arg_11_0.itemID] then
		arg_11_0.ItemDesc.text = ItemTools.getItemDesc(arg_11_0.itemID)
	else
		arg_11_0.ItemDesc.text = ""
	end

	arg_11_0.titletextText_.text = ItemTools.getItemName(arg_11_0.itemID)
	arg_11_0.typeDesc.text = DormTools:GetFurGiftTypeDesc(arg_11_0.itemID)

	local var_11_0 = ""
	local var_11_1 = BackHomeFurniture[arg_11_0.itemID].scene_id

	for iter_11_0, iter_11_1 in ipairs(var_11_1) do
		var_11_0 = var_11_0 .. DormTools:GetRoomTypeName(iter_11_1) .. " "
	end

	arg_11_0.sceneDesc.text = var_11_0
	arg_11_0.giftMax.text = DormTools:GetFurGiftMaxDesc(arg_11_0.itemID)
	arg_11_0.comfortNum.text = DormTools:GetFurComfortDesc(arg_11_0.itemID)
end

function var_0_0.Dispose(arg_12_0)
	if arg_12_0.commonItemView_ then
		arg_12_0.commonItemView_:Dispose()
	end

	var_0_0.super.Dispose(arg_12_0)
end

function var_0_0.Cacheable(arg_13_0)
	return false
end

return var_0_0
