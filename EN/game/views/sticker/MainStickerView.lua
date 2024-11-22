local var_0_0 = class("MainStickerView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/System/UserInfor/paster/StickerMainUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:InitUI()
	arg_3_0:AddUIListeners()
	arg_3_0:InitDropdownData()
end

function var_0_0.InitDropdownData(arg_4_0)
	arg_4_0.dropDown_.options:Clear()
	arg_4_0.dropDown_.options:Add(UnityEngine.UI.Dropdown.OptionData.New(GetTips("STICKER_PRESETS_1"), nil))
	arg_4_0.dropDown_.options:Add(UnityEngine.UI.Dropdown.OptionData.New(GetTips("STICKER_PRESETS_2"), nil))
	arg_4_0.dropDown_.options:Add(UnityEngine.UI.Dropdown.OptionData.New(GetTips("STICKER_PRESETS_3"), nil))
	arg_4_0.dropDown_:RefreshShownValue()
end

function var_0_0.InitUI(arg_5_0)
	arg_5_0:BindCfgUI()

	arg_5_0.viewType_ = {
		FOREIGN = 3,
		EDITOR = 2,
		SHOW = 1
	}
	arg_5_0.dropDown_ = arg_5_0.dropGo_:GetComponent("UIDropDown")
	arg_5_0.stickerViewItem_ = {}
	arg_5_0.viewCon_ = ControllerUtil.GetController(arg_5_0.transform_, "view")

	manager.redPoint:bindUIandKey(arg_5_0.stickerRedTrans_, RedPointConst.STICKER)
end

function var_0_0.AddUIListeners(arg_6_0)
	arg_6_0:AddToggleListener(arg_6_0.dropDown_, function(arg_7_0)
		arg_6_0:RefreshUI(arg_7_0 + 1)
	end)
	arg_6_0:AddBtnListener(arg_6_0.showBtn_, nil, function()
		SetActive(arg_6_0.btnView_, true)
		arg_6_0:AddClickTimer()
	end)
	arg_6_0:AddBtnListener(arg_6_0.listBtn_, nil, function()
		JumpTools.GoToSystem("/stickersList")
	end)
	arg_6_0:AddBtnListener(arg_6_0.editBtn_, nil, function()
		arg_6_0.curType_ = arg_6_0.viewType_.EDITOR
		arg_6_0.params_.tempInfo = {
			stickerBg = arg_6_0.stickerBg_,
			info = arg_6_0.stickerInfo_
		}

		arg_6_0:RefreshState()
	end)
	arg_6_0:AddBtnListener(arg_6_0.chooseBtn_, nil, function()
		JumpTools.OpenPageByJump("/chooseStickerTemplate", {
			chooseID = arg_6_0.stickerInfo_[arg_6_0.curIndex_].viewID,
			index = arg_6_0.curIndex_,
			temp = arg_6_0.params_.tempInfo
		})
	end)
	arg_6_0:AddBtnListener(arg_6_0.bgBtn_, nil, function()
		JumpTools.OpenPageByJump("/chooseStickerBg", {
			chooseID = arg_6_0.stickerBg_,
			temp = arg_6_0.params_.tempInfo
		})
	end)
	arg_6_0:AddBtnListener(arg_6_0.exitBtn_, nil, function()
		arg_6_0.curType_ = arg_6_0.viewType_.SHOW

		arg_6_0.stickerViewItem_[arg_6_0.stickerInfo_[arg_6_0.curIndex_].viewID]:Show(false)

		arg_6_0.stickerBg_ = arg_6_0.params_.stickerBg
		arg_6_0.stickerInfo_ = deepClone(arg_6_0.params_.oldInfo or {})

		arg_6_0:RefreshUI(arg_6_0.curIndex_)
	end)
	arg_6_0:AddBtnListener(arg_6_0.okBtn_, nil, function()
		PlayerAction.ChangeStickerList(arg_6_0.params_.tempInfo)
	end)
end

function var_0_0.OnEnter(arg_15_0)
	arg_15_0.curType_ = arg_15_0.params_.type or arg_15_0.viewType_.SHOW

	if arg_15_0.curType_ == arg_15_0.viewType_.EDITOR then
		arg_15_0.stickerBg_ = arg_15_0.params_.tempInfo.stickerBg
		arg_15_0.stickerInfo_ = arg_15_0.params_.tempInfo.info
	else
		arg_15_0.params_.oldInfo = deepClone(arg_15_0.params_.stickerInfo or {})
		arg_15_0.stickerBg_ = arg_15_0.params_.stickerBg
		arg_15_0.stickerInfo_ = deepClone(arg_15_0.params_.oldInfo or {})
	end

	arg_15_0:BindRedPoint()
	arg_15_0:RefreshUI(arg_15_0.params_.index or 1)
end

function var_0_0.RefreshUI(arg_16_0, arg_16_1)
	arg_16_0.dropDown_.value = arg_16_1 - 1

	arg_16_0:RefreshView(arg_16_1)
	arg_16_0:RefreshState()
end

function var_0_0.RefreshView(arg_17_0, arg_17_1)
	if arg_17_0.curIndex_ and arg_17_0.curIndex_ ~= arg_17_1 and arg_17_0.stickerInfo_[arg_17_0.curIndex_] and arg_17_0.stickerViewItem_[arg_17_0.stickerInfo_[arg_17_0.curIndex_].viewID] then
		arg_17_0.stickerViewItem_[arg_17_0.stickerInfo_[arg_17_0.curIndex_].viewID]:Show(false)
	end

	arg_17_0.curIndex_ = arg_17_1
	arg_17_0.params_.index = arg_17_1

	if not arg_17_0.stickerBg_ or arg_17_0.stickerBg_ == 0 then
		arg_17_0.stickerBg_ = GameSetting.sticker_background_default.value[1]
	end

	arg_17_0.bg_.sprite = getSpriteWithoutAtlas("TextureConfig/Sticker/stickerBtn/Sticker_big_" .. arg_17_0.stickerBg_)

	if not arg_17_0.stickerInfo_[arg_17_0.curIndex_] then
		local var_17_0 = {}
		local var_17_1 = GameSetting.profile_sticker_template.value[1]
		local var_17_2 = StickViewTemplateCfg[var_17_1]

		for iter_17_0, iter_17_1 in ipairs(var_17_2.range_list) do
			var_17_0[iter_17_0] = {
				stickerID = 0,
				size = iter_17_1[2][1]
			}
		end

		arg_17_0.stickerInfo_[arg_17_0.curIndex_] = {
			index = arg_17_0.curIndex_,
			viewID = var_17_1,
			sticker = var_17_0
		}
	end

	local var_17_3 = arg_17_0.stickerInfo_[arg_17_0.curIndex_].viewID

	if not arg_17_0.stickerViewItem_[var_17_3] then
		local var_17_4 = Object.Instantiate(Asset.Load("Widget/System/UserInfor/paster/StickerTemplate" .. var_17_3), arg_17_0.pageContainer_)

		arg_17_0.stickerViewItem_[var_17_3] = StickerView.New(arg_17_0, var_17_4, var_17_3)

		arg_17_0.stickerViewItem_[var_17_3]:RegistClickFunc(function(arg_18_0, arg_18_1)
			if arg_17_0.curType_ ~= arg_17_0.viewType_.EDITOR then
				ShowPopItem(POP_SOURCE_DES_ITEM, {
					arg_18_0.stickerID
				}, {
					isForeign = arg_17_0.curType_ == arg_17_0.viewType_.FOREIGN
				})
			else
				JumpTools.OpenPageByJump("chooseStickers", {
					list = arg_17_0.stickerInfo_[arg_17_0.curIndex_].sticker,
					info = arg_18_0,
					site = arg_18_1,
					viewID = var_17_3
				})
			end
		end)
	end

	arg_17_0.stickerViewItem_[arg_17_0.stickerInfo_[arg_17_0.curIndex_].viewID]:Show(true)

	local var_17_5 = StickViewTemplateCfg[var_17_3]

	for iter_17_2 = #arg_17_0.stickerInfo_[arg_17_0.curIndex_].sticker + 1, #var_17_5.range_list do
		arg_17_0.stickerInfo_[arg_17_0.curIndex_].sticker[iter_17_2] = {
			stickerID = 0,
			size = var_17_5.range_list[iter_17_2][2][1]
		}
	end

	if arg_17_0.params_.resetSize then
		for iter_17_3, iter_17_4 in ipairs(arg_17_0.stickerInfo_[arg_17_0.curIndex_].sticker) do
			if var_17_5.range_list[iter_17_3] then
				iter_17_4.size = var_17_5.range_list[iter_17_3][2][1]
			end
		end

		arg_17_0.params_.resetSize = false
	end

	arg_17_0.stickerViewItem_[var_17_3]:SetData(arg_17_0.stickerInfo_[arg_17_0.curIndex_].sticker)
end

function var_0_0.RefreshState(arg_19_0)
	arg_19_0.viewCon_:SetSelectedState(arg_19_0.curType_)

	local var_19_0 = arg_19_0.stickerInfo_[arg_19_0.curIndex_].viewID

	arg_19_0.stickerViewItem_[var_19_0]:RefreshUI(arg_19_0.curType_ == arg_19_0.viewType_.EDITOR)
end

function var_0_0.AddClickTimer(arg_20_0)
	arg_20_0:StopTimer()

	arg_20_0.buttonUp_ = 0
	arg_20_0.clickTimer_ = FuncTimerManager.inst:CreateFuncFrameTimer(function()
		if Input.GetMouseButtonUp(0) then
			arg_20_0.buttonUp_ = arg_20_0.buttonUp_ + 1

			if arg_20_0.buttonUp_ >= 2 then
				arg_20_0:HidePop()
				FuncTimerManager.inst:RemoveFuncTimer(arg_20_0.clickTimer_)

				arg_20_0.clickTimer_ = nil
			end
		end
	end, -1, true)
end

function var_0_0.StopTimer(arg_22_0)
	if arg_22_0.clickTimer_ then
		FuncTimerManager.inst:RemoveFuncTimer(arg_22_0.clickTimer_)

		arg_22_0.clickTimer_ = nil
	end
end

function var_0_0.HidePop(arg_23_0)
	SetActive(arg_23_0.btnView_, false)
end

function var_0_0.BindRedPoint(arg_24_0)
	manager.redPoint:bindUIandKey(arg_24_0.editBtn_.transform, RedPointConst.STICKER_BG)
	manager.redPoint:bindUIandKey(arg_24_0.bgBtn_.transform, RedPointConst.STICKER_BG)
end

function var_0_0.UnBindRedPoint(arg_25_0)
	manager.redPoint:unbindUIandKey(arg_25_0.editBtn_.transform, RedPointConst.STICKER_BG)
	manager.redPoint:unbindUIandKey(arg_25_0.bgBtn_.transform, RedPointConst.STICKER_BG)
end

function var_0_0.OnChangeSticker(arg_26_0, arg_26_1, arg_26_2, arg_26_3)
	local var_26_0 = arg_26_0.stickerInfo_[arg_26_0.curIndex_].sticker[arg_26_1].stickerID

	if arg_26_2 ~= 0 then
		for iter_26_0, iter_26_1 in ipairs(arg_26_0.stickerInfo_[arg_26_0.curIndex_].sticker) do
			if iter_26_1 and iter_26_1.stickerID == arg_26_2 then
				arg_26_0.stickerInfo_[arg_26_0.curIndex_].sticker[iter_26_0].stickerID = var_26_0

				break
			end
		end
	end

	arg_26_0.stickerInfo_[arg_26_0.curIndex_].sticker[arg_26_1] = {
		stickerID = arg_26_2,
		size = arg_26_3
	}

	local var_26_1 = arg_26_0.stickerInfo_[arg_26_0.curIndex_].viewID

	arg_26_0.stickerViewItem_[var_26_1]:RefreshUI(arg_26_0.curType_ == arg_26_0.viewType_.EDITOR)
end

function var_0_0.OnChangeStickerSize(arg_27_0, arg_27_1, arg_27_2, arg_27_3)
	arg_27_0.stickerInfo_[arg_27_0.curIndex_].sticker[arg_27_1].size = arg_27_3

	local var_27_0 = arg_27_0.stickerInfo_[arg_27_0.curIndex_].viewID

	arg_27_0.stickerViewItem_[var_27_0]:RefreshUI(arg_27_0.curType_ == arg_27_0.viewType_.EDITOR)
end

function var_0_0.OnChangeStickerList(arg_28_0, arg_28_1, arg_28_2)
	arg_28_0.curType_ = arg_28_0.viewType_.SHOW
	arg_28_0.params_.oldInfo = arg_28_1
	arg_28_0.params_.stickerInfo = arg_28_1
	arg_28_0.params_.stickerBg = arg_28_2
	arg_28_0.stickerBg_ = arg_28_2
	arg_28_0.stickerInfo_ = deepClone(arg_28_0.params_.oldInfo)

	arg_28_0:RefreshUI(arg_28_0.curIndex_)
end

function var_0_0.OnTop(arg_29_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR
	})
end

function var_0_0.OnExit(arg_30_0)
	arg_30_0:UnBindRedPoint()
	manager.windowBar:HideBar()

	for iter_30_0, iter_30_1 in pairs(arg_30_0.stickerViewItem_) do
		iter_30_1:OnExit()
	end

	arg_30_0.params_.type = nil
end

function var_0_0.Dispose(arg_31_0)
	arg_31_0:RemoveAllListeners()
	manager.redPoint:unbindUIandKey(arg_31_0.stickerRedTrans_)

	for iter_31_0, iter_31_1 in pairs(arg_31_0.stickerViewItem_) do
		iter_31_1:Dispose()
	end

	var_0_0.super.Dispose(arg_31_0)
end

return var_0_0
