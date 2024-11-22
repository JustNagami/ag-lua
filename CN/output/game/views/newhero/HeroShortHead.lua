local var_0_0 = class("HeroShortHead", ReduxView)

function var_0_0.OnCtor(arg_1_0, arg_1_1)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_1.transform

	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	arg_2_0:InitUI()
	arg_2_0:AddUIListener()
end

function var_0_0.InitUI(arg_3_0)
	arg_3_0:BindCfgUI()

	arg_3_0.lockedController_ = arg_3_0.controller_:GetController("lock")
	arg_3_0.selectedController_ = arg_3_0.controller_:GetController("selected")
	arg_3_0.favorController_ = arg_3_0.controller_:GetController("favor")
end

function var_0_0.SetRedPointEnable(arg_4_0, arg_4_1)
	SetActive(arg_4_0.noticePos_.gameObject, arg_4_1)
end

function var_0_0.SetProxy(arg_5_0, arg_5_1)
	arg_5_0.heroViewProxy_ = arg_5_1 or HeroViewDataProxy.New(HeroConst.HERO_DATA_TYPE.DEFAULT)
end

function var_0_0.SetHeroId(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
	arg_6_0.heroDataType = arg_6_2

	if arg_6_2 == HeroConst.HERO_DATA_TYPE.TRIAL then
		arg_6_1 = TempHeroData:GetHeroData(arg_6_1, arg_6_3).tempID
	end

	arg_6_0:SetHeroData(arg_6_1, arg_6_2)
end

function var_0_0.SetHeroData(arg_7_0, arg_7_1, arg_7_2)
	if arg_7_2 == HeroConst.HERO_DATA_TYPE.TRIAL or arg_7_2 == HeroConst.HERO_DATA_TYPE.CUSTOM then
		arg_7_0.trialID_ = arg_7_1
		arg_7_0.heroId_ = HeroStandardSystemCfg[arg_7_1].hero_id
		arg_7_1 = arg_7_0.heroId_
	else
		arg_7_0.heroId_ = arg_7_1
		arg_7_0.trialID_ = 0
	end

	arg_7_0.heroDataType_ = arg_7_2
	arg_7_0.heroCfg_ = HeroCfg[arg_7_1]
	arg_7_0.heroInfo_ = arg_7_0.heroViewProxy_:GetHeroData(arg_7_1)

	arg_7_0:UpdateView()

	if arg_7_0.heroViewProxy_:GetViewDataType() == HeroConst.HERO_DATA_TYPE.DEFAULT then
		local var_7_0 = RedPointConst.HERO_ID .. arg_7_1

		manager.redPoint:bindUIandKey(arg_7_0.noticePos_, var_7_0, {
			x = 0,
			y = 0
		})
	end

	if arg_7_0.favorController_ then
		if arg_7_0.heroViewProxy_.showfavorBtn then
			arg_7_0.favorController_:SetSelectedState(not HeroData:IsFavorite(arg_7_1) and "false" or "true")
		else
			arg_7_0.favorController_:SetSelectedState("false")
		end
	end
end

function var_0_0.UpdateView(arg_8_0)
	local var_8_0 = arg_8_0.heroViewProxy_:GetHeroUsingSkinInfo(arg_8_0.heroId_).id

	arg_8_0.headIcon_.sprite = HeroTools.GetHeadSprite(var_8_0)

	arg_8_0.headIcon_:SetNativeSize()

	arg_8_0.levelText_.text = tostring(arg_8_0.heroInfo_.level or 1)

	if arg_8_0:GetHeroUnLock() then
		arg_8_0.lockedController_:SetSelectedState("false")

		if arg_8_0.heroDataType_ == HeroConst.HERO_DATA_TYPE.PREVIEW or arg_8_0.heroDataType_ == HeroConst.HERO_DATA_TYPE.DRAW then
			SetActive(arg_8_0.lvGo_, false)
		end
	else
		arg_8_0.lockedController_:SetSelectedState("true")
	end
end

function var_0_0.GetHeroUnLock(arg_9_0)
	return arg_9_0.heroInfo_.unlock == 1
end

function var_0_0.SetUnlockDisplay(arg_10_0, arg_10_1)
	arg_10_0.lockedController_:SetSelectedState(arg_10_1 and "true" or "false")
end

function var_0_0.SetSelected(arg_11_0, arg_11_1)
	arg_11_0.selectedController_:SetSelectedState(arg_11_1 and "true" or "false")
end

function var_0_0.RegisterClickListener(arg_12_0, arg_12_1)
	arg_12_0.clickListener_ = arg_12_1
end

function var_0_0.AddUIListener(arg_13_0)
	arg_13_0:AddBtnListener(arg_13_0.selfBtn_, nil, function()
		arg_13_0:ClearNewHeroRed(arg_13_0.heroCfg_.id)

		if arg_13_0.clickListener_ ~= nil then
			arg_13_0.clickListener_(arg_13_0.heroCfg_.id)
		end
	end)
end

function var_0_0.ClearNewHeroRed(arg_15_0, arg_15_1)
	if arg_15_1 and arg_15_0.heroViewProxy_ and arg_15_0.heroViewProxy_:GetViewDataType() == HeroConst.HERO_DATA_TYPE.DEFAULT then
		HeroTools.SetHeroNewTagRed(arg_15_1, "unlockHero", RedPointConst.HERO_ID .. arg_15_1, false)
	end
end

function var_0_0.Dispose(arg_16_0)
	manager.redPoint:unbindUIandKey(arg_16_0.noticePos_)
	arg_16_0:RemoveAllListeners()

	arg_16_0.clickListener_ = nil

	var_0_0.super.Dispose(arg_16_0)
end

return var_0_0
