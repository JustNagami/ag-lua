local var_0_0 = class("StreamConnection")
local var_0_1 = false

local function var_0_2(...)
	if var_0_1 then
		print(...)
	end
end

local var_0_3 = {
	CONNECTED = "connected",
	DISCONNECTED = "disconnected",
	CONNECTING = "connecting",
	NONE = "none"
}
local var_0_4 = 20
local var_0_5 = 5
local var_0_6 = 10
local var_0_7 = 90
local var_0_8 = 5
local var_0_9 = 10

function var_0_0.Ctor(arg_2_0, arg_2_1)
	arg_2_0.connectType_ = arg_2_1

	arg_2_0:Reset()
end

function var_0_0.Reset(arg_3_0)
	arg_3_0.netStatus = var_0_3.NONE
	arg_3_0.reconnectTryTime_ = 0
	arg_3_0.errorHandlingTime_ = 0
	arg_3_0.packetList_ = {}
	arg_3_0.sendingPacketCount = {}
	arg_3_0.connection_ = nil
	arg_3_0.notifies_ = arg_3_0.notifies_ or {}
	arg_3_0.idx_ = 1
	arg_3_0.serverIdx_ = 0
	arg_3_0.syncSendQueue_ = {}
	arg_3_0.syncSendNoQueueTmp_ = {}
	arg_3_0.waitCallbacks_ = {}
	arg_3_0.OnConnectedHandler_ = handler(arg_3_0, arg_3_0.OnConnectedHandler)
	arg_3_0.OnDisconnectedHandler_ = handler(arg_3_0, arg_3_0.OnDisconnectedHandler)
	arg_3_0.OnReceiveHandler_ = handler(arg_3_0, arg_3_0.OnReceiveHandler)
	arg_3_0.OnSocketError_ = handler(arg_3_0, arg_3_0.OnSocketError)
	arg_3_0.isPauseSendPacket_ = false

	print("===============================connection reset=========================================")
end

