local var_0_0 = class("WeaponServantMainDetailModule", ReduxView)

function var_0_0.OnCtor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_1.transform

	arg_1_0:Init()
end

function var_0_0.BuildContext(arg_2_0)
	local var_2_0 = arg_2_0.gameObject_:GetComponent("ControllerExCollection")

	arg_2_0.controller = {
		comps = var_2_0,
		state = {
			btnState = {
				beyond = "beyond",
				name = "btnState",
				callName = "callName",
				unReached = "unReached",
				no = "no",
				detail = "detail",
				comps = var_2_0:GetController("btnState")
			},
			equipBtnState = {
				False = "false",
				name = "equipBtnState",
				True = "true",
				comps = var_2_0:GetController("equipBtnState")
			},
			callNameBtnState = {
				False = "false",
				name = "callNameBtnState",
				True = "true",
				comps = var_2_0:GetController("callNameBtnState")
			},
			star = {
				Star1 = "star1",
				name = "star",
				Star4 = "star4",
				Star5 = "star5",
				Star3 = "star3",
				Star2 = "star2",
				comps = var_2_0:GetController("star")
			}
		}
	}
	arg_2_0.data = {}
	arg_2_0.constVar = {
		GACHA_POOL_SYSTEM_LINK_ID = 403,
		curBtnStyle = 1,
		descType = 1,
		rareBg = "",
		subDescColor = "#70767F",
		btnStyleMap = {
			arg_2_0.controller.state.btnState.beyond,
			arg_2_0.controller.state.btnState.callName,
			arg_2_0.controller.state.btnState.detail
		},
		exchangeBtnLang = {
			Equip = GetTips("SERVANT_DETAIL_EQUIP"),
			Exchange = GetTips("TIP_CHANGE"),
			TakeOff = GetTips("SERVANT_DETAIL_UNLOAD"),
			Change = GetTips("TIP_CHANGE")
		},
		lockImg = {
			unlocked = "com_white_icon_26",
			locked = "com_white_icon_25"
		},
		proxy = HeroViewDataProxy.New(HeroConst.HERO_DATA_TYPE.DEFAULT)
	}
end

function var_0_0.InitContext(arg_3_0)
	arg_3_0.data = {
		servantAddLv = 0,
		heroId = 0,
		info = {},
		servantMap = ServantTools.GetServantMap()
	}
end

function var_0_0.Init(arg_4_0)
	arg_4_0:BindCfgUI()
	arg_4_0:BuildContext()
	arg_4_0:AddUIListener()
end

function var_0_0.AddUIListener(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.detailBtn_, nil, function()
		arg_5_0:OnSwitchDescClick()
	end)
	arg_5_0:AddBtnListener(arg_5_0.detailsBtn_, nil, function()
		arg_5_0:OnServantDetailClick()
	end)
	arg_5_0:AddBtnListener(arg_5_0.gachaBtn_, nil, function()
		arg_5_0:OnGachaBtnClick()
	end)
	arg_5_0:AddBtnListener(arg_5_0.callNameBtn_, nil, function()
		arg_5_0:OnCallNameBtnClick()
	end)
	arg_5_0:AddBtnListener(arg_5_0.exchangeBtn_, nil, function()
		arg_5_0:OnExchangeBtnClick()
	end)
	arg_5_0:AddBtnListener(arg_5_0.beyondBtn_, nil, function()
		arg_5_0:OnBeyondBtnClick()
	end)
	arg_5_0:AddBtnListener(arg_5_0.lockBtn_, nil, function()
		arg_5_0:OnLockBtnClick()
	end)
	TerminologyTools.AddTerminologyHandler(arg_5_0, arg_5_0.descTxt_, nil, nil)
end

function var_0_0.OnEnter(arg_13_0)
	return
end

function var_0_0.OnExit(arg_14_0)
	arg_14_0.constVar.descType = 1
end

function var_0_0.Dispose(arg_15_0)
	arg_15_0:RemoveAllListeners()
	var_0_0.super.Dispose(arg_15_0)
end

function var_0_0.RegisteCallNameClickCallback(arg_16_0, arg_16_1)
	arg_16_0.constVar.onCallNameClick = arg_16_1
end

