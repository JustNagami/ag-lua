local var_0_0 = singletonClass("TimeMgr")

var_0_0._Timer = nil
var_0_0._sAnchorTime = 0
var_0_0._AnchorDelta = 0
var_0_0._serverUnitydelta = 0

local var_0_1 = 3600
local var_0_2 = 86400
local var_0_3 = 604800
local var_0_4 = 0
local var_0_5 = 345600

function var_0_0.Ctor(arg_1_0)
	arg_1_0:OnCtor()
end

function var_0_0.OnCtor(arg_2_0)
	print("initializing time manager...")

	arg_2_0._Timer = TimeUtil.NewUnityTimer()

	arg_2_0:UpdateTimeInfo()
end

function var_0_0.UpdateTimeInfo(arg_3_0)
	arg_3_0.timeZero_ = arg_3_0:CalcTimeZone()
	arg_3_0.deltaTimeZero_ = arg_3_0.timeZero_ - var_0_4
end

function var_0_0.Update(arg_4_0)
	arg_4_0._Timer:Schedule()
end

function var_0_0.AddTimer(arg_5_0, arg_5_1, arg_5_2, arg_5_3, arg_5_4)
	return arg_5_0._Timer:SetTimer(arg_5_1, arg_5_2 * 1000, arg_5_3 * 1000, arg_5_4)
end

function var_0_0.RemoveTimer(arg_6_0, arg_6_1)
	if arg_6_1 == nil or arg_6_1 == 0 then
		return
	end

	arg_6_0._Timer:DeleteTimer(arg_6_1)
end

function var_0_0.GetHour(arg_7_0, arg_7_1)
	return arg_7_1 * 60 * 60 * 1000
end

function var_0_0.GetHourInType(arg_8_0, arg_8_1, arg_8_2)
	if arg_8_2 == 1 then
		return arg_8_1 * 60
	elseif arg_8_2 == 2 then
		return arg_8_1 * 60 * 60
	elseif arg_8_2 == 3 then
		return arg_8_1 * 60 * 60 * 1000
	end
end

function var_0_0.RealtimeSinceStartup(arg_9_0)
	return math.ceil(Time.realtimeSinceStartup)
end

function var_0_0.SetServerTime(arg_10_0, arg_10_1, arg_10_2)
	arg_10_0._serverUnitydelta = arg_10_1 - arg_10_0:RealtimeSinceStartup()
	arg_10_0._sAnchorTime = arg_10_2
	var_0_4 = var_0_5 - arg_10_0._sAnchorTime
	arg_10_0._AnchorDelta = -1 * var_0_4

	arg_10_0:UpdateTimeInfo()
end

function var_0_0.GetServerTime(arg_11_0)
	return arg_11_0:RealtimeSinceStartup() + arg_11_0._serverUnitydelta
end

function var_0_0.GetServerWeek(arg_12_0)
	local var_12_0 = arg_12_0:GetServerTime() - arg_12_0._sAnchorTime

	return math.ceil((var_12_0 % var_0_3 + 1) / var_0_2)
end

function var_0_0.GetGameServerWeek(arg_13_0)
	local var_13_0 = arg_13_0:GetServerTime() - arg_13_0._sAnchorTime - GameSetting.refresh_time1.value[1][1] * 3600

	return math.ceil((var_13_0 % var_0_3 + 1) / var_0_2)
end

function var_0_0.GetServerHour(arg_14_0)
	local var_14_0 = arg_14_0:GetServerTime() - arg_14_0._sAnchorTime

	return math.floor(var_14_0 % var_0_2 / var_0_1)
end

function var_0_0.GetGameServerWeek(arg_15_0)
	local var_15_0 = arg_15_0:GetServerTime() - arg_15_0._sAnchorTime - GameSetting.refresh_time1.value[1][1] * 3600

	return math.ceil((var_15_0 % var_0_3 + 1) / var_0_2)
end