function var_0_0.Connect(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
	if arg_4_0.netStatus ~= var_0_3.CONNECTING and arg_4_0.netStatus ~= var_0_3.CONNECTED then
		arg_4_0.netStatus = var_0_3.CONNECTING
		arg_4_0.peerAddr_ = arg_4_1
		arg_4_0.peerPort_ = arg_4_2
		arg_4_0.onConnectExternal_ = arg_4_3
		arg_4_0.connection_ = YSTcpConnection.New(arg_4_0.peerAddr_, arg_4_0.peerPort_)

		arg_4_0.connection_.onConnected:AddListener(arg_4_0.OnConnectedHandler_)
		arg_4_0.connection_.onDisconnected:AddListener(arg_4_0.OnDisconnectedHandler_)
		arg_4_0.connection_:Connect()

		if arg_4_0.frameTimer_ then
			arg_4_0.frameTimer_:Stop()

			arg_4_0.frameTimer_ = nil
		end

		local var_4_0 = 0

		arg_4_0.frameTimer_ = FrameTimer.New(function()
			if arg_4_0.netStatus == var_0_3.CONNECTED or arg_4_0.netStatus == var_0_3.CONNECTING then
				arg_4_0.connection_:AsyncUpdate()
			end

			arg_4_0:AddCallBackTime()

			var_4_0 = var_4_0 + 1

			if var_4_0 > var_0_7 then
				arg_4_0:AutoReconnect()

				var_4_0 = 0
			end
		end, 1, -1)

		arg_4_0.frameTimer_:Start()
	end
end

function var_0_0.OnConnectedHandler(arg_6_0, arg_6_1)
	if arg_6_1 == SocketError.Success then
		arg_6_0.netStatus = var_0_3.CONNECTED

		print("<color=#00ff00>TCP</color> Network connected")
		arg_6_0.connection_.onData:AddListener(arg_6_0.OnReceiveHandler_)
		arg_6_0.connection_.onError:AddListener(arg_6_0.OnSocketError_)

		arg_6_0.reconnectTryTime_ = 0
		arg_6_0.errorHandlingTime_ = 0

		arg_6_0:StartHeartBeat()
	else
		print("<color=#ff0000>TCP</color> Network connect fail", tostring(arg_6_1))

		arg_6_0.netStatus = var_0_3.DISCONNECTED
	end

	if arg_6_0.onConnectExternal_ then
		arg_6_0.onConnectExternal_(arg_6_1)
	end

	arg_6_0.onConnectExternal_ = nil

	arg_6_0:SendNoQueuePacket()
end

function var_0_0.StartHeartBeat(arg_7_0)
	if arg_7_0.heartBeatTimer_ == nil and arg_7_0.netStatus == var_0_3.CONNECTED then
		arg_7_0.heartBeatTimer_ = Timer.New(function()
			arg_7_0:SendAsync(10050, {
				need_request = 1
			})
		end, var_0_6, -1)

		arg_7_0.heartBeatTimer_:Start()
	end
end

function var_0_0.StopHeartBeat(arg_9_0)
	if arg_9_0.heartBeatTimer_ then
		arg_9_0.heartBeatTimer_:Stop()

		arg_9_0.heartBeatTimer_ = nil
	end
end

function var_0_0.AddCallBackTime(arg_10_0)
	local var_10_0 = false

	for iter_10_0, iter_10_1 in pairs(arg_10_0.waitCallbacks_) do
		iter_10_1.waitTime = iter_10_1.waitTime + Time.deltaTime

		if iter_10_1.waitTime > var_0_4 then
			print("TimeOut ... ", iter_10_0)

			var_10_0 = true
		end
	end

	if var_10_0 and arg_10_0.timeOutFunc_ ~= nil then
		arg_10_0.timeOutFunc_(arg_10_0, arg_10_0.connectType_)
	end
end

function var_0_0.GetIsNeedShowQuanQuan(arg_11_0)
	if arg_11_0.reconnectTryTime_ > var_0_5 then
		return false
	end

	return arg_11_0.netStatus == var_0_3.CONNECTING or table.nums(arg_11_0.waitCallbacks_) > 0 or #arg_11_0.syncSendQueue_ > 0
end

function var_0_0.GetSendingPacketNum(arg_12_0)
	return table.nums(arg_12_0.packetList_)
end

function var_0_0.CheckConnectStatus(arg_13_0)
	if arg_13_0.netStatus == var_0_3.DISCONNECTED then
		arg_13_0.reconnectTryTime_ = 0

		arg_13_0:AutoReconnect()
	end
end

function var_0_0.Disconnect(arg_14_0)
	arg_14_0.syncSendQueue_ = {}
	arg_14_0.waitCallbacks_ = {}
	arg_14_0.syncSendNoQueueTmp_ = {}
	arg_14_0.packetList_ = {}
	arg_14_0.sendingPacketCount = {}

	if arg_14_0.connection_ then
		arg_14_0.connection_:Disconnect()
	end
end

function var_0_0.OnDisconnectedHandler(arg_15_0, arg_15_1)
	if arg_15_0.netStatus == var_0_3.DISCONNECTED or arg_15_0.netStatus == var_0_3.NONE then
		return
	end

	arg_15_0.netStatus = var_0_3.DISCONNECTED

	if arg_15_0.frameTimer_ then
		arg_15_0.frameTimer_:Stop()

		arg_15_0.frameTimer_ = nil
	end

	arg_15_0:StopHeartBeat()

	if arg_15_0.waitCallbacks_ then
		if arg_15_1 and table.nums(arg_15_0.waitCallbacks_) > 0 and arg_15_0.errorHandlingFunc_ then
			arg_15_0.errorHandlingFunc_(arg_15_0, arg_15_0.connectType_, 0, arg_15_1)
		end

		arg_15_0.waitCallbacks_ = {}
	end

	arg_15_0.connection_:Dispose()
	print("<color=#ff0000>TCP</color> Network disconnect by peer")
end

function var_0_0.RegistReconnectFunc(arg_16_0, arg_16_1)
	arg_16_0.reconnectFunc_ = arg_16_1
end

function var_0_0.RegistTimeOutFunc(arg_17_0, arg_17_1)
	arg_17_0.timeOutFunc_ = arg_17_1
end

function var_0_0.RegistErrorHandlingFunc(arg_18_0, arg_18_1)
	arg_18_0.errorHandlingFunc_ = arg_18_1
end

function var_0_0.ResetReconnectTime(arg_19_0)
	arg_19_0.reconnectTryTime_ = 0
end

function var_0_0.AutoReconnect(arg_20_0)
	if arg_20_0.netStatus == var_0_3.DISCONNECTED and (#arg_20_0.syncSendQueue_ > 0 or table.nums(arg_20_0.waitCallbacks_) > 0 or #arg_20_0.syncSendNoQueueTmp_ > 0) then
		if arg_20_0.reconnectTryTime_ < var_0_5 then
			arg_20_0.reconnectTryTime_ = arg_20_0.reconnectTryTime_ + 1

			if arg_20_0.reconnectFunc_ then
				arg_20_0.reconnectFunc_()
			else
				arg_20_0:Reconnect()
			end
		elseif arg_20_0.reconnectTryTime_ == var_0_5 then
			arg_20_0.reconnectTryTime_ = arg_20_0.reconnectTryTime_ + 1

			if arg_20_0.errorHandlingFunc_ then
				arg_20_0.errorHandlingTime_ = arg_20_0.errorHandlingTime_ + 1

				arg_20_0.errorHandlingFunc_(arg_20_0, arg_20_0.connectType_, arg_20_0.errorHandlingTime_)
			end
		end
	end
end

function var_0_0.Reconnect(arg_21_0, arg_21_1)
	print("===================reconnect=========================")

	if arg_21_0.netStatus == var_0_3.DISCONNECTED then
		arg_21_0:Connect(arg_21_0.peerAddr_, arg_21_0.peerPort_, arg_21_1)
	else
		print("reconnect faile: status: " + arg_21_0.netStatus)
	end
end

function var_0_0.OnReceiveHandler(arg_22_0, arg_22_1)
	if arg_22_1.Cmd ~= 10051 then
		print(string.format("Network received protocol %d, %d, currentIndex %d", arg_22_1.Cmd, arg_22_1.Index, arg_22_0.serverIdx_), arg_22_1.ServerIndex)
	end

	local var_22_0 = arg_22_1.Cmd

	arg_22_0.packetList_[var_22_0] = nil
	arg_22_0.sendingPacketCount[var_22_0] = 0

	local var_22_1 = Protocol.Unpack(var_22_0, arg_22_1:getLuaStringBuffer())

	var_0_0.CollectMsgPacket(true, var_22_0, var_22_1)

	if arg_22_1.ServerIndex > 0 then
		arg_22_0.serverIdx_ = arg_22_1.ServerIndex
	end

	if arg_22_0.notifies_[var_22_0] then
		for iter_22_0, iter_22_1 in ipairs(arg_22_0.notifies_[var_22_0]) do
			var_0_2("notify", var_22_0, iter_22_1)
			iter_22_1(var_22_1)
		end
	end

	local var_22_2 = var_22_0 .. "_" .. arg_22_1.Index
	local var_22_3 = arg_22_0.waitCallbacks_

	if var_22_3[var_22_2] then
		var_0_2("sync notify", var_22_2)

		if var_22_3[var_22_2].callback then
			var_22_3[var_22_2].callback(var_22_1, var_22_3[var_22_2].data)
		end

		arg_22_0.lastDelayTime_ = var_22_3[var_22_2].waitTime
		var_22_3[var_22_2] = nil
	elseif var_22_3[var_22_0] then
		var_0_2("sync notify", var_22_0)

		if var_22_3[var_22_0].callback then
			var_22_3[var_22_0].callback(var_22_1, var_22_3[var_22_0].data)
		end

		arg_22_0.lastDelayTime_ = var_22_3[var_22_0].waitTime
		var_22_3[var_22_0] = nil
	else
		var_0_2("can not find callback function!!!!", var_22_0, var_22_2)
	end
end

function var_0_0.OnSocketError(arg_23_0, arg_23_1)
	print("<color=#ff0000>TCP</color> Network error: " .. tostring(arg_23_1))

	if arg_23_0.errorHandlingFunc_ then
		arg_23_0.errorHandlingFunc_(arg_23_0, arg_23_0.connectType_, arg_23_0.errorHandlingTime_, tostring(arg_23_1))
	end

	arg_23_0:OnDisconnectedHandler()
end

function var_0_0.SendSyncImplOneByOne(arg_24_0, arg_24_1, arg_24_2, arg_24_3, arg_24_4, arg_24_5, arg_24_6, arg_24_7)
	if arg_24_0.packetList_[arg_24_3] then
		print("正在发送中.... 丢弃！！！！！！！！！", arg_24_1)

		arg_24_0.sendingPacketCount[arg_24_3] = (arg_24_0.sendingPacketCount[arg_24_3] or 0) + 1

		if arg_24_0.sendingPacketCount[arg_24_3] > var_0_8 or #arg_24_0.syncSendQueue_ > var_0_9 then
			print("堆积过多的包，进行重连操作", arg_24_1)

			if arg_24_0.timeOutFunc_ ~= nil then
				arg_24_0.timeOutFunc_(arg_24_0, arg_24_0.connectType_)
			end
		end

		return
	end

	arg_24_0.packetList_[arg_24_3] = true

	arg_24_0:EnQueuePacket(arg_24_1, arg_24_2, arg_24_3, arg_24_4, arg_24_5, arg_24_6, arg_24_7)

	if arg_24_0.netStatus == var_0_3.CONNECTED then
		arg_24_0:StartSendPacket()
	else
		arg_24_0:CheckConnectStatus()
	end
end

function var_0_0.SendSyncNoEnqueueImpl(arg_25_0, arg_25_1, arg_25_2, arg_25_3, arg_25_4, arg_25_5, arg_25_6, arg_25_7)
	if arg_25_0.netStatus == var_0_3.CONNECTED then
		arg_25_0:SendSyncImpl(arg_25_1, arg_25_2, arg_25_3, arg_25_4, arg_25_5, arg_25_6, arg_25_7)
	else
		table.insert(arg_25_0.syncSendNoQueueTmp_, {
			arg_25_1,
			arg_25_2,
			arg_25_3,
			arg_25_4,
			arg_25_5,
			arg_25_6,
			arg_25_7
		})
		arg_25_0:CheckConnectStatus()
	end
end

function var_0_0.SendSyncImpl(arg_26_0, arg_26_1, arg_26_2, arg_26_3, arg_26_4, arg_26_5, arg_26_6, arg_26_7)
	var_0_2("SendSync", arg_26_1, arg_26_2, arg_26_3, arg_26_4, arg_26_5, arg_26_6, arg_26_7)

	local var_26_0

	if arg_26_5 then
		var_26_0 = arg_26_3 .. "_" .. arg_26_0.idx_
	else
		var_26_0 = arg_26_3
	end

	arg_26_0.waitCallbacks_[var_26_0] = {
		waitTime = 0,
		callback = arg_26_4,
		data = arg_26_2
	}

	if arg_26_5 then
		arg_26_0:SendBuildProtocol(arg_26_0.idx_, arg_26_0.serverIdx_, arg_26_1, arg_26_2)

		arg_26_0.idx_ = arg_26_0.idx_ + 1
	else
		arg_26_0:SendBuildProtocol(0, arg_26_0.serverIdx_, arg_26_1, arg_26_2)
	end
end

function var_0_0.CollectMsgPacket(arg_27_0, arg_27_1, arg_27_2)
	return
end

function var_0_0.SendBuildProtocol(arg_28_0, arg_28_1, arg_28_2, arg_28_3, arg_28_4, arg_28_5)
	if arg_28_3 == 10050 and _G.PrintAllOpen_ then
		-- block empty
	end

	local var_28_0 = Protocol.GetProtocolWithName("cs_" .. arg_28_3)
	local var_28_1 = var_28_0:GetMessage()

	Protocol.BuildProtocolMessage(var_28_1, arg_28_4)

	if arg_28_3 ~= 10050 or _G.PrintAllOpen_ then
		print("index", arg_28_1, arg_28_2, arg_28_3, arg_28_0.connectType_)
	end

	if arg_28_0.connection_ then
		arg_28_0.connection_:Send(Protocol.Pack(arg_28_1, arg_28_2, var_28_0:GetId(), var_28_1, arg_28_5))
	end

	var_0_0.CollectMsgPacket(false, var_28_0:GetId(), arg_28_4)
end

function var_0_0.EnQueuePacket(arg_29_0, arg_29_1, arg_29_2, arg_29_3, arg_29_4, arg_29_5, arg_29_6, arg_29_7)
	table.insert(arg_29_0.syncSendQueue_, {
		arg_29_1,
		arg_29_2,
		arg_29_3,
		arg_29_4,
		arg_29_5,
		arg_29_6,
		arg_29_7
	})
end

function var_0_0.OnSendComplete(arg_30_0)
	local var_30_0 = table.remove(arg_30_0.syncSendQueue_, 1)

	arg_30_0:StartSendPacket()
end

function var_0_0.StartSendPacket(arg_31_0)
	if #arg_31_0.syncSendQueue_ > 0 and not arg_31_0.isPauseSendPacket_ then
		arg_31_0:SendSyncImpl(unpack(arg_31_0.syncSendQueue_[1]))
		arg_31_0:OnSendComplete()
	end
end

function var_0_0.SendNoQueuePacket(arg_32_0)
	for iter_32_0 = 1, #arg_32_0.syncSendNoQueueTmp_ do
		arg_32_0:SendSyncImpl(unpack(arg_32_0.syncSendNoQueueTmp_[iter_32_0]))
	end

	arg_32_0.syncSendNoQueueTmp_ = {}
end

function var_0_0.SetIsPauseSendPacket(arg_33_0, arg_33_1)
	arg_33_0.isPauseSendPacket_ = arg_33_1

	if not arg_33_1 then
		arg_33_0:StartSendPacket()
	end
end

function var_0_0.SendAsync(arg_34_0, ...)
	if arg_34_0.netStatus == var_0_3.CONNECTED then
		arg_34_0:SendBuildProtocol(0, arg_34_0.serverIdx_, ...)
	end
end

function var_0_0.SendSync(arg_35_0, ...)
	arg_35_0:SendSyncImplOneByOne(...)
end

function var_0_0.SendSyncNoEnqueue(arg_36_0, ...)
	arg_36_0:SendSyncNoEnqueueImpl(...)
end

function var_0_0.RegistPushWaiting(arg_37_0, arg_37_1, arg_37_2)
	arg_37_0.waitCallbacks_[arg_37_1] = {
		waitTime = 0,
		callback = arg_37_2
	}

	arg_37_0:CheckConnectStatus()
end

function var_0_0.Bind(arg_38_0, arg_38_1, arg_38_2)
	if not arg_38_0.notifies_[arg_38_1] then
		arg_38_0.notifies_[arg_38_1] = {}
	end

	if not table.indexof(arg_38_0.notifies_[arg_38_1], arg_38_2) then
		var_0_2("Bind", arg_38_1, arg_38_2)
		table.insert(arg_38_0.notifies_[arg_38_1], arg_38_2)
	else
		print("sc_" .. arg_38_1 .. " StreamConnection:Bind twice.")
	end
end

function var_0_0.UnBind(arg_39_0, arg_39_1, arg_39_2)
	if arg_39_0.notifies_[arg_39_1] then
		if arg_39_2 == nil then
			var_0_2("UnBind", arg_39_1, "all")

			arg_39_0.notifies_[arg_39_1] = nil
		else
			local var_39_0 = arg_39_0.notifies_[arg_39_1]

			for iter_39_0 = #var_39_0, 1 do
				if var_39_0[iter_39_0] == arg_39_2 then
					var_0_2("UnBind", arg_39_1, arg_39_2)
					table.remove(var_39_0, iter_39_0)

					break
				end
			end
		end
	end
end

function var_0_0.GetDelayTime(arg_40_0)
	return arg_40_0.lastDelayTime_ or 0
end

function var_0_0.GetMachineState(arg_41_0)
	return arg_41_0.netStatus
end

function var_0_0.GetConnectHostAndPort(arg_42_0)
	return arg_42_0.peerAddr_, arg_42_0.peerPort_
end

return var_0_0
