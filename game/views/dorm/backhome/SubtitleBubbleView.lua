local var_0_0 = class("SubtitleBubble", import("game.extend.BaseView"))

function var_0_0.UIName(arg_1_0)
	return "Widget/BackHouseUI/Dorm/item/SubtitleBubbleView"
end

function var_0_0.Ctor(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	var_0_0.super.Ctor(arg_2_0)

	if arg_2_1 == nil then
		arg_2_0.gameObject_ = GameObject.Instantiate(Asset.Load(arg_2_0:UIName()), manager.ui.uiMain.transform)
		arg_2_0.needDisposeGo = true
		arg_2_0.global = true
	else
		arg_2_0.gameObject_ = arg_2_1
	end

	arg_2_0.stack = arg_2_3 or Dorm.subtitleViewStack
	arg_2_0.transform_ = nullable(arg_2_0.gameObject_, "transform")
	arg_2_0.staticMode = arg_2_2
	arg_2_0.bubbles = {}
	arg_2_0.curPlaying = {}

	arg_2_0:BindCfgUI()
end

function var_0_0.OnEnter(arg_3_0)
	if #arg_3_0.stack > 0 then
		if arg_3_0.global then
			arg_3_0.stack[1]:OnDisable()

			arg_3_0.stack[1] = arg_3_0
		else
			arg_3_0.stack[#arg_3_0.stack]:OnDisable()
			table.insert(arg_3_0.stack, arg_3_0)
		end
	else
		table.insert(arg_3_0.stack, arg_3_0)
	end

	arg_3_0:OnEnable()
end

function var_0_0.OnEnable(arg_4_0)
	arg_4_0:RegistEventListener(DORM_CHARACTER_PLAY_SUBTITLE_SEQ, handler(arg_4_0, arg_4_0.OnPlaySubtitleSeq))
	arg_4_0:RegistEventListener(DORM_CHARACTER_PLAY_SUBTITLE, handler(arg_4_0, arg_4_0.OnPlaySubtitle))
	arg_4_0:RegistEventListener(DORM_CHARACTER_DISPOSE, handler(arg_4_0, arg_4_0.OnEntityDispose))
end

function var_0_0.OnExit(arg_5_0)
	arg_5_0:OnDisable()

	if arg_5_0.stack[#arg_5_0.stack] == arg_5_0 then
		table.remove(arg_5_0.stack)

		if #arg_5_0.stack > 0 then
			arg_5_0.stack[#arg_5_0.stack]:OnEnable()
		end
	end
end

function var_0_0.OnDisable(arg_6_0)
	for iter_6_0, iter_6_1 in pairs(arg_6_0.curPlaying) do
		iter_6_1:Abort()
	end

	for iter_6_2, iter_6_3 in pairs(arg_6_0.bubbles) do
		iter_6_3:Dispose()
	end

	arg_6_0.bubbles = {}
	arg_6_0.curPlaying = {}

	arg_6_0:RemoveAllEventListener()
end

function var_0_0.SetEntityFilter(arg_7_0, arg_7_1)
	arg_7_0.filter = arg_7_1
end

function var_0_0.GetBubble(arg_8_0, arg_8_1)
	if arg_8_0.stack[#arg_8_0.stack] ~= arg_8_0 then
		return nil
	end

	local var_8_0 = arg_8_0.bubbles[arg_8_1]

	if not var_8_0 and (arg_8_0.filter == nil or arg_8_0.filter[arg_8_1]) then
		local var_8_1 = GameObject.Instantiate(arg_8_0.bubblePrefab, arg_8_0.bubbleRoot)

		var_8_0 = BubbleItem.New(var_8_1)

		var_8_0.content:SetActive(false)

		arg_8_0.bubbles[arg_8_1] = var_8_0

		var_8_1:SetActive(true)
	end

	return var_8_0
end

local function var_0_1(arg_9_0)
	return arg_9_0 == nil or arg_9_0 == "" or IsAllSpace(arg_9_0)
end

local function var_0_2(arg_10_0, arg_10_1)
	local var_10_0 = DormUtils.IdxNamespace(DormEnum.CharacterType.DormNormalHero)
	local var_10_1 = Dorm.storage:GetData(var_10_0, arg_10_0)
	local var_10_2 = nullable(DormHeroVoiceDescCfg, var_10_1, arg_10_1)

	if var_0_1(var_10_2) then
		local var_10_3 = nullable(BackHomeHeroSkinCfg, var_10_1, "hero_id")

		if var_10_3 ~= var_10_1 then
			var_10_2 = nullable(DormHeroVoiceDescCfg, var_10_3, arg_10_1)
		end
	end

	return var_10_2
end

var_0_0.UseDormHeroSubtitle = var_0_2

function var_0_0.UseRawContent(arg_11_0, arg_11_1)
	return arg_11_1
end

function var_0_0.UseTips(arg_12_0, arg_12_1)
	return GetTips(arg_12_1)
end

function var_0_0.OnPlaySubtitleSeq(arg_13_0, arg_13_1, arg_13_2)
	local var_13_0 = DormCharacterActionManager.frameTaskRunner:NewTask()
	local var_13_1 = arg_13_0:GetBubble(arg_13_1)

	if var_13_1 == nil then
		return
	end

	if not arg_13_0.staticMode then
		DormLuaBridge.SetUIFollow(var_13_1.transform_, arg_13_1, "gua_Hp")
	end

	if arg_13_0.curPlaying[arg_13_1] then
		arg_13_0.curPlaying[arg_13_1]:Abort()
	end

	local var_13_2 = 0
	local var_13_3 = arg_13_2.Length - 1

	for iter_13_0 = var_13_2, var_13_3 do
		local var_13_4 = arg_13_2[iter_13_0]

		var_13_0:WaitForSec(var_13_4.time):Then(function()
			local var_14_0 = (arg_13_0.getContentFunc or Dorm.overrideSubtitleGetContentFunc or var_0_2)(arg_13_1, var_13_4.subtitleID)

			var_13_1:ShowSubtitle(arg_13_1)
			var_13_1:SetData(var_14_0)
		end)
	end

	arg_13_0.curPlaying[arg_13_1] = var_13_0

	var_13_0:Start()
end

function var_0_0.OnPlaySubtitle(arg_15_0, arg_15_1, arg_15_2, arg_15_3)
	local var_15_0 = arg_15_0:GetBubble(arg_15_1)

	if var_15_0 == nil or arg_15_3 and var_15_0:IsPlaying() then
		return
	end

	if not arg_15_0.staticMode then
		DormLuaBridge.SetUIFollow(var_15_0.transform_, arg_15_1, "gua_Hp")
	end

	if arg_15_0.curPlaying[arg_15_1] then
		arg_15_0.curPlaying[arg_15_1]:Abort()

		arg_15_0.curPlaying[arg_15_1] = nil
	end

	local var_15_1 = (arg_15_0.getContentFunc or Dorm.overrideSubtitleGetContentFunc or var_0_2)(arg_15_1, arg_15_2)

	var_15_0:ShowSubtitle(arg_15_1)
	var_15_0:SetData(var_15_1)
end

function var_0_0.OnEntityDispose(arg_16_0, arg_16_1)
	local var_16_0 = arg_16_0.bubbles[arg_16_1]

	if var_16_0 then
		var_16_0:Dispose()

		arg_16_0.bubbles[arg_16_1] = nil
	end
end

local var_0_3 = singletonClass("MuteBubbleSubView", var_0_0)

function var_0_3.Ctor(arg_17_0)
	var_0_3.super.Ctor(arg_17_0, nil, true)

	arg_17_0.global = false
end

function var_0_3.GetBubble(arg_18_0)
	return nil
end

function var_0_0.Dispose(arg_19_0)
	if arg_19_0.needDisposeGo then
		GameObject.Destroy(arg_19_0.gameObject_)
	end
end

var_0_0.MuteBubbleSubView = var_0_3

return var_0_0
