local var_0_0 = class("SignView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/System/ActivitySign/ActivityUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiPop.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:InitUI()
	arg_3_0:AddListeners()

	arg_3_0.selectIndex = -1
	arg_3_0.allToggles = {
		ActivityDailySignToggle.New(),
		ActivityMonthCardToggle.New(),
		ActivityBigMonthCardToggle.New()
	}

	local var_3_0 = ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.SEVEN_SIGN] or {}

	for iter_3_0, iter_3_1 in ipairs(var_3_0) do
		table.insert(arg_3_0.allToggles, ActivitySevenSignToggle.New(iter_3_1))
	end

	arg_3_0.pages = {}
end

function var_0_0.InitUI(arg_4_0)
	arg_4_0:BindCfgUI()

	arg_4_0.toggleList = LuaList.New(handler(arg_4_0, arg_4_0.IndexItem), arg_4_0.m_list, SignToggleItem)
end

function var_0_0.AddListeners(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.m_maskBtn, nil, function()
		if arg_5_0.signReady_ then
			arg_5_0:Back()
		end
	end)
end

function var_0_0.OnEnter(arg_7_0)
	JumpTools.RefreshGaussianBg()

	arg_7_0.toggles = {}

	for iter_7_0, iter_7_1 in pairs(arg_7_0.allToggles) do
		if iter_7_1:IsActivity() and PlayerData:GetPlayerInfo().userLevel >= iter_7_1:GetLimitLevel() then
			table.insert(arg_7_0.toggles, iter_7_1)
		end
	end

	table.sort(arg_7_0.toggles, function(arg_8_0, arg_8_1)
		local var_8_0 = arg_8_0:Check() and 1 or 0
		local var_8_1 = arg_8_1:Check() and 1 or 0

		if var_8_0 == var_8_1 then
			local var_8_2 = arg_8_0:IsManual() and 0 or 1
			local var_8_3 = arg_8_1:IsManual() and 0 or 1

			if var_8_2 == var_8_3 then
				return arg_8_0:Order() > arg_8_1:Order()
			else
				return var_8_3 < var_8_2
			end
		else
			return var_8_1 < var_8_0
		end
	end)
	arg_7_0.toggleList:StartScroll(#arg_7_0.toggles)

	if arg_7_0.params_.check then
		arg_7_0:CheckSign()

		arg_7_0.params_.check = nil
	else
		if arg_7_0.params_.isBack then
			arg_7_0:SetSelectPage(SignData:GetHistoryIndex() or 1)
		elseif arg_7_0.params_.systemID then
			local var_7_0 = 1
			local var_7_1 = arg_7_0.params_.systemID

			for iter_7_2, iter_7_3 in pairs(arg_7_0.toggles) do
				if iter_7_3:GetSystemID() == var_7_1 then
					var_7_0 = iter_7_2

					break
				end
			end

			arg_7_0.params_.systemID = nil

			arg_7_0:SetSelectPage(var_7_0)
		else
			arg_7_0:SetSelectPage(1)
		end

		arg_7_0.signReady_ = true
	end
end

function var_0_0.OnExit(arg_9_0)
	arg_9_0.signReady_ = false

	SignData:SetHistoryIndex(arg_9_0.selectIndex)

	arg_9_0.selectIndex = -1

	if arg_9_0.curPage then
		arg_9_0.curPage:SetActive(false)

		arg_9_0.curPage = nil
	end
end

function var_0_0.IndexItem(arg_10_0, arg_10_1, arg_10_2)
	local var_10_0 = arg_10_0.toggles[arg_10_1]

	arg_10_2:SetData(arg_10_1, var_10_0)
	arg_10_2:SetSelect(arg_10_0.selectIndex)
	arg_10_2:RegistCallBack(handler(arg_10_0, arg_10_0.SetSelectPage))
end

function var_0_0.SetSelectPage(arg_11_0, arg_11_1)
	if arg_11_1 == arg_11_0.selectIndex then
		return
	end

	arg_11_1 = math.min(arg_11_1, #arg_11_0.toggles)

	local var_11_0 = arg_11_0.toggles[arg_11_1]:GetLimitLevel()

	if var_11_0 > PlayerData:GetPlayerInfo().userLevel then
		ShowTips(string.format(GetTips("PLAYER_LEVEL_UNLOCK"), var_11_0))

		return
	end

	arg_11_0.selectIndex = arg_11_1

	local var_11_1 = arg_11_0.toggleList:GetItemList()

	for iter_11_0, iter_11_1 in ipairs(var_11_1) do
		iter_11_1:SetSelect(arg_11_0.selectIndex)
	end

	arg_11_0:RefreshUI()
end

function var_0_0.RefreshUI(arg_12_0)
	if arg_12_0.curPage then
		arg_12_0.curPage:SetActive(false)
	end

	local var_12_0 = arg_12_0.selectIndex
	local var_12_1 = arg_12_0.toggles[var_12_0]
	local var_12_2 = var_12_1:GetName()

	if not arg_12_0.pages[var_12_2] then
		local var_12_3 = var_12_1:GetParams()

		arg_12_0.pages[var_12_2] = var_12_1:UIClass().New(arg_12_0, arg_12_0.m_content, var_12_3)
	end

	arg_12_0.curPage = arg_12_0.pages[var_12_2]

	arg_12_0.curPage:SetActive(true)
	arg_12_0.curPage.transform_:SetAsLastSibling()
end

function var_0_0.CheckSign(arg_13_0)
	for iter_13_0, iter_13_1 in ipairs(arg_13_0.toggles) do
		if iter_13_1:Check() then
			arg_13_0:SetSelectPage(iter_13_0)
			arg_13_0.curPage:AutoGetReward()

			return
		end
	end

	if not arg_13_0.selectIndex or arg_13_0.selectIndex == -1 then
		arg_13_0:SetSelectPage(1)
	end

	arg_13_0.signReady_ = true
end

function var_0_0.OnReadyToSkipAnimation(arg_14_0, arg_14_1)
	arg_14_0.curPage.animPlaying = not arg_14_1

	SetActive(arg_14_0.m_skipBtn.gameObject, not arg_14_1)
end

function var_0_0.OnSign(arg_15_0, arg_15_1, arg_15_2)
	if arg_15_0.curPage and arg_15_0.curPage.OnSign then
		arg_15_0.curPage:OnSign(arg_15_1)
	end
end

function var_0_0.OnMonthCardDailyReward(arg_16_0)
	if arg_16_0.curPage and arg_16_0.curPage.OnMonthCardDailyReward then
		arg_16_0.curPage:OnMonthCardDailyReward()
	end

	arg_16_0:CheckSign()
end

function var_0_0.OnGetFatigueSuccess(arg_17_0, arg_17_1)
	if arg_17_0.curPage and arg_17_0.curPage.OnGetFatigueSuccess then
		arg_17_0.curPage:OnGetFatigueSuccess(arg_17_1)
	end
end

function var_0_0.OnBigMonthCardSign(arg_18_0, arg_18_1, arg_18_2)
	if arg_18_0.curPage then
		local var_18_0 = arg_18_0.curPage.btnAni

		if var_18_0 ~= nil then
			var_18_0.enabled = true
			arg_18_0.aniTimer_ = Timer.New(function()
				if not arg_18_0.curPage then
					if arg_18_0.aniTimer_ then
						arg_18_0.aniTimer_:Stop()

						arg_18_0.aniTimer_ = nil
					end

					return
				end

				if var_18_0:GetCurrentAnimatorStateInfo(0).normalizedTime >= 2 or not arg_18_0.curPage.animPlaying then
					if arg_18_0.curPage.animPlaying then
						arg_18_0:OnReadyToSkipAnimation(true)
					end

					getReward(arg_18_1, nil, function()
						arg_18_0.curPage:AutoGetAccumlateSign()
					end)
					BigMonthCardData:SetRecord(arg_18_2)
					manager.notify:Invoke(GET_BIG_MONTH_SIGN)

					if arg_18_0.aniTimer_ then
						arg_18_0.aniTimer_:Stop()

						arg_18_0.aniTimer_ = nil
					end
				end
			end, 0.033, -1)

			manager.notify:CallUpdateFunc(SIGN_INPUT, true)
			arg_18_0:OnReadyToSkipAnimation(false)
			arg_18_0.aniTimer_:Start()
		end
	else
		manager.notify:CallUpdateFunc(SIGN_INPUT, true)
	end
end

function var_0_0.OnBigMonthCarAccumulateSign(arg_21_0, arg_21_1, arg_21_2, arg_21_3)
	if arg_21_0.curPage then
		local var_21_0 = arg_21_0.curPage.itemAni[arg_21_3]

		if var_21_0 ~= nil then
			var_21_0.enabled = true
			arg_21_0.aniTimer_ = Timer.New(function()
				if not arg_21_0.curPage then
					if arg_21_0.aniTimer_ then
						arg_21_0.aniTimer_:Stop()

						arg_21_0.aniTimer_ = nil
					end

					return
				end

				if var_21_0:GetCurrentAnimatorStateInfo(0).normalizedTime >= 1.5 or not arg_21_0.curPage.animPlaying then
					if arg_21_0.curPage.animPlaying then
						arg_21_0:OnReadyToSkipAnimation(true)
					end

					getReward(arg_21_1, nil, function()
						manager.notify:CallUpdateFunc(BIG_MONTH_CARD_ACCUMULATE_SIGN_CALL)
					end)

					var_21_0.enabled = false

					manager.notify:Invoke(GET_BIG_MONTH_ACCUMULATE_SIGN)

					if arg_21_0.aniTimer_ then
						arg_21_0.aniTimer_:Stop()

						arg_21_0.aniTimer_ = nil
					end
				end
			end, 0.033, -1)

			arg_21_0:OnSignViewInputChange(true)
			arg_21_0:OnReadyToSkipAnimation(false)
			arg_21_0.aniTimer_:Start()
		end
	else
		arg_21_0:OnSignViewInputChange(true)
	end
end

function var_0_0.OnBigMonthCardAccumlateSignCall(arg_24_0)
	arg_24_0.curPage:AutoGetAccumlateSign()
end

function var_0_0.OnSignViewInputChange(arg_25_0, arg_25_1)
	arg_25_0.signReady_ = arg_25_1

	manager.ui:UIEventEnabledByUI(arg_25_1, not arg_25_1)
end

function var_0_0.OnExitInput(arg_26_0)
	JumpTools.Back()

	return true
end

function var_0_0.StopAniTimer(arg_27_0)
	if arg_27_0.aniTimer_ then
		arg_27_0.aniTimer_:Stop()

		arg_27_0.aniTimer_ = nil
	end
end

function var_0_0.Dispose(arg_28_0)
	arg_28_0:StopAniTimer()
	arg_28_0.toggleList:Dispose()

	for iter_28_0, iter_28_1 in pairs(arg_28_0.pages) do
		iter_28_1:Dispose()
	end

	arg_28_0.pages = {}

	var_0_0.super.Dispose(arg_28_0)
end

return var_0_0
