local var_0_0 = class("CustomStickerCollectView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/System/UserInfor/sticker_new/StickerCollectUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:InitUI()
	arg_3_0:AddUIListeners()
end

function var_0_0.InitUI(arg_4_0)
	arg_4_0:BindCfgUI()

	arg_4_0.mainPageNum_ = 1
	arg_4_0.subPageNum_ = 1
	arg_4_0.tabFilterPanel_ = CustomStickerFilterPanel.New(arg_4_0.filterPanelGo_)
	arg_4_0.tabFilterSuitMap_ = {}
	arg_4_0.filterGetState_ = 0
	arg_4_0.filterDescendState_ = true
	arg_4_0.filterMap_ = {}
	arg_4_0.filterState_ = false
	arg_4_0.rightListData_ = {}
	arg_4_0.suitList_ = LuaList.New(handler(arg_4_0, arg_4_0.IndexSuitItem), arg_4_0.suitUIList_, CustomStickerCollectSuitItem)
	arg_4_0.stList_ = LuaList.New(handler(arg_4_0, arg_4_0.IndexListItem), arg_4_0.stUIList_, CustomStickerListItem)
	arg_4_0.fgList_ = LuaList.New(handler(arg_4_0, arg_4_0.IndexListItem), arg_4_0.fgUIList_, CustomStickerListItem)
	arg_4_0.bgList_ = LuaList.New(handler(arg_4_0, arg_4_0.IndexListItem), arg_4_0.bgUIList_, CustomStickerListItem)
	arg_4_0.mainTabController_ = arg_4_0.mainControllerEx_:GetController("mainTab")
	arg_4_0.subTabController_ = arg_4_0.mainControllerEx_:GetController("subTab")
	arg_4_0.collectController_ = arg_4_0.mainControllerEx_:GetController("collect")
	arg_4_0.colorController_ = arg_4_0.filterController_:GetController("color")
	arg_4_0.sortController_ = arg_4_0.orderControllerEx_:GetController("sort")
	arg_4_0.mainTabActiveController_ = arg_4_0.mainControllerEx_:GetController("mainTabActive")

	arg_4_0:InitTabBtn()
	arg_4_0:InitDropdownData()
end

function var_0_0.InitDropdownData(arg_5_0)
	arg_5_0.filterDd_.options:Clear()
	arg_5_0.filterDd_.options:Add(UnityEngine.UI.Dropdown.OptionData.New(GetTips("ALL"), nil))
	arg_5_0.filterDd_.options:Add(UnityEngine.UI.Dropdown.OptionData.New(GetTips("ACQUIRED"), nil))
	arg_5_0.filterDd_.options:Add(UnityEngine.UI.Dropdown.OptionData.New(GetTips("NOTACQUIRED"), nil))
	arg_5_0.filterDd_:RefreshShownValue()
end

function var_0_0.InitTabBtn(arg_6_0)
	local var_6_0 = StickerSuitCfg.all

	arg_6_0.mainTabActiveController_:SetSelectedState(#var_6_0 > 0 and "on" or "off")

	arg_6_0.canClickMain1Btn_ = #var_6_0 > 0
end

function var_0_0.AddUIListeners(arg_7_0)
	arg_7_0:AddBtnListener(arg_7_0.main1Btn_, nil, function()
		if arg_7_0.mainPageNum_ ~= 1 then
			PlayerData:ClearStickerCollectPageRedPoint(arg_7_0.subPageNum_)
			arg_7_0:RefreshMainPage(1)
		end
	end)
	arg_7_0:AddBtnListener(arg_7_0.main2Btn_, nil, function()
		if arg_7_0.mainPageNum_ ~= 2 then
			arg_7_0:RefreshMainPage(2)
		end
	end)

	for iter_7_0 = 1, 3 do
		arg_7_0:AddBtnListener(arg_7_0["sub" .. iter_7_0 .. "Btn_"], nil, function()
			if arg_7_0.subPageNum_ ~= iter_7_0 then
				PlayerData:ClearStickerCollectPageRedPoint(arg_7_0.subPageNum_)
				arg_7_0:RefreshSubPage(iter_7_0)
			end
		end)
	end

	arg_7_0:AddBtnListener(arg_7_0.filterBtn_, nil, function()
		arg_7_0.tabFilterPanel_:OpenPanel()
	end)
	arg_7_0:AddBtnListener(arg_7_0.orderBtn_, nil, function()
		if arg_7_0.filterDescendState_ then
			arg_7_0.filterDescendState_ = false

			arg_7_0.sortController_:SetSelectedState("up")
			arg_7_0:RefreshSubPage(arg_7_0.subPageNum_)
		else
			arg_7_0.filterDescendState_ = true

			arg_7_0.sortController_:SetSelectedState("down")
			arg_7_0:RefreshSubPage(arg_7_0.subPageNum_)
		end
	end)
	arg_7_0:AddBtnListener(arg_7_0.tipsBtn_, nil, function()
		if arg_7_0.collectController_:GetSelectedState() == "close" then
			arg_7_0.collectController_:SetSelectedState("open")
		elseif arg_7_0.collectController_:GetSelectedState() == "open" then
			arg_7_0.collectController_:SetSelectedState("close")
		end
	end)
	arg_7_0:AddToggleListener(arg_7_0.filterDd_, function(arg_14_0)
		arg_7_0.filterGetState_ = arg_14_0

		arg_7_0:RefreshSubPage(arg_7_0.subPageNum_)
	end)
end

function var_0_0.IndexSuitItem(arg_15_0, arg_15_1, arg_15_2)
	arg_15_2:SetData(arg_15_0.rightListData_[arg_15_1])
end

function var_0_0.IndexListItem(arg_16_0, arg_16_1, arg_16_2)
	local var_16_0 = ProfileDecorateItemCfg[arg_16_0.rightListData_[arg_16_1]]
	local var_16_1 = false
	local var_16_2 = false
	local var_16_3 = true
	local var_16_4 = false
	local var_16_5

	if arg_16_0.subPageNum_ == 1 then
		var_16_4 = PlayerData:GetSticker(arg_16_0.rightListData_[arg_16_1]).lock

		function var_16_5()
			JumpTools.OpenPageByJump("customStickerCollectPop", {
				stickerID = var_16_0.id
			})
		end
	elseif arg_16_0.subPageNum_ == 2 then
		var_16_4 = PlayerData:GetStickerBg(arg_16_0.rightListData_[arg_16_1]).lock

		function var_16_5()
			JumpTools.OpenPageByJump("customStickerCollectPop", {
				stickerID = var_16_0.id
			})
		end
	elseif arg_16_0.subPageNum_ == 3 then
		var_16_4 = PlayerData:GetStickerFg(arg_16_0.rightListData_[arg_16_1]).lock

		function var_16_5()
			JumpTools.OpenPageByJump("customStickerCollectPop", {
				stickerID = var_16_0.id
			})
		end
	end

	local var_16_6 = false

	arg_16_2:SetData(var_16_0, var_16_1, var_16_2, var_16_3, var_16_4, var_16_6, var_16_5, true)
end

function var_0_0.OnEnter(arg_20_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR
	})

	arg_20_0.filterMap_ = {}
	arg_20_0.filterState_ = false

	arg_20_0.colorController_:SetSelectedState("normal")
	arg_20_0.tabFilterPanel_:SetData(StickerSuitCfg.all, function(arg_21_0, arg_21_1)
		arg_20_0.filterMap_ = arg_21_0
		arg_20_0.filterState_ = not arg_21_1

		arg_20_0.colorController_:SetSelectedState(arg_20_0.filterState_ and "orange" or "normal")
		arg_20_0:RefreshSubPage(arg_20_0.subPageNum_)
	end)

	local var_20_0 = arg_20_0.canClickMain1Btn_ and 1 or 2

	arg_20_0:RefreshMainPage(var_20_0)
	arg_20_0:RefreshCollectTips()
	manager.redPoint:bindUIandKey(arg_20_0.main1Btn_.transform, RedPointConst.CUSTOM_STICKER_SUIT_REWARD)
	manager.redPoint:bindUIandKey(arg_20_0.main2Btn_.transform, RedPointConst.CUSTOM_STICKER_ROOT)
	manager.redPoint:bindUIandKey(arg_20_0.sub1Btn_.transform, RedPointConst.CUSTOM_STICKER_ST)
	manager.redPoint:bindUIandKey(arg_20_0.sub2Btn_.transform, RedPointConst.CUSTOM_STICKER_BG)
	manager.redPoint:bindUIandKey(arg_20_0.sub3Btn_.transform, RedPointConst.CUSTOM_STICKER_FG)
end

function var_0_0.RefreshCollectTips(arg_22_0)
	local var_22_0 = #PlayerData:GetStickerList(true)
	local var_22_1 = #PlayerData:GetStickerList()
	local var_22_2 = #PlayerData:GetStickerBgList(true)
	local var_22_3 = #PlayerData:GetStickerBgList()
	local var_22_4 = #PlayerData:GetStickerFgList(true)
	local var_22_5 = #PlayerData:GetStickerFgList()

	arg_22_0.stNumText_.text = var_22_1 .. "/" .. var_22_0
	arg_22_0.bgNumText_.text = var_22_3 .. "/" .. var_22_2
	arg_22_0.fgNumText_.text = var_22_5 .. "/" .. var_22_4
	arg_22_0.percentText_.text = math.floor((var_22_1 + var_22_3 + var_22_5) / (var_22_0 + var_22_2 + var_22_4) * 100) .. "%"
	arg_22_0.progressText_.text = var_22_1 + var_22_3 + var_22_5 .. "/" .. var_22_0 + var_22_2 + var_22_4
end

function var_0_0.RefreshMainPage(arg_23_0, arg_23_1)
	arg_23_0.mainPageNum_ = arg_23_1

	arg_23_0.mainTabController_:SetSelectedState(tostring(arg_23_1))

	if arg_23_1 == 1 then
		arg_23_0.rightListData_ = StickerSuitCfg.all

		table.sort(arg_23_0.rightListData_, function(arg_24_0, arg_24_1)
			return arg_24_1 < arg_24_0
		end)
		arg_23_0.suitList_:StartScroll(#arg_23_0.rightListData_)
	elseif arg_23_1 == 2 then
		arg_23_0:RefreshSubPage(1)
	end
end

function var_0_0.RefreshSubPage(arg_25_0, arg_25_1)
	arg_25_0.subPageNum_ = arg_25_1

	arg_25_0.subTabController_:SetSelectedState(tostring(arg_25_1))

	if arg_25_1 == 1 then
		arg_25_0.rightListData_ = {}

		local var_25_0 = {}

		if arg_25_0.filterGetState_ == 0 then
			var_25_0 = PlayerData:GetStickerList(true)
		elseif arg_25_0.filterGetState_ == 1 then
			var_25_0 = PlayerData:GetStickerList()
		elseif arg_25_0.filterGetState_ == 2 then
			var_25_0 = PlayerData:GetStickerList(false, true)
		end

		if arg_25_0.filterState_ then
			for iter_25_0, iter_25_1 in pairs(var_25_0) do
				local var_25_1 = PlayerData:GetSticker(iter_25_1)

				if arg_25_0.filterMap_[var_25_1.suit] then
					table.insert(arg_25_0.rightListData_, iter_25_1)
				end
			end
		else
			arg_25_0.rightListData_ = var_25_0
		end

		if arg_25_0.filterDescendState_ then
			table.sort(arg_25_0.rightListData_, function(arg_26_0, arg_26_1)
				local var_26_0 = PlayerData:GetSticker(arg_26_0)
				local var_26_1 = PlayerData:GetSticker(arg_26_1)

				if var_26_0.lock == var_26_1.lock then
					return arg_26_1 < arg_26_0
				end

				return var_26_1.lock
			end)
		else
			table.sort(arg_25_0.rightListData_, function(arg_27_0, arg_27_1)
				local var_27_0 = PlayerData:GetSticker(arg_27_0)
				local var_27_1 = PlayerData:GetSticker(arg_27_1)

				if var_27_0.lock == var_27_1.lock then
					return arg_27_0 < arg_27_1
				end

				return var_27_1.lock
			end)
		end

		arg_25_0.stList_:StartScroll(#arg_25_0.rightListData_)
	elseif arg_25_1 == 2 then
		arg_25_0.rightListData_ = {}

		local var_25_2 = {}

		if arg_25_0.filterGetState_ == 0 then
			var_25_2 = PlayerData:GetStickerBgList(true)
		elseif arg_25_0.filterGetState_ == 1 then
			var_25_2 = PlayerData:GetStickerBgList()
		elseif arg_25_0.filterGetState_ == 2 then
			var_25_2 = PlayerData:GetStickerBgList(false, true)
		end

		if arg_25_0.filterState_ then
			for iter_25_2, iter_25_3 in pairs(var_25_2) do
				local var_25_3 = PlayerData:GetStickerBg(iter_25_3)

				if arg_25_0.filterMap_[var_25_3.suit] then
					table.insert(arg_25_0.rightListData_, iter_25_3)
				end
			end
		else
			arg_25_0.rightListData_ = var_25_2
		end

		local var_25_4 = GameSetting.sticker_background_default.value[1]

		if arg_25_0.filterDescendState_ then
			table.sort(arg_25_0.rightListData_, function(arg_28_0, arg_28_1)
				local var_28_0 = PlayerData:GetStickerBg(arg_28_0)
				local var_28_1 = PlayerData:GetStickerBg(arg_28_1)

				if var_28_0.lock == var_28_1.lock then
					if arg_28_0 == var_25_4 then
						return false
					end

					if arg_28_1 == var_25_4 then
						return true
					end

					return arg_28_1 < arg_28_0
				end

				return var_28_1.lock
			end)
		else
			table.sort(arg_25_0.rightListData_, function(arg_29_0, arg_29_1)
				local var_29_0 = PlayerData:GetStickerBg(arg_29_0)
				local var_29_1 = PlayerData:GetStickerBg(arg_29_1)

				if var_29_0.lock == var_29_1.lock then
					if arg_29_0 == var_25_4 then
						return true
					end

					if arg_29_1 == var_25_4 then
						return false
					end

					return arg_29_0 < arg_29_1
				end

				return var_29_1.lock
			end)
		end

		arg_25_0.bgList_:StartScroll(#arg_25_0.rightListData_)
	elseif arg_25_1 == 3 then
		arg_25_0.rightListData_ = {}

		local var_25_5 = {}

		if arg_25_0.filterGetState_ == 0 then
			var_25_5 = PlayerData:GetStickerFgList(true)
		elseif arg_25_0.filterGetState_ == 1 then
			var_25_5 = PlayerData:GetStickerFgList()
		elseif arg_25_0.filterGetState_ == 2 then
			var_25_5 = PlayerData:GetStickerFgList(false, true)
		end

		if arg_25_0.filterState_ then
			for iter_25_4, iter_25_5 in pairs(var_25_5) do
				local var_25_6 = PlayerData:GetStickerFg(iter_25_5)

				if arg_25_0.filterMap_[var_25_6.suit] then
					table.insert(arg_25_0.rightListData_, iter_25_5)
				end
			end
		else
			arg_25_0.rightListData_ = var_25_5
		end

		if arg_25_0.filterDescendState_ then
			table.sort(arg_25_0.rightListData_, function(arg_30_0, arg_30_1)
				local var_30_0 = PlayerData:GetStickerFg(arg_30_0)
				local var_30_1 = PlayerData:GetStickerFg(arg_30_1)

				if var_30_0.lock == var_30_1.lock then
					return arg_30_1 < arg_30_0
				end

				return var_30_1.lock
			end)
		else
			table.sort(arg_25_0.rightListData_, function(arg_31_0, arg_31_1)
				local var_31_0 = PlayerData:GetStickerFg(arg_31_0)
				local var_31_1 = PlayerData:GetStickerFg(arg_31_1)

				if var_31_0.lock == var_31_1.lock then
					return arg_31_0 < arg_31_1
				end

				return var_31_1.lock
			end)
		end

		arg_25_0.fgList_:StartScroll(#arg_25_0.rightListData_)
	end
end

function var_0_0.OnTop(arg_32_0)
	return
end

function var_0_0.OnExit(arg_33_0)
	manager.windowBar:HideBar()
	arg_33_0.collectController_:SetSelectedState("close")

	arg_33_0.filterDd_.value = 0
	arg_33_0.filterDescendState_ = true

	arg_33_0.sortController_:SetSelectedState("down")
	manager.redPoint:unbindUIandKey(arg_33_0.main1Btn_.transform, RedPointConst.CUSTOM_STICKER_SUIT_REWARD)
	manager.redPoint:unbindUIandKey(arg_33_0.main2Btn_.transform, RedPointConst.CUSTOM_STICKER_ROOT)
	manager.redPoint:unbindUIandKey(arg_33_0.sub1Btn_.transform, RedPointConst.CUSTOM_STICKER_ST)
	manager.redPoint:unbindUIandKey(arg_33_0.sub2Btn_.transform, RedPointConst.CUSTOM_STICKER_BG)
	manager.redPoint:unbindUIandKey(arg_33_0.sub3Btn_.transform, RedPointConst.CUSTOM_STICKER_FG)
end

function var_0_0.Dispose(arg_34_0)
	arg_34_0:RemoveAllListeners()
	arg_34_0.tabFilterPanel_:Dispose()
	arg_34_0.suitList_:Dispose()
	arg_34_0.stList_:Dispose()
	arg_34_0.fgList_:Dispose()
	arg_34_0.bgList_:Dispose()
	var_0_0.super.Dispose(arg_34_0)
end

return var_0_0
