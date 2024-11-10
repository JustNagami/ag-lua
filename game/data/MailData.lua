local var_0_0 = singletonClass("MailData")
local var_0_1 = 0
local var_0_2 = 0
local var_0_3 = 0
local var_0_4 = 0
local var_0_5 = {}
local var_0_6 = {}
local var_0_7 = {
	tag = "官方",
	name = "奥林匹亚速运",
	type = "mail"
}

function var_0_0.Init()
	var_0_1 = 0
	var_0_2 = 0
	var_0_3 = 0
	var_0_4 = 0
	var_0_5 = {}
	var_0_6 = {}
end

function var_0_0.MailInit(arg_2_0)
	if arg_2_0.unread_number > var_0_1 then
		var_0_3 = manager.time:GetServerTime()

		saveData("mail", "arrive", manager.time:GetServerTime())
	end

	var_0_1 = arg_2_0.unread_number
	var_0_2 = arg_2_0.total_number

	saveData("mail", "unread", tostring(var_0_1))
	manager.notify:Invoke(MAIL_LIST_UPDATE)
	manager.notify:Invoke(MAIL_BRIEF_UPDATE)
end

function var_0_0.getNextMail(arg_3_0)
	MailAction.TryToGetMailListFromServer()
end

function var_0_0.IsMailDataComplete()
	return var_0_2 <= #var_0_6
end

local var_0_8

function var_0_0.GetMailListFromServer(arg_5_0)
	var_0_8 = arg_5_0

	MailAction.TryToGetMailListFromServer()
end

function var_0_0.OnGetMailListFromServer(arg_6_0)
	var_0_2 = arg_6_0.total_num

	var_0_0.OnMailListGet(arg_6_0.mail_list)
	var_0_0.OnGetWholeMailList()
end

function var_0_0.OnMailListGet(arg_7_0)
	for iter_7_0, iter_7_1 in ipairs(arg_7_0) do
		local var_7_0 = var_0_5[iter_7_1.id] ~= nil

		if iter_7_1.id == "196690" then
			CustomLog.Log(debug.traceback(string.format("196690")))
		end

		var_0_5[iter_7_1.id] = {
			id = iter_7_1.id,
			date = iter_7_1.date,
			title = iter_7_1.title,
			attach_flag = iter_7_1.attach_flag,
			read_flag = iter_7_1.read_flag,
			timeout_timestamp = iter_7_1.timeout_timestamp,
			star_state = iter_7_1.star_state or 0,
			mail_template_id = iter_7_1.mail_template_id or 0,
			title_format = {},
			i18n_info_title = {},
			link_param = {}
		}

		for iter_7_2, iter_7_3 in ipairs(iter_7_1.i18n_info) do
			var_0_5[iter_7_1.id].i18n_info_title[iter_7_3.language] = iter_7_3.string
		end

		if iter_7_1.link_param then
			for iter_7_4, iter_7_5 in ipairs(iter_7_1.link_param) do
				table.insert(var_0_5[iter_7_1.id].link_param, iter_7_5)
			end
		end

		if var_0_5[iter_7_1.id].mail_template_id ~= 0 then
			for iter_7_6, iter_7_7 in ipairs(iter_7_1.title_format) do
				table.insert(var_0_5[iter_7_1.id].title_format, {
					type = iter_7_7.type,
					id = iter_7_7.content_format
				})
			end
		end

		if not var_7_0 then
			table.insert(var_0_6, iter_7_1.id)
		end

		if var_0_0.GetCachedReadFlag(iter_7_1.id) >= 0 then
			var_0_5[iter_7_1.id].read_flag = var_0_0.GetCachedReadFlag(iter_7_1.id)
		end

		local var_7_1 = formatRewardCfgList(iter_7_1.attachment_list)

		var_0_5[iter_7_1.id].rewardList = var_7_1
	end
end

function var_0_0.OnGetWholeMailList()
	if var_0_8 then
		var_0_8()

		var_0_8 = nil
	end
end