function var_0_0.Table2ServerTime(arg_16_0, arg_16_1)
	arg_16_1.isdst = false

	local var_16_0 = os.date("!*t", arg_16_0:GetServerTime() - arg_16_0._AnchorDelta)
	local var_16_1 = os.time(var_16_0) - os.time(arg_16_1)

	return arg_16_0:GetServerTime() - var_16_1
end

function var_0_0.DescCTime(arg_17_0, arg_17_1, arg_17_2)
	arg_17_2 = arg_17_2 or "!%Y%m%d%H%M%S"

	return os.date(arg_17_2, arg_17_1)
end

function var_0_0.STimeDescS(arg_18_0, arg_18_1, arg_18_2)
	arg_18_2 = arg_18_2 or "!%Y/%m/%d %H:%M:%S"

	return os.date(arg_18_2, arg_18_1 - arg_18_0._AnchorDelta)
end

function var_0_0.ServerTimeDesc(arg_19_0)
	return arg_19_0:DescCTime(arg_19_0:GetServerTime())
end

function var_0_0.GetZeroTime(arg_20_0)
	local var_20_0 = arg_20_0:GetServerTime() + var_0_4

	return math.ceil(var_20_0 / var_0_2) * var_0_2 - var_0_4
end

function var_0_0.GetTimeByHMS(arg_21_0, arg_21_1, arg_21_2, arg_21_3)
	local var_21_0 = os.date("!%Y-%m-%d", arg_21_0:GetServerTime() - arg_21_0._AnchorDelta) .. " " .. arg_21_1 .. ":" .. arg_21_2 .. ":" .. arg_21_3

	return arg_21_0:ParseTimeEx(var_21_0)
end

function var_0_0.GetLastZeroTime(arg_22_0)
	local var_22_0 = arg_22_0:GetServerTime() + var_0_4

	return math.floor(var_22_0 / var_0_2) * var_0_2 - var_0_4
end

function var_0_0.GetNextWeekStartTime(arg_23_0)
	local var_23_0 = arg_23_0:GetServerTime() - 4 * var_0_2 + var_0_4

	return math.ceil(var_23_0 / 604800) * 604800 - var_0_4 + 4 * var_0_2
end

function var_0_0.GetWeekendStartTime(arg_24_0)
	local var_24_0 = arg_24_0:GetServerTime() - 4 * var_0_2 + var_0_4

	return math.ceil(var_24_0 / 604800) * 604800 - var_0_4 + 4 * var_0_2 - 2 * var_0_2
end

function var_0_0.GetNextMonthStartTime(arg_25_0)
	local var_25_0 = arg_25_0:GetServerTime()
	local var_25_1 = tonumber(os.date("!%Y", var_25_0))
	local var_25_2 = (tonumber(os.date("!%m", var_25_0)) + 1) % 12

	if var_25_2 == 0 then
		var_25_2 = 12
	end

	if var_25_2 == 1 then
		var_25_1 = var_25_1 + 1
	end

	return os.time({
		hour = 0,
		min = 0,
		sec = 0,
		day = 1,
		year = var_25_1,
		month = var_25_2
	})
end

function var_0_0.GetNextTime(arg_26_0, arg_26_1, arg_26_2, arg_26_3, arg_26_4)
	arg_26_4 = arg_26_4 or var_0_2

	local var_26_0 = arg_26_0:GetServerTime()
	local var_26_1 = arg_26_1 * var_0_1 + arg_26_2 * 60 + arg_26_3
	local var_26_2 = var_26_0 - (arg_26_0._sAnchorTime + var_26_1)

	return math.floor(var_26_2 / arg_26_4 + 1) * arg_26_4 + arg_26_0._sAnchorTime + var_26_1
end

function var_0_0.GetNextWeekTime(arg_27_0, arg_27_1, arg_27_2, arg_27_3, arg_27_4)
	return arg_27_0:GetNextTime((arg_27_1 - 1) * 24 + arg_27_2, arg_27_3, arg_27_4, var_0_3)
end

