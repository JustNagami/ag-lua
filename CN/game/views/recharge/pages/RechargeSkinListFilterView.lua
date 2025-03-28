local var_0_0 = class("RechargeSkinListFilterView", ReduxView)
local var_0_1 = {
	STATE = 2,
	HERO = 1
}

function var_0_0.UIName(arg_1_0)
	return "Widget/System/Recharge/RechargeFliterUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiPop.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:BindCfgUI()
	arg_3_0:AddListeners()

	arg_3_0.heroUIList_ = LuaList.New(handler(arg_3_0, arg_3_0.IndexHeroItem), arg_3_0.heroListGo_, HeroLongHead)
	arg_3_0.filterBottomList_ = {}
	arg_3_0.tabController_ = arg_3_0.tabControllerEx_:GetController("tab")
	arg_3_0.selectController_ = arg_3_0.mainConttollerEx_:GetController("type")
	arg_3_0.heroController_ = arg_3_0.mainConttollerEx_:GetController("select")
	arg_3_0.typeController_ = {}
	arg_3_0.buyController_ = {}

	for iter_3_0 = 1, 3 do
		arg_3_0.typeController_[iter_3_0] = arg_3_0["typeControllerEx_" .. iter_3_0]:GetController("select")
		arg_3_0.buyController_[iter_3_0] = arg_3_0["buyControllerEx_" .. iter_3_0]:GetController("select")
	end

	arg_3_0.heroIDList_ = {}
	arg_3_0.selectList_ = {}
	arg_3_0.selectType_ = ShopConst.FILTER_HERO_TYPE.ALL
	arg_3_0.selectBuy_ = ShopConst.FILTER_STATE_TYPE.ALL
	arg_3_0.selectPanelType_ = var_0_1.HERO
end