function var_0_0.DeleteMail(arg_9_0)
	for iter_9_0, iter_9_1 in ipairs(arg_9_0) do
		if var_0_5[iter_9_1] == nil then
			break
		end

		var_0_0.DeleteCachedReadFlag(iter_9_1)

		if var_0_5[iter_9_1].read_flag == 1 then
			var_0_1 = var_0_1 - 1
		end

		var_0_5[iter_9_1] = nil
		var_0_2 = var_0_2 - 1

		for iter_9_2 = #var_0_6, 1, -1 do
			if var_0_6[iter_9_2] == iter_9_1 then
				table.remove(var_0_6, iter_9_2)

				break
			end
		end
	end

	MailAction.UpdateMailUnread()
	manager.notify:Invoke(MAIL_LIST_UPDATE)
end

local var_0_9

function var_0_0.TryToGetMailDetail(arg_10_0, arg_10_1)
	var_0_9 = arg_10_1

	if var_0_5[arg_10_0].content_list then
		if var_0_9 ~= nil then
			var_0_9()

			var_0_9 = nil
		end

		return
	end

	MailAction.TryToGetMailDetailFromServer(arg_10_0)
end

local var_0_10 = {
	SENDER = 2,
	TITLE = 1,
	CONTENT = 3
}

function var_0_0.OnGetMailDetailFromServer(arg_11_0)
	if arg_11_0.detail_info.id == "196690" then
		CustomLog.Log(debug.traceback(string.format("196690")))
	end

	local var_11_0 = var_0_5[arg_11_0.detail_info.id]

	var_11_0.content_list = arg_11_0.detail_info.content_list
	var_11_0.sender = arg_11_0.detail_info.sender
	var_11_0.mail_template_id = arg_11_0.detail_info.mail_template_id or 0
	var_11_0.sender_format = arg_11_0.detail_info.sender_format
	var_11_0.content_format = {}

	if var_11_0.mail_template_id ~= 0 then
		for iter_11_0, iter_11_1 in ipairs(arg_11_0.detail_info.content_format) do
			table.insert(var_11_0.content_format, {
				type = iter_11_1.type,
				id = iter_11_1.content_format
			})
		end
	end

	var_11_0.i18n_info_sender = {}
	var_11_0.i18n_info_content = {}

	for iter_11_2, iter_11_3 in pairs(arg_11_0.detail_info.i18n_info) do
		if iter_11_3.type == var_0_10.SENDER then
			var_11_0.i18n_info_sender[iter_11_3.language] = iter_11_3.string
		elseif iter_11_3.type == var_0_10.CONTENT then
			var_11_0.i18n_info_content[iter_11_3.language] = iter_11_3.content
		end
	end

	var_11_0.link_param = {}

	if arg_11_0.detail_info.link_param then
		for iter_11_4, iter_11_5 in ipairs(arg_11_0.detail_info.link_param) do
			table.insert(var_11_0.link_param, iter_11_5)
		end
	end

	var_11_0.read_flag = 2

	if var_11_0.attach_flag == 0 then
		var_0_1 = var_0_1 - 1

		MailAction.UpdateMailUnread()
		saveData("mail", "unread", tostring(var_0_1))
		manager.notify:Invoke(MAIL_BRIEF_UPDATE)
	end

	if var_0_9 ~= nil then
		var_0_9()

		var_0_9 = nil
	end

	manager.notify:Invoke(MAIL_INFO_UPDATE, var_11_0)
end

function var_0_0.GetMailAttachment(arg_12_0)
	for iter_12_0, iter_12_1 in ipairs(arg_12_0) do
		if var_0_5[iter_12_1] then
			var_0_5[iter_12_1].attach_flag = 2
			var_0_5[iter_12_1].read_flag = 2

			manager.notify:Invoke(MAIL_INFO_UPDATE, var_0_5[iter_12_1])
		end

		var_0_1 = var_0_1 - 1

		MailAction.UpdateMailUnread()
	end

	saveData("mail", "unread", tostring(var_0_1))
	manager.notify:Invoke(MAIL_BRIEF_UPDATE)
end

function var_0_0.ClickMailBtn(arg_13_0)
	var_0_4 = arg_13_0
end

function var_0_0.HaveMailRead(arg_14_0)
	if var_0_5[arg_14_0] then
		return var_0_5[arg_14_0].read_flag == 0 or var_0_5[arg_14_0].read_flag == 2
	end

	return false
end

