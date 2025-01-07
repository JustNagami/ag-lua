local var_0_0 = class("CoreVerificationRankView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/System/Core_Verification/CoreVerificationRankUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:BindCfgUI()

	arg_3_0.commonPortrait_ = CommonHeadPortrait.New(arg_3_0.headItem_)
	arg_3_0.tabController_ = arg_3_0.ndtabControllerexcollection_:GetController("tab")
	arg_3_0.tabNumController_ = arg_3_0.ndtabControllerexcollection_:GetController("num")

	arg_3_0:AddUIListener()

	arg_3_0.list_ = LuaList.New(handler(arg_3_0, arg_3_0.IndexItem), arg_3_0.m_list, CoreVerificationRankItem)
end

function var_0_0.AddUIListener(arg_4_0)
	arg_4_0:AddBtnListener(arg_4_0.clubbtnBtn_, nil, function()
		arg_4_0:SwitchPage(1)
	end)
	arg_4_0:AddBtnListener(arg_4_0.allbtnBtn_, nil, function()
		arg_4_0:SwitchPage(2)
	end)
end

function var_0_0.IndexItem(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = arg_7_0.rankList[arg_7_1]

	arg_7_2:Refresh(var_7_0)
end

function var_0_0.GetListFromIndex(arg_8_0, arg_8_1)
	if arg_8_1 == 1 then
		local var_8_0 = RankData:GetGuildCommonRank(RankConst.RANK_ID.COREVERIFICATION)

		return var_8_0 and var_8_0.rankList or {}
	else
		local var_8_1 = RankData:GetCommonRank(RankConst.RANK_ID.COREVERIFICATION)

		return var_8_1 and var_8_1.rankList or {}
	end
end

function var_0_0.OnEnter(arg_9_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR,
		INFO_BAR
	})
	manager.windowBar:SetGameHelpKey("CORE_VERIFICATION_DES")
	RankAction.QueryCommonRank(RankConst.RANK_ID.COREVERIFICATION)

	local var_9_0 = true

	if GuildData:GetGuildInfo().id == nil or GuildData:GetGuildInfo().id == 0 then
		var_9_0 = false
	end

	arg_9_0.tabNumController_:SetSelectedState(var_9_0 and "02" or "01")

	if var_9_0 then
		RankAction.QueryGuildCommonRank(RankConst.RANK_ID.COREVERIFICATION)
	end
end

function var_0_0.OnRankUpdate(arg_10_0)
	arg_10_0.rankData = RankData[arg_10_0.curPage_ == 1 and "GetGuildCommonRank" or "GetCommonRank"](RankData, RankConst.RANK_ID.COREVERIFICATION)
	arg_10_0.rankList = arg_10_0.rankData and arg_10_0.rankData.rankList or {}

	arg_10_0.list_:StartScroll(#arg_10_0.rankList)

	local var_10_0 = PlayerData:GetPlayerInfo()

	arg_10_0.commonPortrait_:RenderHead(var_10_0 and var_10_0.portrait)
	arg_10_0.commonPortrait_:RenderFrame(var_10_0.icon_frame)

	if arg_10_0.rankData then
		local var_10_1, var_10_2 = arg_10_0.rankData:GetCurRankDes()

		arg_10_0.textnumText_.text = var_10_1
		arg_10_0.textscoreText_.text = var_10_2
	else
		arg_10_0.textnumText_.text = ""
		arg_10_0.textscoreText_.text = ""
	end
end

function var_0_0.SwitchPage(arg_11_0, arg_11_1)
	if arg_11_0.tabConState_ == nil then
		arg_11_0.tabConState_ = {
			"club",
			"all"
		}
	end

	arg_11_0.tabController_:SetSelectedState(arg_11_0.tabConState_[arg_11_1])

	arg_11_0.curPage_ = arg_11_1
	arg_11_0.rankList = arg_11_0:GetListFromIndex(arg_11_1)

	arg_11_0:OnRankUpdate()
end

function var_0_0.OnExit(arg_12_0)
	return
end

function var_0_0.Dispose(arg_13_0)
	arg_13_0.commonPortrait_:Dispose()

	arg_13_0.commonPortrait_ = nil

	var_0_0.super.Dispose(arg_13_0)

	if arg_13_0.list_ then
		arg_13_0.list_:Dispose()

		arg_13_0.list_ = nil
	end
end

return var_0_0
