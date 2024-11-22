local var_0_0 = class("SPHeroChallengeAffixItem", ReduxView)

function var_0_0.OnCtor(arg_1_0, arg_1_1)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_0.gameObject_.transform

	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	arg_2_0:InitUI()
end

function var_0_0.InitUI(arg_3_0)
	arg_3_0:BindCfgUI()

	arg_3_0.stateController = arg_3_0.controller:GetController("state")
	arg_3_0.showTipsController = arg_3_0.controller:GetController("showTips")

	arg_3_0:AddUIListener()
end

function var_0_0.AddUIListener(arg_4_0)
	arg_4_0:AddBtnListener(arg_4_0.infoBtn_, nil, function()
		if arg_4_0.timer then
			arg_4_0.timer:Stop()

			arg_4_0.timer = nil
		end

		arg_4_0.showTipsController:SetSelectedState("show")
		arg_4_0:RefreshDesc()

		arg_4_0.timer = Timer.New(function()
			arg_4_0.showTipsController:SetSelectedState("close")
			arg_4_0.timer:Stop()

			arg_4_0.timer = nil
		end, 3, 1)

		arg_4_0.timer:Start()
	end)
end

function var_0_0.RefreshUI(arg_7_0, arg_7_1, arg_7_2)
	arg_7_0.activityID = SPHeroChallengeData:GetActivityID()

	local var_7_0 = ActivityHeroChallengeCfg[arg_7_0.activityID]

	arg_7_0.showTipsController:SetSelectedState("close")

	if var_7_0 then
		local var_7_1 = SpHeroChallengeConst.trainIndex[arg_7_1]
		local var_7_2 = var_7_0["affix_group_" .. var_7_1][arg_7_2]
		local var_7_3 = SPHeroChallengeData:GetCurActivityInfo():GetTrainNumByType(arg_7_1)

		arg_7_0.affixID = var_7_2[2]
		arg_7_0.nameText.text = GetTips("TIP_CLEARTIMES") .. var_7_2[1]
		arg_7_0.skillText.text = ActivityAffixPoolCfg[var_7_2[2]].name
		arg_7_0.skillIcon.sprite = getSpriteWithoutAtlas(SpritePathCfg.AffixIcon.path .. PublicBuffCfg[var_7_2[2]].icon)

		if var_7_3 < var_7_2[1] then
			arg_7_0.stateController:SetSelectedState("lock")
		else
			arg_7_0.stateController:SetSelectedState("unlock")
		end
	end
end

function var_0_0.RefreshDesc(arg_8_0)
	arg_8_0.name.text = ActivityAffixPoolCfg[arg_8_0.affixID].name

	local var_8_0 = GetCfgDescription(AffixTypeCfg[arg_8_0.affixID].description[1])

	arg_8_0.desc.text = var_8_0
end

function var_0_0.Dispose(arg_9_0)
	if arg_9_0.timer then
		arg_9_0.timer:Stop()

		arg_9_0.timer = nil
	end

	arg_9_0.gameObject_ = nil
	arg_9_0.transform_ = nil

	var_0_0.super.Dispose(arg_9_0)
end

return var_0_0
