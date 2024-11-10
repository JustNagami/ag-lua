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
	arg_4_0.lineArchiveList_ = {}
	arg_4_0.customLineList_ = {}
	arg_4_0.missionItem_ = {}
	arg_4_0.lineType_ = nil
	arg_4_0.archiveItemList_ = {}

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
	manager.ui:SetMainCamera("null")
	arg_5_0:RefreshData()
	arg_5_0:RefreshBGM()
	arg_5_0:ShowPanel()
	arg_5_0:RefreshText()
	arg_5_0:RefreshUI()
end

function var_0_0.OnTop(arg_7_0)
	arg_7_0.stopMove_ = false
end

function var_0_0.OnUpdate(arg_8_0)
	if arg_8_0:IsOpenSectionInfo() then
		arg_8_0.stopMove_ = false
	end

	arg_8_0:RefreshData()
	arg_8_0:RefreshUI()
end

function var_0_0.RefreshUI(arg_9_0)
	arg_9_0:RefreshMissionList()

	arg_9_0.selectSection_ = arg_9_0.params_.section or BattleFieldData:GetCacheStage(arg_9_0.chapterID_) or arg_9_0.stageList_[1]

	local var_9_0 = arg_9_0:GetScrollPos()
	local var_9_1 = arg_9_0:GetScrollWidth()

	if arg_9_0.stopMove_ then
		-- block empty
	else
		arg_9_0.scrollMoveView_:RefreshUI(var_9_0, var_9_1)
	end

	arg_9_0:RefreshSelectItem()
end

function var_0_0.RefreshBGM(arg_10_0)
	local var_10_0 = ChapterCfg[arg_10_0.chapterID_]

	if var_10_0.cue_sheet ~= "" then
		manager.audio:PlayBGM(var_10_0.cue_sheet, var_10_0.cue_name, var_10_0.awb)
	end
end

function var_0_0.GetScrollWidth(arg_11_0)
	local var_11_0 = 0
	local var_11_1 = arg_11_0.oepnStageList_

	for iter_11_0, iter_11_1 in ipairs(var_11_1) do
		local var_11_2 = arg_11_0:GetCfgName()[iter_11_1]

		if var_11_0 < var_11_2.position[1] then
			var_11_0 = var_11_2.position[1]
		end
	end

	return var_11_0
end

function var_0_0.GetScrollPos(arg_12_0)
	local var_12_0 = arg_12_0:GetCfgName()[arg_12_0.selectSection_]

	return var_12_0 and var_12_0.position[1] or 0
end

function var_0_0.OnExit(arg_13_0)
	manager.windowBar:HideBar()
	manager.ui:ResetMainCamera()

	for iter_13_0, iter_13_1 in ipairs(arg_13_0.archiveItemList_) do
		iter_13_1:OnExit()
	end

	arg_13_0.scrollMoveView_:OnExit()

	arg_13_0.lastChapterID_ = nil
	arg_13_0.stopMove_ = false
end

