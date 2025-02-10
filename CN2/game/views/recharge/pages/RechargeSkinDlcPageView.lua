local var_0_0 = import("game.views.recharge.pages.RechargePageBase")
local var_0_1 = class("RechargeSkinDlcPageView", var_0_0)

function var_0_1.OnCtor(arg_1_0, arg_1_1)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_1.transform

	arg_1_0:Init()
end

function var_0_1.InitUI(arg_2_0)
	arg_2_0:BindCfgUI()

	arg_2_0.goodTypeController_ = ControllerUtil.GetController(arg_2_0.transform_, "text")

	local var_2_0 = arg_2_0.viewTrs_.rect.width
	local var_2_1 = arg_2_0.contTrs_:GetComponent("HorizontalLayoutGroup").spacing

	arg_2_0.loopScrollView_ = LoopScrollView.New(arg_2_0, arg_2_0.scrollEx_, arg_2_0.contTrs_, arg_2_0.viewTrs_, var_2_0, var_2_1, nil, true)
	arg_2_0.item1Pool = {}
	arg_2_0.item2Pool = {}
end

function var_0_1.OnItemOutOfDate(arg_3_0, arg_3_1)
	arg_3_0:RefreshList()

	if #arg_3_0.skinDataList_ == 0 and arg_3_0.treeRefreshHandler_ ~= nil then
		arg_3_0.treeRefreshHandler_()
	end
end

function var_0_1.AddEventListeners(arg_4_0)
	arg_4_0:RegistEventListener(SHOP_LIST_UPDATE, function(arg_5_0)
		if arg_5_0 > 0 and arg_5_0 == arg_4_0.curShopId_ then
			arg_4_0:RefreshList()
		end
	end)
	arg_4_0:RegistEventListener(SHOP_ITEM_UPDATE, function(arg_6_0, arg_6_1)
		arg_4_0:RefreshShopGoodInfo(arg_6_0, arg_6_1)
	end)
	arg_4_0:RegistEventListener(RECHARGE_SUCCESS, function(arg_7_0)
		arg_4_0:SwitchPage(arg_4_0.curShopId_)
	end)
end

function var_0_1.AddUIListener(arg_8_0)
	if SDKTools.GetIsInputServer("kr") then
		arg_8_0:AddBtnListener(arg_8_0.refundbtn_, nil, function()
			JumpTools.OpenPageByJump("gameHelpPro", {
				pages = {
					"TextureConfig/RechargeUI/RefundPolicy@kr"
				}
			})
		end)
	end

	if arg_8_0.fundsettlementmethodBtn_ and arg_8_0.commercialBtn_ then
		arg_8_0:AddBtnListener(arg_8_0.fundsettlementmethodBtn_, nil, function()
			GameToSDK.SendMessage(string.format("{\"messageType\" : \"ShowAgreement\" , \"type\" : \"%s\"}", fund_settlement_algorithm))
		end)
		arg_8_0:AddBtnListener(arg_8_0.commercialBtn_, nil, function()
			GameToSDK.SendMessage(string.format("{\"messageType\" : \"ShowAgreement\" , \"type\" : \"%s\"}", specific_commercial_transaction_act))
		end)
	end
end

function var_0_1.SwitchPage(arg_12_0, arg_12_1)
	arg_12_0.curShopId_ = arg_12_1
	arg_12_0.skinDataList_ = arg_12_0:InitDataList(arg_12_1)

	arg_12_0.loopScrollView_:NavigateIndex(1)
	LayoutRebuilder.ForceRebuildLayoutImmediate(arg_12_0.loopScrollView_.rectGrid_)

	arg_12_0.loopScrollView_.scrollView_.horizontalNormalizedPosition = 0
end

function var_0_1.RefreshList(arg_13_0, arg_13_1)
	if arg_13_0.timer_ == nil then
		arg_13_0.timer_ = FrameTimer.New(function()
			for iter_14_0, iter_14_1 in pairs(arg_13_0.item1Pool) do
				iter_14_1.itemView:UpdateTimerView()
			end

			for iter_14_2, iter_14_3 in pairs(arg_13_0.item2Pool) do
				iter_14_3.itemView:UpdateTimerView()
			end

			arg_13_0:UpdateTimer()
		end, 1, -1)

		arg_13_0.timer_:Start()
	end
end

function var_0_1.InitDataList(arg_15_0, arg_15_1)
	local var_15_0 = ShopTools.FilterShopDataList(arg_15_1)
	local var_15_1 = {}

	for iter_15_0, iter_15_1 in ipairs(var_15_0) do
		local var_15_2 = getShopCfg(iter_15_1.id).description
		local var_15_3 = RechargeShopDescriptionCfg[var_15_2]

		if var_15_3 and SkinCfg[var_15_3.param[1]] then
			table.insert(var_15_1, iter_15_1)
		end
	end

	return ShopTools.CommonSort(var_15_1)
end

function var_0_1.GetGoodStatus(arg_16_0, arg_16_1)
	local var_16_0 = getShopCfg(arg_16_1).description
	local var_16_1 = RechargeShopDescriptionCfg[var_16_0].param[1]

	if ShopTools.HaveSkin(var_16_1) or HeroTools.CanChangeSkin(var_16_1) then
		return 2
	end

	if ShopData.IsGoodUnlock(arg_16_1) == 0 then
		return 1
	end

	return 0
