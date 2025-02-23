local var_0_0 = class("CustomStickerEditView", ReduxView)

local function var_0_1(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	local var_1_0 = math.sqrt(arg_1_0 * arg_1_0 + arg_1_1 * arg_1_1)

	if var_1_0 > 1e-05 then
		arg_1_0 = arg_1_0 / var_1_0
		arg_1_1 = arg_1_1 / var_1_0
	else
		arg_1_0, arg_1_1 = 0, 0
	end

	local var_1_1 = math.sqrt(arg_1_2 * arg_1_2 + arg_1_3 * arg_1_3)

	if var_1_1 > 1e-05 then
		arg_1_2 = arg_1_2 / var_1_1
		arg_1_3 = arg_1_3 / var_1_1
	else
		arg_1_2, arg_1_3 = 0, 0
	end

	local var_1_2 = arg_1_0 * arg_1_2 + arg_1_1 * arg_1_3

	if var_1_2 < -1 then
		var_1_2 = -1
	elseif var_1_2 > 1 then
		var_1_2 = 1
	end

	return math.acos(var_1_2) * 57.29578
end

function var_0_0.UIName(arg_2_0)
	return "Widget/System/UserInfor/sticker_new/StickerEditUI"
end

function var_0_0.UIParent(arg_3_0)
	return manager.ui.uiMain.transform
end

function var_0_0.Init(arg_4_0)
	arg_4_0:InitUI()
	arg_4_0:AddUIListeners()
end

function var_0_0.InitUI(arg_5_0)
	arg_5_0:BindCfgUI()

	arg_5_0.MaxScaleNum = GameSetting.sticker_scaling.value[2]
	arg_5_0.MinScaleNum = GameSetting.sticker_scaling.value[1]
	arg_5_0.MaxStickerNum = GameSetting.sticker_display_num_max.value[1]
	arg_5_0.curPageNum_ = 1
	arg_5_0.maxPageNum_ = 1
	arg_5_0.curTab_ = 1
	arg_5_0.curDynamicFg_ = nil
	arg_5_0.curDynamicBg_ = nil
	arg_5_0.curDynamicTopBg_ = nil
	arg_5_0.coordinateX_ = 0
	arg_5_0.coordinateY_ = 0
	arg_5_0.selecting_ = false
	arg_5_0.selectingIdx_ = 0
	arg_5_0.stickerItemPool_ = {}
	arg_5_0.poolTailPoint_ = 0
	arg_5_0.deleteNum_ = 0
	arg_5_0.beginDragPos_ = nil
	arg_5_0.beginStickerPos_ = {}
	arg_5_0.rotateVector_ = {}
	arg_5_0.beginStickerAngleZ_ = nil
	arg_5_0.beginStickerScale_ = nil
	arg_5_0.beginStickerSize_ = {}
	arg_5_0.tabFilterPanel_ = CustomStickerFilterPanel.New(arg_5_0.filterPanelGo_)
	arg_5_0.tabFilterData_ = {}
	arg_5_0.allOriStickerData_ = {
		{},
		{}
	}
	arg_5_0.filterMap_ = {}
	arg_5_0.filterState_ = false
	arg_5_0.stTabList_ = LuaList.New(handler(arg_5_0, arg_5_0.IndexTabItem), arg_5_0.stUIList_, CustomStickerListItem)
	arg_5_0.fgTabList_ = LuaList.New(handler(arg_5_0, arg_5_0.IndexTabItem), arg_5_0.fgUIList_, CustomStickerListItem)
	arg_5_0.tabController_ = arg_5_0.mainControllerEx_:GetController("tab")
	arg_5_0.favoriteController_ = arg_5_0.mainControllerEx_:GetController("favorite")
	arg_5_0.colorController_ = arg_5_0.filterController_:GetController("color")

	arg_5_0:AdaptScene()
end

function var_0_0.AdaptScene(arg_6_0)
	local var_6_0 = manager.ui:GetCanvasSize()

	arg_6_0.coordinateX_ = var_6_0.x
	arg_6_0.coordinateY_ = var_6_0.y

	arg_6_0.adaptMaskTrs_:SetSizeDeltaEx(arg_6_0.coordinateX_, arg_6_0.coordinateY_)
	arg_6_0.adaptPaperTrs_:SetSizeDeltaEx(arg_6_0.coordinateX_ * 0.6 + 200, arg_6_0.coordinateY_ * 0.6 + 200)
end

function var_0_0.AddUIListeners(arg_7_0)
	arg_7_0:AddBtnListener(arg_7_0.stBtn_, nil, function()
		if arg_7_0.curTab_ ~= 1 then
			arg_7_0:RefreshTab(1)
		end
	end)
	arg_7_0:AddBtnListener(arg_7_0.fgBtn_, nil, function()
		if arg_7_0.curTab_ ~= 2 then
			arg_7_0:RefreshTab(2)
		end
	end)
	arg_7_0:AddBtnListener(arg_7_0.filterBtn_, nil, function()
		arg_7_0.tabFilterPanel_:OpenPanel()
	end)
	arg_7_0:AddBtnListener(arg_7_0.prePageBtn_, nil, function()
		if arg_7_0.curPageNum_ > 1 then
			arg_7_0.curPageNum_ = arg_7_0.curPageNum_ - 1

			arg_7_0:UpdateView()
		end
	end)
	arg_7_0:AddBtnListener(arg_7_0.nextPageBtn_, nil, function()
		if arg_7_0.curPageNum_ < arg_7_0.maxPageNum_ then
			arg_7_0.curPageNum_ = arg_7_0.curPageNum_ + 1

			arg_7_0:UpdateView()
		end
	end)
	arg_7_0:AddBtnListener(arg_7_0.favoriteBtn_, nil, function()
		if PlayerData:GetStickerShowID() ~= arg_7_0.bgData_[arg_7_0.curPageNum_] then
			ShowMessageBox({
				title = GetTips("PROMPT"),
				content = GetTips("STICKER_EXHIBITION_CONFIRM"),
				OkCallback = function()
					PlayerAction.SyncStickerShowToServer(arg_7_0.bgData_[arg_7_0.curPageNum_])
					arg_7_0.favoriteController_:SetSelectedState("star")
				end,
				CancelCallback = function()
					return
				end
			})
		end
	end)
	arg_7_0.moveTrigger_:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.BeginDrag, LuaHelper.EventTriggerAction1(function(arg_16_0, arg_16_1)
		if arg_7_0.beginDragPos_ == nil then
			arg_7_0.beginDragPos_ = LuaHelper.ScreenToLocal(arg_7_0.stPanelTrs_, arg_16_1.position, manager.ui.uiCamera)
			arg_7_0.beginStickerPos_.x = arg_7_0.selecting_.rectTransform_:GetAnchoredPositionX(nil)
			arg_7_0.beginStickerPos_.y = arg_7_0.selecting_.rectTransform_:GetAnchoredPositionY(nil)
		end
	end))
	arg_7_0.moveTrigger_:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.Drag, LuaHelper.EventTriggerAction1(function(arg_17_0, arg_17_1)
		if arg_7_0.beginDragPos_ ~= nil then
			local var_17_0 = LuaHelper.ScreenToLocal(arg_7_0.stPanelTrs_, arg_17_1.position, manager.ui.uiCamera)

			arg_7_0.movePanelTrs_:SetAnchoredPositionEx(math.min(math.max(var_17_0.x - arg_7_0.beginDragPos_.x + arg_7_0.beginStickerPos_.x, 0), arg_7_0.coordinateX_), math.min(math.max(var_17_0.y - arg_7_0.beginDragPos_.y + arg_7_0.beginStickerPos_.y, 0), arg_7_0.coordinateY_))
			arg_7_0.selecting_.rectTransform_:SetAnchoredPositionEx(math.min(math.max(var_17_0.x - arg_7_0.beginDragPos_.x + arg_7_0.beginStickerPos_.x, 0), arg_7_0.coordinateX_), math.min(math.max(var_17_0.y - arg_7_0.beginDragPos_.y + arg_7_0.beginStickerPos_.y, 0), arg_7_0.coordinateY_))
		end
	end))
	arg_7_0.moveTrigger_:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.EndDrag, LuaHelper.EventTriggerAction1(function(arg_18_0, arg_18_1)
		if arg_7_0.beginDragPos_ ~= nil then
			if arg_7_0.selecting_ then
				arg_7_0.pageData_[arg_7_0.bgData_[arg_7_0.curPageNum_]].sticker[arg_7_0.selecting_.ID_].positionX = math.floor(arg_7_0.selecting_.rectTransform_:GetAnchoredPositionX(nil) / arg_7_0.coordinateX_ * 10000)
				arg_7_0.pageData_[arg_7_0.bgData_[arg_7_0.curPageNum_]].sticker[arg_7_0.selecting_.ID_].positionY = math.floor(arg_7_0.selecting_.rectTransform_:GetAnchoredPositionY(nil) / arg_7_0.coordinateY_ * 10000)
				arg_7_0.changePageID_[arg_7_0.bgData_[arg_7_0.curPageNum_]] = true
			end

			arg_7_0.beginDragPos_ = nil
		end
	end))
	arg_7_0.rotateTrigger_:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.BeginDrag, LuaHelper.EventTriggerAction1(function(arg_19_0, arg_19_1)
		if arg_7_0.beginDragPos_ == nil then
			arg_7_0.beginDragPos_ = LuaHelper.ScreenToLocal(arg_7_0.stPanelTrs_, arg_19_1.position, manager.ui.uiCamera)
			arg_7_0.rotateVector_.x = arg_7_0.coordinateX_ / 2 - arg_7_0.selecting_.rectTransform_:GetAnchoredPositionX(nil)
			arg_7_0.rotateVector_.y = arg_7_0.coordinateY_ / 2 - arg_7_0.selecting_.rectTransform_:GetAnchoredPositionY(nil)
			arg_7_0.beginStickerPos_.x = arg_7_0.beginDragPos_.x + arg_7_0.rotateVector_.x
			arg_7_0.beginStickerPos_.y = arg_7_0.beginDragPos_.y + arg_7_0.rotateVector_.y
			arg_7_0.beginStickerAngleZ_ = arg_7_0.selecting_.rectTransform_:GetLocalEulerAngleZ()
			arg_7_0.beginStickerScale_ = arg_7_0.selecting_.rectTransform_:GetLocalScaleX()

			local var_19_0 = arg_7_0.selecting_.outlineRect_.sizeDelta * arg_7_0.selecting_.outlineRect_:GetLocalScaleX()

			arg_7_0.beginStickerSize_.x = var_19_0.x
			arg_7_0.beginStickerSize_.y = var_19_0.y
		end
	end))
	arg_7_0.rotateTrigger_:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.Drag, LuaHelper.EventTriggerAction1(function(arg_20_0, arg_20_1)
		if arg_7_0.beginDragPos_ ~= nil then
			local var_20_0 = LuaHelper.ScreenToLocal(arg_7_0.stPanelTrs_, arg_20_1.position, manager.ui.uiCamera)
			local var_20_1 = var_20_0.x + arg_7_0.rotateVector_.x
			local var_20_2 = var_20_0.y + arg_7_0.rotateVector_.y
			local var_20_3 = var_0_1(arg_7_0.beginStickerPos_.x, arg_7_0.beginStickerPos_.y, var_20_1, var_20_2)

			if arg_7_0.beginStickerPos_.x * var_20_2 - arg_7_0.beginStickerPos_.y * var_20_1 > 0 then
				arg_7_0.selecting_.rectTransform_:SetLocalEulerAngleZ(arg_7_0.beginStickerAngleZ_ + var_20_3)
				arg_7_0.movePanelTrs_:SetLocalEulerAngleZ(arg_7_0.beginStickerAngleZ_ + var_20_3)
			else
				arg_7_0.selecting_.rectTransform_:SetLocalEulerAngleZ(arg_7_0.beginStickerAngleZ_ - var_20_3)
				arg_7_0.movePanelTrs_:SetLocalEulerAngleZ(arg_7_0.beginStickerAngleZ_ - var_20_3)
			end

			local var_20_4 = math.sqrt((var_20_1 * var_20_1 + var_20_2 * var_20_2) / (arg_7_0.beginStickerPos_.x * arg_7_0.beginStickerPos_.x + arg_7_0.beginStickerPos_.y * arg_7_0.beginStickerPos_.y))

			arg_7_0.selecting_.rectTransform_:SetLocalScaleVal(math.min(math.max(arg_7_0.beginStickerScale_ * var_20_4, arg_7_0.MinScaleNum), arg_7_0.MaxScaleNum))
			arg_7_0.movePanelTrs_:SetSizeDeltaEx(math.min(math.max(arg_7_0.beginStickerScale_ * var_20_4, arg_7_0.MinScaleNum), arg_7_0.MaxScaleNum) * arg_7_0.beginStickerSize_.x, math.min(math.max(arg_7_0.beginStickerScale_ * var_20_4, arg_7_0.MinScaleNum), arg_7_0.MaxScaleNum) * arg_7_0.beginStickerSize_.y)
		end
	end))
	arg_7_0.rotateTrigger_:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.EndDrag, LuaHelper.EventTriggerAction1(function(arg_21_0, arg_21_1)
		if arg_7_0.beginDragPos_ ~= nil then
			if arg_7_0.selecting_ then
				arg_7_0.pageData_[arg_7_0.bgData_[arg_7_0.curPageNum_]].sticker[arg_7_0.selecting_.ID_].rotation = math.floor(arg_7_0.selecting_.rectTransform_:GetLocalEulerAngleZ() % 360 / 360 * 10000)
				arg_7_0.pageData_[arg_7_0.bgData_[arg_7_0.curPageNum_]].sticker[arg_7_0.selecting_.ID_].scale = math.floor(arg_7_0.selecting_.rectTransform_:GetLocalScaleX() / arg_7_0.MaxScaleNum * 10000)
				arg_7_0.changePageID_[arg_7_0.bgData_[arg_7_0.curPageNum_]] = true
			end

			arg_7_0.beginDragPos_ = nil
		end
	end))
	arg_7_0:AddBtnListener(arg_7_0.deleteBtn_, nil, function()
		if arg_7_0.selecting_ then
			SetActive(arg_7_0.selecting_.gameObject_, false)

			if arg_7_0.curTab_ == 1 then
				local var_22_0 = table.keyof(arg_7_0.tabFilterData_, arg_7_0.selecting_.ID_)

				if var_22_0 and var_22_0 > 0 then
					local var_22_1 = arg_7_0.stTabList_:GetItemByIndex(var_22_0)

					if var_22_1 then
						var_22_1:SetUse(false)
					end
				end
			end

			PlayerData:SetStickerPage(arg_7_0.selecting_.ID_, 0)

			arg_7_0.pageData_[arg_7_0.bgData_[arg_7_0.curPageNum_]].sticker[arg_7_0.selecting_.ID_] = nil

			local var_22_2 = {}

			for iter_22_0, iter_22_1 in ipairs(arg_7_0.pageData_[arg_7_0.bgData_[arg_7_0.curPageNum_]].hierarchy) do
				if iter_22_1 ~= arg_7_0.selecting_.ID_ then
					table.insert(var_22_2, iter_22_1)
				end
			end

			arg_7_0.pageData_[arg_7_0.bgData_[arg_7_0.curPageNum_]].hierarchy = var_22_2
			arg_7_0.changePageID_[arg_7_0.bgData_[arg_7_0.curPageNum_]] = true
			arg_7_0.deleteNum_ = arg_7_0.deleteNum_ + 1
			arg_7_0.stNumText_.text = arg_7_0.poolTailPoint_ - arg_7_0.deleteNum_ .. "/" .. arg_7_0.MaxStickerNum
			arg_7_0.selecting_ = nil
			arg_7_0.selectingIdx_ = 0

			SetActive(arg_7_0.movePanelTrs_.gameObject, false)
			SetActive(arg_7_0.cancelBtn_.gameObject, false)
		end
	end)
	arg_7_0:AddBtnListener(arg_7_0.cancelBtn_, nil, function()
		if arg_7_0.selecting_ then
			arg_7_0.selecting_ = nil
			arg_7_0.selectingIdx_ = 0

			SetActive(arg_7_0.movePanelTrs_.gameObject, false)
			SetActive(arg_7_0.cancelBtn_.gameObject, false)
		end
	end)
	arg_7_0:AddBtnListener(arg_7_0.clearBtn_, nil, function()
		ShowMessageBox({
			title = GetTips("PROMPT"),
			content = GetTips("STICKER_ONE_CLICK_CLEARING"),
			OkCallback = function()
				for iter_25_0, iter_25_1 in pairs(arg_7_0.pageData_[arg_7_0.bgData_[arg_7_0.curPageNum_]].sticker) do
					PlayerData:SetStickerPage(iter_25_0, 0)

					arg_7_0.pageData_[arg_7_0.bgData_[arg_7_0.curPageNum_]].sticker[iter_25_0] = nil
				end

				PlayerData:SetStickerFgPage(arg_7_0.pageData_[arg_7_0.bgData_[arg_7_0.curPageNum_]].foreground, 0)

				arg_7_0.pageData_[arg_7_0.bgData_[arg_7_0.curPageNum_]].foreground = 0
				arg_7_0.pageData_[arg_7_0.bgData_[arg_7_0.curPageNum_]].hierarchy = {}
				arg_7_0.changePageID_[arg_7_0.bgData_[arg_7_0.curPageNum_]] = true

				arg_7_0:UpdateView()
			end,
			CancelCallback = function()
				return
			end
		})
	end)
