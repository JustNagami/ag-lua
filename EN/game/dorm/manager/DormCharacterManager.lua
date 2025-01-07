local var_0_0 = singletonClass("DormCharacterManager")
local var_0_1 = (function(arg_1_0)
	return function(arg_2_0)
		local var_2_0

		if arg_2_0.skinOverride then
			var_2_0 = arg_2_0.skinOverride
		else
			var_2_0 = nullable(arg_1_0, nullable(arg_2_0, "heroSkinID"), "model")
		end

		return "CharDorm/" .. var_2_0
	end
end)(BackHomeHeroSkinCfg)
local var_0_2 = 1.25
local var_0_3 = DormEnum.CharacterType.DormNormalHero

function var_0_0.Ctor(arg_3_0)
	arg_3_0.listener = EventListener.New()

	local var_3_0 = EntityManager.CreatePlayer.New(var_0_1)
	local var_3_1 = EntityManager.New(var_3_0)

	function var_3_1.OnCreate(arg_4_0, arg_4_1, arg_4_2)
		local var_4_0 = nullable(BackHomeHeroSkinCfg, nullable(arg_4_2, "heroSkinID"), "default_mouth") or 0

		Dorm.DormEntityManager.SetDefaultMouth(arg_4_1, var_4_0)

		if not arg_4_2.skipFade then
			Dorm.DormEntityManager.StartFadeInCMD(arg_4_1, var_0_2, function()
				DormUtils.ShowCharaSpecialVfx(arg_4_1, Dorm.charaVfxActiveType)
			end)
		else
			DormUtils.ShowCharaSpecialVfx(arg_4_1, Dorm.charaVfxActiveType)
		end

		arg_3_0:RecordEntityInfo(arg_4_1, arg_4_2)
		arg_3_0.dormHeroAI:AddCharacterAI(arg_4_1)
	end

	function var_3_1.OnRemove(arg_6_0, arg_6_1)
		arg_3_0.dormHeroAI:RemoveCharacterAI(arg_6_1)
		arg_3_0:RemoveEntityInfo(arg_6_1)
		manager.notify:Invoke(DORM_CHARACTER_DISPOSE, arg_6_1, var_0_3)
	end

	arg_3_0.entityManager = var_3_1

	arg_3_0:InitVisitEntityManager(var_3_0)
end

function var_0_0.InitVisitEntityManager(arg_7_0, arg_7_1)
	local var_7_0 = EntityManager.New(arg_7_1)

	function var_7_0.OnCreate(arg_8_0, arg_8_1, arg_8_2)
		local var_8_0 = nullable(BackHomeHeroSkinCfg, nullable(arg_8_2, "heroSkinID"), "default_mouth") or 0

		Dorm.DormEntityManager.SetDefaultMouth(arg_8_1, var_8_0)

		if not arg_8_2.skipFade then
			Dorm.DormEntityManager.StartFadeInCMD(arg_8_1, var_0_2, function()
				DormUtils.ShowCharaSpecialVfx(arg_8_1, Dorm.charaVfxActiveType)
			end)
		else
			DormUtils.ShowCharaSpecialVfx(arg_8_1, Dorm.charaVfxActiveType)
		end

		arg_7_0:RecordEntityInfo(arg_8_1, arg_8_2)
		arg_7_0.dormHeroAI:AddCharacterAI(arg_8_1)
	end

	function var_7_0.OnRemove(arg_10_0, arg_10_1)
		arg_7_0.dormHeroAI:RemoveCharacterAI(arg_10_1)
		arg_7_0:RemoveEntityInfo(arg_10_1)
		manager.notify:Invoke(DORM_CHARACTER_DISPOSE, arg_10_1, var_0_3)
	end

	arg_7_0.visitEntityManager = var_7_0
end

function var_0_0.RecordEntityInfo(arg_11_0, arg_11_1, arg_11_2)
	local var_11_0 = Dorm.storage
	local var_11_1 = DormEnum.Namespace.EntityType

	var_11_0:RecordData(var_11_1, arg_11_1, var_0_3)
end

function var_0_0.RemoveEntityInfo(arg_12_0, arg_12_1)
	local var_12_0 = Dorm.storage
	local var_12_1 = DormEnum.Namespace.EntityType

	var_12_0:RecordData(var_12_1, arg_12_1, nil)
	arg_12_0:OnCharaGrabReleased(arg_12_1)
end

function var_0_0.Init(arg_13_0)
	arg_13_0:RegisterEvent()

	arg_13_0.dormHeroAI = DormHeroAI.GetInstance()

	arg_13_0.dormHeroAI:Init()
	arg_13_0.entityManager:Clear()
	arg_13_0.entityManager:MapToDormStorageData(DormUtils.EIdNamespace(var_0_3), DormUtils.IdxNamespace(var_0_3))
	arg_13_0.visitEntityManager:Clear()
end

function var_0_0.Reset(arg_14_0)
	arg_14_0:RemoveEvent()
	arg_14_0.dormHeroAI:Dispose()
	arg_14_0:Clear()
end

