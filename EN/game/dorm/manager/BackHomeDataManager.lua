local var_0_0 = singletonClass("BackHomeDataManager")
local var_0_1
local var_0_2
local var_0_3 = {
	[DormEnum.DormSystemType.Canteen] = CanteenData,
	[DormEnum.DormSystemType.Dormitory] = DormitoryData,
	[DormEnum.DormSystemType.CricketBattle] = BackHomeCricketBattleData
}

function var_0_0.Init(arg_1_0)
	var_0_1 = DormEnum.DormSystemType.Main
	var_0_2 = false
end

function var_0_0.InitAllSampleData(arg_2_0, arg_2_1)
	DormData:InitSimplaDormData(arg_2_1)

	if not var_0_2 then
		DormitoryData:InitSimpleDormInfo(arg_2_1)
	end

	CanteenData:InitSimpleCanteenInfo(arg_2_1)
	BackHomeCricketBattleData:InitSimpleCricketBattleInfo(arg_2_1)
	DormSkillData:Init()
end

function var_0_0.InitAllDetailData(arg_3_0, arg_3_1)
	DormData:InitDetailDormData(arg_3_1)
	CanteenData:InitDetailCanteenData(arg_3_1)
	DormitoryData:InitDetialDormData(arg_3_1)
	BackHomeCricketBattleData:InitDetailCricketBattleData(arg_3_1)
	DormSkillData:Init()
end

function var_0_0.EnterBackHomeSystem(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
	if not var_0_2 then
		var_0_2 = true
		arg_4_3 = arg_4_3 or false

		DormVisitTools:SetIsOtherSystem(arg_4_3)
		BackHomeAction:GetAllDetailInfo(arg_4_1, arg_4_2)
	elseif arg_4_1 then
		arg_4_1(arg_4_2)
	end
end

function var_0_0.ExitBackHomeSystem(arg_5_0, arg_5_1, arg_5_2)
	var_0_2 = false

	if var_0_1 ~= DormEnum.DormSystemType.Main then
		var_0_3[var_0_1]:ExitCurSystem()
	end

	var_0_1 = DormEnum.DormSystemType.Main

	DormData:SetCurrentScene(nil)
	CanteenData:ExitBackHomeSystem()
	DormitoryData:ExitBackHomeSystem()
	BackHomeCricketBattleData:ExitBackHomeSystem()

	if arg_5_1 then
		arg_5_1(arg_5_2)
	end
end

function var_0_0.OtherSystemVisitBack(arg_6_0)
	var_0_2 = false

	if var_0_1 ~= DormEnum.DormSystemType.Main then
		var_0_3[var_0_1]:ExitCurSystem()
	end

	var_0_1 = DormEnum.DormSystemType.Main

	DormData:SetCurrentScene(nil)
	CanteenData:ExitBackHomeSystem()
	DormitoryData:ExitBackHomeSystem()
	DormitoryData:OtherSystemVisitBack()
end

function var_0_0.ChangeCurSystem(arg_7_0, arg_7_1, arg_7_2)
	if arg_7_2 then
		local var_7_0 = var_0_1

		var_0_1 = DormEnum.DormSystemType.CricketBattle

		if var_7_0 ~= var_0_1 then
			if var_7_0 ~= DormEnum.DormSystemType.Main then
				var_0_3[var_7_0]:ExitCurSystem()
			end

			if var_0_1 ~= DormEnum.DormSystemType.Main then
				var_0_3[var_0_1]:EnterCurSystem()
			end
		end

		return
	end

	if arg_7_1 then
		local var_7_1 = BackHomeCfg[arg_7_1].type
		local var_7_2 = var_0_1

		if var_7_1 == DormConst.BACKHOME_TYPE.Canteen then
			var_0_1 = DormEnum.DormSystemType.Canteen
		elseif var_7_1 == DormConst.BACKHOME_TYPE.PublicDorm then
			var_0_1 = DormEnum.DormSystemType.Dormitory
		elseif var_7_1 == DormConst.BACKHOME_TYPE.PrivateDorm then
			var_0_1 = DormEnum.DormSystemType.Dormitory
		end

		if var_7_2 ~= var_0_1 then
			if var_7_2 ~= DormEnum.DormSystemType.Main then
				var_0_3[var_7_2]:ExitCurSystem()
			end

			if var_0_1 ~= DormEnum.DormSystemType.Main then
				var_0_3[var_0_1]:EnterCurSystem()
			end
		end
	end
end

function var_0_0.GotoBackHomeScene(arg_8_0, arg_8_1)
	if arg_8_1 then
		BackHomeAction:CheckToEnterDormScene(arg_8_1)
		arg_8_0:ChangeCurSystem(arg_8_1)
	end
end

function var_0_0.GotoBackHomeCricketStage(arg_9_0, arg_9_1, arg_9_2)
	if arg_9_1 == BackHomeCricketConst.ROOM_TYPE.TRAIN then
		DormMinigame.Launch("WT_RK")
		arg_9_0:ChangeCurSystem(nil, true)
		DormData:SetCurrentScene(nil)

		return
	end

	if arg_9_2 and var_0_1 == DormEnum.DormSystemType.CricketBattle then
		local var_9_0

		if arg_9_1 == BackHomeCricketConst.ROOM_TYPE.PVP_STAGE then
			var_9_0 = IdolTraineePvpBattleCfg
		else
			var_9_0 = IdolTraineePveBattleCfg
		end

		local var_9_1 = var_9_0[arg_9_2].scene_name

		DormMinigame.Launch(var_9_1, DanceGameBridge)
	end
end

function var_0_0.GetCurSystem(arg_10_0)
	return var_0_1
end

return var_0_0
