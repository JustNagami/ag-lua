local var_0_0 = class("SectionBaseView", ReduxView)
local var_0_1 = import("game.const.BattleConst")
local var_0_2 = import("game.tools.JumpTools")

function var_0_0.UIName(arg_1_0)
	return "Widget/System/Operation/OperationStageUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.OnCtor(arg_3_0)
	return
end

function var_0_0.Init(arg_4_0)
	arg_4_0.lineList_ = {}
	arg_4_0.customLineList_ = {}
	arg_4_0.missionItem_ = {}
	arg_4_0.lineType_ = nil
	arg_4_0.multiTimeRefresh_ = 0

	arg_4_0:InitUI()
	arg_4_0:AddListeners()
end

function var_0_0.OnEnter(arg_5_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR,
		NAVI_BAR,
		INVITE_BAR
	})
	manager.windowBar:RegistBackCallBack(function()
		if arg_5_0:IsOpenSectionInfo() then
			arg_5_0.isOpenInfoView_ = false
		end

		var_0_2.Back()
	end)
	arg_5_0:RegistEventListener(STAGE_ARCHIVE_RED_UPDATE, function()
		manager.redPoint:SetRedPointIndependent(arg_5_0.archiveCollectBtn_.transform, StageTools.IsHavedStageArchiveRedInChapter(arg_5_0.chapterID_))
	end)
	manager.ui:SetMainCamera("null")
	arg_5_0:RefreshData()
	arg_5_0:RefreshBGM()
	arg_5_0:RefreshMultiReward()

	local var_5_0, var_5_1 = ActivityMultiRewardData:GetMultiRatioByChapterOrToggle(nil, arg_5_0.chapterID_)

	if var_5_0 > 0 and arg_5_0.timer_ == nil then
		arg_5_0.timer_ = Timer.New(function()
			arg_5_0.multiRefreshText_.text = string.format(GetTips("REFRESH_LOST_TIME"), manager.time:GetLostTimeStr(arg_5_0.multiTimeRefresh_))
		end, 1, -1)

		arg_5_0.timer_:Start()
	end

	arg_5_0:ShowPanel()
	arg_5_0:RefreshText()
	arg_5_0:RefreshUI()
end

function var_0_0.OnTop(arg_9_0)
	arg_9_0.stopMove_ = false
end

function var_0_0.OnMultipleRewardCountChange(arg_10_0)
	arg_10_0:RefreshMultiReward()
end

function var_0_0.OnUpdate(arg_11_0)
	if arg_11_0:IsOpenSectionInfo() then
		arg_11_0.stopMove_ = false
	end

	arg_11_0:RefreshData()
	arg_11_0:RefreshUI()
end

function var_0_0.RefreshUI(arg_12_0)
	arg_12_0:RefreshMissionList()

	arg_12_0.selectSection_ = arg_12_0.params_.section or BattleFieldData:GetCacheStage(arg_12_0.chapterID_) or arg_12_0.stageList_[1]

	local var_12_0 = arg_12_0:GetScrollPos()
	local var_12_1 = arg_12_0:GetScrollWidth()

	if arg_12_0.stopMove_ then
		-- block empty
	else
		arg_12_0.scrollMoveView_:RefreshUI(var_12_0, var_12_1)
	end

	arg_12_0:RefreshSelectItem()
end

function var_0_0.RefreshBGM(arg_13_0)
	local var_13_0 = ChapterCfg[arg_13_0.chapterID_]

	if var_13_0.cue_sheet ~= "" then
		manager.audio:PlayBGM(var_13_0.cue_sheet, var_13_0.cue_name, var_13_0.awb)
	end
end

function var_0_0.GetScrollWidth(arg_14_0)
	local var_14_0 = 0
	local var_14_1 = arg_14_0.oepnStageList_

	for iter_14_0, iter_14_1 in ipairs(var_14_1) do
		local var_14_2 = arg_14_0:GetCfgName()[iter_14_1]
		local var_14_3 = var_14_2.position ~= "" and var_14_2.position[1] or 0

		if var_14_0 < var_14_3 then
			var_14_0 = var_14_3
		end
	end

	return var_14_0
end

function var_0_0.GetScrollPos(arg_15_0)
	local var_15_0 = arg_15_0:GetCfgName()[arg_15_0.selectSection_]

	return var_15_0 and var_15_0.position[1] or 0
