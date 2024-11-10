ChapterChallengeItemView = import("game.views.chapter.challenge.ChapterChallengeItemView")

local var_0_0 = class("ChapterEquipExperienceItemView", ChapterChallengeItemView)

function var_0_0.ClickItem(arg_1_0, arg_1_1)
	if arg_1_0.isLock_ then
		ShowTips(arg_1_0.lockTips_)

		return
	end

	local var_1_0 = ChapterClientCfg[arg_1_1].chapter_list[1]

	JumpTools.OpenPageByJump("/daily", {
		chapterID = var_1_0
	})
end

return var_0_0
