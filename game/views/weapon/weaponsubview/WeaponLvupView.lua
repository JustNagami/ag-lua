local var_0_0 = class("WeaponLvupView", ReduxView)

function var_0_0.OnCtor(arg_1_0, arg_1_1)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_0.gameObject_.transform

	arg_1_0:BindCfgUI()
	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	arg_2_0:buildController()
	arg_2_0:buildContext()

	arg_2_0.scrollHelper_ = LuaList.New(handler(arg_2_0, arg_2_0.RenderItem), arg_2_0.itemList_, CommonItemView)

	arg_2_0:AddUIListener()
end

function var_0_0.OnEnter(arg_3_0)
	arg_3_0:RegistEventListener(COMMON_FILTER_OK, handler(arg_3_0, arg_3_0.OnFilterChange))
	arg_3_0:RegistEventListener(WEAPON_STR, function(arg_4_0, arg_4_1)
		arg_3_0:OnWeaponUpgrade(arg_4_0, arg_4_1)
	end)
end

function var_0_0.OnExit(arg_5_0)
	CommonFilterData:ClearFilter(Filter_Root_Define.Weapon_LevelUp_Cost_List.filter_id)
	arg_5_0:RemoveAllEventListener()
end

function var_0_0.buildController(arg_6_0)
	arg_6_0.controller_ = {
		comps = arg_6_0.gameObject_:GetComponent("ControllerExCollection"),
		state = {
			levelMax = {
				Max = "max",
				name = "levelMax",
				Normal = "normal"
			}
		}
	}
	arg_6_0.addStatusController = arg_6_0.controller_.comps:GetController("addStatus")
end