end

function var_0_0.RefreshMultiReward(arg_16_0)
	local var_16_0, var_16_1 = ActivityMultiRewardData:GetMultiRatioByChapterOrToggle(nil, arg_16_0.chapterID_)

	if var_16_0 > 0 then
		local var_16_2, var_16_3 = ActivityMultiRewardData:GetCountByActivityID(var_16_1)

		arg_16_0.multiCountText_.text = var_16_2 .. "/" .. var_16_3
		arg_16_0.multiRatioText_.text = var_16_0 / 100

		local var_16_4 = ActivityData:GetActivityData(var_16_1)

		arg_16_0.multiEndText_.text = string.format(GetTips("ENDING_TIME"), manager.time:STimeDescS(var_16_4.stopTime, "!%Y/%m/%d %H:%M"))
		arg_16_0.multiTimeRefresh_ = ActivityMultiRewardData:GetTimeByActivityID(var_16_1)
		arg_16_0.multiRefreshText_.text = string.format(GetTips("REFRESH_LOST_TIME"), manager.time:GetLostTimeStr(arg_16_0.multiTimeRefresh_))

		SetActive(arg_16_0.multiGo_, true)
	else
		SetActive(arg_16_0.multiGo_, false)
	end
end

function var_0_0.OnExit(arg_17_0)
	manager.windowBar:HideBar()
	manager.ui:ResetMainCamera()

	if arg_17_0.timer_ then
		arg_17_0.timer_:Stop()

		arg_17_0.timer_ = nil
	end

	arg_17_0.scrollMoveView_:OnExit()

	arg_17_0.lastChapterID_ = nil
	arg_17_0.stopMove_ = false
end

function var_0_0.Dispose(arg_18_0)
	arg_18_0:RemoveListeners()
	arg_18_0:RemoveAllListeners()

	if arg_18_0.timer_ then
		arg_18_0.timer_:Stop()

		arg_18_0.timer_ = nil
	end

	arg_18_0.lineType_ = nil

	for iter_18_0, iter_18_1 in ipairs(arg_18_0.missionItem_) do
		iter_18_1:Dispose()
	end

	arg_18_0.missionItem_ = nil

	arg_18_0:DestroyLine()

	arg_18_0.lineList_ = nil

	for iter_18_2, iter_18_3 in pairs(arg_18_0.customLineList_) do
		iter_18_3:Dispose()
	end

	arg_18_0.customLineList_ = nil

	if arg_18_0.scene_ then
		Object.Destroy(arg_18_0.scene_)

		arg_18_0.scene_ = nil
	end

	arg_18_0.selector_ = nil

	arg_18_0.scrollMoveView_:Dispose()

	arg_18_0.scrollMoveView_ = nil
	arg_18_0.bgBtn_ = nil
	arg_18_0.scrollView_ = nil
	arg_18_0.scrollViewGo_ = nil
	arg_18_0.content_ = nil
	arg_18_0.contentRect_ = nil
	arg_18_0.viewportRect_ = nil
	arg_18_0.scrollViewEvent_ = nil
	arg_18_0.selectDifficultGo_ = nil
	arg_18_0.collectBtnGo_ = nil
	arg_18_0.collectBtn_ = nil
	arg_18_0.collectCurText_ = nil
	arg_18_0.collectTotalText_ = nil
	arg_18_0.collectProgress_ = nil
	arg_18_0.sectionItem_ = nil
	arg_18_0.lineGo_ = nil

	var_0_0.super.Dispose(arg_18_0)
end

function var_0_0.InitUI(arg_19_0)
	arg_19_0:BindCfgUI()

	arg_19_0.scrollMoveView_ = ScrollMoveView.New(arg_19_0, arg_19_0.scrollViewGo_)

	arg_19_0:InitCustom()
end

function var_0_0.InitCustom(arg_20_0)
	return
end

function var_0_0.AddListeners(arg_21_0)
	arg_21_0:AddBtnListener(arg_21_0.bgBtn_, nil, function()
		if arg_21_0:IsOpenSectionInfo() then
			arg_21_0.isOpenInfoView_ = false

			var_0_2.Back()
		end
	end)

	if arg_21_0.archiveCollectBtn_ then
		arg_21_0:AddBtnListener(arg_21_0.archiveCollectBtn_, nil, function()
			var_0_2.OpenPageByJump("stageArchiveCollect", {
				chapterID = arg_21_0.chapterID_
			})
		end)
	end