function var_0_0.ParseTime(arg_28_0, arg_28_1)
	local var_28_0 = tonumber(arg_28_1)
	local var_28_1 = var_28_0 % 100
	local var_28_2 = var_28_0 / 100
	local var_28_3 = var_28_2 % 100
	local var_28_4 = var_28_2 / 100
	local var_28_5 = var_28_4 % 100
	local var_28_6 = var_28_4 / 100
	local var_28_7 = var_28_6 % 100
	local var_28_8 = var_28_6 / 100
	local var_28_9 = var_28_8 % 100
	local var_28_10 = var_28_8 / 100

	return arg_28_0:Table2ServerTime({
		year = var_28_10,
		month = var_28_9,
		day = var_28_7,
		hour = var_28_5,
		min = var_28_3,
		sec = var_28_1
	})
end

function var_0_0.ParseTimeEx(arg_29_0, arg_29_1, arg_29_2)
	if arg_29_2 == nil then
		arg_29_2 = "(%d+)%-(%d+)%-(%d+)%s(%d+)%:(%d+)%:(%d+)"
	end

	local var_29_0, var_29_1, var_29_2, var_29_3, var_29_4, var_29_5 = arg_29_1:match(arg_29_2)

	return arg_29_0:Table2ServerTime({
		year = var_29_0,
		month = var_29_1,
		day = var_29_2,
		hour = var_29_3,
		min = var_29_4,
		sec = var_29_5
	})
end

function var_0_0.parseTimeFromConfig(arg_30_0, arg_30_1)
	return arg_30_0:Table2ServerTime({
		year = arg_30_1[1][1],
		month = arg_30_1[1][2],
		day = arg_30_1[1][3],
		hour = arg_30_1[2][1],
		min = arg_30_1[2][2],
		sec = arg_30_1[2][3]
	})
end

function var_0_0.DescCDTimeEndMinute(arg_31_0, arg_31_1)
	local var_31_0 = math.floor(arg_31_1 / 3600)

	arg_31_1 = arg_31_1 - var_31_0 * 3600

	local var_31_1 = math.floor(arg_31_1 / 60)

	return string.format("%02d:%02d", var_31_0, var_31_1)
end

function var_0_0.DescCDTime(arg_32_0, arg_32_1)
	local var_32_0 = math.floor(arg_32_1 / 3600)

	arg_32_1 = arg_32_1 - var_32_0 * 3600

	local var_32_1 = math.floor(arg_32_1 / 60)
	local var_32_2 = arg_32_1 % 60

	return string.format("%02d:%02d:%02d", var_32_0, var_32_1, var_32_2)
end

function var_0_0.DescCdTime2(arg_33_0, arg_33_1)
	local var_33_0 = ""
	local var_33_1 = math.floor(arg_33_1 / 86400)
	local var_33_2 = math.fmod(math.floor(arg_33_1 / 3600), 24)
	local var_33_3 = math.fmod(math.floor(arg_33_1 / 60), 60)
	local var_33_4 = math.fmod(arg_33_1, 60)
	local var_33_5 = GetTips("DAY")
	local var_33_6 = GetTips("HOUR")
	local var_33_7 = GetTips("TIP_MINUTE")
	local var_33_8 = GetTips("SECOND")

	if var_33_1 > 0 then
		var_33_0 = SpliceI18NText({
			var_33_1,
			var_33_5,
			string.format("%02d", var_33_2),
			var_33_6,
			string.format("%02d", var_33_3),
			var_33_7
		})
	elseif var_33_2 > 0 then
		var_33_0 = SpliceI18NText({
			string.format("%02d", var_33_2),
			var_33_6,
			string.format("%02d", var_33_3),
			var_33_7
		})
	elseif var_33_3 > 0 then
		var_33_0 = SpliceI18NText({
			string.format("%02d", var_33_3),
			var_33_7,
			string.format("%02d", var_33_4),
			var_33_8
		})
	elseif var_33_4 > 0 then
		var_33_0 = SpliceI18NText({
			string.format("%02d", var_33_4),
			var_33_8
		})
	else
		var_33_0 = "--/--"
	end

	return var_33_0
