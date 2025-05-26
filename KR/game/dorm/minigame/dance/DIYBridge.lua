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
	if arg_8_0.sceneLoaded then
		GameObject.DestroyImmediate(arg_8_0.sceneLoaded)
	end

	local var_8_0
	local var_8_1

	var_8_1, arg_8_0.scene = arg_8_0.scene, arg_8_1

	local var_8_2 = IdolStageSceneCfg[arg_8_1]

	if var_8_2 then
		arg_8_0.sceneLoaded = DanceGameController.LoadSceneObj("IdolTrainee/DanceEditStage/" .. var_8_2.diy_scene_prefab)

		DormUtils.ClearSceneItemInfo()
		DormLuaBridge.RecordInfoFromDormTag()
		DormUtils.MapSceneItemTagInfo()

		if arg_8_0.charaEID then
			var_0_1.UpdateCharaEntityPos(arg_8_0.charaEID, 1)
		end
	end

	manager.notify:Invoke("IDOL_DANCE_DIY_CHANGE_SCENE", arg_8_1, var_8_1)
end

function var_0_1.SetCharacter(arg_9_0, arg_9_1)
	arg_9_0.charaEID = arg_9_0.entityManager:Update(1, {
		complex = true,
		spawnAt = 1,
		heroID = arg_9_1
	}, {
		cfgID = arg_9_1
	})
end

function var_0_1.UpdateCharaEntityPos(arg_10_0, arg_10_1)
	local var_10_0 = var_0_5(arg_10_1)

	if var_10_0 then
		Dorm.DormEntityManager.PutEntityAt(arg_10_0, var_10_0)
	end
end

local function var_0_8(arg_11_0, arg_11_1)
	local var_11_0 = arg_11_0:Now()
	local var_11_1 = (arg_11_1.startTime or 0) + var_11_0
	local var_11_2

	if arg_11_1.endTime then
		var_11_2 = var_11_0 + arg_11_1.endTime
	end

	return var_11_1, var_11_2
end

local function var_0_9(arg_12_0, arg_12_1)
	local var_12_0 = DormCharacterActionManager.frameTaskRunner
	local var_12_1, var_12_2 = var_0_8(var_12_0, arg_12_1)
	local var_12_3

	if var_12_2 then
		var_12_3 = var_12_2 - var_12_1
	end

	local var_12_4 = var_12_0:NewTask()

	var_12_4:WaitUntil(function()
		return var_12_0:Now() >= var_12_1
	end):Then(function(arg_14_0)
		if arg_12_1.onStart then
			arg_12_1:onStart()
		end

		var_0_3.StopAllCmd(arg_12_0)

		local var_14_0 = arg_12_1.action
		local var_14_1, var_14_2 = DanceGame.MakeCtxForAction(arg_12_0, arg_12_0, var_14_0)

		if var_14_2 then
			if var_12_3 == nil then
				var_12_3 = var_14_2.duration
				var_12_2 = var_12_1 + var_12_3
			else
				var_14_2 = DanceGame.GetSeqAlignedToRoundDuration(var_14_2, var_12_3)
			end

			var_14_1.curActionTask = var_0_2.MakeInteractTask(var_14_2, var_14_1)

			DormUtils.SetEntityInteractContext(arg_12_0, var_14_1)
			var_0_3.SendInteractToEntityCMD(arg_12_0, arg_12_0, true)
		end
	end):WaitUntil(function()
		if var_12_3 > 0 and arg_12_1.onUpdate then
			local var_15_0 = (var_12_0:Now() - var_12_1) / var_12_3

			arg_12_1:onUpdate(var_15_0, var_12_1, var_12_2)
		end

		return var_12_2 == nil or var_12_0:Now() >= var_12_2
	end)
	var_12_4:Start(true)
	var_12_4:SetOnAbort(function()
		DanceGameController.SetEntityAnimeSpeed(arg_12_0, 1)

		if arg_12_1.onAbort then
			arg_12_1:onAbort()
		end
	end)
	var_12_4:SetOnComplete(function()
		DanceGameController.SetEntityAnimeSpeed(arg_12_0, 1)

		if arg_12_1.onComplete then
			arg_12_1:onComplete()
		end
	end)

	return var_12_4
end

function var_0_1.AddPreviewTask(arg_18_0, arg_18_1)
	table.insert(arg_18_0.previewTasks, arg_18_1)
end

function var_0_1.StopAllPreviewTasks(arg_19_0)
	arg_19_0.previewPriority = nil

	local var_19_0 = arg_19_0.charaEID

	Dorm.DormEntityManager.StopAllCmd(var_19_0)

	for iter_19_0, iter_19_1 in pairs(arg_19_0.previewTasks) do
		iter_19_1:Abort()
	end

	arg_19_0.previewTasks = {}
end

function var_0_1.PreviewSingleAction(arg_20_0, arg_20_1)
	arg_20_0:StopAllPreviewTasks()

	arg_20_0.previewPriority = 1

	local var_20_0 = arg_20_0.charaEID

	arg_20_0:AddPreviewTask(var_0_9(var_20_0, arg_20_1))
end

function var_0_1.PreviewSequenceAction(arg_21_0, arg_21_1, arg_21_2, arg_21_3, arg_21_4)
	arg_21_2 = arg_21_2 or 0

	arg_21_0:RestartBGM(arg_21_0.music, arg_21_2 * 1000)
	arg_21_0:StopAllPreviewTasks()

	arg_21_0.previewPriority = 2

	local var_21_0 = arg_21_0.charaEID

	for iter_21_0, iter_21_1 in pairs(arg_21_1) do
		arg_21_0:AddPreviewTask(var_0_9(var_21_0, iter_21_1))
	end

	local var_21_1 = DormCharacterActionManager.taskRunner:NewTask()

	var_21_1:WaitTask(unpack(arg_21_0.previewTasks)):SetOnComplete(function()
		manager.audio:StopBGM()

		if arg_21_3 then
			arg_21_3()
		end
	end):SetOnAbort(function()
		manager.audio:StopBGM()

		if arg_21_4 then
			arg_21_4()
		end
	end)
	var_21_1:Start(true)
	arg_21_0:AddPreviewTask(var_21_1)
end

function var_0_1.PreviewSequenceActionLooped(arg_24_0, arg_24_1, arg_24_2)
	arg_24_0:PreviewSequenceAction(arg_24_1, 0, function()
		arg_24_0:PreviewSequenceActionLooped(arg_24_1, arg_24_2)
	end, arg_24_2)
end

function var_0_1.GetCurPreviewPriority(arg_26_0)
	for iter_26_0, iter_26_1 in pairs(arg_26_0.previewTasks) do
		if not iter_26_1:IsAborted() and not iter_26_1:IsFinished() and not iter_26_1:IsCancelled() then
			return arg_26_0.previewPriority
		end
	end

	return 0
end

function var_0_1.EnterDIY(arg_27_0)
	IdolTraineeAction.GetMySharedDanceDIYStatistics(function()
		return
	end)

	local var_27_0 = DormMinigame.LaterBack()

	if nullable(var_27_0, "backTo", "minigameClass") == var_0_1 then
		JumpTools.OpenPageByJump("/idolDanceEdit", {
			loadSceneFromSaveData = true,
			music = var_0_1.music,
			load = arg_27_0
		})
	else
		var_27_0.loadInfo = arg_27_0

		DormMinigame.Launch("WT_DIY", var_0_1, var_27_0)
	end
end

return var_0_1