function var_0_0.Dispose(arg_14_0)
	arg_14_0:RemoveListeners()
	arg_14_0:RemoveAllListeners()

	arg_14_0.lineType_ = nil

	for iter_14_0, iter_14_1 in ipairs(arg_14_0.missionItem_) do
		iter_14_1:Dispose()
	end

	arg_14_0.missionItem_ = nil

	for iter_14_2, iter_14_3 in ipairs(arg_14_0.archiveItemList_) do
		iter_14_3:Dispose()
	end

	arg_14_0.archiveItemList_ = nil

	arg_14_0:DestroyLine()

	arg_14_0.lineList_ = nil

	arg_14_0:DestroyArchiveLine()

	arg_14_0.lineArchiveList_ = nil

	for iter_14_4, iter_14_5 in pairs(arg_14_0.customLineList_) do
		iter_14_5:Dispose()
	end

	arg_14_0.customLineList_ = nil

	if arg_14_0.scene_ then
		Object.Destroy(arg_14_0.scene_)

		arg_14_0.scene_ = nil
	end

	arg_14_0.selector_ = nil

	arg_14_0.scrollMoveView_:Dispose()

	arg_14_0.scrollMoveView_ = nil
	arg_14_0.bgBtn_ = nil
	arg_14_0.scrollView_ = nil
	arg_14_0.scrollViewGo_ = nil
	arg_14_0.content_ = nil
	arg_14_0.contentRect_ = nil
	arg_14_0.viewportRect_ = nil
	arg_14_0.scrollViewEvent_ = nil
	arg_14_0.selectDifficultGo_ = nil
	arg_14_0.collectBtnGo_ = nil
	arg_14_0.collectBtn_ = nil
	arg_14_0.collectCurText_ = nil
	arg_14_0.collectTotalText_ = nil
	arg_14_0.collectProgress_ = nil
	arg_14_0.sectionItem_ = nil
	arg_14_0.lineGo_ = nil

	var_0_0.super.Dispose(arg_14_0)
end

function var_0_0.InitUI(arg_15_0)
	arg_15_0:BindCfgUI()

	arg_15_0.scrollMoveView_ = ScrollMoveView.New(arg_15_0, arg_15_0.scrollViewGo_)

	arg_15_0:InitCustom()
end

function var_0_0.InitCustom(arg_16_0)
	return
end

function var_0_0.AddListeners(arg_17_0)
	arg_17_0:AddBtnListener(arg_17_0.bgBtn_, nil, function()
		if arg_17_0:IsOpenSectionInfo() then
			arg_17_0.isOpenInfoView_ = false

			var_0_2.Back()
		end
	end)
end

function var_0_0.RemoveListeners(arg_19_0)
	arg_19_0.bgBtn_.onClick:RemoveAllListeners()
end

function var_0_0.RefreshData(arg_20_0)
	if arg_20_0.params_.chapterID == nil then
		local var_20_0 = arg_20_0.params_.chapterClientID

		arg_20_0.chapterID_ = BattleFieldData:GetCacheChapter(var_20_0)
	else
		arg_20_0.chapterID_ = arg_20_0.params_.chapterID
	end

	arg_20_0.stageData_ = BattleStageData:GetStageData()
	arg_20_0.stageList_ = ChapterCfg[arg_20_0.chapterID_].section_id_list

	local var_20_1 = arg_20_0.params_.section or BattleFieldData:GetCacheStage(arg_20_0.chapterID_) or ChapterCfg[arg_20_0.chapterID_].section_id_list[1]
	local var_20_2 = getChapterClientCfgByChapterID(arg_20_0.chapterID_)

	BattleFieldData:SetStageByClientID(var_20_2.id, var_20_1)
	BattleFieldAction.ChangeSelectChapterID(arg_20_0.chapterID_)
	arg_20_0:RefreshCustomData()

	arg_20_0.oepnStageList_ = ChapterTools.GetOpenStageList(arg_20_0.chapterID_, arg_20_0:GetCfgName())
end

function var_0_0.RefreshCustomData(arg_21_0)
	return
end

function var_0_0.IsOpenSectionInfo(arg_22_0)
	return arg_22_0:IsOpenRoute("challengeSectionInfo")
end

function var_0_0.GetCfgName(arg_23_0)
	return
end

function var_0_0.ShowPanel(arg_24_0)
	SetActive(arg_24_0.collectBtnGo_, false)
	SetActive(arg_24_0.selectDifficultGo_, false)
end

function var_0_0.RefreshText(arg_25_0)
	return
end

function var_0_0.SwitchBG(arg_26_0)
	local var_26_0 = ChapterCfg[arg_26_0.chapterID_]

	if var_26_0.bg ~= "" then
		arg_26_0.bgImage_.sprite = getSpriteWithoutAtlas(var_26_0.bg)
	end

	SetActive(arg_26_0.bgImage_.gameObject, var_26_0.bg ~= "")
end

