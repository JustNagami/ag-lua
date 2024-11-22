local var_0_0 = class("ActivityFactoryStoryView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "UI/MardukUI/plot/MardukplotUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.GetItemClass(arg_3_0)
	return ActivityFactoryStoryItem
end

function var_0_0.Init(arg_4_0)
	arg_4_0:BindCfgUI()
	arg_4_0:AddListeners()

	arg_4_0.stageItemList_ = {}
	arg_4_0.scrollMoveView_ = ScrollMoveView.New(arg_4_0, arg_4_0.scrollViewGo_)
	arg_4_0.storyChapterView_ = {}
	arg_4_0.lineList_ = {}
end

function var_0_0.OnEnter(arg_5_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR,
		NAVI_BAR
	})
	manager.windowBar:RegistBackCallBack(function()
		if arg_5_0:IsOpenSectionInfo() then
			arg_5_0.isOpenInfoView_ = false
		end

		JumpTools.Back()
	end)
	manager.ui:SetMainCamera("null")
	arg_5_0:RefreshData()
	arg_5_0:RefreshUI()

	for iter_5_0, iter_5_1 in ipairs(ChapterClientCfg[6010004].chapter_list) do
		local var_5_0 = arg_5_0[string.format("chapterGo%s_", iter_5_0)]

		if var_5_0 then
			arg_5_0.storyChapterView_[iter_5_0] = arg_5_0.storyChapterView_[iter_5_0] or ActivityFactoryStoryChapterItem.New(var_5_0, iter_5_1)
		end
	end

	for iter_5_2, iter_5_3 in pairs(arg_5_0.storyChapterView_) do
		iter_5_3:OnEnter(arg_5_0.chapterID_)
	end
end

function var_0_0.OnExit(arg_7_0)
	manager.windowBar:HideBar()
	manager.ui:ResetMainCamera()

	for iter_7_0, iter_7_1 in pairs(arg_7_0.storyChapterView_) do
		iter_7_1:OnExit()
	end

	arg_7_0.scrollMoveView_:OnExit()

	arg_7_0.stopMove_ = false
end

function var_0_0.OnTop(arg_8_0)
	arg_8_0.stopMove_ = false
end

function var_0_0.OnUpdate(arg_9_0)
	if arg_9_0:IsOpenRoute("stageArchive") then
		arg_9_0.stopMove_ = true

		return
	end

	arg_9_0:RefreshData()
	arg_9_0:RefreshUI()

	for iter_9_0, iter_9_1 in pairs(arg_9_0.storyChapterView_) do
		iter_9_1:OnUpdate(arg_9_0.chapterID_)
	end
end

function var_0_0.Dispose(arg_10_0)
	var_0_0.super.Dispose(arg_10_0)

	for iter_10_0, iter_10_1 in ipairs(arg_10_0.lineList_) do
		iter_10_1:Dispose()
	end

	arg_10_0.lineList_ = nil

	for iter_10_2, iter_10_3 in pairs(arg_10_0.stageItemList_) do
		iter_10_3:Dispose()
	end

	arg_10_0.stageItemList_ = nil

	arg_10_0.scrollMoveView_:Dispose()

	arg_10_0.scrollMoveView_ = nil

	for iter_10_4, iter_10_5 in pairs(arg_10_0.storyChapterView_) do
		iter_10_5:Dispose()
	end

	arg_10_0.storyChapterView_ = nil
end

function var_0_0.AddListeners(arg_11_0)
	return
end

function var_0_0.RefreshData(arg_12_0)
	if arg_12_0.params_.chapterID == nil then
		local var_12_0 = arg_12_0.params_.chapterClientID
		local var_12_1 = ChapterClientCfg[var_12_0]

		arg_12_0.chapterID_ = BattleFieldData:GetCacheChapter(var_12_1.id)

		if table.keyof(var_12_1.chapter_list, arg_12_0.chapterID_) < 4 then
			arg_12_0.chapterID_ = BattleFieldData:GetSecondCacheChapter(getChapterToggle(var_12_1.id)) or var_12_1.chapter_list[1]
		end
	else
		arg_12_0.chapterID_ = arg_12_0.params_.chapterID
	end

	arg_12_0.stageData_ = BattleStageData:GetStageData()
	arg_12_0.stageList_ = ChapterCfg[arg_12_0.chapterID_].section_id_list
	arg_12_0.selectStageID_ = BattleFieldData:GetCacheStage(arg_12_0.chapterID_) or arg_12_0.stageList_[1]
end