function var_0_0.OnRenderServant(arg_17_0, arg_17_1, arg_17_2)
	if not arg_17_1 then
		return
	end

	arg_17_0:InitContext(arg_17_0.data)

	arg_17_0.data.info = arg_17_1

	local var_17_0 = arg_17_1.stage
	local var_17_1 = 0

	arg_17_0.data.heroId = arg_17_2

	if arg_17_2 and arg_17_2 > 0 then
		local var_17_2 = arg_17_0:GetHeroInfo(arg_17_2)

		var_17_1 = HeroTools.GetHeroWeaponAddLevel(var_17_2)
	end

	arg_17_0.data.servantAddLv = var_17_1

	if var_17_1 > 0 then
		arg_17_0.stageTxt_.text = string.format(GetTips("SERVANT_PROMOTE_LEVEL"), var_17_0, var_17_1)
	else
		arg_17_0.stageTxt_.text = string.format(GetTips("SERVANT_PROMOTE_LEVEL_1"), var_17_0)
	end

	local var_17_3 = arg_17_1.id
	local var_17_4 = WeaponServantCfg[var_17_3]
	local var_17_5 = ItemCfg[var_17_3]

	arg_17_0.nameTxt_.text = ItemTools.getItemName(var_17_5.id)

	arg_17_0:AsyncLoadIcon(var_17_3, function(arg_18_0, arg_18_1)
		if arg_17_0.gameObject_ and not isNil(arg_17_0.gameObject_) and arg_18_0 == arg_17_0.data.info.id then
			arg_17_0.servantImg_.sprite = getSpriteWithoutAtlas("TextureConfig/WeaponServant/Icon/" .. arg_18_0)
		end
	end)

	local var_17_6 = var_17_5.rare

	arg_17_0.gradeImg_.sprite = getSprite("Atlas/Com_DynamicAtlas", "ui_pop_grade_0" .. 6 - var_17_6)

	arg_17_0:SwitchControllerState(arg_17_0.controller.state.star.name, string.format("star%d", var_17_6))

	local var_17_7 = string.format("com_white_icon_group_%d_c", var_17_4.race)

	arg_17_0.groupImg_.sprite = getSprite("Atlas/SystemGroupAtlas", var_17_7)
	arg_17_0.groupTitleImg_.sprite = getSprite("Atlas/SystemGroupAtlas", var_17_7)
	arg_17_0.groupTitleTxt_.text = string.format(GetTips("EQUIP_RACE"), RaceEffectCfg[var_17_4.race].name)

	if arg_17_1.locked == 1 then
		arg_17_0.lockImg_.sprite = getSprite("Atlas/SystemCommonAtlas", arg_17_0.constVar.lockImg.locked)
	else
		arg_17_0.lockImg_.sprite = getSprite("Atlas/SystemCommonAtlas", arg_17_0.constVar.lockImg.unlocked)
	end

	arg_17_0.attackRatioTxt_.text = table.concat({
		"+",
		var_17_4.attrib_addition,
		"%"
	})

	local var_17_8, var_17_9, var_17_10 = SkillTools.GetAttr(var_17_4.attribute)

	arg_17_0.subAttrNameTxt_.text = var_17_8
	arg_17_0.subAttrTxt_.text = "+" .. var_17_9
	arg_17_0.subAttrIconImg_.sprite = var_17_10

	arg_17_0:RenderEquipStatus()
	arg_17_0:RefreshEffectText()
	arg_17_0:RefreshRecommend()
	arg_17_0:RenderBtnLogic()
	arg_17_0:RenderLockObj()
end

function var_0_0.SwitchControllerState(arg_19_0, arg_19_1, arg_19_2)
	local var_19_0 = arg_19_0.controller.state[arg_19_1]

	if var_19_0 then
		var_19_0.comps:SetSelectedState(arg_19_2)
	end
end

function var_0_0.AsyncLoadIcon(arg_20_0, arg_20_1, arg_20_2)
	getSpriteWithoutAtlasAsync("TextureConfig/WeaponServant/Icon/" .. arg_20_1, function(arg_21_0)
		arg_20_2(arg_20_1, arg_21_0)
	end)
end

function var_0_0.GetHeroInfo(arg_22_0, arg_22_1)
	if arg_22_0.constVar.proxy and arg_22_1 and arg_22_1 ~= 0 then
		return arg_22_0.constVar.proxy:GetHeroData(arg_22_1)
	else
		return nil
	end
