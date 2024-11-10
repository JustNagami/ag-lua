ChapterChallengeItemWithCD = import("game.views.chapter.challenge.ChapterChallengeItemWithCD")

local var_0_0 = class("ChapterEquipItemView", ChapterChallengeItemWithCD)

function var_0_0.GetLostTime(arg_1_0)
	local var_1_0 = BattleEquipData:GetBattleEquipData().next_refresh_time

	if var_1_0 < manager.time:GetServerTime() then
		BattleEquipAction.RequestBattleEquipInfo()

		return var_1_0 + 86400
	end

	return var_1_0
end

function var_0_0.ClickItem(arg_2_0, arg_2_1)
	if arg_2_0.isLock_ then
		ShowTips(arg_2_0.lockTips_)

		return
	end

	local var_2_0 = ChapterClientCfg[arg_2_1].chapter_list[1]

	JumpTools.OpenPageByJump("/equipSection", {
		chapterID = var_2_0
	}, ViewConst.SYSTEM_ID.BATTLE_EQUIP_SECTION)
end

return var_0_0
