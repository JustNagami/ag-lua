return {
	{
		chapterID = 1,
		name = "限时集成考验",
		activityID = 293231,
		type = 1,
		tetris_stage_list = {
			1
		},
		unlock_condition = {}
	},
	{
		chapterID = 2,
		name = "集成考验A",
		activityID = 293251,
		type = 2,
		tetris_stage_list = {
			2,
			3,
			4
		},
		unlock_condition = {}
	},
	{
		chapterID = 3,
		name = "集成考验B",
		activityID = 293252,
		type = 2,
		tetris_stage_list = {
			5,
			6
		},
		unlock_condition = {}
	},
	[40101] = {
		chapterID = 40101,
		name = "集成考验",
		activityID = 333231,
		type = 1,
		tetris_stage_list = {
			40101
		},
		unlock_condition = {
			1190207
		}
	},
	[40102] = {
		chapterID = 40102,
		name = "集成初试",
		activityID = 333251,
		type = 2,
		tetris_stage_list = {
			40102,
			40103
		},
		unlock_condition = {}
	},
	[40103] = {
		chapterID = 40103,
		name = "集成特训",
		activityID = 333252,
		type = 2,
		tetris_stage_list = {
			40104,
			40105,
			40106,
			40107,
			40108,
			40109
		},
		unlock_condition = {
			1190101
		}
	},
	get_id_list_by_tetris_stage_list = {
		[40109] = {
			40103
		},
		[40108] = {
			40103
		},
		[40107] = {
			40103
		},
		[40106] = {
			40103
		},
		[40105] = {
			40103
		},
		[40104] = {
			40103
		},
		[40103] = {
			40102
		},
		[40102] = {
			40102
		},
		[40101] = {
			40101
		},
		[6] = {
			3
		},
		[5] = {
			3
		},
		[4] = {
			2
		},
		[3] = {
			2
		},
		[2] = {
			2
		},
		{
			1
		}
	},
	get_id_list_by_type = {
		[2] = {
			2,
			3,
			40102,
			40103
		},
		{
			1,
			40101
		}
	},
	all = {
		1,
		2,
		3,
		40101,
		40102,
		40103
	}
}