function var_0_0.RegisterEvent(arg_15_0)
	arg_15_0.listener:Register(ON_DORM_CHARACTER_GRAB_STARTED, handler(arg_15_0, arg_15_0.OnCharaGrabStart))
	arg_15_0.listener:Register(ON_DORM_CHARACTER_GRAB_RELEASED, handler(arg_15_0, arg_15_0.OnCharaGrabReleased))
	arg_15_0.listener:Register(DORM_REGENERATE_HERO, handler(arg_15_0, arg_15_0.OnDormRegenerateHero))
end

function var_0_0.RemoveEvent(arg_16_0)
	arg_16_0.listener:RemoveAll()
end

function var_0_0.OnBeginStory(arg_17_0, arg_17_1)
	if DormEnum.HasFlag(arg_17_1, DormEnum.BeginStoryFlag.HideCharacter) then
		arg_17_0:Clear()
	end
end

function var_0_0.OnFinishStory(arg_18_0, arg_18_1)
	if DormEnum.HasFlag(arg_18_1, DormEnum.BeginStoryFlag.HideCharacter) then
		DormHeroTools:GenerateHeroWhenEnterScene()
	end
end

function var_0_0.Generate(arg_19_0, arg_19_1, arg_19_2, arg_19_3, arg_19_4)
	arg_19_3 = arg_19_3 or {}
	arg_19_3.heroSkinID, arg_19_3.skipFade = arg_19_3.heroSkinID or arg_19_1, arg_19_2
	arg_19_4 = arg_19_4 or {}
	arg_19_4.cfgID, arg_19_4.heroID = arg_19_3.heroSkinID, nullable(BackHomeHeroSkinCfg, arg_19_3.heroSkinID, "hero_id")

	local var_19_0, var_19_1 = arg_19_0.entityManager:Update(arg_19_1, arg_19_3, arg_19_4)

	Dorm.DormEntityManager.SetEntitySpeed(var_19_0, 0.5)

	return var_19_0, var_19_1
end

function var_0_0.GenerateVisit(arg_20_0, arg_20_1, arg_20_2)
	local var_20_0 = {}

	var_20_0.heroSkinID, var_20_0.skipFade = arg_20_1, arg_20_2

	local var_20_1, var_20_2 = arg_20_0.visitEntityManager:Update(arg_20_1, var_20_0, {
		cfgID = arg_20_1,
		heroID = nullable(BackHomeHeroSkinCfg, arg_20_1, "hero_id")
	})

	Dorm.DormEntityManager.SetEntitySpeed(var_20_1, 0.5)
	DormHeroTools:ShowVisitTalk()

	return var_20_1, var_20_2
end

function var_0_0.RemoveVisit(arg_21_0, arg_21_1)
	return arg_21_0.visitEntityManager:Remove(arg_21_1)
end

function var_0_0.CheckIsVisitHero(arg_22_0, arg_22_1)
	return arg_22_0.visitEntityManager and arg_22_0.visitEntityManager:Find(arg_22_1) ~= nil
end

function var_0_0.GetVisitEntityID(arg_23_0, arg_23_1)
	return arg_23_0.visitEntityManager:GetEntityID(arg_23_1)
end

function var_0_0.Remove(arg_24_0, arg_24_1)
	return arg_24_0.entityManager:Remove(arg_24_1)
end

function var_0_0.GetEntityID(arg_25_0, arg_25_1)
	return arg_25_0.entityManager:GetEntityID(arg_25_1)
end

function var_0_0.Clear(arg_26_0)
	arg_26_0.entityManager:Clear()
	arg_26_0.visitEntityManager:Clear()
end

function var_0_0.FindAndRemove(arg_27_0)
	local var_27_0 = var_0_0.GetInstance()

	EntityManager.FindAndRemoveEntity({
		var_27_0.entityManager
	}, arg_27_0)
end

var_0_0.curGrabbingInfoNamespace = "dorm.curGrabbing"

function var_0_0.OnCharaGrabStart(arg_28_0, arg_28_1)
	local var_28_0 = var_0_0.curGrabbingInfoNamespace
	local var_28_1 = Dorm.storage:GetData(var_28_0, "eid")

	Dorm.storage:RecordData(var_28_0, "eid", arg_28_1)
	manager.notify:Invoke(DORM_CUR_GRABBING_CHARACTER_CHANGE, var_28_1, arg_28_1)
end

function var_0_0.OnCharaGrabReleased(arg_29_0, arg_29_1)
	local var_29_0 = var_0_0.curGrabbingInfoNamespace

	if Dorm.storage:GetData(var_29_0, "eid") == arg_29_1 then
		Dorm.storage:RecordData(var_29_0, "eid", nil)
		manager.notify:Invoke(DORM_CUR_GRABBING_CHARACTER_CHANGE, arg_29_1, nil)
	end
end

function var_0_0.GetCharacterNum(arg_30_0)
	return arg_30_0.entityManager.managedEntityNum
end

function var_0_0.OnDormRegenerateHero(arg_31_0)
	DormHeroTools:ReGenerateDormHeroEntity()
end

return var_0_0
