local var_0_0 = {
	GetTaskUIName = function(arg_1_0)
		if ActivityTools.GetActivityTheme(arg_1_0) == ActivityConst.THEME.ACTIVITY_2_4 then
			return "UI/VersionUI/JapanRegionUI_2_4/JapanRegionJigsawUI/JapanRegionJigsawUI"
		else
			return "UI/VersionUI/JapanRegionUI_2_4/JapanRegionJigsawUI/JapanRegionJigsawUI"
		end
	end,
	GetPlayViewUIName = function(arg_2_0)
		if ActivityTools.GetActivityTheme(arg_2_0) == ActivityConst.THEME.ACTIVITY_2_4 then
			return "UI/VersionUI/JapanRegionUI_2_4/JapanRegionJigsawUI/JapanRegionJigsawPuzzleUI"
		else
			return "UI/VersionUI/JapanRegionUI_2_4/JapanRegionJigsawUI/JapanRegionJigsawPuzzleUI"
		end
	end,
	GetRewardViewUIName = function(arg_3_0)
		if ActivityTools.GetActivityTheme(arg_3_0) == ActivityConst.THEME.ACTIVITY_2_4 then
			return "UI/VersionUI/JapanRegionUI_2_4/JapanRegionJigsawUI/JapanRegionJigsawPuzzlePopUI"
		else
			return "UI/VersionUI/JapanRegionUI_2_4/JapanRegionJigsawUI/JapanRegionJigsawPuzzlePopUI"
		end
	end
}

