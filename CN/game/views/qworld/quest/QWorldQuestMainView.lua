local var_0_0 = class("QWorldQuestMainView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/System/SandPlay/SandPlay_Quest/SandPlay_QuestPopUI"
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

	arg_4_0.rewardList_ = LuaList.New(handler(arg_4_0, arg_4_0.IndexRewardItem), arg_4_0.rewardUiList_, CommonItemView)
	arg_4_0.allToggle_ = QWorldQuestToggleItem.New(arg_4_0.allGo_)
	arg_4_0.mainToggle_ = QWorldQuestToggleItem.New(arg_4_0.mainGo_)
	arg_4_0.sideToggle_ = QWorldQuestToggleItem.New(arg_4_0.sideGo_)
	arg_4_0.exploreToggle_ = QWorldQuestToggleItem.New(arg_4_0.exploreGo_)
	arg_4_0.emptyController_ = arg_4_0.conEx_:GetController("empty")
	arg_4_0.showRewardController_ = arg_4_0.conEx_:GetController("showReward")
	arg_4_0.questCategoryItems_ = {}
	arg_4_0.questItems_ = {}
	arg_4_0.condItems_ = {}

	SetActive(arg_4_0.questItem_, false)
	SetActive(arg_4_0.questCondItem_, false)
	SetActive(arg_4_0.questTypeItem_, false)
end

function var_0_0.AddUIListener(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.trackBtn_, nil, function()
		local var_6_0 = arg_5_0.curMainQuestId_ == QWorldQuestTool.GetMainQuestTrackingId() and -1 or arg_5_0.curMainQuestId_

		QWorldQuestAction.UpdateTrackingMainQuestId(var_6_0, function()
			arg_5_0:RefreshQuestContent(arg_5_0.curMainQuestId_)
			arg_5_0:RefreshUI()

			if var_6_0 ~= -1 then
				QWorldQuestAction.SendUpdateQuestTrackToSdk(arg_5_0.curMainQuestId_, QWorldQuestConst.SDK_QUEST_TRACK_TYPE.TRACK)
				arg_5_0:Back()
			else
				QWorldQuestAction.SendUpdateQuestTrackToSdk(arg_5_0.curMainQuestId_, QWorldQuestConst.SDK_QUEST_TRACK_TYPE.UNTRACK)
			end
		end)
	end)
	arg_5_0:AddBtnListener(arg_5_0.gotoMapBtn_, nil, function()
		local var_8_0 = QWorldQuestTool.GetQuestTrackingEntityIdList(arg_5_0.curMainQuestId_)

		if var_8_0 and #var_8_0 > 0 then
			JumpTools.GoToSystem("/qWorldMaxMapView", {
				selectEntity = var_8_0[1]
			})
		end
	end)
	arg_5_0.allToggle_:SetCallback(function()
		arg_5_0:RefreshQuestCache()
		arg_5_0:RefreshUI()
	end)
	arg_5_0.mainToggle_:SetCallback(function()
		arg_5_0:RefreshQuestCache(QWorldQuestConst.QUEST_TASK_TYPE.MAIN)
		arg_5_0:RefreshUI()
	end)
	arg_5_0.sideToggle_:SetCallback(function()
		arg_5_0:RefreshQuestCache(QWorldQuestConst.QUEST_TASK_TYPE.SIDE)
		arg_5_0:RefreshUI()
	end)
	arg_5_0.exploreToggle_:SetCallback(function()
		arg_5_0:RefreshQuestCache(QWorldQuestConst.QUEST_TASK_TYPE.EXPLORE)
		arg_5_0:RefreshUI()
	end)
end

function var_0_0.IndexRewardItem(arg_13_0, arg_13_1, arg_13_2)
	local var_13_0 = arg_13_0.rewardItemList[arg_13_1]

	if ItemCfg[var_13_0.id] and ItemConst.ITEM_TYPE.EQUIP == ItemCfg[var_13_0.id].type then
		var_13_0.race = EquipCfg[var_13_0.id] and EquipCfg[var_13_0.id].race or 0
	end

	local var_13_1 = clone(ItemTemplateData)

	var_13_1.id = var_13_0.id
	var_13_1.number = var_13_0.num
	var_13_1.race = var_13_0.race

	function var_13_1.clickFun(arg_14_0)
		ShowPopItemOnly(POP_OTHER_ITEM, {
			arg_14_0.id,
			arg_14_0.number
		})
	end

	arg_13_2:SetData(var_13_1)
end

function var_0_0.OnEnter(arg_15_0)
	manager.windowBar:SwitchBar({
		BACK_BAR
	})
	arg_15_0.allToggle_:SetToggleValue(true)
	arg_15_0:RefreshQuestCache()
	arg_15_0:RefreshUI()
end

function var_0_0.OnExit(arg_16_0)
	manager.windowBar:HideBar()
end

function var_0_0.OnQWorldMainQuestUpdate(arg_17_0)
	arg_17_0:RefreshQuestCache(arg_17_0.lastTaskType_)
	arg_17_0:RefreshUI()
end

function var_0_0.OnQWorldQuestUpdateProgress(arg_18_0)
	if QWorldQuestTool.MainQuestHasRealtimeProgress(arg_18_0.curMainQuestId_) then
		arg_18_0:RefreshQuestContent(arg_18_0.curMainQuestId_)
	end
end

function var_0_0.RefreshQuestCache(arg_19_0, arg_19_1)
	local var_19_0 = arg_19_0.statusText_.gameObject.activeSelf

	arg_19_0.lastTaskType_ = arg_19_1
	arg_19_0.mainQuestIdList_ = {}

	for iter_19_0, iter_19_1 in ipairs(SandplayTaskMainCfg.all) do
		local var_19_1 = SandplayTaskMainCfg[iter_19_1]

		if (not arg_19_1 or var_19_1.main_task_type == arg_19_1) and QWorldQuestTool.IsMainQuestTrackable(iter_19_1, true, var_19_0) then
			if not arg_19_0.mainQuestIdList_[var_19_1.main_task_type] then
				arg_19_0.mainQuestIdList_[var_19_1.main_task_type] = {}
			end

			table.insert(arg_19_0.mainQuestIdList_[var_19_1.main_task_type], iter_19_1)
		end
	end

	for iter_19_2, iter_19_3 in pairs(arg_19_0.mainQuestIdList_) do
		table.sort(iter_19_3, function(arg_20_0, arg_20_1)
			local var_20_0 = SandplayTaskMainCfg[arg_20_0]
			local var_20_1 = SandplayTaskMainCfg[arg_20_1]

			if var_20_0.priority ~= var_20_1.priority then
				return var_20_0.priority < var_20_1.priority
			end

			if var_20_0.priority == var_20_1.priority then
				return var_20_0.main_task_id < var_20_1.main_task_id
			else
				return var_20_0.priority < var_20_1.priority
			end
		end)
	end

	if not table.isEmpty(arg_19_0.mainQuestIdList_) then
		arg_19_0.selectedId_ = QWorldQuestTool.GetMainQuestTrackingId()

		local var_19_2 = SandplayTaskMainCfg[arg_19_0.selectedId_]

		if not var_19_2 or not arg_19_0.mainQuestIdList_[var_19_2.main_task_type] or not table.indexof(arg_19_0.mainQuestIdList_[var_19_2.main_task_type], arg_19_0.selectedId_) then
			arg_19_0.selectedId_ = table.GetFirstElem(arg_19_0.mainQuestIdList_)[1]
		end
	end
end

function var_0_0.RefreshUI(arg_21_0)
	arg_21_0.emptyController_:SetSelectedState(table.isEmpty(arg_21_0.mainQuestIdList_) and "true" or "false")

	for iter_21_0, iter_21_1 in pairs(arg_21_0.questCategoryItems_) do
		SetActive(iter_21_1.gameObject_, arg_21_0.mainQuestIdList_[iter_21_0] ~= nil)
	end

	local var_21_0 = 0

	for iter_21_2, iter_21_3 in pairs(arg_21_0.mainQuestIdList_) do
		local var_21_1 = arg_21_0.questCategoryItems_[iter_21_2]

		if not var_21_1 then
			local var_21_2 = Object.Instantiate(arg_21_0.questTypeItem_, arg_21_0.questsTrans_)

			SetActive(var_21_2, true)

			var_21_1 = QWorldQuestCategory.New(var_21_2)
			arg_21_0.questCategoryItems_[iter_21_2] = var_21_1

			var_21_1:SetData(iter_21_2)
		end

		for iter_21_4 = 1, #iter_21_3 do
			var_21_0 = var_21_0 + 1

			local var_21_3 = arg_21_0.questItems_[var_21_0]

			if not var_21_3 then
				local var_21_4 = Object.Instantiate(arg_21_0.questItem_, arg_21_0.questsTrans_)

				SetActive(var_21_4, true)

				var_21_3 = QWorldMainQuestItem.New(var_21_4)
				arg_21_0.questItems_[var_21_0] = var_21_3
			end

			local var_21_5 = iter_21_3[iter_21_4]

			var_21_3:SetData(var_21_5)
			var_21_3.gameObject_.transform:SetSiblingIndex(var_21_1.transform_:GetSiblingIndex() + iter_21_4)
			var_21_3:SetClickHandler(function(arg_22_0)
				arg_21_0:RefreshQuestContent(arg_22_0)
				arg_21_0:RefreshSelectState(arg_22_0)
			end)

			if arg_21_0.selectedId_ == var_21_5 then
				arg_21_0:RefreshQuestContent(var_21_5)
			end
		end
	end

	for iter_21_5 = 1, #arg_21_0.questItems_ do
		SetActive(arg_21_0.questItems_[iter_21_5].gameObject_, iter_21_5 <= var_21_0)
	end

	arg_21_0:RefreshSelectState(arg_21_0.selectedId_)
end

function var_0_0.RefreshSelectState(arg_23_0, arg_23_1)
	arg_23_0.selectedId_ = arg_23_1

	for iter_23_0, iter_23_1 in ipairs(arg_23_0.questItems_) do
		iter_23_1:SetSelected(arg_23_1 == iter_23_1.mainQuestId_)
	end
end

function var_0_0.RefreshQuestContent(arg_24_0, arg_24_1)
	local var_24_0 = SandplayTaskMainCfg[arg_24_1]

	arg_24_0.titleText_.text = var_24_0.title
	arg_24_0.contentText_.text = var_24_0.descrption

	local var_24_1 = QWorldQuestTool.GetMainQuestTrackingId()

	arg_24_0.trackText_.text = var_24_1 ~= arg_24_1 and GetTips("SANDPLAY_TRACK") or GetTips("SANDPLAY_TRACK_CANCEL")

	SetActive(arg_24_0.gotoMapBtn_.gameObject, var_24_1 == arg_24_1)

	local var_24_2 = {}

	if var_24_0.reward ~= "" then
		for iter_24_0, iter_24_1 in pairs(var_24_0.reward) do
			table.insert(var_24_2, iter_24_1)
		end
	end

	local var_24_3 = formatRewardCfgList(var_24_2)
	local var_24_4 = mergeReward(var_24_3)
	local var_24_5 = sortReward(var_24_4)

	if arg_24_0.curMainQuestId_ ~= arg_24_1 then
		arg_24_0.rewardItemList = var_24_5

		arg_24_0.rewardList_:StartScroll(#arg_24_0.rewardItemList)
		arg_24_0.showRewardController_:SetSelectedIndex(#var_24_5 == 0 and 0 or 1)
	end

	arg_24_0.questIdList_ = QWorldQuestTool.GetVisibleQuestIdList(arg_24_1)

	local var_24_6 = #arg_24_0.questIdList_

	for iter_24_2, iter_24_3 in ipairs(arg_24_0.condItems_) do
		SetActive(iter_24_3.gameObject_, iter_24_2 <= var_24_6)
	end

	for iter_24_4 = 1, var_24_6 do
		local var_24_7 = arg_24_0.condItems_[iter_24_4]

		if not var_24_7 then
			local var_24_8 = Object.Instantiate(arg_24_0.questCondItem_, arg_24_0.conditionListTrans_)

			SetActive(var_24_8, true)

			var_24_7 = QWorldQuestItem.New(var_24_8)
			arg_24_0.condItems_[iter_24_4] = var_24_7
		end

		var_24_7:SetData(arg_24_0.questIdList_[iter_24_4])
	end

	arg_24_0.curMainQuestId_ = arg_24_1

	if arg_24_0.statusText_.gameObject.activeSelf then
		local var_24_9 = {
			[QWorldQuestConst.MAIN_QUEST_STATUS.LOCKED] = "锁定中",
			[QWorldQuestConst.MAIN_QUEST_STATUS.UNLOCK] = "已解锁",
			[QWorldQuestConst.MAIN_QUEST_STATUS.UNTAKE] = "未领取",
			[QWorldQuestConst.MAIN_QUEST_STATUS.IN_PROGRESS] = "进行中",
			[QWorldQuestConst.MAIN_QUEST_STATUS.FINISH] = "已完成"
		}
		local var_24_10 = {
			[QWorldQuestConst.QUEST_STATUS.IN_PROGRESS] = "进行中",
			[QWorldQuestConst.QUEST_STATUS.FINISH] = "已完成",
			[QWorldQuestConst.QUEST_STATUS.NOT_START] = "未开始",
			[QWorldQuestConst.QUEST_STATUS.SKIPPED] = "已跳过"
		}
		local var_24_11 = SandplayTaskCfg.get_id_list_by_main_task_id[arg_24_1]
		local var_24_12 = QWorldQuestData:GetMainQuestData(arg_24_1)
		local var_24_13 = string.format("主任务ID: %d, 任务状态: %s", arg_24_1, var_24_9[var_24_12.status])

		if #var_24_11 == 0 then
			var_24_13 = string.format("%s\n%s", var_24_13, string.format("任务条件全部完成"))
		end

		for iter_24_5, iter_24_6 in ipairs(var_24_11) do
			local var_24_14 = QWorldQuestData:GetQuestData(iter_24_6) or {
				progress = 0
			}
			local var_24_15 = SandplayTaskCfg[iter_24_6]

			var_24_13 = string.format("%s\n%s", var_24_13, string.format("子任务(%d): %d/%d, 状态: %s", iter_24_6, var_24_14.progress, var_24_15.need, var_24_10[QWorldQuestTool.GetQuestStatus(iter_24_6)]))
		end

		arg_24_0.statusText_.text = var_24_13
	end
end

function var_0_0.Dispose(arg_25_0)
	for iter_25_0, iter_25_1 in pairs(arg_25_0.questCategoryItems_) do
		iter_25_1:Dispose()
	end

	for iter_25_2, iter_25_3 in ipairs(arg_25_0.questItems_) do
		iter_25_3:Dispose()
	end

	for iter_25_4, iter_25_5 in ipairs(arg_25_0.condItems_) do
		iter_25_5:Dispose()
	end

	if arg_25_0.allToggle_ then
		arg_25_0.allToggle_:Dispose()

		arg_25_0.allToggle_ = nil
	end

	if arg_25_0.mainToggle_ then
		arg_25_0.mainToggle_:Dispose()

		arg_25_0.mainToggle_ = nil
	end

	if arg_25_0.sideToggle_ then
		arg_25_0.sideToggle_:Dispose()

		arg_25_0.sideToggle_ = nil
	end

	if arg_25_0.exploreToggle_ then
		arg_25_0.exploreToggle_:Dispose()

		arg_25_0.exploreToggle_ = nil
	end

	arg_25_0.rewardList_:Dispose()
	var_0_0.super.Dispose(arg_25_0)
end

return var_0_0
