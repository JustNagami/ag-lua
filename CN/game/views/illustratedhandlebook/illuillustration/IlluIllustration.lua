local var_0_0 = class("IlluIllustration", ReduxView)
local var_0_1 = {
	BIRTHDAY = 4,
	ACTIVITY_STORY = 3,
	BG_PICTURE = 6,
	LOADING_PICTURE = 5,
	MAIN_STORY = 1,
	HEART = 2
}

function var_0_0.UIName(arg_1_0)
	return "Widget/System/IllustratedHandbook/IlluIllustrationUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:InitUI()
	arg_3_0:AddUIListener()
end

function var_0_0.InitUI(arg_4_0)
	arg_4_0:BindCfgUI()

	arg_4_0.loadingSet_ = {}

	for iter_4_0, iter_4_1 in ipairs(CollectPictureCfg.get_id_list_by_type) do
		arg_4_0.loadingSet_[iter_4_0] = {}
	end

	arg_4_0.itemScroll_ = LuaList.New(handler(arg_4_0, arg_4_0.indexItem), arg_4_0.uilistGo_, IlluIllustrationItem)
	arg_4_0.editorCon_ = ControllerUtil.GetController(arg_4_0.gameObject_.transform, "editor")
	arg_4_0.btn1Controller = ControllerUtil.GetController(arg_4_0.btn1trs_, "name")
	arg_4_0.btn2Controller = ControllerUtil.GetController(arg_4_0.btn2trs_, "name")
	arg_4_0.btn3Controller = ControllerUtil.GetController(arg_4_0.btn3trs_, "name")
	arg_4_0.btn4Controller = ControllerUtil.GetController(arg_4_0.btn4trs_, "name")
	arg_4_0.btn5Controller = ControllerUtil.GetController(arg_4_0.btn5trs_, "name")
	arg_4_0.btn6Controller = ControllerUtil.GetController(arg_4_0.btn6trs_, "name")
end

function var_0_0.AddUIListener(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.btn_1, nil, function()
		arg_5_0:RefreshUI(1)

		arg_5_0.params_.index = 1
	end)
	arg_5_0:AddBtnListener(arg_5_0.btn_2, nil, function()
		arg_5_0:RefreshUI(2)

		arg_5_0.params_.index = 2
	end)
	arg_5_0:AddBtnListener(arg_5_0.btn_3, nil, function()
		arg_5_0:RefreshUI(3)

		arg_5_0.params_.index = 3
	end)
	arg_5_0:AddBtnListener(arg_5_0.btn_4, nil, function()
		arg_5_0:RefreshUI(4)

		arg_5_0.params_.index = 4
	end)
	arg_5_0:AddBtnListener(arg_5_0.btn_5, nil, function()
		arg_5_0:RefreshUI(5)

		arg_5_0.params_.index = 5
	end)
	arg_5_0:AddBtnListener(arg_5_0.btn_6, nil, function()
		arg_5_0:RefreshUI(6)

		arg_5_0.params_.index = 6
	end)
	arg_5_0:AddBtnListener(arg_5_0.resetBtn_, nil, function()
		ShowMessageBox({
			title = GetTips("PROMPT"),
			content = GetTips("CONFIRM_RESET"),
			OkCallback = function()
				arg_5_0.loadingSet_[arg_5_0.params_.index] = {}

				arg_5_0:RefreshUI(arg_5_0.params_.index)
			end
		})
	end)
	arg_5_0:AddBtnListener(arg_5_0.saveBtn_, nil, function()
		IllustratedAction.SaveLoadingSet(arg_5_0.loadingSet_)
	end)
	arg_5_0:AddBtnListener(arg_5_0.editorBtn_, nil, function()
		arg_5_0.isEditor_ = true

		for iter_15_0, iter_15_1 in ipairs(arg_5_0.loadingSet_) do
			arg_5_0.loadingSet_[iter_15_0] = deepClone(IllustratedData:GetLoadingSetByType(iter_15_0))
		end

		arg_5_0:RefreshUI(arg_5_0.params_.index)
	end)
end

