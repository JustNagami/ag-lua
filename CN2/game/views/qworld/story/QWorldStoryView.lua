local var_0_0 = class("QWorldStoryView", import("game.extend.ReduxView"))

function var_0_0.GetUIName(arg_1_0)
	return "Widget/System/SandPlay/SandPlay_Story/SandPlay_ChatUI"
end

function var_0_0.Ctor(arg_2_0)
	arg_2_0.gameObject_ = Object.Instantiate(Asset.Load(arg_2_0:GetUIName()), manager.ui.uiStory.transform)
	arg_2_0.transform_ = arg_2_0.gameObject_.transform

	arg_2_0:AdaptScreen()
	arg_2_0:Hide()
	arg_2_0:Init()
end

function var_0_0.BuildContext(arg_3_0)
	arg_3_0.choice = {
		list = {}
	}
	arg_3_0.choiceCtx = nil
	arg_3_0.isInEmpty = false
	arg_3_0.timePerText = 0.2
	arg_3_0.curText = ""
	arg_3_0.totalTextTimer = 0
	arg_3_0.minTtoleranceTime = 0.6
	arg_3_0.canShow = true
end

function var_0_0.Init(arg_4_0)
	arg_4_0:InitUI()
	arg_4_0:BuildContext()
end

function var_0_0.InitUI(arg_5_0)
	ComponentBinder.GetInstance():BindCfgUI(arg_5_0, arg_5_0.gameObject_)
	arg_5_0.blackPanelObj:SetActive(false)

	arg_5_0.hideBtnController = arg_5_0.controller_:GetController("hideBtns")
	arg_5_0.contentWritter = arg_5_0.contentTxt_.gameObject:GetComponent("UITypewriterEffect")

	arg_5_0:AddListener()
end

function var_0_0.AddListener(arg_6_0)
	arg_6_0:AddBtnListener(arg_6_0.nextBtn_, nil, function()
		arg_6_0:OnNextClick()
	end)
	arg_6_0:AddBtnListener(arg_6_0.skipBtn_, nil, function()
		arg_6_0:OnSkipClick()
	end)
	arg_6_0:AddBtnListener(arg_6_0.allBtn_, nil, function()
		if not arg_6_0.isInEmpty then
			arg_6_0:OnNextClick()
		else
			arg_6_0:OnAllBtnClick()
		end
	end)
	arg_6_0:AddBtnListener(arg_6_0.hideBtn_, nil, function()
		arg_6_0:OnHideBtnClick()
	end)
end

function var_0_0.Show(arg_11_0)
	arg_11_0.gameObject_:SetActive(true)
	CursorTools.LuaSwitchCursor(false)
end

function var_0_0.RenderContent(arg_12_0, arg_12_1, arg_12_2, arg_12_3)
	arg_12_0:StartContetnRender(SandplayStoryTalkCfg[tonumber(arg_12_1)].dialogue_text)

	arg_12_0.nameTxt_.text = SandplayStoryTalkCfg[tonumber(arg_12_1)].speaker_name
end

function var_0_0.StartContetnRender(arg_13_0, arg_13_1)
	arg_13_0.contentTxt_.text = arg_13_1
	arg_13_0.contentWritter.percent = 0

	arg_13_0.contentWritter:SetDirty()

	arg_13_0.curText = arg_13_1
	arg_13_0.totalTextCount = utf8len(arg_13_1)
	arg_13_0.totalTextTimer = arg_13_0.totalTextCount * 0.07

	arg_13_0:StopContentRender()

	arg_13_0.startContentTimestamp = Time.time
	arg_13_0.isInTextTween = true

	arg_13_0:ChangeCanClickStatus()

	arg_13_0.contentTimer = FrameTimer.New(function()
		local var_14_0 = Time.time - arg_13_0.startContentTimestamp
		local var_14_1 = var_14_0 / arg_13_0.totalTextTimer

		if var_14_1 > 1 then
			var_14_1 = 1
		end

		arg_13_0.contentWritter.percent = var_14_1

		arg_13_0.contentWritter:SetDirty()

		if var_14_0 >= arg_13_0.totalTextTimer then
			if arg_13_0.choiceCtx then
				arg_13_0.choiceRoot_:SetActive(true)
			end

			arg_13_0:StopContentRender()
		end
	end, 1, -1)

	arg_13_0.contentTimer:Start()
end

function var_0_0.StopContentRender(arg_15_0)
	if arg_15_0.contentTimer then
		arg_15_0.contentTimer:Stop()

		arg_15_0.contentTimer = nil
		arg_15_0.isInTextTween = false

		arg_15_0:ChangeCanClickStatus()
	end
