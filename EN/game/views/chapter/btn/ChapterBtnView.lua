local var_0_0 = class("ChapterBtnView", ReduxView)

function var_0_0.OnCtor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_1.transform
	arg_1_0.toggle_ = arg_1_2

	arg_1_0:BindCfgUI()
	arg_1_0:AddListeners()

	arg_1_0.switchController_ = ControllerUtil.GetController(arg_1_0.transform_, "tab")
end

function var_0_0.OnEnter(arg_2_0)
	arg_2_0:RefreshRedPoint()

	arg_2_0.isLock_ = false

	if arg_2_0.toggle_ == BattleConst.TOGGLE.RESOURCE then
		arg_2_0.isLock_ = JumpTools.IsSystemLocked(ViewConst.SYSTEM_ID.BATTLE_DAILY)
	elseif arg_2_0.toggle_ == BattleConst.TOGGLE.EQUIP then
		arg_2_0.isLock_ = JumpTools.IsSystemLocked(ViewConst.SYSTEM_ID.BATTLE_EQUIP)
	elseif arg_2_0.toggle_ == BattleConst.TOGGLE.CHALLENGE then
		arg_2_0.isLock_ = JumpTools.IsSystemLocked(ViewConst.SYSTEM_ID.BATTLE_ASTROLABE)
	end

	arg_2_0:RefreshLock()
end

function var_0_0.OnExit(arg_3_0)
	manager.redPoint:unbindUIandKey(arg_3_0.transform_)
end

function var_0_0.Dispose(arg_4_0)
	var_0_0.super.Dispose(arg_4_0)
end

function var_0_0.AddListeners(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.button_, nil, function()
		if arg_5_0.active_ then
			return
		end

		local var_6_0 = arg_5_0.toggle_
		local var_6_1 = ViewConst.SYSTEM_ID.BATTLE

		if var_6_0 == BattleConst.TOGGLE.MAIN then
			var_6_1 = ViewConst.SYSTEM_ID.BATTLE
		elseif var_6_0 == BattleConst.TOGGLE.RESOURCE then
			var_6_1 = ViewConst.SYSTEM_ID.BATTLE_DAILY
		elseif var_6_0 == BattleConst.TOGGLE.CHALLENGE then
			var_6_1 = ViewConst.SYSTEM_ID.BATTLE_ASTROLABE
		elseif var_6_0 == BattleConst.TOGGLE.EQUIP then
			var_6_1 = ViewConst.SYSTEM_ID.BATTLE_EQUIP
		end

		JumpTools.GoToSystem("/chapterMap", {
			chapterToggle = arg_5_0.toggle_
		}, var_6_1)
		OperationRecorder.Record(arg_5_0.class.__cname, tostring(arg_5_0.toggle_))
	end)
end

function var_0_0.SelectChapterToggle(arg_7_0, arg_7_1)
	arg_7_0.active_ = arg_7_1

	if arg_7_1 then
		arg_7_0.switchController_:SetSelectedState("select")
	else
		arg_7_0:RefreshLock()
	end
end

function var_0_0.RefreshRedPoint(arg_8_0)
	local var_8_0 = arg_8_0.toggle_

	if var_8_0 == BattleConst.TOGGLE.MAIN then
		manager.redPoint:bindUIandKey(arg_8_0.transform_, RedPointConst.COMBAT_MAIN)
	elseif var_8_0 == BattleConst.TOGGLE.CHALLENGE then
		manager.redPoint:bindUIandKey(arg_8_0.transform_, RedPointConst.COMBAT_CHALLENGE)
	elseif var_8_0 == BattleConst.TOGGLE.EQUIP then
		manager.redPoint:bindUIandKey(arg_8_0.transform_, RedPointConst.COMBAT_EQUIP)
	elseif var_8_0 == BattleConst.TOGGLE.RESOURCE then
		manager.redPoint:bindUIandKey(arg_8_0.transform_, RedPointConst.RESOURSE_STAGE)
	end
end

function var_0_0.RefreshLock(arg_9_0)
	if arg_9_0.isLock_ then
		arg_9_0.switchController_:SetSelectedState("lock")
	else
		arg_9_0.switchController_:SetSelectedState("notSelect")
	end
end

return var_0_0
