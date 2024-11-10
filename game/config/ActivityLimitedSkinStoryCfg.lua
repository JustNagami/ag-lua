return {
	{
		id = 1,
		activity_id = 182231,
		main_activity_id = 182211,
		story_id = 910401011
	},
	{
		id = 2,
		activity_id = 0,
		main_activity_id = 182211,
		story_id = 910402011
	},
	{
		id = 3,
		activity_id = 182233,
		main_activity_id = 182211,
		story_id = 910403011
	},
	[100001] = {
		id = 100001,
		activity_id = 232231,
		main_activity_id = 232211,
		story_id = 910401011
	},
	[100002] = {
		id = 100002,
		activity_id = 0,
		main_activity_id = 232211,
		story_id = 910402011
	},
	[100003] = {
		id = 100003,
		activity_id = 232233,
		main_activity_id = 232211,
		story_id = 910403011
	},
	get_id_list_by_activity_id = {
		[232233] = {
			100003
		},
		[232231] = {
			100001
		},
		[182233] = {
			3
		},
		[0] = {
			2,
			100002
		},
		[182231] = {
			1
		}
	},
	get_id_list_by_main_activity_id = {
		[232211] = {
			100001,
			100002,
			100003
		},
		[182211] = {
			1,
			2,
			3
		}
	},
	all = {
		1,
		2,
		3,
		100001,
		100002,
		100003
	}
}
