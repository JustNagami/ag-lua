local var_0_0 = class("ZumaGameView", ReduxView)
local var_0_1 = {
	tabState = {
		hard = "state1",
		name = "tab",
		night = "state2",
		easy = "state0"
	},
	tabLockState = {
		onlyNightLock = "state1",
		name = "lock",
		onlyEasyOpen = "state2",
		allOpen = "state0"
	},
	rankShow = {
		noData = "state0",
		name = "ranking",
		showData = "state1"
	}
}

function var_0_0.UIName(arg_1_0)
	return "Widget/Version/NorseUI_3_0/NorseUI_3_0_ZumaUI/NorseUI_3_0_ZumaUI"
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

	arg_4_0.leftRootTrsCanvas = arg_4_0.leftRootTrs_:GetComponent(typeof(CanvasGroup))
	arg_4_0.tabStateController = arg_4_0.controllerexcollection_:GetController(var_0_1.tabState.name)
	arg_4_0.tabLockStateController = arg_4_0.controllerexcollection_:GetController(var_0_1.tabLockState.name)
	arg_4_0.rankShowController = arg_4_0.controllerexcollection_:GetController(var_0_1.rankShow.name)
	arg_4_0.chapterInfoView = ZumaMainViewChapterInfo.New(arg_4_0.chaptersectioninfouiGo_)

	arg_4_0.chapterInfoView:IsShowPanel(false)

	arg_4_0.stageInfoViewList = {}

	local var_4_0 = {
		"easystageGo_",
		"hardstageGo_",
		"nightmarestageGo_"
	}

	for iter_4_0, iter_4_1 in pairs(ZumaConst.ZUMA_DIFFICULT or {}) do
		arg_4_0.stageInfoViewList[iter_4_1] = ZumaMainStageInfoView.New(arg_4_0[var_4_0[iter_4_1]], iter_4_1)
	end
end

function var_0_0.AddUIListener(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.easyBtn_, nil, function()
		arg_5_0:OnClickStageDifficultChangeBtn(ZumaConst.ZUMA_DIFFICULT.ESAY)
	end)
	arg_5_0:AddBtnListener(arg_5_0.hardBtn_, nil, function()
		arg_5_0:OnClickStageDifficultChangeBtn(ZumaConst.ZUMA_DIFFICULT.HARD)
	end)
	arg_5_0:AddBtnListener(arg_5_0.nightmareBtn_, nil, function()
		arg_5_0:OnClickStageDifficultChangeBtn(ZumaConst.ZUMA_DIFFICULT.NIGHT)
	end)
	arg_5_0:AddBtnListener(arg_5_0.taskBtn_, nil, function()
		JumpTools.OpenPageByJump("ZumaTask")
	end)
	arg_5_0:AddBtnListener(arg_5_0.talentBtn_, nil, function()
		JumpTools.OpenPageByJump("/ZumaTalent")
	end)
	arg_5_0:AddBtnListener(arg_5_0.bgBtn_, nil, function()
		arg_5_0:RefreshZumaChapterInfo()
	end)
	arg_5_0:AddBtnListener(arg_5_0.maskBtn_, nil, function()
		arg_5_0:RefreshZumaChapterInfo()
	end)
	arg_5_0:AddBtnListener(arg_5_0.btnrankingBtn_, nil, function()
		arg_5_0:OnClickRankBtn()
	end)
	arg_5_0:RegistEventListener(ACTIVITY_UPDATE, function(arg_14_0)
		local var_14_0 = ActivityTools.GetActivityType(arg_14_0)

		if var_14_0 == ActivityTemplateConst.ACTIVITY_ZUMA_ENTER or var_14_0 == ActivityTemplateConst.ACTIVITY_ZUMA then
			arg_5_0:UpdateStageList()
			arg_5_0.chapterInfoView:UpdateBtnController()
		end
	end)
end

function var_0_0.OnClickRankBtn(arg_15_0)
	local var_15_0 = 242881

	JumpTools.OpenPageByJump("/ZumaRank", {
		rank_activity_id = var_15_0
	})
end