end

function var_0_0.RemoveListeners(arg_24_0)
	arg_24_0.bgBtn_.onClick:RemoveAllListeners()
end

function var_0_0.RefreshData(arg_25_0)
	if arg_25_0.params_.chapterID == nil then
		local var_25_0 = arg_25_0.params_.chapterClientID

		arg_25_0.chapterID_ = BattleFieldData:GetCacheChapter(var_25_0)
	else
		arg_25_0.chapterID_ = arg_25_0.params_.chapterID
	end

	arg_25_0.stageData_ = BattleStageData:GetStageData()
	arg_25_0.stageList_ = ChapterCfg[arg_25_0.chapterID_].section_id_list

	local var_25_1 = arg_25_0.params_.section or BattleFieldData:GetCacheStage(arg_25_0.chapterID_) or ChapterCfg[arg_25_0.chapterID_].section_id_list[1]
	local var_25_2 = getChapterClientCfgByChapterID(arg_25_0.chapterID_)

	BattleFieldData:SetStageByClientID(var_25_2.id, var_25_1)
	BattleFieldAction.ChangeSelectChapterID(arg_25_0.chapterID_)
	arg_25_0:RefreshCustomData()

	arg_25_0.oepnStageList_ = ChapterTools.GetOpenStageList(arg_25_0.chapterID_, arg_25_0:GetCfgName())
end

function var_0_0.RefreshCustomData(arg_26_0)
	return
end

function var_0_0.IsOpenSectionInfo(arg_27_0)
	return arg_27_0:IsOpenRoute("challengeSectionInfo")
end

function var_0_0.GetCfgName(arg_28_0)
	return
end

function var_0_0.ShowPanel(arg_29_0)
	SetActive(arg_29_0.collectBtnGo_, false)
	SetActive(arg_29_0.selectDifficultGo_, false)

	if arg_29_0.archiveCollectBtn_ then
		SetActive(arg_29_0.archiveCollectBtn_.gameObject, StageTools.IsNeedStageArchiveEntrace(arg_29_0.chapterID_))
		manager.redPoint:SetRedPointIndependent(arg_29_0.archiveCollectBtn_.transform, StageTools.IsHavedStageArchiveRedInChapter(arg_29_0.chapterID_))
	end
end

function var_0_0.RefreshText(arg_30_0)
	return
end

function var_0_0.SwitchBG(arg_31_0)
	local var_31_0 = ChapterCfg[arg_31_0.chapterID_]

	if var_31_0.bg ~= "" then
		arg_31_0.bgImage_.sprite = getSpriteWithoutAtlas(var_31_0.bg)
	end

	SetActive(arg_31_0.bgImage_.gameObject, var_31_0.bg ~= "")
end

function var_0_0.RefreshSelectItem(arg_32_0)
	for iter_32_0, iter_32_1 in pairs(arg_32_0.missionItem_) do
		iter_32_1:SelectorItem(arg_32_0.selectSection_)
	end
end

function var_0_0.RefreshMissionList(arg_33_0)
	if arg_33_0.lastChapterID_ == arg_33_0.chapterID_ then
		return
	end

	arg_33_0.lastChapterID_ = arg_33_0.chapterID_

	for iter_33_0 = 1, #arg_33_0.missionItem_ do
		arg_33_0.missionItem_[iter_33_0]:Show(false)
	end

	for iter_33_1 = 1, #arg_33_0.stageList_ do
		if arg_33_0.missionItem_[iter_33_1] then
			arg_33_0.missionItem_[iter_33_1]:SetData(arg_33_0.chapterID_, arg_33_0.stageList_[iter_33_1])
		else
			arg_33_0.missionItem_[iter_33_1] = arg_33_0:GetSectionItemClass().New(arg_33_0.sectionItem_, arg_33_0.content_, arg_33_0.stageList_[iter_33_1], arg_33_0.chapterID_)
		end
	end

	arg_33_0:CreateLineItemList()
end

