local var_0_0 = class("HeroInfoView", ReduxView)

function var_0_0.OnCtor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.oldAtt_ = {}
	arg_1_0.tweens_ = {}
	arg_1_0.handler_ = arg_1_1
	arg_1_0.gameObject_ = arg_1_2
	arg_1_0.transform_ = arg_1_2.transform

	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	arg_2_0:InitUI()
	arg_2_0:AddUIListener()
end

function var_0_0.InitUI(arg_3_0)
	arg_3_0:BindCfgUI()

	arg_3_0.moduleImg_.immediate = true
	arg_3_0.lockController_ = arg_3_0.controller_:GetController("lock")
	arg_3_0.pieceEnoughController_ = arg_3_0.controller_:GetController("pieceEnough")
	arg_3_0.isSelfController_ = arg_3_0.controller_:GetController("isSelf")
	arg_3_0.levelStateController_ = arg_3_0.controller_:GetController("levelState")
	arg_3_0.moduleController_ = arg_3_0.controller_:GetController("module")
	arg_3_0.polyhedronController_ = arg_3_0.controller_:GetController("polyhedron")
	arg_3_0.propNames_ = {
		arg_3_0.propName1_,
		arg_3_0.propName2_,
		arg_3_0.propName3_,
		arg_3_0.propName4_
	}
	arg_3_0.propItems_ = {
		arg_3_0.propNum1_,
		arg_3_0.propNum2_,
		arg_3_0.propNum3_,
		arg_3_0.propNum4_
	}
	arg_3_0.propIcon_ = {
		arg_3_0.propIcon1_,
		arg_3_0.propIcon2_,
		arg_3_0.propIcon3_,
		arg_3_0.propIcon4_
	}
	arg_3_0.propIndexes_ = {
		HeroConst.HERO_ATTRIBUTE.ATK,
		HeroConst.HERO_ATTRIBUTE.ARM,
		HeroConst.HERO_ATTRIBUTE.STA,
		HeroConst.HERO_ATTRIBUTE.CRITICAL
	}
	arg_3_0.endfixes_ = {}

	for iter_3_0 = 1, 4 do
		local var_3_0, var_3_1, var_3_2 = SkillTools.GetAttr({
			arg_3_0.propIndexes_[iter_3_0],
			0
		})

		arg_3_0.propNames_[iter_3_0].text = GetI18NText(var_3_0)
		arg_3_0.propIcon_[iter_3_0].sprite = var_3_2
		arg_3_0.endfixes_[iter_3_0] = PublicAttrCfg[arg_3_0.propIndexes_[iter_3_0]].percent == 1 and "%" or ""
	end
end

