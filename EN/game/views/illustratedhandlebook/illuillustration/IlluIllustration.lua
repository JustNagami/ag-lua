local var_0_0 = class("IlluIllustration", ReduxView)
local var_0_1 = {
	ACTIVITY_STORY = 3,
	BIRTHDAY = 4,
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
end

function var_0_0.AddUIListener(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.btn_1, nil, function()
		arg_5_0:RefreshUI(1)

		arg_5_0.params_.index = 1
	end)
	arg_5_0:AddBtnListener(arg_5_0.btn_2, nil, function()
		arg_5_0:RefreshUI(2)

		arg_5_0.params_.index = 2

		arg_5_0.btn1Controller:SetSelectedIndex(1)
		arg_5_0.btn2Controller:SetSelectedIndex(0)
		arg_5_0.btn3Controller:SetSelectedIndex(1)
		arg_5_0.btn4Controller:SetSelectedIndex(1)
	end)
	arg_5_0:AddBtnListener(arg_5_0.btn_3, nil, function()
		arg_5_0:RefreshUI(3)

		arg_5_0.params_.index = 3

		arg_5_0.btn1Controller:SetSelectedIndex(1)
		arg_5_0.btn2Controller:SetSelectedIndex(1)
		arg_5_0.btn3Controller:SetSelectedIndex(0)
		arg_5_0.btn4Controller:SetSelectedIndex(1)
	end)
	arg_5_0:AddBtnListener(arg_5_0.btn_4, nil, function()
		arg_5_0:RefreshUI(4)

		arg_5_0.params_.index = 4

		arg_5_0.btn1Controller:SetSelectedIndex(1)
		arg_5_0.btn2Controller:SetSelectedIndex(1)
		arg_5_0.btn3Controller:SetSelectedIndex(1)
		arg_5_0.btn4Controller:SetSelectedIndex(0)
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

		for iter_13_0, iter_13_1 in ipairs(arg_5_0.loadingSet_) do
			arg_5_0.loadingSet_[iter_13_0] = deepClone(IllustratedData:GetLoadingSetByType(iter_13_0))
		end

		arg_5_0:RefreshUI(arg_5_0.params_.index)
	end)
end

function var_0_0.UpdateData(arg_14_0, arg_14_1)
	arg_14_0.itemList_ = {}

	for iter_14_0, iter_14_1 in ipairs(CollectPictureCfg.get_id_list_by_type[arg_14_1]) do
		if not arg_14_0.isEditor_ and CollectPictureCfg[iter_14_1].group_display_order == 1 or arg_14_0.isEditor_ then
			if CollectPictureCfg[iter_14_1].type ~= 3 then
				table.insert(arg_14_0.itemList_, {
					id = iter_14_1
				})
			elseif IllustratedData:GetIllustrationInfo()[iter_14_1] then
				table.insert(arg_14_0.itemList_, {
					id = iter_14_1
				})
			end
		end
	end

	local var_14_0 = {}

	for iter_14_2, iter_14_3 in ipairs(arg_14_0.itemList_) do
		local var_14_1 = CollectPictureCfg[iter_14_3.id].group_id
		local var_14_2 = CollectPictureCfg.get_id_list_by_group_id[var_14_1]
		local var_14_3 = 1

		for iter_14_4, iter_14_5 in ipairs(var_14_2) do
			local var_14_4 = IllustratedData:GetIllustrationInfo()[iter_14_5]

			if var_14_4 and var_14_4.is_receive == 0 then
				var_14_3 = 0

				break
			end
		end

		var_14_0[var_14_1] = var_14_3
	end

	table.sort(arg_14_0.itemList_, function(arg_15_0, arg_15_1)
		local var_15_0 = CollectPictureCfg[arg_15_0.id].group_id
		local var_15_1 = CollectPictureCfg[arg_15_1.id].group_id
		local var_15_2 = IllustratedData:GetIllustrationInfo()[arg_15_0.id]
		local var_15_3 = IllustratedData:GetIllustrationInfo()[arg_15_1.id]

		if var_15_2 and not var_15_3 then
			return true
		end

		if not var_15_2 and var_15_3 then
			return false
		end

		if var_15_2 and var_15_3 then
			if arg_14_0.isEditor_ then
				local var_15_4 = arg_14_0:IsSelected(arg_15_0.id)

				if var_15_4 ~= arg_14_0:IsSelected(arg_15_1.id) then
					return var_15_4
				end
			elseif var_14_0[var_15_0] and var_14_0[var_15_1] and var_14_0[var_15_0] ~= var_14_0[var_15_1] then
				return var_14_0[var_15_0] < var_14_0[var_15_1]
			end

			return var_15_0 < var_15_1
		else
			return var_15_0 < var_15_1
		end
	end)
end

function var_0_0.indexItem(arg_16_0, arg_16_1, arg_16_2)
	local var_16_0 = arg_16_0.selectType_
	local var_16_1 = arg_16_0.itemList_[arg_16_1].id

	if arg_16_0.isEditor_ then
		arg_16_2:SetSelect(arg_16_0:IsSelected(var_16_1))
	else
		arg_16_2:SetSelect(false)
	end

	arg_16_2:RefreshUI(arg_16_0.itemList_[arg_16_1], arg_16_0.isEditor_)
	arg_16_2:RegisterGiftFunc(handler(arg_16_0, arg_16_0.ReceiveIllustrationReward))
	arg_16_2:RegisterItemFunc(handler(arg_16_0, arg_16_0.ItemClickFun))
end

function var_0_0.ReceiveIllustrationReward(arg_17_0)
	local var_17_0 = IlluTools.GetIllustrationNotRewardList()

	if #var_17_0 == 0 then
		error("发生错误")
	end

	IllustratedAction.ReceiveIllustrationReward(var_17_0)
end

function var_0_0.OnReceiveIllustrationReward(arg_18_0, arg_18_1, arg_18_2)
	local var_18_0 = mergeReward(arg_18_1.item_list)

	getReward(var_18_0)
	arg_18_0:RefreshUI(arg_18_0.params_.index)
end

function var_0_0.ItemClickFun(arg_19_0, arg_19_1)
	if arg_19_0.isEditor_ then
		local var_19_0 = CollectPictureCfg[arg_19_1].type

		if arg_19_0:IsSelected(arg_19_1) then
			table.remove(arg_19_0.loadingSet_[var_19_0], table.indexof(arg_19_0.loadingSet_[var_19_0], arg_19_1))
			arg_19_0.itemScroll_:Refresh()
			arg_19_0:RefreshEditorText()
		else
			local var_19_1 = 0

			for iter_19_0, iter_19_1 in ipairs(arg_19_0.loadingSet_) do
				var_19_1 = var_19_1 + #arg_19_0.loadingSet_[iter_19_0]
			end

			if var_19_1 >= GameSetting.loading_pic_max.value[1] then
				ShowTips("SET_FAILED")
			else
				table.insert(arg_19_0.loadingSet_[var_19_0], arg_19_1)
				arg_19_0.itemScroll_:Refresh()
				arg_19_0:RefreshEditorText()
				ShowTips("SET_CONFIRMED")
			end
		end
	else
		arg_19_0:Go("/illuIllustrationDetail", {
			ID = arg_19_1
		})
	end
end

function var_0_0.RefreshUI(arg_20_0, arg_20_1, arg_20_2)
	arg_20_0.editorCon_:SetSelectedState(arg_20_0.isEditor_ and "true" or "false")
	SetActive(arg_20_0.btn3trs_.gameObject, arg_20_0:IsShowToggleByType(var_0_1.ACTIVITY_STORY))
	SetActive(arg_20_0.btn4trs_.gameObject, arg_20_0:IsShowToggleByType(var_0_1.BIRTHDAY))
	arg_20_0:UpdateData(arg_20_1)

	if arg_20_2 then
		if arg_20_0.params_.scrollPos_ then
			arg_20_0.itemScroll_:StartScrollByPosition(#arg_20_0.itemList_, arg_20_0.params_.scrollPos_)
		else
			arg_20_0.itemScroll_:StartScroll(#arg_20_0.itemList_)
		end
	else
		arg_20_0.itemScroll_:StartScroll(#arg_20_0.itemList_)
	end

	if arg_20_0.isEditor_ then
		arg_20_0:RefreshEditorText()
	else
		arg_20_0:RefreshText(arg_20_1)
	end

	arg_20_0.btn1Controller:SetSelectedIndex(arg_20_1 == 1 and 0 or 1)
	arg_20_0.btn2Controller:SetSelectedIndex(arg_20_1 == 2 and 0 or 1)
	arg_20_0.btn3Controller:SetSelectedIndex(arg_20_1 == 3 and 0 or 1)
	arg_20_0.btn4Controller:SetSelectedIndex(arg_20_1 == 4 and 0 or 1)
end

function var_0_0.RefreshEditorText(arg_21_0)
	local var_21_0 = 0

	for iter_21_0, iter_21_1 in ipairs(arg_21_0.loadingSet_) do
		var_21_0 = var_21_0 + #arg_21_0.loadingSet_[iter_21_0]
	end

	arg_21_0.limitText_.text = var_21_0 .. "/" .. GameSetting.loading_pic_max.value[1]
end

function var_0_0.RefreshText(arg_22_0, arg_22_1)
	local var_22_0 = 0

	for iter_22_0, iter_22_1 in ipairs(CollectPictureCfg.get_id_list_by_type[arg_22_1]) do
		if IllustratedData:GetIllustrationInfo()[iter_22_1] then
			var_22_0 = var_22_0 + 1
		end
	end

	if arg_22_1 == 3 then
		arg_22_0.numText_.text = var_22_0 .. "/" .. var_22_0
	else
		local var_22_1 = #CollectPictureCfg.get_id_list_by_type[arg_22_1]

		arg_22_0.numText_.text = var_22_0 .. "/" .. var_22_1
	end
end

function var_0_0.IsShowToggleByType(arg_23_0, arg_23_1)
	for iter_23_0, iter_23_1 in ipairs(CollectPictureCfg.get_id_list_by_type[arg_23_1] or {}) do
		if IllustratedData:GetIllustrationInfo()[iter_23_1] then
			return true
		end
	end

	return false
end

function var_0_0.OnEnter(arg_24_0)
	arg_24_0.isEditor_ = false

	arg_24_0:UpdateBar()

	arg_24_0.params_.index = arg_24_0.params_.index or 1

	arg_24_0:RefreshUI(arg_24_0.params_.index, true)
	manager.redPoint:bindUIandKey(arg_24_0.btn1trs_, RedPointConst.ILLU_ILLUSTRATION1)
	manager.redPoint:bindUIandKey(arg_24_0.btn2trs_, RedPointConst.ILLU_ILLUSTRATION2)
	manager.redPoint:bindUIandKey(arg_24_0.btn3trs_, RedPointConst.ILLU_ILLUSTRATION3)
	manager.redPoint:bindUIandKey(arg_24_0.btn4trs_, RedPointConst.ILLU_ILLUSTRATION4)
end

function var_0_0.UpdateBar(arg_25_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR
	})
	manager.windowBar:RegistBackCallBack(function()
		if arg_25_0.isEditor_ and arg_25_0:IsChanged() then
			ShowMessageBox({
				title = GetTips("PROMPT"),
				content = GetTips("TIP_SETTING_CHANGE"),
				OkCallback = function()
					IllustratedAction.SaveLoadingSet(arg_25_0.loadingSet_)
				end,
				CancelCallback = function()
					arg_25_0.isEditor_ = false

					arg_25_0:RefreshUI(arg_25_0.params_.index)
				end
			})
		else
			arg_25_0:Back()
		end
	end)
	manager.windowBar:RegistHomeCallBack(function()
		if arg_25_0.isEditor_ and arg_25_0:IsChanged() then
			ShowMessageBox({
				title = GetTips("PROMPT"),
				content = GetTips("TIP_SETTING_CHANGE"),
				OkCallback = function()
					IllustratedAction.SaveLoadingSet(arg_25_0.loadingSet_)
					arg_25_0:Go("/home")
				end,
				CancelCallback = function()
					arg_25_0:Go("/home")
				end
			})
		else
			arg_25_0:Go("/home")
		end
	end)
end

function var_0_0.IsSelected(arg_32_0, arg_32_1)
	if not arg_32_1 then
		return false
	end

	local var_32_0 = CollectPictureCfg[arg_32_1].type

	return table.indexof(arg_32_0.loadingSet_[var_32_0], arg_32_1) ~= false
end

function var_0_0.IsChanged(arg_33_0)
	local var_33_0 = {}

	for iter_33_0, iter_33_1 in ipairs(arg_33_0.loadingSet_) do
		table.insertto(var_33_0, arg_33_0.loadingSet_[iter_33_0])
	end

	local var_33_1 = IllustratedData:GetAllLoadingSet()

	if #var_33_0 ~= #var_33_1 then
		return true
	end

	for iter_33_2, iter_33_3 in ipairs(var_33_0) do
		if not table.indexof(var_33_1, iter_33_3) then
			return true
		end
	end

	return false
end

function var_0_0.OnSaveLoadingSet(arg_34_0)
	arg_34_0.isEditor_ = false

	arg_34_0:RefreshUI(arg_34_0.params_.index)
end

function var_0_0.OnExit(arg_35_0)
	manager.windowBar:HideBar()
	manager.redPoint:unbindUIandKey(arg_35_0.btn1trs_, RedPointConst.ILLU_ILLUSTRATION1)
	manager.redPoint:unbindUIandKey(arg_35_0.btn2trs_, RedPointConst.ILLU_ILLUSTRATION2)
	manager.redPoint:unbindUIandKey(arg_35_0.btn3trs_, RedPointConst.ILLU_ILLUSTRATION3)
	manager.redPoint:unbindUIandKey(arg_35_0.btn4trs_, RedPointConst.ILLU_ILLUSTRATION4)

	arg_35_0.params_.scrollPos_ = arg_35_0.itemScroll_:GetScrolledPosition()
end

function var_0_0.Dispose(arg_36_0)
	arg_36_0.itemScroll_:Dispose()

	arg_36_0.itemScroll_ = nil

	var_0_0.super.Dispose(arg_36_0)
end

return var_0_0