end

function var_0_1.RefreshShopGoodInfo(arg_17_0, arg_17_1, arg_17_2)
	if arg_17_0.curShopId_ ~= arg_17_1 then
		return
	end
end

function var_0_1.OnEnter(arg_18_0)
	arg_18_0:AddEventListeners()
	SetActive(arg_18_0.refundGo_, not SDKTools.GetIsInputServer("kr"))
	SetActive(arg_18_0.refundbtn_.gameObject, false)
	arg_18_0:RefreshList()
	SetActive(arg_18_0.btnsGo_, GameToSDK.CURRENT_SERVER == SERVER_REGION.JAPAN)
	SetActive(arg_18_0.refundGo_, not SDKTools.GetIsKorea())
	SetActive(arg_18_0.refundbtn_.gameObject, false)

	if SDKTools.GetIsInputServer("kr") then
		SetActive(arg_18_0.refundbtn_.gameObject, arg_18_0.curPageIndex_ ~= 4 and arg_18_0.curPageIndex_ ~= 6)
	end
end

function var_0_1.UpdateTimer(arg_19_0)
	return
end

function var_0_1.Show(arg_20_0)
	var_0_1.super.Show(arg_20_0)
	arg_20_0:RefreshList()
end

function var_0_1.OnExit(arg_21_0)
	if arg_21_0.timer_ ~= nil then
		arg_21_0.timer_:Stop()

		arg_21_0.timer_ = nil
	end

	for iter_21_0, iter_21_1 in pairs(arg_21_0.item1Pool) do
		iter_21_1.itemView:OnExit()
	end

	for iter_21_2, iter_21_3 in pairs(arg_21_0.item2Pool) do
		iter_21_3.itemView:OnExit()
	end
end

function var_0_1.Hide(arg_22_0)
	var_0_1.super.Hide(arg_22_0)
end

function var_0_1.SetTreeRefreshHandler(arg_23_0, arg_23_1)
	arg_23_0.treeRefreshHandler_ = arg_23_1
end

function var_0_1.Dispose(arg_24_0)
	arg_24_0:RemoveAllEventListener()

	if arg_24_0.skinList_ then
		arg_24_0.skinList_:Dispose()

		arg_24_0.skinList_ = nil
	end

	arg_24_0.treeRefreshHandler_ = nil

	for iter_24_0, iter_24_1 in pairs(arg_24_0.item1Pool) do
		iter_24_1.itemView:Dispose()
	end

	for iter_24_2, iter_24_3 in pairs(arg_24_0.item2Pool) do
		iter_24_3.itemView:Dispose()
	end

	arg_24_0.item1Pool = nil
	arg_24_0.item2Pool = nil
	arg_24_0.itemEquipPool = nil

	var_0_1.super.Dispose(arg_24_0)
end

function var_0_1.OnBuySuccess(arg_25_0, arg_25_1, arg_25_2)
	if arg_25_0.curShopId_ == arg_25_2 or arg_25_2 == 54 then
		arg_25_0:RefreshList(true)
	end
end

function var_0_1.LsRemoveItem(arg_26_0, arg_26_1)
	arg_26_1.itemView:Show(false)

	arg_26_1.isFree = true
end

function var_0_1.GetFreeItem(arg_27_0, arg_27_1, arg_27_2)
	for iter_27_0, iter_27_1 in pairs(arg_27_1) do
		if iter_27_1.isFree == true then
			iter_27_1.isFree = false

			return iter_27_1
		end
	end

	local var_27_0 = {
		isFree = false,
		itemView = arg_27_2()
	}

	table.insert(arg_27_1, var_27_0)

	return var_27_0
end

function var_0_1.LsAddItem(arg_28_0, arg_28_1, arg_28_2)
	local var_28_0
	local var_28_1 = getShopCfg(arg_28_1.id)
	local var_28_2 = var_28_1.dlc ~= nil and var_28_1.dlc ~= 0
	local var_28_3

	if var_28_2 then
		var_28_3 = getShopCfg(var_28_1.dlc)
	end

	if var_28_2 and var_28_3 then
		var_28_0 = arg_28_0:GetFreeItem(arg_28_0.item1Pool, function()
			return RechargeSkinAllItem.New(arg_28_0.item1Go_, arg_28_0.contTrs_.gameObject)
		end)
	else
		var_28_0 = arg_28_0:GetFreeItem(arg_28_0.item2Pool, function()
			return RechargeSkinNormalItem.New(arg_28_0.item2Go_, arg_28_0.contTrs_.gameObject)
		end)
	end

	var_28_0.itemView:SetData(arg_28_1, arg_28_2)

	return var_28_0
end

function var_0_1.LsGetItemData(arg_31_0)
	return arg_31_0.skinDataList_
end

function var_0_1.LsUpdateItem(arg_32_0, arg_32_1, arg_32_2, arg_32_3)
	arg_32_1.itemView:SetData(arg_32_2, arg_32_3)
end

return var_0_1