function var_0_0.RefreshSelectItem(arg_27_0)
	for iter_27_0, iter_27_1 in pairs(arg_27_0.missionItem_) do
		iter_27_1:SelectorItem(arg_27_0.selectSection_)
	end
end

function var_0_0.RefreshMissionList(arg_28_0)
	if arg_28_0.lastChapterID_ == arg_28_0.chapterID_ then
		return
	end

	arg_28_0.lastChapterID_ = arg_28_0.chapterID_

	for iter_28_0 = 1, #arg_28_0.missionItem_ do
		arg_28_0.missionItem_[iter_28_0]:Show(false)
	end

	for iter_28_1 = 1, #arg_28_0.stageList_ do
		if arg_28_0.missionItem_[iter_28_1] then
			arg_28_0.missionItem_[iter_28_1]:SetData(arg_28_0.chapterID_, arg_28_0.stageList_[iter_28_1])
		else
			arg_28_0.missionItem_[iter_28_1] = arg_28_0:GetSectionItemClass().New(arg_28_0.sectionItem_, arg_28_0.content_, arg_28_0.stageList_[iter_28_1], arg_28_0.chapterID_)
		end
	end

	arg_28_0:CreateLineItemList()
end

function var_0_0.CreateLineItemList(arg_29_0)
	if arg_29_0.lineType_ ~= ChapterCfg[arg_29_0.chapterID_].line_type then
		arg_29_0:DestroyLine()

		arg_29_0.lineType_ = ChapterCfg[arg_29_0.chapterID_].line_type
	end

	local var_29_0 = 1

	for iter_29_0 = 1, #arg_29_0.archiveItemList_ do
		arg_29_0.archiveItemList_[iter_29_0]:Show(false)
	end

	for iter_29_1, iter_29_2 in pairs(arg_29_0.lineList_) do
		iter_29_2:Show(false)
	end

	for iter_29_3, iter_29_4 in pairs(arg_29_0.lineArchiveList_) do
		iter_29_4:Show(false)
	end

	for iter_29_5, iter_29_6 in pairs(arg_29_0.customLineList_) do
		iter_29_6:Show(false)
	end

	local var_29_1 = 1
	local var_29_2 = 1
	local var_29_3 = 1
	local var_29_4 = arg_29_0.oepnStageList_

	for iter_29_7, iter_29_8 in ipairs(var_29_4) do
		local var_29_5 = table.keyof(arg_29_0.stageList_, iter_29_8)
		local var_29_6 = arg_29_0.missionItem_[var_29_5]:GetLocalPosition() + Vector3(0, 0, 0)
		local var_29_7 = arg_29_0:GetCfgName()[iter_29_8].pre_show_id_list or {}
		local var_29_8 = #var_29_7 > 1

		for iter_29_9, iter_29_10 in ipairs(var_29_7) do
			if arg_29_0.stageData_[iter_29_10] and arg_29_0.stageData_[iter_29_10].clear_times > 0 then
				-- block empty
			else
				var_29_8 = false

				break
			end
		end

		for iter_29_11, iter_29_12 in ipairs(var_29_7) do
			local var_29_9 = arg_29_0:GetCfgName()[iter_29_8]

			if type(var_29_9.custom_line) == "table" and #var_29_9.custom_line[iter_29_11] > 0 and (arg_29_0.stageData_[iter_29_8] and arg_29_0.stageData_[iter_29_8].clear_times > 0 or var_29_8) then
				arg_29_0:DrawLine(var_29_1, var_29_9.custom_line[iter_29_11])

				var_29_1 = var_29_1 + 1
			elseif type(var_29_9.custom_lock_line) == "table" and #var_29_9.custom_lock_line[iter_29_11] > 0 then
				arg_29_0:DrawLine(var_29_1, var_29_9.custom_lock_line[iter_29_11])

				var_29_1 = var_29_1 + 1
			elseif table.keyof(var_29_4, iter_29_12) then
				local var_29_10 = table.keyof(arg_29_0.stageList_, iter_29_12)
				local var_29_11 = arg_29_0.missionItem_[var_29_10]:GetLocalPosition() + Vector3(0, 0, 0)

				arg_29_0.lineList_[var_29_1] = arg_29_0.lineList_[var_29_1] or arg_29_0:GetLineClass(arg_29_0.lineType_).New(arg_29_0:GetLineGo(arg_29_0.lineType_), arg_29_0.content_, arg_29_0:GetPointGo(arg_29_0.lineType_))

				arg_29_0.lineList_[var_29_1]:Show(true)
				arg_29_0.lineList_[var_29_1]:RefreshUI(var_29_11, var_29_6)

				var_29_1 = var_29_1 + 1
			end
		end

		local var_29_12 = BattleStageTools.GetStageCfg(ChapterCfg[arg_29_0.chapterID_].type, iter_29_8)
		local var_29_13 = StageTools.GetStageArchiveID(iter_29_8)

		if var_29_13 and var_29_13 ~= 0 then
			arg_29_0.archiveItemList_[var_29_0] = arg_29_0.archiveItemList_[var_29_0] or ChapterStageArchiveItem.New(arg_29_0.stageExtraInfoGo_, arg_29_0.content_)

			arg_29_0.archiveItemList_[var_29_0]:SetData(arg_29_0.chapterID_, iter_29_8, var_29_13)

			local var_29_14 = Vector3(var_29_12.position[1], var_29_12.position[2], 0) + Vector3(0, 0, 0)
			local var_29_15 = StageArchiveCfg[var_29_13].position
			local var_29_16 = Vector3(var_29_15[1], var_29_15[2], 0)

			arg_29_0.lineArchiveList_[var_29_3] = arg_29_0.lineArchiveList_[var_29_3] or SectionLineItem.New(arg_29_0:GetLineGo(2), arg_29_0.content_, arg_29_0:GetPointGo(0))

			arg_29_0.lineArchiveList_[var_29_3]:Show(true)
			arg_29_0.lineArchiveList_[var_29_3]:RefreshUI(var_29_14, var_29_16)

			var_29_3 = var_29_3 + 1
			var_29_0 = var_29_0 + 1
		end
	end