end

function var_0_0.GetServantInfo(arg_23_0, arg_23_1)
	if arg_23_0.constVar.proxy and arg_23_1 and arg_23_1 ~= 0 then
		return arg_23_0.constVar.proxy:GetHeroServantInfo(arg_23_1)
	else
		return nil
	end
end

function var_0_0.RefreshEffectText(arg_24_0)
	local var_24_0 = arg_24_0.constVar.descType
	local var_24_1 = ""
	local var_24_2 = arg_24_0.data.info
	local var_24_3 = WeaponServantCfg[var_24_2.id].desc

	if var_24_0 == 1 then
		var_24_1 = arg_24_0.constVar.proxy:GetServantEffect(var_24_2.id, nil, true)
		arg_24_0.detailTxt_.text = GetTips("SERVANT_DETAIL_FULL")
	else
		var_24_1 = arg_24_0.constVar.proxy:GetServantEffect(var_24_2.id, var_24_2.stage + arg_24_0.data.servantAddLv)
		arg_24_0.detailTxt_.text = GetTips("SERVANT_DETAIL_SIMPLE")
	end

	arg_24_0.descTxt_.text = table.concat({
		var_24_1,
		"\n<color=",
		arg_24_0.constVar.subDescColor,
		">",
		var_24_3,
		"</color>"
	})
end

function var_0_0.RefreshRecommend(arg_25_0)
	local var_25_0 = arg_25_0.data.info
	local var_25_1 = WeaponServantCfg[var_25_0.id].effect[1]
	local var_25_2 = 0

	if var_25_1 > 0 then
		var_25_2 = WeaponEffectCfg[var_25_1].spec_char[1]
	end

	if var_25_2 ~= nil and var_25_2 > 0 then
		SetActive(arg_25_0.recommendObj_, true)

		arg_25_0.heroImg_.sprite = HeroTools.GetSmallHeadSprite(var_25_2)
	else
		SetActive(arg_25_0.recommendObj_, false)
	end
end

function var_0_0.RenderEquipStatus(arg_26_0)
	local var_26_0 = arg_26_0.data.info

	if var_26_0.uid then
		local var_26_1 = arg_26_0.data.servantMap[var_26_0.uid]

		if var_26_1 then
			SetActive(arg_26_0.equipObj_, true)

			arg_26_0.equipHeroIcon_.sprite = HeroTools.GetSmallHeadSprite(var_26_1)
			arg_26_0.equipHeroTxt_.text = string.format(GetTips("SERVANT_EQUIPED"), GetI18NText(HeroCfg[var_26_1].name))
		else
			SetActive(arg_26_0.equipObj_, false)
		end
	else
		SetActive(arg_26_0.equipObj_, false)
	end
end

function var_0_0.RenderLockObj(arg_27_0)
	local var_27_0 = arg_27_0.data.info

	if var_27_0.uid and var_27_0.uid ~= 0 then
		SetActive(arg_27_0.lockImg_.gameObject, true)
	else
		SetActive(arg_27_0.lockImg_.gameObject, false)
	end
end

function var_0_0.OnSwitchDescClick(arg_28_0)
	arg_28_0.constVar.descType = (arg_28_0.constVar.descType + 1) % 2

	arg_28_0:RefreshEffectText()
end

function var_0_0.OnServantDetailClick(arg_29_0)
	if arg_29_0.data.info then
		if arg_29_0.constVar.curBtnStyle == 3 then
			local var_29_0 = {
				disableTabList = {
					[2] = true
				},
				disableOrigin = arg_29_0.data.info.isCustom or false
			}

			JumpTools.OpenPageByJump("/showServantDetailsView", {
				servantData = arg_29_0.data.info,
				heroId = arg_29_0.data.heroId,
				openContext = var_29_0
			})
		elseif arg_29_0:CheckCanCallName() then
			arg_29_0:OnCallNameBtnClick()
		end
	end
end

function var_0_0.OnGachaBtnClick(arg_30_0)
	local var_30_0 = arg_30_0.data.info
	local var_30_1 = var_30_0.id

	if ServantTools.IsSleepServant(var_30_1) then
		arg_30_0:OnServantDetailClick()

		return
	end

	local var_30_2 = ServantTools.GetSleepyServantByServant(var_30_0.id)

	DrawAction.SetPollUpIDIgnoreFail(DrawConst.WEAPON_SERVANT_POOL_ID, var_30_2)
