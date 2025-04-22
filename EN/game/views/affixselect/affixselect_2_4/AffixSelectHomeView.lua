local var_0_0 = import("game.views.activity.Main.toggle.ActivityMainBasePanel")
local var_0_1 = class("AffixSelectHomeView", var_0_0)

function var_0_1.GetUIName(arg_1_0)
	return "Widget/Version/V3_5_9_CustomizeUI/V3_5_9_AffixSelect/V3_5_9_StageUI"
end

function var_0_1.Init(arg_2_0)
	arg_2_0:InitUI()
	arg_2_0:AddUIListener()
end

function var_0_1.InitUI(arg_3_0)
	arg_3_0:BindCfgUI()

	arg_3_0.reward_btnstateController_ = ControllerUtil.GetController(arg_3_0.gameObject_.transform, "reward_btnstate")
	arg_3_0.bonusItem_ = CommonItemView.New(arg_3_0.bonusItemGo_, true)
	arg_3_0.items_ = {}

	for iter_3_0 = 1, 8 do
		local var_3_0 = AffixSelectItemView.New(arg_3_0["itemGo" .. iter_3_0 .. "_"])

		table.insert(arg_3_0.items_, var_3_0)
	end
end

function var_0_1.AddUIListener(arg_4_0)
	arg_4_0:AddBtnListener(arg_4_0.rewardBtn_, nil, function()
		OperationRecorder.RecordButtonTouch("activity_affixbattle_reward_firstpass")
		JumpTools.OpenPageByJump("affixSelectFirstRewardJapanRegion", {
			affixActivityId = arg_4_0.activityId
		})
	end)
	arg_4_0:AddBtnListener(arg_4_0.checkBtn_, nil, function()
		OperationRecorder.RecordButtonTouch("activity_affixbattle_reward_score")
		JumpTools.OpenPageByJump("affixSelectScoreRewardJapanRegion", {
			affixActivityId = arg_4_0.activityId
		})
	end)
	arg_4_0:AddBtnListener(arg_4_0.getBtn_, nil, function()
		local var_7_0 = ActivityAffixSelectData:GetCurrentActivityReward(arg_4_0.activityId)

		ActivityAction.ReceivePointReward({
			var_7_0
		})
	end)
	arg_4_0:AddBtnListener(nil, arg_4_0.m_tipBtn, function()
		local var_8_0 = GetTips("ACTIVITY_SKADI_SEA_DESCRIBE")

		JumpTools.OpenPageByJump("gameHelp", {
			icon = "icon_i",
			iconColor = Color(1, 1, 1),
			title = GetTips("STAGE_DESCRIPE"),
			content = GetTips("ACTIVITY_AFFIX_DESCRIBE")
		})
	end)
end

function var_0_1.OnEnter(arg_9_0)
	if SDKTools.GetIsOverSea then
		arg_9_0.activityId = ActivityConst.ACTIVITY_3_5_9_LOCAL_AFFIX_SELECT
	else
		arg_9_0.activityId = ActivityConst.ACTIVITY_3_2_AFFIX_SELECT
	end

	local var_9_0 = ActivityCfg[arg_9_0.activityId].sub_activity_list

	for iter_9_0, iter_9_1 in ipairs(arg_9_0.items_) do
		iter_9_1:SetData(iter_9_0, var_9_0[iter_9_0])
	end

	ActivityAffixSelectAction.ReadUnPassRedPoint()
	manager.redPoint:bindUIandKey(arg_9_0.firstPassNoticeContainer_, string.format("%s_%s", RedPointConst.AFFIX_SELECT_FIRST_BONUS_CAN_GET, arg_9_0.activityId), {
		x = 0,
		y = 0
	})
	manager.redPoint:bindUIandKey(arg_9_0.getBtn_.transform, string.format("%s_%s", RedPointConst.AFFIX_SELECT_SCORE_BONUS_CAN_GET, arg_9_0.activityId))
	arg_9_0:UpdateView()

	local var_9_1 = getData("affixSelect", "mainScrollPos")

	if var_9_1 then
		arg_9_0.itemScrollRect_.horizontalNormalizedPosition = var_9_1
	end

	arg_9_0:StartTimer()
	arg_9_0:RegistEventListener(ACTIVITY_REWARD_GET, handler(arg_9_0, arg_9_0.UpdateView))
end

function var_0_1.OnExit(arg_10_0)
	arg_10_0:StopTimer()
	arg_10_0:RemoveAllEventListener()
	saveData("affixSelect", "mainScrollPos", arg_10_0.itemScrollRect_.horizontalNormalizedPosition)
	manager.redPoint:unbindUIandKey(arg_10_0.firstPassNoticeContainer_)
	manager.redPoint:unbindUIandKey(arg_10_0.getBtn_.transform)
	arg_10_0:RemoveAllEventListener()
end

function var_0_1.StartTimer(arg_11_0)
	if arg_11_0.timer_ == nil then
		arg_11_0.timer_ = Timer.New(function()
			arg_11_0:UpdateTimer()
		end, 1, -1)
	end

	arg_11_0.timer_:Start()
end

function var_0_1.StopTimer(arg_13_0)
	if arg_13_0.timer_ then
		arg_13_0.timer_:Stop()

		arg_13_0.timer_ = nil
	end
end

function var_0_1.UpdateTimer(arg_14_0)
	local var_14_0 = ActivityData:GetActivityData(arg_14_0.activityId).stopTime

	arg_14_0.lastTimeLabel_.text = manager.time:GetLostTimeStrWith2Unit(var_14_0)
end

function var_0_1.UpdateView(arg_15_0)
	local var_15_0 = ActivityAffixSelectData:GetCurrentActivityReward(arg_15_0.activityId)
	local var_15_1 = ActivityPointRewardCfg[var_15_0]

	arg_15_0.currentScoreLabel_.text = ActivityAffixSelectData:GetTotalScore(arg_15_0.activityId)
	arg_15_0.totalScoreLabel_.text = "/" .. var_15_1.need

	local var_15_2 = ActivityAffixSelectData:GetRewardStatus(arg_15_0.activityId, var_15_0)

	if var_15_2 == 3 then
		arg_15_0.reward_btnstateController_:SetSelectedState("received")
	elseif var_15_2 == 1 then
		arg_15_0.reward_btnstateController_:SetSelectedState("normal")
	else
		arg_15_0.reward_btnstateController_:SetSelectedState("receive")
	end

	local var_15_3 = clone(ItemTemplateData)

	var_15_3.id = var_15_1.reward_item_list[1][1]
	var_15_3.number = var_15_1.reward_item_list[1][2]

	function var_15_3.clickFun(arg_16_0)
		ShowPopItem(POP_ITEM, {
			arg_16_0.id
		})
	end

	arg_15_0.bonusItem_:SetData(var_15_3)

	arg_15_0.bonusNumLabel_.text = var_15_1.reward_item_list[1][2]

	arg_15_0:UpdateTimer()
end

function var_0_1.OnReceivePointReward(arg_17_0, arg_17_1)
	arg_17_0:UpdateView()
end

function var_0_1.OnMainHomeViewTop(arg_18_0)
	return
end

function var_0_1.Dispose(arg_19_0)
	if arg_19_0.bonusItem_ then
		arg_19_0.bonusItem_:Dispose()

		arg_19_0.bonusItem_ = nil
	end

	if arg_19_0.items_ then
		for iter_19_0, iter_19_1 in pairs(arg_19_0.items_) do
			iter_19_1:Dispose()
		end

		arg_19_0.items_ = nil
	end

	arg_19_0:StopTimer()
	var_0_1.super.Dispose(arg_19_0)
end

return var_0_1
