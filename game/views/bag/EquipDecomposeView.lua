local var_0_0 = class("EquipDecomposeView", ReduxView)
local var_0_1 = import("game.tools.HeroTools")
local var_0_2 = import("game.tools.EquipTools")

function var_0_0.UIName(arg_1_0)
	return "Widget/System/Bag/SplitEquipUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:InitUI()
	arg_3_0:InitDropDown()
	arg_3_0:AddUIListener()
end

function var_0_0.InitDropDown(arg_4_0)
	arg_4_0.dropDown_.options:Clear()
	arg_4_0.dropDown_.options:Add(UnityEngine.UI.Dropdown.OptionData.New(GetTips("TIP_UPGRADE"), nil))
	arg_4_0.dropDown_.options:Add(UnityEngine.UI.Dropdown.OptionData.New(GetTips("TIP_RARE"), nil))
	arg_4_0.dropDown_:RefreshShownValue()
end

function var_0_0.InitUI(arg_5_0)
	arg_5_0:BindCfgUI()

	arg_5_0.equipItemList_ = LuaList.New(handler(arg_5_0, arg_5_0.indexEquipItem), arg_5_0.uiListGo_, CommonItemView)
	arg_5_0.rewardItemList_ = LuaList.New(handler(arg_5_0, arg_5_0.indexRewardItem), arg_5_0.rewardListGo_, CommonItemView)
	arg_5_0.equipSkillView_ = EquipNewSkillInfoView.New(arg_5_0.skillPopGo_)
	arg_5_0.equipInfo_ = EquipInfoView.New(arg_5_0.equipInfoGo_)

	arg_5_0.equipInfo_:RegisterSkillClick(handler(arg_5_0, arg_5_0.SkillClick))

	arg_5_0.equipPosBtn_ = {}

	for iter_5_0 = 0, 6 do
		arg_5_0.equipPosBtn_[iter_5_0] = arg_5_0["equipPosBtn_" .. iter_5_0]
	end

	arg_5_0.starToggle_ = {}

	for iter_5_1 = 2, 5 do
		arg_5_0.starToggle_[iter_5_1] = arg_5_0["toggle_" .. iter_5_1]
	end

	arg_5_0.popController_ = arg_5_0.controllerEx_:GetController("pop")
	arg_5_0.infoController_ = arg_5_0.controllerEx_:GetController("info")
	arg_5_0.btnController_ = arg_5_0.controllerEx_:GetController("btnState")
	arg_5_0.posController_ = arg_5_0.posCon_:GetController("pos")
	arg_5_0.orderController_ = arg_5_0.orderCon_:GetController("sort")
	arg_5_0.filterController_ = arg_5_0.filterCon_:GetController("color")
end

function var_0_0.AddUIListener(arg_6_0)
	for iter_6_0 = 0, 6 do
		arg_6_0:AddBtnListener(arg_6_0.equipPosBtn_[iter_6_0], nil, function()
			if arg_6_0.pos == iter_6_0 then
				return
			end

			arg_6_0:ChangePos(iter_6_0)
		end)
	end

	arg_6_0:AddBtnListener(arg_6_0.btnShowFliter_, nil, function()
		JumpTools.OpenPageByJump("equipFilterView", {
			isFilterEquiped = true,
			info = arg_6_0.filterInfo_
		})
	end)
	arg_6_0:AddToggleListener(arg_6_0.dropDown_, function(arg_9_0)
		arg_6_0.priority_ = arg_9_0 == 0 and EquipConst.EQUIP_SORT.RARE or EquipConst.EQUIP_SORT.LEVEL

		arg_6_0:RefreshData()
	end)
	arg_6_0:AddBtnListener(arg_6_0.btnOrder_, nil, function()
		local var_10_0 = arg_6_0.order_ == ItemConst.SORT_TYPE.DOWN

		arg_6_0.order_ = var_10_0 and ItemConst.SORT_TYPE.UP or ItemConst.SORT_TYPE.DOWN

		arg_6_0.orderController_:SetSelectedState(var_10_0 and "down" or "up")
		arg_6_0:RefreshData()
	end)

	for iter_6_1 = 2, 5 do
		arg_6_0:AddToggleListener(arg_6_0.starToggle_[iter_6_1], function(arg_11_0)
			arg_6_0:QuickSelectEquip(iter_6_1, arg_11_0)
		end)
	end

	arg_6_0:AddBtnListener(arg_6_0.btnPreview_, nil, function()
		if arg_6_0.popController_:GetSelectedState() == "preview" then
			arg_6_0.popController_:SetSelectedState("hide")
		else
			arg_6_0:RefreshRewardItem()
			arg_6_0.popController_:SetSelectedState("preview")
		end
	end)
	arg_6_0:AddBtnListener(arg_6_0.btnMask_, nil, function()
		if arg_6_0.popController_:GetSelectedState() == "skill" and arg_6_0.selectSkillItem_ then
			arg_6_0.selectSkillItem_:ShowSelect(false)
		end

		arg_6_0.popController_:SetSelectedState("hide")
	end)
	arg_6_0:AddBtnListenerScale(arg_6_0.btnConfirm_, nil, function()
		if arg_6_0.currentSelectNum_ > 0 then
			arg_6_0:RefreshRewardItem()
			JumpTools.OpenPageByJump("decomposeConfirmPop", {
				type = "equip",
				itemList = arg_6_0.usedEquipList_,
				returnList = arg_6_0.rewardList_
			})
		end
	end)
