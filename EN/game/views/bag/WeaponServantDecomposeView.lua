local var_0_0 = class("WeaponServantDecomposeView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/System/Bag/SplitServantUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0.rewardIndex_ = 0
	arg_3_0.rewardItems_ = {}

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

	arg_5_0.servantDetailView_ = WeaponServantMainDetailModule.New(arg_5_0.servantDetailGo_)

	arg_5_0.servantDetailView_:SwitchBtnStyle(4)

	arg_5_0.servantItemList_ = LuaList.New(handler(arg_5_0, arg_5_0.indexServantItem), arg_5_0.uiListGo_, CommonItemView)
	arg_5_0.returnItemList_ = LuaList.New(handler(arg_5_0, arg_5_0.indexRewardItem), arg_5_0.returnItemListGo_, CommonItemView)
	arg_5_0.previewController_ = arg_5_0.controllerEx_:GetController("preview")
	arg_5_0.emptyController_ = arg_5_0.controllerEx_:GetController("empty")
	arg_5_0.btnController_ = arg_5_0.controllerEx_:GetController("btnState")
	arg_5_0.orderController_ = arg_5_0.orderCon_:GetController("sort")
	arg_5_0.filterController_ = arg_5_0.filterCon_:GetController("color")
	arg_5_0.starToggle_ = {}

	for iter_5_0 = 3, 4 do
		arg_5_0.starToggle_[iter_5_0] = arg_5_0["toggle_" .. iter_5_0]
	end
end

function var_0_0.AddUIListener(arg_6_0)
	arg_6_0:AddBtnListener(arg_6_0.btnShowFilter_, nil, function()
		JumpTools.OpenPageByJump("commonFilterView", {
			filterGroup = Filter_Root_Define.Decompose_Servant_Filter_List
		})
	end)
	arg_6_0:AddToggleListener(arg_6_0.dropDown_, function(arg_8_0)
		arg_6_0.priority_ = arg_8_0 == 0 and 1 or 0

		arg_6_0:RefreshData()
	end)
	arg_6_0:AddBtnListener(arg_6_0.btnOrder_, nil, function()
		local var_9_0 = arg_6_0.order_ == 0

		arg_6_0.order_ = var_9_0 and 1 or 0

		arg_6_0.orderController_:SetSelectedState(var_9_0 and "up" or "down")
		arg_6_0:RefreshData()
	end)

	for iter_6_0 = 3, 4 do
		arg_6_0:AddToggleListener(arg_6_0.starToggle_[iter_6_0], function(arg_10_0)
			arg_6_0:QuickSelectServant(iter_6_0, arg_10_0)
		end)
	end

	arg_6_0:AddBtnListener(arg_6_0.btnShowPreview_, nil, function()
		arg_6_0:RefreshRewardItem()
		arg_6_0.previewController_:SetSelectedState("show")
	end)
	arg_6_0:AddBtnListener(arg_6_0.btnPreviewMask_, nil, function()
		arg_6_0.previewController_:SetSelectedState("hide")
	end)
	arg_6_0:AddBtnListener(arg_6_0.btnConfirm_, nil, function()
		if arg_6_0.currentSelectNum_ > 0 then
			arg_6_0:RefreshRewardItem()
			JumpTools.OpenPageByJump("decomposeConfirmPop", {
				type = "servant",
				itemList = arg_6_0.usedServantList_,
				returnList = arg_6_0.rewardList_
			})
		end
	end)
end

function var_0_0.OnEnter(arg_14_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR,
		NAVI_BAR
	})

	arg_14_0.refreshSelectIndex_ = 1
	arg_14_0.usedServantList_ = {}
	arg_14_0.currentSelectNum_ = 0
	arg_14_0.priority_ = 1
	arg_14_0.order_ = 1

	arg_14_0:Render()
	arg_14_0:RenderFilterBtn()
	arg_14_0.filterController_:SetSelectedState("normal")
	arg_14_0.previewController_:SetSelectedState("hide")
	arg_14_0:RegistEventListener(COMMON_FILTER_OK, handler(arg_14_0, arg_14_0.OnFilterChange))
end

function var_0_0.Render(arg_15_0)
	arg_15_0:RefreshData()