end

function var_0_0.OnCallNameBtnClick(arg_31_0)
	local var_31_0 = arg_31_0.data.info.id

	if ServantTools.IsSleepServant(var_31_0) then
		arg_31_0:JumpToCallName()

		return
	end

	local var_31_1 = WeaponServantCfg[var_31_0]
	local var_31_2, var_31_3 = arg_31_0:MaterialEnough(var_31_0)

	if not var_31_2 then
		ShowTips("SERVANT_MERGE_MATERIAL_NOT_ENOUGH")

		return
	end

	if not var_31_3 then
		ShowTips("ERROR_ITEM_NOT_ENOUGH_GOLD")

		return
	end

	local var_31_4 = {}

	for iter_31_0, iter_31_1 in ipairs(GameSetting.exclusive_weapon_servant_cost.value) do
		if iter_31_1[1] == var_31_1.race then
			var_31_4 = iter_31_1[2]
		end
	end

	local var_31_5 = WeaponServantData:GetWeaponServantById(var_31_4[1][1])
	local var_31_6 = 0

	if arg_31_0.data.heroId and arg_31_0.data.heroId ~= 0 then
		local var_31_7 = arg_31_0:GetHeroInfo(arg_31_0.data.heroId)

		if var_31_7 then
			var_31_6 = var_31_7.servant_uid or 0
		end
	end

	local function var_31_8(arg_32_0, arg_32_1)
		if arg_32_0.locked ~= arg_32_1.locked then
			return arg_32_0.locked < arg_32_1.locked
		end

		return arg_32_0.uid < arg_32_1.uid
	end

	table.sort(var_31_5, var_31_8)

	local var_31_9 = 1

	if var_31_6 ~= 0 then
		for iter_31_2, iter_31_3 in ipairs(var_31_5) do
			if iter_31_3.uid == var_31_6 then
				var_31_9 = iter_31_2

				break
			end
		end
	end

	local var_31_10 = var_31_5[var_31_9].locked == 1
	local var_31_11 = var_31_10
	local var_31_12 = var_31_5[var_31_9].uid
	local var_31_13 = ItemTools.getItemName(var_31_5[var_31_9].id)

	if var_31_11 then
		local var_31_14

		if var_31_10 then
			var_31_14 = string.format(GetTips("SERVANT_MATERIAL_LOCKED"), var_31_13)
		end

		ShowMessageBox({
			title = GetTips("PROMPT"),
			content = var_31_14,
			OkCallback = function()
				arg_31_0:Go("/weaponServantWakeUp", {
					race = arg_31_0:GetCurServantRace(),
					servantID = var_31_0,
					uid = var_31_12,
					HeroId = arg_31_0.data.heroId
				})
			end,
			CancelCallback = function()
				return
			end
		})
	else
		arg_31_0:Go("/weaponServantWakeUp", {
			race = arg_31_0:GetCurServantRace(),
			servantID = var_31_0,
			uid = var_31_12,
			HeroId = arg_31_0.data.heroId
		})
	end
end

function var_0_0.JumpToCallName(arg_35_0)
	ServantTools.JumpToCallName(arg_35_0.data.heroId, arg_35_0.data.info.id)
end

function var_0_0.OnExchangeBtnClick(arg_36_0)
	if not arg_36_0:CheckRaceSame() then
		ShowTips("ERROR_SERVANT_RACE_NO_MATCH")

		return
	end

	local var_36_0 = arg_36_0.data.info.uid
	local var_36_1 = arg_36_0.data.heroId
	local var_36_2 = arg_36_0:GetHeroInfo(var_36_1)
	local var_36_3 = arg_36_0.data.servantMap

	if var_36_2 and var_36_0 == var_36_2.servant_uid then
		ServantAction.ServantReplace(var_36_1, 0)

		return
	end

	if var_36_3[var_36_0] then
		local var_36_4 = var_36_3[var_36_0]

		ShowMessageBox({
			title = "Warning",
			content = string.format(GetTips("SERVANT_IS_USING"), GetI18NText(HeroCfg[var_36_4].name)),
			OkCallback = function()
				ServantAction.ServantReplace(var_36_1, var_36_0)
			end
		})

		return
	end

	ServantAction.ServantReplace(var_36_1, var_36_0)
