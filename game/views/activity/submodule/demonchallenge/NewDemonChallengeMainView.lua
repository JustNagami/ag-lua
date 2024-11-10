local var_0_0 = class("NewDemonChallengeMainView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return nil
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.InitGo(arg_3_0, arg_3_1)
	if arg_3_0.gameObject_ then
		arg_3_0:Dispose()
		Object.Destroy(arg_3_0.gameObject_)
	end

	local var_3_0 = Asset.Load(arg_3_1)

	arg_3_0.gameObject_ = Object.Instantiate(var_3_0, arg_3_0:UIParent())
	arg_3_0.transform_ = arg_3_0.gameObject_.transform

	arg_3_0:InitUI()
	arg_3_0:AddUIListener()
end

function var_0_0.InitUI(arg_4_0)
	arg_4_0:BindCfgUI()

	arg_4_0.tree_ = LuaTree.New(arg_4_0.treeGo_)

	arg_4_0.tree_:SetSelectedHandler(handler(arg_4_0, arg_4_0.OnLevelSelect))
	arg_4_0.tree_:SetRenderer(handler(arg_4_0, arg_4_0.LevelRenderer))

	arg_4_0.levelControllerS_ = {}
	arg_4_0.lockTextS_ = {}
	arg_4_0.iconS_ = {}
	arg_4_0.difficultyControllerList_ = {}
	arg_4_0.difficultyControllerList_[1] = ControllerUtil.GetController(arg_4_0.difficultyContentTrans_, "nor")
	arg_4_0.difficultyControllerList_[2] = ControllerUtil.GetController(arg_4_0.difficultyContentTrans_, "diff")
	arg_4_0.difficultyControllerList_[3] = ControllerUtil.GetController(arg_4_0.difficultyContentTrans_, "hard")
end

function var_0_0.AddUIListener(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.rewardBtn_, nil, function()
		if not ActivityData:GetActivityIsOpen(arg_5_0.activityId_) then
			ShowTips("TIME_OVER")

			return
		end

		JumpTools.OpenPageByJump("newDemonChallengeReward", {
			activityID = arg_5_0.activityId_
		})
	end)
	arg_5_0:AddBtnListener(arg_5_0.startBtn_, nil, function()
		if not ActivityData:GetActivityIsOpen(arg_5_0.activityId_) then
			ShowTips("TIME_OVER")

			return
		end

		JumpTools.OpenPageByJump("newDemonChallengeDifficultySelect", {
			selectId = arg_5_0.curSelectId_
		})
	end)
end

function var_0_0.InitTree(arg_8_0)
	local var_8_0 = UITreeData.New()
	local var_8_1 = ActivityData:GetActivityData(arg_8_0.activityId_).subActivityIdList

	for iter_8_0 = 1, #var_8_1 do
		local var_8_2 = UITreeGroupData.New()

		var_8_2.id = var_8_1[iter_8_0]

		local var_8_3 = DemonChallengeTools.GetStageId(var_8_1[iter_8_0], 1, true)
		local var_8_4 = BattleNewHeartDemonStageCfg[var_8_3]

		if var_8_4 then
			var_8_2.text = GetI18NText(var_8_4.name)
		end

		var_8_0.groupDatas:Add(var_8_2)
	end

	arg_8_0.tree_:SetData(var_8_0)
end

function var_0_0.OnLevelSelect(arg_9_0, arg_9_1, arg_9_2, arg_9_3, arg_9_4)
	local var_9_0 = ActivityData:GetActivityData(arg_9_2)

	if not var_9_0:IsActivitying() then
		if arg_9_0.curLevelIndex_ and arg_9_0.curLevelIndex_ ~= arg_9_1 then
			if var_9_0.stopTime <= manager.time:GetServerTime() then
				ShowTips("TIME_OVER")
			else
				ShowTips(string.format(GetTips("OPEN_TIME"), manager.time:GetLostTimeStr(var_9_0.startTime)))
			end

			arg_9_0.tree_:SelectGroup(arg_9_0.curLevelIndex_)
		else
			arg_9_0.isNeedExit_ = true
		end

		return
	end

	arg_9_0.curLevelIndex_ = arg_9_1
	arg_9_0.curSelectId_ = arg_9_2

	local var_9_1 = DemonChallengeTools.GetChildId(arg_9_0.curSelectId_, 1, true)
	local var_9_2 = getSpriteWithoutAtlas("TextureConfig/" .. NewDemonChallengeCfg[var_9_1].icon)

	if var_9_2 then
		arg_9_0.roleImg_.sprite = var_9_2
	end

	arg_9_0:RefreshDescText()
	NewDemonChallengeAction.SetSelectedActivityId(arg_9_2)
	arg_9_0:RefreshCompleteStatus(arg_9_2)
end

function var_0_0.RefreshCompleteStatus(arg_10_0, arg_10_1)
	local var_10_0 = NewDemonChallengeData:GetChallengeInfo(arg_10_1)

	for iter_10_0, iter_10_1 in ipairs(var_10_0.challengeInfo) do
		if iter_10_1.challenge_state == ActivityConst.DEMON_CHALLENGE_STATE.UNFINISHED then
			arg_10_0.difficultyControllerList_[iter_10_0]:SetSelectedState("off")
		else
			arg_10_0.difficultyControllerList_[iter_10_0]:SetSelectedState("on")
		end
	end
end

function var_0_0.LevelRenderer(arg_11_0, arg_11_1, arg_11_2)
	if arg_11_0.levelControllerS_[arg_11_1] == nil then
		arg_11_0.levelControllerS_[arg_11_1] = ControllerUtil.GetController(arg_11_2.transform, "lock")
	end

	arg_11_0.levelControllerS_[arg_11_1]:SetSelectedState("false")

	arg_11_0.lockTextS_[arg_11_1] = arg_11_0:FindCom(typeof(Text), "title/lock/text", arg_11_2.transform)
end

function var_0_0.RefreshDescText(arg_12_0)
	local var_12_0 = DemonChallengeTools.GetStageId(arg_12_0.curSelectId_, 1, true)
	local var_12_1 = BattleNewHeartDemonStageCfg[var_12_0]

	if var_12_1 then
		arg_12_0.descText_.text = GetI18NText(var_12_1.tips)

		if arg_12_0.titleText_ then
			arg_12_0.titleText_.text = GetI18NText(var_12_1.name)
		end
	end
end

function var_0_0.RefreshTime(arg_13_0)
	local var_13_0 = ActivityData:GetActivityData(arg_13_0.activityId_)

	if var_13_0:GetRemainTime() >= 0 then
		arg_13_0.remainTimeText_.text = manager.time:GetLostTimeStr(var_13_0.stopTime)
	end

	for iter_13_0, iter_13_1 in pairs(arg_13_0.lockTextS_) do
		local var_13_1 = ActivityData:GetActivityData(iter_13_0)

		if var_13_1:GetTimeBeforeStart() > 0 then
			arg_13_0.levelControllerS_[iter_13_0]:SetSelectedState("false")

			arg_13_0.lockTextS_[iter_13_0].text = string.format(GetTips("OPEN_TIME"), manager.time:GetLostTimeStr(var_13_1.startTime))

			if arg_13_0.iconS_[iter_13_0] then
				arg_13_0.iconS_[iter_13_0].color = Color.gray
			end
		else
			arg_13_0.levelControllerS_[iter_13_0]:SetSelectedState("true")

			if arg_13_0.iconS_[iter_13_0] then
				arg_13_0.iconS_[iter_13_0].color = Color.white
			end
		end
	end
end

function var_0_0.RegisterRedPoint(arg_14_0)
	local var_14_0 = ActivityData:GetActivityData(arg_14_0.activityId_).subActivityIdList

	for iter_14_0 = 1, #var_14_0 do
		local var_14_1 = arg_14_0.tree_:GetGroupRedPointContainerById(var_14_0[iter_14_0])

		manager.redPoint:bindUIandKey(var_14_1, RedPointConst.NEW_DEMON_CHALLENGE_UNFINISH .. var_14_0[iter_14_0])
	end

	manager.redPoint:bindUIandKey(arg_14_0.rewardBtn_.transform, RedPointConst.NEW_DEMON_CHALLENGE_REWARD .. arg_14_0.activityId_)
end

function var_0_0.UnRegisterRedPoint(arg_15_0)
	local var_15_0 = ActivityData:GetActivityData(arg_15_0.activityId_).subActivityIdList

	for iter_15_0 = 1, #var_15_0 do
		local var_15_1 = arg_15_0.tree_:GetGroupRedPointContainerById(var_15_0[iter_15_0])

		manager.redPoint:unbindUIandKey(var_15_1, RedPointConst.NEW_DEMON_CHALLENGE_UNFINISH .. var_15_0[iter_15_0])
	end

	manager.redPoint:unbindUIandKey(arg_15_0.rewardBtn_.transform, RedPointConst.NEW_DEMON_CHALLENGE_REWARD .. arg_15_0.activityId_)
end

function var_0_0.StartUpdateTimer(arg_16_0)
	arg_16_0:StopUpdatTimer()
	arg_16_0:RefreshTime()

	arg_16_0.updateTimer_ = Timer.New(function()
		arg_16_0:RefreshTime()
	end, 1, -1)

	arg_16_0.updateTimer_:Start()
end

function var_0_0.StopUpdatTimer(arg_18_0)
	if arg_18_0.updateTimer_ then
		arg_18_0.updateTimer_:Stop()

		arg_18_0.updateTimer_ = nil
	end
end

function var_0_0.OnEnter(arg_19_0)
	if not arg_19_0.activityId_ or arg_19_0.params_.activityID ~= arg_19_0.activityId_ then
		arg_19_0.activityId_ = arg_19_0.params_.activityID

		arg_19_0:InitGo(DemonChallengeTools.GetMainUIName(arg_19_0.params_.activityID))
		arg_19_0:InitTree()
	end

	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR,
		INFO_BAR
	})
	manager.windowBar:SetGameHelpKey("ACTIVITY_DEMON_CHALLENGE_DESCRIPE_" .. arg_19_0.activityId_)
	arg_19_0:StartUpdateTimer()
	arg_19_0:RegisterRedPoint()

	if arg_19_0.params_.childId then
		local var_19_0 = ActivityData:GetActivityData(arg_19_0.activityId_).subActivityIdList
		local var_19_1 = table.indexof(var_19_0, arg_19_0.params_.childId)

		if var_19_1 then
			arg_19_0.tree_:SelectGroup(var_19_1)
		end

		arg_19_0.params_.childId = nil
	elseif arg_19_0.curLevelIndex_ then
		arg_19_0.tree_:SelectGroup(arg_19_0.curLevelIndex_)
	end

	if arg_19_0.isNeedExit_ then
		ShowTips("TIME_OVER")

		arg_19_0.timer_ = Timer.New(function()
			JumpTools.Back()
		end, 0.2, 1)

		arg_19_0.timer_:Start()
	end
end

function var_0_0.OnExit(arg_21_0)
	arg_21_0:StopUpdatTimer()
	arg_21_0:UnRegisterRedPoint()
	manager.windowBar:HideBar()
end

function var_0_0.Dispose(arg_22_0)
	var_0_0.super.Dispose(arg_22_0)
	arg_22_0.tree_:Dispose()

	arg_22_0.activityId_ = nil
end

return var_0_0
