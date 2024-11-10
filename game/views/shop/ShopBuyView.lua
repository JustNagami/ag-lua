local var_0_0 = class("ShopBuyView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/Common/Pop/showpopUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiPop.transform
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

	arg_5_0.useNumTriggerListener_ = arg_5_0.useNumSliderGo_.transform:GetComponent(typeof(EventTriggerListener))
	arg_5_0.bgController = arg_5_0.controller_:GetController("bg")
	arg_5_0.groupController = arg_5_0.controller_:GetController("group")
	arg_5_0.timeController = arg_5_0.controller_:GetController("time")
	arg_5_0.viewController = arg_5_0.controller_:GetController("view")
	arg_5_0.starController = arg_5_0.controller_:GetController("star")
	arg_5_0.ndtabController = arg_5_0.controller_:GetController("ndtab")
	arg_5_0.consumeController = arg_5_0.controller_:GetController("consume")
	arg_5_0.furnitureController = arg_5_0.controller_:GetController("Furniture")
end

function var_0_0.AddUIListener(arg_6_0)
	arg_6_0:AddBtnListener(arg_6_0.tipGo_, nil, function()
		local var_7_0 = ItemCfg[arg_6_0.shopCfg.give_id].type

		if var_7_0 == ItemConst.ITEM_TYPE.WEAPON_SERVANT then
			JumpTools.OpenPageByJump("/showServantView", {
				state = "onlydetail",
				id = arg_6_0.shopCfg.give_id
			})
			OperationRecorder.Record("ShopItemView", "ExplaintBut")
		elseif var_7_0 == ItemConst.ITEM_TYPE.EQUIP then
			ShowPopItem(POP_SOURCE_ITEM, {
				arg_6_0.shopCfg.give_id,
				1
			}, nil)
			OperationRecorder.Record("ShopItemView", "ExplaintBut")
		elseif var_7_0 == ItemConst.ITEM_TYPE.SCENE then
			JumpTools.OpenPageByJump("/skinDlcShow", {
				goodId = arg_6_0.goodID
			})
		end
	end)
	arg_6_0:AddBtnListener(arg_6_0.bgBtn_, nil, function()
		arg_6_0:Back()
	end)
	arg_6_0:AddPressingByTimeListener(arg_6_0.addBtn_.gameObject, 3, 0.5, 0.2, function()
		arg_6_0.selectNum_ = math.min(arg_6_0.selectNum_ + 1, arg_6_0:GetMaxBuyNum())

		arg_6_0:RefreshNum()

		arg_6_0.useNumSlider_.value = arg_6_0.selectNum_
	end)
	arg_6_0:AddPressingByTimeListener(arg_6_0.delBtn_.gameObject, 3, 0.5, 0.2, function()
		arg_6_0.selectNum_ = math.max(arg_6_0.selectNum_ - 1, 1)

		arg_6_0:RefreshNum()

		arg_6_0.useNumSlider_.value = arg_6_0.selectNum_
	end)
	arg_6_0.useNumSlider_.onValueChanged:AddListener(function()
		arg_6_0.selectNum_ = arg_6_0.useNumSlider_.value
		arg_6_0.selectNum_ = Mathf.Clamp(arg_6_0.selectNum_, 1, arg_6_0:GetMaxBuyNum())
		arg_6_0.useNumSlider_.value = arg_6_0.selectNum_

		arg_6_0:RefreshNum()
	end)
	arg_6_0.useNumTriggerListener_:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.PointerUp, LuaHelper.EventTriggerAction1(function(arg_12_0, arg_12_1)
		arg_6_0:RefreshNum()

		arg_6_0.useNumSlider_.value = arg_6_0.selectNum_

		OperationRecorder.Record("shop", "shop_number_slide")
	end))
	arg_6_0:AddBtnListener(arg_6_0.okBtn_, nil, function()
		local var_13_0 = arg_6_0.goodInfo
		local var_13_1 = arg_6_0.shopCfg
		local var_13_2 = ShopListCfg[var_13_1.shop_id]

		if OperationData:IsFunctionStoped(var_13_2.operation_stop_id) then
			ShowTips("ERROR_FUNCTION_STOP")

			return
		end

		local var_13_3 = ItemCfg[var_13_1.give_id]

		if var_13_3.type == ItemConst.ITEM_TYPE.HERO_PIECE or var_13_3.type == ItemConst.ITEM_TYPE.HERO then
			local var_13_4 = var_13_3.id % 10000
			local var_13_5 = HeroData:GetHeroOmegaNeedPiece(var_13_4)

			if var_13_1.shop_id == ShopConst.SHOP_ID.REPORT_SHOP and var_13_5 <= 0 then
				ShowTips("OMEGA_ENOUGH_TIP")

				return
			end

			if not _G.SkipTip.ShopOmega and var_13_5 < arg_6_0.selectNum_ then
				ShowMessageBox({
					title = GetTips("PROMPT"),
					content = GetTips("SHOP_OMEGA_CONFIRMATION"),
					OkCallback = function()
						_G.SkipTip.ShopOmega = arg_6_0.ShopOmega_

						ShopAction.BuyItem({
							{
								goodID = var_13_0.id,
								buyNum = arg_6_0.selectNum_
							}
						})
					end,
					ToggleCallback = function(arg_15_0)
						arg_6_0.ShopOmega_ = arg_15_0
					end
				})

				return
			end
		end

		local var_13_6 = SettingData:GetRemindSettingData()
		local var_13_7 = var_13_1.cost_id

		if not _G.SkipTip.SkipDiamondBuyItemTip and var_13_7 == CurrencyIdMapCfg.CURRENCY_TYPE_DIAMOND.item_id and var_13_6.diamond_buy_item_reminder == 1 or not _G.SkipTip.SkipCoreEquipBuyItemTip and var_13_7 == CurrencyIdMapCfg.CURRENCY_TYPE_SIX_STAR_EQUIP_RESOLVE.item_id and var_13_6.core_equip_buy_item_reminder == 1 or not _G.SkipTip.SkipInfoBadageTopBuyItemTip and var_13_7 == CurrencyIdMapCfg.CURRENCY_TYPE_INFO_BADGE_TOP.item_id and var_13_6.info_badge_top_buy_item_reminder == 1 or not _G.SkipTip.SkipBossChangeSBuyItemTip and var_13_7 == CurrencyIdMapCfg.CURRENCY_TYPE_BOSS_CHALLENGE_S.item_id and var_13_6.boss_challenge_s_buy_item_reminder == 1 then
			ShowMessageBox({
				title = GetTips("PROMPT"),
				content = string.format(GetTips("SHOP_SECONDARY_CONFIRMATION"), ItemTools.getItemName(var_13_7), arg_6_0.cost_, ItemTools.getItemName(var_13_3.id), arg_6_0.selectNum_),
				OkCallback = function()
					if var_13_7 == CurrencyIdMapCfg.CURRENCY_TYPE_DIAMOND.item_id then
						_G.SkipTip.SkipDiamondBuyItemTip = arg_6_0.SkipDiamondBuyItemTip_
					elseif var_13_7 == CurrencyIdMapCfg.CURRENCY_TYPE_SIX_STAR_EQUIP_RESOLVE.item_id then
						_G.SkipTip.SkipCoreEquipBuyItemTip = arg_6_0.SkipCoreEquipBuyItemTip_
					elseif var_13_7 == CurrencyIdMapCfg.CURRENCY_TYPE_INFO_BADGE_TOP.item_id then
						_G.SkipTip.SkipInfoBadageTopBuyItemTip = arg_6_0.SkipInfoBadageTopBuyItemTip_
					elseif var_13_7 == CurrencyIdMapCfg.CURRENCY_TYPE_BOSS_CHALLENGE_S.item_id then
						_G.SkipTip.SkipBossChangeSBuyItemTip = arg_6_0.SkipBossChangeSBuyItemTip_
					end

					ShopAction.BuyItem({
						{
							goodID = var_13_0.id,
							buyNum = arg_6_0.selectNum_
						}
					})
				end,
				ToggleCallback = function(arg_17_0)
					if var_13_7 == CurrencyIdMapCfg.CURRENCY_TYPE_DIAMOND.item_id then
						arg_6_0.SkipDiamondBuyItemTip_ = arg_17_0
					elseif var_13_7 == CurrencyIdMapCfg.CURRENCY_TYPE_SIX_STAR_EQUIP_RESOLVE.item_id then
						arg_6_0.SkipCoreEquipBuyItemTip_ = arg_17_0
					elseif var_13_7 == CurrencyIdMapCfg.CURRENCY_TYPE_INFO_BADGE_TOP.item_id then
						arg_6_0.SkipInfoBadageTopBuyItemTip_ = arg_17_0
					elseif var_13_7 == CurrencyIdMapCfg.CURRENCY_TYPE_BOSS_CHALLENGE_S.item_id then
						arg_6_0.SkipBossChangeSBuyItemTip_ = arg_17_0
					end
				end
			})
		elseif var_13_7 == CurrencyIdMapCfg.CURRENCY_TYPE_RECHARGE_DIAMOND_FREE.item_id then
			ShowMessageBox({
				title = GetTips("PROMPT"),
				content = string.format(GetTips("SHOP_SECONDARY_CONFIRMATION"), ItemTools.getItemName(var_13_7), arg_6_0.cost_, ItemTools.getItemName(var_13_3.id), arg_6_0.selectNum_),
				OkCallback = function()
					ShopAction.BuyItem({
						{
							goodID = var_13_0.id,
							buyNum = arg_6_0.selectNum_
						}
					})
				end
			})
		elseif var_13_3.type == ItemConst.ITEM_TYPE.SCENE and HomeSceneSettingCfg[var_13_3.param[1]].limit_display == 0 then
			local var_13_8 = true
			local var_13_9

			for iter_13_0, iter_13_1 in ipairs(SkinSceneActionCfg.all) do
				local var_13_10 = SkinSceneActionCfg[iter_13_1]

				if var_13_10.special_scene_id == var_13_3.param[1] then
					var_13_9 = var_13_10.skin_id

					if ShopTools.HaveSkin(var_13_9) or HeroTools.CanChangeSkin(var_13_9) then
						var_13_8 = true

						break
					end

					var_13_8 = false

					break
				end
			end

			if var_13_8 then
				ShopAction.BuyItem({
					{
						goodID = var_13_0.id,
						buyNum = arg_6_0.selectNum_
					}
				})
			else
				local var_13_11 = SkinCfg[var_13_9]

				ShowMessageBox({
					title = GetTips("PROMPT"),
					content = GetTipsF("BUY_SCENE_NOT_HAVE_HERO_SKIN_CONFIRM", GetI18NText(var_13_11.name), ItemTools.getItemName(var_13_3.id)),
					OkCallback = function()
						ShopAction.BuyItem({
							{
								goodID = var_13_0.id,
								buyNum = arg_6_0.selectNum_
							}
						})
					end
				})
			end
		else
			ShopAction.BuyItem({
				{
					goodID = var_13_0.id,
					buyNum = arg_6_0.selectNum_
				}
			})
		end
	end)
