﻿local var_0_0 = class("MythicFinalTeamViewItem", ReduxView)

function var_0_0.OnCtor(arg_1_0, arg_1_1)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_0.gameObject_.transform

	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	arg_2_0:InitUI()
	arg_2_0:AddListeners()
end

function var_0_0.InitUI(arg_3_0)
	arg_3_0:BindCfgUI()

	arg_3_0.teamSwapController_ = ControllerUtil.GetController(arg_3_0.transform_, "place")
	arg_3_0.teamChangeController_ = ControllerUtil.GetController(arg_3_0.transform_, "change")
	arg_3_0.chipController_ = ControllerUtil.GetController(arg_3_0.chipbtnBtn_.transform, "name")
	arg_3_0.godUpController_ = ControllerUtil.GetController(arg_3_0.godupBtn_.transform, "name")
	arg_3_0.aoyiController_ = ControllerUtil.GetController(arg_3_0.aoyiBtn_.transform, "name")
	arg_3_0.heroHead_ = {}
	arg_3_0.heroHeadCon_ = {}

	for iter_3_0 = 1, 3 do
		arg_3_0.heroHead_[iter_3_0] = TeamHeroShortHead.New(arg_3_0["newherohead" .. iter_3_0 .. "Btn_"].gameObject)

		arg_3_0.heroHead_[iter_3_0]:SetProxy(HeroViewDataProxy.New(HeroConst.HERO_DATA_TYPE.DEFAULT))
		arg_3_0.heroHead_[iter_3_0]:SetRedPointEnable(false)

		arg_3_0.heroHeadCon_[iter_3_0] = ControllerUtil.GetController(arg_3_0["newherohead" .. iter_3_0 .. "Btn_"].transform, "switch")
	end
end

function var_0_0.AddListeners(arg_4_0)
	arg_4_0:AddBtnListener(arg_4_0.chipbtnBtn_, nil, function()
		if not MythicData:GetIsBattleIng() then
			arg_4_0:Go("/mythicSectionSelectHero", {
				section = arg_4_0.stageID_,
				sectionType = arg_4_0.stageType_,
				activityID = arg_4_0.activityID_,
				reserveParams = arg_4_0.cachedReserveParams_,
				stageType = arg_4_0.stageType_,
				stageID = arg_4_0.stageID_,
				teamLength = arg_4_0.teamLength_,
				teamID = arg_4_0.teamID_
			})
		end
	end)

	for iter_4_0 = 1, 3 do
		arg_4_0:AddBtnListener(arg_4_0["newherohead" .. iter_4_0 .. "Btn_"], nil, function()
			if not MythicData:GetIsBattleIng() then
				arg_4_0:Go("/mythicSectionSelectHero", {
					section = arg_4_0.stageID_,
					sectionType = arg_4_0.stageType_,
					activityID = arg_4_0.activityID_,
					reserveParams = arg_4_0.cachedReserveParams_,
					stageType = arg_4_0.stageType_,
					stageID = arg_4_0.stageID_,
					teamLength = arg_4_0.teamLength_,
					teamID = arg_4_0.teamID_
				})
			end
		end)
	end

	arg_4_0:AddBtnListener(arg_4_0.godupBtn_, nil, function()
		local var_7_0, var_7_1, var_7_2 = BattleTools.GetMaxRaceData(arg_4_0.heroList_)

		JumpTools.OpenPageByJump("sectionSelectRaceDescription", {
			raceID = var_7_0,
			sameCamp = var_7_2
		})
	end)
	arg_4_0:AddBtnListener(arg_4_0.aoyiBtn_, nil, function()
		JumpTools.OpenPageByJump("sectionComboSelect", {
			stageType = arg_4_0.stageType_,
			stageID = arg_4_0.stageID_,
			heroList = arg_4_0.heroList_,
			trialList = {
				0,
				0,
				0
			},
			comboSkillID = arg_4_0.comboSkillID_,
			targetSectionProxy = arg_4_0.sectionProxy_
		})
	end)
	arg_4_0:AddBtnListener(arg_4_0.changebtn_, nil, function()
		if not MythicData:GetIsBattleIng() and arg_4_0.changefunc_ then
			arg_4_0.changefunc_(arg_4_0.teamID_)
		end
	end)
	arg_4_0:AddBtnListener(arg_4_0.confirmbtn_, nil, function()
		if not MythicData:GetIsBattleIng() and arg_4_0.confirmfunc_ then
			arg_4_0.confirmfunc_(arg_4_0.teamID_)
		end
	end)
end

