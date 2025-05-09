local var_0_0 = {}

manager.net:Bind(11001, function(arg_1_0)
	ActivityData:InitActivityData(arg_1_0)
	var_0_0.DealWithAllActivityData()
	ActivityRedPoint:OnActivityUpdate(arg_1_0.activity_list or {})
end)
manager.net:Bind(11003, function(arg_2_0)
	ActivityData:UpdateActivityData(arg_2_0.activity)
	ActivityRedPoint:OnActivityUpdate({
		arg_2_0.activity
	})
end)
manager.net:Bind(64031, function(arg_3_0)
	ActivityData:RefreshActivityTime(arg_3_0)
end)

function var_0_0.DealWithAllActivityData()
	local var_4_0 = ActivityData:GetAllActivityData()

	for iter_4_0, iter_4_1 in pairs(var_4_0) do
		var_0_0.DealWithActivityData(iter_4_1)
	end

	var_0_0.AfterDealWithActivityData()
end

function var_0_0.DealWithActivityData(arg_5_0)
	local var_5_0 = ActivityTools.GetActivityType(arg_5_0.id)

	if ActivityTemplateConst.MAIN_ACTIVITY == var_5_0 then
		var_0_0.InitRedPointKey(arg_5_0.id)
	elseif ActivityTemplateConst.DEMON == var_5_0 then
		SubDemonChallengeAction.Init()
		SubDemonChallengeAction.InitRedPointKey(arg_5_0.id)
	elseif ActivityTemplateConst.NEW_DEMON == var_5_0 then
		NewDemonChallengeAction.Init()
		NewDemonChallengeAction.InitRedPointKey(arg_5_0.id)
	elseif ActivityTemplateConst.TALENT_TREE == var_5_0 then
		TalentTreeAction.Init()
	elseif ActivityTemplateConst.BATTLE_FIRST_PASS == var_5_0 then
		BattleFirstPassAction.Init()
		BattleFirstPassAction.InitRedPointKey(arg_5_0.id)
	elseif ActivityTemplateConst.STORY == var_5_0 then
		var_0_0.InitStoryRedPoint(arg_5_0.id)
	elseif ActivityTemplateConst.SOLO_CHALLENGE == var_5_0 then
		SoloChallengeAction.InitRedPoint(arg_5_0.id)
	elseif ActivityTemplateConst.FISHING == var_5_0 then
		FishingAction.Init()
	elseif ActivityTemplateConst.LIMITED_CALCULATION == var_5_0 then
		LimitedCalculationAction.Init()
		LimitedCalculationAction.InitRedPointKey(arg_5_0.id)
	elseif ActivityTemplateConst.SKIN_EXCHANGE == var_5_0 then
		SkinExchangeAction.Init()
		SkinExchangeAction.InitRedPointKey(arg_5_0.id)
	elseif ActivityTemplateConst.SUMMER_ACTIVITY_PT == var_5_0 then
		SummerActivityPtAction.Init()
	elseif ActivityTemplateConst.ACTIVITY_PUZZLE == var_5_0 then
		PuzzleAction.InitRedPointKey(arg_5_0.id)
	elseif ActivityTemplateConst.COWBOY == var_5_0 then
		CowboyAction.Init()
		CowboyAction.InitRedPointKey(arg_5_0.id)
	elseif ActivityTemplateConst.ACTIVITY_RACE == var_5_0 then
		ActivityRaceAction.InitRedPointKey(arg_5_0.id)
	elseif ActivityTemplateConst.GUILD_ACTIVITY == var_5_0 then
		GuildActivityAction.Init()
	elseif ActivityTemplateConst.GUILD_ACTIVITY_SP == var_5_0 then
		GuildActivitySPAction.Init()
	elseif ActivityTemplateConst.XH1ST_SEAL == var_5_0 then
		XH1stSealAction.Init()
		XH1stSealAction.InitRedPointKey(arg_5_0.id)
	elseif ActivityTemplateConst.RACE_TRIAL == var_5_0 then
		RaceTrialAction.Init(arg_5_0.id)
		RaceTrialAction.InitRedPointKey(arg_5_0.id)
	elseif ActivityTemplateConst.INFINITY_POOL_TASK == var_5_0 then
		var_0_0.InitInfinityPoolTaskRedPoint(arg_5_0.id)
	elseif ActivityTemplateConst.MARDUK_SPECIAL == var_5_0 then
		MardukSpecialAction.Init(arg_5_0.id)
	elseif ActivityTemplateConst.SURVIVE_SOLO == var_5_0 then
		SurviveSoloAction.Init(arg_5_0.id)
		SurviveSoloAction.InitRedPointKey(arg_5_0.id)
	elseif ActivityTemplateConst.PAPER_CUT == var_5_0 then
		PaperCutAction.Init(arg_5_0.id)
	elseif ActivityTemplateConst.SPRING_ANTITHETICAL_COUPLET == var_5_0 then
		AntitheticalCoupletAction.Init()
		AntitheticalCoupletAction.InitRedPointKey(arg_5_0.id)
	elseif ActivityTemplateConst.VALENTINE_GAME == var_5_0 or ActivityTemplateConst.INDIA_VALENTINE_GAME_V2 == var_5_0 then
		ValentineGameAction.Init()
		ValentineGameAction.InitRedPointKey(arg_5_0.id)
	elseif ActivityTemplateConst.ACTIVITY_AFFIX_SELECT == var_5_0 then
		ActivityAffixSelectAction.Init()
		ActivityAffixSelectAction.InitRedPointKey(arg_5_0.id)
	elseif ActivityTemplateConst.ACTIVITY_CULTIVATE_HERO == var_5_0 then
		CultivateHeroAction.InitRedPointKey(arg_5_0.id)
	elseif ActivityTemplateConst.ACTIVITY_PT_2 == var_5_0 then
		ActivityPt2Action.Init()
		ActivityPt2Action.InitRedPointKey(arg_5_0.id)
	elseif ActivityTemplateConst.ACTIVITY_SET == var_5_0 then
		var_0_0.InitActivitySetRedPoint(arg_5_0.id)
	elseif ActivityTemplateConst.ACTIVITY_RECALL == var_5_0 then
		ActivityRecallAction.Init()
	elseif ActivityTemplateConst.SAIL_GAME == var_5_0 then
		SailGameAction.UpdateRedPoint(arg_5_0.id)
	elseif ActivityTemplateConst.CHESS_ACTIVITY_CHINESE_ZONE == var_5_0 then
		RedPointData:UpdateRedPoint(arg_5_0.id)
	elseif ActivityTemplateConst.ACTIVITY_2_2_WATER == var_5_0 then
		ActivityWaterAction.Init(arg_5_0.id)
	elseif ActivityTemplateConst.ACTIVITY_FLIP_CARD == var_5_0 then
		XH3rdFlipCardAction:InitRedPointKey(arg_5_0.id)
	elseif ActivityTemplateConst.ACTIVITY_SKIN_DRAW == var_5_0 then
		ActivitySkinDrawAction.Init()
		ActivitySkinDrawAction.InitRedPointKey(arg_5_0.id)
	elseif ActivityTemplateConst.JAPAN_SOLO_HEART_DEMON == var_5_0 then
		-- block empty
	elseif ActivityTemplateConst.ACTIVITY_INVITE == var_5_0 then
		InviteAction.InitRedPointKey(arg_5_0.id)
	elseif ActivityTemplateConst.DESTROY_BOX_GAME == var_5_0 then
		DestroyBoxGameAction.InitRedPoint(arg_5_0.id)
	elseif ActivityTemplateConst.KAGUTSUCHI_ACTIVITY_PT_SCROLL == var_5_0 then
		ActivityPtScrollAction.Init()
		ActivityPtScrollAction.InitRedPointKey(arg_5_0.id)
	elseif ActivityTemplateConst.ACTIVITY_QUIZ == var_5_0 then
		ActivityQuizAction.Init()
		ActivityQuizAction.InitRedPointKey(arg_5_0.id)
	elseif ActivityTemplateConst.ACTIVITY_MEMORY == var_5_0 then
		ActivityMemoryAction.Init(arg_5_0.id)
		ActivityMemoryAction.InitRedPointKey(arg_5_0.id)
	elseif ActivityTemplateConst.ACTIVITY_PUSH_BOX == var_5_0 then
		ActivityPushBoxAction.Init()
		ActivityPushBoxAction.InitRedPointKey(arg_5_0.id)
	elseif ActivityTemplateConst.HERO_LETTER == var_5_0 then
		ActivityHeroLetterAction.Init()
		ActivityHeroLetterAction.InitRedPointKey(arg_5_0.id)
	elseif ActivityTemplateConst.ACTIVITY_USE_DUNDUN == var_5_0 then
		ActivityPointAction.InitDunDunRedPointKey(arg_5_0.id)
	elseif ActivityTemplateConst.ACTIVITY_3_10_VALENTINEGAME_V3 == var_5_0 then
		ValentineGameAction.InitValentineGameV3RedPointKey(arg_5_0.id)
	elseif ActivityTemplateConst.ACTIVITY_AUTO_COOK == var_5_0 then
		ActivityAutoCookAction.InitRedPoint(arg_5_0.id)
	elseif var_5_0 == ActivityTemplateConst.ACTIVITY_BLOOD_CARD then
		BloodCardAction.InitRedPoint(arg_5_0.id)
	elseif var_5_0 == ActivityTemplateConst.ACTIVITY_3_10_SANDPLAY_MAIN then
		QWorldAction.InitRedPoint(arg_5_0.id)
	elseif var_5_0 == ActivityTemplateConst.SKIN_DISCOUNT_GIFT then
		SkinDiscountGiftAction.InitRedPoint(arg_5_0.id)
	elseif var_5_0 == ActivityTemplateConst.ACTIVITY_SKULD_MAIN then
		SkuldSystemAction.InitRedPoint()
	end
