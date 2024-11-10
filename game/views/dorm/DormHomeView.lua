local var_0_0 = class("DormHomeView", ReduxView)
local var_0_1

function var_0_0.UIName(arg_1_0)
	return "Widget/BackHouseUI/Dorm/DormitoryUI"
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

	arg_4_0.likeBtnStateController = arg_4_0.controller:GetController("praise")
	arg_4_0.praiseAnimator = arg_4_0.praiseGo_:GetComponent("Animator")
end

function var_0_0.OnEnter(arg_5_0)
	arg_5_0:RegisterEvents()
	arg_5_0:UpdataViewType()
	arg_5_0:RefreshRoomNameInfo()
	arg_5_0:RefreshDevInfo()
	arg_5_0.quickView:OnEnter()
	arg_5_0.tempquickGo_.transform:SetAsLastSibling()
	arg_5_0.quickView:ShowView(false)
	arg_5_0:UpdataDormitoryInternalRedPoint()
	arg_5_0:RefreshRedPonit()
	arg_5_0:AutoOpenSuitHelpPage()
	DormLuaBridge.SetIsCanEditTag(false)
	arg_5_0:RefreshLikeNum()
	arg_5_0:RefreshLikeBtnState()
end

function var_0_0.OnTop(arg_6_0)
	arg_6_0:HideUiInfo(true)
end

function var_0_0.UpdataViewType(arg_7_0)
	arg_7_0.sceneID_ = DormData:GetCurrectSceneID()

	if arg_7_0.sceneID_ > DormConst.DORM_VISIT_ROOM_MIN then
		arg_7_0.stateController:SetSelectedState("visit")

		local var_7_0 = DormVisitTools:GetCurVisitPlayerType()

		if var_7_0 == 1 then
			arg_7_0.friendController:SetSelectedState("true")
		elseif var_7_0 == 2 then
			arg_7_0.friendController:SetSelectedState("false")
		end

		SetActive(arg_7_0.collectBtn_.gameObject, not JumpTools.IsSystemLocked(ViewConst.SYSTEM_ID.DORM))
	else
		arg_7_0.stateController:SetSelectedState("room")

		if arg_7_0.sceneID_ == DormVisitTools:GetCurTemplateExhibit() then
			arg_7_0.exhibitController:SetSelectedState("true")
		else
			arg_7_0.exhibitController:SetSelectedState("false")
		end
	end
end

function var_0_0.RefreshRoomNameInfo(arg_8_0)
	if BackHomeCfg[arg_8_0.sceneID_].type == DormConst.BACKHOME_TYPE.PublicDorm or BackHomeCfg[arg_8_0.sceneID_].type == DormConst.BACKHOME_TYPE.VISITPUBLICDORM then
		arg_8_0.roomName.text = GetTips("DORM_LOBBY_NAME")

		arg_8_0.publicTextController:SetSelectedState("false")
	elseif BackHomeCfg[arg_8_0.sceneID_].type == DormConst.BACKHOME_TYPE.PrivateDorm or BackHomeCfg[arg_8_0.sceneID_].type == DormConst.BACKHOME_TYPE.VISITPRIVATEDORM then
		local var_8_0 = DormitoryData:GetDormSceneData(arg_8_0.sceneID_).archiveIDList[1]

		if BackHomeCfg[arg_8_0.sceneID_].type == DormConst.BACKHOME_TYPE.PrivateDorm then
			arg_8_0.publicTextController:SetSelectedState("true")
		else
			arg_8_0.publicTextController:SetSelectedState("false")
		end

		if var_8_0 then
			local var_8_1 = HeroRecordCfg.get_id_list_by_hero_id[var_8_0][1]

			if var_8_1 then
				local var_8_2 = HeroRecordCfg[var_8_1].name

				if var_8_2 then
					arg_8_0.roomName.text = string.format(GetTips("DORM_HERO_ROOM_NAME"), GetI18NText(var_8_2))
				end

				arg_8_0:RefreshRoomLevel()
			end
		end
	end
