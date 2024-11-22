local var_0_0 = singletonClass("DormCharacterManager")
local var_0_1 = (function(arg_1_0)
	return function(arg_2_0)
		return "CharDorm/" .. nullable(arg_1_0, nullable(arg_2_0, "heroSkinID"), "model")
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
end

function var_0_0.RecordEntityInfo(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = Dorm.storage
	local var_7_1 = DormEnum.Namespace.EntityType

	var_7_0:RecordData(var_7_1, arg_7_1, var_0_3)
end

function var_0_0.RemoveEntityInfo(arg_8_0, arg_8_1)
	local var_8_0 = Dorm.storage
	local var_8_1 = DormEnum.Namespace.EntityType

	var_8_0:RecordData(var_8_1, arg_8_1, nil)
	arg_8_0:OnCharaGrabReleased(arg_8_1)
end

function var_0_0.Init(arg_9_0)
	arg_9_0:RegisterEvent()

	arg_9_0.dormHeroAI = DormHeroAI.GetInstance()

	arg_9_0.dormHeroAI:Init()
	arg_9_0.entityManager:Clear()
	arg_9_0.entityManager:MapToDormStorageData(DormUtils.EIdNamespace(var_0_3), DormUtils.IdxNamespace(var_0_3))
end

function var_0_0.Reset(arg_10_0)
	arg_10_0:RemoveEvent()
	arg_10_0.dormHeroAI:Dispose()
	arg_10_0:Clear()
end

function var_0_0.RegisterEvent(arg_11_0)
	arg_11_0.listener:Register(ON_DORM_CHARACTER_GRAB_STARTED, handler(arg_11_0, arg_11_0.OnCharaGrabStart))
	arg_11_0.listener:Register(ON_DORM_CHARACTER_GRAB_RELEASED, handler(arg_11_0, arg_11_0.OnCharaGrabReleased))
end

function var_0_0.RemoveEvent(arg_12_0)
	arg_12_0.listener:RemoveAll()
end

function var_0_0.OnBeginStory(arg_13_0, arg_13_1)
	if DormEnum.HasFlag(arg_13_1, DormEnum.BeginStoryFlag.HideCharacter) then
		arg_13_0:Clear()
	end
end

function var_0_0.OnFinishStory(arg_14_0, arg_14_1)
	if DormEnum.HasFlag(arg_14_1, DormEnum.BeginStoryFlag.HideCharacter) then
		DormHeroTools:GenerateHeroWhenEnterScene()
	end
end

function var_0_0.Generate(arg_15_0, arg_15_1, arg_15_2)
	local var_15_0, var_15_1 = arg_15_0.entityManager:Update(arg_15_1, {
		heroSkinID = arg_15_1,
		skipFade = arg_15_2
	}, {
		cfgID = arg_15_1,
		heroID = nullable(BackHomeHeroSkinCfg, arg_15_1, "hero_id")
	})

	Dorm.DormEntityManager.SetEntitySpeed(var_15_0, 0.5)

	return var_15_0, var_15_1
end

function var_0_0.Remove(arg_16_0, arg_16_1)
	return arg_16_0.entityManager:Remove(arg_16_1)
end

function var_0_0.Clear(arg_17_0)
	arg_17_0.entityManager:Clear()
end

function var_0_0.FindAndRemove(arg_18_0)
	local var_18_0 = var_0_0.GetInstance()

	EntityManager.FindAndRemoveEntity({
		var_18_0.entityManager
	}, arg_18_0)
end

var_0_0.curGrabbingInfoNamespace = "dorm.curGrabbing"

function var_0_0.OnCharaGrabStart(arg_19_0, arg_19_1)
	local var_19_0 = var_0_0.curGrabbingInfoNamespace
	local var_19_1 = Dorm.storage:GetData(var_19_0, "eid")

	Dorm.storage:RecordData(var_19_0, "eid", arg_19_1)
	manager.notify:Invoke(DORM_CUR_GRABBING_CHARACTER_CHANGE, var_19_1, arg_19_1)
end

function var_0_0.OnCharaGrabReleased(arg_20_0, arg_20_1)
	local var_20_0 = var_0_0.curGrabbingInfoNamespace

	if Dorm.storage:GetData(var_20_0, "eid") == arg_20_1 then
		Dorm.storage:RecordData(var_20_0, "eid", nil)
		manager.notify:Invoke(DORM_CUR_GRABBING_CHARACTER_CHANGE, arg_20_1, nil)
	end
end

function var_0_0.GetCharacterNum(arg_21_0)
	return arg_21_0.entityManager.managedEntityNum
end

return var_0_0
