local var_0_0 = class("DormHeroChangeSkinView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/BackHouseUI/Dorm/ChangeClothesUI"
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

	arg_4_0.skinScroll = LuaList.New(handler(arg_4_0, arg_4_0.indexSkinList), arg_4_0.skinListUilist_, DormHeroSkinItem)
end

function var_0_0.InitUI(arg_5_0)
	arg_5_0:BindCfgUI()

	arg_5_0.subtitleBubbleView = SubtitleBubbleView.MuteBubbleSubView.GetInstance()
end

function var_0_0.OnEnter(arg_6_0)
	arg_6_0.heroID = arg_6_0.params_.heroID
	arg_6_0.heroEID = arg_6_0.params_.heroEID
	arg_6_0.archiveID = DormData:GetHeroArchiveID(arg_6_0.heroID)
	arg_6_0.heroInfo = DormData:GetHeroTemplateInfo(arg_6_0.heroID)
	arg_6_0.skinID = arg_6_0.heroInfo:GetHeroCurSkinID(arg_6_0.heroID)

	arg_6_0:RegisterEvent()
	arg_6_0:RefreshDeriveHero()
	arg_6_0.subtitleBubbleView:OnEnter()
	arg_6_0:RefreshView()
end

function var_0_0.RefreshView(arg_7_0)
	arg_7_0:RefreshSkinView()
	arg_7_0:UpdataHeroItemState()
end

function var_0_0.RegisterEvent(arg_8_0)
	arg_8_0:RegistEventListener(DORM_HERO_SKIN_CHANGE, function(arg_9_0)
		arg_8_0.skinID = arg_9_0

		arg_8_0.skinScroll:Refresh()
		arg_8_0:ChangeHeroPrefab(arg_9_0)
	end)
	arg_8_0:RegistEventListener(DORM_REFRESH_HERO_DEPLOY_LIST, function()
		ShowTips("DORM_CHANGE_DERIVE_SUCCESS")
		arg_8_0:RefreshView()

		arg_8_0.skinID = arg_8_0.heroInfo:GetHeroCurSkinID(arg_8_0.heroID)

		arg_8_0:ChangeHeroPrefab(arg_8_0.skinID)
	end)
end

function var_0_0.RefreshSkinView(arg_11_0)
	arg_11_0.skinList = {}
	arg_11_0.skinList = DormHeroTools.GetCanUseDormHeroSkinList(arg_11_0.heroID)

	arg_11_0.skinScroll:StartScroll(#arg_11_0.skinList)
end

function var_0_0.RefreshDeriveHero(arg_12_0)
	if not arg_12_0.heroItemList then
		local var_12_0 = DormHeroTools:GetAllCanUseHeroIDInDorm(arg_12_0.archiveID, true)

		arg_12_0.heroItemList = {}

		for iter_12_0, iter_12_1 in ipairs(var_12_0) do
			local var_12_1 = arg_12_0.heroInfo:GetHeroCurSkinID(iter_12_1)
			local var_12_2 = Object.Instantiate(arg_12_0.herohead1Go_, arg_12_0.heroitembgTrs_)

			arg_12_0.heroItemList[iter_12_0] = DormCircleHeroItem.New(var_12_2)

			arg_12_0.heroItemList[iter_12_0]:RefreshUI(iter_12_1, arg_12_0.heroID)
			arg_12_0.heroItemList[iter_12_0]:SetClickCallBack(handler(arg_12_0, arg_12_0.ClickHeroItem))
		end
	end
end

function var_0_0.ClickHeroItem(arg_13_0, arg_13_1)
	if not HeroTools.GetHeroIsUnlock(arg_13_1) then
		ShowTips("DORM_HERO_LOCK")

		return
	end

	if arg_13_0.heroID == arg_13_1 then
		return
	end

	arg_13_0.heroID = arg_13_1

	local var_13_0 = DormData:GetCurrectSceneID()
	local var_13_1 = DormitoryData:GetDormHerosByArchitecture(var_13_0)
	local var_13_2 = {}
	local var_13_3 = DormData:GetHeroArchiveID(arg_13_1)

	for iter_13_0, iter_13_1 in ipairs(var_13_1) do
		if DormData:GetHeroArchiveID(iter_13_1) ~= var_13_3 then
			table.insert(var_13_2, iter_13_1)
		end
	end

	table.insert(var_13_2, arg_13_1)
	DormAction:DeployHeroInRoom(var_13_0, var_13_2, DormEnum.DormDeployType.Place)
end

function var_0_0.UpdataHeroItemState(arg_14_0)
	if arg_14_0.heroItemList then
		for iter_14_0, iter_14_1 in ipairs(arg_14_0.heroItemList) do
			iter_14_1:RefreshUI(iter_14_1.heroID, arg_14_0.heroID)
		end
	end
end

function var_0_0.AddUIListener(arg_15_0)
	arg_15_0:AddBtnListener(arg_15_0.closeBtn, nil, function()
		JumpTools.Back(1, {
			heroEID = arg_15_0.heroEID
		})
		Dorm.DormEntityManager.StopAllCmd(arg_15_0.heroEID)
	end)
end

function var_0_0.indexSkinList(arg_17_0, arg_17_1, arg_17_2)
	arg_17_2:RegisterClickCallBack(function(arg_18_0)
		if arg_17_0.skinID == arg_18_0 then
			return
		end

		DormAction:SetHeroSkin(arg_18_0, DormConst.DORM_CHANGESKIN_TYPE.view)
	end)
	arg_17_2:RefreshUI(arg_17_0.skinList[arg_17_1], arg_17_0.heroID, arg_17_0.skinID)
end

function var_0_0.ChangeHeroPrefab(arg_19_0, arg_19_1)
	local var_19_0 = arg_19_0.heroEID
	local var_19_1

	if DormUtils.GetEntityData(var_19_0).cfgID ~= arg_19_1 then
		local var_19_2
		local var_19_3

		var_19_1, var_19_3 = DormCharacterManager.GetInstance():Generate(arg_19_1, true)

		Dorm.DormEntityManager.PutEntityAt(var_19_1, var_19_0, "root")
		DormCharacterManager.FindAndRemove(var_19_0)

		arg_19_0.heroEID = var_19_1
	else
		var_19_1 = var_19_0
	end

	DormHeroAI:SwitchControl(var_19_1, DormEnum.ControlType.Player)
	Dorm.DormEntityManager.SetPlayerEntityFaceToCam(var_19_1, true)
	Dorm.DormEntityManager.SendInteractToEntityCMD(var_19_1, var_19_1, false)

	local var_19_4 = DormCharacterInteractBehaviour.MakeCtxForInternalAction(var_19_1, var_19_1, "change_skin_self", {
		onComplete = function(arg_20_0)
			return
		end
	})

	DormUtils.SetEntityInteractContext(var_19_1, var_19_4)

	local var_19_5 = DormUtils.GetEntityData(var_19_1)

	if not nullable(var_19_5, "interactCtx", "dt") then
		local var_19_6 = 0
	end

	if not nullable(var_19_5, "interactCtx", "duration") then
		local var_19_7 = 0
	end

	Timer.New(function()
		return
	end, 1, false, false):Start()
end

function var_0_0.OnExit(arg_22_0)
	arg_22_0:RemoveAllEventListener()
	arg_22_0.subtitleBubbleView:OnExit()

	if arg_22_0.heroItemList then
		for iter_22_0, iter_22_1 in pairs(arg_22_0.heroItemList) do
			iter_22_1:Dispose()
		end

		arg_22_0.heroItemList = nil
	end
end

function var_0_0.Dispose(arg_23_0)
	if arg_23_0.skinScroll then
		arg_23_0.skinScroll:Dispose()

		arg_23_0.skinScroll = nil
	end

	if arg_23_0.heroItemList then
		for iter_23_0, iter_23_1 in ipairs(arg_23_0.heroItemList) do
			iter_23_1:Dispose()
		end
	end

	var_0_0.super.Dispose(arg_23_0)
end

return var_0_0