end

function var_0_0.RefreshRedPonit(arg_9_0)
	manager.redPoint:bindUIandKey(arg_9_0.positionBtn_.transform, RedPointConst.DORM_PLACEMENT)
	manager.redPoint:bindUIandKey(arg_9_0.fureidbtnBtn_.transform, RedPointConst.DORM_FURNITURE)
	manager.redPoint:bindUIandKey(arg_9_0.btn_storeBtn_.transform, RedPointConst.DORM_SUIT_SHOP)

	for iter_9_0 = DormConst.DORM_FUR_TYPE_START, DormConst.DORM_FUR_TYPE_END do
		DormRedPointTools:UpdataDormFurRedPoint(arg_9_0.sceneID_, iter_9_0)
	end

	if DormTools:ShouldShowBirthdayBtn(arg_9_0.sceneID_) then
		SetActive(arg_9_0.birthdayBtn_.gameObject, true)
	else
		SetActive(arg_9_0.birthdayBtn_.gameObject, false)
	end
end

function var_0_0.RefreshBar(arg_10_0)
	if arg_10_0.sceneID_ < DormConst.DORM_VISIT_ROOM_MIN then
		manager.windowBar:SwitchBar({
			BACK_BAR,
			HOME_BAR,
			INFO_BAR
		})

		local var_10_0 = GameSetting.dorm_info_describe.value

		if #var_10_0 > 0 then
			manager.windowBar:SetGameHelpKey({
				view = "/gameHelpPro",
				type = "jump",
				params = {
					hideHomeBtn = 1,
					isPrefab = true,
					pages = var_10_0
				}
			})
		end
	else
		manager.windowBar:SwitchBar({
			BACK_BAR
		})
	end

	manager.windowBar:RegistBackCallBack(function()
		if DormVisitTools:GetIsOtherSystem() then
			local var_11_0 = DormVisitTools:GetBackFunc()

			if var_11_0 then
				var_11_0()
			else
				BackHomeTools:OtherSystemVisitExit()
				OpenPageUntilLoaded("/home")
			end

			return
		end

		if arg_10_0.sceneID_ < DormConst.DORM_VISIT_ROOM_MIN then
			JumpTools.OpenPageByJump("/dormChooseRoomView")
		else
			DormVisitTools:ClearVisitRoomData()

			if BackHomeDataManager:GetCurSystem() == DormEnum.DormSystemType.Main then
				BackHomeTools:BackHomeGotoMain()
				OpenPageUntilLoaded("/dormVisitView")
			else
				DormitoryData:VisitFlag(true)
				BackHomeTools:GotoBackHomeRoom(DormConst.PUBLIC_DORM_ID)
			end
		end
	end)
	manager.windowBar:RegistHomeCallBack(function()
		BackHomeTools:BackHomeGotoMain()
	end)
end

function var_0_0.OnExit(arg_13_0)
	manager.windowBar:HideBar()
	manager.redPoint:unbindUIandKey(arg_13_0.positionBtn_.transform, RedPointConst.DORM_PLACEMENT)
	manager.redPoint:unbindUIandKey(arg_13_0.fureidbtnBtn_.transform, RedPointConst.DORM_FURNITURE)
	manager.redPoint:unbindUIandKey(arg_13_0.btn_storeBtn_.transform, RedPointConst.DORM_SUIT_SHOP)
	arg_13_0.menuController:SetSelectedState("off")

	arg_13_0.menuState = false

	arg_13_0:RemoveAllEventListener()
	arg_13_0.quickView:OnExit()
end

