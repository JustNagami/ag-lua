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
	arg_5_0.notHaveItemList_ = {}
	arg_5_0.haveItemList_ = {}
end

function var_0_0.AddUIListener(arg_6_0)
	arg_6_0:AddBtnListener(arg_6_0.okBtn_, nil, function()
		local var_7_0 = ItemCfg[arg_6_0.itemInfo_[1]]

		if arg_6_0.selectInfo_ then
			if var_7_0.type == ItemConst.ITEM_TYPE.HERO_SKIN then
				if HeroTools.IsSkinUnlock(itemID) then
					ShowTips("SKIN_HAD_UNLOCKED")

					return
				end

				local var_7_1 = getTicketIDBySkinID(itemID)
				local var_7_2 = MaterialData:GetMaterialListById(var_7_1)

				if var_7_2 then
					for iter_7_0, iter_7_1 in pairs(var_7_2) do
						if iter_7_1 > 0 then
							ShowTips("SKIN_HAD_UNLOCKED")

							return
						end
					end
				end
			end

			local var_7_3 = ItemCfg[arg_6_0.selectInfo_.id]

			if not _G.SkipTip.SkipExchangeHero1 and not arg_6_0.params_.noPop and (var_7_3.type == ItemConst.ITEM_TYPE.HERO_PIECE or var_7_3.type == ItemConst.ITEM_TYPE.HERO) then
				local var_7_4 = var_7_3.hero_id or arg_6_0.selectInfo_.id
				local var_7_5 = HeroData:GetHeroOmegaNeedPiece(var_7_4)
				local var_7_6 = arg_6_0.selectInfo_.number - var_7_5
				local var_7_7 = var_7_3.type == ItemConst.ITEM_TYPE.HERO_PIECE and string.format(GetTips("CHOICEBOX_CHOSEN_OVERFLOW"), var_7_6) or GetTips("CHOICEBOX_CHOSEN_MAX")

				if var_7_6 > 0 then
					ShowMessageBox({
						content = var_7_7,
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
end

function var_0_0.SelectItem(arg_13_0, arg_13_1, arg_13_2, arg_13_3, arg_13_4)
	if arg_13_0.selectInex_ == arg_13_3 and arg_13_0.selectType_ == arg_13_4 then
		return
	end

	if arg_13_0.lastSelectItem_ then
		arg_13_0.lastSelectItem_:RefreshSelectState(false)
	end

	arg_13_0.selectInfo_ = arg_13_1
	arg_13_0.selectInex_ = arg_13_3
	arg_13_0.selectType_ = arg_13_4

	for iter_13_0, iter_13_1 in ipairs(ItemCfg[arg_13_0.itemInfo_[1]].param) do
		if arg_13_1.id == iter_13_1[1] then
			arg_13_0.trueIndex_ = iter_13_0

			break
		end
	end

	arg_13_0.lastSelectItem_ = arg_13_2

	arg_13_2:RefreshSelectState(true)
	arg_13_0:RefreshSelect()
end

function var_0_0.RefreshUI(arg_14_0)
	arg_14_0.itemInfo_ = arg_14_0.params_.popItemInfo
	arg_14_0.useNum_ = arg_14_0.params_.selectNum
	arg_14_0.notHaveList_ = {}
	arg_14_0.haveList_ = {}

	local var_14_0 = ItemCfg[arg_14_0.itemInfo_[1]]

	for iter_14_0 = 1, #var_14_0.param do
		local var_14_1 = var_14_0.param[iter_14_0][1]
		local var_14_2 = ItemCfg[var_14_1]
		local var_14_3 = WeaponServantData:GetServantSByID(var_14_1)
		local var_14_4 = SkinCfg[var_14_1]
		local var_14_5 = var_14_2.hero_id or var_14_1
		local var_14_6 = var_14_2.type == ItemConst.ITEM_TYPE.HERO_PIECE

		if HeroTools.GetIsHide(var_14_1) or HeroTools.GetIsSkinHide(var_14_1) then
			-- block empty
		elseif HeroCfg[var_14_5] and (HeroTools.GetHeroIsUnlock(var_14_5) or var_14_6 and HeroData:GetHeroList()[var_14_5].piece >= GameSetting.unlock_hero_need.value[HeroCfg[var_14_5].rare]) then
			table.insert(arg_14_0.haveList_, var_14_0.param[iter_14_0])
		elseif var_14_3 and next(var_14_3) and var_14_0.sub_type == ItemConst.ITEM_SUB_TYPE.HERO_OPTIONAL_ONE then
			table.insert(arg_14_0.haveList_, var_14_0.param[iter_14_0])
		else
			if not HeroCfg[var_14_5] and var_14_4 and HeroTools.GetHasOwnedSkin(var_14_1) then
				var_14_0.param[iter_14_0].owned = true
			end

			table.insert(arg_14_0.notHaveList_, var_14_0.param[iter_14_0])
		end
	end

	arg_14_0:RefreshItemList(false)
	arg_14_0:RefreshItemList(true)
	arg_14_0:RefreshSelect()
end

function var_0_0.RefreshItemList(arg_15_0, arg_15_1)
	local var_15_0 = arg_15_1 and arg_15_0.haveList_ or arg_15_0.notHaveList_
	local var_15_1 = arg_15_1 and arg_15_0.haveItemList_ or arg_15_0.notHaveItemList_
	local var_15_2 = arg_15_1 and arg_15_0.haveContent_ or arg_15_0.notHaveContent_
	local var_15_3 = arg_15_1 and arg_15_0.haveTitle_ or arg_15_0.notHaveTitle_
	local var_15_4 = ItemCfg[arg_15_0.itemInfo_[1]].sub_type ~= ItemConst.ITEM_SUB_TYPE.OPTIONAL_ITEM_MULT and ItemCfg[arg_15_0.itemInfo_[1]].sub_type ~= ItemConst.ITEM_SUB_TYPE.OPTIONAL_ITEM

	if #var_15_0 > 0 then
		SetActive(var_15_2.gameObject, true)
		SetActive(var_15_3, var_15_4)

		for iter_15_0, iter_15_1 in ipairs(var_15_0) do
			local var_15_5 = iter_15_1[1]
			local var_15_6 = iter_15_1[2] * arg_15_0.useNum_
			local var_15_7 = clone(ItemTemplateData)

			var_15_7.id = var_15_5
			var_15_7.number = var_15_6
			var_15_7.ownedFlag = iter_15_1.owned

			local var_15_8 = var_15_1[iter_15_0]

			if var_15_8 == nil then
				local var_15_9 = Object.Instantiate(arg_15_0.itemGo_, var_15_2)

				var_15_8 = CommonRecommendItemView.New(var_15_9)

				table.insert(var_15_1, var_15_8)
			end

			function var_15_7.clickFun(arg_16_0)
				if arg_16_0.ownedFlag then
					return
				end

				arg_15_0:SelectItem(arg_16_0, var_15_8, iter_15_0, arg_15_1)
			end

			var_15_8:SetData(var_15_7)
			var_15_8:RefreshRecommend()
			SetActive(var_15_8.gameObject_, true)
		end

		for iter_15_2 = #var_15_0 + 1, #var_15_1 do
			SetActive(var_15_1[iter_15_2].gameObject_, false)
		end
	else
		SetActive(var_15_2.gameObject, false)
		SetActive(var_15_3, false)
	end
end

function var_0_0.RefreshSelect(arg_17_0)
	if arg_17_0.selectInfo_ then
		arg_17_0.tipText_.text = arg_17_0:GetTipsItemName(arg_17_0.selectInfo_.id)

		arg_17_0.okBtnController_:SetSelectedState("state1")
	else
		arg_17_0.tipText_.text = GetTips("SELECT_CURRENT")

		arg_17_0.okBtnController_:SetSelectedState("state0")
	end
end

function var_0_0.GetTipsItemName(arg_18_0, arg_18_1)
	local var_18_0 = string.format(GetTips("TIP_SELECT"), ItemTools.getItemName(arg_18_1))
	local var_18_1 = ItemCfg[arg_18_1]

	if var_18_1 and var_18_1.type == ItemConst.ITEM_TYPE.WEAPON_SERVANT then
		local var_18_2 = WeaponServantCfg[arg_18_1].effect[1]
		local var_18_3 = 0

		if var_18_2 > 0 then
			var_18_3 = WeaponEffectCfg[var_18_2].spec_char[1]
		end

		if var_18_3 ~= nil and var_18_3 > 0 then
			var_18_0 = string.format("%s,%s", var_18_0, string.format(GetTips("TIP_SELECT_RECOMEND"), HeroTools.GetHeroFullName(var_18_3)))
		end
	end

	return var_18_0
end

function var_0_0.OnTryToUseItem(arg_19_0, arg_19_1, arg_19_2)
	if isSuccess(arg_19_1.result) then
		JumpTools:Back()
		getReward(arg_19_1.drop_list, {
			ItemConst.ITEM_TYPE.HERO,
			ItemConst.ITEM_TYPE.HERO_SKIN
		})
	else
		ShowTips(arg_19_1.result)
	end
end

function var_0_0.OnExit(arg_20_0)
	arg_20_0.selectInex_ = 0
	arg_20_0.lastSelectItem_ = nil
	arg_20_0.selectInfo_ = nil
	arg_20_0.trueIndex_ = 0
	arg_20_0.scrollRect_.verticalNormalizedPosition = 1
end

function var_0_0.Dispose(arg_21_0)
	for iter_21_0, iter_21_1 in ipairs(arg_21_0.notHaveItemList_) do
		iter_21_1:Dispose()
	end

	arg_21_0.notHaveItemList_ = nil

	for iter_21_2, iter_21_3 in ipairs(arg_21_0.haveItemList_) do
		iter_21_3:Dispose()
	end

	arg_21_0.haveItemList_ = nil

	var_0_0.super.Dispose(arg_21_0)
end

return var_0_0
