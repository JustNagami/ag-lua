﻿local var_0_0 = require("protobuf")
local var_0_1 = require("protocol/item_hrl_pb")

module("p23_pb", package.seeall)

local var_0_2 = {
	SC_23009_FIELD_LIST = {},
	CS_23012_FIELD_LIST = {},
	SC_23013_FIELD_LIST = {},
	SC_23015_FIELD_LIST = {}
}

SC_23009 = var_0_0.Descriptor()
var_0_2.SC_23009_FIELD_LIST.SC_23009_TOTAL_EXP_FIELD = var_0_0.FieldDescriptor()
var_0_2.SC_23009_FIELD_LIST.SC_23009_NICK_FIELD = var_0_0.FieldDescriptor()
var_0_2.SC_23009_FIELD_LIST.SC_23009_HERO_NUM_FIELD = var_0_0.FieldDescriptor()
var_0_2.SC_23009_FIELD_LIST.SC_23009_PLOT_PROGRESS_FIELD = var_0_0.FieldDescriptor()
var_0_2.SC_23009_FIELD_LIST.SC_23009_IS_CHANGED_NICK_FIELD = var_0_0.FieldDescriptor()
var_0_2.SC_23009_FIELD_LIST.SC_23009_SYSTEM_CHANGE_NICK_TIMES_FIELD = var_0_0.FieldDescriptor()
CS_23012 = var_0_0.Descriptor()
var_0_2.CS_23012_FIELD_LIST.CS_23012_NICK_FIELD = var_0_0.FieldDescriptor()
SC_23013 = var_0_0.Descriptor()
var_0_2.SC_23013_FIELD_LIST.SC_23013_RESULT_FIELD = var_0_0.FieldDescriptor()
var_0_2.SC_23013_FIELD_LIST.SC_23013_COST_ITEM_LIST_FIELD = var_0_0.FieldDescriptor()
var_0_2.SC_23013_FIELD_LIST.SC_23013_IS_CHANGED_NICK_FIELD = var_0_0.FieldDescriptor()
var_0_2.SC_23013_FIELD_LIST.SC_23013_SYSTEM_CHANGE_NICK_TIMES_FIELD = var_0_0.FieldDescriptor()
SC_23015 = var_0_0.Descriptor()
var_0_2.SC_23015_FIELD_LIST.SC_23015_IP_LOCATION_FIELD = var_0_0.FieldDescriptor()
var_0_2.SC_23009_FIELD_LIST.SC_23009_TOTAL_EXP_FIELD.name = "total_exp"
var_0_2.SC_23009_FIELD_LIST.SC_23009_TOTAL_EXP_FIELD.full_name = ".common.sc_23009.total_exp"
var_0_2.SC_23009_FIELD_LIST.SC_23009_TOTAL_EXP_FIELD.number = 1
var_0_2.SC_23009_FIELD_LIST.SC_23009_TOTAL_EXP_FIELD.index = 0
var_0_2.SC_23009_FIELD_LIST.SC_23009_TOTAL_EXP_FIELD.label = 2
var_0_2.SC_23009_FIELD_LIST.SC_23009_TOTAL_EXP_FIELD.has_default_value = false
var_0_2.SC_23009_FIELD_LIST.SC_23009_TOTAL_EXP_FIELD.default_value = 0
var_0_2.SC_23009_FIELD_LIST.SC_23009_TOTAL_EXP_FIELD.type = 13
var_0_2.SC_23009_FIELD_LIST.SC_23009_TOTAL_EXP_FIELD.cpp_type = 3
var_0_2.SC_23009_FIELD_LIST.SC_23009_NICK_FIELD.name = "nick"
var_0_2.SC_23009_FIELD_LIST.SC_23009_NICK_FIELD.full_name = ".common.sc_23009.nick"
var_0_2.SC_23009_FIELD_LIST.SC_23009_NICK_FIELD.number = 2
var_0_2.SC_23009_FIELD_LIST.SC_23009_NICK_FIELD.index = 1
var_0_2.SC_23009_FIELD_LIST.SC_23009_NICK_FIELD.label = 2
var_0_2.SC_23009_FIELD_LIST.SC_23009_NICK_FIELD.has_default_value = false
var_0_2.SC_23009_FIELD_LIST.SC_23009_NICK_FIELD.default_value = ""
var_0_2.SC_23009_FIELD_LIST.SC_23009_NICK_FIELD.type = 9
var_0_2.SC_23009_FIELD_LIST.SC_23009_NICK_FIELD.cpp_type = 9
var_0_2.SC_23009_FIELD_LIST.SC_23009_HERO_NUM_FIELD.name = "hero_num"
var_0_2.SC_23009_FIELD_LIST.SC_23009_HERO_NUM_FIELD.full_name = ".common.sc_23009.hero_num"
var_0_2.SC_23009_FIELD_LIST.SC_23009_HERO_NUM_FIELD.number = 3
var_0_2.SC_23009_FIELD_LIST.SC_23009_HERO_NUM_FIELD.index = 2
var_0_2.SC_23009_FIELD_LIST.SC_23009_HERO_NUM_FIELD.label = 2
var_0_2.SC_23009_FIELD_LIST.SC_23009_HERO_NUM_FIELD.has_default_value = false
var_0_2.SC_23009_FIELD_LIST.SC_23009_HERO_NUM_FIELD.default_value = 0
var_0_2.SC_23009_FIELD_LIST.SC_23009_HERO_NUM_FIELD.type = 13
var_0_2.SC_23009_FIELD_LIST.SC_23009_HERO_NUM_FIELD.cpp_type = 3
var_0_2.SC_23009_FIELD_LIST.SC_23009_PLOT_PROGRESS_FIELD.name = "plot_progress"
var_0_2.SC_23009_FIELD_LIST.SC_23009_PLOT_PROGRESS_FIELD.full_name = ".common.sc_23009.plot_progress"
var_0_2.SC_23009_FIELD_LIST.SC_23009_PLOT_PROGRESS_FIELD.number = 4
var_0_2.SC_23009_FIELD_LIST.SC_23009_PLOT_PROGRESS_FIELD.index = 3
var_0_2.SC_23009_FIELD_LIST.SC_23009_PLOT_PROGRESS_FIELD.label = 2
var_0_2.SC_23009_FIELD_LIST.SC_23009_PLOT_PROGRESS_FIELD.has_default_value = false
var_0_2.SC_23009_FIELD_LIST.SC_23009_PLOT_PROGRESS_FIELD.default_value = 0
var_0_2.SC_23009_FIELD_LIST.SC_23009_PLOT_PROGRESS_FIELD.type = 13
var_0_2.SC_23009_FIELD_LIST.SC_23009_PLOT_PROGRESS_FIELD.cpp_type = 3
var_0_2.SC_23009_FIELD_LIST.SC_23009_IS_CHANGED_NICK_FIELD.name = "is_changed_nick"
var_0_2.SC_23009_FIELD_LIST.SC_23009_IS_CHANGED_NICK_FIELD.full_name = ".common.sc_23009.is_changed_nick"
var_0_2.SC_23009_FIELD_LIST.SC_23009_IS_CHANGED_NICK_FIELD.number = 5
var_0_2.SC_23009_FIELD_LIST.SC_23009_IS_CHANGED_NICK_FIELD.index = 4
var_0_2.SC_23009_FIELD_LIST.SC_23009_IS_CHANGED_NICK_FIELD.label = 1
var_0_2.SC_23009_FIELD_LIST.SC_23009_IS_CHANGED_NICK_FIELD.has_default_value = false
var_0_2.SC_23009_FIELD_LIST.SC_23009_IS_CHANGED_NICK_FIELD.default_value = 0
var_0_2.SC_23009_FIELD_LIST.SC_23009_IS_CHANGED_NICK_FIELD.type = 13
var_0_2.SC_23009_FIELD_LIST.SC_23009_IS_CHANGED_NICK_FIELD.cpp_type = 3
var_0_2.SC_23009_FIELD_LIST.SC_23009_SYSTEM_CHANGE_NICK_TIMES_FIELD.name = "system_change_nick_times"
var_0_2.SC_23009_FIELD_LIST.SC_23009_SYSTEM_CHANGE_NICK_TIMES_FIELD.full_name = ".common.sc_23009.system_change_nick_times"
var_0_2.SC_23009_FIELD_LIST.SC_23009_SYSTEM_CHANGE_NICK_TIMES_FIELD.number = 6
var_0_2.SC_23009_FIELD_LIST.SC_23009_SYSTEM_CHANGE_NICK_TIMES_FIELD.index = 5
var_0_2.SC_23009_FIELD_LIST.SC_23009_SYSTEM_CHANGE_NICK_TIMES_FIELD.label = 1
var_0_2.SC_23009_FIELD_LIST.SC_23009_SYSTEM_CHANGE_NICK_TIMES_FIELD.has_default_value = false
var_0_2.SC_23009_FIELD_LIST.SC_23009_SYSTEM_CHANGE_NICK_TIMES_FIELD.default_value = 0
var_0_2.SC_23009_FIELD_LIST.SC_23009_SYSTEM_CHANGE_NICK_TIMES_FIELD.type = 13
var_0_2.SC_23009_FIELD_LIST.SC_23009_SYSTEM_CHANGE_NICK_TIMES_FIELD.cpp_type = 3
SC_23009.name = "sc_23009"
SC_23009.full_name = ".common.sc_23009"
SC_23009.nested_types = {}
SC_23009.enum_types = {}
SC_23009.fields = {
	var_0_2.SC_23009_FIELD_LIST.SC_23009_TOTAL_EXP_FIELD,
	var_0_2.SC_23009_FIELD_LIST.SC_23009_NICK_FIELD,
	var_0_2.SC_23009_FIELD_LIST.SC_23009_HERO_NUM_FIELD,
	var_0_2.SC_23009_FIELD_LIST.SC_23009_PLOT_PROGRESS_FIELD,
	var_0_2.SC_23009_FIELD_LIST.SC_23009_IS_CHANGED_NICK_FIELD,
	var_0_2.SC_23009_FIELD_LIST.SC_23009_SYSTEM_CHANGE_NICK_TIMES_FIELD
}
SC_23009.is_extendable = false
SC_23009.extensions = {}
var_0_2.CS_23012_FIELD_LIST.CS_23012_NICK_FIELD.name = "nick"
var_0_2.CS_23012_FIELD_LIST.CS_23012_NICK_FIELD.full_name = ".common.cs_23012.nick"
var_0_2.CS_23012_FIELD_LIST.CS_23012_NICK_FIELD.number = 1
var_0_2.CS_23012_FIELD_LIST.CS_23012_NICK_FIELD.index = 0
var_0_2.CS_23012_FIELD_LIST.CS_23012_NICK_FIELD.label = 2
var_0_2.CS_23012_FIELD_LIST.CS_23012_NICK_FIELD.has_default_value = false
var_0_2.CS_23012_FIELD_LIST.CS_23012_NICK_FIELD.default_value = ""
var_0_2.CS_23012_FIELD_LIST.CS_23012_NICK_FIELD.type = 9
var_0_2.CS_23012_FIELD_LIST.CS_23012_NICK_FIELD.cpp_type = 9
CS_23012.name = "cs_23012"
CS_23012.full_name = ".common.cs_23012"
CS_23012.nested_types = {}
CS_23012.enum_types = {}
CS_23012.fields = {
	var_0_2.CS_23012_FIELD_LIST.CS_23012_NICK_FIELD
}
CS_23012.is_extendable = false
CS_23012.extensions = {}
var_0_2.SC_23013_FIELD_LIST.SC_23013_RESULT_FIELD.name = "result"
var_0_2.SC_23013_FIELD_LIST.SC_23013_RESULT_FIELD.full_name = ".common.sc_23013.result"
var_0_2.SC_23013_FIELD_LIST.SC_23013_RESULT_FIELD.number = 1
var_0_2.SC_23013_FIELD_LIST.SC_23013_RESULT_FIELD.index = 0
var_0_2.SC_23013_FIELD_LIST.SC_23013_RESULT_FIELD.label = 2
var_0_2.SC_23013_FIELD_LIST.SC_23013_RESULT_FIELD.has_default_value = false
var_0_2.SC_23013_FIELD_LIST.SC_23013_RESULT_FIELD.default_value = 0
var_0_2.SC_23013_FIELD_LIST.SC_23013_RESULT_FIELD.type = 13
var_0_2.SC_23013_FIELD_LIST.SC_23013_RESULT_FIELD.cpp_type = 3
var_0_2.SC_23013_FIELD_LIST.SC_23013_COST_ITEM_LIST_FIELD.name = "cost_item_list"
var_0_2.SC_23013_FIELD_LIST.SC_23013_COST_ITEM_LIST_FIELD.full_name = ".common.sc_23013.cost_item_list"
var_0_2.SC_23013_FIELD_LIST.SC_23013_COST_ITEM_LIST_FIELD.number = 2
var_0_2.SC_23013_FIELD_LIST.SC_23013_COST_ITEM_LIST_FIELD.index = 1
var_0_2.SC_23013_FIELD_LIST.SC_23013_COST_ITEM_LIST_FIELD.label = 3
var_0_2.SC_23013_FIELD_LIST.SC_23013_COST_ITEM_LIST_FIELD.has_default_value = false
var_0_2.SC_23013_FIELD_LIST.SC_23013_COST_ITEM_LIST_FIELD.default_value = {}
var_0_2.SC_23013_FIELD_LIST.SC_23013_COST_ITEM_LIST_FIELD.message_type = var_0_1.ITEM_NET_REC
var_0_2.SC_23013_FIELD_LIST.SC_23013_COST_ITEM_LIST_FIELD.type = 11
var_0_2.SC_23013_FIELD_LIST.SC_23013_COST_ITEM_LIST_FIELD.cpp_type = 10
var_0_2.SC_23013_FIELD_LIST.SC_23013_IS_CHANGED_NICK_FIELD.name = "is_changed_nick"
var_0_2.SC_23013_FIELD_LIST.SC_23013_IS_CHANGED_NICK_FIELD.full_name = ".common.sc_23013.is_changed_nick"
var_0_2.SC_23013_FIELD_LIST.SC_23013_IS_CHANGED_NICK_FIELD.number = 3
var_0_2.SC_23013_FIELD_LIST.SC_23013_IS_CHANGED_NICK_FIELD.index = 2
var_0_2.SC_23013_FIELD_LIST.SC_23013_IS_CHANGED_NICK_FIELD.label = 2
var_0_2.SC_23013_FIELD_LIST.SC_23013_IS_CHANGED_NICK_FIELD.has_default_value = false
var_0_2.SC_23013_FIELD_LIST.SC_23013_IS_CHANGED_NICK_FIELD.default_value = 0
var_0_2.SC_23013_FIELD_LIST.SC_23013_IS_CHANGED_NICK_FIELD.type = 13
var_0_2.SC_23013_FIELD_LIST.SC_23013_IS_CHANGED_NICK_FIELD.cpp_type = 3
var_0_2.SC_23013_FIELD_LIST.SC_23013_SYSTEM_CHANGE_NICK_TIMES_FIELD.name = "system_change_nick_times"
var_0_2.SC_23013_FIELD_LIST.SC_23013_SYSTEM_CHANGE_NICK_TIMES_FIELD.full_name = ".common.sc_23013.system_change_nick_times"
var_0_2.SC_23013_FIELD_LIST.SC_23013_SYSTEM_CHANGE_NICK_TIMES_FIELD.number = 4
var_0_2.SC_23013_FIELD_LIST.SC_23013_SYSTEM_CHANGE_NICK_TIMES_FIELD.index = 3
var_0_2.SC_23013_FIELD_LIST.SC_23013_SYSTEM_CHANGE_NICK_TIMES_FIELD.label = 2
var_0_2.SC_23013_FIELD_LIST.SC_23013_SYSTEM_CHANGE_NICK_TIMES_FIELD.has_default_value = false
var_0_2.SC_23013_FIELD_LIST.SC_23013_SYSTEM_CHANGE_NICK_TIMES_FIELD.default_value = 0
var_0_2.SC_23013_FIELD_LIST.SC_23013_SYSTEM_CHANGE_NICK_TIMES_FIELD.type = 13
var_0_2.SC_23013_FIELD_LIST.SC_23013_SYSTEM_CHANGE_NICK_TIMES_FIELD.cpp_type = 3
SC_23013.name = "sc_23013"
SC_23013.full_name = ".common.sc_23013"
SC_23013.nested_types = {}
SC_23013.enum_types = {}
SC_23013.fields = {
	var_0_2.SC_23013_FIELD_LIST.SC_23013_RESULT_FIELD,
	var_0_2.SC_23013_FIELD_LIST.SC_23013_COST_ITEM_LIST_FIELD,
	var_0_2.SC_23013_FIELD_LIST.SC_23013_IS_CHANGED_NICK_FIELD,
	var_0_2.SC_23013_FIELD_LIST.SC_23013_SYSTEM_CHANGE_NICK_TIMES_FIELD
}
SC_23013.is_extendable = false
SC_23013.extensions = {}
var_0_2.SC_23015_FIELD_LIST.SC_23015_IP_LOCATION_FIELD.name = "ip_location"
var_0_2.SC_23015_FIELD_LIST.SC_23015_IP_LOCATION_FIELD.full_name = ".common.sc_23015.ip_location"
var_0_2.SC_23015_FIELD_LIST.SC_23015_IP_LOCATION_FIELD.number = 1
var_0_2.SC_23015_FIELD_LIST.SC_23015_IP_LOCATION_FIELD.index = 0
var_0_2.SC_23015_FIELD_LIST.SC_23015_IP_LOCATION_FIELD.label = 2
var_0_2.SC_23015_FIELD_LIST.SC_23015_IP_LOCATION_FIELD.has_default_value = false
var_0_2.SC_23015_FIELD_LIST.SC_23015_IP_LOCATION_FIELD.default_value = ""
var_0_2.SC_23015_FIELD_LIST.SC_23015_IP_LOCATION_FIELD.type = 9
var_0_2.SC_23015_FIELD_LIST.SC_23015_IP_LOCATION_FIELD.cpp_type = 9
SC_23015.name = "sc_23015"
SC_23015.full_name = ".common.sc_23015"
SC_23015.nested_types = {}
SC_23015.enum_types = {}
SC_23015.fields = {
	var_0_2.SC_23015_FIELD_LIST.SC_23015_IP_LOCATION_FIELD
}
SC_23015.is_extendable = false
SC_23015.extensions = {}
cs_23012 = var_0_0.Message(CS_23012)
sc_23009 = var_0_0.Message(SC_23009)
sc_23013 = var_0_0.Message(SC_23013)
sc_23015 = var_0_0.Message(SC_23015)

return p23_pb