end

function var_0_0.IndexTabItem(arg_27_0, arg_27_1, arg_27_2)
	local var_27_0 = ProfileDecorateItemCfg[arg_27_0.tabFilterData_[arg_27_1]]
	local var_27_1 = false
	local var_27_2 = arg_27_0.curTab_ == 1 and PlayerData:GetSticker(arg_27_0.tabFilterData_[arg_27_1]) or PlayerData:GetStickerFg(arg_27_0.tabFilterData_[arg_27_1])
	local var_27_3 = var_27_2.page == arg_27_0.bgData_[arg_27_0.curPageNum_]
	local var_27_4 = false
	local var_27_5 = false
	local var_27_6 = false
	local var_27_7 = table.keyof(arg_27_0.bgData_, var_27_2.page) or 0

	arg_27_2:SetData(var_27_0, var_27_1, var_27_3, var_27_4, var_27_5, var_27_6, function()
		if arg_27_0.curTab_ == 1 and arg_27_0.poolTailPoint_ - arg_27_0.deleteNum_ >= arg_27_0.MaxStickerNum then
			ShowTips("STICKER_PAGE_LIMIT_COUNT")

			return
		end

		if var_27_2.page == 0 then
			arg_27_2:SetUse(true, arg_27_0.curPageNum_)

			if arg_27_0.curTab_ == 1 then
				var_27_2.page = arg_27_0.bgData_[arg_27_0.curPageNum_]

				PlayerData:SetStickerPage(arg_27_2.ID_, arg_27_0.bgData_[arg_27_0.curPageNum_])

				arg_27_0.pageData_[arg_27_0.bgData_[arg_27_0.curPageNum_]].sticker[arg_27_2.ID_] = {
					positionY = 5000,
					rotation = 0,
					positionX = 5000,
					scale = 10000 / arg_27_0.MaxScaleNum
				}

				table.insert(arg_27_0.pageData_[arg_27_0.bgData_[arg_27_0.curPageNum_]].hierarchy, arg_27_2.ID_)

				arg_27_0.changePageID_[arg_27_0.bgData_[arg_27_0.curPageNum_]] = true
				arg_27_0.poolTailPoint_ = arg_27_0.poolTailPoint_ + 1
				arg_27_0.stNumText_.text = arg_27_0.poolTailPoint_ - arg_27_0.deleteNum_ .. "/" .. arg_27_0.MaxStickerNum

				local var_28_0 = arg_27_0.poolTailPoint_

				if var_28_0 > #arg_27_0.stickerItemPool_ then
					local var_28_1 = Object.Instantiate(arg_27_0.stMoveGo_, arg_27_0.stPanelTrs_)

					arg_27_0.stickerItemPool_[var_28_0] = CustomStickerMoveItem.New(var_28_1)
				end

				SetActive(arg_27_0.stickerItemPool_[var_28_0].gameObject_, true)
				arg_27_0.stickerItemPool_[var_28_0].rectTransform_:SetAnchoredPositionEx(arg_27_0.coordinateX_ / 2, arg_27_0.coordinateY_ / 2)
				arg_27_0.stickerItemPool_[var_28_0].rectTransform_:SetLocalEulerAngleZ(0)
				arg_27_0.stickerItemPool_[var_28_0].rectTransform_:SetLocalScaleVal(1)
				arg_27_0.stickerItemPool_[var_28_0]:SetData(var_27_0, function()
					if arg_27_0.selectingIdx_ ~= var_28_0 then
						arg_27_0.selectingIdx_ = var_28_0
						arg_27_0.selecting_ = arg_27_0.stickerItemPool_[var_28_0]

						arg_27_0.selecting_.rectTransform_:SetAsLastSibling()

						local var_29_0 = {}

						for iter_29_0, iter_29_1 in ipairs(arg_27_0.pageData_[arg_27_0.bgData_[arg_27_0.curPageNum_]].hierarchy) do
							if iter_29_1 ~= arg_27_0.selecting_.ID_ then
								table.insert(var_29_0, iter_29_1)
							end
						end

						table.insert(var_29_0, arg_27_0.selecting_.ID_)

						arg_27_0.pageData_[arg_27_0.bgData_[arg_27_0.curPageNum_]].hierarchy = var_29_0
						arg_27_0.changePageID_[arg_27_0.bgData_[arg_27_0.curPageNum_]] = true

						arg_27_0.movePanelTrs_:SetAnchoredPosition(arg_27_0.selecting_.rectTransform_.anchoredPosition)
						arg_27_0.movePanelTrs_:SetSizeDelta(arg_27_0.selecting_.outlineRect_.sizeDelta * arg_27_0.selecting_.outlineRect_:GetLocalScaleX() * arg_27_0.selecting_.rectTransform_:GetLocalScaleX())
						arg_27_0.movePanelTrs_:SetLocalEulerAngleZ(arg_27_0.selecting_.rectTransform_:GetLocalEulerAngleZ())
						SetActive(arg_27_0.movePanelTrs_.gameObject, true)
						SetActive(arg_27_0.cancelBtn_.gameObject, true)
					end
				end)

				arg_27_0.selectingIdx_ = var_28_0
				arg_27_0.selecting_ = arg_27_0.stickerItemPool_[var_28_0]

				arg_27_0.selecting_.rectTransform_:SetAsLastSibling()
				arg_27_0.movePanelTrs_:SetAnchoredPosition(arg_27_0.selecting_.rectTransform_.anchoredPosition)
				arg_27_0.movePanelTrs_:SetSizeDelta(arg_27_0.selecting_.outlineRect_.sizeDelta * arg_27_0.selecting_.outlineRect_:GetLocalScaleX() * arg_27_0.selecting_.rectTransform_:GetLocalScaleX())
				arg_27_0.movePanelTrs_:SetLocalEulerAngleZ(arg_27_0.selecting_.rectTransform_:GetLocalEulerAngleZ())
				SetActive(arg_27_0.movePanelTrs_.gameObject, true)
				SetActive(arg_27_0.cancelBtn_.gameObject, true)
			elseif arg_27_0.curTab_ == 2 then
				var_27_2.page = arg_27_0.bgData_[arg_27_0.curPageNum_]

				PlayerData:SetStickerFgPage(arg_27_2.ID_, arg_27_0.bgData_[arg_27_0.curPageNum_])

				arg_27_0.pageData_[arg_27_0.bgData_[arg_27_0.curPageNum_]].foreground = arg_27_2.ID_
				arg_27_0.changePageID_[arg_27_0.bgData_[arg_27_0.curPageNum_]] = true

				arg_27_0:DestroyDynamicFg()

				if var_27_0.type == 1 then
					arg_27_0.fgStaticImg_.spriteAsync = "TextureConfig/Sticker/Foreground_l/Stickerfg_l_" .. var_27_0.resource
					arg_27_0.fgStaticImg_.enabled = true
				elseif var_27_0.type == 2 then
					arg_27_0.curDynamicFg_ = Object.Instantiate(Asset.Load("Widget/System/UserInfor/sticker_new/dynamicitem/Foreground/Foregrounditem_" .. var_27_0.resource), arg_27_0.fgDynamicTrs_)
					arg_27_0.fgStaticImg_.enabled = false
				end
			end
		elseif var_27_2.page ~= arg_27_0.bgData_[arg_27_0.curPageNum_] then
			ShowMessageBox({
				title = GetTips("PROMPT"),
				content = GetTips("STICKER_SWITCH_PAGES"),
				OkCallback = function()
					arg_27_2:SetUse(true, arg_27_0.curPageNum_)

					if arg_27_0.curTab_ == 1 then
						arg_27_0.pageData_[var_27_2.page].sticker[arg_27_2.ID_] = nil

						local var_30_0 = {}

						for iter_30_0, iter_30_1 in ipairs(arg_27_0.pageData_[var_27_2.page].hierarchy) do
							if iter_30_1 ~= arg_27_2.ID_ then
								table.insert(var_30_0, iter_30_1)
							end
						end

						arg_27_0.pageData_[var_27_2.page].hierarchy = var_30_0
						arg_27_0.changePageID_[var_27_2.page] = true
						var_27_2.page = arg_27_0.bgData_[arg_27_0.curPageNum_]

						PlayerData:SetStickerPage(arg_27_2.ID_, arg_27_0.bgData_[arg_27_0.curPageNum_])

						arg_27_0.pageData_[arg_27_0.bgData_[arg_27_0.curPageNum_]].sticker[arg_27_2.ID_] = {
							positionY = 5000,
							rotation = 0,
							positionX = 5000,
							scale = 10000 / arg_27_0.MaxScaleNum
						}

						table.insert(arg_27_0.pageData_[arg_27_0.bgData_[arg_27_0.curPageNum_]].hierarchy, arg_27_2.ID_)

						arg_27_0.changePageID_[arg_27_0.bgData_[arg_27_0.curPageNum_]] = true
						arg_27_0.poolTailPoint_ = arg_27_0.poolTailPoint_ + 1
						arg_27_0.stNumText_.text = arg_27_0.poolTailPoint_ - arg_27_0.deleteNum_ .. "/" .. arg_27_0.MaxStickerNum

						local var_30_1 = arg_27_0.poolTailPoint_

						if var_30_1 > #arg_27_0.stickerItemPool_ then
							local var_30_2 = Object.Instantiate(arg_27_0.stMoveGo_, arg_27_0.stPanelTrs_)

							arg_27_0.stickerItemPool_[var_30_1] = CustomStickerMoveItem.New(var_30_2)
						end

						SetActive(arg_27_0.stickerItemPool_[var_30_1].gameObject_, true)
						arg_27_0.stickerItemPool_[var_30_1].rectTransform_:SetAnchoredPositionEx(arg_27_0.coordinateX_ / 2, arg_27_0.coordinateY_ / 2)
						arg_27_0.stickerItemPool_[var_30_1].rectTransform_:SetLocalEulerAngleZ(0)
						arg_27_0.stickerItemPool_[var_30_1].rectTransform_:SetLocalScaleVal(1)
						arg_27_0.stickerItemPool_[var_30_1]:SetData(var_27_0, function()
							if arg_27_0.selectingIdx_ ~= var_30_1 then
								arg_27_0.selectingIdx_ = var_30_1
								arg_27_0.selecting_ = arg_27_0.stickerItemPool_[var_30_1]

								arg_27_0.selecting_.rectTransform_:SetAsLastSibling()

								local var_31_0 = {}

								for iter_31_0, iter_31_1 in ipairs(arg_27_0.pageData_[arg_27_0.bgData_[arg_27_0.curPageNum_]].hierarchy) do
									if iter_31_1 ~= arg_27_0.selecting_.ID_ then
										table.insert(var_31_0, iter_31_1)
									end
								end

								table.insert(var_31_0, arg_27_0.selecting_.ID_)

								arg_27_0.pageData_[arg_27_0.bgData_[arg_27_0.curPageNum_]].hierarchy = var_31_0
								arg_27_0.changePageID_[arg_27_0.bgData_[arg_27_0.curPageNum_]] = true

								arg_27_0.movePanelTrs_:SetAnchoredPosition(arg_27_0.selecting_.rectTransform_.anchoredPosition)
								arg_27_0.movePanelTrs_:SetSizeDelta(arg_27_0.selecting_.outlineRect_.sizeDelta * arg_27_0.selecting_.outlineRect_:GetLocalScaleX() * arg_27_0.selecting_.rectTransform_:GetLocalScaleX())
								arg_27_0.movePanelTrs_:SetLocalEulerAngleZ(arg_27_0.selecting_.rectTransform_:GetLocalEulerAngleZ())
								SetActive(arg_27_0.movePanelTrs_.gameObject, true)
								SetActive(arg_27_0.cancelBtn_.gameObject, true)
							end
						end)

						arg_27_0.selectingIdx_ = var_30_1
						arg_27_0.selecting_ = arg_27_0.stickerItemPool_[var_30_1]

						arg_27_0.selecting_.rectTransform_:SetAsLastSibling()
						arg_27_0.movePanelTrs_:SetAnchoredPosition(arg_27_0.selecting_.rectTransform_.anchoredPosition)
						arg_27_0.movePanelTrs_:SetSizeDelta(arg_27_0.selecting_.outlineRect_.sizeDelta * arg_27_0.selecting_.outlineRect_:GetLocalScaleX() * arg_27_0.selecting_.rectTransform_:GetLocalScaleX())
						arg_27_0.movePanelTrs_:SetLocalEulerAngleZ(arg_27_0.selecting_.rectTransform_:GetLocalEulerAngleZ())
						SetActive(arg_27_0.movePanelTrs_.gameObject, true)
						SetActive(arg_27_0.cancelBtn_.gameObject, true)
					elseif arg_27_0.curTab_ == 2 then
						arg_27_0.pageData_[var_27_2.page].foreground = 0
						arg_27_0.changePageID_[var_27_2.page] = true
						var_27_2.page = arg_27_0.bgData_[arg_27_0.curPageNum_]

						PlayerData:SetStickerFgPage(arg_27_2.ID_, arg_27_0.bgData_[arg_27_0.curPageNum_])

						arg_27_0.pageData_[arg_27_0.bgData_[arg_27_0.curPageNum_]].foreground = arg_27_2.ID_
						arg_27_0.changePageID_[arg_27_0.bgData_[arg_27_0.curPageNum_]] = true

						arg_27_0:DestroyDynamicFg()

						if var_27_0.type == 1 then
							arg_27_0.fgStaticImg_.spriteAsync = "TextureConfig/Sticker/Foreground_l/Stickerfg_l_" .. var_27_0.resource
							arg_27_0.fgStaticImg_.enabled = true
						elseif var_27_0.type == 2 then
							arg_27_0.curDynamicFg_ = Object.Instantiate(Asset.Load("Widget/System/UserInfor/sticker_new/dynamicitem/Foreground/Foregrounditem_" .. var_27_0.resource), arg_27_0.fgDynamicTrs_)
							arg_27_0.fgStaticImg_.enabled = false
						end
					end
				end,
				CancelCallback = function()
					return
				end
			})
		elseif arg_27_0.curTab_ == 1 then
			local var_28_2

			for iter_28_0, iter_28_1 in ipairs(arg_27_0.stickerItemPool_) do
				if iter_28_1.ID_ == var_27_0.id and iter_28_1.gameObject_.activeSelf then
					var_28_2 = iter_28_0
				end
			end

			if not var_28_2 then
				return
			end

			arg_27_0.selectingIdx_ = var_28_2
			arg_27_0.selecting_ = arg_27_0.stickerItemPool_[var_28_2]

			arg_27_0.selecting_.rectTransform_:SetAsLastSibling()

			local var_28_3 = {}

			for iter_28_2, iter_28_3 in ipairs(arg_27_0.pageData_[arg_27_0.bgData_[arg_27_0.curPageNum_]].hierarchy) do
				if iter_28_3 ~= arg_27_0.selecting_.ID_ then
					table.insert(var_28_3, iter_28_3)
				end
			end

			table.insert(var_28_3, arg_27_0.selecting_.ID_)

			arg_27_0.pageData_[arg_27_0.bgData_[arg_27_0.curPageNum_]].hierarchy = var_28_3

			arg_27_0.movePanelTrs_:SetAnchoredPosition(arg_27_0.selecting_.rectTransform_.anchoredPosition)
			arg_27_0.movePanelTrs_:SetSizeDelta(arg_27_0.selecting_.outlineRect_.sizeDelta * arg_27_0.selecting_.outlineRect_:GetLocalScaleX() * arg_27_0.selecting_.rectTransform_:GetLocalScaleX())
			arg_27_0.movePanelTrs_:SetLocalEulerAngleZ(arg_27_0.selecting_.rectTransform_:GetLocalEulerAngleZ())
			SetActive(arg_27_0.movePanelTrs_.gameObject, true)
			SetActive(arg_27_0.cancelBtn_.gameObject, true)
		elseif arg_27_0.curTab_ == 2 then
			arg_27_2:SetUse(false)

			var_27_2.page = 0

			PlayerData:SetStickerFgPage(arg_27_2.ID_, 0)

			arg_27_0.pageData_[arg_27_0.bgData_[arg_27_0.curPageNum_]].foreground = 0
			arg_27_0.changePageID_[arg_27_0.bgData_[arg_27_0.curPageNum_]] = true

			arg_27_0:DestroyDynamicFg()

			arg_27_0.fgStaticImg_.enabled = false
		end
	end, nil, var_27_7)
