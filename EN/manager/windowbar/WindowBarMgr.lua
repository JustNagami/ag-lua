local var_0_0 = class("WindowBarMgr", import("game.extend.ReduxView"))
local var_0_1 = import("manager.windowBar.WindowCurrencyItem")
local var_0_2 = import("manager.windowBar.WindowMaterialItem")
local var_0_3 = import("manager.windowBar.WindowActivityMatrixCoinItem")
local var_0_4 = import("manager.windowBar.WindowActivityCoinItem")
local var_0_5 = import("manager.windowBar.WindowPopTipsItem")

BACK_BAR = "BACK_BAR"
HOME_BAR = "HOME_BAR"
NAVI_BAR = "NAVI_BAR"
INFO_BAR = "INFO_BAR"
EXTRA_BAR = "EXTRA_BAR"
INVITE_BAR = "INVITE_BAR"
ACTIVITY_MATRIX_COIN = "ACTIVITY_MATRIX_COIN"
ACTIVITY_COIN = "ACTIVITY_COIN"

local var_0_6

function var_0_0.UIName(arg_1_0)
	return "Widget/System/Com_dynamic/WindowBarUI"
end

function var_0_0.OnCtor(arg_2_0)
	print("Initialize Window")
end

function var_0_0.Init(arg_3_0)
	arg_3_0.lastBarList_ = {}
	arg_3_0.lastAddBarList_ = {}
	arg_3_0.lastCanClickBarList_ = {}
	arg_3_0.styleInfo_ = {}
	arg_3_0.lastStyleInfo_ = {}

	arg_3_0:InitUI()
	arg_3_0:AddListeners()

	arg_3_0.windowPopTipsItemView_ = var_0_5.New(arg_3_0.goTips_)
end

function var_0_0.InitUI(arg_4_0)
	arg_4_0.gameObject_ = GameObject.Instantiate(Asset.Load(arg_4_0:UIName()), manager.ui.uiPop.transform)
	arg_4_0.transform_ = arg_4_0.gameObject_.transform

	arg_4_0:BindCfgUI()
	arg_4_0:AdaptScreen()

	arg_4_0.barGo_ = {}
	arg_4_0.barGo_[HOME_BAR] = arg_4_0.homeBtn_.gameObject
	arg_4_0.barGo_[BACK_BAR] = arg_4_0.backBtn_.gameObject
	arg_4_0.barGo_[INFO_BAR] = arg_4_0.infoBtn_.gameObject
	arg_4_0.isShow_ = false
	arg_4_0.cooperationInviteTip_ = CooperationInviteTipItem.New(arg_4_0.m_cooperationInviteTip)
end

function var_0_0.SetWhereTag(arg_5_0, arg_5_1)
	var_0_6 = arg_5_1
end

function var_0_0.ClearWhereTag(arg_6_0)
	var_0_6 = nil
end

function var_0_0.GetWhereTag(arg_7_0)
	return var_0_6
end

