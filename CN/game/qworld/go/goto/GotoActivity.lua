local var_0_0 = class("GotoActivity", BaseGoto)
local var_0_1 = "game.qworld.go.gotoActivityImpl."

function var_0_0.Ctor(arg_1_0)
	arg_1_0.template = {
		[ActivityConst.ACTIVITY_RED_ENVELOPE] = "GotoRedEnvelopeActivity",
		[ActivityConst.ACTIVITY_BLOOD_CARD] = "GotoBloodCardActivity",
		[ActivityConst.ACTIVITY_SPRING_SHOP] = "GotoSpringShopActivity",
		[ActivityConst.AUTO_COOK] = "GotoAutoCookActivity",
		[ActivityConst.ACTIVITY_SPRING_QUIZ] = "GotoQuizActivity",
		[ActivityConst.EAT_SNAKE] = "GotoEatSnakeActivity",
		[ActivityConst.ACTIVITY_3_11_MUSIC] = "GotoMusicActivity",
		[ActivityConst.ACTIVITY_3_11_ZUMA] = "GotoZumaActivity"
	}
end

function var_0_0.Go(arg_2_0, arg_2_1, arg_2_2, arg_2_3, arg_2_4, ...)
	local var_2_0 = arg_2_2[1]

	if arg_2_0.template[var_2_0] then
		if not ActivityData:GetActivityIsOpen(var_2_0) then
			Debug.LogError("活动未开启: " .. var_2_0)

			return
		end

		local var_2_1 = var_0_1 .. arg_2_0.template[var_2_0]

		import(var_2_1).New(var_2_0):Enter(arg_2_2, arg_2_3, arg_2_4)
	else
		Debug.LogError("不存在的活动: " .. var_2_0)
	end
end

return var_0_0
