function getSprite(arg_1_0, arg_1_1)
	return AtlasManager.GetSprite(arg_1_0, arg_1_1)
end

function getSpriteWithoutAtlas(arg_2_0)
	return AtlasManager.GetSpriteWithoutAtlas(arg_2_0)
end

function getSpriteWithoutAtlasAsync(arg_3_0, arg_3_1)
	AtlasManager.GetSpriteWithoutAtlasAsync(arg_3_0, arg_3_1)
end

function unloadSpriteWithoutAtlas(arg_4_0)
	AtlasManager.UnloadSpriteWithoutAtlas(arg_4_0)
end

function SetSpriteWithoutAtlasAsync(arg_5_0, arg_5_1)
	AtlasManager.GetSpriteWithoutAtlasAsync(arg_5_1, function(arg_6_0)
		if isNil(arg_5_0) then
			return
		end

		arg_5_0.sprite = arg_6_0
	end)
end

function getSpriteViaConfig(arg_7_0, arg_7_1)
	local var_7_0 = nullable(SpritePathCfg, arg_7_0, "path")

	if var_7_0 then
		return getSpriteWithoutAtlas(var_7_0 .. arg_7_1)
	end
end
