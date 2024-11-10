local var_0_0 = class("DormVisitView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/BackHouseUI/Dorm/DormVisitUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.OnCtor(arg_3_0)
	return
end

function var_0_0.Init(arg_4_0)
	arg_4_0:InitUI()
	arg_4_0:AddUIListener()

	arg_4_0.refreshFlag = true

	local var_4_0 = GameSetting.dorm_recommend_refresh_cd.value[1]

	arg_4_0.refreshTimer = Timer.New(function()
		arg_4_0.refreshFlag = true
	end, var_4_0, 1)
end

function var_0_0.InitUI(arg_6_0)
	arg_6_0:BindCfgUI()

	arg_6_0.scrollHelper_ = LuaList.New(handler(arg_6_0, arg_6_0.indexTemplate), arg_6_0.uilistGo_, DormVisitItem)
end

function var_0_0.OnEnter(arg_7_0)
	arg_7_0.enterType = arg_7_0.params_.enterType
	arg_7_0.back = arg_7_0.params_.back or nil

	arg_7_0:RegisterEvents()
	manager.windowBar:SwitchBar({
		BACK_BAR
	})
	manager.windowBar:RegistBackCallBack(function()
		if arg_7_0.back == "chooseRoom" then
			JumpTools.OpenPageByJump("/dormChooseRoomView")

			return
		end

		local var_8_0 = BackHomeDataManager:GetCurSystem()

		if var_8_0 == DormEnum.DormSystemType.Canteen then
			JumpTools.OpenPageByJump("/restaurantMain")
		elseif var_8_0 == DormEnum.DormSystemType.Dormitory then
			if arg_7_0.enterType == "quick" then
				JumpTools.OpenPageByJump("/dorm")
			else
				JumpTools.OpenPageByJump("/dormChooseRoomView")
			end
		elseif var_8_0 == DormEnum.DormSystemType.Main then
			JumpTools.OpenPageByJump("/dormChooseRoomView")
		elseif var_8_0 == DormEnum.DormSystemType.CricketBattle then
			JumpTools.OpenPageByJump("/idolTraineeCamp")
		end
	end)

	local var_7_0 = arg_7_0.groupID or DormVisitTools:GetListIndex() or 1

	arg_7_0:SelGroup(var_7_0)
end

function var_0_0.OnExit(arg_9_0)
	manager.windowBar:HideBar()
	arg_9_0:RemoveAllEventListener()

	arg_9_0.enterType = nil
end

function var_0_0.AddUIListener(arg_10_0)
	for iter_10_0 = 1, 2 do
		arg_10_0:AddToggleListener(arg_10_0["tog_" .. iter_10_0], function(arg_11_0)
			if arg_11_0 then
				arg_10_0:SelGroup(iter_10_0)
			end
		end)
	end

	arg_10_0:AddDragListener(arg_10_0.uilistGo_, function()
		return
	end, function()
		return
	end, function()
		local var_14_0 = arg_10_0.contentGo_.transform.anchoredPosition.y

		if arg_10_0.loadingGo_.transform.sizeDelta.y < -1 * var_14_0 then
			if not arg_10_0.refreshFlag then
				ShowTips(GetTips("DORM_RECOMMEND_CD"))

				return
			else
				arg_10_0.refreshFlag = false

				arg_10_0.refreshTimer:Start()
				DormAction:AskFurTemplateExhibitList(arg_10_0.groupID)
			end
		end
	end)
end

function var_0_0.SelGroup(arg_15_0, arg_15_1)
	if arg_15_0.groupID == arg_15_1 then
		return
	end

	arg_15_0.groupID = arg_15_1
	arg_15_0["tog_" .. arg_15_0.groupID].isOn = true

	arg_15_0:RefreshList()
end

function var_0_0.RegisterEvents(arg_16_0)
	arg_16_0:RegistEventListener(DORM_REFRESH_TEMPLATE_EXHI, function()
		arg_16_0:RefreshList()
	end)
end

function var_0_0.indexTemplate(arg_18_0, arg_18_1, arg_18_2)
	arg_18_2:RefreshUI(arg_18_0.visitList[arg_18_1], arg_18_0.groupID)
	arg_18_2:RegisterEnterCallBack(function(arg_19_0)
		SDKTools.SendMessageToSDK("backhome_dorm_visit_jump", {
			backhome_source = 2
		})
		DormVisitTools:SetListIndex(arg_18_0.groupID)
		DormAction:AskSingleFurTemplateExhibit(arg_19_0)
	end)
end

function var_0_0.RefreshList(arg_20_0)
	arg_20_0.visitList = {}

	local var_20_0 = DormVisitTools:GetTemplateExhibitList(arg_20_0.groupID)

	if var_20_0 then
		for iter_20_0, iter_20_1 in pairs(var_20_0) do
			table.insert(arg_20_0.visitList, iter_20_0)
		end

		arg_20_0.scrollHelper_:StartScroll(#arg_20_0.visitList)
	end
end

function var_0_0.Dispose(arg_21_0)
	if arg_21_0.scrollHelper_ then
		arg_21_0.scrollHelper_:Dispose()

		arg_21_0.scrollHelper_ = nil
	end

	if arg_21_0.refreshTimer then
		arg_21_0.refreshTimer:Stop()

		arg_21_0.refreshTimer = nil
	end

	var_0_0.super.Dispose(arg_21_0)
end

return var_0_0