end

function var_0_0.DescCdTime3(arg_34_0, arg_34_1)
	local var_34_0 = ""
	local var_34_1 = math.floor(arg_34_1 / 86400)
	local var_34_2 = math.fmod(math.floor(arg_34_1 / 3600), 24)
	local var_34_3 = math.fmod(math.floor(arg_34_1 / 60), 60)
	local var_34_4 = math.fmod(arg_34_1, 60)
	local var_34_5 = GetTips("DAY")
	local var_34_6 = GetTips("HOUR")
	local var_34_7 = GetTips("MINUTE")
	local var_34_8 = GetTips("SECOND")

	if var_34_1 > 0 then
		var_34_0 = string.format("%s%s%02d:%02d:%02d", var_34_1, var_34_5, var_34_2, var_34_3, var_34_4)
	elseif var_34_2 > 0 then
		var_34_0 = string.format("%d:%02d:%02d", var_34_2, var_34_3, var_34_4)
	elseif var_34_3 > 0 then
		var_34_0 = string.format("%d:%02d:%02d", var_34_2, var_34_3, var_34_4)
	elseif var_34_4 > 0 then
		var_34_0 = string.format("%d:%02d:%02d", var_34_2, var_34_3, var_34_4)
	else
		var_34_0 = "--/--"
	end

	return var_34_0
end

function var_0_0.parseTimeForm(arg_35_0, arg_35_1)
	local var_35_0 = math.floor(arg_35_1 / 86400)
	local var_35_1 = math.fmod(math.floor(arg_35_1 / 3600), 24)
	local var_35_2 = math.fmod(math.floor(arg_35_1 / 60), 60)
	local var_35_3 = math.fmod(arg_35_1, 60)

	return var_35_0, var_35_1, var_35_2, var_35_3
end

function var_0_0.CalcMonthDays(arg_36_0, arg_36_1, arg_36_2)
	local var_36_0 = 30
	local var_36_1 = {
		1,
		3,
		5,
		7,
		8,
		10,
		12
	}

	if arg_36_2 == 2 then
		if arg_36_1 % 100 == 0 then
			var_36_0 = arg_36_1 % 400 == 0 and 29 or 28
		else
			var_36_0 = arg_36_1 % 4 == 0 and 29 or 28
		end
	elseif table.indexof(var_36_1, arg_36_2) then
		var_36_0 = 31
	end

	return var_36_0
end

function var_0_0.GetLostTimeStr(arg_37_0, arg_37_1, arg_37_2, arg_37_3)
	local var_37_0 = 1

	if arg_37_2 then
		var_37_0 = 0
	end

	local var_37_1 = arg_37_1 - arg_37_0:GetServerTime()
	local var_37_2 = math.floor(var_37_1 / 86400)
	local var_37_3 = math.fmod(math.floor(var_37_1 / 3600), 24)
	local var_37_4 = math.fmod(math.floor(var_37_1 / 60), 60)
	local var_37_5 = math.fmod(var_37_1, 60)

	if var_37_2 > 0 then
		return var_37_2 + var_37_0 .. GetTips("DAY")
	elseif var_37_3 > 0 then
		return var_37_3 + var_37_0 .. GetTips("HOUR")
	elseif var_37_4 > 0 then
		return var_37_4 + var_37_0 .. GetTips("MINUTE")
	elseif var_37_5 > 0 then
		return var_37_5 .. GetTips("SECOND")
	elseif arg_37_3 then
		return 1 .. GetTips("SECOND")
	else
		return GetTips("TIME_OUT")
	end
end

