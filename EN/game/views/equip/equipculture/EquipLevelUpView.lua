local var_0_0 = class("EquipLevelUpView", EquipBaseView)

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
	var_0_0.super.Init(arg_2_0)
end

function var_0_0.InitUI(arg_3_0)
	arg_3_0:BindCfgUI()

	arg_3_0.scrollHelper = LuaList.New(handler(arg_3_0, arg_3_0.indexItem), arg_3_0.listGo_, CommonItemView)
	arg_3_0.attrs = {}

	for iter_3_0 = 1, 2 do
		local var_3_0 = {}

		ComponentBinder.GetInstance():BindCfgUI(var_3_0, arg_3_0["property_" .. iter_3_0])
		table.insert(arg_3_0.attrs, var_3_0)
	end

	arg_3_0.maxAttrs = {}

	for iter_3_1 = 1, 2 do
		local var_3_1 = {}

		ComponentBinder.GetInstance():BindCfgUI(var_3_1, arg_3_0["maxAttr_" .. iter_3_1])
		table.insert(arg_3_0.maxAttrs, var_3_1)
	end

	arg_3_0.costIcon_.sprite = ItemTools.getItemLittleSprite(CurrencyConst.CURRENCY_TYPE_GOLD)
	arg_3_0.maxLvController_ = arg_3_0.transCon_:GetController("levelMax")
	arg_3_0.equipStrengthHandler_ = handler(arg_3_0, arg_3_0.OnEquipStrengthSuccess)
end

