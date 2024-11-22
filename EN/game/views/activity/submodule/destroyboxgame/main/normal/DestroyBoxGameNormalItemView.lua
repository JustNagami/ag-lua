local var_0_0 = class("DestroyBoxGameNormalItemView", ReduxView)

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.gameObject_ = Object.Instantiate(arg_1_1, arg_1_2.transform)
	arg_1_0.transform_ = arg_1_0.gameObject_.transform

	arg_1_0:BindCfgUI()
	arg_1_0:AddListeners()

	arg_1_0.boxStateController_ = ControllerUtil.GetController(arg_1_0.transform_, "boxState")
	arg_1_0.boxSelectController_ = ControllerUtil.GetController(arg_1_0.transform_, "select")

	arg_1_0:Show(true)
end

function var_0_0.OnEnter(arg_2_0, arg_2_1)
	arg_2_0.id_ = arg_2_1

	local var_2_0 = DestroyBoxGameCfg[arg_2_0.id_]

	arg_2_0.activityID_ = var_2_0.activity_id

	local var_2_1 = DestroyBoxGameData:GetDifficultList(var_2_0.main_activity_id)[var_2_0.difficult]
	local var_2_2 = table.keyof(var_2_1, arg_2_0.id_)

	arg_2_0.numText_.text = string.format("%02d", var_2_2)
	arg_2_0.index_ = var_2_2
	arg_2_0.isClearStage_ = DestroyBoxGameData:IsClearStage(arg_2_1)
	arg_2_0.isFinishPreStage_ = DestroyBoxGameData:IsFinishPreStage(arg_2_1)

	arg_2_0:AddTimer()
	arg_2_0:AddRedPoint()
end

function var_0_0.OnExit(arg_3_0)
	arg_3_0:StopTimer()
	arg_3_0:RemoveRedPoint()
end

function var_0_0.AddRedPoint(arg_4_0)
	local var_4_0 = DestroyBoxGameCfg[arg_4_0.id_]

	manager.redPoint:bindUIandKey(arg_4_0.transform_, string.format("%s_%s_%s", RedPointConst.DESTROY_BOX_GAME_STAGE_OPEN, var_4_0.difficult, arg_4_0.activityID_))
end

function var_0_0.RemoveRedPoint(arg_5_0)
	local var_5_0 = DestroyBoxGameCfg[arg_5_0.id_]

	manager.redPoint:unbindUIandKey(arg_5_0.transform_, string.format("%s_%s_%s", RedPointConst.DESTROY_BOX_GAME_STAGE_OPEN, var_5_0.difficult, arg_5_0.activityID_))
end

function var_0_0.Dispose(arg_6_0)
	var_0_0.super.Dispose(arg_6_0)
	Object.Destroy(arg_6_0.gameObject_)

	arg_6_0.transform_ = nil
	arg_6_0.gameObject_ = nil
end

