local var_0_0 = class("CultureGravureView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/System/Hero/HeroCultureGravureUI"
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

	arg_4_0.stateController_ = ControllerUtil.GetController(arg_4_0.gameObject_.transform, "state")
	arg_4_0.teachController_ = ControllerUtil.GetController(arg_4_0.gameObject_.transform, "teach")
	arg_4_0.tabController_ = {}

	for iter_4_0 = 1, 3 do
		arg_4_0.tabController_[iter_4_0] = ControllerUtil.GetController(arg_4_0["tab_" .. iter_4_0], "name")
	end

	arg_4_0.btnController_ = arg_4_0.recommendCon_:GetController("name")
	arg_4_0.equiptList_ = LuaList.New(handler(arg_4_0, arg_4_0.IndexEquiptItem), arg_4_0.equiptListGo_, CultureGravureEquiptItem)
	arg_4_0.servantList_ = LuaList.New(handler(arg_4_0, arg_4_0.IndexServantItem), arg_4_0.servanListGo_, CultureGravureServantItem)
	arg_4_0.astroList_ = LuaList.New(handler(arg_4_0, arg_4_0.IndexAstroItem), arg_4_0.astroListGo_, CultureGravureAstroItem)
	arg_4_0.clickAstrohandler = handler(arg_4_0, arg_4_0.PopInfoLeft)

	if GameToSDK.IsPCPlatform() then
		if _G.CHANNEL_MASTER_ID == 1 or _G.CHANNEL_MASTER_ID == 1 then
			SetActive(arg_4_0.forumBtn_.gameObject, true)
		else
			SetActive(arg_4_0.forumBtn_.gameObject, false)
		end
	end
end

function var_0_0.AddUIListener(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.recommendBtn_, nil, function()
		arg_5_0.recommendType_ = arg_5_0.recommendType_ == 1 and 2 or 1

		if arg_5_0.recommendType_ == 1 then
			arg_5_0.equiptDataList_ = CultureGravureData:GetCommonEquiptListByID(arg_5_0.heroID_)
			arg_5_0.recommendText_.text = GetTips("OMEGA_RECOMMEND")
		else
			arg_5_0.equiptDataList_ = CultureGravureData:GetOmegaEquiptListByID(arg_5_0.heroID_)
			arg_5_0.recommendText_.text = GetTips("EQUIP_RECOMMEND")
		end

		arg_5_0.btnController_:SetSelectedState(arg_5_0.recommendType_)
		arg_5_0.equiptList_:StartScroll(#arg_5_0.equiptDataList_)
	end)
	arg_5_0:AddBtnListener(arg_5_0.equiptBtn, nil, function()
		arg_5_0:ClickToggle(1)
	end)
	arg_5_0:AddBtnListener(arg_5_0.servantBtn, nil, function()
		arg_5_0:ClickToggle(2)
	end)
	arg_5_0:AddBtnListener(arg_5_0.astroBtn, nil, function()
		arg_5_0:ClickToggle(3)
	end)
	arg_5_0:AddBtnListener(arg_5_0.mask_, nil, function()
		SetActive(arg_5_0.popInfoParentGo_, false)
	end)
	arg_5_0:AddBtnListener(arg_5_0.teachingBtn_, nil, function()
		OperationRecorder.RecordButtonTouch("hero_teach_stage")
		HeroData:SetHeroStrategyRedPoint(arg_5_0.heroID_)

		local var_11_0 = HeroCfg[arg_5_0.heroID_]

		BattleTeachData:SetCacheTeachHeroID(arg_5_0.heroID_)

		if var_11_0 and var_11_0.study_stage and var_11_0.study_stage[1] then
			JumpTools.OpenPageByJump("/teachStage", {
				switchType = BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_HERO_TEACHING,
				heroID = arg_5_0.heroID_
			})
			JumpTools.OpenPageByJump("teachSectionInfo", {
				sectionType = BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_HERO_TEACHING,
				section = var_11_0.study_stage[1]
			})
		end
	end)
	arg_5_0:AddBtnListener(arg_5_0.forumBtn_, nil, function()
		if _G.ChannelLoginInfo and _G.ChannelLoginInfo.channelToken then
			local var_12_0 = {
				userId = PlayerData:GetPlayerInfo().userID,
				signUserId = PlayerData:GetPlayerInfo().signUserId,
				gameAppId = _G.ChannelLoginInfo.channelAppId,
				token = _G.ChannelLoginInfo.channelToken
			}
			local var_12_1 = HeroCfg[arg_5_0.heroID_]

			if var_12_1 ~= nil then
				local var_12_2 = string.format("%s·%s", GetI18NText(var_12_1.name), GetI18NText(var_12_1.suffix))
				local var_12_3 = SettingData:GetCurrentLanguage()

				if var_12_3 == "fr" or var_12_3 == "de" then
					var_12_2 = string.format("%s-%s", GetI18NText(var_12_1.name), GetI18NText(var_12_1.suffix))
				end

				var_12_0.heroName = var_12_2
			end

			OperationAction.OpenOperationUrl("FORUM_URL_HERO", var_12_0)
		end
	end)
end

function var_0_0.OnEnter(arg_13_0)
	SetActive(arg_13_0.forumBtn_.gameObject, false)

	arg_13_0.heroID_ = arg_13_0.params_.heroID

	if arg_13_0.params_.selectIndex then
		arg_13_0.selectedListIndex_ = arg_13_0.params_.selectIndex
		arg_13_0.params_.selectIndex = nil
	else
		arg_13_0.selectedListIndex_ = CultureGravureData:GetLastTabIndex()
	end

	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR,
		INFO_BAR
	})
	manager.windowBar:RegistInfoCallBack(function()
		local var_14_0 = GetTips("CULTUREGRAVURE_DESC")

		JumpTools.OpenPageByJump("gameHelp", {
			icon = "icon_i",
			key = "CULTUREGRAVURE_DESC",
			iconColor = Color(1, 1, 1),
			title = GetTips("FUNCTION_DESC"),
			content = var_14_0
		})
	end)

	arg_13_0.recommendType_ = arg_13_0.recommendType_ or 1

	arg_13_0:RefreshUI()
	manager.heroRaiseTrack:RefreshAstrolableState(AstrolabeConst.AnimationState.Commended)
