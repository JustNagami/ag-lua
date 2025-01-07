local var_0_0 = class("EquipUpgradeView", EquipBaseView)

function var_0_0.OnCtor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	arg_1_0.handler_ = arg_1_1
	arg_1_0.gameObject_ = arg_1_2
	arg_1_0.transform_ = arg_1_2.transform
	arg_1_0.params_ = arg_1_3

	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	arg_2_0:InitUI()
	arg_2_0:AddUIListener()
	arg_2_0.super.Init(arg_2_0)
end

function var_0_0.InitUI(arg_3_0)
	arg_3_0:BindCfgUI()

	arg_3_0.attrs = {}

	for iter_3_0 = 1, 2 do
		local var_3_0 = {}

		ComponentBinder.GetInstance():BindCfgUI(var_3_0, arg_3_0["property_" .. iter_3_0])
		table.insert(arg_3_0.attrs, var_3_0)
	end

	arg_3_0.costScroller_ = LuaList.New(handler(arg_3_0, arg_3_0.indexItem), arg_3_0.costListGo_, CommonItemView)
	arg_3_0.costIcon_.sprite = ItemTools.getItemLittleSprite(CurrencyConst.CURRENCY_TYPE_GOLD)
	arg_3_0.conditionController_ = arg_3_0.transCon_:GetController("condition")
	arg_3_0.clearController_ = arg_3_0.conditionCon_:GetController("clear")
	arg_3_0.btnStateController_ = arg_3_0.transCon_:GetController("btnState")
end

function var_0_0.AddUIListener(arg_4_0)
	arg_4_0:AddBtnListener(arg_4_0.upgradeBtn_, nil, function()
		EquipAction.ApplyUpgradeEquip(tonumber(arg_4_0.equipId))
	end)
	arg_4_0:AddBtnListener(arg_4_0.noBtn_, nil, function()
		if arg_4_0.showTips_ then
			ShowTips(GetTips("EQUIP_BREAK_LIMITED"))
		else
			EquipAction.ApplyUpgradeEquip(tonumber(arg_4_0.equipId))
		end
	end)
end

function var_0_0.OnEnter(arg_7_0)
	arg_7_0:OnEquipChange(arg_7_0.params_.equipId)
end

function var_0_0.OnTop(arg_8_0)
	arg_8_0:ChangeBar()
	arg_8_0:RefreshEquipUpCost()
	arg_8_0:RefreshEquipUpLimit()

	local var_8_0 = arg_8_0.isLack_ or arg_8_0.showTips_

	arg_8_0.btnStateController_:SetSelectedIndex(var_8_0 and 1 or 0)
end

function var_0_0.ChangeBar(arg_9_0)
	local var_9_0 = {
		BACK_BAR,
		HOME_BAR,
		INFO_BAR,
		CurrencyConst.CURRENCY_TYPE_GOLD
	}

	manager.windowBar:SwitchBar(var_9_0)
	manager.windowBar:SetBarCanAdd(CurrencyConst.CURRENCY_TYPE_GOLD, true)
end

function var_0_0.OnEquipChange(arg_10_0, arg_10_1)
	arg_10_0.equipId = arg_10_1
	arg_10_0.equip = EquipData:GetEquipData(arg_10_0.equipId)

	local var_10_0 = EquipCfg[arg_10_0.equip.prefab_id]

	if arg_10_0.equip:GetLevel() >= var_10_0.max_level[var_10_0.break_times_max + 1] then
		arg_10_0.handler_:RefreshSideBar(arg_10_0.equipId)

		return
	end

	arg_10_0:RefreshEquipUpgrade()
	arg_10_0:ChangeBar()
end

function var_0_0.RefreshEquipUpgrade(arg_11_0)
	arg_11_0:RefreshEquipUpInfo()
	arg_11_0:RefreshEquipUpCost()
	arg_11_0:RefreshEquipUpLimit()

	local var_11_0 = arg_11_0.isLack_ or arg_11_0.showTips_

	arg_11_0.btnStateController_:SetSelectedIndex(var_11_0 and 1 or 0)
end

