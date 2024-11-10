local var_0_0 = class("DormVisitItem", ReduxView)

function var_0_0.OnCtor(arg_1_0, arg_1_1)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_1.transform

	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	arg_2_0:InitUI()
	arg_2_0:AddUIListener()
end

function var_0_0.InitUI(arg_3_0)
	arg_3_0:BindCfgUI()
end

function var_0_0.AddUIListener(arg_4_0)
	arg_4_0:AddBtnListener(arg_4_0.visitBtn_, nil, function()
		if arg_4_0.visitFunc then
			arg_4_0.visitFunc(arg_4_0.userID)
		end
	end)
	arg_4_0:AddBtnListener(arg_4_0.headBtn_, nil, function()
		if BackHomeDataManager:GetCurSystem() == DormEnum.DormSystemType.Main then
			ForeignInfoAction:TryToCheckForeignDetailInfo(arg_4_0.userID)
		else
			ForeignInfoAction:TryToCheckForeignDetailInfo(arg_4_0.userID, true)
		end
	end)
end

function var_0_0.RegisterEnterCallBack(arg_7_0, arg_7_1)
	if arg_7_1 then
		arg_7_0.visitFunc = arg_7_1
	end
end

function var_0_0.RefreshUI(arg_8_0, arg_8_1, arg_8_2)
	arg_8_0.userID = arg_8_1
	arg_8_0.type = arg_8_2

	local var_8_0 = DormVisitTools:GetTemplateExhibitList(arg_8_0.type)[arg_8_0.userID]

	if not var_8_0 then
		Debug.LogError("未获取到参观信息")

		return
	end

	arg_8_0.headiconImg_.sprite = ItemTools.getItemSprite(var_8_0.icon)

	arg_8_0.headiconImg_:SetNativeSize()

	arg_8_0.nickName.text = var_8_0.nick
	arg_8_0.likeNum.text = var_8_0.likeNum
	arg_8_0.frame.sprite = getSpriteWithoutAtlas("TextureConfig/Frame/" .. var_8_0.iconFrame)

	local var_8_1 = var_8_0.architecture_id

	if BackHomeCfg[var_8_1].type == DormConst.BACKHOME_TYPE.PublicDorm then
		arg_8_0.dormName.text = GetTips("DORM_LOBBY_NAME")
	else
		local var_8_2 = HeroRecordCfg.get_id_list_by_hero_id[var_8_0.heroIDList[1]][1]

		arg_8_0.dormName.text = string.format(GetTips("DORM_HERO_ROOM_NAME"), GetI18NText(HeroRecordCfg[var_8_2].name))
	end

	arg_8_0.levelNum.text = var_8_0.level
	arg_8_0.furTotalNum.text = math.max(var_8_0.furniture_num, 0)
end

function var_0_0.Dispose(arg_9_0)
	var_0_0.super.Dispose(arg_9_0)
end

return var_0_0
