local var_0_0 = class("SectionSelectHeroInfo")

function var_0_0.Ctor(arg_1_0)
	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	arg_2_0.heroID = 0
	arg_2_0.trialID = 0
	arg_2_0.isPosLock = false
	arg_2_0.isHeroLock = false
	arg_2_0.heroDataType = HeroConst.HERO_DATA_TYPE.DEFAULT
	arg_2_0.heroViewProxy = HeroViewDataProxy.New(arg_2_0.heroDataType)
	arg_2_0.isAssistant = false
	arg_2_0.assistantInfo = {}
end

function var_0_0.SetData(arg_3_0, arg_3_1, arg_3_2, arg_3_3, arg_3_4)
	arg_3_0.heroID = arg_3_1 or 0
	arg_3_0.trialID = arg_3_2 or 0
	arg_3_0.isPosLock = arg_3_3 or false
	arg_3_0.isHeroLock = arg_3_4 or false
end

function var_0_0.SetHeroDataType(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.heroDataType = arg_4_1 or HeroConst.HERO_DATA_TYPE.DEFAULT
	arg_4_0.heroViewProxy = arg_4_2 or HeroViewDataProxy.New(arg_4_0.heroDataType)
end

function var_0_0.SetAssistantInfo(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0.isAssistant = arg_5_1 == true
	arg_5_0.assistantInfo = arg_5_2
end

function var_0_0.GetHeroPower(arg_6_0)
	return arg_6_0.heroViewProxy:GetBattlePower(arg_6_0.heroID)
end

function var_0_0.GetSkinCfg(arg_7_0)
	return arg_7_0.heroViewProxy:GetHeroUsingSkinInfo(arg_7_0.heroID, {
		arg_7_0.trialID
	})
end

function var_0_0.GetHeroHP(arg_8_0, arg_8_1, arg_8_2, arg_8_3)
	local var_8_0 = 1
	local var_8_1 = 100

	return var_8_0, var_8_1
end

return var_0_0
