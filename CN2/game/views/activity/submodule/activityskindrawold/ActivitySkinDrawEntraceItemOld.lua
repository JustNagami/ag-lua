local var_0_0 = class("ActivitySkinDrawEntraceItemOld", ReduxView)

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
end

function var_0_0.AddUIListeners(arg_4_0)
	arg_4_0:AddBtnListener(arg_4_0.btn_, nil, function()
		if ActivityData:GetActivityData(arg_4_0.activityID_):IsActivitying() then
			if not JumpTools.IsSystemLocked(ViewConst.SYSTEM_ID.SKIN_DRAW) then
				local var_5_0 = ActivitySkinDrawDataOld:GetStoryInfo(arg_4_0.activityID_)

				if var_5_0 and var_5_0.isRead == 0 then
					manager.notify:Invoke(MUTE_MAIN_AUDIO)

					local var_5_1 = var_5_0.activityID
					local var_5_2 = ActivityLimitedSkinStoryCfg.get_id_list_by_activity_id[var_5_1][1]
					local var_5_3 = ActivityLimitedSkinStoryCfg[var_5_2]

					manager.story:StartStoryById(var_5_3.story_id, function()
						manager.loadScene:ForceSetShouldLoadSceneName("home", function()
							ActivitySkinDrawActionOld.FinishStory(var_5_1, var_5_0.storyID)
							JumpTools.GoToSystem("/activityskinDrawOld", {
								checkReward = true,
								activityID = arg_4_0.activityID_
							}, ViewConst.SYSTEM_ID.SKIN_DRAW)
						end)
					end)
				else
					JumpTools.GoToSystem("/activityskinDrawOld", {
						checkReward = true,
						activityID = arg_4_0.activityID_
					}, ViewConst.SYSTEM_ID.SKIN_DRAW)
				end
			else
				ShowTips(JumpTools.GetSystemLockedTip(ViewConst.SYSTEM_ID.SKIN_DRAW, JumpTools.IsSystemLocked(ViewConst.SYSTEM_ID.SKIN_DRAW)))
			end
		end
	end)
end

function var_0_0.OnEnter(arg_8_0)
	return
end

function var_0_0.Refresh(arg_9_0, arg_9_1)
	arg_9_0.activityID_ = arg_9_1

	arg_9_0:BindRedPointUI()

	if not arg_9_0.activitySkinItem_ then
		local var_9_0 = Asset.Load(T0SkinDrawCfg[arg_9_1].enterItem)

		if not isNil(var_9_0) then
			arg_9_0.activitySkinItem_ = GameObject.Instantiate(var_9_0, arg_9_0.transform_, false)
			arg_9_0.activitySkinItem_.transform.anchoredPosition = Vector2.New(0, 0)
		end
	end

	local var_9_1 = ActivitySkinDrawDataOld:GetStoryInfo(arg_9_0.activityID_)

	arg_9_0.typeCon_ = ControllerUtil.GetController(arg_9_0.activitySkinItem_.transform, "type")

	arg_9_0.typeCon_:SetSelectedState(var_9_1 and var_9_1.isRead == 0 and "story" or "draw")
end

function var_0_0.BindRedPointUI(arg_10_0)
	if not JumpTools.IsSystemLocked(ViewConst.SYSTEM_ID.SKIN_DRAW) then
		manager.redPoint:bindUIandKey(arg_10_0.redPointPanel_, RedPointConst.ACTIVITY_DRAW .. "_" .. arg_10_0.activityID_)
	end
end

function var_0_0.UnbindRedPointUI(arg_11_0)
	manager.redPoint:unbindUIandKey(arg_11_0.redPointPanel_, RedPointConst.ACTIVITY_DRAW .. "_" .. arg_11_0.activityID_)
end

function var_0_0.OnExit(arg_12_0)
	arg_12_0:UnbindRedPointUI()
end

function var_0_0.Dispose(arg_13_0)
	arg_13_0:RemoveAllListeners()
	var_0_0.super.Dispose(arg_13_0)
end

return var_0_0
