﻿local var_0_0 = require("protobuf")

module("p51_pb", package.seeall)

local var_0_1 = {
	SC_51001_FIELD_LIST = {},
	HISTORY_DATA_NET_REC_FIELD_LIST = {}
}

SC_51001 = var_0_0.Descriptor()
var_0_1.SC_51001_FIELD_LIST.SC_51001_DATA_LIST_FIELD = var_0_0.FieldDescriptor()
HISTORY_DATA_NET_REC = var_0_0.Descriptor()
var_0_1.HISTORY_DATA_NET_REC_FIELD_LIST.HISTORY_DATA_NET_REC_ID_FIELD = var_0_0.FieldDescriptor()
var_0_1.HISTORY_DATA_NET_REC_FIELD_LIST.HISTORY_DATA_NET_REC_DATA_FIELD = var_0_0.FieldDescriptor()
var_0_1.SC_51001_FIELD_LIST.SC_51001_DATA_LIST_FIELD.name = "data_list"
var_0_1.SC_51001_FIELD_LIST.SC_51001_DATA_LIST_FIELD.full_name = ".p51.sc_51001.data_list"
var_0_1.SC_51001_FIELD_LIST.SC_51001_DATA_LIST_FIELD.number = 1
var_0_1.SC_51001_FIELD_LIST.SC_51001_DATA_LIST_FIELD.index = 0
var_0_1.SC_51001_FIELD_LIST.SC_51001_DATA_LIST_FIELD.label = 3
var_0_1.SC_51001_FIELD_LIST.SC_51001_DATA_LIST_FIELD.has_default_value = false
var_0_1.SC_51001_FIELD_LIST.SC_51001_DATA_LIST_FIELD.default_value = {}
var_0_1.SC_51001_FIELD_LIST.SC_51001_DATA_LIST_FIELD.message_type = HISTORY_DATA_NET_REC
var_0_1.SC_51001_FIELD_LIST.SC_51001_DATA_LIST_FIELD.type = 11
var_0_1.SC_51001_FIELD_LIST.SC_51001_DATA_LIST_FIELD.cpp_type = 10
SC_51001.name = "sc_51001"
SC_51001.full_name = ".p51.sc_51001"
SC_51001.nested_types = {}
SC_51001.enum_types = {}
SC_51001.fields = {
	var_0_1.SC_51001_FIELD_LIST.SC_51001_DATA_LIST_FIELD
}
SC_51001.is_extendable = false
SC_51001.extensions = {}
var_0_1.HISTORY_DATA_NET_REC_FIELD_LIST.HISTORY_DATA_NET_REC_ID_FIELD.name = "id"
var_0_1.HISTORY_DATA_NET_REC_FIELD_LIST.HISTORY_DATA_NET_REC_ID_FIELD.full_name = ".p51.history_data_net_rec.id"
var_0_1.HISTORY_DATA_NET_REC_FIELD_LIST.HISTORY_DATA_NET_REC_ID_FIELD.number = 1
var_0_1.HISTORY_DATA_NET_REC_FIELD_LIST.HISTORY_DATA_NET_REC_ID_FIELD.index = 0
var_0_1.HISTORY_DATA_NET_REC_FIELD_LIST.HISTORY_DATA_NET_REC_ID_FIELD.label = 2
var_0_1.HISTORY_DATA_NET_REC_FIELD_LIST.HISTORY_DATA_NET_REC_ID_FIELD.has_default_value = false
var_0_1.HISTORY_DATA_NET_REC_FIELD_LIST.HISTORY_DATA_NET_REC_ID_FIELD.default_value = 0
var_0_1.HISTORY_DATA_NET_REC_FIELD_LIST.HISTORY_DATA_NET_REC_ID_FIELD.type = 13
var_0_1.HISTORY_DATA_NET_REC_FIELD_LIST.HISTORY_DATA_NET_REC_ID_FIELD.cpp_type = 3
var_0_1.HISTORY_DATA_NET_REC_FIELD_LIST.HISTORY_DATA_NET_REC_DATA_FIELD.name = "data"
var_0_1.HISTORY_DATA_NET_REC_FIELD_LIST.HISTORY_DATA_NET_REC_DATA_FIELD.full_name = ".p51.history_data_net_rec.data"
var_0_1.HISTORY_DATA_NET_REC_FIELD_LIST.HISTORY_DATA_NET_REC_DATA_FIELD.number = 2
var_0_1.HISTORY_DATA_NET_REC_FIELD_LIST.HISTORY_DATA_NET_REC_DATA_FIELD.index = 1
var_0_1.HISTORY_DATA_NET_REC_FIELD_LIST.HISTORY_DATA_NET_REC_DATA_FIELD.label = 2
var_0_1.HISTORY_DATA_NET_REC_FIELD_LIST.HISTORY_DATA_NET_REC_DATA_FIELD.has_default_value = false
var_0_1.HISTORY_DATA_NET_REC_FIELD_LIST.HISTORY_DATA_NET_REC_DATA_FIELD.default_value = "0"
var_0_1.HISTORY_DATA_NET_REC_FIELD_LIST.HISTORY_DATA_NET_REC_DATA_FIELD.type = 4
var_0_1.HISTORY_DATA_NET_REC_FIELD_LIST.HISTORY_DATA_NET_REC_DATA_FIELD.cpp_type = 4
HISTORY_DATA_NET_REC.name = "history_data_net_rec"
HISTORY_DATA_NET_REC.full_name = ".p51.history_data_net_rec"
HISTORY_DATA_NET_REC.nested_types = {}
HISTORY_DATA_NET_REC.enum_types = {}
HISTORY_DATA_NET_REC.fields = {
	var_0_1.HISTORY_DATA_NET_REC_FIELD_LIST.HISTORY_DATA_NET_REC_ID_FIELD,
	var_0_1.HISTORY_DATA_NET_REC_FIELD_LIST.HISTORY_DATA_NET_REC_DATA_FIELD
}
HISTORY_DATA_NET_REC.is_extendable = false
HISTORY_DATA_NET_REC.extensions = {}
history_data_net_rec = var_0_0.Message(HISTORY_DATA_NET_REC)
sc_51001 = var_0_0.Message(SC_51001)

return p51_pb
