local var_0_0 = class("DormHeroGiftView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/BackHouseUI/Dorm/DormGiftFurnitureUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.OnCtor(arg_3_0)
	return
end

function var_0_0.Init(arg_4_0)
	arg_4_0:InitUI()
	arg_4_0:AddUIListener()
end

function var_0_0.InitUI(arg_5_0)
	arg_5_0:BindCfgUI()

	arg_5_0.giftScroll = LuaList.New(handler(arg_5_0, arg_5_0.indexItem), arg_5_0.uilistGo_, FurnitureItem)
	arg_5_0.fullController = ControllerUtil.GetController(arg_5_0.transform_, "state")
	arg_5_0.btnState = arg_5_0.btn_okControllerexcollection_:GetController("default0")
end

function var_0_0.OnEnter(arg_6_0)
	arg_6_0.archiveID = arg_6_0.params_.archiveID
	arg_6_0.heroInfo = DormData:GetHeroInfoList()[arg_6_0.archiveID]

	arg_6_0:RegisterEvents()
	arg_6_0:RefreshHeroGiftList()
	arg_6_0:ResetView()

	if not arg_6_0.heroInfo then
		Debug.LogError("未找到对应角色档案信息")
	end

	if arg_6_0.params_.heroEID then
		arg_6_0.heroEID = arg_6_0.params_.heroEID
	end
end

function var_0_0.OnExit(arg_7_0)
	arg_7_0.heroEID = nil
	arg_7_0.selFurID = nil
	arg_7_0.itemIndex = nil

	arg_7_0:RemoveAllEventListener()
end

function var_0_0.indexItem(arg_8_0, arg_8_1, arg_8_2)
	arg_8_2:RefreshUI(arg_8_0.dataList_[arg_8_1], arg_8_0.selFurID, DormEnum.FurItemType.Gift, arg_8_0.archiveID, arg_8_1)
	arg_8_2:OnPointerDown(function(arg_9_0, arg_9_1)
		if arg_8_0.selFurID == arg_9_0 then
			return
		end

		arg_8_0.selFurID = arg_9_0
		arg_8_0.itemIndex = arg_9_1

		local var_9_0 = arg_8_0.heroInfo:GetCanGiftNum(arg_8_0.selFurID)

		if var_9_0 <= 0 then
			arg_8_0.fullController:SetSelectedState("false")
			arg_8_0.btnState:SetSelectedState("off")

			arg_8_0.fullText.text = GetTips("DORM_GIFT_MAX_TIPS")
		else
			arg_8_0.furNumMax = math.max(var_9_0, 1)
			arg_8_0.progressSlr_.maxValue = arg_8_0.furNumMax

			arg_8_0.fullController:SetSelectedState("true")
			arg_8_0.btnState:SetSelectedState("on")
			arg_8_0:SetfurNum(1)
		end

		arg_8_0.giftScroll:Refresh()
	end)
end

function var_0_0.RegisterEvents(arg_10_0)
	arg_10_0:RegistEventListener(DORM_REFRESH_GIFT_FUR_LIST, function()
		arg_10_0:RefreshHeroGiftList()
		arg_10_0:ResetView()
	end)
	arg_10_0:RegistEventListener(DORM_PRIVATE_LEVEL_UP, function()
		ShowTips(GetTips("DORM_LEVEL_UP_TIPS"))
	end)
end

function var_0_0.AddUIListener(arg_13_0)
	arg_13_0:AddBtnListenerScale(arg_13_0.giftBtn_, nil, function()
		if arg_13_0.selFurID and arg_13_0.progressSlr_.value > 0 then
			local var_14_0 = {
				[arg_13_0.selFurID] = arg_13_0.progressSlr_.value
			}

			DormAction:GiftFurToHero(arg_13_0.archiveID, var_14_0, arg_13_0.heroEID)
		end
	end)
	arg_13_0:AddBtnListenerScale(arg_13_0.cancelBtn_, nil, function()
		JumpTools.Back()
	end)
	arg_13_0:AddToggleListener(arg_13_0.progressSlr_, function()
		if arg_13_0.progressSlr_.value < 1 then
			arg_13_0.progressSlr_.value = 1
		end

		if arg_13_0.selFurID then
			arg_13_0:SetfurNum(arg_13_0.progressSlr_.value)
		end
	end)
	arg_13_0:AddPressingByTimeListener(arg_13_0.reduceNumBtn_.gameObject, 3, 0.5, 0.5, function()
		if arg_13_0.selFurID and arg_13_0.progressSlr_.value > 1 then
			local var_17_0 = arg_13_0.progressSlr_.value - 1

			arg_13_0:SetfurNum(var_17_0)

			return true
		end

		return false
	end)
	arg_13_0:AddPressingByTimeListener(arg_13_0.addNumBtn_.gameObject, 3, 0.5, 0.5, function()
		if arg_13_0.selFurID and arg_13_0.progressSlr_.value < arg_13_0.furNumMax then
			local var_18_0 = arg_13_0.progressSlr_.value + 1

			arg_13_0:SetfurNum(var_18_0)

			return true
		end

		return false
	end)
end

function var_0_0.SetfurNum(arg_19_0, arg_19_1)
	arg_19_0.numText_.text = arg_19_1
	arg_19_0.progressSlr_.value = arg_19_1
	arg_19_0.reduceNumBtn_.interactable = arg_19_1 > 1
	arg_19_0.addNumBtn_.interactable = arg_19_1 < arg_19_0.progressSlr_.maxValue
end

function var_0_0.RefreshHeroGiftList(arg_20_0)
	arg_20_0.dataList_ = {}

	local var_20_0 = DormData:GetFurnitureInfoList()

	for iter_20_0, iter_20_1 in pairs(var_20_0) do
		if BackHomeFurniture[iter_20_0].is_give == 1 and iter_20_1.num > iter_20_1.give_num then
			table.insert(arg_20_0.dataList_, iter_20_0)
		end
	end

	CommonTools.UniversalSortEx(arg_20_0.dataList_, {
		map = function(arg_21_0)
			if DormData:GetHeroInfo(arg_20_0.archiveID):GetCanGiftNum(arg_21_0) == 0 then
				return 1
			else
				return 2
			end
		end
	}, {
		ascend = true,
		map = function(arg_22_0)
			return arg_22_0
		end
	})

	if not arg_20_0.selFurID and #arg_20_0.dataList_ > 0 then
		arg_20_0.selFurID = arg_20_0.dataList_[1]
	end

	arg_20_0.giftScroll:StartScroll(#arg_20_0.dataList_)

	if arg_20_0.itemIndex then
		arg_20_0.giftScroll:ScrollToIndex(arg_20_0.itemIndex, true, false)
	end

	if #arg_20_0.dataList_ == 0 then
		arg_20_0.listText.text = ""

		arg_20_0.fullController:SetSelectedState("false")
		arg_20_0.btnState:SetSelectedState("off")
	end
end

function var_0_0.ResetView(arg_23_0)
	if arg_23_0.selFurID then
		local var_23_0 = false

		for iter_23_0, iter_23_1 in ipairs(arg_23_0.dataList_) do
			if iter_23_1 == arg_23_0.selFurID then
				var_23_0 = true

				break
			end
		end

		if not var_23_0 then
			arg_23_0.fullController:SetSelectedState("false")
			arg_23_0.btnState:SetSelectedState("off")

			arg_23_0.fullText.text = ""

			return
		end

		local var_23_1 = arg_23_0.heroInfo:GetCanGiftNum(arg_23_0.selFurID)

		if var_23_1 <= 0 then
			arg_23_0.fullController:SetSelectedState("false")
			arg_23_0.btnState:SetSelectedState("off")

			arg_23_0.fullText.text = GetTips("DORM_GIFT_MAX_TIPS")
		else
			arg_23_0.progressSlr_.minValue = 0
			arg_23_0.furNumMax = var_23_1
			arg_23_0.progressSlr_.maxValue = arg_23_0.furNumMax

			arg_23_0.fullController:SetSelectedState("true")
			arg_23_0.btnState:SetSelectedState("on")
			arg_23_0:SetfurNum(1)
		end
	else
		arg_23_0.fullController:SetSelectedState("false")
		arg_23_0.btnState:SetSelectedState("off")

		arg_23_0.fullText.text = ""
	end
end

function var_0_0.Dispose(arg_24_0)
	if arg_24_0.giftScroll then
		arg_24_0.giftScroll:Dispose()
	end

	var_0_0.super.Dispose(arg_24_0)
end

return var_0_0