end

function var_0_0.AfterDealWithActivityData()
	SkuldTravelData:InitRedPointGroup()
end

manager.notify:RegistListener(ACTIVITY_UPDATE, function(arg_7_0)
	var_0_0.UpdateRedPoint(arg_7_0)
end)

function var_0_0.UpdateRedPoint(arg_8_0)
	local var_8_0 = ActivityTools.GetActivityType(arg_8_0)

	if var_8_0 == ActivityTemplateConst.ACTIVITY_PUZZLE then
		if ActivityData:GetActivityData(arg_8_0).stopTime <= manager.time:GetServerTime() then
			local var_8_1 = arg_8_0
			local var_8_2 = ActivityCfg[var_8_1].sub_activity_list

			for iter_8_0, iter_8_1 in ipairs(var_8_2) do
				manager.redPoint:setTip(string.format("%s_%s_%s_normal", RedPointConst.ACTIVITY_PUZZLE, var_8_1, iter_8_1), 0)
				manager.redPoint:setTip(string.format("%s_%s_%s_video", RedPointConst.ACTIVITY_PUZZLE, var_8_1, iter_8_1), 0)
			end
		end
	elseif arg_8_0 == ActivityConst.MOONBO then
		MoonBoData:FreshTime()
	elseif var_8_0 == ActivityTemplateConst.HERO_TRIAL and (not (manager.time:GetServerTime() >= ActivityData:GetActivityData(arg_8_0).stopTime) or true) then
		-- block empty
	elseif var_8_0 == ActivityTemplateConst.SKIN_TRIAL then
		SkinTrialAction.UpdateRedPoint(arg_8_0)
	elseif var_8_0 == ActivityTemplateConst.SUMMER_ACTIVITY_PT then
		SummerActivityPtAction.UpdateRedPoint(arg_8_0)
	elseif var_8_0 == ActivityTemplateConst.COWBOY then
		CowboyAction:CloseActivity(arg_8_0)
	elseif var_8_0 == ActivityTemplateConst.ACTIVITY_RACE then
		ActivityRaceAction.UpdateRedPoint(arg_8_0)
	elseif var_8_0 == ActivityTemplateConst.GUILD_ACTIVITY then
		GuildActivityAction.UpdateRedPoint(arg_8_0)
	elseif var_8_0 == ActivityTemplateConst.GUILD_ACTIVITY_SP then
		GuildActivitySPAction.UpdateRedPoint(arg_8_0)
	elseif var_8_0 == ActivityTemplateConst.DEMON then
		SubDemonChallengeAction.RefreshRedPoint(arg_8_0)
	elseif var_8_0 == ActivityTemplateConst.RACE_TRIAL then
		RaceTrialAction.UpdateRedPoint(arg_8_0)
	elseif var_8_0 == ActivityTemplateConst.STORY then
		local var_8_3 = ActivityData:GetActivityData(arg_8_0).stopTime
		local var_8_4 = ActivityTools.GetRedPointKey(arg_8_0) .. arg_8_0

		if var_8_3 <= manager.time:GetServerTime() then
			var_0_0.ClearRedPoint(arg_8_0)
			manager.redPoint:updateKey(var_8_4)
		elseif #(manager.redPoint:getchildKeys(var_8_4) or {}) <= 0 then
			var_0_0.InitStoryRedPoint(arg_8_0)
			manager.redPoint:updateKey(var_8_4)
		end

		TaskRedPoint:UpdateChapterPlot19RedTip()
	elseif var_8_0 == ActivityTemplateConst.STORY_STAGE then
		if ActivityData:GetActivityData(arg_8_0).stopTime <= manager.time:GetServerTime() then
			ActivityStoryAction.UpdateRedPoint(arg_8_0, 0)
		end
	elseif var_8_0 == ActivityTemplateConst.MAIN_STORY then
		if ActivityData:GetActivityData(arg_8_0).stopTime <= manager.time:GetServerTime() then
			for iter_8_2, iter_8_3 in ipairs(ActivityCfg[arg_8_0].sub_activity_list) do
				manager.redPoint:setTip(string.format("%s%s", ActivityTools.GetRedPointKey(iter_8_3), iter_8_3), 0)
			end
		end

		BattleStageAction.UpdateActivityRedPoint()
	elseif var_8_0 == ActivityTemplateConst.SUB_PLOT then
		BattleStageAction.UpdateSubPlotRedPoint()
	elseif var_8_0 == ActivityTemplateConst.ENDLESS then
		BattleStageAction.UpdateActivityRedPoint()
	elseif var_8_0 == ActivityTemplateConst.MARDUK_SPECIAL then
		if arg_8_0 == ActivityConst.FACTORY_MARDUK then
			MardukSpecialAction.UpdateRedPoint(arg_8_0)
		end

		if arg_8_0 == ActivityConst.ACTIVITY_2_2_SPECIAL then
			MardukSpecialAction.UpdateRedPoint(arg_8_0)
		end
	elseif var_8_0 == ActivityTemplateConst.SEQUENTIAL_BATTLE then
		if ActivityData:GetActivityData(arg_8_0).stopTime <= manager.time:GetServerTime() then
			SequentialBattleAction.OverActivity(arg_8_0)
		end
	elseif var_8_0 == ActivityTemplateConst.SEQUENTIAL_BATTLE_SUB then
		SequentialBattleAction.StopRedPoint(arg_8_0)
	elseif var_8_0 == ActivityTemplateConst.SPRING_FESTIVAL_GREETING then
		manager.redPoint:setTip(string.format("%s_%s", RedPointConst.SPRING_FESTIVAL_GREETING, arg_8_0), 0)
	elseif var_8_0 == ActivityTemplateConst.SPRING_FESTIVAL_RIDDLE then
		manager.redPoint:setTip(string.format("%s_%s", RedPointConst.SPRING_FESTIVAL_RIDDLE, arg_8_0))
	elseif arg_8_0 == ActivityConst.ACTIVITY_1_6 then
		SkuldTravelAction:CheckUnBindActivitySkuld()
		SkuldTravelAction:CheckUnBindChapterKey()
	elseif arg_8_0 == ActivityConst.CHESS_ACTIVITY_CHINESE_ZONE then
		RedPointData:UpdateRedPoint(arg_8_0)
	elseif ActivityTemplateConst.ACTIVITY_PROMOTINAL == var_8_0 then
		var_0_0.UpdatePromotinalRedPoint(arg_8_0)
	elseif ActivityTemplateConst.ACTIVITY_2_2_WATER_SCHEDULE == var_8_0 or ActivityTemplateConst.ACTIVITY_2_2_WATER == var_8_0 then
		ActivityWaterAction.UpdateRedPoint()
	elseif ActivityTemplateConst.LIMITED_CALCULATION == var_8_0 then
		LimitedCalculationAction:RefreshRedPoint(arg_8_0)
	elseif ActivityTemplateConst.SOLO_CHALLENGE == var_8_0 then
		SoloChallengeAction.CloseRedPoint(arg_8_0)
	elseif ActivityTemplateConst.ABYSS == var_8_0 then
		local var_8_5 = ActivityData:GetActivityData(arg_8_0).stopTime
		local var_8_6 = manager.time:GetServerTime() + 1

		if var_8_5 <= var_8_6 and var_8_6 >= AbyssData:GetRefreshTimestamp() then
			AbyssAction.UpdateRedPoints()
		end
	elseif ActivityTemplateConst.POLYHEDRON_ACTIVITY == var_8_0 then
		local var_8_7 = ActivityData:GetActivityData(arg_8_0).stopTime
		local var_8_8 = manager.time:GetServerTime() + 1

		if var_8_7 <= var_8_8 then
			local var_8_9 = PolyhedronData:GetActivityID()

			if var_8_8 >= ActivityData:GetActivityData(var_8_9).stopTime then
				PolyhedronAction.RefreshPolicyRedPoint()
				PolyhedronAction.CheckBeaconRedPoint()
				PolyhedronAction.CheckTerminalRedPoint()
				PolyhedronAction.RefreshHeroesRedPoint()
			end
		end

		manager.notify:Invoke(MATRIX_UPDATE)
	elseif ActivityTemplateConst.MOON_CAKE_MAKE == var_8_0 then
		if not ActivityData:GetActivityIsOpen(arg_8_0) then
			MoonCakeAction.CloseCakeStageRedPoint(arg_8_0)
		end
	elseif ActivityTemplateConst.MOON_CAKE_PARTY == var_8_0 then
		if not ActivityData:GetActivityIsOpen(arg_8_0) then
			MoonCakeAction.ClosePartytageRedPoint(arg_8_0)
		end
	elseif ActivityTemplateConst.DESTROY_BOX_GAME == var_8_0 then
		DestroyBoxGameAction.UpdateMainActivityRedPoint(arg_8_0)
	elseif ActivityTemplateConst.DESTROY_BOX_GAME_STAGE == var_8_0 then
		DestroyBoxGameAction.UpdateRedPoint(arg_8_0)
	elseif ActivityTemplateConst.KAGUTSUCHI_ACTIVITY_PT_SCROLL == var_8_0 then
		ActivityPtScrollAction.RefreshRedPoint(arg_8_0)
	elseif ActivityTemplateConst.VALENTINE_GAME_LEVEL == var_8_0 or ActivityTemplateConst.INDIA_VALENTINE_GAME_V2_SUBACTIVITY == var_8_0 then
		ValentineGameAction:RefreshRedPoint(arg_8_0)
	elseif ActivityTemplateConst.ACTIVITY_QUIZ == var_8_0 then
		ActivityQuizAction.RefreshRedPoint(arg_8_0)
	elseif ActivityTemplateConst.ACTIVITY_MEMORY == var_8_0 then
		ActivityMemoryAction.RefreshRedPoint(arg_8_0)
	elseif ActivityTemplateConst.SURVIVE_SOLO == var_8_0 then
		SurviveSoloAction:RefreshRedPoint(arg_8_0)
	elseif ActivityTemplateConst.ACTIVITY_CULTIVATE_HERO == var_8_0 then
		CultivateHeroAction.RefreshRedPoint(arg_8_0)
	elseif ActivityTemplateConst.ACTIVITY_PUSH_BOX == var_8_0 then
		ActivityPushBoxAction.RefreshRedPoint(arg_8_0)
	elseif ActivityTemplateConst.HERO_LETTER == var_8_0 then
		ActivityHeroLetterAction.RefreshRedPoint(arg_8_0)
	elseif arg_8_0 == ActivityConst.SUMMER_CHESS_BOARD_ENTRY then
		ActivitySummerChessBoardAction.InitPageRedPoint(arg_8_0)
	elseif arg_8_0 == ActivityConst.SUMMER_CHESS_BOARD_MAIN then
		ActivitySummerChessBoardAction.InitMainRedPoint(arg_8_0)
	elseif ActivityTemplateConst.ACTIVITY_WHACK_MOLE == var_8_0 then
		WhackMoleAction.UpdateRedPoint(arg_8_0)
	elseif ActivityTemplateConst.ACTIVITY_AUTO_COOK == var_8_0 then
		ActivityAutoCookAction.UpdateRedPoint(arg_8_0)
	end

	if SpringPreheatAction then
		SpringPreheatAction:RefreshRedPoint()
	end

	if HeroTrialData then
		HeroTrialData:RefreshRedData()
	end

	var_0_0.UpdateShopRedPoint(arg_8_0)