function var_0_0.CreateLineItemList(arg_34_0)
	if arg_34_0.lineType_ ~= ChapterCfg[arg_34_0.chapterID_].line_type then
		arg_34_0:DestroyLine()

		arg_34_0.lineType_ = ChapterCfg[arg_34_0.chapterID_].line_type
	end

	for iter_34_0, iter_34_1 in pairs(arg_34_0.lineList_) do
		iter_34_1:Show(false)
	end

	for iter_34_2, iter_34_3 in pairs(arg_34_0.customLineList_) do
		iter_34_3:Show(false)
	end

	local var_34_0 = 1
	local var_34_1 = 1
	local var_34_2 = 1
	local var_34_3 = arg_34_0.oepnStageList_

	for iter_34_4, iter_34_5 in ipairs(var_34_3) do
		local var_34_4 = table.keyof(arg_34_0.stageList_, iter_34_5)
		local var_34_5 = arg_34_0.missionItem_[var_34_4]:GetLocalPosition() + Vector3(0, 0, 0)
		local var_34_6 = arg_34_0:GetCfgName()[iter_34_5].pre_show_id_list or {}
		local var_34_7 = #var_34_6 > 1

		for iter_34_6, iter_34_7 in ipairs(var_34_6) do
			if arg_34_0.stageData_[iter_34_7] and arg_34_0.stageData_[iter_34_7].clear_times > 0 then
				-- block empty
			else
				var_34_7 = false

				break
			end
		end

		for iter_34_8, iter_34_9 in ipairs(var_34_6) do
			local var_34_8 = arg_34_0:GetCfgName()[iter_34_5]

			if type(var_34_8.custom_line) == "table" and #var_34_8.custom_line[iter_34_8] > 0 and (arg_34_0.stageData_[iter_34_5] and arg_34_0.stageData_[iter_34_5].clear_times > 0 or var_34_7) then
				arg_34_0:DrawLine(var_34_0, var_34_8.custom_line[iter_34_8])

				var_34_0 = var_34_0 + 1
			elseif type(var_34_8.custom_lock_line) == "table" and #var_34_8.custom_lock_line[iter_34_8] > 0 then
				arg_34_0:DrawLine(var_34_0, var_34_8.custom_lock_line[iter_34_8])

				var_34_0 = var_34_0 + 1
			elseif table.keyof(var_34_3, iter_34_9) then
				local var_34_9 = table.keyof(arg_34_0.stageList_, iter_34_9)
				local var_34_10 = arg_34_0.missionItem_[var_34_9]:GetLocalPosition() + Vector3(0, 0, 0)

				arg_34_0.lineList_[var_34_0] = arg_34_0.lineList_[var_34_0] or arg_34_0:GetLineClass(arg_34_0.lineType_).New(arg_34_0:GetLineGo(arg_34_0.lineType_), arg_34_0.content_, arg_34_0:GetPointGo(arg_34_0.lineType_))

				arg_34_0.lineList_[var_34_0]:Show(true)
				arg_34_0.lineList_[var_34_0]:RefreshUI(var_34_10, var_34_5)

				var_34_0 = var_34_0 + 1
			end
		end
	end
end

function var_0_0.DrawLine(arg_35_0, arg_35_1, arg_35_2)
	arg_35_0.customLineList_[arg_35_1] = arg_35_0.customLineList_[arg_35_1] or SectionCustomLineItem.New(arg_35_0:GetLineGo(2), arg_35_0.content_, arg_35_0:GetPointGo(arg_35_0.lineType_))

	arg_35_0.customLineList_[arg_35_1]:Show(true)
	arg_35_0.customLineList_[arg_35_1]:RefreshUI(arg_35_2)
end

function var_0_0.GetLineClass(arg_36_0, arg_36_1)
	if arg_36_1 == 0 then
		return SectionLineItem
	else
		return SectionBranchLineItem
	end
end

function var_0_0.GetLineGo(arg_37_0, arg_37_1)
	if arg_37_1 == 2 then
		return arg_37_0.lineGo_
	elseif arg_37_1 == 3 then
		return arg_37_0.lineGo2_
	else
		return arg_37_0.lineGo_
	end
end

function var_0_0.GetPointGo(arg_38_0, arg_38_1)
	if arg_38_1 == 2 then
		return arg_38_0.pointGo_
	else
		return arg_38_0.pointGo_
	end
end

function var_0_0.DestroyLine(arg_39_0)
	for iter_39_0, iter_39_1 in pairs(arg_39_0.lineList_) do
		iter_39_1:Dispose()
	end

	arg_39_0.lineList_ = {}
end

return var_0_0
