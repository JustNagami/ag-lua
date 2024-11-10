local var_0_0 = {}
local var_0_1 = import("game.const.BattleConst")
local var_0_2 = import("game.tools.BattleInstance")
local var_0_3 = import("game.const.ViewConst")

function var_0_0.GetName(arg_1_0)
	local var_1_0 = SystemLinkCfg[arg_1_0[1]]

	if var_1_0.id == var_0_3.JUMP_SPECIAL_ID.BATTLE_MAIN then
		return var_0_2.GetMapName(arg_1_0[3]), GetI18NText(var_1_0.text_display_1)
	elseif var_1_0.id == var_0_3.JUMP_SPECIAL_ID.BATTLE_ASTROLABE or var_1_0.id == var_0_3.JUMP_SPECIAL_ID.BATTLE_EQUIP then
		return GetI18NText(ChapterCfg[arg_1_0[2]].subhead), GetI18NText(var_1_0.text_display_1)
	else
		return GetI18NText(var_1_0.text_display_2), GetI18NText(var_1_0.text_display_1)
	end
end

function var_0_0.OpenPageUntilLoaded(arg_2_0, arg_2_1, arg_2_2)
	if LuaExchangeHelper.GetSceneIsHanding() then
		gameContext:SetUrlAndParams(arg_2_0, arg_2_1)
	else
		CheckManagers()
		var_0_0.OpenPageByJump(arg_2_0, arg_2_1, arg_2_2)
	end
end

function var_0_0.OpenPageUntilLoadedByTable(arg_3_0, arg_3_1)
	local var_3_0, var_3_1 = var_0_0.GetLinkAndParams(arg_3_0)

	var_0_0.OpenPageUntilLoaded(var_3_0, var_3_1, arg_3_1)
end

var_0_0.IS_OPENING_PAGE = false

function var_0_0.JumpToPage(arg_4_0)
	var_0_0.JumpToPage2(arg_4_0)
end

