local var_0_0 = import("game.views.recharge.pages.RechargePageBase")
local var_0_1 = class("RechargeSkinTargetPageView", var_0_0)

function var_0_1.OnCtor(arg_1_0, arg_1_1)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_1.transform

	arg_1_0:Init()
end

function var_0_1.InitUI(arg_2_0)
	arg_2_0:BindCfgUI()

	arg_2_0.giftList_ = LuaList.New(handler(arg_2_0, arg_2_0.indexItem), arg_2_0.listGo_, RechargeGiftItem)
end

function var_0_1.indexItem(arg_3_0, arg_3_1, arg_3_2)
	arg_3_2:SetData(arg_3_0.shopDataList_[arg_3_1])
	arg_3_2:SetOutOfDateHandler(handler(arg_3_0, arg_3_0.OnItemOutOfDate))
end

function var_0_1.OnItemOutOfDate(arg_4_0, arg_4_1)
	arg_4_0:RefreshList()

	if #arg_4_0.shopDataList_ == 0 and arg_4_0.treeRefreshHandler_ ~= nil then
		arg_4_0.treeRefreshHandler_()
	end
end

function var_0_1.OnBuySuccess(arg_5_0, arg_5_1, arg_5_2)
	if arg_5_0.curShopId_ == arg_5_2 then
		arg_5_0:RefreshList(true)
	end
end

function var_0_1.AddUIListener(arg_6_0)
	if SDKTools.GetIsInputServer("kr") then
		arg_6_0:AddBtnListener(arg_6_0.refundbtn_, nil, function()
			JumpTools.OpenPageByJump("gameHelpPro", {
				hideHomeBtn = 1,
				isPrefab = true,
				pages = {
					"Widget/System/Recharge/RefundPolicyKR_01"
				}
			})
		end)
	end

	if arg_6_0.fundsettlementmethodBtn_ and arg_6_0.commercialBtn_ then
		arg_6_0:AddBtnListener(arg_6_0.fundsettlementmethodBtn_, nil, function()
			local var_8_0 = "Payment_Services_Act_Url"
			local var_8_1 = OperationAction.GetOperationUrl(var_8_0)
			local var_8_2 = EncodeURL(var_8_1)

			print("url : ", var_8_2)

			local var_8_3 = OperationConst.URL_OPEN_WAY.NORMAL

			OperationAction.OpenUrl(var_8_2, var_8_3, nil)
		end)
		arg_6_0:AddBtnListener(arg_6_0.commercialBtn_, nil, function()
			local var_9_0 = "Specified_Commercial_Transactions_Url"
			local var_9_1 = OperationAction.GetOperationUrl(var_9_0)
			local var_9_2 = EncodeURL(var_9_1)

			print("url : ", var_9_2)

			local var_9_3 = OperationConst.URL_OPEN_WAY.NORMAL

			OperationAction.OpenUrl(var_9_2, var_9_3, nil)
		end)
	end
end

