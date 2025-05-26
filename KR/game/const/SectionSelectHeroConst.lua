local var_0_0 = {
	HeroModelTransform = {
		{
			position = Vector3(500, 0, 0),
			rotation = Vector3(0, 0, 0),
			scale = Vector3(1, 1, 1)
		},
		{
			position = Vector3(501.5, 0, -2.9),
			rotation = Vector3(0, -16.419, 0),
			scale = Vector3(1, 1, 1)
		},
		{
			position = Vector3(498.5, 0, -2.9),
			rotation = Vector3(0, 9.932, 0),
			scale = Vector3(1, 1, 1)
		}
	}
}

var_0_0.ModelDistanceX = var_0_0.HeroModelTransform[2].position.x - var_0_0.HeroModelTransform[1].position.x
var_0_0.ModelDistanceZ = var_0_0.HeroModelTransform[1].position.z - var_0_0.HeroModelTransform[2].position.z
var_0_0.DISPLAY_FILTER_LOCK_HERO_TYPE = {
	NORMAL = "normal",
	PROPOSAL = "proposal"
}

return var_0_0