end

function var_0_0.OnEnter(arg_15_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR,
		NAVI_BAR
	})

	arg_15_0.filterInfo_ = {}
	arg_15_0.refreshSelectIndex_ = 1
	arg_15_0.usedEquipList_ = {}
	arg_15_0.currentSelectNum_ = 0
	arg_15_0.pos = 0
	arg_15_0.suit = 0
	arg_15_0.skill = 0

	arg_15_0:RefreshData()

	arg_15_0.selectNum_.text = string.format("%s/%s", arg_15_0.currentSelectNum_, arg_15_0.totalNum_)

	arg_15_0.filterController_:SetSelectedState("normal")
	arg_15_0.popController_:SetSelectedState("hide")
	arg_15_0:RegistEventListener(EQUIP_FILTER_CONFIRM, handler(arg_15_0, arg_15_0.OnEquipFilterConfirm))
	arg_15_0.btnController_:SetSelectedState(arg_15_0.currentSelectNum_ > 0 and "split" or "grey")
	arg_15_0.posController_:SetSelectedState(0)

	for iter_15_0, iter_15_1 in pairs(arg_15_0.starToggle_) do
		iter_15_1.isOn = false
	end
end

function var_0_0.RefreshData(arg_16_0)
	arg_16_0.order_ = arg_16_0.order_ or ItemConst.SORT_TYPE.DOWN
	arg_16_0.priority_ = arg_16_0.priority_ or EquipConst.EQUIP_SORT.RARE
	arg_16_0.itemList_ = arg_16_0:GetItemList(arg_16_0.order_, arg_16_0.priority_, arg_16_0.pos, arg_16_0.filterInfo_.suit, arg_16_0.filterInfo_.skill)
	arg_16_0.totalNum_ = #arg_16_0.itemList_

	arg_16_0.equipItemList_:StartScroll(#arg_16_0.itemList_)
	arg_16_0.infoController_:SetSelectedState(#arg_16_0.itemList_ > 0 and "show" or "hide")
	arg_16_0:CheckToggleState(arg_16_0.itemList_)
end

function var_0_0.GetItemList(arg_17_0, arg_17_1, arg_17_2, arg_17_3, arg_17_4, arg_17_5)
	local var_17_0 = EquipData:GetEquipListComplex(arg_17_1, arg_17_2, arg_17_3, arg_17_4, arg_17_5)
	local var_17_1 = var_0_1.GetEquipMap(HeroData:GetHeroList())
	local var_17_2 = ProposalData:GetEquipMap()
	local var_17_3 = {}

	for iter_17_0 = #var_17_0, 1, -1 do
		local var_17_4 = var_17_0[iter_17_0]

		if not var_17_1[var_17_4.equip_id] and not var_17_4.is_lock and not var_17_2[var_17_4.equip_id] then
			table.insert(var_17_3, var_17_4)
		end
	end

	return var_17_3
end

function var_0_0.RefreshRightInfo(arg_18_0, arg_18_1, arg_18_2)
	local var_18_0 = arg_18_2

	if arg_18_0.selectedItem_ then
		arg_18_0.selectedItem_:RefreshSelectState2(false)
	end

	arg_18_1:RefreshSelectState2(true)

	arg_18_0.selectedItem_ = arg_18_1

	arg_18_0.equipInfo_:RefreshData(arg_18_0, var_18_0, nil, 0, var_18_0.equip_id)
end

function var_0_0.RefreshRewardItem(arg_19_0)
	if next(arg_19_0.usedEquipList_) ~= nil then
		arg_19_0.rewardList_ = var_0_2.GetDecomposeRewardItem(arg_19_0.usedEquipList_)
	else
		arg_19_0.rewardList_ = {}
	end

	local var_19_0 = #arg_19_0.rewardList_

	arg_19_0.rewardItemList_:StartScroll(var_19_0)
end

function var_0_0.indexEquipItem(arg_20_0, arg_20_1, arg_20_2)
	local var_20_0 = clone(ItemTemplateData)
	local var_20_1 = arg_20_0.itemList_[arg_20_1]

	var_20_0.id = var_20_1.prefab_id
	var_20_0.equip_id = var_20_1.equip_id
	var_20_0.equipLevel = var_0_2.CountEquipLevel(var_20_1)

	local var_20_2 = var_20_1.race

	if var_20_2 == 0 or table.keyof(RaceEffectCfg.all, var_20_2) ~= nil then
		var_20_0.race = var_20_2 or 0
		var_20_0.bindHeroID = 0
	else
		local var_20_3 = var_20_2

		var_20_0.race = HeroCfg[var_20_3].race or 0
		var_20_0.bindHeroID = var_20_3
	end

	function var_20_0.clickFun(arg_21_0)
		local var_21_0 = arg_21_0.equip_id

		arg_20_0:RefreshRightInfo(arg_20_2, var_20_1)

		if arg_20_0.usedEquipList_[var_21_0] then
			arg_20_2:RefreshSelectState(false)

			arg_20_0.usedEquipList_[var_21_0] = nil
			arg_20_0.currentSelectNum_ = arg_20_0.currentSelectNum_ - 1

			arg_20_0:CheckToggleState({
				var_20_1
			})
		else
			arg_20_2:RefreshSelectState(true)

			arg_20_0.usedEquipList_[var_21_0] = var_20_1
			arg_20_0.currentSelectNum_ = arg_20_0.currentSelectNum_ + 1
		end

		arg_20_0.btnController_:SetSelectedState(arg_20_0.currentSelectNum_ > 0 and "split" or "grey")

		arg_20_0.selectNum_.text = string.format("%s/%s", arg_20_0.currentSelectNum_, arg_20_0.totalNum_)
	end

	arg_20_2:SetData(var_20_0)

	local var_20_4 = arg_20_0.usedEquipList_[var_20_1.equip_id] ~= nil

	arg_20_2:RefreshSelectState(var_20_4)

	if arg_20_0.refreshSelectIndex_ == arg_20_1 then
		arg_20_0:RefreshRightInfo(arg_20_2, var_20_1)
	end
end

function var_0_0.indexRewardItem(arg_22_0, arg_22_1, arg_22_2)
	local var_22_0 = clone(ItemTemplateData)
	local var_22_1 = arg_22_0.rewardList_[arg_22_1]

	var_22_0.id = var_22_1.id
	var_22_0.number = var_22_1.number

	function var_22_0.clickFun(arg_23_0)
		ShowPopItem(POP_ITEM, {
			arg_23_0.id,
			arg_23_0.number
		})
	end

	arg_22_2:SetData(var_22_0)
end

function var_0_0.CheckToggleState(arg_24_0, arg_24_1)
	for iter_24_0, iter_24_1 in ipairs(arg_24_1) do
		if arg_24_0.starToggle_[iter_24_1.star].isOn and not arg_24_0.usedEquipList_[iter_24_1.equip_id] then
			arg_24_0.notClearSelect_ = true
			arg_24_0.starToggle_[iter_24_1.star].isOn = false
		end
	end
end

function var_0_0.SkillClick(arg_25_0, arg_25_1, arg_25_2)
	arg_25_0.popController_:SetSelectedState("skill")

	arg_25_0.selectSkillItem_ = arg_25_1

	arg_25_0.equipSkillView_:RefreshData(arg_25_0, arg_25_2)
end

function var_0_0.QuickSelectEquip(arg_26_0, arg_26_1, arg_26_2)
	if arg_26_2 then
		local var_26_0

		for iter_26_0, iter_26_1 in ipairs(arg_26_0.itemList_) do
			if iter_26_1.star == arg_26_1 then
				var_26_0 = var_26_0 or iter_26_0

				if arg_26_0.usedEquipList_[iter_26_1.equip_id] == nil then
					arg_26_0.currentSelectNum_ = arg_26_0.currentSelectNum_ + 1
				end

				arg_26_0.usedEquipList_[iter_26_1.equip_id] = iter_26_1
			end
		end

		if var_26_0 then
			arg_26_0.equipItemList_:ScrollToIndex(var_26_0, false, true, 0.5)
		end
	elseif arg_26_0.notClearSelect_ then
		arg_26_0.notClearSelect_ = false
	else
		for iter_26_2, iter_26_3 in ipairs(arg_26_0.itemList_) do
			if next(arg_26_0.usedEquipList_) ~= nil and arg_26_0.usedEquipList_[iter_26_3.equip_id] and iter_26_3.star == arg_26_1 then
				arg_26_0.usedEquipList_[iter_26_3.equip_id] = nil
				arg_26_0.currentSelectNum_ = arg_26_0.currentSelectNum_ - 1
			end
		end
	end

	arg_26_0:RefreshSelect()
end

function var_0_0.ChangePos(arg_27_0, arg_27_1)
	arg_27_0.posController_:SetSelectedState(arg_27_1)

	arg_27_0.pos = arg_27_1
	arg_27_0.filterInfo_.suitPos = arg_27_1

	arg_27_0:RefreshData()
	arg_27_0:ClearSelect()
end

function var_0_0.OnEquipDecompose(arg_28_0, arg_28_1, arg_28_2)
	if isSuccess(arg_28_1.result) then
		arg_28_0:Go("reward", {
			list = arg_28_0.rewardList_
		})

		arg_28_0.usedEquipList_ = {}

		arg_28_0.btnController_:SetSelectedState("grey")
		arg_28_0:RefreshData()

		arg_28_0.currentSelectNum_ = 0
		arg_28_0.selectNum_.text = string.format("%s/%s", arg_28_0.currentSelectNum_, arg_28_0.totalNum_)

		for iter_28_0, iter_28_1 in pairs(arg_28_0.starToggle_) do
			iter_28_1.isOn = false
		end
	else
		ShowTips(arg_28_1.result)
	end
end

function var_0_0.RefreshSelect(arg_29_0)
	for iter_29_0, iter_29_1 in pairs(arg_29_0.equipItemList_:GetItemList()) do
		local var_29_0 = iter_29_1:GetData()
		local var_29_1 = arg_29_0.usedEquipList_[var_29_0.equip_id] ~= nil

		iter_29_1:RefreshSelectState(var_29_1)
	end

	arg_29_0.selectNum_.text = string.format("%s/%s", arg_29_0.currentSelectNum_, arg_29_0.totalNum_)

	arg_29_0.btnController_:SetSelectedState(arg_29_0.currentSelectNum_ > 0 and "split" or "grey")
end

function var_0_0.OnEquipFilterConfirm(arg_30_0, arg_30_1)
	for iter_30_0, iter_30_1 in pairs(arg_30_1) do
		arg_30_0.filterInfo_[iter_30_0] = iter_30_1
	end

	arg_30_0.filterInfo_.suit = arg_30_0.filterInfo_.filterGroup[1]
	arg_30_0.filterInfo_.skill = arg_30_0.filterInfo_.filterGroup[2]

	local var_30_0 = #arg_30_0.filterInfo_.suit > 0 or #arg_30_0.filterInfo_.skill > 0

	arg_30_0.filterController_:SetSelectedState(var_30_0 and "orange" or "normal")
	arg_30_0:RefreshData()
	arg_30_0:ClearSelect()
end

function var_0_0.ClearSelect(arg_31_0)
	arg_31_0.usedEquipList_ = {}
	arg_31_0.currentSelectNum_ = 0
	arg_31_0.selectNum_.text = string.format("%s/%s", arg_31_0.currentSelectNum_, arg_31_0.totalNum_)

	arg_31_0.btnController_:SetSelectedState("grey")

	for iter_31_0, iter_31_1 in pairs(arg_31_0.starToggle_) do
		iter_31_1.isOn = false
	end
end

function var_0_0.OnExit(arg_32_0)
	return
end

function var_0_0.Dispose(arg_33_0)
	arg_33_0:RemoveAllListeners()
	arg_33_0.equipItemList_:Dispose()
	arg_33_0.rewardItemList_:Dispose()
	arg_33_0.equipSkillView_:Dispose()
	arg_33_0.equipInfo_:Dispose()
	var_0_0.super.Dispose(arg_33_0)
end

return var_0_0
