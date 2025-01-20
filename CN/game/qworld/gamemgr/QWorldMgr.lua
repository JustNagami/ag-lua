local var_0_0 = {}
local var_0_1 = false

function IsQworldRunning()
	return var_0_1
end

local var_0_2

function var_0_0.GetQWorldStoryMgr(arg_2_0)
	return var_0_2
end

local var_0_3

function var_0_0.GetQWorldEntityMgr(arg_3_0)
	return var_0_3
end

local var_0_4

function var_0_0.GetQWorldPerformMgr(arg_4_0)
	return var_0_4
end

local var_0_5

function var_0_0.GetQWorldQuestMgr(arg_5_0)
	return var_0_5
end

local var_0_6

function var_0_0.GetQWorldHintMgr(arg_6_0)
	return var_0_6
end

local var_0_7

function var_0_0.GetQWorldTagMgr(arg_7_0)
	return var_0_7
end

function var_0_0.EnterQWorld(arg_8_0)
	var_0_1 = true
	var_0_2 = import("game.qworld.story.QWorldStoryMgr")

	var_0_2:Init()

	var_0_3 = import("game.qworld.prefabScript.QWorldEntityMgr").New()

	var_0_3:Init()

	var_0_4 = import("game.qworld.perform.QWPerformMgr").New()

	var_0_4:Init()

	var_0_5 = import("game.qworld.quest.QWorldQuestMgr").New()

	var_0_5:Init()

	var_0_6 = import("game.qworld.hint.QWorldHintMgr").New()

	var_0_6:Init()

	var_0_7 = import("game.qworld.tag.QWorldTagMgr").New()

	var_0_7:Init()
end

function var_0_0.GetMapId(arg_9_0)
	return 1031001
end

function var_0_0.GetActivityId(arg_10_0)
	return 313641
end

function var_0_0.OnQWorldLoaded(arg_11_0)
	local var_11_0 = QWorldData:GetQWorldContext()

	if var_11_0 then
		local var_11_1 = manager.ui.mainCamera.transform

		QWorldLuaBridge.TeleportToCachePos(var_11_0.position, var_11_0.rotation, true)

		if var_11_0.cacheTag and SandplayTagCfg[var_11_0.cacheTag] then
			local var_11_2 = SandplayTagCfg[var_11_0.cacheTag]

			QWorldGoto:Goto(var_11_2.tag_behaviour, arg_11_0.entityId, var_11_2.behaviour_parameters, var_11_2.passthrough_parameters)
			QWorldData:SetQWorldContext({})
		end
	end

	var_0_5:CreateMissingQuestStaff()

	if not var_0_0.posSyncTimer_ then
		var_0_0.posSyncTimer_ = Timer.New(function()
			if var_0_0.isLogout_ then
				return
			end

			QWorldAction.SavePlayerData()

			if QWorldLuaBridge.GetPlayer().transform.position.y < -50 then
				QWorldMgr:StartBlackFade(0.5, 0.5, 1, function()
					QWorldLuaBridge.TeleportToStageOrigin()
				end)
			end
		end, 5, -1)

		var_0_0.posSyncTimer_:Start()
	end

	var_0_0.isQWorldLoaded_ = true
	var_0_0.isLogout_ = nil
end

function var_0_0.PostExitQWorld(arg_14_0)
	if var_0_1 then
		QWorldData:SetIsBackQWorld(false)

		if not var_0_0.isLogout_ then
			QWorldAction.SavePlayerData()
		end

		QWorldData:SetCurMapId(0)
	end
end

function var_0_0.ExitQWorld(arg_15_0)
	if var_0_0.posSyncTimer_ then
		var_0_0.posSyncTimer_:Stop()

		var_0_0.posSyncTimer_ = nil
	end

	var_0_1 = false

	var_0_2:Dispose()

	var_0_2 = nil

	var_0_3:Dispose()

	var_0_3 = nil

	var_0_4:Dispose()

	var_0_4 = nil

	var_0_5:Dispose()

	var_0_5 = nil

	var_0_6:Dispose()

	var_0_6 = nil

	var_0_7:Dispose()

	var_0_7 = nil
end

function var_0_0.Init(arg_16_0)
	return
end

function OnLogoutQWorld()
	var_0_0.isLogout_ = true
end

function var_0_0.StartBlackFade(arg_18_0, arg_18_1, arg_18_2, arg_18_3, arg_18_4, arg_18_5)
	local var_18_0

	if arg_18_5 then
		function var_18_0()
			if arg_18_5 then
				arg_18_5()
			end
		end
	end

	QWorldMgr:GetQWorldStoryMgr():GetBlackFade():StartFade({
		showContent = true,
		contentTime = arg_18_3,
		showTimer = arg_18_1,
		outTimer = arg_18_2,
		centerAction = function()
			if arg_18_4 then
				arg_18_4()
			end
		end,
		done = var_18_0
	})
end

function var_0_0.ActiveControl(arg_21_0, arg_21_1)
	if var_0_1 then
		QWorldLuaBridge.CloseUI(not arg_21_1)
		arg_21_0:ActivePlayerControl(arg_21_1)
	end
end

function var_0_0.ActivePlayerControlWithMain(arg_22_0, arg_22_1)
	if var_0_1 and gameContext:GetLastOpenPage() == "qworldMainHome" then
		arg_22_0:ActivePlayerControl(arg_22_1)
	end
end

function var_0_0.ActivePlayerControl(arg_23_0, arg_23_1)
	if var_0_1 then
		if arg_23_1 then
			if not QWorldMgr:GetQWorldPerformMgr():IsInPerform() and not QWorldMgr:GetQWorldPerformMgr():IsInActivityPerform() then
				QWorldLuaBridge.HideBubble(false)
				QWorldLuaBridge.StopControl(false)
				QWorldLuaBridge.EnableCamera(QWorldCameraFlag.Player, "", QWorldCameraLayer.PlayerOrStory)
			end

			if QWorldMgr:GetQWorldPerformMgr():TryClearPerformDirty() then
				QWorldLuaBridge.EnableCamera(QWorldCameraFlag.Player, "", QWorldCameraLayer.PlayerOrStory)
			end

			QWorldLuaBridge.HideHud(false)
			QWorldLuaBridge.HidePlayer(false)
		else
			QWorldLuaBridge.StopControlFrame(2)
			QWorldLuaBridge.HideBubble(true)
			QWorldLuaBridge.StopControl(true)
		end
	end
end

function var_0_0.EnableCamera(arg_24_0, arg_24_1, arg_24_2, arg_24_3)
	if var_0_1 then
		if arg_24_1 == QWorldCameraFlag.CustomCamera and arg_24_2 == nil then
			return
		end

		QWorldLuaBridge.EnableCamera(arg_24_1, arg_24_2 or "", arg_24_3 or QWorldCameraLayer.PlayerOrStory)
	end
end

function var_0_0.EnableActivityCamera(arg_25_0, arg_25_1, arg_25_2)
	local var_25_0 = SandplayActivityCameraCfg[arg_25_1]

	if var_25_0 then
		local var_25_1 = var_25_0.camera[arg_25_2 or 1]

		if var_25_1 then
			arg_25_0:EnableCamera(QWorldCameraFlag.CustomCamera, var_25_1, QWorldCameraLayer.Activity)
		end
	end
end

function var_0_0.ExitTopCustomCamera(arg_26_0)
	QWorldLuaBridge.ExitTopCustomCamera()
end

function var_0_0.IsInQWorldMain(arg_27_0)
	if gameContext:GetLastOpenPage() == "qworldMainHome" then
		return true
	end

	return false
end

return var_0_0