function var_0_0.OnEnter(arg_4_0)
	arg_4_0.filterParams_ = clone(arg_4_0.params_.filterParams)

	arg_4_0:InitHeroDataList()
	arg_4_0:InitSelectList()
	arg_4_0.heroUIList_:StartScroll(#arg_4_0.heroIDList_)
	arg_4_0:RefreshFilterBottom()
	arg_4_0:RefreshPanel()
end

function var_0_0.RefreshFilterBottom(arg_5_0)
	for iter_5_0, iter_5_1 in ipairs(arg_5_0.selectList_) do
		local var_5_0 = arg_5_0.filterBottomList_[iter_5_0]

		if var_5_0 == nil then
			local var_5_1 = Object.Instantiate(arg_5_0.filterBottomItemGo_, arg_5_0.filterBottomContent_)

			var_5_0 = CommonFilterBottomItem.New(var_5_1)
			arg_5_0.filterBottomList_[iter_5_0] = var_5_0
		end

		var_5_0:Refresh({
			name = HeroTools.GetHeroFullName(iter_5_1)
		})
	end

	for iter_5_2 = #arg_5_0.selectList_ + 1, #arg_5_0.filterBottomList_ do
		SetActive(arg_5_0.filterBottomList_[iter_5_2].gameObject_, false)
	end
end

function var_0_0.OnExit(arg_6_0)
	return
end

function var_0_0.Dispose(arg_7_0)
	arg_7_0.heroUIList_:Dispose()

	arg_7_0.heroUIList_ = nil

	for iter_7_0, iter_7_1 in ipairs(arg_7_0.filterBottomList_) do
		iter_7_1:Dispose()
	end

	var_0_0.super.Dispose(arg_7_0)
end

function var_0_0.AddListeners(arg_8_0)
	arg_8_0:AddBtnListener(arg_8_0.btnConfirm_, nil, function()
		manager.notify:Invoke(RECHARGE_SKIN_LIST_FILTER_APPLY, {
			heroIDList = arg_8_0.selectList_,
			goodType = arg_8_0.selectType_,
			stateType = arg_8_0.selectBuy_
		})
		arg_8_0:Back()
	end)
	arg_8_0:AddBtnListener(arg_8_0.heroBtn_, nil, function()
		arg_8_0:SwitchPanel(var_0_1.HERO)
	end)
	arg_8_0:AddBtnListener(arg_8_0.stateBtn_, nil, function()
		arg_8_0:SwitchPanel(var_0_1.STATE)
	end)
	arg_8_0:AddBtnListener(arg_8_0.btnMask_, nil, function()
		arg_8_0:Back()
	end)
	arg_8_0:AddBtnListener(arg_8_0.buttomBtn_, nil, function()
		arg_8_0:ClearSelect()
	end)

	for iter_8_0 = 1, 3 do
		arg_8_0:AddBtnListener(arg_8_0["typeBtn_" .. iter_8_0], nil, function()
			if arg_8_0.selectType_ == iter_8_0 then
				return
			end

			arg_8_0.selectType_ = iter_8_0

			arg_8_0:RefreshPanel()
		end)
	end

	for iter_8_1 = 1, 3 do
		arg_8_0:AddBtnListener(arg_8_0["buyBtn_" .. iter_8_1], nil, function()
			if arg_8_0.selectBuy_ == iter_8_1 then
				return
			end

			arg_8_0.selectBuy_ = iter_8_1

			arg_8_0:RefreshPanel()
		end)
	end
end

function var_0_0.SwitchPanel(arg_16_0, arg_16_1)
	if arg_16_0.selectPanelType_ ~= arg_16_1 then
		arg_16_0.selectPanelType_ = arg_16_1

		arg_16_0:RefreshPanel()
	end
end

function var_0_0.RefreshPanel(arg_17_0)
	if arg_17_0.selectPanelType_ == var_0_1.HERO then
		arg_17_0.selectController_:SetSelectedIndex(0)
		arg_17_0.tabController_:SetSelectedIndex(0)
	else
		arg_17_0.selectController_:SetSelectedIndex(1)
		arg_17_0.tabController_:SetSelectedIndex(1)
	end

	arg_17_0.heroUIList_:StartScroll(#arg_17_0.heroIDList_)

	for iter_17_0 = 1, 3 do
		arg_17_0.typeController_[iter_17_0]:SetSelectedIndex(arg_17_0.selectType_ == iter_17_0 and 1 or 0)
		arg_17_0.buyController_[iter_17_0]:SetSelectedIndex(arg_17_0.selectBuy_ == iter_17_0 and 1 or 0)
	end
end

function var_0_0.InitHeroDataList(arg_18_0)
	arg_18_0.heroIDList_ = HeroCfg.get_id_list_by_private[0]

	table.sort(arg_18_0.heroIDList_, function(arg_19_0, arg_19_1)
		local var_19_0 = HeroData:GetHeroData(arg_19_0)
		local var_19_1 = HeroData:GetHeroData(arg_19_1)
		local var_19_2 = getBattlePower(var_19_0)
		local var_19_3 = getBattlePower(var_19_1)

		if var_19_0.unlock ~= var_19_1.unlock then
			return var_19_0.unlock > var_19_1.unlock
		end

		local var_19_4 = HeroData:IsFavorite(arg_19_0)
		local var_19_5 = HeroData:IsFavorite(arg_19_1)

		if var_19_4 ~= var_19_5 and (not var_19_4 or not var_19_5) then
			return var_19_4 ~= false
		end

		if var_19_2 ~= var_19_3 then
			return var_19_3 < var_19_2
		end

		return arg_19_1 < arg_19_0
	end)
end

function var_0_0.IndexHeroItem(arg_20_0, arg_20_1, arg_20_2)
	local var_20_0 = arg_20_0.heroIDList_[arg_20_1]

	arg_20_2.gameObject_.name = tostring(var_20_0)

	arg_20_2:SetProxy(arg_20_0.heroViewProxy_)
	arg_20_2:SetHeroId(var_20_0, HeroConst.HERO_DATA_TYPE.DEFAULT)

	arg_20_2.nameText_.text = GetI18NText(HeroCfg[var_20_0].name)

	local var_20_1 = false

	if table.keyof(arg_20_0.selectList_, var_20_0) ~= nil then
		var_20_1 = true
	end

	arg_20_2:SetSelected(var_20_1)
	arg_20_2:RegisterClickListener(function()
		local var_21_0 = true

		if table.keyof(arg_20_0.selectList_, var_20_0) ~= nil then
			var_21_0 = false
		end

		arg_20_2:SetSelected(var_21_0)

		if var_21_0 then
			table.insert(arg_20_0.selectList_, var_20_0)
		else
			table.removebyvalue(arg_20_0.selectList_, var_20_0)
		end

		arg_20_0:RefreshSelectHeroList()
	end)
	arg_20_2:SetUnlockDisplay(false)
	arg_20_2:SetFavor(false)
end

function var_0_0.RefreshSelectHeroList(arg_22_0)
	arg_22_0.heroUIList_:Refresh()

	if #arg_22_0.selectList_ <= 0 then
		arg_22_0.heroController_:SetSelectedState("off")
	else
		arg_22_0.heroController_:SetSelectedState("on")
		arg_22_0:RefreshFilterBottom()
	end
end

function var_0_0.ClearSelect(arg_23_0)
	arg_23_0.selectList_ = {}

	arg_23_0:RefreshSelectHeroList()
end

function var_0_0.InitSelectList(arg_24_0)
	arg_24_0.selectList_ = arg_24_0.filterParams_.heroIDList
	arg_24_0.selectType_ = arg_24_0.filterParams_.goodType
	arg_24_0.selectBuy_ = arg_24_0.filterParams_.stateType

	arg_24_0:RefreshSelectHeroList()
end

return var_0_0