function var_0_0.InitConfig(arg_4_0)
	local var_4_0 = TangramPuzzleCfg[arg_4_0]
	local var_4_1 = var_4_0.correct_array
	local var_4_2 = var_4_0.picture_fragment_id

	var_0_0.regionCfgDic = var_0_0.regionCfgDic or {}
	var_0_0.regionCfgDic[arg_4_0] = {}
	var_0_0.regionIndexDic = var_0_0.regionIndexDic or {}
	var_0_0.regionIndexDic[arg_4_0] = {}
	var_0_0.regionIdDicByPuzzleID = var_0_0.regionIdDicByPuzzleID or {}
	var_0_0.regionIdDicByPuzzleID[arg_4_0] = {}
	var_0_0.regionIdDicByPuzzleGlobalIndex = var_0_0.regionIdDicByPuzzleGlobalIndex or {}
	var_0_0.regionIdDicByPuzzleGlobalIndex[arg_4_0] = {}
	var_0_0.puzzleGlobalIndexDic = var_0_0.puzzleGlobalIndexDic or {}
	var_0_0.puzzleGlobalIndexDic[arg_4_0] = {}

	local var_4_3 = 1

	var_0_0.puzzleLocalIndexDicByGlobalIndex = var_0_0.puzzleLocalIndexDicByGlobalIndex or {}
	var_0_0.puzzleLocalIndexDicByGlobalIndex[arg_4_0] = {}
	var_0_0.puzzleLocalIndexDic = var_0_0.puzzleLocalIndexDic or {}
	var_0_0.puzzleLocalIndexDic[arg_4_0] = {}
	var_0_0.puzzleGlobalIndexListByRegionID = var_0_0.puzzleGlobalIndexListByRegionID or {}
	var_0_0.puzzleGlobalIndexListByRegionID[arg_4_0] = {}
	var_0_0.puzzlePictureIdDic = var_0_0.puzzlePictureIdDic or {}
	var_0_0.puzzlePictureIdDic[arg_4_0] = {}

	for iter_4_0, iter_4_1 in ipairs(var_4_1) do
		local var_4_4 = iter_4_1[1]
		local var_4_5 = iter_4_1[2]
		local var_4_6 = var_4_2[iter_4_0][2]

		var_0_0.regionIndexDic[arg_4_0][var_4_4] = iter_4_0

		local var_4_7 = {}

		for iter_4_2, iter_4_3 in ipairs(var_4_5) do
			var_0_0.regionIdDicByPuzzleID[arg_4_0][iter_4_3] = var_4_4
			var_0_0.regionIdDicByPuzzleGlobalIndex[arg_4_0][var_4_3] = var_4_4
			var_0_0.puzzleLocalIndexDic[arg_4_0][iter_4_3] = iter_4_2
			var_0_0.puzzleGlobalIndexDic[arg_4_0][iter_4_3] = var_4_3
			var_0_0.puzzleLocalIndexDicByGlobalIndex[arg_4_0][var_4_3] = iter_4_2

			table.insert(var_4_7, var_4_3)

			var_0_0.puzzlePictureIdDic[arg_4_0][iter_4_3] = var_4_6[iter_4_2]
			var_4_3 = var_4_3 + 1
		end

		var_0_0.puzzleGlobalIndexListByRegionID[arg_4_0][var_4_4] = var_4_7
	end

	var_0_0.regionListByType = var_0_0.regionListByType or {}
	var_0_0.regionListByType[arg_4_0] = {}

	local var_4_8 = var_4_0.area_type_list

	for iter_4_4, iter_4_5 in ipairs(var_4_8) do
		local var_4_9 = iter_4_5[1]
		local var_4_10 = iter_4_5[2]
		local var_4_11 = iter_4_5[3]

		var_0_0.regionListByType[arg_4_0][var_4_9] = {}

		for iter_4_6, iter_4_7 in ipairs(var_4_10) do
			var_0_0.regionCfgDic[arg_4_0][iter_4_7] = var_0_0.regionCfgDic[arg_4_0][iter_4_7] or {}
			var_0_0.regionCfgDic[arg_4_0][iter_4_7].type = var_4_9
			var_0_0.regionCfgDic[arg_4_0][iter_4_7].rotateAngle = var_4_11

			table.insert(var_0_0.regionListByType[arg_4_0][var_4_9], iter_4_7)
		end
	end

	local var_4_12 = {}
	local var_4_13 = PuzzleNewClueCfg.get_id_list_by_main_activity_id[arg_4_0]

	for iter_4_8, iter_4_9 in ipairs(var_4_13) do
		local var_4_14 = PuzzleNewClueCfg[iter_4_9].area_type

		var_4_12[var_4_14] = var_4_12[var_4_14] or {}

		table.insert(var_4_12[var_4_14], iter_4_9)
	end

	var_0_0.clueListByRegionType = var_0_0.clueListByRegionType or {}
	var_0_0.clueListByRegionType[arg_4_0] = var_4_12
	var_0_0.cacheAllReceivedRegion = var_0_0.cacheAllReceivedRegion or {}
	var_0_0.cacheAllReceivedRegion[arg_4_0] = {}
	var_0_0.cacheAllRightRegionType = var_0_0.cacheAllRightRegionType or {}
	var_0_0.cacheAllRightRegionType[arg_4_0] = {}
end

function var_0_0.GetRegionIdDicByPuzzleID(arg_5_0)
	local var_5_0

	if var_0_0.regionIdDicByPuzzleID and var_0_0.regionIdDicByPuzzleID[arg_5_0] then
		var_5_0 = var_0_0.regionIdDicByPuzzleID[arg_5_0]
	else
		var_5_0 = {}
	end

	return var_5_0
end

function var_0_0.GetPuzzleLocalIndexDic(arg_6_0)
	local var_6_0

	if var_0_0.puzzleLocalIndexDic and var_0_0.puzzleLocalIndexDic[arg_6_0] then
		var_6_0 = var_0_0.puzzleLocalIndexDic[arg_6_0]
	else
		var_6_0 = {}
	end

	return var_6_0
end

function var_0_0.GetPuzzleGlobalIndexDic(arg_7_0)
	local var_7_0

	if var_0_0.puzzleGlobalIndexDic and var_0_0.puzzleGlobalIndexDic[arg_7_0] then
		var_7_0 = var_0_0.puzzleGlobalIndexDic[arg_7_0]
	else
		var_7_0 = {}
	end

	return var_7_0
end

