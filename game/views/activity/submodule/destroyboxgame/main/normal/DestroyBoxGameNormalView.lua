local var_0_0 = class("DestroyBoxGameNormalView", ReduxView)

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_1.transform

	arg_1_0:BindCfgUI()
	arg_1_0:AddListeners()

	arg_1_0.difficultController_ = ControllerUtil.GetController(arg_1_0.transform_, "difficult")
	arg_1_0.lockController_ = ControllerUtil.GetController(arg_1_0.transform_, "lock")
	arg_1_0.boxItemList_ = {}
	arg_1_0.selectDifficult_ = 1
end

function var_0_0.OnEnter(arg_2_0, arg_2_1)
	arg_2_0.mainActivityID_ = arg_2_1
	arg_2_0.selectID_ = DestroyBoxGameData:GetSelectID(arg_2_1)
	arg_2_0.selectDifficult_ = DestroyBoxGameData:GetSelectDifficult(arg_2_1)

	local var_2_0 = DestroyBoxGameData:GetDifficultList(arg_2_1)

	for iter_2_0, iter_2_1 in ipairs(var_2_0[arg_2_0.selectDifficult_]) do
		arg_2_0.boxItemList_[iter_2_0] = arg_2_0.boxItemList_[iter_2_0] or DestroyBoxGameNormalItemView.New(arg_2_0.itemGo_, arg_2_0.itemParent_)

		arg_2_0.boxItemList_[iter_2_0]:OnEnter(iter_2_1)
	end

	arg_2_0:RefreshDifficult()
	arg_2_0:AddRedPoint()
end

function var_0_0.OnExit(arg_3_0)
	for iter_3_0, iter_3_1 in ipairs(arg_3_0.boxItemList_) do
		iter_3_1:OnExit()
	end

	arg_3_0:RemoveRedPoint()
end

function var_0_0.Dispose(arg_4_0)
	var_0_0.super.Dispose(arg_4_0)

	for iter_4_0, iter_4_1 in ipairs(arg_4_0.boxItemList_) do
		iter_4_1:Dispose()
	end

	arg_4_0.boxItemList_ = nil
	arg_4_0.transform_ = nil
	arg_4_0.gameObject_ = nil
end

function var_0_0.AddListeners(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.normalBtn_, nil, function()
		arg_5_0:SwitchDifficult(2)
	end)
	arg_5_0:AddBtnListener(arg_5_0.hardBtn_, nil, function()
		arg_5_0:SwitchDifficult(1)
	end)
end

function var_0_0.RefreshDifficult(arg_8_0)
	if arg_8_0.selectDifficult_ == 1 then
		arg_8_0.difficultController_:SetSelectedState("normal")
	else
		arg_8_0.difficultController_:SetSelectedState("hard")
	end
end

function var_0_0.SwitchDifficult(arg_9_0, arg_9_1)
	if arg_9_0.selectDifficult_ ~= arg_9_1 then
		arg_9_0.selectDifficult_ = arg_9_1

		local var_9_0 = DestroyBoxGameCfg[arg_9_0.selectID_]

		arg_9_0.selectID_ = DestroyBoxGameData:SwitchDifficult(arg_9_0.selectID_, arg_9_0.selectDifficult_)

		DestroyBoxGameData:SetSelectIDAndDifficult(var_9_0.main_activity_id, arg_9_0.selectID_, arg_9_0.selectDifficult_)
		arg_9_0:RefreshItemList()
		arg_9_0:RefreshScore()
		arg_9_0:RefreshDifficult()
	end
end

function var_0_0.SwitchSelectItem(arg_10_0, arg_10_1)
	arg_10_0.selectID_ = arg_10_1

	for iter_10_0, iter_10_1 in ipairs(arg_10_0.boxItemList_) do
		iter_10_1:SwitchSelectItem(arg_10_1)
	end

	arg_10_0:RefreshScore()
end

function var_0_0.RefreshItemList(arg_11_0)
	for iter_11_0, iter_11_1 in ipairs(arg_11_0.boxItemList_) do
		iter_11_1:SwitchDifficult()
	end
end

function var_0_0.RefreshScore(arg_12_0)
	local var_12_0 = DestroyBoxGameData:GetLastSelectNormalID(arg_12_0.mainActivityID_)
	local var_12_1 = DestroyBoxGameData:GetStageData(var_12_0)

	if var_12_1 then
		arg_12_0.scoreText_.text = var_12_1.maxScore
	else
		arg_12_0.scoreText_.text = 0
	end

	local var_12_2 = table.keyof(DestroyBoxGameData:GetDifficultList(arg_12_0.mainActivityID_)[arg_12_0.selectDifficult_], var_12_0)

	arg_12_0.numText_.text = string.format("%02d", var_12_2)

	if DestroyBoxGameData:IsFinishPreStage(var_12_0) then
		arg_12_0.lockController_:SetSelectedState("false")
	else
		arg_12_0.lockController_:SetSelectedState("true")

		local var_12_3 = DestroyBoxGameCfg[var_12_0].unlock_condition
		local var_12_4 = DestroyBoxGameCfg[var_12_3[1]]
		local var_12_5 = var_12_4.difficult

		if var_12_5 == 1 then
			var_12_5 = GetTips("HARDLEVEL_EASY")
		elseif var_12_5 == 2 then
			var_12_5 = GetTips("HARDLEVEL_HARD")
		end

		arg_12_0.lockText_.text = string.format(GetTips("DESTROY_BOX_GAME_UNLOCK_STAGE_1"), ActivityCfg[var_12_4.activity_id].remark, var_12_5, var_12_3[2])
	end
end

function var_0_0.AddRedPoint(arg_13_0)
	manager.redPoint:bindUIandKey(arg_13_0.normalGo_.transform, string.format("%s_%s_%s", RedPointConst.DESTROY_BOX_GAME_STAGE, 1, arg_13_0.mainActivityID_))
	manager.redPoint:bindUIandKey(arg_13_0.hardGo_.transform, string.format("%s_%s_%s", RedPointConst.DESTROY_BOX_GAME_STAGE, 2, arg_13_0.mainActivityID_))
end

function var_0_0.RemoveRedPoint(arg_14_0)
	manager.redPoint:unbindUIandKey(arg_14_0.normalGo_.transform, string.format("%s_%s_%s", RedPointConst.DESTROY_BOX_GAME_STAGE, 1, arg_14_0.mainActivityID_))
	manager.redPoint:unbindUIandKey(arg_14_0.hardGo_.transform, string.format("%s_%s_%s", RedPointConst.DESTROY_BOX_GAME_STAGE, 2, arg_14_0.mainActivityID_))
end

return var_0_0