function var_0_0.OnClickStageDifficultChangeBtn(arg_16_0, arg_16_1)
	if arg_16_0.selectDifficultType == arg_16_1 then
		return
	end

	local var_16_0

	if arg_16_1 == ZumaConst.ZUMA_DIFFICULT.ESAY then
		var_16_0 = var_0_1.tabState.easy
	elseif arg_16_1 == ZumaConst.ZUMA_DIFFICULT.HARD then
		var_16_0 = var_0_1.tabState.hard
	elseif arg_16_1 == ZumaConst.ZUMA_DIFFICULT.NIGHT then
		var_16_0 = var_0_1.tabState.night
	end

	arg_16_0.tabStateController:SetSelectedState(var_16_0)

	arg_16_0.selectDifficultType = arg_16_1

	if arg_16_0.selectDifficultType == ZumaConst.ZUMA_DIFFICULT.NIGHT then
		local var_16_1 = arg_16_0.stageInfoViewList[arg_16_1]:GetAllScore()

		if var_16_1 == 0 then
			arg_16_0.rankShowController:SetSelectedState(var_0_1.rankShow.noData)
		else
			arg_16_0.rankShowController:SetSelectedState(var_0_1.rankShow.showData)
		end

		arg_16_0.numText_.text = var_16_1
	end
end

function var_0_0.RefreshZumaChapterInfo(arg_17_0, arg_17_1)
	if not arg_17_1 then
		arg_17_0.chapterInfoView:IsShowPanel(false)

		if arg_17_0.selectStageItem then
			arg_17_0.selectStageItem:UpdateSelectState(false)
			arg_17_0.stageInfoViewList[arg_17_0.selectDifficultType]:UpdateMoveView()
		end

		arg_17_0.selectStageItem = nil
		arg_17_0.leftRootTrsCanvas.blocksRaycasts = true

		return
	end

	arg_17_0.chapterInfoView:RefreshUi(arg_17_1)

	arg_17_0.leftRootTrsCanvas.blocksRaycasts = false
end

function var_0_0.UpdateZumaStageSelectItem(arg_18_0, arg_18_1)
	arg_18_0:SelectStageItem(arg_18_1)
end

function var_0_0.SelectStageItem(arg_19_0, arg_19_1)
	local var_19_0 = arg_19_0.stageInfoViewList[arg_19_0.selectDifficultType]:GetTragetItem(arg_19_1)

	if arg_19_0.selectStageItem == var_19_0 then
		return
	end

	if arg_19_0.selectStageItem then
		arg_19_0.selectStageItem:UpdateSelectState(false)
	end

	arg_19_0.selectStageItem = var_19_0

	arg_19_0.selectStageItem:UpdateSelectState(true)

	local var_19_1 = arg_19_0.selectStageItem:GetLevelCfg()

	arg_19_0:RefreshZumaChapterInfo(var_19_1)
	arg_19_0.stageInfoViewList[arg_19_0.selectDifficultType]:UpdateMoveView(arg_19_1)
end

function var_0_0.DefaultSelectChapter(arg_20_0)
	if arg_20_0.selectDifficultType ~= nil then
		return
	end

	local var_20_0 = ZumaData:GetZumaGameId()
	local var_20_1 = ActivityZumaLevelCfg[var_20_0] and ActivityZumaLevelCfg[var_20_0].difficult or ZumaConst.ZUMA_DIFFICULT.ESAY

	arg_20_0:OnClickStageDifficultChangeBtn(var_20_1)
	arg_20_0.stageInfoViewList[arg_20_0.selectDifficultType]:DefalutSelect(var_20_0)
	ZumaData:SetZumaGameId(0)
end

function var_0_0.UpdateStageList(arg_21_0, arg_21_1, arg_21_2)
	if arg_21_1 then
		arg_21_0.stageInfoViewList[arg_21_1]:RefreshStageUi(arg_21_2)
	else
		for iter_21_0, iter_21_1 in pairs(arg_21_0.stageInfoViewList) do
			iter_21_1:RefreshStageUi()
		end
	end
end

function var_0_0.GetDiffcultBtnRedTrs(arg_22_0, arg_22_1)
	local var_22_0

	if arg_22_1 == ZumaConst.ZUMA_DIFFICULT.ESAY then
		var_22_0 = arg_22_0.easyBtn_.transform
	elseif arg_22_1 == ZumaConst.ZUMA_DIFFICULT.HARD then
		var_22_0 = arg_22_0.hardBtn_.transform
	elseif arg_22_1 == ZumaConst.ZUMA_DIFFICULT.NIGHT then
		var_22_0 = arg_22_0.nightmareBtn_.transform
	end

	return var_22_0
end

