local var_0_0 = require("cjson")
local var_0_1 = class("GoldMinerGameView", ReduxView)
local var_0_2 = {
	[1045] = {
		idle = "idle",
		pat = "alisa_pat",
		back = "alisa_back",
		throw = "alisa_throw",
		eat = "alisa_eat"
	},
	[1046] = {
		idle = "idle",
		pat = "ciel_pat",
		back = "ciel_back",
		throw = "ciel_throw",
		eat = "ciel_eat"
	}
}

function var_0_1.UIName(arg_1_0)
	return "Widget/Version/V4_2_GodEaterUI/V4_2_GodEaterUI_GoldenMiner/V4_2_GodEaterUI_GoldenMiner_GamePlayUI"
end

function var_0_1.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_1.OnCtor(arg_3_0)
	return
end

function var_0_1.Init(arg_4_0)
	arg_4_0:InitUI()
	arg_4_0:AddUIListener()
end

function var_0_1.InitUI(arg_5_0)
	arg_5_0:BindCfgUI()

	arg_5_0.addPointTimer_ = nil
	arg_5_0.roleSpine = {}
	arg_5_0.roleSpine[1045] = arg_5_0.alisaSpineGo_:GetComponent("Spine.Unity.SkeletonGraphic")
	arg_5_0.roleSpine[1046] = arg_5_0.cielSpineGo_:GetComponent("Spine.Unity.SkeletonGraphic")
	arg_5_0.roleController_ = arg_5_0.transCon_:GetController("role")
	arg_5_0.pointController_ = arg_5_0.pointControllerEx_:GetController("type")
	arg_5_0.starController1_ = arg_5_0.starControllerEx1_:GetController("state")
	arg_5_0.starController2_ = arg_5_0.starControllerEx2_:GetController("state")
	arg_5_0.starController3_ = arg_5_0.starControllerEx3_:GetController("state")
	arg_5_0.skillStateController_ = arg_5_0.skillControllerEx_:GetController("state")
	arg_5_0.skillUsingController_ = arg_5_0.skillControllerEx_:GetController("using")
	arg_5_0.hook_ = GoldMinerHook.New(arg_5_0.hookGo_, arg_5_0)

	arg_5_0.hook_:RegisterBackFunc(function()
		arg_5_0:PlayRoleSpine("back")
	end)

	arg_5_0.boomNum_ = 0
	arg_5_0.skillNeedPoint_ = 0
	arg_5_0.skillCurPoint_ = 0
	arg_5_0.skillUsingSecond_ = 0
	arg_5_0.timeRedTrigger_ = false
	arg_5_0.entered_ = false
end

function var_0_1.AddUIListener(arg_7_0)
	arg_7_0:AddBtnListener(arg_7_0.hookBtn_, nil, function()
		if arg_7_0.hook_ and arg_7_0.hook_:StartHooking() then
			arg_7_0.useHookNum_ = arg_7_0.useHookNum_ + 1

			arg_7_0:PlayRoleSpine("pat")
		end
	end)
	arg_7_0:AddBtnListener(arg_7_0.boomBtn_, nil, function()
		if arg_7_0.hook_ and arg_7_0.hook_:TryToBoom() then
			arg_7_0.useBoomNum_ = arg_7_0.useBoomNum_ + 1

			arg_7_0:PlayRoleSpine("throw")
		end
	end)
	arg_7_0:AddBtnListener(arg_7_0.skillBtn_, nil, function()
		if arg_7_0.skillUsingSecond_ > 0 then
			return
		end

		if arg_7_0.skillCurPoint_ >= arg_7_0.skillNeedPoint_ then
			arg_7_0.skillCurPoint_ = 0
			arg_7_0.skillUsingSecond_ = arg_7_0.heroCfg_.last_time

			arg_7_0.hook_:UseSkill(arg_7_0.heroID_)

			if arg_7_0.heroID_ == 1045 then
				SetActive(arg_7_0.addPointSkillEffectGo_, true)
			elseif arg_7_0.heroID_ == 1046 then
				SetActive(arg_7_0.addSpeedSkillHookEffectGo_, true)
				SetActive(arg_7_0.addSpeedSkillEffectGo_, true)
			end

			arg_7_0:RefreshSkillInfo()
		else
			ShowTips(GetTips("GOLDMINER_SKILL_CHARGE"))
		end
	end)
