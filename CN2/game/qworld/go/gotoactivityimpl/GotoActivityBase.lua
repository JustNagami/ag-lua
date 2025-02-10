local var_0_0 = class("GotoActivityBase")

function var_0_0.GetId(arg_1_0)
	return arg_1_0.activityId
end

function var_0_0.Ctor(arg_2_0, arg_2_1)
	arg_2_0.activityId = arg_2_1
end

function var_0_0.OnInit(arg_3_0)
	return
end

function var_0_0.OnEnter(arg_4_0, arg_4_1)
	return
end

function var_0_0.StartSetCamera(arg_5_0, arg_5_1)
	QWorldLuaBridge.HidePlayer(true)
	QWorldLuaBridge.HideHud(true)
end

function var_0_0.TryTeleport(arg_6_0)
	return
end

function var_0_0.Enter(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
	QWorldMgr:ActiveControl(false)

	local var_7_0 = QWorldData:GetIsBackQWorld()
	local var_7_1 = 0.5

	if var_7_0 then
		var_7_1 = 0
	end

	QWorldMgr:StartBlackFade(var_7_1, 0.5, 0.5, function()
		arg_7_0:TryTeleport()
		QWorldLuaBridge.CloseUI(false)
		arg_7_0:StartSetCamera(arg_7_1)
		arg_7_0:OnEnter(arg_7_1, arg_7_2)

		if arg_7_0:PostCheck() then
			QWorldMgr:EnableActivityCamera(arg_7_0.activityId, arg_7_1[2] or 1)

			if arg_7_3 then
				if arg_7_3.showChar then
					QWorldLuaBridge.HidePlayer(false)
				end

				if arg_7_3.func then
					arg_7_3.func()
				end
			end
		end

		QWorldData:SetIsBackQWorld(false)
	end)
end

function var_0_0.PostCheck(arg_9_0)
	if gameContext:GetLastOpenPage() == "qworldMainHome" then
		QWorldLuaBridge.HidePlayer(false)
		QWorldLuaBridge.HideHud(false)

		return false
	end

	return true
end

return var_0_0
