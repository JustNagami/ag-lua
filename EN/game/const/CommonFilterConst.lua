local var_0_0 = {}
local var_0_1 = var_0_0

Filter_Tags_Define = {
	MECHAINISM4 = 28,
	FURNITURETYPE1 = 29,
	Star4 = 11,
	ARRT2 = 22,
	ARRT14 = 21,
	DESCending = 16,
	ARRT4 = 18,
	ARRT0 = 17,
	ARRT8 = 19,
	Race3 = 3,
	Race2 = 2,
	Race4 = 4,
	Race9 = 6,
	FURNITURETYPE6 = 34,
	IdolDanceStyle1 = 39,
	FURNITURETYPE8 = 36,
	Beyond = 7,
	FURNITURETYPE9 = 37,
	IdolDanceBeat16 = 45,
	FURNITURETYPE7 = 35,
	FURNITURETYPEALL = 38,
	FURNITURETYPE3 = 31,
	ARRT10 = 24,
	CallName = 9,
	FURNITURETYPE5 = 33,
	IdolDanceBeat32 = 46,
	IdolDanceStyle3 = 41,
	IdolDanceBeatReserve3 = 48,
	Star3 = 10,
	MECHAINISM1 = 25,
	Race5 = 5,
	ARRT12 = 23,
	IdolDanceStyle5 = 43,
	Race1 = 1,
	FURNITURETYPE2 = 30,
	MECHAINISM2 = 26,
	FURNITURETYPE4 = 32,
	IdolDanceStyle2 = 40,
	Equip = 8,
	MECHAINISM3 = 27,
	StarLevel = 14,
	IdolDanceBeatReserve2 = 47,
	Train = 13,
	Star5 = 12,
	ARRT6 = 20,
	IdolDanceStyle4 = 42,
	IdolDanceBeat8 = 44,
	ASCending = 15
}
Filter_Group_Mode = {
	SingleMode = 2,
	MultiMode = 1
}
Filter_Group_Define = {
	RACE = {
		title = "FILTER_RACE",
		groupID = 1,
		mode = Filter_Group_Mode.MultiMode,
		tags = {
			Filter_Tags_Define.Race1,
			Filter_Tags_Define.Race2,
			Filter_Tags_Define.Race3,
			Filter_Tags_Define.Race4,
			Filter_Tags_Define.Race5,
			Filter_Tags_Define.Race9
		}
	},
	SERVANT_ADD = {
		title = "FILTER_SERVANT_ADD",
		groupID = 2,
		mode = Filter_Group_Mode.MultiMode,
		tags = {
			Filter_Tags_Define.Beyond,
			Filter_Tags_Define.Equip,
			Filter_Tags_Define.CallName
		}
	},
	RARITY = {
		title = "FILTER_RARITY",
		groupID = 3,
		mode = Filter_Group_Mode.MultiMode,
		tags = {
			Filter_Tags_Define.Star3,
			Filter_Tags_Define.Star4,
			Filter_Tags_Define.Star5
		}
	},
	TYPE = {
		title = "TIP_TYPE",
		groupID = 4,
		mode = Filter_Group_Mode.SingleMode,
		tags = {
			Filter_Tags_Define.StarLevel,
			Filter_Tags_Define.Train
		}
	},
	SORT = {
		title = "TIP_SORT",
		groupID = 5,
		mode = Filter_Group_Mode.SingleMode,
		tags = {
			Filter_Tags_Define.ASCending,
			Filter_Tags_Define.DESCending
		}
	},
	ARRT = {
		title = "EQUIP_TYPE_1",
		groupID = 6,
		mode = Filter_Group_Mode.MultiMode,
		tags = {
			Filter_Tags_Define.ARRT0,
			Filter_Tags_Define.ARRT4,
			Filter_Tags_Define.ARRT8,
			Filter_Tags_Define.ARRT6,
			Filter_Tags_Define.ARRT14,
			Filter_Tags_Define.ARRT2,
			Filter_Tags_Define.ARRT12,
			Filter_Tags_Define.ARRT10
		}
	},
	MECHAINISMTYPE = {
		title = "TIP_TYPE",
		groupID = 7,
		mode = Filter_Group_Mode.MultiMode,
		tags = {
			Filter_Tags_Define.MECHAINISM1,
			Filter_Tags_Define.MECHAINISM2,
			Filter_Tags_Define.MECHAINISM3,
			Filter_Tags_Define.MECHAINISM4
		}
	},
	DECOMPOSE_RARITY = {
		title = "FILTER_RARITY",
		groupID = 8,
		mode = Filter_Group_Mode.MultiMode,
		tags = {
			Filter_Tags_Define.Star3,
			Filter_Tags_Define.Star4
		}
	},
	DECOMPOSE_SERVANT_ADD = {
		title = "FILTER_SERVANT_ADD",
		groupID = 9,
		mode = Filter_Group_Mode.MultiMode,
		tags = {
			Filter_Tags_Define.Beyond
		}
	},
	DORM_FURNITURE_TYPE = {
		title = "DORM_ALL_FURNITURE",
		groupID = 10,
		mode = Filter_Group_Mode.SingleMode,
		tags = {
			Filter_Tags_Define.FURNITURETYPE1,
			Filter_Tags_Define.FURNITURETYPE2,
			Filter_Tags_Define.FURNITURETYPE3,
			Filter_Tags_Define.FURNITURETYPE4,
			Filter_Tags_Define.FURNITURETYPE5,
			Filter_Tags_Define.FURNITURETYPE6,
			Filter_Tags_Define.FURNITURETYPE7,
			Filter_Tags_Define.FURNITURETYPE8,
			Filter_Tags_Define.FURNITURETYPE9,
			Filter_Tags_Define.FURNITURETYPEALL
		}
	},
	IDOL_DANCE_ACTION_STYLE = {
		title = "TIP_TYPE",
		groupID = 11,
		mode = Filter_Group_Mode.MultiMode,
		tags = {
			Filter_Tags_Define.IdolDanceStyle1,
			Filter_Tags_Define.IdolDanceStyle2,
			Filter_Tags_Define.IdolDanceStyle3,
			Filter_Tags_Define.IdolDanceStyle4,
			Filter_Tags_Define.IdolDanceStyle5
		}
	},
	IDOL_DANCE_ACTION_BEAT = {
		title = "TIP_BEAT",
		groupID = 12,
		mode = Filter_Group_Mode.MultiMode,
		tags = {
			Filter_Tags_Define.IdolDanceBeat16,
			Filter_Tags_Define.IdolDanceBeat32
		}
	}
}
Filter_Root_Define = {
	Servant_Filter_List = {
		filter_id = 1,
		groupList = {
			Filter_Group_Define.RACE.groupID,
			Filter_Group_Define.RARITY.groupID,
			Filter_Group_Define.SERVANT_ADD.groupID
		}
	},
	Equip_Filter_List = {
		filter_id = 2,
		groupList = {
			Filter_Group_Define.TYPE.groupID,
			Filter_Group_Define.SORT.groupID
		}
	},
	Hero_Filter_List = {
		filter_id = 3,
		groupList = {
			Filter_Group_Define.RACE.groupID,
			Filter_Group_Define.ARRT.groupID,
			Filter_Group_Define.MECHAINISMTYPE.groupID
		}
	},
	Weapon_LevelUp_Cost_List = {
		filter_id = 4,
		groupList = {
			Filter_Group_Define.TYPE.groupID,
			Filter_Group_Define.SORT.groupID
		}
	},
	Decompose_Servant_Filter_List = {
		filter_id = 5,
		groupList = {
			Filter_Group_Define.RACE.groupID,
			Filter_Group_Define.DECOMPOSE_RARITY.groupID,
			Filter_Group_Define.DECOMPOSE_SERVANT_ADD.groupID
		}
	},
	Mail_Filter_List = {
		filter_id = 6,
		groupList = {
			Filter_Group_Define.RACE.groupID
		}
	},
	DORM_SHOP_Filter_List = {
		filter_id = 7,
		groupList = {
			Filter_Group_Define.DORM_FURNITURE_TYPE.groupID
		}
	},
	IDOL_DANCE_ACTION_Filter_List = {
		filter_id = 8,
		groupList = {
			Filter_Group_Define.IDOL_DANCE_ACTION_STYLE.groupID,
			Filter_Group_Define.IDOL_DANCE_ACTION_BEAT.groupID
		}
	}
}

