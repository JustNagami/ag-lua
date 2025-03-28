local var_0_0 = import("game.views.regressionNew.pageViews.RegressionTaskContent")
local var_0_1 = class("RegressionCurrentActContent", var_0_0)

function var_0_1.InitNode(arg_1_0)
	arg_1_0.recommendActID = RegressionDataNew:GetReturnRecommendCfgData().recommend_activity

	arg_1_0:AddBtnListener(arg_1_0.goBtn_, nil, function()
		arg_1_0.isGoToActivity = true

		local var_2_0 = ChapterResidentTools.GetResidentActMainID(arg_1_0.recommendActID)

		if var_2_0 then
			local var_2_1 = ActivityData:GetActivityData(var_2_0).stopTime

			if var_2_1 and var_2_1 <= manager.time:GetServerTime() then
				JumpTools.GoToSystem("/chapterMap", {
					chapterToggle = BattleConst.TOGGLE.RESIDENT_ACT,
					activityID = arg_1_0.recommendActID
				})

				return
			end
		end

		local var_2_2 = var_2_0 or ActivityCfg.get_id_list_by_sub_activity_list[arg_1_0.recommendActID][1]

		if not ActivityData:GetActivityIsOpen(var_2_2) then
			ShowTips("SOLO_NOT_OPEN")

			return
		end

		local var_2_3 = ActivityEntraceCfg[var_2_2].theme
		local var_2_4, var_2_5 = ActivityTools.GetActivityMainRouteByTheme(var_2_3, arg_1_0.recommendActID)

		OpenPageUntilLoaded(var_2_4, var_2_5)
	end)
end

function var_0_1.GetSelectParams(arg_3_0)
	if not arg_3_0.isGoToActivity then
		return nil, nil
	end

	arg_3_0.isGoToActivity = false

	return 1, 2
end

function var_0_1.RefreshUI(arg_4_0)
	local var_4_0 = ActivityToggleCfg.get_id_list_by_activity_id[arg_4_0.recommendActID][1]

	if not var_4_0 then
		return
	end

	local var_4_1 = ActivityToggleCfg[var_4_0]

	arg_4_0.nameTxt_.text = GetI18NText(var_4_1.name)
	arg_4_0.descTxt_.text = GetI18NText(var_4_1.desc)

	local var_4_2 = var_4_1.class_name:GetUIName()

	if not arg_4_0.activityViewGo_ then
		local var_4_3 = Asset.Load(var_4_2)

		if var_4_3 then
			local var_4_4 = var_4_3.transform:Find("Bg")

			if var_4_4 == nil then
				var_4_4 = var_4_3.transform:Find("bg")
			end

			arg_4_0.activityViewGo_ = Object.Instantiate(var_4_4, arg_4_0.maskNode_).gameObject
			arg_4_0.activityViewGo_.transform.localScale = Vector3.one * 0.3
		end
	end

	arg_4_0:RefreshTime()
end

function var_0_1.RefreshTime(arg_5_0)
	arg_5_0.countDownTxt_.text = string.format(GetTips("LEFT_TIME"), ActivityTools.GetActivityLostTimeStrWith2Unit(arg_5_0.recommendActID))
end

function var_0_1.Dispose(arg_6_0)
	if not isNil(arg_6_0.activityViewGo_) then
		Object.Destroy(arg_6_0.activityViewGo_)

		arg_6_0.activityViewGo_ = nil
	end

	var_0_1.super.Dispose(arg_6_0)
end

return var_0_1
