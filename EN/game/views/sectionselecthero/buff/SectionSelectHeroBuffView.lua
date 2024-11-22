local var_0_0 = class("SectionSelectHeroBuffView", ReduxView)

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_1.transform

	arg_1_0:BindCfgUI()
	arg_1_0:AddListeners()

	arg_1_0.buffUIList_ = LuaList.New(handler(arg_1_0, arg_1_0.RefreshItem), arg_1_0.uiList_, SectionSelectHeroBuffItem)
end

function var_0_0.OnEnter(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.activityID_ = arg_2_1
	arg_2_0.stageID_ = arg_2_2

	local var_2_0 = table.keyof(SequentialBattleChapterCfg[arg_2_1].stage_id, arg_2_2)

	arg_2_0.enabledBuff_ = SequentialBattleTools.GetEnabledBuff(arg_2_0.activityID_, var_2_0)

	arg_2_0.buffUIList_:StartScroll(#arg_2_0.enabledBuff_)
end

function var_0_0.OnExit(arg_3_0)
	return
end

function var_0_0.Dispose(arg_4_0)
	var_0_0.super.Dispose(arg_4_0)
	arg_4_0.buffUIList_:Dispose()

	arg_4_0.buffUIList_ = nil
end

function var_0_0.AddListeners(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.button_, nil, function()
		JumpTools.OpenPageByJump("sequentialBattleBuffInfo", {
			activityID = arg_5_0.activityID_,
			stageID = arg_5_0.stageID_
		})
	end)
end

function var_0_0.RefreshItem(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = arg_7_0.enabledBuff_[arg_7_1]

	arg_7_2:SetData(var_7_0)
end

return var_0_0
