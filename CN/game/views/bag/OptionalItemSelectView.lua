local var_0_0 = class("OptionalItemSelectView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/Common/Pop/UIInquirepopup14_new"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiPop.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:InitUI()
	arg_3_0:AddUIListener()
end

function var_0_0.OnEnter(arg_4_0)
	arg_4_0.selectInex_ = 0
	arg_4_0.lastSelectItem_ = nil

	arg_4_0:RefreshUI()
end

function var_0_0.InitUI(arg_5_0)
	arg_5_0:BindCfgUI()

	arg_5_0.okBtnController_ = arg_5_0.controllerEx_:GetController("btn")
	arg_5_0.tipsController_ = arg_5_0.controllerEx_:GetController("tips")
	arg_5_0.statusController_ = arg_5_0.controllerEx_:GetController("status")
	arg_5_0.itemQualityController_ = arg_5_0.itemCon_:GetController("quality")
	arg_5_0.selectQualityController_ = arg_5_0.selectCon_:GetController("quality")
	arg_5_0.selectTypeController_ = arg_5_0.selectCon_:GetController("type")
	arg_5_0.notHaveItemList_ = {}
	arg_5_0.haveItemList_ = {}
end

function var_0_0.AddUIListener(arg_6_0)
	arg_6_0:AddBtnListener(arg_6_0.okBtn_, nil, function()
		if arg_6_0.selectInfo_ then
			if arg_6_0.itemCfg_.type == ItemConst.ITEM_TYPE.HERO_SKIN then
				if HeroTools.IsSkinUnlock(itemID) then
					ShowTips("SKIN_HAD_UNLOCKED")

					return
				end

				local var_7_0 = getTicketIDBySkinID(itemID)
				local var_7_1 = MaterialData:GetMaterialListById(var_7_0)

				if var_7_1 then
					for iter_7_0, iter_7_1 in pairs(var_7_1) do
						if iter_7_1 > 0 then
							ShowTips("SKIN_HAD_UNLOCKED")

							return
						end
					end
				end
			end

			local var_7_2 = ItemCfg[arg_6_0.selectInfo_.id]

			if not _G.SkipTip.SkipExchangeHero1 and not arg_6_0.params_.noPop and (var_7_2.type == ItemConst.ITEM_TYPE.HERO_PIECE or var_7_2.type == ItemConst.ITEM_TYPE.HERO) then
				local var_7_3 = HeroData:GetHeroOmegaNeedPiece(arg_6_0.selectHeroId_)
				local var_7_4 = arg_6_0.slider_.value - var_7_3
				local var_7_5 = var_7_2.type == ItemConst.ITEM_TYPE.HERO_PIECE and string.format(GetTips("CHOICEBOX_CHOSEN_OVERFLOW"), var_7_4) or GetTips("CHOICEBOX_CHOSEN_MAX")

				if var_7_4 > 0 then
					ShowMessageBox({
						content = var_7_5,
						OkCallback = function()
							CommonAction.TryToUseItem({
								{
									item_info = {
										id = arg_6_0.itemInfo_[1],
										num = arg_6_0.useNum_,
										time_valid = arg_6_0.itemInfo_[4]
									},
									use_list = {
										arg_6_0.trueIndex_
									}
								}
							})
						end,
						ToggleCallback = function(arg_9_0)
							_G.SkipTip.SkipExchangeHero1 = arg_9_0
						end
					})

					return
				end
			end

			CommonAction.TryToUseItem({
				{
					item_info = {
						id = arg_6_0.itemInfo_[1],
						num = arg_6_0.useNum_,
						time_valid = arg_6_0.itemInfo_[4]
					},
					use_list = {
						arg_6_0.trueIndex_
					}
				}
			})
		end
	end)
	arg_6_0:AddBtnListener(arg_6_0.lockBtn_, nil, function()
		ShowTips("ITEM_SELECTED")
	end)
	arg_6_0:AddBtnListener(arg_6_0.cancelBtn_, nil, function()
		JumpTools.Back()
	end)
	arg_6_0:AddBtnListener(arg_6_0.maskBtn_, nil, function()
		JumpTools.Back()
	end)
	arg_6_0:AddBtnListener(arg_6_0.subBtn_, nil, function()
		local var_13_0 = arg_6_0.slider_.value

		arg_6_0.slider_.value = var_13_0 - 1
	end)
	arg_6_0:AddBtnListener(arg_6_0.addBtn_, nil, function()
		local var_14_0 = arg_6_0.slider_.value

		arg_6_0.slider_.value = var_14_0 + 1
	end)
end

function var_0_0.SelectItem(arg_15_0, arg_15_1, arg_15_2, arg_15_3, arg_15_4)
	if arg_15_0.selectInex_ == arg_15_3 and arg_15_0.selectType_ == arg_15_4 then
		return
	end

	if arg_15_0.lastSelectItem_ then
		arg_15_0.lastSelectItem_:RefreshSelectState(false)
	end

	arg_15_0.selectInfo_ = arg_15_1
	arg_15_0.selectInex_ = arg_15_3
	arg_15_0.selectType_ = arg_15_4
	arg_15_0.selectHeroId_ = ItemCfg[arg_15_1.id].hero_id or arg_15_1.id

	for iter_15_0, iter_15_1 in ipairs(arg_15_0.itemCfg_.param) do
		if arg_15_1.id == iter_15_1[1] then
			arg_15_0.trueIndex_ = iter_15_0

			break
		end
	end

	arg_15_0.lastSelectItem_ = arg_15_2

	arg_15_2:RefreshSelectState(true)
	arg_15_0:RefreshSelect()
end

function var_0_0.LongClickFun(arg_16_0, arg_16_1, arg_16_2, arg_16_3, arg_16_4, arg_16_5)
	if arg_16_5.dragging then
		return false
	end

	arg_16_0:SelectItem(arg_16_1, arg_16_2, arg_16_3, arg_16_4)

	if arg_16_0.isHero_ then
		if arg_16_4 then
			JumpTools.OpenPageByJump("/newHero", {
				isEnter = true,
				hid = arg_16_0.selectHeroId_
			}, ViewConst.SYSTEM_ID.PLAYER_INFO)
		else
			JumpTools.OpenPageByJump("/heroPreviewMain", {
				isEnter = true,
				hid = arg_16_0.selectHeroId_
			})
		end
	elseif arg_16_0.isWeapon_ then
		if arg_16_4 then
			local var_16_0 = ServantTools.GetWeaponShowData()
			local var_16_1 = ServantTools:GetServantList(nil, var_16_0)

			for iter_16_0, iter_16_1 in ipairs(var_16_1) do
				if iter_16_1.id == arg_16_1.id then
					JumpTools.OpenPageByJump("/weaponServant", {
						uid = iter_16_1.uid
					})

					break
				end
			end
		else
			arg_16_0:Go("/showServantView", {
				state = "onlydetail",
				id = arg_16_1.id
			})
		end
	end
end

function var_0_0.RefreshUI(arg_17_0)
	arg_17_0.itemInfo_ = arg_17_0.params_.popItemInfo
	arg_17_0.useNum_ = arg_17_0.params_.selectNum
	arg_17_0.itemCfg_ = ItemCfg[arg_17_0.itemInfo_[1]]
	arg_17_0.notHaveList_ = {}
	arg_17_0.haveList_ = {}

	for iter_17_0 = 1, #arg_17_0.itemCfg_.param do
		local var_17_0 = arg_17_0.itemCfg_.param[iter_17_0][1]
		local var_17_1 = ItemCfg[var_17_0]
		local var_17_2 = WeaponServantData:GetServantSByID(var_17_0)
		local var_17_3 = SkinCfg[var_17_0]
		local var_17_4 = var_17_1.hero_id or var_17_0
		local var_17_5 = HeroCfg[var_17_4]

		arg_17_0.isHeroPiece_ = var_17_1.type == ItemConst.ITEM_TYPE.HERO_PIECE
		arg_17_0.isSkin_ = var_17_3 ~= nil

		if HeroTools.GetIsHide(var_17_0) or HeroTools.GetIsSkinHide(var_17_0) then
			-- block empty
		elseif var_17_5 and (HeroTools.GetHeroIsUnlock(var_17_4) or arg_17_0.isHeroPiece_ and HeroData:GetHeroList()[var_17_4].piece >= GameSetting.unlock_hero_need.value[HeroCfg[var_17_4].rare]) then
			table.insert(arg_17_0.haveList_, arg_17_0.itemCfg_.param[iter_17_0])
		elseif var_17_2 and next(var_17_2) then
			table.insert(arg_17_0.haveList_, arg_17_0.itemCfg_.param[iter_17_0])
		else
			table.insert(arg_17_0.notHaveList_, arg_17_0.itemCfg_.param[iter_17_0])
		end

		if not arg_17_0.isHero_ then
			arg_17_0.isHero_ = var_17_5 ~= nil
		end

		if not arg_17_0.isWeapon_ then
			arg_17_0.isWeapon_ = WeaponServantCfg[var_17_0] ~= nil
		end
	end

	arg_17_0.tipsController_:SetSelectedState(tostring(arg_17_0.isHero_ or arg_17_0.isWeapon_))

	arg_17_0.tipsText_.text = arg_17_0.isHero_ and GetTips("CHOICE_LOOT_HERO_PRESS") or GetTips("CHOICE_LOOT_WEAPON_PRESS")

	arg_17_0:RefreshItemList(false)
	arg_17_0:RefreshItemList(true)
	arg_17_0:RefreshSelect()
	arg_17_0:RefreshSlider()
end

function var_0_0.RefreshItemList(arg_18_0, arg_18_1)
	local var_18_0 = arg_18_1 and arg_18_0.haveList_ or arg_18_0.notHaveList_
	local var_18_1 = arg_18_1 and arg_18_0.haveItemList_ or arg_18_0.notHaveItemList_
	local var_18_2 = arg_18_1 and arg_18_0.haveContent_ or arg_18_0.notHaveContent_
	local var_18_3 = arg_18_1 and arg_18_0.haveTitle_ or arg_18_0.notHaveTitle_
	local var_18_4 = arg_18_0.itemCfg_.sub_type == ItemConst.ITEM_SUB_TYPE.OPTIONAL_ITEM_MULT or arg_18_0.itemCfg_.sub_type == ItemConst.ITEM_SUB_TYPE.OPTIONAL_ITEM

	if #var_18_0 > 0 then
		SetActive(var_18_2.gameObject, true)
		SetActive(var_18_3, not var_18_4)

		for iter_18_0, iter_18_1 in ipairs(var_18_0) do
			local var_18_5 = iter_18_1[1]
			local var_18_6 = iter_18_1[2] * arg_18_0.useNum_
			local var_18_7 = not HeroCfg[var_18_5] and SkinCfg[var_18_5] and HeroTools.GetHasOwnedSkin(var_18_5)
			local var_18_8 = clone(ItemTemplateData)

			var_18_8.id = var_18_5
			var_18_8.number = var_18_6
			var_18_8.ownedFlag = var_18_7
			var_18_8.selectStyle = arg_18_0.selectInfo_ and arg_18_0.selectInfo_.id == var_18_5

			local var_18_9 = var_18_1[iter_18_0]

			if var_18_9 == nil then
				local var_18_10 = Object.Instantiate(arg_18_0.itemGo_, var_18_2)

				var_18_9 = CommonRecommendItemView.New(var_18_10)

				table.insert(var_18_1, var_18_9)
			end

			function var_18_8.clickFun(arg_19_0)
				if var_18_7 then
					return
				end

				arg_18_0:SelectItem(arg_19_0, var_18_9, iter_18_0, arg_18_1)
			end

			function var_18_8.longClickFun(arg_20_0, arg_20_1, arg_20_2, arg_20_3)
				if var_18_7 then
					return
				end

				if arg_20_3 == 0 then
					arg_18_0:SelectItem(arg_20_0, var_18_9, iter_18_0, arg_18_1)
				else
					arg_18_0:LongClickFun(arg_20_0, var_18_9, iter_18_0, arg_18_1, arg_20_2)
				end
			end

			function var_18_8.beginDragFun(arg_21_0, arg_21_1)
				arg_18_0.scrollRect_:OnBeginDrag(arg_21_1)
			end

			function var_18_8.dragFun(arg_22_0, arg_22_1)
				arg_18_0.scrollRect_:OnDrag(arg_22_1)
			end

			function var_18_8.endDragFun(arg_23_0, arg_23_1)
				arg_18_0.scrollRect_:OnEndDrag(arg_23_1)
			end

			var_18_9:SetData(var_18_8)
			var_18_9:RefreshRecommend()
			SetActive(var_18_9.gameObject_, true)
		end

		for iter_18_2 = #var_18_0 + 1, #var_18_1 do
			SetActive(var_18_1[iter_18_2].gameObject_, false)
		end
	else
		SetActive(var_18_2.gameObject, false)
		SetActive(var_18_3, false)
	end
end

function var_0_0.RefreshSelect(arg_24_0)
	arg_24_0.okBtnController_:SetSelectedState(tostring(arg_24_0.selectInfo_ ~= nil))

	local var_24_0 = arg_24_0.selectInfo_ and arg_24_0:GetServantRecommend(arg_24_0.selectInfo_.id)

	SetActive(arg_24_0.recommendGo_, var_24_0 ~= nil)

	if arg_24_0.selectInfo_ then
		if arg_24_0.isHero_ and not arg_24_0.isHeroPiece_ then
			arg_24_0.nameText_.text = HeroTools.GetHeroFullName(arg_24_0.selectHeroId_)
			arg_24_0.heroIcon_.sprite = HeroTools.GetHeadSprite(arg_24_0.selectHeroId_)

			arg_24_0.selectQualityController_:SetSelectedState(HeroCfg[arg_24_0.selectHeroId_].rare + 2)
			arg_24_0.selectTypeController_:SetSelectedState("hero")
			arg_24_0.statusController_:SetSelectedState("slectHead")
		elseif arg_24_0.isWeapon_ then
			local var_24_1 = arg_24_0:GetServantRecommend(arg_24_0.selectInfo_.id)

			arg_24_0.nameText_.text = ItemCfg[arg_24_0.selectInfo_.id].name

			if var_24_1 then
				arg_24_0.recommendIcon_.sprite = HeroTools.GetSmallHeadSprite(var_24_1)
				arg_24_0.recommendHeroName_.text = HeroCfg[var_24_1].name
			end

			arg_24_0.selectQualityController_:SetSelectedState(tostring(ItemCfg[arg_24_0.selectInfo_.id].rare))

			arg_24_0.servantIcon_.sprite = ItemTools.getItemSprite(arg_24_0.selectInfo_.id)

			arg_24_0.selectTypeController_:SetSelectedState("servant")
			arg_24_0.statusController_:SetSelectedState("slectHead")
		elseif arg_24_0.isSkin_ then
			arg_24_0.nameText_.text = ItemTools.getItemName(arg_24_0.selectInfo_.id)
			arg_24_0.heroIcon_.sprite = HeroTools.GetHeadSprite(arg_24_0.selectInfo_.id)

			arg_24_0.selectTypeController_:SetSelectedState("hero")
			arg_24_0.statusController_:SetSelectedState("slectHead")
		else
			arg_24_0.itemIconImage_.sprite = ItemTools.getItemSprite(arg_24_0.selectInfo_.id)
			arg_24_0.itemNameText_.text = ItemTools.getItemName(arg_24_0.selectInfo_.id)
			arg_24_0.itemNumText_.text = ItemTools.getItemNum(arg_24_0.selectInfo_.id)

			arg_24_0.itemQualityController_:SetSelectedState(tostring(ItemCfg[arg_24_0.selectInfo_.id].rare))
			arg_24_0.statusController_:SetSelectedState("selecIMulti")
		end
	else
		arg_24_0.statusController_:SetSelectedState((arg_24_0.isHero_ and not arg_24_0.isHeroPiece_ or arg_24_0.isWeapon_ or arg_24_0.isSkin_) and "unselctOne" or "unselctIMulti")
	end
end

function var_0_0.RefreshSlider(arg_25_0)
	local var_25_0 = arg_25_0.itemCfg_.sub_type == ItemConst.ITEM_SUB_TYPE.OPTIONAL_ITEM

	arg_25_0.slider_.minValue = var_25_0 and 0 or arg_25_0.useNum_
	arg_25_0.slider_.maxValue = var_25_0 and 1 or ItemTools.getItemNum(arg_25_0.itemInfo_[1])
	arg_25_0.slider_.value = var_25_0 and 1 or arg_25_0.params_.selectNum
	arg_25_0.useNumText_.text = string.format(GetTips("CHOICE_LOOT_CONSUME_NUM"), arg_25_0.params_.selectNum)
	arg_25_0.subBtn_.interactable = not var_25_0 and arg_25_0.useNum_ > 1 or false
	arg_25_0.addBtn_.interactable = not var_25_0 and arg_25_0.useNum_ < ItemTools.getItemNum(arg_25_0.itemInfo_[1]) or false

	arg_25_0.slider_.onValueChanged:AddListener(function(arg_26_0)
		arg_25_0.subBtn_.interactable = not var_25_0 and arg_25_0.useNum_ > 1 or false
		arg_25_0.addBtn_.interactable = not var_25_0 and arg_25_0.useNum_ < ItemTools.getItemNum(arg_25_0.itemInfo_[1]) or false

		if arg_26_0 < 1 then
			arg_25_0.slider_.value = 1
		else
			arg_25_0.useNum_ = arg_26_0
			arg_25_0.useNumText_.text = string.format(GetTips("CHOICE_LOOT_CONSUME_NUM"), arg_25_0.useNum_)

			arg_25_0:RefreshItemList()
		end
	end)
end

function var_0_0.GetServantRecommend(arg_27_0, arg_27_1)
	local var_27_0 = string.format(GetTips("TIP_SELECT"), ItemTools.getItemName(arg_27_1))
	local var_27_1 = ItemCfg[arg_27_1]

	if var_27_1 and var_27_1.type == ItemConst.ITEM_TYPE.WEAPON_SERVANT then
		local var_27_2 = WeaponServantCfg[arg_27_1].effect[1]
		local var_27_3 = 0

		if var_27_2 > 0 then
			var_27_3 = WeaponEffectCfg[var_27_2].spec_char[1]
		end

		if var_27_3 ~= nil and var_27_3 > 0 then
			return var_27_3
		end
	end
end

function var_0_0.OnTryToUseItem(arg_28_0, arg_28_1, arg_28_2)
	if isSuccess(arg_28_1.result) then
		JumpTools:Back()
		getReward(arg_28_1.drop_list, {
			ItemConst.ITEM_TYPE.HERO,
			ItemConst.ITEM_TYPE.HERO_SKIN
		})
	else
		ShowTips(arg_28_1.result)
	end
end

function var_0_0.OnExit(arg_29_0)
	arg_29_0.selectInex_ = 0
	arg_29_0.lastSelectItem_ = nil
	arg_29_0.selectInfo_ = nil
	arg_29_0.trueIndex_ = 0
	arg_29_0.scrollRect_.verticalNormalizedPosition = 1
	arg_29_0.isHero_ = false
	arg_29_0.isWeapon_ = false
	arg_29_0.isHeroPiece_ = false

	arg_29_0.slider_.onValueChanged:RemoveAllListeners()
end

function var_0_0.Dispose(arg_30_0)
	for iter_30_0, iter_30_1 in ipairs(arg_30_0.notHaveItemList_) do
		iter_30_1:Dispose()
	end

	arg_30_0.notHaveItemList_ = nil

	for iter_30_2, iter_30_3 in ipairs(arg_30_0.haveItemList_) do
		iter_30_3:Dispose()
	end

	arg_30_0.haveItemList_ = nil

	var_0_0.super.Dispose(arg_30_0)
end

return var_0_0
