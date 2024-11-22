local var_0_0 = class("ChapterMapView", ReduxView)
local var_0_1 = import("game.const.BattleConst")

function var_0_0.UIName(arg_1_0)
	return "Widget/System/Operation/OperationOvUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0.toggleView_ = {}
	arg_3_0.contentView_ = {}
	arg_3_0.multiTimeRefresh_ = 0

	arg_3_0:InitUI()
end

function var_0_0.OnTop(arg_4_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR,
		NAVI_BAR,
		INVITE_BAR
	})
end

function var_0_0.OnEnter(arg_5_0, arg_5_1)
	SetActive(arg_5_0.mainContent_, false)
	SetActive(arg_5_0.resourceContent_, false)
	SetActive(arg_5_0.equipContent_, false)
	SetActive(arg_5_0.challengeContent_, false)
	SetActive(arg_5_0.plotExPanel_, false)
	manager.ui:SetMainCamera("chapterSelect")

	for iter_5_0, iter_5_1 in pairs(arg_5_0.contentView_) do
		iter_5_1:OnEnter()
	end

	for iter_5_2, iter_5_3 in pairs(arg_5_0.toggleView_) do
		iter_5_3:OnEnter()
	end

	if ActivityMultiRewardData:CheckMultiReward() then
		arg_5_0.timer_ = Timer.New(function()
			arg_5_0.multiRefreshText_.text = string.format(GetTips("REFRESH_LOST_TIME"), manager.time:GetLostTimeStr(arg_5_0.multiTimeRefresh_))
		end, 1, -1)

		arg_5_0.timer_:Start()
	end

	arg_5_0:SwitchToggle(arg_5_0.params_.chapterToggle)
end

function var_0_0.OnExit(arg_7_0)
	manager.windowBar:HideBar()

	for iter_7_0, iter_7_1 in pairs(arg_7_0.contentView_) do
		iter_7_1:OnExit()
	end

	manager.ui:ResetMainCamera()

	for iter_7_2, iter_7_3 in pairs(arg_7_0.toggleView_) do
		iter_7_3:OnExit()
	end

	if arg_7_0.timer_ then
		arg_7_0.timer_:Stop()

		arg_7_0.timer_ = nil
	end

	arg_7_0:RecordStay(arg_7_0.curToggle)
	LuaForCursor.SetFullscreenScrollObject(nil)
end

function var_0_0.Dispose(arg_8_0)
	if arg_8_0.clickListenerTimer_ then
		arg_8_0.clickListenerTimer_:Stop()

		arg_8_0.clickListenerTimer_ = nil
	end

	for iter_8_0, iter_8_1 in pairs(arg_8_0.toggleView_) do
		iter_8_1:Dispose()
	end

	arg_8_0.toggleView_ = nil

	for iter_8_2, iter_8_3 in pairs(arg_8_0.contentView_) do
		iter_8_3:Dispose()
	end

	arg_8_0.contentView_ = nil

	var_0_0.super.Dispose(arg_8_0)

	arg_8_0.mainToggle_ = nil
	arg_8_0.resourceToggle_ = nil
	arg_8_0.equipToggle_ = nil
	arg_8_0.challengeToggle_ = nil
	arg_8_0.mapContent_ = nil
	arg_8_0.resourceContent_ = nil
	arg_8_0.challengeContent_ = nil
	arg_8_0.equipContent_ = nil
end

function var_0_0.OnUpdate(arg_9_0)
	arg_9_0:SwitchToggle(arg_9_0.params_.chapterToggle)
end

function var_0_0.InitUI(arg_10_0)
	arg_10_0:BindCfgUI()

	arg_10_0.toggleView_[var_0_1.TOGGLE.MAIN] = ChapterBtnView.New(arg_10_0.mainButton_, var_0_1.TOGGLE.MAIN)
	arg_10_0.toggleView_[var_0_1.TOGGLE.RESOURCE] = ChapterBtnView.New(arg_10_0.resourceButton_, var_0_1.TOGGLE.RESOURCE)
	arg_10_0.toggleView_[var_0_1.TOGGLE.CHALLENGE] = ChapterBtnView.New(arg_10_0.challengeButton_, var_0_1.TOGGLE.CHALLENGE)
	arg_10_0.toggleView_[var_0_1.TOGGLE.EQUIP] = ChapterBtnView.New(arg_10_0.equipButton_, var_0_1.TOGGLE.EQUIP)
end

