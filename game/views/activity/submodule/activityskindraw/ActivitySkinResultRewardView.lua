local var_0_0 = class("ActivitySkinResultRewardView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return ActivitySkinDrawTools.GetDrawResultUIName(arg_1_0.params_.activityID)
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

	arg_4_0.btn_ = {}
	arg_4_0.icon_ = {}
	arg_4_0.role_ = {}
	arg_4_0.text_ = {}
	arg_4_0.name_ = {}
	arg_4_0.itemGo_ = {}
	arg_4_0.typeCon_ = {}

	for iter_4_0 = 1, 10 do
		arg_4_0.btn_[iter_4_0] = arg_4_0["btn_" .. iter_4_0]
		arg_4_0.icon_[iter_4_0] = arg_4_0["icon_" .. iter_4_0]
		arg_4_0.role_[iter_4_0] = arg_4_0["role_" .. iter_4_0]
		arg_4_0.text_[iter_4_0] = arg_4_0["text_" .. iter_4_0]
		arg_4_0.name_[iter_4_0] = arg_4_0["name_" .. iter_4_0]
		arg_4_0.itemGo_[iter_4_0] = arg_4_0["itemGo_" .. iter_4_0]
		arg_4_0.typeCon_[iter_4_0] = ControllerUtil.GetController(arg_4_0.itemGo_[iter_4_0].transform, "type")
	end
end

function var_0_0.AddUIListeners(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.bgBtn_, nil, function()
		JumpTools.OpenPageByJump("/activityskinDraw", {
			activityID = arg_5_0.mainActivityID_,
			isSceneDrawed = arg_5_0.isScene_
		})
	end)

	for iter_5_0, iter_5_1 in ipairs(arg_5_0.btn_) do
		arg_5_0:AddBtnListener(iter_5_1, nil, function()
			local var_7_0 = arg_5_0.list_[iter_5_0]
			local var_7_1 = ActivityLimitedDrawPoolCfg[var_7_0].reward[1][1]

			ShowPopItem(POP_ITEM, {
				var_7_1
			})
		end)
	end
end

function var_0_0.OnEnter(arg_8_0)
	arg_8_0.mainActivityID_ = ActivityTools.GetMainActivityId(arg_8_0.params_.activityID)

	arg_8_0:RefreshUI()
end

function var_0_0.RefreshUI(arg_9_0)
	arg_9_0.list_ = arg_9_0.params_.list

	table.sort(arg_9_0.list_, function(arg_10_0, arg_10_1)
		local var_10_0 = ActivityLimitedDrawPoolCfg[arg_10_0]
		local var_10_1 = var_10_0.reward[1][1]
		local var_10_2 = var_10_0.minimum_guarantee
		local var_10_3 = ActivityLimitedDrawPoolCfg[arg_10_1]
		local var_10_4 = var_10_3.reward[1][1]
		local var_10_5 = var_10_3.minimum_guarantee

		if var_10_2 ~= var_10_5 then
			return var_10_5 < var_10_2
		end

		return var_10_1 < var_10_4
	end)

	arg_9_0.isScene_ = false

	for iter_9_0, iter_9_1 in ipairs(arg_9_0.list_) do
		local var_9_0 = ActivityLimitedDrawPoolCfg[iter_9_1]
		local var_9_1 = var_9_0.reward[1]
		local var_9_2 = var_9_1[1]
		local var_9_3 = var_9_1[2]
		local var_9_4 = false
		local var_9_5 = ItemCfg[var_9_2].type
		local var_9_6 = 1
		local var_9_7 = var_9_0.minimum_guarantee == 2 and 3 or 2

		if var_9_5 == ItemConst.ITEM_TYPE.HERO_SKIN then
			var_9_4 = true

			arg_9_0.typeCon_[iter_9_0]:SetSelectedState("special")
		elseif var_9_5 == ItemConst.ITEM_TYPE.SCENE then
			arg_9_0.isScene_ = true

			arg_9_0.typeCon_[iter_9_0]:SetSelectedState("special")
		else
			arg_9_0.typeCon_[iter_9_0]:SetSelectedState(var_9_7)
		end

		if var_9_4 then
			SetActive(arg_9_0.icon_[iter_9_0].gameObject, false)
			SetActive(arg_9_0.role_[iter_9_0].gameObject, true)

			arg_9_0.role_[iter_9_0].sprite = getSpriteWithoutAtlas("TextureConfig/Character/Icon/" .. var_9_2)
		else
			SetActive(arg_9_0.icon_[iter_9_0].gameObject, true)
			SetActive(arg_9_0.role_[iter_9_0].gameObject, false)

			arg_9_0.icon_[iter_9_0].sprite = ItemTools.getItemSprite(var_9_2)

			arg_9_0.icon_[iter_9_0]:SetNativeSize()
		end

		arg_9_0.text_[iter_9_0].text = "X" .. var_9_3
		arg_9_0.name_[iter_9_0].text = ItemTools.getItemName(var_9_2)
	end
end

function var_0_0.OnTop(arg_11_0)
	manager.windowBar:HideBar()
end

function var_0_0.OnExit(arg_12_0)
	return
end

function var_0_0.Dispose(arg_13_0)
	arg_13_0:RemoveAllListeners()
	arg_13_0.super.Dispose(arg_13_0)
end

return var_0_0
