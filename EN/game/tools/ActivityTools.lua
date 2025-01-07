local var_0_0 = {}
local var_0_1 = {}

function var_0_0.GetCurrentAdvInfo()
	local var_1_0 = {}

	for iter_1_0, iter_1_1 in ipairs(MainAdvinfoCfg.all) do
		local var_1_1 = MainAdvinfoCfg[iter_1_1]

		if ActivityTools.IsValidAdv(var_1_1.id) then
			table.insert(var_1_0, {
				id = var_1_1.id,
				image = getSpriteWithoutAtlas("I18NImg/ZH_CN/Banner/" .. (var_1_1.picture or "activity1"))
			})
		end
	end

	table.sort(var_1_0, function(arg_2_0, arg_2_1)
		local var_2_0 = MainAdvinfoCfg[arg_2_0.id].order
		local var_2_1 = MainAdvinfoCfg[arg_2_1.id].order

		if var_2_0 == var_2_1 then
			return arg_2_0.id < arg_2_1.id
		else
			return var_2_0 < var_2_1
		end
	end)

	return var_1_0
end

function var_0_0.IsValidAdv(arg_3_0)
	local var_3_0 = MainAdvinfoCfg[arg_3_0]
	local var_3_1 = var_3_0.activityId

	if var_3_0.hide_condition and #var_3_0.hide_condition > 0 then
		local var_3_2 = true

		for iter_3_0, iter_3_1 in ipairs(var_3_0.hide_condition) do
			if not IsConditionAchieved(iter_3_1) then
				var_3_2 = false

				break
			end
		end

		if var_3_2 then
			return false
		end
	end

	if var_3_1 and var_3_1 ~= 0 then
		local var_3_3 = ActivityData:GetActivityData(var_3_1)

		return var_3_3 and var_3_3:IsActivitying() or false
	else
		local var_3_4 = var_3_0.time[1]

		if not var_3_4 or #var_3_4[1] < 3 or #var_3_4[2] < 3 then
			return false
		end

		local var_3_5 = var_3_0.time[2]

		if not var_3_5 or #var_3_5[1] < 3 or #var_3_5[2] < 3 then
			return false
		end

		local var_3_6 = TimeMgr.GetInstance():parseTimeFromConfig(var_3_0.time[1])
		local var_3_7 = TimeMgr.GetInstance():parseTimeFromConfig(var_3_0.time[2])
		local var_3_8 = TimeMgr.GetInstance():GetServerTime()

		return var_3_8 < var_3_7 and var_3_6 <= var_3_8
	end
end

function var_0_0.ClickAdv(arg_4_0)
	local var_4_0 = MainAdvinfoCfg[arg_4_0.id]

	if var_4_0.type == 1 then
		JumpTools.JumpToPage2(var_4_0.parameter)
	elseif var_4_0.type == 2 then
		Application.OpenURL(var_4_0.parameter[1])
	elseif var_4_0.type == 3 then
		OverseaH5GameAction.EnterGame(1)
	end
end

function var_0_0.GetActivityType(arg_5_0)
	local var_5_0 = ActivityCfg[arg_5_0]

	if var_5_0 then
		return var_5_0.activity_template
	end

	return ActivityData:GetActivityData(arg_5_0).template
end

function var_0_0.GetActivityTheme(arg_6_0)
	local var_6_0 = ActivityCfg[arg_6_0]

	if var_6_0 then
		return var_6_0.activity_theme
	end

	return ActivityData:GetActivityData(arg_6_0).theme
end