function var_0_0.GetPuzzleLocalIndexDicByGlobalIndex(arg_8_0)
	local var_8_0

	if var_0_0.puzzleLocalIndexDicByGlobalIndex and var_0_0.puzzleLocalIndexDicByGlobalIndex[arg_8_0] then
		var_8_0 = var_0_0.puzzleLocalIndexDicByGlobalIndex[arg_8_0]
	else
		var_8_0 = {}
	end

	return var_8_0
end

function var_0_0.GetPuzzleGlobalIndexListByRegionID(arg_9_0)
	local var_9_0

	if var_0_0.puzzleGlobalIndexListByRegionID and var_0_0.puzzleGlobalIndexListByRegionID[arg_9_0] then
		var_9_0 = var_0_0.puzzleGlobalIndexListByRegionID[arg_9_0]
	else
		var_9_0 = {}
	end

	return var_9_0
end

function var_0_0.GetCurServerPuzzleGlobalIndex(arg_10_0, arg_10_1)
	local var_10_0 = TangramPuzzleData:GetCurPuzzleDic(arg_10_0)

	for iter_10_0, iter_10_1 in pairs(var_10_0) do
		if arg_10_1 == iter_10_1 then
			return iter_10_0
		end
	end

	return -1
end

function var_0_0.GetPuzzlePictureDic(arg_11_0)
	local var_11_0

	if var_0_0.puzzlePictureIdDic and var_0_0.puzzlePictureIdDic[arg_11_0] then
		var_11_0 = var_0_0.puzzlePictureIdDic[arg_11_0]
	else
		var_11_0 = {}
	end

	return var_11_0
end

function var_0_0.FindClosestTarget(arg_12_0, arg_12_1)
	local var_12_0 = arg_12_1.pressEventCamera
	local var_12_1 = arg_12_1.position
	local var_12_2 = Vector3.New(var_12_1.x, var_12_1.y, 0)
	local var_12_3 = var_12_0:WorldToScreenPoint(arg_12_0[1])
	local var_12_4 = 1
	local var_12_5 = (var_12_3 - var_12_2):Magnitude()

	for iter_12_0 = 2, #arg_12_0 do
		local var_12_6 = (var_12_0:WorldToScreenPoint(arg_12_0[iter_12_0]) - var_12_2):Magnitude()

		if var_12_6 < var_12_5 then
			var_12_5 = var_12_6
			var_12_4 = iter_12_0
		end
	end

	return var_12_4, var_12_5
end

function var_0_0.CheckWrongSideByRegionID(arg_13_0, arg_13_1)
	local var_13_0 = TangramPuzzleData:GetCurPuzzleDic(arg_13_0)
	local var_13_1 = var_0_0.GetRegionCorrectPuzzleList(arg_13_0, arg_13_1)
	local var_13_2 = var_0_0.GetPuzzleGlobalIndexListByRegionID(arg_13_0)[arg_13_1]

	for iter_13_0, iter_13_1 in ipairs(var_13_1) do
		if iter_13_1 ~= var_13_0[var_13_2[iter_13_0]] then
			return true
		end
	end

	return false
end

function var_0_0.CheckRegionAllRight(arg_14_0)
	for iter_14_0, iter_14_1 in pairs(var_0_0.regionListByType[arg_14_0]) do
		if not var_0_0.CheckRegionAllRightByType(arg_14_0, iter_14_0) then
			return false
		end
	end

	return true
end

function var_0_0.CheckRegionAllRightByType(arg_15_0, arg_15_1)
	if var_0_0.cacheAllRightRegionType[arg_15_0][arg_15_1] == true then
		return true
	end

	local var_15_0 = var_0_0.regionListByType[arg_15_0][arg_15_1]

	for iter_15_0, iter_15_1 in ipairs(var_15_0) do
		if var_0_0.CheckWrongSideByRegionID(arg_15_0, iter_15_1) == true then
			return false
		end
	end

	var_0_0.cacheAllRightRegionType[arg_15_0][arg_15_1] = true

	return true
end

function var_0_0.GetRegionCfg(arg_16_0)
	return var_0_0.regionCfgDic[arg_16_0]
end