function var_0_0.AddUIListener(arg_4_0)
	if arg_4_0.surpassBtn_ then
		arg_4_0:AddBtnListener(arg_4_0.surpassBtn_, nil, function()
			JumpTools.OpenPageByJump("/heroSurpass", {
				heroId = arg_4_0.heroInfo_.id
			})
		end)
	end

	if arg_4_0.surpass01Btn_ then
		arg_4_0:AddBtnListener(arg_4_0.surpass01Btn_, nil, function()
			JumpTools.OpenPageByJump("/heroSurpass", {
				heroId = arg_4_0.heroInfo_.id
			})
		end)
	end

	arg_4_0:AddBtnListener(arg_4_0.checkBtn_, nil, function()
		JumpTools.OpenPageByJump("/heroPreviewMain", {
			isEnter = true,
			hid = arg_4_0.heroInfo_.id
		})
	end)
	arg_4_0:AddBtnListener(arg_4_0.getBtn_, nil, function()
		local var_8_0 = arg_4_0:GetHeroPiece()
		local var_8_1 = arg_4_0.heroCfg_.rare

		if var_8_0 < GameSetting.unlock_hero_need.value[var_8_1] then
			ShowPopItem(POP_SOURCE_ITEM, {
				ItemCfg[arg_4_0.heroCfg_.id].fragment
			})
		else
			manager.net:SendWithLoadingNew(14016, {
				id = arg_4_0.heroCfg_.id
			}, 14017, handler(arg_4_0, arg_4_0.OnUnlockHero))
		end
	end)

	if arg_4_0.upgradeBtn_ then
		arg_4_0:AddBtnListener(arg_4_0.upgradeBtn_, nil, function()
			JumpTools.OpenPageByJump("/heroUpgrade", {
				heroId = arg_4_0.heroInfo_.id,
				proxy = arg_4_0.heroViewProxy_
			})
		end)
	end

	arg_4_0:AddBtnListener(arg_4_0.campBgBtn_, nil, function()
		JumpTools.OpenPageByJump("sectionSelectRaceDescription")
	end)
	arg_4_0:AddBtnListener(arg_4_0.buttonHeroAttribute_, nil, function()
		JumpTools.OpenPageByJump("heroAttribute", {
			heroID = arg_4_0.heroInfo_.id,
			proxy = arg_4_0.heroViewProxy_
		})
	end)
	arg_4_0:AddBtnListener(arg_4_0.moduleView_, nil, function()
		OperationRecorder.RecordButtonTouch("hero_attribute_module")

		if not arg_4_0.heroViewProxy_.isSelf then
			return
		end

		if WeaponModuleCfg[arg_4_0.heroInfo_.id] then
			JumpTools.OpenPageByJump("/weaponModuleView", {
				heroID = arg_4_0.heroInfo_.id
			})
		end
	end)
	arg_4_0:AddBtnListener(arg_4_0.proficiencyBtn_, nil, function()
		if arg_4_0.openContent_ then
			arg_4_0.openContent_ = false
		else
			arg_4_0.openContent_ = true
		end

		SetActive(arg_4_0.comTipsGo_, arg_4_0.openContent_)
		SetActive(arg_4_0.proficiencyMaskBtn_.gameObject, arg_4_0.openContent_)

		arg_4_0.comTipsNumText_.text = HeroTools.GetHeroProficiency(arg_4_0.heroInfo_.id) .. "/" .. GameSetting.mastery_level_max.value[1]
	end)
	arg_4_0:AddBtnListener(arg_4_0.proficiencyMaskBtn_, nil, function()
		arg_4_0.openContent_ = false

		SetActive(arg_4_0.comTipsGo_, arg_4_0.openContent_)
		SetActive(arg_4_0.proficiencyMaskBtn_.gameObject, arg_4_0.openContent_)
	end)
end

function var_0_0.OnUnlockHero(arg_15_0, arg_15_1, arg_15_2)
	if isSuccess(arg_15_1.result) then
		HeroAction.UnlockHeroSuccess(arg_15_0.heroCfg_.id)
		gameContext:Go("obtainView", {
			itemList = {
				arg_15_0.heroCfg_
			}
		})
	end
end

function var_0_0.SetHeroInfo(arg_16_0, arg_16_1)
	arg_16_0.oldBattlePower_ = arg_16_0.battlePower_ or 0
	arg_16_0.oldAtt_ = arg_16_0.att_ or {}
	arg_16_0.heroInfo_ = arg_16_1
	arg_16_0.heroCfg_ = HeroCfg[arg_16_1.id]
	arg_16_0.curLv_ = arg_16_0.heroInfo_.level
	arg_16_0.curLvMax_ = HeroTools.GetHeroCurrentMaxLevel(arg_16_0.heroInfo_)
end

