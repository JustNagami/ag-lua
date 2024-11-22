local var_0_0 = class("ChapterBaseItemView", ReduxView)

function var_0_0.OnCtor(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4)
	arg_1_0.gameObject_ = Object.Instantiate(arg_1_1, arg_1_2.transform)
	arg_1_0.transform_ = arg_1_0.gameObject_.transform
	arg_1_0.chapterClientID_ = arg_1_3
	arg_1_0.chapterToggle_ = arg_1_4
	arg_1_0.transform_.name = arg_1_3
	arg_1_0.tempVector3_ = Vector3.New(0, 0, 0)

	arg_1_0:InitUI()
end

function var_0_0.OnEnter(arg_2_0)
	arg_2_0:RefrshData()
	arg_2_0:RefreshItem()
	arg_2_0:RefreshLock()
	arg_2_0:Show(true)
end

function var_0_0.Show(arg_3_0, arg_3_1)
	SetActive(arg_3_0.gameObject_, arg_3_1)
end

function var_0_0.OnExit(arg_4_0)
	arg_4_0:Show(false)
end

function var_0_0.Dispose(arg_5_0)
	var_0_0.super.Dispose(arg_5_0)
	Object.Destroy(arg_5_0.gameObject_)

	arg_5_0.gameObject_ = nil
	arg_5_0.transform_ = nil
end

function var_0_0.InitUI(arg_6_0)
	arg_6_0:BindCfgUI()
	arg_6_0:AddListeners()

	arg_6_0.lockController_ = arg_6_0.controllerEx_:GetController("lock")
	arg_6_0.timeController_ = arg_6_0.controllerEx_:GetController("time")

	arg_6_0.timeController_:SetSelectedState("state1")
end

function var_0_0.AddListeners(arg_7_0)
	arg_7_0:AddBtnListener(arg_7_0.btn_, nil, function()
		local var_8_0 = arg_7_0.chapterClientID_

		if BattleFieldData:GetCacheChapterClient(arg_7_0.chapterToggle_) ~= var_8_0 then
			BattleFieldData:SetCacheChapterClient(arg_7_0.chapterToggle_, var_8_0)
			manager.notify:Invoke(CHANGE_DUNGEON)

			return
		end

		BattleFieldData:SetCacheChapterClient(arg_7_0.chapterToggle_, var_8_0)

		if not arg_7_0:GetLockState() then
			SystemRedPoint:CancelNewTagByChapterId(var_8_0)
		end

		arg_7_0:ClickItem(var_8_0)
	end)
end

function var_0_0.RefrshData(arg_9_0)
	arg_9_0:IsNotice()
	arg_9_0:IsLock()
end

function var_0_0.IsNotice(arg_10_0)
	arg_10_0.notice_ = false
end

function var_0_0.GetLockState(arg_11_0)
	return arg_11_0.isLock_
end

function var_0_0.SetSiblingIndex(arg_12_0, arg_12_1)
	arg_12_0.transform_:SetSiblingIndex(arg_12_1)
end

function var_0_0.PlayAnimatorEnter(arg_13_0)
	if arg_13_0.gameObject_.activeInHierarchy then
		arg_13_0.animator_:Play("Fx_mapRenderItemt_cx", 0, 0)
		arg_13_0.animator_:Update(0)
	end
end

function var_0_0.PlayAnimatorExit(arg_14_0)
	if arg_14_0.gameObject_.activeInHierarchy then
		arg_14_0.animator_:Play("Fx_mapRenderItemt_xs", 0, 0)
		arg_14_0.animator_:Update(0)
	end
end

function var_0_0.RefreshItem(arg_15_0)
	local var_15_0 = ChapterClientCfg[arg_15_0.chapterClientID_]

	if not var_15_0 then
		return
	end

	arg_15_0.nameText_.text = GetI18NText(var_15_0.name)

	arg_15_0:RefreshCustomItem(var_15_0)
end

function var_0_0.RefreshCustomItem(arg_16_0, arg_16_1)
	return
end

function var_0_0.RefreshLock(arg_17_0)
	arg_17_0.lockController_:SetSelectedState(tostring(arg_17_0.isLock_))
end

function var_0_0.GetLocalPosition(arg_18_0)
	return arg_18_0.transform_.localPosition
end

function var_0_0.SetPosition(arg_19_0, arg_19_1, arg_19_2, arg_19_3)
	local var_19_0 = arg_19_0.transform_.localPosition

	arg_19_0.tempVector3_.x = arg_19_1
	arg_19_0.tempVector3_.y = arg_19_2
	arg_19_0.tempVector3_.z = var_19_0.z
	arg_19_0.transform_.localPosition = arg_19_0.tempVector3_
	arg_19_0.tempVector3_.x = arg_19_3
	arg_19_0.tempVector3_.y = arg_19_3
	arg_19_0.tempVector3_.z = 1
	arg_19_0.transform_.localScale = arg_19_0.tempVector3_
end

function var_0_0.InvokeBtn(arg_20_0)
	arg_20_0.isAbove_ = true

	arg_20_0.btn_.onClick:Invoke()
end

function var_0_0.GetChapterClientID(arg_21_0)
	return arg_21_0.chapterClientID_
end

function var_0_0.IsLock(arg_22_0)
	local var_22_0 = ChapterClientCfg[arg_22_0.chapterClientID_]
	local var_22_1, var_22_2 = JumpTools.GetSystemLockedText(var_22_0.jump_system)

	arg_22_0.isLock_ = var_22_1
	arg_22_0.lockTips_ = var_22_2
end

function var_0_0.GetLockTips(arg_23_0)
	return arg_23_0.lockTips_
end

return var_0_0
