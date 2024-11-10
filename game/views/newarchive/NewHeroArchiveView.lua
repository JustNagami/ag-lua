local var_0_0 = class("NewHeroArchiveView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "UI/HeroArchive/ArchiveStoryMainUI_new"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0.type_ = 1
	arg_3_0.index_ = 0
	arg_3_0.itemIndex_ = 0

	arg_3_0:InitUI()
	arg_3_0:InitDropDown()
	arg_3_0:AddUIListener()
end

function var_0_0.InitUI(arg_4_0)
	arg_4_0:BindCfgUI()

	arg_4_0.uiList_ = LuaList.New(handler(arg_4_0, arg_4_0.IndexItem), arg_4_0.heroList_, NewHeroArchiveHeroItemView)
	arg_4_0.allBtnController_ = ControllerUtil.GetController(arg_4_0.allBtn_.transform, "state")

	arg_4_0:InitFillterItem()
end

function var_0_0.InitDropDown(arg_5_0)
	arg_5_0.dropDown_.options:Clear()
	arg_5_0.dropDown_.options:Add(UnityEngine.UI.Dropdown.OptionData.New(GetTips("HERO_ARCHIVES_TYPE_1"), nil))
	arg_5_0.dropDown_.options:Add(UnityEngine.UI.Dropdown.OptionData.New(GetTips("HERO_ARCHIVES_TYPE_2"), nil))
	arg_5_0.dropDown_:RefreshShownValue()
end

function var_0_0.InitFillterItem(arg_6_0)
	local var_6_0 = {}

	if not arg_6_0.fillterBtnList_ then
		arg_6_0.fillterBtnList_ = {}
	end

	for iter_6_0, iter_6_1 in pairs(RaceEffectCfg.all) do
		table.insert(var_6_0, RaceEffectCfg[iter_6_1])
	end

	for iter_6_2, iter_6_3 in ipairs(var_6_0) do
		if not arg_6_0.fillterBtnList_[iter_6_2] then
			local var_6_1 = Object.Instantiate(arg_6_0.fillterItem_)
			local var_6_2 = NewHeroArchiveHeroFillterItemView.New(var_6_1, iter_6_2)

			var_6_2.transform_:SetParent(arg_6_0.btnList_, false)
			var_6_2:SetData(iter_6_3, iter_6_2)
			var_6_2:SetClickCallBack(handler(arg_6_0, arg_6_0.ClickFillterBtn))
			SetActive(var_6_2.gameObject_, true)
			table.insert(arg_6_0.fillterBtnList_, var_6_2)
		end
	end
end

function var_0_0.ClickFillterBtn(arg_7_0, arg_7_1, arg_7_2)
	if arg_7_0.index_ == arg_7_2 then
		return
	end

	arg_7_0.index_ = arg_7_2

	if arg_7_0.type_ == 1 then
		arg_7_0.archiveList_ = ArchiveData:GetContinuousHeartArchiveListByType(arg_7_1)
	elseif arg_7_0.type_ == 2 then
		arg_7_0.archiveList_ = ArchiveData:GetContinuousSuperHeartArchiveListByType(arg_7_1)
	end

	arg_7_0.itemIndex_ = 0

	arg_7_0:RefreshUI()
end

function var_0_0.IndexItem(arg_8_0, arg_8_1, arg_8_2)
	arg_8_2:SetData(arg_8_0.archiveList_[arg_8_1], arg_8_0.type_)
	arg_8_2:SetClickCallBack(function()
		arg_8_0.itemIndex_ = arg_8_1
	end)
end

function var_0_0.AddUIListener(arg_10_0)
	arg_10_0:AddBtnListener(arg_10_0.allBtn_, nil, function()
		if arg_10_0.index_ == 0 then
			return
		end

		arg_10_0.index_ = 0
		arg_10_0.itemIndex_ = 0

		if arg_10_0.type_ == 1 then
			arg_10_0.archiveList_ = ArchiveData:GetContinuousHeartArchiveList()
		else
			arg_10_0.archiveList_ = ArchiveData:GetContinuousSuperHeartArchiveList()
		end

		arg_10_0:RefreshUI()
	end)
	arg_10_0:AddToggleListener(arg_10_0.dropDown_, function(arg_12_0)
		arg_10_0.itemIndex_ = 0

		if arg_12_0 == 0 then
			arg_10_0.type_ = 1
		else
			arg_10_0.type_ = 2
		end

		arg_10_0.index_ = 0

		if arg_10_0.type_ == 1 then
			arg_10_0.archiveList_ = ArchiveData:GetContinuousHeartArchiveList()
		else
			arg_10_0.archiveList_ = ArchiveData:GetContinuousSuperHeartArchiveList()
		end

		arg_10_0:RefreshUI()
	end)
end

function var_0_0.OnEnter(arg_13_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR
	})

	arg_13_0.scrollPosX = arg_13_0:DynamicDivision(arg_13_0.uiList_:GetScrolledPosition().x)
	arg_13_0.timer = Timer.New(function()
		local var_14_0 = arg_13_0:DynamicDivision(arg_13_0.uiList_:GetScrolledPosition().x)

		arg_13_0.filmAni_:SetFloat("floatSpeed", (var_14_0 - arg_13_0.scrollPosX) * 10)

		arg_13_0.scrollPosX = var_14_0
	end, 0.1, -1, true)

	arg_13_0.timer:Start()
	arg_13_0:RefreshUI()