function var_0_0.RefreshUI(arg_11_0, arg_11_1, arg_11_2, arg_11_3)
	arg_11_0.teamLength_ = arg_11_3
	arg_11_0.teamID_ = arg_11_1
	arg_11_0.stageID_ = arg_11_2
	arg_11_0.stageType_ = BattleConst.STAGE_TYPE_NEW.MYTHIC_FINAL
	arg_11_0.reserveParams_ = ReserveParams.New(ReserveConst.RESERVE_TYPE.MYTHIC_FINAL, ReserveConst.MYTHIC_CONT_ID.FINAL_MULTI, arg_11_0.teamID_, {
		stageType = BattleConst.STAGE_TYPE_NEW.MYTHIC_FINAL,
		stageID = arg_11_2
	})
	arg_11_0.cachedReserveParams_ = ReserveParams.New(ReserveConst.RESERVE_TYPE.MYTHIC_FINAL_CACHE, ReserveConst.MYTHIC_CONT_ID.FINAL_MULTI, arg_11_0.teamID_, {
		stageType = BattleConst.STAGE_TYPE_NEW.MYTHIC_FINAL,
		stageID = arg_11_2
	})

	if not arg_11_0.sectionProxy_ then
		arg_11_0.sectionProxy_ = SectionSelectHeroTools.GetProxy({
			stageType = arg_11_0.stageType_,
			stageID = arg_11_0.stageID_
		}, arg_11_0.reserveParams_, HeroConst.HERO_DATA_TYPE.DEFAULT)
	else
		arg_11_0.sectionProxy_:Init({
			stageType = arg_11_0.stageType_,
			stageID = arg_11_0.stageID_
		}, arg_11_0.reserveParams_, HeroConst.HERO_DATA_TYPE.DEFAULT)
	end

	arg_11_0.heroList_, _, _, arg_11_0.heroTrialList_ = ReserveTools.GetHeroList(arg_11_0.reserveParams_)

	local var_11_0, var_11_1 = ReserveTools.GetMimirData(arg_11_0.reserveParams_)

	arg_11_0.comboSkillID_ = ReserveTools.GetComboSkillID(arg_11_0.reserveParams_)

	ReserveTools.SetTeam(arg_11_0.cachedReserveParams_, arg_11_0.heroList_, arg_11_0.heroTrialList_ or {}, arg_11_0.comboSkillID_, var_11_0, var_11_1)

	local var_11_2 = arg_11_0:GetRaceEffect()

	for iter_11_0 = 1, 3 do
		if arg_11_0.heroList_[iter_11_0] ~= 0 then
			arg_11_0.heroHead_[iter_11_0]:SetHeroId(arg_11_0.heroList_[iter_11_0])
			arg_11_0.heroHeadCon_[iter_11_0]:SetSelectedState("1")
		else
			arg_11_0.heroHeadCon_[iter_11_0]:SetSelectedState("0")
		end
	end

	if var_11_0 == 0 then
		arg_11_0.chipController_:SetSelectedState("false")
		SetActive(arg_11_0.subchip1Img_.gameObject, false)
		SetActive(arg_11_0.subchip2Img_.gameObject, false)
	else
		arg_11_0.chipController_:SetSelectedState("true")

		local var_11_3 = ChipCfg[var_11_0]

		arg_11_0.chipiconImg_.sprite = pureGetSpriteWithoutAtlas("TextureConfig/Managecat_s/" .. var_11_3.picture_id)

		for iter_11_1 = 1, 2 do
			if var_11_1[iter_11_1] then
				SetActive(arg_11_0["subchip" .. iter_11_1 .. "Img_"].gameObject, true)

				local var_11_4 = var_11_1[iter_11_1]

				arg_11_0["subchip" .. iter_11_1 .. "Img_"].sprite = getSpriteViaConfig("ChipSkillIcon", ChipCfg[var_11_4].picture_id)
			else
				SetActive(arg_11_0["subchip" .. iter_11_1 .. "Img_"].gameObject, false)
			end
		end
	end

	arg_11_0.godUpController_:SetSelectedState(var_11_2 == 0 and "off" or "on")
	arg_11_0.aoyiController_:SetSelectedState(arg_11_0.comboSkillID_ == 0 and "off" or "on")

	arg_11_0.bianduiText_.text = GetTips("TEAM_" .. arg_11_1)

	if MythicData:GetIsBattleIng() then
		arg_11_0.teamChangeController_:SetSelectedState("false")
	else
		arg_11_0.teamChangeController_:SetSelectedState("true")
	end
end

function var_0_0.GetRaceEffect(arg_12_0)
	local var_12_0 = {}
	local var_12_1 = 0
	local var_12_2 = false
	local var_12_3 = ReserveTools.GetHeroList(arg_12_0.reserveParams_)

	for iter_12_0, iter_12_1 in pairs(var_12_3) do
		if iter_12_1 ~= 0 then
			local var_12_4 = HeroCfg[iter_12_1].race

			var_12_0[var_12_4] = (var_12_0[var_12_4] or 0) + 1

			if var_12_0[var_12_4] == 2 then
				var_12_1 = var_12_4
			elseif var_12_0[var_12_4] == 3 then
				var_12_2 = true
			end
		end
	end

	return var_12_1, var_12_2, var_12_0[var_12_1] or 1
end

function var_0_0.OnChangeRefreshStatus(arg_13_0, arg_13_1)
	if arg_13_1 == arg_13_0.teamID_ then
		arg_13_0.teamSwapController_:SetSelectedState("select")
	else
		arg_13_0.teamSwapController_:SetSelectedState("change")
	end
end

function var_0_0.ResetState(arg_14_0)
	arg_14_0.teamSwapController_:SetSelectedState("off")
end

function var_0_0.RegionHandler(arg_15_0, arg_15_1, arg_15_2)
	arg_15_0.changefunc_ = arg_15_1
	arg_15_0.confirmfunc_ = arg_15_2
end

function var_0_0.Dispose(arg_16_0)
	for iter_16_0 = 1, 3 do
		arg_16_0.heroHead_[iter_16_0]:Dispose()
	end

	arg_16_0.changefunc_ = nil
	arg_16_0.confirmfunc_ = nil

	var_0_0.super.Dispose(arg_16_0)
end

return var_0_0
