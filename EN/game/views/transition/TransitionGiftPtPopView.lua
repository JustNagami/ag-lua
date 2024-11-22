local var_0_0 = class("TransitionGiftPtPopView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/System/Hero_jumps/HeroJumpsUpPop"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiPop.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:InitUI()
	arg_3_0:AddUIListeners()
end

function var_0_0.InitUI(arg_4_0)
	arg_4_0:BindCfgUI()

	arg_4_0.tryToImproveTransitionGiftPtHandler_ = handler(arg_4_0, arg_4_0.OnTryToImproveTransitionGiftPt)
	arg_4_0.icon_.sprite = ItemTools.getItemLittleSprite(CurrencyIdMapCfg.CURRENCY_TYPE_GOLD.item_id)
	arg_4_0.scrollHelper_ = LuaList.New(handler(arg_4_0, arg_4_0.IndexItem), arg_4_0.listGo_, CommonItemView)
end

function var_0_0.IndexItem(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = arg_5_0.cost_[arg_5_1]
	local var_5_1 = ""
	local var_5_2 = ItemTools.getItemNum(var_5_0.id)

	function var_5_0.clickFun()
		ShowPopItem(POP_SOURCE_ITEM, {
			var_5_0.id,
			var_5_0._num
		})
	end

	var_5_0.bottomText = {
		var_5_2,
		var_5_0._num
	}
	var_5_0.animatorType = ItemConst.ITEM_ANIMATOR_TYPE.NULL

	arg_5_2:SetData(var_5_0)
end

function var_0_0.AddUIListeners(arg_7_0)
	arg_7_0:AddBtnListener(arg_7_0.btn_, nil, function()
		if arg_7_0.addLevel_ == 1 then
			for iter_8_0, iter_8_1 in ipairs(arg_7_0.cost_) do
				local var_8_0 = iter_8_1.id
				local var_8_1 = iter_8_1._num

				if var_8_1 > ItemTools.getItemNum(var_8_0) then
					ShowPopItem(POP_SOURCE_ITEM, {
						var_8_0,
						var_8_1
					})

					return
				end
			end

			if not checkGold(arg_7_0.goldNeed_) then
				return
			end
		end

		local var_8_2 = {
			{
				id = CurrencyIdMapCfg.CURRENCY_TYPE_GOLD.item_id,
				number = arg_7_0.goldNeed_
			}
		}

		table.insertto(var_8_2, arg_7_0.cost_)

		if not _G.SkipTip.TransitionGiftPtImproveTip then
			ShowMessageBox({
				title = GetTips("PROMPT"),
				content = GetTips("EXCLUSIVE_SKILL_POINT_UP_CONFIRMATION"),
				OkCallback = function()
					_G.SkipTip.TransitionGiftPtImproveTip = arg_7_0.TransitionGiftPtImproveTip_

					HeroAction.TryToImproveTransitionGiftPt(arg_7_0.params_.heroID, arg_7_0.params_.index, arg_7_0.addLevel_, var_8_2)
					arg_7_0:Back()
				end,
				CancelCallback = function()
					return
				end,
				ToggleCallback = function(arg_11_0)
					arg_7_0.TransitionGiftPtImproveTip_ = arg_11_0
				end
			})

			return
		end

		HeroAction.TryToImproveTransitionGiftPt(arg_7_0.params_.heroID, arg_7_0.params_.index, arg_7_0.addLevel_, var_8_2)
		arg_7_0:Back()
	end)
	arg_7_0:AddBtnListener(arg_7_0.delBtn_, nil, function()
		arg_7_0.addLevel_ = arg_7_0.addLevel_ - 1

		arg_7_0:RefreshUI()
	end)
	arg_7_0:AddBtnListener(arg_7_0.addBtn_, nil, function()
		arg_7_0.addLevel_ = arg_7_0.addLevel_ + 1

		arg_7_0:RefreshUI()
	end)
	arg_7_0:AddBtnListener(arg_7_0.maskBtn_, nil, function()
		arg_7_0:Back()
	end)
	arg_7_0.slider_.onValueChanged:AddListener(function(arg_15_0)
		arg_7_0:OnSliderValueChanged(arg_15_0)
	end)
end

function var_0_0.OnEnter(arg_16_0)
	manager.windowBar:SetAsLastSibling()
	manager.windowBar:SwitchBar({
		CurrencyConst.CURRENCY_TYPE_GOLD
	})
	manager.windowBar:SetBarCanAdd(CurrencyConst.CURRENCY_TYPE_GOLD, true)

	arg_16_0.curLevel_ = arg_16_0.params_.giftPt
	arg_16_0.addLevel_ = arg_16_0.params_.isEnter and 1 or arg_16_0.params_.addLevel
	arg_16_0.maxLevel_ = arg_16_0:GetMaxLevel()
	arg_16_0.maxLevel_ = arg_16_0.maxLevel_ < arg_16_0.curLevel_ + 1 and arg_16_0.curLevel_ + 1 or arg_16_0.maxLevel_

	arg_16_0:RegistEventListener(CURRENCY_UPDATE, handler(arg_16_0, arg_16_0.OnGoldChange))
	arg_16_0:RefreshUI()
end

function var_0_0.GetMaxLevel(arg_17_0)
	local var_17_0 = GameSetting.exclusive_skill_talent_strengthen_cost.value
	local var_17_1 = arg_17_0.curLevel_ + 1
	local var_17_2 = {}

	for iter_17_0 = var_17_1, GameSetting.exclusive_skill_talent_num_max.value[1] do
		local var_17_3 = var_17_0[iter_17_0]

		for iter_17_1, iter_17_2 in ipairs(var_17_3) do
			local var_17_4 = iter_17_2[1]
			local var_17_5 = iter_17_2[2]

			if not var_17_2[var_17_4] then
				var_17_2[var_17_4] = 0
			end

			if var_17_2[var_17_4] + var_17_5 > ItemTools.getItemNum(var_17_4) then
				return iter_17_0 - 1
			end

			var_17_2[var_17_4] = var_17_2[var_17_4] + var_17_5
		end

		var_17_1 = iter_17_0
	end

	return var_17_1
end

function var_0_0.RefreshUI(arg_18_0)
	arg_18_0:RefreshCost()
	arg_18_0:RefreshGold()
	arg_18_0:RefreshButton()
	arg_18_0.scrollHelper_:StartScroll(#arg_18_0.cost_)
end

function var_0_0.RefreshCost(arg_19_0)
	arg_19_0.cost_ = {}

	local var_19_0 = {
		all = {}
	}

	if arg_19_0.addLevel_ > 0 then
		local var_19_1 = GameSetting.exclusive_skill_talent_strengthen_cost.value

		for iter_19_0 = arg_19_0.curLevel_ + 1, arg_19_0.curLevel_ + arg_19_0.addLevel_ do
			local var_19_2 = var_19_1[iter_19_0]

			for iter_19_1, iter_19_2 in ipairs(var_19_2) do
				local var_19_3 = iter_19_2[1]
				local var_19_4 = iter_19_2[2]

				if not var_19_0[var_19_3] then
					var_19_0[var_19_3] = 0

					table.insert(var_19_0.all, var_19_3)
				end

				var_19_0[var_19_3] = var_19_0[var_19_3] + var_19_4
			end
		end

		arg_19_0.goldNeed_ = var_19_0[CurrencyConst.CURRENCY_TYPE_GOLD]
	else
		arg_19_0.goldNeed_ = 0
	end

	table.sort(var_19_0.all, function(arg_20_0, arg_20_1)
		return arg_20_1 < arg_20_0
	end)

	for iter_19_3, iter_19_4 in ipairs(var_19_0.all) do
		if iter_19_4 ~= CurrencyIdMapCfg.CURRENCY_TYPE_GOLD.item_id then
			local var_19_5 = clone(ItemTemplateData)

			var_19_5.id = iter_19_4
			var_19_5._num = var_19_0[iter_19_4]
			var_19_5.number = nil

			table.insert(arg_19_0.cost_, var_19_5)
		end
	end
end

function var_0_0.RefreshGold(arg_21_0)
	if ItemTools.getItemNum(CurrencyConst.CURRENCY_TYPE_GOLD) < arg_21_0.goldNeed_ then
		arg_21_0.gold_.text = "<color=#CF3232>" .. arg_21_0.goldNeed_ .. "</color>"
	else
		arg_21_0.gold_.text = arg_21_0.goldNeed_
	end
end

function var_0_0.RefreshButton(arg_22_0)
	arg_22_0.delBtn_.interactable = arg_22_0.addLevel_ > 1
	arg_22_0.addBtn_.interactable = arg_22_0.curLevel_ + arg_22_0.addLevel_ < arg_22_0.maxLevel_
	arg_22_0.slider_.value = arg_22_0.addLevel_ / (arg_22_0.maxLevel_ - arg_22_0.curLevel_)
	arg_22_0.numTxt1_.text = "+" .. arg_22_0.addLevel_
	arg_22_0.numTxt2_.text = "+" .. arg_22_0.addLevel_
	arg_22_0.enhanceCnt_.text = table.concat({
		GetTips("COMMON_ENHANCE_NUMBER"),
		":",
		arg_22_0.addLevel_
	})
end

function var_0_0.OnSliderValueChanged(arg_23_0, arg_23_1)
	local var_23_0 = math.floor((arg_23_0.maxLevel_ - arg_23_0.curLevel_) * arg_23_1 + 0.5)

	if var_23_0 == 0 then
		var_23_0 = 1
	end

	if var_23_0 == arg_23_0.addLevel_ then
		arg_23_0:RefreshButton()
	else
		arg_23_0.addLevel_ = var_23_0

		arg_23_0:RefreshUI()
	end
end

function var_0_0.OnGoldChange(arg_24_0)
	arg_24_0.maxLevel_ = arg_24_0:GetMaxLevel()
	arg_24_0.maxLevel_ = arg_24_0.maxLevel_ < arg_24_0.curLevel_ + 1 and arg_24_0.curLevel_ + 1 or arg_24_0.maxLevel_

	arg_24_0:RefreshUI()
end

function var_0_0.OnTryToImproveTransitionGiftPt(arg_25_0)
	if arg_25_0.level_ >= GameSetting.exclusive_skill_talent_num_max.value[1] then
		arg_25_0:Back()
	else
		arg_25_0.level_ = arg_25_0.level_ + 1

		arg_25_0:RefreshUI()
	end
end

function var_0_0.OnExit(arg_26_0)
	arg_26_0.params_.addLevel = arg_26_0.addLevel_
	arg_26_0.params_.isEnter = false

	arg_26_0:RemoveAllEventListener()
end

function var_0_0.Dispose(arg_27_0)
	arg_27_0:RemoveAllEventListener()
	arg_27_0:RemoveAllListeners()

	if arg_27_0.scrollHelper_ then
		arg_27_0.scrollHelper_:Dispose()

		arg_27_0.scrollHelper_ = nil
	end

	var_0_0.super.Dispose(arg_27_0)
end

return var_0_0
