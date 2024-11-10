local var_0_0 = class("ChpaterPartBtnItem", ReduxView)

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_1.transform
	arg_1_0.index_ = arg_1_2

	arg_1_0:BindCfgUI()
	arg_1_0:AddListeners()

	arg_1_0.choiceController_ = ControllerUtil.GetController(arg_1_0.transform_, "choice")
	arg_1_0.lockController_ = ControllerUtil.GetController(arg_1_0.transform_, "lock")
end

function var_0_0.OnEnter(arg_2_0)
	return
end

function var_0_0.OnExit(arg_3_0)
	arg_3_0:UnBindRedPoint(arg_3_0.chapterID_)

	arg_3_0.chapterID_ = nil

	arg_3_0:StopTimer()
end

function var_0_0.Dispose(arg_4_0)
	var_0_0.super.Dispose(arg_4_0)
end

function var_0_0.AddListeners(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.button_, nil, function()
		if arg_5_0.selectChapterID_ == arg_5_0.chapterID_ then
			return
		end

		if arg_5_0.toggleType_ == BattleConst.TOGGLE.PLOT then
			ChapterTools.GotoChapterSection(arg_5_0.chapterID_)
		else
			JumpTools.Jump2SubPlotByChapterID(arg_5_0.chapterID_)
		end
	end)
end

function var_0_0.SetChapterID(arg_7_0, arg_7_1, arg_7_2)
	arg_7_0.selectChapterID_ = arg_7_2

	arg_7_0:UnBindRedPoint(arg_7_0.chapterID_)
	arg_7_0:BindRedPoint(arg_7_1)

	arg_7_0.chapterID_ = arg_7_1

	local var_7_0 = getChapterClientCfgByChapterID(arg_7_0.chapterID_)

	arg_7_0.toggleType_ = var_7_0.toggle

	local var_7_1 = arg_7_1 == arg_7_2

	arg_7_0.choiceController_:SetSelectedState(tostring(var_7_1))

	if var_7_0.id ~= ChapterConst.CHAPTER_CLIENT_XUHENG_PART_2_2 then
		arg_7_0.nameText_.text = ChapterCfg[arg_7_1].subhead
	end

	arg_7_0:AddTimer()
end

function var_0_0.BindRedPoint(arg_8_0, arg_8_1)
	if arg_8_0.toggleType_ == nil then
		arg_8_0.toggleType_ = getChapterClientCfgByChapterID(arg_8_1).toggle
	end

	if arg_8_0.toggleType_ == BattleConst.TOGGLE.PLOT then
		manager.redPoint:bindUIandKey(arg_8_0.transform_, string.format("%s_%s", RedPointConst.COMBAT_PLOT_CHAPTER, arg_8_1))
	else
		manager.redPoint:bindUIandKey(arg_8_0.transform_, string.format("%s_%s", RedPointConst.COMBAT_SUB_PLOT_CHAPTER, arg_8_1))
	end
end

function var_0_0.UnBindRedPoint(arg_9_0, arg_9_1)
	if arg_9_1 then
		if arg_9_0.toggleType_ == BattleConst.TOGGLE.PLOT then
			manager.redPoint:unbindUIandKey(arg_9_0.transform_, string.format("%s_%s", RedPointConst.COMBAT_PLOT_CHAPTER, arg_9_1))
		else
			manager.redPoint:unbindUIandKey(arg_9_0.transform_, string.format("%s_%s", RedPointConst.COMBAT_SUB_PLOT_CHAPTER, arg_9_1))
		end
	end
end

function var_0_0.AddTimer(arg_10_0)
	arg_10_0:StopTimer()

	local var_10_0 = getChapterClientCfgByChapterID(arg_10_0.chapterID_)
	local var_10_1 = table.keyof(var_10_0.chapter_list, arg_10_0.chapterID_)

	if var_10_1 > 1 then
		local var_10_2 = var_10_0.chapter_list[var_10_1 - 1]

		if not ChapterTools.IsClearChapter(var_10_2) then
			arg_10_0.lockController_:SetSelectedState("lock")

			return
		end
	end

	local var_10_3

	if arg_10_0.toggleType_ == BattleConst.TOGGLE.PLOT then
		var_10_3 = ChapterCfg[arg_10_0.chapterID_].unlock_activity_id
	else
		var_10_3 = ChapterCfg[arg_10_0.chapterID_].activity_id
	end

	local var_10_4

	if arg_10_0.toggleType_ == BattleConst.TOGGLE.PLOT then
		var_10_4 = ActivityData:GetActivityData(var_10_3).startTime
	else
		var_10_4 = ActivityData:GetActivityRefreshTime(var_10_3)
	end

	if var_10_4 <= manager.time:GetServerTime() then
		arg_10_0.lockController_:SetSelectedState("unlock")

		return
	end

	arg_10_0.lockController_:SetSelectedState("lock")

	arg_10_0.timer_ = Timer.New(function()
		if var_10_4 <= manager.time:GetServerTime() then
			arg_10_0.lockController_:SetSelectedState("unlock")
			arg_10_0:StopTimer()

			return
		end
	end, 1, -1)

	arg_10_0.timer_:Start()
end

function var_0_0.StopTimer(arg_12_0)
	if arg_12_0.timer_ then
		arg_12_0.timer_:Stop()

		arg_12_0.timer_ = nil
	end
end

return var_0_0
