require("game/qworld/bubble/QWorldBubbleLuaBridge")
require("game/qworld/story/QWorldStoryLuaBridge")
require("game/qworld/prefabScript/QWorldEntityLuaBridge")

function LaunchQWorld(arg_1_0)
	DestroyLua()
	QWorldData:SetIsBackQWorld(arg_1_0)
	QWorldLuaBridge.EntraceLauncher("1031001")
end

function PostEnterQWorld()
	manager.audio:AddCue("effect", "ui_sandplay", false)
	manager.uiInit()
	gameContext:SetSystemLayer("battle")
	manager.windowBar:SetWhereTag("qworld")
	QWorldMgr:EnterQWorld()
end

function OnQWorldLoaded()
	QWorldMgr:OnQWorldLoaded()
	QWorldTools.SendMessageToSDK(QWorldMgr:GetActivityId(), QWorldMgr:GetMapId(), QWorldMessageType.ENTER, -1, "", -1)
end

function PostExitQWorld()
	QWorldTools.SendMessageToSDK(QWorldMgr:GetActivityId(), QWorldMgr:GetMapId(), QWorldMessageType.EXIT, -1, "", -1)
	manager.windowBar:ClearWhereTag()
	DestroyLua()
	QWorldMgr:PostExitQWorld()
	QWorldMgr:ExitQWorld()
	manager.audio:RemoveCue("ui_sandplay")
	QWorldData:SetCurSceneName(nil)
end

function GetQworldStoryContent(arg_5_0)
	return QWorldStoryWordCfg[arg_5_0] or nil
end

function QWorldUIShowWithBlank()
	gameContext:Go("/springPreheatBlank")
	QWorldUIShow()
end

function QWorldUIShow()
	gameContext:Go("/springPreheatBlank/qworldMainHome")
end

function QWorldUIHide()
	gameContext:Go("/springPreheatBlank")
end

function ForceStopAllPerformTask()
	QWorldMgr:GetQWorldPerformMgr():ForceStopAllTask()
end

function GetQWorldSceneName(arg_10_0)
	QWorldData:SetCurMapId(tonumber(arg_10_0))

	local var_10_0 = SandplaySettingCfg[string.format("scene_after_task_%s", arg_10_0)]

	if var_10_0 then
		local var_10_1 = var_10_0.value[1]
		local var_10_2 = var_10_0.value[2]

		if QWorldQuestTool.IsMainQuestFinish(var_10_2) then
			return var_10_1
		end
	end
end

function PlayQWorldBgm()
	local var_11_0 = QWorldData:GetCurSceneName()
	local var_11_1 = SandplaySettingCfg[string.format("bgm_name_of_scene_%s", var_11_0)]

	if var_11_1 and #var_11_1.value > 0 then
		local var_11_2 = var_11_1.value
		local var_11_3 = #var_11_2
		local var_11_4 = math.random(var_11_3)
		local var_11_5 = var_11_2[var_11_4]

		if var_11_5 == QWorldData:GetCurHomeBgmId() then
			if var_11_3 >= var_11_4 + 1 then
				var_11_5 = var_11_2[var_11_4 + 1]
			elseif var_11_4 - 1 >= 1 then
				var_11_5 = var_11_2[var_11_4 - 1]
			end

			var_11_4 = table.indexof(var_11_2, var_11_5)
		end

		local var_11_6 = var_11_5
		local var_11_7 = SandplaySettingCfg[string.format("bgm_sheet_of_scene_%s", var_11_0)].value[var_11_4]

		manager.audio:PlayBGM(var_11_7, var_11_6, var_11_6)
		QWorldData:SetCurHomeBgmId(var_11_6)
	end
end

function PostEnterQWorldScene(arg_12_0)
	if QWorldData:GetCurSceneName() ~= arg_12_0 then
		QWorldData:SetCurSceneName(arg_12_0)
		print(string.format("进入场景%s", arg_12_0))
		manager.notify:Invoke(QWORLD_RESTART)
		PlayQWorldBgm()

		if arg_12_0 == "X510a" then
			QWorldMgr:GetQWorldEntityMgr():RebuildEntity(QWORLD_ENTITY_TYPE.FUNITURE)
		end
	end
end

function QWorldTeleport(arg_13_0)
	QWorldMgr:StartBlackFade(1, 1, 1, function()
		manager.notify:Invoke(QWORLD_TELEPORT, arg_13_0)
		QWorldLuaBridge.Teleport(arg_13_0, true)
	end)
end

function QWorldTeleportWithoutBlackFade(arg_15_0)
	manager.notify:Invoke(QWORLD_TELEPORT, arg_15_0)
	QWorldLuaBridge.Teleport(arg_15_0)
end

function GM_QWorldJumpStory()
	QWorldMgr:GetQWorldStoryMgr():StopStory()
end