function var_0_0.AddListeners(arg_7_0)
	arg_7_0:AddBtnListener(arg_7_0.button_, nil, function()
		local var_8_0 = DestroyBoxGameCfg[arg_7_0.id_]
		local var_8_1 = var_8_0.activity_id
		local var_8_2 = var_8_0.main_activity_id

		if arg_7_0.isTimeLock_ then
			local var_8_3 = ActivityData:GetActivityData(var_8_1)
			local var_8_4 = manager.time:GetServerTime()

			if var_8_4 < var_8_3.startTime then
				local var_8_5 = GetTips("OPEN_TIME")

				ShowTips(string.format(var_8_5, manager.time:GetLostTimeStr2(var_8_3.startTime, nil, true)))
			elseif var_8_4 >= var_8_3.stopTime then
				ShowTips("TIME_OVER")
			end

			return
		elseif not arg_7_0.isFinishPreStage_ then
			local var_8_6 = DestroyBoxGameCfg[arg_7_0.id_].unlock_condition
			local var_8_7 = DestroyBoxGameCfg[var_8_6[1]]
			local var_8_8 = var_8_7.difficult

			if var_8_8 == 1 then
				var_8_8 = GetTips("HARDLEVEL_EASY")
			elseif var_8_8 == 2 then
				var_8_8 = GetTips("HARDLEVEL_HARD")
			end

			if var_8_6[2] > 1 then
				ShowTips(string.format(GetTips("DESTROY_BOX_GAME_UNLOCK_STAGE_1"), ActivityCfg[var_8_7.activity_id].remark, var_8_8, var_8_6[2]))
			else
				ShowTips(string.format(GetTips("DESTROY_BOX_GAME_UNLOCK_STAGE"), ActivityCfg[var_8_7.activity_id].remark, var_8_8))
			end

			return
		end

		DestroyBoxGameAction.ClickBoxStageItem(arg_7_0.activityID_, arg_7_0.id_)

		if DestroyBoxGameData:GetSelectID(var_8_2) ~= arg_7_0.id_ then
			DestroyBoxGameData:SetSelectIDAndDifficult(var_8_2, arg_7_0.id_)
			manager.notify:Invoke(DESTROY_BOX_GAME_SELECT_STAGE, arg_7_0.id_)
		end
	end)
end

function var_0_0.Show(arg_9_0, arg_9_1)
	SetActive(arg_9_0.gameObject_, arg_9_1)
end

function var_0_0.SwitchDifficult(arg_10_0)
	local var_10_0 = DestroyBoxGameCfg[arg_10_0.id_]
	local var_10_1 = var_10_0.main_activity_id
	local var_10_2 = DestroyBoxGameData:GetSelectDifficult(var_10_1)

	arg_10_0:RemoveRedPoint()

	arg_10_0.id_ = DestroyBoxGameCfg.get_id_list_by_activity_id[var_10_0.activity_id][var_10_2]

	arg_10_0:AddRedPoint()

	arg_10_0.isClearStage_ = DestroyBoxGameData:IsClearStage(arg_10_0.id_)
	arg_10_0.isFinishPreStage_ = DestroyBoxGameData:IsFinishPreStage(arg_10_0.id_)

	arg_10_0:AddTimer()
end

function var_0_0.RefreshBoxState(arg_11_0)
	local var_11_0 = DestroyBoxGameCfg[arg_11_0.id_]

	if arg_11_0.isClearStage_ then
		arg_11_0.boxStateController_:SetSelectedState("clear")
	elseif not arg_11_0.isFinishPreStage_ or arg_11_0.isTimeLock_ then
		arg_11_0.boxStateController_:SetSelectedState("lock")
	else
		arg_11_0.boxStateController_:SetSelectedState("unlock")
	end
end

function var_0_0.SwitchSelectItem(arg_12_0, arg_12_1)
	if arg_12_0.id_ == arg_12_1 then
		arg_12_0.boxSelectController_:SetSelectedState("true")
	else
		arg_12_0.boxSelectController_:SetSelectedState("false")
	end
end

function var_0_0.AddTimer(arg_13_0)
	arg_13_0:StopTimer()

	local var_13_0 = DestroyBoxGameCfg[arg_13_0.id_]

	arg_13_0.isTimeLock_ = ActivityTools.GetActivityStatus(var_13_0.activity_id) ~= 1

	arg_13_0:RefreshBoxState()

	if arg_13_0.isFinishPreStage_ then
		arg_13_0.timer_ = Timer.New(function()
			local var_14_0 = ActivityTools.GetActivityStatus(var_13_0.activity_id) ~= 1

			if var_14_0 ~= arg_13_0.isTimeLock_ then
				arg_13_0.isTimeLock_ = var_14_0

				arg_13_0:RefreshBoxState()
			end
		end, 1, -1)

		arg_13_0.timer_:Start()
	end
end

function var_0_0.StopTimer(arg_15_0)
	if arg_15_0.timer_ then
		arg_15_0.timer_:Stop()

		arg_15_0.timer_ = nil
	end
end

return var_0_0