function var_0_0.GetRegionType(arg_17_0, arg_17_1)
	return var_0_0.regionCfgDic[arg_17_0][arg_17_1].type
end

function var_0_0.GetRegionRotateAngle(arg_18_0, arg_18_1)
	return var_0_0.regionCfgDic[arg_18_0][arg_18_1].rotateAngle
end

function var_0_0.GetRegionCorrectPuzzleList(arg_19_0, arg_19_1)
	local var_19_0 = TangramPuzzleCfg[arg_19_0]
	local var_19_1 = var_0_0.regionIndexDic[arg_19_0][arg_19_1]

	return var_19_0.correct_array[var_19_1][2]
end

function var_0_0.GetRegionRewardList(arg_20_0, arg_20_1)
	local var_20_0 = TangramPuzzleCfg[arg_20_0]
	local var_20_1 = var_0_0.regionIndexDic[arg_20_0][arg_20_1]

	return var_20_0.reward_area_list[var_20_1][2]
end

function var_0_0.GetRegionListByType(arg_21_0)
	return var_0_0.regionListByType[arg_21_0]
end

function var_0_0.GetRegionIdByPuzzleGlobalIndex(arg_22_0)
	local var_22_0

	if var_0_0.regionIdDicByPuzzleGlobalIndex and var_0_0.regionIdDicByPuzzleGlobalIndex[arg_22_0] then
		var_22_0 = var_0_0.regionIdDicByPuzzleGlobalIndex[arg_22_0]
	else
		var_22_0 = {}
	end

	return var_22_0
end

function var_0_0.CheckRegionReward(arg_23_0)
	local var_23_0 = {}
	local var_23_1 = {}
	local var_23_2 = TangramPuzzleData:GetRegionReceivedDic(arg_23_0)

	for iter_23_0, iter_23_1 in pairs(var_0_0.regionCfgDic[arg_23_0]) do
		if not var_0_0.CheckWrongSideByRegionID(arg_23_0, iter_23_0) and not var_23_2[iter_23_0] then
			local var_23_3 = var_0_0.GetRegionRewardList(arg_23_0, iter_23_0)

			table.insertto(var_23_1, var_23_3)

			var_23_0[#var_23_0 + 1] = iter_23_0
		end
	end

	return var_23_0, var_23_1
end

function var_0_0.IsAllRegionReceived(arg_24_0, arg_24_1)
	if var_0_0.cacheAllReceivedRegion[arg_24_0][arg_24_1] then
		return true
	end

	local var_24_0 = var_0_0.regionListByType[arg_24_0][arg_24_1]
	local var_24_1 = TangramPuzzleData:GetRegionReceivedDic(arg_24_0)

	for iter_24_0, iter_24_1 in ipairs(var_24_0) do
		if not var_24_1[iter_24_1] then
			return false
		end
	end

	var_0_0.cacheAllReceivedRegion[arg_24_0][arg_24_1] = true

	return true
end

function var_0_0.IsAllRegionTypeReceived(arg_25_0)
	for iter_25_0, iter_25_1 in pairs(var_0_0.regionListByType[arg_25_0]) do
		if not var_0_0.IsAllRegionReceived(arg_25_0, iter_25_0) then
			return false
		end
	end

	return true
end

function var_0_0.GetClueListByRegionType(arg_26_0)
	local var_26_0

	if var_0_0.clueListByRegionType[arg_26_0] and var_0_0.clueListByRegionType[arg_26_0] then
		var_26_0 = var_0_0.clueListByRegionType[arg_26_0]
	else
		var_26_0 = {}
	end

	return var_26_0
end

function var_0_0.IsAllClueCompleted(arg_27_0)
	local var_27_0 = TangramPuzzleData:GetCurClueDic(arg_27_0)
	local var_27_1 = PuzzleNewClueCfg.get_id_list_by_main_activity_id[arg_27_0]

	for iter_27_0, iter_27_1 in ipairs(var_27_1) do
		if not var_27_0[iter_27_1] then
			return false
		end
	end

	return true
end

return var_0_0