function var_0_0.AddListeners(arg_8_0)
	arg_8_0:AddBtnListener(arg_8_0.homeBtn_, nil, function()
		OperationRecorder.Record(gameContext:GetLastOpenPage(), "homeBtn")

		if arg_8_0.homeFunc_ then
			arg_8_0.homeFunc_()
		elseif var_0_6 == "chess" then
			gameContext:Go("/warHome")
		elseif var_0_6 == "canteen" then
			gameContext:Go("/restaurantMain")
		elseif var_0_6 == "dorm" then
			gameContext:Go("/dorm")
		elseif var_0_6 == "newchess" then
			NewChessTools.ExitNewChessScene(true)
		elseif var_0_6 == "guildActivity" then
			local var_9_0 = GuildActivityData:GetCurrentGrid()
			local var_9_1

			if var_9_0 ~= nil and var_9_0 > 0 then
				local var_9_2 = ActivityClubCfg[var_9_0].map_id

				var_9_1 = table.indexof(ActivityClubMapCfg.all, var_9_2)
			else
				var_9_1 = 1
			end

			gameContext:Go("/guildActivityWarField", {
				level = var_9_1,
				activityID = ActivityConst.GUILD_ACTIVITY_START
			})
		elseif var_0_6 == "guildActivitySP" then
			local var_9_3 = GuildActivitySPData:GetCurrentGrid()
			local var_9_4

			if var_9_3 ~= nil and var_9_3 > 0 then
				local var_9_5 = ActivityClubSPCfg[var_9_3].map_id
				local var_9_6 = GuildActivitySPData:GetCurRunActivityID()
				local var_9_7 = ActivityClubSPMapCfg.get_id_list_by_activity[var_9_6]

				var_9_4 = table.indexof(var_9_7, var_9_5)
			else
				var_9_4 = 1
			end

			local var_9_8 = GuildActivitySPData:GetCurRunActivityID()

			gameContext:Go("/guildActivitySPWarField", {
				level = var_9_4,
				activityID = var_9_8,
				totalActivityID = var_9_8
			})
		elseif var_0_6 == "minigame" then
			DormMinigame.Exit()
		elseif whereami == "battleResult" then
			DestroyLua()
			LuaExchangeHelper.GoToMain()
			OpenPageUntilLoaded("/home")
		elseif var_0_6 == "danceGame" then
			gameContext:Go("/idolTraineeCamp")
		else
			gameContext:Go("/home", nil, nil, true)
		end
	end)
	arg_8_0:AddBtnListener(arg_8_0.backBtn_, nil, function()
		OperationRecorder.Record(gameContext:GetLastOpenPage(), "backBtn")
		arg_8_0:CallBackFunc()
	end)
	arg_8_0:AddBtnListener(arg_8_0.infoBtn_, nil, function()
		OperationRecorder.Record(gameContext:GetLastOpenPage(), "infoBtn")

		if arg_8_0.infoFunc_ then
			arg_8_0.infoFunc_()
		elseif type(arg_8_0.gameHelpKey) == "table" then
			if arg_8_0.gameHelpKey.type == "jump" then
				local var_11_0 = arg_8_0.gameHelpKey.view
				local var_11_1 = arg_8_0.gameHelpKey.params

				JumpTools.OpenPageByJump(var_11_0, var_11_1)
			end
		else
			local var_11_2 = GetTips(arg_8_0.gameHelpKey)

			JumpTools.OpenPageByJump("gameHelp", {
				icon = "icon_i",
				iconColor = Color(1, 1, 1),
				title = GetTips("STAGE_DESCRIPE"),
				content = var_11_2,
				key = arg_8_0.gameHelpKey
			})
		end
	end)
	arg_8_0:AddBtnListener(arg_8_0.bgBtn_, nil, function()
		arg_8_0:StopTimer()
		SetActive(arg_8_0.countdownGo_, false)
		SetActive(arg_8_0.bgBtn_.gameObject, false)
	end)
end

function var_0_0.SetGameHelpKey(arg_13_0, arg_13_1)
	arg_13_0.gameHelpKey = arg_13_1
end

function var_0_0.RegistExtraTextAndCallBack(arg_14_0, arg_14_1, arg_14_2)
	arg_14_0.clickExtraFunc_ = arg_14_2
end

function var_0_0.GetBackBtnIsShow(arg_15_0)
	if arg_15_0.barGo_ == nil or arg_15_0.barGo_[BACK_BAR] == nil then
		return false
	end

	return arg_15_0.barGo_[BACK_BAR].activeInHierarchy
end

function var_0_0.CallBackFunc(arg_16_0)
	if arg_16_0.backFunc_ then
		arg_16_0.backFunc_()
	else
		JumpTools.Back()
	end
end

local var_0_7 = {
	BACK_BAR,
	HOME_BAR
}

function var_0_0.GetBackBtnIsShow(arg_17_0)
	if arg_17_0.barGo_ == nil or arg_17_0.barGo_[BACK_BAR] == nil then
		return false
	end

	return arg_17_0.barGo_[BACK_BAR].activeInHierarchy
end

