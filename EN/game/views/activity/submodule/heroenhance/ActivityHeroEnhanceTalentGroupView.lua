local var_0_0 = class("ActivityHeroEnhanceTalentDetailView", ReduxView)

function var_0_0.OnCtor(arg_1_0, arg_1_1)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_1.transform
	arg_1_0.expanded_ = false
	arg_1_0.selected_ = false

	arg_1_0:InitUI()
end

function var_0_0.InitUI(arg_2_0)
	arg_2_0:BindCfgUI()

	arg_2_0.talentItem_ = ActivityHeroEnhanceTalentItem.New(arg_2_0.curTalentGo_)
	arg_2_0.talentList_ = {}

	for iter_2_0 = 1, 3 do
		local var_2_0 = ActivityHeroEnhanceTalentItem.New(arg_2_0["selTalentGo_" .. iter_2_0])

		table.insert(arg_2_0.talentList_, var_2_0)
	end

	arg_2_0.lineController_ = arg_2_0.controller_:GetController("line")

	arg_2_0:AddUIListener()
end

function var_0_0.AddUIListener(arg_3_0)
	arg_3_0.talentItem_:SetClickHandler(function(arg_4_0)
		arg_3_0:OnClickTalent(true, arg_4_0, 0)
	end)

	for iter_3_0, iter_3_1 in ipairs(arg_3_0.talentList_) do
		iter_3_1:SetClickHandler(function(arg_5_0)
			arg_3_0:OnClickTalent(false, arg_5_0, iter_3_0)
		end)
	end
end

function var_0_0.SetData(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
	arg_6_0.cfgId_ = arg_6_1
	arg_6_0.stage_ = arg_6_2
	arg_6_0.talentIdList_ = arg_6_3
end

function var_0_0.SetSelected(arg_7_0, arg_7_1)
	arg_7_0.selected_ = arg_7_1
end

function var_0_0.SelectIdx(arg_8_0, arg_8_1)
	arg_8_0.selectIdx_ = arg_8_1

	arg_8_0:RefreshUI_SelectState()
end

function var_0_0.SetClickHandler(arg_9_0, arg_9_1)
	arg_9_0.onClickTalenCallback_ = arg_9_1
end

function var_0_0.RefreshUI(arg_10_0)
	local var_10_0 = ActivityHeroEnhanceCfg[arg_10_0.cfgId_]
	local var_10_1
	local var_10_2 = true
	local var_10_3 = var_10_0.activity_id

	for iter_10_0, iter_10_1 in ipairs(arg_10_0.talentIdList_) do
		local var_10_4 = ActivityHeroEnhanceData:IsTalentActivated(var_10_3, iter_10_1)
		local var_10_5 = ActivityHeroEnhanceTools.IsTalentLock(var_10_3, iter_10_1, true)
		local var_10_6 = arg_10_0.talentList_[iter_10_0]

		var_10_6:SetData(var_10_3, iter_10_1)
		var_10_6:SetUsed(var_10_4)
		var_10_6:SetSelected(arg_10_0.selectIdx_ == iter_10_0)
		var_10_6:SetLock(var_10_5)
		var_10_6:RefreshUI()
		SetActive(var_10_6.gameObject_, arg_10_0.selected_)

		var_10_2 = var_10_2 and var_10_5

		if var_10_4 then
			var_10_1 = iter_10_1
		end
	end

	arg_10_0.talentItem_:SetData(var_10_3, var_10_1)
	arg_10_0.talentItem_:SetSelected(arg_10_0.selected_)
	arg_10_0.talentItem_:SetLock(var_10_2)
	arg_10_0.talentItem_:SetFirstAddFlag(ActivityHeroEnhanceTools.IsCfgTalentStageFirstCanAdd(var_10_0, arg_10_0.stage_))
	arg_10_0.talentItem_:RefreshUI()
	arg_10_0.lineController_:SetSelectedState(var_10_2 and "weak" or "normal")
end

function var_0_0.RefreshUI_SelectState(arg_11_0)
	for iter_11_0, iter_11_1 in ipairs(arg_11_0.talentList_) do
		iter_11_1:SetSelected(arg_11_0.selectIdx_ == iter_11_0)
		iter_11_1:RefreshUI()
		SetActive(iter_11_1.gameObject_, arg_11_0.selected_)
	end

	arg_11_0.talentItem_:SetSelected(arg_11_0.selected_)
	arg_11_0.talentItem_:RefreshUI()
end

function var_0_0.OnClickTalent(arg_12_0, arg_12_1, arg_12_2, arg_12_3)
	if arg_12_0.onClickTalenCallback_ then
		arg_12_0.onClickTalenCallback_(arg_12_1, arg_12_0.stage_, arg_12_2, arg_12_3)
	end
end

function var_0_0.Dispose(arg_13_0)
	arg_13_0.talentItem_:Dispose()

	for iter_13_0, iter_13_1 in ipairs(arg_13_0.talentList_) do
		iter_13_1:Dispose()
	end

	var_0_0.super.Dispose(arg_13_0)
end

return var_0_0