end

function var_0_0.DynamicDivision(arg_15_0, arg_15_1)
	local var_15_0 = 10
	local var_15_1 = 1

	if arg_15_1 < 0 then
		var_15_1 = -1
		arg_15_1 = -arg_15_1
	end

	while arg_15_1 > 1 do
		arg_15_1 = arg_15_1 / var_15_0
		var_15_0 = var_15_0 * 10
	end

	return arg_15_1 * var_15_1
end

function var_0_0.RefreshUI(arg_16_0)
	if not arg_16_0.archiveList_ then
		if arg_16_0.type_ == 1 then
			arg_16_0.archiveList_ = ArchiveData:GetContinuousHeartArchiveList()
		elseif arg_16_0.type_ == 2 then
			arg_16_0.archiveList_ = ArchiveData:GetContinuousSuperHeartArchiveList()
		end
	end

	ArchiveData:SortHeartArchiveList(arg_16_0.archiveList_)

	if arg_16_0.index_ == 0 then
		arg_16_0.allBtnController_:SetSelectedState("selected")
	else
		arg_16_0.allBtnController_:SetSelectedState("unselected")
	end

	for iter_16_0, iter_16_1 in pairs(arg_16_0.fillterBtnList_) do
		iter_16_1:RefreshUI(arg_16_0.type_, arg_16_0.index_)
	end

	arg_16_0.listTimer = Timer.New(function()
		if arg_16_0.heroList_.gameObject.activeInHierarchy == true then
			arg_16_0.uiList_:StartScroll(#arg_16_0.archiveList_)
			arg_16_0.uiList_:ScrollToIndex(arg_16_0.itemIndex_, true, false)
			arg_16_0.listTimer:Stop()

			arg_16_0.listTimer = nil
		end
	end, 0.1, -1, true)

	arg_16_0.listTimer:Start()
end

function var_0_0.OnExit(arg_18_0)
	manager.windowBar:HideBar()

	if arg_18_0.timer then
		arg_18_0.timer:Stop()

		arg_18_0.timer = nil
	end

	if arg_18_0.listTimer then
		arg_18_0.listTimer:Stop()

		arg_18_0.listTimer = nil
	end
end

function var_0_0.Dispose(arg_19_0)
	if arg_19_0.fillterBtnList_ then
		for iter_19_0, iter_19_1 in pairs(arg_19_0.fillterBtnList_) do
			iter_19_1:Dispose()
		end
	end

	if arg_19_0.uiList_ then
		arg_19_0.uiList_:Dispose()

		arg_19_0.uiList_ = nil
	end

	var_0_0.super.Dispose(arg_19_0)
end

return var_0_0
