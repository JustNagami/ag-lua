return {
	Init = function(arg_1_0)
		arg_1_0.questMap = {}

		for iter_1_0, iter_1_1 in pairs(QuanzhouPhaseCfg.get_id_list_by_task_id) do
			local var_1_0 = QuanzhouPhaseCfg[iter_1_1[1]]

			if var_1_0 then
				arg_1_0.questMap[var_1_0.task_id] = var_1_0.id
			end
		end

		arg_1_0.alreadyPopTask = {}
		arg_1_0.entity = nil
		arg_1_0.isInit = true

		arg_1_0:AddListener()
	end,
	AddListener = function(arg_2_0)
		arg_2_0.questHandle = handler(arg_2_0, arg_2_0.OnQuestGraphStart)

		manager.notify:RegistListener(QWORLD_ON_QUEST_GRAPH_START, arg_2_0.questHandle)
	end,
	RemoveListener = function(arg_3_0)
		manager.notify:RemoveListener(QWORLD_ON_QUEST_GRAPH_START, arg_3_0.questHandle)
	end,
	OnQuestGraphStart = function(arg_4_0, arg_4_1)
		if arg_4_0.questMap[arg_4_1] then
			if arg_4_0.alreadyPopTask[arg_4_1] then
				return
			end

			arg_4_0.alreadyPopTask[arg_4_1] = true

			arg_4_0:Show()
		end
	end,
	Process = function(arg_5_0)
		for iter_5_0, iter_5_1 in pairs(arg_5_0.questMap) do
			if QWorldQuestTool.GetQuestStatus(iter_5_0) == QWorldQuestConst.QUEST_STATUS.IN_PROGRESS then
				if arg_5_0.alreadyPopTask[iter_5_0] then
					return
				end

				arg_5_0.alreadyPopTask[iter_5_0] = true

				arg_5_0:Show()

				return
			end
		end
	end,
	Show = function(arg_6_0)
		if not arg_6_0.entity then
			arg_6_0.entity = QWorldQuanzhouPhaseView.New()
		end

		arg_6_0.entity:SetData()
		arg_6_0.entity:Show()
		QWorldUIHide()
	end,
	Hide = function(arg_7_0)
		if arg_7_0.entity then
			arg_7_0.entity:Hide()
			arg_7_0.entity:Dispose()

			arg_7_0.entity = nil
		end

		QWorldUIShow()
	end,
	Dispose = function(arg_8_0)
		arg_8_0.isInit = false

		if arg_8_0.entity then
			arg_8_0.entity:Dispose()

			arg_8_0.entity = nil
		end
	end
}
