ActivityMainBasePanel = import("game.views.activity.Main.toggle.ActivityMainBasePanel")

local var_0_0 = class("ActivityChapterPageView", ActivityMainBasePanel)

function var_0_0.GetUIName(arg_1_0)
	return ActivityChapterPageCfg[arg_1_0.activityID_].prefab_path
end

function var_0_0.Init(arg_2_0)
	var_0_0.super.Init(arg_2_0)

	if arg_2_0.videoGo_ then
		arg_2_0.criManaExMultipleVedio_ = arg_2_0.videoGo_.transform:GetComponent(typeof(CriManaExMultipleVedio))
	end
end

function var_0_0.OnEnter(arg_3_0)
	arg_3_0:CheckLimitTimeChapter()
	var_0_0.super.OnEnter(arg_3_0)
	manager.redPoint:bindUIandKey(arg_3_0.chapterBtn_.transform, ActivityTools.GetRedPointKey(arg_3_0.activityID_) .. arg_3_0.activityID_)

	if arg_3_0.videoGo_ and ActivityVersionData:GetFirstEnterActivityFlag(arg_3_0.activityID_) then
		arg_3_0.criManaExMultipleVedio_:PlayByIndex(1)
	end

	ActivityVersionData:SetFirstEnterActivityFlag(arg_3_0.activityID_)
end

function var_0_0.OnExit(arg_4_0)
	var_0_0.super.OnExit(arg_4_0)
	manager.redPoint:unbindUIandKey(arg_4_0.chapterBtn_.transform, ActivityTools.GetRedPointKey(arg_4_0.activityID_) .. arg_4_0.activityID_)
end

function var_0_0.AddListeners(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.chapterBtn_, nil, function()
		if not arg_5_0:IsActivityTime() then
			return
		end

		if ActivityChapterPageCfg[arg_5_0.activityID_].chapter_type == 1 then
			local var_6_0 = ChapterTools.GetChapterIDByClient(arg_5_0.chapterClientID_)

			if ChapterTools.IsFinishPreChapter(var_6_0) then
				ChapterTools.GotoChapterSection(var_6_0)

				return
			end

			ShowTips("TIME_OVER")
		else
			JumpTools.Jump2SubPlot(arg_5_0.chapterClientID_, nil, true)
		end
	end)
end

function var_0_0.CheckLimitTimeChapter(arg_7_0)
	arg_7_0.chapterClientID_ = ActivityChapterPageCfg[arg_7_0.activityID_].chapter_client_id

	if arg_7_0.timeGo_ then
		if ChapterTools.GetChapterShowTypeData(arg_7_0.chapterClientID_) == "limitTime" then
			arg_7_0.timeText_ = arg_7_0.timeGo_.transform:Find("iconbg/texttime"):GetComponent("Text")

			arg_7_0.timeGo_:SetActive(true)
		else
			arg_7_0.timeGo_:SetActive(false)
		end
	end
end

return var_0_0
