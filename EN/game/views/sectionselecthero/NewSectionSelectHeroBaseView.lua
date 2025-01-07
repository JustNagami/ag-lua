local var_0_0 = class("NewSectionSelectHeroBaseView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/System/Formation/FormationMainUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:InitUI()
	arg_3_0:AddListener()
end

function var_0_0.InitUI(arg_4_0)
	arg_4_0:BindCfgUI()
	arg_4_0:InitSubViewCfg()
	arg_4_0:InitCallback()
end

function var_0_0.InitSubViewCfg(arg_5_0)
	arg_5_0.subViewDic_ = {
		selectHeroView = {
			go = arg_5_0.selectHeroGo_,
			getClassFunc = handler(arg_5_0, arg_5_0.GetSelectHeroViewClass)
		},
		additionalView = {
			go = arg_5_0.additionalGo_,
			getClassFunc = handler(arg_5_0, arg_5_0.GetAdditionalViewClass)
		}
	}
end

function var_0_0.InitCallback(arg_6_0)
	arg_6_0.clickHeroHandler_ = handler(arg_6_0, arg_6_0.OnSectionClickHero)
	arg_6_0.clickStartBattleHandler_ = handler(arg_6_0, arg_6_0.OnSectionClickStartBattle)
end

function var_0_0.AddListener(arg_7_0)
	return
end

function var_0_0.OnTop(arg_8_0)
	arg_8_0:UpdateBar()
end

function var_0_0.OnBehind(arg_9_0)
	manager.windowBar:HideBar()
end

function var_0_0.OnEnter(arg_10_0)
	arg_10_0:AddEventListener()
	arg_10_0:ProcessParams()
	arg_10_0:ProcessSubView()
	arg_10_0:UpdateCamera()
	arg_10_0:SubViewOnEnter()
	arg_10_0:Refresh()
end

function var_0_0.OnEnterOver(arg_11_0)
	arg_11_0:RegistEventListener(ON_ASYNC_SCENE_LOADED, function(arg_12_0)
		if arg_12_0 == "X104" and arg_11_0.gameObject_.activeInHierarchy then
			arg_11_0:OnAsyncSceneLoaded()
		end
	end)
end

function var_0_0.OnAsyncSceneLoaded(arg_13_0)
	arg_13_0.subViewDic_.selectHeroView.instance:RebindController()
	arg_13_0.subViewDic_.selectHeroView.instance:RefreshHeroInfoItem()
end

function var_0_0.AddEventListener(arg_14_0)
	arg_14_0:RegistEventListener(SECTION_CLICK_HERO, arg_14_0.clickHeroHandler_)
	arg_14_0:RegistEventListener(SECTION_CLICK_START_BATTLE, arg_14_0.clickStartBattleHandler_)
end

function var_0_0.ProcessParams(arg_15_0)
	arg_15_0:ProcessBaseParams()
	arg_15_0:ProcessReserveParams()
	arg_15_0:ProcessProxyParams()
	arg_15_0:ProcessCustomParams()
end

function var_0_0.ProcessBaseParams(arg_16_0)
	arg_16_0.multiple_ = arg_16_0.params_.multiple or 1
	arg_16_0.stageID_ = arg_16_0.params_.section
	arg_16_0.stageType_ = arg_16_0.params_.sectionType or BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_UNDEFINED
	arg_16_0.activityID_ = arg_16_0.params_.activityID
end

function var_0_0.ProcessReserveParams(arg_17_0)
	if not arg_17_0.params_.reserveParams then
		arg_17_0.params_.reserveParams = ReserveTools.GetReserveParams(arg_17_0.stageType_, arg_17_0.stageID_, arg_17_0.activityID_)
	elseif not arg_17_0.params_.reserveParams.customData.activityID then
		arg_17_0.params_.reserveParams.customData.activityID = arg_17_0.activityID_
	end

	arg_17_0.reserveParams_ = arg_17_0.params_.reserveParams
end

function var_0_0.ProcessProxyParams(arg_18_0)
	if not arg_18_0.params_.sectionProxy then
		local var_18_0 = arg_18_0.params_.heroDataType or HeroConst.HERO_DATA_TYPE.DEFAULT

		arg_18_0.params_.sectionProxy = SectionSelectHeroTools.GetProxy(arg_18_0.params_, arg_18_0.reserveParams_, var_18_0)
	end

	arg_18_0.sectionProxy_ = arg_18_0.params_.sectionProxy
end

function var_0_0.ProcessCustomParams(arg_19_0)
	return
end

function var_0_0.ProcessSubView(arg_20_0)
	arg_20_0:InitSubView()
	arg_20_0:TryReloadSubView()
	arg_20_0:ProcessSubViewParams()
end

function var_0_0.ProcessSubViewParams(arg_21_0)
	arg_21_0:SubViewCallFunc("SetProxy", arg_21_0.sectionProxy_)
end

function var_0_0.UpdateBar(arg_22_0)
	arg_22_0.sectionProxy_:UpdateBar()
end

function var_0_0.UpdateCamera(arg_23_0)
	manager.ui:SetMainCamera("battleHeroSelect")
	manager.ui:AdaptUIByFOV()
end

function var_0_0.SubViewOnEnter(arg_24_0)
	arg_24_0:SubViewCallFunc("OnEnter")
end

function var_0_0.OnExit(arg_25_0)
	arg_25_0:RemoveAllEventListener()
	arg_25_0:SubViewOnExit()

	arg_25_0.params_.isSorted = false

	manager.ui:ResetMainCamera()
end

function var_0_0.SubViewOnExit(arg_26_0)
	arg_26_0:SubViewCallFunc("OnExit")
end

function var_0_0.Dispose(arg_27_0)
	arg_27_0:SubViewCallFunc("Dispose")

	for iter_27_0, iter_27_1 in pairs(arg_27_0.subViewDic_) do
		iter_27_1.go = nil
		iter_27_1.instance = nil
	end

	var_0_0.super.Dispose(arg_27_0)
end

function var_0_0.Refresh(arg_28_0)
	arg_28_0:RefreshSubView()
	arg_28_0:RefreshSortType()
	arg_28_0:DisplayFilterLockHero()
	arg_28_0:RefreshCustomUI()
end

function var_0_0.RefreshSubView(arg_29_0)
	arg_29_0:SubViewCallFunc("Refresh")
end

function var_0_0.RefreshSortType(arg_30_0)
	if not arg_30_0.params_.isSorted then
		HeroData:ResetSortValue()
	end
end

function var_0_0.DisplayFilterLockHero(arg_31_0)
	if not arg_31_0.params_.isBack then
		if not arg_31_0.sectionProxy_.needDisplayFilterLocalHero or #arg_31_0.reserveParams_.filterLockHeroList == 0 or manager.time:IsToday(SectionSelectHeroTools.GetSkipDisplayFilterLockHeroTime()) then
			return
		end

		JumpTools.OpenPageByJump("filterLockHero", {
			heroIDList = arg_31_0.reserveParams_.filterLockHeroList,
			type = SectionSelectHeroConst.DISPLAY_FILTER_LOCK_HERO_TYPE.NORMAL
		})
	end
end

function var_0_0.RefreshCustomUI(arg_32_0)
	return
end

function var_0_0.OnSectionClickHero(arg_33_0, arg_33_1)
	arg_33_0.sectionProxy_:GotoHeroInfoUI(arg_33_1)
end

function var_0_0.OnSectionClickStartBattle(arg_34_0)
	local var_34_0, var_34_1 = arg_34_0.subViewDic_.selectHeroView.instance:CheckCanStartBattle()

	if var_34_0 then
		arg_34_0:StartBattle()
	elseif var_34_1 then
		ShowTips(var_34_1)
	end
end

function var_0_0.StartBattle(arg_35_0)
	arg_35_0.sectionProxy_:StartBattle()
end

function var_0_0.GetAdditionalViewClass(arg_36_0)
	return arg_36_0.sectionProxy_:GetAdditionalViewClass()
end

function var_0_0.GetSelectHeroViewClass(arg_37_0)
	return arg_37_0.sectionProxy_:GetSelectHeroViewClass()
end

function var_0_0.InitSubView(arg_38_0)
	if not arg_38_0.createdSubview_ then
		arg_38_0.createdSubview_ = true

		for iter_38_0, iter_38_1 in pairs(arg_38_0.subViewDic_) do
			local var_38_0 = iter_38_1.go

			iter_38_1.instance = iter_38_1.getClassFunc().New(var_38_0)

			if iter_38_1.initFunc then
				iter_38_1.initFunc()
			end
		end
	end
end

function var_0_0.TryReloadSubView(arg_39_0)
	for iter_39_0, iter_39_1 in pairs(arg_39_0.subViewDic_) do
		if SectionSelectHeroTools.IsDiffViewClass(iter_39_1.instance, iter_39_1.getClassFunc()) then
			iter_39_1.instance = SectionSelectHeroTools.ReloadView(iter_39_1.instance, iter_39_1.getClassFunc())

			if iter_39_1.initFunc then
				iter_39_1.initFunc()
			end
		end
	end
end

function var_0_0.SubViewCallFunc(arg_40_0, arg_40_1, ...)
	for iter_40_0, iter_40_1 in pairs(arg_40_0.subViewDic_) do
		local var_40_0 = iter_40_1.instance

		if var_40_0 and var_40_0[arg_40_1] then
			var_40_0[arg_40_1](var_40_0, ...)
		end
	end
end

return var_0_0
