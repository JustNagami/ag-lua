local var_0_0 = class("ReduxView", import("game.extend.BaseView"))
local var_0_1 = import("game.tools.JumpTools")
local var_0_2 = "WAIT"
local var_0_3 = "LOADING"
local var_0_4 = "LOADEND"
local var_0_5 = "DESTROY"

var_0_0.VIEW_ADAPT_DISTANCE = 60
var_0_0.NEED_ADAPT = false
var_0_0.ADAPT_RAITO = 1.8888888888888888

function var_0_0.Ctor(arg_1_0, ...)
	var_0_0.super.Ctor(arg_1_0)

	arg_1_0.props_ = {}
	arg_1_0.currentUIState_ = var_0_2

	arg_1_0:OnCtor(...)

	if not arg_1_0.ctored_ then
		ReduxFactory.GetInstance():OnManagedObjCtor(arg_1_0)
	end

	arg_1_0.ctored_ = true
end

function var_0_0.OnCtor(arg_2_0, ...)
	return
end

function var_0_0.UIName(arg_3_0)
	return nil
end

function var_0_0.UIParent(arg_4_0)
	return nil
end

function var_0_0.UIBackCount(arg_5_0)
	return 1
end

function var_0_0.GetPlayBackwardsAnimator(arg_6_0)
	return {}, nil
end

function var_0_0.Init(arg_7_0)
	return
end

function var_0_0.ShowDefaultBar(arg_8_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR,
		CurrencyConst.CURRENCY_TYPE_VITALITY,
		CurrencyConst.CURRENCY_TYPE_GOLD,
		CurrencyConst.CURRENCY_TYPE_DIAMOND
	})
	manager.windowBar:SetBarCanAdd(CurrencyConst.CURRENCY_TYPE_VITALITY, true)
	manager.windowBar:SetBarCanAdd(CurrencyConst.CURRENCY_TYPE_GOLD, true)
	manager.windowBar:SetBarCanAdd(CurrencyConst.CURRENCY_TYPE_DIAMOND, true)
end

function var_0_0.OnMainHomeViewTop(arg_9_0)
	return
end

function var_0_0.Dispose(arg_10_0)
	var_0_0.super.Dispose(arg_10_0)
	arg_10_0:RemoveAllListeners()
	arg_10_0:RemoveAllEventListener()
	ReduxFactory.GetInstance():OnManagedObjDisposed(arg_10_0)
	arg_10_0:CheckListenersLeak()
end

function var_0_0.OnUpdate(arg_11_0)
	return
end

function var_0_0.SyncInit(arg_12_0, arg_12_1, arg_12_2)
	arg_12_0.routeName_ = arg_12_1
	arg_12_0.params_ = arg_12_2

	local var_12_0 = arg_12_0:UIName()

	if var_12_0 then
		local var_12_1 = Asset.Load(var_12_0)

		if var_12_1 == nil then
			var_12_1 = Asset.Load(var_12_0 .. SettingData:GetCurrentLanguageKey())

			if var_12_1 == nil then
				error("找不到资源：" .. var_12_0)
			end
		end

		arg_12_0.gameObject_ = Object.Instantiate(var_12_1, arg_12_0:UIParent())
		arg_12_0.transform_ = arg_12_0.gameObject_.transform
		arg_12_0.currentUIState_ = var_0_4

		arg_12_0:Init()
	else
		arg_12_0.currentUIState_ = var_0_4

		arg_12_0:Init()
	end
end

function var_0_0.AdaptScreen(arg_13_0)
	if not var_0_0.NEED_ADAPT or arg_13_0.transform_ == nil or var_0_0.VIEW_ADAPT_DISTANCE == arg_13_0.lastAdaptDistance_ then
		return
	end

	arg_13_0:AdaptLeft()
	arg_13_0:AdaptRight()
	arg_13_0:AdaptMiddle()
	arg_13_0:AdaptChild()

	arg_13_0.lastAdaptDistance_ = var_0_0.VIEW_ADAPT_DISTANCE
end

function var_0_0.AdaptLeft(arg_14_0)
	if arg_14_0.leftTrs_ == nil then
		if arg_14_0.leftGo_ == nil then
			arg_14_0.leftGo_ = arg_14_0:FindGo("panel/left") or arg_14_0:FindGo("Canvas/panel/left")
		end

		arg_14_0.needAdaptLeft_ = false

		if arg_14_0.leftGo_ == nil then
			arg_14_0.leftGo_ = arg_14_0:FindGo("panel/left_adapt") or arg_14_0:FindGo("Canvas/panel/left_adapt")

			if arg_14_0.leftGo_ then
				arg_14_0.needAdaptLeft_ = true
			end
		end

		if arg_14_0.leftGo_ then
			arg_14_0.leftTrs_ = arg_14_0.leftGo_:GetComponent(typeof(RectTransform))
		end
	end

	if arg_14_0.leftTrs_ then
		arg_14_0.leftTrs_.anchoredPosition = Vector3(var_0_0.VIEW_ADAPT_DISTANCE, 0, 0)

		if arg_14_0.needAdaptLeft_ then
			if arg_14_0.leftTrsSizeDelta_ == nil then
				arg_14_0.leftTrsSizeDelta_ = arg_14_0.leftTrs_.sizeDelta
			end

			local var_14_0 = arg_14_0.leftTrsSizeDelta_

			arg_14_0.leftTrs_.sizeDelta = Vector2.New(var_14_0.x - var_0_0.VIEW_ADAPT_DISTANCE * 2, var_14_0.y)
		end
	end