end

function var_0_0.InitRedPointKey(arg_9_0)
	local var_9_0
	local var_9_1 = {}
	local var_9_2 = ActivityCfg[arg_9_0].sub_activity_list

	if not var_9_2 or #var_9_2 == 0 then
		return
	end

	if arg_9_0 == ActivityConst.OSIRIS_ACTIVITY then
		manager.redPoint:addGroup(string.format("%s%s", RedPointConst.MAIN_ACTIVITY, arg_9_0), {
			string.format("%s_%s", RedPointConst.ACTIVITY_TASK, ActivityConst.OSIRIS_TASK_DAILY),
			string.format("%s_%s", RedPointConst.WAR_CHESS, ActivityConst.OSIRIS_CHESS),
			RedPointConst.OSIRIS_DEMON,
			RedPointConst.OSIRIS_RACE_TRIAL,
			string.format("%s_%s", RedPointConst.HERO_TRIAL, ActivityConst.OSIRIS_HERO_TRIAL_STAGE)
		})

		return
	end

	for iter_9_0, iter_9_1 in ipairs(var_9_2) do
		local var_9_3 = ActivityTools.GetRedPointKey(iter_9_1) .. iter_9_1

		table.insert(var_9_1, var_9_3)
	end

	local var_9_4 = RedPointConst.MAIN_ACTIVITY .. arg_9_0

	manager.redPoint:addGroup(var_9_4, var_9_1)
