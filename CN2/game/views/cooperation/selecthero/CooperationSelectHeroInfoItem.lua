local var_0_0 = import("game.views.sectionSelectHero.SectionSelectHeroInfoItem")
local var_0_1 = class("CooperationSelectHeroInfoItem", var_0_0)

function var_0_1.Init(arg_1_0)
	arg_1_0:BindCfgUI()
	arg_1_0:InitController()
	arg_1_0:AddUIListener()
end

function var_0_1.InitController(arg_2_0)
	var_0_1.super.InitController(arg_2_0)

	arg_2_0.masterController_ = arg_2_0.controllerExCollection_:GetController("master")
	arg_2_0.playerStateController_ = arg_2_0.playerControllerEx_:GetController("state")
	arg_2_0.infoController_ = arg_2_0.controllerExCollection_:GetController("info")
	arg_2_0.friendController_ = arg_2_0.friendControllerEx_:GetController("state")
	arg_2_0.ownController_ = arg_2_0.controllerExCollection_:GetController("own")
end

function var_0_1.AddUIListener(arg_3_0)
	arg_3_0.dragEventListener_:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.PointerUp, LuaHelper.EventTriggerAction1(function(arg_4_0, arg_4_1)
		if arg_3_0:IsEmpty() then
			JumpTools.GoToSystem("cooperationInvitation")
		elseif PlayerData:GetPlayerInfo().userID == arg_3_0.roomPlayerID_ then
			if arg_3_0.clickCallback_ then
				arg_3_0.clickCallback_(arg_3_0.pos_, arg_4_0, arg_4_1)
			end
		elseif arg_3_0.infoController_:GetSelectedState() == "common" then
			if CooperationData:GetIsMaster() then
				arg_3_0.infoController_:SetSelectedIndex(2)
			else
				arg_3_0.infoController_:SetSelectedIndex(1)
			end
		else
			arg_3_0.infoController_:SetSelectedIndex(0)
		end
	end))
	arg_3_0:AddBtnListener(nil, arg_3_0.playerInfoBtn_, function()
		ForeignInfoAction:TryToCheckForeignDetailInfo(arg_3_0.roomPlayerID_)
	end)
	arg_3_0:AddBtnListener(nil, arg_3_0.heroInfoBtn_, function()
		CooperationTools.ShowHeroView(arg_3_0.roomPlayerID_)
	end)
	arg_3_0:AddBtnListener(nil, arg_3_0.addFriendBtn_, function()
		FriendsAction:TryToRequestToFriend(arg_3_0.roomPlayerID_, FriendConst.ADD_FRIEND_SOURCE.COOPERATION_ROOM)
	end)
	arg_3_0:AddBtnListener(nil, arg_3_0.changeMasterBtn_, function()
		local var_8_0 = string.format(GetTips("COOPERATION_CONFIRM_CHANGE_MASTER"), arg_3_0.roomPlayer_.nick)

		ShowMessageBox({
			isTop = true,
			content = var_8_0,
			OkCallback = function()
				CooperationAction.ChangeRoomMaster(arg_3_0.roomPlayerID_)
			end
		})
	end)
	arg_3_0:AddBtnListener(nil, arg_3_0.kickOutBtn_, function()
		local var_10_0 = string.format(GetTips("COOPERATION_CONFIRM_KICK"), arg_3_0.roomPlayer_.nick)

		ShowMessageBox({
			isTop = true,
			content = var_10_0,
			OkCallback = function()
				CooperationAction.KickOutRoom(arg_3_0.roomPlayerID_)
			end
		})
	end)
end

function var_0_1.Refresh(arg_12_0, arg_12_1, arg_12_2)
	arg_12_0.roomData_ = arg_12_0.sectionProxy_:GetRoomData()
	arg_12_0.roomPlayerID_ = arg_12_2

	var_0_1.super.Refresh(arg_12_0, arg_12_1)
end

