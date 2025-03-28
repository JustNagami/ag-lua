local var_0_0 = {}

manager.net:Bind(84311, function(arg_1_0)
	SkinDiscountGiftData:InitData(arg_1_0)
end)

function var_0_0.BuySkinDiscountGift(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	manager.net:SendWithLoadingNew(84312, {
		buy_id = arg_2_2,
		activity_id = arg_2_0,
		gift_id = arg_2_1
	}, 84313, function(arg_3_0)
		if isSuccess(arg_3_0.result) then
			SkinDiscountGiftData:AddUsedTimes(arg_2_1)

			local var_3_0 = SkinDiscountGiftData:GetGoodsIDList()

			var_0_0.DoReward(var_3_0, function()
				getReward(mergeReward(arg_3_0.give_items))
				SkinDiscountGiftData:ClearGoodsIDList()
				arg_2_3()
			end)
		else
			ShowTips(arg_3_0.result)
		end
	end)
end

function var_0_0.DoReward(arg_5_0, arg_5_1)
	local var_5_0 = {}
	local var_5_1 = {}

	for iter_5_0, iter_5_1 in ipairs(arg_5_0) do
		local var_5_2 = iter_5_1.skinGoodsID
		local var_5_3 = iter_5_1.sceneGoodsID

		if var_5_3 and iter_5_1.isSelectSceneID then
			table.insert(var_5_0, {
				goodId = var_5_2,
				dlcId = var_5_3
			})
		else
			table.insert(var_5_1, var_5_2)
		end
	end

	if #var_5_0 > 0 then
		JumpTools.OpenPageByJump("/skinDlcListShow", {
			dlcPlayList = var_5_0,
			callBack = function()
				var_0_0.DoSkinReward(var_5_1, 1, arg_5_1)
			end
		})
	else
		var_0_0.DoSkinReward(var_5_1, 1, arg_5_1)
	end
end

function var_0_0.DoSkinReward(arg_7_0, arg_7_1, arg_7_2)
	if arg_7_1 > #arg_7_0 then
		arg_7_2()

		return
	end

	local var_7_0 = {
		doNextHandler = function()
			arg_7_1 = arg_7_1 + 1

			var_0_0.DoSkinReward(arg_7_0, arg_7_1, arg_7_2)
		end,
		itemList = {
			{
				num = 1,
				id = SkinDiscountGiftTools.GetItemIDByGoodsID(arg_7_0[arg_7_1])
			}
		},
		obtainsParams = {}
	}

	gameContext:Go("obtainView", var_7_0)
end

function var_0_0.DoNextReward(arg_9_0, arg_9_1, arg_9_2)
	if arg_9_1 > #arg_9_0 then
		arg_9_2()

		return
	end

	local var_9_0 = arg_9_0[arg_9_1].skinGoodsID
	local var_9_1 = arg_9_0[arg_9_1].sceneGoodsID

	if var_9_1 and arg_9_0[arg_9_1].isSelectSceneID then
		JumpTools.OpenPageByJump("/skinDlcShow", {
			goodId = var_9_0,
			dlcId = var_9_1,
			callBack = function()
				arg_9_1 = arg_9_1 + 1

				var_0_0.DoNextReward(arg_9_0, arg_9_1, arg_9_2)
			end
		})
	else
		local var_9_2 = {
			doNextHandler = function()
				arg_9_1 = arg_9_1 + 1

				var_0_0.DoNextReward(arg_9_0, arg_9_1, arg_9_2)
			end,
			itemList = {
				{
					num = 1,
					id = SkinDiscountGiftTools.GetItemIDByGoodsID(var_9_0)
				}
			},
			obtainsParams = {}
		}

		gameContext:Go("obtainView", var_9_2)
	end
end

function var_0_0.GetSkinGiveBackList(arg_12_0)
	local var_12_0 = {}
	local var_12_1 = getShopCfg(arg_12_0[1].buy_id)
	local var_12_2 = getShopCfg(arg_12_0[2].buy_id)
	local var_12_3
	local var_12_4

	if var_12_1.description then
		var_12_3 = RechargeShopDescriptionCfg[var_12_1.description]
	else
		var_12_3 = ItemCfg[var_12_1.give_id]
	end

	if var_12_2.description then
		var_12_4 = RechargeShopDescriptionCfg[var_12_2.description]
	else
		var_12_4 = ItemCfg[var_12_2.give_id]
	end

	local var_12_5 = var_12_3.param[1]
	local var_12_6 = {
		{
			var_12_5,
			1
		},
		{
			var_12_4.id,
			1
		}
	}

	if var_12_1.give_back_list and next(var_12_1.give_back_list) ~= nil then
		local var_12_7 = {}

		for iter_12_0, iter_12_1 in ipairs(var_12_1.give_back_list) do
			table.insert(var_12_7, {
				iter_12_1.id,
				iter_12_1.num
			})
		end

		table.insertto(var_12_6, var_12_7)
	end

	if var_12_2.give_back_list and next(var_12_2.give_back_list) ~= nil then
		local var_12_8 = {}

		for iter_12_2, iter_12_3 in ipairs(var_12_2.give_back_list) do
			table.insert(var_12_8, {
				iter_12_3.id,
				iter_12_3.num
			})
		end

		table.insertto(var_12_6, var_12_8)
	end

	local var_12_9 = formatRewardCfgList(var_12_6)

	return (mergeReward(var_12_9))
end

function var_0_0.InitRedPoint(arg_13_0)
	local var_13_0 = {
		string.format("%s_%s", RedPointConst.SKIN_DISCOUNT_GIFT_OPEN, arg_13_0)
	}

	for iter_13_0, iter_13_1 in ipairs(ActivityCfg[arg_13_0].sub_activity_list) do
		if ActivityCfg[iter_13_1].activity_template == ActivityTemplateConst.SKIN_DISCOUNT_GIFT_SIGN then
			local var_13_1 = string.format("%s_%s", RedPointConst.SIGN_SEVEN_DAY, iter_13_1)

			table.insert(var_13_0, var_13_1)
		end
	end

	manager.redPoint:addGroup(RedPointConst.SKIN_DISCOUNT_GIFT, {
		string.format("%s_%s", RedPointConst.SKIN_DISCOUNT_GIFT, arg_13_0)
	})
	manager.redPoint:addGroup(string.format("%s_%s", RedPointConst.SKIN_DISCOUNT_GIFT, arg_13_0), var_13_0)
	var_0_0.RefresRedPointNewTag(arg_13_0)
end

function var_0_0.RefresRedPointNewTag(arg_14_0)
	local var_14_0 = SkinDiscountGiftTools.GetSignActivityID(arg_14_0)
	local var_14_1 = SkinDiscountGiftTools.GetSignState(var_14_0, 1)
	local var_14_2 = 1

	if var_14_1 and var_14_1 ~= ActivityConst.SIGN_STATE.NONE or not SkinDiscountGiftTools.HasGiftActivityID() then
		var_14_2 = 0
	end

	manager.redPoint:setTip(string.format("%s_%s", RedPointConst.SKIN_DISCOUNT_GIFT_OPEN, arg_14_0), var_14_2, RedPointStyle.SHOW_NEW_TAG)
end

function var_0_0.ClearRedPointNewTag(arg_15_0)
	manager.redPoint:setTip(string.format("%s_%s", RedPointConst.SKIN_DISCOUNT_GIFT_OPEN, arg_15_0), 0, RedPointStyle.SHOW_NEW_TAG)
end

function var_0_0.JumpToSkinDiscountGiftWindow(arg_16_0)
	local var_16_0 = SkinDiscountGiftTools.GetDiscountActivityID(arg_16_0)

	if var_16_0 then
		OperationRecorder.RecordButtonTouch({
			button_name = "homepage_banner_activity_" .. var_16_0
		})
		JumpTools.GoToSystem("/skinDiscountGiftMain", {
			activityID = var_16_0
		}, ViewConst.SYSTEM_ID.SKIN_DISCOUNT_GIFT)
	end
end

return var_0_0