function var_0_0.UpdateData(arg_16_0, arg_16_1)
	arg_16_0.itemList_ = {}

	for iter_16_0, iter_16_1 in ipairs(CollectPictureCfg.get_id_list_by_type[arg_16_1]) do
		if not arg_16_0.isEditor_ and CollectPictureCfg[iter_16_1].group_display_order == 1 or arg_16_0.isEditor_ then
			if CollectPictureCfg[iter_16_1].type ~= 3 then
				table.insert(arg_16_0.itemList_, {
					id = iter_16_1
				})
			elseif IllustratedData:GetIllustrationInfo()[iter_16_1] then
				table.insert(arg_16_0.itemList_, {
					id = iter_16_1
				})
			end
		end
	end

	local var_16_0 = {}

	for iter_16_2, iter_16_3 in ipairs(arg_16_0.itemList_) do
		local var_16_1 = CollectPictureCfg[iter_16_3.id].group_id
		local var_16_2 = CollectPictureCfg.get_id_list_by_group_id[var_16_1]
		local var_16_3 = 1

		for iter_16_4, iter_16_5 in ipairs(var_16_2) do
			local var_16_4 = IllustratedData:GetIllustrationInfo()[iter_16_5]

			if var_16_4 and var_16_4.is_receive == 0 then
				var_16_3 = 0

				break
			end
		end

		var_16_0[var_16_1] = var_16_3
	end

	table.sort(arg_16_0.itemList_, function(arg_17_0, arg_17_1)
		local var_17_0 = CollectPictureCfg[arg_17_0.id].group_id
		local var_17_1 = CollectPictureCfg[arg_17_1.id].group_id
		local var_17_2 = IllustratedData:GetIllustrationInfo()[arg_17_0.id]
		local var_17_3 = IllustratedData:GetIllustrationInfo()[arg_17_1.id]

		if var_17_2 and not var_17_3 then
			return true
		end

		if not var_17_2 and var_17_3 then
			return false
		end

		if var_17_2 and var_17_3 then
			if arg_16_0.isEditor_ then
				local var_17_4 = arg_16_0:IsSelected(arg_17_0.id)

				if var_17_4 ~= arg_16_0:IsSelected(arg_17_1.id) then
					return var_17_4
				end
			elseif var_16_0[var_17_0] and var_16_0[var_17_1] and var_16_0[var_17_0] ~= var_16_0[var_17_1] then
				return var_16_0[var_17_0] < var_16_0[var_17_1]
			end

			return var_17_0 < var_17_1
		else
			return var_17_0 < var_17_1
		end
	end)
end

function var_0_0.indexItem(arg_18_0, arg_18_1, arg_18_2)
	local var_18_0 = arg_18_0.selectType_
	local var_18_1 = arg_18_0.itemList_[arg_18_1].id

	if arg_18_0.isEditor_ then
		arg_18_2:SetSelect(arg_18_0:IsSelected(var_18_1))
	else
		arg_18_2:SetSelect(false)
	end

	arg_18_2:RefreshUI(arg_18_0.itemList_[arg_18_1], arg_18_0.isEditor_)
	arg_18_2:RegisterGiftFunc(handler(arg_18_0, arg_18_0.ReceiveIllustrationReward))
	arg_18_2:RegisterItemFunc(handler(arg_18_0, arg_18_0.ItemClickFun))
end

function var_0_0.ReceiveIllustrationReward(arg_19_0)
	local var_19_0 = IlluTools.GetIllustrationNotRewardList()

	if #var_19_0 == 0 then
		error("发生错误")
	end

	IllustratedAction.ReceiveIllustrationReward(var_19_0)
end

function var_0_0.OnReceiveIllustrationReward(arg_20_0, arg_20_1, arg_20_2)
	local var_20_0 = mergeReward(arg_20_1.item_list)

	getReward(var_20_0)
	arg_20_0:RefreshUI(arg_20_0.params_.index)
end

