local var_0_0 = class("HeroUpgradeView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/System/Hero_arrt/HeroArrtLvupUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

local var_0_1 = 0
local var_0_2 = {}
local var_0_3 = {}

function var_0_0.Init(arg_3_0)
	arg_3_0:InitUI()
	arg_3_0:AddUIListener()

	arg_3_0.tweens_ = {}
	arg_3_0.breakItems_ = {}
	arg_3_0.needIcon_.sprite = ItemTools.getItemLittleSprite(CurrencyConst.CURRENCY_TYPE_GOLD)
end

function var_0_0.InitUI(arg_4_0)
	arg_4_0:BindCfgUI()

	arg_4_0.addExpController_ = arg_4_0.controller_:GetController("addExp")
	arg_4_0.typeController_ = arg_4_0.controller_:GetController("type")
	arg_4_0.moneyEnoughController_ = arg_4_0.controller_:GetController("moneyEnough")
	arg_4_0.canBreakController_ = arg_4_0.controller_:GetController("canBreak")
	arg_4_0.conditionBreakController_ = arg_4_0.conditionController_:GetController("conditionItem")

	arg_4_0:InitMaterialItem()
	arg_4_0:InitPropItem()
end

function var_0_0.CameraEnter(arg_5_0)
	manager.heroRaiseTrack:SetViewState(HeroRaiseTrackConst.ViewType.heroRaiseCommon, {
		1,
		2
	}, false)
end

function var_0_0.AddUIListener(arg_6_0)
	arg_6_0:AddBtnListener(arg_6_0.okBtn_, nil, function()
		local var_7_0 = false

		for iter_7_0 = 1, #arg_6_0.items_ do
			if arg_6_0.items_[iter_7_0]:GetData().topAmountValue > 0 then
				var_7_0 = true

				break
			end
		end

		if not var_7_0 then
			ShowTips("HERO_LEVEL_MATERIAL_NOT_SELECTED")

			return
		end

		if arg_6_0:HaveMaterial() then
			local var_7_1 = MaterialTools.materialGiveBack(arg_6_0.cutExp_, ItemConst.STR_ITEM.HERO)

			arg_6_0.cutExpForReward_ = arg_6_0.cutExp_

			if #var_7_1 > 0 then
				JumpTools.OpenPageByJump("materialPreview", {
					content = GetTips("HERO_STRENGTH_EXP_OVERFLOW"),
					OkCallback = function()
						arg_6_0:SendAddExpToServer()
					end,
					itemList = var_7_1
				})

				return
			else
				arg_6_0:SendAddExpToServer()
			end
		else
			ShowMessageBox({
				title = GetTips("PROMPT"),
				content = GetTips("NO_HERO_EXP_MATERIAL"),
				OkCallback = function()
					local var_9_0 = GameSetting.hero_exp_props_id_list.value[1]
					local var_9_1 = ItemCfg[var_9_0].source

					JumpTools.JumpToPage(var_9_1[1])
				end
			})
		end
	end)
	arg_6_0:AddBtnListener(arg_6_0.oneKeyBtn_, nil, function()
		local var_10_0 = false

		for iter_10_0 = 1, #arg_6_0.items_ do
			if arg_6_0.items_[iter_10_0]:GetData().number > 0 then
				var_10_0 = true

				break
			end
		end

		if arg_6_0:HaveMaterial() and var_10_0 then
			arg_6_0:OnKeyLevelUp()
		else
			ShowMessageBox({
				title = GetTips("PROMPT"),
				content = GetTips("NO_HERO_EXP_MATERIAL"),
				OkCallback = function()
					local var_11_0 = GameSetting.hero_exp_props_id_list.value[1]
					local var_11_1 = ItemCfg[var_11_0].source

					JumpTools.JumpToPage(var_11_1[1])
				end
			})
		end
	end)
	arg_6_0:AddBtnListener(arg_6_0.breakPreviewBtn_, nil, function()
		JumpTools.OpenPageByJump("heroBreakPreview", {
			heroInfo = arg_6_0.heroInfo_
		})
	end)
	arg_6_0:AddBtnListener(arg_6_0.breakBtn_, nil, function()
		if arg_6_0.canBreak_ then
			arg_6_0:SendBreakToServer()
		elseif PlayerData:GetPlayerInfo().userLevel < arg_6_0.breakCfg_.user_level then
			ShowTips(string.format(GetTips("PLAYER_LEVEL_UNLOCK"), arg_6_0.breakCfg_.user_level))
		elseif not arg_6_0:HaveBreakMaterial() then
			ShowTips("ERROR_ITEM_NOT_ENOUGH_MATERIAL")
		elseif not checkGold(arg_6_0.breakCfg_.cost_gold, true) then
			return
		end
	end)
end

function var_0_0.OnHeroBreak(arg_14_0, arg_14_1, arg_14_2)
	if isSuccess(arg_14_1.result) then
		local var_14_0 = var_0_2

		HeroAction.BreakSuccess(arg_14_0.heroInfo_.id, (arg_14_0.heroInfo_.break_level or 0) + 1)
		JumpTools.OpenPageByJump("newBreakSuccess", {
			heroId = arg_14_0.heroInfo_.id,
			breakLevel = arg_14_0.heroInfo_.break_level or 0,
			oldCrit = var_14_0[HeroConst.HERO_ATTRIBUTE.CRITICAL],
			proxy = arg_14_0.heroViewProxy_
		})

		local var_14_1 = arg_14_0.heroViewProxy_:CalHeroEquipAttribute(arg_14_0.heroInfo_.id)

		var_0_2 = HeroTools.CaculateHeroAttribute(arg_14_0.heroInfo_, var_14_1)
	end
end

function var_0_0.SendAddExpToServer(arg_15_0)
	var_0_1 = arg_15_0.heroInfo_.level

	local var_15_0 = {}

	for iter_15_0, iter_15_1 in ipairs(arg_15_0.items_) do
		local var_15_1 = iter_15_1:GetData()

		if var_15_1.topAmountValue > 0 then
			table.insert(var_15_0, {
				id = var_15_1.id,
				num = var_15_1.topAmountValue
			})
		end
	end

	HeroAction.AddHeroExp(arg_15_0.heroInfo_.id, var_15_0)
end

function var_0_0.SendBreakToServer(arg_16_0)
	HeroTools.CalFinalAttribute(var_0_2)
	HeroAction.HeroBreak(arg_16_0.heroInfo_.id)
end

function var_0_0.OnAddHeroExp(arg_17_0, arg_17_1)
	if isSuccess(arg_17_1.result) then
		local var_17_0 = arg_17_0.nextLv_
		local var_17_1 = var_0_2

		HeroAction.AddHeroExpSuccess(arg_17_0.heroInfo_.id, arg_17_0.nextLv_, arg_17_0.finalExp_)

		if var_17_0 > var_0_1 then
			JumpTools.OpenPageByJump("newHeroUpgradeSuccess", {
				heroId = arg_17_0.heroInfo_.id,
				oldLv = var_0_1,
				oldAttr = var_17_1,
				proxy = arg_17_0.heroViewProxy_,
				callback = function()
					local var_18_0 = MaterialTools.materialGiveBack(arg_17_0.cutExpForReward_, ItemConst.STR_ITEM.HERO)

					if #var_18_0 > 0 then
						getReward(formatRewardCfgList(var_18_0))
					end
				end
			})
		end

		local var_17_2 = arg_17_0.heroViewProxy_:CalHeroEquipAttribute(arg_17_0.heroInfo_.id)

		var_0_2 = HeroTools.CaculateHeroAttribute(arg_17_0.heroInfo_, var_17_2)

		HeroTools.CalFinalAttribute(var_0_2)

		if not arg_17_0:HaveMaterial() or arg_17_0.nextLv_ >= arg_17_0.curLvMax_ or manager.guide:IsPlaying() then
			-- block empty
		elseif arg_17_0.nextLv_ ~= arg_17_0.curLvMax_ then
			arg_17_0:SelectFirstMaterial()
		end
	end
end

function var_0_0.OnKeyLevelUp(arg_19_0)
	arg_19_0:QuickSelectList()
	arg_19_0:UpdatePreview()
end

function var_0_0.UpdatePreview(arg_20_0)
	arg_20_0.fromLevelText_.text = string.format("%d", arg_20_0.heroInfo_.level)

	local var_20_0 = 0
	local var_20_1 = 0

	for iter_20_0, iter_20_1 in ipairs(arg_20_0.items_) do
		local var_20_2 = iter_20_1:GetData()

		var_20_0 = var_20_0 + ItemCfg[var_20_2.id].param[1] * var_20_2.topAmountValue
		var_20_2.number = arg_20_0:GetNumber(var_20_2.id)
		var_20_2.selectStyle = var_20_2.topAmountValue ~= 0

		iter_20_1:SetData(var_20_2)
		iter_20_1:RefreshGray(var_20_2.number == 0 or var_20_2.topAmountValue > 0)

		if var_20_2.number == 0 then
			var_20_1 = var_20_1 + 1
		end
	end

	local var_20_3, var_20_4, var_20_5, var_20_6, var_20_7 = LvTools.CheckHeroExp(arg_20_0.heroInfo_.level, arg_20_0.heroInfo_.exp + var_20_0, arg_20_0.curLvMax_)

	arg_20_0.finalExp_ = var_20_6
	arg_20_0.cutExp_ = var_20_7
	arg_20_0.addExpText_.text = string.format("+%d", var_20_0 - var_20_7)
	arg_20_0.toLevelText_.text = string.format("%d", var_20_3)

	local var_20_8 = GameLevelSetting[var_20_3].hero_level_exp1

	if var_20_3 >= HeroConst.HERO_LV_MAX then
		arg_20_0.progressText_.text = "-/-"
	else
		arg_20_0.progressText_.text = string.format("%d/%d", var_20_4, var_20_8)
	end

	arg_20_0.currentProgressBar_.value = (arg_20_0.heroInfo_.exp - LvTools.LevelToExp(arg_20_0.heroInfo_.level, "hero_level_exp1")) / var_20_8
	arg_20_0.previewProgressBar_.value = var_20_4 / var_20_8

	if var_20_3 > arg_20_0.heroInfo_.level then
		arg_20_0.currentProgressBar_.value = 0
	end

	arg_20_0.addExpController_:SetSelectedState(tostring(var_20_0 - var_20_7 ~= 0))

	if arg_20_0.nextLv_ ~= var_20_3 then
		arg_20_0.nextLv_ = var_20_3

		arg_20_0:UpdatePreviewAttr()
	end

	SetActive(arg_20_0.maxText_, var_20_3 >= arg_20_0.curLvMax_)
end

function var_0_0.InitMaterialItem(arg_21_0)
	arg_21_0.items_ = {}

	for iter_21_0, iter_21_1 in ipairs(GameSetting.hero_exp_props_id_list.value) do
		local var_21_0 = arg_21_0[string.format("itemGo%d_", iter_21_0)]

		SetActive(var_21_0, true)

		local var_21_1 = CommonItemView.New(var_21_0)

		table.insert(arg_21_0.items_, var_21_1)

		local var_21_2 = clone(ItemTemplateData)

		var_21_2.id = iter_21_1
		var_21_2.number = arg_21_0:GetNumber(iter_21_1)
		var_21_2.topAmountValue = 0

		function var_21_2.longClickFun(arg_22_0, arg_22_1, arg_22_2)
			if arg_22_2.dragging then
				return false
			end

			if arg_22_0.number == 0 then
				ShowPopItem(POP_SOURCE_ITEM, {
					arg_22_0.id,
					arg_22_0.number
				})
			end

			if arg_22_0.number <= arg_22_0.topAmountValue or arg_21_0.cutExp_ >= 0 and arg_21_0.nextLv_ == arg_21_0.curLvMax_ or arg_22_0.topAmountValue == ItemTools.getItemNum(arg_22_0.id) then
				return false
			end

			arg_22_0.topAmountValue = arg_22_0.topAmountValue + 1

			arg_21_0:UpdatePreview()

			return true
		end

		function var_21_2.clickAmountFun(arg_23_0)
			arg_23_0.topAmountValue = arg_23_0.topAmountValue - 1

			arg_21_0:UpdatePreview()

			return true
		end

		var_21_1:SetData(var_21_2)
	end
end

function var_0_0.InitPropItem(arg_24_0)
	arg_24_0.propNames_ = {
		arg_24_0.propName1_,
		arg_24_0.propName2_,
		arg_24_0.propName3_,
		arg_24_0.propName4_
	}
	arg_24_0.propItems_ = {
		arg_24_0.propNum1_,
		arg_24_0.propNum2_,
		arg_24_0.propNum3_,
		arg_24_0.propNum4_
	}
	arg_24_0.toPropItems_ = {
		arg_24_0.toPropNum1_,
		arg_24_0.toPropNum2_,
		arg_24_0.toPropNum3_,
		arg_24_0.toPropNum4_
	}
	arg_24_0.arrowItems_ = {
		arg_24_0.arrowItem1_,
		arg_24_0.arrowItem2_,
		arg_24_0.arrowItem3_,
		arg_24_0.arrowItem4_
	}
	arg_24_0.propIcon_ = {
		arg_24_0.propIcon1_,
		arg_24_0.propIcon2_,
		arg_24_0.propIcon3_,
		arg_24_0.propIcon4_
	}
	arg_24_0.propIndexes_ = {
		HeroConst.HERO_ATTRIBUTE.ATK,
		HeroConst.HERO_ATTRIBUTE.ARM,
		HeroConst.HERO_ATTRIBUTE.STA,
		HeroConst.HERO_ATTRIBUTE.CRITICAL
	}
	arg_24_0.endfixes_ = {}

	for iter_24_0 = 1, 4 do
		local var_24_0, var_24_1, var_24_2 = SkillTools.GetAttr({
			arg_24_0.propIndexes_[iter_24_0],
			0
		})

		arg_24_0.propNames_[iter_24_0].text = GetI18NText(var_24_0)
		arg_24_0.propIcon_[iter_24_0].sprite = var_24_2
		arg_24_0.endfixes_[iter_24_0] = PublicAttrCfg[arg_24_0.propIndexes_[iter_24_0]].percent == 1 and "%" or ""
	end
end

function var_0_0.UpdateBreakView(arg_25_0)
	var_0_2 = HeroTools.CaculateHeroAttribute(arg_25_0.heroInfo_, {})

	HeroTools.CalFinalAttribute(var_0_2)

	arg_25_0.fromBreakLevelText_.text = arg_25_0.breakCfg_.max_level

	if arg_25_0.nextBreakCfg_ then
		arg_25_0.toBreakLevelText_.text = arg_25_0.nextBreakCfg_.max_level
	end

	arg_25_0.fromCritText_.text = string.format("%.2f", var_0_2[HeroConst.HERO_ATTRIBUTE.CRITICAL] / 10) .. (PublicAttrCfg[HeroConst.HERO_ATTRIBUTE.CRITICAL].percent == 1 and "%" or "")

	local var_25_0 = deepClone(arg_25_0.heroInfo_)

	var_25_0.break_level = var_25_0.break_level + 1

	local var_25_1 = HeroTools.CaculateHeroAttribute(var_25_0, {})

	HeroTools.CalFinalAttribute(var_25_1)

	arg_25_0.toCritText_.text = string.format("%.2f", var_25_1[HeroConst.HERO_ATTRIBUTE.CRITICAL] / 10) .. (PublicAttrCfg[HeroConst.HERO_ATTRIBUTE.CRITICAL].percent == 1 and "%" or "")

	arg_25_0:CheckCanBreak()
end

function var_0_0.CheckCanBreak(arg_26_0)
	arg_26_0.canBreak_ = true

	local var_26_0

	if PlayerData:GetPlayerInfo().userLevel >= arg_26_0.breakCfg_.user_level then
		var_26_0 = string.format(GetTips("UPGRADE_LIMIT_LEVEL"), arg_26_0.breakCfg_.user_level)

		arg_26_0.conditionBreakController_:SetSelectedState("achieve")
	else
		var_26_0 = string.format(GetTips("UPGRADE_LIMIT_LEVEL_RED"), arg_26_0.breakCfg_.user_level)
		arg_26_0.canBreak_ = false

		arg_26_0.conditionBreakController_:SetSelectedState("unsuccessful")
	end

	arg_26_0.conditionText_.text = var_26_0

	local var_26_1 = #arg_26_0.breakCfg_.cost

	for iter_26_0 = 1, 3 do
		local var_26_2 = arg_26_0["breakItemGo" .. iter_26_0 .. "_"]

		if iter_26_0 <= var_26_1 then
			if not arg_26_0.breakItems_[iter_26_0] then
				SetActive(var_26_2, true)

				local var_26_3 = NewHeroBreakMaterialItem.New(arg_26_0, var_26_2)

				table.insert(arg_26_0.breakItems_, var_26_3)
			end

			arg_26_0.breakItems_[iter_26_0]:SetInfo(arg_26_0.breakCfg_.cost[iter_26_0][1], arg_26_0.breakCfg_.cost[iter_26_0][2])

			if not arg_26_0.breakItems_[iter_26_0]:IsEnough() then
				arg_26_0.canBreak_ = false
			end
		else
			SetActive(var_26_2, false)
		end
	end

	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_26_0.breakItemContent_)

	while var_26_1 < #arg_26_0.breakItems_ do
		arg_26_0.breakItems_[#arg_26_0.breakItems_]:Dispose()
		table.remove(arg_26_0.breakItems_, #arg_26_0.breakItems_)
	end

	arg_26_0.needNumText_.text = string.format("%d", arg_26_0.breakCfg_.cost_gold)

	if CurrencyData:GetCurrencyNum(CurrencyConst.CURRENCY_TYPE_GOLD) >= arg_26_0.breakCfg_.cost_gold then
		arg_26_0.moneyEnoughController_:SetSelectedState("true")
	else
		arg_26_0.moneyEnoughController_:SetSelectedState("false")

		arg_26_0.canBreak_ = false
	end

	arg_26_0.canBreakController_:SetSelectedState(tostring(PlayerData:GetPlayerInfo().userLevel >= arg_26_0.breakCfg_.user_level))
end

function var_0_0.OnTop(arg_27_0)
	arg_27_0:UpdateBar()
	arg_27_0:CheckCanBreak()
end

function var_0_0.HaveMaterial(arg_28_0)
	for iter_28_0, iter_28_1 in ipairs(GameSetting.hero_exp_props_id_list.value) do
		if ItemTools.getItemNum(iter_28_1) > 0 then
			return true
		end
	end

	return false
end

function var_0_0.HaveBreakMaterial(arg_29_0)
	local var_29_0 = #arg_29_0.breakCfg_.cost

	for iter_29_0 = 1, var_29_0 do
		if not arg_29_0.breakItems_[iter_29_0]:IsEnough() then
			return false
		end
	end

	return true
end

function var_0_0.SelectFirstMaterial(arg_30_0)
	local var_30_0 = true

	for iter_30_0 = 1, #arg_30_0.items_ do
		local var_30_1 = arg_30_0.items_[iter_30_0]:GetData()

		var_30_1.selectNum_ = 0

		if var_0_0:GetNumber(var_30_1.id) > 0 and var_30_0 then
			var_30_0 = false
			var_30_1.topAmountValue = 1

			arg_30_0.items_[iter_30_0]:SetData(var_30_1)
			arg_30_0.items_[iter_30_0]:RefreshGray(var_30_1.number == 0)
		else
			var_30_1.topAmountValue = 0

			arg_30_0.items_[iter_30_0]:SetData(var_30_1)
			arg_30_0.items_[iter_30_0]:RefreshGray(var_30_1.number == 0)
		end
	end

	arg_30_0:UpdatePreview()
end

function var_0_0.UpdateBar(arg_31_0)
	if arg_31_0.type_ == "lvUp" then
		manager.windowBar:SwitchBar({
			BACK_BAR,
			HOME_BAR
		})
	else
		manager.windowBar:SwitchBar({
			BACK_BAR,
			HOME_BAR,
			CurrencyConst.CURRENCY_TYPE_GOLD
		})
		manager.windowBar:SetBarCanAdd(CurrencyConst.CURRENCY_TYPE_GOLD, true)
	end
end

function var_0_0.OnEnter(arg_32_0)
	arg_32_0.heroViewProxy_ = arg_32_0.params_.proxy

	arg_32_0:UpdateView()
	arg_32_0:RegistEventListener(HERO_DATA_MODIFY, handler(arg_32_0, arg_32_0.OnHeroModify))
end

function var_0_0.GetNumber(arg_33_0, arg_33_1)
	return ItemTools.getItemNum(arg_33_1)
end

function var_0_0.OnMaterialModify(arg_34_0, arg_34_1)
	for iter_34_0, iter_34_1 in ipairs(arg_34_0.items_) do
		local var_34_0 = iter_34_1:GetData()

		if var_34_0.id == arg_34_1 then
			var_34_0.number = arg_34_0:GetNumber(arg_34_1)
			var_34_0.topAmountValue = 0

			iter_34_1:SetData(var_34_0)
			arg_34_0.items_[iter_34_0]:RefreshGray(var_34_0.number == 0)
		end
	end
end

function var_0_0.QuickSelectList(arg_35_0)
	local var_35_0 = LvTools.LevelToExp(arg_35_0.curLvMax_, "hero_level_exp1") - arg_35_0.heroInfo_.exp
	local var_35_1 = {}

	for iter_35_0 = 1, #arg_35_0.items_ do
		local var_35_2 = arg_35_0.items_[iter_35_0]:GetData()
		local var_35_3 = ItemCfg[var_35_2.id].param[1]

		var_35_1[iter_35_0] = math.max(math.min(math.ceil(var_35_0 / var_35_3), var_35_2.number), 0)
		var_35_0 = var_35_0 - var_35_1[iter_35_0] * var_35_3

		if var_35_0 < 0 and iter_35_0 > 1 then
			local var_35_4 = -var_35_0

			for iter_35_1 = iter_35_0 - 1, 1, -1 do
				local var_35_5 = arg_35_0.items_[iter_35_1]:GetData()
				local var_35_6 = ItemCfg[var_35_5.id].param[1]
				local var_35_7 = math.modf(var_35_4 / var_35_6)
				local var_35_8 = var_35_1[iter_35_1]

				var_35_1[iter_35_1] = math.max(0, var_35_1[iter_35_1] - var_35_7)

				local var_35_9 = math.min(var_35_8, var_35_7)

				var_35_4 = var_35_4 - var_35_6 * var_35_9
				var_35_0 = var_35_0 + var_35_6 * var_35_9
			end
		end

		if var_35_0 <= 0 then
			break
		end
	end

	for iter_35_2 = 1, #arg_35_0.items_ do
		if var_35_1[iter_35_2] == nil then
			var_35_1[iter_35_2] = 0
		end

		arg_35_0.items_[iter_35_2]:GetData().topAmountValue = var_35_1[iter_35_2]
		arg_35_0.selectStyle = var_35_1[iter_35_2] ~= 0
	end
end

function var_0_0.UpdatePreviewAttr(arg_36_0)
	var_0_2 = arg_36_0.heroViewProxy_:GetHeroAllAttribute(arg_36_0.heroInfo_.id)
	var_0_3 = arg_36_0:GetPreviewAttribute(arg_36_0.heroInfo_.id)

	for iter_36_0, iter_36_1 in pairs(arg_36_0.propItems_) do
		local var_36_0 = PublicAttrCfg[arg_36_0.propIndexes_[iter_36_0]].percent == 1
		local var_36_1 = var_0_2[arg_36_0.propIndexes_[iter_36_0]] or 0
		local var_36_2 = var_0_3[arg_36_0.propIndexes_[iter_36_0]]

		SetActive(arg_36_0.toPropItems_[iter_36_0].gameObject, var_36_2 - var_36_1 ~= 0)
		SetActive(arg_36_0.arrowItems_[iter_36_0], var_36_2 - var_36_1 ~= 0)

		if var_36_0 then
			iter_36_1.text = string.format("%.2f", var_36_1 / 10) .. arg_36_0.endfixes_[iter_36_0]
		else
			iter_36_1.text = math.floor(var_36_1)
		end

		if var_36_0 then
			arg_36_0.toPropItems_[iter_36_0].text = string.format("%.2f", var_36_2 / 10) .. arg_36_0.endfixes_[iter_36_0]
		else
			arg_36_0.toPropItems_[iter_36_0].text = math.floor(var_36_2)
		end
	end
end

function var_0_0.UpdateView(arg_37_0)
	arg_37_0.heroInfo_ = arg_37_0.heroViewProxy_:GetHeroData(arg_37_0.params_.heroId)
	arg_37_0.heroCfg_ = HeroCfg[arg_37_0.params_.heroId]

	if arg_37_0.heroInfo_.level == HeroConst.HERO_LV_MAX then
		arg_37_0:Back()

		return
	end

	arg_37_0.curLvMax_ = HeroTools.GetHeroCurrentMaxLevel(arg_37_0.heroInfo_)
	arg_37_0.breakCfg_ = HeroTools.GetHeroBreakConfig(arg_37_0.heroCfg_.race, arg_37_0.heroInfo_.break_level or 0)
	arg_37_0.breakIdList_ = HeroBreakCfg.get_id_list_by_race[arg_37_0.heroCfg_.race]

	if arg_37_0.heroInfo_.break_level < #arg_37_0.breakIdList_ - 1 then
		arg_37_0.nextBreakCfg_ = HeroTools.GetHeroBreakConfig(arg_37_0.heroCfg_.race, arg_37_0.heroInfo_.break_level + 1 or 0)
	end

	local var_37_0 = arg_37_0.heroViewProxy_:GetHeroUsingSkinInfo(arg_37_0.params_.heroId).id

	manager.heroRaiseTrack:SetModelState(var_37_0)

	if arg_37_0.heroInfo_.level == arg_37_0.curLvMax_ then
		arg_37_0.type_ = "break"
	else
		arg_37_0.type_ = "lvUp"
	end

	arg_37_0.typeController_:SetSelectedState(arg_37_0.type_)

	if arg_37_0.type_ == "lvUp" then
		arg_37_0:SelectFirstMaterial()

		local var_37_1 = arg_37_0.heroViewProxy_:GetHeroAllAttribute(arg_37_0.heroInfo_.id)

		for iter_37_0, iter_37_1 in ipairs(arg_37_0.propItems_) do
			local var_37_2 = var_37_1[arg_37_0.propIndexes_[iter_37_0]] or 0

			if PublicAttrCfg[arg_37_0.propIndexes_[iter_37_0]].percent == 1 then
				iter_37_1.text = string.format("%.2f", var_37_2 / 10) .. arg_37_0.endfixes_[iter_37_0]
			else
				iter_37_1.text = math.floor(var_37_2)
			end
		end
	elseif arg_37_0.type_ == "break" then
		arg_37_0:UpdateBreakView()
	end

	arg_37_0:UpdateBar()
end

function var_0_0.GetPreviewAttribute(arg_38_0, arg_38_1)
	local var_38_0 = deepClone(arg_38_0.heroViewProxy_:GetHeroData(arg_38_1))
	local var_38_1 = {}

	for iter_38_0, iter_38_1 in pairs(var_38_0.equip) do
		if iter_38_1.equip_id ~= 0 then
			table.insert(var_38_1, EquipData:GetEquipData(iter_38_1.equip_id))
		end
	end

	var_38_0.level = arg_38_0.nextLv_

	if var_38_0.servant_uid ~= 0 then
		local var_38_2 = WeaponServantData.GetWeaponServantList()[var_38_0.servant_uid]

		var_38_0.servantInfo = {
			id = var_38_2.id,
			stage = var_38_2.stage
		}
	else
		var_38_0.servantInfo = nil
	end

	local var_38_3 = GetHeroFinalAttr(var_38_0, var_38_0.servantInfo, var_38_1)
	local var_38_4 = var_38_3[HeroConst.HERO_ATTRIBUTE.ATK] or 0
	local var_38_5 = var_38_3[HeroConst.HERO_ATTRIBUTE.ARM] or 0
	local var_38_6 = var_38_3[HeroConst.HERO_ATTRIBUTE.STA] or 0
	local var_38_7 = var_38_3[11] or 0
	local var_38_8 = var_38_3[12] or 0
	local var_38_9 = var_38_3[13] or 0
	local var_38_10 = var_38_3[21] or 0
	local var_38_11 = var_38_3[22] or 0
	local var_38_12 = var_38_3[31] or 0
	local var_38_13 = var_38_3[32] or 0

	var_38_3[HeroConst.HERO_ATTRIBUTE.ATK] = var_38_4 * (1 + var_38_7 / 1000 + var_38_9 / 1000) + var_38_8
	var_38_3[HeroConst.HERO_ATTRIBUTE.ARM] = var_38_5 * (1 + var_38_10 / 1000) + var_38_11
	var_38_3[HeroConst.HERO_ATTRIBUTE.STA] = var_38_6 * (1 + var_38_12 / 1000) + var_38_13

	return var_38_3
end

function var_0_0.OnExit(arg_39_0)
	manager.windowBar:HideBar()
	arg_39_0:RemoveAllEventListener()
end

function var_0_0.OnHeroModify(arg_40_0, arg_40_1)
	if arg_40_1 == arg_40_0.heroInfo_.id then
		arg_40_0:UpdateView()
	end
end

function var_0_0.Dispose(arg_41_0)
	if arg_41_0.breakItems_ then
		for iter_41_0, iter_41_1 in pairs(arg_41_0.breakItems_) do
			iter_41_1:Dispose()
		end

		arg_41_0.breakItems_ = nil
	end

	if arg_41_0.items_ then
		for iter_41_2, iter_41_3 in pairs(arg_41_0.items_) do
			iter_41_3:Dispose()
		end

		arg_41_0.items_ = nil
	end

	if arg_41_0.tweens_ then
		arg_41_0.tweens_ = {}
	end

	arg_41_0:RemoveAllListeners()
	var_0_0.super.Dispose(arg_41_0)
end

return var_0_0