end

function var_0_0.OnEnter(arg_33_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR
	})

	arg_33_0.filterMap_ = {}
	arg_33_0.filterState_ = false

	arg_33_0.colorController_:SetSelectedState("normal")
	arg_33_0.tabFilterPanel_:SetData(StickerSuitCfg.all, function(arg_34_0, arg_34_1)
		arg_33_0.filterMap_ = arg_34_0
		arg_33_0.filterState_ = not arg_34_1

		arg_33_0.colorController_:SetSelectedState(arg_33_0.filterState_ and "orange" or "normal")
		arg_33_0:RefreshTab(arg_33_0.curTab_)
	end)

	arg_33_0.bgData_ = PlayerData:GetStickerBgList()

	local var_33_0 = GameSetting.sticker_background_default.value[1]

	table.sort(arg_33_0.bgData_, function(arg_35_0, arg_35_1)
		if arg_35_0 == var_33_0 then
			return true
		end

		if arg_35_1 == var_33_0 then
			return false
		end

		return arg_35_0 < arg_35_1
	end)

	arg_33_0.pageData_ = PlayerData:GetStickerEditData()
	arg_33_0.allOriStickerData_[1] = PlayerData:GetStickerList()

	table.sort(arg_33_0.allOriStickerData_[1], function(arg_36_0, arg_36_1)
		local var_36_0 = PlayerData:GetSticker(arg_36_0)
		local var_36_1 = PlayerData:GetSticker(arg_36_1)

		if var_36_0.page == 0 and var_36_1.page == 0 or var_36_0.page ~= 0 and var_36_1.page ~= 0 then
			return arg_36_1 < arg_36_0
		end

		return var_36_0.page < var_36_1.page
	end)

	arg_33_0.allOriStickerData_[2] = PlayerData:GetStickerFgList()

	table.sort(arg_33_0.allOriStickerData_[2], function(arg_37_0, arg_37_1)
		local var_37_0 = PlayerData:GetStickerFg(arg_37_0)
		local var_37_1 = PlayerData:GetStickerFg(arg_37_1)

		if var_37_0.page == 0 and var_37_1.page == 0 or var_37_0.page ~= 0 and var_37_1.page ~= 0 then
			return arg_37_1 < arg_37_0
		end

		return var_37_0.page < var_37_1.page
	end)

	arg_33_0.changePageID_ = {}
	arg_33_0.maxPageNum_ = #arg_33_0.bgData_
	arg_33_0.curPageNum_ = getData("PlayerCustomStickerTriggered", "LastEditStickerPageNum") or 1
	arg_33_0.curTab_ = 1

	arg_33_0:UpdateView()