function var_0_0.ItemClickFun(arg_21_0, arg_21_1)
	if arg_21_0.isEditor_ then
		local var_21_0 = CollectPictureCfg[arg_21_1].type

		if arg_21_0:IsSelected(arg_21_1) then
			table.remove(arg_21_0.loadingSet_[var_21_0], table.indexof(arg_21_0.loadingSet_[var_21_0], arg_21_1))
			arg_21_0.itemScroll_:Refresh()
			arg_21_0:RefreshEditorText()
		else
			local var_21_1 = 0

			for iter_21_0, iter_21_1 in ipairs(arg_21_0.loadingSet_) do
				var_21_1 = var_21_1 + #arg_21_0.loadingSet_[iter_21_0]
			end

			if var_21_1 >= GameSetting.loading_pic_max.value[1] then
				ShowTips("SET_FAILED")
			else
				table.insert(arg_21_0.loadingSet_[var_21_0], arg_21_1)
				arg_21_0.itemScroll_:Refresh()
				arg_21_0:RefreshEditorText()
				ShowTips("SET_CONFIRMED")
			end
		end
	else
		arg_21_0:Go("/illuIllustrationDetail", {
			ID = arg_21_1
		})
	end
end

function var_0_0.RefreshUI(arg_22_0, arg_22_1, arg_22_2)
	arg_22_0.editorCon_:SetSelectedState(arg_22_0.isEditor_ and "true" or "false")
	SetActive(arg_22_0.btn3trs_.gameObject, arg_22_0:IsShowToggleByType(var_0_1.ACTIVITY_STORY))
	SetActive(arg_22_0.btn4trs_.gameObject, arg_22_0:IsShowToggleByType(var_0_1.BIRTHDAY))
	arg_22_0:UpdateData(arg_22_1)

	if arg_22_2 then
		if arg_22_0.params_.scrollPos_ then
			arg_22_0.itemScroll_:StartScrollByPosition(#arg_22_0.itemList_, arg_22_0.params_.scrollPos_)
		else
			arg_22_0.itemScroll_:StartScroll(#arg_22_0.itemList_)
		end
	else
		arg_22_0.itemScroll_:StartScroll(#arg_22_0.itemList_)
	end

	if arg_22_0.isEditor_ then
		arg_22_0:RefreshEditorText()
	else
		arg_22_0:RefreshText(arg_22_1)
	end

	arg_22_0.btn1Controller:SetSelectedIndex(arg_22_1 == 1 and 0 or 1)
	arg_22_0.btn2Controller:SetSelectedIndex(arg_22_1 == 2 and 0 or 1)
	arg_22_0.btn3Controller:SetSelectedIndex(arg_22_1 == 3 and 0 or 1)
	arg_22_0.btn4Controller:SetSelectedIndex(arg_22_1 == 4 and 0 or 1)
	arg_22_0.btn5Controller:SetSelectedIndex(arg_22_1 == 5 and 0 or 1)
	arg_22_0.btn6Controller:SetSelectedIndex(arg_22_1 == 6 and 0 or 1)
end

function var_0_0.RefreshEditorText(arg_23_0)
	local var_23_0 = 0

	for iter_23_0, iter_23_1 in ipairs(arg_23_0.loadingSet_) do
		var_23_0 = var_23_0 + #arg_23_0.loadingSet_[iter_23_0]
	end

	arg_23_0.limitText_.text = var_23_0 .. "/" .. GameSetting.loading_pic_max.value[1]
end

function var_0_0.RefreshText(arg_24_0, arg_24_1)
	local var_24_0 = 0

	for iter_24_0, iter_24_1 in ipairs(CollectPictureCfg.get_id_list_by_type[arg_24_1]) do
		if IllustratedData:GetIllustrationInfo()[iter_24_1] then
			var_24_0 = var_24_0 + 1
		end
	end

	if arg_24_1 == 3 then
		arg_24_0.numText_.text = var_24_0 .. "/" .. var_24_0
	else
		local var_24_1 = #CollectPictureCfg.get_id_list_by_type[arg_24_1]

		arg_24_0.numText_.text = var_24_0 .. "/" .. var_24_1
	end
end

function var_0_0.IsShowToggleByType(arg_25_0, arg_25_1)
	for iter_25_0, iter_25_1 in ipairs(CollectPictureCfg.get_id_list_by_type[arg_25_1] or {}) do
		if IllustratedData:GetIllustrationInfo()[iter_25_1] then
			return true
		end
	end

	return false
end

function var_0_0.OnEnter(arg_26_0)
	arg_26_0.isEditor_ = false

	arg_26_0:UpdateBar()

	arg_26_0.params_.index = arg_26_0.params_.index or 1

	arg_26_0:RefreshUI(arg_26_0.params_.index, true)
	manager.redPoint:bindUIandKey(arg_26_0.btn1trs_, RedPointConst.ILLU_ILLUSTRATION1)
	manager.redPoint:bindUIandKey(arg_26_0.btn2trs_, RedPointConst.ILLU_ILLUSTRATION2)
	manager.redPoint:bindUIandKey(arg_26_0.btn3trs_, RedPointConst.ILLU_ILLUSTRATION3)
	manager.redPoint:bindUIandKey(arg_26_0.btn4trs_, RedPointConst.ILLU_ILLUSTRATION4)
end

function var_0_0.UpdateBar(arg_27_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR
	})
	manager.windowBar:RegistBackCallBack(function()
		if arg_27_0.isEditor_ and arg_27_0:IsChanged() then
			ShowMessageBox({
				title = GetTips("PROMPT"),
				content = GetTips("TIP_SETTING_CHANGE"),
				OkCallback = function()
					IllustratedAction.SaveLoadingSet(arg_27_0.loadingSet_)
				end,
				CancelCallback = function()
					arg_27_0.isEditor_ = false

					arg_27_0:RefreshUI(arg_27_0.params_.index)
				end
			})
		else
			arg_27_0:Back()
		end
	end)
	manager.windowBar:RegistHomeCallBack(function()
		if arg_27_0.isEditor_ and arg_27_0:IsChanged() then
			ShowMessageBox({
				title = GetTips("PROMPT"),
				content = GetTips("TIP_SETTING_CHANGE"),
				OkCallback = function()
					IllustratedAction.SaveLoadingSet(arg_27_0.loadingSet_)
					arg_27_0:Go("/home")
				end,
				CancelCallback = function()
					arg_27_0:Go("/home")
				end
			})
		else
			arg_27_0:Go("/home")
		end
	end)
end

function var_0_0.IsSelected(arg_34_0, arg_34_1)
	if not arg_34_1 then
		return false
	end

	local var_34_0 = CollectPictureCfg[arg_34_1].type

	return table.indexof(arg_34_0.loadingSet_[var_34_0], arg_34_1) ~= false
end

function var_0_0.IsChanged(arg_35_0)
	local var_35_0 = {}

	for iter_35_0, iter_35_1 in ipairs(arg_35_0.loadingSet_) do
		table.insertto(var_35_0, arg_35_0.loadingSet_[iter_35_0])
	end

	local var_35_1 = IllustratedData:GetAllLoadingSet()

	if #var_35_0 ~= #var_35_1 then
		return true
	end

	for iter_35_2, iter_35_3 in ipairs(var_35_0) do
		if not table.indexof(var_35_1, iter_35_3) then
			return true
		end
	end

	return false
end

function var_0_0.OnSaveLoadingSet(arg_36_0)
	arg_36_0.isEditor_ = false

	arg_36_0:RefreshUI(arg_36_0.params_.index)
end

function var_0_0.OnExit(arg_37_0)
	manager.windowBar:HideBar()
	manager.redPoint:unbindUIandKey(arg_37_0.btn1trs_, RedPointConst.ILLU_ILLUSTRATION1)
	manager.redPoint:unbindUIandKey(arg_37_0.btn2trs_, RedPointConst.ILLU_ILLUSTRATION2)
	manager.redPoint:unbindUIandKey(arg_37_0.btn3trs_, RedPointConst.ILLU_ILLUSTRATION3)
	manager.redPoint:unbindUIandKey(arg_37_0.btn4trs_, RedPointConst.ILLU_ILLUSTRATION4)

	arg_37_0.params_.scrollPos_ = arg_37_0.itemScroll_:GetScrolledPosition()
end

function var_0_0.Dispose(arg_38_0)
	arg_38_0.itemScroll_:Dispose()

	arg_38_0.itemScroll_ = nil

	var_0_0.super.Dispose(arg_38_0)
end

return var_0_0
