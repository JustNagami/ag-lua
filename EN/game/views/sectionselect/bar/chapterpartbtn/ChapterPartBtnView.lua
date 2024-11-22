local var_0_0 = class("ChapterPartBtnView", ReduxView)

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_1.transform

	arg_1_0:BindCfgUI()

	arg_1_0.partBtnItemList_ = {}

	for iter_1_0 = 1, 2 do
		arg_1_0.partBtnItemList_[iter_1_0] = ChapterPartBtnItem.New(arg_1_0[string.format("chapterPart%sGo_", iter_1_0)], iter_1_0)
	end
end

function var_0_0.OnEnter(arg_2_0)
	for iter_2_0, iter_2_1 in ipairs(arg_2_0.partBtnItemList_) do
		iter_2_1:OnEnter()
	end
end

function var_0_0.OnExit(arg_3_0)
	for iter_3_0, iter_3_1 in ipairs(arg_3_0.partBtnItemList_) do
		iter_3_1:OnExit()
	end
end

function var_0_0.Dispose(arg_4_0)
	var_0_0.super.Dispose(arg_4_0)

	for iter_4_0, iter_4_1 in ipairs(arg_4_0.partBtnItemList_) do
		iter_4_1:Dispose()
	end

	arg_4_0.partBtnItemList_ = nil
end

function var_0_0.Show(arg_5_0, arg_5_1)
	SetActive(arg_5_0.gameObject_, arg_5_1)
end

function var_0_0.RefreshUI(arg_6_0, arg_6_1)
	local var_6_0 = getChapterClientCfgByChapterID(arg_6_1)

	if #var_6_0.chapter_list > 1 and (var_6_0.id == ChapterConst.CHAPTER_CLIENT_XUHENG_PART_2_2 or var_6_0.id == ChapterConst.CHAPTER_CLIENT_LUWU_ZHIMING) then
		arg_6_0:Show(true)

		for iter_6_0 = 1, 2 do
			arg_6_0.partBtnItemList_[iter_6_0]:SetChapterID(var_6_0.chapter_list[iter_6_0], arg_6_1)
		end
	else
		arg_6_0:Show(false)
	end
end

return var_0_0