function var_0_0.CallBackFunc(arg_18_0)
	if arg_18_0.backFunc_ then
		arg_18_0.backFunc_()
	else
		JumpTools.Back()
	end
end

function var_0_0.SwitchBar(arg_19_0, arg_19_1, arg_19_2, arg_19_3)
	if isNil(arg_19_0.gameObject_) then
		arg_19_0:Init()
	end

	if arg_19_2 then
		arg_19_0:HideBar()
	end

	SetActive(arg_19_0.gameObject_, true)

	arg_19_0.isShow_ = true
	arg_19_1 = arg_19_1 or var_0_7
	arg_19_0.lastStyleInfo_ = arg_19_0.styleInfo_ or arg_19_0.lastStyleInfo_ or {}
	arg_19_0.styleInfo_ = arg_19_3 or {}

	if CooperationData:CheckInRoom() then
		local var_19_0 = {}

		for iter_19_0, iter_19_1 in ipairs(arg_19_1) do
			if iter_19_1 == BACK_BAR or iter_19_1 == INFO_BAR then
				table.insert(var_19_0, iter_19_1)
			end
		end

		arg_19_1 = var_19_0
	end

	for iter_19_2, iter_19_3 in ipairs(arg_19_1) do
		if iter_19_3 == HOME_BAR then
			if manager.guide:IsPlaying() and whereami == "battleResult" then
				arg_19_0:SetActive(arg_19_0.barGo_[iter_19_3], false)
			else
				arg_19_0:SetActive(arg_19_0.barGo_[iter_19_3], true)
			end
		elseif iter_19_3 == BACK_BAR or iter_19_3 == INFO_BAR then
			var_0_0:SetActive(arg_19_0.barGo_[iter_19_3], true)
		elseif iter_19_3 == EXTRA_BAR or iter_19_3 == NAVI_BAR then
			-- block empty
		elseif iter_19_3 == ACTIVITY_MATRIX_COIN then
			local var_19_1 = arg_19_0:getOrAddBarGo_(iter_19_3, arg_19_0.styleInfo_)

			var_0_0:SetActive(var_19_1, true)
			var_19_1:SetCanAdd(false)
		elseif iter_19_3 == ACTIVITY_COIN then
			local var_19_2 = arg_19_0:getOrAddBarGo_(iter_19_3, arg_19_0.styleInfo_)

			var_0_0:SetActive(var_19_2, true)
			var_19_2:SetCanAdd(false)
			var_19_2:SetType("black")
		elseif iter_19_3 == INVITE_BAR then
			if arg_19_0.cooperationInviteTip_ then
				arg_19_0.cooperationInviteTip_:Show()
			end
		elseif ItemCfg[iter_19_3] and ItemCfg[iter_19_3].type == ItemConst.ITEM_TYPE.MATERIAL then
			local var_19_3 = arg_19_0:getOrAddBarGo_(iter_19_3, arg_19_0.styleInfo_)

			var_0_0:SetActive(var_19_3, true)
			var_19_3:SetCanAdd(false)
		else
			local var_19_4 = arg_19_0:getOrAddBarGo_(iter_19_3, arg_19_0.styleInfo_)

			var_0_0:SetActive(var_19_4, true)
			var_19_4:SetCanAdd(false)
		end
	end

	local var_19_5 = arg_19_0:getMappedBarList_(arg_19_1, arg_19_0.styleInfo_)
	local var_19_6 = arg_19_0:getMappedBarList_(arg_19_0.lastBarList_, arg_19_0.lastStyleInfo_)

	for iter_19_4, iter_19_5 in ipairs(var_19_6) do
		if not table.keyof(var_19_5, iter_19_5) and arg_19_0.barGo_[iter_19_5] then
			var_0_0:SetActive(arg_19_0.barGo_[iter_19_5], false)
		end
	end

	if AreaDifferenceCfg[GameToSDK.CURRENT_SERVER].payment == 0 then
		var_0_0:SetActive(arg_19_0.barGo_[CurrencyConst.GetPlatformDiamondId()], false)
	end

	arg_19_0.lastBarList_ = arg_19_1
	arg_19_0.lastAddBarList_ = {}
	arg_19_0.lastCanClickBarList_ = {}
