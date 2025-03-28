local var_0_0 = class("MultHeartDemonCombatItem", ReduxView)

function var_0_0.OnCtor(arg_1_0, arg_1_1)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_1.transform

	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	arg_2_0:InitUI()
	arg_2_0:AddUIListener()
end

function var_0_0.AddUIListener(arg_3_0)
	arg_3_0:AddBtnListener(arg_3_0.selectBtn_, nil, function()
		if arg_3_0.isPlayer then
			arg_3_0:GoToHeroTeamPage()
		end
	end)

	if arg_3_0.swapBtn_ then
		arg_3_0:AddBtnListener(arg_3_0.swapBtn_, nil, function()
			if arg_3_0.isPlayer then
				arg_3_0.callback(arg_3_0.index)
			end
		end)
	end

	if arg_3_0.swapBtn2_ then
		arg_3_0:AddBtnListener(arg_3_0.swapBtn2_, nil, function()
			if arg_3_0.isPlayer then
				arg_3_0:GoToHeroTeamPage()
			end
		end)
	end

	if arg_3_0.changeBtn1_ then
		arg_3_0:AddBtnListener(arg_3_0.changeBtn1_, nil, function()
			arg_3_0.swapCallback(arg_3_0.index)
		end)
		arg_3_0:AddBtnListener(arg_3_0.changeBtn2_, nil, function()
			arg_3_0.swapCallback(arg_3_0.index)
		end)
	end
end

function var_0_0.GoToHeroTeamPage(arg_9_0)
	JumpTools.GoToSystem("/multHeartDemonHeroTeamInfo", {
		clickIndex = arg_9_0.index,
		difficult = arg_9_0.difficult,
		activityID = arg_9_0.activityID,
		stage_id = arg_9_0.stage_id,
		stageType = BattleConst.STAGE_TYPE_NEW.MULT_HEART_DEMON,
		isLock = arg_9_0.isLock
	})
end

function var_0_0.InitUI(arg_10_0)
	arg_10_0:BindCfgUI()

	arg_10_0.normalController = arg_10_0.collection:GetController("normal")
	arg_10_0.pressController = arg_10_0.collection:GetController("Press")
	arg_10_0.imgLanController = arg_10_0.collection:GetController("Imglan")
	arg_10_0.powerUpController = arg_10_0.collection:GetController("Selected")
	arg_10_0.HpController = arg_10_0.collection:GetController("bar")
	arg_10_0.deathController = arg_10_0.collection:GetController("disable")
	arg_10_0.handOffController = arg_10_0.collection:GetController("handoff")
	arg_10_0.ImgzzController = arg_10_0.collection:GetController("Imgzz")
	arg_10_0.fgController = arg_10_0.collection:GetController("fg")
	arg_10_0.Imgzz02Controller = arg_10_0.collection:GetController("Imgzz02")
end

function var_0_0.SetData(arg_11_0, arg_11_1, arg_11_2, arg_11_3, arg_11_4, arg_11_5, arg_11_6, arg_11_7, arg_11_8, arg_11_9, arg_11_10, arg_11_11)
	arg_11_0.index = arg_11_2
	arg_11_0.data = arg_11_1
	arg_11_0.cfg = arg_11_4
	arg_11_0.isPlayer = arg_11_0.index <= 3
	arg_11_0.selectList = arg_11_3 or {}
	arg_11_0.difficult = arg_11_5
	arg_11_0.activityID = arg_11_6
	arg_11_0.playerIndex = arg_11_7
	arg_11_0.aiIndex = arg_11_8
	arg_11_0.stage_id = arg_11_9
	arg_11_0.callback = arg_11_10
	arg_11_0.swapCallback = arg_11_11
	arg_11_0.isLock = MultHeartDemonData:GetDataByPara("isLock") or false

	if arg_11_0.isLock == false then
		arg_11_0.playerIndex = 1
	end

	arg_11_0:UpdateView()
end

function var_0_0.ShowSwapActiveBtn(arg_12_0, arg_12_1)
	arg_12_0.handOffController:SetSelectedState(arg_12_1 and "state0" or "state1")
end

function var_0_0.RestoreSwapActiveBtn(arg_13_0)
	if arg_13_0:IsEmptySlot() then
		arg_13_0:ShowSwapActiveBtn(next(arg_13_0.selectList))
	else
		arg_13_0:ShowSwapActiveBtn(not arg_13_0.isLock)
	end
end

function var_0_0.SetSwapEnabled(arg_14_0, arg_14_1)
	local var_14_0 = arg_14_1 and "state0" or "state1"

	if arg_14_0:IsEmptySlot() then
		arg_14_0.Imgzz02Controller:SetSelectedState("state1")
		arg_14_0.ImgzzController:SetSelectedState(var_14_0)
	else
		arg_14_0.Imgzz02Controller:SetSelectedState(var_14_0)
		arg_14_0.ImgzzController:SetSelectedState("state1")
	end

	if arg_14_1 then
		arg_14_0:ShowSwapActiveBtn(false)
	else
		arg_14_0:RestoreSwapActiveBtn()
	end
end

function var_0_0.SetHighlighted(arg_15_0, arg_15_1)
	local var_15_0 = arg_15_1 and "state0" or "state1"

	arg_15_0.fgController:SetSelectedState(var_15_0)
end

function var_0_0.IsEmptySlot(arg_16_0)
	return arg_16_0.isPlayer and arg_16_0.selectList[arg_16_0.index] == nil
end

function var_0_0.ColllectImageComsRecursive(arg_17_0)
	arg_17_0.collectedImgs = arg_17_0.gameObject_:GetComponentsInChildren(typeof(Image), true):ToTable()
end

