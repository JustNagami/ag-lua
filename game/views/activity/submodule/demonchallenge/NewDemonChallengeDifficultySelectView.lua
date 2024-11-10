local var_0_0 = class("NewDemonChallengeDifficultySelectView", ReduxView)

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

local var_0_1 = 3

function var_0_0.InitUI(arg_4_0)
	arg_4_0:BindCfgUI()

	arg_4_0.selectController_ = ControllerUtil.GetController(arg_4_0.transform_, "selectDifficulty")
	arg_4_0.completedUIControllerS_ = {}

	for iter_4_0 = 1, var_0_1 do
		arg_4_0.completedUIControllerS_[iter_4_0] = ControllerUtil.GetController(arg_4_0[string.format("Level%dBtn_", iter_4_0)].transform, "completed")
	end

	arg_4_0.startImg_ = arg_4_0.startBtn_.gameObject:GetComponent(typeof(Image))
	arg_4_0.affixItemList_ = {}
end

function var_0_0.AddUIListener(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.startBtn_, nil, function()
		if not ActivityData:GetActivityIsOpen(arg_5_0.activityId_) then
			ShowTips("TIME_OVER")

			return
		end

		if arg_5_0.difficultyIndex_ == nil then
			ShowTips("SELECT_CURRENT")

			return
		end

		local var_6_0 = DemonChallengeTools.GetChildId(arg_5_0.activityId_, arg_5_0.difficultyIndex_, true)
		local var_6_1 = DemonChallengeTools.GetStageId(arg_5_0.activityId_, arg_5_0.difficultyIndex_, true)

		arg_5_0:Go("/sectionSelectHero", {
			section = var_6_1,
			sectionType = BattleConst.STAGE_TYPE_NEW.NEW_DEMON,
			activityID = var_6_0
		})
	end)

	for iter_5_0 = 1, var_0_1 do
		arg_5_0:AddBtnListener(arg_5_0[string.format("Level%dBtn_", iter_5_0)], nil, function()
			if not ActivityData:GetActivityIsOpen(arg_5_0.activityId_) then
				ShowTips("TIME_OVER")

				return
			end

			arg_5_0:RefreshDifficult(iter_5_0)
		end)
	end
end

function var_0_0.OnEnter(arg_8_0)
	if not arg_8_0.activityId_ or arg_8_0.params_.selectId ~= arg_8_0.activityId_ then
		arg_8_0.activityId_ = arg_8_0.params_.selectId

		if not arg_8_0.mainActivityId_ or arg_8_0.params_.activityId ~= arg_8_0.mainActivityId_ then
			arg_8_0.mainActivityId_ = arg_8_0.params_.activityId

			arg_8_0:InitGo(DemonChallengeTools.GetDifficultyUIName(arg_8_0.params_.activityId))
		end
	end

	arg_8_0:RefreshCompletedUI()
	arg_8_0:RefreshUI()
end

function var_0_0.RefreshUI(arg_9_0)
	arg_9_0:RefreshSelectedUI()
	arg_9_0:RefreshDesc()

	local var_9_0 = NewDemonChallengeData:GetChallengeInfo(arg_9_0.activityId_)

	if var_9_0.challengeInfo then
		local var_9_1 = var_9_0.challengeInfo[3].challenge_state
		local var_9_2 = var_9_0.challengeInfo[3].hurt_state

		if var_9_1 == ActivityConst.DEMON_CHALLENGE_STATE.FINISHED and var_9_2 == ActivityConst.DEMON_CHALLENGE_HURT_STATE.NO_HURT then
			arg_9_0.completedUIControllerS_[3]:SetSelectedState("nodamag")
		end
	end
end

function var_0_0.RefreshCompletedUI(arg_10_0)
	local var_10_0 = NewDemonChallengeData:GetChallengeInfo(arg_10_0.activityId_)

	for iter_10_0 = 1, var_0_1 do
		if var_10_0.challengeInfo and var_10_0.challengeInfo[iter_10_0].challenge_state ~= ActivityConst.DEMON_CHALLENGE_STATE.FINISHED then
			arg_10_0.completedUIControllerS_[iter_10_0]:SetSelectedState("false")
		else
			arg_10_0.completedUIControllerS_[iter_10_0]:SetSelectedState("true")
		end
	end
end

function var_0_0.RefreshDesc(arg_11_0)
	local var_11_0 = ""

	if arg_11_0.difficultyIndex_ ~= nil then
		local var_11_1 = DemonChallengeTools.GetChildId(arg_11_0.activityId_, arg_11_0.difficultyIndex_, true)

		if var_11_1 then
			var_11_0 = NewDemonChallengeCfg[var_11_1].difficulty_desc
		end
	end

	if arg_11_0.descText_ then
		arg_11_0.descText_.text = GetI18NText(var_11_0)
	end
end

function var_0_0.RefreshSelectedUI(arg_12_0)
	if arg_12_0.difficultyIndex_ == nil then
		arg_12_0.selectController_:SetSelectedState(tostring(var_0_1 + 1))

		if arg_12_0.startImg_ then
			manager.effect:SetGrey(arg_12_0.startImg_, true)
		end
	else
		arg_12_0.selectController_:SetSelectedState(tostring(arg_12_0.difficultyIndex_))

		if arg_12_0.startImg_ then
			manager.effect:SetGrey(arg_12_0.startImg_, false)
		end
	end
end

function var_0_0.RefreshDifficult(arg_13_0, arg_13_1)
	arg_13_0.difficultyIndex_ = arg_13_1

	arg_13_0:RefreshUI()
end

function var_0_0.OnExit(arg_14_0)
	return
end

function var_0_0.Dispose(arg_15_0)
	for iter_15_0, iter_15_1 in pairs(arg_15_0.affixItemList_) do
		iter_15_1:Dispose()
	end

	arg_15_0.affixItemList_ = nil

	var_0_0.super.Dispose(arg_15_0)
end

return var_0_0
