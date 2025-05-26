local var_0_0 = class("SubtitleBubble", import("game.extend.BaseView"))

function var_0_0.UIName(arg_1_0)
	return "Widget/BackHouseUI/Dorm/item/SubtitleBubbleView"
end

function var_0_0.GetTopSubtitleView(arg_2_0)
	arg_2_0 = arg_2_0 or Dorm.subtitleViewStack

	if arg_2_0 then
		return arg_2_0[#arg_2_0]
	end
end

function var_0_0.PushSubtitleView(arg_3_0, arg_3_1)
	arg_3_1 = arg_3_1 or Dorm.subtitleViewStack

	if arg_3_1 then
		if #arg_3_1 > 0 then
			arg_3_1[#arg_3_1]:OnDisable()
		end

		table.insert(arg_3_1, arg_3_0)
	end
end

function var_0_0.ReplaceSubtitleView(arg_4_0, arg_4_1, arg_4_2)
	arg_4_1 = arg_4_1 or Dorm.subtitleViewStack
	arg_4_2 = arg_4_2 or 1

	if arg_4_1 then
		if arg_4_1[arg_4_2] then
			arg_4_1[arg_4_2]:OnDisable()
		end

		arg_4_1[arg_4_2] = arg_4_0
	end
end

function var_0_0.PopSubtitleView(arg_5_0, arg_5_1)
	arg_5_1 = arg_5_1 or Dorm.subtitleViewStack

	if arg_5_1 and arg_5_1[#arg_5_1] == arg_5_0 then
		table.remove(arg_5_1)

		if #arg_5_1 > 0 then
			arg_5_1[#arg_5_1]:OnEnable()
		end
	end
end

function var_0_0.Ctor(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
	var_0_0.super.Ctor(arg_6_0)

	if arg_6_1 == nil then
		arg_6_0.gameObject_ = GameObject.Instantiate(Asset.Load(arg_6_0:UIName()), manager.ui.uiMain.transform)
		arg_6_0.needDisposeGo = true
		arg_6_0.global = true
	else
		arg_6_0.gameObject_ = arg_6_1
	end

	arg_6_0.transform_ = nullable(arg_6_0.gameObject_, "transform")
	arg_6_0.staticMode = arg_6_2
	arg_6_0.bubbles = {}
	arg_6_0.curPlaying = {}

	arg_6_0:BindCfgUI()
end

function var_0_0.OnEnter(arg_7_0)
	if arg_7_0.global then
		var_0_0.ReplaceSubtitleView(arg_7_0)
	else
		var_0_0.PushSubtitleView(arg_7_0)
	end

	arg_7_0:OnEnable()
end

function var_0_0.OnEnable(arg_8_0)
	arg_8_0:RegistEventListener(DORM_CHARACTER_PLAY_SUBTITLE_SEQ, arg_8_0.OnPlaySubtitleSeq)
	arg_8_0:RegistEventListener(DORM_CHARACTER_PLAY_SUBTITLE, arg_8_0.OnPlaySubtitle)
	arg_8_0:RegistEventListener(DORM_CHARACTER_DISPOSE, arg_8_0.OnEntityDispose)
	arg_8_0:RegistEventListener(DORM_VISIT_CHARACTER_FIRST_TALK, arg_8_0.CustomPlayVisitSubtitleSeq)
end

function var_0_0.OnExit(arg_9_0)
	arg_9_0:OnDisable()
	var_0_0.PopSubtitleView(arg_9_0)
end

function var_0_0.OnDisable(arg_10_0)
	for iter_10_0, iter_10_1 in pairs(arg_10_0.curPlaying) do
		iter_10_1:Abort()
	end

	for iter_10_2, iter_10_3 in pairs(arg_10_0.bubbles) do
		iter_10_3:Dispose()
	end

	arg_10_0.bubbles = {}
	arg_10_0.curPlaying = {}

	arg_10_0:RemoveAllEventListener()
end

function var_0_0.SetEntityFilter(arg_11_0, arg_11_1)
	arg_11_0.filter = arg_11_1
end

function var_0_0.GetBubble(arg_12_0, arg_12_1)
	local var_12_0 = arg_12_0.bubbles[arg_12_1]

	if not var_12_0 and (arg_12_0.filter == nil or arg_12_0.filter[arg_12_1]) then
		local var_12_1 = GameObject.Instantiate(arg_12_0.bubblePrefab, arg_12_0.bubbleRoot)

		var_12_0 = BubbleItem.New(var_12_1)

		var_12_0.content:SetActive(false)

		arg_12_0.bubbles[arg_12_1] = var_12_0

		var_12_1:SetActive(true)
	end

	return var_12_0
end

local function var_0_1(arg_13_0)
	return arg_13_0 == nil or arg_13_0 == "" or IsAllSpace(arg_13_0)
end

local function var_0_2(arg_14_0, arg_14_1)
	local var_14_0 = DormUtils.IdxNamespace(DormEnum.CharacterType.DormNormalHero)
	local var_14_1 = Dorm.storage:GetData(var_14_0, arg_14_0)
	local var_14_2 = nullable(DormHeroVoiceDescCfg, var_14_1, arg_14_1)

	if var_0_1(var_14_2) then
		local var_14_3 = nullable(BackHomeHeroSkinCfg, var_14_1, "hero_id")

		if var_14_3 ~= var_14_1 then
			var_14_2 = nullable(DormHeroVoiceDescCfg, var_14_3, arg_14_1)
		end
	end

	return var_14_2
end

var_0_0.UseDormHeroSubtitle = var_0_2

function var_0_0.UseRawContent(arg_15_0, arg_15_1)
	return arg_15_1
end

function var_0_0.UseTips(arg_16_0, arg_16_1)
	return GetTips(arg_16_1)
end

function var_0_0.OnPlaySubtitleSeq(arg_17_0, arg_17_1)
	local var_17_0 = var_0_0.GetTopSubtitleView()

	if var_17_0 == nil then
		return
	end

	local var_17_1 = DormHeroTools:CheckIsVisitHero(arg_17_0)
	local var_17_2 = DormCharacterActionManager.frameTaskRunner:NewTask()
	local var_17_3 = var_17_0:GetBubble(arg_17_0)

	if var_17_3 == nil then
		return
	end

	if not var_17_0.staticMode then
		DormLuaBridge.SetUIFollow(var_17_3.transform_, arg_17_0, "gua_Hp")
	end

	if var_17_0.curPlaying[arg_17_0] then
		var_17_0.curPlaying[arg_17_0]:Abort()
	end

	local var_17_4 = 0
	local var_17_5 = arg_17_1.Length - 1

	for iter_17_0 = var_17_4, var_17_5 do
		local var_17_6 = arg_17_1[iter_17_0]

		var_17_2:WaitForSec(var_17_6.time):Then(function()
			local var_18_0 = var_17_0.getContentFunc or Dorm.overrideSubtitleGetContentFunc or var_0_2
			local var_18_1 = ""

			if var_17_1 then
				var_18_1 = var_17_0:GetVisitContent()
			else
				var_18_1 = var_18_0(arg_17_0, var_17_6.subtitleID)
			end

			var_17_3:ShowSubtitle(arg_17_0)
			var_17_3:SetData(var_18_1)
		end)
	end

	var_17_0.curPlaying[arg_17_0] = var_17_2

	var_17_2:Start()
end

function var_0_0.CustomPlayVisitSubtitleSeq(arg_19_0)
	local var_19_0 = var_0_0.GetTopSubtitleView()

	if var_19_0 == nil then
		return
	end

	local var_19_1 = DormHeroTools:CheckIsVisitHero(arg_19_0)
	local var_19_2 = DormCharacterActionManager.frameTaskRunner:NewTask()
	local var_19_3 = var_19_0:GetBubble(arg_19_0)

	if var_19_3 == nil then
		return
	end

	if not var_19_0.staticMode then
		DormLuaBridge.SetUIFollow(var_19_3.transform_, arg_19_0, "gua_Hp")
	end

	if var_19_0.curPlaying[arg_19_0] then
		var_19_0.curPlaying[arg_19_0]:Abort()
	end

	local var_19_4 = var_19_0:GetVisitContent()

	var_19_2:WaitForSec(1):Then(function()
		if not var_19_0.getContentFunc and not Dorm.overrideSubtitleGetContentFunc then
			local var_20_0 = var_0_2
		end

		local var_20_1 = var_19_4

		var_19_3:ShowSubtitle(arg_19_0)
		var_19_3:SetData(var_20_1)
	end)

	var_19_0.curPlaying[arg_19_0] = var_19_2

	var_19_2:Start()
end

function var_0_0.OnPlaySubtitle(arg_21_0, arg_21_1, arg_21_2)
	local var_21_0 = var_0_0.GetTopSubtitleView()

	if var_21_0 == nil then
		return
	end

	local var_21_1 = var_21_0:GetBubble(arg_21_0)

	if var_21_1 == nil or arg_21_2 and var_21_1:IsPlaying() then
		return
	end

	if not var_21_0.staticMode then
		DormLuaBridge.SetUIFollow(var_21_1.transform_, arg_21_0, "gua_Hp")
	end

	if var_21_0.curPlaying[arg_21_0] then
		var_21_0.curPlaying[arg_21_0]:Abort()

		var_21_0.curPlaying[arg_21_0] = nil
	end

	local var_21_2 = (var_21_0.getContentFunc or Dorm.overrideSubtitleGetContentFunc or var_0_2)(arg_21_0, arg_21_1)

	var_21_1:ShowSubtitle(arg_21_0)
	var_21_1:SetData(var_21_2)
end

function var_0_0.GetVisitContent(arg_22_0)
	if GameDisplayCfg.dorm_player_greetings then
		local var_22_0 = GameDisplayCfg.dorm_player_greetings.value or {}
		local var_22_1 = #var_22_0

		if var_22_1 > 0 then
			return GetTips(TipsCfg[var_22_0[math.random(var_22_1)]].define)
		else
			return ""
		end
	else
		return ""
	end
end

function var_0_0.OnEntityDispose(arg_23_0)
	local var_23_0 = var_0_0.GetTopSubtitleView()

	if var_23_0 == nil then
		return
	end

	local var_23_1 = var_23_0.bubbles[arg_23_0]

	if var_23_1 then
		var_23_1:Dispose()

		var_23_0.bubbles[arg_23_0] = nil
	end
end

local var_0_3 = singletonClass("MuteBubbleSubView", var_0_0)

function var_0_3.Ctor(arg_24_0)
	var_0_3.super.Ctor(arg_24_0, nil, true)

	arg_24_0.global = false
end

function var_0_3.GetBubble(arg_25_0)
	return nil
end

function var_0_0.Dispose(arg_26_0)
	if arg_26_0.needDisposeGo then
		GameObject.Destroy(arg_26_0.gameObject_)
	end
end

var_0_0.MuteBubbleSubView = var_0_3

return var_0_0