function var_0_0.GetLostTimeStr2(arg_38_0, arg_38_1, arg_38_2, arg_38_3)
	local var_38_0 = 1

	if arg_38_2 then
		var_38_0 = 0
	end

	local var_38_1 = arg_38_1 - arg_38_0:GetServerTime()
	local var_38_2 = math.floor(var_38_1 / 86400)
	local var_38_3 = math.fmod(math.floor(var_38_1 / 3600), 24)
	local var_38_4 = math.fmod(math.floor(var_38_1 / 60), 60)
	local var_38_5 = math.fmod(var_38_1, 60)

	if var_38_2 > 0 then
		return var_38_2 + var_38_0 .. GetTips("DAY")
	elseif var_38_3 > 0 then
		return var_38_3 + var_38_0 .. GetTips("HOUR")
	elseif var_38_4 > 0 then
		return var_38_4 + var_38_0 .. GetTips("MINUTE")
	elseif var_38_5 > 0 then
		return 1 .. GetTips("MINUTE")
	elseif arg_38_3 then
		return 1 .. GetTips("MINUTE")
	else
		return GetTips("TIME_OUT")
	end
end

function var_0_0.GetLostTimeStrWith2Unit(arg_39_0, arg_39_1, arg_39_2)
	if not arg_39_1 then
		return
	end

	local var_39_0 = arg_39_1 - arg_39_0:GetServerTime()
	local var_39_1 = math.floor(var_39_0 / 86400)
	local var_39_2 = math.fmod(math.floor(var_39_0 / 3600), 24)
	local var_39_3 = math.fmod(math.floor(var_39_0 / 60), 60)
	local var_39_4 = math.fmod(var_39_0, 60)
	local var_39_5 = ""
	local var_39_6 = GetTips("DAY")
	local var_39_7 = GetTips("HOUR")
	local var_39_8 = GetTips("MINUTE")
	local var_39_9 = GetTips("SECOND")

	if var_39_1 > 0 then
		var_39_5 = var_39_1 .. var_39_6 .. var_39_2 .. var_39_7
	elseif var_39_2 > 0 then
		var_39_5 = var_39_2 .. var_39_7 .. var_39_3 .. var_39_8
	elseif var_39_3 > 0 then
		var_39_5 = 0 .. var_39_7 .. var_39_3 .. var_39_8
	elseif var_39_4 > 0 then
		var_39_5 = 0 .. var_39_7 .. 1 .. var_39_8
	elseif arg_39_2 then
		var_39_5 = 0 .. var_39_7 .. 1 .. var_39_8
	else
		return GetTips("TIME_OUT")
	end

	return var_39_5
end

function var_0_0.GetLostTimeLongStr(arg_40_0, arg_40_1)
	local var_40_0 = arg_40_1 - arg_40_0:GetServerTime()
	local var_40_1 = math.floor(var_40_0 / 86400)
	local var_40_2 = math.fmod(math.floor(var_40_0 / 3600), 24)
	local var_40_3 = math.fmod(math.floor(var_40_0 / 60), 60)
	local var_40_4 = math.fmod(var_40_0, 60)
	local var_40_5 = ""
	local var_40_6 = GetTips("DAY")
	local var_40_7 = GetTips("HOUR")
	local var_40_8 = GetTips("MINUTE")
	local var_40_9 = GetTips("SECOND")

	if var_40_1 > 0 then
		var_40_5 = SpliceI18NText({
			var_40_1,
			var_40_6,
			string.format("%02d", var_40_2),
			var_40_7,
			string.format("%02d", var_40_3),
			var_40_8
		})
	elseif var_40_2 > 0 then
		var_40_5 = SpliceI18NText({
			string.format("%02d", var_40_2),
			var_40_7,
			string.format("%02d", var_40_3),
			var_40_8
		})
	elseif var_40_3 > 0 then
		var_40_5 = SpliceI18NText({
			string.format("%02d", var_40_3),
			var_40_8
		})
	elseif var_40_4 > 0 then
		var_40_5 = string.format("1%s", var_40_8)
	else
		var_40_5 = GetTips("TIME_OUT")
	end

	return var_40_5
end

