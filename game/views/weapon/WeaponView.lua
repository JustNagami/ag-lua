local var_0_0 = class("WeaponView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/System/Hero_key/HeroKeyDetailsUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.buildContext(arg_3_0)
	arg_3_0.context = {
		controllerWrap = {
			comps = arg_3_0.gameObject_:GetComponent("ControllerExCollection"),
			state = {
				selectDetail = {
					False = "false",
					name = "selectDetail",
					True = "true"
				},
				selectUp = {
					False = "false",
					name = "selectUp",
					True = "true"
				}
			}
		},
		tabGroup = {
			{
				btnState = "selectDetail",
				OnEnter = handler(arg_3_0, arg_3_0.SwitchToDetailTab)
			},
			{
				btnState = "selectUp",
				OnEnter = handler(arg_3_0, arg_3_0.SwitchToLvUpTab)
			}
		},
		data = {
			heroId = 0,
			curPageIdx = 0,
			proxyTag = 0,
			weaponInfo = {}
		},
		syntheiseHandle = handler(arg_3_0, arg_3_0.OnSynthesiseSuccess)
	}
	arg_3_0.pageView = {
		detailView = {
			viewPath = "game.views.weapon.WeaponSubView.WeaponDetailView",
			name = "detailView",
			uiRootPath = "Widget/System/Hero_key/HeroKeyMessageUI",
			pageIdx = 1,
			stateName = "Detail"
		},
		lvupView = {
			viewPath = "game.views.weapon.WeaponSubView.WeaponLvupView",
			name = "lvupView",
			uiRootPath = "Widget/System/Hero_key/HeroKeyLevelUpUI",
			pageIdx = 2,
			stateName = "LvUp",
			barCurrency = {
				CurrencyConst.CURRENCY_TYPE_GOLD
			}
		},
		breakView = {
			viewPath = "game.views.weapon.WeaponSubView.WeaponBreakSubView",
			name = "breakView",
			uiRootPath = "Widget/System/Hero_key/HeroKeyBreakUI",
			pageIdx = 3,
			stateName = "Break",
			barCurrency = {
				CurrencyConst.CURRENCY_TYPE_GOLD
			}
		}
	}
end

function var_0_0.InitContext(arg_4_0)
	local var_4_0 = arg_4_0.params_.type or HeroConst.HERO_DATA_TYPE.DEFAULT

	arg_4_0.data = {
		heroId = 0,
		curPageIdx = 0,
		proxyTag = 0,
		curTabIdx = -1,
		weaponInfo = {},
		type = var_4_0,
		dataPorxy = HeroViewDataProxy.New(var_4_0)
	}
end

function var_0_0.Init(arg_5_0)
	arg_5_0:BindCfgUI()
	arg_5_0:buildContext()
	arg_5_0:AddUIListener()
	arg_5_0:AddEventListeners()
end

function var_0_0.OnEnter(arg_6_0)
	manager.notify:RegistListener(ON_SYNTHESISE_USE_ITEM_SUCCESS, arg_6_0.context.syntheiseHandle)

	for iter_6_0, iter_6_1 in pairs(arg_6_0.pageView) do
		if iter_6_1.view then
			iter_6_1.view:OnEnter()
		end
	end

	local var_6_0 = 1

	if arg_6_0.params_.state and arg_6_0.params_.state == "strength" then
		var_6_0 = 2
	end

	arg_6_0:InitContext()
	arg_6_0:SetHeroId(arg_6_0.params_.HeroID)
	arg_6_0:UpdateWeaponInfo()
	arg_6_0:ResetWeaponView()
	arg_6_0:BuildTabDesc()
	arg_6_0:SwitchToTab(var_6_0, true)
end

function var_0_0.CameraEnter(arg_7_0)
	manager.heroRaiseTrack:SetViewState(HeroRaiseTrackConst.ViewType.heroRaiseCommon, {
		HeroRaiseTrackConst.HeroRaiseType.weapon,
		1,
		HeroRaiseTrackConst.HeroServantType.weapon
	}, arg_7_0.displayGo_)
end

function var_0_0.OnExit(arg_8_0)
	manager.notify:RemoveListener(ON_SYNTHESISE_USE_ITEM_SUCCESS, arg_8_0.context.syntheiseHandle)

	for iter_8_0, iter_8_1 in pairs(arg_8_0.pageView) do
		if iter_8_1.view then
			iter_8_1.view:OnExit()
		end
	end

	manager.windowBar:HideBar()
end

function var_0_0.DisposeContext(arg_9_0)
	arg_9_0.context.controllerWrap.comps = nil

	for iter_9_0, iter_9_1 in pairs(arg_9_0.pageView) do
		iter_9_1.viewObj = nil

		if iter_9_1.view then
			iter_9_1.view:Dispose()

			iter_9_1.view = nil
		end
	end
end

function var_0_0.Dispose(arg_10_0)
	arg_10_0:DisposeContext()
	arg_10_0:RemoveAllListeners()
	var_0_0.super.Dispose(arg_10_0)
end

function var_0_0.AddEventListeners(arg_11_0)
	arg_11_0:RegistEventListener(CURRENCY_UPDATE, function(arg_12_0)
		if arg_12_0 == CurrencyConst.CURRENCY_TYPE_GOLD then
			arg_11_0:OnGoldChange()
		end
	end)
	arg_11_0:RegistEventListener(WEAPON_BREAK, function()
		arg_11_0:OnWeaponBreak()
		arg_11_0:ChangeWindowBar()
	end)
	arg_11_0:RegistEventListener(WEAPON_STR, function()
		arg_11_0:OnWeaponLvUp()
		arg_11_0:ChangeWindowBar()
	end)
end

function var_0_0.AddUIListener(arg_15_0)
	for iter_15_0 = 1, 2 do
		arg_15_0:AddToggleListener(arg_15_0[string.format("tabToggle%d_", iter_15_0)], function(arg_16_0)
			if arg_15_0.data.curTabIdx == iter_15_0 then
				return
			end

			arg_15_0:OnTabSwitch(iter_15_0, arg_16_0)
		end)
	end
end

function var_0_0.OnTabSwitch(arg_17_0, arg_17_1, arg_17_2)
	if arg_17_2 then
		arg_17_0:SwitchToTab(arg_17_1, true)
		OperationRecorder.Record("hero", string.format("weaponPage2%d", arg_17_1))
	end
end

function var_0_0.SwitchToTab(arg_18_0, arg_18_1, arg_18_2)
	arg_18_0.data.curTabIdx = arg_18_1

	local var_18_0 = arg_18_0.context.tabGroup

	for iter_18_0, iter_18_1 in pairs(var_18_0) do
		if iter_18_0 == arg_18_1 then
			arg_18_0:SwitchControllerState(var_18_0[iter_18_0].btnState, "true")

			if arg_18_2 then
				var_18_0[iter_18_0].OnEnter(true)
			end
		else
			arg_18_0:SwitchControllerState(var_18_0[iter_18_0].btnState, "false")
		end
	end
end

function var_0_0.OnWeaponBreak(arg_19_0)
	arg_19_0:ShowBreakTips()
	arg_19_0:UpdateWeaponInfo()
	arg_19_0:SwitchToTab(2, false)
	arg_19_0:SwitchToView(arg_19_0.pageView.lvupView, true)
	arg_19_0:BuildTabDesc()
end

function var_0_0.OnWeaponLvUp(arg_20_0)
	arg_20_0:UpdateWeaponInfo()

	local var_20_0 = arg_20_0.data.weaponInfo
	local var_20_1 = var_20_0.breakthrough
	local var_20_2 = GameSetting.weapon_exp_limit.value[var_20_1 + 1]

	if var_20_0.level == HeroConst.WEAPON_LV_MAX then
		arg_20_0:SwitchToTab(1, true)
	elseif var_20_0.level == var_20_2 then
		arg_20_0:SwitchToTab(2, false)
		arg_20_0:SwitchToView(arg_20_0.pageView.breakView, true)
	end

	arg_20_0:BuildTabDesc()
end

function var_0_0.ShowBreakTips(arg_21_0)
	local var_21_0 = arg_21_0.data.weaponInfo
	local var_21_1 = arg_21_0.data.heroId

	JumpTools.OpenPageByJump("weaponBreak", {
		heroID = var_21_1,
		breakthrough = var_21_0.breakthrough
	})
end

function var_0_0.OnSynthesiseSuccess(arg_22_0)
	arg_22_0:OnGoldChange()
end

function var_0_0.SwitchControllerState(arg_23_0, arg_23_1, arg_23_2)
	local var_23_0 = arg_23_0.context.controllerWrap.comps:GetController(arg_23_1)

	if var_23_0 then
		var_23_0:SetSelectedState(arg_23_2)
	end
end

function var_0_0.ResetWeaponView(arg_24_0)
	local var_24_0 = arg_24_0:GetHeroId()

	if var_24_0 and var_24_0 ~= 0 then
		manager.heroRaiseTrack:SetModelState(HeroTools.HeroUsingSkinInfo(var_24_0).id)
	end
end

function var_0_0.BuildTabDesc(arg_25_0)
	if arg_25_0:CheckWeaponCanBreakUp() then
		arg_25_0.tab2Txt_.text = GetTips("TIP_BREAK")
	else
		arg_25_0.tab2Txt_.text = GetTips("TIP_STRENGTH")
	end
end

function var_0_0.OnGoldChange(arg_26_0)
	if arg_26_0.data.curPageIdx == arg_26_0.pageView.lvupView.pageIdx then
		arg_26_0.pageView.lvupView.view:OnGoldChange()
	elseif arg_26_0.data.curPageIdx == arg_26_0.pageView.breakView.pageIdx then
		arg_26_0.pageView.breakView.view:OnGoldChange()
	end
end

function var_0_0.SwitchToDetailTab(arg_27_0, arg_27_1)
	arg_27_0:SwitchToView(arg_27_0.pageView.detailView, arg_27_1)
end

function var_0_0.SwitchToLvUpTab(arg_28_0, arg_28_1)
	if arg_28_0:CheckWeaponCanBreakUp() then
		arg_28_0:SwitchToView(arg_28_0.pageView.breakView, arg_28_1)
	else
		arg_28_0:SwitchToView(arg_28_0.pageView.lvupView, arg_28_1)
	end
end

function var_0_0.IsMeetShowBar(arg_29_0, arg_29_1)
	if not arg_29_1 or not arg_29_1.barCurrency then
		return false
	end

	if arg_29_1.pageIdx == 2 then
		local var_29_0 = arg_29_0:GetWeaponInfo()

		if var_29_0 then
			return var_29_0.level ~= HeroConst.WEAPON_LV_MAX
		else
			return false
		end
	end

	return true
end

function var_0_0.OnTop(arg_30_0)
	arg_30_0:ChangeWindowBar()
end

function var_0_0.ChangeWindowBar(arg_31_0, arg_31_1)
	if not arg_31_1 then
		for iter_31_0, iter_31_1 in pairs(arg_31_0.pageView) do
			if iter_31_1.view and iter_31_1.pageIdx == arg_31_0.data.curPageIdx then
				arg_31_1 = iter_31_1

				break
			end
		end
	end

	local var_31_0 = {
		BACK_BAR,
		HOME_BAR
	}

	if arg_31_0:IsMeetShowBar(arg_31_1) then
		for iter_31_2, iter_31_3 in pairs(arg_31_1.barCurrency) do
			table.insert(var_31_0, iter_31_3)
		end

		manager.windowBar:SwitchBar(var_31_0)

		for iter_31_4, iter_31_5 in pairs(arg_31_1.barCurrency) do
			manager.windowBar:SetBarCanAdd(iter_31_5, true)
		end
	else
		manager.windowBar:SwitchBar(var_31_0)
	end
end

function var_0_0.SwitchToView(arg_32_0, arg_32_1, arg_32_2)
	if arg_32_1 then
		local var_32_0 = arg_32_0.data.curPageIdx

		arg_32_0:ChangeWindowBar(arg_32_1)

		if var_32_0 ~= arg_32_1.pageIdx then
			arg_32_0.data.curPageIdx = arg_32_1.pageIdx

			arg_32_0:EnterViewOrInst(arg_32_1, true)
			arg_32_0:RefreshPageView(arg_32_1.view)
		elseif arg_32_2 then
			arg_32_0.data.curPageIdx = arg_32_1.pageIdx

			arg_32_0:EnterViewOrInst(arg_32_1, false)
			arg_32_0:RefreshPageView(arg_32_1.view)
		end
	end
end

function var_0_0.RefreshPageView(arg_33_0, arg_33_1)
	arg_33_1:ShowWeaponInfo(arg_33_0:GetHeroId(), arg_33_0:GetWeaponInfo(), arg_33_0.data.type)
end

function var_0_0.EnterViewOrInst(arg_34_0, arg_34_1, arg_34_2)
	if not arg_34_1.view then
		local var_34_0 = Asset.Load(arg_34_1.uiRootPath)

		arg_34_1.viewObj = Object.Instantiate(var_34_0, arg_34_0.pageContainer_)
		arg_34_1.view = import(arg_34_1.viewPath).New(arg_34_1.viewObj)

		arg_34_1.view:OnEnter()
	end

	if arg_34_2 then
		for iter_34_0, iter_34_1 in pairs(arg_34_0.pageView) do
			if iter_34_1.view then
				if iter_34_1.pageIdx ~= arg_34_0.data.curPageIdx then
					iter_34_1.viewObj:SetActive(false)
				else
					iter_34_1.viewObj:SetActive(true)
				end
			end
		end
	else
		arg_34_1.viewObj:SetActive(true)
	end
end

function var_0_0.UpdateWeaponInfo(arg_35_0)
	local var_35_0 = arg_35_0:GetHeroId()

	if var_35_0 and var_35_0 ~= 0 then
		local var_35_1 = deepClone(arg_35_0.data.dataPorxy:GetHeroWeaponInfo(var_35_0))

		arg_35_0.data.weaponInfo = var_35_1
	end
end

function var_0_0.GetWeaponInfo(arg_36_0)
	return arg_36_0.data.weaponInfo
end

function var_0_0.SetHeroId(arg_37_0, arg_37_1)
	arg_37_0.data.heroId = arg_37_1
end

function var_0_0.GetHeroId(arg_38_0)
	return arg_38_0.data.heroId
end

function var_0_0.GetControllerState(arg_39_0)
	return arg_39_0.context.controllerWrap.state
end

function var_0_0.CheckWeaponCanBreakUp(arg_40_0)
	local var_40_0 = arg_40_0:GetWeaponInfo()

	if var_40_0 then
		if GameSetting.weapon_exp_limit.value[var_40_0.breakthrough + 1] == var_40_0.level and var_40_0.level ~= HeroConst.WEAPON_LV_MAX then
			return true
		end
	else
		return false
	end

	return false
end

return var_0_0
