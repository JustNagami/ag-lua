local var_0_0 = class("ChangePosterView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/System/Hero/HeroChangeUI"
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

	arg_4_0.heroHeadList_ = LuaList.New(handler(arg_4_0, arg_4_0.HeadRenderer), arg_4_0.uiListGo_, HeroLongHead)
	arg_4_0.filterView_ = NewHeroListFilterView.New(arg_4_0.filterGo_)

	arg_4_0.filterView_:SetListChangeHandler(handler(arg_4_0, arg_4_0.OnListChange))

	arg_4_0.emptyController_ = ControllerUtil.GetController(arg_4_0.uiListGo_.transform, "empty")
	arg_4_0.heroViewProxy_ = HeroViewDataProxy.New(HeroConst.HERO_DATA_TYPE.DEFAULT)
end

function var_0_0.OnListChange(arg_5_0, arg_5_1)
	arg_5_0.heroIdList_ = arg_5_1

	arg_5_0.heroHeadList_:StartScroll(#arg_5_0.heroIdList_)

	if #arg_5_0.heroIdList_ > 0 then
		arg_5_0.emptyController_:SetSelectedState("false")
		arg_5_0:SelectHero(arg_5_0.heroIdList_[1])
	else
		arg_5_0.emptyController_:SetSelectedState("true")
	end
end

function var_0_0.AddUIListener(arg_6_0)
	arg_6_0:AddBtnListener(arg_6_0.showBtn_, nil, function()
		PlayerAction.ChangePosterGirl(arg_6_0.curHeroId_)
	end)
	arg_6_0:AddBtnListener(arg_6_0.skinBtn_, nil, function()
		arg_6_0:Go("/heroSkin", {
			heroID = arg_6_0.curHeroId_
		})
	end)
end

function var_0_0.OnChangePosterGirl(arg_9_0, arg_9_1, arg_9_2)
	if arg_9_0.params_.lastView == "home" then
		JumpTools.OpenPageByJump("/home", {
			changePoster = true
		})
	else
		arg_9_0:Back()
	end
end

function var_0_0.HeadRenderer(arg_10_0, arg_10_1, arg_10_2)
	local var_10_0 = arg_10_0.heroIdList_[arg_10_1]

	arg_10_2.gameObject_.name = tostring(var_10_0)

	arg_10_2:SetProxy(arg_10_0.heroViewProxy_)
	arg_10_2:SetHeroId(var_10_0, arg_10_0.type_)
	arg_10_2:SetRedPointEnable(arg_10_0.heroViewProxy_.showHeroHeadRedPoint)
	arg_10_2:SetSelected(arg_10_2.heroId_ == arg_10_0.curHeroId_)
	arg_10_2:RegisterClickListener(function()
		arg_10_0:SelectHero(arg_10_2.heroId_)
		OperationRecorder.Record("hero", "selectHero")
	end)
end

function var_0_0.SelectHero(arg_12_0, arg_12_1)
	arg_12_0.curHeroId_ = arg_12_1
	arg_12_0.curHeroInfo_ = HeroData:GetHeroList()[arg_12_0.curHeroId_]
	arg_12_0.heroCfg_ = HeroCfg[arg_12_1]

	for iter_12_0, iter_12_1 in pairs(arg_12_0.heroHeadList_:GetItemList()) do
		iter_12_1:SetSelected(iter_12_1.heroId_ == arg_12_1)
	end

	arg_12_0:UpdateHeroView()
	arg_12_0:UpdateAvatarView()
end

function var_0_0.UpdateHeroView(arg_13_0)
	arg_13_0.nameText_.text = GetI18NText(arg_13_0.heroCfg_.name)
	arg_13_0.subNameText_.text = GetI18NText(arg_13_0.heroCfg_.suffix)
	arg_13_0.fightPowerText_.text = getBattlePower(HeroData:GetHeroData(arg_13_0.curHeroId_))
end

function var_0_0.UpdateBar(arg_14_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR
	})
end

function var_0_0.UpdateAvatarView(arg_15_0)
	local var_15_0 = arg_15_0.heroViewProxy_:GetHeroUsingSkinInfo(arg_15_0.curHeroId_).id

	manager.heroRaiseTrack:SetModelState(var_15_0)
end

function var_0_0.CameraEnter(arg_16_0)
	manager.heroRaiseTrack:SetViewState(HeroRaiseTrackConst.ViewType.heroRaiseCommon, {
		1,
		0,
		0
	}, arg_16_0.displayGo_)
end

function var_0_0.OnEnter(arg_17_0)
	local var_17_0 = HeroTools.Sort(HeroData:GetHeroList())

	arg_17_0.filterView_:OnEnter(arg_17_0.heroViewProxy_)
	arg_17_0.filterView_:SetHeroIdList(var_17_0)
	arg_17_0:UpdateBar()

	local var_17_1 = PlayerData:GetPlayerInfo().poster_girl
	local var_17_2 = 1

	if arg_17_0.params_.index then
		var_17_2 = arg_17_0.params_.index
		var_17_1 = arg_17_0.heroIdList_[var_17_2]
	else
		for iter_17_0, iter_17_1 in ipairs(arg_17_0.heroIdList_) do
			if iter_17_1 == var_17_1 then
				var_17_2 = iter_17_0

				break
			end
		end
	end

	arg_17_0:SelectHero(var_17_1)
	arg_17_0.heroHeadList_:StartScroll(#arg_17_0.heroIdList_, var_17_2)
end

function var_0_0.OnMainHomeViewTop(arg_18_0)
	if arg_18_0.filterView_ then
		arg_18_0.filterView_:Reset()
	end

	arg_18_0.pos_ = nil
end

function var_0_0.OnHeroSort(arg_19_0, arg_19_1, arg_19_2, arg_19_3, arg_19_4, arg_19_5)
	arg_19_0.filterView_:RefreshSort(arg_19_1, arg_19_2, arg_19_3, arg_19_4, arg_19_5)
end

function var_0_0.OnExit(arg_20_0)
	if arg_20_0.filterView_ and arg_20_0.filterView_.OnExit then
		arg_20_0.filterView_:OnExit()
	end

	manager.windowBar:HideBar()

	if #arg_20_0.heroIdList_ <= 0 then
		HeroData:ResetSortValue()
		arg_20_0.filterView_:Reset()
	end

	arg_20_0.params_.index = table.keyof(arg_20_0.heroIdList_, arg_20_0.curHeroId_)
	arg_20_0.pos_ = arg_20_0.heroHeadList_:GetScrolledPosition()
end

function OnCameraEnter()
	return
end

function var_0_0.Dispose(arg_22_0)
	if arg_22_0.heroHeadList_ then
		arg_22_0.heroHeadList_:Dispose()

		arg_22_0.heroHeadList_ = nil
	end

	if arg_22_0.filterView_ then
		arg_22_0.filterView_:Dispose()

		arg_22_0.filterView_ = nil
	end

	var_0_0.super.Dispose(arg_22_0)
end

return var_0_0
