local var_0_0 = class("QWorldQuestSideView", ReduxView)

function var_0_0.UIParent(arg_1_0)
	return manager.ui.uiMain.transform
end

function var_0_0.OnCtor(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.gameObject_ = arg_2_1
	arg_2_0.transform_ = arg_2_0.gameObject_.transform
	arg_2_0.mainHomePage_ = arg_2_2

	arg_2_0:InitUI()
end

function var_0_0.InitUI(arg_3_0)
	arg_3_0:BindCfgUI()
	arg_3_0:AddUIListener()

	arg_3_0.items_ = {}

	SetActive(arg_3_0.questCondItemGo_, false)

	arg_3_0.itemsNew_ = {}
	arg_3_0.typeController_ = arg_3_0.questConEx_:GetController("type")
	arg_3_0.animTimers_ = {}
	arg_3_0.lastTrackingId_ = -1

	SetActive(arg_3_0.questFinishGo_, false)
	SetActive(arg_3_0.questNewGo_, false)
	SetActive(arg_3_0.questNewItemGo_, false)
	SetActive(arg_3_0.questCondItemGo_, false)
end

function var_0_0.AddUIListener(arg_4_0)
	arg_4_0:AddBtnListener(arg_4_0.taskViewBtn_, nil, function()
		if not arg_4_0.mainHomePage_:CheckCanInteract() then
			return
		end

		arg_4_0.mainHomePage_.fadeAnim = true

		JumpTools.OpenPageByJump("/qworldQuestMain", {})
	end)
	arg_4_0:AddBtnListener(arg_4_0.questSideBtn_, nil, function()
		if not arg_4_0.mainHomePage_:CheckCanInteract() then
			return
		end

		if arg_4_0.questIdNew_ ~= nil then
			if arg_4_0.questIdNew_ ~= QWorldQuestTool.GetMainQuestTrackingId() then
				QWorldQuestAction.UpdateTrackingMainQuestId(arg_4_0.questIdNew_, function()
					QWorldQuestAction.SendUpdateQuestTrackToSdk(arg_4_0.questIdNew_, QWorldQuestConst.SDK_QUEST_TRACK_TYPE.TRACK)
					QWorldNotifyQueue:ClearQuestNewQueue()
					QWorldNotifyQueue:ResetNotifyTime()
					arg_4_0:ShowTrackingMainQuest()
				end)
			else
				QWorldNotifyQueue:ClearQuestNewQueue()
				QWorldNotifyQueue:ResetNotifyTime()
				arg_4_0:ShowTrackingMainQuest()
			end

			return
		end

		arg_4_0.mainHomePage_.fadeAnim = true

		JumpTools.OpenPageByJump("/qworldQuestMain", {})
	end)

	if arg_4_0.gmBtn_ then
		arg_4_0:AddBtnListener(arg_4_0.gmBtn_, nil, function()
			if not Application.isEditor then
				return
			end

			if not QWorldGmView then
				QWorldGmView = import("game.qworld.gm.QWorldGmView")
				gameContext.routesCfg_.qworldGmView = {
					name = "qworldGmView",
					component = QWorldGmView
				}
			end

			JumpTools.OpenPageByJump("/qworldGmView", {})
		end)
	end
end

function var_0_0.OnEnter(arg_9_0)
	return
end

function var_0_0.OnTop(arg_10_0)
	arg_10_0.noHideFx_ = true

	arg_10_0:ShowTrackingMainQuest()
	arg_10_0.questPanelAni_:Update(99999)

	for iter_10_0, iter_10_1 in ipairs(arg_10_0.items_) do
		if iter_10_1.gameObject_.activeSelf then
			iter_10_1:GetAnimator():Update(99999)
		end
	end
end

function var_0_0.OnBehind(arg_11_0)
	return
end

function var_0_0.OnExit(arg_12_0)
	return
end

function var_0_0.OnQWorldMainQuestUpdate(arg_13_0, arg_13_1)
	if arg_13_0.questIdNew_ or arg_13_0.questIdFinish_ then
		return
	end

	arg_13_0.conditionFx_ = arg_13_1 == arg_13_0.lastTrackingId_ and arg_13_0.lastTrackingId_ ~= -1 and arg_13_0.lastTrackingId_ == QWorldQuestTool.GetMainQuestTrackingId()

	arg_13_0:ShowTrackingMainQuest()
end

function var_0_0.OnQWorldQuestUpdateProgress(arg_14_0)
	if arg_14_0.questIdNew_ or arg_14_0.questIdFinish_ then
		return
	end

	if QWorldQuestTool.MainQuestHasRealtimeProgress(QWorldQuestTool.GetMainQuestTrackingId()) then
		arg_14_0:RefreshUI()
	end
end

function var_0_0.OnNotifyQueueEnd(arg_15_0)
	if arg_15_0.questIdNew_ or arg_15_0.questIdFinish_ then
		arg_15_0:ShowTrackingMainQuest()
	end
end

local function var_0_1(arg_16_0)
	local var_16_0 = 5381

	for iter_16_0 = 1, #arg_16_0 do
		var_16_0 = var_16_0 * 32 + var_16_0 + arg_16_0:byte(iter_16_0)
	end

	return var_16_0
end

local function var_0_2(arg_17_0)
	local var_17_0 = SandplayTaskCfg[arg_17_0]
	local var_17_1 = var_17_0.task_target
	local var_17_2 = QWorldQuestData:GetQuestData(arg_17_0)
	local var_17_3 = var_17_2 and var_17_2.progress or -1

	return var_0_1(var_17_0.task_target) + var_17_3
end

function var_0_0.RefreshUI(arg_18_0)
	local var_18_0 = arg_18_0.questIdNew_ or arg_18_0.questIdFinish_ or QWorldQuestTool.GetMainQuestTrackingId()
	local var_18_1 = QWorldQuestData:GetMainQuestData(var_18_0)

	if not var_18_1 then
		SetActive(arg_18_0.questContentGo_, false)
		arg_18_0:_StopAllAnimatorTimer()
	else
		SetActive(arg_18_0.questContentGo_, arg_18_0.enabled_ ~= false)

		local var_18_2 = SandplayTaskMainCfg[var_18_1.id]

		arg_18_0.questTitleText_.text = var_18_2.title

		local var_18_3 = QWorldQuestTool.GetVisibleQuestIdList(var_18_1.id, true)
		local var_18_4 = #var_18_3
		local var_18_5 = arg_18_0.questIdNew_ and arg_18_0.itemsNew_ or arg_18_0.items_
		local var_18_6 = arg_18_0.questIdNew_ and arg_18_0.questNewGo_.transform or arg_18_0.questCondListTrans_
		local var_18_7 = arg_18_0.questIdNew_ and arg_18_0.questNewItemGo_ or arg_18_0.questCondItemGo_

		for iter_18_0, iter_18_1 in ipairs(var_18_5) do
			SetActive(iter_18_1.gameObject_, iter_18_0 <= var_18_4)
			arg_18_0:_StopAnimatorTimer(iter_18_1:GetAnimator())
		end

		for iter_18_2 = 1, var_18_4 do
			local var_18_8 = var_18_5[iter_18_2]

			if not var_18_8 then
				local var_18_9 = Object.Instantiate(var_18_7, var_18_6)

				SetActive(var_18_9, true)

				var_18_8 = QWorldSideQuestItem.New(var_18_9)
				var_18_5[iter_18_2] = var_18_8
			end

			local var_18_10 = var_18_3[iter_18_2]

			if arg_18_0.conditionFx_ and (var_18_8.__hash == nil or var_18_8.__hash ~= var_0_2(var_18_10)) then
				arg_18_0:_PlayAnimatorWithCallback(var_18_8:GetAnimator(), "UI_newtaskItem_xs", function()
					var_18_8:SetData(var_18_10)

					var_18_8.__hash = var_0_2(var_18_10)
				end)
			else
				var_18_8:SetData(var_18_10)

				var_18_8.__hash = var_0_2(var_18_10)
			end
		end

		if arg_18_0.questIdNew_ then
			arg_18_0.questTrackGo_.transform:SetAsLastSibling()
		end

		local var_18_11 = SandplayTaskMainCfg[var_18_0].main_task_type

		if var_18_11 == QWorldQuestConst.QUEST_TASK_TYPE.MAIN then
			arg_18_0.typeController_:SetSelectedState("main")
		elseif var_18_11 == QWorldQuestConst.QUEST_TASK_TYPE.SIDE then
			arg_18_0.typeController_:SetSelectedState("side")
		elseif var_18_11 == QWorldQuestConst.QUEST_TASK_TYPE.EXPLORE then
			arg_18_0.typeController_:SetSelectedState("explore")
		end

		arg_18_0.conditionFx_ = nil

		if arg_18_0.needTitleFx_ then
			if var_18_11 == QWorldQuestConst.QUEST_TASK_TYPE.MAIN then
				arg_18_0.questTitleAni_:Play("UI_questPanel_title_yellow", -1, 0)
			elseif var_18_11 == QWorldQuestConst.QUEST_TASK_TYPE.SIDE then
				arg_18_0.questTitleAni_:Play("UI_questPanel_title_blue", -1, 0)
			elseif var_18_11 == QWorldQuestConst.QUEST_TASK_TYPE.EXPLORE then
				arg_18_0.questTitleAni_:Play("UI_questPanel_title_green", -1, 0)
			end

			arg_18_0.needTitleFx_ = nil
		else
			arg_18_0.questTitleAni_:Play("UI_questPanel_title", -1, 0)
		end
	end

	if arg_18_0.mainHomePage_.rewardPanelGo_.activeSelf then
		arg_18_0.mainHomePage_:UpdateLeftPanelLayout()
	end
end

function var_0_0.HideSideUI(arg_20_0, arg_20_1)
	if not arg_20_0.questContentGo_.activeSelf or arg_20_0.noHideFx_ then
		arg_20_0.noHideFx_ = nil

		arg_20_0:_StopAnimatorTimer(arg_20_0.questPanelAni_)

		if arg_20_1 then
			arg_20_1()
		end

		return
	end

	arg_20_0:_PlayAnimatorWithCallback(arg_20_0.questPanelAni_, "UI_questPanel_xs", function()
		if arg_20_1 then
			arg_20_1()
		else
			SetActive(arg_20_0.questContentGo_, false)
		end
	end)
end

function var_0_0.ShowMainQuestsFinish(arg_22_0, arg_22_1)
	arg_22_0.questIdNew_ = nil
	arg_22_0.questIdFinish_ = arg_22_1

	arg_22_0:HideSideUI(function()
		arg_22_0:_RemoveQuestCondition()
		arg_22_0:_RemoveNewQuestCondition()
		SetActive(arg_22_0.questFinishGo_, true)
		SetActive(arg_22_0.questContentGo_, true)
		arg_22_0.questPanelAni_:Play("UI_questPanel")
		arg_22_0.questPanelAni_:Update(0)
		arg_22_0:RefreshUI()
	end)
end

function var_0_0.ShowMainQuestsNew(arg_24_0, arg_24_1)
	arg_24_0.questIdNew_ = arg_24_1
	arg_24_0.questIdFinish_ = nil

	arg_24_0:HideSideUI(function()
		arg_24_0:_RemoveQuestCondition()
		SetActive(arg_24_0.questFinishGo_, false)
		SetActive(arg_24_0.questNewGo_, true)

		arg_24_0.needTitleFx_ = true

		SetActive(arg_24_0.questContentGo_, true)
		arg_24_0.questPanelAni_:Play("UI_questPanel")
		arg_24_0.questPanelAni_:Update(0)
		arg_24_0:RefreshUI()
	end)
end

function var_0_0.ShowTrackingMainQuest(arg_26_0)
	local var_26_0 = arg_26_0.lastTrackingId_ ~= QWorldQuestTool.GetMainQuestTrackingId() or arg_26_0.questIdNew_ ~= nil or arg_26_0.questIdFinish_ ~= nil

	arg_26_0.questIdNew_ = nil
	arg_26_0.questIdFinish_ = nil

	if var_26_0 then
		arg_26_0:HideSideUI(function()
			arg_26_0.lastTrackingId_ = QWorldQuestTool.GetMainQuestTrackingId()

			SetActive(arg_26_0.questFinishGo_, false)
			arg_26_0:_RemoveNewQuestCondition()
			SetActive(arg_26_0.questContentGo_, true)
			arg_26_0.questPanelAni_:Play("UI_questPanel")
			arg_26_0.questPanelAni_:Update(0)
			arg_26_0:RefreshUI()
		end)
	else
		arg_26_0.noHideFx_ = nil

		SetActive(arg_26_0.questFinishGo_, false)
		arg_26_0:_RemoveNewQuestCondition()
		SetActive(arg_26_0.questContentGo_, true)
		arg_26_0.questPanelAni_:Play("UI_questPanel")
		arg_26_0.questPanelAni_:Update(0)
		arg_26_0:RefreshUI()
	end
end

function var_0_0._RemoveQuestCondition(arg_28_0)
	for iter_28_0, iter_28_1 in ipairs(arg_28_0.items_) do
		SetActive(iter_28_1.gameObject_, false)
	end
end

function var_0_0._RemoveNewQuestCondition(arg_29_0)
	for iter_29_0, iter_29_1 in ipairs(arg_29_0.itemsNew_) do
		Object.Destroy(arg_29_0.items_.gameObject_)
		iter_29_1:Dispose()
	end

	SetActive(arg_29_0.questNewGo_, false)
end

function var_0_0._PlayAnimatorWithCallback(arg_30_0, arg_30_1, arg_30_2, arg_30_3)
	arg_30_0:_StopAnimatorTimer(arg_30_1)
	arg_30_1:Play(arg_30_2)
	arg_30_1:Update(0)

	local var_30_0 = Timer.New(function()
		local var_31_0 = arg_30_1:GetCurrentAnimatorStateInfo(0)
		local var_31_1 = var_31_0.length

		if var_31_0:IsName(arg_30_2) and var_31_0.normalizedTime >= 1 then
			if arg_30_0.animTimers_[arg_30_1] ~= nil then
				arg_30_0.animTimers_[arg_30_1]:Stop()

				arg_30_0.animTimers_[arg_30_1] = nil
			end

			if arg_30_3 ~= nil then
				arg_30_3()
			end
		end
	end, 0.033, -1)

	var_30_0:Start()

	arg_30_0.animTimers_[arg_30_1] = var_30_0
end

function var_0_0._StopAnimatorTimer(arg_32_0, arg_32_1)
	local var_32_0 = arg_32_0.animTimers_[arg_32_1]

	if var_32_0 then
		var_32_0:Stop()

		arg_32_0.animTimers_[arg_32_1] = nil
	end
end

function var_0_0._StopAllAnimatorTimer(arg_33_0)
	for iter_33_0, iter_33_1 in pairs(arg_33_0.animTimers_) do
		iter_33_1:Stop()
	end

	arg_33_0.animTimers_ = {}
end

function var_0_0.Dispose(arg_34_0)
	for iter_34_0, iter_34_1 in ipairs(arg_34_0.items_) do
		iter_34_1:Dispose()
	end

	arg_34_0:_RemoveNewQuestCondition()
	arg_34_0:_StopAllAnimatorTimer()

	arg_34_0.gameObject_ = nil
	arg_34_0.transform_ = nil

	var_0_0.super.Dispose(arg_34_0)
end

return var_0_0