function var_0_0.CacheReadFlag(arg_15_0)
	if var_0_5[arg_15_0] then
		var_0_5[arg_15_0].read_flag = 2

		saveData("mail_read_flag", arg_15_0, 2)
		manager.notify:Invoke(MAIL_INFO_UPDATE, var_0_5[arg_15_0])
	end
end

function var_0_0.DeleteCachedReadFlag(arg_16_0)
	if var_0_5[arg_16_0] then
		saveData("mail_read_flag", arg_16_0, nil)
	end
end

function var_0_0.GetCachedReadFlag(arg_17_0)
	if var_0_5[arg_17_0] then
		return getData("mail_read_flag", arg_17_0) or -1
	end

	return -1
end

function var_0_0.SortMailManual()
	table.sort(var_0_6, function(arg_19_0, arg_19_1)
		local var_19_0 = var_0_5[arg_19_0]
		local var_19_1 = var_0_5[arg_19_1]

		if var_19_0.attach_flag == 1 and var_19_1.attach_flag ~= 1 then
			return true
		elseif var_19_0.attach_flag ~= 1 and var_19_1.attach_flag == 1 then
			return false
		end

		local var_19_2 = (var_0_0.GetCachedReadFlag(arg_19_0) == 2 or var_19_0.read_flag == 2) and 1 or 0
		local var_19_3 = (var_0_0.GetCachedReadFlag(arg_19_1) == 2 or var_19_1.read_flag == 2) and 1 or 0

		if var_19_2 ~= var_19_3 then
			return var_19_2 < var_19_3
		end

		if var_19_0.star_state ~= var_19_1.star_state then
			return var_19_0.star_state > var_19_1.star_state
		end

		if var_19_0.date > var_19_1.date then
			return true
		elseif var_19_0.date < var_19_1.date then
			return false
		end

		return arg_19_1 < arg_19_0
	end)
end

function var_0_0.SetMailStar(arg_20_0, arg_20_1)
	local var_20_0 = var_0_0.GetMail(tostring(arg_20_0))

	var_20_0.star_state = arg_20_1

	if var_20_0.star_state == 1 then
		var_0_0.SortMailManual()
	end

	manager.notify:Invoke(MAIL_STAR_UPDATE, var_20_0)
end

function var_0_0.GetMailSort()
	return var_0_6
end

function var_0_0.GetTimeoutMailIdList()
	local var_22_0 = {}
	local var_22_1 = manager.time:GetServerTime()

	for iter_22_0, iter_22_1 in pairs(MailData.GetMailSort()) do
		if var_22_1 >= MailData.GetMail(iter_22_1).timeout_timestamp then
			table.insert(var_22_0, iter_22_1)
		end
	end

	return var_22_0
end

function var_0_0.GetTotal()
	return var_0_2
end

function var_0_0.GetUnread()
	return var_0_1
end

function var_0_0.GetArriveTime()
	return var_0_3
end

function var_0_0.GetClickTime()
	return var_0_4
end

function var_0_0.GetMail(arg_27_0)
	return var_0_5[arg_27_0]
end

function var_0_0.GetMailContent(arg_28_0)
	local var_28_0 = var_0_0.GetMail(arg_28_0)
	local var_28_1 = SettingData:GetCurrentLanguage()

	if var_28_0.mail_template_id ~= nil and var_28_0.mail_template_id ~= 0 then
		local var_28_2 = MailTemplateCfg[var_28_0.mail_template_id]
		local var_28_3 = {}
		local var_28_4 = {}

		for iter_28_0, iter_28_1 in ipairs(var_28_0.content_format) do
			if type(iter_28_1) == "table" then
				local var_28_5 = tonumber(iter_28_1.id)

				if iter_28_1.type == MailConst.MAIL_FORMAT_TYPE.NORMAL then
					table.insert(var_28_4, GetI18NText(iter_28_1.id))
				elseif iter_28_1.type == MailConst.MAIL_FORMAT_TYPE.ITEM then
					table.insert(var_28_4, GetI18NText(ItemTools.getItemName(var_28_5)))
				elseif iter_28_1.type == MailConst.MAIL_FORMAT_TYPE.SKIN then
					table.insert(var_28_4, GetI18NText(SkinCfg[var_28_5].name))
				elseif iter_28_1.type == MailConst.MAIL_FORMAT_TYPE.HERO then
					table.insert(var_28_4, GetI18NText(HeroTools.GetHeroFullName(var_28_5)))
				elseif iter_28_1.type == MailConst.MAIL_FORMAT_TYPE.ACTIVITY then
					table.insert(var_28_4, GetI18NText(ActivityCfg[var_28_5].remark))
				end
			else
				table.insert(var_28_4, GetI18NText(iter_28_1))
			end
		end

		local var_28_6 = {
			content_type = 2,
			text = string.format(GetI18NText(var_28_2.mail_desc), unpack(var_28_4))
		}

		table.insert(var_28_3, var_28_6)

		if var_28_2.event_type ~= 0 and var_28_2.event_type == 2 then
			local var_28_7 = {
				text = "",
				content_type = 1,
				image = var_28_2.image,
				event_type = var_28_2.event_type,
				event_arg = var_28_2.event_url
			}

			table.insert(var_28_3, var_28_7)
		end

		return var_28_3
	elseif var_28_0.i18n_info_content[var_28_1] then
		return var_28_0.i18n_info_content[var_28_1]
	else
		return var_28_0.content_list
	end
