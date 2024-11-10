local var_0_0 = class("IlluPlotItem", ReduxView)

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

	arg_3_0.controller_ = ControllerUtil.GetController(arg_3_0.gameObject_.transform, "conName")
end

function var_0_0.RefreshUI(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.info_ = arg_4_1
	arg_4_0.selType_ = arg_4_2

	table.sort(arg_4_0.info_.storyList)

	local var_4_0 = 0

	for iter_4_0, iter_4_1 in ipairs(arg_4_0.info_.storyList) do
		if IllustratedData:GetPlotInfo()[iter_4_1] then
			var_4_0 = var_4_0 + 1
		end
	end

	arg_4_0.unlockNum_ = var_4_0

	if var_4_0 == 0 then
		arg_4_0.controller_:SetSelectedState("0")
	else
		arg_4_0.controller_:SetSelectedState("1")

		if arg_4_2 == 1 then
			local var_4_1 = ChapterCfg[arg_4_1.chapterID]

			arg_4_0.nameText_.text = GetI18NText(ChapterClientCfg[var_4_1.clientID].name)

			local var_4_2 = arg_4_1.all
			local var_4_3 = var_4_0

			arg_4_0.reveiveText_.text = var_4_3 .. "/" .. var_4_2

			local var_4_4 = SpritePathCfg.CollectPlotSmall.path .. ChapterClientCfg[arg_4_1.chapterID].chapter_paint

			getSpriteWithoutAtlasAsync(var_4_4, function(arg_5_0)
				arg_4_0.iconImg_.sprite = arg_5_0
			end)
		elseif arg_4_2 == 2 then
			local var_4_5 = CollectStoryCfg.get_id_list_by_activity[arg_4_1.chapterID][1]
			local var_4_6 = CollectStoryCfg[var_4_5].picture
			local var_4_7 = ActivityCfg[arg_4_1.chapterID].remark

			arg_4_0.nameText_.text = GetI18NText(var_4_7)

			local var_4_8 = arg_4_1.all

			arg_4_0.reveiveText_.text = var_4_0 .. "/" .. var_4_8

			local var_4_9 = SpritePathCfg.CollectPlotSmall.path .. var_4_6

			getSpriteWithoutAtlasAsync(var_4_9, function(arg_6_0)
				arg_4_0.iconImg_.sprite = arg_6_0
			end)
		elseif arg_4_2 == 3 then
			local var_4_10 = arg_4_0.info_.storyList[1]

			arg_4_0.nameText_.text = GetI18NText(StoryCfg[var_4_10].name)
			arg_4_0.reveiveText_.text = var_4_0 .. "/" .. arg_4_1.all

			local var_4_11 = SpritePathCfg.CollectPlotSmall.path .. CollectStoryCfg[var_4_10].picture

			getSpriteWithoutAtlasAsync(var_4_11, function(arg_7_0)
				arg_4_0.iconImg_.sprite = arg_7_0
			end)
		end
	end
end

function var_0_0.AddUIListener(arg_8_0)
	arg_8_0:AddBtnListener(arg_8_0.itemBtn_, nil, function()
		if arg_8_0.unlockNum_ > 0 then
			JumpTools.OpenPageByJump("/illuPlotDetail", {
				storyList = arg_8_0.info_.storyList,
				chapterID = arg_8_0.info_.chapterID,
				selType = arg_8_0.selType_
			})
		elseif arg_8_0.selType_ == 1 then
			local var_9_0 = arg_8_0.info_.storyList[1]
			local var_9_1 = getStageViaStoryID(var_9_0)
			local var_9_2 = getChapterDifficulty(var_9_1)
			local var_9_3 = getChapterClientCfgByStageID(var_9_1).toggle
			local var_9_4, var_9_5 = BattleStageTools.GetChapterSectionIndex(var_9_3, var_9_1)
			local var_9_6 = string.format(GetTips("MISSION_PROGRESS_UNLOCK"), var_9_2, GetI18NText(var_9_4), GetI18NText(var_9_5))

			ShowTips(var_9_6)
		end
	end)
end

function var_0_0.Dispose(arg_10_0)
	var_0_0.super.Dispose(arg_10_0)
end

return var_0_0
