local var_0_0 = class("SummerChessBoardExloreNoteItem", ReduxView)

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_1.transform

	arg_1_0:BindCfgUI()
	arg_1_0:AddListeners()

	arg_1_0.withPicController_ = arg_1_0.controllerEx_:GetController("WithPic")
	arg_1_0.btnStateController_ = arg_1_0.controllerEx_:GetController("Btn")
	arg_1_0.taskUpdateHandler_ = handler(arg_1_0, arg_1_0.TaskUpdate)
end

function var_0_0.OnEnter(arg_2_0)
	manager.notify:RegistListener(ON_TASK_SUBMIT_RESPONSE, arg_2_0.taskUpdateHandler_)
end

function var_0_0.OnExit(arg_3_0)
	manager.notify:RemoveListener(ON_TASK_SUBMIT_RESPONSE, arg_3_0.taskUpdateHandler_)
end

function var_0_0.Dispose(arg_4_0)
	arg_4_0.taskUpdateHandler_ = nil

	var_0_0.super.Dispose(arg_4_0)
end

function var_0_0.AddListeners(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.button_, nil, function()
		local var_6_0 = arg_5_0.taskID_

		if TaskData2:GetTaskComplete(var_6_0) then
			return
		end

		TaskAction:SubmitTask(arg_5_0.taskID_)
	end)
end

function var_0_0.SetData(arg_7_0, arg_7_1)
	arg_7_0.taskID_ = arg_7_1

	arg_7_0:RefreshUI()
end

function var_0_0.RefreshUI(arg_8_0)
	local var_8_0 = arg_8_0.taskID_
	local var_8_1 = AssignmentCfg[var_8_0]

	if var_8_1 == nil then
		return
	end

	if #var_8_1.reward > 0 then
		if TaskData2:GetTaskComplete(var_8_0) then
			arg_8_0.btnStateController_:SetSelectedState("finished")
		else
			arg_8_0.btnStateController_:SetSelectedState("award")
		end
	else
		arg_8_0.btnStateController_:SetSelectedState("hide")
	end

	local var_8_2 = AssignmentExploreNoteCfg[var_8_0]

	if var_8_2 ~= nil then
		arg_8_0.withPicController_:SetSelectedState("true")

		arg_8_0.text2_.text = var_8_1.desc

		getSpriteWithoutAtlasAsync(var_8_2.image_path, function(arg_9_0)
			if arg_8_0.image_ then
				arg_8_0.image_.sprite = arg_9_0
			end
		end)
	else
		arg_8_0.withPicController_:SetSelectedState("false")

		arg_8_0.text1_.text = var_8_1.desc
	end

	arg_8_0:Show(true)
end

function var_0_0.TaskUpdate(arg_10_0)
	arg_10_0:RefreshUI()
end

function var_0_0.Show(arg_11_0, arg_11_1)
	SetActive(arg_11_0.gameObject_, arg_11_1)

	if arg_11_1 == false then
		arg_11_0.taskID_ = nil
	end
end

return var_0_0
