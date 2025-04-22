local var_0_0 = import("game.views.recharge.pages.RechargePageBase")
local var_0_1 = class("RechargeSkinPageView", var_0_0)

function var_0_1.OnCtor(arg_1_0, arg_1_1)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_1.transform

	arg_1_0:Init()
end

function var_0_1.InitUI(arg_2_0)
	arg_2_0:BindCfgUI()

	arg_2_0.goodTypeController_ = ControllerUtil.GetController(arg_2_0.transform_, "text")
	arg_2_0.skinList_ = LuaList.New(handler(arg_2_0, arg_2_0.indexItem), arg_2_0.listGo_, RechargeSkinNewItem)
end

function var_0_1.indexItem(arg_3_0, arg_3_1, arg_3_2)
	arg_3_2:SetData(arg_3_0.skinDataList_[arg_3_1])
	arg_3_2:SetOutOfDateHandler(handler(arg_3_0, arg_3_0.OnItemOutOfDate))
end

function var_0_1.OnItemOutOfDate(arg_4_0, arg_4_1)
	arg_4_0:RefreshList()

	if #arg_4_0.skinDataList_ == 0 and arg_4_0.treeRefreshHandler_ ~= nil then
		arg_4_0.treeRefreshHandler_()
	end
end

function var_0_1.AddEventListeners(arg_5_0)
	arg_5_0:RegistEventListener(SHOP_LIST_UPDATE, function(arg_6_0)
		if arg_6_0 > 0 and arg_6_0 == arg_5_0.curShopId_ then
			arg_5_0:RefreshList()
		end
	end)
	arg_5_0:RegistEventListener(SHOP_ITEM_UPDATE, function(arg_7_0, arg_7_1)
		arg_5_0:RefreshShopGoodInfo(arg_7_0, arg_7_1)
	end)
	arg_5_0:RegistEventListener(RECHARGE_SUCCESS, function(arg_8_0)
		arg_5_0:RefreshList()
	end)
end

function var_0_1.AddUIListener(arg_9_0)
	if SDKTools.GetIsInputServer("kr") then
		arg_9_0:AddBtnListener(arg_9_0.refundbtn_, nil, function()
			JumpTools.OpenPageByJump("gameHelpPro", {
				hideHomeBtn = 1,
				isPrefab = true,
				pages = {
					"Widget/System/Recharge/RefundPolicyKR_01"
				}
			})
		end)
	end

	if arg_9_0.fundsettlementmethodBtn_ and arg_9_0.commercialBtn_ then
		arg_9_0:AddBtnListener(arg_9_0.fundsettlementmethodBtn_, nil, function()
			local var_11_0 = "Payment_Services_Act_Url"
			local var_11_1 = OperationAction.GetOperationUrl(var_11_0)
			local var_11_2 = EncodeURL(var_11_1)

			print("url : ", var_11_2)

			local var_11_3 = OperationConst.URL_OPEN_WAY.NORMAL

			OperationAction.OpenUrl(var_11_2, var_11_3, nil)
		end)
		arg_9_0:AddBtnListener(arg_9_0.commercialBtn_, nil, function()
			local var_12_0 = "Specified_Commercial_Transactions_Url"
			local var_12_1 = OperationAction.GetOperationUrl(var_12_0)
			local var_12_2 = EncodeURL(var_12_1)

			print("url : ", var_12_2)

			local var_12_3 = OperationConst.URL_OPEN_WAY.NORMAL

			OperationAction.OpenUrl(var_12_2, var_12_3, nil)
		end)
	end
end