function var_0_0.GetBeforeTimeStr(arg_41_0, arg_41_1)
	local var_41_0 = arg_41_0:GetServerTime() - arg_41_1
	local var_41_1 = math.floor(var_41_0 / 86400)
	local var_41_2 = math.fmod(math.floor(var_41_0 / 3600), 24)
	local var_41_3 = math.fmod(math.floor(var_41_0 / 60), 60)
	local var_41_4 = math.fmod(var_41_0, 60)

	if var_41_1 > 0 then
		return SpliceI18NText({
			var_41_1 + 1,
			GetTips("DAY"),
			GetTips("BEFORE")
		})
	elseif var_41_2 > 0 then
		return SpliceI18NText({
			var_41_2 + 1,
			GetTips("HOUR"),
			GetTips("BEFORE")
		})
	elseif var_41_3 > 0 then
		return SpliceI18NText({
			var_41_3 + 1,
			GetTips("MINUTE"),
			GetTips("BEFORE")
		})
	elseif var_41_4 > 0 then
		return SpliceI18NText({
			var_41_4,
			GetTips("SECOND"),
			GetTips("BEFORE")
		})
	else
		return GetTips("BLANK")
	end
end

function var_0_0.GetDeltaToday(arg_42_0)
	return arg_42_0:GetToday(manager.time:GetServerTime() - GameSetting.refresh_time1.value[1][1] * 3600)
end

function var_0_0.CheckIsToday(arg_43_0, arg_43_1, arg_43_2)
	local var_43_0 = arg_43_1 + var_0_4 - GameSetting.refresh_time1.value[1][1] * 3600
	local var_43_1 = arg_43_2 + var_0_4 - GameSetting.refresh_time1.value[1][1] * 3600

	return math.floor(var_43_0 / 86400) == math.floor(var_43_1 / 86400)
end

function var_0_0.GetNextFreshTime(arg_44_0)
	return arg_44_0:GetTodayFreshTime() + var_0_2
end

function var_0_0.GetTodayFreshTime(arg_45_0)
	local var_45_0 = arg_45_0:GetServerTime()

	if tonumber(arg_45_0:STimeDescS(var_45_0, "!%H")) < GameSetting.refresh_time1.value[1][1] then
		return manager.time:GetTimeByHMS(GameSetting.refresh_time1.value[1][1], 0, 0) - var_0_2
	else
		return manager.time:GetTimeByHMS(GameSetting.refresh_time1.value[1][1], 0, 0)
	end
end

function var_0_0.GetToday(arg_46_0, arg_46_1, arg_46_2)
	local var_46_0 = arg_46_1 or arg_46_0:GetServerTime()

	arg_46_2 = arg_46_2 or "!%d"

	return tonumber(arg_46_0:STimeDescS(var_46_0, arg_46_2))
end

function var_0_0.IsToday(arg_47_0, arg_47_1)
	local var_47_0 = arg_47_1 + var_0_4
	local var_47_1 = arg_47_0:GetServerTime() + var_0_4

	return math.floor(var_47_0 / 86400) == math.floor(var_47_1 / 86400)
end

function var_0_0.DiffDay(arg_48_0, arg_48_1, arg_48_2)
	return math.floor((arg_48_2 - arg_48_0._sAnchorTime) / var_0_2) - math.floor((arg_48_1 - arg_48_0._sAnchorTime) / var_0_2)
end

function var_0_0.DiffDay2(arg_49_0, arg_49_1, arg_49_2)
	local var_49_0
	local var_49_1 = math.floor(arg_49_1 / 86400)
	local var_49_2 = math.fmod(math.floor(arg_49_1 / 3600), 24)
	local var_49_3 = math.fmod(math.floor(arg_49_1 / 60), 60)
	local var_49_4 = math.fmod(arg_49_1, 60)
	local var_49_5 = math.floor(arg_49_2 / 86400)
	local var_49_6 = math.fmod(math.floor(arg_49_2 / 3600), 24)
	local var_49_7 = math.fmod(math.floor(arg_49_2 / 60), 60)
	local var_49_8 = math.fmod(arg_49_2, 60)

	return var_49_5 - var_49_1