end

function var_0_0.OpenChoice(arg_16_0, arg_16_1, arg_16_2)
	arg_16_0.choiceCtx = arg_16_1

	local var_16_0 = {
		task = {},
		tag = {},
		talkBranch = {}
	}
	local var_16_1 = {}

	if arg_16_2 then
		var_16_1 = QWorldMgr:GetQWorldStoryMgr():CollectFunctionChoice()
	end

	local var_16_2 = arg_16_1.Length
	local var_16_3 = #var_16_1
	local var_16_4 = #arg_16_0.choice.list

	if var_16_4 > var_16_2 + var_16_3 then
		for iter_16_0 = var_16_2 + var_16_3, var_16_4 do
			arg_16_0.choice.list[iter_16_0]:Reset()
			arg_16_0.choice.list[iter_16_0]:Hide()
		end
	end

	for iter_16_1 = 1, var_16_3 do
		if not arg_16_0.choice.list[iter_16_1] then
			local var_16_5 = GameObject.Instantiate(arg_16_0.choiceItem_, arg_16_0.choiceContent_)

			arg_16_0.choice.list[iter_16_1] = QWorldStoryChoiceItem.New(var_16_5)
		end

		arg_16_0.choice.list[iter_16_1]:Reset()
		arg_16_0.choice.list[iter_16_1]:RenderFuncChoice(var_16_1[iter_16_1])
		arg_16_0.choice.list[iter_16_1]:Show()

		if var_16_1[iter_16_1].type == QWorldConst.TagType.Quest then
			table.insert(var_16_0.task, var_16_1[iter_16_1].id)
		else
			table.insert(var_16_0.tag, var_16_1[iter_16_1].id)
		end
	end

	local var_16_6 = var_16_3 + 1

	if var_16_3 == 0 then
		var_16_6 = 1
	end

	for iter_16_2 = var_16_6, var_16_2 + var_16_3 do
		local var_16_7 = iter_16_2 - var_16_6 + 1

		if not arg_16_0.choice.list[iter_16_2] then
			local var_16_8 = GameObject.Instantiate(arg_16_0.choiceItem_, arg_16_0.choiceContent_)

			arg_16_0.choice.list[iter_16_2] = QWorldStoryChoiceItem.New(var_16_8)
		end

		arg_16_0.choice.list[iter_16_2]:Reset()
		arg_16_0.choice.list[iter_16_2]:RenderView(arg_16_0.choiceCtx[var_16_7 - 1].id)
		arg_16_0.choice.list[iter_16_2]:RegistCallback(function()
			arg_16_0.choiceCtx[var_16_7 - 1]:Invoke()
		end)
		arg_16_0.choice.list[iter_16_2]:Show()
		table.insert(var_16_0.talkBranch, arg_16_0.choiceCtx[var_16_7 - 1].id)
	end

	local var_16_9 = table.toString(var_16_0)

	for iter_16_3 = 1, var_16_2 + var_16_3 do
		if arg_16_0.choice.list[iter_16_3] then
			arg_16_0.choice.list[iter_16_3]:SetSdkChoice(var_16_9)
		end
	end
end

function var_0_0.CloseChoice(arg_18_0)
	if not isNil(arg_18_0.choiceRoot_) then
		arg_18_0.choiceCtx = nil

		arg_18_0.choiceRoot_:SetActive(false)
	end
end

function var_0_0.SetCanShow(arg_19_0, arg_19_1)
	arg_19_0.canShow = arg_19_1
end

function var_0_0.ChangeCanClickStatus(arg_20_0)
	if arg_20_0.needCallback and not arg_20_0.isInTextTween then
		arg_20_0.nextObj_:SetActive(true)
		arg_20_0.waitObj_:SetActive(false)
	else
		arg_20_0.nextObj_:SetActive(false)
		arg_20_0.waitObj_:SetActive(true)
	end
end

function var_0_0.SetNeedClickCallback(arg_21_0, arg_21_1, arg_21_2)
	arg_21_0.needCallback = arg_21_2

	arg_21_0:ChangeCanClickStatus()
end

function var_0_0.SetSkipCallback(arg_22_0, arg_22_1, arg_22_2)
	arg_22_0.skipBtn_.gameObject:SetActive(arg_22_1)

	arg_22_0.skipCallback = arg_22_2
end

function var_0_0.OnNextClick(arg_23_0)
	if arg_23_0.needCallback and Time.time - arg_23_0.startContentTimestamp > arg_23_0.minTtoleranceTime then
		if arg_23_0.isInTextTween then
			arg_23_0:StopContentRender()

			arg_23_0.contentWritter.percent = 1

			arg_23_0.contentWritter:SetDirty()

			if arg_23_0.choiceCtx then
				arg_23_0.choiceRoot_:SetActive(true)
			end
		else
			arg_23_0.needCallback:Invoke()
		end
	end