function var_0_0.JumpToSubmodulePage(arg_7_0)
	local var_7_0 = var_0_0.GetActivityType(arg_7_0)
	local var_7_1 = var_0_0.GetActivityTheme(arg_7_0)
	local var_7_2 = var_0_0.GetOriginActivityTheme(var_7_1)
	local var_7_3 = var_0_0.GetOriginActivityID(arg_7_0)

	if ActivityTemplateConst.STORY == var_7_0 then
		if var_7_2 == ActivityConst.THEME.HELLA then
			JumpTools.OpenPageByJump("/storyStageActivity", {
				theme = var_7_1
			})
		elseif var_7_2 == ActivityConst.THEME.SUMMER then
			JumpTools.OpenPageByJump("/summerStoryMainRemastered")
		elseif var_7_2 == ActivityConst.THEME.FACTORY then
			JumpTools.Jump2SubPlot(6010004)
		elseif var_7_3 == ActivityConst.TYR_SUB_PLOT then
			JumpTools.Jump2SubPlot(6010006)
		end
	elseif ActivityTemplateConst.STORY_STAGE == var_7_0 then
		if var_7_3 == ActivityConst.THIRD_VOLUME_PART_2_SUB_PLOT then
			ActivityStoryAction.UpdateRedPoint(arg_7_0, 0)

			local var_7_4 = ActivityStoryChapterCfg.get_id_list_by_activity_id[arg_7_0][1]

			JumpTools.OpenPageByJump("/activityAthenaStoryStage", {
				theme = var_7_2,
				chapterID = var_7_4
			})
		else
			print("未知的剧情活动" .. arg_7_0)
			ActivityStoryAction.UpdateRedPoint(arg_7_0, 0)

			local var_7_5 = ActivityStoryChapterCfg.get_id_list_by_activity_id[arg_7_0][1]

			JumpTools.OpenPageByJump("/activityStoryStageBase", {
				theme = var_7_2,
				chapterID = var_7_5
			})
		end
	elseif ActivityTemplateConst.DEMON == var_7_0 then
		if var_7_2 == ActivityConst.THEME.VOLUME_DOWN then
			JumpTools.OpenPageByJump("/volumeDemonChallengeMain", {
				activityID = arg_7_0
			})
		elseif var_7_2 == ActivityConst.THEME.DREAM then
			JumpTools.OpenPageByJump("/dreamDemonChallengeMain", {
				activityID = arg_7_0
			})
		elseif var_7_2 == ActivityConst.THEME.HELLA then
			JumpTools.OpenPageByJump("/demonChallengeMain", {
				activityID = arg_7_0
			})
		elseif var_7_2 == ActivityConst.THEME.ACTIVITY_2_2 then
			JumpTools.OpenPageByJump("/xuHeng3rddreamDemonChallengeMain", {
				activityID = arg_7_0
			})
		end
	elseif ActivityTemplateConst.NEW_DEMON == var_7_0 then
		JumpTools.OpenPageByJump("/newDemonChallengeMain", {
			activityID = arg_7_0
		})
	elseif ActivityConst.SUBMODULE_TYPE.CHESS == var_7_0 then
		JumpTools.OpenPageByJump("/activityChessView", {
			activityID = arg_7_0
		})
	elseif ActivityTemplateConst.TALENT_TREE == var_7_0 then
		JumpTools.OpenPageByJump("/talentTree", {
			activityID = arg_7_0
		})
	elseif ActivityTemplateConst.BATTLE_FIRST_PASS == var_7_0 then
		JumpTools.OpenPageByJump("/battleFirstPass", {
			activityID = arg_7_0
		})
	elseif var_7_0 == ActivityTemplateConst.HERO_TRIAL then
		if var_7_2 == ActivityConst.THEME.HELLA then
			JumpTools.OpenPageByJump("/hellaHeroTrialActivity", {
				activityID = arg_7_0
			})
		elseif var_7_2 == ActivityConst.THEME.SUMMER then
			JumpTools.OpenPageByJump("/summerHeroTrialActivity", {
				activityID = arg_7_0
			})
		elseif var_7_2 == ActivityConst.THEME.VOLUME or var_7_2 == ActivityConst.THEME.VOLUME_DOWN then
			JumpTools.OpenPageByJump("/thirdVolumeHeroTrial", {
				activityID = arg_7_0
			})
		elseif var_7_2 == ActivityConst.THEME.FACTORY then
			JumpTools.OpenPageByJump("/factoryHeroTrial", {
				activityID = arg_7_0
			})
		elseif var_7_2 == ActivityConst.THEME.DREAM then
			JumpTools.OpenPageByJump("/dreamHeroTrial", {
				activityID = arg_7_0
			})
		elseif var_7_2 == ActivityConst.THEME.TYR then
			JumpTools.OpenPageByJump("/heroTrialView_1_7", {
				activityID = arg_7_0
			})
		else
			JumpTools.OpenPageByJump("/hellaHeroTrialActivity", {
				activityID = arg_7_0
			})
		end
	elseif var_7_0 == ActivityTemplateConst.SKIN_TRIAL then
		if var_7_2 == ActivityConst.THEME.HELLA then
			JumpTools.OpenPageByJump("/skinTrialActivity", {
				activityID = arg_7_0
			})
		elseif var_7_2 == ActivityConst.THEME.SUMMER then
			JumpTools.OpenPageByJump("/summerSkinTrialActivity", {
				activityID = arg_7_0
			})
		elseif var_7_2 == ActivityConst.THEME.VOLUME or var_7_2 == ActivityConst.THEME.VOLUME_DOWN then
			JumpTools.OpenPageByJump("/volumeSkinTrialActivity", {
				activityID = arg_7_0
			})
		elseif var_7_2 == ActivityConst.THEME.FACTORY then
			JumpTools.OpenPageByJump("/factorySkinTrialActivity", {
				activityID = arg_7_0
			})
		elseif var_7_2 == ActivityConst.THEME.DREAM then
			JumpTools.OpenPageByJump("/dreamSkinTrialActivity", {
				activityID = arg_7_0
			})
		else
			JumpTools.OpenPageByJump("/skinTrialActivity", {
				activityID = arg_7_0
			})
		end
	elseif var_7_0 == ActivityTemplateConst.SLAYER then
		if var_7_2 == ActivityConst.THEME.HELLA then
			JumpTools.OpenPageByJump("/hellaSlayer", {
				slayer_activity_id = arg_7_0
			})
		elseif var_7_2 == ActivityConst.THEME.VOLUME then
			JumpTools.OpenPageByJump("/volumeSlayerMain", {
				playerAnim = true,
				slayer_activity_id = arg_7_0
			})
		elseif var_7_2 == ActivityConst.THEME.TYR then
			JumpTools.OpenPageByJump("/slayerMainView_1_7", {
				playerAnim = true,
				slayer_activity_id = arg_7_0
			})
		end
	elseif var_7_0 == ActivityTemplateConst.PARKOUR then
		if var_7_2 == ActivityConst.THEME.HELLA then
			JumpTools.OpenPageByJump("/hellaParkour", {
				parkour_activity_id = arg_7_0
			})
		end
	elseif var_7_0 == ActivityTemplateConst.SOLO_CHALLENGE then
		if var_7_2 == ActivityConst.THEME.SUMMER then
			JumpTools.OpenPageByJump("/soloChallengeMain", {
				activityID = arg_7_0
			})
		elseif var_7_2 == ActivityConst.THEME.FACTORY then
			JumpTools.OpenPageByJump("/factorySoloChallengeMain", {
				activityID = arg_7_0
			})
		elseif var_7_2 == ActivityConst.THEME.TYR then
			JumpTools.OpenPageByJump("/soloChallengeMainView_1_7", {
				activityID = arg_7_0
			})
		end
	elseif var_7_0 == ActivityTemplateConst.ARTIFACT then
		if var_7_2 == ActivityConst.THEME.SUMMER then
			JumpTools.OpenPageByJump("/artifact", {
				activityID = arg_7_0
			})
		end
	elseif var_7_0 == ActivityTemplateConst.LIMITED_CALCULATION then
		JumpTools.OpenPageByJump("/limitedCalculation", {
			activityID = arg_7_0
		})
	elseif var_7_0 == ActivityTemplateConst.SKADI_LITTLE_GAME then
		JumpTools.OpenPageByJump("/skadiLittleGame", {
			activityID = arg_7_0
		})
	elseif var_7_0 == ActivityTemplateConst.LEVIATHAN_LITTLE_GAME then
		JumpTools.OpenPageByJump("/leviathanLittleGame", {
			activityID = arg_7_0
		})
	elseif var_7_0 == ActivityTemplateConst.FISHING then
		JumpTools.OpenPageByJump("/fishingEnter", {
			activityID = arg_7_0
		})
	elseif var_7_0 == ActivityTemplateConst.SKIN_EXCHANGE then
		JumpTools.OpenPageByJump("/skinExchange", {
			activityID = arg_7_0
		})
	elseif var_7_0 == ActivityTemplateConst.SUMMER_ACTIVITY_PT then
		JumpTools.OpenPageByJump("/activityPt", {
			activityID = arg_7_0
		})
	elseif var_7_0 == ActivityTemplateConst.MAIN_STORY then
		local var_7_6 = ChapterTools.GetChapterByActivityID(arg_7_0)

		BattleFieldData:SetCacheChapterClient(ChapterClientCfg[var_7_6].toggle, getChapterClientCfgByChapterID(var_7_6).id)
		JumpTools.OpenPageByJump("/chapterMapContent", {})
	elseif var_7_0 == ActivityTemplateConst.MOONBO then
		if var_7_2 == ActivityConst.THEME.VOLUME then
			JumpTools.OpenPageByJump("/moonBoView", {
				activityID = arg_7_0
			})
		else
			JumpTools.OpenPageByJump("/moonBoView", {
				activityID = arg_7_0
			})
		end
	elseif var_7_0 == ActivityTemplateConst.ACTIVITY_PUZZLE then
		JumpTools.OpenPageByJump("/puzzleMain", {
			activityID = arg_7_0
		})
	elseif var_7_0 == ActivityTemplateConst.SINGLE_MATRIX then
		if var_7_2 == ActivityConst.THEME.VOLUME then
			JumpTools.OpenPageByJump("/matrixBlank/activityMatrix", {
				playerAnim = true,
				main_matrix_activity_id = arg_7_0
			})
		end
	elseif var_7_0 == ActivityTemplateConst.COWBOY then
		JumpTools.OpenPageByJump("/cowboy", {
			activityID = arg_7_0
		})
	elseif var_7_0 == ActivityTemplateConst.ACTIVITY_RACE then
		if var_7_2 == ActivityConst.THEME.VOLUME_DOWN then
			JumpTools.OpenPageByJump("/activityRaceMain", {
				activityID = arg_7_0,
				rankID = ActivityConst.ACTIVITY_RACE_RANK
			})
		end
	elseif var_7_0 == ActivityTemplateConst.RACE_TRIAL then
		if var_7_2 == ActivityConst.THEME.VOLUME_DOWN then
			JumpTools.OpenPageByJump("/volumeRaceTrialMain", {
				activityID = arg_7_0
			})
		end
	elseif var_7_0 == ActivityTemplateConst.ACTIVITY_MUSIC then
		if var_7_2 == ActivityConst.THEME.VOLUME_DOWN then
			JumpTools.OpenPageByJump("/volumeMusicMain", {
				activity_id = arg_7_0
			})
		elseif var_7_2 == ActivityConst.THEME.VOLUME_DOWN then
			JumpTools.OpenPageByJump("/volumeMusicMain2", {
				activity_id = arg_7_0
			})
		end
	elseif var_7_0 == ActivityTemplateConst.STRATEGY_MATRIX then
		StrategyMatrixAction.GotoStrategyMatrix(arg_7_0, true)
	elseif var_7_0 == ActivityTemplateConst.INFINITY_POOL_TASK then
		if var_7_2 == ActivityConst.THEME.FACTORY then
			JumpTools.OpenPageByJump("/infinityTaskFactory", {
				activityType = OsirisConst.ACTIVITY_TYPE.TASK,
				activityTaskID = ActivityConst.FACTORY_INFINITY_TASK,
				activityInfinityID = ActivityConst.FACTORY_INFINITY_POOL
			})
		end
	elseif var_7_0 == ActivityTemplateConst.SEQUENTIAL_BATTLE then
		if var_7_2 == ActivityConst.THEME.FACTORY then
			JumpTools.OpenPageByJump("/sequentialBattleFactory")
		end
	elseif var_7_0 == ActivityTemplateConst.SURVIVE_SOLO then
		JumpTools.OpenPageByJump("/surviveSolo", {
			activityID = arg_7_0
		})
	elseif var_7_0 == ActivityTemplateConst.MARDUK_SPECIAL then
		JumpTools.OpenPageByJump("/mardukSpecialMain", {
			activityID = arg_7_0
		})
	elseif var_7_0 == ActivityTemplateConst.MARDUK_GAME then
		JumpTools.OpenPageByJump("/towerGameView")
	elseif var_7_0 == ActivityTemplateConst.SPRING_FESTIVAL_RIDDLE then
		JumpTools.OpenPageByJump("/springFestivalRiddleMain")
	elseif var_7_0 == ActivityTemplateConst.SPRING_ANTITHETICAL_COUPLET then
		JumpTools.OpenPageByJump("/antitheticalCouplet", {
			activityID = arg_7_0
		})
	elseif var_7_0 == ActivityTemplateConst.SPRING_CANTEEN then
		JumpTools.GoToCanteen()
	elseif var_7_0 == ActivityTemplateConst.ACTIVITY_WORLD_BOSS then
		JumpTools.OpenPageByJump("/nienWorldBoss")
	elseif var_7_0 == ActivityTemplateConst.PAPER_CUT then
		JumpTools.OpenPageByJump("/paperCutMain", {
			activityID = ActivityConst.PAPER_CUT_GAME
		})
	elseif var_7_0 == ActivityTemplateConst.SPRING_FESTIVAL_GREETING then
		JumpTools.OpenPageByJump("springFestivalGreetingEnvelop")
	elseif var_7_0 == ActivityTemplateConst.FIRE_WORK_MAIN then
		JumpTools.OpenPageByJump("/fireWorkMain")
	elseif var_7_0 == ActivityTemplateConst.VALENTINE_GAME then
		JumpTools.OpenPageByJump("/valentineGameMain", {
			activityID = arg_7_0
		})
	elseif var_7_0 == ActivityTemplateConst.ACTIVITY_AFFIX_SELECT then
		JumpTools.OpenPageByJump("/affixSelectMain", {
			activityID = ActivityConst.ACTIVITY_1_7_AFFIX_SELECT
		})
	elseif var_7_0 == ActivityTemplateConst.ACTIVITY_CULTIVATE_HERO then
		JumpTools.OpenPageByJump("/activityCultivateHeroMain", {
			activityID = ActivityConst.ACTIVITY_CULTIVATE_HERO
		})
	elseif var_7_0 == ActivityTemplateConst.ACTIVITY_MEMORY then
		JumpTools.OpenPageByJump("/activityMemoryEnter", {
			activityID = arg_7_0
		})
	elseif var_7_0 == ActivityTemplateConst.ACTIVITY_QUIZ then
		JumpTools.OpenPageByJump("/activityQuizEnter", {
			activityID = arg_7_0
		})
	elseif var_7_0 == ActivityTemplateConst.ACTIVITY_INDIA_NIAN then
		JumpTools.OpenPageByJump("/indiaNianMain")
	elseif var_7_0 == ActivityTemplateConst.ACTIVITY_PUSH_SNOW_BALL then
		JumpTools.OpenPageByJump("/pushSnowBallMain")
	elseif var_7_0 == ActivityTemplateConst.SPRING_FESTIVAL_COMBINE_GAME then
		JumpTools.OpenPageByJump("/CombineGameMainView")
	elseif var_7_0 == ActivityTemplateConst.ACTIVITY_SPRING_WELFARE then
		JumpTools.OpenPageByJump("/springWelfarePrayTree")
	end
