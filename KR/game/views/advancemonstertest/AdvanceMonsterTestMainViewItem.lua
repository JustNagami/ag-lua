local var_0_0 = class("AdvanceMonsterTestMainViewItem", ReduxView)

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
end

function var_0_0.SetData(arg_4_0, arg_4_1)
	arg_4_0.stageID_ = arg_4_1

	arg_4_0:UpdateView()
end

function var_0_0.AddUIListener(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.btn_, nil, function()
		JumpTools.OpenPageByJump("/advanceMonsterAffixView", {
			stageID = arg_5_0.stageID_
		})
	end)
end

function var_0_0.UpdateView(arg_7_0)
	local var_7_0 = ActivityAdvanceMonsterTestCfg[arg_7_0.stageID_]
	local var_7_1 = BattleActivityAdvanceMonsterTestCfg[var_7_0.stage_id]

	arg_7_0.nameText_.text = GetI18NText(var_7_1.name)
	arg_7_0.pointText_.text = AdvanceMonsterTestData:GetStagePoint(arg_7_0.stageID_)

	local var_7_2 = ""

	for iter_7_0, iter_7_1 in pairs(var_7_0.boss_list) do
		var_7_2 = var_7_2 .. iter_7_1
	end

	arg_7_0.image_.sprite = getSpriteWithoutAtlas(SpritePathCfg.CollectBoss.path .. var_7_2)
end

function var_0_0.Dispose(arg_8_0)
	var_0_0.super.Dispose(arg_8_0)
end

return var_0_0