function var_0_0.UpdateView(arg_17_0)
	arg_17_0.openContent_ = false

	SetActive(arg_17_0.comTipsGo_, arg_17_0.openContent_)
	SetActive(arg_17_0.proficiencyMaskBtn_.gameObject, arg_17_0.openContent_)

	arg_17_0.nameText_.text = GetI18NText(arg_17_0.heroCfg_.name)
	arg_17_0.subNameText_.text = GetI18NText(arg_17_0.heroCfg_.suffix)

	local var_17_0 = arg_17_0.heroInfo_.unlock ~= 0 or arg_17_0.type_ == HeroConst.HERO_DATA_TYPE.PREVIEW

	arg_17_0.lockController_:SetSelectedState(tostring(not var_17_0))
	arg_17_0.isSelfController_:SetSelectedState(tostring(not arg_17_0.heroViewProxy_.isSelf))
	arg_17_0.polyhedronController_:SetSelectedState(tostring(arg_17_0.type_ == HeroConst.HERO_DATA_TYPE.POLYHEDRON))

	arg_17_0.campLogo_.sprite = HeroTools.GetRaceIcon(arg_17_0.heroCfg_.race)
	arg_17_0.attackType_.sprite = HeroTools.GetHeroSkillAttributeIcon(arg_17_0.heroCfg_.id)

	if arg_17_0.heroInfo_.unlock == 0 then
		arg_17_0:UpdateLockedView()
	else
		arg_17_0:UpdateUnlockedView()

		if arg_17_0.type_ == HeroConst.HERO_DATA_TYPE.DEFAULT then
			local var_17_1 = arg_17_0.heroCfg_.id

			ArchiveAction.CheckAllRelationRedPoint(var_17_1)
		end
	end

	if arg_17_0.heroViewProxy_.showRedPoint then
		if not isNil(arg_17_0.moduleView_) and not isNil(arg_17_0.moduleView_.transform) then
			manager.redPoint:bindUIandKey(arg_17_0.moduleView_.transform, RedPointConst.WEAPON_MODULE_UNLOCK .. "_" .. arg_17_0.heroInfo_.id)
		end

		manager.redPoint:bindUIandKey(arg_17_0.surpassBtn_.transform, RedPointConst.HERO_STAR_ID .. arg_17_0.heroInfo_.id)
		manager.redPoint:bindUIandKey(arg_17_0.surpass01Btn_.transform, RedPointConst.HERO_STAR_ID .. arg_17_0.heroInfo_.id)
		manager.redPoint:bindUIandKey(arg_17_0.upgradeBtn_.transform, RedPointConst.HERO_BREAK_ID .. arg_17_0.heroInfo_.id)
	end
end

function var_0_0.GetHeroPiece(arg_18_0)
	return arg_18_0.heroInfo_.piece
end

function var_0_0.UpdateLockedView(arg_19_0)
	local var_19_0 = arg_19_0:GetHeroPiece()
	local var_19_1 = arg_19_0.heroCfg_.rare
	local var_19_2 = GameSetting.unlock_hero_need.value[var_19_1]
	local var_19_3 = math.min(var_19_0, var_19_2)

	arg_19_0.pieceCost_ = -var_19_2
	arg_19_0.curPieceText_.text = tostring(var_19_0)
	arg_19_0.needPieceText_.text = "/" .. tostring(var_19_2)

	if arg_19_0.tweenValue_ then
		LeanTween.cancel(arg_19_0.tweenValue_.id)

		arg_19_0.tweenValue_ = nil
	end

	arg_19_0.tweenValue_ = LeanTween.value(0, 0.7, 0.7):setOnUpdate(LuaHelper.FloatAction(function(arg_20_0)
		local var_20_0 = 0

		if arg_20_0 >= 0.2 then
			var_20_0 = (arg_20_0 - 0.2) / 0.5
		end

		arg_19_0.scheduleImage_.fillAmount = var_19_3 * var_20_0 / var_19_2
	end)):setOnComplete(LuaHelper.VoidAction(function()
		if arg_19_0.tweenValue_ then
			arg_19_0.tweenValue_:setOnUpdate(nil):setOnComplete(nil):setEase(nil)

			arg_19_0.tweenValue_ = nil
		end

		arg_19_0.scheduleImage_.fillAmount = var_19_3 / var_19_2
	end)):setEase(LeanTweenType.easeOutQuad)

	if var_19_2 <= var_19_0 then
		arg_19_0.pieceEnoughController_:SetSelectedState("true")

		arg_19_0.getText_.text = GetTips("DORM_CANTEEN_LEVEL_UNLOCK")
	else
		arg_19_0.pieceEnoughController_:SetSelectedState("false")

		arg_19_0.getText_.text = GetTips("TIP_GET")
	end