end

function var_0_0.OnBeyondBtnClick(arg_38_0)
	if arg_38_0.data.info then
		if ServantTools.IsSleepServant(arg_38_0.data.info.id) then
			ServantTools.JumpToCallName(arg_38_0.data.heroId, arg_38_0.data.info.id)
		else
			JumpTools.OpenPageByJump("/showServantDetailsView", {
				servantData = arg_38_0.data.info,
				heroId = arg_38_0.data.heroId,
				openContext = {
					tabIndex = 2
				}
			})
		end
	end
end

function var_0_0.OnLockBtnClick(arg_39_0)
	if arg_39_0.data.info.uid and arg_39_0.data.info.uid ~= 0 then
		ServantAction.ServantLock(arg_39_0.data.info.uid)
	end
end

function var_0_0.SwitchBtnStyle(arg_40_0, arg_40_1)
	local var_40_0 = arg_40_0.controller.state.btnState

	arg_40_0.constVar.curBtnStyle = arg_40_1

	arg_40_0:SwitchControllerState(var_40_0.name, arg_40_0.constVar.btnStyleMap[arg_40_1])
	arg_40_0:RenderBtnLogic()
end

function var_0_0.RenderBtnLogic(arg_41_0)
	if arg_41_0.constVar.curBtnStyle == 1 then
		arg_41_0:RenderBeyondBtnState()
	end

	if arg_41_0.constVar.curBtnStyle == 2 then
		SetActive(arg_41_0.callNameToken_, true)

		arg_41_0.gachaBtnIcon_.sprite = getSprite("Atlas/Hero_servantAtlas", "icon_detection")
		arg_41_0.gachaBtnTxt_.text = GetTips("SERVANT_MAIN_PAGE_GACHA")

		arg_41_0:RenderCallNameBtn()
	else
		arg_41_0:SwitchControllerState(arg_41_0.controller.state.callNameBtnState.name, arg_41_0.controller.state.callNameBtnState.True)
	end

	if arg_41_0.constVar.curBtnStyle == 3 then
		local var_41_0 = arg_41_0.data.info

		if var_41_0 and ServantTools.IsSleepServant(var_41_0.id) then
			arg_41_0:SwitchControllerState(arg_41_0.controller.state.btnState.name, arg_41_0.constVar.btnStyleMap[2])
			SetActive(arg_41_0.callNameToken_, false)

			arg_41_0.gachaBtnIcon_.sprite = getSprite("Atlas/SystemCommonAtlas", "com_white_icon_08")
			arg_41_0.gachaBtnTxt_.text = GetTips("TIP_DETAIL")
		else
			arg_41_0:SwitchControllerState(arg_41_0.controller.state.btnState.name, arg_41_0.constVar.btnStyleMap[3])
		end

		arg_41_0.upBtnTxt_.text = GetTips("SERVANT_MAIN_PAGE_DETAIL")
	end

	if arg_41_0.constVar.curBtnStyle == 4 then
		arg_41_0:SwitchControllerState(arg_41_0.controller.state.btnState.name, arg_41_0.controller.state.btnState.no)
	end
end

function var_0_0.RenderCallNameBtn(arg_42_0)
	local var_42_0 = {}
	local var_42_1 = arg_42_0:GetCurServantRace()

	for iter_42_0, iter_42_1 in ipairs(GameSetting.exclusive_weapon_servant_cost.value) do
		if iter_42_1[1] == var_42_1 then
			var_42_0 = iter_42_1[2]
		end
	end

	local var_42_2 = WeaponServantData:GetWeaponServantById(var_42_0[1][1])
	local var_42_3 = 0

	if var_42_2 then
		var_42_3 = #var_42_2
	end

	local var_42_4 = ItemTools.getItemNum(var_42_0[2][1])
	local var_42_5 = tostring(var_42_3)

	if var_42_3 < var_42_0[1][2] then
		var_42_5 = "<color='#FF0000'>" .. var_42_5 .. "</color>"
	end

	local var_42_6 = var_42_5 .. "/" .. tostring(var_42_0[1][2])
	local var_42_7 = tostring(var_42_0[2][2])

	if var_42_4 < var_42_0[2][2] then
		var_42_7 = "<color='#FF0000'>" .. tostring(var_42_0[2][2]) .. "</color>"
	end

	arg_42_0.costmoneyText_.text = var_42_7

	if var_42_3 >= var_42_0[1][2] and var_42_4 >= var_42_0[2][2] then
		arg_42_0:SwitchControllerState(arg_42_0.controller.state.callNameBtnState.name, arg_42_0.controller.state.callNameBtnState.True)
	else
		arg_42_0:SwitchControllerState(arg_42_0.controller.state.callNameBtnState.name, arg_42_0.controller.state.callNameBtnState.False)
	end
