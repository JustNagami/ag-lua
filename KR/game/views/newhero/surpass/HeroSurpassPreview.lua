local var_0_0 = class("HeroSurpassPreview", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/System/Hero_transition/HeroPrintTipsUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiPop.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:InitUI()
	arg_3_0:AddUIListener()
end

function var_0_0.InitUI(arg_4_0)
	arg_4_0:BindCfgUI()

	arg_4_0.surpassScrollHelper_ = LuaList.New(handler(arg_4_0, arg_4_0.SurpassNodeItem), arg_4_0.messagescrollGo_, HeroSurpassPreviewNodeItem)
end

function var_0_0.AddUIListener(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.btnbgBtn_, nil, function()
		arg_5_0.messagescrollSr_.enabled = true

		arg_5_0.tipsnodeGo_:SetActive(false)
	end)
	arg_5_0:AddBtnListener(arg_5_0.closeBtn_, nil, function()
		if arg_5_0.backCallback then
			arg_5_0.backCallback()
		end
	end)
end

function var_0_0.ClickCheckBtn(arg_8_0, arg_8_1, arg_8_2)
	arg_8_0:RefreshTipsShow(arg_8_2)
	arg_8_0:SetTipsPosAndShow(arg_8_1)

	arg_8_0.messagescrollSr_.enabled = false
end

function var_0_0.RefreshTipsShow(arg_9_0, arg_9_1)
	local var_9_0 = math.max(arg_9_1 - 1, 0)

	arg_9_0.atkvaluenowText_.text = arg_9_0.heroCfg.atk_ratio[var_9_0]
	arg_9_0.atkvalueafterText_.text = arg_9_0.heroCfg.atk_ratio[arg_9_1]
	arg_9_0.armvaluenowText_.text = arg_9_0.heroCfg.arm_ratio[var_9_0]
	arg_9_0.armvalueafterText_.text = arg_9_0.heroCfg.arm_ratio[arg_9_1]
	arg_9_0.stavaluenowText_.text = arg_9_0.heroCfg.sta_ratio[var_9_0]
	arg_9_0.stavalueafterText_.text = arg_9_0.heroCfg.sta_ratio[arg_9_1]
	arg_9_0.atknodeText_.text = string.format(GetTips("EQUIP_UPGRADE_ATTR_DES"), GetI18NText(PublicAttrCfg[1].name))
	arg_9_0.armnodeText_.text = string.format(GetTips("EQUIP_UPGRADE_ATTR_DES"), GetI18NText(PublicAttrCfg[2].name))
	arg_9_0.stanodeText_.text = string.format(GetTips("EQUIP_UPGRADE_ATTR_DES"), GetI18NText(PublicAttrCfg[3].name))
end

function var_0_0.SetTipsPosAndShow(arg_10_0, arg_10_1)
	local var_10_0 = arg_10_1.transform_.parent

	if arg_10_0.tipsnodeTrs_.parent ~= var_10_0 then
		arg_10_0.tipsnodeTrs_:SetParent(var_10_0)
	end

	arg_10_0.tipsnodeTrs_:SetAsLastSibling()
	arg_10_0.tipsnodeGo_:SetActive(true)

	local var_10_1 = arg_10_1.transform_.localPosition

	arg_10_0.tipsnodeTrs_.localPosition = Vector2(arg_10_0.tipsnodeTrs_.localPosition.x, var_10_1.y - 200)
end

function var_0_0.SurpassNodeItem(arg_11_0, arg_11_1, arg_11_2)
	local var_11_0 = arg_11_0.starNodeList[arg_11_1 + arg_11_0.beginStarStage - 1]

	arg_11_2:RefreshUI(var_11_0)
	arg_11_2:SetClickCheckCallback(function()
		arg_11_0:ClickCheckBtn(arg_11_2, var_11_0[1].cfg.star)
	end)
end

function var_0_0.OnEnter(arg_13_0)
	manager.windowBar:HideBar()

	arg_13_0.backCallback = arg_13_0.params_.backCallback

	arg_13_0:InitData()
	arg_13_0:InitHeroStarData()
	arg_13_0.tipsnodeGo_:SetActive(false)
end

function var_0_0.InitData(arg_14_0)
	arg_14_0.heroID = arg_14_0.params_.heroID
	arg_14_0.heroInfo = arg_14_0.params_.heroInfo
	arg_14_0.heroCfg = HeroCfg[arg_14_0.heroID]
end

function var_0_0.InitHeroStarData(arg_15_0)
	local var_15_0 = {}
	local var_15_1 = HeroStarCfg[arg_15_0.heroCfg.unlock_star].star

	arg_15_0.beginStarStage = var_15_1

	local var_15_2 = table.indexof(HeroStarCfg.all, arg_15_0.heroCfg.unlock_star)
	local var_15_3 = 7
	local var_15_4 = arg_15_0.heroInfo.star
	local var_15_5 = HeroStarCfg[var_15_4].star

	SurpassTools.ChangeIconStarSpirte(arg_15_0.iconImg_, var_15_5)

	local var_15_6 = arg_15_0.heroCfg.star_up_skill_template
	local var_15_7 = HeroStarUpTemplateCfg.get_id_list_by_template[var_15_6]

	for iter_15_0 = var_15_2, #HeroStarCfg.all do
		local var_15_8 = HeroStarCfg.all[iter_15_0]
		local var_15_9 = HeroStarCfg[var_15_8]

		if var_15_9 then
			local var_15_10 = var_15_9.star
			local var_15_11 = var_15_4 < var_15_8

			if not var_15_0[var_15_10] then
				var_15_0[var_15_10] = {}
			end

			local var_15_12 = iter_15_0 == var_15_2 and true or false

			table.insert(var_15_0[var_15_10], {
				cfg = var_15_9,
				isLock = var_15_11,
				isBeginStar = var_15_12,
				heroCfg = arg_15_0.heroCfg
			})
		end
	end

	arg_15_0.starNodeList = var_15_0
	arg_15_0.starStageNum = var_15_3 - var_15_1

	arg_15_0.surpassScrollHelper_:StartScroll(arg_15_0.starStageNum, var_15_5 - var_15_1)
end

function var_0_0.OnExit(arg_16_0)
	if arg_16_0.backGround_ then
		manager.resourcePool:DestroyOrReturn(arg_16_0.backGround_, ASSET_TYPE.SCENE)
	end
end

function var_0_0.Dispose(arg_17_0)
	if arg_17_0.surpassScrollHelper_ then
		arg_17_0.surpassScrollHelper_:Dispose()

		arg_17_0.surpassScrollHelper_ = nil
	end

	var_0_0.super.Dispose(arg_17_0)
end

function var_0_0.InitBackScene(arg_18_0)
	local var_18_0 = "UI/Common/BackgroundQuad"

	arg_18_0.backGround_ = manager.resourcePool:Get(var_18_0, ASSET_TYPE.SCENE)
	arg_18_0.backGroundTrs_ = arg_18_0.backGround_.transform

	arg_18_0.backGroundTrs_:SetParent(manager.ui.mainCamera.transform)

	local var_18_1
	local var_18_2
	local var_18_3 = GameDisplayCfg.collect_monster_background_pos.value
	local var_18_4 = CameraCfg.enemyFile.pictureName

	arg_18_0.backGroundTrs_.localPosition = Vector3(var_18_3[1], var_18_3[2], 10)
	arg_18_0.backGroundTrs_.localEulerAngles = Vector3(0, 0, 0)

	local var_18_5 = GameDisplayCfg.collect_monster_background_pos.scale

	arg_18_0.backGroundTrs_.localScale = Vector3(var_18_5[1], var_18_5[2], var_18_5[3])
	arg_18_0.backGroundTrs_:Find("pic_background1"):GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas(SpritePathCfg.Bg.path .. var_18_4)
end

return var_0_0
