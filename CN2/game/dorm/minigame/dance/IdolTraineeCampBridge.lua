local var_0_0 = {}

local function var_0_1(arg_1_0)
	local var_1_0 = DormHeroTools:GetCurSkinID(arg_1_0)
	local var_1_1 = BackHomeHeroSkinCfg[var_1_0].model

	return "CharDorm/idolCamp/" .. var_1_1
end

local function var_0_2(arg_2_0)
	return var_0_1(arg_2_0.heroID)
end

local function var_0_3(arg_3_0)
	if arg_3_0.spawnAt == nil then
		return nil
	end

	local var_3_0 = "idol.camp.pos." .. arg_3_0.spawnAt

	return nullable(Dorm.storage:PickData(var_3_0), "transform")
end

function var_0_0.Enter(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.listener = EventListener.New()

	arg_4_0.listener:Register(ON_FINISH_STORY, var_0_0.OnFinishStory)
	arg_4_0.listener:Register(IDOL_TRAINEE_TRAIN_HERO_PROPERTY_CALLBACK, var_0_0.OnTrainingStart)
	arg_4_0.listener:Register(DORM_REGENERATE_HERO, var_0_0.RefreshCharacterAtPos)

	var_0_0.cinemachineBrain = manager.ui.mainCamera:GetComponent("CinemachineBrain")
	var_0_0.cinemachineBrain.enabled = true
	var_0_0.cinemachineBrain.m_DefaultBlend = DanceGameController.cut
	var_0_0.cinemachineBrain.m_CustomBlends = Asset.Load("IdolTrainee/Camp/VCamBlendSetting")
	var_0_0.camera = {}

	local var_4_0 = nullable(Dorm.storage:PickData("idol.camp.camera"), "gameObject")

	for iter_4_0 = 1, var_4_0.transform.childCount do
		local var_4_1 = var_4_0.transform:GetChild(iter_4_0 - 1)

		var_0_0.camera[var_4_1.gameObject.name] = var_4_1.gameObject
	end

	local var_4_2 = EntityManager.CreateModel.New(var_0_2, var_0_3)

	var_0_0.entityManager = EntityManager.New(var_4_2)

	function var_0_0.entityManager.OnCreate(arg_5_0, arg_5_1)
		DanceGameController.InitCampEntity(arg_5_1)
	end

	function var_0_0.entityManager.OnRemove(arg_6_0, arg_6_1)
		local var_6_0 = table.keyof(var_0_0.charaAtPos, arg_6_1)

		if var_6_0 then
			var_0_0.charaAtPos[var_6_0] = nil
		end
	end

	var_0_0.trainerEntityManager = EntityManager.New(var_4_2)
	var_0_0.competitionEntityManager = EntityManager.New(var_4_2)
	var_0_0.walls = {}

	for iter_4_1, iter_4_2 in Dorm.storage:ForeachData("idol.camp.wall", pairs) do
		table.insert(var_0_0.walls, iter_4_2.transform:GetComponent("Collider"))
	end

	var_0_0.charaAtPos = {}

	var_0_0.RefreshCharacterAtPos(true)
	var_0_0.GenerateAttackHero()
	manager.windowBar:SetWhereTag("danceGame")
	gameContext:Go(arg_4_2)

	local var_4_3 = IdolTraineeData:AcquireLastJumpContext()

	if var_4_3 and var_4_3.trainView then
		JumpTools.OpenPageByJump("/idolTraineeTrain", {
			backToDormInfo = var_4_3.backToDormInfo
		})
	end
end

function var_0_0.RefreshCharacterAtPos(arg_7_0)
	local var_7_0 = {}

	for iter_7_0, iter_7_1 in pairs(var_0_0.charaAtPos) do
		var_7_0[iter_7_0] = iter_7_1
	end

	local var_7_1 = IdolTraineeData:GetHeroPosList()

	for iter_7_2, iter_7_3 in pairs(var_7_1) do
		if arg_7_0 or var_0_0.GetCharacterHeroID(var_0_0.charaAtPos[iter_7_2]) ~= iter_7_3 then
			local var_7_2 = var_0_0.GenCharacter(iter_7_3, iter_7_2)

			var_0_0.SetPosOfCharacter(var_7_2, iter_7_2)
		end

		var_7_0[iter_7_2] = nil
	end

	for iter_7_4, iter_7_5 in pairs(var_7_0) do
		var_0_0.RemoveEntity(iter_7_5)
	end
end

function var_0_0.GenerateAttackHero(arg_8_0)
	if not arg_8_0 then
		local var_8_0, var_8_1 = IdolTraineeData:GetCurAttackHeroInfo()

		arg_8_0 = var_8_1
	end

	var_0_0.SetTrainingCharacter(arg_8_0)
end

function var_0_0.Exit(arg_9_0)
	var_0_0.entityManager:Clear()
	var_0_0.trainerEntityManager:Clear()
	var_0_0.competitionEntityManager:Clear()

	var_0_0.entityManager = nil
	var_0_0.trainerEntityManager = nil
	var_0_0.competitionEntityManager = nil
	var_0_0.cinemachineBrain = nil
	var_0_0.camera = nil
	var_0_0.walls = nil
	var_0_0.charaAtPos = nil

	arg_9_0.listener:RemoveAll()

	arg_9_0.listener = nil
end

function var_0_0.GenCharacter(arg_10_0, arg_10_1)
	if var_0_0.entityManager then
		local var_10_0 = DormData:GetHeroArchiveID(arg_10_0)

		return var_0_0.entityManager:Update(var_10_0, {
			complex = true,
			heroID = arg_10_0,
			archiveID = var_10_0,
			spawnAt = arg_10_1
		})
	end
end

function var_0_0.RemoveEntity(arg_11_0)
	local var_11_0 = var_0_0.entityManager

	if var_11_0 then
		local var_11_1 = var_11_0:Find(arg_11_0)

		if var_11_1 then
			var_11_0:Remove(var_11_1)
		end
	end
end

local var_0_4 = {
	"pos1",
	"pos2",
	"pos3",
	"pos4",
	"pos5"
}

function var_0_0.GetCharacterHeroID(arg_12_0)
	return nullable(DormUtils.GetEntityData(arg_12_0), "heroID")
end

function var_0_0.GetCharacterArchiveID(arg_13_0)
	return nullable(DormUtils.GetEntityData(arg_13_0), "archiveID")
end

function var_0_0.SetPosOfCharacter(arg_14_0, arg_14_1)
	local var_14_0 = var_0_0.charaAtPos[arg_14_1]

	if var_14_0 then
		local var_14_1 = var_0_0.GetCharacterHeroID(var_14_0)
		local var_14_2 = DormData:GetHeroTemplateInfo(var_14_1)

		var_0_0.entityManager:Remove(var_0_0.GetCharacterArchiveID(var_14_0))
		var_14_2:GoToDance(nil)
	end

	var_0_0.charaAtPos[arg_14_1] = arg_14_0
	DormUtils.GetEntityData(arg_14_0).pos = arg_14_1

	if arg_14_0 and Dorm.DormEntityManager.IsValidEntityID(arg_14_0) then
		Dorm.DormEntityManager.ChangeEntityAnimeScheme(arg_14_0, var_0_4[arg_14_1])
		Dorm.DormEntityManager.SetNextIdleNoCrossFade(arg_14_0, true)
		Dorm.DormEntityManager.StopAllCmd(arg_14_0)
	end

	local var_14_3 = var_0_0.GetCharacterHeroID(arg_14_0)

	DormData:GetHeroTemplateInfo(var_14_3):GoToDance(arg_14_1)
end

function var_0_0.SetPosOfHero(arg_15_0, arg_15_1)
	local var_15_0 = DormData:GetHeroTemplateInfo(arg_15_0)

	var_15_0:GoToDance(arg_15_1)

	return var_15_0
end

function var_0_0.RemoveHero(arg_16_0)
	DormData:GetHeroTemplateInfo(arg_16_0):GoToDance(nil)
	manager.notify:Invoke(DORM_REFRESH_HERO_DEPLOY_LIST)
end

function var_0_0.GetPosByCharacter(arg_17_0)
	return nullable(DormUtils.GetEntityData(arg_17_0), "pos")
end

function var_0_0.SetTrainingCharacter(arg_18_0)
	if var_0_0.trainerEntityManager then
		local var_18_0 = DormData:GetHeroArchiveID(arg_18_0)

		return var_0_0.trainerEntityManager:Update(1, {
			complex = true,
			spawnAt = "training",
			heroID = arg_18_0,
			archiveID = var_18_0
		})
	end
end

function var_0_0.RemoveTrainingCharacter()
	if var_0_0.trainerEntityManager then
		var_0_0.trainerEntityManager:Clear()
	end
end

function var_0_0.SetCompetitionCharacter(arg_20_0, arg_20_1)
	if var_0_0.competitionEntityManager then
		local var_20_0 = DormData:GetHeroArchiveID(arg_20_0)

		return var_0_0.competitionEntityManager:Update(arg_20_1, {
			complex = true,
			heroID = arg_20_0,
			archiveID = var_20_0,
			spawnAt = "competition" .. arg_20_1
		})
	end
end

function var_0_0.RemoveCompetitionCharacter()
	if var_0_0.competitionEntityManager then
		var_0_0.competitionEntityManager:Clear()
	end
end

function var_0_0.SetVCamActive(arg_22_0, arg_22_1)
	local var_22_0 = var_0_0.camera[arg_22_0]

	SetActive(var_22_0, arg_22_1)
end

function var_0_0.OnFinishStory()
	Dorm.LuaBridge.MiniGameBridge.StopStory(true)

	if var_0_0.OnFinishStoryCallback then
		var_0_0.OnFinishStoryCallback()

		var_0_0.OnFinishStoryCallback = nil
	end
end

function var_0_0.OnTrainingStart(arg_24_0, arg_24_1)
	if (getData("IdolTrainee", "skip_show") or 0) == 1 then
		return
	end

	local var_24_0 = string.format("dorm_idol_train_prefab_type%02d", arg_24_1)
	local var_24_1 = nullable(GameDisplayCfg, var_24_0, "value")
	local var_24_2 = var_24_1[math.random(#var_24_1)]

	Dorm.LuaBridge.MiniGameBridge.PlayStory(var_24_2, {
		arg_24_0
	}, {
		var_0_1(arg_24_0)
	}, false)
end

return var_0_0
