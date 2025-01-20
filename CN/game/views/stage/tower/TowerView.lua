local var_0_0 = class("TowerView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/System/Tower/TowerUI_NEW"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0.selectIndex_ = -1

	arg_3_0:InitUI()
	arg_3_0:AddUIListener()
end

function var_0_0.InitUI(arg_4_0)
	arg_4_0:BindCfgUI()

	arg_4_0.selectController = ControllerUtil.GetController(arg_4_0.transform_, "select")
	arg_4_0.currentController = ControllerUtil.GetController(arg_4_0.transform_, "current")
end

function var_0_0.AddUIListener(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.m_maskBtn, nil, function()
		arg_5_0:CloseSectionInfo()
	end)

	for iter_5_0 = 1, 10 do
		local var_5_0 = arg_5_0["m_tower_" .. iter_5_0]

		if var_5_0 then
			arg_5_0:AddBtnListener(var_5_0, nil, function()
				arg_5_0.selectIndex_ = iter_5_0

				arg_5_0.selectController:SetSelectedIndex(arg_5_0.selectIndex_)
				arg_5_0:RefreshUI()
			end)
		end
	end
end

function var_0_0.OnEnter(arg_8_0)
	local var_8_0 = arg_8_0.params_.chapterId

	arg_8_0.chapterId = var_8_0
	arg_8_0.towerList = TowerData:GetTowerList(var_8_0)
	arg_8_0.curId = TowerData:GetCurId(var_8_0)

	local var_8_1 = table.indexof(arg_8_0.towerList, arg_8_0.curId)

	arg_8_0.currentController:SetSelectedIndex(var_8_1 or 11)

	if not arg_8_0.params_.showInfo or not var_8_1 then
		arg_8_0.selectIndex_ = 0

		arg_8_0.selectController:SetSelectedIndex(arg_8_0.selectIndex_)
		arg_8_0:OnTowerContentShow(false)
	else
		arg_8_0.selectIndex_ = var_8_1

		arg_8_0.selectController:SetSelectedIndex(arg_8_0.selectIndex_)
		arg_8_0:RefreshUI()
	end

	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR,
		INFO_BAR
	})
	manager.windowBar:SetGameHelpKey("SPAWN_DESCRIPE")
end

function var_0_0.OnExit(arg_9_0)
	manager.windowBar:HideBar()
end

function var_0_0.RefreshUI(arg_10_0)
	arg_10_0:OnTowerContentShow(true, arg_10_0.selectIndex_)

	local var_10_0 = arg_10_0.towerList[arg_10_0.selectIndex_]
	local var_10_1 = (not arg_10_0.curId or var_10_0 <= arg_10_0.curId) and GetTips("READY_BATTLE") or GetTips("BACK_TO_CURRENT")

	arg_10_0:Go("towerSelectionInfo", {
		towerId = var_10_0,
		curId = arg_10_0.curId,
		clickBackFunc = handler(arg_10_0, arg_10_0.BackToCurSelect),
		btnTips = var_10_1
	})
end

function var_0_0.BackToCurSelect(arg_11_0)
	arg_11_0.selectIndex_ = table.indexof(arg_11_0.towerList, arg_11_0.curId) or 1

	arg_11_0.selectController:SetSelectedIndex(arg_11_0.selectIndex_)
	arg_11_0:RefreshUI()
end

function var_0_0.CloseSectionInfo(arg_12_0)
	if arg_12_0:IsOpenRoute("towerSelectionInfo") then
		arg_12_0:OnTowerContentShow(false)
		JumpTools.Back()
	end

	arg_12_0.selectController:SetSelectedIndex(0)
end

function var_0_0.OnTowerContentShow(arg_13_0, arg_13_1, arg_13_2)
	if arg_13_1 then
		local var_13_0 = -arg_13_0["m_tower_" .. arg_13_2].transform.localPosition.x - 350

		arg_13_0:RemoveTween()

		arg_13_0.tween_ = LeanTween.value(arg_13_0.m_middleContent.gameObject, arg_13_0.m_middleContent.localPosition.x, var_13_0, 0.3):setOnUpdate(LuaHelper.FloatAction(function(arg_14_0)
			arg_13_0.m_middleContent.localPosition = Vector3(arg_14_0, 0, 0)
		end))
	else
		arg_13_0:RemoveTween()

		arg_13_0.tween_ = LeanTween.value(arg_13_0.m_middleContent.gameObject, arg_13_0.m_middleContent.localPosition.x, 0, 0.3):setOnUpdate(LuaHelper.FloatAction(function(arg_15_0)
			arg_13_0.m_middleContent.localPosition = Vector3(arg_15_0, 0, 0)
		end))
	end
end

function var_0_0.RemoveTween(arg_16_0)
	if arg_16_0.tween_ then
		arg_16_0.tween_:setOnUpdate(nil)
		LeanTween.cancel(arg_16_0.m_middleContent.gameObject)

		arg_16_0.tween_ = nil
	end
end

function var_0_0.Dispose(arg_17_0)
	arg_17_0:RemoveTween()
	var_0_0.super.Dispose(arg_17_0)
end

return var_0_0