end

function var_0_0.RegistHomeCallBack(arg_20_0, arg_20_1)
	arg_20_0.homeFunc_ = arg_20_1
	arg_20_0.lastHomeFunc_ = arg_20_1
end

function var_0_0.RegistBackCallBack(arg_21_0, arg_21_1)
	arg_21_0.backFunc_ = arg_21_1
	arg_21_0.lastBackFunc_ = arg_21_1
end

function var_0_0.RegistInfoCallBack(arg_22_0, arg_22_1)
	arg_22_0.infoFunc_ = arg_22_1
	arg_22_0.lastInfoFunc_ = arg_22_1
end

function var_0_0.SetBarCanAdd(arg_23_0, arg_23_1, arg_23_2)
	local var_23_0 = arg_23_0.barGo_[arg_23_0:getMappedKey_(arg_23_1, arg_23_0.styleInfo_)]

	if var_23_0 then
		var_23_0:SetCanAdd(arg_23_2)

		if arg_23_2 then
			table.insert(arg_23_0.lastAddBarList_, arg_23_1)
		end
	end
end

function var_0_0.SetActivityId(arg_24_0, arg_24_1, arg_24_2)
	local var_24_0 = arg_24_0.barGo_[arg_24_0:getMappedKey_(arg_24_1, arg_24_0.styleInfo_)]

	if var_24_0 and var_24_0.SetActivityId then
		var_24_0:SetActivityId(arg_24_2)
	end
end

function var_0_0.SetBarCanClick(arg_25_0, arg_25_1, arg_25_2)
	local var_25_0 = arg_25_0.barGo_[arg_25_0:getMappedKey_(arg_25_1, arg_25_0.styleInfo_)]

	if var_25_0 then
		var_25_0:SetCanClick(arg_25_2)

		if arg_25_2 then
			table.insert(arg_25_0.lastCanClickBarList_, arg_25_1)
		end
	end
end

function var_0_0.SetAsLastSibling(arg_26_0)
	arg_26_0.transform_:SetAsLastSibling()
end

function var_0_0.SetAsFirstSibling(arg_27_0)
	arg_27_0.transform_:SetAsFirstSibling()
end

function var_0_0.HideBar(arg_28_0)
	arg_28_0.homeFunc_ = nil
	arg_28_0.backFunc_ = nil
	arg_28_0.infoFunc_ = nil

	SetActive(arg_28_0.gameObject_, false)

	if arg_28_0.windowPopTipsItemView_ then
		arg_28_0.windowPopTipsItemView_:Hide()
	end

	if arg_28_0.cooperationInviteTip_ then
		arg_28_0.cooperationInviteTip_:Hide()
	end

	arg_28_0.isShow_ = false

	arg_28_0:UnBindListener()

	arg_28_0.lastStyleInfo_ = arg_28_0.styleInfo_
	arg_28_0.styleInfo_ = nil
end

function var_0_0.GetIsShow(arg_29_0)
	return arg_29_0.isShow_
end

function var_0_0.GetLastHomeFunc(arg_30_0)
	return arg_30_0.lastHomeFunc_
end

function var_0_0.GetLastBackFunc(arg_31_0)
	return arg_31_0.lastBackFunc_
end

function var_0_0.GetLastInfoFunc(arg_32_0)
	return arg_32_0.lastInfoFunc_
end

function var_0_0.GetLastBarList(arg_33_0)
	return arg_33_0.lastBarList_
end

function var_0_0.GetLastAddBarList(arg_34_0)
	return arg_34_0.lastAddBarList_
end

function var_0_0.GetLastCanClickBarList(arg_35_0)
	return arg_35_0.lastCanClickBarList_
end

function var_0_0.UnBindListener(arg_36_0)
	for iter_36_0, iter_36_1 in pairs(arg_36_0.barGo_ or {}) do
		if iter_36_0 == BACK_BAR or iter_36_0 == HOME_BAR or iter_36_0 == NAVI_BAR or iter_36_0 == INFO_BAR or iter_36_0 == EXTRA_BAR then
			-- block empty
		else
			iter_36_1:UnBindListener()
		end
	end
