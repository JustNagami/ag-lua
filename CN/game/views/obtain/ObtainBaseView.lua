local var_0_0 = class("ObtainBaseView", ReduxView)

function var_0_0.OnClick(arg_1_0)
	if not arg_1_0.playableDirector_ then
		return true
	end

	if arg_1_0.playableDirector_.time == 0 or arg_1_0.playableDirector_.time >= arg_1_0:GetTimeLineEndTime() then
		return true
	else
		arg_1_0.playableDirector_.time = arg_1_0:GetTimeLineEndTime()

		arg_1_0.playableDirector_:Evaluate()

		return false
	end
end

function var_0_0.Skip2End(arg_2_0)
	if arg_2_0.playableDirector_ then
		arg_2_0.playableDirector_.time = arg_2_0:GetTimeLineEndTime()
	end
end

function var_0_0.HideShareUI(arg_3_0, arg_3_1)
	if arg_3_0.rebateGo_ then
		SetActive(arg_3_0.rebateGo_, false)
	end
end

function var_0_0.ShowShareUI(arg_4_0, arg_4_1)
	if arg_4_0.rebateGo_ and arg_4_1.draw_rebate and arg_4_1.draw_rebate ~= 0 then
		SetActive(arg_4_0.rebateGo_, true)
	end
end

function var_0_0.Show(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = arg_5_1.id

	if arg_5_0.gameObject_ then
		SetActive(arg_5_0.gameObject_, true)
	end

	if arg_5_0.playableDirector_ then
		arg_5_0.playableDirector_:Evaluate()
		arg_5_0.playableDirector_:Play()
	end

	arg_5_0:SetInfo(var_5_0, arg_5_2)
end

function var_0_0.Hide(arg_6_0)
	if arg_6_0.gameObject_ then
		SetActive(arg_6_0.gameObject_, false)
	end
end

function var_0_0.SetInfo(arg_7_0)
	return
end

function var_0_0.GetTimeLineEndTime(arg_8_0)
	return 0
end

function var_0_0.OnObtainHeroMovieAnimtionEvent(arg_9_0)
	return
end

return var_0_0