end

function var_0_0.OnSkipClick(arg_24_0)
	if arg_24_0.skipCallback then
		arg_24_0.skipCallback:Invoke()
	end
end

function var_0_0.OnAllBtnClick(arg_25_0)
	if arg_25_0.canShow then
		arg_25_0.isInEmpty = false

		arg_25_0.hideBtnController:SetSelectedState("show")
	end
end

function var_0_0.OnHideBtnClick(arg_26_0)
	if not arg_26_0.isInEmpty then
		arg_26_0.isInEmpty = true

		arg_26_0.hideBtnController:SetSelectedState("hide")
	end
end

function var_0_0.Hide(arg_27_0)
	arg_27_0:CloseChoice()
	arg_27_0.gameObject_:SetActive(false)
end

function var_0_0.BlackFadeEffect(arg_28_0, arg_28_1, arg_28_2, arg_28_3, arg_28_4, arg_28_5)
	arg_28_0.curBlackFadeCtx = {
		centerTime = arg_28_1,
		enterTime = arg_28_2,
		exitTime = arg_28_3,
		callback = arg_28_4,
		centerCallback = arg_28_5
	}

	arg_28_0:StopBlackFadeTimer()

	arg_28_0.startTimestamp = Time.time

	arg_28_0.blackPanelObj:SetActive(true)

	arg_28_0.blackFadeTimer = FrameTimer.New(function()
		local var_29_0 = Time.time - arg_28_0.startTimestamp
		local var_29_1 = var_29_0 / arg_28_0.curBlackFadeCtx.enterTime

		if var_29_1 > 1 then
			var_29_1 = 1
		end

		arg_28_0.blackPanelCanvas.alpha = var_29_1

		if var_29_0 >= arg_28_0.curBlackFadeCtx.enterTime then
			arg_28_0:StopBlackFadeTimer()
			arg_28_0:CenterFade()

			if arg_28_5 then
				arg_28_5()
			end
		end
	end, 1, -1)

	arg_28_0.blackFadeTimer:Start()
end

function var_0_0.CenterFade(arg_30_0)
	arg_30_0:StopBlackFadeTimer()

	arg_30_0.startTimestamp = Time.time
	arg_30_0.blackFadeTimer = FrameTimer.New(function()
		local var_31_0 = Time.time - arg_30_0.startTimestamp

		if var_31_0 / arg_30_0.curBlackFadeCtx.centerTime > 1 then
			local var_31_1 = 1
		end

		arg_30_0.blackPanelCanvas.alpha = 1

		if var_31_0 >= arg_30_0.curBlackFadeCtx.centerTime then
			arg_30_0:StopBlackFadeTimer()
			arg_30_0:ExitFade()
		end
	end, 1, -1)

	arg_30_0.blackFadeTimer:Start()
end

function var_0_0.ExitFade(arg_32_0)
	arg_32_0:StopBlackFadeTimer()

	arg_32_0.startTimestamp = Time.time
	arg_32_0.blackFadeTimer = FrameTimer.New(function()
		local var_33_0 = Time.time - arg_32_0.startTimestamp
		local var_33_1 = var_33_0 / arg_32_0.curBlackFadeCtx.exitTime

		if var_33_1 > 1 then
			var_33_1 = 1
		end

		arg_32_0.blackPanelCanvas.alpha = 1 - var_33_1

		if var_33_0 >= arg_32_0.curBlackFadeCtx.exitTime then
			arg_32_0:StopBlackFadeTimer()
			arg_32_0.blackPanelObj:SetActive(false)

			local var_33_2 = arg_32_0.curBlackFadeCtx.callback

			arg_32_0.curBlackFadeCtx = nil

			if var_33_2 then
				var_33_2()
			end
		end
	end, 1, -1)

	arg_32_0.blackFadeTimer:Start()
end

function var_0_0.StopBlackFadeTimer(arg_34_0)
	if arg_34_0.blackFadeTimer then
		arg_34_0.blackFadeTimer:Stop()

		arg_34_0.blackFadeTimer = nil
	end
end

function var_0_0.Dispose(arg_35_0)
	arg_35_0:StopContentRender()
	arg_35_0:StopBlackFadeTimer()
	GameObject.Destroy(arg_35_0.gameObject_)
	Asset.Unload(arg_35_0:GetUIName())
	var_0_0.super.Dispose(arg_35_0)
end

return var_0_0
