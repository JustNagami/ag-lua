local var_0_0 = class("SectionStageInfoView", ReduxView)

function var_0_0.OnCtor(arg_1_0, arg_1_1)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_0.gameObject_.transform

	arg_1_0:Show(true)
	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	arg_2_0:BindCfgUI()

	arg_2_0.attributeItemList_ = {}
end

function var_0_0.SetProxy(arg_3_0, arg_3_1)
	arg_3_0.sectionProxy_ = arg_3_1
	arg_3_0.stageType_ = arg_3_0.sectionProxy_.stageType
	arg_3_0.stageID_ = arg_3_0.sectionProxy_.stageID
end

function var_0_0.OnEnter(arg_4_0)
	arg_4_0:RefreshUI()
end

function var_0_0.RefreshUI(arg_5_0)
	arg_5_0:RefreshTitle()
	arg_5_0:RefreshRecommend()
	arg_5_0:RefreshRecommendAttribute()
end

function var_0_0.RefreshTitle(arg_6_0)
	arg_6_0.titleText_.text = BattleStageTools.GetStageName(arg_6_0.stageType_, arg_6_0.stageID_)
end

function var_0_0.RefreshRecommend(arg_7_0)
	local var_7_0 = arg_7_0:GetRecommendLevel()

	if var_7_0 == 0 then
		SetActive(arg_7_0.recommendLevelGo_, false)
	else
		SetActive(arg_7_0.recommendLevelGo_, true)

		arg_7_0.recommendLevel_.text = var_7_0
	end
end

function var_0_0.GetRecommendLevel(arg_8_0)
	return BattleStageTools.GetStageCfg(arg_8_0.stageType_, arg_8_0.stageID_).recommend_level or 0
end

function var_0_0.RefreshRecommendAttribute(arg_9_0)
	local var_9_0 = BattleStageTools.GetStageCfg(arg_9_0.stageType_, arg_9_0.stageID_).recommend_attribute_list or {}

	if #var_9_0 > 0 then
		SetActive(arg_9_0.attributePanelGo_, true)

		for iter_9_0, iter_9_1 in ipairs(var_9_0) do
			if not arg_9_0.attributeItemList_[iter_9_0] then
				arg_9_0.attributeItemList_[iter_9_0] = SectionAttributeItem.New(arg_9_0.attributeGo_, arg_9_0.attributeContentTrans_)
			end

			arg_9_0.attributeItemList_[iter_9_0]:SetData(iter_9_1)
		end

		for iter_9_2 = #var_9_0 + 1, #arg_9_0.attributeItemList_ do
			arg_9_0.attributeItemList_[iter_9_2]:Show(false)
		end
	else
		SetActive(arg_9_0.attributePanelGo_, false)
	end
end

function var_0_0.Show(arg_10_0, arg_10_1)
	SetActive(arg_10_0.gameObject_, arg_10_1)
end

function var_0_0.Dispose(arg_11_0)
	for iter_11_0, iter_11_1 in ipairs(arg_11_0.attributeItemList_) do
		iter_11_1:Dispose()
	end

	arg_11_0.attributeItemList_ = nil

	var_0_0.super.Dispose(arg_11_0)
end

return var_0_0