function var_0_1.GetFilterList(arg_1_0)
	return var_0_1.GetGroupCfg(arg_1_0).tags or {}
end

function var_0_1.GetFilterTagCfg(arg_2_0)
	return CommonFilterCfg[arg_2_0]
end

function var_0_1.GetFilterCfg(arg_3_0)
	if not var_0_1.Filter_Cfg then
		var_0_1.Filter_Cfg = {}

		for iter_3_0, iter_3_1 in pairs(Filter_Root_Define) do
			var_0_1.Filter_Cfg[iter_3_1.filter_id] = iter_3_1
		end
	end

	return var_0_1.Filter_Cfg[arg_3_0]
end

function var_0_1.GetFilterGroups(arg_4_0)
	return var_0_1.GetFilterCfg(arg_4_0).groupList
end

function var_0_1.GetGroupCfg(arg_5_0)
	if not var_0_1.Filter_Group_Cfg then
		var_0_1.Filter_Group_Cfg = {}

		for iter_5_0, iter_5_1 in pairs(Filter_Group_Define) do
			var_0_1.Filter_Group_Cfg[iter_5_1.groupID] = iter_5_1
		end
	end

	return var_0_1.Filter_Group_Cfg[arg_5_0]
end

function var_0_1.GetTagIndexAtGroup(arg_6_0, arg_6_1)
	local var_6_0 = var_0_1.GetGroupCfg(arg_6_0)

	if var_6_0 then
		if not var_6_0.tagIndex then
			var_6_0.tagIndex = {}

			for iter_6_0, iter_6_1 in ipairs(var_6_0.tags) do
				var_6_0.tagIndex[iter_6_1] = iter_6_0 - 1
			end
		end

		return var_6_0.tagIndex[arg_6_1] or -1
	end

	return -1
end

return var_0_0