function var_0_0.InitUI(arg_14_0)
	arg_14_0:BindCfgUI()

	arg_14_0.cacheRoles = {}
	arg_14_0.menuState = false
	arg_14_0.menuController = ControllerUtil.GetController(arg_14_0.btn_menuGo_.transform, "menu")
	arg_14_0.stateController = ControllerUtil.GetController(arg_14_0.transform_, "state")
	arg_14_0.exhibitController = ControllerUtil.GetController(arg_14_0.exhib.transform, "state")
	arg_14_0.publicTextController = ControllerUtil.GetController(arg_14_0.transform_, "public")
	arg_14_0.showUiController = ControllerUtil.GetController(arg_14_0.btn_hideGo_.transform, "btn")
	arg_14_0.friendController = ControllerUtil.GetController(arg_14_0.transform_, "addFriend")
	arg_14_0.menuAnimator = arg_14_0:FindCom(typeof(Animator), "", arg_14_0.menu_listTrs_)
	arg_14_0.quickView = BackHomeQuickJumpView.New(arg_14_0.tempquickGo_)
end

function var_0_0.AddUIListener(arg_15_0)
	arg_15_0:AddBtnListenerScale(arg_15_0.positionBtn_, nil, function()
		JumpTools.OpenPageByJump("/dormChooseRoomView")
	end)
	arg_15_0:AddBtnListenerScale(arg_15_0.characterplacebtnBtn_, nil, function()
		JumpTools.OpenPageByJump("/dormHeroDeployView")
	end)
	arg_15_0:AddBtnListenerScale(arg_15_0.templateBtn_, nil, function()
		JumpTools.OpenPageByJump("/dormTemplateView", {
			pos = 1
		})
	end)
	arg_15_0:AddBtnListenerScale(arg_15_0.fureidbtnBtn_, nil, function()
		DormHeroTools.HideAllCharacter()
		JumpTools.OpenPageByJump("/roomEdit")
		DormFurEditStateData:EnterEditState()
	end)
	arg_15_0:AddBtnListenerScale(arg_15_0.dormlevelBtn_, nil, function()
		if BackHomeCfg[arg_15_0.sceneID_].type ~= DormConst.BACKHOME_TYPE.PrivateDorm then
			return
		end

		local var_20_0 = DormitoryData:GetArchiveIDViaRoomID(arg_15_0.sceneID_)[1]

		if var_20_0 then
			JumpTools.OpenPageByJump("/dormLevelInfoView", {
				archiveID = var_20_0
			})
		end
	end)
	arg_15_0:AddBtnListenerScale(arg_15_0.btn_storeBtn_, nil, function()
		local var_21_0 = DormTools:GetAllDormShopIDList()

		JumpTools.GoToSystem("/dormShop", {
			hideHomeBtn = true,
			shop = ShopConst.SHOP_ID.DORM_SHOP,
			shopList = var_21_0
		}, ViewConst.SYSTEM_ID.DORM_SHOP)
	end)
	arg_15_0:AddBtnListenerScale(arg_15_0.btn_menuBtn_, nil, function()
		if arg_15_0.menuState then
			arg_15_0.menuController:SetSelectedState("off")

			arg_15_0.menuState = false
		else
			arg_15_0.menuController:SetSelectedState("on")

			arg_15_0.menuState = true

			arg_15_0.menuAnimator:Play("DormitoryUI_menu_list")
		end
	end)
	arg_15_0:AddBtnListenerScale(arg_15_0.exhibBtn_, nil, function()
		local var_23_0 = DormVisitTools:GetCurTemplateExhibit()

		if not var_23_0 or arg_15_0.sceneID_ ~= var_23_0 then
			DormAction:SetFurTemplateExhibit(arg_15_0.sceneID_)
		else
			ShowTips(GetTips("DORM_DISPLAY_ALREADY"))
		end
	end)
	arg_15_0:AddBtnListenerScale(arg_15_0.collectBtn_, nil, function()
		local var_24_0, var_24_1 = DormVisitTools:CheckCanSaveTemplate()

		if var_24_0 then
			JumpTools.OpenPageByJump("/dormVisitTemplateView")
		else
			ShowTips(var_24_1)
		end
	end)
	arg_15_0:AddBtnListenerScale(arg_15_0.addFriendBtn_, nil, function()
		local var_25_0 = DormVisitTools:GetVisitUserID()

		if var_25_0 then
			FriendsAction:TryToRequestToFriend(var_25_0, FriendConst.ADD_FRIEND_SOURCE.DORM)
		end
	end)
	arg_15_0:AddBtnListenerScale(arg_15_0.btn_hideBtn_, nil, function()
		if arg_15_0.uiShow then
			arg_15_0:HideUiInfo(false)
		else
			arg_15_0:HideUiInfo(true)
		end
	end)
	arg_15_0:AddBtnListenerScale(arg_15_0.giftBtn_, nil, function()
		local var_27_0 = DormData:GetCurrectSceneID()

		if BackHomeCfg[var_27_0].type == DormConst.BACKHOME_TYPE.PrivateDorm then
			local var_27_1 = DormitoryData:GetArchiveIDViaRoomID(var_27_0)[1]
			local var_27_2 = DormData:GetHeroInfo(var_27_1)

			if var_27_2 then
				if var_27_2:GetHeroState() == DormEnum.DormHeroState.InPrivateDorm then
					local var_27_3 = DormUtils.EIdNamespace(DormEnum.CharacterType.DormNormalHero)
					local var_27_4

					for iter_27_0, iter_27_1 in Dorm.storage:ForeachData(var_27_3, pairs) do
						var_27_4 = iter_27_1
					end

					if var_27_4 then
						DormLuaBridge.ActAsClickToEntity(var_27_4)
					else
						print("未找到人物eid")
					end
				else
					JumpTools.OpenPageByJump("/dormHeroGiftView", {
						archiveID = var_27_1
					})
				end
			end
		end
	end)
	arg_15_0.quickView:AddClickCallBack(function()
		manager.windowBar:HideBar()
	end)
	arg_15_0.quickView:CloseCallBack(function()
		arg_15_0:RefreshBar()
	end)
	arg_15_0:AddBtnListenerScale(arg_15_0.reportBtn_, nil, function()
		local var_30_0 = DormVisitTools:GetVisitUserID()

		if var_30_0 then
			local var_30_1 = DormVisitTools:GetExhibitListByUserID(var_30_0)
			local var_30_2 = DormVisitTools:GetLayoutID()

			if var_30_1 then
				local var_30_3 = var_30_1.nick or ""

				JumpTools.OpenPageByJump("/chatReport", {
					reportType = ChatConst.CHAT_REPORT_TYPE.DORM,
					reportData = {
						nick = var_30_3,
						userID = var_30_0,
						layout_uid = var_30_2,
						architecture_id = var_30_1.architecture_id or var_30_1.backhome_architecture_id
					}
				}, ViewConst.SYSTEM_ID.CHAT_REPORT)
			end
		end
	end)
	arg_15_0:AddBtnListenerScale(arg_15_0.devbtnBtn_, nil, function()
		local var_31_0 = DormData:GetDevModelFlag()

		DormData:ChangeDevModelFlag(not var_31_0)
		arg_15_0:RefreshDevInfo()
	end)
	arg_15_0:AddBtnListenerScale(arg_15_0.likeBtn, nil, function()
		if arg_15_0.stateController:GetSelectedState() == "visit" then
			local var_32_0 = DormVisitTools:GetVisitUserID()
			local var_32_1 = DormVisitTools:GetCurVisitRoomData()

			if var_32_1.todayLikeNum < GameSetting.dorm_room_like_limted.value[1] and var_32_1 then
				DormAction.LikeDormRoom(var_32_0, var_32_1.architecture_id, function()
					return
				end)
			else
				ShowTips("DORM_SINGLE_ROOM_PRAISE_NUM")
			end
		end
	end)