function var_0_0.SwitchToggle(arg_11_0, arg_11_1)
	arg_11_0:HideWeakGuide()

	if arg_11_0.contentView_[arg_11_1] == nil then
		arg_11_0:CreateContentView(arg_11_1)
	end

	for iter_11_0, iter_11_1 in pairs(arg_11_0.contentView_) do
		arg_11_0.contentView_[iter_11_0]:SetActive(iter_11_0 == arg_11_1)
	end

	for iter_11_2, iter_11_3 in pairs(arg_11_0.toggleView_) do
		arg_11_0.toggleView_[iter_11_2]:SelectChapterToggle(iter_11_2 == arg_11_1)
	end

	if arg_11_0.curToggle and arg_11_1 ~= arg_11_0.curToggle then
		arg_11_0:RecordStay(arg_11_0.curToggle)
	end

	arg_11_0.curToggle = arg_11_1

	local var_11_0, var_11_1 = ActivityMultiRewardData:GetMultiRatioByChapterOrToggle(arg_11_0.curToggle, nil)

	if var_11_0 > 0 then
		local var_11_2, var_11_3 = ActivityMultiRewardData:GetCountByActivityID(var_11_1)

		arg_11_0.multiCountText_.text = var_11_2 .. "/" .. var_11_3
		arg_11_0.multiRatioText_.text = var_11_0 / 100

		local var_11_4 = ActivityData:GetActivityData(var_11_1)

		arg_11_0.multiEndText_.text = manager.time:STimeDescS(var_11_4.stopTime, "!%Y/%m/%d %H:%M")
		arg_11_0.multiTimeRefresh_ = ActivityMultiRewardData:GetTimeByActivityID(var_11_1)
		arg_11_0.multiRefreshText_.text = string.format(GetTips("REFRESH_LOST_TIME"), manager.time:GetLostTimeStr(arg_11_0.multiTimeRefresh_))

		SetActive(arg_11_0.multiGo_, true)
	else
		SetActive(arg_11_0.multiGo_, false)
	end

	if arg_11_1 == var_0_1.TOGGLE.RESOURCE or arg_11_1 == var_0_1.TOGGLE.EQUIP or arg_11_1 == var_0_1.TOGGLE.CHALLENGE then
		local var_11_5 = arg_11_0.contentView_[arg_11_1]

		LuaForCursor.SetFullscreenScrollObject(var_11_5.scrollView_.gameObject)
	else
		LuaForCursor.SetFullscreenScrollObject(nil)
	end
end

function var_0_0.CreateContentView(arg_12_0, arg_12_1)
	if arg_12_1 == var_0_1.TOGGLE.MAIN then
		arg_12_0.contentView_[arg_12_1] = ChapterMainContentView.New(arg_12_0.mainContent_, arg_12_1)
	elseif arg_12_1 == var_0_1.TOGGLE.RESOURCE then
		arg_12_0.contentView_[arg_12_1] = ChapterDailyContentView.New(arg_12_0.resourceContent_, arg_12_1)
	elseif arg_12_1 == var_0_1.TOGGLE.EQUIP then
		arg_12_0.contentView_[arg_12_1] = ChapterEquipContentView.New(arg_12_0.equipContent_, arg_12_1)
	elseif arg_12_1 == var_0_1.TOGGLE.CHALLENGE then
		arg_12_0.contentView_[arg_12_1] = ChapterChallengeContentView.New(arg_12_0.challengeContent_, arg_12_1, arg_12_0)
	end

	arg_12_0.contentView_[arg_12_1]:OnEnter()
end

function var_0_0.RecordStay(arg_13_0, arg_13_1)
	local var_13_0 = arg_13_0:GetStayTime()

	if var_13_0 == 0 then
		return
	end

	local var_13_1 = 0

	if arg_13_1 == var_0_1.TOGGLE.MAIN then
		var_13_1 = 70
	elseif arg_13_1 == var_0_1.TOGGLE.RESOURCE then
		var_13_1 = 20
	elseif arg_13_1 == var_0_1.TOGGLE.EQUIP then
		var_13_1 = 30
	elseif arg_13_1 == var_0_1.TOGGLE.CHALLENGE then
		var_13_1 = 40
	end

	OperationRecorder.RecordStayView("STAY_VIEW_CHAPTER_MAP", var_13_0, var_13_1)
	arg_13_0:UpdateLastOpenTime()
end

function var_0_0.OnAssetPendDownloadEnd(arg_14_0, arg_14_1, arg_14_2)
	if arg_14_0.contentView_[arg_14_0.curToggle] and arg_14_0.contentView_[arg_14_0.curToggle].RefreshUI then
		arg_14_0.contentView_[arg_14_0.curToggle]:RefreshUI()
	end
end

return var_0_0
