local var_0_0 = import("game.views.sectionInfo.SectionInfoBaseView")
local var_0_1 = class("OsirisPlayGameSectionInfoView", var_0_0)

function var_0_1.UIName(arg_1_0)
	return "Widget/System/Activity_Osiris/Activity_Osiris_ChapterSectionInfoUI"
end

function var_0_1.Init(arg_2_0)
	var_0_1.super.Init(arg_2_0)
end

function var_0_1.OnClickBtn(arg_3_0)
	local var_3_0 = ActivityGeneralityStageCfg[arg_3_0.stageID_].stage_id

	JumpTools.OpenPageByJump("/osirisPlayGameSectionSelectHeroView", {
		section = var_3_0,
		sectionType = BattleConst.STAGE_TYPE_NEW.OSIRIS_PLAY_GAME,
		activityID = arg_3_0.params_.activityID_,
		heroDataType = HeroConst.HERO_DATA_TYPE.OSIRISPLAYGAME
	})
end

function var_0_1.RefreshStageInfo(arg_4_0)
	arg_4_0.hideFatigueController_:SetSelectedState("close")

	local var_4_0 = ActivityGeneralityStageCfg[arg_4_0.stageID_].stage_id
	local var_4_1 = BattleStageTools.GetStageCfg(arg_4_0.stageType_, var_4_0)

	if arg_4_0.oldCfgID_ ~= var_4_1.id then
		local var_4_2, var_4_3 = BattleStageTools.GetChapterSectionIndex(arg_4_0.stageType_, arg_4_0.stageID_)

		arg_4_0.sectionText_.text = string.format("%s-%s", GetI18NText(var_4_2), GetI18NText(var_4_3))
		arg_4_0.sectionName_.text = GetI18NText(var_4_1.name)
		arg_4_0.oldCfgID_ = var_4_1.id

		local var_4_4 = ActivityGeneralityStageCfg[arg_4_0.stageID_].generality
		local var_4_5 = ActivityGeneralityTagCfg[var_4_4]

		arg_4_0.titleText_.text = GetI18NText(var_4_5.name)
		arg_4_0.descText_.text = GetI18NText(var_4_5.desc)

		local var_4_6 = OsirisPlayGameData:GetStageInfoById(var_4_0)

		arg_4_0.maxScoreText_.text = var_4_6.point and var_4_6.point or 0
		arg_4_0.typeTagIcon_.sprite = pureGetSpriteWithoutAtlas("TextureConfig/Activity_Osiris/" .. var_4_4)
	end
end

function var_0_1.UpdateBar(arg_5_0)
	local var_5_0 = BattleStageTools.GetStageCfg(arg_5_0.stageType_, arg_5_0.stageID_)

	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR
	})
end

function var_0_1.OnExit(arg_6_0)
	arg_6_0.super.OnExit(arg_6_0)
	manager.windowBar:HideBar()
end

return var_0_1