end

function var_0_0.RefreshUI(arg_15_0)
	local var_15_0 = HeroCfg[arg_15_0.heroID_]

	arg_15_0.nameText_.text = var_15_0.name
	arg_15_0.suffixText_.text = var_15_0.suffix
	arg_15_0.roleImg_.sprite = getSpriteWithoutAtlas("TextureConfig/Character/Icon/" .. arg_15_0.heroID_)
	arg_15_0.raceImg_.sprite = getSprite("Atlas/SystemGroupAtlas", string.format("com_white_icon_group_%s_c", var_15_0.race))
	arg_15_0.rareImg_.sprite = getSprite("Atlas/SystemHeroGradeAtlas", "star_" .. var_15_0.rare)

	arg_15_0.teachController_:SetSelectedState(tostring(HeroData:GetHeroStrategyRedPoint(arg_15_0.heroID_)))
	arg_15_0:RefreshList(arg_15_0.selectedListIndex_)

	arg_15_0.typeImg_.sprite = HeroTools.GetHeroSkillAttributeIcon(arg_15_0.heroID_)

	arg_15_0:RefreshChargeType()
	arg_15_0:RefreshRangeType()
	SetActive(arg_15_0.astroBtn, not HeroTools.IsSpHero(arg_15_0.heroID_))
end

function var_0_0.ClickToggle(arg_16_0, arg_16_1)
	if arg_16_1 == arg_16_0.selectedListIndex_ then
		return
	end

	arg_16_0:RefreshList(arg_16_1)
end