end

function var_0_0.DrawLine(arg_30_0, arg_30_1, arg_30_2)
	arg_30_0.customLineList_[arg_30_1] = arg_30_0.customLineList_[arg_30_1] or SectionCustomLineItem.New(arg_30_0:GetLineGo(2), arg_30_0.content_, arg_30_0:GetPointGo(arg_30_0.lineType_))

	arg_30_0.customLineList_[arg_30_1]:Show(true)
	arg_30_0.customLineList_[arg_30_1]:RefreshUI(arg_30_2)
end

function var_0_0.GetLineClass(arg_31_0, arg_31_1)
	if arg_31_1 == 0 then
		return SectionLineItem
	else
		return SectionBranchLineItem
	end
end

function var_0_0.GetLineGo(arg_32_0, arg_32_1)
	if arg_32_1 == 2 then
		return arg_32_0.lineGo_
	elseif arg_32_1 == 3 then
		return arg_32_0.lineGo2_
	else
		return arg_32_0.lineGo_
	end
end

function var_0_0.GetPointGo(arg_33_0, arg_33_1)
	if arg_33_1 == 2 then
		return arg_33_0.pointGo_
	else
		return arg_33_0.pointGo_
	end
end

function var_0_0.DestroyLine(arg_34_0)
	for iter_34_0, iter_34_1 in pairs(arg_34_0.lineList_) do
		iter_34_1:Dispose()
	end

	arg_34_0.lineList_ = {}
end

function var_0_0.DestroyArchiveLine(arg_35_0)
	for iter_35_0, iter_35_1 in pairs(arg_35_0.lineArchiveList_) do
		iter_35_1:Dispose()
	end

	arg_35_0.lineArchiveList_ = {}
end

return var_0_0