end

function var_0_0.AdaptRight(arg_15_0)
	if arg_15_0.rightTrs_ == nil then
		if arg_15_0.rightGo_ == nil then
			arg_15_0.rightGo_ = arg_15_0:FindGo("panel/right") or arg_15_0:FindGo("Canvas/panel/right")
		end

		arg_15_0.needAdaptRight_ = false

		if arg_15_0.rightGo_ == nil then
			arg_15_0.rightGo_ = arg_15_0:FindGo("panel/right_adapt") or arg_15_0:FindGo("Canvas/panel/right_adapt")

			if arg_15_0.rightGo_ then
				arg_15_0.needAdaptRight_ = true
			end
		end

		if arg_15_0.rightGo_ then
			arg_15_0.rightTrs_ = arg_15_0.rightGo_:GetComponent(typeof(RectTransform))
		end
	end

	if arg_15_0.rightTrs_ then
		arg_15_0.rightTrs_.anchoredPosition = Vector3(-1 * var_0_0.VIEW_ADAPT_DISTANCE, 0, 0)

		if arg_15_0.needAdaptRight_ then
			if arg_15_0.rightTrsSizeDelta_ == nil then
				arg_15_0.rightTrsSizeDelta_ = arg_15_0.rightTrs_.sizeDelta
			end

			local var_15_0 = arg_15_0.rightTrsSizeDelta_

			arg_15_0.rightTrs_.sizeDelta = Vector2.New(var_15_0.x - var_0_0.VIEW_ADAPT_DISTANCE * 2, var_15_0.y)
		end
	end
end

function var_0_0.AdaptMiddle(arg_16_0)
	if arg_16_0.middleTrs_ == nil then
		if arg_16_0.middleGo_ == nil then
			arg_16_0.middleGo_ = arg_16_0:FindGo("panel/middle_adapt") or arg_16_0:FindGo("Canvas/panel/middle_adapt")
		end

		if arg_16_0.middleGo_ then
			arg_16_0.middleTrs_ = arg_16_0.middleGo_:GetComponent(typeof(RectTransform))
		end
	end

	if arg_16_0.middleTrs_ then
		if arg_16_0.middleTrsSizeDelta_ == nil then
			arg_16_0.middleTrsSizeDelta_ = arg_16_0.middleTrs_.sizeDelta
		end

		local var_16_0 = arg_16_0.middleTrsSizeDelta_

		arg_16_0.middleTrs_.sizeDelta = Vector2.New(var_16_0.x - var_0_0.VIEW_ADAPT_DISTANCE * 2, var_16_0.y)
	end
end

function var_0_0.AdaptChild(arg_17_0)
	if arg_17_0.containerTrs_ == nil then
		if arg_17_0.containerGo_ == nil then
			arg_17_0.containerGo_ = arg_17_0:FindGo("panel/pageContainer") or arg_17_0:FindGo("Canvas/panel/pageContainer")
		end

		if arg_17_0.containerGo_ then
			arg_17_0.containerTrs_ = arg_17_0.containerGo_:GetComponent(typeof(RectTransform))
		end
	end

	if arg_17_0.containerTrs_ then
		if arg_17_0.containerTrsSizeDelta_ == nil then
			arg_17_0.containerTrsSizeDelta_ = arg_17_0.containerTrs_.sizeDelta
		end

		local var_17_0 = arg_17_0.containerTrsSizeDelta_

		arg_17_0.containerTrs_.sizeDelta = Vector2.New(var_17_0.x - var_0_0.VIEW_ADAPT_DISTANCE * 2, var_17_0.y)
	end
end

function var_0_0.OnEnter(arg_18_0)
	return
end

function var_0_0.OnEnterOver(arg_19_0)
	return
end

function var_0_0.CameraEnter(arg_20_0, arg_20_1)
	if arg_20_1 and arg_20_0:UIParent() ~= manager.ui.uiPop.transform then
		manager.heroRaiseTrack:SetViewState(HeroRaiseTrackConst.ViewType.null)
	end
end

function var_0_0.OnExit(arg_21_0)
	return
end

function var_0_0.OnTop(arg_22_0)
	return
end

function var_0_0.OnBehind(arg_23_0)
	return
end

function var_0_0.SetParams(arg_24_0, arg_24_1)
	arg_24_0.params_ = arg_24_1
end