end

function var_0_0.IsInited(arg_37_0)
	return not isNil(arg_37_0.gameObject_)
end

function var_0_0.OnClickCurrencyBar(arg_38_0)
	if arg_38_0.countdownGo_.activeInHierarchy then
		return
	end

	local var_38_0 = ItemTools.getItemNum(CurrencyConst.CURRENCY_TYPE_VITALITY)
	local var_38_1 = PlayerData:GetPlayerInfo().userLevel
	local var_38_2 = GameLevelSetting[var_38_1].fatigue_max

	arg_38_0:StopTimer()

	if var_38_0 < var_38_2 then
		local var_38_3 = GameSetting.fatigue_recovery.value[1] * 60
		local var_38_4 = CurrencyData:GetLastFatigueRecoverTime() == 0 and var_38_3 or var_38_3 - (manager.time:GetServerTime() - CurrencyData:GetLastFatigueRecoverTime()) % var_38_3
		local var_38_5 = (var_38_2 - var_38_0 - 1) * var_38_3 + var_38_4

		arg_38_0.time_.text = string.format("%02d:%02d:%02d", math.floor(var_38_4 / 3600), math.floor(var_38_4 % 3600 / 60), var_38_4 % 60)
		arg_38_0.allTime_.text = string.format("%02d:%02d:%02d", math.floor(var_38_5 / 3600), math.floor(var_38_5 % 3600 / 60), var_38_5 % 60)
		arg_38_0.timer_ = Timer.New(function()
			var_38_4 = CurrencyData:GetLastFatigueRecoverTime() == 0 and var_38_3 or var_38_3 - (manager.time:GetServerTime() - CurrencyData:GetLastFatigueRecoverTime()) % var_38_3
			var_38_0 = ItemTools.getItemNum(CurrencyConst.CURRENCY_TYPE_VITALITY)
			var_38_5 = (var_38_2 - var_38_0 - 1) * var_38_3 + var_38_4

			if var_38_4 <= 0 then
				var_38_4 = 0
			end

			if var_38_5 <= 0 then
				var_38_5 = 0
			end

			arg_38_0.time_.text = string.format("%02d:%02d:%02d", math.floor(var_38_4 / 3600), math.floor(var_38_4 % 3600 / 60), var_38_4 % 60)
			arg_38_0.allTime_.text = string.format("%02d:%02d:%02d", math.floor(var_38_5 / 3600), math.floor(var_38_5 % 3600 / 60), var_38_5 % 60)
		end, 1, -1)

		arg_38_0.timer_:Start()
	else
		arg_38_0.time_.text = "00:00:00"
		arg_38_0.allTime_.text = "00:00:00"
	end

	SetActive(arg_38_0.countdownGo_, true)
	SetActive(arg_38_0.bgBtn_.gameObject, true)
end

function var_0_0.OnStopTimer(arg_40_0)
	arg_40_0.time_.text = "00:00:00"
	arg_40_0.allTime_.text = "00:00:00"

	arg_40_0:StopTimer()
	SetActive(arg_40_0.countdownGo_, false)
	SetActive(arg_40_0.bgBtn_.gameObject, false)
end

function var_0_0.StopTimer(arg_41_0)
	if arg_41_0.timer_ then
		arg_41_0.timer_:Stop()

		arg_41_0.timer_ = nil
	end
end