end

function var_0_0.InitSubRedPoint(arg_10_0)
	local var_10_0 = ActivityCfg[arg_10_0].sub_activity_list

	if #var_10_0 <= 0 then
		return
	end

	local var_10_1 = {}

	for iter_10_0, iter_10_1 in ipairs(var_10_0) do
		var_0_0.InitSubRedPoint(iter_10_1)
		table.insert(var_10_1, ActivityTools.GetRedPointKey(iter_10_1) .. iter_10_1)
	end

	manager.redPoint:addGroup(ActivityTools.GetRedPointKey(arg_10_0) .. arg_10_0, var_10_1)
end

function var_0_0.InitStoryRedPoint(arg_11_0)
	local var_11_0 = {}

	if ActivityCfg[arg_11_0] == nil then
		return
	end

	for iter_11_0, iter_11_1 in ipairs(ActivityCfg[arg_11_0].sub_activity_list) do
		if ActivityCfg[iter_11_1].activity_template == ActivityTemplateConst.STORY_STAGE or ActivityCfg[iter_11_1].activity_template == ActivityTemplateConst.SUB_PLOT or ActivityCfg[iter_11_1].activity_template == ActivityTemplateConst.MAIN_STORY then
			table.insert(var_11_0, ActivityTools.GetRedPointKey(iter_11_1) .. iter_11_1)
			var_0_0.InitSubRedPoint(iter_11_1)
		elseif ActivityCfg[iter_11_1].activity_template == ActivityTemplateConst.CHESS then
			table.insert(var_11_0, string.format("%s_%s", RedPointConst.WAR_CHESS, iter_11_1))
		end
	end

	if ActivityCfg[arg_11_0].activity_theme == ActivityConst.THEME.SUMMER then
		local var_11_1 = ActivityCfg[arg_11_0].activity_theme

		table.insert(var_11_0, string.format("%s_%s", RedPointConst.ACTIVITY_SIDE_STORY, var_11_1))

		local var_11_2 = {}

		for iter_11_2, iter_11_3 in ipairs(ActivityStoryCollect[ActivityCfg[arg_11_0].activity_theme].story_id) do
			table.insert(var_11_2, string.format("%s_%s_%s", RedPointConst.ACTIVITY_SIDE_STORY, var_11_1, iter_11_3))
		end

		manager.redPoint:addGroup(string.format("%s_%s", RedPointConst.ACTIVITY_SIDE_STORY, var_11_1), var_11_2)
		table.insert(var_11_0, string.format("%s_%s", RedPointConst.COMBAT_SUB_PLOT, 6010003))
	end

	manager.redPoint:addGroup(ActivityTools.GetRedPointKey(arg_11_0) .. arg_11_0, var_11_0)