end

function var_0_0.RefreshTab(arg_38_0, arg_38_1)
	arg_38_0.curTab_ = arg_38_1

	if arg_38_1 == 1 then
		arg_38_0.tabFilterData_ = {}

		local var_38_0 = arg_38_0.allOriStickerData_[1]

		if arg_38_0.filterState_ then
			for iter_38_0, iter_38_1 in ipairs(var_38_0) do
				local var_38_1 = PlayerData:GetSticker(iter_38_1)

				if arg_38_0.filterMap_[var_38_1.suit] then
					table.insert(arg_38_0.tabFilterData_, iter_38_1)
				end
			end
		else
			arg_38_0.tabFilterData_ = var_38_0
		end

		arg_38_0.tabController_:SetSelectedState("sticker")
		arg_38_0.stTabList_:StartScroll(#arg_38_0.tabFilterData_)
	else
		arg_38_0.tabFilterData_ = {}

		local var_38_2 = arg_38_0.allOriStickerData_[2]

		if arg_38_0.filterState_ then
			for iter_38_2, iter_38_3 in ipairs(var_38_2) do
				local var_38_3 = PlayerData:GetStickerFg(iter_38_3)

				if arg_38_0.filterMap_[var_38_3.suit] then
					table.insert(arg_38_0.tabFilterData_, iter_38_3)
				end
			end
		else
			arg_38_0.tabFilterData_ = var_38_2
		end

		arg_38_0.tabController_:SetSelectedState("foreground")
		arg_38_0.fgTabList_:StartScroll(#arg_38_0.tabFilterData_)
	end
end

function var_0_0.UpdateView(arg_39_0)
	SetActive(arg_39_0.prePageBtn_.gameObject, arg_39_0.curPageNum_ > 1)
	SetActive(arg_39_0.nextPageBtn_.gameObject, arg_39_0.curPageNum_ < arg_39_0.maxPageNum_)
	arg_39_0:RefreshTab(arg_39_0.curTab_)

	arg_39_0.bgNameText_.text = ItemTools.getItemName(arg_39_0.bgData_[arg_39_0.curPageNum_])
	arg_39_0.pageNumText_.text = arg_39_0.curPageNum_ .. "/" .. arg_39_0.maxPageNum_

	if arg_39_0.selecting_ then
		arg_39_0.selecting_ = nil
		arg_39_0.selectingIdx_ = 0

		SetActive(arg_39_0.movePanelTrs_.gameObject, false)
		SetActive(arg_39_0.cancelBtn_.gameObject, false)
	end

	if PlayerData:GetStickerShowID() == arg_39_0.bgData_[arg_39_0.curPageNum_] then
		arg_39_0.favoriteController_:SetSelectedState("star")
	else
		arg_39_0.favoriteController_:SetSelectedState("none")
	end

	local var_39_0 = arg_39_0.pageData_[arg_39_0.bgData_[arg_39_0.curPageNum_]]

	arg_39_0:DestroyDynamicBg()

	arg_39_0.bgStaticImg_.enabled = false

	if var_39_0 then
		local var_39_1 = ProfileDecorateItemCfg[arg_39_0.bgData_[arg_39_0.curPageNum_]]

		if var_39_1 then
			if var_39_1.type == 1 then
				arg_39_0.bgStaticImg_.spriteAsync = "TextureConfig/Sticker/Background_l/Stickerbg_l_" .. var_39_1.resource
				arg_39_0.bgStaticImg_.enabled = true
			elseif var_39_1.type == 2 then
				arg_39_0.curDynamicBg_ = Object.Instantiate(Asset.Load("Widget/System/UserInfor/sticker_new/dynamicitem/Bg/Bgitem_" .. var_39_1.resource), arg_39_0.bgDynamicTrs_)
				arg_39_0.bgStaticImg_.enabled = false
				arg_39_0.curDynamicTopBg_ = arg_39_0.curDynamicBg_.transform:Find("TopPart")

				if arg_39_0.curDynamicTopBg_ then
					arg_39_0.curDynamicTopBg_:SetParent(arg_39_0.TopBgTrs_)

					arg_39_0.curDynamicTopBg_ = arg_39_0.curDynamicTopBg_.gameObject
				end
			end
		end
	end

	arg_39_0:DestroyDynamicFg()

	arg_39_0.fgStaticImg_.enabled = false

	if var_39_0.foreground ~= 0 then
		local var_39_2 = ProfileDecorateItemCfg[var_39_0.foreground]

		if var_39_2 then
			if var_39_2.type == 1 then
				arg_39_0.fgStaticImg_.spriteAsync = "TextureConfig/Sticker/Foreground_l/Stickerfg_l_" .. var_39_2.resource
				arg_39_0.fgStaticImg_.enabled = true
			elseif var_39_2.type == 2 then
				arg_39_0.curDynamicFg_ = Object.Instantiate(Asset.Load("Widget/System/UserInfor/sticker_new/dynamicitem/Foreground/Foregrounditem_" .. var_39_2.resource), arg_39_0.fgDynamicTrs_)
				arg_39_0.fgStaticImg_.enabled = false
			end
		end
	end

	local var_39_3 = 1

	for iter_39_0, iter_39_1 in pairs(var_39_0.hierarchy) do
		local var_39_4 = ProfileDecorateItemCfg[iter_39_1]
		local var_39_5 = var_39_0.sticker[iter_39_1]

		if var_39_4 then
			if not arg_39_0.stickerItemPool_[var_39_3] then
				local var_39_6 = Object.Instantiate(arg_39_0.stMoveGo_, arg_39_0.stPanelTrs_)

				arg_39_0.stickerItemPool_[var_39_3] = CustomStickerMoveItem.New(var_39_6)
			end

			SetActive(arg_39_0.stickerItemPool_[var_39_3].gameObject_, true)

			local var_39_7 = var_39_3

			arg_39_0.stickerItemPool_[var_39_3]:SetData(var_39_4, function()
				if arg_39_0.selectingIdx_ ~= var_39_7 then
					arg_39_0.selectingIdx_ = var_39_7
					arg_39_0.selecting_ = arg_39_0.stickerItemPool_[var_39_7]

					arg_39_0.selecting_.rectTransform_:SetAsLastSibling()

					local var_40_0 = {}

					for iter_40_0, iter_40_1 in ipairs(arg_39_0.pageData_[arg_39_0.bgData_[arg_39_0.curPageNum_]].hierarchy) do
						if iter_40_1 ~= arg_39_0.selecting_.ID_ then
							table.insert(var_40_0, iter_40_1)
						end
					end

					table.insert(var_40_0, arg_39_0.selecting_.ID_)

					arg_39_0.pageData_[arg_39_0.bgData_[arg_39_0.curPageNum_]].hierarchy = var_40_0
					arg_39_0.changePageID_[arg_39_0.bgData_[arg_39_0.curPageNum_]] = true

					arg_39_0.movePanelTrs_:SetAnchoredPosition(arg_39_0.selecting_.rectTransform_.anchoredPosition)
					arg_39_0.movePanelTrs_:SetSizeDelta(arg_39_0.selecting_.outlineRect_.sizeDelta * arg_39_0.selecting_.outlineRect_:GetLocalScaleX() * arg_39_0.selecting_.rectTransform_:GetLocalScaleX())
					arg_39_0.movePanelTrs_:SetLocalEulerAngleZ(arg_39_0.selecting_.rectTransform_:GetLocalEulerAngleZ())
					SetActive(arg_39_0.movePanelTrs_.gameObject, true)
					SetActive(arg_39_0.cancelBtn_.gameObject, true)
				end
			end)

			local var_39_8 = var_39_5.positionX / 10000 * arg_39_0.coordinateX_
			local var_39_9 = var_39_5.positionY / 10000 * arg_39_0.coordinateY_
			local var_39_10 = var_39_5.rotation / 10000 * 360
			local var_39_11 = var_39_5.scale / 10000 * arg_39_0.MaxScaleNum

			arg_39_0.stickerItemPool_[var_39_3].rectTransform_:SetAnchoredPositionEx(var_39_8, var_39_9)
			arg_39_0.stickerItemPool_[var_39_3].rectTransform_:SetLocalEulerAngleZ(var_39_10)
			arg_39_0.stickerItemPool_[var_39_3].rectTransform_:SetLocalScaleVal(var_39_11)
			arg_39_0.stickerItemPool_[var_39_3].rectTransform_:SetAsLastSibling()

			var_39_3 = var_39_3 + 1
		end
	end

	arg_39_0.poolTailPoint_ = var_39_3 - 1
	arg_39_0.deleteNum_ = 0
	arg_39_0.stNumText_.text = arg_39_0.poolTailPoint_ - arg_39_0.deleteNum_ .. "/" .. arg_39_0.MaxStickerNum

	while var_39_3 <= #arg_39_0.stickerItemPool_ do
		if arg_39_0.stickerItemPool_[var_39_3] then
			SetActive(arg_39_0.stickerItemPool_[var_39_3].gameObject_, false)
		end

		var_39_3 = var_39_3 + 1
	end
end

function var_0_0.OnTop(arg_41_0)
	return
end

function var_0_0.DestroyDynamicFg(arg_42_0)
	if arg_42_0.curDynamicFg_ then
		Object.Destroy(arg_42_0.curDynamicFg_)

		arg_42_0.curDynamicFg_ = nil
	end
end

function var_0_0.DestroyDynamicBg(arg_43_0)
	if arg_43_0.curDynamicBg_ then
		Object.Destroy(arg_43_0.curDynamicBg_)

		arg_43_0.curDynamicBg_ = nil
	end

	if arg_43_0.curDynamicTopBg_ then
		Object.Destroy(arg_43_0.curDynamicTopBg_)

		arg_43_0.curDynamicTopBg_ = nil
	end
end

function var_0_0.OnExit(arg_44_0)
	manager.windowBar:HideBar()
	saveData("PlayerCustomStickerTriggered", "LastEditStickerPageNum", arg_44_0.curPageNum_)

	if arg_44_0.selecting_ then
		arg_44_0.selecting_ = nil
		arg_44_0.selectingIdx_ = 0

		SetActive(arg_44_0.movePanelTrs_.gameObject, false)
		SetActive(arg_44_0.cancelBtn_.gameObject, false)
	end

	PlayerAction.SyncStickerPageUpdateToServer(arg_44_0.pageData_, arg_44_0.changePageID_)
end

function var_0_0.Dispose(arg_45_0)
	arg_45_0:RemoveAllListeners()
	arg_45_0:DestroyDynamicFg()
	arg_45_0:DestroyDynamicBg()
	arg_45_0.tabFilterPanel_:Dispose()
	arg_45_0.stTabList_:Dispose()
	arg_45_0.fgTabList_:Dispose()

	for iter_45_0 = 1, #arg_45_0.stickerItemPool_ do
		if arg_45_0.stickerItemPool_[iter_45_0] then
			arg_45_0.stickerItemPool_[iter_45_0]:Dispose()

			arg_45_0.stickerItemPool_[iter_45_0] = nil
		end
	end

	var_0_0.super.Dispose(arg_45_0)
end

return var_0_0