end

function var_0_0.GetRedPointKey(arg_8_0)
	local var_8_0 = var_0_0.GetActivityType(arg_8_0)

	if ActivityTemplateConst.DEMON == var_8_0 then
		return RedPointConst.DEMON_CHALLENGE
	elseif ActivityTemplateConst.NEW_DEMON == var_8_0 then
		return RedPointConst.NEW_DEMON_CHALLENGE
	elseif ActivityTemplateConst.TALENT_TREE == var_8_0 then
		return RedPointConst.TALENT_TREE
	elseif ActivityTemplateConst.BATTLE_FIRST_PASS == var_8_0 then
		return RedPointConst.BATTLE_FIRST_PASS
	elseif ActivityTemplateConst.HERO_TRIAL == var_8_0 then
		return RedPointConst.HERO_TRIAL .. "_"
	elseif ActivityTemplateConst.SKIN_TRIAL == var_8_0 then
		return RedPointConst.SKIN_TRIAL .. "_"
	elseif ActivityTemplateConst.SLAYER == var_8_0 then
		return RedPointConst.SLAYER .. "_"
	elseif ActivityTemplateConst.STORY == var_8_0 then
		return RedPointConst.ACTIVITY_STORY_STAGE
	elseif ActivityTemplateConst.STORY_STAGE == var_8_0 then
		return RedPointConst.ACTIVITY_STORY_STAGE
	elseif ActivityTemplateConst.SUB_PLOT == var_8_0 then
		return RedPointConst.ACTIVITY_STORY_STAGE
	elseif ActivityTemplateConst.PARKOUR == var_8_0 then
		return RedPointConst.PARKOUR .. "_"
	elseif ActivityTemplateConst.CHESS == var_8_0 then
		return RedPointConst.WAR_CHESS .. "_"
	elseif ActivityTemplateConst.MAIN_ACTIVITY == var_8_0 then
		return RedPointConst.MAIN_ACTIVITY
	elseif ActivityTemplateConst.SOLO_CHALLENGE == var_8_0 then
		return RedPointConst.SOLO_CHALLENGE .. "_"
	elseif ActivityTemplateConst.LIMITED_CALCULATION == var_8_0 then
		return RedPointConst.LIMITED_CALCULATION
	elseif ActivityTemplateConst.ARTIFACT == var_8_0 then
		return RedPointConst.ARTIFACT .. "_"
	elseif ActivityTemplateConst.SKADI_LITTLE_GAME == var_8_0 then
		return RedPointConst.SKADI_LITTLE_GAME .. "_"
	elseif ActivityTemplateConst.LEVIATHAN_LITTLE_GAME == var_8_0 then
		return RedPointConst.LEVIATHAN_LITTLE_GAME .. "_"
	elseif ActivityTemplateConst.FISHING == var_8_0 then
		return RedPointConst.FISHING .. "_"
	elseif ActivityTemplateConst.SUMMER_ACTIVITY_PT == var_8_0 then
		return RedPointConst.SUMMER_ACTIVITY_PT_OPEN .. "_"
	elseif ActivityTemplateConst.SKIN_EXCHANGE == var_8_0 then
		return RedPointConst.ACTIVITY_SKIN_EXCHANGE .. "_"
	elseif ActivityTemplateConst.MOONBO == var_8_0 then
		return RedPointConst.MOONBO .. "_"
	elseif ActivityTemplateConst.ACTIVITY_PUZZLE == var_8_0 then
		return RedPointConst.ACTIVITY_PUZZLE .. "_"
	elseif var_8_0 == ActivityTemplateConst.SINGLE_MATRIX then
		return RedPointConst.ACTIVITY_MATRIX .. "_"
	elseif var_8_0 == ActivityTemplateConst.COWBOY then
		return RedPointConst.COWBOY .. "_"
	elseif var_8_0 == ActivityTemplateConst.ACTIVITY_RACE then
		return RedPointConst.ACTIVITY_RACE .. "_"
	elseif var_8_0 == ActivityTemplateConst.RACE_TRIAL then
		return RedPointConst.ACTIVITY_RACE_TRIAL .. "_"
	elseif var_8_0 == ActivityTemplateConst.STRATEGY_MATRIX then
		return RedPointConst.STRATEGY_MATRIX .. "_"
	elseif var_8_0 == ActivityTemplateConst.ACTIVITY_MUSIC then
		return RedPointConst.MUSIC .. "_"
	elseif var_8_0 == ActivityTemplateConst.ACTIVITY_ZUMA_ENTER then
		return RedPointConst.ZUMA
	elseif var_8_0 == ActivityTemplateConst.GUILD_ACTIVITY then
		return RedPointConst.GUILD_ACTIVITY .. "_"
	elseif var_8_0 == ActivityTemplateConst.GUILD_ACTIVITY_SP then
		return RedPointConst.GUILD_ACTIVITY_SP .. "_"
	elseif var_8_0 == ActivityTemplateConst.INFINITY_POOL_TASK then
		return RedPointConst.INFINITY_POOL_TASK .. "_"
	elseif var_8_0 == ActivityTemplateConst.SEQUENTIAL_BATTLE then
		return RedPointConst.SEQUENTIAL_BATTLE .. "_"
	elseif var_8_0 == ActivityTemplateConst.MARDUK_SPECIAL then
		return RedPointConst.MARDUK_SPECIAL .. "_"
	elseif var_8_0 == ActivityTemplateConst.SURVIVE_SOLO then
		return RedPointConst.SOLO_SURVIVE .. "_"
	elseif var_8_0 == ActivityTemplateConst.ACTIVITY_WORLD_BOSS then
		return RedPointConst.ACTIVITY_WORLD_BOSS .. "_"
	elseif var_8_0 == ActivityTemplateConst.MARDUK_GAME then
		return RedPointConst.MARDUK_TOWERGAME .. "_"
	elseif var_8_0 == ActivityTemplateConst.SPRING_FESTIVAL_GREETING then
		return RedPointConst.SPRING_FESTIVAL_GREETING .. "_"
	elseif var_8_0 == ActivityTemplateConst.SPRING_FESTIVAL_RIDDLE then
		return RedPointConst.SPRING_FESTIVAL_RIDDLE .. "_"
	elseif var_8_0 == ActivityTemplateConst.SPRING_ANTITHETICAL_COUPLET then
		return RedPointConst.ANTITHETICAL_COUPLET .. "_"
	elseif var_8_0 == ActivityTemplateConst.PAPER_CUT then
		return RedPointConst.PAPER_CUT .. "_"
	elseif var_8_0 == ActivityTemplateConst.FIRE_WORK_MAIN then
		return RedPointConst.FIRE_WORK_MAIN .. "_"
	elseif var_8_0 == ActivityTemplateConst.SPRING_CANTEEN then
		return RedPointConst.CANTEEN .. "_"
	elseif var_8_0 == ActivityTemplateConst.TRAVEL_SKULD then
		return RedPointConst.TRAVEL_SKULD_ACTIVITY
	elseif var_8_0 == ActivityTemplateConst.VALENTINE_GAME or var_8_0 == ActivityTemplateConst.INDIA_VALENTINE_GAME_V2 then
		return RedPointConst.VALENTINE_GAME .. "_"
	elseif var_8_0 == ActivityTemplateConst.ACTIVITY_AFFIX_SELECT then
		return RedPointConst.AFFIX_SELECT .. "_"
	elseif var_8_0 == ActivityTemplateConst.ACTIVITY_CULTIVATE_HERO then
		return RedPointConst.CULTIVATE_HERO .. "_"
	elseif var_8_0 == ActivityTemplateConst.ACTIVITY_2_0_SEAL then
		return RedPointConst.XH1ST_SEAL .. "_"
	elseif var_8_0 == ActivityTemplateConst.ACTIVITY_PT_2 then
		return RedPointConst.ACTIVITY_PT_2 .. "_"
	elseif var_8_0 == ActivityTemplateConst.ACTIVITY_SET then
		return RedPointConst.ACTIVITY_SET .. "_"
	elseif var_8_0 == ActivityTemplateConst.CHESS_ACTIVITY_CHINESE_ZONE then
		return RedPointConst.WARCHESS_CHINESE .. "_"
	elseif var_8_0 == ActivityTemplateConst.PUZZLE_NEW then
		return RedPointConst.PUZZLE_NEW .. "_"
	elseif var_8_0 == ActivityTemplateConst.LIANLIANKAN then
		return RedPointConst.LIANLIANKAN .. "_"
	elseif var_8_0 == ActivityTemplateConst.ACTIVITY_2_2_WATER then
		return RedPointConst.ACTIVITY_WATER .. "_"
	elseif var_8_0 == ActivityTemplateConst.ACTIVITY_FLIP_CARD then
		return RedPointConst.ACTIVITY_2_2_FLIP_CARD .. "_"
	elseif var_8_0 == ActivityTemplateConst.SAIL_GAME then
		return RedPointConst.SAIL_GAME .. "_"
	elseif var_8_0 == ActivityTemplateConst.SEVEN_DAY_SIGN_SKIN then
		return RedPointConst.SEVEN_DAY_SIGN_SKIN .. "_"
	elseif var_8_0 == ActivityTemplateConst.SEVEN_DAY_SIGN_SKIN_LUWU then
		return RedPointConst.SEVEN_DAY_SIGN_SKIN .. "_"
	elseif var_8_0 == ActivityTemplateConst.SEVEN_DAY_SIGN_SKIN_WORLD_LINE then
		return RedPointConst.SEVEN_DAY_SIGN_SKIN .. "_"
	elseif var_8_0 == ActivityTemplateConst.SEVEN_DAY_SIGN_SKIN_NEW then
		return RedPointConst.SEVEN_DAY_SIGN_SKIN .. "_"
	elseif var_8_0 == ActivityTemplateConst.STRONGHOLD then
		return RedPointConst.STRONGHOLD .. "_"
	elseif var_8_0 == ActivityTemplateConst.ACTIVITY_SKIN_DRAW then
		return RedPointConst.ACTIVITY_DRAW .. "_"
	elseif var_8_0 == ActivityTemplateConst.TANGRAM_PUZZLE then
		return RedPointConst.TANGRAM_PUZZLE .. "_"
	elseif var_8_0 == ActivityTemplateConst.MOON_CAKE then
		return RedPointConst.MOON_CAKE .. "_"
	elseif var_8_0 == ActivityTemplateConst.JAPAN_SOLO_HEART_DEMON then
		return RedPointConst.SOLO_HEART_DEMON_ACTIVITY .. "_"
	elseif var_8_0 == ActivityTemplateConst.ACTIVITY_INVITE then
		return RedPointConst.INVITE_MAIN .. "_"
	elseif var_8_0 == ActivityTemplateConst.DESTROY_BOX_GAME then
		return RedPointConst.DESTROY_BOX_GAME .. "_"
	elseif var_8_0 == ActivityTemplateConst.HERO_CLUE then
		return RedPointConst.HERO_CLUE .. "_"
	elseif var_8_0 == ActivityTemplateConst.NEW_WARCHESS then
		return RedPointConst.NEW_WARCHESS .. "_"
	elseif var_8_0 == ActivityTemplateConst.KAGUTSUCHI_ACTIVITY_PT_SCROLL then
		return RedPointConst.ACTIVITY_PT_SCROLL .. "_"
	elseif var_8_0 == ActivityTemplateConst.ACTIVITY_ATTRIBUTE_ARENA then
		return RedPointConst.ACTIVITY_ATTRIBUTE_ARENA .. "_"
	elseif var_8_0 == ActivityTemplateConst.ACTIVITY_PUSH_SNOW_BALL then
		return RedPointConst.ACTIVITY_PUSH_SNOW_BALL .. "_"
	elseif var_8_0 == ActivityTemplateConst.SPRING_FESTIVAL_COMBINE_GAME then
		return RedPointConst.ACTIVITY_SPRING_COMBINE_GAME .. "_"
	elseif var_8_0 == ActivityTemplateConst.ACTIVITY_PUSH_SNOW_BALL_SOLO then
		return RedPointConst.ACTIVITY_PUSH_SNOW_BALL_SOLO .. "_"
	elseif var_8_0 == ActivityTemplateConst.ACTIVITY_PUSH_SNOW_BALL_TEAM then
		return RedPointConst.ACTIVITY_PUSH_SNOW_BALL_TEAM .. "_"
	elseif var_8_0 == ActivityTemplateConst.ACTIVITY_INDIA_NIAN then
		return RedPointConst.ACTIVITY_INDIA_NIAN .. "_"
	elseif var_8_0 == ActivityTemplateConst.ACTIVITY_MEMORY then
		return RedPointConst.ACTIVITY_MEMORY .. "_"
	elseif var_8_0 == ActivityTemplateConst.ACTIVITY_QUIZ then
		return RedPointConst.ACTIVITY_QUIZ .. "_"
	elseif var_8_0 == ActivityTemplateConst.ACTIVITY_PUSH_BOX then
		return RedPointConst.ACTIVITY_PUSH_BOX .. "_"
	elseif var_8_0 == ActivityTemplateConst.HERO_LETTER then
		return RedPointConst.ACTIVITY_HERO_LETTER .. "_"
	elseif var_8_0 == ActivityTemplateConst.ACTIVITY_ACCUMULATIVE then
		return RedPointConst.ACTIVITY_ACCUMULATIVE .. "_"
	elseif var_8_0 == ActivityTemplateConst.ACTIVITY_REFORGE then
		return RedPointConst.ACTIVITY_REFORGE
	elseif var_8_0 == ActivityTemplateConst.ACTIVITY_WHACK_MOLE then
		return RedPointConst.WHACK_MOLE .. "_"
	elseif var_8_0 == ActivityTemplateConst.ACTIVITY_MONSTER_COSPLAY then
		return RedPointConst.MONSTER_COSPLAY_MAIN .. "_"
	elseif var_8_0 == ActivityTemplateConst.ACTIVITY_TANGRAM_GAME then
		return RedPointConst.ACTIVITY_3_5_TANGRAM_GAME .. "_"
	elseif var_8_0 == ActivityTemplateConst.ACTIVITY_KALI then
		return RedPointConst.ACTIVITY_KALI .. "_"
	elseif var_8_0 == ActivityTemplateConst.ACTIVITY_AREA_BATTLE then
		return RedPointConst.ACTIVITY_AREA_BATTLE .. "_"
	elseif var_8_0 == ActivityTemplateConst.ACTIVITY_USE_DUNDUN then
		return RedPointConst.ACTIVITY_USE_DUNDUN
	elseif var_8_0 == ActivityTemplateConst.ACTIVITY_TETRIS_GAME then
		return RedPointConst.ACTIVITY_TETIRS_GAME .. "_"
	elseif var_8_0 == ActivityTemplateConst.ACTIVITY_DODGE_BARRAGE then
		return RedPointConst.ACTIVITY_DODGE_BARRAGE .. "_"
	else
		return RedPointConst.ACTIVITY_COMMON .. "_"
	end