function var_0_0.RefreshEquipUpInfo(arg_12_0)
	local var_12_0 = EquipCfg[arg_12_0.equip.prefab_id]
	local var_12_1 = arg_12_0.equip.now_break_level

	arg_12_0.oldLv_.text = var_12_0.max_level[var_12_1 + 1]
	arg_12_0.newLv_.text = var_12_0.max_level[var_12_1 + 2]

	for iter_12_0 = 1, 2 do
		local var_12_2 = var_12_0.fixed_attributes[var_12_1 + 1]
		local var_12_3 = PublicAttrCfg[var_12_2[iter_12_0][1]]
		local var_12_4 = arg_12_0.attrs[iter_12_0]

		var_12_4.icon_.sprite = getSprite("Atlas/SystemCommonAtlas", var_12_3.icon)
		var_12_4.name_.text = string.format(GetTips("EQUIP_UPGRADE_ATTR_DES"), GetI18NText(var_12_3.name))
		var_12_4.oldVal_.text = var_12_2[iter_12_0][3]
		var_12_4.newVal_.text = var_12_0.fixed_attributes[var_12_1 + 2][iter_12_0][3]
	end
end

function var_0_0.RefreshEquipUpCost(arg_13_0)
	local var_13_0 = arg_13_0.equip:GetUpgradeCost()

	if not var_13_0 then
		return
	end

	arg_13_0.isLack_ = false
	arg_13_0.moneyCost_ = var_13_0.money

	local var_13_1 = ItemTools.getItemNum(CurrencyConst.CURRENCY_TYPE_GOLD)
	local var_13_2 = tostring(arg_13_0.moneyCost_)

	if var_13_1 < var_13_0.money then
		arg_13_0.isLack_ = true
		var_13_2 = "<color='#EB0000'>" .. var_13_2 .. "</color>"
	end

	arg_13_0.costNum_.text = var_13_2

	for iter_13_0, iter_13_1 in ipairs(var_13_0.item_list) do
		if ItemTools.getItemNum(iter_13_1[1]) < iter_13_1[2] then
			arg_13_0.isLack_ = true

			break
		end
	end

	arg_13_0.costMaterialList_ = var_13_0.item_list

	local var_13_3 = #arg_13_0.costMaterialList_

	arg_13_0.costScroller_:StartScroll(var_13_3)
end

function var_0_0.indexItem(arg_14_0, arg_14_1, arg_14_2)
	local var_14_0 = clone(ItemTemplateData)
	local var_14_1 = arg_14_0.costMaterialList_[arg_14_1]

	var_14_0.id = var_14_1[1]

	local var_14_2 = ItemTools.getItemNum(var_14_1[1])

	function var_14_0.clickFun(arg_15_0)
		ShowPopItem(POP_SOURCE_ITEM, {
			arg_15_0.id,
			arg_15_0.number
		})
	end

	var_14_0.bottomText = {
		var_14_2,
		var_14_1[2]
	}
	var_14_0.hideBottomRightTextFlag = true

	arg_14_2:SetData(var_14_0)
end

function var_0_0.RefreshEquipUpLimit(arg_16_0)
	local var_16_0 = EquipCfg[arg_16_0.equip.prefab_id]
	local var_16_1 = arg_16_0.equip.now_break_level
	local var_16_2 = var_16_0.max_level[var_16_1 + 2]
	local var_16_3 = var_16_0.hero_slot_open_level[1]

	if var_16_3 and var_16_2 == var_16_3 then
		arg_16_0.conditionController_:SetSelectedState("show")

		arg_16_0.conditionDesc_.text = GetTips("EQUIP_BREAK_LIMITED")

		if arg_16_0.equip.race ~= 0 and table.keyof(RaceEffectCfg.all, arg_16_0.equip.race) == nil then
			arg_16_0.showTips_ = false

			arg_16_0.clearController_:SetSelectedState("clear")
		else
			arg_16_0.showTips_ = true

			arg_16_0.clearController_:SetSelectedState("notclear")
		end
	else
		arg_16_0.showTips_ = false

		arg_16_0.conditionController_:SetSelectedState("hide")
	end
end

function var_0_0.OnExit(arg_17_0)
	arg_17_0:RemoveAllEventListener()
	manager.windowBar:HideBar()
end

function var_0_0.Dispose(arg_18_0)
	arg_18_0:RemoveAllListeners()

	if arg_18_0.costScroller_ then
		arg_18_0.costScroller_:Dispose()

		arg_18_0.costScroller_ = nil
	end

	var_0_0.super.Dispose(arg_18_0)
end

return var_0_0
