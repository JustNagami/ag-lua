﻿local var_0_0 = import("game.views.recharge.pages.RechargePageBase")
local var_0_1 = class("RechargeSkinListPageView", var_0_0)
local var_0_2 = {
	SKIN = 1,
	DLC = 2
}
local var_0_3 = {
	SKIN_BUY = 1,
	DLC_CANT = 4,
	FREE = 0,
	SKIN_CANT = 3,
	DLC_BUY = 2
}

function var_0_1.ResetPool(arg_1_0)
	if arg_1_0.itemPool_ then
		arg_1_0:CleanPool()
	end

	arg_1_0.itemPool_ = {
		[var_0_2.SKIN] = {},
		[var_0_2.DLC] = {}
	}
end

function var_0_1.CleanPool(arg_2_0)
	if not arg_2_0.itemPool_ then
		return
	end

	for iter_2_0, iter_2_1 in pairs(arg_2_0.itemPool_[var_0_2.SKIN]) do
		iter_2_1.itemView:Dispose()
	end

	for iter_2_2, iter_2_3 in pairs(arg_2_0.itemPool_[var_0_2.DLC]) do
		iter_2_3.itemView:Dispose()
	end
end

function var_0_1.GetItem(arg_3_0, arg_3_1, arg_3_2)
	local var_3_0 = arg_3_0.itemPool_[arg_3_1][arg_3_2.id]

	if var_3_0 then
		var_3_0.itemView:Show(true)

		return var_3_0
	else
		return arg_3_0:CreateItem(arg_3_1, arg_3_2, var_0_3.FREE)
	end
end