end

function var_0_0.GetMainActivityId(arg_9_0)
	local var_9_0 = ActivityData:GetAllActivityData()

	for iter_9_0, iter_9_1 in pairs(var_9_0) do
		if iter_9_1.subActivityIdList then
			for iter_9_2, iter_9_3 in ipairs(iter_9_1.subActivityIdList) do
				if iter_9_3 == arg_9_0 then
					return iter_9_1.id
				end
			end
		end
	end
end

function var_0_0.ActivityOpenCheck(arg_10_0)
	local var_10_0 = ActivityData:GetActivityData(arg_10_0)

	if manager.time:GetServerTime() < var_10_0.startTime then
		local var_10_1 = GetTips("OPEN_TIME")

		ShowTips(string.format(var_10_1, manager.time:GetLostTimeStr(var_10_0.startTime)))

		return false
	end

	if manager.time:GetServerTime() >= var_10_0.stopTime then
		ShowTips("TIME_OVER")

		return false
	end

	return true
end

function var_0_0.ActivityOpenCheckByMessageBox(arg_11_0, arg_11_1, arg_11_2)
	local var_11_0 = ActivityData:GetActivityData(arg_11_0)

	if manager.time:GetServerTime() < var_11_0.startTime then
		local var_11_1 = GetTips("OPEN_TIME")

		ShowMessageBox({
			ButtonType = "SingleBtn",
			title = GetTips("PROMPT"),
			content = string.format(var_11_1, manager.time:GetLostTimeStr(var_11_0.start_time)),
			OkCallback = arg_11_1
		})

		return false
	end

	if manager.time:GetServerTime() >= var_11_0.stopTime then
		ShowMessageBox({
			ButtonType = "SingleBtn",
			title = GetTips("PROMPT"),
			content = GetTips("TIME_OVER"),
			OkCallback = arg_11_1
		})

		return false
	end

	if arg_11_2 then
		arg_11_2()
	end

	return true
