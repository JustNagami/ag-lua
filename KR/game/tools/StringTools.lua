local var_0_0 = require("cjson")

function wordSplit(arg_1_0)
	local var_1_0 = {}

	for iter_1_0 in arg_1_0.gmatch(arg_1_0, "[\x01-\x7F\xC2-\xF4][\x80-\xBF]*") do
		var_1_0[#var_1_0 + 1] = iter_1_0
	end

	return var_1_0
end

local var_0_1 = "-"
local var_0_2 = "."

function encodeUID(arg_2_0)
	local var_2_0 = tonumber(arg_2_0)

	if var_2_0 == nil then
		return ""
	end

	local var_2_1 = ""

	while var_2_0 > 0 do
		local var_2_2 = var_2_0 % 10
		local var_2_3 = ""

		for iter_2_0 = 3, 0, -1 do
			local var_2_4 = math.floor(var_2_2 / 2^iter_2_0)

			if var_2_4 == 0 then
				var_2_3 = var_2_3 .. var_0_2
			elseif var_2_4 == 1 then
				var_2_3 = var_2_3 .. var_0_1
			end

			var_2_2 = var_2_2 % 2^iter_2_0
		end

		var_2_1 = var_2_3 .. var_2_1
		var_2_0 = math.floor(var_2_0 / 10)
	end

	return var_2_1
end

local var_0_3 = 0

function WordVerifyBySDK(arg_3_0, arg_3_1, arg_3_2)
	local var_3_0 = string.gsub(arg_3_0, " ", "")
	local var_3_1 = 0

	if not OperationData:IsOperationOpen(OperationConst.MANUAL_WORD_VERIFY) then
		var_3_1 = wordVerify(var_3_0)
	end

	local var_3_2 = string.match(arg_3_0, "<.+>.*</.+>") ~= nil

	if var_3_2 then
		arg_3_1(not var_3_2)

		return
	end

	local var_3_3 = var_3_1 <= 0

	if GameToSDK.CURRENT_SDK_ID == SDK_PLATFORM.DEV then
		local var_3_4 = var_3_3 and ChatConst.VERIFY_STATUS.PASS or ChatConst.VERIFY_STATUS.LOCAL_NO_PASS

		SendJudgeResult(arg_3_2, arg_3_0, var_3_4, "")
		arg_3_1(var_3_3, var_3_4)

		return
	end

	if not var_3_3 then
		SendJudgeResult(arg_3_2, arg_3_0, ChatConst.VERIFY_STATUS.LOCAL_NO_PASS, "")
		arg_3_1(var_3_3, ChatConst.VERIFY_STATUS.LOCAL_NO_PASS)

		return
	end

	if not SDKTools.GetIsTw() then
		arg_3_1(true, ChatConst.VERIFY_STATUS.PASS)
	else
		local var_3_5 = var_0_0.encode({
			messageType = "CheckText",
			text = var_3_0
		})

		if var_0_3 == 0 then
			SetForceShowQuanquan(true)
		end

		var_0_3 = var_0_3 + 1

		SendMessageToSDKWithCallBack(var_3_5, "CheckTextResult", function(arg_4_0)
			local var_4_0 = arg_4_0.code
			local var_4_1 = arg_4_0.code == ChatConst.VERIFY_STATUS.PASS or arg_4_0.code == ChatConst.VERIFY_STATUS.OBSERVE

			print("callbackInfo.code", arg_4_0.code)
			print("callbackInfo.respInfo", arg_4_0.respInfo)
			print("callbackInfo.extraData", arg_4_0.extraData)

			if arg_4_0.code == ChatConst.VERIFY_STATUS.ERROR then
				var_4_1 = var_3_3
				var_4_0 = ChatConst.VERIFY_STATUS.OBSERVE
			end

			var_0_3 = var_0_3 - 1

			if var_0_3 == 0 then
				SetForceShowQuanquan(false)
			end

			SendJudgeResult(arg_3_2, arg_3_0, var_4_0, arg_4_0.respInfo or "")
			arg_3_1(var_4_1, var_4_0)
		end)
	end
end

function SendJudgeResult(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	if arg_5_0 then
		local var_5_0 = {
			type = arg_5_0,
			content = arg_5_1,
			shield_type = arg_5_2,
			report_json = arg_5_3 or ""
		}

		SDKAction.SendMessageToSDK("shield_log", var_5_0)
	end
end

function wordVerMatch(arg_6_0, arg_6_1, arg_6_2, arg_6_3, arg_6_4, arg_6_5, arg_6_6, arg_6_7)
	if arg_6_3 > #arg_6_0 then
		return arg_6_5, arg_6_6, arg_6_7
	end

	local var_6_0 = arg_6_0[arg_6_3]
	local var_6_1

	for iter_6_0, iter_6_1 in ipairs(arg_6_1) do
		if var_6_1 then
			table.deepMerge(var_6_1, iter_6_1[var_6_0] or {})
		else
			var_6_1 = var_6_1 or iter_6_1[var_6_0]
		end
	end

	if var_6_1 then
		if var_6_1.result then
			if arg_6_2.isReplace then
				return wordVerMatch(arg_6_0, {
					var_6_1
				}, arg_6_2, arg_6_3 + 1, arg_6_4 .. arg_6_2.replaceWord, true, arg_6_3 + 1, arg_6_4 .. arg_6_2.replaceWord)
			else
				return wordVerMatch(arg_6_0, {
					var_6_1
				}, arg_6_2, arg_6_3 + 1, arg_6_4, true, arg_6_3 + 1, arg_6_4)
			end
		elseif arg_6_2.isReplace then
			return wordVerMatch(arg_6_0, {
				var_6_1
			}, arg_6_2, arg_6_3 + 1, arg_6_4 .. arg_6_2.replaceWord, arg_6_5, arg_6_6, arg_6_7)
		else
			return wordVerMatch(arg_6_0, {
				var_6_1
			}, arg_6_2, arg_6_3 + 1, arg_6_4, arg_6_5, arg_6_6, arg_6_7)
		end
	else
		return arg_6_5, arg_6_6, arg_6_7
	end
end

function isContainChineseNumEnglish(arg_7_0)
	local var_7_0 = 1

	while var_7_0 <= #arg_7_0 do
		local var_7_1 = string.byte(arg_7_0, var_7_0)

		if var_7_1 >= 48 and var_7_1 <= 57 or var_7_1 >= 65 and var_7_1 <= 90 or var_7_1 >= 97 and var_7_1 <= 122 then
			var_7_0 = var_7_0 + 1
		else
			if #arg_7_0 - var_7_0 <= 1 then
				return false
			end

			local var_7_2 = string.byte(arg_7_0, var_7_0 + 1)
			local var_7_3 = string.byte(arg_7_0, var_7_0 + 2)
			local var_7_4 = 14989440
			local var_7_5 = 15318693
			local var_7_6 = var_7_3 + var_7_2 * 256 + var_7_1 * 65536

			if var_7_6 < var_7_4 or var_7_5 < var_7_6 then
				return false
			else
				var_7_0 = var_7_0 + 3
			end
		end
	end

	return true
end

function textLimit(arg_8_0, arg_8_1)
	local var_8_0 = 1
	local var_8_1 = 0

	while var_8_0 <= #arg_8_0 do
		local var_8_2 = 0
		local var_8_3 = getByteLength(string.byte(arg_8_0, var_8_0))
		local var_8_4 = 0

		for iter_8_0 = 0, var_8_3 - 1 do
			local var_8_5 = string.byte(arg_8_0, var_8_0 + iter_8_0)

			var_8_4 = var_8_4 * 256 + var_8_5
		end

		local var_8_6 = isNumOrEn(var_8_4) and 1 or isChinese(var_8_4) and 2 or isJanpanese(var_8_4) and 2 or isKorean(var_8_4) and 2 or isSymbolForTwoWord(var_8_4) and 2 or isSymbolForOneWord(var_8_4) and 1 or 1

		if arg_8_1 < var_8_1 + var_8_6 then
			return string.sub(arg_8_0, 1, var_8_0 - 1), false
		end

		var_8_0 = var_8_0 + var_8_3
		var_8_1 = var_8_1 + var_8_6
	end

	return arg_8_0, true
end

function getByteLength(arg_9_0)
	if arg_9_0 >= 0 and arg_9_0 <= 127 then
		return 1
	elseif arg_9_0 >= 192 and arg_9_0 <= 223 then
		return 2
	elseif arg_9_0 >= 224 and arg_9_0 <= 239 then
		return 3
	elseif arg_9_0 >= 240 and arg_9_0 <= 247 then
		return 4
	else
		print("不是一个字符开头！")
	end
end

function isNumOrEn(arg_10_0)
	return arg_10_0 >= 48 and arg_10_0 <= 57 or arg_10_0 >= 65 and arg_10_0 <= 90 or arg_10_0 >= 97 and arg_10_0 <= 122
end

function isFullNumOrEn(arg_11_0)
	return isNumOrEn(arg_11_0 - 65248)
end

function isMars()
	return
end

function isChinese(arg_13_0)
	local var_13_0 = 14989440
	local var_13_1 = 15318693

	return var_13_0 <= arg_13_0 and arg_13_0 <= var_13_1
end

function isEnglish(arg_14_0)
	return arg_14_0 >= 65 and arg_14_0 <= 90 or arg_14_0 >= 97 and arg_14_0 <= 122
end

function isJanpanese(arg_15_0)
	local var_15_0 = 14909825
	local var_15_1 = 14910399
	local var_15_2 = 14911408
	local var_15_3 = 14911423

	return var_15_0 <= arg_15_0 and arg_15_0 <= var_15_1 or var_15_2 <= arg_15_0 and arg_15_0 <= var_15_3
end

function isKorean(arg_16_0)
	local var_16_0 = 15380608
	local var_16_1 = 15572655
	local var_16_2 = 14779520
	local var_16_3 = 14780303
	local var_16_4 = 14910640
	local var_16_5 = 14911119

	return var_16_0 <= arg_16_0 and arg_16_0 <= var_16_1 or var_16_2 <= arg_16_0 and arg_16_0 <= var_16_3 or var_16_4 <= arg_16_0 and arg_16_0 <= var_16_5
end

function isSymbol(arg_17_0)
	local var_17_0 = 14909568
	local var_17_1 = 14909631
	local var_17_2 = 15711360
	local var_17_3 = 15712175
	local var_17_4 = 14844032
	local var_17_5 = 14844335
	local var_17_6 = 32
	local var_17_7 = 127
	local var_17_8 = 49824
	local var_17_9 = 50111

	return var_17_0 <= arg_17_0 and arg_17_0 <= var_17_1 or var_17_2 <= arg_17_0 and arg_17_0 <= var_17_3 or var_17_4 <= arg_17_0 and arg_17_0 <= var_17_5 or var_17_6 <= arg_17_0 and arg_17_0 <= var_17_7 or var_17_8 <= arg_17_0 and arg_17_0 <= var_17_9 or arg_17_0 >= 48 and arg_17_0 <= 57 or arg_17_0 >= 65 and arg_17_0 <= 90 or arg_17_0 >= 97 and arg_17_0 <= 122
end

function isSymbolForOneWord(arg_18_0)
	local var_18_0 = 32
	local var_18_1 = 127
	local var_18_2 = 49824
	local var_18_3 = 50111

	return var_18_0 <= arg_18_0 and arg_18_0 <= var_18_1 or var_18_2 <= arg_18_0 and arg_18_0 <= var_18_3 or arg_18_0 >= 48 and arg_18_0 <= 57 or arg_18_0 >= 65 and arg_18_0 <= 90 or arg_18_0 >= 97 and arg_18_0 <= 122
end

function isSymbolForTwoWord(arg_19_0)
	local var_19_0 = 14909568
	local var_19_1 = 14909631
	local var_19_2 = 15711360
	local var_19_3 = 15712175
	local var_19_4 = 14844032
	local var_19_5 = 14844335

	return var_19_0 <= arg_19_0 and arg_19_0 <= var_19_1 or var_19_2 <= arg_19_0 and arg_19_0 <= var_19_3 or var_19_4 <= arg_19_0 and arg_19_0 <= var_19_5 or arg_19_0 >= 48 and arg_19_0 <= 57 or arg_19_0 >= 65 and arg_19_0 <= 90 or arg_19_0 >= 97 and arg_19_0 <= 122
end

function nameRule(arg_20_0, arg_20_1)
	local var_20_0 = GameToSDK.CURRENT_SERVER
	local var_20_1 = AreaDifferenceCfg[var_20_0]

	if var_20_1 then
		local var_20_2 = 1

		while var_20_2 <= #arg_20_0 do
			local var_20_3 = getByteLength(string.byte(arg_20_0, var_20_2))
			local var_20_4 = 0

			for iter_20_0 = 0, var_20_3 - 1 do
				local var_20_5 = string.byte(arg_20_0, var_20_2 + iter_20_0)

				var_20_4 = var_20_4 * 256 + var_20_5
			end

			local var_20_6 = false
			local var_20_7 = var_20_1.language_sent

			if isChinese(var_20_4) then
				var_20_6 = table.indexof(var_20_7, 0) ~= false
			elseif isJanpanese(var_20_4) then
				var_20_6 = table.indexof(var_20_7, 1) ~= false
			elseif isEnglish(var_20_4) then
				var_20_6 = table.indexof(var_20_7, 2) ~= false
			elseif isKorean(var_20_4) then
				var_20_6 = table.indexof(var_20_7, 3) ~= false
			elseif var_20_4 >= 48 and var_20_4 <= 57 then
				var_20_6 = true
			elseif arg_20_1 then
				var_20_6 = isSymbol(var_20_4)
			end

			if not var_20_6 then
				return false
			end

			var_20_2 = var_20_2 + var_20_3
		end

		return true
	else
		print("未定义命名规则 area = ", var_20_0)

		return false
	end
end

function filterEgyUnicode(arg_21_0)
	arg_21_0 = string.gsub(arg_21_0, "\xF0\x93[\x80-\x8F][\x80-\xBF]", "")
	arg_21_0 = string.gsub(arg_21_0, "\xF0\x93\x90[\x80-\xAF]", "")

	return arg_21_0
end

function wordVerify(arg_22_0, arg_22_1)
	arg_22_1 = arg_22_1 or {}

	local var_22_0 = filterEgyUnicode(arg_22_0)

	if #var_22_0 ~= #arg_22_0 then
		if arg_22_1.isReplace then
			arg_22_0 = var_22_0
		else
			return 1
		end
	end

	local var_22_1 = wordSplit(arg_22_0)
	local var_22_2 = {
		WordVerifyCfg,
		WordVerifyCfg2,
		WordVerifyCfg3,
		WordVerifyCfg4,
		WordVerifyCfg5,
		WordVerifyCfg6,
		WordVerifyCfg7,
		WordVerifyCfg8,
		WordVerifyCfg9,
		WordVerifyCfg10
	}

	arg_22_1.isReplace = arg_22_1.isReplace or false
	arg_22_1.replaceWord = arg_22_1.replaceWord or "*"

	local var_22_3 = #var_22_1
	local var_22_4 = 1
	local var_22_5 = ""
	local var_22_6 = 0

	while var_22_4 <= var_22_3 do
		local var_22_7, var_22_8, var_22_9 = wordVerMatch(var_22_1, var_22_2, arg_22_1, var_22_4, "", false, var_22_4, "")

		if var_22_7 then
			var_22_4 = var_22_8
			var_22_6 = var_22_6 + 1

			if arg_22_1.isReplace then
				var_22_5 = var_22_5 .. var_22_9
			end
		else
			if arg_22_1.isReplace then
				var_22_5 = var_22_5 .. var_22_1[var_22_4]
			end

			var_22_4 = var_22_4 + 1
		end
	end

	if arg_22_1.isReplace then
		return var_22_6, var_22_5
	else
		return var_22_6
	end
end

function shortenString(arg_23_0, arg_23_1)
	local var_23_0 = 0
	local var_23_1 = 0
	local var_23_2 = 0
	local var_23_3 = #arg_23_0

	while var_23_0 < var_23_3 do
		local var_23_4 = string.byte(arg_23_0, var_23_0 + 1)
		local var_23_5 = 1

		if var_23_4 < 128 then
			var_23_0 = var_23_0 + 1
		elseif var_23_4 >= 192 and var_23_4 < 224 then
			var_23_0 = var_23_0 + 2
		elseif var_23_4 >= 224 and var_23_4 < 240 then
			var_23_0 = var_23_0 + 3
		elseif var_23_4 >= 240 and var_23_4 < 248 then
			var_23_0 = var_23_0 + 4
		elseif var_23_4 >= 248 and var_23_4 < 252 then
			var_23_0 = var_23_0 + 5
		elseif var_23_4 >= 252 and var_23_4 < 254 then
			var_23_0 = var_23_0 + 6
		else
			error("invalid utf8 string")
		end

		var_23_1 = var_23_1 + var_23_5

		if arg_23_1 <= var_23_1 then
			var_23_2 = var_23_0

			break
		end
	end

	if var_23_2 == 0 or var_23_2 == var_23_3 then
		return arg_23_0
	end

	return string.sub(arg_23_0, 1, var_23_2) .. ".."
end

function fixColor(arg_24_0, arg_24_1)
	return "<color=" .. arg_24_1 .. ">" .. arg_24_0 .. "</color>"
end

function strrchr(arg_25_0, arg_25_1)
	local var_25_0 = string.reverse(arg_25_0)
	local var_25_1 = string.reverse(arg_25_1)
	local var_25_2, var_25_3 = string.find(var_25_0, var_25_1)

	if var_25_2 then
		return #arg_25_0 - var_25_3 + 1, #arg_25_0 - var_25_2 + 1
	else
		return 0, 0
	end
end

function IsAllSpace(arg_26_0)
	local var_26_0, var_26_1 = string.find(arg_26_0, "%s*")

	return var_26_0 == 1 and var_26_1 == string.len(arg_26_0)
end

function StringCount(arg_27_0)
	if not arg_27_0 or type(arg_27_0) ~= "string" or #arg_27_0 <= 0 then
		return nil
	end

	local var_27_0 = 0
	local var_27_1 = 1

	repeat
		local var_27_2 = string.byte(arg_27_0, var_27_1)
		local var_27_3 = 1

		var_27_1 = var_27_1 + (var_27_2 > 239 and 4 or var_27_2 > 223 and 3 or var_27_2 > 128 and 2 or 1)
		var_27_0 = var_27_0 + 1
	until var_27_1 > #arg_27_0

	return var_27_0
end

function ExStringCount(arg_28_0)
	if not arg_28_0 or type(arg_28_0) ~= "string" or #arg_28_0 <= 0 then
		return nil
	end

	local var_28_0 = 0
	local var_28_1 = 1

	repeat
		local var_28_2 = string.byte(arg_28_0, var_28_1)
		local var_28_3 = 1

		if var_28_2 > 239 then
			var_28_3 = 4
			var_28_0 = var_28_0 + 2
		elseif var_28_2 > 223 then
			var_28_3 = 3
			var_28_0 = var_28_0 + 2
		elseif var_28_2 > 128 then
			var_28_3 = 2
			var_28_0 = var_28_0 + 1
		else
			var_28_3 = 1
			var_28_0 = var_28_0 + 1
		end

		var_28_1 = var_28_1 + var_28_3
	until var_28_1 > #arg_28_0

	return var_28_0
end

function replaceSensitiveWordAll(arg_29_0, arg_29_1)
	local var_29_0 = arg_29_0
	local var_29_1 = replaceSensitiveWord(arg_29_0, arg_29_1)

	while var_29_0 ~= var_29_1 do
		var_29_0 = var_29_1
		var_29_1 = replaceSensitiveWord(var_29_1, arg_29_1)
	end

	return var_29_1
end

function replaceSensitiveWord(arg_30_0, arg_30_1)
	local var_30_0 = arg_30_0
	local var_30_1, var_30_2 = string.find(arg_30_0, arg_30_1, 1, true)

	if var_30_1 and var_30_2 then
		local var_30_3 = string.len(arg_30_0)
		local var_30_4 = getWordCount(arg_30_1)
		local var_30_5 = ""

		for iter_30_0 = 1, var_30_4 do
			var_30_5 = var_30_5 .. "*"
		end

		if var_30_1 == 1 then
			var_30_0 = var_30_5 .. string.sub(arg_30_0, var_30_2 + 1, -1)
		elseif var_30_2 == var_30_3 then
			var_30_0 = string.sub(arg_30_0, 1, var_30_1 - 1) .. var_30_5
		else
			local var_30_6 = string.sub(arg_30_0, 1, var_30_1 - 1)
			local var_30_7 = string.sub(arg_30_0, var_30_2 + 1, -1)

			var_30_0 = var_30_6 .. var_30_5 .. var_30_7
		end
	end

	return var_30_0
end

function getWordCount(arg_31_0)
	local var_31_0, var_31_1 = string.gsub(arg_31_0, "[^\x80-\xC1]", "")

	return var_31_1
end

symbolTable = {
	"！",
	"（",
	"）",
	"，",
	"．",
	"：",
	"；",
	"？"
}

function containSymbol(arg_32_0)
	local var_32_0 = string.find(arg_32_0, "%p") ~= nil

	if not var_32_0 then
		local var_32_1 = wordSplit(arg_32_0)

		for iter_32_0, iter_32_1 in ipairs(var_32_1) do
			if table.keyof(symbolTable, iter_32_1) then
				return true
			end
		end
	end

	return var_32_0
end

function getWordTable(arg_33_0)
	local function var_33_0(arg_34_0)
		local var_34_0 = {
			0,
			192,
			224,
			240
		}

		for iter_34_0 = #var_34_0, 1, -1 do
			if arg_34_0 >= var_34_0[iter_34_0] then
				return iter_34_0
			end
		end

		return 1
	end

	local var_33_1 = {}
	local var_33_2 = 1
	local var_33_3 = 0

	while var_33_2 <= string.len(arg_33_0) do
		local var_33_4 = var_33_0(string.byte(arg_33_0, var_33_2))

		table.insert(var_33_1, string.sub(arg_33_0, var_33_2, var_33_2 + var_33_4 - 1))

		var_33_2 = var_33_2 + var_33_4
	end

	return var_33_1
end

function dealEnter(arg_35_0)
	local var_35_0 = arg_35_0.transform:GetComponent("InputField")

	if not var_35_0 then
		print("缺少组件！！！")
	end

	var_35_0.onValueChanged:AddListener(function(arg_36_0)
		var_35_0.text = string.gsub(arg_36_0, "\n", "")
	end)
end

function chsize(arg_37_0)
	if not arg_37_0 then
		return 0
	elseif arg_37_0 > 240 then
		return 4
	elseif arg_37_0 > 225 then
		return 3
	elseif arg_37_0 > 192 then
		return 2
	else
		return 1
	end
end

function utf8sub(arg_38_0, arg_38_1, arg_38_2)
	local var_38_0 = 1

	while arg_38_1 > 1 do
		local var_38_1 = string.byte(arg_38_0, var_38_0)

		var_38_0 = var_38_0 + chsize(var_38_1)
		arg_38_1 = arg_38_1 - 1
	end

	local var_38_2 = var_38_0

	while arg_38_2 > 0 and var_38_2 <= #arg_38_0 do
		local var_38_3 = string.byte(arg_38_0, var_38_2)

		var_38_2 = var_38_2 + chsize(var_38_3)
		arg_38_2 = arg_38_2 - 1
	end

	return arg_38_0:sub(var_38_0, var_38_2 - 1), arg_38_2
end

function utf8len(arg_39_0)
	local var_39_0 = 0
	local var_39_1 = 1

	while var_39_1 <= #arg_39_0 do
		local var_39_2 = string.byte(arg_39_0, var_39_1)

		var_39_1 = var_39_1 + chsize(var_39_2)
		var_39_0 = var_39_0 + 1
	end

	return var_39_0
end

function formatNumber(arg_40_0)
	if arg_40_0 == nil or type(arg_40_0) ~= "number" then
		return arg_40_0
	elseif arg_40_0 < 10000 then
		return arg_40_0
	end

	if arg_40_0 < 10000000 then
		return math.floor(arg_40_0 / 1000) .. "K"
	elseif arg_40_0 < 10000000000 then
		return math.floor(arg_40_0 / 1000000) .. "M"
	elseif arg_40_0 < 10000000000000 then
		return math.floor(arg_40_0 / 1000000000) .. "B"
	elseif arg_40_0 < 1e+16 then
		return math.floor(arg_40_0 / 1000000000000) .. "T"
	else
		return arg_40_0
	end
end