end

function var_0_1.UpdateBar(arg_11_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		INFO_BAR
	})

	local var_11_0 = GameSetting.godeater_goldminer_game_des.value

	manager.windowBar:RegistBackCallBack(function()
		GoldMinerManager.GetInstance():Pause()
		ShowMessageBox({
			title = GetTips("PROMPT"),
			content = GetTips("GODEATER_GOLDMINER_QUIT"),
			OkCallback = function()
				arg_11_0:Back(2)
			end,
			CancelCallback = function()
				GoldMinerManager.GetInstance():ReStart()
			end
		})
	end)
	manager.windowBar:SetGameHelpKey({
		view = "gameHelpPro",
		type = "jump",
		params = {
			isPrefab = true,
			pages = var_11_0
		}
	})
end

function var_0_1.OnEnter(arg_15_0)
	arg_15_0.entered_ = false
	arg_15_0.subActivityID_ = arg_15_0.params_.subActivityID
	arg_15_0.heroID_ = arg_15_0.params_.heroID
	arg_15_0.heroCfg_ = ActivityGodEaterGoldminerHeroCfg[arg_15_0.heroID_]
	arg_15_0.skillNeedPoint_ = arg_15_0.heroCfg_.skill_charge
	arg_15_0.useBoomNum_ = 0
	arg_15_0.useHookNum_ = 0
	arg_15_0.boomNum_ = arg_15_0.heroCfg_.boom or 0

	arg_15_0:RefreshView()
	arg_15_0:CreatStage()
	arg_15_0:RefreshBoomNum(arg_15_0.boomNum_)
	arg_15_0:UpdateScore(0)
	arg_15_0:RefreshSkillInfo()
	arg_15_0.timeAni_:Play("normal")

	arg_15_0.oriFrame_ = GameLocalData:GetCommonModule("userSetting").frame or PictureQualitySettingCfg[5].frame

	if arg_15_0.oriFrame_ ~= 1 then
		SettingAction.ChangePicSetting("frame", 1)
	end

	arg_15_0:PlayEnterAni()
end

function var_0_1.RefreshView(arg_16_0)
	arg_16_0.cfg_ = ActivityGodEaterGoldminerStageCfg[arg_16_0.subActivityID_]
	arg_16_0.needPointText1_.text = arg_16_0.cfg_.score[1]
	arg_16_0.needPointText2_.text = arg_16_0.cfg_.score[2]
	arg_16_0.needPointText3_.text = arg_16_0.cfg_.score[3]
	arg_16_0.timeText_.text = arg_16_0.cfg_.time
	arg_16_0.skillImage_.sprite = getSpriteWithoutAtlas("TextureConfig/VersionUI/V4_2_GodEaterUI/V4_2_GodEaterUI_GoldenMiner/" .. arg_16_0.heroID_ .. "_goldminer_skill")

	arg_16_0.roleController_:SetSelectedState(arg_16_0.heroID_)

	arg_16_0.selectedSpine_ = arg_16_0.roleSpine[arg_16_0.heroID_]
	arg_16_0.selectedSpine_.startingLoop = true
	arg_16_0.selectedSpine_.AnimationState.Complete = arg_16_0.selectedSpine_.AnimationState.Complete + function()
		arg_16_0.isIdle_ = true

		arg_16_0.selectedSpine_.AnimationState:SetAnimation(0, var_0_2[arg_16_0.heroID_].idle, true)
	end
end