function var_0_0.ShowDiffcultRed(arg_23_0, arg_23_1)
	for iter_23_0, iter_23_1 in pairs(arg_23_0.stageInfoViewList) do
		local var_23_0 = iter_23_1:GetDifficultCfgList()

		iter_23_1:SetRedState(arg_23_1)

		for iter_23_2, iter_23_3 in pairs(var_23_0) do
			local var_23_1 = iter_23_3.activity_id
			local var_23_2 = arg_23_0:GetDiffcultBtnRedTrs(iter_23_0)

			if arg_23_1 then
				manager.redPoint:bindUIandKey(var_23_2, string.format("%s_%s", RedPointConst.ZUMA_DIFFICULT, iter_23_0))
			else
				manager.redPoint:unbindUIandKey(var_23_2, string.format("%s_%s", RedPointConst.ZUMA_DIFFICULT, iter_23_0))
			end
		end
	end
end

function var_0_0.OnTop(arg_24_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR,
		INFO_BAR
	})
	manager.windowBar:RegistBackCallBack(function()
		if arg_24_0.chapterInfoView and arg_24_0.chapterInfoView.isShow then
			arg_24_0:RefreshZumaChapterInfo()
		else
			JumpTools.Back()
		end
	end)

	local var_24_0 = GameSetting.activity_zuma_describe and GameSetting.activity_zuma_describe.value or {}

	manager.windowBar:RegistInfoCallBack(function()
		if arg_24_0.chapterInfoView and arg_24_0.chapterInfoView.isShow then
			arg_24_0:RefreshZumaChapterInfo()
		else
			JumpTools.OpenPageByJump("gameHelpPro", {
				isPrefab = true,
				pages = var_24_0
			})
		end
	end)
end

function var_0_0.OnEnter(arg_27_0)
	arg_27_0:UpdateStageList()
	arg_27_0:DefaultSelectChapter()
	arg_27_0:ShowDiffcultRed(true)
	manager.redPoint:bindUIandKey(arg_27_0.taskBtn_.transform, RedPointConst.ZUMA_REWARD)
	manager.redPoint:bindUIandKey(arg_27_0.talentBtn_.transform, RedPointConst.ZUMA_TALENT)
	arg_27_0:RefreshTime()
	arg_27_0.chapterInfoView:OnEnter()

	if not getData("ZumaGame", "showHelp") then
		local var_27_0 = GameSetting.activity_zuma_describe and GameSetting.activity_zuma_describe.value or {}

		JumpTools.OpenPageByJump("gameHelpPro", {
			isPrefab = true,
			pages = var_27_0
		})
		saveData("ZumaGame", "showHelp", 1)
	end
end

function var_0_0.RefreshTime(arg_28_0)
	arg_28_0.activityData_ = ActivityData:GetActivityData(ZumaData:GetZumaActivityID())
	arg_28_0.startTime_ = arg_28_0.activityData_.startTime
	arg_28_0.stopTime_ = arg_28_0.activityData_.stopTime
	arg_28_0.timeLable_.text = manager.time:GetLostTimeStrWith2Unit(arg_28_0.stopTime_, true)
	arg_28_0.timer_ = Timer.New(function()
		arg_28_0.timeLable_.text = manager.time:GetLostTimeStrWith2Unit(arg_28_0.stopTime_, true)
		arg_28_0.stopTime_ = arg_28_0.stopTime_ - 1
	end, 1, -1)

	arg_28_0.timer_:Start()
end

function var_0_0.StopTimer(arg_30_0)
	if arg_30_0.timer_ then
		arg_30_0.timer_:Stop()

		arg_30_0.timer_ = nil
	end
end

function var_0_0.OnExit(arg_31_0)
	arg_31_0:RefreshZumaChapterInfo()
	manager.windowBar:HideBar()
	arg_31_0:StopTimer()
	arg_31_0:ShowDiffcultRed(false)
	arg_31_0.chapterInfoView:OnExit()
	manager.redPoint:unbindUIandKey(arg_31_0.taskBtn_.transform, RedPointConst.ZUMA_REWARD)
	manager.redPoint:unbindUIandKey(arg_31_0.talentBtn_.transform, RedPointConst.ZUMA_TALENT)
end

function var_0_0.Dispose(arg_32_0)
	for iter_32_0, iter_32_1 in pairs(arg_32_0.stageInfoViewList) do
		iter_32_1:Dispose()
	end

	var_0_0.super.Dispose(arg_32_0)
	arg_32_0.chapterInfoView:Dispose()
end

return var_0_0
