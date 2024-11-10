local var_0_0 = class("ObtainView", ReduxView)
local var_0_1 = "OBTAIN_HERO_MOVIE"

function var_0_0.UIName(arg_1_0)
	return "Widget/System/ObtainUI/ObtainUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiPop.transform
end

function var_0_0.Create(arg_3_0, arg_3_1, arg_3_2)
	local var_3_0 = arg_3_0.content_
	local var_3_1

	if arg_3_1 == ItemConst.ITEM_TYPE.HERO then
		local var_3_2

		if arg_3_2 == 2 then
			var_3_2 = Asset.Load("Widget/System/ObtainUI/ObtainHeroSUI")
		elseif arg_3_2 == 1 then
			var_3_2 = Asset.Load("Widget/System/ObtainUI/ObtainHeroAUI")
		else
			var_3_2 = Asset.Load("Widget/System/ObtainUI/ObtainHeroBUI")
		end

		var_3_1 = ObtainHeroView.New(var_3_2, var_3_0)
	elseif arg_3_1 == ItemConst.ITEM_TYPE.WEAPON_SERVANT then
		local var_3_3

		if arg_3_2 == 2 then
			var_3_3 = Asset.Load("Widget/System/ObtainUI/ObtainWeaponSUI")
		elseif arg_3_2 == 1 then
			var_3_3 = Asset.Load("Widget/System/ObtainUI/ObtainWeaponAUI")
		else
			var_3_3 = Asset.Load("Widget/System/ObtainUI/ObtainWeaponBUI")
		end

		var_3_1 = ObtainWeaponView.New(var_3_3, var_3_0)
	elseif arg_3_1 == ItemConst.ITEM_TYPE.HERO_SKIN then
		local var_3_4

		if arg_3_2 == 2 then
			var_3_4 = Asset.Load("Widget/System/ObtainUI/Skin/ObtainSkinSUI")
		elseif arg_3_2 == 1 then
			var_3_4 = Asset.Load("Widget/System/ObtainUI/Skin/ObtainSkinAUI")
		else
			var_3_4 = Asset.Load("Widget/System/ObtainUI/Skin/ObtainSkinBUI")
		end

		var_3_1 = ObtainSkinView.New(var_3_4, var_3_0)
	elseif arg_3_1 == var_0_1 then
		local var_3_5 = Asset.Load("Widget/System/ObtainUI/HeroMovie/ObtainHeroMovieUI")

		var_3_1 = ObtainHeroMovieView.New(var_3_5, var_3_0, arg_3_0.showSkipHandler, arg_3_0.refreshShareHandler_, arg_3_0.skipStart)
	else
		local var_3_6 = Asset.Load("Widget/System/ObtainUI/ObtainItemUI")

		var_3_1 = ObtainItemView.New(var_3_6, var_3_0)
	end

	var_3_1:Init()

	return var_3_1
end

function var_0_0.Init(arg_4_0)
	arg_4_0:InitUI()
	arg_4_0:AddListeners()
end

function var_0_0.InitUI(arg_5_0)
	arg_5_0:BindCfgUI()

	arg_5_0.list = {}
	arg_5_0.showSkipHandler = handler(arg_5_0, arg_5_0.ShowSkipBtn)
	arg_5_0.refreshShareHandler_ = handler(arg_5_0, arg_5_0.RefreshShareBtn)

	arg_5_0:RefreshShareBtn()
end

function var_0_0.ShowSkipBtn(arg_6_0)
	if arg_6_0.goSkip_ and arg_6_0.skipHandler then
		SetActive(arg_6_0.goSkip_, not arg_6_0:GetIsHaveUnWatchHero())
	end
end

function var_0_0.RefreshShareBtn(arg_7_0)
	SetActive(arg_7_0.goShare_, OperationData:IsOperationOpen(OperationConst.SHARE_FLAG) and not SDKTools.GetIsOverSea())
end

function var_0_0.AddListeners(arg_8_0)
	if arg_8_0.maskBtn_ then
		arg_8_0:AddBtnListener(arg_8_0.maskBtn_, nil, handler(arg_8_0, arg_8_0.OnMaskBtnClick))
	end

	if arg_8_0.skipBtn_ then
		arg_8_0:AddBtnListener(arg_8_0.skipBtn_, nil, handler(arg_8_0, arg_8_0.OnSkipBtnClick))
	end

	arg_8_0:AddBtnListener(arg_8_0.buttonShare_, nil, function()
		local var_9_0 = arg_8_0.itemList[arg_8_0.index]

		arg_8_0.cur:Skip2End()

		if arg_8_0.timer_ then
			arg_8_0.timer_:Stop()
		end

		local var_9_1 = arg_8_0.goShare_.activeSelf
		local var_9_2 = arg_8_0.goSkip_.activeSelf

		arg_8_0.timer_ = Timer.New(function()
			arg_8_0.timer_:Stop()

			arg_8_0.timer_ = nil

			manager.share:Share(function()
				SetActive(arg_8_0.goShare_, false)
				SetActive(arg_8_0.goSkip_, false)
				arg_8_0.cur:HideShareUI(var_9_0)
			end, function()
				SetActive(arg_8_0.goShare_, var_9_1)
				SetActive(arg_8_0.goSkip_, var_9_2)
				arg_8_0.cur:ShowShareUI(var_9_0)
			end, function()
				return
			end)
		end, 0.066, 1)

		arg_8_0.timer_:Start()
	end)
