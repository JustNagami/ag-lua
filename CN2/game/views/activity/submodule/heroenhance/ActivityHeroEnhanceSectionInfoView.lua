local var_0_0 = import("game.views.sectionInfo.SectionInfoBaseView")
local var_0_1 = class("ActivityHeroEnhanceSectionInfoView", var_0_0)

function var_0_1.Init(arg_1_0)
	var_0_1.super.Init(arg_1_0)

	arg_1_0.sectionInfoThreeStarBar_ = SectionInfoThreeStarBar.New(arg_1_0.threeStarGo_)

	arg_1_0.hideThreeStarController_:SetSelectedState("false")
	arg_1_0.hideStageDescController_:SetSelectedState("false")
	arg_1_0.btnWebController_:SetSelectedState("notshow")
	arg_1_0.hideFatigueController_:SetSelectedState("close")
end

function var_0_1.OnClickBtn(arg_2_0)
	local var_2_0 = ActivityHeroEnhanceCfg[arg_2_0.params_.heroEnhance_CfgID]
	local var_2_1 = ActivityHeroEnhanceTools.GetCfgActivatedTalentList(var_2_0)
	local var_2_2 = {}

	for iter_2_0, iter_2_1 in ipairs(var_2_1) do
		var_2_2[TalentTreeCfg[iter_2_1].stage] = iter_2_1
	end

	local var_2_3
	local var_2_4 = ActivityHeroEnhanceTools.GetCfgTalentMaxStage(var_2_0)

	for iter_2_2 = 1, var_2_4 do
		if not var_2_2[iter_2_2] and not ActivityHeroEnhanceTools.IsCfgTalentStageLock(var_2_0, iter_2_2) then
			var_2_3 = iter_2_2

			break
		end
	end

	if var_2_3 then
		ShowMessageBox({
			title = GetTips("PROMPT"),
			content = GetTips("ACTIVITY_HERO_ENHANCE_TALENT_NOT_SELECT"),
			BtnText = {
				[2] = GetTips("ACTIVITY_HERO_ENHANCE_BUTTON_CONTINUE"),
				[3] = GetTips("ACTIVITY_HERO_ENHANCE_BUTTON_GO_SELECT")
			},
			OkCallback = function()
				JumpTools.OpenPageByJump("/activityHeroEnhanceHero", {
					activityID = var_2_0.activity_id,
					cfgId = var_2_0.id,
					stageToView = var_2_3
				})
			end,
			CancelCallback = function()
				arg_2_0:GoBattle()
			end
		})
	else
		arg_2_0:GoBattle()
	end
end

function var_0_1.GoBattle(arg_5_0)
	local var_5_0 = arg_5_0.stageID_
	local var_5_1 = BattleStageTools.GetStageCfg(arg_5_0.stageType_, var_5_0)
	local var_5_2 = arg_5_0.params_.activityID

	gameContext:Go("/sectionSelectHero", {
		section = var_5_0,
		sectionType = arg_5_0.stageType_,
		activityID = var_5_2,
		heroEnhance_CfgID = arg_5_0.params_.heroEnhance_CfgID
	})
end

function var_0_1.RefreshData(arg_6_0)
	var_0_1.super.RefreshData(arg_6_0)

	local var_6_0 = BattleStageTools.GetStageCfg(arg_6_0.stageType_, arg_6_0.stageID_)
	local var_6_1 = ActivityHeroEnhanceCfg[arg_6_0.params_.heroEnhance_CfgID]

	arg_6_0.lock_ = not ActivityHeroEnhanceTools.IsCfgStageUnlock(var_6_1, arg_6_0.stageID_)
	arg_6_0.lockTips_ = GetTips("ERROR_STAGE_NOT_CLEAR")
	arg_6_0.dropLibID_ = var_6_0.drop_lib_id

	local var_6_2 = ActivityHeroEnhanceData:IsStageClear(arg_6_0.params_.activityID, arg_6_0.stageID_)

	arg_6_0.isFirstClear_ = not var_6_2
	arg_6_0.cost = 0
	arg_6_0.threeStarDataList_ = {
		{
			var_6_2,
			{
				8
			}
		},
		{
			false
		},
		{
			false
		}
	}
end

function var_0_1.RefreshStageInfo(arg_7_0)
	local var_7_0 = BattleStageTools.GetStageCfg(arg_7_0.stageType_, arg_7_0.stageID_)

	arg_7_0.sectionName_.text = GetI18NText(var_7_0.name)
	arg_7_0.storyText_.text = GetI18NText(var_7_0.tips)
end

function var_0_1.RefreshUI(arg_8_0)
	var_0_1.super.RefreshUI(arg_8_0)
	arg_8_0.sectionInfoThreeStarBar_:SetData(arg_8_0.threeStarDataList_)
end

function var_0_1.Dispose(arg_9_0)
	arg_9_0.sectionInfoThreeStarBar_:Dispose()

	arg_9_0.sectionInfoThreeStarBar_ = nil

	var_0_1.super.Dispose(arg_9_0)
end

return var_0_1
