local var_0_0 = {
	SatisfyCondition = function(arg_1_0)
		if type(arg_1_0) ~= "table" then
			return true
		end

		for iter_1_0, iter_1_1 in pairs(arg_1_0) do
			if iter_1_1[1] == "stage" then
				local var_1_0 = iter_1_1[2]
				local var_1_1 = BattleStageData:GetStageData()

				if var_1_1[var_1_0] and var_1_1[var_1_0].clear_times >= 1 then
					-- block empty
				else
					return false
				end
			elseif iter_1_1[1] == "task" then
				if not TaskData2:GetTask(iter_1_1[2]) or TaskData2:GetTask(iter_1_1[2]).complete_flag == iter_1_1[3] then
					-- block empty
				else
					return false
				end
			elseif iter_1_1[1] == "playerLevel" then
				if PlayerData:GetPlayerInfo().userLevel < iter_1_1[2] then
					return false
				end
			elseif iter_1_1[1] == "playerLevelLessThan" then
				if PlayerData:GetPlayerInfo().userLevel >= iter_1_1[2] then
					return false
				end
			elseif iter_1_1[1] == "whereTag" then
				if manager.windowBar:GetWhereTag() ~= iter_1_1[2] then
					return false
				end
			elseif iter_1_1[1] == "uiName" then
				if not gameContext:GetOpenPageHandler(iter_1_1[2]) then
					return false
				end
			elseif iter_1_1[1] == "uiParam" then
				if nullable(gameContext:GetLastOpenPageHandler(), "params_", iter_1_1[2]) ~= iter_1_1[3] then
					return false
				end
			elseif iter_1_1[1] == "uiNameList" then
				local var_1_2 = iter_1_1[2]
				local var_1_3 = false

				for iter_1_2, iter_1_3 in ipairs(var_1_2) do
					if gameContext:GetOpenPageHandler(iter_1_3) then
						var_1_3 = true
					end
				end

				if not var_1_3 then
					return false
				end
			elseif iter_1_1[1] == "activityId" then
				local var_1_4 = iter_1_1[2]

				if not ActivityData:GetActivityIsOpen(var_1_4) then
					return false
				end
			elseif iter_1_1[1] == "guide" then
				local var_1_5 = iter_1_1[2]

				if not GuideData:IsFinish(var_1_5) then
					return false
				end
			elseif iter_1_1[1] == "notGuide" then
				local var_1_6 = iter_1_1[2]

				if GuideData:IsFinish(var_1_6) then
					return false
				end
			elseif iter_1_1[1] == "storyId" then
				local var_1_7 = iter_1_1[2]

				if not manager.story:IsStoryPlayed(var_1_7) then
					return false
				end
			elseif iter_1_1[1] == "drawNewHero" then
				if DrawData:GetNewHeroFlag() == false then
					return false
				end
			elseif iter_1_1[1] == "anyEquipLevel" then
				local var_1_8 = iter_1_1[2]
				local var_1_9 = false

				for iter_1_4, iter_1_5 in pairs(EquipData:GetEquipList()) do
					if var_1_8 <= iter_1_5:GetLevel() then
						var_1_9 = true

						break
					end
				end

				if var_1_9 == false then
					return false
				end
			elseif iter_1_1[1] == "equip" then
				local var_1_10, var_1_11 = gameContext:GetLastOpenPageHandler()

				if gameContext:GetCmdEnqueueCount() ~= 0 or var_1_11 ~= "equipCultureView" then
					return false
				end

				local var_1_12 = gameContext:GetOpenPageHandler("equipCultureView")

				if var_1_12 == nil then
					return false
				end

				local var_1_13 = EquipData:GetEquipData(var_1_12:GetEquipId())

				if not var_1_13 then
					return false
				end

				if iter_1_1[2] == "equipLevel" then
					if iter_1_1[3] > var_1_13:GetLevel() then
						return false
					end
				elseif iter_1_1[2] == "cultureEquipStar" then
					if iter_1_1[3] > var_1_13.star then
						return false
					end
				elseif iter_1_1[2] == "cultureEquipReset" then
					if var_1_13.star < 5 or var_1_13.race ~= 0 and table.keyof(RaceEffectCfg.all, var_1_13.race) == nil then
						return false
					end
				elseif iter_1_1[2] == "page" then
					local var_1_14 = iter_1_1[3]

					if var_1_12:GetCulturePage() ~= var_1_14 then
						return false
					end
				end
			elseif iter_1_1[1] == "heroFavorability" then
				local var_1_15 = iter_1_1[2][1]

				if var_1_15 == 0 then
					local var_1_16 = iter_1_1[2][2]
					local var_1_17 = HeroData:GetHeroList()
					local var_1_18 = false

					for iter_1_6, iter_1_7 in pairs(var_1_17) do
						if HeroTools.GetHeroIsUnlock(iter_1_6) then
							local var_1_19 = HeroRecordCfg.get_id_list_by_hero_id[iter_1_6][1]

							if var_1_16 <= ArchiveData:GetArchive(var_1_19).lv then
								var_1_18 = true

								break
							end
						end
					end

					if not var_1_18 then
						return false
					end
				elseif var_1_15 and ArchiveData:GetArchive(var_1_15) then
					local var_1_20 = ArchiveData:GetArchive(var_1_15).lv

					if var_1_20 and var_1_20 < iter_1_1[2][2] then
						return false
					end
				else
					print("档案id获取错误")
				end
			elseif iter_1_1[1] == "canJump" then
				if whereami ~= "home" or LuaExchangeHelper.GetSceneIsHanding() or WarChessData:GetIsGoingChess() then
					return false
				end
			elseif iter_1_1[1] == "spHero" then
				local var_1_21 = gameContext:GetOpenPageHandler("newHero")

				if var_1_21 == nil or var_1_21.curPageIndex_ ~= 6 or not HeroTools.IsSpHero(var_1_21.curHeroId_) then
					return false
				end
			elseif iter_1_1[1] == "chess" then
				local var_1_22 = manager.ChessBoardManager

				if var_1_22 then
					local var_1_23 = iter_1_1[2]

					if var_1_23 == "chanceId" and var_1_22:GetCurChanceInfo().chanceID ~= iter_1_1[3] then
						return false
					elseif var_1_23 == "canUseProp" and var_1_22:GetIsCanUseProp() ~= iter_1_1[3] then
						return false
					elseif var_1_23 == "hasProp" and #var_1_22:GetHeroProp() <= 0 then
						return false
					end
				else
					return false
				end
			elseif iter_1_1[1] == "idolCompetition" then
				local var_1_24 = gameContext:GetOpenPageHandler("idolCompetitionMain")

				if var_1_24 == nil then
					return false
				end

				if not var_1_24.myTakePartIn_ and var_1_24.curRacePhase_ > 1 then
					return false
				end
			elseif iter_1_1[1] == "selfSticker" then
				local var_1_25 = gameContext:GetOpenPageHandler("customStickerMain")

				if var_1_25 == nil or var_1_25.params_.foreign then
					return false
				end
			else
				print("未实现的条件类型:", iter_1_1[1])
			end
		end

		return true
	end,
	FindComponent = function(arg_2_0)
		local var_2_0 = GuideTool.stringToTable(arg_2_0)
		local var_2_1 = ComponentStep.New(nil, 101):AnalyzeComponentCfg(var_2_0)

		if var_2_1 then
			local var_2_2 = var_2_1.gameObject

			LeanTween.scale(var_2_2, Vector3.New(1.2, 1.2, 1.2), 0.2)
			LeanTween.scale(var_2_2, Vector3.one, 0.2):setDelay(0.2)
			print("<color=#00ff00>找到了</color>")
		else
			print("<color=#ff0000>找不到</color>")
		end
	end,
	stringToTable = function(arg_3_0)
		return (loadstring("return " .. arg_3_0)())
	end,
	Log = function(arg_4_0)
		print("<color=#00ff00>" .. arg_4_0 .. "</color>")
	end,
	GetGameContentUrl = function()
		return gameContext:GetUrl()
	end
}
local var_0_1 = {}
local var_0_2
local var_0_3 = ""

