local var_0_0 = class("DailySignPage", BaseSignPage)

function var_0_0.OnCtor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.hander_ = arg_1_1

	local var_1_0 = Asset.Load("Widget/System/ActivitySign/SignUI")

	arg_1_0.gameObject_ = Object.Instantiate(var_1_0, arg_1_2)
	arg_1_0.transform_ = arg_1_0.gameObject_.transform

	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	arg_2_0:InitUI()
end

function var_0_0.InitUI(arg_3_0)
	arg_3_0:BindCfgUI()

	arg_3_0.animPlaying = false
	arg_3_0.signItem_ = {}
end

function var_0_0.OnShow(arg_4_0)
	arg_4_0:RefreshSignItem()
end

function var_0_0.OnHide(arg_5_0)
	if arg_5_0.timer_ then
		arg_5_0.timer_:Stop()

		arg_5_0.timer_ = nil
	end
end

function var_0_0.RefreshSignItem(arg_6_0)
	local var_6_0 = SignData:GetDailySignInfo().month
	local var_6_1 = manager.time:CalcMonthDays(manager.time:STimeDescS(manager.time:GetServerTime(), "!%Y"), var_6_0)

	for iter_6_0 = #arg_6_0.signItem_, var_6_1 + 1, -1 do
		arg_6_0.signItem_[iter_6_0]:Show(false)
	end

	for iter_6_1 = 1, var_6_1 do
		if not arg_6_0.signItem_[iter_6_1] then
			local var_6_2 = Object.Instantiate(arg_6_0.itemGo_, arg_6_0.contentParent_)

			arg_6_0.signItem_[iter_6_1] = DailySignItem.New(arg_6_0, var_6_2)
		end

		local var_6_3 = {
			month = var_6_0,
			day = iter_6_1,
			state = SignTools.GetDailySignState(iter_6_1)
		}

		arg_6_0.signItem_[iter_6_1]:SetData(var_6_3)
	end
end

function var_0_0.AutoGetReward(arg_7_0)
	arg_7_0.signIndex_ = SignTools.GetDailySignIndex()

	if arg_7_0.signIndex_ > 0 then
		manager.notify:CallUpdateFunc(SIGN_INPUT, false)

		arg_7_0.timer_ = Timer.New(function()
			SignAction.QueryDailySign()
		end, 0.033, 1)

		arg_7_0.timer_:Start()
	end
end

function var_0_0.OnSign(arg_9_0, arg_9_1)
	if isSuccess(arg_9_1.result) then
		if arg_9_0.signIndex_ <= 0 then
			return
		end

		arg_9_0.signItem_[arg_9_0.signIndex_]:StartPlayAnimator()

		arg_9_0.timer_ = Timer.New(function()
			if arg_9_0.signItem_[arg_9_0.signIndex_]:GetAnimator():GetCurrentAnimatorStateInfo(0).normalizedTime >= 2 or not arg_9_0.animPlaying then
				if arg_9_0.animPlaying then
					manager.notify:CallUpdateFunc(READY_TO_SKIP_SIGN_ANIMATION, true)
				end

				local var_10_0 = arg_9_1.item_list

				getReward2(var_10_0, {
					ItemConst.ITEM_TYPE.HERO,
					ItemConst.ITEM_TYPE.WEAPON_SERVANT
				}, handler(arg_9_0.hander_, arg_9_0.hander_.CheckSign))
				arg_9_0.timer_:Stop()

				arg_9_0.timer_ = nil
			end
		end, 0.033, -1)

		manager.notify:CallUpdateFunc(SIGN_INPUT, true)
		manager.notify:CallUpdateFunc(READY_TO_SKIP_SIGN_ANIMATION, false)
		arg_9_0.timer_:Start()
	else
		manager.notify:CallUpdateFunc(SIGN_INPUT, true)
		ShowTips(arg_9_1.result)
	end
end

function var_0_0.Dispose(arg_11_0)
	for iter_11_0, iter_11_1 in ipairs(arg_11_0.signItem_) do
		iter_11_1:Dispose()
	end

	arg_11_0.signItem_ = {}

	var_0_0.super.Dispose(arg_11_0)
end

return var_0_0