function var_0_1.RefreshUI(arg_13_0)
	arg_13_0:RefreshAddBtn()

	if arg_13_0:IsEmpty() then
		arg_13_0.emptyController_:SetSelectedState("true")
		arg_13_0:RefreshInfoController()
	else
		arg_13_0.emptyController_:SetSelectedState("false")
		arg_13_0:RefershPower()
		arg_13_0:RefreshRace()
		arg_13_0:RefreshAttackType()
		arg_13_0:RefreshInfoController()
		arg_13_0:RefreshPlayerUI()
	end
end

function var_0_1.RefreshAddBtn(arg_14_0)
	if arg_14_0.stateController_ then
		if not arg_14_0:IsEmpty() then
			arg_14_0.stateController_:SetSelectedState("selected")
		elseif arg_14_0.isPosLock_ == true or not arg_14_0.sectionProxy_.canChangeTeam then
			arg_14_0.stateController_:SetSelectedState("lock")
		else
			arg_14_0.stateController_:SetSelectedState("empty")
		end
	end
end

function var_0_1.RefreshInfoController(arg_15_0)
	if arg_15_0:IsEmpty() then
		arg_15_0.infoController_:SetSelectedIndex(0)
	elseif arg_15_0.infoController_:GetSelectedState() ~= "common" then
		if CooperationData:GetIsMaster() then
			arg_15_0.infoController_:SetSelectedIndex(2)
		else
			arg_15_0.infoController_:SetSelectedIndex(1)
		end
	end

	SetActive(arg_15_0.heroInfoBtn_.gameObject, CooperationTools.CanShowHero(arg_15_0.roomPlayerID_))
end

function var_0_1.RefreshPlayerUI(arg_16_0)
	arg_16_0.roomPlayer_ = arg_16_0.roomData_:GetRoomPlayerData(arg_16_0.roomPlayerID_)

	arg_16_0:RefreshMasterUI()
	arg_16_0:RefreshOwnUI()
	arg_16_0:RefreshPlayerState()
	arg_16_0:RefreshFriendUI()
end

function var_0_1.RefreshMasterUI(arg_17_0)
	arg_17_0.masterController_:SetSelectedIndex(arg_17_0.roomPlayer_.is_master == 1 and 1 or 0)
end

function var_0_1.RefreshOwnUI(arg_18_0)
	arg_18_0.userNameText_.text = GetI18NText(arg_18_0.roomPlayer_.nick)

	local var_18_0 = PlayerData:GetPlayerInfo().userID

	arg_18_0.ownController_:SetSelectedIndex(var_18_0 == arg_18_0.roomPlayerID_ and 1 or 0)
end

function var_0_1.RefreshPlayerState(arg_19_0)
	if whereami == "battle" then
		arg_19_0.playerStateController_:SetSelectedState("ready")
	elseif arg_19_0.roomPlayer_.is_ready == 1 then
		arg_19_0.playerStateController_:SetSelectedState("ready")
	elseif arg_19_0.roomData_:RepeatHero(arg_19_0.heroID_) then
		arg_19_0.playerStateController_:SetSelectedState("repeat")
	else
		arg_19_0.playerStateController_:SetSelectedState("commom")
	end
end

function var_0_1.RefreshFriendUI(arg_20_0)
	local var_20_0 = FriendsData:GetList(1)

	if table.indexof(var_20_0, tostring(arg_20_0.roomPlayerID_)) then
		arg_20_0.addFriendLab_.text = GetTips("COOPERATION_ALREADY_FRIEND")
		arg_20_0.addFriendBtn_.interactable = false

		arg_20_0.friendController_:SetSelectedIndex(1)
	else
		arg_20_0.addFriendLab_.text = GetTips("COOPERATION_ADD_FRIEND")
		arg_20_0.addFriendBtn_.interactable = true

		arg_20_0.friendController_:SetSelectedIndex(0)
	end
end

function var_0_1.IsEmpty(arg_21_0)
	return arg_21_0.roomPlayerID_ == nil
end

function var_0_1.BattleStart(arg_22_0)
	arg_22_0.playerStateController_:SetSelectedIndex(1)
end

return var_0_1