function var_0_0.RefreshUI(arg_13_0)
	local var_13_0 = arg_13_0:GetScrollPos()
	local var_13_1 = arg_13_0:GetScrollWidth()

	if not arg_13_0.stopMove_ then
		arg_13_0.scrollMoveView_:RefreshUI(var_13_0, var_13_1)
	end

	local var_13_2 = ChapterCfg[arg_13_0.chapterID_]
	local var_13_3 = 0
	local var_13_4 = 0

	for iter_13_0, iter_13_1 in pairs(var_13_2.section_id_list) do
		local var_13_5 = arg_13_0.stageData_[iter_13_1]

		if var_13_5 then
			var_13_3 = var_13_3 + 1

			if var_13_5.clear_times > 0 then
				var_13_4 = var_13_4 + 1
			end
		end
	end

	for iter_13_2 = #arg_13_0.stageItemList_, var_13_3 + 1, -1 do
		arg_13_0.stageItemList_[iter_13_2]:OnExit()
	end

	for iter_13_3 = 1, var_13_3 do
		if arg_13_0.stageItemList_[iter_13_3] == nil then
			arg_13_0.stageItemList_[iter_13_3] = arg_13_0:GetItemClass().New(arg_13_0.sectionItem_, arg_13_0.content_)
		end

		arg_13_0.stageItemList_[iter_13_3]:SetData(arg_13_0.stageList_[iter_13_3], arg_13_0.chapterID_)
	end

	arg_13_0:RefreshSelectItem()

	arg_13_0.nameText_.text = GetI18NText(var_13_2.subhead)
	arg_13_0.finishCntText_.text = string.format("%s/%s", var_13_4, #var_13_2.section_id_list)

	arg_13_0:CreateLineItemList(var_13_3)
end

function var_0_0.RefreshSelectItem(arg_14_0)
	for iter_14_0, iter_14_1 in pairs(arg_14_0.stageItemList_) do
		iter_14_1:SelectorItem(arg_14_0.selectStageID_)
	end
end

function var_0_0.GetScrollWidth(arg_15_0)
	local var_15_0 = arg_15_0.stageList_[1]

	for iter_15_0, iter_15_1 in ipairs(arg_15_0.stageList_) do
		if not arg_15_0.stageData_[iter_15_1] then
			break
		end

		var_15_0 = iter_15_1
	end

	local var_15_1 = BattleActivityStoryStageCfg[var_15_0]

	return var_15_1 and var_15_1.position[1] or 0
end

function var_0_0.GetScrollPos(arg_16_0)
	local var_16_0 = arg_16_0.selectStageID_
	local var_16_1 = BattleActivityStoryStageCfg[var_16_0]

	return var_16_1 and var_16_1.position[1] or 0
end

function var_0_0.IsOpenSectionInfo(arg_17_0)
	return arg_17_0:IsOpenRoute("subPlotSectionInfo")
end

function var_0_0.AddTimer(arg_18_0)
	local var_18_0 = ChapterCfg[arg_18_0.chapterID_].activity_id

	arg_18_0.stopTime_ = ActivityData:GetActivityData(var_18_0).stopTime

	arg_18_0:StopTimer()

	if manager.time:GetServerTime() >= arg_18_0.stopTime_ then
		arg_18_0.textTime_.text = GetTips("TIME_OVER")

		return
	end

	arg_18_0.textTime_.text = manager.time:GetLostTimeStr(arg_18_0.stopTime_)
	arg_18_0.timer_ = Timer.New(function()
		if manager.time:GetServerTime() >= arg_18_0.stopTime_ then
			arg_18_0:StopTimer()

			arg_18_0.textTime_.text = GetTips("TIME_OVER")

			return
		end

		arg_18_0.textTime_.text = manager.time:GetLostTimeStr(arg_18_0.stopTime_)
	end, 1, -1)

	arg_18_0.timer_:Start()
end

function var_0_0.StopTimer(arg_20_0)
	if arg_20_0.timer_ then
		arg_20_0.timer_:Stop()

		arg_20_0.timer_ = nil
	end
end

function var_0_0.CreateLineItemList(arg_21_0, arg_21_1)
	for iter_21_0, iter_21_1 in pairs(arg_21_0.lineList_) do
		iter_21_1:Show(false)
	end

	local var_21_0 = 1

	for iter_21_2 = 2, arg_21_1 do
		local var_21_1 = ChapterCfg[arg_21_0.chapterID_].section_id_list[iter_21_2]
		local var_21_2 = arg_21_0.stageItemList_[iter_21_2]:GetLocalPosition() + Vector3(-130, 0, 0)
		local var_21_3 = BattleActivityStoryStageCfg[var_21_1]
		local var_21_4 = arg_21_0.stageItemList_[iter_21_2 - 1]:GetLocalPosition() + Vector3(130, 0, 0)

		arg_21_0.lineList_[var_21_0] = arg_21_0.lineList_[var_21_0] or arg_21_0:GetLineClass().New(arg_21_0.lineGo_, arg_21_0.content_, 3)

		arg_21_0.lineList_[var_21_0]:Show(true)
		arg_21_0.lineList_[var_21_0]:RefreshUI(var_21_4, var_21_2)

		var_21_0 = var_21_0 + 1
	end
end

function var_0_0.GetLineClass(arg_22_0)
	return SectionSingleLineItem
end

return var_0_0
