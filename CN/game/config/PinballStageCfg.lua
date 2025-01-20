return {
	[30901] = {
		name = "海岸防线I",
		pre_stage = 0,
		activity_id = 303491,
		max_marbles = 4,
		id = 30901,
		map_id = "HZ07_pinball",
		monster_list = {
			30903
		},
		target_list = {
			116011,
			116021,
			116031
		},
		first_reward = {
			{
				54115,
				40
			}
		},
		condition_reward = {
			{
				54115,
				20
			},
			{
				54115,
				20
			},
			{
				54115,
				20
			}
		},
		repetition_reward = {
			{
				54115,
				20
			}
		},
		initial_bricks = {
			10,
			3,
			1
		},
		bricks_weight = {
			50,
			0,
			0,
			50,
			0,
			100
		},
		bricks_num = {
			2,
			4
		},
		action_logic = {
			{
				30903
			}
		}
	},
	[30902] = {
		name = "海岸防线II",
		pre_stage = 30901,
		activity_id = 303491,
		max_marbles = 4,
		id = 30902,
		map_id = "HZ07_pinball",
		monster_list = {
			30904
		},
		target_list = {
			116012,
			116022,
			116032
		},
		first_reward = {
			{
				54115,
				40
			}
		},
		condition_reward = {
			{
				54115,
				20
			},
			{
				54115,
				20
			},
			{
				54115,
				20
			}
		},
		repetition_reward = {
			{
				54115,
				20
			}
		},
		initial_bricks = {
			10,
			3,
			1
		},
		bricks_weight = {
			50,
			100,
			100,
			80,
			0,
			150
		},
		bricks_num = {
			2,
			4
		},
		action_logic = {
			{
				30903
			}
		}
	},
	[30903] = {
		name = "海岸防线III",
		pre_stage = 30902,
		activity_id = 303491,
		max_marbles = 9,
		id = 30903,
		map_id = "HZ07_pinball",
		monster_list = {
			30906
		},
		target_list = {
			116013,
			116023,
			116033
		},
		first_reward = {
			{
				54115,
				40
			}
		},
		condition_reward = {
			{
				54115,
				20
			},
			{
				54115,
				20
			},
			{
				54115,
				20
			}
		},
		repetition_reward = {
			{
				54115,
				20
			}
		},
		initial_bricks = {
			12,
			4,
			1
		},
		bricks_weight = {
			30,
			100,
			100,
			80,
			10,
			150
		},
		bricks_num = {
			2,
			4
		},
		action_logic = {
			{
				30903
			}
		}
	},
	[30904] = {
		name = "海岸防线IV",
		pre_stage = 30903,
		activity_id = 303491,
		max_marbles = 9,
		id = 30904,
		map_id = "HZ07_pinball",
		monster_list = {
			30907
		},
		target_list = {
			116014,
			116024,
			116034
		},
		first_reward = {
			{
				54115,
				40
			}
		},
		condition_reward = {
			{
				54115,
				20
			},
			{
				54115,
				20
			},
			{
				54115,
				20
			}
		},
		repetition_reward = {
			{
				54115,
				20
			}
		},
		initial_bricks = {
			12,
			4,
			0
		},
		bricks_weight = {
			30,
			100,
			100,
			80,
			20,
			150
		},
		bricks_num = {
			2,
			4
		},
		action_logic = {
			{
				30903
			},
			{
				30903
			},
			{
				30903,
				30904
			}
		}
	},
	[30905] = {
		name = "迷雾深处I",
		pre_stage = 0,
		activity_id = 303492,
		max_marbles = 4,
		id = 30905,
		map_id = "HZ07_pinball",
		monster_list = {
			30903
		},
		target_list = {
			116015,
			116025,
			116035
		},
		first_reward = {
			{
				54115,
				40
			}
		},
		condition_reward = {
			{
				54115,
				20
			},
			{
				54115,
				20
			},
			{
				54115,
				20
			}
		},
		repetition_reward = {
			{
				54115,
				20
			}
		},
		initial_bricks = {
			8,
			3,
			1
		},
		bricks_weight = {
			30,
			100,
			0,
			100,
			0,
			150
		},
		bricks_num = {
			2,
			4
		},
		action_logic = {
			{
				30903
			}
		}
	},
	[30906] = {
		name = "迷雾深处II",
		pre_stage = 30905,
		activity_id = 303492,
		max_marbles = 4,
		id = 30906,
		map_id = "HZ07_pinball",
		monster_list = {
			30904
		},
		target_list = {
			116016,
			116026,
			116036
		},
		first_reward = {
			{
				54115,
				40
			}
		},
		condition_reward = {
			{
				54115,
				20
			},
			{
				54115,
				20
			},
			{
				54115,
				20
			}
		},
		repetition_reward = {
			{
				54115,
				20
			}
		},
		initial_bricks = {
			10,
			3,
			1
		},
		bricks_weight = {
			30,
			100,
			100,
			60,
			0,
			150
		},
		bricks_num = {
			2,
			4
		},
		action_logic = {
			{
				30903
			}
		}
	},
	[30907] = {
		name = "迷雾深处III",
		pre_stage = 30906,
		activity_id = 303492,
		max_marbles = 9,
		id = 30907,
		map_id = "HZ07_pinball",
		monster_list = {
			30905
		},
		target_list = {
			116017,
			116027,
			116037
		},
		first_reward = {
			{
				54115,
				40
			}
		},
		condition_reward = {
			{
				54115,
				20
			},
			{
				54115,
				20
			},
			{
				54115,
				20
			}
		},
		repetition_reward = {
			{
				54115,
				20
			}
		},
		initial_bricks = {
			12,
			4,
			1
		},
		bricks_weight = {
			20,
			100,
			100,
			60,
			20,
			150
		},
		bricks_num = {
			2,
			4
		},
		action_logic = {
			{
				30903
			}
		}
	},
	[30908] = {
		name = "迷雾深处IV",
		pre_stage = 30907,
		activity_id = 303492,
		max_marbles = 9,
		id = 30908,
		map_id = "HZ07_pinball",
		monster_list = {
			30908
		},
		target_list = {
			116018,
			116028,
			116038
		},
		first_reward = {
			{
				54115,
				40
			}
		},
		condition_reward = {
			{
				54115,
				20
			},
			{
				54115,
				20
			},
			{
				54115,
				20
			}
		},
		repetition_reward = {
			{
				54115,
				20
			}
		},
		initial_bricks = {
			12,
			4,
			0
		},
		bricks_weight = {
			50,
			100,
			100,
			60,
			0,
			220
		},
		bricks_num = {
			2,
			4
		},
		action_logic = {
			{
				30903
			},
			{
				30903
			},
			{
				30903,
				30905
			}
		}
	},
	[30909] = {
		name = "海岸防线-挑战",
		pre_stage = 30904,
		activity_id = 303491,
		max_marbles = 19,
		id = 30909,
		map_id = "HZ07_pinball",
		monster_list = {
			30909
		},
		target_list = {
			116019,
			116029,
			116039
		},
		first_reward = {
			{
				54115,
				40
			}
		},
		condition_reward = {
			{
				54115,
				20
			},
			{
				54115,
				20
			},
			{
				54115,
				20
			}
		},
		repetition_reward = {
			{
				54115,
				20
			}
		},
		initial_bricks = {
			15,
			4,
			0
		},
		bricks_weight = {
			50,
			50,
			50,
			50,
			50,
			500
		},
		bricks_num = {
			2,
			5
		},
		action_logic = {
			{
				30903
			},
			{
				30903
			},
			{
				30903,
				30904
			}
		}
	},
	[30910] = {
		name = "迷雾深处-挑战",
		pre_stage = 30908,
		activity_id = 303492,
		max_marbles = 19,
		id = 30910,
		map_id = "HZ07_pinball",
		monster_list = {
			30910
		},
		target_list = {
			116020,
			116030,
			116040
		},
		first_reward = {
			{
				54115,
				40
			}
		},
		condition_reward = {
			{
				54115,
				20
			},
			{
				54115,
				20
			},
			{
				54115,
				20
			}
		},
		repetition_reward = {
			{
				54115,
				20
			}
		},
		initial_bricks = {
			15,
			4,
			0
		},
		bricks_weight = {
			70,
			150,
			180,
			100,
			0,
			500
		},
		bricks_num = {
			3,
			5
		},
		action_logic = {
			{
				30903
			},
			{
				30903
			},
			{
				30903,
				30905
			}
		}
	},
	get_id_list_by_activity_id = {
		[303492] = {
			30905,
			30906,
			30907,
			30908,
			30910
		},
		[303491] = {
			30901,
			30902,
			30903,
			30904,
			30909
		}
	},
	all = {
		30901,
		30902,
		30903,
		30904,
		30905,
		30906,
		30907,
		30908,
		30909,
		30910
	}
}