function var_0_0.GetGameContextParams()
	local var_6_0 = gameContext:GetLastOpenPage()
	local var_6_1 = gameContext:GetOpenPageHandler(var_6_0)

	if not var_6_1 then
		return {}
	end

	var_0_1 = {}
	var_0_2 = var_6_1
	var_0_3 = var_6_0

	var_0_0.GetGuideComponent(var_6_1, "", 0)

	var_0_2 = nil

	return var_0_1
end

function var_0_0.GetListComponets(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = gameContext:GetOpenPageHandler(arg_7_0)

	if not var_7_0 then
		return {}
	end

	local var_7_1 = string.split(arg_7_1, "/")
	local var_7_2

	for iter_7_0, iter_7_1 in ipairs(var_7_1) do
		if iter_7_0 == 1 then
			var_7_2 = var_7_0[iter_7_1]
		else
			var_7_2 = var_7_2[iter_7_1]
		end
	end

	if not var_7_2 then
		return {}
	end

	local var_7_3 = var_7_2:GetItemList()

	if not var_7_3 or not var_7_3[arg_7_2] then
		return {}
	end

	local var_7_4 = var_7_3[arg_7_2]

	var_0_1 = {}
	var_0_2 = var_7_4
	var_0_3 = "LuaList_Item"

	var_0_0.GetGuideComponent(var_7_4, "", 0)

	return var_0_1
end

function var_0_0.GetGuideComponent(arg_8_0, arg_8_1, arg_8_2)
	if arg_8_2 > 2 then
		return
	end

	for iter_8_0, iter_8_1 in pairs(arg_8_0) do
		local var_8_0 = arg_8_1 .. iter_8_0

		if type(iter_8_1) == "userdata" and not isNil(iter_8_1) then
			table.insert(var_0_1, {
				var_0_3,
				var_8_0,
				iter_8_1
			})
		elseif type(iter_8_1) == "table" then
			if iter_8_1.__cname == "LuaList" and iter_8_1.uiList_ ~= nil then
				table.insert(var_0_1, {
					var_0_3,
					var_8_0,
					iter_8_1.uiList_
				})
			elseif iter_8_1 ~= var_0_2 then
				var_0_0.GetGuideComponent(iter_8_1, var_8_0 .. "/", arg_8_2 + 1)
			end
		end
	end
end

function var_0_0.CheckWeakGuide(arg_9_0)
	local var_9_0 = GuideWeakCfg.get_id_list_by_name[arg_9_0]

	if var_9_0 == nil then
		return false
	end

	local var_9_1 = {
		priority = -9999
	}

	for iter_9_0, iter_9_1 in pairs(var_9_0) do
		local var_9_2 = GuideWeakCfg[iter_9_1]
		local var_9_3 = GuideData:IsWeakGuideFinish(iter_9_1)
		local var_9_4 = var_9_2.skipcondition[1] ~= nil and GuideTool.SatisfyCondition(var_9_2.skipcondition)

		if not var_9_3 and not var_9_4 and var_9_2.priority > var_9_1.priority and GuideTool.SatisfyCondition(var_9_2.opencondition) then
			var_9_1 = var_9_2
		end
	end

	if var_9_1.priority == -9999 then
		return false
	end

	return true, var_9_1
end

function var_0_0.GetGuideComponentByRoute(arg_10_0, arg_10_1)
	local var_10_0 = #arg_10_1
	local var_10_1 = 1
	local var_10_2

	while var_10_1 <= var_10_0 do
		local var_10_3 = arg_10_1[var_10_1]
		local var_10_4

		if var_10_1 == 1 then
			var_10_4 = arg_10_0[var_10_3]
		else
			var_10_4 = var_10_2[var_10_3]
		end

		if var_10_4 then
			var_10_2 = var_10_4
			var_10_1 = var_10_1 + 1
		else
			return nil
		end
	end

	return var_10_2
end

local var_0_4 = {
	5,
	6,
	2,
	nil,
	5,
	1,
	3,
	4
}

function var_0_0.GetPoolIndex(arg_11_0)
	local var_11_0 = var_0_0.GetPools()
	local var_11_1 = {}

	for iter_11_0, iter_11_1 in ipairs(var_11_0) do
		local var_11_2 = DrawPoolCfg[iter_11_1]
		local var_11_3 = var_0_4[var_11_2.pool_show_type]

		if var_11_1[var_11_3] == nil then
			var_11_1[var_11_3] = 1
		end

		var_11_1[var_11_3] = var_11_1[var_11_3] + 1
	end

	local var_11_4 = {}
	local var_11_5 = 1

	for iter_11_2 = 1, 8 do
		if var_11_1[iter_11_2] then
			var_11_4[iter_11_2] = var_11_5
			var_11_5 = var_11_5 + 1
		end
	end

	return var_11_4[var_0_4[DrawPoolCfg[arg_11_0].pool_show_type]]
end

function var_0_0.GetPools()
	local var_12_0 = {}
	local var_12_1 = ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.DRAW] or {}

	for iter_12_0, iter_12_1 in ipairs(var_12_1) do
		if ActivityData:GetActivityIsOpen(iter_12_1) then
			local var_12_2 = ActivityDrawPoolCfg[iter_12_1]

			if var_12_2 then
				for iter_12_2, iter_12_3 in ipairs(var_12_2.config_list) do
					if DrawPoolCfg[iter_12_3].pool_show_type == 8 then
						if not DrawData:GetNewbieChooseDrawFlag() then
							table.insert(var_12_0, iter_12_3)
						end
					else
						table.insert(var_12_0, iter_12_3)
					end
				end
			end
		end
	end

	table.sort(var_12_0, function(arg_13_0, arg_13_1)
		return DrawPoolCfg[arg_13_0].order < DrawPoolCfg[arg_13_1].order
	end)

	return var_12_0
end

return var_0_0
