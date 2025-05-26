local var_0_0 = class("ImageWrap")

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0:BuildContext()
	arg_1_0:InjectImageWrap(arg_1_1, arg_1_2)
end

function var_0_0.BuildContext(arg_2_0)
	arg_2_0.context = {
		destroyed = false,
		isImmediateUnload = false,
		cacheLimit = -1,
		lastAsyncKey = ""
	}
	arg_2_0.lru = nil
	arg_2_0.recycleHandler = handler(arg_2_0, arg_2_0.OnSpriteRecycle)
end

function var_0_0.RebuildCacheContainer(arg_3_0)
	if not arg_3_0.lru then
		arg_3_0.lru = LRUContainer.New(arg_3_0.context.cacheLimit, arg_3_0.recycleHandler)
	end
end

function var_0_0.GetLru(arg_4_0)
	if not arg_4_0.lru then
		arg_4_0:RebuildCacheContainer()
	end

	return arg_4_0.lru
end

function var_0_0.OnSpriteRecycle(arg_5_0, arg_5_1)
	SpriteManager.GetInstance():UnloadSprite(arg_5_1)
end

function var_0_0.InjectImageWrap(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = {}

	tolua.setpeer(arg_6_1, var_6_0)

	var_6_0.__index = var_6_0

	local var_6_1 = tolua.initset(var_6_0)
	local var_6_2 = arg_6_0

	function var_6_1.spriteSync(arg_7_0, arg_7_1)
		if not arg_7_1 then
			var_6_2:LoadSprite(nil)

			return
		end

		if type(arg_7_1) == "string" then
			var_6_2:LoadSprite(arg_7_1)
		else
			Debug.LogError("spriteSync只接受图片路径")
		end
	end

	function var_6_1.spriteAsync(arg_8_0, arg_8_1)
		if not arg_8_1 then
			var_6_2:LoadSpriteAsync(nil)

			return
		end

		if type(arg_8_1) == "string" then
			var_6_2:LoadSpriteAsync(arg_8_1)
		else
			Debug.LogError("spriteAsync只接受图片路径")
		end
	end

	function var_6_1.immediate(arg_9_0, arg_9_1)
		if var_6_2.context.curSprite ~= nil or var_6_2.lru ~= nil then
			return
		end

		if arg_9_1 then
			var_6_2.context.isImmediateUnload = true
		else
			var_6_2.context.isImmediateUnload = false
		end
	end

	function var_6_1.cacheLimit(arg_10_0, arg_10_1)
		if var_6_2.context.curSprite ~= nil or var_6_2.lru ~= nil then
			return
		end

		var_6_2.context.cacheLimit = arg_10_1
	end

	if arg_6_2.CacheImageWrap then
		arg_6_2:CacheImageWrap(arg_6_0)
	end

	arg_6_0.context.destroyed = false
	arg_6_0.context.imageComps = arg_6_1
	arg_6_0.context.parent = arg_6_2
end

function var_0_0.LoadSprite(arg_11_0, arg_11_1)
	local var_11_0

	if arg_11_0:IsImmediateUnload() then
		var_11_0 = arg_11_0:ImmediateMode(arg_11_1)
	else
		var_11_0 = arg_11_0:CacheMode(arg_11_1)
	end

	arg_11_0.context.imageComps.sprite = var_11_0
end

function var_0_0.LoadSpriteAsync(arg_12_0, arg_12_1)
	if arg_12_1 == nil then
		arg_12_0.context.lastAsyncKey = nil

		return
	end

	if arg_12_0:IsImmediateUnload() then
		if arg_12_0.context.curSprite == arg_12_1 then
			return
		end
	elseif arg_12_0:GetLru():Get(arg_12_1) then
		arg_12_0.context.imageComps.sprite = arg_12_0:CacheMode(arg_12_1)

		return
	end

	if arg_12_1 == arg_12_0.context.lastAsyncKey then
		return
	end

	arg_12_0.context.lastAsyncKey = arg_12_1

	SpriteManager.GetInstance():LoadSpriteAsync(arg_12_1, function(arg_13_0)
		local var_13_0 = arg_12_0.context.imageComps

		if arg_12_1 ~= arg_12_0.context.lastAsyncKey then
			SpriteManager.GetInstance():UnloadSprite(arg_12_1)

			return
		end

		if not isNil(var_13_0) and not arg_12_0.context.destroyed then
			if arg_12_0:IsImmediateUnload() then
				var_13_0.sprite = arg_12_0:ImmediateMode(arg_12_1, arg_13_0)
			else
				var_13_0.sprite = arg_12_0:CacheMode(arg_12_1, arg_13_0)
			end
		else
			SpriteManager.GetInstance():UnloadSprite(arg_12_1)
		end
	end)
end

function var_0_0.ImmediateMode(arg_14_0, arg_14_1, arg_14_2)
	if arg_14_0.context.curSprite ~= nil then
		if arg_14_0.context.curSprite == arg_14_1 then
			if not isNil(arg_14_2) then
				SpriteManager.GetInstance():UnloadSprite(arg_14_1)
			end

			return SpriteManager.GetInstance():GetSprite(arg_14_1)
		end

		SpriteManager.GetInstance():UnloadSprite(arg_14_0.context.curSprite)
	end

	if arg_14_1 ~= nil and arg_14_1 ~= "" then
		local var_14_0 = arg_14_2 or SpriteManager.GetInstance():LoadSprite(arg_14_1)

		arg_14_0.context.curSprite = arg_14_1

		return var_14_0
	else
		arg_14_0.context.curSprite = nil

		return nil
	end
end

function var_0_0.CacheMode(arg_15_0, arg_15_1, arg_15_2)
	local var_15_0 = arg_15_2

	if arg_15_1 == nil or arg_15_1 == "" then
		return nil
	end

	if not arg_15_0:GetLru():Use(arg_15_1, arg_15_1) then
		var_15_0 = var_15_0 or SpriteManager.GetInstance():LoadSprite(arg_15_1)
	else
		if not isNil(arg_15_2) then
			SpriteManager.GetInstance():UnloadSprite(arg_15_1)
		end

		var_15_0 = var_15_0 or SpriteManager.GetInstance():GetSprite(arg_15_1)
	end

	return var_15_0
end

function var_0_0.IsImmediateUnload(arg_16_0)
	return arg_16_0.context.isImmediateUnload
end

function var_0_0.GetWrapper(arg_17_0)
	return arg_17_0.context.imageComps
end

function var_0_0.Dispose(arg_18_0)
	arg_18_0.context.destroyed = true

	if arg_18_0:IsImmediateUnload() then
		if arg_18_0.context.curSprite ~= nil then
			SpriteManager.GetInstance():UnloadSprite(arg_18_0.context.curSprite)
		end

		arg_18_0.context.imageComps = nil
		arg_18_0.context.parent = nil
	else
		if arg_18_0.lru then
			arg_18_0.lru:Dispose()

			arg_18_0.lru = nil
		end

		arg_18_0.context.imageComps = nil
		arg_18_0.context.parent = nil
	end
end

return var_0_0
