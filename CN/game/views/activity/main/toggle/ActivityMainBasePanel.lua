local var_0_0 = class("ActivityMainBasePanel", ReduxView)

function var_0_0.GetUIName(arg_1_0)
	return
end

function var_0_0.Ctor(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0:GetRealActivityId(arg_2_2)

	local var_2_0 = Asset.Load(arg_2_0:GetUIName())

	arg_2_0.gameObject_ = Object.Instantiate(var_2_0, arg_2_1.transform)
	arg_2_0.transform_ = arg_2_0.gameObject_.transform

	arg_2_0:Init()
end

function var_0_0.Init(arg_3_0)
	arg_3_0:BindCfgUI()
	arg_3_0:AddListeners()
end

function var_0_0.OnEnter(arg_4_0)
	local var_4_0 = ActivityData:GetActivityData(arg_4_0.activityID_)

	arg_4_0.startTime_ = var_4_0.startTime
	arg_4_0.stopTime_ = var_4_0.stopTime

	arg_4_0:AddTimer()
	arg_4_0:HideRedPoint()
	arg_4_0:UpdateTitleShow()
end

function var_0_0.UpdatePreview(arg_5_0)
	if arg_5_0.preRewardListGo_ == nil then
		arg_5_0.preRewardListGo_ = arg_5_0:FindGo("panel/middle_adapt/Activity_Com_list03/content/UIList")
	end

	if arg_5_0.preRewardListGo_ and arg_5_0.preRewardList_ == nil then
		arg_5_0.preRewards_ = {}
		arg_5_0.preRewardList_ = LuaList.New(handler(arg_5_0, arg_5_0.IndexPreviewItem), arg_5_0.preRewardListGo_, CommonItemView)
	end

	local var_5_0 = ActivityCfg[arg_5_0.activityID_]

	if var_5_0 and var_5_0.reward_show and var_5_0.reward_show ~= "" and arg_5_0.preRewardList_ and arg_5_0.preRewardListGo_ then
		local var_5_1 = {}

		for iter_5_0, iter_5_1 in ipairs(var_5_0.reward_show) do
			table.insert(var_5_1, rewardToItemTemplate({
				id = iter_5_1
			}, nil, true))
		end

		arg_5_0.preRewards_ = ItemTools.SortRewardItemList(var_5_1)

		arg_5_0.preRewardList_:StartScroll(#arg_5_0.preRewards_)
	end
end

function var_0_0.IndexPreviewItem(arg_6_0, arg_6_1, arg_6_2)
	arg_6_2:SetData(arg_6_0.preRewards_[arg_6_1])
end

local var_0_1 = {
	"panel/middle_adapt/Activity_Com_tittle01/root/title/content/textTittle",
	"panel/middle_adapt/Activity_Com_tittle02/root/title/content/textTittle",
	"panel/middle_adapt/Activity_Com_tittle03/root/title/content/textTittle",
	"panel/middle_adapt/Activity_Com_tittle04/root/title/content/textTittle"
}
local var_0_2 = {
	"panel/middle_adapt/Activity_Com_tittle01/root/title/textcontent",
	"panel/middle_adapt/Activity_Com_tittle02/root/textcontent/Viewport/Content/text",
	"panel/middle_adapt/Activity_Com_tittle03/root/title/textcontent",
	"panel/middle_adapt/Activity_Com_tittle04/root/textcontent/Viewport/Content/text"
}

function var_0_0.UpdateTitleShow(arg_7_0)
	local var_7_0 = ActivityToggleCfg.get_id_list_by_activity_id[arg_7_0.toggleActivityID_]
	local var_7_1

	if var_7_0 then
		var_7_1 = var_7_0[1]
	end

	if not var_7_1 then
		return
	end

	if not arg_7_0.descText_ then
		for iter_7_0, iter_7_1 in pairs(var_0_2) do
			local var_7_2 = arg_7_0:FindGo(iter_7_1)

			if var_7_2 then
				arg_7_0.descText_ = var_7_2:GetComponent(typeof(Text))

				break
			end
		end
	end

	if not arg_7_0.titleTxt_ then
		for iter_7_2, iter_7_3 in pairs(var_0_1) do
			local var_7_3 = arg_7_0:FindGo(iter_7_3)

			if var_7_3 then
				arg_7_0.titleTxt_ = var_7_3:GetComponent(typeof(Text))

				break
			end
		end
	end

	local var_7_4 = ActivityToggleCfg[var_7_1]

	if var_7_4 and var_7_4.name ~= "" and arg_7_0.titleTxt_ then
		arg_7_0.titleTxt_.text = var_7_4.name
	end

	if var_7_4 and var_7_4.desc ~= "" and arg_7_0.descText_ then
		arg_7_0.descText_.text = var_7_4.desc
	end
end

function var_0_0.OnExit(arg_8_0)
	arg_8_0:StopTimer()
end

function var_0_0.OnTop(arg_9_0)
	return
end

function var_0_0.UpdateBar(arg_10_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR
	})
end

function var_0_0.Dispose(arg_11_0)
	var_0_0.super.Dispose(arg_11_0)

	if arg_11_0.preRewardList_ then
		arg_11_0.preRewardList_:Dispose()

		arg_11_0.preRewardList_ = nil
	end

	Object.Destroy(arg_11_0.gameObject_)

	arg_11_0.transform_ = nil
	arg_11_0.gameObject_ = nil
end

function var_0_0.AddListeners(arg_12_0)
	return
end

function var_0_0.Show(arg_13_0, arg_13_1)
	SetActive(arg_13_0.gameObject_, arg_13_1)

	if arg_13_1 then
		arg_13_0:UpdatePreview()
	end
end

function var_0_0.HideRedPoint(arg_14_0)
	return
end

function var_0_0.AddTimer(arg_15_0)
	arg_15_0:StopTimer()
	arg_15_0:RefreshTimeText()

	arg_15_0.timer_ = Timer.New(function()
		if manager.time:GetServerTime() > arg_15_0.stopTime_ then
			return
		end

		arg_15_0:RefreshTimeText()
	end, 1, -1)

	arg_15_0.timer_:Start()
end

function var_0_0.StopTimer(arg_17_0)
	if arg_17_0.timer_ then
		arg_17_0.timer_:Stop()

		arg_17_0.timer_ = nil
	end
end

function var_0_0.RefreshTimeText(arg_18_0)
	if arg_18_0.timeText_ then
		if arg_18_0:isHasLeftTimeDes() then
			local var_18_0, var_18_1 = arg_18_0:CheckAdvanceOpenTime()

			arg_18_0.timeText_.text = var_18_1

			arg_18_0:RefreshAcvanceStatus(not var_18_0)
		else
			arg_18_0.timeText_.text = manager.time:GetLostTimeStrWith2Unit(arg_18_0.stopTime_, true)
		end
	end
end

function var_0_0.isHasLeftTimeDes(arg_19_0)
	return false
end

function var_0_0.IsActivityTime(arg_20_0)
	if manager.time:GetServerTime() < arg_20_0.startTime_ then
		local var_20_0 = GetTips("OPEN_TIME")

		ShowTips(string.format(var_20_0, manager.time:GetLostTimeStrWith2Unit(arg_20_0.startTime_, true)))

		return false
	end

	if manager.time:GetServerTime() >= arg_20_0.stopTime_ then
		ShowTips("TIME_OVER")

		return false
	end

	return true
end

function var_0_0.CheckAdvanceOpenTime(arg_21_0)
	local var_21_0 = 0
	local var_21_1 = 0
	local var_21_2 = ActivityData:GetActivityData(arg_21_0.activityID_)

	if arg_21_0.isAdvanceActivity_ then
		var_21_1 = var_21_2.startTime
		var_21_0 = var_21_1 - manager.time:GetServerTime()
	end

	local var_21_3 = arg_21_0.isAdvanceActivity_ and var_21_0 > 0

	arg_21_0.stopTime_ = var_21_3 and var_21_2.startTime or var_21_2.stopTime

	local var_21_4 = var_21_3 and string.format(GetTips("AFTER_TIME"), manager.time:GetLostTimeStrWith2Unit(var_21_1)) or manager.time:GetLostTimeStrWith2UnitWithPrefix(var_21_2.stopTime)

	return var_21_3, var_21_4
end

function var_0_0.GetRealActivityId(arg_22_0, arg_22_1)
	local var_22_0 = ActivityData:GetActivityData(arg_22_1)

	arg_22_0.isAdvanceActivity_ = var_22_0.template == ActivityTemplateConst.ACTIVITY_ADVANCE_OPEN or var_22_0.template == ActivityTemplateConst.ACTIVITY_ADVANCE_PRE_OPEN
	arg_22_0.toggleActivityID_ = arg_22_1
	arg_22_0.activityID_ = arg_22_0.isAdvanceActivity_ and var_22_0.subActivityIdList[1] or arg_22_1
end

function var_0_0.RefreshAcvanceStatus(arg_23_0, arg_23_1)
	return
end

function var_0_0.BindHelpBtn(arg_24_0, arg_24_1, arg_24_2)
	arg_24_2 = arg_24_2 or arg_24_0.tipsBtn_

	if isNil(arg_24_2) then
		return
	end

	local var_24_0 = type(arg_24_1)
	local var_24_1

	if var_24_0 == "function" then
		var_24_1 = arg_24_1
	else
		local var_24_2
		local var_24_3

		if var_24_0 == "string" then
			local var_24_4 = GetTips(arg_24_1)

			var_24_2, var_24_3 = "gameHelp", {
				icon = "icon_i",
				iconColor = Color(1, 1, 1),
				title = GetTips("STAGE_DESCRIPE"),
				content = var_24_4,
				key = arg_24_1
			}
		elseif var_24_0 == "table" then
			var_24_2, var_24_3 = arg_24_1.view, arg_24_1.params
		end

		if var_24_2 then
			function var_24_1()
				JumpTools.OpenPageByJump(var_24_2, var_24_3)
			end
		end
	end

	arg_24_0:AddBtnListenerScale(arg_24_2, nil, var_24_1)
end

return var_0_0