end

function var_0_0.RefreshData(arg_16_0)
	local var_16_0 = ServantTools.GetWeaponShowData(Filter_Root_Define.Decompose_Servant_Filter_List.filter_id, {
		hideEquip = true,
		hideLock = true,
		hideStar = {
			5
		}
	})

	arg_16_0.itemList_ = ServantTools:GetServantList(nil, var_16_0, nil, arg_16_0.priority_, arg_16_0.order_)
	arg_16_0.totalNum_ = #arg_16_0.itemList_
	arg_16_0.selectNum_.text = string.format("%s/%s", arg_16_0.currentSelectNum_, arg_16_0.totalNum_)

	arg_16_0.servantItemList_:StartScroll(#arg_16_0.itemList_)
	arg_16_0.emptyController_:SetSelectedState(#arg_16_0.itemList_ > 0 and "show" or "hide")
end

function var_0_0.RefreshRightInfo(arg_17_0, arg_17_1, arg_17_2)
	local var_17_0 = arg_17_2

	if arg_17_0.selectedItem_ then
		arg_17_0.selectedItem_:RefreshSelectState2(false)
	end

	arg_17_1:RefreshSelectState2(true)

	arg_17_0.selectedItem_ = arg_17_1

	arg_17_0.servantDetailView_:OnRenderServant(var_17_0)
	SetActive(arg_17_0.servantDetailView_.lockBtn_.gameObject, false)
end

function var_0_0.RefreshRewardItem(arg_18_0)
	if next(arg_18_0.usedServantList_) ~= nil then
		arg_18_0.rewardList_ = ServantTools.GetServantDecomposeRewardItem(arg_18_0.usedServantList_)
	else
		arg_18_0.rewardList_ = {}
	end

	arg_18_0.returnItemList_:StartScroll(#arg_18_0.rewardList_)
end

function var_0_0.indexServantItem(arg_19_0, arg_19_1, arg_19_2)
	local var_19_0 = clone(ItemTemplateData)
	local var_19_1 = arg_19_0.itemList_[arg_19_1]

	var_19_0.id = var_19_1.id
	var_19_0.uid = var_19_1.uid
	var_19_0.addLevel = WeaponServantData:GetServantDataByUID(var_19_1.uid).stage

	function var_19_0.clickFun(arg_20_0)
		local var_20_0 = arg_20_0.uid

		arg_19_0:RefreshRightInfo(arg_19_2, var_19_1)

		if arg_19_0.usedServantList_[var_20_0] then
			arg_19_2:RefreshSelectState(false)

			arg_19_0.usedServantList_[var_20_0] = nil
			arg_19_0.currentSelectNum_ = arg_19_0.currentSelectNum_ - 1

			arg_19_0:CheckToggleState(var_19_1)
		else
			arg_19_2:RefreshSelectState(true)

			arg_19_0.usedServantList_[var_20_0] = var_19_1
			arg_19_0.currentSelectNum_ = arg_19_0.currentSelectNum_ + 1
		end

		arg_19_0.btnController_:SetSelectedState(arg_19_0.currentSelectNum_ > 0 and "split" or "grey")

		arg_19_0.selectNum_.text = string.format("%s/%s", arg_19_0.currentSelectNum_, arg_19_0.totalNum_)
	end

	arg_19_2:SetData(var_19_0)

	local var_19_2 = arg_19_0.usedServantList_[var_19_1.uid] ~= nil

	arg_19_2:RefreshSelectState(var_19_2)

	if arg_19_0.refreshSelectIndex_ == arg_19_1 then
		arg_19_0:RefreshRightInfo(arg_19_2, var_19_1)
	end
end

function var_0_0.indexRewardItem(arg_21_0, arg_21_1, arg_21_2)
	local var_21_0 = clone(ItemTemplateData)
	local var_21_1 = arg_21_0.rewardList_[arg_21_1]

	var_21_0.id = var_21_1.id
	var_21_0.number = var_21_1.number

	arg_21_2:SetData(var_21_0)
end

function var_0_0.CheckToggleState(arg_22_0, arg_22_1)
	local var_22_0 = ItemCfg[arg_22_1.id].display_rare

	if not arg_22_0.usedServantList_[arg_22_1.uid] and arg_22_0.starToggle_[var_22_0].isOn then
		arg_22_0.unSelectItem_ = arg_22_1
		arg_22_0.starToggle_[var_22_0].isOn = false
	end
end

function var_0_0.QuickSelectServant(arg_23_0, arg_23_1, arg_23_2)
	if arg_23_2 then
		for iter_23_0, iter_23_1 in ipairs(arg_23_0.itemList_) do
			local var_23_0 = WeaponServantCfg[iter_23_1.id].starlevel
			local var_23_1 = iter_23_1.stage

			if var_23_0 == arg_23_1 and var_23_1 == 1 then
				if arg_23_0.usedServantList_[iter_23_1.uid] == nil then
					arg_23_0.currentSelectNum_ = arg_23_0.currentSelectNum_ + 1
				end

				arg_23_0.usedServantList_[iter_23_1.uid] = iter_23_1
			end
		end
	elseif arg_23_0.unSelectItem_ then
		arg_23_0.usedServantList_[arg_23_0.unSelectItem_.uid] = nil
		arg_23_0.unSelectItem_ = nil
	else
		for iter_23_2, iter_23_3 in pairs(arg_23_0.usedServantList_) do
			if WeaponServantCfg[iter_23_3.id].starlevel == arg_23_1 then
				arg_23_0.usedServantList_[iter_23_2] = nil
				arg_23_0.currentSelectNum_ = arg_23_0.currentSelectNum_ - 1
			end
		end
	end

	arg_23_0:RefreshSelect()
end

function var_0_0.RefreshSelect(arg_24_0)
	for iter_24_0, iter_24_1 in pairs(arg_24_0.servantItemList_:GetItemList()) do
		local var_24_0 = iter_24_1:GetData()
		local var_24_1 = arg_24_0.usedServantList_[var_24_0.uid] ~= nil

		iter_24_1:RefreshSelectState(var_24_1)
	end

	arg_24_0.selectNum_.text = string.format("%s/%s", arg_24_0.currentSelectNum_, arg_24_0.totalNum_)

	arg_24_0.btnController_:SetSelectedState(arg_24_0.currentSelectNum_ > 0 and "split" or "grey")
end

function var_0_0.OnServantDecomposeResult(arg_25_0, arg_25_1, arg_25_2)
	getReward2(mergeReward2(arg_25_1.return_list))

	arg_25_0.refreshSelectIndex_ = 1

	arg_25_0:ClearSelect()
	arg_25_0:Render()
end

function var_0_0.ClearSelect(arg_26_0)
	arg_26_0.usedServantList_ = {}
	arg_26_0.currentSelectNum_ = 0

	arg_26_0.btnController_:SetSelectedState("grey")

	for iter_26_0, iter_26_1 in pairs(arg_26_0.starToggle_) do
		iter_26_1.isOn = false
	end
end

function var_0_0.OnFilterChange(arg_27_0)
	arg_27_0:ClearSelect()
	arg_27_0:Render()
	arg_27_0:RenderFilterBtn()
end

function var_0_0.RenderFilterBtn(arg_28_0)
	if CommonFilterData:AtLeastOneChoose(Filter_Root_Define.Decompose_Servant_Filter_List.filter_id) then
		arg_28_0.filterController_:SetSelectedState("orange")
	else
		arg_28_0.filterController_:SetSelectedState("normal")
	end
end

function var_0_0.OnExit(arg_29_0)
	CommonFilterData:ClearFilter(Filter_Root_Define.Decompose_Servant_Filter_List.filter_id)

	for iter_29_0, iter_29_1 in pairs(arg_29_0.starToggle_) do
		iter_29_1.isOn = false
	end

	manager.windowBar:HideBar()
end

function var_0_0.Dispose(arg_30_0)
	arg_30_0:RemoveAllListeners()
	arg_30_0.servantItemList_:Dispose()
	arg_30_0.returnItemList_:Dispose()
	arg_30_0.servantDetailView_:Dispose()
	var_0_0.super.Dispose(arg_30_0)
end

return var_0_0
