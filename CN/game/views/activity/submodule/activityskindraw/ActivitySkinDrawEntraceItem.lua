local var_0_0 = class("ActivitySkinDrawEntraceItem", ReduxView)

function var_0_0.OnCtor(arg_1_0, arg_1_1)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_0.gameObject_.transform

	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	arg_2_0:InitUI()
	arg_2_0:AddUIListeners()
end

function var_0_0.InitUI(arg_3_0)
	arg_3_0:BindCfgUI()

	arg_3_0.typeCon_ = ControllerUtil.GetController(arg_3_0.transform_, "type")
end

function var_0_0.AddUIListeners(arg_4_0)
	arg_4_0:AddBtnListener(arg_4_0.btn_, nil, function()
		ActivitySkinDrawTools.OnJumpToSkinDraw(arg_4_0.activityID_)
	end)
end

function var_0_0.OnEnter(arg_6_0)
	return
end

function var_0_0.Refresh(arg_7_0, arg_7_1)
	arg_7_0.activityID_ = arg_7_1

	if not arg_7_0.activitySkinItem_ then
		local var_7_0 = Asset.Load(T0SkinDrawCfg[arg_7_1].enterItem)

		if not isNil(var_7_0) then
			arg_7_0.activitySkinItem_ = GameObject.Instantiate(var_7_0, arg_7_0.transform_, false)
			arg_7_0.activitySkinItem_.transform.anchoredPosition = Vector2.New(0, 0)
		end
	end

	arg_7_0:BindRedPointUI()
end

function var_0_0.BindRedPointUI(arg_8_0)
	if not JumpTools.IsSystemLocked(ViewConst.SYSTEM_ID.SKIN_DRAW) and arg_8_0.redPointPanel_ then
		manager.redPoint:bindUIandKey(arg_8_0.redPointPanel_, RedPointConst.ACTIVITY_DRAW .. "_" .. arg_8_0.activityID_)
	end
end

function var_0_0.UnbindRedPointUI(arg_9_0)
	if not JumpTools.IsSystemLocked(ViewConst.SYSTEM_ID.SKIN_DRAW) and arg_9_0.redPointPanel_ then
		manager.redPoint:unbindUIandKey(arg_9_0.redPointPanel_, RedPointConst.ACTIVITY_DRAW .. "_" .. arg_9_0.activityID_)
	end
end

function var_0_0.OnExit(arg_10_0)
	arg_10_0:UnbindRedPointUI()
end

function var_0_0.Dispose(arg_11_0)
	arg_11_0:RemoveAllListeners()
	var_0_0.super.Dispose(arg_11_0)
end

return var_0_0
