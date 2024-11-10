ChapterChallengeItemView = import("game.views.chapter.challenge.ChapterChallengeItemView")

local var_0_0 = class("ChapterEquipEnchantmentItemView", ChapterChallengeItemView)

function var_0_0.AddRedPoint(arg_1_0)
	manager.redPoint:bindUIandKey(arg_1_0.panelTf_, RedPointConst.DAILY_EQUIP_ENCHANT)
end

function var_0_0.RemoveRedPoint(arg_2_0)
	manager.redPoint:unbindUIandKey(arg_2_0.panelTf_, RedPointConst.DAILY_EQUIP_ENCHANT)
end

function var_0_0.ClickItem(arg_3_0, arg_3_1)
	if arg_3_0.isLock_ then
		ShowTips(arg_3_0.lockTips_)

		return
	end

	local var_3_0 = ChapterClientCfg[arg_3_1].chapter_list[1]

	JumpTools.OpenPageByJump("/enchantment")
end

return var_0_0