end

function var_0_0.GetMailTitle(arg_29_0)
	local var_29_0 = var_0_0.GetMail(arg_29_0)
	local var_29_1 = SettingData:GetCurrentLanguage()

	if var_29_0.mail_template_id ~= nil and var_29_0.mail_template_id ~= 0 then
		local var_29_2 = MailTemplateCfg[var_29_0.mail_template_id]
		local var_29_3 = GetI18NText(var_29_2.mail_title)
		local var_29_4 = {}

		for iter_29_0, iter_29_1 in ipairs(var_29_0.title_format) do
			if type(iter_29_1) == "table" then
				local var_29_5 = tonumber(iter_29_1.id)

				if iter_29_1.type == MailConst.MAIL_FORMAT_TYPE.NORMAL then
					table.insert(var_29_4, GetI18NText(iter_29_1.id))
				elseif iter_29_1.type == MailConst.MAIL_FORMAT_TYPE.ITEM then
					table.insert(var_29_4, GetI18NText(ItemTools.getItemName(var_29_5)))
				elseif iter_29_1.type == MailConst.MAIL_FORMAT_TYPE.SKIN then
					table.insert(var_29_4, GetI18NText(SkinCfg[var_29_5].name))
				elseif iter_29_1.type == MailConst.MAIL_FORMAT_TYPE.HERO then
					table.insert(var_29_4, GetI18NText(HeroTools.GetHeroFullName(var_29_5)))
				elseif iter_29_1.type == MailConst.MAIL_FORMAT_TYPE.ACTIVITY then
					table.insert(var_29_4, GetI18NText(ActivityCfg[var_29_5].remark))
				end
			else
				table.insert(var_29_4, GetI18NText(iter_29_1))
			end
		end

		return (string.format(var_29_3, unpack(var_29_4)))
	elseif var_29_0.i18n_info_title[var_29_1] then
		return var_29_0.i18n_info_title[var_29_1]
	else
		return var_29_0.title
	end
end

function var_0_0.GetMailSender(arg_30_0)
	local var_30_0 = var_0_0.GetMail(arg_30_0)
	local var_30_1 = SettingData:GetCurrentLanguage()

	if var_30_0.mail_template_id ~= nil and var_30_0.mail_template_id ~= 0 then
		local var_30_2 = MailTemplateCfg[var_30_0.mail_template_id].mail_sender

		return (string.format(var_30_2, unpack(var_30_0.sender_format)))
	elseif var_30_0.i18n_info_sender[var_30_1] then
		return var_30_0.i18n_info_sender[var_30_1]
	else
		return var_30_0.sender
	end
end

function var_0_0.GetSimpleData()
	return var_0_7
end

function var_0_0.IsSpecialMail(arg_32_0)
	local var_32_0 = var_0_0.GetMail(arg_32_0)

	if var_32_0.mail_template_id ~= nil and var_32_0.mail_template_id ~= 0 and MailTemplateCfg[var_32_0.mail_template_id].mail_type == 1 then
		return true
	end

	return false
end

return var_0_0
