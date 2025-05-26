local var_0_0 = {}

manager.net:Bind(30001, function(arg_1_0)
	MailData.MailInit(arg_1_0)
	var_0_0.UpdateMailUnread()
end)
manager.net:Bind(30013, function(arg_2_0)
	MailData.DeleteMail(arg_2_0.del_id_list)
	var_0_0.UpdateMailUnread()
end)

function var_0_0.TryToGetMailListFromServer()
	local var_3_0 = {}

	manager.net:SendWithLoadingNew(30002, var_3_0, 30003, var_0_0.OnGetMailListFromServer)
end

function var_0_0.OnGetMailListFromServer(arg_4_0, arg_4_1)
	MailData.OnGetMailListFromServer(arg_4_0)
	var_0_0.UpdateMailUnread()
end

function var_0_0.TryToGetMailDetailFromServer(arg_5_0)
	manager.net:SendWithLoadingNew(30008, {
		id = arg_5_0
	}, 30009, var_0_0.OnGetMailDetailFromServer)
end

function var_0_0.OnGetMailDetailFromServer(arg_6_0, arg_6_1)
	if isSuccess(arg_6_0.result) then
		MailData.OnGetMailDetailFromServer(arg_6_0)
	else
		MailData.DeleteMail({
			arg_6_1.id
		})
		ShowTips("TIP_MAIL_EXPIRED")
	end
end

function var_0_0.ReadMail(arg_7_0)
	MailData.CacheReadFlag(arg_7_0)
end

function var_0_0.DeleteOneMail(arg_8_0)
	manager.net:SendWithLoadingNew(30006, {
		id = arg_8_0
	}, 30007, var_0_0.OnDeleteMail)
end

function var_0_0.TryToDeteleMail()
	return manager.net:SendWithLoadingNew(30006, {
		id = 0
	}, 30007, var_0_0.OnDeleteMail)
end

function var_0_0.OnDeleteMail(arg_10_0, arg_10_1)
	if #arg_10_0.id_list <= 0 then
		ShowTips("NO_MAIL_CAN_BE_DELETED")

		return
	end

	ShowTips("SUCCESS_DELETE_MAIL")
	MailData.DeleteMail(arg_10_0.id_list)
	manager.notify:CallUpdateFunc(ON_MAIL_DELETE, arg_10_0.id_list)
end

function var_0_0.TryToGetMailAttachment(arg_11_0)
	manager.net:SendWithLoadingNew(30004, {
		id = arg_11_0
	}, 30005, var_0_0.OnGetMailAttachment)
end

function var_0_0.OnGetMailAttachment(arg_12_0, arg_12_1)
	if isSuccess(arg_12_0.result) then
		MailData.GetMailAttachment(arg_12_0.success_mail_ids)

		if #arg_12_0.attachment_list > 0 then
			local var_12_0 = {}

			for iter_12_0, iter_12_1 in ipairs(arg_12_0.attachment_list) do
				local var_12_1 = ItemCfg[iter_12_1.id]

				if var_12_1.sub_type == 404 or var_12_1.sub_type == 1702 then
					local var_12_2 = var_12_1.time
					local var_12_3 = ItemTools.GetItemExpiredTimeByID(iter_12_1.id)

					table.insert(var_12_0, {
						var_12_1.param[1],
						iter_12_1.num,
						0,
						var_12_3
					})
				else
					table.insert(var_12_0, iter_12_1)
				end
			end

			local var_12_4 = formatRewardCfgList(var_12_0)
			local var_12_5 = mergeReward(var_12_4)

			getReward(var_12_5, {
				ItemConst.ITEM_TYPE.HERO,
				ItemConst.ITEM_TYPE.WEAPON_SERVANT
			})
		end
	elseif arg_12_0.result == TipsCfg.get_id_list_by_define.ERROR_EQUIP_EXCEED_LIMIT then
		showBagFullBox()
	elseif arg_12_0.result == TipsCfg.get_id_list_by_define.ERROR_SERVANT_EXCEED_LIMIT then
		ShowMessageBox({
			content = GetTips("SERVANT_NUM_MAX"),
			OkCallback = function()
				JumpTools.OpenPageByJump("/weaponServantList")
			end,
			CancelCallback = function()
				return
			end
		})
	else
		if arg_12_0.result == 2100 then
			-- block empty
		end

		ShowTips(arg_12_0.result)
	end
end

function var_0_0.ReceiveAllMails()
	if #MailData.GetMailSort() < MailData.GetTotal() then
		MailData.GetMailListFromServer(handler(self, function()
			var_0_0.TryToGetMailAttachment(0)
		end))
	else
		var_0_0.TryToGetMailAttachment(0)
	end
end

function var_0_0.SortMailManual()
	MailData.SortMailManual()
end

function var_0_0.UpdateMailUnread()
	local var_18_0 = false
	local var_18_1 = false
	local var_18_2 = MailData.GetClickTime()

	if MailData.GetUnread() > 0 then
		if manager.time:IsToday(var_18_2) then
			var_18_0 = var_18_2 < MailData.GetArriveTime()
		else
			var_18_0 = true
		end
	else
		var_18_0 = false
	end

	for iter_18_0, iter_18_1 in pairs(MailData.GetMailSort()) do
		local var_18_3 = MailData.GetMail(iter_18_1)

		if var_18_3 and (var_18_3.read_flag == 1 or var_18_3.attach_flag == 1) then
			var_18_1 = true

			break
		end
	end

	manager.redPoint:setTip(RedPointConst.MAIL_UNREAD, (var_18_0 or var_18_1) and 1 or 0)
end

function var_0_0.SetMailStar(arg_19_0, arg_19_1)
	local var_19_0 = {
		mail_id = arg_19_0,
		state = arg_19_1
	}

	manager.net:SendWithLoadingNew(30014, var_19_0, 30015, var_0_0.OnSetMailStarCallback)
end

function var_0_0.OnSetMailStarCallback(arg_20_0, arg_20_1)
	if isSuccess(arg_20_0.result) then
		MailData.SetMailStar(arg_20_1.mail_id, arg_20_1.state)
	else
		ShowTips(GetTips(arg_20_0.result))
	end
end

return var_0_0
