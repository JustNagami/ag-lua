local var_0_0 = class("SubPlotSectionView", import("..SectionBaseView"))

function var_0_0.Init(arg_1_0)
	var_0_0.super.Init(arg_1_0)

	arg_1_0.switchChapterView_ = SubPlotSwitchChapterView.New(arg_1_0.chooseGo_, arg_1_0.extraStoryBtn_)
	arg_1_0.changeChapterHandler_ = handler(arg_1_0, arg_1_0.ChangeChapter)
	arg_1_0.extraStoryView_ = SubPlotExtraStoryBtn.New(arg_1_0.extraStoryGo_)
	arg_1_0.stopMoveHandler_ = handler(arg_1_0, arg_1_0.StopMove)
end

function var_0_0.OnEnter(arg_2_0)
	var_0_0.super.OnEnter(arg_2_0)
	arg_2_0.switchChapterView_:OnEnter()
	manager.notify:RegistListener(CHANGE_CHAPTER, arg_2_0.changeChapterHandler_)
	arg_2_0.extraStoryView_:OnEnter()
	manager.notify:RegistListener(CHAPTER_SCROLL_STOP, arg_2_0.stopMoveHandler_)
end

function var_0_0.OnExit(arg_3_0)
	manager.notify:RemoveListener(CHAPTER_SCROLL_STOP, arg_3_0.stopMoveHandler_)
	var_0_0.super.OnExit(arg_3_0)
	arg_3_0.switchChapterView_:OnExit()
	manager.notify:RemoveListener(CHANGE_CHAPTER, arg_3_0.changeChapterHandler_)
	arg_3_0.extraStoryView_:OnExit()
end

function var_0_0.ChangeChapter(arg_4_0, arg_4_1)
	local var_4_0 = getChapterClientCfgByChapterID(arg_4_1)
	local var_4_1 = BattleFieldData:GetCacheStage(arg_4_1) or ChapterCfg[arg_4_1].section_id_list[1]

	if arg_4_0.params_.section == var_4_1 then
		return
	end

	arg_4_0.params_.chapterID = arg_4_1
	arg_4_0.params_.section = var_4_1

	BattleFieldData:SetStageByClientID(var_4_0.id, var_4_1)
	BattleFieldData:SetCacheChapterClient(getChapterToggle(var_4_0.id), var_4_0.id)
	JumpTools.Jump2SubPlot(var_4_0.id, true)
end

function var_0_0.RefreshData(arg_5_0)
	var_0_0.super.RefreshData(arg_5_0)
	arg_5_0.switchChapterView_:SetData(arg_5_0.chapterID_)
	arg_5_0.extraStoryView_:SetData(arg_5_0.chapterID_)
end

function var_0_0.RefreshUI(arg_6_0)
	var_0_0.super.RefreshUI(arg_6_0)
	arg_6_0:SwitchBG()
	arg_6_0.switchChapterView_:RefreshUI()
end

function var_0_0.StopMove(arg_7_0)
	arg_7_0.stopMove_ = true
end

function var_0_0.GetSectionItemClass(arg_8_0)
	return SubPlotSectionItem
end

function var_0_0.IsOpenSectionInfo(arg_9_0)
	return arg_9_0:IsOpenRoute("subPlotSectionInfo")
end

function var_0_0.GetCfgName(arg_10_0)
	return BattleActivityStoryStageCfg
end

function var_0_0.Dispose(arg_11_0)
	arg_11_0.stopMoveHandler_ = nil
	arg_11_0.changeChapterHandler_ = nil

	arg_11_0.switchChapterView_:Dispose()

	arg_11_0.switchChapterView_ = nil

	arg_11_0.extraStoryView_:Dispose()

	arg_11_0.extraStoryView_ = nil

	var_0_0.super.Dispose(arg_11_0)
end

return var_0_0