end

function var_0_0.RegisterEvents(arg_34_0)
	arg_34_0:RegistEventListener(ON_PLAYER_CLICK_INTERACT, function(arg_35_0, arg_35_1)
		arg_34_0.showUiController:SetSelectedState("off")
		SetActive(arg_34_0.btn_hideBtn_.gameObject, false)
		manager.windowBar:HideBar()

		if arg_34_0.sceneID_ > DormConst.DORM_VISIT_ROOM_MIN then
			return
		end

		Dorm.DormEntityManager.EnablePlayerInput = false

		DormUtils.ClearCharaHasSpecialVfx(arg_35_0)
		DormUtils.HideCharaSpecialVfx(arg_35_0)
		Timer.New(function()
			arg_34_0.showUiController:SetSelectedState("on")
			SetActive(arg_34_0.btn_hideBtn_.gameObject, true)
			JumpTools.OpenPageByJump("/heroInteractView", {
				heroEID = arg_35_0
			})
		end, DormConst.CHARACTER_INTERACT_CAMERA_MOVE_TIME, 1):Start()
		DormTools:PlayDormAudioEffect(DormConst.DORM_AUDIO_EFFECT.InteractCam)

		local var_35_0 = DormUtils.EIdNamespace(DormEnum.CharacterType.DormNormalHero)

		for iter_35_0, iter_35_1 in Dorm.storage:ForeachData(var_35_0, pairs) do
			if iter_35_1 ~= arg_35_0 then
				Dorm.DormEntityManager.FadeOutNearPoint(iter_35_1, UnityEngine.Camera.main.transform, DormLuaBridge.GetCamFadeOtherCharaParam(nil, nil))
			end
		end
	end)
	arg_34_0:RegistEventListener(DORM_REFRESH_EXIBIT, function()
		if arg_34_0.sceneID_ == DormVisitTools:GetCurTemplateExhibit() then
			ShowTips(GetTips("DORM_DISPLAY_SET_SUCCESS"))
			arg_34_0.exhibitController:SetSelectedState("true")
		else
			arg_34_0.exhibitController:SetSelectedState("false")
		end
	end)
	arg_34_0:RegistEventListener(DORM_PRIVATE_LEVEL_UP, function()
		ShowTips(GetTips("DORM_LEVEL_UP_TIPS"))
		arg_34_0:RefreshRoomLevel()
	end)
	arg_34_0:RegistEventListener(ON_DORM_CHARACTER_GRAB_STARTED, function()
		DormTools:PlayDormAudioEffect(DormConst.DORM_AUDIO_EFFECT.UpCharacter)
	end)
	arg_34_0:RegistEventListener(ON_DORM_CHARACTER_GRAB_RELEASED, function()
		DormTools:PlayDormAudioEffect(DormConst.DORM_AUDIO_EFFECT.DownCharacter)
	end)
	arg_34_0:RegistEventListener(ON_BEGIN_STORY, function(arg_41_0)
		SetActive(arg_34_0.birthdayBtn_.gameObject, false)
		manager.windowBar:HideBar()
		DormCharacterManager.GetInstance():OnBeginStory(arg_41_0)
		DormFurnitureManager.GetInstance():OnBeginStory(arg_41_0)
	end)
	arg_34_0:RegistEventListener(ON_FINISH_STORY, function(arg_42_0)
		GameObject.Destroy(var_0_1)

		var_0_1 = nil

		SetActive(arg_34_0.gameObject_, true)
		arg_34_0:RefreshBar()
		DormFurnitureManager.GetInstance():OnFinishStory(arg_42_0)
		DormCharacterManager.GetInstance():OnFinishStory(arg_42_0)
	end)
	arg_34_0:RegistEventListener(DORM_LIKE_NUM_REFRESH, function()
		arg_34_0:RefreshLikeNum()
		arg_34_0:RefreshLikeBtnState()
	end)