function var_0_0.JumpToPage2(arg_5_0)
	local var_5_0 = SystemLinkCfg[arg_5_0[1]]
	local var_5_1 = var_0_0.GetSystemActivityID(arg_5_0)

	if var_5_1 and var_5_1 ~= 0 then
		local var_5_2, var_5_3, var_5_4 = var_0_0.GetActivityTime(var_5_1)

		if var_5_2 > manager.time:GetServerTime() then
			local var_5_5 = GetTips("UNLOCK")

			ShowTips(string.format(var_5_5, manager.time:GetLostTimeStr(var_5_2)))

			return
		end

		if var_5_3 <= manager.time:GetServerTime() then
			ShowTips("TIME_OVER")

			return
		end

		local var_5_6 = ActivityEntraceCfg[var_5_1]

		if var_5_6 and var_5_6.story_id ~= 0 and not manager.story:IsStoryPlayed(var_5_6.story_id) then
			manager.notify:Invoke(MUTE_MAIN_AUDIO)

			if JumpTools.GetLinkIsLocked(arg_5_0) then
				local var_5_7, var_5_8 = JumpTools.GetSystemLockedText(arg_5_0)

				ShowTips(var_5_8)

				return
			end

			manager.story:StartStoryById(var_5_6.story_id, function()
				PlayerData:StoryModify(var_5_6.story_id)
				var_0_0.JumpToPage2(arg_5_0)
			end)

			return
		end

		if arg_5_0[1] ~= 11001 and not ActivityTools.IsUnlockActivity(var_5_1) then
			local var_5_9 = ActivityCfg[var_5_1].unlock_condition

			if var_5_9[1] == 100 then
				ShowTips(string.format(GetTips("UNLOCK_CONDITION_ACTIVITY_TIPS"), ActivityStoryChapterCfg[var_5_9[2][1]].name, BattleActivityStoryStageCfg[var_5_9[2][2]].name))

				return
			elseif var_5_9[1] == 101 then
				local var_5_10 = ChapterCfg[var_5_9[2][1]]
				local var_5_11 = ChapterClientCfg[var_5_10.clientID]

				if var_5_9[2][1] == 12113 then
					ShowTips(string.format(GetTips("NEED_FINISH_PRE_CHAPTER_STAGE"), GetTips(var_0_1.HARD_LANGUAGE[var_5_10.difficulty]), GetI18NText(var_5_11.desc), GetI18NText(var_5_11.name)))
				else
					ShowTips(string.format(GetTips("NEED_FINISH_PRE_STAGE"), GetTips(var_0_1.HARD_LANGUAGE[var_5_10.difficulty]), GetI18NText(var_5_11.desc)))
				end

				return
			end
		end

		if not var_5_4 then
			ShowTips("ERROR_ACTIVITY_NOT_EXIST")

			return
		end

		local var_5_12 = GameSetting.activity_main_plot_unlock_level.value[1]

		if arg_5_0[1] == var_0_3.JUMP_SPECIAL_ID.BATTLE_MAIN and var_5_12 > PlayerData:GetPlayerInfo().userLevel then
			ShowTips(string.format(GetTips("PLAYER_LEVEL_UNLOCK"), GameSetting.activity_main_plot_unlock_level.value[1]))

			return
		end
	end

	if arg_5_0[1] == var_0_3.JUMP_SPECIAL_ID.BATTLE_MAIN then
		local var_5_13
		local var_5_14
		local var_5_15 = ChapterCfg[arg_5_0[2]].section_id_list

		if arg_5_0[3] == nil then
			arg_5_0[3] = var_5_15[#var_5_15]
		end

		local var_5_16, var_5_17 = getMaxOpenSection(arg_5_0[3])
		local var_5_18 = ChapterCfg[arg_5_0[2]].unlock_activity_id

		if var_5_18 ~= 0 then
			local var_5_19 = ActivityData:GetActivityData(var_5_18)

			if manager.time:GetServerTime() < var_5_19.startTime then
				ShowTips(string.format(GetTips("OPEN_TIME"), manager.time:GetLostTimeStr(var_5_19.startTime)))

				return
			end
		end

		if arg_5_0[2] == 11112 then
			if ChapterTools.IsClearChapter(10112) == false then
				var_0_0.JumpToPage2({
					arg_5_0[1],
					10112
				})

				return
			end

			if not SkuldTravelData:IsCollectAllPhoto() then
				ShowTips(GetTips("TRAVEL_SKULD_COLLECT_ALL_PHOTO"))

				return
			end
		elseif arg_5_0[2] == 12112 and BattleStageData:GetStageData()[var_5_15[1]] == nil then
			var_0_0.JumpToPage2({
				arg_5_0[1],
				11112
			})

			return
		end

		var_0_0.OpenPageByJump(var_0_0.GetLinkAndParams({
			arg_5_0[1],
			var_5_17,
			var_5_16
		}))

		return
	elseif arg_5_0[1] == var_0_3.SYSTEM_ID.BUY_FATIGUE and arg_5_0[2] == 2 then
		if var_0_0.GetLinkIsLocked(arg_5_0) then
			local var_5_20, var_5_21 = JumpTools.GetSystemLockedText(arg_5_0)

			ShowTips(var_5_21)

			return
		end

		if CurrencyData:GetFatigueBuyTimes() >= GameSetting.fatigue_max_buy_time.value[1] then
			ShowTips("ERROR_ITEM_DIAMOND_FATIGUE_TIMES_OVER_LIMIT")

			return
		end
	elseif arg_5_0[1] == var_0_3.JUMP_SPECIAL_ID.MATRIX then
		var_0_0.GoToMatrix()

		return
	elseif arg_5_0[1] == var_0_3.JUMP_SPECIAL_ID.CLUB_TASK then
		var_0_0.GoToGuildTask()

		return
	elseif arg_5_0[1] == var_0_3.JUMP_SPECIAL_ID.BOSS_CHALLENGE then
		if var_0_0.GetLinkIsLocked(arg_5_0) then
			local var_5_22, var_5_23 = JumpTools.GetSystemLockedText(arg_5_0)

			ShowTips(var_5_23)

			return
		end

		BattleBossChallengeAction.EnterBossChallenge()

		return
	elseif arg_5_0[1] == var_0_3.JUMP_SPECIAL_ID.STRATEGY_MATRIX then
		StrategyMatrixAction.GotoStrategyMatrix(var_5_0.params[1])

		return
	elseif arg_5_0[1] == var_0_3.JUMP_SPECIAL_ID.THOR_MATRIX then
		StrategyMatrixAction.GotoStrategyMatrix(var_5_0.params[1])

		return
	elseif arg_5_0[1] == var_0_3.JUMP_SPECIAL_ID.POLYHEDRON then
		var_0_0.GoToPolyhedron()

		return
	elseif arg_5_0[1] == var_0_3.JUMP_SPECIAL_ID.BATTLE_EQUIP_BREAK_THROUGH_MATERIAL then
		if var_0_0.GetLinkIsLocked(arg_5_0) then
			local var_5_24, var_5_25 = JumpTools.GetSystemLockedText(arg_5_0)

			ShowTips(var_5_25)

			return
		end

		EquipBreakThroughMaterialAction.EnterEquipBTMaterial()

		return
	elseif arg_5_0[1] == var_0_3.JUMP_SPECIAL_ID.MYTHIC then
		if var_0_0.GetLinkIsLocked(arg_5_0) then
			local var_5_26, var_5_27 = JumpTools.GetSystemLockedText(arg_5_0)

			ShowTips(var_5_27)

			return
		else
			if MythicData:GetDifficulty() == MythicData:GetFinalId() then
				JumpTools.GoToSystem("/mythicUltimateView", nil, var_0_3.SYSTEM_ID.MYTHIC)
			else
				JumpTools.GoToSystem("/mythic", nil, var_0_3.SYSTEM_ID.MYTHIC)
			end

			return
		end
	elseif arg_5_0[1] == var_0_3.JUMP_SPECIAL_ID.CANTEEN_MAP then
		local var_5_28 = JumpTools.IsSystemLocked(var_0_3.SYSTEM_ID.DORM)

		if var_5_28 then
			ShowTips(JumpTools.GetSystemLockedTip(var_0_3.SYSTEM_ID.DORM, var_5_28))

			return nil
		else
			BackHomeTools:GotoBackHomeRoom(DormConst.CANTEEN_ID)

			return
		end
	elseif arg_5_0[1] == var_0_3.JUMP_SPECIAL_ID.DORM_MAP then
		local var_5_29 = JumpTools.IsSystemLocked(var_0_3.SYSTEM_ID.DORM)

		if var_5_29 then
			ShowTips(JumpTools.GetSystemLockedTip(var_0_3.SYSTEM_ID.DORM, var_5_29))

			return nil
		else
			BackHomeTools:GotoBackHomeRoom(DormConst.PUBLIC_DORM_ID)

			return
		end
	elseif arg_5_0[1] == var_0_3.JUMP_SPECIAL_ID.BACKHOME_MAP then
		local var_5_30 = JumpTools.IsSystemLocked(var_0_3.SYSTEM_ID.DORM)

		if var_5_30 then
			ShowTips(JumpTools.GetSystemLockedTip(var_0_3.SYSTEM_ID.DORM, var_5_30))

			return nil
		else
			JumpTools.OpenPageByJump("/dormChooseRoomView")

			return
		end
	elseif arg_5_0[1] == var_0_3.JUMP_SPECIAL_ID.HERO_TEACH then
		local var_5_31 = arg_5_0[2]

		if var_5_31 ~= nil then
			if HeroData:GetHeroData(var_5_31).unlock ~= 1 then
				ShowTips("ERROR_HERO_NOT_UNLOCK")

				return
			end

			local var_5_32 = HeroCfg[var_5_31]

			if var_5_32 and var_5_32.study_stage and var_5_32.study_stage[1] then
				JumpTools.OpenPageByJump("/teachStage", {
					switchType = var_0_1.STAGE_TYPE_NEW.STAGE_TYPE_HERO_TEACHING,
					heroID = var_5_31
				})
				JumpTools.OpenPageByJump("teachSectionInfo", {
					sectionType = var_0_1.STAGE_TYPE_NEW.STAGE_TYPE_HERO_TEACHING,
					section = var_5_32.study_stage[1]
				})
			end
		else
			JumpTools.OpenPageByJump("/teachStage", {
				switchType = var_0_1.STAGE_TYPE_NEW.STAGE_TYPE_HERO_TEACHING
			})
		end

		return
	elseif arg_5_0[1] == var_0_3.JUMP_SPECIAL_ID.CLUB_FOUNDED then
		GuildAction.EnterGuild()

		return
	elseif var_5_0.system_id == var_0_3.SYSTEM_ID.BATTLE_SUB_PLOT then
		if var_0_0.GetLinkIsLocked(arg_5_0) then
			local var_5_33, var_5_34 = JumpTools.GetSystemLockedText(arg_5_0)

			ShowTips(var_5_34)

			return
		end

		var_0_0.GotoSubPlot(arg_5_0)

		return
	elseif arg_5_0[1] == var_0_3.SYSTEM_ID.SKIN_DRAW then
		local var_5_35, var_5_36 = ActivitySkinDrawData:GetNotReadStoryID()
		local var_5_37 = ActivityData:GetActivityData(var_5_35)

		if var_5_35 and var_5_37:IsActivitying() then
			if not JumpTools.IsSystemLocked(var_0_3.SYSTEM_ID.SKIN_DRAW) then
				if var_5_36 and var_5_36.isRead == 0 then
					local var_5_38 = ActivityLimitedSkinStoryCfg[var_5_36.activityID]

					manager.story:StartStoryById(var_5_38.story_id, function()
						manager.loadScene:ForceSetShouldLoadSceneName("home", function()
							ActivitySkinDrawAction.FinishStory(var_5_36.activityID)
							JumpTools.GoToSystem("/activityskinDraw", {
								activityID = var_5_35
							}, var_0_3.SYSTEM_ID.SKIN_DRAW)
						end)
					end)
				else
					JumpTools.GoToSystem("/activityskinDraw", {
						activityID = var_5_35
					}, var_0_3.SYSTEM_ID.SKIN_DRAW)
				end
			else
				ShowTips(JumpTools.GetSystemLockedTip(var_0_3.SYSTEM_ID.SKIN_DRAW, JumpTools.IsSystemLocked(var_0_3.SYSTEM_ID.SKIN_DRAW)))
			end
		else
			ShowTips("SOLO_NOT_OPEN")
		end

		return
	elseif arg_5_0[1] == var_0_3.JUMP_SPECIAL_ID.MOON_CAKE then
		local var_5_39 = tostring(arg_5_0[2])
		local var_5_40 = SystemLinkCfg[arg_5_0[1]].activity_id
		local var_5_41 = MoonCakeTools.GetMainActivityID(var_5_40)

		if var_5_39 == USER_ID then
			JumpTools.OpenPageByJump("/moonCakeParty", {
				activityID = var_5_40,
				mainActivityID = var_5_41,
				partyOwnerUID = USER_ID
			})
		else
			MoonCakeAction.VisitParty(var_5_40, var_5_39, MoonCakeConst.VISIT_WAY.SHARE)
		end

		return
	elseif arg_5_0[1] == var_0_3.SYSTEM_ID.SERVANT_SHOP then
		local var_5_42 = arg_5_0[2]
		local var_5_43 = SystemLinkCfg[arg_5_0[1]].params[1]
		local var_5_44 = ShopTools.GetGoodsIDListByItemID(var_5_43, var_5_42)
		local var_5_45 = {}
		local var_5_46 = {}
		local var_5_47 = ShopTools.FilterShopDataList(var_5_43)

		for iter_5_0, iter_5_1 in pairs(var_5_47) do
			if iter_5_1.id == var_5_44[1] then
				var_5_46 = iter_5_1
			end
		end

		if getShopCfg(var_5_44[1]) then
			local var_5_48 = getShopCfg(var_5_44[1])
		end

		if JumpTools.GetLinkIsLocked(arg_5_0) then
			local var_5_49, var_5_50 = JumpTools.GetSystemLockedText(arg_5_0)

			ShowTips(var_5_50)
		else
			JumpTools.OpenPageByJump("/shop", {
				shopId = var_5_43
			}, var_0_3.SYSTEM_ID.SHOP)

			local var_5_51 = getShopCfg(var_5_46.id, var_5_43)

			if ItemCfg[var_5_51.give_id].type == ItemConst.ITEM_TYPE.HERO_SKIN then
				if ShopTools.HaveSkin(var_5_51.give_id) then
					return
				end
			elseif var_5_51.limit_num then
				if var_5_51.limit_num ~= -1 and var_5_51.limit_num <= var_5_46.buyTime then
					return
				end

				local var_5_52, var_5_53 = ShopTools.JudgeIsLvLimit(var_5_51.level_limit)

				if var_5_52 then
					return
				end
			end

			JumpTools.OpenPopUp("shopBuy", {
				goodInfo = var_5_46
			})
		end

		return
	elseif arg_5_0[1] == var_0_3.JUMP_SPECIAL_ID.WEAPON_SERVANT_MERGE then
		local var_5_54 = arg_5_0[2]
		local var_5_55 = WeaponServantCfg[var_5_54].race
		local var_5_56 = {
			guideForce = true,
			openTab = "callName",
			race = var_5_55,
			servantID = var_5_54
		}

		manager.notify:Invoke(SERVANT_SWITCH_TO_CALLNAME, var_5_56)
		JumpTools.OpenPageByJump("/weaponServant", var_5_56)

		return
	elseif arg_5_0[1] == var_0_3.JUMP_SPECIAL_ID.SP_HERO_CHALLENGE_BARBECUE then
		SPHeroChallengeAction:OnEnterBarbuceScene()

		return
	elseif arg_5_0[1] == var_0_3.JUMP_SPECIAL_ID.SP_HERO_CHALLENGE_MAIN_VIEW or arg_5_0[1] == var_0_3.JUMP_SPECIAL_ID.SP_HERO_CHALLENGE_MAIN_VIEW_RESOURCE then
		if SystemLinkCfg[arg_5_0[1]] then
			local var_5_57 = SystemLinkCfg[arg_5_0[1]].activity_id

			SPHeroChallengeTools:EnterSystem(var_5_57)
		end

		return
	elseif var_5_0.system_id >= var_0_3.SYSTEM_ID.HERO and var_5_0.system_id <= var_0_3.SYSTEM_ID.TRANSITION then
		if var_0_0.GetLinkIsLocked(arg_5_0) then
			local var_5_58, var_5_59 = JumpTools.GetSystemLockedText(arg_5_0)

			ShowTips(var_5_59)

			return
		end

		local var_5_60, var_5_61, var_5_62 = var_0_0.GetLinkAndParams(arg_5_0)

		var_5_61.isEnter = true

		var_0_0.OpenPageByJump(var_5_60, var_5_61, var_5_62)

		return
	elseif var_0_0.GetLinkIsLocked(arg_5_0) then
		local var_5_63, var_5_64 = JumpTools.GetSystemLockedText(arg_5_0)

		ShowTips(var_5_64)

		return
	end

	var_0_0.OpenPageByJump(var_0_0.GetLinkAndParams(arg_5_0))
end

function var_0_0.GoToMatrix()
	local var_9_0 = MatrixData:GetGameState()

	if var_9_0 == MatrixConst.STATE_TYPE.SUCCESS or var_9_0 == MatrixConst.STATE_TYPE.FAIL then
		OpenPageUntilLoaded("/matrixBlank/matrixOver")
	else
		JumpTools.GoToSystem("/matrixBlank/matrixPrepare", nil, var_0_3.SYSTEM_ID.MATRIX)
	end
end

function var_0_0.GoToPolyhedron()
	if not PolyhedronData:GetPolyhedronInfo() then
		ShowTips("TIME_OVER")

		return
	end

	local var_10_0 = PolyhedronData:GetActivityID()

	if not ActivityData:GetActivityIsOpen(var_10_0) then
		ShowTips("TIME_OVER")

		return
	end

	JumpTools.GoToSystem("/polyhedronBlank/polyhedronLobby", nil, var_0_3.SYSTEM_ID.MATRIX)
end

function var_0_0.GoToGuildTask()
	if JumpTools.IsSystemOperationStoped(var_0_3.SYSTEM_ID.GUILD) then
		ShowTips("ERROR_FUNCTION_STOP")

		return nil
	end

	local var_11_0 = JumpTools.IsSystemLocked(var_0_3.SYSTEM_ID.GUILD)

	if var_11_0 then
		ShowTips(JumpTools.GetSystemLockedTip(var_0_3.SYSTEM_ID.GUILD, var_11_0))

		return
	end

	if GuildData:GetGuildInfo().id == nil then
		GuildAction.EnterGuild()
	else
		JumpTools.OpenPageByJump("/communityTask")
	end
end

function var_0_0.Jump2SubPlot(arg_12_0, arg_12_1, arg_12_2)
	local var_12_0 = ChapterClientCfg[arg_12_0]
	local var_12_1 = BattleFieldData:GetCacheChapter(arg_12_0)

	if not table.keyof(var_12_0.chapter_list, var_12_1) then
		var_12_1 = var_12_0.chapter_list[1]

		BattleFieldData:SetCacheChapterClient(var_12_0.toggle, arg_12_0)
		BattleFieldData:SetCacheChapter(arg_12_0, var_12_1)
		BattleStageAction.ClickSubPlot(var_12_1)
	end

	local var_12_2 = ChapterTools.GetSubPlotUrl(var_12_1, arg_12_2)
	local var_12_3 = {
		chapterClientID = arg_12_0
	}

	if LuaExchangeHelper.GetSceneIsHanding() then
		gameContext:SetUrlAndParams(var_12_2, var_12_3)
	else
		CheckManagers()
		JumpTools.OpenPageByJump(var_12_2, var_12_3, nil, arg_12_1)
	end
end

function var_0_0.Jump2SubPlotByChapterID(arg_13_0, arg_13_1)
	if not ChapterTools.IsUnlockChapter(arg_13_0) then
		local var_13_0 = ChapterCfg[arg_13_0].activity_id
		local var_13_1 = ActivityData:GetActivityRefreshTime(var_13_0)

		ShowTips(string.format(GetTips("OPEN_TIME"), manager.time:GetLostTimeStr(var_13_1)))

		return
	end

	local var_13_2 = getChapterClientCfgByChapterID(arg_13_0)
	local var_13_3 = table.keyof(var_13_2.chapter_list, arg_13_0)

	if var_13_3 > 1 then
		local var_13_4 = var_13_2.chapter_list[var_13_3 - 1]

		if not ChapterTools.IsClearChapter(var_13_4) then
			ShowTips(string.format(GetTips("UNLOCK_CONDITION_ACTIVITY_TIPS"), "", GetI18NText(ChapterCfg[var_13_4].subhead)))

			return
		end
	end

	BattleStageAction.ClickSubPlot(arg_13_0)

	if arg_13_1 then
		local var_13_5 = ChapterTools.GetSubPlotUrl(arg_13_0, isEntrace)
		local var_13_6 = {
			chapterClientID = var_13_2.id,
			chapterID = arg_13_0
		}

		JumpTools.OpenPageByJump(var_13_5, var_13_6)
	else
		manager.notify:Invoke(CHANGE_CHAPTER, arg_13_0)
	end
end

function var_0_0.GotoSubPlot(arg_14_0)
	local var_14_0 = SystemLinkCfg[arg_14_0[1]]
	local var_14_1 = arg_14_0[2]
	local var_14_2 = arg_14_0[3]
	local var_14_3 = ChapterCfg[var_14_1].clientID
	local var_14_4, var_14_5 = ChapterTools.GetSubPlotUrl(var_14_1, false)
	local var_14_6 = {
		chapterClientID = var_14_3
	}
	local var_14_7 = StageTools.IsLockSubChapterStage(var_14_1, var_14_2)

	if var_14_2 and BattleStageData:GetStageData()[var_14_2] and not var_14_5 and not var_14_7 then
		var_14_4 = var_14_4 .. "/subPlotSectionInfo"
		var_14_6 = {
			chapterClientID = var_14_3,
			section = var_14_2,
			chapterID = var_14_1,
			sectionType = var_0_1.STAGE_TYPE_NEW.STAGE_TYPE_SUB_PLOT
		}

		if var_14_1 then
			BattleFieldData:SetCacheStage(var_14_1, var_14_2)
			BattleFieldData:SetCacheChapter(var_14_3, var_14_1)
			BattleStageAction.ClickSubPlot(var_14_1)
		end
	else
		local var_14_8, var_14_9 = ChapterTools.GetSubPlotMaxStageID(var_14_1)

		BattleFieldData:SetCacheStage(var_14_8, var_14_9)
		BattleFieldData:SetCacheChapter(var_14_3, var_14_8)
		BattleStageAction.ClickSubPlot(var_14_8)
	end

	CheckManagers()
	gameContext:Go(var_14_4, var_14_6)
end

function var_0_0.GetActivityTime(arg_15_0)
	local var_15_0 = ActivityData:GetActivityData(arg_15_0)
	local var_15_1 = var_15_0.startTime
	local var_15_2 = var_15_0.stopTime
	local var_15_3 = var_15_0:GetStateBool()

	return var_15_1, var_15_2, var_15_3
end

function var_0_0.GetLinkAndParams(arg_16_0)
	local var_16_0 = SystemLinkCfg[arg_16_0[1]]
	local var_16_1 = {}

	if var_16_0.paramName and type(var_16_0.paramName) == "table" then
		local var_16_2 = 0
		local var_16_3 = #var_16_0.paramName

		if var_16_0.params and type(var_16_0.params) == "table" then
			var_16_2 = #var_16_0.params
		end

		local var_16_4 = 2

		for iter_16_0 = 1, var_16_3 do
			if iter_16_0 <= var_16_2 then
				var_16_1[var_16_0.paramName[iter_16_0]] = var_16_0.params[iter_16_0]
			else
				var_16_1[var_16_0.paramName[iter_16_0]] = arg_16_0[var_16_4]
				var_16_4 = var_16_4 + 1
			end
		end
	end

	for iter_16_1, iter_16_2 in pairs(arg_16_0) do
		if type(iter_16_1) == "string" then
			var_16_1[iter_16_1] = iter_16_2
		end
	end

	if arg_16_0[1] == var_0_3.JUMP_SPECIAL_ID.BATTLE_MAIN then
		var_16_1.sectionType = var_0_1.STAGE_TYPE_NEW.STAGE_TYPE_PLOT
	end

	return var_16_0.link, var_16_1, var_16_0.system_id
end

function var_0_0.GetLinkIsLocked(arg_17_0)
	local var_17_0 = SystemLinkCfg[arg_17_0[1]]

	if var_0_0.IsSystemLocked(var_17_0.system_id) then
		return true
	end

	local var_17_1 = BattleStageData:GetStageData()

	if var_17_0.id == var_0_3.JUMP_SPECIAL_ID.BATTLE_MAIN and not var_17_1[arg_17_0[2]] then
		return true
	end

	if var_17_0.id == var_0_3.JUMP_SPECIAL_ID.BATTLE_DAILY then
		local var_17_2 = arg_17_0[2]
		local var_17_3 = ChapterCfg[var_17_2].section_id_list[1]

		return PlayerData:GetPlayerInfo().userLevel < BattleDailyStageCfg[var_17_3].level
	end

	if var_17_0.id == var_0_3.JUMP_SPECIAL_ID.BATTLE_ASTROLABE and not BattleStageData:IsOpenChapter(arg_17_0[2]) then
		return true
	end

	if var_17_0.id == var_0_3.JUMP_SPECIAL_ID.BATTLE_EQUIP and not BattleStageData:IsOpenChapter(arg_17_0[2]) then
		return true
	end

	local var_17_4 = var_0_0.GetSystemActivityID(arg_17_0)

	if var_17_4 and var_17_4 ~= 0 then
		local var_17_5, var_17_6, var_17_7 = var_0_0.GetActivityTime(var_17_4)

		if var_17_5 > manager.time:GetServerTime() then
			return true
		end

		if var_17_6 <= manager.time:GetServerTime() then
			return true
		end

		if arg_17_0[1] ~= 11001 and not ActivityTools.IsUnlockActivity(var_17_4) then
			return true
		end

		if not var_17_7 then
			return true
		end
	end

	if var_17_0.system_id == var_0_3.SYSTEM_ID.BATTLE_SUB_PLOT and not ChapterTools.IsUnlockSubPlotClient(arg_17_0[2]) then
		return true
	end

	return false
end

function var_0_0.GetSystemLockedText(arg_18_0)
	local var_18_0 = arg_18_0[1]
	local var_18_1 = SystemCfg[SystemLinkCfg[var_18_0].system_id]

	if var_18_1 and var_18_1.open_condition then
		for iter_18_0, iter_18_1 in ipairs(var_18_1.open_condition) do
			if iter_18_1[1] == var_0_3.SYSTEM_LOCK_TYPE.LOCK then
				return true, GetTips("SYSTEM_LOCK")
			elseif iter_18_1[1] == var_0_3.SYSTEM_LOCK_TYPE.LEVEL then
				if PlayerData:GetPlayerInfo().userLevel < iter_18_1[2] then
					return true, string.format(GetTips("PLAYER_LEVEL_UNLOCK"), iter_18_1[2])
				end
			elseif iter_18_1[1] == var_0_3.SYSTEM_LOCK_TYPE.BATTLE then
				local var_18_2 = BattleStageData:GetStageData()
				local var_18_3 = iter_18_1[2]
				local var_18_4 = var_18_2[var_18_3]

				if var_18_4 and var_18_4.clear_times > 0 then
					return false, ""
				elseif BattleChapterStageCfg[var_18_3] == nil then
					return true, "未知的关卡ID" .. var_18_3
				else
					local var_18_5 = getChapterDifficulty(var_18_3)
					local var_18_6 = getChapterClientCfgByStageID(var_18_3).toggle
					local var_18_7, var_18_8 = BattleStageTools.GetChapterSectionIndex(var_18_6, var_18_3)

					return true, string.format(GetTips("MISSION_PROGRESS_UNLOCK"), GetI18NText(var_18_5), GetI18NText(var_18_7), GetI18NText(var_18_8))
				end
			elseif iter_18_1[1] == var_0_3.SYSTEM_LOCK_TYPE.HERO_FAVORABILITY then
				local var_18_9 = iter_18_1[2]
				local var_18_10 = ArchiveData:GetArchive(var_18_9).lv
				local var_18_11 = HeroRecordCfg[iter_18_1[2]].name
				local var_18_12 = iter_18_1[3]

				if var_18_10 < iter_18_1[3] then
					return true, string.format(GetTips("HERO_FAVORABILITY_UNLOCK"), var_18_11, var_18_12)
				end
			elseif iter_18_1[1] == var_0_3.SYSTEM_LOCK_TYPE.ANY_HERO_FAVORABILITY then
				local var_18_13 = iter_18_1[2]

				return true, string.format(GetTips("ANY_FAVORABILITY_UNLOCK"), var_18_13)
			else
				print("未实现的系统解锁判断方式:", iter_18_1[1])
			end
		end
	end

	local var_18_14 = var_0_0.GetSystemActivityID(arg_18_0)

	if var_18_14 and var_18_14 ~= 0 then
		local var_18_15, var_18_16, var_18_17 = var_0_0.GetActivityTime(var_18_14)

		if var_18_15 > manager.time:GetServerTime() then
			local var_18_18 = GetTips("OPEN_TIME")

			return true, string.format(var_18_18, manager.time:GetLostTimeStr(var_18_15))
		end

		if var_18_16 <= manager.time:GetServerTime() then
			return true, GetTips("TIME_OVER")
		end

		if arg_18_0[1] ~= 11001 and not ActivityTools.IsUnlockActivity(var_18_14) then
			local var_18_19 = ActivityCfg[var_18_14].unlock_condition

			if var_18_19[1] == 100 then
				return true, string.format(GetTips("UNLOCK_CONDITION_ACTIVITY_TIPS"), GetI18NText(ActivityStoryChapterCfg[var_18_19[2][1]].name), GetI18NText(BattleActivityStoryStageCfg[var_18_19[2][2]].name))
			elseif var_18_19[1] == 101 then
				local var_18_20 = ChapterCfg[var_18_19[2][1]]
				local var_18_21 = ChapterClientCfg[var_18_20.clientID]

				return true, string.format(GetTips("NEED_FINISH_PRE_STAGE"), GetTips(var_0_1.HARD_LANGUAGE[var_18_20.difficulty]), GetI18NText(var_18_21.desc))
			elseif var_18_19[1] == 102 then
				return ChapterTools.IsClearStage(var_18_19[2][2]), string.format(GetTips("UNLOCK_CONDITION_ACTIVITY_TIPS"), GetI18NText(ChapterCfg[var_18_19[2][1]].subhead), GetI18NText(BattleActivityStoryStageCfg[var_18_19[2][2]].name))
			end
		end

		if not var_18_17 then
			return true, GetTips("TIME_OVER")
		end
	end

	if SystemLinkCfg[var_18_0].system_id == var_0_3.SYSTEM_ID.BATTLE_SUB_PLOT then
		local var_18_22, var_18_23 = ChapterTools.IsUnlockSubPlotClient(arg_18_0[2])

		if not var_18_22 then
			return true, var_18_23
		end
	end

	if var_18_1 and not SystemData:GetSystemIsOpen(SystemLinkCfg[var_18_0].system_id) then
		return true, GetTips("SYSTEM_LOCK")
	end

	local var_18_24 = var_0_0.CustomLock(var_18_0)

	if var_18_24 then
		return true, GetTips(var_18_24[1])
	end

	return false, ""
end

function var_0_0.GetSystemActivityID(arg_19_0)
	local var_19_0 = var_0_0.GetSystemParamActivityID(arg_19_0, "subActivityID")

	if var_19_0 and var_19_0 ~= 0 then
		return var_19_0
	end

	local var_19_1 = var_0_0.GetSystemParamActivityID(arg_19_0, "activityId")

	if var_19_1 and var_19_1 ~= 0 then
		return var_19_1
	end

	local var_19_2 = var_0_0.GetSystemParamActivityID(arg_19_0, "activityID")

	if var_19_2 and var_19_2 ~= 0 then
		return var_19_2
	end
end

function var_0_0.GetSystemParamActivityID(arg_20_0, arg_20_1)
	local var_20_0 = arg_20_0[1]
	local var_20_1 = SystemLinkCfg[var_20_0]
	local var_20_2 = var_20_1.activity_id

	if type(var_20_1.paramName) == "table" then
		local var_20_3 = table.keyof(var_20_1.paramName, arg_20_1)

		if var_20_3 then
			if type(var_20_1.params) == "table" and var_20_1.params[var_20_3] then
				var_20_2 = var_20_1.params[var_20_3]
			else
				var_20_2 = arg_20_0[var_20_3 + 1]
			end
		end
	end

	return var_20_2
end

function var_0_0.IsSystemOperationStoped(arg_21_0)
	if arg_21_0 == nil then
		return false
	end

	local var_21_0 = SystemCfg[arg_21_0]

	if not var_21_0 then
		return false
	end

	if var_21_0.operation_stop_id ~= 0 then
		if OperationData:IsFunctionStoped(var_21_0.operation_stop_id) then
			return true
		end

		return false
	end
end

function var_0_0.IsSystemLocked(arg_22_0)
	local var_22_0 = SystemCfg[arg_22_0]

	if var_22_0 and var_22_0.open_condition then
		for iter_22_0, iter_22_1 in ipairs(var_22_0.open_condition) do
			local var_22_1 = var_0_0.IsConditionLocked(iter_22_1)

			if var_22_1 then
				return var_22_1
			end
		end
	end

	if var_22_0 and var_22_0.system_hide == 1 then
		return {
			"server_lock"
		}
	end

	if var_22_0 and not SystemData:GetSystemIsOpen(arg_22_0) then
		return {
			"server_lock"
		}
	end

	return var_0_0.CustomLock(arg_22_0)
end

function var_0_0.IsConditionLocked(arg_23_0)
	if arg_23_0[1] == var_0_3.SYSTEM_LOCK_TYPE.LOCK then
		return arg_23_0
	elseif arg_23_0[1] == var_0_3.SYSTEM_LOCK_TYPE.LEVEL then
		if PlayerData:GetPlayerInfo().userLevel < arg_23_0[2] then
			return arg_23_0
		end
	elseif arg_23_0[1] == var_0_3.SYSTEM_LOCK_TYPE.BATTLE then
		local var_23_0 = BattleStageData:GetStageData()[arg_23_0[2]]

		if var_23_0 and var_23_0.clear_times > 0 then
			return false
		else
			return arg_23_0
		end
	elseif arg_23_0[1] == var_0_3.SYSTEM_LOCK_TYPE.HERO_FAVORABILITY then
		local var_23_1 = arg_23_0[2]

		if ArchiveData:GetArchive(var_23_1).lv < arg_23_0[3] then
			return arg_23_0
		end
	elseif arg_23_0[1] == var_0_3.SYSTEM_LOCK_TYPE.ANY_HERO_FAVORABILITY then
		local var_23_2 = arg_23_0[2]
		local var_23_3 = HeroData:GetHeroList()
		local var_23_4 = false

		for iter_23_0, iter_23_1 in pairs(var_23_3) do
			if HeroTools.GetHeroIsUnlock(iter_23_0) then
				local var_23_5 = HeroRecordCfg.get_id_list_by_hero_id[iter_23_0][1]

				if var_23_2 <= ArchiveData:GetArchive(var_23_5).lv then
					var_23_4 = true

					break
				end
			end
		end

		if not var_23_4 then
			return arg_23_0
		end
	else
		print("未实现的系统解锁判断方式:", arg_23_0[1])
	end
end

local var_0_4 = {}

function var_0_0.SetSystemOpenCheck(arg_24_0, arg_24_1)
	var_0_4[arg_24_0] = arg_24_1
end

function var_0_0.GoToSystem(arg_25_0, arg_25_1, arg_25_2, arg_25_3)
	if var_0_0.IS_OPENING_PAGE then
		return
	end

	if ShopTools.IsLimitRecharge() and arg_25_1 and arg_25_1.shopId and ShopConst.PC_LOCK_SHOP[arg_25_1.shopID] then
		ShowTips("PC_SHOP_TIPS1")

		return
	end

	if ShopTools.IsLimitRecharge() and arg_25_1 and arg_25_1.childShopIndex and ShopConst.PC_LOCK_RECHARGE[arg_25_1.childShopIndex .. "_" .. arg_25_1.page] then
		ShowTips("PC_SHOP_TIPS1")

		return
	end

	if var_0_0.IsSystemOperationStoped(arg_25_2) then
		ShowTips("ERROR_FUNCTION_STOP")

		return nil
	end

	local var_25_0 = var_0_0.IsSystemLocked(arg_25_2)

	if arg_25_2 and var_25_0 then
		ShowTips(var_0_0.GetSystemLockedTip(arg_25_2, var_25_0))

		return nil
	end

	if var_0_4[arg_25_2] then
		local var_25_1, var_25_2 = var_0_4[arg_25_2](arg_25_1)

		if not var_25_1 then
			ShowTips(var_25_2)

			return nil
		end
	end

	gameContext:Go(arg_25_0, arg_25_1, arg_25_3, true)
end

function var_0_0.GetSystemLockedTip(arg_26_0, arg_26_1)
	if arg_26_0 and arg_26_1 then
		if arg_26_1[1] == var_0_3.SYSTEM_LOCK_TYPE.LEVEL then
			return string.format(GetTips("PLAYER_LEVEL_UNLOCK"), arg_26_1[2])
		elseif arg_26_1[1] == var_0_3.SYSTEM_LOCK_TYPE.BATTLE then
			local var_26_0 = arg_26_1[2]
			local var_26_1 = getChapterDifficulty(var_26_0)
			local var_26_2 = getChapterClientCfgByStageID(var_26_0).toggle
			local var_26_3, var_26_4 = BattleStageTools.GetChapterSectionIndex(var_26_2, var_26_0)

			return string.format(GetTips("MISSION_PROGRESS_UNLOCK"), var_26_1, GetI18NText(var_26_3), GetI18NText(var_26_4))
		elseif arg_26_1[1] == var_0_3.SYSTEM_LOCK_TYPE.HERO_FAVORABILITY then
			local var_26_5 = HeroRecordCfg[arg_26_1[2]].name
			local var_26_6 = arg_26_1[3]

			return string.format(GetTips("HERO_FAVORABILITY_UNLOCK"), GetI18NText(var_26_5), var_26_6)
		elseif arg_26_1[1] == var_0_3.SYSTEM_LOCK_TYPE.ANY_HERO_FAVORABILITY then
			local var_26_7 = arg_26_1[2]

			return string.format(GetTips("ANY_FAVORABILITY_UNLOCK"), var_26_7)
		elseif arg_26_1[1] == "TIME_OVER" then
			return GetTips("TIME_OVER")
		end
	end

	return GetTips("SYSTEM_LOCK")
end

function var_0_0.Back(arg_27_0, arg_27_1)
	gameContext:Back(arg_27_0, arg_27_1)
	GlobalCall.register("AfterGo", function()
		var_0_0.RefreshGaussianBg()
	end)
	var_0_0.RefreshGaussianBg()
end

function var_0_0.OpenPageByJump(arg_29_0, arg_29_1, arg_29_2, arg_29_3)
	if var_0_0.IS_OPENING_PAGE then
		return
	end

	if ShopTools.IsPC() and arg_29_1 and arg_29_1.shopId and ShopConst.PC_LOCK_SHOP[arg_29_1.shopID] and ShopTools.IsLimitRecharge() then
		ShowTips("PC_SHOP_TIPS1")

		return
	end

	if ShopTools.IsPC() and arg_29_1 and arg_29_1.childShopIndex and ShopConst.PC_LOCK_RECHARGE[arg_29_1.childShopIndex .. "_" .. arg_29_1.page] and ShopTools.IsLimitRecharge() then
		ShowTips("PC_SHOP_TIPS1")

		return
	end

	local var_29_0 = string.char(string.byte(arg_29_0)) == "/"
	local var_29_1

	if var_29_0 then
		local var_29_2 = string.split(string.sub(arg_29_0, 2, #arg_29_0), "/")
	else
		local var_29_3 = string.split(arg_29_0, "/")
	end

	GlobalCall.register("AfterGo", function()
		var_0_0.RefreshGaussianBg()
	end)
	var_0_0.GoToSystem(arg_29_0, arg_29_1, arg_29_2, arg_29_3)
end

function var_0_0.OpenPopUp(arg_31_0, arg_31_1, arg_31_2, arg_31_3)
	GlobalCall.register("AfterGo", function()
		var_0_0.RefreshGaussianBg()

		if arg_31_3 then
			arg_31_3()
		end
	end)
	var_0_0.GoToSystem(arg_31_0, arg_31_1, arg_31_2)
end

function var_0_0.GetRealPageName(arg_33_0)
	if string.char(string.byte(arg_33_0)) == "/" then
		return string.sub(arg_33_0, 2, #arg_33_0)
	else
		return arg_33_0
	end
end

function var_0_0.RefreshGaussianBg()
	local var_34_0 = gameContext:GetAllOpenRoute()
	local var_34_1 = #var_34_0
	local var_34_2 = false

	for iter_34_0 = var_34_1, 1, -1 do
		local var_34_3 = var_34_0[iter_34_0]

		if var_0_3.NEED_GAUSSIAN_POPUP[var_34_3] then
			var_0_0.SetGaussionBg(var_34_3, true)

			var_34_2 = true
		else
			var_0_0.SetGaussionBg(url, false)
		end
	end

	manager.ui:SetUISeparateRender(var_34_2)
end

function var_0_0.SetGaussionBg(arg_35_0, arg_35_1)
	local var_35_0 = gameContext:GetOpenPageHandler(arg_35_0)

	if var_35_0 then
		var_35_0:SetGaussionBg(arg_35_1)
	end
end

function var_0_0.JudgeIsHaveGaussian(arg_36_0)
	for iter_36_0, iter_36_1 in ipairs(arg_36_0) do
		if var_0_3.NEED_GAUSSIAN_POPUP[iter_36_1] then
			return true
		end
	end

	return false
end

function var_0_0.IsActivityOpen(arg_37_0)
	local var_37_0 = var_0_0.GetSystemActivityID(arg_37_0)

	if var_37_0 and var_37_0 ~= 0 then
		local var_37_1, var_37_2, var_37_3 = var_0_0.GetActivityTime(var_37_0)

		if var_37_1 > manager.time:GetServerTime() or var_37_2 <= manager.time:GetServerTime() then
			return false
		end
	end

	return true
end

function var_0_0.NeedHide(arg_38_0, arg_38_1)
	local var_38_0 = SystemLinkCfg[arg_38_0[1]]

	if var_38_0.need_hide ~= 1 then
		return false
	end

	if var_0_0.IsActivityOpen(arg_38_0) == false then
		return true
	end

	if var_38_0.system_id == var_0_3.SYSTEM_ID.SHOP_ENTER then
		local var_38_1, var_38_2 = var_0_0.GetLinkAndParams(arg_38_0)
		local var_38_3 = var_38_2.shopId

		if var_38_3 then
			local var_38_4 = ShopTools.GetGoodsIDListByItemID(var_38_3, arg_38_1)

			if ShopTools.IsGoodCanExchange(var_38_3, var_38_4) == false then
				return true
			end
		end
	end

	return false
end

function var_0_0.CustomLock(arg_39_0)
	if arg_39_0 == var_0_3.SYSTEM_ID.BATTLE_ABYSS then
		if manager.time:GetServerTime() + 1 >= AbyssData:GetRefreshTimestamp() then
			return {
				"TIME_OVER"
			}
		end
	elseif arg_39_0 == var_0_3.SYSTEM_ID.MATRIX then
		local var_39_0 = PolyhedronData:GetActivityID()
		local var_39_1 = ActivityData:GetActivityData(var_39_0)

		if manager.time:GetServerTime() + 1 >= var_39_1.stopTime then
			return {
				"TIME_OVER"
			}
		end
	end

	return false
end

return var_0_0