end

function var_0_0.GetActivityLostTimeStrWith2Unit(arg_12_0)
	local var_12_0, var_12_1 = ActivityData:GetActivityTime(arg_12_0)

	return manager.time:GetLostTimeStrWith2Unit(var_12_1)
end

function var_0_0.GetUIName(arg_13_0)
	arg_13_0 = var_0_0.GetOriginActivityID(arg_13_0)

	if ActivityConst.HELLA_TOWER_DEFENCE == arg_13_0 then
		return "UI/VersionUI/HellaUI/HellabatteryUI"
	elseif ActivityConst.HELLA_CHESS == arg_13_0 then
		return "UI/VersionUI/HellaUI/HellaWarChessUI"
	else
		error("未绑定对应预制体" .. arg_13_0)
	end
end

function var_0_0.GetGameHelpKey(arg_14_0)
	arg_14_0 = var_0_0.GetOriginActivityID(arg_14_0)

	if ActivityConst.HELLA_TOWER_DEFENCE == arg_14_0 then
		return "ACTIVITY_HELLA_TOWER_DESCRIPE"
	elseif ActivityConst.SIKADI_GAME == arg_14_0 then
		return "ACTIVITY_CROSSWAVE_DESCRIPE"
	elseif ActivityConst.LEVIATHAN_GAME == arg_14_0 then
		return "ACTIVITY_BUBBLES_DESCRIPE"
	end

	return ""