end

function var_0_0.UpdateModuleView(arg_22_0)
	SetActive(arg_22_0.moduleView_.gameObject, WeaponModuleCfg[arg_22_0.heroInfo_.id] and not arg_22_0.heroViewProxy_.hideModule)

	if WeaponModuleCfg[arg_22_0.heroInfo_.id] then
		local var_22_0 = arg_22_0.heroInfo_.moduleLevel

		if var_22_0 == 0 then
			arg_22_0.moduleController_:SetSelectedState("lock")
		else
			arg_22_0.moduleController_:SetSelectedState("unlock")

			arg_22_0.moduleNameText_.text = WeaponModuleCfg[arg_22_0.heroInfo_.id].name
			arg_22_0.moduleImg_.spriteSync = "TextureConfig/WeaponModule/" .. arg_22_0.heroInfo_.id
			arg_22_0.moduleLevelText_.text = "Lv." .. var_22_0
		end
	end
end

function var_0_0.UpdateUnlockedView(arg_23_0)
	if arg_23_0.type_ ~= HeroConst.HERO_DATA_TYPE.PREVIEW then
		if arg_23_0.type_ == HeroConst.HERO_DATA_TYPE.DEFAULT then
			arg_23_0.proficiencyText_.text = HeroTools.GetHeroProficiency(arg_23_0.heroInfo_.id) .. "/" .. GameSetting.mastery_level_max.value[1]
		end

		local var_23_0 = arg_23_0.heroInfo_.level
		local var_23_1 = arg_23_0.heroInfo_.exp

		arg_23_0.battlePower_ = arg_23_0.heroViewProxy_:GetBattlePower(arg_23_0.heroInfo_.id, arg_23_0.heroInfo_.tempID)

		if arg_23_0.battlePowerTween_ then
			LeanTween.cancel(arg_23_0.battlePowerTween_.id)

			arg_23_0.battlePowerTween_ = nil
		end

		if arg_23_0.oldBattlePower_ ~= arg_23_0.battlePower_ then
			local var_23_2 = arg_23_0.oldBattlePower_ or 0
			local var_23_3 = arg_23_0.battlePower_

			arg_23_0.battlePowerTween_ = LeanTween.value(0, 1, 0.5):setOnUpdate(LuaHelper.FloatAction(function(arg_24_0)
				local var_24_0 = var_23_2
				local var_24_1 = var_23_3
				local var_24_2 = math.floor(var_24_0 + (var_24_1 - var_24_0) * arg_24_0)

				arg_23_0.fightPowerText_.text = var_24_2
			end)):setOnComplete(LuaHelper.VoidAction(function()
				if arg_23_0.battlePowerTween_ then
					arg_23_0.battlePowerTween_:setOnUpdate(nil):setOnComplete(nil):setEase(nil)

					arg_23_0.battlePowerTween_ = nil
				end

				arg_23_0.fightPowerText_.text = var_23_3
			end)):setEase(LeanTweenType.easeOutQuad)
			arg_23_0.oldBattlePower_ = arg_23_0.battlePower_
		else
			arg_23_0.fightPowerText_.text = arg_23_0.oldBattlePower_
		end

		local var_23_4 = HeroTools.GetHeroCurrentMaxLevel(arg_23_0.heroInfo_)
		local var_23_5 = var_23_1 - LvTools.LevelToExp(var_23_0, "hero_level_exp1")

		arg_23_0.att_ = arg_23_0.heroViewProxy_:GetHeroAllAttribute(arg_23_0.heroInfo_.id)

		for iter_23_0, iter_23_1 in pairs(arg_23_0.propItems_) do
			local var_23_6 = PublicAttrCfg[arg_23_0.propIndexes_[iter_23_0]].percent == 1

			if arg_23_0.oldAtt_[arg_23_0.propIndexes_[iter_23_0]] ~= arg_23_0.att_[arg_23_0.propIndexes_[iter_23_0]] then
				local var_23_7 = arg_23_0.oldAtt_[arg_23_0.propIndexes_[iter_23_0]] or 0
				local var_23_8 = arg_23_0.att_[arg_23_0.propIndexes_[iter_23_0]]

				if arg_23_0.tweens_[iter_23_0] then
					LeanTween.cancel(arg_23_0.tweens_[iter_23_0].id)

					arg_23_0.tweens_[iter_23_0] = nil
				end

				arg_23_0.tweens_[iter_23_0] = LeanTween.value(0, 1, 0.5):setOnUpdate(LuaHelper.FloatAction(function(arg_26_0)
					local var_26_0 = var_23_7
					local var_26_1 = var_23_8
					local var_26_2 = math.floor(var_26_0 + (var_26_1 - var_26_0) * arg_26_0)

					if var_23_6 then
						iter_23_1.text = string.format("%.2f", var_26_2 / 10) .. arg_23_0.endfixes_[iter_23_0]
					else
						iter_23_1.text = math.floor(var_26_2)
					end
				end)):setOnComplete(LuaHelper.VoidAction(function()
					if arg_23_0.tweens_[iter_23_0] then
						arg_23_0.tweens_[iter_23_0]:setOnUpdate(nil):setOnComplete(nil):setEase(nil)

						arg_23_0.tweens_[iter_23_0] = nil
					end

					if var_23_6 then
						iter_23_1.text = string.format("%.2f", var_23_8 / 10) .. arg_23_0.endfixes_[iter_23_0]
					else
						iter_23_1.text = math.floor(var_23_8)
					end
				end)):setEase(LeanTweenType.easeOutQuad)
				arg_23_0.oldAtt_[arg_23_0.propIndexes_[iter_23_0]] = arg_23_0.att_[arg_23_0.propIndexes_[iter_23_0]]
			end
		end

		arg_23_0.nowLevelText_.text = tostring(var_23_0)
		arg_23_0.topLevelText_.text = "/" .. var_23_4

		if var_23_0 < var_23_4 then
			local var_23_9 = GameLevelSetting[var_23_0].hero_level_exp1

			arg_23_0.expProgressBar_.value = math.floor(var_23_5 / var_23_9 * 1000) / 1000
			arg_23_0.expText_.text = string.format("%d/%d", var_23_5, var_23_9)
		elseif LvTools.GetIsMaxLv(var_23_0, "hero") then
			arg_23_0.expProgressBar_.value = 1
			arg_23_0.expText_.text = "-/-"
		else
			local var_23_10 = GameLevelSetting[var_23_0].hero_level_exp1

			arg_23_0.expProgressBar_.value = math.floor(var_23_5 / var_23_10 * 1000) / 1000
			arg_23_0.expText_.text = string.format("%d/%d", var_23_5, var_23_10)
		end
	end

	local var_23_11 = HeroStarCfg[arg_23_0.heroInfo_.star]

	arg_23_0.starImg_.sprite = getSprite("Atlas/Common", "star_" .. var_23_11.star)
	arg_23_0.rangeTypeText_.text = CharactorParamCfg[arg_23_0.heroInfo_.id].RangeType == 0 and GetTips("RANGETYPE_CLOSE") or GetTips("RANGETYPE_LONG")

	arg_23_0:UpdateUnlockBtnState()
	arg_23_0:RefreshChargeType()
	arg_23_0:UpdateModuleView()