function var_0_0.Dispose(arg_42_0)
	var_0_0.super.Dispose(arg_42_0)
	arg_42_0:StopTimer()

	for iter_42_0, iter_42_1 in pairs(arg_42_0.barGo_ or {}) do
		if iter_42_0 == BACK_BAR or iter_42_0 == HOME_BAR or iter_42_0 == NAVI_BAR or iter_42_0 == INFO_BAR or iter_42_0 == EXTRA_BAR then
			-- block empty
		else
			local var_42_0 = iter_42_1.gameObject_

			iter_42_1:Dispose()
			Object.Destroy(var_42_0)
		end
	end

	arg_42_0.barGo_ = nil

	if arg_42_0.windowPopTipsItemView_ then
		arg_42_0.windowPopTipsItemView_:Dispose()

		arg_42_0.windowPopTipsItemView_ = nil
	end

	if arg_42_0.cooperationInviteTip_ then
		arg_42_0.cooperationInviteTip_:Dispose()

		arg_42_0.cooperationInviteTip_ = nil
	end

	if not isNil(arg_42_0.gameObject_) then
		var_0_0.super.Dispose(arg_42_0)
		Object.Destroy(arg_42_0.gameObject_)

		arg_42_0.gameObject_ = nil
		arg_42_0.transform_ = nil
	end

	arg_42_0.currencyItem_ = nil
	arg_42_0.backBtn_ = nil
	arg_42_0.homeBtn_ = nil
	arg_42_0.infoBtn_ = nil
	arg_42_0.currencyList_ = nil
	arg_42_0.isShow_ = false
end

function var_0_0.SetActive(arg_43_0, arg_43_1, arg_43_2)
	if type(arg_43_1) == "table" then
		arg_43_1:SetActive(arg_43_2)
	elseif arg_43_1 then
		SetActive(arg_43_1, arg_43_2)
	end
end

function var_0_0.getMappedKey_(arg_44_0, arg_44_1, arg_44_2)
	if arg_44_2 and arg_44_2.prefix then
		return arg_44_2.prefix .. arg_44_1
	else
		return arg_44_1
	end
end

function var_0_0.getOrAddBarGo_(arg_45_0, arg_45_1, arg_45_2)
	local var_45_0 = arg_45_0:getMappedKey_(arg_45_1, arg_45_2)
	local var_45_1 = arg_45_0.barGo_[var_45_0]

	if not var_45_1 then
		local var_45_2 = arg_45_0:getBarTemplate_(arg_45_2)
		local var_45_3 = arg_45_0:getBarClass_(arg_45_1, arg_45_2)
		local var_45_4 = Object.Instantiate(var_45_2, arg_45_0.currencyList_.transform)

		var_45_1 = var_45_3.New(var_45_4, arg_45_1)
		arg_45_0.barGo_[var_45_0] = var_45_1

		if arg_45_1 == CurrencyConst.CURRENCY_TYPE_VITALITY then
			arg_45_0.countdownGo_.transform:SetParent(var_45_4.transform)

			arg_45_0.countdownGo_.transform:GetComponent("RectTransform").anchoredPosition = Vector2(0, -50)

			var_45_1:RegistClickFunc(handler(arg_45_0, arg_45_0.OnClickCurrencyBar))
			var_45_1:RegistTimeFunc(handler(arg_45_0, arg_45_0.OnStopTimer))
		end
	end

	return var_45_1
end

function var_0_0.getBarTemplate_(arg_46_0, arg_46_1)
	if arg_46_1 and arg_46_1.prefix and arg_46_1.prefix == "HOME:" then
		return arg_46_0.currencyItemMainHome_ or arg_46_0.currencyItem_
	end

	return arg_46_0.currencyItem_
end

function var_0_0.getBarClass_(arg_47_0, arg_47_1, arg_47_2)
	if arg_47_1 == ACTIVITY_MATRIX_COIN then
		return var_0_3
	elseif arg_47_1 == ACTIVITY_COIN then
		return var_0_4
	elseif ItemCfg[arg_47_1] and ItemCfg[arg_47_1].type == ItemConst.ITEM_TYPE.MATERIAL then
		return var_0_2
	else
		return var_0_1
	end
end

function var_0_0.getMappedBarList_(arg_48_0, arg_48_1, arg_48_2)
	if arg_48_2 == nil or arg_48_2.prefix == nil then
		return arg_48_1
	end

	local var_48_0 = {}

	for iter_48_0, iter_48_1 in ipairs(arg_48_1) do
		table.insert(var_48_0, arg_48_0:getMappedKey_(iter_48_1, arg_48_2))
	end

	return var_48_0
end

return var_0_0