end

function var_0_0.GetSectionType(arg_15_0)
	arg_15_0 = var_0_0.GetOriginActivityID(arg_15_0)

	if ActivityConst.HELLA_TOWER_DEFENCE == arg_15_0 then
		return BattleConst.STAGE_TYPE_NEW.TOWER_DEFENCE
	else
		error("未绑定战斗类型" .. arg_15_0)
	end
end

function var_0_0.GetStoryActivityIDList(arg_16_0)
	local var_16_0 = {}

	for iter_16_0, iter_16_1 in ipairs(ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.STORY_STAGE]) do
		if ActivityCfg[iter_16_1].activity_theme == arg_16_0 then
			table.insert(var_16_0, iter_16_1)
		end
	end

	return var_16_0
end

function var_0_0.IsUnlockActivity(arg_17_0)
	local var_17_0 = ActivityCfg[arg_17_0].unlock_condition

	if type(var_17_0) ~= "table" then
		return true
	end

	if var_17_0[1] == 100 then
		local var_17_1 = var_17_0[2][1]
		local var_17_2 = var_17_0[2][2]
		local var_17_3 = StoryStageActivityData:GetStageData(var_17_1)

		if var_17_3[var_17_2] == nil or var_17_3[var_17_2].clear_times <= 0 then
			return false
		else
			return true
		end
	elseif var_17_0[1] == 101 then
		local var_17_4 = var_17_0[2][1]

		return ChapterTools.IsClearChapter(var_17_4)
	elseif var_17_0[1] == 102 then
		local var_17_5 = var_17_0[2][2]

		return ChapterTools.IsClearStage(var_17_5)
	end

	return true
