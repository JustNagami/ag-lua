local var_0_0 = class("ActivitySkinDrawStartView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return ActivitySkinDrawTools.GetDrawStartUIName(arg_1_0.params_.activityID)
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:InitUI()
	arg_3_0:AddUIListeners()
end

function var_0_0.InitUI(arg_4_0)
	arg_4_0:BindCfgUI()

	arg_4_0.soundEffect_ = {
		sound_2 = "search_scene_02_purple",
		sound_3 = "search_scene_02_gold",
		sound_1 = "search_scene_02_blue",
		sound_special = "search_scene_02_special"
	}
	arg_4_0.typeCon_ = ControllerUtil.GetController(arg_4_0.transform_, "type")
end

function var_0_0.AddUIListeners(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.skipBtn_, nil, function()
		arg_5_0.skip_ = true

		if arg_5_0.isPlaying_ then
			if arg_5_0.playable_ then
				arg_5_0.playable_:Stop()
			end
		else
			arg_5_0:SkipFunc()
		end
	end)
	arg_5_0:AddBtnListener(arg_5_0.drawInteractBtn_, nil, function()
		arg_5_0.isPlaying_ = true
		arg_5_0.drawInteractBtn_.enabled = false

		manager.audio:PlayEffect("ui_system_search", arg_5_0.effect_, "")

		if arg_5_0.playable_ then
			TimelineTools.PlayTimelineWithCallback(arg_5_0.playable_, arg_5_0.playable_.playableAsset, function()
				if not arg_5_0.skip_ then
					arg_5_0:AfterTimeline(arg_5_0.list_)
				else
					arg_5_0:SkipFunc()
				end
			end)
		else
			arg_5_0:AfterTimeline(arg_5_0.list_)
		end
	end)
end

function var_0_0.OnEnter(arg_9_0)
	arg_9_0.skip_ = false
	arg_9_0.isPlaying_ = false

	arg_9_0:RefreshUI()
end

function var_0_0.RefreshUI(arg_10_0)
	arg_10_0.drawInteractBtn_.enabled = true

	local var_10_0 = arg_10_0.params_.draw_list or {}

	arg_10_0.list_ = {}
	arg_10_0.maxRare_ = 0
	arg_10_0.isSkin_ = false
	arg_10_0.isScene_ = false

	local var_10_1 = {}

	for iter_10_0 = #var_10_0, 1, -1 do
		local var_10_2 = var_10_0[iter_10_0]
		local var_10_3 = ActivityLimitedDrawPoolCfg[var_10_2].reward[1]
		local var_10_4 = var_10_3[1]
		local var_10_5 = ItemCfg[var_10_4]
		local var_10_6 = var_10_5.type

		if var_10_6 == ItemConst.ITEM_TYPE.HERO_SKIN then
			arg_10_0.isSkin_ = true
			arg_10_0.skinDropID_ = var_10_2
		elseif var_10_6 == ItemConst.ITEM_TYPE.SCENE then
			arg_10_0.isScene_ = true
		end

		table.insert(arg_10_0.list_, var_10_2)
		table.insert(var_10_1, var_10_3)

		local var_10_7 = 1
		local var_10_8 = var_10_5.rare >= 5 and 3 or var_10_5.rare == 4 and 2 or 1

		arg_10_0.maxRare_ = var_10_8 < arg_10_0.maxRare_ and arg_10_0.maxRare_ or var_10_8
	end

	local var_10_9

	if arg_10_0.isSkin_ or arg_10_0.isScene_ then
		arg_10_0.typeCon_:SetSelectedState("special")

		var_10_9 = arg_10_0.timelineGo_special
		arg_10_0.effect_ = arg_10_0.soundEffect_.sound_special
	else
		arg_10_0.typeCon_:SetSelectedState(arg_10_0.maxRare_)

		var_10_9 = arg_10_0["timelineGo_" .. arg_10_0.maxRare_]
		arg_10_0.effect_ = arg_10_0.soundEffect_["sound_" .. arg_10_0.maxRare_]
	end

	if var_10_9 then
		arg_10_0.playable_ = var_10_9:GetComponent("PlayableDirector")

		arg_10_0.playable_:Evaluate()

		arg_10_0.playable_.time = 0
	end
end

function var_0_0.SkipFunc(arg_11_0)
	if #arg_11_0.list_ > 1 then
		if arg_11_0.isSkin_ then
			arg_11_0:AfterTimeline({
				arg_11_0.skinDropID_
			})
		else
			JumpTools.OpenPageByJump("/activitySkinResultReward", {
				list = arg_11_0.list_,
				activityID = arg_11_0.params_.activityID
			})
		end
	else
		arg_11_0:AfterTimeline(arg_11_0.list_)
	end
end

function var_0_0.AfterTimeline(arg_12_0, arg_12_1)
	JumpTools.OpenPageByJump("/activitySkinDrawReward", {
		showList = arg_12_1,
		list = arg_12_0.list_,
		activityID = arg_12_0.params_.activityID
	})
end

function var_0_0.OnTop(arg_13_0)
	manager.windowBar:HideBar()
end

function var_0_0.OnExit(arg_14_0)
	arg_14_0.playable_.time = 0
	arg_14_0.playable_ = nil
end

function var_0_0.Dispose(arg_15_0)
	arg_15_0:RemoveAllListeners()
	arg_15_0.super.Dispose(arg_15_0)
end

return var_0_0