end

function var_0_0.ClearRedPoint(arg_12_0)
	manager.redPoint:addGroup(ActivityTools.GetRedPointKey(arg_12_0) .. arg_12_0, {}, true)
end

function var_0_0.InitInfinityPoolTaskRedPoint(arg_13_0)
	local var_13_0 = {}

	for iter_13_0, iter_13_1 in ipairs(ActivityCfg[arg_13_0].sub_activity_list) do
		if ActivityCfg[iter_13_1].activity_template == ActivityTemplateConst.TASK then
			table.insert(var_13_0, string.format("%s_%s", RedPointConst.ACTIVITY_TASK, iter_13_1))
		end
	end

	manager.redPoint:addGroup(string.format("%s_%s", RedPointConst.INFINITY_POOL_TASK, arg_13_0), var_13_0)
end

function var_0_0.InitActivitySetRedPoint(arg_14_0)
	local var_14_0 = {}

	for iter_14_0, iter_14_1 in ipairs(ActivityCfg[arg_14_0].sub_activity_list) do
		if ActivityCfg[iter_14_1].activity_template == ActivityTemplateConst.TASK then
			table.insert(var_14_0, string.format("%s_%s", RedPointConst.ACTIVITY_TASK, iter_14_1))
		elseif ActivityCfg[iter_14_1].activity_template == ActivityTemplateConst.ACTIVITY_SHOP then
			table.insert(var_14_0, string.format("%s_%s", RedPointConst.ACTIVITY_SHOP, iter_14_1))
		end
	end

	manager.redPoint:addGroup(string.format("%s_%s", RedPointConst.ACTIVITY_SET, arg_14_0), var_14_0)