function var_0_0.AddUIListener(arg_4_0)
	arg_4_0:AddBtnListener(arg_4_0.btnAutoSelect_, nil, function()
		if arg_4_0.nextLv_ >= arg_4_0.equipMaxLv_ then
			return
		end

		local var_5_0 = EquipCfg[arg_4_0.equip_.prefab_id]
		local var_5_1 = EquipTools.CountNeedExp(arg_4_0.equip_, arg_4_0.equipMaxLv_, arg_4_0.equip_.now_break_level) - arg_4_0.equip_.exp
		local var_5_2 = {}

		table.insert(var_5_2, arg_4_0.equipId_)

		local var_5_3, var_5_4 = EquipTools.QuickSelectList(var_5_1, var_5_2)

		arg_4_0.usedMaterialList_ = var_5_3
		arg_4_0.usedEquipList_ = var_5_4

		arg_4_0:RefreshListSelect()
	end)
	arg_4_0:AddBtnListener(arg_4_0.btnLevelup_, nil, function()
		local var_6_0 = false

		for iter_6_0, iter_6_1 in pairs(arg_4_0.usedMaterialList_) do
			if iter_6_1 > 0 then
				var_6_0 = true
			end
		end

		if not var_6_0 and next(arg_4_0.usedEquipList_) == nil then
			ShowTips(GetTips("PLEASE_SELECT_ITEM"))

			return
		end

		if not checkGold(arg_4_0.cost_) then
			return
		end

		local var_6_1 = false

		for iter_6_2, iter_6_3 in pairs(arg_4_0.usedEquipList_) do
			if iter_6_3.equip_star >= 5 then
				var_6_1 = true

				break
			end
		end

		local var_6_2 = false
		local var_6_3 = EquipTools.CountNeedExp(arg_4_0.equip_, arg_4_0.equipMaxLv_, arg_4_0.equip_.now_break_level)
		local var_6_4 = EquipTools.CountAddExp(arg_4_0.usedMaterialList_, arg_4_0.usedEquipList_)
		local var_6_5 = arg_4_0.equip_.exp + var_6_4 - var_6_3
		local var_6_6 = MaterialTools.materialGiveBack(var_6_5, ItemConst.STR_ITEM.EQUIP)

		local function var_6_7(arg_7_0, arg_7_1)
			for iter_7_0, iter_7_1 in pairs(arg_7_1) do
				arg_7_0[#arg_7_0 + 1] = iter_7_1
			end
		end

		for iter_6_4, iter_6_5 in pairs(arg_4_0.usedEquipList_) do
			local var_6_8 = EquipData:GetEquipData(iter_6_4):GetBreakCostReturn()

			var_6_7(var_6_6, var_6_8)
		end

		local var_6_9 = formatRewardCfgList(var_6_6)
		local var_6_10 = mergeReward(var_6_9)
		local var_6_11 = sortReward(var_6_10)
		local var_6_12 = unformatRewardCfgList(var_6_11)

		if #var_6_12 > 0 then
			var_6_2 = true
		end

		local var_6_13 = ""

		if var_6_1 and var_6_2 then
			var_6_13 = string.format(GetTips("EQUIP_STRENGTH_EXP_OVERFLOW_AND_RARE"))
		elseif var_6_1 and not var_6_2 then
			var_6_13 = GetTips("EQUIP_STRENGTH_COST_RARE")
		elseif not var_6_1 and var_6_2 then
			var_6_13 = string.format(GetTips("EQUIP_STRENGTH_EXP_OVERFLOW"))
		else
			EquipAction.ApplyStrengthEquip(tonumber(arg_4_0.equipId_), arg_4_0.usedEquipList_, arg_4_0.usedMaterialList_, arg_4_0.cost_, var_6_5)

			return
		end

		if var_6_1 and not var_6_2 then
			ShowMessageBox({
				title = GetTips("PROMPT"),
				content = var_6_13,
				OkCallback = function()
					EquipAction.ApplyStrengthEquip(tonumber(arg_4_0.equipId_), arg_4_0.usedEquipList_, arg_4_0.usedMaterialList_, arg_4_0.cost_)
				end
			})

			return
		end

		JumpTools.OpenPageByJump("materialPreview", {
			content = var_6_13,
			OkCallback = function()
				EquipAction.ApplyStrengthEquip(tonumber(arg_4_0.equipId_), arg_4_0.usedEquipList_, arg_4_0.usedMaterialList_, arg_4_0.cost_, var_6_5)
			end,
			itemList = var_6_12
		})
	end)
	arg_4_0:AddBtnListener(arg_4_0.btnFilter_, nil, function()
		JumpTools.OpenPageByJump("commonFilterView", {
			filterGroup = Filter_Root_Define.Equip_Filter_List
		})
	end)
end

function var_0_0.OnEnter(arg_11_0)
	arg_11_0:OnEquipChange(arg_11_0.params_.equipId)
	arg_11_0:RegistEventListener(COMMON_FILTER_OK, handler(arg_11_0, arg_11_0.OnFilterChange))
	arg_11_0:RegistEventListener(CURRENCY_UPDATE, handler(arg_11_0, arg_11_0.OnGoldChange))
	manager.notify:RegistListener(EQUIP_STRENGTH_SUCCESS, arg_11_0.equipStrengthHandler_)
end

function var_0_0.OnEquipChange(arg_12_0, arg_12_1)
	arg_12_0.usedMaterialList_ = {}
	arg_12_0.usedEquipList_ = {}
	arg_12_0.equipId_ = arg_12_1
	arg_12_0.equip_ = EquipData:GetEquipData(arg_12_0.equipId_)
	arg_12_0.equipMaxLv_ = EquipTools.CountEquipMaxLv(arg_12_0.equip_)
	arg_12_0.equipLv_ = arg_12_0.equip_:GetLevel()

	if arg_12_0.equipLv_ == arg_12_0.equipMaxLv_ then
		arg_12_0.maxLvController_:SetSelectedState("max")
		arg_12_0:RefreshMax()
	else
		arg_12_0.maxLvController_:SetSelectedState("normal")
		arg_12_0:RefreshEquipStrength()
		arg_12_0:ChangeEquipSelectView(EquipConst.EQUIP_SORT.LEVEL, ItemConst.SORT_TYPE.UP)
	end

	arg_12_0:ChangeBar()
end

function var_0_0.OnTop(arg_13_0)
	arg_13_0:ChangeBar()
end

function var_0_0.ChangeBar(arg_14_0)
	local var_14_0 = {
		BACK_BAR,
		HOME_BAR,
		INFO_BAR
	}

	if arg_14_0.equipLv_ == arg_14_0.equipMaxLv_ then
		manager.windowBar:SwitchBar(var_14_0)
	else
		table.insert(var_14_0, CurrencyConst.CURRENCY_TYPE_GOLD)
		manager.windowBar:SwitchBar(var_14_0)
		manager.windowBar:SetBarCanAdd(CurrencyConst.CURRENCY_TYPE_GOLD, true)
	end
end

function var_0_0.RefreshMax(arg_15_0)
	arg_15_0.maxLv_.text = arg_15_0.equipMaxLv_

	local var_15_0 = EquipTools.CountEquipAttribute(arg_15_0.equip_)
	local var_15_1 = 1

	for iter_15_0, iter_15_1 in pairs(var_15_0) do
		local var_15_2 = PublicAttrCfg[iter_15_0]
		local var_15_3 = arg_15_0.maxAttrs[var_15_1]
		local var_15_4 = math.floor(iter_15_1)

		if var_15_2.percent and var_15_2.percent == 1 then
			var_15_4 = iter_15_1 / 10 .. "%"
		end

		var_15_3.name_.text = GetI18NText(var_15_2.name)
		var_15_3.icon_.sprite = getSprite("Atlas/SystemCommonAtlas", var_15_2.icon)
		var_15_3.num_.text = var_15_4
		var_15_1 = var_15_1 + 1
	end
end

function var_0_0.RefreshEquipStrength(arg_16_0)
	local var_16_0 = EquipTools.CountAddExp(arg_16_0.usedMaterialList_, arg_16_0.usedEquipList_)
	local var_16_1 = arg_16_0.equip_
	local var_16_2 = var_16_1.exp + var_16_0
	local var_16_3 = deepClone(var_16_1)

	var_16_3.exp = var_16_2

	arg_16_0:RefreshExp(var_16_0, var_16_2, var_16_1, var_16_3)
	arg_16_0:RefreshAttr(var_16_1, var_16_3)
	arg_16_0:RefreshCost()
end

function var_0_0.RefreshExp(arg_17_0, arg_17_1, arg_17_2, arg_17_3, arg_17_4)
	local var_17_0 = EquipTools.CountEquipLevel(arg_17_3)
	local var_17_1 = EquipTools.CountEquipLevel(arg_17_4)

	arg_17_0.nextLv_ = var_17_1
	arg_17_0.oldLv_.text = "" .. var_17_0
	arg_17_0.newLv_.text = "" .. var_17_1

	local var_17_2 = arg_17_0.equipMaxLv_

	SetActive(arg_17_0.btnAutoSelectGo_, var_17_0 < var_17_2)
	SetActive(arg_17_0.btnStrengthGo_, var_17_0 < var_17_2)
	SetActive(arg_17_0.btnAutoSelectNullGo_, var_17_0 == var_17_2)
	SetActive(arg_17_0.newLevelContent_, arg_17_1 ~= 0)

	arg_17_0.addExpText_.text = "+" .. arg_17_1

	local var_17_3 = EquipTools.CountNeedExp(arg_17_3, var_17_1, arg_17_3.now_break_level)
	local var_17_4 = arg_17_2 - var_17_3

	arg_17_0.cost_ = 0

	if var_17_2 <= var_17_1 then
		local var_17_5 = var_17_3 - arg_17_3.exp

		arg_17_0.cost_ = math.floor((var_17_5 < 0 and 0 or var_17_5) * GameSetting.equip_strengthen_gold_cost.value[1])
		arg_17_0.expNum_.text = "-/-"
		arg_17_0.expProg_.fillAmount = 0
		arg_17_0.newExpProg_.fillAmount = 1

		SetActive(arg_17_0.maxGo_, true)
	else
		arg_17_0.cost_ = math.floor(arg_17_1 * GameSetting.equip_strengthen_gold_cost.value[1])

		local var_17_6 = EquipExpCfg[var_17_1]["exp" .. arg_17_3.equipConfig.starlevel]

		arg_17_0.expNum_.text = var_17_4 .. "/" .. var_17_6

		if var_17_1 == var_17_0 then
			arg_17_0.expProg_.fillAmount = (var_17_4 - arg_17_1) / var_17_6
		else
			arg_17_0.expProg_.fillAmount = 0
		end

		arg_17_0.newExpProg_.fillAmount = var_17_4 / var_17_6

		SetActive(arg_17_0.maxGo_, false)
	end
end

function var_0_0.RefreshAttr(arg_18_0, arg_18_1, arg_18_2)
	local var_18_0 = EquipTools.CountEquipAttribute(arg_18_1)
	local var_18_1 = EquipTools.CountEquipAttribute(arg_18_2)
	local var_18_2 = 1

	for iter_18_0, iter_18_1 in pairs(var_18_0) do
		local var_18_3 = PublicAttrCfg[iter_18_0]
		local var_18_4 = arg_18_0.attrs[var_18_2]

		if not var_18_4 then
			break
		end

		local var_18_5 = math.floor(iter_18_1)
		local var_18_6 = math.floor(var_18_1[iter_18_0])

		if var_18_3.percent and var_18_3.percent == 1 then
			var_18_5 = iter_18_1 / 10 .. "%"
			var_18_6 = var_18_1[iter_18_0] / 10 .. "%"
		end

		var_18_4.name_.text = GetI18NText(var_18_3.name)
		var_18_4.icon_.sprite = getSprite("Atlas/SystemCommonAtlas", var_18_3.icon)
		var_18_4.oldVal_.text = var_18_5

		if iter_18_1 ~= var_18_1[iter_18_0] then
			var_18_4.newVal_.text = string.format("<color='#E28000'>%s</color>", var_18_6)
			var_18_4.arrow_.color = Color.New(0.8941176, 0.5058823, 0, 1)
		else
			var_18_4.newVal_.text = string.format("<color='#3D4045'>%s</color>", var_18_6)
			var_18_4.arrow_.color = Color.New(0.2392156, 0.2509803, 0.2705882, 1)
		end

		var_18_2 = var_18_2 + 1
	end
end

function var_0_0.RefreshCost(arg_19_0)
	local var_19_0 = ItemTools.getItemNum(CurrencyConst.CURRENCY_TYPE_GOLD)
	local var_19_1 = tostring(arg_19_0.cost_)

	if var_19_0 < arg_19_0.cost_ then
		var_19_1 = "<color='#FF0000'>" .. var_19_1 .. "</color>"
	end

	arg_19_0.costNum_.text = var_19_1
end

function var_0_0.ChangeEquipSelectView(arg_20_0, arg_20_1, arg_20_2)
	arg_20_0.priority_ = arg_20_1
	arg_20_0.order_ = arg_20_2
	arg_20_0.itemList = arg_20_0:GetItemList()

	arg_20_0:RefreshList()
end

function var_0_0.RefreshList(arg_21_0)
	local var_21_0 = #arg_21_0.itemList

	arg_21_0.scrollHelper:StartScroll(var_21_0)
end

function var_0_0.RefreshListSelect(arg_22_0)
	for iter_22_0, iter_22_1 in pairs(arg_22_0.scrollHelper:GetItemList()) do
		local var_22_0 = iter_22_1:GetData()

		if var_22_0.type == ItemConst.ITEM_TYPE.MATERIAL then
			local var_22_1 = arg_22_0.usedMaterialList_[var_22_0.id] or 0

			iter_22_1:RefreshTopAmount(var_22_1)
		elseif var_22_0.type == ItemConst.ITEM_TYPE.EQUIP then
			iter_22_1:RefreshSelectState(arg_22_0.usedEquipList_[var_22_0.equip_id] and true or false)
		end
	end

	arg_22_0:RefreshEquipStrength()
end

function var_0_0.indexItem(arg_23_0, arg_23_1, arg_23_2)
	local var_23_0 = arg_23_0.itemList[arg_23_1]
	local var_23_1 = clone(ItemTemplateData)

	if var_23_0.type == ItemConst.ITEM_TYPE.EQUIP then
		var_23_1.equip_info = var_23_0
		var_23_1.id = var_23_0.prefab_id
		var_23_1.equip_id = var_23_0.equip_id
		var_23_1.equip_star = getItemStar(var_23_0.prefab_id)
		var_23_1.equipLevel = EquipTools.CountEquipLevel(var_23_0)
		var_23_1.isEquiped = false
		var_23_1.equipedLocked = var_23_0.is_lock
		var_23_1.type = var_23_0.type

		function var_23_1.clickFun(arg_24_0)
			arg_23_0:EquipClickFunc(arg_23_2, arg_24_0)
		end

		var_23_1.selectStyle = arg_23_0.usedEquipList_[var_23_0.equip_id] ~= nil
	elseif var_23_0.type == ItemConst.ITEM_TYPE.MATERIAL then
		var_23_1.id = var_23_0.id
		var_23_1.number = var_23_0.number
		var_23_1.type = var_23_0.type

		function var_23_1.longClickFun(arg_25_0)
			return arg_23_0:MaterialLongClickFunc(arg_23_2, arg_25_0)
		end

		function var_23_1.clickAmountFun(arg_26_0)
			return arg_23_0:MaterialAmountClickFunc(arg_23_2, arg_26_0)
		end

		if arg_23_0.usedMaterialList_[var_23_0.id] and arg_23_0.usedMaterialList_[var_23_0.id] ~= 0 then
			var_23_1.topAmountValue = arg_23_0.usedMaterialList_[var_23_0.id]
		end
	end

	arg_23_2:SetData(var_23_1)
end

function var_0_0.EquipClickFunc(arg_27_0, arg_27_1, arg_27_2)
	local var_27_0 = arg_27_2.equip_id

	if arg_27_0.usedEquipList_[var_27_0] then
		arg_27_0.usedEquipList_[var_27_0] = nil
		arg_27_0.handler_.equipCommonItem_ = arg_27_1

		arg_27_0.handler_:HidePop()
	else
		local var_27_1 = arg_27_2.equip_id

		if arg_27_0.nextLv_ >= arg_27_0.equipMaxLv_ then
			ShowTips("ERROR_USER_MAX_LV")

			return
		end

		if arg_27_2.equipedLocked then
			ShowTips("REMOVE_LOCK")
			arg_27_0:ShowEquipInfo(var_27_1, arg_27_1)

			return
		end

		arg_27_0:ShowEquipInfo(var_27_1, arg_27_1)
		arg_27_1:RefreshSelectState(true)

		arg_27_0.usedEquipList_[var_27_1] = arg_27_2
	end

	arg_27_0:RefreshEquipStrength()
end

function var_0_0.MaterialLongClickFunc(arg_28_0, arg_28_1, arg_28_2)
	if arg_28_0.nextLv_ >= arg_28_0.equipMaxLv_ then
		ShowTips("ERROR_USER_MAX_LV")

		return false
	end

	arg_28_0.usedMaterialList_[arg_28_2.id] = arg_28_0.usedMaterialList_[arg_28_2.id] or 0

	if arg_28_0.usedMaterialList_[arg_28_2.id] >= arg_28_2.number then
		return false
	end

	arg_28_0.usedMaterialList_[arg_28_2.id] = arg_28_0.usedMaterialList_[arg_28_2.id] + 1

	arg_28_1:RefreshTopAmount(arg_28_0.usedMaterialList_[arg_28_2.id])
	arg_28_0:RefreshEquipStrength()
	manager.audio:PlayUIAudio(2)

	return true
end

function var_0_0.MaterialAmountClickFunc(arg_29_0, arg_29_1, arg_29_2)
	arg_29_0.usedMaterialList_[arg_29_2.id] = arg_29_0.usedMaterialList_[arg_29_2.id] or 0

	if arg_29_0.usedMaterialList_[arg_29_2.id] <= 0 then
		return false
	end

	arg_29_0.usedMaterialList_[arg_29_2.id] = arg_29_0.usedMaterialList_[arg_29_2.id] - 1

	arg_29_1:RefreshTopAmount(arg_29_0.usedMaterialList_[arg_29_2.id])
	arg_29_0:RefreshEquipStrength()
	manager.audio:PlayUIAudio(2)

	return true
end

function var_0_0.GetEquip(arg_30_0)
	return EquipData:GetEquipData(arg_30_0.equipId_)
end

function var_0_0.GetItemList(arg_31_0)
	return EquipTools.GetEquipLevelUpMaterial(arg_31_0.order_, arg_31_0.priority_, {
		arg_31_0.equipId_
	})
end

function var_0_0.ShowEquipInfo(arg_32_0, arg_32_1, arg_32_2)
	local var_32_0 = EquipData:GetEquipData(arg_32_1)

	local function var_32_1(arg_33_0)
		if arg_33_0 then
			arg_32_2:RefreshSelectState(false)

			arg_32_0.usedEquipList_[arg_32_1] = nil

			arg_32_0:RefreshEquipStrength()
		end

		arg_32_2:RefreshLock(arg_33_0)
	end

	arg_32_0.handler_:RefreshEquipInfo(var_32_0, arg_32_2, var_32_1)
end

function var_0_0.OnEquipStrengthSuccess(arg_34_0, arg_34_1, arg_34_2, arg_34_3)
	if arg_34_1 then
		arg_34_0.handler_:RefreshSideBar(arg_34_0.equipId_)
	end

	if arg_34_2 then
		JumpTools.OpenPageByJump("equipCulturePopView", arg_34_3)
	end

	arg_34_0.handler_:HidePop()

	arg_34_0.usedMaterialList_ = {}
	arg_34_0.usedEquipList_ = {}
	arg_34_0.itemList = arg_34_0:GetItemList()

	arg_34_0:RefreshListSelect()
	arg_34_0:RefreshList()
end

function var_0_0.OnGoldChange(arg_35_0, arg_35_1)
	if arg_35_1 == CurrencyConst.CURRENCY_TYPE_GOLD then
		arg_35_0:RefreshEquipStrength()
	end
end

function var_0_0.OnExit(arg_36_0)
	CommonFilterData:ClearFilter(Filter_Root_Define.Equip_Filter_List.filter_id)
	arg_36_0:RemoveAllEventListener()
	manager.windowBar:HideBar()
end

function var_0_0.Hide(arg_37_0)
	CommonFilterData:ClearFilter(Filter_Root_Define.Equip_Filter_List.filter_id)
	SetActive(arg_37_0.gameObject_, false)
	arg_37_0:RemoveAllEventListener()
	manager.notify:RemoveListener(EQUIP_STRENGTH_SUCCESS, arg_37_0.equipStrengthHandler_)
end

function var_0_0.OnFilterChange(arg_38_0)
	local var_38_0 = CommonFilterData:HasIndexFlag(2, 4, 13)
	local var_38_1 = CommonFilterData:HasIndexFlag(2, 4, 14)
	local var_38_2 = CommonFilterData:HasIndexFlag(2, 5, 15)
	local var_38_3 = CommonFilterData:HasIndexFlag(2, 5, 16)
	local var_38_4 = var_38_1 and EquipConst.EQUIP_SORT.RARE or EquipConst.EQUIP_SORT.LEVEL
	local var_38_5 = var_38_3 and 0 or 1

	arg_38_0:ChangeEquipSelectView(var_38_4, var_38_5)
end

function var_0_0.Dispose(arg_39_0)
	arg_39_0:RemoveAllListeners()

	if arg_39_0.scrollHelper then
		arg_39_0.scrollHelper:Dispose()

		arg_39_0.scrollHelper = nil
	end

	var_0_0.super.Dispose(arg_39_0)
end

return var_0_0