function var_0_1.CreatStage(arg_18_0)
	local var_18_0 = AssetEx.LoadText("GoldMinerLevelData/" .. arg_18_0.subActivityID_ .. ".json")

	arg_18_0.levelData_ = var_0_0.decode(var_18_0)
	arg_18_0.levelId_ = arg_18_0.levelData_.levelId

	local var_18_1 = arg_18_0.levelData_.fishes
	local var_18_2 = arg_18_0.levelData_.thiefs

	GoldMinerManager.GetInstance():Init(arg_18_0, arg_18_0.container_, arg_18_0.hook_)

	for iter_18_0, iter_18_1 in ipairs(var_18_1) do
		local var_18_3 = Asset.Load("UI/Fishing/Game/Fishes/" .. iter_18_1.fishId)
		local var_18_4 = Object.Instantiate(var_18_3, arg_18_0.container_)

		var_18_4.transform.localPosition = Vector2(iter_18_1.posX + var_18_4.transform.rect.width / 2, -iter_18_1.posY - var_18_4.transform.rect.height / 2)
		var_18_4.transform.localScale = Vector3.New(iter_18_1.scaleX / 1000, iter_18_1.scaleY / 1000, 1)

		local var_18_5 = GoldMinerThingItem.New(var_18_4)

		var_18_5:SetData(iter_18_1, iter_18_0)
		GoldMinerManager.GetInstance():AddThing(var_18_5)

		if iter_18_1.moveable == 1 then
			local var_18_6 = Asset.Load("UI/Fishing/Game/Fishes/platform")
			local var_18_7 = Object.Instantiate(var_18_6, arg_18_0.container_)

			var_18_7.transform:Find("plat").sizeDelta = Vector2(iter_18_1.radius * 2 - 208, 76)

			local var_18_8 = iter_18_1.fishId == 10 and 70 or 120

			var_18_7.transform.localPosition = Vector2(iter_18_1.posX + var_18_4.transform.rect.width / 2 - 200, -iter_18_1.posY - var_18_4.transform.rect.height / 2 - var_18_8)

			GoldMinerManager.GetInstance():AddNoDataGo(var_18_7)
		end
	end

	for iter_18_2, iter_18_3 in ipairs(var_18_2) do
		local var_18_9 = Asset.Load("Widget/Version/V4_2_GodEaterUI/V4_2_GodEaterUI_GoldenMiner/thief")
		local var_18_10 = Object.Instantiate(var_18_9, arg_18_0.container_)

		var_18_10.transform.pivot = Vector2(0.813, 0.1)
		var_18_10.transform.localPosition = Vector2(iter_18_3.posX + var_18_10.transform.rect.width * 0.813, -iter_18_3.posY - var_18_10.transform.rect.height * 0.9)
		var_18_10.transform.localScale = Vector3.New(iter_18_3.scaleX / 1000, iter_18_3.scaleY / 1000, 0)

		local var_18_11 = GoldMinerThief.New(var_18_10)

		var_18_11:SetData(iter_18_3)
		GoldMinerManager.GetInstance():AddThief(var_18_11)
	end
end

function var_0_1.PlayEnterAni(arg_19_0)
	arg_19_0.guideTimer_ = Timer.New(function()
		if manager.guide:IsPlaying() then
			return
		end

		SetActive(arg_19_0.enterGo_, true)

		arg_19_0.enterTimer_ = Timer.New(function()
			SetActive(arg_19_0.enterGo_, false)
			arg_19_0:UpdateBar()
			GoldMinerManager.GetInstance():StartGame(arg_19_0.cfg_.time)

			arg_19_0.entered_ = true

			arg_19_0:StopTimer()
		end, 3.8, 1)

		arg_19_0.enterTimer_:Start()
		arg_19_0.guideTimer_:Stop()

		arg_19_0.guideTimer_ = nil
	end, 0.33, -1)

	arg_19_0.guideTimer_:Start()
end

function var_0_1.PlayRoleSpine(arg_22_0, arg_22_1, arg_22_2)
	if arg_22_0.isIdle_ == false then
		return
	end

	arg_22_0.selectedSpine_.timeScale = arg_22_2 or 1

	arg_22_0.selectedSpine_.AnimationState:SetAnimation(0, var_0_2[arg_22_0.heroID_][arg_22_1], false)

	arg_22_0.isIdle_ = false
end

function var_0_1.StopTimer(arg_23_0)
	if arg_23_0.enterTimer_ then
		arg_23_0.enterTimer_:Stop()

		arg_23_0.enterTimer_ = nil
	end

	if arg_23_0.guideTimer_ then
		arg_23_0.guideTimer_:Stop()

		arg_23_0.guideTimer_ = nil
	end
end