end

function var_0_0.RefreshRoomLevel(arg_44_0)
	local var_44_0 = DormitoryData:GetDormLevel(arg_44_0.sceneID_)

	if var_44_0 then
		arg_44_0.roomLevel.text = string.format(GetTips("DORM_CANTEEN_LEVEL"), var_44_0)
	end
end

function var_0_0.UpdateView(arg_45_0)
	local var_45_0 = DormData:GetCurrectSceneID()

	arg_45_0.attractiveLabel_.text = DormData:GetSceneAttractiveValue(var_45_0)
end

function var_0_0.HideUiInfo(arg_46_0, arg_46_1)
	arg_46_0.uiShow = arg_46_1

	if arg_46_0.uiShow then
		arg_46_0.showUiController:SetSelectedState("on")
		arg_46_0:RefreshBar()
	else
		arg_46_0.showUiController:SetSelectedState("off")
		manager.windowBar:HideBar()
	end
end

function var_0_0.RefreshDevInfo(arg_47_0)
	local var_47_0 = DormData:GetDevModelFlag()

	if var_47_0 then
		SetActive(arg_47_0.devbtnBtn_.transform.gameObject, var_47_0)
	end

	SetActive(arg_47_0.devText, var_47_0)
end

function var_0_0.AutoOpenSuitHelpPage(arg_48_0)
	if not DormSuitData:GetSuitHelpFlag() then
		FrameTimer.New(function()
			if not manager.guide:IsPlaying() and arg_48_0.sceneID_ < DormConst.DORM_VISIT_ROOM_MIN then
				local var_49_0 = GameSetting.dorm_info_describe.value

				JumpTools.OpenPageByJump("gameHelpPro", {
					hideHomeBtn = 1,
					isPrefab = true,
					pages = var_49_0,
					startIndex = GameSetting.dorm_how_to_play_forced_eject.value[1]
				})
				DormSuitData:SetSuitHelpFlag(true)
			end
		end, 0.1, 1):Start()
	end
