local var_0_0 = class("IlluServantManual", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/System/IllustratedHandbook/IlluServantUI"
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

	arg_4_0.tree_ = LuaTree.New(arg_4_0.uitreeGo_)

	arg_4_0.tree_:SetSelectedHandler(handler(arg_4_0, arg_4_0.OnGroupSelect), nil)

	local var_4_0 = UITreeData.New()

	arg_4_0:UpdateToggleData()

	for iter_4_0, iter_4_1 in ipairs(arg_4_0.toggleList_) do
		local var_4_1 = UITreeGroupData.New()

		var_4_1.id = iter_4_0
		var_4_1.text = GetI18NText(iter_4_1)

		var_4_0.groupDatas:Add(var_4_1)
	end

	arg_4_0.tree_:SetData(var_4_0)

	arg_4_0.itemScroll_ = LuaList.New(handler(arg_4_0, arg_4_0.indexItem), arg_4_0.uilistGo_, IlluServantManualItem)
end

function var_0_0.OnGroupSelect(arg_5_0, arg_5_1)
	arg_5_0.selectIndex_ = arg_5_1
	arg_5_0.params_.index = arg_5_0.selectIndex_

	arg_5_0:UpdateItemData(arg_5_0.selectIndex_)
	arg_5_0.itemScroll_:StartScroll(#arg_5_0.itemList_)
	arg_5_0:RefreshCollectNum(arg_5_1)
end

function var_0_0.UpdateToggleData(arg_6_0)
	local var_6_0 = GetTips("ALL")

	arg_6_0.toggleList_ = {
		var_6_0
	}
	arg_6_0.raceList_ = {}

	for iter_6_0, iter_6_1 in pairs(WeaponServantCfg.get_id_list_by_race) do
		table.insert(arg_6_0.raceList_, iter_6_0)
	end

	table.sort(arg_6_0.raceList_, function(arg_7_0, arg_7_1)
		return arg_7_0 < arg_7_1
	end)

	for iter_6_2, iter_6_3 in ipairs(arg_6_0.raceList_) do
		table.insert(arg_6_0.toggleList_, RaceEffectCfg[iter_6_3].name)
	end
end

function var_0_0.UpdateItemData(arg_8_0, arg_8_1)
	arg_8_0.itemList_ = {}
	arg_8_0.maxNum_ = 0

	if arg_8_1 == 1 then
		for iter_8_0, iter_8_1 in ipairs(WeaponServantCfg.all) do
			local var_8_0 = IllustratedData:GetServantInfo()[iter_8_1]

			if not ServantTools.GetIsHide(iter_8_1) and (var_8_0 or WeaponServantCfg[iter_8_1].display_type ~= 1) then
				table.insert(arg_8_0.itemList_, {
					name = ItemTools.getItemName(iter_8_1),
					id = iter_8_1,
					isUnlock = var_8_0
				})

				arg_8_0.maxNum_ = arg_8_0.maxNum_ + 1
			end
		end
	else
		local var_8_1 = arg_8_0.raceList_[arg_8_1 - 1]

		for iter_8_2, iter_8_3 in ipairs(WeaponServantCfg.get_id_list_by_race[var_8_1]) do
			local var_8_2 = IllustratedData:GetServantInfo()[iter_8_3]

			if not ServantTools.GetIsHide(iter_8_3) and (var_8_2 or WeaponServantCfg[iter_8_3].display_type ~= 1) then
				table.insert(arg_8_0.itemList_, {
					name = ItemTools.getItemName(iter_8_3),
					id = iter_8_3,
					isUnlock = var_8_2
				})

				arg_8_0.maxNum_ = arg_8_0.maxNum_ + 1
			end
		end
	end

	table.sort(arg_8_0.itemList_, function(arg_9_0, arg_9_1)
		if arg_9_0.isUnlock and not arg_9_1.isUnlock then
			return true
		end

		if arg_9_1.isUnlock and not arg_9_0.isUnlock then
			return false
		end

		if ItemCfg[arg_9_0.id].rare ~= ItemCfg[arg_9_1.id].rare then
			return ItemCfg[arg_9_0.id].rare > ItemCfg[arg_9_1.id].rare
		end

		return arg_9_0.id > arg_9_1.id
	end)
end

function var_0_0.indexItem(arg_10_0, arg_10_1, arg_10_2)
	arg_10_2:RefreshUI(arg_10_0.itemList_[arg_10_1])
end

function var_0_0.AddUIListener(arg_11_0)
	return
end

function var_0_0.OnEnter(arg_12_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR
	})

	arg_12_0.selectIndex_ = arg_12_0.params_.index or 1
	arg_12_0.params_.index = arg_12_0.selectIndex_

	arg_12_0.tree_:SelectGroup(arg_12_0.selectIndex_)

	if arg_12_0.params_.scrollPos_ then
		arg_12_0.itemScroll_:StartScrollByPosition(#arg_12_0.itemList_, arg_12_0.params_.scrollPos_)
	end
end

function var_0_0.RefreshCollectNum(arg_13_0, arg_13_1)
	local var_13_0 = #arg_13_0.itemList_
	local var_13_1 = 0

	if arg_13_1 == 1 then
		var_13_1 = table.length(IllustratedData:GetServantInfo())
	else
		local var_13_2 = arg_13_0.raceList_[arg_13_1 - 1]

		for iter_13_0, iter_13_1 in ipairs(WeaponServantCfg.get_id_list_by_race[var_13_2]) do
			if IllustratedData:GetServantInfo()[iter_13_1] then
				var_13_1 = var_13_1 + 1
			end
		end
	end

	arg_13_0.collectnumText_.text = var_13_1 .. "/" .. arg_13_0.maxNum_
end

function var_0_0.OnExit(arg_14_0)
	manager.windowBar:HideBar()

	arg_14_0.params_.scrollPos_ = arg_14_0.itemScroll_:GetScrolledPosition()
end

function var_0_0.Dispose(arg_15_0)
	arg_15_0.itemScroll_:Dispose()
	arg_15_0.tree_:Dispose()
	var_0_0.super.Dispose(arg_15_0)
end

return var_0_0