end

function var_0_0.UpdateUnlockBtnState(arg_28_0)
	if arg_28_0.heroInfo_.level >= HeroConst.HERO_LV_MAX then
		arg_28_0.levelStateController_:SetSelectedState("maxLevel")
	elseif arg_28_0.heroInfo_.level >= HeroTools.GetHeroCurrentMaxLevel(arg_28_0.heroInfo_) then
		arg_28_0.levelStateController_:SetSelectedState("break")

		arg_28_0.upgradeBtnText_.text = GetTips("TIP_BREAK")
	else
		arg_28_0.levelStateController_:SetSelectedState("addExp")

		arg_28_0.upgradeBtnText_.text = GetTips("TEXT_UPGRADE")
	end
end

function var_0_0.RefreshChargeType(arg_29_0)
	local var_29_0 = arg_29_0.heroCfg_.mechanism_type[1]

	if var_29_0 == HeroConst.HERO_CHARGE_TYPE.RAGE then
		arg_29_0.chargeType_.text = GetTips("NOTE_ENERGYTYPE_1")
	elseif var_29_0 == HeroConst.HERO_CHARGE_TYPE.ENERGY then
		arg_29_0.chargeType_.text = GetTips("NOTE_ENERGYTYPE_2")
	elseif var_29_0 == HeroConst.HERO_CHARGE_TYPE.TRACES then
		arg_29_0.chargeType_.text = GetTips("NOTE_ENERGYTYPE_3")
	elseif var_29_0 == HeroConst.HERO_CHARGE_TYPE.DIVINE_GRACE then
		arg_29_0.chargeType_.text = GetTips("NOTE_ENERGYTYPE_4")
	end