end

function var_0_0.RenderBeyondBtnState(arg_43_0)
	local var_43_0 = arg_43_0.data.info
	local var_43_1 = var_43_0.isRecommend
	local var_43_2 = arg_43_0.controller.state.btnState

	if var_43_1 then
		if arg_43_0:CheckCanCallName() then
			arg_43_0:SwitchControllerState(var_43_2.name, var_43_2.detail)

			arg_43_0.upBtnTxt_.text = GetTips("SERVANT_MAIN_PAGE_CALLNAME")
		else
			arg_43_0:SwitchControllerState(var_43_2.name, var_43_2.unReached)
		end
	else
		arg_43_0:SwitchControllerState(var_43_2.name, var_43_2.beyond)

		local var_43_3 = var_43_0.uid
		local var_43_4 = arg_43_0.data.servantMap[var_43_3]

		if arg_43_0.data.heroId then
			if not var_43_4 then
				local var_43_5 = arg_43_0:GetServantInfo(arg_43_0.data.heroId)

				if var_43_5 and var_43_5.id ~= 0 then
					arg_43_0.exchangeEquipTxt_.text = arg_43_0.constVar.exchangeBtnLang.Change
				else
					arg_43_0.exchangeEquipTxt_.text = arg_43_0.constVar.exchangeBtnLang.Equip
				end
			elseif arg_43_0.data.heroId == var_43_4 then
				arg_43_0.exchangeEquipTxt_.text = arg_43_0.constVar.exchangeBtnLang.TakeOff
			else
				arg_43_0.exchangeEquipTxt_.text = arg_43_0.constVar.exchangeBtnLang.Exchange
			end
		end

		local var_43_6 = arg_43_0:CheckRaceSame()
		local var_43_7 = arg_43_0.controller.state.equipBtnState.False

		if var_43_6 then
			var_43_7 = arg_43_0.controller.state.equipBtnState.True
		end

		arg_43_0:SwitchControllerState(arg_43_0.controller.state.equipBtnState.name, var_43_7)

		if ServantTools.IsSleepServant(var_43_0.id) then
			arg_43_0.beyondBtnTxt_.text = GetTips("SERVANT_MAIN_PAGE_CALLNAME")
		else
			arg_43_0.beyondBtnTxt_.text = GetTips("PROMOTE")
		end
	end
end

function var_0_0.MaterialEnough(arg_44_0, arg_44_1)
	local var_44_0 = WeaponServantCfg[arg_44_1]
	local var_44_1 = {}

	for iter_44_0, iter_44_1 in ipairs(GameSetting.exclusive_weapon_servant_cost.value) do
		if iter_44_1[1] == var_44_0.race then
			var_44_1 = iter_44_1[2]
		end
	end

	local var_44_2 = WeaponServantData:GetWeaponServantById(var_44_1[1][1])
	local var_44_3 = 0

	if var_44_2 then
		var_44_3 = #var_44_2
	end

	local var_44_4 = ItemTools.getItemNum(var_44_1[2][1])

	return var_44_3 >= var_44_1[1][2], var_44_4 >= var_44_1[2][2]
end

function var_0_0.CheckRaceSame(arg_45_0)
	if not arg_45_0.data.heroId then
		return false
	end

	return arg_45_0:GetCurServantRace() == HeroCfg[arg_45_0.data.heroId].race
end

function var_0_0.GetCurServantRace(arg_46_0)
	local var_46_0 = arg_46_0.data.info

	return WeaponServantCfg[var_46_0.id].race
end

function var_0_0.CheckCanCallName(arg_47_0)
	local var_47_0 = arg_47_0.data.info
	local var_47_1, var_47_2 = arg_47_0:MaterialEnough(var_47_0.id)

	return var_47_1
end

return var_0_0
