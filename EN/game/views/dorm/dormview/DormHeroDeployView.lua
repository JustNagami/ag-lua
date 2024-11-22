local var_0_0 = class("DormHeroDeployView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/BackHouseUI/Dorm/DormPersonnelAllocationUI"
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

	arg_5_0.characterScroll = LuaList.New(handler(arg_5_0, arg_5_0.indexItem), arg_5_0.uilistGo_, DormCharacterItem)
	arg_5_0.stateController = ControllerUtil.GetController(arg_5_0.transform_, "state")
	arg_5_0.allCharacterController = ControllerUtil.GetController(arg_5_0.quickRecall.transform, "useState")
end

local function var_0_1()
	return Dorm.storage:GetData(DormCharacterManager.curGrabbingInfoNamespace, "eid")
end

local function var_0_2(arg_7_0)
	return DormUtils.GetEntityData(arg_7_0).cfgID
end

function var_0_0.IndexOf(arg_8_0, arg_8_1)
	return table.indexof(arg_8_0.dataList_, arg_8_0.heroID)
end

function var_0_0.OnEnter(arg_9_0)
	arg_9_0.roomID = DormData:GetCurrectSceneID()

	if BackHomeCfg[arg_9_0.roomID].type == DormConst.BACKHOME_TYPE.PublicDorm then
		arg_9_0.maxNum = GameSetting.dorm_lobby_hero_max.value[1]

		arg_9_0.stateController:SetSelectedState("public")
	else
		arg_9_0.maxNum = DormConst.PRIVATE_CHARACTER_MAX_NUM

		arg_9_0.stateController:SetSelectedState("private")
	end

	arg_9_0.maxnumText_.text = "/" .. arg_9_0.maxNum

	arg_9_0:RefreshDormHeroList()
	arg_9_0:RegisterEvents()
	arg_9_0:RefreshPlaceHeroNum()

	arg_9_0.postStartHandle = FrameTimer.New(function()
		arg_9_0.curGrabbing = var_0_1()

		if arg_9_0.curGrabbing then
			arg_9_0.selHeroID = var_0_2(arg_9_0.curGrabbing)

			local var_10_0 = arg_9_0:IndexOf(arg_9_0.curGrabbing)

			if var_10_0 then
				arg_9_0.characterScroll:ScrollToIndex(var_10_0, false, true, 0.2)
			end
		else
			arg_9_0.selHeroID = nil
		end

		arg_9_0.characterScroll:Refresh()

		arg_9_0.postStartHandle = nil
	end, 1, false)

	arg_9_0.postStartHandle:Start()
end

function var_0_0.OnExit(arg_11_0)
	arg_11_0:RemoveAllEventListener()

	if arg_11_0.postStartHandle then
		arg_11_0.postStartHandle:Stop()

		arg_11_0.postStartHandle = nil
	end
end

function var_0_0.indexItem(arg_12_0, arg_12_1, arg_12_2)
	arg_12_2:ShowMaskCallBack(function(arg_13_0)
		local var_13_0 = DormData:GetHeroTemplateInfo(arg_13_0)

		if var_13_0 then
			local var_13_1 = var_13_0:GetHeroState()

			if var_13_1 == DormEnum.DormHeroState.InCanteenEntrust or var_13_1 == DormEnum.DormHeroState.InCanteenJob then
				return true
			end

			if (var_13_1 == DormEnum.DormHeroState.InPublicDorm or var_13_1 == DormEnum.DormHeroState.InPrivateDorm) and var_13_0.hero_id ~= arg_13_0 then
				return true
			end

			return false
		end
	end)
	arg_12_2:RefreshUI(arg_12_0.dataList_[arg_12_1], arg_12_0.selHeroID, arg_12_1)
	arg_12_2:SetOnPointerDown(function(arg_14_0)
		arg_12_0.selHeroID = arg_12_0.curGrabbing and var_0_2(arg_12_0.curGrabbing) or arg_14_0

		arg_12_0.characterScroll:Refresh()
	end)
	arg_12_2:RecallHero(function(arg_15_0)
		local var_15_0 = DormData:GetCurrectSceneID()

		if var_15_0 == DormConst.PUBLIC_DORM_ID then
			local var_15_1 = DormitoryData:GetDormHerosByArchitecture(var_15_0)
			local var_15_2 = {}
			local var_15_3 = DormData:GetHeroTemplateInfo(arg_15_0):GetHeroId()

			for iter_15_0, iter_15_1 in ipairs(var_15_1) do
				if iter_15_1 ~= var_15_3 then
					table.insert(var_15_2, iter_15_1)
				end
			end

			DormAction:DeployHeroInRoom(var_15_0, var_15_2, DormEnum.DormDeployType.ReCall)
		elseif var_15_0 then
			DormAction:RecallHeroInPrivateDorm(var_15_0, arg_15_0)
		end
	end)
end

local function var_0_3()
	local var_16_0 = nullable(GameDisplayCfg.dorm_hero_first_set_dialogue, "value")

	if var_16_0 then
		local var_16_1 = 0

		for iter_16_0, iter_16_1 in ipairs(var_16_0) do
			var_16_1 = var_16_1 + iter_16_1[2]
		end

		local var_16_2 = math.random() * var_16_1

		for iter_16_2, iter_16_3 in ipairs(var_16_0) do
			local var_16_3 = iter_16_3[1]

			var_16_2 = var_16_2 - iter_16_3[2]

			if var_16_2 < 0 then
				return var_16_3
			end
		end
	end

	return 0
end

function var_0_0.RegisterEvents(arg_17_0)
	arg_17_0:RegistEventListener(DORM_REFRESH_HERO_DEPLOY_LIST, function()
		arg_17_0.characterScroll:Refresh()
		arg_17_0:RefreshPlaceHeroNum()
	end)
	arg_17_0:RegistEventListener(BACKHOME_HERO_FATIGUR_REFRESH, function()
		arg_17_0.characterScroll:Refresh()
	end)
end

function var_0_0.AddUIListener(arg_20_0)
	arg_20_0:AddBtnListenerScale(arg_20_0.backBtn_, nil, function()
		JumpTools.Back()
	end)
	arg_20_0:AddBtnListenerScale(arg_20_0.quickRecall, nil, function()
		local var_22_0 = DormData:GetCurrectSceneID()
		local var_22_1 = DormitoryData:GetDormHerosByArchitecture(var_22_0)

		if #var_22_1 > 0 then
			DormHeroTools:RecallAllHero(var_22_1)
		else
			ShowTips("DORM_NO_HERO_RECALL")
		end
	end)
end

function var_0_0.OnStartGrabHero(arg_23_0, arg_23_1)
	arg_23_0.curGrabbing = arg_23_1
	arg_23_0.selHeroID = var_0_2(arg_23_1), DormTools:PlayDormAudioEffect(DormConst.DORM_AUDIO_EFFECT.UpCharacter)

	arg_23_0.characterScroll:Refresh()
end

function var_0_0.OnReleaseGrabHero(arg_24_0)
	if arg_24_0.curGrabbing then
		local var_24_0 = arg_24_0.curGrabbing

		arg_24_0.curGrabbing = nil

		DormTools:PlayDormAudioEffect(DormConst.DORM_AUDIO_EFFECT.DownCharacter)

		local var_24_1 = var_0_3()

		if var_24_1 ~= 0 then
			manager.notify:Invoke(DORM_CHARACTER_PLAY_SUBTITLE, var_24_0, var_24_1)
		end

		arg_24_0.characterScroll:Refresh()
	end
end

function var_0_0.NotDragOutYet(arg_25_0, arg_25_1)
	local var_25_0 = arg_25_1.position
	local var_25_1 = manager.ui.canvas:GetComponent(typeof(Canvas)).worldCamera

	return UnityEngine.RectTransformUtility.RectangleContainsScreenPoint(arg_25_0.dragOutRect_, var_25_0, var_25_1)
end

function var_0_0.OnBeginDragHeroItem(arg_26_0, arg_26_1)
	if not arg_26_0.curGrabbing then
		arg_26_0.uilistSrex_:OnBeginDrag(arg_26_1)

		arg_26_0.alreadyDragOut = false
	end
end

function var_0_0.OnDragHeroItem(arg_27_0, arg_27_1)
	if not arg_27_0.curGrabbing and not arg_27_0.alreadyDragOut then
		if arg_27_0:NotDragOutYet(arg_27_1) then
			arg_27_0.uilistSrex_:OnDrag(arg_27_1)
		else
			arg_27_0.uilistSrex_:OnEndDrag(arg_27_1)
			arg_27_0:TryDragHeroOut(arg_27_1)

			arg_27_0.alreadyDragOut = true
		end
	end
end

function var_0_0.TryDragHeroOut(arg_28_0, arg_28_1)
	if arg_28_0.curGrabbing then
		return
	end

	if arg_28_0.selHeroID then
		local var_28_0 = DormData:GetHeroArchiveID(arg_28_0.selHeroID)
		local var_28_1 = DormData:GetHeroInfo(var_28_0):GetHeroState()

		if var_28_1 == DormEnum.DormHeroState.InCanteenEntrust or DormEnum.DormHeroState.InCanteenJob == var_28_1 then
			ShowTips(GetTips("DORM_HERO_WORK_IN_CANTEEN"))

			return
		end

		if arg_28_0:CheckCharacterNumMax() then
			local var_28_2 = DormData:GetCurrectSceneID()

			if BackHomeCfg[var_28_2].type == DormConst.BACKHOME_TYPE.PublicDorm then
				local var_28_3 = DormitoryData:GetDormHerosByArchitecture(var_28_2)
				local var_28_4 = DormitoryData:GetDormArchivesByArchitecture(var_28_2)

				for iter_28_0, iter_28_1 in ipairs(var_28_4) do
					if iter_28_1 == var_28_0 then
						ShowTips(GetTips("DORM_HERO_SAME_SET"))

						return
					end
				end

				local var_28_5 = {}

				for iter_28_2, iter_28_3 in ipairs(var_28_3) do
					table.insert(var_28_5, iter_28_3)
				end

				table.insert(var_28_5, arg_28_0.selHeroID)
				arg_28_0:OnStartGrabHero(DormHeroTools:GenerateHeroByDrag(arg_28_0.selHeroID, arg_28_1))
				DormAction:DeployHeroInRoom(var_28_2, var_28_5, DormEnum.DormDeployType.Place)
			elseif BackHomeCfg[var_28_2].type == DormConst.BACKHOME_TYPE.PrivateDorm then
				if var_28_1 == DormEnum.DormHeroState.InPublicDorm or var_28_1 == DormEnum.DormHeroState.OutDorm then
					arg_28_0:OnStartGrabHero(DormHeroTools:GenerateHeroByDrag(arg_28_0.selHeroID, arg_28_1))
					DormAction:RecallHeroInPrivateDorm(var_28_2, arg_28_0.selHeroID)
				elseif var_28_1 == DormEnum.DormHeroState.InPrivateDorm then
					ShowTips(GetTips("DORM_HERO_SAME_SET"))
				end
			end
		else
			ShowTips(GetTips("DORM_LOBBY_SET_MAX"))
		end
	end
end

function var_0_0.OnEndDragHeroItem(arg_29_0, arg_29_1)
	if arg_29_0.curGrabbing then
		DormLuaBridge.EndGrabPlayerEntity(arg_29_0.curGrabbing)
		arg_29_0:OnReleaseGrabHero()
	else
		arg_29_0.uilistSrex_:OnEndDrag(arg_29_1)
	end
end

function var_0_0.GetDormHeroList(arg_30_0)
	local var_30_0 = {}

	arg_30_0 = arg_30_0 or DormData:GetCurrectSceneID()

	local var_30_1 = DormHeroTools:GetBackHomeCanUseHeroList(arg_30_0)

	CommonTools.UniversalSortEx(var_30_1, {
		ascend = true,
		map = function(arg_31_0)
			local var_31_0 = DormData:GetHeroTemplateInfo(arg_31_0):GetHeroState()

			if var_31_0 == DormEnum.DormHeroState.InPublicDorm then
				return 1
			elseif var_31_0 == DormEnum.DormHeroState.OutDorm then
				return 2
			elseif var_31_0 == DormEnum.DormHeroState.InPrivateDorm then
				return 3
			elseif var_31_0 == DormEnum.DormHeroState.InCanteenJob then
				local var_31_1 = DormData:GetHeroTemplateInfo(arg_31_0).jobType

				if var_31_1 == DormNpcTools.BackHomeNpcType.cook then
					return 4
				elseif var_31_1 == DormNpcTools.BackHomeNpcType.waiter then
					return 5
				elseif var_31_1 == DormNpcTools.BackHomeNpcType.cashier then
					return 6
				end
			elseif var_31_0 == DormEnum.DormHeroState.InCanteenEntrust then
				return 7
			elseif var_31_0 == DormEnum.DormHeroState.InIdolTraineeCamp then
				return 8
			end
		end
	}, {
		ascend = true,
		map = function(arg_32_0)
			return (DormData:GetHeroTemplateInfo(arg_32_0):GetFatigue())
		end
	}, {
		map = function(arg_33_0)
			return (DormData:GetHeroArchiveID(arg_33_0))
		end
	}, {
		map = function(arg_34_0)
			return arg_34_0
		end
	})

	return var_30_1
end

function var_0_0.RefreshDormHeroList(arg_35_0)
	arg_35_0.dataList_ = var_0_0.GetDormHeroList()

	arg_35_0.characterScroll:StartScroll(#arg_35_0.dataList_)
end

function var_0_0.CheckCharacterNumMax(arg_36_0)
	if BackHomeCfg[arg_36_0.roomID].type == DormConst.BACKHOME_TYPE.PublicDorm then
		local var_36_0 = DormitoryData:GetDormSceneData(arg_36_0.roomID).archiveIDList

		if var_36_0 then
			local var_36_1 = #var_36_0
			local var_36_2 = DormCharacterManager.GetInstance():GetCharacterNum() or 0

			if var_36_1 >= arg_36_0.maxNum or var_36_2 >= arg_36_0.maxNum then
				return false
			else
				return true
			end
		end
	else
		return true
	end
end

function var_0_0.RefreshPlaceHeroNum(arg_37_0)
	if BackHomeCfg[arg_37_0.roomID].type == DormConst.BACKHOME_TYPE.PublicDorm then
		local var_37_0 = DormitoryData:GetDormSceneData(arg_37_0.roomID).archiveIDList

		if var_37_0 then
			local var_37_1 = #var_37_0

			arg_37_0.curnumText_.text = var_37_1
		else
			arg_37_0.curnumText_.text = 0
		end

		local var_37_2 = false

		for iter_37_0, iter_37_1 in ipairs(var_37_0) do
			if DormData:GetHeroFatigue(iter_37_1) >= GameSetting.canteen_hero_fatigue_max.value[1] then
				var_37_2 = true

				break
			end
		end

		if var_37_2 then
			arg_37_0.allCharacterController:SetSelectedState("true")
		else
			arg_37_0.allCharacterController:SetSelectedState("false")
		end
	else
		local var_37_3 = DormitoryData:GetDormSceneData(arg_37_0.roomID).archiveIDList[1]

		if DormData:GetHeroInfo(var_37_3):GetHeroState() == DormEnum.DormHeroState.InPrivateDorm then
			arg_37_0.curnumText_.text = 1
		else
			arg_37_0.curnumText_.text = 0
		end
	end
end

function var_0_0.Dispose(arg_38_0)
	if arg_38_0.characterScroll then
		arg_38_0.characterScroll:Dispose()
	end

	arg_38_0.uilistSrex_.ExitScrollArea:RemoveAllListeners()
	var_0_0.super.Dispose(arg_38_0)
end

return var_0_0
