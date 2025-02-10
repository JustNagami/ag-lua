return {
	Init = function(arg_1_0)
		_GRAPH_API = {}

		function _GRAPH_API.QuestGetProg(arg_2_0, arg_2_1, arg_2_2)
			return QWorldQuestData:GetQuestData(arg_2_0).progress or -1
		end

		function _GRAPH_API.QuestSetParam(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
			QWorldMgr:GetQWorldQuestMgr():QuestSetParam(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
		end

		function _GRAPH_API.QuestSetFinish(arg_4_0, arg_4_1, arg_4_2)
			_GRAPH_API.QuestSetParam(arg_4_0, arg_4_1, 1, arg_4_2)
		end

		function _GRAPH_API.ThingCreate(arg_5_0)
			QWorldSpawnPrefabByEntityId(arg_5_0)
		end

		function _GRAPH_API.ThingDestroy(arg_6_0)
			QWorldRemovePrefabByEntityId(arg_6_0)
		end

		function _GRAPH_API.CreateDrop(arg_7_0, arg_7_1, arg_7_2)
			_GRAPH_API.ThingCreate(arg_7_0)
			_GRAPH_API.EntityInteractEnable(arg_7_0)

			local var_7_0 = QWorldMgr:GetQWorldEntityMgr():GetEntByEntityId(arg_7_0)

			if not var_7_0 then
				printf("无法找到实体id = %d", arg_7_0)
				Debug.LogError(string.format("无法找到实体id = %d", arg_7_0))

				return
			end

			if arg_7_1 and var_7_0.InitDropEffect then
				var_7_0:InitDropEffect()
			end

			function var_7_0.performCallback()
				_GRAPH_API.ThingDestroy(arg_7_0)
				arg_7_2()

				var_7_0.performCallback = nil
			end
		end

		function _GRAPH_API.PlayStory(arg_9_0, arg_9_1, arg_9_2)
			local var_9_0

			if arg_9_2 then
				var_9_0 = QWorldMgr:GetQWorldEntityMgr():GetEntByEntityId(arg_9_2)
			end

			QWorldMgr:GetQWorldStoryMgr():StartStory(arg_9_0, var_9_0)
			QWorldMgr:GetQWorldQuestMgr():SetStoryEndCallback(function()
				arg_9_1()
				QWorldMgr:GetQWorldQuestMgr():SetStoryEndCallback(nil)
			end)
		end

		function _GRAPH_API.PlayTalk(arg_11_0, arg_11_1)
			local var_11_0 = SandplayStoryTalkCfg[arg_11_0]

			QWorldStartTalk(QWStoryConst.TalkViewType.SimpleTalk, arg_11_0, var_11_0.speaker_name, nil, function()
				QWorldCloseTalk(QWStoryConst.TalkViewType.SimpleTalk)
				arg_11_1()
			end)
		end

		function _GRAPH_API.PlayTalkList(arg_13_0, arg_13_1)
			QWorldStartTalkList(QWStoryConst.TalkViewType.SimpleTalk, arg_13_0, function()
				QWorldCloseTalk(QWStoryConst.TalkViewType.SimpleTalk)
				arg_13_1()
			end)
		end

		function _GRAPH_API.PlayCommonStory(arg_15_0, arg_15_1)
			manager.story:StartStoryById(arg_15_0, arg_15_1)
		end

		function _GRAPH_API.PlayCommonStoryLoading(arg_16_0)
			local function var_16_0()
				LuaExchangeHelper.LoadEmpty(LuaHelper.VoidAction(function()
					CheckManagers()
					manager.story:StartStoryById(arg_16_0, function()
						LaunchQWorld(true)
					end)
				end))
			end

			if QWorldMgr:GetQWorldQuestMgr():IsSendingQuestFinish() then
				_GRAPH_API.Delay(0.1, function()
					_GRAPH_API.PlayCommonStoryLoading(arg_16_0)
				end)
			else
				var_16_0()
			end
		end

		local function var_1_0(arg_21_0)
			local var_21_0 = gameContext:GetLastOpenPage()

			if var_21_0 == "qworldMainHome" then
				gameContext:GetOpenPageHandler(var_21_0):EnableInteraction(arg_21_0)
			else
				local var_21_1 = ReduxFactory.GetInstance().reduxViewDic_.qworldMainHome

				if var_21_1 then
					var_21_1:EnableInteraction(arg_21_0)
				else
					print("未找到箱庭主界面")
				end
			end
		end

		function _GRAPH_API.UIInteractEnable()
			var_1_0(true)
		end

		function _GRAPH_API.UIInteractDisable()
			var_1_0(false)
		end

		local function var_1_1(arg_24_0, arg_24_1)
			local var_24_0 = QWorldMgr:GetQWorldEntityMgr():GetEntByEntityId(arg_24_0)

			if not var_24_0 then
				printf("无法找到实体id = %d", arg_24_0)
				Debug.LogError(string.format("无法找到实体id = %d", arg_24_0))

				return
			end

			if var_24_0.ChangeInteractive then
				var_24_0:ChangeInteractive(arg_24_1)
			end
		end

		function _GRAPH_API.EntityInteractEnable(arg_25_0)
			var_1_1(arg_25_0, true)
		end

		function _GRAPH_API.EntityInteractDisable(arg_26_0)
			var_1_1(arg_26_0, false)
		end

		function _GRAPH_API.BubbleOptionAdd(arg_27_0, arg_27_1, arg_27_2)
			local var_27_0 = arg_27_0
			local var_27_1 = QWorldMgr:GetQWorldEntityMgr():GetEntByEntityId(arg_27_1)

			if not var_27_1 then
				printf("无法为实体%d添加气泡, 实体不存在!", arg_27_1)
				Debug.LogError(string.format("无法为实体%d添加气泡, 实体不存在!", arg_27_1))

				return
			end

			local var_27_2 = SandplayTaskCfg[arg_27_0]

			var_27_1:AddQuestTag(var_27_0, var_27_2.task_tag, function()
				arg_27_2()
			end)
		end

		function _GRAPH_API.BubbleOptionRemove(arg_29_0, arg_29_1)
			local var_29_0 = arg_29_0
			local var_29_1 = QWorldMgr:GetQWorldEntityMgr():GetEntByEntityId(arg_29_1)

			if not var_29_1 then
				printf("无法为实体%d删除气泡, 实体不存在!", arg_29_1)
				Debug.LogError(string.format("无法为实体%d删除气泡, 实体不存在!", arg_29_1))

				return
			end

			var_29_1:RemoveQuestTag(var_29_0)
		end

		function _GRAPH_API.ZoneEnable(arg_30_0)
			QWorldSpawnPrefabByEntityId(arg_30_0)
		end

		function _GRAPH_API.ZoneDisable(arg_31_0)
			QWorldRemovePrefabByEntityId(arg_31_0)
		end

		function _GRAPH_API.PlayerTeleport(arg_32_0)
			QWorldTeleport(arg_32_0)
		end

		function _GRAPH_API.NpcMove(arg_33_0, arg_33_1, arg_33_2, arg_33_3)
			local var_33_0 = QWorldMgr:GetQWorldEntityMgr():GetEntByEntityId(arg_33_0)

			if not var_33_0 then
				printf("无法移动%d, 实体不存在!", arg_33_0)
				Debug.LogError(string.format("无法移动%d, 实体不存在!", arg_33_0))

				return
			end

			local var_33_1 = QWorldLuaBridge.GetPatrolPath(arg_33_1)

			if var_33_1 == nil then
				printf("无法找到路径! id = %d", arg_33_1)
				Debug.LogError(string.format("无法找到路径! id = %d", arg_33_1))

				return
			end

			if var_33_0.StartSeeker then
				var_33_0:StartSeeker(var_33_1, 99999, arg_33_3, nil, nil, 0.01, arg_33_2 == 1)
			else
				printf("实体%d没有跟随功能!", arg_33_0)
			end
		end

		function _GRAPH_API.FollowNpc(arg_34_0, arg_34_1, arg_34_2, arg_34_3, arg_34_4, arg_34_5)
			local var_34_0 = QWorldMgr:GetQWorldEntityMgr():GetEntByEntityId(arg_34_0)

			if not var_34_0 then
				printf("无法跟随%d, 实体不存在!", arg_34_0)
				Debug.LogError(string.format("无法跟随%d, 实体不存在!", arg_34_0))

				return
			end

			local var_34_1 = QWorldLuaBridge.GetPatrolPath(arg_34_1)

			if var_34_1 == nil then
				printf("无法找到路径! id = %d", arg_34_1)
				Debug.LogError(string.format("无法找到路径! id = %d", arg_34_1))

				return
			end

			if var_34_0.StartSeeker then
				var_34_0:StartSeeker(var_34_1, arg_34_3, arg_34_5, nil, arg_34_4, 0.01, arg_34_2 == 1)
			else
				printf("实体%d没有跟随功能!", arg_34_0)
			end
		end

		function _GRAPH_API.EnterScene(arg_35_0)
			print(string.format("蓝图调用进入场景%s", arg_35_0))
			QWorldLuaBridge.Restart(arg_35_0)
		end

		function _GRAPH_API.EnterBattle(arg_36_0, arg_36_1)
			arg_36_1 = arg_36_1 or BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_PLOT

			local var_36_0 = BattleStageTools.GetStageCfg(arg_36_1, arg_36_0)

			gameContext:Go("/sectionSelectHero", {
				section = arg_36_0,
				sectionType = arg_36_1
			})
		end

		function _GRAPH_API.GotoTag(arg_37_0, arg_37_1)
			QWorldMgr:GetQWorldTagMgr():GotoTag(arg_37_0, arg_37_1)
		end

		function _GRAPH_API.OpenUIPredefined(arg_38_0)
			if arg_38_0 == 1 then
				JumpTools.JumpToPage2({
					518
				})
			else
				print("未找到预定义页面")
			end
		end

		function _GRAPH_API.Delay(arg_39_0, arg_39_1)
			local var_39_0 = Timer.New(arg_39_1, arg_39_0, 0)

			QWorldQuestGraph:StartTimer(var_39_0)
		end
	end,
	Clear = function(arg_40_0)
		_GRAPH_API = nil
	end
}