function var_0_1.Update(arg_24_0, arg_24_1, arg_24_2)
	if arg_24_2 < 0 then
		arg_24_2 = 0
	end

	arg_24_0.timeText_.text = tostring(math.floor(arg_24_2))

	if arg_24_0.timeRedTrigger_ == false and math.floor(arg_24_2) < 10 then
		arg_24_0.timeRedTrigger_ = true

		arg_24_0.timeAni_:Play("red")
	end

	if arg_24_0.skillUsingSecond_ > 0 then
		arg_24_0.skillUsingSecond_ = arg_24_0.skillUsingSecond_ - arg_24_1

		if arg_24_0.skillUsingSecond_ < 0 then
			arg_24_0.skillUsingSecond_ = 0
		end

		local var_24_0 = math.floor(arg_24_0.skillUsingSecond_)

		arg_24_0.skillUsingTimeText_.text = tostring(var_24_0)
		arg_24_0.skillUsingFillImage_.fillAmount = var_24_0 / arg_24_0.heroCfg_.last_time

		if arg_24_0.skillUsingSecond_ == 0 then
			arg_24_0:RefreshSkillInfo()
			arg_24_0.hook_:ClearSkill()
			SetActive(arg_24_0.addPointSkillEffectGo_, false)
			SetActive(arg_24_0.addSpeedSkillEffectGo_, false)
			SetActive(arg_24_0.addSpeedSkillHookEffectGo_, false)
		end
	end

	if GoldMinerManager.GetInstance():GetIsEnd() then
		if ActivityData:GetActivityIsOpen(ActivityConst.ACTIVITY_GOLDMINER) then
			local var_24_1 = ActivityGodEaterGoldminerStageCfg[arg_24_0.subActivityID_]
			local var_24_2 = GoldMinerManager.GetInstance():GetScore()
			local var_24_3 = 0

			for iter_24_0, iter_24_1 in pairs(var_24_1.score) do
				if iter_24_1 < var_24_2 then
					var_24_3 = iter_24_0
				end
			end

			local var_24_4 = GoldMinerManager.GetInstance():GetPropList()
			local var_24_5
			local var_24_6 = var_24_3 > 0 and 1 or 2
			local var_24_7 = GoldMinerManager.GetInstance():GetUseSeconds()
			local var_24_8 = string.format("[%s]", table.concat(var_24_4, ","))

			SDKTools.SendMessageToSDK("activity_combat_over", {
				skill_num = 0,
				activity_id = ActivityConst.ACTIVITY_GOLDMINER,
				stage_id = arg_24_0.subActivityID_,
				result = var_24_6,
				hero_id = arg_24_0.heroID_,
				score = var_24_2,
				use_seconds = var_24_7,
				combat_star = var_24_3,
				hit_num = arg_24_0.useHookNum_,
				cell_num = arg_24_0.useBoomNum_,
				params_list = var_24_8
			})
			GodEaterAction.GoldMinerFinishStage(ActivityConst.ACTIVITY_GOLDMINER, arg_24_0.subActivityID_, var_24_3, var_24_4, function(arg_25_0, arg_25_1)
				GodEaterData:SetStageStar(arg_25_1.stage_id, var_24_3)
				JumpTools.OpenPageByJump("/goldMinerGameEndView", {
					stageID = arg_25_1.stage_id,
					star = var_24_3,
					reward_list = arg_25_0.reward_list
				})
			end)
		else
			ShowTips("TIME_OVER")
			JumpTools.Back()
		end
	end
end

function var_0_1.RefreshSkillInfo(arg_26_0)
	if arg_26_0.skillCurPoint_ >= arg_26_0.skillNeedPoint_ then
		arg_26_0.skillPointFillImage_.fillAmount = 1

		arg_26_0.skillStateController_:SetSelectedState("ready")
	else
		arg_26_0.skillPointFillImage_.fillAmount = arg_26_0.skillCurPoint_ / arg_26_0.skillNeedPoint_

		arg_26_0.skillStateController_:SetSelectedState("charge")
	end

	if arg_26_0.skillUsingSecond_ > 0 then
		arg_26_0.skillUsingController_:SetSelectedState("true")
	else
		arg_26_0.skillUsingController_:SetSelectedState("false")
	end
end

