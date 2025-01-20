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
end

function var_0_0.AddUIListeners(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.main1Btn_, nil, function()
		if arg_5_0.mainPageNum_ ~= 1 then
			PlayerData:ClearStickerCollectPageRedPoint(arg_5_0.subPageNum_)
			arg_5_0:RefreshMainPage(1)
		end
	end)
	arg_5_0:AddBtnListener(arg_5_0.main2Btn_, nil, function()
		if arg_5_0.mainPageNum_ ~= 2 then
			PlayerData:ClearStickerCollectPageRedPoint(0)
			arg_5_0:RefreshMainPage(2)
		end
	end)

	for iter_5_0 = 1, 3 do
		arg_5_0:AddBtnListener(arg_5_0["sub" .. iter_5_0 .. "Btn_"], nil, function()
			if arg_5_0.subPageNum_ ~= iter_5_0 then
				PlayerData:ClearStickerCollectPageRedPoint(arg_5_0.subPageNum_)
				arg_5_0:RefreshSubPage(iter_5_0)
			end
		end)
	end

	arg_5_0:AddBtnListener(arg_5_0.filterBtn_, nil, function()
		arg_5_0.tabFilterPanel_:OpenPanel()
	end)
	arg_5_0:AddBtnListener(arg_5_0.orderBtn_, nil, function()
		if arg_5_0.filterDescendState_ then
			arg_5_0.filterDescendState_ = false

			arg_5_0.sortController_:SetSelectedState("up")
			arg_5_0:RefreshSubPage(arg_5_0.subPageNum_)
		else
			arg_5_0.filterDescendState_ = true

			arg_5_0.sortController_:SetSelectedState("down")
			arg_5_0:RefreshSubPage(arg_5_0.subPageNum_)
		end
	end)
	arg_5_0:AddBtnListener(arg_5_0.tipsBtn_, nil, function()
		if arg_5_0.collectController_:GetSelectedState() == "close" then
			arg_5_0.collectController_:SetSelectedState("open")
		elseif arg_5_0.collectController_:GetSelectedState() == "open" then
			arg_5_0.collectController_:SetSelectedState("close")
		end
	end)
	arg_5_0:AddToggleListener(arg_5_0.filterDd_, function(arg_12_0)
		arg_5_0.filterGetState_ = arg_12_0

		arg_5_0:RefreshSubPage(arg_5_0.subPageNum_)
	end)
end

function var_0_0.IndexSuitItem(arg_13_0, arg_13_1, arg_13_2)
	arg_13_2:SetData(arg_13_0.rightListData_[arg_13_1])
end

function var_0_0.IndexListItem(arg_14_0, arg_14_1, arg_14_2)
	local var_14_0 = ProfileDecorateItemCfg[arg_14_0.rightListData_[arg_14_1]]
	local var_14_1 = false
	local var_14_2 = false
	local var_14_3 = true
	local var_14_4 = false
	local var_14_5

	if arg_14_0.subPageNum_ == 1 then
		var_14_4 = PlayerData:GetSticker(arg_14_0.rightListData_[arg_14_1]).lock

		function var_14_5()
			JumpTools.OpenPageByJump("customStickerCollectPop", {
				stickerID = var_14_0.id
			})
		end
	elseif arg_14_0.subPageNum_ == 2 then
		var_14_4 = PlayerData:GetStickerBg(arg_14_0.rightListData_[arg_14_1]).lock

		function var_14_5()
			JumpTools.OpenPageByJump("customStickerCollectPop", {
				stickerID = var_14_0.id
			})
		end
	elseif arg_14_0.subPageNum_ == 3 then
		var_14_4 = PlayerData:GetStickerFg(arg_14_0.rightListData_[arg_14_1]).lock

		function var_14_5()
			JumpTools.OpenPageByJump("customStickerCollectPop", {
				stickerID = var_14_0.id
			})
		end
	end

	local var_14_6 = false

	arg_14_2:SetData(var_14_0, var_14_1, var_14_2, var_14_3, var_14_4, var_14_6, var_14_5, true)
end

function var_0_0.OnEnter(arg_18_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR
	})

	arg_18_0.filterMap_ = {}
	arg_18_0.filterState_ = false

	arg_18_0.colorController_:SetSelectedState("normal")
	arg_18_0.tabFilterPanel_:SetData(StickerSuitCfg.all, function(arg_19_0, arg_19_1)
		arg_18_0.filterMap_ = arg_19_0
		arg_18_0.filterState_ = not arg_19_1

		arg_18_0.colorController_:SetSelectedState(arg_18_0.filterState_ and "orange" or "normal")
		arg_18_0:RefreshSubPage(arg_18_0.subPageNum_)
	end)
	arg_18_0:RefreshMainPage(1)
	arg_18_0:RefreshCollectTips()
	manager.redPoint:bindUIandKey(arg_18_0.main1Btn_.transform, RedPointConst.CUSTOM_STICKER_SUIT_REWARD)
	manager.redPoint:bindUIandKey(arg_18_0.main2Btn_.transform, RedPointConst.CUSTOM_STICKER_CATEGORY)
	manager.redPoint:bindUIandKey(arg_18_0.sub1Btn_.transform, RedPointConst.CUSTOM_STICKER_ST)
	manager.redPoint:bindUIandKey(arg_18_0.sub2Btn_.transform, RedPointConst.CUSTOM_STICKER_BG)
	manager.redPoint:bindUIandKey(arg_18_0.sub3Btn_.transform, RedPointConst.CUSTOM_STICKER_FG)
