local var_0_0 = class("QWorldMaxMapView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/System/SandPlay/SandPlay_Map/SandPlay_MapUI"
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

	arg_4_0.mapCom = arg_4_0.m_map:GetComponent(typeof(QWorldMaxMapUI))

	local var_4_0 = QWorldMgr:GetMapId()
	local var_4_1 = SandPlayMapCfg[var_4_0]
	local var_4_2 = "QWWorld/MiniMap/" .. var_4_1.big_map_path
	local var_4_3 = Vector3.New(var_4_1.big_map_center[1], var_4_1.big_map_center[2], var_4_1.big_map_center[3])

	arg_4_0.mapCom:Init(var_4_2, var_4_1.big_map_size[1], var_4_1.big_map_size[2], var_4_1.small_map_rate, var_4_3, var_4_1.bag_map_initialscale, var_4_1.big_map_maxscale, var_4_1.big_map_minscale)

	arg_4_0.mapCom.OnMapUnitSelectAction = System.Action(arg_4_0.OnMapUnitSelectAction, arg_4_0)
	arg_4_0.infoList = LuaList.New(handler(arg_4_0, arg_4_0.IndexInfoItem), arg_4_0.m_infoList, QWorldMaxMapInfoItem)
	arg_4_0.selectList = LuaList.New(handler(arg_4_0, arg_4_0.IndexSelectItem), arg_4_0.m_selectList, QWorldMaxMapSelectItem)
	arg_4_0.selectController = arg_4_0.m_controller:GetController("select")
	arg_4_0.selectClickHandler = handler(arg_4_0, arg_4_0.SelectClickCallBack)
	arg_4_0.infoClickHandler = handler(arg_4_0, arg_4_0.InfoClickCallBack)
	arg_4_0.condItems_ = {}
	arg_4_0.rewardList = LuaList.New(handler(arg_4_0, arg_4_0.IndexRewardItem), arg_4_0.m_rewardList, CommonItemView)
	arg_4_0.showRewardController = arg_4_0.m_detailController:GetController("showRewards")
	arg_4_0.showdetailController = arg_4_0.m_detailController:GetController("showdetails")
	arg_4_0.btnStateController = arg_4_0.m_detailController:GetController("btnState")
	arg_4_0.IconTypeController = arg_4_0.m_iconController:GetController("type")
	arg_4_0.m_teleportLab.text = GetTips("SANDPLAY_TRANSMIT")
end

function var_0_0.AddUIListener(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.m_selectMask, nil, function()
		arg_5_0.selectController:SetSelectedIndex(0)
		arg_5_0:SelectEntity(nil)
	end)
	arg_5_0:AddBtnListener(arg_5_0.m_followBtn, nil, function()
		if arg_5_0.curBoardInfo == nil then
			return
		end

		local var_7_0 = QWorldMgr:GetQWorldEntityMgr()
		local var_7_1 = arg_5_0.curBoardInfo.inst.entityId

		if not var_7_0:IsTrack(var_7_1) then
			if QWorldEntityMiniMapTag.Task == arg_5_0.curBoardInfo.tag then
				local var_7_2 = arg_5_0.curBoardInfo:GetMainQuestId()

				QWorldQuestAction.UpdateTrackingMainQuestId(var_7_2, function()
					QWorldQuestAction.SendUpdateQuestTrackToSdk(var_7_2, QWorldQuestConst.SDK_QUEST_TRACK_TYPE.TRACK)
				end)
			else
				var_7_0:TrackId(var_7_1)
			end
		else
			var_7_0:CancelTrack(var_7_1)
			arg_5_0.selectController:SetSelectedIndex(0)
			arg_5_0:SelectEntity(nil)
		end

		if QWorldMgr:GetQWorldEntityMgr():IsTrack(var_7_1) then
			arg_5_0.m_followLab.text = GetTips("SANDPLAY_TRACK_CANCEL")
		else
			arg_5_0.m_followLab.text = GetTips("SANDPLAY_TRACK")
		end

		arg_5_0:UpdateRignt()
	end)
	arg_5_0:AddBtnListener(arg_5_0.m_teleportBtn, nil, function()
		if arg_5_0.curBoardInfo == nil then
			return
		end

		local var_9_0 = arg_5_0.curBoardInfo:GetTeleportId()

		if var_9_0 ~= 0 then
			arg_5_0:Back()
			QWorldTeleport(var_9_0)
		end
	end)
	arg_5_0:AddBtnListener(arg_5_0.m_playerBtn, nil, function()
		arg_5_0.mapCom:SelectPlayerInMaxMap()
	end)
	arg_5_0:AddBtnListener(arg_5_0.m_resetBtn, nil, function()
		ShowMessageBox({
			content = GetTips("SANDPLAY_STUCK_AND_DETACHED_REPEAT"),
			OkCallback = function()
				QWorldMgr:StartBlackFade(0.5, 0.5, 1, function()
					arg_5_0:Back()
					QWorldLuaBridge.TeleportToStageOrigin()
				end)
			end
		})
	end)
end

function var_0_0.OnTop(arg_14_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR
	})
