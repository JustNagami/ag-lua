local var_0_0 = class("PosterTzeroPlusActor", PosterTzeroActor)
local var_0_1 = PosterTzeroActor.SwipeDir
local var_0_2 = {
	PosterGirlConst.ViewDirect.left,
	PosterGirlConst.ViewDirect.center,
	PosterGirlConst.ViewDirect.right
}

local function var_0_3(arg_1_0, arg_1_1, arg_1_2)
	return (arg_1_1 + arg_1_2 + arg_1_0 - 1) % arg_1_0 + 1
end

local function var_0_4(arg_2_0, arg_2_1, arg_2_2)
	return math.max(0, math.min(arg_2_1 + arg_2_2, arg_2_0))
end

local function var_0_5(arg_3_0, arg_3_1)
	local var_3_0 = table.indexof(var_0_2, arg_3_1)
	local var_3_1 = #var_0_2
	local var_3_2 = var_0_3(var_3_1, var_3_0, arg_3_0)

	return var_0_2[var_3_2]
end

local function var_0_6(arg_4_0)
	if arg_4_0 == var_0_1.Left then
		return var_0_1.Right
	elseif arg_4_0 == var_0_1.Right then
		return var_0_1.Left
	end

	return var_0_1.None
end

function var_0_0.SwipeViewDir(arg_5_0, arg_5_1)
	local var_5_0 = arg_5_0:GetViewDirect()

	if arg_5_1 == var_0_1.None then
		return var_5_0
	end

	arg_5_0.startSwipeView = arg_5_0.startSwipeView or var_5_0
	arg_5_0.startSwipeDir = arg_5_0.startSwipeDir or arg_5_1
	arg_5_0.endSwipeView = arg_5_0.endSwipeView or var_0_5(arg_5_1, arg_5_0.startSwipeView)

	if arg_5_1 == arg_5_0.startSwipeDir then
		return arg_5_0.endSwipeView
	else
		return var_0_5(arg_5_1, arg_5_0.endSwipeView)
	end
end

function var_0_0.DOEndDrag(arg_6_0)
	var_0_0.super.DOEndDrag(arg_6_0)

	arg_6_0.startSwipeDir = nil
	arg_6_0.startSwipeView = nil
	arg_6_0.endSwipeView = nil
end

var_0_0.TweenEaseType = {
	LeanTweenType.easeInCubic,
	LeanTweenType.easeOutCubic
}
var_0_0.camMoveXFactor = 0.05

function var_0_0.SwipeAction(arg_7_0, arg_7_1)
	if not PosterGirlTools.IsTZeroViewPointCanLoopSwitch() then
		return
	end

	if arg_7_0.cameraManager_.IsTweening then
		return
	end

	arg_7_0.curSwipeDir = arg_7_1

	local var_7_0 = arg_7_0:GetViewDirect()
	local var_7_1 = arg_7_0:SwipeViewDir(arg_7_1)

	if var_7_0 ~= var_7_1 then
		arg_7_0.cameraManager_:AddCameraPosWithMoveX(-arg_7_1 * var_0_0.camMoveXFactor, function()
			arg_7_0:SetViewDirect(var_7_1)
			arg_7_0:ChangeState(PosterGirlConst.StateKay.init_no_blend, true)
			arg_7_0:UpdateCameraParamsByViewPoint(false, arg_7_1)
			arg_7_0:OnViewDirectChange()
		end, var_0_0.TweenEaseType[1])
	end
end

function var_0_0.SwipeToLeft(arg_9_0)
	local var_9_0 = arg_9_0:GetCurrentState()

	if var_9_0.SwipeToLeft then
		var_9_0:SwipeToLeft(var_0_0.SwipeDir.Left)
		arg_9_0:OnViewDirectChange()
	else
		arg_9_0:SwipeAction(var_0_0.SwipeDir.Left)
	end
end

function var_0_0.SwipeToRight(arg_10_0)
	local var_10_0 = arg_10_0:GetCurrentState()

	if var_10_0.SwipeToRight then
		var_10_0:SwipeToRight(var_0_0.SwipeDir.Right)
		arg_10_0:OnViewDirectChange()
	else
		arg_10_0:SwipeAction(var_0_0.SwipeDir.Right)
	end
end

function var_0_0.TouchHelpMutiDrag(arg_11_0, arg_11_1)
	local var_11_0 = arg_11_0:GetCurrentState()

	if var_11_0.ZoomToCamera then
		var_11_0:ZoomToCamera(arg_11_1)
	else
		arg_11_0:DefaultZoomToCameraImpl(arg_11_1, 1, 0)
	end
end

function var_0_0.DefaultZoomToCameraImpl(arg_12_0, arg_12_1, arg_12_2, arg_12_3)
	arg_12_0 = arg_12_0 or manager.posterGirl.actor

	local var_12_0 = GameSetting.delta_to_zoom and GameSetting.delta_to_zoom.value[1] or 10

	if var_12_0 < arg_12_1 then
		arg_12_0.zoom = true

		arg_12_0.cameraManager_:SetActiveCamera(arg_12_2)
	elseif arg_12_1 < -1 * var_12_0 then
		arg_12_0.zoom = nil

		arg_12_0.cameraManager_:SetActiveCamera(arg_12_3)
	end
end

function var_0_0.GetState(arg_13_0, arg_13_1)
	local var_13_0 = PosterGirlTools.DlcStateShouldCache(arg_13_1)
	local var_13_1 = nullable(arg_13_0._states, var_13_0)
	local var_13_2 = {
		isViewPointChange = PosterGirlTools.IsTZeroViewPointCanLoopSwitch()
	}

	if var_13_1 == nil then
		var_13_1 = PosterGirlTools.ProduceDlcState(arg_13_1, arg_13_0, var_13_2)

		if var_13_1 ~= nil and var_13_0 then
			arg_13_0._states[var_13_0] = var_13_1
		end
	end

	if arg_13_1.key ~= nil then
		var_13_1:SetStateKey(arg_13_1.key)
	else
		var_13_1:SetStateKey(arg_13_1)
	end

	return var_13_1
end

local function var_0_7(arg_14_0, arg_14_1, arg_14_2)
	arg_14_2 = arg_14_2 or arg_14_0.curSwipeDir

	arg_14_0.cameraManager_:SetCameraParams(arg_14_1)
	arg_14_0.cameraManager_:ResetCameraDefaultCfg()
	arg_14_0.cameraManager_:SetCameraPosWithMoveX(arg_14_2 * var_0_0.camMoveXFactor, function()
		arg_14_0.cameraManager_:ResetCameraDefaultCfg()
	end, var_0_0.TweenEaseType[2])
end

local function var_0_8(arg_16_0, arg_16_1, arg_16_2)
	arg_16_0.cameraManager_:RemoveTween()
	arg_16_0.cameraManager_:SetCameraParams(arg_16_1)
	arg_16_0:SetSelfCamera(0, true)
end

function var_0_0.UpdateCameraParamsByViewPoint(arg_17_0, arg_17_1, arg_17_2)
	if not arg_17_0.cameraManager_ then
		return
	end

	;(arg_17_1 and var_0_8 or var_0_7)(arg_17_0, arg_17_0:GetViewDirect(), arg_17_2)
end

return var_0_0
