local var_0_0 = class("IlluPlotDetailItem", ReduxView)

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

	arg_3_0.controller_ = ControllerUtil.GetController(arg_3_0.gameObject_.transform, "ButItem")
end

function var_0_0.RefreshUI(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.storyID_ = arg_4_1
	arg_4_0.type_ = arg_4_2
	arg_4_0.unlock_ = IllustratedData:GetPlotInfo()[arg_4_1]

	if arg_4_0.unlock_ then
		local var_4_0 = StoryCfg[arg_4_1]
		local var_4_1 = VideoTrackCfg[arg_4_1 .. ".usm"]

		if var_4_0.videoPath ~= nil and var_4_0.videoPath ~= "" or var_4_0.videoType ~= nil and var_4_0.videoType == 1 or var_4_1 ~= nil and arg_4_0.unlock_ ~= nil then
			arg_4_0.controller_:SetSelectedState("video")
		else
			arg_4_0.controller_:SetSelectedState("normal")
		end
	else
		arg_4_0.controller_:SetSelectedState("empty")
	end

	arg_4_0.nameText_.text = GetI18NText(StoryCfg[arg_4_1].name)
end

function var_0_0.AddUIListener(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.itemBtn_, nil, function()
		arg_5_0:StoryShowTip()
	end)
end

function var_0_0.StoryShowTip(arg_7_0)
	if IllustratedData:GetPlotInfo()[arg_7_0.storyID_] then
		manager.story:StartStoryById(arg_7_0.storyID_, function(arg_8_0)
			IllustratedAction.ViewIllustration(arg_7_0.storyID_, CollectConst.PLOT)
			gameContext:Go("/blank")
			gameContext:Back()
		end)
	elseif arg_7_0.type_ == 1 then
		local var_7_0 = getStageViaStoryID(arg_7_0.storyID_)
		local var_7_1 = getChapterDifficulty(var_7_0)
		local var_7_2 = getChapterClientCfgByStageID(var_7_0).toggle
		local var_7_3, var_7_4 = BattleStageTools.GetChapterSectionIndex(var_7_2, var_7_0)
		local var_7_5 = string.format(GetTips("MISSION_PROGRESS_UNLOCK"), var_7_1, GetI18NText(var_7_3), GetI18NText(var_7_4))

		ShowTips(var_7_5)
	elseif arg_7_0.type_ == 2 then
		local var_7_6 = string.format(GetTips("ACTIVITY_MATRIX_PRECONDITIONS"), GetI18NText(StoryCfg[arg_7_0.storyID_].name))

		ShowTips(var_7_6)
	end
end

function var_0_0.Dispose(arg_9_0)
	var_0_0.super.Dispose(arg_9_0)
end

return var_0_0