end

function var_0_0.IsSameDay(arg_50_0, arg_50_1, arg_50_2)
	return math.floor((arg_50_1 - arg_50_0._sAnchorTime) / var_0_2) == math.floor((arg_50_2 - arg_50_0._sAnchorTime) / var_0_2)
end

function var_0_0.GetMonth(arg_51_0, arg_51_1, arg_51_2)
	local var_51_0 = arg_51_1 or arg_51_0:GetServerTime()

	arg_51_2 = arg_51_2 or "!%m"

	return tonumber(arg_51_0:STimeDescS(var_51_0, arg_51_2))
end

function var_0_0.GetMonthEn(arg_52_0, arg_52_1)
	local var_52_0 = tonumber(os.date("!%m", arg_52_1))

	if var_52_0 == 1 then
		return "Jan."
	end

	if var_52_0 == 2 then
		return "Feb."
	end

	if var_52_0 == 3 then
		return "Mar."
	end

	if var_52_0 == 4 then
		return "Apr."
	end

	if var_52_0 == 5 then
		return "May."
	end

	if var_52_0 == 6 then
		return "Jun."
	end

	if var_52_0 == 7 then
		return "Jul."
	end

	if var_52_0 == 8 then
		return "Aug."
	end

	if var_52_0 == 9 then
		return "Sep."
	end

	if var_52_0 == 10 then
		return "Oct."
	end

	if var_52_0 == 11 then
		return "Nov."
	end

	if var_52_0 == 12 then
		return "Dec."
	end
end

function var_0_0.FormatTime(arg_53_0, arg_53_1)
	local var_53_0 = tonumber(os.date("!%Y", arg_53_1))
	local var_53_1 = arg_53_0:GetServerTime()

	if var_53_0 ~= tonumber(os.date("!%Y", var_53_1)) then
		return os.date("%Y/%m/%d %H:%M", arg_53_1)
	elseif not arg_53_0:IsSameDay(arg_53_1, var_53_1) then
		return os.date("%m/%d %H:%M", arg_53_1)
	else
		return os.date("%H:%M", arg_53_1)
	end
end

function var_0_0.FormatChatTime(arg_54_0, arg_54_1)
	local var_54_0 = tonumber(os.date("!%Y", arg_54_1))
	local var_54_1 = arg_54_0:GetServerTime()

	if var_54_0 ~= tonumber(os.date("!%Y", var_54_1)) then
		return os.date("%Y/%m/%d", arg_54_1)
	elseif not arg_54_0:IsSameDay(arg_54_1, var_54_1) then
		return os.date("%m/%d", arg_54_1)
	else
		return os.date("%H:%M", arg_54_1)
	end
end

function var_0_0.GetOnLineText(arg_55_0, arg_55_1)
	if arg_55_1 == 0 then
		return GetTips("ONLINE")
	end

	local var_55_0 = arg_55_0:GetServerTime() - arg_55_1

	if var_55_0 < 3600 then
		return GetTips("FRIEND_ONLINE_TIME_WITHIN_AN_HOUR")
	elseif var_55_0 < 86400 then
		return GetTips("FRIEND_ONLINE_TIME_IN_ONE_DAY")
	elseif var_55_0 < 2592000 then
		local var_55_1 = var_55_0 / 86400

		return string.format(GetTips("FRIEND_ONLINE_TIME_ONE_DAY_AGO"), math.floor(var_55_1))
	else
		return string.format(GetTips("FRIEND_ONLINE_TIME_ONE_DAY_AGO"), 30)
	end
end

function var_0_0.CalcTimeZone(arg_56_0)
	local var_56_0 = os.time()

	return os.difftime(var_56_0, os.time(os.date("!*t", var_56_0)))
end

function var_0_0.GetTimeZone(arg_57_0)
	return arg_57_0.timeZero_
end

function var_0_0.GetDeltaTimeZone(arg_58_0)
	return arg_58_0.deltaTimeZero_
end

return var_0_0