function var_0_0.RefreshList(arg_17_0, arg_17_1)
	if arg_17_1 == 1 then
		PlayerAction.CheckRecommendEquip(arg_17_0.heroID_)
	end

	arg_17_0.stateController_:SetSelectedState(arg_17_1)

	for iter_17_0 = 1, 3 do
		arg_17_0.tabController_[iter_17_0]:SetSelectedState(tostring(iter_17_0 == arg_17_1))
	end

	if arg_17_1 == 3 then
		arg_17_0.astroDataList_ = deepClone(CultureGravureData:GetAstroListByID(arg_17_0.heroID_))

		arg_17_0.astroList_:StartScroll(#arg_17_0.astroDataList_)
	elseif arg_17_1 == 2 then
		arg_17_0.servantDataList_ = CultureGravureData:GetServantListByID(arg_17_0.heroID_)

		arg_17_0.servantList_:StartScroll(#arg_17_0.servantDataList_)
	else
		arg_17_0.btnController_:SetSelectedState(arg_17_0.recommendType_)

		arg_17_0.recommendText_.text = arg_17_0.recommendType_ == 1 and GetTips("OMEGA_RECOMMEND") or GetTips("EQUIP_RECOMMEND")

		if arg_17_0.recommendType_ == 2 then
			arg_17_0.equiptDataList_ = CultureGravureData:GetOmegaEquiptListByID(arg_17_0.heroID_)
		else
			arg_17_0.equiptDataList_ = CultureGravureData:GetCommonEquiptListByID(arg_17_0.heroID_)
		end

		arg_17_0.equiptList_:StartScroll(#arg_17_0.equiptDataList_)
		arg_17_0.stateController_:SetSelectedState(1)

		arg_17_1 = 1
	end

	arg_17_0.selectedListIndex_ = arg_17_1

	SetActive(arg_17_0.descTextGo_, arg_17_0.selectedListIndex_ ~= 2)
end

function var_0_0.IndexEquiptItem(arg_18_0, arg_18_1, arg_18_2)
	arg_18_2:SetData(arg_18_1, arg_18_0.equiptDataList_[arg_18_1], arg_18_0.heroID_)
end

function var_0_0.IndexServantItem(arg_19_0, arg_19_1, arg_19_2)
	arg_19_2:SetData(arg_19_1, arg_19_0.servantDataList_[arg_19_1], arg_19_0.heroID_)

	if arg_19_1 == 1 then
		arg_19_2:SetRecommendController(2)
	end
end

function var_0_0.IndexAstroItem(arg_20_0, arg_20_1, arg_20_2)
	arg_20_2:SetClickCallBack(arg_20_0.clickAstrohandler)
	arg_20_2:SetData(arg_20_1, arg_20_0.astroDataList_[arg_20_1], arg_20_0.heroID_)
end

function var_0_0.OnEquipSwap(arg_21_0, arg_21_1, arg_21_2)
	arg_21_0.equiptList_:StartScroll(#arg_21_0.equiptDataList_)
end

function var_0_0.OnEquipQuickDressOn(arg_22_0, arg_22_1, arg_22_2)
	for iter_22_0 = 1, 6 do
		if arg_22_2.use_equip_list[iter_22_0] then
			HeroAction.HeroChangeEquip(arg_22_2.hero_id, arg_22_2.use_equip_list[iter_22_0].equip_id, arg_22_2.use_equip_list[iter_22_0].pos)
		end
	end

	arg_22_0.equiptList_:StartScroll(#arg_22_0.equiptDataList_)
	ShowTips("SUCCESS_EQUIP_PROPOSAL")
end

function var_0_0.OnServantReplace(arg_23_0)
	ShowTips("SUCCESS_EQUIP_SERVANT")
	arg_23_0.servantList_:StartScroll(#arg_23_0.servantDataList_)
end

function var_0_0.RefreshRangeType(arg_24_0)
	arg_24_0.rangeTypeText_.text = CharactorParamCfg[arg_24_0.heroID_].RangeType == 0 and GetTips("RANGETYPE_CLOSE") or GetTips("RANGETYPE_LONG")
end

function var_0_0.RefreshChargeType(arg_25_0)
	local var_25_0 = HeroCfg[arg_25_0.heroID_].mechanism_type[1]

	if var_25_0 == HeroConst.HERO_CHARGE_TYPE.RAGE then
		arg_25_0.chargeType_.text = GetTips("NOTE_ENERGYTYPE_1")
	elseif var_25_0 == HeroConst.HERO_CHARGE_TYPE.ENERGY then
		arg_25_0.chargeType_.text = GetTips("NOTE_ENERGYTYPE_2")
	elseif var_25_0 == HeroConst.HERO_CHARGE_TYPE.TRACES then
		arg_25_0.chargeType_.text = GetTips("NOTE_ENERGYTYPE_3")
	elseif var_25_0 == HeroConst.HERO_CHARGE_TYPE.DIVINE_GRACE then
		arg_25_0.chargeType_.text = GetTips("NOTE_ENERGYTYPE_4")
	end
end

function var_0_0.OnAstrolabeEquip(arg_26_0)
	ShowTips("ASTROLABE_BIND")
	arg_26_0.astroList_:StartScroll(#arg_26_0.astroDataList_)
end

function var_0_0.OnExit(arg_27_0)
	manager.windowBar:HideBar()
	SetActive(arg_27_0.popInfoParentGo_, false)
	CultureGravureData:SetLastTabIndex(arg_27_0.selectedListIndex_)
	manager.redPoint:unbindUIandKey(arg_27_0.teachingBtn_.transform)
end

function var_0_0.Dispose(arg_28_0)
	if arg_28_0.astroList_ then
		arg_28_0.astroList_:Dispose()
	end

	if arg_28_0.servantList_ then
		arg_28_0.servantList_:Dispose()
	end

	if arg_28_0.equiptList_ then
		arg_28_0.equiptList_:Dispose()
	end

	var_0_0.super.Dispose(arg_28_0)
end

function var_0_0.PopInfoLeft(arg_29_0, arg_29_1, arg_29_2, arg_29_3, arg_29_4)
	SetActive(arg_29_0.popInfoParentGo_, true)

	arg_29_0.popNameText_.text = GetI18NText(arg_29_1)
	arg_29_0.popDescText_.text = GetI18NText(arg_29_2)

	local var_29_0 = 700
	local var_29_1 = arg_29_0.textViewTrs_.gameObject:GetComponent(typeof(ContentSizeFitter))

	var_29_1.enabled = true

	LayoutRebuilder.ForceRebuildLayoutImmediate(arg_29_0.popDescText_.transform)
	LayoutRebuilder.ForceRebuildLayoutImmediate(arg_29_0.textContentTrs_)
	LayoutRebuilder.ForceRebuildLayoutImmediate(arg_29_0.textViewTrs_)

	local var_29_2 = arg_29_0.popDescText_.transform.sizeDelta.y
	local var_29_3 = arg_29_0.textParentTrs_.gameObject:GetComponent(typeof(ScrollRect))

	if var_29_0 < var_29_2 then
		var_29_1.enabled = false
		var_29_3.enabled = true
		arg_29_0.textViewTrs_.transform.sizeDelta = Vector2(arg_29_0.textContentTrs_.sizeDelta.x, var_29_0)
	else
		var_29_1.enabled = true
		var_29_3.enabled = false
	end

	LayoutRebuilder.ForceRebuildLayoutImmediate(arg_29_0.textParentTrs_)
	LayoutRebuilder.ForceRebuildLayoutImmediate(arg_29_0.popContentTrs_)

	local var_29_4 = arg_29_0.middleTrs_:InverseTransformPoint(arg_29_3)
	local var_29_5 = Vector3(var_29_4.x, var_29_4.y, 0)
	local var_29_6 = arg_29_0.middleTrs_:TransformPoint(var_29_5)
	local var_29_7 = arg_29_0.popInfoParentTrs_:InverseTransformPoint(var_29_6)

	arg_29_0.popInfoTrs_.localPosition = var_29_7

	local var_29_8 = arg_29_0.popBottomTrs_:TransformPoint(Vector3(0, 0, 0))
	local var_29_9 = arg_29_0.popInfoParentTrs_:InverseTransformPoint(var_29_8)
	local var_29_10 = arg_29_0.safePlaceTrs_.rect.height / 2
	local var_29_11 = arg_29_0.textParentTrs_.rect.width / 4
	local var_29_12 = arg_29_0.popInfoParentTrs_:InverseTransformPoint(arg_29_0.astroRightTrs_.position).x
	local var_29_13 = 0

	if var_29_10 < -var_29_9.y then
		var_29_13 = -var_29_9.y - var_29_10
	end

	arg_29_0.popInfoTrs_.localPosition = Vector3(var_29_12 + var_29_11, var_29_7.y + var_29_13, var_29_7.z)
end

return var_0_0
