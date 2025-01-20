local var_0_0 = require("game.GameContext")
local var_0_1 = {}
local var_0_2 = DormCharacterInteractBehaviour
local var_0_3 = Dorm.DormEntityManager

local function var_0_4(arg_1_0)
	local var_1_0 = DormHeroTools:GetCurSkinID(arg_1_0)
	local var_1_1 = BackHomeHeroSkinCfg[var_1_0].model

	return "CharDorm/dance/" .. var_1_1
end

local function var_0_5(arg_2_0)
	if arg_2_0 == nil then
		return nil
	end

	local var_2_0 = "dance.pos." .. arg_2_0

	return nullable(Dorm.storage:PickData(var_2_0), "transform")
end

local function var_0_6(arg_3_0)
	return var_0_4(arg_3_0.heroID)
end

local function var_0_7(arg_4_0)
	return var_0_5(nullable(arg_4_0, "spawnAt"))
end

function var_0_1.RestartBGM(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0.music = arg_5_1 or arg_5_0.music

	manager.audio:StopBGM()

	local var_5_0 = IdolStageMusicCfg[arg_5_0.music]

	if var_5_0 then
		manager.audio:GetBgmPlayer().startTime = arg_5_2 or 0

		manager.audio:PlayBGM(var_5_0.cue_sheet, var_5_0.cue_name, var_5_0.awb_name)
		manager.notify:Invoke("IDOL_DANCE_CHANGE_MUSIC", arg_5_0.music)
	end
end

function var_0_1.Enter(arg_6_0, arg_6_1, arg_6_2)
	BackHomeDataManager:GotoBackHomeCricketStage(BackHomeCricketConst.ROOM_TYPE.TRAIN)

	arg_6_0.previewTasks = {}

	manager.windowBar:SetWhereTag("danceGame")
	manager.ui:SetMainCamera("dance")
	manager.audio:StopAll()

	local var_6_0 = EntityManager.CreateModel.New(var_0_6, var_0_7)

	arg_6_0.entityManager = EntityManager.New(var_6_0)

	local var_6_1 = nullable(arg_6_2, "scene") or IdolStageSceneCfg.all[1]

	arg_6_0.music = nullable(arg_6_2, "music") or IdolStageMusicCfg.all[1]

	arg_6_0:SetScene(var_6_1)

	local var_6_2, var_6_3 = IdolTraineeData:GetCurAttackHeroInfo()

	arg_6_0:SetCharacter(var_6_3)

	if arg_6_2.loadInfo then
		gameContext:UpdateUrlHistory("/dormChooseRoomView", {
			params = {}
		})
		gameContext:UpdateUrlHistory("/dormVisitView", {
			params = {
				back = "back"
			}
		})
		JumpTools.OpenPageByJump("/idolDanceEdit", {
			loadSceneFromSaveData = true,
			music = arg_6_0.music,
			load = arg_6_2.loadInfo
		})
	else
		gameContext:Go("/idolDanceDIY", {
			heroID = var_6_3
		})
	end
end

function var_0_1.Exit(arg_7_0)
	arg_7_0:StopAllPreviewTasks()
	arg_7_0:SetScene(nil)
	DanceGameController.RemoveAddedCueSheets()
end

function var_0_1.SetScene(arg_8_0, arg_8_1)
	if arg_8_0.scene == arg_8_1 then
		return
	end

	local var_8_0
	local var_8_1

	var_8_1, arg_8_0.scene = arg_8_0.scene, arg_8_1

	local var_8_2 = IdolStageSceneCfg[arg_8_1]

	if var_8_2 then
		if DanceGameController.LoadSceneObjAsync("IdolTrainee/DanceEditStage/" .. var_8_2.diy_scene_prefab, function()
			arg_8_0.sceneLoaded = DanceGameController.loadScene

			DormUtils.ClearSceneItemInfo()
			DormLuaBridge.RecordInfoFromDormTag()
			DormUtils.MapSceneItemTagInfo()

			if arg_8_0.charaEID then
				var_0_1.UpdateCharaEntityPos(arg_8_0.charaEID, 1)
			end

			manager.notify:Invoke("IDOL_DANCE_DIY_CHANGE_SCENE", arg_8_1, var_8_1)
		end) and arg_8_0.sceneLoaded and arg_8_0.sceneLoaded:IsValid() then
			SceneManager.UnloadSceneAsync(arg_8_0.sceneLoaded)
		end
	else
		manager.notify:Invoke("IDOL_DANCE_DIY_CHANGE_SCENE", arg_8_1, var_8_1)
	end
end

function var_0_1.SetCharacter(arg_10_0, arg_10_1)
	arg_10_0.charaEID = arg_10_0.entityManager:Update(1, {
		complex = true,
		spawnAt = 1,
		heroID = arg_10_1
	}, {
		cfgID = arg_10_1
	})
end

function var_0_1.UpdateCharaEntityPos(arg_11_0, arg_11_1)
	local var_11_0 = var_0_5(arg_11_1)

	if var_11_0 then
		Dorm.DormEntityManager.PutEntityAt(arg_11_0, var_11_0)
	end
end

local function var_0_8(arg_12_0, arg_12_1)
	local var_12_0 = arg_12_0:Now()
	local var_12_1 = (arg_12_1.startTime or 0) + var_12_0
	local var_12_2

	if arg_12_1.endTime then
		var_12_2 = var_12_0 + arg_12_1.endTime
	end

	return var_12_1, var_12_2
end

local function var_0_9(arg_13_0, arg_13_1)
	local var_13_0 = DormCharacterActionManager.frameTaskRunner
	local var_13_1, var_13_2 = var_0_8(var_13_0, arg_13_1)
	local var_13_3

	if var_13_2 then
		var_13_3 = var_13_2 - var_13_1
	end

	local var_13_4 = var_13_0:NewTask()

	var_13_4:WaitUntil(function()
		return var_13_0:Now() >= var_13_1
	end):Then(function(arg_15_0)
		if arg_13_1.onStart then
			arg_13_1:onStart()
		end

		var_0_3.StopAllCmd(arg_13_0)

		local var_15_0 = arg_13_1.action
		local var_15_1, var_15_2 = DanceGame.MakeCtxForAction(arg_13_0, arg_13_0, var_15_0)

		if var_15_2 then
			if var_13_3 == nil then
				var_13_3 = var_15_2.duration
				var_13_2 = var_13_1 + var_13_3
			else
				var_15_2 = DanceGame.GetSeqAlignedToRoundDuration(var_15_2, var_13_3)
			end

			var_15_1.curActionTask = var_0_2.MakeInteractTask(var_15_2, var_15_1)

			DormUtils.SetEntityInteractContext(arg_13_0, var_15_1)
			var_0_3.SendInteractToEntityCMD(arg_13_0, arg_13_0, true)
		end
	end):WaitUntil(function()
		if var_13_3 > 0 and arg_13_1.onUpdate then
			local var_16_0 = (var_13_0:Now() - var_13_1) / var_13_3

			arg_13_1:onUpdate(var_16_0, var_13_1, var_13_2)
		end

		return var_13_2 == nil or var_13_0:Now() >= var_13_2
	end)
	var_13_4:Start(true)
	var_13_4:SetOnAbort(function()
		DanceGameController.SetEntityAnimeSpeed(arg_13_0, 1)

		if arg_13_1.onAbort then
			arg_13_1:onAbort()
		end
	end)
	var_13_4:SetOnComplete(function()
		DanceGameController.SetEntityAnimeSpeed(arg_13_0, 1)

		if arg_13_1.onComplete then
			arg_13_1:onComplete()
		end
	end)

	return var_13_4
end

function var_0_1.AddPreviewTask(arg_19_0, arg_19_1)
	table.insert(arg_19_0.previewTasks, arg_19_1)
end

function var_0_1.StopAllPreviewTasks(arg_20_0)
	arg_20_0.previewPriority = nil

	local var_20_0 = arg_20_0.charaEID

	Dorm.DormEntityManager.StopAllCmd(var_20_0)

	for iter_20_0, iter_20_1 in pairs(arg_20_0.previewTasks) do
		iter_20_1:Abort()
	end

	arg_20_0.previewTasks = {}
end

function var_0_1.PreviewSingleAction(arg_21_0, arg_21_1)
	arg_21_0:StopAllPreviewTasks()

	arg_21_0.previewPriority = 1

	local var_21_0 = arg_21_0.charaEID

	arg_21_0:AddPreviewTask(var_0_9(var_21_0, arg_21_1))
end

function var_0_1.PreviewSequenceAction(arg_22_0, arg_22_1, arg_22_2, arg_22_3, arg_22_4)
	arg_22_2 = arg_22_2 or 0

	arg_22_0:RestartBGM(arg_22_0.music, arg_22_2 * 1000)
	arg_22_0:StopAllPreviewTasks()

	arg_22_0.previewPriority = 2

	local var_22_0 = arg_22_0.charaEID

	for iter_22_0, iter_22_1 in pairs(arg_22_1) do
		arg_22_0:AddPreviewTask(var_0_9(var_22_0, iter_22_1))
	end

	local var_22_1 = DormCharacterActionManager.taskRunner:NewTask()

	var_22_1:WaitTask(unpack(arg_22_0.previewTasks)):SetOnComplete(function()
		manager.audio:StopBGM()

		if arg_22_3 then
			arg_22_3()
		end
	end):SetOnAbort(function()
		manager.audio:StopBGM()

		if arg_22_4 then
			arg_22_4()
		end
	end)
	var_22_1:Start(true)
	arg_22_0:AddPreviewTask(var_22_1)
end

function var_0_1.PreviewSequenceActionLooped(arg_25_0, arg_25_1, arg_25_2)
	arg_25_0:PreviewSequenceAction(arg_25_1, 0, function()
		arg_25_0:PreviewSequenceActionLooped(arg_25_1, arg_25_2)
	end, arg_25_2)
end

function var_0_1.GetCurPreviewPriority(arg_27_0)
	for iter_27_0, iter_27_1 in pairs(arg_27_0.previewTasks) do
		if not iter_27_1:IsAborted() and not iter_27_1:IsFinished() and not iter_27_1:IsCancelled() then
			return arg_27_0.previewPriority
		end
	end

	return 0
end

function var_0_1.EnterDIY(arg_28_0)
	IdolTraineeAction.GetMySharedDanceDIYStatistics(function()
		return
	end)

	local var_28_0 = DormMinigame.LaterBack()

	if nullable(var_28_0, "backTo", "minigameClass") == var_0_1 then
		JumpTools.OpenPageByJump("/idolDanceEdit", {
			loadSceneFromSaveData = true,
			music = var_0_1.music,
			load = arg_28_0
		})
	else
		var_28_0.loadInfo = arg_28_0
		var_28_0.scene = nullable(arg_28_0, "data", "scene")

		DormMinigame.Launch("WT_DIY", var_0_1, var_28_0)
	end
end

return var_0_1