function var_0_1.SwitchPage(arg_10_0, arg_10_1)
	arg_10_0.curShopId_ = arg_10_1
	arg_10_0.shopDataList_ = arg_10_0:InitShopList(arg_10_1)

	arg_10_0.giftList_:StartScroll(#arg_10_0.shopDataList_)
	SetActive(arg_10_0.btnsGo_, GameToSDK.CURRENT_SERVER == SERVER_REGION.JAPAN)
	SetActive(arg_10_0.refundGo_, false)
	SetActive(arg_10_0.refundbtn_.gameObject, GameToSDK.CURRENT_SERVER == "kr")
end

function var_0_1.RefreshList(arg_11_0, arg_11_1)
	arg_11_1 = arg_11_1 or false
	arg_11_0.shopDataList_ = arg_11_0:InitShopList(arg_11_0.curShopId_)

	if arg_11_1 then
		local var_11_0 = arg_11_0.giftList_:GetScrolledPosition()

		arg_11_0.giftList_:StartScrollByPosition(#arg_11_0.shopDataList_, var_11_0)
	else
		arg_11_0.giftList_:StartScroll(#arg_11_0.shopDataList_)
	end
end

function var_0_1.InitShopList(arg_12_0, arg_12_1)
	local var_12_0 = ShopTools.FilterShopDataList(arg_12_1)

	table.sort(var_12_0, function(arg_13_0, arg_13_1)
		local var_13_0 = getShopCfg(arg_13_0.id, arg_12_1)
		local var_13_1 = getShopCfg(arg_13_1.id, arg_12_1)
		local var_13_2 = arg_12_0:GetGoodStatus(arg_13_0.id, arg_12_1)
		local var_13_3 = arg_12_0:GetGoodStatus(arg_13_1.id, arg_12_1)

		if var_13_2 ~= var_13_3 then
			return var_13_2 < var_13_3
		end

		if var_13_0.shop_sort ~= var_13_1.shop_sort then
			return var_13_0.shop_sort > var_13_1.shop_sort
		end

		return var_13_0.goods_id > var_13_1.goods_id
	end)

	return var_12_0
end

function var_0_1.GetGoodStatus(arg_14_0, arg_14_1, arg_14_2)
	local var_14_0 = false
	local var_14_1 = getShopCfg(arg_14_1, arg_14_2)
	local var_14_2 = ShopData.GetShop(var_14_1.shop_id)[arg_14_1]
	local var_14_3 = RechargeShopDescriptionCfg[var_14_1.description]

	if ShopData.IsGoodOutOfDate(arg_14_1, arg_14_2) then
		return 3
	end

	if var_14_2 ~= nil and var_14_1.limit_num ~= nil and var_14_1.limit_num ~= -1 and var_14_1.limit_num - var_14_2.buy_times <= 0 then
		var_14_0 = true
	end

	if var_14_0 then
		return 3
	end

	if var_14_3 and var_14_3.sub_type == ItemConst.ITEM_SUB_TYPE.SHOP_PACKS then
		for iter_14_0, iter_14_1 in ipairs(var_14_3.param) do
			if iter_14_1[1] then
				local var_14_4 = ItemCfg[iter_14_1[1]]

				if ItemTools.getItemNum(iter_14_1[1]) == 1 and var_14_4.type == ItemConst.ITEM_TYPE.HERO_SKIN then
					return 2
				end
			end
		end
	end

	if ShopData.IsGoodUnlock(arg_14_1, arg_14_2) == 0 then
		return 1
	end

	return 0
end

function var_0_1.AddEventListeners(arg_15_0)
	arg_15_0:RegistEventListener(SHOP_LIST_UPDATE, function(arg_16_0)
		if arg_16_0 > 0 and arg_16_0 == arg_15_0.curShopId_ then
			arg_15_0:RefreshList()
		end
	end)
	arg_15_0:RegistEventListener(SHOP_ITEM_UPDATE, function(arg_17_0, arg_17_1)
		arg_15_0:RefreshShopGoodInfo(arg_17_0, arg_17_1)
	end)
	arg_15_0:RegistEventListener(RECHARGE_SUCCESS, function(arg_18_0)
		arg_15_0:RefreshList(true)
	end)
end

function var_0_1.UpdateShopList(arg_19_0, arg_19_1)
	if arg_19_1 == arg_19_0.curShopId_ then
		arg_19_0.giftList_:Refresh()
	end
end

function var_0_1.RefreshShopGoodInfo(arg_20_0, arg_20_1, arg_20_2)
	if arg_20_0.curShopId_ ~= arg_20_1 then
		return
	end

	for iter_20_0, iter_20_1 in pairs(arg_20_0.giftList_:GetItemList()) do
		if arg_20_2 == iter_20_1.goodId_ then
			iter_20_1:SetData(iter_20_1.index_, iter_20_1.shopId_, iter_20_1.goodId_)
		end
	end
end

function var_0_1.OnShopBuyResult(arg_21_0, arg_21_1, arg_21_2, arg_21_3, arg_21_4)
	if arg_21_1 == 0 then
		arg_21_0:RefreshList(true)
	end
end

function var_0_1.OnTop(arg_22_0)
	return
end

function var_0_1.OnEnter(arg_23_0)
	arg_23_0:AddEventListeners()

	if arg_23_0.timer_ == nil then
		arg_23_0.timer_ = FrameTimer.New(function()
			if arg_23_0.giftList_ ~= nil then
				for iter_24_0, iter_24_1 in ipairs(arg_23_0.giftList_:GetItemList()) do
					iter_24_1:UpdateTimerView()
				end
			end
		end, 1, -1)

		arg_23_0.timer_:Start()
	end

	SetActive(arg_23_0.btnsGo_, GameToSDK.CURRENT_SERVER == SERVER_REGION.JAPAN)
	SetActive(arg_23_0.refundGo_, false)
	SetActive(arg_23_0.refundbtn_.gameObject, GameToSDK.CURRENT_SERVER == "kr")
end

function var_0_1.OnExit(arg_25_0)
	if arg_25_0.timer_ ~= nil then
		arg_25_0.timer_:Stop()

		arg_25_0.timer_ = nil
	end
end

function var_0_1.Hide(arg_26_0)
	var_0_1.super.Hide(arg_26_0)
end

function var_0_1.SetTreeRefreshHandler(arg_27_0, arg_27_1)
	arg_27_0.treeRefreshHandler_ = arg_27_1
end

function var_0_1.Dispose(arg_28_0)
	if arg_28_0.giftList_ then
		arg_28_0.giftList_:Dispose()

		arg_28_0.giftList_ = nil
	end

	arg_28_0.treeRefreshHandler_ = nil

	var_0_1.super.Dispose(arg_28_0)
end

return var_0_1
