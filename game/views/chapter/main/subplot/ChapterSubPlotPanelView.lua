local var_0_0 = class("ChapterSubPlotPanelView", ReduxView)

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_1.transform

	arg_1_0:BindCfgUI()
	arg_1_0:AddListeners()

	arg_1_0.controller_ = ControllerUtil.GetController(arg_1_0.transform_, "lock")
end

function var_0_0.OnEnter(arg_2_0)
	arg_2_0.isLock_ = JumpTools.IsSystemLocked(ViewConst.SYSTEM_ID.BATTLE_SUB_PLOT)

	manager.redPoint:bindUIandKey(arg_2_0.transform_, RedPointConst.COMBAT_SUB_PLOT)
	arg_2_0:RefreshUI()
end

function var_0_0.OnExit(arg_3_0)
	manager.redPoint:unbindUIandKey(arg_3_0.transform_, RedPointConst.COMBAT_SUB_PLOT)
end

function var_0_0.Dispose(arg_4_0)
	var_0_0.super.Dispose(arg_4_0)
end

function var_0_0.AddListeners(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.button_, nil, function()
		JumpTools.GoToSystem("/chapterSubPlotContent", {}, ViewConst.SYSTEM_ID.BATTLE_SUB_PLOT)
	end)
end

function var_0_0.RefreshUI(arg_7_0)
	local var_7_0 = ChapterTools.GetOpenSubPlotClient()
	local var_7_1 = ChapterClientCfg[var_7_0]
	local var_7_2 = SpritePathCfg.ChapterPaint.path .. var_7_1.chapter_paint_2

	getSpriteWithoutAtlasAsync(var_7_2, function(arg_8_0)
		if arg_7_0.chapterImage_ then
			arg_7_0.chapterImage_.sprite = arg_8_0
		end
	end)

	arg_7_0.chapterNameText_.text = var_7_1.name
	arg_7_0.chapterDescText_.text = var_7_1.desc

	arg_7_0:RefreshLockState()

	local var_7_3 = JumpTools.IsSystemLocked(ViewConst.SYSTEM_ID.BATTLE_SUB_PLOT)

	if var_7_3 then
		arg_7_0.lockText_.text = JumpTools.GetSystemLockedTip(ViewConst.SYSTEM_ID.BATTLE_SUB_PLOT, var_7_3)
	end
end

function var_0_0.RefreshLockState(arg_9_0)
	if arg_9_0.isLock_ then
		arg_9_0.controller_:SetSelectedState("true")
	else
		arg_9_0.controller_:SetSelectedState("false")
	end
end

return var_0_0