function var_0_1.SwitchPage(arg_13_0, arg_13_1)
	arg_13_0.curShopId_ = arg_13_1
	arg_13_0.skinDataList_ = arg_13_0:InitDataList(arg_13_1)

	arg_13_0.skinList_:StartScroll(#arg_13_0.skinDataList_)
	SetActive(arg_13_0.refundGo_, false)
	SetActive(arg_13_0.refundbtn_.gameObject, GameToSDK.CURRENT_SERVER == "kr")
	SetActive(arg_13_0.btnsGo_, GameToSDK.CURRENT_SERVER == SERVER_REGION.JAPAN)
end

function var_0_1.RefreshList(arg_14_0, arg_14_1)
	arg_14_1 = arg_14_1 or false
	arg_14_0.skinDataList_ = arg_14_0:InitDataList(arg_14_0.curShopId_)

	if arg_14_1 then
		local var_14_0 = arg_14_0.skinList_:GetScrolledPosition()

		arg_14_0.skinList_:StartScrollByPosition(#arg_14_0.skinDataList_, var_14_0)
	elseif arg_14_0.skinList_ then
		arg_14_0.skinList_:StartScroll(#arg_14_0.skinDataList_)
	end
end

function var_0_1.InitDataList(arg_15_0, arg_15_1)
	local var_15_0 = ShopTools.FilterShopDataList(arg_15_1)
	local var_15_1 = {}

	for iter_15_0, iter_15_1 in ipairs(var_15_0) do
		local var_15_2 = getShopCfg(iter_15_1.id).description
		local var_15_3 = RechargeShopDescriptionCfg[var_15_2]

		if SkinCfg[var_15_3.param[1]] then
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

	for iter_17_0, iter_17_1 in pairs(arg_17_0.skinList_:GetItemList()) do
		if arg_17_2 == iter_17_1.goodId_ then
			iter_17_1:SetData(iter_17_1.index_, iter_17_1.shopId_, iter_17_1.goodId_)
		end
	end
end

function var_0_1.OnEnter(arg_18_0)
	arg_18_0:AddEventListeners()
	SetActive(arg_18_0.refundGo_, false)
	SetActive(arg_18_0.refundbtn_.gameObject, false)

	if arg_18_0.timer_ == nil then
		arg_18_0.timer_ = FrameTimer.New(function()
			if arg_18_0.skinList_ ~= nil then
				for iter_19_0, iter_19_1 in pairs(arg_18_0.skinList_:GetItemList()) do
					iter_19_1:UpdateTimerView()
				end
			end

			arg_18_0:UpdateTimer()
		end, 1, -1)

		arg_18_0.timer_:Start()
	end

	SetActive(arg_18_0.btnsGo_, GameToSDK.CURRENT_SERVER == SERVER_REGION.JAPAN)
	SetActive(arg_18_0.refundGo_, false)
	SetActive(arg_18_0.refundbtn_.gameObject, GameToSDK.CURRENT_SERVER == "kr")
end

function var_0_1.UpdateTimer(arg_20_0)
	return
end

function var_0_1.Show(arg_21_0)
	var_0_1.super.Show(arg_21_0)
	arg_21_0:RefreshList()
end

function var_0_1.OnExit(arg_22_0)
	if arg_22_0.timer_ ~= nil then
		arg_22_0.timer_:Stop()

		arg_22_0.timer_ = nil
	end
end

function var_0_1.Hide(arg_23_0)
	var_0_1.super.Hide(arg_23_0)
end

function var_0_1.SetTreeRefreshHandler(arg_24_0, arg_24_1)
	arg_24_0.treeRefreshHandler_ = arg_24_1
end

function var_0_1.Dispose(arg_25_0)
	arg_25_0:RemoveAllEventListener()

	if arg_25_0.skinList_ then
		arg_25_0.skinList_:Dispose()

		arg_25_0.skinList_ = nil
	end

	arg_25_0.treeRefreshHandler_ = nil

	var_0_1.super.Dispose(arg_25_0)
end

function var_0_1.OnBuySuccess(arg_26_0, arg_26_1, arg_26_2)
	if arg_26_0.curShopId_ == arg_26_2 or arg_26_2 == 54 then
		arg_26_0:RefreshList(true)
	end
end

return var_0_1
