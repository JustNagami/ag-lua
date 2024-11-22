local var_0_0 = class("IlluPlotDetail", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/System/IllustratedHandbook/IlluPlotDetailUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:InitUI()
	arg_3_0:AddUIListener()
end

function var_0_0.InitUI(arg_4_0)
	arg_4_0:BindCfgUI()

	arg_4_0.scroll_ = LuaList.New(handler(arg_4_0, arg_4_0.indexItem), arg_4_0.uilistGo_, IlluPlotDetailItem)
end

function var_0_0.AddUIListener(arg_5_0)
	return
end

function var_0_0.UpdateDate(arg_6_0)
	arg_6_0.itemList_ = arg_6_0.list_

	table.sort(arg_6_0.itemList_, function(arg_7_0, arg_7_1)
		local var_7_0 = CollectStoryCfg[arg_7_0]
		local var_7_1 = CollectStoryCfg[arg_7_1]

		if var_7_0.order ~= var_7_1.order then
			return var_7_0.order < var_7_1.order
		end

		return arg_7_0 < arg_7_1
	end)
end

function var_0_0.indexItem(arg_8_0, arg_8_1, arg_8_2)
	arg_8_2:RefreshUI(arg_8_0.itemList_[arg_8_1], arg_8_0.selType_)
end

function var_0_0.RefreshUI(arg_9_0, arg_9_1)
	if arg_9_1 == 1 then
		local var_9_0 = SpritePathCfg.CollectPlotBig.path .. ChapterClientCfg[arg_9_0.chapterID_].chapter_paint

		getSpriteWithoutAtlasAsync(var_9_0, function(arg_10_0)
			arg_9_0.bgImg_.sprite = arg_10_0
		end)
	elseif arg_9_1 == 2 then
		local var_9_1 = CollectStoryCfg.get_id_list_by_activity[arg_9_0.chapterID_][1]
		local var_9_2 = CollectStoryCfg[var_9_1].picture
		local var_9_3 = SpritePathCfg.CollectPlotBig.path .. var_9_2

		getSpriteWithoutAtlasAsync(var_9_3, function(arg_11_0)
			arg_9_0.bgImg_.sprite = arg_11_0
		end)
	elseif arg_9_1 == 3 then
		local var_9_4 = CollectStoryCfg[arg_9_0.list_[1]].picture
		local var_9_5 = SpritePathCfg.CollectPlotBig.path .. var_9_4

		getSpriteWithoutAtlasAsync(var_9_5, function(arg_12_0)
			arg_9_0.bgImg_.sprite = arg_12_0
		end)
	end

	arg_9_0:UpdateDate()
	arg_9_0.scroll_:StartScroll(#arg_9_0.itemList_)
end

function var_0_0.OnEnter(arg_13_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR
	})

	if not arg_13_0:CheckIsRefresh() then
		return
	end

	arg_13_0.list_ = arg_13_0.params_.storyList
	arg_13_0.chapterID_ = arg_13_0.params_.chapterID
	arg_13_0.selType_ = arg_13_0.params_.selType

	arg_13_0:RefreshUI(arg_13_0.selType_)
end

function var_0_0.CheckIsRefresh(arg_14_0)
	if not arg_14_0.list_ then
		return true
	end

	for iter_14_0, iter_14_1 in pairs(arg_14_0.params_.storyList) do
		if arg_14_0.list_[iter_14_0] ~= iter_14_1 then
			return true
		end
	end

	if arg_14_0.chapterID_ ~= arg_14_0.params_.chapterID or arg_14_0.selType_ ~= arg_14_0.params_.selType then
		return true
	end

	return false
end

function var_0_0.OnExit(arg_15_0)
	manager.windowBar:HideBar()
end

function var_0_0.Dispose(arg_16_0)
	arg_16_0.scroll_:Dispose()

	arg_16_0.scroll_ = nil

	var_0_0.super.Dispose(arg_16_0)
end

return var_0_0