end

function var_0_0.InitLoginShopRedPoint()
	for iter_15_0, iter_15_1 in ipairs(ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.ACTIVITY_SHOP]) do
		if ActivityData:GetActivityIsOpen(iter_15_1) then
			local var_15_0 = ActivityData:GetActivityData(iter_15_1)

			if manager.time:GetServerTime() + 259200 >= var_15_0.stopTime and ActivityShopCfg[iter_15_1] then
				local var_15_1 = ActivityShopCfg[iter_15_1].shop_id
				local var_15_2 = ShopListCfg[var_15_1].cost_id or {}

				for iter_15_2, iter_15_3 in ipairs(var_15_2) do
					if ItemTools.getItemNum(iter_15_3) > 0 then
						manager.redPoint:setTip(string.format("%s_%s", RedPointConst.ACTIVITY_SHOP, iter_15_1), 1)

						break
					end
				end
			end
		end
	end
end

function var_0_0.UpdateShopRedPoint(arg_16_0)
	local var_16_0 = ActivityCfg[arg_16_0]

	if var_16_0 == nil then
		print("no exist activity config :", acitvityID)

		return
	end

	if var_16_0.activity_template == ActivityTemplateConst.ACTIVITY_SHOP and not ActivityData:GetActivityIsOpen(arg_16_0) then
		manager.redPoint:setTip(string.format("%s_%s", RedPointConst.ACTIVITY_SHOP, arg_16_0), 0)
	end