function var_0_1.SubBoom(arg_27_0, arg_27_1)
	arg_27_0.boomNum_ = arg_27_0.boomNum_ + arg_27_1

	arg_27_0:RefreshBoomNum(arg_27_0.boomNum_)
end

function var_0_1.RefreshBoomNum(arg_28_0, arg_28_1)
	if arg_28_1 > 0 then
		SetActive(arg_28_0.boomGo_, true)

		arg_28_0.boomNumText_.text = arg_28_1
	else
		SetActive(arg_28_0.boomGo_, false)
	end
end

function var_0_1.UpdateScore(arg_29_0, arg_29_1, arg_29_2)
	arg_29_0.pointText_.text = arg_29_1

	local var_29_0 = false

	for iter_29_0 = 1, 3 do
		local var_29_1 = arg_29_0.cfg_.score[iter_29_0]

		if var_29_1 <= arg_29_1 then
			arg_29_0["starController" .. iter_29_0 .. "_"]:SetSelectedState("light")
		else
			arg_29_0["starController" .. iter_29_0 .. "_"]:SetSelectedState("grey")

			if var_29_0 == false then
				var_29_0 = true

				local var_29_2

				if iter_29_0 > 1 then
					local var_29_3 = var_29_1 - arg_29_0.cfg_.score[iter_29_0 - 1]

					arg_29_0.fillImage_.fillAmount = (iter_29_0 - 1) * 0.3 + (arg_29_1 - arg_29_0.cfg_.score[iter_29_0 - 1]) / var_29_3 * 0.3
				else
					local var_29_4 = var_29_1

					arg_29_0.fillImage_.fillAmount = (iter_29_0 - 1) * 0.3 + arg_29_1 / var_29_4 * 0.3
				end
			end
		end
	end

	if var_29_0 == false then
		if arg_29_1 >= arg_29_0.cfg_.score[3] then
			arg_29_0.fillImage_.fillAmount = 1
		else
			local var_29_5
			local var_29_6 = arg_29_0.cfg_.score[3] - arg_29_0.cfg_.score[2]

			arg_29_0.fillImage_.fillAmount = 0.6 + (arg_29_1 - arg_29_0.cfg_.score[2]) / var_29_6 * 0.3
		end
	end

	if arg_29_2 and arg_29_2 ~= 0 then
		arg_29_0:AddPointWithTimer(arg_29_2)

		if arg_29_2 > 0 then
			arg_29_0.skillCurPoint_ = arg_29_0.skillCurPoint_ + arg_29_2

			arg_29_0:RefreshSkillInfo()
		end
	end
end

function var_0_1.OnExit(arg_30_0)
	GoldMinerManager.GetInstance():Dispose()
	manager.windowBar:HideBar()
	manager.audio:StopEffect()
	arg_30_0:StopTimer()

	if arg_30_0.oriFrame_ and arg_30_0.oriFrame_ ~= 1 then
		SettingAction.ChangePicSetting("frame", arg_30_0.oriFrame_)
	end
end

function var_0_1.OnTop(arg_31_0)
	GoldMinerManager.GetInstance():ReStart()

	if arg_31_0.entered_ then
		arg_31_0:UpdateBar()
	end
end

function var_0_1.OnBehind(arg_32_0)
	GoldMinerManager.GetInstance():Pause()
end

function var_0_1.Cacheable(arg_33_0)
	return false
end

function var_0_1.AddPointWithTimer(arg_34_0, arg_34_1)
	if arg_34_1 > 0 then
		arg_34_0.viewAni_:Play("Trail")
	else
		arg_34_0.viewAni_:Play("Sub")
	end

	arg_34_0.viewAni_:Update(0)

	if arg_34_1 > 0 then
		arg_34_0.pointController_:SetSelectedState("plus")

		arg_34_0.addPointText_.text = "+" .. arg_34_1
	else
		arg_34_0.pointController_:SetSelectedState("reduce")

		arg_34_0.subPointText_.text = "-" .. arg_34_1
	end
end

function var_0_1.Dispose(arg_35_0)
	arg_35_0:StopTimer()
	GoldMinerManager.GetInstance():Dispose()
	var_0_1.super.Dispose(arg_35_0)
end

return var_0_1