function var_0_0.SwitchControllerState(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = arg_7_0.controller_.comps:GetController(arg_7_1)

	if var_7_0 then
		var_7_0:SetSelectedState(arg_7_2)
	end
end

function var_0_0.buildContext(arg_8_0, arg_8_1)
	arg_8_1 = arg_8_1 or HeroConst.HERO_DATA_TYPE.DEFAULT
	arg_8_0.context = {
		totalCount = 0,
		materialCount = 0,
		totalSelect = 0,
		heroId = 0,
		servantCount = 0,
		materialList = {},
		servantList = {},
		weaponInfo = {},
		type = arg_8_1,
		dataPorxy = HeroViewDataProxy.New(arg_8_1)
	}
	arg_8_0.constVar = {
		yellow = "363A42",
		sliderBarWidth = 501,
		red = "CD421E"
	}
end

function var_0_0.AddUIListener(arg_9_0)
	arg_9_0:AddBtnListener(arg_9_0.quickSelectBtn_, nil, function()
		arg_9_0:QuickSelectBtnClick()
	end)
	arg_9_0:AddBtnListener(arg_9_0.upgradeBtn_, nil, function()
		arg_9_0:OnUpgradeBtnClick()
	end)
	arg_9_0:AddBtnListener(arg_9_0.filterBtn_, nil, function()
		arg_9_0:OnFilterBtnClick()
	end)
end

function var_0_0.ShowWeaponInfoLocal(arg_13_0)
	arg_13_0:UpdateWeaponInfo()
	arg_13_0:ShowWeaponInfo(arg_13_0.context.heroId, arg_13_0.context.weaponInfo)
end

function var_0_0.ShowWeaponInfo(arg_14_0, arg_14_1, arg_14_2, arg_14_3)
	arg_14_0:buildContext(arg_14_3)

	arg_14_0.context.weaponInfo = arg_14_2
	arg_14_0.context.heroId = arg_14_1

	arg_14_0:RenderView()

	if not arg_14_0:CheckWeaponIsMaxLevel() then
		arg_14_0:RefreshMaterialList()
		arg_14_0.scrollHelper_:StartScroll(arg_14_0.context.totalCount, 0)
	end
end

function var_0_0.RenderView(arg_15_0)
	if not arg_15_0:CheckWeaponIsMaxLevel() then
		arg_15_0:SwitchControllerState(arg_15_0.controller_.state.levelMax.name, arg_15_0.controller_.state.levelMax.Normal)
		arg_15_0:RenderNormalView()
	else
		arg_15_0:SwitchControllerState(arg_15_0.controller_.state.levelMax.name, arg_15_0.controller_.state.levelMax.Max)
		arg_15_0:RenderMaxView()
	end
end

function var_0_0.RenderNormalView(arg_16_0)
	local var_16_0 = arg_16_0.context.weaponInfo
	local var_16_1 = var_16_0.breakthrough
	local var_16_2 = WeaponTools.WeaponAtk(var_16_0.level, var_16_1)
	local var_16_3, var_16_4, var_16_5, var_16_6 = WeaponTools.AddWeaponExp(var_16_0.exp, var_16_1, arg_16_0.context.totalSelect)
	local var_16_7 = GameLevelSetting[var_16_4].weapon_level_exp
	local var_16_8 = WeaponTools.WeaponAtk(var_16_4, var_16_1)

	arg_16_0.originatkText_.text = string.format("%d", var_16_2)
	arg_16_0.originatk2Text_.text = string.format("%d", var_16_2)
	arg_16_0.afteratkText_.text = string.format("%d", var_16_8)

	if var_16_8 ~= var_16_2 then
		arg_16_0.atkArrowImg_.color = Color.New(1, 0.4431373, 0, 1)
	else
		arg_16_0.atkArrowImg_.color = Color.New(0.2117647, 0.227451, 0.2588235, 1)
	end

	local var_16_9 = var_16_3 / var_16_7 * arg_16_0.constVar.sliderBarWidth
	local var_16_10, var_16_11, var_16_12 = WeaponTools.AddWeaponExp(var_16_0.exp, var_16_0.breakthrough, 0)
	local var_16_13 = var_16_10 / GameLevelSetting[var_16_0.level].weapon_level_exp * arg_16_0.constVar.sliderBarWidth

	if var_16_4 > var_16_0.level then
		arg_16_0.realExpTrans_:SetSizeWithCurrentAnchors(RectTransform.Axis.Horizontal, 0)
		arg_16_0.fakeExpTrans_:SetSizeWithCurrentAnchors(RectTransform.Axis.Horizontal, var_16_9)
	else
		arg_16_0.realExpTrans_:SetSizeWithCurrentAnchors(RectTransform.Axis.Horizontal, var_16_13)
		arg_16_0.fakeExpTrans_:SetSizeWithCurrentAnchors(RectTransform.Axis.Horizontal, var_16_9)
	end

	arg_16_0.afterlvText_.text = var_16_4

	if var_16_4 >= HeroConst.WEAPON_LV_MAX then
		arg_16_0.exptextText_.text = "-/-"
	else
		arg_16_0.exptextText_.text = var_16_3 .. "/" .. var_16_7
	end

	arg_16_0.totalexpText_.text = "+" .. arg_16_0.context.totalSelect
	arg_16_0.originlvText_.text = var_16_0.level

	if arg_16_0.context.totalSelect == 0 and var_16_0.level == var_16_4 then
		arg_16_0.addStatusController:SetSelectedState("normal")
	else
		SetActive(arg_16_0.showMax_, var_16_6)
		arg_16_0.addStatusController:SetSelectedState("add")
	end

	arg_16_0:RenderCost()
end

function var_0_0.RenderMaxView(arg_17_0)
	local var_17_0 = arg_17_0.context.heroId
	local var_17_1 = arg_17_0.context.weaponInfo
	local var_17_2 = var_17_1.breakthrough
	local var_17_3 = WeaponTools.WeaponAtk(var_17_1.level, var_17_2)
	local var_17_4 = HeroCfg[var_17_0].weapon_break_attribute[var_17_1.breakthrough]
	local var_17_5, var_17_6 = SkillTools.GetAttr(var_17_4)

	arg_17_0.maxLevelTxt_.text = HeroConst.WEAPON_LV_MAX
	arg_17_0.maxAttackNumTxt_.text = math.floor(var_17_3)
	arg_17_0.maxSubNameTxt_.text = var_17_5
	arg_17_0.maxSubNumTxt_.text = var_17_6
end

function var_0_0.RenderItem(arg_18_0, arg_18_1, arg_18_2)
	local var_18_0 = 1

	if arg_18_1 > arg_18_0.context.materialCount then
		var_18_0 = 2
		arg_18_1 = arg_18_1 - arg_18_0.context.materialCount
	end

	local var_18_1

	if var_18_0 == 1 then
		var_18_1 = arg_18_0.context.materialList[arg_18_1]
	elseif var_18_0 == 2 then
		var_18_1 = arg_18_0.context.servantList[arg_18_1]
	end

	var_18_1.index = arg_18_1

	if var_18_1.type == ItemConst.ITEM_TYPE.MATERIAL then
		function var_18_1.longClickFun(arg_19_0)
			local var_19_0 = arg_18_0:OnMaterialLongPress(var_18_1, arg_18_2)

			arg_18_0:RenderView(true)

			return var_19_0
		end
	elseif var_18_1.type == ItemConst.ITEM_TYPE.WEAPON_SERVANT then
		function var_18_1.clickFun(arg_20_0)
			arg_18_0:OnServantClick(var_18_1, arg_18_2)
			arg_18_0:RenderView(true)
		end
	end

	function var_18_1.clickAmountFun(arg_21_0)
		local var_21_0 = arg_18_0:OnMaterialCutClick(var_18_1, arg_18_2)

		arg_18_0:RenderView(true)

		return var_21_0
	end

	arg_18_2:SetData(var_18_1)
	arg_18_2:RefreshGray(var_18_1.topAmountValue and var_18_1.topAmountValue > 0)

	arg_18_2.infoProxy = var_18_1
end

function var_0_0.RenderCost(arg_22_0)
	local var_22_0 = ItemTools.getItemNum(CurrencyConst.CURRENCY_TYPE_GOLD)
	local var_22_1 = arg_22_0.context.totalSelect * GameSetting.weapon_strengthen_gold_cost.value[1]
	local var_22_2 = setTextColor(arg_22_0.constVar.yellow, arg_22_0.constVar.red, var_22_1, var_22_0)

	arg_22_0.tokenTxt_.text = var_22_2
end

function var_0_0.OnGoldChange(arg_23_0)
	arg_23_0:RenderCost()
	arg_23_0:RenderView()
end

function var_0_0.OnWeaponUpgrade(arg_24_0, arg_24_1, arg_24_2)
	local var_24_0 = arg_24_0.context.weaponInfo
	local var_24_1, var_24_2, var_24_3 = WeaponTools.AddWeaponExp(var_24_0.exp, var_24_0.breakthrough, arg_24_0.context.totalSelect)
	local var_24_4 = var_24_0.level
	local var_24_5 = var_24_2

	if var_24_4 == var_24_5 then
		ShowTips("SUCCESS_STRENGTHEN")
		arg_24_0:ShowWeaponInfoLocal()

		return
	end

	arg_24_0:ShowWeaponInfoLocal()

	local var_24_6 = arg_24_0.context.weaponInfo

	JumpTools.OpenPageByJump("weaponStr", {
		oriLv = var_24_4,
		afterLv = var_24_5,
		breakthrough = var_24_6.breakthrough,
		callback = function()
			local var_25_0 = MaterialTools.materialGiveBack(var_24_3, ItemConst.STR_ITEM.WEAPON)

			getReward(formatRewardCfgList(var_25_0))
		end
	})
end

function var_0_0.OnMaterialLongPress(arg_26_0, arg_26_1, arg_26_2)
	local var_26_0 = arg_26_0.context.weaponInfo
	local var_26_1 = var_26_0.breakthrough
	local var_26_2, var_26_3, var_26_4, var_26_5 = WeaponTools.AddWeaponExp(var_26_0.exp, var_26_1, arg_26_0.context.totalSelect)

	if var_26_5 then
		ShowTips("LEVEL_MAX")

		return false
	end

	if arg_26_1.number > arg_26_1.topAmountValue then
		arg_26_1.topAmountValue = arg_26_1.topAmountValue + 1
		arg_26_0.context.totalSelect = arg_26_0.context.totalSelect + ItemCfg[arg_26_1.id].param[1]

		manager.audio:PlayUIAudio(2)
		arg_26_2:RefreshTopAmount(arg_26_1.topAmountValue)

		return true
	else
		return false
	end
end

function var_0_0.OnServantClick(arg_27_0, arg_27_1, arg_27_2)
	local var_27_0 = arg_27_0.context.weaponInfo
	local var_27_1 = var_27_0.breakthrough
	local var_27_2 = ItemCfg[arg_27_1.id].rare
	local var_27_3 = GameSetting.base_exp_weapon_servant.value[var_27_2]
	local var_27_4, var_27_5, var_27_6, var_27_7 = WeaponTools.AddWeaponExp(var_27_0.exp, var_27_1, arg_27_0.context.totalSelect)

	if arg_27_1.topAmountValue == 1 then
		arg_27_1.topAmountValue = 0
		arg_27_0.context.totalSelect = arg_27_0.context.totalSelect - var_27_3
	elseif arg_27_1.topAmountValue == 0 then
		if var_27_7 then
			ShowTips("LEVEL_MAX")

			return false
		end

		arg_27_1.topAmountValue = 1
		arg_27_0.context.totalSelect = arg_27_0.context.totalSelect + var_27_3
	end

	arg_27_2:RefreshTopAmount(arg_27_1.topAmountValue)
end

function var_0_0.OnMaterialCutClick(arg_28_0, arg_28_1, arg_28_2)
	if arg_28_1.type == ItemConst.ITEM_TYPE.MATERIAL then
		if arg_28_1.topAmountValue >= 1 then
			arg_28_1.topAmountValue = arg_28_1.topAmountValue - 1
			arg_28_0.context.totalSelect = arg_28_0.context.totalSelect - ItemCfg[arg_28_1.id].param[1]

			arg_28_2:RefreshTopAmount(arg_28_1.topAmountValue)
			manager.audio:PlayUIAudio(2)

			return true
		end
	elseif arg_28_1.type == ItemConst.ITEM_TYPE.WEAPON_SERVANT then
		local var_28_0 = ItemCfg[arg_28_1.id].rare
		local var_28_1 = GameSetting.base_exp_weapon_servant.value[var_28_0]

		arg_28_1.topAmountValue = math.max(arg_28_1.topAmountValue - 1, 0)
		arg_28_0.context.totalSelect = arg_28_0.context.totalSelect - var_28_1

		arg_28_2:RefreshTopAmount(arg_28_1.topAmountValue)
	end

	return false
end

function var_0_0.QuickSelectBtnClick(arg_29_0)
	local var_29_0 = arg_29_0.context.weaponInfo
	local var_29_1 = WeaponTools.CurMaxExp(var_29_0.breakthrough) - var_29_0.exp

	arg_29_0.context.totalSelect = arg_29_0:QuickSelectList(arg_29_0.context.materialList, arg_29_0.context.servantList, var_29_1)

	local var_29_2 = arg_29_0.scrollHelper_:GetItemList()

	for iter_29_0, iter_29_1 in pairs(var_29_2) do
		iter_29_1:RefreshTopAmount(iter_29_1.infoProxy.topAmountValue)
	end

	arg_29_0:RenderView()
end

function var_0_0.OnUpgradeBtnClick(arg_30_0)
	if arg_30_0.context.totalSelect == 0 then
		ShowTips("PLEASE_SELECT_ITEM")

		return
	end

	local var_30_0 = arg_30_0.context.weaponInfo
	local var_30_1, var_30_2, var_30_3 = WeaponTools.AddWeaponExp(var_30_0.exp, var_30_0.breakthrough, arg_30_0.context.totalSelect)
	local var_30_4 = (arg_30_0.context.totalSelect - var_30_3) * GameSetting.weapon_strengthen_gold_cost.value[1]

	if not checkGold(var_30_4, true) then
		return
	end

	local var_30_5 = false
	local var_30_6 = arg_30_0.context.heroId
	local var_30_7 = {}

	for iter_30_0, iter_30_1 in pairs(arg_30_0.context.materialList) do
		if iter_30_1.topAmountValue ~= 0 then
			table.insert(var_30_7, {
				id = iter_30_1.id,
				num = iter_30_1.topAmountValue
			})
		end
	end

	local var_30_8 = {}

	for iter_30_2, iter_30_3 in pairs(arg_30_0.context.servantList) do
		if iter_30_3.topAmountValue ~= 0 then
			if ItemCfg[iter_30_3.id].rare == 5 then
				var_30_5 = true
			end

			table.insert(var_30_8, iter_30_3.uid)
		end
	end

	local var_30_9
	local var_30_10 = MaterialTools.materialGiveBack(var_30_3, ItemConst.STR_ITEM.WEAPON)

	if #var_30_10 > 0 then
		if var_30_5 then
			var_30_9 = string.format(GetTips("WEAPON_STRENGTH_EXP_OVERFLOW_AND_RARE"))
		else
			var_30_9 = string.format(GetTips("WEAPON_STRENGTH_EXP_OVERFLOW"))
		end

		arg_30_0:Go("materialPreview", {
			content = var_30_9,
			OkCallback = function()
				WeaponAction.WeaponStr(var_30_6, var_30_7, var_30_8, arg_30_0.context.totalSelect)
			end,
			itemList = var_30_10
		})

		return
	end

	if var_30_5 then
		local var_30_11 = string.format(GetTips("WEAPON_STRENGTH_COST_RARE"))

		ShowMessageBox({
			title = "Warning",
			content = var_30_11,
			OkCallback = function()
				OperationRecorder.Record("hero", "weaponOKUpgrade")
				WeaponAction.WeaponStr(var_30_6, var_30_7, var_30_8, arg_30_0.context.totalSelect)
			end,
			CancelCallback = function()
				OperationRecorder.Record("hero", "weaponCancelUpgrade")
			end
		})

		return
	end

	WeaponAction.WeaponStr(var_30_6, var_30_7, var_30_8, arg_30_0.context.totalSelect)
end

function var_0_0.OnFilterBtnClick(arg_34_0)
	JumpTools.OpenPageByJump("commonFilterView", {
		filterGroup = Filter_Root_Define.Weapon_LevelUp_Cost_List
	})
end

function var_0_0.OnFilterChange(arg_35_0)
	arg_35_0:ShowWeaponInfoLocal()
end

function var_0_0.CheckWeaponIsMaxLevel(arg_36_0)
	local var_36_0 = arg_36_0.context.weaponInfo

	if var_36_0 then
		return var_36_0.level == HeroConst.WEAPON_LV_MAX
	end

	return false
end

function var_0_0.RefreshMaterialList(arg_37_0)
	local var_37_0 = {}
	local var_37_1 = {}
	local var_37_2 = CommonFilterData:HasIndexFlag(Filter_Root_Define.Weapon_LevelUp_Cost_List.filter_id, Filter_Group_Define.TYPE.groupID, Filter_Tags_Define.Train)
	local var_37_3 = CommonFilterData:HasIndexFlag(Filter_Root_Define.Weapon_LevelUp_Cost_List.filter_id, Filter_Group_Define.TYPE.groupID, Filter_Tags_Define.StarLevel)
	local var_37_4 = CommonFilterData:HasIndexFlag(Filter_Root_Define.Weapon_LevelUp_Cost_List.filter_id, Filter_Group_Define.SORT.groupID, Filter_Tags_Define.DESCending)

	for iter_37_0, iter_37_1 in ipairs(ItemCfg.get_id_list_by_type[ItemConst.ITEM_TYPE.MATERIAL]) do
		local var_37_5 = ItemTools.getItemNum(iter_37_1)

		if ItemCfg[iter_37_1].sub_type == MaterialConst.MATERIAL_TYPE.WEAPON_LEVEL_UP and var_37_5 > 0 then
			local var_37_6 = clone(ItemTemplateData)

			var_37_6.type = ItemConst.ITEM_TYPE.MATERIAL
			var_37_6.id = iter_37_1
			var_37_6.number = var_37_5
			var_37_6.index = 0
			var_37_6.selectStyle = false

			table.insert(var_37_0, var_37_6)
		end
	end

	table.sort(var_37_0, function(arg_38_0, arg_38_1)
		return ItemCfg[arg_38_0.id].rare < ItemCfg[arg_38_1.id].rare
	end)

	local var_37_7 = ServantTools.GetServantLimited(true, true)

	for iter_37_2, iter_37_3 in ipairs(var_37_7) do
		local var_37_8 = clone(ItemTemplateData)

		var_37_8.type = ItemConst.ITEM_TYPE.WEAPON_SERVANT
		var_37_8.uid = iter_37_3.uid
		var_37_8.id = iter_37_3.id
		var_37_8.number = iter_37_3.stage
		var_37_8.addLevel = iter_37_3.stage
		var_37_8.index = 0
		var_37_8.selectStyle = false

		table.insert(var_37_1, var_37_8)
	end

	table.sort(var_37_1, function(arg_39_0, arg_39_1)
		local var_39_0 = WeaponServantCfg[arg_39_0.id].starlevel
		local var_39_1 = WeaponServantCfg[arg_39_1.id].starlevel
		local var_39_2 = arg_39_0.number
		local var_39_3 = arg_39_1.number
		local var_39_4 = WeaponServantCfg[arg_39_0.id].race
		local var_39_5 = WeaponServantCfg[arg_39_1.id].race
		local var_39_6 = arg_39_0.id
		local var_39_7 = arg_39_1.id

		if not var_37_2 and var_39_0 ~= var_39_1 then
			if var_37_4 then
				return var_39_1 < var_39_0
			else
				return var_39_0 < var_39_1
			end
		end

		if var_39_2 ~= var_39_3 then
			if var_37_4 then
				return var_39_3 < var_39_2
			else
				return var_39_2 < var_39_3
			end
		end

		if var_37_2 and var_39_0 ~= var_39_1 then
			if var_37_4 then
				return var_39_1 < var_39_0
			else
				return var_39_0 < var_39_1
			end
		end

		if var_39_4 ~= var_39_5 then
			return var_39_4 < var_39_5
		end

		if var_39_6 ~= var_39_7 then
			if var_37_4 then
				return var_39_7 < var_39_6
			else
				return var_39_6 < var_39_7
			end
		end

		return arg_39_0.uid < arg_39_1.uid
	end)

	arg_37_0.context.servantList = var_37_1
	arg_37_0.context.materialList = var_37_0
	arg_37_0.context.totalCount = #var_37_1 + #var_37_0
	arg_37_0.context.materialCount = #var_37_0
	arg_37_0.context.servantCount = #var_37_1
end

function var_0_0.QuickSelectList(arg_40_0, arg_40_1, arg_40_2, arg_40_3)
	local var_40_0 = arg_40_3
	local var_40_1 = {}

	for iter_40_0 = 1, #arg_40_1 do
		local var_40_2 = arg_40_1[iter_40_0]
		local var_40_3 = ItemCfg[var_40_2.id].param[1]

		var_40_1[iter_40_0] = math.max(math.min(math.ceil(var_40_0 / var_40_3), var_40_2.number), 0)
		var_40_0 = var_40_0 - var_40_1[iter_40_0] * var_40_3

		if var_40_0 < 0 and iter_40_0 > 1 then
			local var_40_4 = -var_40_0

			for iter_40_1 = iter_40_0 - 1, 1, -1 do
				local var_40_5 = arg_40_1[iter_40_1]
				local var_40_6 = ItemCfg[var_40_5.id].param[1]
				local var_40_7 = math.modf(var_40_4 / var_40_6)
				local var_40_8 = math.min(var_40_1[iter_40_1], var_40_7)

				var_40_1[iter_40_1] = math.max(0, var_40_1[iter_40_1] - var_40_8)
				var_40_4 = var_40_4 - var_40_6 * var_40_8
				var_40_0 = var_40_0 + var_40_6 * var_40_8
			end
		end

		if var_40_0 <= 0 then
			break
		end
	end

	for iter_40_2 = 1, #arg_40_1 do
		if var_40_1[iter_40_2] == nil then
			var_40_1[iter_40_2] = 0
		end

		arg_40_1[iter_40_2].selectNum_ = var_40_1[iter_40_2]
		arg_40_1[iter_40_2].topAmountValue = var_40_1[iter_40_2]
	end

	for iter_40_3 = 1, #arg_40_2 do
		local var_40_9 = arg_40_2[iter_40_3]

		if not (ItemCfg[var_40_9.id].rare >= 4 or var_40_9.number ~= 1) then
			local var_40_10 = ItemCfg[var_40_9.id].rare
			local var_40_11 = GameSetting.base_exp_weapon_servant.value[var_40_10]

			if var_40_0 <= 0 then
				var_40_9.topAmountValue = 0
			else
				var_40_9.topAmountValue = 1
				var_40_0 = var_40_0 - var_40_11
			end
		else
			var_40_9.topAmountValue = 0
		end
	end

	return arg_40_3 - var_40_0
end

function var_0_0.UpdateWeaponInfo(arg_41_0)
	local var_41_0 = arg_41_0.context.heroId

	if var_41_0 and var_41_0 ~= 0 then
		local var_41_1 = deepClone(arg_41_0.context.dataPorxy:GetHeroWeaponInfo(var_41_0))

		arg_41_0.context.weaponInfo = var_41_1
	end
end

function var_0_0.Dispose(arg_42_0)
	arg_42_0.scrollHelper_:Dispose()
	arg_42_0:RemoveAllListeners()
	var_0_0.super.Dispose(arg_42_0)
end

return var_0_0