end

function var_0_0.OnEnter(arg_30_0, arg_30_1)
	arg_30_0:SetProxy(arg_30_1)
	arg_30_0:RegistEventListener(HERO_DATA_MODIFY, handler(arg_30_0, arg_30_0.OnHeroModify))
end

function var_0_0.OnExit(arg_31_0)
	if not isNil(arg_31_0.moduleView_) and not isNil(arg_31_0.moduleView_.transform) then
		manager.redPoint:unbindUIandKey(arg_31_0.moduleView_.transform)
	end

	manager.redPoint:unbindUIandKey(arg_31_0.surpassBtn_.transform)
	manager.redPoint:unbindUIandKey(arg_31_0.surpass01Btn_.transform)
	manager.redPoint:unbindUIandKey(arg_31_0.upgradeBtn_.transform)
	arg_31_0:RemoveAllEventListener()
end

function var_0_0.SetProxy(arg_32_0, arg_32_1)
	arg_32_0.heroViewProxy_ = arg_32_1
	arg_32_0.type_ = arg_32_0.heroViewProxy_:GetViewDataType()
end

function var_0_0.OnHeroModify(arg_33_0, arg_33_1)
	if arg_33_1 == arg_33_0.heroInfo_.id then
		arg_33_0:UpdateView()
	end
end

function var_0_0.Dispose(arg_34_0)
	arg_34_0:RemoveAllListeners()

	if arg_34_0.tweenValue_ then
		arg_34_0.tweenValue_:setOnUpdate(nil):setOnComplete(nil):setEase(nil)
		LeanTween.cancel(arg_34_0.tweenValue_.id)

		arg_34_0.tweenValue_ = nil
	end

	if arg_34_0.battlePowerTween_ then
		arg_34_0.battlePowerTween_:setOnUpdate(nil):setOnComplete(nil):setEase(nil)
		LeanTween.cancel(arg_34_0.battlePowerTween_.id)

		arg_34_0.battlePowerTween_ = nil
	end

	if arg_34_0.tweens_ then
		for iter_34_0, iter_34_1 in pairs(arg_34_0.tweens_) do
			iter_34_1:setOnUpdate(nil):setOnComplete(nil):setEase(nil)
			LeanTween.cancel(iter_34_1.id)
		end

		arg_34_0.tweens_ = nil
	end

	arg_34_0.handler_ = nil

	var_0_0.super.Dispose(arg_34_0)
end

return var_0_0
