local var_0_0 = class("RogueTeamItemInfoSettingView", ReduxView)

function var_0_0.SetActive(arg_1_0, arg_1_1)
	if arg_1_0.gameObject_ then
		SetActive(arg_1_0.gameObject_, arg_1_1)
	end
end

function var_0_0.Ctor(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	arg_2_0.hander_ = arg_2_1
	arg_2_0.transform_ = arg_2_2.transform
	arg_2_0.gameObject_ = arg_2_2
	arg_2_0.stageData_ = arg_2_3

	arg_2_0:Init()

	arg_2_0.selectType_ = ChallengeRogueTeamConst.ITEM_TYPE.TREASURE

	arg_2_0.btnController_:SetSelectedState("treasure")
	arg_2_0:RefreshUI()
end

function var_0_0.Init(arg_3_0)
	arg_3_0:InitUI()
	arg_3_0:AddUIListener()
end

function var_0_0.InitUI(arg_4_0)
	arg_4_0:BindCfgUI()

	arg_4_0.treasureView_ = RogueTeamItemInfoSettingTreasureView.New(arg_4_0.treasureGo_)
	arg_4_0.relicView_ = RogueTeamItemInfoSettingRelicView.New(arg_4_0.relicGo_)
	arg_4_0.btnController_ = arg_4_0.btnControllerEx_:GetController("tab")
end

function var_0_0.AddUIListener(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.treasureBtn_, nil, function()
		if arg_5_0.selectType_ == ChallengeRogueTeamConst.ITEM_TYPE.TREASURE then
			return
		end

		arg_5_0.selectType_ = ChallengeRogueTeamConst.ITEM_TYPE.TREASURE

		arg_5_0.btnController_:SetSelectedState("treasure")
		arg_5_0:RefreshUI()
	end)
	arg_5_0:AddBtnListener(arg_5_0.relicBtn_, nil, function()
		if arg_5_0.selectType_ == ChallengeRogueTeamConst.ITEM_TYPE.RELIC then
			return
		end

		arg_5_0.selectType_ = ChallengeRogueTeamConst.ITEM_TYPE.RELIC

		arg_5_0.btnController_:SetSelectedState("relic")
		arg_5_0:RefreshUI()
	end)
end

function var_0_0.RefreshUI(arg_8_0)
	if arg_8_0.selectType_ == ChallengeRogueTeamConst.ITEM_TYPE.TREASURE then
		arg_8_0.treasureView_:RefreshUI()
	else
		arg_8_0.relicView_:RefreshUI()
	end
end

function var_0_0.Dispose(arg_9_0)
	arg_9_0.treasureView_:Dispose()

	arg_9_0.treasureView_ = nil

	arg_9_0.relicView_:Dispose()

	arg_9_0.relicView_ = nil

	var_0_0.super.Dispose(arg_9_0)

	arg_9_0.transform_ = nil
	arg_9_0.gameObject_ = nil
end

return var_0_0
