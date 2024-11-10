local var_0_0 = class("RewardView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/Common/Pop/RewardpopUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiPop.transform
end

function var_0_0.InitUI(arg_3_0)
	arg_3_0:BindCfgUI()

	arg_3_0.uiList = LuaList.New(handler(arg_3_0, arg_3_0.indexItem), arg_3_0.uiListGo_, CommonItemView)
	arg_3_0.rowCountController_ = arg_3_0.conExCollection_:GetController("rowCount")
end

function var_0_0.AddUIListener(arg_4_0)
	arg_4_0:AddBtnListener(arg_4_0.bgBtn_, nil, function()
		arg_4_0:Back()
	end)
end

function var_0_0.indexItem(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = arg_6_0.itemList_[arg_6_1]
	local var_6_1 = arg_6_0:ConvertToItemData(var_6_0)

	arg_6_2:SetData(var_6_1)
end

function var_0_0.RefreshUI(arg_7_0, arg_7_1)
	if arg_7_1 then
		arg_7_1 = formatRewardCfgList(arg_7_1)
		arg_7_1 = arg_7_0:SortItemList(arg_7_1)

		local var_7_0 = #arg_7_1

		arg_7_0.itemList_ = arg_7_1
		arg_7_0.itemPool_ = arg_7_0.itemPool1_
		arg_7_0.listScrollRect_.enabled = var_7_0 > 10

		arg_7_0.uiList:StartScroll(var_7_0)

		if var_7_0 > 5 then
			arg_7_0.rowCountController_:SetSelectedState("2")
			arg_7_0.uiList:SetAlignment(UIListAlignment.Center)
		else
			arg_7_0.rowCountController_:SetSelectedState("1")
			arg_7_0.uiList:SetAlignment(UIListAlignment.Center2)
		end
	end
end

function var_0_0.Init(arg_8_0)
	arg_8_0:InitUI()
	arg_8_0:AddUIListener()
end

function var_0_0.OnEnter(arg_9_0)
	arg_9_0:RefreshUI(arg_9_0.params_.list)
end

function var_0_0.OnExit(arg_10_0)
	arg_10_0:ShowVitalityBox(function()
		arg_10_0:ShowEquipBox(function()
			return
		end)
	end)
end

function var_0_0.ShowVitalityBox(arg_13_0, arg_13_1)
	if arg_13_0.params_.needShowVitalityBox then
		showVitalitySendMail(arg_13_1)
	else
		arg_13_1()
	end
end

function var_0_0.ShowEquipBox(arg_14_0, arg_14_1)
	if arg_14_0.params_.needShowEquipBox then
		showEquipSendMail(arg_14_1)
	else
		arg_14_1()
	end
end

function var_0_0.Dispose(arg_15_0)
	if arg_15_0.uiList ~= nil then
		arg_15_0.uiList:Dispose()

		arg_15_0.uiList = nil
	end

	if arg_15_0.itemPool1_ ~= nil then
		arg_15_0.itemPool1_:Dispose()

		arg_15_0.itemPool1_ = nil
	end

	var_0_0.super.Dispose(arg_15_0)
end

function var_0_0.DisablebgBtn(arg_16_0)
	arg_16_0.bgBtn_.enabled = false
end

function var_0_0.ConvertToItemData(arg_17_0, arg_17_1)
	local var_17_0 = rewardToItemTemplate(arg_17_1)

	var_17_0.number = var_17_0.number or arg_17_1.number

	function var_17_0.clickFun(arg_18_0)
		ShowPopItem(POP_ITEM, arg_18_0)
	end

	var_17_0.animatorType = ItemConst.ITEM_ANIMATOR_TYPE.ADVANCED

	return var_17_0
end

function var_0_0.Back(arg_19_0, arg_19_1)
	if manager.guide:IsPlaying() then
		var_0_0.super.Back(arg_19_0)

		return
	end

	if arg_19_0:IsAnimEnd() then
		var_0_0.super.Back(arg_19_0)

		if arg_19_1 then
			arg_19_1()
		end
	else
		arg_19_0:StopAllAnim()
	end
end

local function var_0_1(arg_20_0)
	if arg_20_0 == nil then
		return true
	end

	if arg_20_0:GetCurrentAnimatorStateInfo(0).normalizedTime >= 0.999 then
		return true
	end

	return false
end

local function var_0_2(arg_21_0)
	if arg_21_0 == nil then
		return
	end

	arg_21_0:Update(99999)
end

function var_0_0.IsAnimEnd(arg_22_0)
	if #arg_22_0.params_.list == 0 then
		return true
	end

	if not var_0_1(arg_22_0.animator_) then
		return false
	end

	local var_22_0, var_22_1 = arg_22_0.uiList:GetHeadAndTail()

	if var_22_0 == 0 then
		return false
	end

	local var_22_2 = arg_22_0.uiList:GetItemByIndex(var_22_0)

	return var_0_1(var_22_2.animator_)
end

function var_0_0.StopAllAnim(arg_23_0)
	var_0_2(arg_23_0.animator_)

	local var_23_0 = arg_23_0.uiList:GetItemList()

	for iter_23_0, iter_23_1 in pairs(var_23_0) do
		var_0_2(iter_23_1.animator_)
	end
end

local function var_0_3(arg_24_0, arg_24_1)
	local var_24_0 = arg_24_0.id
	local var_24_1 = arg_24_1.id
	local var_24_2 = ItemCfg[var_24_0]
	local var_24_3 = ItemCfg[var_24_1]
	local var_24_4 = var_24_2.rare
	local var_24_5 = var_24_3.rare

	if var_24_4 ~= var_24_5 then
		return var_24_5 < var_24_4
	end

	local var_24_6 = var_24_2.type
	local var_24_7 = var_24_3.type

	if var_24_6 ~= var_24_7 then
		return var_24_7 < var_24_6
	elseif var_24_6 == ItemConst.ITEM_TYPE.EQUIP then
		local var_24_8 = 0
		local var_24_9 = 0
		local var_24_10 = EquipCfg[var_24_0].starlevel
		local var_24_11 = EquipCfg[var_24_1].starlevel

		if var_24_10 == var_24_11 then
			return var_24_1 < var_24_0
		else
			return var_24_11 < var_24_10
		end
	else
		return var_24_1 < var_24_0
	end
end

local function var_0_4(arg_25_0, arg_25_1, arg_25_2)
	local var_25_0 = arg_25_2.type
	local var_25_1 = table.indexof(arg_25_0, var_25_0)

	if var_25_1 and arg_25_1[var_25_0] then
		local var_25_2 = table.indexof(arg_25_1[var_25_0], arg_25_2.id)

		if var_25_2 then
			return var_25_1, var_25_2
		else
			return false
		end
	end

	return var_25_1
end

function var_0_0.SortItemList(arg_26_0, arg_26_1)
	local var_26_0 = {
		ItemConst.ITEM_TYPE.HERO,
		ItemConst.ITEM_TYPE.HERO_SKIN,
		ItemConst.ITEM_TYPE.SCENE,
		ItemConst.ITEM_TYPE.WEAPON_SERVANT,
		ItemConst.ITEM_TYPE.CURRENCY,
		ItemConst.ITEM_TYPE.PORTRAIT,
		ItemConst.ITEM_TYPE.FRAME,
		ItemConst.ITEM_TYPE.STICKER
	}
	local var_26_1 = {
		[ItemConst.ITEM_TYPE.CURRENCY] = {
			1,
			30,
			31,
			32
		}
	}

	table.sort(arg_26_1, function(arg_27_0, arg_27_1)
		local var_27_0 = arg_27_0.id
		local var_27_1 = arg_27_1.id
		local var_27_2 = ItemCfg[var_27_0]
		local var_27_3 = ItemCfg[var_27_1]
		local var_27_4, var_27_5 = var_0_4(var_26_0, var_26_1, var_27_2)
		local var_27_6, var_27_7 = var_0_4(var_26_0, var_26_1, var_27_3)

		if var_27_4 and var_27_6 then
			local var_27_8 = var_27_4 == var_27_6

			if var_27_8 and var_27_5 and var_27_7 then
				return var_27_5 < var_27_7
			elseif not var_27_8 then
				return var_27_4 < var_27_6
			end
		elseif var_27_4 ~= var_27_6 then
			return var_27_6 == false
		end

		return var_0_3(arg_27_0, arg_27_1)
	end)

	return arg_26_1
end

return var_0_0