function var_0_0.Go(arg_25_0, arg_25_1, arg_25_2, arg_25_3)
	gameContext:Go(arg_25_1, arg_25_2, arg_25_3)
end

function var_0_0.Back(arg_26_0, arg_26_1, arg_26_2)
	var_0_1.Back(arg_26_1, arg_26_2)
end

function var_0_0.IsBack(arg_27_0, arg_27_1)
	return gameContext:IsBack(arg_27_1)
end

function var_0_0.IsOpenRoute(arg_28_0, arg_28_1)
	return gameContext:IsOpenRoute(arg_28_1)
end

function var_0_0.Unequal(arg_29_0, arg_29_1, arg_29_2)
	if type(arg_29_1) == "table" and type(arg_29_2) == "table" then
		if table.length(arg_29_1) ~= table.length(arg_29_2) then
			return true
		end

		for iter_29_0, iter_29_1 in pairs(arg_29_1) do
			if arg_29_0:Unequal(iter_29_1, arg_29_2[iter_29_0]) == true then
				return true
			end
		end
	elseif arg_29_1 ~= arg_29_2 then
		return true
	end

	return false
end

function var_0_0.SetViewProp(arg_30_0, arg_30_1, arg_30_2)
	arg_30_0.props_ = arg_30_0.props_ or {}
	arg_30_0.oldProps_ = arg_30_0.oldProps_ or {}

	local var_30_0 = false

	if arg_30_0.props_[arg_30_1] == nil then
		var_30_0 = true
	end

	if arg_30_0:Unequal(arg_30_0.oldProps_[arg_30_1], arg_30_2) then
		if type(arg_30_2) == "table" then
			arg_30_0.props_[arg_30_1] = deepClone(arg_30_2)
			arg_30_0.oldProps_[arg_30_1] = deepClone(arg_30_2)
		else
			arg_30_0.props_[arg_30_1] = arg_30_2
			arg_30_0.oldProps_[arg_30_1] = arg_30_2
		end

		if not var_30_0 then
			arg_30_0:OnViewPropChanged(arg_30_1, arg_30_2)
		end
	end
end

function var_0_0.GetViewProp(arg_31_0, arg_31_1)
	arg_31_0.props_ = arg_31_0.props_ or {}

	return arg_31_0.props_[arg_31_1]
end

function var_0_0.OnViewPropChanged(arg_32_0, arg_32_1, arg_32_2)
	return
end

function var_0_0.OnUnload(arg_33_0)
	if arg_33_0.currentUIState_ ~= var_0_3 then
		arg_33_0:Dispose()
		arg_33_0:Unload()
	end

	arg_33_0.currentUIState_ = var_0_5
end

function var_0_0.Unload(arg_34_0)
	manager.gc:Collect()

	if not isNil(arg_34_0.gameObject_) then
		Object.Destroy(arg_34_0.gameObject_)

		arg_34_0.gameObject_ = nil
		arg_34_0.transform_ = nil
	end

	arg_34_0.props_ = nil
	arg_34_0.oldProps_ = nil
end

function var_0_0.IsTop(arg_35_0)
	return gameContext.routes_[#gameContext.routes_] == arg_35_0.routeName_
end

function var_0_0.Cacheable(arg_36_0)
	return true
end

function var_0_0.SetRouteName(arg_37_0, arg_37_1)
	arg_37_0.routeName_ = arg_37_1
end

function var_0_0.CheckWeakGuide(arg_38_0)
	arg_38_0:RealCheckWeakGuide()
end

function var_0_0.RealCheckWeakGuide(arg_39_0)
	if manager.guide:IsPlaying() then
		return
	end

	local var_39_0, var_39_1 = GuideTool.CheckWeakGuide(arg_39_0.routeName_)

	if var_39_0 then
		local var_39_2 = string.sub(var_39_1.guide_component[1], 1, 2)
		local var_39_3
		local var_39_4 = GuideTool.GetGuideComponentByRoute(arg_39_0, var_39_1.mask_component)

		local function var_39_5()
			if var_39_3 then
				manager.guide:ShowWeakView(var_39_1, var_39_3, var_39_4)
			else
				NewPlayerGuideAction.FinishWeakGuide(var_39_1.id)
				GuideTool.Log("未找到弱引导组件，弱引导id:" .. var_39_1.id)
			end
		end

		if var_39_2 == "@@" then
			local var_39_6

			var_39_6 = FrameTimer.New(function()
				var_39_3 = arg_39_0:GetSpecialCom(var_39_1.guide_component)

				var_39_5()
				var_39_6:Stop()
			end, 10, 1)

			var_39_6:Start()
		else
			var_39_3 = GuideTool.GetGuideComponentByRoute(arg_39_0, var_39_1.guide_component)

			var_39_5()
		end
	end
end

function var_0_0.GetSpecialCom(arg_42_0, arg_42_1)
	return
end

function var_0_0.HideWeakGuide(arg_43_0)
	manager.guide.weakView:Hide()
end

return var_0_0
