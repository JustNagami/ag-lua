SubPlotBaseView = import("game.views.sectionSelect.subPlot.base.SubPlotBaseView")

local var_0_0 = class("AthenaStoryView", SubPlotBaseView)

function var_0_0.UIName(arg_1_0)
	return "Widget/System/Operation/ChapterSectionUI/VolumeIIIDownSubPlotUI"
end

function var_0_0.GetItemClass(arg_2_0)
	return AthenaStoryItem
end

return var_0_0
