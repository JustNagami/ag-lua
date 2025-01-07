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
	arg_5_0.furnitureViewController = arg_5_0.controller_:GetController("viewBtn")
	arg_5_0.commonItem1 = CommonItemView.New(arg_5_0.revertItemGo_)
	arg_5_0.commonItem2 = CommonItemView.New(arg_5_0.revertedItemGo_)
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
	arg_6_0:AddBtnListener(arg_6_0.furnitureViewBtn_, nil, function()
		if BackHomeDataManager:IsInDormSystem() then
			local var_8_0 = manager.ui.mainCamera:GetComponent("CinemachineBrain")

			if not var_8_0 then
				local var_8_1 = manager.ui:AddMainCameraCom(typeof(CinemachineBrain))

				var_8_0 = manager.ui.mainCamera:GetComponent("CinemachineBrain")
			end

			local var_8_2 = var_8_0.m_DefaultBlend

			var_8_0.m_DefaultBlend = DanceGameController.cut

			JumpTools.OpenPageByJump("/furniturePreview", {
				furID = arg_6_0.shopCfg.give_id,
				cacheBlend = var_8_2
			})
		else
			JumpTools.OpenPageByJump("/furniturePreviewWithEntity", {
				furID = arg_6_0.shopCfg.give_i
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
	arg_6_0.useNumTriggerListener_:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.PointerUp, LuaHelper.EventTriggerAction1(function(arg_13_0, arg_13_1)
		arg_6_0:RefreshNum()

		arg_6_0.useNumSlider_.value = arg_6_0.selectNum_

		OperationRecorder.Record("shop", "shop_number_slide")
	end))
	arg_6_0:AddBtnListener(arg_6_0.okBtn_, nil, function()
		local var_14_0 = arg_6_0.goodInfo
		local var_14_1 = arg_6_0.shopCfg
		local var_14_2 = ShopListCfg[var_14_1.shop_id]

		if OperationData:IsFunctionStoped(var_14_2.operation_stop_id) then
			ShowTips("ERROR_FUNCTION_STOP")

			return
		end

		local var_14_3 = ItemCfg[var_14_1.give_id]

		if var_14_3.type == ItemConst.ITEM_TYPE.HERO_PIECE or var_14_3.type == ItemConst.ITEM_TYPE.HERO then
			local var_14_4 = var_14_3.id % 10000
			local var_14_5 = HeroData:GetHeroOmegaNeedPiece(var_14_4)

			if var_14_1.shop_id == ShopConst.SHOP_ID.REPORT_SHOP and var_14_5 <= 0 then
				ShowTips("OMEGA_ENOUGH_TIP")

				return
			end

			if not _G.SkipTip.ShopOmega and var_14_5 < arg_6_0.selectNum_ then
				ShowMessageBox({
					title = GetTips("PROMPT"),
					content = GetTips("SHOP_OMEGA_CONFIRMATION"),
					OkCallback = function()
						_G.SkipTip.ShopOmega = arg_6_0.ShopOmega_

						ShopAction.BuyItem({
							{
								goodID = var_14_0.id,
								buyNum = arg_6_0.selectNum_
							}
						})
					end,
					ToggleCallback = function(arg_16_0)
						arg_6_0.ShopOmega_ = arg_16_0
					end
				})

				return
			end
		end

		local var_14_6 = SettingData:GetRemindSettingData()
		local var_14_7 = var_14_1.cost_id

		if not _G.SkipTip.SkipDiamondBuyItemTip and var_14_7 == CurrencyIdMapCfg.CURRENCY_TYPE_DIAMOND.item_id and var_14_6.diamond_buy_item_reminder == 1 or not _G.SkipTip.SkipCoreEquipBuyItemTip and var_14_7 == CurrencyIdMapCfg.CURRENCY_TYPE_SIX_STAR_EQUIP_RESOLVE.item_id and var_14_6.core_equip_buy_item_reminder == 1 or not _G.SkipTip.SkipInfoBadageTopBuyItemTip and var_14_7 == CurrencyIdMapCfg.CURRENCY_TYPE_INFO_BADGE_TOP.item_id and var_14_6.info_badge_top_buy_item_reminder == 1 or not _G.SkipTip.SkipBossChangeSBuyItemTip and var_14_7 == CurrencyIdMapCfg.CURRENCY_TYPE_BOSS_CHALLENGE_S.item_id and var_14_6.boss_challenge_s_buy_item_reminder == 1 then
			ShowMessageBox({
				title = GetTips("PROMPT"),
				content = string.format(GetTips("SHOP_SECONDARY_CONFIRMATION"), ItemTools.getItemName(var_14_7), arg_6_0.cost_, ItemTools.getItemName(var_14_3.id), arg_6_0.selectNum_),
				OkCallback = function()
					if var_14_7 == CurrencyIdMapCfg.CURRENCY_TYPE_DIAMOND.item_id then
						_G.SkipTip.SkipDiamondBuyItemTip = arg_6_0.SkipDiamondBuyItemTip_
					elseif var_14_7 == CurrencyIdMapCfg.CURRENCY_TYPE_SIX_STAR_EQUIP_RESOLVE.item_id then
						_G.SkipTip.SkipCoreEquipBuyItemTip = arg_6_0.SkipCoreEquipBuyItemTip_
					elseif var_14_7 == CurrencyIdMapCfg.CURRENCY_TYPE_INFO_BADGE_TOP.item_id then
						_G.SkipTip.SkipInfoBadageTopBuyItemTip = arg_6_0.SkipInfoBadageTopBuyItemTip_
					elseif var_14_7 == CurrencyIdMapCfg.CURRENCY_TYPE_BOSS_CHALLENGE_S.item_id then
						_G.SkipTip.SkipBossChangeSBuyItemTip = arg_6_0.SkipBossChangeSBuyItemTip_
					end

					ShopAction.BuyItem({
						{
							goodID = var_14_0.id,
							buyNum = arg_6_0.selectNum_
						}
					})
				end,
				ToggleCallback = function(arg_18_0)
					if var_14_7 == CurrencyIdMapCfg.CURRENCY_TYPE_DIAMOND.item_id then
						arg_6_0.SkipDiamondBuyItemTip_ = arg_18_0
					elseif var_14_7 == CurrencyIdMapCfg.CURRENCY_TYPE_SIX_STAR_EQUIP_RESOLVE.item_id then
						arg_6_0.SkipCoreEquipBuyItemTip_ = arg_18_0
					elseif var_14_7 == CurrencyIdMapCfg.CURRENCY_TYPE_INFO_BADGE_TOP.item_id then
						arg_6_0.SkipInfoBadageTopBuyItemTip_ = arg_18_0
					elseif var_14_7 == CurrencyIdMapCfg.CURRENCY_TYPE_BOSS_CHALLENGE_S.item_id then
						arg_6_0.SkipBossChangeSBuyItemTip_ = arg_18_0
					end
				end
			})
		elseif var_14_7 == CurrencyIdMapCfg.CURRENCY_TYPE_RECHARGE_DIAMOND_FREE.item_id then
			ShowMessageBox({
				title = GetTips("PROMPT"),
				content = string.format(GetTips("SHOP_SECONDARY_CONFIRMATION"), ItemTools.getItemName(var_14_7), arg_6_0.cost_, ItemTools.getItemName(var_14_3.id), arg_6_0.selectNum_),
				OkCallback = function()
					ShopAction.BuyItem({
						{
							goodID = var_14_0.id,
							buyNum = arg_6_0.selectNum_
						}
					})
				end
			})
		elseif var_14_3.type == ItemConst.ITEM_TYPE.SCENE and HomeSceneSettingCfg[var_14_3.param[1]].limit_display == 0 then
			local var_14_8 = true
			local var_14_9

			for iter_14_0, iter_14_1 in ipairs(SkinSceneActionCfg.all) do
				local var_14_10 = SkinSceneActionCfg[iter_14_1]

				if var_14_10.special_scene_id == var_14_3.param[1] then
					var_14_9 = var_14_10.skin_id

					if ShopTools.HaveSkin(var_14_9) or HeroTools.CanChangeSkin(var_14_9) then
						var_14_8 = true

						break
					end

					var_14_8 = false

					break
				end
			end

			if var_14_8 then
				ShopAction.BuyItem({
					{
						goodID = var_14_0.id,
						buyNum = arg_6_0.selectNum_
					}
				})
			else
				local var_14_11 = SkinCfg[var_14_9]

				ShowMessageBox({
					title = GetTips("PROMPT"),
					content = GetTipsF("BUY_SCENE_NOT_HAVE_HERO_SKIN_CONFIRM", GetI18NText(var_14_11.name), ItemTools.getItemName(var_14_3.id)),
					OkCallback = function()
						ShopAction.BuyItem({
							{
								goodID = var_14_0.id,
								buyNum = arg_6_0.selectNum_
							}
						})
					end
				})
			end
		else
			ShopAction.BuyItem({
				{
					goodID = var_14_0.id,
					buyNum = arg_6_0.selectNum_
				}
			})
		end
	end)
end

function var_0_0.OnShopBuyResult(arg_21_0, arg_21_1, arg_21_2, arg_21_3, arg_21_4)
	if arg_21_1 == 0 then
		local var_21_0 = getShopCfg(arg_21_2)
		local var_21_1 = var_21_0.give_id
		local var_21_2 = var_21_0.give
		local var_21_3 = ItemCfg[var_21_1].type

		arg_21_0:Back()

		if var_21_3 == ItemConst.ITEM_TYPE.HERO_SKIN then
			getReward({
				{
					num = 1,
					id = var_21_1
				}
			}, {
				ItemConst.ITEM_TYPE.HERO_SKIN
			})
		elseif var_21_3 == ItemConst.ITEM_TYPE.EQUIP and EquipData:GetEquipBagFull() then
			showEquipSendMail(nil)
			EquipAction.EquipBagFull(false)
		end
	end
end

function var_0_0.AddEventListeners(arg_22_0)
	arg_22_0:RegistEventListener(SHOP_LIST_UPDATE, function(arg_23_0)
		if arg_23_0 == 0 or arg_22_0.shopId == arg_23_0 then
			arg_22_0:RefreshUI()
			arg_22_0:UpdateBarByGoodId()
		end
	end)
	arg_22_0:RegistEventListener(SHOP_REFRESH_ALL_SHOP, function(arg_24_0)
		arg_22_0:RefreshUI()
		arg_22_0:UpdateBarByGoodId()
	end)
	arg_22_0:RegistEventListener(SHOP_ITEM_UPDATE, function(arg_25_0, arg_25_1)
		if arg_22_0.shopId ~= arg_25_0 then
			return
		end

		arg_22_0:RefreshUI()
		arg_22_0:UpdateBarByGoodId()
	end)
end

function var_0_0.RefreshUI(arg_26_0)
	arg_26_0.useNumSlider_.minValue = 0
	arg_26_0.useNumSlider_.maxValue = arg_26_0:GetMaxBuyNum()

	arg_26_0.groupController:SetSelectedState("false")

	local var_26_0 = arg_26_0.shopCfg
	local var_26_1 = ItemCfg[var_26_0.give_id]

	SetActive(arg_26_0.heroIcon_, false)
	SetActive(arg_26_0.commonIconGo_, true)
	SetActive(arg_26_0.ownGo_, ShopTools.CheckGoodsOwen(arg_26_0.goodID))

	if var_26_1.type == ItemConst.ITEM_TYPE.EQUIP or var_26_1.type == ItemConst.ITEM_TYPE.WEAPON_SERVANT then
		arg_26_0.starController:SetSelectedState(var_26_1.rare)
	elseif var_26_1.type == ItemConst.ITEM_TYPE.HERO then
		arg_26_0.starController:SetSelectedState("0")
		arg_26_0.groupController:SetSelectedState("true")

		arg_26_0.campIcon_.sprite = HeroTools.GetHeroRaceIcon(var_26_0.give_id)
		arg_26_0.itemIcon_.sprite = ItemTools.getItemSprite(var_26_0.give_id)

		SetActive(arg_26_0.heroIcon_, true)
		SetActive(arg_26_0.commonIconGo_, false)
	else
		arg_26_0.starController:SetSelectedState("0")
	end

	arg_26_0.bgController:SetSelectedState(tostring(var_26_1.display_rare))
	arg_26_0.ndtabController:SetSelectedState("off")
	arg_26_0.viewController:SetSelectedState(tostring(var_26_1.type == ItemConst.ITEM_TYPE.EQUIP or var_26_1.type == ItemConst.ITEM_TYPE.WEAPON_SERVANT or var_26_1.type == ItemConst.ITEM_TYPE.SCENE))

	if var_26_1.type == ItemConst.ITEM_TYPE.DORM_FURNITURE then
		arg_26_0.furnitureViewController:SetSelectedState("on")
	else
		arg_26_0.furnitureViewController:SetSelectedState("off")
	end

	if var_26_1.type == ItemConst.ITEM_TYPE.EQUIP then
		arg_26_0.haveNumText_.text = NumberTools.RetractNumber(#EquipTools.GetEquipListByEquipid(var_26_0.give_id))
	elseif var_26_1.type == ItemConst.ITEM_TYPE.WEAPON_SERVANT then
		arg_26_0.haveNumText_.text = NumberTools.RetractNumber(#(WeaponServantData:GetWeaponServantById(var_26_0.give_id) or {}))
	else
		arg_26_0.haveNumText_.text = NumberTools.RetractNumber(ItemTools.getItemNum(var_26_0.give_id))
	end

	arg_26_0.commonIcon_.sprite = ItemTools.getItemSprite(var_26_0.give_id)
	arg_26_0.discountTxt_.text = ShopTools.GetDiscountLabel(arg_26_0.goodID)

	local var_26_2, var_26_3, var_26_4 = ShopTools.IsOnDiscountArea(arg_26_0.goodID)

	if var_26_2 and var_26_4 then
		arg_26_0.ndtabController:SetSelectedState("discount")
	end

	if arg_26_0.shopCfg.tag == ShopConst.TAGS.NEW then
		arg_26_0.ndtabController:SetSelectedState("new")
	end

	if var_26_2 and var_26_4 and arg_26_0.shopCfg.tag == ShopConst.TAGS.NEW then
		arg_26_0.ndtabController:SetSelectedState("all")
	end

	arg_26_0.nameText_.text = ItemTools.getItemName(var_26_1.id)
	arg_26_0.descText_.text = ItemTools.getItemDesc(var_26_1.id)

	arg_26_0:RefreshNum()

	arg_26_0.useNumSlider_.value = arg_26_0.selectNum_
	arg_26_0.costIcon_.sprite = ItemTools.getItemLittleSprite(var_26_0.cost_id)

	SetActive(arg_26_0.limitGo_, arg_26_0:IsLimit())

	if arg_26_0:IsLimit() then
		if arg_26_0.shopCfg.shop_refresh == 1 then
			arg_26_0.limitText_.text = GetTips(ShopConst.SHOP_LIMIT_TEXT[var_26_0.refresh_cycle]) .. arg_26_0:GetRestNum() .. "/" .. arg_26_0:GetLimitNum()
		else
			arg_26_0.limitText_.text = GetTips("PURCHASE_LIMIT") .. arg_26_0:GetRestNum() .. "/" .. arg_26_0:GetLimitNum()
		end
	end
end

function var_0_0.UpdateDormLabel(arg_27_0)
	if BackHomeFurniture[arg_27_0.shopCfg.give_id] then
		local var_27_0 = ""
		local var_27_1 = BackHomeFurniture[arg_27_0.shopCfg.give_id].scene_id

		for iter_27_0, iter_27_1 in ipairs(var_27_1) do
			var_27_0 = var_27_0 .. DormTools:GetRoomTypeName(iter_27_1) .. " "
		end

		arg_27_0.dormRangeTxt_.text = var_27_0
		arg_27_0.dormLimitTxt_.text = DormTools:GetFurGiftMaxDesc(arg_27_0.shopCfg.give_id)
		arg_27_0.comfortableTxt_.text = DormTools:GetFurComfortDesc(arg_27_0.shopCfg.give_id)
		arg_27_0.dormTypeTxt_.text = DormTools:GetFurGiftTypeDesc(arg_27_0.shopCfg.give_id)
	else
		arg_27_0.dormTypeTxt_.text = ""
		arg_27_0.dormRangeTxt_.text = ""
		arg_27_0.dormLimitTxt_.text = ""
		arg_27_0.comfortableTxt_.text = ""
	end
end

function var_0_0.GetLabelList(arg_28_0, arg_28_1)
	if BackHomeFurniture[arg_28_1] then
		return DormTools:GetFurLable(arg_28_1)
	end
end

function var_0_0.RefreshRevert(arg_29_0)
	local var_29_0, var_29_1 = ShopTools.rewertReward(arg_29_0.goodID, arg_29_0.selectNum_)
	local var_29_2 = arg_29_0.shopCfg.give_id

	if #var_29_1 ~= 0 then
		arg_29_0.furnitureController:SetSelectedState("transformation")
	elseif DormFurnitureTools:CheckFurShowExtendLable(var_29_2) then
		arg_29_0.furnitureController:SetSelectedState("true")
		arg_29_0:UpdateDormLabel()
	else
		arg_29_0.furnitureController:SetSelectedState("false")
	end

	if #var_29_1 ~= 0 then
		CommonTools.SetCommonData(arg_29_0.commonItem1, {
			id = var_29_0[1].id,
			number = var_29_0[1].num,
			clickFun = function()
				ShowPopItem(POP_ITEM, {
					id = var_29_0[1].id,
					number = var_29_0[1].num
				})
			end
		})
		CommonTools.SetCommonData(arg_29_0.commonItem2, {
			id = var_29_1[1].id,
			number = var_29_1[1].num,
			clickFun = function()
				ShowPopItem(POP_ITEM, {
					id = var_29_1[1].id,
					number = var_29_1[1].num
				})
			end
		})
	end
end

function var_0_0.RefreshNum(arg_32_0)
	arg_32_0.useNumText_.text = GetTips("DORM_CAN_BUY_NUM") .. "：" .. arg_32_0.selectNum_

	arg_32_0:RefreshRevert()

	local var_32_0, var_32_1 = ShopTools.GetPrice(arg_32_0.goodInfo.id)

	if var_32_0 == 0 then
		arg_32_0.consumeController:SetSelectedState("free")
	else
		arg_32_0.originPriceTxt_.text = var_32_1 * arg_32_0.selectNum_

		arg_32_0.consumeController:SetSelectedState(var_32_1 == var_32_0 and "normal" or "discount")
	end

	arg_32_0.cost_ = var_32_0 * arg_32_0.selectNum_
	arg_32_0.totalCostText_.text = arg_32_0.cost_

	if ItemTools.getItemNum(arg_32_0.shopCfg.cost_id) < arg_32_0.cost_ then
		arg_32_0.totalCostText_.text = "<color=#FF000B>" .. arg_32_0.cost_ .. "</color>"
	end

	local var_32_2 = arg_32_0:GetMaxBuyNum()

	arg_32_0.addBtn_.interactable = var_32_2 > arg_32_0.selectNum_
	arg_32_0.delBtn_.interactable = arg_32_0.selectNum_ > 1
end

function var_0_0.GetLimitNum(arg_33_0)
	if arg_33_0.shopCfg.limit_num and arg_33_0.shopCfg.limit_num ~= -1 then
		return arg_33_0.shopCfg.limit_num
	end

	return -1
end

function var_0_0.GetRestNum(arg_34_0)
	if arg_34_0:IsLimit() then
		return arg_34_0:GetLimitNum() - arg_34_0.goodInfo.buyTime
	end

	return -1
end

function var_0_0.IsLimit(arg_35_0)
	if arg_35_0.shopCfg.limit_num and arg_35_0.shopCfg.limit_num ~= -1 then
		return true
	end

	return false
end

function var_0_0.GetMaxBuyNum(arg_36_0)
	local var_36_0 = arg_36_0.shopCfg
	local var_36_1 = ShopTools.GetPrice(arg_36_0.goodInfo.id)
	local var_36_2 = ItemCfg[var_36_0.give_id]
	local var_36_3 = -1

	if var_36_0.limit_num and var_36_0.limit_num ~= -1 then
		var_36_3 = var_36_0.limit_num - arg_36_0.goodInfo.buyTime

		local var_36_4 = ItemTools.getItemNum(arg_36_0.shopCfg.cost_id)
		local var_36_5 = math.max(math.floor(var_36_4 / var_36_1), 1)

		return math.min(var_36_3, var_36_5)
	end

	local var_36_6 = 99999

	if var_36_2.type == ItemConst.ITEM_TYPE.HERO_PIECE and var_36_0.shop_id == ShopConst.SHOP_ID.REPORT_SHOP then
		local var_36_7 = var_36_2.id - 10000
		local var_36_8 = HeroData:GetHeroOmegaNeedPiece(var_36_7)

		var_36_3 = math.max(var_36_8, 1)
	end

	local var_36_9 = ItemTools.getItemNum(arg_36_0.shopCfg.cost_id)
	local var_36_10 = math.max(math.floor(var_36_9 / var_36_1), 1)

	if var_36_3 < var_36_10 and var_36_3 ~= -1 then
		return var_36_3
	else
		return var_36_10 < 1 and 1 or var_36_10
	end
end

function var_0_0.Init(arg_37_0)
	arg_37_0:InitUI()
	arg_37_0:AddUIListener()
end

function var_0_0.OnTop(arg_38_0)
	arg_38_0:RefreshUI()
	arg_38_0:UpdateBarByGoodId()
	manager.windowBar:SetAsLastSibling()
end

function var_0_0.OnEnter(arg_39_0)
	arg_39_0.goodInfo = arg_39_0.params_.goodInfo
	arg_39_0.shopId = arg_39_0.goodInfo.shopId
	arg_39_0.goodID = arg_39_0.goodInfo.id
	arg_39_0.shopCfg = getShopCfg(arg_39_0.goodInfo.id)
	arg_39_0.useNumSlider_.value = 1
	arg_39_0.selectNum_ = 1

	arg_39_0:AddEventListeners()
end

function var_0_0.UpdateBarByGoodId(arg_40_0)
	local var_40_0 = {}

	if arg_40_0.shopCfg.cost_id then
		table.insert(var_40_0, arg_40_0.shopCfg.cost_id)
	end

	manager.windowBar:SwitchBar(var_40_0)

	for iter_40_0 = 1, #var_40_0 do
		manager.windowBar:SetBarCanAdd(var_40_0[iter_40_0], ShopConst.ADD_CURRENCY[var_40_0[iter_40_0]] == true)
	end
end

function var_0_0.Dispose(arg_41_0)
	arg_41_0.useNumSlider_.onValueChanged:RemoveAllListeners()
	arg_41_0.useNumTriggerListener_:RemoveListenerType(UnityEngine.EventSystems.EventTriggerType.PointerUp)
	arg_41_0:RemoveAllListeners()
	var_0_0.super.Dispose(arg_41_0)
	arg_41_0.commonItem1:Dispose()

	arg_41_0.commonItem1 = nil

	arg_41_0.commonItem2:Dispose()

	arg_41_0.commonItem2 = nil
end

function var_0_0.OnExitInput(arg_42_0)
	JumpTools.Back()

	return true
end

return var_0_0