end

function var_0_0.GetActivityChessProgress(arg_18_0)
	local var_18_0 = 0
	local var_18_1 = 0

	for iter_18_0, iter_18_1 in pairs(WarchessLevelCfg.get_id_list_by_tag[arg_18_0]) do
		var_18_1 = var_18_1 + ChessTools.GetChapterProgress(iter_18_1)
		var_18_0 = var_18_0 + 1
	end

	return var_18_1, var_18_0
end

function var_0_0.GetActivityIsOpenWithTip(arg_19_0, arg_19_1)
	if arg_19_1 == nil then
		arg_19_1 = true
	end

	if ActivityData:GetActivityIsOpen(arg_19_0) then
		return true
	elseif arg_19_1 then
		local var_19_0 = ActivityData:GetActivityData(arg_19_0)
		local var_19_1 = manager.time:GetServerTime()

		if var_19_0 and var_19_1 < var_19_0.startTime then
			ShowTips(string.format(GetTips("OPEN_TIME"), manager.time:GetLostTimeStr(var_19_0.startTime)))
		else
			ShowTips("TIME_OVER")
		end

		return false
	else
		return false
	end
end

function var_0_0.GetActivityStatus(arg_20_0)
	if ActivityData:GetActivityIsOpen(arg_20_0) then
		return ActivityConst.ACTIVITY_STATE.ACTIVING
	else
		local var_20_0 = ActivityData:GetActivityData(arg_20_0)
		local var_20_1 = manager.time:GetServerTime()

		if var_20_0 and var_20_1 < var_20_0.startTime then
			return ActivityConst.ACTIVITY_STATE.WAIT
		else
			return ActivityConst.ACTIVITY_STATE.OVER
		end
	end
end

function var_0_0.GetActivityStatusWithTips(arg_21_0)
	if ActivityData:GetActivityIsOpen(arg_21_0) then
		return 1
	else
		local var_21_0 = ActivityData:GetActivityData(arg_21_0)
		local var_21_1 = manager.time:GetServerTime()

		if var_21_0 and var_21_1 < var_21_0.startTime then
			return 0, GetTipsF("OPEN_TIME", manager.time:GetLostTimeStr(var_21_0.startTime))
		else
			return 2, GetTips("TIME_OVER")
		end
	end
end

function var_0_0.GetTogglePanelView(arg_22_0)
	local var_22_0 = var_0_0.GetActivityTheme(arg_22_0)

	for iter_22_0, iter_22_1 in ipairs(ActivityToggleCfg.get_id_list_by_activity_theme[var_22_0]) do
		if ActivityToggleCfg[iter_22_1].activity_id == arg_22_0 and (ActivityToggleCfg[iter_22_1].class_name ~= nil or true) then
			return ActivityToggleCfg[iter_22_1].class_name
		end
	end
end

function var_0_0.JumpBackToActivityMainViewByActivityID(arg_23_0)
	local var_23_0 = ActivityCfg[arg_23_0].activity_theme
	local var_23_1, var_23_2 = var_0_0.GetActivityMainRouteByTheme(var_23_0, arg_23_0)

	JumpTools.OpenPageUntilLoaded(var_23_1, var_23_2)
end

function var_0_0.JumpBackToActivityMainViewByTheme(arg_24_0)
	local var_24_0, var_24_1 = var_0_0.GetActivityMainRouteByTheme(arg_24_0)

	JumpTools.OpenPageUntilLoaded(var_24_0, var_24_1)
end

function var_0_0.GetActivityMainRouteByTheme(arg_25_0, arg_25_1)
	local var_25_0 = ActivityEntraceCfg.get_id_list_by_theme[arg_25_0][1]
	local var_25_1 = ActivityEntraceCfg[var_25_0].jump_system
	local var_25_2 = var_25_1[2]

	arg_25_1 = arg_25_1 or ActivityVersionData:GetSelectActivityID(var_25_2)

	local var_25_3 = SystemLinkCfg[var_25_1[1]].link
	local var_25_4 = {
		activityID = var_25_2,
		subActivityID = arg_25_1
	}

	return var_25_3, var_25_4
end

