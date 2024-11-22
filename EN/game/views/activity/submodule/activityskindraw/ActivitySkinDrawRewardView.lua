local var_0_0 = class("ActivitySkinDrawRewardView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return ActivitySkinDrawTools.GetDrawRewardUIName(arg_1_0.params_.activityID)
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
		sound_2 = "search_scene_03_purple",
		sound_3 = "search_scene_03_gold",
		sound_1 = "search_scene_03_blue",
		sound_special = "search_scene_03_special"
	}
	arg_4_0.typeGo_ = {}
	arg_4_0.typeItem_ = {}
end

function var_0_0.AddUIListeners(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.nextBtn_, nil, function()
		arg_5_0:NextCode()
	end)
	arg_5_0:AddBtnListener(arg_5_0.skipBtn_, nil, function()
		arg_5_0:GotoResult()
	end)
end

function var_0_0.OnEnter(arg_8_0)
	arg_8_0.index_ = 0
	arg_8_0.list_ = arg_8_0.params_.list
	arg_8_0.showList_ = arg_8_0.params_.showList

	arg_8_0:RefreshGoList()
	arg_8_0:NextCode()
end

function var_0_0.RefreshGoList(arg_9_0)
	if arg_9_0.activityID_ ~= arg_9_0.params_.activityID then
		arg_9_0.typeGo_ = ActivitySkinDrawTools.GetTypeGo(arg_9_0.params_.activityID)
		arg_9_0.activityID_ = arg_9_0.params_.activityID

		for iter_9_0, iter_9_1 in pairs(arg_9_0.typeItem_) do
			iter_9_1:Dispose()
		end

		arg_9_0.typeItem_ = {}
	end
end

function var_0_0.NextCode(arg_10_0)
	if arg_10_0.curItem_ then
		arg_10_0.curItem_:Hide()
	end

	if arg_10_0.index_ < #arg_10_0.showList_ then
		arg_10_0.index_ = arg_10_0.index_ + 1

		local var_10_0 = arg_10_0.showList_[arg_10_0.index_]
		local var_10_1 = ActivityLimitedDrawPoolCfg[var_10_0]
		local var_10_2 = var_10_1.reward[1][1]
		local var_10_3 = var_10_1.reward[1][2]
		local var_10_4 = ItemCfg[var_10_2]
		local var_10_5 = 1
		local var_10_6 = var_10_1.minimum_guarantee == 2 and 3 or 2
		local var_10_7 = false
		local var_10_8 = ItemCfg[var_10_2]

		if var_10_8.type == ItemConst.ITEM_TYPE.HERO_SKIN or var_10_8.type == ItemConst.ITEM_TYPE.SCENE then
			var_10_7 = true
		end

		if var_10_7 then
			if var_10_8.type == ItemConst.ITEM_TYPE.HERO_SKIN then
				arg_10_0:ShowAni("special", var_10_8, var_10_3)
			else
				arg_10_0:ShowReward("special", var_10_8, var_10_3)
			end
		else
			arg_10_0:ShowReward(var_10_6, var_10_8, var_10_3)
		end
	else
		arg_10_0:GotoResult()
	end
end

function var_0_0.ShowAni(arg_11_0, arg_11_1, arg_11_2, arg_11_3)
	manager.audio:PlayEffect("ui_system_search", "search_scene_musicdown", "")

	if not arg_11_0.typeItem_.movie then
		local var_11_0 = Asset.Load(arg_11_0.typeGo_.movie)
		local var_11_1 = Object.Instantiate(var_11_0, arg_11_0.content_)

		arg_11_0.typeItem_.movie = ActivitySkinDrawMovieView.New(var_11_1)
	end

	SetActive(arg_11_0.skipBtn_, false)

	arg_11_0.nextBtn_.interactable = false

	arg_11_0.typeItem_.movie:SetData(arg_11_2, function()
		manager.audio:PlayEffect("ui_system_search", "search_scene_musicup", "")
		SetActive(arg_11_0.skipBtn_, true)

		arg_11_0.nextBtn_.interactable = true

		arg_11_0:ShowReward(arg_11_1, arg_11_2, arg_11_3)
	end)
end

function var_0_0.ShowReward(arg_13_0, arg_13_1, arg_13_2, arg_13_3)
	if not arg_13_0.typeItem_[arg_13_1] then
		local var_13_0 = Asset.Load(arg_13_0.typeGo_[arg_13_1])
		local var_13_1 = Object.Instantiate(var_13_0, arg_13_0.content_)

		arg_13_0.typeItem_[arg_13_1] = ActivitySkinDrawShowView.New(var_13_1)
	end

	arg_13_0.typeItem_[arg_13_1]:SetData(arg_13_1, arg_13_2, arg_13_3)

	arg_13_0.curItem_ = arg_13_0.typeItem_[arg_13_1]

	manager.audio:StopEffect()
	manager.audio:PlayEffect("ui_system_search", arg_13_0.soundEffect_["sound_" .. arg_13_1], "")
end

function var_0_0.GotoResult(arg_14_0)
	if #arg_14_0.list_ > 1 then
		JumpTools.OpenPageByJump("/activitySkinResultReward", {
			list = arg_14_0.list_,
			activityID = arg_14_0.params_.activityID
		})
	else
		local var_14_0 = ActivityTools.GetMainActivityId(arg_14_0.params_.activityID)

		JumpTools.OpenPageByJump("/activityskinDraw", {
			activityID = var_14_0
		})
	end
end

function var_0_0.OnTop(arg_15_0)
	manager.windowBar:HideBar()
end

function var_0_0.OnExit(arg_16_0)
	SetActive(arg_16_0.skipBtn_, true)

	arg_16_0.nextBtn_.interactable = true

	if arg_16_0.curItem_ then
		arg_16_0.curItem_:Hide()

		arg_16_0.curItem_ = nil
	end

	for iter_16_0, iter_16_1 in pairs(arg_16_0.typeItem_) do
		iter_16_1:OnExit()
	end

	manager.audio:StopEffect()
end

function var_0_0.Dispose(arg_17_0)
	arg_17_0:RemoveAllListeners()

	for iter_17_0, iter_17_1 in pairs(arg_17_0.typeItem_) do
		iter_17_1:Dispose()
	end

	arg_17_0.super.Dispose(arg_17_0)
end

return var_0_0