end

function var_0_0.OnEnter(arg_15_0)
	arg_15_0:UpdateRignt(true)
	arg_15_0.selectController:SetSelectedIndex(0)

	if arg_15_0.params_.selectEntity then
		arg_15_0:SelectClickCallBack(arg_15_0.params_.selectEntity)

		arg_15_0.params_.selectEntity = nil
	end
end

function var_0_0.OnExit(arg_16_0)
	arg_16_0:SelectEntity(nil)
	manager.windowBar:HideBar()
end

function var_0_0.Dispose(arg_17_0)
	arg_17_0.mapCom:Dispose()

	arg_17_0.mapCom = nil

	arg_17_0.selectList:Dispose()
	arg_17_0.infoList:Dispose()
	arg_17_0.rewardList:Dispose()

	for iter_17_0, iter_17_1 in ipairs(arg_17_0.condItems_) do
		iter_17_1:Dispose()
	end

	arg_17_0.condItems_ = {}

	var_0_0.super.Dispose(arg_17_0)
end

function var_0_0.UpdateRignt(arg_18_0, arg_18_1)
	arg_18_0.miniMapBoardList = QWorldMgr:GetQWorldEntityMgr():GetMiniMapBoardList()

	if arg_18_1 then
		arg_18_0.infoList:StartScroll(#arg_18_0.miniMapBoardList)
	else
		local var_18_0 = arg_18_0.infoList:GetScrolledPosition()

		arg_18_0.infoList:StartScrollWithoutAnimator(#arg_18_0.miniMapBoardList, false)
	end
end

function var_0_0.InfoClickCallBack(arg_19_0, arg_19_1)
	SetActive(arg_19_0.m_selectList.gameObject, false)
	arg_19_0.selectController:SetSelectedIndex(1)
	arg_19_0.mapCom:SelectInMaxMap(arg_19_1.inst.entityId)
	arg_19_0:SelectEntity(arg_19_1)
end

function var_0_0.OnMapUnitSelectAction(arg_20_0)
	local var_20_0 = arg_20_0.mapCom:GetSelectEntityEntityIds()

	arg_20_0.selectEntityIdList = {}

	local var_20_1 = var_20_0.Length - 1

	for iter_20_0 = 0, var_20_1 do
		table.insert(arg_20_0.selectEntityIdList, var_20_0[iter_20_0])
	end

	local var_20_2 = #arg_20_0.selectEntityIdList

	if var_20_2 >= 2 then
		SetActive(arg_20_0.m_selectList.gameObject, true)
		arg_20_0.selectList:StartScroll(#arg_20_0.selectEntityIdList)
	else
		SetActive(arg_20_0.m_selectList.gameObject, false)
	end

	if var_20_2 == 0 then
		arg_20_0.selectController:SetSelectedIndex(0)
		arg_20_0:SelectEntity(nil)
	else
		arg_20_0:SelectClickCallBack(arg_20_0.selectEntityIdList[1])
	end
end

function var_0_0.SelectClickCallBack(arg_21_0, arg_21_1)
	local var_21_0 = QWorldMgr:GetQWorldEntityMgr():GetEntByEntityId(arg_21_1)

	if var_21_0 and var_21_0.miniMapUnit then
		local var_21_1 = var_21_0.miniMapUnit:GetDefaultBoard()

		arg_21_0.selectController:SetSelectedIndex(1)
		arg_21_0:SelectEntity(var_21_1)
	end

	arg_21_0.mapCom:SelectInMaxMap(arg_21_1)
end

function var_0_0.SelectEntity(arg_22_0, arg_22_1)
	if arg_22_1 ~= arg_22_0.curBoardInfo then
		if arg_22_0.curBoardInfo and arg_22_0.curBoardInfo.inst.miniMapUnit then
			arg_22_0.curBoardInfo.inst.miniMapUnit:SetSelect(false)
		end

		if arg_22_1 then
			arg_22_1.inst.miniMapUnit:SetSelect(true)
		end

		arg_22_0.m_rightAnim:Play("UI_nodeDetailPanel", 0, 0)
	end

	arg_22_0.curBoardInfo = arg_22_1

	if arg_22_1 then
		local var_22_0 = arg_22_1.inst.entityId
		local var_22_1, var_22_2 = arg_22_1:GetName()

		arg_22_0.m_title.text = var_22_1
		arg_22_0.m_desc.text = var_22_2
		arg_22_0.rewards = arg_22_1:GetRewards()

		local var_22_3 = #arg_22_0.rewards

		if var_22_3 > 0 then
			arg_22_0.rewards = formatRewardCfgList(arg_22_0.rewards)
			arg_22_0.rewards = sortReward(arg_22_0.rewards)

			arg_22_0.rewardList:StartScroll(var_22_3)
			arg_22_0.showRewardController:SetSelectedIndex(0)
		else
			arg_22_0.showRewardController:SetSelectedIndex(1)
		end

		arg_22_0:RefreshTask(arg_22_1)

		local var_22_4 = arg_22_1:GetTag()

		if QWorldEntityMiniMapTag.Task == var_22_4 then
			arg_22_0.btnStateController:SetSelectedIndex(1)

			if QWorldMgr:GetQWorldEntityMgr():IsTrack(var_22_0) then
				arg_22_0.m_followLab.text = GetTips("SANDPLAY_TRACK_CANCEL")
			else
				arg_22_0.m_followLab.text = GetTips("SANDPLAY_TRACK")
			end
		elseif QWorldEntityMiniMapTag.Hud == var_22_4 and arg_22_1:GetTeleportId() ~= 0 then
			arg_22_0.btnStateController:SetSelectedIndex(2)
		else
			arg_22_0.btnStateController:SetSelectedIndex(0)
		end

		local var_22_5, var_22_6 = arg_22_1:GetIcon()

		arg_22_0.m_icon.sprite = getSpriteWithoutAtlas(var_22_5)

		arg_22_0.IconTypeController:SetSelectedIndex(var_22_6)

		local var_22_7 = false

		if arg_22_1.tag == QWorldEntityMiniMapTag.Hud then
			local var_22_8 = nullable(SandplayTagCfg, arg_22_1.param, "activityId")

			if var_22_8 then
				var_22_7 = manager.redPoint:getTipBoolean(ActivityTools.GetRedPointKey(var_22_8) .. var_22_8)
			end
		end

		manager.redPoint:SetRedPointIndependent(arg_22_0.m_teleportBtn.transform, var_22_7)
	end
end

function var_0_0.RefreshTask(arg_23_0, arg_23_1)
	local var_23_0 = arg_23_1:GetTag()

	if QWorldEntityMiniMapTag.Task == var_23_0 then
		local var_23_1 = arg_23_1:GetMainQuestId()

		arg_23_0.questIdList_ = QWorldQuestTool.GetVisibleQuestIdList(var_23_1)

		local var_23_2 = #arg_23_0.questIdList_

		for iter_23_0, iter_23_1 in ipairs(arg_23_0.condItems_) do
			SetActive(iter_23_1.gameObject_, iter_23_0 <= var_23_2)
		end

		for iter_23_2 = 1, var_23_2 do
			local var_23_3 = arg_23_0.condItems_[iter_23_2]

			if not var_23_3 then
				local var_23_4 = Object.Instantiate(arg_23_0.m_detailItem, arg_23_0.m_detailContent)

				SetActive(var_23_4, true)

				var_23_3 = QWorldMaxMapTaskDetailItem.New(var_23_4)
				arg_23_0.condItems_[iter_23_2] = var_23_3
			end

			var_23_3:SetData(arg_23_0.questIdList_[iter_23_2])
		end

		arg_23_0.showdetailController:SetSelectedIndex(0)
	else
		arg_23_0.showdetailController:SetSelectedIndex(1)
	end
end

function var_0_0.IndexInfoItem(arg_24_0, arg_24_1, arg_24_2)
	local var_24_0 = arg_24_0.miniMapBoardList[arg_24_1]

	arg_24_2:SetData(arg_24_1, var_24_0)
	arg_24_2:RegistCallBack(arg_24_0.infoClickHandler)
end

function var_0_0.IndexSelectItem(arg_25_0, arg_25_1, arg_25_2)
	local var_25_0 = arg_25_0.selectEntityIdList[arg_25_1]
	local var_25_1 = QWorldMgr:GetQWorldEntityMgr():GetEntByEntityId(var_25_0)

	if var_25_1 and var_25_1.miniMapUnit then
		local var_25_2 = var_25_1.miniMapUnit:GetDefaultBoard()

		arg_25_2:SetData(var_25_0, var_25_2)
	end

	arg_25_2:RegistCallBack(arg_25_0.selectClickHandler)
end

function var_0_0.IndexRewardItem(arg_26_0, arg_26_1, arg_26_2)
	local var_26_0 = arg_26_0.rewards[arg_26_1]
	local var_26_1 = clone(ItemTemplateData)

	var_26_1.id = var_26_0.id
	var_26_1.number = var_26_0.num
	var_26_1.race = var_26_0.race

	function var_26_1.clickFun(arg_27_0)
		ShowPopItem(POP_ITEM, {
			arg_27_0.id,
			arg_27_0.number
		})
	end

	arg_26_2:SetData(var_26_1)
end

return var_0_0