end

function var_0_0.RefreshCollectTips(arg_20_0)
	local var_20_0 = #PlayerData:GetStickerList(true)
	local var_20_1 = #PlayerData:GetStickerList()
	local var_20_2 = #PlayerData:GetStickerBgList(true)
	local var_20_3 = #PlayerData:GetStickerBgList()
	local var_20_4 = #PlayerData:GetStickerFgList(true)
	local var_20_5 = #PlayerData:GetStickerFgList()

	arg_20_0.stNumText_.text = var_20_1 .. "/" .. var_20_0
	arg_20_0.bgNumText_.text = var_20_3 .. "/" .. var_20_2
	arg_20_0.fgNumText_.text = var_20_5 .. "/" .. var_20_4
	arg_20_0.percentText_.text = math.floor((var_20_1 + var_20_3 + var_20_5) / (var_20_0 + var_20_2 + var_20_4) * 100) .. "%"
	arg_20_0.progressText_.text = var_20_1 + var_20_3 + var_20_5 .. "/" .. var_20_0 + var_20_2 + var_20_4
end

function var_0_0.RefreshMainPage(arg_21_0, arg_21_1)
	arg_21_0.mainPageNum_ = arg_21_1

	arg_21_0.mainTabController_:SetSelectedState(tostring(arg_21_1))

	if arg_21_1 == 1 then
		arg_21_0.rightListData_ = StickerSuitCfg.all

		table.sort(arg_21_0.rightListData_, function(arg_22_0, arg_22_1)
			return arg_22_1 < arg_22_0
		end)
		arg_21_0.suitList_:StartScroll(#arg_21_0.rightListData_)
	elseif arg_21_1 == 2 then
		arg_21_0:RefreshSubPage(1)
	end
end

function var_0_0.RefreshSubPage(arg_23_0, arg_23_1)
	arg_23_0.subPageNum_ = arg_23_1

	arg_23_0.subTabController_:SetSelectedState(tostring(arg_23_1))

	if arg_23_1 == 1 then
		arg_23_0.rightListData_ = {}

		local var_23_0 = {}

		if arg_23_0.filterGetState_ == 0 then
			var_23_0 = PlayerData:GetStickerList(true)
		elseif arg_23_0.filterGetState_ == 1 then
			var_23_0 = PlayerData:GetStickerList()
		elseif arg_23_0.filterGetState_ == 2 then
			var_23_0 = PlayerData:GetStickerList(false, true)
		end

		if arg_23_0.filterState_ then
			for iter_23_0, iter_23_1 in pairs(var_23_0) do
				local var_23_1 = PlayerData:GetSticker(iter_23_1)

				if arg_23_0.filterMap_[var_23_1.suit] then
					table.insert(arg_23_0.rightListData_, iter_23_1)
				end
			end
		else
			arg_23_0.rightListData_ = var_23_0
		end

		if arg_23_0.filterDescendState_ then
			table.sort(arg_23_0.rightListData_, function(arg_24_0, arg_24_1)
				local var_24_0 = PlayerData:GetSticker(arg_24_0)
				local var_24_1 = PlayerData:GetSticker(arg_24_1)

				if var_24_0.lock == var_24_1.lock then
					return arg_24_1 < arg_24_0
				end

				return var_24_1.lock
			end)
		else
			table.sort(arg_23_0.rightListData_, function(arg_25_0, arg_25_1)
				local var_25_0 = PlayerData:GetSticker(arg_25_0)
				local var_25_1 = PlayerData:GetSticker(arg_25_1)

				if var_25_0.lock == var_25_1.lock then
					return arg_25_0 < arg_25_1
				end

				return var_25_1.lock
			end)
		end

		arg_23_0.stList_:StartScroll(#arg_23_0.rightListData_)
	elseif arg_23_1 == 2 then
		arg_23_0.rightListData_ = {}

		local var_23_2 = {}

		if arg_23_0.filterGetState_ == 0 then
			var_23_2 = PlayerData:GetStickerBgList(true)
		elseif arg_23_0.filterGetState_ == 1 then
			var_23_2 = PlayerData:GetStickerBgList()
		elseif arg_23_0.filterGetState_ == 2 then
			var_23_2 = PlayerData:GetStickerBgList(false, true)
		end

		if arg_23_0.filterState_ then
			for iter_23_2, iter_23_3 in pairs(var_23_2) do
				local var_23_3 = PlayerData:GetStickerBg(iter_23_3)

				if arg_23_0.filterMap_[var_23_3.suit] then
					table.insert(arg_23_0.rightListData_, iter_23_3)
				end
			end
		else
			arg_23_0.rightListData_ = var_23_2
		end

		local var_23_4 = GameSetting.sticker_background_default.value[1]

		if arg_23_0.filterDescendState_ then
			table.sort(arg_23_0.rightListData_, function(arg_26_0, arg_26_1)
				local var_26_0 = PlayerData:GetStickerBg(arg_26_0)
				local var_26_1 = PlayerData:GetStickerBg(arg_26_1)

				if var_26_0.lock == var_26_1.lock then
					if arg_26_0 == var_23_4 then
						return false
					end

					if arg_26_1 == var_23_4 then
						return true
					end

					return arg_26_1 < arg_26_0
				end

				return var_26_1.lock
			end)
		else
			table.sort(arg_23_0.rightListData_, function(arg_27_0, arg_27_1)
				local var_27_0 = PlayerData:GetStickerBg(arg_27_0)
				local var_27_1 = PlayerData:GetStickerBg(arg_27_1)

				if var_27_0.lock == var_27_1.lock then
					if arg_27_0 == var_23_4 then
						return true
					end

					if arg_27_1 == var_23_4 then
						return false
					end

					return arg_27_0 < arg_27_1
				end

				return var_27_1.lock
			end)
		end

		arg_23_0.bgList_:StartScroll(#arg_23_0.rightListData_)
	elseif arg_23_1 == 3 then
		arg_23_0.rightListData_ = {}

		local var_23_5 = {}

		if arg_23_0.filterGetState_ == 0 then
			var_23_5 = PlayerData:GetStickerFgList(true)
		elseif arg_23_0.filterGetState_ == 1 then
			var_23_5 = PlayerData:GetStickerFgList()
		elseif arg_23_0.filterGetState_ == 2 then
			var_23_5 = PlayerData:GetStickerFgList(false, true)
		end

		if arg_23_0.filterState_ then
			for iter_23_4, iter_23_5 in pairs(var_23_5) do
				local var_23_6 = PlayerData:GetStickerFg(iter_23_5)

				if arg_23_0.filterMap_[var_23_6.suit] then
					table.insert(arg_23_0.rightListData_, iter_23_5)
				end
			end
		else
			arg_23_0.rightListData_ = var_23_5
		end

		if arg_23_0.filterDescendState_ then
			table.sort(arg_23_0.rightListData_, function(arg_28_0, arg_28_1)
				local var_28_0 = PlayerData:GetStickerFg(arg_28_0)
				local var_28_1 = PlayerData:GetStickerFg(arg_28_1)

				if var_28_0.lock == var_28_1.lock then
					return arg_28_1 < arg_28_0
				end

				return var_28_1.lock
			end)
		else
			table.sort(arg_23_0.rightListData_, function(arg_29_0, arg_29_1)
				local var_29_0 = PlayerData:GetStickerFg(arg_29_0)
				local var_29_1 = PlayerData:GetStickerFg(arg_29_1)

				if var_29_0.lock == var_29_1.lock then
					return arg_29_0 < arg_29_1
				end

				return var_29_1.lock
			end)
		end

		arg_23_0.fgList_:StartScroll(#arg_23_0.rightListData_)
	end
end

function var_0_0.OnTop(arg_30_0)
	return
end

function var_0_0.OnExit(arg_31_0)
	manager.windowBar:HideBar()
	arg_31_0.collectController_:SetSelectedState("close")

	arg_31_0.filterDd_.value = 0
	arg_31_0.filterDescendState_ = true

	arg_31_0.sortController_:SetSelectedState("down")
	manager.redPoint:unbindUIandKey(arg_31_0.main1Btn_.transform, RedPointConst.CUSTOM_STICKER_SUIT_REWARD)
	manager.redPoint:unbindUIandKey(arg_31_0.main2Btn_.transform, RedPointConst.CUSTOM_STICKER_CATEGORY)
	manager.redPoint:unbindUIandKey(arg_31_0.sub1Btn_.transform, RedPointConst.CUSTOM_STICKER_ST)
	manager.redPoint:unbindUIandKey(arg_31_0.sub2Btn_.transform, RedPointConst.CUSTOM_STICKER_BG)
	manager.redPoint:unbindUIandKey(arg_31_0.sub3Btn_.transform, RedPointConst.CUSTOM_STICKER_FG)
end

function var_0_0.Dispose(arg_32_0)
	arg_32_0:RemoveAllListeners()
	arg_32_0.tabFilterPanel_:Dispose()
	arg_32_0.suitList_:Dispose()
	arg_32_0.stList_:Dispose()
	arg_32_0.fgList_:Dispose()
	arg_32_0.bgList_:Dispose()
	var_0_0.super.Dispose(arg_32_0)
end

return var_0_0