end

function var_0_0.OnMaskBtnClick(arg_14_0)
	if arg_14_0.cur and arg_14_0.cur:OnClick() then
		arg_14_0:DoNext()
	end
end

function var_0_0.OnSkipBtnClick(arg_15_0)
	arg_15_0:Back()

	if arg_15_0.skipHandler then
		arg_15_0.skipHandler()
	end
end

function var_0_0.DoNext(arg_16_0)
	if arg_16_0.cur then
		arg_16_0.cur:Hide()
	end

	arg_16_0.index = arg_16_0.index + 1

	if arg_16_0.index > #arg_16_0.itemList then
		arg_16_0:Back()

		if arg_16_0.doNextHandler then
			arg_16_0.doNextHandler()
		end
	else
		local var_16_0 = arg_16_0.itemList[arg_16_0.index]
		local var_16_1 = ItemWillConvert(var_16_0) and var_16_0.convert_from.id or var_16_0.id
		local var_16_2 = ItemCfg[var_16_1]
		local var_16_3 = var_16_2.type

		if var_16_3 ~= ItemConst.ITEM_TYPE.HERO and var_16_3 ~= ItemConst.ITEM_TYPE.WEAPON_SERVANT and var_16_3 ~= ItemConst.ITEM_TYPE.HERO_SKIN then
			var_16_3 = 0
		end

		if not var_16_2 then
			arg_16_0:DoNext()
		else
			local var_16_4 = var_16_2.display_rare
			local var_16_5 = 0
			local var_16_6 = var_16_4 >= 5 and 2 or var_16_4 >= 4 and 1 or 0
			local var_16_7 = var_16_3 .. "_" .. var_16_6

			if var_16_3 == ItemConst.ITEM_TYPE.HERO and ObtainHeroMovieCfg[var_16_1] then
				var_16_3 = var_0_1
				var_16_7 = var_0_1

				if not (getData(DrawConst.WATCH_TAG, tostring(var_16_1)) or false) then
					SetActive(arg_16_0.goSkip_, false)
					SetActive(arg_16_0.goShare_, false)
				end
			end

			if not arg_16_0.list[var_16_7] then
				arg_16_0.list[var_16_7] = arg_16_0:Create(var_16_3, var_16_6)
			end

			arg_16_0.cur = arg_16_0.list[var_16_7]

			arg_16_0.cur:Show(var_16_0, arg_16_0.obtainsParams)
		end
	end
end

function var_0_0.GetIsHaveUnWatchHero(arg_17_0)
	local var_17_0 = #arg_17_0.itemList

	if var_17_0 > 0 then
		for iter_17_0 = arg_17_0.index + 1, var_17_0 do
			local var_17_1 = arg_17_0.itemList[iter_17_0]

			if ItemCfg[var_17_1.id].type == ItemConst.ITEM_TYPE.HERO and ObtainHeroMovieCfg[var_17_1.id] and not (getData(DrawConst.WATCH_TAG, tostring(var_17_1.id)) or false) then
				return true
			end
		end
	end

	return false
end

function var_0_0.OnEnter(arg_18_0)
	arg_18_0.doNextHandler = arg_18_0.params_.doNextHandler
	arg_18_0.skipHandler = arg_18_0.params_.skipHandler
	arg_18_0.itemList = arg_18_0.params_.itemList
	arg_18_0.skipStart = arg_18_0.params_.skipStart
	arg_18_0.obtainsParams = arg_18_0.params_.obtainsParams
	arg_18_0.index = 0

	if arg_18_0.goSkip_ and arg_18_0.skipHandler then
		SetActive(arg_18_0.goSkip_, not arg_18_0:GetIsHaveUnWatchHero())
	else
		SetActive(arg_18_0.goSkip_, false)
	end

	if manager.windowBar:GetIsShow() then
		arg_18_0.barList = manager.windowBar:GetLastBarList()

		manager.windowBar:HideBar()
	else
		arg_18_0.barList = nil
	end

	arg_18_0:DoNext()
end

function var_0_0.OnExit(arg_19_0)
	if arg_19_0.cur then
		arg_19_0.cur:Hide()

		arg_19_0.cur = nil
	end

	if arg_19_0.barList then
		manager.windowBar:SwitchBar(arg_19_0.barList)
	end

	manager.gc:Collect()
	Resources.UnloadUnusedAssets()

	if arg_19_0.timer_ then
		arg_19_0.timer_:Stop()

		arg_19_0.timer_ = nil
	end
end

function var_0_0.Dispose(arg_20_0)
	for iter_20_0, iter_20_1 in pairs(arg_20_0.list) do
		iter_20_1:Dispose()
	end

	arg_20_0.list = {}

	var_0_0.super.Dispose(arg_20_0)
end

function var_0_0.OnObtainHeroMovieAnimtionEvent(arg_21_0)
	for iter_21_0, iter_21_1 in pairs(arg_21_0.list) do
		iter_21_1:OnObtainHeroMovieAnimtionEvent()
	end
end

return var_0_0
