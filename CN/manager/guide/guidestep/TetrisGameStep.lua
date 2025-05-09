local var_0_0 = class("TetrisGameStep", DragStep)

function var_0_0.Init(arg_1_0)
	var_0_0.super.Init(arg_1_0)
end

function var_0_0.EventTrigger(arg_2_0, arg_2_1, arg_2_2)
	if arg_2_1 == "beginDrag" then
		arg_2_0._dragConponent:OnBeginDrag(arg_2_2)
	elseif arg_2_1 == "drag" then
		arg_2_0._dragConponent:OnDrag(arg_2_2)
	elseif arg_2_1 == "endDrag" then
		arg_2_0._dragConponent:OnEndDrag(arg_2_2)

		if arg_2_0.timer_ then
			arg_2_0.timer_:Stop()

			arg_2_0.timer_ = nil
		end

		arg_2_0.timer_ = Timer.New(function()
			if arg_2_0:CheckDragSuccess() then
				arg_2_0:OnStepEnd()
			end

			arg_2_0.timer_:Stop()

			arg_2_0.timer_ = nil
		end, 0.4, 1)

		arg_2_0.timer_:Start()
	end
end

function var_0_0.Play(arg_4_0)
	var_0_0.super.Play(arg_4_0)
	TetrisGameRunTimeManager:SetTetrisPos(arg_4_0._params[1], arg_4_0._params[2])
end

function var_0_0.CheckDragSuccess(arg_5_0)
	return TetrisGameRunTimeManager:GetIsEndNowRound()
end

return var_0_0