function var_0_1.SetItem(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
	local var_4_0 = arg_4_0:GetItem(arg_4_1, arg_4_2)

	var_4_0.itemIndex = arg_4_3

	var_4_0.itemGo.transform:SetParent(arg_4_0.contentTrs_[arg_4_3], true)
end

function var_0_1.FreeItem(arg_5_0, arg_5_1, arg_5_2)
	return
end

function var_0_1.CreateItem(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
	if arg_6_0.itemPool_[arg_6_1][arg_6_2.id] then
		return arg_6_0.itemPool_[arg_6_1][arg_6_2.id]
	end

	local var_6_0
	local var_6_1

	if arg_6_1 == var_0_2.SKIN then
		var_6_0 = RechargeSkinNormalItem.New(arg_6_0.itemSkinGo_, arg_6_0.contentTrs_[arg_6_3])
		var_6_1 = var_6_0.gameObject_

		var_6_0:SetData(arg_6_2)
	elseif arg_6_1 == var_0_2.DLC then
		var_6_1 = Object.Instantiate(arg_6_0.itemSkinGo_, arg_6_0.contentTrs_[arg_6_3])
		var_6_0 = RechargeSkinListDlcItem.New(var_6_1)

		local var_6_2 = getShopCfg(arg_6_2.id)
		local var_6_3

		if var_6_2.description then
			var_6_3 = RechargeShopDescriptionCfg[var_6_2.description].param[1]
		end

		var_6_0:SetData(var_6_2.dlc, var_6_3, arg_6_2.id)
	end

	if var_6_0 then
		local var_6_4 = {
			itemView = var_6_0,
			itemGo = var_6_1,
			itemIndex = arg_6_3
		}

		arg_6_0.itemPool_[arg_6_1][arg_6_2.id] = var_6_4
	end

	return arg_6_0.itemPool_[arg_6_1][arg_6_2.id] or nil
end

function var_0_1.OnCtor(arg_7_0, arg_7_1)
	arg_7_0.gameObject_ = arg_7_1
	arg_7_0.transform_ = arg_7_1.transform

	arg_7_0:Init()
end

function var_0_1.InitUI(arg_8_0)
	arg_8_0:BindCfgUI()

	arg_8_0.goodTypeController_ = ControllerUtil.GetController(arg_8_0.transform_, "text")
	arg_8_0.contentTrs_ = {}

	for iter_8_0 = 0, 4 do
		arg_8_0.contentTrs_[iter_8_0] = arg_8_0["contentTrs_" .. iter_8_0]
	end

	arg_8_0:InitFilterParams()
	arg_8_0:ResetPool()
end

function var_0_1.AddEventListeners(arg_9_0)
	return
end

function var_0_1.AddUIListener(arg_10_0)
	if SDKTools.GetIsInputServer("kr") then
		arg_10_0:AddBtnListener(arg_10_0.refundbtn_, nil, function()
			JumpTools.OpenPageByJump("gameHelpPro", {
				pages = {
					"TextureConfig/RechargeUI/RefundPolicy@kr"
				}
			})
		end)
	end

	if arg_10_0.fundsettlementmethodBtn_ and arg_10_0.commercialBtn_ then
		arg_10_0:AddBtnListener(arg_10_0.fundsettlementmethodBtn_, nil, function()
			GameToSDK.SendMessage(string.format("{\"messageType\" : \"ShowAgreement\" , \"type\" : \"%s\"}", fund_settlement_algorithm))
		end)
		arg_10_0:AddBtnListener(arg_10_0.commercialBtn_, nil, function()
			GameToSDK.SendMessage(string.format("{\"messageType\" : \"ShowAgreement\" , \"type\" : \"%s\"}", specific_commercial_transaction_act))
		end)
	end
end

function var_0_1.InitDataList(arg_14_0)
	arg_14_0.dataList_ = {
		skin = {},
		dlc = {},
		heroID = {}
	}

	local var_14_0 = {
		ShopConst.SHOP_ID.SKIN_SHOP,
		ShopConst.SHOP_ID.DIRECT_SHOP,
		ShopConst.SHOP_ID.REPURCHASE_SHOP
	}

	for iter_14_0, iter_14_1 in ipairs(var_14_0) do
		local var_14_1 = ShopTools.FilterShopDataList(iter_14_1)

		for iter_14_2, iter_14_3 in ipairs(var_14_1) do
			local var_14_2 = getShopCfg(iter_14_3.id)
			local var_14_3 = var_14_2.description
			local var_14_4 = RechargeShopDescriptionCfg[var_14_3]

			if var_14_4 and SkinCfg[var_14_4.param[1]] then
				table.insert(arg_14_0.dataList_.skin, iter_14_3)

				local var_14_5 = var_14_4.param[1]
				local var_14_6 = SkinCfg[var_14_5].hero

				if not table.keyof(arg_14_0.dataList_.heroID, var_14_6) then
					table.insert(arg_14_0.dataList_.heroID, var_14_6)
				end

				if iter_14_1 == var_14_0[1] then
					local var_14_7 = var_14_2.dlc ~= nil and var_14_2.dlc ~= 0
					local var_14_8

					if var_14_7 then
						var_14_8 = getShopCfg(var_14_2.dlc)
					end

					if var_14_7 and var_14_8 then
						table.insert(arg_14_0.dataList_.dlc, iter_14_3)
					end
				end
			end
		end
	end
end

function var_0_1.RefreshList(arg_15_0)
	if arg_15_0.dataList_ == nil then
		arg_15_0:InitDataList()
	end

	local var_15_0 = {
		[var_0_3.SKIN_BUY] = 0,
		[var_0_3.DLC_BUY] = 0,
		[var_0_3.SKIN_CANT] = 0,
		[var_0_3.DLC_CANT] = 0
	}

	for iter_15_0 = 1, 4 do
		SetActive(arg_15_0.contentTrs_[iter_15_0].gameObject, true)
	end

	for iter_15_1, iter_15_2 in ipairs(arg_15_0.dataList_.skin) do
		local var_15_1 = arg_15_0:GetItem(var_0_2.SKIN, iter_15_2)

		var_15_1.itemView:Show(true)
		var_15_1.itemView:OnEnter()

		local var_15_2 = var_0_3.FREE

		if arg_15_0:GetGoodStatus(iter_15_2.id) == 0 then
			var_15_2 = var_0_3.SKIN_BUY

			arg_15_0:SetItem(var_0_2.SKIN, iter_15_2, var_0_3.SKIN_BUY)
		else
			var_15_2 = var_0_3.SKIN_CANT

			arg_15_0:SetItem(var_0_2.SKIN, iter_15_2, var_0_3.SKIN_CANT)
		end

		var_15_0[var_15_2] = var_15_0[var_15_2] + 1

		local var_15_3 = getShopCfg(iter_15_2.id).description
		local var_15_4 = RechargeShopDescriptionCfg[var_15_3].param[1]
		local var_15_5 = SkinCfg[var_15_4].hero
		local var_15_6 = arg_15_0.skinListFilterParams_.stateType == ShopConst.FILTER_STATE_TYPE.CAN_BUY and arg_15_0:GetGoodStatus(iter_15_2.id) ~= 0
		local var_15_7 = arg_15_0.skinListFilterParams_.stateType == ShopConst.FILTER_STATE_TYPE.CANT_BUY and arg_15_0:GetGoodStatus(iter_15_2.id) == 0
		local var_15_8 = arg_15_0.skinListFilterParams_.goodType == ShopConst.FILTER_HERO_TYPE.DLC
		local var_15_9 = arg_15_0.skinListFilterParams_.heroIDList and #arg_15_0.skinListFilterParams_.heroIDList > 0 and not table.keyof(arg_15_0.skinListFilterParams_.heroIDList, var_15_5)

		if var_15_6 or var_15_7 or var_15_8 or var_15_9 then
			var_15_1.itemView:Show(false)

			var_15_0[var_15_2] = var_15_0[var_15_2] - 1
		end
	end

	for iter_15_3, iter_15_4 in ipairs(arg_15_0.dataList_.dlc) do
		local var_15_10 = arg_15_0:GetItem(var_0_2.DLC, iter_15_4)

		var_15_10.itemView:Show(true)
		var_15_10.itemView:UpdateView()

		local var_15_11 = var_0_3.FREE
		local var_15_12 = getShopCfg(iter_15_4.id)

		if ShopTools.CheckDlcPurchased(var_15_12.dlc) == true then
			var_15_11 = var_0_3.DLC_CANT

			arg_15_0:SetItem(var_0_2.DLC, iter_15_4, var_0_3.DLC_CANT)
		else
			var_15_11 = var_0_3.DLC_BUY

			arg_15_0:SetItem(var_0_2.DLC, iter_15_4, var_0_3.DLC_BUY)
		end

		var_15_0[var_15_11] = var_15_0[var_15_11] + 1

		local var_15_13 = var_15_12.description
		local var_15_14 = RechargeShopDescriptionCfg[var_15_13].param[1]
		local var_15_15 = SkinCfg[var_15_14].hero
		local var_15_16 = arg_15_0.skinListFilterParams_.stateType == ShopConst.FILTER_STATE_TYPE.CAN_BUY and ShopTools.CheckDlcPurchased(var_15_12.dlc)
		local var_15_17 = arg_15_0.skinListFilterParams_.stateType == ShopConst.FILTER_STATE_TYPE.CANT_BUY and not ShopTools.CheckDlcPurchased(var_15_12.dlc)
		local var_15_18 = arg_15_0.skinListFilterParams_.goodType == ShopConst.FILTER_HERO_TYPE.SKIN
		local var_15_19 = arg_15_0.skinListFilterParams_.heroIDList and #arg_15_0.skinListFilterParams_.heroIDList > 0 and not table.keyof(arg_15_0.skinListFilterParams_.heroIDList, var_15_15)

		if var_15_16 or var_15_17 or var_15_18 or var_15_19 then
			var_15_10.itemView:Show(false)

			var_15_0[var_15_11] = var_15_0[var_15_11] - 1
		end
	end

	for iter_15_5, iter_15_6 in pairs(var_15_0) do
		if iter_15_6 == 0 then
			SetActive(arg_15_0["titleGo_" .. iter_15_5], false)
		else
			SetActive(arg_15_0["titleGo_" .. iter_15_5], true)
		end
	end
end

function var_0_1.InitFilterParams(arg_16_0)
	arg_16_0.skinListFilterParams_ = {
		heroIDList = {},
		goodType = ShopConst.FILTER_HERO_TYPE.ALL,
		stateType = ShopConst.FILTER_STATE_TYPE.ALL
	}
end

function var_0_1.OnSkinListFilterApply(arg_17_0, arg_17_1)
	arg_17_0.skinListFilterParams_.heroIDList = arg_17_1.heroIDList
	arg_17_0.skinListFilterParams_.goodType = arg_17_1.goodType
	arg_17_0.skinListFilterParams_.stateType = arg_17_1.stateType

	arg_17_0:RefreshList()
end

function var_0_1.OpenFilterView(arg_18_0)
	arg_18_0:Go("rechargeSkinListFilterView", {
		filterParams = arg_18_0.skinListFilterParams_,
		heroIDList = arg_18_0.dataList_.heroID
	})
end

function var_0_1.GetGoodStatus(arg_19_0, arg_19_1)
	local var_19_0 = getShopCfg(arg_19_1).description
	local var_19_1 = RechargeShopDescriptionCfg[var_19_0].param[1]

	if ShopTools.HaveSkin(var_19_1) or HeroTools.CanChangeSkin(var_19_1) then
		return 2
	end

	if ShopData.IsGoodUnlock(arg_19_1) == 0 then
		return 1
	end

	return 0
end

function var_0_1.OnEnter(arg_20_0)
	arg_20_0:AddEventListeners()
	SetActive(arg_20_0.refundGo_, not SDKTools.GetIsInputServer("kr"))
	SetActive(arg_20_0.refundbtn_.gameObject, false)
	arg_20_0:RefreshList()
	SetActive(arg_20_0.btnsGo_, GameToSDK.CURRENT_SERVER == SERVER_REGION.JAPAN)
	SetActive(arg_20_0.refundGo_, not SDKTools.GetIsKorea())
	SetActive(arg_20_0.refundbtn_.gameObject, false)

	if SDKTools.GetIsInputServer("kr") then
		SetActive(arg_20_0.refundbtn_.gameObject, arg_20_0.curPageIndex_ ~= 4 and arg_20_0.curPageIndex_ ~= 6)
	end
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

	for iter_22_0, iter_22_1 in pairs(arg_22_0.itemPool_[var_0_2.SKIN]) do
		iter_22_1.itemView:OnExit()
	end

	for iter_22_2, iter_22_3 in pairs(arg_22_0.itemPool_[var_0_2.DLC]) do
		iter_22_3.itemView:OnExit()
	end
end

function var_0_1.Hide(arg_23_0)
	var_0_1.super.Hide(arg_23_0)
end

function var_0_1.Dispose(arg_24_0)
	arg_24_0:RemoveAllEventListener()
	arg_24_0:CleanPool()
	var_0_1.super.Dispose(arg_24_0)
end

function var_0_1.OnBuySuccess(arg_25_0, arg_25_1, arg_25_2)
	if arg_25_0.curShopId_ == arg_25_2 or arg_25_2 == 54 then
		arg_25_0:RefreshList(true)
	end
end

return var_0_1