end

function var_0_0.UpdatePromotinalRedPoint(arg_17_0)
	local var_17_0 = string.format("%s%s", ActivityTools.GetRedPointKey(arg_17_0), arg_17_0)

	if not RedPointData:GetIsRedPointOpen(RedPointConst.ACTIVITY_RANGE + arg_17_0) and ActivityTools.GetActivityStatus(arg_17_0) == 1 then
		manager.redPoint:setTip(var_17_0, 1)
	else
		manager.redPoint:setTip(var_17_0, 0)
	end
end

function var_0_0.OnLogin()
	manager.notify:Invoke(ON_LOGIN)
end

function var_0_0.OnLogout()
	PaperCutTool:OnLogout()
	SailGameTools.ShutDown()
end

function var_0_0.ReceivePointReward(arg_20_0)
	local var_20_0 = {
		point_reward_id_list = arg_20_0
	}

	manager.net:SendWithLoadingNew(60054, var_20_0, 60055, var_0_0.OnReceivePointReward)
end

function var_0_0.OnReceivePointReward(arg_21_0, arg_21_1)
	if isSuccess(arg_21_0.result) then
		for iter_21_0, iter_21_1 in ipairs(arg_21_1.point_reward_id_list) do
			local var_21_0 = ActivityPointRewardCfg[iter_21_1]
			local var_21_1 = ActivityTools.GetActivityType(var_21_0.activity_id)

			if ActivityTemplateConst.LIMITED_CALCULATION == var_21_1 then
				LimitedCalculationAction:OnReceivePointReward(var_21_0.activity_id, var_21_0.id)
			elseif ActivityTemplateConst.SUB_SINGLE_MATRIX == var_21_1 then
				ActivityMatrixAction.OnReceivePointReward(var_21_0.activity_id, var_21_0.id)
			elseif ActivityTemplateConst.CHALLENGE_ROGUE_TEAM_SCORE == var_21_1 then
				local var_21_2 = var_21_0.activity_id
				local var_21_3 = ChallengeRogueTeamTools.GetTeamplateIDByActivityID(var_21_2)

				ChallengeRogueTeamData:SetRewardedScoreList(var_21_3, {
					iter_21_1
				})
			end
		end

		getReward2(mergeReward2(arg_21_0.reward_list))
		manager.notify:Invoke(ACTIVITY_REWARD_GET, {
			point_reward_id_list = arg_21_1.point_reward_id_list
		})
		manager.notify:CallUpdateFunc(RECEIVE_POINT_REWARD, arg_21_1.point_reward_id_list)
	else
		ShowTips(arg_21_0.result)
	end