end

function var_0_0.OnShopBuyResult(arg_20_0, arg_20_1, arg_20_2, arg_20_3, arg_20_4)
	if arg_20_1 == 0 then
		local var_20_0 = getShopCfg(arg_20_2)
		local var_20_1 = var_20_0.give_id
		local var_20_2 = var_20_0.give
		local var_20_3 = ItemCfg[var_20_1].type

		arg_20_0:Back()

		if var_20_3 == ItemConst.ITEM_TYPE.HERO_SKIN then
			getReward({
				{
					num = 1,
					id = var_20_1
				}
			}, {
				ItemConst.ITEM_TYPE.HERO_SKIN
			})
		elseif var_20_3 == ItemConst.ITEM_TYPE.EQUIP and EquipData:GetEquipBagFull() then
			showEquipSendMail(nil)
			EquipAction.EquipBagFull(false)
		end
	end
end

function var_0_0.RefreshUI(arg_21_0)
	arg_21_0.useNumSlider_.minValue = 0
	arg_21_0.useNumSlider_.maxValue = arg_21_0:GetMaxBuyNum()

	arg_21_0.groupController:SetSelectedState("false")

	local var_21_0 = arg_21_0.shopCfg
	local var_21_1 = ItemCfg[var_21_0.give_id]

	SetActive(arg_21_0.heroIcon_, false)
	SetActive(arg_21_0.commonIconGo_, true)

	if var_21_1.type == ItemConst.ITEM_TYPE.EQUIP or var_21_1.type == ItemConst.ITEM_TYPE.WEAPON_SERVANT then
		arg_21_0.starController:SetSelectedState(var_21_1.rare)
	elseif var_21_1.type == ItemConst.ITEM_TYPE.HERO then
		arg_21_0.starController:SetSelectedState("0")
		arg_21_0.groupController:SetSelectedState("true")

		arg_21_0.campIcon_.sprite = HeroTools.GetHeroRaceIcon(var_21_0.give_id)
		arg_21_0.itemIcon_.sprite = ItemTools.getItemSprite(var_21_0.give_id)

		SetActive(arg_21_0.heroIcon_, true)
		SetActive(arg_21_0.commonIconGo_, false)
	else
		arg_21_0.starController:SetSelectedState("0")
	end

	arg_21_0.bgController:SetSelectedState(tostring(var_21_1.display_rare))
	arg_21_0.ndtabController:SetSelectedState("off")
	arg_21_0.viewController:SetSelectedState(tostring(var_21_1.type == ItemConst.ITEM_TYPE.EQUIP or var_21_1.type == ItemConst.ITEM_TYPE.WEAPON_SERVANT or var_21_1.type == ItemConst.ITEM_TYPE.SCENE))

	if var_21_1.type == ItemConst.ITEM_TYPE.EQUIP then
		arg_21_0.haveNumText_.text = NumberTools.RetractNumber(#EquipTools.GetEquipListByEquipid(var_21_0.give_id))
	elseif var_21_1.type == ItemConst.ITEM_TYPE.WEAPON_SERVANT then
		arg_21_0.haveNumText_.text = NumberTools.RetractNumber(#(WeaponServantData:GetWeaponServantById(var_21_0.give_id) or {}))
	else
		arg_21_0.haveNumText_.text = NumberTools.RetractNumber(ItemTools.getItemNum(var_21_0.give_id))
	end

	arg_21_0.commonIcon_.sprite = ItemTools.getItemSprite(var_21_0.give_id)
	arg_21_0.discountTxt_.text = ShopTools.GetDiscountLabel(arg_21_0.goodID)

	if ShopTools.GetDiscount(arg_21_0.goodID) ~= 100 then
		arg_21_0.ndtabController:SetSelectedState("discount")
	end

	if arg_21_0.shopCfg.tag == ShopConst.TAGS.NEW then
		arg_21_0.ndtabController:SetSelectedState("new")
	end

	if ShopTools.GetDiscount(arg_21_0.goodID) ~= 100 and arg_21_0.shopCfg.tag == ShopConst.TAGS.NEW then
		arg_21_0.ndtabController:SetSelectedState("all")
	end

	arg_21_0.nameText_.text = ItemTools.getItemName(var_21_1.id)
	arg_21_0.descText_.text = ItemTools.getItemDesc(var_21_1.id)

	arg_21_0:RefreshNum()

	arg_21_0.useNumSlider_.value = arg_21_0.selectNum_
	arg_21_0.costIcon_.sprite = ItemTools.getItemLittleSprite(var_21_0.cost_id)

	SetActive(arg_21_0.limitGo_, arg_21_0:IsLimit())

	if arg_21_0:IsLimit() then
		if arg_21_0.shopCfg.shop_refresh == 1 then
			arg_21_0.limitText_.text = GetTips(ShopConst.SHOP_LIMIT_TEXT[var_21_0.refresh_cycle]) .. arg_21_0:GetRestNum() .. "/" .. arg_21_0:GetLimitNum()
		else
			arg_21_0.limitText_.text = GetTips("PURCHASE_LIMIT") .. arg_21_0:GetRestNum() .. "/" .. arg_21_0:GetLimitNum()
		end
	end

	arg_21_0:CheckNeedLabel()
end

function var_0_0.CheckNeedLabel(arg_22_0)
	local var_22_0 = arg_22_0.shopCfg.give_id

	if DormFurnitureTools:CheckFurShowExtendLable(var_22_0) then
		arg_22_0.furnitureController:SetSelectedState("true")
		arg_22_0:UpdateDormLabel()
	else
		arg_22_0.furnitureController:SetSelectedState("false")
	end
end

function var_0_0.UpdateDormLabel(arg_23_0)
	if BackHomeFurniture[arg_23_0.shopCfg.give_id] then
		local var_23_0 = ""
		local var_23_1 = BackHomeFurniture[arg_23_0.shopCfg.give_id].scene_id

		for iter_23_0, iter_23_1 in ipairs(var_23_1) do
			var_23_0 = var_23_0 .. DormTools:GetRoomTypeName(iter_23_1) .. " "
		end

		arg_23_0.dormRangeTxt_.text = var_23_0
		arg_23_0.dormLimitTxt_.text = DormTools:GetFurGiftMaxDesc(arg_23_0.shopCfg.give_id)
		arg_23_0.comfortableTxt_.text = DormTools:GetFurComfortDesc(arg_23_0.shopCfg.give_id)
		arg_23_0.dormTypeTxt_.text = DormTools:GetFurGiftTypeDesc(arg_23_0.shopCfg.give_id)
	else
		arg_23_0.dormTypeTxt_.text = ""
		arg_23_0.dormRangeTxt_.text = ""
		arg_23_0.dormLimitTxt_.text = ""
		arg_23_0.comfortableTxt_.text = ""
	end
end

function var_0_0.GetLabelList(arg_24_0, arg_24_1)
	if BackHomeFurniture[arg_24_1] then
		return DormTools:GetFurLable(arg_24_1)
	end
end

function var_0_0.RefreshNum(arg_25_0)
	arg_25_0.useNumText_.text = GetTips("DORM_CAN_BUY_NUM") .. "：" .. arg_25_0.selectNum_

	local var_25_0, var_25_1 = ShopTools.GetPrice(arg_25_0.goodInfo.id)

	if var_25_0 == 0 then
		arg_25_0.consumeController:SetSelectedState("free")
	else
		arg_25_0.originPriceTxt_.text = var_25_1 * arg_25_0.selectNum_

		arg_25_0.consumeController:SetSelectedState(var_25_1 == var_25_0 and "normal" or "discount")
	end

	arg_25_0.cost_ = var_25_0 * arg_25_0.selectNum_
	arg_25_0.totalCostText_.text = arg_25_0.cost_

	if ItemTools.getItemNum(arg_25_0.shopCfg.cost_id) < arg_25_0.cost_ then
		arg_25_0.totalCostText_.text = "<color=#FF000B>" .. arg_25_0.cost_ .. "</color>"
	end

	local var_25_2 = arg_25_0:GetMaxBuyNum()

	arg_25_0.addBtn_.interactable = var_25_2 > arg_25_0.selectNum_
	arg_25_0.delBtn_.interactable = arg_25_0.selectNum_ > 1
end

function var_0_0.GetLimitNum(arg_26_0)
	if arg_26_0.shopCfg.limit_num and arg_26_0.shopCfg.limit_num ~= -1 then
		return arg_26_0.shopCfg.limit_num
	end

	return -1
end

function var_0_0.GetRestNum(arg_27_0)
	if arg_27_0:IsLimit() then
		return arg_27_0:GetLimitNum() - arg_27_0.goodInfo.buyTime
	end

	return -1
end

function var_0_0.IsLimit(arg_28_0)
	if arg_28_0.shopCfg.limit_num and arg_28_0.shopCfg.limit_num ~= -1 then
		return true
	end

	return false
end

function var_0_0.GetMaxBuyNum(arg_29_0)
	local var_29_0 = arg_29_0.shopCfg
	local var_29_1 = ShopTools.GetPrice(arg_29_0.goodInfo.id)
	local var_29_2 = ItemCfg[var_29_0.give_id]
	local var_29_3 = -1

	if var_29_0.limit_num and var_29_0.limit_num ~= -1 then
		var_29_3 = var_29_0.limit_num - arg_29_0.goodInfo.buyTime

		local var_29_4 = ItemTools.getItemNum(arg_29_0.shopCfg.cost_id)
		local var_29_5 = math.max(math.floor(var_29_4 / var_29_1), 1)

		return math.min(var_29_3, var_29_5)
	end

	local var_29_6 = 99999

	if var_29_2.type == ItemConst.ITEM_TYPE.HERO_PIECE and var_29_0.shop_id == ShopConst.SHOP_ID.REPORT_SHOP then
		local var_29_7 = var_29_2.id - 10000
		local var_29_8 = HeroData:GetHeroOmegaNeedPiece(var_29_7)

		var_29_3 = math.max(var_29_8, 1)
	end

	local var_29_9 = ItemTools.getItemNum(arg_29_0.shopCfg.cost_id)
	local var_29_10 = math.max(math.floor(var_29_9 / var_29_1), 1)

	if var_29_3 < var_29_10 and var_29_3 ~= -1 then
		return var_29_3
	else
		return var_29_10 < 1 and 1 or var_29_10
	end
end

function var_0_0.Init(arg_30_0)
	arg_30_0:InitUI()
	arg_30_0:AddUIListener()
end

function var_0_0.OnTop(arg_31_0)
	arg_31_0:RefreshUI()
	arg_31_0:UpdateBarByGoodId()
	manager.windowBar:SetAsLastSibling()
end

function var_0_0.OnEnter(arg_32_0)
	arg_32_0.goodInfo = arg_32_0.params_.goodInfo
	arg_32_0.shopId = arg_32_0.goodInfo.shopId
	arg_32_0.goodID = arg_32_0.goodInfo.id
	arg_32_0.shopCfg = getShopCfg(arg_32_0.goodInfo.id)
	arg_32_0.useNumSlider_.value = 1
	arg_32_0.selectNum_ = 1
end

function var_0_0.UpdateBarByGoodId(arg_33_0)
	local var_33_0 = {}

	if arg_33_0.shopCfg.cost_id then
		table.insert(var_33_0, arg_33_0.shopCfg.cost_id)
	end

	manager.windowBar:SwitchBar(var_33_0)

	for iter_33_0 = 1, #var_33_0 do
		manager.windowBar:SetBarCanAdd(var_33_0[iter_33_0], ShopConst.ADD_CURRENCY[var_33_0[iter_33_0]] == true)
	end
end

function var_0_0.Dispose(arg_34_0)
	arg_34_0.useNumSlider_.onValueChanged:RemoveAllListeners()
	arg_34_0.useNumTriggerListener_:RemoveListenerType(UnityEngine.EventSystems.EventTriggerType.PointerUp)
	var_0_0.super.Dispose(arg_34_0)
end

function var_0_0.OnExitInput(arg_35_0)
	JumpTools.Back()

	return true
end

return var_0_0