function var_0_0.SetGreyRecursive(arg_18_0, arg_18_1)
	if arg_18_0.collectedImgs == nil then
		arg_18_0:ColllectImageComsRecursive()
	end

	for iter_18_0, iter_18_1 in pairs(arg_18_0.collectedImgs) do
		manager.effect:SetGrey(iter_18_1, arg_18_1)
	end
end

function var_0_0.UpdatePlayer(arg_19_0)
	local var_19_0 = arg_19_0.selectList[arg_19_0.index]

	arg_19_0.normalController:SetSelectedState(var_19_0 and "state0" or "state1")
	arg_19_0:SetSwapEnabled(false)
	arg_19_0:SetHighlighted(false)

	local var_19_1 = false

	if var_19_0 then
		if HeroStandardSystemCfg[var_19_0] then
			arg_19_0.iconImg_.sprite = pureGetSpriteWithoutAtlas("TextureConfig/Character/Icon/" .. HeroStandardSystemCfg[var_19_0].skin_id)
		else
			local var_19_2 = HeroData:GetHeroUsingSkinInfo(var_19_0).id

			arg_19_0.iconImg_.sprite = pureGetSpriteWithoutAtlas("TextureConfig/Character/Icon/" .. var_19_2)
		end

		arg_19_0.pressController:SetSelectedState("state0")

		if arg_19_0.data.heroHPList and arg_19_0.data.heroHPList[var_19_0] then
			local var_19_3 = arg_19_0.data.heroHPList[var_19_0]

			if var_19_3 == 0 then
				arg_19_0.HPSlider_.value = 0
				var_19_1 = true

				arg_19_0.deathController:SetSelectedState("state0")
				arg_19_0.powerUpController:SetSelectedState("state1")
			else
				arg_19_0.HPSlider_.value = var_19_3 / 100

				arg_19_0.deathController:SetSelectedState("state1")
				arg_19_0.powerUpController:SetSelectedState("state0")
			end

			arg_19_0.HPTxt_.text = var_19_3 .. "%"
		else
			arg_19_0.HPSlider_.value = 1

			arg_19_0.deathController:SetSelectedState("state1")

			arg_19_0.HPTxt_.text = "100%"

			arg_19_0.powerUpController:SetSelectedState(arg_19_0.index == arg_19_0.playerIndex and "state0" or "state1")
		end
	else
		arg_19_0.pressController:SetSelectedState("state1")
		arg_19_0.HpController:SetSelectedState("state1")
		arg_19_0.deathController:SetSelectedState("state1")
		arg_19_0.powerUpController:SetSelectedState(arg_19_0.index == arg_19_0.playerIndex and "state0" or "state1")
	end

	arg_19_0:SetGreyRecursive(var_19_1)

	if arg_19_0.isLock == false then
		arg_19_0.powerUpController:SetSelectedState("state1")
	end

	arg_19_0:RestoreSwapActiveBtn()
end

function var_0_0.UpdateAI(arg_20_0)
	arg_20_0.normalController:SetSelectedState("state1")

	arg_20_0.iconImg_.sprite = pureGetSpriteWithoutAtlas("TextureConfig/Character/Icon/" .. arg_20_0.cfg.heart_damon_id[arg_20_0.index - 3] - 4000)

	arg_20_0.HpController:SetSelectedState("state0")
	arg_20_0.pressController:SetSelectedState("state0")
	arg_20_0.deathController:SetSelectedState("state1")

	local var_20_0 = false

	if arg_20_0.data then
		if arg_20_0.data.heroHPList and arg_20_0.data.heroHPList[arg_20_0.cfg.heart_damon_id[arg_20_0.index - 3]] then
			if arg_20_0.data.heroHPList[arg_20_0.cfg.heart_damon_id[arg_20_0.index - 3]] == 0 then
				arg_20_0.HPSlider_.value = 0
				var_20_0 = true

				arg_20_0.deathController:SetSelectedState("state0")
				arg_20_0.powerUpController:SetSelectedState("state1")
			else
				arg_20_0.HPSlider_.value = arg_20_0.data.heroHPList[arg_20_0.cfg.heart_damon_id[arg_20_0.index - 3]] / 100

				arg_20_0.deathController:SetSelectedState("state1")
				arg_20_0.powerUpController:SetSelectedState("state0")
			end

			arg_20_0.HPTxt_.text = arg_20_0.data.heroHPList[arg_20_0.cfg.heart_damon_id[arg_20_0.index - 3]] .. "%"
		else
			arg_20_0.HPSlider_.value = 1
			arg_20_0.HPTxt_.text = "100%"

			arg_20_0.powerUpController:SetSelectedState(arg_20_0.index - 3 == arg_20_0.aiIndex and "state0" or "state1")
		end
	else
		arg_20_0.HPSlider_.value = 1

		arg_20_0.deathController:SetSelectedState("state1")

		arg_20_0.HPTxt_.text = "100%"

		arg_20_0.powerUpController:SetSelectedState(arg_20_0.index - 3 == arg_20_0.aiIndex and "state0" or "state1")
	end

	arg_20_0:SetGreyRecursive(var_20_0)

	if arg_20_0.isLock == false then
		arg_20_0.powerUpController:SetSelectedState("state1")
	end
end

function var_0_0.UpdateView(arg_21_0)
	if arg_21_0.isPlayer then
		arg_21_0:UpdatePlayer()
	else
		arg_21_0:UpdateAI()
	end
end

function var_0_0.OnEnter(arg_22_0)
	arg_22_0:UpdateView()
end

function var_0_0.OnExit(arg_23_0)
	arg_23_0.collectedImgs = nil
end

function var_0_0.Dispose(arg_24_0)
	var_0_0.super.Dispose(arg_24_0)
	Object.Destroy(arg_24_0.gameObject_)
end

return var_0_0