end

function var_0_0.UpdataDormitoryInternalRedPoint(arg_50_0)
	local var_50_0 = {}
	local var_50_1 = DormData:GetCurrectSceneID()
	local var_50_2 = BackHomeCfg[var_50_1].type

	if var_50_2 == DormConst.BACKHOME_TYPE.PublicDorm then
		var_50_0 = {
			RedPointConst.DORM_FULL_PUBLIC_SUIT,
			RedPointConst.DORM_PART_SUIT
		}
	elseif var_50_2 == DormConst.BACKHOME_TYPE.PrivateDorm then
		var_50_0 = {
			RedPointConst.DORM_FULL_PRIVATE_SUIT,
			RedPointConst.DORM_PART_SUIT
		}
	end

	manager.redPoint:addGroup(RedPointConst.DORM_SUIT, var_50_0, true)
	DormRedPointTools:UpdataSuitRedPoint()
end

function var_0_0.RefreshLikeNum(arg_51_0)
	if arg_51_0.stateController:GetSelectedState() == "room" then
		local var_51_0 = DormData:GetCurrectSceneID()
		local var_51_1 = DormitoryData:GetDormSceneData(var_51_0)

		if var_51_1 then
			arg_51_0.likeNum.text = NumberTools.RetractNumberForWindBar(var_51_1.likeNum)
		end

		if DormitoryData:GetLastLikeNum() < var_51_1.likeNum then
			arg_51_0.praiseAnimator:Play("btn_praise", 0, 0)
		end

		DormitoryData:SetLastLikeNum(var_51_1.likeNum)
	end
end

function var_0_0.RefreshLikeBtnState(arg_52_0)
	if arg_52_0.stateController:GetSelectedState() == "visit" then
		local var_52_0 = DormVisitTools:GetCurVisitRoomData()

		if var_52_0.todayLikeNum and var_52_0.todayLikeNum > 0 then
			arg_52_0.likeBtnStateController:SetSelectedState("true")
		else
			arg_52_0.likeBtnStateController:SetSelectedState("false")
		end

		arg_52_0.curLikeNum.text = NumberTools.RetractNumberForWindBar(var_52_0.likeNum)
	end
end

function var_0_0.Dispose(arg_53_0)
	arg_53_0.quickView:Dispose()
	var_0_0.super.Dispose(arg_53_0)
end

return var_0_0