end

function var_0_0.ReceivePointRewardWithCallBack(arg_22_0, arg_22_1)
	local var_22_0 = {
		point_reward_id_list = arg_22_0
	}

	manager.net:SendWithLoadingNew(60054, var_22_0, 60055, function(arg_23_0, arg_23_1)
		var_0_0.OnReceivePointRewardWithCallBack(arg_23_0, arg_23_1, arg_22_1)
	end)
end

function var_0_0.OnReceivePointRewardWithCallBack(arg_24_0, arg_24_1, arg_24_2)
	if isSuccess(arg_24_0.result) then
		for iter_24_0, iter_24_1 in ipairs(arg_24_1.point_reward_id_list) do
			local var_24_0 = ActivityPointRewardCfg[iter_24_1]
			local var_24_1 = ActivityTools.GetActivityType(var_24_0.activity_id)

			if ActivityTemplateConst.LIMITED_CALCULATION == var_24_1 then
				LimitedCalculationAction:OnReceivePointReward(var_24_0.activity_id, var_24_0.id)
			elseif ActivityTemplateConst.SUB_SINGLE_MATRIX == var_24_1 then
				ActivityMatrixAction.OnReceivePointReward(var_24_0.activity_id, var_24_0.id)
			end
		end

		getReward2(mergeReward2(arg_24_0.reward_list), {
			ItemConst.ITEM_TYPE.HERO
		})
		manager.notify:Invoke(ACTIVITY_REWARD_GET, {
			point_reward_id_list = arg_24_1.point_reward_id_list
		})
		manager.notify:CallUpdateFunc(RECEIVE_POINT_REWARD, arg_24_1.point_reward_id_list)

		if arg_24_2 then
			arg_24_2(arg_24_1.point_reward_id_list)
		end
	else
		ShowTips(arg_24_0.result)
	end
end

function var_0_0.GetBonus(arg_25_0)
	local var_25_0 = {
		point_reward_id_list = arg_25_0
	}

	manager.net:SendWithLoadingNew(60054, var_25_0, 60055, var_0_0.OnGetBonusCallback)
end

function var_0_0.OnGetBonusCallback(arg_26_0, arg_26_1)
	if isSuccess(arg_26_0.result) then
		getReward2(mergeReward2(arg_26_0.reward_list))
		manager.notify:Invoke(ACTIVITY_REWARD_GET, {
			point_reward_id_list = arg_26_1.point_reward_id_list
		})
	else
		ShowTips(GetTips(arg_26_0.result))
	end
end

return var_0_0