function var_0_0.GetReprintActivityTheme(arg_26_0)
	return var_0_0.GetReprintActivityID(arg_26_0)
end

function var_0_0.GetReprintActivityID(arg_27_0)
	local var_27_0 = ActivityVersionData:GetReprintField()

	if var_27_0 == "" then
		return arg_27_0
	end

	local var_27_1 = ActivityReprintCfg[arg_27_0]

	if var_27_1 and var_27_1[var_27_0] then
		return var_27_1[var_27_0]
	else
		return arg_27_0
	end
end

function var_0_0.GetOriginActivityTheme(arg_28_0)
	return ActivityReprintExCfg[arg_28_0] and ActivityReprintExCfg[arg_28_0].originActivityID or arg_28_0
end

function var_0_0.GetOriginActivityID(arg_29_0)
	return ActivityReprintExCfg[arg_29_0] and ActivityReprintExCfg[arg_29_0].originActivityID or arg_29_0
end

function var_0_0.GetParentActivityID(arg_30_0)
	local var_30_0 = ActivityCfg[arg_30_0].activity_theme

	for iter_30_0, iter_30_1 in ipairs(ActivityCfg.get_id_list_by_activity_theme[var_30_0]) do
		if table.keyof(ActivityCfg[iter_30_1].sub_activity_list, arg_30_0) then
			return iter_30_1
		end
	end
end

function var_0_0.GetAllSubActivityByTemplate(arg_31_0, arg_31_1)
	local var_31_0 = ActivityCfg[arg_31_0]
	local var_31_1 = {}

	for iter_31_0, iter_31_1 in ipairs(var_31_0.sub_activity_list) do
		if ActivityCfg[iter_31_1].activity_template == arg_31_1 then
			table.insert(var_31_1, iter_31_1)
		end
	end

	return var_31_1
end

function var_0_0.GetAllTaskSubActivityID(arg_32_0)
	return var_0_0.GetAllSubActivityByTemplate(arg_32_0, ActivityTemplateConst.TASK)
end

function var_0_0.CreateActivityTimer(arg_33_0, arg_33_1, arg_33_2, arg_33_3)
	if var_0_1[arg_33_0] then
		var_0_1[arg_33_0]:Stop()

		var_0_1[arg_33_0] = nil
	end

	arg_33_2 = arg_33_2 or 1
	arg_33_3 = arg_33_3 or -1
	var_0_1[arg_33_0] = Timer.New(function()
		arg_33_1()
	end, arg_33_2, arg_33_3)

	var_0_1[arg_33_0]:Start()
end

function var_0_0.ClearActivityTimer(arg_35_0)
	if var_0_1[arg_35_0] then
		var_0_1[arg_35_0]:Stop()

		var_0_1[arg_35_0] = nil
	end
end

function var_0_0.ClearAllActivityTimer()
	for iter_36_0, iter_36_1 in pairs(var_0_1) do
		iter_36_1:Stop()
	end

	var_0_1 = {}
end

function var_0_0.GetActivityIsRootOrSub(arg_37_0)
	if not arg_37_0 then
		return false
	end

	if not ActivityTools.activityRootMap then
		ActivityTools.activityRootMap = {
			root = {},
			subRoot = {}
		}

		for iter_37_0, iter_37_1 in ipairs(ActivityEntraceCfg.all) do
			local var_37_0 = ActivityCfg[iter_37_1]

			if var_37_0 then
				local var_37_1 = var_37_0.activity_template
				local var_37_2 = var_37_0.activity_theme

				if var_37_1 == ActivityTemplateConst.MAIN_ACTIVITY then
					local var_37_3 = ActivityToggleCfg.get_id_list_by_activity_theme[var_37_2] or {}
					local var_37_4 = {}

					for iter_37_2, iter_37_3 in ipairs(var_37_3) do
						var_37_4[ActivityToggleCfg[iter_37_3].activity_id] = true
					end

					ActivityTools.activityRootMap.root[iter_37_1] = true

					local var_37_5 = var_37_0.sub_activity_list or {}

					for iter_37_4, iter_37_5 in ipairs(var_37_5) do
						if var_37_4[iter_37_5] then
							ActivityTools.activityRootMap.subRoot[iter_37_5] = iter_37_1
						end
					end
				end
			end
		end
	end

	if ActivityTools.activityRootMap.root[arg_37_0] then
		return true
	end

	return ActivityTools.activityRootMap.subRoot[arg_37_0] or false
end

function var_0_0.CheckMainActivityIsCommon(arg_38_0)
	if not ActivityTools.activityCommonMain then
		ActivityTools.activityCommonMain = {}
	end

	if ActivityTools.activityCommonMain[arg_38_0] ~= nil then
		return ActivityTools.activityCommonMain[arg_38_0]
	end

	if ActivityTools.GetActivityIsRootOrSub(arg_38_0) == true then
		local var_38_0 = ActivityEntraceCfg[arg_38_0]

		if not var_38_0 or not var_38_0.jump_system or not var_38_0.jump_system[1] then
			ActivityTools.activityCommonMain[arg_38_0] = false

			return false
		end

		local var_38_1 = var_38_0.jump_system[1]
		local var_38_2 = SystemLinkCfg[var_38_1]

		if not var_38_2 or not var_38_2.link then
			ActivityTools.activityCommonMain[arg_38_0] = false

			return false
		end

		local var_38_3 = var_38_2.link
		local var_38_4, var_38_5, var_38_6 = gameContext:ParseUrl(var_38_3)

		if not var_38_5 or not var_38_5[1] then
			return false
		end

		local var_38_7 = gameContext:GetRouteCfgFromRouteName(var_38_5[1])

		if not var_38_7 or not var_38_7.component then
			return false
		end

		if var_38_7.component.IsCommonMainActivityPage then
			ActivityTools.activityCommonMain[arg_38_0] = true

			return true
		end
	end

	ActivityTools.activityCommonMain[arg_38_0] = false

	return false
end

function var_0_0.IsFirstEnterActivity(arg_39_0)
	local var_39_0 = getData("activity_first_enter", "activity_" .. arg_39_0)

	return var_39_0 == nil or var_39_0 == 0
end

function var_0_0.MarkHasEnterActivity(arg_40_0)
	saveData("activity_first_enter", "activity_" .. arg_40_0, 1)
end

return var_0_0
